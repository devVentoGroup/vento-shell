### ✅ AUTH-MOD-018 — Definir precedencia entre permisos base y operativos

#### 1. Problema que se resuelve

El modelo definitivo ya diferencia:

ROL BASE
→ responsabilidad laboral permanente

PERMISO BASE
→ capacidad administrativa, funcional o de configuración que no depende de un turno

ROL OPERATIVO
→ función temporal ejecutada durante un turno

PERMISO OPERATIVO
→ capacidad ejecutable únicamente dentro de un contexto operativo válido

Sin embargo, todavía debe definirse qué ocurre cuando una misma persona tiene simultáneamente:

un permiso procedente de su rol base;
un permiso procedente de su rol operativo;
una concesión individual;
un turno activo;
una sede activa;
un área activa;
un dispositivo compartido;
un recurso ubicado en una sede o área concreta.

El modelo actual puede producir interpretaciones incorrectas como:

más privilegios

o:

permiso base global
→ reemplaza cualquier requisito de turno

o:

turno activo
→ desactiva los permisos administrativos

o:

rol operativo
→ prevalece sobre el rol base

o:

rol base
→ prevalece siempre sobre el rol operativo

Todas estas interpretaciones generales son incorrectas.

#### 2. Decisión principal

No existirá una precedencia universal del tipo:

PERMISO BASE > PERMISO OPERATIVO

ni:

PERMISO OPERATIVO > PERMISO BASE

La precedencia dependerá del contrato canónico del permiso solicitado.

Cada permiso deberá declarar expresamente qué fuente de autorización puede satisfacerlo:

BASE_ONLY
OPERATIONAL_ONLY
BASE_OR_OPERATIONAL
BASE_AND_OPERATIONAL

La decisión no dependerá de:

qué función consultó primero la aplicación;
qué tabla contiene una fila;
qué permiso resulte más amplio;
qué rol tenga un nombre más importante;
si existe o no un turno;
si el frontend está mostrando una interfaz administrativa u operativa.

La clasificación del permiso será la autoridad.

#### 3. Regla central

PERMISO REQUERIDO
        ↓
CONTRATO DE AUTORIZACIÓN DEL PERMISO
        ↓
EVALUACIÓN BASE Y/O OPERATIVA
        ↓
COMBINACIÓN SEGÚN EL CONTRATO
        ↓
DECISIÓN FINAL

Un permiso base solo podrá autorizar una acción cuando el permiso admita autorización base.

Un permiso operativo solo podrá autorizar una acción cuando el permiso admita autorización operativa.

La existencia de una asignación en una matriz incompatible no concederá acceso.

#### 4. Carril de autorización base

El carril base representa autorización permanente o independiente del turno.

Podrá obtener concesiones desde:

employees.role
    ↓
role_permissions

employee_permissions
    ↓
concesiones individuales base

El carril base deberá validar:

actor autenticado;
empleado existente;
empleado activo;
aplicación activa;
permiso activo;
compatibilidad del permiso con autorización base;
asignación base válida;
alcance territorial correspondiente;
recurso real;
restricciones adicionales aplicables.

El carril base no deberá consultar un rol operativo para completar una autorización faltante.

#### 5. Carril de autorización operativa

El carril operativo representa autorización temporal dentro de una operación real.

Podrá obtener concesiones desde:

turno publicado y vigente
        ↓
check-in activo cuando sea requerido
        ↓
rol operativo activo
        ↓
operational_role_permissions

employee_permissions
        ↓
excepciones individuales operativas

El carril operativo deberá validar:

actor efectivo;
empleado activo;
permiso compatible con autorización operativa;
política operativa de la aplicación;
turno publicado y vigente cuando sea requerido;
check-in activo cuando sea requerido;
sede operativa;
área operativa;
rol operativo válido;
rol habilitado en la sede y área;
permiso operativo exacto;
recurso real;
coincidencia territorial;
dispositivo cuando aplique.

Una concesión operativa nunca creará por sí sola:

un turno;
un check-in;
una sede activa;
un área activa;
un rol operativo;
una sesión de actor.

#### 6. Fuente canónica de la modalidad

La modalidad no se inferirá desde la tabla donde aparezca la asignación.

Ejemplo incorrecto:

Existe en role_permissions
→ entonces es base

Ejemplo incorrecto:

Existe en operational_role_permissions
→ entonces es operativo

La regla correcta será:

CATÁLOGO DEL PERMISO
→ define modalidades admitidas

MATRIZ
→ asigna el permiso a un actor o plantilla

CONTEXTO
→ determina si puede utilizarse en la solicitud actual

Una fila ubicada en una matriz incompatible será:

CONFIGURACIÓN INVÁLIDA

No será una concesión adicional.

#### 7. Modalidad BASE_ONLY

Un permiso BASE_ONLY solo podrá ser satisfecho por el carril base.

Ejemplos conceptuales:

gestionar trabajadores;
administrar roles;
administrar permisos;
configurar aplicaciones;
gestionar catálogos organizacionales;
consultar información financiera corporativa;
administrar políticas globales.

Fórmula:

BASE_ALLOW VÁLIDO
**=**
AUTORIZAR

OPERATIONAL_ALLOW
**=**
IGNORAR PARA ESTA DECISIÓN

Aunque el trabajador tenga:

turno activo;
check-in activo;
rol operativo;
permiso operativo con el mismo código;

el permiso operativo no autorizará una capacidad BASE_ONLY.

#### 8. Modalidad OPERATIONAL_ONLY

Un permiso OPERATIONAL_ONLY solo podrá ser satisfecho por el carril operativo.

Ejemplos conceptuales:

operar caja;
preparar una remisión;
registrar tránsito;
recibir una remisión;
ejecutar producción;
retirar inventario;
registrar una recepción operativa;
realizar un cierre operativo.

Fórmula:

OPERATIONAL_ALLOW VÁLIDO
+
CONTEXTO OPERATIVO VÁLIDO
**=**
AUTORIZAR

BASE_ALLOW
**=**
IGNORAR PARA ESTA DECISIÓN

Un permiso base heredado de un oficio antiguo no podrá reemplazar:

el turno;
el check-in;
el rol operativo;
la sede activa;
el área activa.

#### 9. Modalidad BASE_OR_OPERATIONAL

Un permiso BASE_OR_OPERATIONAL podrá ser satisfecho por cualquiera de los dos carriles, siempre que uno de ellos produzca una autorización completa e independiente.

Fórmula:

BASE_DECISION = ALLOW
        OR
