## DISEÑO DE IMPLEMENTACIÓN Y TRANSICIÓN

### ✅ AUTH-CTX-025 — Diseñar contrato SQL de get_access_context

| Campo                           | Valor                                                                                                  |
| ------------------------------- | ------------------------------------------------------------------------------------------------------ |
| **Estado**                      | APROBADA                                                                                               |
| **Bloque**                      | BLOQUE E — Contexto y decisión de autorización unificados                                              |
| **Subbloque**                   | DISEÑO DE IMPLEMENTACIÓN CANÓNICA                                                                      |
| **Naturaleza**                  | Diseño documental de contrato SQL futuro                                                               |
| **Implementación física**       | No incluida                                                                                            |
| **Tarea anterior vigente**      | `AUTH-CTX-024` — APROBADA                                                                              |
| **Tarea posterior reservada**   | `AUTH-CTX-026` — Diseñar contrato canónico de `evaluate_authorization`                                 |
| **Contrato producido**          | `AccessContext@1.0.0`                                                                                  |
| **Perfil de serialización**     | `vento.canonical-json@1.0.0`                                                                           |
| **Identidad lógica de función** | `get_access_context(text) → jsonb`                                                                     |
| **Nombre físico calificado**    | Pendiente de `SUPA-ARC-005`, `SUPA-ARC-006` y `SUPA-ARC-013`                                           |
| **Cambio contractual**          | Define la frontera SQL sin cambiar `AccessContext@1.0.0`                                               |
| **Cambios físicos permitidos**  | No                                                                                                     |
| **Brecha física detectada**     | No existe tarea específica para implementar el resolver canónico                                       |
| **Nueva tarea requerida**       | `AUTH-DB-033 — Implementar get_access_context canónico, sus resolvers privados y su proyección segura` |

Esta tarea diseña la frontera SQL futura que producirá el
`AccessContext@1.0.0` real y autoritativo de Vento OS.

La función tendrá una responsabilidad estrictamente contextual:

```text
CREDENCIAL TÉCNICA REAL
+
APLICACIÓN CANÓNICA SOLICITANTE
+
FUENTES EMPRESARIALES AUTORITATIVAS
+
INSTANTE ÚNICO DE RESOLUCIÓN
=
ACCESS CONTEXT INMUTABLE
```

No decidirá permisos, no resolverá recursos de una acción, no mezclará
simulación, no aplicará bypass por nombre de rol y no aceptará desde el caller
ningún hecho empresarial autoritativo.

La firma lógica propuesta es:

```sql
get_access_context(
  p_app_code text
)
returns jsonb
```

La sintaxis anterior es contractual y no constituye una migración ejecutable.

---

#### 1. Objetivo

Definir de forma cerrada:

1. la identidad lógica de la función;
2. su firma SQL;
3. sus únicos parámetros permitidos;
4. los parámetros expresamente prohibidos;
5. el tipo y forma del resultado;
6. la fuente del principal autenticado;
7. la resolución del actor efectivo;
8. la resolución de identidad de dominio;
9. la resolución laboral;
10. la separación entre carril base y operativo;
11. el tratamiento de dispositivos compartidos;
12. el tratamiento de actores de sistema;
13. la exclusión de simulación;
14. la semántica de errores;
15. la seguridad SQL;
16. la volatilidad;
17. la consistencia del snapshot;
18. la serialización canónica;
19. la exposición segura;
20. la transición desde resolvers legacy;
21. la responsabilidad de implementación futura;
22. las pruebas que deberán existir antes de adopción.

---

#### 2. Base normativa

AUTH-CTX-025 conserva sin cambios las decisiones aprobadas en:

- `ADR-AUTH-001`;
- `AUTH-MOD-001` a `AUTH-MOD-020`;
- `AUTH-CAT-001` a `AUTH-CAT-024`;
- `AUTH-RBAC-001` a `AUTH-RBAC-028`;
- `AUTH-CTX-001` — `AccessContext`;
- `AUTH-CTX-002` — `AuthorizationDecision`;
- `AUTH-CTX-003` — `SimulationContext`;
- `AUTH-CTX-004` — versionado y serialización;
- `AUTH-CTX-005` a `AUTH-CTX-015` — nodos del contexto;
- `AUTH-CTX-016` a `AUTH-CTX-024` — decisión, evidencia y auditoría;
- `SUPA-ARC-005` — capa expuesta;
- `SUPA-ARC-006` — capa privada;
- `SUPA-ARC-007` — auditoría y eventos;
- `SUPA-ARC-008` a `SUPA-ARC-010` — Auth, identidades, sesiones y revocación;
- `SUPA-ARC-013` — convenciones de funciones y RPC;
- `SUPA-ARC-014` — política de `SECURITY DEFINER`;
- `SUPA-ARC-015` — exposición, grants y RLS;
- `SUPA-ARC-023` — generación de tipos;
- `SUPA-ARC-024` — entornos;
- `AUTH-DB-019` — vínculos canónicos entre Auth e identidades;
- `AUTH-DB-027` — harness físico de pruebas;
- `AUTH-DB-028` — baseline y drift;
- `AUTH-DB-030` — retiro legacy;
- `AUTH-DB-031` — certificación final.

Principios obligatorios:

```text
CALLER
NO DECLARA
ACTOR, EMPLEADO, ROL, SEDE, ÁREA, TURNO, CHECK-IN O DISPOSITIVO
```

```text
GET_ACCESS_CONTEXT
RESUELVE HECHOS
NO DECIDE PERMISOS
```

```text
ACCESS CONTEXT REAL
≠
SIMULATION CONTEXT
```

```text
SQL SECURITY DEFINER
≠
AUTORIDAD EMPRESARIAL
```

---

#### 3. Estado físico conocido

El estado actual contiene resolvers previos que no representan el contrato
canónico final.

Entre ellos existen:

```text
get_operational_context(...)
get_effective_context_v1(...)
```

Estos resolvers son antecedentes técnicos, no fuente normativa del contrato
nuevo.

---

#### 4. Divergencias legacy identificadas

El estado actual presenta, entre otras, las siguientes divergencias:

1. acepta un `employee_id` suministrado como parámetro;
2. acepta una sede suministrada como parámetro;
3. usa sede seleccionada como fallback;
4. usa sede predeterminada del empleado como fallback;
5. aplica bypass por nombres de rol;
6. mezcla contexto administrativo y operativo;
7. devuelve un booleano `can_operate`;
8. interpreta políticas por aplicación dentro del contexto;
9. mezcla simulación con contexto real;
10. utiliza `navigation_role` como rol operativo;
11. trata dispositivo compartido como fuente de rol;
12. devuelve una forma plana distinta de `AccessContext@1.0.0`;
13. no publica metadatos contractuales completos;
14. no garantiza fingerprints de fuentes;
15. no representa todos los problemas estructurales congelados;
16. no conserva la separación completa entre principal y actor;
17. no representa asignaciones múltiples canónicas;
18. puede resolver hechos mediante precedencias de fallback incompatibles.

Ninguna de estas divergencias será incorporada al contrato nuevo.

---

#### 5. Decisión principal

Se define la identidad lógica:

```text
get_access_context(text) → jsonb
```

Forma conceptual:

```sql
create function <authorization_internal_schema>.get_access_context(
  p_app_code text
)
returns jsonb
language plpgsql
stable
security definer
set search_path = pg_catalog, <schemas_privados_aprobados>;
```

Los nombres entre `<...>` son marcadores documentales.

La ubicación física y el `search_path` exactos deberán aprobarse en
`SUPA-ARC-005`, `SUPA-ARC-006`, `SUPA-ARC-013` y `SUPA-ARC-014`.

