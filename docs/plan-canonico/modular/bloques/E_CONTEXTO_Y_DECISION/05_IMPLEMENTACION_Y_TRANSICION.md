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

#### 94. Refinamiento contractual de tareas SHELL-AUTH y SHELL-CTX existentes

Se refinan contractualmente tareas no iniciadas que ya existían en BLOQUE H.
No se reutiliza ningún identificador y no se crean paquetes paralelos.

```text
SHELL-AUTH-001..005
→ SDK, adapters, scope, gates y migración multi-repositorio

SHELL-CTX-001..005
→ módulo contextual, turno, check-in, territorio, readiness y razones seguras
```

Todas permanecen dentro de `@vento/os-context`. Las responsabilidades
anteriores compatibles quedan absorbidas sin cambiar tareas aprobadas o ejecutadas.

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

#### 101. Dependencias físicas

```text
SHELL-AUD-002 a SHELL-AUD-005
        ↓
SHELL-PKG-001 a SHELL-PKG-008
        ↓
SHELL-CON-001 a SHELL-CON-008
        ↓
SHELL-AUTH-001 + SHELL-CTX-001
        ↓
AUTH-DB-033 → AUTH-DB-034 → AUTH-DB-032
        ↓
SHELL-CTX-002 a SHELL-CTX-005
        ↓
SHELL-AUTH-002 → SHELL-AUTH-003 → SHELL-AUTH-004
        ↓
AUTH-DB-020
        ↓
AUTH-DB-006 a AUTH-DB-010 + AUTH-DB-021
        ↓
SHELL-AUTH-005
        ↓
AUTH-DB-030 → AUTH-DB-031
```

`AUTH-DB-027` acompaña cada paquete físico y `AUTH-DB-029` conserva la
puerta de rollback antes de cada adopción por dominio.

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

#### 104. Responsabilidades sin pendiente narrativo

| Brecha | Responsable |
| --- | --- |
| SDK incompatible | `SHELL-AUTH-001` |
| Contexto fragmentado | `SHELL-CTX-001` a `SHELL-CTX-005` |
| Adapters y proyecciones | `SHELL-AUTH-002` |
| Resolución duplicada | `SHELL-AUTH-003` |
| Nuevos usos legacy | `SHELL-AUTH-004` |
| Migración multi-repo | `SHELL-AUTH-005` |
| Resolver, evaluador y persistencia | `AUTH-DB-033`, `AUTH-DB-034`, `AUTH-DB-032` |
| Migración de objetos, RPC y RLS | `AUTH-DB-020`, `AUTH-DB-006` a `AUTH-DB-010`, `AUTH-DB-021` |
| Guards y pantallas | `AUTH-UI-040` a `AUTH-UI-051` |
| Retiro y certificación | `AUTH-DB-030`, `AUTH-DB-031` |

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

### ✅ AUTH-CTX-026 — Diseñar contrato canónico de evaluate_authorization

| Campo                           | Valor                                                                                                               |
| ------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Estado**                      | **APROBADA**                                                                                                        |
| **Bloque**                      | BLOQUE E — Contexto y decisión de autorización unificados                                                           |
| **Subbloque**                   | DISEÑO DE IMPLEMENTACIÓN CANÓNICA                                                                                   |
| **Naturaleza**                  | Diseño documental del evaluador canónico                                                                            |
| **Implementación física**       | No incluida                                                                                                         |
| **Tarea anterior vigente**      | `AUTH-CTX-025` — APROBADA                                                                                           |
| **Tarea posterior reservada**   | `AUTH-CTX-027` — Definir consumo centralizado del contexto por las aplicaciones                                     |
| **Contrato de entrada**         | `AuthorizationEvaluationRequest@1.0.0`                                                                              |
| **Contrato de salida**          | `AuthorizationDecision@1.0.0`                                                                                       |
| **Contexto consumido**          | `AccessContext@1.0.0`                                                                                               |
| **Perfil de serialización**     | `vento.canonical-json@1.0.0`                                                                                        |
| **Identidad lógica de función** | `evaluate_authorization(jsonb) → jsonb`                                                                             |
| **Nombre físico calificado**    | Pendiente de `SUPA-ARC-005`, `SUPA-ARC-006` y `SUPA-ARC-013`                                                        |
| **Cambio contractual**          | Define la frontera del evaluador sin cambiar contratos publicados                                                   |
| **Cambios físicos permitidos**  | No                                                                                                                  |
| **Brecha física detectada**     | No existe tarea específica para implementar el evaluador canónico                                                   |
| **Nueva tarea requerida**       | `AUTH-DB-034 — Implementar evaluate_authorization canónico, su núcleo, resolvers de recurso y proyecciones seguras` |

Esta tarea diseña el evaluador central que transforma una solicitud
estructurada en una `AuthorizationDecision@1.0.0`.

```text
SOLICITUD CANÓNICA
+
ACCESS CONTEXT REAL
+
CONTRATO DEL PERMISO
+
RECURSO RESUELTO
+
DATASETS PUBLICADOS
+
PRECEDENCIA CANÓNICA
=
AUTHORIZATION DECISION
```

```text
EVALUAR ≠ EJECUTAR
DECISION_ID ≠ TOKEN DE CAPACIDAD
BOOLEANO LEGACY ≠ DECISIÓN CANÓNICA
```

No implementa funciones SQL, helpers, resolvers, tablas, migraciones, RLS,
grants, persistencia ni cambios físicos en Supabase.

---

#### 1. Objetivo

Definir de forma cerrada:

1. identidad y firma lógica del evaluador;
2. contrato de entrada;
3. contrato de salida;
4. relación con `get_access_context`;
5. resolución de permiso y recurso;
6. carga de datasets;
7. evaluación de carriles;
8. aplicación de denegaciones;
9. prerrequisitos y dependencias;
10. dispositivo, sensibilidad y campos;
11. combinación y decisión final;
12. auditoría y fingerprints;
13. seguridad SQL;
14. proyecciones;
15. integración con RPC, RLS, jobs y guards;
16. transición desde evaluadores legacy;
17. tarea física de implementación.

---

#### 2. Base normativa

AUTH-CTX-026 conserva sin cambios:

- `ADR-AUTH-001`;
- `AUTH-MOD-001` a `AUTH-MOD-020`;
- `AUTH-CAT-001` a `AUTH-CAT-024`;
- `AUTH-RBAC-001` a `AUTH-RBAC-028`;
- `AUTH-CTX-001` a `AUTH-CTX-025`;
- `SUPA-ARC-005` a `SUPA-ARC-015`;
- `AUTH-DB-027`, `AUTH-DB-030`, `AUTH-DB-031`;
- `AUTH-DB-032` y `AUTH-DB-033`.

Principios:

```text
MISMA SOLICITUD LÓGICA
+
MISMO SNAPSHOT
+
MISMAS VERSIONES
=
MISMO RESULTADO SEMÁNTICO
```

```text
AUSENCIA DE EVIDENCIA POSITIVA = DENY
ERROR O AMBIGÜEDAD = FAIL CLOSED
```

---

#### 3. Estado físico conocido

Existen evaluadores parciales como:

```text
has_permission(...)
has_operational_permission(...)
guards locales
políticas RLS propias
RPC con verificaciones ad hoc
```

Son mecanismos legacy, no fuente normativa.

---

#### 4. Divergencias legacy

Los mecanismos actuales pueden:

- retornar solo `boolean`;
- aceptar sede o área desde el caller;
- derivar aplicación desde el permiso;
- aplicar bypass por nombre de rol;
- consumir contexto legacy;
- omitir recurso y estado;
- omitir campos protegidos;
- mezclar carriles;
- no registrar grants, denies, hashes ni razones;
- duplicar lógica entre aplicaciones.

AUTH-CTX-027 deberá inventariarlos.

---

#### 5. Decisión principal

Se define:

```text
evaluate_authorization(jsonb) → jsonb
```

Forma conceptual:

```sql
create function <authorization_internal_schema>.evaluate_authorization(
  p_evaluation_request jsonb
)
returns jsonb
language plpgsql
volatile
security definer
set search_path = pg_catalog, <schemas_privados_aprobados>;
```

La sintaxis es documental.

---

#### 6. Contrato de entrada

```ts
type AuthorizationEvaluationRequest = {
  contract_family: "vento.authorization.request-contracts";
  contract_family_version: "1.0.0";
  contract_name: "AuthorizationEvaluationRequest";
  contract_version: "1.0.0";
  schema_version: "1.0.0";
  correlation_id: string | null;
  request: AuthorizationRequestContext;
};
```

---

#### 7. Firma única

La firma será:

```sql
evaluate_authorization(p_evaluation_request jsonb)
returns jsonb
```

No se crean overloads públicos con actor, empleado, rol, sede, área o recurso
resuelto.

---

#### 8. Envelope único

La función recibe un objeto versionado, no una colección de parámetros
independientes.

Esto evita entradas parciales y combinaciones inseguras.

---

#### 9. Campos obligatorios

Deben existir:

```text
contract_family
contract_family_version
contract_name
contract_version
schema_version
correlation_id
request
```

`correlation_id` puede ser `null`, pero no omitirse.

---

#### 10. Validación de versión

Una familia, nombre o versión no soportados no se reinterpretan.

Un envelope no parseable produce error contractual de invocación.

---

#### 11. correlation_id

`correlation_id`:

- vincula una operación lógica;
- no concede autoridad;
- no sustituye `decision_id`;
- no sustituye idempotencia;
- puede permanecer `null`;
- se propaga solo desde fronteras internas confiables.

---

#### 12. AuthorizationRequestContext

