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

| Brecha                             | Responsable                                                 |
| ---------------------------------- | ----------------------------------------------------------- |
| SDK incompatible                   | `SHELL-AUTH-001`                                            |
| Contexto fragmentado               | `SHELL-CTX-001` a `SHELL-CTX-005`                           |
| Adapters y proyecciones            | `SHELL-AUTH-002`                                            |
| Resolución duplicada               | `SHELL-AUTH-003`                                            |
| Nuevos usos legacy                 | `SHELL-AUTH-004`                                            |
| Migración multi-repo               | `SHELL-AUTH-005`                                            |
| Resolver, evaluador y persistencia | `AUTH-DB-033`, `AUTH-DB-034`, `AUTH-DB-032`                 |
| Migración de objetos, RPC y RLS    | `AUTH-DB-020`, `AUTH-DB-006` a `AUTH-DB-010`, `AUTH-DB-021` |
| Guards y pantallas                 | `AUTH-UI-040` a `AUTH-UI-051`                               |
| Retiro y certificación             | `AUTH-DB-030`, `AUTH-DB-031`                                |

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

| Campo                                | Valor                                                                                            |
| ------------------------------------ | ------------------------------------------------------------------------------------------------ |
| **Estado**                           | **APROBADA**                                                                                     |
| **Bloque**                           | BLOQUE E — Contexto y decisión de autorización unificados                                        |
| **Subbloque**                        | DISEÑO DE IMPLEMENTACIÓN CANÓNICA                                                                |
| **Naturaleza**                       | Definición documental de consumo transversal                                                     |
| **Implementación física**            | No incluida                                                                                      |
| **Tarea anterior vigente**           | `AUTH-CTX-026` — APROBADA                                                                        |
| **Puerta posterior obligatoria**     | `AUTH-MOD-021` — Definir rol base mínimo no privilegiado para trabajadores puramente operativos  |
| **Tarea posterior condicionada**     | `AUTH-CTX-028` — Definir compatibilidad temporal con `get_operational_context`                   |
| **Contratos consumidos**             | `AccessContext@1.0.0`, `AuthorizationDecision@1.0.0` y proyecciones seguras                      |
| **Núcleo compartido candidato**      | `@vento/os-context` redefinido como SDK canónico                                                 |
| **Fuente de tipos**                  | `@vento/contracts` y tipos generados aprobados                                                   |
| **Cambio contractual**               | Define cómo consumen las aplicaciones; no modifica los contratos publicados                      |
| **Cambios físicos permitidos**       | No                                                                                               |
| **Brecha física detectada**          | El consumo está fragmentado entre paquetes, helpers, guards, hooks, RPC booleanas y lógica local |
| **Tareas de autorización refinadas** | `SHELL-AUTH-001` a `SHELL-AUTH-005`; se conservan sin reutilizar IDs                             |
| **Tareas contextuales refinadas**    | `SHELL-CTX-001` a `SHELL-CTX-005`; se consolidan dentro de `@vento/os-context`                   |

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

### ✅ AUTH-CTX-028 — Definir compatibilidad temporal con get_operational_context

**Estado:** APROBADA  
**Bloque:** BLOQUE E — Contexto y decisión de autorización unificados  
**Subbloque:** Diseño de implementación y transición  
**Naturaleza:** definición documental del contrato temporal de compatibilidad legacy  
**Implementación física:** no incluida  
**Contrato canónico vigente:** `AccessContext@1.0.0`  
**Frontera canónica objetivo:** `get_access_context(text) → jsonb`  
**Frontera legacy afectada:** `public.get_operational_context(uuid, uuid, text)`  
**Puerta previa:** `AUTH-MOD-021 — APROBADA`  
**Tarea anterior vigente:** `AUTH-MOD-021 — Definir rol base mínimo no privilegiado para trabajadores puramente operativos — APROBADA`  
**Tarea posterior reservada:** `AUTH-CTX-029 — Definir estrategia de invalidación y caché`  
**Restricción:** no implementar código, funciones, migraciones, RLS, grants ni cambios en Supabase durante esta tarea

---

#### 1. Objetivo

Definir una estrategia temporal, segura, auditable y retirable para que los consumidores actuales de `get_operational_context` puedan continuar funcionando durante la transición hacia `AccessContext@1.0.0`, sin convertir la forma legacy en fuente normativa, sin conservar bypasses incorrectos y sin crear una segunda autoridad de contexto.

La tarea deberá cerrar expresamente:

1. la condición jurídica y técnica de `get_operational_context`;
2. la firma que podrá conservarse temporalmente;
3. la dirección correcta de la adaptación;
4. la relación entre el resolver legacy y `get_access_context`;
5. la semántica de sus parámetros heredados;
6. la proyección exacta de los campos legacy;
7. el significado temporal de `can_operate`;
8. el retiro de `bypass_applied`;
9. el tratamiento de los oficios base legacy;
10. el tratamiento de `trabajador_operativo`;
11. la separación entre contexto base y operativo;
12. la relación con `has_operational_permission`;
13. la relación con `get_effective_context_v1`;
14. la eliminación del role override como autoridad real;
15. el comportamiento en dispositivos compartidos;
16. la exclusión de simulación;
17. la estrategia de paridad;
18. la telemetría y el registro de consumidores;
19. el rollback;
20. las puertas de deprecación y retiro;
21. las tareas físicas exactas responsables de cada paso.

---

#### 2. Estado legacy conocido

La firma física actual es:

```sql
public.get_operational_context(
  p_employee_id uuid default auth.uid(),
  p_site_id uuid default null,
  p_app_code text default 'nexo'
)
returns table (...)
```

La forma actual contiene:

```text
employee_id
app_code
active_site_id
selected_site_id
employee_default_site_id
active_shift_id
active_shift_site_id
active_shift_area_id
active_operational_role
on_shift_now
active_checkin_id
active_checkin_site_id
active_checkin_area_id
active_area_id
active_area_kind
checked_in_now
policy_requires_shift
policy_requires_checkin
policy_requires_site_match
bypass_applied
can_operate
blocked_reasons
```

Divergencias conocidas:

1. acepta `p_employee_id` suministrado por el consumidor;
2. acepta `p_site_id` suministrado por el consumidor;
3. da precedencia a la sede enviada por el caller;
4. utiliza sede seleccionada como fallback;
5. utiliza sede predeterminada del empleado como fallback;
6. identifica el turno mediante una resolución temporal simplificada;
7. identifica check-in mediante el último evento abierto;
8. aplica bypass por `propietario` y `gerente_general`;
9. permite otro bypass configurado mediante permiso;
10. mezcla política general de aplicación con contexto;
11. produce `can_operate` sin un permiso ni recurso exactos;
12. no separa carril base y carril operativo;
13. devuelve una forma plana;
14. no representa principal y actor efectivo por separado;
15. no representa sesiones de actor de dispositivo de forma canónica;
16. no representa asignaciones múltiples de sede y área;
17. no representa fingerprints ni versiones de fuentes;
18. puede ser modificado posteriormente por helpers locales de aplicación.

---

#### 3. Consumidores legacy identificados

Se reconocen como mínimo los siguientes consumidores o dependencias:

| Consumidor                               | Dependencia actual                                      | Riesgo                                                    |
| ---------------------------------------- | ------------------------------------------------------- | --------------------------------------------------------- |
| NEXO                                     | RPC directa desde `src/lib/auth/operational-context.ts` | Envía empleado, sede y app desde el helper local.         |
| NEXO role override                       | Modifica rol y área después de recibir la RPC           | Reconstruye autoridad mediante cookie y heurística local. |
| `has_operational_permission`             | Invoca `get_operational_context`                        | Puede aplicar bypass y booleano previo.                   |
| `get_effective_context_v1`               | Invoca `get_operational_context`                        | Mezcla contexto real, simulación y dispositivo.           |
| RLS, RPC o funciones no inventariadas    | Posibles dependencias indirectas                        | Requieren búsqueda física integral antes de migrar.       |
| Aplicaciones copiadas o wrappers locales | Dependencias potenciales                                | Deben comprobarse mediante inventario multi-repositorio.  |

La lista anterior no se considera exhaustiva.

La fuente definitiva será el registro canónico de consumidores de `SHELL-AUTH-003`.

---

#### 4. Base normativa

Esta propuesta conserva sin reinterpretar:

- `ADR-AUTH-001`;
- `AUTH-MOD-001` a `AUTH-MOD-021`;
- `AUTH-CAT-001` a `AUTH-CAT-024`;
- `AUTH-RBAC-001` a `AUTH-RBAC-028`;
- `AUTH-CTX-001` a `AUTH-CTX-027`;
- `AccessContext@1.0.0`;
- `AuthorizationDecision@1.0.0`;
- `get_access_context(text) → jsonb`;
- `evaluate_authorization(...)`;
- la arquitectura de `@vento/contracts`;
- la arquitectura de `@vento/os-context`;
- la separación entre contexto real y simulación;
- la prohibición de bypass por nombre de rol;
- la prohibición de usar sede seleccionada como autoridad;
- la resolución del recurso en servidor;
- la denegación por defecto.

Principios:

```text
COMPATIBILIDAD
≠ CANONIZACIÓN DEL LEGACY
```

```text
FORMA LEGACY
≠ AUTORIDAD LEGACY
```

```text
GET_OPERATIONAL_CONTEXT
→ PROYECCIÓN TEMPORAL
→ NO FUENTE NORMATIVA
```

```text
GET_ACCESS_CONTEXT
→ FUENTE CONTEXTUAL OBJETIVO
```

```text
EVALUATE_AUTHORIZATION
→ FUENTE DE DECISIÓN OBJETIVO
```

---

#### 5. Decisión principal

`get_operational_context` se clasifica como:

```text
LEGACY COMPATIBILITY FACADE
```

No será:

- resolver canónico;
- fuente de verdad;
- contrato nuevo;
- evaluador de permisos;
- origen de contexto administrativo;
- origen de simulación;
- fuente de bypass;
- API permitida para código nuevo.

La dirección obligatoria será:

```text
FUENTES CANÓNICAS
        ↓
get_access_context
        ↓
AccessContext@1.0.0
        ↓
PROYECCIÓN LEGACY CONTROLADA
        ↓
get_operational_context shape
```

Nunca:

```text
get_operational_context
        ↓
reconstruir AccessContext
```

El contexto canónico no se fabricará a partir de una fila legacy.

---

#### 6. Contrato temporal producido

Se define el contrato lógico:

```text
LegacyOperationalContextProjection@1.0.0
```

Propósito:

> Proyectar temporalmente un `AccessContext@1.0.0` real hacia la forma plana esperada por consumidores legacy, conservando compatibilidad estructural suficiente para la migración y eliminando toda autoridad que contradiga el modelo canónico.

El contrato no será exportado como contexto canónico.

Ubicación lógica futura:

```text
@vento/os-context/legacy
```

El export legacy deberá:

- estar marcado como deprecado;
- estar prohibido en código nuevo;
- exigir `app_code` fijado por el adapter;
- registrar consumidor;
- emitir telemetría;
- producir fail closed;
- declarar versión;
- tener puerta de retiro.

---

#### 7. Modos temporales de backend

Se permiten tres estados secuenciales:

```text
LEGACY_NATIVE
CANONICAL_PROJECTION
REMOVED
```

##### 7.1 `LEGACY_NATIVE`

El adapter temporal llama la función física actual.

Solo se admite mientras:

- `AUTH-DB-033` no esté implementada;
- el consumidor esté inventariado;
- no exista migración segura disponible;
- la llamada emita deprecación;
- no se creen nuevos consumidores.

No se declara paridad canónica.

##### 7.2 `CANONICAL_PROJECTION`

La firma legacy conserva su forma externa, pero el resultado se deriva de:

```text
get_access_context
+
proyector de compatibilidad
```

Este es el único modo aceptable después de implementar `AUTH-DB-033`.

##### 7.3 `REMOVED`

La función, wrapper o export deja de estar disponible.

Solo se alcanza después de completar todas las puertas de retiro.

---

#### 8. Prohibición de mezcla entre backends

Una solicitud utiliza exactamente un backend.

No se permite:

```text
campo A desde legacy
+
campo B desde canónico
+
fallback al que no sea null
```

No se permite:

```text
legacy allow
OR
canonical allow
```

No se permite comparar ambos resultados y escoger el más permisivo.

La selección del modo será:

- server-side;
- versionada;
- por consumidor registrado;
- observable;
- reversible durante transición;
- inaccesible para el navegador.

---

#### 9. Firma legacy temporal

Podrá conservarse temporalmente la identidad física:

```sql
get_operational_context(
  p_employee_id uuid,
  p_site_id uuid,
  p_app_code text
)
returns table (...)
```

Conservar la firma no conserva la semántica insegura de sus parámetros.

La compatibilidad es de ABI y forma, no de autoridad.

---

#### 10. Semántica de `p_employee_id`

`p_employee_id` deja de ser una fuente de actor.

Regla:

```text
ACTOR EFECTIVO
=
ACTOR RESUELTO DESDE LA CREDENCIAL REAL
```

Comportamiento:

| Valor recibido                       | Resultado                                           |
| ------------------------------------ | --------------------------------------------------- |
| `null`                               | Se deriva el actor efectivo canónico.               |
| Igual al empleado actor efectivo     | Se acepta solo como verificación de compatibilidad. |
| Distinto del empleado actor efectivo | Fail closed.                                        |
| Actor no empleado                    | No se utiliza el parámetro para fabricar empleado.  |
| Principal no autenticado             | No se utiliza el parámetro para fabricar actor.     |

Un mismatch deberá producir:

```text
can_operate = false
blocked_reasons += legacy_employee_argument_mismatch
```

No se devolverán datos del empleado solicitado indebidamente.

No se permitirá usar la función para consultar el contexto de terceros.

---

#### 11. Semántica de `p_site_id`

`p_site_id` deja de definir `active_site_id`.

Será únicamente:

```text
LEGACY REQUESTED SITE HINT
```

Reglas:

1. no crea sede operativa;
2. no reemplaza la sede del turno;
3. no reemplaza la sede del check-in;
4. no reemplaza la sede del recurso;
5. no utiliza sede seleccionada como fallback;
6. no utiliza sede primaria como fallback;
7. no amplía el alcance.

Comportamiento:

| Estado                                    | Resultado                                                                                         |
| ----------------------------------------- | ------------------------------------------------------------------------------------------------- |
| `p_site_id = null`                        | Se proyecta la sede operativa canónica o `null`.                                                  |
| Coincide con la sede operativa            | Puede conservarse la compatibilidad.                                                              |
| No coincide con la sede operativa         | Fail closed para el flujo legacy relacionado.                                                     |
| No existe sede operativa                  | No se completa con `p_site_id`.                                                                   |
| El permiso no requiere contexto operativo | Debe migrarse a evaluación canónica del carril correspondiente; no se resuelve mediante esta RPC. |

Código legacy de compatibilidad para mismatch:

```text
shift_site_mismatch
```

La telemetría interna podrá conservar una clasificación más precisa:

```text
legacy_requested_site_mismatch
```

---

#### 12. Semántica de `p_app_code`

`p_app_code`:

- se normaliza contra el catálogo;
- debe existir;
- debe estar activo;
- debe corresponder al adapter server-side del consumidor;
- no puede provenir libremente del navegador;
- no concede acceso a la aplicación;
- no define un permiso;
- no sustituye el recurso.

Los adapters fijarán el código:

```text
NEXO adapter → nexo
FOGO adapter → fogo
ORIGO adapter → origo
PULSO adapter → pulso
ANIMA adapter → anima
SHELL adapter → shell
```

Un código ausente, desconocido o incompatible produce fail closed.

---

#### 13. Proyección exacta de campos legacy

##### 13.1 Identidad y aplicación

| Campo legacy  | Fuente canónica                 | Regla                                                            |
| ------------- | ------------------------------- | ---------------------------------------------------------------- |
| `employee_id` | `employee.employee_id`          | Solo cuando el actor efectivo es un empleado activo y resoluble. |
| `app_code`    | aplicación validada del adapter | Nunca se deriva de un permiso ni de input cliente libre.         |

##### 13.2 Sedes de presentación legacy

| Campo legacy               | Fuente canónica                           | Regla                                                                |
| -------------------------- | ----------------------------------------- | -------------------------------------------------------------------- |
| `active_site_id`           | `operational_site.site_id`                | Solo sede operativa real; nunca selected/default/requested fallback. |
| `selected_site_id`         | `null`                                    | La sede seleccionada no forma parte de la autoridad canónica.        |
| `employee_default_site_id` | asignación primaria inequívoca, si existe | Solo información de compatibilidad; nunca autoridad ni fallback.     |

##### 13.3 Turno

| Campo legacy              | Fuente canónica                     | Regla                                                                     |
| ------------------------- | ----------------------------------- | ------------------------------------------------------------------------- |
| `active_shift_id`         | `active_shift.shift_id`             | Solo turno publicado, vigente y no ambiguo.                               |
| `active_shift_site_id`    | `active_shift.site_id`              | Debe coincidir con la sede operativa.                                     |
| `active_shift_area_id`    | `active_shift.area_id`              | Puede ser `null` únicamente si el contrato del rol permite no tener área. |
| `active_operational_role` | `operational_role.role_code`        | Exclusivamente desde el turno válido.                                     |
| `on_shift_now`            | existencia de `active_shift` válido | No se deriva de fecha y horas aisladas dentro del adapter.                |

##### 13.4 Check-in

| Campo legacy             | Fuente canónica                     | Regla                                                |
| ------------------------ | ----------------------------------- | ---------------------------------------------------- |
| `active_checkin_id`      | `active_checkin_session.session_id` | Solo sesión canónica activa.                         |
| `active_checkin_site_id` | sede de la sesión activa            | Debe ser compatible con turno y actor.               |
| `active_checkin_area_id` | área de la sesión, cuando exista    | No inventa área.                                     |
| `checked_in_now`         | sesión de check-in activa           | El último evento abierto no es evidencia suficiente. |

##### 13.5 Área

| Campo legacy       | Fuente canónica              | Regla                                     |
| ------------------ | ---------------------------- | ----------------------------------------- |
| `active_area_id`   | `operational_area.area_id`   | Solo área operativa canónica.             |
| `active_area_kind` | `operational_area.area_kind` | Se deriva del catálogo del área resuelta. |

##### 13.6 Política legacy

| Campo legacy                 | Fuente temporal                               | Regla                                                           |
| ---------------------------- | --------------------------------------------- | --------------------------------------------------------------- |
| `policy_requires_shift`      | política legacy registrada para la aplicación | Metadato temporal; no sustituye los prerrequisitos por permiso. |
| `policy_requires_checkin`    | política legacy registrada para la aplicación | Metadato temporal; no sustituye `authorization_requirement`.    |
| `policy_requires_site_match` | política legacy registrada para la aplicación | Metadato temporal; no define alcance ni recurso.                |

Estos tres campos pueden conservarse únicamente para presentación o paridad de flujos legacy.

No participan en una decisión canónica.

##### 13.7 Resultado legacy

| Campo legacy      | Fuente                                 | Regla                               |
| ----------------- | -------------------------------------- | ----------------------------------- |
| `bypass_applied`  | constante `false`                      | Todo bypass legacy queda eliminado. |
| `can_operate`     | readiness operativo legacy proyectado  | No es permiso ni decisión final.    |
| `blocked_reasons` | mapping seguro de problemas operativos | No contiene evidencia sensible.     |

---

#### 14. Semántica de `can_operate`

`can_operate` se redefine temporalmente como:

```text
LEGACY APPLICATION-LEVEL OPERATIONAL READINESS
```

No significa:

```text
PERMISSION ALLOW
```

No significa:

```text
RESOURCE ALLOW
```

No significa:

```text
APP ACCESS
```

No significa:

```text
BASE LANE ALLOW
```

Fórmula temporal:

```text
actor empleado válido
+
turno válido cuando la política legacy lo exige
+
check-in válido cuando la política legacy lo exige
+
rol operativo efectivo
+
sede y área compatibles
+
sin mismatch de argumentos
+
sin problema estructural operativo bloqueante
=
can_operate true
```

El valor solo podrá:

- mostrar un estado de readiness legacy;
- conservar temporalmente una experiencia previa;
- decidir si el consumidor debe pedir una evaluación exacta.

Nunca podrá autorizar:

- una mutación;
- una lectura sensible;
- una ruta protegida definitiva;
- un recurso;
- un permiso.

---

#### 15. `bypass_applied`

La proyección canónica siempre devuelve:

```text
bypass_applied = false
```

Se eliminan:

- bypass por `propietario`;
- bypass por `gerente_general`;
- bypass por permiso general de aplicación;
- bypass por role override;
- bypass por dispositivo;
- bypass por simulación.

Un propietario o gerente general que posea una capacidad deberá autorizarse mediante:

```text
ROL BASE
+
PERMISO BASE EXPLÍCITO
+
ALCANCE
+
RECURSO
+
SIN DENEGACIÓN
```

No mediante `get_operational_context`.

La desaparición del bypass se clasifica como:

```text
CORRECCIÓN INTENCIONAL DE SEGURIDAD
```

No como incompatibilidad que deba restaurarse.

---

#### 16. Tratamiento de `trabajador_operativo`

`trabajador_operativo` es un rol base.

No se proyectará en:

```text
active_operational_role
```

No producirá:

```text
can_operate = true
```

por sí solo.

El trabajador podrá tener:

```text
base_role = trabajador_operativo
```

y simultáneamente:

```text
active_operational_role = bodeguero
```

cuando el turno lo determine.

La proyección legacy solo expone el segundo en `active_operational_role`.

---

#### 17. Tratamiento de oficios base legacy

Los códigos:

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

no se convertirán automáticamente en:

```text
trabajador_operativo
```

Tampoco se convertirán automáticamente en rol operativo.

Reglas:

1. el rol base legacy no llena `active_operational_role`;
2. no crea turno;
3. no crea check-in;
4. no crea sede operativa;
5. no crea área operativa;
6. no crea permiso;
7. no produce bypass;
8. no se usa como fallback.

La incompatibilidad del carril base no bloqueará automáticamente un carril operativo válido para permisos `OPERATIONAL_ONLY`.

Por tanto:

```text
base_role legacy inválido
+
turno operativo canónico válido
=
carril base no listo
+
carril operativo potencialmente listo
```

La proyección `can_operate` reflejará exclusivamente readiness operativo.

No afirmará que el rol base legacy sea válido.

---

#### 18. Separación entre carriles

La fila legacy es operativa y no puede representar completamente el carril base.

Por tanto:

- no autoriza `BASE_ONLY`;
- no representa grants base;
- no representa cobertura administrativa;
- no resuelve excepciones base;
- no resuelve `BASE_AND_OPERATIONAL`;
- no decide `BASE_OR_OPERATIONAL`.

Los consumidores administrativos que hoy utilizan `can_operate` o bypass para entrar deberán migrar a:

```text
evaluate_authorization(
  app.access o permiso exacto,
  recurso exacto
)
```

No se intentará mantener acceso administrativo mediante un booleano operativo.

---

#### 19. Relación con `has_operational_permission`

`has_operational_permission` permanece legacy.

Durante transición:

```text
get_operational_context
→ readiness temporal
```

y:

```text
has_operational_permission
→ evaluación legacy temporal
```

No se permite interpretar ambos como modelo canónico.

Destino:

```text
has_operational_permission
→ adapter legacy
→ evaluate_authorization
```

La migración deberá garantizar:

1. permiso exacto;
2. `authorization_requirement`;
3. actor efectivo;
4. recurso real;
5. sede y área del recurso;
6. rol operativo del turno;
7. allows y denies;
8. decisión final.

El bypass actual de `has_operational_permission` deberá desaparecer.

---

#### 20. Relación con `get_effective_context_v1`

`get_operational_context` no deberá utilizar `get_effective_context_v1` como fuente.

`get_effective_context_v1` mezcla actualmente:

- contexto real;
- simulación;
- dispositivo compartido;
- rol administrativo;
- rol de navegación;
- `can_operate`.

Su destino es independiente:

```text
contexto real
→ AccessContext

simulación
→ SimulationContext

dispositivo
→ principal + actor session + DeviceContext
```

No se proyectará simulación como contexto real.

No se proyectará `navigation_role` como rol operativo.

---

#### 21. Role override de NEXO

La lógica local que:

- lee cookies de role override;
- traduce `cocinero`, `barista` o `cajero` a `area_kind`;
- busca un área;
- sustituye `active_operational_role`;
- sustituye `active_area_id`;

queda clasificada como legacy incompatible.

No se conservará dentro de la proyección.

Su destino será:

```text
ROLE OVERRIDE LEGACY
→ SimulationContext
→ evaluación hipotética separada
```

Nunca:

```text
cookie
→ modificar autoridad real
```

Los consumidores que dependan de ese comportamiento deberán registrarse y migrarse antes de retirar el helper.

---

#### 22. Dispositivos compartidos

En una credencial de dispositivo:

```text
principal
=
SHARED_DEVICE
```

El empleado se obtiene únicamente mediante una sesión de actor válida.

Reglas:

1. `p_employee_id` no puede elegir al actor;
2. `navigation_role` no puede elegir el rol operativo;
3. el dispositivo no tiene turno propio;
4. el dispositivo no tiene rol base;
5. el dispositivo no tiene rol operativo;
6. el actor humano conserva turno, rol, sede y área;
7. la política del dispositivo solo restringe.

Sin sesión de actor válida:

```text
employee_id = null
can_operate = false
blocked_reasons += device_actor_required
```

---

#### 23. Simulación

La función legacy de contexto real no aceptará simulación.

No proyectará:

- sujeto simulado;
- rol simulado;
- sede simulada;
- área simulada;
- turno simulado;
- permiso simulado.

La simulación utilizará exclusivamente:

```text
SimulationContext
+
evaluate_simulated_authorization
```

No utilizará la firma legacy para producir resultados hipotéticos.

---

#### 24. Mapping de razones legacy

El adapter podrá traducir razones canónicas a los códigos que los consumidores actuales reconocen.

| Condición canónica                          | Código legacy proyectado               |
| ------------------------------------------- | -------------------------------------- |
| Principal no autenticado                    | `unauthenticated`                      |
| No existe turno requerido                   | `out_of_shift`                         |
| Check-in requerido ausente                  | `checkin_required`                     |
| Sede solicitada no coincide con turno       | `shift_site_mismatch`                  |
| Sede de check-in no coincide                | `checkin_site_mismatch`                |
| Empleado suministrado no coincide con actor | `legacy_employee_argument_mismatch`    |
| Aplicación inválida                         | `app_not_allowed`                      |
| Actor de dispositivo ausente                | `device_actor_required`                |
| Turno ambiguo                               | `shift_ambiguous`                      |
| Rol operativo ausente                       | `operational_role_missing`             |
| Rol no permitido en sede                    | `operational_role_not_allowed_in_site` |
| Rol no permitido en área                    | `operational_role_not_allowed_in_area` |
| Área requerida ausente                      | `operational_area_required`            |
| Error estructural no representable          | `operational_context_invalid`          |

El mapping será:

- determinista;
- versionado;
- probado;
- seguro para UI;
- no reversible hacia evidencia interna;
- incapaz de crear un allow.

---

#### 25. Errores técnicos

Se distinguen:

```text
DENEGACIÓN O READINESS NEGATIVO
≠
FALLO DE INFRAESTRUCTURA
```

Comportamiento:

| Caso                                   | Resultado                                        |
| -------------------------------------- | ------------------------------------------------ |
| Contexto válido pero no listo          | Fila con `can_operate = false`.                  |
| Argumento incompatible                 | Fila fail closed con reason estable.             |
| Principal no autenticado               | Fila segura sin empleado.                        |
| Error SQL, timeout o contrato inválido | Error técnico; nunca fila positiva.              |
| Adapter no puede validar la respuesta  | Resultado técnico fallido; nunca fallback local. |

El SDK podrá convertir un fallo técnico en:

```text
LegacyOperationalContextError
```

pero no en:

```text
can_operate = true
```

---

#### 26. Compatibilidad de forma y de conducta

Se separan tres dimensiones:

```text
SHAPE_COMPATIBILITY
BEHAVIORAL_PARITY
AUTHORITY_PARITY
```

##### Shape compatibility

Debe conservar los nombres y tipos legacy mientras exista un consumidor registrado que lo requiera.

##### Behavioral parity

Se busca únicamente para comportamientos no inseguros.

##### Authority parity

No se promete.

No se conservarán:

- bypass por rol;
- sede enviada como autoridad;
- sede seleccionada como autoridad;
- rol base como rol operativo;
- role override real;
- simulación mezclada;
- permiso general por aplicación;
- allow ante error.

---

#### 27. Clasificación de diferencias

Cada diferencia entre legacy y canónico se clasificará como:

```text
EXPECTED_EQUAL
INTENTIONAL_CANONICAL_DENY
LEGACY_SECURITY_BUG
LEGACY_DATA_FALLBACK
CANONICAL_DEFECT
DATA_GAP
CONSUMER_DEFECT
CONTRACT_GAP
```

Reglas:

- `INTENTIONAL_CANONICAL_DENY` no bloquea la migración si la decisión aprobada exige endurecimiento;
- `LEGACY_SECURITY_BUG` no se restaura;
- `DATA_GAP` debe quedar vinculado a backfill o reconciliación;
- `CANONICAL_DEFECT` bloquea el cutover;
- `CONTRACT_GAP` exige decisión documental antes de implementar.

---

#### 28. Registro de consumidores

Cada consumidor deberá registrar:

```text
repository
path
symbol
surface_type
app_code
legacy_signature
arguments_supplied
fields_read
can_operate_usage
bypass_usage
blocked_reason_usage
role_override_usage
permission_followup
resource_resolution
migration_owner
migration_task
compatibility_mode
parity_status
test_evidence
last_seen_at
removal_gate
```

No se aceptará un consumidor anónimo.

La ausencia de registro impide declararlo compatible.

---

#### 29. Telemetría

Se medirán como mínimo:

- llamadas por consumidor;
- llamadas por aplicación;
- backend utilizado;
- latencia;
- errores técnicos;
- `can_operate` true/false;
- mismatch de empleado;
- mismatch de sede;
- presencia de bypass legacy;
- lecturas de campos deprecados;
- diferencias de paridad;
- última llamada observada;
- versión del adapter;
- versión del contrato canónico.

No se registrarán:

- documentos completos;
- evidencia sensible;
- tokens;
- payloads privados;
- listas completas de grants o denies.

---

#### 30. Freeze de nuevas dependencias

Desde la aprobación de AUTH-CTX-028 queda prohibido introducir:

```text
.rpc("get_operational_context"
```

fuera del adapter legacy aprobado.

También queda prohibido:

- crear un segundo wrapper local;
- copiar `OperationalContextRow`;
- añadir campos nuevos a la forma legacy;
- usar `can_operate` para mutaciones nuevas;
- crear nuevos bypasses;
- leer `selected_site_id` como autoridad;
- reconstruir role override real.

`SHELL-AUTH-004` deberá convertir esta regla en control automático.

---

#### 31. Fases de transición

##### Fase 0 — Inventario y freeze

Responsables:

- `SHELL-AUD-004`;
- `SHELL-AUTH-003`;
- `SHELL-AUTH-004`;
- `AUTH-UI-001` a `AUTH-UI-010`.

Salida:

- inventario completo;
- allowlist temporal;
- cero nuevos usos.

##### Fase 1 — Adapter legacy único

Responsables:

- `SHELL-AUTH-001`;
- `SHELL-AUTH-002`;
- `SHELL-CTX-001`.

Salida:

- export legacy único;
- app code fijo;
- validación de argumentos;
- telemetría;
- fail closed.

##### Fase 2 — Resolver canónico

Responsables:

- `AUTH-DB-033`;
- `SHELL-CTX-002` a `SHELL-CTX-005`;
- `AUTH-DB-027`.

Salida:

- `AccessContext@1.0.0` físico;
- fixtures;
- pruebas de resolución.

##### Fase 3 — Proyector canónico a legacy

Responsables:

- `SHELL-AUTH-002`;
- `AUTH-DB-020`;
- `AUTH-DB-026`;
- `AUTH-DB-027`.

Salida:

- backend `CANONICAL_PROJECTION`;
- mapping exacto;
- paridad observada;
- rollback disponible.

##### Fase 4 — Migración de permisos y recursos

Responsables:

- `AUTH-DB-034`;
- `AUTH-DB-006` a `AUTH-DB-010`;
- `AUTH-DB-021`;
- `SHELL-AUTH-005`;
- `AUTH-UI-040` a `AUTH-UI-051`.

Salida:

- acciones protegidas por decisión canónica;
- `can_operate` reducido a presentación legacy;
- consumidores migrados.

##### Fase 5 — Retiro

Responsables:

- `AUTH-DB-030`;
- `AUTH-DB-031`;
- `SHELL-AUTH-005`.

Salida:

- direct calls = 0;
- telemetría legacy = 0;
- función retirada;
- adapter retirado;
- paridad certificada.

---

#### 32. Rollback

El rollback podrá cambiar temporalmente:

```text
CANONICAL_PROJECTION
→ LEGACY_NATIVE
```

solo por consumidor registrado y mediante configuración server-side.

No podrá:

- combinar resultados;
- reactivar bypasses eliminados en código nuevo;
- restaurar role override como autoridad;
- permitir nuevos consumidores;
- extender indefinidamente el legacy;
- omitir auditoría.

Cada rollback deberá registrar:

```text
consumer
from_mode
to_mode
reason
incident_id
approved_by
started_at
expires_at
exit_criteria
```

Todo rollback tendrá expiración y plan de salida.

---

#### 33. Puertas de cutover a `CANONICAL_PROJECTION`

Un consumidor podrá cambiar cuando:

1. esté inventariado;
2. tenga propietario;
3. tenga `app_code` fijo;
4. no utilice `p_employee_id` para consultar terceros;
5. no utilice `p_site_id` como autoridad;
6. no dependa de bypass;
7. no dependa de role override real;
8. tenga mapping de campos documentado;
9. tenga pruebas positivas;
10. tenga pruebas negativas;
11. tenga prueba de actor cambiado;
12. tenga prueba de sede incompatible;
13. tenga prueba de turno ambiguo;
14. tenga prueba de check-in;
15. tenga prueba de dispositivo;
16. tenga prueba de error técnico;
17. tenga clasificación de diferencias;
18. tenga rollback probado;
19. tenga observabilidad activa;
20. tenga aprobación del paquete de migración.

---

#### 34. Puertas de retiro

`get_operational_context` solo podrá retirarse cuando se cumplan simultáneamente:

```text
consumidores registrados pendientes = 0
```

```text
búsqueda estática directa = 0
```

```text
telemetría de llamadas = 0 durante 30 días consecutivos
```

```text
uso de can_operate como autorización = 0
```

```text
uso de bypass_applied = 0
```

```text
uso de selected_site_id como autoridad = 0
```

```text
role override real = 0
```

```text
pruebas de paridad aprobadas
```

```text
rollback verificado
```

```text
AUTH-DB-031 aprobado
```

La mera existencia de `get_access_context` no autoriza retirar la función legacy.

---

#### 35. Pruebas contractuales mínimas

`AUTH-CTX-030` y `AUTH-DB-027` deberán incluir:

1. `p_employee_id = null` deriva el actor real;
2. `p_employee_id` igual al actor no cambia autoridad;
3. `p_employee_id` distinto produce fail closed;
4. una llamada no puede leer el contexto de otro empleado;
5. `p_site_id` no sustituye sede operativa;
6. site mismatch produce bloqueo;
7. sede seleccionada no crea sede activa;
8. sede primaria no crea sede activa;
9. rol base legacy no crea rol operativo;
10. `trabajador_operativo` no crea rol operativo;
11. un turno válido sí proyecta rol operativo;
12. turno ambiguo bloquea;
13. turno nocturno se resuelve canónicamente;
14. check-in histórico abierto no basta;
15. sesión de check-in activa se proyecta;
16. área proviene del turno y catálogos válidos;
17. `bypass_applied` siempre es false;
18. propietario sin turno no obtiene `can_operate` por nombre;
19. permiso base de propietario se evalúa fuera de la RPC legacy;
20. role override no modifica rol ni área real;
21. simulación no aparece en contexto real;
22. dispositivo sin actor no opera;
23. dispositivo con actor usa el empleado real;
24. `navigation_role` no se proyecta como rol operativo;
25. error técnico no produce allow;
26. `can_operate` no autoriza una acción;
27. `has_operational_permission` se compara contra decisión canónica;
28. las razones legacy se mapean de forma estable;
29. el backend no mezcla campos;
30. rollback cambia backend completo;
31. telemetría identifica consumidor y versión;
32. direct call fuera del adapter falla lint;
33. un rol base legacy inválido no bloquea indebidamente un carril operativo válido;
34. una denegación aplicable vence cualquier compatibilidad;
35. APP-REVIEW y recursos aislados permanecen excluidos.

---

#### 36. Seguridad SQL futura

La implementación deberá:

- derivar principal desde la sesión real;
- derivar actor efectivo desde fuentes canónicas;
- impedir suplantación mediante `p_employee_id`;
- validar `p_app_code`;
- usar `search_path` aprobado;
- aplicar política `SECURITY DEFINER`;
- mantener grants mínimos;
- registrar el consumidor;
- evitar exposición de evidencia interna;
- emitir fail closed.

La ubicación física final se decidirá mediante:

- `SUPA-ARC-005`;
- `SUPA-ARC-006`;
- `SUPA-ARC-013`;
- `SUPA-ARC-014`;
- `SUPA-ARC-015`.

---

#### 37. Responsabilidades exactas

| Brecha o responsabilidad                 | Tarea propietaria                          |
| ---------------------------------------- | ------------------------------------------ |
| Inventariar contexto operativo duplicado | `SHELL-AUD-004`                            |
| Crear frontera legacy única              | `SHELL-AUTH-001`                           |
| Implementar adapter y proyección         | `SHELL-AUTH-002`                           |
| Registrar consumidores y telemetría      | `SHELL-AUTH-003`                           |
| Bloquear nuevos usos                     | `SHELL-AUTH-004`                           |
| Migrar consumidores                      | `SHELL-AUTH-005`                           |
| Consolidar módulo de contexto            | `SHELL-CTX-001`                            |
| Resolver turno y check-in                | `SHELL-CTX-002`                            |
| Proyectar sede y área                    | `SHELL-CTX-003`                            |
| Resolver readiness                       | `SHELL-CTX-004`                            |
| Traducir razones seguras                 | `SHELL-CTX-005`                            |
| Resolver AccessContext físico            | `AUTH-DB-033`                              |
| Evaluar permisos y recursos              | `AUTH-DB-034`                              |
| Migrar objetos por dominio               | `AUTH-DB-020`                              |
| Adaptar RPC sensibles                    | `AUTH-DB-006` a `AUTH-DB-010`              |
| Alinear RLS y grants                     | `AUTH-DB-021`                              |
| Generar tipos                            | `AUTH-DB-026`                              |
| Harness y paridad                        | `AUTH-DB-027`                              |
| Baseline y drift                         | `AUTH-DB-028`                              |
| Respaldo y rollback                      | `AUTH-DB-029`                              |
| Retirar función y objetos legacy         | `AUTH-DB-030`                              |
| Certificar retiro                        | `AUTH-DB-031`                              |
| Inventariar superficies                  | `AUTH-UI-001` a `AUTH-UI-010`              |
| Migrar experiencia y bloqueos            | `AUTH-UI-040` a `AUTH-UI-051`              |
| Definir caché cross-request              | `AUTH-CTX-029`                             |
| Consolidar pruebas contractuales         | `AUTH-CTX-030`                             |
| Arquitectura de esquema y exposición     | `SUPA-ARC-005`, `006`, `013`, `014`, `015` |
| Plan de transición y rollback            | `SUPA-TRANS-001` a `SUPA-TRANS-015`        |

No queda ninguna brecha detectada en esta tarea sin responsable documental.

---

#### 38. Orden obligatorio

```text
AUTH-CTX-028 APROBADA
        ↓
AUTH-CTX-029
        ↓
AUTH-CTX-030
        ↓
SHELL-AUD-004
        ↓
SHELL-AUTH-001
+
SHELL-CTX-001
        ↓
SHELL-AUTH-002
+
SHELL-AUTH-003
+
SHELL-AUTH-004
        ↓
AUTH-DB-033
        ↓
SHELL-CTX-002 a SHELL-CTX-005
        ↓
AUTH-DB-034
        ↓
AUTH-DB-020
        ↓
AUTH-DB-006 a AUTH-DB-010
+
AUTH-DB-021
        ↓
SHELL-AUTH-005
        ↓
AUTH-DB-030
        ↓
AUTH-DB-031
```

`AUTH-DB-027`, `AUTH-DB-028` y `AUTH-DB-029` acompañan los paquetes físicos aplicables.