---

#### 6. Identidad contractual SQL

La identidad de la función se compone de:

```text
nombre = get_access_context
argumentos = (text)
retorno = jsonb
```

No se considerarán equivalentes:

```text
get_access_context()
get_access_context(uuid)
get_access_context(text, uuid)
get_access_context(jsonb)
get_access_context_v1(text)
```

Una firma alternativa exigirá una decisión contractual explícita.

---

#### 7. Único parámetro permitido

El único parámetro público del contrato será:

```sql
p_app_code text
```

Su propósito es seleccionar la aplicación canónica que solicita el contexto
y, con ello:

- la identidad de dominio aplicable;
- el conjunto de tipos de principal admitidos;
- la política de dispositivo aplicable;
- la fuente empresarial que debe resolverse;
- la compatibilidad del contexto con el consumidor.

No autoriza capacidades de esa aplicación.

---

#### 8. p_app_code obligatorio

`p_app_code`:

- no tendrá valor por defecto;
- no podrá ser `null`;
- no podrá ser cadena vacía;
- no podrá contener espacios periféricos;
- deberá coincidir exactamente con un código publicado;
- no se corregirá silenciosamente;
- no se transformará mediante `lower()` para ocultar errores;
- no admitirá alias;
- no admitirá nombres de rutas;
- no admitirá nombres comerciales libres.

---

#### 9. Aplicación desconocida o inactiva

Un código con forma válida pero sin configuración autoritativa producirá un
contexto estructuralmente inválido mediante códigos ya congelados:

```text
RESOLVER_CONFIGURATION_MISSING
```

Más de una configuración autoritativa producirá:

```text
RESOLVER_CONFIGURATION_AMBIGUOUS
```

No se inventará una aplicación predeterminada.

---

#### 10. Parámetro nulo o mal formado

Un parámetro que no permita siquiera identificar la invocación contractual
producirá un error SQL de argumento inválido.

Categoría prevista:

```text
SQLSTATE 22023 — invalid_parameter_value
```

No se devolverá `null`.

No se utilizará una excepción genérica con texto libre como contrato de
negocio.

---

#### 11. Parámetros prohibidos

La firma no aceptará:

```text
p_user_id
p_auth_user_id
p_principal_id
p_actor_id
p_employee_id
p_customer_id
p_device_id
p_actor_session_id
p_role
p_base_role
p_operational_role
p_site_id
p_area_id
p_shift_id
p_checkin_id
p_selected_site_id
p_simulation_id
p_bypass
p_can_operate
p_permission_key
p_resource_id
```

Estos datos serán resueltos o pertenecerán a contratos posteriores.

---

#### 12. Prohibición de overload inseguro

No se creará un overload ejecutable por aplicaciones que permita:

```text
get_access_context(p_app_code, p_employee_id)
```

o cualquier variante equivalente.

Las tareas administrativas de soporte y simulación deberán utilizar
contratos separados, con permisos separados y sin producir autoridad real.

---

#### 13. Tipo de retorno

La función retornará:

```sql
jsonb
```

El valor será un único objeto que cumpla:

```text
AccessContext@1.0.0
schema_version = 1.0.0
```

No retornará:

- tabla plana;
- múltiples filas;
- array de contextos;
- booleano;
- lista de permisos;
- record parcial;
- texto JSON;
- `void`.

---

#### 14. Razón para usar jsonb

`jsonb` permite representar sin aplanamiento:

- principal;
- actor efectivo;
- identidad de dominio;
- empleado;
- rol base;
- asignaciones múltiples;
- cobertura;
- turno;
- check-in;
- rol y territorio operativos;
- dispositivo;
- readiness;
- problemas estructurales;
- metadata de resolución.

El tipo SQL físico no redefine la semántica del contrato publicado.

---

#### 15. Un resultado exacto

Toda invocación contractualmente válida deberá producir:

```text
exactamente un objeto
```

No deberá producir:

- cero filas;
- más de una fila;
- `null`;
- una lista con un elemento;
- una envoltura PostgREST propia del dominio.

La ausencia o invalidez de hechos se expresa dentro del objeto.

---

#### 16. Metadatos contractuales raíz

El resultado deberá declarar:

```json
{
  "contract_family": "vento.authorization.response-contracts",
  "contract_family_version": "1.0.0",
  "contract_name": "AccessContext",
  "contract_version": "1.0.0",
  "schema_version": "1.0.0"
}
```

Los demás campos aprobados se agregan a la misma raíz.

---

#### 17. Forma raíz obligatoria

La función deberá producir conceptualmente:

```ts
type AccessContextV1 = ContractMetadata & {
  contract_name: "AccessContext";
  contract_version: "1.0.0";
  schema_version: "1.0.0";

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

---

#### 18. No modificación de AccessContext

AUTH-CTX-025 no agrega:

- `app_code` a la raíz;
- `correlation_id`;
- `context_fingerprint`;
- `permission_key`;
- `resource`;
- `can_operate`;
- `is_simulation`;
- `bypass_applied`;
- `selected_site_id`;
- `navigation_role`.

La función produce el contrato ya publicado.

---

#### 19. Vinculación con p_app_code

Aunque `app_code` no se agrega a la raíz de `AccessContext@1.0.0`, la
invocación queda vinculada mediante:

- el argumento exacto;
- la política de identidad de dominio seleccionada;
- las fuentes y versiones registradas;
- el snapshot utilizado por la decisión posterior;
- `AuthorizationDecision.request.app_code`;
- el fingerprint calculado por el evaluador.

Un contexto no se reutilizará para una aplicación distinta.

---

#### 20. context_id

`context_id` será:

- generado en servidor;
- único por resolución nueva;
- inmutable;
- no derivado del actor;
- no derivado del usuario;
- no derivado del dispositivo;
- no reutilizable como token;
- no reutilizable como permiso.

La estrategia física de generación corresponde a `AUTH-DB-033`.

---

#### 21. context_id y caché

Antes de AUTH-CTX-029:

```text
resolución nueva
→ context_id nuevo
```

Cuando exista caché aprobada:

```text
cache HIT del mismo snapshot
→ podrá conservar el context_id almacenado
```

No se reutilizará un `context_id` con contenido distinto.

---

#### 22. resolved_at

`resolved_at` será un timestamp de servidor:

- capturado una sola vez;
- con zona horaria;
- serializado en UTC;
- utilizado para validar todas las vigencias;
- común a todos los resolvers internos;
- no suministrado por el cliente.

Formato de salida:

```text
RFC 3339 / ISO 8601 UTC
```

---

#### 23. Instante único

Toda la función deberá utilizar un único valor lógico:

```text
v_resolved_at
```

No se mezclarán llamadas independientes a relojes que puedan producir
fronteras diferentes dentro del mismo contexto.

---

#### 24. Snapshot único

Todos los hechos deberán observarse bajo el mismo snapshot transaccional.

Queda prohibido:

- resolver principal en una consulta y turno en otra transacción;
- mezclar un cache antiguo con asignaciones actuales;
- combinar revisiones de turno distintas;
- resolver dispositivo antes y actor después de una mutación visible;
- reconstruir el objeto en el cliente.

Una mezcla detectable produce:

```text
CONTEXT_SNAPSHOT_MIXED
```

---

#### 25. Volatilidad SQL

La función se declarará:

```sql
stable
```

porque:

- solo lee fuentes autoritativas;
- no ejecuta mutaciones;
- debe observar una vista estable durante el statement;
- puede depender de identidad y tiempo de statement;
- no es `IMMUTABLE`.

No se declarará `VOLATILE` para ocultar escrituras internas.

---

#### 26. Función sin efectos empresariales

`get_access_context` no deberá:

- crear sesiones;
- abrir turnos;
- crear check-ins;
- seleccionar sede;
- actualizar preferencias;
- crear actores;
- corregir asignaciones;
- revocar credenciales;
- insertar auditoría empresarial durable;
- emitir eventos de dominio;
- modificar caches sin una estrategia aprobada;
- ejecutar la acción solicitada.

---

#### 27. Fuente del principal

El principal técnico se resolverá desde la sesión real de PostgreSQL/Supabase:

- identidad autenticada;
- claims validados;
- rol técnico de conexión;
- vínculo empresarial vigente;
- sesión de dispositivo cuando corresponda.

El caller no enviará `principal_id`.

---

#### 28. Uso de auth.uid()

`auth.uid()` podrá participar como localizador técnico.

No se interpretará directamente como:

- `employee_id`;
- `customer_id`;
- `device_id`;
- actor efectivo;
- rol;
- sede;
- área;
- autorización.

Siempre deberá existir una relación empresarial autoritativa.

---

#### 29. Claims JWT

Los claims podrán usarse para:

- identificar la sesión técnica;
- clasificar el tipo de sesión;
- localizar el principal;
- validar expiración y audiencia.

No podrán sustituir:

- estado laboral;
- rol base;
- asignaciones;
- turno;
- check-in;
- rol operativo;
- sede o área;
- grants;
- denies.

---

#### 30. Sesión humana personal

Para una sesión personal:

```text
principal.principal_type = HUMAN_USER
```

El resolver deberá:

1. identificar la credencial;
2. resolver el principal empresarial;
3. seleccionar identidad de dominio según `p_app_code`;
4. resolver actor efectivo;
5. resolver empleado cuando aplique;
6. construir carriles de forma independiente.

No asumirá:

```text
auth.uid() = employee.id
```

---

#### 31. Identidad de dominio

`domain_identity` se seleccionará mediante:

```text
principal real
+
p_app_code
+
política canónica de identidad de la aplicación
```

No se seleccionará por:

- primera relación encontrada;
- nombre del frontend;
- claim de rol;
- tabla consultada por una aplicación;
- tipo de usuario preferido por el cliente.

---

#### 32. Múltiples identidades de dominio

Cuando una credencial represente, por ejemplo:

```text
CUSTOMER
+
EMPLOYEE
```

la aplicación deberá determinar qué identidad acepta.

Si la política no permite resolver una identidad única:

```text
DOMAIN_IDENTITY_AMBIGUOUS
```

No se combinarán identidades para ampliar autoridad.

---

#### 33. Actor efectivo

El actor efectivo se resolverá después del principal y de la identidad
aplicable.

Deberá cumplir:

```text
actor_effective
≠ principal
```

aunque ambos puedan referenciar a la misma persona en una sesión personal.

---

#### 34. Delegación

Una delegación solo será válida cuando exista una relación empresarial
explícita y vigente.

El caller no podrá enviar `delegation_id`.

Una delegación inválida produce:

```text
DELEGATION_INVALID
```

No existe delegación implícita por `service_role`.

---

#### 35. Empleado

El empleado se resolverá desde el actor efectivo laboral.

No se buscará directamente mediante:

- email suministrado;
- documento suministrado;
- nombre;
- `p_employee_id`;
- rol;
- sede;
- último turno.

La existencia de un usuario de Auth no garantiza un empleado.

---

#### 36. Empleado inactivo

Un empleado identificado e inactivo se representa como estado empresarial
conocido.

Resultado esperado:

```text
employee.is_active = false
base readiness = UNAVAILABLE
operational readiness = UNAVAILABLE
reason_codes incluye EMPLOYEE_INACTIVE
```

No se reactivará mediante asignaciones, turnos, check-ins o permisos
residuales.

---

#### 37. Rol base

El rol base deberá resolverse desde una asignación laboral canónica vigente.

No se derivará de:

- `employees.role` legacy sin mapeo aprobado;
- turno;
- check-in;
- dispositivo;
- navegación;
- nombre de cargo;
- sede seleccionada.

Ambigüedad produce:

```text
BASE_ROLE_AMBIGUOUS
```

---

#### 38. Asignaciones de sede

`assigned_sites` contendrá todas las asignaciones laborales relevantes,
normalizadas y ordenadas.

No se colapsará a:

```text
employees.site_id
```

Reglas:

- lista vacía significa ninguna asignación;
- varias sedes no significan organización;
- una sede primaria no autoriza por sí sola;
- duplicados contradictorios producen problema estructural.

---

#### 39. Orden de assigned_sites

Orden canónico:

1. `site_code`;
2. `site_id`.

`is_primary` no altera el orden ni concede precedencia de autoridad.

---

#### 40. Asignaciones de área

`assigned_areas` deberá:

- conservar área y sede;
- verificar pertenencia;
- distinguir área concreta de tipo de área;
- detectar duplicados;
- ordenar determinísticamente;
- no conceder permisos.

Orden canónico:

1. `site_id`;
2. `area_kind`;
3. `area_id`.

---

#### 41. Cobertura administrativa

`administrative_coverage` se resolverá desde:

- rol base;
- asignaciones;
- reglas explícitas;
- autoridad organizacional aprobada.

No utilizará:

- sede seleccionada;
- sede primaria como fallback;
- turno;
- check-in;
- dispositivo;
- permiso evaluado;
- recurso todavía desconocido.

---

#### 42. Organización

```text
mode = ORGANIZATION
```

solo podrá producirse mediante autoridad explícita.

No se deduce de:

- rol con nombre privilegiado;
- lista vacía;
- `null`;
- varias sedes;
- `service_role`;
- acceso a todas las filas mediante SQL.

---

#### 43. Turno activo

`active_shift` deberá resolverse desde una revisión:

- publicada;
- autoritativa;
- vigente en `resolved_at`;
- correspondiente al actor;
- con rango temporal válido;
- sin solapamiento ambiguo;
- con sede válida;
- con rol operativo resoluble.

No se seleccionará por orden arbitrario con `limit 1`.

---

#### 44. Turnos nocturnos y zona horaria

La vigencia de turnos deberá usar:

- timestamps o reglas temporales canónicas;
- zona horaria de la sede o política aprobada;
- cruce de medianoche explícito;
- `resolved_at` único.

Queda prohibido fijar de forma silenciosa:

```text
America/Bogota
```

dentro del resolver para todos los dominios futuros.

La fuente de zona horaria deberá ser autoritativa y versionada.

---

#### 45. Ausencia de turno

Cuando no exista turno vigente y no haya contradicción:

```text
active_shift = null
operational readiness = UNAVAILABLE
reason_codes incluye NO_ACTIVE_SHIFT
```

La ausencia de turno no bloquea el carril base.

---

#### 46. Solapamiento de turnos

Más de un turno vigente candidato produce:

```text
SHIFT_OVERLAP
active_shift = null
operational readiness = INVALID
```

No se resolverá mediante:

- primer registro;
- turno más reciente;
- turno más antiguo;
- prioridad no declarada;
- turno elegido por el cliente.

---

#### 47. Check-in activo

`active_checkin_session` deberá representar una sesión canónica activa.

No se reconstruirá únicamente buscando:

```text
último check_in sin check_out posterior
```

si el modelo canónico ya dispone de sesiones, vínculos terminales o estados.

---

#### 48. Ausencia de check-in

Ausencia normal:

```text
active_checkin_session = null
reason_codes incluye NO_ACTIVE_CHECKIN
```

No produce por sí sola `StructuralIssue`.

El carril operativo podrá continuar `READY` para permisos con prerrequisito
`T`.

---

#### 49. Check-in incompatible

Un check-in de:

- otro actor;
- otro turno;
- otra sede;
- área incompatible;
- sesión cerrada;
- sesión expirada;
- evento pendiente offline;

no se acepta como activo.

Se emite el código estructural correspondiente.

---

#### 50. Rol operativo

`operational_role` se deriva exclusivamente del turno válido.

No procede de:

- rol base;
- `navigation_role`;
- dispositivo;
- último rol usado;
- perfil predeterminado;
- frontend;
- check-in aislado.

---

#### 51. Sede operativa

`operational_site` se deriva del turno válido.

No se resuelve mediante:

```text
coalesce(
  p_site_id,
  selected_site_id,
  checkin_site_id,
  shift_site_id,
  employee_default_site_id
)
```

La sede seleccionada y la sede predeterminada no sustituyen el turno.

---

#### 52. Área operativa

`operational_area`:

- deriva del turno;
- puede ser confirmada por check-in;
- debe pertenecer a la sede;
- puede ser `null` legítimamente;
- no se toma de un selector;
- no se toma de la última marcación.

La necesidad de área depende posteriormente del permiso.

---

#### 53. Dispositivo administrado

Un dispositivo administrado podrá participar como contexto técnico aun en una
sesión personal.

`device_context` se incluye únicamente cuando existe un dispositivo canónico
resuelto.

No se construye desde:

- user agent;
- IP;
- hostname;
- navegador;
- texto enviado por cliente.

---

#### 54. Dispositivo compartido

En dispositivo compartido:

```text
principal = SHARED_DEVICE
actor_effective = EMPLOYEE o UNRESOLVED
```

El actor se resuelve desde una sesión de actor vigente.

El dispositivo no aporta:

- rol base;
- rol operativo;
- grant;
- sede empresarial del actor;
- permiso.

Puede restringir aplicaciones y capacidades, nunca ampliarlas.

---

#### 55. Dispositivo sin actor

Un dispositivo compartido válido sin sesión humana produce:

```text
actor_effective.actor_type = UNRESOLVED
lane_readiness.base = UNAVAILABLE
lane_readiness.operational = UNAVAILABLE
reason_codes incluye DEVICE_ACTOR_SESSION_NOT_AVAILABLE
```

No se reutiliza el último actor.

---

#### 56. navigation_role prohibido

`navigation_role` no se utilizará para llenar:

- `base_role`;
- `operational_role`;
- `actor_effective`;
- `administrative_coverage`;
- `lane_readiness`.

Puede permanecer como dato legacy hasta su retiro, pero no participa en el
contrato canónico.

---

#### 57. Simulación excluida

`get_access_context` nunca resolverá:

- `simulation_id`;
- actor simulado;
- rol simulado;
- sede simulada;
- área simulada;
- turno hipotético;
- grants hipotéticos.

No consultará una simulación activa antes del contexto real.

La simulación pertenece a `SimulationContext`.

---

#### 58. Actor de sistema

Un actor de sistema deberá resolverse mediante:

- principal técnico registrado;
- proceso permitido;
- identidad de dominio `SYSTEM`;
- actor de sistema exacto;
- delegación explícita cuando actúe por otra entidad.

El uso de `service_role` no basta.

---

#### 59. Principal anónimo

El contrato puede representar `ANONYMOUS`.

Sin embargo, la función no se concederá a `anon` por defecto.

La exposición anónima futura requerirá:

- caso de uso explícito;
- política por aplicación;
- proyección segura;
- grant específico;
- pruebas negativas;
- aprobación en `SUPA-ARC-015`.

---

#### 60. lane_readiness

La función calculará:

```ts
lane_readiness: {
  base: LaneReadiness;
  operational: LaneReadiness;
}
```

No producirá:

- `can_operate`;
- `can_admin`;
- `has_permission`;
- `allow`;
- `deny`.

Readiness solo expresa suficiencia estructural.

---

#### 61. Carril base

El carril base se calcula en este orden:

```text
1. BLOCKING_ALL
2. tipo de actor
3. estado laboral
4. BLOCKING_BASE
5. rol base
6. cobertura administrativa
7. estado final
```

No depende de turno o check-in.

---

#### 62. Carril operativo

El carril operativo se calcula en este orden:

```text
1. BLOCKING_ALL
2. tipo de actor
3. estado laboral
4. BLOCKING_OPERATIONAL
5. turno
6. rol operativo
7. sede operativa
8. área cuando corresponda al rol
9. disponibilidad de check-in
10. estado final
```

No evalúa todavía el prerrequisito de un permiso concreto.

---

#### 63. structural_issues

La función producirá `structural_issues` usando únicamente el catálogo
congelado en AUTH-CTX-015.

No inventará códigos SQL locales.

No incluirá:

- nombres de excepciones;
- stack traces;
- mensajes de PostgreSQL;
- nombres de tablas;
- consultas;
- datos personales;
- falta de grant;
- denegaciones de permiso.

---

#### 64. Propiedad de resolvers

Cada problema será emitido por su resolver propietario:

- principal;
- identidad de dominio;
- actor;
- empleado;
- rol base;
- asignaciones;
- cobertura;
- turno;
- check-in;
- rol operativo;
- territorio operativo;
- dispositivo;
- validador de contexto;
- freshness resolver.

Un resolver dependiente no duplicará la causa.

---

#### 65. Supresión de cascadas

Ejemplo:

```text
SHIFT_OVERLAP
→ turno null
→ rol operativo null
→ sede operativa null
→ área operativa null
```

Se emite la causa raíz.

No se agregan falsamente códigos de rol, sede y área desconocidos como
consecuencia automática.

---

#### 66. Deduplificación

La identidad de un `StructuralIssue` será:

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

Metadatos incompatibles producen:

```text
STRUCTURAL_ISSUE_METADATA_INVALID
```

---

#### 67. Orden de structural_issues

Orden obligatorio:

1. severidad;
2. `issue_code`;
3. `subject_type`;
4. `subject_id`, usando cadena vacía para `null`;
5. `source`.

El resultado no dependerá del plan de ejecución SQL.

---

#### 68. Orden de reason_codes

Cada `reason_codes` deberá:

- eliminar duplicados;
- respetar precedencia estructural;
- ordenar códigos de disponibilidad alfabéticamente;
- mantener salida determinista.

---

#### 69. ResolutionMetadata

La función producirá:

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

No se agregan propiedades.

---

#### 70. resolver

Valor lógico inicial propuesto:

```text
vento.authorization.get_access_context
```

No será:

- nombre de archivo;
- esquema físico;
- hostname;
- nombre de aplicación;
- nombre de persona;
- nombre de migración.

AUTH-DB-033 congelará el identificador físico publicado.

---

#### 71. resolver_version

`resolver_version` identificará una implementación exacta.

No se aceptan:

```text
latest
main
current
production
unknown
```

Podrá usar una versión semántica o build inmutable aprobada.

---

#### 72. authorization_contract_version

Deberá declarar:

```text
1.0.0
```

y coincidir con:

```text
contract_version
```

Una incompatibilidad produce:

```text
CONTRACT_VERSION_UNSUPPORTED
```

---

#### 73. catalog_version

`catalog_version` identificará el catálogo canónico utilizado para:

- aplicaciones;
- identidades admitidas;
- roles;
- sedes;
- áreas;
- dispositivos;
- demás configuraciones contextuales.

No sustituye hashes de fuentes.

---

#### 74. source_versions

`source_versions` deberá identificar cada fuente materialmente utilizada.

Ejemplos conceptuales:

```json
{
  "principal_registry": "1.0.0",
  "domain_identity_policy": "1.0.0",
  "employment_model": "1.0.0",
  "role_catalog": "1.0.0",
  "site_catalog": "1.0.0",
  "area_catalog": "1.0.0",
  "shift_model": "1.0.0",
  "checkin_model": "1.0.0",
  "device_model": "1.0.0",
  "structural_issue_catalog": "1.0.0"
}
```

Las claves finales se congelarán en AUTH-DB-033 después de E3.

---

#### 75. source_fingerprints

`source_fingerprints` deberá identificar snapshots autoritativos usados.

No se usarán hashes de:

- tabla completa cuando no corresponda;
- documento compilado;
- aplicación cliente;
- JWT completo;
- secretos;
- texto formateado no canónico.

La preimagen deberá ser reproducible y segura.

---

#### 76. Fingerprint del contexto

`get_access_context` deberá producir todos los datos necesarios para calcular
el `context_fingerprint` requerido por `AccessContextReference`.

La huella final podrá calcularse:

- dentro del resolver privado; o
- inmediatamente en `evaluate_authorization`;

pero deberá usar el objeto canónico exacto y el mismo perfil de
serialización.

No se agrega un campo nuevo a `AccessContext@1.0.0`.

---

#### 77. Serialización canónica

La construcción JSON deberá respetar:

```text
vento.canonical-json@1.0.0
```

Incluye:

- claves obligatorias presentes;
- `null` explícito;
- arrays vacíos explícitos;
- timestamps normalizados;
- enums exactos;
- arrays ordenados cuando son conjuntos;
- orden preservado cuando la secuencia es semántica;
- ausencia de números ambiguos;
- Unicode normalizado.

---

#### 78. jsonb::text prohibido como única canonicalización

No se asumirá que:

```sql
some_jsonb::text
```

implementa por sí solo todo el perfil `vento.canonical-json@1.0.0`.

La función física de canonicalización deberá aprobarse y probarse en
`AUTH-DB-033` y `AUTH-DB-027`.

---

#### 79. null y listas vacías

Se conserva:

```text
null
≠ global
```

```text
[]
= ningún elemento
```

No se omitirán campos obligatorios para reducir payload.

---

#### 80. Seguridad de ejecución

La implementación canónica requerirá privilegios para leer fuentes
restringidas.

Por ello la función podrá ser `SECURITY DEFINER` únicamente bajo estas
condiciones:

- propietario técnico no interactivo;
- propietario sin autoridad empresarial implícita;
- `search_path` fijo;
- objetos referenciados con nombres calificados;
- ausencia de SQL dinámico inseguro;
- revocación de ejecución a `PUBLIC`;
- helpers privados no expuestos;
- pruebas de escalamiento;
- revisión en `SUPA-ARC-014`.

---

#### 81. search_path

Queda prohibido:

```sql
set search_path = public
```

como única protección.

El `search_path` deberá:

- iniciar con `pg_catalog`;
- incluir únicamente esquemas aprobados;
- excluir esquemas escribibles por callers;
- utilizar nombres calificados para objetos críticos;
- congelarse en la migración.

---

#### 82. SQL dinámico

La implementación no deberá usar SQL dinámico para seleccionar:

- tabla por app;
- columna por rol;
- esquema por cliente;
- función por permiso.

Si alguna parte exige SQL dinámico, deberá justificar:

- lista cerrada;
- quoting seguro;
- imposibilidad de inyección;
- pruebas negativas;
- revisión específica.

La opción predeterminada es no utilizarlo.

---

#### 83. Grants

Política inicial:

```text
PUBLIC       → REVOKE
anon         → REVOKE
authenticated→ no acceso directo al contrato interno por defecto
```

La función completa será consumida por:

- `evaluate_authorization`;
- wrappers internos aprobados;
- pruebas privilegiadas;
- servicios autorizados.

La proyección segura para cliente se implementará separadamente dentro de
`AUTH-DB-033`.

---

#### 84. Proyección segura

El `AccessContext` completo puede contener evidencia interna que no debe
entregarse indiscriminadamente al cliente.

La proyección segura podrá incluir:

- tipo de principal seguro;
- actor efectivo mínimo;
- rol base cuando sea visible;
- sede y área operativas seguras;
- disponibilidad de carriles;
- códigos seguros;
- contexto de dispositivo mínimo;
- `context_id` cuando corresponda.

No incluirá por defecto:

- fingerprints;
- source versions internas;
- IDs sensibles;
- problemas no seguros;
- detalles de sesiones;
- configuración completa;
- datos de otros actores.

---

#### 85. Tarea física de proyección segura

La implementación de la proyección segura queda asignada a:

```text
AUTH-DB-033
```

La adaptación de consumidores legacy y la forma de compatibilidad se
diseñará en:

```text
AUTH-CTX-028
```

No queda como pendiente narrativo.

---

#### 86. RLS

`get_access_context` no dependerá de que el caller pueda leer directamente
todas las tablas fuente.

Tampoco deberá:

- desactivar RLS globalmente;
- conceder SELECT amplio al caller;
- devolver filas fuente;
- usar bypass de RLS como autoridad empresarial.

La función resuelve hechos; `evaluate_authorization` decide capacidades.

---

#### 87. service_role

`service_role` podrá permitir conectividad técnica.

No produce:

- actor empresarial;
- permiso;
- rol;
- cobertura;
- delegación;
- bypass.

Un proceso de sistema deberá estar registrado y autorizado explícitamente.

---

#### 88. Errores esperados frente a errores de infraestructura

Se separan:

```text
INCONSISTENCIA EMPRESARIAL O CONTEXTUAL
→ AccessContext válido
→ structural_issues
→ readiness fail closed
```

```text
CONTRATO DE INVOCACIÓN INVÁLIDO
→ error SQL estable
```

```text
FALLO DE INFRAESTRUCTURA QUE IMPIDE CONSTRUIR EL CONTRATO
→ excepción controlada
→ sin contexto parcial
→ fail closed
```

---

#### 89. No usar excepciones para estados normales

No se lanzará excepción por:

- ausencia normal de turno;
- ausencia normal de check-in;
- empleado inactivo conocido;
- dispositivo sin actor;
- actor no laboral;
- lista vacía de asignaciones;
- área opcional ausente.

Esos estados tienen representación contractual.

---

#### 90. Error interno

Un error interno no se convertirá en:

- contexto vacío;
- `can_operate = true`;
- contexto de sede predeterminada;
- actor de último uso;
- rol por nombre;
- respuesta parcial marcada como válida.

La operación falla cerrada.

---

#### 91. Mensajes de error

Los errores SQL expuestos no deberán revelar:

- nombres internos de tablas;
- existencia de otro empleado;
- IDs ajenos;
- stack traces;
- SQL;
- políticas de seguridad;
- secretos;
- datos personales.

La observabilidad interna conservará el detalle permitido.

---

#### 92. Sin decisiones de permiso

`get_access_context` no recibe `permission_key`.

No consulta:

- grants;
- denies;
- alcance de permiso;
- modalidad;
- recurso;
- restricciones de campos;
- sensibilidad;
- dependencias.

Estas responsabilidades pertenecen a `evaluate_authorization`.

---

#### 93. Sin can_operate

Queda prohibido agregar:

```text
can_operate
```

al resultado.

La pregunta:

```text
¿puede operar?
```

es ambigua sin permiso y recurso exactos.

---

#### 94. Sin bypass administrativo

Queda prohibido:

```text
role in ('propietario', 'gerente_general')
→ bypass
```

Los roles privilegiados siguen sujetos a:

- permiso exacto;
- modalidad;
- recurso;
- alcance;
- denies;
- auditoría.

---

#### 95. Sin fallback territorial

Queda prohibido resolver sede operativa mediante:

- parámetro del caller;
- sede seleccionada;
- sede primaria;
- sede del empleado legacy;
- sede del dispositivo como sustituto del turno;
- última sede usada.

Cada concepto permanece separado.

---

#### 96. Sin recurso

`AccessContext` no contiene:

- resource_id;
- resource_type solicitado;
- origen;
- destino;
- estado del recurso;
- campos solicitados;
- transición.

El recurso pertenece a `AuthorizationDecision`.

---

#### 97. Consumo por evaluate_authorization

AUTH-CTX-026 deberá diseñar:

```text
evaluate_authorization
→ valida solicitud
→ obtiene get_access_context(p_app_code)
→ calcula context_fingerprint
→ resuelve permiso y recurso
→ evalúa carriles
→ emite AuthorizationDecision
```

No deberá duplicar la resolución del contexto.

---

#### 98. Frontera de caché

AUTH-CTX-025 no define:

- TTL;
- clave de caché;
- invalidación;
- almacenamiento;
- coherencia eventual.

La implementación inicial deberá declarar:

```text
cache_status = NOT_IMPLEMENTED
```

hasta que AUTH-CTX-029 apruebe otra estrategia.

---

#### 99. No cachear por user_id solamente

Una futura clave de caché no podrá basarse únicamente en:

```text
auth.uid()
```

Debe considerar hechos como:

- principal;
- actor;
- app;
- dispositivo;
- sesión de actor;
- empleo;
- roles;
- asignaciones;
- turno;
- check-in;
- versiones;
- fuentes.

La definición exacta corresponde a AUTH-CTX-029.

---

#### 100. Auditoría y observabilidad

La resolución podrá emitir telemetría técnica mínima:

- duración;
- resolver version;
- success/failure técnico;
- correlation técnica cuando exista;
- cantidad de fuentes;
- cache status.

No deberá persistir por sí sola una acción empresarial.

La auditoría durable de decisiones pertenece a `AUTH-DB-032`.

---

#### 101. Rendimiento

La implementación deberá evitar:

- N+1 por asignación;
- consulta por cada código;
- carga de historiales completos;
- materialización de permisos;
- selección de columnas innecesarias;
- funciones repetidas por nodo sin snapshot común.

La optimización no podrá cambiar la semántica.

---

#### 102. Índices

Los índices necesarios se determinarán después de:

- auditoría física E3;
- esquema objetivo;
- consultas reales;
- planes de ejecución;
- volumen;
- cardinalidad.

La implementación corresponde a:

```text
AUTH-DB-025
AUTH-DB-033
```

No se diseñan índices concretos en esta tarea.

---

#### 103. Tipos generados

Después de implementar la función:

```text
AUTH-DB-026
```

deberá regenerar tipos.

Los consumidores no usarán tipos manuales divergentes como fuente de verdad.

---

#### 104. Estado actual get_operational_context

`get_operational_context` se clasifica como resolver legacy transitorio.

AUTH-CTX-027 deberá inventariar:

- firmas;
- consumidores;
- dependencias;
- políticas;
- RLS;
- RPC;
- tests;
- supuestos de sede;
- bypasses;
- códigos de error.

No se retirará todavía.

---

#### 105. Estado actual get_effective_context_v1

`get_effective_context_v1` se clasifica como agregador legacy incompatible
porque mezcla:

- contexto real;
- simulación;
- dispositivo;
- roles de navegación;
- bypass;
- decisión anticipada.

AUTH-CTX-027 deberá registrar cada consumidor.

AUTH-CTX-028 deberá diseñar la compatibilidad temporal.

---

#### 106. Estrategia de transición

Orden obligatorio:

```text
1. Aprobar AUTH-CTX-025.
2. Aprobar AUTH-CTX-026.
3. Auditar resolvers y consumidores en AUTH-CTX-027.
4. Diseñar compatibilidad en AUTH-CTX-028.
5. Definir caché en AUTH-CTX-029.
6. Aprobar pruebas en AUTH-CTX-030.
7. Aprobar arquitectura física E3.
8. Implementar AUTH-DB-033.
9. Ejecutar pruebas AUTH-DB-027.
10. Adaptar consumidores.
11. Verificar ausencia de lecturas legacy.
12. Retirar legacy mediante AUTH-DB-030.
13. Certificar con AUTH-DB-031.
```

---

#### 107. Nueva tarea AUTH-DB-033

Se crea explícitamente:

```text
AUTH-DB-033
— Implementar get_access_context canónico,
  sus resolvers privados y su proyección segura
