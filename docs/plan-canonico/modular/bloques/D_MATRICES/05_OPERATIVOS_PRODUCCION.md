### ✅ AUTH-RBAC-014 — Crear matriz de produccion_cocina

#### 1. Identificación de la tarea

| Campo                     | Valor                                                              |
| ------------------------- | ------------------------------------------------------------------ |
| Bloque                    | BLOQUE D — Matrices canónicas de roles, excepciones y dispositivos |
| Tarea                     | AUTH-RBAC-014 — Crear matriz de produccion_cocina                  |
| Estado                    | APROBADA                                                           |
| Naturaleza                | Definición documental de matriz operativa de cocina central        |
| Implementación física     | No incluida                                                        |
| Catálogo evaluado         | 112 permisos canónicos vigentes                                    |
| Tarea anterior vigente    | AUTH-RBAC-013 — APROBADA                                           |
| Tarea posterior reservada | AUTH-RBAC-015 — Crear matriz de produccion_panaderia               |

Esta tarea no modifica Supabase, migraciones, tablas, RLS, RPC, aplicaciones, repositorios ni datasets físicos. La aplicación posterior deberá realizarse mediante AUTH-RBAC-025 y las migraciones versionadas del BLOQUE R en `vento-shell`.

#### 2. Objetivo

Definir, permiso por permiso, las capacidades que puede ejercer el rol operativo `produccion_cocina` durante un turno válido en Cocina Caliente del Centro de Producción, separando la ejecución productiva de la administración de recetas, la operación de bodega, la logística, las compras y la cocina satélite.

#### 3. Decisión principal

`produccion_cocina` representa la función temporal encargada de ejecutar producción de cocina caliente central a partir de órdenes y recetarios operativos publicados. Puede crear y consultar lotes de su área y registrar consumos de insumos trazables, pero no administra recetas maestras, inventario general, remisiones, compras, despacho ni otras áreas productivas.

```text
ACTOR IDENTIFICADO
+ TURNO PUBLICADO Y VIGENTE
+ ROL produccion_cocina
+ SEDE CENTRO DE PRODUCCIÓN
+ ÁREA ACTIVA COCINA CALIENTE
+ CHECK-IN CUANDO EL PERMISO LO EXIJA
+ PERMISO OPERATIVO EXPLÍCITO
+ ORDEN / RECETA / LOTE / INVENTARIO COMPATIBLE
= AUTORIZACIÓN OPERATIVA DE COCINA CENTRAL
```

No se admite:

```text
employees.role = cocinero → acceso permanente
produccion_cocina = cocinero_satelite
fogo.access = autorización total de FOGO
recetario operativo = administración del maestro de recetas
crear lote = cerrar, aprobar o alterar cualquier lote
registrar retiro = control general de inventario
Centro de Producción = acceso a panadería, repostería y bodega
plantilla production_center = rol automático
PIN del dispositivo = sustituto de turno, check-in o permiso
produccion_cocina = remisiones, compras o logística
```

#### 4. Resultado cuantitativo de la matriz

| Resultado                                    | Cantidad | Efecto                                                                                                                                      |
| -------------------------------------------- | -------: | ------------------------------------------------------------------------------------------------------------------------------------------- |
| Capacidades operativas asignadas             |       16 | Se conceden por el carril operativo dentro del contexto de Cocina Caliente y sobre órdenes, lotes, recetas operativas e inventario acotado. |
| Capacidades `BASE_AND_OPERATIONAL` asignadas |        0 | El rol operativo no recibe autoridad base adicional.                                                                                        |
| Capacidades no asignadas                     |       96 | Permanecen denegadas por defecto por pertenecer al carril base, a otras áreas productivas o a bodega, logística, compras y administración.  |
| Total evaluado                               |      112 | Sin omisiones ni duplicados.                                                                                                                |

La matriz contiene **16 concesiones operativas a nivel de clave** y **96 ausencias de concesión**. La ausencia de concesión produce denegación por defecto; no se crean filas `deny` redundantes.

#### 5. Perfiles de alcance utilizados

| Perfil                                 | Significado                                                                                                                  |
| -------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| `CTX-PROD-KITCHEN-FOGO-APP`            | Entrada operativa a FOGO con turno, rol, sede y área válidos. No concede capacidades internas.                               |
| `CTX-PROD-KITCHEN-ORDER`               | Órdenes destinadas o asignadas a Cocina Caliente dentro del periodo productivo autorizado.                                   |
| `CTX-PROD-KITCHEN-BATCH`               | Lotes de producción vinculados a órdenes, recetas y recursos del área activa.                                                |
| `CTX-PROD-KITCHEN-BATCH-CREATE`        | Creación trazable e idempotente de lotes para Cocina Caliente.                                                               |
| `CTX-PROD-KITCHEN-RECIPE-BOOK`         | Proyección operativa publicada de recetas aplicables; excluye el maestro administrativo completo.                            |
| `CTX-PROD-KITCHEN-NEXO-APP`            | Entrada operativa a NEXO para consumo y trazabilidad de insumos del área. No concede inventario general.                     |
| `CTX-PROD-KITCHEN-REF`                 | Consulta mínima de productos, presentaciones, categorías y unidades necesarias para interpretar recetas, órdenes y consumos. |
| `CTX-PROD-KITCHEN-INVENTORY-REF`       | Ubicaciones autorizadas y topología mínima necesaria para identificar el origen físico del insumo.                           |
| `CTX-PROD-KITCHEN-INVENTORY-STOCK`     | Existencias de insumos limitadas a Cocina Caliente y a las ubicaciones compatibles.                                          |
| `CTX-PROD-KITCHEN-INVENTORY-BATCH`     | Trazabilidad de inventario de lotes productivos vinculados al área y a sus órdenes.                                          |
| `CTX-PROD-KITCHEN-WITHDRAWAL`          | Consulta de consumos propios o relacionados con el lote productivo autorizado.                                               |
| `CTX-PROD-KITCHEN-WITHDRAWAL-REGISTER` | Registro de consumo de insumos contra orden o lote, con cantidad, unidad, ubicación, actor y trazabilidad.                   |

#### 6. Reglas obligatorias de la matriz

1. Cada concesión utiliza una clave canónica exacta; no existen wildcards, herencias implícitas ni autorización por nombre de rol.
2. El rol operativo efectivo procede exclusivamente del turno publicado y vigente. Los perfiles y dispositivos solo sugieren o restringen; nunca asignan el rol.
3. `produccion_cocina` requiere Centro de Producción y un área operativa concreta compatible con Cocina Caliente.
4. El área activa no se infiere desde el producto, la receta, el dispositivo ni la sede seleccionada; debe proceder del turno válido.
5. Las concesiones con prerrequisito `T` pueden consultarse antes del check-in, pero continúan exigiendo turno, rol, sede y área válidos cuando el permiso o el rol lo requieran.
6. Las concesiones con prerrequisito `T+C` requieren turno y check-in activos, sede y área coincidentes y recurso resoluble.
7. `fogo.access` y `nexo.access` solo permiten entrar a sus aplicaciones y cargar el estado del contexto. No funcionan como wildcards.
8. `fogo.production.orders.view` se limita a órdenes destinadas o asignadas a Cocina Caliente. No concede reasignar, aprobar, modificar o cancelar órdenes.
9. `fogo.production.recipe_book.view` expone únicamente la versión operativa publicada y aplicable. No concede `fogo.production.recipes.view`, edición, exportación masiva ni acceso administrativo al maestro.
10. `fogo.production.batches.create` exige orden y receta aplicables, cantidades, responsable, área, estado e idempotencia válidos. No autoriza cualquier transición posterior del lote.
11. La consulta de productos, presentaciones, categorías y unidades desde NEXO se limita a la proyección mínima necesaria para ejecutar producción y registrar consumos.
12. La consulta de stock, LPN, lotes y retiros se limita a insumos, ubicaciones, órdenes y lotes relacionados con Cocina Caliente; no concede inventario general de la sede.
13. `nexo.inventory.withdrawals.register` solo registra consumo trazable contra una orden o lote válido. No concede ajustes, entradas, traslados, conteos ni inventario negativo.
14. La creación del lote productivo y el registro de consumo son operaciones distintas; ninguna debe duplicar efectos de inventario ni sustituir la integración canónica entre FOGO y NEXO.
15. No se asignan remisiones: la recepción, preparación, despacho y transporte pertenecen a roles y procesos diferentes.
16. No se asignan compras ni recepciones de ORIGO; el acceso a proveedores u órdenes de compra no es necesario para ejecutar Cocina Caliente.
17. No se asignan capacidades de panadería, repostería o bodega por compartir la misma sede. Cada área conserva su rol y matriz propios.
18. APP-REVIEW, demo, pruebas, recursos aislados y sedes no habilitadas permanecen excluidos.
19. Las denegaciones individuales, estructurales, de recurso, dispositivo o aislamiento prevalecen sobre esta matriz.
20. Todo permiso nuevo se deniega hasta que una versión canónica posterior lo evalúe expresamente para `produccion_cocina`.

#### 7. Matriz canónica completa
##### 7.1 SHELL — 1 permisos

| Permiso        | Capacidad humana  | Modalidad   | Decisión para produccion_cocina | Alcance aprobado                                                       | Condición                                                                                              |
| -------------- | ----------------- | ----------- | ------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `shell.access` | Entrar a Vento OS | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.2 ANIMA — 10 permisos

