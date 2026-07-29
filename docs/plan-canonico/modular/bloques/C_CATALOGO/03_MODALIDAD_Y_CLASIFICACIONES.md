### SECCIÓN — MODALIDAD Y CLASIFICACIONES

<!-- PLAN-SECTION-META:START -->
Esta sección reúne contenido canónico con una responsabilidad documental única dentro del plan. Debe conservarse cohesionada y actualizarse junto con sus referencias y validaciones dependientes.

**Cobertura canónica:** `AUTH-CAT-006` a `AUTH-CAT-010` — 5 tareas.
<!-- PLAN-SECTION-META:END -->

### ✅ AUTH-CAT-006 — Definir authorization_requirement de cada permiso

#### 1. Estado de implementación

Esta tarea es exclusivamente documental.

No se realizan:

cambios en Supabase;
migraciones;
modificaciones de tablas;
cambios en RLS;
cambios en RPC;
cambios en aplicaciones;
asignaciones de permisos;
modificaciones de matrices;
implementación en vento-shell.

La futura implementación deberá crearse y documentarse mediante migraciones versionadas en vento-shell.

#### 2. Problema que se resuelve

El catálogo canónico ya define:

la identidad técnica de cada permiso;
su aplicación;
su módulo;
su recurso;
su acción;
su etiqueta humana;
su descripción humana.

Sin embargo, todavía no declara qué fuente de autorización puede satisfacer cada permiso.

Actualmente podría interpretarse incorrectamente que:

todo permiso asignado a un rol base funciona sin turno;
todo permiso asignado a un rol operativo requiere turno;
una aplicación operativa solo admite permisos operativos;
una aplicación administrativa solo admite permisos base;
un permiso presente en ambas matrices suma privilegios automáticamente;
un permiso base puede reemplazar el contexto operativo;
un turno activo puede reemplazar una responsabilidad administrativa;
la modalidad puede decidirse de forma diferente en cada ruta, RPC o aplicación.

Estas interpretaciones quedan prohibidas.

#### 3. Objetivo

Todo permiso canónico activo deberá declarar exactamente un:

authorization_requirement

Los únicos valores admitidos serán:

BASE_ONLY
OPERATIONAL_ONLY
BASE_OR_OPERATIONAL
BASE_AND_OPERATIONAL

El campo responde exclusivamente:

¿Qué carril o combinación de carriles
puede autorizar esta capacidad?

No responde:

qué rol recibe el permiso;
en qué sedes puede utilizarse;
si requiere check-in;
si requiere área activa;
si es de solo lectura;
si es de configuración;
si es sensible;
si admite dispositivo compartido;
si admite simulación;
qué recurso territorial debe resolverse.

Esas propiedades corresponden a las tareas posteriores de BLOQUE C.

#### 4. Fuente normativa

Esta tarea aplica las modalidades aprobadas en:

AUTH-MOD-018
→ precedencia entre permisos base y operativos

AUTH-MOD-019
→ reglas de denegación explícita

ADR-AUTH-001
→ modelo canónico de identidad, contexto y autorización

AUTH-CAT-006 no redefine esas decisiones.

Las aplica individualmente al catálogo de permisos aprobado.

#### 5. Modalidades canónicas

5.1 BASE_ONLY

El permiso solo puede autorizarse mediante el carril base.

Fuentes compatibles:

rol base
concesión individual base

El permiso no exige por su modalidad:

turno;
check-in;
rol operativo;
sesión operativa.

Esto no significa que sea global.

Todavía deberá respetar:

empleado activo;
permiso activo;
alcance;
recurso;
denegaciones;
restricciones adicionales.

Una concesión operativa con el mismo código será incompatible y no autorizará.

5.2 OPERATIONAL_ONLY

El permiso solo puede autorizarse mediante el carril operativo.

Fuentes compatibles:

rol operativo activo
concesión individual operativa

El permiso base con el mismo código no reemplazará:

turno;
contexto operativo;
sede operativa;
área operativa;
rol operativo;
restricciones del recurso.

La definición exacta de turno, check-in y área requeridos corresponde a:

AUTH-CAT-012
AUTH-CAT-013
5.3 BASE_OR_OPERATIONAL

El permiso puede autorizarse mediante cualquiera de los dos carriles.

Cada carril deberá producir una decisión completa e independiente.

BASE_ALLOW
OR
OPERATIONAL_ALLOW
**=**
ALLOW

El carril base no podrá tomar prestado:

el turno operativo;
el área operativa;
el alcance del rol operativo.

El carril operativo no podrá tomar prestado:

el alcance base;
una concesión administrativa;
una responsabilidad permanente faltante.

Una denegación limitada a un carril no bloqueará automáticamente el otro carril.

Una denegación transversal aplicable sí bloqueará ambos.

5.4 BASE_AND_OPERATIONAL

El permiso exige autorización completa en los dos carriles.

BASE_ALLOW
AND
OPERATIONAL_ALLOW
**=**
ALLOW

Se utilizará para operaciones en las que debe coexistir:

una responsabilidad permanente explícita;
participación operativa real en el contexto afectado.

La ausencia o denegación de cualquiera de los dos carriles produce:

DENY

BASE_AND_OPERATIONAL no sustituye la clasificación de sensibilidad.

La sensibilidad formal se definirá en AUTH-CAT-010.

#### 6. Reglas generales de clasificación

6.1 La aplicación no determina la modalidad

El tipo de aplicación es descriptivo.

Ejemplo:

FOGO
→ aplicación operativa

No significa que todos sus permisos sean OPERATIONAL_ONLY.

FOGO también puede contener capacidades administrativas como:

fogo.production.recipes.view
→ BASE_ONLY
6.2 La acción no determina automáticamente la modalidad

No se aplicarán reglas automáticas como:

view
→ BASE_ONLY

create
→ OPERATIONAL_ONLY

approve
→ BASE_AND_OPERATIONAL

Cada capacidad se clasifica según su efecto empresarial real.

6.3 La tabla de asignación no determina la modalidad

Incorrecto:

Existe en role_permissions
→ BASE_ONLY

Incorrecto:

Existe en operational_role_permissions
→ OPERATIONAL_ONLY

Correcto:

catálogo del permiso
→ define authorization_requirement

matriz
→ asigna una capacidad compatible

contexto
→ determina si puede utilizarse
6.4 No existe modalidad implícita
authorization_requirement = null
→ CONFIGURACIÓN INCOMPLETA
→ DENEGAR

No se utilizará como valor predeterminado:

BASE_OR_OPERATIONAL

porque sería la modalidad más permisiva.

6.5 Un permiso tiene una única modalidad activa

Un mismo permission_key no podrá tratarse como:

base en una ruta;
operativo en otra ruta;
híbrido en una RPC;
administrativo dentro de una política RLS.

Todas las superficies deberán consumir la misma clasificación versionada.

#### 7. Permisos de entrada a aplicaciones

Los permisos `<app>.access` se clasifican individualmente.

| Permiso       | Modalidad           |
| ------------- | ------------------- |
| shell.access  | BASE_ONLY           |
| anima.access  | BASE_ONLY           |
| aura.access   | BASE_ONLY           |
| fogo.access   | BASE_OR_OPERATIONAL |
| nexo.access   | BASE_OR_OPERATIONAL |
| numera.access | BASE_ONLY           |
| origo.access  | BASE_OR_OPERATIONAL |
| pass.access   | BASE_ONLY           |
| pulso.access  | OPERATIONAL_ONLY    |
| viso.access   | BASE_ONLY           |

Regla:

APP.ACCESS
≠
AUTORIZACIÓN TOTAL DE LA APLICACIÓN

Entrar a una aplicación no concede automáticamente sus capacidades específicas.

#### 8. Clasificación canónica — SHELL

| Permiso canónico | authorization_requirement |
| ---------------- | ------------------------- |
| shell.access     | BASE_ONLY                 |

SHELL es el hub laboral.

Su entrada no debe depender de un turno porque puede ser necesaria antes de iniciar cualquier contexto operativo.

#### 9. Clasificación canónica — ANIMA

| Permiso canónico                          | authorization_requirement |
| ----------------------------------------- | ------------------------- |
| anima.access                              | BASE_ONLY                 |
| anima.workforce.employee_documents.view   | BASE_ONLY                 |
| anima.workforce.employee_documents.upload | BASE_ONLY                 |
| anima.workforce.employee_documents.delete | BASE_ONLY                 |
| anima.workforce.employee_photos.upload    | BASE_ONLY                 |
| anima.workforce.team_members.view         | BASE_ONLY                 |
| anima.workforce.staff_invitations.create  | BASE_ONLY                 |
| anima.attendance.shifts.create            | BASE_ONLY                 |
| anima.attendance.shifts.update            | BASE_ONLY                 |
| anima.attendance.shifts.cancel            | BASE_ONLY                 |

ANIMA inicia y cierra el contexto operativo, pero no recibe permisos operativos por esa responsabilidad.

Un trabajador debe poder abrir ANIMA antes de tener:

turno activo;
check-in activo;
rol operativo efectivo.

Las capacidades administrativas sobre trabajadores, documentos y programación pertenecen al carril base.

#### 10. Clasificación canónica — AURA

| Permiso canónico | authorization_requirement |
| ---------------- | ------------------------- |
| aura.access      | BASE_ONLY                 |

AURA permanece como aplicación administrativa laboral de alcance diferido.

No se habilita un carril operativo hasta completar su auditoría funcional.

#### 11. Clasificación canónica — FOGO

| Permiso canónico                 | authorization_requirement |
| -------------------------------- | ------------------------- |
| fogo.access                      | BASE_OR_OPERATIONAL       |
| fogo.production.batches.view     | BASE_OR_OPERATIONAL       |
| fogo.production.batches.create   | OPERATIONAL_ONLY          |
| fogo.production.orders.view      | BASE_OR_OPERATIONAL       |
| fogo.production.recipe_book.view | OPERATIONAL_ONLY          |
| fogo.production.recipes.view     | BASE_ONLY                 |

Justificación
Consulta de lotes y órdenes

Puede existir legítimamente en dos contextos:

Gerencia o supervisión
→ consulta base

Producción activa
→ consulta operativa

Por tanto:

BASE_OR_OPERATIONAL
Crear lotes de producción

Representa ejecución productiva real.

Debe depender del contexto operativo:

OPERATIONAL_ONLY
Recetario operativo

Es la referencia utilizada durante la producción activa.

fogo.production.recipe_book.view
→ OPERATIONAL_ONLY
Definición de recetas

La consulta de la definición estructural de recetas pertenece al dominio administrativo o técnico de producción.

fogo.production.recipes.view
→ BASE_ONLY

Esto separa:

RECETARIO PARA EJECUTAR
≠
CATÁLOGO DE RECETAS PARA ADMINISTRAR

#### 12. Clasificación canónica — NEXO

12.1 Acceso y catálogo

| Permiso canónico                   | authorization_requirement |
| ---------------------------------- | ------------------------- |
| nexo.access                        | BASE_OR_OPERATIONAL       |
| nexo.catalog.products.view         | BASE_OR_OPERATIONAL       |
| nexo.catalog.products.create       | BASE_ONLY                 |
| nexo.catalog.presentations.view    | BASE_OR_OPERATIONAL       |
| nexo.catalog.request_policies.view | BASE_OR_OPERATIONAL       |
| nexo.catalog.categories.view       | BASE_OR_OPERATIONAL       |
| nexo.catalog.units.view            | BASE_OR_OPERATIONAL       |

Las consultas de catálogo pueden ser necesarias para:

administración;
solicitudes;
conteos;
recepción;
preparación;
producción;
logística.

Crear productos continúa siendo una responsabilidad base.

12.2 Activos

| Permiso canónico         | authorization_requirement |
| ------------------------ | ------------------------- |
| nexo.assets.items.view   | BASE_OR_OPERATIONAL       |
| nexo.assets.items.create | BASE_ONLY                 |
| nexo.assets.groups.view  | BASE_OR_OPERATIONAL       |
| nexo.assets.counts.view  | BASE_OR_OPERATIONAL       |

La consulta puede utilizarse desde supervisión o ejecución.

La creación de activos pertenece al carril base.

12.3 Inventario: ajustes y entradas

| Permiso canónico                    | authorization_requirement |
| ----------------------------------- | ------------------------- |
| nexo.inventory.adjustments.view     | BASE_OR_OPERATIONAL       |
| nexo.inventory.adjustments.register | BASE_AND_OPERATIONAL      |
| nexo.inventory.entries.view         | BASE_OR_OPERATIONAL       |
| nexo.inventory.entries.register     | OPERATIONAL_ONLY          |
| nexo.inventory.entries.override     | BASE_AND_OPERATIONAL      |

Registrar ajustes

Modificar existencias mediante un ajuste requiere:

responsabilidad base explícita
+
participación operativa en el inventario afectado

Por tanto:

BASE_AND_OPERATIONAL
Registrar entradas ordinarias

Representa el ingreso físico de productos.

OPERATIONAL_ONLY
Registrar entradas excepcionales

El flujo excepcional exige simultáneamente:

autoridad para utilizar la excepción;
contexto operativo real en la recepción afectada.
BASE_AND_OPERATIONAL
12.4 Inventario: ubicaciones, LPN y movimientos

| Permiso canónico                           | authorization_requirement |
| ------------------------------------------ | ------------------------- |
| nexo.inventory.locations.view              | BASE_OR_OPERATIONAL       |
| nexo.inventory.location_assignments.assign | OPERATIONAL_ONLY          |
| nexo.inventory.location_catalog.update     | BASE_ONLY                 |
| nexo.inventory.lpns.view                   | BASE_OR_OPERATIONAL       |
| nexo.inventory.movements.view              | BASE_OR_OPERATIONAL       |
| nexo.inventory.stock.view                  | BASE_OR_OPERATIONAL       |
| nexo.inventory.production_batches.view     | BASE_OR_OPERATIONAL       |

Asignar existencias o contenedores a una ubicación representa una acción física dentro del inventario:

OPERATIONAL_ONLY

Modificar el catálogo permitido de una ubicación representa configuración:

BASE_ONLY
12.5 Inventario: traslados y retiros

| Permiso canónico                    | authorization_requirement |
| ----------------------------------- | ------------------------- |
| nexo.inventory.transfers.view       | BASE_OR_OPERATIONAL       |
| nexo.inventory.transfers.create     | OPERATIONAL_ONLY          |
| nexo.inventory.withdrawals.view     | BASE_OR_OPERATIONAL       |
| nexo.inventory.withdrawals.register | OPERATIONAL_ONLY          |

Crear traslados y registrar retiros modifican físicamente las existencias.

No podrán ejecutarse mediante un permiso base heredado de un oficio antiguo.

12.6 Inventario: zonas y operaciones de bodega

| Permiso canónico                         | authorization_requirement |
| ---------------------------------------- | ------------------------- |
| nexo.inventory.zones.view                | BASE_OR_OPERATIONAL       |
| nexo.inventory.storage_positions.view    | BASE_OR_OPERATIONAL       |
| nexo.inventory.warehouse_operations.view | BASE_OR_OPERATIONAL       |
| nexo.inventory.stock_validations.perform | OPERATIONAL_ONLY          |

Las consultas pueden realizarse desde administración o desde la operación.

La validación física del stock requiere contexto operativo.

12.7 Inventario: conteos

| Permiso canónico                    | authorization_requirement |
| ----------------------------------- | ------------------------- |
| nexo.inventory.stock_counts.view    | BASE_OR_OPERATIONAL       |
| nexo.inventory.stock_counts.perform | OPERATIONAL_ONLY          |
| nexo.inventory.initial_counts.view  | BASE_OR_OPERATIONAL       |

Consultar conteos puede utilizarse para:

auditoría;
supervisión;
ejecución.

Realizar un conteo corresponde a una actividad operativa.

Esta modalidad no determina todavía quién puede aprobar o aplicar diferencias resultantes.

12.8 Remisiones

| Permiso canónico                   | authorization_requirement |
| ---------------------------------- | ------------------------- |
| nexo.inventory.remissions.view     | BASE_OR_OPERATIONAL       |
| nexo.inventory.remissions.update   | BASE_OR_OPERATIONAL       |
| nexo.inventory.remissions.request  | OPERATIONAL_ONLY          |
| nexo.inventory.remissions.prepare  | OPERATIONAL_ONLY          |
| nexo.inventory.remissions.dispatch | OPERATIONAL_ONLY          |
| nexo.inventory.remissions.receive  | OPERATIONAL_ONLY          |
| nexo.inventory.remissions.cancel   | BASE_OR_OPERATIONAL       |

Consultar remisiones

Puede autorizarse por:

Gerencia o administración
→ carril base

Trabajador en logística, producción o sede receptora
→ carril operativo
Actualizar remisiones

La acción podrá existir en contextos administrativos u operativos.

El contrato de recurso deberá distinguir posteriormente:

estado editable;
actor solicitante;
origen;
destino;
propiedad;
campos permitidos.
Solicitar, preparar, despachar y recibir

Son transiciones operativas reales:

OPERATIONAL_ONLY
Cancelar remisiones

Puede existir una cancelación administrativa o una cancelación dentro del flujo operativo.

Cada carril deberá cumplir sus restricciones independientemente:

BASE_OR_OPERATIONAL

La sensibilidad, los estados cancelables y la autoridad concreta se definirán después.

12.9 Logística

| Permiso canónico                       | authorization_requirement |
| -------------------------------------- | ------------------------- |
| nexo.logistics.operations_board.view   | BASE_OR_OPERATIONAL       |
| nexo.logistics.operations.view         | BASE_OR_OPERATIONAL       |
| nexo.logistics.driver_operations.view  | BASE_OR_OPERATIONAL       |
| nexo.logistics.fulfillment.view        | BASE_OR_OPERATIONAL       |
| nexo.logistics.fulfillment_routes.view | BASE_OR_OPERATIONAL       |
| nexo.logistics.supply_routes.view      | BASE_OR_OPERATIONAL       |

Estas consultas pueden ser requeridas tanto por:

coordinación administrativa;
supervisión;
trabajador operativo;
conductor;
despacho;
recepción.

La modalidad no concede acceso a todas las sedes.

El alcance se definirá en AUTH-CAT-011.

12.10 Finanzas internas

| Permiso canónico                           | authorization_requirement |
| ------------------------------------------ | ------------------------- |
| nexo.finance.internal_invoices.view        | BASE_ONLY                 |
| nexo.finance.internal_invoices.generate    | BASE_ONLY                 |
| nexo.finance.internal_invoices.issue       | BASE_ONLY                 |
| nexo.finance.internal_invoices.cancel      | BASE_ONLY                 |
| nexo.finance.internal_invoice_amounts.view | BASE_ONLY                 |
| nexo.finance.internal_prices.view          | BASE_ONLY                 |
| nexo.finance.internal_variances.view       | BASE_ONLY                 |
| nexo.finance.internal_variances.approve    | BASE_AND_OPERATIONAL      |
| nexo.finance.internal_variances.resolve    | BASE_AND_OPERATIONAL      |
| nexo.finance.cost_centers.view             | BASE_ONLY                 |

Las facturas, precios, importes y centros de costo pertenecen al carril base.

Aprobar o resolver una variación interna exige:

autoridad administrativa
+
contexto operativo sobre la operación afectada

Por tanto:

BASE_AND_OPERATIONAL

La aprobación no podrá realizarse únicamente porque el trabajador esté en turno.

La operación tampoco podrá completarse únicamente por tener un cargo administrativo desconectado del contexto afectado.

12.11 Analítica

| Permiso canónico                     | authorization_requirement |
| ------------------------------------ | ------------------------- |
| nexo.analytics.internal_reports.view | BASE_ONLY                 |
| nexo.analytics.margin_reports.view   | BASE_ONLY                 |

Los reportes internos y de margen son capacidades base.

No se habilitarán automáticamente mediante un rol operativo.

12.12 Impresión

| Permiso canónico               | authorization_requirement |
| ------------------------------ | ------------------------- |
| nexo.printing.templates.update | BASE_ONLY                 |
| nexo.printing.jobs.view        | BASE_OR_OPERATIONAL       |

Modificar plantillas es configuración base.

Consultar trabajos de impresión puede ser necesario para:

administración;
diagnóstico;
ejecución operativa de etiquetas o documentos.
12.13 Configuración

| Permiso canónico                      | authorization_requirement |
| ------------------------------------- | ------------------------- |
| nexo.settings.sites.view              | BASE_ONLY                 |
| nexo.settings.remission_policies.view | BASE_ONLY                 |

La configuración se consulta mediante el carril base.

Esto no impide que la aplicación utilice internamente datos de configuración durante una operación.

El trabajador operativo no necesita obtener el permiso de configuración para que el sistema aplique las reglas configuradas.

#### 13. Clasificación canónica — NUMERA

| Permiso canónico                        | authorization_requirement |
| --------------------------------------- | ------------------------- |
| numera.access                           | BASE_ONLY                 |
| numera.finance.cost_centers.view        | BASE_ONLY                 |
| numera.finance.expenses.view            | BASE_ONLY                 |
| numera.analytics.break_even.view        | BASE_ONLY                 |
| numera.analytics.profitability.view     | BASE_ONLY                 |
| numera.analytics.financial_reports.view | BASE_ONLY                 |

El catálogo canónico actual de NUMERA contiene exclusivamente capacidades financieras y analíticas base.

Que NUMERA esté clasificada como aplicación híbrida no transforma estas capacidades en operativas.

Si en el futuro NUMERA incorpora operaciones sujetas a turno, deberán crearse y clasificarse sus permisos específicos.

Cualquier cambio de modalidad de numera.access deberá realizarse como cambio contractual explícito y versionado.

#### 14. Clasificación canónica — ORIGO

| Permiso canónico                       | authorization_requirement |
| -------------------------------------- | ------------------------- |
| origo.access                           | BASE_OR_OPERATIONAL       |
| origo.procurement.purchase_orders.view | BASE_OR_OPERATIONAL       |
| origo.procurement.receipts.view        | BASE_OR_OPERATIONAL       |
| origo.procurement.suppliers.view       | BASE_OR_OPERATIONAL       |
| origo.catalog.product_reviews.view     | BASE_ONLY                 |

ORIGO combina:

administración de compras;
consulta de órdenes;
consulta de proveedores;
recepción física;
revisión del maestro de productos.

Las órdenes, recepciones y proveedores pueden necesitarse desde:

compras y administración
→ base

recepción operativa
→ operacional

La revisión del maestro de productos continúa siendo una capacidad base.

Esta tarea no crea todavía permisos para:

registrar recepciones;
aprobar órdenes;
revertir entradas;
crear proveedores;
actualizar proveedores.

Esas capacidades deberán definirse durante la descomposición correspondiente.

#### 15. Clasificación canónica — Vento Pass

| Permiso canónico | authorization_requirement |
| ---------------- | ------------------------- |
| pass.access      | BASE_ONLY                 |

Este permiso representa únicamente una superficie laboral o administrativa identificada como Vento Pass.

No autoriza el acceso normal del cliente.

pass.access
≠
identidad del cliente
≠
sesión del cliente
≠
autorización de fidelización

Las operaciones de caja relacionadas con puntos deberán pertenecer a permisos laborales específicos, previsiblemente dentro de PULSO u otra aplicación propietaria.

#### 16. Clasificación canónica — PULSO

| Permiso canónico                   | authorization_requirement |
| ---------------------------------- | ------------------------- |
| pulso.access                       | OPERATIONAL_ONLY          |
| pulso.delivery.deliveries.override | BASE_AND_OPERATIONAL      |

Acceso a PULSO

PULSO representa ejecución operativa de:

ventas;
órdenes;
pagos;
caja;
entregas;
fidelización en punto de venta.

Su superficie operativa requiere un contexto de trabajo válido.

pulso.access
→ OPERATIONAL_ONLY
Confirmar entregas de forma excepcional

La acción excepcional requiere simultáneamente:

autoridad explícita para utilizar la excepción
+
participación operativa en la entrega afectada

Por tanto:

BASE_AND_OPERATIONAL

El permiso amplio legacy:

pulso.pos.main

no participa en esta clasificación y permanece pendiente de descomposición.

#### 17. Clasificación canónica — VISO

| Permiso canónico                            | authorization_requirement |
| ------------------------------------------- | ------------------------- |
| viso.access                                 | BASE_ONLY                 |
| viso.platform.app_updates.view              | BASE_ONLY                 |
| viso.organization.businesses.view           | BASE_ONLY                 |
| viso.workforce.employees.view               | BASE_ONLY                 |
| viso.workforce.staff_calendar.view          | BASE_ONLY                 |
| viso.workforce.schedules.view               | BASE_ONLY                 |
| viso.workforce.vacancies.view               | BASE_ONLY                 |
| viso.authorization.context_simulations.view | BASE_ONLY                 |
| viso.authorization.audit_logs.view          | BASE_ONLY                 |
| viso.catalog.commercial_categories.view     | BASE_ONLY                 |
| viso.content.content_blocks.view            | BASE_ONLY                 |
| viso.content.menu.view                      | BASE_ONLY                 |
| viso.content.website_content.view           | BASE_ONLY                 |
| viso.finance.accounting.view                | BASE_ONLY                 |
| viso.delivery.rates.view                    | BASE_ONLY                 |
| viso.loyalty.products.view                  | BASE_ONLY                 |
| viso.loyalty.customers.view                 | BASE_ONLY                 |

VISO administra y consulta información organizacional.

Sus capacidades no dependen del turno operativo del administrador.

Esto no significa acceso global.

El alcance de cada permiso deberá limitar posteriormente:

empresas;
sedes;
áreas;
trabajadores;
recursos;
datos financieros;
registros de auditoría.

#### 18. Resultado general

Clasificación de los 112 permisos canónicos:

| Modalidad            | Permisos |
| -------------------- | -------- |
| BASE_ONLY            | 54       |
| OPERATIONAL_ONLY     | 13       |
| BASE_OR_OPERATIONAL  | 40       |
| BASE_AND_OPERATIONAL | 5        |
| Total                | 112      |

Distribución por aplicación:

| Aplicación | Base | Operativo | Base u operativo | Base y operativo | Total |
| ---------- | ---- | --------- | ---------------- | ---------------- | ----- |
| SHELL      | 1    | 0         | 0                | 0                | 1     |
| ANIMA      | 10   | 0         | 0                | 0                | 10    |
| AURA       | 1    | 0         | 0                | 0                | 1     |
| FOGO       | 1    | 2         | 3                | 0                | 6     |
| NEXO       | 16   | 10        | 33               | 4                | 63    |
| NUMERA     | 6    | 0         | 0                | 0                | 6     |
| ORIGO      | 1    | 0         | 4                | 0                | 5     |
| PASS       | 1    | 0         | 0                | 0                | 1     |
| PULSO      | 0    | 1         | 0                | 1                | 2     |
| VISO       | 17   | 0         | 0                | 0                | 17    |
| Total      | 54   | 13        | 40               | 5                | 112   |