OPERATIONAL_DECISION = ALLOW
        ↓
AUTORIZAR

Esta modalidad es apropiada para capacidades que pueden utilizarse legítimamente desde dos contextos distintos.

Ejemplo conceptual:

Consultar remisiones

Gerente
→ consulta administrativa sin turno

Bodeguero
→ consulta operativa durante su turno

Cada carril conservará sus propias restricciones.

El permiso base no tomará prestado el turno operativo.

El permiso operativo no tomará prestado el alcance territorial base.

#### 10. Modalidad BASE_AND_OPERATIONAL

Un permiso BASE_AND_OPERATIONAL exigirá una autorización completa en ambos carriles.

Fórmula:

BASE_DECISION = ALLOW
+
OPERATIONAL_DECISION = ALLOW
**=**
AUTORIZAR

Será útil para acciones sensibles donde se requiera simultáneamente:

una responsabilidad administrativa permanente;
y participación operativa real.

Ejemplo conceptual:

Aprobar una variación sensible de producción

Permiso base:
production.variances.approve

Contexto operativo:
turno activo en el área de producción afectada

Si uno de los carriles falla:

BASE_ALLOW + OPERATIONAL_DENY
→ DENEGAR

BASE_DENY + OPERATIONAL_ALLOW
→ DENEGAR

La semántica específica de denegaciones explícitas se definirá en AUTH-MOD-019.

#### 11. No existe modalidad implícita

Un permiso sin clasificación canónica no será tratado automáticamente como:

base;
operativo;
híbrido;
administrativo;
global.

Regla:

authorization_requirement = null
→ DENEGAR

La ausencia de clasificación será una configuración incompleta.

No se adoptará como valor predeterminado:

BASE_OR_OPERATIONAL

porque sería la modalidad más permisiva.

#### 12. Clasificación única por permiso

Un mismo código de permiso deberá tener un contrato de autorización único dentro de su versión activa.

Ejemplo:

nexo.inventory.remissions.prepare
→ OPERATIONAL_ONLY

No podrá ocurrir que:

una ruta lo trate como operativo;
otra ruta lo trate como base;
una RPC lo trate como híbrido;
una política RLS lo trate como global.

Todas las superficies deberán consumir la misma clasificación.

#### 13. Capacidades administrativas y operativas diferentes

Cuando dos operaciones parecidas tengan requisitos distintos, deberán representarse mediante permisos diferentes o mediante una modalidad híbrida explícita.

Ejemplo:

nexo.inventory.remissions.view
→ BASE_OR_OPERATIONAL

nexo.inventory.remissions.prepare
→ OPERATIONAL_ONLY

nexo.inventory.remissions.configuration.manage
→ BASE_ONLY

No se utilizará un permiso general para conceder implícitamente todas las variantes.

#### 14. Los roles no compiten

El rol base y el rol operativo no son dos candidatos para convertirse en el “rol principal”.

Representan dimensiones distintas:

ROL BASE
→ qué responsabilidad permanente tiene la persona

ROL OPERATIVO
→ qué función está ejecutando ahora

Por tanto:

rol base activo
+
rol operativo activo
**=**
dos fuentes independientes de posibles permisos

No significa:

rol operativo reemplaza rol base

ni:

rol base reemplaza rol operativo

#### 15. El turno no desactiva permisos base

Cuando un trabajador inicia un turno:

PERMISOS BASE VÁLIDOS
→ permanecen disponibles

PERMISOS OPERATIVOS VÁLIDOS
→ se activan dentro del contexto del turno

Ejemplo:

Gerente con turno de gerencia_operativa

VISO · Administrar programación
→ puede continuar por autorización base

NEXO · Recibir remisiones
→ depende del permiso operativo y del contexto activo

El inicio de un turno no reduce automáticamente las responsabilidades administrativas del trabajador.

Las restricciones explícitas se definirán separadamente.

#### 16. El fin del turno no revoca permisos base

Cuando termina el turno, check-in o sesión operativa:

PERMISOS OPERATIVOS
→ dejan de estar disponibles

PERMISOS BASE
→ permanecen según su contrato y alcance

La revocación operativa no convertirá al trabajador en una identidad inactiva.

Solo elimina su contexto temporal.

#### 17. Un permiso base no crea contexto operativo

Aunque el permiso base tenga alcance:

global;
por sede;
por tipo de sede;
por área;
por tipo de área;

no podrá crear:

active_shift
active_checkin
active_operational_role
active_operational_site
active_operational_area

Ejemplo:

Rol base cocinero
+
permiso base nexo.inventory.remissions.request
+
sin turno
**=**
DENEGAR si el permiso es OPERATIONAL_ONLY

#### 18. Un permiso operativo no crea autoridad administrativa

Un trabajador podrá tener un permiso operativo válido sin obtener acceso a:

configurar el sistema;
modificar trabajadores;
administrar matrices;
gestionar roles;
consultar información organizacional completa.

Ejemplo:

bodeguero
+
nexo.inventory.stock
+
turno válido
**=**
consultar stock operativo autorizado

NO
**=**
administrar configuración global de inventario

#### 19. Concesiones positivas dentro de un mismo carril

Mientras no existan denegaciones explícitas aplicables, las concesiones positivas de un mismo carril se combinarán mediante unión.

Carril base:

ROLE_BASE_ALLOW
OR
EMPLOYEE_BASE_ALLOW
**=**
BASE_ALLOW

Carril operativo:

OPERATIONAL_ROLE_ALLOW
OR
EMPLOYEE_OPERATIONAL_ALLOW
**=**
OPERATIONAL_ALLOW

Una concesión individual podrá añadir una capacidad que no esté presente en la plantilla de rol correspondiente.

No deberá utilizarse para corregir de manera permanente una matriz general defectuosa.

#### 20. Una concesión más específica no restringe otra concesión

Ejemplo:

rol base
→ permiso global

excepción individual
→ mismo permiso en Vento Café

La excepción individual positiva no convertirá automáticamente el permiso global en un permiso limitado a Vento Café.

El resultado de dos concesiones positivas será:

ALCANCE GLOBAL
UNIÓN
ALCANCE VENTO CAFÉ
**=**
ALCANCE GLOBAL

Para retirar una parte del alcance se necesitará una denegación explícita.

Esa semántica corresponde a AUTH-MOD-019.

#### 21. No se combinarán fragmentos incompletos

En modalidad BASE_OR_OPERATIONAL, cada carril deberá producir por sí mismo una autorización completa.

Ejemplo inválido:

Carril base
→ contiene el permiso
→ pero no cubre la sede del recurso

