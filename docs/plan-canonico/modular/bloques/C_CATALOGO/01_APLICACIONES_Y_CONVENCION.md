### ✅ AUTH-CAT-001 — Normalizar el catálogo y los códigos de aplicaciones

#### 1. Problema que se resuelve

Actualmente public.apps contiene diez aplicaciones activas:

anima
aura
fogo
nexo
numera
origo
pass
pulso
shell
viso

Sin embargo, el catálogo actual no define de forma canónica:

qué representa cada aplicación;
qué significa exactamente su código;
qué aplicaciones forman parte del núcleo de Vento OS;
qué aplicaciones pertenecen al dominio laboral;
qué aplicaciones pertenecen al dominio de clientes;
qué aplicaciones están temporalmente fuera del roadmap;
qué diferencia existe entre una aplicación y un repositorio;
qué diferencia existe entre una aplicación y un módulo funcional;
qué significa que una aplicación esté activa.

También existen tres ambigüedades principales:

AURA
→ existe en public.apps
→ pero no aparece en el roadmap principal

PASS
→ aparece en el RBAC laboral
→ pero su identidad principal es de cliente

SHELL
→ identifica el Hub Vento OS
→ pero también existe el repositorio vento-shell

Estas ambigüedades deben cerrarse antes de normalizar permisos.

#### 2. Objetivo

Definir un catálogo canónico de aplicaciones que permita identificar de forma estable:

APLICACIÓN
+
CÓDIGO CANÓNICO
+
NOMBRE HUMANO
+
TIPO DE APLICACIÓN
+
DOMINIO DE IDENTIDAD
+
ALCANCE DENTRO DEL ROADMAP
+
ESTADO DE CICLO DE VIDA

El resultado debe servir como base para:

códigos de permisos;
navegación;
guards;
políticas operativas;
matrices de roles;
dispositivos compartidos;
simulación;
auditoría;
tipos TypeScript;
migraciones;
contratos compartidos.

#### 3. Definición canónica de aplicación

Una aplicación es una frontera funcional reconocible dentro del ecosistema Vento.

Una aplicación puede contener:

vistas;
rutas;
operaciones;
permisos;
configuración;
políticas;
procesos;
clientes web o nativos.

Una aplicación no es necesariamente:

un repositorio;
un despliegue;
un dominio web;
una carpeta;
una ruta;
un paquete;
un módulo interno;
una tabla de base de datos.

Fórmula:

APLICACIÓN
**=**
DOMINIO FUNCIONAL IDENTIFICABLE
+
FRONTERA DE AUTORIZACIÓN
+
CÓDIGO ESTABLE

#### 4. Diferencia entre aplicación, repositorio y paquete

Se establecen tres conceptos distintos.

4.1 Aplicación

Ejemplos:

shell
anima
viso
nexo
fogo
origo
pulso
numera
aura
pass

Se utiliza para:

registro en public.apps;
prefijo de permisos;
navegación;
políticas;
auditoría;
decisiones de autorización.
4.2 Repositorio

Ejemplos:

vento-shell
vento-anima
vento-viso
vento-nexo
vento-fogo
vento-origo
vento-pulso
vento-numera
vento-pass

Es una unidad técnica de código fuente.

Un repositorio puede:

implementar una aplicación;
contener paquetes compartidos;
contener migraciones;
contener más de una superficie técnica.

El nombre del repositorio no es el código de la aplicación.

4.3 Paquete compartido

Ejemplos futuros:

@vento/contracts
@vento/os-context
@vento/supabase

Un paquete no debe registrarse como aplicación por el solo hecho de contener código compartido.

#### 5. Regla canónica de códigos

Todo código de aplicación deberá:

usar minúsculas;
usar caracteres ASCII;
comenzar por una letra;
ser corto;
ser único;
ser estable;
representar el producto o dominio funcional;
poder utilizarse como prefijo de permisos.

Formato admitido:

^[a-z][a-z0-9_]*$

Preferencia:

una sola palabra

Cuando sea inevitable utilizar varias palabras:

snake_case

#### 6. Formatos prohibidos

No se permitirán códigos de aplicación con:

mayúsculas;
espacios;
acentos;
guiones medios;
puntos;
rutas;
versiones;
entornos;
nombres de sede;
nombres de empresa;
nombres de repositorio completos.

Ejemplos prohibidos:

VENTO-NEXO
vento-nexo
Nexo
nexo.app
nexo_prod
nexo_cucuta
nexo_v2
src_nexo

Ejemplo correcto:

nexo

#### 7. No utilizar el prefijo vento

Los códigos no incluirán el prefijo de marca:

vento_nexo
vento_fogo
vento_shell

El catálogo ya pertenece al ecosistema Vento.

El prefijo sería redundante y produciría permisos innecesariamente largos.

Correcto:

nexo.inventory.remissions.request

Incorrecto:

vento_nexo.inventory.remissions.request

#### 8. Estabilidad del código

El código de una aplicación es una identidad técnica estable.

No deberá modificarse por:

cambio de nombre comercial;
rediseño visual;
cambio de repositorio;
cambio de dominio;
cambio de framework;
cambio de propietario técnico;
cambio de infraestructura;
cambio de versión.

Ejemplo:

Nombre visible:
Vento OS

Código:
shell

Aunque el nombre visible cambie, el código podrá mantenerse.

#### 9. Cambio de código como ruptura contractual

Cambiar un código de aplicación afecta potencialmente:

app_permissions;
role_permissions;
employee_permissions;
operational_role_permissions;
guards;
RPC;
RLS;
navegación;
dispositivos compartidos;
auditorías;
logs;
tipos TypeScript;
configuración externa.

Por tanto:

CAMBIO DE APP_CODE
**=**
CAMBIO CONTRACTUAL INCOMPATIBLE

Un código no podrá renombrarse directamente.

Cualquier cambio futuro requerirá:

nuevo código canónico;
alias temporal;
mapa legacy;
migración versionada;
compatibilidad transitoria;
pruebas;
retiro controlado.

#### 10. Los códigos retirados no se reutilizan

Cuando una aplicación sea retirada:

su código queda reservado permanentemente

No podrá utilizarse para una aplicación diferente.

Ejemplo:

aura

Si AURA fuera retirada en el futuro, aura no podrá reasignarse a otro producto.

Esto protege:

auditoría histórica;
logs;
permisos antiguos;
migraciones;
referencias persistidas.

#### 11. Catálogo canónico aprobado

El catálogo canónico queda compuesto por las siguientes diez aplicaciones:

| Código | Nombre canónico | Tipo           | Dominio de identidad | Alcance del roadmap |
| ------ | --------------- | -------------- | -------------------- | ------------------- |
| shell  | Vento OS        | Hub            | Laboral              | Núcleo              |
| anima  | ANIMA           | Híbrida        | Laboral              | Núcleo              |
| viso   | VISO            | Administrativa | Laboral              | Núcleo              |
| nexo   | NEXO            | Híbrida        | Laboral              | Núcleo              |
| fogo   | FOGO            | Operativa      | Laboral              | Núcleo              |
| origo  | ORIGO           | Híbrida        | Laboral              | Núcleo              |
| pulso  | PULSO           | Operativa      | Laboral              | Núcleo              |
| numera | NUMERA          | Híbrida        | Laboral              | Núcleo              |
| aura   | AURA            | Administrativa | Laboral              | Diferido            |
| pass   | Vento Pass      | Cliente        | Cliente              | Adyacente           |

No se crea ningún código adicional en esta tarea.

#### 12. Tipos canónicos de aplicación

Se establecen cinco tipos descriptivos.

hub
administrative
operational
hybrid
customer
12.1 Hub

Aplicación que sirve como punto de entrada, selección o coordinación del ecosistema.

shell
12.2 Administrativa

Aplicación cuya función principal es administrar información, configuración, personal o procesos organizacionales.

viso
aura
12.3 Operativa

Aplicación cuya función principal es ejecutar trabajo empresarial dentro de un contexto operacional.

fogo
pulso
12.4 Híbrida

Aplicación que contiene capacidades administrativas y operativas.

anima
nexo
origo
numera
12.5 Cliente

Aplicación cuya identidad principal pertenece al dominio de clientes.

pass

#### 13. El tipo de aplicación no autoriza

La clasificación de una aplicación es descriptiva.

No sustituye:

permission_code;
authorization_requirement;
turno;
check-in;
sede;
área;
rol operativo;
alcance;
recurso;
denegaciones.

Ejemplo:

nexo
→ tipo hybrid

No significa:

todo permiso de NEXO admite carril base y operativo

Cada permiso deberá declarar posteriormente su propia modalidad:

BASE_ONLY
OPERATIONAL_ONLY
BASE_OR_OPERATIONAL
BASE_AND_OPERATIONAL

La clasificación individual corresponde a:

AUTH-CAT-006

#### 14. Aplicación SHELL

El código canónico:

shell

representa exclusivamente:

Vento OS
Hub de aplicaciones
entrada al ecosistema laboral
navegación general
SSO y selección de aplicaciones

No representa:

el repositorio vento-shell;
las migraciones;
los paquetes compartidos;
@vento/contracts;
@vento/auth;
@vento/ui-web;
la infraestructura completa del ecosistema.

Separación obligatoria:

shell
→ aplicación Vento OS

vento-shell
→ repositorio técnico

@vento/*
→ paquetes compartidos

#### 15. Aplicación PASS

El código canónico:

pass

representa el producto:

Vento Pass

Su identidad principal es:

public.users
→ cliente

No deberá utilizar:

employees.role

para autorizar el acceso normal del cliente.

Regla:

AUTORIZACIÓN DEL CLIENTE PASS
≠
RBAC LABORAL

El permiso existente:

pass.access

dentro del sistema laboral no se elimina todavía.

Deberá revisarse posteriormente para determinar si representa:

administración interna de Pass;
acceso laboral a una superficie de Pass;
integración desde otra aplicación;
residuo histórico.

El acceso del cliente final nunca dependerá de esa fila laboral.

Las operaciones laborales relacionadas con Pass podrán ser autorizadas desde:

VISO;
PULSO;
PASS;
otra aplicación propietaria de la capacidad;

pero siempre mediante permisos laborales explícitos y sin mezclar identidades.

#### 16. Aplicación AURA

El código canónico:

aura

se conserva.

AURA continuará registrada como:

aplicación administrativa
dominio laboral
alcance diferido

Esto significa:

el código sigue siendo válido;
las referencias existentes se conservan;
no se elimina de public.apps;
no se desactiva en esta tarea;
no se incorpora todavía al roadmap de implementación principal.

Antes de ampliar su catálogo deberá confirmarse:

repositorio propietario;
estado real del producto;
usuarios actuales;
rutas actuales;
funciones activas;
responsable funcional;
integración futura con Vento OS.

Estado conceptual:

CATÁLOGO: ACTIVA
ROADMAP ACTUAL: DIFERIDA

#### 17. Aplicación ANIMA

El código canónico:

anima

representa la aplicación laboral de:

turnos;
asistencia;
check-in;
check-out;
documentos;
información del trabajador;
gestión de equipo autorizada.

Se clasifica como híbrida porque contiene:

funciones personales;
funciones administrativas;
inicio y cierre del contexto operativo.

ANIMA no otorga permisos operativos directamente.

Su responsabilidad será:

crear o cerrar el contexto

No:

autorizar automáticamente NEXO, FOGO, ORIGO o PULSO.

#### 18. Aplicación VISO

El código canónico:

viso

representa la aplicación administrativa responsable de gestionar:

trabajadores;
roles;
permisos;
turnos;
perfiles operativos;
sedes;
áreas;
simulación;
auditoría de seguridad.

Se clasifica como:

administrative

Esta clasificación no concede acceso global.

Cada operación seguirá necesitando su permiso exacto.

#### 19. Aplicación NEXO

El código canónico:

nexo

representa el dominio de:

inventario;
logística;
remisiones;
movimientos;
ubicaciones;
conteos;
activos;
despacho;
recepción logística.

Se clasifica como:

hybrid

porque contiene:

administración y configuración;
consulta transversal;
operaciones sujetas a turno;
operaciones sujetas a sede y área.

#### 20. Aplicación FOGO

El código canónico:

fogo

representa el dominio de:

producción;
órdenes de producción;
lotes;
recetas;
ejecución de procesos productivos.

Se clasifica como:

operational

La clasificación no impide que existan permisos administrativos específicos, por ejemplo:

administrar recetas;
configurar procesos;
corregir lotes.

Cada permiso determinará su modalidad individual.

#### 21. Aplicación ORIGO

El código canónico:

origo

representa el dominio de:

compras;
proveedores;
órdenes de compra;
recepciones;
revisión de productos;
abastecimiento.

Se clasifica como:

hybrid

porque contiene:

administración de compras;
aprobaciones;
configuración;
recepción física operativa.

#### 22. Aplicación PULSO

El código canónico:

pulso

representa el dominio de:

POS;
ventas;
órdenes;
pagos;
salón;
entregas;
acumulación y redención de puntos;
operación de caja.

Se clasifica como:

operational

La configuración administrativa de PULSO deberá continuar separada de la ejecución operativa de caja.

#### 23. Aplicación NUMERA

El código canónico:

numera

representa el dominio de:

gastos;
costos;
rentabilidad;
reportes;
punto de equilibrio;
información financiera;
centros de costo.

Se clasifica como:

hybrid

porque podrá contener:

consulta administrativa transversal;
registro de información;
aprobaciones;
cierres;
operaciones limitadas por empresa, sede o centro de costo.

La clasificación híbrida no obliga a exigir turno en todos sus permisos.

#### 24. Dominio de identidad

Se establecen dos dominios principales.

24.1 Dominio laboral

Utiliza como identidad empresarial principal:

employees

Aplicaciones:

shell
anima
viso
nexo
fogo
origo
pulso
numera
aura

Puede operar mediante:

sesión personal;
dispositivo compartido con actor humano;
service role controlado;
simulación sin efectos reales.
24.2 Dominio cliente

Utiliza como identidad principal:

public.users

Aplicación:

pass

El dominio cliente no hereda roles laborales.

#### 25. Los dispositivos compartidos no son aplicaciones

Elementos como:

CAJA_VENTO_CAFE_01
KIOSCO_BODEGA_CP
pos_satellite
warehouse_kiosk

no deben registrarse como aplicaciones.

Son:

dispositivos;
plantillas;
canales de acceso;
contextos técnicos.

Pueden habilitar aplicaciones como:

pulso
nexo
shell

pero no reemplazan sus códigos.

#### 26. Los módulos internos no son aplicaciones

Conceptos como:

inventory
remissions
staff
procurement
production
expenses
reports

son módulos o dominios internos.

No deben registrarse en public.apps.

Su lugar dentro del permiso se definirá en:

AUTH-CAT-002

Ejemplo:

nexo.inventory.remissions.request

Donde:

nexo
→ aplicación

inventory
→ módulo

remissions
→ recurso

request
→ acción

#### 27. Prefijo obligatorio de permisos

Todo permiso laboral canónico deberá pertenecer a una aplicación registrada.

Forma conceptual:

`<app_code>.<permission_code>`

Ejemplos válidos:

viso.staff.read
nexo.inventory.stock.view
fogo.production.batches.create
origo.procurement.receipts.register
pulso.sales.create
numera.expenses.view

Ejemplos inválidos:

inventory.stock.view
staff.read
production.batches.create
unknown_app.access

La convención completa se aprobará en AUTH-CAT-002.

#### 28. Aplicación activa no equivale a acceso

El estado activo de una aplicación significa únicamente:

la aplicación forma parte del catálogo vigente
y puede ser referenciada por configuración y permisos.

No significa:

que esté desplegada;
que todos puedan verla;
que todos tengan acceso;
que tenga permisos configurados;
que tenga una política operativa;
que tenga navegación disponible;
que esté incluida en el roadmap inmediato.

Fórmula:

APP ACTIVA
≠
APP AUTORIZADA

El acceso requiere como mínimo:

aplicación activa
+
permiso de acceso aplicable
+
actor válido
+
contexto compatible
+
sin denegación superior

#### 29. Alcance del roadmap

Se establecen tres estados descriptivos de alcance.

core
adjacent
deferred
Core

Aplicaciones incluidas directamente en el roadmap de autorización actual:

shell
anima
viso
nexo
fogo
origo
pulso
numera
Adjacent

Aplicaciones conectadas al ecosistema, pero con dominio de identidad diferente:

pass
Deferred

Aplicaciones registradas cuyo análisis e implementación se aplaza sin retirarlas:

aura

El alcance del roadmap no afecta automáticamente el estado activo.

#### 30. Estado de ciclo de vida

El catálogo futuro deberá soportar conceptualmente:

active
deprecated
retired
reserved
Active

Puede utilizarse en configuración nueva.

Deprecated

Continúa funcionando, pero no debe utilizarse en nuevas implementaciones.

Retired

No debe utilizarse en operación actual.

Reserved

El código se conserva para impedir su reutilización.

En esta tarea:

las diez aplicaciones existentes permanecen activas.

No se realiza ninguna transición de ciclo de vida.

#### 31. Fuente de verdad

Durante el estado actual:

public.apps
→ registro de aplicaciones utilizado en runtime

La arquitectura objetivo será:

catálogo versionado en vento-shell
        ↓
validación y migración
        ↓
public.apps
        ↓
consumo por aplicaciones

La creación del catálogo versionado corresponde a:

AUTH-CAT-017

La centralización de constantes corresponde a:

SHELL-CON-002

Hasta entonces, public.apps continuará siendo el registro efectivo existente.

#### 32. Sincronización futura

Cuando exista el catálogo versionado, deberá validarse que:

todo app_code del código exista en el catálogo;
todo app_code del catálogo exista en public.apps;
todo permiso tenga una aplicación válida;
toda navegación apunte a una aplicación válida;
toda política operativa apunte a una aplicación válida;
todo dispositivo habilite solamente aplicaciones válidas.

Las diferencias deberán producir:

error de CI;
error de migración;
alerta administrativa;
bloqueo de configuración inválida.

#### 33. No crear aplicaciones desde rutas

No se creará una aplicación por cada:

ruta;
pantalla;
carpeta;
microfrontend;
módulo;
proceso;
sección de navegación.

Ejemplos incorrectos:

nexo_inventory
nexo_remissions
origo_receipts
viso_staff
pulso_pos

Estos conceptos pertenecen a módulos y permisos dentro de su aplicación propietaria.

#### 34. No duplicar una aplicación por plataforma

No se crearán códigos distintos únicamente porque una aplicación tenga:

web;
tablet;
móvil;
React Native;
Next.js;
modo kiosco;
modo dispositivo compartido.

Ejemplos incorrectos:

pulso_tablet
pulso_web
anima_mobile
nexo_kiosk

La plataforma se representará mediante configuración técnica, no mediante otro app_code.

#### 35. No duplicar una aplicación por entorno

No se crearán códigos como:

nexo_dev
nexo_staging
nexo_prod

El entorno es infraestructura.

El código de aplicación seguirá siendo:

nexo

en todos los entornos.

#### 36. No duplicar una aplicación por sede

No se crearán códigos como:

pulso_vento_cafe
pulso_saudo
nexo_centro_prod

La sede pertenece al contexto de autorización.

No a la identidad de la aplicación.

Correcto:

app_code = pulso
site_id = VENTO_CAFE

#### 37. Nombre visible

El nombre visible:

puede usar mayúsculas;
puede contener espacios;
puede contener la marca Vento;
puede cambiar por razones comerciales.

Ejemplos:

Código: shell
Nombre: Vento OS

Código: pass
Nombre: Vento Pass

Código: nexo
Nombre: NEXO

Los nombres visibles no se utilizarán como claves de autorización.

#### 38. Orden canónico de presentación

Cuando sea necesario presentar el ecosistema completo, se utilizará este orden:

#### 1. shell

#### 2. anima

#### 3. viso

#### 4. nexo

#### 5. fogo

#### 6. origo

#### 7. pulso

#### 8. numera

#### 9. aura

#### 10. pass

Agrupación visual:

PLATAFORMA
└── Vento OS

PERSONAL Y ADMINISTRACIÓN
├── ANIMA
└── VISO

OPERACIÓN
├── NEXO
├── FOGO
├── ORIGO
└── PULSO

FINANZAS
└── NUMERA

APLICACIONES ADYACENTES
├── AURA
└── Vento Pass

El orden de presentación no establece precedencia de autorización.

#### 39. Cómo se verá en VISO

Aplicaciones

┌────────────────────────────────────────────┐
│ Vento OS                                   │
│ Código: shell                              │
│ Tipo: Hub                                  │
│ Dominio: Laboral                           │
│ Roadmap: Núcleo                            │
│ Estado: Activa                             │
└────────────────────────────────────────────┘

┌────────────────────────────────────────────┐
│ NEXO                                       │
│ Código: nexo                               │
│ Tipo: Híbrida                              │
│ Dominio: Laboral                           │
│ Roadmap: Núcleo                            │
│ Estado: Activa                             │
└────────────────────────────────────────────┘

┌────────────────────────────────────────────┐
│ AURA                                       │
│ Código: aura                               │
│ Tipo: Administrativa                       │
│ Dominio: Laboral                           │
│ Roadmap: Diferido                          │
│ Estado: Activa                             │
└────────────────────────────────────────────┘

┌────────────────────────────────────────────┐
│ Vento Pass                                 │
│ Código: pass                               │
│ Tipo: Cliente                              │
│ Dominio: Cliente                           │
│ Roadmap: Adyacente                         │
│ Estado: Activa                             │
└────────────────────────────────────────────┘

El código deberá mostrarse como información técnica no editable desde una edición ordinaria.

#### 40. Validaciones futuras obligatorias

La implementación deberá impedir:

códigos duplicados;
códigos vacíos;
códigos con mayúsculas;
códigos con espacios;
códigos con puntos;
códigos que comiencen por número;
reutilización de códigos retirados;
permisos con app inexistente;
políticas con app inexistente;
dispositivos con app inexistente.

#### 41. Compatibilidad con los datos actuales

Los diez códigos existentes ya cumplen la forma canónica:

anima
aura
fogo
nexo
numera
origo
pass
pulso
shell
viso

Por tanto:

✅ no se requiere renombrar aplicaciones;
✅ no se requiere migrar códigos en esta tarea;
✅ no se rompen referencias actuales;
✅ no se eliminan permisos actuales.

La normalización consiste en:

definir significado;
definir clasificación;
definir reglas;
resolver ambigüedades;
establecer estabilidad contractual.

#### 42. Riesgos controlados

Riesgo 1 — Confundir shell con vento-shell

Control:

shell = aplicación
vento-shell = repositorio
@vento/* = paquetes
Riesgo 2 — Utilizar RBAC laboral para clientes Pass

Control:

pass cliente
→ public.users
→ autorización de dominio cliente
Riesgo 3 — Eliminar AURA sin conocer su estado real

Control:

mantener activa
+
marcar roadmap diferido
+
auditar antes de modificar
Riesgo 4 — Autorizar por tipo de aplicación

Control:

app_kind es descriptivo
cada permiso declara su modalidad
Riesgo 5 — Crear aplicaciones por cada módulo

Control:

una aplicación
→ múltiples módulos
→ múltiples permisos
Riesgo 6 — Romper permisos mediante renombres

Control:

app_code estable e inmutable

#### 43. Fuera del alcance

Esta tarea no define:

la convención completa de permisos;
los módulos canónicos de cada aplicación;
las acciones canónicas;
los códigos finales de todos los permisos;
las equivalencias legacy;
las descripciones humanas de permisos;
authorization_requirement;
alcances territoriales;
matrices de roles;
políticas operativas;
RLS;
RPC;
migraciones;
tipos TypeScript;
constantes compartidas.

Estos temas corresponden a:

AUTH-CAT-002 a AUTH-CAT-019
BLOQUE D
BLOQUE E
BLOQUES de implementación

#### 44. Resultado aprobado esperado

CATÁLOGO CANÓNICO

shell
anima
viso
nexo
fogo
origo
pulso
numera
aura
pass

Clasificación:

NÚCLEO LABORAL
├── shell
├── anima
├── viso
├── nexo
├── fogo
├── origo
├── pulso
└── numera

LABORAL DIFERIDO
└── aura

DOMINIO CLIENTE ADYACENTE
└── pass

Regla principal:

APP_CODE
→ identifica una aplicación estable

APP_KIND
→ describe su naturaleza

AUTHORIZATION_REQUIREMENT
→ pertenece a cada permiso

REPOSITORIO
→ implementa código

MÓDULO
→ organiza capacidades internas

SEDE Y ÁREA
→ pertenecen al contexto

NINGUNO DE ESTOS CONCEPTOS SE SUSTITUYE ENTRE SÍ

#### 45. Criterios de aprobación

Los criterios de aprobación de esta tarea fueron aceptados íntegramente
durante su revisión y quedan respaldados por sus invariantes,
resultado esperado y decisión final.

#### 46. Decisión final

APLICACIÓN
→ frontera funcional estable

APP_CODE
→ identidad técnica inmutable

NOMBRE
→ presentación humana modificable

TIPO
→ clasificación descriptiva

DOMINIO
→ identidad laboral o cliente

ROADMAP_SCOPE
→ núcleo, adyacente o diferido

PERMISO
→ capacidad exacta dentro de la aplicación

AUTORIZACIÓN
→ nunca se deduce únicamente del tipo de aplicación

Estado:

AUTH-CAT-001
→ APROBADA

### ✅ AUTH-CAT-002 — Definir convención app.modulo.recurso.accion

#### 1. Problema que se resuelve

El catálogo actual utiliza múltiples estructuras incompatibles:

access
resource
resource.view
resource.read
resource.manage
module.resource
module.resource.action
resource.view_all
resource.all_sites
resource.edit_own_pending
route_id.view
page_tsx.view

Ejemplos actuales:

anima.documents.view_all
fogo.production.batches
fogo.production.batches.view
nexo.inventory.remissions
nexo.inventory.remissions.all_sites
nexo.inventory.remissions.edit_own_pending
nexo.inventory_catalog_id.view
nexo.page_tsx.view
origo.procurement.purchase_orders
pulso.pos.main
viso.staff.read
viso.staff.manage

Esto produce cinco problemas principales:

1. Un mismo concepto tiene varios nombres.

#### 2. Algunos permisos representan capacidades empresariales

   y otros representan rutas o pantallas.

3. El alcance territorial o personal aparece dentro del código.

4. Algunos permisos no declaran qué acción permiten.

#### 5. No existe una estructura fija que pueda validarse

   automáticamente.

#### 2. Decisión principal

Todo permiso laboral canónico utilizará una de estas dos formas:

`<app>.access`

o:

`<app>.<module>.<resource>.<action>`

Ejemplos:

nexo.access
nexo.inventory.remissions.request
fogo.production.batches.create
origo.procurement.receipts.register
pulso.sales.orders.cancel
viso.authorization.permissions.assign

Regla principal:

PERMISO CANÓNICO
**=**
APLICACIÓN
+
MÓDULO
+
RECURSO
+
ACCIÓN EMPRESARIAL

Excepción reservada:

`<app>.access`

#### 3. Estructura canónica

nexo.inventory.remissions.request
│    │         │           │
│    │         │           └── acción
│    │         └────────────── recurso
│    └──────────────────────── módulo
└───────────────────────────── aplicación

Cada segmento responde una pregunta distinta.

| Segmento   | Pregunta                               |
| ---------- | -------------------------------------- |
| Aplicación | ¿Qué aplicación es responsable?        |
| Módulo     | ¿En qué dominio funcional ocurre?      |
| Recurso    | ¿Sobre qué entidad o capacidad actúa?  |
| Acción     | ¿Qué puede hacer exactamente el actor? |

#### 4. Código completo y código relativo

Se diferencian dos valores.

4.1 Código de aplicación
app_code = nexo
4.2 Código relativo del permiso
permission_code = inventory.remissions.request
4.3 Clave completa del permiso
permission_key = nexo.inventory.remissions.request

Fórmula:

permission_key
**=**
app_code
+
"."
+
permission_code

En public.app_permissions, la aplicación podrá continuar almacenándose separadamente del código relativo.

Ejemplo conceptual:

app_code:
nexo

code:
inventory.remissions.request

clave derivada:
nexo.inventory.remissions.request

No se almacenará el prefijo de aplicación dos veces.

Incorrecto:

app_code = nexo
code = nexo.inventory.remissions.request

Correcto:

app_code = nexo
code = inventory.remissions.request

#### 5. Aplicación

El primer segmento corresponde a un código aprobado en el catálogo de aplicaciones.

Valores actuales:

shell
anima
viso
nexo
fogo
origo
pulso
numera
aura
pass

Regla:

PERMISO CON APP INEXISTENTE
→ CONFIGURACIÓN INVÁLIDA

Ejemplo válido:

nexo.inventory.stock.view

Ejemplo inválido:

logistica.inventory.stock.view

cuando logistica no sea una aplicación registrada.

#### 6. Módulo

El módulo representa un dominio funcional estable dentro de una aplicación.

Ejemplos conceptuales:

platform
attendance
workforce
authorization
inventory
logistics
production
procurement
sales
payments
loyalty
finance
accounting
analytics
content
marketing
printing
settings

El módulo no representa:

una ruta;
una pantalla;
una carpeta;
un componente;
una sede;
un área;
un rol;
una implementación técnica.

Ejemplo:

nexo.inventory.remissions.request

inventory es el módulo.

No se utilizará:

nexo.app.inventory.remissions.request
nexo.pages.remissions.request
nexo.components.remissions.request

#### 7. Registro de módulos

Cada aplicación deberá tener un conjunto explícito de módulos permitidos.

Ejemplo conceptual:

NEXO
├── inventory
├── logistics
├── printing
└── settings

FOGO
├── production
└── settings

ORIGO
├── procurement
├── suppliers
└── settings

PULSO
├── sales
├── payments
├── delivery
└── loyalty

Este listado es ilustrativo.

La lista definitiva se construirá durante:

AUTH-CAT-003

No se podrá crear un módulo nuevo solamente escribiendo una cadena diferente en el código.

#### 8. Recurso

El recurso representa la entidad, colección o capacidad empresarial sobre la cual se ejecuta una acción.

Ejemplos:

employees
shifts
documents
permissions
roles
stock
remissions
movements
locations
batches
recipes
purchase_orders
receipts
suppliers
orders
payments
expenses
reports
campaigns
rewards

Ejemplo:

origo.procurement.purchase_orders.approve

Donde:

origo
→ aplicación

procurement
→ módulo

purchase_orders
→ recurso

approve
→ acción

#### 9. Recursos en plural

Los recursos contables o basados en registros se escribirán normalmente en plural.

Correcto:

employees
remissions
purchase_orders
production_batches
expenses
suppliers

Incorrecto:

employee
remission
purchase_order
production_batch
expense
supplier

Esto evita variantes como:

cost_center
cost_centers

Una vez aprobado el nombre canónico de un recurso, el singular o cualquier otro plural quedará prohibido como alias nuevo.

#### 10. Sustantivos no contables

Los recursos que representen conceptos no contables podrán conservar una forma colectiva.

Ejemplos:

stock
navigation
accounting
configuration
loyalty

No se forzará artificialmente un plural incorrecto.

Ejemplo válido:

nexo.inventory.stock.view

#### 11. Subrecursos

La convención tendrá un número fijo de segmentos.

No se agregarán niveles arbitrarios como:

app.module.resource.subresource.action

Cuando una capacidad corresponda a un subrecurso real, este se expresará como un recurso compuesto en snake_case.

Ejemplo incorrecto:

anima.workforce.employees.documents.upload

Ejemplo correcto:

anima.workforce.employee_documents.upload

Otro ejemplo:

nexo.inventory.remission_items.update

No:

nexo.inventory.remissions.items.update

Regla:

EL CÓDIGO COMPLETO TIENE
DOS O CUATRO SEGMENTOS

NUNCA CINCO O MÁS

#### 12. Acción

La acción es el último segmento y representa una capacidad empresarial concreta.

Debe utilizar:

un verbo;
en inglés;
en minúsculas;
en forma estable;
sin información de sede, área o propiedad;
sin referencias a la interfaz.

Ejemplos:

view
create
update
delete
archive
restore
activate
deactivate
assign
revoke
request
prepare
dispatch
receive
approve
reject
cancel
close
reopen
issue
collect
refund
reverse
resolve
upload
download
import
export
publish
unpublish
accumulate
redeem
override
simulate

#### 13. Acciones empresariales y no técnicas

La acción debe describir qué sucede en el negocio.

Correcto:

nexo.inventory.remissions.prepare
nexo.inventory.remissions.dispatch
origo.procurement.receipts.register
pulso.payments.transactions.refund
fogo.production.batches.close

Incorrecto:

open
click
submit
render
load
navigate
show
execute
call
post
patch

Estas últimas describen interacción técnica o HTTP, no autoridad empresarial.

#### 14. Convención de lectura

La acción canónica de consulta será:

view

No se utilizarán simultáneamente:

read
view
see
get
list
detail

Regla:

CONSULTAR INFORMACIÓN
→ view

Ejemplos:

viso.workforce.employees.view
numera.finance.expenses.view
nexo.inventory.stock.view
fogo.production.recipes.view

Los códigos actuales terminados en .read se evaluarán para migración hacia .view.

#### 15. Listado y detalle

Por defecto, view cubrirá:

listado;
detalle;
búsqueda;
consulta;
visualización ordinaria.

No se crearán automáticamente permisos separados como:

employees.list
employees.detail
employees.search

Solo se separarán cuando exista una diferencia real de seguridad.

Ejemplo:

employees.view
employee_compensation.view

Puede existir una separación porque la compensación es información más sensible, no porque esté en otra pantalla.

#### 16. Acción create

create significa crear un nuevo recurso cuando la operación es realmente CRUD.

Ejemplos:

viso.workforce.employees.create
fogo.production.batches.create
numera.finance.expenses.create

No se utilizará create cuando exista un verbo empresarial más preciso.

Ejemplo:

nexo.inventory.remissions.request

es preferible a:

nexo.inventory.remissions.create

cuando la operación empresarial consiste específicamente en solicitar una remisión.

#### 17. Acción update

update representa modificar información ordinaria de un recurso existente.

Ejemplo:

viso.workforce.employees.update

No deberá utilizarse para cambios de estado empresariales específicos.

Incorrecto:

origo.procurement.purchase_orders.update

para representar aprobación.

Correcto:

origo.procurement.purchase_orders.approve

#### 18. Acción delete

delete significa eliminación real del registro o recurso.

No se utilizará para:

cancelar;
desactivar;
archivar;
anular;
reversar;
cerrar.

Ejemplos:

anima.workforce.employee_documents.delete

puede ser válido si el archivo es eliminado realmente.

Para una orden:

pulso.sales.orders.cancel

será diferente de:

pulso.sales.orders.delete

#### 19. Acciones de estado

Los cambios de estado usarán el verbo empresarial correspondiente.

Ejemplos:

request
prepare
dispatch
receive
approve
reject
cancel
close
reopen
publish
archive
activate
deactivate

Regla:

CAMBIO DE ESTADO EMPRESARIAL
→ VERBO DEL CAMBIO

NO
→ update

#### 20. Acción y estado final

La acción describirá la transición ejecutada, no simplemente un estado.

Ejemplo problemático actual:

nexo.inventory.remissions.transit

transit representa un estado o sustantivo ambiguo.

Posibles acciones canónicas, según el flujo real:

dispatch
start_transit
confirm_departure

La elección exacta se realizará en AUTH-CAT-003 después de revisar qué hace realmente la operación.

#### 21. Acciones sensibles

Las operaciones sensibles deberán tener acciones distintas.

Ejemplos:

approve
reverse
refund
override
resolve
cancel
deactivate

No deberán quedar absorbidas por permisos genéricos como:

manage
update
edit

Ejemplo:

origo.procurement.receipts.reverse

es diferente de:

origo.procurement.receipts.update

#### 22. Acción manage

manage no será una acción canónica para permisos nuevos.

Motivo:

manage
→ no indica si permite crear, actualizar,
  eliminar, aprobar, asignar o cancelar

Los permisos actuales terminados en .manage deberán descomponerse en acciones explícitas.

Ejemplo actual:

viso.staff.permissions.manage

Deberá evaluarse como capacidades como:

viso.authorization.permissions.view
viso.authorization.permission_assignments.assign
viso.authorization.permission_assignments.revoke

No se define todavía el mapa final; corresponde a AUTH-CAT-003.

#### 23. Acciones compuestas

Una acción podrá usar snake_case únicamente cuando represente un verbo empresarial indivisible que no pueda expresarse claramente con una sola palabra.

Ejemplos potencialmente válidos:

start_transit
end_shift
mark_paid

Se preferirá siempre un verbo simple cuando exista.

Ejemplo preferido:

dispatch

en lugar de:

start_transit

si ambos representan exactamente la misma operación.

#### 24. Un permiso, una capacidad

Cada código deberá representar una única capacidad verificable.

Incorrecto:

create_and_approve
view_and_export
prepare_and_dispatch

Correcto:

create
approve
view
export
prepare
dispatch

Si una operación ejecuta varias acciones atómicas dentro de una transacción, deberá declarar qué permiso empresarial protege la operación completa.

No se concatenarán acciones dentro del código.

#### 25. Formato técnico

Todos los segmentos utilizarán:

minúsculas;
ASCII;
snake_case cuando haya más de una palabra;
sin espacios;
sin tildes;
sin guiones medios;
sin caracteres especiales.

Formato de cada segmento:

^[a-z][a-z0-9_]*$

#### 26. Formato del permiso completo

Se admitirán exactamente dos estructuras.

Acceso a aplicación
^[a-z][a-z0-9_]*\.access$
Capacidad funcional
^[a-z][a-z0-9_]*\.[a-z][a-z0-9_]*\.[a-z][a-z0-9_]*\.[a-z][a-z0-9_]*$

Ejemplos válidos:

nexo.access
nexo.inventory.stock.view
nexo.inventory.remissions.request
origo.procurement.purchase_orders.approve

Ejemplos inválidos:

nexo.inventory
nexo.inventory.stock
nexo.inventory.stock.view.all
nexo.inventory.stock.view.all_sites

#### 27. Cantidad exacta de segmentos

Permiso de entrada:

app.action

Solo se permite cuando la acción es:

access

Permiso funcional:

app.module.resource.action

No se admitirán permisos funcionales de tres segmentos.

Incorrecto:

viso.staff.read
numera.expenses.view
pulso.delivery.override

Forma conceptual esperada:

viso.workforce.employees.view
numera.finance.expenses.view
pulso.delivery.deliveries.override

La equivalencia definitiva se decidirá en AUTH-CAT-003.

#### 28. Excepción reservada app.access

`<app>.access` será la única forma corta permitida.

Ejemplos:

shell.access
anima.access
viso.access
nexo.access
fogo.access
origo.access
pulso.access
numera.access
aura.access
pass.access

access significa:

el actor puede entrar a la superficie general de la aplicación

No significa:

puede ejecutar todas sus acciones;
puede leer todos sus recursos;
puede operar sin turno;
puede ignorar sede o área;
puede modificar configuración.

Regla:

APP.ACCESS
≠
AUTORIZACIÓN TOTAL DE LA APP

#### 29. No existirán permisos de acceso por módulo

No se crearán formas como:

nexo.inventory.access
viso.workforce.access
fogo.production.access

La navegación hacia un módulo deberá depender de:

una o más capacidades funcionales;
configuración de navegación;
reglas de presentación.

No se agregará otro nivel de permisos contenedores sin capacidad empresarial concreta.

#### 30. Rutas no son permisos

Los códigos no podrán derivarse automáticamente de:

URL;
nombre de carpeta;
nombre de archivo;
segmento dinámico;
page.tsx;
layout.tsx;
slug;
[id];
new;
edit;
login;
no-access.

Ejemplos prohibidos:

nexo.page_tsx.view
nexo.inventory_catalog_id.view
nexo.inventory_assets_items_id.view
nexo.login.view
nexo.no_access.view
nexo.new.view
nexo.edit.view
nexo.slug.view

Regla:

RUTA
→ CONSUME UN PERMISO

RUTA
≠ PERMISO

#### 31. Pantallas no son recursos

No se utilizarán como recursos:

page
screen
view
dashboard_page
main
home
login
no_access
new
edit
detail

Ejemplo actual problemático:

pulso.pos.main

Debe sustituirse por capacidades empresariales reales.

Ejemplos conceptuales:

pulso.sales.orders.view
pulso.sales.orders.create
pulso.payments.transactions.collect

#### 32. No incluir identificadores dinámicos

No se incluirán tokens como:

id
slug
uuid
code
index
page_tsx

Ejemplo incorrecto:

nexo.inventory_catalog_id_presentations.view

Ejemplo conceptual:

nexo.catalog.presentations.view

El identificador concreto del recurso pertenece a la solicitud y a la resolución del recurso, no al código del permiso.

#### 33. No incluir propiedad del recurso

El código no incluirá:

own
my
self
assigned
created_by_me

Ejemplo actual problemático:

nexo.inventory.remissions.edit_own_pending

Modelo canónico conceptual:

nexo.inventory.remissions.update

con condiciones de recurso:

resource.created_by = actor
resource.status = pending

La propiedad y el estado se evaluarán dentro del contrato de recurso.

No dentro del nombre del permiso.

#### 34. No incluir alcance territorial

El código no incluirá:

all_sites
site
site_type
area
area_kind
global
local
cross_site

Ejemplo actual problemático:

nexo.inventory.remissions.all_sites

La capacidad canónica deberá ser una acción real, por ejemplo:

nexo.inventory.remissions.view

La cobertura:

una sede;
sedes asignadas;
todas las sedes;
tipo de sede;
área;
tipo de área;
global;

se declarará mediante el alcance de la concesión y el contrato del permiso.

Regla:

PERMISO
→ QUÉ PUEDE HACER

ALCANCE
→ DÓNDE PUEDE HACERLO

#### 35. No incluir estado del recurso como alcance

No se crearán permisos como:

view_pending
edit_pending
cancel_open
view_completed

La acción será:

view
update
cancel

y el estado permitido se resolverá mediante:

reglas del recurso;
precondiciones de la operación;
contrato del permiso;
lógica transaccional.

Cuando la acción sea una transición empresarial concreta, sí podrá usar el verbo de transición.

Ejemplo:

approve
cancel
close

#### 36. No incluir sensibilidad como adjetivo ambiguo

Ejemplo actual:

nexo.internal_reports.full_margin

full_margin no declara una acción.

La capacidad deberá modelarse mediante un recurso y una acción claros.

Ejemplo conceptual:

numera.analytics.margin_reports.view

o mediante otro recurso sensible específico.

La definición final dependerá de la propiedad funcional del reporte.

#### 37. No incluir modalidad de autorización

Los códigos no incluirán:

admin
operational
base
shift
checkin
manager
owner
role

para indicar qué carril autoriza.

Incorrecto:

nexo.inventory.remissions.admin_cancel
nexo.inventory.remissions.operational_prepare

Correcto:

nexo.inventory.remissions.cancel
nexo.inventory.remissions.prepare

La modalidad se almacenará en:

authorization_requirement

y podrá ser:

BASE_ONLY
OPERATIONAL_ONLY
BASE_OR_OPERATIONAL
BASE_AND_OPERATIONAL

La clasificación corresponde a AUTH-CAT-006.

#### 38. Acciones excepcionales

Una acción administrativa excepcional no reutilizará necesariamente el mismo permiso operativo.

Ejemplo:

nexo.inventory.remissions.prepare
→ operación ordinaria

nexo.inventory.remissions.override
→ intervención excepcional

Sin embargo, override solo será válido cuando describa realmente una capacidad distinta que:

exige justificación;
tiene controles adicionales;
se audita separadamente;
no funciona como bypass general.

No se utilizará override para evitar definir correctamente un permiso.

#### 39. Acceso transversal no es bypass

Una capacidad de consulta transversal deberá conservar una acción empresarial clara.

Ejemplo:

nexo.inventory.remissions.view

con alcance:

all_assigned_sites

o:

global

No deberá transformarse en:

nexo.inventory.remissions.all_sites

y tampoco podrá utilizarse como bypass de toda la política operativa de NEXO.

#### 40. Descarga, exportación e impresión

La consulta ordinaria no implica automáticamente extracción o impresión.

Podrán existir acciones distintas:

view
download
export
print

Ejemplo:

numera.analytics.financial_reports.view
numera.analytics.financial_reports.export

Esto permite restringir separadamente la salida masiva de información.

#### 41. Carga e importación

Se diferencian:

upload
import

upload:

cargar un archivo o documento

import:

procesar datos externos para crear o modificar registros

Ejemplos:

anima.workforce.employee_documents.upload
nexo.catalog.products.import

#### 42. Asignación y revocación

Los permisos, roles, sedes y áreas utilizarán acciones específicas.

Ejemplos:

viso.authorization.role_assignments.assign
viso.authorization.role_assignments.revoke

viso.workforce.site_assignments.assign
viso.workforce.site_assignments.revoke

No se utilizará un único:

manage

para todas estas operaciones.

#### 43. Activación y desactivación

Para recursos con ciclo activo/inactivo se usarán:

activate
deactivate

No:

delete

Ejemplos:

viso.workforce.employees.deactivate
viso.workforce.employees.activate

La eliminación histórica de un trabajador no deberá confundirse con su desactivación laboral.

#### 44. Anulación y reversión

Se diferencian:

cancel
reverse
refund

cancel:

detiene un proceso antes de su finalización

reverse:

genera una operación compensatoria sobre un efecto ya aplicado

refund:

devuelve un pago o valor cobrado

Ejemplos:

origo.procurement.purchase_orders.cancel
origo.procurement.receipts.reverse
pulso.payments.transactions.refund

#### 45. Aprobación y resolución

Se diferencian:

approve
reject
resolve

approve y reject representan decisiones.

resolve representa cerrar una discrepancia, incidencia o variación mediante una determinación.

Ejemplos:

origo.procurement.purchase_orders.approve
nexo.inventory.variances.resolve

#### 46. Recursos equivalentes entre aplicaciones

Dos aplicaciones pueden tener recursos con nombres similares cuando cada una sea responsable de una capacidad diferente.

Ejemplo:

nexo.finance.cost_centers.view
numera.finance.cost_centers.view

Técnicamente son permisos distintos por su prefijo.

Sin embargo, deberá definirse:

qué aplicación es propietaria;
cuál solo consume;
qué operación ejecuta cada una;
si realmente se necesitan ambos permisos.

No se duplicará una capacidad solamente porque aparezca en dos interfaces.

#### 47. Propiedad funcional

El permiso pertenecerá a la aplicación que:

implementa la operación;
protege la operación del lado servidor;
mantiene el contrato funcional;
registra la auditoría principal.

No necesariamente a la aplicación desde la cual se muestra un enlace.

Ejemplo conceptual:

VISO muestra información de costos

No significa automáticamente que el permiso deba ser:

viso.finance.costs.view

Podría consumir una capacidad propiedad de NUMERA:

numera.finance.costs.view

La propiedad definitiva se resolverá durante la normalización.

#### 48. Navegación basada en capacidades

Una entrada de navegación deberá declarar uno o más permisos funcionales.

Ejemplo:

Remisiones
→ visible si el actor puede obtener
  nexo.inventory.remissions.view
  o alguna acción operativa compatible

La navegación no creará permisos como:

remissions_page.view
remissions_menu.view

Regla:

CAPACIDAD
→ PUEDE HABILITAR NAVEGACIÓN

NAVEGACIÓN
→ NO DEFINE CAPACIDAD

#### 49. Permiso funcional y operación del servidor

El mismo permiso canónico deberá utilizarse para:

navegación;
guard de página;
Server Action;
RPC;
RLS cuando sea aplicable;
auditoría;
simulación;
dispositivos compartidos.

No se crearán códigos distintos para cada capa.

Incorrecto:

remissions.page.view
remissions.rpc.request
remissions.server.request
remissions.button.request

Correcto:

nexo.inventory.remissions.request

Todas las capas consumen la misma capacidad.

#### 50. Permisos del frontend no son suficientes

Que una ruta o botón verifique:

nexo.inventory.remissions.request

no autoriza por sí solo la operación.

La misma capacidad deberá comprobarse en el límite de confianza correspondiente:

RPC;
Server Action;
función SQL;
política RLS;
servicio backend.

La convención unifica el nombre.

No sustituye la validación del servidor.

#### 51. Idioma de los códigos

Todos los códigos técnicos utilizarán inglés.

Correcto:

employees
shifts
remissions
purchase_orders
view
approve
cancel

Incorrecto:

empleados
turnos
remisiones
ordenes_compra
ver
aprobar
cancelar

Los nombres y descripciones humanas se escribirán en español.

Ejemplo:

permission_key:
origo.procurement.purchase_orders.approve

human_label:
Aprobar órdenes de compra

Las descripciones humanas corresponden a AUTH-CAT-005.

#### 52. Abreviaturas

Se evitarán abreviaturas que no sean inequívocas dentro de Vento.

Incorrecto:

inv
rem
cfg
usr
mgr
ops

Preferido:

inventory
remissions
settings
users
management
operations

Se podrán conservar acrónimos empresariales ampliamente reconocidos cuando sean parte estable del dominio.

Toda abreviatura permitida deberá quedar registrada en el catálogo versionado.

#### 53. Nombres de implementación prohibidos

No se utilizarán nombres dependientes del framework:

tsx
jsx
react
next
expo
supabase
rpc
server_action
component
hook
query
mutation

Ejemplo incorrecto:

nexo.inventory.remissions.rpc_request

Correcto:

nexo.inventory.remissions.request

#### 54. Versiones prohibidas en el código

No se utilizarán:

v1
v2
new
legacy
old
beta
final

Ejemplos incorrectos:

nexo.inventory.remissions_v2.request
viso.workforce.employees_new.view

La versión pertenece al catálogo, contrato o ciclo de migración.

No a la identidad funcional permanente.

#### 55. Códigos legacy

Los permisos actuales que incumplan la convención serán clasificados como:

legacy

Un código legacy podrá mantenerse temporalmente para compatibilidad.

Ejemplo:

nexo.inventory_remissions.view

podrá apuntar temporalmente a:

nexo.inventory.remissions.view

pero no será un permiso canónico nuevo.

#### 56. Alias de compatibilidad

Un alias legacy deberá cumplir:

un alias
→ un único permiso canónico

No se permitirán:

alias ambiguo;
alias que autorice independientemente;
cadena de aliases;
alias circular;
alias que cambie según aplicación;
alias que cambie según actor.

Modelo:

legacy_permission_key
        ↓
canonical_permission_key

No:

legacy A
→ legacy B
→ canonical C

#### 57. El alias no es otra capacidad

Durante la transición:

permiso legacy
+
permiso canónico

no deberán mostrarse como dos capacidades distintas en VISO.

La interfaz deberá mostrar:

una capacidad canónica
+
sus referencias legacy

El alias existirá únicamente para compatibilidad y trazabilidad.

#### 58. Acciones desconocidas

No se podrá crear libremente una acción nueva sin registrarla.

Toda acción nueva deberá declarar:

nombre;
definición;
diferencia frente a acciones existentes;
tipo de operación;
riesgo;
si modifica estado;
si es sensible;
ejemplos de uso.

Esto evita variantes como:

receive
accept
confirm
complete
finish
close

utilizadas indistintamente para la misma operación.

#### 59. Registro canónico de acciones

El catálogo versionado deberá mantener un registro de acciones permitidas.

Ejemplo conceptual:

view
create
update
delete
activate
deactivate
assign
revoke
request
prepare
dispatch
receive
approve
reject
cancel
close
reopen
archive
restore
issue
collect
refund
reverse
resolve
upload
download
import
export
publish
unpublish
accumulate
redeem
override
simulate

Esta lista podrá ampliarse mediante decisión explícita.

No mediante cadenas ad hoc.

#### 60. Ejemplos canónicos por aplicación

Los siguientes ejemplos ilustran la estructura.

No constituyen todavía el catálogo definitivo.

SHELL
shell.access
shell.platform.applications.view
shell.platform.navigation.view
ANIMA
anima.access
anima.attendance.shifts.view
anima.attendance.shifts.create
anima.attendance.shifts.cancel
anima.workforce.employee_documents.upload
VISO
viso.access
viso.workforce.employees.view
viso.workforce.employees.create
viso.workforce.employees.deactivate
viso.authorization.permissions.view
viso.authorization.permission_assignments.assign
viso.authorization.permission_assignments.revoke
NEXO
nexo.access
nexo.inventory.stock.view
nexo.inventory.movements.view
nexo.inventory.remissions.view
nexo.inventory.remissions.request
nexo.inventory.remissions.prepare
nexo.inventory.remissions.dispatch
nexo.inventory.remissions.receive
nexo.inventory.remissions.cancel
FOGO
fogo.access
fogo.production.batches.view
fogo.production.batches.create
fogo.production.batches.close
fogo.production.recipes.view
fogo.production.recipes.update
ORIGO
origo.access
origo.procurement.purchase_orders.view
origo.procurement.purchase_orders.create
origo.procurement.purchase_orders.approve
origo.procurement.receipts.view
origo.procurement.receipts.register
origo.procurement.receipts.reverse
PULSO
pulso.access
pulso.sales.orders.view
pulso.sales.orders.create
pulso.sales.orders.cancel
pulso.payments.transactions.collect
pulso.payments.transactions.refund
pulso.loyalty.points.accumulate
pulso.loyalty.points.redeem
NUMERA
numera.access
numera.finance.expenses.view
numera.finance.expenses.create
numera.finance.expenses.approve
numera.analytics.profitability_reports.view
numera.finance.cost_centers.view
AURA
aura.access
aura.marketing.campaigns.view
aura.marketing.campaigns.create
aura.marketing.campaigns.publish
PASS
pass.access
pass.loyalty.rewards.view
pass.loyalty.rewards.redeem

Los permisos de cliente de PASS deberán mantenerse separados del RBAC laboral cuando corresponda.

#### 61. Comparación con permisos actuales

Permiso actual
anima.documents.view_all

Problemas:

falta módulo claro;
incluye alcance "all";
mezcla acción y alcance.

Forma conceptual:

anima.workforce.employee_documents.view

con alcance definido separadamente.

Permiso actual
fogo.production.batches

Problema:

no declara acción.

Posibles capacidades:

fogo.production.batches.view
fogo.production.batches.create
Permiso actual
nexo.inventory.remissions

Problema:

no declara acción.

Posibles capacidades:

nexo.inventory.remissions.view
nexo.inventory.remissions.request
Permiso actual
nexo.inventory.remissions.all_sites

Problema:

all_sites es alcance, no acción.

Forma conceptual:

nexo.inventory.remissions.view

con alcance territorial independiente.

Permiso actual
nexo.inventory.remissions.edit_own_pending

Problemas:

edit no es la acción canónica;
own es propiedad;
pending es estado;
combina tres condiciones en el código.

Forma conceptual:

nexo.inventory.remissions.update

con predicados de recurso.

Permiso actual
nexo.inventory_catalog_id.view

Problemas:

derivado de ruta;
incluye id;
no identifica módulo y recurso limpiamente.

Forma conceptual:

nexo.catalog.products.view

según el recurso real protegido.

Permiso actual
origo.procurement.purchase_orders

Problema:

no declara acción.

Forma conceptual:

origo.procurement.purchase_orders.view

si la capacidad actual es de consulta.

Permiso actual
pulso.pos.main

Problemas:

representa una pantalla;
main no es una acción empresarial;
no identifica recurso.

Deberá sustituirse por capacidades reales de ventas, órdenes, pagos o caja.

#### 62. Validación semántica

Un permiso podrá cumplir el regex y seguir siendo inválido.

Ejemplo:

nexo.pages.page_tsx.view

Cumple formalmente cuatro segmentos.

Pero es semánticamente inválido porque:

pages
→ implementación

page_tsx
→ archivo técnico

La validación tendrá dos niveles:

#### 1. Validación sintáctica

#### 2. Validación contra catálogos canónicos

#### 63. Validación sintáctica

Comprobará:

cantidad de segmentos;
caracteres permitidos;
minúsculas;
ausencia de espacios;
ausencia de puntos adicionales;
estructura app.access o app.module.resource.action.

#### 64. Validación de catálogo

Comprobará:

aplicación existente;
módulo permitido para la aplicación;
recurso registrado;
acción registrada;
combinación módulo-recurso válida;
combinación recurso-acción válida;
ausencia de código legacy como código nuevo.

#### 65. Validación de significado

Comprobará que:

el código representa una capacidad empresarial;
no representa una ruta;
no contiene alcance;
no contiene propiedad;
no contiene sede;
no contiene área;
no contiene rol;
no contiene modalidad;
no contiene estado como filtro;
no contiene implementación.

#### 66. Unicidad

La clave completa deberá ser única:

app_code
+
permission_code

Ejemplo:

nexo + inventory.stock.view

No podrán existir dos permisos activos con:

nexo.inventory.stock.view

aunque tengan:

nombres humanos diferentes;
descripciones diferentes;
migraciones diferentes.

#### 67. Inmutabilidad

Una vez publicado un código canónico:

no se editará silenciosamente.

Cambiar:

nexo.inventory.remissions.dispatch

por:

nexo.logistics.remissions.dispatch

será una migración contractual.

Requerirá:

nuevo código;
alias legacy;
actualización de consumidores;
pruebas;
retiro controlado.

#### 68. Renombrar una etiqueta no renombra el permiso

Podrá cambiar:

human_label;
human_description;
agrupación visual;
orden en VISO.

Sin cambiar:

permission_key.

Ejemplo:

permission_key:
nexo.inventory.remissions.request

etiqueta anterior:
Solicitar remisión

etiqueta nueva:
Crear solicitud de remisión

El permiso continúa siendo el mismo.

#### 69. El código no representa jerarquía

La estructura con puntos sirve para identificación y organización.

No implica herencia.

Ejemplo:

nexo.inventory.remissions.view

no es concedido automáticamente por:

nexo.inventory
nexo.inventory.remissions
nexo.access

porque esos permisos contenedores no existirán.

Regla:

NO HAY WILDCARDS IMPLÍCITOS
NO HAY HERENCIA POR PREFIJO

#### 70. Wildcards prohibidos

No se admitirán asignaciones como:

nexo.*
nexo.inventory.*
nexo.inventory.remissions.*
*.view

Cada permiso deberá concederse explícitamente.

Las agrupaciones administrativas podrán existir para edición masiva, pero deberán expandirse a permisos concretos.

#### 71. Grupos de permisos

VISO podrá mostrar grupos como:

Remisiones
Inventario
Producción
Personal
Compras

Pero un grupo:

no es un permiso;
no se almacena como wildcard;
no autoriza por sí solo.

Ejemplo:

Grupo: Remisiones

Incluye:
├── view
├── request
├── prepare
├── dispatch
├── receive
└── cancel

La selección del grupo deberá generar asignaciones explícitas.

#### 72. Relación con authorization_requirement

El código responde:

qué capacidad se solicita.

authorization_requirement responde:

qué carril o carriles pueden autorizarla.

Ejemplo:

permission_key:
nexo.inventory.remissions.prepare

authorization_requirement:
OPERATIONAL_ONLY

Otro ejemplo:

permission_key:
nexo.inventory.remissions.view

authorization_requirement:
BASE_OR_OPERATIONAL

No se crearán códigos diferentes únicamente por modalidad.

#### 73. Relación con el alcance

El código responde:

qué acción se permite.

El alcance responde:

sobre qué territorio o conjunto de recursos se permite.

Ejemplo:

permission:
numera.finance.expenses.view

scope:
assigned_sites

No:

numera.finance.expenses.view_assigned_sites

#### 74. Relación con el recurso

El permiso no deberá confiar en un site_id o area_id enviado libremente por el cliente.

Ejemplo:

nexo.inventory.remissions.receive

La autorización deberá resolver desde la remisión:

sede destino;
estado actual;
área aplicable;
actor;
turno;
rol operativo.

La convención nombra la capacidad.

El contrato de recurso determina dónde y sobre qué objeto se aplica.

La definición completa corresponde a AUTH-CAT-016.

#### 75. Relación con el dispositivo compartido

No se crearán permisos específicos por dispositivo.

Incorrecto:

nexo.inventory.stock.view_kiosk
pulso.sales.orders.create_pos_terminal

El dispositivo aplicará restricciones adicionales:

permisos del actor
∩
capacidades permitidas del dispositivo

El permiso canónico permanece:

nexo.inventory.stock.view
pulso.sales.orders.create

#### 76. Relación con simulación

No se crearán versiones como:

employees.view_simulated
remissions.prepare_simulation

La simulación evaluará el mismo permiso canónico dentro de:

SimulationContext

y bloqueará los efectos reales según sus reglas.

#### 77. Relación con permisos de emergencia

Una operación de emergencia deberá tener una capacidad empresarial diferenciada cuando sus controles sean distintos.

Ejemplo:

nexo.inventory.remissions.prepare

y:

nexo.inventory.remissions.override

No:

nexo.inventory.remissions.prepare_without_shift

La ausencia de turno es una característica de autorización.

No parte del nombre.

#### 78. Relación con auditoría

Toda decisión de autorización deberá registrar la clave completa:

nexo.inventory.remissions.prepare

No solamente:

prepare

La auditoría deberá poder identificar sin ambigüedad:

aplicación;
módulo;
recurso;
acción.

#### 79. Relación con TypeScript

Los tipos futuros deberán derivarse del catálogo.

Ejemplo conceptual:

type PermissionKey =
  | "nexo.inventory.stock.view"
  | "nexo.inventory.remissions.request"
  | "fogo.production.batches.create";

No deberán mantenerse manualmente múltiples listas diferentes por repositorio.

Esto corresponde a:

AUTH-CAT-018

#### 80. Relación con cadenas manuales

Los repositorios no deberán escribir directamente:

"nexo.inventory.remissions.request"

en múltiples archivos.

Deberán consumir constantes o tipos derivados.

Ejemplo conceptual:

PERMISSIONS.NEXO.INVENTORY.REMISSIONS.REQUEST

La implementación corresponde a:

AUTH-CAT-019

#### 81. Cómo se verá en VISO

Permiso

Aplicación
[ NEXO ]

Módulo
[ Inventario ]

Recurso
[ Remisiones ]

Acción
[ Solicitar ]

Código canónico
nexo.inventory.remissions.request

Modalidad
[ Pendiente de definir ]

Alcance permitido
[ Pendiente de definir ]

Estado
● Activo
○ Deprecated
○ Retirado

El código canónico no deberá editarse como texto libre después de su publicación.

#### 82. Cómo se verá un permiso legacy

Permiso canónico

Solicitar remisiones
nexo.inventory.remissions.request

Compatibilidad legacy
└── nexo.inventory.remissions

Estado legacy
Deprecated

Uso nuevo
Bloqueado

#### 83. Cómo se verá un error de convención

Código rechazado

nexo.inventory.remissions.all_sites

⚠️ Problema:
"all_sites" representa alcance territorial,
no una acción empresarial.

Código funcional sugerido:
nexo.inventory.remissions.view

El alcance debe configurarse separadamente.

#### 84. Riesgos controlados

Riesgo 1 — Volver a generar permisos desde rutas

Control:

rutas consumen permisos registrados;
no crean permisos automáticamente.
Riesgo 2 — Multiplicar permisos de lectura

Control:

view cubre lista y detalle ordinarios.
Riesgo 3 — Ocultar demasiadas acciones bajo manage

Control:

acciones atómicas y explícitas.
Riesgo 4 — Convertir alcance en parte del código

Control:

scope separado del permission_key.
Riesgo 5 — Crear códigos diferentes por dispositivo

Control:

el dispositivo restringe;
no redefine la capacidad.
Riesgo 6 — Duplicar permisos entre frontend y backend

Control:

una misma clave en todas las capas.
Riesgo 7 — Renombrar permisos sin trazabilidad

Control:

inmutabilidad + alias legacy.

#### 85. Fuera del alcance

Esta tarea no determina todavía:

el mapa completo de los 177 permisos actuales;
el módulo definitivo de cada permiso;
el recurso definitivo de cada permiso;
la acción definitiva de cada permiso legacy;
qué permisos se eliminan;
qué permisos se fusionan;
las descripciones humanas;
authorization_requirement;
alcances admitidos;
prerrequisitos de turno;
prerrequisitos de check-in;
requisitos de área;
sensibilidad;
compatibilidad con dispositivos;
compatibilidad con simulación;
contratos de recurso;
matrices de roles.

Estos temas se resolverán entre:

AUTH-CAT-003 y AUTH-CAT-016

#### 86. Resultado esperado

La convención canónica queda definida así:

ACCESO GENERAL

`<app>.access`
CAPACIDAD FUNCIONAL

`<app>.<module>.<resource>.<action>`

Ejemplo:

nexo.inventory.remissions.request

Descomposición:

app       = nexo
module    = inventory
resource  = remissions
action    = request

#### 87. Reglas resumidas

APP
→ aplicación propietaria

MÓDULO
→ dominio funcional estable

RECURSO
→ entidad empresarial

ACCIÓN
→ verbo empresarial exacto

No pertenece al código:

ruta;
pantalla;
archivo;
identificador;
sede;
área;
tipo de sede;
tipo de área;
propiedad;
estado como filtro;
rol;
modalidad;
dispositivo;
simulación;
framework;
versión.

#### 88. Invariantes

Todo permiso pertenece a una aplicación registrada.
Todo permiso funcional tiene exactamente cuatro segmentos.
app.access es la única forma corta.
Toda capacidad funcional declara una acción.
Las acciones se escriben en inglés.
La lectura ordinaria utiliza view.
manage no se utiliza para permisos canónicos nuevos.
Las rutas no generan permisos.
Los segmentos dinámicos no aparecen en códigos.
El alcance no aparece dentro del código.
La propiedad del recurso no aparece dentro del código.
El estado como filtro no aparece dentro del código.
La modalidad de autorización no aparece dentro del código.
Los dispositivos no generan variantes del permiso.
La simulación utiliza las mismas claves.
No existen wildcards implícitos.
No existe herencia por prefijo.
Los códigos publicados son inmutables.
Los códigos legacy se mantienen únicamente como aliases temporales.
Un alias apunta a una única clave canónica.
Un permiso representa una única capacidad.
Navegación, frontend y backend consumen la misma clave.
El catálogo valida aplicación, módulo, recurso y acción.
El código técnico usa inglés y la presentación humana usa español.
Toda modificación futura de la convención exige una decisión explícita.

#### 89. Criterios de aprobación

Los criterios de aprobación de esta tarea fueron aceptados íntegramente
durante su revisión y quedan respaldados por sus invariantes,
resultado esperado y decisión final.

#### 90. Decisión final

PERMISSION_KEY
**=**
APP
+
MODULE
+
RESOURCE
+
ACTION
APP.ACCESS
**=**
ENTRADA GENERAL A LA APLICACIÓN
NO AUTORIZACIÓN TOTAL
EL CÓDIGO DECLARA:
QUÉ CAPACIDAD SE SOLICITA

EL CATÁLOGO DECLARA:
CÓMO PUEDE AUTORIZARSE

EL ALCANCE DECLARA:
DÓNDE PUEDE EJECUTARSE

EL RECURSO DECLARA:
SOBRE QUÉ OBJETO SE EJECUTA

EL CONTEXTO DECLARA:
QUIÉN, CUÁNDO Y DESDE DÓNDE ACTÚA

Estado:

AUTH-CAT-001
→ APROBADA

AUTH-CAT-002
→ APROBADA
