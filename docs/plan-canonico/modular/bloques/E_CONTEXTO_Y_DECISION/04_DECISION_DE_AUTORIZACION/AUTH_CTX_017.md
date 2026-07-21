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