Carril operativo
→ cubre la sede
→ pero no contiene el permiso

Resultado:
DENEGAR

No se permitirá:

acción obtenida del carril base
+
territorio obtenido del carril operativo
**=**
AUTORIZAR

Cada carril deberá validar integralmente:

permiso;
alcance;
recurso;
restricciones;
contexto requerido.

#### 22. Intersección en BASE_AND_OPERATIONAL

Cuando el permiso requiera ambos carriles, los dos deberán cubrir el mismo recurso objetivo.

Ejemplo:

Permiso base
→ válido para centros de producción

Permiso operativo
→ válido en Centro de Producción / Repostería

Recurso
→ lote de Centro de Producción / Repostería

Resultado
→ ambos carriles coinciden
→ AUTORIZAR

Si el recurso pertenece a otra sede o área:

uno de los carriles no coincide
→ DENEGAR

El alcance efectivo será la intersección:

BASE_SCOPE
∩
OPERATIONAL_SCOPE
∩
RESOURCE_SCOPE

#### 23. Unión en BASE_OR_OPERATIONAL

Cuando el permiso permita cualquiera de los carriles:

BASE_SCOPE
∪
OPERATIONAL_SCOPE

podrá producir acceso efectivo.

Sin embargo, para cada recurso concreto deberá existir al menos un carril que lo autorice completamente.

No se construirá una autorización mezclando partes de ambos.

#### 24. Precedencia del contrato sobre las matrices

Si un permiso es OPERATIONAL_ONLY y aparece en role_permissions:

asignación base encontrada
+
modalidad incompatible
**=**
NO AUTORIZA

La fila deberá clasificarse como:

legacy_assignment
incompatible_assignment
configuration_error

Si un permiso es BASE_ONLY y aparece en operational_role_permissions, se aplicará la misma regla.

Las matrices no podrán ampliar las modalidades permitidas por el catálogo.

#### 25. Permisos operativos con alcance global

Un permiso operativo marcado territorialmente como global no significará:

acceso a todos los recursos de la organización.

Significará:

la plantilla del rol puede reutilizarse
en cualquier contexto operativo válido
donde ese rol esté permitido

El límite máximo continuará siendo:

SEDE ACTIVA
+
ÁREA ACTIVA
+
ROL OPERATIVO
+
RECURSO REAL

Fórmula:

OPERATIONAL_PERMISSION_SCOPE_GLOBAL
∩
ACTIVE_OPERATIONAL_CONTEXT
**=**
CONTEXTO OPERATIVO ACTUAL

#### 26. Permisos base globales

Un permiso base global significará que la capacidad concreta no está limitada territorialmente.

No significará:

acceso a todos los permisos;
acceso a todas las aplicaciones;
bypass de turno;
bypass de check-in;
bypass de dispositivo;
capacidad operativa universal.

Ejemplo:

viso.staff.read
+
scope global
**=**
consultar trabajadores de toda la organización

NO
**=**
preparar remisiones sin turno

#### 27. Permisos por sede, tipo de sede, área y tipo de área

Los alcances aprobados en AUTH-MOD-013 a AUTH-MOD-017 se evaluarán dentro de cada carril de forma independiente.

Carril base:

PERMISO BASE
∩
ALCANCE BASE
∩
RECURSO REAL

Carril operativo:

PERMISO OPERATIVO
∩
ALCANCE DE LA ASIGNACIÓN
∩
SEDE Y ÁREA ACTIVAS
∩
RECURSO REAL

El carril operativo siempre estará limitado además por su contexto activo.

#### 28. Recurso real antes de combinar permisos

La autorización deberá resolver primero el recurso empresarial afectado.

Según la operación, deberá determinar:

resource_id
resource_site_id
resource_area_id
origin_site_id
origin_area_id
destination_site_id
destination_area_id

La decisión no se basará exclusivamente en:

sede seleccionada;
área seleccionada;
sede enviada por el cliente;
área enviada por el cliente;
rol indicado por el frontend.

Sin recurso resoluble:

resource_scope_unresolved
→ DENEGAR

#### 29. Acciones sin recurso territorial

Algunos permisos administrativos podrán aplicarse a recursos organizacionales sin sede o área.

Ejemplos conceptuales:

administrar aplicaciones;
gestionar permisos;
consultar catálogo organizacional;
administrar configuración global.

En esos casos, el contrato del permiso deberá declarar que no requiere alcance territorial.

No se asignará artificialmente una sede o área para poder autorizarlo.

#### 30. Acceso a la aplicación

El permiso:

`<app>.access`

también deberá declarar su modalidad.

Ejemplos conceptuales:

viso.access
→ BASE_ONLY

pulso.access
→ OPERATIONAL_ONLY

nexo.access
→ BASE_OR_OPERATIONAL

La clasificación definitiva de cada permiso corresponde al Bloque C.

Regla:

acceso a la aplicación
≠
autorización para ejecutar todas sus acciones

Cada acción sensible continuará exigiendo su permiso exacto.

#### 31. Permisos individuales base

Una concesión individual base podrá:

añadir una capacidad administrativa específica;
limitarse territorialmente;
tener vigencia;
tener justificación;
ser auditada.

No podrá:

crear un turno;
crear un rol operativo;
convertir un permiso operativo en permanente;
eliminar requisitos operativos del permiso.

La concesión deberá ser compatible con la modalidad del permiso.

#### 32. Permisos individuales operativos

Una concesión individual operativa podrá añadir una capacidad a un trabajador durante un contexto operativo válido.

Ejemplo conceptual:

Trabajador con rol cajero_satelite
+
excepción individual para delivery.override
+
turno válido en Caja
**=**
capacidad operativa adicional

La excepción no deberá reemplazar:

el turno;
el check-in;
la sede;
el área;
el rol operativo válido;
la política del dispositivo.

#### 33. Un trabajador sin rol operativo

Aunque el trabajador tenga una concesión individual operativa:

sin rol operativo activo
→ DENEGAR

La excepción individual suplementa la autorización del actor.

No crea la identidad funcional de la jornada.

#### 34. Rol operativo sin permisos

Si existe:

turno válido
+
rol operativo válido
+
0 permisos compatibles

el trabajador no obtendrá capacidades por inferencia.

Ejemplo:

servicio_salon
+
sin operational_role_permissions
**=**
sin permisos operativos

No se utilizará automáticamente el antiguo rol base mesero para completar la matriz.

#### 35. Gerentes y propietarios

Los nombres:

propietario
gerente_general
gerente

