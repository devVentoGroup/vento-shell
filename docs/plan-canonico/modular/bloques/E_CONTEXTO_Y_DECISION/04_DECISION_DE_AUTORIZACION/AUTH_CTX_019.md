### 🟡 AUTH-CTX-019 — Incluir decisión del carril base

Estado: PROPUESTA PARA APROBACIÓN
Bloque: BLOQUE E — Contexto y decisión de autorización unificados
Subbloque: AUTHORIZATION DECISION
Naturaleza: Definición documental de base_decision dentro de AuthorizationDecision
Implementación física: No incluida
Tarea anterior vigente: AUTH-CTX-018 — APROBADA
Tarea posterior reservada: AUTH-CTX-020 — Incluir decisión del carril operativo
Contrato afectado: AuthorizationDecision@1.0.0
Campo principal afectado: base_decision
Tipo principal afectado: LaneDecision
Dataset base: vento.authorization.base-role-grants@1.0.0
Dataset de overrides: vento.authorization.individual-overrides@1.0.0
Catálogo: vento.authorization@1.0.0
Cambio contractual: Aclaración normativa compatible; no cambia la forma publicada
Cambios físicos permitidos: No

Esta tarea define cómo Vento OS evalúa el carril base de autorización a partirde:

actor efectivo;

identidad laboral;

estado del empleado;

rol base vigente;

cobertura administrativa;

aplicación y permiso exactos;

modalidad contractual;

recurso y territorio resueltos;

concesiones base de rol;

concesiones individuales base;

denegaciones transversales;

denegaciones del carril base;

alcance;

propiedad;

estado del recurso;

dispositivo compartido;

sensibilidad;

dependencias;

política de campos;

default deny.

La decisión principal es:

CARRIL BASE
=
AUTORIDAD ADMINISTRATIVA O FUNCIONAL PERMANENTE
DEL ACTOR LABORAL
SOBRE EL PERMISO EXACTO
Y EL RECURSO EXACTO

El carril base:

no depende de turno;

no depende de check-in;

no toma prestado el rol operativo;

no toma prestada la sede operativa;

no toma prestada el área operativa;

no obtiene bypass por nombre de rol;

no autoriza por jerarquía implícita;

no convierte cobertura en permiso;

no convierte un permiso en cobertura;

no convierte un dispositivo en fuente de autoridad.

No implementa SQL, RPC, RLS, funciones, migraciones, guards, middlewares,caché ni cambios físicos en Supabase.

1. Objetivo

Definir base_decision de manera que Vento OS pueda responderinequívocamente:

cuándo el carril base es aplicable;

cuándo debe ser NOT_APPLICABLE;

cuándo está estructuralmente listo;

cuándo debe denegar por indisponibilidad;

cuándo debe denegar por invalidez;

qué fuentes pueden producir un allow base;

qué fuentes pueden producir un deny base;

cómo se consulta la matriz base;

cómo se consumen overrides individuales;

cómo se compara un grant con el recurso;

cómo se evalúa alcance no territorial;

cómo se evalúa alcance organizacional;

cómo se evalúan sedes asignadas;

cómo se evalúa una sede específica;

cómo se evalúan tipos de sede;

cómo se evalúan áreas asignadas;

cómo se evalúa un área específica;

cómo se evalúan tipos de área;

cómo se evalúa OWN;

cómo se evalúan recursos multiterritoriales;

cómo se evalúan colecciones, agregados y lotes;

cómo se preserva la independencia frente al carril operativo;

cómo se aplican actor-wide denies y lane denies;

cómo se aplica default deny;

cómo se serializa LaneDecision;

cómo se ordenan los identificadores coincidentes;

cómo se evita duplicar evidencia;

cómo se evita que un componente base de BASE_AND_OPERATIONALautorice por sí solo;

cómo se relaciona con restricciones globales;

cómo se preservan determinismo, inmutabilidad y auditoría.

2. Base normativa

AUTH-CTX-019 conserva sin cambios las decisiones aprobadas en:

ADR-AUTH-001;

AUTH-MOD-001 — Actor efectivo;

AUTH-MOD-002 — Separación entre rol base y rol operativo;

AUTH-MOD-003 a AUTH-MOD-006 — Roles administrativos, funcionales ehíbridos;

AUTH-MOD-007 y AUTH-MOD-008 — Sede y área;

AUTH-MOD-013 a AUTH-MOD-017 — Alcances;

AUTH-MOD-018 — Combinación de carriles;

AUTH-MOD-019 — Denegación explícita;

AUTH-CAT-006 — Modalidad;

AUTH-CAT-011 — Alcance permitido;

AUTH-CAT-016 — Contrato de recurso;

AUTH-CAT-017 — Dependencias;

AUTH-RBAC-001 a AUTH-RBAC-008 — Matrices base;

AUTH-RBAC-020 — Concesiones individuales base;

AUTH-RBAC-022 — Denegaciones individuales y transversales;

AUTH-RBAC-024 — Dataset canónico de matriz base;

AUTH-RBAC-026 — Dataset canónico de overrides;

AUTH-RBAC-028 — Independencia de la administración frente al check-in;

AUTH-CTX-001 a AUTH-CTX-015 — AccessContext;

