### SECCIÓN — DENEGACIONES

<!-- PLAN-SECTION-META:START -->
Esta sección reúne contenido canónico con una responsabilidad documental única dentro del plan. Debe conservarse cohesionada y actualizarse junto con sus referencias y validaciones dependientes.

**Cobertura canónica:** `AUTH-MOD-019` — 1 tarea.
<!-- PLAN-SECTION-META:END -->

### ✅ AUTH-MOD-019 — Definir reglas de denegación explícita

#### 1. Problema que se resuelve

El modelo actual contiene campos como:

role_permissions.is_allowed
employee_permissions.is_allowed
operational_role_permissions.is_allowed

Sin embargo, la auditoría encontró:

DENEGACIONES EN role_permissions
→ 0

DENEGACIONES EN employee_permissions
→ 0

DENEGACIONES EN operational_role_permissions
→ 0

Actualmente las matrices solamente suman permisos.

No existe un comportamiento real y probado para casos como:

Rol base permite
+
trabajador específico denegado
Rol operativo permite
+
área específica denegada
Permiso global
+
sede excluida
Permiso base denegado
+
permiso operativo permitido
Permiso operativo denegado
+
permiso base permitido
Permiso permitido
+
restricción temporal activa

Sin reglas canónicas, cada guard, RPC o política RLS podría interpretar de forma diferente:

deny > allow
allow > deny
más específico > más general
individual > rol
base > operativo
operativo > base

#### 2. Decisión principal

Vento OS aplicará la siguiente jerarquía:

#### 1. DENEGACIÓN ESTRUCTURAL

#### 2. BLOQUEO INDIVIDUAL TRANSVERSAL

#### 3. DENEGACIÓN EXPLÍCITA DEL CARRIL

#### 4. CONCESIÓN VÁLIDA

#### 5. DENEGACIÓN POR DEFECTO

Representación:

SOLICITUD
    ↓
¿Existe bloqueo estructural?
    ├── Sí → DENEGAR
    └── No
          ↓
¿Existe bloqueo individual transversal?
    ├── Sí → DENEGAR
    └── No
          ↓
Evaluar carril base y/o operativo
          ↓
¿Existe deny aplicable en el carril?
    ├── Sí → DENEGAR ESE CARRIL
    └── No
          ↓
¿Existe allow aplicable?
    ├── Sí → PERMITIR ESE CARRIL
    └── No → DENEGAR POR DEFECTO

#### 3. Regla canónica

UN DENY EXPLÍCITO APLICABLE
PREVALECE SOBRE
CUALQUIER ALLOW APLICABLE
DENTRO DEL MISMO CARRIL

No importa si el allow procede de:

un rol;
una excepción individual;
un alcance global;
una sede específica;
un tipo de sede;
un área;
un tipo de área.

Si el deny coincide con:

el actor;
el permiso;
el carril;
el recurso;
el alcance;
la vigencia;

el carril queda denegado.

#### 4. Tres clases de denegación

El modelo reconocerá tres clases distintas:

DENEGACIÓN ESTRUCTURAL
DENEGACIÓN DE CARRIL
BLOQUEO INDIVIDUAL TRANSVERSAL

No tendrán la misma función.

#### 5. Denegación estructural

Una denegación estructural ocurre cuando falta una condición indispensable del sistema.

Ejemplos:

actor no autenticado;
actor efectivo inexistente;
empleado inactivo;
aplicación inexistente;
aplicación inactiva;
permiso inexistente;
permiso inactivo;
modalidad de autorización ausente;
recurso no resoluble;
sede inactiva;
área inactiva;
turno inválido;
check-in requerido ausente;
rol operativo inválido;
sesión de dispositivo inválida;
simulación intentando mutar datos.

Estas denegaciones no dependen de una fila con:

is_allowed = false

Son consecuencias obligatorias de la invalidez del contexto.

Regla
DENEGACIÓN ESTRUCTURAL
>
TODOS LOS ALLOW
>
TODOS LOS ROLES
>
TODAS LAS EXCEPCIONES

No podrá ser anulada mediante un permiso adicional.

#### 6. Ejemplo de denegación estructural

Empleado:
inactivo

Permiso individual:
allow global

Rol base:
allow global

Turno:
activo

Resultado:
❌ DENEGAR

La condición:

employee.is_active = false

termina la evaluación.

#### 7. Denegación de carril

Una denegación de carril bloquea un permiso dentro de uno de los dos contextos aprobados:

BASE
OPERATIVO

Ejemplos:

BASE_DENY
→ no puede utilizar el permiso mediante autoridad permanente

OPERATIONAL_DENY
→ no puede utilizar el permiso mediante el turno

Una denegación base no será automáticamente una denegación operativa.

Una denegación operativa no será automáticamente una denegación base.

#### 8. Bloqueo individual transversal

Un bloqueo individual transversal impide que un trabajador concreto obtenga un permiso por cualquiera de los carriles compatibles.

Código conceptual:

ACTOR_WIDE_DENY

Resultado:

BASE
→ DENEGADO

OPERATIVO
→ DENEGADO

Se utilizará para casos como:

suspensión de una capacidad sensible;
investigación interna;
restricción disciplinaria;
conflicto de interés;
separación temporal de funciones;
restricción de seguridad;
inhabilitación específica.

No desactiva completamente al trabajador.

Solo bloquea el permiso exacto indicado.

#### 9. Diferencia entre denegación estructural y bloqueo transversal

DENEGACIÓN ESTRUCTURAL
→ procede del estado inválido del sistema

ACTOR_WIDE_DENY
→ procede de una decisión administrativa explícita

Ejemplo:

Empleado inactivo
→ denegación estructural de todas las capacidades