no crearán precedencia especial.

Sus capacidades dependerán de permisos base explícitos.

Para una acción OPERATIONAL_ONLY deberán cumplir el mismo contrato operativo que cualquier otro actor, salvo que exista una capacidad administrativa diferente diseñada expresamente para esa finalidad.

Regla:

ROL IMPORTANTE
≠
BYPASS OPERATIVO

#### 36. Gerencia operativa

Un trabajador con rol base administrativo podrá asumir un rol operativo como:

gerencia_operativa

durante un turno.

En ese caso:

permisos administrativos
→ proceden del carril base

permisos de ejecución diaria
→ proceden del carril operativo

No se duplicará artificialmente todo el conjunto administrativo dentro del rol operativo.

#### 37. Acciones administrativas sobre operación

Una acción administrativa relacionada con información operativa no se convierte automáticamente en una acción operativa.

Ejemplo:

Consultar todas las remisiones
→ puede ser BASE_ONLY o BASE_OR_OPERATIONAL

Preparar una remisión
→ puede ser OPERATIONAL_ONLY

Cancelar administrativamente una remisión
→ puede requerir un permiso base específico

La clasificación dependerá de la naturaleza de la capacidad, no del módulo donde aparezca.

#### 38. Acciones sensibles de doble condición

Una acción podrá requerir BASE_AND_OPERATIONAL cuando sea necesario comprobar:

responsabilidad permanente;
presencia operativa;
territorio actual;
recurso afectado.

Ejemplos conceptuales:

aprobar una diferencia durante un conteo;
autorizar un ajuste sensible dentro del área activa;
aprobar una recepción excepcional;
autorizar una anulación operativa durante el turno.

Esta modalidad deberá utilizarse de forma explícita y limitada.

#### 39. Permisos de emergencia

Una capacidad de emergencia no deberá implementarse convirtiendo un permiso operativo normal en BASE_OR_OPERATIONAL.

Ejemplo incorrecto:

inventory.remissions.prepare
→ permitido a gerentes sin turno

Modelo esperado:

inventory.remissions.prepare
→ OPERATIONAL_ONLY

inventory.remissions.emergency_override
→ BASE_ONLY o BASE_AND_OPERATIONAL

La acción excepcional deberá:

tener un permiso diferente;
exigir justificación;
ser auditada;
tener controles adicionales;
no convertirse en bypass general de la aplicación.

#### 40. Dispositivos compartidos

La identidad técnica del dispositivo no tendrá permisos base laborales.

La autorización procederá del actor humano efectivo.

Fórmula:

USUARIO TÉCNICO DEL DISPOSITIVO
+
SESIÓN DE ACTOR
+
PERMISOS DEL ACTOR
+
POLÍTICA DEL DISPOSITIVO
**=**
AUTORIZACIÓN POSIBLE

El dispositivo podrá restringir:

aplicaciones;
acciones;
sede;
área;
rol operativo;
duración;
modalidad admitida.

El dispositivo nunca ampliará los permisos del actor.

#### 41. Permisos base en dispositivos compartidos

Un actor administrativo no obtendrá automáticamente todas sus capacidades base en cualquier terminal compartida.

La decisión también deberá respetar la política del dispositivo.

Ejemplo:

Gerente con permiso VISO
+
terminal exclusiva de caja
**=**
VISO no disponible si el dispositivo no permite esa aplicación

Fórmula:

ACTOR_PERMISSION
∩
DEVICE_CAPABILITIES

#### 42. Permisos operativos en dispositivos compartidos

Una acción operativa desde un dispositivo compartido requerirá:

actor válido;
sesión de actor vigente;
turno válido;
check-in cuando aplique;
rol operativo válido;
sede coincidente;
área coincidente;
permiso operativo;
aplicación permitida;
acción permitida por el dispositivo.

El permiso base del usuario técnico nunca sustituirá estas validaciones.

#### 43. Simulación

La simulación podrá calcular por separado:

BASE_DECISION
OPERATIONAL_DECISION
COMBINED_DECISION

Podrá mostrar:

permisos obtenidos por rol base;
permisos obtenidos por rol operativo;
excepciones individuales;
alcances efectivos;
modalidad requerida;
motivos de bloqueo.

No podrá:

crear un turno real;
crear un check-in;
activar permisos;
modificar la decisión real;
persistir una sesión operativa real;
atribuir acciones simuladas al trabajador.

#### 44. Sede seleccionada y área seleccionada

La sede o área seleccionada en la interfaz podrán determinar qué información intenta consultar el usuario.

No determinarán qué permisos posee.

Regla:

selected_site_id
selected_area_id
→ contexto de navegación

NO
→ fuente de autorización

Cada carril deberá validar el recurso real contra sus alcances.

#### 45. Contexto operativo y selección administrativa

Un trabajador podrá tener simultáneamente:

sede administrativa seleccionada
→ Vento Group

sede operativa activa
→ Vento Café

área operativa activa
→ Caja

Las autorizaciones base podrán utilizar el recurso administrativo solicitado y sus alcances.

Las autorizaciones operativas deberán permanecer limitadas al contexto del turno.

No se reemplazará una sede por otra para hacer coincidir artificialmente el permiso.

#### 46. Cambios de rol base durante una sesión

Cuando cambie el rol base del trabajador:

permisos base
→ deberán reevaluarse

contexto operativo
→ no cambia automáticamente de rol

El turno conserva su rol operativo mientras continúe siendo válido.

Sin embargo, si el cambio implica:

desactivación;
inhabilitación laboral;
restricción de seguridad;
incompatibilidad explícita;

la sesión correspondiente deberá invalidarse según las políticas definitivas.

#### 47. Cambios de rol operativo durante el turno

El rol operativo no deberá cambiar silenciosamente dentro de una sesión activa.

Un cambio deberá:

cerrar o invalidar el contexto anterior;
crear un nuevo contexto verificable;
registrar la transición;
reevaluar permisos operativos;
mantener trazabilidad.

Los permisos base permanecerán sujetos al rol base vigente.

#### 48. Cambios en matrices de permisos

Cuando se retire o agregue una asignación:

role_permissions
employee_permissions
operational_role_permissions

la siguiente decisión deberá utilizar la matriz vigente.

Un snapshot de turno o sesión no congelará indefinidamente las concesiones de permiso.

La sesión podrá conservar:

actor;
turno;
rol operativo;
sede;
área;
inicio;
expiración.

Pero las capacidades sensibles deberán reevaluarse.

#### 49. Empleado inactivo

La desactivación del trabajador tendrá precedencia sobre ambos carriles.

