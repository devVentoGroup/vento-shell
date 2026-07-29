### SECCIÓN — ALCANCES

<!-- PLAN-SECTION-META:START -->
Esta sección reúne contenido canónico con una responsabilidad documental única dentro del plan. Debe conservarse cohesionada y actualizarse junto con sus referencias y validaciones dependientes.

**Cobertura canónica:** `AUTH-MOD-013` a `AUTH-MOD-017` — 5 tareas.
<!-- PLAN-SECTION-META:END -->

### ✅ AUTH-MOD-013 — Definir permisos globales

La auditoría encontró que 503 de las 613 filas actuales de role_permissions usan alcance global. También detectó que gerente, auxiliar_administrativa y contador poseen actualmente conjuntos completos de permisos globales que no corresponden necesariamente con su responsabilidad real.

#### 1. Problema que se resuelve

Actualmente:

scope_type = global

puede interpretarse erróneamente como:

acceso total;
bypass de seguridad;
acceso a cualquier sede;
acceso a cualquier aplicación;
acceso a cualquier permiso;
acceso sin contexto;
acceso a todas las filas de una tabla;
acceso operativo sin turno;
rol administrativo global.

Estas interpretaciones son incorrectas.

También existen problemas concretos:

gerente
→ 115 permisos globales

auxiliar_administrativa
→ 40 permisos globales

contador
→ 33 permisos globales

El alcance global está siendo utilizado en exceso y, en algunos casos, como sustituto de una definición territorial correcta.

#### 2. Decisión principal

Un permiso global será una autorización explícita para ejecutar una capacidad concreta dentro de todo el ámbito organizacional ordinario de Vento.

Fórmula
PERMISO CONCRETO
+
ALCANCE GLOBAL
**=**
CAPACIDAD CONCRETA EN TODA LA ORGANIZACIÓN

No significa:

TODOS LOS PERMISOS
+
TODOS LOS RECURSOS
+
TODOS LOS ENTORNOS
Ejemplo
contador
+
numera.reports.view
+
scope = global

significa:

puede consultar los reportes autorizados
de todas las sedes ordinarias de Vento

No significa:

puede administrar NUMERA;
puede modificar gastos;
puede administrar trabajadores;
puede cambiar permisos;
puede ejecutar cualquier acción global.

#### 3. Definición canónica

GLOBAL
**=**
sin restricción territorial ordinaria
dentro del dominio exacto del permiso

El alcance global elimina restricciones de:

sede específica;
tipo de sede;
área específica;
tipo de área.

Pero mantiene todas las demás restricciones:

identidad;
estado del empleado;
aplicación;
permiso exacto;
tipo de acción;
tipo de recurso;
clasificación del recurso;
modo administrativo u operativo;
restricciones del dispositivo;
denegaciones aplicables;
aislamiento de entornos;
reglas especiales de seguridad.

#### 4. Límite organizacional

El término global será relativo a:

la organización Vento

No será relativo a:

toda la base de datos;
todos los tenants futuros;
todos los entornos;
todos los usuarios de Supabase;
todos los clientes;
todos los registros técnicos.
Regla
global
≠ universal

El permiso global se aplica únicamente dentro del límite organizacional definido para la autorización.

#### 5. Ámbito ordinario de la organización

Un permiso global podrá alcanzar:

Vento Group;
Vento Café;
Saudo;
Centro de Producción;
Centro de Distribución;
Molka;
otras sedes operativas normales;
áreas pertenecientes a esas sedes;
recursos organizacionales sin sede concreta.

Siempre que:

el permiso sea válido para ese tipo de recurso;
la sede esté activa;
el recurso pertenezca al entorno productivo ordinario;
no exista una exclusión explícita.

#### 6. Exclusiones obligatorias

El alcance global no atravesará automáticamente:

APP-REVIEW;
sedes demo;
entornos de pruebas;
datos sintéticos aislados;
espacios técnicos;
registros de otras organizaciones;
secretos;
credenciales;
tokens;
configuración interna de infraestructura;
recursos archivados restringidos;
datos segregados por obligación legal;
información fuera del dominio de la aplicación.
Regla
scope = global
+
resource = isolated
**=**
DENEGAR

salvo que exista una autorización explícita para el entorno aislado.

#### 7. Caso APP-REVIEW

APP-REVIEW será tratado como un entorno aislado.

permiso global ordinario
≠ acceso a APP-REVIEW

También:

rol propietario
≠ acceso automático a APP-REVIEW

El acceso deberá depender de:

permiso específico;
alcance explícito;
finalidad de revisión;
reglas de aislamiento.

#### 8. Permiso global no equivale a rol global

Un trabajador puede recibir una capacidad global concreta sin convertirse en administrador global.

Ejemplos
contador
+
numera.reports.view
+
global
marketing
+
viso.website_cms.read
+
global
auxiliar_administrativa
+
anima.documents.view_all
+
global

En estos casos:

el permiso es global

pero:

el rol no se convierte en propietario;
el rol no se convierte en gerente_general;
el trabajador no obtiene gobierno organizacional.

#### 9. Rol global no equivale a todos los permisos globales

Los roles:

propietario
gerente_general

son roles administrativos globales.

Sin embargo:

rol administrativo global
≠ wildcard de permisos
Modelo aprobado
propietario
→ permisos globales explícitos

gerente_general
→ permisos globales explícitos

No:

propietario → *
gerente_general → *
Regla

Cada capacidad deberá existir en la matriz:

role_permissions

con:

permission_code exacto;
scope_type = global;
is_allowed = true.

#### 10. Nuevos permisos

Crear un permiso nuevo no lo concederá automáticamente a ningún rol.

Esto incluye:

propietario;
gerente_general.
Flujo
nuevo permiso
        ↓
sin asignación aprobada
        ↓
DENEGAR
Motivo

Un permiso nuevo podría representar:

una función todavía en desarrollo;
una operación destructiva;
acceso a información sensible;
una herramienta técnica;
una función reservada;
una acción que no debe ejecutarse todavía.

#### 11. Nuevas sedes y áreas

Un permiso global aprobado sí se extenderá automáticamente a:

nuevas sedes ordinarias;
nuevas áreas ordinarias;
nuevos recursos ordinarios del mismo dominio.

Siempre que estos sean clasificados como:

activos;
productivos;
pertenecientes a Vento;
no aislados.
Diferencia
NUEVO PERMISO
→ no se concede automáticamente
NUEVA SEDE ORDINARIA
→ queda incluida en un permiso global existente

Esta es una consecuencia necesaria del significado organizacional de global.

#### 12. Aplicación propietaria

Un permiso global conserva el límite de su aplicación.

Ejemplo
numera.reports.view
+
global

puede autorizar reportes de NUMERA para toda la organización.

No autoriza:

viso.staff.read;
nexo.inventory.stock;
origo.suppliers.view;
fogo.production.recipes.view.
Regla
alcance global
≠ alcance entre aplicaciones

Cada aplicación conserva su propio catálogo de capacidades.

#### 13. El permiso access

Un permiso global como:

nexo.access

significa:

puede entrar a NEXO desde cualquier contexto administrativo permitido

No significa:

puede ejecutar todas las acciones de NEXO.
Regla
app.access
→ acceso general a la aplicación

NO
→ permisos internos de la aplicación

Cada módulo y acción seguirá requiriendo su permiso concreto.

#### 14. Acción exacta

El alcance global modifica el territorio.

No modifica la acción.

Ejemplo
numera.expenses.view
+
global

permite consultar gastos organizacionales.

No permite:

crear;
editar;
eliminar;
aprobar;
exportar;
reclasificar.

salvo que existan permisos explícitos para esas acciones.

Regla
scope
→ dónde puede actuar

permission action
→ qué puede hacer

#### 15. Sin herencia implícita entre acciones

No se asumirá automáticamente que:

manage → view
approve → edit
delete → manage
access → view

La relación entre acciones deberá definirse expresamente en el catálogo.

Hasta que exista esa definición:

cada código de permiso
→ capacidad independiente

#### 16. Lectura global

Un permiso global de lectura podrá permitir:

consultar recursos de cualquier sede ordinaria;
consultar recursos organizacionales;
construir reportes multisede;
comparar sedes;
agrupar resultados por sede;
consultar indicadores consolidados.

Siempre dentro del recurso exacto autorizado.

Ejemplo
numera.profitability.view
+
global

podrá mostrar:

rentabilidad de Vento Café;
rentabilidad de Saudo;
rentabilidad de Centro de Producción;
consolidado organizacional.

#### 17. Mutación global

Un permiso global de mutación permite modificar el recurso autorizado en cualquier sede ordinaria.

Por tanto, representa un riesgo superior a una lectura global.

Ejemplo
viso.staff.manage
+
global

podría permitir administrar trabajadores de toda la organización.

No deberá confundirse con:

viso.staff.read
+
global
Regla

Los permisos globales de mutación deberán:

clasificarse como sensibles cuando corresponda;
tener matriz explícita;
registrar auditoría;
validar el recurso objetivo;
validar restricciones especiales;
evitar asignación accidental.

#### 18. Operaciones masivas

Un permiso global sobre un recurso no autoriza automáticamente operaciones masivas.

Ejemplo
viso.staff.manage
+
global

no implica necesariamente:

desactivar todos los empleados;
modificar todos los salarios;
exportar toda la base laboral;
cambiar todos los roles.

Estas acciones podrán requerir permisos diferenciados.

Regla
alcance global
≠ operación masiva

#### 19. Recursos organizacionales

Algunos recursos no pertenecen a una sede concreta.

Ejemplos:

catálogo de aplicaciones;
catálogo de permisos;
roles base;
configuración organizacional;
políticas globales;
estructura de negocios;
reportes consolidados;
configuración transversal.

Para estos recursos:

scope = global

será normalmente el alcance coherente.

Un permiso de sede no deberá utilizarse para modificar un recurso verdaderamente organizacional, salvo que el recurso tenga una configuración local explícita.

#### 20. Recursos territoriales

Algunos recursos pertenecen a:

una sede;
un área;
una combinación sede–área.

Ejemplos:

turno;
inventario;
caja;
movimiento;
remisión;
recepción;
producción;
empleado asignado a sede.

Un permiso global podrá alcanzar estos recursos en cualquier sede ordinaria.

Pero deberá resolver el territorio desde el recurso real.

Regla
target_site_id
→ se deriva del recurso objetivo

No exclusivamente desde:

un parámetro enviado por el cliente;
la sede seleccionada;
la sede primaria del actor.

#### 21. Recurso sin contexto suficiente

Si una operación requiere conocer la sede o área del recurso y no puede resolverla:

→ DENEGAR

El permiso global no permite operar sobre un recurso ambiguo.

Código conceptual
resource_scope_unresolved

#### 22. Sede seleccionada

La sede seleccionada es una preferencia administrativa.

Para un permiso global:

selected_site_id
→ filtra la experiencia

No:

→ limita permanentemente la autoridad global
Ejemplo
permiso global
+
sede seleccionada = Vento Café

puede mostrar inicialmente Vento Café.

El trabajador podrá cambiar a otra sede ordinaria dentro de la misma capacidad.

Regla
sede seleccionada
≠ alcance concedido

#### 23. Sede primaria

La sede primaria tampoco limita un permiso global.

employee_sites.is_primary
→ relación laboral principal

No:

→ frontera de un permiso global

Un contador con permiso financiero global no deberá necesitar una fila en employee_sites para cada sede cuyos reportes consulta.

#### 24. Sedes asignadas

Las sedes asignadas seguirán siendo relevantes para permisos:

por sede;
por tipo de sede;
operativos.

Pero no serán requisito territorial para un permiso administrativo global.

Regla
global administrative permission
→ no depende de employee_sites para cada sede

Esto no elimina la necesidad de:

empleado activo;
identidad laboral válida;
permiso explícito;
recurso permitido.

#### 25. Roles administrativos globales

Los roles naturales para recibir una matriz administrativa global amplia son:

propietario
gerente_general
Diferencia
PROPIETARIO
→ gobierno y control final

GERENTE_GENERAL
→ administración ejecutiva global

Las matrices concretas se definirán en:

AUTH-RBAC-001
AUTH-RBAC-002
Restricción

Ni propietario ni gerente general obtendrán permisos operativos globales por el nombre del rol.

#### 26. Gerente de sede

gerente
→ rol administrativo por sede

Por tanto, su configuración natural será:

permisos por sede

No:

115 permisos globales
Excepción

Un gerente podrá recibir un permiso global concreto únicamente cuando exista una necesidad funcional transversal documentada.

Ejemplo posible:

consultar un catálogo organizacional no sensible

Esto no convierte el resto de sus permisos en globales.

#### 27. Supervisor

supervisor
→ rol administrativo local

No deberá recibir permisos globales por defecto.

Cualquier capacidad transversal deberá ser:

específica;
justificada;
limitada;
auditada.

#### 28. Roles funcionales transversales

Roles como:

contador;
marketing;
auxiliar_administrativa.

podrán recibir permisos globales concretos.

Contador

Puede requerir globalidad sobre:

reportes financieros;
gastos;
rentabilidad;
centros de costo;
contabilidad.

No sobre todas las aplicaciones.

Marketing

Puede requerir globalidad sobre:

contenido;
menús;
imágenes;
sitio web;
campañas;
categorías comerciales.

No sobre personal, inventario o seguridad.

Auxiliar administrativa

Puede requerir capacidades globales específicas sobre:

documentos;
información administrativa;
procesos transversales autorizados.

No autoridad organizacional general.

#### 29. Permiso global individual

employee_permissions podrá conceder un permiso global directamente a un empleado.

Uso permitido
excepción funcional real;
responsabilidad transversal temporal;
capacidad especializada;
necesidad no representada por el rol base.
Reglas

Debe contener:

empleado activo;
permiso existente;
scope = global;
justificación;
creador;
fecha;
vigencia cuando corresponda;
auditoría.
Regla
permiso individual global
≠ cambio de rol

#### 30. Permisos operativos globales

Un permiso operativo con alcance global tendrá una semántica diferente a un permiso administrativo global.

Definición
operational permission
+
scope = global

significa:

el permiso puede utilizarse en cualquier contexto operativo válido
donde ese rol operativo esté autorizado

No significa:

operar todas las sedes simultáneamente;
operar sin turno;
operar sin check-in;
operar sin rol activo;
operar fuera de la sede del turno;
consultar recursos de otras sedes.
Ejemplo
bodeguero
+
nexo.inventory.withdraw
+
global