#### 19. Permisos legacy amplios

Los siguientes 21 permisos permanecen pendientes de descomposición:

FOGO
fogo.production.recipes.manage
NEXO
nexo.settings.categories.manage
nexo.settings.units.manage
nexo.settings.supply_routes.manage
nexo.internal_prices.manage
nexo.cost_centers.manage
nexo.settings.sites.manage
nexo.settings.remissions.manage
NUMERA
numera.cost_centers.manage
numera.expenses.manage
ORIGO
origo.suppliers.manage
PULSO
pulso.pos.main
VISO
viso.app_navigation.manage
viso.employee_operational_profiles.manage
viso.menu.images.manage
viso.operational_points.manage
viso.site_operational_roles.manage
viso.staff.documents.manage
viso.staff.employee_photos.manage
viso.staff.manage
viso.staff.permissions.manage

Estos permisos tendrán:

authorization_requirement = null
assignment_status = blocked
catalog_status = deprecated

Motivo:

Un permiso amplio no puede recibir una modalidad segura mientras no se conozca qué acciones atómicas contiene.

Ejemplo:

viso.staff.manage

podría incluir:

view
create
update
activate
deactivate
delete

Cada capacidad resultante podrá tener una modalidad diferente.

No se asignará una única modalidad al permiso amplio.

#### 20. Permisos técnicos retirados

Los siguientes 14 códigos no representan capacidades empresariales:

NEXO
nexo.code.view
nexo.edit.view
nexo.login.view
nexo.new.view
nexo.no_access.view
nexo.open.view
nexo.page_tsx.view
nexo.quick.view
nexo.scanner.view
nexo.settings.view
nexo.setup.view
nexo.slug.view
ORIGO
origo.login.view
origo.no_access.view

Estos registros tendrán conceptualmente:

authorization_requirement = null
assignable = false
catalog_status = retired_technical

No se les asignará una modalidad porque:

NO SON PERMISOS

La pantalla, ruta o herramienta correspondiente deberá consumir el permiso funcional de la operación real.

Ejemplo:

nexo.scanner.view
→ retirado

El escáner utilizará:

nexo.inventory.remissions.receive
nexo.inventory.withdrawals.register
nexo.inventory.lpns.view

según la operación ejecutada.

#### 21. Aliases legacy

Un alias no tendrá una modalidad independiente.

Ejemplo:

nexo.stock.view
→ nexo.inventory.stock.view

La modalidad será:

nexo.inventory.stock.view
→ BASE_OR_OPERATIONAL

Regla:

ALIAS
→ HEREDA authorization_requirement
  DE SU CLAVE CANÓNICA

Se prohíbe:

modificar la modalidad desde el alias;
asignar el alias como capacidad nueva;
mantener evaluación doble;
crear aliases con modalidad diferente;
utilizar el alias para ampliar acceso.

#### 22. Compatibilidad de matrices

22.1 BASE_ONLY

Asignaciones admitidas:

role_permissions
employee_permissions base

Asignaciones incompatibles:

operational_role_permissions
employee_permissions operativas
22.2 OPERATIONAL_ONLY

Asignaciones admitidas:

operational_role_permissions
employee_permissions operativas

Asignaciones incompatibles:

role_permissions
employee_permissions base
22.3 BASE_OR_OPERATIONAL

Asignaciones admitidas en ambos carriles.

Cada asignación conserva:

su alcance;
su vigencia;
sus denegaciones;
sus restricciones;
su decisión independiente.
22.4 BASE_AND_OPERATIONAL

Debe existir una autorización válida en cada carril.

Una asignación en un solo carril no es suficiente.

No se exigirá que las dos concesiones provengan del mismo tipo de sujeto.

Ejemplo válido:

rol base
→ concede autoridad administrativa

excepción operativa individual
→ concede capacidad operativa

Siempre que ambas decisiones sean válidas para el mismo actor efectivo, recurso y solicitud.

#### 23. Configuraciones incompatibles

Una asignación almacenada en un carril incompatible será:

incompatible_authorization_lane

No será interpretada como:

fallback;
bypass;
concesión adicional;
excepción automática;
compatibilidad legacy.

Ejemplo:

nexo.inventory.remissions.prepare
→ OPERATIONAL_ONLY

role_permissions
→ contiene allow para el rol base cocinero

Resultado:

CONFIGURACIÓN LEGACY INCOMPATIBLE
NO AUTORIZA

La futura migración deberá identificar, reportar y retirar esas asignaciones de manera controlada.

#### 24. Relación con denegaciones

La modalidad selecciona qué carriles participan.

Después se aplican las reglas aprobadas de denegación.

Precedencia:

STRUCTURAL_DENY
>
ACTOR_WIDE_DENY
>
MATCHING_LANE_DENY
>
MATCHING_LANE_ALLOW
>
DEFAULT_DENY
BASE_ONLY

Solo se evalúa el carril base.

OPERATIONAL_ONLY

Solo se evalúa el carril operativo.

BASE_OR_OPERATIONAL

Una denegación limitada a un carril no destruye automáticamente una concesión válida del otro carril.

BASE_DENY + OPERATIONAL_ALLOW
→ ALLOW por operación

BASE_ALLOW + OPERATIONAL_DENY
→ ALLOW por base

Una denegación transversal aplicable produce DENY final.

BASE_AND_OPERATIONAL

Una denegación o ausencia de autorización en cualquiera de los carriles produce DENY final.

#### 25. Relación con turno y check-in

AUTH-CAT-006 no define todavía:

requires_shift
requires_checkin
requires_active_area

La modalidad indica qué carril puede autorizar.

No define por sí sola todos sus prerrequisitos.

Ejemplo:

OPERATIONAL_ONLY

significa que el carril operativo es obligatorio.

La política exacta podrá exigir:

turno;
check-in;
sesión de actor;
área;
coincidencia territorial;
dispositivo autorizado.

Esto se definirá en:

AUTH-CAT-012
AUTH-CAT-013
AUTH-CAT-014

#### 26. Relación con alcance

La modalidad no define el alcance.

Ejemplo:

nexo.inventory.stock.view
→ BASE_OR_OPERATIONAL

Podrá tener:

carril base
→ sedes asignadas

carril operativo
→ sede operativa activa

No se convierte por ello en:

global

El alcance admitido de cada permiso se definirá en AUTH-CAT-011.

#### 27. Relación con recursos

La modalidad tampoco determina sobre qué recurso se ejecuta la acción.

Ejemplo:

nexo.inventory.remissions.receive
→ OPERATIONAL_ONLY

La decisión todavía deberá resolver desde la remisión:

sede de origen;
sede de destino;
área correspondiente;
estado actual;
actor;
rol operativo;
contexto activo.

El contrato de recursos se definirá en AUTH-CAT-016.

#### 28. Relación con dispositivos compartidos

El dispositivo no cambia la modalidad del permiso.

Ejemplo:

pulso.access
→ OPERATIONAL_ONLY

En una caja compartida continuará requiriendo:

actor efectivo
+
contexto operativo
+
permiso compatible
+
capacidad permitida por el dispositivo

No se convierte en BASE_ONLY porque el dispositivo tenga una identidad técnica autenticada.

#### 29. Relación con simulación

La simulación utilizará el mismo:

authorization_requirement

No se crearán modalidades como:

SIMULATION_ONLY
BASE_OR_SIMULATION

La simulación evalúa hipotéticamente los carriles, pero nunca concede autorización real.

#### 30. Cómo se verá en VISO

Ejemplo BASE_ONLY:

Consultar trabajadores
viso.workforce.employees.view

Modalidad:
Solo autorización base

Carril base:
Permitido

Carril operativo:
No compatible

Ejemplo OPERATIONAL_ONLY:

Preparar remisiones
nexo.inventory.remissions.prepare

Modalidad:
Solo autorización operativa

Carril base:
No compatible

Carril operativo:
Permitido

Ejemplo BASE_OR_OPERATIONAL:

Consultar stock
nexo.inventory.stock.view

Modalidad:
Base u operativa

Resultado requerido:
Al menos un carril autorizado

Ejemplo BASE_AND_OPERATIONAL:

Registrar entradas excepcionales
nexo.inventory.entries.override

Modalidad:
Base y operativa

Resultado requerido:
Ambos carriles autorizados

La interfaz no deberá presentar únicamente los códigos:

BASE_ONLY
OPERATIONAL_ONLY
BASE_OR_OPERATIONAL
BASE_AND_OPERATIONAL

Deberá acompañarlos con una explicación humana.

#### 31. Validaciones futuras obligatorias

Todo permiso canónico activo deberá cumplir:

authorization_requirement no nulo
authorization_requirement dentro del enum aprobado
una única modalidad activa
modalidad versionada
matrices compatibles
aliases sin modalidad independiente
permisos técnicos sin modalidad
permisos amplios sin modalidad hasta descomponerse

La implementación deberá detectar:

authorization_requirement_missing
authorization_requirement_invalid
incompatible_authorization_lane
legacy_permission_not_assignable
retired_permission_not_assignable
alias_assignment_not_allowed
base_lane_required
operational_lane_required
both_lanes_required

#### 32. Cambios futuros de modalidad

Cambiar la modalidad de un permiso activo constituye un cambio contractual.

Ejemplo:

BASE_OR_OPERATIONAL
→ OPERATIONAL_ONLY

puede retirar acceso previamente disponible.

Ejemplo:

OPERATIONAL_ONLY
→ BASE_OR_OPERATIONAL

puede ampliar acceso sin turno.

Por tanto, cualquier cambio futuro requerirá:

decisión documental explícita;
nueva versión del catálogo;
análisis de matrices afectadas;
análisis de denegaciones;
migración versionada;
pruebas contractuales;
auditoría del cambio;
plan de compatibilidad.

No se permitirá modificar la modalidad silenciosamente desde VISO.

#### 33. Riesgos controlados

Riesgo 1 — Deducir modalidad por aplicación

Control:

clasificación individual por permiso
Riesgo 2 — Mantener permisos operativos en roles base legacy

Control:

asignación incompatible no autoriza
Riesgo 3 — Usar BASE_OR_OPERATIONAL como valor predeterminado

Control:

null
→ denegar
Riesgo 4 — Permitir acciones excepcionales solo por estar en turno

Control:

BASE_AND_OPERATIONAL
Riesgo 5 — Exigir turno para funciones administrativas

Control:

BASE_ONLY
Riesgo 6 — Bloquear consultas legítimas de supervisión

Control:

BASE_OR_OPERATIONAL

cuando ambos contextos son empresarialmente válidos.

Riesgo 7 — Asignar modalidad a permisos amplios

Control:

DECOMPOSE_REQUIRED
→ sin modalidad
Riesgo 8 — Mantener permisos técnicos asignables

Control:

RETIRE_TECHNICAL
→ sin modalidad
→ no asignable
Riesgo 9 — Cambiar modalidad mediante un alias

Control:

alias hereda la clave canónica
Riesgo 10 — Confundir modalidad con alcance o sensibilidad

Control:

propiedades independientes

#### 34. Fuera del alcance

AUTH-CAT-006 no define:

qué permisos son operativos como clasificación funcional;
qué permisos son de solo lectura;
qué permisos son de configuración;
qué permisos son sensibles;
qué alcances admite cada permiso;
qué permisos requieren turno;
qué permisos requieren check-in;
qué permisos requieren área activa;
qué permisos admiten dispositivo compartido;
qué permisos admiten simulación;
cómo se resuelve el recurso;
qué roles reciben cada permiso;
qué excepciones individuales existirán;
qué asignaciones actuales deben migrarse;
tablas o columnas físicas;
funciones de autorización;
contratos TypeScript;
migraciones;
cambios de frontend.

Estos temas corresponden a:

AUTH-CAT-007 a AUTH-CAT-019
BLOQUE D
BLOQUE E
fases de implementación

#### 35. Invariantes

Todo permiso canónico activo declara una modalidad.
Solo existen cuatro modalidades.
La modalidad pertenece al permiso, no al rol.
La modalidad pertenece al permiso, no a la aplicación.
La modalidad no se deduce de la tabla de asignación.
BASE_ONLY nunca se autoriza mediante el carril operativo.
OPERATIONAL_ONLY nunca se autoriza mediante el carril base.
BASE_OR_OPERATIONAL exige al menos un carril completamente válido.
BASE_AND_OPERATIONAL exige ambos carriles completamente válidos.
Un permiso base no crea contexto operativo.
Un permiso operativo no crea turno ni check-in.
Un turno no desactiva permisos base válidos.
El fin del turno revoca el carril operativo, no el carril base.
Una asignación incompatible no autoriza.
La ausencia de modalidad produce denegación.
No existe modalidad predeterminada permisiva.
Los permisos de acceso a aplicaciones también declaran modalidad.
app.access no concede todas las capacidades de la aplicación.
Los aliases heredan la modalidad canónica.
Los aliases no amplían modalidades.
Los permisos legacy amplios no reciben modalidad.
Los permisos técnicos retirados no reciben modalidad.
La modalidad no determina alcance.
La modalidad no determina sensibilidad.
La modalidad no determina el requisito exacto de turno.
La modalidad no determina el requisito exacto de check-in.
La modalidad no determina el recurso.
El dispositivo no cambia la modalidad.
La simulación no cambia la modalidad.
Un cambio de modalidad es un cambio contractual versionado.

#### 36. Criterios de aprobación

Los criterios de aprobación de esta tarea fueron aceptados íntegramente
durante su revisión y quedan respaldados por sus invariantes,
resultado esperado y decisión final.

#### 37. Decisión final

PERMISSION_KEY
→ DECLARA QUÉ CAPACIDAD SE SOLICITA

AUTHORIZATION_REQUIREMENT
→ DECLARA QUÉ CARRIL O CARRILES
  PUEDEN AUTORIZARLA

Modalidades:

BASE_ONLY
→ SOLO CARRIL BASE

OPERATIONAL_ONLY
→ SOLO CARRIL OPERATIVO

BASE_OR_OPERATIONAL
→ CUALQUIERA DE LOS DOS CARRILES

BASE_AND_OPERATIONAL
→ LOS DOS CARRILES OBLIGATORIOS

Regla principal:

LA TABLA NO DEFINE LA MODALIDAD

EL ROL NO DEFINE LA MODALIDAD

LA APLICACIÓN NO DEFINE LA MODALIDAD

EL TURNO NO DEFINE LA MODALIDAD

EL CATÁLOGO CANÓNICO DEL PERMISO
DEFINE LA MODALIDAD

Estado:

AUTH-CAT-001
→ APROBADA

AUTH-CAT-002
→ APROBADA

AUTH-CAT-003
→ APROBADA

AUTH-CAT-004
→ APROBADA

AUTH-CAT-005
→ APROBADA

AUTH-CAT-006
→ APROBADA

### ✅ AUTH-CAT-007 — Clasificar permisos operativos

#### 1. Estado de continuidad

Última tarea aprobada:

AUTH-CAT-006
Definir authorization_requirement de cada permiso

Tarea actual:

AUTH-CAT-007
Clasificar permisos operativos

Siguiente tarea después de aprobación:

AUTH-CAT-008
Clasificar permisos de solo lectura

Estado de implementación:

DEFINICIÓN DOCUMENTAL

No se realizan:

cambios en Supabase;
migraciones;
modificaciones de app_permissions;
modificaciones de matrices;
cambios en RLS;
cambios en RPC;
cambios en aplicaciones;
cambios en vento-shell;
asignaciones a roles;
implementación de guards.

Toda futura migración deberá crearse y documentarse en vento-shell.

#### 2. Problema que se resuelve

El catálogo actual ya contiene o ha contenido propiedades como:

is_operational
requires_active_work_context
permission_audience
authorization_requirement

Sin embargo, estos conceptos no tienen actualmente una relación canónica suficientemente estricta.

Esto permite interpretaciones incompatibles:

is_operational = true
→ siempre requiere turno
aplicación operativa
→ todos sus permisos son operativos
permiso de lectura
→ no es operativo
permiso asignado a operational_role_permissions
→ se convierte automáticamente en operativo
permiso asignado a un rol base
→ deja de ser operativo
BASE_OR_OPERATIONAL
→ no puede clasificarse como operativo

Estas interpretaciones quedan prohibidas.

#### 3. Objetivo

Clasificar los 112 permisos canónicos activos mediante la propiedad:

is_operational

Valores admitidos para permisos canónicos activos:

true
false

La propiedad responde exclusivamente:

¿Esta capacidad puede participar
en una autorización mediante
el carril operativo?

No responde:

si el permiso es de lectura;
si modifica datos;
si es sensible;
si es de configuración;
si requiere siempre turno;
si requiere siempre check-in;
si requiere área;
si admite dispositivo compartido;
si admite simulación;
si es global;
qué roles lo reciben;
en qué sedes se concede.

#### 4. Definición canónica

4.1 Permiso operativo

Un permiso se clasifica como operativo cuando su contrato permite o exige que la capacidad sea autorizada mediante el carril operativo.

is_operational = true

Esto incluye permisos con:

OPERATIONAL_ONLY
BASE_OR_OPERATIONAL
BASE_AND_OPERATIONAL
4.2 Permiso no operativo

Un permiso se clasifica como no operativo cuando únicamente puede autorizarse mediante el carril base.

is_operational = false

Esto corresponde a:

BASE_ONLY

#### 5. Regla derivada obligatoria

is_operational no será una decisión independiente de authorization_requirement.

Será una propiedad derivada.

authorization_requirement = BASE_ONLY
→ is_operational = false
authorization_requirement = OPERATIONAL_ONLY
→ is_operational = true
authorization_requirement = BASE_OR_OPERATIONAL
→ is_operational = true
authorization_requirement = BASE_AND_OPERATIONAL
→ is_operational = true

Tabla canónica:

| authorization_requirement | is_operational                  |
| ------------------------- | ------------------------------- |
| BASE_ONLY                 | false                           |
| OPERATIONAL_ONLY          | true                            |
| BASE_OR_OPERATIONAL       | true                            |
| BASE_AND_OPERATIONAL      | true                            |
| null                      | null / configuración incompleta |

Regla principal:

IS_OPERATIONAL
SE DERIVA DE
AUTHORIZATION_REQUIREMENT

No se permitirán combinaciones contradictorias.

#### 6. Configuraciones inválidas

Las siguientes combinaciones serán inválidas:

BASE_ONLY
+
is_operational = true
OPERATIONAL_ONLY
+
is_operational = false
BASE_OR_OPERATIONAL
+
is_operational = false
BASE_AND_OPERATIONAL
+
is_operational = false

Código conceptual:

operational_classification_mismatch

Una configuración contradictoria no se resolverá eligiendo el valor más permisivo.

Resultado:

DENEGAR
+
REPORTAR CONFIGURACIÓN INVÁLIDA

#### 7. Diferencia entre permiso operativo y contexto obligatorio

La clasificación operativa no significa automáticamente:

requiere turno en todos los casos

Ejemplo:

nexo.inventory.stock.view

authorization_requirement:
BASE_OR_OPERATIONAL

is_operational:
true

Puede autorizarse:

Gerente
→ carril base
→ sin turno operativo

o:

Bodeguero
→ carril operativo
→ con contexto operativo válido

Por tanto:

is_operational = true
≠
requires_active_work_context = always

La política exacta de:

turno;
check-in;
sede activa;
área activa;
actor operativo;
dispositivo;

se definirá en:

AUTH-CAT-012
AUTH-CAT-013
AUTH-CAT-014

#### 8. Diferencia entre clasificación y asignación

Un permiso no se convierte en operativo porque aparezca en:

operational_role_permissions

La relación correcta será:

CATÁLOGO
→ declara is_operational

MATRIZ OPERATIVA
→ solo puede asignar permisos
  con is_operational = true

No:

MATRIZ OPERATIVA
→ decide si el permiso es operativo

Una asignación operativa de un permiso con:

is_operational = false

será incompatible y no concederá acceso.

Código conceptual:

non_operational_permission_in_operational_lane

#### 9. Diferencia entre permiso operativo y aplicación operativa

El tipo de aplicación no determina la clasificación de cada permiso.

Ejemplo:

FOGO
→ aplicación operativa

Pero:

fogo.production.recipes.view
→ BASE_ONLY
→ is_operational = false

También:

ORIGO
→ aplicación híbrida

Pero:

origo.procurement.receipts.view
→ BASE_OR_OPERATIONAL
→ is_operational = true

Y:

NUMERA
→ aplicación híbrida

Sin embargo, todos sus permisos canónicos actuales son:

BASE_ONLY
→ is_operational = false

Regla:

APP_KIND
NO DEFINE
IS_OPERATIONAL

#### 10. Diferencia entre permiso operativo y mutación

Un permiso de lectura puede ser operativo.

Ejemplo:

nexo.inventory.stock.view
→ consulta
→ operativo

Un permiso de modificación puede no ser operativo.

Ejemplo:

nexo.printing.templates.update
→ modificación
→ no operativo

Por tanto:

view
≠ no operativo
create / update / cancel
≠ operativo automáticamente

La clasificación de solo lectura se definirá separadamente en:

AUTH-CAT-008

#### 11. Diferencia entre permiso operativo y configuración

Un permiso operativo puede consultar configuración necesaria para ejecutar una operación, sin recibir autoridad para modificar dicha configuración.

Ejemplo:

nexo.catalog.request_policies.view
→ is_operational = true
nexo.settings.remission_policies.view
→ is_operational = false

El primero permite conocer las reglas necesarias durante la operación.

El segundo representa acceso a la superficie administrativa de configuración.

La clasificación formal de configuración se definirá en:

AUTH-CAT-009

#### 12. Diferencia entre permiso operativo y sensibilidad

Un permiso operativo puede ser ordinario o sensible.

Ejemplos conceptuales:

nexo.inventory.stock.view
→ operativo
→ consulta ordinaria
nexo.inventory.entries.override
→ operativo
→ acción excepcional

is_operational no determina sensibilidad.

La clasificación de sensibilidad corresponde a:

AUTH-CAT-010

#### 13. Resultado general

Permisos canónicos activos:

112

Clasificación:

| Clasificación          | Cantidad |
| ---------------------- | -------- |
| is_operational = true  | 58       |
| is_operational = false | 54       |
| Total                  | 112      |

Relación con AUTH-CAT-006:

| Modalidad            | Cantidad | is_operational |
| -------------------- | -------- | -------------- |
| BASE_ONLY            | 54       | false          |
| OPERATIONAL_ONLY     | 13       | true           |
| BASE_OR_OPERATIONAL  | 40       | true           |
| BASE_AND_OPERATIONAL | 5        | true           |
| Total                | 112      | —              |

#### 14. Distribución por aplicación

| Aplicación | Operativos | No operativos | Total |
| ---------- | ---------- | ------------- | ----- |
| SHELL      | 0          | 1             | 1     |
| ANIMA      | 0          | 10            | 10    |
| AURA       | 0          | 1             | 1     |
| FOGO       | 5          | 1             | 6     |
| NEXO       | 47         | 16            | 63    |
| NUMERA     | 0          | 6             | 6     |
| ORIGO      | 4          | 1             | 5     |
| PASS       | 0          | 1             | 1     |
| PULSO      | 2          | 0             | 2     |
| VISO       | 0          | 17            | 17    |
| Total      | 58         | 54            | 112   |

#### 15. Permisos operativos — FOGO

Los siguientes permisos tendrán:

is_operational = true

| Permiso                          | Modalidad           |
| -------------------------------- | ------------------- |
| fogo.access                      | BASE_OR_OPERATIONAL |
| fogo.production.batches.view     | BASE_OR_OPERATIONAL |
| fogo.production.batches.create   | OPERATIONAL_ONLY    |
| fogo.production.orders.view      | BASE_OR_OPERATIONAL |
| fogo.production.recipe_book.view | OPERATIONAL_ONLY    |

Total FOGO operativo:

5
15.1 Interpretación

FOGO admite:

consulta administrativa de lotes y órdenes;
consulta operativa durante producción;
creación operativa de lotes;
consulta del recetario durante la ejecución.

No toda capacidad de FOGO es operativa.

#### 16. Permisos operativos — NEXO

Los siguientes permisos tendrán:

is_operational = true
16.1 Acceso y catálogo

| Permiso                            | Modalidad           |
| ---------------------------------- | ------------------- |
| nexo.access                        | BASE_OR_OPERATIONAL |
| nexo.catalog.products.view         | BASE_OR_OPERATIONAL |
| nexo.catalog.presentations.view    | BASE_OR_OPERATIONAL |
| nexo.catalog.request_policies.view | BASE_OR_OPERATIONAL |
| nexo.catalog.categories.view       | BASE_OR_OPERATIONAL |
| nexo.catalog.units.view            | BASE_OR_OPERATIONAL |

Subtotal:

6
16.2 Activos

| Permiso                 | Modalidad           |
| ----------------------- | ------------------- |
| nexo.assets.items.view  | BASE_OR_OPERATIONAL |
| nexo.assets.groups.view | BASE_OR_OPERATIONAL |
| nexo.assets.counts.view | BASE_OR_OPERATIONAL |

Subtotal acumulado:

9
16.3 Ajustes y entradas

| Permiso                             | Modalidad            |
| ----------------------------------- | -------------------- |
| nexo.inventory.adjustments.view     | BASE_OR_OPERATIONAL  |
| nexo.inventory.adjustments.register | BASE_AND_OPERATIONAL |
| nexo.inventory.entries.view         | BASE_OR_OPERATIONAL  |
| nexo.inventory.entries.register     | OPERATIONAL_ONLY     |
| nexo.inventory.entries.override     | BASE_AND_OPERATIONAL |

Subtotal acumulado:

14
16.4 Ubicaciones, LPN, movimientos y stock

| Permiso                                    | Modalidad           |
| ------------------------------------------ | ------------------- |
| nexo.inventory.locations.view              | BASE_OR_OPERATIONAL |
| nexo.inventory.location_assignments.assign | OPERATIONAL_ONLY    |
| nexo.inventory.lpns.view                   | BASE_OR_OPERATIONAL |
| nexo.inventory.movements.view              | BASE_OR_OPERATIONAL |
| nexo.inventory.stock.view                  | BASE_OR_OPERATIONAL |
| nexo.inventory.production_batches.view     | BASE_OR_OPERATIONAL |