AUTH-CTX-016 — Aplicación y permiso solicitado;

AUTH-CTX-017 — authorization_requirement;

AUTH-CTX-018 — Recurso y territorio resueltos.

Principios obligatorios:

ROL BASE
≠
PERMISO

COBERTURA ADMINISTRATIVA
≠
ALLOW

PERMISO BASE
≠
BYPASS

SIN TURNO
≠
SIN ADMINISTRACIÓN

CHECK-IN ACTIVO
≠
GANAR ADMINISTRACIÓN

ROL OPERATIVO
≠
HEREDAR MATRIZ BASE

ALLOW BASE APLICABLE
=
PERMISO EXACTO
∩
ACTOR EXACTO
∩
ROL O EXCEPCIÓN COMPATIBLE
∩
VIGENCIA
∩
ALCANCE
∩
RECURSO
∩
AUSENCIA DE DENY APLICABLE

3. Forma contractual conservada

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

Para esta tarea:

base_decision: LaneDecision;

deberá cumplir siempre:

lane = BASE

No se agregan campos.

4. Aplicabilidad por modalidad

authorization_requirement

Carril base

BASE_ONLY

Aplicable

OPERATIONAL_ONLY

No aplicable

BASE_OR_OPERATIONAL

Aplicable

BASE_AND_OPERATIONAL

Aplicable y obligatorio

Regla:

OPERATIONAL_ONLY
→ base_decision.outcome = NOT_APPLICABLE

No se consulta la matriz base para intentar rescatar un permisoOPERATIONAL_ONLY.

5. Forma de NOT_APPLICABLE

Cuando la modalidad es OPERATIONAL_ONLY:

base_decision = {
  lane: "BASE",
  outcome: "NOT_APPLICABLE",
  readiness: "NOT_APPLICABLE",
  evaluated: false,
  matched_allow_ids: [],
  matched_deny_ids: [],
  reason_codes: ["BASE_LANE_NOT_REQUIRED"]
};

Reglas:

no significa DENY;

no significa error;

no significa ausencia de rol;

no consulta allows base;

no consulta lane denies base;

los actor-wide denies y structural denies continúan siendo evaluables anivel global en AUTH-CTX-022 y AUTH-CTX-023;

un grant base almacenado para un permiso OPERATIONAL_ONLY se clasificacomo incompatibilidad contractual, no como allow.

6. Cuándo evaluated = true

Para:

BASE_ONLY;

BASE_OR_OPERATIONAL;

BASE_AND_OPERATIONAL;

se utilizará:

evaluated = true

aunque el carril termine tempranamente en DENY por:

contexto inválido;

empleado inactivo;

rol base inválido;

cobertura inválida;

recurso no resoluble;

deny aplicable;

falta de allow.

evaluated = false se reserva para NOT_APPLICABLE.

7. readiness

Para modalidades que admiten base:

base_decision.readiness
=
AccessContext.lane_readiness.base.status

El evaluador no podrá:

convertir INVALID en READY;

convertir UNAVAILABLE en READY;

ocultar un código estructural;

recalcular parcialmente el contexto;

reemplazar el rol base;

completar cobertura.

Si el contexto quedó obsoleto:

readiness = INVALID
outcome = DENY

8. Relación entre readiness y outcome

Readiness

Outcome máximo posible

READY

ALLOW o DENY

UNAVAILABLE

DENY

INVALID

DENY

NOT_APPLICABLE

NOT_APPLICABLE

READY no concede autoridad.

Solo habilita la consulta y evaluación de fuentes base compatibles.

9. Actor laboral obligatorio

El carril base laboral requiere:

actor efectivo de tipo EMPLOYEE;

identidad laboral resoluble;

empleado exacto;

empleado activo;

coincidencia entre actor y empleado;

snapshot vigente.

Para actores:

CUSTOMER;

SYSTEM autónomo;

DEVICE sin actor humano;

UNRESOLVED;

el carril base será NOT_APPLICABLE o DENY según el contrato del actor yla modalidad.

No se inventará una identidad laboral para evaluar una matriz base.

10. Empleado inactivo

Un empleado inactivo conserva atribución histórica, pero no autoridad.

Resultado:

readiness = UNAVAILABLE
outcome = DENY
reason_codes incluye BASE_EMPLOYEE_INACTIVE

No se consultan grants como mecanismo de reactivación.

Una concesión individual activa no reactiva al empleado.

11. Rol base vigente

Para evaluar el carril base deberá existir:

base_role != null
base_role.role_status = ACTIVE

Reglas:

el rol debe pertenecer al actor;

debe existir en el catálogo canónico;

debe estar activo;

debe ser único;

no puede proceder del turno;

no puede proceder del dispositivo;

no puede proceder de navigation_role;

no puede proceder de una cadena enviada por cliente.

Un grant individual no repara:

rol ausente;

rol ambiguo;

rol inactivo;

rol legacy no mapeado;

actor incompatible.

12. Roles canónicos base

El dataset canónico base contiene exactamente siete roles:

propietario
gerente_general
gerente
supervisor
auxiliar_administrativa
contador
marketing

Los oficios base legacy no participan como fuente canónica del carril base.