Este orden no autoriza implementación en la fase documental actual.

---

#### 39. Antipatrones prohibidos

```ts
await supabase.rpc("get_operational_context", {
  p_employee_id: anotherEmployeeId,
  p_site_id: selectedSiteId,
});
```

```ts
if (context.can_operate) {
  await mutateResource();
}
```

```ts
if (context.bypass_applied) {
  return true;
}
```

```ts
context.active_operational_role = cookieRole;
```

```ts
context.active_area_id = areaSelectedByFrontend;
```

```ts
const activeSite = requestedSite ?? selectedSite ?? employeeDefaultSite;
```

```ts
const canonical = convertLegacyRowToAccessContext(row);
```

```text
error legacy
→ fallback local
→ allow
```

```text
legacy allow
OR canonical allow
→ allow
```

---

#### 40. Consecuencias positivas

- Los consumidores actuales podrán migrarse sin un corte total.
- La firma heredada podrá mantenerse temporalmente.
- La autoridad pasará al contexto canónico.
- Se elimina suplantación por `p_employee_id`.
- La sede enviada deja de crear autoridad.
- Se elimina el bypass por nombre de rol.
- `trabajador_operativo` permanece separado del rol operativo.
- Los oficios legacy no se convierten silenciosamente.
- NEXO deja de modificar autoridad mediante cookies.
- El dispositivo compartido utiliza actor humano real.
- La simulación queda separada.
- Las diferencias de paridad quedan clasificadas.
- El legacy tendrá telemetría y fecha de retiro.
- El rollback no exige duplicar lógica por aplicación.

---

#### 41. Costos y consecuencias negativas

- Algunas pantallas administrativas perderán bypasses heredados.
- Algunos consumidores deberán dejar de usar `can_operate` como guard.
- Podrán aparecer denegaciones nuevas por datos incompletos.
- Se requerirá reconciliar empleados con roles base legacy.
- El mapping de razones deberá mantenerse temporalmente.
- Habrá una fase con dos backends disponibles, aunque nunca mezclados.
- La telemetría y el inventario serán obligatorios.
- El retiro no será inmediato.
- Las pruebas deberán cubrir diferencias intencionales y no solo igualdad.
- NEXO deberá reemplazar su role override real por simulación separada.

---

#### 42. Fuera del alcance

AUTH-CTX-028 no:

- modifica la función SQL;
- crea `get_access_context`;
- crea adapters;
- crea paquetes;
- cambia grants;
- cambia RLS;
- modifica aplicaciones;
- elimina bypasses físicamente;
- migra role override;
- cambia empleados;
- asigna `trabajador_operativo`;
- ejecuta backfills;
- crea caché;
- define TTL;
- crea pruebas físicas;
- retira objetos legacy;
- modifica Supabase.

Cada responsabilidad diferida tiene una tarea explícita.

---

#### 43. Invariantes

1. `get_operational_context` permanece legacy.
2. No se convierte en fuente normativa.
3. `AccessContext@1.0.0` permanece canónico.
4. La adaptación va de canónico a legacy.
5. Nunca se reconstruye contexto canónico desde la fila legacy.
6. La firma puede conservarse temporalmente.
7. `p_employee_id` no define actor.
8. `p_site_id` no define sede operativa.
9. `p_app_code` no concede permiso.
10. La sede seleccionada no autoriza.
11. La sede primaria no autoriza.
12. El rol base no llena el rol operativo.
13. `trabajador_operativo` no llena el rol operativo.
14. Los oficios legacy no llenan el rol operativo.
15. El rol operativo procede del turno.
16. El check-in procede de una sesión válida.
17. El dispositivo no tiene rol propio.
18. `navigation_role` no autoriza.
19. La simulación no se mezcla con contexto real.
20. `bypass_applied` siempre es false en proyección canónica.
21. `can_operate` no es una decisión de permiso.
22. Una mutación exige evaluación canónica.
23. No se mezclan backends.
24. No se elige el resultado más permisivo.
25. Los errores producen fail closed.
26. Todo consumidor queda registrado.
27. Todo uso legacy emite telemetría.
28. No se permiten nuevos direct calls.
29. El rollback es server-side y temporal.
30. El retiro exige cero uso comprobado.
31. La paridad no obliga a conservar bugs.
32. `AUTH-CTX-029` define la caché posterior.
33. `AUTH-CTX-030` define las pruebas contractuales completas.
34. No se implementa código ni migraciones en esta tarea.

---

#### 44. Criterios de aprobación

AUTH-CTX-028 podrá aprobarse cuando se acepte que:

1. `get_operational_context` es una fachada legacy temporal;
2. no es fuente canónica;
3. la proyección va de `AccessContext` hacia la forma legacy;
4. se define `LegacyOperationalContextProjection@1.0.0`;
5. existen modos `LEGACY_NATIVE`, `CANONICAL_PROJECTION` y `REMOVED`;
6. no se mezclan backends;
7. la firma física puede conservarse temporalmente;
8. `p_employee_id` solo verifica al actor;
9. un mismatch de empleado falla de forma cerrada;
10. `p_site_id` es un hint validado y no autoridad;
11. la sede seleccionada deja de ser fallback;
12. la sede predeterminada deja de ser fallback;
13. `p_app_code` queda fijado por adapter;
14. los 22 campos legacy tienen mapping definido;
15. `can_operate` significa readiness legacy y no permiso;
16. `bypass_applied` será siempre false;
17. `trabajador_operativo` no se proyecta como rol operativo;
18. los oficios base legacy no se convierten automáticamente;
19. un carril base legacy inválido no bloquea automáticamente un carril operativo válido;
20. el carril base no se representa mediante esta fila;
21. `has_operational_permission` deberá migrar a evaluación canónica;
22. `get_effective_context_v1` no será fuente del adapter;
23. role override real no se conserva;
24. dispositivos requieren actor session válida;
25. simulación permanece separada;
26. existe mapping seguro de razones;
27. errores técnicos se distinguen de denegaciones;
28. se separan forma, conducta y autoridad;
29. las diferencias se clasifican;
30. existe registro de consumidores;
31. existe telemetría;
32. se congelan nuevos usos;
33. se definen fases de transición;
34. se define rollback;
35. se definen puertas de cutover;
36. se definen puertas de retiro;
37. se definen pruebas mínimas;
38. cada brecha tiene tarea propietaria;
39. no se implementa código, migraciones ni cambios en Supabase.

---

#### 45. Cierre y continuidad

| Relación                  | Tarea          | Estado        |
| ------------------------- | -------------- | ------------- |
| Tarea anterior            | `AUTH-MOD-021` | ✅ APROBADA    |
| Tarea propuesta           | `AUTH-CTX-028` | ✅ APROBADA    |
| Tarea siguiente reservada | `AUTH-CTX-029` | ⬜ NO INICIADA |
| Tarea posterior           | `AUTH-CTX-030` | ⬜ NO INICIADA |

```text
AUTH-MOD-021 — APROBADA
        ↓
AUTH-CTX-028 — APROBADA
        ↓
AUTH-CTX-029 — NO INICIADA
        ↓
AUTH-CTX-030 — NO INICIADA
```

No se inicia `AUTH-CTX-029` hasta recibir aprobación explícita de `AUTH-CTX-028`.


### ✅ AUTH-CTX-029 — Definir estrategia de invalidación y caché

**Estado:** APROBADA  
**Bloque:** BLOQUE E — Contexto y decisión de autorización unificados  
**Subbloque:** Diseño de implementación y transición  
**Naturaleza:** definición documental de frescura, memoización, caché e invalidación  
**Implementación física:** no incluida  
**Contrato contextual vigente:** `AccessContext@1.0.0`  
**Contrato de decisión vigente:** `AuthorizationDecision@1.0.0`  
**Contrato de simulación vigente:** `SimulationContext@1.0.0`  
**Contrato legacy temporal:** `LegacyOperationalContextProjection@1.0.0`  
**Tarea anterior provisionalmente aprobada:** `AUTH-CTX-028 — Definir compatibilidad temporal con get_operational_context`  
**Tarea posterior reservada:** `AUTH-CTX-030 — Definir plan de pruebas contractuales del contexto y la decisión`  
**Restricción:** no implementar código, infraestructura, funciones, migraciones, triggers, colas, RLS, grants ni cambios en Supabase durante esta tarea  
**Continuidad del lote:** la materialización documental y actualización del remoto se consolidarán después de completar `AUTH-CTX-030`

---

#### 1. Objetivo

Definir una estrategia cerrada, segura y escalable para:

1. reutilizar un mismo `AccessContext` dentro de una solicitud;
2. evitar resoluciones duplicadas concurrentes;
3. permitir posteriormente una caché compartida entre solicitudes;
4. demostrar que una entrada almacenada sigue fresca antes de utilizarla;
5. invalidar de forma transaccional cambios de identidad, trabajo, autorización y dispositivo;
6. respetar límites temporales aunque no exista una escritura;
7. impedir que una entrada obsoleta produzca un `ALLOW`;
8. definir la relación entre caché de contexto y decisiones de autorización;
9. definir el tratamiento de proyecciones seguras de cliente;
10. definir el comportamiento de consumidores legacy;
11. definir el comportamiento offline;
12. definir fallos, rollback y observabilidad;
13. asignar cada responsabilidad física a una tarea concreta;
14. crear las tareas nuevas estrictamente necesarias.

La estrategia debe optimizar el costo de resolución sin degradar:

- seguridad;
- consistencia;
- trazabilidad;
- separación de actores;
- separación de carriles;
- exactitud temporal;
- aislamiento entre aplicaciones;
- aislamiento entre entornos;
- reevaluación por recurso.

---

#### 2. Problema que se resuelve

`AccessContext` consolida hechos procedentes de múltiples fuentes:

```text
sesión técnica
+
principal
+
actor efectivo
+
identidad de dominio
+
empleado
+
rol base
+
asignaciones
+
turno
+
check-in
+
rol operativo
+
sede y área operativas
+
dispositivo
+
catálogo
+
matrices
+
excepciones
+
denegaciones
```

Resolverlos repetidamente dentro de una misma solicitud produce:

- consultas duplicadas;
- riesgo de snapshots temporales diferentes;
- mayor latencia;
- mayor costo;
- resultados contradictorios dentro de una acción.

Reutilizarlos entre solicitudes sin una estrategia formal produce riesgos mayores:

- conservar autoridad después de un check-out;
- conservar un rol retirado;
- conservar una denegación antigua;
- conservar un actor anterior en un dispositivo compartido;
- conservar un turno después de su fin;
- reutilizar un contexto de otra aplicación;
- reutilizar una decisión sobre otro recurso;
- permitir una acción después de revocar una sesión;
- servir una entrada local desactualizada desde otra instancia;
- convertir una caché de frontend en fuente de autorización.

---

#### 3. Base normativa

Esta propuesta conserva sin reinterpretar:

- `ADR-AUTH-001`;
- `AUTH-MOD-001` a `AUTH-MOD-021`;
- `AUTH-CAT-001` a `AUTH-CAT-024`;
- `AUTH-RBAC-001` a `AUTH-RBAC-028`;
- `AUTH-CTX-001` a `AUTH-CTX-028`;
- `AccessContext@1.0.0`;
- `AuthorizationDecision@1.0.0`;
- `SimulationContext@1.0.0`;
- `LegacyOperationalContextProjection@1.0.0`;
- `vento.canonical-json@1.0.0`;
- `get_access_context(text) → jsonb`;
- `evaluate_authorization(...)`;
- el SDK compartido `@vento/os-context`;
- la resolución única por solicitud aprobada en `AUTH-CTX-027`;
- la denegación por defecto;
- la revalidación de mutaciones;
- la prohibición de usar decisiones como tokens;
- la prohibición de mezclar contexto real y simulación;
- la separación entre hechos contextuales y recursos.

Principios obligatorios:

```text
CACHÉ
≠ FUENTE DE VERDAD
```

```text
TTL
≠ GARANTÍA DE FRESCURA
```

```text
EVENTO DE INVALIDACIÓN
≠ ÚNICA BARRERA DE SEGURIDAD
```

```text
CACHE HIT
→ SOLO DESPUÉS DE VALIDAR FRESCURA
```

```text
CONTEXTO REUTILIZABLE
≠ DECISIÓN REUTILIZABLE PARA OTRO RECURSO
```

```text
ERROR DE CACHÉ
→ NO PRODUCE ALLOW
```

---

#### 4. Decisión principal

Se adopta una estrategia por capas:

```text
L0 — REQUEST-SCOPED MEMOIZATION
L1 — VALIDATED SHARED CONTEXT CACHE
L2 — SAFE CLIENT PROJECTION
```

Cada capa tiene una responsabilidad distinta.

##### L0

Obligatoria desde la primera implementación.

Reutiliza promesas y snapshots únicamente dentro de una solicitud de servidor.

##### L1

Opcional y deshabilitada por defecto hasta superar todas las puertas de activación.

Reutiliza `AccessContext` entre solicitudes únicamente después de validar un token de frescura autoritativo.

##### L2

Solo experiencia de presentación.

Nunca autoriza acciones ni sustituye una evaluación de servidor.

No se crea una caché transversal de `AuthorizationDecision` en la versión inicial.

---

#### 5. Modos operativos

Se definen cuatro modos internos:

```text
OFF
REQUEST_ONLY
SHADOW_SHARED
VALIDATED_SHARED
```

##### `OFF`

- no se reutiliza contexto;
- cada consumo resuelve de nuevo;
- se admite únicamente para diagnóstico o rollback extremo.

##### `REQUEST_ONLY`

- activa L0;
- no activa L1;
- es el modo inicial obligatorio de producción.

##### `SHADOW_SHARED`

- calcula claves;
- consulta o escribe L1;
- compara el candidato con una resolución fresca;
- nunca sirve el candidato como autoridad;
- permite medir paridad, latencia y cardinalidad.

##### `VALIDATED_SHARED`

- sirve una entrada L1 únicamente cuando el token de frescura coincide;
- respeta expiración dura y límites temporales;
- nunca sirve stale;
- requiere pruebas y observabilidad aprobadas.

La selección del modo será:

- server-side;
- por entorno;
- por aplicación;
- auditable;
- inaccesible al navegador;
- reversible sin cambiar consumidores.

---

#### 6. L0 — Memoización por solicitud

L0 es obligatoria.

Forma conceptual:

```text
REQUEST AUTHORIZATION SCOPE
        ↓
Map<ContextRequestKey, Promise<AccessContext>>
```

Reglas:

1. el valor almacenado será una promesa, no solo el resultado;
2. llamadas concurrentes con la misma clave comparten la resolución;
3. una excepción elimina la entrada fallida;
4. la entrada termina con la solicitud;
5. no sobrevive al proceso de render, acción, handler, job o RPC;
6. no se comparte entre usuarios;
7. no se implementa como singleton global;
8. no utiliza TTL;
9. no requiere evento de invalidación externo;
10. puede invalidarse explícitamente dentro de la misma solicitud mediante una barrera de escritura.

Propietario físico:

```text
SHELL-AUTH-003
```

---

#### 7. Clave L0

La clave mínima será:

```text
environment
organization_id
app_code
principal_type
principal_id
auth_session_id
actor_session_id
system_process_id
context_contract_version
resolver_version
```

No incluirá:

- permiso;
- recurso;
- ruta;
- botón;
- sede seleccionada;
- área seleccionada;
- role override;
- datos del frontend.

Para una credencial de dispositivo, `actor_session_id` es obligatorio cuando exista actor humano.

Cambiar el actor produce una clave distinta.

---

#### 8. Barrera de escritura dentro de la solicitud

Una solicitud puede:

1. resolver contexto;
2. ejecutar una mutación que cambia ese contexto;
3. necesitar una nueva evaluación.

Ejemplos:

- iniciar o cerrar check-in;
- cambiar actor de dispositivo;
- revocar una sesión;
- actualizar un turno;
- cambiar rol base;
- cambiar asignaciones;
- crear una denegación.

Se define el concepto:

```text
AUTHORIZATION WRITE BARRIER
```

Después de confirmar una escritura relevante:

```text
marcar subject/app como dirty
→ eliminar memoización L0 aplicable
→ obtener nuevo token
→ resolver nuevo contexto
→ producir nueva decisión
```

Queda prohibido utilizar el contexto memoizado anterior después de la barrera.

La barrera no espera a que finalice la solicitud.

---

#### 9. L1 — Caché compartida validada

L1 solo almacenará:

```text
AccessContext real
```

No almacenará como autoridad:

- `AuthorizationDecision`;
- `SimulationContext`;
- recurso resuelto;
- resultado de una mutación;
- contexto legacy nativo;
- payload de auditoría;
- grants completos;
- denies completos;
- secretos;
- credenciales.

L1 podrá utilizar:

- almacenamiento distribuido privado;
- almacenamiento administrado aprobado;
- una implementación equivalente con coherencia demostrable.

No podrá depender únicamente de:

- memoria del proceso;
- caché local de una instancia;
- CDN;
- Service Worker;
- navegador;
- `localStorage`;
- `sessionStorage`;
- SecureStore móvil;
- caché automática de páginas;
- caché automática de framework.

---

#### 10. Condición de seguridad de L1

Una entrada L1 solo será utilizable cuando:

```text
freshness_token_stored
=
freshness_token_current
```

Y:

```text
server_now
<
hard_expires_at
```

Y:

```text
server_now
<
next_temporal_boundary_at - safety_margin
```

cuando exista un límite temporal.

El TTL no sustituye la validación del token.

Los eventos no sustituyen la validación del token.

---

#### 11. Nuevo contrato interno `ContextFreshnessToken@1.0.0`

Se define el contrato lógico interno:

```ts
type ContextFreshnessToken = {
  contract_name: "ContextFreshnessToken";
  contract_version: "1.0.0";

  environment: string;
  organization_id: string;

  app_code: string;
  subject_key: string;

  session_generation: string;
  actor_generation: string;
  employee_generation: string;
  base_lane_generation: string;
  operational_lane_generation: string;
  device_generation: string;

  app_authorization_generation: string;
  global_authorization_generation: string;

  next_temporal_boundary_at: string | null;
  issued_at: string;

  token_fingerprint: string;
};
```

La sintaxis es documental.

No constituye todavía un tipo, tabla o función física.

---

#### 12. Semántica del token

##### `session_generation`

Cambia cuando cambia:

- sesión autenticada;
- revocación;
- expiración;
- rotación relevante;
- vínculo entre sesión y principal;
- cierre de sesión.

##### `actor_generation`

Cambia cuando cambia:

- actor efectivo;
- sesión de actor de dispositivo;
- delegación;
- atribución;
- identidad de dominio utilizada.

##### `employee_generation`

Cambia cuando cambia:

- existencia del empleado;
- estado activo o inactivo;
- vínculo de identidad;
- rol base;
- datos estructurales necesarios para autorización.

##### `base_lane_generation`

Cambia cuando cambia:

- rol base;
- asignaciones de sede;
- asignaciones de área;
- cobertura administrativa;
- excepciones base del actor;
- denegaciones base del actor.

##### `operational_lane_generation`

Cambia cuando cambia:

- turno;
- publicación;
- cancelación;
- revisión;
- check-in;
- check-out;
- sesión laboral;
- rol operativo;
- sede operativa;
- área operativa;
- compatibilidad del rol con sede o área.

##### `device_generation`

Cambia cuando cambia:

- estado del dispositivo;
- registro del dispositivo;
- allowlist de aplicaciones;
- restricciones;
- actor session;
- revocación;
- configuración que pueda limitar autoridad.

##### `app_authorization_generation`

Cambia cuando cambia para una aplicación:

- permiso;
- política;
- matriz;
- requisito;
- sensibilidad;
- restricción de dispositivo;
- mapping autorizado.

##### `global_authorization_generation`

Cambia cuando cambia:

- catálogo global;
- roles canónicos;
- matrices transversales;
- denegaciones globales;
- política organizacional;
- versión contractual activa.

---

#### 13. `subject_key`

`subject_key` identifica el conjunto de hechos que puede invalidar el contexto.

Forma conceptual:

```text
HUMAN_USER
→ auth_session + actor employee

SHARED_DEVICE
→ device + actor_session + actor employee

SYSTEM_SERVICE
→ service principal + process/delegation
```

No será:

- nombre;
- correo;
- documento;
- teléfono;
- rol;
- sede;
- dato enviado por cliente.

En logs y métricas se utilizará una representación opaca o HMAC.

---

#### 14. Generaciones transaccionales

Toda escritura que afecte una generación deberá:

```text
actualizar dato empresarial
+
incrementar generación aplicable
+
registrar evento outbox
=
UNA MISMA TRANSACCIÓN
```

Si no puede incrementar la generación:

```text
ROLLBACK DE LA ESCRITURA
```

No se permite:

```text
COMMIT DEL CAMBIO
+
INVALIDACIÓN BEST EFFORT POSTERIOR
```

como única garantía.

La generación constituye la barrera de corrección.

El evento constituye una optimización de expulsión anticipada.

---

#### 15. Nueva tarea física `AUTH-DB-035`

Se crea:

```text
AUTH-DB-035 — Implementar token transaccional de frescura e invalidación del contexto
```

Ubicación futura:

```text
docs/plan-canonico/modular/bloques/R_SUPABASE/02_R1_FUNDACION_FISICA_CANONICA.md
```

Posición:

```text
después de AUTH-DB-033
antes de AUTH-DB-034
```

Responsabilidades:

1. definir almacenamiento físico de generaciones;
2. definir granularidad por sujeto, aplicación y organización;
3. incrementar generaciones en la misma transacción;
4. implementar lectura autoritativa del token;
5. calcular `next_temporal_boundary_at`;
6. generar fingerprint determinista;
7. producir eventos outbox;
8. definir triggers o servicios de dominio aprobados;
9. impedir escrituras relevantes sin incremento;
10. definir backfill inicial;
11. definir reconciliación;
12. definir drift;
13. definir rollback;
14. proveer fixtures;
15. integrarse con `AUTH-DB-027`;
16. no exponer el token completo al cliente.

---

#### 16. Nueva tarea física `SHELL-CTX-006`

Se crea:

```text
SHELL-CTX-006 — Implementar caché compartida, single-flight y validación de frescura
```

Ubicación futura:

```text
docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/03_AUTORIZACION_Y_CONTEXTO_COMPARTIDOS.md
```

Posición:

```text
después de SHELL-CTX-005
```

Responsabilidades:

1. implementar modos `OFF`, `REQUEST_ONLY`, `SHADOW_SHARED` y `VALIDATED_SHARED`;
2. consumir `ContextFreshnessToken@1.0.0`;
3. construir claves aisladas;
4. validar token antes de servir;
5. validar límites temporales;
6. implementar single-flight;
7. impedir stale-while-revalidate de autoridad;
8. implementar bypass seguro;
9. implementar rollback a `REQUEST_ONLY`;
10. implementar métricas;
11. implementar purga por evento;
12. impedir almacenamiento en cliente o CDN;
13. validar integridad de entradas;
14. coordinar con `SHELL-AUTH-002` y `SHELL-AUTH-003`;
15. proveer adapters de prueba;
16. demostrar comportamiento multiinstancia.

---

#### 17. `CachedAccessContextRecord@1.0.0`

Se define el contrato interno:

```ts
type CachedAccessContextRecord = {
  contract_name: "CachedAccessContextRecord";
  contract_version: "1.0.0";

  cache_key_hash: string;

  context: AccessContext;
  context_fingerprint: string;
  freshness_token: ContextFreshnessToken;

  stored_at: string;
  hard_expires_at: string;
  next_temporal_boundary_at: string | null;

  storage_version: string;
  integrity_hash: string;
};
```

Reglas:

- no se expone al cliente;
- no contiene secretos adicionales;
- el contexto se valida contra su schema;
- el hash de integridad se valida antes de utilizarlo;
- una entrada corrupta se elimina;
- una entrada corrupta nunca produce allow.

---

#### 18. Clave L1

Forma conceptual:

```text
ac
:
environment
:
organization_id
:
app_code
:
principal_type
:
principal_id_or_device_id
:
auth_session_id
:
actor_session_id_or_none
:
system_process_id_or_none
:
context_contract_version
:
resolver_version
:
freshness_token_fingerprint
```

Reglas:

1. todas las dimensiones obligatorias deben estar presentes;
2. `null` se representa de forma inequívoca;
3. no se usan nombres humanos;
4. no se usa el rol como dimensión de identidad;
5. no se usa sede seleccionada;
6. no se usa ruta;
7. no se usa permiso;
8. no se usa recurso;
9. el entorno es obligatorio;
10. organización es obligatoria aunque inicialmente exista una sola;
11. las claves no se registran completas en logs;
12. los IDs pueden transformarse mediante HMAC para telemetría.

---

#### 19. TTL máximo de L1

Se fijan límites iniciales:

| Principal                               |      TTL duro máximo |
| --------------------------------------- | -------------------: |
| Sesión humana personal                  |          60 segundos |
| Servicio de sistema registrado          |          60 segundos |
| Dispositivo compartido con actor válido |          15 segundos |
| Actor no resuelto                       |               Sin L1 |
| Principal anónimo                       |               Sin L1 |
| Contexto estructuralmente inválido      |               Sin L1 |
| Contexto legacy nativo                  | Sin L1 independiente |
| Simulación                              |               Sin L1 |

El TTL real será:

```text
min(
  ttl_maximo_por_principal,
  expiración_de_sesión,
  next_temporal_boundary_at - 1 segundo
)
```

Cuando el resultado sea menor o igual a cero:

```text
NO ALMACENAR
```

---

#### 20. Margen temporal

Se adopta inicialmente:

```text
safety_margin = 1 segundo
```

Propósito:

- evitar servir una entrada exactamente en el borde;
- absorber pequeñas diferencias entre reloj del proceso y reloj autoritativo;
- no prolongar turnos, check-ins o actor sessions.

El instante autoritativo será del servidor o base de datos.

Nunca el reloj del cliente.

---

#### 21. Límites temporales que invalidan sin escritura

`next_temporal_boundary_at` será el mínimo aplicable entre:

- expiración de sesión;
- inicio del turno futuro que cambia el contexto;
- fin del turno vigente;
- expiración o cierre programado de check-in;
- expiración de actor session;
- expiración del dispositivo;
- expiración de delegación;
- inicio o fin de una excepción;
- inicio o fin de una denegación;
- inicio o fin de una asignación;
- cambio de versión programado;
- fin de una ventana operativa aprobada.

El paso del tiempo no requiere evento para invalidar.

La entrada deja de ser utilizable al alcanzar el límite.

---

#### 22. Algoritmo de lectura L1

```text
1. Construir subject y app.
2. Leer token T1 desde fuente autoritativa.
3. Construir clave con T1.
4. Buscar entrada.
5. Validar schema e integridad.
6. Validar TTL.
7. Validar límite temporal.
8. Comparar token almacenado con T1.
9. Si todo coincide → HIT.
10. Si no coincide → descartar y resolver.
```

No se permite omitir el paso 2.

No se permite validar el token desde la misma caché L1.

---

#### 23. Algoritmo de escritura L1

```text
1. Leer token T1.
2. Resolver AccessContext fresco.
3. Leer token T2.
4. Comparar T1 y T2.
5. Si coinciden:
   - calcular fingerprint;
   - calcular expiración;
   - almacenar.
6. Si no coinciden:
   - descartar resultado;
   - reintentar una vez.
7. Si vuelve a cambiar:
   - no almacenar;
   - producir error seguro o resolver sin caché según el caso.
```

Esto evita almacenar un contexto construido durante una carrera de cambios.

---

#### 24. Single-flight

En un miss concurrente:

```text
misma clave
→ una resolución propietaria
→ consumidores esperan la misma promesa
```

Reglas:

- el lock es corto;
- no contiene datos autoritativos;
- no sobrevive indefinidamente;
- una espera vencida no sirve stale;
- después de timeout se permite resolver directamente o fallar cerrado;
- no se elige una entrada anterior por comodidad;
- la resolución fallida libera el lock;
- se mide tiempo de espera y contención.

Single-flight no sustituye el token.

---

#### 25. Prohibición de stale-while-revalidate

Para contexto con capacidad de influir en autorización:

```text
STALE-WHILE-REVALIDATE = PROHIBIDO
```

No se sirve una entrada:

- expirada;
- con token diferente;
- después del límite temporal;
- con integridad inválida;
- de otro actor;
- de otra app;
- de otra sesión;
- de otro entorno.

Puede existir refresh preventivo de una entrada todavía válida.

No puede servirse una entrada ya inválida mientras se refresca.

---

#### 26. `cache_status`

Se conservan los valores aprobados:

```text
MISS
HIT
BYPASS
NOT_IMPLEMENTED
```

Semántica:

| Valor             | Significado                                                         |
| ----------------- | ------------------------------------------------------------------- |
| `MISS`            | Se resolvió un contexto nuevo porque no existía una entrada válida. |
| `HIT`             | Se sirvió una entrada cuyo token y límites fueron validados.        |
| `BYPASS`          | La política exigió resolver sin L1.                                 |
| `NOT_IMPLEMENTED` | La capa L1 todavía no existe en ese consumidor o entorno.           |

No se añade `STALE` al contrato `AccessContext@1.0.0`.

Una entrada stale se rechaza y se registra internamente como:

```text
STALE_REJECTED
```

---

#### 27. Inmutabilidad y `cache_status`

`AccessContext` conserva sus hechos empresariales inmutables.

Se distingue:

```text
SEMANTIC SNAPSHOT
≠ DELIVERY METADATA
```

Reglas:

1. un HIT conserva `context_id`;
2. un HIT conserva `resolved_at`;
3. un HIT conserva `context_fingerprint`;
4. un HIT conserva todos los hechos empresariales;
5. el adapter puede proyectar `cache_status = HIT`;
6. `cache_status` no participa en `context_fingerprint`;
7. telemetría de entrega no modifica la identidad semántica.

No se genera un nuevo `context_id` por cada lectura de la misma entrada.

---

#### 28. `context_id` y `context_fingerprint`

Se define:

```text
context_id
→ identifica una instancia de resolución
```

```text
context_fingerprint
→ identifica el contenido semántico del snapshot
```

El fingerprint excluirá:

- `cache_status`;
- tiempos de acceso a caché;
- nombre del nodo;
- métricas;
- información de delivery;
- correlation IDs externos;
- claves internas de almacenamiento.

Incluirá:

- versión contractual;
- resolver;
- versiones de fuentes;
- fingerprints de fuentes;
- principal;
- actor;
- identidad;
- estado laboral;
- carriles;
- dispositivo;
- problemas estructurales.

Dos resoluciones nuevas pueden tener:

```text
context_id distinto
+
context_fingerprint igual
```

cuando los hechos no cambiaron.

---

#### 29. Fingerprints de fuentes

`source_fingerprints` demuestra con qué snapshots se construyó el contexto.

No sustituye `ContextFreshnessToken`.

Diferencia:

```text
SOURCE FINGERPRINT
→ evidencia del snapshot utilizado
```

```text
FRESHNESS TOKEN
→ prueba de que las generaciones relevantes no cambiaron
```

Los fingerprints:

- se calculan mediante serialización determinista;
- no incluyen secretos;
- no revelan datos completos;
- se conservan para auditoría;
- pueden utilizarse en pruebas de paridad.

---

#### 30. Caché de catálogos y datasets versionados

Los artefactos inmutables identificados por:

```text
version
+
hash
```

pueden almacenarse por periodos largos.

Ejemplos:

- catálogo de permisos;
- matriz base;
- matriz operativa;
- esquemas;
- reason codes;
- contratos.

Reglas:

1. la clave incluye versión y hash;
2. el contenido de una versión publicada no cambia;
3. la expulsión puede ser política de almacenamiento;
4. el puntero a la versión activa sí requiere invalidación;
5. una nueva versión no sobrescribe la anterior;
6. una decisión histórica conserva la versión utilizada.

Esta caché no equivale a caché de actor.

---

#### 31. AuthorizationDecision — política inicial

Se prohíbe L1 para `AuthorizationDecision@1.0.0`.

Solo se permite memoización L0 dentro de la solicitud.

Clave exacta:

```text
context_fingerprint
+
app_code
+
permission_key
+
authorization_requirement
+
operation_kind
+
resource_type
+
resource_ids
+
resource_version
+
resource_fingerprint
+
requested_fields
+
request_source
```

Reglas:

- no se reutiliza entre solicitudes;
- no se reutiliza después de una espera relevante;
- no se reutiliza para otro recurso;
- no se reutiliza para otra versión;
- no se reutiliza para una mutación posterior;
- no se utiliza `decision_id` como token.

Una futura caché cross-request de decisiones requerirá:

```text
nueva tarea contractual explícita
+
nueva revisión de seguridad
```

---

#### 32. Revalidación antes de mutaciones

Toda mutación empresarial protegida deberá:

```text
resolver o validar contexto actual
+
resolver recurso actual
+
evaluar autorización actual
+
validar concurrencia
+
ejecutar
```

No podrá utilizar:

- una proyección de UI;
- una decisión tomada al renderizar;
- una decisión anterior guardada en memoria;
- un `decision_id`;
- `can_operate`;
- un botón visible;
- una entrada offline.

Cuando exista demora entre evaluación y escritura, el contrato del recurso deberá aplicar:

- versión;
- ETag;
- lock;
- condición;
- comparación optimista;
- mecanismo equivalente aprobado.

---

#### 33. Operaciones sensibles y bypass de L1

Las siguientes familias utilizarán inicialmente:

```text
cache_status = BYPASS
```

para el contexto de la solicitud que realiza el cambio:

- administración de roles;
- administración de permisos;
- administración de matrices;
- administración de denegaciones;
- revocación de sesiones;
- cambio de actor de dispositivo;
- activación o desactivación de dispositivo;
- activación o desactivación de empleado;
- publicación, cancelación o modificación crítica de turnos;
- corrección o cierre de check-in;
- cambios de identidad o delegación.

Después de la escritura se aplica la barrera de escritura.

La lista definitiva se vinculará a sensibilidad y contratos de permiso.

---

#### 34. SafeContextProjection — L2

La proyección segura de cliente puede almacenarse únicamente para experiencia.

Debe incluir como mínimo:

```text
projection_id
context_id
context_fingerprint
generated_at
refresh_at
expires_at
actor_marker
app_code
safe_fields
```

No incluye:

- grants completos;
- denies sensibles;
- fuente de denegaciones;
- token de frescura;
- secretos;
- decisiones internas;
- autoridad ejecutable.

---

#### 35. TTL de proyecciones cliente

Límites iniciales:

| Contexto                         |                  TTL visual máximo |
| -------------------------------- | ---------------------------------: |
| Sesión humana personal           |                        30 segundos |
| Dispositivo compartido con actor |                        10 segundos |
| Servicio de sistema              |                     No aplica a UI |
| Actor no resuelto                |                         5 segundos |
| Offline                          | Solo lectura marcada como obsoleta |

La proyección puede refrescarse antes.

No puede autorizar una acción aunque no haya expirado.

---

#### 36. Invalidación inmediata de L2

La proyección se elimina inmediatamente cuando ocurre:

- logout;
- cambio de usuario;
- cambio de actor en dispositivo;
- cierre de actor session;
- cambio de aplicación;
- revocación recibida;
- señal de empleado inactivo;
- cambio de turno;
- check-in o check-out;
- error de validación;
- incompatibilidad de versión;
- respuesta de servidor `context_stale`;
- recuperación desde offline;
- actualización del SDK que cambia schema.

No se conserva “el último rol” después de cambiar actor.

---

#### 37. Navegador, Next.js y cachés HTTP

Las fronteras autoritativas deberán usar una política equivalente a:

```text
private
no-store
```

cuando la respuesta contenga contexto o decisión.

Queda prohibido utilizar como autoridad:

- Full Route Cache;
- Data Cache genérica;
- CDN compartido;
- ISR;
- Service Worker;
- cache-first;
- stale-while-revalidate;
- `revalidatePath` como única invalidación de autorización;
- `revalidateTag` como única barrera de seguridad.

La memoización React o framework solo podrá utilizarse dentro del scope de solicitud aprobado.

---

#### 38. Aplicaciones móviles y offline

SecureStore o almacenamiento local podrá conservar:

- sesión técnica conforme a su contrato;
- configuración no autoritativa;
- última proyección segura para presentación.

No podrá conservar como autoridad:

- `AccessContext`;
- `AuthorizationDecision`;
- rol efectivo;
- sede operativa;
- permisos efectivos;
- `can_operate`;
- decisión de mutación.

En offline:

```text
proyección anterior
→ mostrar información permitida y marcada como posiblemente obsoleta
```

```text
acción protegida
→ encolar intención cuando el dominio lo permita
→ autenticar y autorizar de nuevo al ejecutar online
```

Una autorización obtenida antes de quedar offline no viaja con la cola como permiso.

---

#### 39. LegacyOperationalContextProjection

La proyección legacy:

- no tiene caché L1 independiente;
- hereda el `AccessContext` validado;
- no extiende su TTL;
- no modifica su token;
- no conserva bypass;
- no usa `can_operate` como autorización;
- no crea una segunda invalidación.

Regla:

```text
AccessContext válido
→ proyección legacy
```

No:

```text
fila legacy cacheada
→ autoridad
```

---

#### 40. SimulationContext

`SimulationContext@1.0.0` no utiliza L1.

Se permite L0 dentro de una solicitud de simulación exacta.

La clave incluye:

- actor real;
- sujeto simulado;
- versión de simulación;
- parámetros hipotéticos;
- app;
- permiso;
- recurso hipotético;
- expiración de sesión de simulación.

La simulación nunca llena la caché real.

La caché real nunca llena la simulación sin una nueva construcción explícita.

---

#### 41. Eventos de invalidación

Se define el catálogo lógico inicial:

```text
AUTH_SESSION_CHANGED
DOMAIN_IDENTITY_CHANGED
ACTOR_ASSIGNMENT_CHANGED
EMPLOYEE_STATUS_CHANGED
BASE_ROLE_CHANGED
ASSIGNED_SITE_CHANGED
ASSIGNED_AREA_CHANGED
ADMINISTRATIVE_COVERAGE_CHANGED
SHIFT_CHANGED
CHECKIN_SESSION_CHANGED
OPERATIONAL_ROLE_MAPPING_CHANGED
DEVICE_CHANGED
DEVICE_ACTOR_SESSION_CHANGED
SYSTEM_DELEGATION_CHANGED
APP_AUTHORIZATION_CHANGED
PERMISSION_CATALOG_CHANGED
BASE_GRANTS_CHANGED
OPERATIONAL_GRANTS_CHANGED
INDIVIDUAL_OVERRIDE_CHANGED
DENY_CHANGED
CONTRACT_VERSION_CHANGED
```

Los nombres físicos se definirán en arquitectura de eventos.

---

#### 42. Alcances de invalidación

Cada evento declara uno o varios alcances:

```text
SESSION
SUBJECT
DEVICE
APP
ORGANIZATION
GLOBAL
```

Ejemplos:

| Cambio                                   | Alcance                                                 |
| ---------------------------------------- | ------------------------------------------------------- |
| Revocar sesión                           | `SESSION`                                               |
| Inactivar empleado                       | `SUBJECT`                                               |
| Cambiar turno                            | `SUBJECT`                                               |
| Cambiar actor del dispositivo            | `DEVICE` + `SUBJECT`                                    |
| Cambiar matriz de NEXO                   | `APP`                                                   |
| Cambiar catálogo global                  | `GLOBAL`                                                |
| Crear deny individual                    | `SUBJECT` + `APP` cuando aplique                        |
| Cambiar rol operativo habilitado en sede | `APP` + sujetos afectados o generación global operativa |

No se realizará una purga global cuando exista un alcance menor seguro.

No se utilizará un alcance menor cuando pueda dejar entradas válidas incorrectamente.

---

#### 43. Matriz de causas de invalidación

##### Identidad y sesión

Invalidan:

- login nuevo;
- logout;
- revocación;
- expiración;
- cambio de claims relevantes;
- cambio de vínculo Auth-identidad;
- cambio de principal;
- cambio de delegación.

##### Empleado y carril base

Invalidan:

- alta o baja;
- activación o inactivación;
- cambio de rol base;
- cambio de sede asignada;
- cambio de área asignada;
- cambio de cobertura;
- cambio de excepción base;
- cambio de deny base.

##### Carril operativo

Invalidan:

- crear turno;
- modificar turno;
- publicar;
- republicar;
- cancelar;
- retirar;
- cambiar revisión;
- cambiar rol;
- cambiar sede;
- cambiar área;
- iniciar check-in;
- cerrar check-in;
- corregir check-in;
- invalidar check-in;
- cambiar mapping rol-sede-área.

##### Dispositivo

Invalidan:

- registrar;
- activar;
- desactivar;
- revocar;
- cambiar allowlist;
- cambiar restricciones;
- iniciar actor session;
- cambiar actor;
- terminar actor session;
- expirar actor session.