Subtotal acumulado:

20
16.5 Traslados y retiros

| Permiso                             | Modalidad           |
| ----------------------------------- | ------------------- |
| nexo.inventory.transfers.view       | BASE_OR_OPERATIONAL |
| nexo.inventory.transfers.create     | OPERATIONAL_ONLY    |
| nexo.inventory.withdrawals.view     | BASE_OR_OPERATIONAL |
| nexo.inventory.withdrawals.register | OPERATIONAL_ONLY    |

Subtotal acumulado:

24
16.6 Zonas y operación de bodega

| Permiso                                  | Modalidad           |
| ---------------------------------------- | ------------------- |
| nexo.inventory.zones.view                | BASE_OR_OPERATIONAL |
| nexo.inventory.storage_positions.view    | BASE_OR_OPERATIONAL |
| nexo.inventory.warehouse_operations.view | BASE_OR_OPERATIONAL |
| nexo.inventory.stock_validations.perform | OPERATIONAL_ONLY    |

Subtotal acumulado:

28
16.7 Conteos

| Permiso                             | Modalidad           |
| ----------------------------------- | ------------------- |
| nexo.inventory.stock_counts.view    | BASE_OR_OPERATIONAL |
| nexo.inventory.stock_counts.perform | OPERATIONAL_ONLY    |
| nexo.inventory.initial_counts.view  | BASE_OR_OPERATIONAL |

Subtotal acumulado:

31
16.8 Remisiones

| Permiso                            | Modalidad           |
| ---------------------------------- | ------------------- |
| nexo.inventory.remissions.view     | BASE_OR_OPERATIONAL |
| nexo.inventory.remissions.update   | BASE_OR_OPERATIONAL |
| nexo.inventory.remissions.request  | OPERATIONAL_ONLY    |
| nexo.inventory.remissions.prepare  | OPERATIONAL_ONLY    |
| nexo.inventory.remissions.dispatch | OPERATIONAL_ONLY    |
| nexo.inventory.remissions.receive  | OPERATIONAL_ONLY    |
| nexo.inventory.remissions.cancel   | BASE_OR_OPERATIONAL |

Subtotal acumulado:

38
16.9 Logística

| Permiso                                | Modalidad           |
| -------------------------------------- | ------------------- |
| nexo.logistics.operations_board.view   | BASE_OR_OPERATIONAL |
| nexo.logistics.operations.view         | BASE_OR_OPERATIONAL |
| nexo.logistics.driver_operations.view  | BASE_OR_OPERATIONAL |
| nexo.logistics.fulfillment.view        | BASE_OR_OPERATIONAL |
| nexo.logistics.fulfillment_routes.view | BASE_OR_OPERATIONAL |
| nexo.logistics.supply_routes.view      | BASE_OR_OPERATIONAL |

Subtotal acumulado:

44
16.10 Variaciones internas

| Permiso                                 | Modalidad            |
| --------------------------------------- | -------------------- |
| nexo.finance.internal_variances.approve | BASE_AND_OPERATIONAL |
| nexo.finance.internal_variances.resolve | BASE_AND_OPERATIONAL |

Subtotal acumulado:

46
16.11 Impresión operativa

| Permiso                 | Modalidad           |
| ----------------------- | ------------------- |
| nexo.printing.jobs.view | BASE_OR_OPERATIONAL |

Total NEXO operativo:

47

#### 17. Permisos operativos — ORIGO

Los siguientes permisos tendrán:

is_operational = true

| Permiso                                | Modalidad           |
| -------------------------------------- | ------------------- |
| origo.access                           | BASE_OR_OPERATIONAL |
| origo.procurement.purchase_orders.view | BASE_OR_OPERATIONAL |
| origo.procurement.receipts.view        | BASE_OR_OPERATIONAL |
| origo.procurement.suppliers.view       | BASE_OR_OPERATIONAL |

Total ORIGO operativo:

4
17.1 Interpretación

La consulta de órdenes, recepciones y proveedores puede utilizarse desde:

compras;
administración;
recepción física;
verificación de mercancía;
operación de abastecimiento.

Esto no significa que consultar un proveedor exija siempre turno.

Significa que el permiso admite el carril operativo.

#### 18. Permisos operativos — PULSO

Los siguientes permisos tendrán:

is_operational = true

| Permiso                            | Modalidad            |
| ---------------------------------- | -------------------- |
| pulso.access                       | OPERATIONAL_ONLY     |
| pulso.delivery.deliveries.override | BASE_AND_OPERATIONAL |

Total PULSO operativo:

2
18.1 Interpretación

La entrada a PULSO pertenece a una operación activa.

La confirmación excepcional de una entrega exige:

autoridad base explícita;
contexto operativo válido.

Ambos permisos participan en el carril operativo.

#### 19. Permisos no operativos — SHELL

| Permiso      | Modalidad | is_operational |
| ------------ | --------- | -------------- |
| shell.access | BASE_ONLY | false          |

SHELL debe estar disponible antes de iniciar un contexto operativo.

#### 20. Permisos no operativos — ANIMA

| Permiso                                   | Modalidad | is_operational |
| ----------------------------------------- | --------- | -------------- |
| anima.access                              | BASE_ONLY | false          |
| anima.workforce.employee_documents.view   | BASE_ONLY | false          |
| anima.workforce.employee_documents.upload | BASE_ONLY | false          |
| anima.workforce.employee_documents.delete | BASE_ONLY | false          |
| anima.workforce.employee_photos.upload    | BASE_ONLY | false          |
| anima.workforce.team_members.view         | BASE_ONLY | false          |
| anima.workforce.staff_invitations.create  | BASE_ONLY | false          |
| anima.attendance.shifts.create            | BASE_ONLY | false          |
| anima.attendance.shifts.update            | BASE_ONLY | false          |
| anima.attendance.shifts.cancel            | BASE_ONLY | false          |

Total ANIMA no operativo:

10

ANIMA crea o cierra contexto, pero sus permisos no son permisos operativos de las aplicaciones consumidoras.

#### 21. Permisos no operativos — AURA

| Permiso     | Modalidad | is_operational |
| ----------- | --------- | -------------- |
| aura.access | BASE_ONLY | false          |

AURA continúa como aplicación administrativa de roadmap diferido.

#### 22. Permisos no operativos — FOGO

| Permiso                      | Modalidad | is_operational |
| ---------------------------- | --------- | -------------- |
| fogo.production.recipes.view | BASE_ONLY | false          |

Este permiso representa consulta administrativa o técnica de la definición estructural de recetas.

No es el permiso de recetario utilizado durante la ejecución.

#### 23. Permisos no operativos — NEXO

Los siguientes permisos tendrán:

is_operational = false
23.1 Creación de catálogo y activos

| Permiso                      | Modalidad |
| ---------------------------- | --------- |
| nexo.catalog.products.create | BASE_ONLY |
| nexo.assets.items.create     | BASE_ONLY |

23.2 Configuración de ubicaciones

| Permiso                                | Modalidad |
| -------------------------------------- | --------- |
| nexo.inventory.location_catalog.update | BASE_ONLY |

23.3 Facturación interna

| Permiso                                    | Modalidad |
| ------------------------------------------ | --------- |
| nexo.finance.internal_invoices.view        | BASE_ONLY |
| nexo.finance.internal_invoices.generate    | BASE_ONLY |
| nexo.finance.internal_invoices.issue       | BASE_ONLY |
| nexo.finance.internal_invoices.cancel      | BASE_ONLY |
| nexo.finance.internal_invoice_amounts.view | BASE_ONLY |

23.4 Precios, variaciones y centros de costo

| Permiso                              | Modalidad |
| ------------------------------------ | --------- |
| nexo.finance.internal_prices.view    | BASE_ONLY |
| nexo.finance.internal_variances.view | BASE_ONLY |
| nexo.finance.cost_centers.view       | BASE_ONLY |

23.5 Analítica

| Permiso                              | Modalidad |
| ------------------------------------ | --------- |
| nexo.analytics.internal_reports.view | BASE_ONLY |
| nexo.analytics.margin_reports.view   | BASE_ONLY |

23.6 Configuración e impresión

| Permiso                               | Modalidad |
| ------------------------------------- | --------- |
| nexo.printing.templates.update        | BASE_ONLY |
| nexo.settings.sites.view              | BASE_ONLY |
| nexo.settings.remission_policies.view | BASE_ONLY |

Total NEXO no operativo:

16

#### 24. Permisos no operativos — NUMERA

| Permiso                                 | Modalidad | is_operational |
| --------------------------------------- | --------- | -------------- |
| numera.access                           | BASE_ONLY | false          |
| numera.finance.cost_centers.view        | BASE_ONLY | false          |
| numera.finance.expenses.view            | BASE_ONLY | false          |
| numera.analytics.break_even.view        | BASE_ONLY | false          |
| numera.analytics.profitability.view     | BASE_ONLY | false          |
| numera.analytics.financial_reports.view | BASE_ONLY | false          |

Total NUMERA no operativo:

6

La clasificación híbrida de NUMERA permite que en el futuro existan capacidades operativas.

No convierte sus permisos actuales en operativos.

#### 25. Permisos no operativos — ORIGO

| Permiso                            | Modalidad | is_operational |
| ---------------------------------- | --------- | -------------- |
| origo.catalog.product_reviews.view | BASE_ONLY | false          |

La revisión del maestro de productos pertenece al carril base.

#### 26. Permisos no operativos — Vento Pass

| Permiso     | Modalidad | is_operational |
| ----------- | --------- | -------------- |
| pass.access | BASE_ONLY | false          |

pass.access no pertenece al flujo normal del cliente y tampoco representa una operación laboral sujeta a turno.

#### 27. Permisos no operativos — VISO

| Permiso                                     | Modalidad | is_operational |
| ------------------------------------------- | --------- | -------------- |
| viso.access                                 | BASE_ONLY | false          |
| viso.platform.app_updates.view              | BASE_ONLY | false          |
| viso.organization.businesses.view           | BASE_ONLY | false          |
| viso.workforce.employees.view               | BASE_ONLY | false          |
| viso.workforce.staff_calendar.view          | BASE_ONLY | false          |
| viso.workforce.schedules.view               | BASE_ONLY | false          |
| viso.workforce.vacancies.view               | BASE_ONLY | false          |
| viso.authorization.context_simulations.view | BASE_ONLY | false          |
| viso.authorization.audit_logs.view          | BASE_ONLY | false          |
| viso.catalog.commercial_categories.view     | BASE_ONLY | false          |
| viso.content.content_blocks.view            | BASE_ONLY | false          |
| viso.content.menu.view                      | BASE_ONLY | false          |
| viso.content.website_content.view           | BASE_ONLY | false          |
| viso.finance.accounting.view                | BASE_ONLY | false          |
| viso.delivery.rates.view                    | BASE_ONLY | false          |
| viso.loyalty.products.view                  | BASE_ONLY | false          |
| viso.loyalty.customers.view                 | BASE_ONLY | false          |

Total VISO no operativo:

17

#### 28. Aplicaciones sin permisos operativos actuales

Las siguientes aplicaciones tienen:

0 permisos canónicos operativos
SHELL
ANIMA
AURA
NUMERA
PASS
VISO

Esto no significa que:

nunca puedan tener permisos operativos;
no participen en procesos operativos;
no sean utilizadas durante una jornada;
no puedan consultar datos relacionados con operación.

Significa únicamente que sus permisos canónicos actuales no admiten el carril operativo.

#### 29. Permisos BASE_OR_OPERATIONAL

Los 40 permisos:

BASE_OR_OPERATIONAL

se clasifican como:

is_operational = true

Motivo:

El carril operativo puede producir una autorización completa.

Esto no elimina su compatibilidad con el carril base.

Ejemplo:

nexo.inventory.remissions.view

is_operational:
true

authorization_requirement:
BASE_OR_OPERATIONAL

En VISO no deberá mostrarse como:

Solo operativo

Deberá mostrarse como:

Uso operativo:
Sí

Modalidad:
Base u operativa

#### 30. Permisos BASE_AND_OPERATIONAL

Los cinco permisos:

BASE_AND_OPERATIONAL

se clasifican como:

is_operational = true

Permisos:

nexo.inventory.adjustments.register
nexo.inventory.entries.override
nexo.finance.internal_variances.approve
nexo.finance.internal_variances.resolve
pulso.delivery.deliveries.override

El permiso es operativo porque el carril operativo es obligatorio.

También requiere el carril base.

No deberá mostrarse como:

operativo ordinario

Sino como:

Uso operativo:
Sí

Modalidad:
Base y operativa

Condición:
Requiere ambos carriles

#### 31. Permisos OPERATIONAL_ONLY

Los 13 permisos:

OPERATIONAL_ONLY

se clasifican como:

is_operational = true

Permisos:

fogo.production.batches.create
fogo.production.recipe_book.view

nexo.inventory.entries.register
nexo.inventory.location_assignments.assign
nexo.inventory.transfers.create
nexo.inventory.withdrawals.register
nexo.inventory.stock_validations.perform
nexo.inventory.stock_counts.perform
nexo.inventory.remissions.request
nexo.inventory.remissions.prepare
nexo.inventory.remissions.dispatch
nexo.inventory.remissions.receive

pulso.access

Estos permisos no podrán obtenerse mediante el carril base.

#### 32. Permisos BASE_ONLY

Los 54 permisos:

BASE_ONLY

se clasifican como:

is_operational = false

No podrán aparecer en:

operational_role_permissions

ni en una futura matriz equivalente del carril operativo.

Una asignación operativa legacy será:

INCOMPATIBLE

No se reinterpretará como concesión base.

#### 33. Permisos legacy amplios

Los 21 permisos pendientes de descomposición no recibirán clasificación operativa definitiva.

Estado:

is_operational = null
catalog_status = deprecated
assignment_status = blocked

Motivo:

Un permiso amplio puede contener operaciones con clasificaciones diferentes.

Ejemplo:

pulso.pos.main

puede contener:

consultar órdenes
crear ventas
cobrar pagos
cerrar caja
redimir puntos

Estas capacidades no necesariamente compartirán:

modalidad;
clasificación operativa;
sensibilidad;
alcance;
prerrequisitos.

No se permitirá:

pulso.pos.main
→ is_operational = true
→ copiarlo automáticamente
  a todas las capacidades futuras

#### 34. Permisos técnicos retirados

Los 14 permisos técnicos tendrán:

is_operational = null
assignable = false
catalog_status = retired_technical

Permisos:

nexo.code.view
nexo.edit.view
nexo.login.view
nexo.new.view
nexo.no_access.view
nexo.open.view
nexo.page_tsx.view
nexo.quick.view
nexo.scanner.view
nexo.settings.view
nexo.setup.view
nexo.slug.view
origo.login.view
origo.no_access.view

No se clasificarán como:

operativos

ni como:

no operativos

porque no representan capacidades empresariales válidas.

#### 35. Aliases legacy

Los aliases no tendrán una clasificación independiente.

Ejemplo:

nexo.stock.view
→ nexo.inventory.stock.view

Clasificación:

nexo.inventory.stock.view
→ is_operational = true

El alias hereda únicamente durante la normalización de la solicitud.

No podrá almacenarse:

alias.is_operational = false
canonical.is_operational = true

Regla:

ALIAS
→ RESUELVE CLAVE CANÓNICA
→ HEREDA CLASIFICACIÓN

#### 36. Compatibilidad con matrices

36.1 Matriz operativa

Solo podrá referenciar permisos con:

is_operational = true

Compatible:

OPERATIONAL_ONLY
BASE_OR_OPERATIONAL
BASE_AND_OPERATIONAL

Incompatible:

BASE_ONLY
36.2 Matriz base

Podrá referenciar permisos cuya modalidad incluya el carril base.

Compatible:

BASE_ONLY
BASE_OR_OPERATIONAL
BASE_AND_OPERATIONAL

Incompatible:

OPERATIONAL_ONLY
36.3 Observación

Un permiso con:

is_operational = true

puede aparecer legítimamente en una matriz base cuando su modalidad sea:

BASE_OR_OPERATIONAL
BASE_AND_OPERATIONAL

Por tanto:

is_operational = true

no significa:

solo asignable a roles operativos

La compatibilidad completa la determina:

authorization_requirement

#### 37. Validación de operational_role_permissions

La futura implementación deberá impedir:

operational_role_permissions
+
permission.is_operational = false

Resultado:

RECHAZAR ASIGNACIÓN

También deberá detectar registros legacy ya existentes.

Código conceptual:

invalid_operational_permission_assignment

La migración futura deberá:

identificar asignaciones incompatibles;
resolver alias;
comparar contra la clave canónica;
revisar modalidad;
no ampliar acceso;
retirar la asignación incompatible;
registrar trazabilidad.

#### 38. Validación de role_permissions legacy

Los oficios operativos legacy todavía conservan permisos en el carril base.

Ejemplo:

rol base cocinero
+
nexo.inventory.remissions.request

Después de AUTH-CAT-006 y AUTH-CAT-007:

nexo.inventory.remissions.request
→ OPERATIONAL_ONLY
→ is_operational = true

La asignación base será incompatible.

Resultado:

NO AUTORIZA

No será necesario clasificar al rol base como “operativo” para conservar el acceso.

El permiso deberá concederse al rol operativo correcto.

#### 39. is_operational no autoriza

La propiedad:

is_operational = true

no concede ninguna capacidad.

Solo declara compatibilidad contractual con el carril operativo.

Para autorizar siguen siendo necesarios:

actor válido
+
empleado activo
+
permiso activo
+
modalidad
+
contexto requerido
+
rol operativo
+
asignación compatible
+
alcance
+
recurso
+
allow aplicable
+
sin deny superior

Regla:

CLASSIFICATION
≠
ASSIGNMENT
≠
AUTHORIZATION

#### 40. is_operational no crea contexto

Un permiso operativo no crea automáticamente:

active_shift
active_checkin
active_operational_role
active_site
active_area
actor_session

Ejemplo:

operational_role_permissions
→ concede prepare

pero:

sin turno válido
→ no existe carril operativo efectivo

Resultado:

DENY

#### 41. Contexto no crea permiso

La regla inversa también aplica.

turno válido
+
check-in activo
+
rol operativo válido

no concede automáticamente todos los permisos operativos.

Debe existir:

allow operativo compatible

Regla:

CONTEXTO OPERATIVO
≠
PERMISO OPERATIVO

#### 42. Cómo se verá en VISO

42.1 Permiso no operativo
Consultar trabajadores
viso.workforce.employees.view

Uso operativo
○ No

Modalidad
Solo autorización base

Asignable a roles operativos
No
42.2 Permiso exclusivamente operativo
Preparar remisiones
nexo.inventory.remissions.prepare

Uso operativo
● Sí

Modalidad
Solo autorización operativa

Asignable a roles base
No
42.3 Permiso base u operativo
Consultar stock
nexo.inventory.stock.view

Uso operativo
● Sí

Modalidad
Base u operativa

Asignable a roles base
Sí

Asignable a roles operativos
Sí
42.4 Permiso base y operativo
Registrar ajustes de inventario
nexo.inventory.adjustments.register

Uso operativo
● Sí

Modalidad
Base y operativa

Resultado requerido
Ambos carriles autorizados

#### 43. Edición en VISO

is_operational no deberá editarse manualmente como un selector independiente.

Representación esperada:

Modalidad de autorización
[ Base u operativa ]

Uso operativo
Sí
Calculado automáticamente

No:

Modalidad
[ Base solamente ]

Uso operativo
[ Sí ]

La interfaz deberá impedir contradicciones.

#### 44. Filtros administrativos

VISO podrá filtrar el catálogo por:

Todos
Operativos
No operativos
Solo operativos
Base u operativos
Base y operativos

Interpretación:

Operativos
→ is_operational = true
No operativos
→ is_operational = false
Solo operativos
→ authorization_requirement = OPERATIONAL_ONLY
Base u operativos
→ authorization_requirement = BASE_OR_OPERATIONAL
Base y operativos
→ authorization_requirement = BASE_AND_OPERATIONAL

#### 45. Uso en navegación

Una ruta operativa podrá filtrar permisos compatibles con operación.

Pero no deberá autorizar únicamente mediante:

permission.is_operational = true

La autorización deberá utilizar:

authorization_requirement
+
decisión de carriles

is_operational podrá utilizarse para:

clasificación;
filtros;
validación de matrices;
diagnóstico;
presentación;
auditoría;
construcción de catálogos.

No será suficiente como guard.

#### 46. Uso en contratos compartidos

El futuro catálogo versionado podrá exponer:

PermissionDefinition
├── permission_key
├── authorization_requirement
├── is_operational
├── is_read_only
├── is_configuration
├── is_sensitive
├── allowed_scopes
├── work_context_requirements
├── area_requirements
├── shared_device_policy
├── simulation_policy
└── resource_contract

is_operational deberá generarse desde:

authorization_requirement

No se mantendrá como una segunda fuente de verdad editable.

#### 47. Compatibilidad con requires_active_work_context

El campo legacy:

requires_active_work_context

no se considerará equivalente a:

is_operational

Casos:

BASE_ONLY
→ is_operational = false
OPERATIONAL_ONLY
→ is_operational = true
→ contexto operativo obligatorio
BASE_OR_OPERATIONAL
→ is_operational = true
→ contexto obligatorio solo cuando autoriza
  el carril operativo
BASE_AND_OPERATIONAL
→ is_operational = true
→ contexto operativo obligatorio

La estructura definitiva de requisitos será definida en AUTH-CAT-012.

#### 48. Compatibilidad con dispositivos compartidos

Un permiso podrá ser:

is_operational = true

y aun así:

shared_device_allowed = false

Ejemplo conceptual:

aprobar variaciones internas
→ operativo
→ sensible
→ no necesariamente permitido
  desde dispositivo compartido

La compatibilidad con dispositivos se definirá en:

AUTH-CAT-014

#### 49. Compatibilidad con simulación

Un permiso operativo podrá ser simulado sin ser ejecutado.

is_operational = true
+
simulation_allowed = true

no significa que la simulación cree un turno o una concesión real.

La política de simulación se definirá en:

AUTH-CAT-015

#### 50. Auditoría

Toda decisión deberá poder registrar:

permission_key
authorization_requirement
is_operational
evaluated_base_lane
evaluated_operational_lane
operational_context_id
matched_operational_assignment
decision
blocked_reasons

is_operational permitirá explicar por qué:

el carril operativo era compatible

pero no será la razón suficiente de la autorización.

#### 51. Validaciones futuras obligatorias

La implementación deberá validar:

BASE_ONLY
→ is_operational = false

OPERATIONAL_ONLY
→ is_operational = true

BASE_OR_OPERATIONAL
→ is_operational = true

BASE_AND_OPERATIONAL
→ is_operational = true

También:

permiso canónico activo
→ is_operational no nulo
permiso legacy amplio
→ is_operational nulo
permiso técnico retirado
→ is_operational nulo
alias
→ sin clasificación independiente
matriz operativa
→ solo permisos operativos

#### 52. Códigos de diagnóstico futuros

La futura implementación podrá utilizar:

operational_classification_missing
operational_classification_mismatch
non_operational_permission_in_operational_lane
operational_only_permission_in_base_lane
legacy_permission_operational_status_unresolved
retired_permission_not_classifiable
alias_operational_status_not_independent
operational_context_missing
operational_assignment_missing

Estos códigos son conceptuales.

No se implementan en esta tarea.

#### 53. Riesgos controlados

Riesgo 1 — Marcar todos los permisos de una aplicación operativa

Control:

clasificación individual derivada de modalidad
Riesgo 2 — Confundir operativo con mutación

Control:

is_operational
≠
is_read_only
Riesgo 3 — Confundir operativo con turno obligatorio

Control:

BASE_OR_OPERATIONAL
→ operativo
→ puede autorizarse por base
Riesgo 4 — Permitir permisos BASE_ONLY en roles operativos

Control:

validación de compatibilidad de matriz
Riesgo 5 — Mantener permisos operativos legacy en roles base

Control:

OPERATIONAL_ONLY
→ asignación base incompatible
Riesgo 6 — Crear dos fuentes de verdad

Control:

is_operational
→ propiedad derivada
Riesgo 7 — Clasificar permisos amplios sin descomponerlos

Control:

is_operational = null
Riesgo 8 — Clasificar rutas técnicas

Control:

retired_technical
→ sin clasificación empresarial
Riesgo 9 — Usar el booleano como guard

Control:

authorization_requirement
→ controla evaluación
Riesgo 10 — Suponer que NUMERA tiene permisos operativos por ser híbrida

Control:

tipo de aplicación no autoriza

#### 54. Fuera del alcance

AUTH-CAT-007 no define:

qué permisos son de solo lectura;
qué permisos son de configuración;
qué permisos son sensibles;
los alcances admitidos;
los requisitos exactos de turno;
los requisitos exactos de check-in;
los requisitos de área;
compatibilidad con dispositivos compartidos;
compatibilidad con simulación;
contratos de recursos;
matrices concretas de roles;
asignaciones individuales;
denegaciones concretas;
migraciones;
columnas físicas;
constraints;
tipos TypeScript;
guards;
RPC;
RLS;
navegación.

Estos temas corresponden a:

AUTH-CAT-008 a AUTH-CAT-019
BLOQUE D
BLOQUE E
fases de implementación

#### 55. Invariantes

Todo permiso canónico activo tiene clasificación operativa.
is_operational solo admite true o false para permisos canónicos activos.
is_operational se deriva de authorization_requirement.
BASE_ONLY siempre produce is_operational = false.
OPERATIONAL_ONLY siempre produce is_operational = true.
BASE_OR_OPERATIONAL siempre produce is_operational = true.
BASE_AND_OPERATIONAL siempre produce is_operational = true.
La aplicación no determina la clasificación.
La acción no determina la clasificación.
La tabla de asignación no determina la clasificación.
Un permiso de lectura puede ser operativo.
Un permiso de mutación puede no ser operativo.
Un permiso operativo no exige siempre turno cuando admite carril base.
Un permiso operativo no crea contexto.
Un contexto operativo no crea permisos.
is_operational = true no concede acceso.
Una matriz operativa solo admite permisos operativos.
Un permiso BASE_ONLY no puede aparecer válidamente en la matriz operativa.
Un permiso OPERATIONAL_ONLY no puede autorizarse desde la matriz base.
Un permiso BASE_OR_OPERATIONAL puede aparecer en ambos carriles.
Un permiso BASE_AND_OPERATIONAL debe aparecer autorizadamente en ambos carriles.
Los aliases no tienen clasificación independiente.
Los permisos amplios no se clasifican hasta descomponerse.
Los permisos técnicos no se clasifican como capacidades empresariales.
is_operational no sustituye authorization_requirement.
is_operational no sustituye los requisitos de contexto.
is_operational no sustituye alcance.
is_operational no sustituye contrato de recurso.
is_operational no sustituye sensibilidad.
is_operational no sustituye compatibilidad con dispositivos.
is_operational no será editable independientemente.
Una contradicción entre modalidad y clasificación produce denegación.

