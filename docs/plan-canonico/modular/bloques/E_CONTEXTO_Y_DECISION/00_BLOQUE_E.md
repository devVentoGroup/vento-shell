## BLOQUE E

**Contexto y decisión de autorización unificados**

CONTRATOS

### ✅ AUTH-CTX-001 — Diseñar AccessContext canónico

**Estado:** APROBADA  
**Bloque:** BLOQUE E — Contexto y decisión de autorización unificados  
**Naturaleza:** Diseño documental de contrato canónico  
**Implementación física:** No incluida  
**Bloque anterior vigente:** BLOQUE D — CERRADO DOCUMENTALMENTE  
**Tarea anterior vigente:** AUTH-RBAC-028 — APROBADA  
**Tarea posterior reservada:** AUTH-CTX-002 — Diseñar AuthorizationDecision canónica  
**Contrato diseñado:** `AccessContext`  
**Versión contractual:** Pendiente de AUTH-CTX-004  
**Fuentes contractuales vigentes:** catálogo y datasets canónicos de autorización `1.0.0`

Esta tarea diseña la forma, responsabilidad, límites e invariantes del
`AccessContext` canónico de Vento OS.

No implementa tipos TypeScript, funciones SQL, RPC, migraciones, RLS,
triggers, caché, compatibilidad legacy ni cambios físicos en Supabase.

---

#### 1. Objetivo

Definir un contrato único que permita resolver, de forma explícita y
auditable:

1. qué principal presentó la credencial;
2. quién es el actor efectivo;
3. qué identidad de dominio se está utilizando;
4. si existe una identidad laboral válida;
5. cuál es el rol base vigente;
6. cuál es la cobertura administrativa asignada;
7. si existe un turno operativo válido;
8. si existe una sesión de check-in válida;
9. cuál es el rol operativo efectivo;
10. cuáles son la sede y el área operativas;
11. si interviene un dispositivo compartido;
12. qué problemas estructurales impiden o limitan la evaluación.

El contrato deberá evitar que cada aplicación reconstruya su propia versión
de identidad, rol, sede, área, turno o check-in.

Flujo conceptual:

```text
PRINCIPAL AUTENTICADO
        ↓
RESOLUCIÓN DE IDENTIDAD DE DOMINIO
        ↓
RESOLUCIÓN DEL ACTOR EFECTIVO
        ↓
RESOLUCIÓN DE IDENTIDAD LABORAL
        ↓
RESOLUCIÓN DEL CARRIL BASE
        +
RESOLUCIÓN DEL CONTEXTO OPERATIVO
        +
RESOLUCIÓN DEL DISPOSITIVO
        ↓
ACCESS CONTEXT
```

---

#### 2. Decisión principal

`AccessContext` será un snapshot inmutable, resuelto en servidor y
referenciado por una evaluación de autorización.

Regla:

```text
AccessContext
=
hechos de identidad
+
hechos laborales
+
hechos territoriales
+
hechos operativos
+
hechos de dispositivo
+
problemas estructurales
```

No contiene la decisión final de autorización.

```text
AccessContext
≠ AuthorizationDecision
```

El contexto describe quién actúa y bajo qué condiciones.

La decisión posterior determina si una capacidad exacta puede ejecutarse
sobre un recurso exacto.

---

#### 3. Responsabilidad del contrato

`AccessContext` responde:

```text
¿Quién presentó la credencial?
¿A quién se atribuye la acción?
¿Qué identidad de dominio está activa?
¿Existe un empleado válido?
¿Qué rol base tiene?
¿Qué cobertura administrativa posee?
¿Existe un turno válido?
¿Existe check-in válido?
¿Qué rol operativo está activo?
¿En qué sede y área opera?
¿Qué dispositivo interviene?
¿Qué hechos estructurales son inválidos?
```

No responde:

```text
¿Puede ejecutar el permiso X?
¿El recurso Y está dentro del alcance?
¿Qué grant coincidió?
¿Qué deny coincidió?
¿Cuál fue la decisión final?
```

Esas respuestas pertenecen a `AuthorizationDecision`.

---

#### 4. Principios obligatorios

##### 4.1 Resolución exclusiva en servidor

Ningún campo autoritativo podrá aceptarse como verdad desde:

- query string;
- body de una mutación;
- parámetros de ruta;
- local storage;
- estado de React;
- cookie no firmada;
- selector visual;
- nombre de rol enviado por el cliente;
- sede o área seleccionada en el frontend.

El cliente podrá solicitar un contexto administrativo o enviar referencias
de navegación, pero el servidor deberá validarlas contra fuentes canónicas.

##### 4.2 Snapshot inmutable

Una vez resuelto:

- no se modifica internamente;
- no cambia de actor;
- no cambia de sede;
- no cambia de rol;
- no mezcla datos obtenidos en momentos distintos;
- no se reutiliza después de quedar obsoleto.

Una nueva realidad requiere un nuevo contexto.

##### 4.3 Sin autoridad implícita

Ningún elemento aislado concede permisos:

```text
principal
rol
sede asignada
turno
check-in
dispositivo
navegación
```

Todos son hechos de entrada para la evaluación posterior.

##### 4.4 Separación de carriles

El contrato separará de forma inequívoca:

```text
CARRIL BASE
→ rol base
→ cobertura administrativa

CARRIL OPERATIVO
→ turno
→ check-in
→ rol operativo
→ sede y área operativas
```

La ausencia de contexto operativo no invalida automáticamente el carril
base.

##### 4.5 Fail closed

Una contradicción, ambigüedad o fuente ausente que sea obligatoria deberá
producir un problema estructural.

No se aplicarán fallbacks silenciosos para convertir estados incompletos en
autoridad.

---

#### 5. Forma canónica de alto nivel

```ts
type AccessContext = {
  contract_name: "AccessContext";
  contract_version: string;
  context_id: string;
  resolved_at: string;

  principal: PrincipalContext;
  actor_effective: EffectiveActorContext;
  domain_identity: DomainIdentityContext | null;
  employee: EmployeeContext | null;

  base_role: BaseRoleContext | null;
  assigned_sites: AssignedSiteContext[];
  assigned_areas: AssignedAreaContext[];
  administrative_coverage: AdministrativeCoverageContext;

  active_shift: ActiveShiftContext | null;
  active_checkin_session: ActiveCheckinContext | null;
  operational_role: OperationalRoleContext | null;
  operational_site: OperationalSiteContext | null;
  operational_area: OperationalAreaContext | null;

  device_context: DeviceContext | null;

  lane_readiness: {
    base: LaneReadiness;
    operational: LaneReadiness;
  };

  structural_issues: StructuralIssue[];
  resolution_metadata: ResolutionMetadata;
};
```

La sintaxis anterior es documental.

No constituye todavía un tipo físico ni obliga a una tecnología de
implementación.

---

#### 6. Campos raíz

| Campo                     | Obligatorio | Regla                                                                      |
| ------------------------- | ----------: | -------------------------------------------------------------------------- |
| `contract_name`           |          Sí | Siempre `AccessContext`.                                                   |
| `contract_version`        |          Sí | Se congelará en AUTH-CTX-004.                                              |
| `context_id`              |          Sí | Identificador único de la resolución. No representa una sesión permanente. |
| `resolved_at`             |          Sí | Timestamp de servidor usado para evaluar vigencias.                        |
| `principal`               |          Sí | Principal autenticado o principal anónimo explícito.                       |
| `actor_effective`         |          Sí | Actor al que se atribuye la acción o estado no resuelto.                   |
| `domain_identity`         | Condicional | Identidad empresarial relevante para la aplicación o proceso.              |
| `employee`                | Condicional | Solo cuando la identidad laboral existe y es resoluble.                    |
| `base_role`               | Condicional | Rol base vigente del empleado.                                             |
| `assigned_sites`          |          Sí | Lista explícita; vacía cuando no existen asignaciones.                     |
| `assigned_areas`          |          Sí | Lista explícita; vacía cuando no existen asignaciones.                     |
| `administrative_coverage` |          Sí | Cobertura base resuelta, incluso cuando sea `NONE`.                        |
| `active_shift`            | Condicional | Turno publicado y vigente, o `null`.                                       |
| `active_checkin_session`  | Condicional | Check-in activo y compatible, o `null`.                                    |
| `operational_role`        | Condicional | Rol derivado del turno válido, nunca del rol base.                         |
| `operational_site`        | Condicional | Sede derivada del turno válido.                                            |
| `operational_area`        | Condicional | Área operativa válida cuando corresponda.                                  |
| `device_context`          | Condicional | Dispositivo compartido o contexto técnico involucrado.                     |
| `lane_readiness`          |          Sí | Disponibilidad estructural de cada carril; no es una decisión de permiso.  |
| `structural_issues`       |          Sí | Lista explícita, aunque esté vacía.                                        |
| `resolution_metadata`     |          Sí | Procedencia, versiones y evidencia técnica de resolución.                  |

---

#### 7. `principal`

El principal representa quién presentó la credencial técnica.

Tipos iniciales:

```text
HUMAN_USER
SHARED_DEVICE
SYSTEM_SERVICE
ANONYMOUS
```

Forma conceptual:

```ts
type PrincipalContext = {
  principal_type:
    | "HUMAN_USER"
    | "SHARED_DEVICE"
    | "SYSTEM_SERVICE"
    | "ANONYMOUS";

  auth_user_id: string | null;
  session_id: string | null;
  authenticated: boolean;
  authentication_method: string | null;
  authenticated_at: string | null;
  session_expires_at: string | null;
  principal_status: "VALID" | "INVALID" | "ANONYMOUS";
};
```

Reglas:

1. `auth_user_id` no equivale a empleado.
2. El principal no hereda permisos por existir.
3. Un dispositivo no se transforma en empleado.
4. Un servicio no se transforma en administrador.
5. Un principal anónimo queda representado explícitamente.
6. Una sesión expirada produce problema estructural.
7. Los claims del JWT se validan, pero no sustituyen relaciones
   empresariales vigentes.

---

#### 8. `actor_effective`

El actor efectivo representa a quién se atribuirá la acción.

Tipos iniciales:

```text
EMPLOYEE
CUSTOMER
SYSTEM
UNRESOLVED
```

Forma conceptual:

```ts
type EffectiveActorContext = {
  actor_type:
    | "EMPLOYEE"
    | "CUSTOMER"
    | "SYSTEM"
    | "UNRESOLVED";

  actor_id: string | null;
  attribution_source:
    | "PERSONAL_SESSION"
    | "DEVICE_ACTOR_SESSION"
    | "SYSTEM_PROCESS"
    | "DOMAIN_IDENTITY"
    | "NONE";

  delegation_id: string | null;
  resolved: boolean;
};
```

Reglas:

- una sesión humana personal atribuye al actor humano vinculado;
- un dispositivo compartido requiere una sesión de actor válida;
- un servicio actúa como sistema o mediante delegación explícita;
- no existe delegación implícita;
- el rol no es actor;
- la simulación no reemplaza al actor real;
- una mutación empresarial no podrá ejecutarse con actor `UNRESOLVED`.

---

#### 9. `domain_identity`

Una misma credencial puede vincularse con más de una identidad empresarial.

El contexto deberá declarar qué identidad se está usando para el dominio
solicitante.

Tipos iniciales:

```text
EMPLOYEE
CUSTOMER
DEVICE
SYSTEM
```

Forma conceptual:

```ts
type DomainIdentityContext = {
  identity_type: "EMPLOYEE" | "CUSTOMER" | "DEVICE" | "SYSTEM";
  identity_id: string;
  status: "ACTIVE" | "INACTIVE" | "INVALID";
  source: string;
};
```

Reglas:

1. identidad de cliente no concede acceso laboral;
2. identidad laboral no concede automáticamente capacidades de cliente;
3. identidad de dispositivo no concede capacidades empresariales humanas;
4. la aplicación debe declarar qué identidad acepta;
5. una identidad inactiva produce un problema estructural aplicable;
6. no se selecciona identidad únicamente por un claim de rol.

---

#### 10. `employee`

Forma conceptual:

```ts
type EmployeeContext = {
  employee_id: string;
  auth_user_id: string | null;
  is_active: boolean;
  employment_status: string;
  base_role_code: string | null;
};
```

Reglas:

```text
auth user válido
+
employee existente
+
employee activo
=
identidad laboral válida
```

Un empleado inactivo bloquea todas las capacidades laborales aunque
persistan:

- sedes;
- áreas;
- permisos;
- turnos;
- check-ins;
- sesiones de dispositivo;
- excepciones individuales.

El contexto no necesita exponer datos personales que no participen en la
autorización.

---

#### 11. Carril base

##### 11.1 `base_role`

Forma conceptual:

```ts
type BaseRoleContext = {
  role_code: string;
  role_status: "ACTIVE" | "INACTIVE" | "INVALID";
  assignment_source: string;
};
```

Reglas:

- exactamente un rol base vigente por empleado activo;
- no es identidad;
- no es rol operativo;
- no se obtiene del turno;
- no se obtiene del dispositivo;
- no se obtiene de `navigation_role`;
- no produce bypass por nombre;
- su ausencia no se reemplaza silenciosamente.

##### 11.2 `assigned_sites`

Cada asignación deberá representar una relación laboral real:

```ts
type AssignedSiteContext = {
  site_id: string;
  site_code: string;
  is_primary: boolean;
  assignment_active: boolean;
  site_active: boolean;
  assignable: boolean;
};
```

Reglas:

- una lista vacía no significa todas las sedes;
- varias sedes asignadas no significan alcance global;
- una sede primaria es referencia, no autorización;
- una sede seleccionada es preferencia, no autoridad;
- las asignaciones no conceden permisos.

##### 11.3 `assigned_areas`

Forma conceptual:

```ts
type AssignedAreaContext = {
  area_id: string;
  site_id: string;
  area_kind: string;
  is_primary_for_site: boolean;
  assignment_active: boolean;
  area_active: boolean;
};
```

Reglas:

- cada área pertenece a una sede exacta;
- área concreta y tipo de área son conceptos diferentes;
- una lista vacía no significa todas las áreas;
- una asignación de área no concede permisos;
- no se admite un área incompatible con la sede.

##### 11.4 `administrative_coverage`

Forma conceptual:

```ts
type AdministrativeCoverageContext = {
  mode:
    | "NONE"
    | "ASSIGNED_SITES"
    | "SPECIFIC_SITE"
    | "ASSIGNED_AREAS"
    | "SPECIFIC_AREA"
    | "ORGANIZATION";

  site_ids: string[];
  area_ids: string[];
  source: string;
  valid: boolean;
};
```

Reglas:

1. `ORGANIZATION` solo se produce mediante autoridad explícita;
2. `null` no significa organización;
3. el selector visual no amplía cobertura;
4. la cobertura administrativa no depende del turno;
5. la cobertura administrativa no desaparece con check-out;
6. el recurso deberá validarse posteriormente contra esta cobertura;
7. la cobertura no equivale a un allow de permiso.

---

#### 12. Carril operativo

##### 12.1 `active_shift`

Forma conceptual:

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

Reglas:

- el turno debe estar publicado;
- debe pertenecer al actor efectivo;
- debe estar vigente en `resolved_at`;
- la sede debe ser válida;
- el rol operativo debe ser permitido en la sede;
- el área debe ser compatible cuando se declare;
- el último turno no sirve como fallback;
- el perfil operativo predeterminado no sirve como fallback;
- el rol base no sirve como fallback.

##### 12.2 `active_checkin_session`

Forma conceptual:

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

Reglas:

- check-in es evidencia de presencia;
- no reemplaza el turno;
- no cambia la sede del turno;
- no concede permisos;
- no crea rol operativo;
- no concede autoridad administrativa;
- un check-in de otro actor es inválido;
- un check-in incompatible produce problema estructural;
- la ausencia de check-in solo afecta permisos que lo exigen.

##### 12.3 `operational_role`

Forma conceptual:

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

Fuente:

```text
turno válido
→ operational_role_code
→ rol operativo efectivo
```

No procede de:

- rol base;
- último turno;
- perfil predeterminado;
- `navigation_role`;
- selección del frontend;
- nombre del dispositivo.

##### 12.4 `operational_site`

Forma conceptual:

```ts
type OperationalSiteContext = {
  site_id: string;
  source_shift_id: string;
  site_active: boolean;
  assignment_valid: boolean;
};
```

Reglas:

- deriva del turno;
- check-in solo confirma;
- no es la sede seleccionada;
- no es la sede primaria;
- no implica autoridad sobre otros recursos de la sede;
- sin turno válido no existe sede operativa.

##### 12.5 `operational_area`

Forma conceptual:

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

Reglas:

- el área debe pertenecer a la sede operativa;
- el área no se obtiene únicamente del cliente;
- una selección visual no cambia el área efectiva;
- un área ambigua produce contexto operativo inválido;
- algunos permisos podrán no exigir área activa;
- esa condición pertenece al catálogo del permiso, no al contexto por sí
  solo.

---

#### 13. `device_context`

Forma conceptual:

```ts
type DeviceContext = {
  device_id: string;
  device_code: string;
  device_type: string;
  device_status: "ACTIVE" | "INACTIVE" | "INVALID";
  authenticated_as_device: boolean;
  actor_session_id: string | null;
  actor_session_expires_at: string | null;
  allowed_application_codes: string[];
  capability_package_code: string | null;
};
```

Reglas:

```text
autoridad del actor
∩
capacidades admitidas por dispositivo
=
capacidad evaluable
```

Nunca:

```text
autoridad del actor
∪
capacidades del dispositivo
```

El dispositivo:

- no tiene rol base;
- no tiene rol operativo propio;
- no tiene permisos empresariales propios;
- no sustituye al actor;
- no conserva autoridad después de cerrar la sesión del actor;
- no convierte `navigation_role` en permiso;
- puede impedir una operación;
- no puede ampliarla.

Sin sesión humana válida, un dispositivo compartido queda limitado a
operaciones técnicas expresamente autorizadas.

---

#### 14. `lane_readiness`

`lane_readiness` describe si existen hechos estructurales suficientes para
evaluar cada carril.

No describe si el permiso solicitado está concedido.

Valores:

```text
READY
UNAVAILABLE
INVALID
NOT_APPLICABLE
```

Forma conceptual:

```ts
type LaneReadiness = {
  status: "READY" | "UNAVAILABLE" | "INVALID" | "NOT_APPLICABLE";
  reason_codes: string[];
};
```

##### 14.1 Carril base

Puede estar `READY` cuando existen:

- actor laboral válido;
- empleado activo;
- rol base válido;
- configuración territorial suficiente para el tipo de evaluación.

No necesita:

- turno;
- check-in;
- rol operativo;
- sede operativa;
- área operativa.

##### 14.2 Carril operativo

Puede estar `READY` cuando existen, según corresponda:

- actor laboral válido;
- empleado activo;
- turno publicado y vigente;
- rol operativo válido;
- sede operativa válida;
- área operativa compatible;
- check-in válido cuando sea requerido por el contrato evaluado.

Como `AccessContext` todavía no recibe un permiso exacto, podrá distinguir:

```text
operational_core_ready
checkin_available
area_available
```

La decisión posterior determinará qué prerrequisitos exige el permiso.

---

#### 15. `structural_issues`

Una inconsistencia estructural se registra, no se oculta.

Forma conceptual:

```ts
type StructuralIssue = {
  issue_code: string;
  severity:
    | "BLOCKING_ALL"
    | "BLOCKING_BASE"
    | "BLOCKING_OPERATIONAL"
    | "WARNING"
    | "INFO";

  subject_type: string;
  subject_id: string | null;
  source: string;
  safe_message: string;
};
```

Categorías iniciales:

```text
AUTHENTICATION
PRINCIPAL
DOMAIN_IDENTITY
ACTOR_RESOLUTION
EMPLOYMENT
BASE_ROLE
SITE_ASSIGNMENT
AREA_ASSIGNMENT
ADMINISTRATIVE_COVERAGE
SHIFT
CHECKIN
OPERATIONAL_ROLE
OPERATIONAL_SITE
OPERATIONAL_AREA
DEVICE
CONFIGURATION
FRESHNESS
```

Ejemplos no congelados:

```text
unauthenticated
principal_inactive
employee_missing
employee_inactive
base_role_missing
site_configuration_ambiguous
area_configuration_ambiguous
active_shift_missing
active_shift_invalid
checkin_missing
checkin_expired
shift_checkin_mismatch
operational_role_invalid
operational_site_mismatch
operational_area_mismatch
device_inactive
device_actor_session_missing
context_stale
```

El catálogo definitivo de razones se detallará en AUTH-CTX-015.

---

#### 16. `resolution_metadata`

Forma conceptual:

```ts
type ResolutionMetadata = {
  resolver: string;
  resolver_version: string;
  authorization_contract_version: string;
  catalog_version: string;
  source_versions: Record<string, string>;
  source_fingerprints: Record<string, string>;
  cache_status: "MISS" | "HIT" | "BYPASS" | "NOT_IMPLEMENTED";
};
```

Reglas:

- no incluir secretos;
- no exponer internamente detalles sensibles al cliente;
- conservar evidencia suficiente para auditoría;
- permitir identificar con qué versiones se produjo el contexto;
- permitir invalidación posterior;
- no fijar aún TTL ni estrategia de caché.

La estrategia definitiva de caché corresponde a AUTH-CTX-029.

---

#### 17. Semántica de `null`, listas vacías y ausencia

Regla general:

```text
null
≠ global
```

##### `null`

Solo podrá significar:

- no aplicable;
- no resuelto;
- ausente;
- inválido.

La causa deberá ser deducible del estado o de `structural_issues`.

##### Lista vacía

```text
assigned_sites = []
→ ninguna sede asignada

assigned_areas = []
→ ninguna área asignada
```

Nunca significa todas.

##### Campo omitido

Los campos canónicos no deberán omitirse arbitrariamente.

Se utilizarán valores explícitos:

- `null`;
- lista vacía;
- estado;
- problema estructural.

Esto permite distinguir ausencia legítima de errores de serialización.

---

#### 18. Separación de conceptos territoriales

El contrato no utilizará propiedades ambiguas como:

```text
current_site
current_area
current_role
```

Deberá mantener separados:

```text
assigned_sites
administrative_coverage
operational_site
resource_site
```

Y:

```text
assigned_areas
administrative_coverage
operational_area
resource_area
```

`resource_site` y `resource_area` no pertenecen al `AccessContext` general.

Se resolverán en `AuthorizationDecision` para el recurso solicitado.

---

#### 19. Contexto administrativo solicitado

Una aplicación podrá solicitar trabajar visualmente sobre una sede o área
administrativa.

Ese dato:

- no se incorpora como hecho autoritativo sin validación;
- no cambia asignaciones;
- no cambia cobertura;
- no cambia el rol base;
- no cambia el recurso;
- no cambia la sede operativa;
- no cambia el área operativa.

La representación del selector administrativo podrá diseñarse en tareas
posteriores, pero la autorización siempre deberá usar cobertura y recurso
resueltos.

---

#### 20. Simulación

El `AccessContext` real no contiene:

- rol simulado;
- empleado simulado;
- sede simulada;
- área simulada;
- turno hipotético;
- resultado hipotético.

La simulación se diseñará como contrato separado en AUTH-CTX-003.

Regla:

```text
AccessContext real
≠ SimulationContext
```

Una simulación no modifica:

- actor real;
- JWT;
- RLS;
- contexto efectivo;
- auditoría de mutaciones.

---

#### 21. Relación con `AuthorizationDecision`

`AuthorizationDecision` recibirá o referenciará:

```text
AccessContext
+
app_code
+
permission_key
+
resource
+
catálogo
+
matrices
+
overrides
+
denegaciones
```

Y producirá:

```text
base_decision
operational_decision
matched_allows
matched_denies
blocked_reasons
final_decision
```

`AccessContext` no deberá almacenar:

- lista completa de permisos efectivos;
- decisión final;
- matched grants;
- matched denies;
- recursos consultados;
- resultados de una acción anterior.

Esto evita reutilizar una decisión sobre un recurso diferente.

---

#### 22. Casos canónicos

##### 22.1 Sesión personal administrativa sin turno

```text
principal = HUMAN_USER
actor_effective = EMPLOYEE
employee = ACTIVE
base_role = válido
active_shift = null
active_checkin_session = null
base readiness = READY
operational readiness = UNAVAILABLE
```

Resultado:

- el contexto es válido para evaluar carril base;
- la ausencia de turno no es un error global;
- no existe carril operativo disponible.

##### 22.2 Sesión personal con turno y check-in

```text
principal = HUMAN_USER
actor_effective = EMPLOYEE
base readiness = READY
active_shift = válido
active_checkin_session = válido
operational_role = válido
operational_site = válida
operational_area = válida o no aplicable
operational readiness = READY
```

Ambos carriles pueden evaluarse de forma independiente.

##### 22.3 Dispositivo compartido con actor

```text
principal = SHARED_DEVICE
device_context = ACTIVE
actor_session = ACTIVE
actor_effective = EMPLOYEE
employee = ACTIVE
shift = válido
```

Toda acción registra:

- principal dispositivo;
- actor empleado;
- sesión del actor;
- contexto operativo.

##### 22.4 Dispositivo compartido sin actor

```text
principal = SHARED_DEVICE
device_context = ACTIVE
actor_effective = UNRESOLVED
operational readiness = UNAVAILABLE
```

Solo se permiten operaciones técnicas explícitas.

##### 22.5 Empleado inactivo

```text
principal = HUMAN_USER
employee = INACTIVE
base readiness = INVALID
operational readiness = INVALID
structural issue = employee_inactive
```

Las asignaciones históricas no reactivan al empleado.

##### 22.6 Cliente sin identidad laboral

```text
domain_identity = CUSTOMER
employee = null
base readiness = NOT_APPLICABLE
operational readiness = NOT_APPLICABLE
```

Puede evaluarse en el dominio de cliente, pero no en aplicaciones laborales.

##### 22.7 Servicio del sistema

```text
principal = SYSTEM_SERVICE
actor_effective = SYSTEM
employee = null
```

Debe existir un proceso autorizado.

No se obtiene autoridad administrativa por usar `service_role`.

---

#### 23. Invariantes

1. Un principal autenticado no equivale a actor efectivo.
2. Un actor efectivo no equivale a rol.
3. Un empleado inactivo bloquea toda autoridad laboral.
4. Un dispositivo no es empleado.
5. Un servicio no es administrador.
6. El rol base no se deriva del turno.
7. El rol operativo no se deriva del rol base.
8. La sede seleccionada no concede autoridad.
9. La sede primaria no concede autoridad.
10. La sede asignada no concede permisos.
11. Varias sedes asignadas no equivalen a organización.
12. El check-in no reemplaza el turno.
13. El check-in no concede permisos.
14. El turno no concede permisos por sí solo.
15. La sede operativa deriva del turno.
16. El área operativa debe pertenecer a la sede operativa.
17. `null` no significa global.
18. Una lista vacía significa ninguna asignación.
19. La ausencia de turno no invalida el carril base.
20. El check-out no revoca autoridad base.
21. Los problemas estructurales no se corrigen mediante fallback visual.
22. El contexto no contiene la decisión final.
23. El contexto no contiene simulación.
24. El contexto no acepta hechos autoritativos del cliente.
25. El contexto debe poder ser auditado y versionado.

---

#### 24. Antipatrones prohibidos

```ts
const role = request.body.role;
const site = request.body.siteId;
const area = localStorage.getItem("activeArea");
const actor = auth.uid();
const canOperate = Boolean(checkin);
const canAdmin = employee.role === "propietario";
```

También queda prohibido:

```text
navigation_role → rol efectivo
employees.site_id → sede autorizada universal
selected_site_id → sede del recurso
último turno → turno activo
default_operational_role → rol operativo activo
dispositivo activo → actor humano
check-in activo → permiso
service_role → bypass empresarial
```

---

#### 25. Límites de tamaño y exposición

El contrato debe ser suficiente para decidir, pero no convertirse en un
volcado de la base.

No incluirá por defecto:

- datos personales no necesarios;
- documentos de identidad;
- teléfonos;
- direcciones;
- salarios;
- listas completas de permisos;
- historial de turnos;
- historial de check-ins;
- historial de asignaciones;
- sesiones ajenas;
- secretos del dispositivo;
- detalles internos de seguridad.

Las aplicaciones recibirán una proyección segura del contexto.

La versión completa para servidor y la proyección pública podrán ser
contratos relacionados, pero no se diseñan físicamente en esta tarea.

---

#### 26. Estrategia de resolución conceptual

```text
1. Validar sesión técnica.
2. Clasificar principal.
3. Resolver identidad de dominio.
4. Resolver actor efectivo.
5. Resolver empleado cuando corresponda.
6. Validar estado laboral.
7. Resolver rol base.
8. Resolver sedes asignadas.
9. Resolver áreas asignadas.
10. Resolver cobertura administrativa.
11. Resolver turno vigente.
12. Resolver check-in.
13. Resolver rol operativo.
14. Resolver sede operativa.
15. Resolver área operativa.
16. Resolver dispositivo.
17. Detectar contradicciones.
18. Calcular readiness por carril.
19. Registrar metadatos.
20. Emitir snapshot inmutable.
```

Este orden es conceptual.

El contrato SQL se definirá en AUTH-CTX-025.

---

#### 27. Vigencia y obsolescencia

Un contexto queda potencialmente obsoleto cuando cambia:

- sesión autenticada;
- actor de dispositivo;
- estado del empleado;
- rol base;
- asignación de sede;
- asignación de área;
- turno;
- check-in;
- rol operativo;
- sede o área operativas;
- estado del dispositivo;
- catálogo;
- matrices;
- override;
- denegación.

Esta tarea no define aún:

- TTL;
- claves de caché;
- canales de invalidación;
- estrategia Realtime;
- eventos;
- consistencia eventual.

Esos elementos corresponden a AUTH-CTX-029.

---

#### 28. Errores estructurales y decisión posterior

Un problema estructural podrá:

```text
bloquear todo
bloquear solo carril base
bloquear solo carril operativo
advertir sin bloquear
```

Ejemplos:

```text
employee_inactive
→ BLOCKING_ALL para aplicaciones laborales

base_role_missing
→ BLOCKING_BASE

active_shift_missing
→ no bloquea base
→ operational UNAVAILABLE

shift_checkin_mismatch
→ BLOCKING_OPERATIONAL

selected_site_invalid
→ WARNING
→ no cambia autorización
```

La severidad definitiva de cada código se consolidará en AUTH-CTX-015.

---

#### 29. Pruebas contractuales mínimas futuras

El contrato deberá permitir probar:

1. usuario humano con empleado activo;
2. usuario humano sin empleado;
3. empleado inactivo;
4. cliente también empleado;
5. dispositivo activo con actor;
6. dispositivo activo sin actor;
7. dispositivo inactivo;
8. servicio autorizado;
9. servicio sin proceso permitido;
10. empleado base sin turno;
11. empleado con turno sin check-in;
12. empleado con turno y check-in;
13. check-in de otro actor;
14. check-in de otra sede;
15. área fuera de la sede;
16. rol operativo no permitido en la sede;
17. múltiples sedes asignadas;
18. sede primaria ambigua;
19. ausencia de asignaciones;
20. cambio de contexto que invalida snapshot anterior.

El plan completo de pruebas se definirá en AUTH-CTX-030.

---

#### 30. Relación con tareas posteriores

##### AUTH-CTX-002

Diseñará `AuthorizationDecision`.

No modificará la responsabilidad del `AccessContext`.

##### AUTH-CTX-003

Diseñará `SimulationContext` separado.

##### AUTH-CTX-004

Congelará:

- versión;
- compatibilidad;
- política de evolución;
- serialización.

##### AUTH-CTX-005 a AUTH-CTX-015

Desarrollarán en detalle cada nodo aprobado:

```text
principal
actor_effective
domain_identity
employee
base_role
assigned_sites
assigned_areas
active_shift
active_checkin_session
operational_role
operational_site
operational_area
device_context
structural_issues
```

Estas tareas podrán precisar campos y catálogos, pero no deberán romper las
invariantes aprobadas en AUTH-CTX-001.

##### AUTH-CTX-025

Diseñará el contrato SQL futuro de `get_access_context`.

##### AUTH-CTX-028

Definirá compatibilidad temporal con `get_operational_context`.

##### AUTH-CTX-029

Definirá caché e invalidación.

##### BLOQUE E3

Aprobará fuentes físicas, esquemas, tablas y relaciones objetivo.

##### BLOQUE R

Implementará físicamente el contrato mediante migraciones versionadas.

---

#### 31. Fuera del alcance

AUTH-CTX-001 no:

- define `AuthorizationDecision`;
- define simulación;
- congela versión final;
- crea TypeScript;
- crea Zod;
- crea JSON Schema;
- crea funciones SQL;
- crea RPC;
- modifica `get_operational_context`;
- crea tablas;
- modifica Supabase;
- modifica RLS;
- modifica grants;
- crea caché;
- implementa invalidación;
- adapta aplicaciones;
- crea UI;
- migra consumidores;
- publica paquetes.

---

#### 32. Riesgos controlados

##### Riesgo 1 — Contexto único ambiguo

Control:

```text
base_role
≠ operational_role

administrative_coverage
≠ operational_site
```

##### Riesgo 2 — Check-in como autorización

Control:

```text
check-in
→ evidencia contextual
→ no grant
```

##### Riesgo 3 — Dispositivo como empleado

Control:

```text
principal dispositivo
+
actor humano separado
```

##### Riesgo 4 — Selección visual como autoridad

Control:

```text
requested/selected
→ validar
→ nunca ampliar
```

##### Riesgo 5 — Falta de turno bloquea administración

Control:

```text
base readiness
≠ operational readiness
```

##### Riesgo 6 — Contexto reutilizado sobre recursos diferentes

Control:

```text
AccessContext
→ hechos del actor

AuthorizationDecision
→ permiso y recurso exactos
```

##### Riesgo 7 — `null` como alcance global

Control:

```text
null
≠ organization
```

##### Riesgo 8 — Simulación mezclada con autorización real

Control:

```text
SimulationContext separado
```

##### Riesgo 9 — Exceso de información

Control:

- minimización;
- proyecciones seguras;
- sin historiales;
- sin listas completas de permisos.

---

#### 33. Criterios de aprobación

AUTH-CTX-001 podrá aprobarse cuando se acepte que:

1. `AccessContext` es un snapshot inmutable resuelto en servidor;
2. separa principal y actor efectivo;
3. separa identidad de dominio e identidad laboral;
4. separa rol base y rol operativo;
5. separa cobertura administrativa y contexto operativo;
6. incluye turno y check-in como hechos distintos;
7. la sede operativa deriva del turno;
8. el check-in no reemplaza el turno;
9. el check-in no concede permisos;
10. el dispositivo no concede autoridad;
11. la ausencia de turno no invalida el carril base;
12. `null` no significa global;
13. listas vacías significan ausencia de asignaciones;
14. el contrato no contiene decisiones de permiso;
15. el contrato no contiene recursos solicitados;
16. el contrato no contiene simulación;
17. los problemas estructurales quedan explícitos;
18. la disponibilidad de carriles no equivale a allow;
19. el cliente no suministra hechos autoritativos;
20. la versión se reserva para AUTH-CTX-004;
21. los detalles de nodos se desarrollarán en AUTH-CTX-005 a AUTH-CTX-015;
22. el contrato SQL se reserva para AUTH-CTX-025;
23. la compatibilidad legacy se reserva para AUTH-CTX-028;
24. caché e invalidación se reservan para AUTH-CTX-029;
25. la implementación física se reserva para BLOQUE R.

---

#### 34. Estado final de la propuesta

| Tarea         | Estado      |
| ------------- | ----------- |
| AUTH-RBAC-028 | APROBADA    |
| AUTH-CTX-001  | APROBADA    |
| AUTH-CTX-002  | NO INICIADA |

No se avanza a AUTH-CTX-002 hasta recibir aprobación explícita de
AUTH-CTX-001.


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


### ✅ AUTH-CTX-003 — Diseñar SimulationContext separado

**Estado:** APROBADA 
**Bloque:** BLOQUE E — Contexto y decisión de autorización unificados  
**Naturaleza:** Diseño documental de contrato canónico  
**Implementación física:** No incluida  
**Tarea anterior vigente:** AUTH-CTX-002 — APROBADA  
**Tarea posterior reservada:** AUTH-CTX-004 — Versionar los contratos de respuesta  
**Contrato diseñado:** `SimulationContext`  
**Contratos relacionados:** `AccessContext` y `AuthorizationDecision`  
**Versión contractual:** Pendiente de AUTH-CTX-004  
**Resultado real permitido:** Ninguna mutación ni autorización reutilizable

Esta tarea diseña un contrato independiente para simular identidades,
roles, cobertura, contexto operativo, dispositivos y decisiones de
autorización sin modificar la identidad real, la sesión técnica, RLS, los
datos empresariales ni las decisiones reales.

No implementa cookies de override, impersonación, funciones SQL, RPC,
migraciones, RLS, triggers, caché, UI, almacenamiento de sesiones ni cambios
físicos en Supabase.

---

#### 1. Objetivo

Permitir que un actor real expresamente autorizado pueda responder
preguntas hipotéticas como:

```text
¿Qué vería este rol?
¿Qué permisos tendría este trabajador en esta sede?
¿Qué ocurriría si estuviera en este turno?
¿Qué capacidades admitiría este dispositivo?
¿Por qué una operación sería permitida o denegada?
¿Qué cambiaría si una asignación o permiso se modificara?
```

sin convertir la simulación en:

- una sesión real;
- una identidad real;
- un rol real;
- un permiso real;
- un turno real;
- un check-in real;
- un bypass de RLS;
- una vía para ejecutar mutaciones;
- una forma de consultar datos que el actor real no puede conocer.

---

#### 2. Decisión principal

`SimulationContext` será un contrato distinto de `AccessContext` y
`AuthorizationDecision`.

Regla:

```text
AccessContext
→ describe al actor real y su contexto efectivo

AuthorizationDecision
→ autoriza o deniega una solicitud real

SimulationContext
→ describe un escenario hipotético
→ produce would_allow, would_deny o indeterminate
→ nunca produce autoridad ejecutable
```

Separación obligatoria:

```text
SimulationContext
≠ AccessContext

SimulatedAuthorizationDecision
≠ AuthorizationDecision
```

Ningún consumidor podrá aceptar un `SimulationContext` donde espera un
`AccessContext` real.

Ningún consumidor podrá aceptar un resultado `WOULD_ALLOW` donde espera un
`ALLOW` real.

---

#### 3. Principio de doble identidad

Toda simulación conserva dos planos:

```text
PLANO REAL
→ quién inició y controla la simulación

PLANO HIPOTÉTICO
→ qué sujeto y contexto se están evaluando
```

Forma conceptual:

```text
real_actor
≠ simulated_subject
```

El actor real:

- permanece autenticado;
- conserva su `auth.uid()` real;
- conserva su identidad laboral real;
- conserva su auditoría real;
- determina si puede iniciar, consultar o finalizar la simulación.

El sujeto simulado:

- no inicia sesión;
- no reemplaza al actor real;
- no recibe tokens;
- no modifica RLS;
- no firma mutaciones;
- no se atribuye acciones empresariales;
- no puede elevar los permisos del actor real.

---

#### 4. Forma canónica de alto nivel

```ts
type SimulationContext = {
  contract_name: "SimulationContext";
  contract_version: string;

  simulation_id: string;
  status: SimulationStatus;
  purpose: SimulationPurpose;

  created_at: string;
  activated_at: string | null;
  expires_at: string;
  completed_at: string | null;
  revoked_at: string | null;

  real_actor: RealSimulationActor;
  real_access_context_ref: AccessContextReference;
  simulation_authorization: SimulationAuthorization;

  simulated_subject: SimulatedSubject;
  hypothetical_context: HypotheticalAccessContext;
  resource_scenario: SimulationResourceScenario | null;

  evaluations: SimulatedAuthorizationDecision[];
  would_allow: SimulationResultReference[];
  would_deny: SimulationResultReference[];
  indeterminate: SimulationResultReference[];

  structural_issues: SimulationIssue[];
  audit: SimulationAuditContext;
};
```

La sintaxis anterior es documental.

No constituye todavía un tipo TypeScript, JSON Schema, tabla o respuesta
RPC física.

---

#### 5. Estados de la simulación

```ts
type SimulationStatus =
  | "DRAFT"
  | "ACTIVE"
  | "COMPLETED"
  | "EXPIRED"
  | "REVOKED"
  | "INVALID";
```

| Estado      | Significado                                                   |
| ----------- | ------------------------------------------------------------- |
| `DRAFT`     | Escenario todavía no activado ni evaluable.                   |
| `ACTIVE`    | Escenario vigente y autorizado para evaluación hipotética.    |
| `COMPLETED` | Escenario cerrado normalmente.                                |
| `EXPIRED`   | Superó `expires_at`; no puede seguir evaluándose.             |
| `REVOKED`   | El actor real o el sistema lo cerró anticipadamente.          |
| `INVALID`   | El contrato, el actor real o el escenario son inconsistentes. |

Reglas:

1. solo `ACTIVE` puede producir nuevas evaluaciones;
2. un escenario expirado no se reactiva silenciosamente;
3. una nueva simulación requiere un nuevo `simulation_id`;
4. cambiar el sujeto o el contexto produce una nueva revisión o simulación;
5. un resultado anterior conserva el snapshot con el que fue calculado;
6. la expiración no modifica datos reales.

---

#### 6. Propósito de simulación

```ts
type SimulationPurpose =
  | "NAVIGATION_PREVIEW"
  | "AUTHORIZATION_EXPLANATION"
  | "ROLE_MATRIX_REVIEW"
  | "TERRITORIAL_SCENARIO"
  | "OPERATIONAL_CONTEXT_SCENARIO"
  | "DEVICE_SCENARIO"
  | "CHANGE_IMPACT_REVIEW"
  | "SUPPORT_DIAGNOSTIC";
```

##### `NAVIGATION_PREVIEW`

Permite observar una proyección hipotética de navegación.

No autoriza abrir rutas o ejecutar acciones reales.

##### `AUTHORIZATION_EXPLANATION`

Explica por qué una solicitud hipotética produciría:

- `WOULD_ALLOW`;
- `WOULD_DENY`;
- `INDETERMINATE`.

##### `ROLE_MATRIX_REVIEW`

Evalúa un rol o combinación de roles contra permisos y alcances
contractuales.

##### `TERRITORIAL_SCENARIO`

Evalúa cobertura hipotética por organización, sede, área o tipo
territorial.

##### `OPERATIONAL_CONTEXT_SCENARIO`

Evalúa turno, check-in, rol operativo, sede y área hipotéticos.

##### `DEVICE_SCENARIO`

Evalúa la intersección entre autoridad hipotética del actor y capacidades
admitidas por un dispositivo.

##### `CHANGE_IMPACT_REVIEW`

Permite comparar el estado contractual vigente con un cambio propuesto que
todavía no ha sido publicado.

##### `SUPPORT_DIAGNOSTIC`

Permite reproducir de forma segura un problema de acceso sin asumir la
identidad del trabajador afectado.

El propósito deberá registrarse y limitar los datos disponibles.

---

#### 7. Actor real

Forma conceptual:

```ts
type RealSimulationActor = {
  actor_type: "EMPLOYEE" | "SYSTEM";
  actor_id: string;
  principal_id: string;
  employee_id: string | null;

  authenticated: boolean;
  active: boolean;

  simulation_permission_key: string;
  authorization_decision_id: string;
};
```

Reglas:

1. la simulación solo puede iniciarse desde una identidad real válida;
2. el actor real debe superar una `AuthorizationDecision` real;
3. la autorización para simular no se infiere por nombre de rol;
4. ser propietario o gerente general no crea bypass;
5. un dispositivo compartido no inicia una simulación por sí solo;
6. un servicio solo puede simular mediante proceso técnico explícito;
7. un actor inactivo no puede crear ni continuar simulaciones;
8. revocar la autoridad real invalida nuevas evaluaciones del escenario.

La clave concreta de permiso se toma del catálogo canónico vigente.

Esta tarea no inventa ni publica una nueva clave.

---

#### 8. Autorización para simular

Forma conceptual:

```ts
type SimulationAuthorization = {
  decision_id: string;
  outcome: "ALLOW" | "DENY";

  permitted_purposes: SimulationPurpose[];
  permitted_subject_types: SimulatedSubjectType[];
  permitted_app_codes: string[];

  may_reference_real_subjects: boolean;
  may_reference_real_resources: boolean;
  may_view_sensitive_explanations: boolean;

  expires_at: string;
};
```

Reglas:

- `outcome = DENY` impide crear o continuar la simulación;
- la autorización real no se reutiliza después de expirar;
- poder simular navegación no implica poder simular datos sensibles;
- poder simular un rol no implica poder consultar trabajadores reales;
- poder simular una aplicación no implica acceso a todas las aplicaciones;
- la simulación no puede ampliar el alcance real de consulta del actor;
- las restricciones del permiso real prevalecen sobre el escenario
  hipotético.

---

#### 9. Sujeto simulado

Tipos iniciales:

```ts
type SimulatedSubjectType =
  | "EXISTING_EMPLOYEE_REFERENCE"
  | "BASE_ROLE_TEMPLATE"
  | "OPERATIONAL_ROLE_TEMPLATE"
  | "HYPOTHETICAL_EMPLOYEE"
  | "COMPOSITE_SCENARIO";
```

Forma conceptual:

```ts
type SimulatedSubject = {
  subject_type: SimulatedSubjectType;
  simulated_subject_id: string;

  real_employee_id: string | null;
  display_reference: string | null;

  base_role_code: string | null;
  operational_role_code: string | null;

  source:
    | "MASKED_REAL_REFERENCE"
    | "CANONICAL_ROLE_TEMPLATE"
    | "SYNTHETIC"
    | "PROPOSED_CHANGESET";

  contains_real_personal_data: boolean;
};
```

##### `EXISTING_EMPLOYEE_REFERENCE`

Utiliza una referencia real únicamente cuando el actor real está
autorizado a consultar a ese trabajador.

La referencia deberá minimizarse o enmascararse.

##### `BASE_ROLE_TEMPLATE`

Simula un rol base canónico sin representar a una persona real.

##### `OPERATIONAL_ROLE_TEMPLATE`

Simula una función operativa canónica dentro de un escenario territorial y
temporal explícito.

##### `HYPOTHETICAL_EMPLOYEE`

Representa una identidad sintética sin registro laboral real.

##### `COMPOSITE_SCENARIO`

Permite construir una combinación hipotética controlada de:

- rol base;
- asignaciones;
- turno;
- check-in;
- rol operativo;
- dispositivo;
- overrides propuestos.

Reglas:

1. un rol no es una identidad;
2. una plantilla no se presenta como trabajador real;
3. un sujeto sintético no recibe UUID real de empleado;
4. una referencia real no expone datos personales innecesarios;
5. un empleado inactivo puede analizarse históricamente, pero no se
   presenta como contexto laboral real válido;
6. el sujeto simulado nunca sustituye al actor real en auditoría.

---

#### 10. Contexto hipotético

`HypotheticalAccessContext` reutiliza la semántica de `AccessContext`, pero
no su identidad contractual.

Forma conceptual:

```ts
type HypotheticalAccessContext = {
  hypothetical_context_id: string;
  access_context_contract_version: string;

  domain_identity: HypotheticalValue | null;
  employee: HypotheticalValue | null;

  base_role: HypotheticalValue | null;
  assigned_sites: HypotheticalValue[];
  assigned_areas: HypotheticalValue[];
  administrative_coverage: HypotheticalValue;

  active_shift: HypotheticalValue | null;
  active_checkin_session: HypotheticalValue | null;
  operational_role: HypotheticalValue | null;
  operational_site: HypotheticalValue | null;
  operational_area: HypotheticalValue | null;

  device_context: HypotheticalValue | null;
  structural_issues: SimulationIssue[];
};
```

Regla:

```text
HypotheticalAccessContext
→ forma compatible para razonamiento

HypotheticalAccessContext
≠ AccessContext real
```

No podrá enviarse directamente a `evaluate_authorization` real.

---

#### 11. Procedencia de valores hipotéticos

Cada valor deberá declarar procedencia.

```ts
type HypotheticalValue<T = unknown> = {
  value: T;
  provenance:
    | "CANONICAL_REAL_SNAPSHOT"
    | "MASKED_REAL_SNAPSHOT"
    | "SYNTHETIC"
    | "ROLE_TEMPLATE"
    | "PROPOSED_OVERRIDE"
    | "PROPOSED_ASSIGNMENT"
    | "PROPOSED_DENIAL"
    | "USER_SELECTED_SCENARIO";

  source_id: string | null;
  verified: boolean;
};
```

Reglas:

1. ningún valor seleccionado por UI se transforma en dato real;
2. un valor sintético se identifica siempre como sintético;
3. un valor propuesto no modifica el catálogo o dataset vigente;
4. los snapshots reales se limitan al alcance real del actor;
5. no se mezclan valores de versiones contractuales incompatibles;
6. la procedencia participa en auditoría;
7. un valor no verificable puede producir `INDETERMINATE`.

---

#### 12. Simulación de identidad laboral

El escenario podrá evaluar:

- empleado activo;
- empleado inactivo;
- identidad laboral ausente;
- rol base ausente;
- múltiples asignaciones;
- cobertura organizacional;
- cobertura por sede;
- cobertura por área;
- asignaciones ambiguas;
- overrides propuestos;
- denegaciones propuestas.

La simulación de empleado activo no activa ningún registro real.

La simulación de un empleado inactivo no modifica su estado.

La simulación de una asignación no crea `employee_sites` o relaciones
equivalentes.

---

#### 13. Simulación de contexto operativo

El escenario podrá declarar hipotéticamente:

- turno publicado;
- ventana temporal;
- check-in presente o ausente;
- rol operativo;
- sede operativa;
- área operativa;
- sesión de dispositivo;
- recurso relacionado.

Reglas:

1. el turno simulado no aparece en ANIMA;
2. el check-in simulado no registra presencia;
3. el rol operativo simulado no cambia el perfil del empleado;
4. la sede y área simuladas no cambian preferencias;
5. no se generan eventos;
6. no se crean sesiones de actor;
7. no se altera el contexto real;
8. un escenario contradictorio produce `INDETERMINATE` o `WOULD_DENY`,
   nunca `WOULD_ALLOW`.

---

#### 14. Escenario de recurso

Forma conceptual:

```ts
type SimulationResourceScenario = {
  mode:
    | "SYNTHETIC_RESOURCE"
    | "MASKED_REAL_RESOURCE"
    | "AUTHORIZED_REAL_REFERENCE"
    | "RESOURCE_DRAFT"
    | "UNRESOLVED";

  resource_type: string;
  resource_reference_id: string | null;
  synthetic_resource_id: string | null;

  territory: HypotheticalValue;
  state: HypotheticalValue;
  ownership: HypotheticalValue;
  required_sides: HypotheticalValue[];

  sensitive_fields_present: boolean;
};
```

##### `SYNTHETIC_RESOURCE`

Recurso completamente ficticio.

##### `MASKED_REAL_RESOURCE`

Snapshot real con identificadores y campos sensibles enmascarados.

##### `AUTHORIZED_REAL_REFERENCE`

Referencia real permitida únicamente cuando el actor real posee autoridad
independiente para conocerla.

##### `RESOURCE_DRAFT`

Borrador hipotético normalizado.

##### `UNRESOLVED`

No existe información suficiente.

Resultado esperado:

```text
UNRESOLVED
→ INDETERMINATE
```

No se utiliza sede seleccionada o primaria como fallback.

---

#### 15. Límite de acceso a datos reales

La autoridad hipotética del sujeto simulado nunca amplía la visibilidad
real del actor que ejecuta la simulación.

Regla:

```text
DATOS REALES VISIBLES EN SIMULACIÓN
=
datos que el actor real puede consultar
∩
datos necesarios para el propósito
∩
proyección segura
```

Nunca:

```text
permisos hipotéticos del sujeto
→ acceso real a datos ocultos
```

Ejemplo:

```text
actor real no puede consultar salarios
+
sujeto simulado tendría permiso salarial
=
no mostrar salarios reales
```

La simulación podrá indicar conceptualmente que el permiso existiría sin
revelar valores reales.

---

#### 16. Evaluación simulada

Forma conceptual:

```ts
type SimulatedAuthorizationDecision = {
  simulated_decision_id: string;
  evaluated_at: string;

  simulation_id: string;
  hypothetical_context_id: string;

  app_code: string;
  permission_key: string;
  resource_scenario_id: string | null;

  authorization_requirement: string | null;

  base_result: SimulatedLaneResult;
  operational_result: SimulatedLaneResult;

  matched_hypothetical_allows: SimulationMatch[];
  matched_hypothetical_denies: SimulationMatch[];

  blocked_reasons: SimulationIssue[];

  final_result:
    | "WOULD_ALLOW"
    | "WOULD_DENY"
    | "INDETERMINATE";

  confidence:
    | "CONTRACT_COMPLETE"
    | "PARTIAL_INPUT"
    | "MASKED_INPUT"
    | "VERSION_MISMATCH";
};
```

La evaluación simulada:

- puede reutilizar las reglas conceptuales reales;
- no reutiliza el tipo de respuesta real;
- no produce un `decision_id` ejecutable;
- no se almacena como grant;
- no se consume en RLS;
- no autoriza RPC;
- no ejecuta operaciones.

---

#### 17. Resultados simulados

##### 17.1 `WOULD_ALLOW`

Solo procede cuando:

- el escenario está completo;
- las versiones son compatibles;
- el permiso existe;
- el recurso está suficientemente resuelto;
- los carriles aplicables se satisfacen;
- no existe deny hipotético aplicable;
- no existe contradicción estructural;
- el permiso admite simulación.

Significa:

```text
BAJO ESTOS HECHOS HIPOTÉTICOS
LA REGLA CONTRACTUAL PRODUCIRÍA ALLOW
```

No significa:

```text
EL ACTOR REAL PUEDE EJECUTAR
```

##### 17.2 `WOULD_DENY`

Procede cuando el escenario completo demuestra una causa de denegación.

Ejemplos:

- permiso ausente;
- modalidad incompatible;
- turno requerido ausente;
- check-in requerido ausente;
- territorio fuera de alcance;
- deny hipotético aplicable;
- dispositivo incompatible;
- estado de recurso inválido.

##### 17.3 `INDETERMINATE`

Procede cuando falta información necesaria o no puede evaluarse con
seguridad.

Ejemplos:

- recurso no resuelto;
- campo enmascarado indispensable;
- versión contractual incompatible;
- ambigüedad territorial;
- escenario contradictorio;
- permiso no simulable;
- dependencia sin información;
- estado empresarial no disponible.

Regla:

```text
INDETERMINATE
≠ WOULD_ALLOW
```

---

#### 18. Resultados raíz

Los campos esperados se conservan:

```ts
would_allow: SimulationResultReference[];
would_deny: SimulationResultReference[];
indeterminate: SimulationResultReference[];
```

Forma conceptual:

```ts
type SimulationResultReference = {
  simulated_decision_id: string;
  app_code: string;
  permission_key: string;
  resource_scenario_id: string | null;
  primary_reason_code: string;
};
```

Cada evaluación debe aparecer en exactamente una colección.

Invariante:

```text
evaluations
=
would_allow
+
would_deny
+
indeterminate
```

sin duplicados.

---

#### 19. Compatibilidad con modalidades

La simulación conserva las modalidades reales:

##### `BASE_ONLY`

Solo evalúa el escenario base.

##### `OPERATIONAL_ONLY`

Solo evalúa el escenario operativo.

##### `BASE_OR_OPERATIONAL`

Puede producir `WOULD_ALLOW` cuando cualquiera de los carriles completos
autorizaría.

##### `BASE_AND_OPERATIONAL`

Solo produce `WOULD_ALLOW` cuando ambos carriles completos autorizarían para:

- el mismo sujeto simulado;
- el mismo permiso;
- el mismo recurso;
- la misma solicitud;
- la misma versión contractual.

No se mezclan componentes de sujetos simulados distintos.

---

#### 20. Allows y denegaciones hipotéticos

La simulación podrá evaluar:

- matrices vigentes;
- grants individuales vigentes permitidos para análisis;
- overrides propuestos;
- denegaciones vigentes permitidas para análisis;
- denegaciones propuestas;
- cambios de matriz todavía no publicados.

Toda fila deberá declarar:

```text
VIGENTE
PROPUESTA
SINTÉTICA
```

Una propuesta no modifica el dataset real.

La precedencia hipotética conserva:

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

Una propuesta de allow no supera un deny hipotético aplicable.

---

#### 21. Dispositivo simulado

Un escenario de dispositivo puede definir:

- tipo de terminal;
- sede fija;
- área fija;
- paquete de capacidades;
- aplicaciones admitidas;
- sesión de actor presente o ausente;
- estado activo o inactivo.

Regla:

```text
autoridad hipotética del sujeto
∩
capacidades hipotéticas del dispositivo
=
capacidad simulable
```

El dispositivo no crea grants hipotéticos.

Un dispositivo activo sin actor hipotético puede producir únicamente
capacidades técnicas simuladas.

---

#### 22. Navegación simulada

La UI podrá mostrar una vista hipotética de:

- aplicaciones;
- módulos;
- pantallas;
- acciones visibles;
- razones de ocultamiento;
- requisitos pendientes.

Debe mostrar de forma persistente y visible:

```text
MODO SIMULACIÓN
SIN EFECTOS REALES
ACTOR REAL: <referencia segura>
SUJETO SIMULADO: <referencia segura>
EXPIRA: <timestamp>
```

En modo simulación:

- las acciones mutadoras estarán deshabilitadas;
- las URLs reales no adquieren permisos;
- abrir una ruta obliga a mantener la frontera simulada;
- salir de la simulación restaura el contexto real;
- una pestaña antigua no puede ejecutar usando el escenario expirado.

---

#### 23. Mutaciones prohibidas

Una simulación no podrá:

- crear;
- editar;
- eliminar;
- aprobar;
- cancelar;
- reversar;
- despachar;
- recibir;
- mover inventario;
- producir;
- registrar check-in;
- publicar turnos;
- modificar permisos;
- asignar roles;
- cambiar estados empresariales;
- emitir eventos;
- imprimir documentos operativos reales;
- disparar automatizaciones;
- reservar recursos;
- consumir stock;
- escribir auditoría empresarial como si fuera el sujeto simulado.

Regla:

```text
simulation_context presente
+
solicitud mutadora
→ DENY
```

Razón conceptual:

```text
simulation_mutation_prohibited
```

El actor real deberá cerrar la simulación y realizar una evaluación real
independiente para ejecutar una acción permitida.

---

#### 24. RLS y base de datos

La simulación no modifica:

- `auth.uid()`;
- JWT;
- claims;
- `SET ROLE`;
- RLS;
- grants;
- políticas;
- sesión de Supabase;
- tenant;
- identidad laboral;
- actor efectivo real.

No se permitirá implementar simulación mediante:

```text
cookie role_override
→ rol real

query string simulated_role
→ bypass

claim temporal
→ autoridad

service_role
→ leer todo y filtrar en cliente
```

La simulación deberá resolverse en una frontera explícita separada.

---

#### 25. Cookies y estado del cliente

Una cookie podrá, en una implementación futura, transportar únicamente una
referencia opaca y firmada a una sesión de simulación.

No podrá transportar autoritativamente:

- rol;
- empleado;
- sede;
- área;
- permisos;
- grants;
- turno;
- check-in;
- resultado.

Regla:

```text
simulation_session_reference
→ localizar y validar sesión

simulation_role_cookie
→ prohibido como autoridad
```

Toda referencia deberá:

- expirar;
- ser revocable;
- estar vinculada al actor real;
- ser validada en servidor;
- no reutilizarse como sesión laboral.

---

#### 26. Expiración y revocación

`expires_at` es obligatorio.

La duración concreta se definirá en AUTH-CTX-004 o AUTH-CTX-029.

Una simulación se invalida cuando:

- expira;
- el actor real cierra sesión;
- el actor real queda inactivo;
- se revoca el permiso de simulación;
- cambia la versión contractual incompatible;
- se revoca manualmente;
- se detecta manipulación;
- se cambia el sujeto sin crear nueva revisión;
- se intenta mutar.

La expiración de una simulación no afecta el `AccessContext` real.

---

#### 27. Auditoría

Forma conceptual:

```ts
type SimulationAuditContext = {
  simulation_id: string;

  real_actor_id: string;
  real_principal_id: string;
  real_employee_id: string | null;

  purpose: SimulationPurpose;
  reason: string;

  simulated_subject_type: SimulatedSubjectType;
  simulated_subject_reference: string;

  app_codes: string[];
  permission_keys: string[];

  created_at: string;
  expires_at: string;
  completed_at: string | null;

  evaluation_count: number;
  would_allow_count: number;
  would_deny_count: number;
  indeterminate_count: number;

  access_context_fingerprint: string;
  catalog_version: string;
  dataset_versions: Record<string, string>;
  simulator_version: string;
};
```

La auditoría registra al actor real.

No atribuye acciones al sujeto simulado.

Los motivos disciplinarios o sensibles deberán protegerse mediante
proyecciones internas.

---

#### 28. Problemas estructurales

Forma conceptual:

```ts
type SimulationIssue = {
  issue_code: string;

  severity:
    | "BLOCKING_SIMULATION"
    | "BLOCKING_EVALUATION"
    | "INDETERMINATE"
    | "WARNING"
    | "INFO";

  source: string;
  safe_message: string;
};
```

Ejemplos iniciales:

```text
real_actor_unauthenticated
real_actor_inactive
simulation_not_authorized
simulation_expired
simulation_revoked
simulated_subject_invalid
hypothetical_context_incomplete
resource_unresolved
masked_field_required
contract_version_mismatch
scenario_conflict
device_scenario_invalid
simulation_mutation_prohibited
real_data_scope_exceeded
```

El catálogo definitivo de razones se consolidará en tareas posteriores del
BLOQUE E y en BLOQUE S.

---

#### 29. Datos sensibles

La simulación no se convierte en una herramienta para explorar:

- salarios;
- documentos personales;
- secretos;
- credenciales;
- tokens;
- datos financieros restringidos;
- auditoría disciplinaria;
- información de clientes;
- datos de otros trabajadores;
- recursos aislados;
- APP-REVIEW;
- entornos de prueba no autorizados.

Puede simular la existencia de una capacidad sin revelar el contenido
protegido.

Ejemplo:

```text
WOULD_ALLOW campo sensible
+
actor real sin lectura del dato real
→ mostrar únicamente explicación contractual
→ no mostrar valor
```

---

#### 30. Comparación de escenarios

Un `CHANGE_IMPACT_REVIEW` podrá comparar:

```text
ESCENARIO A
→ contrato vigente

ESCENARIO B
→ cambio propuesto
```

La comparación deberá declarar:

- versión base;
- cambios hipotéticos;
- permisos afectados;
- sujetos afectados;
- resultados modificados;
- casos que pasan de allow a deny;
- casos que pasan de deny a allow;
- casos indeterminados.

No publica el cambio.

No reescribe matrices.

No crea una nueva versión contractual.

---

#### 31. Escenarios canónicos

##### 31.1 Rol base sin turno

```text
simulated_subject = BASE_ROLE_TEMPLATE
base_role = gerente
active_shift = null
permission = BASE_ONLY
```

Resultado posible:

```text
WOULD_ALLOW por BASE
```

si matriz, alcance y recurso coinciden.

##### 31.2 Rol operativo sin turno

```text
operational_role = bodeguero
active_shift = null
permission = OPERATIONAL_ONLY
```

Resultado:

```text
WOULD_DENY
reason = active_shift_required
```

##### 31.3 Turno válido sin check-in para permiso T

```text
shift = válido
check-in = ausente
prerequisite = T
```

Resultado posible:

```text
WOULD_ALLOW
```

##### 31.4 Turno válido sin check-in para permiso T+C

Resultado:

```text
WOULD_DENY
reason = active_checkin_required
```

##### 31.5 Recurso sin territorio resoluble

Resultado:

```text
INDETERMINATE
reason = resource_unresolved
```

##### 31.6 Dispositivo incompatible

```text
actor hipotético = autorizado
device package = no admite permiso
```

Resultado:

```text
WOULD_DENY
```

##### 31.7 Datos reales fuera del alcance del actor real

Resultado:

```text
INDETERMINATE o explicación enmascarada
```

Nunca se devuelven los datos reales restringidos.

##### 31.8 Intento de mutación

Resultado real:

```text
DENY
reason = simulation_mutation_prohibited
```

No se devuelve `WOULD_ALLOW` como permiso ejecutable.

---

#### 32. Flujo conceptual de creación

```text
1. Validar AccessContext real.
2. Evaluar permiso real para iniciar simulación.
3. Registrar propósito y motivo.
4. Definir tipo de sujeto simulado.
5. Resolver o construir sujeto seguro.
6. Construir contexto hipotético con procedencia.
7. Definir recurso sintético, enmascarado o autorizado.
8. Validar versiones contractuales.
9. Definir expiración.
10. Crear simulation_id.
11. Activar escenario.
12. Evaluar solicitudes hipotéticas.
13. Clasificar resultados.
14. Registrar auditoría.
15. Completar, expirar o revocar.
```

---

#### 33. Flujo conceptual de evaluación

```text
1. Validar que la simulación esté ACTIVE.
2. Validar al actor real.
3. Validar autorización real de simulación.
4. Validar propósito.
5. Validar sujeto simulado.
6. Validar procedencia de cada valor.
7. Validar recurso y límites de datos reales.
8. Cargar catálogo y datasets exactos.
9. Ejecutar evaluador simulado separado.
10. Aplicar modalidades y precedencia.
11. Producir WOULD_ALLOW, WOULD_DENY o INDETERMINATE.
12. Aplicar enmascaramiento.
13. Registrar evidencia.
14. No ejecutar la acción.
```

---

#### 34. Relación con `AccessContext`

El `AccessContext` real participa únicamente para:

- identificar al actor real;
- comprobar su estado;
- evaluar su permiso de simulación;
- limitar datos reales visibles;
- registrar auditoría;
- invalidar la sesión cuando cambie.

No se modifica.

El contexto hipotético:

- puede tomar una proyección controlada;
- puede reemplazar valores únicamente dentro del escenario;
- conserva procedencia;
- nunca se promueve a contexto real.

---

#### 35. Relación con `AuthorizationDecision`

Para iniciar o administrar la simulación se requiere una
`AuthorizationDecision` real.

Para evaluar el escenario se produce un tipo distinto:

```text
SimulatedAuthorizationDecision
```

No se permite:

```text
AuthorizationDecision.final_decision = ALLOW
por sujeto simulado
```

Ni:

```text
SimulatedAuthorizationDecision.final_result = WOULD_ALLOW
→ ejecutar
```

---

#### 36. Relación con navegación

La navegación simulada podrá consumir resultados hipotéticos para:

- mostrar pantallas;
- ocultar pantallas;
- marcar capacidades;
- explicar requisitos;
- comparar roles;
- validar diseño UX.

No podrá:

- abrir datos reales fuera del alcance real;
- enviar formularios;
- ejecutar Server Actions mutadoras;
- generar documentos reales;
- disparar jobs;
- registrar eventos de dominio.

---

#### 37. Relación con dispositivos compartidos

Una simulación ejecutada desde un dispositivo compartido requerirá:

- dispositivo activo;
- sesión real de actor;
- actor real autorizado para simular;
- paquete de dispositivo compatible con la herramienta de simulación.

El sujeto simulado no reemplaza al actor de la sesión del dispositivo.

Cerrar la sesión del actor real revoca la simulación.

---

#### 38. Servicios y automatizaciones

Un servicio podrá ejecutar simulaciones técnicas únicamente para:

- pruebas contractuales;
- análisis de impacto;
- validación de matrices;
- regresión;
- soporte controlado.

Deberá existir:

- identidad técnica;
- proceso permitido;
- alcance;
- propósito;
- dataset;
- versión;
- auditoría.

No podrá utilizar `service_role` como bypass general para consultar datos
reales.

---

#### 39. Pruebas contractuales mínimas futuras

El contrato deberá permitir probar:

1. actor real autorizado;
2. actor real sin permiso de simulación;
3. actor real inactivo;
4. simulación expirada;
5. simulación revocada;
6. rol base sintético;
7. rol operativo sintético;
8. empleado real enmascarado;
9. empleado hipotético;
10. contexto con turno;
11. contexto sin turno;
12. contexto con check-in;
13. contexto con check-in incompatible;
14. dispositivo compatible;
15. dispositivo incompatible;
16. recurso sintético;
17. recurso real autorizado;
18. recurso real fuera del alcance del actor;
19. recurso no resuelto;
20. permiso no simulable;
21. `BASE_ONLY`;
22. `OPERATIONAL_ONLY`;
23. `BASE_OR_OPERATIONAL`;
24. `BASE_AND_OPERATIONAL`;
25. deny estructural;
26. actor-wide deny;
27. lane deny;
28. denegación por defecto;
29. cambio propuesto de grant;
30. cambio propuesto de deny;
31. intento de mutación;
32. intento de usar `WOULD_ALLOW` como `ALLOW`;
33. comparación entre dos escenarios;
34. incompatibilidad de versiones;
35. minimización de datos sensibles.

El plan completo de pruebas se definirá en AUTH-CTX-030.

---

#### 40. Invariantes

1. El actor real siempre se conserva.
2. El sujeto simulado nunca reemplaza al actor real.
3. `auth.uid()` nunca cambia por simulación.
4. RLS nunca cambia por simulación.
5. La simulación no crea permisos.
6. La simulación no crea roles.
7. La simulación no crea turnos.
8. La simulación no crea check-ins.
9. La simulación no crea sesiones de actor.
10. La simulación no modifica asignaciones.
11. La simulación no modifica datasets.
12. La simulación no ejecuta mutaciones.
13. `WOULD_ALLOW` no equivale a `ALLOW`.
14. `WOULD_DENY` no desactiva permisos reales.
15. `INDETERMINATE` no equivale a allow.
16. El actor real debe estar autorizado para simular.
17. La autorización de simulación es específica.
18. El propósito limita el escenario.
19. Los datos reales se limitan por la autoridad real.
20. Los permisos hipotéticos no amplían visibilidad real.
21. Toda información hipotética declara procedencia.
22. Los valores sintéticos se identifican como sintéticos.
23. Los valores propuestos no se publican.
24. Un recurso no resuelto produce `INDETERMINATE`.
25. Un escenario contradictorio no produce `WOULD_ALLOW`.
26. La expiración es obligatoria.
27. La revocación impide nuevas evaluaciones.
28. La auditoría atribuye la simulación al actor real.
29. El sujeto simulado no recibe tokens.
30. Las cookies no contienen autoridad simulada.
31. Una navegación simulada no protege rutas reales.
32. La simulación conserva modalidades y precedencia.
33. La simulación real y la evaluación real usan contratos distintos.
34. APP-REVIEW y entornos aislados requieren autorización específica real.
35. Un error interno falla cerrado.

---

#### 41. Antipatrones prohibidos

```ts
cookies().set("role_override", "propietario");
request.body.employee_id = simulatedEmployeeId;
supabase.auth.admin.generateLink({ user: simulatedUser });
set_config("request.jwt.claim.role", simulatedRole);
return evaluateAuthorization(simulatedContext);
```

También queda prohibido:

```text
rol simulado → rol real
sujeto simulado → auth.uid()
WOULD_ALLOW → ejecutar
cookie de rol → autoridad
service_role → ver todos los datos
simulación → cambiar RLS
simulación → registrar eventos
simulación → actuar como empleado
simulación → leer recursos no autorizados al actor real
```

---

#### 42. Límites de exposición

La proyección para UI podrá incluir:

- modo de simulación;
- propósito;
- sujeto seguro;
- valores hipotéticos visibles;
- permiso evaluado;
- `WOULD_ALLOW`, `WOULD_DENY` o `INDETERMINATE`;
- razones seguras;
- expiración;
- identificador de soporte.

No incluirá por defecto:

- documentos de identidad;
- salarios;
- secretos;
- tokens;
- grants completos de otros trabajadores;
- denegaciones disciplinarias;
- datos reales no autorizados;
- identificadores internos innecesarios;
- explicaciones que revelen recursos ocultos.

---

#### 43. Relación con tareas posteriores

##### AUTH-CTX-004

Congelará:

- versión del contrato;
- compatibilidad;
- serialización;
- política de evolución;
- relación entre versiones reales y simuladas.

##### AUTH-CTX-015

Precisará razones estructuradas que también puedan proyectarse en
simulación.

##### AUTH-CTX-016 a AUTH-CTX-024

Desarrollarán la decisión real.

No deberán convertir `SimulationContext` en una variante permisiva de la
decisión real.

##### AUTH-CTX-026

Diseñará `evaluate_authorization` real.

La evaluación simulada deberá conservar una frontera y nombre distintos.

##### AUTH-CTX-027

Definirá consumo centralizado por aplicaciones y separación UI real /
simulada.

##### AUTH-CTX-029

Definirá expiración, invalidación y caché.

##### AUTH-CTX-030

Definirá pruebas de contexto, decisión y simulación.

##### BLOQUE E3

Definirá la arquitectura física objetivo de sesiones, auditoría y datos
necesarios.

##### BLOQUE R

Implementará contratos y migraciones después de las aprobaciones
arquitectónicas.

---

#### 44. Fuera del alcance

AUTH-CTX-003 no:

- modifica `AccessContext`;
- modifica `AuthorizationDecision`;
- congela versiones;
- crea TypeScript;
- crea Zod;
- crea JSON Schema;
- crea tablas;
- crea funciones SQL;
- crea RPC;
- crea RLS;
- crea migraciones;
- implementa cookies;
- crea sesiones físicas;
- implementa UI;
- adapta aplicaciones;
- crea permisos nuevos;
- ejecuta simulaciones reales;
- persiste escenarios;
- define TTL definitivo;
- define mensajes finales;
- modifica Supabase.

---

#### 45. Riesgos controlados

##### Riesgo 1 — Impersonación real

Control:

```text
real_actor
≠ simulated_subject
```

##### Riesgo 2 — `WOULD_ALLOW` usado para ejecutar

Control:

```text
tipo contractual distinto
+
sin token ejecutable
```

##### Riesgo 3 — Role override por cookie

Control:

```text
cookie opaca firmada
→ referencia de sesión
→ nunca autoridad
```

##### Riesgo 4 — Filtración de datos

Control:

```text
autoridad real
∩
propósito
∩
proyección segura
```

##### Riesgo 5 — Mutación accidental

Control:

```text
simulation_context + mutation
→ DENY
```

##### Riesgo 6 — Mezcla con RLS

Control:

```text
auth.uid real e inmutable
```

##### Riesgo 7 — Escenario incompleto tratado como allow

Control:

```text
INDETERMINATE
```

##### Riesgo 8 — Cambios propuestos publicados por accidente

Control:

```text
provenance = PROPOSED
→ solo evaluación
```

##### Riesgo 9 — Simulación persistente después de revocación

Control:

```text
expires_at
+
validación del actor real
+
revocación
```

##### Riesgo 10 — Simulación de dispositivo que concede permisos

Control:

```text
dispositivo solo restringe
```

---

#### 46. Criterios de aprobación

AUTH-CTX-003 podrá aprobarse cuando se acepte que:

1. `SimulationContext` es un contrato separado;
2. conserva al actor real;
3. separa al sujeto simulado;
4. no modifica `auth.uid()`;
5. no modifica RLS;
6. no modifica `AccessContext` real;
7. no produce `AuthorizationDecision` real;
8. usa `WOULD_ALLOW`, `WOULD_DENY` e `INDETERMINATE`;
9. `WOULD_ALLOW` nunca es ejecutable;
10. el actor real requiere autorización explícita para simular;
11. el propósito limita la simulación;
12. el sujeto puede ser real enmascarado, plantilla o sintético;
13. cada valor hipotético declara procedencia;
14. los permisos hipotéticos no amplían datos reales visibles;
15. los recursos reales requieren autoridad real independiente;
16. un recurso no resuelto produce `INDETERMINATE`;
17. un escenario contradictorio no produce `WOULD_ALLOW`;
18. se conservan modalidades y precedencia;
19. el dispositivo no concede autoridad;
20. la simulación no crea turno ni check-in;
21. la simulación no crea grants ni denegaciones reales;
22. las propuestas no modifican datasets;
23. toda mutación en simulación se deniega;
24. las cookies no almacenan autoridad simulada;
25. `expires_at` es obligatorio;
26. la revocación impide nuevas evaluaciones;
27. la auditoría atribuye la acción al actor real;
28. la UI deberá identificar el modo simulación;
29. los datos sensibles se minimizan;
30. la implementación física queda reservada para BLOQUE R.

---

#### 47. Estado final de la propuesta

| Tarea        | Estado      |
| ------------ | ----------- |
| AUTH-CTX-002 | APROBADA    |
| AUTH-CTX-003 | APROBADA    |
| AUTH-CTX-004 | NO INICIADA |

No se avanza a AUTH-CTX-004 hasta recibir aprobación explícita de
AUTH-CTX-003.


### ✅ AUTH-CTX-004 — Versionar los contratos de respuesta

**Estado:** APROBADA  
**Bloque:** BLOQUE E — Contexto y decisión de autorización unificados  
**Naturaleza:** Publicación y congelación documental de contratos  
**Implementación física:** No incluida  
**Tarea anterior vigente:** AUTH-CTX-003 — APROBADA  
**Tarea posterior reservada:** AUTH-CTX-005 — Incluir principal autenticado  
**Familia contractual:** `vento.authorization.response-contracts@1.0.0`  
**Perfil de serialización:** `vento.canonical-json@1.0.0`  
**Huella contractual de publicación:** `sha256:782a216c4bbfdc3b3cec1bbd7239c05d93edd7fa34b4ce62cad48c1e6b9941cd`  
**Cambios físicos permitidos:** No

Esta tarea publica y congela la primera versión contractual de las
respuestas diseñadas en:

- AUTH-CTX-001 — `AccessContext`;
- AUTH-CTX-002 — `AuthorizationDecision`;
- AUTH-CTX-003 — `SimulationContext`;
- el resultado subordinado `SimulatedAuthorizationDecision`.

No crea tipos TypeScript, JSON Schema, Zod, funciones SQL, RPC, tablas,
migraciones, RLS, adaptadores, paquetes ni cambios físicos en Supabase.

---

#### 1. Objetivo

Establecer un sistema de versionado que permita:

1. identificar inequívocamente cada contrato;
2. distinguir semántica, forma serializada e implementación;
3. evolucionar respuestas sin romper consumidores silenciosamente;
4. detectar productores y consumidores incompatibles;
5. impedir downgrades o upgrades implícitos;
6. conservar decisiones históricas con su versión exacta;
7. permitir convivencia temporal mediante adaptadores explícitos;
8. separar versiones de contratos, catálogo, datasets y evaluadores;
9. registrar huellas reproducibles;
10. reservar la implementación física para tareas posteriores.

---

#### 2. Decisión principal

Se publica la familia:

```text
vento.authorization.response-contracts@1.0.0
```

con cuatro contratos identificables:

```text
AccessContext@1.0.0
AuthorizationDecision@1.0.0
SimulationContext@1.0.0
SimulatedAuthorizationDecision@1.0.0
```

Cada contrato tendrá dos versiones independientes:

```text
contract_version
→ semántica empresarial y reglas normativas

schema_version
→ forma serializada y estructura de campos
```

En la primera publicación:

```text
contract_version = 1.0.0
schema_version = 1.0.0
```

La coincidencia inicial no obliga a que ambas versiones evolucionen juntas.

---

#### 3. Identificadores congelados

| Elemento               | Identificador                            | Versión |
| ---------------------- | ---------------------------------------- | ------- |
| Familia                | `vento.authorization.response-contracts` | `1.0.0` |
| Contexto real          | `AccessContext`                          | `1.0.0` |
| Decisión real          | `AuthorizationDecision`                  | `1.0.0` |
| Contexto simulado      | `SimulationContext`                      | `1.0.0` |
| Decisión simulada      | `SimulatedAuthorizationDecision`         | `1.0.0` |
| Serialización canónica | `vento.canonical-json`                   | `1.0.0` |

No se utilizarán como identificadores contractuales:

- nombre de función SQL;
- ruta HTTP;
- nombre de paquete npm;
- nombre de tabla;
- nombre de repositorio;
- nombre de aplicación consumidora;
- fecha de despliegue;
- commit de una implementación concreta.

---

#### 4. Metadatos obligatorios comunes

Todos los contratos deberán declarar en su raíz:

```ts
type ContractMetadata = {
  contract_family: "vento.authorization.response-contracts";
  contract_family_version: "1.0.0";

  contract_name:
    | "AccessContext"
    | "AuthorizationDecision"
    | "SimulationContext"
    | "SimulatedAuthorizationDecision";

  contract_version: string;
  schema_version: string;
};
```

Los campos previamente diseñados se conservan.

Por tanto, las raíces publicadas quedan conceptualmente así:

```ts
type AccessContextV1 = ContractMetadata & {
  contract_name: "AccessContext";
  contract_version: "1.0.0";
  schema_version: "1.0.0";
  context_id: string;
  resolved_at: string;
  // demás campos aprobados en AUTH-CTX-001
};
```

```ts
type AuthorizationDecisionV1 = ContractMetadata & {
  contract_name: "AuthorizationDecision";
  contract_version: "1.0.0";
  schema_version: "1.0.0";
  decision_id: string;
  decided_at: string;
  // demás campos aprobados en AUTH-CTX-002
};
```

```ts
type SimulationContextV1 = ContractMetadata & {
  contract_name: "SimulationContext";
  contract_version: "1.0.0";
  schema_version: "1.0.0";
  simulation_id: string;
  created_at: string;
  expires_at: string;
  // demás campos aprobados en AUTH-CTX-003
};
```

```ts
type SimulatedAuthorizationDecisionV1 = ContractMetadata & {
  contract_name: "SimulatedAuthorizationDecision";
  contract_version: "1.0.0";
  schema_version: "1.0.0";
  simulated_decision_id: string;
  evaluated_at: string;
  // demás campos aprobados en AUTH-CTX-003
};
```

---

#### 5. Versiones que deben permanecer separadas

La respuesta podrá referenciar varias versiones simultáneamente.

| Versión                         | Qué identifica                                      |
| ------------------------------- | --------------------------------------------------- |
| `contract_family_version`       | Publicación coordinada de la familia de respuestas. |
| `contract_version`              | Semántica normativa del contrato específico.        |
| `schema_version`                | Estructura serializada del contrato específico.     |
| `catalog_version`               | Catálogo de aplicaciones y permisos utilizado.      |
| `catalog_hash`                  | Archivos físicos exactos del catálogo publicado.    |
| `contract_release_hash`         | Snapshot documental del catálogo de autorización.   |
| `dataset_version`               | Versión de una matriz o dataset de autorización.    |
| `dataset_hash`                  | Contenido exacto del dataset utilizado.             |
| `resolver_version`              | Implementación que produjo `AccessContext`.         |
| `evaluator_version`             | Implementación que produjo una decisión.            |
| `serialization_profile_version` | Reglas de serialización canónica.                   |

Regla:

```text
contract_version
≠ catalog_version
≠ dataset_version
≠ evaluator_version
```

Actualizar una implementación no cambia automáticamente el contrato.

Publicar un nuevo catálogo no cambia automáticamente el esquema de la
respuesta.

---

#### 6. Semántica de versiones

Se adopta versionado semántico:

```text
MAJOR.MINOR.PATCH
```

Ejemplo:

```text
1.4.2
│ │ └── PATCH
│ └──── MINOR
└────── MAJOR
```

##### 6.1 `MAJOR`

Se incrementa cuando existe incompatibilidad normativa o estructural.

Ejemplos:

- eliminar un campo obligatorio;
- renombrar un campo;
- cambiar el tipo de un campo;
- cambiar el significado de un campo existente;
- cambiar `ALLOW`/`DENY` por otra semántica;
- mezclar actor real y sujeto simulado;
- cambiar la precedencia de denegaciones;
- cambiar la composición de modalidades;
- convertir `null` en alcance global;
- permitir mutaciones mediante simulación;
- cambiar un campo opcional a obligatorio;
- eliminar un valor de enum vigente;
- cambiar el identificador del contrato;
- modificar la interpretación de un resultado histórico.

##### 6.2 `MINOR`

Se incrementa por extensiones compatibles y explícitas.

Ejemplos:

- agregar un campo opcional;
- agregar una razón estructurada nueva;
- agregar metadatos de auditoría opcionales;
- agregar una proyección segura nueva;
- agregar una categoría de procedencia;
- agregar un propósito de simulación;
- agregar un tipo de recurso sin cambiar los existentes;
- agregar una capacidad de explicación no obligatoria.

Un cambio `MINOR` solo será compatible si el consumidor cumple la política
de campos y enums desconocidos definida en esta tarea.

##### 6.3 `PATCH`

Se incrementa por correcciones compatibles que no cambian la semántica
normativa.

Ejemplos:

- corregir documentación;
- corregir ejemplos;
- aclarar una descripción sin cambiar el significado;
- agregar mensajes seguros equivalentes;
- corregir metadatos no autoritativos;
- corregir serialización sin alterar valores contractuales.

---

#### 7. Versión del contrato frente a versión del esquema

##### Cambio semántico sin cambio de forma

Ejemplo:

```text
mismo campo
+
significado normativo distinto
```

Resultado:

```text
contract_version cambia
schema_version puede permanecer
```

Si el cambio rompe la interpretación anterior:

```text
contract_version → MAJOR
```

##### Cambio de forma compatible sin cambio semántico

Ejemplo:

```text
nuevo campo opcional de diagnóstico
```

Resultado:

```text
schema_version → MINOR
contract_version puede permanecer
```

##### Cambio de forma incompatible

Ejemplo:

```text
campo obligatorio renombrado
```

Resultado:

```text
schema_version → MAJOR
contract_version → MAJOR
```

cuando el campo participa en la semántica contractual.

---

#### 8. Política de compatibilidad del productor

Todo productor deberá:

1. emitir `contract_family`;
2. emitir `contract_family_version`;
3. emitir `contract_name`;
4. emitir `contract_version`;
5. emitir `schema_version`;
6. respetar el perfil de serialización;
7. completar todos los campos obligatorios;
8. emitir valores explícitos `null` o listas vacías cuando corresponda;
9. no omitir silenciosamente campos obligatorios;
10. no emitir una versión distinta a la declarada;
11. registrar su `resolver_version` o `evaluator_version`;
12. registrar catálogo y datasets utilizados cuando participen;
13. fallar cerrado ante una publicación incompleta;
14. no adaptar la respuesta según heurísticas del cliente.

---

#### 9. Política de compatibilidad del consumidor

Todo consumidor deberá declarar:

```text
accepted_contract_name
accepted_contract_major_versions
accepted_schema_major_versions
```

Ejemplo conceptual:

```text
contract_name = AuthorizationDecision
accepted_contract_major_versions = [1]
accepted_schema_major_versions = [1]
```

El consumidor deberá:

- aceptar campos opcionales desconocidos;
- no asumir orden de propiedades JSON;
- no inferir autoridad por ausencia de campos desconocidos;
- tratar un campo obligatorio ausente como contrato inválido;
- tratar un enum crítico desconocido como incompatibilidad;
- no convertir un valor desconocido en `ALLOW`;
- no ignorar `contract_version`;
- no aceptar otro `contract_name`;
- no deserializar `SimulationContext` como `AccessContext`;
- no deserializar `WOULD_ALLOW` como `ALLOW`.

---

#### 10. Campos desconocidos

##### Campo opcional desconocido

Regla:

```text
campo opcional desconocido
→ conservar o ignorar de forma segura
→ no alterar decisión
```

##### Campo obligatorio desconocido

Un consumidor antiguo no puede saber por sí solo que un campo nuevo es
obligatorio.

Por tanto:

```text
agregar campo obligatorio
→ cambio MAJOR
```

##### Campo obligatorio ausente

```text
missing_required_field
→ CONTRACT_INVALID
→ fail closed
```

No se aplicará un valor predeterminado permisivo.

---

#### 11. Enums desconocidos

Se distinguen enums críticos y extensibles.

##### 11.1 Enums críticos

Incluyen como mínimo:

- `contract_name`;
- `authorization_requirement`;
- `final_decision.outcome`;
- `LaneDecision.outcome`;
- `SimulationStatus`;
- `SimulatedAuthorizationDecision.final_result`;
- estados de resolución de recurso;
- clases de denegación;
- severidades bloqueantes.

Regla:

```text
enum crítico desconocido
→ CONTRACT_INCOMPATIBLE
→ fail closed
```

##### 11.2 Enums extensibles

Podrán incluir:

- categorías informativas;
- mensajes seguros;
- propósitos adicionales;
- metadatos no autoritativos;
- clases de diagnóstico no bloqueantes.

Regla:

```text
enum extensible desconocido
→ preservar código
→ usar fallback seguro
→ no transformar en allow
```

Cada campo deberá clasificarse explícitamente como crítico o extensible en
el schema físico futuro.

---

#### 12. Resultados congelados

##### Decisión real

```text
ALLOW
DENY
```

No se agregará un tercer resultado real compatible dentro de la versión
mayor `1`.

Agregar un resultado real nuevo exige:

```text
AuthorizationDecision contract_version → 2.0.0
schema_version → 2.0.0
```

##### Decisión simulada

```text
WOULD_ALLOW
WOULD_DENY
INDETERMINATE
```

Estos valores no son intercambiables con resultados reales.

Eliminar, fusionar o reinterpretar cualquiera exige versión mayor.

---

#### 13. Compatibilidad de `AccessContext`

Dentro de `AccessContext@1.x` permanecen invariantes:

- principal separado de actor efectivo;
- identidad de dominio separada de empleado;
- rol base separado de rol operativo;
- cobertura administrativa separada del contexto operativo;
- turno separado de check-in;
- dispositivo separado del actor;
- problemas estructurales explícitos;
- `null` no significa global;
- listas vacías significan ausencia;
- la ausencia de turno no invalida automáticamente el carril base;
- el contrato no contiene la decisión final;
- el contrato no contiene simulación.

Romper cualquiera exige `AccessContext@2.0.0`.

---

#### 14. Compatibilidad de `AuthorizationDecision`

Dentro de `AuthorizationDecision@1.x` permanecen invariantes:

- decisión por aplicación exacta;
- decisión por permiso exacto;
- decisión por recurso exacto;
- resolución de territorio en servidor;
- modalidad obtenida del catálogo;
- carriles base y operativo separados;
- deny estructural por encima de todo allow;
- actor-wide deny por encima de allows;
- lane deny por encima de allow del mismo carril;
- denegación por defecto;
- composición exacta de las cuatro modalidades;
- resultado real exclusivamente `ALLOW` o `DENY`;
- la decisión no es token de capacidad;
- la UI no sustituye evaluación de servidor.

Romper cualquiera exige `AuthorizationDecision@2.0.0`.

---

#### 15. Compatibilidad de `SimulationContext`

Dentro de `SimulationContext@1.x` permanecen invariantes:

- actor real separado de sujeto simulado;
- `auth.uid()` real e inmutable;
- sin cambios de RLS;
- sin mutaciones;
- `WOULD_ALLOW` no ejecutable;
- datos reales limitados por autoridad real;
- procedencia explícita de valores hipotéticos;
- expiración obligatoria;
- auditoría atribuida al actor real;
- resultado separado mediante `SimulatedAuthorizationDecision`;
- escenarios incompletos no producen `WOULD_ALLOW`.

Romper cualquiera exige `SimulationContext@2.0.0`.

---

#### 16. Compatibilidad entre contratos

Matriz inicial:

| Productor                            | Consumidor esperado                             |  Compatible |
| ------------------------------------ | ----------------------------------------------- | ----------: |
| `AccessContext@1.x`                  | Evaluador real que acepta major 1               |          Sí |
| `AccessContext@1.x`                  | Evaluador simulado mediante adaptador explícito | Condicional |
| `SimulationContext@1.x`              | Evaluador real                                  |          No |
| `AuthorizationDecision@1.x`          | UI real compatible con major 1                  |          Sí |
| `SimulatedAuthorizationDecision@1.x` | UI real de ejecución                            |          No |
| `SimulatedAuthorizationDecision@1.x` | UI de simulación compatible                     |          Sí |
| `AuthorizationDecision@1.x`          | Consumidor que solo acepta major 2              |          No |
| Contrato sin versión                 | Cualquier consumidor canónico                   |          No |

---

#### 17. Downgrade y upgrade

Queda prohibido:

```text
respuesta 2.x
→ consumidor 1.x
→ borrar campos hasta que parezca 1.x
```

También:

```text
respuesta 1.x
→ consumidor 2.x
→ asumir campos o semántica 2.x
```

Regla:

```text
silent_downgrade = false
silent_upgrade = false
```

Toda conversión requiere:

- adaptador identificado;
- versión origen;
- versión destino;
- reglas deterministas;
- pruebas contractuales;
- auditoría;
- límites de información;
- periodo de retiro;
- rollback.

---

#### 18. Adaptadores

Forma conceptual:

```ts
type ContractAdapterMetadata = {
  adapter_id: string;
  adapter_version: string;

  source_contract_name: string;
  source_contract_version_range: string;
  source_schema_version_range: string;

  target_contract_name: string;
  target_contract_version: string;
  target_schema_version: string;

  lossless: boolean;
  dropped_fields: string[];
  synthesized_fields: string[];
};
```

Reglas:

1. un adaptador no inventa autoridad;
2. un campo autoritativo faltante no se sintetiza mediante fallback
   permisivo;
3. una conversión con pérdida deberá declararse;
4. un resultado simulado nunca se adapta a decisión real;
5. un adaptador legacy no puede omitir denegaciones;
6. los adaptadores se implementarán y probarán en BLOQUE R;
7. la compatibilidad con `get_operational_context` se diseñará en
   AUTH-CTX-028.

---

#### 19. Deprecación

Estados contractuales:

```text
ACTIVE
DEPRECATED
SUNSET
RETIRED
```

##### `ACTIVE`

Versión soportada para nuevos consumidores.

##### `DEPRECATED`

Sigue funcionando, pero no debe adoptarse en consumidores nuevos.

##### `SUNSET`

Tiene retiro aprobado y consumidores migrándose.

##### `RETIRED`

No se produce ni se acepta en caminos canónicos.

Una versión no podrá pasar a `RETIRED` sin:

- inventario de consumidores;
- telemetría suficiente;
- adaptador o migración aprobada;
- pruebas;
- rollback;
- decisión documental;
- ausencia de consumidores críticos sin migrar.

No se fija todavía una duración temporal universal.

---

#### 20. Reglas para cambios correctivos de implementación

Una implementación puede contener un bug respecto al contrato vigente.

Ejemplo:

```text
contrato 1.0.0
→ deny debe prevalecer

implementación
→ allow prevalece por error
```

La corrección:

- incrementa `evaluator_version`;
- no cambia necesariamente `contract_version`;
- no reescribe decisiones históricas;
- debe registrar el despliegue;
- debe ejecutar pruebas de regresión;
- puede cambiar resultados futuros porque corrige incumplimiento.

Si para justificar la conducta se cambia la norma, entonces sí corresponde
una nueva versión contractual.

---

#### 21. Decisiones históricas

Una decisión persistida deberá conservar como mínimo:

```text
contract_family_version
contract_name
contract_version
schema_version
catalog_version
catalog_hash
contract_release_hash
dataset_versions
dataset_hashes
resolver_version o evaluator_version
serialization_profile_version
```

Reglas:

- una decisión histórica se interpreta con su versión original;
- no se reinterpreta automáticamente con el contrato actual;
- no se recalcula silenciosamente;
- una vista histórica podrá aplicar adaptadores de lectura explícitos;
- la evidencia original permanece inmutable.

---

#### 22. Perfil de serialización

Se publica:

```text
vento.canonical-json@1.0.0
```

Reglas:

1. codificación UTF-8;
2. nombres de campos en `snake_case`;
3. timestamps RFC 3339 en UTC;
4. identificadores como strings;
5. booleanos JSON reales;
6. `null` explícito cuando el campo admite ausencia;
7. listas vacías explícitas;
8. objetos sin claves duplicadas;
9. números sin representación ambigua;
10. sin `NaN`, `Infinity` o valores no JSON;
11. sin dependencia del orden de propiedades;
12. enums mediante códigos canónicos;
13. sin datos secretos;
14. sin HTML dentro de campos estructurados;
15. sin campos autoritativos calculados por el cliente.

---

#### 23. Serialización para hashing

Cuando se requiera una huella de payload:

- UTF-8 sin BOM;
- saltos LF;
- claves ordenadas lexicográficamente;
- objetos normalizados recursivamente;
- arrays conservan orden cuando sea semántico;
- arrays se ordenan cuando el contrato declare que son conjuntos;
- timestamps normalizados a UTC;
- sin espacios insignificantes;
- sin campos volátiles excluidos por el perfil;
- SHA-256 sobre bytes canónicos.

Los timestamps de ejecución no forman parte de la huella contractual de
publicación de esta tarea.

---

#### 24. Huellas diferenciadas

```text
response_contract_release_hash
→ identifica esta publicación documental

response_schema_hash
→ identificará archivos físicos de schemas

response_payload_hash
→ podrá identificar una respuesta concreta

catalog_hash
→ identifica catálogo físico

dataset_hash
→ identifica dataset físico

evaluator_build_hash
→ identifica implementación desplegada
```

Ninguna huella sustituye a las demás.

---

#### 25. Huella de esta publicación

Campo publicado:

```text
response_contract_release_hash =
sha256:782a216c4bbfdc3b3cec1bbd7239c05d93edd7fa34b4ce62cad48c1e6b9941cd
```

Payload canónico:

```text
contract_family_id=vento.authorization.response-contracts
contract_family_version=1.0.0
release_kind=contractual_snapshot
access_context.contract_name=AccessContext
access_context.contract_version=1.0.0
access_context.schema_version=1.0.0
authorization_decision.contract_name=AuthorizationDecision
authorization_decision.contract_version=1.0.0
authorization_decision.schema_version=1.0.0
simulation_context.contract_name=SimulationContext
simulation_context.contract_version=1.0.0
simulation_context.schema_version=1.0.0
simulated_authorization_decision.contract_name=SimulatedAuthorizationDecision
simulated_authorization_decision.contract_version=1.0.0
simulated_authorization_decision.schema_version=1.0.0
serialization_profile=vento.canonical-json
serialization_profile_version=1.0.0
compatibility_policy=semantic_versioning_strict_major
unknown_optional_fields=ignore
unknown_critical_enum=fail_closed
missing_required_field=contract_invalid
silent_downgrade=false
silent_upgrade=false
real_decision_outcomes=ALLOW,DENY
simulated_decision_outcomes=WOULD_ALLOW,WOULD_DENY,INDETERMINATE
physical_changes_allowed=false
next_task=AUTH-CTX-005
source_task=AUTH-CTX-001
source_task=AUTH-CTX-002
source_task=AUTH-CTX-003
```

Algoritmo:

- UTF-8 sin BOM;
- saltos LF;
- una asignación por línea;
- campos en el orden publicado;
- sin espacios finales;
- un único LF final;
- SHA-256 sobre todos los bytes.

Resultado:

```text
782a216c4bbfdc3b3cec1bbd7239c05d93edd7fa34b4ce62cad48c1e6b9941cd
```

Esta huella identifica la decisión documental congelada.

No es el futuro hash de archivos TypeScript, JSON Schema o SQL.

---

#### 26. Negociación de versión

La implementación futura deberá preferir negociación explícita.

Ejemplo conceptual:

```text
consumer_accepts:
  AccessContext:
    contract_major: [1]
    schema_major: [1]
```

El productor deberá responder con una versión compatible o fallar.

No se permite:

- entregar la versión más reciente sin revisar compatibilidad;
- interpretar ausencia de versión como `latest`;
- usar user-agent para inferir contrato;
- entregar contratos distintos con el mismo identificador;
- negociar una decisión simulada como real.

La forma física de negociación se definirá en AUTH-CTX-025 a
AUTH-CTX-028.

---

#### 27. Errores de versión

Códigos conceptuales:

```text
contract_name_missing
contract_version_missing
schema_version_missing
contract_family_mismatch
unsupported_contract_major
unsupported_schema_major
contract_schema_incompatible
contract_hash_mismatch
catalog_version_incompatible
dataset_version_incompatible
serialization_profile_unsupported
adapter_required
adapter_not_available
```

Regla para autorización real:

```text
error de versión crítico
→ CONTRACT_INVALID
→ DENY
```

Regla para simulación:

```text
error de versión crítico
→ INDETERMINATE o INVALID
→ nunca WOULD_ALLOW
```

---

#### 28. Nuevos campos y consumidores exhaustivos

Todo consumidor deberá evitar lógica exhaustiva frágil sobre campos
extensibles.

Ejemplo prohibido:

```ts
switch (reason.category) {
  case "SHIFT":
  case "CHECKIN":
    return render();
  default:
    throw new Error();
}
```

Para enums extensibles deberá existir un fallback seguro.

Para enums críticos, el fallback será incompatibilidad y fail closed.

Agregar un valor a un enum crítico dentro de la misma major solo será
posible cuando el contrato del campo ya lo haya declarado extensible.

---

#### 29. Reglas por tipo de consumidor

##### UI

- puede ignorar metadatos opcionales;
- no puede ignorar `outcome`;
- no convierte error de versión en acceso;
- muestra mensaje seguro de incompatibilidad;
- no reconstruye decisiones.

##### Server Action o API

- valida versiones antes de actuar;
- no confía en respuestas entregadas por el cliente;
- reevalúa cuando corresponde;
- falla cerrado.

##### RPC y RLS

- deben implementar la misma major contractual;
- no usan respuestas antiguas sin adaptador;
- no interpretan simulación como autorización real.

##### Auditoría

- conserva versiones y hashes exactos;
- permite lectura histórica;
- no reescribe payloads.

##### Jobs y automatizaciones

- declaran versión aceptada;
- detienen o aíslan procesamiento incompatible;
- no continúan con defaults permisivos.

---

#### 30. Relación con el catálogo `vento.authorization@1.0.0`

La primera familia de respuestas se diseña para consumir:

```text
catalog_version = 1.0.0
```

y la publicación contractual:

```text
contract_release_hash =
sha256:687e1bc19c0cf7332e76ed940cf5a23b829492ebbee399af718fd326cf473cbe
```

Esto no significa que los contratos de respuesta deban cambiar de versión
cada vez que cambia el catálogo.

Ejemplo:

```text
AccessContext@1.0.0
AuthorizationDecision@1.0.0
+
catalog_version=1.1.0
```

puede ser válido si:

- la semántica de las respuestas no cambia;
- los nuevos valores son compatibles;
- el consumidor acepta la versión del catálogo;
- no se agregan enums críticos incompatibles.

---

#### 31. Relación con datasets

Una respuesta deberá declarar los datasets realmente utilizados.

Ejemplo conceptual:

```ts
dataset_references: [
  {
    dataset_id: "vento.authorization.base-role-grants",
    dataset_version: "1.0.0",
    dataset_hash: "sha256:..."
  },
  {
    dataset_id: "vento.authorization.operational-role-grants",
    dataset_version: "1.0.0",
    dataset_hash: "sha256:..."
  },
  {
    dataset_id: "vento.authorization.individual-overrides",
    dataset_version: "1.0.0",
    dataset_hash: "sha256:..."
  }
]
```

La ausencia de un dataset obligatorio o una incompatibilidad produce fail
closed.

---

#### 32. Compatibilidad con consumidores legacy

Los consumidores actuales que dependan de:

- `get_operational_context`;
- cookies de role override;
- respuestas booleanas;
- permisos sin recurso;
- campos legacy;
- roles hardcodeados;

no se consideran automáticamente compatibles con la familia `1.0.0`.

Deberán:

```text
inventariarse
→ clasificarse
→ adaptar explícitamente
→ probarse
→ migrarse
→ retirarse
```

La estrategia concreta se definirá en AUTH-CTX-028.

---

#### 33. Publicación física futura

La publicación física deberá generar como mínimo:

- tipos TypeScript;
- schemas de validación;
- fixtures;
- ejemplos válidos;
- ejemplos inválidos;
- pruebas de compatibilidad;
- hashes físicos;
- changelog;
- matriz productor–consumidor;
- adaptadores aprobados;
- reglas de deprecación.

No se crean en AUTH-CTX-004.

---

#### 34. Pruebas contractuales mínimas futuras

Se deberá probar:

1. contrato sin versión;
2. nombre de contrato incorrecto;
3. major compatible;
4. major incompatible;
5. minor superior compatible;
6. campo opcional desconocido;
7. campo obligatorio ausente;
8. enum crítico desconocido;
9. enum extensible desconocido;
10. schema incompatible;
11. hash incorrecto;
12. catálogo incompatible;
13. dataset incompatible;
14. downgrade silencioso;
15. upgrade silencioso;
16. adaptador lossless;
17. adaptador con pérdida declarada;
18. `WOULD_ALLOW` entregado a consumidor real;
19. decisión histórica interpretada con su versión;
20. corrección de evaluador sin cambio contractual;
21. cambio semántico que exige major;
22. cambio opcional que exige minor;
23. aclaración documental que exige patch;
24. consumidor legacy sin adaptador;
25. serialización canónica reproducible.

El plan completo de pruebas corresponde a AUTH-CTX-030.

---

#### 35. Invariantes

1. Todo contrato declara nombre y versión.
2. Todo contrato declara schema version.
3. La familia se identifica explícitamente.
4. La semántica y el esquema se versionan por separado.
5. El catálogo se versiona por separado.
6. Los datasets se versionan por separado.
7. El evaluador se versiona por separado.
8. La primera versión de cada contrato es `1.0.0`.
9. Un cambio incompatible incrementa major.
10. Un campo obligatorio nuevo incrementa major.
11. Un campo opcional compatible incrementa minor.
12. Una aclaración no semántica incrementa patch.
13. Campos opcionales desconocidos no conceden autoridad.
14. Enums críticos desconocidos fallan cerrado.
15. Campos obligatorios ausentes fallan cerrado.
16. No existe downgrade silencioso.
17. No existe upgrade silencioso.
18. Todo adaptador es explícito y versionado.
19. Una decisión simulada nunca se adapta a decisión real.
20. `ALLOW` y `DENY` permanecen congelados en major 1.
21. `WOULD_ALLOW`, `WOULD_DENY` e `INDETERMINATE` permanecen congelados en
    major 1.
22. Una decisión histórica conserva sus versiones originales.
23. El orden JSON no participa en semántica.
24. `null` no se reinterpreta durante adaptación.
25. La incompatibilidad real produce `DENY`.
26. La incompatibilidad simulada no produce `WOULD_ALLOW`.
27. Las versiones no se infieren por ruta o nombre de función.
28. El hash documental no sustituye hashes físicos.
29. Los consumidores deben declarar majors aceptadas.
30. La implementación física queda reservada para BLOQUE R.

---

#### 36. Antipatrones prohibidos

```ts
const version = response.contract_version ?? "latest";
const allowed = response.final_decision !== "DENY";
const role = legacy.role ?? response.base_role;
const result = simulated.final_result.replace("WOULD_", "");
```

También queda prohibido:

```text
sin versión → asumir 1.0.0
major desconocida → intentar de todos modos
enum desconocido → ALLOW
campo obligatorio ausente → usar null permisivo
respuesta 2.x → borrar campos hasta parecer 1.x
SimulationContext → AccessContext
WOULD_ALLOW → ALLOW
hash documental → hash de archivos
versión de catálogo → versión de respuesta
```

---

#### 37. Estado de publicación

| Contrato                         | Estado   | Contract version | Schema version |
| -------------------------------- | -------- | ---------------- | -------------- |
| `AccessContext`                  | `ACTIVE` | `1.0.0`          | `1.0.0`        |
| `AuthorizationDecision`          | `ACTIVE` | `1.0.0`          | `1.0.0`        |
| `SimulationContext`              | `ACTIVE` | `1.0.0`          | `1.0.0`        |
| `SimulatedAuthorizationDecision` | `ACTIVE` | `1.0.0`          | `1.0.0`        |

Estado de la familia:

```text
vento.authorization.response-contracts@1.0.0
→ CONTRACTUAL_SNAPSHOT
→ NO PHYSICAL PUBLICATION
```

---

#### 38. Relación con tareas posteriores

##### AUTH-CTX-005 a AUTH-CTX-015

Precisarán nodos internos de `AccessContext`.

Podrán agregar detalle compatible, pero no romper invariantes de
`AccessContext@1.x`.

##### AUTH-CTX-016 a AUTH-CTX-024

Precisarán nodos internos de `AuthorizationDecision`.

Podrán agregar detalle compatible, pero no romper invariantes de
`AuthorizationDecision@1.x`.

##### AUTH-CTX-025 y AUTH-CTX-026

Diseñarán contratos SQL futuros y deberán declarar las versiones que
producen.

##### AUTH-CTX-027

Definirá consumidores centralizados y versiones aceptadas.

##### AUTH-CTX-028

Definirá adaptadores y compatibilidad temporal con
`get_operational_context`.

##### AUTH-CTX-029

Definirá invalidación, caché y vigencia de respuestas.

##### AUTH-CTX-030

Definirá pruebas de contrato y compatibilidad.

##### BLOQUE H

Materializará tipos y contratos compartidos después de las aprobaciones
correspondientes.

##### BLOQUE E3

Definirá ubicación, persistencia y gobierno físico de schemas, auditoría y
versiones.

##### BLOQUE R

Implementará productores, adaptadores y migración de consumidores.

---

#### 39. Fuera del alcance

AUTH-CTX-004 no:

- cambia la semántica de AUTH-CTX-001 a AUTH-CTX-003;
- implementa schemas;
- crea paquetes;
- crea tipos;
- crea SQL;
- crea RPC;
- crea RLS;
- crea migraciones;
- crea adaptadores;
- migra consumidores;
- retira contratos legacy;
- define TTL;
- define caché;
- publica archivos físicos;
- modifica Supabase;
- cambia el catálogo;
- cambia datasets.

---

#### 40. Criterios de aprobación

AUTH-CTX-004 podrá aprobarse cuando se acepte que:

1. la familia se publica como
   `vento.authorization.response-contracts@1.0.0`;
2. `AccessContext` se publica como `1.0.0`;
3. `AuthorizationDecision` se publica como `1.0.0`;
4. `SimulationContext` se publica como `1.0.0`;
5. `SimulatedAuthorizationDecision` se publica como `1.0.0`;
6. `contract_version` y `schema_version` son independientes;
7. se adopta versionado semántico;
8. cambios incompatibles incrementan major;
9. campos opcionales compatibles incrementan minor;
10. aclaraciones compatibles incrementan patch;
11. campos obligatorios nuevos requieren major;
12. enums críticos desconocidos fallan cerrado;
13. campos obligatorios ausentes fallan cerrado;
14. campos opcionales desconocidos se ignoran de forma segura;
15. no existe downgrade silencioso;
16. no existe upgrade silencioso;
17. adaptadores son explícitos y versionados;
18. una decisión simulada no puede adaptarse a real;
19. las versiones de catálogo y datasets permanecen separadas;
20. resolver y evaluador tienen versiones independientes;
21. decisiones históricas conservan sus versiones originales;
22. se publica `vento.canonical-json@1.0.0`;
23. se publica la huella
    `sha256:782a216c4bbfdc3b3cec1bbd7239c05d93edd7fa34b4ce62cad48c1e6b9941cd`;
24. la huella documental no sustituye hashes físicos;
25. consumidores declaran majors aceptadas;
26. incompatibilidad real produce `DENY`;
27. incompatibilidad simulada no produce `WOULD_ALLOW`;
28. la compatibilidad legacy se reserva para AUTH-CTX-028;
29. las pruebas se reservan para AUTH-CTX-030;
30. no se implementa ningún cambio físico.

---

#### 41. Estado final de la propuesta

| Tarea        | Estado      |
| ------------ | ----------- |
| AUTH-CTX-003 | APROBADA    |
| AUTH-CTX-004 | APROBADA    |
| AUTH-CTX-005 | NO INICIADA |

No se avanza a AUTH-CTX-005 hasta recibir aprobación explícita de
AUTH-CTX-004.


ACCESS CONTEXT

### ✅ AUTH-CTX-005 — Incluir principal autenticado

**Estado:** APROBADA  
**Bloque:** BLOQUE E — Contexto y decisión de autorización unificados  
**Naturaleza:** Refinamiento documental del nodo `principal` de `AccessContext`  
**Implementación física:** No incluida  
**Tarea anterior vigente:** AUTH-CTX-004 — APROBADA  
**Tarea posterior reservada:** AUTH-CTX-006 — Incluir actor efectivo  
**Contrato afectado:** `AccessContext@1.0.0`  
**Nodo afectado:** `principal`  
**Cambio contractual:** Aclaración normativa compatible; no cambia la forma publicada  
**Cambios físicos permitidos:** No

Esta tarea define de forma exhaustiva la semántica, procedencia, estados,
invariantes y límites del principal que presenta la credencial técnica ante
Vento OS.

No modifica la estructura raíz aprobada de `AccessContext`, no agrega campos,
no cambia `contract_version`, no cambia `schema_version` y no implementa tipos,
funciones SQL, RPC, RLS, migraciones, guards, adaptadores ni cambios en
Supabase.

---

#### 1. Objetivo

Definir el nodo `principal` de manera que Vento OS pueda responder de forma
inequívoca:

1. si la solicitud contiene una credencial autenticada;
2. qué clase de principal presentó esa credencial;
3. qué sujeto técnico de Supabase Auth está asociado, cuando aplique;
4. qué sesión técnica fue validada, cuando exista;
5. mediante qué método se autenticó;
6. desde cuándo se considera autenticado;
7. cuándo expira la sesión conocida;
8. si el principal es válido, inválido o anónimo;
9. qué datos no pueden inferirse a partir de la autenticación;
10. qué inconsistencias deberán registrarse para denegar de forma segura.

El nodo deberá impedir que una aplicación interprete:

```text
usuario autenticado
=
empleado
=
actor efectivo
=
rol
=
permiso
```

La relación correcta será:

```text
CREDENCIAL VALIDADA
        ↓
PRINCIPAL AUTENTICADO
        ↓
IDENTIDAD DE DOMINIO
        ↓
ACTOR EFECTIVO
        ↓
CONTEXTO LABORAL U OPERATIVO
        ↓
DECISIÓN DE AUTORIZACIÓN
```

---

#### 2. Decisión principal

El `principal` identifica exclusivamente quién o qué presentó la credencial
técnica aceptada por la capa de autenticación.

Regla canónica:

```text
principal
=
identidad técnica autenticada de la solicitud
```

No representa por sí solo:

```text
empleado
cliente
dispositivo empresarial activo
servicio empresarial autorizado
actor efectivo
rol base
rol operativo
sede
área
turno
check-in
permiso
alcance
autorización final
```

Por tanto:

```text
principal válido
≠ identidad de dominio válida
≠ actor efectivo resuelto
≠ autorización concedida
```

---

#### 3. Contrato vigente del nodo

Se conserva sin cambios la forma publicada en AUTH-CTX-001 y
AUTH-CTX-004:

```ts
type PrincipalContext = {
  principal_type:
    | "HUMAN_USER"
    | "SHARED_DEVICE"
    | "SYSTEM_SERVICE"
    | "ANONYMOUS";

  auth_user_id: string | null;
  session_id: string | null;
  authenticated: boolean;
  authentication_method: string | null;
  authenticated_at: string | null;
  session_expires_at: string | null;
  principal_status: "VALID" | "INVALID" | "ANONYMOUS";
};
```

No se agregan campos en esta tarea.

La publicación permanece:

```text
AccessContext
contract_version = 1.0.0
schema_version   = 1.0.0
```

---

#### 4. Fuente de verdad

El nodo `principal` deberá resolverse exclusivamente en servidor a partir de
una fuente técnica confiable.

Fuentes permitidas:

| Clase            | Fuente autoritativa                                                                |
| ---------------- | ---------------------------------------------------------------------------------- |
| `HUMAN_USER`     | JWT o sesión validada por Supabase Auth                                            |
| `SHARED_DEVICE`  | Sesión de Supabase Auth perteneciente al usuario técnico vinculado al dispositivo  |
| `SYSTEM_SERVICE` | Credencial o identidad técnica validada dentro de un proceso de servidor confiable |
| `ANONYMOUS`      | Ausencia comprobada de una credencial válida                                       |

No serán fuente de verdad:

- cookies no verificadas;
- datos enviados en el body;
- query parameters;
- headers empresariales definidos por el cliente;
- `localStorage`;
- estado de React;
- nombre, correo o UUID enviado por una pantalla;
- rol declarado por el frontend;
- sede o área seleccionada;
- `navigation_role`;
- identificadores de simulación;
- respuestas almacenadas sin control de vigencia;
- tokens decodificados sin verificar firma, emisor, audiencia y expiración.

---

#### 5. Límite de confianza

La resolución seguirá este límite:

```text
SOLICITUD NO CONFIABLE
        ↓
VALIDACIÓN CRIPTOGRÁFICA Y DE SESIÓN
        ↓
CLASIFICACIÓN DEL PRINCIPAL
        ↓
CONSTRUCCIÓN DEL NODO `principal`
        ↓
RESOLUCIÓN EMPRESARIAL POSTERIOR
```

Los claims técnicos podrán utilizarse únicamente después de validar:

- firma;
- emisor;
- audiencia o proyecto esperado;
- expiración;
- revocación cuando la plataforma lo permita;
- consistencia mínima del sujeto;
- método de autenticación reconocido;
- contexto de ejecución confiable para servicios.

La mera decodificación de un JWT no constituye autenticación.

---

#### 6. `principal_type`

`principal_type` clasifica la naturaleza del sujeto técnico que presenta la
credencial.

Valores congelados en `AccessContext@1.0.0`:

```text
HUMAN_USER
SHARED_DEVICE
SYSTEM_SERVICE
ANONYMOUS
```

No se utilizarán valores de roles empresariales como:

```text
propietario
gerente_general
cajero_satelite
bodeguero
cliente
administrador
```

Esos valores pertenecen a otras capas.

---

#### 7. `HUMAN_USER`

Representa una sesión personal autenticada mediante Supabase Auth.

Condiciones mínimas para estado `VALID`:

```text
credencial válida
+
sujeto Auth resoluble
+
sesión vigente
+
principal clasificado como persona
```

Reglas:

1. `auth_user_id` es obligatorio cuando el estado es `VALID`;
2. `auth_user_id` identifica al sujeto técnico de Auth, no al empleado;
3. la existencia del sujeto no confirma una fila en `employees`;
4. la existencia del sujeto no confirma una fila en `public.users`;
5. el correo no identifica de forma autoritativa al empleado;
6. los metadatos del usuario no conceden rol ni permisos;
7. el principal puede tener identidad laboral, identidad de cliente, ambas o
   ninguna;
8. la selección de la identidad de dominio corresponde a AUTH-CTX-007;
9. la atribución como actor efectivo corresponde a AUTH-CTX-006;
10. un empleado inactivo no convierte el principal técnico en inválido: hace
    inválida la identidad laboral posterior.

Ejemplo conceptual:

```text
principal_type   = HUMAN_USER
principal_status = VALID
authenticated    = true
        ↓
Todavía no se sabe si representa empleado o cliente.
```

---

#### 8. `SHARED_DEVICE`

Representa la sesión técnica de un dispositivo compartido registrado en
Vento OS.

En la versión `1.0.0`, un dispositivo compartido válido deberá autenticarse
mediante un usuario técnico de Supabase Auth vinculado de forma inequívoca al
dispositivo empresarial.

Condiciones mínimas para estado técnico `VALID`:

```text
sesión Auth válida
+
auth_user_id resoluble
+
clasificación técnica como dispositivo compartido
```

Reglas:

1. `auth_user_id` identifica al usuario técnico, no al trabajador;
2. el usuario técnico no puede tener identidad laboral humana;
3. el dispositivo no adquiere rol base;
4. el dispositivo no adquiere rol operativo por la autenticación;
5. la vigencia de la credencial no demuestra que el dispositivo empresarial
   esté activo;
6. la vinculación con `shared_operational_devices` se resolverá como identidad
   o contexto de dispositivo;
7. el actor humano deberá resolverse mediante una sesión de actor separada;
8. un dispositivo sin actor puede conservar principal técnico válido, pero no
   ejecutar mutaciones empresariales que exijan actor humano;
9. `navigation_role` no altera el principal;
10. las aplicaciones permitidas del dispositivo no alteran el principal.

Separación obligatoria:

```text
PRINCIPAL
usuario técnico del dispositivo

DISPOSITIVO EMPRESARIAL
registro y estado del terminal

ACTOR EFECTIVO
trabajador identificado en la sesión de actor
```

Ejemplo:

```text
principal_type = SHARED_DEVICE
principal_status = VALID
        ↓
device_context puede ser ACTIVE o INVALID
        ↓
actor_effective puede ser EMPLOYEE o UNRESOLVED
```

---

#### 9. `SYSTEM_SERVICE`

Representa un proceso técnico autenticado que se ejecuta dentro de un entorno
de servidor confiable.

Ejemplos conceptuales:

- job programado;
- Edge Function interna;
- webhook verificado;
- adaptador de integración;
- proceso de reconciliación;
- tarea de mantenimiento;
- ejecución administrativa controlada;
- proceso que utiliza una credencial privilegiada de Supabase.

Reglas:

1. `service_role` es una credencial técnica, no un permiso empresarial;
2. el uso de `createAdminClient()` no convierte al servicio en administrador;
3. `SYSTEM_SERVICE` no tiene rol base;
4. `SYSTEM_SERVICE` no tiene rol operativo;
5. el principal técnico deberá resolverse dentro de un proceso de servidor
   identificado;
6. `auth_user_id` podrá ser `null` cuando la credencial no represente una fila
   de `auth.users`;
7. un principal `VALID` deberá conservar una referencia técnica no secreta y
   auditable mediante `session_id` o mediante la evidencia autorizada de
   `resolution_metadata`;
8. la referencia nunca será la API key, el JWT, el secreto o su valor completo;
9. la identidad empresarial del servicio se resolverá después como
   `domain_identity = SYSTEM` cuando corresponda;
10. el actor efectivo será `SYSTEM` o un empleado delegado explícitamente,
    pero esa definición pertenece a AUTH-CTX-006;
11. no existirá delegación humana implícita;
12. el nombre de una función, ruta o repositorio no basta para autenticar un
    servicio.

Regla crítica:

```text
SYSTEM_SERVICE válido
≠ operación empresarial permitida
```

---

#### 10. `ANONYMOUS`

Representa la ausencia explícita de una credencial válida.

No se utilizará `null` en el nodo raíz para representar anonimato.

Forma obligatoria:

```ts
{
  principal_type: "ANONYMOUS",
  auth_user_id: null,
  session_id: null,
  authenticated: false,
  authentication_method: null,
  authenticated_at: null,
  session_expires_at: null,
  principal_status: "ANONYMOUS"
}
```

Reglas:

1. anónimo no significa sesión inválida;
2. anónimo significa que no se presentó una credencial aceptable;
3. las aplicaciones laborales privadas deberán denegar;
4. un endpoint público podrá continuar únicamente si su contrato permite
   acceso anónimo;
5. el anonimato no crea identidad de cliente;
6. el anonimato no crea actor efectivo empresarial;
7. una solicitud pública que después requiere mutación deberá resolver una
   identidad y autorización apropiadas;
8. no se inferirá identidad desde correo, teléfono, QR, código de pedido o
   identificador enviado por el cliente.

---

#### 11. `auth_user_id`

`auth_user_id` representa exclusivamente el identificador del sujeto de
Supabase Auth cuando la clase de principal utiliza `auth.users`.

Semántica:

```text
auth_user_id
=
identificador técnico del sujeto Auth validado
```

No significa:

```text
employee_id
customer_id
device_id
actor_id
created_by empresarial
rol
permiso
```

Reglas:

1. será obligatorio para `HUMAN_USER + VALID`;
2. será obligatorio para `SHARED_DEVICE + VALID` en el modelo `1.0.0`;
3. podrá ser `null` para `SYSTEM_SERVICE`;
4. será `null` para `ANONYMOUS`;
5. no podrá aceptarse desde el cliente;
6. no podrá sustituirse por un correo;
7. no podrá sustituirse por un UUID empresarial;
8. una vinculación con varias identidades de dominio deberá resolverse de
   forma explícita, no por orden arbitrario;
9. una vinculación inexistente no invalida necesariamente la autenticación,
   pero sí puede impedir la operación empresarial solicitada;
10. una vinculación duplicada o ambigua produce un problema estructural.

---

#### 12. `session_id`

`session_id` será una referencia opaca a la sesión o ejecución técnica
validada.

Reglas:

1. no contendrá el access token;
2. no contendrá el refresh token;
3. no contendrá el JWT completo;
4. no contendrá una API key;
5. no contendrá un secreto de integración;
6. no será reutilizable como credencial;
7. deberá permitir correlación técnica y auditoría cuando la plataforma
   disponga de un identificador estable;
8. podrá ser `null` cuando la fuente técnica no exponga un identificador
   seguro;
9. para servicios sin `auth_user_id`, deberá existir una referencia técnica
   auditable en `session_id` o en `resolution_metadata`;
10. no representa una sesión de actor de dispositivo;
11. no representa un turno;
12. no representa un check-in;
13. no representa una sesión de simulación.

Separación:

```text
principal.session_id
≠ device_context.actor_session_id
≠ active_shift.shift_id
≠ active_checkin_session.checkin_session_id
≠ simulation_id
```

---

#### 13. `authenticated`

`authenticated` será un indicador derivado, no una fuente independiente.

Regla:

```text
authenticated = true
SI Y SOLO SI
principal_status = VALID
AND principal_type != ANONYMOUS
```

Tabla:

| `principal_status` | `principal_type`      | `authenticated` |
| ------------------ | --------------------- | --------------: |
| `VALID`            | `HUMAN_USER`          |          `true` |
| `VALID`            | `SHARED_DEVICE`       |          `true` |
| `VALID`            | `SYSTEM_SERVICE`      |          `true` |
| `INVALID`          | cualquiera no anónimo |         `false` |
| `ANONYMOUS`        | `ANONYMOUS`           |         `false` |

No se permitirá:

```text
principal_status = INVALID
authenticated = true
```

ni:

```text
principal_type = ANONYMOUS
authenticated = true
```

---

#### 14. `authentication_method`

`authentication_method` describe de forma segura el mecanismo técnico que
produjo la autenticación.

Será un valor canónico normalizado, no una copia arbitraria de metadatos del
proveedor.

Registro inicial recomendado:

```text
PASSWORD
OTP
MAGIC_LINK
OAUTH
SSO
DEVICE_CREDENTIAL
SERVICE_CREDENTIAL
SIGNED_WEBHOOK
INTERNAL_JOB
UNKNOWN_AUTHENTICATED_METHOD
```

Reglas:

1. será `null` para `ANONYMOUS`;
2. no contendrá nombres de secretos;
3. no contendrá tokens;
4. no contendrá correos ni teléfonos;
5. no concederá permisos por sí mismo;
6. un método desconocido no se convertirá en un método más confiable;
7. un método nuevo podrá añadirse como extensión compatible cuando no cambie
   la semántica de los existentes;
8. la fuerza o nivel de aseguramiento no se inferirá únicamente del nombre;
9. MFA, cuando exista, deberá representarse mediante evidencia técnica
   apropiada en una evolución contractual o metadato autorizado, sin inventar
   un campo en esta tarea;
10. las aplicaciones no deberán implementar reglas empresariales mediante
    comparaciones locales de este texto.

---

#### 15. `authenticated_at`

`authenticated_at` registra el momento conocido en que la sesión o credencial
fue validada o emitida para el principal.

Reglas:

1. se serializará en UTC mediante ISO 8601;
2. será `null` para `ANONYMOUS`;
3. deberá provenir de una fuente técnica confiable;
4. no se aceptará desde el reloj del cliente;
5. no equivale a `resolved_at`;
6. no equivale al inicio del turno;
7. no equivale al check-in;
8. no equivale al inicio de una sesión de actor;
9. para un servicio podrá representar el inicio de la autenticación de la
   ejecución actual;
10. si la fuente no puede determinarlo de manera confiable, podrá ser `null`
    y deberá conservarse evidencia suficiente en `resolution_metadata`.

Separación:

```text
authenticated_at
→ cuándo se autenticó el principal

resolved_at
→ cuándo se construyó el AccessContext
```

---

#### 16. `session_expires_at`

`session_expires_at` registra la expiración conocida de la sesión técnica.

Reglas:

1. se serializará en UTC mediante ISO 8601;
2. será `null` para `ANONYMOUS`;
3. una expiración anterior o igual a `resolved_at` impide estado `VALID`;
4. una sesión expirada no se renovará mediante datos del frontend;
5. una sesión renovada deberá producir un nuevo contexto o invalidar el
   anterior;
6. `null` no significa autorización indefinida;
7. para credenciales de servicio sin expiración embebida, cada ejecución
   deberá volver a validar la credencial y las políticas técnicas;
8. la rotación o revocación puede invalidar el principal antes de la fecha;
9. no equivale a expiración de sesión de actor;
10. no equivale a fin de turno;
11. no equivale a fin de check-in;
12. no equivale al TTL de caché del `AccessContext`.

---

#### 17. `principal_status`

Estados congelados:

```text
VALID
INVALID
ANONYMOUS
```

##### 17.1 `VALID`

Significa únicamente que la credencial técnica y la sesión aplicable fueron
aceptadas por la capa de autenticación.

No confirma:

- identidad empresarial;
- estado del empleado;
- estado del cliente;
- estado del dispositivo;
- autorización del servicio;
- actor efectivo;
- permisos;
- cobertura;
- contexto operativo.

##### 17.2 `INVALID`

Se utiliza cuando existe una credencial o sesión presentada, pero no puede
aceptarse como principal válido.

Ejemplos conceptuales:

- firma inválida;
- emisor incorrecto;
- audiencia o proyecto incorrecto;
- token expirado;
- sesión revocada;
- sujeto obligatorio ausente;
- claims técnicos contradictorios;
- principal técnico no soportado;
- clasificación ambigua entre persona y dispositivo;
- credencial de servicio presentada desde un entorno no confiable.

##### 17.3 `ANONYMOUS`

Se utiliza cuando no existe una credencial válida presentada y el sistema
representa explícitamente la solicitud como anónima.

---

#### 18. Diferencia entre principal inválido e identidad inactiva

Esta separación es obligatoria.

Ejemplo A:

```text
JWT válido
+
empleado inactivo
```

Resultado:

```text
principal_status = VALID
employee.is_active = false
structural issue = employee_inactive
```

Ejemplo B:

```text
JWT válido de usuario técnico
+
dispositivo empresarial inactivo
```

Resultado:

```text
principal_status = VALID
device_context.status = INACTIVE o INVALID
structural issue = device_inactive
```

Ejemplo C:

```text
credencial de servicio válida
+
proceso no autorizado para la operación
```

Resultado:

```text
principal_status = VALID
actor o autorización posterior = no resoluble o DENY
```

Ejemplo D:

```text
JWT expirado
```

Resultado:

```text
principal_status = INVALID
authenticated = false
```

La actividad empresarial no se codificará dentro de
`principal_status`.

---

#### 19. Matriz de consistencia

| Tipo             | Estado      | `auth_user_id`    | `authenticated` | Regla                                                               |
| ---------------- | ----------- | ----------------- | --------------: | ------------------------------------------------------------------- |
| `HUMAN_USER`     | `VALID`     | Obligatorio       |          `true` | Sesión personal válida                                              |
| `HUMAN_USER`     | `INVALID`   | Opcional          |         `false` | Sujeto no confiable o sesión inválida                               |
| `SHARED_DEVICE`  | `VALID`     | Obligatorio en v1 |          `true` | Usuario técnico válido; dispositivo empresarial se resuelve después |
| `SHARED_DEVICE`  | `INVALID`   | Opcional          |         `false` | Credencial o clasificación técnica inválida                         |
| `SYSTEM_SERVICE` | `VALID`     | Opcional          |          `true` | Proceso técnico autenticado en servidor                             |
| `SYSTEM_SERVICE` | `INVALID`   | Opcional          |         `false` | Credencial o entorno no confiable                                   |
| `ANONYMOUS`      | `ANONYMOUS` | `null`            |         `false` | Sin credencial aceptada                                             |

Combinaciones inválidas:

```text
ANONYMOUS + VALID
ANONYMOUS + INVALID
HUMAN_USER + ANONYMOUS
SHARED_DEVICE + ANONYMOUS
SYSTEM_SERVICE + ANONYMOUS
VALID + authenticated false
INVALID + authenticated true
ANONYMOUS + auth_user_id no nulo
ANONYMOUS + session_id no nulo
```

Toda combinación inválida deberá producir un problema estructural y fallar de
forma cerrada para operaciones privadas.

---

#### 20. Clasificación de persona frente a dispositivo

Un usuario técnico de dispositivo también puede existir físicamente en
`auth.users`.

Por tanto, la presencia de `auth_user_id` no basta para clasificar:

```text
HUMAN_USER
vs.
SHARED_DEVICE
```

La clasificación deberá utilizar una relación empresarial inequívoca y
controlada.

Regla:

```text
auth_user_id vinculado a dispositivo técnico activo o registrado
→ principal_type = SHARED_DEVICE

registro personal autenticado sin vinculación técnica de dispositivo
→ principal_type = HUMAN_USER
```

Cuando exista una vinculación contradictoria o múltiple:

```text
principal_status = INVALID
```

hasta resolver la ambigüedad.

No se utilizarán como criterio único:

- dominio del correo;
- prefijo del correo;
- nombre visible;
- metadata editable por usuario;
- user agent;
- ruta de acceso;
- aplicación abierta;
- IP;
- `navigation_role`;
- sede del dispositivo enviada por el cliente.

---

#### 21. Servicios y credenciales privilegiadas

La detección de una credencial privilegiada no será suficiente para construir
un servicio empresarial autorizado.

Separación:

```text
CREDENCIAL TÉCNICA
→ autentica el principal SYSTEM_SERVICE

IDENTIDAD DEL PROCESO
→ identifica el servicio, job o integración

ACTOR EFECTIVO
→ sistema o empleado delegado

AUTORIZACIÓN
→ valida la operación exacta
```

No se permitirá:

```text
service_role detectado
→ propietario
```

ni:

```text
service_role detectado
→ ALLOW general
```

ni:

```text
Edge Function
→ servicio confiable por nombre
```

La autenticación del servicio deberá incluir controles de entorno,
procedencia y credencial definidos por el adaptador o proceso propietario.

---

#### 22. Relación con `actor_effective`

Esta tarea no define el nodo `actor_effective`.

Solo establece la entrada necesaria para resolverlo en AUTH-CTX-006.

Relaciones esperadas:

```text
HUMAN_USER
→ puede resolver EMPLOYEE o CUSTOMER

SHARED_DEVICE
→ requiere sesión de actor para resolver EMPLOYEE

SYSTEM_SERVICE
→ puede resolver SYSTEM o delegación explícita

ANONYMOUS
→ normalmente UNRESOLVED para acciones empresariales
```

Regla:

```text
principal_type
no determina automáticamente
actor_type
```

No se definirán todavía:

- `actor_id`;
- `attribution_source`;
- `delegation_id`;
- reglas completas de atribución;
- actor de dispositivo;
- actor de servicio;
- actor de cliente.

Todo ello corresponde a AUTH-CTX-006.

---

#### 23. Relación con `domain_identity`

Esta tarea no selecciona la identidad empresarial usada por la aplicación.

Un mismo `HUMAN_USER` podrá estar vinculado con:

```text
EMPLOYEE
+
CUSTOMER
```

El `principal` no elegirá una de ellas mediante fallback.

La selección deberá considerar:

- aplicación solicitante;
- dominio funcional;
- operación;
- vínculo empresarial vigente;
- estado de la identidad;
- compatibilidad del dominio.

La definición completa pertenece a AUTH-CTX-007.

---

#### 24. Relación con Supabase Auth y RLS

`principal` documenta la autenticación observada, pero no reemplaza los
mecanismos técnicos de Supabase.

Reglas:

1. `auth.uid()` seguirá siendo el sujeto técnico de una sesión de usuario
   cuando corresponda;
2. `principal.auth_user_id` deberá coincidir con el sujeto validado;
3. `principal` no modifica `auth.uid()`;
4. `principal` no crea sesión;
5. `principal` no renueva tokens;
6. `principal` no revoca tokens;
7. `principal` no modifica claims;
8. `principal` no concede bypass RLS;
9. una función `SECURITY DEFINER` deberá validar internamente principal,
   identidad, actor y autorización según su contrato;
10. un cliente con `service_role` deberá permanecer exclusivamente en
    servidor;
11. una respuesta serializada no se convertirá en prueba suficiente para una
    mutación posterior;
12. cada operación sensible deberá volver a utilizar un contexto vigente o
    una referencia de contexto validada.

---

#### 25. Exposición segura al cliente

El contrato canónico completo podrá existir en servidor, pero las
proyecciones enviadas al cliente deberán aplicar minimización.

Datos que no deberán exponerse:

- access token;
- refresh token;
- JWT completo;
- API key;
- secret key;
- service role key;
- claims internos innecesarios;
- identificadores de credenciales reutilizables;
- datos del proveedor que permitan escalar privilegios;
- detalles internos de validación criptográfica.

`auth_user_id` y `session_id` podrán:

- permanecer solo en servidor;
- enviarse enmascarados;
- omitirse de una proyección no autoritativa;
- sustituirse por referencias seguras de correlación.

La proyección de interfaz no modifica el contrato autoritativo interno.

---

#### 26. Auditoría

La resolución del principal deberá permitir auditar, como mínimo:

- `context_id`;
- `resolved_at`;
- `principal_type`;
- `principal_status`;
- `authenticated`;
- `authentication_method`;
- referencia segura del sujeto técnico;
- referencia segura de sesión o ejecución;
- fuente de resolución;
- versión del resolver;
- inconsistencias detectadas.

No se registrarán:

- tokens;
- secretos;
- contraseñas;
- códigos OTP;
- magic links;
- API keys completas;
- refresh tokens;
- headers sensibles completos.

Los logs técnicos y la auditoría empresarial deberán conservar objetivos
diferentes.

---

#### 27. Problemas estructurales relacionados

AUTH-CTX-005 no congela el catálogo definitivo de `structural_issues`.

Ese catálogo corresponde a AUTH-CTX-015.

Sin embargo, la resolución deberá poder representar situaciones como:

```text
unauthenticated
credential_invalid
session_expired
session_revoked
unsupported_principal
principal_classification_ambiguous
auth_subject_missing
auth_subject_mismatch
shared_device_auth_link_missing
service_execution_untrusted
principal_contract_inconsistent
```

Estos nombres son ejemplos de trabajo y no sustituyen la definición final de
AUTH-CTX-015.

Regla de severidad:

```text
principal INVALID
→ bloquea todas las evaluaciones privadas

principal ANONYMOUS
→ bloquea aplicaciones laborales y operaciones no públicas

principal VALID
→ permite continuar la resolución, pero no concede autorización
```

---

#### 28. Resolución canónica

Orden conceptual:

```text
1. Obtener evidencia técnica de la solicitud.
2. Verificar la credencial en servidor.
3. Determinar si existe principal autenticado o anónimo.
4. Clasificar HUMAN_USER, SHARED_DEVICE o SYSTEM_SERVICE.
5. Resolver auth_user_id cuando aplique.
6. Resolver referencia segura de sesión o ejecución.
7. Normalizar authentication_method.
8. Resolver authenticated_at y session_expires_at.
9. Determinar principal_status.
10. Verificar invariantes internas.
11. Registrar problemas estructurales.
12. Congelar el nodo principal dentro del AccessContext.
13. Continuar hacia actor_effective.
```

No se resolverá en esta etapa:

- empleado;
- cliente;
- actor humano de dispositivo;
- rol;
- turno;
- check-in;
- sede;
- área;
- permiso;
- recurso;
- decisión.

---

#### 29. Casos canónicos

##### 29.1 Persona autenticada válida

```ts
{
  principal_type: "HUMAN_USER",
  auth_user_id: "auth-user-uuid",
  session_id: "opaque-session-reference",
  authenticated: true,
  authentication_method: "PASSWORD",
  authenticated_at: "2026-07-21T12:00:00Z",
  session_expires_at: "2026-07-21T13:00:00Z",
  principal_status: "VALID"
}
```

Interpretación:

```text
Autenticación válida.
Identidad laboral todavía no resuelta.
Actor efectivo todavía no resuelto.
Autorización todavía no evaluada.
```

##### 29.2 Dispositivo compartido autenticado

```ts
{
  principal_type: "SHARED_DEVICE",
  auth_user_id: "technical-auth-user-uuid",
  session_id: "opaque-device-auth-session",
  authenticated: true,
  authentication_method: "DEVICE_CREDENTIAL",
  authenticated_at: "2026-07-21T12:00:00Z",
  session_expires_at: "2026-07-21T20:00:00Z",
  principal_status: "VALID"
}
```

Interpretación:

```text
El usuario técnico es válido.
El dispositivo empresarial debe resolverse después.
El trabajador actor debe resolverse después.
```

##### 29.3 Servicio autenticado

```ts
{
  principal_type: "SYSTEM_SERVICE",
  auth_user_id: null,
  session_id: "safe-job-execution-reference",
  authenticated: true,
  authentication_method: "INTERNAL_JOB",
  authenticated_at: "2026-07-21T12:00:00Z",
  session_expires_at: null,
  principal_status: "VALID"
}
```

Interpretación:

```text
La ejecución técnica fue autenticada.
La operación empresarial todavía requiere identidad del proceso,
actor y autorización.
```

##### 29.4 Solicitud anónima

```ts
{
  principal_type: "ANONYMOUS",
  auth_user_id: null,
  session_id: null,
  authenticated: false,
  authentication_method: null,
  authenticated_at: null,
  session_expires_at: null,
  principal_status: "ANONYMOUS"
}
```

##### 29.5 Sesión expirada

```ts
{
  principal_type: "HUMAN_USER",
  auth_user_id: "auth-user-uuid",
  session_id: "expired-session-reference",
  authenticated: false,
  authentication_method: "PASSWORD",
  authenticated_at: "2026-07-21T10:00:00Z",
  session_expires_at: "2026-07-21T11:00:00Z",
  principal_status: "INVALID"
}
```

No se continuará hacia una autorización privada válida.

---

#### 30. Patrones prohibidos

Quedan prohibidos:

##### 30.1 Convertir autenticación en rol

```ts
if (user) return "propietario";
```

##### 30.2 Convertir usuario técnico en empleado

```ts
employeeId = auth.uid();
```

sin una relación empresarial validada.

##### 30.3 Clasificar dispositivo por correo

```ts
email.startsWith("tablet-")
```

como única fuente autoritativa.

##### 30.4 Confiar en el body

```ts
const principalType = body.principalType;
```

##### 30.5 Tratar service role como autorización

```ts
if (isServiceRole) return ALLOW;
```

##### 30.6 Ocultar una sesión inválida mediante fallback

```text
sesión inválida
→ usar usuario guardado en cookie
```

##### 30.7 Mezclar sesión técnica y sesión de actor

```text
principal.session_id
=
device actor session
```

##### 30.8 Exponer credenciales

```ts
principal.session_id = accessToken;
```

##### 30.9 Inferir actor por navegación

```text
navigation_role
→ actor efectivo
```

##### 30.10 Conceder permisos por método de autenticación

```text
SSO
→ acceso administrativo
```

---

#### 31. Compatibilidad con decisiones aprobadas

Esta tarea conserva:

- AUTH-MOD-001 — separación entre principal, identidad y actor;
- AUTH-MOD-011 — el dispositivo técnico no reemplaza al trabajador;
- AUTH-MOD-012 — la simulación no modifica `auth.uid()` ni el actor real;
- AUTH-MOD-018 — la autenticación no altera precedencia de permisos;
- AUTH-MOD-019 — una credencial válida no neutraliza denegaciones;
- AUTH-CAT — los permisos son capacidades empresariales, no credenciales;
- AUTH-RBAC — los roles y excepciones no identifican al principal;
- AUTH-CTX-001 — forma del nodo `principal`;
- AUTH-CTX-002 — la decisión se evalúa después del contexto;
- AUTH-CTX-003 — el actor real se conserva durante simulación;
- AUTH-CTX-004 — versión `1.0.0` y reglas de compatibilidad.

No reabre ninguna decisión aprobada.

---

#### 32. Impacto contractual

Esta tarea no cambia la forma serializada aprobada.

Por tanto:

```text
contract_version = 1.0.0
schema_version   = 1.0.0
```

Se considera una precisión normativa del contenido ya diseñado, no una
adición de campo ni un cambio de significado incompatible.

Cualquier necesidad futura de agregar campos como:

- nivel de aseguramiento;
- MFA detallado;
- proveedor de identidad;
- identificador técnico de credencial;
- cadena de delegación;
- información de dispositivo cliente;

requerirá análisis de versionado según AUTH-CTX-004.

No se agregarán silenciosamente.

---

#### 33. Dependencias posteriores

##### AUTH-CTX-006

Definirá `actor_effective`, atribución, delegación y estados no resueltos.

##### AUTH-CTX-007

Definirá la identidad laboral, de cliente, dispositivo o sistema utilizada por
el dominio.

##### AUTH-CTX-014

Definirá el contexto completo del dispositivo compartido y su sesión de actor.

##### AUTH-CTX-015

Congelará razones estructuradas y severidades.

##### AUTH-CTX-025

Diseñará el contrato SQL que deberá producir este nodo.

##### AUTH-CTX-028

Definirá compatibilidad con funciones legacy.

##### AUTH-CTX-030

Definirá pruebas contractuales.

##### BLOQUE H

Materializará tipos, schemas y helpers compartidos cuando corresponda.

##### BLOQUE E3

Definirá las fuentes físicas de identidad técnica y sus relaciones.

##### BLOQUE R

Implementará migraciones, RPC, controles, transición y retiro de lógica
legacy.

---

#### 34. Fuera del alcance

AUTH-CTX-005 no:

- define `actor_effective`;
- define `domain_identity`;
- resuelve empleado;
- resuelve cliente;
- resuelve dispositivo empresarial;
- resuelve servicio empresarial;
- define rol base;
- define cobertura administrativa;
- define turno;
- define check-in;
- define rol operativo;
- define sede o área operativa;
- define la decisión final;
- agrega campos al contrato;
- cambia versiones;
- crea tipos TypeScript;
- crea JSON Schema;
- crea validadores Zod;
- crea funciones SQL;
- crea RPC;
- crea RLS;
- crea grants;
- crea triggers;
- crea migraciones;
- modifica Supabase;
- modifica aplicaciones;
- migra guards;
- cambia sesiones actuales;
- crea secretos;
- modifica Auth;
- implementa código mediante Codex.

---

#### 35. Criterios de aprobación

AUTH-CTX-005 podrá aprobarse cuando se acepte que:

1. `principal` identifica quién o qué presentó la credencial técnica;
2. principal no equivale a identidad de dominio;
3. principal no equivale a actor efectivo;
4. principal no equivale a rol ni permiso;
5. se conservan cuatro tipos: `HUMAN_USER`, `SHARED_DEVICE`,
   `SYSTEM_SERVICE` y `ANONYMOUS`;
6. se conservan los campos publicados en AUTH-CTX-001;
7. no se agrega ningún campo;
8. `auth_user_id` identifica al sujeto de Auth cuando aplica;
9. `auth_user_id` no es `employee_id`;
10. `auth_user_id` es obligatorio para persona válida;
11. `auth_user_id` es obligatorio para dispositivo compartido válido en v1;
12. `auth_user_id` puede ser nulo para servicios;
13. `session_id` es una referencia opaca no reutilizable como credencial;
14. `session_id` no contiene tokens ni secretos;
15. `authenticated` es derivado de `principal_status`;
16. `VALID` implica `authenticated = true`;
17. `INVALID` implica `authenticated = false`;
18. `ANONYMOUS` implica campos de sesión nulos;
19. una identidad empresarial inactiva no vuelve inválida la credencial;
20. un dispositivo empresarial inactivo no vuelve inválida por sí sola la
    sesión técnica;
21. un servicio autenticado no queda automáticamente autorizado;
22. la clasificación persona/dispositivo no depende solo del correo;
23. ningún dato autoritativo procede del cliente;
24. los claims se validan antes de usarse;
25. `authentication_method` se normaliza de forma segura;
26. `authenticated_at` y `session_expires_at` usan tiempo de servidor o
    evidencia técnica confiable;
27. una sesión expirada produce principal inválido;
28. `null` en expiración no significa autoridad indefinida;
29. `principal` no modifica `auth.uid()`;
30. `principal` no crea bypass RLS;
31. una proyección cliente minimiza identificadores y nunca expone secretos;
32. la auditoría conserva referencias seguras, no credenciales;
33. los problemas estructurales finales se reservan para AUTH-CTX-015;
34. la atribución del actor se reserva para AUTH-CTX-006;
35. la identidad empresarial se reserva para AUTH-CTX-007;
36. la tarea no cambia `contract_version` ni `schema_version`;
37. no se implementa código, migraciones ni cambios en Supabase.

---

#### 36. Estado final de la propuesta

| Tarea        | Estado      |
| ------------ | ----------- |
| AUTH-CTX-004 | APROBADA    |
| AUTH-CTX-005 | APROBADA    |
| AUTH-CTX-006 | NO INICIADA |

No se avanza a AUTH-CTX-006 hasta recibir aprobación explícita de
AUTH-CTX-005.


### ✅ AUTH-CTX-006 — Incluir actor efectivo

**Estado:** APROBADA  
**Bloque:** BLOQUE E — Contexto y decisión de autorización unificados  
**Naturaleza:** Refinamiento documental del nodo `actor_effective` de `AccessContext`  
**Implementación física:** No incluida  
**Tarea anterior vigente:** AUTH-CTX-005 — APROBADA  
**Tarea posterior reservada:** AUTH-CTX-007 — Incluir identidad laboral o de dominio  
**Contrato afectado:** `AccessContext@1.0.0`  
**Nodo afectado:** `actor_effective`  
**Cambio contractual:** Aclaración normativa compatible; no cambia la forma publicada  
**Cambios físicos permitidos:** No

Esta tarea define de forma exhaustiva la semántica, procedencia, atribución,
estados, consistencia y límites del actor efectivo al que Vento OS atribuye
una solicitud, consulta, comando, mutación, evento o proceso.

No modifica la estructura raíz aprobada de `AccessContext`, no agrega campos,
no cambia `contract_version`, no cambia `schema_version` y no implementa tipos,
funciones SQL, RPC, RLS, migraciones, guards, adaptadores, colas ni cambios en
Supabase.

---

#### 1. Objetivo

Definir el nodo `actor_effective` de manera que Vento OS pueda responder de
forma inequívoca:

1. a quién se atribuye empresarialmente una acción;
2. si el actor es empleado, cliente, sistema o no pudo resolverse;
3. cuál es el identificador canónico del actor;
4. qué relación válida produjo la atribución;
5. si la atribución procede de sesión personal, sesión de dispositivo,
   proceso del sistema o identidad de dominio;
6. cuándo existe una delegación explícita;
7. cuándo una identidad conocida sigue siendo atribuible aunque esté
   inactiva;
8. cuándo la ausencia, expiración o ambigüedad obliga a dejar el actor sin
   resolver;
9. cómo conservar al actor real durante simulaciones y llamadas internas;
10. qué datos no pueden utilizarse como sustituto del actor.

El nodo deberá impedir que una aplicación interprete:

```text
principal autenticado
=
actor efectivo
=
identidad de dominio
=
rol
=
permiso
```

La relación correcta será:

```text
PRINCIPAL VALIDADO
        ↓
RELACIONES EMPRESARIALES CANÓNICAS
        ↓
IDENTIDAD DE DOMINIO APLICABLE
        ↓
ACTOR EFECTIVO ÚNICO
        ↓
CONTEXTO Y ESTADO DEL ACTOR
        ↓
DECISIÓN DE AUTORIZACIÓN
```

---

#### 2. Decisión principal

El `actor_effective` identifica exclusivamente a la entidad empresarial o al
proceso interno al que se atribuye la acción evaluada.

Regla canónica:

```text
actor_effective
=
sujeto único de atribución de la acción
```

No representa por sí solo:

```text
credencial técnica
sesión Auth
rol base
rol operativo
permiso
alcance
sede
área
turno
check-in
dispositivo
resultado de autorización
sujeto simulado
```

Por tanto:

```text
actor resuelto
≠ actor activo
≠ actor autorizado
≠ permiso concedido
```

`resolved = true` significa que existe una atribución inequívoca y verificable.
No significa que el actor cumpla estado, modalidad, alcance, contexto,
prerrequisitos o permisos.

---

#### 3. Contrato vigente del nodo

Se conserva sin cambios la forma publicada en AUTH-CTX-001 y AUTH-CTX-004:

```ts
type EffectiveActorContext = {
  actor_type:
    | "EMPLOYEE"
    | "CUSTOMER"
    | "SYSTEM"
    | "UNRESOLVED";

  actor_id: string | null;

  attribution_source:
    | "PERSONAL_SESSION"
    | "DEVICE_ACTOR_SESSION"
    | "SYSTEM_PROCESS"
    | "DOMAIN_IDENTITY"
    | "NONE";

  delegation_id: string | null;
  resolved: boolean;
};
```

No se agregan campos en esta tarea.

La publicación permanece:

```text
AccessContext
contract_version = 1.0.0
schema_version   = 1.0.0
```

---

#### 4. Separación entre principal, identidad y actor

Los tres conceptos son independientes:

| Concepto          | Pregunta que responde                                  |
| ----------------- | ------------------------------------------------------ |
| `principal`       | ¿Quién o qué presentó la credencial técnica?           |
| `domain_identity` | ¿Qué entidad empresarial representa para este dominio? |
| `actor_effective` | ¿A quién se atribuye esta acción concreta?             |

Ejemplo de dispositivo compartido:

```text
principal
→ dispositivo técnico

domain_identity
→ identidad de dispositivo

actor_effective
→ empleado que abrió una sesión de actor válida
```

Ejemplo de sesión personal laboral:

```text
principal
→ usuario humano autenticado

domain_identity
→ empleado

actor_effective
→ ese empleado
```

Ejemplo de Vento Pass:

```text
principal
→ usuario humano autenticado

domain_identity
→ cliente

actor_effective
→ ese cliente
```

Ejemplo de proceso autónomo:

```text
principal
→ servicio técnico

domain_identity
→ proceso interno del sistema

actor_effective
→ sistema identificado
```

El orden de los campos dentro del objeto serializado no impone el orden de
resolución. La implementación deberá resolver las relaciones necesarias antes
de construir el snapshot final.

---

#### 5. Fuente de verdad

El actor efectivo deberá resolverse exclusivamente en servidor mediante
relaciones canónicas y vigentes.

Fuentes conceptuales permitidas:

| Caso                               | Fuente de atribución                                          |
| ---------------------------------- | ------------------------------------------------------------- |
| Empleado en sesión personal        | Relación única entre principal humano e identidad laboral     |
| Cliente en Pass                    | Identidad de cliente válida para el dominio Pass              |
| Empleado en dispositivo compartido | Sesión de actor única y vigente del dispositivo               |
| Sistema autónomo                   | Proceso interno identificado y autorizado por contrato        |
| Empleado delegado por un proceso   | Delegación explícita, vigente y verificable                   |
| Actor no resoluble                 | Ausencia o contradicción comprobada de las fuentes anteriores |

No serán fuente de verdad:

- `auth.uid()` interpretado directamente como `employee_id`;
- correo, nombre o documento enviado por el cliente;
- `employees.role`;
- rol operativo;
- `navigation_role`;
- sede o área seleccionada;
- perfil operativo predeterminado;
- último turno conocido;
- último empleado que utilizó el dispositivo;
- cookie no firmada;
- `localStorage`;
- estado de React;
- body o query parameter con `actor_id`;
- identidad simulada;
- nombre libre de proceso;
- uso de `service_role`;
- información inferida desde logs históricos.

---

#### 6. Cardinalidad y unicidad

Cada `AccessContext` tendrá exactamente un nodo `actor_effective`.

La atribución podrá producir:

```text
un actor exacto
```

O:

```text
UNRESOLVED
```

No podrá producir:

- una lista de actores;
- actor principal y actor secundario;
- actor humano y sistema simultáneamente;
- actor inferido por prioridad arbitraria;
- actor combinado a partir de varios roles;
- actor elegido por el frontend.

Ante dos o más candidatos válidos sin una regla canónica que determine uno:

```text
AMBIGÜEDAD
→ actor_type = UNRESOLVED
→ resolved = false
→ denegar operaciones que requieran actor
```

No se escogerá silenciosamente:

- el registro más reciente;
- el primero por orden de consulta;
- el empleado activo con mayor privilegio;
- el actor de la última sesión;
- el actor asociado a la sede seleccionada.

---

#### 7. `actor_type`

Valores congelados en `AccessContext@1.0.0`:

```text
EMPLOYEE
CUSTOMER
SYSTEM
UNRESOLVED
```

El valor representa la clase de entidad a la que se atribuye la acción.

No se utilizarán como `actor_type`:

```text
HUMAN_USER
SHARED_DEVICE
SYSTEM_SERVICE
propietario
gerente_general
cajero_satelite
bodeguero
dispositivo
rol
aplicación
proveedor externo
```

Los tipos del principal y los tipos del actor pertenecen a capas diferentes.

---

#### 8. Actor `EMPLOYEE`

Representa a un trabajador canónico de Vento al que se atribuye la acción.

Rutas permitidas en v1:

```text
HUMAN_USER
+ relación laboral inequívoca
→ EMPLOYEE
```

```text
SHARED_DEVICE
+ sesión de actor válida
+ employee vinculado
→ EMPLOYEE
```

```text
SYSTEM_SERVICE
+ delegación explícita válida
+ employee objetivo inequívoco
→ EMPLOYEE
```

Reglas:

1. `actor_id` contiene el identificador canónico del empleado.
2. No contiene `auth_user_id` salvo coincidencia accidental de valores.
3. No contiene código de rol.
4. No se deriva del turno.
5. No se deriva de `navigation_role`.
6. No se deriva de una sede o área.
7. La inactividad del empleado no borra necesariamente su identidad para
   auditoría.
8. Un empleado conocido pero inactivo puede permanecer como actor resuelto,
   mientras la autorización laboral queda estructuralmente bloqueada.
9. La existencia del actor no activa carril base ni operativo.
10. Los permisos se evaluarán después y siempre contra el estado vigente.

Regla crítica:

```text
EMPLOYEE resuelto
+
employee inactivo
=
atribución conocida
+
autorización laboral denegada
```

Esto evita perder la identidad de quien intentó ejecutar una acción sin
convertir esa identidad en autoridad.

---

#### 9. Actor `CUSTOMER`

Representa a un cliente del dominio Vento Pass al que se atribuye la acción.

Ruta permitida en v1:

```text
HUMAN_USER
+ identidad de cliente aplicable al dominio Pass
→ CUSTOMER
```

Reglas:

1. `actor_id` contiene el identificador canónico del cliente.
2. Un cliente no se convierte en empleado.
3. Un empleado que también sea cliente utiliza `CUSTOMER` cuando la acción
   pertenece al dominio cliente.
4. El hecho de tener ambas identidades no crea dos actores simultáneos.
5. La aplicación o contrato del proceso determina la identidad aceptada.
6. La identidad laboral no tiene precedencia automática sobre la de cliente.
7. La identidad de cliente no concede acceso a aplicaciones laborales.
8. Un cliente inactivo puede seguir siendo identificable para auditoría, pero
   no obtiene autoridad por ello.
9. La autorización específica de Pass se evalúa después.

Cuando un principal humano tenga simultáneamente identidad laboral y de
cliente:

```text
aplicación laboral
→ actor EMPLOYEE

Vento Pass cliente
→ actor CUSTOMER
```

Si el dominio consumidor admite más de una identidad y no define una regla
inequívoca:

```text
actor = UNRESOLVED
```

La selección no se delegará al frontend.

---

#### 10. Actor `SYSTEM`

Representa un proceso interno autónomo de Vento identificado y autorizado para
producir una acción empresarial sin actuar en nombre de un empleado.

Condiciones mínimas:

```text
principal técnico válido
+
ejecución en frontera confiable
+
proceso interno identificado
+
operación incluida en su contrato
→ SYSTEM
```

Reglas:

1. `actor_id` será un identificador estable del proceso interno.
2. No será una clave secreta, token, service role ni hash de credencial.
3. No será un texto libre enviado por el cliente.
4. No será el nombre del proveedor externo sin un adaptador interno.
5. No tendrá rol base.
6. No tendrá rol operativo.
7. No heredará permisos de propietario ni gerente.
8. Deberá evaluarse mediante capacidades técnicas o contratos empresariales
   explícitos.
9. Toda acción deberá poder atribuirse al proceso exacto.
10. Un proceso desconocido no se degrada a un sistema genérico autorizado.

Ejemplos conceptuales posibles:

- cierre programado;
- reconciliación interna;
- sincronización aprobada;
- trigger empresarial gobernado;
- job de mantenimiento;
- adaptador de integración.

El catálogo físico de procesos se definirá posteriormente.

---

#### 11. Actor `UNRESOLVED`

Representa que no existe una atribución empresarial única y confiable para la
solicitud.

Forma obligatoria:

```text
actor_type         = UNRESOLVED
actor_id           = null
attribution_source = NONE
delegation_id      = null
resolved           = false
```

Casos típicos:

- principal anónimo;
- principal inválido;
- usuario humano sin identidad aceptada por el dominio;
- múltiples identidades candidatas sin regla de selección;
- dispositivo compartido sin sesión de actor;
- sesión de actor expirada, terminada o ambigua;
- proceso técnico no identificado;
- delegación ausente, revocada, vencida o contradictoria;
- relación laboral o de cliente no resoluble;
- datos canónicos inconsistentes.

Regla:

```text
UNRESOLVED
→ no ejecutar mutaciones empresariales
```

Podrán continuar únicamente operaciones técnicas expresamente diseñadas para
no requerir actor empresarial, por ejemplo:

- autenticación;
- obtención mínima de configuración de dispositivo;
- heartbeat;
- inicio o cierre seguro de sesión de actor;
- diagnóstico técnico autorizado.

La autorización de esas operaciones no procede de un actor humano implícito.

---

#### 12. `actor_id`

`actor_id` identifica al sujeto exacto dentro del namespace determinado por
`actor_type`.

| `actor_type` | Significado de `actor_id`                 |
| ------------ | ----------------------------------------- |
| `EMPLOYEE`   | Identificador canónico del empleado       |
| `CUSTOMER`   | Identificador canónico del cliente        |
| `SYSTEM`     | Identificador estable del proceso interno |
| `UNRESOLVED` | Siempre `null`                            |

Reglas:

1. El par `(actor_type, actor_id)` identifica el namespace correcto.
2. `actor_id` no se interpretará sin `actor_type`.
3. No se utilizará correo, documento, nombre, rol o código de sede.
4. No contendrá tokens, secretos ni credenciales.
5. No será sustituido por `auth_user_id`.
6. No será sustituido por `device_id`.
7. No será sustituido por `delegation_id`.
8. No será sustituido por `simulation_session_id`.
9. Para todo tipo resuelto será no nulo.
10. Para `UNRESOLVED` será nulo.

Una futura necesidad de namespace organizacional, multitenancy o actor externo
adicional deberá analizarse mediante las reglas de versionado. No se agregará
implícitamente en esta tarea.

---

#### 13. `attribution_source`

`attribution_source` indica qué clase de relación produjo la atribución.

Valores congelados:

```text
PERSONAL_SESSION
DEVICE_ACTOR_SESSION
SYSTEM_PROCESS
DOMAIN_IDENTITY
NONE
```

No identifica una tabla física ni obliga a conservar los nombres actuales de
Supabase.

Matriz permitida en v1:

| `actor_type` | `attribution_source` permitido                               |
| ------------ | ------------------------------------------------------------ |
| `EMPLOYEE`   | `PERSONAL_SESSION`, `DEVICE_ACTOR_SESSION`, `SYSTEM_PROCESS` |
| `CUSTOMER`   | `DOMAIN_IDENTITY`                                            |
| `SYSTEM`     | `SYSTEM_PROCESS`                                             |
| `UNRESOLVED` | `NONE`                                                       |

Cualquier combinación diferente será inconsistente y deberá fallar de forma
cerrada.

---

#### 14. `PERSONAL_SESSION`

Indica que una sesión humana personal se vinculó inequívocamente con el
empleado que actúa.

Contrato conceptual:

```text
principal HUMAN_USER válido
+
relación laboral canónica
→ actor EMPLOYEE
→ source PERSONAL_SESSION
```

Reglas:

1. La sesión debe pertenecer al mismo sujeto Auth resuelto en `principal`.
2. La relación laboral debe ser única.
3. El actor no se selecciona mediante rol.
4. El actor no se selecciona mediante sede activa.
5. El uso posterior de un cliente administrativo de Supabase no cambia esta
   atribución.
6. Una Server Action iniciada por el usuario conserva al empleado como actor.
7. Una RPC privilegiada no reemplaza al actor por `SYSTEM`.
8. Si la acción cruza una frontera asíncrona, deberá aplicarse la regla de
   proceso autónomo o delegación explícita.

---

#### 15. `DEVICE_ACTOR_SESSION`

Indica que un dispositivo técnico autenticado tiene una sesión empresarial de
actor única, vigente y verificable.

Contrato conceptual:

```text
principal SHARED_DEVICE válido
+
dispositivo empresarial resoluble
+
sesión de actor vigente
+
empleado exacto
→ actor EMPLOYEE
→ source DEVICE_ACTOR_SESSION
```

Reglas:

1. El principal sigue siendo el dispositivo.
2. El actor sigue siendo el empleado.
3. El `actor_id` no será el `device_id`.
4. `delegation_id` permanece nulo.
5. El identificador de la sesión de actor pertenecerá a `device_context`, no a
   `delegation_id`.
6. El último actor conocido no es fallback.
7. Una sesión expirada o terminada no produce actor vigente.
8. Dos sesiones activas incompatibles producen `UNRESOLVED`.
9. El PIN, QR o mecanismo de activación identifica una sesión; no se conserva
   como credencial dentro del contexto.
10. La política del dispositivo puede restringir actores, pero no convertir
    al dispositivo en actor humano.
11. El actor conserva sus denegaciones, estado, turno, check-in y permisos.
12. El dispositivo nunca elimina restricciones del empleado.

La semántica detallada de `device_context` y la sesión se completará en
AUTH-CTX-014.

---

#### 16. `SYSTEM_PROCESS`

Indica que la atribución procede de un proceso interno confiable.

Admite dos resultados diferentes:

##### 16.1 Proceso autónomo

```text
actor_type         = SYSTEM
attribution_source = SYSTEM_PROCESS
delegation_id      = null
```

El proceso actúa bajo su propio contrato técnico y empresarial.

##### 16.2 Proceso delegado

```text
actor_type         = EMPLOYEE
attribution_source = SYSTEM_PROCESS
delegation_id      = identificador válido
```

El proceso ejecuta una acción atribuida al empleado dentro de una delegación
explícita.

Reglas comunes:

1. La identidad del proceso debe ser estable.
2. El proceso debe ejecutarse en una frontera de servidor confiable.
3. La acción exacta deberá estar permitida para el proceso o la delegación.
4. Un job no se vuelve autorizado solo porque se ejecute con `service_role`.
5. La atribución no se deriva del creador de una fila ni del último usuario.
6. Un reintento conserva la misma semántica de actor.
7. Una llamada interna no podrá cambiar silenciosamente de empleado a sistema.
8. La frontera asíncrona deberá declarar si conserva delegación o se convierte
   en proceso autónomo.

---

#### 17. `DOMAIN_IDENTITY`

Indica que el actor se atribuye a una identidad empresarial aceptada por el
dominio consumidor, sin tratarla como identidad laboral.

En `AccessContext@1.0.0` se utilizará para:

```text
actor_type = CUSTOMER
```

Reglas:

1. La identidad deberá ser canónica y única.
2. La aplicación deberá aceptar identidad de cliente.
3. La selección se resolverá en servidor.
4. La coexistencia de perfil de empleado no cambia al actor del dominio Pass.
5. La identidad del cliente no se traslada a aplicaciones laborales.
6. Un claim técnico `role = client` no sustituye la relación empresarial.
7. La identidad inactiva se conserva para atribución cuando sea inequívoca,
   pero bloquea la autoridad correspondiente.

AUTH-CTX-007 definirá el nodo completo de identidad de dominio.

---

#### 18. `NONE`

`NONE` se utiliza exclusivamente cuando no existe actor efectivo resuelto.

Consistencia obligatoria:

```text
attribution_source = NONE
↔ actor_type = UNRESOLVED
↔ actor_id = null
↔ delegation_id = null
↔ resolved = false
```

No se utilizará `NONE` para:

- sistema autónomo;
- empleado inactivo pero identificado;
- cliente inactivo pero identificado;
- sesión personal válida;
- dispositivo con actor válido;
- proceso delegado válido.

---

#### 19. `delegation_id`

`delegation_id` representa una delegación empresarial explícita mediante la
cual un proceso del sistema ejecuta una acción atribuida a un empleado.

Uso permitido en v1:

```text
actor_type         = EMPLOYEE
attribution_source = SYSTEM_PROCESS
delegation_id      = no nulo
```

En todos los demás casos:

```text
delegation_id = null
```

No se utilizará para representar:

- sesión Auth;
- sesión de dispositivo;
- turno;
- check-in;
- simulación;
- correlation ID;
- idempotency key;
- job ID;
- mensaje de cola;
- usuario que programó una tarea;
- autorización implícita.

Una delegación válida deberá poder demostrar conceptualmente:

- actor empleado exacto;
- proceso delegado exacto;
- propósito u operación permitida;
- vigencia;
- estado no revocado;
- alcance permitido;
- origen autorizado;
- trazabilidad de creación;
- imposibilidad de ampliación por el consumidor.

Reglas:

1. No existen delegaciones implícitas.
2. No existen cadenas transitivas de delegación en v1.
3. Un rol no puede delegar por sí mismo.
4. Un dispositivo no puede delegar autoridad.
5. El frontend no crea delegaciones autoritativas.
6. La delegación no copia todos los permisos del empleado.
7. La delegación no neutraliza denegaciones.
8. La delegación no conserva autoridad si el empleado queda inactivo.
9. La autorización exacta deberá reevaluarse al ejecutar.
10. Una delegación vencida, revocada o contradictoria no produce fallback a
    `SYSTEM`.
11. Si el proceso puede ejecutar autónomamente, deberá usar un contrato de
    sistema separado y no reutilizar una delegación fallida.

La estructura física de delegaciones se definirá en bloques posteriores si
existen procesos que realmente la requieran.

---

#### 20. `resolved`

`resolved` indica únicamente si la atribución del actor es inequívoca.

Reglas:

```text
resolved = true
→ actor_type != UNRESOLVED
→ actor_id != null
→ attribution_source != NONE
```

```text
resolved = false
→ actor_type = UNRESOLVED
→ actor_id = null
→ attribution_source = NONE
→ delegation_id = null
```

`resolved` no significa:

- identidad activa;
- empleado activo;
- cliente activo;
- dispositivo activo;
- turno válido;
- check-in válido;
- permiso existente;
- alcance coincidente;
- autorización concedida.

Ejemplo:

```text
actor EMPLOYEE conocido
employee.is_active = false
resolved = true
final_decision = DENY
```

La actividad y validez del actor se expresarán mediante los demás nodos,
`lane_readiness`, problemas estructurales y la decisión posterior.

---

#### 21. Matriz de consistencia

| Actor               | ID       | Fuente                 | Delegación | `resolved` | Consistencia   |
| ------------------- | -------- | ---------------------- | ---------- | ---------: | -------------- |
| `EMPLOYEE`          | empleado | `PERSONAL_SESSION`     | `null`     |     `true` | Válida         |
| `EMPLOYEE`          | empleado | `DEVICE_ACTOR_SESSION` | `null`     |     `true` | Válida         |
| `EMPLOYEE`          | empleado | `SYSTEM_PROCESS`       | no nula    |     `true` | Válida         |
| `CUSTOMER`          | cliente  | `DOMAIN_IDENTITY`      | `null`     |     `true` | Válida         |
| `SYSTEM`            | proceso  | `SYSTEM_PROCESS`       | `null`     |     `true` | Válida         |
| `UNRESOLVED`        | `null`   | `NONE`                 | `null`     |    `false` | Válida         |
| `EMPLOYEE`          | `null`   | cualquiera             | cualquiera | cualquiera | Inválida       |
| `CUSTOMER`          | cliente  | `PERSONAL_SESSION`     | `null`     |     `true` | Inválida en v1 |
| `SYSTEM`            | proceso  | `NONE`                 | `null`     |     `true` | Inválida       |
| `UNRESOLVED`        | no nulo  | `NONE`                 | `null`     |    `false` | Inválida       |
| Cualquier resuelto  | ID       | `NONE`                 | cualquiera |     `true` | Inválida       |
| `EMPLOYEE` delegado | empleado | `SYSTEM_PROCESS`       | `null`     |     `true` | Inválida       |

Una combinación inválida deberá registrarse como problema estructural y no
normalizarse automáticamente.

Los códigos finales de problemas se congelarán en AUTH-CTX-015.

---

#### 22. Relación con `principal`

Matriz conceptual:

| `principal_type` | Actores permitidos                   |
| ---------------- | ------------------------------------ |
| `HUMAN_USER`     | `EMPLOYEE`, `CUSTOMER`, `UNRESOLVED` |
| `SHARED_DEVICE`  | `EMPLOYEE`, `UNRESOLVED`             |
| `SYSTEM_SERVICE` | `SYSTEM`, `EMPLOYEE`, `UNRESOLVED`   |
| `ANONYMOUS`      | `UNRESOLVED`                         |

Reglas:

1. `HUMAN_USER` no implica automáticamente `EMPLOYEE`.
2. `SHARED_DEVICE` nunca produce actor `SYSTEM` para operaciones
   empresariales humanas.
3. `SYSTEM_SERVICE` solo produce `EMPLOYEE` mediante delegación explícita.
4. `ANONYMOUS` nunca produce actor resuelto.
5. Principal inválido no produce actor efectivo confiable.
6. El uso interno de credenciales privilegiadas no sustituye al principal
   original de una solicitud humana.
7. Una misma acción conserva la cadena de atribución desde el principal hasta
   el actor.

---

#### 23. Relación con `domain_identity`

`domain_identity` determina qué identidad empresarial es aplicable para el
proceso o aplicación.

Consistencia mínima:

```text
actor_type = EMPLOYEE
→ domain_identity debe ser EMPLOYEE
→ actor_id debe coincidir con identity_id
```

```text
actor_type = CUSTOMER
→ domain_identity debe ser CUSTOMER
→ actor_id debe coincidir con identity_id
```

```text
actor_type = SYSTEM
→ domain_identity debe representar SYSTEM cuando el contrato la requiera
```

```text
actor_type = UNRESOLVED
→ domain_identity puede ser null o inválida
→ nunca se inventa actor desde otra identidad disponible
```

Una persona con varias identidades no produce varias atribuciones.

La aplicación o el contrato empresarial deberá declarar qué identidad acepta.
AUTH-CTX-007 definirá su forma, estado y reglas completas.

---

#### 24. Relación con `employee`

Cuando:

```text
actor_type = EMPLOYEE
```

será obligatorio que:

```text
employee != null
employee.employee_id = actor_effective.actor_id
```

Reglas:

1. El nodo `employee` conserva el estado laboral.
2. `actor_effective` conserva la atribución.
3. La inactividad se representa en `employee`, no cambiando el actor a
   `UNRESOLVED` cuando la identidad exacta sí es conocida.
4. Un empleado inexistente o una relación ambigua sí producen
   `UNRESOLVED`.
5. La ausencia de rol base no borra al actor, pero invalida el carril que lo
   requiera.
6. Los permisos individuales no participan en la resolución del actor.
7. Las sedes y áreas no participan en la identidad del actor.
8. El turno no determina quién es el empleado.

---

#### 25. Relación con `device_context`

Cuando:

```text
principal = SHARED_DEVICE
actor_type = EMPLOYEE
```

será obligatorio que `device_context` pueda demostrar:

- dispositivo exacto;
- estado del dispositivo;
- sesión de actor exacta;
- compatibilidad temporal;
- empleado vinculado;
- ausencia de ambigüedad;
- integridad del cierre o expiración.

El `actor_effective` no duplicará:

- `device_id`;
- `actor_session_id`;
- plantilla;
- políticas del dispositivo;
- aplicaciones habilitadas;
- PIN;
- rol de navegación.

La ausencia de actor no se resolverá mediante:

```text
navigation_role
último actor
empleado de la sede
rol predeterminado
usuario técnico modelado como empleado
```

AUTH-CTX-014 completará este nodo.

---

#### 26. Service role y privilegios internos

El uso de una credencial `service_role`, un cliente administrativo, una RPC
`SECURITY DEFINER` o una función privilegiada describe el mecanismo técnico de
ejecución.

No redefine al actor.

##### Solicitud iniciada por humano

```text
principal original = HUMAN_USER
actor efectivo     = EMPLOYEE o CUSTOMER
cliente interno    = service_role
```

El actor permanece humano.

##### Operación autónoma

```text
principal = SYSTEM_SERVICE
actor     = SYSTEM
```

##### Operación delegada

```text
principal      = SYSTEM_SERVICE
actor          = EMPLOYEE
delegation_id  = obligatorio
```

Patrón prohibido:

```text
createAdminClient()
→ actor SYSTEM automático
→ operación permitida
```

El privilegio técnico nunca sustituye la autorización empresarial.

---

#### 27. Simulación

La simulación conserva siempre al actor real.

```text
actor efectivo real
≠ sujeto simulado
```

Ejemplo:

```text
principal real      = HUMAN_USER
actor_effective     = EMPLOYEE administrador
simulated_subject   = cajero_satelite hipotético
```

Reglas:

1. El sujeto simulado no se escribe en `actor_effective`.
2. La simulación no cambia `actor_id`.
3. La simulación no cambia `attribution_source`.
4. La simulación no crea `delegation_id`.
5. La auditoría se atribuye al actor real.
6. Un resultado `WOULD_ALLOW` no convierte al sujeto simulado en actor.
7. Una sesión de simulación no puede abrir sesión de dispositivo en nombre del
   sujeto simulado.
8. Ninguna mutación real se ejecuta como sujeto simulado.

---

#### 28. Identidades inactivas y estados inválidos

La resolución de atribución y la validez para autorizar son dimensiones
diferentes.

##### Identidad exacta pero inactiva

```text
actor conocido
→ resolved = true
→ actor_type específico
→ estado inactivo en nodo de identidad
→ carril o dominio inválido
→ DENY
```

Aplica a:

- empleado inactivo en sesión personal;
- cliente inactivo en Pass;
- empleado identificado mediante una sesión de actor válida pero laboralmente
  inactivo.

##### Relación no confiable o no vigente

```text
actor no confiable
→ UNRESOLVED
```

Aplica a:

- sesión de actor expirada;
- delegación vencida;
- múltiples empleados candidatos;
- vínculo Auth duplicado;
- proceso desconocido;
- identidad no aceptada por el dominio.

Regla:

```text
inactividad conocida
≠ actor desconocido
```

La inactividad no reactiva permisos ni permite mutaciones.

---

#### 29. Procesos asíncronos, colas y llamadas internas

Una frontera asíncrona no podrá perder ni reinventar la atribución.

Antes de encolar o diferir una acción deberá definirse expresamente uno de dos
modelos:

##### Modelo A — Proceso autónomo

```text
la acción futura pertenece al sistema
→ actor SYSTEM
→ contrato propio
```

##### Modelo B — Ejecución delegada

```text
la acción futura continúa atribuida al empleado
→ actor EMPLOYEE
→ delegation_id obligatorio
→ revalidación al ejecutar
```

No se permitirá:

```text
usuario inicia acción
→ job usa service_role
→ actor se pierde
→ sistema actúa sin contrato
```

Ni:

```text
usuario inició el proceso una vez
→ todos los reintentos futuros conservan permisos indefinidamente
```

Los reintentos deberán conservar idempotencia y trazabilidad, pero no omitir
la revalidación de estado, denegaciones, permiso, alcance y vigencia cuando
corresponda.

Las colas físicas se diseñarán en BLOQUE E4 y las integraciones en BLOQUE X.

---

#### 30. Resolución canónica

Orden conceptual:

```text
### 1. Validar principal

### 2. Identificar dominio o proceso consumidor

### 3. Resolver identidades empresariales candidatas

### 4. Aplicar la identidad aceptada por el dominio

### 5. Resolver la fuente de atribución

### 6. Verificar unicidad y vigencia de la relación de atribución

### 7. Construir actor_type y actor_id

### 8. Resolver delegation_id cuando corresponda

### 9. Validar matriz de consistencia

### 10. Marcar resolved

### 11. Resolver los demás nodos del contexto

### 12. Registrar problemas estructurales

### 13. Evaluar autorización exacta posteriormente
```

La resolución del actor no consultará grants para decidir quién es el actor.

---

#### 31. Casos canónicos

##### 31.1 Empleado en sesión personal activa

```text
principal_type      = HUMAN_USER
actor_type          = EMPLOYEE
actor_id            = employee_id
attribution_source  = PERSONAL_SESSION
delegation_id       = null
resolved            = true
```

Los permisos se evalúan después.

##### 31.2 Empleado inactivo en sesión personal

```text
principal válido
actor EMPLOYEE conocido
resolved = true
employee.is_active = false
base readiness = INVALID
operational readiness = INVALID
```

Resultado posterior:

```text
DENY
```

##### 31.3 Cliente de Pass

```text
principal_type      = HUMAN_USER
actor_type          = CUSTOMER
actor_id            = customer_id
attribution_source  = DOMAIN_IDENTITY
delegation_id       = null
resolved            = true
```

No existe autoridad laboral.

##### 31.4 Persona con perfil de empleado y cliente

En NEXO:

```text
actor_type = EMPLOYEE
```

En Vento Pass cliente:

```text
actor_type = CUSTOMER
```

No se fusionan las identidades.

##### 31.5 Dispositivo con actor válido

```text
principal_type      = SHARED_DEVICE
actor_type          = EMPLOYEE
actor_id            = employee_id
attribution_source  = DEVICE_ACTOR_SESSION
delegation_id       = null
resolved            = true
```

El dispositivo y el actor se auditan simultáneamente.

##### 31.6 Dispositivo sin actor

```text
principal_type      = SHARED_DEVICE
actor_type          = UNRESOLVED
actor_id            = null
attribution_source  = NONE
delegation_id       = null
resolved            = false
```

Solo operaciones técnicas explícitas.

##### 31.7 Dos sesiones de actor incompatibles

```text
actor_type = UNRESOLVED
resolved = false
```

No se selecciona la más reciente automáticamente.

##### 31.8 Job autónomo

```text
principal_type      = SYSTEM_SERVICE
actor_type          = SYSTEM
actor_id            = system_process_id
attribution_source  = SYSTEM_PROCESS
delegation_id       = null
resolved            = true
```

La operación requiere contrato propio.

##### 31.9 Job delegado a empleado

```text
principal_type      = SYSTEM_SERVICE
actor_type          = EMPLOYEE
actor_id            = employee_id
attribution_source  = SYSTEM_PROCESS
delegation_id       = delegation_id
resolved            = true
```

La autorización del empleado se reevalúa.

##### 31.10 Delegación vencida

```text
actor_type = UNRESOLVED
resolved = false
```

No existe fallback a actor `SYSTEM`.

##### 31.11 Server Action humana que usa service role

```text
principal_type = HUMAN_USER
actor_type     = EMPLOYEE
```

El mecanismo privilegiado interno no cambia la atribución.

##### 31.12 Simulación de otro empleado

```text
actor_effective = empleado administrador real
simulated_subject = otro empleado
```

La actividad se atribuye al administrador real.

##### 31.13 Principal anónimo

```text
principal_type      = ANONYMOUS
actor_type          = UNRESOLVED
attribution_source  = NONE
resolved            = false
```

No existe actor empresarial implícito.

---

#### 32. Fallbacks y antipatrones prohibidos

Queda prohibido:

```ts
const actorId = auth.uid();
const actor = employee ?? lastEmployee;
const actor = device.navigationRole;
const actor = request.body.employeeId;
const actor = simulatedEmployee;
const actor = createdBy ?? currentUser;
const actorType = adminClient ? "SYSTEM" : "EMPLOYEE";
```

También queda prohibido:

```text
auth_user_id → employee_id automático
rol base → actor
rol operativo → actor
turno → identidad del actor
sede seleccionada → actor
último actor del dispositivo → actor vigente
service_role → actor SYSTEM autorizado
job creado por empleado → delegación implícita
actor session expirada → último actor
sujeto simulado → actor real
usuario técnico de tablet → empleado ficticio
proveedor externo → actor interno sin adaptador
actor ambiguo → seleccionar el primero
actor inactivo → borrar atribución para ocultar el intento
```

---

#### 33. Auditoría

Toda operación sensible deberá conservar, cuando corresponda:

- `context_id`;
- principal técnico;
- tipo e identificador del actor;
- fuente de atribución;
- delegación;
- dispositivo;
- sesión de actor;
- proceso interno;
- identidad de dominio;
- empleado o cliente;
- estado aplicable;
- permiso y recurso evaluados;
- decisión final;
- timestamp de resolución;
- correlation ID separado;
- resultado de ejecución.

Reglas:

1. El principal y el actor se registran como conceptos diferentes.
2. En dispositivo compartido se registra dispositivo y empleado.
3. En proceso delegado se registra proceso, actor y delegación.
4. En simulación se registra actor real y sujeto simulado por separado.
5. Un actor no resuelto no se reemplaza por un texto genérico como
   `system`.
6. Los intentos fallidos conservan la evidencia suficiente para diagnóstico.
7. No se registran tokens, PIN, secretos ni credenciales completas.
8. La auditoría histórica conserva el actor resuelto en ese momento y no lo
   reescribe por cambios posteriores.

La estructura física de auditoría se definirá en los bloques correspondientes.

---

#### 34. Exposición segura al cliente

La proyección cliente deberá minimizar información.

Podrá exponer, cuando sea necesario para experiencia:

- `actor_type`;
- `resolved`;
- identificador propio del actor cuando el consumidor esté autorizado;
- fuente de atribución en una forma segura;
- estado general necesario para solicitar inicio de sesión de actor.

No deberá exponer indiscriminadamente:

- identificadores de otros empleados;
- detalles internos de delegación;
- nombres de procesos sensibles;
- relaciones candidatas descartadas;
- razones confidenciales;
- tokens o secretos;
- historial de actores de un dispositivo;
- datos personales usados para resolver identidad.

Una proyección visual no sustituye el contexto interno utilizado por el
servidor.

---

#### 35. Compatibilidad con decisiones aprobadas

Esta tarea conserva sin cambios:

- ADR-AUTH-001;
- AUTH-MOD-001 — autenticación, identidad y actor efectivo;
- AUTH-MOD-011 — dispositivos compartidos;
- AUTH-MOD-012 — simulación separada;
- AUTH-MOD-018 y AUTH-MOD-019 — carriles y denegaciones;
- AUTH-CAT — permisos no son identidades;
- AUTH-RBAC — roles y excepciones no son actores;
- AUTH-CTX-001 — forma del nodo `actor_effective`;
- AUTH-CTX-002 — la decisión se evalúa después del contexto;
- AUTH-CTX-003 — el actor real se conserva durante simulación;
- AUTH-CTX-004 — versión `1.0.0` y compatibilidad;
- AUTH-CTX-005 — principal autenticado separado del actor.

No reabre ninguna decisión aprobada.

---

#### 36. Impacto contractual

Esta tarea no cambia la forma serializada aprobada.

Por tanto:

```text
contract_version = 1.0.0
schema_version   = 1.0.0
```

Se considera una precisión normativa del contenido ya diseñado, no una
adición de campo ni un cambio incompatible.

Una futura necesidad de agregar:

- iniciador separado del actor;
- cadena de delegación;
- organización o tenant del actor;
- actor externo;
- actor de proveedor;
- nivel de confianza de atribución;
- namespace explícito;
- actor secundario;
- snapshot de delegación;

requerirá análisis de versionado según AUTH-CTX-004.

No se agregará silenciosamente.

---

#### 37. Dependencias posteriores

##### AUTH-CTX-007

Definirá `domain_identity`, identidad laboral, cliente, dispositivo y sistema,
y deberá mantener consistencia con el actor aquí aprobado.

##### AUTH-CTX-008

Definirá el rol base del empleado sin convertirlo en actor.

##### AUTH-CTX-010 a AUTH-CTX-013

Definirán el contexto operativo del actor empleado sin utilizarlo para cambiar
su identidad.

##### AUTH-CTX-014

Definirá el dispositivo compartido, la sesión de actor y su consistencia con
`DEVICE_ACTOR_SESSION`.

##### AUTH-CTX-015

Congelará códigos y severidades de problemas estructurales relacionados con
atribución ausente, inválida o ambigua.

##### AUTH-CTX-024

Definirá los datos de auditoría de la decisión.

##### AUTH-CTX-025

Diseñará el contrato SQL que deberá producir este nodo.

##### AUTH-CTX-026

Diseñará la evaluación que consumirá el actor sin reinterpretarlo.

##### AUTH-CTX-028

Definirá compatibilidad con funciones legacy que actualmente confunden
`auth.uid()`, empleado y actor.

##### AUTH-CTX-030

Definirá pruebas contractuales de todas las combinaciones válidas e inválidas.

##### BLOQUE E3

Definirá fuentes físicas, relaciones, catálogo de procesos y delegaciones si
son necesarias.

##### BLOQUE E4

Definirá colas y trabajos asíncronos preservando la atribución.

##### BLOQUE H

Materializará tipos, schemas y helpers compartidos.

##### BLOQUE R

Implementará migraciones, RPC, controles, transición y retiro de lógica
legacy.

---

#### 38. Fuera del alcance

AUTH-CTX-006 no:

- redefine `principal`;
- define completamente `domain_identity`;
- define el estado laboral completo;
- define rol base;
- define cobertura administrativa;
- define turno;
- define check-in;
- define rol operativo;
- define sede o área operativa;
- define el contrato completo de dispositivo;
- congela códigos de problemas estructurales;
- define permisos de procesos técnicos;
- crea un catálogo físico de procesos;
- crea una tabla de delegaciones;
- crea colas;
- crea jobs;
- define idempotencia completa;
- define la decisión final;
- agrega campos al contrato;
- cambia versiones;
- crea tipos TypeScript;
- crea JSON Schema;
- crea validadores Zod;
- crea funciones SQL;
- crea RPC;
- crea RLS;
- crea grants;
- crea triggers;
- crea migraciones;
- modifica Supabase;
- modifica aplicaciones;
- migra guards;
- modifica sesiones actuales;
- implementa código mediante Codex.

---

#### 39. Criterios de aprobación

AUTH-CTX-006 podrá aprobarse cuando se acepte que:

1. `actor_effective` identifica a quién se atribuye la acción;
2. principal, identidad de dominio y actor permanecen separados;
3. actor resuelto no equivale a actor activo ni autorizado;
4. se conservan `EMPLOYEE`, `CUSTOMER`, `SYSTEM` y `UNRESOLVED`;
5. se conservan todos los campos publicados en AUTH-CTX-001;
6. no se agrega ningún campo;
7. existe exactamente un actor por contexto;
8. la ambigüedad produce `UNRESOLVED`;
9. no se selecciona silenciosamente el primer candidato;
10. `actor_id` se interpreta junto con `actor_type`;
11. `actor_id` no es `auth_user_id`, rol, dispositivo ni delegación;
12. un empleado en sesión personal usa `PERSONAL_SESSION`;
13. un empleado en dispositivo usa `DEVICE_ACTOR_SESSION`;
14. un empleado delegado por sistema usa `SYSTEM_PROCESS` y
    `delegation_id`;
15. un cliente usa `DOMAIN_IDENTITY`;
16. un sistema autónomo usa `SYSTEM_PROCESS`;
17. `UNRESOLVED` usa `NONE`;
18. las combinaciones válidas quedan cerradas por una matriz explícita;
19. un empleado inactivo conocido puede conservar atribución resuelta;
20. la inactividad bloquea autorización, no borra auditoría;
21. una sesión de dispositivo expirada no conserva actor vigente;
22. el último actor del dispositivo no es fallback;
23. un dispositivo nunca es actor empleado por sí mismo;
24. `delegation_id` solo se usa para delegación de proceso a empleado en v1;
25. no existen delegaciones implícitas ni transitivas;
26. la delegación no copia permisos ni neutraliza denegaciones;
27. una delegación fallida no degrada a actor `SYSTEM`;
28. `service_role` no redefine principal ni actor;
29. una Server Action humana conserva al actor humano aunque use privilegios
    internos;
30. procesos autónomos y procesos delegados son modelos diferentes;
31. fronteras asíncronas deben declarar qué modelo utilizan;
32. la simulación conserva siempre al actor real;
33. el sujeto simulado nunca se convierte en actor;
34. actor, dispositivo, proceso y delegación quedan trazables por separado;
35. ninguna credencial o secreto se almacena en el nodo;
36. los códigos finales de invalidez se reservan para AUTH-CTX-015;
37. la tarea no cambia `contract_version` ni `schema_version`;
38. no se implementa código, migraciones ni cambios en Supabase.

---

#### 40. Estado final de la propuesta

| Tarea        | Estado      |
| ------------ | ----------- |
| AUTH-CTX-005 | APROBADA    |
| AUTH-CTX-006 | APROBADA    |
| AUTH-CTX-007 | NO INICIADA |

No se avanza a AUTH-CTX-007 hasta recibir aprobación explícita de
AUTH-CTX-006.


### ✅ AUTH-CTX-007 — Incluir identidad laboral o de dominio

**Estado:** APROBADA  
**Bloque:** BLOQUE E — Contexto y decisión de autorización unificados  
**Naturaleza:** Refinamiento documental de los nodos `domain_identity` y `employee` de `AccessContext`  
**Implementación física:** No incluida  
**Tarea anterior vigente:** AUTH-CTX-006 — APROBADA  
**Tarea posterior reservada:** AUTH-CTX-008 — Incluir rol base vigente  
**Contrato afectado:** `AccessContext@1.0.0`  
**Nodos afectados:** `domain_identity` y `employee`  
**Cambio contractual:** Aclaración normativa compatible; no cambia la forma publicada  
**Cambios físicos permitidos:** No

Esta tarea define de forma exhaustiva la semántica, procedencia, selección,
vigencia, consistencia y límites de la identidad empresarial utilizada por un
dominio consumidor, así como la representación mínima de la identidad laboral
cuando un empleado participa en el contexto.

No modifica la estructura raíz aprobada de `AccessContext`, no agrega campos,
no cambia `contract_version`, no cambia `schema_version` y no implementa tipos,
funciones SQL, RPC, RLS, migraciones, adaptadores, guards, aplicaciones ni
cambios en Supabase.

---

#### 1. Objetivo

Definir los nodos `domain_identity` y `employee` de manera que Vento OS pueda
responder inequívocamente:

1. qué identidad empresarial es relevante para la solicitud;
2. si esa identidad corresponde a empleado, cliente, dispositivo o sistema;
3. cuál es el identificador canónico dentro de su dominio;
4. qué relación autoritativa permitió resolverla;
5. si la identidad está activa, inactiva o inválida;
6. cómo seleccionar una identidad cuando una credencial posee varias;
7. cuándo la identidad debe quedar en `null`;
8. cuándo debe incluirse el nodo laboral `employee`;
9. cómo conservar una identidad laboral conocida aunque esté inactiva;
10. cómo evitar que cliente, dispositivo o servicio se conviertan en empleado;
11. cómo evitar que el rol se trate como identidad;
12. cómo mantener consistencia con el principal y el actor efectivo;
13. cómo representar sesiones personales, dispositivos compartidos y procesos;
14. qué datos laborales son necesarios para autorización y cuáles no deben
    exponerse;
15. qué inconsistencias deberán fallar de forma cerrada.

La tarea deberá impedir interpretaciones como:

```text
auth_user_id
=
employee_id
=
customer_id
=
device_id
=
actor_id
=
role_code
```

La relación correcta será:

```text
PRINCIPAL AUTENTICADO
        ↓
RELACIONES EMPRESARIALES CANÓNICAS
        ↓
IDENTIDAD DE DOMINIO APLICABLE
        ↓
ACTOR EFECTIVO
        ↓
IDENTIDAD LABORAL, CUANDO CORRESPONDA
        ↓
ROL Y CONTEXTO POSTERIORES
        ↓
DECISIÓN DE AUTORIZACIÓN
```

---

#### 2. Decisión principal

`domain_identity` identifica la entidad empresarial que el principal
representa frente al dominio, aplicación o proceso que recibe la solicitud.

Regla canónica:

```text
domain_identity
=
identidad empresarial única seleccionada
para la vía de acceso y dominio solicitante
```

El nodo `employee` representa exclusivamente la identidad laboral mínima del
trabajador que participa como identidad de dominio o actor efectivo.

Regla canónica:

```text
employee
=
snapshot laboral mínimo del empleado relevante
para el contexto
```

Ninguno de los dos nodos representa por sí solo:

```text
permiso
allow
deny
rol operativo
turno
check-in
cobertura territorial
sede activa
área activa
dispositivo habilitado
delegación autorizada
resultado final
```

Por tanto:

```text
identidad resuelta
≠ identidad activa
≠ carril disponible
≠ autorización concedida
```

Y:

```text
empleado existente
≠ empleado activo
≠ rol válido
≠ permiso vigente
```

---

#### 3. Contratos vigentes de los nodos

Se conservan sin cambios las formas publicadas en AUTH-CTX-001 y
AUTH-CTX-004.

##### 3.1 `DomainIdentityContext`

```ts
type DomainIdentityContext = {
  identity_type: "EMPLOYEE" | "CUSTOMER" | "DEVICE" | "SYSTEM";
  identity_id: string;
  status: "ACTIVE" | "INACTIVE" | "INVALID";
  source: string;
};
```

##### 3.2 `EmployeeContext`

```ts
type EmployeeContext = {
  employee_id: string;
  auth_user_id: string | null;
  is_active: boolean;
  employment_status: string;
  base_role_code: string | null;
};
```

No se agregan campos en esta tarea.

La publicación permanece:

```text
AccessContext
contract_version = 1.0.0
schema_version   = 1.0.0
```

---

#### 4. Separación de conceptos

Los conceptos deberán permanecer separados:

| Concepto          | Pregunta que responde                                            |
| ----------------- | ---------------------------------------------------------------- |
| `principal`       | ¿Quién o qué presentó la credencial técnica?                     |
| `domain_identity` | ¿Qué entidad empresarial representa en esta vía de acceso?       |
| `actor_effective` | ¿A quién se atribuye la acción concreta?                         |
| `employee`        | ¿Qué identidad laboral mínima corresponde al empleado relevante? |
| `base_role`       | ¿Qué rol base vigente tiene ese empleado?                        |
| `device_context`  | ¿Qué dispositivo y sesión de actor intervienen?                  |

Ejemplo de sesión personal laboral:

```text
principal
→ HUMAN_USER

domain_identity
→ EMPLOYEE

actor_effective
→ EMPLOYEE

employee
→ mismo trabajador
```

Ejemplo de Vento Pass:

```text
principal
→ HUMAN_USER

domain_identity
→ CUSTOMER

actor_effective
→ CUSTOMER

employee
→ null
```

Ejemplo de dispositivo compartido:

```text
principal
→ SHARED_DEVICE

domain_identity
→ DEVICE

actor_effective
→ EMPLOYEE

employee
→ trabajador de la sesión de actor
```

Ejemplo de proceso autónomo:

```text
principal
→ SYSTEM_SERVICE

domain_identity
→ SYSTEM

actor_effective
→ SYSTEM

employee
→ null
```

Ejemplo de proceso delegado:

```text
principal
→ SYSTEM_SERVICE

domain_identity
→ SYSTEM

actor_effective
→ EMPLOYEE

employee
→ empleado objetivo de la delegación
```

---

#### 5. Identidad singular y contextual

Cada `AccessContext` tendrá como máximo una `domain_identity`.

Resultados permitidos:

```text
una identidad de dominio exacta
```

O:

```text
domain_identity = null
```

No se devolverá:

- una lista de identidades;
- una identidad primaria y otra secundaria;
- empleado y cliente simultáneamente;
- dispositivo y empleado fusionados;
- identidad elegida por prioridad arbitraria;
- identidad derivada del rol más privilegiado.

Una misma credencial podrá vincularse con varias identidades empresariales,
pero la solicitud deberá utilizar una sola vía de acceso canónica.

Ejemplo:

```text
mismo auth_user_id
├── identidad EMPLOYEE
└── identidad CUSTOMER
```

Para una solicitud de VISO:

```text
domain_identity = EMPLOYEE
```

Para una solicitud de Vento Pass cliente:

```text
domain_identity = CUSTOMER
```

La coexistencia no es una contradicción.

La selección silenciosa sin dominio, aplicación o vía de acceso resoluble sí
será una contradicción.

---

#### 6. Fuente de verdad

La identidad deberá resolverse exclusivamente en servidor mediante relaciones
empresariales canónicas.

Fuentes conceptuales permitidas:

| Tipo       | Relación autoritativa                                             |
| ---------- | ----------------------------------------------------------------- |
| `EMPLOYEE` | vínculo único entre sujeto Auth o actor y registro laboral        |
| `CUSTOMER` | vínculo único entre sujeto Auth e identidad de cliente            |
| `DEVICE`   | vínculo único entre usuario técnico Auth y dispositivo compartido |
| `SYSTEM`   | registro interno estable del proceso o servicio empresarial       |

No serán fuente de verdad:

- `role` dentro de un JWT;
- `user_metadata` sin validación empresarial;
- correo, teléfono, documento o nombre enviados por el cliente;
- un `employee_id` suministrado en body o query;
- `public.users.role = client` tomado como identidad laboral;
- `employees.role` tomado como identidad;
- `navigation_role`;
- rol operativo;
- sede o área seleccionada;
- último turno;
- último check-in;
- último actor del dispositivo;
- nombre libre de servicio;
- uso de `service_role`;
- tablas históricas sin vigencia;
- coincidencias aproximadas por nombre;
- cookies no firmadas;
- valores de simulación.

---

#### 7. Vías canónicas de identidad

`AccessContext@1.0.0` reconocerá las siguientes vías conceptuales:

```text
LABOR_PERSONAL
CUSTOMER_PERSONAL
LABOR_SHARED_DEVICE
SYSTEM_AUTONOMOUS
SYSTEM_DELEGATED_EMPLOYEE
```

Estas vías no agregan un campo al contrato.

Son reglas normativas para construir combinaciones consistentes.

##### 7.1 `LABOR_PERSONAL`

```text
principal = HUMAN_USER
domain_identity = EMPLOYEE
actor_effective = EMPLOYEE
employee = presente
```

##### 7.2 `CUSTOMER_PERSONAL`

```text
principal = HUMAN_USER
domain_identity = CUSTOMER
actor_effective = CUSTOMER
employee = null
```

##### 7.3 `LABOR_SHARED_DEVICE`

```text
principal = SHARED_DEVICE
domain_identity = DEVICE
actor_effective = EMPLOYEE
employee = presente
device_context = presente
```

##### 7.4 `SYSTEM_AUTONOMOUS`

```text
principal = SYSTEM_SERVICE
domain_identity = SYSTEM
actor_effective = SYSTEM
employee = null
```

##### 7.5 `SYSTEM_DELEGATED_EMPLOYEE`

```text
principal = SYSTEM_SERVICE
domain_identity = SYSTEM
actor_effective = EMPLOYEE
employee = presente
delegation_id = presente
```

No se crearán combinaciones adicionales por conveniencia del frontend.

---

#### 8. `identity_type`

Valores congelados en `AccessContext@1.0.0`:

```text
EMPLOYEE
CUSTOMER
DEVICE
SYSTEM
```

`identity_type` identifica el namespace empresarial de `identity_id`.

No se utilizarán como tipos:

```text
HUMAN_USER
SHARED_DEVICE
SYSTEM_SERVICE
ANONYMOUS
propietario
gerente_general
cajero_satelite
bodeguero
cliente
administrador
proveedor
aplicación
sede
área
```

Los primeros pertenecen al principal.

Los códigos de rol pertenecen a autorización laboral.

Las sedes y áreas pertenecen al contexto.

---

#### 9. Identidad de dominio `EMPLOYEE`

Representa la identidad laboral de una persona dentro de Vento Group.

Contrato conceptual:

```text
principal humano válido
+
relación laboral única
+
dominio laboral solicitado
→ domain_identity EMPLOYEE
```

Reglas:

1. `identity_id` será el identificador canónico del empleado.
2. No será el correo, documento, teléfono ni `auth_user_id`.
3. No se derivará del rol base.
4. No se derivará del rol operativo.
5. No se derivará de una asignación de sede.
6. No se derivará de un turno.
7. La identidad puede ser conocida aunque esté inactiva.
8. Una identidad laboral inactiva conserva atribución y auditoría.
9. La inactividad bloquea las capacidades laborales.
10. Una identidad laboral inválida nunca produce carril disponible.
11. La identidad no concede acceso a Vento Pass cliente por sí sola.
12. La aplicación laboral deberá exigir una vía compatible.

Consistencia ordinaria:

```text
domain_identity.identity_type = EMPLOYEE
→ employee != null
→ employee.employee_id = domain_identity.identity_id
```

En sesión personal laboral:

```text
actor_effective.actor_type = EMPLOYEE
→ actor_effective.actor_id = employee.employee_id
```

---

#### 10. Identidad de dominio `CUSTOMER`

Representa la identidad comercial de una persona dentro del dominio de Vento
Pass.

Contrato conceptual:

```text
principal humano válido
+
identidad de cliente única
+
vía de cliente solicitada
→ domain_identity CUSTOMER
```

Reglas:

1. `identity_id` será el identificador canónico del cliente.
2. Un claim técnico `role = client` no sustituye la relación empresarial.
3. Una persona puede ser cliente y empleado simultáneamente.
4. La existencia de un empleado no cambia el contexto de cliente.
5. La identidad de cliente no concede acceso a aplicaciones laborales.
6. La identidad laboral no concede automáticamente beneficios de cliente.
7. La activación, bloqueo o baja del cliente afecta solo el dominio cliente.
8. Un cliente inactivo puede conservar atribución histórica.
9. Un cliente inválido no podrá producir autoridad de Pass.
10. `employee` será `null` en una vía puramente de cliente.
11. `actor_effective` deberá ser `CUSTOMER` con el mismo identificador.
12. La administración interna de Pass realizada por personal se resolverá como
    vía laboral, no como identidad de cliente.

Consistencia ordinaria:

```text
domain_identity.identity_type = CUSTOMER
→ actor_effective.actor_type = CUSTOMER
→ actor_effective.actor_id = domain_identity.identity_id
→ employee = null
```

---

#### 11. Identidad de dominio `DEVICE`

Representa una terminal física o lógica registrada como dispositivo
compartido de Vento.

Contrato conceptual:

```text
principal técnico válido
+
vínculo único con dispositivo empresarial
→ domain_identity DEVICE
```

Reglas:

1. `identity_id` será el identificador canónico del dispositivo.
2. No será el `auth_user_id` técnico.
3. El dispositivo no se modelará como empleado ficticio.
4. El dispositivo no recibe rol base.
5. El dispositivo no recibe rol operativo propio.
6. El dispositivo no se convierte en actor humano.
7. La identidad del dispositivo podrá estar activa aunque no exista actor.
8. Una acción empresarial humana requiere sesión de actor válida.
9. `actor_effective` podrá ser `UNRESOLVED` si no existe actor.
10. Cuando exista actor empleado, el nodo `employee` deberá corresponder a ese
    actor, no al dispositivo.
11. La activación del dispositivo no concede permisos al empleado.
12. El dispositivo impone restricciones adicionales; no amplía autoridad.
13. La semántica detallada de estado y sesión se completará en AUTH-CTX-014.
14. Las operaciones técnicas del dispositivo deberán tener contrato y actor
    definidos por su proceso; no se inferirán como permisos laborales.

Consistencia de una operación laboral:

```text
domain_identity.identity_type = DEVICE
→ principal.principal_type = SHARED_DEVICE
→ device_context != null
→ actor_effective.actor_type = EMPLOYEE
→ employee != null
```

Consistencia de dispositivo sin actor:

```text
domain_identity.identity_type = DEVICE
→ actor_effective.actor_type = UNRESOLVED
→ employee = null
```

En este último caso no se ejecutarán mutaciones empresariales humanas.

---

#### 12. Identidad de dominio `SYSTEM`

Representa un proceso, servicio o automatización interna registrada y
reconocible.

Contrato conceptual:

```text
principal de servicio válido
+
proceso empresarial registrado
→ domain_identity SYSTEM
```

Reglas:

1. `identity_id` será un identificador estable del proceso.
2. No será una API key, token, secreto ni `service_role`.
3. El nombre del job no será suficiente sin registro canónico.
4. La identidad técnica de Supabase no equivale a identidad empresarial.
5. Un proceso autónomo tendrá actor `SYSTEM`.
6. Un proceso delegado podrá tener actor `EMPLOYEE`.
7. La delegación no cambia `domain_identity`; permanece `SYSTEM`.
8. Una delegación no convierte al servicio en empleado.
9. Un proceso deshabilitado conserva identidad, pero no autoridad.
10. Un proceso desconocido produce identidad nula o inválida según exista un
    identificador empresarial resoluble.
11. Los reintentos deberán conservar la misma identidad de sistema.
12. La rotación de credenciales no deberá cambiar `identity_id`.
13. Un proceso no recibe permisos por usar infraestructura privilegiada.
14. Las capacidades de sistema deberán definirse explícitamente en tareas
    posteriores.

Consistencia de proceso autónomo:

```text
domain_identity.identity_type = SYSTEM
→ actor_effective.actor_type = SYSTEM
→ actor_effective.actor_id = domain_identity.identity_id
→ employee = null
```

Consistencia de proceso delegado:

```text
domain_identity.identity_type = SYSTEM
→ actor_effective.actor_type = EMPLOYEE
→ employee != null
→ actor_effective.delegation_id != null
```

---

#### 13. `identity_id`

`identity_id` identifica la entidad dentro del namespace indicado por
`identity_type`.

Regla:

```text
(identity_type, identity_id)
=
identidad empresarial inequívoca
```

No se interpretará `identity_id` sin `identity_type`.

Ejemplos conceptuales:

```text
(EMPLOYEE, employee_id)
(CUSTOMER, customer_id)
(DEVICE, device_id)
(SYSTEM, process_id)
```

`identity_id` no será:

- `auth_user_id` por convenio;
- código de rol;
- código de aplicación;
- código de permiso;
- código de sede;
- código de área;
- `session_id`;
- `delegation_id`;
- identificador de turno;
- identificador de check-in;
- valor simulado.

No se permitirá reutilizar un UUID idéntico en namespaces diferentes sin
considerar `identity_type`.

---

#### 14. `status`

Valores congelados:

```text
ACTIVE
INACTIVE
INVALID
```

El estado describe la vigencia empresarial de la identidad resuelta.

##### 14.1 `ACTIVE`

Significa:

```text
identidad existente
+
relación válida
+
registro habilitado para su dominio
+
invariantes mínimas satisfechas
```

No significa:

```text
permiso concedido
rol válido
turno activo
check-in activo
recurso autorizado
```

##### 14.2 `INACTIVE`

Significa:

```text
identidad conocida e inequívoca
+
registro deshabilitado, terminado o no habilitado
para ejercer autoridad en el dominio
```

La identidad se conserva para:

- atribución;
- auditoría;
- explicación;
- trazabilidad;
- tratamiento controlado de reactivación.

No se utilizará `INACTIVE` como fallback permisivo.

##### 14.3 `INVALID`

Significa que existe una identidad empresarial identificable, pero una
invariante obligatoria está rota.

Ejemplos:

- vínculo Auth incompatible;
- registro duplicado contradictorio ya reducido a un identificador exacto;
- tipo de identidad incompatible con la fuente;
- dispositivo vinculado a otro usuario técnico;
- proceso con registro inconsistente;
- empleado con relación corrupta.

`INVALID` nunca produce autoridad.

Cuando ni siquiera exista un `identity_id` inequívoco:

```text
domain_identity = null
```

No se fabricará un identificador para representar el error.

---

#### 15. `source`

`source` identifica la clase normativa de relación utilizada para resolver la
identidad.

Valores iniciales canónicos:

```text
EMPLOYEE_AUTH_LINK
CUSTOMER_AUTH_LINK
SHARED_DEVICE_AUTH_LINK
SYSTEM_PROCESS_REGISTRY
```

Matriz inicial:

| `identity_type` | `source` esperado         |
| --------------- | ------------------------- |
| `EMPLOYEE`      | `EMPLOYEE_AUTH_LINK`      |
| `CUSTOMER`      | `CUSTOMER_AUTH_LINK`      |
| `DEVICE`        | `SHARED_DEVICE_AUTH_LINK` |
| `SYSTEM`        | `SYSTEM_PROCESS_REGISTRY` |

`source`:

- no contiene nombres de tablas;
- no contiene SQL;
- no contiene secretos;
- no contiene rutas de repositorio;
- no contiene texto libre para UI;
- no contiene un UUID;
- no sustituye evidencia de auditoría;
- no determina permisos.

Una futura fuente adicional deberá analizar compatibilidad contractual.

Un valor desconocido no concederá autoridad.

---

#### 16. `domain_identity = null`

El nodo será `null` cuando no exista una identidad empresarial única y
verificable para la vía solicitada.

Casos:

- principal anónimo;
- principal inválido;
- usuario humano sin vínculo requerido;
- dominio solicitante no resoluble;
- dos empleados candidatos para la misma vía;
- dos clientes candidatos incompatibles;
- dispositivo técnico sin vínculo único;
- servicio sin proceso empresarial registrado;
- vía de acceso no declarada;
- identidad pedida incompatible con el principal;
- referencia aportada únicamente por el cliente;
- error de resolución que impide obtener un identificador exacto.

Regla:

```text
domain_identity = null
≠ identidad global
≠ identidad anónima con privilegios
≠ primer candidato
```

La ausencia deberá registrarse en `structural_issues` cuando la identidad sea
obligatoria.

---

#### 17. Principal humano con varias identidades

Una persona podrá tener simultáneamente:

```text
auth_user
+
employee
+
customer
```

Esta coexistencia es válida.

La selección dependerá de la vía de acceso resuelta en servidor.

No dependerá de:

- una opción enviada como verdad por el frontend;
- el último módulo abierto;
- el rol más privilegiado;
- la existencia de permisos;
- la sede seleccionada;
- el orden de consulta;
- el perfil creado primero;
- un claim técnico.

Ejemplo:

```text
solicitud a Pass cliente
→ CUSTOMER

solicitud a VISO
→ EMPLOYEE
```

Una ruta híbrida deberá declarar explícitamente qué identidad consume.

No se permitirá:

```text
CUSTOMER
→ fallback a EMPLOYEE
```

Ni:

```text
EMPLOYEE
→ fallback a CUSTOMER
```

---

#### 18. Selección por aplicación, proceso y vía de acceso

Cada consumidor deberá declarar uno o más perfiles de identidad aceptados.

Declaración conceptual:

```text
consumer
+
request_class
+
accepted_identity_route
```

La aplicación por sí sola puede no ser suficiente.

Ejemplo:

```text
NEXO en sesión personal
→ LABOR_PERSONAL

NEXO en terminal compartida
→ LABOR_SHARED_DEVICE

NEXO en job autónomo
→ SYSTEM_AUTONOMOUS

NEXO en job delegado
→ SYSTEM_DELEGATED_EMPLOYEE
```

Por tanto:

```text
app_code
≠ identidad suficiente
```

La clase de solicitud y el origen validado también participan.

La definición física de estos perfiles se reserva para E3, H y BLOQUE R.

---

#### 19. Perfiles iniciales por ecosistema

Clasificación documental inicial:

| Consumo               | Vía esperada                                      |
| --------------------- | ------------------------------------------------- |
| SHELL laboral         | `LABOR_PERSONAL` o `LABOR_SHARED_DEVICE`          |
| ANIMA                 | `LABOR_PERSONAL`                                  |
| VISO                  | `LABOR_PERSONAL`                                  |
| NEXO                  | laboral personal, dispositivo o sistema explícito |
| FOGO                  | laboral personal, dispositivo o sistema explícito |
| ORIGO                 | laboral personal, dispositivo o sistema explícito |
| PULSO                 | laboral personal, dispositivo o sistema explícito |
| NUMERA                | laboral personal o sistema explícito              |
| AURA laboral diferida | laboral personal cuando se confirme su alcance    |
| Vento Pass cliente    | `CUSTOMER_PERSONAL`                               |
| procesos internos     | `SYSTEM_AUTONOMOUS` o `SYSTEM_DELEGATED_EMPLOYEE` |

Esta tabla no concede acceso.

Solo define rutas de identidad admisibles para diseñar consumidores.

Cada permiso y recurso se evaluará después.

---

#### 20. Nodo `employee`

`employee` representa la identidad laboral mínima del empleado relevante para
el contexto.

Se incluirá cuando:

```text
domain_identity.identity_type = EMPLOYEE
```

O cuando:

```text
actor_effective.actor_type = EMPLOYEE
```

Por tanto, también estará presente en:

- dispositivo compartido con actor;
- proceso delegado a empleado.

No estará presente en:

- contexto puramente de cliente;
- proceso autónomo;
- dispositivo sin actor;
- actor no resuelto;
- principal anónimo;
- servicio sin delegación laboral.

El nodo no es una ficha completa del trabajador.

No contendrá por defecto:

- nombre;
- documento;
- teléfono;
- correo;
- dirección;
- salario;
- fecha de nacimiento;
- fotografía;
- historial;
- contratos;
- notas de recursos humanos.

---

#### 21. `employee_id`

`employee_id` identifica el registro laboral canónico.

Reglas:

1. Debe existir un único empleado resoluble.
2. Debe coincidir con `domain_identity.identity_id` cuando la identidad sea
   `EMPLOYEE`.
3. Debe coincidir con `actor_effective.actor_id` cuando el actor sea
   `EMPLOYEE`.
4. No se inferirá desde `auth.uid()` por igualdad accidental.
5. No se inferirá desde turnos.
6. No se inferirá desde permisos.
7. No se inferirá desde el dispositivo.
8. No se sustituirá por un código de nómina sin contrato.
9. No se sustituirá por documento de identidad.
10. No cambia cuando cambia el rol, sede o turno.

Consistencia:

```text
actor_effective.actor_type = EMPLOYEE
→ employee.employee_id = actor_effective.actor_id
```

---

#### 22. `employee.auth_user_id`

Este campo representa la vinculación técnica personal del empleado, cuando
exista.

Reglas:

1. En una sesión personal laboral válida deberá coincidir con
   `principal.auth_user_id`.
2. En un dispositivo compartido no deberá reemplazarse por el
   `auth_user_id` del dispositivo.
3. En una delegación de sistema no deberá reemplazarse por la identidad
   técnica del proceso.
4. Puede ser `null` si el empleado es atribuible mediante una sesión de actor
   o delegación válida y todavía no posee cuenta personal.
5. Un valor nulo no autoriza por sí mismo.
6. Dos empleados vinculados al mismo usuario personal producen inconsistencia.
7. Un empleado vinculado a un usuario diferente del principal humano produce
   inconsistencia.
8. El campo no es una credencial.
9. No contiene tokens ni información de sesión.
10. Su presencia no concede acceso.

Ejemplo de dispositivo:

```text
principal.auth_user_id = auth del kiosco
employee.auth_user_id  = auth personal del trabajador o null
```

Los dos valores no se fusionan.

---

#### 23. `is_active`

`is_active` expresa si la identidad laboral está habilitada actualmente para
participar en autorización laboral.

Regla:

```text
is_active = true
→ condición laboral necesaria
→ no suficiente para autorizar
```

```text
is_active = false
→ bloqueo estructural de capacidades laborales
```

La inactividad prevalece aunque existan:

- rol base;
- permisos;
- denegaciones;
- excepciones;
- sedes;
- áreas;
- turno;
- check-in;
- rol operativo;
- sesión de dispositivo;
- delegación;
- bypass legacy;
- datos en caché.

El empleado podrá permanecer identificado para auditoría.

No se eliminará el nodo para ocultar la inactividad.

---

#### 24. `employment_status`

`employment_status` expresa el estado laboral normalizado conocido al momento
de resolver el contexto.

No será texto de presentación.

Deberá ser:

- estable;
- determinista;
- auditable;
- independiente del idioma de UI;
- compatible con `is_active`;
- resuelto en servidor.

Esta tarea no congela el catálogo físico definitivo de estados laborales.

Como mínimo, la implementación futura deberá distinguir conceptualmente:

```text
activo
inactivo
terminado
suspendido
pendiente
desconocido o inválido
```

Reglas:

1. `is_active = true` no será compatible con un estado laboral terminal.
2. `is_active = false` no podrá reactivarse por rol o turno.
3. Un estado desconocido que sea obligatorio producirá problema estructural.
4. No se utilizará el nombre del rol como estado laboral.
5. No se utilizará la existencia de turnos como prueba de empleo activo.
6. La transición de estados deberá invalidar contextos previos.
7. El catálogo definitivo se gobernará en E3 y BLOQUE R.

---

#### 25. `base_role_code` dentro de `employee`

`base_role_code` conserva la referencia laboral observada en el registro del
empleado.

Esta tarea no determina todavía que el rol sea:

- existente;
- activo;
- válido;
- administrativo;
- compatible;
- autorizante.

Esa evaluación corresponde a AUTH-CTX-008.

Reglas:

1. Puede ser `null`.
2. Su presencia no activa el carril base.
3. No se usará como actor.
4. No se usará como identidad.
5. No se usará como rol operativo.
6. No se usará como permiso.
7. No se aplicará bypass por nombre.
8. Un empleado inactivo no se reactiva por conservar rol.
9. Un código legacy podrá registrarse, pero no considerarse válido sin la
   evaluación posterior.
10. `base_role` será el nodo normativo resuelto en AUTH-CTX-008.

Separación:

```text
employee.base_role_code
→ referencia observada

base_role
→ rol base evaluado y vigente
```

---

#### 26. Reglas de presencia de `employee`

Matriz obligatoria:

| `domain_identity` | `actor_effective` | `employee`  |
| ----------------- | ----------------- | ----------- |
| `EMPLOYEE`        | `EMPLOYEE`        | obligatorio |
| `DEVICE`          | `EMPLOYEE`        | obligatorio |
| `SYSTEM`          | `EMPLOYEE`        | obligatorio |
| `CUSTOMER`        | `CUSTOMER`        | `null`      |
| `SYSTEM`          | `SYSTEM`          | `null`      |
| `DEVICE`          | `UNRESOLVED`      | `null`      |
| `null`            | `UNRESOLVED`      | `null`      |

Combinaciones inválidas:

```text
actor EMPLOYEE + employee null
domain EMPLOYEE + employee null
actor CUSTOMER + employee presente
actor SYSTEM + employee presente sin delegación laboral
```

La presencia de un perfil laboral paralelo no autoriza a incluirlo en un
contexto puramente de cliente.

---

#### 27. Consistencia con `principal`

Matriz ordinaria:

| `principal_type` | `domain_identity.identity_type` permitido |
| ---------------- | ----------------------------------------- |
| `HUMAN_USER`     | `EMPLOYEE`, `CUSTOMER`                    |
| `SHARED_DEVICE`  | `DEVICE`                                  |
| `SYSTEM_SERVICE` | `SYSTEM`                                  |
| `ANONYMOUS`      | ninguna; `domain_identity = null`         |

Combinaciones diferentes deberán justificarse mediante una futura versión
contractual.

Ejemplos inválidos en v1:

```text
HUMAN_USER → DEVICE
HUMAN_USER → SYSTEM
SHARED_DEVICE → EMPLOYEE
SHARED_DEVICE → CUSTOMER
SYSTEM_SERVICE → EMPLOYEE
ANONYMOUS → CUSTOMER
```

Aclaración:

En un dispositivo, el actor puede ser empleado, pero la identidad de dominio
del principal sigue siendo `DEVICE`.

En un proceso delegado, el actor puede ser empleado, pero la identidad de
dominio del principal sigue siendo `SYSTEM`.

---

#### 28. Consistencia con `actor_effective`

Matriz permitida:

| `domain_identity` | `actor_effective` permitido        |
| ----------------- | ---------------------------------- |
| `EMPLOYEE`        | `EMPLOYEE`                         |
| `CUSTOMER`        | `CUSTOMER`                         |
| `DEVICE`          | `EMPLOYEE`, `UNRESOLVED`           |
| `SYSTEM`          | `SYSTEM`, `EMPLOYEE`, `UNRESOLVED` |
| `null`            | `UNRESOLVED`                       |

Reglas adicionales:

1. `EMPLOYEE` personal debe conservar el mismo identificador.
2. `CUSTOMER` debe conservar el mismo identificador.
3. `DEVICE` nunca usa `device_id` como `actor_id` empleado.
4. `SYSTEM` autónomo usa el identificador del proceso como actor.
5. `SYSTEM` delegado usa identificador de empleado y delegación.
6. Una delegación fallida no degrada a actor sistema.
7. Una sesión de dispositivo fallida no usa el último empleado.
8. La identidad no sustituye la atribución.

---

#### 29. Dispositivos compartidos

En una operación laboral desde dispositivo:

```text
principal
→ dispositivo técnico

domain_identity
→ DEVICE

device_context
→ dispositivo y sesión

actor_effective
→ EMPLOYEE

employee
→ trabajador exacto
```

Reglas:

1. La identidad `DEVICE` se resuelve antes de confiar en la sesión de actor.
2. Un dispositivo inactivo conserva identidad con estado `INACTIVE`.
3. Un vínculo técnico inconsistente produce estado `INVALID` o identidad nula.
4. La sesión de actor no cambia `domain_identity`.
5. La sesión de actor determina al actor y al nodo `employee`.
6. El PIN o QR no se almacena en el contexto.
7. El trabajador no hereda autoridad del dispositivo.
8. El dispositivo no hereda autoridad del trabajador.
9. El cierre de la sesión invalida contextos posteriores.
10. AUTH-CTX-014 definirá vigencia, política, estado y cardinalidad detallada.

---

#### 30. Procesos de sistema y delegación

En proceso autónomo:

```text
domain_identity = SYSTEM
actor_effective = SYSTEM
employee = null
```

En proceso delegado:

```text
domain_identity = SYSTEM
actor_effective = EMPLOYEE
employee = presente
delegation_id = presente
```

Reglas:

1. La identidad del proceso permanece estable.
2. La delegación no reemplaza la identidad del proceso.
3. El empleado delegado conserva su estado y denegaciones.
4. Un empleado inactivo no puede ejecutar mediante delegación.
5. El proceso no recibe rol humano.
6. La rotación de credenciales no cambia la identidad empresarial.
7. Un job ejecutado con privilegios elevados no se registra automáticamente
   como sistema autorizado.
8. La frontera asíncrona deberá conservar identidad, actor y modelo de
   delegación.
9. Los reintentos no seleccionarán otro empleado.
10. Las capacidades del proceso se diseñarán separadamente.

---

#### 31. Identidades inactivas e inválidas

La resolución deberá conservar la diferencia:

```text
INACTIVE
→ identidad conocida
→ autoridad bloqueada
→ auditoría posible
```

```text
INVALID
→ identidad identificable
→ relación estructural rota
→ autoridad bloqueada
```

```text
null
→ no existe identidad única resoluble
→ autoridad bloqueada
```

No se transformará:

```text
INACTIVE → null
```

solo para ocultar el estado.

Tampoco:

```text
INVALID → ACTIVE
```

mediante rol, permiso, turno, check-in o bypass.

La severidad y códigos definitivos se consolidarán en AUTH-CTX-015.

---

#### 32. Ausencia y onboarding

Un usuario humano autenticado puede no tener todavía la identidad requerida.

Casos:

```text
usuario sin employee
→ no puede acceder a Vento OS laboral
```

```text
usuario sin customer
→ puede requerir onboarding de Pass
```

La ausencia no será resuelta creando automáticamente:

- un empleado;
- un cliente;
- un rol;
- una sede;
- una identidad genérica;
- un actor sistema;
- una relación por correo aproximado.

El onboarding y creación de identidades son procesos empresariales separados.

`AccessContext` describe el estado actual.

No muta identidades durante la resolución.

---

#### 33. Simulación

`SimulationContext` podrá representar identidades hipotéticas, pero no
modificará `AccessContext` real.

Reglas:

1. El actor real conserva su identidad de dominio real.
2. El sujeto simulado se conserva separado.
3. Una identidad simulada `EMPLOYEE` no crea un `employee` real.
4. Una identidad simulada `CUSTOMER` no crea perfil de cliente.
5. Una identidad simulada `DEVICE` no activa terminal.
6. Una identidad simulada `SYSTEM` no registra proceso.
7. `WOULD_ALLOW` no se convierte en `ALLOW`.
8. Los datos reales visibles siguen limitados por la autoridad real.
9. La identidad simulada nunca sustituye al actor de auditoría.
10. No se reutilizan contratos reales como contenedores de simulación.

---

#### 34. Exposición segura

La proyección segura podrá incluir:

- tipo de identidad;
- estado;
- identificador opaco cuando sea necesario;
- estado laboral mínimo;
- indicador de actividad;
- código de rol observado cuando el consumidor autorizado lo requiera.

No incluirá por defecto:

- correo;
- teléfono;
- documento;
- dirección;
- salarios;
- tokens;
- secretos;
- metadata completa de Auth;
- historial laboral;
- historial de estados;
- notas internas;
- otras identidades de la misma persona;
- listas de permisos;
- información de otros empleados;
- credenciales del dispositivo;
- configuración privada del proceso.

La proyección de cliente podrá enmascarar identificadores.

La forma física se definirá en H y BLOQUE R.

---

#### 35. Auditoría

La resolución deberá permitir registrar de forma separada:

```text
principal_type
principal_auth_user_id
domain_identity_type
domain_identity_id
domain_identity_status
domain_identity_source
actor_type
actor_id
employee_id
employee_is_active
delegation_id
device_id
context_id
resolved_at
```

La auditoría no confundirá:

```text
principal_id
domain_identity_id
actor_id
employee_id
device_id
process_id
```

Se registrarán cambios de identidad relevantes mediante nuevos contextos.

No se registrarán:

- tokens;
- secretos;
- PIN;
- documentos personales innecesarios;
- payloads completos sin minimización.

La retención y persistencia se definirán en E3 y BLOQUE R.

---

#### 36. Resolución canónica

Secuencia conceptual:

```text
1. Validar `principal`.
2. Determinar consumidor y clase de solicitud.
3. Resolver vía de identidad aceptada.
4. Consultar relaciones empresariales canónicas.
5. Detectar ausencia, duplicidad o contradicción.
6. Seleccionar una identidad única.
7. Resolver `identity_type`.
8. Resolver `identity_id`.
9. Resolver `status`.
10. Resolver `source`.
11. Resolver `actor_effective` de forma consistente.
12. Resolver `employee` cuando corresponda.
13. Validar coincidencias entre identificadores.
14. Registrar problemas estructurales.
15. Emitir snapshot inmutable.
```

No se aplicarán fallbacks silenciosos.

El contrato SQL futuro se diseñará en AUTH-CTX-025.

---

#### 37. Casos canónicos

##### Caso A — Empleado activo en sesión personal

```text
principal = HUMAN_USER / VALID
domain_identity = EMPLOYEE / ACTIVE
actor = EMPLOYEE / PERSONAL_SESSION
employee.is_active = true
```

Resultado:

```text
identidad laboral disponible
rol y cobertura todavía pendientes de evaluación
```

##### Caso B — Empleado inactivo en sesión personal

```text
principal = HUMAN_USER / VALID
domain_identity = EMPLOYEE / INACTIVE
actor = EMPLOYEE / resolved
employee.is_active = false
```

Resultado:

```text
atribución conocida
autorización laboral bloqueada
```

##### Caso C — Humano cliente y empleado entrando a Pass

```text
principal = HUMAN_USER
relaciones = EMPLOYEE + CUSTOMER
vía = CUSTOMER_PERSONAL
domain_identity = CUSTOMER
actor = CUSTOMER
employee = null
```

Resultado:

```text
no se mezclan privilegios laborales
```

##### Caso D — Mismo humano entrando a VISO

```text
principal = HUMAN_USER
relaciones = EMPLOYEE + CUSTOMER
vía = LABOR_PERSONAL
domain_identity = EMPLOYEE
actor = EMPLOYEE
employee = presente
```

##### Caso E — Usuario autenticado sin empleado

```text
principal = HUMAN_USER / VALID
vía = LABOR_PERSONAL
domain_identity = null
actor = UNRESOLVED
employee = null
```

Resultado:

```text
acceso laboral denegado
```

##### Caso F — Dispositivo activo con actor activo

```text
principal = SHARED_DEVICE
domain_identity = DEVICE / ACTIVE
actor = EMPLOYEE
employee.is_active = true
device_context = presente
```

##### Caso G — Dispositivo activo sin sesión de actor

```text
principal = SHARED_DEVICE
domain_identity = DEVICE / ACTIVE
actor = UNRESOLVED
employee = null
```

Resultado:

```text
operaciones técnicas limitadas según contrato
mutaciones humanas denegadas
```

##### Caso H — Dispositivo inactivo con sesión residual

```text
principal = SHARED_DEVICE
domain_identity = DEVICE / INACTIVE
actor = UNRESOLVED
employee = null
```

La sesión residual no se utiliza.

##### Caso I — Proceso autónomo activo

```text
principal = SYSTEM_SERVICE
domain_identity = SYSTEM / ACTIVE
actor = SYSTEM
employee = null
```

##### Caso J — Proceso delegado a empleado activo

```text
principal = SYSTEM_SERVICE
domain_identity = SYSTEM / ACTIVE
actor = EMPLOYEE
employee.is_active = true
delegation_id = presente
```

##### Caso K — Proceso delegado a empleado inactivo

```text
domain_identity = SYSTEM / ACTIVE
actor = EMPLOYEE / resolved
employee.is_active = false
```

Resultado:

```text
atribución conservada
acción laboral denegada
```

##### Caso L — Dos empleados vinculados al mismo usuario

```text
principal = HUMAN_USER
vía = LABOR_PERSONAL
candidatos EMPLOYEE = 2
```

Resultado:

```text
domain_identity = null
actor = UNRESOLVED
employee = null
```

No se selecciona el primero.

##### Caso M — Cliente sin onboarding

```text
principal = HUMAN_USER
vía = CUSTOMER_PERSONAL
customer = ausente
```

Resultado:

```text
domain_identity = null
actor = UNRESOLVED
flujo de onboarding separado
```

##### Caso N — Claim `client` sin identidad empresarial

```text
JWT claim = client
customer record = ausente
```

Resultado:

```text
domain_identity = null
```

##### Caso O — `service_role` usado dentro de acción humana

```text
principal original = HUMAN_USER
domain_identity = EMPLOYEE
actor = EMPLOYEE
```

El cliente administrativo interno no cambia la identidad.

---

#### 38. Problemas estructurales relacionados

Códigos conceptuales candidatos:

```text
domain_identity_missing
domain_identity_ambiguous
domain_identity_invalid
domain_identity_inactive
domain_identity_type_mismatch
domain_identity_source_mismatch
identity_route_missing
identity_route_not_allowed
employee_missing
employee_ambiguous
employee_inactive
employee_status_invalid
employee_auth_link_mismatch
employee_actor_mismatch
employee_domain_mismatch
device_identity_missing
device_identity_invalid
system_identity_missing
system_identity_invalid
customer_identity_missing
customer_identity_invalid
```

Estos nombres no quedan congelados todavía.

AUTH-CTX-015 definirá:

- código definitivo;
- severidad;
- carril afectado;
- exposición;
- mensaje seguro;
- comportamiento de bloqueo.

Reglas ya vinculantes:

```text
identidad obligatoria ausente
→ no produce autoridad

empleado inactivo
→ bloquea capacidades laborales

identidad inválida
→ fail closed

ambigüedad
→ no seleccionar candidato
```

---

#### 39. Antipatrones prohibidos

Queda prohibido:

```ts
const employeeId = auth.uid();
const identity = user.role === "client" ? "CUSTOMER" : "EMPLOYEE";
const employee = employees[0];
const domainIdentity = employee ?? customer;
const active = Boolean(employee.role);
const actor = device.lastEmployeeId;
const system = usingServiceRole;
```

También:

```text
correo coincidente → vínculo laboral automático
documento coincidente → cliente convertido en empleado
employee.role → identidad laboral
rol operativo → identidad
sede primaria → identidad
turno activo → empleado activo
check-in → empleado válido
dispositivo activo → actor humano
service_role → identidad SYSTEM
identity_id null → organización
cliente también empleado → mezclar carriles
identidad inactiva → eliminar trazabilidad
primer candidato → identidad efectiva
última identidad usada → fallback
frontend elige identity_type → verdad autoritativa
```

---

#### 40. Compatibilidad con decisiones aprobadas

Esta tarea conserva:

- ADR-AUTH-001;
- AUTH-MOD-001 a AUTH-MOD-020;
- AUTH-CAT-001 a AUTH-CAT-024;
- AUTH-RBAC-001 a AUTH-RBAC-028;
- AUTH-CTX-001;
- AUTH-CTX-002;
- AUTH-CTX-003;
- AUTH-CTX-004;
- AUTH-CTX-005;
- AUTH-CTX-006.

En particular conserva:

```text
autenticación
≠ identidad

identidad
≠ actor

actor
≠ rol

rol
≠ permiso

empleado
≠ cliente

dispositivo
≠ empleado

servicio técnico
≠ autorización empresarial
```

No modifica ninguna matriz ni catálogo.

---

#### 41. Impacto contractual

La tarea:

- precisa semántica de campos existentes;
- define combinaciones válidas;
- define valores iniciales de `source`;
- no agrega campos;
- no elimina campos;
- no cambia obligatoriedad raíz;
- no cambia enums publicados;
- no cambia serialización;
- no cambia `contract_version`;
- no cambia `schema_version`.

Se clasifica como:

```text
aclaración normativa compatible
dentro de AccessContext@1.0.0
```

Una futura necesidad de representar:

- más de una identidad simultánea;
- organización o tenant;
- proveedor externo;
- identidad de negocio adicional;
- identidad compuesta;
- nivel de confianza;
- historial de selección;
- identidad secundaria;
- persona canónica transversal;
- namespace separado como campo;

requerirá análisis de versionado según AUTH-CTX-004.

---

#### 42. Dependencias posteriores

##### AUTH-CTX-008

Definirá `base_role` y validará `employee.base_role_code` sin convertirlo en
identidad.

##### AUTH-CTX-009

Definirá cobertura administrativa del empleado activo.

##### AUTH-CTX-010 a AUTH-CTX-013

Definirán turno, check-in, rol y territorio operativo del actor empleado.

##### AUTH-CTX-014

Definirá `device_context`, identidad del dispositivo y sesión de actor.

##### AUTH-CTX-015

Congelará problemas estructurales y severidades.

##### AUTH-CTX-024

Definirá auditoría de la decisión final.

##### AUTH-CTX-025

Diseñará el contrato SQL que producirá estos nodos.

##### AUTH-CTX-026

Diseñará el evaluador que consumirá identidad y estado sin reinterpretarlos.

##### AUTH-CTX-027

Definirá consumidores y perfiles de identidad aceptados.

##### AUTH-CTX-028

Definirá compatibilidad con funciones legacy que confunden usuario, empleado,
cliente y rol.

##### AUTH-CTX-029

Definirá invalidación cuando cambien identidad o estado laboral.

##### AUTH-CTX-030

Definirá pruebas contractuales.

##### BLOQUE E3

Definirá fuentes físicas, unicidad, catálogos de estado, relaciones y
transición.

##### BLOQUE H

Materializará tipos, schemas y helpers compartidos.

##### BLOQUE R

Implementará migraciones, RPC, RLS, adaptadores y retiro de fallbacks legacy.

---

#### 43. Fuera del alcance

AUTH-CTX-007 no:

- redefine `principal`;
- redefine `actor_effective`;
- define rol base vigente;
- define permisos;
- define matrices;
- define cobertura administrativa;
- define turno;
- define check-in;
- define rol operativo;
- define sede o área operativa;
- define completamente el dispositivo;
- define capacidades técnicas de sistema;
- define onboarding;
- crea empleados;
- crea clientes;
- crea dispositivos;
- crea procesos;
- crea delegaciones;
- congela catálogo físico de estados laborales;
- congela códigos de problemas estructurales;
- define decisión final;
- agrega campos;
- cambia versiones;
- crea tipos TypeScript;
- crea JSON Schema;
- crea validadores Zod;
- crea funciones SQL;
- crea RPC;
- crea RLS;
- crea grants;
- crea triggers;
- crea migraciones;
- modifica Supabase;
- modifica aplicaciones;
- migra consumidores;
- implementa código mediante Codex.

---

#### 44. Criterios de aprobación

AUTH-CTX-007 podrá aprobarse cuando se acepte que:

1. `domain_identity` identifica la entidad empresarial utilizada por la vía
   solicitada;
2. `employee` representa el snapshot laboral mínimo del trabajador relevante;
3. principal, identidad, actor, empleado y rol permanecen separados;
4. se conservan `EMPLOYEE`, `CUSTOMER`, `DEVICE` y `SYSTEM`;
5. se conservan `ACTIVE`, `INACTIVE` e `INVALID`;
6. no se agrega ningún campo;
7. existe como máximo una identidad de dominio por contexto;
8. varias identidades vinculadas no se fusionan;
9. la vía de acceso determina qué identidad se selecciona;
10. el frontend no determina la identidad autoritativa;
11. un mismo humano puede ser empleado y cliente;
12. Pass cliente usa `CUSTOMER`;
13. aplicaciones laborales personales usan `EMPLOYEE`;
14. dispositivo compartido usa identidad `DEVICE` y actor empleado;
15. proceso autónomo usa identidad y actor `SYSTEM`;
16. proceso delegado conserva identidad `SYSTEM` y actor empleado;
17. `identity_id` se interpreta junto con `identity_type`;
18. `identity_id` no es rol, permiso, sesión ni credencial;
19. `source` utiliza códigos normativos y no nombres físicos;
20. una identidad activa no equivale a autorización;
21. una identidad inactiva conserva atribución y bloquea autoridad;
22. una identidad inválida falla de forma cerrada;
23. cuando no existe identificador inequívoco, `domain_identity` es `null`;
24. no se selecciona silenciosamente el primer candidato;
25. `employee` es obligatorio cuando dominio o actor es empleado;
26. `employee` es nulo en una vía puramente de cliente;
27. `employee.employee_id` coincide con actor empleado;
28. `employee.auth_user_id` no se reemplaza por el usuario del dispositivo o
    servicio;
29. un empleado puede ser atribuible sin cuenta personal en una sesión de
    actor o delegación válida;
30. `is_active = false` bloquea todas las capacidades laborales;
31. el rol, turno, check-in o permiso no reactivan empleados;
32. `employment_status` es normalizado y compatible con `is_active`;
33. `employee.base_role_code` es referencia observada, no rol validado;
34. AUTH-CTX-008 resolverá el rol base vigente;
35. un claim `client` no crea identidad de cliente;
36. `service_role` no crea identidad `SYSTEM`;
37. el dispositivo no se convierte en empleado ficticio;
38. la simulación no crea identidades reales;
39. la exposición segura minimiza datos personales;
40. los códigos finales de invalidez se reservan para AUTH-CTX-015;
41. la tarea no cambia `contract_version` ni `schema_version`;
42. no se implementa código, migraciones ni cambios en Supabase.

---

#### 45. Estado final de la propuesta

| Tarea        | Estado      |
| ------------ | ----------- |
| AUTH-CTX-006 | APROBADA    |
| AUTH-CTX-007 | APROBADA    |
| AUTH-CTX-008 | NO INICIADA |

No se avanza a AUTH-CTX-008 hasta recibir aprobación explícita de
AUTH-CTX-007.


### ✅ AUTH-CTX-008 — Incluir rol base vigente

**Estado:** APROBADA  
**Bloque:** BLOQUE E — Contexto y decisión de autorización unificados  
**Naturaleza:** Refinamiento documental del nodo `base_role` de `AccessContext`  
**Implementación física:** No incluida  
**Tarea anterior vigente:** AUTH-CTX-007 — APROBADA  
**Tarea posterior inmediata:** AUTH-CTX-009 — Incluir cobertura administrativa por sede y área  
**Tarea diferida relacionada:** AUTH-MOD-021 — Definir rol base mínimo no privilegiado para trabajadores puramente operativos  
**Contrato afectado:** `AccessContext@1.0.0`  
**Nodo afectado:** `base_role`  
**Referencia relacionada:** `employee.base_role_code`  
**Dataset canónico relacionado:** `vento.authorization.base-role-grants@1.0.0`  
**Roles base canónicos vigentes:** 7  
**Cambio contractual:** Aclaración normativa compatible; no cambia la forma publicada  
**Cambios físicos permitidos:** No

Esta tarea define de forma exhaustiva la semántica, procedencia, vigencia,
validez, clasificación, resolución y límites del rol base incluido en
`AccessContext`.

No modifica la estructura raíz aprobada de `AccessContext`, no agrega campos,
no cambia `contract_version`, no cambia `schema_version`, no crea nuevos roles,
no corrige datos legacy y no implementa tipos, funciones SQL, RPC, RLS,
migraciones, adaptadores, guards, aplicaciones ni cambios físicos en
Supabase.

---

#### 1. Objetivo

Definir el nodo `base_role` de manera que Vento OS pueda responder de forma
inequívoca:

1. si el empleado relevante tiene un rol base asignado;
2. cuál es el código exacto observado;
3. si ese código pertenece al catálogo canónico de roles base;
4. si el rol se encuentra vigente y habilitado;
5. qué fuente normativa produjo la asignación;
6. cuándo el rol puede habilitar estructuralmente el carril base;
7. cuándo el rol debe conservarse únicamente para trazabilidad;
8. cuándo `base_role` debe ser `null`;
9. cómo distinguir ausencia, inactividad, legado, código desconocido y
   ambigüedad;
10. cómo relacionar `employee.base_role_code` con `base_role` sin confundir el
    valor observado con un rol validado;
11. cómo impedir que el rol base se obtenga desde el turno, dispositivo,
    navegación, JWT o frontend;
12. cómo impedir que un oficio operativo legacy siga concediendo autoridad
    permanente;
13. cómo conservar la independencia entre carril base y carril operativo;
14. cómo tratar empleados activos que todavía conservan un oficio legacy en
    la asignación base;
15. cómo tratar identidades de cliente, dispositivo o sistema;
16. cómo mantener la atribución histórica cuando el empleado o rol están
    inactivos;
17. qué problemas estructurales deberá producir una resolución inválida;
18. qué cambios deberán invalidar un contexto previamente resuelto;
19. cómo relacionar el rol con matrices explícitas sin convertir el nombre del
    rol en autorización;
20. qué elementos quedan reservados para las tareas posteriores.

La tarea deberá impedir interpretaciones como:

```text
employees.role
=
permiso efectivo
=
bypass
=
rol operativo
=
cobertura territorial
```

La relación correcta será:

```text
EMPLEADO RESUELTO
        ↓
CÓDIGO DE ROL BASE OBSERVADO
        ↓
VALIDACIÓN CONTRA CATÁLOGO CANÓNICO
        ↓
BASE ROLE CONTEXT
        ↓
READINESS ESTRUCTURAL DEL CARRIL BASE
        ↓
MATRIZ + ALCANCE + RECURSO + DENEGACIONES
        ↓
DECISIÓN DE AUTORIZACIÓN POSTERIOR
```

---

#### 2. Decisión principal

`base_role` representa el rol laboral permanente, administrativo o funcional
que el empleado tiene asignado dentro del modelo canónico de autorización.

Regla canónica:

```text
base_role
=
rol base único
+ asignación autoritativa
+ código canónico
+ estado vigente verificable
```

El rol base:

- pertenece al empleado;
- es permanente hasta una modificación administrativa válida;
- no depende del turno;
- no depende del check-in;
- no depende del dispositivo;
- no depende de la sede seleccionada;
- no depende del área seleccionada;
- no se obtiene del rol operativo;
- no se infiere desde permisos existentes;
- no concede autorización por su nombre.

Por tanto:

```text
rol base activo
≠ permiso concedido
≠ cobertura global
≠ bypass operativo
≠ decisión ALLOW
```

Y:

```text
rol base inválido
→ bloquea el carril base
→ no crea automáticamente un bloqueo del carril operativo
```

La evaluación final de un permiso seguirá requiriendo:

```text
ROL BASE VIGENTE
+ ALLOW BASE EXPLÍCITO
+ ALCANCE COINCIDENTE
+ RECURSO VÁLIDO
+ CONDICIONES DEL PERMISO
+ AUSENCIA DE DENEGACIÓN APLICABLE
= AUTORIZACIÓN BASE POSIBLE
```

---

#### 3. Contrato vigente del nodo

Se conserva sin cambios la forma publicada en AUTH-CTX-001 y
AUTH-CTX-004:

```ts
type BaseRoleContext = {
  role_code: string;
  role_status: "ACTIVE" | "INACTIVE" | "INVALID";
  assignment_source: string;
};
```

No se agregan campos en esta tarea.

La publicación permanece:

```text
AccessContext
contract_version = 1.0.0
schema_version   = 1.0.0
```

Los datos adicionales necesarios para auditoría o diagnóstico deberán
conservarse en:

- `structural_issues`;
- `resolution_metadata`;
- fuentes internas del resolver;
- auditoría de decisiones posterior.

No deberán incorporarse silenciosamente nuevos campos al nodo publicado.

---

#### 4. Base normativa

Esta propuesta conserva sin cambios:

- ADR-AUTH-001;
- AUTH-MOD-001 — identidad laboral y actor efectivo;
- AUTH-MOD-002 — separación entre rol base y rol operativo;
- AUTH-MOD-003 — roles administrativos globales;
- AUTH-MOD-004 — roles administrativos por sede;
- AUTH-MOD-005 — roles operativos definitivos;
- AUTH-MOD-006 — casos híbridos administrativo-operativos;
- AUTH-MOD-007 a AUTH-MOD-019 — territorio, contexto, modalidades y
  precedencia;
- AUTH-CAT-001 a AUTH-CAT-024;
- AUTH-RBAC-001 a AUTH-RBAC-028;
- AUTH-CTX-001 a AUTH-CTX-007.

Reglas heredadas obligatorias:

```text
ROL BASE
≠ IDENTIDAD
```

```text
ROL BASE
≠ ROL OPERATIVO
```

```text
NOMBRE DEL ROL
≠ AUTORIZACIÓN
```

```text
ROL BASE
→ plantilla potencial de concesiones del carril BASE
```

```text
ROL OPERATIVO
→ plantilla potencial de concesiones del carril OPERATIONAL
```

```text
SIN ALLOW APLICABLE
→ DEFAULT_DENY
```

---

#### 5. Separación de conceptos

Los siguientes conceptos deberán permanecer separados:

| Concepto                            | Pregunta que responde                                                 |
| ----------------------------------- | --------------------------------------------------------------------- |
| `principal`                         | ¿Quién o qué presentó la credencial técnica?                          |
| `domain_identity`                   | ¿Qué entidad empresarial representa en la vía solicitada?             |
| `actor_effective`                   | ¿A quién se atribuye la acción?                                       |
| `employee`                          | ¿Qué identidad laboral mínima corresponde al actor empleado?          |
| `employee.base_role_code`           | ¿Qué código de asignación base fue observado en la identidad laboral? |
| `base_role`                         | ¿Ese código representa un rol base canónico y vigente?                |
| `assigned_sites` / `assigned_areas` | ¿Qué afiliaciones territoriales laborales existen?                    |
| `administrative_coverage`           | ¿Qué cobertura base puede evaluarse?                                  |
| `active_shift`                      | ¿Qué asignación operativa temporal está vigente?                      |
| `operational_role`                  | ¿Qué función temporal deriva del turno?                               |

Regla:

```text
employee.base_role_code
→ referencia observada

base_role
→ resultado validado
```

No se permitirá:

```text
employee.base_role_code no nulo
→ asumir base_role ACTIVE
```

---

#### 6. Aplicabilidad del nodo

`base_role` aplica exclusivamente cuando existe una identidad laboral
resoluble.

##### 6.1 Actor empleado

Cuando:

```text
actor_effective.actor_type = EMPLOYEE
```

y existe un `employee` coherente, el resolver deberá intentar construir
`base_role`.

##### 6.2 Identidad laboral sin actor empleado

En una vía donde la identidad de dominio sea `EMPLOYEE` pero el actor efectivo
no pueda resolverse como el mismo empleado:

```text
base_role = null
```

La contradicción deberá registrarse y fallar de forma cerrada.

##### 6.3 Cliente

En una vía puramente de cliente:

```text
domain_identity = CUSTOMER
actor_effective = CUSTOMER
employee = null
base_role = null
```

##### 6.4 Dispositivo sin actor humano

Un dispositivo compartido sin sesión de actor válida:

```text
domain_identity = DEVICE
actor_effective = UNRESOLVED
employee = null
base_role = null
```

##### 6.5 Sistema autónomo

Un proceso autónomo:

```text
domain_identity = SYSTEM
actor_effective = SYSTEM
employee = null
base_role = null
```

No se fabricará un rol base técnico para servicios, bots, integraciones o
`service_role`.

---

#### 7. Catálogo canónico de roles base

El modelo canónico reconoce exactamente siete roles base con matrices
publicadas:

```text
propietario
gerente_general
gerente
supervisor
auxiliar_administrativa
contador
marketing
```

Estos son los únicos códigos que pueden producir:

```text
role_status = ACTIVE
```

bajo la versión contractual actual, siempre que la asignación y el registro
vigente sean válidos.

El conjunto se organiza conceptualmente así:

```text
ROLES ADMINISTRATIVOS GLOBALES
├── propietario
└── gerente_general

ROLES ADMINISTRATIVOS POR SEDE
├── gerente
└── supervisor

ROLES FUNCIONALES BASE
├── auxiliar_administrativa
├── contador
└── marketing
```

Esta clasificación:

- describe responsabilidad permanente;
- orienta qué alcances pueden asignarse;
- no concede permisos automáticamente;
- no produce jerarquía automática de grants;
- no produce herencia automática entre roles.

---

#### 8. Rol base canónico no equivale a rol privilegiado

Todo rol del catálogo base es una plantilla de responsabilidad, no un bypass.

Ejemplos:

```text
propietario
≠ todos los permisos
```

```text
gerente_general
≠ propietario
```

```text
gerente
≠ alcance global
```

```text
supervisor
≠ gerente con menos filas implícitas
```

```text
contador
≠ acceso completo a NUMERA
```

```text
marketing
≠ administrador global de contenido
```

Los permisos proceden exclusivamente de:

- dataset canónico de matriz base;
- concesiones individuales base;
- denegaciones aplicables;
- modalidad del permiso;
- alcance;
- recurso;
- restricciones contractuales.

---

#### 9. Definición de rol base vigente

Un rol base estará vigente cuando se cumplan simultáneamente las siguientes
condiciones:

```text
1. Existe un empleado relevante y coherente.
2. Existe exactamente una asignación base identificable.
3. La asignación pertenece al mismo empleado.
4. El código está normalizado de forma exacta.
5. El código pertenece al catálogo canónico de siete roles base.
6. El rol está activo en la versión de catálogo aplicable.
7. La asignación no está revocada, retirada ni reemplazada.
8. La fuente de asignación es autoritativa.
9. No existe ambigüedad entre varias asignaciones concurrentes.
10. No existe contradicción con el snapshot laboral.
```

Resultado:

```text
role_status = ACTIVE
```

La vigencia del rol no reemplaza la validación independiente del empleado.

Por tanto, es posible conservar:

```text
employee.is_active = false
base_role.role_status = ACTIVE
```

para trazabilidad histórica, pero:

```text
lane_readiness.base = INVALID
```

porque un empleado inactivo bloquea toda autoridad laboral.

---

#### 10. Fuente autoritativa de asignación

La asignación base deberá proceder de una relación laboral administrativa
única y verificable.

Conceptualmente:

```text
EMPLEADO
        ↓
ASIGNACIÓN BASE VIGENTE
        ↓
CATÁLOGO CANÓNICO DE ROLES BASE
```

La implementación física objetivo se definirá en BLOQUE E3 y BLOQUE R.

Durante la transición, `employees.role` puede constituir la fuente física
observada, pero el contrato no deberá acoplar su semántica a un nombre de
columna o esquema concreto.

Regla:

```text
fuente física actual
≠ contrato normativo permanente
```

El resolver deberá reportar una fuente normativa estable mediante
`assignment_source`.

---

#### 11. `assignment_source`

`assignment_source` identifica la clase normativa de relación utilizada para
resolver el rol base.

Valores iniciales canónicos:

```text
CANONICAL_EMPLOYEE_ROLE_ASSIGNMENT
LEGACY_EMPLOYEE_ROLE_ASSIGNMENT
```

##### 11.1 `CANONICAL_EMPLOYEE_ROLE_ASSIGNMENT`

Se utiliza cuando:

- existe una asignación administrativa autoritativa;
- el código pertenece al catálogo base canónico;
- la relación está vigente;
- no existe ambigüedad.

Puede producir:

```text
role_status = ACTIVE
```

o, cuando el rol canónico está retirado temporalmente:

```text
role_status = INACTIVE
```

##### 11.2 `LEGACY_EMPLOYEE_ROLE_ASSIGNMENT`

Se utiliza cuando el valor observado procede del modelo heredado y no puede
considerarse una asignación base canónica vigente.

Ejemplos:

```text
barista
bodeguero
cajero
cocinero
conductor
mesero
panadero
pastelero
repostero
```

Siempre produce:

```text
role_status = INVALID
```

No podrá utilizarse para consultar el dataset canónico de matriz base.

`assignment_source`:

- no contendrá nombres de tablas;
- no contendrá SQL;
- no contendrá una ruta de repositorio;
- no contendrá un UUID;
- no contendrá texto libre de UI;
- no se obtendrá desde el frontend;
- no concederá permisos.

Un valor desconocido o vacío hará inválida la resolución.

---

#### 12. Semántica de `role_code`

`role_code` contiene el código exacto observado y normalizado de la asignación
base.

Reglas:

1. se trata como identificador opaco;
2. la comparación es exacta;
3. no se aplican coincidencias parciales;
4. no se aplican reglas por prefijo;
5. no se aplican traducciones por nombre humano;
6. no se aplican correcciones ortográficas silenciosas;
7. no se infiere desde un correo o cargo;
8. no se convierte automáticamente a un rol operativo;
9. no se utiliza como permission key;
10. no se utiliza como actor_id.

Incorrecto:

```text
%gerente%
→ gerente
```

```text
cocinero
→ produccion_cocina
```

```text
bodeguero
→ elegir automáticamente catálogo base u operativo
```

Correcto:

```text
código exacto
+ namespace conceptual del nodo base_role
+ validación canónica
```

---

#### 13. Semántica de `role_status`

`role_status` representa el resultado efectivo de validar el código y su
asignación como rol base.

Valores:

```text
ACTIVE
INACTIVE
INVALID
```

No representa:

- estado del empleado;
- estado del turno;
- estado del check-in;
- existencia de permisos;
- cobertura territorial;
- resultado final de autorización.

El estado laboral continúa en `employee`.

El estado operativo continúa en los nodos del carril operativo.

---

#### 14. `role_status = ACTIVE`

Se utiliza exclusivamente cuando:

```text
código canónico conocido
+ asignación autoritativa única
+ rol habilitado
+ relación vigente
+ fuente válida
= ACTIVE
```

Un rol activo permite que el carril base avance a las validaciones
posteriores.

No significa:

```text
matriz encontrada
permiso encontrado
alcance coincidente
recurso autorizado
ALLOW
```

Ejemplo:

```text
base_role.role_code = contador
base_role.role_status = ACTIVE
```

La solicitud de:

```text
viso.security.grants.create
```

seguirá denegada si la matriz del contador no contiene esa capacidad.

---

#### 15. `role_status = INACTIVE`

Se utiliza cuando el código pertenece al catálogo canónico, pero el rol o la
asignación se encuentra expresamente inactivo, retirado o suspendido para
nuevas decisiones.

Ejemplos conceptuales:

- rol canónico temporalmente deshabilitado;
- asignación reemplazada cuya vigencia terminó;
- rol retirado del catálogo activo pero conservado para historial;
- relación administrativa suspendida sin borrar el registro.

Consecuencia:

```text
base_role se conserva
role_status = INACTIVE
lane_readiness.base = INVALID
```

Un rol inactivo:

- no consulta grants activos;
- no habilita permisos individuales base por sí solo;
- no se reemplaza por otro rol;
- no se transforma en rol operativo;
- no se reactiva por turno o check-in.

---

#### 16. `role_status = INVALID`

Se utiliza cuando existe un código observado, pero no puede reconocerse como
rol base canónico vigente.

Casos iniciales:

```text
código desconocido
código malformado
oficio operativo legacy
código existente solo en operational_roles
código duplicado entre catálogos
fuente no autorizada
asignación ambigua
asignación perteneciente a otro empleado
mapeo automático no aprobado
inconsistencia entre fuentes
```

Consecuencia:

```text
base_role se conserva para diagnóstico
role_status = INVALID
lane_readiness.base = INVALID
```

`INVALID` nunca concederá autoridad.

---

#### 17. `base_role = null`

El nodo será `null` cuando no exista un código de asignación base que pueda
representarse de forma inequívoca.

Casos:

- no existe identidad laboral;
- `employee = null`;
- el actor no es empleado;
- no existe asignación base;
- el campo observado está vacío;
- existen varias asignaciones y no puede seleccionarse una;
- la identidad laboral está contradictoria;
- la relación no pertenece al actor empleado.

Regla:

```text
base_role = null
→ causa explícita en structural_issues
```

No se fabricará:

```text
role_code = "none"
role_code = "employee"
role_code = "staff"
role_code = "unknown"
```

mientras esos códigos no hayan sido aprobados formalmente como roles base.

---

#### 18. Relación con `employee.base_role_code`

`employee.base_role_code` conserva el valor observado en el snapshot laboral.

`base_role` conserva el resultado de validarlo.

Matriz:

| `employee.base_role_code`      | `base_role`                                   | Interpretación                |
| ------------------------------ | --------------------------------------------- | ----------------------------- |
| Código canónico activo         | Objeto `ACTIVE`                               | Rol base vigente              |
| Código canónico inactivo       | Objeto `INACTIVE`                             | Rol conocido no utilizable    |
| Código legacy o desconocido    | Objeto `INVALID`                              | Valor atribuible, no canónico |
| `null` o vacío                 | `null`                                        | Asignación ausente            |
| Varias fuentes contradictorias | `null` o `INVALID` según evidencia inequívoca | Resolución bloqueada          |

Regla:

```text
employee.base_role_code
≠ base_role.role_code validado
```

hasta completar la validación.

Cuando existe un objeto `base_role`, ambos códigos deberán coincidir
exactamente.

Si no coinciden:

```text
base_role = null
```

o:

```text
role_status = INVALID
```

según cuál valor pueda conservarse de forma segura para diagnóstico.

No se seleccionará el valor más privilegiado.

---

#### 19. Tratamiento de los oficios base legacy

Los siguientes códigos pertenecen al modelo heredado de oficios almacenados
como roles base:

```text
barista
bodeguero
cajero
cocinero
conductor
mesero
panadero
pastelero
repostero
```

Bajo el modelo canónico actual:

```text
OFICIO LEGACY
≠ ROL BASE CANÓNICO
```

Por tanto:

```text
assignment_source = LEGACY_EMPLOYEE_ROLE_ASSIGNMENT
role_status       = INVALID
```

Los oficios legacy:

- no consultan el dataset de los siete roles base;
- no conservan automáticamente los grants históricos;
- no se transforman automáticamente en rol operativo;
- no pueden funcionar como fallback de turno;
- no pueden producir bypass permanente;
- no se eliminan físicamente durante esta tarea;
- conservan trazabilidad para la transición.

La implementación deberá inventariar cada empleado afectado antes del
cutover.

---

#### 20. Caso especial `bodeguero`

`bodeguero` existe históricamente en:

```text
catálogo base legacy
catálogo operativo
```

Dentro de `base_role`, el código observado en una asignación legacy será:

```text
role_code = bodeguero
role_status = INVALID
assignment_source = LEGACY_EMPLOYEE_ROLE_ASSIGNMENT
```

Dentro del carril operativo, el mismo texto podrá representar un rol
operativo únicamente cuando derive de un turno válido y se procese en
`operational_role`.

La igualdad textual no permite fusionar ambos conceptos.

Regla:

```text
base_role.role_code = "bodeguero"
≠
operational_role.role_code = "bodeguero"
```

porque pertenecen a namespaces contractuales diferentes.

El modelo físico objetivo deberá evitar códigos duplicados entre catálogos,
pero su transición se define en E3 y BLOQUE R.

---

#### 21. Rol base mínimo de trabajadores puramente operativos

AUTH-MOD-002 estableció que todo empleado operativo necesita un rol base no
privilegiado para capacidades laborales permanentes esenciales.

El código definitivo de ese rol mínimo no fue incorporado a la versión actual
del catálogo de siete roles base ni al dataset
`vento.authorization.base-role-grants@1.0.0`.

Esta necesidad queda asignada obligatoriamente a:

```text
AUTH-MOD-021
— Definir rol base mínimo no privilegiado para trabajadores puramente operativos
```

`AUTH-MOD-021` deberá existir como tarea documental explícita y resolverse
antes de:

- iniciar `AUTH-CTX-028`;
- publicar una nueva versión del catálogo o dataset de roles base;
- ejecutar cualquier implementación física que transforme o retire oficios
  legacy.

No bloquea `AUTH-CTX-009`, porque esta última define la cobertura
administrativa de los roles base vigentes sin crear el rol mínimo.

AUTH-MOD-021 deberá definir, como mínimo:

1. el código canónico definitivo del rol;
2. su nombre humano y propósito empresarial;
3. sus capacidades base permanentes mínimas;
4. las capacidades que permanecerán expresamente prohibidas;
5. su relación con los siete roles base actualmente publicados;
6. si exige una nueva versión del catálogo y del dataset base;
7. el tratamiento de empleados que conservan oficios legacy;
8. la compatibilidad temporal hasta el cutover;
9. el impacto sobre matrices, `AccessContext`, pruebas y migración;
10. si `ADR-AUTH-001` continúa siendo compatible, requiere una enmienda
    explícita o debe ser sustituido mediante un nuevo ADR;
11. las tareas físicas exactas de E3, H y R que materializarán la decisión.

`AUTH-MOD-021` no podrá aprobarse sin cerrar expresamente el impacto sobre
`ADR-AUTH-001`.

Hasta aprobar AUTH-MOD-021 no se inventarán silenciosamente códigos como:

```text
trabajador
colaborador
empleado
staff
```

Regla vigente:

```text
CÓDIGO NO APROBADO
→ NO ES ROL BASE CANÓNICO
```

Consecuencia contractual transitoria:

- un trabajador que conserve un oficio legacy tendrá el carril base inválido;
- su carril operativo podrá resolverse independientemente si cumple sus
  propios requisitos;
- AUTH-CTX-028 solo podrá diseñar compatibilidad después de la decisión de
  AUTH-MOD-021;
- E3 y BLOQUE R implementarán la solución aprobada mediante estructuras,
  backfills, migraciones y rollback versionados en `vento-shell`.

Esta tarea no crea todavía el rol mínimo ni modifica físicamente el catálogo,
pero deja su resolución con tarea, orden y puertas explícitas.

---

#### 22. Independencia del carril operativo

Un problema de rol base afecta el carril base.

No reemplaza ni invalida automáticamente los hechos del carril operativo.

Ejemplo:

```text
employee activo
+ base_role legacy INVALID
+ turno válido
+ rol operativo válido
+ sede y área compatibles
```

Resultado estructural:

```text
base lane        = INVALID
operational lane = puede estar READY
```

La decisión posterior aplicará la modalidad del permiso:

| Modalidad              | Efecto de base inválida                                    |
| ---------------------- | ---------------------------------------------------------- |
| `BASE_ONLY`            | DENY                                                       |
| `OPERATIONAL_ONLY`     | El carril operativo puede autorizar si está completo       |
| `BASE_OR_OPERATIONAL`  | El carril operativo puede autorizar de forma independiente |
| `BASE_AND_OPERATIONAL` | DENY porque el componente base es obligatorio              |

No se mezclarán fragmentos de ambos carriles.

---

#### 23. Empleado inactivo

Cuando el empleado es conocido pero está inactivo:

- `employee` se conserva;
- `base_role` puede conservarse para trazabilidad;
- el estado del rol se calcula de forma independiente;
- toda autoridad laboral queda bloqueada.

Ejemplo:

```text
employee.is_active        = false
base_role.role_code       = contador
base_role.role_status     = ACTIVE
lane_readiness.base       = INVALID
lane_readiness.operational = INVALID
```

No se modificará `role_status` a `INACTIVE` únicamente porque el empleado esté
inactivo.

Esto evita confundir:

```text
estado del empleado
≠ estado del rol
```

---

#### 24. Cambio de rol base

Un empleado puede tener exactamente un rol base vigente en un instante.

Cuando exista un cambio administrativo válido:

```text
rol anterior
→ termina vigencia

rol nuevo
→ inicia vigencia
```

El contexto resuelto antes del cambio queda obsoleto.

No se permite:

```text
rol anterior + rol nuevo
→ unión temporal de matrices
```

No se permite:

```text
mantener grants del rol anterior
hasta cerrar sesión
```

La invalidación y caché se definirán en AUTH-CTX-029.

---

#### 25. Exactamente un rol base vigente

Para un empleado activo con modelo canónico completo deberá existir:

```text
0 o 1 rol base resoluble
```

El estado esperado de operación normal es:

```text
exactamente 1 rol base ACTIVE
```

Casos:

| Cantidad resoluble | Resultado                                                               |
| -----------------: | ----------------------------------------------------------------------- |
|                  0 | `base_role = null`, carril base inválido o no aplicable según identidad |
|                  1 | Validar código, fuente y estado                                         |
|           Más de 1 | Ambigüedad; no seleccionar silenciosamente                              |

Cuando existan varias asignaciones concurrentes:

```text
base_role = null
lane_readiness.base = INVALID
```

Si un código observado puede conservarse inequívocamente para diagnóstico,
podrá emitirse `INVALID`, pero nunca se elegirá el rol más nuevo, más amplio o
más privilegiado sin una regla administrativa aprobada.

---

#### 26. Fuentes prohibidas

El rol base no podrá resolverse desde:

- claims de JWT;
- `auth.users.role`;
- metadata del usuario;
- correo electrónico;
- dominio del correo;
- nombre o cargo escrito libremente;
- último rol utilizado;
- rol seleccionado en la interfaz;
- query string;
- body de una solicitud;
- cookie no firmada;
- `navigation_role`;
- plantilla de dispositivo;
- rol operativo del turno;
- perfil operativo predeterminado;
- permiso que se desea evaluar;
- existencia de filas en una matriz;
- hardcode por aplicación.

Reglas:

```text
auth.users.role = authenticated
≠ rol base laboral
```

```text
navigation_role
≠ rol base
```

```text
operational_role
≠ rol base
```

```text
claim "owner"
≠ propietario
```

---

#### 27. Dispositivo compartido

En un dispositivo compartido:

```text
principal       = SHARED_DEVICE
domain_identity = DEVICE
actor_effective = EMPLOYEE
employee        = trabajador de la sesión de actor
base_role       = rol base validado del trabajador
```

El rol base:

- no procede del dispositivo;
- no procede de la plantilla;
- no procede de `navigation_role`;
- no se fija para todos los usuarios del terminal;
- cambia cuando cambia el actor humano;
- queda invalidado cuando termina la sesión de actor.

El dispositivo puede restringir capacidades, pero no modificar el rol base.

---

#### 28. Procesos delegados

En un proceso delegado a un empleado:

```text
domain_identity = SYSTEM
actor_effective = EMPLOYEE
employee = empleado delegado
```

El `base_role` del empleado podrá resolverse para atribución y evaluación,
pero el proceso no obtiene automáticamente toda la autoridad del rol.

Regla:

```text
ROL BASE DEL EMPLEADO
+
DELEGACIÓN EXISTENTE
≠
AUTORIZACIÓN AUTOMÁTICA DEL PROCESO
```

La decisión posterior deberá comprobar:

- delegación explícita;
- propósito;
- vigencia;
- permiso exacto;
- recurso;
- alcance;
- restricciones del proceso;
- auditoría.

Un proceso no podrá elegir el rol base que desea representar.

---

#### 29. Simulación

La simulación no modifica el `base_role` real de `AccessContext`.

Regla:

```text
AccessContext.base_role
→ rol real del actor

SimulationContext.simulated_subject
→ rol hipotético evaluado
```

Un rol simulado:

- no cambia `employee.base_role_code`;
- no cambia el actor real;
- no crea grants reales;
- no produce `ALLOW` ejecutable;
- no se almacena como asignación laboral;
- no participa en RLS real.

No se emitirá un `AccessContext` real con rol ficticio para implementar
preview.

---

#### 30. Relación con el dataset de matriz base

El dataset canónico de matriz base contiene concesiones para:

```text
propietario
gerente_general
gerente
supervisor
auxiliar_administrativa
contador
marketing
```

El resolver de contexto no deberá cargar ni exponer la lista completa de
permisos dentro de `base_role`.

`base_role` solo identifica el rol validado.

La evaluación posterior:

```text
base_role.role_code
        ↓
dataset de matriz base versionado
        ↓
allows potenciales
        ↓
alcance + recurso + condiciones + denies
        ↓
LaneDecision
```

No se permitirá consultar el dataset cuando:

```text
role_status != ACTIVE
```

No se utilizarán matrices legacy como fallback.

---

#### 31. Relación con concesiones individuales

Una concesión individual base no sustituye un rol base inválido.

Regla estructural:

```text
EMPLEADO ACTIVO
+ ROL BASE INVALID
+ EMPLOYEE_BASE_ALLOW
```

no convierte automáticamente el carril base en válido.

Las concesiones individuales amplían o restringen capacidades dentro de un
carril base estructuralmente resoluble; no reparan identidad, empleo o rol.

Una excepción futura que permita un carril base sin rol deberá aprobarse
expresamente como cambio contractual y no inferirse desde la existencia de una
fila individual.

---

#### 32. Relación con cobertura administrativa

`base_role` no contiene cobertura territorial.

La cobertura se resolverá en AUTH-CTX-009 mediante:

- asignaciones de sede;
- asignaciones de área;
- clasificación del rol;
- alcances aprobados;
- reglas organizacionales;
- datos autoritativos.

Regla:

```text
base_role = gerente
≠ todas las sedes
```

```text
base_role = propietario
≠ ORGANIZATION por nombre solamente
```

La clasificación global o local define qué cobertura puede ser válida, pero
la autoridad concreta deberá proceder de reglas y asignaciones explícitas.

Esta tarea no construye `administrative_coverage`.

---

#### 33. Relación con rol operativo

`base_role` y `operational_role` podrán coexistir para un mismo empleado.

Ejemplos válidos:

```text
propietario + gerencia_operativa
```

```text
gerente + cajero_satelite
```

```text
supervisor + bodeguero
```

```text
contador + operador_integral_satelite
```

No se crea un rol combinado.

No se fusionan matrices.

No se amplían alcances.

La autorización seguirá la modalidad exacta de cada permiso.

---

#### 34. Readiness del carril base

`base_role` participa en `lane_readiness.base`.

Matriz inicial:

| Condición                                              | Readiness base                                              |
| ------------------------------------------------------ | ----------------------------------------------------------- |
| Actor no laboral                                       | `NOT_APPLICABLE`                                            |
| Empleado ausente o incoherente                         | `INVALID`                                                   |
| Empleado inactivo                                      | `INVALID`                                                   |
| `base_role = null` para empleado activo                | `INVALID`                                                   |
| `role_status = INVALID`                                | `INVALID`                                                   |
| `role_status = INACTIVE`                               | `INVALID`                                                   |
| `role_status = ACTIVE` y demás hechos base suficientes | Puede ser `READY`                                           |
| Rol activo pero cobertura todavía insuficiente         | `UNAVAILABLE` o `INVALID` según AUTH-CTX-009 y AUTH-CTX-015 |

`READY` solo significa que el carril puede evaluarse.

No significa que exista un allow.

---

#### 35. Problemas estructurales relacionados

Los códigos definitivos se congelarán en AUTH-CTX-015.

Esta tarea reserva las siguientes necesidades semánticas:

```text
base_role_missing
base_role_inactive
base_role_invalid
base_role_legacy
base_role_ambiguous
base_role_source_invalid
base_role_employee_mismatch
base_role_assignment_conflict
base_role_not_canonical
base_role_catalog_unavailable
base_role_dataset_incompatible
```

Severidad conceptual inicial:

| Problema                        | Efecto mínimo                               |
| ------------------------------- | ------------------------------------------- |
| Rol ausente en empleado activo  | `BLOCKING_BASE`                             |
| Rol inactivo                    | `BLOCKING_BASE`                             |
| Rol legacy                      | `BLOCKING_BASE`                             |
| Rol desconocido                 | `BLOCKING_BASE`                             |
| Ambigüedad de asignación        | `BLOCKING_BASE`                             |
| Empleado o actor incoherente    | Puede ser `BLOCKING_ALL`                    |
| Dataset o catálogo incompatible | `BLOCKING_BASE` y posible fallo contractual |

AUTH-CTX-015 podrá consolidar nombres y severidades sin cambiar la semántica
aprobada aquí.

---

#### 36. Comportamiento fail closed

Ante una inconsistencia no se aplicará:

- rol predeterminado;
- rol anterior;
- rol más privilegiado;
- primer rol encontrado;
- rol del dispositivo;
- rol del turno;
- mapeo por nombre;
- grant histórico;
- wildcard;
- bypass de propietario;
- fallback a `gerente_general`;
- fallback a un supuesto rol `staff`.

Regla:

```text
ROL BASE NO RESOLUBLE
→ CARRIL BASE INVALID
```

La UI podrá mostrar una explicación segura, pero no corregirá el contexto.

---

#### 37. Vigencia temporal

El rol base se evalúa en `AccessContext.resolved_at`.

La resolución deberá considerar:

- inicio de vigencia;
- fin de vigencia;
- activación;
- inactivación;
- reemplazo;
- revocación;
- versión del catálogo;
- versión del dataset.

La estructura física actual puede no contener todos estos campos.

Su diseño corresponde a BLOQUE E3.

No se asumirá que una fila existente es vigente eternamente.

---

#### 38. Obsolescencia del contexto

El contexto queda potencialmente obsoleto cuando cambia:

- asignación base del empleado;
- estado del rol;
- catálogo de roles;
- estado del empleado;
- relación entre empleado y actor;
- versión del dataset base;
- concesión o denegación individual;
- cobertura administrativa relacionada;
- versión contractual aceptada.

Una mutación sensible no deberá ejecutarse con un contexto resuelto antes de
un cambio relevante.

La estrategia de invalidación corresponde a AUTH-CTX-029.

---

#### 39. Resolución conceptual

Orden conceptual:

```text
1. Confirmar que existe actor empleado.
2. Confirmar que `employee` corresponde al actor.
3. Leer el código de asignación base desde fuente autoritativa.
4. Detectar ausencia o múltiples asignaciones.
5. Normalizar el código sin reinterpretarlo.
6. Clasificar la fuente normativa.
7. Comparar el código contra el catálogo canónico.
8. Detectar código legacy, operativo, desconocido o duplicado.
9. Validar vigencia del rol y la asignación.
10. Construir `BaseRoleContext` o emitir `null`.
11. Registrar problemas estructurales.
12. Calcular impacto sobre `lane_readiness.base`.
13. Registrar versiones y fingerprints en metadata.
14. Emitir snapshot inmutable.
```

Este orden es conceptual.

El contrato SQL se diseñará en AUTH-CTX-025.

---

#### 40. Ejemplos canónicos

##### 40.1 Propietario activo

```text
employee.base_role_code = propietario
catálogo                 = canónico y activo
fuente                    = autoritativa
```

Resultado:

```text
base_role = {
  role_code: "propietario",
  role_status: "ACTIVE",
  assignment_source: "CANONICAL_EMPLOYEE_ROLE_ASSIGNMENT"
}
```

Esto no concede todos los permisos.

##### 40.2 Gerente con varias sedes

```text
base_role = gerente ACTIVE
```

El nodo no incluirá sedes ni alcance.

AUTH-CTX-009 resolverá la cobertura.

##### 40.3 Supervisor todavía no materializado correctamente

Si la asignación administrativa declara `supervisor`, pero la fuente física
objetivo o el catálogo materializado no permite verificarlo:

```text
role_status = INVALID
```

hasta que exista una fuente canónica coherente.

El hecho de que `supervisor` esté aprobado documentalmente no autoriza a
fabricar una fila física inexistente durante la resolución.

##### 40.4 Cocinero legacy

```text
employee.base_role_code = cocinero
```

Resultado:

```text
base_role = {
  role_code: "cocinero",
  role_status: "INVALID",
  assignment_source: "LEGACY_EMPLOYEE_ROLE_ASSIGNMENT"
}
```

El turno podrá resolver `produccion_cocina` o `cocinero_satelite` de manera
independiente.

##### 40.5 Bodeguero legacy con turno bodeguero

```text
base_role.role_code       = bodeguero
base_role.role_status     = INVALID
operational_role.role_code = bodeguero
```

No se fusionan.

##### 40.6 Empleado sin rol

```text
employee activo
employee.base_role_code = null
```

Resultado:

```text
base_role = null
lane_readiness.base = INVALID
```

##### 40.7 Empleado inactivo con rol contador

```text
employee.is_active = false
base_role = contador ACTIVE
```

Resultado:

```text
atribución conservada
carriles laborales bloqueados
```

##### 40.8 Cliente que también es empleado

En Vento Pass cliente:

```text
domain_identity = CUSTOMER
actor_effective = CUSTOMER
employee = null
base_role = null
```

La existencia externa de una relación laboral no se mezcla con la vía de
cliente.

##### 40.9 Dispositivo compartido

```text
principal = SHARED_DEVICE
actor_effective = EMPLOYEE
```

El rol se resuelve desde el empleado actor, no desde el dispositivo.

##### 40.10 Rol recibido desde el frontend

```text
request.body.role_code = gerente_general
```

Resultado:

```text
ignorar como fuente autoritativa
resolver desde datos canónicos
```

---

#### 41. Exposición segura

La proyección pública podrá incluir:

- `role_code` cuando sea necesario para experiencia o diagnóstico;
- `role_status`;
- `assignment_source` normativo o una proyección segura equivalente.

No deberá incluir por defecto:

- historial de cambios de rol;
- quién aprobó la asignación;
- notas laborales;
- motivo disciplinario;
- IDs internos de migraciones;
- consultas SQL;
- tablas físicas;
- grants completos;
- denies completos;
- secretos;
- datos personales innecesarios.

La UI no deberá interpretar `role_code` como permiso.

---

#### 42. Uso permitido del rol en presentación

El rol base podrá utilizarse legítimamente para:

- mostrar una etiqueta funcional;
- explicar el contexto administrativo;
- ordenar accesos ya autorizados;
- elegir una experiencia inicial no sensible;
- mostrar mensajes específicos;
- identificar la matriz que será evaluada en servidor.

No podrá utilizarse para:

- permitir una mutación;
- saltar una verificación de permiso;
- ampliar cobertura;
- mostrar datos protegidos;
- asumir acceso global;
- autorizar una RPC;
- sustituir RLS;
- desbloquear una acción operativa.

Incorrecto:

```ts
if (baseRole === "propietario") return true;
```

Correcto conceptualmente:

```text
evaluate_authorization(
  access_context,
  permission_key,
  resolved_resource
)
```

---

#### 43. Compatibilidad con decisiones aprobadas

Esta tarea conserva:

```text
un empleado tiene un rol base permanente
```

```text
puede tener cero o un rol operativo efectivo
```

```text
no existen roles híbridos
```

```text
el turno no modifica el rol base
```

```text
el fin del turno no elimina permisos base
```

```text
el rol base no sustituye el turno
```

```text
el rol operativo no hereda permisos administrativos
```

```text
el dispositivo no tiene rol base
```

```text
la simulación no modifica el rol real
```

```text
los siete roles base usan matrices explícitas
```

No modifica catálogo, matrices, datasets ni hashes.

---

#### 44. Impacto contractual

La tarea:

- precisa la semántica de campos existentes;
- congela el conjunto de roles que pueden considerarse canónicos en la
  versión actual;
- define estados y fuentes iniciales;
- define tratamiento de legacy;
- define combinaciones válidas e inválidas;
- no agrega campos;
- no elimina campos;
- no cambia obligatoriedad raíz;
- no cambia enums publicados;
- no cambia serialización;
- no cambia `contract_version`;
- no cambia `schema_version`.

Se clasifica como:

```text
aclaración normativa compatible
dentro de AccessContext@1.0.0
```

Una futura necesidad de representar:

- varios roles base simultáneos;
- historial dentro del nodo;
- rol mínimo nuevo;
- tenant o unidad empresarial;
- jerarquía explícita;
- vigencia detallada como campos públicos;
- namespace adicional;
- assignment_id;
- clasificación de rol como campo;

requerirá análisis de versionado según AUTH-CTX-004.

---

#### 45. Dependencias posteriores

##### AUTH-MOD-021

Definirá el rol base mínimo no privilegiado para trabajadores puramente
operativos, incluyendo:

- código canónico;
- nombre humano;
- propósito empresarial;
- capacidades permanentes mínimas;
- prohibiciones expresas;
- transición desde oficios legacy;
- impacto sobre catálogo, datasets, matrices y contratos;
- tareas físicas exactas de implementación.

No bloquea `AUTH-CTX-009`.

Deberá resolverse antes de:

- `AUTH-CTX-028`, que diseñará la compatibilidad legacy;
- publicar una nueva versión del catálogo o dataset de roles base;
- transformar o retirar físicamente los oficios base legacy;
- ejecutar migraciones o backfills relacionados con el nuevo rol mínimo.

##### AUTH-CTX-009

Podrá iniciar inmediatamente después de `AUTH-CTX-008`.

Definirá `assigned_sites`, `assigned_areas` y
`administrative_coverage` utilizando los roles base canónicos vigentes, sin
inferir cobertura únicamente desde el nombre del rol y sin inventar todavía
el código del rol base mínimo reservado para `AUTH-MOD-021`.

##### AUTH-CTX-010 a AUTH-CTX-013

Definirán turno, check-in, rol y territorio operativo, manteniendo
independencia frente al rol base.

##### AUTH-CTX-014

Definirá dispositivo y sesión de actor sin convertir `navigation_role` en rol
base.

##### AUTH-CTX-015

Congelará códigos y severidades de problemas estructurales.

##### AUTH-CTX-019

Precisará la decisión del carril base y el consumo del dataset de matriz.

##### AUTH-CTX-021 y AUTH-CTX-022

Precisarán allows y denegaciones coincidentes.

##### AUTH-CTX-025

Diseñará el contrato SQL que resolverá `base_role`.

##### AUTH-CTX-026

Diseñará el evaluador que consumirá el rol sin autorizar por nombre.

##### AUTH-CTX-027

Definirá el consumo centralizado por aplicaciones.

##### AUTH-CTX-028

Definirá compatibilidad temporal con:

- `employees.role` legacy;
- matrices antiguas;
- helpers por nombre de rol;
- oficios almacenados como roles base;
- consumidores que todavía esperan roles legacy.

##### AUTH-CTX-029

Definirá invalidación cuando cambien rol, empleado, catálogo o dataset.

##### AUTH-CTX-030

Definirá pruebas contractuales.

##### BLOQUE E1 y E2

Validarán que el rol base mínimo aprobado en AUTH-MOD-021 cubra las
necesidades reales de los trabajadores operativos y sus procesos, pero no
podrán volver a diferir la definición del código ni su contrato.

##### BLOQUE E3

Definirá:

- catálogo físico objetivo;
- asignación temporal o permanente;
- vigencias;
- integridad referencial;
- retiro de duplicados;
- transición de oficios legacy;
- relación con el historial laboral.

##### BLOQUE H

Materializará tipos, schemas y helpers compartidos.

##### BLOQUE R

Implementará migraciones, backfills, constraints, adaptadores, RPC, RLS,
retiro de fallbacks y rollback en `vento-shell`.

---

#### 46. Fuera del alcance

AUTH-CTX-008 no:

- redefine principal;
- redefine actor efectivo;
- redefine identidad de dominio;
- redefine empleado;
- crea el rol base mínimo;
- agrega roles al catálogo;
- modifica las siete matrices base;
- define permisos concretos;
- define grants o denies;
- define cobertura administrativa;
- define sedes o áreas asignadas;
- define turno;
- define check-in;
- define rol operativo;
- define sede o área operativa;
- define dispositivo;
- define decisión final;
- congela códigos definitivos de invalidez;
- elimina códigos legacy;
- convierte empleados legacy;
- crea historial de roles;
- define la estructura física definitiva de asignaciones;
- modifica `public.roles`;
- modifica `employees.role`;
- modifica `operational_roles`;
- crea tipos TypeScript;
- crea JSON Schema;
- crea validadores Zod;
- crea funciones SQL;
- crea RPC;
- crea RLS;
- crea grants técnicos;
- crea triggers;
- crea migraciones;
- modifica Supabase;
- modifica aplicaciones;
- migra consumidores;
- implementa código mediante Codex.

---

#### 47. Criterios de aprobación

AUTH-CTX-008 podrá aprobarse cuando se acepte que:

1. `base_role` representa el rol laboral permanente validado del empleado;
2. el rol base no es identidad, permiso, cobertura ni decisión;
3. se conserva la forma publicada de `BaseRoleContext`;
4. no se agregan campos ni se cambian versiones;
5. los únicos roles base canónicos actuales son siete;
6. los roles globales son `propietario` y `gerente_general`;
7. los roles por sede son `gerente` y `supervisor`;
8. los roles funcionales son `auxiliar_administrativa`, `contador` y
   `marketing`;
9. ningún rol obtiene permisos por su nombre;
10. `employee.base_role_code` es referencia observada y `base_role` es
    resultado validado;
11. cuando existe `base_role`, ambos códigos coinciden exactamente;
12. `assignment_source` utiliza códigos normativos;
13. `CANONICAL_EMPLOYEE_ROLE_ASSIGNMENT` es la fuente canónica;
14. `LEGACY_EMPLOYEE_ROLE_ASSIGNMENT` conserva trazabilidad sin autorizar;
15. `role_status` puede ser `ACTIVE`, `INACTIVE` o `INVALID`;
16. `ACTIVE` exige código canónico, fuente válida, asignación única y vigencia;
17. `INACTIVE` conserva un rol canónico no utilizable;
18. `INVALID` representa código legacy, desconocido, ambiguo o inconsistente;
19. `base_role = null` representa ausencia o imposibilidad de identificar un
    código inequívoco;
20. `null` no crea un rol predeterminado;
21. no se inventa un código `staff`, `empleado` o equivalente;
22. los oficios legacy no son roles base canónicos;
23. no existe conversión automática de oficio legacy a rol operativo;
24. `bodeguero` base y `bodeguero` operativo permanecen separados por nodo y
    namespace;
25. un rol base legacy bloquea el carril base;
26. un rol base legacy no bloquea automáticamente un carril operativo válido;
27. la modalidad del permiso determina el efecto final de cada carril;
28. un empleado inactivo conserva atribución pero no autoridad;
29. el estado del empleado y el estado del rol son independientes;
30. existe como máximo un rol base vigente por empleado;
31. varias asignaciones concurrentes producen ambigüedad y fail closed;
32. el frontend, JWT, turno, dispositivo y navegación no son fuentes de rol
    base;
33. un dispositivo compartido usa el rol del actor humano;
34. un proceso delegado no hereda automáticamente toda la autoridad del rol;
35. la simulación conserva el rol real separado del rol hipotético;
36. `base_role` no incluye ni expone la lista completa de permisos;
37. solo un rol `ACTIVE` puede consultar la matriz base canónica;
38. una concesión individual no repara un rol base inválido;
39. la cobertura administrativa se reserva para AUTH-CTX-009;
40. los problemas estructurales definitivos se reservan para AUTH-CTX-015;
41. la compatibilidad legacy se reserva para AUTH-CTX-028;
42. el rol base mínimo de trabajadores operativos queda asignado a
    AUTH-MOD-021 y deberá resolverse antes de iniciar AUTH-CTX-028, publicar
    una nueva versión del catálogo o dataset de roles base, o transformar o
    retirar físicamente los oficios base legacy;
43. todo pendiente, brecha, riesgo o decisión diferida detectada deberá
    vincularse inmediatamente con una tarea existente concreta o producir
    una nueva tarea explícita antes de cerrar la tarea que lo detectó;
44. todo cambio de rol vuelve potencialmente obsoleto el contexto;
45. no existe bypass por propietario o gerente general;
46. no se implementa código, migraciones ni cambios en Supabase.

---

#### 48. Estado final de la propuesta

| Tarea        | Estado      | Relación                               |
| ------------ | ----------- | -------------------------------------- |
| AUTH-CTX-007 | APROBADA    | Tarea anterior                         |
| AUTH-CTX-008 | APROBADA    | Tarea cerrada                          |
| AUTH-CTX-009 | NO INICIADA | Continuidad inmediata                  |
| AUTH-MOD-021 | NO INICIADA | Tarea diferida obligatoria relacionada |

La continuidad inmediata queda:

```text
AUTH-CTX-008 — APROBADA
        ↓
AUTH-CTX-009 — Incluir cobertura administrativa por sede y área
```

### ✅ AUTH-CTX-009 — Incluir cobertura administrativa por sede y área

**Estado:** APROBADA  
**Bloque:** BLOQUE E — Contexto y decisión de autorización unificados  
**Naturaleza:** Refinamiento documental de `assigned_sites`, `assigned_areas` y `administrative_coverage` dentro de `AccessContext`  
**Implementación física:** No incluida  
**Tarea anterior vigente:** AUTH-CTX-008 — APROBADA  
**Tarea posterior reservada:** AUTH-CTX-010 — Incluir turno publicado y vigente  
**Tarea diferida relacionada:** AUTH-MOD-021 — No bloquea esta tarea  
**Contrato afectado:** `AccessContext@1.0.0`  
**Nodos afectados:** `assigned_sites`, `assigned_areas`, `administrative_coverage`  
**Cambio contractual:** Aclaración normativa compatible; no cambia la forma publicada  
**Cambios físicos permitidos:** No

Esta tarea define de forma exhaustiva cómo `AccessContext` representa las
sedes y áreas laboralmente asignadas al empleado y cómo resuelve su cobertura
administrativa base sin confundir:

- asignación laboral;
- sede o área primaria;
- selección de navegación;
- alcance de un permiso;
- cobertura administrativa;
- territorio operativo;
- territorio real del recurso;
- autorización final.

No modifica la estructura raíz aprobada de `AccessContext`, no agrega campos,
no cambia `contract_version`, no cambia `schema_version`, no modifica matrices
ni datasets y no implementa tipos, funciones SQL, RPC, RLS, migraciones,
adaptadores, guards, aplicaciones ni cambios físicos en Supabase.

---

#### 1. Objetivo

Definir los nodos `assigned_sites`, `assigned_areas` y
`administrative_coverage` de manera que Vento OS pueda responder
inequívocamente:

1. qué sedes están laboralmente asignadas al empleado;
2. cuáles de esas asignaciones están vigentes y son utilizables;
3. cuál sede es primaria sin convertirla en autorización;
4. qué áreas están laboralmente asignadas;
5. a qué sede pertenece cada área;
6. cuál área es primaria dentro de una sede;
7. qué cobertura administrativa base posee el actor;
8. si esa cobertura es organizacional, por sedes, por áreas, específica o
   inexistente;
9. qué fuente autoritativa produjo la cobertura;
10. si el resultado es internamente válido;
11. cómo tratar asignaciones inactivas, sedes inactivas y áreas incompatibles;
12. cómo impedir que una selección visual amplíe autoridad;
13. cómo mantener independiente el carril operativo;
14. cómo evitar que el nombre del rol se convierta en un bypass;
15. cómo conservar determinismo, trazabilidad y fail closed.

---

#### 2. Base normativa

AUTH-CTX-009 conserva sin cambios las decisiones aprobadas en:

- ADR-AUTH-001;
- AUTH-MOD-002 — Separar rol base de rol operativo;
- AUTH-MOD-003 — Definir roles administrativos globales;
- AUTH-MOD-004 — Definir roles administrativos por sede;
- AUTH-MOD-006 — Definir casos híbridos administrativo-operativos;
- AUTH-MOD-007 — Definir sede asignada y sede activa;
- AUTH-MOD-008 — Definir área asignada y área activa;
- AUTH-MOD-013 a AUTH-MOD-017 — Alcances globales, por sede, tipo de sede,
  área y tipo de área;
- AUTH-MOD-018 — Precedencia;
- AUTH-MOD-019 — Denegación explícita;
- AUTH-RBAC-001 a AUTH-RBAC-007 — Matrices base;
- AUTH-RBAC-024 — Dataset canónico de matriz base;
- AUTH-CTX-001 — Diseñar `AccessContext`;
- AUTH-CTX-004 — Versionar contratos;
- AUTH-CTX-007 — Identidad laboral o de dominio;
- AUTH-CTX-008 — Rol base vigente.

Principios heredados obligatorios:

```text
ASIGNACIÓN
≠
PERMISO
```

```text
SEDE PRIMARIA
≠
SEDE AUTORIZADA ÚNICA
```

```text
SEDE O ÁREA SELECCIONADA
≠
AUTORIDAD
```

```text
COBERTURA ADMINISTRATIVA
≠
ALLOW DE UN PERMISO
```

```text
COBERTURA ADMINISTRATIVA
≠
TERRITORIO OPERATIVO
```

---

#### 3. Separación conceptual obligatoria

El contrato mantendrá separados los siguientes conceptos:

| Concepto                 | Significado                                                      |                         Concede permisos |
| ------------------------ | ---------------------------------------------------------------- | ---------------------------------------: |
| Sede organizacional      | Unidad territorial registrada por Vento                          |                                       No |
| Sede asignada            | Relación laboral entre empleado y sede                           |                                       No |
| Sede primaria            | Referencia laboral principal                                     |                                       No |
| Sede seleccionada        | Preferencia de navegación o filtro                               |                                       No |
| Cobertura administrativa | Territorio base disponible para evaluar permisos administrativos |                                       No |
| Sede operativa           | Sede del turno vigente                                           |                                       No |
| Sede del recurso         | Territorio real afectado por la acción                           |                                       No |
| Permiso efectivo         | Capacidad concreta evaluada contra contexto y recurso            | Sí, solo si la decisión final es `ALLOW` |

La misma separación aplica a las áreas.

---

#### 4. Forma contractual conservada

AUTH-CTX-009 conserva exactamente la forma conceptual publicada:

```ts
type AssignedSiteContext = {
  site_id: string;
  site_code: string;
  is_primary: boolean;
  assignment_active: boolean;
  site_active: boolean;
  assignable: boolean;
};

type AssignedAreaContext = {
  area_id: string;
  site_id: string;
  area_kind: string;
  is_primary_for_site: boolean;
  assignment_active: boolean;
  area_active: boolean;
};

type AdministrativeCoverageContext = {
  mode:
    | "NONE"
    | "ASSIGNED_SITES"
    | "SPECIFIC_SITE"
    | "ASSIGNED_AREAS"
    | "SPECIFIC_AREA"
    | "ORGANIZATION";

  site_ids: string[];
  area_ids: string[];
  source: string;
  valid: boolean;
};
```

No se agregan propiedades.

Las precisiones de esta tarea son semánticas y compatibles con
`AccessContext@1.0.0`.

---

#### 5. Resolución exclusiva en servidor

Los tres nodos deberán resolverse en servidor.

No podrá aceptarse como fuente autoritativa:

- `selectedSite`;
- `selectedArea`;
- query string;
- parámetros de ruta;
- body enviado por el cliente;
- estado de React;
- almacenamiento local;
- cookie no firmada;
- encabezado personalizado;
- sede mostrada actualmente en la interfaz;
- sede contenida en un turno distinto al vigente;
- última sede utilizada;
- nombre del rol;
- código de navegación;
- dispositivo compartido;
- valor legacy sin validar.

El cliente podrá solicitar una vista o filtrar información, pero la
solicitud no podrá ampliar el contexto resuelto.

---

#### 6. `assigned_sites`

`assigned_sites` representa hechos laborales explícitos entre el empleado
resuelto y sedes organizacionales concretas.

No representa:

- permisos;
- cobertura global;
- turno;
- geolocalización;
- sede operativa;
- sede del recurso;
- sedes visibles por un permiso organizacional;
- sedes administradas por otra persona;
- sedes inferidas por el nombre del rol.

---

#### 7. Fuente conceptual de `assigned_sites`

La fuente normativa continúa siendo la relación canónica equivalente a:

```text
empleado
→ asignaciones laborales de sede
→ sede organizacional
```

La implementación futura no podrá utilizar `employees.site_id` como fuente
canónica definitiva.

`employees.site_id` es un dato legacy y su adaptación queda asignada a
AUTH-CTX-028.

AUTH-CTX-025 deberá diseñar el contrato SQL que produzca estas asignaciones
sin depender de la sede seleccionada por el cliente.

---

#### 8. Semántica de `AssignedSiteContext`

| Campo               | Regla                                                                                                |
| ------------------- | ---------------------------------------------------------------------------------------------------- |
| `site_id`           | Identificador exacto de la sede asignada                                                             |
| `site_code`         | Código canónico de la sede observada                                                                 |
| `is_primary`        | Indica referencia laboral principal; no concede autoridad                                            |
| `assignment_active` | La relación empleado-sede está vigente en `resolved_at`                                              |
| `site_active`       | La sede organizacional está activa en `resolved_at`                                                  |
| `assignable`        | La sede puede participar en asignaciones laborales ordinarias y en el contexto administrativo actual |

Una sede es **utilizable para cobertura administrativa** únicamente cuando:

```text
assignment_active = true
AND
site_active = true
AND
assignable = true
```

La presencia de una fila no implica que sea utilizable.

---

#### 9. Sede primaria

Reglas:

1. podrá existir como máximo una sede primaria vigente por empleado;
2. una sede primaria deberá formar parte de `assigned_sites`;
3. una sede primaria inactiva podrá conservarse como evidencia observada,
   pero no será utilizable;
4. cero sedes primarias es un estado representable;
5. más de una sede primaria vigente constituye inconsistencia estructural;
6. la sede primaria no limita automáticamente una asignación multisede;
7. la sede primaria no sustituye la cobertura administrativa;
8. la sede primaria no se utilizará como fallback cuando no exista cobertura
   válida.

---

#### 10. Lista vacía de sedes

```text
assigned_sites = []
```

significa exactamente:

```text
no se resolvieron asignaciones laborales de sede representables
```

No significa:

- todas las sedes;
- sede principal de la organización;
- sede del último turno;
- sede enviada por el frontend;
- sede implícita del rol;
- Vento Group;
- organización completa.

---

#### 11. Multisede

Varias asignaciones vigentes producen una lista multisede explícita.

```text
dos o más assigned_sites utilizables
≠
ORGANIZATION
```

La cobertura multisede seguirá siendo finita y enumerada.

Una sede nueva no se incorporará automáticamente salvo que exista una
asignación laboral o una fuente de cobertura explícita que la incluya.

---

#### 12. Orden determinista de `assigned_sites`

La serialización deberá:

1. eliminar duplicados exactos por `site_id`;
2. ubicar primero la sede primaria cuando exista;
3. ordenar después por `site_code`;
4. utilizar `site_id` como desempate;
5. conservar siempre el mismo orden para el mismo snapshot.

Un duplicado contradictorio no se deduplicará silenciosamente: producirá
invalidez estructural.

---

#### 13. `assigned_areas`

`assigned_areas` representa relaciones laborales explícitas entre el empleado
y áreas organizacionales concretas.

No representa:

- permisos;
- tipo de área autorizado;
- área activa del turno;
- área seleccionada;
- área del recurso;
- área inferida desde el rol;
- todas las áreas con el mismo nombre;
- todas las áreas del mismo `area_kind`.

---

#### 14. Fuente conceptual de `assigned_areas`

La fuente normativa continúa siendo la relación canónica equivalente a:

```text
empleado
→ asignaciones laborales de área
→ área organizacional
→ sede propietaria
```

AUTH-CTX-025 deberá diseñar el contrato SQL que produzca estas asignaciones.

AUTH-CTX-028 deberá adaptar fuentes legacy sin convertir nombres, tipos de
área o turnos históricos en asignaciones permanentes.

---

#### 15. Semántica de `AssignedAreaContext`

| Campo                 | Regla                                                    |
| --------------------- | -------------------------------------------------------- |
| `area_id`             | Identificador exacto del área asignada                   |
| `site_id`             | Sede propietaria exacta del área                         |
| `area_kind`           | Clasificación funcional del área; no sustituye `area_id` |
| `is_primary_for_site` | Referencia principal dentro de esa sede                  |
| `assignment_active`   | La relación empleado-área está vigente                   |
| `area_active`         | El área organizacional está activa                       |

Un área es utilizable para cobertura administrativa únicamente cuando:

```text
assignment_active = true
AND
area_active = true
AND
su site_id pertenece a una sede utilizable
```

---

#### 16. Integridad sede-área

Invariantes:

1. cada `area_id` pertenece a exactamente un `site_id`;
2. el `site_id` del nodo deberá coincidir con la sede propietaria real;
3. el área no podrá incorporarse si su sede es desconocida;
4. el área no podrá incorporarse como utilizable si la sede asignada es
   inactiva o no asignable;
5. un mismo nombre humano no identifica la misma área;
6. `area_kind` no podrá utilizarse como reemplazo de `area_id`;
7. una asignación de área no creará silenciosamente una asignación de sede;
8. la inconsistencia deberá fallar cerrado.

---

#### 17. Área primaria por sede

Reglas:

1. podrá existir como máximo un área primaria vigente por empleado y sede;
2. deberá pertenecer a `assigned_areas`;
3. no concede permisos;
4. no se convierte automáticamente en área administrativa activa;
5. no limita otras áreas asignadas dentro de la misma sede;
6. no sirve como fallback cuando el recurso o la cobertura no son
   resolubles.

---

#### 18. Lista vacía de áreas

```text
assigned_areas = []
```

significa exactamente:

```text
no se resolvieron asignaciones laborales de área representables
```

No significa:

- todas las áreas de las sedes asignadas;
- área general;
- área administrativa;
- área del último turno;
- cualquier área del mismo tipo;
- área seleccionada por el usuario.

---

#### 19. Orden determinista de `assigned_areas`

La serialización deberá:

1. eliminar duplicados exactos por `area_id`;
2. ordenar por `site_id`;
3. ubicar primero el área primaria de cada sede;
4. ordenar después por `area_kind`;
5. utilizar `area_id` como desempate.

Un duplicado contradictorio o un área asociada a dos sedes producirá
invalidez estructural.

---

#### 20. Definición de `administrative_coverage`

`administrative_coverage` es el territorio administrativo base resuelto para
el actor efectivo dentro del snapshot.

Es un insumo para evaluar el carril base.

No es:

- una lista de permisos;
- una concesión;
- una decisión final;
- una autorización para todas las acciones;
- el territorio operativo;
- la sede activa del turno;
- el territorio del recurso;
- una lista de pantallas visibles;
- un bypass por rol.

Fórmula conceptual:

```text
ROL BASE VÁLIDO
+
CLASE DE COBERTURA APROBADA
+
ASIGNACIONES LABORALES VÁLIDAS
+
RESTRICCIÓN EXPLÍCITA CUANDO EXISTA
=
ADMINISTRATIVE_COVERAGE
```

La autorización posterior será:

```text
PERMISO BASE APLICABLE
+
ALCANCE DEL GRANT
+
ADMINISTRATIVE_COVERAGE CUANDO EL ALCANCE LA REQUIERA
+
RECURSO REAL
+
AUSENCIA DE DENEGACIÓN APLICABLE
=
DECISIÓN DEL CARRIL BASE
```

La decisión del carril base corresponde a AUTH-CTX-019.

---

#### 21. Cobertura predeterminada de los roles base vigentes

La cobertura no se inferirá mediante comparaciones dispersas del nombre del
rol en aplicaciones, guards o SQL.

El resolver deberá consumir una clasificación canónica aprobada.

Para la versión contractual actual:

| Rol base                  | Clase funcional                  | Cobertura predeterminada |
| ------------------------- | -------------------------------- | ------------------------ |
| `propietario`             | Gobierno organizacional          | `ORGANIZATION`           |
| `gerente_general`         | Dirección ejecutiva global       | `ORGANIZATION`           |
| `gerente`                 | Administración de sede           | `ASSIGNED_SITES`         |
| `supervisor`              | Supervisión administrativa local | `ASSIGNED_SITES`         |
| `auxiliar_administrativa` | Apoyo administrativo funcional   | `ASSIGNED_SITES`         |
| `contador`                | Función financiera transversal   | `NONE`                   |
| `marketing`               | Función de marketing y contenido | `NONE`                   |

Aclaraciones obligatorias:

1. `ORGANIZATION` no concede todos los permisos;
2. `ASSIGNED_SITES` solo utiliza sedes asignadas y utilizables;
3. `NONE` no elimina permisos organizacionales o no territoriales que estén
   concedidos explícitamente en la matriz;
4. los alcances globales específicos de `contador`, `marketing` o
   `auxiliar_administrativa` pertenecen al permiso exacto y se evaluarán en
   AUTH-CTX-019;
5. ningún rol funcional se convierte por ello en administrador global;
6. los códigos legacy no participan en esta tabla;
7. AUTH-MOD-021 deberá definir la cobertura predeterminada del futuro rol base
   mínimo antes de publicar una nueva versión de roles base.

---

#### 22. Significado de los modos

##### 22.1 `NONE`

Representa ausencia de cobertura territorial administrativa base.

Deberá utilizarse cuando:

- no existe empleado laboral aplicable;
- el rol base es nulo, inactivo, legacy, desconocido o ambiguo;
- el empleado está inactivo;
- el rol funcional no posee cobertura territorial predeterminada;
- no existen asignaciones utilizables requeridas por la clase de cobertura;
- una restricción explícita válida produce un conjunto vacío;
- el actor es cliente, dispositivo o sistema sin identidad laboral
  administrativa.

Regla de forma:

```text
mode = NONE
site_ids = []
area_ids = []
```

`NONE` puede ser un resultado coherente con `valid = true`.

Cuando procede de una contradicción estructural, deberá usar
`valid = false`.

##### 22.2 `ORGANIZATION`

Representa cobertura territorial organizacional ordinaria.

Solo podrá producirse desde una clasificación canónica o autoridad
organizacional explícita.

No se producirá porque:

- el actor tiene muchas sedes;
- el rol tiene muchos permisos;
- el frontend seleccionó "Todas";
- no existen asignaciones;
- el usuario es propietario según una cadena no validada;
- una tabla legacy usa alcance `global`.

Regla de forma:

```text
mode = ORGANIZATION
site_ids = []
area_ids = []
```

Los arreglos quedan vacíos porque la organización no se representa como una
enumeración congelada de sedes.

`ORGANIZATION` excluye automáticamente:

- APP-REVIEW;
- demo;
- pruebas;
- territorios aislados;
- organizaciones o tenants futuros;
- recursos no pertenecientes a la organización ordinaria.

Su inclusión requerirá autoridad explícita evaluada en AUTH-CTX-018 y
AUTH-CTX-019.

##### 22.3 `ASSIGNED_SITES`

Representa todas las sedes utilizables presentes en `assigned_sites`.

Regla de forma:

```text
mode = ASSIGNED_SITES
site_ids = todos los site_id utilizables
area_ids = []
```

Una sola sede asignada continúa usando `ASSIGNED_SITES`.

La cardinalidad no transforma el origen semántico en `SPECIFIC_SITE`.

Si no existen sedes utilizables:

```text
mode = NONE
```

##### 22.4 `SPECIFIC_SITE`

Representa una restricción administrativa explícita a una sede exacta.

No se produce simplemente porque exista una sola sede asignada.

Requisitos:

- fuente explícita y autoritativa;
- exactamente un `site_id`;
- sede activa;
- sede asignable;
- compatibilidad con el rol base;
- justificación o política identificable;
- la restricción no puede ampliar la cobertura natural.

Regla de forma:

```text
mode = SPECIFIC_SITE
site_ids = [un site_id]
area_ids = []
```

##### 22.5 `ASSIGNED_AREAS`

Representa todas las áreas utilizables presentes en `assigned_areas`.

Solo se producirá cuando exista una política administrativa explícita que
limite el actor a sus áreas asignadas.

Regla de forma:

```text
mode = ASSIGNED_AREAS
site_ids = sedes propietarias únicas de las áreas
area_ids = todas las áreas utilizables
```

Si no existen áreas utilizables:

```text
mode = NONE
```

No se ampliará a todas las áreas de las sedes.

##### 22.6 `SPECIFIC_AREA`

Representa una restricción administrativa explícita a un área exacta.

Requisitos:

- fuente explícita y autoritativa;
- exactamente un `area_id`;
- exactamente su `site_id` propietario;
- área y sede activas;
- asignación compatible;
- la restricción no puede ampliar la cobertura natural.

Regla de forma:

```text
mode = SPECIFIC_AREA
site_ids = [site_id propietario]
area_ids = [un area_id]
```

---

#### 23. Valores canónicos de `source`

`source` deberá identificar la regla que produjo el resultado.

Valores documentales iniciales:

```text
NO_LABOR_IDENTITY
NO_ACTIVE_BASE_ROLE
BASE_ROLE_ORGANIZATION_COVERAGE
BASE_ROLE_ASSIGNED_SITES_COVERAGE
EXPLICIT_SPECIFIC_SITE_COVERAGE
EXPLICIT_ASSIGNED_AREAS_COVERAGE
EXPLICIT_SPECIFIC_AREA_COVERAGE
NO_TERRITORIAL_ADMINISTRATIVE_COVERAGE
INVALID_ADMINISTRATIVE_COVERAGE
```

No se utilizará como `source`:

- el nombre de una pantalla;
- una ruta;
- `selectedSite`;
- `selectedArea`;
- el código de un dispositivo;
- el turno;
- el último contexto;
- texto libre no versionado.

AUTH-CTX-025 deberá conservar estos valores en el contrato SQL futuro.

AUTH-CTX-030 deberá probarlos como parte del contrato.

---

#### 24. Significado de `valid`

`valid = true` significa:

- el modo es reconocido;
- la fuente es reconocida;
- los identificadores cumplen la forma del modo;
- las sedes y áreas son coherentes;
- no existen duplicados contradictorios;
- la fuente puede justificar el resultado;
- el resultado fue resuelto sin fallback permisivo.

No significa:

- que el empleado está autorizado;
- que el carril base está listo;
- que existe un permiso;
- que el recurso está dentro del alcance;
- que la decisión final será `ALLOW`.

`valid = false` significa que la cobertura no puede utilizarse para autorizar.

---

#### 25. Invariantes de forma por modo

| Modo             | `site_ids`        | `area_ids`        |
| ---------------- | ----------------- | ----------------- |
| `NONE`           | vacío             | vacío             |
| `ORGANIZATION`   | vacío             | vacío             |
| `ASSIGNED_SITES` | uno o más, únicos | vacío             |
| `SPECIFIC_SITE`  | exactamente uno   | vacío             |
| `ASSIGNED_AREAS` | uno o más, únicos | uno o más, únicos |
| `SPECIFIC_AREA`  | exactamente uno   | exactamente uno   |

Todo incumplimiento producirá:

```text
valid = false
```

Los códigos definitivos de problema estructural se congelarán en
AUTH-CTX-015.

---

#### 26. Precedencia de resolución

La cobertura se resolverá en este orden:

```text
1. validar identidad laboral y estado del empleado
2. validar base_role
3. resolver assigned_sites
4. resolver assigned_areas
5. validar coherencia sede-área
6. resolver restricción administrativa explícita aplicable
7. aplicar la cobertura predeterminada del rol
8. normalizar ids y orden
9. validar forma del modo
10. producir administrative_coverage
```

Reglas:

1. una restricción explícita puede reducir cobertura;
2. una restricción explícita no puede ampliar un rol local a
   `ORGANIZATION`;
3. una asignación adicional no modifica automáticamente la clase de
   cobertura del rol;
4. un grant global específico no modifica el modo general del contexto;
5. una denegación no se aplica dentro de `AccessContext`; se evaluará en
   `AuthorizationDecision`;
6. una contradicción no se resuelve usando la sede primaria.

---

#### 27. Roles organizacionales

Para `propietario` y `gerente_general` con rol base `ACTIVE`:

```text
administrative_coverage.mode = ORGANIZATION
```

Esto expresa cobertura territorial base, no acceso universal.

Continúan siendo obligatorios:

- permiso exacto;
- modalidad compatible;
- recurso válido;
- alcance del grant;
- ausencia de denegación aplicable;
- controles de sensibilidad;
- auditoría;
- exclusión de territorios aislados.

No existe bypass por nombre de rol.

---

#### 28. Roles administrativos por sede

Para `gerente` y `supervisor` con rol base `ACTIVE`:

```text
administrative_coverage.mode = ASSIGNED_SITES
```

La lista deberá contener exclusivamente sedes utilizables.

No se admite:

```text
gerente
→ ORGANIZATION
```

ni:

```text
supervisor
→ sede primaria únicamente
```

Una asignación multisede conserva todas las sedes utilizables.

---

#### 29. Auxiliar administrativa

Para `auxiliar_administrativa` con rol base `ACTIVE`:

```text
administrative_coverage.mode = ASSIGNED_SITES
```

cuando existan sedes utilizables.

Sin sedes utilizables:

```text
administrative_coverage.mode = NONE
```

Los permisos que la matriz define como:

- no territoriales;
- organizacionales de referencia;
- globales funcionales específicos;

se evaluarán por su alcance exacto en AUTH-CTX-019 y no convertirán al rol en
administrador global.

---

#### 30. Contador y marketing

Para `contador` y `marketing`:

```text
administrative_coverage.mode = NONE
```

salvo que exista una restricción territorial explícita válida.

Sus permisos transversales u organizacionales dependen de grants concretos,
no de una cobertura territorial general.

Por tanto:

```text
contador + permiso financiero global explícito
```

puede evaluar un recurso financiero organizacional en AUTH-CTX-019 sin
clasificar al contador como administrador global.

La misma regla aplica a capacidades concretas de marketing y contenido.

---

#### 31. Empleado inactivo

Cuando la identidad laboral es conocida pero el empleado está inactivo:

- `assigned_sites` y `assigned_areas` podrán conservar hechos representables
  para trazabilidad;
- ninguna asignación se utilizará para autoridad;
- `administrative_coverage.mode = NONE`;
- `site_ids = []`;
- `area_ids = []`;
- el carril base permanecerá no disponible;
- el carril operativo se resolverá de forma independiente según las reglas
  posteriores, sin convertir la inactividad en permiso.

AUTH-CTX-015 definirá el código estructural exacto.

---

#### 32. Rol base inválido o legacy

Cuando `base_role` sea:

- `null`;
- `INACTIVE`;
- `INVALID`;
- legacy;
- desconocido;
- ambiguo;

la cobertura será:

```text
mode = NONE
site_ids = []
area_ids = []
```

Las asignaciones podrán conservarse como hechos, pero no habilitarán el
carril base.

Un rol operativo válido no modifica esta cobertura.

La compatibilidad temporal queda asignada a AUTH-CTX-028.

---

#### 33. Actores no laborales

Para clientes, dispositivos o sistemas sin identidad laboral administrativa:

```text
assigned_sites = []
assigned_areas = []
administrative_coverage = {
  mode: "NONE",
  site_ids: [],
  area_ids: [],
  source: "NO_LABOR_IDENTITY",
  valid: true
}
```

No se inventará un empleado ni un rol base.

Los contratos específicos de actores de sistema continúan separados.

---

#### 34. Independencia frente al carril operativo

La cobertura administrativa:

- no depende de turno;
- no depende de check-in;
- no desaparece con check-out;
- no cambia por el rol operativo;
- no toma la sede operativa como fallback;
- no toma el área operativa como fallback;
- no se amplía por un dispositivo compartido.

El territorio operativo se definirá en AUTH-CTX-013.

Ejemplo híbrido:

```text
gerente
administrative_coverage = ASSIGNED_SITES [VENTO_CAFE, SAUDO]

turno vigente
operational_site = CENTRO_PRODUCCION
operational_area = BODEGA
```

Los dos territorios permanecen separados.

---

#### 35. Selección administrativa y navegación

Una aplicación podrá permitir que el usuario seleccione una sede o área para
filtrar la interfaz.

La selección deberá cumplir:

```text
selección solicitada
∩
administrative_coverage válida
=
vista administrativa posible
```

La selección:

- no modifica `assigned_sites`;
- no modifica `assigned_areas`;
- no modifica `administrative_coverage`;
- no concede permisos;
- no se persiste como autoridad;
- no altera el recurso real;
- no convierte `NONE` en cobertura válida.

AUTH-CTX-027 deberá exigir este consumo centralizado.

---

#### 36. Relación con el alcance de los permisos

`administrative_coverage` no sustituye los alcances aprobados en
AUTH-MOD-013 a AUTH-MOD-017.

Ejemplos:

```text
grant = ASSIGNED_SITES
→ usa administrative_coverage y assigned_sites
```

```text
grant = ASSIGNED_AREAS
→ usa assigned_areas y la coherencia de sedes
```

```text
grant = SPECIFIC_SITE
→ exige coincidencia exacta con el recurso
```

```text
grant = ORGANIZATION
→ depende del permiso exacto y no requiere convertir el modo del actor
  funcional en ORGANIZATION
```

```text
grant = NON_TERRITORIAL
→ no inventa sede ni área
```

La composición definitiva corresponde a AUTH-CTX-019.

---

#### 37. Relación con el recurso real

AUTH-CTX-009 no decide si un recurso concreto está dentro del alcance.

AUTH-CTX-018 deberá resolver:

- `resource_site_id`;
- `resource_area_id`;
- territorios de origen;
- territorios de destino;
- recursos organizacionales no territoriales;
- operaciones multiterritoriales.

AUTH-CTX-019 deberá comparar esos territorios contra:

- el grant aplicable;
- `administrative_coverage`;
- `assigned_sites`;
- `assigned_areas`;
- denegaciones aplicables.

---

#### 38. Operaciones multiterritoriales

La presencia de varias sedes o áreas en `administrative_coverage` no implica
que toda operación multiterritorial sea autorizable.

Ejemplo:

```text
remisión
origen = Centro de Producción
destino = Vento Café
```

AUTH-CTX-018 deberá resolver ambos territorios.

AUTH-CTX-019 deberá exigir cobertura suficiente para cada territorio
obligatorio según el contrato del permiso.

No se autorizará una operación completa porque solo uno de sus territorios
coincida.

---

#### 39. APP-REVIEW y territorios aislados

APP-REVIEW, demo, pruebas y territorios aislados no se incorporan mediante:

- `ORGANIZATION`;
- tipo de sede;
- asignación multisede;
- rol global;
- sede primaria;
- nombre del rol.

Su tratamiento deberá ser explícito en la resolución del recurso y la
decisión del carril base mediante AUTH-CTX-018 y AUTH-CTX-019.

---

#### 40. Obsolescencia del snapshot

Un `AccessContext` queda potencialmente obsoleto cuando cambia:

- una asignación de sede;
- una asignación de área;
- la sede primaria;
- el área primaria;
- el estado de una sede;
- el estado de un área;
- la condición `assignable`;
- el estado del empleado;
- el rol base;
- la clasificación canónica de cobertura;
- una restricción administrativa explícita.

AUTH-CTX-029 definirá invalidación, caché y fingerprint.

---

#### 41. Casos de ejemplo

##### Caso A — Gerente multisede

```text
base_role = gerente
assigned_sites = [VENTO_CAFE, SAUDO]
assigned_areas = []
```

Resultado:

```text
mode = ASSIGNED_SITES
site_ids = [SAUDO, VENTO_CAFE]
area_ids = []
source = BASE_ROLE_ASSIGNED_SITES_COVERAGE
valid = true
```

No equivale a organización.

##### Caso B — Supervisor con una sede primaria

```text
assigned_sites = [VENTO_CAFE primary]
```

Resultado:

```text
mode = ASSIGNED_SITES
site_ids = [VENTO_CAFE]
```

No cambia a `SPECIFIC_SITE`, porque la fuente continúa siendo el conjunto de
sedes asignadas.

##### Caso C — Propietario

```text
base_role = propietario ACTIVE
```

Resultado:

```text
mode = ORGANIZATION
site_ids = []
area_ids = []
source = BASE_ROLE_ORGANIZATION_COVERAGE
valid = true
```

No concede todos los permisos.

##### Caso D — Auxiliar administrativa con dos sedes

```text
base_role = auxiliar_administrativa
assigned_sites = [VENTO_GROUP, CENTRO_PRODUCCION]
```

Resultado:

```text
mode = ASSIGNED_SITES
site_ids = [CENTRO_PRODUCCION, VENTO_GROUP]
```

Un permiso global funcional concreto podrá evaluarse posteriormente sin
convertir el rol en administrador global.

##### Caso E — Contador

```text
base_role = contador
assigned_sites = [VENTO_GROUP]
```

Resultado base:

```text
mode = NONE
site_ids = []
area_ids = []
source = NO_TERRITORIAL_ADMINISTRATIVE_COVERAGE
valid = true
```

Un permiso financiero global explícito se evaluará por su grant en
AUTH-CTX-019.

##### Caso F — Restricción específica de área

```text
restricción explícita = Repostería / Centro de Producción
```

Resultado:

```text
mode = SPECIFIC_AREA
site_ids = [CENTRO_PRODUCCION]
area_ids = [REPOSTERIA]
source = EXPLICIT_SPECIFIC_AREA_COVERAGE
valid = true
```

##### Caso G — Área incompatible

```text
area_id = CAJA_VENTO_CAFE
site_id declarado = SAUDO
```

Resultado:

```text
valid = false
```

No se corrige por nombre, tipo de área ni sede primaria.

##### Caso H — Rol base legacy

```text
base_role.role_status = INVALID
assigned_sites = [CENTRO_PRODUCCION]
```

Resultado:

```text
mode = NONE
site_ids = []
area_ids = []
valid = true
```

El carril base queda bloqueado por el rol inválido; la compatibilidad se
tratará en AUTH-CTX-028.

---

#### 42. Inconsistencias estructurales detectables

AUTH-CTX-009 identifica las siguientes clases de inconsistencia:

1. más de una sede primaria vigente;
2. más de un área primaria vigente por sede;
3. asignación duplicada con estados contradictorios;
4. área asociada a una sede incorrecta;
5. área utilizable cuya sede no es utilizable;
6. `site_id` desconocido;
7. `area_id` desconocido;
8. `area_kind` incompatible con el área;
9. modo desconocido;
10. fuente desconocida;
11. identificadores incompatibles con el modo;
12. `ORGANIZATION` sin fuente organizacional válida;
13. `SPECIFIC_SITE` sin fuente explícita;
14. `SPECIFIC_AREA` sin fuente explícita;
15. cobertura ampliada por una selección del cliente;
16. cobertura derivada de un rol legacy;
17. fallback a `employees.site_id`;
18. fallback a la sede o área del turno;
19. cobertura no determinista.

AUTH-CTX-015 deberá asignar códigos, severidades y efecto exacto a estas
clases.

Hasta entonces, ninguna inconsistencia podrá producir autoridad.

---

#### 43. Fail closed

Ante contradicción o ambigüedad:

```text
administrative_coverage.valid = false
```

y la cobertura no podrá utilizarse para autorizar.

Queda prohibido:

- elegir arbitrariamente una sede;
- elegir la sede primaria;
- usar la primera fila;
- usar la sede seleccionada;
- eliminar filas contradictorias;
- convertir una lista vacía en organización;
- tratar un valor desconocido como `NONE` válido sin conservar la
  inconsistencia;
- ampliar el modo para evitar un bloqueo.

---

#### 44. Minimización de datos

`assigned_sites` y `assigned_areas` no deberán incluir:

- nombres completos innecesarios;
- direcciones;
- geocercas;
- coordenadas;
- datos de contacto;
- responsables;
- horarios;
- permisos;
- información financiera;
- perfiles operativos;
- metadatos de navegación.

El contexto conservará únicamente los campos contractuales publicados.

---

#### 45. Relación con tareas posteriores

##### AUTH-CTX-010

Definirá el turno publicado y vigente.

No modificará la cobertura administrativa.

##### AUTH-CTX-011

Definirá el check-in activo.

No concederá cobertura administrativa.

##### AUTH-CTX-012

Definirá el rol operativo efectivo.

No reemplazará el rol base ni su cobertura.

##### AUTH-CTX-013

Definirá sede y área operativas como territorio separado.

##### AUTH-CTX-014

Definirá el dispositivo compartido sin convertir sede o área del dispositivo
en cobertura laboral.

##### AUTH-CTX-015

Congelará códigos y severidades de las inconsistencias enumeradas en la
sección 42.

##### AUTH-CTX-018

Resolverá el territorio real del recurso.

##### AUTH-CTX-019

Evaluará el carril base combinando grants, cobertura, recurso y denegaciones.

##### AUTH-CTX-025

Diseñará el contrato SQL de `get_access_context` para producir los tres nodos
sin confiar en datos del cliente.

##### AUTH-CTX-026

Diseñará el evaluador que consumirá la cobertura sin convertirla en permiso.

##### AUTH-CTX-027

Definirá el consumo centralizado por aplicaciones y selectores.

##### AUTH-CTX-028

Definirá compatibilidad con `employees.site_id`, fuentes legacy y consumidores
antiguos.

##### AUTH-CTX-029

Definirá invalidación y caché ante cambios territoriales.

##### AUTH-CTX-030

Definirá pruebas contractuales, determinismo y casos negativos.

##### AUTH-MOD-021

Definirá la cobertura predeterminada del rol base mínimo antes de
AUTH-CTX-028, de publicar una nueva versión de roles base o de transformar
oficios legacy.

No bloquea AUTH-CTX-010.

---

#### 46. Fuera del alcance

AUTH-CTX-009 no:

- crea sedes;
- crea áreas;
- asigna empleados a sedes;
- asigna empleados a áreas;
- corrige asignaciones actuales;
- redefine roles base;
- crea el rol mínimo;
- modifica matrices;
- modifica grants;
- define denegaciones concretas;
- resuelve permisos;
- resuelve recursos;
- decide el carril base;
- define turno;
- define check-in;
- define rol operativo;
- define sede o área operativa;
- define dispositivos;
- crea tablas;
- crea funciones;
- crea RPC;
- crea RLS;
- crea migraciones;
- implementa caché;
- modifica Supabase;
- modifica aplicaciones.

Las responsabilidades posteriores están asignadas de forma explícita en la
sección 45.

---

#### 47. Riesgos controlados

##### Riesgo 1 — Multisede interpretada como global

Control:

```text
ASSIGNED_SITES siempre enumera ids
```

##### Riesgo 2 — Sede primaria usada como autorización

Control:

```text
is_primary es referencia, no permiso
```

##### Riesgo 3 — Área inferida por nombre o tipo

Control:

```text
area_id exacto + site_id propietario
```

##### Riesgo 4 — Rol funcional convertido en administrador global

Control:

```text
cobertura territorial predeterminada
≠
alcance global de un permiso exacto
```

##### Riesgo 5 — Selector visual amplía autoridad

Control:

```text
selección ∩ cobertura
```

##### Riesgo 6 — Turno contamina carril base

Control:

```text
administrative_coverage
≠
operational_site / operational_area
```

##### Riesgo 7 — Lista vacía permisiva

Control:

```text
[] = ninguna asignación
```

##### Riesgo 8 — Inconsistencia corregida silenciosamente

Control:

```text
valid = false
+ fail closed
```

---

#### 48. Criterios de aprobación

AUTH-CTX-009 podrá aprobarse cuando se acepte que:

1. `assigned_sites`, `assigned_areas` y `administrative_coverage` conservan
   la forma de `AccessContext@1.0.0`;
2. la tarea es una aclaración normativa compatible;
3. los nodos se resuelven exclusivamente en servidor;
4. la sede seleccionada no es fuente de autoridad;
5. el área seleccionada no es fuente de autoridad;
6. `employees.site_id` no es fuente canónica definitiva;
7. su compatibilidad queda en AUTH-CTX-028;
8. una asignación de sede no concede permisos;
9. una asignación de área no concede permisos;
10. una lista vacía no significa organización;
11. multisede no significa global;
12. una sede primaria no limita todas las asignaciones;
13. una sede primaria no sirve como fallback;
14. cada área pertenece a una sede exacta;
15. `area_id` y `area_kind` permanecen separados;
16. un área incompatible falla cerrado;
17. las listas tienen orden determinista;
18. duplicados contradictorios no se eliminan silenciosamente;
19. `administrative_coverage` es un insumo, no una decisión;
20. `ORGANIZATION` no concede todos los permisos;
21. `propietario` y `gerente_general` usan cobertura organizacional sin
    bypass;
22. `gerente` y `supervisor` usan sedes asignadas;
23. `auxiliar_administrativa` usa sedes asignadas como cobertura territorial
    predeterminada;
24. `contador` y `marketing` no reciben cobertura territorial general por el
    nombre del rol;
25. sus permisos globales específicos se evalúan por grant;
26. `NONE` puede ser un resultado válido;
27. una inconsistencia produce `valid = false`;
28. los modos tienen formas estrictas de ids;
29. `SPECIFIC_SITE` exige fuente explícita;
30. `SPECIFIC_AREA` exige fuente explícita;
31. una sola sede asignada continúa siendo `ASSIGNED_SITES`;
32. una sola área explícita puede ser `SPECIFIC_AREA` únicamente por su
    fuente;
33. la cobertura administrativa no depende del turno;
34. la cobertura administrativa no depende del check-in;
35. la cobertura administrativa no cambia con check-out;
36. el rol operativo no amplía la cobertura administrativa;
37. el dispositivo no amplía cobertura;
38. el empleado inactivo conserva atribución, no autoridad;
39. un rol base legacy produce cobertura `NONE`;
40. actores no laborales no reciben cobertura laboral;
41. APP-REVIEW y territorios aislados no se incorporan automáticamente;
42. AUTH-CTX-015 definirá códigos estructurales;
43. AUTH-CTX-018 resolverá el territorio real;
44. AUTH-CTX-019 resolverá la decisión del carril base;
45. AUTH-CTX-025 diseñará el productor SQL;
46. AUTH-CTX-027 controlará el consumo por aplicaciones;
47. AUTH-CTX-029 definirá invalidación;
48. AUTH-CTX-030 definirá pruebas contractuales;
49. AUTH-MOD-021 no bloquea AUTH-CTX-010;
50. no se implementa código, migraciones ni cambios en Supabase.

---

#### 49. Estado final de la propuesta

| Tarea        | Estado      | Relación                   |
| ------------ | ----------- | -------------------------- |
| AUTH-CTX-008 | APROBADA    | Tarea anterior             |
| AUTH-CTX-009 | APROBADA    | Tarea actual               |
| AUTH-CTX-010 | NO INICIADA | Tarea siguiente reservada  |
| AUTH-MOD-021 | NO INICIADA | Tarea diferida relacionada |

La continuidad propuesta permanece:

```text
AUTH-CTX-008 — APROBADA
        ↓
AUTH-CTX-009 — APROBADA
        ↓
AUTH-CTX-010 — NO INICIADA
```

No se avanza a AUTH-CTX-010 hasta recibir aprobación explícita de
AUTH-CTX-009.


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


### ✅ AUTH-CTX-012 — Incluir rol operativo efectivo

**Estado:** APROBADA  
**Bloque:** BLOQUE E — Contexto y decisión de autorización unificados  
**Naturaleza:** Refinamiento documental del nodo `operational_role` dentro de `AccessContext`  
**Implementación física:** No incluida  
**Tarea anterior vigente:** AUTH-CTX-011 — APROBADA  
**Tarea posterior reservada:** AUTH-CTX-013 — Incluir sede y área operativas  
**Contrato afectado:** `AccessContext@1.0.0`  
**Nodo afectado:** `operational_role`  
**Cambio contractual:** Aclaración normativa compatible; no cambia la forma publicada  
**Cambios físicos permitidos:** No

Esta tarea define cómo `AccessContext` resuelve el rol operativo efectivo del
actor laboral a partir del turno publicado y vigente, verificando que el rol:

- pertenece al catálogo operativo canónico;
- está activo;
- coincide exactamente con el turno;
- está habilitado en la sede del turno;
- es compatible con el área del turno;
- no procede del rol base;
- no procede de perfiles predeterminados;
- no procede del dispositivo;
- no procede de navegación;
- no constituye un permiso;
- no constituye un bypass;
- no mezcla el carril base con el carril operativo.

No modifica la estructura raíz de `AccessContext`, no agrega campos, no cambia
`contract_version`, no cambia `schema_version`, no implementa SQL, RPC, RLS,
migraciones, constraints, backfills, aplicaciones ni cambios físicos en
Supabase.

---

#### 1. Objetivo

Definir el nodo `operational_role` de manera que Vento OS pueda responder
inequívocamente:

1. cuál código de rol operativo fue asignado al turno vigente;
2. si dicho código existe en el catálogo operativo canónico;
3. si el rol está activo en `resolved_at`;
4. si pertenece al catálogo correcto;
5. si está habilitado en la sede del turno;
6. si es compatible con el área del turno;
7. si el rol requiere un área específica;
8. cómo se tratan habilitaciones de sede completa;
9. cómo se tratan habilitaciones por área;
10. qué ocurre con roles legacy o deprecados;
11. qué ocurre cuando el mismo texto existe en el catálogo base y operativo;
12. qué ocurre cuando el rol no posee permisos asignados;
13. qué ocurre cuando falta check-in;
14. qué ocurre cuando el rol está bien asignado pero el territorio es
    incompatible;
15. cuándo el nodo debe ser `null`;
16. cuándo puede existir con validaciones territoriales negativas;
17. cómo afecta a permisos `N`, `T` y `T+C`;
18. cómo mantener separados los carriles;
19. cómo impedir fallbacks y bypasses;
20. cómo preservar determinismo, trazabilidad y fail closed.

---

#### 2. Base normativa

AUTH-CTX-012 conserva sin cambios las decisiones aprobadas en:

- ADR-AUTH-001;
- AUTH-MOD-001 — Identidad laboral y actor efectivo;
- AUTH-MOD-002 — Separar rol base de rol operativo;
- AUTH-MOD-005 — Definir roles operativos;
- AUTH-MOD-006 — Definir casos híbridos administrativo-operativos;
- AUTH-MOD-007 — Definir sede asignada y sede activa;
- AUTH-MOD-008 — Definir área asignada y área activa;
- AUTH-MOD-009 — Definir turno publicado;
- AUTH-MOD-010 — Definir check-in activo;
- AUTH-MOD-011 — Definir sesión en dispositivo compartido;
- AUTH-MOD-018 — Definir precedencia entre permisos base y operativos;
- AUTH-MOD-019 — Definir reglas de denegación explícita;
- AUTH-CAT-006 — Definir modalidad de autorización;
- AUTH-CAT-007 — Clasificar permisos operativos;
- AUTH-CAT-012 — Definir prerrequisitos de turno y check-in;
- AUTH-CAT-013 — Definir permisos que exigen área activa;
- AUTH-CAT-014 — Definir permisos que admiten dispositivo compartido;
- AUTH-RBAC-009 a AUTH-RBAC-021 — Matrices operativas canónicas;
- AUTH-RBAC-025 — Dataset canónico de matriz operativa;
- AUTH-CTX-001 — Diseñar `AccessContext`;
- AUTH-CTX-004 — Versionar contratos;
- AUTH-CTX-005 a AUTH-CTX-011 — Identidad, actor, empleado, rol base,
  cobertura administrativa, turno y check-in.

Principios heredados obligatorios:

```text
ROL OPERATIVO EFECTIVO
=
ROL ASIGNADO AL TURNO PUBLICADO Y VIGENTE
+
VALIDACIÓN DEL CATÁLOGO
+
VALIDACIÓN DE SEDE
+
VALIDACIÓN DE ÁREA CUANDO APLIQUE
```

```text
ROL OPERATIVO
≠
ROL BASE
```

```text
ROL OPERATIVO
≠
PERMISO
```

```text
ROL OPERATIVO
≠
PERFIL PREDETERMINADO
```

```text
ROL OPERATIVO
≠
ROL DE NAVEGACIÓN
```

```text
ROL OPERATIVO
≠
DISPOSITIVO
```

```text
SIN TURNO VÁLIDO
→
SIN ROL OPERATIVO EFECTIVO
```

---

#### 3. Catálogo operativo canónico vigente

El catálogo canónico aprobado contiene doce roles operativos:

```text
OPERACIÓN SATÉLITE
├── cajero_satelite
├── barista_satelite
├── cocinero_satelite
├── servicio_salon
├── mostrador_satelite
└── operador_integral_satelite

PRODUCCIÓN
├── produccion_cocina
├── produccion_panaderia
└── produccion_reposteria

LOGÍSTICA
├── bodeguero
└── conductor_logistica

COORDINACIÓN OPERATIVA
└── gerencia_operativa
```

El código:

```text
propietario_admin
```

es no canónico y está en proceso de deprecación.

No podrá producir `operational_role`.

La incorporación, renombre, reactivación o retiro de un rol operativo exige
cambio contractual y nueva versión de los datasets afectados.

---

#### 4. Forma contractual conservada

AUTH-CTX-012 conserva exactamente la forma conceptual publicada:

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

No se agregan propiedades.

La publicación permanece:

```text
AccessContext
contract_version = 1.0.0
schema_version   = 1.0.0
```

---

#### 5. Semántica raíz de `operational_role`

`operational_role` representa el rol operativo canónico observado en el
`active_shift`, acompañado de la validación territorial necesaria para
determinar si puede participar en el carril operativo.

Fuente única:

```text
active_shift.operational_role_code
→ catálogo operativo canónico
→ habilitación de sede
→ compatibilidad de área
→ operational_role
```

El nodo no contiene:

- permisos;
- grants;
- denegaciones;
- bypasses;
- navegación;
- aplicaciones;
- acciones autorizadas;
- decisión final.

---

#### 6. Condición mínima de existencia

Para producir un nodo no nulo deberán cumplirse como mínimo:

1. existe `employee`;
2. el empleado está activo;
3. existe `active_shift`;
4. el turno pertenece al actor efectivo;
5. `active_shift.operational_role_code` está presente;
6. el código es canónico;
7. el rol existe en el catálogo operativo;
8. el rol está activo;
9. el rol no está deprecado;
10. la referencia no es ambigua;
11. `shift_id`, `site_id` y `area_id` proceden del mismo turno.

Si falla cualquiera de estas condiciones básicas:

```text
operational_role = null
```

y deberá registrarse el problema estructural aplicable.

---

#### 7. Fuente exclusiva: el turno

El código efectivo procede exclusivamente de:

```text
active_shift.operational_role_code
```

No procede de:

- `employees.role`;
- `base_role`;
- `employee_site_operational_profiles.default_operational_role`;
- último turno;
- último rol usado;
- área seleccionada;
- sede seleccionada;
- `navigation_role`;
- plantilla de dispositivo;
- sesión de dispositivo;
- permiso solicitado;
- aplicación abierta;
- pantalla visitada;
- nombre del cargo;
- nombre del área;
- alias informal;
- heurística por oficio;
- cadena enviada por el frontend.

---

#### 8. Código asignado y código efectivo

En `AccessContext@1.0.0` el contrato publica un único:

```text
role_code
```

Este valor será exactamente el código canónico resuelto desde el turno.

Regla:

```text
role_code
=
active_shift.operational_role_code validado
```

No se aplicará dentro de esta tarea:

- traducción aproximada;
- normalización por nombre;
- coincidencia parcial;
- `LIKE`;
- `ILIKE`;
- pluralización;
- prefijos;
- inferencia por familia;
- conversión de rol base a operativo.

Una adaptación legacy explícita solo podrá diseñarse en AUTH-CTX-028 y deberá
producir un código canónico antes de ingresar al contrato.

---

#### 9. Separación de namespaces

La resolución deberá consultar explícitamente el catálogo operativo.

```text
operational_role_code
→ operational_roles
```

No:

```text
operational_role_code
→ roles
```

El hecho de que un texto exista también en el catálogo base no convierte
automáticamente el rol operativo en ambiguo cuando la fuente y el namespace
son explícitos.

Caso actual:

```text
bodeguero
```

La resolución operacional deberá interpretarlo exclusivamente como rol
operativo cuando procede del campo operacional del turno.

Sin embargo, cualquier consumidor que use una cadena no tipada para consultar
ambos catálogos constituye una incompatibilidad legacy y deberá corregirse en
AUTH-CTX-028 y AUTH-CTX-027.

El retiro físico del duplicado base se ejecutará únicamente mediante
AUTH-DB-020 y AUTH-DB-030 después de aprobar compatibilidad, backfill y
adopción.

---

#### 10. Rol activo

El rol deberá estar activo en `resolved_at`.

Un rol inactivo o deprecado:

```text
operational_role = null
```

aunque:

- el turno siga vigente;
- el check-in esté activo;
- exista una matriz histórica;
- el frontend lo muestre;
- el dispositivo lo reconozca;
- el empleado lo haya usado antes.

La desactivación del rol deberá invalidar snapshots mediante AUTH-CTX-029.

---

#### 11. Rol no canónico o deprecado

Los siguientes casos no producen rol efectivo:

- `propietario_admin`;
- código legacy no mapeado;
- rol base usado como operativo;
- código inexistente;
- código inactivo;
- alias no aprobado;
- valor vacío;
- valor ambiguo;
- nombre humano usado como código.

Resultado:

```text
operational_role = null
```

No se utilizará un rol “más parecido”.

---

#### 12. `shift_id`

El nodo deberá conservar:

```text
operational_role.shift_id
=
active_shift.shift_id
```

No podrá referir:

- otro turno;
- una plantilla;
- un perfil;
- una sesión anterior;
- un turno cancelado;
- un turno futuro;
- una simulación real presentada como efectiva.

Una discrepancia produce:

```text
operational_role = null
```

y problema estructural.

---

#### 13. `site_id`

El nodo deberá conservar:

```text
operational_role.site_id
=
active_shift.site_id
```

Este campo representa la sede en la cual el turno intenta activar el rol.

No representa:

- cobertura administrativa;
- sede primaria;
- sede seleccionada;
- punto de check-in;
- sede del dispositivo;
- sede del recurso;
- cualquier sede en la que el empleado haya trabajado antes.

AUTH-CTX-013 convertirá esta referencia en `operational_site`.

---

#### 14. `area_id`

El nodo deberá conservar:

```text
operational_role.area_id
=
active_shift.area_id
```

Puede ser `null` únicamente cuando el rol y su habilitación territorial
permitan operación sin área específica.

No podrá completarse desde:

- perfil operativo;
- área del dispositivo;
- área seleccionada;
- último check-in;
- nombre del rol;
- primera área habilitada;
- única área encontrada;
- área principal del empleado.

AUTH-CTX-013 convertirá esta referencia en `operational_area`.

---

#### 15. Habilitación por sede

`valid_for_site` indica si el rol operativo está habilitado de forma vigente
en la sede exacta del turno.

Regla conceptual:

```text
valid_for_site = true
```

solo cuando existe una habilitación canónica activa equivalente a:

```text
site_operational_roles
role_code = operational_role.role_code
site_id   = operational_role.site_id
is_active = true
```

y además:

- la sede existe;
- la sede está activa;
- la sede es operativa;
- el rol está activo;
- la relación no está deprecada;
- no existe contradicción de configuración.

La asignación laboral del empleado a una sede y la habilitación del rol en la
sede son validaciones diferentes.

---

#### 16. Resultado de `valid_for_site`

Casos:

```text
rol habilitado en la sede
→ valid_for_site = true
```

```text
rol no habilitado en la sede
→ valid_for_site = false
```

```text
sede inexistente, inactiva o incompatible
→ valid_for_site = false
```

```text
habilitaciones contradictorias
→ valid_for_site = false
→ structural_issue
```

El nodo podrá conservarse con:

```text
valid_for_site = false
```

cuando el código del rol sea canónico y activo, con el fin de exponer el
hecho observado y permitir diagnóstico estructurado.

Pero ese nodo no podrá habilitar el carril operativo.

---

#### 17. Habilitación por área

`valid_for_area` indica si la combinación de:

```text
role_code
+
site_id
+
area_id
```

es compatible con la definición canónica del rol y con las habilitaciones
territoriales vigentes.

La validación deberá considerar:

- si el rol requiere área;
- si la sede habilita el rol por área específica;
- si la sede habilita el rol como función site-wide;
- si el área existe;
- si el área pertenece a la sede;
- si el área está activa;
- si la habilitación está activa;
- si el rol puede operar sin área.

---

#### 18. Roles con área obligatoria

Cuando la definición canónica del rol establezca:

```text
requires_area = true
```

será obligatorio:

```text
area_id != null
```

y deberá existir una habilitación activa compatible con dicha área.

Resultado:

```text
area_id = null
→ valid_for_area = false
```

No se completará el área desde ningún fallback.

La matriz descriptiva aprobada identifica como roles normalmente ligados a
área:

- `cajero_satelite`;
- `barista_satelite`;
- `cocinero_satelite`;
- `servicio_salon`;
- `mostrador_satelite`;
- `produccion_cocina`;
- `produccion_panaderia`;
- `produccion_reposteria`;
- `bodeguero`.

La obligatoriedad física final deberá provenir del catálogo canónico
versionado, no de comparaciones de texto dentro de aplicaciones.

---

#### 19. Roles con área dependiente de la sede

Para:

- `operador_integral_satelite`;
- `gerencia_operativa`;

la necesidad de área puede depender de la configuración aprobada de la sede.

La resolución deberá consumir una política explícita.

No se admitirá:

- asumir área obligatoria por nombre;
- asumir área opcional por familia;
- usar la primera configuración encontrada;
- convertir configuración incompleta en site-wide.

Si la sede no define de forma inequívoca la modalidad:

```text
valid_for_area = false
```

---

#### 20. Conductor logístico

`conductor_logistica` podrá operar con:

- un área general válida; o
- una habilitación site-wide explícita que permita ausencia de área.

No se asumirá que:

```text
conductor_logistica
→ cualquier sede
→ cualquier área
```

La sede del turno continúa siendo obligatoria.

Cuando `area_id = null`, la ausencia solo será válida si la configuración
canónica de la sede lo permite expresamente.

---

#### 21. Habilitación site-wide

Una habilitación site-wide se representa conceptualmente mediante una
asignación de rol a sede sin restricción de área.

No significa:

- todas las sedes;
- todas las organizaciones;
- todas las aplicaciones;
- todos los permisos;
- cualquier área sin validación;
- bypass territorial.

Reglas:

1. solo aplica a la sede exacta;
2. deberá estar activa;
3. deberá ser compatible con la definición del rol;
4. si el rol exige área, `area_id` continúa siendo obligatorio;
5. si existe área, deberá pertenecer a la sede;
6. no amplía permisos;
7. no reemplaza el territorio del recurso.

---

#### 22. Habilitación por área específica

Una habilitación por área exige coincidencia exacta:

```text
configured.area_id
=
active_shift.area_id
```

No se utilizará:

- `area_kind` como sustituto de `area_id`;
- nombre humano;
- coincidencia parcial;
- área equivalente;
- área de otra sede;
- tipo de área parecido;
- jerarquía implícita.

Un rol habilitado en Repostería no queda habilitado automáticamente en
Panadería aunque ambos pertenezcan a Producción.

---

#### 23. Precedencia entre habilitación site-wide y específica

La resolución no sumará configuraciones contradictorias.

Reglas:

1. una coincidencia exacta por área puede validar esa área;
2. una habilitación site-wide puede validar una operación sin área cuando el
   rol lo permita;
3. una habilitación site-wide no anula una prohibición o restricción
   explícita futura;
4. filas duplicadas equivalentes se normalizarán como una sola evidencia;
5. filas contradictorias producirán `valid_for_area = false`;
6. no se elegirá la configuración “más permisiva”;
7. denegaciones explícitas se evaluarán posteriormente en
   `AuthorizationDecision`, sin ser absorbidas por este nodo.

---

#### 24. Significado de `valid_for_area`

Casos:

```text
rol con área obligatoria
+
área exacta válida
→ valid_for_area = true
```

```text
rol con área obligatoria
+
area_id null
→ valid_for_area = false
```

```text
rol con área opcional
+
area_id null
+
habilitación site-wide explícita
→ valid_for_area = true
```

```text
area_id existente
+
área pertenece a otra sede
→ valid_for_area = false
```

```text
configuración contradictoria
→ valid_for_area = false
→ structural_issue
```

---

#### 25. Rol territorialmente inválido

Cuando el rol existe y está activo, pero:

```text
valid_for_site = false
```

o:

```text
valid_for_area = false
```

el nodo podrá existir para representar la asignación observada, pero:

```text
lane_readiness.operational
→ no disponible
```

y ningún permiso operativo podrá autorizarse.

AUTH-CTX-015 definirá los códigos y severidades.

AUTH-CTX-020 consumirá los flags dentro del carril operativo.

---

#### 26. Relación con `active_shift`

El turno aporta:

- `shift_id`;
- `role_code`;
- `site_id`;
- `area_id`.

AUTH-CTX-012 aporta:

- validación canónica del rol;
- validación de sede;
- validación de área.

El nodo no podrá existir sin `active_shift`.

Regla:

```text
active_shift = null
→ operational_role = null
```

---

#### 27. Relación con `active_checkin_session`

El check-in no crea ni selecciona el rol.

Por tanto:

```text
active_shift válido
+
rol territorialmente válido
+
sin check-in
→ operational_role puede existir
```

La ausencia de check-in afecta únicamente permisos cuyo prerrequisito sea
`T+C`.

Un check-in incompatible tampoco cambiará el código del rol.

La incompatibilidad se registrará y afectará `lane_readiness` según
AUTH-CTX-015.

---

#### 28. Rol válido sin permisos asignados

Un rol operativo puede ser canónico, activo y territorialmente válido aunque
no tenga grants en la matriz operativa.

En ese caso:

```text
operational_role válido
+
0 grants coincidentes
→ ninguna acción autorizada por carril operativo
```

No se tratará como error del contexto.

La ausencia de permisos es una condición de matriz y se evaluará en
AUTH-CTX-020.

No se utilizarán permisos del rol base como compensación.

---

#### 29. Matriz operativa

`operational_role` no incorpora las filas de
`operational_role_permissions`.

La matriz se consultará posteriormente contra:

- permiso solicitado;
- rol operativo;
- sede;
- área;
- tipo de área;
- recurso;
- denegaciones.

AUTH-CTX-020 definirá la decisión del carril operativo.

AUTH-CTX-026 diseñará el evaluador unificado.

---

#### 30. Independencia de la aplicación

El rol operativo no cambia según la aplicación solicitada.

Ejemplo:

```text
role_code = cajero_satelite
```

permanece igual en:

- PULSO;
- NEXO;
- SHELL;
- cualquier aplicación autorizada.

Cada aplicación y cada acción requieren permisos canónicos distintos.

No existirán roles como:

- `cajero_pulso`;
- `cajero_nexo`;
- `bodeguero_app`;
- `gerente_operativo_fogo`.

---

#### 31. Casos híbridos

Un empleado puede tener simultáneamente:

```text
base_role = supervisor
operational_role = cajero_satelite
```

Los contextos permanecen separados.

El rol operativo:

- no reemplaza el rol base;
- no reduce cobertura administrativa;
- no amplía cobertura administrativa;
- no hereda permisos base;
- no convierte el caso en un nuevo rol combinado.

La modalidad del permiso determina qué carril o carriles participan.

---

#### 32. Propietario y gerente general

`propietario` y `gerente_general` no reciben rol operativo por jerarquía.

Para operar mediante el carril operativo requieren:

- `active_shift`;
- código operativo canónico;
- rol activo;
- habilitación de sede;
- compatibilidad de área;
- check-in cuando el permiso lo exija;
- grant operativo aplicable.

Sus permisos base podrán autorizar por el carril base únicamente cuando la
modalidad y el alcance del permiso lo permitan.

---

#### 33. `gerencia_operativa`

`gerencia_operativa` es un rol operativo ordinario de coordinación.

No es:

- gerente general;
- propietario;
- bypass;
- acceso total;
- permiso de todas las sedes;
- autorización administrativa;
- sustituto de un rol base.

Requiere:

- turno;
- sede;
- área cuando la configuración lo exija;
- grants exactos;
- contexto válido.

---

#### 34. `operador_integral_satelite`

`operador_integral_satelite` no es superusuario.

Su carácter integrado significa que puede recibir un conjunto operativo más
amplio de capacidades en formatos pequeños, pero cada permiso deberá estar
asignado explícitamente.

No podrá:

- heredar todos los permisos satélite;
- operar en cualquier sede;
- ignorar el área;
- sustituir roles de producción;
- actuar sin turno.

---

#### 35. Perfil operativo predeterminado

El perfil predeterminado puede apoyar:

- creación de turnos;
- sugerencias administrativas;
- UX de planificación;
- defaults controlados.

No participa en autorización.

Regla:

```text
turno sin role_code
+
perfil con default_operational_role
→ operational_role = null
```

La corrección deberá realizarse en la fuente del turno.

---

#### 36. Rol de navegación

`navigation_role` podrá servir para:

- presentación inicial;
- menú sugerido;
- plantilla de dispositivo;
- experiencia controlada.

No podrá:

- crear rol operativo;
- sustituir el turno;
- cambiar permisos;
- resolver sede;
- resolver área;
- corregir un código inválido.

Una discrepancia entre navegación y contexto no se resolverá ampliando
autoridad.

AUTH-CTX-014 definirá la relación con dispositivos.

---

#### 37. Dispositivo compartido

La plantilla o instancia del dispositivo puede declarar una expectativa de
rol, pero el rol efectivo continúa procediendo del turno del empleado actor.

El dispositivo:

- no asigna rol;
- no conserva el rol del actor anterior;
- no presta su rol de navegación;
- no convierte al usuario técnico en trabajador;
- no amplía la sede;
- no amplía el área;
- no amplía permisos.

Una incompatibilidad deberá bloquear la sesión o la acción según
AUTH-CTX-014 y AUTH-CTX-015.

---

#### 38. Simulación

La simulación puede evaluar hipotéticamente otro rol operativo dentro de un
contrato separado.

No podrá:

- modificar `operational_role` real;
- crear turno;
- crear check-in;
- persistir asignación;
- habilitar mutaciones;
- reutilizar `WOULD_ALLOW` como autoridad.

El contexto real continúa resolviendo el código del turno real.

---

#### 39. Procesos de sistema

Un actor `SYSTEM` autónomo no recibe rol operativo laboral.

Resultado:

```text
operational_role = null
```

Cuando una automatización actúe delegadamente en nombre de un empleado, el
contrato de delegación deberá conservar al empleado como actor efectivo y
resolver el mismo contexto canónico.

Un proceso técnico autorizado utilizará permisos de sistema explícitos, no un
rol operativo ficticio.

---

#### 40. Relación con sede y área asignadas al empleado

La habilitación del rol en sede y área no reemplaza la validación de que el
empleado puede trabajar en dicho territorio.

AUTH-CTX-013 deberá combinar:

- sede del turno;
- área del turno;
- asignaciones laborales;
- habilitación del rol;
- estado territorial.

Por tanto:

```text
valid_for_site = true
```

no significa por sí solo que la asignación laboral del empleado sea válida.

La validación territorial completa corresponde a AUTH-CTX-013.

---

#### 41. Relación con permisos `N`, `T` y `T+C`

##### Permiso `N`

No requiere turno ni rol operativo.

La ausencia de `operational_role` no bloquea el carril base.

##### Permiso `T`

Requiere:

- `active_shift`;
- `operational_role`;
- `valid_for_site = true`;
- `valid_for_area = true` cuando aplique.

No requiere check-in.

##### Permiso `T+C`

Requiere además:

- `active_checkin_session`.

El check-in no modifica el rol.

---

#### 42. Relación con modalidades de autorización

##### `BASE_ONLY`

No consume `operational_role`.

##### `OPERATIONAL_ONLY`

Solo podrá autorizar cuando el carril operativo esté completo.

##### `BASE_OR_OPERATIONAL`

Cada carril se evalúa de manera independiente.

Un rol operativo inválido no bloquea automáticamente un carril base válido.

##### `BASE_AND_OPERATIONAL`

Exige simultáneamente:

- carril base válido;
- carril operativo válido;
- rol operativo territorialmente válido;
- demás prerrequisitos del permiso.

---

#### 43. Relación con `lane_readiness`

Reglas conceptuales:

```text
active_shift = null
→ operational_role = null
→ carril operativo no disponible
```

```text
rol inexistente o inactivo
→ operational_role = null
→ problema estructural
```

```text
rol activo
+
valid_for_site = false
→ carril operativo no disponible
```

```text
rol activo
+
valid_for_site = true
+
valid_for_area = false
→ carril operativo no disponible cuando el territorio exige área
```

```text
rol válido territorialmente
+
check-in ausente
→ puede estar listo para permisos T
→ no está listo para permisos T+C
```

AUTH-CTX-015 congelará los estados y razones exactas.

---

#### 44. Snapshot y obsolescencia

`operational_role` forma parte del snapshot inmutable.

El contexto queda potencialmente obsoleto cuando ocurre:

- cambio de rol en el turno;
- publicación de nueva revisión;
- cancelación del turno;
- desactivación del rol;
- deprecación del rol;
- cambio de sede;
- cambio de área;
- activación o desactivación de una habilitación territorial;
- cambio de `requires_area`;
- corrección de configuración contradictoria;
- cambio del actor efectivo;
- fin del turno.

AUTH-CTX-029 definirá invalidación, caché y fingerprint.

---

#### 45. Determinismo

Para el mismo:

- actor efectivo;
- `active_shift`;
- catálogo operativo;
- habilitaciones territoriales;
- catálogos de sede y área;
- `resolved_at`;

la resolución deberá producir exactamente el mismo resultado.

No dependerá de:

- orden físico de filas;
- último rol usado;
- aplicación abierta;
- selector visual;
- dispositivo;
- perfil;
- heurística;
- primera coincidencia SQL;
- caché obsoleta.

---

#### 46. Casos de ejemplo

##### Caso A — Cajero válido en Vento Café

```text
active_shift.role_code = cajero_satelite
site_id = VENTO_CAFE
area_id = CAJA_VENTO_CAFE
rol activo
habilitación exacta vigente
```

Resultado:

```text
operational_role = {
  role_code: "cajero_satelite",
  shift_id: "...",
  site_id: "VENTO_CAFE",
  area_id: "CAJA_VENTO_CAFE",
  valid_for_site: true,
  valid_for_area: true
}
```

##### Caso B — Cajero sin área

```text
role_code = cajero_satelite
area_id = null
requires_area = true
```

Resultado:

```text
operational_role != null
valid_for_site = true
valid_for_area = false
```

El carril operativo no queda disponible.

##### Caso C — Rol inexistente

```text
role_code = cajero_principal
```

Resultado:

```text
operational_role = null
structural_issue = rol operativo desconocido
```

##### Caso D — Rol inactivo

```text
role_code canónico
is_active = false
```

Resultado:

```text
operational_role = null
```

##### Caso E — Rol no habilitado en sede

```text
role_code = produccion_reposteria
site_id = SAUDO
sin habilitación vigente
```

Resultado:

```text
operational_role != null
valid_for_site = false
valid_for_area = false
```

##### Caso F — Área de otra sede

```text
site_id = SAUDO
area_id = CAJA_VENTO_CAFE
```

Resultado:

```text
operational_role != null
valid_for_site según configuración
valid_for_area = false
structural_issue = área incompatible
```

##### Caso G — Conductor site-wide

```text
role_code = conductor_logistica
site_id = CENTRO_PRODUCCION
area_id = null
habilitación site-wide explícita
área opcional aprobada
```

Resultado:

```text
valid_for_site = true
valid_for_area = true
```

##### Caso H — Gerente general sin turno

```text
base_role = gerente_general
active_shift = null
```

Resultado:

```text
operational_role = null
```

El carril base permanece independiente.

##### Caso I — Perfil con rol, turno sin rol

```text
default_operational_role = bodeguero
active_shift.operational_role_code = null
```

Resultado:

```text
operational_role = null
```

##### Caso J — `bodeguero` en ambos catálogos

```text
active_shift.operational_role_code = bodeguero
```

Resultado:

```text
resolver exclusivamente en operational_roles
```

La duplicidad base se trata como legado, no como fallback.

##### Caso K — Rol válido sin grants

```text
role_code válido
territorio válido
operational_role_permissions = []
```

Resultado:

```text
operational_role válido
ningún permiso operativo autorizado
```

##### Caso L — Sin check-in para permiso `T`

```text
operational_role válido
active_checkin_session = null
permiso requiere T
```

Resultado:

```text
el rol continúa efectivo
el carril puede continuar
```

##### Caso M — Sin check-in para permiso `T+C`

```text
operational_role válido
active_checkin_session = null
```

Resultado:

```text
rol efectivo conservado
carril operativo no disponible para ese permiso
```

##### Caso N — `propietario_admin`

```text
active_shift.operational_role_code = propietario_admin
```

Resultado:

```text
operational_role = null
structural_issue = rol operativo deprecado
```

---

#### 47. Inconsistencias estructurales detectables

AUTH-CTX-012 identifica las siguientes clases:

1. turno vigente sin código operativo;
2. código vacío;
3. código desconocido;
4. código inactivo;
5. código deprecado;
6. `propietario_admin` utilizado;
7. rol base utilizado como rol operativo;
8. alias no canónico;
9. conversión aproximada por nombre;
10. perfil usado como fallback;
11. dispositivo usado como fuente;
12. navegación usada como fuente;
13. código del nodo distinto al turno;
14. `shift_id` distinto al turno;
15. `site_id` distinto al turno;
16. `area_id` distinto al turno;
17. rol no habilitado en sede;
18. sede inactiva;
19. habilitación de sede inactiva;
20. área inexistente;
21. área inactiva;
22. área perteneciente a otra sede;
23. área obligatoria ausente;
24. área específica sin habilitación;
25. configuración site-wide incompatible con `requires_area`;
26. configuraciones territoriales contradictorias;
27. primera fila usada como decisión;
28. rol operativo fusionado con rol base;
29. rol válido tratado como permiso;
30. ausencia de grants compensada con rol base;
31. rol modificado según aplicación;
32. contexto reutilizado después de cambio o desactivación.

AUTH-CTX-015 deberá asignar:

- código definitivo;
- severidad;
- carril afectado;
- exposición;
- mensaje seguro;
- efecto sobre `lane_readiness`.

---

#### 48. Fail closed

Ante ausencia, contradicción o ambigüedad:

```text
operational_role = null
```

cuando el rol no sea canónico y activo.

Cuando el rol sea canónico y activo, pero la incompatibilidad sea
territorial:

```text
operational_role puede existir
valid_for_site = false
o
valid_for_area = false
```

En ambos casos queda prohibido autorizar por el carril operativo.

No se permite:

- elegir un rol por nombre parecido;
- usar el rol base;
- usar el perfil;
- usar la navegación;
- usar el dispositivo;
- completar el área;
- completar la sede;
- elegir la configuración más permisiva;
- ignorar deprecación;
- asumir grants;
- tratar jerarquía administrativa como rol operativo.

---

#### 49. Minimización de datos

`operational_role` no deberá incluir:

- nombre humano;
- descripción;
- familia;
- permisos;
- grants;
- denegaciones;
- lista de aplicaciones;
- datos del asignador;
- notas del turno;
- perfil predeterminado;
- dispositivo;
- cargo contractual;
- historial del rol;
- motivos internos de configuración.

El contrato conserva únicamente los campos publicados.

---

#### 50. Relación con tareas posteriores

##### AUTH-CTX-013

Definirá:

- `operational_site`;
- `operational_area`;
- validez de asignación laboral;
- estado de sede y área;
- compatibilidad territorial completa.

##### AUTH-CTX-014

Definirá la coherencia entre:

- dispositivo;
- sesión de actor;
- turno;
- rol operativo;
- sede;
- área.

##### AUTH-CTX-015

Congelará códigos, severidades y `lane_readiness`.

##### AUTH-CTX-017

Aportará el requisito de turno, check-in y área del permiso solicitado.

##### AUTH-CTX-020

Evaluará el carril operativo combinando:

- turno;
- check-in;
- rol;
- territorio;
- grants;
- denegaciones.

##### AUTH-CTX-023

Incluirá en la decisión final las razones de rol o territorio inválidos.

##### AUTH-CTX-024

Definirá la evidencia auditable del rol y habilitación utilizados.

##### AUTH-CTX-025

Diseñará el productor SQL de `operational_role`, incluyendo:

- catálogo correcto;
- actividad;
- habilitación por sede;
- habilitación por área;
- resolución determinista;
- fail closed.

##### AUTH-CTX-026

Diseñará el evaluador que consume el rol sin convertirlo en permiso.

##### AUTH-CTX-027

Obligará a las aplicaciones a consumir el rol centralizado y eliminar
fallbacks locales.

##### AUTH-CTX-028

Diseñará compatibilidad con:

- `employee_shifts.operational_role`;
- `site_operational_roles`;
- `operational_roles`;
- perfiles predeterminados;
- `navigation_role`;
- rol `bodeguero` duplicado;
- `propietario_admin`;
- consumidores de `get_operational_context`;
- lógica legacy de `has_operational_permission`.

##### AUTH-CTX-029

Definirá invalidación por cambios de rol o habilitación territorial.

##### AUTH-CTX-030

Definirá pruebas contractuales de:

- rol válido;
- rol ausente;
- rol inactivo;
- rol deprecado;
- sede incompatible;
- área incompatible;
- área obligatoria ausente;
- habilitación site-wide;
- casos híbridos;
- roles sin grants;
- dispositivo;
- simulación.

##### AUTH-DB-006

Incorporará el contexto canónico en RPC sensibles durante implementación.

##### AUTH-DB-007

Implementará validación canónica de sede en RPC sensibles.

##### AUTH-DB-008

Implementará validación canónica de área en RPC sensibles.

##### AUTH-DB-009

Implementará validación del permiso exacto, evitando que el rol actúe como
permiso.

##### AUTH-DB-010

Implementará validación de principal y actor efectivo.

##### AUTH-DB-011

Aplicará constraints únicamente después de backfills y reconciliación.

##### AUTH-DB-020

Migrará objetos y relaciones legacy con compatibilidad temporal.

##### AUTH-DB-027

Creará el harness de pruebas de esquema, integridad, RLS, RPC y migraciones.

##### AUTH-DB-030

Retirará objetos y rutas legacy solo después de adopción comprobada.

##### AUTH-DB-031

Certificará paridad documental, técnica y operativa.

---

#### 51. Fuera del alcance

AUTH-CTX-012 no:

- crea roles;
- renombra roles;
- elimina roles;
- activa roles;
- desactiva roles;
- asigna roles a turnos;
- asigna roles a sedes;
- asigna roles a áreas;
- modifica perfiles;
- modifica dispositivos;
- corrige turnos;
- completa áreas faltantes;
- crea grants;
- crea denegaciones;
- define permisos;
- decide el carril operativo;
- resuelve recursos;
- decide autorización final;
- crea tablas;
- crea funciones SQL;
- crea RPC;
- crea RLS;
- crea migraciones;
- ejecuta backfills;
- retira `bodeguero` del catálogo base;
- retira `propietario_admin`;
- modifica Supabase;
- modifica aplicaciones.

Cada responsabilidad posterior tiene un destino explícito en la sección 50.

---

#### 52. Riesgos controlados

##### Riesgo 1 — Rol base utilizado como operación

Control:

```text
namespace operativo explícito
```

##### Riesgo 2 — Perfil predeterminado autoriza

Control:

```text
solo active_shift.operational_role_code
```

##### Riesgo 3 — Rol habilitado en una sede se usa en otra

Control:

```text
valid_for_site exacto
```

##### Riesgo 4 — Área ausente se completa silenciosamente

Control:

```text
requires_area + area_id exacto
```

##### Riesgo 5 — Rol sin permisos obtiene acceso

Control:

```text
rol válido
≠
grant
```

##### Riesgo 6 — Jerarquía administrativa funciona como bypass

Control:

```text
rol base y rol operativo en carriles separados
```

##### Riesgo 7 — Dispositivo presta rol

Control:

```text
dispositivo no es fuente laboral
```

##### Riesgo 8 — Configuración contradictoria elige la opción permisiva

Control:

```text
contradicción
→ validación territorial falsa
→ fail closed
```

---

#### 53. Criterios de aprobación

AUTH-CTX-012 podrá aprobarse cuando se acepte que:

1. `operational_role` conserva la forma de `AccessContext@1.0.0`;
2. la tarea es una aclaración normativa compatible;
3. existen doce roles operativos canónicos;
4. `propietario_admin` no es canónico;
5. el rol procede exclusivamente del turno vigente;
6. sin `active_shift` no existe rol operativo;
7. el rol base no es fallback;
8. el perfil predeterminado no es fallback;
9. `navigation_role` no es fuente;
10. el dispositivo no es fuente;
11. la aplicación no cambia el rol;
12. el permiso solicitado no cambia el rol;
13. `role_code` debe ser canónico;
14. no se usan coincidencias aproximadas;
15. el namespace operativo es explícito;
16. `bodeguero` se resuelve contra el catálogo operativo;
17. la duplicidad base permanece como legado a retirar;
18. el rol debe estar activo;
19. un rol inactivo produce `null`;
20. un rol deprecado produce `null`;
21. el nodo conserva el `shift_id` exacto;
22. el nodo conserva el `site_id` exacto;
23. el nodo conserva el `area_id` exacto;
24. `valid_for_site` depende de habilitación vigente;
25. la sede debe existir y estar activa;
26. `valid_for_area` depende de política y configuración;
27. un rol con área obligatoria requiere `area_id`;
28. el área debe pertenecer a la sede;
29. no se completa área mediante fallback;
30. una habilitación site-wide solo aplica a la sede exacta;
31. site-wide no significa todas las áreas sin validación;
32. una habilitación por área exige coincidencia exacta;
33. configuraciones contradictorias fallan cerrado;
34. el nodo puede existir con flags territoriales falsos;
35. flags falsos impiden autorización operativa;
36. el check-in no crea el rol;
37. el rol puede existir sin check-in;
38. permisos `T` pueden continuar sin check-in;
39. permisos `T+C` exigen además sesión activa;
40. un rol válido sin grants no autoriza acciones;
41. permisos base no compensan matrices operativas vacías;
42. el rol no contiene grants;
43. el rol no contiene denegaciones;
44. `gerencia_operativa` no es bypass;
45. `operador_integral_satelite` no es superusuario;
46. propietario y gerente general requieren rol operativo real para el carril
    operativo;
47. los casos híbridos no fusionan roles;
48. actores `SYSTEM` autónomos no reciben rol laboral;
49. la simulación no modifica el contexto real;
50. AUTH-CTX-013 cerrará territorio operativo;
51. AUTH-CTX-015 congelará problemas y readiness;
52. AUTH-CTX-020 resolverá el carril operativo;
53. AUTH-CTX-025 diseñará el productor SQL;
54. AUTH-CTX-026 diseñará el evaluador;
55. AUTH-CTX-027 eliminará fallbacks locales;
56. AUTH-CTX-028 diseñará compatibilidad legacy;
57. AUTH-CTX-029 definirá invalidación;
58. AUTH-CTX-030 definirá pruebas contractuales;
59. AUTH-DB-006 a AUTH-DB-011 implementarán validaciones y constraints;
60. AUTH-DB-020, AUTH-DB-027, AUTH-DB-030 y AUTH-DB-031 controlarán
    migración, pruebas, retiro y certificación;
61. no se implementa código, migraciones ni cambios en Supabase.

---

#### 54. Estado final de la propuesta

| Tarea        | Estado      | Relación                  |
| ------------ | ----------- | ------------------------- |
| AUTH-CTX-011 | APROBADA    | Tarea anterior            |
| AUTH-CTX-012 | APROBADA    | Tarea actual              |
| AUTH-CTX-013 | NO INICIADA | Tarea siguiente reservada |

La continuidad propuesta queda:

```text
AUTH-CTX-011 — APROBADA
        ↓
AUTH-CTX-012 — APROBADA
        ↓
AUTH-CTX-013 — NO INICIADA
```

No se avanza a AUTH-CTX-013 hasta recibir aprobación explícita de
AUTH-CTX-012.


### ✅ AUTH-CTX-013 — Incluir sede y área operativas

**Estado:** APROBADA  
**Bloque:** BLOQUE E — Contexto y decisión de autorización unificados  
**Naturaleza:** Refinamiento documental de los nodos `operational_site` y `operational_area` dentro de `AccessContext`  
**Implementación física:** No incluida  
**Tarea anterior vigente:** AUTH-CTX-012 — APROBADA  
**Tarea posterior reservada:** AUTH-CTX-014 — Incluir contexto de dispositivo compartido  
**Contrato afectado:** `AccessContext@1.0.0`  
**Nodos afectados:** `operational_site`, `operational_area`  
**Cambio contractual:** Aclaración normativa compatible; no cambia la forma publicada  
**Cambios físicos permitidos:** No

Esta tarea define cómo `AccessContext` resuelve la sede y el área operativas
del actor laboral a partir del turno publicado y vigente, conservando la
separación entre:

- sede laboral asignada;
- sede administrativa;
- sede primaria;
- sede seleccionada;
- sede del turno;
- sede del check-in;
- punto físico de marcación;
- sede del dispositivo;
- sede del recurso;
- área asignada;
- área administrativa;
- área del turno;
- área del check-in;
- área del dispositivo;
- área del recurso;
- rol operativo;
- permiso;
- autorización final.

No modifica la estructura raíz de `AccessContext`, no agrega campos, no cambia
`contract_version`, no cambia `schema_version`, no implementa SQL, RPC, RLS,
migraciones, constraints, backfills, aplicaciones ni cambios físicos en
Supabase.

---

#### 1. Objetivo

Definir los nodos `operational_site` y `operational_area` de manera que Vento
OS pueda responder inequívocamente:

1. cuál es la sede operativa exacta del turno vigente;
2. si esa sede existe y está activa;
3. si el empleado posee una asignación laboral válida para esa sede;
4. cuál es el área operativa exacta cuando el turno la declara;
5. si el área pertenece a la sede operativa;
6. si el área está activa;
7. cuál es su `area_kind` canónico;
8. si el área es compatible con el rol operativo;
9. cuándo el área puede ser `null`;
10. cuándo la ausencia de área es normal;
11. cuándo la ausencia de área impide el carril operativo;
12. qué función cumple el check-in;
13. qué función cumple un punto externo de marcación;
14. qué función cumple el dispositivo compartido;
15. qué relación existe con `assigned_sites` y `assigned_areas`;
16. qué relación existe con `operational_role`;
17. qué relación existe con el territorio del recurso;
18. cómo se tratan operaciones entre sedes o áreas;
19. cuándo los nodos deben ser `null`;
20. cuándo pueden conservarse con flags negativos;
21. cómo impedir fallbacks permisivos;
22. cómo preservar determinismo, trazabilidad y fail closed.

---

#### 2. Base normativa

AUTH-CTX-013 conserva sin cambios las decisiones aprobadas en:

- ADR-AUTH-001;
- AUTH-MOD-001 — Identidad laboral y actor efectivo;
- AUTH-MOD-002 — Separar rol base de rol operativo;
- AUTH-MOD-005 — Definir roles operativos;
- AUTH-MOD-006 — Definir casos híbridos;
- AUTH-MOD-007 — Definir sede asignada y sede activa;
- AUTH-MOD-008 — Definir área asignada y área activa;
- AUTH-MOD-009 — Definir turno publicado;
- AUTH-MOD-010 — Definir check-in activo;
- AUTH-MOD-011 — Definir sesión en dispositivo compartido;
- AUTH-MOD-014 — Definir permisos por sede;
- AUTH-MOD-015 — Definir permisos por tipo de sede;
- AUTH-MOD-016 — Definir permisos por área;
- AUTH-MOD-017 — Definir permisos por tipo de área;
- AUTH-MOD-018 — Definir precedencia entre carriles;
- AUTH-MOD-019 — Definir denegaciones explícitas;
- AUTH-CAT-011 — Definir alcance permitido de cada permiso;
- AUTH-CAT-012 — Definir prerrequisitos de turno y check-in;
- AUTH-CAT-013 — Definir permisos que exigen área activa;
- AUTH-CAT-014 — Definir compatibilidad con dispositivo compartido;
- AUTH-CTX-001 — Diseñar `AccessContext`;
- AUTH-CTX-004 — Versionar contratos;
- AUTH-CTX-009 — Incluir cobertura administrativa por sede y área;
- AUTH-CTX-010 — Incluir turno publicado y vigente;
- AUTH-CTX-011 — Incluir sesión de check-in activa;
- AUTH-CTX-012 — Incluir rol operativo efectivo.

Principios heredados obligatorios:

```text
SEDE OPERATIVA
=
SEDE DEL TURNO PUBLICADO Y VIGENTE
```

```text
ÁREA OPERATIVA
=
ÁREA DEL TURNO PUBLICADO Y VIGENTE
```

```text
CHECK-IN
→ CONFIRMA COHERENCIA
→ NO REEMPLAZA TURNO
```

```text
SEDE OPERATIVA
≠
COBERTURA ADMINISTRATIVA
```

```text
ÁREA OPERATIVA
≠
ÁREA ASIGNADA ADMINISTRATIVA
```

```text
PUNTO DE MARCACIÓN
≠
SEDE OPERATIVA
```

```text
DISPOSITIVO
≠
TERRITORIO LABORAL
```

```text
TERRITORIO OPERATIVO
≠
TERRITORIO DEL RECURSO
```

---

#### 3. Separación conceptual obligatoria

| Concepto                 | Fuente                          | Función                         |            Concede permisos |
| ------------------------ | ------------------------------- | ------------------------------- | --------------------------: |
| Sede asignada            | Relación laboral                | Afiliación del empleado         |                          No |
| Sede primaria            | Relación laboral                | Referencia principal            |                          No |
| Sede seleccionada        | Cliente validado                | Navegación o filtro             |                          No |
| Cobertura administrativa | Rol base y asignaciones         | Insumo del carril base          |                          No |
| Sede operativa           | Turno vigente                   | Territorio del carril operativo |                          No |
| Punto de marcación       | Política de asistencia          | Evidencia física                |                          No |
| Sede del dispositivo     | Configuración técnica           | Restricción adicional           |                          No |
| Sede del recurso         | Recurso solicitado              | Territorio real de la acción    |                          No |
| Área asignada            | Relación laboral administrativa | Afiliación                      |                          No |
| Área operativa           | Turno vigente                   | Contexto funcional temporal     |                          No |
| Área del recurso         | Recurso solicitado              | Alcance real de la acción       |                          No |
| Permiso                  | Catálogo y matrices             | Capacidad empresarial           | Puede participar en `ALLOW` |
| Decisión                 | Evaluador unificado             | Resultado final                 |       Sí, cuando es `ALLOW` |

---

#### 4. Formas contractuales conservadas

AUTH-CTX-013 conserva exactamente las formas conceptuales publicadas:

```ts
type OperationalSiteContext = {
  site_id: string;
  source_shift_id: string;
  site_active: boolean;
  assignment_valid: boolean;
};
```

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

No se agregan propiedades.

La publicación permanece:

```text
AccessContext
contract_version = 1.0.0
schema_version   = 1.0.0
```

---

#### 5. Fuente única del territorio operativo

La fuente autoritativa es:

```text
active_shift
```

Resolución:

```text
active_shift.site_id
→ operational_site
```

```text
active_shift.area_id
→ operational_area, cuando exista
```

No se utilizará como fuente:

- sede primaria;
- sede seleccionada;
- área seleccionada;
- última sede utilizada;
- último turno;
- `employees.site_id`;
- `employees.area_id`;
- perfil operativo predeterminado;
- check-in aislado;
- punto de marcación;
- dispositivo;
- `navigation_role`;
- recurso consultado;
- ruta abierta;
- aplicación;
- nombre del rol;
- nombre humano del área;
- valor enviado por frontend.

---

#### 6. Dependencia del turno

Regla:

```text
active_shift = null
→ operational_site = null
→ operational_area = null
```

No existirá sede o área operativa real sin un turno publicado y vigente.

Un check-in residual, una sede asignada, un dispositivo activo o un rol
operativo histórico no crean territorio operativo.

---

#### 7. Dependencia del actor efectivo

Los nodos solo podrán existir cuando:

1. el actor efectivo sea empleado;
2. el empleado esté activo;
3. `active_shift.employee_id` coincida con el actor;
4. el turno sea válido;
5. no exista ambigüedad de identidad.

Para actores:

- `CUSTOMER`;
- `SYSTEM` autónomo;
- `DEVICE` sin actor humano;
- `UNRESOLVED`;

el resultado será:

```text
operational_site = null
operational_area = null
```

---

#### 8. Resolución exclusiva en servidor

Los nodos deberán resolverse en servidor.

No se aceptará como autoridad:

- parámetro de ruta;
- query string;
- body de la mutación;
- estado local;
- local storage;
- cookie no firmada;
- selector de sede;
- selector de área;
- cabecera personalizada;
- código del dispositivo;
- geocerca enviada por el cliente;
- GPS sin validación;
- sede o área simulada;
- última opción de interfaz.

El cliente podrá solicitar operar sobre un recurso, pero no podrá declarar el
territorio laboral efectivo.

---

#### 9. Semántica de `operational_site`

`operational_site` representa la sede exacta en la que el turno intenta
activar el carril operativo del empleado.

No representa:

- todas las sedes asignadas;
- una sede administrativa;
- cobertura multisede;
- organización completa;
- sede del recurso;
- punto de marcación;
- ubicación física instantánea;
- sede del dispositivo;
- permiso transversal;
- bypass.

---

#### 10. Condición mínima de existencia de `operational_site`

El nodo podrá producirse cuando:

1. existe `active_shift`;
2. `active_shift.site_id` está presente;
3. el identificador es resoluble en el catálogo canónico de sedes;
4. existe una única sede correspondiente;
5. `source_shift_id` puede vincularse al turno;
6. la sede observada no es ambigua.

Si `site_id` es:

- nulo;
- vacío;
- inexistente;
- ambiguo;
- no resoluble;

el resultado será:

```text
operational_site = null
```

y deberá registrarse el problema estructural aplicable.

---

#### 11. `site_id`

Regla exacta:

```text
operational_site.site_id
=
active_shift.site_id
```

No podrá corregirse mediante:

- `assigned_sites`;
- sede primaria;
- check-in;
- dispositivo;
- recurso;
- sede seleccionada;
- perfil;
- heurística;
- nombre humano.

Si la sede del turno es incorrecta, deberá corregirse el turno.

---

#### 12. `source_shift_id`

Regla exacta:

```text
operational_site.source_shift_id
=
active_shift.shift_id
```

El campo prueba que el territorio operativo procede de una ocurrencia
concreta de turno.

No podrá referir:

- turno anterior;
- turno futuro;
- turno borrador;
- plantilla;
- perfil;
- evento de asistencia;
- sesión de dispositivo;
- simulación presentada como real.

---

#### 13. `site_active`

`site_active` indica si la sede observada está activa y disponible para la
operación ordinaria en `resolved_at`.

Casos:

```text
sede existe y está activa
→ site_active = true
```

```text
sede existe pero está inactiva
→ site_active = false
```

Una sede inactiva no podrá habilitar el carril operativo aunque el turno siga
vigente.

La desactivación deberá invalidar el snapshot mediante AUTH-CTX-029.

---

#### 14. Sedes no laborales y puntos técnicos

El catálogo puede contener entidades físicas o técnicas que no representan
una sede laboral ordinaria, por ejemplo:

- puntos de check-in;
- patios;
- geocercas;
- ubicaciones ocultas;
- vehículos;
- sedes demo;
- APP-REVIEW;
- entornos de pruebas.

Estas entidades no podrán convertirse en `operational_site` salvo que su
clasificación canónica las defina expresamente como territorio laboral
operativo.

Un punto físico usado para marcar no sustituye la sede del turno.

---

#### 15. `assignment_valid`

`assignment_valid` indica si el empleado posee una asignación laboral vigente
y utilizable para la sede exacta del turno.

La validación deberá consumir:

```text
employee.employee_id
+
operational_site.site_id
+
assigned_sites
```

Regla conceptual:

```text
existe AssignedSiteContext coincidente
AND assignment_active = true
AND site_active = true
AND assignable = true
→ assignment_valid = true
```

En cualquier otro caso:

```text
assignment_valid = false
```

---

#### 16. Asignación laboral y turno

Un turno válido no crea por sí solo una asignación laboral permanente.

Por tanto:

```text
turno en sede no asignada
→ operational_site puede representar la sede observada
→ assignment_valid = false
→ carril operativo no disponible
```

El sistema no agregará automáticamente la sede a `assigned_sites`.

La corrección deberá ocurrir en la fuente laboral o en el turno, según el caso.

---

#### 17. Asignación multisede

Un empleado puede tener varias sedes asignadas.

El turno selecciona exactamente una como sede operativa.

Ejemplo:

```text
assigned_sites = [VENTO_CAFE, SAUDO]
active_shift.site_id = SAUDO
```

Resultado:

```text
operational_site.site_id = SAUDO
assignment_valid = true
```

La otra sede permanece como asignación laboral, no como territorio operativo
simultáneo.

---

#### 18. Sede primaria

La sede primaria:

- no reemplaza el turno;
- no limita una asignación multisede;
- no corrige una sede inválida;
- no sirve como fallback;
- no determina `operational_site`;
- no convierte `assignment_valid` en verdadero.

Regla:

```text
sede primaria
≠
sede operativa
```

---

#### 19. Compatibilidad legacy de sede

`employees.site_id` podrá existir como campo heredado.

No podrá producir directamente:

- `operational_site`;
- `assignment_valid`;
- cobertura operativa;
- acceso a un recurso.

AUTH-CTX-028 deberá diseñar el adaptador temporal.

AUTH-DB-020 deberá materializar la transición física cuando corresponda.

AUTH-DB-030 retirará el consumo legacy únicamente después de paridad
comprobada.

---

#### 20. Check-in y sede operativa

`active_checkin_session` solo confirma coherencia.

Cuando existe una sesión activa:

```text
active_checkin_session.site_id
=
operational_site.site_id
```

deberá cumplirse.

Si coincide:

- la sede continúa procediendo del turno;
- no se modifica `source_shift_id`;
- no se amplía la autoridad.

Si no coincide:

- el check-in no cambia la sede;
- se registra problema estructural;
- la sesión no podrá satisfacer prerrequisitos operativos;
- el efecto exacto sobre `lane_readiness` se cerrará en AUTH-CTX-015.

---

#### 21. Punto físico de marcación

Puede existir:

```text
operational_site = CENTRO_PRODUCCION
checkin_point = PICKUP_CAMIONETA
```

Esto es válido cuando la política de asistencia lo autoriza.

El punto físico:

- no aparece en `OperationalSiteContext`;
- no cambia `site_id`;
- no crea asignación;
- no crea permiso;
- no se compara como sede del recurso;
- se conserva como evidencia externa al contrato mínimo.

---

#### 22. Dispositivo y sede operativa

La sede configurada en un dispositivo compartido:

- puede restringir la sesión;
- puede exigir coincidencia;
- puede bloquear un actor incompatible;
- no reemplaza la sede del turno;
- no corrige un turno;
- no crea `assignment_valid`;
- no amplía territorio.

La intersección completa se definirá en AUTH-CTX-014.

Regla:

```text
actor + turno + dispositivo
→ intersección restrictiva
```

Nunca:

```text
actor + dispositivo
→ unión de territorios
```

---

#### 23. Semántica de `operational_area`

`operational_area` representa el área organizacional exacta declarada por el
turno vigente, cuando exista y sea resoluble.

No representa:

- todas las áreas de la sede;
- área primaria;
- área asignada administrativamente;
- área seleccionada;
- área del dispositivo;
- área del recurso;
- `area_kind` genérico;
- nombre del rol;
- primera área compatible;
- área inferida desde el check-in.

---

#### 24. Condición mínima de existencia de `operational_area`

Casos:

```text
active_shift = null
→ operational_area = null
```

```text
active_shift.area_id = null
→ operational_area = null
```

```text
area_id presente y resoluble
+
área pertenece a operational_site
→ puede producir operational_area
```

```text
area_id inexistente o ambiguo
→ operational_area = null
→ structural_issue
```

```text
área pertenece a otra sede
→ operational_area = null
→ structural_issue
```

La ausencia legítima de área no es igual a un área inválida.

---

#### 25. `area_id`

Regla exacta:

```text
operational_area.area_id
=
active_shift.area_id
```

No podrá completarse mediante:

- `assigned_areas`;
- área primaria;
- perfil;
- check-in;
- dispositivo;
- permiso;
- rol;
- tipo de área;
- recurso;
- selector visual.

Si falta un área obligatoria, el turno deberá corregirse.

---

#### 26. `site_id` del área

Regla exacta:

```text
operational_area.site_id
=
operational_site.site_id
```

y deberá coincidir con la sede propietaria real del área.

Un área de otra sede no podrá serializarse como contexto operativo válido.

Queda prohibido cambiar el `site_id` real del área para hacerlo coincidir con
el turno.

---

#### 27. `area_kind`

`area_kind` deberá proceder del catálogo canónico del área.

No procederá de:

- rol operativo;
- frontend;
- nombre humano;
- ruta;
- dispositivo;
- permiso;
- categoría aproximada;
- valor escrito manualmente en el turno cuando no esté respaldado por el
  catálogo.

Regla:

```text
area_id
→ área canónica
→ area_kind
```

`area_kind` no sustituye `area_id`.

---

#### 28. Estado del área

`area_active` indica si el área observada está activa en `resolved_at`.

Casos:

```text
área existe y está activa
→ area_active = true
```

```text
área existe pero está inactiva
→ area_active = false
```

Un área inactiva no podrá habilitar un permiso que exija área operativa.

La desactivación deberá invalidar el snapshot mediante AUTH-CTX-029.

---

#### 29. Fuente `SHIFT`

Se utilizará:

```text
source = SHIFT
```

cuando el área procede del turno y no existe una sesión de check-in activa que
confirme exactamente la misma área.

También se utilizará cuando:

- el permiso no exige check-in;
- no existe sesión activa;
- la sesión activa no aporta área;
- la sede coincide pero el check-in no declara área.

`SHIFT` no significa menor autoridad.

El área siempre procede del turno.

---

#### 30. Fuente `CHECKIN_CONFIRMED_SHIFT`

Se utilizará:

```text
source = CHECKIN_CONFIRMED_SHIFT
```

únicamente cuando:

1. existe `active_checkin_session`;
2. la sesión pertenece al mismo actor;
3. coincide con el mismo turno;
4. coincide con la misma sede;
5. declara exactamente la misma área;
6. no existe incompatibilidad estructural.

El significado es:

```text
área del turno
+
check-in confirma la misma área
```

No:

```text
check-in crea o reemplaza área
```

---

#### 31. Check-in sin área

Cuando:

```text
active_shift.area_id != null
active_checkin_session.area_id = null
```

el área continúa resolviéndose desde el turno:

```text
source = SHIFT
```

La ausencia de área en la sesión no elimina el área del turno.

La política de asistencia podrá exigir mayor evidencia en casos específicos,
pero esa regla no se inventará dentro de este nodo.

---

#### 32. Check-in con área incompatible

Cuando:

```text
active_checkin_session.area_id
!=
active_shift.area_id
```

el check-in no reemplaza el área.

El contexto podrá conservar el área válida del turno con:

```text
source = SHIFT
```

pero deberá registrar el problema estructural correspondiente.

La sesión incompatible no podrá satisfacer el prerrequisito de check-in.

AUTH-CTX-015 definirá si el problema bloquea:

- todo el carril operativo;
- únicamente permisos `T+C`;
- la sesión del dispositivo;
- una combinación específica.

Hasta esa clasificación no podrá utilizarse la incompatibilidad para
autorizar.

---

#### 33. Área asignada al empleado

`assigned_areas` representa afiliación administrativa o laboral.

No es requisito general para que exista `operational_area`.

Regla:

```text
área del turno
≠
obligación de existir en employee_areas
```

Esto es obligatorio porque la operación actual resuelve principalmente áreas
mediante turnos y habilitaciones de rol, mientras las asignaciones permanentes
de área no cubren todavía a toda la plantilla.

No se utilizará la falta de `assigned_areas` como negación automática del
territorio operativo.

---

#### 34. Compatibilidad con el rol

`compatible_with_role` indica si el área del turno es compatible con el rol
operativo efectivo y su habilitación territorial.

Regla conceptual:

```text
operational_role != null
AND operational_role.role_code canónico
AND operational_role.site_id = operational_site.site_id
AND operational_role.area_id = operational_area.area_id
AND operational_role.valid_for_site = true
AND operational_role.valid_for_area = true
→ compatible_with_role = true
```

En cualquier otro caso:

```text
compatible_with_role = false
```

---

#### 35. Área válida sin rol válido

Cuando el área existe, está activa y pertenece a la sede, pero el rol no es
compatible:

```text
operational_area puede existir
area_active = true
compatible_with_role = false
```

El nodo conserva el hecho territorial observado.

El carril operativo no queda disponible.

---

#### 36. Rol site-wide y área nula

Cuando el rol permite operación site-wide y el turno no declara área:

```text
operational_area = null
```

Esto puede ser un estado válido.

No deberá crearse un área sintética como:

- general;
- toda la sede;
- área administrativa;
- primera área;
- sede completa representada como área.

El requisito del permiso se evaluará posteriormente.

---

#### 37. Rol con área obligatoria y área nula

Cuando el rol exige área y:

```text
active_shift.area_id = null
```

el resultado será:

```text
operational_area = null
operational_role.valid_for_area = false
```

Se registrará el problema estructural aplicable.

No se completará el área desde ninguna otra fuente.

---

#### 38. Permiso que no exige área

Un permiso clasificado sin prerrequisito de área puede evaluarse con:

```text
operational_area = null
```

si:

- `active_shift` es válido;
- `operational_site` es válida;
- el rol permite contexto site-wide;
- las demás condiciones se cumplen.

La ausencia de área no significa wildcard.

Significa que la acción se evalúa a nivel de sede o sin dimensión de área,
según su contrato de recurso.

---

#### 39. Permiso que exige área

Para un permiso clasificado por AUTH-CAT-013 como dependiente de área:

```text
operational_area != null
AND area_active = true
AND compatible_with_role = true
```

serán condiciones necesarias del carril operativo.

El evaluador completo corresponde a AUTH-CTX-020.

---

#### 40. `null` no es wildcard

Las siguientes expresiones quedan prohibidas:

```text
operational_area = null
→ cualquier área
```

```text
resource_area = null
→ todas las áreas
```

```text
configured_area = null
→ permitir siempre
```

Cada `null` deberá interpretarse según el contrato específico:

- no aplicable;
- nivel sede;
- recurso no territorial;
- información ausente;
- dato inválido.

AUTH-CTX-017 y AUTH-CTX-018 deberán aportar la clasificación necesaria para
la decisión.

---

#### 41. Territorio del recurso

`operational_site` y `operational_area` no prueban que el recurso solicitado
pertenezca al mismo territorio.

AUTH-CTX-018 deberá resolver:

- `resource_site_id`;
- `resource_area_id`;
- origen;
- destino;
- territorios múltiples;
- recursos site-wide;
- recursos organizacionales;
- recursos no territoriales.

AUTH-CTX-020 deberá comparar el territorio operativo contra el recurso.

---

#### 42. Recursos site-wide

Un recurso puede pertenecer a una sede sin pertenecer a un área concreta.

En ese caso:

```text
resource_site_id = sitio exacto
resource_area_id = null
```

La autorización dependerá del contrato del permiso.

No se asumirá que un recurso sin área pertenece a todas las áreas.

---

#### 43. Operaciones multiterritoriales

Una acción puede involucrar varios territorios.

Ejemplo:

```text
remisión:
origen = CENTRO_PRODUCCION
destino = VENTO_CAFE
```

El turno solo aporta un territorio operativo principal.

No autoriza automáticamente ambos extremos.

La capacidad deberá declarar si requiere:

- territorio de origen;
- territorio de destino;
- ambos;
- capacidad transversal específica.

AUTH-CTX-018 resolverá los territorios.

AUTH-CTX-020 evaluará el carril operativo.

---

#### 44. Permisos operativos globales

Un permiso operativo con alcance global significa que puede utilizarse en
cualquier contexto operativo válido donde el rol esté habilitado.

No significa:

- operar sin turno;
- operar sin sede;
- operar sin rol;
- operar cualquier sede desde el turno actual;
- acceder a recursos de otras sedes;
- ignorar área;
- bypass organizacional.

Regla:

```text
global operativo
≠
cross-site operativo
```

---

#### 45. Cobertura administrativa

La sede y el área operativas no modifican:

- `assigned_sites`;
- `assigned_areas`;
- `administrative_coverage`;
- `base_role`;
- grants base;
- denegaciones base.

Ejemplo híbrido:

```text
administrative_coverage = ORGANIZATION
operational_site = VENTO_CAFE
operational_area = CAJA
```

La cobertura administrativa puede ser amplia mientras el carril operativo
continúa limitado al turno.

---

#### 46. Selector de sede o área

Una selección visual:

- no cambia `operational_site`;
- no cambia `operational_area`;
- no cambia el turno;
- no cambia el rol;
- no cambia el check-in;
- no cambia el recurso;
- no concede permisos.

La aplicación podrá cambiar filtros administrativos, pero el contexto
operativo solo cambia mediante una nueva resolución autoritativa.

---

#### 47. Dispositivo compartido

El dispositivo puede declarar:

- sede configurada;
- área configurada;
- tipo;
- plantilla;
- capacidades admitidas.

Esos datos actuarán únicamente como restricciones adicionales.

Ejemplo:

```text
turno = VENTO_CAFE / CAJA
dispositivo = VENTO_CAFE / CAJA
→ compatible
```

```text
turno = SAUDO / COCINA
dispositivo = VENTO_CAFE / CAJA
→ incompatible
```

La incompatibilidad no cambia el turno para hacerlo coincidir con el
dispositivo.

AUTH-CTX-014 cerrará esta intersección.

---

#### 48. Simulación

Una simulación podrá representar hipotéticamente otra sede o área.

No podrá:

- modificar el contexto real;
- crear turno;
- crear check-in;
- cambiar rol;
- cambiar asignaciones;
- habilitar mutaciones;
- reutilizar `WOULD_ALLOW` como autoridad.

La sede y área simuladas permanecerán dentro de `SimulationContext`.

---

#### 49. Procesos de sistema

Un actor `SYSTEM` autónomo no recibe sede o área operativa laboral.

Resultado:

```text
operational_site = null
operational_area = null
```

Los procesos de sistema utilizarán contratos, permisos y territorios
explícitos del recurso.

Una automatización delegada en nombre de un empleado deberá conservar el mismo
actor efectivo y resolver el contexto real sin suministrar manualmente la
sede o el área.

---

#### 50. Relación con modalidades de autorización

##### `BASE_ONLY`

No requiere `operational_site` ni `operational_area`.

##### `OPERATIONAL_ONLY`

Requiere territorio operativo suficiente para el permiso.

##### `BASE_OR_OPERATIONAL`

Los carriles se evalúan de manera independiente.

Un territorio operativo inválido no bloquea automáticamente un carril base
válido.

##### `BASE_AND_OPERATIONAL`

Exige simultáneamente:

- carril base válido;
- carril operativo válido;
- territorio operativo compatible;
- mismo actor;
- ausencia de denegaciones aplicables.

---

#### 51. Relación con prerrequisitos `N`, `T` y `T+C`

##### `N`

No requiere turno, check-in ni territorio operativo.

##### `T`

Requiere:

- `active_shift`;
- `operational_role`;
- `operational_site`;
- área cuando el permiso o rol la exija.

No requiere check-in.

##### `T+C`

Requiere además:

- `active_checkin_session`;
- coincidencia territorial con la sesión;
- demás condiciones del permiso.

---

#### 52. Relación con `lane_readiness`

Reglas conceptuales:

```text
active_shift = null
→ operational_site = null
→ operational_area = null
→ carril operativo no disponible
```

```text
operational_site.site_active = false
→ carril operativo no disponible
```

```text
operational_site.assignment_valid = false
→ carril operativo no disponible
```

```text
operational_area = null
+
área no requerida
→ el carril puede continuar
```

```text
operational_area = null
+
área requerida
→ carril operativo no disponible
```

```text
operational_area.area_active = false
→ carril operativo no disponible
```

```text
compatible_with_role = false
→ carril operativo no disponible
```

AUTH-CTX-015 congelará los estados y razones exactas.

---

#### 53. Snapshot y obsolescencia

Los nodos forman parte del snapshot inmutable.

El contexto queda potencialmente obsoleto cuando ocurre:

- publicación de nueva revisión del turno;
- cambio de sede del turno;
- cambio de área del turno;
- inicio o fin del turno;
- cancelación;
- desactivación de sede;
- desactivación de área;
- cambio de asignación laboral;
- cambio de `assignable`;
- cambio de rol;
- cambio de habilitación territorial;
- check-in;
- check-out;
- cambio de sesión de dispositivo;
- corrección de una incompatibilidad.

AUTH-CTX-029 definirá invalidación, caché y fingerprint.

---

#### 54. Determinismo

Para el mismo:

- actor efectivo;
- `active_shift`;
- `active_checkin_session`;
- `operational_role`;
- asignaciones laborales;
- catálogos de sede y área;
- habilitaciones;
- `resolved_at`;

la resolución deberá producir exactamente el mismo resultado.

No dependerá de:

- orden físico de filas;
- primera coincidencia;
- selector;
- navegador;
- dispositivo;
- caché obsoleta;
- último turno;
- último check-in;
- nombres aproximados;
- heurísticas.

---

#### 55. Casos de ejemplo

##### Caso A — Sede y área válidas

```text
turno = VENTO_CAFE / CAJA
empleado asignado a VENTO_CAFE
rol = cajero_satelite
habilitación exacta vigente
```

Resultado:

```text
operational_site = {
  site_id: "VENTO_CAFE",
  source_shift_id: "...",
  site_active: true,
  assignment_valid: true
}

operational_area = {
  area_id: "CAJA_VENTO_CAFE",
  site_id: "VENTO_CAFE",
  area_kind: "caja",
  source: "SHIFT",
  area_active: true,
  compatible_with_role: true
}
```

##### Caso B — Check-in confirma área

```text
turno.area_id = CAJA_VENTO_CAFE
checkin.area_id = CAJA_VENTO_CAFE
```

Resultado:

```text
operational_area.source = CHECKIN_CONFIRMED_SHIFT
```

##### Caso C — Punto externo

```text
turno.site_id = CENTRO_PRODUCCION
checkin_point = PICKUP_CAMIONETA
```

Resultado:

```text
operational_site.site_id = CENTRO_PRODUCCION
```

El punto externo no reemplaza la sede.

##### Caso D — Sede no asignada

```text
turno.site_id = SAUDO
assigned_sites = [VENTO_CAFE]
```

Resultado:

```text
operational_site != null
assignment_valid = false
```

El carril operativo no queda disponible.

##### Caso E — Sede inactiva

```text
site_id resoluble
site_active = false
```

Resultado:

```text
operational_site != null
site_active = false
```

##### Caso F — Área nula para rol site-wide

```text
rol = conductor_logistica
area_id = null
configuración site-wide válida
```

Resultado:

```text
operational_area = null
```

El contexto puede continuar para permisos que no exijan área.

##### Caso G — Área nula para rol que la exige

```text
rol = cajero_satelite
area_id = null
```

Resultado:

```text
operational_area = null
operational_role.valid_for_area = false
```

##### Caso H — Área de otra sede

```text
turno.site_id = SAUDO
turno.area_id = CAJA_VENTO_CAFE
```

Resultado:

```text
operational_site puede representar SAUDO
operational_area = null
structural_issue = área fuera de sede
```

##### Caso I — Área activa, rol incompatible

```text
turno.area_id = REPOSTERIA
rol = produccion_panaderia
```

Resultado:

```text
operational_area != null
area_active = true
compatible_with_role = false
```

##### Caso J — Sin turno

```text
active_shift = null
```

Resultado:

```text
operational_site = null
operational_area = null
```

La administración permanece independiente.

##### Caso K — Selector visual distinto

```text
selected_site = SAUDO
active_shift.site_id = VENTO_CAFE
```

Resultado:

```text
operational_site.site_id = VENTO_CAFE
```

##### Caso L — Recurso en otra sede

```text
operational_site = CENTRO_PRODUCCION
resource_site = VENTO_CAFE
```

Resultado:

```text
AUTH-CTX-013 no autoriza
AUTH-CTX-020 deberá evaluar permiso transversal o denegar
```

##### Caso M — Check-in con área distinta

```text
turno.area_id = BODEGA
checkin.area_id = REPOSTERIA
```

Resultado:

```text
operational_area conserva BODEGA desde SHIFT
check-in no confirma
structural_issue = mismatch
```

##### Caso N — Empleado sin `assigned_areas`

```text
turno.area_id válido
assigned_areas = []
```

Resultado:

```text
operational_area puede existir
```

La afiliación administrativa de área no es requisito operativo general.

---

#### 56. Inconsistencias estructurales detectables

AUTH-CTX-013 identifica las siguientes clases:

1. turno sin sede;
2. sede desconocida;
3. sede ambigua;
4. sede inactiva;
5. entidad técnica usada como sede laboral;
6. `source_shift_id` incompatible;
7. sede no asignada al empleado;
8. asignación inactiva;
9. sede no asignable;
10. fallback a sede primaria;
11. fallback a `employees.site_id`;
12. selector usado como fuente;
13. check-in usado para reemplazar sede;
14. punto físico usado como sede;
15. dispositivo usado como sede;
16. turno con área desconocida;
17. área ambigua;
18. área inactiva;
19. área perteneciente a otra sede;
20. `area_kind` desconocido;
21. `area_kind` derivado del rol;
22. área completada desde perfil;
23. área completada desde check-in;
24. área completada desde dispositivo;
25. área completada desde selector;
26. área obligatoria ausente;
27. área incompatible con el rol;
28. check-in con sede incompatible;
29. check-in con área incompatible;
30. `CHECKIN_CONFIRMED_SHIFT` sin coincidencia exacta;
31. `null` tratado como wildcard;
32. territorio operativo tratado como recurso;
33. permiso global usado como cross-site;
34. cobertura administrativa usada como sede operativa;
35. snapshot reutilizado después de cambio territorial.

AUTH-CTX-015 deberá asignar:

- código definitivo;
- severidad;
- carril afectado;
- exposición;
- mensaje seguro;
- efecto sobre `lane_readiness`.

---

#### 57. Fail closed

Ante ausencia, contradicción o ambigüedad:

```text
operational_site = null
```

cuando la sede no sea resoluble.

Cuando la sede sea resoluble pero no utilizable:

```text
operational_site puede existir
site_active = false
o
assignment_valid = false
```

Cuando el área sea ausente legítimamente:

```text
operational_area = null
```

sin problema global.

Cuando el área sea inválida o incompatible:

```text
operational_area = null
```

o:

```text
operational_area puede existir
compatible_with_role = false
```

según si el área es territorialmente resoluble.

En ningún caso una condición inválida podrá habilitar el carril operativo.

Queda prohibido:

- usar la sede primaria;
- usar la sede seleccionada;
- usar el punto de marcación;
- usar la sede del dispositivo;
- usar la sede del recurso;
- escoger la primera área;
- inferir área por rol;
- tratar área nula como todas;
- corregir silenciosamente una sede o área;
- elegir la configuración más permisiva.

---

#### 58. Minimización de datos

`operational_site` y `operational_area` no deberán incluir:

- nombres humanos;
- direcciones;
- coordenadas;
- geocercas;
- horarios;
- responsables;
- fotografías;
- datos del dispositivo;
- punto de marcación;
- permisos;
- grants;
- denegaciones;
- historial;
- notas;
- información financiera;
- datos del recurso.

El contrato conserva únicamente los campos publicados.

---

#### 59. Relación con tareas posteriores

##### AUTH-CTX-014

Definirá `device_context` y la intersección restrictiva entre:

- actor;
- turno;
- sede;
- área;
- dispositivo;
- paquete de capacidades.

##### AUTH-CTX-015

Congelará códigos, severidades y efecto sobre `lane_readiness`.

##### AUTH-CTX-017

Aportará:

- requisito de turno;
- requisito de check-in;
- requisito de área;
- alcance territorial del permiso.

##### AUTH-CTX-018

Resolverá el territorio real del recurso, incluyendo casos:

- site-wide;
- por área;
- multisitio;
- multiárea;
- origen y destino;
- no territorial.

##### AUTH-CTX-020

Evaluará el carril operativo combinando:

- turno;
- check-in;
- rol;
- sede operativa;
- área operativa;
- recurso;
- grants;
- denegaciones.

##### AUTH-CTX-023

Expondrá razones seguras de bloqueo territorial.

##### AUTH-CTX-024

Definirá evidencia auditable de sede, área y fuentes utilizadas.

##### AUTH-CTX-025

Diseñará el productor SQL de ambos nodos, incluyendo:

- catálogo canónico;
- asignaciones laborales;
- estado;
- pertenencia sede-área;
- fuente del área;
- determinismo;
- fail closed.

##### AUTH-CTX-026

Diseñará el evaluador que compara contexto y recurso.

##### AUTH-CTX-027

Obligará a las aplicaciones a consumir el contexto centralizado y eliminar:

- `selectedSite` como autoridad;
- `selectedArea` como autoridad;
- `employees.site_id` como autoridad;
- lógica local de “área actual”.

##### AUTH-CTX-028

Diseñará compatibilidad con:

- `employees.site_id`;
- `employees.area_id`;
- `employee_sites`;
- `employee_areas`;
- `employee_shifts.site_id`;
- `employee_shifts.area_id`;
- área nula del check-in legacy;
- `get_operational_context`;
- sede seleccionada prioritaria;
- consumidores actuales;
- puntos de check-in almacenados en `sites`.

##### AUTH-CTX-029

Definirá invalidación por cambios territoriales.

##### AUTH-CTX-030

Definirá pruebas contractuales de:

- sede válida;
- sede no asignada;
- sede inactiva;
- sede técnica;
- área válida;
- área nula;
- área obligatoria ausente;
- área de otra sede;
- área inactiva;
- área incompatible con rol;
- check-in confirmatorio;
- check-in incompatible;
- dispositivo incompatible;
- recurso en otra sede;
- operación multiterritorial.

##### BLOQUE E1

Deberá confrontar estas reglas con la operación real y detectar:

- trabajos temporales en sedes no asignadas;
- cambios de área durante turno;
- rotaciones;
- puntos externos;
- roles site-wide;
- necesidades cross-site.

##### BLOQUE E2

Diseñará los procesos objetivo para:

- planificación;
- reasignación;
- corrección;
- selección visual;
- bloqueo y recuperación.

##### BLOQUE E3

Definirá fuentes físicas, catálogos, relaciones, constraints, RLS, retención y
auditoría.

##### BLOQUE E4

Definirá eventos, sincronización, evidencia y colas relacionadas con cambios
operativos.

##### BLOQUE E5

Convertirá las decisiones en paquetes implementables y orden de transición.

##### BLOQUE R

Implementará migraciones, funciones, protecciones, backfills, pruebas y
compatibilidad.

##### AUTH-DB-006 a AUTH-DB-010

Incorporarán el contexto y las validaciones en RPC sensibles.

##### AUTH-DB-011

Aplicará constraints después de reconciliación y backfill.

##### AUTH-DB-020

Migrará estructuras legacy con compatibilidad temporal.

##### AUTH-DB-027

Creará el harness de pruebas de integridad, RLS, RPC y migraciones.

##### AUTH-DB-030

Retirará rutas y objetos legacy solo después de adopción comprobada.

##### AUTH-DB-031

Certificará paridad documental, técnica y operativa.

---

#### 60. Fuera del alcance

AUTH-CTX-013 no:

- crea sedes;
- crea áreas;
- activa o desactiva territorios;
- asigna empleados a sedes;
- asigna empleados a áreas;
- corrige turnos;
- cambia roles;
- crea habilitaciones territoriales;
- define geocercas;
- define puntos de marcación;
- define dispositivos;
- define recursos;
- define permisos;
- define grants;
- define denegaciones;
- decide autorización final;
- crea tablas;
- crea constraints;
- crea funciones SQL;
- crea RPC;
- crea RLS;
- crea migraciones;
- ejecuta backfills;
- modifica Supabase;
- modifica aplicaciones.

Cada responsabilidad posterior tiene un destino explícito en la sección 59.

---

#### 61. Riesgos controlados

##### Riesgo 1 — Sede seleccionada tratada como operación

Control:

```text
operational_site solo deriva de active_shift
```

##### Riesgo 2 — Punto físico reemplaza sede

Control:

```text
checkin point
≠
operational site
```

##### Riesgo 3 — Sede no asignada autoriza

Control:

```text
assignment_valid = false
```

##### Riesgo 4 — Área administrativa se usa como operativa

Control:

```text
operational_area solo deriva del turno
```

##### Riesgo 5 — Área nula se interpreta como wildcard

Control:

```text
null requiere semántica explícita
```

##### Riesgo 6 — Check-in inventa área

Control:

```text
check-in solo puede confirmar la misma área
```

##### Riesgo 7 — Rol válido opera en área incompatible

Control:

```text
compatible_with_role = false
```

##### Riesgo 8 — Permiso global permite cross-site

Control:

```text
global operativo
≠
transversal
```

---

#### 62. Criterios de aprobación

AUTH-CTX-013 podrá aprobarse cuando se acepte que:

1. `operational_site` conserva la forma de `AccessContext@1.0.0`;
2. `operational_area` conserva la forma de `AccessContext@1.0.0`;
3. la tarea es una aclaración normativa compatible;
4. ambos nodos se resuelven exclusivamente en servidor;
5. ambos dependen del actor efectivo empleado;
6. ambos dependen de `active_shift`;
7. sin turno no existe territorio operativo;
8. la sede procede exclusivamente del turno;
9. el área procede exclusivamente del turno;
10. la sede primaria no es fallback;
11. la sede seleccionada no es fuente;
12. el área seleccionada no es fuente;
13. el perfil no es fuente;
14. el dispositivo no es fuente;
15. el recurso no es fuente del contexto laboral;
16. `site_id` coincide exactamente con el turno;
17. `source_shift_id` coincide exactamente con el turno;
18. una sede desconocida produce `null`;
19. una sede inactiva puede conservarse con `site_active = false`;
20. `assignment_valid` depende de asignación laboral utilizable;
21. el turno no crea asignación;
22. una sede no asignada produce `assignment_valid = false`;
23. `employees.site_id` es legacy;
24. el check-in solo confirma la sede;
25. un punto externo no reemplaza la sede;
26. el dispositivo solo restringe;
27. un área ausente produce `operational_area = null`;
28. una ausencia legítima de área no es inconsistencia;
29. un área desconocida produce `null` y problema estructural;
30. un área de otra sede produce `null` y problema estructural;
31. `area_id` coincide exactamente con el turno;
32. `area_kind` procede del catálogo del área;
33. `area_kind` no sustituye `area_id`;
34. un área inactiva puede conservarse con `area_active = false`;
35. `SHIFT` identifica área derivada únicamente del turno;
36. `CHECKIN_CONFIRMED_SHIFT` exige coincidencia exacta;
37. el check-in no crea área;
38. un check-in sin área no elimina el área del turno;
39. un check-in incompatible no cambia el área;
40. `assigned_areas` no es requisito operativo general;
41. `compatible_with_role` depende del rol efectivo;
42. un área válida puede ser incompatible con el rol;
43. un rol site-wide puede operar sin área cuando esté aprobado;
44. un rol que exige área no puede usar fallback;
45. un permiso sin área puede evaluarse a nivel sede;
46. un permiso que exige área requiere nodo válido;
47. `null` nunca significa wildcard;
48. el contexto operativo no sustituye territorio del recurso;
49. recursos multiterritoriales se resuelven en AUTH-CTX-018;
50. permisos globales operativos no son cross-site;
51. cobertura administrativa y territorio operativo permanecen separados;
52. selectores visuales no cambian territorio;
53. dispositivos actúan por intersección restrictiva;
54. simulación no modifica contexto real;
55. procesos `SYSTEM` autónomos no reciben territorio laboral;
56. modalidades base y operativas permanecen separadas;
57. permisos `T` no requieren check-in;
58. permisos `T+C` requieren coincidencia con sesión;
59. AUTH-CTX-014 definirá dispositivo;
60. AUTH-CTX-015 congelará problemas y readiness;
61. AUTH-CTX-018 resolverá territorio del recurso;
62. AUTH-CTX-020 resolverá el carril operativo;
63. AUTH-CTX-025 diseñará el productor SQL;
64. AUTH-CTX-026 diseñará el evaluador;
65. AUTH-CTX-027 eliminará lógica territorial local;
66. AUTH-CTX-028 diseñará compatibilidad legacy;
67. AUTH-CTX-029 definirá invalidación;
68. AUTH-CTX-030 definirá pruebas contractuales;
69. E1, E2, E3, E4, E5 y BLOQUE R tienen responsabilidades explícitas;
70. AUTH-DB-006 a AUTH-DB-031 tienen responsabilidades físicas explícitas;
71. no se implementa código, migraciones ni cambios en Supabase.

---

#### 63. Estado final de la propuesta

| Tarea        | Estado      | Relación                  |
| ------------ | ----------- | ------------------------- |
| AUTH-CTX-012 | APROBADA    | Tarea anterior            |
| AUTH-CTX-013 | APROBADA    | Tarea actual              |
| AUTH-CTX-014 | NO INICIADA | Tarea siguiente reservada |

La continuidad propuesta queda:

```text
AUTH-CTX-012 — APROBADA
        ↓
AUTH-CTX-013 — APROBADA
        ↓
AUTH-CTX-014 — NO INICIADA
```

No se avanza a AUTH-CTX-014 hasta recibir aprobación explícita de
AUTH-CTX-013.


### ✅ AUTH-CTX-014 — Incluir contexto de dispositivo compartido

**Estado:** APROBADA  
**Bloque:** BLOQUE E — Contexto y decisión de autorización unificados  
**Naturaleza:** Refinamiento documental del nodo `device_context` dentro de `AccessContext`  
**Implementación física:** No incluida  
**Tarea anterior vigente:** AUTH-CTX-013 — APROBADA  
**Tarea posterior reservada:** AUTH-CTX-015 — Incluir razones estructuradas de invalidez  
**Contrato afectado:** `AccessContext@1.0.0`  
**Nodo afectado:** `device_context`  
**Cambio contractual:** Aclaración normativa compatible; no cambia la forma publicada  
**Cambios físicos permitidos:** No

Esta tarea define cómo `AccessContext` representa un dispositivo compartido
autenticado, su instancia empresarial, la sesión temporal del trabajador que
actúa y los límites máximos que el terminal puede imponer.

La tarea conserva la separación entre:

- principal técnico;
- dispositivo empresarial;
- trabajador actor;
- sesión de actor;
- sesión personal;
- check-in laboral;
- turno;
- rol base;
- rol operativo;
- sede y área;
- plantilla;
- instancia;
- aplicaciones visibles;
- paquete máximo de capacidades;
- reautenticación fuerte;
- permiso efectivo;
- decisión final.

No modifica la estructura raíz de `AccessContext`, no agrega campos, no cambia
`contract_version`, no cambia `schema_version`, no implementa SQL, RPC, RLS,
migraciones, tablas, sesiones, PIN, heartbeat, aplicaciones ni cambios físicos
en Supabase.

---

#### 1. Objetivo

Definir el nodo `device_context` de manera que Vento OS pueda responder
inequívocamente:

1. si el principal autenticado corresponde a un dispositivo compartido;
2. cuál dispositivo empresarial exacto representa;
3. si la relación entre credencial técnica y dispositivo es válida;
4. cuál es el estado contractual del dispositivo;
5. si existe una sesión de actor vigente;
6. cuál es su identificador y vencimiento;
7. si la sesión corresponde al actor efectivo;
8. si existe más de una sesión activa incompatible;
9. qué aplicaciones puede presentar como máximo el dispositivo;
10. qué paquete máximo de capacidades lo restringe;
11. cómo se aplica la herencia entre plantilla e instancia;
12. cómo se garantiza que la instancia solo reduzca;
13. cómo se relaciona el dispositivo con turno, check-in, rol, sede y área;
14. cómo se tratan PIN, QR y reautenticación fuerte;
15. qué ocurre cuando no existe actor humano;
16. qué operaciones técnicas pueden quedar separadas de las empresariales;
17. qué ocurre ante dispositivo inactivo, revocado o inválido;
18. qué ocurre ante expiración o cambio de trabajador;
19. cómo impedir que aplicaciones visibles concedan permisos;
20. cómo impedir que `navigation_role` participe en autorización;
21. cómo mantener separados los carriles base y operativo;
22. cómo preservar determinismo, trazabilidad y fail closed.

---

#### 2. Base normativa

AUTH-CTX-014 conserva sin cambios las decisiones aprobadas en:

- ADR-AUTH-001;
- AUTH-MOD-001 — Identidad laboral y actor efectivo;
- AUTH-MOD-002 — Separar rol base de rol operativo;
- AUTH-MOD-007 y AUTH-MOD-008 — Sede y área;
- AUTH-MOD-009 y AUTH-MOD-010 — Turno y check-in;
- AUTH-MOD-011 — Sesión en dispositivo compartido;
- AUTH-MOD-018 — Precedencia entre carriles;
- AUTH-MOD-019 — Denegación explícita;
- AUTH-CAT-014 — Compatibilidad de cada permiso con dispositivo compartido;
- AUTH-RBAC-022 — Denegaciones individuales y transversales;
- AUTH-RBAC-023 — Capacidades permitidas por dispositivo compartido;
- AUTH-RBAC-026 — Dataset de denegaciones y restricciones relacionadas;
- AUTH-CTX-001 — Diseñar `AccessContext`;
- AUTH-CTX-004 — Versionar contratos;
- AUTH-CTX-005 — Principal autenticado;
- AUTH-CTX-006 — Actor efectivo;
- AUTH-CTX-007 — Identidad laboral o de dominio;
- AUTH-CTX-010 a AUTH-CTX-013 — Turno, check-in, rol y territorio operativo.

Invariantes heredados obligatorios:

```text
PRINCIPAL DEL DISPOSITIVO
≠
ACTOR HUMANO
```

```text
SESIÓN DE ACTOR
≠
LOGIN PERSONAL COMPLETO
```

```text
SESIÓN DE ACTOR
≠
CHECK-IN LABORAL
```

```text
DISPOSITIVO PERMITE
≠
ACTOR TIENE PERMISO
```

```text
AUTORIDAD DEL ACTOR
∩
LÍMITE DEL DISPOSITIVO
=
CAPACIDAD EVALUABLE
```

Nunca:

```text
AUTORIDAD DEL ACTOR
∪
LÍMITE DEL DISPOSITIVO
```

---

#### 3. Forma contractual conservada

AUTH-CTX-014 conserva exactamente la forma conceptual publicada:

```ts
type DeviceContext = {
  device_id: string;
  device_code: string;
  device_type: string;
  device_status: "ACTIVE" | "INACTIVE" | "INVALID";
  authenticated_as_device: boolean;
  actor_session_id: string | null;
  actor_session_expires_at: string | null;
  allowed_application_codes: string[];
  capability_package_code: string | null;
};
```

No se agregan propiedades.

La publicación permanece:

```text
AccessContext
contract_version = 1.0.0
schema_version   = 1.0.0
```

Las restricciones territoriales, versión de plantilla, modo de sesión,
política de actor y evidencia de reautenticación continúan en las fuentes
canónicas y en la evidencia auditable; no se duplican como campos nuevos en
esta versión.

---

#### 4. Cuándo existe `device_context`

Regla general:

```text
principal.principal_type = SHARED_DEVICE
→ device_context debe intentar resolverse
```

Para una sesión personal:

```text
principal.principal_type = HUMAN_USER
→ device_context = null
```

aunque la persona utilice físicamente:

- una tablet;
- un computador compartido;
- un navegador de una sede;
- una terminal conocida.

La clasificación depende del principal autenticado, no del tipo físico de
equipo desde el que se conecta.

---

#### 5. Resolución exclusiva en servidor

El nodo deberá resolverse en servidor desde:

- principal autenticado;
- vínculo técnico entre sujeto Auth y dispositivo empresarial;
- estado de la instancia;
- plantilla y versión fijada;
- configuración de aplicaciones;
- paquete de capacidades;
- sesión de actor;
- `resolved_at`.

No podrá aceptarse como fuente autoritativa:

- `device_id` enviado por el cliente;
- `device_code` almacenado en local storage;
- correo técnico interpretado por prefijo;
- nombre del equipo;
- dirección IP;
- user agent;
- ruta visitada;
- QR no validado;
- cookie no firmada;
- último dispositivo usado;
- plantilla declarada por frontend;
- paquete declarado por frontend;
- aplicaciones cargadas en la interfaz;
- `navigation_role`;
- empleado recordado localmente.

---

#### 6. Identidad técnica del dispositivo

El dispositivo empresarial deberá vincularse de forma inequívoca con el
principal autenticado.

Contrato conceptual:

```text
principal SHARED_DEVICE válido
+
relación técnica única
→ dispositivo empresarial exacto
```

Una identidad técnica válida no concede autoridad empresarial.

La credencial únicamente demuestra:

```text
esta solicitud procede del dispositivo D
```

No demuestra:

```text
el trabajador E puede ejecutar la acción P
```

---

#### 7. `device_id`

`device_id` será el identificador canónico exacto de la instancia empresarial.

No podrá ser:

- `auth.uid()` reutilizado como identidad empresarial;
- código humano;
- serial de hardware sin registro empresarial;
- correo;
- IP;
- identificador de plantilla;
- identificador de sesión;
- identificador del trabajador.

Regla:

```text
device_context.device_id
→ instancia empresarial única
```

Si no existe una relación única:

```text
device_context = null
```

y se registrará el problema estructural aplicable.

---

#### 8. `device_code`

`device_code` será el código empresarial estable de la instancia.

Deberá:

- ser único dentro del dominio;
- ser distinto del nombre humano;
- permanecer estable ante cambios de etiqueta;
- no contener secretos;
- no identificar al trabajador;
- no determinar permisos;
- no determinar rol.

Códigos como:

```text
CAJA_VENTO_CAFE_01
KIOSCO_BODEGA_CP
```

pueden identificar instancias, pero su texto no será interpretado para inferir
sede, área, rol o capacidades.

---

#### 9. `device_type`

`device_type` expresa la clasificación técnica o funcional de la instancia.

Ejemplos conceptuales:

- `pos_terminal`;
- `warehouse_terminal`;
- `production_terminal`;
- `reception_terminal`;
- `management_terminal`;
- otros tipos canónicos futuros.

El tipo:

- no concede permisos;
- no selecciona actor;
- no selecciona rol;
- no sustituye la plantilla;
- no sustituye el paquete;
- no autoriza todas las funciones de su categoría.

Un valor desconocido o incompatible produce `device_status = INVALID`.

---

#### 10. `authenticated_as_device`

Será `true` únicamente cuando:

1. el principal es `SHARED_DEVICE`;
2. el sujeto autenticado se vincula con exactamente una instancia;
3. la relación técnica está vigente;
4. no existe ambigüedad;
5. la credencial utilizada pertenece a esa instancia;
6. la resolución fue realizada por servidor.

Será `false` cuando exista un candidato empresarial identificable pero la
relación técnica no pueda demostrarse correctamente.

Regla:

```text
authenticated_as_device = false
→ ninguna acción empresarial desde el dispositivo
```

Una sesión personal no genera un nodo con este campo en `false`; genera
`device_context = null`.

---

#### 11. Estados del dispositivo

##### 11.1 `ACTIVE`

Significa que:

- la instancia existe;
- su identidad técnica es válida;
- está habilitada;
- no está revocada;
- su plantilla es resoluble;
- su versión fijada existe;
- su configuración es coherente;
- puede intentar iniciar una sesión de actor.

No significa:

- que está actualmente conectada;
- que existe actor humano;
- que tiene turno;
- que existe check-in;
- que una aplicación está autorizada;
- que una acción está permitida.

##### 11.2 `INACTIVE`

Significa que la instancia exacta existe, pero está:

- deshabilitada;
- suspendida;
- retirada de operación;
- revocada administrativamente;
- pendiente de reactivación autorizada.

Resultado:

```text
device_status = INACTIVE
actor_session_id = null
capacidad empresarial ejecutable = ninguna
```

##### 11.3 `INVALID`

Significa que la instancia o su configuración presenta una contradicción que
impide utilizarla de forma segura.

Ejemplos:

- vínculo técnico ambiguo;
- plantilla inexistente;
- versión de plantilla inexistente;
- instancia amplía su plantilla;
- paquete desconocido;
- aplicaciones no canónicas;
- territorio contradictorio;
- configuración heredada no resoluble;
- combinación de estado inválida.

---

#### 12. Estado no equivale a presencia en línea

`device_status = ACTIVE` no significa que el equipo esté en línea.

La ausencia de:

- heartbeat;
- `last_seen_at`;
- telemetría reciente;

no transformará automáticamente la instancia en `INACTIVE`.

La semántica de presencia, heartbeat y salud técnica se definirá en:

- AUTH-DEV-001 — Inventariar dispositivos compartidos;
- AUTH-DEV-002 — Definir identidad del dispositivo;
- BLOQUE E3 — Modelo físico;
- BLOQUE E4 — Eventos y sincronización;
- BLOQUE E5 — Paquetes de implementación;
- BLOQUE R — Implementación.

---

#### 13. Plantilla versionada

Cada instancia deberá estar fijada a una plantilla y versión exactas.

La plantilla define el máximo reutilizable de:

- tipo de terminal;
- modo de sesión;
- aplicaciones;
- paquetes de capacidades;
- política de actor;
- compatibilidad con reautenticación fuerte;
- restricciones territoriales;
- bloqueo y limpieza.

Aunque la versión no aparece como campo separado en `DeviceContext@1.0.0`, el
productor deberá resolver el nodo contra una versión exacta.

Una instancia sin versión fijada o con versión inexistente será inválida.

---

#### 14. Instancia restrictiva

La instancia puede reducir la plantilla mediante:

- deshabilitar aplicaciones;
- retirar capacidades;
- restringir territorio;
- vincular un recurso o vehículo;
- deshabilitar reautenticación fuerte no soportada;
- suspender temporalmente la operación.

Nunca podrá:

- agregar una aplicación no incluida;
- agregar una clave no incluida;
- incorporar un permiso `NOT_ALLOWED`;
- ampliar una sede;
- ampliar un área;
- retirar una denegación del actor;
- crear un bypass.

Regla:

```text
instancia efectiva
⊆
plantilla versionada
```

Una ampliación produce:

```text
device_status = INVALID
```

---

#### 15. Sesión de actor

La sesión de actor vincula temporalmente:

```text
DISPOSITIVO
+
EMPLEADO
+
MODO DE SESIÓN
+
INICIO
+
EXPIRACIÓN
+
CONTEXTO RESUELTO
```

No es:

- sesión Auth personal;
- check-in;
- turno;
- rol;
- permiso;
- delegación;
- simulación;
- selección visual.

Solo podrá existir un actor efectivo por dispositivo en un instante.

---

#### 16. `actor_session_id`

Será el identificador canónico de la sesión de actor vigente.

Reglas:

1. deberá pertenecer al mismo `device_id`;
2. deberá vincular exactamente un empleado;
3. deberá estar abierta;
4. deberá estar vigente en `resolved_at`;
5. no deberá estar reemplazada;
6. no deberá estar revocada;
7. deberá ser la única candidata válida;
8. deberá coincidir con `actor_effective`.

Cuando no existe sesión válida:

```text
actor_session_id = null
```

No se utilizará:

- último actor;
- último empleado;
- actor guardado en cookie;
- empleado de la sede;
- rol de navegación;
- perfil predeterminado.

---

#### 17. `actor_session_expires_at`

Cuando existe una sesión de actor activa:

```text
actor_session_expires_at != null
```

y deberá cumplirse:

```text
resolved_at < actor_session_expires_at
```

Una sesión sin vencimiento resoluble no se tratará como indefinida.

Casos:

```text
actor_session_id = null
→ actor_session_expires_at = null
```

```text
actor_session_id != null
+
actor_session_expires_at = null
→ sesión inválida
```

```text
resolved_at >= actor_session_expires_at
→ sesión expirada
→ actor_session_id = null en el contexto efectivo
```

La duración numérica se definirá en AUTH-DEV-012 y en el diseño físico
posterior.

---

#### 18. Inicio temporal de sesión

La sesión solo será vigente cuando:

```text
started_at <= resolved_at < expires_at
```

Aunque `started_at` no se serializa en `DeviceContext@1.0.0`, deberá existir
en la fuente autoritativa.

Una sesión futura no produce actor.

Una sesión creada con timestamps imposibles será inválida.

---

#### 19. Cierre y revocación

Una sesión deja de ser vigente cuando:

- el trabajador la cierra;
- el dispositivo cambia de actor;
- expira;
- el dispositivo se revoca;
- la instancia se desactiva;
- una acción administrativa la invalida;
- la plantilla obliga a limpieza;
- se detecta contradicción estructural.

El cierre deberá invalidar snapshots anteriores mediante AUTH-CTX-029.

AUTH-DEV-011, AUTH-DEV-012 y AUTH-DEV-013 definirán la operación objetivo de
revocación, expiración y cambio de trabajador.

---

#### 20. Actor efectivo

Cuando existe sesión válida:

```text
principal.principal_type = SHARED_DEVICE
actor_effective.actor_type = EMPLOYEE
actor_effective.attribution_source = DEVICE_ACTOR_SESSION
actor_effective.actor_id = empleado de la sesión
```

El dispositivo continúa siendo el principal.

El empleado continúa siendo el actor.

Reglas:

```text
actor_effective.actor_id
≠
device_context.device_id
```

```text
actor_effective.delegation_id = null
```

```text
device_context.actor_session_id
≠
actor_effective.delegation_id
```

---

#### 21. Coincidencia con el empleado

La sesión deberá resolver exactamente el mismo empleado representado en:

- `actor_effective`;
- `domain_identity`;
- `employee`.

Si no coincide:

```text
actor_effective = UNRESOLVED
```

para la ruta de dispositivo y ninguna acción empresarial podrá continuar.

El dispositivo no reasignará la sesión al usuario técnico.

---

#### 22. Empleado inactivo

Una sesión exacta puede conservar evidencia de atribución a un empleado que
luego quedó inactivo.

Sin embargo:

- el actor puede continuar siendo identificable;
- el empleado permanece `INACTIVE`;
- los carriles laborales no quedan disponibles;
- el dispositivo no reactiva al empleado;
- el paquete no compensa la inactividad.

---

#### 23. Varias sesiones activas

Casos:

```text
0 sesiones válidas
→ actor_session_id = null
```

```text
1 sesión válida
→ actor_session_id = sesión exacta
```

```text
2 o más sesiones incompatibles
→ actor_session_id = null
→ actor_effective = UNRESOLVED
→ structural_issue
```

Queda prohibido elegir:

- la más reciente;
- la primera;
- la que coincide con turno;
- la que tiene check-in;
- la que coincide con navegación;
- la del último PIN;
- la del rol esperado.

---

#### 24. PIN, QR y mecanismos ligeros

Un PIN, QR o mecanismo ligero puede servir para:

- localizar al trabajador;
- iniciar la sesión;
- confirmar presencia ante el dispositivo;
- reducir fricción operacional.

No deberá:

- almacenarse dentro del contexto;
- exponerse;
- convertirse en permiso;
- convertirse en rol;
- convertirse en check-in;
- considerarse reautenticación fuerte;
- conservar autoridad después de expirar la sesión.

AUTH-DEV-007 definirá el mecanismo operativo.

E3, E5 y BLOQUE R definirán almacenamiento, hashing, intentos, bloqueo,
rotación, auditoría y recuperación.

---

#### 25. Reautenticación fuerte

La sesión ordinaria de actor no satisface automáticamente:

```text
STRONG_REAUTH_REQUIRED
```

Un PIN ligero tampoco lo satisface.

Para una acción clasificada como `STRONG_REAUTH_REQUIRED` deberá existir:

1. plantilla compatible;
2. instancia compatible;
3. aplicación permitida;
4. clave exacta incluida en el paquete;
5. evidencia de reautenticación fuerte personal y vigente;
6. actor humano exacto;
7. contexto y recurso válidos;
8. ausencia de denegaciones.

La evidencia fuerte es específica de la acción o de una ventana corta
autorizada y no se serializa dentro de `DeviceContext@1.0.0`.

AUTH-CTX-017 definirá el requisito.

AUTH-CTX-020 y AUTH-CTX-023 definirán su efecto en la decisión.

---

#### 26. Sin sesión humana

Un dispositivo `ACTIVE` puede existir con:

```text
actor_session_id = null
actor_session_expires_at = null
```

En ese estado:

- no existe actor humano efectivo;
- no se ejecutan acciones empresariales;
- no se usan permisos base;
- no se usan permisos operativos;
- no se utiliza `navigation_role`;
- no se reutiliza el actor anterior.

Solo podrán ejecutarse operaciones técnicas expresamente separadas, como las
necesarias para:

- cargar configuración;
- iniciar sesión de actor;
- reportar salud;
- cerrar o limpiar estado;
- obtener actualizaciones autorizadas.

El inventario exacto de operaciones técnicas se definirá en AUTH-DEV-002,
AUTH-DEV-007, AUTH-DEV-011, AUTH-DEV-012 y AUTH-DEV-013 y se implementará en
BLOQUE R.

---

#### 27. Sesión de actor y check-in

La sesión de actor:

- identifica quién usa el terminal;
- no demuestra que inició jornada;
- no reemplaza `active_checkin_session`;
- no crea `active_shift`;
- no crea rol operativo.

Un trabajador puede:

```text
tener sesión de actor
+
no tener check-in
```

En ese caso:

- el carril base puede evaluarse si el paquete lo permite;
- permisos `T` requieren además turno;
- permisos `T+C` requieren turno y check-in;
- el dispositivo nunca completa los prerrequisitos faltantes.

---

#### 28. Sesión de actor y turno

La sesión no selecciona el turno.

El orden obligatorio es:

```text
resolver dispositivo
→ resolver sesión de actor
→ resolver empleado
→ resolver active_shift del empleado
```

No:

```text
resolver sesión
→ elegir turno que coincida con dispositivo
```

El turno continúa siendo autoritativo para rol, sede y área operativas.

---

#### 29. Sede y área del dispositivo

La instancia puede estar fijada a:

- una sede;
- un área;
- un conjunto permitido;
- un vehículo;
- un recurso.

Esas restricciones no se serializan como campos nuevos en
`DeviceContext@1.0.0`, pero deberán aplicarse al resolver el contexto y la
decisión.

Regla:

```text
territorio del actor
∩
territorio permitido por dispositivo
=
territorio utilizable desde el dispositivo
```

Nunca:

```text
territorio del actor
∪
territorio del dispositivo
```

AUTH-DEV-003 y AUTH-DEV-004 definirán la configuración objetivo.

AUTH-CTX-018 y AUTH-CTX-020 consumirán la restricción para el recurso exacto.

---

#### 30. Incompatibilidad territorial

Ejemplo:

```text
turno = SAUDO / COCINA
dispositivo = VENTO_CAFE / CAJA
```

Resultado:

- el dispositivo no cambia el turno;
- el turno no cambia la instancia;
- la sesión no amplía territorios;
- la acción empresarial se deniega;
- el problema se registra;
- la interfaz deberá exigir cierre o cambio válido.

AUTH-CTX-015 congelará el problema estructural.

AUTH-DEV-013 definirá el flujo de cambio de trabajador.

---

#### 31. `allowed_application_codes`

Representa el conjunto máximo de aplicaciones que la instancia puede
presentar o utilizar después de aplicar:

```text
aplicaciones de la plantilla versionada
∩
aplicaciones no deshabilitadas por la instancia
∩
aplicaciones canónicas activas
```

No representa:

- permisos;
- acceso interno a módulos;
- autorización de rutas;
- autorización de acciones;
- bypass;
- menú definitivo del actor.

Regla:

```text
app visible en allowed_application_codes
≠
actor autorizado en esa app
```

---

#### 32. Normalización de aplicaciones

La lista deberá:

1. contener códigos canónicos;
2. excluir aplicaciones inexistentes;
3. excluir aplicaciones inactivas;
4. excluir aplicaciones no presentes en la plantilla;
5. eliminar duplicados exactos;
6. ordenarse alfabéticamente;
7. permanecer determinista;
8. no contener wildcards.

Una aplicación desconocida o una ampliación de instancia produce
`device_status = INVALID`.

Lista vacía significa:

```text
ninguna aplicación empresarial disponible
```

No significa todas las aplicaciones.

---

#### 33. Aplicación solicitada

AUTH-CTX-016 definirá `app_code`.

La decisión deberá exigir:

```text
app_code solicitado
∈
device_context.allowed_application_codes
```

cuando el principal sea un dispositivo compartido.

La coincidencia únicamente permite continuar la evaluación.

No produce `ALLOW`.

---

#### 34. `capability_package_code`

Identifica el paquete efectivo, exacto y versionado de capacidades máximas
admitidas por la instancia.

El paquete:

- contiene claves exactas;
- no contiene wildcards;
- no concede al actor;
- no reemplaza matrices;
- no elimina denegaciones;
- no modifica modalidad;
- no modifica prerrequisitos;
- no convierte aplicación permitida en permiso.

Regla:

```text
permission_key solicitada
∈ paquete efectivo
```

es una condición restrictiva adicional.

---

#### 35. Paquete efectivo

La configuración efectiva deberá corresponder a:

```text
paquete máximo de plantilla
-
retiros de instancia
=
paquete efectivo versionado
```

Si la instancia aplica retiros propios, deberá referenciar un paquete efectivo
identificable y reproducible.

Queda prohibido:

- modificar un paquete en sitio sin versionarlo;
- agregar claves localmente;
- resolver por prefijo;
- permitir una app completa;
- utilizar un nombre de rol como paquete;
- utilizar `navigation_role`;
- utilizar rutas como permisos.

---

#### 36. Paquete nulo

```text
capability_package_code = null
```

significa que el dispositivo no expone capacidades empresariales mediante un
paquete aprobado.

Puede ser válido para:

- dispositivo en configuración;
- terminal técnica;
- instancia sin despliegue empresarial;
- estado de transición controlada.

No significa:

- todos los permisos del actor;
- todos los permisos de las aplicaciones;
- todos los permisos de la plantilla;
- usar la matriz sin filtro de dispositivo.

---

#### 37. Clasificación de compatibilidad

AUTH-RBAC-023 conserva:

| Clasificación            | Regla                                                                                |
| ------------------------ | ------------------------------------------------------------------------------------ |
| `STANDARD_ACTOR_SESSION` | Puede participar desde sesión ordinaria cuando la plantilla y el paquete lo incluyan |
| `STRONG_REAUTH_REQUIRED` | Exige reautenticación fuerte personal adicional                                      |
| `NOT_ALLOWED`            | No puede incluirse en ninguna plantilla ni instancia                                 |

El contexto no sustituye esta clasificación.

Los 20 permisos `NOT_ALLOWED` permanecen excluidos universalmente.

Cualquier permiso nuevo permanece denegado por defecto en dispositivos hasta
ser clasificado y agregado mediante una nueva versión aprobada.

---

#### 38. Intersección por acción

Para una acción empresarial desde dispositivo compartido deberán coincidir:

```text
actor efectivo válido
∩ permiso del actor
∩ modalidad correcta
∩ prerrequisitos satisfechos
∩ aplicación permitida
∩ clave incluida en paquete
∩ política de actor satisfecha
∩ territorio compatible
∩ recurso compatible
∩ reautenticación fuerte cuando aplique
∩ ausencia de denegaciones
=
acción autorizable
```

La evaluación exacta corresponde a AUTH-CTX-016 a AUTH-CTX-023.

---

#### 39. `navigation_role`

`navigation_role` no participa en:

- actor efectivo;
- rol base;
- rol operativo;
- permiso;
- modalidad;
- sede;
- área;
- paquete;
- decisión.

Puede servir únicamente como dato de presentación legacy o sugerencia de
navegación mientras se retira.

Cualquier lógica como:

```text
navigation_role = bodeguero
→ conceder permisos de bodeguero
```

queda prohibida.

AUTH-DEV-009 y AUTH-CTX-027 deberán eliminar su uso autoritativo.

AUTH-CTX-028 definirá compatibilidad temporal.

---

#### 40. Política de actor

La plantilla e instancia pueden restringir qué trabajadores pueden abrir una
sesión.

La política deberá consumir hechos canónicos como:

- empleado activo;
- asignación laboral;
- turno;
- rol operativo;
- sede;
- área;
- relación con recurso;
- modo de sesión permitido.

No podrá basarse únicamente en:

- pertenecer a la misma sede;
- nombre del rol;
- `navigation_role`;
- último trabajador;
- correo;
- código de dispositivo.

La política actual `same_site_active_worker` no será suficiente como política
final del kiosco de bodega porque permite un conjunto excesivamente amplio.

AUTH-DEV-008 definirá la combinación objetivo.

---

#### 41. Cambio de trabajador

Antes de activar a un nuevo actor deberán:

1. terminar la sesión anterior;
2. invalidar contexto y decisiones cacheadas;
3. limpiar datos sensibles y estado de UI;
4. cerrar vistas del actor anterior;
5. crear una sesión nueva;
6. volver a resolver identidad, turno, check-in, rol y territorio;
7. recalcular aplicaciones y capacidades evaluables;
8. registrar ambos eventos.

No se transferirán:

- permisos;
- filtros;
- borradores;
- recursos;
- decisiones;
- datos sensibles;
- sesiones de check-in;
- reautenticación fuerte.

AUTH-DEV-013 definirá el flujo físico.

---

#### 42. Expiración

Al expirar la sesión:

```text
actor_session_id = null
actor_session_expires_at = null
actor_effective = UNRESOLVED para acciones empresariales
```

El dispositivo podrá conservar su propia identidad técnica.

Deberán limpiarse:

- vistas;
- datos temporales;
- cachés del actor;
- recursos sensibles;
- selecciones;
- decisiones positivas;
- evidencia fuerte reutilizable.

AUTH-DEV-012 definirá la experiencia y recuperación.

---

#### 43. Revocación del dispositivo

Cuando la instancia se revoque:

```text
device_status = INACTIVE
```

o `INVALID` según el motivo contractual.

Consecuencias:

- sesión de actor terminada;
- contexto invalidado;
- aplicaciones empresariales bloqueadas;
- paquetes inutilizables;
- decisiones cacheadas revocadas;
- nueva autenticación técnica requerida para cualquier reactivación.

AUTH-DEV-011 definirá el proceso administrativo.

---

#### 44. Dispositivo activo sin uso persistido

El estado auditado actualmente muestra infraestructura parcial con
dispositivos configurados pero sin sesiones de actor persistidas.

AUTH-CTX-014 no interpretará:

```text
dispositivo activo
→ sesión existente
```

ni:

```text
usuario técnico autenticado
→ trabajador activo
```

La conformidad operacional solo existirá cuando las tareas AUTH-DEV-001 a
AUTH-DEV-016 y los paquetes físicos correspondientes hayan sido implementados
y probados.

---

#### 45. Carril base

Un actor identificado mediante dispositivo puede conservar su carril base
cuando:

- el empleado es válido;
- el rol base es válido;
- el permiso admite dispositivo compartido;
- la aplicación está permitida;
- la clave está en el paquete;
- la política de actor se cumple;
- el recurso es compatible;
- no existe denegación;
- existe reautenticación fuerte cuando aplica.

El dispositivo nunca añade permisos base.

AUTH-DEV-009 deberá impedir herencias administrativas accidentales.

---

#### 46. Carril operativo

El carril operativo conserva todos sus requisitos:

- empleado activo;
- turno publicado y vigente;
- rol operativo válido;
- sede operativa válida;
- área compatible cuando aplique;
- check-in cuando el permiso sea `T+C`;
- grant operativo;
- recurso compatible;
- ausencia de denegación.

El dispositivo añade restricciones, no reemplaza requisitos.

AUTH-CTX-020 definirá la decisión del carril operativo.

---

#### 47. `BASE_OR_OPERATIONAL`

Cada carril se evalúa de manera independiente y después se aplica el filtro
del dispositivo a la acción exacta.

Un carril válido no autoriza si:

- la app no está permitida;
- la clave no está en el paquete;
- la política del dispositivo falla;
- el territorio del dispositivo es incompatible;
- la reautenticación requerida falta.

---

#### 48. `BASE_AND_OPERATIONAL`

Además de los dos carriles válidos, deberán satisfacerse todas las
restricciones del dispositivo.

La sesión de actor identifica al mismo empleado para ambos carriles.

El dispositivo no permite combinar:

- carril base de un actor;
- carril operativo de otro actor;
- turno del actor anterior;
- check-in residual;
- sesión del usuario técnico.

---

#### 49. Denegaciones

El dispositivo no elimina:

- denegaciones individuales base;
- denegaciones individuales operativas;
- denegaciones transversales;
- `STRUCTURAL_DENY`;
- restricciones sensibles;
- exclusiones `NOT_ALLOWED`.

Una denegación aplicable conserva precedencia aunque la app y la clave estén
permitidas por el terminal.

---

#### 50. Simulación

Una simulación no podrá:

- iniciar sesión real de actor para el sujeto simulado;
- modificar `device_context`;
- usar aplicaciones del dispositivo como autoridad;
- utilizar el paquete para conceder;
- ejecutar mutaciones;
- transferir la sesión real al sujeto simulado.

El actor real y el dispositivo real permanecen auditables.

---

#### 51. Procesos asíncronos

Una acción iniciada desde dispositivo y ejecutada después deberá conservar:

- actor efectivo original;
- dispositivo original;
- decisión o evidencia reevaluable;
- contexto y recurso;
- correlación.

La expiración de la sesión no convierte el proceso en acción anónima.

El proceso asíncrono deberá usar delegación o contrato de sistema según
AUTH-CTX-006 y BLOQUE X.

El dispositivo no permanecerá como actor del trabajo asíncrono.

---

#### 52. Snapshot y obsolescencia

`device_context` forma parte del snapshot inmutable.

El contexto queda potencialmente obsoleto cuando ocurre:

- activación o desactivación del dispositivo;
- revocación;
- cambio de plantilla;
- cambio de versión;
- cambio de aplicaciones;
- cambio de paquete;
- cambio de territorio;
- cambio de política de actor;
- inicio de sesión de actor;
- expiración;
- cierre;
- cambio de trabajador;
- cambio de soporte de reautenticación fuerte;
- desactivación de una app;
- cambio del catálogo de permisos.

AUTH-CTX-029 definirá invalidación, caché y fingerprint.

---

#### 53. Determinismo

Para el mismo:

- principal;
- instancia;
- plantilla versionada;
- configuración;
- sesión de actor;
- aplicaciones;
- paquete;
- `resolved_at`;

la resolución deberá producir exactamente el mismo nodo.

No dependerá de:

- orden físico de filas;
- última aplicación abierta;
- último empleado;
- estado de UI;
- correo;
- nombre del dispositivo;
- primer registro encontrado;
- caché obsoleta;
- configuración no versionada.

---

#### 54. Casos de ejemplo

##### Caso A — Dispositivo activo con actor válido

```text
principal = SHARED_DEVICE
device = CAJA_VENTO_CAFE_01
device_status = ACTIVE
sesión de actor única y vigente
actor = empleado E1
```

Resultado:

```text
device_context != null
authenticated_as_device = true
actor_session_id != null
actor_effective = E1
attribution_source = DEVICE_ACTOR_SESSION
```

##### Caso B — Dispositivo activo sin actor

```text
device_status = ACTIVE
actor_session_id = null
```

Resultado:

```text
actor_effective = UNRESOLVED
acciones empresariales = bloqueadas
operaciones técnicas explícitas = evaluables por contrato separado
```

##### Caso C — Sesión expirada

```text
resolved_at >= actor_session_expires_at
```

Resultado:

```text
actor_session_id = null
actor_session_expires_at = null
```

##### Caso D — Dos sesiones activas

```text
sesiones candidatas = 2
```

Resultado:

```text
actor_session_id = null
actor_effective = UNRESOLVED
structural_issue = sesión de actor ambigua
```

##### Caso E — App visible

```text
allowed_application_codes = ["nexo", "shell"]
app solicitada = "nexo"
```

Resultado:

```text
la evaluación puede continuar
```

No significa `ALLOW`.

##### Caso F — App no permitida

```text
app solicitada = "numera"
allowed_application_codes = ["nexo", "shell"]
```

Resultado:

```text
DENY
```

##### Caso G — Clave fuera del paquete

```text
actor posee permiso P
P no está en capability_package_code
```

Resultado:

```text
DENY desde el dispositivo
```

##### Caso H — Permiso `NOT_ALLOWED`

```text
P clasificado NOT_ALLOWED
```

Resultado:

```text
DENY
```

aunque aparezca por error en una instancia.

La instancia sería además inválida.

##### Caso I — Reautenticación fuerte faltante

```text
P = STRONG_REAUTH_REQUIRED
actor session estándar válida
sin evidencia fuerte
```

Resultado:

```text
DENY
```

##### Caso J — PIN ligero

```text
PIN correcto
```

Resultado:

```text
sesión de actor puede iniciarse
STRONG_REAUTH_REQUIRED no queda satisfecho
```

##### Caso K — Turno en otra sede

```text
dispositivo = VENTO_CAFE / CAJA
turno = SAUDO / COCINA
```

Resultado:

```text
el dispositivo no cambia el turno
contexto incompatible
DENY
```

##### Caso L — `navigation_role`

```text
navigation_role = bodeguero
actor operacional = produccion_reposteria
```

Resultado:

```text
navigation_role se ignora para autorización
```

##### Caso M — Dispositivo inactivo

```text
device_status = INACTIVE
```

Resultado:

```text
actor_session_id = null
acciones empresariales = bloqueadas
```

##### Caso N — Instancia amplía plantilla

```text
app de instancia no existe en plantilla
```

Resultado:

```text
device_status = INVALID
```

##### Caso O — Sesión válida sin check-in

```text
actor session válida
active_shift válido
active_checkin_session = null
```

Resultado:

```text
permiso T puede continuar
permiso T+C no puede continuar
```

##### Caso P — Usuario humano en una tablet

```text
principal = HUMAN_USER
equipo físico compartido
```

Resultado:

```text
device_context = null
```

El contrato no clasifica el equipo por hardware observado.

---

#### 55. Inconsistencias estructurales detectables

AUTH-CTX-014 identifica las siguientes clases:

1. principal compartido sin dispositivo;
2. vínculo técnico ausente;
3. vínculo técnico ambiguo;
4. `device_id` incompatible;
5. código duplicado;
6. tipo desconocido;
7. dispositivo inactivo tratado como activo;
8. dispositivo revocado tratado como activo;
9. plantilla ausente;
10. versión de plantilla ausente;
11. versión no resoluble;
12. instancia amplía plantilla;
13. aplicación no canónica;
14. aplicación inactiva;
15. aplicación no incluida por plantilla;
16. wildcard de aplicación;
17. paquete desconocido;
18. paquete no versionado;
19. paquete amplía plantilla;
20. clave `NOT_ALLOWED` incluida;
21. wildcard de permiso;
22. `navigation_role` usado como autoridad;
23. sesión sin empleado;
24. sesión de otro dispositivo;
25. sesión futura;
26. sesión sin expiración;
27. sesión expirada presentada como vigente;
28. sesión cerrada presentada como vigente;
29. sesión reemplazada presentada como vigente;
30. varias sesiones activas;
31. actor efectivo distinto al empleado de sesión;
32. dispositivo usado como actor;
33. usuario técnico modelado como empleado;
34. último actor usado como fallback;
35. PIN tratado como reautenticación fuerte;
36. sesión de actor tratada como check-in;
37. sesión de actor tratada como turno;
38. sede del dispositivo usada para reemplazar turno;
39. área del dispositivo usada para completar turno;
40. aplicaciones visibles tratadas como permisos;
41. paquete tratado como grants del actor;
42. denegación ignorada por configuración del dispositivo;
43. actor anterior conservado después de cierre;
44. datos del actor anterior conservados después de cambio;
45. snapshot reutilizado después de expiración o revocación.

AUTH-CTX-015 deberá asignar:

- código definitivo;
- severidad;
- carril afectado;
- exposición;
- mensaje seguro;
- efecto sobre `lane_readiness`.

---

#### 56. Fail closed

Ante ausencia, contradicción o ambigüedad:

```text
ninguna acción empresarial
```

Reglas:

```text
dispositivo no resoluble
→ device_context = null
```

```text
dispositivo exacto pero deshabilitado
→ device_status = INACTIVE
```

```text
configuración contradictoria
→ device_status = INVALID
```

```text
sesión ausente o inválida
→ actor_session_id = null
→ actor empresarial no resoluble desde el dispositivo
```

Queda prohibido:

- usar último actor;
- usar empleado de la sede;
- usar rol de navegación;
- usar perfil;
- usar usuario técnico como empleado;
- elegir primera sesión;
- ignorar expiración;
- permitir una app por estar instalada;
- permitir una clave por estar en el actor;
- permitir una clave por prefijo;
- tratar paquete nulo como ilimitado;
- tratar ausencia de heartbeat como actor inválido;
- tratar PIN como MFA fuerte;
- unir territorios;
- omitir denegaciones.

---

#### 57. Minimización de datos

`device_context` no deberá incluir:

- email técnico;
- token;
- JWT;
- PIN;
- hash de PIN;
- QR secreto;
- serial sensible;
- IP;
- MAC;
- ubicación física detallada;
- coordenadas;
- nombre del trabajador;
- rol base;
- rol operativo;
- turno;
- check-in;
- permisos completos;
- lista expandida de claves;
- políticas internas;
- evidencia fuerte;
- historial de sesiones;
- actor anterior;
- telemetría completa.

El contrato conserva únicamente los campos publicados.

---

#### 58. Relación con tareas posteriores

##### AUTH-CTX-015

Congelará códigos, severidades y efecto sobre `lane_readiness`.

##### AUTH-CTX-016

Definirá la aplicación solicitada y exigirá pertenencia a
`allowed_application_codes`.

##### AUTH-CTX-017

Definirá compatibilidad de dispositivo, sesión estándar y reautenticación
fuerte para el permiso solicitado.

##### AUTH-CTX-018

Resolverá el recurso y permitirá comparar restricciones territoriales o de
recurso del dispositivo.

##### AUTH-CTX-019

Evaluará el carril base bajo el filtro restrictivo del dispositivo.

##### AUTH-CTX-020

Evaluará el carril operativo bajo el mismo filtro.

##### AUTH-CTX-021

Registrará los allows coincidentes del actor; el paquete no se registrará como
allow.

##### AUTH-CTX-022

Aplicará denegaciones sin permitir que el dispositivo las neutralice.

##### AUTH-CTX-023

Producirá la decisión final y razones de bloqueo del dispositivo.

##### AUTH-CTX-024

Definirá auditoría con `device_id`, actor, sesión, paquete, aplicación,
contexto y decisión.

##### AUTH-CTX-025

Diseñará el contrato SQL de `get_access_context`, incluyendo:

- resolución técnica del dispositivo;
- estado;
- plantilla versionada;
- instancia restrictiva;
- sesión única;
- expiración;
- apps efectivas;
- paquete efectivo;
- fail closed.

##### AUTH-CTX-026

Diseñará el evaluador que aplica el dispositivo como intersección.

##### AUTH-CTX-027

Obligará a las aplicaciones a consumir el contexto centralizado y eliminar
lógica local basada en dispositivo, rutas o `navigation_role`.

##### AUTH-CTX-028

Diseñará compatibilidad con:

- tablas actuales de dispositivos;
- plantillas legacy;
- apps de plantilla e instancia;
- políticas legacy;
- `navigation_role`;
- usuarios técnicos;
- sesiones actuales;
- `same_site_active_worker`;
- ausencia de heartbeat;
- consumidores existentes.

##### AUTH-CTX-029

Definirá invalidación por cambios de dispositivo, plantilla, paquete y sesión.

##### AUTH-CTX-030

Definirá pruebas contractuales de:

- dispositivo válido;
- inactivo;
- inválido;
- sesión ausente;
- sesión activa;
- sesión expirada;
- sesiones duplicadas;
- cambio de trabajador;
- app permitida y no permitida;
- paquete permitido;
- `NOT_ALLOWED`;
- reautenticación fuerte;
- territorio incompatible;
- dispositivo revocado.

##### AUTH-DEV-001 a AUTH-DEV-016

Materializarán el roadmap específico de dispositivos compartidos:

- inventario;
- identidad;
- sede;
- área;
- aplicaciones;
- permisos máximos;
- PIN o firma;
- intersección actor-dispositivo;
- prevención de herencia administrativa;
- auditoría;
- revocación;
- expiración;
- cambio de trabajador;
- pruebas en NEXO, PULSO y FOGO.

##### BLOQUE E3

Definirá el modelo físico, relaciones, RLS, exposición, retención y
credenciales técnicas.

##### BLOQUE E4

Definirá eventos, heartbeat, sincronización, colas y evidencia.

##### BLOQUE E5

Convertirá las decisiones en paquetes implementables y plan de despliegue.

##### BLOQUE R

Implementará migraciones, funciones, sesiones, restricciones, limpieza,
pruebas, rollback y transición.

---

#### 59. Fuera del alcance

AUTH-CTX-014 no:

- crea dispositivos;
- crea plantillas;
- crea paquetes;
- define las 14 plantillas nuevamente;
- inventa permisos;
- modifica AUTH-RBAC-023;
- registra PIN;
- define proveedor de MFA;
- define duración numérica;
- implementa heartbeat;
- implementa launcher;
- crea sesiones físicas;
- define interfaz final;
- corrige las dos instancias actuales;
- retira plantillas legacy;
- modifica `navigation_role`;
- crea tablas;
- crea constraints;
- crea funciones SQL;
- crea RPC;
- crea RLS;
- crea migraciones;
- ejecuta backfills;
- modifica Supabase;
- modifica aplicaciones;
- decide autorización final.

Cada responsabilidad posterior tiene un destino explícito en la sección 58.

---

#### 60. Riesgos controlados

##### Riesgo 1 — Dispositivo técnico convertido en trabajador

Control:

```text
principal dispositivo
≠
actor empleado
```

##### Riesgo 2 — Último actor reutilizado

Control:

```text
sin sesión vigente
→ sin actor
```

##### Riesgo 3 — App visible concede acceso

Control:

```text
allowed_application_codes
≠
permisos
```

##### Riesgo 4 — Paquete concede permisos

Control:

```text
capability_package
=
techo restrictivo
```

##### Riesgo 5 — Instancia amplía plantilla

Control:

```text
instancia ⊆ plantilla versionada
```

##### Riesgo 6 — PIN satisface acción crítica

Control:

```text
PIN ligero
≠
STRONG_REAUTH_REQUIRED
```

##### Riesgo 7 — Dispositivo reemplaza territorio del turno

Control:

```text
intersección restrictiva
≠
reemplazo
```

##### Riesgo 8 — Cierre conserva datos y autoridad

Control:

```text
cambio o expiración
→ invalidación + limpieza
```

---

#### 61. Criterios de aprobación

AUTH-CTX-014 podrá aprobarse cuando se acepte que:

1. `device_context` conserva la forma de `AccessContext@1.0.0`;
2. la tarea es una aclaración normativa compatible;
3. solo se resuelve para principal `SHARED_DEVICE`;
4. una sesión personal produce `device_context = null`;
5. la identidad del dispositivo se resuelve en servidor;
6. el vínculo técnico debe ser único;
7. la credencial técnica no concede autoridad;
8. `device_id` identifica la instancia empresarial;
9. `device_code` no se interpreta para inferir contexto;
10. `device_type` no concede permisos;
11. `authenticated_as_device` exige vínculo técnico válido;
12. `ACTIVE` no significa actor activo;
13. `ACTIVE` no significa equipo en línea;
14. `INACTIVE` bloquea acciones empresariales;
15. `INVALID` representa contradicción de configuración;
16. la plantilla está versionada;
17. la instancia solo puede reducir;
18. una ampliación vuelve inválida la instancia;
19. la sesión de actor es distinta de login personal;
20. la sesión de actor es distinta de check-in;
21. la sesión de actor es distinta de turno;
22. solo existe un actor por dispositivo;
23. `actor_session_id` pertenece al mismo dispositivo;
24. la sesión debe vincular un empleado exacto;
25. la sesión debe tener expiración;
26. una sesión expirada no produce actor;
27. una sesión cerrada no produce actor;
28. varias sesiones producen `UNRESOLVED`;
29. el último actor nunca es fallback;
30. el dispositivo sigue siendo principal;
31. el empleado sigue siendo actor;
32. `device_id` nunca es `actor_id`;
33. la sesión debe coincidir con `actor_effective`;
34. un empleado inactivo no recupera autoridad;
35. PIN y QR no se exponen en el contexto;
36. PIN ligero no satisface reautenticación fuerte;
37. la reautenticación fuerte se evalúa por acción;
38. sin actor humano no se ejecutan acciones empresariales;
39. operaciones técnicas se mantienen separadas;
40. la sesión no crea check-in;
41. la sesión no selecciona turno;
42. el dispositivo restringe territorio por intersección;
43. el dispositivo no reemplaza sede ni área;
44. `allowed_application_codes` es techo de aplicaciones;
45. una app visible no concede permisos;
46. la lista es canónica, única y determinista;
47. una lista vacía no significa todas;
48. `capability_package_code` identifica un techo versionado;
49. el paquete usa claves exactas;
50. no existen wildcards;
51. paquete nulo no significa ilimitado;
52. `STANDARD_ACTOR_SESSION` requiere inclusión exacta;
53. `STRONG_REAUTH_REQUIRED` exige evidencia fuerte;
54. `NOT_ALLOWED` queda excluido universalmente;
55. permisos nuevos quedan denegados por defecto;
56. la decisión por acción es una intersección;
57. `navigation_role` no participa en autorización;
58. `same_site_active_worker` no es política final suficiente para bodega;
59. el cambio de trabajador termina y limpia la sesión anterior;
60. la expiración invalida contexto y datos del actor;
61. la revocación bloquea la instancia;
62. el carril base conserva todos sus requisitos;
63. el carril operativo conserva todos sus requisitos;
64. el dispositivo no elimina denegaciones;
65. la simulación no crea sesión real;
66. los procesos asíncronos conservan atribución;
67. AUTH-CTX-015 congelará problemas y readiness;
68. AUTH-CTX-016 a AUTH-CTX-024 aplicarán el filtro en la decisión;
69. AUTH-CTX-025 diseñará el productor SQL;
70. AUTH-CTX-026 diseñará el evaluador;
71. AUTH-CTX-027 eliminará lógica local;
72. AUTH-CTX-028 diseñará compatibilidad legacy;
73. AUTH-CTX-029 definirá invalidación;
74. AUTH-CTX-030 definirá pruebas contractuales;
75. AUTH-DEV-001 a AUTH-DEV-016 materializarán el roadmap específico;
76. E3, E4, E5 y BLOQUE R tienen responsabilidades explícitas;
77. no se implementa código, migraciones ni cambios en Supabase.

---

#### 62. Estado final de la propuesta

| Tarea        | Estado      | Relación                  |
| ------------ | ----------- | ------------------------- |
| AUTH-CTX-013 | APROBADA    | Tarea anterior            |
| AUTH-CTX-014 | APROBADA    | Tarea actual              |
| AUTH-CTX-015 | NO INICIADA | Tarea siguiente reservada |

La continuidad propuesta queda:

```text
AUTH-CTX-013 — APROBADA
        ↓
AUTH-CTX-014 — APROBADA
        ↓
AUTH-CTX-015 — NO INICIADA
```

No se avanza a AUTH-CTX-015 hasta recibir aprobación explícita de
AUTH-CTX-014.


### ✅ AUTH-CTX-015 — Incluir razones estructuradas de invalidez

**Estado:** APROBADA 
**Bloque:** BLOQUE E — Contexto y decisión de autorización unificados  
**Naturaleza:** Definición normativa de `lane_readiness` y `structural_issues` dentro de `AccessContext`  
**Implementación física:** No incluida  
**Tarea anterior vigente:** AUTH-CTX-014 — APROBADA  
**Tarea posterior reservada:** AUTH-CTX-016 — Incluir aplicación y permiso solicitado  
**Contrato afectado:** `AccessContext@1.0.0`  
**Nodos afectados:** `lane_readiness`, `structural_issues`  
**Catálogo congelado:** `100` códigos estructurales iniciales  
**Cambio contractual:** Aclaración normativa compatible; no cambia la forma publicada  
**Cambios físicos permitidos:** No

Esta tarea congela la semántica de invalidez estructural del contexto,
distinguiendo entre:

- ausencia normal;
- estado no aplicable;
- indisponibilidad temporal;
- contradicción estructural;
- bloqueo de todos los carriles;
- bloqueo exclusivo del carril base;
- bloqueo exclusivo del carril operativo;
- advertencia;
- información diagnóstica;
- denegación empresarial;
- falta de grant;
- incumplimiento de un prerrequisito del permiso;
- contexto obsoleto.

No modifica la estructura raíz de `AccessContext`, no agrega campos, no cambia
`contract_version`, no cambia `schema_version`, no implementa SQL, RPC, RLS,
migraciones, logs, alertas, paneles ni cambios físicos en Supabase.

---

#### 1. Objetivo

Definir de forma cerrada:

1. la forma y semántica de `LaneReadiness`;
2. la forma y semántica de `StructuralIssue`;
3. la diferencia entre `UNAVAILABLE` e `INVALID`;
4. la diferencia entre ausencia normal y contradicción;
5. la precedencia de severidades;
6. qué carril bloquea cada problema;
7. los códigos estructurales iniciales;
8. los tipos de sujeto permitidos;
9. las fuentes resolutoras permitidas;
10. las reglas de `safe_message`;
11. la deduplicación;
12. el orden determinista;
13. la supresión de errores derivados;
14. el tratamiento del check-in y área opcionales;
15. la relación con dispositivos compartidos;
16. la relación con `AuthorizationDecision`;
17. la relación con denegaciones explícitas;
18. la relación con caché e invalidación;
19. la evolución futura del catálogo;
20. la estrategia fail closed.

---

#### 2. Base normativa

AUTH-CTX-015 conserva sin cambios las decisiones aprobadas en:

- ADR-AUTH-001;
- AUTH-MOD-001 a AUTH-MOD-020;
- AUTH-CAT-001 a AUTH-CAT-024;
- AUTH-RBAC-001 a AUTH-RBAC-028;
- AUTH-CTX-001 — Diseñar `AccessContext`;
- AUTH-CTX-004 — Versionar contratos;
- AUTH-CTX-005 a AUTH-CTX-014 — Resolver todos los hechos internos del
  contexto.

Principios obligatorios:

```text
AUSENCIA NORMAL
≠
INCONSISTENCIA ESTRUCTURAL
```

```text
UNAVAILABLE
≠
INVALID
```

```text
PROBLEMA ESTRUCTURAL
≠
DENEGACIÓN EXPLÍCITA
```

```text
LANE_READINESS
≠
DECISIÓN DEL PERMISO
```

```text
WARNING
≠
ALLOW
```

```text
INFO
≠
ALLOW
```

```text
CONTRADICCIÓN
→
NO FALLBACK
→
FAIL CLOSED
```

---

#### 3. Formas contractuales conservadas

```ts
type LaneReadiness = {
  status: "READY" | "UNAVAILABLE" | "INVALID" | "NOT_APPLICABLE";
  reason_codes: string[];
};
```

```ts
type StructuralIssue = {
  issue_code: string;
  severity:
    | "BLOCKING_ALL"
    | "BLOCKING_BASE"
    | "BLOCKING_OPERATIONAL"
    | "WARNING"
    | "INFO";

  subject_type: string;
  subject_id: string | null;
  source: string;
  safe_message: string;
};
```

Forma raíz conservada:

```ts
lane_readiness: {
  base: LaneReadiness;
  operational: LaneReadiness;
};

structural_issues: StructuralIssue[];
```

No se agregan propiedades.

---

#### 4. Responsabilidad de `lane_readiness`

`lane_readiness` responde:

```text
¿Existen hechos estructurales suficientes y coherentes
para que este carril pueda ser evaluado?
```

No responde:

```text
¿Existe un grant?
¿El permiso admite este carril?
¿El recurso está dentro del alcance?
¿Existe una denegación?
¿La decisión final es ALLOW?
```

Esas preguntas pertenecen a AUTH-CTX-016 a AUTH-CTX-023.

---

#### 5. Semántica de los estados

##### 5.1 `READY`

El núcleo estructural del carril es coherente y puede participar en una
evaluación posterior.

No significa que el permiso será autorizado.

##### 5.2 `UNAVAILABLE`

El carril no puede utilizarse en el snapshot actual por una ausencia o estado
válido y esperado.

Ejemplos:

- dispositivo compartido activo sin sesión de actor;
- empleado inactivo conocido;
- ausencia de turno vigente;
- ausencia de check-in cuando todavía no se conoce si el permiso lo exige;
- ausencia legítima de área para un rol site-wide.

`UNAVAILABLE` no se utiliza para ocultar contradicciones.

##### 5.3 `INVALID`

Existe al menos un problema con severidad aplicable:

- `BLOCKING_ALL`;
- `BLOCKING_BASE`;
- `BLOCKING_OPERATIONAL`.

El carril no podrá participar en una decisión positiva.

##### 5.4 `NOT_APPLICABLE`

El carril no pertenece al tipo de actor resuelto.

Ejemplos:

- cliente;
- identidad de dominio no laboral;
- proceso `SYSTEM` autónomo;
- dispositivo técnico sin operación empresarial humana.

No significa denegación ni error.

---

#### 6. Responsabilidad de `structural_issues`

`structural_issues` registra contradicciones, ambigüedades y violaciones del
contrato de resolución.

No deberá contener:

- falta normal de turno;
- falta normal de check-in;
- falta normal de área opcional;
- ausencia de grant;
- permiso no aplicable;
- recurso fuera de alcance;
- denegación individual;
- denegación transversal;
- fallo de reautenticación de una acción concreta;
- mensajes de interfaz;
- excepciones internas;
- stack traces;
- texto SQL.

---

#### 7. Semántica de severidades

| Severidad              | Efecto                                                                        |
| ---------------------- | ----------------------------------------------------------------------------- |
| `BLOCKING_ALL`         | Ambos carriles quedan `INVALID`                                               |
| `BLOCKING_BASE`        | El carril base queda `INVALID`; el operativo se evalúa de forma independiente |
| `BLOCKING_OPERATIONAL` | El carril operativo queda `INVALID`; el base se evalúa de forma independiente |
| `WARNING`              | No cambia por sí sola el estado; exige evidencia o seguimiento                |
| `INFO`                 | No cambia el estado; aporta contexto diagnóstico seguro                       |

Precedencia:

```text
BLOCKING_ALL
>
BLOCKING_BASE / BLOCKING_OPERATIONAL
>
WARNING
>
INFO
```

`BLOCKING_BASE` y `BLOCKING_OPERATIONAL` no tienen precedencia entre sí porque
afectan carriles distintos.

---

#### 8. Tipos de sujeto permitidos

```text
PRINCIPAL
DOMAIN_IDENTITY
ACTOR
EMPLOYEE
BASE_ROLE
SITE_ASSIGNMENT
AREA_ASSIGNMENT
ADMINISTRATIVE_COVERAGE
SHIFT
CHECKIN_SESSION
OPERATIONAL_ROLE
OPERATIONAL_SITE
OPERATIONAL_AREA
DEVICE
DEVICE_ACTOR_SESSION
CONFIGURATION
CONTEXT
```

No se utilizarán nombres de tablas como `subject_type`.

---

#### 9. Fuentes resolutoras permitidas

```text
PRINCIPAL_RESOLVER
DOMAIN_IDENTITY_RESOLVER
ACTOR_RESOLVER
EMPLOYEE_RESOLVER
BASE_ROLE_RESOLVER
ASSIGNMENT_RESOLVER
ADMINISTRATIVE_COVERAGE_RESOLVER
SHIFT_RESOLVER
CHECKIN_RESOLVER
OPERATIONAL_ROLE_RESOLVER
OPERATIONAL_TERRITORY_RESOLVER
DEVICE_RESOLVER
DEVICE_SESSION_RESOLVER
CONTEXT_VALIDATOR
FRESHNESS_RESOLVER
```

Cada código tiene una fuente propietaria.

Un consumidor posterior no deberá duplicar el mismo problema con otra fuente.

---

#### 10. Convención de códigos

Todos los códigos:

- usan `UPPER_SNAKE_CASE`;
- son estables;
- no contienen identificadores;
- no contienen nombres de tablas;
- no contienen nombres de personas;
- no se construyen dinámicamente;
- no se traducen;
- no se reutilizan con otra semántica;
- no se inventan dentro de aplicaciones.

Un código nuevo exige:

1. análisis documental;
2. clasificación de severidad;
3. sujeto;
4. fuente propietaria;
5. mensaje seguro;
6. impacto sobre carriles;
7. pruebas en AUTH-CTX-030;
8. implementación física mediante BLOQUE R.

---

#### 11. Catálogo estructural inicial

El catálogo inicial queda congelado con `100` códigos.

##### Autenticación, principal, identidad y actor

| `issue_code`                 | Severidad      | `subject_type`    | `source`                   | `safe_message`                                                                   |
| ---------------------------- | -------------- | ----------------- | -------------------------- | -------------------------------------------------------------------------------- |
| `AUTH_UNAUTHENTICATED`       | `BLOCKING_ALL` | `PRINCIPAL`       | `PRINCIPAL_RESOLVER`       | No existe una autenticación válida para resolver el contexto.                    |
| `PRINCIPAL_NOT_LINKED`       | `BLOCKING_ALL` | `PRINCIPAL`       | `PRINCIPAL_RESOLVER`       | La identidad autenticada no está vinculada con una identidad empresarial válida. |
| `PRINCIPAL_AMBIGUOUS`        | `BLOCKING_ALL` | `PRINCIPAL`       | `PRINCIPAL_RESOLVER`       | La identidad autenticada corresponde a más de un principal empresarial.          |
| `PRINCIPAL_INACTIVE`         | `BLOCKING_ALL` | `PRINCIPAL`       | `PRINCIPAL_RESOLVER`       | El principal autenticado no está activo.                                         |
| `PRINCIPAL_TYPE_INVALID`     | `BLOCKING_ALL` | `PRINCIPAL`       | `PRINCIPAL_RESOLVER`       | El tipo de principal autenticado no es válido.                                   |
| `PRINCIPAL_SUBJECT_MISMATCH` | `BLOCKING_ALL` | `PRINCIPAL`       | `PRINCIPAL_RESOLVER`       | La credencial autenticada no coincide con el principal empresarial resuelto.     |
| `DOMAIN_IDENTITY_AMBIGUOUS`  | `BLOCKING_ALL` | `DOMAIN_IDENTITY` | `DOMAIN_IDENTITY_RESOLVER` | La identidad de dominio no puede resolverse de forma única.                      |
| `DOMAIN_IDENTITY_INACTIVE`   | `BLOCKING_ALL` | `DOMAIN_IDENTITY` | `DOMAIN_IDENTITY_RESOLVER` | La identidad de dominio resuelta no está activa.                                 |
| `ACTOR_TYPE_INVALID`         | `BLOCKING_ALL` | `ACTOR`           | `ACTOR_RESOLVER`           | El tipo de actor efectivo no es válido.                                          |
| `ACTOR_ATTRIBUTION_INVALID`  | `BLOCKING_ALL` | `ACTOR`           | `ACTOR_RESOLVER`           | La fuente de atribución del actor efectivo no es válida.                         |
| `ACTOR_PRINCIPAL_MISMATCH`   | `BLOCKING_ALL` | `ACTOR`           | `ACTOR_RESOLVER`           | El actor efectivo no es compatible con el principal autenticado.                 |
| `DELEGATION_INVALID`         | `BLOCKING_ALL` | `ACTOR`           | `ACTOR_RESOLVER`           | La delegación utilizada para resolver el actor no es válida.                     |

##### Identidad laboral y rol base

| `issue_code`                | Severidad       | `subject_type` | `source`             | `safe_message`                                                      |
| --------------------------- | --------------- | -------------- | -------------------- | ------------------------------------------------------------------- |
| `EMPLOYEE_MISSING`          | `BLOCKING_ALL`  | `EMPLOYEE`     | `EMPLOYEE_RESOLVER`  | No fue posible resolver el trabajador requerido para este contexto. |
| `EMPLOYEE_AMBIGUOUS`        | `BLOCKING_ALL`  | `EMPLOYEE`     | `EMPLOYEE_RESOLVER`  | La identidad laboral corresponde a más de un trabajador.            |
| `EMPLOYEE_ACTOR_MISMATCH`   | `BLOCKING_ALL`  | `EMPLOYEE`     | `EMPLOYEE_RESOLVER`  | El trabajador resuelto no coincide con el actor efectivo.           |
| `EMPLOYEE_STATUS_INVALID`   | `BLOCKING_ALL`  | `EMPLOYEE`     | `EMPLOYEE_RESOLVER`  | El estado laboral del trabajador no es reconocido.                  |
| `BASE_ROLE_MISSING`         | `BLOCKING_BASE` | `BASE_ROLE`    | `BASE_ROLE_RESOLVER` | El trabajador activo no tiene un rol base resoluble.                |
| `BASE_ROLE_AMBIGUOUS`       | `BLOCKING_BASE` | `BASE_ROLE`    | `BASE_ROLE_RESOLVER` | Existe más de un rol base vigente para el trabajador.               |
| `BASE_ROLE_UNKNOWN`         | `BLOCKING_BASE` | `BASE_ROLE`    | `BASE_ROLE_RESOLVER` | El rol base asignado no existe en el catálogo canónico.             |
| `BASE_ROLE_INACTIVE`        | `BLOCKING_BASE` | `BASE_ROLE`    | `BASE_ROLE_RESOLVER` | El rol base asignado no está activo.                                |
| `BASE_ROLE_ACTOR_MISMATCH`  | `BLOCKING_BASE` | `BASE_ROLE`    | `BASE_ROLE_RESOLVER` | El rol base resuelto no pertenece al trabajador efectivo.           |
| `BASE_ROLE_LEGACY_UNMAPPED` | `BLOCKING_BASE` | `BASE_ROLE`    | `BASE_ROLE_RESOLVER` | El rol base heredado no tiene una equivalencia canónica aprobada.   |

##### Asignaciones y cobertura administrativa

| `issue_code`                         | Severidad       | `subject_type`            | `source`                           | `safe_message`                                                               |
| ------------------------------------ | --------------- | ------------------------- | ---------------------------------- | ---------------------------------------------------------------------------- |
| `SITE_ASSIGNMENT_DUPLICATE_CONFLICT` | `BLOCKING_BASE` | `SITE_ASSIGNMENT`         | `ASSIGNMENT_RESOLVER`              | Existen asignaciones de sede duplicadas con información contradictoria.      |
| `SITE_ASSIGNMENT_MULTIPLE_PRIMARY`   | `BLOCKING_BASE` | `SITE_ASSIGNMENT`         | `ASSIGNMENT_RESOLVER`              | Existe más de una sede primaria vigente para el trabajador.                  |
| `SITE_ASSIGNMENT_UNKNOWN_SITE`       | `BLOCKING_BASE` | `SITE_ASSIGNMENT`         | `ASSIGNMENT_RESOLVER`              | Una asignación laboral referencia una sede inexistente.                      |
| `AREA_ASSIGNMENT_DUPLICATE_CONFLICT` | `BLOCKING_BASE` | `AREA_ASSIGNMENT`         | `ASSIGNMENT_RESOLVER`              | Existen asignaciones de área duplicadas con información contradictoria.      |
| `AREA_ASSIGNMENT_MULTIPLE_PRIMARY`   | `BLOCKING_BASE` | `AREA_ASSIGNMENT`         | `ASSIGNMENT_RESOLVER`              | Existe más de un área primaria vigente para la misma sede.                   |
| `AREA_ASSIGNMENT_UNKNOWN_AREA`       | `BLOCKING_BASE` | `AREA_ASSIGNMENT`         | `ASSIGNMENT_RESOLVER`              | Una asignación laboral referencia un área inexistente.                       |
| `AREA_ASSIGNMENT_SITE_MISMATCH`      | `BLOCKING_BASE` | `AREA_ASSIGNMENT`         | `ASSIGNMENT_RESOLVER`              | El área asignada no pertenece a la sede declarada.                           |
| `ADMIN_COVERAGE_MODE_INVALID`        | `BLOCKING_BASE` | `ADMINISTRATIVE_COVERAGE` | `ADMINISTRATIVE_COVERAGE_RESOLVER` | El modo de cobertura administrativa no es reconocido.                        |
| `ADMIN_COVERAGE_SOURCE_INVALID`      | `BLOCKING_BASE` | `ADMINISTRATIVE_COVERAGE` | `ADMINISTRATIVE_COVERAGE_RESOLVER` | La fuente de cobertura administrativa no es válida.                          |
| `ADMIN_COVERAGE_SHAPE_INVALID`       | `BLOCKING_BASE` | `ADMINISTRATIVE_COVERAGE` | `ADMINISTRATIVE_COVERAGE_RESOLVER` | Los identificadores de cobertura no corresponden con el modo declarado.      |
| `ADMIN_COVERAGE_EXPANDS_ROLE`        | `BLOCKING_BASE` | `ADMINISTRATIVE_COVERAGE` | `ADMINISTRATIVE_COVERAGE_RESOLVER` | La cobertura administrativa amplía indebidamente el alcance natural del rol. |
| `ADMIN_COVERAGE_NONDETERMINISTIC`    | `BLOCKING_BASE` | `ADMINISTRATIVE_COVERAGE` | `ADMINISTRATIVE_COVERAGE_RESOLVER` | La cobertura administrativa no puede reproducirse de forma determinista.     |

##### Turno publicado y vigente

| `issue_code`                     | Severidad              | `subject_type` | `source`         | `safe_message`                                                      |
| -------------------------------- | ---------------------- | -------------- | ---------------- | ------------------------------------------------------------------- |
| `SHIFT_REVISION_AMBIGUOUS`       | `BLOCKING_OPERATIONAL` | `SHIFT`        | `SHIFT_RESOLVER` | Existe más de una revisión publicada autoritativa para el turno.    |
| `SHIFT_UNPUBLISHED_SELECTED`     | `BLOCKING_OPERATIONAL` | `SHIFT`        | `SHIFT_RESOLVER` | Se intentó utilizar una revisión de turno no publicada.             |
| `SHIFT_KIND_INVALID`             | `BLOCKING_OPERATIONAL` | `SHIFT`        | `SHIFT_RESOLVER` | El tipo de turno no es compatible con una jornada operativa.        |
| `SHIFT_TIME_RANGE_INVALID`       | `BLOCKING_OPERATIONAL` | `SHIFT`        | `SHIFT_RESOLVER` | El intervalo temporal del turno no es válido.                       |
| `SHIFT_TIMEZONE_INVALID`         | `BLOCKING_OPERATIONAL` | `SHIFT`        | `SHIFT_RESOLVER` | La zona horaria necesaria para resolver el turno no es válida.      |
| `SHIFT_EMPLOYEE_MISMATCH`        | `BLOCKING_OPERATIONAL` | `SHIFT`        | `SHIFT_RESOLVER` | El turno no pertenece al trabajador efectivo.                       |
| `SHIFT_SITE_INVALID`             | `BLOCKING_OPERATIONAL` | `SHIFT`        | `SHIFT_RESOLVER` | La sede declarada por el turno no es válida.                        |
| `SHIFT_AREA_SITE_MISMATCH`       | `BLOCKING_OPERATIONAL` | `SHIFT`        | `SHIFT_RESOLVER` | El área declarada por el turno no pertenece a su sede.              |
| `SHIFT_OPERATIONAL_ROLE_MISSING` | `BLOCKING_OPERATIONAL` | `SHIFT`        | `SHIFT_RESOLVER` | El turno vigente no contiene un rol operativo resoluble.            |
| `SHIFT_STATUS_INVALID`           | `BLOCKING_OPERATIONAL` | `SHIFT`        | `SHIFT_RESOLVER` | El estado del turno no permite tratarlo como vigente.               |
| `SHIFT_OVERLAP`                  | `BLOCKING_OPERATIONAL` | `SHIFT`        | `SHIFT_RESOLVER` | Existe más de un turno vigente candidato para el trabajador.        |
| `SHIFT_FIELDS_MIXED_REVISIONS`   | `BLOCKING_OPERATIONAL` | `SHIFT`        | `SHIFT_RESOLVER` | El turno fue construido combinando campos de revisiones diferentes. |
| `SHIFT_CLIENT_SELECTED`          | `BLOCKING_OPERATIONAL` | `SHIFT`        | `SHIFT_RESOLVER` | El turno fue seleccionado desde una fuente no autoritativa.         |

##### Sesión de check-in

| `issue_code`                        | Severidad              | `subject_type`    | `source`           | `safe_message`                                                        |
| ----------------------------------- | ---------------------- | ----------------- | ------------------ | --------------------------------------------------------------------- |
| `CHECKIN_UNCONFIRMED_AS_ACTIVE`     | `BLOCKING_OPERATIONAL` | `CHECKIN_SESSION` | `CHECKIN_RESOLVER` | Un evento no confirmado fue presentado como check-in activo.          |
| `CHECKIN_SESSION_ID_MISSING`        | `BLOCKING_OPERATIONAL` | `CHECKIN_SESSION` | `CHECKIN_RESOLVER` | La sesión de check-in no tiene un identificador canónico.             |
| `CHECKIN_ACTOR_MISMATCH`            | `BLOCKING_OPERATIONAL` | `CHECKIN_SESSION` | `CHECKIN_RESOLVER` | La sesión de check-in pertenece a otro trabajador.                    |
| `CHECKIN_SHIFT_MISMATCH`            | `BLOCKING_OPERATIONAL` | `CHECKIN_SESSION` | `CHECKIN_RESOLVER` | La sesión de check-in no corresponde al turno vigente.                |
| `CHECKIN_SITE_MISMATCH`             | `BLOCKING_OPERATIONAL` | `CHECKIN_SESSION` | `CHECKIN_RESOLVER` | La sede de la sesión de check-in no coincide con la sede del turno.   |
| `CHECKIN_AREA_MISMATCH`             | `BLOCKING_OPERATIONAL` | `CHECKIN_SESSION` | `CHECKIN_RESOLVER` | El área de la sesión de check-in no coincide con el área del turno.   |
| `CHECKIN_TIME_INVALID`              | `BLOCKING_OPERATIONAL` | `CHECKIN_SESSION` | `CHECKIN_RESOLVER` | La secuencia temporal de la sesión de check-in no es válida.          |
| `CHECKIN_SESSION_AMBIGUOUS`         | `BLOCKING_OPERATIONAL` | `CHECKIN_SESSION` | `CHECKIN_RESOLVER` | Existe más de una sesión de check-in activa candidata.                |
| `CHECKIN_EXPIRED_AS_ACTIVE`         | `BLOCKING_OPERATIONAL` | `CHECKIN_SESSION` | `CHECKIN_RESOLVER` | Una sesión expirada fue presentada como activa.                       |
| `CHECKIN_CLOSED_AS_ACTIVE`          | `BLOCKING_OPERATIONAL` | `CHECKIN_SESSION` | `CHECKIN_RESOLVER` | Una sesión cerrada fue presentada como activa.                        |
| `CHECKIN_OUTLIVES_SHIFT`            | `BLOCKING_OPERATIONAL` | `CHECKIN_SESSION` | `CHECKIN_RESOLVER` | La sesión de check-in permanece activa después del fin del turno.     |
| `CHECKIN_TERMINAL_LINK_INVALID`     | `BLOCKING_OPERATIONAL` | `CHECKIN_SESSION` | `CHECKIN_RESOLVER` | El evento terminal no está vinculado con la sesión correcta.          |
| `CHECKIN_OFFLINE_PENDING_AS_ACTIVE` | `BLOCKING_OPERATIONAL` | `CHECKIN_SESSION` | `CHECKIN_RESOLVER` | Una marcación pendiente de sincronización fue presentada como activa. |

##### Rol y territorio operativos

| `issue_code`                              | Severidad              | `subject_type`     | `source`                         | `safe_message`                                                               |
| ----------------------------------------- | ---------------------- | ------------------ | -------------------------------- | ---------------------------------------------------------------------------- |
| `OPERATIONAL_ROLE_UNKNOWN`                | `BLOCKING_OPERATIONAL` | `OPERATIONAL_ROLE` | `OPERATIONAL_ROLE_RESOLVER`      | El rol operativo del turno no existe en el catálogo canónico.                |
| `OPERATIONAL_ROLE_INACTIVE`               | `BLOCKING_OPERATIONAL` | `OPERATIONAL_ROLE` | `OPERATIONAL_ROLE_RESOLVER`      | El rol operativo del turno no está activo.                                   |
| `OPERATIONAL_ROLE_DEPRECATED`             | `BLOCKING_OPERATIONAL` | `OPERATIONAL_ROLE` | `OPERATIONAL_ROLE_RESOLVER`      | El rol operativo del turno está deprecado.                                   |
| `OPERATIONAL_ROLE_SHIFT_MISMATCH`         | `BLOCKING_OPERATIONAL` | `OPERATIONAL_ROLE` | `OPERATIONAL_ROLE_RESOLVER`      | El rol operativo resuelto no coincide con el turno vigente.                  |
| `OPERATIONAL_ROLE_SITE_NOT_ENABLED`       | `BLOCKING_OPERATIONAL` | `OPERATIONAL_ROLE` | `OPERATIONAL_ROLE_RESOLVER`      | El rol operativo no está habilitado en la sede del turno.                    |
| `OPERATIONAL_ROLE_AREA_NOT_ENABLED`       | `BLOCKING_OPERATIONAL` | `OPERATIONAL_ROLE` | `OPERATIONAL_ROLE_RESOLVER`      | El rol operativo no está habilitado en el área del turno.                    |
| `OPERATIONAL_ROLE_AREA_REQUIRED`          | `BLOCKING_OPERATIONAL` | `OPERATIONAL_ROLE` | `OPERATIONAL_ROLE_RESOLVER`      | El rol operativo requiere un área que no fue definida en el turno.           |
| `OPERATIONAL_ROLE_CONFIGURATION_CONFLICT` | `BLOCKING_OPERATIONAL` | `OPERATIONAL_ROLE` | `OPERATIONAL_ROLE_RESOLVER`      | La configuración territorial del rol operativo es contradictoria.            |
| `OPERATIONAL_SITE_UNKNOWN`                | `BLOCKING_OPERATIONAL` | `OPERATIONAL_SITE` | `OPERATIONAL_TERRITORY_RESOLVER` | La sede operativa no existe en el catálogo canónico.                         |
| `OPERATIONAL_SITE_INACTIVE`               | `BLOCKING_OPERATIONAL` | `OPERATIONAL_SITE` | `OPERATIONAL_TERRITORY_RESOLVER` | La sede operativa no está activa.                                            |
| `OPERATIONAL_SITE_ASSIGNMENT_INVALID`     | `BLOCKING_OPERATIONAL` | `OPERATIONAL_SITE` | `OPERATIONAL_TERRITORY_RESOLVER` | El trabajador no tiene una asignación laboral válida para la sede del turno. |
| `OPERATIONAL_SITE_SOURCE_MISMATCH`        | `BLOCKING_OPERATIONAL` | `OPERATIONAL_SITE` | `OPERATIONAL_TERRITORY_RESOLVER` | La sede operativa no procede del turno vigente.                              |
| `OPERATIONAL_AREA_UNKNOWN`                | `BLOCKING_OPERATIONAL` | `OPERATIONAL_AREA` | `OPERATIONAL_TERRITORY_RESOLVER` | El área operativa no existe en el catálogo canónico.                         |
| `OPERATIONAL_AREA_INACTIVE`               | `BLOCKING_OPERATIONAL` | `OPERATIONAL_AREA` | `OPERATIONAL_TERRITORY_RESOLVER` | El área operativa no está activa.                                            |
| `OPERATIONAL_AREA_SITE_MISMATCH`          | `BLOCKING_OPERATIONAL` | `OPERATIONAL_AREA` | `OPERATIONAL_TERRITORY_RESOLVER` | El área operativa no pertenece a la sede del turno.                          |
| `OPERATIONAL_AREA_ROLE_MISMATCH`          | `BLOCKING_OPERATIONAL` | `OPERATIONAL_AREA` | `OPERATIONAL_TERRITORY_RESOLVER` | El área operativa no es compatible con el rol operativo.                     |
| `OPERATIONAL_AREA_SOURCE_INVALID`         | `BLOCKING_OPERATIONAL` | `OPERATIONAL_AREA` | `OPERATIONAL_TERRITORY_RESOLVER` | La fuente declarada para el área operativa no es válida.                     |

##### Dispositivo compartido

| `issue_code`                               | Severidad      | `subject_type`         | `source`                  | `safe_message`                                                                     |
| ------------------------------------------ | -------------- | ---------------------- | ------------------------- | ---------------------------------------------------------------------------------- |
| `DEVICE_UNRESOLVED`                        | `BLOCKING_ALL` | `DEVICE`               | `DEVICE_RESOLVER`         | No fue posible resolver el dispositivo empresarial autenticado.                    |
| `DEVICE_AUTH_LINK_INVALID`                 | `BLOCKING_ALL` | `DEVICE`               | `DEVICE_RESOLVER`         | La credencial técnica no está vinculada de forma válida con el dispositivo.        |
| `DEVICE_INACTIVE`                          | `BLOCKING_ALL` | `DEVICE`               | `DEVICE_RESOLVER`         | El dispositivo compartido no está activo.                                          |
| `DEVICE_CONFIGURATION_INVALID`             | `BLOCKING_ALL` | `DEVICE`               | `DEVICE_RESOLVER`         | La configuración efectiva del dispositivo no es válida.                            |
| `DEVICE_TEMPLATE_INVALID`                  | `BLOCKING_ALL` | `DEVICE`               | `DEVICE_RESOLVER`         | La plantilla o su versión no pueden resolverse.                                    |
| `DEVICE_INSTANCE_EXPANDS_TEMPLATE`         | `BLOCKING_ALL` | `DEVICE`               | `DEVICE_RESOLVER`         | La instancia intenta ampliar los límites definidos por su plantilla.               |
| `DEVICE_ACTOR_SESSION_AMBIGUOUS`           | `BLOCKING_ALL` | `DEVICE_ACTOR_SESSION` | `DEVICE_SESSION_RESOLVER` | Existe más de una sesión de actor vigente para el dispositivo.                     |
| `DEVICE_ACTOR_SESSION_EXPIRED_AS_ACTIVE`   | `BLOCKING_ALL` | `DEVICE_ACTOR_SESSION` | `DEVICE_SESSION_RESOLVER` | Una sesión de actor expirada fue presentada como vigente.                          |
| `DEVICE_ACTOR_MISMATCH`                    | `BLOCKING_ALL` | `DEVICE_ACTOR_SESSION` | `DEVICE_SESSION_RESOLVER` | El actor efectivo no coincide con el trabajador de la sesión del dispositivo.      |
| `DEVICE_APPLICATION_CONFIGURATION_INVALID` | `BLOCKING_ALL` | `DEVICE`               | `DEVICE_RESOLVER`         | La lista de aplicaciones del dispositivo contiene una ampliación o valor inválido. |
| `DEVICE_CAPABILITY_PACKAGE_INVALID`        | `BLOCKING_ALL` | `DEVICE`               | `DEVICE_RESOLVER`         | El paquete de capacidades del dispositivo no es válido.                            |
| `DEVICE_NOT_ALLOWED_PERMISSION_CONFIGURED` | `BLOCKING_ALL` | `DEVICE`               | `DEVICE_RESOLVER`         | El dispositivo incluye una capacidad prohibida para terminales compartidos.        |
| `DEVICE_TERRITORY_MISMATCH`                | `BLOCKING_ALL` | `DEVICE`               | `DEVICE_RESOLVER`         | El territorio del dispositivo no es compatible con el contexto del actor.          |
| `DEVICE_NAVIGATION_ROLE_USED_AS_AUTHORITY` | `BLOCKING_ALL` | `DEVICE`               | `DEVICE_RESOLVER`         | Se intentó utilizar el rol de navegación como fuente de autorización.              |

##### Configuración, contrato y frescura

| `issue_code`                        | Severidad      | `subject_type`  | `source`             | `safe_message`                                                          |
| ----------------------------------- | -------------- | --------------- | -------------------- | ----------------------------------------------------------------------- |
| `STRUCTURAL_ISSUE_CODE_UNKNOWN`     | `BLOCKING_ALL` | `CONFIGURATION` | `CONTEXT_VALIDATOR`  | El contexto contiene un código estructural no reconocido.               |
| `STRUCTURAL_ISSUE_METADATA_INVALID` | `BLOCKING_ALL` | `CONFIGURATION` | `CONTEXT_VALIDATOR`  | Los metadatos de un problema estructural no coinciden con el catálogo.  |
| `RESOLVER_CONFIGURATION_MISSING`    | `BLOCKING_ALL` | `CONFIGURATION` | `CONTEXT_VALIDATOR`  | Falta una configuración obligatoria para resolver el contexto.          |
| `RESOLVER_CONFIGURATION_AMBIGUOUS`  | `BLOCKING_ALL` | `CONFIGURATION` | `CONTEXT_VALIDATOR`  | Existe más de una configuración autoritativa para resolver el contexto. |
| `CONTRACT_VERSION_UNSUPPORTED`      | `BLOCKING_ALL` | `CONTEXT`       | `CONTEXT_VALIDATOR`  | La versión contractual del contexto no es compatible con el consumidor. |
| `SCHEMA_VERSION_UNSUPPORTED`        | `BLOCKING_ALL` | `CONTEXT`       | `CONTEXT_VALIDATOR`  | La versión de esquema del contexto no es compatible con el consumidor.  |
| `RESOLUTION_TIME_INVALID`           | `BLOCKING_ALL` | `CONTEXT`       | `CONTEXT_VALIDATOR`  | El instante de resolución del contexto no es válido.                    |
| `CONTEXT_SNAPSHOT_MIXED`            | `BLOCKING_ALL` | `CONTEXT`       | `CONTEXT_VALIDATOR`  | El contexto combina hechos obtenidos de snapshots diferentes.           |
| `CONTEXT_STALE`                     | `BLOCKING_ALL` | `CONTEXT`       | `FRESHNESS_RESOLVER` | El contexto quedó obsoleto y debe resolverse nuevamente.                |

---

#### 12. Ausencias normales y códigos de disponibilidad

Las ausencias normales no producen `StructuralIssue`.

Pueden aparecer únicamente en `LaneReadiness.reason_codes`.

Catálogo inicial:

| Código                                  | Uso                                                                  |
| --------------------------------------- | -------------------------------------------------------------------- |
| `NON_LABOR_ACTOR`                       | El carril no aplica al tipo de actor                                 |
| `DEVICE_ACTOR_SESSION_NOT_AVAILABLE`    | El dispositivo está válido pero no existe sesión humana vigente      |
| `EMPLOYEE_INACTIVE`                     | El trabajador está identificado pero no puede ejercer autoridad      |
| `NO_ACTIVE_SHIFT`                       | No existe turno publicado y vigente                                  |
| `NO_ACTIVE_CHECKIN`                     | No existe sesión de check-in activa                                  |
| `NO_OPERATIONAL_AREA`                   | No existe área operativa y la ausencia puede ser legítima            |
| `BASE_ROLE_NOT_AVAILABLE`               | No existe rol base utilizable por un estado válido no contradictorio |
| `ADMINISTRATIVE_COVERAGE_NOT_AVAILABLE` | No existe cobertura territorial utilizable                           |
| `OPERATIONAL_ROLE_NOT_AVAILABLE`        | No existe rol operativo porque no existe turno                       |
| `OPERATIONAL_SITE_NOT_AVAILABLE`        | No existe sede operativa porque no existe turno                      |

Los códigos de disponibilidad:

- no se agregan a `structural_issues`;
- no sustituyen códigos bloqueantes;
- no convierten un estado contradictorio en `UNAVAILABLE`;
- pueden coexistir con `READY` únicamente cuando describen un prerrequisito
  opcional para permisos todavía desconocidos.

---

#### 13. Regla de carril base

Orden:

```text
1. aplicar BLOCKING_ALL
2. determinar si el actor es laboral
3. evaluar estado del empleado
4. aplicar BLOCKING_BASE
5. validar rol base
6. validar cobertura administrativa
7. producir estado
```

Matriz:

| Condición                            | Estado base      |
| ------------------------------------ | ---------------- |
| Existe `BLOCKING_ALL`                | `INVALID`        |
| Actor no laboral                     | `NOT_APPLICABLE` |
| Dispositivo válido sin sesión humana | `UNAVAILABLE`    |
| Empleado identificado pero inactivo  | `UNAVAILABLE`    |
| Existe `BLOCKING_BASE`               | `INVALID`        |
| Rol base y cobertura coherentes      | `READY`          |

Una cobertura válida con:

```text
mode = NONE
```

no vuelve inválido el carril base.

Puede seguir evaluando permisos no territoriales o grants con alcance propio.

---

#### 14. Regla de carril operativo

Orden:

```text
1. aplicar BLOCKING_ALL
2. determinar si el actor es laboral
3. evaluar estado del empleado
4. aplicar BLOCKING_OPERATIONAL
5. verificar active_shift
6. verificar operational_role
7. verificar operational_site
8. verificar área cuando el rol la exige
9. conservar disponibilidad de check-in y área
10. producir estado
```

Matriz:

| Condición                                 | Estado operativo                                    |
| ----------------------------------------- | --------------------------------------------------- |
| Existe `BLOCKING_ALL`                     | `INVALID`                                           |
| Actor no laboral                          | `NOT_APPLICABLE`                                    |
| Dispositivo válido sin sesión humana      | `UNAVAILABLE`                                       |
| Empleado identificado pero inactivo       | `UNAVAILABLE`                                       |
| Existe `BLOCKING_OPERATIONAL`             | `INVALID`                                           |
| No existe turno vigente sin contradicción | `UNAVAILABLE`                                       |
| Núcleo turno + rol + sede válido          | `READY`                                             |
| Falta check-in sin contradicción          | `READY` + `NO_ACTIVE_CHECKIN`                       |
| Falta área legítimamente                  | `READY` + `NO_OPERATIONAL_AREA`                     |
| Falta área requerida                      | `INVALID` mediante `OPERATIONAL_ROLE_AREA_REQUIRED` |

`READY + NO_ACTIVE_CHECKIN` significa:

```text
el núcleo operativo puede evaluar permisos T
pero no permisos T+C
```

No significa que un permiso `T+C` pueda autorizarse.

---

#### 15. Check-in cerrado o expirado

Una sesión correctamente cerrada o expirada no produce un problema
estructural.

Resultado normal:

```text
active_checkin_session = null
reason_codes incluye NO_ACTIVE_CHECKIN
```

Solo se emite:

- `CHECKIN_CLOSED_AS_ACTIVE`;
- `CHECKIN_EXPIRED_AS_ACTIVE`;

cuando una sesión cerrada o expirada es presentada como activa.

---

#### 16. Área opcional

Cuando el turno y el rol permiten operación site-wide:

```text
operational_area = null
```

es válido.

El carril puede quedar:

```text
READY
reason_codes = [NO_OPERATIONAL_AREA]
```

AUTH-CTX-017 y AUTH-CTX-020 determinarán si el permiso concreto exige área.

---

#### 17. Inactividad válida

Un empleado, rol, sede, área o dispositivo puede estar inactivo como estado
empresarial válido.

La clasificación depende del contrato:

- empleado inactivo conocido: `UNAVAILABLE`;
- dispositivo empresarial inactivo usado como principal: `DEVICE_INACTIVE`;
- rol base inactivo asignado a empleado activo: `BASE_ROLE_INACTIVE`;
- rol operativo inactivo contenido en turno vigente:
  `OPERATIONAL_ROLE_INACTIVE`;
- sede o área operativa inactiva:
  `OPERATIONAL_SITE_INACTIVE` o `OPERATIONAL_AREA_INACTIVE`.

La diferencia es si el estado representa una ausencia ordinaria o una
contradicción con un contexto que intenta utilizarlo.

---

#### 18. Causa raíz y supresión de cascadas

Cada problema deberá emitirse en su causa raíz.

Ejemplo:

```text
SHIFT_OVERLAP
→ active_shift = null
→ operational_role = null
→ operational_site = null
→ operational_area = null
```

Solo se emite:

```text
SHIFT_OVERLAP
```

No se emitirán además:

```text
OPERATIONAL_ROLE_UNKNOWN
OPERATIONAL_SITE_UNKNOWN
OPERATIONAL_AREA_UNKNOWN
```

cuando esos valores nulos sean consecuencias directas del turno ambiguo.

La supresión de cascadas evita:

- ruido;
- mensajes contradictorios;
- diagnósticos duplicados;
- listas inestables;
- falsos problemas independientes.

---

#### 19. Propiedad del problema

Cada código deberá ser emitido únicamente por su `source` canónica.

Un resolver dependiente podrá:

- consumir el problema;
- dejar su nodo en `null`;
- cambiar `lane_readiness`;
- agregar el código a `reason_codes`.

No deberá volver a emitir otro `StructuralIssue` equivalente.

---

#### 20. Deduplificación

La identidad lógica de un problema es:

```text
issue_code
+
subject_type
+
subject_id
+
source
```

Duplicados exactos se serializan una sola vez.

Si dos filas con la misma identidad tienen:

- severidades distintas;
- mensajes distintos;
- fuentes incompatibles;

se emitirá:

```text
STRUCTURAL_ISSUE_METADATA_INVALID
```

y el contexto fallará cerrado.

---

#### 21. Orden determinista

`structural_issues` se ordenará por:

1. rango de severidad;
2. `issue_code`;
3. `subject_type`;
4. `subject_id`, usando cadena vacía para `null`;
5. `source`.

Rango:

```text
BLOCKING_ALL        = 1
BLOCKING_BASE       = 2
BLOCKING_OPERATIONAL= 3
WARNING             = 4
INFO                = 5
```

`reason_codes` se ordenará:

1. códigos estructurales por el mismo orden;
2. códigos de disponibilidad alfabéticamente;
3. sin duplicados.

---

#### 22. `subject_id`

`subject_id` deberá contener únicamente un identificador interno mínimo y
necesario.

Podrá ser `null` cuando el problema afecte:

- configuración;
- contrato;
- snapshot;
- resolución global;
- una entidad que no pudo identificarse de forma segura.

No deberá contener:

- email;
- documento;
- teléfono;
- nombre;
- PIN;
- token;
- dirección;
- coordenadas;
- mensaje libre.

---

#### 23. `safe_message`

`safe_message` procede exclusivamente del catálogo.

No se construye con:

- errores SQL;
- excepciones;
- nombres de tablas;
- nombres de personas;
- identificadores sensibles;
- datos del recurso;
- credenciales;
- secretos;
- stack traces.

Las aplicaciones podrán traducir el mensaje mediante `issue_code`, pero no
cambiar su semántica.

El mensaje seguro no sustituye logs técnicos privados.

---

#### 24. Problemas desconocidos

Un resolver no podrá emitir códigos libres.

Si aparece un código no reconocido:

```text
STRUCTURAL_ISSUE_CODE_UNKNOWN
```

y ambos carriles quedan `INVALID`.

Si el código existe pero su severidad, sujeto, fuente o mensaje no coincide:

```text
STRUCTURAL_ISSUE_METADATA_INVALID
```

y ambos carriles quedan `INVALID`.

---

#### 25. `WARNING` e `INFO`

En esta versión, el catálogo congelado contiene principalmente problemas
bloqueantes.

Los futuros códigos `WARNING` e `INFO` deberán:

- tener propietario;
- no conceder autoridad;
- no ocultar un bloqueo;
- no utilizarse para degradar una contradicción;
- no afectar carriles por sí solos;
- ser probados en AUTH-CTX-030.

AUTH-CTX-028 podrá proponer advertencias de compatibilidad legacy mediante una
extensión versionada del catálogo.

No podrá crearlas físicamente sin actualización documental y pruebas.

---

#### 26. Relación con denegaciones explícitas

Un problema estructural no es una denegación configurada.

```text
StructuralIssue
→ integridad del contexto
```

```text
deny individual o transversal
→ política de autorización
```

AUTH-CTX-022 deberá conservar ambos orígenes por separado.

Una denegación no podrá utilizarse para reparar un contexto inválido.

---

#### 27. Relación con ausencia de grants

La ausencia de un allow coincidente no produce `StructuralIssue`.

Ejemplo:

```text
rol operativo válido
+
matriz sin permiso solicitado
→ contexto estructuralmente válido
→ decisión posterior DENY por ausencia de allow
```

AUTH-CTX-019 a AUTH-CTX-021 resolverán este caso.

---

#### 28. Relación con prerrequisitos

La ausencia normal de:

- turno;
- check-in;
- área;

no puede clasificarse definitivamente sin conocer el permiso solicitado.

Por ello:

- `AccessContext` registra disponibilidad;
- AUTH-CTX-017 resuelve el requisito;
- AUTH-CTX-019 y AUTH-CTX-020 aplican el requisito;
- AUTH-CTX-023 produce la decisión y razón final.

Una contradicción sí se registra inmediatamente como problema estructural.

---

#### 29. Relación con dispositivo compartido

Un dispositivo válido sin sesión de actor produce:

```text
lane_readiness.base.status = UNAVAILABLE
lane_readiness.operational.status = UNAVAILABLE
reason_codes = [DEVICE_ACTOR_SESSION_NOT_AVAILABLE]
```

No produce `DEVICE_ACTOR_SESSION_AMBIGUOUS`.

La ambigüedad, expiración presentada como vigente o incompatibilidad sí
producen `BLOCKING_ALL`.

---

#### 30. Relación con contexto obsoleto

Cuando el sistema sabe que el snapshot quedó obsoleto:

```text
CONTEXT_STALE
```

ambos carriles quedan `INVALID`.

No se permite:

- seguir usando un allow cacheado;
- recalcular parcialmente;
- reemplazar un nodo;
- cambiar únicamente el turno;
- cambiar únicamente el actor.

Debe resolverse un `AccessContext` nuevo.

---

#### 31. Snapshot mixto

`CONTEXT_SNAPSHOT_MIXED` se utiliza cuando un mismo contexto combina hechos
obtenidos en instantes o transacciones incompatibles.

Ejemplos:

- turno anterior con check-in nuevo;
- actor anterior con dispositivo nuevo;
- rol de una revisión y horario de otra;
- cobertura previa con asignaciones posteriores;
- nodo actualizado dentro de un contexto inmutable.

Es siempre `BLOCKING_ALL`.

---

#### 32. Serialización vacía

```text
structural_issues = []
```

significa:

```text
no se detectaron contradicciones estructurales catalogadas
```

No significa:

- permiso concedido;
- carriles listos;
- actor laboral;
- turno existente;
- check-in existente;
- recurso autorizado.

---

#### 33. Ejemplos integrales

##### Caso A — Empleado administrativo sin turno

```text
empleado activo
base_role válido
administrative_coverage válida
active_shift = null
structural_issues = []
```

Resultado:

```text
base.status = READY
operational.status = UNAVAILABLE
operational.reason_codes = [NO_ACTIVE_SHIFT]
```

##### Caso B — Turno válido sin check-in

```text
núcleo operativo válido
active_checkin_session = null
```

Resultado:

```text
operational.status = READY
operational.reason_codes = [NO_ACTIVE_CHECKIN]
```

Permisos `T` podrán evaluarse; permisos `T+C` no.

##### Caso C — Dos turnos vigentes

```text
SHIFT_OVERLAP
```

Resultado:

```text
base puede continuar READY
operational = INVALID
operational.reason_codes = [SHIFT_OVERLAP]
```

##### Caso D — Rol base ambiguo

```text
BASE_ROLE_AMBIGUOUS
```

Resultado:

```text
base = INVALID
operational se evalúa independientemente
```

##### Caso E — Actor y empleado incompatibles

```text
EMPLOYEE_ACTOR_MISMATCH
```

Resultado:

```text
base = INVALID
operational = INVALID
```

##### Caso F — Área opcional ausente

```text
rol site-wide
operational_area = null
```

Resultado:

```text
operational = READY
reason_codes = [NO_OPERATIONAL_AREA]
```

##### Caso G — Área requerida ausente

```text
OPERATIONAL_ROLE_AREA_REQUIRED
```

Resultado:

```text
operational = INVALID
```

##### Caso H — Check-in cerrado

```text
sesión cerrada correctamente
active_checkin_session = null
```

Resultado:

```text
operational puede permanecer READY
reason_codes = [NO_ACTIVE_CHECKIN]
```

No se emite `CHECKIN_CLOSED_AS_ACTIVE`.

##### Caso I — Check-in cerrado presentado como activo

```text
CHECKIN_CLOSED_AS_ACTIVE
```

Resultado:

```text
operational = INVALID
```

##### Caso J — Dispositivo activo sin actor

```text
device_status = ACTIVE
actor_session_id = null
```

Resultado:

```text
base = UNAVAILABLE
operational = UNAVAILABLE
reason_codes = [DEVICE_ACTOR_SESSION_NOT_AVAILABLE]
```

##### Caso K — Dispositivo con dos actores

```text
DEVICE_ACTOR_SESSION_AMBIGUOUS
```

Resultado:

```text
base = INVALID
operational = INVALID
```

##### Caso L — Rol válido sin grant

```text
structural_issues = []
lane correspondiente = READY
matched_allows = []
```

Resultado posterior:

```text
DENY por ausencia de allow
```

No existe problema estructural.

##### Caso M — Contexto obsoleto

```text
CONTEXT_STALE
```

Resultado:

```text
base = INVALID
operational = INVALID
```

Se requiere nueva resolución.

---

#### 34. Relación con tareas posteriores

##### AUTH-CTX-016

Incluirá aplicación y permiso solicitado sin modificar el catálogo
estructural.

##### AUTH-CTX-017

Consumirá `lane_readiness`, turno, check-in, área y compatibilidad de
dispositivo para resolver `authorization_requirement`.

##### AUTH-CTX-018

Resolverá recurso y territorio. Sus contradicciones pertenecerán a
`AuthorizationDecision`, no se mezclarán retroactivamente dentro del snapshot
de `AccessContext`.

##### AUTH-CTX-019 y AUTH-CTX-020

No podrán producir `ALLOW` desde un carril `INVALID`.

Un carril `UNAVAILABLE` solo podrá participar si el requisito concreto no lo
necesita.

##### AUTH-CTX-021

Registrará allows coincidentes. No convertirá un issue en allow.

##### AUTH-CTX-022

Mapeará problemas bloqueantes a `structural_denies` y conservará separadas
las denegaciones individuales y transversales.

##### AUTH-CTX-023

Producirá decisión y razones finales sin exponer información sensible.

##### AUTH-CTX-024

Registrará evidencia auditable de códigos, sujetos, fuentes y carriles.

##### AUTH-CTX-025

Diseñará el productor SQL de:

- `lane_readiness`;
- `structural_issues`;
- deduplicación;
- orden;
- supresión de cascadas;
- validación de metadatos.

##### AUTH-CTX-026

Diseñará el evaluador que consume los estados y códigos.

##### AUTH-CTX-027

Obligará a las aplicaciones a dejar de inventar razones locales.

##### AUTH-CTX-028

Diseñará compatibilidad legacy y podrá proponer una extensión versionada de
códigos de adaptación.

##### AUTH-CTX-029

Definirá invalidación y detección de `CONTEXT_STALE`.

##### AUTH-CTX-030

Definirá pruebas exhaustivas del catálogo, severidades, carriles, orden,
deduplicación y casos negativos.

##### BLOQUE E3

Definirá almacenamiento, exposición, índices, funciones privadas y retención.

##### BLOQUE E5

Creará los paquetes implementables del productor, evaluador, consumidores y
observabilidad.

##### BLOQUE R

Implementará físicamente contratos, funciones, validaciones, pruebas,
compatibilidad y rollout.

---

#### 35. Evolución del catálogo

El catálogo queda asociado a `AccessContext@1.0.0`.

Cambios compatibles:

- agregar un código nuevo;
- agregar una traducción de interfaz;
- agregar pruebas;
- ampliar evidencia privada sin cambiar el contrato público.

Cambios incompatibles:

- reutilizar un código;
- cambiar su severidad;
- cambiar su sujeto;
- cambiar su fuente;
- cambiar su significado;
- convertir una ausencia normal en bloqueo sin análisis;
- cambiar la forma de `StructuralIssue`;
- cambiar la forma de `LaneReadiness`.

Un cambio incompatible exige nueva versión contractual.

---

#### 36. Fuera del alcance

AUTH-CTX-015 no:

- decide permisos;
- consulta matrices;
- resuelve recursos;
- crea allows;
- crea denegaciones individuales;
- crea denegaciones transversales;
- define mensajes completos de UX;
- define códigos HTTP;
- define logs técnicos;
- define alertas;
- crea paneles;
- crea tablas;
- crea funciones SQL;
- crea RPC;
- crea RLS;
- crea migraciones;
- implementa caché;
- modifica Supabase;
- modifica aplicaciones.

Cada responsabilidad posterior tiene destino explícito en las secciones 34 y
35.

---

#### 37. Riesgos controlados

##### Riesgo 1 — Ausencia normal tratada como corrupción

Control:

```text
UNAVAILABLE separado de INVALID
```

##### Riesgo 2 — Contradicción ocultada como ausencia

Control:

```text
problema catalogado
→ INVALID
```

##### Riesgo 3 — Error derivado multiplica mensajes

Control:

```text
causa raíz + supresión de cascadas
```

##### Riesgo 4 — Mensaje técnico filtra datos

Control:

```text
safe_message fijo por catálogo
```

##### Riesgo 5 — Aplicaciones inventan códigos

Control:

```text
catálogo cerrado + código desconocido bloqueante
```

##### Riesgo 6 — Check-in ausente bloquea permisos T

Control:

```text
READY + NO_ACTIVE_CHECKIN
```

##### Riesgo 7 — Área nula funciona como wildcard

Control:

```text
NO_OPERATIONAL_AREA
≠
todas las áreas
```

##### Riesgo 8 — Problema del carril operativo bloquea administración

Control:

```text
BLOCKING_OPERATIONAL
≠
BLOCKING_ALL
```

---

#### 38. Criterios de aprobación

AUTH-CTX-015 podrá aprobarse cuando se acepte que:

1. se conservan las formas de `LaneReadiness` y `StructuralIssue`;
2. la tarea es compatible con `AccessContext@1.0.0`;
3. `READY` no significa `ALLOW`;
4. `UNAVAILABLE` representa ausencia o estado válido;
5. `INVALID` representa contradicción bloqueante;
6. `NOT_APPLICABLE` representa un carril ajeno al actor;
7. la ausencia normal no produce issue;
8. los problemas estructurales no son denegaciones configuradas;
9. la falta de grant no produce issue;
10. los prerrequisitos se aplican después;
11. `BLOCKING_ALL` invalida ambos carriles;
12. `BLOCKING_BASE` invalida solo el base;
13. `BLOCKING_OPERATIONAL` invalida solo el operativo;
14. `WARNING` no concede ni bloquea por sí sola;
15. `INFO` no concede ni bloquea por sí sola;
16. los tipos de sujeto quedan cerrados;
17. las fuentes resolutoras quedan cerradas;
18. los códigos usan `UPPER_SNAKE_CASE`;
19. los códigos son estables e inmutables;
20. el catálogo inicial contiene `100` códigos;
21. un código desconocido falla cerrado;
22. metadatos incompatibles fallan cerrado;
23. los mensajes seguros proceden del catálogo;
24. no contienen datos sensibles;
25. los problemas se emiten en la causa raíz;
26. se suprimen cascadas derivadas;
27. cada código tiene un resolver propietario;
28. la identidad lógica de duplicado queda definida;
29. conflictos de metadatos producen issue global;
30. el orden de issues es determinista;
31. el orden de reason codes es determinista;
32. `subject_id` es mínimo y seguro;
33. una lista vacía no significa autorización;
34. empleado inactivo conocido produce indisponibilidad;
35. ausencia de turno produce `UNAVAILABLE`;
36. ausencia de check-in puede coexistir con operativo `READY`;
37. permisos `T` no quedan bloqueados por esa ausencia;
38. permisos `T+C` la consumirán posteriormente;
39. área opcional ausente puede coexistir con `READY`;
40. área requerida ausente produce invalidez;
41. sesión cerrada normal no produce issue;
42. sesión cerrada presentada como activa sí produce issue;
43. dispositivo válido sin actor produce indisponibilidad;
44. sesiones de dispositivo ambiguas producen invalidez global;
45. un problema de rol base no bloquea automáticamente el carril operativo;
46. un problema operativo no bloquea automáticamente el carril base;
47. problemas de identidad o snapshot bloquean ambos;
48. contexto obsoleto nunca se reutiliza;
49. no se recalcula parcialmente;
50. AUTH-CTX-016 a AUTH-CTX-024 consumirán los códigos sin redefinirlos;
51. AUTH-CTX-025 diseñará el productor;
52. AUTH-CTX-026 diseñará el evaluador;
53. AUTH-CTX-027 eliminará razones locales;
54. AUTH-CTX-028 gobernará compatibilidad legacy;
55. AUTH-CTX-029 gobernará frescura;
56. AUTH-CTX-030 probará catálogo y precedencia;
57. E3, E5 y BLOQUE R tienen destinos físicos explícitos;
58. no se implementa código, migraciones ni cambios en Supabase.

---

#### 39. Estado final de la propuesta

| Tarea        | Estado      | Relación                  |
| ------------ | ----------- | ------------------------- |
| AUTH-CTX-014 | APROBADA    | Tarea anterior            |
| AUTH-CTX-015 | APROBADA    | Tarea actual              |
| AUTH-CTX-016 | NO INICIADA | Tarea siguiente reservada |

La continuidad propuesta queda:

```text
AUTH-CTX-014 — APROBADA
        ↓
AUTH-CTX-015 — APROBADA
        ↓
AUTH-CTX-016 — NO INICIADA
```

No se avanza a AUTH-CTX-016 hasta recibir aprobación explícita de
AUTH-CTX-015.



AUTHORIZATION DECISION

### ✅ AUTH-CTX-016 — Incluir aplicación y permiso solicitado

**Estado:** APROBADA
**Bloque:** BLOQUE E — Contexto y decisión de autorización unificados  
**Subbloque:** AUTHORIZATION DECISION  
**Naturaleza:** Definición documental de `app_code` y `permission_code` dentro de `AuthorizationDecision`  
**Implementación física:** No incluida  
**Tarea anterior vigente:** AUTH-CTX-015 — APROBADA  
**Tarea posterior reservada:** AUTH-CTX-017 — Incluir `authorization_requirement`  
**Contrato afectado:** `AuthorizationDecision@1.0.0`  
**Campos afectados:** `app_code`, `permission_code`  
**Catálogo de referencia:** `vento.authorization@1.0.0`  
**Schema del catálogo:** `1.0.0`  
**Aplicaciones registradas:** 10  
**Permisos activos congelados:** 140  
**Huella contractual:** `sha256:687e1bc19c0cf7332e76ed940cf5a23b829492ebbee399af718fd326cf473cbe`  
**Cambio contractual:** Aclaración normativa compatible; no cambia la forma publicada  
**Cambios físicos permitidos:** No

Esta tarea inicia la definición interna de `AuthorizationDecision`.

Su responsabilidad es identificar de forma exacta:

- qué aplicación empresarial recibe la solicitud;
- qué capacidad empresarial concreta se intenta ejecutar;
- qué clave canónica resulta de ambos campos;
- si la aplicación existe y está activa;
- si el permiso existe, está activo y pertenece a la aplicación;
- si la solicitud utiliza la convención canónica;
- si existe una clave legacy, alias o permiso retirado;
- si el consumidor intenta elegir un permiso diferente al exigido por la
  operación;
- si la versión del catálogo utilizada es la correcta.

No resuelve todavía:

- modalidad de autorización;
- turno o check-in requerido;
- área requerida;
- compatibilidad con dispositivo compartido;
- sensibilidad;
- reautenticación fuerte;
- recurso real;
- carril base;
- carril operativo;
- allows;
- denegaciones;
- decisión final.

Estas responsabilidades se asignan expresamente a AUTH-CTX-017 a
AUTH-CTX-024.

No modifica el catálogo, no agrega permisos, no crea aliases, no implementa
SQL, RPC, RLS, migraciones, guards, middlewares, aplicaciones ni cambios
físicos en Supabase.

---

#### 1. Objetivo

Definir `app_code` y `permission_code` de manera que Vento OS pueda responder
inequívocamente:

1. cuál aplicación es propietaria de la capacidad solicitada;
2. cuál es el código relativo exacto del permiso;
3. cuál es la clave completa resultante;
4. si los valores tienen una forma sintáctica válida;
5. si la aplicación existe en el catálogo canónico;
6. si la aplicación está activa;
7. si el permiso existe dentro de esa aplicación;
8. si el permiso está activo;
9. si el permiso fue retirado o deprecado;
10. si la solicitud contiene una clave legacy;
11. si existe un alias explícito y versionado;
12. si el alias puede adaptarse de forma unívoca;
13. si la clave representa una capacidad empresarial y no una ruta;
14. quién es responsable de declarar el permiso exigido por una operación;
15. cómo impedir que el cliente escoja una capacidad menos restrictiva;
16. cómo evaluar `app.access`;
17. cómo tratar solicitudes de varias capacidades;
18. cómo preservar determinismo, auditoría y fail closed;
19. cómo mantener separado el dominio laboral del dominio cliente;
20. qué elementos deberán completar las tareas posteriores.

---

#### 2. Base normativa

AUTH-CTX-016 conserva sin cambios las decisiones aprobadas en:

- ADR-AUTH-001;
- AUTH-CAT-001 — Definir aplicaciones canónicas;
- AUTH-CAT-002 — Definir convención
  `app.modulo.recurso.accion`;
- AUTH-CAT-003 a AUTH-CAT-005 — Normalización, consolidación y descripción;
- AUTH-CAT-006 — Modalidad de autorización;
- AUTH-CAT-007 a AUTH-CAT-019 — Clasificaciones contractuales;
- AUTH-CAT-020 a AUTH-CAT-024 — Brechas, descomposición, diff y publicación;
- AUTH-RBAC-024 a AUTH-RBAC-026 — Datasets canónicos;
- AUTH-CTX-001 a AUTH-CTX-004 — Contratos y versionado;
- AUTH-CTX-005 a AUTH-CTX-015 — Resolución de `AccessContext`.

Principios obligatorios:

```text
APP_CODE
→ IDENTIFICA UNA APLICACIÓN ESTABLE
```

```text
PERMISSION_CODE
→ IDENTIFICA UNA CAPACIDAD RELATIVA DENTRO DE LA APLICACIÓN
```

```text
PERMISSION_KEY
=
APP_CODE
+
"."
+
PERMISSION_CODE
```

```text
PERMISO SOLICITADO
≠
RUTA
≠
PANTALLA
≠
MÉTODO HTTP
≠
COMPONENTE
```

```text
PERMISO VÁLIDO
≠
PERMISO CONCEDIDO
```

```text
APLICACIÓN VÁLIDA
≠
APLICACIÓN AUTORIZADA PARA EL ACTOR
```

---

#### 3. Forma contractual conservada

`AuthorizationDecision@1.0.0` conserva los campos:

```ts
type AuthorizationDecision = {
  app_code: string;
  permission_code: string;
  authorization_requirement: unknown;
  resource: unknown;
  base_decision: unknown;
  operational_decision: unknown;
  matched_allows: unknown[];
  structural_denies: unknown[];
  actor_wide_denies: unknown[];
  lane_denies: unknown[];
  blocked_reasons: string[];
  final_decision: "ALLOW" | "DENY";
};
```

AUTH-CTX-016 define exclusivamente:

```ts
app_code: string;
permission_code: string;
```

No agrega un campo `permission_key`.

La clave completa se deriva de forma determinista:

```ts
const permissionKey = `${app_code}.${permission_code}`;
```

---

#### 4. Aplicaciones canónicas

El catálogo contractual contiene diez aplicaciones:

```text
NÚCLEO LABORAL
├── shell
├── anima
├── viso
├── nexo
├── fogo
├── origo
├── pulso
└── numera

LABORAL DIFERIDA
└── aura

DOMINIO CLIENTE ADYACENTE
└── pass
```

Reglas:

1. `app_code` identifica una frontera funcional estable;
2. el nombre visible de la aplicación puede cambiar;
3. el repositorio no sustituye `app_code`;
4. una ruta no crea una aplicación;
5. una aplicación diferida continúa siendo identificable;
6. una aplicación del dominio cliente no se convierte en laboral;
7. la existencia de la aplicación no concede acceso;
8. la aplicación deberá estar activa para continuar la evaluación.

---

#### 5. Semántica de `app_code`

`app_code` será el código canónico exacto solicitado.

Ejemplos válidos:

```text
shell
anima
viso
nexo
fogo
origo
pulso
numera
aura
pass
```

No se aceptarán como equivalentes:

```text
VENTO-SHELL
vento-shell
Vento OS
NEXO App
vento_nexo
Nexo
```

La comparación será exacta y sensible a la forma canónica.

No se aplicará:

- conversión automática a minúsculas;
- eliminación silenciosa de espacios;
- corrección ortográfica;
- normalización por nombre humano;
- inferencia desde URL;
- inferencia desde repositorio;
- inferencia desde host;
- inferencia desde el permiso;
- inferencia desde el dispositivo.

---

#### 6. Forma sintáctica de `app_code`

La forma contractual será:

```text
^[a-z][a-z0-9_]*$
```

Adicionalmente:

- no puede estar vacío;
- no puede contener puntos;
- no puede contener guiones;
- no puede contener espacios;
- no puede contener wildcards;
- no puede contener barras;
- no puede exceder la longitud máxima definida por el schema físico futuro;
- debe existir exactamente en el catálogo de aplicaciones.

La longitud física se definirá en AUTH-CTX-026 y se implementará mediante los
paquetes correspondientes de BLOQUE R.

---

#### 7. Aplicación inexistente

Una solicitud sintácticamente válida cuya aplicación no exista producirá:

```text
final_decision = DENY
blocked_reasons incluye APPLICATION_NOT_FOUND
```

No se buscará una aplicación parecida.

No se utilizará:

- la aplicación actual del navegador;
- el prefijo del permiso;
- la ruta;
- la plantilla del dispositivo;
- el repositorio;
- `shell` como fallback.

---

#### 8. Aplicación inactiva

Una aplicación existente pero inactiva producirá:

```text
final_decision = DENY
blocked_reasons incluye APPLICATION_INACTIVE
```

La inactividad no se corrige mediante:

- rol propietario;
- rol gerente general;
- dispositivo autorizado;
- permiso individual;
- grant global;
- simulación;
- acceso directo a una ruta.

La aplicación inactiva continúa siendo identificable para auditoría, pero no
puede producir una decisión positiva.

---

#### 9. AURA

`aura` conserva su identidad canónica como aplicación laboral diferida.

Reglas:

- puede aparecer en el catálogo;
- no se considera implementada por estar registrada;
- no obtiene permisos por inferencia;
- no se habilita mediante rutas existentes;
- toda acción exige un permiso canónico activo;
- su auditoría funcional continúa en las tareas específicas del BLOQUE W;
- AUTH-CTX-016 únicamente valida identidad de aplicación y permiso.

---

#### 10. PASS

`pass` pertenece al dominio cliente adyacente.

La autenticación normal del cliente final no se convierte en autorización
laboral por aparecer `pass` en el catálogo.

AUTH-CTX-016 podrá evaluar una solicitud `pass.*` únicamente cuando la
operación esté expresamente modelada dentro del contrato
`vento.authorization@1.0.0`, por ejemplo una capacidad interna o
administrativa.

Reglas:

```text
cliente final de Vento Pass
≠
empleado laboral
```

```text
pass registrado en el catálogo
≠
toda operación de cliente usa RBAC laboral
```

Las fronteras definitivas entre autorización laboral, administrativa y de
cliente se validarán en AUTH-CTX-017, AUTH-CTX-019, AUTH-CTX-020 y
AUTH-CTX-023.

---

#### 11. Semántica de `permission_code`

`permission_code` será el código relativo del permiso dentro de la aplicación.

Ejemplo:

```text
app_code = nexo
permission_code = inventory.remissions.request
```

La clave completa será:

```text
nexo.inventory.remissions.request
```

`permission_code` no deberá contener el prefijo de aplicación.

Por tanto, es inválido enviar:

```text
app_code = nexo
permission_code = nexo.inventory.remissions.request
```

El código correcto será:

```text
permission_code = inventory.remissions.request
```

---

#### 12. Formas canónicas del permiso

Solo existen dos formas laborales canónicas:

```text
<app>.access
```

y:

```text
<app>.<module>.<resource>.<action>
```

Dentro de `AuthorizationDecision` se representan como:

```text
app_code = nexo
permission_code = access
```

o:

```text
app_code = nexo
permission_code = inventory.remissions.request
```

No se aceptan capacidades parciales como:

```text
inventory
inventory.remissions
inventory.remissions.*
*.request
```

---

#### 13. Forma sintáctica de `permission_code`

La forma relativa será una de estas:

```text
^access$
```

o:

```text
^[a-z][a-z0-9_]*\.[a-z][a-z0-9_]*\.[a-z][a-z0-9_]*$
```

Reglas:

- exactamente un segmento para `access`;
- exactamente tres segmentos para una capacidad ordinaria;
- ningún segmento vacío;
- ningún wildcard;
- ningún espacio;
- ningún prefijo de aplicación;
- ningún slash;
- ningún guion;
- ninguna mayúscula;
- ningún parámetro de ruta;
- ningún identificador de recurso real;
- ningún identificador de sede o área;
- ningún rol;
- ninguna modalidad.

---

#### 14. Identidad completa del permiso

La identidad canónica se obtiene mediante:

```text
permission_key
=
app_code
+
"."
+
permission_code
```

Ejemplos:

```text
shell + access
→ shell.access
```

```text
nexo + inventory.remissions.request
→ nexo.inventory.remissions.request
```

```text
viso + authorization.permissions.assign
→ viso.authorization.permissions.assign
```

La búsqueda se realizará por la clave completa exacta.

No se buscará `permission_code` globalmente sin `app_code`.

---

#### 15. Duplicidad de códigos relativos

Dos aplicaciones pueden contener el mismo código relativo.

Ejemplos conceptuales:

```text
nexo.finance.cost_centers.view
numera.finance.cost_centers.view
```

Por tanto:

```text
permission_code
```

no identifica por sí solo una capacidad global.

La identidad mínima siempre será:

```text
app_code + permission_code
```

---

#### 16. Catálogo canónico de referencia

La resolución deberá utilizar exclusivamente:

```text
catalog_id = vento.authorization
catalog_version = 1.0.0
catalog_schema_version = 1.0.0
contract_release_hash =
sha256:687e1bc19c0cf7332e76ed940cf5a23b829492ebbee399af718fd326cf473cbe
```

El catálogo contiene:

```text
10 aplicaciones
140 permisos activos
```

La versión, schema y huella no se serializan como campos nuevos dentro de
`AuthorizationDecision@1.0.0`, pero deberán formar parte de:

- configuración del evaluador;
- evidencia auditable;
- pruebas;
- despliegue;
- fingerprint de decisión.

AUTH-CTX-024 y AUTH-CTX-026 completarán esas responsabilidades.

---

#### 17. Permiso inexistente

Si la clave completa no existe:

```text
final_decision = DENY
blocked_reasons incluye PERMISSION_NOT_FOUND
```

No se buscará:

- coincidencia parcial;
- prefijo;
- sufijo;
- acción parecida;
- recurso parecido;
- permiso del mismo módulo;
- permiso `access`;
- permiso más amplio;
- permiso del rol;
- permiso de otra aplicación.

---

#### 18. Permiso inactivo

Si la clave existe pero está inactiva:

```text
final_decision = DENY
blocked_reasons incluye PERMISSION_INACTIVE
```

Un grant histórico o una fila en una matriz no reactiva el permiso.

La inconsistencia entre catálogo y dataset deberá auditarse y fallará cerrado
en AUTH-CTX-021 a AUTH-CTX-023.

---

#### 19. Permiso retirado

Una clave clasificada como retirada o técnica no podrá solicitarse como
capacidad empresarial.

Resultado:

```text
final_decision = DENY
blocked_reasons incluye PERMISSION_RETIRED
```

Ejemplos de categorías retiradas:

- permisos generados desde rutas;
- permisos de páginas técnicas;
- alias de navegación;
- claves sustituidas por una capacidad canónica;
- claves one-to-many que requieren descomposición.

El retiro documental no se revierte porque un consumidor legacy todavía use
la cadena.

---

#### 20. Alias y claves legacy

Un alias deprecado:

- no constituye una capacidad independiente;
- no recibe matrices nuevas;
- no recibe permisos nuevos;
- no amplía modalidad;
- no amplía alcance;
- no aparece como resultado canónico.

El evaluador canónico directo exigirá claves canónicas.

Regla:

```text
alias enviado directamente
→ DENY
→ PERMISSION_ALIAS_REQUIRES_ADAPTER
```

AUTH-CTX-028 diseñará adaptadores temporales explícitos.

Cuando un adaptador permitido traduzca una clave legacy uno-a-uno:

- la evaluación utilizará la clave canónica;
- `app_code` y `permission_code` de la decisión serán canónicos;
- la clave original permanecerá en auditoría;
- el adaptador tendrá versión;
- no se realizará traducción silenciosa dentro del evaluador.

---

#### 21. Alias uno-a-muchos

Una clave legacy que deba dividirse en varias capacidades no podrá adaptarse
automáticamente a una sola.

Ejemplo conceptual:

```text
permiso amplio legacy
→ capacidad A
+ capacidad B
+ capacidad C
```

Resultado:

```text
DENY
blocked_reasons incluye PERMISSION_LEGACY_REQUIRES_DECOMPOSITION
```

El consumidor deberá declarar la capacidad exacta que realmente ejecuta.

AUTH-CTX-028 diseñará la transición.

AUTH-CTX-027 obligará a corregir consumidores.

---

#### 22. Aplicación y permiso deben coincidir

La fila canónica del permiso deberá declarar el mismo `app_code` solicitado.

Regla:

```text
requested.app_code
=
catalog_permission.app_code
```

Una inconsistencia interna del catálogo producirá:

```text
DENY
blocked_reasons incluye CATALOG_PERMISSION_IDENTITY_INVALID
```

No se reasignará el permiso a otra aplicación.

No se utilizará el primer permiso con el mismo código relativo.

---

#### 23. La operación es propietaria del permiso

El cliente no decide libremente qué permiso protege una mutación.

El permiso exigido deberá proceder de:

- contrato de la acción de servidor;
- RPC canónica;
- comando empresarial;
- handler autorizado;
- registro centralizado de capacidades.

Flujo:

```text
SOLICITUD EMPRESARIAL
→ OPERACIÓN DE SERVIDOR
→ PERMISO EXIGIDO POR LA OPERACIÓN
→ EVALUADOR CANÓNICO
```

No:

```text
CLIENTE
→ ENVÍA EL PERMISO MÁS CONVENIENTE
→ OPERACIÓN LO ACEPTA
```

---

#### 24. Entrada declarada por el cliente

Una interfaz podrá enviar:

- intención de operación;
- identificador del recurso;
- parámetros empresariales.

No deberá poder reducir la protección enviando otro permiso.

Ejemplo prohibido:

```text
operación real = cancelar venta
cliente envía permission_code = sales.orders.view
```

La acción de servidor deberá exigir:

```text
pulso.sales.orders.cancel
```

independientemente del valor enviado por el cliente.

---

#### 25. Evaluador genérico

Un evaluador genérico podrá recibir `app_code` y `permission_code` únicamente
desde un consumidor de servidor confiable.

Cuando se exponga una consulta pública de evaluación:

- los campos deberán validarse;
- la respuesta será informativa para esa clave;
- no ejecutará la acción empresarial;
- no sustituirá la validación dentro de la mutación;
- un resultado previo no se reutilizará como autorización.

Regla:

```text
consultar si podría ejecutar
≠
ejecutar de forma autorizada
```

---

#### 26. Una decisión por capacidad

Cada `AuthorizationDecision` evalúa exactamente una clave.

No se admitirán:

- arrays de permisos dentro de `permission_code`;
- listas separadas por comas;
- expresiones booleanas;
- prefijos;
- wildcards;
- “cualquiera de estos”;
- “todos estos”;
- permisos alternativos dentro del mismo campo.

Una operación que necesite varias capacidades deberá definir un contrato
compuesto explícito.

AUTH-CTX-026 deberá diseñar la evaluación compuesta sin alterar la semántica
unitaria.

---

#### 27. Evaluación por lotes

Una API futura podrá evaluar varias solicitudes en un lote.

Cada elemento deberá:

- tener su propio `app_code`;
- tener su propio `permission_code`;
- producir su propia decisión;
- conservar su recurso;
- conservar su auditoría;
- fallar de forma independiente, salvo que la operación empresarial sea
  atómica.

No se fusionarán decisiones para producir una autorización más amplia.

El contrato físico de lote, si se implementa, deberá definirse en
AUTH-CTX-026 y probarse en AUTH-CTX-030.

---

#### 28. `app.access`

`<app>.access` autoriza únicamente la capacidad de ingresar o presentar la
aplicación según su contrato.

No autoriza:

- todas las rutas;
- todos los módulos;
- todas las acciones;
- todas las consultas;
- todas las mutaciones;
- administración;
- operación;
- configuración;
- acceso a cualquier recurso.

Regla:

```text
nexo.access
≠
nexo.inventory.remissions.request
```

---

#### 29. Relación entre acceso y acción específica

Una operación puede requerir dos evaluaciones independientes:

```text
1. <app>.access
2. <app>.<module>.<resource>.<action>
```

La necesidad de ambas dependerá del contrato del consumidor.

Reglas:

- `app.access` no implica la capacidad específica;
- una capacidad específica no sintetiza automáticamente `app.access`;
- una interfaz puede ocultarse si falta `app.access`;
- una mutación siempre deberá validar su capacidad específica;
- el servidor no confiará únicamente en que la aplicación ya se abrió.

AUTH-CTX-027 definirá el consumo centralizado por rutas y acciones.

---

#### 30. Permisos de lectura y mutación

La acción HTTP no determina el permiso.

Ejemplos:

```text
GET
→ puede requerir una capacidad sensible
```

```text
POST
→ puede ejecutar una consulta compleja sin mutar estado empresarial
```

La clasificación de lectura procede del catálogo.

Una capacidad `.view` no podrá utilizarse para autorizar una mutación.

Una capacidad mutadora deberá ser exacta.

---

#### 31. Rutas, pantallas y componentes

No podrán solicitarse como permisos:

```text
page_tsx.view
login.view
no_access.view
inventory_catalog_id.view
slug.view
```

Una ruta consume capacidades empresariales.

No se convierte en una capacidad por existir técnicamente.

AUTH-CTX-027 deberá eliminar mapas locales basados exclusivamente en carpetas,
rutas o componentes.

---

#### 32. Alcance y filtros fuera del código

No se admitirán dentro de `permission_code` expresiones como:

```text
view_all
all_sites
edit_own
edit_own_pending
for_area
for_site
```

cuando representen alcance y no una acción empresarial distinta.

El alcance se resuelve mediante:

- contrato del permiso;
- grants;
- contexto;
- recurso;
- territorio.

Las claves legacy que todavía contienen alcance se tratarán mediante
AUTH-CTX-028 y no se reinterpretarán silenciosamente.

---

#### 33. Estado del recurso fuera del código

El estado empresarial del recurso no se utilizará como permiso cuando solo
actúe como condición.

Ejemplo:

```text
editar una remisión propia pendiente
```

deberá resolverse como:

```text
capacidad exacta
+
propiedad del recurso
+
estado del recurso
```

No como una clave dinámica construida desde el estado.

AUTH-CTX-018 resolverá el recurso.

AUTH-CTX-019 y AUTH-CTX-020 evaluarán las condiciones del grant.

---

#### 34. Modalidad no se infiere

AUTH-CTX-016 no decide si la capacidad es:

- `BASE_ONLY`;
- `OPERATIONAL_ONLY`;
- `BASE_OR_OPERATIONAL`;
- `BASE_AND_OPERATIONAL`.

La modalidad procede del registro canónico y será proyectada en
AUTH-CTX-017.

Queda prohibido inferirla desde:

- aplicación;
- rol;
- nombre del permiso;
- matriz;
- turno;
- dispositivo;
- prefijo;
- módulo.

---

#### 35. Prerrequisitos no se infieren

AUTH-CTX-016 no decide si el permiso exige:

- turno;
- check-in;
- área;
- dispositivo personal;
- dispositivo compartido;
- reautenticación fuerte;
- simulación permitida;
- recurso;
- auditoría reforzada.

Estas clasificaciones proceden del permiso y se incluirán en
AUTH-CTX-017.

---

#### 36. Recurso no se infiere desde la clave

El permiso identifica la capacidad.

No identifica necesariamente:

- el recurso concreto;
- sede del recurso;
- área del recurso;
- origen;
- destino;
- propietario;
- estado;
- relaciones empresariales.

AUTH-CTX-018 deberá resolver esas dimensiones desde la operación real.

---

#### 37. Dispositivo compartido

AUTH-CTX-016 valida la identidad canónica de la aplicación y del permiso.

No decide todavía si:

```text
app_code ∈ allowed_application_codes
```

ni si:

```text
permission_key ∈ capability_package
```

Estas restricciones se proyectarán en AUTH-CTX-017 y se aplicarán en
AUTH-CTX-019, AUTH-CTX-020 y AUTH-CTX-023.

La aplicación o permiso siguen siendo canónicos aunque el dispositivo no los
admita.

---

#### 38. Aplicación abierta no es autoridad

El hecho de que:

- una ruta cargue;
- un menú esté visible;
- el bundle exista;
- el dispositivo permita la app;
- la aplicación esté instalada;
- el usuario llegue por URL directa;

no sustituye la evaluación.

Regla:

```text
APLICACIÓN PRESENTE
≠
APLICACIÓN AUTORIZADA
```

---

#### 39. Simulación

La simulación puede solicitar una aplicación y permiso hipotéticos.

Reglas:

- deberá usar claves canónicas;
- no podrá crear una capacidad inexistente;
- no podrá reactivar una clave retirada;
- no podrá usar un alias uno-a-muchos;
- no podrá convertir `WOULD_ALLOW` en `ALLOW`;
- el actor real conserva atribución;
- el resultado se publica mediante el contrato simulado.

Una clave inválida produce `INDETERMINATE` o `WOULD_DENY` según el contrato de
simulación, nunca `WOULD_ALLOW`.

AUTH-CTX-023 y las tareas del BLOQUE Q completarán la decisión simulada.

---

#### 40. Procesos de sistema e integraciones

Un proceso técnico también deberá declarar una clave empresarial canónica.

No podrá utilizar:

- `service_role`;
- API key;
- nombre de integración;
- nombre de cola;
- nombre de función;
- evento técnico;

como sustituto del permiso.

Las credenciales autentican el proceso.

El permiso autoriza la capacidad empresarial.

Las integraciones y procesos asíncronos deberán conservar la aplicación
propietaria y la capacidad exacta.

---

#### 41. Errores de contrato de entrada

Los siguientes casos son errores del contrato de invocación y no deberán
producir una decisión empresarial ordinaria:

- `app_code` ausente;
- `permission_code` ausente;
- tipo diferente de string;
- cadena vacía;
- espacios iniciales o finales;
- forma sintáctica inválida;
- wildcard;
- varios permisos en el mismo campo;
- clave completa enviada dentro de `permission_code`;
- versión de request no soportada.

AUTH-CTX-026 deberá definir la respuesta técnica exacta.

La mutación empresarial deberá permanecer sin ejecutar.

---

#### 42. Razones de bloqueo de resolución

Para solicitudes sintácticamente válidas que no puedan vincularse con el
catálogo, se reservan estas razones:

```text
APPLICATION_NOT_FOUND
APPLICATION_INACTIVE
PERMISSION_NOT_FOUND
PERMISSION_INACTIVE
PERMISSION_RETIRED
PERMISSION_ALIAS_REQUIRES_ADAPTER
PERMISSION_LEGACY_REQUIRES_DECOMPOSITION
CATALOG_PERMISSION_IDENTITY_INVALID
CATALOG_VERSION_UNAVAILABLE
CATALOG_INTEGRITY_INVALID
```

Estas razones:

- pertenecerán a `blocked_reasons`;
- no se agregarán a `AccessContext.structural_issues`;
- no modificarán retroactivamente `lane_readiness`;
- producirán `DENY`;
- serán consolidadas en AUTH-CTX-023;
- serán auditadas mediante AUTH-CTX-024.

---

#### 43. Integridad del catálogo

Antes de evaluar, el consumidor canónico deberá comprobar que:

1. el catálogo es el esperado;
2. la versión es compatible;
3. el schema es compatible;
4. la huella o artefacto desplegado corresponde a la publicación;
5. las aplicaciones son únicas;
6. las claves son únicas;
7. cada clave coincide con su `app_code`;
8. cada permiso activo tiene clasificaciones obligatorias;
9. no existen aliases activos como capacidades independientes;
10. no existen wildcards.

Una contradicción producirá:

```text
DENY
blocked_reasons incluye CATALOG_INTEGRITY_INVALID
```

No se utilizará parcialmente un catálogo corrupto.

---

#### 44. Versión no disponible

Si el evaluador no puede cargar una versión compatible del catálogo:

```text
DENY
blocked_reasons incluye CATALOG_VERSION_UNAVAILABLE
```

Queda prohibido:

- usar “latest”;
- usar una versión anterior sin adaptador;
- consultar directamente tablas legacy;
- completar campos con defaults;
- omitir clasificaciones desconocidas;
- degradar la decisión.

---

#### 45. Resultado canónico válido

Una solicitud queda canónicamente identificada cuando:

```text
app_code tiene forma válida
AND aplicación existe
AND aplicación está activa
AND permission_code tiene forma válida
AND permission_key existe
AND permiso está activo
AND permiso pertenece a app_code
AND catálogo y versión son válidos
```

Resultado:

```text
app_code = código canónico exacto
permission_code = código relativo canónico exacto
```

Esto solo permite continuar a AUTH-CTX-017.

No produce `ALLOW`.

---

#### 46. Resultado inválido

Si la solicitud supera validación sintáctica pero falla la resolución
canónica:

```text
app_code = valor solicitado seguro
permission_code = valor solicitado seguro
final_decision = DENY
blocked_reasons = razones aplicables
```

No se consultan:

- matrices;
- grants;
- turnos;
- check-ins;
- recursos;
- denegaciones individuales;

cuando la capacidad no es canónica.

La auditoría conservará la solicitud sin exponer datos sensibles.

---

#### 47. Orden canónico de resolución

```text
1. validar contrato de entrada
2. validar forma de app_code
3. validar aplicación exacta
4. validar estado de aplicación
5. validar forma de permission_code
6. construir permission_key
7. validar versión y huella del catálogo
8. buscar clave exacta
9. validar estado del permiso
10. validar pertenencia a la aplicación
11. clasificar alias, retiro o legado
12. producir app_code y permission_code canónicos
13. continuar a authorization_requirement
```

No se consultan grants antes de validar la capacidad.

---

#### 48. Determinismo

Para el mismo:

- request válido;
- catálogo;
- versión;
- schema;
- huella;
- estado de aplicaciones;
- estado de permisos;

la resolución deberá producir exactamente el mismo resultado.

No dependerá de:

- orden físico de filas;
- aplicación abierta;
- route segment;
- host;
- frontend;
- usuario;
- rol;
- dispositivo;
- primer permiso parecido;
- caché sin versión;
- alias implícito.

---

#### 49. Casos de ejemplo

##### Caso A — Acceso a NEXO

```text
app_code = nexo
permission_code = access
```

Clave:

```text
nexo.access
```

Resultado:

```text
identidad canónica válida
continuar a AUTH-CTX-017
```

No concede todas las capacidades de NEXO.

##### Caso B — Solicitar una remisión

```text
app_code = nexo
permission_code = inventory.remissions.request
```

Resultado:

```text
permission_key = nexo.inventory.remissions.request
```

La modalidad y prerrequisitos se resolverán después.

##### Caso C — Clave completa en `permission_code`

```text
app_code = nexo
permission_code = nexo.inventory.remissions.request
```

Resultado:

```text
error de contrato de entrada
no ejecutar operación
```

##### Caso D — Aplicación con mayúscula

```text
app_code = NEXO
```

Resultado:

```text
error de contrato de entrada
```

No se convierte automáticamente.

##### Caso E — Aplicación inexistente

```text
app_code = inventario
permission_code = access
```

Resultado:

```text
DENY
APPLICATION_NOT_FOUND
```

##### Caso F — Permiso inexistente

```text
app_code = nexo
permission_code = inventory.remissions.approve_everything
```

Resultado:

```text
DENY
PERMISSION_NOT_FOUND
```

##### Caso G — Permiso de otra aplicación

```text
app_code = nexo
permission_code = staff.employees.read
```

Si no existe esa clave completa en NEXO:

```text
DENY
PERMISSION_NOT_FOUND
```

No se busca automáticamente en VISO.

##### Caso H — `app.access`

```text
nexo.access = ALLOW
nexo.inventory.stock.view = no evaluado
```

Resultado:

```text
puede ingresar a NEXO según contrato
no implica consultar stock
```

##### Caso I — Ruta técnica legacy

```text
app_code = nexo
permission_code = inventory_catalog_id.view
```

Resultado:

```text
DENY
PERMISSION_RETIRED
```

##### Caso J — Alias uno-a-uno

```text
consumidor legacy envía alias
```

Evaluador directo:

```text
DENY
PERMISSION_ALIAS_REQUIRES_ADAPTER
```

Adaptador aprobado:

```text
alias
→ clave canónica exacta
→ evaluar
→ decisión publica clave canónica
```

##### Caso K — Alias uno-a-muchos

```text
permiso legacy amplio
→ tres capacidades canónicas
```

Resultado:

```text
DENY
PERMISSION_LEGACY_REQUIRES_DECOMPOSITION
```

##### Caso L — Aplicación permitida por dispositivo

```text
app válida
permission válida
app incluida en allowed_application_codes
```

Resultado de AUTH-CTX-016:

```text
identidad canónica válida
```

La compatibilidad del dispositivo todavía no concede acceso.

##### Caso M — Aplicación no permitida por dispositivo

```text
app válida
permission válida
app no incluida por dispositivo
```

Resultado de AUTH-CTX-016:

```text
identidad canónica válida
```

AUTH-CTX-017 y AUTH-CTX-023 producirán el bloqueo del dispositivo.

##### Caso N — Cliente elige permiso de lectura para mutar

```text
acción real = cancelar venta
cliente envía sales.orders.view
```

Resultado:

```text
la acción de servidor ignora la clave elegida
y exige pulso.sales.orders.cancel
```

##### Caso O — Permiso válido sin grants

```text
app y permiso canónicos
ningún allow coincide
```

Resultado de AUTH-CTX-016:

```text
identidad válida
```

Resultado posterior:

```text
DENY por default deny
```

No es un error de catálogo.

---

#### 50. Antipatrones prohibidos

```ts
const appCode = request.app ?? pathname.split("/")[1];

const permission =
  request.permission ??
  `${appCode}.${routeName}.view`;

const allowed =
  userPermissions.some((key) => key.startsWith(`${appCode}.`));

const canonical =
  permission.toLowerCase().trim();

const fallback =
  requestedPermission ?? `${appCode}.access`;
```

También queda prohibido:

```text
app desconocida → shell
permiso desconocido → app.access
alias → permiso más parecido
varios permisos → elegir cualquiera
permiso de lectura → proteger mutación
ruta visible → permiso concedido
app instalada → app autorizada
grant existente → permiso activo
rol propietario → ignorar catálogo
```

---

#### 51. Relación con tareas posteriores

##### AUTH-CTX-017

Proyectará desde el permiso canónico:

- modalidad;
- turno requerido;
- check-in requerido;
- área requerida;
- compatibilidad con dispositivo;
- reautenticación;
- sensibilidad;
- recurso requerido;
- simulación.

##### AUTH-CTX-018

Resolverá el recurso empresarial y sus territorios.

##### AUTH-CTX-019

Evaluará el carril base únicamente cuando la modalidad lo permita.

##### AUTH-CTX-020

Evaluará el carril operativo únicamente cuando la modalidad lo permita.

##### AUTH-CTX-021

Resolverá allows coincidentes para la clave completa canónica.

##### AUTH-CTX-022

Resolverá denegaciones coincidentes para la misma clave.

##### AUTH-CTX-023

Consolidará:

- razones de aplicación;
- razones de permiso;
- razones de catálogo;
- denegación por defecto;
- decisión final.

##### AUTH-CTX-024

Registrará:

- aplicación;
- permiso relativo;
- clave completa;
- versión y hash;
- consumidor;
- operación;
- resultado.

##### AUTH-CTX-025

Diseñará `get_access_context`; no recibirá permisos como fuente de identidad
laboral.

##### AUTH-CTX-026

Diseñará el contrato canónico de `evaluate_authorization`, incluyendo:

- request;
- errores de entrada;
- validación de catálogo;
- evaluación unitaria;
- posibles lotes;
- atomicidad;
- respuesta.

##### AUTH-CTX-027

Definirá mapas centralizados de rutas, acciones, RPC y permisos, evitando que
cada aplicación invente claves.

##### AUTH-CTX-028

Diseñará adaptadores temporales para:

- aliases;
- claves legacy;
- permisos retirados todavía consumidos;
- consumidores que envían clave completa en un solo campo;
- funciones actuales separadas.

##### AUTH-CTX-029

Definirá caché e invalidación por cambios de aplicación, permiso, catálogo y
versión.

##### AUTH-CTX-030

Definirá pruebas contractuales de sintaxis, identidad, alias, retiro,
versionado y fail closed.

##### AUTH-DB-006

Incorporará la decisión canónica en RPC sensibles.

##### AUTH-DB-009

Implementará validación del permiso exacto en RPC sensibles.

##### AUTH-DB-010

Impedirá que un principal o actor incompatible ejecute la capacidad.

##### AUTH-DB-020

Implementará compatibilidad temporal con claves legacy después de aprobar
AUTH-CTX-028.

##### AUTH-DB-027

Probará integridad de catálogo, RPC, RLS y migraciones.

##### AUTH-DB-030

Retirará consumidores y objetos legacy después de adopción comprobada.

##### AUTH-DB-031

Certificará paridad documental, técnica y operativa.

---

#### 52. Fuera del alcance

AUTH-CTX-016 no:

- agrega aplicaciones;
- activa o desactiva aplicaciones;
- agrega permisos;
- renombra permisos;
- modifica el catálogo;
- modifica la versión;
- modifica el hash;
- crea aliases;
- decide mappings legacy;
- define modalidad;
- define turno o check-in;
- define área requerida;
- define compatibilidad de dispositivo;
- define sensibilidad;
- define reautenticación;
- resuelve recursos;
- consulta matrices;
- consulta grants;
- consulta denegaciones;
- decide carriles;
- produce decisión final completa;
- crea tipos físicos;
- crea funciones SQL;
- crea RPC;
- crea RLS;
- crea migraciones;
- modifica Supabase;
- modifica aplicaciones.

Cada responsabilidad posterior tiene destino explícito en la sección 51.

---

#### 53. Riesgos controlados

##### Riesgo 1 — El cliente escoge un permiso más débil

Control:

```text
la operación de servidor es propietaria del permiso
```

##### Riesgo 2 — `app.access` funciona como wildcard

Control:

```text
app.access
≠
capacidades internas
```

##### Riesgo 3 — Código relativo se busca sin aplicación

Control:

```text
identidad = app_code + permission_code
```

##### Riesgo 4 — Alias amplía autoridad

Control:

```text
evaluador directo exige clave canónica
```

##### Riesgo 5 — Clave one-to-many se traduce arbitrariamente

Control:

```text
descomposición obligatoria
```

##### Riesgo 6 — Ruta técnica se convierte en capacidad

Control:

```text
catálogo canónico de capacidades empresariales
```

##### Riesgo 7 — Catálogo incompatible se usa parcialmente

Control:

```text
versión + schema + integridad
→ fail closed
```

##### Riesgo 8 — Aplicación válida se confunde con acceso autorizado

Control:

```text
identidad canónica
≠
ALLOW
```

---

#### 54. Criterios de aprobación

AUTH-CTX-016 podrá aprobarse cuando se acepte que:

1. `AuthorizationDecision@1.0.0` conserva `app_code`;
2. conserva `permission_code`;
3. no se agrega `permission_key` como campo;
4. la clave completa se deriva;
5. existen diez aplicaciones canónicas;
6. `aura` permanece laboral diferida;
7. `pass` permanece en el dominio cliente adyacente;
8. la existencia de una app no concede acceso;
9. `app_code` debe ser exacto;
10. no se normaliza silenciosamente;
11. una aplicación desconocida produce `DENY`;
12. una aplicación inactiva produce `DENY`;
13. `permission_code` es relativo;
14. no incluye el prefijo de aplicación;
15. solo admite `access` o tres segmentos;
16. no admite wildcards;
17. no admite rutas ni parámetros;
18. la identidad completa usa ambos campos;
19. códigos relativos repetidos entre apps son válidos;
20. el catálogo de referencia es `vento.authorization@1.0.0`;
21. el schema es `1.0.0`;
22. la huella queda fijada;
23. el catálogo contiene 140 permisos activos;
24. una clave inexistente produce `DENY`;
25. una clave inactiva produce `DENY`;
26. una clave retirada produce `DENY`;
27. un alias no se evalúa directamente;
28. AUTH-CTX-028 diseñará adaptadores;
29. un alias one-to-many no se traduce automáticamente;
30. aplicación y permiso deben coincidir;
31. el cliente no elige la protección de una mutación;
32. la operación de servidor declara la capacidad;
33. una consulta previa no autoriza la ejecución;
34. cada decisión evalúa una sola capacidad;
35. una API por lotes conserva decisiones independientes;
36. `app.access` no concede las capacidades internas;
37. una acción específica no sintetiza automáticamente `app.access`;
38. el método HTTP no determina la capacidad;
39. una ruta no es un permiso;
40. el alcance no se infiere desde el código;
41. el estado del recurso no se convierte en permiso;
42. la modalidad se reserva para AUTH-CTX-017;
43. los prerrequisitos se reservan para AUTH-CTX-017;
44. el recurso se reserva para AUTH-CTX-018;
45. la compatibilidad del dispositivo no altera identidad canónica;
46. una aplicación abierta no concede autoridad;
47. simulación exige claves canónicas;
48. un proceso técnico también declara permiso empresarial;
49. credencial técnica no es permiso;
50. errores de forma no ejecutan la operación;
51. razones de resolución van a `blocked_reasons`;
52. no se agregan a `AccessContext.structural_issues`;
53. catálogo inválido produce fail closed;
54. versión no disponible produce fail closed;
55. una identidad válida solo permite continuar;
56. no produce `ALLOW`;
57. la resolución es determinista;
58. AUTH-CTX-017 a AUTH-CTX-024 completarán la decisión;
59. AUTH-CTX-026 diseñará el evaluador;
60. AUTH-CTX-027 eliminará mapas locales inconsistentes;
61. AUTH-CTX-028 gobernará aliases y legado;
62. AUTH-CTX-029 gobernará caché;
63. AUTH-CTX-030 gobernará pruebas;
64. AUTH-DB-006, AUTH-DB-009, AUTH-DB-010, AUTH-DB-020,
    AUTH-DB-027, AUTH-DB-030 y AUTH-DB-031 tienen destinos físicos exactos;
65. no se implementa código, migraciones ni cambios en Supabase.

---

#### 55. Estado final de la propuesta

| Tarea        | Estado      | Relación                  |
| ------------ | ----------- | ------------------------- |
| AUTH-CTX-015 | APROBADA    | Tarea anterior            |
| AUTH-CTX-016 | APROBADA    | Tarea actual              |
| AUTH-CTX-017 | NO INICIADA | Tarea siguiente reservada |

La continuidad propuesta queda:

```text
AUTH-CTX-015 — APROBADA
        ↓
AUTH-CTX-016 — APROBADA
        ↓
AUTH-CTX-017 — NO INICIADA
```

No se avanza a AUTH-CTX-017 hasta recibir aprobación explícita de
AUTH-CTX-016.


### ✅ AUTH-CTX-017 — Incluir `authorization_requirement`

**Estado:** APROBADA  
**Bloque:** BLOQUE E — Contexto y decisión de autorización unificados  
**Subbloque:** AUTHORIZATION DECISION  
**Naturaleza:** Definición documental del requisito contractual de autorización del permiso solicitado  
**Implementación física:** No incluida  
**Tarea anterior vigente:** AUTH-CTX-016 — APROBADA  
**Tarea posterior reservada:** AUTH-CTX-018 — Incluir recurso y territorio resueltos  
**Contrato afectado:** `AuthorizationDecision@1.0.0`  
**Campo principal afectado:** `authorization_requirement`  
**Fuente normativa:** `PermissionContractSnapshot` del permiso canónico solicitado  
**Catálogo de referencia:** `vento.authorization@1.0.0`  
**Permisos activos sujetos a clasificación:** 140  
**Cambio contractual:** Aclaración normativa compatible; no cambia la forma publicada  
**Cambios físicos permitidos:** No

Esta tarea define cómo `AuthorizationDecision` incorpora y consume el
`authorization_requirement` del permiso canónico solicitado.

El campo determina exclusivamente:

```text
qué carril
o qué combinación de carriles
puede producir autorización
para la capacidad exacta solicitada
```

No determina por sí solo:

- quién posee un grant;
- cuál es el alcance del grant;
- si existe turno;
- si existe check-in;
- si existe área;
- si el dispositivo es compatible;
- si se requiere reautenticación fuerte;
- si el recurso está dentro del alcance;
- si existe una denegación;
- si la decisión final será `ALLOW`.

No modifica el catálogo, no cambia modalidades, no agrega campos al contrato,
no implementa SQL, RPC, RLS, migraciones, evaluadores, guards ni cambios
físicos en Supabase.

---

#### 1. Objetivo

Definir `authorization_requirement` de manera que Vento OS pueda responder
inequívocamente:

1. cuál de las cuatro modalidades contractuales posee el permiso;
2. qué carril o carriles son aplicables;
3. si los carriles actúan como alternativa o como conjunción;
4. qué carril debe quedar `NOT_APPLICABLE`;
5. cómo se deriva `is_operational`;
6. cómo se relaciona la modalidad con `N`, `T` y `T+C`;
7. cómo se relaciona con el requisito de área operativa;
8. cómo se relaciona con dispositivos compartidos;
9. cómo se relaciona con sensibilidad y reautenticación;
10. cómo se relaciona con simulación;
11. cómo se relaciona con el contrato de recurso;
12. cómo se relaciona con dependencias de permisos;
13. cómo se tratan modalidades ausentes o inválidas;
14. cómo se tratan contradicciones entre propiedades;
15. cómo se tratan grants ubicados en un carril incompatible;
16. cómo se tratan aliases y claves legacy;
17. cómo se aplican denegaciones en cada modalidad;
18. cómo se evita que una aplicación, matriz, rol o ruta reinterprete el
    permiso;
19. cómo se preservan versión, huella, determinismo y auditoría;
20. qué tareas posteriores completan la decisión.

---

#### 2. Base normativa

AUTH-CTX-017 conserva sin cambios las decisiones aprobadas en:

- ADR-AUTH-001;
- AUTH-CAT-006 — Definir `authorization_requirement` de cada permiso;
- AUTH-CAT-007 — Derivar clasificación operativa;
- AUTH-CAT-008 a AUTH-CAT-010 — Lectura, configuración y sensibilidad;
- AUTH-CAT-011 — Alcance permitido;
- AUTH-CAT-012 — Prerrequisitos de turno y check-in;
- AUTH-CAT-013 — Requisito de área operativa;
- AUTH-CAT-014 — Compatibilidad con dispositivo compartido;
- AUTH-CAT-015 — Compatibilidad con simulación;
- AUTH-CAT-016 — Contratos de recurso;
- AUTH-CAT-017 — Dependencias entre permisos;
- AUTH-CAT-018 — Tipos TypeScript derivados;
- AUTH-CAT-019 — Prohibición de cadenas manuales;
- AUTH-CAT-020 a AUTH-CAT-024 — Brechas, descomposición, diff y publicación;
- AUTH-RBAC-001 a AUTH-RBAC-028 — Matrices, excepciones, dispositivos y
  datasets;
- AUTH-CTX-001 a AUTH-CTX-004 — Contratos y versionado;
- AUTH-CTX-005 a AUTH-CTX-015 — `AccessContext`;
- AUTH-CTX-016 — Aplicación y permiso solicitado.

Principios obligatorios:

```text
AUTHORIZATION_REQUIREMENT
→ SE OBTIENE DEL CATÁLOGO
```

```text
MATRIZ
→ ASIGNA UNA CAPACIDAD COMPATIBLE
→ NO DEFINE SU MODALIDAD
```

```text
CONTEXTO
→ DETERMINA SI EL CARRIL PUEDE UTILIZARSE
→ NO CAMBIA LA MODALIDAD
```

```text
MODALIDAD
≠
ALCANCE
≠
PRERREQUISITO
≠
SENSIBILIDAD
≠
COMPATIBILIDAD DE DISPOSITIVO
```

---

#### 3. Ubicación contractual y fuente única

La forma detallada aprobada de `AuthorizationDecision@1.0.0` contiene:

```ts
permission_contract: PermissionContractSnapshot;
```

Dentro de ese snapshot existe:

```ts
authorization_requirement:
  | "BASE_ONLY"
  | "OPERATIONAL_ONLY"
  | "BASE_OR_OPERATIONAL"
  | "BASE_AND_OPERATIONAL";
```

La representación resumida del roadmap puede mostrar:

```ts
authorization_requirement: AuthorizationRequirement;
```

Ambas representaciones refieren al mismo dato.

Queda prohibido mantener dos fuentes editables:

```text
AuthorizationDecision.authorization_requirement
≠
permission_contract.authorization_requirement
```

Regla canónica:

```text
authorization_requirement de la decisión
=
permission_contract.authorization_requirement
=
valor publicado del permiso canónico
```

---

#### 4. Enum cerrado

Los únicos valores admitidos son:

```ts
type AuthorizationRequirement =
  | "BASE_ONLY"
  | "OPERATIONAL_ONLY"
  | "BASE_OR_OPERATIONAL"
  | "BASE_AND_OPERATIONAL";
```

No existen:

- `AUTO`;
- `DEFAULT`;
- `BOTH`;
- `ANY`;
- `ADMIN`;
- `OPERATIONAL`;
- `GLOBAL`;
- `INHERITED`;
- `null` permisivo;
- valores personalizados por aplicación.

Un valor ausente o desconocido produce fail closed.

---

#### 5. Pregunta exclusiva que responde

`authorization_requirement` responde:

```text
¿qué carril o combinación de carriles
puede autorizar esta capacidad?
```

No responde:

```text
¿qué rol posee el permiso?
¿qué sede o área cubre?
¿el recurso coincide?
¿existe una denegación?
¿el permiso es sensible?
¿el permiso es de lectura?
¿el permiso exige check-in?
¿el dispositivo lo admite?
```

Esas dimensiones permanecen independientes.

---

#### 6. Matriz canónica de carriles

| Modalidad              | Carril base             | Carril operativo        | Regla de combinación |
| ---------------------- | ----------------------- | ----------------------- | -------------------- |
| `BASE_ONLY`            | Aplicable y obligatorio | `NOT_APPLICABLE`        | Solo base            |
| `OPERATIONAL_ONLY`     | `NOT_APPLICABLE`        | Aplicable y obligatorio | Solo operativo       |
| `BASE_OR_OPERATIONAL`  | Aplicable               | Aplicable               | Al menos uno         |
| `BASE_AND_OPERATIONAL` | Aplicable y obligatorio | Aplicable y obligatorio | Ambos                |

La modalidad no indica todavía si cada carril resultará `ALLOW` o `DENY`.

---

#### 7. `BASE_ONLY`

Significa:

```text
solo el carril base
puede producir autorización
```

Reglas:

1. el carril base deberá evaluarse;
2. el carril operativo será `NOT_APPLICABLE`;
3. no se exige turno;
4. no se exige check-in;
5. no se exige área operativa;
6. un rol operativo no puede autorizar;
7. un grant operativo almacenado para ese permiso es incompatible;
8. la ausencia de contexto operativo no bloquea;
9. una denegación base aplicable produce `DENY`;
10. un actor-wide deny aplicable produce `DENY`;
11. sin allow base coincidente se aplica default deny.

No significa:

- todos los roles base;
- acceso global;
- acceso administrativo automático;
- bypass de recurso;
- bypass por propietario.

---

#### 8. `OPERATIONAL_ONLY`

Significa:

```text
solo el carril operativo
puede producir autorización
```

Reglas:

1. el carril base será `NOT_APPLICABLE`;
2. el carril operativo deberá evaluarse;
3. requiere turno publicado y vigente;
4. requiere rol operativo efectivo;
5. requiere sede operativa válida;
6. requiere área cuando el contrato o el rol la exijan;
7. requiere check-in únicamente cuando el prerrequisito sea `T+C`;
8. un grant base almacenado para ese permiso es incompatible;
9. la jerarquía administrativa no sustituye el carril operativo;
10. sin allow operativo coincidente se aplica default deny.

No significa:

- cualquier trabajador con turno;
- cualquier rol operativo;
- cualquier sede;
- cualquier área;
- acceso desde dispositivo por estar configurado.

---

#### 9. `BASE_OR_OPERATIONAL`

Significa:

```text
el carril base
o
el carril operativo
pueden producir una autorización completa
de manera independiente
```

Reglas:

1. ambos carriles son aplicables;
2. cada carril conserva grants, alcance, contexto y denegaciones propios;
3. un `ALLOW` completo en cualquiera puede autorizar;
4. un carril `UNAVAILABLE`, `INVALID` o `DENY` no destruye automáticamente un
   `ALLOW` válido del otro;
5. un actor-wide deny o structural deny transversal sí bloquea ambos;
6. no se mezclan fragmentos incompletos de cada carril;
7. no se suman dos medias autorizaciones;
8. la decisión deberá registrar qué carril o carriles autorizaron.

Ejemplos:

```text
BASE ALLOW
OPERATIONAL DENY
→ ALLOW por BASE
```

```text
BASE DENY
OPERATIONAL ALLOW
→ ALLOW por OPERATIONAL
```

```text
BASE DENY
OPERATIONAL DENY
→ DENY
```

---

#### 10. `BASE_AND_OPERATIONAL`

Significa:

```text
el carril base
y
el carril operativo
deben producir autorización completa
para el mismo actor, permiso, solicitud y recurso
```

Reglas:

1. ambos carriles son obligatorios;
2. ambos deberán quedar `ALLOW`;
3. ambos corresponden al mismo actor efectivo;
4. ambos evalúan la misma clave canónica;
5. ambos evalúan el mismo recurso resuelto;
6. cada carril conserva sus propias fuentes;
7. no se exige que los allows provengan del mismo tipo de sujeto;
8. un allow de rol base y uno individual operativo pueden combinarse;
9. una denegación o ausencia de allow en cualquiera produce `DENY`;
10. un carril `UNAVAILABLE`, `INVALID` o `NOT_APPLICABLE` produce `DENY`.

Ejemplo válido:

```text
rol base
→ allow administrativo

excepción operativa individual
→ allow operativo

mismo actor
+
mismo recurso
+
ambos válidos
→ ALLOW
```

---

#### 11. `required_lanes`

`required_lanes` se deriva exclusivamente de la modalidad.

| Modalidad              | `required_lanes`          |
| ---------------------- | ------------------------- |
| `BASE_ONLY`            | `["BASE"]`                |
| `OPERATIONAL_ONLY`     | `["OPERATIONAL"]`         |
| `BASE_OR_OPERATIONAL`  | `["BASE", "OPERATIONAL"]` |
| `BASE_AND_OPERATIONAL` | `["BASE", "OPERATIONAL"]` |

Para las dos modalidades híbridas, la diferencia no está en la lista, sino
en la regla de combinación.

---

#### 12. `combination`

La combinación se deriva así:

| Modalidad              | Combinación conceptual |
| ---------------------- | ---------------------- |
| `BASE_ONLY`            | `BASE_ONLY`            |
| `OPERATIONAL_ONLY`     | `OPERATIONAL_ONLY`     |
| `BASE_OR_OPERATIONAL`  | `ANY_APPLICABLE_LANE`  |
| `BASE_AND_OPERATIONAL` | `ALL_REQUIRED_LANES`   |

`combination` no es una segunda fuente editable.

Regla:

```text
authorization_requirement
→ required_lanes
→ combination
```

Una contradicción entre estos valores produce:

```text
AUTHORIZATION_REQUIREMENT_DERIVATION_MISMATCH
```

y decisión final `DENY`.

---

#### 13. Derivación de `is_operational`

`is_operational` es una propiedad derivada.

| Modalidad              | `is_operational` |
| ---------------------- | ---------------: |
| `BASE_ONLY`            |          `false` |
| `OPERATIONAL_ONLY`     |           `true` |
| `BASE_OR_OPERATIONAL`  |           `true` |
| `BASE_AND_OPERATIONAL` |           `true` |

No podrá editarse de forma independiente.

Contradicciones como:

```text
BASE_ONLY + is_operational = true
```

o:

```text
OPERATIONAL_ONLY + is_operational = false
```

producen:

```text
OPERATIONAL_CLASSIFICATION_MISMATCH
```

y fail closed.

---

#### 14. Prerrequisito del carril base

La proyección contractual utiliza:

```ts
base_prerequisite: "N" | "NOT_APPLICABLE";
```

Reglas:

| Modalidad              | `base_prerequisite` |
| ---------------------- | ------------------- |
| `BASE_ONLY`            | `N`                 |
| `OPERATIONAL_ONLY`     | `NOT_APPLICABLE`    |
| `BASE_OR_OPERATIONAL`  | `N`                 |
| `BASE_AND_OPERATIONAL` | `N`                 |

`N` significa:

```text
el carril base
no depende de turno ni check-in
```

No significa:

- sin permiso;
- sin recurso;
- sin alcance;
- sin denegaciones;
- sin sensibilidad;
- sin restricciones de dispositivo.

---

#### 15. Prerrequisito del carril operativo

La proyección contractual utiliza:

```ts
operational_prerequisite:
  | "T"
  | "T+C"
  | "NOT_APPLICABLE";
```

Reglas:

1. `BASE_ONLY` exige `NOT_APPLICABLE`;
2. cualquier modalidad con carril operativo exige `T` o `T+C`;
3. `T` exige turno y no exige check-in;
4. `T+C` exige turno y check-in;
5. no existe `C` sin turno;
6. un check-in incompatible bloquea aunque el permiso sea `T`;
7. el valor procede de AUTH-CAT-012;
8. la modalidad no permite inferir `T` o `T+C`.

---

#### 16. Combinaciones inválidas de prerrequisito

Son inválidas:

```text
BASE_ONLY + operational_prerequisite = T
BASE_ONLY + operational_prerequisite = T+C
```

```text
OPERATIONAL_ONLY + operational_prerequisite = NOT_APPLICABLE
```

```text
BASE_OR_OPERATIONAL + operational_prerequisite = NOT_APPLICABLE
```

```text
BASE_AND_OPERATIONAL + operational_prerequisite = NOT_APPLICABLE
```

```text
requires_shift = false
requires_checkin = true
```

Resultado:

```text
WORK_PREREQUISITE_CONTRACT_INVALID
→ structural deny de la decisión
→ DENY
```

---

#### 17. Requisito de área operativa

La clasificación canónica es:

```ts
type OperationalAreaRequirement =
  | "REQUIRED"
  | "SITE_SUFFICIENT"
  | "NOT_APPLICABLE";
```

Reglas:

1. `BASE_ONLY` exige `NOT_APPLICABLE`;
2. las modalidades con carril operativo exigen `REQUIRED` o
   `SITE_SUFFICIENT`;
3. `REQUIRED` exige área activa y compatible;
4. `SITE_SUFFICIENT` permite evaluación a nivel de sede únicamente cuando el
   rol y el recurso también lo permiten;
5. `SITE_SUFFICIENT` no significa todas las áreas;
6. la restricción del rol puede exigir área aunque el permiso sea
   `SITE_SUFFICIENT`;
7. el área procede del turno;
8. el dispositivo y el cliente no crean área.

El booleano legacy o serializado:

```text
requires_active_area
```

deberá derivarse de esta clasificación y no sustituirla.

---

#### 18. Compatibilidad con dispositivo compartido

La clasificación canónica es:

```ts
type SharedDeviceRequirement =
  | "STANDARD_ACTOR_SESSION"
  | "STRONG_REAUTH_REQUIRED"
  | "NOT_ALLOWED";
```

Reglas:

- `STANDARD_ACTOR_SESSION` permite continuar con sesión válida y demás
  restricciones;
- `STRONG_REAUTH_REQUIRED` exige evidencia fuerte adicional;
- `NOT_ALLOWED` exige sesión personal;
- el PIN ligero no satisface reautenticación fuerte;
- el dispositivo solo restringe;
- el dispositivo no cambia la modalidad;
- un valor ausente o desconocido deniega desde dispositivo compartido.

La clasificación se proyecta mediante el campo contractual equivalente a:

```text
device_policy_code
```

No se infiere desde sensibilidad ni desde la aplicación.

---

#### 19. Sensibilidad

La proyección deberá conservar:

```text
is_sensitive
sensitivity_reason_codes
```

o su representación contractual equivalente.

Reglas:

1. sensibilidad no cambia la modalidad;
2. lectura puede ser sensible;
3. mutación puede no ser sensible;
4. un permiso sensible puede existir en cualquier modalidad;
5. sensibilidad puede exigir controles adicionales;
6. los controles no sustituyen grants;
7. los controles no eliminan denegaciones;
8. los controles no convierten un carril inválido en válido;
9. propietario y gerente general no reciben bypass;
10. un permiso sensible debe conservar al menos una razón documental.

Una contradicción entre `is_sensitive` y sus razones produce:

```text
SENSITIVITY_CONTRACT_INVALID
```

---

#### 20. Reautenticación fuerte

La exigencia de reautenticación fuerte puede derivarse de:

- `shared_device_requirement = STRONG_REAUTH_REQUIRED`;
- política sensible específica;
- contrato de la operación;
- política de recurso.

La modalidad no la determina.

Reglas:

```text
BASE_ONLY
```

puede exigir reautenticación fuerte.

```text
OPERATIONAL_ONLY
```

puede no exigirla.

La evidencia se evalúa por solicitud y no se conserva como autoridad
permanente.

---

#### 21. Compatibilidad con simulación

La clasificación canónica es:

```ts
type SimulationRequirement =
  | "FULL_PREVIEW"
  | "DECISION_ONLY"
  | "NOT_ALLOWED";
```

Reglas:

- no cambia la modalidad real;
- no crea grants;
- no crea turno;
- no crea check-in;
- no crea reautenticación fuerte;
- no permite mutaciones reales;
- `NOT_ALLOWED` impide utilizar el permiso como permiso simulado;
- un valor ausente o desconocido deniega la simulación;
- el resultado simulado nunca sustituye la decisión real.

---

#### 22. Contrato de recurso

Todo permiso activo deberá referenciar:

```text
resource_contract_id
```

El contrato define:

- forma de solicitud;
- tipo de recurso;
- territorio;
- lados requeridos;
- propiedad;
- estado;
- campos;
- concurrencia;
- idempotencia;
- reglas de colección, agregado o lote.

La modalidad no sustituye el contrato de recurso.

Un permiso sin contrato requerido produce:

```text
RESOURCE_CONTRACT_MISSING
→ structural deny
→ DENY
```

AUTH-CTX-018 resolverá el recurso concreto.

---

#### 23. Dependencias de permisos

El snapshot puede declarar:

```text
dependency_permission_keys: string[]
```

Reglas:

1. cada dependencia es una clave canónica exacta;
2. no se infiere por prefijo;
3. no se infiere `app.access` automáticamente;
4. no se crea dependencia por pertenecer al mismo módulo;
5. la dependencia conserva su propia modalidad;
6. aprobar una dependencia no autoriza el permiso principal;
7. fallar una dependencia obligatoria produce `DENY`;
8. ciclos o dependencias inexistentes invalidan el contrato;
9. el orden de evaluación debe ser determinista;
10. la decisión principal registra el resultado como prerrequisito.

---

#### 24. Fuente exclusiva del catálogo

`authorization_requirement` se obtiene exclusivamente de la versión publicada
del permiso.

No se obtiene de:

- `role_permissions`;
- `operational_role_permissions`;
- `employee_permissions`;
- nombre del rol;
- aplicación;
- módulo;
- recurso;
- acción;
- ruta;
- pantalla;
- dispositivo;
- turno;
- check-in;
- sede;
- área;
- método HTTP;
- código legacy.

La presencia de un grant en una tabla incompatible no cambia la modalidad.

---

#### 25. Asignaciones incompatibles

##### `BASE_ONLY`

Admite:

- grants base;
- denegaciones base;
- denegaciones transversales.

No admite como allow efectivo:

- grant operativo;
- excepción operativa.

##### `OPERATIONAL_ONLY`

Admite:

- grants operativos;
- denegaciones operativas;
- denegaciones transversales.

No admite como allow efectivo:

- grant base;
- excepción base.

##### `BASE_OR_OPERATIONAL`

Admite grants compatibles en ambos carriles.

##### `BASE_AND_OPERATIONAL`

Requiere grants compatibles en ambos carriles.

Una asignación en carril incompatible:

```text
INCOMPATIBLE_AUTHORIZATION_LANE
```

No funciona como fallback ni compatibilidad automática.

---

#### 26. Modalidad ausente

```text
authorization_requirement = null
```

significa:

```text
contrato incompleto
```

Resultado:

```text
AUTHORIZATION_REQUIREMENT_MISSING
→ structural deny
→ final_decision = DENY
```

No se utilizará como default:

```text
BASE_OR_OPERATIONAL
```

porque sería la opción más permisiva.

---

#### 27. Modalidad desconocida

Un valor distinto del enum produce:

```text
AUTHORIZATION_REQUIREMENT_INVALID
→ structural deny
→ final_decision = DENY
```

No se normaliza, traduce ni aproxima.

---

#### 28. Contradicción entre catálogo y dataset

El permiso publicado, el dataset TypeScript, las matrices y el evaluador
deberán concordar.

Ejemplos:

```text
catálogo = BASE_ONLY
dataset operativo = asignación allow
```

```text
catálogo = OPERATIONAL_ONLY
dataset base = asignación allow
```

```text
catálogo = BASE_AND_OPERATIONAL
evaluador utiliza OR
```

Resultado:

```text
PERMISSION_CONTRACT_INTEGRITY_INVALID
→ structural deny
→ DENY
```

No se elegirá la fuente más permisiva.

---

#### 29. Aliases

Un alias no posee modalidad independiente.

Regla:

```text
alias
→ adaptador aprobado
→ clave canónica
→ modalidad de la clave canónica
```

Queda prohibido:

- asignar modalidad al alias;
- cambiar modalidad mediante alias;
- mantener evaluación doble;
- usar el alias para evitar un carril;
- usar un alias uno-a-muchos como permiso único.

AUTH-CTX-028 diseñará la compatibilidad temporal.

---

#### 30. Claves legacy y retiradas

Una clave legacy no puede introducir una modalidad distinta.

Casos:

- mapping uno-a-uno aprobado: hereda la modalidad canónica;
- mapping uno-a-muchos: requiere descomposición;
- clave retirada: no se evalúa;
- clave técnica: no se asigna;
- clave amplia pendiente: no recibe modalidad permisiva por defecto.

La compatibilidad no se implementa dentro de AUTH-CTX-017.

---

#### 31. Permiso inactivo o inexistente

Si AUTH-CTX-016 determinó:

- aplicación inexistente;
- aplicación inactiva;
- permiso inexistente;
- permiso inactivo;
- permiso retirado;

AUTH-CTX-017 no proyectará una modalidad utilizable.

Resultado:

```text
final_decision = DENY
```

No se consultan matrices ni contexto para compensar una capacidad inválida.

---

#### 32. Relación con `lane_readiness`

`lane_readiness` describe si cada carril está estructuralmente disponible.

`authorization_requirement` describe si el permiso admite ese carril.

Composición:

```text
carril admitido por modalidad
+
carril estructuralmente READY
→ puede evaluarse
```

```text
carril no admitido por modalidad
→ NOT_APPLICABLE
```

```text
carril admitido pero UNAVAILABLE
→ no produce ALLOW
```

```text
carril admitido pero INVALID
→ no produce ALLOW
```

`BASE_OR_OPERATIONAL` puede continuar con el carril alternativo.

`BASE_AND_OPERATIONAL` no puede.

---

#### 33. Problemas de `AccessContext` y problemas de decisión

Los problemas definidos en AUTH-CTX-015 pertenecen a:

```text
AccessContext.structural_issues
```

Las incoherencias del contrato del permiso pertenecen a:

```text
AuthorizationDecision.structural_denies
```

No se modificarán retroactivamente los issues del contexto por una modalidad
inválida.

Códigos iniciales de decisión reservados:

```text
AUTHORIZATION_REQUIREMENT_MISSING
AUTHORIZATION_REQUIREMENT_INVALID
AUTHORIZATION_REQUIREMENT_DERIVATION_MISMATCH
OPERATIONAL_CLASSIFICATION_MISMATCH
WORK_PREREQUISITE_CONTRACT_INVALID
OPERATIONAL_AREA_REQUIREMENT_INVALID
SHARED_DEVICE_REQUIREMENT_INVALID
SENSITIVITY_CONTRACT_INVALID
SIMULATION_REQUIREMENT_INVALID
RESOURCE_CONTRACT_MISSING
PERMISSION_DEPENDENCY_INVALID
INCOMPATIBLE_AUTHORIZATION_LANE
PERMISSION_CONTRACT_INTEGRITY_INVALID
PERMISSION_CONTRACT_VERSION_MISMATCH
```

AUTH-CTX-023 congelará su exposición en `blocked_reasons`.

---

#### 34. Evaluación del carril base

AUTH-CTX-019 deberá:

1. confirmar que la modalidad admite base;
2. marcar `NOT_APPLICABLE` cuando no lo admite;
3. consumir `lane_readiness.base`;
4. validar actor laboral y empleado;
5. validar rol base y cobertura;
6. evaluar denegaciones transversales;
7. evaluar denegaciones base;
8. buscar allows base;
9. comparar alcance y recurso;
10. aplicar sensibilidad, dispositivo y dependencias;
11. producir `ALLOW` o `DENY`.

No tomará prestado contexto operativo.

---

#### 35. Evaluación del carril operativo

AUTH-CTX-020 deberá:

1. confirmar que la modalidad admite operación;
2. marcar `NOT_APPLICABLE` cuando no la admite;
3. consumir `lane_readiness.operational`;
4. exigir turno;
5. exigir check-in cuando sea `T+C`;
6. validar conflictos de check-in aunque sea `T`;
7. validar rol operativo;
8. validar sede;
9. validar área cuando aplique;
10. validar dispositivo;
11. evaluar denegaciones transversales;
12. evaluar denegaciones operativas;
13. buscar allows operativos;
14. comparar recurso y territorio;
15. aplicar sensibilidad y dependencias;
16. producir `ALLOW` o `DENY`.

Un allow operativo no crea ninguno de sus prerrequisitos.

---

#### 36. Denegaciones y precedencia

La modalidad selecciona qué carriles participan.

Después se aplica:

```text
STRUCTURAL DENY
>
ACTOR-WIDE DENY
>
MATCHING LANE DENY
>
MATCHING LANE ALLOW
>
DEFAULT DENY
```

Reglas:

- más allows no superan un deny aplicable;
- `BASE_OR_OPERATIONAL` conserva independencia entre denegaciones limitadas a
  carril;
- una denegación transversal bloquea ambos;
- `BASE_AND_OPERATIONAL` falla cuando cualquier carril falla;
- una denegación no cambia la modalidad.

---

#### 37. Actores no laborales

La modalidad pertenece al permiso, no al actor.

Por tanto, un permiso `BASE_ONLY` continúa siendo `BASE_ONLY` aunque el actor
sea cliente o sistema.

La decisión deberá:

- marcar carriles no aplicables según el tipo de actor y contrato;
- no convertir un cliente en empleado;
- no inventar carril base laboral;
- no inventar carril operativo;
- utilizar contratos de sistema o cliente cuando estén expresamente
  definidos.

La inclusión de `pass` en el catálogo no convierte la sesión normal de cliente
en RBAC laboral.

---

#### 38. Dispositivo compartido

La modalidad no cambia al ejecutarse desde dispositivo.

Ejemplo:

```text
BASE_ONLY
+
shared_device_requirement = STRONG_REAUTH_REQUIRED
```

continúa siendo `BASE_ONLY`.

El dispositivo añade restricciones:

- aplicación permitida;
- paquete permitido;
- actor válido;
- territorio compatible;
- reautenticación;
- exclusiones `NOT_ALLOWED`.

No añade un carril ni un grant.

---

#### 39. Sensibilidad y modalidad

Combinaciones válidas:

```text
BASE_ONLY + sensible
OPERATIONAL_ONLY + sensible
BASE_OR_OPERATIONAL + sensible
BASE_AND_OPERATIONAL + sensible
```

y las mismas modalidades no sensibles.

La sensibilidad:

- no convierte base en operación;
- no convierte operación en base;
- no convierte OR en AND;
- no convierte AND en OR;
- no amplía alcance;
- no elimina un permiso.

---

#### 40. Simulación y modalidad

La simulación utiliza la misma modalidad para calcular la decisión
hipotética.

Reglas:

- `BASE_ONLY` simulado evalúa base hipotética;
- `OPERATIONAL_ONLY` simulado evalúa operación hipotética;
- `BASE_OR_OPERATIONAL` simulado conserva alternativas;
- `BASE_AND_OPERATIONAL` simulado exige ambos;
- `simulation_requirement` puede impedir o limitar la vista;
- ningún resultado simulado es ejecutable.

---

#### 41. Recurso y territorio

La modalidad no indica:

- si el recurso es organizacional;
- si pertenece a una sede;
- si pertenece a un área;
- si tiene origen y destino;
- si es una colección;
- si es una operación masiva;
- si pertenece al actor;
- si está en estado editable.

AUTH-CTX-018 deberá resolver esas dimensiones.

Un carril solo puede autorizar cuando su grant y contexto coinciden con el
recurso resuelto.

---

#### 42. Una decisión por permiso

Cada `AuthorizationDecision` conserva una única modalidad correspondiente a
una única clave canónica.

No se admiten dentro del mismo campo:

- varias modalidades;
- modalidad condicional enviada por cliente;
- modalidad dependiente de ruta;
- modalidad dependiente de rol;
- modalidad dependiente de sede;
- lista de permisos;
- expresión booleana de permisos.

Las operaciones compuestas deberán evaluar cada capacidad o declarar un
contrato compuesto explícito en AUTH-CTX-026.

---

#### 43. Versionado

Cambiar la modalidad de un permiso activo es un cambio contractual.

Ejemplos:

```text
BASE_OR_OPERATIONAL
→ OPERATIONAL_ONLY
```

puede retirar autoridad base.

```text
OPERATIONAL_ONLY
→ BASE_OR_OPERATIONAL
```

puede ampliar autoridad sin turno.

Todo cambio requiere:

1. decisión documental;
2. análisis de impacto;
3. nueva versión del catálogo;
4. diff contractual;
5. revisión de matrices;
6. revisión de denegaciones;
7. revisión de dispositivo;
8. revisión de simulación;
9. migración versionada;
10. pruebas;
11. compatibilidad;
12. actualización documental.

---

#### 44. Snapshot e inmutabilidad

La decisión deberá capturar la modalidad exacta utilizada.

Una decisión histórica no cambia cuando se publica una versión posterior.

Regla:

```text
decisión
→ catálogo_versionado
→ modalidad_inmutable
```

No se volverá a interpretar una decisión histórica con la modalidad actual.

AUTH-CTX-024 conservará versión y hash.

---

#### 45. Catálogo o dataset obsoleto

Si el evaluador detecta que:

- catálogo;
- schema;
- hash;
- tipos generados;
- matrices;
- política de dispositivo;

pertenecen a versiones incompatibles:

```text
PERMISSION_CONTRACT_VERSION_MISMATCH
→ structural deny
→ DENY
```

No se mezclan snapshots de versiones distintas.

AUTH-CTX-029 definirá invalidación.

---

#### 46. Orden de resolución

```text
1. validar aplicación y permiso mediante AUTH-CTX-016
2. cargar PermissionContractSnapshot exacto
3. validar catálogo, versión y hash
4. validar authorization_requirement
5. derivar required_lanes
6. derivar combination
7. validar is_operational
8. validar base_prerequisite
9. validar operational_prerequisite
10. validar operational_area_requirement
11. validar shared_device_requirement
12. validar sensibilidad
13. validar simulation_requirement
14. validar resource_contract_id
15. validar dependencias
16. comprobar integridad del contrato
17. producir authorization_requirement
18. continuar a resolución de recurso
```

No se consultan allows antes de completar este orden.

---

#### 47. Determinismo

Para la misma:

- clave canónica;
- versión de catálogo;
- hash;
- definición de permiso;
- snapshot de configuración;

la proyección deberá ser idéntica.

No dependerá de:

- rol;
- actor;
- aplicación abierta;
- tabla donde existe un grant;
- turno;
- check-in;
- dispositivo;
- recurso;
- ruta;
- cliente;
- orden de filas;
- caché sin versión.

---

#### 48. Casos de ejemplo

##### Caso A — Consulta administrativa pura

```text
permission = viso.workforce.employees.view
authorization_requirement = BASE_ONLY
```

Resultado:

```text
required_lanes = [BASE]
operational_decision = NOT_APPLICABLE
```

Turno y check-in no se exigen por modalidad.

##### Caso B — Preparar una remisión

```text
permission = nexo.inventory.remissions.prepare
authorization_requirement = OPERATIONAL_ONLY
operational_prerequisite = T+C
```

Resultado:

```text
required_lanes = [OPERATIONAL]
turno requerido
check-in requerido
```

Un grant base no autoriza.

##### Caso C — Consultar remisiones

```text
permission = nexo.inventory.remissions.view
authorization_requirement = BASE_OR_OPERATIONAL
```

Resultado:

```text
gerencia puede autorizar por base
trabajador puede autorizar por operación
```

Cada carril conserva alcance y recurso.

##### Caso D — Entrada excepcional

```text
permission = nexo.inventory.entries.override
authorization_requirement = BASE_AND_OPERATIONAL
```

Resultado:

```text
base ALLOW
+
operational ALLOW
=
posible ALLOW final
```

Un solo carril es insuficiente.

##### Caso E — Base válida y operativo inválido en OR

```text
authorization_requirement = BASE_OR_OPERATIONAL
base = ALLOW
operational = INVALID
sin structural deny transversal
```

Resultado:

```text
ALLOW por base
```

##### Caso F — Base válida y operativo inválido en AND

```text
authorization_requirement = BASE_AND_OPERATIONAL
base = ALLOW
operational = INVALID
```

Resultado:

```text
DENY
```

##### Caso G — Modalidad ausente

```text
authorization_requirement = null
```

Resultado:

```text
AUTHORIZATION_REQUIREMENT_MISSING
DENY
```

##### Caso H — Matriz incompatible

```text
permission = OPERATIONAL_ONLY
allow almacenado en role_permissions
```

Resultado:

```text
INCOMPATIBLE_AUTHORIZATION_LANE
el allow no coincide
DENY si no existe allow operativo válido
```

##### Caso I — Permiso `T` sin check-in

```text
modalidad admite operación
operational_prerequisite = T
active_shift válido
active_checkin_session = null
```

Resultado:

```text
la evaluación operativa puede continuar
```

##### Caso J — Permiso `T+C` sin check-in

```text
operational_prerequisite = T+C
active_checkin_session = null
```

Resultado:

```text
prerrequisito FAIL
carril operativo DENY
```

En `BASE_OR_OPERATIONAL`, el base todavía puede autorizar.

##### Caso K — Área `SITE_SUFFICIENT`

```text
operational_area_requirement = SITE_SUFFICIENT
rol site-wide
recurso a nivel sede
```

Resultado:

```text
puede continuar sin área
```

No significa todas las áreas.

##### Caso L — Dispositivo `NOT_ALLOWED`

```text
permission válida
authorization_requirement = BASE_ONLY
shared_device_requirement = NOT_ALLOWED
principal = SHARED_DEVICE
```

Resultado:

```text
device_decision = FAIL
DENY
```

La modalidad base no crea bypass.

##### Caso M — Sensible sin reautenticación

```text
permiso sensible
política exige reautenticación
sin evidencia vigente
```

Resultado:

```text
sensitivity_decision = FAIL
DENY
```

La modalidad permanece sin cambios.

##### Caso N — Alias uno-a-uno

```text
alias legacy
→ adaptador versionado
→ clave canónica
```

Resultado:

```text
usar modalidad de la clave canónica
```

##### Caso O — Alias uno-a-muchos

```text
alias amplio
→ varias capacidades
```

Resultado:

```text
no existe una modalidad única evaluable
requiere descomposición
DENY
```

---

#### 49. Antipatrones prohibidos

```ts
const requirement =
  permission.authorization_requirement ??
  "BASE_OR_OPERATIONAL";

const requirement =
  operationalRolePermissions.has(permissionKey)
    ? "OPERATIONAL_ONLY"
    : "BASE_ONLY";

if (employee.role === "propietario") {
  requirement = "BASE_ONLY";
}

if (activeShift) {
  requirement = "OPERATIONAL_ONLY";
}

if (device.capabilities.includes(permissionKey)) {
  requirement = "BASE_OR_OPERATIONAL";
}
```

También queda prohibido:

```text
grant base → convertir permiso en BASE_ONLY
grant operativo → convertir permiso en OPERATIONAL_ONLY
permiso en ambas matrices → convertir en BASE_OR_OPERATIONAL
permiso sensible → convertir en BASE_AND_OPERATIONAL
falta de turno → degradar a BASE_ONLY
falta de check-in → degradar T+C a T
falta de área → degradar REQUIRED a SITE_SUFFICIENT
dispositivo compartido → cambiar modalidad
propietario → saltar carril operativo
alias → crear modalidad propia
```

---

#### 50. Relación con tareas posteriores

##### AUTH-CTX-018

Resolverá el recurso y territorio exigidos por `resource_contract_id`.

##### AUTH-CTX-019

Evaluará el carril base cuando la modalidad lo admita.

##### AUTH-CTX-020

Evaluará el carril operativo cuando la modalidad lo admita.

##### AUTH-CTX-021

Resolverá allows compatibles con el carril y la modalidad.

##### AUTH-CTX-022

Resolverá denegaciones estructurales, transversales y por carril.

##### AUTH-CTX-023

Aplicará:

- modalidad;
- combinación;
- prerrequisitos;
- dispositivo;
- sensibilidad;
- dependencias;
- razones;
- default deny;
- decisión final.

##### AUTH-CTX-024

Registrará:

- modalidad;
- versión;
- hash;
- carriles requeridos;
- combinación;
- prerrequisitos;
- resultado por carril;
- razones.

##### AUTH-CTX-025

Diseñará `get_access_context`; no decidirá la modalidad del permiso.

##### AUTH-CTX-026

Diseñará `evaluate_authorization` y la proyección canónica del contrato del
permiso.

##### AUTH-CTX-027

Impedirá que aplicaciones, rutas, guards, RPC o componentes reinterpreten la
modalidad.

##### AUTH-CTX-028

Diseñará compatibilidad con:

- permisos legacy;
- aliases;
- asignaciones en carril incompatible;
- campos legacy de contexto;
- consumidores que infieren modalidad;
- funciones actuales separadas.

##### AUTH-CTX-029

Definirá invalidación por cambios del catálogo, modalidad y datasets.

##### AUTH-CTX-030

Definirá pruebas contractuales de:

- cuatro modalidades;
- derivaciones;
- `N`, `T`, `T+C`;
- área;
- dispositivo;
- sensibilidad;
- simulación;
- recurso;
- dependencias;
- aliases;
- versiones;
- fail closed.

##### AUTH-DB-006 a AUTH-DB-010

Implementarán consumo del contexto y permiso exactos en RPC sensibles.

##### AUTH-DB-020

Implementará compatibilidad temporal y migración de asignaciones
incompatibles.

##### AUTH-DB-027

Probará integridad del catálogo, matrices, RPC, RLS y migraciones.

##### AUTH-DB-030

Retirará inferencias y contratos legacy después de adopción comprobada.

##### AUTH-DB-031

Certificará paridad documental, técnica y operativa.

---

#### 51. Fuera del alcance

AUTH-CTX-017 no:

- cambia modalidades;
- agrega modalidades;
- reclasifica permisos;
- modifica 140 permisos;
- modifica matrices;
- crea grants;
- crea denegaciones;
- resuelve recursos;
- decide alcance;
- decide propiedad;
- decide territorio;
- evalúa carril base;
- evalúa carril operativo;
- resuelve allows;
- resuelve denegaciones coincidentes;
- produce decisión final completa;
- implementa reautenticación;
- implementa simulación;
- crea contratos de recurso;
- crea tipos físicos;
- crea funciones SQL;
- crea RPC;
- crea RLS;
- crea migraciones;
- modifica Supabase;
- modifica aplicaciones.

Cada responsabilidad posterior tiene destino explícito en la sección 50.

---

#### 52. Riesgos controlados

##### Riesgo 1 — Modalidad derivada de la matriz

Control:

```text
fuente única = catálogo del permiso
```

##### Riesgo 2 — Default permisivo

Control:

```text
modalidad ausente
→ DENY
```

##### Riesgo 3 — Carriles incompletos mezclados

Control:

```text
cada carril produce una decisión completa
```

##### Riesgo 4 — OR tratado como AND o AND tratado como OR

Control:

```text
combination derivada e inmutable
```

##### Riesgo 5 — Check-in exigido a todo permiso operativo

Control:

```text
T y T+C separados
```

##### Riesgo 6 — Área nula interpretada como wildcard

Control:

```text
REQUIRED / SITE_SUFFICIENT / NOT_APPLICABLE
```

##### Riesgo 7 — Dispositivo cambia modalidad

Control:

```text
dispositivo solo restringe
```

##### Riesgo 8 — Modalidad histórica reinterpretada

Control:

```text
snapshot versionado e inmutable
```

---

#### 53. Criterios de aprobación

AUTH-CTX-017 podrá aprobarse cuando se acepte que:

1. `authorization_requirement` conserva la forma contractual aprobada;
2. su fuente única es `PermissionContractSnapshot`;
3. la representación resumida no crea una segunda fuente;
4. solo existen cuatro modalidades;
5. no existe valor nulo permisivo;
6. la modalidad responde únicamente qué carriles pueden autorizar;
7. `BASE_ONLY` evalúa únicamente base;
8. `OPERATIONAL_ONLY` evalúa únicamente operación;
9. `BASE_OR_OPERATIONAL` acepta un carril completo válido;
10. `BASE_AND_OPERATIONAL` exige ambos carriles completos;
11. OR no mezcla medias autorizaciones;
12. AND usa el mismo actor, permiso, solicitud y recurso;
13. `required_lanes` se deriva;
14. `combination` se deriva;
15. `is_operational` se deriva;
16. contradicciones de derivación fallan cerrado;
17. el carril base usa `N`;
18. el carril operativo usa `T` o `T+C`;
19. check-in sin turno es combinación inválida;
20. `BASE_ONLY` no contiene prerrequisito operativo;
21. modalidades operativas no usan prerrequisito `NOT_APPLICABLE`;
22. el requisito de área permanece independiente;
23. solo existen `REQUIRED`, `SITE_SUFFICIENT` y `NOT_APPLICABLE`;
24. `SITE_SUFFICIENT` no significa todas las áreas;
25. la restricción del rol puede exigir área;
26. la compatibilidad con dispositivo permanece independiente;
27. solo existen `STANDARD_ACTOR_SESSION`,
    `STRONG_REAUTH_REQUIRED` y `NOT_ALLOWED`;
28. PIN ligero no satisface reautenticación fuerte;
29. sensibilidad no cambia modalidad;
30. simulación no cambia modalidad;
31. el contrato de recurso es obligatorio cuando corresponde;
32. dependencias usan claves exactas;
33. aprobar una dependencia no autoriza el permiso principal;
34. la matriz no define modalidad;
35. el rol no define modalidad;
36. el turno no define modalidad;
37. el dispositivo no define modalidad;
38. una asignación en carril incompatible no autoriza;
39. modalidad ausente produce structural deny;
40. modalidad desconocida produce structural deny;
41. no existe default `BASE_OR_OPERATIONAL`;
42. aliases heredan la modalidad canónica;
43. aliases one-to-many requieren descomposición;
44. permisos retirados no se evalúan;
45. permisos inactivos no proyectan modalidad utilizable;
46. `lane_readiness` y modalidad permanecen separados;
47. los issues de contexto y de decisión permanecen separados;
48. AUTH-CTX-019 evaluará el carril base;
49. AUTH-CTX-020 evaluará el carril operativo;
50. la precedencia de denegaciones se conserva;
51. un actor no cambia la modalidad;
52. `pass` no convierte clientes en trabajadores;
53. una decisión evalúa una sola capacidad;
54. cambiar modalidad exige nueva versión;
55. la decisión histórica conserva su modalidad;
56. versiones incompatibles fallan cerrado;
57. la proyección es determinista;
58. AUTH-CTX-018 a AUTH-CTX-024 completarán la decisión;
59. AUTH-CTX-026 diseñará el evaluador;
60. AUTH-CTX-027 eliminará inferencias locales;
61. AUTH-CTX-028 gobernará compatibilidad legacy;
62. AUTH-CTX-029 gobernará invalidación;
63. AUTH-CTX-030 gobernará pruebas;
64. las tareas AUTH-DB indicadas tienen destinos físicos explícitos;
65. no se implementa código, migraciones ni cambios en Supabase.

---

#### 54. Estado final de la propuesta

| Tarea        | Estado      | Relación                  |
| ------------ | ----------- | ------------------------- |
| AUTH-CTX-016 | APROBADA    | Tarea anterior            |
| AUTH-CTX-017 | APROBADA    | Tarea actual              |
| AUTH-CTX-018 | NO INICIADA | Tarea siguiente reservada |

La continuidad propuesta queda:

```text
AUTH-CTX-016 — APROBADA
        ↓
AUTH-CTX-017 — APROBADA
        ↓
AUTH-CTX-018 — NO INICIADA
```

No se avanza a AUTH-CTX-018 hasta recibir aprobación explícita de
AUTH-CTX-017.


### ✅ AUTH-CTX-018 — Incluir recurso y territorio resueltos

**Estado:** APROBADA  
**Bloque:** BLOQUE E — Contexto y decisión de autorización unificados  
**Subbloque:** AUTHORIZATION DECISION  
**Naturaleza:** Definición documental de `ResolvedResourceContext` y `ResolvedTerritoryContext`  
**Implementación física:** No incluida  
**Tarea anterior vigente:** AUTH-CTX-017 — APROBADA  
**Tarea posterior reservada:** AUTH-CTX-019 — Incluir decisión del carril base  
**Contrato afectado:** `AuthorizationDecision@1.0.0`  
**Campo principal afectado:** `resource`  
**Tipos principales afectados:** `ResolvedResourceContext`, `ResolvedTerritoryContext`  
**Fuente normativa:** `resource_contract_id` del permiso canónico solicitado  
**Cambio contractual:** Aclaración normativa compatible; no cambia la forma publicada  
**Cambios físicos permitidos:** No

Esta tarea define cómo `AuthorizationDecision` resuelve el recurso empresarial
exacto sobre el cual se intenta ejecutar una capacidad y cómo deriva su
territorio real, estado, propiedad, sujeto, lados obligatorios, campos
protegidos y condiciones de concurrencia.

La regla central es:

```text
EL CONTEXTO DEL ACTOR
LIMITA
EL RECURSO REAL

EL CONTEXTO DEL ACTOR
NO CREA
NI REEMPLAZA
EL RECURSO O SU TERRITORIO
```

La tarea impide autorizar únicamente contra:

- un `site_id` enviado por el cliente;
- un `area_id` enviado por el cliente;
- la sede seleccionada;
- la sede primaria;
- la sede del turno;
- el área del turno;
- la sede del dispositivo;
- el último recurso consultado;
- una ruta;
- un nombre humano;
- un payload no normalizado.

No modifica contratos de recursos aprobados, no crea fuentes físicas, no
implementa resolvers, SQL, RPC, RLS, migraciones, transacciones, locks,
consultas, filtros ni cambios en Supabase.

---

#### 1. Objetivo

Definir el campo `resource` de manera que Vento OS pueda responder
inequívocamente:

1. cuál tipo de recurso exige el permiso;
2. qué forma de solicitud fue recibida;
3. si se trata de un recurso existente, borrador, colección, agregado,
   operación masiva o capacidad sin recurso;
4. cuál contrato de recurso gobierna la resolución;
5. qué identificadores empresariales exactos fueron resueltos;
6. qué versión o snapshot del recurso fue evaluado;
7. cuál es el sujeto empresarial objetivo;
8. quién es propietario, custodio, responsable o tercero relacionado;
9. cuál es la organización y unidad de negocio;
10. qué sedes y áreas pertenecen realmente al recurso;
11. cuáles son los tipos de área;
12. si existen origen y destino;
13. si participan rutas o vehículos;
14. si el recurso pertenece a un entorno aislado;
15. qué lados del recurso son obligatorios;
16. qué estado empresarial fue observado;
17. qué campos fueron solicitados y cómo se clasifican;
18. qué control de concurrencia o idempotencia aplica;
19. cuándo la resolución puede continuar;
20. cuándo debe fallar cerrado;
21. cómo se evalúan lecturas, creaciones, transiciones, agregados y lotes;
22. cómo se evita que un contexto válido autorice un recurso distinto;
23. cómo se preservan determinismo, inmutabilidad y auditoría;
24. qué tareas posteriores consumen la resolución.

---

#### 2. Base normativa

AUTH-CTX-018 conserva sin cambios las decisiones aprobadas en:

- ADR-AUTH-001;
- AUTH-MOD-013 a AUTH-MOD-017 — Alcances globales, por sede, tipo de sede,
  área y tipo de área;
- AUTH-MOD-018 — Precedencia entre carriles;
- AUTH-MOD-019 — Denegación explícita;
- AUTH-CAT-011 — Alcance permitido de cada permiso;
- AUTH-CAT-016 — Contratos de recurso;
- AUTH-CAT-017 — Dependencias de permisos;
- AUTH-CAT-018 — Tipos derivados;
- AUTH-CAT-024 — Publicación contractual;
- AUTH-RBAC-001 a AUTH-RBAC-028 — Matrices, excepciones y restricciones;
- AUTH-CTX-001 — `AccessContext`;
- AUTH-CTX-002 — Diseño de `AuthorizationDecision`;
- AUTH-CTX-004 — Versionado contractual;
- AUTH-CTX-009 — Cobertura administrativa;
- AUTH-CTX-013 — Sede y área operativas;
- AUTH-CTX-014 — Dispositivo compartido;
- AUTH-CTX-015 — Razones estructuradas;
- AUTH-CTX-016 — Aplicación y permiso solicitado;
- AUTH-CTX-017 — `authorization_requirement`.

Principios obligatorios:

```text
PERMISO EXACTO
+
RECURSO EXACTO
+
CONTEXTO EXACTO
=
UNIDAD DE EVALUACIÓN
```

```text
PERMISO SOBRE UN TIPO DE RECURSO
≠
AUTORIZACIÓN SOBRE TODOS LOS RECURSOS DE ESE TIPO
```

```text
TERRITORIO DEL ACTOR
≠
TERRITORIO DEL RECURSO
```

```text
PAYLOAD DEL CLIENTE
≠
RECURSO AUTORITATIVO
```

```text
NULL
≠
GLOBAL
```

```text
LISTA VACÍA
≠
TODOS
```

```text
RECURSO NO RESUELTO
→
DENY
```

---

#### 3. Forma contractual principal conservada

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

La forma no cambia.

AUTH-CTX-018 define la semántica y las invariantes de cada campo.

---

#### 4. Forma territorial conservada

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

Reglas contractuales heredadas:

- `null` no significa organización completa;
- una lista vacía no significa todos;
- cada área debe pertenecer a una sede correspondiente;
- origen y destino se evalúan cuando el contrato los exige;
- el alcance global continúa limitado al recurso exacto;
- global no atraviesa entornos aislados;
- un filtro del cliente puede reducir, nunca ampliar;
- la sede seleccionada no sustituye territorio;
- la sede primaria no sustituye territorio;
- el dispositivo solo restringe.

---

#### 5. Formas subordinadas clarificadas

Las formas subordinadas deberán preservar, como mínimo, la siguiente
semántica documental.

```ts
type ResolvedSubjectContext = {
  subject_type: string;
  subject_id: string;
  relationship_to_actor:
    | "SELF"
    | "OWNED"
    | "ASSIGNED"
    | "RELATED"
    | "THIRD_PARTY"
    | "SYSTEM";
  coherent: boolean;
};
```

```ts
type OwnershipContext = {
  owner_type:
    | "ACTOR"
    | "EMPLOYEE"
    | "CUSTOMER"
    | "ORGANIZATION"
    | "SITE"
    | "AREA"
    | "OTHER"
    | "NONE"
    | "UNKNOWN";

  owner_id: string | null;

  actor_relation:
    | "SELF"
    | "OWNED"
    | "ASSIGNED"
    | "RELATED"
    | "THIRD_PARTY"
    | "NOT_APPLICABLE"
    | "UNRESOLVED";

  coherent: boolean;
};
```

```ts
type TerritorySide = {
  site_id: string | null;
  area_id: string | null;
  area_kind: string | null;
  route_id: string | null;
  vehicle_id: string | null;
  coherent: boolean;
};
```

```ts
type ResolvedSideContext = {
  side_code: string;
  required: boolean;
  resource_type: string;
  resource_ids: string[];
  territory: TerritorySide | null;
  resolution_status:
    | "RESOLVED"
    | "MULTI_RESOLVED"
    | "NOT_APPLICABLE"
    | "UNRESOLVED"
    | "CONFLICT"
    | "ISOLATED";
};
```

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

Estas formas subordinadas no agregan campos a `ResolvedResourceContext`.

AUTH-CTX-026 deberá convertirlas en tipos físicos y schema compatibles.

AUTH-CTX-030 deberá probar sus invariantes.

---

#### 6. Fuente exclusiva: contrato de recurso

Toda resolución comienza en:

```text
permission_contract.resource_contract_id
```

El contrato de recurso deberá declarar, como mínimo:

- tipo de recurso esperado;
- forma o formas de solicitud admitidas;
- localizadores permitidos;
- fuente de verdad;
- relaciones necesarias;
- territorio requerido;
- sujeto requerido;
- propiedad requerida;
- lados obligatorios;
- estado relevante;
- campos protegidos;
- política de concurrencia;
- política de idempotencia;
- comportamiento de colección, agregado y lote;
- tratamiento de creación;
- tratamiento de entornos aislados.

No podrá inferirse el contrato desde:

- nombre del permiso;
- tabla consultada;
- aplicación;
- ruta;
- método HTTP;
- rol;
- contexto del actor;
- payload;
- primer recurso encontrado.

---

#### 7. Contrato ausente o incompatible

Si el permiso requiere recurso y:

```text
resource_contract_id = null
```

o el contrato no existe:

```text
resolution_status = UNRESOLVED
final_decision = DENY
```

Razón reservada:

```text
RESOURCE_CONTRACT_NOT_FOUND
```

Si la versión del contrato no es compatible:

```text
RESOURCE_CONTRACT_VERSION_MISMATCH
```

No se utilizará un contrato anterior, “latest” ni un contrato parecido.

---

#### 8. Resolución exclusiva en servidor

El cliente podrá aportar únicamente:

- localizadores;
- filtros permitidos;
- campos solicitados;
- borrador;
- intención de transición;
- clave de idempotencia;
- versión esperada;
- datos empresariales del comando.

El servidor deberá resolver:

- existencia;
- tipo;
- relaciones;
- sede;
- área;
- origen;
- destino;
- propietario;
- sujeto;
- estado;
- versión;
- campos;
- lados;
- entorno;
- coherencia.

No se aceptará como hecho autoritativo:

- `site_id`;
- `area_id`;
- `owner_id`;
- `created_by`;
- `employee_id`;
- `status`;
- `route_id`;
- `vehicle_id`;
- `business_unit_id`;
- `isolated_environment`;
- `resource_version`;

cuando procedan exclusivamente del cliente.

---

#### 9. `resource_type`

`resource_type` será el identificador canónico del tipo empresarial evaluado.

Ejemplos conceptuales:

```text
inventory_remission
inventory_movement
purchase_order
purchase_reception
production_batch
cash_session
sale_order
payment_transaction
employee
shift
permission_assignment
application_access
```

Reglas:

- no es el nombre de una tabla;
- no es una ruta;
- no es una clase de frontend;
- no es una aplicación;
- no es un nombre humano;
- no contiene un identificador concreto;
- debe coincidir con `resource_contract_id`;
- debe coincidir con la operación exigida por el permiso.

Una discrepancia produce:

```text
RESOURCE_TYPE_MISMATCH
→ resolution_status = CONFLICT
→ DENY
```

---

#### 10. Formas de solicitud

##### 10.1 `EXISTING`

Representa uno o varios recursos ya persistidos que deben resolverse desde su
fuente de verdad.

No basta con recibir su identificador.

##### 10.2 `DRAFT`

Representa un recurso normalizado antes de persistir.

Puede no tener `resource_id`.

Debe resolver sus relaciones y territorio propuestos.

##### 10.3 `COLLECTION`

Representa una colección delimitada y construida en servidor.

No representa “toda la tabla”.

##### 10.4 `AGGREGATE`

Representa un resultado derivado de varios miembros autorizables.

No puede revelar miembros excluidos mediante totales o conteos.

##### 10.5 `BULK`

Representa una mutación o transición sobre varios recursos exactos.

Requiere contrato masivo explícito o descomposición por miembro.

##### 10.6 `NON_RESOURCE`

Representa una capacidad cuyo contrato declara legítimamente que no existe un
recurso empresarial variable, por ejemplo un acceso de aplicación.

No se utiliza como fallback ante una resolución fallida.

---

#### 11. Coherencia entre permiso y `request_shape`

El contrato deberá declarar qué formas admite.

Ejemplos:

```text
permiso de creación
→ DRAFT
```

```text
permiso de actualización
→ EXISTING
```

```text
permiso de exportación agregada
→ AGGREGATE
```

```text
permiso masivo explícito
→ BULK
```

Una forma no admitida produce:

```text
RESOURCE_REQUEST_SHAPE_INVALID
→ resolution_status = CONFLICT
→ DENY
```

---

#### 12. Estados de resolución

##### 12.1 `RESOLVED`

Existe un recurso lógico exacto y coherente.

Puede aplicarse a:

- `EXISTING`;
- `DRAFT`;
- `NON_RESOURCE`, únicamente mediante `NOT_APPLICABLE`, no `RESOLVED`.

Para `RESOLVED`, normalmente existe un solo recurso lógico.

##### 12.2 `MULTI_RESOLVED`

Existe un conjunto exacto, finito, coherente y determinado en servidor.

Puede aplicarse a:

- `COLLECTION`;
- `AGGREGATE`;
- `BULK`;
- una relación compuesta aprobada.

##### 12.3 `NOT_APPLICABLE`

El contrato declara expresamente que la capacidad no requiere un recurso
variable.

No significa resolución omitida.

##### 12.4 `UNRESOLVED`

Falta información autoritativa necesaria.

##### 12.5 `CONFLICT`

Existen hechos contradictorios o incompatibles.

##### 12.6 `ISOLATED`

El recurso pertenece a un entorno aislado que no está cubierto por la
autorización organizacional ordinaria.

---

#### 13. Estados que permiten continuar

```text
RESOLVED
MULTI_RESOLVED
NOT_APPLICABLE
→ la evaluación puede continuar
```

Siempre que las demás invariantes sean válidas.

```text
UNRESOLVED
CONFLICT
ISOLATED
→ structural deny
→ final_decision = DENY
```

No se permite:

- ignorar el recurso;
- usar el contexto como reemplazo;
- degradar a `NON_RESOURCE`;
- utilizar sede primaria;
- elegir el primer candidato;
- retirar lados obligatorios.

---

#### 14. `resource_ids`

Reglas por forma:

| Forma          | Regla                                                |
| -------------- | ---------------------------------------------------- |
| `EXISTING`     | Uno o más identificadores exactos, según el contrato |
| `DRAFT`        | Puede estar vacío antes de persistir                 |
| `COLLECTION`   | Identificadores exactos del conjunto materializado   |
| `AGGREGATE`    | Identificadores de los miembros o entradas evaluadas |
| `BULK`         | Todos los recursos objetivo exactos                  |
| `NON_RESOURCE` | Vacío                                                |

Reglas generales:

- sin duplicados;
- orden determinista;
- sin wildcards;
- sin nombres humanos;
- sin IDs aportados pero no resueltos;
- una lista vacía no significa todos;
- un ID adicional exige reevaluar.

Para colecciones paginadas, cada decisión se aplica al conjunto exacto de la
página o lote resuelto, salvo que el contrato establezca un snapshot cerrado
de toda la consulta.

---

#### 15. `resource_version`

Representa la versión autoritativa del snapshot evaluado.

Puede corresponder a:

- contador de versión;
- `updated_at` normalizado;
- ETag;
- identificador de snapshot;
- versión de agregado;
- hash de borrador.

Reglas:

- `DRAFT` puede utilizar una versión o hash normalizado;
- `NON_RESOURCE` utiliza `null`;
- una mutación protegida no podrá omitirla cuando el contrato exige
  concurrencia;
- un cambio posterior vuelve obsoleta la decisión;
- no se acepta una versión declarada únicamente por el cliente.

Una versión obligatoria no resoluble produce:

```text
RESOURCE_VERSION_UNAVAILABLE
→ DENY
```

---

#### 16. Recurso existente

Para `EXISTING`:

```text
localizador del cliente
→ consulta autoritativa
→ recurso exacto
→ relaciones exactas
→ snapshot exacto
```

Casos:

```text
0 coincidencias
→ RESOURCE_NOT_FOUND
→ UNRESOLVED
```

```text
1 coincidencia
→ RESOLVED
```

```text
2 o más coincidencias cuando se esperaba una
→ RESOURCE_AMBIGUOUS
→ CONFLICT
```

No se revelará al cliente si el recurso existe cuando esa información sea
sensible.

---

#### 17. Recurso de creación

Un `DRAFT` se evalúa antes de escribir.

Flujo:

```text
payload no confiable
→ validación sintáctica
→ normalización
→ resolución de padres y relaciones
→ derivación territorial
→ derivación de sujeto y propiedad
→ validación de estado inicial
→ validación de campos
→ autorización
→ escritura
```

Reglas:

- el cliente no se autoasigna autoridad mediante IDs;
- una relación padre determina territorio cuando el contrato así lo declare;
- el estado inicial procede del contrato;
- los campos del sistema no se aceptan como ordinarios;
- la escritura debe usar el mismo borrador normalizado autorizado.

---

#### 18. Creación y territorio propuesto

Un borrador puede proponer:

- sede;
- área;
- origen;
- destino;
- propietario;
- sujeto.

Esos valores solo participan después de resolver:

- existencia;
- relación;
- compatibilidad;
- pertenencia;
- vigencia;
- fuente.

Ejemplo:

```text
payload.destination_site_id = VENTO_CAFE
```

no significa:

```text
destination = VENTO_CAFE autorizado
```

El servidor deberá confirmar la sede y el contrato deberá exigir autoridad
sobre ese lado.

---

#### 19. Colecciones

Una colección se construye en servidor desde un predicado autorizado.

Reglas:

1. el servidor limita el conjunto antes de devolverlo;
2. el frontend no recibe un conjunto amplio para filtrarlo;
3. cada miembro debe pertenecer al territorio autorizado;
4. el filtro solicitado solo puede reducir;
5. la ordenación no modifica alcance;
6. la paginación no amplía alcance;
7. un miembro fuera de alcance no se incluye;
8. una colección de mutación requiere decisiones por miembro o contrato
   masivo.

Razón reservada ante conjunto no delimitable:

```text
RESOURCE_COLLECTION_SCOPE_INVALID
```

---

#### 20. Agregados

Un agregado puede incluir:

- conteos;
- sumas;
- indicadores;
- reportes;
- diferencias;
- agrupaciones;
- tendencias.

Reglas:

1. todos los miembros contribuyentes deben estar dentro del alcance;
2. no se incluirán miembros ocultos;
3. no se revelará información excluida mediante inferencia;
4. un resultado agrupado conserva su territorio;
5. un agregado transversal requiere alcance explícito;
6. un `0` o mensaje de error no deberá confirmar la existencia de recursos
   ocultos.

Razón reservada:

```text
RESOURCE_AGGREGATE_SCOPE_INVALID
```

---

#### 21. Operaciones masivas

Un permiso ordinario sobre un recurso no autoriza una operación masiva.

Una operación `BULK` deberá:

- usar una capacidad masiva explícita; o
- descomponerse en decisiones individuales.

La política deberá ser una de:

```text
ALL_OR_NOTHING
PARTIAL_WITH_RESULTS
```

No se elegirá silenciosamente.

##### `ALL_OR_NOTHING`

Un solo miembro denegado bloquea toda la operación.

##### `PARTIAL_WITH_RESULTS`

Cada miembro obtiene decisión propia y resultado seguro.

La operación no podrá presentar el éxito parcial como éxito total.

Razón reservada cuando falta contrato masivo:

```text
RESOURCE_BULK_CONTRACT_REQUIRED
```

---

#### 22. `NON_RESOURCE`

Solo se utiliza cuando:

```text
resource_contract
→ declara NON_RESOURCE
```

Forma mínima:

```text
request_shape = NON_RESOURCE
resolution_status = NOT_APPLICABLE
resource_ids = []
resource_version = null
subject = null
required_sides = []
state_snapshot = {}
field_classification = {}
concurrency = null
```

El territorio deberá ser coherente con el contrato y no inventará una sede.

Un permiso de aplicación como `<app>.access` puede usar esta forma si su
contrato lo declara.

---

#### 23. Recurso organizacional no territorial

Un recurso organizacional no territorial no es `NON_RESOURCE`.

Ejemplos conceptuales:

- catálogo corporativo;
- configuración organizacional;
- política;
- plantilla global;
- reporte corporativo.

Debe producir:

```text
resolution_status = RESOLVED
organization_id = organización exacta
site_ids = []
area_ids = []
```

Las listas vacías significan que la dimensión no aplica, no que cubre todas
las sedes.

---

#### 24. `subject`

`subject` representa la entidad empresarial sobre la cual recae la operación
cuando es distinta o adicional al recurso principal.

Ejemplos:

- empleado objetivo;
- cliente;
- proveedor;
- usuario invitado;
- dispositivo;
- solicitante;
- responsable;
- beneficiario.

Reglas:

- sujeto no significa propietario;
- sujeto no significa actor;
- sujeto no significa recurso principal;
- el cliente no declara la relación autoritativamente;
- la relación con el actor procede del contrato;
- `SELF` exige coincidencia exacta;
- `THIRD_PARTY` exige autoridad explícita;
- una relación incoherente produce `RESOURCE_SUBJECT_CONFLICT`.

---

#### 25. Propiedad y relación con el actor

`ownership` responde:

```text
¿quién controla o posee el recurso
y qué relación tiene el actor con esa propiedad?
```

No deberá inferirse universalmente desde:

- `created_by`;
- `updated_by`;
- `requested_by`;
- último custodio;
- usuario autenticado;
- empleado asignado.

Cada contrato declara qué campo o relación significa:

- propiedad;
- creación;
- asignación;
- custodia;
- responsabilidad;
- pertenencia;
- tercero.

---

#### 26. Alcance `OWN`

`OWN` solo coincide cuando:

1. `ownership.coherent = true`;
2. la relación aceptada por el contrato coincide;
3. el actor exacto es el sujeto permitido;
4. el recurso y territorio permanecen dentro de cualquier límite adicional.

Regla:

```text
OWN
puede reducir territorio
pero nunca ampliarlo
```

Ejemplo:

```text
recurso propio
+
sede fuera del alcance territorial
→ no autorizado
```

Una propiedad no resoluble produce:

```text
RESOURCE_OWNERSHIP_UNRESOLVED
→ DENY cuando OWN es necesario
```

---

#### 27. Estado del recurso

`state_snapshot` contiene únicamente hechos necesarios para autorización.

Ejemplos:

- estado actual;
- estado propuesto;
- transición;
- fecha efectiva;
- cierre;
- cancelación;
- recepción;
- propiedad;
- clasificación;
- condición editable;
- bloqueo;
- aprobación.

Reglas:

- no contiene la fila completa;
- no contiene campos ajenos a la decisión;
- los campos se permiten por contrato;
- el orden es determinista;
- los timestamps se normalizan;
- una transición se evalúa contra el estado actual real;
- el payload no reemplaza el estado actual.

---

#### 28. Transiciones

Una transición deberá declarar:

```text
estado actual
+
transición solicitada
+
estado resultante permitido
```

Ejemplo:

```text
remisión requested
→ iniciar producción
```

No se autoriza únicamente porque el actor tenga la capacidad.

Si el estado actual cambió:

```text
RESOURCE_STATE_INVALID
→ DENY
→ reevaluar
```

Una capacidad de transición no autoriza otras transiciones del mismo recurso.

---

#### 29. Campos solicitados

`AuthorizationRequestContext.requested_fields` reduce o precisa la evaluación.

Reglas:

- lista vacía usa la proyección mínima del contrato;
- no concede campos adicionales;
- no se aceptan wildcards;
- no se aceptan rutas de objeto no definidas;
- un campo solicitado debe existir en la clasificación;
- el servidor puede retirar campos no autorizados en lecturas;
- una mutación con campos bloqueados debe denegarse o dividirse
  explícitamente.

---

#### 30. Clasificación de campos

`field_classification` utiliza inicialmente los siguientes códigos:

```text
PUBLIC
INTERNAL
SENSITIVE
RESTRICTED
IMMUTABLE
SYSTEM_MANAGED
```

Semántica:

| Código           | Regla                                                        |
| ---------------- | ------------------------------------------------------------ |
| `PUBLIC`         | Puede exponerse únicamente cuando el recurso está autorizado |
| `INTERNAL`       | Requiere permiso y proyección interna compatible             |
| `SENSITIVE`      | Exige política sensible y minimización                       |
| `RESTRICTED`     | Exige capacidad o control específico                         |
| `IMMUTABLE`      | No puede modificarse mediante la operación                   |
| `SYSTEM_MANAGED` | Solo puede ser escrito por procesos canónicos autorizados    |

Un valor desconocido produce:

```text
RESOURCE_FIELD_CLASSIFICATION_INVALID
→ DENY
```

AUTH-CTX-023 consolidará la decisión de campos.

---

#### 31. Concurrencia

La decisión y la ejecución deben protegerse contra cambios entre:

```text
leer
→ autorizar
→ escribir
```

Políticas:

##### `NONE`

Solo para operaciones donde el contrato declara que no existe riesgo de
concurrencia relevante.

##### `EXPECTED_VERSION`

Exige coincidencia con una versión explícita.

##### `UPDATED_AT`

Exige coincidencia con timestamp autoritativo.

##### `LOCK`

Exige lock dentro de la transacción.

##### `SNAPSHOT`

Exige un snapshot transaccional coherente.

##### `IDEMPOTENCY_KEY`

Exige una clave estable para evitar efectos duplicados.

---

#### 32. Resultado de concurrencia

Para una operación protegida:

```text
concurrency.validated = true
```

es obligatorio antes de ejecutar.

Una decisión previa no reserva el recurso.

Un conflicto produce:

```text
RESOURCE_CONCURRENCY_CONFLICT
→ DENY para la ejecución actual
→ nueva resolución
```

La acción no podrá reutilizar una decisión antigua.

---

#### 33. Idempotencia

La idempotencia:

- evita duplicados;
- no concede permiso;
- no amplía alcance;
- no sustituye actor;
- no sustituye recurso;
- no convierte un request fallido en autorizado.

El mismo `idempotency_key` con payload empresarial diferente produce
conflicto.

Las creaciones y transiciones con efectos no repetibles deberán declarar su
política mediante el contrato.

---

#### 34. Forma territorial: `organization_id`

`organization_id` identifica la organización propietaria del recurso.

Reglas:

- puede ser `null` únicamente cuando el contrato lo permita;
- `null` no significa Vento Group;
- no se obtiene por default global;
- no se obtiene del actor;
- un recurso de otra organización produce conflicto;
- futuras organizaciones o tenants permanecen separados.

Para recursos empresariales ordinarios de Vento:

```text
organization_id
→ organización canónica propietaria
```

---

#### 35. `business_unit_ids`

Representa unidades de negocio exactas relacionadas con el recurso.

No se inferirá desde:

- nombre de sede;
- aplicación;
- prefijo de código;
- repositorio;
- ruta.

Reglas:

- lista única;
- orden determinista;
- vacía cuando no aplica;
- vacía no significa todas;
- una unidad desconocida produce conflicto;
- una relación multinegocio requiere contrato explícito.

---

#### 36. `site_ids`

Representa todas las sedes reales obligatorias del recurso.

Ejemplos:

- sede propietaria;
- sede de almacenamiento;
- sede de venta;
- sede de recepción;
- sedes de origen y destino.

Reglas:

- se derivan de relaciones canónicas;
- sin duplicados;
- sedes activas cuando el contrato lo exige;
- una lista vacía no significa todas;
- el cliente no crea sedes;
- la sede del actor no se copia al recurso;
- una sede seleccionada no se copia al recurso.

---

#### 37. `area_ids`

Representa todas las áreas reales obligatorias del recurso.

Reglas:

- cada área pertenece a una sede incluida;
- el área procede de una relación canónica;
- no se deriva del nombre;
- no se deriva de `area_kind`;
- no se deriva del turno;
- no se deriva del dispositivo;
- una lista vacía no significa todas;
- una incompatibilidad produce `RESOURCE_TERRITORY_CONFLICT`.

---

#### 38. `area_kinds`

`area_kinds` se deriva de las áreas resueltas.

Regla:

```text
area_id
→ catálogo de áreas
→ area_kind
```

No se utilizará un `area_kind` enviado por cliente para reemplazar un área
concreta.

Una lista puede contener tipos repetidos conceptualmente, pero la
serialización los deduplicará.

---

#### 39. Origen y destino

`origin` y `destination` se utilizan cuando el contrato declara una operación
multilateral.

Ejemplos:

- remisión;
- traslado;
- transferencia;
- movimiento;
- despacho;
- ruta;
- devolución;
- recepción.

Cada lado puede contener:

- sede;
- área;
- ruta;
- vehículo.

Reglas:

- origen y destino se resuelven por separado;
- un lado no autoriza el otro;
- el actor puede tener autoridad distinta en cada lado;
- una denegación aplicable a cualquier lado obligatorio bloquea la operación;
- no se intercambian silenciosamente;
- no se completa un lado desde el contexto del actor.

---

#### 40. Lados obligatorios

`required_sides` expresa qué lados debe evaluar el permiso.

Ejemplos de códigos:

```text
RESOURCE
ORIGIN
DESTINATION
SOURCE
TARGET
PARENT
CHILD
SUBJECT
OWNER
CUSTODIAN
VEHICLE
ROUTE
```

Reglas:

1. cada código procede del contrato;
2. un lado obligatorio debe resolverse;
3. un lado opcional no se convierte en obligatorio por el cliente;
4. un lado obligatorio no puede eliminarse del request;
5. el mismo lado no se duplica;
6. el orden es determinista;
7. un lado no resuelto produce `RESOURCE_REQUIRED_SIDE_UNRESOLVED`;
8. un lado en conflicto produce `RESOURCE_REQUIRED_SIDE_CONFLICT`;
9. un lado aislado produce `ISOLATED`;
10. una mutación multilateral exige autorización sobre todos los lados
    declarados obligatorios, salvo contrato explícito diferente.

---

#### 41. Remisiones

Una remisión puede involucrar:

```text
origen
destino
solicitante
productor
transportador
receptor
estado
productos
```

La resolución mínima territorial deberá distinguir:

```text
origin.site_id
destination.site_id
```

y las áreas cuando sean relevantes.

Regla predeterminada:

```text
DENY APLICABLE EN CUALQUIER LADO OBLIGATORIO
→ DENY DE LA OPERACIÓN COMPLETA
```

Las excepciones de lectura o visibilidad parcial deberán estar declaradas en
el contrato específico del permiso.

---

#### 42. Movimientos de inventario

Un movimiento puede involucrar:

- sede;
- área;
- ubicación de origen;
- ubicación de destino;
- LPN;
- producto;
- custodio;
- tipo de movimiento;
- estado;
- cantidad.

El territorio no se reduce al `site_id` del movimiento.

La fuente y destino internos deberán resolverse cuando el permiso los
requiera.

Autorizar una ubicación no autoriza todas las ubicaciones de la sede.

---

#### 43. Compras y recepciones

Una orden de compra y una recepción pueden tener territorios distintos:

- unidad de negocio compradora;
- sede solicitante;
- sede receptora;
- ubicación de recepción;
- proveedor;
- centro de costo.

El contrato del permiso determinará qué relaciones son obligatorias.

Un proveedor no se modelará como sede.

Un centro de costo no se modelará automáticamente como área.

---

#### 44. Producción

Un recurso productivo puede involucrar:

- sede productora;
- área productora;
- receta;
- lote;
- orden;
- solicitud de origen;
- inventario consumido;
- inventario resultante.

La autorización de la orden no autoriza automáticamente:

- editar receta;
- ajustar inventario;
- cerrar lote;
- aprobar merma.

Cada capacidad conserva su recurso y contrato exactos.

---

#### 45. Ventas, caja y pagos

Una venta puede involucrar:

- sede comercial;
- área;
- sesión de caja;
- pedido;
- cliente;
- transacciones;
- reembolsos;
- reversos.

La autoridad sobre la venta no autoriza automáticamente:

- recaudar;
- reembolsar;
- reversar;
- cerrar caja;
- editar datos sensibles del cliente.

Cada acción usa permiso, recurso, estado y campos exactos.

---

#### 46. Trabajadores, turnos y autorización

Un recurso de VISO puede tener como sujeto:

- empleado;
- invitación;
- turno;
- rol;
- permiso;
- excepción;
- dispositivo.

La cobertura administrativa del actor no cambia el sujeto real.

Ejemplo:

```text
actor = gerente
subject = empleado E2
```

La operación no es `OWN` salvo que el contrato lo declare y la relación
coincida.

---

#### 47. Rutas y vehículos

`route_ids` y `vehicle_ids` representan relaciones exactas.

No significan:

- sedes;
- áreas;
- permisos;
- territorios globales.

Un vehículo puede estar:

- asignado a una sede;
- asociado a una ruta;
- en tránsito;
- custodiado por un actor.

La relación válida deberá proceder de fuente canónica.

Un conductor con turno no obtiene autoridad sobre todos los vehículos.

---

#### 48. Entornos aislados

Entornos aislados incluyen, cuando existan:

- APP-REVIEW;
- demo;
- pruebas;
- sandbox;
- datos de certificación;
- organizaciones o tenants segregados.

Reglas:

```text
isolated_environment = true
```

cuando el recurso pertenece a uno de estos entornos.

El alcance:

- organizacional;
- global;
- por tipo de sede;
- por tipo de área;

no los incluye automáticamente.

Sin contrato y autorización aislada explícita:

```text
resolution_status = ISOLATED
→ DENY
```

---

#### 49. Fuente territorial

`territory.source` utilizará inicialmente uno de estos valores:

```text
RESOURCE_DIRECT
RESOURCE_PARENT_CHAIN
DRAFT_RELATIONSHIP
COLLECTION_MEMBERS
AGGREGATE_INPUTS
BULK_MEMBERS
NON_RESOURCE_CONTRACT
```

Reglas:

- la fuente debe explicar cómo se obtuvo el territorio;
- no concede autoridad;
- no acepta texto libre;
- una fuente desconocida produce conflicto;
- un recurso puede requerir varias relaciones, pero la serialización utiliza
  el código que representa el resolver contractual principal.

AUTH-CTX-026 deberá congelar su enum físico.

---

#### 50. Coherencia territorial

```text
territory.coherent = true
```

requiere:

1. organización compatible;
2. unidades de negocio válidas;
3. sedes válidas;
4. áreas pertenecientes a sus sedes;
5. tipos derivados de las áreas;
6. origen y destino coherentes;
7. rutas y vehículos válidos;
8. ausencia de contradicciones;
9. fuente reconocida;
10. entorno correctamente clasificado.

Una incoherencia produce:

```text
RESOURCE_TERRITORY_CONFLICT
→ resolution_status = CONFLICT
→ DENY
```

---

#### 51. Territorio no resoluble

Cuando el contrato requiere territorio y no puede obtenerse:

```text
RESOURCE_TERRITORY_UNRESOLVED
→ resolution_status = UNRESOLVED
→ DENY
```

No se asumirá:

- recurso organizacional;
- sede del actor;
- sede primaria;
- sede seleccionada;
- sede del dispositivo;
- área del turno;
- ausencia de territorio.

---

#### 52. Comparación con carril base

AUTH-CTX-019 deberá comparar los grants base contra el territorio real.

Ejemplos:

```text
AS
→ resource.site_ids
deben pertenecer a assigned_sites utilizables
```

```text
SS
→ resource.site_ids
deben coincidir con la sede exacta
```

```text
AST
→ sedes del recurso
deben estar asignadas
y tener el tipo exacto
```

```text
AA / SA / AAT / ATW
→ áreas reales del recurso
```

```text
OWN
→ ownership + territorio
```

```text
G
→ organización ordinaria
→ excluye entornos aislados
```

---

#### 53. Comparación con carril operativo

AUTH-CTX-020 deberá comparar el recurso contra:

- `operational_site`;
- `operational_area`;
- rol operativo;
- lados requeridos;
- contrato del permiso.

`CTX` significa:

```text
territorio operativo efectivo
debe coincidir con los lados exigidos del recurso
```

No significa:

- cualquier recurso de la sede;
- recursos de otra área;
- cualquier origen o destino;
- acceso cross-site;
- wildcard territorial.

---

#### 54. Recursos multiterritoriales y carril operativo

Un turno aporta un territorio operativo principal.

Una operación puede exigir varios territorios.

Ejemplo:

```text
turno = CENTRO_PRODUCCION
remisión:
origin = CENTRO_PRODUCCION
destination = VENTO_CAFE
```

El carril operativo no obtiene automáticamente autoridad sobre
`VENTO_CAFE`.

El contrato puede exigir:

- coincidencia con origen;
- coincidencia con destino;
- ambos;
- permiso transversal específico;
- carril base adicional mediante `BASE_AND_OPERATIONAL`.

La regla debe ser explícita.

---

#### 55. Lectura transversal

Una lectura transversal podrá devolver la unión de recursos individualmente
autorizados.

Reglas:

- el servidor construye la unión;
- un recurso denegado no se devuelve;
- la ausencia de resultados no revela recursos ocultos;
- la paginación conserva el filtro;
- el conteo no incluye miembros denegados;
- la lectura no concede una mutación transversal.

---

#### 56. Mutación transversal

Una mutación multiterritorial exige autoridad sobre todos los lados
obligatorios.

Predeterminado:

```text
UN LADO OBLIGATORIO DENEGADO
→ OPERACIÓN COMPLETA DENEGADA
```

Una ejecución parcial exige:

- permiso explícito;
- contrato masivo;
- política `PARTIAL_WITH_RESULTS`;
- resultados por miembro;
- auditoría.

---

#### 57. Dispositivo compartido

El dispositivo puede restringir:

- aplicaciones;
- permisos;
- sede;
- área;
- ruta;
- vehículo;
- recurso.

Regla:

```text
recurso autorizado por actor
∩
recurso admitido por dispositivo
```

El dispositivo no:

- crea recurso;
- crea territorio;
- corrige territorio;
- cambia origen;
- cambia destino;
- convierte entorno aislado en ordinario;
- amplía un carril.

La incompatibilidad se consolidará en AUTH-CTX-023.

---

#### 58. Simulación

La simulación puede utilizar un recurso hipotético normalizado.

No podrá:

- fingir que un recurso inexistente fue resuelto;
- omitir lados obligatorios;
- convertir `ISOLATED` en ordinario;
- saltar conflictos;
- persistir;
- producir decisión ejecutable.

Un borrador simulado conserva el contrato de recurso real.

---

#### 59. Procesos de sistema

Un proceso `SYSTEM` también debe resolver:

- recurso;
- territorio;
- estado;
- lados;
- concurrencia;
- idempotencia.

El uso de `service_role` no permite:

- omitir recurso;
- omitir territorio;
- escribir en cualquier sede;
- ignorar organización;
- ignorar entornos aislados;
- ignorar estado.

Las integraciones deberán utilizar adaptadores y contratos empresariales
canónicos.

---

#### 60. Huella del recurso

AUTH-CTX-024 deberá registrar:

```text
resource_fingerprint
```

derivado de forma determinista de:

- `resource_contract_id`;
- `resource_type`;
- `request_shape`;
- `resolution_status`;
- `resource_ids`;
- `resource_version`;
- sujeto;
- propiedad;
- territorio;
- lados requeridos;
- estado relevante;
- clasificación de campos;
- concurrencia.

No deberá incluir secretos ni datos no necesarios.

---

#### 61. Snapshot e inmutabilidad

Una decisión captura un recurso exacto en un instante.

Cambios que obligan a reevaluar:

- estado;
- versión;
- propietario;
- sujeto;
- sede;
- área;
- origen;
- destino;
- ruta;
- vehículo;
- lados;
- campos solicitados;
- clasificación;
- idempotencia;
- relación padre;
- entorno;
- contrato de recurso.

Una decisión antigua no se actualiza.

---

#### 62. Orden determinista

La serialización deberá:

1. ordenar `resource_ids`;
2. ordenar `business_unit_ids`;
3. ordenar `site_ids`;
4. ordenar `area_ids`;
5. ordenar `area_kinds`;
6. ordenar `route_ids`;
7. ordenar `vehicle_ids`;
8. ordenar `required_sides` por `side_code`;
9. ordenar claves de `state_snapshot`;
10. ordenar claves de `field_classification`;
11. eliminar duplicados exactos;
12. conservar conflictos en lugar de resolverlos arbitrariamente.

---

#### 63. Razones de bloqueo reservadas

```text
RESOURCE_CONTRACT_NOT_FOUND
RESOURCE_CONTRACT_VERSION_MISMATCH
RESOURCE_REQUEST_SHAPE_INVALID
RESOURCE_TYPE_MISMATCH
RESOURCE_NOT_FOUND
RESOURCE_AMBIGUOUS
RESOURCE_RELATIONSHIP_CONFLICT
RESOURCE_SUBJECT_CONFLICT
RESOURCE_TERRITORY_UNRESOLVED
RESOURCE_TERRITORY_CONFLICT
RESOURCE_ISOLATED
RESOURCE_OWNERSHIP_UNRESOLVED
RESOURCE_REQUIRED_SIDE_UNRESOLVED
RESOURCE_REQUIRED_SIDE_CONFLICT
RESOURCE_STATE_INVALID
RESOURCE_FIELD_CLASSIFICATION_INVALID
RESOURCE_CONCURRENCY_CONFLICT
RESOURCE_BULK_CONTRACT_REQUIRED
RESOURCE_AGGREGATE_SCOPE_INVALID
RESOURCE_COLLECTION_SCOPE_INVALID
RESOURCE_VERSION_UNAVAILABLE
```

Estas razones:

- pertenecen a `AuthorizationDecision.structural_denies` o
  `blocked_reasons`;
- no se agregan retroactivamente a `AccessContext.structural_issues`;
- producen `DENY` cuando son bloqueantes;
- serán consolidadas y priorizadas en AUTH-CTX-023;
- serán auditadas mediante AUTH-CTX-024.

---

#### 64. Fail closed

Queda prohibido:

- autorizar sin resolver recurso;
- autorizar solo con `site_id`;
- copiar territorio desde el actor;
- usar sede primaria;
- usar sede seleccionada;
- usar el dispositivo como fuente;
- usar `created_by` universalmente como propietario;
- tratar lista vacía como todos;
- tratar `null` como global;
- omitir origen o destino;
- elegir el primer recurso;
- ignorar duplicados;
- ignorar cambio de versión;
- usar un permiso ordinario como masivo;
- filtrar únicamente en frontend;
- degradar recurso aislado;
- ejecutar con conflicto de concurrencia;
- reutilizar decisión obsoleta.

---

#### 65. Casos de ejemplo

##### Caso A — Recurso existente de una sede

```text
request_shape = EXISTING
resource_id = remisión R1
R1.destination_site_id = VENTO_CAFE
```

Resultado:

```text
resolution_status = RESOLVED
resource_ids = [R1]
territory.site_ids incluye VENTO_CAFE
```

El `site_id` se obtiene de R1, no del request.

##### Caso B — Recurso no encontrado

```text
localizador válido
0 coincidencias
```

Resultado:

```text
resolution_status = UNRESOLVED
RESOURCE_NOT_FOUND
DENY
```

##### Caso C — Creación de remisión

```text
request_shape = DRAFT
origin = CENTRO_PRODUCCION
destination = SAUDO
```

El servidor resuelve ambas sedes y sus relaciones antes de autorizar.

No se confía en los IDs aislados del payload.

##### Caso D — Recurso organizacional

```text
resource_type = authorization_catalog
organization_id = VENTO_GROUP
site_ids = []
area_ids = []
```

Resultado:

```text
RESOLVED
```

No es `NON_RESOURCE`.

##### Caso E — Acceso a aplicación

```text
resource_contract declara NON_RESOURCE
```

Resultado:

```text
request_shape = NON_RESOURCE
resolution_status = NOT_APPLICABLE
resource_ids = []
```

##### Caso F — Propiedad sin territorio

```text
actor creó el recurso
recurso pertenece a sede fuera de alcance
```

Resultado:

```text
OWN coincide
territorio no coincide
DENY
```

##### Caso G — Remisión multisitio

```text
origin = CENTRO_PRODUCCION
destination = VENTO_CAFE
```

Ambos lados se conservan.

Autoridad sobre el origen no autoriza automáticamente el destino.

##### Caso H — Área de otra sede

```text
site_id = SAUDO
area_id pertenece a VENTO_CAFE
```

Resultado:

```text
territory.coherent = false
resolution_status = CONFLICT
RESOURCE_TERRITORY_CONFLICT
```

##### Caso I — Colección filtrada por cliente

```text
cliente solicita site_id = VENTO_CAFE
```

El filtro puede reducir.

El servidor todavía debe limitar el conjunto a lo autorizado.

##### Caso J — Agregado

```text
reporte de ventas por sede
```

Solo contribuyen recursos individualmente autorizados.

Los totales no incluyen sedes excluidas.

##### Caso K — Operación masiva sin permiso masivo

```text
permission = editar un recurso
request_shape = BULK
```

Resultado:

```text
RESOURCE_BULK_CONTRACT_REQUIRED
DENY
```

##### Caso L — Estado cambió

```text
decisión evaluó version = 7
recurso actual = version 8
```

Resultado:

```text
RESOURCE_CONCURRENCY_CONFLICT
DENY
nueva evaluación
```

##### Caso M — Entorno APP-REVIEW

```text
isolated_environment = true
sin autorización aislada explícita
```

Resultado:

```text
resolution_status = ISOLATED
RESOURCE_ISOLATED
DENY
```

##### Caso N — Conductor y vehículo

```text
actor tiene rol conductor_logistica
vehicle_id = V1
```

El rol no demuestra relación con V1.

El vehículo deberá resolverse desde la operación o asignación canónica.

##### Caso O — Área nula

```text
recurso de nivel sede
area_ids = []
```

Puede ser válido cuando el contrato no exige área.

No significa todas las áreas.

---

#### 66. Antipatrones prohibidos

```ts
const siteId =
  request.site_id ??
  accessContext.operational_site?.site_id ??
  employee.site_id;

const areaId =
  request.area_id ??
  accessContext.operational_area?.area_id ??
  null;

const ownsResource =
  resource.created_by === actorId;

if (grant.scope === "global") {
  return true;
}

if (!resource) {
  return authorizeWithoutResource();
}
```

También queda prohibido:

```text
selectedSite → territorio real
selectedArea → territorio real
turno → territorio del recurso
check-in → territorio del recurso
dispositivo → territorio del recurso
resource_ids vacíos → todos
resource_version null → ignorar concurrencia
permiso individual → operación masiva
recurso propio → ignorar sede
global → incluir APP-REVIEW
cliente filtra después → seguridad
```

---

#### 67. Relación con tareas posteriores

##### AUTH-CTX-019

Evaluará el carril base contra:

- territorio;
- sujeto;
- propiedad;
- estado;
- lados;
- campos;
- concurrencia.

##### AUTH-CTX-020

Evaluará el carril operativo contra:

- sede y área operativas;
- rol;
- turno;
- check-in;
- lados del recurso;
- restricciones del dispositivo.

##### AUTH-CTX-021

Registrará únicamente allows cuyo alcance coincida con el recurso resuelto.

##### AUTH-CTX-022

Registrará denegaciones que coincidan con actor, recurso, territorio, lados y
vigencia.

##### AUTH-CTX-023

Consolidará estados, campos, dispositivo, sensibilidad, dependencias,
concurrencia, razones y decisión final.

##### AUTH-CTX-024

Registrará:

- `resource_type`;
- IDs;
- versión;
- huella;
- territorio;
- lados;
- estado;
- política de concurrencia;
- fuentes.

##### AUTH-CTX-025

Diseñará `get_access_context`; no resolverá recursos empresariales de una
acción concreta.

##### AUTH-CTX-026

Diseñará `evaluate_authorization`, resolvers de recursos, tipos físicos,
validación del contrato, frontera transaccional y respuesta.

##### AUTH-CTX-027

Obligará a rutas, acciones, RPC, API y jobs a declarar y resolver el recurso
mediante contratos centralizados.

##### AUTH-CTX-028

Diseñará compatibilidad con:

- `site_id` y `area_id` enviados por clientes actuales;
- funciones legacy que reciben territorio aislado;
- recursos sin contrato;
- `created_by` usado como propiedad universal;
- permisos amplios;
- operaciones masivas implícitas;
- consumidores que filtran en frontend;
- estados y relaciones actuales.

##### AUTH-CTX-029

Definirá:

- caché;
- expiración;
- invalidación;
- fingerprints;
- versiones;
- frescura;
- revalidación.

##### AUTH-CTX-030

Definirá pruebas contractuales de:

- seis formas de request;
- seis estados de resolución;
- recursos existentes;
- borradores;
- colecciones;
- agregados;
- lotes;
- non-resource;
- propiedad;
- sujeto;
- campos;
- estados;
- concurrencia;
- origen y destino;
- rutas;
- vehículos;
- territorios aislados;
- fail closed.

##### AUTH-DB-006 a AUTH-DB-010

Implementarán evaluación canónica dentro de RPC sensibles.

##### AUTH-DB-011

Aplicará constraints después de inventario, reconciliación y backfill.

##### AUTH-DB-020

Migrará contratos y consumidores legacy con compatibilidad temporal.

##### AUTH-DB-027

Probará integridad, RLS, RPC, recursos, territorios y migraciones.

##### AUTH-DB-030

Retirará parámetros territoriales y rutas legacy después de adopción
comprobada.

##### AUTH-DB-031

Certificará paridad documental, técnica y operativa.

##### BLOQUE E1

Deberá confrontar los contratos con recursos y procesos reales mediante:

- `PROC-DISC-001` a `PROC-DISC-008`;
- `CAP-MAP-001` a `CAP-MAP-005`;
- `GAP-CTRL-001` a `GAP-CTRL-006`.

##### BLOQUE E2

Deberá formalizar procesos, pantallas, estados y recursos mediante:

- `PROC-CAN-001` a `PROC-CAN-007`;
- `APP-OWN-001` a `APP-OWN-006`;
- `STATE-MAP-001` a `STATE-MAP-006`.

##### BLOQUE E3

Deberá formalizar fuentes y arquitectura física mediante:

- `DB-DOM-001` a `DB-DOM-005`;
- `DB-SCHEMA-001` a `DB-SCHEMA-007`;
- `DB-CONTRACT-001` a `DB-CONTRACT-006`;
- `DB-INTEGRITY-001` a `DB-INTEGRITY-006`;
- `DB-SEC-001` a `DB-SEC-006`.

##### BLOQUE E5

Deberá convertir cada contrato aprobado en paquetes mediante:

- `PKG-SCOPE-001` a `PKG-SCOPE-006`;
- `PKG-PLAN-001` a `PKG-PLAN-007`;
- `PKG-TEST-001` a `PKG-TEST-006`;
- `PKG-CUTOVER-001` a `PKG-CUTOVER-006`.

##### BLOQUE R

Implementará físicamente los paquetes aprobados mediante las tareas
`AUTH-DB-*` y los paquetes canónicos de implementación resultantes de E5.

---

#### 68. Fuera del alcance

AUTH-CTX-018 no:

- modifica contratos de recurso;
- inventa nuevos recursos;
- reclasifica los 140 permisos;
- modifica matrices;
- crea grants;
- crea denegaciones;
- evalúa el carril base;
- evalúa el carril operativo;
- resuelve allows;
- resuelve denegaciones coincidentes;
- produce decisión final completa;
- diseña pantallas;
- implementa filtros;
- implementa resolvers;
- crea tipos físicos;
- crea JSON Schema;
- crea Zod;
- crea SQL;
- crea RPC;
- crea RLS;
- crea tablas;
- crea migraciones;
- implementa locks;
- implementa idempotencia;
- modifica Supabase;
- modifica aplicaciones.

Cada responsabilidad posterior tiene destino explícito en la sección 67.

---

#### 69. Riesgos controlados

##### Riesgo 1 — Contexto usado como territorio del recurso

Control:

```text
recurso resuelto desde su fuente de verdad
```

##### Riesgo 2 — Cliente declara sede o área

Control:

```text
localizador no autoritativo
→ relaciones canónicas
```

##### Riesgo 3 — Recurso propio amplía territorio

Control:

```text
OWN reduce
no amplía
```

##### Riesgo 4 — Recurso multiterritorial se evalúa por un solo lado

Control:

```text
required_sides explícitos
```

##### Riesgo 5 — Colección filtrada únicamente en frontend

Control:

```text
conjunto delimitado en servidor
```

##### Riesgo 6 — Permiso ordinario ejecuta lote

Control:

```text
BULK exige contrato explícito
```

##### Riesgo 7 — Recurso cambia después de autorizar

Control:

```text
versión + concurrencia + revalidación
```

##### Riesgo 8 — Global atraviesa entornos aislados

Control:

```text
isolated_environment
→ autorización específica
```

---

#### 70. Criterios de aprobación

AUTH-CTX-018 podrá aprobarse cuando se acepte que:

1. se conserva la forma de `ResolvedResourceContext`;
2. se conserva la forma de `ResolvedTerritoryContext`;
3. se clarifican los tipos subordinados sin cambiar la raíz;
4. el contrato de recurso es la fuente única;
5. un contrato ausente produce `DENY`;
6. la resolución ocurre exclusivamente en servidor;
7. el cliente solo aporta localizadores y borradores;
8. `resource_type` es empresarial y canónico;
9. no es nombre de tabla ni ruta;
10. existen seis formas de solicitud;
11. la forma debe coincidir con el contrato;
12. `RESOLVED` permite continuar;
13. `MULTI_RESOLVED` permite continuar;
14. `NOT_APPLICABLE` solo es legítimo por contrato;
15. `UNRESOLVED` produce `DENY`;
16. `CONFLICT` produce `DENY`;
17. `ISOLATED` produce `DENY` sin autorización aislada;
18. `resource_ids` son exactos y deterministas;
19. una lista vacía no significa todos;
20. `DRAFT` puede no tener identificador;
21. `resource_version` representa el snapshot evaluado;
22. recursos existentes se consultan en fuente autoritativa;
23. un borrador se normaliza antes de autorizar;
24. el payload no declara territorio autoritativo;
25. colecciones se delimitan en servidor;
26. agregados no revelan miembros excluidos;
27. lotes requieren capacidad o contrato explícitos;
28. `NON_RESOURCE` no es fallback;
29. recursos organizacionales no territoriales continúan siendo recursos;
30. sujeto, actor, propietario y recurso permanecen separados;
31. la propiedad se define por contrato;
32. `created_by` no es regla universal;
33. `OWN` no amplía territorio;
34. `state_snapshot` contiene solo hechos necesarios;
35. el estado actual se resuelve en servidor;
36. una transición incompatible produce `DENY`;
37. `requested_fields` solo reduce o precisa;
38. los campos tienen clasificación cerrada;
39. campos desconocidos fallan cerrado;
40. concurrencia no se omite cuando el contrato la exige;
41. una decisión no reserva el recurso;
42. idempotencia no concede permisos;
43. `organization_id = null` no significa Vento Group;
44. unidades de negocio no se infieren por nombre de sede;
45. sedes del recurso no se copian desde el actor;
46. áreas deben pertenecer a sedes resueltas;
47. `area_kind` se deriva de `area_id`;
48. origen y destino se resuelven por separado;
49. autoridad en un lado no autoriza el otro;
50. lados obligatorios proceden del contrato;
51. un lado obligatorio no puede omitirse;
52. remisiones conservan origen y destino;
53. movimientos conservan relaciones internas necesarias;
54. compras, producción, ventas y VISO conservan sus recursos propios;
55. rutas y vehículos no equivalen a sedes;
56. entornos aislados quedan fuera del alcance ordinario;
57. la fuente territorial usa valores canónicos;
58. territorio incoherente produce `CONFLICT`;
59. territorio no resoluble produce `UNRESOLVED`;
60. AUTH-CTX-019 comparará el carril base con el recurso;
61. AUTH-CTX-020 comparará el carril operativo con el recurso;
62. un turno no autoriza automáticamente todos los lados;
63. una lectura transversal devuelve solo recursos autorizados;
64. una mutación transversal exige todos los lados obligatorios;
65. el dispositivo solo restringe;
66. la simulación no convierte un recurso inválido en válido;
67. procesos de sistema resuelven recurso y territorio;
68. la huella del recurso será determinista;
69. un cambio obliga a reevaluar;
70. el orden de listas y mapas es determinista;
71. las razones de bloqueo quedan reservadas;
72. AUTH-CTX-023 las consolidará;
73. AUTH-CTX-024 las auditará;
74. AUTH-CTX-026 diseñará resolvers y frontera transaccional;
75. AUTH-CTX-027 eliminará resolución local;
76. AUTH-CTX-028 gobernará compatibilidad legacy;
77. AUTH-CTX-029 gobernará frescura;
78. AUTH-CTX-030 gobernará pruebas;
79. los destinos de E1, E2, E3, E5, BLOQUE R y AUTH-DB quedan explícitos;
80. no se implementa código, migraciones ni cambios en Supabase.

---

#### 71. Estado final de la propuesta

| Tarea        | Estado      | Relación                  |
| ------------ | ----------- | ------------------------- |
| AUTH-CTX-017 | APROBADA    | Tarea anterior            |
| AUTH-CTX-018 | APROBADA    | Tarea actual              |
| AUTH-CTX-019 | NO INICIADA | Tarea siguiente reservada |

La continuidad propuesta queda:

```text
AUTH-CTX-017 — APROBADA
        ↓
AUTH-CTX-018 — APROBADA
        ↓
AUTH-CTX-019 — NO INICIADA
```

No se avanza a AUTH-CTX-019 hasta recibir aprobación explícita de
AUTH-CTX-018.


### [ ] AUTH-CTX-019 — Incluir decisión del carril base
### [ ] AUTH-CTX-020 — Incluir decisión del carril operativo
### [ ] AUTH-CTX-021 — Incluir allows coincidentes
### [ ] AUTH-CTX-022 — Incluir denegaciones coincidentes
### [ ] AUTH-CTX-023 — Incluir decisión final y razones
### [ ] AUTH-CTX-024 — Incluir datos de auditoría

DISEÑO DE IMPLEMENTACIÓN CANÓNICA

### [ ] AUTH-CTX-025 — Diseñar contrato SQL de get_access_context
### [ ] AUTH-CTX-026 — Diseñar contrato canónico de evaluate_authorization
### [ ] AUTH-CTX-027 — Definir consumo centralizado del contexto por las aplicaciones

> **PUERTA CONTRACTUAL OBLIGATORIA ANTES DE AUTH-CTX-028**
>
> Antes de iniciar `AUTH-CTX-028` deberá desarrollarse y aprobarse:
>
> `AUTH-MOD-021 — Definir rol base mínimo no privilegiado para trabajadores puramente operativos`
>
> Esta puerta es obligatoria porque `AUTH-CTX-028` deberá diseñar la
> compatibilidad temporal de los oficios base legacy contra el rol mínimo
> canónico ya aprobado.
>
> `AUTH-MOD-021` no bloquea `AUTH-CTX-009` a `AUTH-CTX-027`.

### [ ] AUTH-CTX-028 — Definir compatibilidad temporal con get_operational_context
### [ ] AUTH-CTX-029 — Definir estrategia de invalidación y caché
### [ ] AUTH-CTX-030 — Definir plan de pruebas contractuales del contexto y la decisión

Regla de implementación

AUTH-CTX-025 a AUTH-CTX-030 permanecen documentales dentro del BLOQUE E.

Durante este bloque no se crearán:

- funciones SQL;
- RPC;
- migraciones;
- políticas RLS;
- grants;
- triggers;
- cambios físicos en Supabase.

Su implementación deberá ejecutarse en el BLOQUE R después de aprobar:

- la arquitectura de esquemas;
- la capa expuesta de RPC;
- la capa privada de helpers;
- la política de SECURITY DEFINER;
- la política de grants y RLS;
- el plan de transición;
- el mecanismo de compatibilidad con consumidores existentes.

Resultado esperado

AccessContext
{
  principal,
  actor_effective,
  domain_identity,
  employee,
  base_role,
  assigned_sites,
  assigned_areas,
  active_shift,
  active_checkin_session,
  operational_role,
  operational_site,
  operational_area,
  device_context,
  structural_issues
}

AuthorizationDecision
{
  app_code,
  permission_code,
  authorization_requirement,
  resource,
  base_decision,
  operational_decision,
  matched_allows,
  structural_denies,
  actor_wide_denies,
  lane_denies,
  blocked_reasons,
  final_decision
}

SimulationContext
{
  real_actor,
  simulated_subject,
  hypothetical_context,
  expires_at,
  would_allow,
  would_deny,
  indeterminate
}