| Permiso                                     | Capacidad humana                     | Modalidad   | Decisión para produccion_cocina | Alcance aprobado                                                       | Condición                                                                                              |
| ------------------------------------------- | ------------------------------------ | ----------- | ------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `anima.access`                              | Entrar a ANIMA                       | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.employee_documents.view`   | Consultar documentos de trabajadores | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.employee_documents.upload` | Cargar documentos de trabajadores    | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.employee_documents.delete` | Eliminar documentos de trabajadores  | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.employee_photos.upload`    | Cargar fotografías de trabajadores   | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.team_members.view`         | Consultar integrantes del equipo     | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.staff_invitations.create`  | Invitar trabajadores                 | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.attendance.shifts.create`            | Crear turnos                         | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.attendance.shifts.update`            | Actualizar turnos                    | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.attendance.shifts.cancel`            | Cancelar turnos                      | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.3 AURA — 1 permisos

| Permiso       | Capacidad humana | Modalidad   | Decisión para produccion_cocina | Alcance aprobado                                                       | Condición                                                                                              |
| ------------- | ---------------- | ----------- | ------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `aura.access` | Entrar a AURA    | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.4 FOGO — 6 permisos

| Permiso                            | Capacidad humana                | Modalidad             | Decisión para produccion_cocina | Alcance aprobado                                                                                                                                                          | Condición                                                                                                                                                                                                            |
| ---------------------------------- | ------------------------------- | --------------------- | ------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `fogo.access`                      | Entrar a FOGO                   | `BASE_OR_OPERATIONAL` | **ASIGNAR OPERATIVO**           | CTX-PROD-KITCHEN-FOGO-APP — turno publicado y vigente, rol `produccion_cocina`, Centro de Producción habilitado y área activa exacta de Cocina Caliente.                  | Carril operativo con prerrequisito `T`. Permite entrar a FOGO, ver el estado del contexto y los bloqueos. No concede por sí solo lotes, órdenes, recetario ni otra capacidad.                                        |
| `fogo.production.batches.view`     | Consultar lotes de producción   | `BASE_OR_OPERATIONAL` | **ASIGNAR OPERATIVO**           | CTX-PROD-KITCHEN-BATCH — lotes vinculados a órdenes y ejecución de Cocina Caliente dentro del Centro de Producción.                                                       | Turno y check-in activos. La consulta se limita a lotes del área productiva activa y a la información necesaria para ejecutar y verificar la producción; no concede información de otras áreas.                      |
| `fogo.production.batches.create`   | Crear lotes de producción       | `OPERATIONAL_ONLY`    | **ASIGNAR OPERATIVO**           | CTX-PROD-KITCHEN-BATCH-CREATE — creación de lotes para órdenes válidas asignadas a Cocina Caliente, con receta publicada, cantidades, unidad, responsable y trazabilidad. | Turno y check-in activos. La creación debe ser idempotente, validar orden, receta operativa, área, cantidades y estado, y atribuir el lote al actor efectivo. No permite editar recetas maestras.                    |
| `fogo.production.orders.view`      | Consultar órdenes de producción | `BASE_OR_OPERATIONAL` | **ASIGNAR OPERATIVO**           | CTX-PROD-KITCHEN-ORDER — órdenes de producción destinadas o asignadas a Cocina Caliente y vigentes para el turno o periodo operativo autorizado.                          | Carril operativo con prerrequisito `T`. Permite preparar la jornada consultando instrucciones y prioridades; no permite modificar, reasignar, aprobar ni cancelar órdenes.                                           |
| `fogo.production.recipe_book.view` | Consultar recetario operativo   | `OPERATIONAL_ONLY`    | **ASIGNAR OPERATIVO**           | CTX-PROD-KITCHEN-RECIPE-BOOK — proyección operativa publicada de recetas aplicables a órdenes de Cocina Caliente, con porciones, insumos, proceso y controles necesarios. | Carril operativo con prerrequisito `T`. Solo recetario operativo vigente y aplicable; sin costos, márgenes, secretos administrativos, versiones borrador, edición, exportación masiva ni acceso al maestro completo. |
| `fogo.production.recipes.view`     | Consultar recetas               | `BASE_ONLY`           | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                    | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                               |

##### 7.5 NEXO — 63 permisos

| Permiso                                      | Capacidad humana                         | Modalidad              | Decisión para produccion_cocina | Alcance aprobado                                                                                                                                | Condición                                                                                                                                                                                                                           |
| -------------------------------------------- | ---------------------------------------- | ---------------------- | ------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `nexo.access`                                | Entrar a NEXO                            | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**           | CTX-PROD-KITCHEN-NEXO-APP — turno publicado y vigente, rol `produccion_cocina`, Centro de Producción y área activa de Cocina Caliente.          | Carril operativo con prerrequisito `T`. Permite entrar a NEXO y ver el contexto del área. No concede por sí solo inventario, movimientos, retiros ni otra capacidad.                                                                |
| `nexo.catalog.products.view`                 | Consultar productos                      | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**           | CTX-PROD-KITCHEN-REF — productos e insumos vigentes aplicables a recetas, lotes o retiros de Cocina Caliente.                                   | Turno vigente. Proyección mínima de identificación; excluye costos, márgenes, proveedores, configuración y campos técnicos no necesarios.                                                                                           |
| `nexo.catalog.products.create`               | Crear productos                          | `BASE_ONLY`            | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.catalog.presentations.view`            | Consultar presentaciones                 | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**           | CTX-PROD-KITCHEN-REF — presentaciones, empaques y conversiones publicadas necesarias para interpretar insumos y cantidades productivas.         | Turno vigente. Solo lectura; no permite crear ni modificar presentaciones.                                                                                                                                                          |
| `nexo.catalog.request_policies.view`         | Consultar políticas de solicitud         | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Cocina Caliente.                                                               |
| `nexo.catalog.categories.view`               | Consultar categorías                     | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**           | CTX-PROD-KITCHEN-REF — categorías necesarias para localizar insumos y productos relacionados con Cocina Caliente.                               | Turno vigente. Solo lectura y búsqueda; no permite administrar categorías.                                                                                                                                                          |
| `nexo.catalog.units.view`                    | Consultar unidades                       | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**           | CTX-PROD-KITCHEN-REF — unidades, equivalencias y empaques publicados necesarios para recetas, lotes y consumos.                                 | Turno vigente. Solo lectura; no permite modificar unidades ni factores de conversión.                                                                                                                                               |
| `nexo.assets.items.view`                     | Consultar activos                        | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Cocina Caliente.                                                               |
| `nexo.assets.items.create`                   | Crear activos                            | `BASE_ONLY`            | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.assets.groups.view`                    | Consultar grupos de activos              | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Cocina Caliente.                                                               |
| `nexo.assets.counts.view`                    | Consultar conteos de activos             | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Cocina Caliente.                                                               |
| `nexo.inventory.adjustments.view`            | Consultar ajustes de inventario          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Cocina Caliente.                                                               |
| `nexo.inventory.adjustments.register`        | Registrar ajustes de inventario          | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | Capacidad combinada o excepcional. Requiere autoridad base explícita además del contexto operativo; esta matriz no aporta el carril base.                                                                                           |
| `nexo.inventory.entries.view`                | Consultar entradas de inventario         | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Cocina Caliente.                                                               |
| `nexo.inventory.entries.register`            | Registrar entradas de inventario         | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Cocina Caliente.                                                               |
| `nexo.inventory.entries.override`            | Registrar entradas excepcionales         | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | Capacidad combinada o excepcional. Requiere autoridad base explícita además del contexto operativo; esta matriz no aporta el carril base.                                                                                           |
| `nexo.inventory.locations.view`              | Consultar ubicaciones de inventario      | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**           | CTX-PROD-KITCHEN-INVENTORY-REF — ubicaciones activas desde las que Cocina Caliente está autorizada a consumir o consultar insumos.              | Turno vigente y área activa válida. La consulta se limita a topología necesaria para la operación; no concede asignar ubicaciones ni administrar su catálogo.                                                                       |
| `nexo.inventory.location_assignments.assign` | Asignar ubicaciones de inventario        | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Cocina Caliente.                                                               |
| `nexo.inventory.location_catalog.update`     | Actualizar el catálogo de una ubicación  | `BASE_ONLY`            | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.inventory.lpns.view`                   | Consultar LPN                            | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**           | CTX-PROD-KITCHEN-INVENTORY-LPN — LPN o contenedores relacionados con insumos disponibles para Cocina Caliente o con el lote productivo activo.  | Turno y check-in activos. Debe limitar contenido, posición, custodia y trazabilidad al recurso que el actor necesita identificar; no concede movimientos ni reasignaciones.                                                         |
| `nexo.inventory.movements.view`              | Consultar movimientos de inventario      | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Cocina Caliente.                                                               |
| `nexo.inventory.stock.view`                  | Consultar stock                          | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**           | CTX-PROD-KITCHEN-INVENTORY-STOCK — existencias de insumos disponibles para consumo autorizado por Cocina Caliente en ubicaciones compatibles.   | Turno y check-in activos. Consulta sensible y acotada al área, ubicación, producto y lote aplicables; no permite consultar inventario general de la sede ni de otras áreas.                                                         |
| `nexo.inventory.production_batches.view`     | Consultar lotes vinculados al inventario | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**           | CTX-PROD-KITCHEN-INVENTORY-BATCH — trazabilidad de inventario derivada de lotes creados por Cocina Caliente o vinculados a sus órdenes activas. | Turno y check-in activos. Solo lectura de disponibilidad, lote y trazabilidad necesaria para verificar el efecto productivo; no concede ajustes, entradas manuales ni movimientos.                                                  |
| `nexo.inventory.transfers.view`              | Consultar traslados de inventario        | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Cocina Caliente.                                                               |
| `nexo.inventory.transfers.create`            | Crear traslados de inventario            | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Cocina Caliente.                                                               |
| `nexo.inventory.withdrawals.view`            | Consultar retiros de inventario          | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**           | CTX-PROD-KITCHEN-WITHDRAWAL — retiros o consumos asociados al actor, al lote activo o a Cocina Caliente dentro del turno vigente.               | Turno y check-in activos. La consulta se limita a consumos propios o del recurso productivo autorizado; no expone retiros generales de otras áreas o trabajadores.                                                                  |
| `nexo.inventory.withdrawals.register`        | Registrar retiros de inventario          | `OPERATIONAL_ONLY`     | **ASIGNAR OPERATIVO**           | CTX-PROD-KITCHEN-WITHDRAWAL-REGISTER — registro de consumo de insumos desde ubicaciones autorizadas hacia una orden o lote de Cocina Caliente.  | Turno y check-in activos. Validar stock, presentación, unidad, lote, ubicación, cantidad, receta u orden relacionada, idempotencia y concurrencia. No permite inventario negativo, ajustes, traslados ni consumos sin trazabilidad. |
| `nexo.inventory.zones.view`                  | Consultar zonas de almacenamiento        | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Cocina Caliente.                                                               |
| `nexo.inventory.storage_positions.view`      | Consultar posiciones de almacenamiento   | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Cocina Caliente.                                                               |
| `nexo.inventory.warehouse_operations.view`   | Consultar operaciones de bodega          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Cocina Caliente.                                                               |
| `nexo.inventory.stock_validations.perform`   | Ejecutar validaciones de inventario      | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Cocina Caliente.                                                               |
| `nexo.inventory.stock_counts.view`           | Consultar conteos de inventario          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Cocina Caliente.                                                               |
| `nexo.inventory.stock_counts.perform`        | Ejecutar conteos de inventario           | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Cocina Caliente.                                                               |
| `nexo.inventory.initial_counts.view`         | Consultar conteos iniciales              | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Cocina Caliente.                                                               |
| `nexo.inventory.remissions.view`             | Consultar remisiones                     | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Cocina Caliente.                                                               |
| `nexo.inventory.remissions.update`           | Actualizar remisiones                    | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Cocina Caliente.                                                               |
| `nexo.inventory.remissions.request`          | Solicitar remisiones                     | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Cocina Caliente.                                                               |
| `nexo.inventory.remissions.prepare`          | Preparar remisiones                      | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Cocina Caliente.                                                               |
| `nexo.inventory.remissions.dispatch`         | Despachar remisiones                     | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Cocina Caliente.                                                               |
| `nexo.inventory.remissions.receive`          | Recibir remisiones                       | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Cocina Caliente.                                                               |
| `nexo.inventory.remissions.cancel`           | Cancelar remisiones                      | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Cocina Caliente.                                                               |
| `nexo.logistics.operations_board.view`       | Consultar tablero logístico              | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Cocina Caliente.                                                               |
| `nexo.logistics.operations.view`             | Consultar operaciones logísticas         | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Cocina Caliente.                                                               |
| `nexo.logistics.driver_operations.view`      | Consultar operaciones de conductores     | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Cocina Caliente.                                                               |
| `nexo.logistics.fulfillment.view`            | Consultar cumplimiento logístico         | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Cocina Caliente.                                                               |
| `nexo.logistics.fulfillment_routes.view`     | Consultar rutas de cumplimiento          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Cocina Caliente.                                                               |
| `nexo.logistics.supply_routes.view`          | Consultar rutas de abastecimiento        | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Cocina Caliente.                                                               |
| `nexo.finance.internal_invoices.view`        | Consultar facturas internas              | `BASE_ONLY`            | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.finance.internal_invoices.generate`    | Generar facturas internas                | `BASE_ONLY`            | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.finance.internal_invoices.issue`       | Emitir facturas internas                 | `BASE_ONLY`            | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.finance.internal_invoices.cancel`      | Cancelar facturas internas               | `BASE_ONLY`            | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.finance.internal_invoice_amounts.view` | Consultar valores de facturas internas   | `BASE_ONLY`            | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.finance.internal_prices.view`          | Consultar precios internos               | `BASE_ONLY`            | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.finance.internal_variances.view`       | Consultar variaciones internas           | `BASE_ONLY`            | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.finance.internal_variances.approve`    | Aprobar variaciones internas             | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | Capacidad combinada o excepcional. Requiere autoridad base explícita además del contexto operativo; esta matriz no aporta el carril base.                                                                                           |
| `nexo.finance.internal_variances.resolve`    | Resolver variaciones internas            | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | Capacidad combinada o excepcional. Requiere autoridad base explícita además del contexto operativo; esta matriz no aporta el carril base.                                                                                           |
| `nexo.finance.cost_centers.view`             | Consultar centros de costo en NEXO       | `BASE_ONLY`            | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.analytics.internal_reports.view`       | Consultar reportes internos              | `BASE_ONLY`            | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.analytics.margin_reports.view`         | Consultar reportes de margen             | `BASE_ONLY`            | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.printing.templates.update`             | Editar plantillas de impresión           | `BASE_ONLY`            | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.printing.jobs.view`                    | Consultar trabajos de impresión          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Cocina Caliente.                                                               |
| `nexo.settings.sites.view`                   | Consultar configuración de sedes         | `BASE_ONLY`            | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.settings.remission_policies.view`      | Consultar políticas de remisiones        | `BASE_ONLY`            | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                          | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |

##### 7.6 NUMERA — 6 permisos

| Permiso                                   | Capacidad humana               | Modalidad   | Decisión para produccion_cocina | Alcance aprobado                                                       | Condición                                                                                              |
| ----------------------------------------- | ------------------------------ | ----------- | ------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `numera.access`                           | Entrar a NUMERA                | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.finance.cost_centers.view`        | Consultar centros de costo     | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.finance.expenses.view`            | Consultar gastos               | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.analytics.break_even.view`        | Consultar punto de equilibrio  | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.analytics.profitability.view`     | Consultar rentabilidad         | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.analytics.financial_reports.view` | Consultar reportes financieros | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.7 ORIGO — 5 permisos

| Permiso                                  | Capacidad humana                  | Modalidad             | Decisión para produccion_cocina | Alcance aprobado                                                       | Condición                                                                                                                |
| ---------------------------------------- | --------------------------------- | --------------------- | ------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| `origo.access`                           | Entrar a ORIGO                    | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece a compras, recepción o proveedores y no corresponde a la ejecución productiva de Cocina Caliente. |
| `origo.procurement.purchase_orders.view` | Consultar órdenes de compra       | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece a compras, recepción o proveedores y no corresponde a la ejecución productiva de Cocina Caliente. |
| `origo.procurement.receipts.view`        | Consultar recepciones de compra   | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece a compras, recepción o proveedores y no corresponde a la ejecución productiva de Cocina Caliente. |
| `origo.procurement.suppliers.view`       | Consultar proveedores             | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece a compras, recepción o proveedores y no corresponde a la ejecución productiva de Cocina Caliente. |
| `origo.catalog.product_reviews.view`     | Consultar revisiones de productos | `BASE_ONLY`           | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                   |

##### 7.8 VENTO PASS — 1 permisos

| Permiso       | Capacidad humana    | Modalidad   | Decisión para produccion_cocina | Alcance aprobado                                                       | Condición                                                                                              |
| ------------- | ------------------- | ----------- | ------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `pass.access` | Entrar a Vento Pass | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.9 PULSO — 2 permisos

| Permiso                              | Capacidad humana                        | Modalidad              | Decisión para produccion_cocina | Alcance aprobado                                                       | Condición                                                                                                                                 |
| ------------------------------------ | --------------------------------------- | ---------------------- | ------------------------------- | ---------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| `pulso.access`                       | Entrar a PULSO                          | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | PULSO pertenece a la operación comercial del punto de venta y no corresponde a la producción central de Cocina Caliente.                  |
| `pulso.delivery.deliveries.override` | Confirmar entregas de forma excepcional | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad combinada o excepcional. Requiere autoridad base explícita además del contexto operativo; esta matriz no aporta el carril base. |

##### 7.10 VISO — 17 permisos

| Permiso                                       | Capacidad humana                          | Modalidad   | Decisión para produccion_cocina | Alcance aprobado                                                       | Condición                                                                                              |
| --------------------------------------------- | ----------------------------------------- | ----------- | ------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `viso.access`                                 | Entrar a VISO                             | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.platform.app_updates.view`              | Consultar actualizaciones de aplicaciones | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.organization.businesses.view`           | Consultar empresas y unidades de negocio  | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.workforce.employees.view`               | Consultar trabajadores                    | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.workforce.staff_calendar.view`          | Consultar calendario del personal         | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.workforce.schedules.view`               | Consultar programación de turnos          | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.workforce.vacancies.view`               | Consultar vacantes                        | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.authorization.context_simulations.view` | Consultar simulaciones de autorización    | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.authorization.audit_logs.view`          | Consultar auditoría de autorización       | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.catalog.commercial_categories.view`     | Consultar categorías comerciales          | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.content.content_blocks.view`            | Consultar bloques de contenido            | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.content.menu.view`                      | Consultar menú                            | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.content.website_content.view`           | Consultar contenido del sitio web         | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.finance.accounting.view`                | Consultar información contable            | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.delivery.rates.view`                    | Consultar tarifas de entrega              | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.loyalty.products.view`                  | Consultar productos de fidelización       | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.loyalty.customers.view`                 | Consultar clientes de fidelización        | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |



#### 8. Resumen por aplicación

| Aplicación | Permisos canónicos | Asignados | No asignados |
| ---------- | -----------------: | --------: | -----------: |
| SHELL      |                  1 |         0 |            1 |
| ANIMA      |                 10 |         0 |           10 |
| AURA       |                  1 |         0 |            1 |
| FOGO       |                  6 |         5 |            1 |
| NEXO       |                 63 |        11 |           52 |
| NUMERA     |                  6 |         0 |            6 |
| ORIGO      |                  5 |         0 |            5 |
| VENTO PASS |                  1 |         0 |            1 |
| PULSO      |                  2 |         0 |            2 |
| VISO       |                 17 |         0 |           17 |
| **Total**  |            **112** |    **16** |       **96** |

#### 9. Flujo operativo autorizado

```text
TURNO VÁLIDO DE COCINA CALIENTE
        ↓
ENTRAR A FOGO
        ↓
CONSULTAR ÓRDENES Y RECETARIO OPERATIVO
        ↓
TURNO + CHECK-IN
        ↓
CONSULTAR / CREAR LOTE DE PRODUCCIÓN
        ↓
ENTRAR A NEXO
        ↓
CONSULTAR INSUMOS, UBICACIONES Y STOCK AUTORIZADO
        ↓