employee.is_active = false
→ BASE_DENY
→ OPERATIONAL_DENY
→ DECISIÓN FINAL: DENEGAR

No importa que existan:

permisos base;
permisos individuales;
turno activo;
check-in abierto;
sesión en dispositivo;
rol operativo;
simulación.

#### 50. Aplicación o permiso inactivo

Si la aplicación o el permiso está inactivo:

app inactive
OR
permission inactive
→ DENEGAR EN TODOS LOS CARRILES

Una asignación histórica no reactivará la capacidad.

#### 51. Código de rol coincidente en ambos catálogos

El caso actual:

public.roles.code = bodeguero
public.operational_roles.code = bodeguero

no permitirá inferir que se trata del mismo origen de autorización.

La fuente deberá conservarse explícitamente:

base_role:bodeguero
operational_role:bodeguero

El código textual no determinará precedencia.

La coincidencia del nombre tampoco permitirá reutilizar automáticamente una matriz en la otra.

#### 52. Oficios operativos heredados en roles base

Los roles base heredados:

barista
bodeguero
cajero
cocinero
conductor
mesero
panadero
pastelero
repostero

podrán conservarse temporalmente por compatibilidad de datos.

Sin embargo, sus permisos base no autorizarán acciones clasificadas como OPERATIONAL_ONLY.

Regla de transición:

PERMISO OPERATIVO HEREDADO EN ROLE_PERMISSIONS
+
CONTRATO OPERATIONAL_ONLY
**=**
IGNORAR LA ASIGNACIÓN BASE

Esto evita que el modelo antiguo continúe concediendo acceso permanente.

#### 53. Funciones actuales separadas

Actualmente existen caminos distintos:

has_permission
→ carril base

has_operational_permission
→ carril operativo

El problema no es únicamente que sean funciones separadas.

El problema es que cada aplicación decide cuál llamar.

Modelo definitivo:

SOLICITUD DE AUTORIZACIÓN
        ↓
PERMISO CANÓNICO
        ↓
MODALIDAD REQUERIDA
        ↓
EVALUACIÓN DE CARRILES NECESARIOS
        ↓
DECISIÓN ÚNICA

El consumidor no deberá escoger libremente el carril más conveniente.

#### 54. Evaluación base

La evaluación base deberá producir un resultado estructurado.

BasePermissionDecision
├── employee_id
├── permission_code
├── assignment_source
├── base_role
├── matched_assignment
├── assignment_scope
├── target_resource
├── target_site_id
├── target_area_id
├── matched_allow
├── matched_deny
├── blocked_reasons
└── decision

matched_deny queda reservado para las reglas de AUTH-MOD-019.

#### 55. Evaluación operativa

La evaluación operativa deberá producir un resultado estructurado.

OperationalPermissionDecision
├── employee_id
├── permission_code
├── shift_id
├── checkin_id
├── operational_role
├── operational_site_id
├── operational_area_id
├── device_id
├── actor_session_id
├── assignment_source
├── matched_assignment
├── target_resource
├── target_site_id
├── target_area_id
├── matched_allow
├── matched_deny
├── blocked_reasons
└── decision

#### 56. Decisión combinada

EffectiveAuthorizationDecision
├── employee_id
├── auth_user_id
├── app_code
├── permission_code
├── authorization_requirement
├── target_resource
├── base_decision
├── operational_decision
├── combination_operator
├── matched_sources
├── effective_site_ids
├── effective_area_ids
├── explicit_deny
├── blocked_reasons
└── decision

Operadores permitidos:

BASE_ONLY
OPERATIONAL_ONLY
BASE_OR_OPERATIONAL
BASE_AND_OPERATIONAL

#### 57. Tabla de decisión positiva

La siguiente tabla supone que no existe una denegación explícita aplicable.

| Requisito            | Base        | Operativo   | Resultado |
| -------------------- | ----------- | ----------- | --------- |
| BASE_ONLY            | Allow       | No evaluado | Allow     |
| BASE_ONLY            | Deny        | Allow       | Deny      |
| OPERATIONAL_ONLY     | Allow       | Deny        | Deny      |
| OPERATIONAL_ONLY     | No evaluado | Allow       | Allow     |
| BASE_OR_OPERATIONAL  | Allow       | Deny        | Allow     |
| BASE_OR_OPERATIONAL  | Deny        | Allow       | Allow     |
| BASE_OR_OPERATIONAL  | Allow       | Allow       | Allow     |
| BASE_OR_OPERATIONAL  | Deny        | Deny        | Deny      |
| BASE_AND_OPERATIONAL | Allow       | Allow       | Allow     |
| BASE_AND_OPERATIONAL | Allow       | Deny        | Deny      |
| BASE_AND_OPERATIONAL | Deny        | Allow       | Deny      |
| BASE_AND_OPERATIONAL | Deny        | Deny        | Deny      |

La evaluación de denegaciones explícitas se superpondrá en AUTH-MOD-019.

#### 58. Orden canónico de evaluación

La evaluación seguirá este orden:

identificar principal autenticado;
resolver actor efectivo;
validar empleado existente;
validar empleado activo;
validar aplicación existente y activa;
validar permiso existente y activo;
obtener modalidad canónica del permiso;
validar que la modalidad esté definida;
resolver recurso real;
resolver sede y área reales;
validar dispositivo cuando aplique;
evaluar carril base cuando sea requerido;
resolver contexto operativo cuando sea requerido;
evaluar carril operativo cuando sea requerido;
verificar compatibilidad de asignaciones;
combinar decisiones según el operador;
aplicar la fase de denegaciones explícitas;
producir decisión final;
registrar auditoría.

La fase 17 se definirá completamente en AUTH-MOD-019.

#### 59. Ausencia de contexto operativo

| Requisito            | Sin turno/contexto     | Resultado posible        |
| -------------------- | ---------------------- | ------------------------ |
| BASE_ONLY            | No afecta              | Puede autorizar por base |
| OPERATIONAL_ONLY     | Contexto requerido     | Denegar                  |
| BASE_OR_OPERATIONAL  | Puede usar carril base | Depende del permiso base |
| BASE_AND_OPERATIONAL | Falta un carril        | Denegar                  |

Un turno no será exigido indiscriminadamente a todas las capacidades.

#### 60. Check-in

El check-in solo será exigido cuando:

la política de la aplicación;
el permiso;
el rol operativo;
el tipo de operación;

lo requieran.

Un permiso base no requerirá check-in solamente por pertenecer a una aplicación híbrida.