Empleado activo
+
ACTOR_WIDE_DENY sobre numera.expenses.manage
→ solo se bloquea esa capacidad

#### 10. Fuentes de denegación base

El carril base podrá recibir denegaciones desde:

ROL BASE
→ role_permissions con efecto deny

TRABAJADOR
→ excepción individual base con efecto deny

Representación:

BasePermissionSources
├── base_role_allow
├── base_role_deny
├── employee_base_allow
└── employee_base_deny

#### 11. Fuentes de denegación operativa

El carril operativo podrá recibir denegaciones desde:

ROL OPERATIVO
→ operational_role_permissions con efecto deny

TRABAJADOR
→ excepción individual operativa con efecto deny

Representación:

OperationalPermissionSources
├── operational_role_allow
├── operational_role_deny
├── employee_operational_allow
└── employee_operational_deny

#### 12. Fuentes de bloqueo transversal

El bloqueo transversal será individual.

employee_id
+
permission_code
+
effect = deny
+
lane = all_compatible

No procederá de:

un rol base;
un rol operativo;
el nombre de un cargo;
una sede seleccionada;
un dispositivo;
un perfil predeterminado.

Un rol no deberá bloquear automáticamente el otro carril.

#### 13. El permiso debe coincidir exactamente

Una denegación será aplicable únicamente al código exacto del permiso.

Ejemplo:

DENY
nexo.inventory.remissions.prepare

no deniega automáticamente:

nexo.inventory.remissions.request
nexo.inventory.remissions.receive
nexo.inventory.remissions.transit
nexo.inventory.remissions.cancel

Regla:

MISMO PREFIJO
≠ MISMO PERMISO

#### 14. Wildcards prohibidos

No se admitirán denegaciones ambiguas como:

nexo.*
inventory.*
*.manage
production.*

Para bloquear una aplicación completa se utilizará:

`<app>.access`

o una política de suspensión expresamente diseñada.

Los permisos seguirán siendo capacidades exactas.

#### 15. Permisos sin jerarquía implícita

Una denegación sobre:

production.batches

no bloquea automáticamente:

production.batches.view
production.batches.create

salvo que el catálogo declare explícitamente una dependencia entre esos permisos.

No se inferirá jerarquía desde:

puntos;
segmentos;
nombres;
prefijos;
sufijos.

#### 16. Permisos prerrequisito

El catálogo podrá declarar que un permiso depende de otro.

Ejemplo:

nexo.inventory.remissions.prepare
requiere:
nexo.access

Si existe una denegación aplicable sobre:

nexo.access

el actor no podrá ejecutar acciones de NEXO por ese carril, aunque tenga un allow específico sobre prepare.

Esto no constituye herencia textual.

Es una dependencia explícita del contrato.

#### 17. Regla dentro del carril base

La decisión base seguirá este orden:

#### 1. Validar condiciones estructurales

#### 2. Buscar bloqueo transversal

#### 3. Buscar deny base aplicable

#### 4. Buscar allow base aplicable

#### 5. Denegar por defecto

Fórmula:

MATCHING_BASE_DENY
→ BASE_DECISION = DENY

SIN BASE_DENY
+
MATCHING_BASE_ALLOW
→ BASE_DECISION = ALLOW

SIN BASE_DENY
+
SIN BASE_ALLOW
→ BASE_DECISION = DENY

#### 18. Regla dentro del carril operativo

La decisión operativa seguirá este orden:

#### 1. Validar condiciones estructurales

#### 2. Validar contexto operativo

#### 3. Buscar bloqueo transversal

#### 4. Buscar deny operativo aplicable

#### 5. Buscar allow operativo aplicable

#### 6. Denegar por defecto

Fórmula:

MATCHING_OPERATIONAL_DENY
→ OPERATIONAL_DECISION = DENY

SIN OPERATIONAL_DENY
+
MATCHING_OPERATIONAL_ALLOW
+
CONTEXTO OPERATIVO VÁLIDO
→ OPERATIONAL_DECISION = ALLOW

#### 19. Denegación individual frente a concesión del rol

ROL BASE
→ allow

TRABAJADOR
→ deny

RESULTADO
→ DENY

Ejemplo:

Rol:
gerente

Permiso:
viso.staff.manage

Rol permite:
sí

Trabajador específico denegado:
sí

Resultado:
❌ DENEGAR

#### 20. Denegación del rol frente a concesión individual

ROL
→ deny

TRABAJADOR
→ allow

RESULTADO
→ DENY

Una concesión individual normal no podrá anular una denegación explícita aplicable.

Para permitir posteriormente la acción se deberá:

retirar;
desactivar;
reducir;
o modificar

la denegación.

No se corregirá el conflicto agregando más permisos positivos.

#### 21. Razón de la regla deny > allow

Permitir:

allow específico > deny global

o:

employee allow > role deny

generaría configuraciones difíciles de explicar y auditar.

Ejemplo problemático:

Rol deny global
+
empleado allow por área
+
otro deny por sede
+
allow por tipo de área

El resultado dependería de una jerarquía compleja de especificidad.

El modelo aprobado utilizará una regla más segura:

CUALQUIER DENY APLICABLE
→ BLOQUEA EL CARRIL

#### 22. La especificidad determina coincidencia, no prioridad

Los alcances determinan dónde se aplica una denegación.

No determinan que una concesión más específica pueda vencerla.

Ejemplo:

ALLOW global
+
DENY Vento Café

Resultado:

Vento Café
→ DENY

Saudo
→ ALLOW

Centro de Producción
→ ALLOW

La denegación crea una exclusión territorial dentro del permiso amplio.

#### 23. Deny global frente a allow específico