REGISTRAR CONSUMO CONTRA ORDEN O LOTE
        ↓
CONSULTAR TRAZABILIDAD DEL LOTE EN INVENTARIO
```

La matriz permite iniciar la ejecución productiva y registrar consumos trazables, pero el catálogo vigente no contiene todavía permisos atómicos para todas las transiciones del lote, control de calidad, rendimiento, merma, cierre productivo o ingreso automático del producto terminado.

#### 10. Capacidades expresamente no concedidas

- cualquier permiso exclusivo del carril base;
- administración del maestro completo de recetas;
- creación, modificación o archivo de recetas;
- modificación, reasignación, aprobación o cancelación de órdenes de producción;
- cierre, liberación, rechazo o reversión de lotes cuando no exista permiso atómico aprobado;
- producción de panadería, galletería, repostería o pastelería por inferencia;
- inventario general del Centro de Producción o de otras áreas;
- movimientos, entradas, ajustes, traslados, conteos o validaciones de stock;
- asignación de ubicaciones, administración de LPN, zonas o posiciones;
- preparación, despacho, transporte, recepción o cancelación de remisiones;
- compras, órdenes de compra, proveedores y recepciones de ORIGO;
- operación comercial, caja, pedidos, pagos o fidelización de PULSO;
- facturas internas, costos, márgenes, gastos, contabilidad o NUMERA;
- gestión de personal, turnos, permisos, seguridad o VISO;
- acceso a APP-REVIEW o a sedes y áreas no habilitadas;
- cualquier permiso futuro no evaluado expresamente.

#### 11. Brechas del catálogo identificadas

El catálogo vigente permite consultar órdenes, consultar el recetario operativo, consultar y crear lotes, pero no representa todavía de forma atómica varias operaciones esenciales del ciclo productivo:

- aceptar o iniciar una orden de producción;
- cambiar el estado de una orden o lote;
- pausar, reanudar, cancelar o reabrir una ejecución;
- registrar cantidades planificadas, producidas, rechazadas y aprovechables;
- registrar consumo teórico y consumo real por insumo;
- registrar sustituciones de ingredientes autorizadas;
- registrar merma, desperdicio, reproceso y causas;
- registrar tiempos, temperatura, responsables y controles del proceso;
- registrar control de calidad, liberación o rechazo;
- confirmar producto terminado, presentación, lote, vencimiento y ubicación destino;
- integrar de forma idempotente FOGO con movimientos de inventario en NEXO;
- corregir una producción mediante reversión trazable, no mediante edición destructiva;
- imprimir etiquetas o documentos operativos del lote con permiso propio;
- consultar historial y evidencia del lote dentro del área autorizada;
- distinguir creación del lote, ejecución, terminación, liberación y cierre administrativo.

Estas brechas no amplían la matriz. `fogo.production.batches.create` no podrá interpretarse como permiso para ejecutar todas las transiciones del ciclo de vida ni para producir efectos de inventario no definidos contractualmente.

#### 12. Dispositivo compartido de producción

La plantilla legacy `production_center` puede habilitar FOGO, NEXO y SHELL como superficies disponibles, pero no concede ninguna matriz. Antes de ejecutar una acción deberá existir:

```text
DISPOSITIVO TÉCNICO ACTIVO
+ ACTOR IDENTIFICADO
+ PIN O AUTENTICACIÓN EXIGIDA
+ TURNO produccion_cocina VÁLIDO
+ ÁREA DEL DISPOSITIVO = ÁREA DEL TURNO = COCINA CALIENTE
+ CHECK-IN CUANDO CORRESPONDA
+ PERMISO DE ESTA MATRIZ
= ACCIÓN ATRIBUIBLE AL TRABAJADOR
```

La política `same_site_active_worker` de la plantilla legacy es insuficiente porque permitiría actores de otras áreas del Centro de Producción. La implementación futura deberá exigir coincidencia de área y rol operativo, y reemplazar `navigation_role = cocinero` por una configuración que distinga `produccion_cocina`, `produccion_panaderia` y `produccion_reposteria`. No se aceptará una sesión anónima ni una acción atribuida al usuario técnico del dispositivo.

#### 13. Relación con el estado legacy

La auditoría encontró 16 turnos históricos y una asignación de sede/área para `produccion_cocina`, pero **0 permisos operativos**. La operación de FOGO puede depender todavía del rol base legacy `cocinero`, de rutas sin protección suficiente o de lógica especial no canónica.

```text
0 ASIGNACIONES OPERATIVAS LEGACY
        ↓
VALIDACIÓN CONTRA 112 PERMISOS CANÓNICOS
        ↓
16 CONCESIONES OPERATIVAS EXPLÍCITAS
├── 5 capacidades de FOGO
└── 11 capacidades mínimas de NEXO
```

La propuesta no copia permisos permanentes del rol base `cocinero`. Construye una matriz operativa nueva, limitada al turno, al Centro de Producción, a Cocina Caliente y a los recursos productivos e inventarios relacionados.

#### 14. Validaciones de integridad

- ✅ Los 112 permisos canónicos fueron evaluados exactamente una vez.
- ✅ Las cantidades por aplicación suman 112.
- ✅ Solo se asignaron permisos que admiten carril operativo.
- ✅ No se asignó ningún permiso `BASE_ONLY`.
- ✅ No se asignó ningún permiso `BASE_AND_OPERATIONAL`.
- ✅ Los cinco permisos operativos vigentes de FOGO fueron evaluados y asignados expresamente.
- ✅ Cada concesión tiene contexto, área y recurso explícitos.
- ✅ El rol exige turno, Centro de Producción y área de Cocina Caliente válidos.
- ✅ Las mutaciones y consultas vivas concedidas exigen check-in cuando corresponde.
- ✅ El recetario operativo no se confunde con el maestro administrativo de recetas.
- ✅ Los retiros se limitan a consumo trazable contra orden o lote.
- ✅ No se concedieron remisiones, logística, compras, bodega ni operación comercial.
- ✅ No existen wildcards ni permisos implícitos.
- ✅ APP-REVIEW, demo y áreas no habilitadas permanecen excluidas.
- ✅ Los permisos nuevos se deniegan por defecto.

#### 15. Impacto sobre tareas posteriores

| Tarea                         | Impacto                                                                                                                                                      |
| ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| AUTH-RBAC-015 y AUTH-RBAC-016 | Deberán definir panadería y repostería de manera independiente, sin heredar automáticamente esta matriz ni compartir áreas.                                  |
| AUTH-RBAC-017                 | Deberá reservar para `bodeguero` las operaciones generales de bodega, stock, entradas, ubicaciones, conteos, preparación y despacho.                         |
| AUTH-RBAC-021                 | Podrá añadir una excepción operativa individual temporal sin modificar la plantilla general ni eliminar turno, área o recurso.                               |
| AUTH-RBAC-023                 | Deberá restringir los dispositivos de producción por actor, rol, sede, área, aplicaciones y permisos compatibles.                                            |
| AUTH-RBAC-025                 | Deberá proyectar estas 16 concesiones en el dataset canónico de matriz operativa.                                                                            |
| AUTH-RBAC-027                 | Deberá confirmar que ninguna concesión produzca acceso a otras áreas productivas o inventario global accidental.                                             |
| BLOQUE E                      | Deberá resolver orden, receta operativa, lote, área, ubicación, stock y consumo antes de decidir.                                                            |
| FOGO y roadmap funcional      | Deberán crear permisos atómicos para ejecución, estados, rendimiento, merma, calidad, terminación, liberación, reversión y cierre del lote.                  |
| Integración FOGO–NEXO         | Deberá definir efectos idempotentes de consumo y producto terminado, evitando duplicar movimientos o permitir inconsistencias entre producción e inventario. |
| BLOQUE R                      | Implementará la transición física mediante migraciones versionadas en `vento-shell`, pruebas, reconciliación y rollback.                                     |

#### 16. Criterios de aprobación

1. `produccion_cocina` queda definido como rol operativo temporal de Cocina Caliente central.
2. Las 16 concesiones son explícitas y compatibles con el carril operativo.
3. El rol requiere turno, Centro de Producción y área activa exacta de Cocina Caliente.
4. Puede entrar a FOGO y NEXO sin que `access` funcione como wildcard.
5. Puede consultar órdenes y recetario operativo aplicables a su área.
6. Puede consultar y crear lotes productivos vinculados a órdenes válidas.
7. Puede consultar insumos, ubicaciones, stock y trazabilidad estrictamente necesarios.
8. Puede registrar retiros únicamente como consumo trazable contra orden o lote.
9. No administra recetas maestras ni recibe capacidades de bodega, remisiones, logística, compras o caja.
10. Compartir sede con otras áreas no amplía su matriz.
11. Las 96 capacidades restantes permanecen denegadas por defecto.
12. No se implementa código, Supabase ni migraciones en esta tarea.
13. `AUTH-RBAC-015` permanece sin iniciar hasta solicitud expresa.

#### 17. Estado final de la propuesta

| Tarea         | Estado      |
| ------------- | ----------- |
| AUTH-RBAC-013 | APROBADA    |
| AUTH-RBAC-014 | APROBADA    |
| AUTH-RBAC-015 | NO INICIADA |

No se implementan código, migraciones, cambios en Supabase, RLS, RPC, datasets, repositorios, guards, dispositivos ni pantallas. La matriz solo será canónica cuando el usuario la apruebe expresamente.


### ✅ AUTH-RBAC-015 — Crear matriz de produccion_panaderia

#### 1. Identificación de la tarea

| Campo                     | Valor                                                               |
| ------------------------- | ------------------------------------------------------------------- |
| Bloque                    | BLOQUE D — Matrices canónicas de roles, excepciones y dispositivos  |
| Tarea                     | AUTH-RBAC-015 — Crear matriz de produccion_panaderia                |
| Estado                    | **APROBADA**                                                        |
| Naturaleza                | Definición documental de matriz operativa de panadería y galletería |
| Implementación física     | No incluida                                                         |
| Catálogo evaluado         | 112 permisos canónicos vigentes                                     |
| Tarea anterior vigente    | AUTH-RBAC-014 — APROBADA                                            |
| Tarea posterior reservada | AUTH-RBAC-016 — Crear matriz de produccion_reposteria               |

Esta tarea no modifica Supabase, migraciones, tablas, RLS, RPC, aplicaciones, repositorios ni datasets físicos. La aplicación posterior deberá realizarse mediante AUTH-RBAC-025 y las migraciones versionadas del BLOQUE R en `vento-shell`.

#### 2. Objetivo

Definir, permiso por permiso, las capacidades que puede ejercer el rol operativo `produccion_panaderia` durante un turno válido en Galletería y Panadería del Centro de Producción, separando la ejecución productiva de la administración de recetas, la operación de bodega, la logística, las compras y la cocina satélite, Cocina Caliente y Repostería.

#### 3. Decisión principal

`produccion_panaderia` representa la función temporal encargada de ejecutar producción de panadería y galletería a partir de órdenes y recetarios o formulaciones operativas publicadas. Puede crear y consultar lotes de su área y registrar consumos de insumos trazables, pero no administra recetas maestras, inventario general, remisiones, compras, despacho ni Cocina Caliente, Repostería u otras áreas productivas.

```text
ACTOR IDENTIFICADO
+ TURNO PUBLICADO Y VIGENTE
+ ROL produccion_panaderia
+ SEDE CENTRO DE PRODUCCIÓN
+ ÁREA ACTIVA GALLETERÍA Y PANADERÍA
+ CHECK-IN CUANDO EL PERMISO LO EXIJA
+ PERMISO OPERATIVO EXPLÍCITO
+ ORDEN / RECETA / FORMULACIÓN / LOTE / INVENTARIO COMPATIBLE
= AUTORIZACIÓN OPERATIVA DE PANADERÍA Y GALLETERÍA
```

No se admite:

```text
employees.role = panadero → acceso permanente
produccion_panaderia = produccion_cocina o produccion_reposteria
fogo.access = autorización total de FOGO
recetario operativo = administración del maestro de recetas
crear lote = cerrar, aprobar o alterar cualquier lote
registrar retiro = control general de inventario
Centro de Producción = acceso a Cocina Caliente, repostería y bodega
plantilla production_center = rol automático
PIN del dispositivo = sustituto de turno, check-in o permiso
produccion_panaderia = remisiones, compras, despacho o logística
```

#### 4. Resultado cuantitativo de la matriz

| Resultado                                    | Cantidad | Efecto                                                                                                                                                                   |
| -------------------------------------------- | -------: | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Capacidades operativas asignadas             |       16 | Se conceden por el carril operativo dentro del contexto de Galletería y Panadería y sobre órdenes, lotes, recetas o formulaciones operativas e inventario acotado.       |
| Capacidades `BASE_AND_OPERATIONAL` asignadas |        0 | El rol operativo no recibe autoridad base adicional.                                                                                                                     |
| Capacidades no asignadas                     |       96 | Permanecen denegadas por defecto por pertenecer al carril base, a Cocina Caliente, Repostería u otras áreas productivas o a bodega, logística, compras y administración. |
| Total evaluado                               |      112 | Sin omisiones ni duplicados.                                                                                                                                             |

La matriz contiene **16 concesiones operativas a nivel de clave** y **96 ausencias de concesión**. La ausencia de concesión produce denegación por defecto; no se crean filas `deny` redundantes.

#### 5. Perfiles de alcance utilizados

| Perfil                                | Significado                                                                                                                  |
| ------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| `CTX-PROD-BAKERY-FOGO-APP`            | Entrada operativa a FOGO con turno, rol, sede y área válidos. No concede capacidades internas.                               |
| `CTX-PROD-BAKERY-ORDER`               | Órdenes destinadas o asignadas a Galletería y Panadería dentro del periodo productivo autorizado.                            |
| `CTX-PROD-BAKERY-BATCH`               | Lotes de producción vinculados a órdenes, recetas y recursos del área activa.                                                |
| `CTX-PROD-BAKERY-BATCH-CREATE`        | Creación trazable e idempotente de lotes para Galletería y Panadería.                                                        |
| `CTX-PROD-BAKERY-RECIPE-BOOK`         | Proyección operativa publicada de recetas aplicables; excluye el maestro administrativo completo.                            |
| `CTX-PROD-BAKERY-NEXO-APP`            | Entrada operativa a NEXO para consumo y trazabilidad de insumos del área. No concede inventario general.                     |
| `CTX-PROD-BAKERY-REF`                 | Consulta mínima de productos, presentaciones, categorías y unidades necesarias para interpretar recetas, órdenes y consumos. |
| `CTX-PROD-BAKERY-INVENTORY-REF`       | Ubicaciones autorizadas y topología mínima necesaria para identificar el origen físico del insumo.                           |
| `CTX-PROD-BAKERY-INVENTORY-STOCK`     | Existencias de insumos limitadas a Galletería y Panadería y a las ubicaciones compatibles.                                   |
| `CTX-PROD-BAKERY-INVENTORY-BATCH`     | Trazabilidad de inventario de lotes productivos vinculados al área y a sus órdenes.                                          |
| `CTX-PROD-BAKERY-WITHDRAWAL`          | Consulta de consumos propios o relacionados con el lote productivo autorizado.                                               |
| `CTX-PROD-BAKERY-WITHDRAWAL-REGISTER` | Registro de consumo de insumos contra orden o lote, con cantidad, unidad, ubicación, actor y trazabilidad.                   |

#### 6. Reglas obligatorias de la matriz

1. Cada concesión utiliza una clave canónica exacta; no existen wildcards, herencias implícitas ni autorización por nombre de rol.
2. El rol operativo efectivo procede exclusivamente del turno publicado y vigente. Los perfiles y dispositivos solo sugieren o restringen; nunca asignan el rol.
3. `produccion_panaderia` requiere Centro de Producción y un área operativa concreta compatible con Galletería y Panadería.
4. El área activa no se infiere desde el producto, la receta, el dispositivo ni la sede seleccionada; debe proceder del turno válido.
5. Las concesiones con prerrequisito `T` pueden consultarse antes del check-in, pero continúan exigiendo turno, rol, sede y área válidos cuando el permiso o el rol lo requieran.
6. Las concesiones con prerrequisito `T+C` requieren turno y check-in activos, sede y área coincidentes y recurso resoluble.
7. `fogo.access` y `nexo.access` solo permiten entrar a sus aplicaciones y cargar el estado del contexto. No funcionan como wildcards.
8. `fogo.production.orders.view` se limita a órdenes destinadas o asignadas a Galletería y Panadería. No concede reasignar, aprobar, modificar o cancelar órdenes.
9. `fogo.production.recipe_book.view` expone únicamente la versión operativa publicada y aplicable. No concede `fogo.production.recipes.view`, edición, exportación masiva ni acceso administrativo al maestro.
10. `fogo.production.batches.create` exige orden y receta aplicables, cantidades, responsable, área, estado e idempotencia válidos. No autoriza cualquier transición posterior del lote.
11. La consulta de productos, presentaciones, categorías y unidades desde NEXO se limita a la proyección mínima necesaria para ejecutar producción y registrar consumos.
12. La consulta de stock, LPN, lotes y retiros se limita a insumos, ubicaciones, órdenes y lotes relacionados con Galletería y Panadería; no concede inventario general de la sede.
13. `nexo.inventory.withdrawals.register` solo registra consumo trazable contra una orden o lote válido. No concede ajustes, entradas, traslados, conteos ni inventario negativo.
14. La creación del lote productivo y el registro de consumo son operaciones distintas; ninguna debe duplicar efectos de inventario ni sustituir la integración canónica entre FOGO y NEXO.
15. No se asignan remisiones: la recepción, preparación, despacho y transporte pertenecen a roles y procesos diferentes.
16. No se asignan compras ni recepciones de ORIGO; el acceso a proveedores u órdenes de compra no es necesario para ejecutar Galletería y Panadería.
17. No se asignan capacidades de Cocina Caliente, repostería o bodega por compartir la misma sede. Cada área conserva su rol y matriz propios.
18. APP-REVIEW, demo, pruebas, recursos aislados y sedes no habilitadas permanecen excluidos.
19. Las denegaciones individuales, estructurales, de recurso, dispositivo o aislamiento prevalecen sobre esta matriz.
20. Todo permiso nuevo se deniega hasta que una versión canónica posterior lo evalúe expresamente para `produccion_panaderia`.

#### 7. Matriz canónica completa
##### 7.1 SHELL — 1 permisos

| Permiso        | Capacidad humana  | Modalidad   | Decisión para produccion_panaderia | Alcance aprobado                                                       | Condición                                                                                              |
| -------------- | ----------------- | ----------- | ---------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `shell.access` | Entrar a Vento OS | `BASE_ONLY` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.2 ANIMA — 10 permisos

| Permiso                                     | Capacidad humana                     | Modalidad   | Decisión para produccion_panaderia | Alcance aprobado                                                       | Condición                                                                                              |
| ------------------------------------------- | ------------------------------------ | ----------- | ---------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `anima.access`                              | Entrar a ANIMA                       | `BASE_ONLY` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.employee_documents.view`   | Consultar documentos de trabajadores | `BASE_ONLY` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.employee_documents.upload` | Cargar documentos de trabajadores    | `BASE_ONLY` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.employee_documents.delete` | Eliminar documentos de trabajadores  | `BASE_ONLY` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.employee_photos.upload`    | Cargar fotografías de trabajadores   | `BASE_ONLY` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.team_members.view`         | Consultar integrantes del equipo     | `BASE_ONLY` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.staff_invitations.create`  | Invitar trabajadores                 | `BASE_ONLY` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.attendance.shifts.create`            | Crear turnos                         | `BASE_ONLY` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.attendance.shifts.update`            | Actualizar turnos                    | `BASE_ONLY` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.attendance.shifts.cancel`            | Cancelar turnos                      | `BASE_ONLY` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.3 AURA — 1 permisos