significa:

el rol bodeguero puede retirar inventario
en cualquier sede o área donde:

→ el rol bodeguero esté habilitado;
→ el trabajador tenga turno válido;
→ el trabajador tenga check-in activo;
→ el contexto operativo coincida.

No permite desde Centro de Producción:

retirar inventario de Vento Café

si la acción se está ejecutando bajo un turno del Centro de Producción.

#### 31. Diferencia administrativa y operativa

Global administrativo
capacidad organizacional
→ puede abarcar múltiples sedes
→ no depende del turno
→ no depende del check-in
Global operativo
capacidad reutilizable en contextos operativos válidos
→ se limita a la sede activa del turno
→ se limita al área activa cuando corresponda
→ requiere contexto laboral válido
Regla crítica
global operational permission
≠ cross-site operational permission

#### 32. Operación transversal real

Cuando una acción operativa necesite intervenir recursos de varias sedes, deberá existir una capacidad específica.

Ejemplos:

consultar remisiones multisede;
coordinar transporte entre sedes;
aprobar un traslado entre ubicaciones;
consultar tablero logístico general.

No se resolverá suponiendo que:

scope = global
→ cualquier operación entre sedes

La capacidad deberá declarar expresamente su comportamiento transversal.

#### 33. Bypass operacional

Un permiso administrativo global no será automáticamente un bypass del contexto operativo.

Ejemplo problemático actual
nexo.inventory.remissions.all_sites

no deberá equivaler a:

operar NEXO sin turno;
operar sin check-in;
operar sin rol operativo;
ejecutar cualquier acción

### ✅ AUTH-MOD-014 — Definir permisos por sede

La auditoría confirmó que employee_sites representa correctamente la cobertura multisede de los trabajadores, mientras que employees.site_id solo conserva la sede primaria heredada. También encontró permisos con scope_type = site y scope_site_id = null, cuya semántica actual queda definida expresamente en este documento.

#### 1. Problema que se resuelve

Vento OS necesita distinguir entre:

tener una sede asignada;
tener un permiso aplicable en esa sede;
tener la sede seleccionada en la interfaz;
tener una sede operativa activa;
tener acceso a un recurso perteneciente a esa sede.

Actualmente estos conceptos pueden mezclarse.

Ejemplo incorrecto:

employees.site_id = VENTO_CAFE
        ↓
se asume acceso completo a Vento Café

Otro ejemplo incorrecto:

permiso con scope = site
y scope_site_id = null
        ↓
no se sabe si significa:

→ configuración incompleta;
→ cualquier sede;
→ sede primaria;
→ sede seleccionada;
→ sedes asignadas;
→ sede del turno.

También existe un problema estructural:

gerente
→ rol administrativo por sede

PERO actualmente
→ tiene permisos globales

El modelo definitivo permite que un gerente o supervisor administre correctamente una o varias sedes asignadas, sin recibir autoridad organizacional global.

#### 2. Decisión principal

Un permiso por sede es una autorización para ejecutar una capacidad concreta sobre recursos pertenecientes a una o varias sedes dentro del alcance territorial válido del actor.

Fórmula
PERMISO CONCRETO
+
SEDE AUTORIZADA
+
RECURSO PERTENECIENTE A ESA SEDE
**=**
CAPACIDAD CONCRETA EN ESA SEDE

No implica:

acceso completo a la sede;
acceso a todas las aplicaciones;
acceso a todas las áreas;
acceso a todas las acciones;
acceso a otras sedes;
acceso organizacional global.

#### 3. Definición canónica

PERMISO POR SEDE
**=**
capacidad limitada territorialmente
a una sede empresarial determinada
o al conjunto activo de sedes asignadas al actor

El alcance por sede define:

dónde puede utilizarse el permiso

El código del permiso define:

qué acción puede realizarse
Regla
permission_code
→ capacidad

site scope
→ territorio

#### 4. Dos modalidades de alcance por sede

#### 1. SEDES ASIGNADAS

#### 2. SEDE ESPECÍFICA

Ambas modalidades son válidas y no deben confundirse.

#### 5. Modalidad: sedes asignadas

Definición

El permiso aplica en todas las sedes activamente asignadas al trabajador.

Fuente de verdad
public.employee_sites

con:

employee_id = actor
AND is_active = true
Fórmula
PERMISO
+
scope = assigned_sites
+
employee_sites activas
**=**
permiso efectivo en cada sede asignada

#### 6. Modalidad: sede específica

Definición

El permiso aplica únicamente a una sede explícita.

Fórmula
PERMISO
+
scope = specific_site
+
site_id = `<sede>`
**=**
permiso efectivo únicamente en esa sede

#### 7. Representación conceptual

site_scope_mode = assigned_sites
site_scope_mode = specific_site
site_id = `<sede>`
Regla

No se dependerá de NULL ambiguos en el modelo definitivo.

#### 8. Semántica de scope_site_id = null

scope_type = site
scope_site_id = null

significa:

todas las sedes activamente asignadas al actor
Regla
site + null
→ assigned_sites

#### 9. Fuente de verdad de las sedes asignadas

public.employee_sites

No:

public.employees.site_id

#### 10. La asignación de sede no es un permiso

SEDE ASIGNADA
+
SIN PERMISO
**=**
DENEGAR

#### 11. El permiso no crea una asignación de sede

PERMISO POR SEDE
+
SEDE NO ASIGNADA
**=**
DENEGAR

#### 12. Sede primaria

is_primary = true
≠ permiso

#### 13. Sede seleccionada

selected_site_id
≠ authorized_site_id

#### 14. Validación de la sede seleccionada

Debe ser válida, activa y autorizada.

#### 15. Permiso administrativo por sede

No requiere turno.
Requiere permiso, empleado activo y sede válida.

#### 16. Permiso operativo por sede

Requiere:

turno activo;
sede operativa activa;
rol operativo;
permiso operativo.

#### 17. Diferencia administrativa y operativa

Administrativa → sedes asignadas
Operativa → sede del turno

#### 18. Permiso operativo con assigned_sites

Aplica solo en la sede del turno activo.

#### 19. Permiso operativo para sede específica

Restringe la capacidad a una sede concreta.

#### 20. El rol debe estar habilitado en la sede

ROL + PERMISO + SEDE + NO HABILITADO = DENEGAR

#### 21. Áreas dentro de la sede

scope = site
≠ acceso automático a todas las áreas

#### 22. Recursos territoriales

resource.site_id → sede real

#### 23. Recursos indirectos

La sede debe resolverse por relación.

#### 24. Recursos multisede

ORIGEN AUTORIZADO
+
DESTINO NO AUTORIZADO
**=**
DENEGAR

#### 25. Consulta multisede

Permitida solo si todas las sedes están autorizadas.

#### 26. Mutaciones multisede

Requieren autorización en todas las sedes.

#### 27. Nuevas sedes

No se incluyen automáticamente sin asignación.

#### 28. Sedes inactivas

permiso + sede inactiva = DENEGAR

#### 29. Asignaciones inactivas

No conceden acceso.

#### 30. Empleados inactivos

empleado inactivo → DENEGAR

#### 31. Sedes aisladas

Requieren autorización adicional.

#### 32. Jerarquía entre sedes

No existe herencia automática.

#### 33. Tipo de sede

No implica acceso a otras sedes del mismo tipo.

#### 34. Rol base

Roles locales usan assigned_sites.

#### 35. Roles funcionales

Pueden combinar distintos alcances.

#### 36. Excepciones individuales

Solo para casos específicos.

#### 37. Dispositivos compartidos

Restringen el alcance por sede.

#### 38. Dispositivo sin sede

device.site_id = null → DENEGAR

#### 39. Simulación

No modifica datos reales.

#### 40. Comportamiento ante datos ausentes

Todos los casos inválidos → DENEGAR.

#### 41. Códigos de bloqueo

Se mantienen definidos.

#### 42. Bypass permitidos

Solo procesos técnicos controlados.

#### 43. Impacto en guards

Deben validar permiso, sede y contexto.

#### 44. Impacto en RPC

Debe derivar la sede desde el recurso.

#### 45. Impacto en RLS

No usar solo employees.site_id.

#### 46. Impacto en navegación

Mostrar solo sedes autorizadas.

#### 47. Impacto en auditoría

Registrar siempre la sede real.

#### 48. Impacto en aplicaciones

Todas las apps deben respetar el modelo territorial.

#### 49. Visualización en VISO

Permisos muestran alcance real por sede.

#### 50. Contrato resultante

Se mantiene la estructura definida.

#### 51. Precedencia territorial

Se mantiene el orden definido.

#### 52. Invariantes

Se mantienen todos los invariantes establecidos.

#### 53. Alternativas descartadas

Se mantienen descartadas.

#### 54. Riesgos

Se mantienen identificados.

#### 55. Asuntos pendientes

Se mantienen definidos.

#### 56. Decisión final

PERMISO ADMINISTRATIVO POR SEDE
**=**
CAPACIDAD EXACTA
APLICABLE EN SEDES AUTORIZADAS
PERMISO OPERATIVO POR SEDE
**=**
CAPACIDAD EXACTA
APLICABLE EN LA SEDE DEL TURNO

#### 57. Criterio de aprobación

✅ Cumplido.

✅ Conclusión

SEDE ASIGNADA
→ define dónde puede actuar el trabajador

PERMISO POR SEDE
→ define qué puede hacer
PERMISO
∩ SEDES AUTORIZADAS
∩ SEDE DEL RECURSO
∩ CONTEXTO OPERATIVO
**=**
ACCIÓN AUTORIZADA

### ✅ AUTH-MOD-015 — Definir permisos por tipo de sede

La auditoría confirmó que existen permisos con:

scope_type = site_type

principalmente asociados a roles operativos heredados.

El modelo definitivo debe impedir que el tipo de sede sea interpretado como:

una sede concreta;
una sede seleccionada;
todas las sedes sin restricción;
un tipo físico de punto de marcación;
una jerarquía empresarial;
un reemplazo del turno;
un reemplazo de employee_sites.

#### 1. Problema que se resuelve

Vento OS necesita reutilizar una capacidad en varias sedes que comparten una misma categoría empresarial.

Ejemplos conceptuales:

satélites comerciales;
centros de producción;
centros de distribución;
sedes corporativas.

Sin un alcance por tipo de sede, sería necesario crear asignaciones repetidas:

permiso para Vento Café;
permiso para Saudo;
permiso para Molka;

aunque las tres sedes compartan un modelo funcional equivalente.

Pero una autorización demasiado amplia como:

scope = global

también sería incorrecta, porque incluiría sedes de otras categorías.

El alcance por tipo de sede debe expresar:

esta capacidad puede utilizarse
en las sedes pertenecientes a esta categoría exacta

sin convertir el permiso en global.

#### 2. Decisión principal

Un permiso por tipo de sede será una autorización para ejecutar una capacidad concreta sobre recursos pertenecientes a sedes cuya clasificación canónica coincida con un tipo autorizado.

Fórmula
PERMISO CONCRETO
+
TIPO DE SEDE AUTORIZADO
+
SEDE REAL DEL RECURSO
+
COINCIDENCIA EXACTA DEL TIPO
**=**
CAPACIDAD CONCRETA EN ESA CATEGORÍA DE SEDES

No significa:

acceso global;
acceso a cualquier sede;
acceso a todas las sedes asignadas;
acceso a sedes de tipos relacionados;
acceso a puntos de check-in;
acceso a todas las acciones;
acceso operativo sin turno.

#### 3. Definición canónica

PERMISO POR TIPO DE SEDE
**=**
capacidad territorial reutilizable
en sedes empresariales activas
que pertenecen a una clasificación exacta

El tipo de sede responde:

¿qué clase de sede puede contener el recurso?

El código del permiso responde:

¿qué acción puede ejecutar el actor?
Regla
permission_code
→ capacidad

site_type
→ categoría territorial

#### 4. Fuente de verdad del tipo de sede

La fuente canónica será una clasificación empresarial normalizada de tipos de sede.

Conceptualmente:

public.site_types
        ↓
public.sites.site_type

Mientras no exista un catálogo separado completamente normalizado, el valor vigente de:

public.sites.site_type

será utilizado como referencia transitoria.

Requisito

El tipo deberá existir en un catálogo controlado que defina:

code;
nombre;
descripción;
estado;
uso administrativo;
uso operativo;
si representa una sede empresarial;
si admite recursos;
si está aislado;
si puede utilizarse en permisos.

#### 5. Diferencia entre clasificaciones actuales

El modelo actual contiene conceptos que no deberán confundirse:

site_type
site_kind
type
operational_visibility
site_type

Representa la categoría empresarial utilizada para autorización.

Ejemplos conceptuales:

satellite
production_center
distribution_center
corporate
site_kind

Representa una subclasificación física u operacional.

Ejemplos posibles:

vehicle_yard
restaurant
warehouse
office

No será fuente primaria para permisos por tipo de sede.

type

Puede representar la naturaleza técnica del registro.

Ejemplo:

checkin_point

No será equivalente a tipo empresarial de sede.

operational_visibility

Determina si el registro debe aparecer dentro de la operación ordinaria.

Regla crítica
site_type
≠ site_kind
≠ type
≠ operational_visibility

#### 6. Solo sedes empresariales

Un permiso por tipo de sede podrá aplicarse únicamente a registros clasificados como sedes empresariales autorizables.

Deberá excluir:

puntos de check-in;
patios de vehículos;
puntos de geocerca;
ubicaciones técnicas;
sedes ocultas no operativas;
registros de integración;
entornos aislados;
registros de demostración;
sitios inactivos.
Regla
type = checkin_point
→ no participa en permisos por tipo de sede

aunque su campo site_type contenga un valor administrativo o genérico.

#### 7. Elegibilidad de una sede

Una sede podrá participar en este alcance cuando:

existe;
está activa;
es una sede empresarial;
tiene site_type válido;
el tipo está activo;
el tipo admite autorización;
no es un punto técnico;
no está aislada sin autorización;
pertenece a la organización correcta.
Fórmula
site_is_authorizable
**=**
site_active
AND site_type_active
AND business_site
AND not_technical_point
AND boundary_valid

#### 8. Coincidencia exacta

La coincidencia entre tipos será exacta.

resource_site.site_type
**=**
permission_scope.site_type

No se utilizarán:

coincidencias parciales;
LIKE;
ILIKE;
texto aproximado;
nombre visible;
descripción;
traducción;
pluralización;
alias no registrados.
Regla
satellite
≠ satellite_main
≠ satellite_demo

salvo que exista una relación explícita en el catálogo.

#### 9. Sin jerarquía implícita

No se asumirá automáticamente que un tipo incluye otros tipos.

Ejemplo:

operational

no incluirá implícitamente:

satellite;
production_center;
distribution_center.

También:

corporate

no significará:

toda la organización.
Regla
tipo padre
≠ tipos hijos

Una jerarquía futura deberá estar modelada y autorizada expresamente.

#### 10. Dos modalidades de alcance por tipo de sede

Se reconocen dos modalidades conceptuales:

#### 1. TIPOS DENTRO DE SEDES ASIGNADAS

#### 2. TODAS LAS SEDES DEL TIPO

Estas modalidades tienen riesgos y usos diferentes.

#### 11. Modalidad: sedes asignadas del tipo

Código conceptual
site_type_scope_mode = assigned_sites_of_type
Definición

El permiso será efectivo únicamente en las sedes que cumplan simultáneamente:

la sede está asignada al trabajador;
la asignación está activa;
la sede pertenece al tipo autorizado.
Fórmula
PERMISO
∩ EMPLOYEE_SITES ACTIVAS
∩ SITE_TYPE AUTORIZADO
**=**
ALCANCE EFECTIVO
Ejemplo

Trabajador:

Sedes asignadas:
✅ Vento Café       → satellite
✅ Saudo            → satellite
✅ Centro Producción → production_center

Permiso:

viso.staff.read
+
site_type = satellite
+
mode = assigned_sites_of_type

Resultado:

✅ Vento Café
✅ Saudo
❌ Centro de Producción
❌ Otros satélites no asignados

#### 12. Modalidad: todas las sedes del tipo

Código conceptual
site_type_scope_mode = all_sites_of_type
Definición

El permiso será efectivo en todas las sedes empresariales ordinarias, activas y no aisladas que pertenezcan al tipo exacto.

No dependerá de una fila de employee_sites para cada sede.

Fórmula
PERMISO
+
SITE_TYPE AUTORIZADO
+
MODE = ALL_SITES_OF_TYPE
**=**
CAPACIDAD EN TODA LA CATEGORÍA
Ejemplo
Rol funcional:
supervisor_comercial_transversal

Permiso:
numera.sales.view

Tipo:
satellite

Modo:
all_sites_of_type

Resultado:

✅ Vento Café
✅ Saudo
✅ Molka
❌ Centro de Producción
❌ Vento Group

#### 13. Modalidad predeterminada

La modalidad predeterminada será:

assigned_sites_of_type
Motivo

Es la opción de menor privilegio.

Evita que conceder un tipo de sede produzca automáticamente autoridad sobre todas las sedes actuales y futuras de esa categoría.

Regla
site_type
sin modalidad explícita
→ assigned_sites_of_type

durante la transición.

En el modelo definitivo, la modalidad deberá almacenarse expresamente.

#### 14. Uso de all_sites_of_type

La modalidad:

all_sites_of_type

solo podrá asignarse cuando exista una necesidad transversal documentada.

Ejemplos posibles:

consulta financiera de todos los satélites;
administración comercial de todos los restaurantes;
auditoría de todos los centros de producción;
revisión logística de todos los centros de distribución.

No deberá utilizarse como sustituto de:

scope = global

ni como solución rápida para no mantener employee_sites.

#### 15. Diferencia frente a permiso global

Global
capacidad en toda la organización ordinaria
Tipo de sede
capacidad únicamente en una categoría exacta de sedes
Ejemplo
numera.reports.view
+
global

puede incluir:

satélites;
producción;
distribución;
corporativo.

Mientras:

numera.reports.view
+
site_type = satellite

incluye únicamente sedes satélite autorizadas.

Regla
site_type
≠ global reducido informalmente

Es un alcance independiente y explícito.

#### 16. Diferencia frente a permiso por sede

Sede específica
una sede exacta
Sedes asignadas
cada sede asignada al trabajador
Tipo dentro de sedes asignadas
solo las sedes asignadas que coinciden con el tipo
Todas las sedes del tipo
todas las sedes organizacionales ordinarias de esa categoría

#### 17. Permiso administrativo por tipo de sede

Un permiso administrativo por tipo de sede:

no requiere turno;
no requiere check-in;
no requiere rol operativo.

Requiere:

actor autenticado;
empleado activo;
permiso administrativo exacto;
tipo de sede válido;
modalidad válida;
recurso dentro del tipo;
ausencia de restricciones superiores.
Ejemplo
gerente_comercial
+
viso.staff.schedule.view
+
site_type = satellite
+
assigned_sites_of_type

podrá consultar horarios de sus satélites asignados.

#### 18. Permiso administrativo transversal por tipo

La modalidad:

all_sites_of_type

permite una responsabilidad administrativa transversal limitada a una categoría.

Ejemplo:

contador
+
numera.profitability.view
+
site_type = satellite
+
all_sites_of_type

podrá consultar rentabilidad de todos los satélites.

No podrá consultar automáticamente:

Centro de Producción;
Centro de Distribución;
Vento Group.

#### 19. Permiso operativo por tipo de sede

Un permiso operativo por tipo de sede significa:

la capacidad puede utilizarse
cuando la sede operativa activa
pertenece al tipo autorizado
Requisitos
turno publicado válido;
check-in activo cuando aplique;
sede operativa activa;
rol operativo activo;
rol habilitado en la sede;
permiso operativo;
tipo de sede coincidente;
recurso dentro del contexto operativo.
Fórmula
PERMISO OPERATIVO
+
SEDE DEL TURNO
+
TIPO COINCIDENTE
+
RECURSO EN LA SEDE ACTIVA
**=**
AUTORIZACIÓN

#### 20. El tipo no reemplaza el turno

Un trabajador puede estar asignado a varias sedes del mismo tipo.

Ejemplo:

Vento Café → satellite
Saudo      → satellite
Molka      → satellite

Pero durante una acción operativa solo podrá actuar dentro de:

la sede operativa activa del turno
Regla
site_type = satellite
+
turno en Vento Café
≠ operar Saudo

Aunque ambas sedes sean del mismo tipo.

#### 21. Modalidad operativa efectiva

Para permisos operativos, la modalidad:

all_sites_of_type

no concede operación simultánea en todas las sedes del tipo.

Significa:

el mismo permiso puede activarse
en cualquier turno válido
cuya sede pertenezca a ese tipo
Regla
operational all_sites_of_type
**=**
reutilizable en cualquier contexto válido del tipo

No:

acceso multisede dentro de un solo turno

#### 22. El rol debe existir en la sede concreta

Que un rol sea compatible con un tipo de sede no significa que esté habilitado automáticamente en todas las sedes de ese tipo.

También deberá existir una configuración válida en:

public.site_operational_roles

para la sede concreta.

Fórmula
ROL COMPATIBLE CON EL TIPO
+
ROL NO HABILITADO EN LA SEDE
**=**
DENEGAR
Motivo

Dos sedes del mismo tipo pueden tener modelos operativos diferentes.

#### 23. Área operativa

El tipo de sede no reemplaza la validación del área.

Ejemplo:

site_type = satellite
role = barista_satelite

no autoriza automáticamente:

Caja;
Salón;
Cocina;
Mostrador.

El área activa deberá coincidir con la configuración del rol cuando sea requerida.

Regla
tipo de sede válido
+
área inválida
**=**
DENEGAR

#### 24. Recursos territoriales

La autorización deberá obtener la sede real del recurso.

Después deberá resolver:

resource_site.site_type
Flujo
recurso
→ sede real
→ tipo canónico
→ comparación con alcance

No se confiará exclusivamente en:

site_type enviado por el cliente;
sede seleccionada;
nombre de la sede;
ruta de navegación.

#### 25. Recursos sin sede directa

Cuando el recurso no incluya site_id, deberá resolverse mediante su relación canónica.

Ejemplo:

línea de inventario
→ ubicación
→ sede
→ tipo de sede
Regla
sin site_id directo
≠ sin tipo de sede

#### 26. Recursos organizacionales

Un recurso verdaderamente organizacional no deberá autorizarse mediante tipo de sede.

Ejemplos:

catálogo de permisos;
roles base;
configuración global;
catálogo de aplicaciones;
política organizacional.
Regla
resource_scope = organization
+
scope = site_type
**=**
ALCANCE INCOMPATIBLE

Estos recursos requerirán normalmente alcance global.

#### 27. Recursos multisede del mismo tipo

Una operación puede involucrar varias sedes del mismo tipo.

Ejemplo:

origen: Vento Café
destino: Saudo

Ambas pueden ser:

satellite

Pero la coincidencia del tipo no será suficiente.

Deberán validarse:

origen;
destino;
acción transversal;
modo del alcance;
contexto administrativo u operativo.
Regla
mismo tipo
≠ autorización automática entre sedes

#### 28. Recursos multisede de tipos diferentes

Ejemplo:

origen:
Centro de Producción
→ production_center

destino:
Vento Café
→ satellite

Un permiso limitado a:

production_center

no autoriza automáticamente el destino.

Un permiso limitado a:

satellite

no autoriza automáticamente el origen.

Resultado
origen autorizado
+
destino no autorizado
**=**
DENEGAR

salvo una capacidad transversal específica.

#### 29. Permisos transversales entre tipos

Las operaciones empresariales que conecten categorías diferentes requerirán una capacidad explícita.

Ejemplos:

despachar de producción a satélites;
transportar entre sedes;
aprobar transferencias;
consultar cadena logística completa.

No se modelarán suponiendo que un permiso de un tipo cubre el otro.

#### 30. Nuevas sedes

assigned_sites_of_type

Una nueva sede del tipo no queda disponible hasta que:

se asigne activamente al trabajador.
all_sites_of_type

Una nueva sede ordinaria y activa del tipo quedará incluida automáticamente.

Siempre que:

no sea aislada;
sea autorizable;
el tipo permanezca activo;
el permiso admita ese modo.
Riesgo

La modalidad transversal deberá utilizarse con cuidado porque puede ampliar alcance al crear nuevas sedes.

#### 31. Cambio de tipo de una sede

Cambiar el tipo de una sede puede modificar inmediatamente el alcance de muchos permisos.

Ejemplo:

sede X
satellite
→ corporate

podría:

retirar permisos de tipo satellite;
activar permisos de tipo corporate.
Regla

El cambio de tipo deberá ser:

administrativo;
explícito;
auditado;
previsualizado;
protegido por permiso sensible.

No será una edición descriptiva menor.

#### 32. Efecto sobre sesiones activas

Si el tipo de una sede cambia:

las sesiones administrativas deberán reevaluarse;
las sesiones operativas deberán invalidarse o reevaluarse;
los dispositivos deberán recargar configuración;
las decisiones en caché deberán descartarse.

### Regla

```
site_type_changed
→ invalidar autorización territorial previa
```

#### 33. Historial

La auditoría deberá conservar el tipo de sede utilizado al tomar una decisión.

Datos mínimos
site_id;
site_type_at_decision;
permission_scope_site_type;
scope_mode;
decision;
occurred_at.

Esto evita que un cambio posterior de tipo altere la interpretación histórica de una acción.

#### 34. Tipos inactivos

Si el tipo de sede está inactivo:

el permiso no será efectivo.
Regla
site_type inactive
→ DENEGAR

No se eliminará necesariamente el histórico.

#### 35. Sede sin tipo

Una sede empresarial sin tipo canónico no podrá participar en permisos por tipo.

site_type = null
→ DENEGAR

No se utilizará un valor predeterminado implícito.

#### 36. Tipo desconocido

Si una asignación contiene un código inexistente:

scope_site_type = desconocido
→ configuración inválida
Regla
tipo textual arbitrario
≠ tipo válido

#### 37. Entornos aislados

APP-REVIEW, demos y otros entornos aislados no quedarán incluidos automáticamente aunque compartan un tipo ordinario.

Ejemplo:

APP-REVIEW.site_type = satellite

no implicaría:

permiso para todos los satélites
→ acceso a APP-REVIEW
Fórmula
TIPO COINCIDENTE
+
SEDE AISLADA
+
SIN AUTORIZACIÓN DE AISLAMIENTO
**=**
DENEGAR

#### 38. Dispositivos compartidos

Un dispositivo compartido tiene una sede concreta.

El tipo de esa sede no permite usar el dispositivo para actuar sobre otras sedes del mismo tipo.

Ejemplo
Dispositivo:
Caja Vento Café

Tipo:
satellite

Actor:
permiso en todos los satélites

Desde ese dispositivo:

✅ puede operar sobre Vento Café
❌ no puede operar Saudo
❌ no puede operar Molka
Regla
device.site_id
→ restricción exacta

device.site_type
→ no amplía alcance

#### 39. Dispositivo configurado solo por tipo

Un dispositivo operacional deberá tener una sede concreta.

device.site_id = null
+
device.site_type = satellite
**=**
CONFIGURACIÓN INVÁLIDA

No se permitirá una terminal operacional flotante que actúe como cualquier sede del tipo.

#### 40. Simulación

La simulación podrá evaluar:

tipo de sede;
modalidad;
sede asignada del tipo;
sede no asignada del tipo;
nueva sede del tipo;
sede aislada;
cambio hipotético del tipo;
operación entre tipos.
Regla

La simulación no podrá:

cambiar el tipo real;
crear sedes;
modificar employee_sites;
modificar permisos;
atravesar aislamiento.

#### 41. Roles administrativos locales

Los roles:

gerente;
supervisor.

utilizarán normalmente:

assigned_sites

o:

assigned_sites_of_type

No deberán recibir:

all_sites_of_type

por defecto.

Ejemplo

Un gerente asignado a:

Vento Café
Saudo
Centro de Producción

con permiso limitado a:

site_type = satellite

podrá actuar en:

Vento Café;
Saudo.

No en:

Centro de Producción.

#### 42. Roles funcionales transversales

Roles como:

contador;
marketing;
auditor;
coordinador comercial.

podrán utilizar:

all_sites_of_type

para capacidades específicas.

Ejemplo:

marketing
+
viso.menu.read
+
site_type = satellite
+
all_sites_of_type

No concede capacidades sobre:

inventario;
trabajadores;
producción;
finanzas;
seguridad.