DENY global
+
ALLOW Vento Café

Resultado:

Vento Café
→ DENY

Todas las demás sedes
→ DENY

El allow específico no abre una excepción dentro de un deny global.

Para habilitar Vento Café se deberá reducir el alcance del deny.

#### 24. Contradicción exacta

Una configuración como:

mismo sujeto
+
mismo permiso
+
mismo carril
+
mismo alcance
+
mismo periodo

ALLOW
y
DENY

será una configuración contradictoria.

Resultado en ejecución:

DENY

Resultado administrativo:

permission_assignment_conflict

La interfaz deberá exigir su corrección.

#### 25. Ausencia de allow

La ausencia de una concesión no es una denegación explícita.

SIN ALLOW
→ DENEGAR POR DEFECTO

Diferencia:

DEFAULT_DENY
→ nadie concedió la capacidad

EXPLICIT_DENY
→ existe una decisión expresa de bloquearla

Esta diferencia deberá conservarse en auditoría y presentación.

#### 26. Importancia de distinguir default deny

Un usuario puede no tener un permiso porque:

no está en su matriz;
el rol todavía no fue configurado;
la capacidad no corresponde a su trabajo.

Eso es diferente de:

la capacidad fue retirada específicamente.

La interfaz no mostrará ambos casos como:

Permiso denegado explícitamente

#### 27. Aplicación a BASE_ONLY

Para un permiso:

authorization_requirement = BASE_ONLY

solo se evalúa el carril base.

| Base           | Operativo   | Resultado |
| -------------- | ----------- | --------- |
| Allow          | No evaluado | Allow     |
| Deny explícito | No evaluado | Deny      |
| Sin allow      | No evaluado | Deny      |

Una denegación operativa sobre el mismo código será incompatible y no participará en la decisión.

#### 28. Aplicación a OPERATIONAL_ONLY

Para un permiso:

authorization_requirement = OPERATIONAL_ONLY

solo se evalúa el carril operativo.

| Base               | Operativo      | Resultado |
| ------------------ | -------------- | --------- |
| No evaluado        | Allow          | Allow     |
| No evaluado        | Deny explícito | Deny      |
| No evaluado        | Sin allow      | Deny      |
| Allow incompatible | Sin contexto   | Deny      |

Una concesión o denegación base no reemplazará el contexto operativo.

#### 29. Aplicación a BASE_OR_OPERATIONAL

Para:

authorization_requirement = BASE_OR_OPERATIONAL

cada carril se evalúa independientemente.

Regla
BASE_DENY
no destruye automáticamente
OPERATIONAL_ALLOW

y:

OPERATIONAL_DENY
no destruye automáticamente
BASE_ALLOW

Tabla:

| Base      | Operativo    | Resultado           |
| --------- | ------------ | ------------------- |
| Allow     | Allow        | Allow               |
| Allow     | Deny         | Allow por base      |
| Deny      | Allow        | Allow por operación |
| Deny      | Deny         | Deny                |
| Sin allow | Allow        | Allow por operación |
| Allow     | Sin contexto | Allow por base      |
| Sin allow | Sin allow    | Deny                |

#### 30. Ejemplo BASE_OR_OPERATIONAL

Permiso:
nexo.inventory.remissions.view

Modalidad:
BASE_OR_OPERATIONAL

Trabajador:

Base:
deny en Vento Café

Operación:
allow mediante bodeguero
turno válido en Vento Café

Resultado:

BASE_DECISION
→ DENY

OPERATIONAL_DECISION
→ ALLOW

FINAL
→ ALLOW POR CARRIL OPERATIVO

La auditoría deberá indicar claramente qué carril autorizó.

#### 31. Bloqueo transversal en BASE_OR_OPERATIONAL

ACTOR_WIDE_DENY
+
BASE_OR_OPERATIONAL
**=**
DENY FINAL

El bloqueo transversal existe precisamente para evitar que el actor utilice el otro carril como alternativa.

Ejemplo:

Carlos
+
ACTOR_WIDE_DENY
+
nexo.inventory.remissions.cancel

Resultado:

Base → Deny
Operativo → Deny
Final → Deny

#### 32. Aplicación a BASE_AND_OPERATIONAL

Para:

authorization_requirement = BASE_AND_OPERATIONAL

ambos carriles deben autorizar.

| Base      | Operativo    | Resultado |
| --------- | ------------ | --------- |
| Allow     | Allow        | Allow     |
| Deny      | Allow        | Deny      |
| Allow     | Deny         | Deny      |
| Deny      | Deny         | Deny      |
| Sin allow | Allow        | Deny      |
| Allow     | Sin contexto | Deny      |

Una denegación aplicable en cualquiera de los carriles produce denegación final.

#### 33. Precedencia completa

STRUCTURAL_DENY
>
ACTOR_WIDE_DENY
>
MATCHING_LANE_DENY
>
MATCHING_LANE_ALLOW
>
DEFAULT_DENY

Esta será la precedencia canónica.

#### 34. Alcance global de una denegación base

BASE_DENY
+
scope = global

significa:

el actor no puede obtener ese permiso mediante el carril base en los recursos organizacionales ordinarios cubiertos por la capacidad.

No significa:

desactivar al empleado;
desactivar la aplicación;
bloquear otros permisos;
bloquear automáticamente el carril operativo.

#### 35. Alcance global de una denegación operativa

OPERATIONAL_DENY
+
scope = global

significa:

el rol o trabajador no puede usar esa capacidad en ningún contexto operativo válido cubierto por la denegación.

No significa:

denegación administrativa;
bloqueo de todos los roles;
desactivación del empleado.

#### 36. Denegación por sedes asignadas

Se conserva la modalidad aprobada:

site_scope_mode = assigned_sites

La denegación aplica a cada sede activa asignada al actor.

Durante la transición:

scope_type = site
scope_site_id = null

se interpretará como:

assigned_sites

No como global.

#### 37. Ejemplo de deny por sedes asignadas

Empleado asignado:
├── Vento Café
└── Saudo

Deny:
numera.sales.view
scope = assigned_sites

Resultado:

Vento Café
→ DENY

Saudo
→ DENY

Centro de Producción
→ la fila no coincide

La decisión en Centro de Producción dependerá de otras asignaciones y de la autorización territorial del actor.

#### 38. Denegación por sede específica

scope = specific_site
site_id = VENTO_CAFE

solo bloquea recursos cuya sede real sea:

VENTO_CAFE

No bloquea:

Saudo;
Molka;
otras sedes del mismo tipo;
sedes con nombre parecido.

#### 39. Denegación por tipo de sede

Una denegación por tipo de sede respetará las modalidades ya aprobadas:

assigned_sites_of_type
all_sites_of_type

Ejemplo:

site_type = satellite
mode = assigned_sites_of_type

bloquea únicamente las sedes satélite que también estén asignadas al actor.

Ejemplo:

site_type = satellite
mode = all_sites_of_type

bloquea todas las sedes empresariales ordinarias de ese tipo.

No incluirá:

puntos de check-in;
sedes técnicas;
entornos aislados;
registros demo;
sitios inactivos.

#### 40. Denegación por área específica

scope = specific_area
area_id = <área>

bloquea únicamente la capacidad en esa área exacta.

Ejemplo:

ALLOW:
nexo.inventory.stock
scope = Centro de Producción

DENY:
nexo.inventory.stock
area = Repostería

Resultado:

Bodega
→ Allow

Cocina caliente
→ Allow

Galletería y Panadería
→ Allow

Repostería
→ Deny

#### 41. Denegación por tipo de área

La denegación por tipo de área deberá respetar:

el tipo exacto;
el límite de sede aprobado;
la modalidad territorial;
el área real del recurso.

Ejemplo:

area_type = caja
site_scope = assigned_sites

bloqueará la capacidad en las áreas de tipo caja dentro de las sedes correspondientes.

No bloqueará:

áreas llamadas Caja con tipo distinto;
toda la sede;
áreas parecidas;
otras acciones.

#### 42. Recurso real

Una denegación solo se considerará territorialmente aplicable después de resolver:

resource_site_id
resource_area_id
resource_site_type
resource_area_type

No se utilizará exclusivamente:

selected_site_id
selected_area_id
employees.site_id
employees.area_id
p_site_id enviado por cliente
p_area_id enviado por cliente

#### 43. Recurso territorial no resoluble

Si la decisión requiere comparar una denegación territorial y el recurso no puede resolverse:

resource_scope_unresolved
→ DENEGAR

No se ignorará el deny por falta de datos.

Tampoco se asumirá que la denegación no coincide.

#### 44. Operaciones con origen y destino

Una operación como:

traslado;
remisión;
movimiento entre sedes;
transferencia;
despacho;

puede tener:

origin_site_id
destination_site_id
origin_area_id
destination_area_id

Una denegación aplicable al origen o al destino bloqueará la operación completa, salvo que el contrato de la acción establezca otra regla.

Predeterminado:

DENY EN CUALQUIER TERRITORIO AFECTADO
→ DENEGAR OPERACIÓN

#### 45. Operaciones masivas

Para una operación sobre varios recursos:

recurso 1 → permitido
recurso 2 → permitido
recurso 3 → denegado

el resultado predeterminado será:

DENEGAR OPERACIÓN COMPLETA

No se aplicará silenciosamente solo sobre los recursos permitidos.

Una operación parcial deberá estar expresamente diseñada como:

partial_authorization_supported = true

y mostrar exactamente qué recursos fueron excluidos.

#### 46. Vigencia de una denegación

Una denegación podrá ser:

permanente;
temporal;
programada.

Contrato conceptual:

starts_at
ends_at
is_active
revoked_at

La denegación será aplicable cuando:

is_active = true
AND now >= starts_at
AND (ends_at IS NULL OR now < ends_at)
AND revoked_at IS NULL

#### 47. Denegación futura

starts_at > ahora

Resultado:

todavía no aplica

La interfaz podrá mostrar:

Programada
Inicia: 20 de julio de 2026, 8:00 a. m.

No bloqueará antes de la fecha efectiva.

#### 48. Denegación expirada

ends_at <= ahora

Resultado:

no participa en nuevas decisiones

La fila se conservará para auditoría.

No se eliminará físicamente como procedimiento normal.

#### 49. Denegación indefinida

Una denegación individual sin ends_at deberá declararse expresamente como permanente.

No se permitirá que un administrador deje accidentalmente una restricción temporal sin fecha final.

Representación conceptual:

duration_mode
├── temporary
└── permanent

#### 50. Sin retroactividad

Una denegación creada hoy no convertirá acciones históricas autorizadas en acciones no autorizadas.

deny.starts_at
→ controla decisiones desde ese instante

La auditoría histórica conservará la política vigente cuando ocurrió la acción.

#### 51. Acciones pendientes u offline

Una acción enviada posteriormente al servidor deberá validarse contra:

el actor;
el contexto original verificable;
la política vigente al momento de aceptación;
las denegaciones activas al momento de procesamiento.

Una cola offline no podrá utilizarse para evadir una denegación creada antes de que el servidor confirme la acción.

acción pendiente en cliente
≠ acción autorizada

#### 52. Efecto inmediato

Cuando se active una denegación:

la siguiente evaluación
→ deberá respetarla

No será necesario esperar:

nuevo login;
nuevo turno;
reinicio de aplicación;
cierre del dispositivo.

Las aplicaciones deberán invalidar o renovar su caché de autorización.

#### 53. Sesiones activas

Una denegación no elimina necesariamente el turno o el check-in.

Ejemplo:

Turno:
continúa activo

Permiso:
nexo.inventory.adjustments

Deny:
activo

Resultado:
el trabajador continúa en jornada
pero no puede ajustar inventario

La restricción afecta la capacidad, no toda la sesión laboral.

#### 54. Denegación de acceso a aplicación

Una denegación sobre:

`<app>.access`

bloquea el uso de esa aplicación dentro del carril y alcance correspondiente.

Aunque existan permisos específicos:

`<app>.resource.view`
`<app>.resource.manage`

el prerrequisito de acceso no se cumple.

Las RPC sensibles deberán seguir validando sus permisos específicos y no depender únicamente de la navegación.

#### 55. Motivo obligatorio

Toda denegación explícita deberá tener un motivo verificable.

Campos conceptuales:

reason_code
reason_text
created_by
created_at

Categorías posibles:

security_restriction
temporary_suspension
separation_of_duties
conflict_of_interest
territorial_exclusion
role_template_exclusion
investigation
operational_restriction
administrative_restriction
compliance_requirement

No se permitirá una denegación individual sin justificación.

#### 56. Evidencia y referencia

Una denegación sensible podrá contener:

reference_type
reference_id
supporting_notes

Ejemplos:

incidente;
acta;
decisión administrativa;
política interna;
solicitud de gerencia;
caso de auditoría.

No deberán almacenarse datos personales innecesarios dentro del motivo visible.

#### 57. Creación de denegaciones

Crear una denegación será una capacidad de seguridad distinta de conceder permisos.

administrar permisos
≠ administrar denegaciones

La operación deberá exigir un permiso dedicado.

No se autorizará por:

nombre de rol;
ser gerente;
ser supervisor;
administrar una sede;
tener el permiso que se pretende denegar.

#### 58. Alcance administrativo del creador

Un administrador local solo podrá crear denegaciones dentro de su territorio autorizado.

Ejemplo:

Gerente de Vento Café

podrá, si tiene el permiso dedicado, crear una restricción local sobre Vento Café.

No podrá crear:

deny global;
deny sobre Saudo;
deny sobre Centro de Producción;
actor-wide deny organizacional.

#### 59. Denegaciones globales

La creación de una denegación global deberá estar reservada a una capacidad administrativa global explícita.

No bastará:

scope local
+
role = gerente

Una denegación global puede retirar capacidades en toda la organización y debe tratarse como una acción de alto riesgo.

#### 60. Bloqueos transversales

Crear un:

ACTOR_WIDE_DENY

deberá exigir una capacidad específica de seguridad.

No podrá ser creado por un administrador que únicamente gestione:

horarios;
documentos;
perfiles operativos;
sedes;
áreas;
navegación.

#### 61. Modificación y revocación

Una denegación no deberá editarse silenciosamente.

Cambios relevantes:

alcance;
permiso;
carril;
actor;
fecha de inicio;
fecha de finalización;
motivo;

deberán producir:

nueva revisión
o
nuevo registro auditado

La revocación deberá conservar:

revoked_by
revoked_at
revocation_reason

#### 62. Prohibición de autoexcepción

El actor afectado no podrá:

revocar su propia denegación;
reducir su propio alcance;
cambiar su vigencia;
crear un allow para neutralizarla.

Aunque tenga permisos generales de administración, la operación deberá aplicar separación de funciones.

#### 63. Roles administrativos globales

Los roles:

propietario
gerente_general

no serán inmunes a todas las denegaciones por su nombre.

Sin embargo, las capacidades reservadas de propietario tendrán controles especiales.

Regla:

gerente_general
→ no puede denegar capacidades reservadas de propietario

Una denegación sobre capacidades reservadas deberá requerir:

otro propietario autorizado;
un proceso de recuperación controlado;
auditoría reforzada.

#### 64. Prevención de bloqueo total

El sistema no deberá permitir que una combinación de denegaciones elimine todos los actores capaces de:

administrar seguridad;
recuperar permisos;
gestionar propietarios;
revocar bloqueos críticos.

Debe conservarse al menos un principal de recuperación válido.

Código conceptual:

security_recovery_principal_required

#### 65. Denegaciones sobre roles

Una denegación configurada en una matriz de rol aplica a cualquier actor que utilice ese rol dentro del carril correspondiente.

Ejemplo:

operational_role = conductor_logistica

deny:
nexo.inventory.remissions.prepare

Resultado:

ningún conductor obtiene esa capacidad mediante ese rol.

Esto puede ser útil para dejar explícito que:

conductor
→ puede transitar
→ no puede preparar

Sin embargo, la ausencia de allow ya produce denegación por defecto.

Por tanto, los deny de rol deberán usarse principalmente para:

crear exclusiones sobre concesiones amplias;
documentar restricciones críticas;
protegerse de otra fuente de allow dentro del mismo carril.

#### 66. Denegaciones individuales

Las denegaciones individuales serán la herramienta normal para excepciones negativas.

Ejemplo:

Rol:
bodeguero

Permiso del rol:
nexo.inventory.adjustments
→ Allow

Trabajador:
Empleado A

Deny individual:
nexo.inventory.adjustments
→ Centro de Producción

Resultado:

Empleado A
→ no ajusta en Centro de Producción

Otros bodegueros
→ conservan el permiso

#### 67. Denegación individual base

Una denegación individual base podrá retirar una capacidad administrativa heredada.

Ejemplo:

Rol:
gerente