##### Autorización

Invalidan:

- publicar catálogo;
- activar o desactivar permiso;
- cambiar modalidad;
- cambiar prerrequisito;
- cambiar sensibilidad;
- cambiar política de dispositivo;
- cambiar grant;
- cambiar override;
- crear o retirar deny;
- cambiar versión activa.

---

#### 44. Cambios que no invalidan `AccessContext`

No invalidan por sí solos:

- cambio visual de ruta;
- expansión de menú;
- selección no autoritativa de sede;
- selección no autoritativa de área;
- ordenamiento de tabla;
- cambio de idioma;
- tema visual;
- apertura de modal;
- visibilidad de botón;
- cambio de un recurso empresarial ajeno al actor.

Un cambio de recurso puede exigir una nueva `AuthorizationDecision`.

No necesariamente un nuevo `AccessContext`.

---

#### 45. Recursos y decisiones

Cambios en:

- estado del recurso;
- propietario;
- custodio;
- sede del recurso;
- área del recurso;
- origen;
- destino;
- versión;
- campos solicitados;

no se resuelven mediante invalidación de contexto.

Se resuelven mediante:

```text
NUEVA RESOLUCIÓN DE RECURSO
+
NUEVA AUTHORIZATION DECISION
```

Esta separación evita invalidar todos los contextos por cada cambio empresarial.

---

#### 46. Outbox de invalidación

El evento de invalidación deberá registrarse en un outbox transaccional.

Campos lógicos mínimos:

```text
event_id
event_type
scope_type
scope_ids
app_code
organization_id
subject_key_hash
generation_before
generation_after
occurred_at
committed_at
source_transaction_id
producer
schema_version
delivery_status
```

El outbox:

- no contiene secretos;
- no contiene contexto completo;
- permite replay;
- permite reconciliación;
- permite medir lag;
- no es la única garantía de frescura.

---

#### 47. Realtime, NOTIFY y listeners

Realtime, `NOTIFY`, webhooks o buses podrán:

- expulsar entradas antes de la siguiente lectura;
- limpiar L2;
- despertar refresh;
- actualizar UI;
- reducir misses.

No podrán ser la única barrera.

Evento perdido:

```text
NO DEBE
→ permitir stale HIT
```

porque la validación del token sigue siendo obligatoria.

---

#### 48. Consistencia y origen de lectura

La lectura del token de frescura deberá utilizar una fuente con consistencia suficiente para observar el commit relevante.

No se utilizará una réplica con lag no acotado como prueba de frescura.

Regla:

```text
TOKEN STALE
→ CACHE VALIDATION INSEGURA
```

Si no puede garantizarse:

```text
BYPASS L1
→ RESOLVER DESDE FUENTE AUTORITATIVA
```

---

#### 49. Fallo del servicio de token

| Caso                                         | Comportamiento                                                 |
| -------------------------------------------- | -------------------------------------------------------------- |
| Token no disponible, resolver disponible     | Bypass L1 y resolver fresco.                                   |
| Token no disponible y resolver no disponible | Error seguro o `DENY`; nunca usar entrada antigua.             |
| Token inválido                               | Rechazar entrada y emitir error técnico.                       |
| Token cambia durante resolución              | Reintentar una vez.                                            |
| Token cambia dos veces                       | No almacenar; fail closed o resolución no cacheada controlada. |

La disponibilidad de caché nunca supera la seguridad.

---

#### 50. Fallo del almacenamiento L1

| Caso                  | Comportamiento                                |
| --------------------- | --------------------------------------------- |
| Lectura falla         | Resolver fresco.                              |
| Escritura falla       | Entregar el contexto fresco; registrar fallo. |
| Delete falla          | El token distinto impide usar la entrada.     |
| Entrada corrupta      | Eliminar o ignorar y resolver fresco.         |
| Deserialización falla | Ignorar y resolver fresco.                    |
| Timeout               | Bypass; no stale.                             |

La caché es una optimización degradable.

---

#### 51. Caché negativa

No se habilita L1 para contextos:

- anónimos;
- sin actor;
- inválidos;
- con empleado inactivo;
- con contradicción estructural;
- con error técnico.

Pueden memoizarse en L0 dentro de la misma solicitud.

Razón:

- evitar prolongar una denegación después de una corrección;
- evitar ocultar recuperación de actor o sesión;
- reducir riesgos de mezcla;
- simplificar la fase inicial.

Esta decisión podrá revisarse mediante una tarea futura específica.

---

#### 52. Aislamiento de entornos

Las claves, tokens, eventos y métricas separan:

```text
local
staging
preview
production
```

No se reutiliza:

- contexto de staging en producción;
- catálogo de preview en producción;
- generación de local en remoto;
- evento de un entorno en otro.

El entorno forma parte obligatoria de:

- cache key;
- token;
- namespace;
- métricas;
- eventos.

---

#### 53. Aislamiento organizacional

Aunque inicialmente exista una sola organización operativa, se incluye:

```text
organization_id
```

No se utiliza una caché global sin namespace organizacional.

Esto evita que la arquitectura futura dependa de una suposición monocliente invisible.

`organization_id = null` no significa todas las organizaciones.

---

#### 54. Seguridad del almacenamiento

L1 deberá:

- ser privado;
- exigir autenticación de servicio;
- usar cifrado en tránsito;
- usar cifrado en reposo cuando corresponda;
- restringir namespaces;
- impedir acceso desde cliente;
- impedir enumeración;
- limitar tamaño;
- validar schema;
- aplicar integridad;
- tener rotación de credenciales;
- auditar administración.

No se almacenan:

- JWT;
- refresh tokens;
- cookies;
- documentos;
- salarios;
- listas completas de denies;
- evidencia disciplinaria;
- secretos de dispositivo.

---

#### 55. Observabilidad

Métricas mínimas:

```text
context_cache_requests_total
context_cache_hit_total
context_cache_miss_total
context_cache_bypass_total
context_cache_not_implemented_total
context_cache_stale_rejected_total
context_cache_token_mismatch_total
context_cache_boundary_expired_total
context_cache_corrupt_total
context_cache_read_error_total
context_cache_write_error_total
context_cache_eviction_total
context_cache_invalidation_event_total
context_cache_invalidation_lag
context_cache_singleflight_wait
context_cache_resolution_retry_total
context_cache_generation_race_total
context_cache_entry_age
context_cache_cardinality
```

Dimensiones permitidas:

- entorno;
- aplicación;
- principal type;
- modo;
- resultado;
- versión;
- consumidor;
- error class.

No se incluyen IDs humanos directos.

---

#### 56. Logs

Un log de caché podrá incluir:

```text
correlation_id
app_code
cache_mode
cache_status
consumer
context_contract_version
resolver_version
token_prefix
context_fingerprint_prefix
entry_age_ms
decision
reason_class
```

No incluirá:

- contexto completo;
- nombres;
- correos;
- documentos;
- UUID crudos en logs generales;
- grants completos;
- denies sensibles;
- tokens técnicos.

---

#### 57. Auditoría

La auditoría empresarial no registra cada cache hit como evento de negocio.

Se separan:

```text
TELEMETRÍA OPERATIVA DE CACHÉ
≠
AUDITORÍA DE AUTORIZACIÓN
```

La decisión de autorización conservará:

- referencia al contexto;
- fingerprint;
- versiones;
- resultado;
- evidencia requerida.

La telemetría de caché permite demostrar:

- si fue HIT;
- si el token fue validado;
- edad de la entrada;
- versión del adapter.

---

#### 58. Despliegue gradual

Orden:

```text
1. REQUEST_ONLY
2. implementar AUTH-DB-035
3. implementar SHELL-CTX-006
4. SHADOW_SHARED
5. medir paridad
6. probar carreras e invalidación
7. habilitar VALIDATED_SHARED en staging
8. habilitar por aplicación
9. habilitar por principal type
10. conservar rollback
```

No se activa de forma global en producción como primer paso.

---

#### 59. Puertas para `SHADOW_SHARED`

Requiere:

1. token físico disponible;
2. generations inicializadas;
3. claves definidas;
4. schema de entrada definido;
5. almacenamiento privado;
6. métricas;
7. integridad;
8. pruebas básicas;
9. registro de consumidores;
10. feature flag server-side.

En shadow no se sirve L1.

---

#### 60. Puertas para `VALIDATED_SHARED`

Requiere simultáneamente:

1. `AUTH-DB-033` implementada;
2. `AUTH-DB-035` implementada;
3. `SHELL-CTX-006` implementada;
4. `SHELL-AUTH-003` implementada;
5. lectura autoritativa del token;
6. incremento transaccional probado;
7. límites temporales probados;
8. double-read probado;
9. single-flight probado;
10. multiinstancia probada;
11. evento perdido probado;
12. cache outage probado;
13. token outage probado;
14. corrupción probada;
15. actor switch probado;
16. logout probado;
17. check-out probado;
18. deny inmediato probado;
19. rollback probado;
20. shadow sin diferencias no explicadas;
21. observabilidad activa;
22. aprobación del paquete.

---

#### 61. Rollback

Rollback normal:

```text
VALIDATED_SHARED
→ REQUEST_ONLY
```

Se realiza por configuración server-side.

No requiere:

- borrar código;
- volver a RPC legacy;
- restaurar bypass;
- cambiar consumidores;
- servir stale.

Al desactivar L1:

- L0 continúa;
- el resolver canónico continúa;
- las decisiones continúan;
- la seguridad no cambia;
- solo aumenta el costo.

---

#### 62. Limpieza de entradas durante rollback

No es obligatorio eliminar todas las entradas antes de desactivar.

Pero:

- dejan de leerse;
- pueden expirar naturalmente;
- podrán purgarse por namespace;
- no se reutilizan al reactivar si la versión o generación cambió;
- la reactivación repite validaciones.

---

#### 63. Relación con AUTH-CTX-028

La compatibilidad legacy utiliza:

```text
AccessContext validado
→ LegacyOperationalContextProjection
```

Por tanto:

- `get_operational_context` no crea una caché paralela;
- `can_operate` no se almacena como autoridad;
- el role override no modifica una entrada;
- un cambio de actor invalida el contexto y la proyección;
- el TTL legacy no excede el TTL canónico;
- modo `LEGACY_NATIVE` permanece sin L1.

---

#### 64. Relación con AUTH-CTX-030

`AUTH-CTX-030` deberá incorporar todas las pruebas definidas aquí.

No podrá limitarse a:

- pruebas felices;
- comparación de payload;
- unit tests del Map L0.

Deberá cubrir:

- transacciones;
- carreras;
- tiempo;
- multiinstancia;
- dispositivos;
- eventos perdidos;
- fallos de infraestructura;
- rollback;
- pruebas negativas de stale allow.

---

#### 65. Relación con AUTH-DB-033

`AUTH-DB-033` implementa:

- resolver canónico;
- `AccessContext`;
- source versions;
- source fingerprints;
- límites temporales derivados;
- proyección segura del contexto.

No absorbe silenciosamente la infraestructura de generaciones.

La nueva responsabilidad transaccional queda en `AUTH-DB-035`.

---

#### 66. Relación con AUTH-DB-034

`AUTH-DB-034`:

- consume contexto validado;
- evalúa permiso y recurso;
- no depende de una decisión L1;
- no asume que un HIT autoriza;
- conserva referencia y fingerprint;
- reevalúa recursos.

La caché contextual no cambia la precedencia.

---

#### 67. Relación con AUTH-DB-032

`AUTH-DB-032` podrá persistir:

- decisión;
- referencia de contexto;
- fingerprint;
- versiones;
- `cache_status` observado;
- evidencia de validación cuando corresponda.

No persistirá la entrada L1 completa como sustituto del contexto histórico.

---

#### 68. Relación con SHELL-AUTH-002

`SHELL-AUTH-002`:

- produce adapters;
- fija app code;
- produce proyecciones;
- aplica headers seguros;
- elimina autoridad de cliente;
- integra L2.

No implementa por sí sola generaciones transaccionales.

---

#### 69. Relación con SHELL-AUTH-003

`SHELL-AUTH-003`:

- crea scope por solicitud;
- implementa L0;
- deduplica promesas;
- registra consumidor;
- propaga correlation;
- implementa write barrier en el scope.

No implementa L1 compartida.

---

#### 70. Relación con SHELL-CTX-006

`SHELL-CTX-006`:

- implementa L1;
- consume token;
- aplica TTL;
- aplica límites temporales;
- aplica single-flight cross-request;
- gestiona modos;
- registra métricas;
- procesa invalidaciones.

No decide permisos.

---

#### 71. Orden físico actualizado

```text
SHELL-AUD-002 a SHELL-AUD-005
        ↓
SHELL-PKG-001 a SHELL-PKG-008
        ↓
SHELL-CON-001 a SHELL-CON-008
        ↓
SHELL-AUTH-001
+
SHELL-CTX-001
        ↓
AUTH-DB-033
        ↓
AUTH-DB-035
        ↓
AUTH-DB-034
        ↓
AUTH-DB-032
        ↓
SHELL-CTX-002 a SHELL-CTX-006
        ↓
SHELL-AUTH-002
        ↓
SHELL-AUTH-003
        ↓
SHELL-AUTH-004
        ↓
AUTH-DB-020
        ↓
AUTH-DB-006 a AUTH-DB-010
+
AUTH-DB-021
        ↓
SHELL-AUTH-005
        ↓
AUTH-DB-030
        ↓
AUTH-DB-031
```

`AUTH-DB-027`, `AUTH-DB-028` y `AUTH-DB-029` acompañan los paquetes físicos aplicables.

---

#### 72. Materialización documental futura

Al consolidar el lote deberá actualizarse:

##### BLOQUE H

Archivo:

```text
docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/03_AUTORIZACION_Y_CONTEXTO_COMPARTIDOS.md
```

Agregar:

```md
### [ ] SHELL-CTX-006 — Implementar caché compartida, single-flight y validación de frescura
```

después de `SHELL-CTX-005`.

##### BLOQUE R1

Archivo:

```text
docs/plan-canonico/modular/bloques/R_SUPABASE/02_R1_FUNDACION_FISICA_CANONICA.md
```

Agregar:

```md
### [ ] AUTH-DB-035 — Implementar token transaccional de frescura e invalidación del contexto
```

después de `AUTH-DB-033` y antes de `AUTH-DB-034`.

##### Orden maestro

Archivo:

```text
docs/plan-canonico/modular/90_ORDEN_DE_IMPLEMENTACION.md
```

Actualizar las secuencias contractuales para incorporar ambas tareas.

##### Registro global y compilado

Regenerar mediante el build canónico al cerrar el lote.

No se realiza esta materialización durante la aprobación individual de AUTH-CTX-029.

---

#### 73. Pruebas mínimas que se transfieren a AUTH-CTX-030

1. dos resoluciones iguales dentro de una solicitud producen una sola consulta lógica;
2. llamadas concurrentes comparten promesa;
3. una promesa fallida se elimina;
4. write barrier elimina L0;
5. otra solicitud no recibe L0 anterior;
6. L1 deshabilitada no cambia semántica;
7. shadow no sirve entrada;
8. HIT exige token idéntico;
9. token distinto rechaza entrada;
10. TTL expirado rechaza entrada;
11. límite de turno rechaza entrada;
12. límite de check-in rechaza entrada;
13. límite de actor session rechaza entrada;
14. margen de un segundo se aplica;
15. actor diferente genera clave diferente;
16. app diferente genera clave diferente;
17. entorno diferente genera clave diferente;
18. organización diferente genera clave diferente;
19. session ID diferente genera clave diferente;
20. dispositivo diferente genera clave diferente;
21. una entrada corrupta no se utiliza;
22. error de cache read resuelve fresco;
23. error de cache write no rompe contexto fresco;
24. fallo de token hace bypass;
25. fallo de token y resolver produce error seguro;
26. evento perdido no permite stale hit;
27. generación cambia durante resolución y fuerza retry;
28. segunda carrera no almacena;
29. check-out incrementa generación;
30. deny individual incrementa generación;
31. cambio de rol base incrementa generación;
32. cambio de turno incrementa generación;
33. cambio de mapping rol-sede incrementa generación;
34. cambio de actor de dispositivo incrementa generaciones;
35. catálogo global cambia generación global;
36. matriz app cambia generación app;
37. recurso cambia y obliga nueva decisión, no necesariamente nuevo contexto;
38. decisión no se comparte entre solicitudes;
39. decisión no se reutiliza para otro recurso;
40. decisión no se reutiliza para otra versión;
41. L2 nunca autoriza mutación;
42. logout purga L2;
43. actor switch purga L2;
44. offline no ejecuta autorización almacenada;
45. legacy no tiene caché independiente;
46. simulación no llena caché real;
47. `cache_status` no cambia fingerprint;
48. HIT conserva `context_id`;
49. resolución nueva crea nuevo `context_id`;
50. rollback a `REQUEST_ONLY` funciona sin cambiar consumidores;
51. dos instancias observan la misma generación;
52. réplica con lag no se usa para validar;
53. CDN no almacena contexto;
54. Service Worker no almacena autoridad;
55. no aparecen IDs humanos crudos en métricas;
56. no aparecen secretos en entrada;
57. invalidación se confirma en la misma transacción;
58. fallo de incremento revierte escritura;
59. outbox admite replay;
60. stale-while-revalidate no puede activarse.

---

#### 74. Riesgos controlados

##### Riesgo 1 — Stale allow

Control:

```text
token autoritativo
+
límite temporal
+
sin stale-while-revalidate
```

##### Riesgo 2 — Evento perdido

Control:

```text
evento optimiza
token garantiza
```

##### Riesgo 3 — Carrera durante resolución

Control:

```text
T1
→ resolver
→ T2
→ comparar
```

##### Riesgo 4 — Mezcla de actores

Control:

```text
session + actor_session + subject
→ clave obligatoria
```

##### Riesgo 5 — Proceso local incoherente

Control:

```text
L1 compartida o validada
≠ Map global local
```

##### Riesgo 6 — Contexto usado como decisión

Control:

```text
context cache
≠ decision cache
```

##### Riesgo 7 — UI como seguridad

Control:

```text
L2 solo presentación
+
servidor reevalúa
```

##### Riesgo 8 — TTL demasiado largo

Control:

```text
TTL máximo
+
token
+
boundary
```

##### Riesgo 9 — Cambio temporal sin evento

Control:

```text
next_temporal_boundary_at
```

##### Riesgo 10 — Rollback inseguro

Control:

```text
VALIDATED_SHARED
→ REQUEST_ONLY
```

---

#### 75. Antipatrones prohibidos

```ts
const cache = new Map<string, AccessContext>();
```

como caché global autoritativa entre solicitudes.

```ts
if (cached && Date.now() - cached.at < 60_000) {
  return cached.context;
}
```

sin validar token.

```ts
return staleContext;
void refreshInBackground();
```

```ts
localStorage.setItem("access_context", JSON.stringify(context));
```

```ts
if (projection.canOperate) {
  await executeMutation();
}
```

```ts
await unstable_cache(resolveContext, [userId], { revalidate: 60 })();
```

sin namespace, token y límites temporales.

```ts
if (cacheError) return previousAllow;
```

```text
evento no llegó
→ conservar entrada
```

```text
decision_id
→ bearer token
```

```text
resource changed
→ reutilizar decisión anterior
```

---

#### 76. Fuera del alcance

AUTH-CTX-029 no:

- crea almacenamiento de caché;
- crea Redis o servicio equivalente;
- crea tablas;
- crea generaciones;
- crea triggers;
- crea outbox;
- crea listeners;
- crea feature flags;
- implementa single-flight;
- modifica `AccessContext@1.0.0`;
- modifica `AuthorizationDecision@1.0.0`;
- añade caché de decisiones cross-request;
- modifica aplicaciones;
- modifica Supabase;
- habilita producción;
- define todos los casos de prueba de `AUTH-CTX-030`;
- materializa hoy las dos tareas nuevas en el remoto.

---

#### 77. Invariantes