#### 56. Criterios de aprobación

Los criterios de aprobación de esta tarea fueron aceptados íntegramente
durante su revisión y quedan respaldados por sus invariantes,
resultado esperado y decisión final.

#### 57. Decisión final

AUTHORIZATION_REQUIREMENT
→ DEFINE QUÉ CARRILES PUEDEN AUTORIZAR
IS_OPERATIONAL
→ INDICA SI EL CARRIL OPERATIVO
  PARTICIPA EN EL CONTRATO

Regla derivada:

BASE_ONLY
→ NO OPERATIVO
OPERATIONAL_ONLY
BASE_OR_OPERATIONAL
BASE_AND_OPERATIONAL
→ OPERATIVO

Resultado:

112 PERMISOS CANÓNICOS

58 OPERATIVOS
54 NO OPERATIVOS

Regla principal:

UN PERMISO NO ES OPERATIVO
POR ESTAR EN NEXO, FOGO O PULSO

NO ES OPERATIVO
POR ESTAR ASIGNADO A UN ROL OPERATIVO

NO ES OPERATIVO
POR MODIFICAR DATOS

ES OPERATIVO CUANDO
SU CONTRATO DE AUTORIZACIÓN
ADMITE O EXIGE
EL CARRIL OPERATIVO

Estado:

AUTH-CAT-001
→ APROBADA

AUTH-CAT-002
→ APROBADA

AUTH-CAT-003
→ APROBADA

AUTH-CAT-004
→ APROBADA

AUTH-CAT-005
→ APROBADA

AUTH-CAT-006
→ APROBADA

AUTH-CAT-007
→ APROBADA

### ✅ AUTH-CAT-008 — Clasificar permisos de solo lectura

#### 1. Estado de continuidad

Última tarea aprobada:

AUTH-CAT-007
Clasificar permisos operativos

Tarea actual:

AUTH-CAT-008
Clasificar permisos de solo lectura

Siguiente tarea después de aprobación:

AUTH-CAT-009
Clasificar permisos de configuración

Estado de implementación:

DEFINICIÓN DOCUMENTAL

No se realizan:

cambios en Supabase;
migraciones;
modificaciones de tablas;
cambios en RLS;
cambios en RPC;
cambios en aplicaciones;
modificaciones de matrices;
implementación de guards;
cambios en vento-shell.

Toda futura migración deberá crearse y documentarse en vento-shell.

#### 2. Problema que se resuelve

El catálogo canónico ya define:

el código del permiso;
su aplicación;
su módulo;
su recurso;
su acción;
su descripción humana;
su modalidad de autorización;
si admite el carril operativo.

Todavía falta declarar si cada permiso:

solo permite consultar o ingresar

o si puede:

crear
actualizar
eliminar
registrar
asignar
aprobar
cancelar
despachar
recibir
o producir otra transición empresarial

Sin esta clasificación podrían aparecer errores como:

Permiso de consulta
→ utilizado para modificar datos
Modo de solo lectura
→ permite ejecutar acciones operativas
Permiso *.view
→ protege una RPC que actualiza estado
Permiso de acceso a la aplicación
→ interpretado como autorización para modificarla
Una acción sensible
→ considerada segura solamente porque usa HTTP GET

Estas interpretaciones quedan prohibidas.

#### 3. Objetivo

Clasificar los 112 permisos canónicos activos mediante:

is_read_only

Valores admitidos:

true
false

La propiedad responde exclusivamente:

¿Este permiso puede autorizar una modificación
del estado empresarial protegido?

Resultado:

is_read_only = true
→ no puede autorizar una modificación empresarial

is_read_only = false
→ puede autorizar una acción que modifica
  o puede modificar estado empresarial

#### 4. Definición de estado empresarial protegido

Se considera estado empresarial protegido cualquier información persistente o transición que represente una decisión, operación o registro real de Vento.

Incluye, entre otros:

trabajadores;
documentos;
fotografías;
turnos;
invitaciones;
productos;
activos;
inventario;
ubicaciones;
asignaciones;
entradas;
ajustes;
conteos;
traslados;
retiros;
remisiones;
lotes;
facturas;
variaciones;
entregas;
configuraciones;
estados operativos;
aprobaciones;
cancelaciones.

Una acción que cambie cualquiera de estos elementos no es de solo lectura.

#### 5. Definición canónica de permiso de solo lectura

Un permiso será de solo lectura cuando la capacidad autorizada se limite a:

ingresar a una aplicación sin modificar recursos;
consultar información;
listar registros;
abrir un detalle;
visualizar estados;
revisar configuraciones;
consultar reportes;
consultar información operativa;
consultar información administrativa.

Clasificación:

is_read_only = true

Un permiso de solo lectura no podrá utilizarse para:

insertar registros;
modificar registros;
eliminar registros;
cambiar estados;
aprobar;
resolver;
cancelar;
asignar;
registrar movimientos;
confirmar operaciones;
iniciar procesos empresariales;
ejecutar acciones excepcionales.

#### 6. Definición canónica de permiso no limitado a lectura

Un permiso tendrá:

is_read_only = false

cuando autorice una capacidad capaz de:

crear;
cargar;
actualizar;
eliminar;
registrar;
asignar;
ejecutar;
solicitar;
preparar;
despachar;
recibir;
cancelar;
generar;
emitir;
aprobar;
resolver;
confirmar;
sobreescribir una regla ordinaria.

Que una operación finalmente no produzca cambios no altera su clasificación.

Ejemplo:

nexo.inventory.remissions.cancel

Aunque una solicitud concreta no pueda cancelarse por su estado actual, el permiso autoriza una capacidad mutadora.

Por tanto:

is_read_only = false

#### 7. Regla especial para `<app>.access`

Los permisos de entrada general:

`<app>.access`

se clasifican como:

is_read_only = true

Motivo:

El permiso únicamente autoriza:

entrada a la aplicación;
visualización inicial;
acceso a su contenedor;
carga de navegación compatible.

No autoriza por sí mismo:

leer cualquier recurso;
crear registros;
actualizar datos;
ejecutar operaciones;
acceder a todos los módulos.

Regla:

APP.ACCESS
→ SOLO ENTRADA

APP.ACCESS
≠
PERMISO GENERAL DE MODIFICACIÓN

La clasificación is_read_only = true para app.access indica que el permiso no puede autorizar mutaciones.

No significa que conceda lectura de todos los datos de la aplicación.

#### 8. La acción canónica y la clasificación

Para el catálogo aprobado actualmente:

*.view
→ is_read_only = true

*.access
→ is_read_only = true

Las acciones actuales que modifican estado tendrán:

is_read_only = false

Incluyen:

create
upload
delete
update
register
override
assign
perform
request
prepare
dispatch
receive
cancel
generate
issue
approve
resolve

Esta correspondencia es normativa para los 112 permisos clasificados en esta tarea.

No se debe inferir una clasificación solamente desde una cadena legacy.

Primero deberá resolverse la clave canónica.

#### 9. view representa lista y detalle ordinarios

La acción canónica:

view

cubre la consulta ordinaria de:

listados;
detalles;
estados;
información relacionada necesaria para interpretar el recurso.

No se crearán permisos distintos únicamente por:

list
detail
open
page
screen
route

Ejemplo:

nexo.inventory.remissions.view

puede permitir:

listar remisiones autorizadas;
abrir una remisión autorizada;
consultar sus líneas;
consultar su estado;
consultar su historial visible.

No permite:

editar;
solicitar;
preparar;
despachar;
recibir;
cancelar.

#### 10. Solo lectura no significa acceso irrestricto

Un permiso con:

is_read_only = true

todavía debe respetar:

identidad;
empleado activo;
modalidad de autorización;
carril aplicable;
sede;
área;
recurso;
propiedad;
alcance;
sensibilidad;
denegaciones;
políticas de dispositivo;
restricciones de simulación.

Ejemplo:

viso.finance.accounting.view

es de solo lectura.

No significa:

puede consultar toda la contabilidad
de todas las empresas y sedes

El alcance se definirá en AUTH-CAT-011.

#### 11. Solo lectura no significa información no sensible

Un permiso puede ser simultáneamente:

is_read_only = true
is_sensitive = true

Ejemplos probables:

nexo.analytics.margin_reports.view
viso.finance.accounting.view
viso.authorization.audit_logs.view
viso.loyalty.customers.view

La clasificación de sensibilidad corresponde a:

AUTH-CAT-010

Regla:

NO MODIFICA DATOS
≠
NO PRESENTA RIESGO

#### 12. Solo lectura no significa no operativo

Un permiso puede ser:

is_read_only = true
is_operational = true

Ejemplo:

nexo.inventory.stock.view

El bodeguero puede consultar stock durante su turno sin modificarlo mediante ese permiso.

También puede existir:

is_read_only = true
is_operational = false

Ejemplo:

viso.workforce.employees.view

Las propiedades son independientes.

#### 13. Solo lectura no significa configuración

Un permiso puede consultar configuración sin poder modificarla.

Ejemplo:

nexo.settings.remission_policies.view

Clasificación:

is_read_only = true

La propiedad:

is_configuration

se definirá en AUTH-CAT-009.

Una capacidad podrá ser simultáneamente:

is_read_only = true
is_configuration = true

#### 14. Solo lectura no depende del método HTTP

No se utilizarán reglas como:

GET
→ siempre lectura

POST
→ siempre modificación

La clasificación depende del efecto empresarial.

Un endpoint GET que cambie estado será incompatible con un permiso de solo lectura.

Un endpoint POST utilizado exclusivamente para una consulta compleja podrá seguir consumiendo un permiso de solo lectura, siempre que no produzca una mutación empresarial.

Regla:

MÉTODO HTTP
≠
CLASIFICACIÓN DEL PERMISO

#### 15. Efectos técnicos incidentales

Una operación de solo lectura podrá producir efectos técnicos no empresariales indispensables, como:

registro de auditoría;
telemetría;
métricas;
trazas;
caché;
actualización técnica de actividad;
detección de errores.

Estos efectos no podrán:

cambiar el estado del recurso consultado;
avanzar un flujo;
aprobar una operación;
afectar inventario;
modificar derechos;
alterar una decisión empresarial;
ser utilizados como sustituto de una acción mutadora.

Ejemplo:

Consultar una remisión
+
registrar evento de auditoría

continúa siendo una consulta.

En cambio:

Consultar una remisión
+
marcarla automáticamente como recibida

no es solo lectura.

#### 16. Resultado general

Permisos canónicos activos:

112

Clasificación:

| Clasificación        | Cantidad |
| -------------------- | -------- |
| is_read_only = true  | 80       |
| is_read_only = false | 32       |
| Total                | 112      |

Distribución porcentual:

Solo lectura          80 / 112 = 71,4 %
Capacidad mutadora    32 / 112 = 28,6 %

#### 17. Distribución por aplicación

| Aplicación | Solo lectura | No solo lectura | Total |
| ---------- | ------------ | --------------- | ----- |
| SHELL      | 1            | 0               | 1     |
| ANIMA      | 3            | 7               | 10    |
| AURA       | 1            | 0               | 1     |
| FOGO       | 5            | 1               | 6     |
| NEXO       | 40           | 23              | 63    |
| NUMERA     | 6            | 0               | 6     |
| ORIGO      | 5            | 0               | 5     |
| PASS       | 1            | 0               | 1     |
| PULSO      | 1            | 1               | 2     |
| VISO       | 17           | 0               | 17    |
| Total      | 80           | 32              | 112   |

#### 18. Relación con la clasificación operativa

Cruce entre AUTH-CAT-007 y AUTH-CAT-008:

| Clasificación | Solo lectura | No solo lectura | Total |
| ------------- | ------------ | --------------- | ----- |
| Operativos    | 40           | 18              | 58    |
| No operativos | 40           | 14              | 54    |
| Total         | 80           | 32              | 112   |

Esto confirma que:

OPERATIVO
≠
MUTADOR

y:

ADMINISTRATIVO
≠
SOLO LECTURA

#### 19. Clasificación — SHELL

| Permiso      | is_read_only |
| ------------ | ------------ |
| shell.access | true         |

Resultado SHELL:

Solo lectura:       1
No solo lectura:    0

SHELL únicamente controla entrada al hub mediante el catálogo actual.

#### 20. Clasificación — ANIMA

20.1 Permisos de solo lectura

| Permiso                                 | is_read_only |
| --------------------------------------- | ------------ |
| anima.access                            | true         |
| anima.workforce.employee_documents.view | true         |
| anima.workforce.team_members.view       | true         |

20.2 Permisos no limitados a lectura

| Permiso                                   | is_read_only |
| ----------------------------------------- | ------------ |
| anima.workforce.employee_documents.upload | false        |
| anima.workforce.employee_documents.delete | false        |
| anima.workforce.employee_photos.upload    | false        |
| anima.workforce.staff_invitations.create  | false        |
| anima.attendance.shifts.create            | false        |
| anima.attendance.shifts.update            | false        |
| anima.attendance.shifts.cancel            | false        |

Resultado ANIMA:

Solo lectura:       3
No solo lectura:    7
Total:             10

#### 21. Clasificación — AURA

| Permiso     | is_read_only |
| ----------- | ------------ |
| aura.access | true         |

Resultado AURA:

Solo lectura:       1
No solo lectura:    0

#### 22. Clasificación — FOGO

22.1 Permisos de solo lectura

| Permiso                          | is_read_only |
| -------------------------------- | ------------ |
| fogo.access                      | true         |
| fogo.production.batches.view     | true         |
| fogo.production.orders.view      | true         |
| fogo.production.recipe_book.view | true         |
| fogo.production.recipes.view     | true         |

22.2 Permisos no limitados a lectura

| Permiso                        | is_read_only |
| ------------------------------ | ------------ |
| fogo.production.batches.create | false        |

Resultado FOGO:

Solo lectura:       5
No solo lectura:    1
Total:              6

#### 23. Clasificación — NEXO: acceso, catálogo y activos

23.1 Permisos de solo lectura

| Permiso                            | is_read_only |
| ---------------------------------- | ------------ |
| nexo.access                        | true         |
| nexo.catalog.products.view         | true         |
| nexo.catalog.presentations.view    | true         |
| nexo.catalog.request_policies.view | true         |
| nexo.catalog.categories.view       | true         |
| nexo.catalog.units.view            | true         |
| nexo.assets.items.view             | true         |
| nexo.assets.groups.view            | true         |
| nexo.assets.counts.view            | true         |

23.2 Permisos no limitados a lectura

| Permiso                      | is_read_only |
| ---------------------------- | ------------ |
| nexo.catalog.products.create | false        |
| nexo.assets.items.create     | false        |

#### 24. Clasificación — NEXO: inventario

24.1 Permisos de solo lectura

| Permiso                                  | is_read_only |
| ---------------------------------------- | ------------ |
| nexo.inventory.adjustments.view          | true         |
| nexo.inventory.entries.view              | true         |
| nexo.inventory.locations.view            | true         |
| nexo.inventory.lpns.view                 | true         |
| nexo.inventory.movements.view            | true         |
| nexo.inventory.stock.view                | true         |
| nexo.inventory.production_batches.view   | true         |
| nexo.inventory.transfers.view            | true         |
| nexo.inventory.withdrawals.view          | true         |
| nexo.inventory.zones.view                | true         |
| nexo.inventory.storage_positions.view    | true         |
| nexo.inventory.warehouse_operations.view | true         |
| nexo.inventory.stock_counts.view         | true         |
| nexo.inventory.initial_counts.view       | true         |
| nexo.inventory.remissions.view           | true         |

24.2 Permisos no limitados a lectura

| Permiso                                    | is_read_only |
| ------------------------------------------ | ------------ |
| nexo.inventory.adjustments.register        | false        |
| nexo.inventory.entries.register            | false        |
| nexo.inventory.entries.override            | false        |
| nexo.inventory.location_assignments.assign | false        |
| nexo.inventory.location_catalog.update     | false        |
| nexo.inventory.transfers.create            | false        |
| nexo.inventory.withdrawals.register        | false        |
| nexo.inventory.stock_validations.perform   | false        |
| nexo.inventory.stock_counts.perform        | false        |
| nexo.inventory.remissions.update           | false        |
| nexo.inventory.remissions.request          | false        |
| nexo.inventory.remissions.prepare          | false        |
| nexo.inventory.remissions.dispatch         | false        |
| nexo.inventory.remissions.receive          | false        |
| nexo.inventory.remissions.cancel           | false        |

#### 25. Clasificación — NEXO: logística

Todos los permisos canónicos actuales de consulta logística son de solo lectura.

| Permiso                                | is_read_only |
| -------------------------------------- | ------------ |
| nexo.logistics.operations_board.view   | true         |
| nexo.logistics.operations.view         | true         |
| nexo.logistics.driver_operations.view  | true         |
| nexo.logistics.fulfillment.view        | true         |
| nexo.logistics.fulfillment_routes.view | true         |
| nexo.logistics.supply_routes.view      | true         |

Estos permisos permiten consultar la operación correspondiente.

No autorizan las transiciones específicas de inventario o remisiones mostradas en esas vistas.

#### 26. Clasificación — NEXO: finanzas internas

26.1 Permisos de solo lectura

| Permiso                                    | is_read_only |
| ------------------------------------------ | ------------ |
| nexo.finance.internal_invoices.view        | true         |
| nexo.finance.internal_invoice_amounts.view | true         |
| nexo.finance.internal_prices.view          | true         |
| nexo.finance.internal_variances.view       | true         |
| nexo.finance.cost_centers.view             | true         |

26.2 Permisos no limitados a lectura

| Permiso                                 | is_read_only |
| --------------------------------------- | ------------ |
| nexo.finance.internal_invoices.generate | false        |
| nexo.finance.internal_invoices.issue    | false        |
| nexo.finance.internal_invoices.cancel   | false        |
| nexo.finance.internal_variances.approve | false        |
| nexo.finance.internal_variances.resolve | false        |

#### 27. Clasificación — NEXO: analítica, impresión y configuración

27.1 Permisos de solo lectura

| Permiso                               | is_read_only |
| ------------------------------------- | ------------ |
| nexo.analytics.internal_reports.view  | true         |
| nexo.analytics.margin_reports.view    | true         |
| nexo.printing.jobs.view               | true         |
| nexo.settings.sites.view              | true         |
| nexo.settings.remission_policies.view | true         |

27.2 Permisos no limitados a lectura

| Permiso                        | is_read_only |
| ------------------------------ | ------------ |
| nexo.printing.templates.update | false        |

Resultado total NEXO:

Solo lectura:       40
No solo lectura:    23
Total:              63

#### 28. Clasificación — NUMERA

Todos los permisos canónicos actuales de NUMERA son de solo lectura.

| Permiso                                 | is_read_only |
| --------------------------------------- | ------------ |
| numera.access                           | true         |
| numera.finance.cost_centers.view        | true         |
| numera.finance.expenses.view            | true         |
| numera.analytics.break_even.view        | true         |
| numera.analytics.profitability.view     | true         |
| numera.analytics.financial_reports.view | true         |

Resultado NUMERA:

Solo lectura:       6
No solo lectura:    0

Esto no significa que NUMERA deba permanecer completamente en modo consulta.

Significa que sus capacidades mutadoras todavía no se encuentran representadas como permisos canónicos atómicos.

Los permisos legacy amplios:

numera.cost_centers.manage
numera.expenses.manage

continúan pendientes de descomposición.

#### 29. Clasificación — ORIGO

Todos los permisos canónicos actuales de ORIGO son de solo lectura.

| Permiso                                | is_read_only |
| -------------------------------------- | ------------ |
| origo.access                           | true         |
| origo.procurement.purchase_orders.view | true         |
| origo.procurement.receipts.view        | true         |
| origo.procurement.suppliers.view       | true         |
| origo.catalog.product_reviews.view     | true         |

Resultado ORIGO:

Solo lectura:       5
No solo lectura:    0

Esto no significa que las recepciones o compras sean procesos de solo lectura.

Significa que el catálogo canónico actual solo contiene permisos de consulta para esas capacidades.

Las futuras acciones deberán tener permisos atómicos separados, por ejemplo:

origo.procurement.receipts.register
origo.procurement.purchase_orders.create
origo.procurement.purchase_orders.approve

Solo se crearán cuando corresponda dentro del roadmap.

#### 30. Clasificación — Vento Pass

| Permiso     | is_read_only |
| ----------- | ------------ |
| pass.access | true         |

Resultado PASS:

Solo lectura:       1
No solo lectura:    0

Este permiso laboral no representa las operaciones del cliente ni las transacciones de puntos.

#### 31. Clasificación — PULSO

31.1 Permiso de solo lectura

| Permiso      | is_read_only |
| ------------ | ------------ |
| pulso.access | true         |

31.2 Permiso no limitado a lectura

| Permiso                            | is_read_only |
| ---------------------------------- | ------------ |
| pulso.delivery.deliveries.override | false        |

Resultado PULSO:

Solo lectura:       1
No solo lectura:    1
Total:              2

pulso.access únicamente permite entrar a la aplicación.

No autoriza:

registrar ventas;
cobrar;
cancelar;
cerrar caja;
acumular puntos;
redimir puntos;
confirmar entregas.

Estas capacidades deberán contar con permisos atómicos propios.

#### 32. Clasificación — VISO

Todos los permisos canónicos actuales de VISO son de solo lectura.

| Permiso                                     | is_read_only |
| ------------------------------------------- | ------------ |
| viso.access                                 | true         |
| viso.platform.app_updates.view              | true         |
| viso.organization.businesses.view           | true         |
| viso.workforce.employees.view               | true         |
| viso.workforce.staff_calendar.view          | true         |
| viso.workforce.schedules.view               | true         |
| viso.workforce.vacancies.view               | true         |
| viso.authorization.context_simulations.view | true         |
| viso.authorization.audit_logs.view          | true         |
| viso.catalog.commercial_categories.view     | true         |
| viso.content.content_blocks.view            | true         |
| viso.content.menu.view                      | true         |
| viso.content.website_content.view           | true         |
| viso.finance.accounting.view                | true         |
| viso.delivery.rates.view                    | true         |
| viso.loyalty.products.view                  | true         |
| viso.loyalty.customers.view                 | true         |

Resultado VISO:

Solo lectura:       17
No solo lectura:     0

Esto no significa que VISO sea una aplicación de solo lectura.

Las acciones mutadoras actuales todavía se encuentran agrupadas en permisos legacy amplios como:

viso.staff.manage
viso.staff.permissions.manage
viso.site_operational_roles.manage
viso.employee_operational_profiles.manage
viso.menu.images.manage

Esos permisos deben descomponerse antes de recibir una clasificación definitiva.

#### 33. Resumen de los 32 permisos no limitados a lectura

ANIMA — 7
anima.workforce.employee_documents.upload
anima.workforce.employee_documents.delete
anima.workforce.employee_photos.upload
anima.workforce.staff_invitations.create
anima.attendance.shifts.create
anima.attendance.shifts.update
anima.attendance.shifts.cancel
FOGO — 1
fogo.production.batches.create
NEXO — 23
nexo.catalog.products.create
nexo.assets.items.create
nexo.inventory.adjustments.register
nexo.inventory.entries.register
nexo.inventory.entries.override
nexo.inventory.location_assignments.assign
nexo.inventory.location_catalog.update
nexo.inventory.transfers.create
nexo.inventory.withdrawals.register
nexo.inventory.stock_validations.perform
nexo.inventory.stock_counts.perform
nexo.inventory.remissions.update
nexo.inventory.remissions.request
nexo.inventory.remissions.prepare
nexo.inventory.remissions.dispatch
nexo.inventory.remissions.receive
nexo.inventory.remissions.cancel
nexo.finance.internal_invoices.generate
nexo.finance.internal_invoices.issue
nexo.finance.internal_invoices.cancel
nexo.finance.internal_variances.approve
nexo.finance.internal_variances.resolve
nexo.printing.templates.update
PULSO — 1
pulso.delivery.deliveries.override

Total:

7 + 1 + 23 + 1 = 32

#### 34. Permisos legacy amplios

Los 21 permisos pendientes de descomposición no recibirán una clasificación definitiva de solo lectura.

Estado conceptual:

is_read_only = null
catalog_status = deprecated
assignment_status = blocked

Permisos:

FOGO
fogo.production.recipes.manage
NEXO
nexo.settings.categories.manage
nexo.settings.units.manage
nexo.settings.supply_routes.manage
nexo.internal_prices.manage
nexo.cost_centers.manage
nexo.settings.sites.manage
nexo.settings.remissions.manage
NUMERA
numera.cost_centers.manage
numera.expenses.manage
ORIGO
origo.suppliers.manage
PULSO
pulso.pos.main
VISO
viso.app_navigation.manage
viso.employee_operational_profiles.manage
viso.menu.images.manage
viso.operational_points.manage
viso.site_operational_roles.manage
viso.staff.documents.manage
viso.staff.employee_photos.manage
viso.staff.manage
viso.staff.permissions.manage

Motivo:

Un permiso amplio puede mezclar:

consultas;
creación;
edición;
eliminación;
activación;
desactivación;
asignación;
aprobación.

No se permitirá clasificarlo como de solo lectura ni como mutador sin descomponerlo.

#### 35. Permisos técnicos retirados

Los 14 permisos técnicos tendrán:

is_read_only = null
assignable = false
catalog_status = retired_technical

Permisos:

nexo.code.view
nexo.edit.view
nexo.login.view
nexo.new.view
nexo.no_access.view
nexo.open.view
nexo.page_tsx.view
nexo.quick.view
nexo.scanner.view
nexo.settings.view
nexo.setup.view
nexo.slug.view
origo.login.view
origo.no_access.view

Aunque algunos terminan en:

.view

no se clasifican como permisos de solo lectura porque:

NO REPRESENTAN CAPACIDADES EMPRESARIALES

La presencia del sufijo .view en un permiso técnico legacy no lo convierte en una capacidad canónica válida.