Un permiso operativo no podrá omitirlo cuando su política lo exija.

#### 61. Turno activo sin check-in

Podrán existir permisos operativos cuya política requiera turno pero no check-in.

Ejemplo conceptual:

consultar instrucciones previas del turno.

También podrán existir permisos que requieran ambos:

turno activo
+
check-in activo

La modalidad OPERATIONAL_ONLY no define por sí sola si se necesita check-in.

Ese requisito deberá formar parte de la política del permiso o aplicación.

#### 62. Operaciones con varios recursos

Una acción que afecte:

origen;
destino;
varias sedes;
varias áreas;
varios productos;
varios documentos;

deberá validar todos los recursos involucrados.

En BASE_OR_OPERATIONAL no será válido:

origen autorizado por base
+
destino autorizado por operación
**=**
acción completa autorizada

salvo que el contrato específico de la acción permita expresamente carriles diferentes por lado.

La regla predeterminada será:

un mismo carril completo
debe autorizar toda la operación

En BASE_AND_OPERATIONAL, ambos carriles deberán autorizar todos los recursos requeridos.

#### 63. Navegación

La navegación podrá habilitarse mediante cualquiera de las modalidades definidas para el permiso de entrada.

La interfaz deberá conservar el origen de autorización.

Ejemplo:

NEXO

[ Administración ]
Permisos permanentes
Sedes autorizadas: todas las asignadas

[ Operación activa ]
Vento Café
Área: Caja
Rol: cajero_satelite
Vigencia: hasta cierre del turno

No deberá mostrarse un único contexto fusionado que oculte si la capacidad procede del carril base u operativo.

#### 64. Cómo se verá en VISO

Permiso
NEXO · Preparar remisiones

Modalidad de autorización
○ Solo base
● Solo operativa
○ Base u operativa
○ Base y operativa

Requisitos operativos
● Turno activo
● Check-in activo
● Sede coincidente
● Área coincidente
● Rol operativo válido

Asignaciones detectadas

⚠️ Rol base: bodeguero
Asignación incompatible con la modalidad operativa.
No concederá acceso permanente.

✅ Rol operativo: bodeguero
Concesión válida durante contexto operativo.

Otro ejemplo:

Permiso
NEXO · Consultar remisiones

Modalidad
● Base u operativa

Carril base
✅ gerente_general
Alcance: global

Carril operativo
✅ bodeguero
Alcance máximo: sede y área activas

Resultado
El permiso puede obtenerse por cualquiera de los dos carriles,
pero cada decisión conserva su propio alcance.

#### 65. Indicadores de origen

VISO y las herramientas de auditoría deberán distinguir:

BASE_ROLE
BASE_EMPLOYEE_EXCEPTION
OPERATIONAL_ROLE
OPERATIONAL_EMPLOYEE_EXCEPTION

No se mostrará simplemente:

Tiene permiso

Deberá mostrarse:

Tiene permiso por:
rol base gerente

o:

rol operativo bodeguero
durante turno activo

#### 66. Guards

Los guards no deberán permitir que el consumidor seleccione arbitrariamente la modalidad.

Ejemplo conceptual incorrecto:

requirePermission(permission, "base")

cuando el permiso es operativo.

El guard deberá:

recibir el permiso y recurso;
consultar la clasificación canónica;
resolver los carriles requeridos;
producir una decisión única.

Podrán existir interfaces especializadas para claridad, pero todas deberán consumir el mismo contrato.

#### 67. RPC

Toda RPC empresarial deberá validar:

actor efectivo;
empleado activo;
permiso exacto;
modalidad canónica;
recurso real;
alcance real;
carriles requeridos;
contexto operativo cuando aplique;
dispositivo cuando aplique;
decisión combinada.

No podrá autorizar mediante:

has_permission(...) OR has_operational_permission(...)

sin comprobar primero que el permiso sea BASE_OR_OPERATIONAL.

Tampoco podrá exigir ambos indiscriminadamente si el permiso no es BASE_AND_OPERATIONAL.

#### 68. RLS

Las políticas RLS deberán aplicar la misma clasificación.

Una política no deberá permitir acceso porque:

el rol base coincide;
el rol operativo coincide;
el trabajador está en la sede;
el usuario tiene un turno;
la aplicación lo dejó navegar.

Deberá evaluar la autorización efectiva correspondiente al permiso concreto.

Las políticas no podrán inventar una precedencia distinta a la utilizada por RPC y guards.

#### 69. Auditoría

Cada decisión deberá registrar al menos:

employee_id
auth_user_id
effective_actor_type
app_code
permission_code
authorization_requirement
resource_type
resource_id
resource_site_id
resource_area_id

base_evaluated
base_decision
base_assignment_source
base_role
base_scope

operational_evaluated
operational_decision
shift_id
checkin_id
operational_role
operational_site_id
operational_area_id
operational_assignment_source

device_id
actor_session_id

combination_operator
explicit_deny
blocked_reasons
final_decision
occurred_at

Esto permitirá determinar exactamente por qué una acción fue autorizada.

#### 70. Caché y estado local

Las aplicaciones podrán conservar temporalmente decisiones para presentación.

No deberán asumir que un permiso continúa válido después de:

cambio de rol base;
cambio de matriz;
cambio de turno;
check-out;
cambio de área;
cambio de sede;
cierre de sesión de actor;
desactivación del empleado;
desactivación del permiso;
desactivación de la aplicación.

Las acciones sensibles deberán validar la decisión vigente en la fuente de verdad.

#### 71. Códigos de bloqueo

authorization_requirement_missing
authorization_requirement_invalid
base_authorization_not_supported
operational_authorization_not_supported
base_assignment_not_found
operational_assignment_not_found
base_assignment_incompatible
operational_assignment_incompatible
base_scope_not_matched
operational_scope_not_matched
operational_context_required
operational_context_invalid
operational_shift_required
operational_checkin_required
operational_role_required
operational_role_invalid
operational_site_mismatch
operational_area_mismatch
device_policy_mismatch
resource_scope_unresolved
base_or_operational_not_satisfied
base_and_operational_base_missing
base_and_operational_context_missing
base_and_operational_not_satisfied
employee_inactive
app_inactive
permission_inactive
explicit_deny

Los códigos específicos de denegación se ampliarán en AUTH-MOD-019.

#### 72. Comportamiento ante datos ausentes