| Permiso       | Capacidad humana | Modalidad   | Decisión para produccion_panaderia | Alcance aprobado                                                       | Condición                                                                                              |
| ------------- | ---------------- | ----------- | ---------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `aura.access` | Entrar a AURA    | `BASE_ONLY` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.4 FOGO — 6 permisos

| Permiso                            | Capacidad humana                | Modalidad             | Decisión para produccion_panaderia | Alcance aprobado                                                                                                                                                                | Condición                                                                                                                                                                                                            |
| ---------------------------------- | ------------------------------- | --------------------- | ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `fogo.access`                      | Entrar a FOGO                   | `BASE_OR_OPERATIONAL` | **ASIGNAR OPERATIVO**              | CTX-PROD-BAKERY-FOGO-APP — turno publicado y vigente, rol `produccion_panaderia`, Centro de Producción habilitado y área activa exacta de Galletería y Panadería.               | Carril operativo con prerrequisito `T`. Permite entrar a FOGO, ver el estado del contexto y los bloqueos. No concede por sí solo lotes, órdenes, recetario ni otra capacidad.                                        |
| `fogo.production.batches.view`     | Consultar lotes de producción   | `BASE_OR_OPERATIONAL` | **ASIGNAR OPERATIVO**              | CTX-PROD-BAKERY-BATCH — lotes vinculados a órdenes y ejecución de Galletería y Panadería dentro del Centro de Producción.                                                       | Turno y check-in activos. La consulta se limita a lotes del área productiva activa y a la información necesaria para ejecutar y verificar la producción; no concede información de otras áreas.                      |
| `fogo.production.batches.create`   | Crear lotes de producción       | `OPERATIONAL_ONLY`    | **ASIGNAR OPERATIVO**              | CTX-PROD-BAKERY-BATCH-CREATE — creación de lotes para órdenes válidas asignadas a Galletería y Panadería, con receta publicada, cantidades, unidad, responsable y trazabilidad. | Turno y check-in activos. La creación debe ser idempotente, validar orden, receta operativa, área, cantidades y estado, y atribuir el lote al actor efectivo. No permite editar recetas maestras.                    |
| `fogo.production.orders.view`      | Consultar órdenes de producción | `BASE_OR_OPERATIONAL` | **ASIGNAR OPERATIVO**              | CTX-PROD-BAKERY-ORDER — órdenes de producción destinadas o asignadas a Galletería y Panadería y vigentes para el turno o periodo operativo autorizado.                          | Carril operativo con prerrequisito `T`. Permite preparar la jornada consultando instrucciones y prioridades; no permite modificar, reasignar, aprobar ni cancelar órdenes.                                           |
| `fogo.production.recipe_book.view` | Consultar recetario operativo   | `OPERATIONAL_ONLY`    | **ASIGNAR OPERATIVO**              | CTX-PROD-BAKERY-RECIPE-BOOK — proyección operativa publicada de recetas aplicables a órdenes de Galletería y Panadería, con porciones, insumos, proceso y controles necesarios. | Carril operativo con prerrequisito `T`. Solo recetario operativo vigente y aplicable; sin costos, márgenes, secretos administrativos, versiones borrador, edición, exportación masiva ni acceso al maestro completo. |
| `fogo.production.recipes.view`     | Consultar recetas               | `BASE_ONLY`           | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                          | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                               |

##### 7.5 NEXO — 63 permisos

| Permiso                                      | Capacidad humana                         | Modalidad              | Decisión para produccion_panaderia | Alcance aprobado                                                                                                                                      | Condición                                                                                                                                                                                                                           |
| -------------------------------------------- | ---------------------------------------- | ---------------------- | ---------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `nexo.access`                                | Entrar a NEXO                            | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**              | CTX-PROD-BAKERY-NEXO-APP — turno publicado y vigente, rol `produccion_panaderia`, Centro de Producción y área activa de Galletería y Panadería.       | Carril operativo con prerrequisito `T`. Permite entrar a NEXO y ver el contexto del área. No concede por sí solo inventario, movimientos, retiros ni otra capacidad.                                                                |
| `nexo.catalog.products.view`                 | Consultar productos                      | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**              | CTX-PROD-BAKERY-REF — productos e insumos vigentes aplicables a recetas, lotes o retiros de Galletería y Panadería.                                   | Turno vigente. Proyección mínima de identificación; excluye costos, márgenes, proveedores, configuración y campos técnicos no necesarios.                                                                                           |
| `nexo.catalog.products.create`               | Crear productos                          | `BASE_ONLY`            | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.catalog.presentations.view`            | Consultar presentaciones                 | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**              | CTX-PROD-BAKERY-REF — presentaciones, empaques y conversiones publicadas necesarias para interpretar insumos y cantidades productivas.                | Turno vigente. Solo lectura; no permite crear ni modificar presentaciones.                                                                                                                                                          |
| `nexo.catalog.request_policies.view`         | Consultar políticas de solicitud         | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Galletería y Panadería.                                                        |
| `nexo.catalog.categories.view`               | Consultar categorías                     | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**              | CTX-PROD-BAKERY-REF — categorías necesarias para localizar insumos y productos relacionados con Galletería y Panadería.                               | Turno vigente. Solo lectura y búsqueda; no permite administrar categorías.                                                                                                                                                          |
| `nexo.catalog.units.view`                    | Consultar unidades                       | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**              | CTX-PROD-BAKERY-REF — unidades, equivalencias y empaques publicados necesarios para recetas, lotes y consumos.                                        | Turno vigente. Solo lectura; no permite modificar unidades ni factores de conversión.                                                                                                                                               |
| `nexo.assets.items.view`                     | Consultar activos                        | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Galletería y Panadería.                                                        |
| `nexo.assets.items.create`                   | Crear activos                            | `BASE_ONLY`            | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.assets.groups.view`                    | Consultar grupos de activos              | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Galletería y Panadería.                                                        |
| `nexo.assets.counts.view`                    | Consultar conteos de activos             | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Galletería y Panadería.                                                        |
| `nexo.inventory.adjustments.view`            | Consultar ajustes de inventario          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Galletería y Panadería.                                                        |
| `nexo.inventory.adjustments.register`        | Registrar ajustes de inventario          | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | Capacidad combinada o excepcional. Requiere autoridad base explícita además del contexto operativo; esta matriz no aporta el carril base.                                                                                           |
| `nexo.inventory.entries.view`                | Consultar entradas de inventario         | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Galletería y Panadería.                                                        |
| `nexo.inventory.entries.register`            | Registrar entradas de inventario         | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Galletería y Panadería.                                                        |
| `nexo.inventory.entries.override`            | Registrar entradas excepcionales         | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | Capacidad combinada o excepcional. Requiere autoridad base explícita además del contexto operativo; esta matriz no aporta el carril base.                                                                                           |
| `nexo.inventory.locations.view`              | Consultar ubicaciones de inventario      | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**              | CTX-PROD-BAKERY-INVENTORY-REF — ubicaciones activas desde las que Galletería y Panadería está autorizada a consumir o consultar insumos.              | Turno vigente y área activa válida. La consulta se limita a topología necesaria para la operación; no concede asignar ubicaciones ni administrar su catálogo.                                                                       |
| `nexo.inventory.location_assignments.assign` | Asignar ubicaciones de inventario        | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Galletería y Panadería.                                                        |
| `nexo.inventory.location_catalog.update`     | Actualizar el catálogo de una ubicación  | `BASE_ONLY`            | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.inventory.lpns.view`                   | Consultar LPN                            | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**              | CTX-PROD-BAKERY-INVENTORY-LPN — LPN o contenedores relacionados con insumos disponibles para Galletería y Panadería o con el lote productivo activo.  | Turno y check-in activos. Debe limitar contenido, posición, custodia y trazabilidad al recurso que el actor necesita identificar; no concede movimientos ni reasignaciones.                                                         |
| `nexo.inventory.movements.view`              | Consultar movimientos de inventario      | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Galletería y Panadería.                                                        |
| `nexo.inventory.stock.view`                  | Consultar stock                          | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**              | CTX-PROD-BAKERY-INVENTORY-STOCK — existencias de insumos disponibles para consumo autorizado por Galletería y Panadería en ubicaciones compatibles.   | Turno y check-in activos. Consulta sensible y acotada al área, ubicación, producto y lote aplicables; no permite consultar inventario general de la sede ni de otras áreas.                                                         |
| `nexo.inventory.production_batches.view`     | Consultar lotes vinculados al inventario | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**              | CTX-PROD-BAKERY-INVENTORY-BATCH — trazabilidad de inventario derivada de lotes creados por Galletería y Panadería o vinculados a sus órdenes activas. | Turno y check-in activos. Solo lectura de disponibilidad, lote y trazabilidad necesaria para verificar el efecto productivo; no concede ajustes, entradas manuales ni movimientos.                                                  |
| `nexo.inventory.transfers.view`              | Consultar traslados de inventario        | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Galletería y Panadería.                                                        |
| `nexo.inventory.transfers.create`            | Crear traslados de inventario            | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Galletería y Panadería.                                                        |
| `nexo.inventory.withdrawals.view`            | Consultar retiros de inventario          | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**              | CTX-PROD-BAKERY-WITHDRAWAL — retiros o consumos asociados al actor, al lote activo o a Galletería y Panadería dentro del turno vigente.               | Turno y check-in activos. La consulta se limita a consumos propios o del recurso productivo autorizado; no expone retiros generales de otras áreas o trabajadores.                                                                  |
| `nexo.inventory.withdrawals.register`        | Registrar retiros de inventario          | `OPERATIONAL_ONLY`     | **ASIGNAR OPERATIVO**              | CTX-PROD-BAKERY-WITHDRAWAL-REGISTER — registro de consumo de insumos desde ubicaciones autorizadas hacia una orden o lote de Galletería y Panadería.  | Turno y check-in activos. Validar stock, presentación, unidad, lote, ubicación, cantidad, receta u orden relacionada, idempotencia y concurrencia. No permite inventario negativo, ajustes, traslados ni consumos sin trazabilidad. |
| `nexo.inventory.zones.view`                  | Consultar zonas de almacenamiento        | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Galletería y Panadería.                                                        |
| `nexo.inventory.storage_positions.view`      | Consultar posiciones de almacenamiento   | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Galletería y Panadería.                                                        |
| `nexo.inventory.warehouse_operations.view`   | Consultar operaciones de bodega          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Galletería y Panadería.                                                        |
| `nexo.inventory.stock_validations.perform`   | Ejecutar validaciones de inventario      | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Galletería y Panadería.                                                        |
| `nexo.inventory.stock_counts.view`           | Consultar conteos de inventario          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Galletería y Panadería.                                                        |
| `nexo.inventory.stock_counts.perform`        | Ejecutar conteos de inventario           | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Galletería y Panadería.                                                        |
| `nexo.inventory.initial_counts.view`         | Consultar conteos iniciales              | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Galletería y Panadería.                                                        |
| `nexo.inventory.remissions.view`             | Consultar remisiones                     | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Galletería y Panadería.                                                        |
| `nexo.inventory.remissions.update`           | Actualizar remisiones                    | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Galletería y Panadería.                                                        |
| `nexo.inventory.remissions.request`          | Solicitar remisiones                     | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Galletería y Panadería.                                                        |
| `nexo.inventory.remissions.prepare`          | Preparar remisiones                      | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Galletería y Panadería.                                                        |
| `nexo.inventory.remissions.dispatch`         | Despachar remisiones                     | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Galletería y Panadería.                                                        |
| `nexo.inventory.remissions.receive`          | Recibir remisiones                       | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Galletería y Panadería.                                                        |
| `nexo.inventory.remissions.cancel`           | Cancelar remisiones                      | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Galletería y Panadería.                                                        |
| `nexo.logistics.operations_board.view`       | Consultar tablero logístico              | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Galletería y Panadería.                                                        |
| `nexo.logistics.operations.view`             | Consultar operaciones logísticas         | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Galletería y Panadería.                                                        |
| `nexo.logistics.driver_operations.view`      | Consultar operaciones de conductores     | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Galletería y Panadería.                                                        |
| `nexo.logistics.fulfillment.view`            | Consultar cumplimiento logístico         | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Galletería y Panadería.                                                        |
| `nexo.logistics.fulfillment_routes.view`     | Consultar rutas de cumplimiento          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Galletería y Panadería.                                                        |
| `nexo.logistics.supply_routes.view`          | Consultar rutas de abastecimiento        | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Galletería y Panadería.                                                        |
| `nexo.finance.internal_invoices.view`        | Consultar facturas internas              | `BASE_ONLY`            | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.finance.internal_invoices.generate`    | Generar facturas internas                | `BASE_ONLY`            | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.finance.internal_invoices.issue`       | Emitir facturas internas                 | `BASE_ONLY`            | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.finance.internal_invoices.cancel`      | Cancelar facturas internas               | `BASE_ONLY`            | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.finance.internal_invoice_amounts.view` | Consultar valores de facturas internas   | `BASE_ONLY`            | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.finance.internal_prices.view`          | Consultar precios internos               | `BASE_ONLY`            | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.finance.internal_variances.view`       | Consultar variaciones internas           | `BASE_ONLY`            | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.finance.internal_variances.approve`    | Aprobar variaciones internas             | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | Capacidad combinada o excepcional. Requiere autoridad base explícita además del contexto operativo; esta matriz no aporta el carril base.                                                                                           |
| `nexo.finance.internal_variances.resolve`    | Resolver variaciones internas            | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | Capacidad combinada o excepcional. Requiere autoridad base explícita además del contexto operativo; esta matriz no aporta el carril base.                                                                                           |
| `nexo.finance.cost_centers.view`             | Consultar centros de costo en NEXO       | `BASE_ONLY`            | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.analytics.internal_reports.view`       | Consultar reportes internos              | `BASE_ONLY`            | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.analytics.margin_reports.view`         | Consultar reportes de margen             | `BASE_ONLY`            | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.printing.templates.update`             | Editar plantillas de impresión           | `BASE_ONLY`            | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.printing.jobs.view`                    | Consultar trabajos de impresión          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Galletería y Panadería.                                                        |
| `nexo.settings.sites.view`                   | Consultar configuración de sedes         | `BASE_ONLY`            | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.settings.remission_policies.view`      | Consultar políticas de remisiones        | `BASE_ONLY`            | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |

##### 7.6 NUMERA — 6 permisos

| Permiso                                   | Capacidad humana               | Modalidad   | Decisión para produccion_panaderia | Alcance aprobado                                                       | Condición                                                                                              |
| ----------------------------------------- | ------------------------------ | ----------- | ---------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `numera.access`                           | Entrar a NUMERA                | `BASE_ONLY` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.finance.cost_centers.view`        | Consultar centros de costo     | `BASE_ONLY` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.finance.expenses.view`            | Consultar gastos               | `BASE_ONLY` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.analytics.break_even.view`        | Consultar punto de equilibrio  | `BASE_ONLY` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.analytics.profitability.view`     | Consultar rentabilidad         | `BASE_ONLY` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.analytics.financial_reports.view` | Consultar reportes financieros | `BASE_ONLY` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.7 ORIGO — 5 permisos