#### 36. Aliases legacy

Los aliases no tendrán clasificación independiente.

Ejemplo:

nexo.stock.view
→ nexo.inventory.stock.view

Resultado:

nexo.inventory.stock.view
→ is_read_only = true

Otro ejemplo:

nexo.inventory.remissions.edit_own_pending
→ nexo.inventory.remissions.update

Resultado:

nexo.inventory.remissions.update
→ is_read_only = false

Regla:

ALIAS
→ RESUELVE CLAVE CANÓNICA
→ HEREDA IS_READ_ONLY

No se permitirá:

alias.is_read_only
≠
canonical.is_read_only

#### 37. Relación con authorization_requirement

is_read_only y authorization_requirement responden preguntas diferentes.

Ejemplo:

nexo.inventory.stock.view
authorization_requirement:
BASE_OR_OPERATIONAL

is_read_only:
true

Significa:

puede autorizarse desde cualquiera de los dos carriles;
ninguno de esos carriles puede utilizar ese permiso para modificar stock.

Otro ejemplo:

nexo.inventory.adjustments.register
authorization_requirement:
BASE_AND_OPERATIONAL

is_read_only:
false

Significa:

exige ambos carriles;
autoriza una operación mutadora.

#### 38. Relación con dispositivos compartidos

Un dispositivo podrá configurarse conceptualmente como:

read_only_session = true

En ese caso solo podrá ejecutar permisos con:

is_read_only = true

Aunque el trabajador tenga permisos mutadores.

Ejemplo:

Trabajador
→ puede registrar ajustes

Dispositivo
→ modo solo lectura

Resultado
→ puede consultar ajustes
→ no puede registrarlos

La política definitiva de dispositivos corresponde a AUTH-CAT-014 y al BLOQUE P.

#### 39. Relación con simulación

Una simulación ordinaria deberá operar en modo de solo lectura.

Podrá:

evaluar permisos;
mostrar navegación;
mostrar recursos hipotéticamente visibles;
explicar decisiones;
mostrar would_allow;
mostrar would_deny.

No podrá ejecutar permisos con:

is_read_only = false

El hecho de que una simulación determine que una acción sería permitida no autoriza su ejecución real.

La política definitiva corresponde a AUTH-CAT-015 y al BLOQUE Q.

#### 40. Relación con RLS y RPC

Un permiso de solo lectura deberá utilizarse únicamente en operaciones cuya política efectiva sea de consulta.

Ejemplo correcto:

SELECT remissions
→ requiere nexo.inventory.remissions.view

Ejemplo incorrecto:

UPDATE remissions
SET status = 'received'
→ requiere nexo.inventory.remissions.view

La actualización deberá exigir:

nexo.inventory.remissions.receive

Las RPC SECURITY DEFINER deberán aplicar la misma regla.

RLS no podrá considerar que un permiso .view autoriza:

INSERT;
UPDATE;
DELETE;
transiciones de estado.

#### 41. Relación con frontend y navegación

Ocultar un botón no garantiza solo lectura.

La protección deberá aplicarse en:

INTERFAZ
+
GUARD
+
RPC
+
RLS
+
FUNCIÓN DE DOMINIO

Ejemplo:

Usuario con:
nexo.inventory.remissions.view

Puede:
✅ abrir remisiones
✅ consultar líneas
✅ revisar estados

No puede:
❌ solicitar
❌ preparar
❌ despachar
❌ recibir
❌ cancelar

Aunque el frontend muestre accidentalmente uno de esos botones, el backend deberá denegar la acción.

#### 42. Cómo se verá en VISO

42.1 Permiso de solo lectura
Consultar stock
nexo.inventory.stock.view

Solo lectura
● Sí

Efecto permitido
Consultar información

Puede modificar estado
No
42.2 Permiso mutador
Registrar retiro de inventario
nexo.inventory.withdrawals.register

Solo lectura
○ No

Efecto permitido
Registrar una salida de inventario

Puede modificar estado
Sí
42.3 Permiso de entrada
Acceder a NEXO
nexo.access

Solo lectura
● Sí

Tipo especial
Entrada a aplicación

Lectura automática de todos los recursos
No

#### 43. Edición en VISO

is_read_only no deberá editarse libremente sin cambiar el contrato de la capacidad.

Representación esperada:

Acción
[ view ]

Solo lectura
Sí
Calculado desde la definición canónica

Para una acción mutadora:

Acción
[ register ]

Solo lectura
No
Calculado desde la definición canónica

Cualquier excepción deberá requerir:

modificación documental;
nueva versión del catálogo;
revisión de consumidores;
pruebas;
migración versionada.

#### 44. Filtros administrativos

VISO podrá ofrecer:

Todos
Solo lectura
Con modificación
Operativos de solo lectura
Operativos con modificación
Sensibles de solo lectura
Configuración de solo lectura

Interpretación:

Solo lectura
→ is_read_only = true
Con modificación
→ is_read_only = false

Los filtros no conceden autorización.

#### 45. Validaciones futuras obligatorias

Todo permiso canónico activo deberá cumplir:

is_read_only no nulo

Además:

action = view
→ is_read_only = true
permission_key = `<app>.access`
→ is_read_only = true

Para las acciones mutadoras actuales:

create
upload
delete
update
register
override
assign
perform
request
prepare
dispatch
receive
cancel
generate
issue
approve
resolve

deberá cumplirse:

is_read_only = false

También se validará:

legacy amplio
→ is_read_only nulo
retired technical
→ is_read_only nulo
alias
→ sin clasificación independiente

#### 46. Errores de contrato

La futura implementación podrá utilizar códigos conceptuales como:

read_only_classification_missing
read_only_classification_mismatch
read_only_permission_used_for_mutation
mutation_permission_required
read_only_session_violation
read_only_device_violation
read_only_simulation_violation
legacy_permission_read_only_unresolved
retired_permission_not_classifiable
alias_read_only_status_not_independent

No se implementan en esta tarea.

#### 47. Cambio futuro de clasificación

Cambiar:

is_read_only = true
→ is_read_only = false

constituye una ampliación material de capacidad.

Puede convertir un permiso previamente seguro para consulta en una autorización mutadora.

Cambiar:

is_read_only = false
→ is_read_only = true

puede bloquear flujos existentes.

Cualquier cambio requerirá:

decisión documental explícita;
versión nueva del catálogo;
revisión de interfaces;
revisión de RPC;
revisión de RLS;
revisión de matrices;
revisión de dispositivos;
revisión de simulación;
migración en vento-shell;
pruebas contractuales.

#### 48. Riesgos controlados

Riesgo 1 — Utilizar .view para modificar

Control:

is_read_only = true
→ mutación prohibida en todas las capas
Riesgo 2 — Confundir acceso con control total

Control:

app.access
→ entrada únicamente
Riesgo 3 — Confundir consulta con información no sensible

Control:

is_read_only
≠
is_sensitive
Riesgo 4 — Confundir operación con modificación

Control:

permiso operativo puede ser de solo lectura
Riesgo 5 — Usar método HTTP como clasificación

Control:

efecto empresarial
→ fuente de verdad
Riesgo 6 — Permitir mutaciones en simulación

Control:

simulación ordinaria
→ solo permisos is_read_only = true
Riesgo 7 — Permitir mutaciones desde un dispositivo restringido

Control:

límite del dispositivo
+
clasificación del permiso
Riesgo 8 — Clasificar permisos amplios

Control:

DECOMPOSE_REQUIRED
→ is_read_only = null
Riesgo 9 — Clasificar rutas técnicas por su sufijo

Control:

RETIRE_TECHNICAL
→ sin clasificación empresarial
Riesgo 10 — Confiar únicamente en el frontend

Control:

validación de extremo a extremo

#### 49. Fuera del alcance

AUTH-CAT-008 no define:

permisos de configuración;
permisos sensibles;
alcances permitidos;
requisitos de turno;
requisitos de check-in;
requisitos de área;
compatibilidad definitiva con dispositivos;
compatibilidad definitiva con simulación;
contratos de recurso;
exportaciones futuras;
permisos de impresión física futura;
permisos mutadores faltantes de ORIGO;
permisos mutadores faltantes de NUMERA;
permisos atómicos faltantes de PULSO;
descomposición física de permisos manage;
matrices por rol;
excepciones individuales;
denegaciones concretas;
migraciones;
columnas;
constraints;
RPC;
RLS;
guards.

Estos temas corresponden a:

AUTH-CAT-009 a AUTH-CAT-019
BLOQUE D
BLOQUE E
bloques de implementación

#### 50. Invariantes

Todo permiso canónico activo declara is_read_only.
is_read_only solo admite true o false para permisos canónicos activos.
is_read_only = true prohíbe utilizar el permiso para una mutación empresarial.
is_read_only = false indica que la capacidad puede modificar estado.
Todos los permisos canónicos .view son de solo lectura.
Todos los permisos `<app>.access` son de solo lectura.
app.access no concede lectura general de la aplicación.
app.access no concede mutaciones.
Un permiso de solo lectura puede ser operativo.
Un permiso de solo lectura puede ser base.
Un permiso de solo lectura puede ser sensible.
Un permiso de solo lectura puede consultar configuración.
Un permiso mutador puede requerir carril base.
Un permiso mutador puede requerir carril operativo.
Un permiso mutador puede exigir ambos carriles.
El método HTTP no define la clasificación.
La ruta no define la clasificación.
La tabla de asignación no define la clasificación.
El rol no define la clasificación.
El dispositivo no redefine la clasificación.
La simulación no redefine la clasificación.
Una vista no puede producir transiciones empresariales ocultas.
Los efectos técnicos incidentales no pueden alterar el recurso empresarial.
Una RPC con permiso de lectura no puede modificar estado empresarial.
Una política RLS de lectura no autoriza escritura.
La interfaz no es el único control.
Los aliases heredan la clasificación canónica.
Los aliases no tienen clasificación independiente.
Los permisos amplios no se clasifican antes de descomponerse.
Los permisos técnicos retirados no se clasifican como capacidades empresariales.
Una contradicción entre acción y clasificación es una configuración inválida.
Un cambio de clasificación es un cambio contractual versionado.

#### 51. Criterios de aprobación

AUTH-CAT-008 podrá aprobarse cuando se acepte que:

is_read_only indica si el permiso puede modificar estado empresarial.
Los 80 permisos de consulta o entrada quedan clasificados como de solo lectura.
Los 32 permisos capaces de modificar estado quedan clasificados como no limitados a lectura.
Los permisos `<app>.access` son de solo lectura y únicamente permiten entrar a la aplicación.
Los permisos .view no pueden utilizarse para mutaciones.
Solo lectura no significa acceso global.
Solo lectura no significa información no sensible.
Solo lectura no significa no operativo.
El método HTTP no determina la clasificación.
Los efectos técnicos incidentales no pueden modificar el recurso empresarial.
Los permisos amplios permanecen sin clasificación hasta su descomposición.
Los permisos técnicos retirados permanecen sin clasificación empresarial.
Los aliases heredan la clasificación de su clave canónica.
Esta tarea no implementa código, tablas ni migraciones.

#### 52. Decisión final

IS_READ_ONLY = TRUE

→ PERMITE CONSULTAR O INGRESAR
→ NO PUEDE MODIFICAR ESTADO EMPRESARIAL
IS_READ_ONLY = FALSE

→ AUTORIZA UNA CAPACIDAD
  QUE PUEDE MODIFICAR ESTADO

Resultado:

112 PERMISOS CANÓNICOS

80 DE SOLO LECTURA
32 CON CAPACIDAD DE MODIFICACIÓN

Regla principal:

UN PERMISO NO ES DE SOLO LECTURA
POR USAR GET

NO ES MUTADOR
POR USAR POST

NO ES SEGURO
POR MOSTRAR SOLAMENTE UNA PANTALLA

LA CLASIFICACIÓN DEPENDE
DEL EFECTO EMPRESARIAL
DE LA CAPACIDAD AUTORIZADA

Estado:

AUTH-CAT-001
→ APROBADA

AUTH-CAT-002
→ APROBADA

AUTH-CAT-003
→ APROBADA

AUTH-CAT-004
→ APROBADA

AUTH-CAT-005
→ APROBADA

AUTH-CAT-006
→ APROBADA

AUTH-CAT-007
→ APROBADA

AUTH-CAT-008
→ APROBADA

### ✅ AUTH-CAT-009 — Clasificar permisos de configuración

#### 1. Estado de continuidad

Última tarea aprobada:

AUTH-CAT-008
Clasificar permisos de solo lectura

Tarea actual:

AUTH-CAT-009
Clasificar permisos de configuración

Siguiente tarea después de aprobación:

AUTH-CAT-010
Clasificar permisos sensibles

Estado de implementación:

DEFINICIÓN DOCUMENTAL

No se realizan:

cambios en Supabase;
migraciones;
modificaciones de tablas;
cambios en RLS;
cambios en RPC;
cambios en aplicaciones;
modificaciones de matrices;
implementación de guards;
cambios en vento-shell.

Toda futura migración deberá crearse y documentarse en vento-shell.

#### 2. Problema que se resuelve

El catálogo canónico ya declara:

identidad técnica;
aplicación;
módulo;
recurso;
acción;
descripción humana;
modalidad de autorización;
participación del carril operativo;
clasificación de solo lectura.

Todavía falta distinguir entre:

OPERAR EL NEGOCIO

y:

DEFINIR LAS REGLAS,
CATÁLOGOS Y ESTRUCTURAS
QUE UTILIZA EL NEGOCIO

Sin esta clasificación podrían aparecer interpretaciones incorrectas como:

Todo permiso administrativo
→ es configuración
Todo permiso de lectura
→ no es configuración
Todo permiso dentro de settings
→ es la única configuración existente
Consultar productos durante una remisión
→ deja de ser consulta de datos maestros
Crear un turno
→ configura el sistema
Registrar una recepción
→ configura inventario
Consultar reportes financieros
→ configura finanzas

Estas interpretaciones quedan prohibidas.

#### 3. Objetivo

Clasificar los 112 permisos canónicos activos mediante:

is_configuration

Valores admitidos:

true
false

La propiedad responde exclusivamente:

¿La capacidad tiene como objeto principal
una definición, dato maestro, política,
estructura, plantilla o parámetro
que será consumido por operaciones futuras?

Resultado:

is_configuration = true
→ la capacidad consulta o modifica configuración

is_configuration = false
→ la capacidad pertenece a acceso,
  operación, transacción, planificación,
  supervisión, reporte, auditoría
  o información no configurativa

#### 4. Definición canónica de configuración

Se considera configuración empresarial cualquier recurso cuya función principal sea definir de manera relativamente estable:

datos maestros;
catálogos;
clasificaciones;
políticas;
reglas;
parámetros;
estructuras organizacionales;
topología física;
rutas configuradas;
plantillas;
contenido administrable;
valores de referencia;
entidades utilizadas repetidamente por operaciones futuras.

Ejemplos:

Producto
Presentación
Categoría
Unidad
Proveedor
Centro de costo
Precio interno
Ubicación
Zona
Posición de almacenamiento
Ruta de abastecimiento
Política de remisiones
Plantilla de impresión
Tarifa de entrega
Producto de fidelización

Estos recursos no representan por sí mismos una operación específica.

Definen información reutilizable por múltiples operaciones.

#### 5. Permiso de configuración

Un permiso tendrá:

is_configuration = true

cuando permita:

consultar una definición configurada;
crear un registro maestro;
modificar una regla;
revisar una política;
consultar una estructura organizacional;
consultar una topología operativa;
modificar una plantilla;
consultar contenido administrable;
consultar un parámetro utilizado por operaciones posteriores.

Un permiso puede ser de configuración aunque sea de solo lectura.

Ejemplo:

nexo.settings.remission_policies.view

is_configuration = true
is_read_only = true

Un permiso también puede ser de configuración y modificar datos.

Ejemplo:

nexo.printing.templates.update

is_configuration = true
is_read_only = false

#### 6. Permiso no configurativo

Un permiso tendrá:

is_configuration = false

cuando su función principal sea:

entrar a una aplicación;
consultar una transacción;
ejecutar una operación;
cambiar el estado de un proceso;
registrar un movimiento;
crear un turno;
consultar trabajadores;
cargar documentos;
consultar reportes;
consultar auditorías;
ejecutar simulaciones;
aprobar una variación;
emitir una factura;
realizar un conteo;
solicitar o recibir una remisión.

La capacidad puede ser administrativa sin ser configuración.

La capacidad puede ser de solo lectura sin ser configuración.

La capacidad puede modificar datos sin ser configuración.

#### 7. Configuración no equivale a administración

No se utilizará la regla:

BASE_ONLY
→ CONFIGURACIÓN

Ejemplos no configurativos y BASE_ONLY:

anima.workforce.employee_documents.view
viso.workforce.employees.view
viso.authorization.audit_logs.view
nexo.analytics.margin_reports.view

Son capacidades administrativas o de supervisión.

No definen reglas ni datos maestros.

También existen permisos configurativos que admiten el carril operativo para consulta:

nexo.catalog.products.view
origo.procurement.suppliers.view

Por tanto:

ADMINISTRATIVO
≠
CONFIGURACIÓN

#### 8. Configuración no equivale a solo lectura

Las propiedades responden preguntas diferentes.

is_configuration
→ qué tipo de recurso se protege

is_read_only
→ si la capacidad puede modificar estado

Combinaciones válidas:

| is_configuration | is_read_only | Ejemplo              |
| ---------------- | ------------ | -------------------- |
| true             | true         | Consultar categorías |
| true             | false        | Crear productos      |
| false            | true         | Consultar remisiones |
| false            | false        | Recibir remisiones   |

#### 9. Configuración no equivale a operación

Un permiso puede ser simultáneamente:

is_configuration = true
is_operational = true

Ejemplo:

nexo.catalog.presentations.view

Una presentación es un dato maestro.

Un trabajador operativo puede necesitar consultarla durante:

solicitudes;
conteos;
remisiones;
recepciones;
retiros.

Eso no convierte la presentación en una transacción.

También puede existir:

is_configuration = true
is_operational = false

Ejemplo:

nexo.printing.templates.update

La modificación de plantillas corresponde al carril base.

#### 10. Regla de configuración operativa

En el catálogo canónico actual:

PERMISOS CONFIGURATIVOS OPERATIVOS
→ SOLO CONSULTA

Ningún permiso que modifique configuración admite actualmente autorización exclusivamente operativa.

Resultado:

Rol operativo
→ puede consultar configuración necesaria
  para ejecutar su trabajo

Rol operativo
→ no puede modificar configuración
  únicamente por estar en turno

Las cuatro capacidades configurativas mutadoras actuales son:

nexo.catalog.products.create
nexo.assets.items.create
nexo.inventory.location_catalog.update
nexo.printing.templates.update

Las cuatro son:

BASE_ONLY

#### 11. Datos maestros

Se clasifican como configuración los datos maestros que se reutilizan en múltiples procesos.

Incluyen:

productos;
presentaciones;
categorías;
unidades;
activos;
grupos de activos;
proveedores;
centros de costo;
precios internos;
empresas;
categorías comerciales;
tarifas;
productos de fidelización.

Regla:

DATO MAESTRO
→ CONFIGURACIÓN

TRANSACCIÓN SOBRE EL DATO MAESTRO
→ NO CONFIGURACIÓN

Ejemplo:

nexo.catalog.products.view
→ configuración
nexo.inventory.entries.register
→ operación
→ no configuración

#### 12. Topología operativa

Se clasifican como configuración las estructuras relativamente estables que describen dónde y cómo se organiza físicamente la operación.

Incluyen:

ubicaciones;
catálogos permitidos por ubicación;
zonas;
posiciones de almacenamiento;
rutas de cumplimiento;
rutas de abastecimiento;
sedes registradas.

No se considera configuración:

asignar stock a una ubicación;
mover inventario;
retirar existencias;
consultar movimientos;
ejecutar operaciones de bodega.

Separación:

UBICACIÓN
→ CONFIGURACIÓN

ASIGNAR EXISTENCIAS A UBICACIÓN
→ OPERACIÓN

#### 13. Políticas y reglas

Se clasifican como configuración:

nexo.catalog.request_policies.view
nexo.settings.remission_policies.view

Ambos permisos consultan reglas utilizadas por operaciones futuras.

La diferencia funcional es:

catalog.request_policies.view
→ consulta de reglas aplicables al catálogo
  durante una operación

settings.remission_policies.view
→ consulta administrativa de la configuración
  general de remisiones

Ambos son configurativos.

Su modalidad de autorización continúa siendo diferente.

#### 14. Contenido administrable

Se considera configuración el contenido cuya definición determina lo que posteriormente se presenta o publica.

Incluye:

bloques de contenido;
menú;
contenido del sitio web;
categorías comerciales;
productos de fidelización.

No se considera configuración:

clientes de fidelización;
auditorías;
reportes;
trabajadores;
vacantes;
calendarios.

#### 15. Planificación no es configuración

Los turnos, horarios y calendarios representan planificación temporal.

No se consideran configuración estable.

Por tanto:

anima.attendance.shifts.create
anima.attendance.shifts.update
anima.attendance.shifts.cancel
viso.workforce.staff_calendar.view
viso.workforce.schedules.view

tendrán:

is_configuration = false

La planificación utiliza configuración organizacional, pero no es en sí misma configuración del sistema.

#### 16. Personas no son configuración

No se clasifican como configuración:

trabajadores;
clientes;
miembros del equipo;
invitaciones;
documentos laborales;
fotografías;
vacantes.

Las personas y sus expedientes son recursos empresariales protegidos.

No son parámetros ni datos maestros configurativos.

Regla:

PERSONA
≠
CONFIGURACIÓN

#### 17. Transacciones no son configuración

No se clasifican como configuración:

lotes de producción;
órdenes de producción;
entradas de inventario;
ajustes;
movimientos;
stock;
traslados;
retiros;
conteos;
remisiones;
facturas;
variaciones;
entregas.

Aunque una transacción pueda cambiar cómo se comporta una operación posterior, continúa siendo un registro operativo o financiero.

#### 18. Reportes y auditorías no son configuración

No se clasifican como configuración:

reportes internos;
márgenes;
punto de equilibrio;
rentabilidad;
reportes financieros;
registros de auditoría;
simulaciones de autorización;
trabajos de impresión.

Estos recursos observan o explican información.

No definen la estructura utilizada por el sistema.

#### 19. Resultado general

Permisos canónicos activos:

112

Clasificación:

| Clasificación            | Cantidad |
| ------------------------ | -------- |
| is_configuration = true  | 30       |
| is_configuration = false | 82       |
| Total                    | 112      |

Distribución porcentual:

Configuración       30 / 112 = 26,8 %
No configuración    82 / 112 = 73,2 %

#### 20. Distribución por aplicación

| Aplicación | Configuración | No configuración | Total |
| ---------- | ------------- | ---------------- | ----- |
| SHELL      | 0             | 1                | 1     |
| ANIMA      | 0             | 10               | 10    |
| AURA       | 0             | 1                | 1     |
| FOGO       | 1             | 5                | 6     |
| NEXO       | 20            | 43               | 63    |
| NUMERA     | 1             | 5                | 6     |
| ORIGO      | 1             | 4                | 5     |
| PASS       | 0             | 1                | 1     |
| PULSO      | 0             | 2                | 2     |
| VISO       | 7             | 10               | 17    |
| Total      | 30            | 82               | 112   |

#### 21. Relación con solo lectura

Cruce entre AUTH-CAT-008 y AUTH-CAT-009:

| Clasificación    | Solo lectura | Con modificación | Total |
| ---------------- | ------------ | ---------------- | ----- |
| Configuración    | 26           | 4                | 30    |
| No configuración | 54           | 28               | 82    |
| Total            | 80           | 32               | 112   |

Resultado:

26 permisos
→ consultan configuración

4 permisos
→ modifican configuración

#### 22. Relación con permisos operativos

Cruce entre AUTH-CAT-007 y AUTH-CAT-009:

| Clasificación    | Operativos | No operativos | Total |
| ---------------- | ---------- | ------------- | ----- |
| Configuración    | 13         | 17            | 30    |
| No configuración | 45         | 37            | 82    |
| Total            | 58         | 54            | 112   |

Los 13 permisos configurativos operativos son exclusivamente capacidades de consulta.

#### 23. Relación con authorization_requirement

Los 30 permisos configurativos se distribuyen así:

| authorization_requirement | Configuración |
| ------------------------- | ------------- |
| BASE_ONLY                 | 17            |
| OPERATIONAL_ONLY          | 0             |
| BASE_OR_OPERATIONAL       | 13            |
| BASE_AND_OPERATIONAL      | 0             |
| Total                     | 30            |

Regla actual:

MODIFICAR CONFIGURACIÓN
→ BASE_ONLY

CONSULTAR CONFIGURACIÓN
→ puede ser BASE_ONLY
  o BASE_OR_OPERATIONAL

No existe actualmente una capacidad configurativa:

OPERATIONAL_ONLY

ni:

BASE_AND_OPERATIONAL

#### 24. Clasificación — SHELL

| Permiso      | is_configuration |
| ------------ | ---------------- |
| shell.access | false            |

Resultado SHELL:

Configuración:        0
No configuración:     1

Entrar al hub no modifica ni consulta por sí mismo configuración empresarial.

#### 25. Clasificación — ANIMA

Todos los permisos canónicos actuales de ANIMA son no configurativos.

| Permiso                                   | is_configuration |
| ----------------------------------------- | ---------------- |
| anima.access                              | false            |
| anima.workforce.employee_documents.view   | false            |
| anima.workforce.employee_documents.upload | false            |
| anima.workforce.employee_documents.delete | false            |
| anima.workforce.employee_photos.upload    | false            |
| anima.workforce.team_members.view         | false            |
| anima.workforce.staff_invitations.create  | false            |
| anima.attendance.shifts.create            | false            |
| anima.attendance.shifts.update            | false            |
| anima.attendance.shifts.cancel            | false            |

Resultado ANIMA:

Configuración:         0
No configuración:     10

Documentos, trabajadores, invitaciones y turnos son recursos laborales o de planificación.

No son configuración.

#### 26. Clasificación — AURA

| Permiso     | is_configuration |
| ----------- | ---------------- |
| aura.access | false            |

Resultado AURA:

Configuración:        0
No configuración:     1

El catálogo funcional de AURA continúa diferido.

#### 27. Clasificación — FOGO

27.1 Permiso de configuración

| Permiso                      | is_configuration |
| ---------------------------- | ---------------- |
| fogo.production.recipes.view | true             |

