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