Se conserva:

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
  request_source:
    | "SERVER_ACTION"
    | "RPC"
    | "RLS"
    | "API"
    | "UI_GUARD"
    | "JOB";
};
```

---

#### 13. app_code

Debe ser exacto, activo, publicado y propietario del permiso.

No se deriva del prefijo del permiso.

No existe aplicación predeterminada.

---

#### 14. permission_key

Debe existir exactamente, estar activo y tener:

- modalidad;
- prerrequisitos;
- contrato de recurso;
- políticas;
- versión;
- hash.

No se admiten wildcards ni prefijos.

---

#### 15. operation_kind

Debe ser compatible con el permiso y el contrato del recurso.

Una operación incompatible produce denegación contractual o de recurso,
según el origen de la incompatibilidad.

---

#### 16. request_source

Identifica la frontera técnica.

No cambia modalidad, grants, denies, alcance ni resultado.

Debe fijarse o validarse internamente.

---

#### 17. resource_request

Contiene localizadores o borradores no confiables.

El evaluador deberá:

```text
validar forma
→ seleccionar contrato
→ resolver relaciones
→ resolver territorio
→ resolver estado
→ producir ResolvedResourceContext
```

---

#### 18. requested_fields

La lista:

- se valida;
- se deduplica;
- se ordena cuando sea conjunto;
- solo reduce o precisa;
- no permite inferir campos ocultos.

---

#### 19. Datos prohibidos

La entrada no puede declarar como autoridad:

```text
access_context
context_id
actor_id
principal_id
employee_id
role
base_role
operational_role
effective_site_id
effective_area_id
shift_id
checkin_id
effective_device_id
authorization_requirement
grant_ids
deny_ids
decision_id
final_outcome
catalog_hash
dataset_hashes
```

---

#### 20. Sin decisión sugerida

Quedan prohibidos:

```text
expected_outcome
allow
can_operate
bypass
force_allow
ignore_denies
skip_resource_resolution
skip_prerequisites
```

---

#### 21. Contrato de salida

La función retorna un único `jsonb` compatible con
`AuthorizationDecision@1.0.0`.

No retorna booleano, tabla plana, lista, `null` ni decisión parcial válida.

---

#### 22. Forma de salida conservada

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

---

#### 23. decision_id

Será interno, único, inmutable y no reutilizable.

No es bearer token ni atajo de autorización.

---

#### 24. decided_at

Será timestamp de servidor capturado una sola vez y serializado en UTC.

Todos los validadores temporales usarán el mismo instante lógico.

---

#### 25. Volatilidad y núcleo

La frontera emisora podrá ser `VOLATILE` por la emisión de `decision_id`.

La lógica deberá residir en un núcleo privado determinista, sin escrituras y
sin acceso público.

---

#### 26. Sin efectos empresariales

El evaluador no crea, modifica, transiciona, paga, mueve inventario, abre
turnos, crea check-ins ni ejecuta la operación.

---

#### 27. Persistencia separada

La persistencia durable y el vínculo decisión–ejecución corresponden a
`AUTH-DB-032`.

El núcleo no escribe auditoría durable.

---

#### 28. Pipeline obligatorio

```text
1. Validar envelope.
2. Emitir decision_id y decided_at.
3. Resolver AccessContext.
4. Validar contexto y fingerprint.
5. Resolver PermissionContractSnapshot.
6. Validar catálogo y hash.
7. Resolver ResolvedResourceContext.
8. Determinar required_lanes.
9. Cargar datasets exactos.
10. Detectar structural denies.
11. Detectar actor-wide denies.
12. Evaluar carril base.
13. Evaluar carril operativo.
14. Evaluar prerrequisitos.
15. Evaluar dispositivo.
16. Evaluar sensibilidad.
17. Evaluar campos.
18. Combinar carriles.
19. Aplicar precedencia final.
20. Consolidar razones.
21. Construir audit.
22. Validar invariantes.
23. Serializar.
```

---

#### 29. Resolución de AccessContext

Se invoca lógicamente:

```text
get_access_context(request.app_code)
```

exactamente una vez por decisión principal.

No se reconstruyen actor, empleado, roles, turno, check-in o dispositivo.

---

#### 30. Contexto real

Solo se consume un `AccessContext` real y vigente.

No se acepta contexto del cliente, simulado, de otra app, actor o dispositivo.

---

#### 31. AccessContextReference

Se produce una referencia coherente con:

```text
context_id
context_contract_version
resolved_at
actor_type
actor_id
principal_type
principal_id
context_fingerprint
```

---

#### 32. context_fingerprint

Se calcula sobre el objeto canónico exacto con
`vento.canonical-json@1.0.0`.

No se calcula desde una proyección cliente ni se modifica después.

---

#### 33. Contexto inválido

Los problemas estructurales bloquean según severidad y carril.

`BLOCKING_ALL` impide `ALLOW`.

Un bloqueo de carril no contamina automáticamente el otro.

---

#### 34. Resolución del permiso

Debe existir una única definición efectiva para:

```text
app_code
+
permission_key
+
catalog_version
```

Cero contratos produce `MISSING`.

Más de uno produce ambigüedad y `DENY`.

---

#### 35. PermissionContractSnapshot

Debe conservar catálogo, versión, hash, app, permiso, estado, modalidad,
prerrequisitos, área, dispositivo, sensibilidad, simulación, recurso y
dependencias.

---

#### 36. Contrato inválido

Catálogo ausente, hash ausente, modalidad ausente, recurso ausente o app
incompatible producen:

```text
CONTRACT_INVALID
+
DENY
```

---

#### 37. Resolución del recurso

Se realiza por el `resource_contract_id` del permiso.

El caller no elige resolver.

---

#### 38. Registro cerrado de resolvers

```text
resource_contract_id
→ resolver privado aprobado
→ versión
→ fingerprint
```

No se construyen nombres de función desde texto del cliente.

---

#### 39. Resolver inexistente

Produce `CONTRACT_INVALID` y `DENY`.

No se convierte en `NON_RESOURCE`.

---

#### 40. Recursos existentes y borradores

`EXISTING` valida recurso, relaciones, territorio, estado, campos y versión.

`DRAFT` normaliza payload, relaciones, territorio, estado inicial e
idempotencia antes de decidir.

---

#### 41. Colecciones y agregados

Las colecciones se construyen en servidor.

Los agregados validan cada fuente territorial y no permiten inferencias sobre
datos ocultos.

---

#### 42. Operaciones masivas

Requieren permiso masivo explícito o decisiones por recurso.

La atomicidad será `ALL_OR_NOTHING` o `PARTIAL_WITH_RESULTS`, nunca implícita.

---

#### 43. NON_RESOURCE

Solo aplica cuando el contrato lo declara.

No es fallback por fallo de resolución.

---

#### 44. Territorio

Se resuelven organización, unidades, sedes, áreas, tipos, origen, destino,
rutas, vehículos y aislamiento según contrato.

`null` y `[]` no significan global.

---

#### 45. Estado, propiedad y custodia

Se validan estado actual, transición, versión, propietario, custodio, sujeto,
responsable y lados obligatorios cuando apliquen.

No se aceptan desde el payload como verdad.

---

#### 46. Campos protegidos

La clasificación de visibilidad, mutabilidad y enmascaramiento procede del
contrato del recurso.

No se inventa en cada aplicación.

---

#### 47. Concurrencia e idempotencia

Una versión incompatible produce `DENY`.

La idempotencia no concede permiso ni permite reutilizar una decisión
obsoleta.

---

#### 48. required_lanes

```text
BASE_ONLY            → [BASE]
OPERATIONAL_ONLY     → [OPERATIONAL]
BASE_OR_OPERATIONAL  → [BASE, OPERATIONAL]
BASE_AND_OPERATIONAL → [BASE, OPERATIONAL]
```

Se derivan del contrato, no del dataset.

---

#### 49. Carril no admitido

Debe producir:

```text
outcome = NOT_APPLICABLE
readiness = NOT_APPLICABLE
evaluated = false
matched_allow_ids = []
matched_deny_ids = []
```

---

#### 50. Carril admitido

Evalúa readiness, denegaciones, grants, alcance, recurso, prerrequisitos y
restricciones.

Sin allow suficiente, el resultado es `DENY`.

---

#### 51. Datasets

Se cargan versiones publicadas y verificadas de grants, overrides, denies y
políticas aplicables.

Cada fuente consultada queda registrada.

---

#### 52. Hashes de datasets

No se aceptan `latest`, `current`, `unknown`, hash vacío o versión sin hash.

Una fuente obligatoria inválida produce `CONTRACT_INVALID`.

---

#### 53. Dataset sin match

Un dataset consultado con cero coincidencias conserva versión y hash en
auditoría.

No genera grant ni deny.

---

#### 54. Dataset no aplicable

No se consulta ni se registra con valores falsos o nulos.

---

#### 55. Precedencia

El evaluador consume:

```text
STRUCTURAL_DENY
>
ACTOR_WIDE_DENY
>
LANE_DENY
>
ALLOW
>
DEFAULT_DENY
```

La razón primaria sigue AUTH-CTX-023.

---

#### 56. matched_allows

Solo incluye grants activos del permiso, actor o rol, carril, alcance,
territorio y recurso exactos.

---

#### 57. matched_denies

Solo incluye denies activos, vigentes y aplicables.

Un deny no desaparece por existir allow.

---

#### 58. Carril base

Orden:

```text
modalidad
→ readiness
→ actor y empleado
→ rol base y cobertura
→ deny transversal
→ deny base
→ allows base
→ alcance y recurso
→ restricciones
→ resultado
```

No toma prestado turno ni check-in.

---

#### 59. Carril operativo

Orden:

```text
modalidad
→ readiness
→ actor y empleado
→ turno
→ check-in cuando aplique
→ rol operativo
→ sede y área
→ dispositivo
→ deny transversal
→ deny operativo
→ allows operativos
→ alcance y recurso
→ restricciones
→ resultado
```

---

#### 60. Prerrequisitos N, T y T+C

```text
N   → no exige turno ni check-in
T   → exige turno
T+C → exige turno y check-in
```

Un check-in incompatible puede bloquear incluso un permiso `T`.

---

#### 61. Área activa

Cuando `requires_active_area = true`, el área debe existir, pertenecer a la
sede, ser compatible y coincidir con el recurso cuando aplique.

---

#### 62. Dependencias

Cada dependencia usa el mismo actor y contexto, conserva su contrato y no
autoriza por sí sola el permiso principal.

---

#### 63. Núcleo recursivo

Las dependencias se evalúan en un helper privado, no invocando de nuevo la
frontera emisora.

---

#### 64. Ciclos y profundidad

El grafo debe ser acíclico.

Un ciclo o una profundidad superior a:

```text
MAX_DEPENDENCY_DEPTH = 32
```

produce `CONTRACT_INVALID` y `DENY`.

---

#### 65. Dispositivo

La regla es:

```text
autoridad del actor
∩
capacidad admitida por dispositivo
```

El dispositivo puede restringir, nunca conceder.

---

#### 66. Sensibilidad

La clase de sensibilidad puede exigir reautenticación, segundo factor,
aprobación, motivo, separación de funciones o dispositivo compatible.

No amplía alcance ni elimina denies.

---

#### 67. FieldPolicyDecision

La política se evalúa después de resolver operación, recurso, campos,
sensibilidad y evidencia.

---

#### 68. Lectura parcial y mutación

Una lectura puede producir `PARTIAL` y una proyección limitada.

Una mutación con campos bloqueados produce `DENY` o requiere reducir y
reevaluar; nunca elimina campos silenciosamente.

---

#### 69. Combinación de carriles

Se aplican exactamente:

```text
BASE_ONLY
OPERATIONAL_ONLY
BASE_OR_OPERATIONAL
BASE_AND_OPERATIONAL
```

Los carriles no prestan componentes incompletos.

---

#### 70. combination_result y final outcome

Una combinación `ALLOW` puede terminar en `DENY` por recurso, prerrequisito,
dispositivo, sensibilidad, campos, concurrencia o idempotencia.

---

#### 71. Decisión final y default deny

La salida final solo es `ALLOW` o `DENY`.

Sin evidencia positiva suficiente se usa `DEFAULT_DENY`.

---

#### 72. blocked_reasons

Consolida todas las razones aplicables sin eliminar razones secundarias.

El orden es determinista.

---

#### 73. Mensaje seguro

`safe_message_code` procede del catálogo.

No revela grants, denies sensibles, tablas, SQL, IDs ajenos o detalles
disciplinarios.

---

#### 74. Auditoría

Toda decisión, allow o deny, incluye `audit`.

Los campos duplicados entre audit y decisión deben coincidir.

---

#### 75. evaluator_name y evaluator_version

Identificador lógico inicial:

```text
vento.authorization.evaluate_authorization
```

La versión física será exacta e inmutable; nunca `latest`, `main`, `current`
o `unknown`.

---

#### 76. Separación evaluación–ejecución

Una decisión `ALLOW` no ejecuta ni reserva el recurso.

La ejecución debe revalidar contexto, recurso y concurrencia.

---

#### 77. Frontera transaccional

Para mutaciones:

```text
construir request
→ evaluar
→ verificar outcome
→ validar versión/lock
→ persistir evidencia requerida
→ ejecutar
→ registrar resultado
```

en una transacción o protocolo aprobado.

---

#### 78. UI guards, RPC y RLS

Los UI guards consumen proyección segura y no sustituyen servidor.

Las RPC usan el mismo núcleo.

RLS puede usar predicados privados optimizados derivados del mismo núcleo y
certificados como equivalentes.

---

#### 79. Jobs y SYSTEM

Los jobs suministran app, permiso, operación, recurso y `request_source=JOB`.

El contexto resuelve el principal de sistema.

`service_role` no concede autoridad.

---

#### 80. Dispositivo compartido, unresolved y anónimo

Se conserva principal dispositivo y actor empleado.

`UNRESOLVED` no puede ejecutar mutaciones empresariales.

El anónimo requiere permiso y contrato explícitos.

---

#### 81. Simulación excluida

La función real no acepta actor, rol, contexto o resultado simulado.

La simulación utiliza contrato y evaluador separados.

---

#### 82. Caché

AUTH-CTX-029 definirá TTL, claves e invalidación.

Una futura clave deberá considerar context fingerprint, request fingerprint,
permission contract, resource fingerprint, hashes y evaluator version.

---

#### 83. Seguridad SQL

La implementación podrá ser `SECURITY DEFINER` solo con:

- owner técnico dedicado;
- search path fijo;
- objetos calificados;
- helpers privados;
- `PUBLIC` y `anon` revocados;
- sin SQL dinámico inseguro;
- pruebas de escalamiento.

La función interna completa no se concede a `authenticated`.

---

#### 84. Proyecciones

La proyección interna conserva evidencia completa autorizada.

La segura incluye outcome, permiso, referencia lógica, safe message, razones
seguras y correlación de soporte.

---

#### 85. Semántica de errores

```text
ENVELOPE INVÁLIDO
→ error contractual SQL
```

```text
SOLICITUD BIEN FORMADA PERO NO AUTORIZABLE
→ AuthorizationDecision DENY
```

```text
FALLO QUE IMPIDE CONSTRUIR CONTRATO
→ excepción controlada
→ sin decisión parcial
```

---

#### 86. Transición legacy

`has_permission`, `has_operational_permission`, guards y verificaciones ad hoc
deberán inventariarse en AUTH-CTX-027, migrarse mediante AUTH-DB-020 y
retirarse con AUTH-DB-030.

---

#### 87. Nueva tarea AUTH-DB-034

Se crea:

```text
AUTH-DB-034
— Implementar evaluate_authorization canónico,
  su núcleo de evaluación,
  resolvers de recurso
  y proyecciones seguras