La definición estructural de una receta es un dato maestro de producción.

Puede incluir:

ingredientes;
cantidades;
rendimientos;
versiones;
parámetros;
instrucciones;
relaciones técnicas.
27.2 Permisos no configurativos

| Permiso                          | is_configuration |
| -------------------------------- | ---------------- |
| fogo.access                      | false            |
| fogo.production.batches.view     | false            |
| fogo.production.batches.create   | false            |
| fogo.production.orders.view      | false            |
| fogo.production.recipe_book.view | false            |

Separación:

production.recipes.view
→ definición maestra
→ configuración

production.recipe_book.view
→ proyección operativa de recetas
→ no configuración

Resultado FOGO:

Configuración:        1
No configuración:     5

#### 28. Clasificación — NEXO: catálogo

Todos los permisos canónicos del catálogo actual de NEXO son configurativos.

| Permiso                            | is_configuration |
| ---------------------------------- | ---------------- |
| nexo.catalog.products.view         | true             |
| nexo.catalog.products.create       | true             |
| nexo.catalog.presentations.view    | true             |
| nexo.catalog.request_policies.view | true             |
| nexo.catalog.categories.view       | true             |
| nexo.catalog.units.view            | true             |

Interpretación:

Productos
Presentaciones
Políticas de solicitud
Categorías
Unidades

son datos maestros o reglas reutilizadas por:

inventario;
producción;
compras;
remisiones;
conteos;
ventas;
logística.

Subtotal NEXO configurativo:

6

#### 29. Clasificación — NEXO: activos

29.1 Permisos configurativos

| Permiso                  | is_configuration |
| ------------------------ | ---------------- |
| nexo.assets.items.view   | true             |
| nexo.assets.items.create | true             |
| nexo.assets.groups.view  | true             |

Los activos y sus grupos forman un registro maestro utilizado por conteos y control patrimonial.

29.2 Permiso no configurativo

| Permiso                 | is_configuration |
| ----------------------- | ---------------- |
| nexo.assets.counts.view | false            |

El conteo de activos es una transacción o evidencia operacional.

No es configuración.

Subtotal NEXO configurativo acumulado:

9

#### 30. Clasificación — NEXO: topología de inventario

30.1 Permisos configurativos

| Permiso                                | is_configuration |
| -------------------------------------- | ---------------- |
| nexo.inventory.locations.view          | true             |
| nexo.inventory.location_catalog.update | true             |
| nexo.inventory.zones.view              | true             |
| nexo.inventory.storage_positions.view  | true             |

Estos permisos protegen:

ubicaciones;
productos permitidos por ubicación;
zonas;
posiciones físicas de almacenamiento.
30.2 Regla de separación
Consultar una ubicación
→ configuración

Definir el catálogo permitido de una ubicación
→ configuración

Asignar stock real a una ubicación
→ operación
→ no configuración

Por tanto:

nexo.inventory.location_assignments.assign
→ is_configuration = false

Subtotal NEXO configurativo acumulado:

13

#### 31. Clasificación — NEXO: rutas logísticas

| Permiso                                | is_configuration |
| -------------------------------------- | ---------------- |
| nexo.logistics.fulfillment_routes.view | true             |
| nexo.logistics.supply_routes.view      | true             |

Las rutas describen estructuras reutilizadas para organizar movimientos futuros.

No representan por sí mismas:

una remisión;
un viaje;
un despacho;
una entrega específica.

Subtotal NEXO configurativo acumulado:

15

#### 32. Clasificación — NEXO: finanzas maestras

| Permiso                           | is_configuration |
| --------------------------------- | ---------------- |
| nexo.finance.internal_prices.view | true             |
| nexo.finance.cost_centers.view    | true             |

Los precios internos y centros de costo son valores o estructuras de referencia utilizados por operaciones posteriores.

No se clasifican como configuración:

facturas;
importes facturados;
variaciones;
aprobaciones;
resoluciones.

Subtotal NEXO configurativo acumulado:

17

#### 33. Clasificación — NEXO: impresión y settings

| Permiso                               | is_configuration |
| ------------------------------------- | ---------------- |
| nexo.printing.templates.update        | true             |
| nexo.settings.sites.view              | true             |
| nexo.settings.remission_policies.view | true             |

Las plantillas determinan la estructura de futuras impresiones.

Las sedes registradas forman parte de la estructura organizacional y territorial.

Las políticas de remisiones gobiernan operaciones futuras.

Total NEXO configurativo:

20

#### 34. Clasificación — NEXO: permisos no configurativos

Los siguientes 43 permisos tendrán:

is_configuration = false
34.1 Acceso
nexo.access
34.2 Conteos de activos
nexo.assets.counts.view
34.3 Ajustes y entradas
nexo.inventory.adjustments.view
nexo.inventory.adjustments.register
nexo.inventory.entries.view
nexo.inventory.entries.register
nexo.inventory.entries.override
34.4 Operación de ubicación e inventario
nexo.inventory.location_assignments.assign
nexo.inventory.lpns.view
nexo.inventory.movements.view
nexo.inventory.stock.view
nexo.inventory.production_batches.view
34.5 Traslados y retiros
nexo.inventory.transfers.view
nexo.inventory.transfers.create
nexo.inventory.withdrawals.view
nexo.inventory.withdrawals.register
34.6 Operación de bodega
nexo.inventory.warehouse_operations.view
nexo.inventory.stock_validations.perform
34.7 Conteos de inventario
nexo.inventory.stock_counts.view
nexo.inventory.stock_counts.perform
nexo.inventory.initial_counts.view
34.8 Remisiones
nexo.inventory.remissions.view
nexo.inventory.remissions.update
nexo.inventory.remissions.request
nexo.inventory.remissions.prepare
nexo.inventory.remissions.dispatch
nexo.inventory.remissions.receive
nexo.inventory.remissions.cancel
34.9 Ejecución logística
nexo.logistics.operations_board.view
nexo.logistics.operations.view
nexo.logistics.driver_operations.view
nexo.logistics.fulfillment.view
34.10 Facturación y variaciones
nexo.finance.internal_invoices.view
nexo.finance.internal_invoices.generate
nexo.finance.internal_invoices.issue
nexo.finance.internal_invoices.cancel
nexo.finance.internal_invoice_amounts.view
nexo.finance.internal_variances.view
nexo.finance.internal_variances.approve
nexo.finance.internal_variances.resolve
34.11 Analítica y trabajos
nexo.analytics.internal_reports.view
nexo.analytics.margin_reports.view
nexo.printing.jobs.view

Resultado total NEXO:

Configuración:        20
No configuración:     43
Total:                63

#### 35. Clasificación — NUMERA

35.1 Permiso configurativo

| Permiso                          | is_configuration |
| -------------------------------- | ---------------- |
| numera.finance.cost_centers.view | true             |

Los centros de costo son una estructura financiera de referencia.

35.2 Permisos no configurativos

| Permiso                                 | is_configuration |
| --------------------------------------- | ---------------- |
| numera.access                           | false            |
| numera.finance.expenses.view            | false            |
| numera.analytics.break_even.view        | false            |
| numera.analytics.profitability.view     | false            |
| numera.analytics.financial_reports.view | false            |

Los gastos son registros financieros.

Los reportes, rentabilidad y punto de equilibrio son resultados analíticos.

Resultado NUMERA:

Configuración:        1
No configuración:     5

#### 36. Clasificación — ORIGO

36.1 Permiso configurativo

| Permiso                          | is_configuration |
| -------------------------------- | ---------------- |
| origo.procurement.suppliers.view | true             |

Los proveedores forman un dato maestro reutilizado por:

órdenes de compra;
recepciones;
cotizaciones;
pagos;
evaluaciones;
abastecimiento.
36.2 Permisos no configurativos

| Permiso                                | is_configuration |
| -------------------------------------- | ---------------- |
| origo.access                           | false            |
| origo.procurement.purchase_orders.view | false            |
| origo.procurement.receipts.view        | false            |
| origo.catalog.product_reviews.view     | false            |

Las órdenes y recepciones son transacciones.

La revisión del maestro de productos representa un flujo de revisión.

No es el permiso que define o modifica directamente el producto.

Resultado ORIGO:

Configuración:        1
No configuración:     4

#### 37. Clasificación — Vento Pass

| Permiso     | is_configuration |
| ----------- | ---------------- |
| pass.access | false            |

Resultado PASS:

Configuración:        0
No configuración:     1

El permiso laboral de entrada no representa configuración del producto cliente.

#### 38. Clasificación — PULSO

| Permiso                            | is_configuration |
| ---------------------------------- | ---------------- |
| pulso.access                       | false            |
| pulso.delivery.deliveries.override | false            |

Resultado PULSO:

Configuración:        0
No configuración:     2

Confirmar excepcionalmente una entrega es una operación sensible.

No es configuración.

La futura configuración administrativa de PULSO deberá utilizar permisos atómicos separados.

#### 39. Clasificación — VISO: configuración

Los siguientes siete permisos tendrán:

is_configuration = true

| Permiso                                 | Recurso configurativo     |
| --------------------------------------- | ------------------------- |
| viso.organization.businesses.view       | Empresas registradas      |
| viso.catalog.commercial_categories.view | Categorías comerciales    |
| viso.content.content_blocks.view        | Bloques de contenido      |
| viso.content.menu.view                  | Menú administrable        |
| viso.content.website_content.view       | Contenido del sitio web   |
| viso.delivery.rates.view                | Tarifas de entrega        |
| viso.loyalty.products.view              | Productos de fidelización |

Estas capacidades consultan definiciones reutilizadas por:

aplicaciones;
sitios web;
menús;
domicilios;
campañas;
fidelización;
estructura organizacional.

#### 40. Clasificación — VISO: no configuración

Los siguientes diez permisos tendrán:

is_configuration = false

| Permiso                                     | Motivo                                     |
| ------------------------------------------- | ------------------------------------------ |
| viso.access                                 | Entrada a aplicación                       |
| viso.platform.app_updates.view              | Historial o información de actualizaciones |
| viso.workforce.employees.view               | Personas y expedientes                     |
| viso.workforce.staff_calendar.view          | Planificación                              |
| viso.workforce.schedules.view               | Planificación                              |
| viso.workforce.vacancies.view               | Proceso laboral                            |
| viso.authorization.context_simulations.view | Simulación                                 |
| viso.authorization.audit_logs.view          | Auditoría                                  |
| viso.finance.accounting.view                | Información contable                       |
| viso.loyalty.customers.view                 | Personas clientes                          |

Resultado VISO:

Configuración:         7
No configuración:     10
Total:                17

#### 41. Resumen de los 30 permisos configurativos

FOGO — 1
fogo.production.recipes.view
NEXO — 20
nexo.catalog.products.view
nexo.catalog.products.create
nexo.catalog.presentations.view
nexo.catalog.request_policies.view
nexo.catalog.categories.view
nexo.catalog.units.view

nexo.assets.items.view
nexo.assets.items.create
nexo.assets.groups.view

nexo.inventory.locations.view
nexo.inventory.location_catalog.update
nexo.inventory.zones.view
nexo.inventory.storage_positions.view

nexo.logistics.fulfillment_routes.view
nexo.logistics.supply_routes.view

nexo.finance.internal_prices.view
nexo.finance.cost_centers.view

nexo.printing.templates.update
nexo.settings.sites.view
nexo.settings.remission_policies.view
NUMERA — 1
numera.finance.cost_centers.view
ORIGO — 1
origo.procurement.suppliers.view
VISO — 7
viso.organization.businesses.view
viso.catalog.commercial_categories.view
viso.content.content_blocks.view
viso.content.menu.view
viso.content.website_content.view
viso.delivery.rates.view
viso.loyalty.products.view

Total:

1 + 20 + 1 + 1 + 7 = 30

#### 42. Permisos configurativos de solo lectura

Los siguientes 26 permisos tendrán:

is_configuration = true
is_read_only = true
fogo.production.recipes.view

nexo.catalog.products.view
nexo.catalog.presentations.view
nexo.catalog.request_policies.view
nexo.catalog.categories.view
nexo.catalog.units.view

nexo.assets.items.view
nexo.assets.groups.view

nexo.inventory.locations.view
nexo.inventory.zones.view
nexo.inventory.storage_positions.view

nexo.logistics.fulfillment_routes.view
nexo.logistics.supply_routes.view

nexo.finance.internal_prices.view
nexo.finance.cost_centers.view

nexo.settings.sites.view
nexo.settings.remission_policies.view

numera.finance.cost_centers.view

origo.procurement.suppliers.view

viso.organization.businesses.view
viso.catalog.commercial_categories.view
viso.content.content_blocks.view
viso.content.menu.view
viso.content.website_content.view
viso.delivery.rates.view
viso.loyalty.products.view

#### 43. Permisos que modifican configuración

Los siguientes cuatro permisos tendrán:

is_configuration = true
is_read_only = false
nexo.catalog.products.create
nexo.assets.items.create
nexo.inventory.location_catalog.update
nexo.printing.templates.update

Los cuatro requieren:

authorization_requirement = BASE_ONLY

Regla:

EL TURNO OPERATIVO
NO AUTORIZA POR SÍ SOLO
CAMBIOS DE CONFIGURACIÓN

#### 44. Permisos configurativos que admiten operación

Los siguientes 13 permisos tendrán:

is_configuration = true
is_operational = true
is_read_only = true
authorization_requirement = BASE_OR_OPERATIONAL
nexo.catalog.products.view
nexo.catalog.presentations.view
nexo.catalog.request_policies.view
nexo.catalog.categories.view
nexo.catalog.units.view

nexo.assets.items.view
nexo.assets.groups.view

nexo.inventory.locations.view
nexo.inventory.zones.view
nexo.inventory.storage_positions.view

nexo.logistics.fulfillment_routes.view
nexo.logistics.supply_routes.view

origo.procurement.suppliers.view

Estos permisos permiten consultar información configurada necesaria para ejecutar el trabajo.

No permiten modificarla desde el carril operativo.

#### 45. Permisos configurativos exclusivamente base

Los siguientes 17 permisos tendrán:

is_configuration = true
is_operational = false
authorization_requirement = BASE_ONLY
fogo.production.recipes.view

nexo.catalog.products.create
nexo.assets.items.create
nexo.inventory.location_catalog.update
nexo.finance.internal_prices.view
nexo.finance.cost_centers.view
nexo.printing.templates.update
nexo.settings.sites.view
nexo.settings.remission_policies.view

numera.finance.cost_centers.view

viso.organization.businesses.view
viso.catalog.commercial_categories.view
viso.content.content_blocks.view
viso.content.menu.view
viso.content.website_content.view
viso.delivery.rates.view
viso.loyalty.products.view

#### 46. Permisos legacy amplios

Los 21 permisos pendientes de descomposición no recibirán clasificación configurativa definitiva.

Estado conceptual:

is_configuration = null
catalog_status = deprecated
assignment_status = blocked
FOGO
fogo.production.recipes.manage

Este permiso probablemente contiene acciones configurativas, pero debe separarse en capacidades atómicas.

NEXO
nexo.settings.categories.manage
nexo.settings.units.manage
nexo.settings.supply_routes.manage
nexo.internal_prices.manage
nexo.cost_centers.manage
nexo.settings.sites.manage
nexo.settings.remissions.manage

Estos permisos parecen configurativos, pero manage no identifica qué acciones autorizan.

Podrían contener:

crear;
actualizar;
activar;
desactivar;
eliminar;
consultar.

No se clasifican hasta ser descompuestos.

NUMERA
numera.cost_centers.manage
numera.expenses.manage

cost_centers.manage probablemente contiene configuración.

expenses.manage probablemente contiene transacciones.

La clasificación debe ocurrir después de la descomposición.

ORIGO
origo.suppliers.manage

Probablemente contiene acciones configurativas sobre proveedores.

No se convertirá automáticamente en autoridad para crear, editar y eliminar proveedores.

PULSO
pulso.pos.main

Mezcla operaciones de caja.

No representa configuración atómica.

VISO
viso.app_navigation.manage
viso.employee_operational_profiles.manage
viso.menu.images.manage
viso.operational_points.manage
viso.site_operational_roles.manage
viso.staff.documents.manage
viso.staff.employee_photos.manage
viso.staff.manage
viso.staff.permissions.manage

Algunos contienen configuración y otros administración o datos personales.

No recibirán una clasificación común.

#### 47. Regla para descomposición de permisos configurativos

Cuando un permiso legacy amplio sea descompuesto, cada acción deberá clasificarse de manera independiente.

Ejemplo:

nexo.settings.categories.manage

Posible descomposición futura:

nexo.catalog.categories.view
→ is_configuration = true
→ is_read_only = true

nexo.catalog.categories.create
→ is_configuration = true
→ is_read_only = false

nexo.catalog.categories.update
→ is_configuration = true
→ is_read_only = false

nexo.catalog.categories.deactivate
→ is_configuration = true
→ is_read_only = false

No se copiará automáticamente la concesión amplia actual a todas las acciones nuevas.

#### 48. Permisos técnicos retirados

Los 14 permisos técnicos tendrán:

is_configuration = null
assignable = false
catalog_status = retired_technical
nexo.code.view
nexo.edit.view
nexo.login.view
nexo.new.view
nexo.no_access.view
nexo.open.view
nexo.page_tsx.view
nexo.quick.view
nexo.scanner.view
nexo.settings.view
nexo.setup.view
nexo.slug.view
origo.login.view
origo.no_access.view

Aunque algunos nombres como:

settings.view
setup.view

parezcan relacionados con configuración, no se clasifican porque representan rutas o pantallas técnicas.

Regla:

NOMBRE DE RUTA
≠
CAPACIDAD CONFIGURATIVA

#### 49. Aliases legacy

Los aliases no tendrán clasificación independiente.

Ejemplo:

nexo.products.view
→ nexo.catalog.products.view

Resultado:

is_configuration = true

Otro ejemplo:

nexo.stock.view
→ nexo.inventory.stock.view

Resultado:

is_configuration = false

Regla:

ALIAS
→ RESUELVE CLAVE CANÓNICA
→ HEREDA IS_CONFIGURATION

No se permitirá:

alias.is_configuration
≠
canonical.is_configuration

#### 50. El módulo no determina automáticamente la clasificación

Los módulos aportan contexto semántico, pero no sustituyen la clasificación.

Ejemplo dentro de inventory:

nexo.inventory.locations.view
→ configuración

nexo.inventory.stock.view
→ no configuración

Ejemplo dentro de finance:

nexo.finance.cost_centers.view
→ configuración

nexo.finance.internal_invoices.view
→ no configuración

Ejemplo dentro de workforce:

viso.workforce.employees.view
→ no configuración

Por tanto:

MODULE
≠
IS_CONFIGURATION

#### 51. La acción no determina automáticamente la clasificación

La acción view puede proteger configuración o información transaccional.

nexo.catalog.categories.view
→ configuración
nexo.inventory.remissions.view
→ no configuración

La acción create también puede proteger configuración o transacciones.

nexo.catalog.products.create
→ configuración
fogo.production.batches.create
→ no configuración

Regla:

RECURSO + EFECTO EMPRESARIAL
→ DEFINEN IS_CONFIGURATION

#### 52. El prefijo settings no es obligatorio

La configuración no se limita al módulo:

settings

Ejemplos configurativos fuera de settings:

nexo.catalog.products.view
nexo.assets.groups.view
nexo.inventory.locations.view
nexo.logistics.supply_routes.view
nexo.finance.cost_centers.view
viso.content.menu.view
origo.procurement.suppliers.view

Ejemplos técnicos legacy con settings que no son permisos válidos:

nexo.settings.view

Por tanto:

SETTINGS
NO ES LA ÚNICA FUENTE
DE CONFIGURACIÓN

#### 53. Configuración y alcance

Que un permiso sea configurativo no significa que tenga alcance global.

Ejemplos:

nexo.inventory.locations.view
→ puede limitarse a sede

nexo.logistics.supply_routes.view
→ puede limitarse a sede o tipo de sede

viso.delivery.rates.view
→ puede limitarse a empresa o sede

numera.finance.cost_centers.view
→ puede limitarse a empresa, sede
  o centro de costo

El alcance permitido se definirá en:

AUTH-CAT-011

#### 54. Configuración y sensibilidad

Una capacidad configurativa puede ser sensible.

Ejemplos probables:

nexo.finance.internal_prices.view
nexo.finance.cost_centers.view
viso.delivery.rates.view
nexo.printing.templates.update

La sensibilidad se definirá en:

AUTH-CAT-010

No se deduce automáticamente de:

is_configuration

#### 55. Configuración y dispositivos compartidos

Un dispositivo compartido podrá necesitar consultar configuración.

Ejemplo:

Kiosco de bodega
→ consulta ubicaciones
→ consulta zonas
→ consulta productos

Eso no significa que pueda modificarla.

La futura política deberá distinguir:

CONFIGURATION_READ

de:

CONFIGURATION_WRITE

La compatibilidad por permiso se definirá en:

AUTH-CAT-014

#### 56. Configuración y simulación

La simulación podrá consultar configuración necesaria para construir un contexto hipotético.

Podrá mostrar:

productos;
sedes;
áreas;
roles;
rutas;
políticas;
categorías;
permisos.

No podrá modificar configuración real.

La política de simulación se definirá en:

AUTH-CAT-015

#### 57. Configuración y auditoría

Toda modificación configurativa deberá registrar, como mínimo:

actor
permission_key
resource_type
resource_id
before
after
scope
source
occurred_at
request_id

Ejemplo:

nexo.inventory.location_catalog.update

deberá poder explicar:

quién cambió el catálogo;
qué ubicación fue afectada;
qué productos se agregaron;
qué productos se retiraron;
desde qué aplicación;
con qué alcance;
mediante qué autorización.

La implementación de auditoría no se realiza en esta tarea.

#### 58. Cómo se verá en VISO

58.1 Consulta de configuración
Consultar categorías
nexo.catalog.categories.view

Configuración
● Sí

Solo lectura
● Sí

Uso operativo
● Sí

Modalidad
Base u operativa
58.2 Modificación de configuración
Actualizar plantilla de impresión
nexo.printing.templates.update

Configuración
● Sí

Solo lectura
○ No

Uso operativo
○ No

Modalidad
Solo autorización base
58.3 Permiso transaccional
Recibir remisiones
nexo.inventory.remissions.receive

Configuración
○ No

Solo lectura
○ No

Uso operativo
● Sí

Modalidad
Solo autorización operativa
58.4 Consulta no configurativa
Consultar reportes de margen
nexo.analytics.margin_reports.view

Configuración
○ No

Solo lectura
● Sí

Uso operativo
○ No

#### 59. Edición en VISO

is_configuration no deberá modificarse libremente como una preferencia visual.

Representación esperada:

Tipo de capacidad
Configuración empresarial

Recurso
Categorías

Clasificación
is_configuration = true

La modificación de la clasificación exigirá:

cambio documental;
nueva versión del catálogo;
revisión de consumidores;
revisión de matrices;
revisión de dispositivos;
revisión de auditoría;
migración versionada.

#### 60. Filtros administrativos

VISO podrá ofrecer filtros como:

Todos
Configuración
No configuración
Configuración de solo lectura
Configuración modificable
Configuración disponible en operación
Configuración exclusivamente administrativa

Interpretación:

Configuración
→ is_configuration = true
Configuración modificable
→ is_configuration = true
  AND is_read_only = false
Configuración disponible en operación
→ is_configuration = true
  AND is_operational = true

Los filtros no conceden autorización.

#### 61. Validaciones futuras obligatorias

Todo permiso canónico activo deberá cumplir:

is_configuration no nulo

Además:

configuración modificable
→ is_read_only = false
configuración modificable actual
→ authorization_requirement = BASE_ONLY
configuración operativa actual
→ is_read_only = true
permiso legacy amplio
→ is_configuration nulo
permiso técnico retirado
→ is_configuration nulo
alias
→ sin clasificación independiente

#### 62. Códigos conceptuales de diagnóstico

La futura implementación podrá utilizar:

configuration_classification_missing
configuration_classification_mismatch
configuration_write_requires_base_lane
operational_configuration_write_not_allowed
configuration_permission_required
transaction_permission_used_for_configuration
configuration_permission_used_for_transaction
legacy_permission_configuration_unresolved
retired_permission_not_classifiable
alias_configuration_status_not_independent

No se implementan en esta tarea.

#### 63. Cambio futuro de clasificación

Cambiar:

is_configuration = false
→ is_configuration = true

puede introducir:

restricciones adicionales;
auditoría obligatoria;
límites de dispositivo;
separación entre lectura y escritura;
controles administrativos.

Cambiar:

is_configuration = true
→ is_configuration = false

puede eliminar protecciones necesarias sobre datos maestros o políticas.

Todo cambio requerirá:

decisión documental;
nueva versión del catálogo;
revisión de alcance;
revisión de sensibilidad;
revisión de matrices;
revisión de RPC;
revisión de RLS;
revisión de interfaces;
migración en vento-shell;
pruebas contractuales.

#### 64. Riesgos controlados

Riesgo 1 — Clasificar todo permiso administrativo como configuración

Control:

la clasificación depende del recurso
y su propósito empresarial
Riesgo 2 — Limitar configuración al módulo settings

Control:

datos maestros, topología,
políticas y contenido también cuentan
Riesgo 3 — Permitir modificación de configuración por turno

Control:

configuración mutadora actual
→ BASE_ONLY
Riesgo 4 — Bloquear consulta operativa de datos maestros

Control:

configuración de lectura
→ puede ser BASE_OR_OPERATIONAL
Riesgo 5 — Clasificar transacciones como configuración

Control:

registro de operación
≠
definición reutilizable
Riesgo 6 — Clasificar planificación como configuración

Control:

turnos y calendarios
→ planificación temporal
Riesgo 7 — Confundir reportes con configuración

Control:

resultado analítico
≠
parámetro del sistema
Riesgo 8 — Clasificar personas como configuración

Control:

trabajador o cliente
≠
dato maestro configurativo
Riesgo 9 — Clasificar permisos amplios

Control:

DECOMPOSE_REQUIRED
→ is_configuration = null
Riesgo 10 — Clasificar rutas técnicas por su nombre

Control:

RETIRE_TECHNICAL
→ sin clasificación empresarial

#### 65. Fuera del alcance

AUTH-CAT-009 no define:

qué permisos son sensibles;
los alcances permitidos;
requisitos de turno;
requisitos de check-in;
requisitos de área;
compatibilidad definitiva con dispositivos;
compatibilidad definitiva con simulación;
contratos de recurso;
permisos configurativos mutadores todavía faltantes;
descomposición física de permisos manage;
matrices de roles;
concesiones individuales;
denegaciones concretas;
migraciones;
columnas;
constraints;
RPC;
RLS;
guards;
componentes de interfaz.

Estos temas corresponden a:

AUTH-CAT-010 a AUTH-CAT-019
BLOQUE D
BLOQUE E
bloques de implementación

#### 66. Invariantes

Todo permiso canónico activo declara is_configuration.
is_configuration solo admite true o false para permisos canónicos activos.
La configuración representa definiciones reutilizables por operaciones futuras.
Los datos maestros pueden ser configuración.
Las políticas pueden ser configuración.
La topología operativa puede ser configuración.
Las plantillas pueden ser configuración.
El contenido administrable puede ser configuración.
Una transacción no es configuración.
Una persona no es configuración.
Un turno no es configuración.
Un reporte no es configuración.
Una auditoría no es configuración.
Una simulación no es configuración.
Un permiso de configuración puede ser de solo lectura.
Un permiso de configuración puede modificar datos.
Un permiso de configuración puede admitir el carril operativo para consulta.
El carril operativo no modifica configuración en el catálogo actual.
Toda modificación configurativa actual es BASE_ONLY.
is_configuration no concede acceso.
is_configuration no define alcance.
is_configuration no define sensibilidad.
is_configuration no define turno.
is_configuration no define check-in.
is_configuration no define dispositivo.
El módulo no determina automáticamente la clasificación.
La acción no determina automáticamente la clasificación.
El prefijo settings no es obligatorio.
El prefijo settings tampoco garantiza una capacidad canónica válida.
Los aliases heredan la clasificación canónica.
Los aliases no tienen clasificación independiente.
Los permisos amplios no se clasifican antes de descomponerse.
Los permisos técnicos retirados no se clasifican como capacidades empresariales.
Una contradicción de clasificación produce configuración inválida.
Un cambio de clasificación es un cambio contractual versionado.

#### 67. Criterios de aprobación

AUTH-CAT-009 podrá aprobarse cuando se acepte que:

is_configuration identifica definiciones, datos maestros, políticas, estructuras, plantillas y parámetros reutilizables.
Los 30 permisos configurativos quedan clasificados explícitamente.
Los 82 permisos restantes quedan clasificados como no configurativos.
Existen 26 permisos configurativos de solo lectura.
Existen 4 permisos que modifican configuración.
Los cuatro permisos configurativos mutadores son BASE_ONLY.
Los 13 permisos configurativos operativos son exclusivamente de consulta.
Productos, presentaciones, categorías y unidades son datos maestros configurativos.
Activos y grupos de activos son datos maestros configurativos.
Ubicaciones, zonas, posiciones y rutas son topología configurativa.
Proveedores, centros de costo y precios internos son datos maestros configurativos.
Turnos, personas, transacciones, reportes y auditorías no son configuración.
El módulo o la acción no determinan por sí solos la clasificación.
Los permisos amplios permanecen sin clasificación hasta su descomposición.
Los permisos técnicos retirados permanecen sin clasificación empresarial.
Los aliases heredan la clasificación de su clave canónica.
Esta tarea no implementa código, tablas ni migraciones.

#### 68. Decisión final

IS_CONFIGURATION = TRUE

→ LA CAPACIDAD CONSULTA O MODIFICA
  UNA DEFINICIÓN REUTILIZABLE

→ DATO MAESTRO
→ POLÍTICA
→ REGLA
→ ESTRUCTURA
→ TOPOLOGÍA
→ PLANTILLA
→ CONTENIDO
→ PARÁMETRO
IS_CONFIGURATION = FALSE

→ LA CAPACIDAD REPRESENTA
  ACCESO
  OPERACIÓN
  TRANSACCIÓN
  PLANIFICACIÓN
  PERSONA
  REPORTE
  AUDITORÍA
  SIMULACIÓN

Resultado:

112 PERMISOS CANÓNICOS

30 DE CONFIGURACIÓN
82 NO CONFIGURATIVOS

Regla principal:

LA CONFIGURACIÓN NO SE DEFINE
POR EL NOMBRE DEL MÓDULO

NO SE DEFINE
POR LA ACCIÓN

NO SE DEFINE
POR SER ADMINISTRATIVA

NO SE DEFINE
POR SER DE SOLO LECTURA

SE DEFINE PORQUE EL RECURSO
ESTABLECE UNA DEFINICIÓN
REUTILIZABLE POR OPERACIONES FUTURAS

Estado:

AUTH-CAT-001
→ APROBADA

AUTH-CAT-002
→ APROBADA

AUTH-CAT-003
→ APROBADA

AUTH-CAT-004
→ APROBADA

AUTH-CAT-005
→ APROBADA

AUTH-CAT-006
→ APROBADA

AUTH-CAT-007
→ APROBADA

AUTH-CAT-008
→ APROBADA

AUTH-CAT-009
→ APROBADA

### ✅ AUTH-CAT-010 — Clasificar permisos sensibles

#### 1. Estado de continuidad

Última tarea aprobada:

AUTH-CAT-009
Clasificar permisos de configuración

Tarea actual:

AUTH-CAT-010
Clasificar permisos sensibles

Siguiente tarea después de aprobación:

AUTH-CAT-011
Definir alcance permitido de cada permiso

Estado de implementación:

DEFINICIÓN DOCUMENTAL

No se realizan:

cambios en Supabase;
migraciones;
modificaciones de tablas;
cambios en RLS;
cambios en RPC;
cambios en aplicaciones;
modificaciones de matrices;
implementación de guards;
cambios en vento-shell.

Toda futura migración deberá crearse y documentarse en vento-shell.

#### 2. Problema que se resuelve

El catálogo canónico ya declara:

identidad técnica;
aplicación;
módulo;
recurso;
acción;
descripción humana;
modalidad de autorización;
participación del carril operativo;
clasificación de solo lectura;
clasificación de configuración.

Todavía falta identificar qué capacidades requieren controles reforzados debido a que su uso indebido, exposición o ejecución puede afectar materialmente:

personas;
información privada;
acceso al sistema;
horarios laborales;
secretos empresariales;
inventario;
trazabilidad;
custodia;
información financiera;
información comercial;
decisiones excepcionales;
auditoría;
seguridad del modelo de autorización;
configuración crítica.

Sin esta clasificación podrían aparecer errores como:

Permiso de solo lectura
→ considerado automáticamente no sensible
Permiso mutador
→ considerado automáticamente sensible
Permiso financiero de consulta
→ tratado como consulta ordinaria
Permiso operativo rutinario
→ sometido innecesariamente
  a controles excepcionales
Propietario o gerente general
→ bypass automático de controles sensibles
Dispositivo compartido
→ puede ejecutar cualquier permiso sensible
  del trabajador

Estas interpretaciones quedan prohibidas.

#### 3. Objetivo

Clasificar los 112 permisos canónicos activos mediante:

is_sensitive

Valores admitidos:

true
false

La propiedad responde exclusivamente:

¿La exposición o ejecución de esta capacidad
puede producir un impacto material
que justifique controles reforzados?

Resultado:

is_sensitive = true
→ requiere tratamiento reforzado

is_sensitive = false
→ continúa siendo una capacidad protegida,
  pero no requiere controles adicionales
  únicamente por sensibilidad

#### 4. Definición canónica de permiso sensible

Un permiso será sensible cuando permita consultar o ejecutar capacidades relacionadas con uno o más de estos dominios:

PERSONAL_DATA
WORKFORCE_CONTROL
ACCESS_CONTROL
AUTHORIZATION_SECURITY
BUSINESS_SECRET
FINANCIAL_DATA
COMMERCIAL_CONFIDENTIALITY
INVENTORY_INTEGRITY
CUSTODY_CONFIRMATION
EXCEPTIONAL_ACTION
CONFIGURATION_INTEGRITY
AUDIT_SECURITY

La clasificación es conservadora, pero no indiscriminada.

No toda información interna es sensible.

No toda modificación es sensible.

No toda consulta es ordinaria.

#### 5. Definición de permiso no sensible

Un permiso tendrá:

is_sensitive = false

cuando represente una capacidad interna ordinaria cuyo riesgo se controla adecuadamente mediante:

permiso explícito;
alcance correcto;
contexto operativo;
estado válido del recurso;
denegaciones;
trazabilidad ordinaria.

Ejemplos:

Consultar stock
Consultar ubicaciones
Solicitar remisiones
Preparar remisiones
Consultar categorías
Consultar trabajos de impresión

Que una capacidad no sea sensible no significa que sea pública.

Continúa requiriendo autorización.

Regla:

NO SENSIBLE
≠
PÚBLICO

NO SENSIBLE
≠
SIN PERMISO

NO SENSIBLE
≠
SIN AUDITORÍA

#### 6. Sensibilidad no equivale a mutación

Un permiso de solo lectura puede ser sensible.

Ejemplo:

nexo.analytics.margin_reports.view

is_read_only = true
is_sensitive = true

Un permiso mutador puede no clasificarse como sensible cuando representa una operación rutinaria, acotada y reversible dentro de su flujo normal.

Ejemplo:

nexo.inventory.remissions.request

is_read_only = false
is_sensitive = false

Por tanto:

IS_READ_ONLY
≠
IS_SENSITIVE

#### 7. Sensibilidad no equivale a operación

Un permiso operativo puede ser sensible:

nexo.inventory.remissions.receive

También puede no ser sensible:

nexo.inventory.remissions.prepare

Un permiso exclusivamente base puede ser sensible:

viso.finance.accounting.view

También puede no ser sensible:

viso.platform.app_updates.view

Por tanto:

IS_OPERATIONAL
≠
IS_SENSITIVE

#### 8. Sensibilidad no equivale a configuración

Una capacidad configurativa puede ser sensible:

nexo.finance.internal_prices.view
nexo.printing.templates.update

También puede no ser sensible:

nexo.catalog.categories.view
viso.content.menu.view

Una capacidad transaccional puede ser sensible:

nexo.finance.internal_invoices.issue

o no sensible:

nexo.inventory.remissions.request

Por tanto:

IS_CONFIGURATION
≠
IS_SENSITIVE

#### 9. Sensibilidad no cambia la modalidad

is_sensitive no modifica:

authorization_requirement

Ejemplo:

pulso.delivery.deliveries.override

authorization_requirement:
BASE_AND_OPERATIONAL

is_sensitive:
true

La sensibilidad añade tratamiento reforzado.

No sustituye la obligación de autorizar ambos carriles.

Otro ejemplo:

nexo.finance.internal_invoices.view

authorization_requirement:
BASE_ONLY

is_sensitive:
true

La sensibilidad no convierte el permiso en operativo.

#### 10. Motivos documentales de sensibilidad

Cada permiso sensible deberá conservar al menos una razón documental.

Códigos conceptuales:

PERSONAL_DATA
→ información identificable de trabajadores o clientes

WORKFORCE_CONTROL
→ decisiones que afectan horarios o programación laboral

ACCESS_CONTROL
→ creación o modificación de acceso

AUTHORIZATION_SECURITY
→ simulaciones, permisos o contexto de autorización

BUSINESS_SECRET
→ recetas, fórmulas o conocimiento reservado

FINANCIAL_DATA
→ gastos, facturas, precios, márgenes o contabilidad

COMMERCIAL_CONFIDENTIALITY
→ proveedores, compras y condiciones comerciales

INVENTORY_INTEGRITY
→ acciones o datos de corrección y control de existencias

CUSTODY_CONFIRMATION
→ aceptación, despacho o cancelación de entregas físicas

EXCEPTIONAL_ACTION
→ bypass u operación fuera del flujo ordinario

CONFIGURATION_INTEGRITY
→ configuración cuyo cambio puede afectar operaciones posteriores

AUDIT_SECURITY
→ registros utilizados para investigar acciones o accesos

Estas razones pueden coexistir.

Esta tarea no crea todavía una columna física para ellas.

#### 11. Información personal

Se consideran sensibles las capacidades que exponen o modifican:

documentos laborales;
fotografías de empleados;
datos de trabajadores;
información de clientes;
calendarios individuales;
horarios laborales;
información de miembros del equipo.

La sensibilidad aplica aunque la capacidad sea de solo lectura.

Regla:

DATOS PERSONALES
→ SENSIBLES

#### 12. Control laboral

Crear, modificar o cancelar turnos se clasifica como sensible porque puede afectar:

asistencia;
horarios;
liquidaciones;
responsabilidades;
operación de una sede;
elegibilidad para contexto operativo.

No se considera una modificación configurativa.

Sí se considera una decisión laboral sensible.

#### 13. Acceso y autorización

Se clasifican como sensibles las capacidades que pueden:

invitar personal;
consultar simulaciones de autorización;
consultar auditoría de operaciones;
permitir acciones excepcionales;
afectar controles de acceso.

Los permisos amplios legacy relacionados con:

staff.permissions.manage
site_operational_roles.manage
employee_operational_profiles.manage

permanecen sin clasificación definitiva hasta su descomposición.

Sus futuras capacidades atómicas deberán tratarse previsiblemente como sensibles.

#### 14. Secretos empresariales

Las recetas y el recetario operativo se clasifican como sensibles.

Pueden contener:

formulaciones;
cantidades;
rendimientos;
procesos;
técnicas;
versiones;
información diferenciadora del negocio.

Por tanto:

fogo.production.recipe_book.view
fogo.production.recipes.view

serán sensibles aunque sean permisos de solo lectura.

#### 15. Integridad de inventario

Se consideran sensibles las capacidades que pueden:

corregir inventario;
registrar entradas;
forzar entradas excepcionales;
trasladar existencias;
registrar retiros;
validar stock;
realizar conteos;
consultar diferencias o conteos de control;
alterar catálogos críticos de ubicación.

No se clasifican automáticamente como sensibles todas las consultas ordinarias de inventario.

Ejemplo:

nexo.inventory.stock.view
→ no sensible

pero:

nexo.inventory.stock_counts.view
→ sensible

Motivo:

El segundo puede exponer diferencias, controles internos y resultados utilizados para correcciones.

#### 16. Custodia y confirmaciones

Las acciones que confirman transferencia física o cierre de responsabilidad se clasifican como sensibles.

Incluyen:

despachar
recibir
cancelar

Estas acciones pueden:

mover responsabilidad entre actores;
afectar inventario;
cerrar etapas;
crear evidencia operativa;
impedir modificaciones posteriores.

Solicitar y preparar una remisión permanecen como acciones ordinarias no sensibles, aunque sean mutadoras y deban auditarse.

#### 17. Información financiera

Se consideran sensibles las capacidades que permiten consultar o modificar:

facturas internas;
importes;
precios internos;
variaciones;
centros de costo;
gastos;
rentabilidad;
punto de equilibrio;
márgenes;
reportes financieros;
contabilidad.

Regla:

SOLO LECTURA FINANCIERA
→ PUEDE SER SENSIBLE

#### 18. Información comercial

Se consideran sensibles las capacidades relacionadas con:

órdenes de compra;
recepciones de compras;
proveedores;
condiciones comerciales;
costos y abastecimiento.

No toda configuración comercial será sensible.

Ejemplo:

viso.delivery.rates.view
→ no sensible

Las tarifas de entrega vigentes son configuración operativa ordinaria.

Una futura capacidad para modificarlas podrá recibir una clasificación distinta.

#### 19. Acciones excepcionales

Toda capacidad cuyo propósito sea sobrepasar o reemplazar el flujo ordinario será sensible.

Ejemplos:

nexo.inventory.entries.override
pulso.delivery.deliveries.override

Regla:

OVERRIDE
→ SENSIBLE

Esto no significa que toda excepción futura deba usar la palabra override.

La clasificación depende del efecto empresarial.

#### 20. Configuración crítica

Una modificación configurativa se clasifica como sensible cuando puede afectar de forma amplia:

inventario;
trazabilidad;
documentos;
activos;
operaciones posteriores.

Permisos configurativos sensibles actuales:

nexo.catalog.products.create
nexo.assets.items.create
nexo.inventory.location_catalog.update
nexo.printing.templates.update

No toda configuración de lectura se considera sensible.

#### 21. Permisos `<app>.access`

Todos los permisos:

`<app>.access`

tendrán:

is_sensitive = false

Motivo:

El permiso únicamente permite entrar al contenedor de la aplicación.

No concede automáticamente:

datos sensibles;
operaciones sensibles;
navegación total;
acceso financiero;
acceso personal;
acciones excepcionales.

Regla:

APP.ACCESS
≠
ACCESO A INFORMACIÓN SENSIBLE

#### 22. Resultado general

Permisos canónicos activos:

112

Clasificación:

| Clasificación        | Cantidad |
| -------------------- | -------- |
| is_sensitive = true  | 60       |
| is_sensitive = false | 52       |
| Total                | 112      |

Distribución porcentual:

Sensibles       60 / 112 = 53,6 %
No sensibles    52 / 112 = 46,4 %

No existe una relación de equivalencia entre la clasificación sensible y la clasificación operativa.

#### 23. Distribución por aplicación

| Aplicación | Sensibles | No sensibles | Total |
| ---------- | --------- | ------------ | ----- |
| SHELL      | 0         | 1            | 1     |
| ANIMA      | 9         | 1            | 10    |
| AURA       | 0         | 1            | 1     |
| FOGO       | 3         | 3            | 6     |
| NEXO       | 32        | 31           | 63    |
| NUMERA     | 5         | 1            | 6     |
| ORIGO      | 3         | 2            | 5     |
| PASS       | 0         | 1            | 1     |
| PULSO      | 1         | 1            | 2     |
| VISO       | 7         | 10           | 17    |
| Total      | 60        | 52           | 112   |

#### 24. Relación con solo lectura

Cruce entre AUTH-CAT-008 y AUTH-CAT-010:

| Clasificación    | Sensibles | No sensibles | Total |
| ---------------- | --------- | ------------ | ----- |
| Solo lectura     | 31        | 49           | 80    |
| Con modificación | 29        | 3            | 32    |
| Total            | 60        | 52           | 112   |

Resultado:

31 permisos sensibles
son de solo lectura

29 permisos sensibles
pueden modificar estado

Los tres permisos mutadores no sensibles son:

nexo.inventory.location_assignments.assign
nexo.inventory.remissions.request
nexo.inventory.remissions.prepare

Son operaciones ordinarias, acotadas y sujetas al contexto del recurso.

#### 25. Relación con clasificación operativa

Cruce entre AUTH-CAT-007 y AUTH-CAT-010:

| Clasificación | Sensibles | No sensibles | Total |
| ------------- | --------- | ------------ | ----- |
| Operativos    | 24        | 34           | 58    |
| No operativos | 36        | 18           | 54    |
| Total         | 60        | 52           | 112   |

Esto confirma que la sensibilidad no depende del turno.

#### 26. Relación con configuración

Cruce entre AUTH-CAT-009 y AUTH-CAT-010:

| Clasificación    | Sensibles | No sensibles | Total |
| ---------------- | --------- | ------------ | ----- |
| Configuración    | 9         | 21           | 30    |
| No configuración | 51        | 31           | 82    |
| Total            | 60        | 52           | 112   |

Los nueve permisos configurativos sensibles son:

fogo.production.recipes.view

nexo.catalog.products.create
nexo.assets.items.create
nexo.inventory.location_catalog.update
nexo.finance.internal_prices.view
nexo.finance.cost_centers.view
nexo.printing.templates.update

numera.finance.cost_centers.view

origo.procurement.suppliers.view

#### 27. Clasificación — SHELL

| Permiso      | is_sensitive |
| ------------ | ------------ |
| shell.access | false        |

Resultado SHELL:

Sensibles:        0
No sensibles:     1

#### 28. Clasificación — ANIMA

28.1 Permiso no sensible

| Permiso      | is_sensitive |
| ------------ | ------------ |
| anima.access | false        |

28.2 Permisos sensibles

| Permiso                                   | Motivo principal  |
| ----------------------------------------- | ----------------- |
| anima.workforce.employee_documents.view   | PERSONAL_DATA     |
| anima.workforce.employee_documents.upload | PERSONAL_DATA     |
| anima.workforce.employee_documents.delete | PERSONAL_DATA     |
| anima.workforce.employee_photos.upload    | PERSONAL_DATA     |
| anima.workforce.team_members.view         | PERSONAL_DATA     |
| anima.workforce.staff_invitations.create  | ACCESS_CONTROL    |
| anima.attendance.shifts.create            | WORKFORCE_CONTROL |
| anima.attendance.shifts.update            | WORKFORCE_CONTROL |
| anima.attendance.shifts.cancel            | WORKFORCE_CONTROL |

Resultado ANIMA:

Sensibles:        9
No sensibles:     1
Total:           10

#### 29. Clasificación — AURA

| Permiso     | is_sensitive |
| ----------- | ------------ |
| aura.access | false        |

Resultado AURA:

Sensibles:        0
No sensibles:     1

#### 30. Clasificación — FOGO

30.1 Permisos sensibles

| Permiso                          | Motivo principal    |
| -------------------------------- | ------------------- |
| fogo.production.batches.create   | INVENTORY_INTEGRITY |
| fogo.production.recipe_book.view | BUSINESS_SECRET     |
| fogo.production.recipes.view     | BUSINESS_SECRET     |

Crear un lote puede afectar:

consumo;
trazabilidad;
rendimientos;
inventario;
producción real.
30.2 Permisos no sensibles

| Permiso                      | is_sensitive |
| ---------------------------- | ------------ |
| fogo.access                  | false        |
| fogo.production.batches.view | false        |
| fogo.production.orders.view  | false        |

Los lotes y órdenes continúan siendo información interna protegida.

No requieren controles reforzados únicamente por sensibilidad.

Resultado FOGO:

Sensibles:        3
No sensibles:     3
Total:            6

#### 31. Clasificación — NEXO: catálogo y activos

31.1 Permisos sensibles

| Permiso                      | Motivo principal        |
| ---------------------------- | ----------------------- |
| nexo.catalog.products.create | CONFIGURATION_INTEGRITY |
| nexo.assets.items.create     | CONFIGURATION_INTEGRITY |
| nexo.assets.counts.view      | INVENTORY_INTEGRITY     |

Crear productos o activos puede afectar:

inventario;
compras;
costos;
remisiones;
conteos;
trazabilidad;
reportes.

Consultar conteos de activos también es sensible porque puede revelar:

faltantes;
sobrantes;
diferencias patrimoniales;
resultados de control interno;
evidencia utilizada para posteriores correcciones.

31.2 Permisos no sensibles
nexo.access
nexo.catalog.products.view
nexo.catalog.presentations.view
nexo.catalog.request_policies.view
nexo.catalog.categories.view
nexo.catalog.units.view
nexo.assets.items.view
nexo.assets.groups.view

Consultar datos maestros ordinarios continúa requiriendo permiso y alcance.

No se clasifica automáticamente como sensible.

#### 32. Clasificación — NEXO: ajustes y entradas

32.1 Permisos sensibles

| Permiso                             | Motivo principal    |
| ----------------------------------- | ------------------- |
| nexo.inventory.adjustments.view     | INVENTORY_INTEGRITY |
| nexo.inventory.adjustments.register | INVENTORY_INTEGRITY |
| nexo.inventory.entries.register     | INVENTORY_INTEGRITY |
| nexo.inventory.entries.override     | EXCEPTIONAL_ACTION  |

Consultar ajustes es sensible porque puede revelar:

diferencias;
correcciones;
pérdidas;
errores;
responsables;
decisiones de regularización.
32.2 Permiso no sensible
nexo.inventory.entries.view

La consulta ordinaria de entradas continúa protegida por permiso y alcance.

No requiere tratamiento reforzado únicamente por sensibilidad.

#### 33. Clasificación — NEXO: ubicaciones y movimientos

33.1 Permiso sensible

| Permiso                                | Motivo principal        |
| -------------------------------------- | ----------------------- |
| nexo.inventory.location_catalog.update | CONFIGURATION_INTEGRITY |

33.2 Permisos no sensibles
nexo.inventory.locations.view
nexo.inventory.location_assignments.assign
nexo.inventory.lpns.view
nexo.inventory.movements.view
nexo.inventory.stock.view
nexo.inventory.production_batches.view

Asignar stock a una ubicación es una operación ordinaria.

Continúa siendo mutadora y auditable, pero no se clasifica como sensible.

#### 34. Clasificación — NEXO: traslados y retiros

34.1 Permisos sensibles

| Permiso                             | Motivo principal    |
| ----------------------------------- | ------------------- |
| nexo.inventory.transfers.create     | INVENTORY_INTEGRITY |
| nexo.inventory.withdrawals.register | INVENTORY_INTEGRITY |

34.2 Permisos no sensibles
nexo.inventory.transfers.view
nexo.inventory.withdrawals.view

#### 35. Clasificación — NEXO: control de stock

35.1 Permisos sensibles

| Permiso                                  | Motivo principal    |
| ---------------------------------------- | ------------------- |
| nexo.inventory.stock_validations.perform | INVENTORY_INTEGRITY |
| nexo.inventory.stock_counts.view         | INVENTORY_INTEGRITY |
| nexo.inventory.stock_counts.perform      | INVENTORY_INTEGRITY |
| nexo.inventory.initial_counts.view       | INVENTORY_INTEGRITY |

Los conteos y validaciones pueden revelar o producir:

diferencias;
faltantes;
sobrantes;
inventario inicial;
bases para ajustes;
evidencia de control interno.
35.2 Permisos no sensibles
nexo.inventory.zones.view
nexo.inventory.storage_positions.view
nexo.inventory.warehouse_operations.view

#### 36. Clasificación — NEXO: remisiones

36.1 Permisos sensibles

| Permiso                            | Motivo principal     |
| ---------------------------------- | -------------------- |
| nexo.inventory.remissions.update   | CUSTODY_CONFIRMATION |
| nexo.inventory.remissions.dispatch | CUSTODY_CONFIRMATION |
| nexo.inventory.remissions.receive  | CUSTODY_CONFIRMATION |
| nexo.inventory.remissions.cancel   | CUSTODY_CONFIRMATION |

Actualizar remisiones se clasifica como sensible mientras el permiso permita modificar información material del flujo.

La futura implementación deberá limitar:

campos editables;
estados editables;
actor;
sede;
propiedad;
momento de la edición.
36.2 Permisos no sensibles
nexo.inventory.remissions.view
nexo.inventory.remissions.request
nexo.inventory.remissions.prepare

Solicitar y preparar son pasos operativos ordinarios.

