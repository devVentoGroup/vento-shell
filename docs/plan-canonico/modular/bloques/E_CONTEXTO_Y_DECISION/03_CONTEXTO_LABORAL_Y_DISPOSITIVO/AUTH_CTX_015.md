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