Su transición deberá resolverse mediante:

AUTH-MOD-021;

AUTH-CTX-028;

AUTH-DB-020;

AUTH-DB-030.

Hasta entonces, un oficio legacy no se utilizará como bypass.

13. Sin bypass por rol

Queda prohibido:

propietario
→ ALLOW automático

gerente_general
→ ALLOW automático

gerente
→ todos los permisos de su sede

supervisor
→ todos los permisos operativos

Todo actor requiere:

permiso exacto
+
grant exacto
+
alcance compatible
+
recurso compatible
+
ausencia de deny

14. Fuentes de allow base

Solo pueden producir candidatos de allow base:

BASE_ROLE
INDIVIDUAL_BASE

Fuentes normativas:

vento.authorization.base-role-grants@1.0.0
vento.authorization.individual-overrides@1.0.0

No producen allows base:

matriz operativa;

rol operativo;

turno;

check-in;

sede operativa;

área operativa;

dispositivo;

navigation_role;

rutas;

menús;

frontend;

service role;

nombre del cargo.

15. Dataset base canónico

La matriz base vigente es:

vento.authorization.base-role-grants@1.0.0

Características aprobadas:

499 registros lógicos;

siete roles base;

463 concesiones directas;

36 componentes base;

cero permisos OPERATIONAL_ONLY;

cero claves legacy;

cero roles operativos;

orden determinista;

ausencia de fila = default deny.

El evaluador deberá consumir el snapshot exacto y su hash aprobado.

No podrá reconstruir la matriz desde tablas legacy.

16. Grants DIRECT

Un grant base directo puede producir ALLOW completo cuando:

el permiso admite base;

el rol coincide;

la clave coincide exactamente;

el grant está activo;

el scope coincide;

el recurso coincide;

la vigencia coincide;

no existe deny aplicable;

las restricciones globales no fallan.

17. Grants BASE_COMPONENT

Un registro BASE_COMPONENT pertenece a un permisoBASE_AND_OPERATIONAL y representa únicamente el componente base.

Regla:

BASE_COMPONENT
→ puede producir base_decision = ALLOW

pero:

BASE_COMPONENT
≠ final_decision = ALLOW

La decisión final exige además:

operational_decision = ALLOW

AUTH-CTX-023 aplicará la conjunción.

18. Overrides individuales base

Un override individual base podrá:

conceder una capacidad adicional compatible;

limitarla mediante alcance;

tener vigencia;

referenciar el empleado exacto.

No podrá:

reparar un actor inválido;

reparar un rol base inválido;

convertir un permiso OPERATIONAL_ONLY;

ampliar un permiso más allá de su contrato;

anular una denegación;

conceder por wildcard;

conceder por prefijo;

conceder a un dispositivo.

El seed canónico inicial contiene cero overrides automáticos.

19. Clave exacta

Todo candidato deberá cumplir:

grant.permission_key
=
requested.permission_key

No se admite:

prefijo;

sufijo;

wildcard;

módulo;

aplicación completa;

coincidencia semántica;

alias no adaptado;

permiso legacy;

ruta;

nombre humano.

20. Modalidad compatible

Un grant base solo es compatible con:

BASE_ONLY
BASE_OR_OPERATIONAL
BASE_AND_OPERATIONAL

Un grant base sobre permiso OPERATIONAL_ONLY:

no se incluye en matched_allow_ids;

no produce allow;

genera incompatibilidad contractual;

se audita;

se corrige en datasets o transición.

21. Vigencia

Un grant deberá estar activo en decided_at.

La vigencia puede depender de:

estado activo;

fecha de inicio;

fecha de fin;

revocación;

versión de dataset;

estado del rol;

estado del empleado.

Reglas:

starts_at <= decided_at

y cuando exista fin:

decided_at < ends_at

Un grant futuro, expirado o revocado no coincide.

22. Alcances permitidos

La evaluación base podrá consumir los códigos:

NT
ORG
G
AS
SS
AST
TST
AA
SA
AAT
ATW
OWN

CTX es incompatible con el carril base.

Un grant base con:

scope_code = CTX

produce incompatibilidad contractual.

23. NT — No territorial

NT coincide únicamente cuando el contrato del permiso y del recurso declaraque la capacidad no utiliza una dimensión territorial variable.

Reglas:

no inventa organización;

no inventa sede;

no inventa área;

no autoriza recursos territoriales;

no convierte listas vacías en global.

24. ORG — Recurso organizacional exacto

ORG coincide cuando:

el recurso pertenece a la organización exacta;

el permiso declara alcance organizacional;

el recurso no requiere una sede o área adicional;

no pertenece a entorno aislado;

la unidad de negocio, canal o dominio requerido coincide.

ORG no equivale a G.

No cubre automáticamente todos los recursos territoriales de la organización.

25. G — Global organizacional ordinario

G permite evaluar recursos ordinarios de la organización cuando el grant lodeclara expresamente.

Reglas:

solo aplica al permiso exacto;

no concede otros permisos;

no atraviesa organizaciones;

no atraviesa tenants futuros;

no incluye APP-REVIEW;

no incluye demo;

no incluye sandbox;

no incluye pruebas;

no incluye recursos aislados;