| Permiso                                  | Capacidad humana                  | Modalidad             | Decisión para produccion_panaderia | Alcance aprobado                                                       | Condición                                                                                                                       |
| ---------------------------------------- | --------------------------------- | --------------------- | ---------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| `origo.access`                           | Entrar a ORIGO                    | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece a compras, recepción o proveedores y no corresponde a la ejecución productiva de Galletería y Panadería. |
| `origo.procurement.purchase_orders.view` | Consultar órdenes de compra       | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece a compras, recepción o proveedores y no corresponde a la ejecución productiva de Galletería y Panadería. |
| `origo.procurement.receipts.view`        | Consultar recepciones de compra   | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece a compras, recepción o proveedores y no corresponde a la ejecución productiva de Galletería y Panadería. |
| `origo.procurement.suppliers.view`       | Consultar proveedores             | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece a compras, recepción o proveedores y no corresponde a la ejecución productiva de Galletería y Panadería. |
| `origo.catalog.product_reviews.view`     | Consultar revisiones de productos | `BASE_ONLY`           | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                          |

##### 7.8 VENTO PASS — 1 permisos

| Permiso       | Capacidad humana    | Modalidad   | Decisión para produccion_panaderia | Alcance aprobado                                                       | Condición                                                                                              |
| ------------- | ------------------- | ----------- | ---------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `pass.access` | Entrar a Vento Pass | `BASE_ONLY` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.9 PULSO — 2 permisos

| Permiso                              | Capacidad humana                        | Modalidad              | Decisión para produccion_panaderia | Alcance aprobado                                                       | Condición                                                                                                                                 |
| ------------------------------------ | --------------------------------------- | ---------------------- | ---------------------------------- | ---------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| `pulso.access`                       | Entrar a PULSO                          | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | PULSO pertenece a la operación comercial del punto de venta y no corresponde a la producción central de Galletería y Panadería.           |
| `pulso.delivery.deliveries.override` | Confirmar entregas de forma excepcional | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad combinada o excepcional. Requiere autoridad base explícita además del contexto operativo; esta matriz no aporta el carril base. |

##### 7.10 VISO — 17 permisos

| Permiso                                       | Capacidad humana                          | Modalidad   | Decisión para produccion_panaderia | Alcance aprobado                                                       | Condición                                                                                              |
| --------------------------------------------- | ----------------------------------------- | ----------- | ---------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `viso.access`                                 | Entrar a VISO                             | `BASE_ONLY` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.platform.app_updates.view`              | Consultar actualizaciones de aplicaciones | `BASE_ONLY` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.organization.businesses.view`           | Consultar empresas y unidades de negocio  | `BASE_ONLY` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.workforce.employees.view`               | Consultar trabajadores                    | `BASE_ONLY` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.workforce.staff_calendar.view`          | Consultar calendario del personal         | `BASE_ONLY` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.workforce.schedules.view`               | Consultar programación de turnos          | `BASE_ONLY` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.workforce.vacancies.view`               | Consultar vacantes                        | `BASE_ONLY` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.authorization.context_simulations.view` | Consultar simulaciones de autorización    | `BASE_ONLY` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.authorization.audit_logs.view`          | Consultar auditoría de autorización       | `BASE_ONLY` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.catalog.commercial_categories.view`     | Consultar categorías comerciales          | `BASE_ONLY` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.content.content_blocks.view`            | Consultar bloques de contenido            | `BASE_ONLY` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.content.menu.view`                      | Consultar menú                            | `BASE_ONLY` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.content.website_content.view`           | Consultar contenido del sitio web         | `BASE_ONLY` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.finance.accounting.view`                | Consultar información contable            | `BASE_ONLY` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.delivery.rates.view`                    | Consultar tarifas de entrega              | `BASE_ONLY` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.loyalty.products.view`                  | Consultar productos de fidelización       | `BASE_ONLY` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.loyalty.customers.view`                 | Consultar clientes de fidelización        | `BASE_ONLY` | **NO ASIGNAR**                     | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |



#### 8. Resumen por aplicación

| Aplicación | Permisos canónicos | Asignados | No asignados |
| ---------- | -----------------: | --------: | -----------: |
| SHELL      |                  1 |         0 |            1 |
| ANIMA      |                 10 |         0 |           10 |
| AURA       |                  1 |         0 |            1 |
| FOGO       |                  6 |         5 |            1 |
| NEXO       |                 63 |        11 |           52 |
| NUMERA     |                  6 |         0 |            6 |
| ORIGO      |                  5 |         0 |            5 |
| VENTO PASS |                  1 |         0 |            1 |
| PULSO      |                  2 |         0 |            2 |
| VISO       |                 17 |         0 |           17 |
| **Total**  |            **112** |    **16** |       **96** |

#### 9. Flujo operativo autorizado

```text
TURNO VÁLIDO DE GALLETERÍA Y PANADERÍA
        ↓
ENTRAR A FOGO
        ↓
CONSULTAR ÓRDENES Y RECETARIO OPERATIVO
        ↓
TURNO + CHECK-IN
        ↓
CONSULTAR / CREAR LOTE DE PRODUCCIÓN
        ↓
ENTRAR A NEXO
        ↓
CONSULTAR INSUMOS, UBICACIONES Y STOCK AUTORIZADO
        ↓
REGISTRAR CONSUMO CONTRA ORDEN O LOTE
        ↓
CONSULTAR TRAZABILIDAD DEL LOTE EN INVENTARIO
```

La matriz permite iniciar la ejecución productiva y registrar consumos trazables, pero el catálogo vigente no contiene todavía permisos atómicos para todas las transiciones del lote, control de calidad, rendimiento, merma, cierre productivo o ingreso automático del producto terminado.

#### 10. Capacidades expresamente no concedidas

- cualquier permiso exclusivo del carril base;
- administración del maestro completo de recetas;
- creación, modificación o archivo de recetas;
- modificación, reasignación, aprobación o cancelación de órdenes de producción;
- cierre, liberación, rechazo o reversión de lotes cuando no exista permiso atómico aprobado;
- producción de Cocina Caliente, repostería o pastelería por inferencia;
- inventario general del Centro de Producción o de otras áreas;
- movimientos, entradas, ajustes, traslados, conteos o validaciones de stock;
- asignación de ubicaciones, administración de LPN, zonas o posiciones;
- preparación, despacho, transporte, recepción o cancelación de remisiones;
- compras, órdenes de compra, proveedores y recepciones de ORIGO;
- operación comercial, caja, pedidos, pagos o fidelización de PULSO;
- facturas internas, costos, márgenes, gastos, contabilidad o NUMERA;
- gestión de personal, turnos, permisos, seguridad o VISO;
- acceso a APP-REVIEW o a sedes y áreas no habilitadas;
- cualquier permiso futuro no evaluado expresamente.

#### 11. Brechas del catálogo identificadas

El catálogo vigente permite consultar órdenes, consultar el recetario o formulación operativa, consultar y crear lotes, pero no representa todavía de forma atómica varias operaciones esenciales del ciclo productivo:

- aceptar o iniciar una orden de producción;
- cambiar el estado de una orden o lote;
- pausar, reanudar, cancelar o reabrir una ejecución;
- registrar cantidades planificadas, producidas, rechazadas y aprovechables;
- registrar consumo teórico y consumo real por insumo;
- registrar sustituciones de ingredientes autorizadas;
- registrar merma, desperdicio, reproceso y causas;
- registrar tiempos, temperatura, responsables y controles del proceso;
- registrar control de calidad, liberación o rechazo;
- confirmar producto terminado, presentación, lote, vencimiento y ubicación destino;
- integrar de forma idempotente FOGO con movimientos de inventario en NEXO;
- corregir una producción mediante reversión trazable, no mediante edición destructiva;
- imprimir etiquetas o documentos operativos del lote con permiso propio;
- consultar historial y evidencia del lote dentro del área autorizada;
- distinguir creación del lote, ejecución, terminación, liberación y cierre administrativo.

Estas brechas no amplían la matriz. `fogo.production.batches.create` no podrá interpretarse como permiso para ejecutar todas las transiciones del ciclo de vida ni para producir efectos de inventario no definidos contractualmente.

#### 12. Dispositivo compartido de producción

La plantilla legacy `production_center` puede habilitar FOGO, NEXO y SHELL como superficies disponibles, pero no concede ninguna matriz. Antes de ejecutar una acción deberá existir:

```text
DISPOSITIVO TÉCNICO ACTIVO
+ ACTOR IDENTIFICADO
+ PIN O AUTENTICACIÓN EXIGIDA
+ TURNO produccion_panaderia VÁLIDO
+ ÁREA DEL DISPOSITIVO = ÁREA DEL TURNO = GALLETERÍA Y PANADERÍA
+ CHECK-IN CUANDO CORRESPONDA
+ PERMISO DE ESTA MATRIZ
= ACCIÓN ATRIBUIBLE AL TRABAJADOR
```

La política `same_site_active_worker` de la plantilla legacy es insuficiente porque permitiría actores de otras áreas del Centro de Producción. La implementación futura deberá exigir coincidencia de área y rol operativo, y reemplazar `navigation_role = cocinero` por una configuración que distinga `produccion_cocina`, `produccion_panaderia` y `produccion_reposteria`. No se aceptará una sesión anónima ni una acción atribuida al usuario técnico del dispositivo.

#### 13. Relación con el estado legacy

La auditoría encontró 17 turnos históricos y una asignación de sede/área para `produccion_panaderia`, pero **0 permisos operativos**. La operación de FOGO puede depender todavía del rol base legacy `panadero`, de rutas sin protección suficiente o de lógica especial no canónica.