Allow:
viso.staff.documents.manage

Deny individual:
base
Vento Café

Resultado:

el gerente conserva otras capacidades, pero no administra documentos en esa sede.

#### 68. Denegación individual operativa

Una denegación individual operativa podrá retirar una capacidad durante cualquier turno coincidente.

Ejemplo:

Rol operativo:
cajero_satelite

Allow:
pulso.delivery.override

Deny individual operativo:
trabajador específico

Resultado:

el trabajador puede operar caja, pero no confirmar entregas mediante override.

#### 69. Denegación y cambio de rol operativo

Una denegación individual operativa se asociará al actor y permiso, no solamente al turno actual.

Si cambia de rol operativo y el nuevo rol también concede el permiso:

deny individual operativo
→ continúa aplicando

siempre que el alcance territorial coincida.

Una denegación exclusiva del rol anterior dejará de aplicar al cambiar de rol.

#### 70. Dispositivos compartidos

Las restricciones del dispositivo se tratarán como condiciones estructurales del contexto.

Ejemplo:

Dispositivo no permite NUMERA
→ DENEGAR

No será necesario crear una fila de permiso deny para cada actor.

Fórmula:

PERMISO DEL ACTOR
∩
CAPACIDADES DEL DISPOSITIVO
∩
AUSENCIA DE DENEGACIONES

El dispositivo restringe.

Nunca amplía.

#### 71. Identidad técnica

Una identidad técnica de dispositivo no podrá neutralizar una denegación del actor humano.

usuario técnico
+
actor humano denegado
**=**
DENEGAR

La acción deberá atribuirse al trabajador real.

#### 72. Simulación

La simulación deberá mostrar:

denegaciones estructurales;
denegaciones base;
denegaciones operativas;
bloqueos transversales;
alcances;
vigencia;
fuente;
motivo;
decisión final.

No podrá:

crear una denegación real;
revocar una denegación;
ignorar una denegación real;
usar el contexto simulado para mutar datos.

#### 73. Procesos técnicos y service role

Un proceso técnico no quedará automáticamente exento de las denegaciones.

Se diferenciarán dos casos.

Proceso propio del sistema
actor efectivo = system

Será evaluado mediante su capacidad técnica exacta.

Proceso actuando por un empleado
actor efectivo = employee

Las denegaciones del empleado deberán aplicarse.

No se permitirá:

service_role
→ impersonar empleado
→ ignorar deny

#### 74. Emergencias

Una acción de emergencia no anulará silenciosamente una denegación del permiso normal.

Modelo correcto:

acción normal:
inventory.adjustments.execute

acción excepcional:
inventory.adjustments.emergency_execute

La segunda tendrá:

permiso distinto;
motivo obligatorio;
auditoría reforzada;
posible doble aprobación;
alcance controlado.

Una denegación sobre el permiso normal no concede ni niega automáticamente el permiso de emergencia.

Cada capacidad se evalúa por separado.

#### 75. No existe override genérico de deny

No se creará un permiso como:

permissions.ignore_denials

que permita saltar cualquier restricción.

Un bypass universal convertiría todas las denegaciones en controles opcionales.

Las excepciones deberán ser:

específicas;
limitadas;
auditadas;
asociadas a otra capacidad empresarial.

#### 76. Cómo se verá en VISO

Configurar permiso

Aplicación
[ NEXO ]

Permiso
[ Preparar remisiones ]

Efecto
○ Permitir
● Denegar

Aplicación de la denegación
○ Carril base
● Carril operativo
○ Todos los carriles compatibles

Alcance
○ Global
○ Sedes asignadas
● Sede específica
○ Tipo de sede
○ Área específica
○ Tipo de área

Sede
[ Centro de Producción ]

Vigencia
● Temporal
○ Permanente

Desde
[ 18 de julio de 2026 — 08:00 ]

Hasta
[ 25 de julio de 2026 — 18:00 ]

Motivo
[ Restricción temporal de ajustes de inventario ]

[ Crear denegación ]

#### 77. Cómo se verá el resultado efectivo

NEXO · Ajustar inventario

ROL OPERATIVO
✅ Allow
Fuente: bodeguero
Alcance: global operativo

EXCEPCIÓN INDIVIDUAL
❌ Deny
Alcance: Centro de Producción
Vigencia: 18–25 de julio

RESULTADO EN CENTRO DE PRODUCCIÓN
❌ DENEGADO

RESULTADO EN OTRA SEDE VÁLIDA
✅ PERMITIDO

#### 78. Conflictos visibles

VISO deberá mostrar claramente:

⚠️ Existe conflicto

Allow:
Rol gerente
Alcance global

Deny:
Trabajador
Sede Vento Café

Decisión:
Vento Café → Deny
Otras sedes → Allow

No deberá ocultar el allow ni el deny.

Debe explicar cómo se obtuvo el resultado.

#### 79. Contrato de una denegación

ExplicitPermissionDeny
├── deny_id
├── subject_type
├── subject_id
├── permission_code
├── authorization_lane
├── deny_class
├── scope_type
├── scope_mode
├── site_id
├── site_type
├── area_id
├── area_type
├── starts_at
├── ends_at
├── duration_mode
├── reason_code
├── reason_text
├── reference_type
├── reference_id
├── is_active
├── created_by
├── created_at
├── revoked_by
├── revoked_at
└── revocation_reason

#### 80. Tipos de sujeto

subject_type
├── base_role
├── operational_role
└── employee

Reglas:

base_role
→ solo carril base

operational_role
→ solo carril operativo

employee
→ base, operativo o all_compatible

Una matriz de rol no podrá crear un bloqueo transversal entre carriles.

#### 81. Contrato de coincidencia