```

Ubicación:

```text
BLOQUE R1
después de AUTH-DB-033
antes de AUTH-DB-006 a AUTH-DB-010
```

La integración final de persistencia de AUTH-DB-032 depende del evaluador.

---

#### 88. Dependencias físicas

```text
SUPA-ARC-005 a SUPA-ARC-015
        ↓
AUTH-DB-019
        ↓
AUTH-DB-033
        ↓
AUTH-DB-034
        ↓
AUTH-DB-032
        ↓
AUTH-DB-006 a AUTH-DB-010
```

`AUTH-DB-027` acompaña cada paquete.

---

#### 89. Alcance futuro de AUTH-DB-034

Deberá implementar:

- frontera emisora;
- núcleo privado;
- validación de request;
- resolución de permiso;
- registro y resolvers de recurso;
- carga de datasets;
- carriles;
- dependencias;
- restricciones;
- combinación;
- fingerprints;
- auditoría;
- proyecciones;
- predicados RLS;
- seguridad;
- telemetría;
- pruebas;
- rollback.

---

#### 90. Responsabilidades relacionadas

| Responsabilidad          | Tarea                         |
| ------------------------ | ----------------------------- |
| Resolver contexto        | `AUTH-DB-033`                 |
| Implementar evaluador    | `AUTH-DB-034`                 |
| Persistir decisiones     | `AUTH-DB-032`                 |
| Inventariar consumidores | `AUTH-CTX-027`                |
| Compatibilidad           | `AUTH-CTX-028`                |
| Caché                    | `AUTH-CTX-029`                |
| Pruebas contractuales    | `AUTH-CTX-030`                |
| Adoptar en RPC           | `AUTH-DB-006` a `AUTH-DB-010` |
| Migrar dominios          | `AUTH-DB-020`                 |
| RLS                      | `AUTH-DB-021`                 |
| Tipos                    | `AUTH-DB-026`                 |
| Harness                  | `AUTH-DB-027`                 |
| Drift                    | `AUTH-DB-028`                 |
| Retiro legacy            | `AUTH-DB-030`                 |
| Certificación            | `AUTH-DB-031`                 |

---

#### 91. Esqueleto SQL conceptual

```sql
-- DOCUMENTAL. NO EJECUTAR.

create function <authorization_internal_schema>.evaluate_authorization(
  p_evaluation_request jsonb
)
returns jsonb
language plpgsql
volatile
security definer
set search_path = pg_catalog, <schemas_privados_aprobados>
as $$
declare
  v_decision_id text;
  v_decided_at timestamptz;
  v_context jsonb;
  v_permission_contract jsonb;
  v_resource jsonb;
  v_result jsonb;
begin
  -- validar envelope;
  -- resolver contexto;
  -- resolver permiso y recurso;
  -- cargar datasets;
  -- evaluar carriles y restricciones;
  -- combinar;
  -- construir auditoría;
  -- validar invariantes;
  return v_result;
end;
$$;
```

---

#### 92. Casos canónicos

##### BASE_ONLY autorizado

```text
base = ALLOW
operational = NOT_APPLICABLE
constraints = PASS
final = ALLOW
```

##### OPERATIONAL_ONLY T

```text
turno válido
check-in ausente
prerrequisito T
operational = ALLOW
```

##### OPERATIONAL_ONLY T+C

```text
turno válido
check-in ausente
operational = DENY
```

##### BASE_OR_OPERATIONAL

```text
base = DENY
operational = ALLOW
final = ALLOW
```

##### BASE_AND_OPERATIONAL

```text
base = ALLOW
operational = DENY
final = DENY
```

##### Actor-wide deny

```text
grants coinciden
actor-wide deny coincide
final = DENY
```

##### Dispositivo incompatible

```text
combination = ALLOW
device = FAIL
final = DENY
```

##### Lectura parcial

```text
field policy = PARTIAL
final = ALLOW sobre proyección aprobada
```

##### Dependencia cíclica

```text
A requiere B
B requiere A
→ CONTRACT_INVALID
→ DENY
```

##### Recurso modificado

```text
fingerprint cambia
→ no ejecutar
→ reevaluar
```

---

#### 93. Antipatrones prohibidos

```sql
evaluate_authorization(
  p_permission text,
  p_site_id uuid,
  p_area_id uuid
)
returns boolean
```

```sql
if employee_role in ('propietario', 'gerente_general') then
  return true;