#### 43. Roles operativos heredados

Los roles base heredados como:

barista;
cajero;
cocinero;
mesero;
panadero;
repostero.

no deberán conservar permisos permanentes por tipo de sede como modelo definitivo.

Modelo correcto
rol base administrativo o neutral
+
turno publicado
+
rol operativo
+
sede concreta
+
área concreta
+
permiso operativo

Los permisos actuales por tipo de sede asociados a oficios heredados deberán migrarse posteriormente a las matrices operativas canónicas.

#### 44. Excepciones individuales

employee_permissions podrá conceder un permiso por tipo de sede.

Debe declarar:

employee_id;
permission_code;
site_type;
scope_mode;
justificación;
vigencia;
creador;
auditoría.
Uso válido
responsabilidad temporal;
cobertura transversal;
función especializada;
restricción adicional.

No deberá utilizarse para mantener indefinidamente una matriz de rol incorrecta.

#### 45. Compatibilidad del permiso con el alcance

No todos los permisos admitirán alcance por tipo de sede.

Ejemplos probablemente incompatibles:

gestionar catálogo global de permisos;
modificar roles base;
configurar aplicaciones;
administrar políticas organizacionales.

Ejemplos potencialmente compatibles:

consultar ventas;
consultar personal;
consultar inventario;
consultar producción;
administrar menús locales;
consultar reportes territoriales.
Regla
permiso no compatible con site_type
+
asignación site_type
**=**
CONFIGURACIÓN INVÁLIDA

La clasificación definitiva se realizará en el catálogo de permisos.

#### 46. Lectura consolidada

Un permiso de lectura con:

all_sites_of_type

podrá producir una consulta consolidada del tipo autorizado.

Ejemplo:

Ventas de todos los satélites
Resultado
Vento Café
Saudo
Molka
Total satélites

No incluirá:

Centro de Producción;
Vento Group;
otros tipos;
sedes aisladas.

#### 47. Mutación transversal por tipo

Una mutación aplicable a todas las sedes de un tipo representa un riesgo elevado.

Ejemplo:

actualizar configuración de menú
en todos los satélites

No se autorizará únicamente porque exista un permiso local con:

all_sites_of_type

Podrá requerir:

permiso masivo específico;
confirmación reforzada;
previsualización;
auditoría;
idempotencia;
reversión.
Regla
all_sites_of_type
≠ bulk mutation

#### 48. Comportamiento ante datos ausentes

| Dato ausente o inválido                    | Resultado |
| ------------------------------------------ | --------- |
| Actor no autenticado                       | Denegar   |
| Empleado inexistente                       | Denegar   |
| Empleado inactivo                          | Denegar   |
| Aplicación inexistente                     | Denegar   |
| Permiso inexistente                        | Denegar   |
| Permiso incompatible con site_type         | Denegar   |
| Tipo de sede inexistente                   | Denegar   |
| Tipo de sede inactivo                      | Denegar   |
| Modalidad ausente en modelo definitivo     | Denegar   |
| Sede inexistente                           | Denegar   |
| Sede inactiva                              | Denegar   |
| Sede sin tipo                              | Denegar   |
| Sede técnica o punto de check-in           | Denegar   |
| Sede aislada sin autorización              | Denegar   |
| Tipo del recurso no resoluble              | Denegar   |
| Tipo enviado distinto al tipo real         | Denegar   |
| Sede no asignada en assigned_sites_of_type | Denegar   |
| Turno ausente en permiso operativo         | Denegar   |
| Sede del turno de otro tipo                | Denegar   |
| Rol operativo no habilitado                | Denegar   |
| Área operativa inválida                    | Denegar   |
| Dispositivo de otra sede                   | Denegar   |
| Recurso multisede parcialmente autorizado  | Denegar   |

#### 49. Códigos de bloqueo

site_type_permission_not_granted
site_type_scope_invalid
site_type_scope_mode_invalid
site_type_not_found
site_type_inactive
site_type_not_authorizable
site_type_permission_incompatible
site_type_site_not_found
site_type_site_inactive
site_type_site_not_assigned
site_type_site_not_business
site_type_site_isolated
site_type_resource_scope_unresolved
site_type_resource_mismatch
site_type_operational_context_required
site_type_operational_site_mismatch
site_type_operational_role_invalid
site_type_operational_area_invalid
site_type_origin_not_allowed
site_type_destination_not_allowed
site_type_cross_type_action_required
site_type_device_mismatch
site_type_bulk_action_not_allowed
site_type_explicit_deny

La precedencia definitiva se establecerá en:

AUTH-MOD-018
AUTH-MOD-019

#### 50. Bypass permitidos

| Caso                                    | Permitido |
| --------------------------------------- | --------- |
| Propietario por nombre                  | ❌         |
| Gerente general por nombre              | ❌         |
| Gerente por nombre                      | ❌         |
| Coincidencia aproximada del tipo        | ❌         |
| site_kind como reemplazo de site_type   | ❌         |
| Punto de check-in incluido por tipo     | ❌         |
| Sede aislada incluida por coincidencia  | ❌         |
| Tipo sin catálogo                       | ❌         |
| Permiso incompatible con el alcance     | ❌         |
| Turno en otra sede del mismo tipo       | ❌         |
| Dispositivo en otra sede del mismo tipo | ❌         |
| Operación multisede por compartir tipo  | ❌         |
| Proceso técnico exacto con service_role | ✅         |
| Migración controlada                    | ✅         |
| Auditoría histórica autorizada          | ✅         |

Regla
mismo tipo
→ similitud territorial

NO
→ bypass entre sedes

#### 51. Impacto en guards

Los guards deberán recibir o resolver:

permission_code;
authorization_mode;
site_type_scope_mode;
authorized_site_type;
target_resource;
target_site_id;
target_site_type;
operational_site_id cuando aplique;
device_site_id cuando aplique.
Guard administrativo
requireAdministrativeSiteTypePermission(
  permission,
  resource
)

Deberá validar:

permiso;
compatibilidad del alcance;
tipo del recurso;
modalidad;
employee_sites cuando aplique;
aislamiento;
denegaciones.
Guard operativo
requireOperationalSiteTypePermission(
  permission,
  operationalContext,
  resource
)

Deberá validar:

sede del turno;
tipo de la sede;
rol operativo;
área;
recurso;
dispositivo.

#### 52. Impacto en RPC

Toda RPC que use alcance por tipo de sede deberá:

resolver auth.uid();
resolver empleado activo;
validar permiso exacto;
validar compatibilidad con site_type;
resolver recurso objetivo;
derivar la sede real;
derivar el tipo desde la sede;
validar modalidad;
validar employee_sites cuando aplique;
validar contexto operativo cuando aplique;
validar aislamiento;
registrar sede y tipo efectivos.
Prohibición

No deberá confiar únicamente en:

p_site_type;
p_site_id;
selected_site_id;
texto enviado por la aplicación.

#### 53. Impacto en RLS

Una política por tipo de sede deberá resolver el tipo desde la sede de cada fila.

No será suficiente:

row.site_type = requested_type

si el valor fue suministrado por el cliente.

Regla
row
→ site_id
→ sites.site_type
→ comparación autorizada

También deberá comprobar:

empleado activo;
permiso exacto;
modalidad;
asignación cuando aplique;
aislamiento;
denegaciones.

#### 54. Impacto en navegación

La navegación podrá agrupar o filtrar sedes por tipo.

Cómo se verá
TIPO DE SEDE

Satélites
✓ Vento Café
✓ Saudo
✓ Molka

Producción
— Centro de Producción

Corporativo
— Vento Group

La interfaz deberá mostrar únicamente:

tipos autorizados;
sedes autorizadas dentro del tipo.

No deberá mostrar un tipo como disponible si no contiene ninguna sede efectiva para el actor.

#### 55. Impacto en auditoría

Toda acción autorizada mediante tipo de sede deberá registrar:

employee_id;
auth_user_id;
permission_code;
authorization_mode;
site_type_scope_mode;
authorized_site_type;
resource_type;
resource_id;
resource_site_id;
resource_site_type_at_decision;
operational_site_id cuando aplique;
device_site_id cuando aplique;
decision;
occurred_at.
Regla

La auditoría conservará:

el tipo configurado en el permiso;
el tipo real de la sede;
la sede exacta afectada.

#### 56. Impacto en aplicaciones

VISO

Permitirá configurar permisos como:

todas las sedes asignadas de tipo satélite;
todos los centros de producción;
una sede específica;
alcance global.

No deberá mezclar estas opciones.

ANIMA

Los administradores podrán consultar o administrar turnos de tipos de sede autorizados.

La asistencia propia seguirá dependiendo de la sede y turno concretos.

NEXO

Permitirá reutilizar capacidades operativas en sedes logísticas compatibles.

La operación continuará limitada a la sede activa.

FOGO

Los permisos operativos podrán limitarse a:

production_center

sin conceder acceso a satélites.

ORIGO

Podrá separar compras o recepciones por categorías de sede.

Las recepciones físicas seguirán ligadas a una sede exacta.

PULSO

Podrá habilitar capacidades para:

satellite

pero cada caja y turno seguirá asociado a una sede concreta.

NUMERA

Podrá consolidar indicadores de:

todos los satélites;
todos los centros de producción;
todos los centros de distribución.

sin convertir la consulta en global.

#### 57. Cómo se verá en VISO

Modalidad restringida a sedes asignadas
Permiso
VISO · Consultar horarios

Alcance
● Tipo de sede

Tipo
[ Satélite ▼ ]

Aplicación
● Solo sedes asignadas de este tipo
○ Todas las sedes de este tipo

Resultado para el trabajador

✅ Vento Café
✅ Saudo
❌ Molka — no asignada
❌ Centro de Producción — tipo diferente
Modalidad transversal
Permiso
NUMERA · Consultar rentabilidad

Alcance
● Tipo de sede

Tipo
[ Satélite ▼ ]

Aplicación
○ Solo sedes asignadas de este tipo
● Todas las sedes de este tipo

Incluye
✅ Vento Café
✅ Saudo
✅ Molka

Excluye
❌ Centro de Producción
❌ Vento Group
❌ APP-REVIEW

#### 58. Contrato resultante

SiteTypePermissionScope
SiteTypePermissionScope
├── scope_type: site_type
├── site_type_code
├── mode
│   ├── assigned_sites_of_type
│   └── all_sites_of_type
├── authorization_mode
│   ├── administrative
│   └── operational
├── requires_employee_site_assignment
├── requires_active_operational_site
├── isolated_sites_allowed
├── multi_site_aggregation_allowed
├── cross_type_action_allowed
└── bulk_action_allowed
EffectiveSiteTypeScope
EffectiveSiteTypeScope
├── employee_id
├── authorized_site_type
├── scope_mode
├── assigned_site_ids
├── sites_matching_type
├── effective_site_ids
├── operational_site_id
├── operational_site_type
├── device_site_id
├── resource_site_ids
├── matched_site_ids
├── rejected_site_ids
└── blocked_reasons
SiteTypeAuthorizationDecision
SiteTypeAuthorizationDecision
├── employee_id
├── app_code
├── permission_code
├── authorization_mode
├── assignment_source
├── site_type_scope_mode
├── authorized_site_type
├── target_site_id
├── target_site_type
├── resource_type
├── resource_id
├── matched_assignment
├── matched_allow
├── matched_deny
├── blocked_reasons
└── decision

#### 59. Precedencia territorial

La evaluación seguirá este orden:

#### 1. Actor autenticado

#### 2. Empleado activo

#### 3. Aplicación activa

#### 4. Permiso existente

#### 5. Compatibilidad del permiso con site_type

#### 6. Tipo de sede autorizado

#### 7. Estado del tipo

#### 8. Modalidad del alcance

#### 9. Sede real del recurso

#### 10. Elegibilidad de la sede

#### 11. Tipo real de la sede

#### 12. Employee_sites cuando aplique

#### 13. Aislamiento

#### 14. Contexto operativo cuando aplique

#### 15. Área cuando aplique

#### 16. Dispositivo cuando aplique

#### 17. Operación multisede cuando aplique

#### 18. Denegaciones

#### 19. Decisión

Regla

El tipo enviado por el cliente nunca tendrá prioridad sobre:

la sede real;
el tipo almacenado en la sede;
el contexto operativo;
el recurso objetivo.

#### 60. Invariantes

El tipo de sede limita territorio, no acción.
El tipo de sede no es un permiso.
El tipo de sede no es una sede concreta.
site_type no equivale a site_kind.
site_type no equivale a type.
Los puntos de check-in no participan en permisos por tipo.
Solo las sedes empresariales autorizables participan.
La coincidencia de tipos es exacta.
No existen coincidencias aproximadas.
No existe jerarquía implícita entre tipos.
Existen dos modalidades de alcance.
assigned_sites_of_type es la modalidad predeterminada.
all_sites_of_type requiere asignación explícita.
La modalidad definitiva debe almacenarse.
Tener una sede asignada no concede permisos.
Tener un permiso no crea una asignación de sede.
Un permiso administrativo por tipo no requiere turno.

### ✅ AUTH-MOD-016 — Definir permisos por área

La auditoría confirmó que:

employee_areas
→ existe, pero solo contiene una asignación activa

employees.area_id
→ está vacío para todos los trabajadores auditados

employee_shifts.area_id
→ sí participa en el contexto operativo reciente

site_operational_roles.area_id
→ define roles operativos habilitados en áreas concretas

Por tanto, el modelo definitivo debe separar:

área administrativa asignada;
área operativa del turno;
área seleccionada en la interfaz;
área física del dispositivo;
área del recurso;
permiso limitado a un área específica.

#### 1. Problema que se resuelve

Vento OS necesita controlar capacidades dentro de subdivisiones concretas de una sede.

Ejemplos:

Vento Café
├── Caja
├── Barra
├── Cocina
├── Mostrador
└── Salón

Centro de Producción
├── Bodega
├── Cocina caliente
├── Galletería y Panadería
└── Repostería

Sin alcance por área, un permiso limitado a una sede podría interpretarse como acceso a todas sus áreas.

Ejemplo incorrecto:

permiso en Centro de Producción
        ↓
se asume acceso a:

Bodega;
Cocina caliente;
Panadería;
Repostería.

También pueden mezclarse conceptos diferentes:

employee_areas
employee_shifts.area_id
employee_settings.selected_area_id
shared_operational_devices.area_id
resource.area_id