Una denegación será aplicable cuando todas las siguientes condiciones sean verdaderas:

permission_code coincide exactamente
AND sujeto coincide
AND carril coincide
AND deny activo
AND vigencia activa
AND alcance compatible
AND recurso dentro del alcance
AND aplicación activa
AND permiso activo

Para ACTOR_WIDE_DENY:

carril coincide con cualquiera
de los carriles compatibles del permiso

#### 82. Resultado estructurado

DenyEvaluation
├── structural_denies
├── actor_wide_denies
├── base_denies
├── operational_denies
├── matched_deny_ids
├── matched_scopes
├── effective_times
├── reasons
├── base_lane_blocked
├── operational_lane_blocked
└── final_effect

#### 83. Decisión efectiva completa

EffectiveAuthorizationDecision
├── permission_code
├── authorization_requirement
├── structural_decision
├── actor_wide_deny
├── base_decision
│   ├── allows
│   ├── denies
│   └── result
├── operational_decision
│   ├── allows
│   ├── denies
│   └── result
├── combination_operator
├── final_decision
└── blocked_reasons

#### 84. Códigos de bloqueo

structural_deny
actor_wide_explicit_deny
base_explicit_deny
operational_explicit_deny
role_explicit_deny
employee_explicit_deny
global_explicit_deny
assigned_sites_explicit_deny
site_explicit_deny
site_type_explicit_deny
area_explicit_deny
area_type_explicit_deny
permission_assignment_conflict
deny_scope_invalid
deny_scope_unresolved
deny_lane_incompatible
deny_subject_incompatible
deny_not_yet_active
deny_expired
deny_revoked
deny_reason_required
deny_creator_not_authorized
deny_outside_creator_scope
deny_reserved_permission
deny_recovery_principal_required
app_access_explicit_deny
explicit_deny

#### 85. Orden de evaluación definitivo

#### 1. Resolver principal autenticado

#### 2. Resolver actor efectivo

#### 3. Validar empleado activo

#### 4. Validar aplicación

#### 5. Validar permiso

#### 6. Resolver modalidad de autorización

#### 7. Resolver recurso real

#### 8. Resolver sede y área del recurso

#### 9. Evaluar denegaciones estructurales

#### 10. Evaluar bloqueos individuales transversales

#### 11. Evaluar carril base cuando corresponda

#### 12. Buscar denies base aplicables

#### 13. Buscar allows base aplicables

#### 14. Evaluar contexto operativo cuando corresponda

#### 15. Buscar denies operativos aplicables

#### 16. Buscar allows operativos aplicables

#### 17. Combinar carriles según AUTH-MOD-018

#### 18. Validar prerrequisitos de aplicación

#### 19. Producir decisión final

#### 20. Registrar auditoría

#### 86. Guards

Los guards deberán devolver:

allowed
denied
deny_class
deny_source
deny_scope
deny_reason_code
authorization_lane

No será suficiente:

true
false

La interfaz necesita distinguir:

sin concesión;
contexto inválido;
deny explícito;
aplicación bloqueada;
territorio bloqueado.

#### 87. RPC

Toda RPC sensible deberá evaluar las denegaciones en el servidor.

No podrá confiar en:

navegación oculta;
botón deshabilitado;
permisos cargados al iniciar sesión;
caché del cliente;
resultado calculado por otra aplicación.

Una denegación debe proteger la mutación real.

#### 88. RLS

Las políticas RLS deberán aplicar la misma decisión.

No podrán utilizar una lógica simplificada como:

EXISTS allow

sin verificar:

NOT EXISTS matching deny

Tampoco deberán reconstruir una jerarquía diferente de especificidad.

#### 89. Navegación

Una denegación sobre una capacidad de navegación podrá ocultar o deshabilitar la pantalla correspondiente.

Sin embargo:

pantalla oculta
≠ operación protegida

Las acciones del servidor deberán continuar validando el permiso exacto.

#### 90. Auditoría

Toda decisión afectada por una denegación deberá registrar:

actor efectivo
permiso
carril
recurso
sede
área
deny_id
deny_class
deny_subject
deny_scope
deny_reason_code
deny_created_by
deny_effective_from
decisión final
fecha de evaluación

#### 91. Auditoría de creación

Crear, modificar, programar, revocar o expirar una denegación deberá producir un evento.

deny_created
deny_scheduled
deny_activated
deny_updated
deny_revoked
deny_expired
deny_conflict_detected

#### 92. Estado actual y transición

Actualmente:

role_permissions
→ solo allows

employee_permissions
→ solo allows redundantes

operational_role_permissions
→ solo allows

Por tanto, implementar el modelo posteriormente requerirá:

clasificar carriles;
diferenciar efecto allow/deny;
definir bloqueos transversales;
normalizar alcances;
añadir vigencia y motivo;
centralizar evaluación;
probar conflictos.

Nada de esto se implementa durante AUTH-MOD-019.

#### 93. Datos legacy con is_allowed = false

Si durante la transición aparece una fila histórica con:

is_allowed = false

pero no puede determinarse con certeza:

su carril;
su alcance;
su modalidad;
su vigencia;
su intención;

no deberá activarse automáticamente.

Se clasificará como:

legacy_deny_unresolved

y requerirá revisión administrativa.

#### 94. Invariantes