no omite sujeto, propiedad, estado, lados o campos;

no convierte propietario en bypass.

Un rol con administrative_coverage.mode = NONE puede utilizar un grant Gespecífico si el grant exacto lo concede y el recurso es compatible.

La cobertura del actor no se transforma por ello en ORGANIZATION.

26. AS — Sedes asignadas

AS exige que todos los territorios de sede obligatorios del recurso esténincluidos en las asignaciones utilizables del actor.

Fuente:

AccessContext.assigned_sites

Una sede utilizable exige:

asignación activa;

sede activa;

assignable = true.

Reglas:

la sede primaria no es suficiente por sí sola;

la sede seleccionada no participa;

varias sedes no significan global;

un recurso multisitio exige coincidencia en todos los lados obligatorios;

una lista vacía no coincide.

27. SS — Sede específica

SS exige coincidencia exacta entre:

grant.site_id

y la sede o lado del recurso exigido por el contrato.

Reglas:

no utiliza la sede seleccionada;

no utiliza la sede del turno;

no utiliza la sede primaria como fallback;

la sede debe existir y estar activa;

la coincidencia con un lado no cubre otro lado obligatorio;

un grant sin site_id es inválido.

28. AST — Tipo de sede dentro de asignaciones

AST exige:

sede del recurso dentro de assigned_sites;

sede activa;

tipo de sede exacto;

tipo declarado en el grant;

ausencia de territorio aislado.

Regla:

AS
∩
site_type exacto

No equivale a todas las sedes de ese tipo.

29. TST — Todas las sedes de un tipo

TST es transversal y exige una concesión explícita.

Reglas:

no se infiere desde AST;

no se infiere por tener varias sedes;

no se infiere por rol;

cubre únicamente sedes ordinarias del tipo exacto;

excluye entornos aislados;

conserva límites de organización;

conserva recurso y campos;

una sede de tipo desconocido no coincide.

30. AA — Áreas asignadas

AA exige que todas las áreas obligatorias del recurso estén incluidas en:

AccessContext.assigned_areas

y que:

la asignación esté activa;

el área esté activa;

pertenezca a una sede autorizada;

el área coincida exactamente.

Una lista vacía no coincide.

AA no podrá utilizarse como sustituto del área operativa.

31. SA — Área específica

SA exige coincidencia exacta entre:

grant.area_id

y el área del recurso.

Además:

el área debe existir;

debe estar activa;

debe pertenecer a la sede correspondiente;

el grant deberá conservar o derivar la sede necesaria;

no se aceptan áreas de otra sede;

un area_id nulo invalida el grant.

32. AAT — Tipo de área dentro de asignaciones

AAT exige:

área del recurso
∈ assigned_areas utilizables

y:

area_kind del recurso
=
area_kind del grant

No cubre todas las áreas del mismo tipo.

33. ATW — Todas las áreas de un tipo

ATW exige:

tipo de área exacto;

límite superior de sedes autorizado;

organización compatible;

recurso ordinario;

concesión transversal explícita.

Nunca existe sin un límite de sede.

ATW no atraviesa entornos aislados.

34. OWN — Propiedad o atribución

OWN coincide cuando:

el contrato define qué significa propiedad;

resource.ownership.coherent = true;

la relación con el actor coincide;

el actor exacto es el permitido;

el recurso está vigente;

cualquier límite territorial adicional también coincide.

Regla:

OWN
→ puede reducir el conjunto
→ nunca amplía territorio

No se utiliza universalmente:

created_by = actor

Cada recurso define su relación canónica.

35. Composición de alcance

Un permiso puede requerir más de una condición.

Ejemplo:

OWN
+
AS

significa:

recurso propio
dentro de sedes asignadas

No:

recurso propio
o
sedes asignadas

La semántica AND o OR deberá proceder del perfil de alcance publicado delpermiso.

No se elegirá la combinación más permisiva.

36. Cobertura administrativa

administrative_coverage es evidencia contextual, no grant.

Modos:

NONE
ASSIGNED_SITES
SPECIFIC_SITE
ASSIGNED_AREAS
SPECIFIC_AREA
ORGANIZATION

Uso:

AS, AST, AA, AAT consumen asignaciones y cobertura coherente;

SS y SA consumen dimensiones exactas del grant;

G y ORG dependen del grant exacto, no de convertir artificialmente lacobertura;

NONE no bloquea permisos NT, ORG, G u OWN cuando el contrato ygrant los permiten;

valid = false bloquea el carril base.

37. Recursos sin sede

Un recurso con:

site_ids = []

puede ser válido cuando el contrato lo clasifica como:

no territorial;

organizacional;

de dominio;

propio sin dimensión territorial;

NON_RESOURCE.

No será válido para un grant que exija AS, SS, AST o TST.

No se asignará una sede por fallback.

38. Recursos sin área

Un recurso con:

area_ids = []

puede ser válido a nivel de organización, sede, recurso no territorial orecurso site-wide.

No será válido para un grant que exija AA, SA, AAT o ATW.

Una lista vacía no significa todas las áreas.

39. Recursos multiterritoriales

Cuando resource.required_sides contiene varios lados, el grant deberá cubrirtodos los lados obligatorios según su contrato.