```text
0 PERMISOS OPERATIVOS LEGACY
        ↓
VALIDACIÓN CONTRA 112 PERMISOS CANÓNICOS
        ↓
16 CONCESIONES OPERATIVAS EXPLÍCITAS
├── 5 capacidades de FOGO
└── 11 capacidades mínimas de NEXO
```

La propuesta no copia permisos permanentes del rol base `panadero`. Construye una matriz operativa nueva, limitada al turno, al Centro de Producción, a Galletería y Panadería y a los recursos productivos e inventarios relacionados.

#### 14. Validaciones de integridad

- ✅ Los 112 permisos canónicos fueron evaluados exactamente una vez.
- ✅ Las cantidades por aplicación suman 112.
- ✅ Solo se asignaron permisos que admiten carril operativo.
- ✅ No se asignó ningún permiso `BASE_ONLY`.
- ✅ No se asignó ningún permiso `BASE_AND_OPERATIONAL`.
- ✅ Los cinco permisos operativos vigentes de FOGO fueron evaluados y asignados expresamente.
- ✅ Cada concesión tiene contexto, área y recurso explícitos.
- ✅ El rol exige turno, Centro de Producción y área de Galletería y Panadería válidos.
- ✅ Las mutaciones y consultas vivas concedidas exigen check-in cuando corresponde.
- ✅ El recetario o formulación operativa no se confunde con el maestro administrativo de recetas.
- ✅ Los retiros se limitan a consumo trazable contra orden o lote.
- ✅ No se concedieron remisiones, logística, compras, bodega ni operación comercial.
- ✅ No existen wildcards ni permisos implícitos.
- ✅ APP-REVIEW, demo y áreas no habilitadas permanecen excluidas.
- ✅ Los permisos nuevos se deniegan por defecto.

#### 15. Impacto sobre tareas posteriores

| Tarea                    | Impacto                                                                                                                                                      |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| AUTH-RBAC-016            | Deberá definir repostería de manera independiente, sin heredar automáticamente esta matriz ni compartir áreas.                                               |
| AUTH-RBAC-017            | Deberá reservar para `bodeguero` las operaciones generales de bodega, stock, entradas, ubicaciones, conteos, preparación y despacho.                         |
| AUTH-RBAC-021            | Podrá añadir una excepción operativa individual temporal sin modificar la plantilla general ni eliminar turno, área o recurso.                               |
| AUTH-RBAC-023            | Deberá restringir los dispositivos de producción por actor, rol, sede, área, aplicaciones y permisos compatibles.                                            |
| AUTH-RBAC-025            | Deberá proyectar estas 16 concesiones en el dataset canónico de matriz operativa.                                                                            |
| AUTH-RBAC-027            | Deberá confirmar que ninguna concesión produzca acceso a Cocina Caliente, Repostería u otras áreas productivas o inventario global accidental.               |
| BLOQUE E                 | Deberá resolver orden, receta o formulación operativa, lote, área, ubicación, stock y consumo antes de decidir.                                              |
| FOGO y roadmap funcional | Deberán crear permisos atómicos para ejecución, estados, rendimiento, merma, calidad, terminación, liberación, reversión y cierre del lote.                  |
| Integración FOGO–NEXO    | Deberá definir efectos idempotentes de consumo y producto terminado, evitando duplicar movimientos o permitir inconsistencias entre producción e inventario. |
| BLOQUE R                 | Implementará la transición física mediante migraciones versionadas en `vento-shell`, pruebas, reconciliación y rollback.                                     |

#### 16. Criterios de aprobación

1. `produccion_panaderia` queda definido como rol operativo temporal de Galletería y Panadería central.
2. Las 16 concesiones son explícitas y compatibles con el carril operativo.
3. El rol requiere turno, Centro de Producción y área activa exacta de Galletería y Panadería.
4. Puede entrar a FOGO y NEXO sin que `access` funcione como wildcard.
5. Puede consultar órdenes y recetario o formulación operativa aplicables a su área.
6. Puede consultar y crear lotes productivos vinculados a órdenes válidas.
7. Puede consultar insumos, ubicaciones, stock y trazabilidad estrictamente necesarios.
8. Puede registrar retiros únicamente como consumo trazable contra orden o lote.
9. No administra recetas maestras ni recibe capacidades de bodega, remisiones, logística, compras o caja.
10. Compartir sede con otras áreas no amplía su matriz.
11. Las 96 capacidades restantes permanecen denegadas por defecto.
12. No se implementa código, Supabase ni migraciones en esta tarea.
13. `AUTH-RBAC-016` permanece sin iniciar hasta solicitud expresa.

#### 17. Estado final de la propuesta

| Tarea         | Estado      |
| ------------- | ----------- |
| AUTH-RBAC-014 | APROBADA    |
| AUTH-RBAC-015 | APROBADA    |
| AUTH-RBAC-016 | NO INICIADA |

No se implementan código, migraciones, cambios en Supabase, RLS, RPC, datasets, repositorios, guards, dispositivos ni pantallas. La matriz solo será canónica cuando el usuario la apruebe expresamente.


### ✅ AUTH-RBAC-016 — Crear matriz de produccion_reposteria

#### 1. Identificación de la tarea

| Campo                     | Valor                                                                |
| ------------------------- | -------------------------------------------------------------------- |
| Bloque                    | BLOQUE D — Matrices canónicas de roles, excepciones y dispositivos   |
| Tarea                     | AUTH-RBAC-016 — Crear matriz de produccion_reposteria                |
| Estado                    | APROBADA                                                             |
| Naturaleza                | Definición documental de matriz operativa de repostería y pastelería |
| Implementación física     | No incluida                                                          |
| Catálogo evaluado         | 112 permisos canónicos vigentes                                      |
| Tarea anterior vigente    | AUTH-RBAC-015 — APROBADA                                             |
| Tarea posterior reservada | AUTH-RBAC-017 — Crear matriz de bodeguero                            |

Esta tarea no modifica Supabase, migraciones, tablas, RLS, RPC, aplicaciones, repositorios ni datasets físicos. La aplicación posterior deberá realizarse mediante AUTH-RBAC-025 y las migraciones versionadas del BLOQUE R en `vento-shell`.

#### 2. Objetivo

Definir, permiso por permiso, las capacidades que puede ejercer el rol operativo `produccion_reposteria` durante un turno válido en Repostería del Centro de Producción, separando la ejecución productiva de la administración de recetas, la operación de bodega, la logística, las compras, la cocina satélite, Cocina Caliente, Galletería y Panadería.

#### 3. Decisión principal

`produccion_reposteria` representa la función temporal encargada de ejecutar producción de repostería y pastelería a partir de órdenes y recetarios o formulaciones operativas publicadas. Puede crear y consultar lotes de su área y registrar consumos de insumos trazables, pero no administra recetas maestras, inventario general, remisiones, compras, despacho ni la producción de Cocina Caliente, Galletería y Panadería u otras áreas productivas.

```text
ACTOR IDENTIFICADO
+ TURNO PUBLICADO Y VIGENTE
+ ROL produccion_reposteria
+ SEDE CENTRO DE PRODUCCIÓN
+ ÁREA ACTIVA REPOSTERÍA
+ CHECK-IN CUANDO EL PERMISO LO EXIJA
+ PERMISO OPERATIVO EXPLÍCITO
+ ORDEN / RECETA / FORMULACIÓN / LOTE / INVENTARIO COMPATIBLE
= AUTORIZACIÓN OPERATIVA DE REPOSTERÍA Y PASTELERÍA
```

No se admite:

```text
employees.role = repostero o pastelero → acceso permanente
produccion_reposteria = produccion_cocina o produccion_panaderia
fogo.access = autorización total de FOGO
recetario operativo = administración del maestro de recetas
crear lote = cerrar, aprobar o alterar cualquier lote
registrar retiro = control general de inventario
Centro de Producción = acceso a Cocina Caliente, Galletería y Panadería o bodega
plantilla production_center = rol automático
PIN del dispositivo = sustituto de turno, check-in o permiso
produccion_reposteria = remisiones, compras, despacho o logística
```

#### 4. Resultado cuantitativo de la matriz

| Resultado                                    | Cantidad | Efecto                                                                                                                                                                               |
| -------------------------------------------- | -------: | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Capacidades operativas asignadas             |       16 | Se conceden por el carril operativo dentro del contexto de Repostería y sobre órdenes, lotes, recetas o formulaciones operativas e inventario acotado.                               |
| Capacidades `BASE_AND_OPERATIONAL` asignadas |        0 | El rol operativo no recibe autoridad base adicional.                                                                                                                                 |
| Capacidades no asignadas                     |       96 | Permanecen denegadas por defecto por pertenecer al carril base, a Cocina Caliente, Galletería y Panadería u otras áreas productivas o a bodega, logística, compras y administración. |
| Total evaluado                               |      112 | Sin omisiones ni duplicados.                                                                                                                                                         |

La matriz contiene **16 concesiones operativas a nivel de clave** y **96 ausencias de concesión**. La ausencia de concesión produce denegación por defecto; no se crean filas `deny` redundantes.

#### 5. Perfiles de alcance utilizados

| Perfil                                | Significado                                                                                                                  |
| ------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| `CTX-PROD-PASTRY-FOGO-APP`            | Entrada operativa a FOGO con turno, rol, sede y área válidos. No concede capacidades internas.                               |
| `CTX-PROD-PASTRY-ORDER`               | Órdenes destinadas o asignadas a Repostería dentro del periodo productivo autorizado.                                        |
| `CTX-PROD-PASTRY-BATCH`               | Lotes de producción vinculados a órdenes, recetas y recursos del área activa.                                                |
| `CTX-PROD-PASTRY-BATCH-CREATE`        | Creación trazable e idempotente de lotes para Repostería.                                                                    |
| `CTX-PROD-PASTRY-RECIPE-BOOK`         | Proyección operativa publicada de recetas aplicables; excluye el maestro administrativo completo.                            |
| `CTX-PROD-PASTRY-NEXO-APP`            | Entrada operativa a NEXO para consumo y trazabilidad de insumos del área. No concede inventario general.                     |
| `CTX-PROD-PASTRY-REF`                 | Consulta mínima de productos, presentaciones, categorías y unidades necesarias para interpretar recetas, órdenes y consumos. |
| `CTX-PROD-PASTRY-INVENTORY-REF`       | Ubicaciones autorizadas y topología mínima necesaria para identificar el origen físico del insumo.                           |
| `CTX-PROD-PASTRY-INVENTORY-STOCK`     | Existencias de insumos limitadas a Repostería y a las ubicaciones compatibles.                                               |
| `CTX-PROD-PASTRY-INVENTORY-BATCH`     | Trazabilidad de inventario de lotes productivos vinculados al área y a sus órdenes.                                          |
| `CTX-PROD-PASTRY-WITHDRAWAL`          | Consulta de consumos propios o relacionados con el lote productivo autorizado.                                               |
| `CTX-PROD-PASTRY-WITHDRAWAL-REGISTER` | Registro de consumo de insumos contra orden o lote, con cantidad, unidad, ubicación, actor y trazabilidad.                   |

#### 6. Reglas obligatorias de la matriz

1. Cada concesión utiliza una clave canónica exacta; no existen wildcards, herencias implícitas ni autorización por nombre de rol.
2. El rol operativo efectivo procede exclusivamente del turno publicado y vigente. Los perfiles y dispositivos solo sugieren o restringen; nunca asignan el rol.
3. `produccion_reposteria` requiere Centro de Producción y un área operativa concreta compatible con Repostería.
4. El área activa no se infiere desde el producto, la receta, el dispositivo ni la sede seleccionada; debe proceder del turno válido.
5. Las concesiones con prerrequisito `T` pueden consultarse antes del check-in, pero continúan exigiendo turno, rol, sede y área válidos cuando el permiso o el rol lo requieran.
6. Las concesiones con prerrequisito `T+C` requieren turno y check-in activos, sede y área coincidentes y recurso resoluble.
7. `fogo.access` y `nexo.access` solo permiten entrar a sus aplicaciones y cargar el estado del contexto. No funcionan como wildcards.
8. `fogo.production.orders.view` se limita a órdenes destinadas o asignadas a Repostería. No concede reasignar, aprobar, modificar o cancelar órdenes.
9. `fogo.production.recipe_book.view` expone únicamente la versión operativa publicada y aplicable. No concede `fogo.production.recipes.view`, edición, exportación masiva ni acceso administrativo al maestro.
10. `fogo.production.batches.create` exige orden y receta aplicables, cantidades, responsable, área, estado e idempotencia válidos. No autoriza cualquier transición posterior del lote.
11. La consulta de productos, presentaciones, categorías y unidades desde NEXO se limita a la proyección mínima necesaria para ejecutar producción y registrar consumos.
12. La consulta de stock, LPN, lotes y retiros se limita a insumos, ubicaciones, órdenes y lotes relacionados con Repostería; no concede inventario general de la sede.
13. `nexo.inventory.withdrawals.register` solo registra consumo trazable contra una orden o lote válido. No concede ajustes, entradas, traslados, conteos ni inventario negativo.
14. La creación del lote productivo y el registro de consumo son operaciones distintas; ninguna debe duplicar efectos de inventario ni sustituir la integración canónica entre FOGO y NEXO.
15. No se asignan remisiones: la recepción, preparación, despacho y transporte pertenecen a roles y procesos diferentes.
16. No se asignan compras ni recepciones de ORIGO; el acceso a proveedores u órdenes de compra no es necesario para ejecutar Repostería.
17. No se asignan capacidades de Cocina Caliente, Galletería y Panadería o bodega por compartir la misma sede. Cada área conserva su rol y matriz propios.
18. APP-REVIEW, demo, pruebas, recursos aislados y sedes no habilitadas permanecen excluidos.
19. Las denegaciones individuales, estructurales, de recurso, dispositivo o aislamiento prevalecen sobre esta matriz.
20. Todo permiso nuevo se deniega hasta que una versión canónica posterior lo evalúe expresamente para `produccion_reposteria`.

#### 7. Matriz canónica completa
##### 7.1 SHELL — 1 permisos

| Permiso        | Capacidad humana  | Modalidad   | Decisión para produccion_reposteria | Alcance aprobado                                                       | Condición                                                                                              |
| -------------- | ----------------- | ----------- | ----------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `shell.access` | Entrar a Vento OS | `BASE_ONLY` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.2 ANIMA — 10 permisos