```

Ubicación:

```text
BLOQUE R1 — Fundación física canónica
después de AUTH-DB-019
después de SUPA-ARC-005 a SUPA-ARC-015
antes de adoptar el contexto en AUTH-DB-006 a AUTH-DB-010
```

---

#### 108. Alcance futuro de AUTH-DB-033

`AUTH-DB-033` deberá:

- crear la función canónica;
- crear helpers privados;
- fijar schema y search_path;
- configurar propietario;
- revocar grants inseguros;
- implementar la proyección segura;
- implementar fingerprints de fuentes;
- validar versión contractual;
- producir JSON canónico;
- asegurar snapshot único;
- integrar catálogos;
- probar actores humanos;
- probar dispositivos;
- probar sistemas;
- probar errores;
- medir rendimiento;
- documentar rollback;
- registrar migración en `vento-shell`.

---

#### 109. Responsabilidades relacionadas

| Responsabilidad             | Tarea                           |
| --------------------------- | ------------------------------- |
| Contrato de `AccessContext` | `AUTH-CTX-001`                  |
| Nodos contextuales          | `AUTH-CTX-005` a `AUTH-CTX-015` |
| Contrato SQL de resolución  | `AUTH-CTX-025`                  |
| Contrato del evaluador      | `AUTH-CTX-026`                  |
| Inventario legacy           | `AUTH-CTX-027`                  |
| Compatibilidad temporal     | `AUTH-CTX-028`                  |
| Caché e invalidación        | `AUTH-CTX-029`                  |
| Pruebas contractuales       | `AUTH-CTX-030`                  |
| Capa expuesta y privada     | `SUPA-ARC-005`, `SUPA-ARC-006`  |
| Política SECURITY DEFINER   | `SUPA-ARC-014`                  |
| Grants y RLS                | `SUPA-ARC-015`                  |
| Implementación del resolver | `AUTH-DB-033`                   |
| Persistencia de decisiones  | `AUTH-DB-032`                   |
| Harness físico              | `AUTH-DB-027`                   |
| Migración progresiva        | `AUTH-DB-020`                   |
| Retiro legacy               | `AUTH-DB-030`                   |
| Certificación final         | `AUTH-DB-031`                   |

No queda pendiente narrativo sin dueño.

---

#### 110. Esqueleto SQL conceptual

```sql
-- DOCUMENTAL. NO EJECUTAR.