end if;
```

También:

```text
caller site → territorio autorizado
caller role → rol efectivo
device role → rol operativo
allow temprano → omitir denies
dependency allow → allow principal
decision_id → token
UI guard → seguridad suficiente
service_role → autoridad
error SQL → allow
booleano → auditoría completa
```

---

#### 94. Pruebas contractuales mínimas

AUTH-CTX-030 deberá cubrir:

1. firma exacta;
2. envelope y versiones;
3. correlación;
4. app y permiso exactos;
5. operation kind;
6. request source;
7. requested fields;
8. contexto humano, dispositivo y SYSTEM;
9. contexto inválido por carril;
10. recurso existente, draft, colección, agregado, bulk y non-resource;
11. territorio, estado, propiedad y lados;
12. concurrencia e idempotencia;
13. cuatro modalidades;
14. N, T y T+C;
15. área requerida;
16. datasets con match, sin match y no aplicables;
17. hashes faltantes;
18. grants y denies por carril;
19. actor-wide deny;
20. default deny;
21. dependencias, ciclos y profundidad;
22. dispositivo;
23. sensibilidad;
24. campos parciales y bloqueados;
25. combinación allow con constraint fail;
26. razón primaria y secundarias;
27. auditoría;
28. proyecciones;
29. contexto obsoleto;
30. recurso modificado;
31. errores de infraestructura;
32. orden determinista;
33. paridad RLS y RPC;
34. ausencia de simulación y bypass;
35. rendimiento y paridad de ambientes.

---

#### 95. Pruebas físicas mínimas

AUTH-DB-027 y AUTH-DB-034 deberán probar:

- grants y revocaciones;
- search path poisoning;
- SQL injection;
- claims manipulados;
- actor, dispositivo y recurso ajenos;
- datasets y hashes alterados;
- ciclos;
- concurrencia;
- snapshot;
- equivalencia RLS/RPC;
- proyección segura;
- persistencia vinculada;
- rollback;
- planes de ejecución;
- carga;
- drift.

---

#### 96. Riesgos controlados

| Riesgo                       | Control                           |
| ---------------------------- | --------------------------------- |
| Booleano opaco               | Decisión estructurada             |
| Caller elige territorio      | Resolver de recurso               |
| Caller elige actor           | `get_access_context`              |
| Permiso por prefijo          | Clave exacta                      |
| Bypass por rol               | Prohibido                         |
| Allow antes de denies        | Pipeline y precedencia            |
| Carriles mezclados           | Decisiones separadas              |
| Dependencias circulares      | Grafo y límite 32                 |
| Dispositivo amplía autoridad | Intersección                      |
| Campo sensible               | Field policy                      |
| Decisión reutilizada         | Revalidación                      |
| Drift RLS/RPC                | Núcleo compartido                 |
| Evidencia filtrada           | Proyección segura                 |
| Evaluador sin dueño          | `AUTH-DB-034`                     |
| Persistencia sin dueño       | `AUTH-DB-032`                     |
| Contexto sin dueño           | `AUTH-DB-033`                     |
| Legacy indefinido            | `AUTH-CTX-027/028`, `AUTH-DB-030` |

---

#### 97. Fuera del alcance

AUTH-CTX-026 no:

- crea la función;
- crea el núcleo;
- crea resolvers;
- crea tablas;
- publica datasets;
- crea migraciones;
- crea RLS o grants;
- persiste decisiones;
- ejecuta acciones;
- adapta RPC o guards;
- retira legacy;
- implementa caché;
- implementa simulación;
- modifica Supabase.

---

#### 98. Criterios de aprobación

AUTH-CTX-026 podrá aprobarse cuando se acepte que:

1. la función se denomina `evaluate_authorization`;
2. la firma es `(jsonb) → jsonb`;
3. usa un único envelope versionado;
4. correlation_id está presente y puede ser null;
5. correlation no concede autoridad;
6. request conserva la forma aprobada;
7. app_code es exacto;
8. app no se infiere;
9. permission_key es exacto;
10. no hay wildcards;
11. operation_kind se valida;
12. request_source no cambia reglas;
13. resource_request no es autoritativo;
14. requested_fields se valida;
15. caller no suministra contexto;
16. caller no suministra actor;
17. caller no suministra empleado;
18. caller no suministra rol;
19. caller no suministra territorio efectivo;
20. caller no suministra turno;
21. caller no suministra check-in;
22. caller no suministra dispositivo efectivo;
23. caller no suministra outcome;
24. no existe force allow;
25. salida es jsonb;
26. salida es una decisión;
27. no retorna booleano;
28. no retorna lista;
29. no retorna null;
30. cumple AuthorizationDecision 1.0.0;
31. no cambia la forma publicada;
32. decision_id se genera internamente;
33. decision_id es único;
34. decision_id no es token;
35. decided_at se captura una vez;
36. la frontera puede ser VOLATILE;
37. el núcleo es privado y determinista;
38. el núcleo no escribe;
39. evaluar no ejecuta;
40. persistencia pertenece a AUTH-DB-032;
41. pipeline es cerrado;
42. allow temprano no omite controles;
43. get_access_context se invoca una vez;
44. no se reconstruye contexto;
45. solo se usa contexto real;
46. AccessContextReference es coherente;
47. context fingerprint corresponde al snapshot;
48. bloqueos estructurales se respetan;
49. bloqueo de carril no contamina otro;
50. permiso se resuelve de forma única;
51. contrato missing produce deny;
52. contrato ambiguo produce deny;
53. PermissionContractSnapshot se congela;
54. catálogo y hash se validan;
55. no existe contrato predeterminado;
56. recurso se resuelve por contrato;
57. caller no elige resolver;
58. registro de resolvers es cerrado;
59. resolver ausente produce deny;
60. existing se valida;
61. draft se normaliza;
62. colección se construye en servidor;
63. agregado evita inferencias;
64. bulk exige contrato;
65. atomicidad bulk es explícita;
66. non-resource no es fallback;
67. territorio se resuelve;
68. null no significa global;
69. estado se valida;
70. transición se valida;
71. propiedad y custodia se validan;
72. clasificación de campos se resuelve;
73. concurrencia se valida;
74. idempotencia no concede permiso;
75. required lanes procede de modalidad;
76. carril no admitido es NOT_APPLICABLE;
77. carril admitido se evalúa;
78. ausencia de allow produce deny;
79. datasets exactos se cargan;
80. versiones y hashes se registran;
81. latest no se acepta;
82. dataset sin match se registra;
83. dataset no aplicable no se inventa;
84. se conserva precedencia;
85. matched allows son reales;
86. matched denies son reales;
87. base no usa turno;
88. operativo usa turno;
89. T no exige check-in;
90. T+C exige check-in;
91. check-in incompatible bloquea;
92. área requerida se valida;
93. dependencias proceden del catálogo;
94. dependencia usa mismo actor y contexto;
95. dependencia no autoriza el principal;
96. núcleo recursivo es privado;
97. ciclo produce contract invalid;
98. límite de profundidad es 32;
99. dispositivo restringe;
100. dispositivo no concede;
101. sensibilidad procede del contrato;
102. reautenticación no amplía;
103. field policy se evalúa;
104. lectura parcial puede permitir;
105. mutación no elimina campos;
106. cuatro modalidades se combinan correctamente;
107. carriles no prestan componentes;
108. combination allow no garantiza final allow;
109. final solo es allow o deny;
110. allow exige evidencia completa;
111. default deny es explícito;
112. blocked reasons conserva secundarias;
113. razón primaria usa precedencia;
114. mensaje seguro no filtra;
115. audit es obligatorio;
116. allow y deny tienen audit;
117. evaluator name es estable;
118. evaluator version es exacta;
119. ejecución revalida;
120. UI guard no reemplaza servidor;
121. RPC usa el mismo núcleo;
122. RLS usa predicados equivalentes;
123. booleanos son proyecciones;
124. jobs resuelven SYSTEM;
125. unresolved no muta;
126. anónimo requiere contrato;
127. simulación está excluida;
128. caché se reserva para AUTH-CTX-029;
129. canonical JSON se aplica;
130. SECURITY DEFINER tiene controles;
131. PUBLIC se revoca;
132. anon se revoca;
133. authenticated no accede a función interna;
134. existe proyección interna;
135. existe proyección segura;
136. envelope inválido produce error contractual;
137. invalidez semántica produce DENY;
138. error de infraestructura no produce parcial;
139. stale context exige nueva decisión;
140. recurso cambiado exige reevaluar;
141. drift se detecta;
142. evaluadores booleanos quedan legacy;
143. guards locales se inventarían;
144. existe orden de transición;
145. se crea AUTH-DB-034;
146. AUTH-DB-034 depende de AUTH-DB-033;
147. AUTH-DB-032 integra persistencia;
148. AUTH-DB-006 a 010 adoptan el evaluador;
149. AUTH-DB-027 prueba la implementación;
150. no se implementa código ni Supabase en esta tarea.

---

#### 99. Cierre y continuidad de la propuesta

| Relación        | Tarea          | Estado        |
| --------------- | -------------- | ------------- |
| Tarea anterior  | `AUTH-CTX-025` | ✅ APROBADA    |
| Tarea propuesta | `AUTH-CTX-026` | ✅ APROBADA    |
| Tarea siguiente | `AUTH-CTX-027` | ⬜ NO INICIADA |

```text
AUTH-CTX-025 — APROBADA
        ↓
AUTH-CTX-026 — APROBADA
        ↓