Cada uno cumple una función distinta.

#### 2. Decisión principal

Un permiso por área será una autorización para ejecutar una capacidad concreta sobre recursos pertenecientes a un área empresarial específica dentro de una sede específica.

Fórmula
PERMISO CONCRETO
+
SEDE AUTORIZADA
+
ÁREA AUTORIZADA
+
RECURSO PERTENECIENTE A ESA ÁREA
**=**
CAPACIDAD CONCRETA EN ESA ÁREA

No implica:

acceso a toda la sede;
acceso a todas las áreas del mismo nombre;
acceso a áreas del mismo tipo;
acceso a todas las acciones;
acceso a otras sedes;
acceso global;
acceso operativo sin turno.

#### 3. Definición canónica

PERMISO POR ÁREA
**=**
capacidad territorial limitada
a un área empresarial identificada de forma única
dentro de una sede concreta

El permiso responde:

¿qué puede hacer el actor?

El área responde:

¿en qué subdivisión exacta puede hacerlo?
Regla
permission_code
→ capacidad

area_id
→ territorio específico

#### 4. Identidad del área

Un área será identificada por:

area_id

No únicamente por:

nombre;
código visible;
tipo de área;
posición;
texto de la interfaz.
Ejemplo
Vento Café / Cocina
≠
Saudo / Cocina-Barra
≠
Centro de Producción / Cocina caliente

Aunque los nombres sean similares.

Regla
mismo nombre
≠ misma área

#### 5. Fuente de verdad

La fuente canónica de las áreas empresariales será:

public.areas

Cada área deberá pertenecer obligatoriamente a una sede:

areas.site_id
Relación
public.sites
    ↓
public.areas
Regla
área sin sede
→ configuración inválida

#### 6. Área empresarial y ubicación física

Un área empresarial no es equivalente a:

ubicación de inventario;
estantería;
nivel;
posición;
zona técnica;
punto de check-in;
geocerca;
dispositivo;
centro de costo.

Ejemplo:

Área:
Bodega

Ubicaciones internas:
Estantería A
Estantería B
Cuarto frío
Zona de despacho

El permiso por área puede aplicar a Bodega, pero no convierte cada ubicación interna en un área laboral independiente.

Regla
business_area
≠ inventory_location

#### 7. Área y sede son inseparables

Toda evaluación por área deberá validar simultáneamente:

area_id;
area.site_id;
site_id del recurso;
site_id autorizado.
Fórmula
ÁREA AUTORIZADA
+
SEDE DEL ÁREA DISTINTA A LA SEDE DEL RECURSO
**=**
DENEGAR
Regla

No se podrá utilizar:

area_id

sin verificar su sede propietaria.

#### 8. Alcance por área específica

El alcance definido en esta tarea representa siempre:

una o varias áreas concretas identificadas por UUID

Cada asignación individual representa conceptualmente:

permission_code
+
specific_area_id
Ejemplo
permiso:
nexo.inventory.stock

área:
Centro de Producción / Bodega

Resultado:

✅ Consultar stock de Bodega
❌ Consultar stock de Cocina caliente
❌ Consultar stock de Repostería
❌ Consultar stock de Vento Café

#### 9. Varias áreas específicas

Un mismo rol o trabajador podrá tener el mismo permiso en varias áreas mediante asignaciones separadas.

Ejemplo:

nexo.inventory.remissions.request
→ Vento Café / Barra

nexo.inventory.remissions.request
→ Vento Café / Cocina
Regla
varias áreas autorizadas
**=**
unión de asignaciones explícitas

No se utilizará una lista textual dentro de una sola asignación.

#### 10. La asignación de área no es un permiso

Una fila activa en:

employee_areas

significa:

el trabajador tiene una relación administrativa habitual con esa área

No significa:

puede ejecutar todas las acciones del área.
Fórmula
ÁREA ASIGNADA
+
SIN PERMISO
**=**
DENEGAR

#### 11. El permiso no crea asignación de área

Conceder un permiso sobre un área no creará automáticamente:

employee_areas
Regla general
PERMISO ADMINISTRATIVO POR ÁREA
+
ÁREA NO ASIGNADA
**=**
DENEGAR

salvo que la asignación del permiso declare expresamente una responsabilidad transversal que no dependa de employee_areas.

Esa excepción deberá estar clasificada y documentada.

#### 12. Estado actual de employee_areas

La cobertura actual de employee_areas es insuficiente para utilizarla inmediatamente como única fuente de autorización.

Actualmente:

trabajadores activos con área permanente
→ 1

trabajadores activos sin área permanente
→ 39
Decisión

Durante el modelo definitivo:

employee_areas
→ fuente canónica futura de áreas administrativas asignadas

Pero durante la transición:

ausencia de employee_areas
≠ autorización implícita

ni:

ausencia de employee_areas
→ usar employees.area_id automáticamente

La implementación deberá poblar y validar las asignaciones antes de exigirlas en todos los flujos administrativos.

#### 13. employees.area_id

El campo:

employees.area_id

será considerado heredado.

No será fuente canónica de cobertura territorial.

Regla
employees.area_id
≠ áreas asignadas completas

Tampoco podrá reactivar una asignación inactiva de employee_areas.

#### 14. Área primaria

Una asignación con:

employee_areas.is_primary = true

representará:

área administrativa habitual;
valor predeterminado;
referencia laboral principal.

No representa:

permiso automático;
única área autorizada;
área operativa activa;
área del turno actual.
Regla
área primaria
≠ autorización

#### 15. Área seleccionada

El área seleccionada será una preferencia administrativa de interfaz.

Podrá determinar:

filtros iniciales;
tablero mostrado;
listas visibles;
contexto de navegación.

No concederá permisos.

Regla
selected_area_id
≠ authorized_area_id

#### 16. Validación del área seleccionada

Un área seleccionada será válida únicamente cuando:

exista;
esté activa;
pertenezca a la sede seleccionada;
esté dentro del alcance administrativo del actor;
no esté aislada;
sea compatible con la aplicación.

Si deja de ser válida:

se limpia la selección;
o se selecciona otra área autorizada.

No deberá conservarse como autoridad residual.

#### 17. Permiso administrativo por área

Un permiso administrativo por área:

no requiere turno;
no requiere check-in;
no requiere rol operativo.

Requiere:

actor autenticado;
empleado activo;
permiso administrativo exacto;
área autorizada;
sede del área autorizada;
recurso perteneciente al área;
ausencia de denegaciones superiores.
Ejemplo
supervisor
+
viso.staff.schedule.view
+
Centro de Producción / Repostería

permite consultar la programación correspondiente a Repostería.

No permite consultar automáticamente:

Panadería;
Cocina caliente;
Bodega.

#### 18. Permiso operativo por área

Un permiso operativo por área requiere:

turno publicado válido;
check-in activo cuando aplique;
sede operativa activa;
área operativa activa;
rol operativo activo;
rol habilitado en la sede y el área;
permiso operativo;
recurso perteneciente al área activa.
Fórmula
PERMISO OPERATIVO
+
ÁREA DEL TURNO
+
ROL VÁLIDO EN ESA ÁREA
+
RECURSO EN ESA ÁREA
**=**
AUTORIZACIÓN

#### 19. Fuente del área operativa activa

La fuente canónica será:

employee_shifts.area_id

dentro de un turno publicado y activo.

Relación
turno publicado
+
check-in activo
+
employee_shifts.area_id
**=**
área operativa activa
Regla
employee_areas
≠ área operativa activa

La asignación permanente indica dónde suele trabajar la persona.

El turno determina dónde está operando ahora.

#### 20. Área obligatoria en el turno

Cuando un rol operativo esté configurado para un área específica:

site_operational_roles.area_id IS NOT NULL

el turno deberá contener esa área.

Fórmula
ROL CONFIGURADO PARA ÁREA ESPECÍFICA
+
TURNO SIN AREA_ID
**=**
DENEGAR
Código conceptual
operational_area_required

Esto formaliza el problema detectado en turnos históricos con rol operativo pero área ausente.

#### 21. Rol operativo habilitado en área

La matriz:

public.site_operational_roles

define dónde puede existir el rol operativo.

La evaluación deberá validar:

site_id;
area_id;
role_code;
estado de la asignación.
Regla
permiso operativo válido
+
rol no habilitado en área
**=**
DENEGAR

#### 22. Rol habilitado a nivel sede

Puede existir una configuración operativa con:

site_operational_roles.area_id = null

Esto significará:

rol habilitado a nivel general de la sede

No significa automáticamente:

permiso sobre todas las áreas.

La capacidad concreta podrá exigir:

área activa;
recurso dentro de un área;
restricción adicional por permiso.

#### 23. Ausencia de área activa

Si una acción operativa requiere área y el contexto no tiene:

active_area_id

el resultado será:

DENEGAR

No se utilizarán como fallback:

área primaria;
área seleccionada;
primera área de la sede;
área del dispositivo;
employee_areas.
Regla
área operativa requerida
+
área activa ausente
**=**
DENEGAR

#### 24. Área del check-in

El modelo actual no obtiene un área real desde el check-in.

La auditoría encontró que:

active_checkin_area_id
→ siempre null en la implementación actual
Decisión

El check-in no será fuente canónica del área operativa.

check-in
→ confirma presencia y jornada

turno publicado
→ define el área operativa
Regla
geocerca o punto de marcación
≠ área operativa

#### 25. Área del dispositivo compartido

Un dispositivo compartido podrá estar fijado a:

device.site_id
device.area_id

El área del dispositivo actúa como restricción adicional.

No define por sí sola el área del actor.

Fórmula
ÁREA OPERATIVA DEL ACTOR
∩ ÁREA DEL DISPOSITIVO
∩ ÁREA DEL RECURSO
**=**
AUTORIZACIÓN
Regla
device.area_id
≠ active_area_id

#### 26. Dispositivo con área fija

Ejemplo:

CAJA_VENTO_CAFE_01
Sede: Vento Café
Área: Caja

Solo podrá ejecutar acciones operativas cuando:

actor.active_site_id = Vento Café
AND actor.active_area_id = Caja
AND resource.area_id = Caja
Resultado
✅ Cajero activo en Caja
❌ Barista activo en Barra
❌ Supervisor operando otra área

salvo una acción administrativa explícitamente permitida desde ese dispositivo.

#### 27. Dispositivo de nivel sede

Un dispositivo con:

device.area_id = null

será un dispositivo de nivel sede.

No se le asignará silenciosamente:

todas las áreas;
primera área;
área del actor;
área del recurso.
Regla

Para una acción que exige área:

device.area_id = null

podrá ser válido únicamente si la política del dispositivo permite operar con el área activa del actor.

La autorización seguirá dependiendo del actor y del recurso.

#### 28. Recursos con área directa

Algunos recursos podrán almacenar:

area_id

directamente.

Ejemplos:

turno;
solicitud de producción;
estación operativa;
asignación de trabajador;
configuración de rol;
dispositivo.

La autorización utilizará el área almacenada en el recurso.

Regla
resource.area_id
→ área objetivo

#### 29. Recursos con área indirecta

Algunos recursos pertenecerán a un área mediante relaciones.

Ejemplo:

movimiento
→ ubicación de inventario
→ área

o:

línea de producción
→ lote
→ orden
→ área productiva

La aplicación deberá definir una ruta canónica para resolverla.

Regla
sin area_id directo
≠ recurso sin área

#### 30. Recursos sin área

No todos los recursos de una sede pertenecen necesariamente a un área.

Ejemplos posibles:

configuración general de la sede;
reporte consolidado de sede;
administración local;
información transversal de la sede.

Un permiso por área no deberá autorizar estos recursos automáticamente.

Regla
resource_scope = site
+
permission_scope = area
**=**
ALCANCE INCOMPATIBLE

salvo que el recurso defina expresamente cómo se segmenta por área.

#### 31. Recursos que abarcan varias áreas

Algunas operaciones pueden afectar múltiples áreas dentro de una sede.

Ejemplos:

traslado interno;
solicitud de producción;
remisión entre bodega y producción;
reporte consolidado;
movimiento de inventario.

La operación deberá validar:

área de origen;
área de destino;
acción transversal;
permiso en cada área.
Fórmula
ORIGEN AUTORIZADO
+
DESTINO NO AUTORIZADO
**=**
DENEGAR

salvo un permiso transversal específico.

#### 32. Lectura multiárea

Una consulta podrá consolidar varias áreas cuando:

el actor tenga permiso en cada área;
la operación admita consolidación;
el resultado excluya áreas no autorizadas;
no exista una restricción de sensibilidad.
Regla
resultado multiárea
**=**
unión de áreas individualmente autorizadas

No:

consultar una sede
→ incluir todas sus áreas

#### 33. Mutación multiárea

Una mutación que afecte varias áreas requerirá:

autorización en cada área;
permiso transversal cuando corresponda;
validación de origen y destino;
auditoría de todas las áreas afectadas.
Ejemplo
Mover inventario:

Origen:
Bodega

Destino:
Cocina caliente

No bastará con tener permiso únicamente en Bodega.

#### 34. Áreas con el mismo nombre

Las áreas no se agruparán por nombre.

Ejemplo:

Vento Café / Cocina
Saudo / Cocina-Barra
Centro de Producción / Cocina caliente

No se considerarán equivalentes por contener la palabra:

Cocina
Regla
name matching
≠ authorization

#### 35. Áreas inactivas

Si:

areas.is_active = false

los permisos sobre esa área no serán efectivos para operación actual.

Resultado
permiso válido
+
área inactiva
**=**
DENEGAR

El historial podrá conservarse para auditoría.

#### 36. Asignaciones de área inactivas

Si:

employee_areas.is_active = false

la asignación no será válida para autorización.

#### 37. Empleado inactivo

employees.is_active = false
→ DENEGAR

#### 38. Área en sede no asignada

área autorizada
+
sede no asignada
**=**
DENEGAR

#### 39. Integridad de employee_areas

Debe cumplir coherencia entre:

empleado;
sede;
área;
estado;
relación válida.

#### 40. Áreas aisladas

área aislada
+
sin permiso especial
**=**
DENEGAR

#### 41. Área administrativa vs operativa

misma área
≠ mismo contexto

#### 42. Roles administrativos locales

Permisos pueden limitarse por área.

#### 43. Roles operativos

Deben ser válidos en área específica.

#### 44. Rol operativo de nivel sede

