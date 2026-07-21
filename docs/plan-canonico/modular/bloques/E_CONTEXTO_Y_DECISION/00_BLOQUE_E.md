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

### [ ] AUTH-CTX-009 — Incluir cobertura administrativa por sede y área
### [ ] AUTH-CTX-010 — Incluir turno publicado y vigente
### [ ] AUTH-CTX-011 — Incluir sesión de check-in activa
### [ ] AUTH-CTX-012 — Incluir rol operativo efectivo
### [ ] AUTH-CTX-013 — Incluir sede y área operativas
### [ ] AUTH-CTX-014 — Incluir contexto de dispositivo compartido
### [ ] AUTH-CTX-015 — Incluir razones estructuradas de invalidez

AUTHORIZATION DECISION

### [ ] AUTH-CTX-016 — Incluir aplicación y permiso solicitado
### [ ] AUTH-CTX-017 — Incluir authorization_requirement
### [ ] AUTH-CTX-018 — Incluir recurso y territorio resueltos
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