1. L0 es obligatoria.
2. L1 es opcional.
3. L1 inicia deshabilitada.
4. El modo inicial es `REQUEST_ONLY`.
5. L1 exige token autoritativo.
6. TTL no sustituye token.
7. Eventos no sustituyen token.
8. Una escritura relevante incrementa generación en la misma transacción.
9. Si falla el incremento, falla la escritura.
10. El tiempo puede invalidar sin evento.
11. Toda entrada respeta `next_temporal_boundary_at`.
12. Se aplica margen de un segundo.
13. No existe stale-while-revalidate de autoridad.
14. No existe L1 de decisiones en la versión inicial.
15. Decisiones se memoizan solo por solicitud y recurso exacto.
16. No se reutiliza una decisión para otra mutación.
17. L2 no autoriza.
18. Offline no autoriza con datos almacenados.
19. Legacy no tiene caché independiente.
20. Simulación no usa la caché real.
21. Contexto inválido no entra en L1.
22. Error técnico no entra en caché.
23. HIT conserva `context_id`.
24. `cache_status` no participa en fingerprint.
25. Cambiar actor cambia la clave.
26. Cambiar app cambia la clave.
27. Cambiar sesión cambia la clave.
28. Cambiar entorno cambia la clave.
29. Cambiar organización cambia la clave.
30. Cambiar generación invalida la clave.
31. El token se lee desde fuente consistente.
32. Una réplica con lag no prueba frescura.
33. Una entrada corrupta se rechaza.
34. Un fallo de caché degrada a resolución fresca.
35. Un fallo total produce error seguro.
36. Rollback vuelve a `REQUEST_ONLY`.
37. `AUTH-DB-035` implementa generaciones.
38. `SHELL-CTX-006` implementa L1.
39. `AUTH-CTX-030` consolida pruebas.
40. No se implementa código ni migraciones en esta tarea.

---

#### 78. Criterios de aprobación

AUTH-CTX-029 podrá aprobarse cuando se acepte que:

1. existen L0, L1 y L2;
2. L0 es obligatoria;
3. L1 es opcional;
4. L2 es solo presentación;
5. se definen cuatro modos;
6. `REQUEST_ONLY` es el modo inicial;
7. L0 utiliza promesas;
8. L0 termina con la solicitud;
9. existe write barrier;
10. se define `ContextFreshnessToken@1.0.0`;
11. el token contiene generaciones separadas;
12. las generaciones cambian transaccionalmente;
13. se crea `AUTH-DB-035`;
14. se crea `SHELL-CTX-006`;
15. se define `CachedAccessContextRecord@1.0.0`;
16. se define la clave L1;
17. se fijan TTL máximos;
18. se fija margen de un segundo;
19. se definen límites temporales;
20. se define algoritmo de lectura;
21. se define algoritmo de escritura;
22. se define double-read;
23. se define retry único;
24. se define single-flight;
25. se prohíbe stale-while-revalidate;
26. se conservan los cuatro valores de `cache_status`;
27. cache status no cambia fingerprint;
28. HIT conserva `context_id`;
29. context ID y fingerprint tienen funciones distintas;
30. source fingerprint no sustituye token;
31. snapshots versionados pueden cachearse por hash;
32. no hay L1 de decisiones;
33. la clave de decisión L0 es exacta;
34. mutaciones reevalúan;
35. operaciones sensibles hacen bypass inicial;
36. L2 tiene TTL visual;
37. L2 se purga por actor y sesión;
38. caches HTTP y framework no son autoridad;
39. offline no conserva autorización;
40. legacy no tiene caché paralela;
41. simulación no usa caché real;
42. existe catálogo de eventos;
43. existen alcances de invalidación;
44. existe matriz de causas;
45. cambios de recurso producen nueva decisión;
46. existe outbox transaccional;
47. Realtime es optimización;
48. la fuente del token requiere consistencia;
49. se define comportamiento ante fallos;
50. no existe caché negativa L1;
51. existe aislamiento por entorno;
52. existe aislamiento organizacional;
53. almacenamiento es privado;
54. existen métricas y logs seguros;
55. existe rollout gradual;
56. existen puertas de shadow;
57. existen puertas de producción;
58. existe rollback;
59. se define orden físico actualizado;
60. las tareas nuevas tienen ubicación exacta;
61. `AUTH-CTX-030` recibe las pruebas;
62. no se implementa código ni migraciones.

---

#### 79. Cierre y continuidad

| Relación                  | Tarea           | Estado        |
| ------------------------- | --------------- | ------------- |
| Tarea anterior del lote   | `AUTH-CTX-028`  | ✅ APROBADA    |
| Tarea propuesta           | `AUTH-CTX-029`  | ✅ APROBADA    |
| Tarea siguiente reservada | `AUTH-CTX-030`  | ⬜ NO INICIADA |
| Nueva tarea física        | `AUTH-DB-035`   | ⬜ NO INICIADA |
| Nueva tarea física        | `SHELL-CTX-006` | ⬜ NO INICIADA |

```text
AUTH-CTX-028 — APROBADA
        ↓
AUTH-CTX-029 — APROBADA
        ↓
AUTH-CTX-030 — NO INICIADA
```

Después de aprobar y completar `AUTH-CTX-030` se realizará una sola consolidación documental del lote:

```text
AUTH-MOD-021
+
AUTH-CTX-028
+
AUTH-CTX-029
+
AUTH-CTX-030
+
AUTH-DB-035
+
SHELL-CTX-006
```

No se inicia `AUTH-CTX-030` hasta recibir aprobación explícita de `AUTH-CTX-029`.


### ✅ AUTH-CTX-030 — Definir plan de pruebas contractuales del contexto y la decisión

**Estado:** APROBADA  
**Bloque:** BLOQUE E — Contexto y decisión de autorización unificados  
**Subbloque:** Diseño de implementación y transición  
**Naturaleza:** definición documental del plan maestro de verificación, validación y certificación  
**Implementación física:** no incluida  
**Contrato contextual:** `AccessContext@1.0.0`  
**Contrato de decisión:** `AuthorizationDecision@1.0.0`  
**Contrato de simulación:** `SimulationContext@1.0.0`  
**Contrato legacy temporal:** `LegacyOperationalContextProjection@1.0.0`  
**Contrato de frescura:** `ContextFreshnessToken@1.0.0`  
**Registro de caché:** `CachedAccessContextRecord@1.0.0`  
**Tarea anterior provisionalmente aprobada:** `AUTH-CTX-029 — Definir estrategia de invalidación y caché`  
**Cierre del subbloque:** esta tarea cierra documentalmente `AUTH-CTX-001` a `AUTH-CTX-030`  
**Restricción:** no implementar código, pruebas, infraestructura, migraciones, RLS, grants ni cambios en Supabase durante esta tarea  
**Continuidad del lote:** la materialización documental y actualización del remoto se realizarán una sola vez después de aprobar esta propuesta

---

#### 1. Objetivo

Definir un plan maestro de pruebas que permita demostrar, con evidencia reproducible, que el modelo canónico de identidad, contexto, autorización, simulación, compatibilidad, caché e invalidación:

1. resuelve correctamente principal y actor;
2. conserva la separación entre identidad, rol base y rol operativo;
3. resuelve turno, check-in, sede, área y dispositivo sin fallbacks permisivos;
4. evalúa permisos y recursos exactos;
5. aplica correctamente modalidad, alcance, prerrequisitos y precedencia;
6. deniega ante ausencia, contradicción, manipulación o error;
7. no mezcla contexto real y simulación;
8. mantiene compatibilidad temporal sin conservar autoridad legacy incorrecta;
9. invalida contextos obsoletos;
10. no reutiliza decisiones fuera de su solicitud y recurso;
11. mantiene equivalencia entre SQL, SDK, RPC, RLS y consumidores;
12. soporta concurrencia, rollback, migración y fallos parciales;
13. produce evidencia suficiente para auditoría y certificación;
14. impide que una regresión de seguridad llegue a producción.

---

#### 2. Alcance contractual

El plan cubre:

```text
AccessContext@1.0.0
AuthorizationDecision@1.0.0
SimulationContext@1.0.0
LegacyOperationalContextProjection@1.0.0
ContextFreshnessToken@1.0.0
CachedAccessContextRecord@1.0.0
```

También cubre:

- catálogo canónico de permisos;
- matrices base y operativas;
- overrides individuales;
- denegaciones;
- recursos;
- territorios;
- campos sensibles;
- dispositivos compartidos;
- actores de sistema;
- sesión laboral;
- turno;
- check-in;
- SDK compartido;
- adapters;
- RPC;
- RLS;
- caché;
- invalidación;
- migración;
- rollback;
- consumidores por aplicación.

---

#### 3. Base normativa

Esta propuesta conserva sin reinterpretar:

- `ADR-AUTH-001`;
- `AUTH-MOD-001` a `AUTH-MOD-021`;
- `AUTH-CAT-001` a `AUTH-CAT-024`;
- `AUTH-RBAC-001` a `AUTH-RBAC-028`;
- `AUTH-CTX-001` a `AUTH-CTX-029`;
- `AUTH-DB-027` — harness físico;
- `AUTH-DB-028` — baseline y drift;
- `AUTH-DB-029` — respaldo, restauración y rollback;
- `AUTH-DB-031` — certificación final;
- `AUTH-QA-001` a `AUTH-QA-030`;
- `UX-QA-001` a `UX-QA-030`;
- `SHELL-AUTH-001` a `SHELL-AUTH-005`;
- `SHELL-CTX-001` a `SHELL-CTX-006`;
- `AUTH-DB-032` a `AUTH-DB-035`.

Principios:

```text
PRUEBA POSITIVA
≠ PRUEBA DE SEGURIDAD SUFICIENTE
```

```text
ALLOW CORRECTO
+
DENY CORRECTO
=
CONTRATO VERIFICADO
```

```text
COBERTURA DE LÍNEAS
≠ COBERTURA DE DECISIONES
```

```text
SNAPSHOT GENERADO POR LA IMPLEMENTACIÓN
≠ ORÁCULO INDEPENDIENTE
```

```text
PRUEBA EN UI
≠ PROTECCIÓN DE SERVIDOR DEMOSTRADA
```

```text
PRUEBA VERDE
SIN EVIDENCIA REPRODUCIBLE
≠ CERTIFICACIÓN
```

---

#### 4. Decisión principal

Se adopta una estrategia de pruebas por capas:

```text
LAYER 0 — VALIDACIÓN ESTÁTICA Y CONTRACTUAL
LAYER 1 — PRUEBAS UNITARIAS PURAS
LAYER 2 — PRUEBAS GENERADAS Y BASADAS EN PROPIEDADES
LAYER 3 — INTEGRACIÓN SQL Y SDK
LAYER 4 — RPC, RLS Y FRONTERAS
LAYER 5 — CONTRATOS DE CONSUMIDOR
LAYER 6 — END-TO-END POR ACTOR Y APLICACIÓN
LAYER 7 — SEGURIDAD ADVERSARIAL
LAYER 8 — CONCURRENCIA, TIEMPO, CACHÉ E INVALIDACIÓN
LAYER 9 — MIGRACIÓN, PARIDAD Y ROLLBACK
LAYER 10 — RENDIMIENTO, RESILIENCIA Y OBSERVABILIDAD
LAYER 11 — REGRESIÓN Y CERTIFICACIÓN
```

Ninguna capa sustituye a otra.

---

#### 5. Contrato de evidencia

Se define el contrato lógico:

```text
AuthorizationTestEvidence@1.0.0
```

Forma conceptual:

```ts
type AuthorizationTestEvidence = {
  contract_name: "AuthorizationTestEvidence";
  contract_version: "1.0.0";

  evidence_id: string;
  suite_id: string;
  suite_version: string;
  run_id: string;

  repository: string;
  commit_sha: string;
  branch_or_tag: string;

  environment: string;
  database_baseline_id: string;
  migration_hashes: string[];

  contracts: Record<string, string>;
  package_versions: Record<string, string>;
  catalog_versions: Record<string, string>;
  dataset_hashes: Record<string, string>;

  fixture_set_id: string;
  fixture_seed: string;
  clock_profile: string;

  started_at: string;
  completed_at: string;

  totals: {
    planned: number;
    executed: number;
    passed: number;
    failed: number;
    skipped: number;
    quarantined: number;
  };

  coverage: Record<string, number>;
  mutation: Record<string, number>;
  performance: Record<string, number>;

  failures: TestFailureReference[];
  artifacts: TestArtifactReference[];

  rollback_tested: boolean;
  drift_status: string;
  approval_status: string;
};
```

La sintaxis es documental.

---

#### 6. Regla de evidencia

Toda ejecución usada como puerta deberá conservar:

- commit exacto;
- versiones exactas;
- migraciones exactas;
- hashes de datasets;
- fixtures;
- semilla;
- reloj;
- entorno;
- resultados;
- fallos;
- cobertura;
- mutación;
- rendimiento;
- drift;
- rollback;
- aprobación.

No se acepta evidencia como:

- captura aislada;
- mensaje verbal;
- “funcionó en mi máquina”;
- resultado sin commit;
- resultado sin dataset;
- prueba manual sin pasos;
- snapshot actualizado automáticamente;
- ejecución con tests omitidos.

---

#### 7. Identidad de suites

Convención:

```text
AUTH-CT-<DOMINIO>-<NÚMERO>
```

Dominios iniciales:

```text
CONTRACT
PRINCIPAL
ACTOR
IDENTITY
EMPLOYEE
BASE
ASSIGNMENT
SHIFT
CHECKIN
OPROLE
TERRITORY
DEVICE
STRUCTURE
DECISION
RESOURCE
SCOPE
LANE
DENY
FIELD
AUDIT
SIMULATION
LEGACY
CACHE
INVALIDATION
RPC
RLS
SDK
CONSUMER
E2E
SECURITY
CONCURRENCY
TIME
MIGRATION
ROLLBACK
PERFORMANCE
RESILIENCE
OBSERVABILITY
REGRESSION
```

Los IDs son estables.

No se reutilizan para otro caso.

---

#### 8. Catálogo de casos

Se deberá mantener un registro versionado con una fila por caso.

Campos mínimos:

```text
test_case_id
title
contract
invariant_ids
risk_class
layer
preconditions
fixture_ids
input
expected_context
expected_decision
expected_reason_codes
expected_audit
negative_variant_ids
owner_task
repository
automation_status
execution_frequency
evidence_required
retirement_condition
```

Una prueba sin `invariant_ids` no demuestra cobertura contractual.

---

#### 9. Clasificación de riesgo

Niveles:

```text
CRITICAL
HIGH
MEDIUM
LOW
```

##### `CRITICAL`

Incluye:

- suplantación de actor;
- bypass por rol;
- acceso entre sedes;
- acceso entre áreas;
- stale allow;
- denegación ignorada;
- permiso o recurso manipulado;
- service role como bypass;
- dispositivo sin actor;
- simulación como autoridad real;
- decisión reutilizada;
- RLS incompatible;
- RPC sin validación;
- cache poisoning.

##### `HIGH`

Incluye:

- scope incorrecto;
- turno o check-in incorrecto;
- campo sensible expuesto;
- auditoría incompleta;
- recurso ambiguo;
- fallback legacy;
- incompatibilidad entre apps.

No se permite omitir ni poner en cuarentena un caso `CRITICAL`.

---

#### 10. Estados de un caso

```text
DEFINED
AUTOMATED
MANUAL_CONTROLLED
BLOCKED
DEPRECATED
```

Reglas:

- `BLOCKED` exige tarea y causa;
- `MANUAL_CONTROLLED` solo se admite cuando automatizar no sea técnicamente razonable;
- todo caso `CRITICAL` debe quedar `AUTOMATED`;
- un caso no puede marcarse ejecutado si su fixture no es reproducible;
- un caso deprecado conserva historial.

---

#### 11. Frecuencias

```text
ON_CHANGE
ON_PULL_REQUEST
ON_MIGRATION
NIGHTLY
PRE_RELEASE
PRE_CUTOVER
POST_DEPLOY
PERIODIC_PRODUCTION
INCIDENT_REPRODUCTION
```

Asignación mínima:

| Tipo                     | Frecuencia                    |
| ------------------------ | ----------------------------- |
| Contratos y tipos        | `ON_PULL_REQUEST`             |
| Núcleo de decisión       | `ON_PULL_REQUEST`             |
| Matriz generada completa | `NIGHTLY` y `PRE_RELEASE`     |
| Migraciones, RLS y RPC   | `ON_MIGRATION`                |
| Concurrencia y caché     | `NIGHTLY`                     |
| Performance              | `NIGHTLY` y `PRE_RELEASE`     |
| Rollback                 | `PRE_CUTOVER`                 |
| Smoke productivo seguro  | `POST_DEPLOY`                 |
| Regresión completa       | `PRE_RELEASE` y `PRE_CUTOVER` |

---

#### 12. Entornos de prueba

##### Local efímero

Debe:

- reconstruirse desde cero;
- aplicar todas las migraciones;
- sembrar fixtures;
- ser desechable;
- no depender de producción.

##### CI efímero

Debe:

- ser reproducible;
- ejecutarse por commit;
- aislar ejecuciones paralelas;
- producir artefactos.

##### Staging

Debe:

- reflejar arquitectura objetivo;
- utilizar datos sintéticos o anonimizados;
- probar integraciones;
- probar rollback;
- probar multiinstancia.

##### Producción

Solo admite:

- smoke tests no destructivos;
- consultas de salud;
- verificación de versiones;
- comprobaciones de no exposición;
- telemetría;
- canary controlado.

No se ejecutan pruebas destructivas ni de suplantación sobre datos reales.

---

#### 13. Reloj determinista

Toda suite temporal deberá controlar el tiempo.

Perfiles mínimos:

```text
BOGOTA_NORMAL_DAY
BOGOTA_MIDNIGHT
UTC_DAY_BOUNDARY
SHIFT_START_MINUS_1MS
SHIFT_START
SHIFT_END_MINUS_1MS
SHIFT_END
OVERNIGHT_SHIFT
DST_NOT_APPLICABLE_BOGOTA
SESSION_EXPIRY
CHECKIN_EXPIRY
ACTOR_SESSION_EXPIRY
DENY_EFFECTIVE_FROM
DENY_EFFECTIVE_TO
CACHE_BOUNDARY
```

Reglas:

- el reloj del cliente no es oráculo;
- la base y el servidor deben compartir instante contractual;
- no se usan sleeps reales para probar vigencias;
- no se aceptan tests dependientes de la hora del CI.

---

#### 14. Fixtures canónicas

Los fixtures deberán representar:

- organización;
- unidades;
- sedes;
- áreas;
- tipos de área;
- empleados;
- identidades;
- sesiones;
- ocho roles base;
- todos los roles operativos del dataset vigente;
- oficios base legacy;
- turnos;
- check-ins;
- dispositivos;
- actor sessions;
- aplicaciones;
- permisos;
- matrices;
- overrides;
- denegaciones;
- recursos;
- territorios;
- campos sensibles;
- simulaciones;
- actores de sistema.

Los fixtures se generan desde contratos y datasets versionados.

No se duplican manualmente en cada aplicación.

---

#### 15. Semillas

Cada ejecución deberá registrar una semilla.

Reglas:

- un fallo generado debe poder reproducirse con la misma semilla;
- la semilla no se cambia para ocultar un fallo;
- CI conserva las semillas fallidas;
- nightly rota semillas;
- los casos críticos tienen además fixtures fijas.

---

#### 16. Aislamiento de pruebas

Cada caso deberá aislar:

- organización;
- actor;
- sesión;
- dispositivo;
- turno;
- recurso;
- caché;
- generaciones;
- eventos;
- auditoría.

No se permite que un caso dependa del orden de otro.

Las pruebas paralelas utilizarán namespaces o identificadores únicos.

---

#### 17. Oráculos

Se definen tres clases.

##### Oráculo contractual primario

Resultado esperado escrito desde la decisión canónica.

No se genera mediante la implementación probada.

##### Oráculo de propiedades

Invariantes que deben cumplirse para cualquier entrada válida.

##### Oráculo diferencial

Compara implementaciones:

- SQL;
- TypeScript;
- RPC;
- RLS;
- legacy;
- simulación.

El diferencial detecta divergencias, pero no decide cuál es correcto.

Cuando difieren, prevalece el oráculo contractual.

---

#### 18. Prohibición de autoaprobación de snapshots

Queda prohibido:

```text
test falla
→ actualizar snapshot
→ test verde
```

sin revisión contractual.

Toda actualización de golden file exige:

- diff;
- causa;
- tarea;
- versión;
- aprobación.

Los snapshots de seguridad no se actualizan automáticamente en CI.

---

#### 19. Layer 0 — Validación estática y contractual

Debe verificar:

1. schemas válidos;
2. JSON canónico;
3. campos obligatorios;
4. ausencia de campos desconocidos;
5. enum completos;
6. reason codes sin duplicados;
7. permisos sin duplicados;
8. códigos normalizados;
9. versiones válidas;
10. hashes reproducibles;
11. referencias existentes;
12. matriz sin permisos inexistentes;
13. matriz sin roles inexistentes;
14. modalidad coherente;
15. scope válido;
16. app code coherente;
17. datasets inmutables;
18. tipos generados sincronizados;
19. exports permitidos;
20. imports legacy bloqueados.