create function <authorization_internal_schema>.get_access_context(
  p_app_code text
)
returns jsonb
language plpgsql
stable
security definer
set search_path = pg_catalog, <schemas_privados_aprobados>
as $$
declare
  v_resolved_at timestamptz;
  v_result jsonb;
begin
  -- validar invocación;
  -- capturar instante único;
  -- resolver principal;
  -- resolver identidad de dominio;
  -- resolver actor;
  -- resolver identidad laboral;
  -- resolver carril base;
  -- resolver carril operativo;
  -- resolver dispositivo;
  -- consolidar problemas;
  -- calcular readiness;
  -- registrar metadata;
  -- validar contrato;
  -- serializar AccessContext@1.0.0;
  return v_result;
end;
$$;
```

No define tablas ni consultas físicas.

---

#### 111. Caso canónico: empleado administrativo sin turno

```text
p_app_code = viso
principal = HUMAN_USER
actor = EMPLOYEE
employee = ACTIVE
base_role = válido
administrative_coverage = válida
active_shift = null
base readiness = READY
operational readiness = UNAVAILABLE
```

No existe error por ausencia de turno.

---

#### 112. Caso canónico: empleado operativo con turno

```text
p_app_code = nexo
principal = HUMAN_USER
actor = EMPLOYEE
employee = ACTIVE
active_shift = válido
operational_role = válido
operational_site = válida
active_checkin_session = null
operational readiness = READY
reason_codes = [NO_ACTIVE_CHECKIN]
```

Posteriormente un permiso `T` podrá evaluarse.

Un permiso `T+C` será denegado por el evaluador.

---

#### 113. Caso canónico: dispositivo compartido con actor

```text
principal = SHARED_DEVICE
device_context = ACTIVE
actor_session = ACTIVE
actor_effective = EMPLOYEE
employee = ACTIVE
```

El rol operativo sigue procediendo del turno, no del dispositivo.

---

#### 114. Caso canónico: dispositivo sin actor

```text
principal = SHARED_DEVICE
device_context = ACTIVE
actor_effective = UNRESOLVED
base readiness = UNAVAILABLE
operational readiness = UNAVAILABLE
```

No se toma el último actor.

---

#### 115. Caso canónico: empleado inactivo

```text
employee.is_active = false
base readiness = UNAVAILABLE
operational readiness = UNAVAILABLE
reason_codes incluye EMPLOYEE_INACTIVE
```

No se lanza excepción.

---

#### 116. Caso canónico: turnos solapados

```text
dos turnos vigentes candidatos
→ SHIFT_OVERLAP
→ active_shift = null
→ operational readiness = INVALID
```

No se usa `limit 1` para elegir silenciosamente.

---

#### 117. Caso canónico: cliente

```text
domain_identity = CUSTOMER
employee = null
base readiness = NOT_APPLICABLE
operational readiness = NOT_APPLICABLE
```

No se fuerza una identidad laboral.

---

#### 118. Caso canónico: sistema

```text
principal = SYSTEM_SERVICE
domain_identity = SYSTEM
actor_effective = SYSTEM
employee = null
```

La autoridad se evaluará posteriormente por permiso y recurso.

---

#### 119. Caso canónico: app sin configuración

```text
p_app_code tiene forma válida
configuración autoritativa inexistente
→ RESOLVER_CONFIGURATION_MISSING
→ carriles INVALID
```

No se usa `nexo` como fallback.

---

#### 120. Antipatrones prohibidos

```sql
p_employee_id uuid default auth.uid()
```

```sql
p_site_id uuid default null
```

```sql
v_active_site_id :=
  coalesce(
    p_site_id,
    selected_site_id,
    checkin_site_id,
    shift_site_id,
    employee_default_site_id
  );