| Permiso                                     | Capacidad humana                     | Modalidad   | Decisión para produccion_reposteria | Alcance aprobado                                                       | Condición                                                                                              |
| ------------------------------------------- | ------------------------------------ | ----------- | ----------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `anima.access`                              | Entrar a ANIMA                       | `BASE_ONLY` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.employee_documents.view`   | Consultar documentos de trabajadores | `BASE_ONLY` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.employee_documents.upload` | Cargar documentos de trabajadores    | `BASE_ONLY` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.employee_documents.delete` | Eliminar documentos de trabajadores  | `BASE_ONLY` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.employee_photos.upload`    | Cargar fotografías de trabajadores   | `BASE_ONLY` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.team_members.view`         | Consultar integrantes del equipo     | `BASE_ONLY` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.staff_invitations.create`  | Invitar trabajadores                 | `BASE_ONLY` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.attendance.shifts.create`            | Crear turnos                         | `BASE_ONLY` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.attendance.shifts.update`            | Actualizar turnos                    | `BASE_ONLY` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.attendance.shifts.cancel`            | Cancelar turnos                      | `BASE_ONLY` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.3 AURA — 1 permisos

| Permiso       | Capacidad humana | Modalidad   | Decisión para produccion_reposteria | Alcance aprobado                                                       | Condición                                                                                              |
| ------------- | ---------------- | ----------- | ----------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `aura.access` | Entrar a AURA    | `BASE_ONLY` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.4 FOGO — 6 permisos

| Permiso                            | Capacidad humana                | Modalidad             | Decisión para produccion_reposteria | Alcance aprobado                                                                                                                                                    | Condición                                                                                                                                                                                                            |
| ---------------------------------- | ------------------------------- | --------------------- | ----------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `fogo.access`                      | Entrar a FOGO                   | `BASE_OR_OPERATIONAL` | **ASIGNAR OPERATIVO**               | CTX-PROD-PASTRY-FOGO-APP — turno publicado y vigente, rol `produccion_reposteria`, Centro de Producción habilitado y área activa exacta de Repostería.              | Carril operativo con prerrequisito `T`. Permite entrar a FOGO, ver el estado del contexto y los bloqueos. No concede por sí solo lotes, órdenes, recetario ni otra capacidad.                                        |
| `fogo.production.batches.view`     | Consultar lotes de producción   | `BASE_OR_OPERATIONAL` | **ASIGNAR OPERATIVO**               | CTX-PROD-PASTRY-BATCH — lotes vinculados a órdenes y ejecución de Repostería dentro del Centro de Producción.                                                       | Turno y check-in activos. La consulta se limita a lotes del área productiva activa y a la información necesaria para ejecutar y verificar la producción; no concede información de otras áreas.                      |
| `fogo.production.batches.create`   | Crear lotes de producción       | `OPERATIONAL_ONLY`    | **ASIGNAR OPERATIVO**               | CTX-PROD-PASTRY-BATCH-CREATE — creación de lotes para órdenes válidas asignadas a Repostería, con receta publicada, cantidades, unidad, responsable y trazabilidad. | Turno y check-in activos. La creación debe ser idempotente, validar orden, receta operativa, área, cantidades y estado, y atribuir el lote al actor efectivo. No permite editar recetas maestras.                    |
| `fogo.production.orders.view`      | Consultar órdenes de producción | `BASE_OR_OPERATIONAL` | **ASIGNAR OPERATIVO**               | CTX-PROD-PASTRY-ORDER — órdenes de producción destinadas o asignadas a Repostería y vigentes para el turno o periodo operativo autorizado.                          | Carril operativo con prerrequisito `T`. Permite preparar la jornada consultando instrucciones y prioridades; no permite modificar, reasignar, aprobar ni cancelar órdenes.                                           |
| `fogo.production.recipe_book.view` | Consultar recetario operativo   | `OPERATIONAL_ONLY`    | **ASIGNAR OPERATIVO**               | CTX-PROD-PASTRY-RECIPE-BOOK — proyección operativa publicada de recetas aplicables a órdenes de Repostería, con porciones, insumos, proceso y controles necesarios. | Carril operativo con prerrequisito `T`. Solo recetario operativo vigente y aplicable; sin costos, márgenes, secretos administrativos, versiones borrador, edición, exportación masiva ni acceso al maestro completo. |
| `fogo.production.recipes.view`     | Consultar recetas               | `BASE_ONLY`           | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                              | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                               |

##### 7.5 NEXO — 63 permisos

| Permiso                                      | Capacidad humana                         | Modalidad              | Decisión para produccion_reposteria | Alcance aprobado                                                                                                                          | Condición                                                                                                                                                                                                                           |
| -------------------------------------------- | ---------------------------------------- | ---------------------- | ----------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `nexo.access`                                | Entrar a NEXO                            | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**               | CTX-PROD-PASTRY-NEXO-APP — turno publicado y vigente, rol `produccion_reposteria`, Centro de Producción y área activa de Repostería.      | Carril operativo con prerrequisito `T`. Permite entrar a NEXO y ver el contexto del área. No concede por sí solo inventario, movimientos, retiros ni otra capacidad.                                                                |
| `nexo.catalog.products.view`                 | Consultar productos                      | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**               | CTX-PROD-PASTRY-REF — productos e insumos vigentes aplicables a recetas, lotes o retiros de Repostería.                                   | Turno vigente. Proyección mínima de identificación; excluye costos, márgenes, proveedores, configuración y campos técnicos no necesarios.                                                                                           |
| `nexo.catalog.products.create`               | Crear productos                          | `BASE_ONLY`            | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.catalog.presentations.view`            | Consultar presentaciones                 | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**               | CTX-PROD-PASTRY-REF — presentaciones, empaques y conversiones publicadas necesarias para interpretar insumos y cantidades productivas.    | Turno vigente. Solo lectura; no permite crear ni modificar presentaciones.                                                                                                                                                          |
| `nexo.catalog.request_policies.view`         | Consultar políticas de solicitud         | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Repostería.                                                                    |
| `nexo.catalog.categories.view`               | Consultar categorías                     | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**               | CTX-PROD-PASTRY-REF — categorías necesarias para localizar insumos y productos relacionados con Repostería.                               | Turno vigente. Solo lectura y búsqueda; no permite administrar categorías.                                                                                                                                                          |
| `nexo.catalog.units.view`                    | Consultar unidades                       | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**               | CTX-PROD-PASTRY-REF — unidades, equivalencias y empaques publicados necesarios para recetas, lotes y consumos.                            | Turno vigente. Solo lectura; no permite modificar unidades ni factores de conversión.                                                                                                                                               |
| `nexo.assets.items.view`                     | Consultar activos                        | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Repostería.                                                                    |
| `nexo.assets.items.create`                   | Crear activos                            | `BASE_ONLY`            | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.assets.groups.view`                    | Consultar grupos de activos              | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Repostería.                                                                    |
| `nexo.assets.counts.view`                    | Consultar conteos de activos             | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Repostería.                                                                    |
| `nexo.inventory.adjustments.view`            | Consultar ajustes de inventario          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Repostería.                                                                    |
| `nexo.inventory.adjustments.register`        | Registrar ajustes de inventario          | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | Capacidad combinada o excepcional. Requiere autoridad base explícita además del contexto operativo; esta matriz no aporta el carril base.                                                                                           |
| `nexo.inventory.entries.view`                | Consultar entradas de inventario         | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Repostería.                                                                    |
| `nexo.inventory.entries.register`            | Registrar entradas de inventario         | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Repostería.                                                                    |
| `nexo.inventory.entries.override`            | Registrar entradas excepcionales         | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | Capacidad combinada o excepcional. Requiere autoridad base explícita además del contexto operativo; esta matriz no aporta el carril base.                                                                                           |
| `nexo.inventory.locations.view`              | Consultar ubicaciones de inventario      | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**               | CTX-PROD-PASTRY-INVENTORY-REF — ubicaciones activas desde las que Repostería está autorizada a consumir o consultar insumos.              | Turno vigente y área activa válida. La consulta se limita a topología necesaria para la operación; no concede asignar ubicaciones ni administrar su catálogo.                                                                       |
| `nexo.inventory.location_assignments.assign` | Asignar ubicaciones de inventario        | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Repostería.                                                                    |
| `nexo.inventory.location_catalog.update`     | Actualizar el catálogo de una ubicación  | `BASE_ONLY`            | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.inventory.lpns.view`                   | Consultar LPN                            | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**               | CTX-PROD-PASTRY-INVENTORY-LPN — LPN o contenedores relacionados con insumos disponibles para Repostería o con el lote productivo activo.  | Turno y check-in activos. Debe limitar contenido, posición, custodia y trazabilidad al recurso que el actor necesita identificar; no concede movimientos ni reasignaciones.                                                         |
| `nexo.inventory.movements.view`              | Consultar movimientos de inventario      | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Repostería.                                                                    |
| `nexo.inventory.stock.view`                  | Consultar stock                          | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**               | CTX-PROD-PASTRY-INVENTORY-STOCK — existencias de insumos disponibles para consumo autorizado por Repostería en ubicaciones compatibles.   | Turno y check-in activos. Consulta sensible y acotada al área, ubicación, producto y lote aplicables; no permite consultar inventario general de la sede ni de otras áreas.                                                         |
| `nexo.inventory.production_batches.view`     | Consultar lotes vinculados al inventario | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**               | CTX-PROD-PASTRY-INVENTORY-BATCH — trazabilidad de inventario derivada de lotes creados por Repostería o vinculados a sus órdenes activas. | Turno y check-in activos. Solo lectura de disponibilidad, lote y trazabilidad necesaria para verificar el efecto productivo; no concede ajustes, entradas manuales ni movimientos.                                                  |
| `nexo.inventory.transfers.view`              | Consultar traslados de inventario        | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Repostería.                                                                    |
| `nexo.inventory.transfers.create`            | Crear traslados de inventario            | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Repostería.                                                                    |
| `nexo.inventory.withdrawals.view`            | Consultar retiros de inventario          | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**               | CTX-PROD-PASTRY-WITHDRAWAL — retiros o consumos asociados al actor, al lote activo o a Repostería dentro del turno vigente.               | Turno y check-in activos. La consulta se limita a consumos propios o del recurso productivo autorizado; no expone retiros generales de otras áreas o trabajadores.                                                                  |
| `nexo.inventory.withdrawals.register`        | Registrar retiros de inventario          | `OPERATIONAL_ONLY`     | **ASIGNAR OPERATIVO**               | CTX-PROD-PASTRY-WITHDRAWAL-REGISTER — registro de consumo de insumos desde ubicaciones autorizadas hacia una orden o lote de Repostería.  | Turno y check-in activos. Validar stock, presentación, unidad, lote, ubicación, cantidad, receta u orden relacionada, idempotencia y concurrencia. No permite inventario negativo, ajustes, traslados ni consumos sin trazabilidad. |
| `nexo.inventory.zones.view`                  | Consultar zonas de almacenamiento        | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Repostería.                                                                    |
| `nexo.inventory.storage_positions.view`      | Consultar posiciones de almacenamiento   | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Repostería.                                                                    |
| `nexo.inventory.warehouse_operations.view`   | Consultar operaciones de bodega          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Repostería.                                                                    |
| `nexo.inventory.stock_validations.perform`   | Ejecutar validaciones de inventario      | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Repostería.                                                                    |
| `nexo.inventory.stock_counts.view`           | Consultar conteos de inventario          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Repostería.                                                                    |
| `nexo.inventory.stock_counts.perform`        | Ejecutar conteos de inventario           | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Repostería.                                                                    |
| `nexo.inventory.initial_counts.view`         | Consultar conteos iniciales              | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Repostería.                                                                    |
| `nexo.inventory.remissions.view`             | Consultar remisiones                     | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Repostería.                                                                    |
| `nexo.inventory.remissions.update`           | Actualizar remisiones                    | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Repostería.                                                                    |
| `nexo.inventory.remissions.request`          | Solicitar remisiones                     | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Repostería.                                                                    |
| `nexo.inventory.remissions.prepare`          | Preparar remisiones                      | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Repostería.                                                                    |
| `nexo.inventory.remissions.dispatch`         | Despachar remisiones                     | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Repostería.                                                                    |
| `nexo.inventory.remissions.receive`          | Recibir remisiones                       | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Repostería.                                                                    |
| `nexo.inventory.remissions.cancel`           | Cancelar remisiones                      | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Repostería.                                                                    |
| `nexo.logistics.operations_board.view`       | Consultar tablero logístico              | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Repostería.                                                                    |
| `nexo.logistics.operations.view`             | Consultar operaciones logísticas         | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Repostería.                                                                    |
| `nexo.logistics.driver_operations.view`      | Consultar operaciones de conductores     | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Repostería.                                                                    |
| `nexo.logistics.fulfillment.view`            | Consultar cumplimiento logístico         | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Repostería.                                                                    |
| `nexo.logistics.fulfillment_routes.view`     | Consultar rutas de cumplimiento          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Repostería.                                                                    |
| `nexo.logistics.supply_routes.view`          | Consultar rutas de abastecimiento        | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Repostería.                                                                    |
| `nexo.finance.internal_invoices.view`        | Consultar facturas internas              | `BASE_ONLY`            | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.finance.internal_invoices.generate`    | Generar facturas internas                | `BASE_ONLY`            | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.finance.internal_invoices.issue`       | Emitir facturas internas                 | `BASE_ONLY`            | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.finance.internal_invoices.cancel`      | Cancelar facturas internas               | `BASE_ONLY`            | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.finance.internal_invoice_amounts.view` | Consultar valores de facturas internas   | `BASE_ONLY`            | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.finance.internal_prices.view`          | Consultar precios internos               | `BASE_ONLY`            | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.finance.internal_variances.view`       | Consultar variaciones internas           | `BASE_ONLY`            | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.finance.internal_variances.approve`    | Aprobar variaciones internas             | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | Capacidad combinada o excepcional. Requiere autoridad base explícita además del contexto operativo; esta matriz no aporta el carril base.                                                                                           |
| `nexo.finance.internal_variances.resolve`    | Resolver variaciones internas            | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | Capacidad combinada o excepcional. Requiere autoridad base explícita además del contexto operativo; esta matriz no aporta el carril base.                                                                                           |
| `nexo.finance.cost_centers.view`             | Consultar centros de costo en NEXO       | `BASE_ONLY`            | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.analytics.internal_reports.view`       | Consultar reportes internos              | `BASE_ONLY`            | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.analytics.margin_reports.view`         | Consultar reportes de margen             | `BASE_ONLY`            | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.printing.templates.update`             | Editar plantillas de impresión           | `BASE_ONLY`            | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.printing.jobs.view`                    | Consultar trabajos de impresión          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | La capacidad pertenece a bodega, logística, inventario general, configuración, finanzas o una operación no necesaria para la producción ordinaria de Repostería.                                                                    |
| `nexo.settings.sites.view`                   | Consultar configuración de sedes         | `BASE_ONLY`            | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |
| `nexo.settings.remission_policies.view`      | Consultar políticas de remisiones        | `BASE_ONLY`            | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                    | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                              |

##### 7.6 NUMERA — 6 permisos

| Permiso                                   | Capacidad humana               | Modalidad   | Decisión para produccion_reposteria | Alcance aprobado                                                       | Condición                                                                                              |
| ----------------------------------------- | ------------------------------ | ----------- | ----------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `numera.access`                           | Entrar a NUMERA                | `BASE_ONLY` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.finance.cost_centers.view`        | Consultar centros de costo     | `BASE_ONLY` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.finance.expenses.view`            | Consultar gastos               | `BASE_ONLY` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.analytics.break_even.view`        | Consultar punto de equilibrio  | `BASE_ONLY` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.analytics.profitability.view`     | Consultar rentabilidad         | `BASE_ONLY` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.analytics.financial_reports.view` | Consultar reportes financieros | `BASE_ONLY` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.7 ORIGO — 5 permisos