Esto no elimina:

validación de turno;
validación de sede;
validación de área;
estado del recurso;
auditoría;
atribución del actor.

#### 37. Clasificación — NEXO: logística

37.1 Permiso sensible

| Permiso                               | Motivo principal                  |
| ------------------------------------- | --------------------------------- |
| nexo.logistics.driver_operations.view | PERSONAL_DATA + WORKFORCE_CONTROL |

Consultar las operaciones asociadas a conductores puede revelar:

trabajador asignado;
actividades realizadas;
horarios;
rutas;
estado de operaciones;
trazabilidad laboral.

Por tanto, esta capacidad requiere tratamiento reforzado.

37.2 Permisos no sensibles

nexo.logistics.operations_board.view
nexo.logistics.operations.view
nexo.logistics.fulfillment.view
nexo.logistics.fulfillment_routes.view
nexo.logistics.supply_routes.view

Son capacidades internas.

No son públicas.

Su acceso continuará limitado por modalidad, alcance y recurso.

#### 38. Clasificación — NEXO: finanzas internas

Todos los permisos financieros canónicos actuales de NEXO serán sensibles.

| Permiso                                    | Motivo principal |
| ------------------------------------------ | ---------------- |
| nexo.finance.internal_invoices.view        | FINANCIAL_DATA   |
| nexo.finance.internal_invoices.generate    | FINANCIAL_DATA   |
| nexo.finance.internal_invoices.issue       | FINANCIAL_DATA   |
| nexo.finance.internal_invoices.cancel      | FINANCIAL_DATA   |
| nexo.finance.internal_invoice_amounts.view | FINANCIAL_DATA   |
| nexo.finance.internal_prices.view          | FINANCIAL_DATA   |
| nexo.finance.internal_variances.view       | FINANCIAL_DATA   |
| nexo.finance.internal_variances.approve    | FINANCIAL_DATA   |
| nexo.finance.internal_variances.resolve    | FINANCIAL_DATA   |
| nexo.finance.cost_centers.view             | FINANCIAL_DATA   |

Aprobar y resolver variaciones también implican:

FINANCIAL_DATA
+
EXCEPTIONAL_ACTION

#### 39. Clasificación — NEXO: analítica

| Permiso                              | Motivo principal |
| ------------------------------------ | ---------------- |
| nexo.analytics.internal_reports.view | FINANCIAL_DATA   |
| nexo.analytics.margin_reports.view   | FINANCIAL_DATA   |

Los márgenes y reportes internos pueden revelar:

costos;
rentabilidad;
estructura económica;
variaciones;
resultados por sede;
información competitiva.

#### 40. Clasificación — NEXO: impresión y settings

40.1 Permiso sensible

| Permiso                        | Motivo principal        |
| ------------------------------ | ----------------------- |
| nexo.printing.templates.update | CONFIGURATION_INTEGRITY |

Una plantilla puede afectar:

etiquetas;
identificadores;
documentos;
trazabilidad;
información impresa;
operación de dispositivos.
40.2 Permisos no sensibles
nexo.printing.jobs.view
nexo.settings.sites.view
nexo.settings.remission_policies.view

Consultar políticas o sedes no se considera sensible por sí mismo.

Modificar esas configuraciones podrá requerir futuros permisos sensibles separados.

Resultado total NEXO:

Sensibles:        32
No sensibles:     31
Total:            63

#### 41. Clasificación — NUMERA

41.1 Permiso no sensible

| Permiso       | is_sensitive |
| ------------- | ------------ |
| numera.access | false        |

41.2 Permisos sensibles

| Permiso                                 | Motivo principal |
| --------------------------------------- | ---------------- |
| numera.finance.cost_centers.view        | FINANCIAL_DATA   |
| numera.finance.expenses.view            | FINANCIAL_DATA   |
| numera.analytics.break_even.view        | FINANCIAL_DATA   |
| numera.analytics.profitability.view     | FINANCIAL_DATA   |
| numera.analytics.financial_reports.view | FINANCIAL_DATA   |

Resultado NUMERA:

Sensibles:        5
No sensibles:     1
Total:            6

#### 42. Clasificación — ORIGO

42.1 Permisos sensibles

| Permiso                                | Motivo principal           |
| -------------------------------------- | -------------------------- |
| origo.procurement.purchase_orders.view | COMMERCIAL_CONFIDENTIALITY |
| origo.procurement.receipts.view        | COMMERCIAL_CONFIDENTIALITY |
| origo.procurement.suppliers.view       | COMMERCIAL_CONFIDENTIALITY |

La consulta de proveedores se clasifica como sensible porque el recurso puede contener:

contactos;
identificaciones;
condiciones comerciales;
medios de pago;
acuerdos;
información tributaria;
datos bancarios futuros.

La futura implementación deberá evitar exponer todos los campos cuando solo se requiera seleccionar un proveedor.

42.2 Permisos no sensibles
origo.access
origo.catalog.product_reviews.view

La revisión de productos no se considera sensible mientras no incluya información financiera o comercial reservada.

Si en el futuro incorpora costos, condiciones o documentos, deberá separarse o reclasificarse.

Resultado ORIGO:

Sensibles:        3
No sensibles:     2
Total:            5

#### 43. Clasificación — Vento Pass

| Permiso     | is_sensitive |
| ----------- | ------------ |
| pass.access | false        |

Resultado PASS:

Sensibles:        0
No sensibles:     1

Este permiso laboral no concede acceso a datos de clientes.

#### 44. Clasificación — PULSO

44.1 Permiso no sensible

| Permiso      | is_sensitive |
| ------------ | ------------ |
| pulso.access | false        |

44.2 Permiso sensible

| Permiso                            | Motivo principal   |
| ---------------------------------- | ------------------ |
| pulso.delivery.deliveries.override | EXCEPTIONAL_ACTION |

La confirmación excepcional de una entrega puede reemplazar evidencia o validaciones ordinarias.

Por eso exige:

BASE_AND_OPERATIONAL
+
is_sensitive = true

Resultado PULSO:

Sensibles:        1
No sensibles:     1
Total:            2

#### 45. Clasificación — VISO

45.1 Permisos sensibles

| Permiso                                     | Motivo principal       |
| ------------------------------------------- | ---------------------- |
| viso.workforce.employees.view               | PERSONAL_DATA          |
| viso.workforce.staff_calendar.view          | PERSONAL_DATA          |
| viso.workforce.schedules.view               | WORKFORCE_CONTROL      |
| viso.authorization.context_simulations.view | AUTHORIZATION_SECURITY |
| viso.authorization.audit_logs.view          | AUDIT_SECURITY         |
| viso.finance.accounting.view                | FINANCIAL_DATA         |
| viso.loyalty.customers.view                 | PERSONAL_DATA          |

Las simulaciones de autorización son sensibles porque pueden revelar:

permisos;
bloqueos;
roles;
sedes;
áreas;
contexto operativo;
configuración de seguridad.

Los registros de auditoría son sensibles porque pueden revelar:

actores;
acciones;
errores;
decisiones;
recursos;
patrones de acceso.
45.2 Permisos no sensibles
viso.access
viso.platform.app_updates.view
viso.organization.businesses.view
viso.workforce.vacancies.view
viso.catalog.commercial_categories.view
viso.content.content_blocks.view
viso.content.menu.view
viso.content.website_content.view
viso.delivery.rates.view
viso.loyalty.products.view

Resultado VISO:

Sensibles:         7
No sensibles:     10
Total:            17

#### 46. Resumen de los 60 permisos sensibles

ANIMA — 9

anima.workforce.employee_documents.view
anima.workforce.employee_documents.upload
anima.workforce.employee_documents.delete
anima.workforce.employee_photos.upload
anima.workforce.team_members.view
anima.workforce.staff_invitations.create
anima.attendance.shifts.create
anima.attendance.shifts.update
anima.attendance.shifts.cancel

FOGO — 3

fogo.production.batches.create
fogo.production.recipe_book.view
fogo.production.recipes.view

NEXO — 32

nexo.catalog.products.create
nexo.assets.items.create
nexo.assets.counts.view

nexo.inventory.adjustments.view
nexo.inventory.adjustments.register
nexo.inventory.entries.register
nexo.inventory.entries.override
nexo.inventory.location_catalog.update
nexo.inventory.transfers.create
nexo.inventory.withdrawals.register
nexo.inventory.stock_validations.perform
nexo.inventory.stock_counts.view
nexo.inventory.stock_counts.perform
nexo.inventory.initial_counts.view
nexo.inventory.remissions.update
nexo.inventory.remissions.dispatch
nexo.inventory.remissions.receive
nexo.inventory.remissions.cancel

nexo.logistics.driver_operations.view

nexo.finance.internal_invoices.view
nexo.finance.internal_invoices.generate
nexo.finance.internal_invoices.issue
nexo.finance.internal_invoices.cancel
nexo.finance.internal_invoice_amounts.view
nexo.finance.internal_prices.view
nexo.finance.internal_variances.view
nexo.finance.internal_variances.approve
nexo.finance.internal_variances.resolve
nexo.finance.cost_centers.view

nexo.analytics.internal_reports.view
nexo.analytics.margin_reports.view

nexo.printing.templates.update

NUMERA — 5

numera.finance.cost_centers.view
numera.finance.expenses.view
numera.analytics.break_even.view
numera.analytics.profitability.view
numera.analytics.financial_reports.view

ORIGO — 3

origo.procurement.purchase_orders.view
origo.procurement.receipts.view
origo.procurement.suppliers.view

PULSO — 1

pulso.delivery.deliveries.override

VISO — 7

viso.workforce.employees.view
viso.workforce.staff_calendar.view
viso.workforce.schedules.view
viso.authorization.context_simulations.view
viso.authorization.audit_logs.view
viso.finance.accounting.view
viso.loyalty.customers.view

Total:

9 + 3 + 32 + 5 + 3 + 1 + 7 = 60

#### 47. Controles mínimos de permisos sensibles

La clasificación sensible no concede ni deniega por sí sola.

Sin embargo, todo permiso sensible deberá cumplir como mínimo:

1. Asignación explícita compatible.
2. Sin bypass por nombre de rol.
3. Actor efectivo identificado.
4. Empleado activo, cuando aplique.
5. Recurso y alcance resueltos.
6. Decisión de autorización auditable.
7. Denegación por defecto ante contexto incompleto.
8. Sin herencia por prefijo.
9. Sin wildcard implícito.
10. Sin concesión automática por app.access.

Los controles exactos de:

reautenticación;
confirmación;
doble aprobación;
restricción de dispositivo;
restricción de simulación;
expiración;
masking;
exportación;

se definirán en tareas posteriores.

#### 48. Sin bypass por nombre de rol

Los siguientes nombres no autorizan automáticamente permisos sensibles:

propietario
gerente_general
gerente
supervisor
contador

Regla:

NOMBRE DE ROL
≠
BYPASS SENSIBLE

El actor deberá tener:

permiso explícito;
carril compatible;
alcance válido;
recurso autorizado;
ausencia de denegación superior.

#### 49. Service role y procesos técnicos

Un proceso técnico podrá ejecutar una capacidad sensible únicamente cuando:

la operación técnica esté definida;
el permiso sea exacto;
exista actor empresarial atribuible;
el recurso esté identificado;
el alcance esté validado;
la ejecución sea auditable;
no se utilice un service role como bypass genérico.

Incorrecto:

service_role
→ puede ejecutar cualquier permiso sensible

Correcto:

proceso técnico exacto
+
actor autorizado
+
permiso exacto
+
recurso exacto
+
auditoría

#### 50. Permisos sensibles de solo lectura

Los 31 permisos sensibles de solo lectura no permiten automáticamente:

descargar;
exportar;
imprimir;
compartir;
copiar masivamente;
consultar todas las sedes;
consultar campos ocultos;
acceder desde cualquier dispositivo.

Regla:

VIEW
→ CONSULTA AUTORIZADA

VIEW
≠
EXPORT

VIEW
≠
ACCESO MASIVO

VIEW
≠
TODOS LOS CAMPOS

Cuando una exportación o impresión sensible sea necesaria, deberá existir una capacidad explícita.

#### 51. Permisos sensibles mutadores

Los 29 permisos sensibles mutadores deberán registrar como mínimo:

actor real
actor efectivo
permission_key
resource_type
resource_id
acción
estado anterior
estado posterior
sede
área
origen de la solicitud
request_id
fecha y hora
resultado

Cuando no sea viable conservar el contenido completo por privacidad, deberá registrarse:

identificador;
tipo de cambio;
metadatos;
hash o referencia;
sin duplicar innecesariamente información privada.

#### 52. Dispositivos compartidos

Un permiso sensible no será compatible automáticamente con un dispositivo compartido.

Estado hasta AUTH-CAT-014:

compatibilidad no definida
→ DENEGAR EN DISPOSITIVO COMPARTIDO

AUTH-CAT-014 deberá determinar individualmente:

permitido;
permitido con PIN;
permitido con confirmación;
permitido únicamente en dispositivo asignado;
prohibido.

La identidad técnica del dispositivo nunca reemplaza al actor efectivo.

#### 53. Simulación

La simulación no podrá ejecutar efectos reales de permisos sensibles.

Un permiso sensible de lectura tampoco será visible automáticamente en simulación.

La evaluación deberá distinguir:

WOULD_ALLOW
WOULD_DENY
INDETERMINATE

sin exponer necesariamente el contenido del recurso.

La compatibilidad exacta se definirá en AUTH-CAT-015.

#### 54. Sesiones y caché

Los datos obtenidos mediante permisos sensibles no deberán conservarse de forma indiscriminada en:

almacenamiento local;
caché pública;
logs de frontend;
URLs;
mensajes de error;
telemetría sin protección;
dispositivos compartidos después de cerrar sesión.

La estrategia técnica se definirá durante implementación.

Esta tarea únicamente establece que la clasificación deberá ser consumida por esas decisiones.

#### 55. Campo sensible dentro de recurso ordinario

Un recurso puede contener simultáneamente:

campos ordinarios;
campos sensibles.

Ejemplo:

Proveedor
├── nombre comercial
├── contacto
├── condiciones
├── identificación tributaria
└── datos bancarios

Si un permiso amplio expone todo el recurso, deberá clasificarse según el campo de mayor riesgo razonablemente accesible.

Alternativas futuras:

proyección limitada
field masking
permiso adicional
recurso separado

La clasificación sensible no sustituye la minimización de datos.

#### 56. Permisos legacy amplios

Los 21 permisos pendientes de descomposición no recibirán clasificación definitiva de sensibilidad.

Estado conceptual:

is_sensitive = null
catalog_status = deprecated
assignment_status = blocked
FOGO
fogo.production.recipes.manage

Probablemente contiene capacidades sensibles sobre secretos empresariales.

Debe descomponerse.

NEXO
nexo.settings.categories.manage
nexo.settings.units.manage
nexo.settings.supply_routes.manage
nexo.internal_prices.manage
nexo.cost_centers.manage
nexo.settings.sites.manage
nexo.settings.remissions.manage

Algunos contienen capacidades sensibles y otros no.

No se aplicará una única clasificación al permiso amplio.

NUMERA
numera.cost_centers.manage
numera.expenses.manage

Probablemente contienen capacidades financieras sensibles.

Deben dividirse por acción.

ORIGO
origo.suppliers.manage

Probablemente contiene modificaciones comerciales sensibles.

Debe descomponerse.

PULSO
pulso.pos.main

Puede contener operaciones ordinarias y acciones críticas.

No se clasificará como una sola capacidad.

VISO
viso.app_navigation.manage
viso.employee_operational_profiles.manage
viso.menu.images.manage
viso.operational_points.manage
viso.site_operational_roles.manage
viso.staff.documents.manage
viso.staff.employee_photos.manage
viso.staff.manage
viso.staff.permissions.manage

Varios contienen capacidades personales, operativas o de autorización sensibles.

Permanecen bloqueados hasta su descomposición.

#### 57. Permisos técnicos retirados

Los 14 permisos técnicos tendrán:

is_sensitive = null
assignable = false
catalog_status = retired_technical
nexo.code.view
nexo.edit.view
nexo.login.view
nexo.new.view
nexo.no_access.view
nexo.open.view
nexo.page_tsx.view
nexo.quick.view
nexo.scanner.view
nexo.settings.view
nexo.setup.view
nexo.slug.view
origo.login.view
origo.no_access.view

No se clasifican como sensibles ni no sensibles porque no representan capacidades empresariales.

#### 58. Aliases legacy

Los aliases no tendrán clasificación independiente.

Ejemplo:

nexo.internal_reports.full_margin
→ nexo.analytics.margin_reports.view

Resultado:

is_sensitive = true

Otro ejemplo:

nexo.stock.view
→ nexo.inventory.stock.view

Resultado:

is_sensitive = false

Regla:

ALIAS
→ RESUELVE CLAVE CANÓNICA
→ HEREDA IS_SENSITIVE

No se permitirá:

alias.is_sensitive
≠
canonical.is_sensitive

#### 59. Cómo se verá en VISO

59.1 Permiso sensible de lectura
Consultar reportes de margen
nexo.analytics.margin_reports.view

Sensible
● Sí

Solo lectura
● Sí

Motivo
Información financiera

Controles reforzados
Requeridos
59.2 Permiso sensible mutador
Recibir remisiones
nexo.inventory.remissions.receive

Sensible
● Sí

Solo lectura
○ No

Motivo
Confirmación de custodia

Auditoría
Obligatoria
59.3 Permiso no sensible de lectura
Consultar stock
nexo.inventory.stock.view

Sensible
○ No

Solo lectura
● Sí

Autorización ordinaria
Requerida
59.4 Permiso no sensible mutador
Solicitar remisiones
nexo.inventory.remissions.request

Sensible
○ No

Solo lectura
○ No

Tipo
Operación ordinaria

#### 60. Edición en VISO

is_sensitive no deberá modificarse como una preferencia visual ordinaria.

Representación esperada:

Clasificación de seguridad

Sensible
Sí

Motivo
Integridad de inventario

Definición
Catálogo canónico versionado

Cambiar la clasificación exigirá:

decisión documental explícita;
nueva versión del catálogo;
revisión de consumidores;
revisión de dispositivos;
revisión de simulación;
revisión de auditoría;
revisión de alcance;
migración versionada.

#### 61. Filtros administrativos

VISO podrá ofrecer:

Todos
Sensibles
No sensibles
Sensibles de lectura
Sensibles mutadores
Sensibles operativos
Sensibles financieros
Sensibles personales
Sensibles de inventario

Los filtros no conceden autorización.

#### 62. Validaciones futuras obligatorias

Todo permiso canónico activo deberá cumplir:

is_sensitive no nulo

Además:

permiso sensible
→ razón documental no vacía
permiso sensible mutador
→ auditoría obligatoria
permiso sensible
→ sin bypass por nombre de rol
permiso sensible
→ sin acceso implícito por app.access
permiso legacy amplio
→ is_sensitive nulo
permiso técnico retirado
→ is_sensitive nulo
alias
→ sin clasificación independiente

#### 63. Códigos conceptuales de diagnóstico

La futura implementación podrá utilizar:

sensitivity_classification_missing
sensitivity_reason_missing
sensitive_permission_required
sensitive_permission_denied
sensitive_actor_missing
sensitive_resource_missing
sensitive_scope_missing
sensitive_audit_required
sensitive_shared_device_not_allowed
sensitive_simulation_not_allowed
sensitive_export_not_allowed
sensitive_field_masking_required
legacy_permission_sensitivity_unresolved
retired_permission_not_classifiable
alias_sensitivity_not_independent

No se implementan en esta tarea.

#### 64. Cambio futuro de clasificación

Cambiar:

is_sensitive = false
→ is_sensitive = true

puede exigir:

controles de dispositivo;
auditoría adicional;
restricción de simulación;
minimización de datos;
confirmación;
masking;
revisión de roles.

Cambiar:

is_sensitive = true
→ is_sensitive = false

puede retirar protecciones necesarias.

Todo cambio requerirá:

decisión documental;
versión nueva del catálogo;
motivo registrado;
análisis de riesgos;
revisión de matrices;
revisión de RPC;
revisión de RLS;
revisión de frontend;
migración en vento-shell;
pruebas contractuales.

#### 65. Riesgos controlados

Riesgo 1 — Clasificar toda mutación como sensible

Control:

sensibilidad depende del impacto material
Riesgo 2 — Clasificar toda lectura como no sensible

Control:

datos personales, financieros,
comerciales y secretos pueden ser sensibles
Riesgo 3 — Permitir bypass por propietario

Control:

nombre del rol no reemplaza permiso
Riesgo 4 — Exponer información sensible mediante app.access

Control:

app.access solo permite entrada
Riesgo 5 — Permitir sensibles en dispositivos compartidos

Control:

compatibilidad individual
+
denegación mientras no esté definida
Riesgo 6 — Ejecutar sensibles durante simulación

Control:

simulación no produce efectos reales
Riesgo 7 — Confundir información interna con información sensible

Control:

clasificación según impacto material,
no según simple confidencialidad interna
Riesgo 8 — Exportar por tener permiso de consulta

Control:

view no implica export
Riesgo 9 — Clasificar permisos amplios

Control:

DECOMPOSE_REQUIRED
→ is_sensitive = null
Riesgo 10 — Clasificar rutas técnicas

Control:

RETIRE_TECHNICAL
→ sin clasificación empresarial

#### 66. Fuera del alcance

AUTH-CAT-010 no define:

niveles de sensibilidad;
requisitos exactos de reautenticación;
doble aprobación;
masking por campo;
permisos de exportación;
permisos de descarga;
permisos de impresión;
retención de datos;
cifrado;
alcances permitidos;
requisitos de turno;
requisitos de check-in;
requisitos de área;
compatibilidad definitiva con dispositivos;
compatibilidad definitiva con simulación;
contratos de recurso;
matrices de roles;
concesiones individuales;
denegaciones concretas;
migraciones;
columnas;
constraints;
RPC;
RLS;
guards.

Estos temas corresponden a:

AUTH-CAT-011 a AUTH-CAT-019
BLOQUE D
BLOQUE E
bloques de implementación

#### 67. Invariantes

Todo permiso canónico activo declara is_sensitive.
is_sensitive solo admite true o false para permisos canónicos activos.
Un permiso sensible requiere tratamiento reforzado.
Un permiso no sensible continúa requiriendo autorización.
Sensible no significa mutador.
Mutador no significa sensible.
Sensible no significa operativo.
Sensible no significa configurativo.
Sensible no modifica authorization_requirement.
Un permiso de solo lectura puede ser sensible.
Un permiso base puede ser sensible.
Un permiso operativo puede ser sensible.
Un permiso configurativo puede ser sensible.
Los datos personales son sensibles.
La información financiera definida en esta tarea es sensible.
Las recetas son sensibles.
Los overrides son sensibles.
Las confirmaciones de custodia definidas en esta tarea son sensibles.
Los conteos y ajustes de control definidos en esta tarea son sensibles.
app.access no es sensible.
app.access no concede información sensible.
No existe bypass sensible por nombre de rol.
El service role no es un bypass genérico.
Todo permiso sensible mutador exige auditoría.
view no implica exportación.
Un dispositivo compartido no hereda automáticamente permisos sensibles.
La simulación no ejecuta efectos sensibles.
La clasificación no sustituye alcance.
La clasificación no sustituye contexto.
La clasificación no sustituye recurso.
La clasificación no sustituye denegaciones.
Los aliases heredan la clasificación canónica.
Los aliases no tienen clasificación independiente.
Los permisos amplios no se clasifican antes de descomponerse.
Los permisos técnicos retirados no reciben clasificación empresarial.
Un cambio de sensibilidad es un cambio contractual versionado.

#### 68. Criterios de aprobación

AUTH-CAT-010 podrá aprobarse cuando se acepte que:

is_sensitive identifica capacidades cuyo uso o exposición puede producir impacto material.
Los 60 permisos sensibles quedan clasificados explícitamente.
Los 52 permisos restantes quedan clasificados como no sensibles.
Existen 31 permisos sensibles de solo lectura.
Existen 29 permisos sensibles mutadores.
Los datos personales y laborales definidos son sensibles.
Las recetas son secretos empresariales sensibles.
Los permisos financieros y analíticos definidos son sensibles.
Las órdenes, recepciones y proveedores de ORIGO son sensibles.
Los ajustes, conteos, validaciones y operaciones críticas de inventario definidas son sensibles.
Despachar, recibir, actualizar y cancelar remisiones son sensibles.
Solicitar y preparar remisiones no se clasifican como sensibles.
Las acciones override son sensibles.
Los permisos `<app>.access` no son sensibles.
Un permiso no sensible continúa requiriendo autorización.
No existe bypass por nombre de rol.
Los permisos amplios permanecen sin clasificación hasta su descomposición.
Los permisos técnicos retirados permanecen sin clasificación empresarial.
Los aliases heredan la clasificación de su clave canónica.
Esta tarea no implementa código, tablas ni migraciones.

#### 69. Decisión final

IS_SENSITIVE = TRUE

→ LA CAPACIDAD REQUIERE
  TRATAMIENTO REFORZADO
  POR EL IMPACTO DE SU
  EXPOSICIÓN O EJECUCIÓN
IS_SENSITIVE = FALSE

→ LA CAPACIDAD CONTINÚA PROTEGIDA
  POR AUTORIZACIÓN ORDINARIA
  SIN CONTROLES ADICIONALES
  ÚNICAMENTE POR SENSIBILIDAD

Resultado:

112 PERMISOS CANÓNICOS

60 SENSIBLES
52 NO SENSIBLES

Regla principal:

LA SENSIBILIDAD NO SE DEFINE
POR EL NOMBRE DE LA APLICACIÓN

NO SE DEFINE
POR SER OPERATIVO

NO SE DEFINE
POR MODIFICAR DATOS

NO SE DEFINE
POR SER DE SOLO LECTURA

SE DEFINE POR EL IMPACTO MATERIAL
QUE PUEDE PRODUCIR
LA EXPOSICIÓN O EJECUCIÓN
DE LA CAPACIDAD

Estado:

AUTH-CAT-001
→ APROBADA

AUTH-CAT-002
→ APROBADA

AUTH-CAT-003
→ APROBADA

AUTH-CAT-004
→ APROBADA

AUTH-CAT-005
→ APROBADA

AUTH-CAT-006
→ APROBADA

AUTH-CAT-007
→ APROBADA

AUTH-CAT-008
→ APROBADA

AUTH-CAT-009
→ APROBADA

AUTH-CAT-010
→ APROBADA