Ejemplo:

remisión
origin = CENTRO_PRODUCCION
destination = VENTO_CAFE

Un grant SS para CENTRO_PRODUCCION no cubre automáticamente el destino.

La composición deberá estar declarada por el contrato del permiso y delrecurso.

40. Colecciones

Para COLLECTION:

cada miembro debe quedar dentro del alcance;

el conjunto se construye en servidor;

los IDs se evalúan contra el mismo permiso;

un miembro no autorizado se excluye en lecturas;

una colección no puede incluir miembros ocultos y filtrar después;

el conteo y paginación conservan el alcance.

La decisión de una colección autorizada no autoriza mutaciones sobre todos susmiembros.

41. Agregados

Para AGGREGATE:

cada dato contribuyente debe estar autorizado;

no se incluyen territorios denegados;

no se revelan datos por inferencia;

el resultado conserva el alcance exacto;

un grant global continúa limitado al permiso de agregado;

un agregado transversal requiere scope explícito.

42. Operaciones masivas

Para BULK:

permiso ordinario
≠
permiso masivo

La evaluación seguirá la política declarada:

ALL_OR_NOTHING

Todos los miembros deben producir base allow cuando el carril base searequerido.

PARTIAL_WITH_RESULTS

Cada miembro obtiene una decisión base independiente.

No se resumirá una operación parcialmente denegada como allow total.

43. Estado del recurso

Un grant válido no autoriza estados incompatibles.

El carril base deberá consumir:

resource.state_snapshot

y verificar el estado actual, la transición solicitada y las condicionesempresariales del permiso.

Si el contrato no admite el estado:

outcome = DENY
reason_codes incluye BASE_RESOURCE_STATE_MISMATCH

44. Campos protegidos

El allow del carril base no concede automáticamente todos los campos.

La decisión deberá respetar:

resource.field_classification
requested_fields
field_policy_decision

Una lectura parcial puede conservar base_decision.outcome = ALLOW sobre laproyección autorizada.

Una mutación con un campo bloqueado produce DENY o requiere separaciónexplícita.

45. Concurrencia

Para una operación que exige concurrencia:

resource.concurrency.validated = true

deberá cumplirse antes de ejecutar.

El carril base puede demostrar autoridad sobre el recurso, pero unaconcurrencia fallida impide la ejecución.

AUTH-CTX-023 consolidará el bloqueo final.

46. Dispositivo compartido

El dispositivo no produce allow base.

Una acción desde dispositivo exige además:

dispositivo válido;

sesión de actor válida;

aplicación permitida;

clave incluida;

territorio compatible;

política de actor satisfecha;

reautenticación cuando aplique.

La relación es:

BASE AUTHORITY
∩
DEVICE LIMIT

Nunca unión.

47. Turno y check-in

El carril base no consulta:

active_shift;

active_checkin_session;

operational_role;

operational_site;

operational_area.

Reglas:

sin turno
→ base puede continuar

sin check-in
→ base puede continuar

fin del turno
→ no revoca base

check-in activo
→ no amplía base

48. Carril operativo separado

El carril base no utilizará:

operational-role-grants;

grants individuales operativos;

rol del turno;

scope CTX;

área del turno;

permisos operativos legacy.

Un actor híbrido puede obtener decisiones independientes en ambos carriles.

49. Actor-wide deny

Un actor-wide deny aplicable a la clave exacta bloquea el carril base aunqueexistan múltiples allows.

Regla:

ACTOR_WIDE_DENY
>
BASE ALLOW

AUTH-CTX-022 definirá y poblará la evidencia.

50. Base lane deny

Una denegación del carril base bloquea únicamente el base cuando coincide.

En BASE_OR_OPERATIONAL:

base deny
→ base_decision = DENY
→ operativo puede continuar

En BASE_AND_OPERATIONAL:

base deny
→ base_decision = DENY
→ final_decision = DENY

Una concesión más específica no vence la denegación aplicable.

51. Structural deny

Un problema estructural aplicable puede bloquear solo base o ambos carriles.

Ejemplos:

rol base ambiguo;

rol base inactivo;

cobertura administrativa inválida;

asignaciones contradictorias;

snapshot obsoleto;

recurso no resoluble;

contrato incompatible.

Un structural deny no es una fila administrable de overrides.

52. Default deny

Si el carril es aplicable y no existe deny, pero tampoco existe un allow basecompleto:

outcome = DENY
reason_codes incluye BASE_NO_MATCHING_ALLOW

No se materializa una denegación explícita.

No se inventa un grant.

53. Varios allows coincidentes

Pueden coincidir varios allows de rol o individuales.

Reglas:

uno solo completo es suficiente para base_decision = ALLOW;

los grants no se suman para crear un alcance no declarado;

un grant incompleto no completa otro salvo composición explícita;

se registran todos los allows realmente coincidentes;

los IDs se deduplican;

el orden es determinista;

un deny aplicable prevalece.

54. matched_allow_ids

Solo incluye grants base que:

pertenecen al actor o rol exacto;

usan la clave exacta;

son compatibles con la modalidad;

están vigentes;

coinciden territorialmente;

coinciden con el recurso;