---

#### 20. Cobertura estática obligatoria

Se exige:

```text
100% de permisos del catálogo
100% de roles base
100% de roles operativos
100% de grants
100% de overrides
100% de denegaciones
100% de reason codes
100% de variantes contractuales
```

La cobertura es de registros contractuales, no solo de líneas.

---

#### 21. Layer 1 — Pruebas unitarias

Cubren funciones puras de:

- normalización;
- serialización;
- hashing;
- composición de carriles;
- precedencia;
- scope;
- requisitos;
- reason mapping;
- proyecciones seguras;
- claves de caché;
- fingerprints;
- validación de versión;
- clasificación de errores.

Todo branch de seguridad deberá tener prueba positiva y negativa.

---

#### 22. Umbrales de cobertura

Para núcleos críticos:

```text
statement coverage >= 95%
branch coverage >= 95%
function coverage = 100%
```

Además:

```text
uncovered critical security branch = 0
```

Para adapters:

```text
statement coverage >= 90%
branch coverage >= 90%
```

La cobertura no sustituye pruebas generadas, integración ni mutación.

---

#### 23. Layer 2 — Pruebas basadas en propiedades

Propiedades mínimas:

1. cambiar actor nunca conserva autoridad anterior;
2. reducir scope nunca aumenta acceso;
3. añadir una denegación nunca convierte `DENY` en `ALLOW`;
4. eliminar un grant nunca aumenta acceso;
5. un permiso desconocido siempre deniega;
6. un recurso no resoluble siempre deniega;
7. una sede ajena nunca amplía;
8. un área ajena nunca amplía;
9. un dispositivo solo restringe;
10. un contexto más inválido nunca aumenta acceso;
11. cambiar versión cambia fingerprint;
12. serializar y deserializar conserva semántica;
13. reordenar mapas canónicos no cambia hash;
14. reordenar listas semánticamente ordenadas sí se normaliza;
15. `null` nunca equivale a global;
16. lista vacía nunca equivale a todas;
17. un turno sin rol no produce rol operativo;
18. un check-in sin turno no produce permiso;
19. un rol base no produce rol operativo;
20. una simulación no modifica contexto real;
21. un token diferente invalida caché;
22. un límite temporal vencido invalida caché;
23. una decisión de un recurso no autoriza otro;
24. un decision ID no funciona como capacidad;
25. error de infraestructura nunca produce allow.

---

#### 24. Generación combinatoria

No se ejecutará el producto cartesiano completo de todas las dimensiones en cada PR.

Se utilizará:

```text
EXHAUSTIVO CONTRACTUAL
+
PAIRWISE GENERAL
+
COMBINACIÓN COMPLETA DE RIESGO CRÍTICO
```

##### Exhaustivo contractual

Todos los:

- permisos;
- grants;
- denies;
- roles;
- mappings;
- reason codes;
- modalidades.

##### Pairwise general

Cruces representativos entre:

- principal;
- actor;
- rol;
- turno;
- check-in;
- sede;
- área;
- dispositivo;
- permiso;
- recurso;
- modalidad.

##### Completo crítico

Producto completo para:

- actor × sesión;
- deny × grant;
- scope × territorio;
- turno × check-in;
- dispositivo × actor session;
- caché × invalidación;
- simulación × contexto real.

---

#### 25. Mutation testing

Se aplicará a:

- precedencia;
- composición de carriles;
- scope;
- actor binding;
- permiso exacto;
- recurso exacto;
- denegaciones;
- cache freshness;
- límites temporales;
- fail closed.

Umbral:

```text
mutation score >= 90%
```

En reglas críticas:

```text
surviving security mutant = 0
```

Un mutante superviviente crítico bloquea release.

---

#### 26. AccessContext — principal

Casos obligatorios:

1. humano autenticado válido;
2. humano no autenticado;
3. sesión expirada;
4. sesión revocada;
5. claims manipulados;
6. dispositivo válido;
7. dispositivo inactivo;
8. servicio registrado;
9. servicio no registrado;
10. anónimo;
11. principal desconocido;
12. service role sin proceso autorizado.

---

#### 27. AccessContext — actor efectivo

Casos:

1. sesión personal;
2. dispositivo con actor válido;
3. dispositivo sin actor;
4. actor session expirada;
5. cambio de actor;
6. delegación válida;
7. delegación expirada;
8. actor solicitado por cliente;
9. actor diferente al principal;
10. actor inexistente;
11. actor inactivo;
12. actor customer;
13. actor system;
14. actor unresolved.

---

#### 28. AccessContext — identidad de dominio

Casos:

- empleado;
- cliente;
- dispositivo;
- sistema;
- usuario con identidad dual;
- identidad inactiva;
- múltiples identidades aplicables;
- identidad incompatible con app;
- vínculo ausente;
- vínculo ambiguo.

Una identidad dual no mezcla permisos laborales y de cliente.

---

#### 29. AccessContext — empleado

Casos:

- empleado activo;
- inactivo;
- suspendido cuando el modelo lo incorpore;
- inexistente;
- vínculo duplicado;
- rol base válido;
- rol base ausente;
- rol base legacy;
- varias asignaciones de rol base;
- `trabajador_operativo`;
- empleado administrativo;
- empleado híbrido administrativo-operativo.

---

#### 30. AccessContext — rol base

Debe probar los ocho roles:

```text
propietario
gerente_general
gerente
supervisor
auxiliar_administrativa
contador
marketing
trabajador_operativo
```

Para cada rol:

- asignación válida;
- inactiva;
- fuera de vigencia;
- duplicada;
- desconocida;
- matriz exacta;
- ausencia de herencia;
- ausencia de bypass por nombre.

`trabajador_operativo` recibe únicamente las cinco concesiones aprobadas.

---

#### 31. AccessContext — asignaciones

Debe cubrir:

- ninguna sede;
- una sede;
- varias sedes;
- sede primaria válida;
- sede primaria ausente;
- sede primaria ambigua;
- área sin sede;
- área ajena;
- área inactiva;
- cobertura global explícita;
- cobertura por sede;
- cobertura por área;
- cobertura vacía;
- asignación fuera de vigencia.

---

#### 32. AccessContext — turno

Casos:

1. sin turno;
2. turno futuro;
3. turno vigente;
4. turno vencido;
5. turno cancelado;
6. turno no publicado;
7. turno nocturno;
8. dos turnos solapados;
9. dos turnos igualmente aplicables;
10. revisión retirada;
11. sede inexistente;
12. área inexistente;
13. rol ausente;
14. rol inválido;
15. rol no habilitado en sede;
16. rol no habilitado en área;
17. cambio exactamente en el límite temporal.

Ambigüedad produce problema estructural.

---

#### 33. AccessContext — check-in

Casos:

- sin check-in;
- check-in activo;
- check-out cerrado;
- check-in de otro actor;
- check-in de otra sede;
- check-in de otra área;
- check-in sin turno;
- check-in anterior a turno;
- check-in posterior a turno;
- dos sesiones activas;
- evento histórico abierto;
- sesión invalidada;
- sesión corregida;
- límite exacto de expiración.

Check-in nunca concede permisos por sí solo.

---

#### 34. AccessContext — rol operativo

El catálogo de pruebas se genera desde el dataset operativo vigente.

Para cada rol:

- turno válido;
- sede válida;
- área válida;
- área opcional;
- sede incompatible;
- área incompatible;
- rol inactivo;
- rol desconocido;
- mapping retirado;
- cambio durante turno.

No se codifica manualmente una lista paralela.

---

#### 35. AccessContext — territorio operativo

Casos:

- sede desde turno;
- área desde turno;
- conductor sin área productiva;
- área requerida ausente;
- área de otra sede;
- selected site ignorada;
- default site ignorada como autoridad;
- site enviada por cliente ignorada;
- recurso de otra sede;
- origen y destino diferentes;
- territorio aislado APP-REVIEW.

---

#### 36. AccessContext — dispositivo

Casos:

1. dispositivo registrado;
2. no registrado;
3. activo;
4. inactivo;
5. revocado;
6. app permitida;
7. app no permitida;
8. actor session válida;
9. sin actor;
10. actor cambiado;
11. actor session expirada;
12. navegación con role hint;
13. dispositivo manipulado;
14. restricciones acumuladas;
15. administrador autenticado en dispositivo restringido.

El dispositivo solo restringe.

---

#### 37. AccessContext — problemas estructurales

Cada reason code deberá probar:

- producción;
- severidad;
- carril afectado;
- bloqueo esperado;
- proyección segura;
- auditoría;
- ausencia de secretos.

Se exige cobertura del 100% del catálogo de razones.

---

#### 38. AuthorizationDecision — solicitud

Casos:

- app válida;
- app desconocida;
- permiso válido;
- permiso desconocido;
- app y permiso incompatibles;
- operation kind válido;
- operation kind incompatible;
- fields vacíos;
- fields sensibles;
- request source permitido;
- request source manipulado;
- colección;
- agregado;
- bulk;
- non-resource;
- recurso existente;
- draft.

---

#### 39. AuthorizationDecision — contrato del permiso

Para cada permiso del catálogo:

- estado activo;
- modalidad;
- prerrequisito;
- área;
- dispositivo;
- sensibilidad;
- simulación;
- recurso;
- dependencias.

Se prueba que:

```text
tabla de grant
≠ modalidad
```

y:

```text
prefijo
≠ permiso
```

---

#### 40. AuthorizationDecision — modalidades

Casos exhaustivos:

##### `BASE_ONLY`

- base allow;
- base deny;
- operacional allow ignorado;
- base unavailable;
- deny global.

##### `OPERATIONAL_ONLY`

- operacional allow;
- operacional deny;
- base allow ignorado;
- sin turno;
- sin check-in;
- área ausente.

##### `BASE_OR_OPERATIONAL`

- ambos allow;
- base allow;
- operacional allow;
- ambos deny;
- un carril inválido;
- deny transversal.

##### `BASE_AND_OPERATIONAL`

- ambos allow;
- solo base;
- solo operacional;
- uno unavailable;
- uno invalid;
- deny en cualquiera;
- deny transversal.

---

#### 41. AuthorizationDecision — allows

Debe probar:

- grant directo;
- componente base;
- grant operativo;
- override individual;
- alcance exacto;
- vigencia;
- estado activo;
- prioridad no implícita;
- ausencia de wildcards;
- ausencia de herencia.

Un allow no elimina un deny aplicable.

---

#### 42. AuthorizationDecision — denegaciones

Casos:

- global;
- actor-wide;
- base;
- operacional;
- aplicación;
- permiso;
- sede;
- área;
- dispositivo;
- recurso;
- campo;
- temporal;
- varias denegaciones;
- deny vencido;
- deny futuro;
- deny sin match.

Toda denegación aplicable debe vencer los allows correspondientes según la precedencia aprobada.

---

#### 43. AuthorizationDecision — scope

Debe cubrir todas las familias de alcance vigentes.

Para cada una:

- match exacto;
- match parcial inválido;
- territorio vacío;
- territorio múltiple;
- origen;
- destino;
- ambos lados;
- organización;
- sede;
- área;
- propio;
- asignado;
- APP-REVIEW;
- no territorial.

`null` nunca concede alcance.

---

#### 44. AuthorizationDecision — recursos

Casos por forma:

```text
EXISTING
DRAFT
COLLECTION
AGGREGATE
BULK
NON_RESOURCE
```

Estados:

```text
RESOLVED
MULTI_RESOLVED
NOT_APPLICABLE
UNRESOLVED
CONFLICT
ISOLATED
```

`UNRESOLVED`, `CONFLICT` e `ISOLATED` producen `DENY`.

---

#### 45. AuthorizationDecision — campos sensibles

Casos:

- campo público;
- campo interno;
- campo sensible;
- campo prohibido;
- masking;
- subset permitido;
- mezcla permitido/prohibido;
- exportación;
- payload manipulado;
- serialización cliente.

La UI no es la única barrera.

---

#### 46. AuthorizationDecision — concurrencia del recurso

Debe probar:

- versión coincidente;
- versión obsoleta;
- recurso cambiado después de render;
- recurso eliminado;
- custodia cambiada;
- sede cambiada;
- estado cambiado;
- doble ejecución;
- idempotencia;
- lock perdido.

Una decisión anterior no autoriza una mutación tardía.

---

#### 47. AuthorizationDecision — auditoría

Toda decisión deberá demostrar:

- actor;
- principal;
- aplicación;
- permiso;
- recurso;
- contexto;
- versiones;
- allows;
- denies;
- razones;
- resultado;
- timestamp;
- correlation;
- cache status cuando aplique.

La proyección cliente no expone evidencia sensible.

---

#### 48. SimulationContext

Casos:

1. actor real autorizado para simular;
2. actor no autorizado;
3. sujeto válido;
4. sujeto inexistente;
5. rol simulado válido;
6. rol inválido;
7. sede simulada;
8. área simulada;
9. recurso hipotético;
10. expiración;
11. finalización;
12. simulación concurrente;
13. would allow;
14. would deny;
15. indeterminate;
16. no modificación de contexto real;
17. no modificación de RLS;
18. no persistencia de mutación real;
19. auditoría separada;
20. cache real no contaminada.

---

#### 49. Compatibilidad legacy

Debe cubrir todas las decisiones de `AUTH-CTX-028`.

Casos mínimos:

- `p_employee_id = null`;
- employee igual al actor;
- employee diferente;
- site nula;
- site coincidente;
- site diferente;
- selected site ignorada;
- default site no autoritativa;
- app fija;
- app inválida;
- mapping de 22 campos;
- `bypass_applied = false`;
- `can_operate` no autoriza;
- `trabajador_operativo` no es rol operativo;
- oficio legacy no es rol operativo;
- role override no modifica autoridad;
- dispositivo requiere actor;
- simulación separada;
- backend no mezclado;
- rollback completo;
- paridad clasificada.

---

#### 50. Caché e invalidación

Son obligatorios los 60 casos definidos en `AUTH-CTX-029`.

Además deben probarse:

61. key collision deliberada;
62. namespace de entorno;
63. namespace organizacional;
64. integridad alterada;
65. schema incompatible;
66. versión vieja;
67. entrada de otra app;
68. entrada de otra sesión;
69. entrada de otro actor;
70. entrada de otro dispositivo;
71. token leído desde réplica con lag;
72. outbox duplicado;
73. outbox fuera de orden;
74. replay de evento;
75. purga fallida;
76. storage eviction;
77. single-flight timeout;
78. stampede después de invalidación;
79. refresh preventivo;
80. rollback con entradas existentes.

---

#### 51. RPC

Para cada RPC sensible:

- autenticación;
- actor;
- aplicación;
- permiso;
- recurso;
- sede;
- área;
- campos;
- error;
- auditoría;
- manipulación directa;
- llamada sin UI;
- service role;
- decisión actual.

`AUTH-DB-006` a `AUTH-DB-010` deben demostrar adopción.

---

#### 52. RLS

Para cada política:

- SELECT;
- INSERT;
- UPDATE USING;
- UPDATE WITH CHECK;
- DELETE;
- actor válido;
- actor ajeno;
- sede ajena;
- área ajena;
- recurso ajeno;
- campo restringido;
- service role;
- rol anon;
- authenticated;
- sesión revocada.

Se exige equivalencia semántica con RPC y evaluador.

---

#### 53. Prueba de equivalencia RPC-RLS

Para una misma fixture y acción:

```text
RPC decision
=
RLS outcome
=
AuthorizationDecision expected
```

Toda divergencia se clasifica:

- bug RPC;
- bug RLS;
- bug evaluador;
- gap contractual;
- fixture incorrecta.

No se acepta “RLS más permisiva”.

---

#### 54. SDK y contratos

`SHELL-AUTH` y `SHELL-CTX` deberán probar:

- exports;
- separación server/client/testing/legacy;
- schemas;
- tipos;
- versionado;
- app code fijo;
- request scope;
- adapters;
- proyecciones;
- errores;
- correlation;
- consumer registry;
- lint;
- caché;
- compatibilidad;
- ausencia de imports prohibidos.

---

#### 55. Consumer-driven contract testing

Cada consumidor registrado deberá publicar:

```text
consumer
app_code
surface_type
contract_versions
fields_consumed
permissions_requested
resource_shapes
expected_errors
legacy_dependencies
```

El proveedor deberá verificar que:

- los campos existen;
- los tipos coinciden;
- la versión es compatible;
- la proyección no expone más;
- la aplicación no depende de campos internos;
- la app no interpreta reason codes desconocidos como allow.

---

#### 56. Pruebas por superficie

Se cubren:

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

Para cada superficie:

- autenticación;
- contexto;
- decisión;
- error;
- refresh;
- acceso directo;
- manipulación;
- auditoría.

---

#### 57. Pruebas por aplicación

Deben ejecutarse sobre:

```text
SHELL
ANIMA
VISO
NEXO
FOGO
ORIGO
PULSO
NUMERA
AURA
PASS cuando corresponda
```

Cada aplicación debe probar:

- app access;
- navegación;
- URL directa;
- lectura;
- mutación;
- recurso ajeno;
- sede ajena;
- área ajena;
- actor cambiado;
- sesión expirada;
- dispositivo;
- error recuperable;
- contrato incompatible.

---

#### 58. PASS

PASS no recibe autoridad laboral por compartir paquetes.

Debe probar:

- identidad cliente separada;
- ausencia de employee authority;
- contratos generales compartidos;
- proyecciones propias;
- imposibilidad de invocar fronteras laborales internas;
- sesión cliente no convertida en empleado.

---

#### 59. Seguridad adversarial

Casos obligatorios:

- JWT manipulado;
- claim de rol;
- claim de sede;
- employee ID ajeno;
- site ID ajena;
- area ID ajena;
- permission key manipulada;
- app code manipulada;
- resource ID ajeno;
- field injection;
- mass assignment;
- parameter pollution;
- replay de decision ID;
- replay de proyección;
- cookie role override;
- localStorage;
- query string;
- body manipulado;
- URL directa;
- RPC directa;
- RLS directa;
- service role usado como bypass;
- cache poisoning;
- cache key collision;
- timing de enumeración;
- error forzado;
- respuesta parcial;
- stale entry;
- actor switch race;
- logout race.

Todos deben producir `DENY` o error seguro.

---

#### 60. Fuzzing

Se aplicará fuzzing a:

- JSON contractual;
- permission keys;
- app codes;
- IDs;
- resource requests;
- requested fields;
- reason codes;
- legacy projection;
- cache records;
- token serialization.

Objetivos:

- no crash;
- no allow inesperado;
- no exposición;
- error estable;
- límites de tamaño;
- resistencia a payloads malformados.

---

#### 61. Límites de tamaño

Debe probarse:

- contexto máximo permitido;
- listas de asignaciones;
- bulk request;
- campos solicitados;
- reason codes;
- evidence;
- payload cliente;
- cache record.

Un payload excesivo deberá:

- rechazarse;
- truncarse solo cuando el contrato lo permita;
- nunca omitir denegaciones;
- nunca convertirse en allow.

---

#### 62. Concurrencia

Escenarios:

- cambio de turno durante resolución;
- check-out durante evaluación;
- deny creado durante evaluación;
- actor cambiado durante request;
- dispositivo revocado;
- rol base cambiado;
- recurso transferido;
- dos mutaciones simultáneas;
- cache stampede;
- double-read;
- rollback concurrente.

El resultado debe ser determinista o fallar cerrado.

---

#### 63. Resiliencia

Fallos inyectados:

- base no disponible;
- timeout;
- caché no disponible;
- token no disponible;
- outbox retrasado;
- Realtime caído;
- paquete incompatible;
- schema inválido;
- error de serialización;
- error de auditoría;
- réplica retrasada;
- red intermitente;
- respuesta truncada.

No se acepta fallback permisivo.

---

#### 64. Performance

Se establecerá baseline en staging.

Puertas:

```text
p95 no empeora > 20% respecto al baseline aprobado
```

```text
L0 elimina resoluciones duplicadas dentro de la solicitud
```

```text
VALIDATED_SHARED demuestra mejora p95 >= 30% frente a REQUEST_ONLY
```

```text
query count por contexto permanece acotado
```

```text
query count no crece con cantidad de botones renderizados
```

La optimización no cambia resultados.

---

#### 65. Load testing

Perfiles:

- login masivo;
- inicio de turno;
- cambio de turno;
- check-in masivo;
- apertura simultánea de SHELL;
- POS compartido;
- invalidación global de catálogo;
- invalidación por app;
- cache cold start;
- despliegue multiinstancia.