Puede operar sin área solo si el permiso lo permite.

#### 45. Excepciones individuales

employee_permissions

#### 46. Compatibilidad del permiso

permiso incompatible con área
**=**
CONFIGURACIÓN INVÁLIDA

#### 47. Nuevas áreas

no heredan permisos automáticamente

#### 48. Cambio de sede de área

Operación sensible.

#### 49. Eliminación de área

usar desactivación

#### 50. Cambio de nombre

area_id permanece

#### 51. Simulación

No modifica datos reales.

#### 52. Datos ausentes

→ DENEGAR

#### 53. Códigos de bloqueo

area_permission_not_granted
area_required
area_not_found
area_inactive
area_mismatch
area_not_assigned
area_operational_missing
area_role_invalid
area_device_mismatch
area_multi_scope_not_allowed

#### 54. Bypass

NO permitido por nombre de rol

#### 55. Guards

Validan:

permiso;
área;
sede;
contexto.

#### 56. RPC

Debe resolver área desde recurso.

#### 57. RLS

Debe validar área real.

#### 58. Navegación

Debe limitar áreas visibles.

#### 59. Auditoría

Debe registrar área real.

#### 60. Aplicaciones

Todas deben respetar área.

#### 61. UI

Debe mostrar alcance por área.

#### 62. Contrato

Define estructuras de área.

#### 63. Precedencia

Área real > área seleccionada.

#### 64. Invariantes

Área limita territorio, no acción.

#### 65. Alternativas descartadas

No usar:

employees.area_id
selected_area_id
nombre de área

#### 66. Riesgos

Cobertura incompleta de áreas.

#### 67. Pendientes

Continuar con AUTH-MOD-017.

#### 68. Decisión final

PERMISO
+
ÁREA
+
RECURSO
**=**
AUTORIZACIÓN

#### 69. Criterio de aprobación

Modelo consistente y sin ambigüedad.

✅ Conclusión

ÁREA
→ territorio

PERMISO
→ capacidad

El acceso depende de ambos.

### ✅ AUTH-MOD-017 — Definir permisos por tipo de área

El modelo aprobado ya distingue:

área específica
→ territorio identificado mediante area_id

tipo de área
→ categoría funcional reutilizable en varias áreas

Esta tarea impide que el tipo de área sea interpretado como:

un área específica;
un nombre de área;
una ubicación de inventario;
un rol operativo;
una sede;
todas las áreas de la organización;
un reemplazo del turno;
un reemplazo de employee_areas.

#### 1. Problema que se resuelve

Vento OS puede tener áreas funcionalmente equivalentes en sedes diferentes.

Ejemplos conceptuales:

Vento Café / Caja
Saudo / Caja
Molka / Caja
Vento Café / Barra
Saudo / Barra
Molka / Barra
Centro de Producción / Bodega
Centro de Distribución / Bodega

Sin un alcance por tipo de área sería necesario asignar repetidamente el mismo permiso:

permiso para Vento Café / Caja;
permiso para Saudo / Caja;
permiso para Molka / Caja.

Pero utilizar:

scope = global

o:

scope = site

sería demasiado amplio.

El alcance por tipo de área expresa:

esta capacidad es válida
en áreas pertenecientes a una categoría funcional exacta
dentro de sedes previamente autorizadas

#### 2. Decisión principal

Un permiso por tipo de área es una autorización para ejecutar una capacidad concreta sobre recursos pertenecientes a áreas cuya clasificación canónica coincide con un tipo autorizado.

Fórmula
PERMISO CONCRETO
+
LÍMITE DE SEDE AUTORIZADO
+
TIPO DE ÁREA AUTORIZADO
+
ÁREA REAL DEL RECURSO
+
COINCIDENCIA EXACTA DEL TIPO
**=**
CAPACIDAD CONCRETA EN ESA CATEGORÍA DE ÁREAS

No implica:

acceso global;
acceso a cualquier sede;
acceso a todas las áreas;
acceso a áreas con nombres parecidos;
acceso a todas las acciones;
acceso operativo sin turno;
operación simultánea en varias áreas.

#### 3. Definición canónica

PERMISO POR TIPO DE ÁREA
**=**
capacidad territorial reutilizable
en áreas empresariales activas
de una categoría funcional exacta
dentro de sedes autorizadas

El permiso responde:

¿qué puede hacer el actor?

El tipo de área responde:

¿en qué categoría funcional de áreas puede hacerlo?

La sede responde:

¿dentro de qué límite territorial puede aplicarse?
Regla
permission_code
→ capacidad

area_type
→ categoría funcional

site scope
→ límite territorial superior

#### 4. El tipo de área siempre depende de una sede

Un área pertenece obligatoriamente a una sede.

Por tanto, un tipo de área nunca se evalúa de forma territorialmente aislada.

Fórmula
TIPO DE ÁREA
+
SIN LÍMITE DE SEDE RESOLUBLE
**=**
DENEGAR
Regla crítica
area_type
≠ alcance global autónomo

El permiso opera dentro de uno de estos límites superiores:

sede específica;
sedes asignadas;
tipo de sede autorizado;
todas las sedes ordinarias mediante permiso transversal explícito.

#### 5. Fuente de verdad

La fuente canónica futura será un catálogo normalizado:

public.area_types
        ↓
public.areas.area_type_code

Mientras no exista completamente normalizado, podrá utilizarse transitoriamente el atributo funcional vigente de public.areas.

Si el campo actual se denomina:

area_kind

este será tratado como fuente transitoria.

Regla
area_type
o area_kind canónico
→ clasificación para autorización

No se utilizará directamente:

areas.name;
nombre visible;
descripción;
slug informal;
traducción.

#### 6. Catálogo de tipos de área

Cada tipo declara como mínimo:

code;
name;
description;
is_active;
is_authorizable;
supports_administrative_context;
supports_operational_context;
requires_operational_area;
compatible_site_types;
is_sensitive;
is_isolated;
Ejemplos conceptuales
administrative
cashier
bar
kitchen
service
warehouse
dispatch
receiving
production
bakery
pastry
quality_control

#### 7. Tipo de área y nombre de área

El nombre visible de un área no es fuente de autorización.

Regla
area.name
≠ area_type

#### 8. Coincidencia exacta

resource_area.area_type_code
**=**
permission_scope.area_type_code

No se admiten coincidencias parciales.

#### 9. Sin jerarquía implícita

tipo padre
≠ tipos hijos

#### 10. Solo áreas empresariales

Solo participan áreas activas, autorizables y correctamente clasificadas.

#### 11. Diferencia frente a ubicación de inventario

Ejemplo:

Área empresarial:
Bodega

Tipo de área:
warehouse

Ubicaciones:
Estantería A
Estantería B
Cuarto frío
Recepción de mercancía

El permiso por tipo de área aplica a:

warehouse

No convierte cada ubicación en un área autorizable independiente.

Regla
inventory_location.type
≠ area_type

#### 12. Diferencia frente a rol operativo

Ejemplo:

Tipo de área:
warehouse

Roles posibles:
bodeguero
auxiliar_bodega
supervisor_logistico

El tipo de área define territorio funcional.

El rol operativo define la función temporal del trabajador.

Regla
area_type
≠ operational_role

Tener el rol:

bodeguero

no autoriza automáticamente todas las áreas:

warehouse

#### 13. Modalidades del alcance

Se reconocen tres modalidades conceptuales:

#### 1. ÁREAS ASIGNADAS DEL TIPO

#### 2. TODAS LAS ÁREAS DEL TIPO DENTRO DE SEDES AUTORIZADAS

#### 3. ÁREAS DEL TIPO DENTRO DEL CONTEXTO OPERATIVO ACTIVO

Las dos primeras corresponden principalmente a administración.

La tercera corresponde a operación.

#### 14. Modalidad administrativa: áreas asignadas del tipo

Código conceptual
area_type_scope_mode = assigned_areas_of_type
Definición

El permiso será efectivo únicamente en áreas que cumplan:

el empleado tiene asignación activa al área;
el área pertenece a una sede asignada;
el área coincide con el tipo autorizado;
la sede se encuentra dentro del alcance del permiso.
Fórmula
PERMISO
∩ EMPLOYEE_AREAS ACTIVAS
∩ SEDES AUTORIZADAS
∩ AREA_TYPE AUTORIZADO
**=**
ALCANCE EFECTIVO
Ejemplo

Trabajador:

Áreas asignadas:
✅ Vento Café / Barra        → bar
✅ Saudo / Barra             → bar
✅ Vento Café / Caja         → cashier

Permiso:

viso.staff.schedule.view
+
area_type = bar
+
mode = assigned_areas_of_type

Resultado:

✅ Vento Café / Barra
✅ Saudo / Barra
❌ Vento Café / Caja
❌ Molka / Barra no asignada

#### 15. Modalidad administrativa: todas las áreas del tipo dentro de sedes autorizadas

Código conceptual
area_type_scope_mode = all_areas_of_type_within_site_scope
Definición

El permiso será efectivo en todas las áreas del tipo que se encuentren dentro del alcance superior de sedes del actor.

No requerirá una fila en employee_areas para cada área.

Fórmula
PERMISO
+
SEDE AUTORIZADA
+
AREA_TYPE AUTORIZADO
+
MODE = ALL_AREAS_WITHIN_SITE_SCOPE
**=**
CAPACIDAD EN TODAS LAS ÁREAS DEL TIPO
DENTRO DE ESAS SEDES
Ejemplo

Trabajador:

Sedes autorizadas:
Vento Café
Saudo

Permiso:

numera.sales.view
+
area_type = cashier
+
all_areas_of_type_within_site_scope

Resultado:

✅ Vento Café / Caja
✅ Saudo / Caja
❌ Molka / Caja
❌ Vento Café / Barra

#### 16. Prohibición de all_areas_of_type sin límite superior

No existirá una modalidad ambigua como:

all_areas_of_type

sin especificar el alcance superior de sede.

Motivo

Una categoría como:

warehouse

podría existir en:

Centro de Producción;
Centro de Distribución;
Vento Café;
futuras sedes.

Autorizarla sin límite superior produciría una expansión territorial implícita.

Regla
area_type
+
site_scope ausente
**=**
CONFIGURACIÓN INVÁLIDA

#### 17. Modalidad predeterminada

La modalidad administrativa predeterminada será:

assigned_areas_of_type
Motivo

Es la alternativa de menor privilegio.

Regla transitoria
scope_type = area_type
sin modalidad explícita
→ assigned_areas_of_type

En el modelo definitivo la modalidad deberá almacenarse expresamente.

#### 18. Permiso administrativo por tipo de área

No requiere:

turno;
check-in;
rol operativo.

Requiere:

actor autenticado;
empleado activo;
permiso administrativo exacto;
límite superior de sede;
tipo de área válido;
modalidad válida;
área real del recurso;
coincidencia exacta;
ausencia de restricciones superiores.
Ejemplo
supervisor
+
viso.staff.schedule.view
+
sedes asignadas
+
area_type = production

podrá consultar programación de áreas productivas dentro de sus sedes autorizadas.

#### 19. Permiso operativo por tipo de área

Un permiso operativo por tipo de área significa:

la capacidad puede utilizarse
cuando el área operativa activa
pertenece al tipo autorizado
Requisitos
turno publicado válido;
check-in activo cuando aplique;
sede operativa activa;
área operativa activa;
rol operativo activo;
rol habilitado en la sede y área;
permiso operativo;
tipo del área coincidente;
recurso dentro del área activa.
Fórmula
PERMISO OPERATIVO
+
ÁREA DEL TURNO
+
TIPO DEL ÁREA COINCIDENTE
+
ROL VÁLIDO
+
RECURSO EN EL ÁREA ACTIVA
**=**
AUTORIZACIÓN

#### 20. Modalidad operativa

Código conceptual
area_type_scope_mode = active_operational_area_of_type
Definición

El permiso puede utilizarse únicamente cuando:

active_area_id existe;
el área activa pertenece a la sede activa;
el tipo del área activa coincide;
el rol está habilitado en esa área;
el recurso corresponde al área activa.
Regla
permiso operativo por tipo
→ reutilizable en diferentes turnos válidos

NO
→ acceso simultáneo a todas las áreas del tipo

#### 21. El tipo no reemplaza el área del turno

Ejemplo:

Vento Café / Barra → bar
Saudo / Barra      → bar
Molka / Barra      → bar

Trabajador:

turno activo:
Vento Café / Barra

Permiso:

pulso.bar.orders.manage
+
area_type = bar

Resultado:

✅ Puede operar Vento Café / Barra
❌ No puede operar Saudo / Barra
❌ No puede operar Molka / Barra
Regla
mismo tipo de área
≠ misma área operativa

#### 22. El tipo no reemplaza la sede del turno

Para operación deben coincidir:

sede del turno;
sede del área;
sede del recurso;
sede del dispositivo cuando aplique.
Fórmula
TIPO DE ÁREA COINCIDENTE
+
SEDE DIFERENTE
**=**
DENEGAR

#### 23. El tipo no reemplaza el rol operativo

Ejemplo:

Área:
Vento Café / Barra

Tipo:
bar

El permiso por tipo no autoriza a cualquier empleado activo en Barra.

También se requiere:

rol operativo válido;
permiso concedido al rol;
rol habilitado en la sede y área.
Regla
área del tipo correcto
+
rol incorrecto
**=**
DENEGAR

#### 24. Configuración del rol operativo

La fuente de verdad seguirá siendo:

public.site_operational_roles

La evaluación deberá comprobar:

site_id;
area_id;
role_code;
is_active;
compatibilidad con el tipo de área.
Regla

La compatibilidad abstracta entre rol y tipo no reemplaza la habilitación en el área concreta.

rol compatible con bar
+
no habilitado en Vento Café / Barra
**=**
DENEGAR

#### 25. Rol habilitado a nivel de sede

Si:

site_operational_roles.area_id = null

el rol está habilitado a nivel de sede.

Sin embargo, un permiso operativo por tipo de área seguirá requiriendo:

active_area_id;
tipo del área activa;
recurso en esa área.
Regla
rol de nivel sede
≠ todas las áreas del tipo

#### 26. Área activa obligatoria

Un permiso operativo por tipo de área siempre requiere:

active_area_id

No será suficiente:

sede activa;
tipo inferido desde el rol;
área del dispositivo;
employee_areas;
área seleccionada.
Fórmula
PERMISO OPERATIVO POR TIPO DE ÁREA
+
ACTIVE_AREA_ID AUSENTE
**=**
DENEGAR