| Situación                                      | Resultado                |
| ---------------------------------------------- | ------------------------ |
| Actor no autenticado                           | Denegar                  |
| Actor efectivo no resoluble                    | Denegar                  |
| Empleado inexistente                           | Denegar                  |
| Empleado inactivo                              | Denegar                  |
| Aplicación inexistente                         | Denegar                  |
| Aplicación inactiva                            | Denegar                  |
| Permiso inexistente                            | Denegar                  |
| Permiso inactivo                               | Denegar                  |
| Modalidad ausente                              | Denegar                  |
| Modalidad inválida                             | Denegar                  |
| Recurso requerido no resoluble                 | Denegar                  |
| Asignación en matriz incompatible              | Ignorar y reportar       |
| Permiso base ausente en BASE_ONLY              | Denegar                  |
| Contexto ausente en OPERATIONAL_ONLY           | Denegar                  |
| Ambos carriles ausentes en BASE_OR_OPERATIONAL | Denegar                  |
| Un carril ausente en BASE_AND_OPERATIONAL      | Denegar                  |
| Rol operativo inválido                         | Denegar carril operativo |
| Alcance base no coincidente                    | Denegar carril base      |
| Alcance operativo no coincidente               | Denegar carril operativo |
| Dispositivo incompatible                       | Denegar                  |
| Denegación explícita aplicable                 | Según AUTH-MOD-019       |

#### 73. Bypass permitidos

| Caso                                      | Permitido |
| ----------------------------------------- | --------- |
| Propietario por nombre de rol             | ❌         |
| Gerente general por nombre                | ❌         |
| Gerente por nombre                        | ❌         |
| Permiso base para acción OPERATIONAL_ONLY | ❌         |
| Permiso operativo para acción BASE_ONLY   | ❌         |
| Turno activo como reemplazo del permiso   | ❌         |
| Check-in como reemplazo del permiso       | ❌         |
| Rol operativo como reemplazo del permiso  | ❌         |
| Permiso global como bypass operativo      | ❌         |
| Sede seleccionada como autoridad          | ❌         |
| Área seleccionada como autoridad          | ❌         |
| Usuario técnico del dispositivo           | ❌         |
| Service role genérico                     | ❌         |
| Proceso técnico exacto y controlado       | ✅         |
| Migración controlada                      | ✅         |
| Auditoría histórica autorizada            | ✅         |
| Capacidad de emergencia explícita         | ✅         |

Una capacidad de emergencia deberá usar un permiso específico.

#### 74. Impacto por aplicación

VISO

Predominarán permisos BASE_ONLY.

VISO administrará:

trabajadores;
roles;
permisos;
turnos;
perfiles;
políticas;
simulaciones.

La simulación podrá evaluar permisos operativos, pero no activarlos.

ANIMA

Las capacidades administrativas de programación podrán ser base.

Las acciones personales de entrada y salida dependerán de elegibilidad y contexto laboral, no de convertir todos los permisos en operativos.

NEXO

Será una aplicación híbrida.

Podrá contener:

BASE_ONLY
→ configuración y administración

OPERATIONAL_ONLY
→ ejecución logística

BASE_OR_OPERATIONAL
→ consultas válidas en ambos contextos

BASE_AND_OPERATIONAL
→ acciones sensibles específicas
FOGO

La ejecución de producción será principalmente operativa.

La gestión de recetas, configuración y supervisión podrá ser base.

ORIGO

La gestión de proveedores y configuración podrá ser base.

La recepción física y operaciones de inventario podrán ser operativas.

PULSO

La operación normal de caja será operativa.

Las capacidades excepcionales deberán tener permisos específicos.

NUMERA

La mayoría de capacidades financieras serán base.

Una operación financiera vinculada a caja o cierre podrá requerir contexto operativo o doble condición.

SHELL

El acceso al hub será base o dependerá del contrato explícito de navegación.

El hub no concederá permisos dentro de las aplicaciones.

#### 75. Ejemplos de decisión

Caso A — Cajero sin turno
Rol base:
cajero

Permiso solicitado:
pulso.pos.main

Modalidad:
OPERATIONAL_ONLY

Turno:
ausente

Resultado:
❌ DENEGAR

Aunque exista una asignación heredada en role_permissions.

Caso B — Cajero en turno válido
Rol operativo:
cajero_satelite

Sede:
Vento Café

Área:
Caja

Permiso:
pulso.pos.main

Modalidad:
OPERATIONAL_ONLY

Resultado:
✅ AUTORIZAR
Caso C — Gerente consulta remisiones
Permiso:
nexo.inventory.remissions.view

Modalidad:
BASE_OR_OPERATIONAL

Permiso base:
válido

Turno:
ausente

Resultado:
✅ AUTORIZAR POR CARRIL BASE
Caso D — Gerente prepara remisión sin turno
Permiso:
nexo.inventory.remissions.prepare

Modalidad:
OPERATIONAL_ONLY

Permiso base heredado:
presente

Contexto operativo:
ausente

Resultado:
❌ DENEGAR
Caso E — Gerente operativo prepara remisión
Rol base:
gerente_general

Rol operativo:
gerencia_operativa

Turno:
válido

Check-in:
válido

Permiso operativo:
válido

Resultado:
✅ AUTORIZAR POR CARRIL OPERATIVO

El rol base no es la causa de autorización.

Caso F — Acción de doble condición
Permiso:
inventory.variances.sensitive_approve

Modalidad:
BASE_AND_OPERATIONAL

Base:
permiso de aprobación válido

Operación:
turno válido en el área afectada

Resultado:
✅ AUTORIZAR

Sin cualquiera de los dos:

❌ DENEGAR

#### 76. Relación con AUTH-MOD-019

AUTH-MOD-018 define:

qué carriles existen;
qué modalidades puede requerir un permiso;
cómo se combinan concesiones positivas;
cómo se comportan los alcances;
qué ocurre con asignaciones incompatibles;
cómo se obtiene una decisión combinada.

AUTH-MOD-019 definirá:

denegaciones individuales;
denegaciones por rol;
denegaciones operativas;
precedencia entre denegaciones y concesiones;
especificidad territorial;
vigencia;
conflictos entre varias denegaciones;
efecto de una denegación en permisos híbridos;
reglas de auditoría de denegaciones.

No se aprueba todavía una jerarquía completa de deny.

#### 77. Invariantes