Toda autorización se deniega por defecto.
Ausencia de allow no equivale a deny explícito.
Un deny estructural no puede ser anulado por permisos.
Un deny aplicable prevalece sobre cualquier allow dentro de su carril.
Una concesión individual no vence una denegación.
Un allow específico no vence un deny global.
La especificidad determina coincidencia, no prioridad.
Un deny no aplica fuera de su alcance.
El permiso debe coincidir exactamente.
No existen wildcards de permisos.
No existe jerarquía implícita entre códigos.
Las dependencias entre permisos deben ser explícitas.
Los denies base afectan únicamente el carril base.
Los denies operativos afectan únicamente el carril operativo.
Un actor-wide deny afecta todos los carriles compatibles.
Los roles no crean bloqueos transversales.
Un rol base no deniega automáticamente la operación.
Un rol operativo no deniega automáticamente la administración.
BASE_OR_OPERATIONAL conserva independencia entre carriles.
BASE_AND_OPERATIONAL se deniega si falla cualquier carril.
El alcance se resuelve desde el recurso real.
La sede seleccionada no altera una denegación.
El área seleccionada no altera una denegación.
Una denegación por sede no es global.
Una denegación por tipo no incluye tipos parecidos.
Una denegación por área específica no afecta toda la sede.
Una denegación temporal solo aplica durante su vigencia.
Una denegación expirada no participa en nuevas decisiones.
Una denegación histórica no se elimina físicamente.
Toda denegación individual exige motivo.
El actor afectado no revoca su propia denegación.
Crear denies requiere permiso dedicado.
El creador no puede superar su alcance territorial.
Un gerente local no crea denies globales.
Las capacidades reservadas de propietario tienen gobierno especial.
Debe conservarse un principal de recuperación.
El dispositivo restringe, pero no crea denegaciones laborales.
Service role no ignora denies al actuar por un empleado.
La simulación solo muestra resultados hipotéticos.
Las decisiones quedan auditadas.
Guards, RPC y RLS aplican las mismas reglas.
No existe override universal de denegaciones.

#### 95. Alternativas descartadas

A. La concesión individual siempre gana

❌ Descartada.

Permitiría neutralizar restricciones de seguridad agregando un allow.

B. El alcance más específico siempre gana

❌ Descartada.

Crearía una jerarquía compleja y difícil de auditar.

C. El deny siempre bloquea ambos carriles

❌ Descartada como regla general.

Rompería la independencia aprobada entre base y operación.

Para bloquear ambos se utilizará ACTOR_WIDE_DENY.

D. Los roles administrativos ignoran denies

❌ Descartada.

Reintroduciría bypass por nombre de rol.

E. Propietario ignora todas las denegaciones

❌ Descartada.

Las capacidades reservadas tendrán gobierno especial, no inmunidad general.

F. Utilizar wildcards

❌ Descartada.

Los permisos deben ser capacidades exactas.

G. Denegar por prefijo

❌ Descartada.

Los códigos no forman una jerarquía implícita.

H. Eliminar físicamente denegaciones vencidas

❌ Descartada.

Se perdería trazabilidad.

I. Permitir modificación silenciosa

❌ Descartada.

Los cambios deberán quedar versionados o auditados.

J. Evaluar denies únicamente en el frontend

❌ Descartada.

No protegería RPC, Server Actions ni RLS.

K. Utilizar service role para ignorar denies

❌ Descartada.

El proceso debe conservar el actor efectivo.

L. Crear un permiso universal de override

❌ Descartada.

Invalidaría el modelo de seguridad.

#### 96. Riesgos

⚠️ El modelo físico actual no distingue claramente excepciones individuales base y operativas.

⚠️ employee_permissions contiene datos redundantes y ningún caso real de deny.

⚠️ Las funciones actuales pueden asumir únicamente concesiones positivas.

⚠️ Algunas RLS usan comparaciones directas de roles y podrían ignorar denies.

⚠️ Los permisos globales actuales pueden hacer que una denegación territorial incompleta no produzca el resultado esperado.

⚠️ Una implementación incorrecta de especificidad podría permitir que un allow venza un deny.

⚠️ Las aplicaciones pueden conservar permisos en caché después de activar una restricción.

⚠️ Los procesos con service role pueden omitir al actor efectivo.

⚠️ Una denegación global mal configurada puede bloquear una operación completa.

⚠️ La administración de denies puede causar bloqueo organizacional si no existe un principal de recuperación.

⚠️ Las capacidades reservadas de propietario requieren un flujo de gobierno específico.

#### 97. Pendientes trasladados

AUTH-MOD-020

Documentar el modelo completo mediante ADR.

BLOQUE C

Clasificar cada permiso:

modalidad;
alcances admitidos;
prerrequisitos;
compatibilidad con denies;
sensibilidad.

BLOQUE D

Construir las matrices definitivas.

BLOQUE E

Implementar la decisión unificada de contexto y autorización.

VISO

Administrar:

allows;
denies;
vigencia;
motivos;
conflictos;
simulación;
auditoría.

Fase de implementación

Definir las estructuras físicas, funciones, RLS y migraciones.

No se realiza ninguna de estas acciones dentro de AUTH-MOD-019.

#### 98. Decisión final

DENEGACIÓN ESTRUCTURAL
→ bloquea toda autorización incompatible

DENEGACIÓN DE CARRIL
→ bloquea solamente base u operación

BLOQUEO INDIVIDUAL TRANSVERSAL
→ bloquea todos los carriles compatibles

ALLOW
→ solo autoriza si no existe un deny aplicable

Fórmula definitiva:

CONTEXTO VÁLIDO
+
PERMISO COMPATIBLE
+
ALLOW APLICABLE
+
SIN STRUCTURAL_DENY
+
SIN ACTOR_WIDE_DENY
+
SIN LANE_DENY APLICABLE
**=**
AUTORIZACIÓN POSIBLE

Precedencia:

STRUCTURAL_DENY
>
ACTOR_WIDE_DENY
>
LANE_DENY
>
ALLOW
>
DEFAULT_DENY

APROBADO