#### 27. Fuente del tipo operativo

La resolución será:

employee_shifts.area_id
        ↓
public.areas
        ↓
area_type_code

No se obtendrá desde:

check-in;
nombre del rol;
nombre del dispositivo;
ruta de la aplicación;
valor enviado por el frontend.

#### 28. Check-in

El check-in confirma presencia.

No define:

area_id;
area_type;
rol operativo;
permiso.
Regla
check-in válido
≠ tipo de área válido

El tipo se deriva del área del turno.

#### 29. Dispositivos compartidos

Un dispositivo compartido puede estar vinculado a:

device.site_id;
device.area_id.

La autorización deberá comprobar:

área operativa del actor;
área del dispositivo;
tipo del área;
área del recurso.
Fórmula
ACTIVE_AREA_ID
**=**
DEVICE_AREA_ID
**=**
RESOURCE_AREA_ID

Y

AREA_TYPE
**=**
AUTHORIZED_AREA_TYPE

cuando el dispositivo esté fijado a un área.

#### 30. El tipo del dispositivo no amplía alcance

Aunque un dispositivo esté clasificado como:

device_area_type = cashier

no podrá utilizarse para operar cualquier área de Caja.

Ejemplo
Dispositivo:
Caja Vento Café

Tipo de área:
cashier

No permite:

operar Caja Saudo;
operar Caja Molka.
Regla
device.area_id
→ restricción exacta

device area type
→ clasificación descriptiva o validación adicional

#### 31. Dispositivo sin área concreta

Un dispositivo operativo que dependa de tipo de área pero no tenga:

device.area_id

solo será válido cuando la política permita utilizar el área activa del actor.

No podrá declarar:

device_area_type = warehouse

y funcionar libremente en todas las bodegas.

Regla
dispositivo por tipo sin sede y área concretas
→ configuración inválida para operación territorial

#### 32. Recursos territoriales

La autorización deberá resolver:

recurso
→ area_id real
→ site_id real
→ area_type real

El tipo nunca se aceptará únicamente desde un parámetro.

Regla
resource_area.area_type
→ tipo objetivo

#### 33. Recursos con área indirecta

Cuando el recurso no tenga area_id directo, deberá existir una ruta canónica.

Ejemplo:

inventory_movement
→ inventory_location
→ area_id
→ area_type

Otro ejemplo:

production_request
→ production_line
→ area_id
→ area_type
Regla
sin area_id directo
≠ sin tipo de área

#### 34. Recursos de nivel sede

Un recurso que pertenece solamente a una sede no será autorizado automáticamente mediante tipo de área.

Fórmula
resource_scope = site
+
permission_scope = area_type
**=**
ALCANCE INCOMPATIBLE

Ejemplos:

configuración general de la sede;
reporte consolidado de sede;
datos administrativos sin segmentación de área.

#### 35. Recursos organizacionales

Los recursos organizacionales tampoco utilizarán tipo de área.

Ejemplos:

catálogo de permisos;
roles base;
aplicaciones;
políticas organizacionales;
configuración global.
Regla
resource_scope = organization
+
scope = area_type
**=**
ALCANCE INCOMPATIBLE

#### 36. Recursos multiárea del mismo tipo

Una operación puede involucrar dos áreas del mismo tipo.

Ejemplo:

origen:
Centro de Producción / Bodega 1
→ warehouse

destino:
Centro de Producción / Bodega 2
→ warehouse

Compartir el tipo no autoriza automáticamente la operación.

Deberán validarse:

área de origen;
área de destino;
sede;
permiso transversal;
modo administrativo u operativo.
Regla
mismo tipo
≠ autorización entre áreas

#### 37. Recursos multiárea de tipos distintos

Ejemplo:

origen:
Bodega
→ warehouse

destino:
Cocina caliente
→ kitchen

Un permiso limitado a:

warehouse

no autoriza el destino.

Un permiso limitado a:

kitchen

no autoriza el origen.

Resultado
ORIGEN AUTORIZADO
+
DESTINO NO AUTORIZADO
**=**
DENEGAR

salvo capacidad transversal específica.

#### 38. Operaciones transversales entre tipos

Procesos como:

entregar insumos de Bodega a Cocina;
enviar producto terminado a Despacho;
recibir mercancía y trasladarla a Bodega;
transferir producción entre líneas.

requieren capacidades explícitas que reconozcan:

origen;
destino;
acción transversal;
custodia;
auditoría.

No se resolverán ampliando informalmente un permiso por tipo.

#### 39. Lectura consolidada por tipo

Un permiso administrativo podrá consolidar varias áreas del mismo tipo cuando:

todas estén dentro del alcance superior de sedes;
la modalidad permita todas las áreas del tipo;
la operación sea compatible;
se excluyan áreas no autorizadas;
no exista información sensible adicional.
Ejemplo
Ventas de todas las áreas de Caja
en Vento Café y Saudo
Regla
resultado consolidado
**=**
unión de áreas autorizadas del tipo

#### 40. Mutación masiva por tipo

Una asignación para todas las áreas de un tipo no autoriza automáticamente una mutación masiva.

Ejemplo:

actualizar configuración de todas las Cajas

podrá requerir:

permiso masivo específico;
previsualización;
confirmación reforzada;
auditoría;
idempotencia;
reversión.
Regla
all_areas_of_type_within_site_scope
≠ bulk mutation

#### 41. Nuevas áreas

assigned_areas_of_type

Una nueva área no queda disponible hasta que:

se asigne activamente al trabajador.
all_areas_of_type_within_site_scope

Una nueva área queda incluida automáticamente cuando:

pertenece a una sede ya autorizada;
tiene el tipo autorizado;
está activa;
es autorizable;
no está aislada.
Riesgo

Crear un área nueva puede ampliar permisos transversales existentes.

#### 42. Nuevas sedes

Una nueva sede no queda incluida únicamente porque contenga un tipo de área autorizado.

Primero debe formar parte del alcance superior del permiso.

Regla
NUEVA SEDE
+
ÁREA DEL TIPO AUTORIZADO
+
SEDE FUERA DEL SITE_SCOPE
**=**
DENEGAR

#### 43. Cambio de tipo de un área

Cambiar:

area_type_code

puede modificar inmediatamente múltiples autorizaciones.

Ejemplo:

Área X
warehouse
→ dispatch

podría:

retirar permisos de warehouse;
activar permisos de dispatch;
invalidar roles operativos;
afectar dispositivos;
afectar turnos.
Regla

El cambio deberá ser:

explícito;
auditado;
previsualizado;
protegido por permiso sensible;
validado contra recursos y roles existentes.

#### 44. Efecto sobre sesiones activas

Cuando cambia el tipo de un área:

sesiones administrativas
→ reevaluar

sesiones operativas del área
→ invalidar o reevaluar

sesiones ligeras en dispositivos
→ recargar contexto

caché de permisos
→ descartar
Regla
area_type_changed
→ autorización territorial previa inválida

#### 45. Tipo inactivo

Si:

area_type.is_active = false

el tipo no concederá acceso.

Fórmula
permiso válido
+
tipo inactivo
**=**
DENEGAR

#### 46. Área sin tipo

Un área sin clasificación canónica no podrá participar en permisos por tipo.

area_type_code = null
→ DENEGAR

No se inferirá desde el nombre.

#### 47. Tipo desconocido

Una asignación que contenga un tipo inexistente será inválida.

unknown_area_type
→ CONFIGURACIÓN INVÁLIDA

No se aceptarán cadenas arbitrarias.

#### 48. Compatibilidad entre tipo de sede y tipo de área

El catálogo podrá declarar qué tipos de área son válidos dentro de cada tipo de sede.

Ejemplos:

satellite
→ cashier
→ bar
→ kitchen
→ service
production_center
→ warehouse
→ bakery
→ pastry
→ kitchen
→ dispatch
Regla
area_type incompatible con site_type
→ configuración inválida

Esto no sustituye la existencia del área concreta.

#### 49. Área aislada o sensible

Un tipo podrá ser sensible:

quality_control;
treasury;
human_resources;
technical_room.

También un área específica podrá ser aislada aunque su tipo ordinario no lo sea.

Fórmula
TIPO COINCIDENTE
+
ÁREA AISLADA
+
SIN AUTORIZACIÓN ESPECIAL
**=**
DENEGAR
Regla

La clasificación específica del área puede restringir más que el tipo.

#### 50. Roles administrativos locales

Roles como:

gerente;
supervisor.

utilizarán normalmente:

assigned_areas_of_type

o:

all_areas_of_type_within_site_scope

dentro de sus sedes asignadas.

No obtendrán acceso a sedes adicionales mediante el tipo de área.

#### 51. Roles funcionales transversales

Roles como:

contador;
auditor;
coordinador de operaciones;
responsable de calidad.

podrán recibir permisos por tipo de área dentro de un alcance superior explícito.

Ejemplo:

responsable_calidad
+
fogo.quality.view
+
site_scope = production_centers
+
area_type = production

No concede capacidades distintas al permiso exacto.

#### 52. Roles operativos

Los permisos por tipo de área son especialmente útiles para reutilizar matrices operativas.

Ejemplos:

cajero_satelite
→ cashier

barista_satelite
→ bar

servicio_salon
→ service

bodeguero
→ warehouse

produccion_panaderia
→ bakery

produccion_reposteria
→ pastry
Regla

La matriz puede expresar compatibilidad general.

El turno y site_operational_roles determinan el área concreta.

#### 53. Excepciones individuales

employee_permissions podrá conceder o denegar una capacidad por tipo de área.

Deberá declarar:

employee_id;
permission_code;
site_scope;
area_type_code;
scope_mode;
is_allowed;
justificación;
vigencia;
creador;
auditoría.
Regla

Una excepción individual no deberá corregir permanentemente una matriz general defectuosa.

#### 54. Compatibilidad del permiso

No todos los permisos admitirán alcance por tipo de área.

Potencialmente compatibles
consultar personal operativo;
consultar programación;
operar caja;
gestionar pedidos de barra;
consultar producción;
consultar inventario;
gestionar despacho;
consultar indicadores por línea.
Potencialmente incompatibles
gestionar aplicaciones;
administrar roles base;
administrar permisos globales;
configurar políticas organizacionales;
administrar catálogos organizacionales.
Regla
permiso incompatible con area_type
+
asignación area_type
**=**
CONFIGURACIÓN INVÁLIDA

#### 55. Simulación

La simulación podrá evaluar:

tipo de área;
modalidad;
límite superior de sede;
área asignada del tipo;
área no asignada del tipo;
área operativa del tipo;
rol incompatible;
dispositivo en otra área;
área aislada;
operación entre tipos.

No podrá:

cambiar el tipo real;
crear áreas;
modificar employee_areas;
modificar turnos;
modificar roles operativos;
modificar permisos.

#### 56. Comportamiento ante datos ausentes

| Dato ausente o inválido                     | Resultado |
| ------------------------------------------- | --------- |
| Actor no autenticado                        | Denegar   |
| Empleado inexistente                        | Denegar   |
| Empleado inactivo                           | Denegar   |
| Aplicación inexistente                      | Denegar   |
| Permiso inexistente                         | Denegar   |
| Permiso incompatible con tipo de área       | Denegar   |
| Tipo de área inexistente                    | Denegar   |
| Tipo de área inactivo                       | Denegar   |
| Modalidad ausente en el modelo definitivo   | Denegar   |
| Límite superior de sede ausente             | Denegar   |
| Sede inexistente o inactiva                 | Denegar   |
| Área inexistente                            | Denegar   |
| Área inactiva                               | Denegar   |
| Área sin tipo                               | Denegar   |
| Tipo incompatible con la sede               | Denegar   |
| Área no asignada cuando sea requerida       | Denegar   |
| Sede no autorizada                          | Denegar   |
| Recurso sin área resoluble                  | Denegar   |
| Tipo enviado distinto al tipo real          | Denegar   |
| Turno ausente en operación                  | Denegar   |
| Área activa ausente                         | Denegar   |
| Tipo del área activa no coincidente         | Denegar   |
| Rol no habilitado en el área                | Denegar   |
| Dispositivo en otra área                    | Denegar   |
| Área aislada sin autorización               | Denegar   |
| Operación multiárea parcialmente autorizada | Denegar   |

#### 57. Códigos de bloqueo

area_type_permission_not_granted
area_type_scope_invalid
area_type_scope_mode_invalid
area_type_site_scope_required
area_type_not_found
area_type_inactive
area_type_not_authorizable
area_type_permission_incompatible
area_type_site_not_found
area_type_site_inactive
area_type_site_not_allowed
area_type_site_incompatible
area_type_area_not_found
area_type_area_inactive
area_type_area_not_assigned
area_type_area_isolated
area_type_resource_scope_unresolved
area_type_resource_mismatch
area_type_operational_context_required
area_type_operational_area_required
area_type_operational_area_mismatch
area_type_operational_role_invalid
area_type_operational_role_not_allowed
area_type_device_mismatch
area_type_origin_not_allowed
area_type_destination_not_allowed
area_type_cross_type_action_required
area_type_bulk_action_not_allowed
area_type_explicit_deny

La precedencia definitiva se establecerá en:

AUTH-MOD-018
AUTH-MOD-019

#### 58. Bypass permitidos

| Caso                                       | Permitido |
| ------------------------------------------ | --------- |
| Propietario por nombre                     | ❌         |
| Gerente general por nombre                 | ❌         |
| Gerente por nombre                         | ❌         |
| Nombre del área como tipo                  | ❌         |
| Coincidencia aproximada                    | ❌         |
| Tipo de área sin sede autorizada           | ❌         |
| Área seleccionada como autoridad           | ❌         |
| Área primaria como autoridad               | ❌         |
| Rol operativo como reemplazo del tipo      | ❌         |
| Tipo correcto con turno en otra área       | ❌         |
| Tipo correcto con dispositivo en otra área | ❌         |
| Operación entre áreas por compartir tipo   | ❌         |
| Punto técnico incluido por similitud       | ❌         |
| Proceso técnico exacto con service_role    | ✅         |
| Migración controlada                       | ✅         |
| Auditoría histórica autorizada             | ✅         |

Regla
mismo tipo de área
→ similitud funcional

NO
→ misma autorización territorial

#### 59. Impacto en guards

Los guards deberán recibir o resolver:

permission_code;
authorization_mode;
area_type_scope_mode;
authorized_area_type;
site_scope;
target_resource;
target_site_id;
target_area_id;
target_area_type;
operational_area_id cuando aplique;
device_area_id cuando aplique.
Guard administrativo
requireAdministrativeAreaTypePermission(
  permission,
  resource
)

Deberá validar:

permiso;
compatibilidad;
límite de sede;
modalidad;
área real;
tipo real;
employee_areas cuando aplique;
aislamiento;
denegaciones.
Guard operativo
requireOperationalAreaTypePermission(
  permission,
  operationalContext,
  resource
)

Deberá validar:

turno;
sede activa;
área activa;
tipo del área;
rol operativo;
recurso;
dispositivo;
denegaciones.

#### 60. Impacto en RPC

Toda RPC que utilice tipo de área deberá:

resolver auth.uid();
resolver empleado activo;
validar permiso exacto;
validar compatibilidad con area_type;
resolver recurso objetivo;
derivar area_id real;
derivar site_id real;
derivar area_type real;
validar alcance superior de sede;
validar modalidad;
validar employee_areas cuando aplique;
validar contexto operativo cuando aplique;
validar aislamiento;
registrar sede, área y tipo efectivos.
Prohibición

No deberá confiar exclusivamente en:

p_area_type;
p_area_id;
p_site_id;
selected_area_id;
nombre del área;
valor enviado por el frontend.

#### 61. Impacto en RLS

Una política por tipo de área deberá resolver:

row
→ area_id
→ areas.area_type_code
→ areas.site_id
→ validación del permiso

No será suficiente:

row.area_type = requested_area_type

si el valor es controlado por el cliente.

También deberá comprobar:

empleado activo;
permiso exacto;
modalidad;
límite de sede;
asignaciones cuando apliquen;
contexto operativo;
aislamiento;
denegaciones.

#### 62. Impacto en navegación

La interfaz podrá agrupar áreas por tipo.

Cómo se verá
Vento Café

Caja
✓ Caja principal

Barra
✓ Barra principal

Cocina
— Cocina

Servicio
— Salón

La interfaz deberá mostrar únicamente:

tipos autorizados;
áreas efectivamente autorizadas dentro de cada tipo;
sedes dentro del alcance.

No deberá mostrar un tipo como utilizable si no contiene áreas efectivas.

#### 63. Impacto en auditoría

Toda acción autorizada por tipo de área deberá registrar:

employee_id;
auth_user_id;
permission_code;
authorization_mode;
site_scope;
area_type_scope_mode;
authorized_area_type;
resource_type;
resource_id;
resource_site_id;
resource_area_id;
resource_area_type_at_decision;
operational_area_id cuando aplique;
device_area_id cuando aplique;
operational_role cuando aplique;
decision;
occurred_at.
Regla

La auditoría conservará:

tipo configurado en el permiso;
tipo real del área;
área exacta;
sede exacta.

#### 64. Impacto en aplicaciones

VISO

Permitirá configurar:

áreas asignadas de un tipo;
todas las áreas de un tipo dentro de sedes autorizadas;
área específica;
tipo de sede;
sede;
alcance global.

Estas opciones no deberán mezclarse implícitamente.

ANIMA

Podrá consultar o administrar turnos por tipo de área dentro de sedes autorizadas.

El turno seguirá definiendo el área operativa concreta.

NEXO

Podrá distinguir tipos como:

warehouse;
dispatch;
receiving.

La operación seguirá limitada a ubicación, área y sede reales.

FOGO

Podrá reutilizar capacidades para:

bakery;
pastry;
kitchen;
production.

El trabajador continuará limitado al área de su turno.

ORIGO

Podrá limitar recepciones o responsabilidades por tipos como:

receiving;
warehouse.
PULSO

Podrá reutilizar capacidades para:

cashier;
bar;
kitchen;
service.

Cada terminal y turno permanecerán vinculados a un área específica.

NUMERA

Podrá consolidar indicadores por tipo de área dentro de un alcance superior autorizado.

No inventará tipos para recursos que no tienen atribución de área.

#### 65. Cómo se verá en VISO

Áreas asignadas del tipo
Permiso
PULSO · Consultar ventas

Alcance superior
Sedes asignadas

Alcance de área
● Tipo de área

Tipo
[ Caja ▼ ]

Modalidad
● Solo áreas asignadas de este tipo
○ Todas las áreas de este tipo en sedes autorizadas

Resultado
✅ Vento Café / Caja
✅ Saudo / Caja
❌ Molka / Caja — no asignada
Todas las áreas del tipo dentro del alcance
Permiso
NUMERA · Consultar ventas

Alcance superior
Tipo de sede: Satélite

Tipo de área
Caja

Modalidad
● Todas las áreas del tipo en sedes autorizadas

Incluye
✅ Vento Café / Caja
✅ Saudo / Caja
✅ Molka / Caja

Excluye
❌ Centro de Producción / Bodega
❌ APP-REVIEW / Caja
Evaluación operativa
Sede activa
Vento Café

Área activa
Barra principal

Tipo de área
bar

Rol operativo
barista_satelite

Permiso
pulso.bar.orders.manage

✅ Área activa presente
✅ Tipo coincidente
✅ Rol habilitado
✅ Recurso pertenece al área

#### 66. Contrato resultante

AreaTypePermissionScope
AreaTypePermissionScope
├── scope_type: area_type
├── area_type_code
├── mode
│   ├── assigned_areas_of_type
│   ├── all_areas_of_type_within_site_scope
│   └── active_operational_area_of_type
├── parent_site_scope
├── authorization_mode
│   ├── administrative
│   └── operational
├── requires_employee_area_assignment
├── requires_active_operational_area
├── isolated_areas_allowed
├── multi_area_aggregation_allowed
├── cross_area_action_allowed
└── bulk_action_allowed
EffectiveAreaTypeScope
EffectiveAreaTypeScope
├── employee_id
├── authorized_area_type
├── scope_mode
├── parent_site_scope
├── authorized_site_ids
├── assigned_area_ids
├── areas_matching_type
├── effective_area_ids
├── operational_site_id
├── operational_area_id
├── operational_area_type
├── device_area_id
├── resource_area_ids
├── matched_area_ids
├── rejected_area_ids
└── blocked_reasons
AreaTypeAuthorizationDecision
AreaTypeAuthorizationDecision
├── employee_id
├── app_code
├── permission_code
├── authorization_mode
├── assignment_source
├── area_type_scope_mode
├── authorized_area_type
├── parent_site_scope
├── target_site_id
├── target_area_id
├── target_area_type
├── resource_type
├── resource_id
├── matched_assignment
├── matched_allow
├── matched_deny
├── blocked_reasons
└── decision

#### 67. Precedencia territorial

La evaluación seguirá este orden:

#### 1. Actor autenticado

#### 2. Empleado activo

#### 3. Aplicación activa

#### 4. Permiso existente

#### 5. Compatibilidad del permiso con area_type

#### 6. Alcance superior de sede

#### 7. Modalidad del tipo de área

#### 8. Tipo autorizado

#### 9. Estado del tipo

#### 10. Área real del recurso

#### 11. Sede real del área

#### 12. Estado de sede y área

#### 13. Tipo real del área

#### 14. Asignaciones cuando apliquen

#### 15. Contexto operativo cuando aplique

#### 16. Rol operativo

#### 17. Dispositivo cuando aplique

#### 18. Operación multiárea cuando aplique

#### 19. Aislamiento

#### 20. Denegaciones

#### 21. Decisión

Regla

El tipo enviado por el cliente nunca tendrá prioridad sobre:

el área real;
la sede real;
el tipo almacenado;
el turno;
el rol operativo;
el dispositivo;
el recurso.

#### 68. Invariantes

El tipo de área limita territorio funcional, no acción.
El tipo de área no es un permiso.
El tipo de área no es un área específica.
El tipo de área siempre depende de un límite superior de sede.
No existe un permiso por tipo de área sin alcance de sede resoluble.
El área se identifica por area_id.
El tipo se identifica por código canónico.
El nombre del área no define el tipo.
La coincidencia del tipo es exacta.
No existen coincidencias por texto.
No existe jerarquía implícita entre tipos.
Solo participan áreas empresariales autorizables.
Una ubicación de inventario no es un tipo de área.
Un rol operativo no es un tipo de área.
Existen modalidades administrativas y operativas diferentes.
assigned_areas_of_type es la modalidad administrativa predeterminada.
all_areas_of_type_within_site_scope requiere alcance superior explícito.
active_operational_area_of_type requiere área activa.
Un permiso administrativo por tipo no requiere turno.
Un permiso operativo por tipo requiere contexto operativo.
El tipo no reemplaza el área del turno.
El tipo no reemplaza la sede del turno.
El tipo no reemplaza el rol operativo.
El rol debe estar habilitado en el área concreta.
El check-in no define el tipo de área.
El dispositivo restringe a su área concreta.
El tipo del dispositivo no amplía alcance.
El recurso define el área real.
El área define la sede y el tipo reales.
Los parámetros del cliente no son fuente de verdad.
Un recurso de nivel sede no se autoriza automáticamente por tipo de área.
Un recurso organizacional no utiliza alcance por tipo de área.
Una operación multiárea valida todas las áreas.
Compartir tipo no autoriza operaciones entre áreas.
Operaciones entre tipos requieren capacidad transversal.
Las nuevas áreas se incluyen según la modalidad.
Las nuevas sedes no se incluyen sin alcance superior.
Cambiar el tipo de área puede modificar permisos.
Cambiar el tipo invalida decisiones previas.
Un tipo inactivo no concede acceso.
Un área sin tipo se deniega.
Un tipo incompatible con la sede se deniega.
Las áreas aisladas requieren autorización adicional.
No todos los permisos admiten alcance por tipo de área.
Todas las áreas de un tipo no autorizan mutaciones masivas.
La simulación no modifica tipos reales.
Toda acción registra sede, área y tipo efectivos.
No existe bypass por nombre de rol.
Supabase conserva la fuente de verdad.

#### 69. Alternativas descartadas

A. Autorizar por nombre de área

❌ Descartada.

Los nombres pueden cambiar o repetirse.

B. Inferir el tipo desde palabras del nombre

❌ Descartada.

Generaría coincidencias frágiles.

C. Utilizar el rol operativo como tipo

❌ Descartada.

Función y territorio son conceptos distintos.

D. Utilizar ubicaciones de inventario como áreas

❌ Descartada.

Tienen granularidad y finalidad diferentes.

E. Permitir tipo de área sin alcance de sede

❌ Descartada.

Produciría expansión territorial implícita.

F. Incluir todas las áreas del tipo por defecto

❌ Descartada.

La modalidad predeterminada será el cruce con áreas asignadas.

G. Operar cualquier área del tipo durante un turno

❌ Descartada.

La operación se limita al área activa.

H. Autorizar varias áreas porque comparten tipo

❌ Descartada.

Cada área debe validarse.

I. Permitir operaciones entre tipos mediante un único permiso local

❌ Descartada.

Se requiere capacidad transversal.

J. Utilizar el tipo del dispositivo como autoridad

❌ Descartada.

El dispositivo restringe; no concede.

K. Autorizar recursos de nivel sede por tipo de área

❌ Descartada.

El recurso debe tener atribución de área.

L. Interpretar todas las áreas del tipo como mutación masiva

❌ Descartada.

Alcance territorial y volumen son dimensiones distintas.

#### 70. Riesgos

⚠️ Catálogo de tipos todavía no normalizado

Puede existir mezcla entre area_kind, nombre y clasificación operativa.

⚠️ Cobertura incompleta de employee_areas

La modalidad de áreas asignadas todavía no puede aplicarse uniformemente.

⚠️ Áreas sin clasificación

Algunas áreas pueden no tener tipo canónico.

⚠️ Tipos demasiado generales

Categorías como production podrían agrupar áreas que requieren separación.

⚠️ Cambio de tipo

Puede conceder o retirar acceso de manera inmediata.

⚠️ Nuevas áreas

La modalidad transversal puede ampliar automáticamente el alcance.

⚠️ Recursos sin área directa

Será necesario definir rutas canónicas de resolución.

⚠️ Roles operativos heredados

Pueden mezclar nombre de oficio, sede y área.

⚠️ Dispositivos compartidos

Un frontend podría usar el tipo en lugar del area_id.

⚠️ Operaciones multiárea

Inventario, remisiones y producción pueden involucrar origen y destino distintos.

⚠️ RLS heredada

Puede no resolver el tipo desde el área real del recurso.

#### 72. Decisión final

PERMISO ADMINISTRATIVO POR TIPO DE ÁREA
**=**
CAPACIDAD EXACTA
APLICABLE A ÁREAS EMPRESARIALES DEL TIPO AUTORIZADO
DENTRO DE SEDES PREVIAMENTE AUTORIZADAS
PERMISO OPERATIVO POR TIPO DE ÁREA
**=**
CAPACIDAD EXACTA
REUTILIZABLE EN TURNOS CUYA ÁREA ACTIVA
PERTENEZCA AL TIPO AUTORIZADO
PERO LIMITADA AL ÁREA CONCRETA DEL TURNO
Fórmula definitiva
ACTOR VÁLIDO
+
PERMISO EXACTO
+
ALCANCE SUPERIOR DE SEDE
+
TIPO DE ÁREA AUTORIZADO
+
MODALIDAD VÁLIDA
+
ÁREA REAL ELEGIBLE
+
TIPO REAL COINCIDENTE
+
CONTEXTO OPERATIVO CUANDO APLIQUE
+
ROL HABILITADO EN EL ÁREA
+
SIN RESTRICCIÓN SUPERIOR
**=**
ACCIÓN AUTORIZADA

#### 73. Criterio de aprobación

✅ Todos los criterios definidos han sido aceptados.

✅ Conclusión

TIPO DE ÁREA
→ agrupa áreas con una función empresarial común

ALCANCE DE SEDE
→ limita dónde puede aplicarse esa categoría

PERMISO POR TIPO DE ÁREA
→ define qué capacidad puede reutilizarse
dentro de esas áreas

El alcance efectivo es:

PERMISO
∩ SEDES AUTORIZADAS
∩ TIPO DE ÁREA
∩ MODALIDAD
∩ ÁREA REAL DEL RECURSO
∩ CONTEXTO OPERATIVO CUANDO APLIQUE
