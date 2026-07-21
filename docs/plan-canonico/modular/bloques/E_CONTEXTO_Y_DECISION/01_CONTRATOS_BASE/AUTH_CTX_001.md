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