Se medirán:

- latencia;
- errores;
- contención;
- saturación;
- hit ratio;
- stampede;
- lag de invalidación;
- conexiones;
- consultas.

---

#### 66. Auditoría y observabilidad

Debe verificarse:

- correlation end-to-end;
- actor correcto;
- principal correcto;
- contexto correcto;
- decisión correcta;
- cache status;
- versiones;
- no PII innecesaria;
- no secretos;
- reason mapping;
- timestamps;
- integridad;
- retención;
- consulta posterior.

---

#### 67. Migraciones

Cada paquete deberá probar:

1. base limpia;
2. baseline actual;
3. upgrade;
4. backfill;
5. reconciliación;
6. constraints;
7. RLS;
8. grants;
9. tipos;
10. consumidores;
11. downgrade lógico mediante rollback;
12. reejecución idempotente;
13. fallo a mitad;
14. recuperación;
15. drift.

---

#### 68. Compatibilidad de datos

Debe cubrir:

- roles base legacy;
- `trabajador_operativo`;
- oficios legacy;
- grants legacy;
- turnos sin rol;
- check-ins históricos;
- sedes seleccionadas;
- sedes predeterminadas;
- dispositivos legacy;
- simulaciones legacy;
- duplicados;
- huérfanos;
- valores desconocidos.

Ningún dato ambiguo se convierte automáticamente en autoridad.

---

#### 69. Rollback

Pruebas:

- rollback de aplicación;
- rollback de adapter;
- rollback de caché;
- rollback de migración;
- rollback de catálogo activo;
- rollback de consumer;
- rollback multiinstancia;
- datos escritos durante la ventana;
- auditoría conservada;
- entradas de caché antiguas;
- compatibilidad de versiones.

Rollback no restaura bypasses prohibidos.

---

#### 70. Drift

`AUTH-DB-028` deberá comparar:

- esquema;
- funciones;
- grants;
- RLS;
- tipos;
- versiones;
- hashes;
- triggers;
- índices;
- catálogos;
- matrices;
- tareas desplegadas.

Drift no aprobado bloquea certificación.

---

#### 71. Pruebas de documentación

Debe verificarse que:

- cada contrato publicado coincide con tipos;
- cada reason code está documentado;
- cada tarea tiene propietario;
- cada cambio de versión tiene changelog;
- cada deprecación tiene retiro;
- cada brecha tiene tarea;
- cada test case tiene evidencia;
- cada consumidor tiene estado.

---

#### 72. Pruebas funcionales AUTH-QA

Se refinan las tareas existentes.

| Tarea         | Responsabilidad                                        |
| ------------- | ------------------------------------------------------ |
| `AUTH-QA-001` | Base administrativa de propietario sin check-in.       |
| `AUTH-QA-002` | Base administrativa de gerente general sin check-in.   |
| `AUTH-QA-003` | Cobertura territorial de gerente.                      |
| `AUTH-QA-004` | Trabajador sin turno.                                  |
| `AUTH-QA-005` | Turno sin check-in.                                    |
| `AUTH-QA-006` | Turno y check-in válidos.                              |
| `AUTH-QA-007` | Restricción por sede.                                  |
| `AUTH-QA-008` | Restricción por área.                                  |
| `AUTH-QA-009` | Rotación por turno.                                    |
| `AUTH-QA-010` | Separación bodeguero-producción.                       |
| `AUTH-QA-011` | Separación producción-inventario global.               |
| `AUTH-QA-012` | PULSO operativo sin configuración.                     |
| `AUTH-QA-013` | Conductor sin área productiva.                         |
| `AUTH-QA-014` | Límites del conductor.                                 |
| `AUTH-QA-015` | Compras por alcance.                                   |
| `AUTH-QA-016` | Separación recepción-aprobación.                       |
| `AUTH-QA-017` | Dispositivo restringe administrador.                   |
| `AUTH-QA-018` | Actor humano real por PIN o mecanismo aprobado.        |
| `AUTH-QA-019` | Simulación sin herencia real.                          |
| `AUTH-QA-020` | URL directa.                                           |
| `AUTH-QA-021` | Formulario manipulado.                                 |
| `AUTH-QA-022` | RPC manipulada.                                        |
| `AUTH-QA-023` | Cruce de sede.                                         |
| `AUTH-QA-024` | Cruce de área.                                         |
| `AUTH-QA-025` | Check-out e invalidación.                              |
| `AUTH-QA-026` | Cola offline reautorizada.                             |
| `AUTH-QA-027` | Compatibilidad de paquetes.                            |
| `AUTH-QA-028` | Rollback por aplicación.                               |
| `AUTH-QA-029` | Auditoría completa.                                    |
| `AUTH-QA-030` | Orquestar regresión integral y emitir evidencia final. |

---

#### 73. AUTH-QA-030

`AUTH-QA-030` no será “ejecutar algunos tests”.

Deberá verificar:

```text
todos los casos CRITICAL = PASS
todos los casos HIGH obligatorios = PASS
failed = 0
skipped CRITICAL = 0
quarantined CRITICAL = 0
drift = NONE o APPROVED
rollback_tested = true
evidence complete = true
```

Además deberá consolidar resultados de:

- contratos;
- SQL;
- SDK;
- apps;
- RLS;
- RPC;
- caché;
- legacy;
- seguridad;
- migración;
- performance;
- UX.

---

#### 74. UX-QA

Las tareas `UX-QA-001` a `UX-QA-030` validan experiencia y proceso.

No sustituyen pruebas de autorización.

Deben demostrar:

- mensaje comprensible;
- bloqueo correcto;
- opciones irrelevantes ocultas;
- contexto visible correcto;
- no exposición de datos;
- recuperación;
- continuidad entre apps;
- operación real por usuario.

---

#### 75. Responsabilidades técnicas

| Responsabilidad                     | Tarea                               |
| ----------------------------------- | ----------------------------------- |
| Harness SQL, RLS, RPC y migraciones | `AUTH-DB-027`                       |
| Baseline y drift                    | `AUTH-DB-028`                       |
| Backup, restauración y rollback     | `AUTH-DB-029`                       |
| Resolver contextual                 | `AUTH-DB-033`                       |
| Token e invalidación                | `AUTH-DB-035`                       |
| Evaluador                           | `AUTH-DB-034`                       |
| Persistencia de decisiones          | `AUTH-DB-032`                       |
| Contratos compartidos               | `SHELL-CON-001` a `SHELL-CON-008`   |
| SDK y adapters                      | `SHELL-AUTH-001` a `SHELL-AUTH-005` |
| Contexto y caché                    | `SHELL-CTX-001` a `SHELL-CTX-006`   |
| Funcional y seguridad               | `AUTH-QA-001` a `AUTH-QA-030`       |
| Experiencia                         | `UX-QA-001` a `UX-QA-030`           |
| Certificación final                 | `AUTH-DB-031`                       |

---

#### 76. No se crean nuevas tareas

Esta propuesta no crea nuevos identificadores.

Razón:

- el harness ya tiene propietario;
- las pruebas funcionales ya tienen bloque;
- la regresión ya tiene tarea;
- la certificación ya tiene tarea;
- las pruebas del SDK pertenecen a sus tareas de implementación;
- las pruebas de caché pertenecen a `AUTH-DB-035` y `SHELL-CTX-006`.

La tarea refina responsabilidades; no duplica el roadmap.

---

#### 77. Puerta de pull request

Un PR relacionado con autorización no podrá fusionarse si falla:

- schema;
- tipos;
- lint legacy;
- pruebas unitarias;
- propiedades críticas;
- integración aplicable;
- migración aplicable;
- seguridad aplicable.

No se permite override sin aprobación registrada.

---

#### 78. Puerta de migración

Antes de aplicar una migración:

- R0 completo;
- base reconstruible;
- upgrade probado;
- rollback probado;
- pruebas negativas;
- drift limpio;
- backup;
- evidencia;
- propietario.

---

#### 79. Puerta de release

Requiere:

- contratos compatibles;
- packages compatibles;
- consumer contracts;
- regresión;
- seguridad;
- performance;
- rollback;
- release notes;
- evidencia.

---

#### 80. Puerta de cutover

Requiere:

1. consumidores inventariados;
2. legacy freeze;
3. resolver canónico;
4. evaluador canónico;
5. token;
6. SDK;
7. RLS y RPC equivalentes;
8. pruebas críticas;
9. shadow cuando aplique;
10. rollback;
11. telemetría;
12. aprobación.

---

#### 81. Puerta de retiro legacy

Requiere:

- direct calls = 0;
- telemetría legacy = 0;
- búsqueda estática = 0;
- paridad clasificada;
- regresión completa;
- rollback;
- 30 días sin uso cuando aplique;
- `AUTH-DB-031` aprobada.

---

#### 82. Producción y canary

Despliegue:

```text
staging
→ canary interno
→ porcentaje controlado
→ expansión por app
→ expansión total
```

Durante canary se vigila:

- deny rate;
- error rate;
- legacy calls;
- cache mismatch;
- actor mismatch;
- RLS deny;
- latency;
- rollback trigger.

---

#### 83. Criterios de rollback automático

Se define rollback automático o inmediato ante:

- allow no esperado confirmado;
- cruce de actor;
- cruce de sede;
- cruce de área;
- deny ignorado;
- RLS más permisiva;
- stale allow;
- audit actor mismatch;
- cache contamination;
- error crítico sostenido;
- incompatibilidad contractual.

Un aumento de denegaciones se investiga; no se convierte automáticamente en bypass.

---

#### 84. Flakiness

Regla:

```text
flaky CRITICAL test = release blocked
```

No se permite:

- retry infinito;
- ignorar fallo intermitente;
- cuarentena indefinida;
- marcar manualmente verde.

Todo flaky test requiere:

- causa;
- tarea;
- propietario;
- fecha;
- evidencia;
- límite de resolución.

---

#### 85. Skips

Un skip exige:

- razón;
- tarea;
- vencimiento;
- propietario.

No se permiten skips en:

- actor binding;
- deny precedence;
- scope;
- RLS;
- RPC;
- cache freshness;
- rollback crítico.

---

#### 86. Datos productivos

No se copiarán datos sensibles sin:

- anonimización;
- aprobación;
- minimización;
- retención;
- eliminación posterior.

Preferencia:

```text
fixtures sintéticas
>
snapshot anonimizado
>
datos reales
```

---

#### 87. Retención de evidencia

Se conservarán:

- evidencia de releases;
- migraciones;
- cutovers;
- rollbacks;
- incidentes;
- certificaciones.

La política exacta de retención se alineará con gobierno documental, pero una evidencia de seguridad no se eliminará antes de que expire la versión o el paquete que certifica.

---

#### 88. Reporte de fallos

Todo fallo deberá incluir:

```text
test_case_id
expected
actual
seed
fixture
clock
commit
environment
contract versions
dataset hashes
correlation_id
minimal reproduction
risk classification
owner
```

No se cierra un fallo crítico sin prueba de regresión.

---

#### 89. Incidentes

Un incidente de autorización deberá:

1. crear fixture;
2. crear test case estable;
3. reproducir;
4. corregir;
5. demostrar fallo previo;
6. demostrar pass posterior;
7. agregar regresión;
8. revisar casos similares;
9. revisar evidencia;
10. revisar necesidad de versión contractual.

---

#### 90. Métricas de calidad

Se medirán:

- casos por invariante;
- casos críticos;
- automatización;
- cobertura;
- mutación;
- flakiness;
- duración;
- skips;
- fallos;
- defectos escapados;
- divergencias RPC-RLS;
- divergencias legacy-canónico;
- regresiones por app;
- tiempo de rollback.

---

#### 91. Definition of Done por paquete

Un paquete de autorización no está completo hasta tener:

- contrato;
- implementación;
- pruebas;
- evidencia;
- observabilidad;
- rollback;
- documentación;
- consumer migration;
- no pendientes narrativos.

Código compilado sin estas condiciones no constituye cierre.

---

#### 92. Orden de implementación de pruebas

```text
AUTH-CTX-030 APROBADA
        ↓
R0: AUTH-DB-027 a AUTH-DB-029
        ↓
SHELL-CON-001 a SHELL-CON-008
        ↓
SHELL-AUTH-001 + SHELL-CTX-001
        ↓
AUTH-DB-033
        ↓
AUTH-DB-035
        ↓
AUTH-DB-034
        ↓
AUTH-DB-032
        ↓
SHELL-CTX-002 a SHELL-CTX-006
        ↓
SHELL-AUTH-002 a SHELL-AUTH-004
        ↓
AUTH-DB-020
        ↓
AUTH-DB-006 a AUTH-DB-010
+
AUTH-DB-021
        ↓
AUTH-QA-001 a AUTH-QA-029
+
UX-QA aplicables
        ↓
SHELL-AUTH-005
        ↓
AUTH-QA-030
        ↓
AUTH-DB-030
        ↓
AUTH-DB-031
```

`AUTH-DB-027` acompaña todos los paquetes físicos.

---

#### 93. Consolidación documental del lote

Después de aprobar AUTH-CTX-030 se realizará una única consolidación que incluirá:

```text
AUTH-CTX-028 — APROBADA
AUTH-CTX-029 — APROBADA
AUTH-CTX-030 — APROBADA
AUTH-DB-035 — NUEVA TAREA NO INICIADA
SHELL-CTX-006 — NUEVA TAREA NO INICIADA
```

También se actualizarán:

- continuidad;
- métricas;
- orden maestro;
- bloque H;
- bloque R1;
- registro global;
- compilado;
- referencias históricas necesarias.

No se harán pushes intermedios.

---

#### 94. Resultado de la consolidación

El total esperado aumentará en dos tareas:

```text
1350
→
1352 tareas canónicas
```

Las tareas aprobadas del remoto aumentarán provisionalmente de:

```text
120
→
123
```

porque se materializarán:

- `AUTH-CTX-028`;
- `AUTH-CTX-029`;
- `AUTH-CTX-030`.

Las tareas no iniciadas quedarán:

```text
1229
```

Cálculo:

```text
1230 pendientes actuales
- 3 aprobaciones materializadas
+ 2 tareas nuevas
=
1229 pendientes
```

El total `AUTH` aumentará:

```text
315
→
316
```

porque `AUTH-DB-035` es `AUTH` y `SHELL-CTX-006` no lo es.

---

#### 95. Fuera del alcance

AUTH-CTX-030 no:

- escribe pruebas;
- crea harness;
- crea fixtures físicas;
- modifica CI;
- modifica Supabase;
- ejecuta cargas;
- ejecuta fuzzing;
- activa canary;
- modifica apps;
- migra consumidores;
- certifica producción;
- aprueba `AUTH-QA-030`;
- aprueba `AUTH-DB-031`;
- actualiza hoy el remoto.

---

#### 96. Invariantes

1. Toda regla crítica tiene prueba negativa.
2. Todo permiso participa en validación contractual.
3. Todo rol participa en pruebas.
4. Todo grant participa en pruebas.
5. Toda denegación participa en pruebas.
6. Todo reason code participa en pruebas.
7. UI no sustituye servidor.
8. RPC no sustituye RLS.
9. RLS no puede ser más permisiva.
10. Error nunca produce allow.
11. Stale nunca produce allow.
12. Simulación nunca modifica realidad.
13. Legacy nunca define lo canónico.
14. Decision ID nunca es token.
15. Contexto no se reutiliza tras actor switch.
16. Decisión no se reutiliza para otro recurso.
17. Datos de cliente no definen hechos autoritativos.
18. Service role no concede autoridad empresarial.
19. Mutantes críticos supervivientes son cero.
20. Tests críticos flaky bloquean release.
21. Tests críticos no se omiten.
22. Golden files no se autoaprueban.
23. Evidencia incluye commit y versiones.
24. Migraciones prueban rollback.
25. Drift bloquea certificación.
26. Producción solo ejecuta smoke seguro.
27. Incidentes crean regresión.
28. AUTH-QA-030 orquesta el cierre.
29. AUTH-DB-031 certifica.
30. No se crean nuevas tareas en esta propuesta.

---

#### 97. Criterios de aprobación

AUTH-CTX-030 podrá aprobarse cuando se acepte que:

1. existe una estrategia de 12 capas;
2. se define `AuthorizationTestEvidence@1.0.0`;
3. toda evidencia es reproducible;
4. existe convención de IDs;
5. existe catálogo versionado de casos;
6. existe clasificación de riesgo;
7. casos críticos deben automatizarse;
8. existen frecuencias;
9. existen entornos;
10. existe reloj determinista;
11. existen fixtures y semillas;
12. existe aislamiento;
13. existen oráculos independientes;
14. snapshots no se autoaprueban;
15. existe validación estática;
16. cobertura contractual es 100%;
17. existen pruebas unitarias;
18. se fijan umbrales de cobertura;
19. existen propiedades;
20. existe estrategia combinatoria;
21. existe mutation testing;
22. se cubre principal;
23. se cubre actor;
24. se cubre identidad;
25. se cubre empleado;
26. se cubre rol base;
27. se cubren asignaciones;
28. se cubre turno;
29. se cubre check-in;
30. se cubre rol operativo;
31. se cubre territorio;
32. se cubre dispositivo;
33. se cubren problemas estructurales;
34. se cubre solicitud de decisión;
35. se cubre contrato del permiso;
36. se cubren modalidades;
37. se cubren allows;
38. se cubren denegaciones;
39. se cubre scope;
40. se cubren recursos;
41. se cubren campos;
42. se cubre concurrencia;
43. se cubre auditoría;
44. se cubre simulación;
45. se cubre legacy;
46. se cubren 80 casos de caché;
47. se cubren RPC;
48. se cubre RLS;
49. se exige equivalencia;
50. se cubre SDK;
51. existen consumer contracts;
52. se cubren superficies;
53. se cubren aplicaciones;
54. PASS permanece separado;
55. existe seguridad adversarial;
56. existe fuzzing;
57. existen límites de tamaño;
58. existe concurrencia;
59. existe resiliencia;
60. existe performance;
61. existe load testing;
62. existe observabilidad;
63. se cubren migraciones;
64. se cubren datos legacy;
65. existe rollback;
66. existe drift;
67. se prueba documentación;
68. se refinan AUTH-QA;
69. AUTH-QA-030 es puerta final;
70. UX-QA no sustituye seguridad;
71. no se crean tareas nuevas;
72. existen puertas de PR, migración, release, cutover y retiro;
73. existe canary;
74. existen criterios de rollback;
75. flakiness y skips críticos bloquean;
76. datos productivos se minimizan;
77. evidencia se retiene;
78. fallos son reproducibles;
79. incidentes crean regresión;
80. existe Definition of Done;
81. el orden de implementación queda definido;
82. el lote se consolida una sola vez;
83. los conteos esperados quedan definidos;
84. no se implementa código ni migraciones.

---

#### 98. Cierre del BLOQUE E contractual

Con la aprobación de AUTH-CTX-030 quedarán documentalmente definidos:

```text
AccessContext
AuthorizationDecision
SimulationContext
versionado
serialización
principal
actor
identidad
empleado
rol base
asignaciones
turno
check-in
rol operativo
territorio
dispositivo
problemas estructurales
aplicación
permiso
requisitos
recursos
precedencia
auditoría
contratos SQL
consumo centralizado
compatibilidad legacy
caché
invalidación
pruebas
```

El diseño contractual del BLOQUE E quedará cerrado.

La implementación física continuará en los bloques de auditoría, arquitectura, fundación, Supabase, aplicaciones y QA.

---

#### 99. Cierre y continuidad

| Relación                       | Tarea                          | Estado        |
| ------------------------------ | ------------------------------ | ------------- |
| Tarea anterior del lote        | `AUTH-CTX-029`                 | ✅ APROBADA    |
| Tarea propuesta                | `AUTH-CTX-030`                 | ✅ APROBADA    |
| Nueva tarea pendiente del lote | `AUTH-DB-035`                  | ⬜ NO INICIADA |
| Nueva tarea pendiente del lote | `SHELL-CTX-006`                | ⬜ NO INICIADA |
| Próxima acción tras aprobación | Consolidación documental única | ⬜ PENDIENTE   |

```text
AUTH-CTX-029 — APROBADA
        ↓
AUTH-CTX-030 — APROBADA
        ↓
CONSOLIDACIÓN DOCUMENTAL DEL LOTE
```

No se inicia otra tarea sustantiva hasta consolidar:

```text
AUTH-CTX-028
AUTH-CTX-029
AUTH-CTX-030
AUTH-DB-035
SHELL-CTX-006
```


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