El rol base y el rol operativo representan dimensiones distintas.
Ninguno reemplaza universalmente al otro.
No existe precedencia general base sobre operación.
No existe precedencia general operación sobre base.
El contrato del permiso define los carriles admitidos.
Todo permiso debe tener una modalidad explícita.
Un permiso sin modalidad se deniega.
Las matrices no definen la modalidad.
Una asignación incompatible no concede acceso.
BASE_ONLY ignora concesiones operativas.
OPERATIONAL_ONLY ignora concesiones base.
BASE_OR_OPERATIONAL exige un carril completo.
BASE_AND_OPERATIONAL exige ambos carriles completos.
No se combinan fragmentos parciales de carriles distintos.
Los permisos positivos de un mismo carril se unen.
Una concesión más específica no restringe otra más amplia.
Las restricciones requieren una denegación explícita.
Los permisos base no crean contexto operativo.
Los permisos operativos no crean autoridad administrativa.
El turno no desactiva permisos base.
El cierre del turno revoca el carril operativo.
La desactivación del empleado revoca ambos carriles.
El permiso operativo global continúa limitado por el contexto activo.
El permiso base global no es un bypass operativo.
El recurso real determina el alcance aplicable.
La sede seleccionada no concede autorización.
El área seleccionada no concede autorización.
El dispositivo restringe; nunca amplía.
La identidad técnica no hereda permisos laborales.
La simulación no concede autorización real.
Un rol operativo sin permisos no obtiene capacidades inferidas.
Un oficio legacy no mantiene acceso operativo permanente.
La coincidencia textual de roles no fusiona matrices.
Las acciones excepcionales utilizan permisos específicos.
Guards, RPC y RLS aplican la misma modalidad.
No existe bypass por nombre de rol.
La autorización se deniega por defecto.
Supabase conserva la fuente de verdad.
Toda decisión identifica el carril que la autorizó.
Toda decisión sensible queda auditada.

#### 78. Alternativas descartadas

A. El permiso base siempre gana

❌ Descartada.

Permitiría que antiguos oficios operativos eviten turno y check-in.

B. El permiso operativo siempre gana

❌ Descartada.

Podría desactivar o reemplazar incorrectamente responsabilidades administrativas.

C. Sumar todas las matrices

❌ Descartada.

Convertiría la autorización en acumulación indiscriminada de privilegios.

D. Utilizar únicamente el rol base

❌ Descartada.

No representa la función temporal del trabajador.

E. Utilizar únicamente el rol operativo

❌ Descartada.

No representa responsabilidades permanentes ni administrativas.

F. Considerar híbridos todos los permisos

❌ Descartada.

Permitiría ejecutar acciones operativas sin contexto.

G. Inferir modalidad desde la tabla

❌ Descartada.

La ubicación actual contiene datos heredados e inconsistentes.

H. Inferir modalidad desde la aplicación

❌ Descartada.

NEXO, ORIGO y otras aplicaciones son híbridas.

I. Inferir modalidad desde el nombre del rol

❌ Descartada.

Los nombres no representan una política de autorización.

J. Permitir que el frontend elija el carril

❌ Descartada.

Un cliente podría seleccionar la evaluación más permisiva.

K. Combinar acción base con territorio operativo

❌ Descartada.

Cada carril debe producir una autorización completa.

L. Utilizar un permiso normal como bypass de emergencia

❌ Descartada.

Las excepciones sensibles necesitan capacidades distintas y auditables.

#### 79. Riesgos

⚠️ Permisos sin clasificación

El catálogo actual no declara formalmente la modalidad de cada permiso.

⚠️ Roles base operativos heredados

Todavía contienen asignaciones que podrían ser interpretadas como permanentes.

⚠️ Funciones separadas

Las aplicaciones pueden continuar seleccionando el camino de autorización incorrecto.

⚠️ Permisos duplicados

El mismo código puede aparecer en ambas matrices sin que actualmente exista una modalidad explícita.

⚠️ Excepciones individuales

La tabla actual no diferencia claramente excepciones base y operativas.

⚠️ Aplicaciones híbridas

NEXO, ORIGO y posiblemente NUMERA necesitan clasificaciones por capacidad, no por aplicación completa.

⚠️ Dispositivos compartidos

La identidad técnica podría continuar utilizándose como actor si no se implementa la sesión humana.

⚠️ Alcances legacy

Una asignación global existente puede seguir siendo interpretada incorrectamente por funciones antiguas.

⚠️ Caché frontend

La interfaz puede conservar permisos operativos después de terminar el turno.

⚠️ RLS heredada

Algunas políticas pueden seguir consultando directamente roles o sedes sin usar la decisión canónica.

⚠️ Denegaciones

La precedencia completa de restricciones todavía depende de AUTH-MOD-019.

#### 80. Pendientes trasladados

AUTH-MOD-019

Definir reglas de denegación explícita.

AUTH-MOD-020

Documentar todo el modelo mediante ADR.

BLOQUE C

Clasificar cada permiso como:

BASE_ONLY
OPERATIONAL_ONLY
BASE_OR_OPERATIONAL
BASE_AND_OPERATIONAL

y definir sus requisitos adicionales.

BLOQUE D

Construir matrices base y operativas compatibles con la clasificación.

Fase de implementación

Consolidar la evaluación en funciones, guards, RPC y RLS.

No se realiza ninguna de estas implementaciones durante AUTH-MOD-018.

#### 81. Decisión final

PERMISO BASE
NO PREVALECE AUTOMÁTICAMENTE
SOBRE PERMISO OPERATIVO

PERMISO OPERATIVO
NO PREVALECE AUTOMÁTICAMENTE
SOBRE PERMISO BASE

EL CONTRATO DEL PERMISO
DEFINE QUÉ CARRIL O CARRILES
DEBEN AUTORIZAR LA ACCIÓN

Fórmula definitiva:

ACTOR VÁLIDO
+
APLICACIÓN ACTIVA
+
PERMISO ACTIVO
+
MODALIDAD CANÓNICA
+
RECURSO REAL
+
EVALUACIÓN BASE CUANDO APLIQUE
+
EVALUACIÓN OPERATIVA CUANDO APLIQUE
+
COMBINACIÓN SEGÚN EL CONTRATO
+
SIN RESTRICCIÓN SUPERIOR
**=**
DECISIÓN FINAL

Representación:

                    ┌────────────────────┐
                    │ PERMISO SOLICITADO │
                    └─────────┬──────────┘
                              │
                    Modalidad canónica
                              │
       ┌──────────────────────┼──────────────────────┐
       │                      │                      │
   BASE_ONLY          OPERATIONAL_ONLY       HÍBRIDO OR / AND
       │                      │                      │
Carril base válido    Carril operativo       Evaluar ambos
       │                      │                      │
       └──────────────────────┴──────────────────────┘
                              │
                    DECISIÓN COMBINADA

aprobada