| Permiso                                  | Capacidad humana                  | Modalidad             | Decisión para produccion_reposteria | Alcance aprobado                                                       | Condición                                                                                                           |
| ---------------------------------------- | --------------------------------- | --------------------- | ----------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| `origo.access`                           | Entrar a ORIGO                    | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece a compras, recepción o proveedores y no corresponde a la ejecución productiva de Repostería. |
| `origo.procurement.purchase_orders.view` | Consultar órdenes de compra       | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece a compras, recepción o proveedores y no corresponde a la ejecución productiva de Repostería. |
| `origo.procurement.receipts.view`        | Consultar recepciones de compra   | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece a compras, recepción o proveedores y no corresponde a la ejecución productiva de Repostería. |
| `origo.procurement.suppliers.view`       | Consultar proveedores             | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece a compras, recepción o proveedores y no corresponde a la ejecución productiva de Repostería. |
| `origo.catalog.product_reviews.view`     | Consultar revisiones de productos | `BASE_ONLY`           | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.              |

##### 7.8 VENTO PASS — 1 permisos

| Permiso       | Capacidad humana    | Modalidad   | Decisión para produccion_reposteria | Alcance aprobado                                                       | Condición                                                                                              |
| ------------- | ------------------- | ----------- | ----------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `pass.access` | Entrar a Vento Pass | `BASE_ONLY` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.9 PULSO — 2 permisos

| Permiso                              | Capacidad humana                        | Modalidad              | Decisión para produccion_reposteria | Alcance aprobado                                                       | Condición                                                                                                                                 |
| ------------------------------------ | --------------------------------------- | ---------------------- | ----------------------------------- | ---------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| `pulso.access`                       | Entrar a PULSO                          | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | PULSO pertenece a la operación comercial del punto de venta y no corresponde a la producción central de Repostería.                       |
| `pulso.delivery.deliveries.override` | Confirmar entregas de forma excepcional | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad combinada o excepcional. Requiere autoridad base explícita además del contexto operativo; esta matriz no aporta el carril base. |

##### 7.10 VISO — 17 permisos

| Permiso                                       | Capacidad humana                          | Modalidad   | Decisión para produccion_reposteria | Alcance aprobado                                                       | Condición                                                                                              |
| --------------------------------------------- | ----------------------------------------- | ----------- | ----------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `viso.access`                                 | Entrar a VISO                             | `BASE_ONLY` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.platform.app_updates.view`              | Consultar actualizaciones de aplicaciones | `BASE_ONLY` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.organization.businesses.view`           | Consultar empresas y unidades de negocio  | `BASE_ONLY` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.workforce.employees.view`               | Consultar trabajadores                    | `BASE_ONLY` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.workforce.staff_calendar.view`          | Consultar calendario del personal         | `BASE_ONLY` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.workforce.schedules.view`               | Consultar programación de turnos          | `BASE_ONLY` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.workforce.vacancies.view`               | Consultar vacantes                        | `BASE_ONLY` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.authorization.context_simulations.view` | Consultar simulaciones de autorización    | `BASE_ONLY` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.authorization.audit_logs.view`          | Consultar auditoría de autorización       | `BASE_ONLY` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.catalog.commercial_categories.view`     | Consultar categorías comerciales          | `BASE_ONLY` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.content.content_blocks.view`            | Consultar bloques de contenido            | `BASE_ONLY` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.content.menu.view`                      | Consultar menú                            | `BASE_ONLY` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.content.website_content.view`           | Consultar contenido del sitio web         | `BASE_ONLY` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.finance.accounting.view`                | Consultar información contable            | `BASE_ONLY` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.delivery.rates.view`                    | Consultar tarifas de entrega              | `BASE_ONLY` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.loyalty.products.view`                  | Consultar productos de fidelización       | `BASE_ONLY` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.loyalty.customers.view`                 | Consultar clientes de fidelización        | `BASE_ONLY` | **NO ASIGNAR**                      | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |



#### 8. Resumen por aplicación

| Aplicación | Permisos canónicos | Asignados | No asignados |
| ---------- | -----------------: | --------: | -----------: |
| SHELL      |                  1 |         0 |            1 |
| ANIMA      |                 10 |         0 |           10 |
| AURA       |                  1 |         0 |            1 |
| FOGO       |                  6 |         5 |            1 |
| NEXO       |                 63 |        11 |           52 |
| NUMERA     |                  6 |         0 |            6 |
| ORIGO      |                  5 |         0 |            5 |
| VENTO PASS |                  1 |         0 |            1 |
| PULSO      |                  2 |         0 |            2 |
| VISO       |                 17 |         0 |           17 |
| **Total**  |            **112** |    **16** |       **96** |

#### 9. Flujo operativo autorizado

```text
TURNO VÁLIDO DE REPOSTERÍA
        ↓
ENTRAR A FOGO
        ↓
CONSULTAR ÓRDENES Y RECETARIO OPERATIVO
        ↓
TURNO + CHECK-IN
        ↓
CONSULTAR / CREAR LOTE DE PRODUCCIÓN
        ↓
ENTRAR A NEXO
        ↓
CONSULTAR INSUMOS, UBICACIONES Y STOCK AUTORIZADO
        ↓
REGISTRAR CONSUMO CONTRA ORDEN O LOTE
        ↓
CONSULTAR TRAZABILIDAD DEL LOTE EN INVENTARIO
```

La matriz permite iniciar la ejecución productiva y registrar consumos trazables, pero el catálogo vigente no contiene todavía permisos atómicos para todas las transiciones del lote, control de calidad, rendimiento, merma, cierre productivo o ingreso automático del producto terminado.

#### 10. Capacidades expresamente no concedidas

- cualquier permiso exclusivo del carril base;
- administración del maestro completo de recetas;
- creación, modificación o archivo de recetas;
- modificación, reasignación, aprobación o cancelación de órdenes de producción;
- cierre, liberación, rechazo o reversión de lotes cuando no exista permiso atómico aprobado;
- producción de Cocina Caliente, Panadería o Galletería por inferencia;
- inventario general del Centro de Producción o de otras áreas;
- movimientos, entradas, ajustes, traslados, conteos o validaciones de stock;
- asignación de ubicaciones, administración de LPN, zonas o posiciones;
- preparación, despacho, transporte, recepción o cancelación de remisiones;
- compras, órdenes de compra, proveedores y recepciones de ORIGO;
- operación comercial, caja, pedidos, pagos o fidelización de PULSO;
- facturas internas, costos, márgenes, gastos, contabilidad o NUMERA;
- gestión de personal, turnos, permisos, seguridad o VISO;
- acceso a APP-REVIEW o a sedes y áreas no habilitadas;
- cualquier permiso futuro no evaluado expresamente.

#### 11. Brechas del catálogo identificadas

El catálogo vigente permite consultar órdenes, consultar el recetario o formulación operativa, consultar y crear lotes, pero no representa todavía de forma atómica varias operaciones esenciales del ciclo productivo:

- aceptar o iniciar una orden de producción;
- cambiar el estado de una orden o lote;
- pausar, reanudar, cancelar o reabrir una ejecución;
- registrar cantidades planificadas, producidas, rechazadas y aprovechables;
- registrar consumo teórico y consumo real por insumo;
- registrar sustituciones de ingredientes autorizadas;
- registrar merma, desperdicio, reproceso y causas;
- registrar tiempos, temperatura, responsables y controles del proceso;
- registrar control de calidad, liberación o rechazo;
- confirmar producto terminado, presentación, lote, vencimiento y ubicación destino;
- integrar de forma idempotente FOGO con movimientos de inventario en NEXO;
- corregir una producción mediante reversión trazable, no mediante edición destructiva;
- imprimir etiquetas o documentos operativos del lote con permiso propio;
- consultar historial y evidencia del lote dentro del área autorizada;
- distinguir creación del lote, ejecución, terminación, liberación y cierre administrativo.

Estas brechas no amplían la matriz. `fogo.production.batches.create` no podrá interpretarse como permiso para ejecutar todas las transiciones del ciclo de vida ni para producir efectos de inventario no definidos contractualmente.

#### 12. Dispositivo compartido de producción

La plantilla legacy `production_center` puede habilitar FOGO, NEXO y SHELL como superficies disponibles, pero no concede ninguna matriz. Antes de ejecutar una acción deberá existir:

```text
DISPOSITIVO TÉCNICO ACTIVO
+ ACTOR IDENTIFICADO
+ PIN O AUTENTICACIÓN EXIGIDA
+ TURNO produccion_reposteria VÁLIDO
+ ÁREA DEL DISPOSITIVO = ÁREA DEL TURNO = REPOSTERÍA
+ CHECK-IN CUANDO CORRESPONDA
+ PERMISO DE ESTA MATRIZ
= ACCIÓN ATRIBUIBLE AL TRABAJADOR
```

La política `same_site_active_worker` de la plantilla legacy es insuficiente porque permitiría actores de otras áreas del Centro de Producción. La implementación futura deberá exigir coincidencia de área y rol operativo, y reemplazar `navigation_role = cocinero` por una configuración que distinga `produccion_cocina`, `produccion_panaderia` y `produccion_reposteria`. No se aceptará una sesión anónima ni una acción atribuida al usuario técnico del dispositivo.

#### 13. Relación con el estado legacy

La auditoría encontró 15 turnos históricos y una asignación de sede/área para `produccion_reposteria`, pero **0 permisos operativos**. La operación de FOGO puede depender todavía de los roles base legacy `repostero` y `pastelero`, de rutas sin protección suficiente o de lógica especial no canónica.

```text
0 PERMISOS OPERATIVOS LEGACY
        ↓
VALIDACIÓN CONTRA 112 PERMISOS CANÓNICOS
        ↓
16 CONCESIONES OPERATIVAS EXPLÍCITAS
├── 5 capacidades de FOGO
└── 11 capacidades mínimas de NEXO
```

La propuesta no copia permisos permanentes de los roles base `repostero` ni `pastelero`. Construye una matriz operativa nueva, limitada al turno, al Centro de Producción, a Repostería y a los recursos productivos e inventarios relacionados.

#### 14. Validaciones de integridad

- ✅ Los 112 permisos canónicos fueron evaluados exactamente una vez.
- ✅ Las cantidades por aplicación suman 112.
- ✅ Solo se asignaron permisos que admiten carril operativo.
- ✅ No se asignó ningún permiso `BASE_ONLY`.
- ✅ No se asignó ningún permiso `BASE_AND_OPERATIONAL`.
- ✅ Los cinco permisos operativos vigentes de FOGO fueron evaluados y asignados expresamente.
- ✅ Cada concesión tiene contexto, área y recurso explícitos.
- ✅ El rol exige turno, Centro de Producción y área de Repostería válidos.
- ✅ Las mutaciones y consultas vivas concedidas exigen check-in cuando corresponde.
- ✅ El recetario o formulación operativa no se confunde con el maestro administrativo de recetas.
- ✅ Los retiros se limitan a consumo trazable contra orden o lote.
- ✅ No se concedieron remisiones, logística, compras, bodega ni operación comercial.
- ✅ No existen wildcards ni permisos implícitos.
- ✅ APP-REVIEW, demo y áreas no habilitadas permanecen excluidas.
- ✅ Los permisos nuevos se deniegan por defecto.

#### 15. Impacto sobre tareas posteriores

| Tarea                    | Impacto                                                                                                                                                      |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| AUTH-RBAC-017            | Deberá reservar para `bodeguero` las operaciones generales de bodega, stock, entradas, ubicaciones, conteos, preparación y despacho.                         |
| AUTH-RBAC-021            | Podrá añadir una excepción operativa individual temporal sin modificar la plantilla general ni eliminar turno, área o recurso.                               |
| AUTH-RBAC-023            | Deberá restringir los dispositivos de producción por actor, rol, sede, área, aplicaciones y permisos compatibles.                                            |
| AUTH-RBAC-025            | Deberá proyectar estas 16 concesiones en el dataset canónico de matriz operativa.                                                                            |
| AUTH-RBAC-027            | Deberá confirmar que ninguna concesión produzca acceso a Cocina Caliente, Galletería y Panadería u otras áreas productivas o inventario global accidental.   |
| BLOQUE E                 | Deberá resolver orden, receta o formulación operativa, lote, área, ubicación, stock y consumo antes de decidir.                                              |
| FOGO y roadmap funcional | Deberán crear permisos atómicos para ejecución, estados, rendimiento, merma, calidad, terminación, liberación, reversión y cierre del lote.                  |
| Integración FOGO–NEXO    | Deberá definir efectos idempotentes de consumo y producto terminado, evitando duplicar movimientos o permitir inconsistencias entre producción e inventario. |
| BLOQUE R                 | Implementará la transición física mediante migraciones versionadas en `vento-shell`, pruebas, reconciliación y rollback.                                     |

#### 16. Criterios de aprobación

1. `produccion_reposteria` queda definido como rol operativo temporal de Repostería central.
2. Las 16 concesiones son explícitas y compatibles con el carril operativo.
3. El rol requiere turno, Centro de Producción y área activa exacta de Repostería.
4. Puede entrar a FOGO y NEXO sin que `access` funcione como wildcard.
5. Puede consultar órdenes y recetario o formulación operativa aplicables a su área.
6. Puede consultar y crear lotes productivos vinculados a órdenes válidas.
7. Puede consultar insumos, ubicaciones, stock y trazabilidad estrictamente necesarios.
8. Puede registrar retiros únicamente como consumo trazable contra orden o lote.
9. No administra recetas maestras ni recibe capacidades de bodega, remisiones, logística, compras o caja.
10. Compartir sede con otras áreas no amplía su matriz.
11. Las 96 capacidades restantes permanecen denegadas por defecto.
12. No se implementa código, Supabase ni migraciones en esta tarea.
13. `AUTH-RBAC-017` permanece sin iniciar hasta solicitud expresa.

#### 17. Estado final de la propuesta

| Tarea         | Estado      |
| ------------- | ----------- |
| AUTH-RBAC-015 | APROBADA    |
| AUTH-RBAC-016 | APROBADA    |
| AUTH-RBAC-017 | NO INICIADA |

No se implementan código, migraciones, cambios en Supabase, RLS, RPC, datasets, repositorios, guards, dispositivos ni pantallas. La matriz solo será canónica cuando el usuario la apruebe expresamente.