cumplen estado y condiciones;

pueden contribuir al carril.

No incluye candidatos descartados, grants operativos, grants inactivos,fuera de alcance, legacy o incompatibles.

AUTH-CTX-021 definirá el objeto completo MatchedGrant.

55. matched_deny_ids

Incluye únicamente IDs de denegaciones administrables que bloquean el carrilbase:

actor-wide deny;

base lane deny.

No incluye:

structural issues sin deny_id;

default deny;

falta de allow;

códigos de razón sin registro administrable.

AUTH-CTX-022 definirá el objeto completo MatchedDeny.

56. reason_codes

Códigos iniciales reservados para base_decision:

BASE_LANE_NOT_REQUIRED
BASE_CONTEXT_NOT_APPLICABLE
BASE_CONTEXT_UNAVAILABLE
BASE_CONTEXT_INVALID
BASE_EMPLOYEE_INACTIVE
BASE_ROLE_NOT_AVAILABLE
BASE_ROLE_INVALID
BASE_ADMINISTRATIVE_COVERAGE_INVALID
BASE_RESOURCE_UNRESOLVED
BASE_RESOURCE_CONFLICT
BASE_RESOURCE_ISOLATED
BASE_RESOURCE_STATE_MISMATCH
BASE_SCOPE_NOT_MATCHED
BASE_REQUIRED_SIDE_NOT_COVERED
BASE_OWNERSHIP_NOT_MATCHED
BASE_FIELD_POLICY_FAILED
BASE_CONCURRENCY_FAILED
BASE_ACTOR_WIDE_DENY
BASE_LANE_DENY
BASE_NO_MATCHING_ALLOW
BASE_ALLOW_MATCHED
BASE_COMPONENT_MATCHED
BASE_DATASET_VERSION_MISMATCH
BASE_GRANT_CONFIGURATION_INVALID
BASE_INCOMPATIBLE_GRANT

AUTH-CTX-023 decidirá cuáles se exponen al cliente y su prioridad.

57. Truth table principal

Condición

Outcome

Modalidad OPERATIONAL_ONLY

NOT_APPLICABLE

Contexto base INVALID

DENY

Contexto base UNAVAILABLE

DENY

Recurso UNRESOLVED, CONFLICT o ISOLATED

DENY

Actor-wide deny coincidente

DENY

Base lane deny coincidente

DENY

Sin allow base completo

DENY

Allow base completo sin deny

ALLOW

BASE_COMPONENT completo

ALLOW del carril; no final

Constraint global fallido

El carril conserva evidencia; la decisión final será DENY

58. Restricciones globales y outcome del carril

base_decision expresa la autoridad producida por el carril base.

Las decisiones separadas:

device_decision;

sensitivity_decision;

field_policy_decision;

prerequisite_decisions;

no se convierten en grants base.

Cuando una restricción global falla:

base_decision puede conservar ALLOW
final_decision = DENY

Esto permite explicar que el actor posee la capacidad base, pero la solicitudconcreta fue bloqueada por una restricción adicional.

59. Dependencias

Una dependencia de permiso se evalúa mediante una decisión separada.

Reglas:

no se infiere por módulo;

no se infiere app.access;

cada dependencia conserva su modalidad;

una dependencia fallida bloquea la solicitud principal cuando el contratola declara obligatoria;

aprobar la dependencia no crea el grant principal;

la evidencia no se incluye como matched_allow_ids del permiso principal.

60. Simulación

La simulación puede calcular un base_decision hipotético.

Reglas:

utiliza el mismo algoritmo;

no modifica el contexto real;

no ejecuta mutaciones;

no crea grants;

no elimina denies;

no convierte WOULD_ALLOW en ALLOW;

el actor real conserva la autorización para iniciar y consultar lasimulación.

61. Procesos de sistema

Un proceso SYSTEM autónomo no utiliza el carril base laboral salvo que uncontrato explícito de sistema lo represente.

No se convertirá service role, API key, cron, Edge Function o cola en rolbase.

Los procesos delegados conservan al empleado actor cuando exista delegaciónválida.

62. Inmutabilidad y snapshot

base_decision queda asociado a:

actor;

empleado;

rol base;

cobertura;

permiso;

recurso;

versión;

datasets;

denies;

instante;

restricciones.

Un cambio en cualquiera de estos hechos obliga a una nueva decisión.

63. Orden determinista

La serialización deberá:

ordenar matched_allow_ids alfabéticamente;

ordenar matched_deny_ids alfabéticamente;

eliminar duplicados;

ordenar reason_codes por prioridad y luego alfabéticamente;

conservar el mismo resultado para el mismo snapshot;

no depender del orden físico de filas;

no elegir el primer grant;

no elegir el grant más amplio;

no elegir el grant más permisivo.

64. Casos de ejemplo

Caso A — Permiso BASE_ONLY con grant de rol

permission = viso.workforce.employees.view
requirement = BASE_ONLY
base_role = gerente
grant = AS
resource.site_ids = [VENTO_CAFE]
assigned_sites = [VENTO_CAFE]

Resultado:

base_decision.outcome = ALLOW
operational_decision = NOT_APPLICABLE

Caso B — OPERATIONAL_ONLY