AUTH-CTX-027 — NO INICIADA
```

No se avanza a `AUTH-CTX-027` hasta recibir aprobación explícita de
`AUTH-CTX-026`.


### ✅ AUTH-CTX-027 — Definir consumo centralizado del contexto por las aplicaciones

| Campo                            | Valor                                                                                            |
| -------------------------------- | ------------------------------------------------------------------------------------------------ |
| **Estado**                       | **APROBADA**                                                                                     |
| **Bloque**                       | BLOQUE E — Contexto y decisión de autorización unificados                                        |
| **Subbloque**                    | DISEÑO DE IMPLEMENTACIÓN CANÓNICA                                                                |
| **Naturaleza**                   | Definición documental de consumo transversal                                                     |
| **Implementación física**        | No incluida                                                                                      |
| **Tarea anterior vigente**       | `AUTH-CTX-026` — APROBADA                                                                        |
| **Puerta posterior obligatoria** | `AUTH-MOD-021` — Definir rol base mínimo no privilegiado para trabajadores puramente operativos  |
| **Tarea posterior condicionada** | `AUTH-CTX-028` — Definir compatibilidad temporal con `get_operational_context`                   |
| **Contratos consumidos**         | `AccessContext@1.0.0`, `AuthorizationDecision@1.0.0` y proyecciones seguras                      |
| **Núcleo compartido candidato**  | `@vento/os-context` redefinido como SDK canónico                                                 |
| **Fuente de tipos**              | `@vento/contracts` y tipos generados aprobados                                                   |
| **Cambio contractual**           | Define cómo consumen las aplicaciones; no modifica los contratos publicados                      |
| **Cambios físicos permitidos**   | No                                                                                               |
| **Brecha física detectada**      | El consumo está fragmentado entre paquetes, helpers, guards, hooks, RPC booleanas y lógica local |
| **Tareas de autorización refinadas** | `SHELL-AUTH-001` a `SHELL-AUTH-005`; se conservan sin reutilizar IDs |
| **Tareas contextuales refinadas** | `SHELL-CTX-001` a `SHELL-CTX-005`; se consolidan dentro de `@vento/os-context` |

Esta tarea define una única arquitectura de consumo para que todas las
aplicaciones de Vento OS utilicen el mismo contexto y la misma decisión sin
reconstruir autoridad localmente.

La regla central es:

```text
UNA FUENTE DE CONTEXTO
+
UN NÚCLEO DE EVALUACIÓN
+
ADAPTADORES COMPARTIDOS
+
PROYECCIONES SEGURAS
=
CONSUMO CONSISTENTE EN TODO VENTO OS
```

```text
CONTEXTO CENTRALIZADO
≠
OBJETO GLOBAL MUTABLE
```

```text
SDK COMPARTIDO
≠
BYPASS DE SERVIDOR
```

```text
UI GUARD
≠
CONTROL DE SEGURIDAD SUFICIENTE
```

No implementa paquetes, hooks, adapters, RPC, migraciones, políticas RLS,
server actions, route handlers, cambios en aplicaciones ni modificaciones en
Supabase.

---

#### 1. Objetivo

Definir de forma cerrada:

1. quién es propietario del consumo compartido;
2. qué paquete será la frontera canónica;
3. qué contratos se comparten;
4. qué lógica permanece exclusivamente en servidor;
5. qué proyecciones puede recibir el cliente;
6. cómo se resuelve contexto una sola vez por frontera;
7. cómo se evalúa cada acción con recurso exacto;
8. cómo consumen Server Components;
9. cómo consumen Server Actions;
10. cómo consumen Route Handlers;
11. cómo consumen jobs y procesos de sistema;
12. cómo consumen los clientes React;
13. cómo consume la navegación;
14. cómo se bloquean acciones directas;
15. cómo se evita duplicar contexto;
16. cómo se evita duplicar reglas;
17. cómo se prohíben RPC legacy directas;
18. cómo se migra cada aplicación;
19. cómo se prueban paridad y fail closed;
20. cómo se retira el consumo heredado.

---

#### 2. Base normativa

AUTH-CTX-027 conserva sin cambios las decisiones aprobadas en:

- `ADR-AUTH-001`;
- `AUTH-MOD-001` a `AUTH-MOD-020`;
- `AUTH-CAT-001` a `AUTH-CAT-024`;
- `AUTH-RBAC-001` a `AUTH-RBAC-028`;
- `AUTH-CTX-001` — `AccessContext`;
- `AUTH-CTX-002` — `AuthorizationDecision`;
- `AUTH-CTX-003` — `SimulationContext`;
- `AUTH-CTX-004` — versionado y serialización;
- `AUTH-CTX-005` a `AUTH-CTX-015` — nodos del contexto;
- `AUTH-CTX-016` a `AUTH-CTX-024` — decisión y auditoría;
- `AUTH-CTX-025` — contrato de `get_access_context`;
- `AUTH-CTX-026` — contrato de `evaluate_authorization`;
- `SHELL-AUD-002` a `SHELL-AUD-005` — auditoría de guards, permisos, contexto y overrides;
- `SHELL-PKG-001` a `SHELL-PKG-008` — distribución, versión y deprecación;
- `SHELL-CON-001` a `SHELL-CON-008` — contratos, códigos y tipos compartidos;
- `AUTH-UI-001` a `AUTH-UI-060` — rutas, pantallas, acciones y experiencia;
- `AUTH-DB-006` a `AUTH-DB-010` — adopción en RPC sensibles;
- `AUTH-DB-020`, `AUTH-DB-021` y `AUTH-DB-026` — migración, RLS y tipos;
- `AUTH-DB-027` a `AUTH-DB-031` — pruebas, drift, retiro y certificación;
- `AUTH-DB-032` — persistencia de decisiones;
- `AUTH-DB-033` — resolver de contexto;
- `AUTH-DB-034` — evaluador canónico.

Principios obligatorios:

```text
APLICACIÓN
NO RECONSTRUYE
ACTOR, ROL, TURNO, SEDE, ÁREA O DISPOSITIVO
```

```text
CLIENTE
NO RECIBE
EVIDENCIA INTERNA COMPLETA
```

```text
SERVIDOR
NO CONFÍA
EN EL ESTADO DE AUTORIZACIÓN DEL CLIENTE
```

---

#### 3. Estado físico conocido

El ecosistema contiene actualmente varios modelos de consumo:

- `@vento/os-context` llama directamente RPC legacy;
- NEXO mantiene un helper operativo local;
- ORIGO, PULSO y VISO mantienen helpers de permisos similares;
- ANIMA consulta permisos desde un hook de cliente;
- guards locales resuelven sesiones, overrides y permisos;
- políticas RLS y RPC aplican verificaciones propias;
- aplicaciones normalizan claves de permiso localmente;
- algunas fronteras reciben sede y área desde el caller.

Este estado es transitorio y no define la arquitectura final.

---

#### 4. Evidencia legacy: paquete compartido actual

El paquete actual `@vento/os-context`:

- llama `get_effective_context_v1`;
- llama `has_effective_permission_v1`;
- expone resultados booleanos;
- incluye inicio y cierre de simulación;
- documenta precedencia entre dispositivo, simulación, ANIMA y bypass.

Por tanto, el nombre del paquete puede conservarse, pero su implementación y
responsabilidad deberán redefinirse.

---

#### 5. Evidencia legacy: NEXO

El helper actual de NEXO:

- acepta `employeeId`;
- acepta `siteId`;
- usa `get_operational_context`;
- usa `has_operational_permission`;
- deriva aplicación desde la clave;
- aplica role override desde cookies;
- busca áreas localmente;
- usa `can_operate`;
- construye mensajes desde razones legacy.

Ninguna de estas reglas será fuente autoritativa final.

---

#### 6. Evidencia legacy: ORIGO, PULSO y VISO

Los helpers actuales de estas aplicaciones:

- normalizan claves agregando el prefijo de aplicación;
- aceptan sede y área como contexto del caller;
- llaman directamente `has_permission`;
- convierten cualquier error en `false`;
- retornan únicamente booleanos.

La similitud entre repositorios demuestra duplicación transversal.

---

#### 7. Evidencia legacy: guards de servidor

Los guards actuales pueden:

- resolver usuario;
- resolver sesión operativa;
- aplicar política especial para dispositivo compartido;
- consultar `has_permission` varias veces;
- aplicar role override;
- redirigir con razones locales;
- devolver sede, área y `navigation_role`.

La navegación y la autorización quedan mezcladas en una misma frontera.

---

#### 8. Evidencia legacy: hooks de cliente

Existen hooks que llaman `has_permission` desde el navegador por cada clave.

Esto produce:

- múltiples round trips;
- decisiones separadas sin snapshot común;
- exposición de detalles de implementación;
- posibilidad de drift respecto del servidor;
- dependencia de booleanos sin razones seguras;
- uso del cliente como consumidor directo de RPC de autorización.

Este patrón deberá retirarse.

---

#### 9. Decisión principal

Se define un único SDK lógico de consumo:

```text
@vento/os-context
```

Responsabilidad final:

```text
CONTRATOS
+
ADAPTADORES DE SERVIDOR
+
PROYECCIONES SEGURAS
+
INTEGRACIÓN DE CLIENTE
+
UTILIDADES DE PRUEBA
```

No contendrá lógica empresarial independiente del resolver y evaluador
canónicos.

---

#### 10. Propiedad del SDK

El SDK será propiedad de:

```text
vento-shell
→ BLOQUE H — Fundación compartida
```

Las aplicaciones serán consumidoras versionadas.

Ninguna aplicación será propietaria de una bifurcación local del contrato.

---

#### 11. Paquetes y fronteras

La arquitectura conceptual será:

```text
@vento/contracts
→ tipos, enums, códigos y schemas

@vento/os-context/server
→ resolución y evaluación en servidor

@vento/os-context/client
→ proyecciones seguras y hooks de presentación

@vento/os-context/testing
→ fixtures, factories y matchers