```

```sql
if employee_role in ('propietario', 'gerente_general') then
  bypass := true;
end if;
```

```sql
effective_operational_role := device.navigation_role;
```

```sql
if active_simulation then
  return simulated_context;
end if;
```

```sql
can_operate := array_length(blocked_reasons, 1) is null;
```

También queda prohibido:

```text
auth.uid() → employee_id directo
app_code null → nexo
primera identidad → identidad efectiva
primer turno → turno efectivo
último check-in → sesión activa
selected_site → sede operativa
device site → territorio del actor
service_role → autoridad
SQL error → contexto vacío
contexto parcial → contrato válido
```

---

#### 121. Pruebas contractuales requeridas

AUTH-CTX-030 deberá incluir, como mínimo:

1. firma exacta;
2. app obligatoria;
3. app sin default;
4. parámetro nulo;
5. parámetro con espacios;
6. app desconocida;
7. app ambigua;
8. sesión humana;
9. sesión sin vínculo;
10. principal ambiguo;
11. identidad múltiple;
12. actor personal;
13. actor delegado;
14. delegación inválida;
15. empleado activo;
16. empleado inactivo;
17. empleado ausente;
18. rol base válido;
19. rol base ambiguo;
20. varias sedes;
21. sedes duplicadas;
22. áreas incompatibles;
23. cobertura NONE;
24. cobertura ORGANIZATION explícita;
25. ausencia de turno;
26. turno válido;
27. turno nocturno;
28. turno solapado;
29. turno no publicado;
30. check-in ausente;
31. check-in válido;
32. check-in de otro actor;
33. check-in expirado;
34. rol operativo inválido;
35. sede operativa inválida;
36. área opcional;
37. área requerida;
38. dispositivo personal;
39. dispositivo compartido con actor;
40. dispositivo compartido sin actor;
41. dispositivo inactivo;
42. actor de sistema;
43. anónimo;
44. ausencia de simulación;
45. ausencia de navigation_role;
46. ausencia de bypass;
47. ausencia de can_operate;
48. orden determinista;
49. deduplicación;
50. metadata;
51. serialización;
52. snapshot único;
53. error de infraestructura;
54. exposición segura;
55. grants;
56. search_path;
57. SQL injection;
58. rendimiento;
59. tipos generados;
60. paridad entre ambientes.

---

#### 122. Pruebas físicas requeridas

`AUTH-DB-027` y `AUTH-DB-033` deberán probar:

- función con usuario autenticado;
- invocación directa no autorizada;
- `PUBLIC` revocado;
- `anon` revocado;
- helpers privados inaccesibles;
- search path poisoning;
- objetos homónimos maliciosos;
- claims manipulados;
- actor ajeno;
- dispositivo ajeno;
- función bajo RLS;
- mismo snapshot;
- serialización exacta;
- planes de ejecución;
- índices;
- concurrencia;
- rollback;
- drift local/staging/producción.

---

#### 123. Riesgos controlados

| Riesgo                                 | Control                        |
| -------------------------------------- | ------------------------------ |
| Caller elige empleado                  | Firma sin `p_employee_id`      |
| Caller elige sede                      | Firma sin `p_site_id`          |
| Default silencioso a NEXO              | `p_app_code` obligatorio       |
| Auth user tratado como empleado        | Mapeo empresarial explícito    |
| Primer turno elegido                   | Ambigüedad estructural         |
| Check-in reconstruido incorrectamente  | Sesión canónica                |
| Rol de navegación usado como autoridad | Prohibición expresa            |
| Dispositivo crea rol                   | Intersección restrictiva       |
| Simulación reemplaza realidad          | Contrato separado              |
| Propietario recibe bypass              | Permiso exacto posterior       |
| Resultado `can_operate` ambiguo        | Readiness sin decisión         |
| `SECURITY DEFINER` escala privilegios  | Search path, owner y grants    |
| Contexto completo filtrado             | Proyección segura              |
| JSON no reproducible                   | Serialización canónica         |
| Snapshot mezclado                      | STABLE e instante único        |
| Resolver sin tarea física              | Nueva `AUTH-DB-033`            |
| Legacy retirado prematuramente         | AUTH-CTX-027/028 y AUTH-DB-030 |
| Caché obsoleta                         | AUTH-CTX-029                   |
| Función no probada                     | AUTH-CTX-030 y AUTH-DB-027     |

---

#### 124. Fuera del alcance

AUTH-CTX-025 no:

- crea la función;
- crea schemas;
- crea helpers;
- crea tablas;
- modifica Auth;
- crea vínculos empresariales;
- crea migraciones;
- crea grants;
- crea políticas RLS;
- crea índices;
- crea tipos;
- implementa serializador;
- implementa fingerprint;
- implementa caché;
- implementa invalidación;
- implementa `evaluate_authorization`;
- implementa simulación;
- modifica funciones legacy;
- adapta consumidores;
- retira resolvers;
- modifica Supabase.

Toda responsabilidad diferida tiene tarea explícita.

---

#### 125. Criterios de aprobación

AUTH-CTX-025 podrá aprobarse cuando se acepte que:

1. la función lógica se denomina `get_access_context`;
2. su firma lógica es `(text) → jsonb`;
3. existe un único parámetro;
4. el parámetro es `p_app_code`;
5. `p_app_code` es obligatorio;
6. no existe app por defecto;
7. no se normaliza silenciosamente;
8. no se aceptan alias;
9. app mal formada produce error de argumento;
10. app sin configuración produce problema estructural;
11. app ambigua produce problema estructural;
12. no se acepta employee_id;
13. no se acepta actor_id;
14. no se acepta principal_id;
15. no se acepta device_id;
16. no se acepta site_id;
17. no se acepta area_id;
18. no se acepta role;
19. no se acepta shift_id;
20. no se acepta checkin_id;
21. no se acepta simulation_id;
22. no existe overload inseguro;
23. la función retorna jsonb;
24. retorna un objeto;
25. no retorna tabla plana;
26. no retorna booleano;
27. no retorna lista;
28. no retorna null;
29. el objeto cumple AccessContext 1.0.0;
30. incluye metadatos contractuales;
31. no modifica la forma publicada;
32. no agrega app_code a la raíz;
33. no agrega correlation_id;
34. no agrega permission_key;
35. no agrega resource;
36. no agrega can_operate;
37. no agrega bypass;
38. context_id se genera en servidor;
39. context_id es único;
40. context_id no es token;
41. resolved_at se genera en servidor;
42. resolved_at se captura una vez;
43. resolved_at usa zona horaria;
44. todos los resolvers usan el mismo instante;
45. todos los hechos usan el mismo snapshot;
46. snapshot mezclado falla cerrado;
47. la función es STABLE;
48. no es IMMUTABLE;
49. no usa VOLATILE para escribir;
50. no produce efectos empresariales;
51. principal procede de sesión real;
52. auth.uid es localizador técnico;
53. auth.uid no es empleado directo;
54. claims no sustituyen relaciones;
55. sesión personal separa principal y actor;
56. identidad de dominio depende de app;
57. identidades múltiples no se mezclan;
58. actor efectivo se resuelve explícitamente;
59. delegación es explícita;
60. caller no suministra delegación;
61. empleado procede del actor laboral;
62. usuario Auth no garantiza empleado;
63. empleado inactivo queda representado;
64. empleado inactivo no recupera autoridad residual;
65. rol base procede de fuente canónica;
66. rol base no procede del turno;
67. rol base no procede de navigation_role;
68. assigned_sites conserva múltiples asignaciones;
69. lista vacía no significa todas;
70. sede primaria no concede autoridad;
71. assigned_sites tiene orden determinista;
72. assigned_areas conserva sede;
73. áreas se validan;
74. assigned_areas tiene orden determinista;
75. cobertura procede de reglas explícitas;
76. selected_site no modifica cobertura;
77. ORGANIZATION exige autoridad explícita;
78. null no significa organización;
79. turno debe estar publicado;
80. turno debe estar vigente;
81. turno pertenece al actor;
82. no se usa limit 1 ante ambigüedad;
83. solapamiento produce SHIFT_OVERLAP;
84. zona horaria procede de fuente autoritativa;
85. ausencia normal de turno no invalida base;
86. check-in usa sesión canónica;
87. check-in no se reconstruye heurísticamente;
88. ausencia de check-in es normal;
89. check-in incompatible produce issue;
90. rol operativo procede del turno;
91. navigation_role no participa;
92. sede operativa procede del turno;
93. no existe fallback territorial;
94. área operativa pertenece a sede;
95. área puede ser opcional;
96. dispositivo se resuelve canónicamente;
97. user agent no es device_id;
98. dispositivo compartido separa principal y actor;
99. dispositivo no crea rol;
100. dispositivo sin actor no reutiliza último actor;
101. simulación queda excluida;
102. get_access_context no consulta simulación activa;
103. actor SYSTEM exige principal registrado;
104. service_role no concede autoridad;
105. anon no recibe execute por defecto;
106. lane_readiness no es decisión;
107. no existe can_operate;
108. carril base no depende de turno;
109. carril operativo conserva check-in opcional;
110. structural_issues usa catálogo congelado;
111. no se inventan códigos SQL;
112. cada issue tiene resolver propietario;
113. se suprimen cascadas;
114. se deduplican issues;
115. issues tienen orden determinista;
116. reason_codes tienen orden determinista;
117. resolution_metadata se completa;
118. resolver es identificador lógico;
119. resolver_version es exacta;
120. no se usa latest;
121. contract version coincide;
122. catalog version se registra;
123. source versions se registran;
124. source fingerprints se registran;
125. no se hashean secretos;
126. el contexto permite calcular fingerprint;
127. no se agrega fingerprint a la raíz;
128. se usa canonical JSON;
129. jsonb::text no basta como política;
130. null es explícito;
131. arrays vacíos son explícitos;
132. SECURITY DEFINER requiere controles;
133. owner técnico no implica autoridad;
134. search_path es fijo;
135. public no es search path único;
136. SQL dinámico no es predeterminado;
137. execute se revoca a PUBLIC;
138. execute se revoca a anon;
139. authenticated no recibe contrato completo por defecto;
140. existe proyección segura;
141. proyección segura no filtra evidence interna;
142. AUTH-DB-033 implementa la proyección;
143. RLS no se desactiva globalmente;
144. caller no recibe SELECT amplio;
145. estados normales no lanzan excepción;
146. errores de infraestructura no devuelven contexto parcial;
147. mensajes no filtran detalles;
148. no se consultan permisos;
149. no se resuelven recursos;
150. evaluate_authorization consume el resolver;
151. caché se reserva para AUTH-CTX-029;
152. cache status inicia NOT_IMPLEMENTED;
153. no se cachea solo por user_id;
154. auditoría durable pertenece a AUTH-DB-032;
155. rendimiento no cambia semántica;
156. índices se definen físicamente después;
157. tipos se regeneran con AUTH-DB-026;
158. get_operational_context queda legacy;
159. get_effective_context_v1 queda legacy;
160. AUTH-CTX-027 inventaría consumidores;
161. AUTH-CTX-028 diseña compatibilidad;
162. AUTH-DB-030 retira legacy;
163. se crea AUTH-DB-033;
164. AUTH-DB-033 pertenece a R1;
165. AUTH-DB-033 ocurre después de arquitectura E3;
166. AUTH-DB-033 precede adopción completa en RPC;
167. existe orden de transición explícito;
168. AUTH-CTX-030 prueba el contrato;
169. AUTH-DB-027 prueba la implementación;
170. no se implementa código ni Supabase en esta tarea.

---

#### 126. Cierre y continuidad de la propuesta

| Relación        | Tarea          | Estado        |
| --------------- | -------------- | ------------- |
| Tarea anterior  | `AUTH-CTX-024` | ✅ APROBADA    |
| Tarea propuesta | `AUTH-CTX-025` | ✅ APROBADA    |
| Tarea siguiente | `AUTH-CTX-026` | ⬜ NO INICIADA |

```text
AUTH-CTX-024 — APROBADA
        ↓
AUTH-CTX-025 — APROBADA
        ↓
AUTH-CTX-026 — NO INICIADA
```

No se avanza a `AUTH-CTX-026` hasta recibir aprobación explícita de
`AUTH-CTX-025`.

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