permission = nexo.inventory.remissions.prepare
requirement = OPERATIONAL_ONLY

Resultado:

base_decision = NOT_APPLICABLE

Aunque exista una fila base legacy, no autoriza.

Caso C — BASE_OR_OPERATIONAL sin turno

base allow válido
active_shift = null

Resultado:

base_decision = ALLOW

Caso D — BASE_AND_OPERATIONAL

base component válido
operational component pendiente

Resultado:

base_decision = ALLOW
final_decision todavía no es ALLOW

Caso E — Propietario sin grant

base_role = propietario
sin grant exacto

Resultado:

base_decision = DENY
BASE_NO_MATCHING_ALLOW

Caso F — Contador con cobertura NONE y grant global exacto

base_role = contador
administrative_coverage.mode = NONE
grant.scope = G
resource organizacional ordinario

Resultado:

base_decision puede ser ALLOW

Caso G — Recurso fuera de sedes asignadas

grant = AS
assigned_sites = [VENTO_CAFE]
resource.site = SAUDO

Resultado:

DENY
BASE_SCOPE_NOT_MATCHED

Caso H — Recurso propio fuera del territorio

grant = OWN + AS
ownership = SELF
resource.site = SAUDO
assigned_sites = [VENTO_CAFE]

Resultado:

DENY

Caso I — Remisión con dos lados

grant cubre origin
no cubre destination
ambos lados son obligatorios

Resultado:

DENY
BASE_REQUIRED_SIDE_NOT_COVERED

Caso J — Actor-wide deny

dos allows base válidos
un actor-wide deny coincidente

Resultado:

base_decision = DENY

Caso K — APP-REVIEW

grant = G
resource.isolated_environment = true

Resultado:

DENY
BASE_RESOURCE_ISOLATED

65. Antipatrones prohibidos

if (employee.role === "propietario") {
  return true;
}

if (!activeShift) {
  return false;
}

const allowed = rolePermissions.some((permission) =>
  permission.startsWith(`${appCode}.`)
);

const siteId = selectedSiteId ?? employee.site_id;

if (resource.created_by === actorId) {
  return true;
}

También queda prohibido:

rol base → todos los permisos
check-in activo → ampliar administración
sin turno → perder administración
grant operativo → allow base
grant base legacy → rescatar OPERATIONAL_ONLY
sede primaria → todas las sedes
lista vacía → todos
OWN → ignorar territorio
G → incluir APP-REVIEW
allow más específico → vencer deny
varios allows incompletos → construir uno nuevo
BASE_COMPONENT → final allow

66. Relación con tareas posteriores

AUTH-CTX-020

Definirá el carril operativo de forma independiente.

AUTH-CTX-021

Definirá y serializará MatchedGrant, incluyendo los grants base realmentecoincidentes.

AUTH-CTX-022

Definirá structural denies, actor-wide denies, base lane denies,operational lane denies y evidencia coincidente.

AUTH-CTX-023

Combinará base, operación, modalidad, restricciones, dependencias, campos,denies, default deny y decisión final.

AUTH-CTX-024

Registrará evidencia auditable de rol, grant, override, scope, recurso,territorio, razones, datasets, hash y outcome.

AUTH-CTX-025

Diseñará get_access_context, incluyendo los hechos base necesarios.

AUTH-CTX-026

Diseñará evaluate_authorization, la consulta de datasets, el scope matcher,la frontera transaccional y el objeto LaneDecision.

AUTH-CTX-027

Eliminará evaluaciones locales de permisos base en aplicaciones.

AUTH-CTX-028

Diseñará compatibilidad con has_permission, role_permissions,employee_permissions, oficios base legacy, campos territoriales legacy,scopes actuales, duplicados y aliases.

AUTH-CTX-029

Definirá caché e invalidación por cambios de rol, asignación, grant, deny,recurso, estado, dataset y catálogo.

AUTH-CTX-030

Definirá pruebas contractuales de modalidad, readiness, roles, overrides,scopes, recursos propios, multiterritorio, colecciones, agregados, bulk,denies, default deny, componentes base, dispositivo, campos, concurrencia yaislamiento.

AUTH-MOD-021

Deberá aprobarse antes de AUTH-CTX-028 para definir el rol base mínimo de lostrabajadores puramente operativos.

AUTH-DB-006 a AUTH-DB-010

Implementarán validación del contexto, permiso, recurso, actor y territoriodentro de RPC sensibles.

AUTH-DB-020

Migrará grants y consumidores legacy con compatibilidad temporal.

AUTH-DB-027

Probará matriz base, overrides, RLS, RPC, recursos y migraciones.

AUTH-DB-030

Retirará has_permission y rutas legacy después de adopción comprobada.

AUTH-DB-031

Certificará paridad documental, técnica y operativa.

67. Fuera del alcance

AUTH-CTX-019 no:

modifica la matriz base;

modifica sus 499 registros;

modifica sus hashes;

crea grants;

crea overrides;

crea denegaciones;

define el carril operativo;

define objetos completos de matched allows;

define objetos completos de matched denies;

produce la combinación final;

modifica contratos de recurso;

reclasifica permisos;

implementa campos protegidos;

implementa MFA;