@vento/os-context/legacy
→ compatibilidad temporal explícita
```

Los nombres de exports podrán ajustarse en BLOQUE H sin cambiar esta
separación.

---

#### 12. Fuente de contratos

Los tipos de:

- `AccessContext`;
- `AuthorizationDecision`;
- `SimulationContext`;
- requests;
- proyecciones seguras;
- códigos de razón;
- códigos de aplicación;
- códigos de permiso;

procederán de `@vento/contracts` o de tipos generados aprobados.

No se duplicarán interfaces manuales por repositorio.

---

#### 13. Fuente de lógica

La lógica autoritativa procede exclusivamente de:

```text
get_access_context
+
evaluate_authorization
+
resolvers privados
+
datasets publicados
```

El SDK adapta y valida.

No vuelve a implementar precedencia, carriles, grants, denies o territorio.

---

#### 14. APIs conceptuales de servidor

El SDK deberá ofrecer conceptualmente:

```ts
resolveAccessContext({ appCode })
evaluateAuthorization({ request, correlationId })
requireAuthorization({ request, correlationId })
getSafeContextProjection({ context })
getSafeDecisionProjection({ decision })
createAuthorizationScope({ appCode })
```

Los nombres finales se aprobarán en `SHELL-AUTH-001` y `SHELL-AUTH-002`.

---

#### 15. createAuthorizationScope

Una frontera de servidor podrá crear un scope por solicitud:

```text
scope
=
app_code fijo
+
principal de la solicitud
+
correlación
+
resolución memoizada
```

El scope no concede autoridad y no vive entre solicitudes.

---

#### 16. app_code fijo

Cada aplicación deberá fijar su `app_code` en un adapter propio.

Ejemplo conceptual:

```text
vento-nexo adapter
→ app_code = nexo
```

El código de aplicación no deberá llegar desde:

- query string;
- body;
- cookie editable;
- ruta dinámica;
- clave de permiso;
- local storage.

---

#### 17. Frontera de servidor obligatoria

La resolución completa y la evaluación ocurren en servidor para:

- Server Components;
- layouts protegidos;
- Server Actions;
- Route Handlers;
- API internas;
- RPC wrappers;
- jobs;
- procesos de sistema;
- operaciones de lectura sensible;
- mutaciones.

---

#### 18. Server Components

Un Server Component podrá consumir:

- proyección segura de contexto;
- decisiones seguras de lectura;
- capacidades necesarias para renderizar.

No deberá serializar al cliente la decisión interna completa.

---

#### 19. Layouts protegidos

El layout podrá:

- resolver contexto una vez;
- validar acceso de aplicación;
- producir navegación segura;
- entregar una proyección mínima al árbol.

No deberá utilizar la autorización del layout para permitir mutaciones
posteriores.

---

#### 20. Server Actions

Cada Server Action deberá:

1. fijar aplicación;
2. construir `AuthorizationEvaluationRequest`;
3. resolver recurso en servidor;
4. evaluar permiso exacto;
5. comprobar outcome;
6. revalidar concurrencia;
7. ejecutar;
8. vincular decisión y resultado.

No confiará en un booleano enviado desde UI.

---

#### 21. Route Handlers

Los Route Handlers deberán usar el mismo adapter de servidor.

No mantendrán middleware de permisos con reglas paralelas.

La autenticación temprana puede ocurrir antes, pero la autorización exacta
permanece en la frontera de recurso.

---

#### 22. Jobs

Los jobs deberán crear un scope con:

- aplicación;
- principal de sistema;
- correlación;
- request source `JOB`.

No usarán `service_role` como permiso empresarial.

---

#### 23. RPC wrappers

Los wrappers compartidos deberán:

- usar funciones aprobadas;
- validar contratos de respuesta;
- traducir errores técnicos;
- conservar correlación;
- no aceptar actor o territorio efectivo;
- no exponer helpers internos.

---

#### 24. Cliente React

El cliente recibirá una proyección segura obtenida en servidor.

Podrá consumirla mediante:

- provider;
- hook;
- props serializadas;
- actualización controlada.

No consultará directamente el contexto interno.

---

#### 25. SafeContextProjection

La proyección segura podrá incluir:

- `context_id` cuando sea necesario;
- actor seguro;
- aplicación;
- sede y área operativas seguras;
- rol visible permitido;
- estado de readiness seguro;
- dispositivo seguro;
- códigos de recuperación seguros;
- `resolved_at` cuando sea útil.

No incluye evidencia interna completa.

---

#### 26. SafeDecisionProjection

Una decisión segura podrá incluir:

- outcome;
- permiso exacto;
- `safe_message_code`;
- razones seguras;
- acciones de recuperación;
- correlación de soporte;
- campos visibles aprobados.

No incluye grants, denies, hashes o versiones internas.

---

#### 27. Hooks de presentación

Hooks como:

```text
useAccessContext
useAuthorization
useCan
```

serán consumidores de una proyección ya emitida.

No llamarán RPC internas por cada render o permiso.

---

#### 28. Actualización del contexto cliente

La proyección podrá actualizarse cuando ocurra:

- navegación de servidor;
- refresh explícito;
- cambio de actor en dispositivo compartido;
- inicio o cierre de turno;
- check-in o check-out;
- cambio de simulación;
- invalidación aprobada.

La estrategia de caché corresponde a AUTH-CTX-029.

---

#### 29. Navegación

La navegación utiliza decisiones seguras para:

- ocultar enlaces irrelevantes;
- ordenar accesos frecuentes;
- mostrar estados bloqueados;
- dirigir recuperación.

La navegación no es una frontera de seguridad suficiente.

---

#### 30. Acceso directo por URL

Toda ruta protegida deberá validar en servidor.

Ocultar un enlace no impide acceso directo.

`AUTH-UI-041` implementará la regla en superficies reales.

---

#### 31. Acciones visibles

Un botón visible no implica autorización persistente.

La acción se evalúa de nuevo en servidor con el recurso exacto.

`AUTH-UI-042` y `AUTH-UI-043` gobiernan esta aplicación.

---

#### 32. Prohibición de has_permission directo

Después de la migración, las aplicaciones no podrán invocar directamente:

```text
has_permission
has_operational_permission
has_effective_permission_v1
get_operational_context
get_effective_context_v1
```

salvo dentro del adapter legacy temporal y controlado.

---

#### 33. Prohibición de Supabase directo desde cliente

El navegador no invocará funciones internas de autorización.

Una excepción futura requerirá:

- contrato expuesto específico;
- proyección segura;
- grants explícitos;
- RLS;
- pruebas negativas;
- aprobación documental.

---

#### 34. Prohibición de normalización local de permisos

Las aplicaciones no agregarán prefijos a claves de permiso.

La clave canónica completa procederá de:

- catálogo compartido;
- constante generada;
- contrato de pantalla o acción.

Una clave incompleta es error de desarrollo.

---

#### 35. Prohibición de roles como permisos

El consumidor no decidirá mediante:

```text
role === propietario
role === gerente_general
role === cajero
```

Los roles solo aparecen como hechos dentro del contexto y de datasets
canónicos.

---

#### 36. Prohibición de sede y área efectivas desde UI

La UI puede enviar localizadores del recurso o filtros permitidos.

No puede declarar:

- sede efectiva del actor;
- área efectiva del actor;
- turno efectivo;
- check-in efectivo.

El servidor resuelve esos hechos.

---

#### 37. Contexto por solicitud

Dentro de una solicitud de servidor:

```text
mismo app_code
+
mismo principal
+
mismo snapshot
→ misma resolución de AccessContext
```

El SDK deberá deduplicar la resolución dentro de esa frontera.

---

#### 38. No existe singleton global

Queda prohibido mantener `AccessContext` en:

- variable global mutable;
- singleton de proceso;
- módulo con actor anterior;
- cache sin clave completa;
- estado compartido entre usuarios.

---

#### 39. Memoización request-scoped

La memoización inicial será únicamente request-scoped.

No requiere TTL.

No reemplaza la estrategia posterior de AUTH-CTX-029.

---

#### 40. Contexto frente a decisión

El contexto puede reutilizarse dentro de la misma solicitud.

Cada acción o recurso requiere una decisión exacta.

```text
UN CONTEXTO
→ VARIAS DECISIONES
```

No se reutiliza una decisión para otro recurso.

---

#### 41. Batch de decisiones de UI

La UI podrá solicitar una proyección agregada para una lista cerrada de
capacidades de presentación.

El servidor deberá:

- resolver contexto una vez;
- evaluar cada permiso;
- devolver solo proyecciones seguras;
- conservar decisiones separadas internamente;
- limitar cantidad y catálogo.

---

#### 42. Batch no autoriza mutaciones

Una proyección batch de UI no podrá utilizarse como autorización para una
mutación posterior.

La mutación se evalúa nuevamente con recurso y versión exactos.

---

#### 43. Errores fail closed

Cualquier error al:

- resolver contexto;
- validar contrato;
- evaluar permiso;
- resolver recurso;
- validar proyección;

produce denegación o error seguro.

Nunca produce `true` por fallback.

---

#### 44. Errores técnicos frente a denegaciones

El SDK distinguirá internamente:

```text
DENY CANÓNICO
≠
FALLO DE INFRAESTRUCTURA
```

La UI recibirá mensajes seguros diferentes, sin detalles internos.

---

#### 45. Correlación

Cada frontera deberá propagar `correlation_id` cuando exista.

La correlación conectará:

- render protegido;
- acción;
- evaluación;
- ejecución;
- auditoría;
- error.

No concede autoridad.

---

#### 46. Observabilidad

El SDK podrá emitir métricas de:

- latencia;
- cache request-scoped hit/miss;
- outcome agregado;
- error técnico;
- consumidor;
- versión;
- uso legacy.

No emitirá secretos ni evidencia sensible.

---

#### 47. Registro de consumidores

Se deberá crear un registro canónico con una fila por consumidor.

Campos mínimos:

```text
repository
path
surface_type
consumer_name
app_code
current_api
target_api
permission_source
resource_source
legacy_behavior
migration_task
owner
status
test_evidence
removal_gate
```

---

#### 48. surface_type

Valores iniciales:

```text
SERVER_COMPONENT
LAYOUT
SERVER_ACTION
ROUTE_HANDLER
CLIENT_HOOK
CLIENT_COMPONENT
NAVIGATION
MIDDLEWARE
RPC
RLS
JOB
EDGE_FUNCTION
REALTIME
```

La clasificación permite diseñar el adapter correcto.

---

#### 49. Inventario obligatorio

El inventario deberá cubrir:

- NEXO;
- FOGO;
- ORIGO;
- PULSO;
- VISO;
- NUMERA;
- ANIMA;
- SHELL;
- PASS en superficies laborales relacionadas;
- AURA;
- servicios compartidos;
- SQL, RLS y RPC.

---

#### 50. PASS

PASS no consumirá el contexto laboral interno por defecto.

Podrá compartir:

- contratos generales;
- códigos;
- principal técnico;
- patrones de proyección segura.

Sus decisiones de cliente deberán usar contratos de dominio propios y no
recibir autoridad de empleado.

---

#### 51. ANIMA

ANIMA es fuente de hechos laborales como turnos y check-in.

ANIMA también es consumidor cuando protege sus propias acciones.

No será el evaluador central ni publicará un contexto alternativo.

---

#### 52. SHELL

SHELL será:

- propietario del SDK;
- consumidor de acceso a aplicación;
- consumidor de navegación;
- consumidor de contexto activo;
- anfitrión de proyecciones seguras compartidas.

No tendrá bypass por ser shell.

---

#### 53. VISO

VISO consumirá el mismo núcleo para:

- administración;
- configuración;
- supervisión;
- auditoría;
- soporte autorizado.

Los permisos administrativos no se derivan de rutas o nombres de rol.

---

#### 54. NEXO

NEXO deberá retirar progresivamente:

- contexto operativo local;
- `can_operate`;
- role override local;
- sede elegida como autoridad;
- `has_operational_permission` directo;
- mensajes legacy.

Las acciones de inventario y logística se evaluarán por recurso exacto.

---

#### 55. FOGO

FOGO deberá consumir contexto para:

- producción;
- receta;
- solicitud;
- lote;
- área de producción;
- operación compartida con NEXO.

No copiará helpers de NEXO.

---

#### 56. ORIGO

ORIGO deberá retirar:

- prefijos locales;
- `has_permission` directo;
- sede y área declaradas por guard;
- role override local;
- sesión operativa paralela.

Recepciones, compras y correcciones requieren evaluación por recurso.

---

#### 57. PULSO

PULSO deberá consumir contexto para:

- acceso a POS;
- sesiones de caja;
- pedidos;
- pagos;
- comandas;
- preparación;
- entrega;
- overrides sensibles.

El dispositivo compartido restringe y no crea autoridad.

---

#### 58. NUMERA

NUMERA deberá utilizar la misma frontera para:

- lectura financiera;
- configuración;
- cierres;
- conciliación;
- exportación;
- acciones sensibles.

No se autoriza por ser proceso contable o financiero.

---

#### 59. AURA

AURA deberá adoptar contratos y adapters aprobados antes de recibir acceso a
datos o acciones internas.

No mantendrá un modelo de identidad o permiso separado.

---

#### 60. Aplicaciones futuras

Toda aplicación futura deberá:

- declarar app code;
- consumir contratos compartidos;
- usar adapter de servidor;
- usar proyección segura;
- registrar consumidores;
- aprobar pruebas;
- evitar RPC legacy.

---

#### 61. Role override

El role override actual se clasifica como mecanismo legacy.

La simulación futura deberá usar:

```text
SimulationContext
+
evaluador de simulación separado
```

No modificará cookies para cambiar autoridad real.

---

#### 62. Dispositivo compartido

El SDK no resolverá actor mediante cookies locales.

Consumirá el principal, actor y dispositivo producidos por
`get_access_context`.

---

#### 63. Cambio de actor en dispositivo

Cuando cambie el actor:

- se invalida la proyección cliente;
- se crea nuevo contexto;
- se cancelan decisiones UI anteriores;
- las acciones en curso se revalidan;
- no se conserva el último rol.

---

#### 64. Simulación

La simulación no se mezcla con el adapter real.

Exports separados deberán evitar que una aplicación use una simulación como
contexto de ejecución.

---

#### 65. RLS

RLS no consume el SDK TypeScript.

Debe consumir predicados SQL construidos sobre el mismo núcleo contractual.

Se exige paridad semántica y pruebas de equivalencia.

---

#### 66. RPC

Las RPC sensibles deberán adoptar `AUTH-DB-006` a `AUTH-DB-010`.

Las aplicaciones llamarán wrappers compartidos o RPC de dominio protegidas,
no evaluadores booleanos genéricos legacy.

---

#### 67. Realtime

Suscribirse a un canal no concede lectura de datos.

La autorización de suscripción y payload deberá usar las políticas aprobadas
en `AUTH-DB-023` y el contexto canónico aplicable.

---

#### 68. Edge Functions

Las Edge Functions deberán:

- identificar principal técnico;
- fijar aplicación;
- construir request;
- consumir el evaluador mediante frontera aprobada;
- no usar service role como bypass.

---

#### 69. Middleware

Middleware podrá realizar autenticación o redirección temprana.

No será la única frontera de autorización porque normalmente carece del
recurso exacto y del snapshot completo.

---

#### 70. Contrato de compatibilidad

Durante la transición, `@vento/os-context/legacy` podrá envolver:

- `get_effective_context_v1`;
- `has_effective_permission_v1`;
- `get_operational_context`;
- `has_operational_permission`;
- `has_permission`.

Cada uso deberá quedar registrado y emitir deprecación.

---

#### 71. Legacy adapter sin autoridad nueva

El adapter legacy:

- no añade bypass;
- no convierte contexto antiguo en canónico completo;
- no declara paridad inexistente;
- no se usa en código nuevo;
- tiene fecha y puerta de retiro.

---

#### 72. Política de deprecación

Todo export legacy deberá incluir:

- etiqueta deprecada;
- consumidor conocido;
- reemplazo objetivo;
- métrica de uso;
- versión de retiro;
- prueba de ausencia antes de eliminar.

---

#### 73. Freeze de nuevas dependencias

Después de aprobar esta tarea queda prohibido introducir nuevos usos directos
de RPC legacy.

CI deberá bloquearlos cuando `SHELL-AUTH-004` esté implementada.

---

#### 74. Lint y análisis estático

El control futuro deberá detectar:

- `.rpc("has_permission"`;
- `.rpc("has_operational_permission"`;
- `.rpc("get_operational_context"`;
- `.rpc("get_effective_context_v1"`;
- claves de permiso literales fuera del catálogo;
- comparaciones directas de rol para autorizar;
- helpers locales duplicados.

---

#### 75. Codemods

Podrán crearse codemods para reemplazar patrones repetitivos.

Un codemod no aprobará automáticamente la semántica del recurso.

Cada migración requiere revisión funcional.

---

#### 76. Compatibilidad de versiones

Cada aplicación declarará una versión compatible de:

- `@vento/contracts`;
- `@vento/os-context`;
- tipos generados;
- contratos SQL.

La matriz de compatibilidad pertenece a `SHELL-PKG-004`.

---

#### 77. Distribución

La distribución deberá seguir `SHELL-PKG-001` a `SHELL-PKG-008`.

No se copiarán archivos manualmente entre repositorios.

No se actualizarán aplicaciones sin pruebas.

---

#### 78. Rollback

Cada aplicación deberá poder volver temporalmente al adapter compatible sin
reintroducir código divergente.

El rollback no convierte legacy en estado final aceptado.

---

#### 79. Migración por olas

Orden propuesto:

```text
OLA 0 — inventario y freeze
OLA 1 — contratos y SDK
OLA 2 — resolver y evaluador físicos
OLA 3 — SHELL y navegación
OLA 4 — guards y lecturas de bajo riesgo
OLA 5 — Server Actions y Route Handlers
OLA 6 — RPC y RLS sensibles
OLA 7 — jobs, Edge y Realtime
OLA 8 — retiro legacy y certificación
```

---

#### 80. OLA 0

Debe completar:

- `SHELL-AUD-002` a `SHELL-AUD-005`;
- `AUTH-UI-001` a `AUTH-UI-010`;
- registro de consumidores;
- prohibición de nuevos usos legacy.

---

#### 81. OLA 1

Debe completar:

- contratos compartidos;
- SDK server/client/testing;
- schemas de validación;
- proyecciones seguras;
- versionado;
- documentación.

---

#### 82. OLA 2

Depende de:

```text
AUTH-DB-033
→ AUTH-DB-034
→ AUTH-DB-032
```

No se declarará canónico un SDK que todavía llama únicamente funciones
legacy.

---

#### 83. OLA 3

SHELL deberá ser el primer consumidor transversal porque concentra:

- acceso a aplicaciones;
- navegación;
- contexto visible;
- estados de carga y bloqueo.

No se migran mutaciones sensibles en esta ola.

---

#### 84. OLA 4

Se migrarán:

- layouts;
- páginas de lectura;
- guardas de vista;
- navegación;
- proyecciones de contexto;
- mensajes seguros.

---

#### 85. OLA 5

Se migrarán acciones de servidor por dominio con:

- permiso exacto;
- recurso exacto;
- pruebas negativas;
- concurrencia;
- rollback.

---

#### 86. OLA 6

Se migrarán RPC y RLS únicamente con:

- núcleo implementado;
- predicados equivalentes;
- harness;
- planes de ejecución;
- pruebas de paridad;
- observabilidad.

---

#### 87. OLA 7

Se migrarán:

- jobs;
- integraciones;
- Edge Functions;
- Realtime;
- procesos de sistema.

Cada uno tendrá principal técnico registrado.

---

#### 88. OLA 8

Solo podrá ejecutarse cuando:

- registro de consumidores legacy = 0;
- búsqueda estática = 0;
- telemetría legacy = 0;
- pruebas de paridad aprobadas;
- rollback verificado;
- `AUTH-DB-031` aprobado.

---

#### 89. Pruebas unitarias del SDK

Deberán probar:

- validación de contratos;
- app code fijo;
- proyección segura;
- fail closed;
- errores técnicos;
- memoización request-scoped;
- no serialización de evidencia;
- adapters legacy marcados;
- fixtures versionadas.

---

#### 90. Pruebas de integración por aplicación

Cada aplicación deberá probar:

- acceso permitido;
- acceso denegado;
- URL directa;
- acción directa;
- recurso ajeno;
- sede ajena;
- área ajena;
- actor cambiado;
- dispositivo incompatible;
- contexto obsoleto;
- mensaje seguro.

---

#### 91. Pruebas de paridad

Durante transición se comparará:

```text
resultado legacy
vs
resultado canónico
```

Las diferencias deberán clasificarse:

- corrección intencional;
- brecha de datos;
- bug legacy;
- bug canónico;
- contrato pendiente.

No se exige conservar un resultado legacy incorrecto.

---

#### 92. Pruebas de seguridad

Se deberán probar:

- manipulación de app code;
- manipulación de permiso;
- manipulación de recurso;
- cambio de actor;
- replay de proyección;
- uso de decision ID como token;
- inyección de sede o área;
- invocación cliente de RPC interna;
- exposición de hashes;
- bypass por rol.

---

#### 93. Pruebas de rendimiento

Se medirán:

- resoluciones por request;
- evaluaciones por pantalla;
- latencia de batch UI;
- serialización;
- tamaño de proyección;
- consultas redundantes;
- impacto de RLS.

La optimización no cambia semántica.

---

#### 94. Refinamiento contractual de tareas SHELL-AUTH existentes

Se refinan contractualmente las tareas no iniciadas ya existentes:

```text
SHELL-AUTH-001
— Consolidar @vento/os-context como SDK canónico
  de contexto y autorización

SHELL-AUTH-002
— Implementar adapters de servidor, proyecciones seguras
  y consumo cliente

SHELL-AUTH-003
— Implementar scope por solicitud, deduplicación
  y registro canónico de consumidores

SHELL-AUTH-004
— Implementar lint, métricas y bloqueos
  contra nuevos consumos legacy

SHELL-AUTH-005
— Migrar consumidores por repositorio
  y certificar retiro del SDK legacy
```

---

#### 95. Ubicación canónica de SHELL-AUTH y SHELL-CTX

Las tareas deberán materializarse en:

```text
docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/03_AUTORIZACION_Y_CONTEXTO_COMPARTIDOS.md
```

Bajo una nueva sección lógica:

```text
AUTORIZACIÓN COMPARTIDA
```

Después de contratos y normalización compartida, antes de la adopción física y de la migración multi-repositorio.

---

#### 96. SHELL-AUTH-001

Deberá definir e implementar:

- exports canónicos;
- separación server/client/testing/legacy;
- schemas;
- versionado;
- dependencia con `@vento/contracts`;
- política de compatibilidad;
- documentación de consumo.

---

#### 97. SHELL-AUTH-002

Deberá implementar:

- adapter de `get_access_context`;
- adapter de `evaluate_authorization`;
- `requireAuthorization`;
- proyección segura de contexto;
- proyección segura de decisión;
- provider y hooks de presentación;
- traducción de errores.

---

#### 98. SHELL-AUTH-003

Deberá implementar:

- scope por solicitud;
- resolución única;
- memoización segura;
- correlación;
- registro de consumidores;
- metadata de versión;
- fixtures de pruebas.

---

#### 99. SHELL-AUTH-004

Deberá implementar:

- reglas de lint;
- búsqueda estática;
- allowlist temporal;
- métricas de uso legacy;
- gate de CI;
- reporte por repositorio;
- criterio de cero nuevos usos.

---

#### 100. SHELL-AUTH-005

Deberá coordinar:

- migración de SHELL;
- NEXO;
- FOGO;
- ORIGO;
- PULSO;
- VISO;
- NUMERA;
- ANIMA;
- AURA;
- superficies laborales de PASS;
- servicios compartidos.

No sustituye las tareas de dominio; las vincula y verifica.

---

#### 101. Dependencias físicas

```text
SHELL-AUD-002 a SHELL-AUD-005
        ↓
SHELL-PKG-001 a SHELL-PKG-008
        ↓
SHELL-CON-001 a SHELL-CON-008
        ↓
SHELL-AUTH-001 a SHELL-AUTH-004
        ↓
AUTH-DB-033
        ↓
AUTH-DB-034
        ↓
AUTH-DB-032
        ↓
AUTH-DB-006 a AUTH-DB-010
        ↓
SHELL-AUTH-005
        ↓
AUTH-DB-030
        ↓
AUTH-DB-031
```

`AUTH-DB-027` acompaña cada paquete físico.

---

#### 102. Relación con AUTH-UI

| Responsabilidad               | Tarea                         |
| ----------------------------- | ----------------------------- |
| Inventario de superficies     | `AUTH-UI-001` a `AUTH-UI-010` |
| Permisos de vistas y acciones | `AUTH-UI-030` a `AUTH-UI-039` |
| Ocultar enlaces               | `AUTH-UI-040`                 |
| Bloquear URL                  | `AUTH-UI-041`                 |
| Bloquear acciones             | `AUTH-UI-042`                 |
| Protección de servidor        | `AUTH-UI-043`                 |
| Evitar permisos por rutas     | `AUTH-UI-044`                 |
| Unificar navegación           | `AUTH-UI-045`                 |
| Mostrar contexto              | `AUTH-UI-046`                 |
| Estados de experiencia        | `AUTH-UI-048` a `AUTH-UI-051` |

---

#### 103. Relación con AUTH-DB

| Responsabilidad      | Tarea                         |
| -------------------- | ----------------------------- |
| Resolver contexto    | `AUTH-DB-033`                 |
| Evaluar autorización | `AUTH-DB-034`                 |
| Persistir decisión   | `AUTH-DB-032`                 |
| Adoptar en RPC       | `AUTH-DB-006` a `AUTH-DB-010` |
| Migrar por dominio   | `AUTH-DB-020`                 |
| RLS y grants         | `AUTH-DB-021`                 |
| Tipos                | `AUTH-DB-026`                 |
| Harness              | `AUTH-DB-027`                 |
| Drift                | `AUTH-DB-028`                 |
| Retiro legacy        | `AUTH-DB-030`                 |
| Certificación        | `AUTH-DB-031`                 |

---

#### 104. Responsabilidades sin pendiente narrativo

| Brecha                  | Responsable                                  |
| ----------------------- | -------------------------------------------- |
| SDK actual incompatible | `SHELL-AUTH-001`                             |
| Adapters y proyecciones | `SHELL-AUTH-002`                             |
| Resolución duplicada    | `SHELL-AUTH-003`                             |
| Nuevos usos legacy      | `SHELL-AUTH-004`                             |
| Migración multi-repo    | `SHELL-AUTH-005`                             |
| Resolver físico         | `AUTH-DB-033`                                |
| Evaluador físico        | `AUTH-DB-034`                                |
| Persistencia            | `AUTH-DB-032`                                |
| Guards y pantallas      | `AUTH-UI-040` a `AUTH-UI-051`                |
| RPC y RLS               | `AUTH-DB-006` a `AUTH-DB-010`, `AUTH-DB-021` |
| Retiro                  | `AUTH-DB-030`                                |
| Certificación           | `AUTH-DB-031`                                |

---

#### 105. Antipatrones prohibidos

```ts
const allowed = await supabase.rpc("has_permission", ...);
```

```ts
const appCode = permission.split(".")[0];
```

```ts
if (user.role === "propietario") return true;
```

```ts
const context = {
  siteId: selectedSiteId,
  areaId: selectedAreaId,
};
```

```ts
window.localStorage.setItem("can_operate", "true");
```

También queda prohibido:

```text
contexto del cliente → autoridad
provider React → seguridad suficiente
layout allow → mutación allow
navigation role → rol operativo
cookie override → simulación canónica
error RPC → allow
booleano → evidencia completa
múltiples RPC por render → snapshot único
copy/paste helper → núcleo compartido
```

---

#### 106. Casos canónicos

##### Caso A — Layout de NEXO

```text
scope NEXO
→ resolve context una vez
→ evaluar nexo.access
→ producir navegación segura
```

##### Caso B — Mutación de ORIGO

```text
Server Action
→ construir request de recepción
→ evaluar permiso y recurso
→ revalidar versión
→ ejecutar
```

##### Caso C — Hook de ANIMA

```text
Server Component produce safe projection
→ Provider
→ hook lee memoria local
→ no RPC por permiso
```

##### Caso D — Dispositivo compartido PULSO

```text
principal dispositivo
+
actor empleado
→ contexto central
→ decisión por acción
```

##### Caso E — UI visible, acción denegada

```text
proyección anterior permitía mostrar botón
recurso cambió
→ servidor reevalúa
→ DENY
```

##### Caso F — Error técnico

```text
adapter falla
→ no fallback local
→ error seguro
→ fail closed
```

---

#### 107. Criterios de aprobación

AUTH-CTX-027 podrá aprobarse cuando se acepte que:

1. existe un único modelo de consumo;
2. el SDK pertenece a vento-shell;
3. `@vento/os-context` puede conservar nombre;
4. su implementación actual es legacy;
5. `@vento/contracts` provee contratos;
6. no se duplican interfaces por app;
7. el SDK no reimplementa reglas;
8. el resolver es fuente contextual;
9. el evaluador es fuente de decisión;
10. existen exports server;
11. existen exports client seguros;
12. existen exports testing;
13. existe frontera legacy temporal;
14. app code se fija en adapter;
15. app code no viene del cliente;
16. Server Components consumen proyecciones;
17. layouts resuelven acceso de aplicación;
18. layouts no autorizan mutaciones;
19. Server Actions evalúan recurso exacto;
20. Route Handlers usan el mismo adapter;
21. jobs usan principal de sistema;
22. service role no concede autoridad;
23. RPC wrappers validan contratos;
24. cliente no recibe decisión interna;
25. cliente recibe SafeContextProjection;
26. cliente recibe SafeDecisionProjection;
27. hooks no llaman RPC por render;
28. navegación no es seguridad suficiente;
29. URL directa se valida en servidor;
30. botón visible no autoriza acción;
31. `has_permission` directo queda prohibido;
32. `has_operational_permission` directo queda prohibido;
33. `has_effective_permission_v1` queda prohibido;
34. `get_operational_context` directo queda prohibido;
35. `get_effective_context_v1` directo queda prohibido;
36. solo adapter legacy puede envolverlos temporalmente;
37. navegador no invoca evaluadores internos;
38. claves de permiso no se normalizan localmente;
39. claves proceden del catálogo;
40. roles no se comparan para autorizar;
41. sede efectiva no viene de UI;
42. área efectiva no viene de UI;
43. turno no viene de UI;
44. check-in no viene de UI;
45. contexto se resuelve una vez por request;
46. no existe singleton global;
47. memoización inicial es request-scoped;
48. caché cross-request se reserva para AUTH-CTX-029;
49. un contexto puede soportar varias decisiones;
50. una decisión no se reutiliza para otro recurso;
51. batch UI conserva decisiones separadas;
52. batch UI no autoriza mutaciones;
53. errores fallan cerrados;
54. deny y error técnico se distinguen;
55. correlación se propaga;
56. correlación no concede autoridad;
57. observabilidad no filtra secretos;
58. existe registro de consumidores;
59. cada consumidor tiene owner;
60. cada consumidor tiene target API;
61. cada consumidor tiene migration task;
62. inventario cubre todas las aplicaciones;
63. PASS no recibe contexto laboral por defecto;
64. ANIMA es fuente y consumidor separado;
65. SHELL no tiene bypass;
66. VISO usa permisos exactos;
67. NEXO retira can_operate;
68. NEXO retira role override local;
69. FOGO no copia helpers de NEXO;
70. ORIGO retira prefijos locales;
71. PULSO respeta dispositivo restrictivo;
72. NUMERA usa la misma frontera;
73. AURA adopta contratos antes de operar;
74. apps futuras siguen el mismo estándar;
75. role override se reemplaza por simulación separada;
76. dispositivo no se resuelve por cookie local;
77. cambio de actor invalida proyección;
78. simulación usa exports separados;
79. RLS usa núcleo SQL equivalente;
80. RPC sensibles adoptan evaluador;
81. Realtime no concede lectura implícita;
82. Edge Functions registran principal;
83. middleware no es única frontera;
84. existe adapter legacy controlado;
85. adapter legacy no declara paridad falsa;
86. cada export legacy tiene retiro;
87. se congela creación de nuevos usos legacy;
88. lint detecta RPC legacy;
89. lint detecta roles directos;
90. lint detecta claves literales indebidas;
91. codemods requieren revisión funcional;
92. versiones compatibles se declaran;
93. no se copian paquetes manualmente;
94. existe rollback por app;
95. migración se ejecuta por olas;
96. OLA 0 completa inventario;
97. OLA 1 completa SDK;
98. OLA 2 implementa backend canónico;
99. OLA 3 migra SHELL;
100. OLA 4 migra lecturas y guards;
101. OLA 5 migra acciones;
102. OLA 6 migra RPC y RLS;
103. OLA 7 migra procesos técnicos;
104. OLA 8 retira legacy;
105. pruebas unitarias cubren adapters;
106. pruebas por app cubren URL y acción directa;
107. pruebas de paridad clasifican diferencias;
108. no se conserva bug legacy por paridad;
109. pruebas de seguridad manipulan app;
110. pruebas manipulan recurso;
111. pruebas cubren replay;
112. pruebas cubren bypass por rol;
113. se mide resolución por request;
114. se mide batch UI;
115. optimización no cambia semántica;
116. se refina SHELL-AUTH-001 sin cambiar su identificador;
117. se refina SHELL-AUTH-002 sin cambiar su identificador;
118. se refina SHELL-AUTH-003 sin cambiar su identificador;
119. se refina SHELL-AUTH-004 sin cambiar su identificador;
120. se refina SHELL-AUTH-005 sin cambiar su identificador;
121. SHELL-AUTH-001..005 y SHELL-CTX-001..005 se materializan en BLOQUE H;
122. SHELL-AUTH-001 consolida SDK;
123. SHELL-AUTH-002 implementa adapters;
124. SHELL-AUTH-003 implementa scope y registro;
125. SHELL-AUTH-004 implementa gates legacy;
126. SHELL-AUTH-005 coordina migración multi-repo;
127. SHELL-CTX-001..005 se refinan sin reutilizar IDs y conservan responsabilidades contextuales;
128. AUTH-DB-033 implementa contexto;
129. AUTH-DB-034 implementa evaluación;
130. AUTH-DB-032 persiste decisiones;
131. AUTH-DB-006 a 010 adoptan en RPC;
132. AUTH-DB-021 protege RLS;
133. AUTH-DB-027 acompaña paquetes;
134. AUTH-DB-030 retira SQL legacy;
135. AUTH-DB-031 certifica paridad;
136. AUTH-UI-040 a 051 aplican experiencia;
137. no queda pendiente narrativo sin dueño;
138. esta tarea no implementa código;
139. esta tarea no crea migraciones;
140. esta tarea no modifica Supabase.

---

#### 108. Fuera del alcance

AUTH-CTX-027 no:

- crea paquetes;
- publica versiones;
- cambia dependencias;
- modifica aplicaciones;
- crea hooks;
- crea adapters;
- crea providers;
- crea lint;
- crea codemods;
- crea RPC;
- crea RLS;
- implementa contexto;
- implementa evaluación;
- migra consumidores;
- retira legacy;
- modifica Supabase.

Toda responsabilidad diferida tiene tarea explícita.

---

#### 109. Cierre y continuidad de la propuesta

| Relación                     | Tarea          | Estado                 |
| ---------------------------- | -------------- | ---------------------- |
| Tarea anterior               | `AUTH-CTX-026` | ✅ APROBADA             |
| Tarea propuesta              | `AUTH-CTX-027` | ✅ APROBADA             |
| Puerta siguiente             | `AUTH-MOD-021` | ⬜ NO INICIADA          |
| Tarea posterior condicionada | `AUTH-CTX-028` | ⬜ BLOQUEADA POR PUERTA |

```text
AUTH-CTX-026 — APROBADA
        ↓
AUTH-CTX-027 — APROBADA
        ↓
AUTH-MOD-021 — PUERTA OBLIGATORIA
        ↓
AUTH-CTX-028 — BLOQUEADA HASTA APROBAR LA PUERTA
```

No se avanza a `AUTH-MOD-021` hasta recibir aprobación explícita de
`AUTH-CTX-027`.


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