implementa dispositivos;

crea tipos físicos;

crea funciones SQL;

crea RPC;

crea RLS;

crea migraciones;

modifica Supabase;

modifica aplicaciones.

Cada responsabilidad posterior tiene destino explícito en la sección 66.

68. Riesgos controlados

Riesgo 1 — Rol jerárquico funciona como bypass

Control:

rol
+
grant exacto
+
recurso exacto

Riesgo 2 — Administración depende de presencia operativa

Control:

base no consume turno ni check-in

Riesgo 3 — Scope global concede todos los permisos

Control:

G limita territorio
no crea capacidades

Riesgo 4 — OWN amplía sedes

Control:

propiedad
∩
territorio

Riesgo 5 — Grant individual repara identidad inválida

Control:

contexto base válido obligatorio

Riesgo 6 — Deny se vence con allow más específico

Control:

deny aplicable
>
allow

Riesgo 7 — Componente base ejecuta acción doble

Control:

BASE_COMPONENT
→ allow de carril
→ final exige operación

Riesgo 8 — Recursos aislados entran en G

Control:

isolated_environment
→ DENY sin autorización específica

69. Criterios de aprobación

AUTH-CTX-019 podrá aprobarse cuando se acepte que:

se conserva la forma de LaneDecision;

base_decision.lane siempre es BASE;

OPERATIONAL_ONLY produce NOT_APPLICABLE;

evaluated = false solo para carril no aplicable;

las demás modalidades evalúan base;

readiness procede del AccessContext;

el evaluador no mejora readiness;

READY no significa allow;

un actor laboral exacto es obligatorio;

empleado inactivo no posee autoridad;

rol base activo y único es obligatorio;

un override no repara rol inválido;

solo siete roles base son canónicos;

los oficios legacy no son fuente final;

propietario no tiene bypass;

gerente general no tiene bypass;

las únicas fuentes de allow son BASE_ROLE e INDIVIDUAL_BASE;

el dataset base es @1.0.0;

contiene 499 registros;

los grants directos pueden autorizar el carril;

los componentes base solo autorizan su carril;

un componente base no autoriza la acción final;

los overrides individuales permanecen restrictivos;

la clave debe coincidir exactamente;

la modalidad debe admitir base;

el grant debe estar vigente;

CTX es incompatible con base;

NT no inventa territorio;

ORG no equivale a global territorial;

G es organizacional ordinario;

G excluye entornos aislados;

AS usa sedes asignadas utilizables;

SS exige sede exacta;

AST combina asignación y tipo;

TST exige transversalidad explícita;

AA usa áreas asignadas;

SA exige área exacta;

AAT combina asignación y tipo;

ATW exige límite superior de sede;

OWN no amplía territorio;

scopes compuestos respetan su lógica publicada;

cobertura administrativa no es grant;

cobertura NONE puede coexistir con grants NT, ORG, G u OWN;

recursos sin sede no usan fallback;

recursos sin área no significan todas;

todos los lados obligatorios deben estar cubiertos;

colecciones se limitan en servidor;

agregados excluyen miembros no autorizados;

operaciones masivas requieren contrato;

estado del recurso participa;

campos protegidos permanecen separados;

concurrencia permanece obligatoria cuando aplica;

el dispositivo solo restringe;

el turno no participa;

el check-in no participa;

el carril operativo permanece separado;

actor-wide deny prevalece;

base lane deny prevalece en base;

structural deny puede bloquear el carril;

ausencia de allow produce default deny;

varios allows no crean alcance nuevo;

matched_allow_ids solo contiene grants realmente coincidentes;

matched_deny_ids excluye default deny;

reason_codes queda normalizado;

restricciones globales pueden negar la decisión final sin reescribir laevidencia del carril;

dependencias no crean grants;

simulación no ejecuta autoridad;

procesos de sistema no inventan rol base;

la decisión es inmutable;

el orden es determinista;

AUTH-CTX-020 definirá operación;

AUTH-CTX-021 definirá allows coincidentes;

AUTH-CTX-022 definirá denies;

AUTH-CTX-023 definirá decisión final;

AUTH-CTX-024 definirá auditoría;

AUTH-CTX-026 diseñará el evaluador;

AUTH-CTX-027 eliminará lógica local;

AUTH-CTX-028 gobernará compatibilidad legacy;

AUTH-CTX-029 gobernará invalidación;

AUTH-CTX-030 gobernará pruebas;

AUTH-MOD-021 permanece como puerta antes de AUTH-CTX-028;

las tareas AUTH-DB indicadas tienen destinos físicos explícitos;

no se implementa código, migraciones ni cambios en Supabase.

70. Estado final de la propuesta

Tarea

Estado

Relación

AUTH-CTX-018

APROBADA

Tarea anterior

AUTH-CTX-019

APROBADA

Tarea actual

AUTH-CTX-020

NO INICIADA

Tarea siguiente reservada

La continuidad propuesta queda:

AUTH-CTX-018 — APROBADA
        ↓
AUTH-CTX-019 — APROBADA
        ↓
AUTH-CTX-020 — NO INICIADA

No se avanza a AUTH-CTX-020 hasta recibir aprobación explícita deAUTH-CTX-019.


