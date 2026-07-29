### SECCIÓN — OPERATIVOS SERVICIO MOSTRADOR INTEGRAL

<!-- PLAN-SECTION-META:START -->
Esta sección reúne contenido canónico con una responsabilidad documental única dentro del plan. Debe conservarse cohesionada y actualizarse junto con sus referencias y validaciones dependientes.

**Cobertura canónica:** `AUTH-RBAC-011` a `AUTH-RBAC-013` — 3 tareas.
<!-- PLAN-SECTION-META:END -->

### ✅ AUTH-RBAC-011 — Crear matriz de servicio_salon

#### 1. Identificación de la tarea

| Campo                     | Valor                                                              |
| ------------------------- | ------------------------------------------------------------------ |
| Bloque                    | BLOQUE D — Matrices canónicas de roles, excepciones y dispositivos |
| Tarea                     | AUTH-RBAC-011 — Crear matriz de servicio_salon                     |
| Estado                    | **APROBADA**                                                       |
| Naturaleza                | Definición documental de matriz operativa de servicio de salón     |
| Implementación física     | No incluida                                                        |
| Catálogo evaluado         | 112 permisos canónicos vigentes                                    |
| Tarea anterior vigente    | AUTH-RBAC-010 — APROBADA                                           |
| Tarea posterior reservada | AUTH-RBAC-012 — Crear matriz de mostrador_satelite                 |

Esta tarea no modifica Supabase, migraciones, tablas, RLS, RPC, aplicaciones, repositorios ni datasets físicos. La aplicación posterior deberá realizarse mediante AUTH-RBAC-025 y las migraciones versionadas del BLOQUE R en `vento-shell`.

#### 2. Objetivo

Definir, permiso por permiso, las capacidades que puede ejercer el rol operativo `servicio_salon` durante un turno válido en un área de servicio de una sede satélite, sin recuperar permisos permanentes del rol base legacy `mesero` y sin convertir el acceso a PULSO en autorización implícita para gestionar mesas, tomar pedidos, modificar comandas, confirmar entregas, cobrar o cerrar servicios que todavía no están representados por permisos atómicos.

#### 3. Decisión principal

`servicio_salon` representa la función temporal de atención de mesas, acompañamiento al cliente y servicio de salón en un punto de venta satélite. Su autoridad existe únicamente dentro del contexto operativo vigente y sobre recursos compatibles con la sede, el área, la relación del actor y la etapa del servicio.

```text
ACTOR IDENTIFICADO
+ TURNO PUBLICADO Y VIGENTE
+ ROL servicio_salon
+ SEDE AUTORIZADA
+ ÁREA ACTIVA DE TIPO service
+ CHECK-IN CUANDO EL PERMISO LO EXIJA
+ PERMISO OPERATIVO EXPLÍCITO
+ RECURSO COMPATIBLE
= AUTORIZACIÓN OPERATIVA DE SERVICIO DE SALÓN
```

No se admite:

```text
employees.role = mesero → acceso permanente
pulso.access → autorización para gestionar mesas, pedidos o comandas
dispositivo de salón → rol automático
PIN del dispositivo → sustituto del permiso
sede seleccionada → autorización
servicio_salon → acceso a inventario general
servicio_salon → acceso automático a caja, cocina, mostrador o producción
servicio_salon → delivery.override automático
```

#### 4. Resultado cuantitativo de la matriz

| Resultado                                    | Cantidad | Efecto                                                                                                                                          |
| -------------------------------------------- | -------: | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| Capacidades operativas asignadas             |       11 | Se conceden por el carril operativo dentro del contexto de servicio de salón y de los recursos expresamente definidos.                          |
| Capacidades `BASE_AND_OPERATIONAL` asignadas |        0 | El rol operativo no recibe autoridad base adicional.                                                                                            |
| Capacidades no asignadas                     |      101 | Permanecen denegadas por defecto por pertenecer al carril base, a otros procesos operativos o a acciones sensibles ajenas al servicio de salón. |
| Total evaluado                               |      112 | Sin omisiones ni duplicados.                                                                                                                    |

La matriz contiene **11 concesiones operativas a nivel de clave** y **101 ausencias de concesión**. La ausencia de concesión produce denegación por defecto; no se crean filas `deny` redundantes.

#### 5. Perfiles de alcance utilizados

| Perfil                          | Significado                                                                                                                                      |
| ------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------ |
| `CTX-SERVICE-APP`               | Entrada operativa a una aplicación con turno y rol válidos. El permiso puede mostrar requisitos faltantes, pero no concede capacidades internas. |
| `CTX-SERVICE-REF`               | Consulta mínima de referencias necesarias para solicitar abastecimiento del salón, limitada a la sede, el área y el flujo vigentes.              |
| `CTX-SERVICE-REMISSION`         | Consulta de remisiones por relación legítima con la sede destino o el actor solicitante.                                                         |
| `CTX-SERVICE-REMISSION-OWN`     | Modificación exclusiva de solicitudes propias y todavía editables.                                                                               |
| `CTX-SERVICE-REMISSION-REQUEST` | Creación de solicitudes para la sede y el área activas con ruta, productos, presentaciones y políticas válidas.                                  |
| `CTX-SERVICE-PULSO`             | Entrada a la superficie de servicio de salón durante turno válido. No sustituye permisos de mesas, pedidos, comandas, entrega, cobro o cierre.   |

#### 6. Reglas obligatorias de la matriz

1. Cada concesión utiliza una clave canónica exacta; no existen wildcards, herencias implícitas ni autorización por el nombre del rol.
2. El rol operativo efectivo procede exclusivamente del turno publicado y vigente. Los perfiles y dispositivos solo sugieren o restringen; nunca asignan el rol.
3. `servicio_salon` requiere un área operativa concreta compatible con el tipo `service` y habilitada para la sede del turno.
4. Las concesiones con prerrequisito `T` pueden consultarse antes del check-in, pero continúan exigiendo turno y rol válidos.
5. Las concesiones con prerrequisito `T+C` requieren turno y check-in activos, sede y área coincidentes y recurso resoluble.
6. La sede activa se deriva del contexto válido; la sede seleccionada, primaria o enviada por el cliente no concede autoridad.
7. El permiso `pulso.access` solo permite entrar a PULSO y cargar la superficie compatible. No autoriza gestionar mesas, tomar pedidos, modificar comandas, confirmar entregas, cobrar, operar caja, anular, devolver, acumular puntos ni cerrar servicios.
8. La consulta de catálogo desde NEXO se limita a los atributos necesarios para identificar productos y presentaciones solicitables para el salón.
9. La consulta de remisiones se limita a la relación del actor o de la sede destino; no concede visibilidad de toda la red.
10. La actualización de remisiones se limita a solicitudes propias, estados editables y campos permitidos, con reautenticación y auditoría.
11. La solicitud de remisiones debe ser idempotente y validar políticas, ruta, destino, cantidades y presentaciones.
12. El catálogo actual no contiene permisos atómicos de mesas, pedidos, comandas, entrega ordinaria o atención al cliente. Esas capacidades no se deducen de `pulso.access`.
13. `pulso.delivery.deliveries.override` no se asigna al rol. Solo podrá obtenerse mediante autoridad base explícita y contexto operativo simultáneo.
14. APP-REVIEW, entornos demo, recursos aislados y sedes no habilitadas permanecen excluidos.
15. Las denegaciones individuales, estructurales, de recurso, dispositivo o aislamiento prevalecen sobre esta matriz.
16. Todo permiso nuevo se deniega hasta que una versión canónica posterior lo evalúe expresamente para `servicio_salon`.

#### 7. Matriz canónica completa
##### 7.1 SHELL — 1 permisos

| Permiso        | Capacidad humana  | Modalidad   | Decisión para servicio_salon | Alcance aprobado                                                       | Condición                                                                                              |
| -------------- | ----------------- | ----------- | ---------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `shell.access` | Entrar a Vento OS | `BASE_ONLY` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.2 ANIMA — 10 permisos

| Permiso                                     | Capacidad humana                     | Modalidad   | Decisión para servicio_salon | Alcance aprobado                                                       | Condición                                                                                              |
| ------------------------------------------- | ------------------------------------ | ----------- | ---------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `anima.access`                              | Entrar a ANIMA                       | `BASE_ONLY` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.employee_documents.view`   | Consultar documentos de trabajadores | `BASE_ONLY` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.employee_documents.upload` | Cargar documentos de trabajadores    | `BASE_ONLY` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.employee_documents.delete` | Eliminar documentos de trabajadores  | `BASE_ONLY` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.employee_photos.upload`    | Cargar fotografías de trabajadores   | `BASE_ONLY` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.team_members.view`         | Consultar integrantes del equipo     | `BASE_ONLY` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.staff_invitations.create`  | Invitar trabajadores                 | `BASE_ONLY` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.attendance.shifts.create`            | Crear turnos                         | `BASE_ONLY` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.attendance.shifts.update`            | Actualizar turnos                    | `BASE_ONLY` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.attendance.shifts.cancel`            | Cancelar turnos                      | `BASE_ONLY` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.3 AURA — 1 permisos

| Permiso       | Capacidad humana | Modalidad   | Decisión para servicio_salon | Alcance aprobado                                                       | Condición                                                                                              |
| ------------- | ---------------- | ----------- | ---------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `aura.access` | Entrar a AURA    | `BASE_ONLY` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.4 FOGO — 6 permisos

| Permiso                            | Capacidad humana                | Modalidad             | Decisión para servicio_salon | Alcance aprobado                                                       | Condición                                                                                                                                                                                                   |
| ---------------------------------- | ------------------------------- | --------------------- | ---------------------------- | ---------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `fogo.access`                      | Entrar a FOGO                   | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece al proceso productivo de FOGO y no se asigna automáticamente a la servicio de salón.                                                                                                 |
| `fogo.production.batches.view`     | Consultar lotes de producción   | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece al proceso productivo de FOGO y no se asigna automáticamente a la servicio de salón.                                                                                                 |
| `fogo.production.batches.create`   | Crear lotes de producción       | `OPERATIONAL_ONLY`    | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece al proceso productivo de FOGO y no se asigna automáticamente a la servicio de salón.                                                                                                 |
| `fogo.production.orders.view`      | Consultar órdenes de producción | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece al proceso productivo de FOGO y no se asigna automáticamente a la servicio de salón.                                                                                                 |
| `fogo.production.recipe_book.view` | Consultar recetario operativo   | `OPERATIONAL_ONLY`    | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | El recetario de FOGO no se concede por inferencia. La consulta de fórmulas o fichas de alimentos deberá contar con un permiso atómico y contrato de aplicabilidad propios antes de incorporarse a este rol. |
| `fogo.production.recipes.view`     | Consultar recetas               | `BASE_ONLY`           | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                      |

##### 7.5 NEXO — 63 permisos

| Permiso                                      | Capacidad humana                         | Modalidad              | Decisión para servicio_salon | Alcance aprobado                                                                                                                                                                                        | Condición                                                                                                                                                                                   |
| -------------------------------------------- | ---------------------------------------- | ---------------------- | ---------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `nexo.access`                                | Entrar a NEXO                            | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**        | CTX-SERVICE-APP — turno publicado y vigente, rol efectivo `servicio_salon`, sede activa autorizada y área operativa válida de tipo `service`. No exige check-in para mostrar la entrada y los bloqueos. | Carril operativo. Permite entrar a NEXO y ver el estado del contexto. No concede por sí solo catálogo, remisiones, inventario ni otra acción.                                               |
| `nexo.catalog.products.view`                 | Consultar productos                      | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**        | CTX-SERVICE-REF — consulta operativa de productos vigentes aplicables a la sede activa. Excluye costos, márgenes, existencias, recetas, proveedores y campos técnicos no necesarios.                    | Turno vigente y rol `servicio_salon` válido. La proyección se utiliza para identificar productos dentro del flujo de solicitud; no permite crear ni modificar el maestro.                   |
| `nexo.catalog.products.create`               | Crear productos                          | `BASE_ONLY`            | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.catalog.presentations.view`            | Consultar presentaciones                 | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**        | CTX-SERVICE-REF — consulta de presentaciones vigentes y solicitables para la sede y ruta aplicables.                                                                                                    | Turno vigente y rol válido. Solo lectura para seleccionar la presentación autorizada en una solicitud.                                                                                      |
| `nexo.catalog.request_policies.view`         | Consultar políticas de solicitud         | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**        | CTX-SERVICE-REF — consulta de políticas de solicitud aplicables al destino, producto, presentación y ruta de abastecimiento del contexto.                                                               | Turno vigente. No permite modificar políticas ni ignorar mínimos, frecuencias, ventanas o restricciones.                                                                                    |
| `nexo.catalog.categories.view`               | Consultar categorías                     | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**        | CTX-SERVICE-REF — consulta de categorías necesarias para buscar y organizar productos solicitables.                                                                                                     | Turno vigente. Solo lectura; no permite administrar categorías.                                                                                                                             |
| `nexo.catalog.units.view`                    | Consultar unidades                       | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**        | CTX-SERVICE-REF — consulta de unidades, empaques y equivalencias publicadas necesarias para interpretar presentaciones solicitables.                                                                    | Turno vigente. Solo lectura; no permite administrar unidades ni conversiones.                                                                                                               |
| `nexo.assets.items.view`                     | Consultar activos                        | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el salón o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.      |
| `nexo.assets.items.create`                   | Crear activos                            | `BASE_ONLY`            | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.assets.groups.view`                    | Consultar grupos de activos              | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el salón o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.      |
| `nexo.assets.counts.view`                    | Consultar conteos de activos             | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el salón o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.      |
| `nexo.inventory.adjustments.view`            | Consultar ajustes de inventario          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el salón o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.      |
| `nexo.inventory.adjustments.register`        | Registrar ajustes de inventario          | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | La capacidad exige autoridad base y contexto operativo simultáneos. Esta matriz no concede el componente base ni la capacidad completa.                                                     |
| `nexo.inventory.entries.view`                | Consultar entradas de inventario         | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el salón o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.      |
| `nexo.inventory.entries.register`            | Registrar entradas de inventario         | `OPERATIONAL_ONLY`     | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el salón o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.      |
| `nexo.inventory.entries.override`            | Registrar entradas excepcionales         | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | La capacidad exige autoridad base y contexto operativo simultáneos. Esta matriz no concede el componente base ni la capacidad completa.                                                     |
| `nexo.inventory.locations.view`              | Consultar ubicaciones de inventario      | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el salón o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.      |
| `nexo.inventory.location_assignments.assign` | Asignar ubicaciones de inventario        | `OPERATIONAL_ONLY`     | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el salón o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.      |
| `nexo.inventory.location_catalog.update`     | Actualizar el catálogo de una ubicación  | `BASE_ONLY`            | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.inventory.lpns.view`                   | Consultar LPN                            | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el salón o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.      |
| `nexo.inventory.movements.view`              | Consultar movimientos de inventario      | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el salón o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.      |
| `nexo.inventory.stock.view`                  | Consultar stock                          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | El stock exige área activa coincidente. El rol de cocina no recibe visibilidad general de existencias de cocina, bodega, otras cocinas ni otras áreas.                                      |
| `nexo.inventory.production_batches.view`     | Consultar lotes vinculados al inventario | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el salón o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.      |
| `nexo.inventory.transfers.view`              | Consultar traslados de inventario        | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el salón o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.      |
| `nexo.inventory.transfers.create`            | Crear traslados de inventario            | `OPERATIONAL_ONLY`     | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el salón o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.      |
| `nexo.inventory.withdrawals.view`            | Consultar retiros de inventario          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el salón o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.      |
| `nexo.inventory.withdrawals.register`        | Registrar retiros de inventario          | `OPERATIONAL_ONLY`     | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el salón o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.      |
| `nexo.inventory.zones.view`                  | Consultar zonas de almacenamiento        | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el salón o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.      |
| `nexo.inventory.storage_positions.view`      | Consultar posiciones de almacenamiento   | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el salón o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.      |
| `nexo.inventory.warehouse_operations.view`   | Consultar operaciones de bodega          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el salón o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.      |
| `nexo.inventory.stock_validations.perform`   | Ejecutar validaciones de inventario      | `OPERATIONAL_ONLY`     | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el salón o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.      |
| `nexo.inventory.stock_counts.view`           | Consultar conteos de inventario          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el salón o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.      |
| `nexo.inventory.stock_counts.perform`        | Ejecutar conteos de inventario           | `OPERATIONAL_ONLY`     | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el salón o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.      |
| `nexo.inventory.initial_counts.view`         | Consultar conteos iniciales              | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el salón o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.      |
| `nexo.inventory.remissions.view`             | Consultar remisiones                     | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**        | CTX-SERVICE-REMISSION — remisiones donde la sede activa sea destino, el actor sea solicitante o exista otra relación operativa explícita. No concede visibilidad general sobre otras sedes.             | Turno y check-in activos. Recurso resoluble y relacionado con el actor o la sede destino. Mostrar únicamente campos autorizados para el lado solicitante.                                   |
| `nexo.inventory.remissions.update`           | Actualizar remisiones                    | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**        | CTX-SERVICE-REMISSION-OWN — únicamente solicitudes creadas por el actor, en estados editables y sobre campos permitidos del lado solicitante.                                                           | Turno y check-in activos. Control optimista de versión, reautenticación fuerte y auditoría antes/después. No permite preparar, despachar, recibir, cancelar ni modificar el lado de origen. |
| `nexo.inventory.remissions.request`          | Solicitar remisiones                     | `OPERATIONAL_ONLY`     | **ASIGNAR OPERATIVO**        | CTX-SERVICE-REMISSION-REQUEST — crear una solicitud para la sede activa y desde el área `service`, utilizando origen, ruta, productos, presentaciones y políticas válidas.                              | Turno y check-in activos. Creación idempotente; validar destino, ruta, políticas, cantidades y presentaciones. El actor queda registrado como solicitante.                                  |
| `nexo.inventory.remissions.prepare`          | Preparar remisiones                      | `OPERATIONAL_ONLY`     | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el salón o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.      |
| `nexo.inventory.remissions.dispatch`         | Despachar remisiones                     | `OPERATIONAL_ONLY`     | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el salón o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.      |
| `nexo.inventory.remissions.receive`          | Recibir remisiones                       | `OPERATIONAL_ONLY`     | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | Recibir remisiones cambia cantidades y custodia en destino. Corresponde al rol de recepción autorizado, no automáticamente al personal de salón.                                            |
| `nexo.inventory.remissions.cancel`           | Cancelar remisiones                      | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | La cancelación no se concede por defecto al personal de salón. Una necesidad de cancelar solicitudes propias deberá definirse como política explícita o excepción operativa auditada.       |
| `nexo.logistics.operations_board.view`       | Consultar tablero logístico              | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el salón o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.      |
| `nexo.logistics.operations.view`             | Consultar operaciones logísticas         | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el salón o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.      |
| `nexo.logistics.driver_operations.view`      | Consultar operaciones de conductores     | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el salón o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.      |
| `nexo.logistics.fulfillment.view`            | Consultar cumplimiento logístico         | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el salón o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.      |
| `nexo.logistics.fulfillment_routes.view`     | Consultar rutas de cumplimiento          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el salón o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.      |
| `nexo.logistics.supply_routes.view`          | Consultar rutas de abastecimiento        | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**        | CTX-SERVICE-REF — consulta únicamente de rutas de abastecimiento vigentes relacionadas con la sede activa y utilizables para solicitudes.                                                               | Turno vigente. Solo lectura; no permite modificar rutas ni consultar configuración logística ajena al flujo de solicitud.                                                                   |
| `nexo.finance.internal_invoices.view`        | Consultar facturas internas              | `BASE_ONLY`            | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.finance.internal_invoices.generate`    | Generar facturas internas                | `BASE_ONLY`            | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.finance.internal_invoices.issue`       | Emitir facturas internas                 | `BASE_ONLY`            | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.finance.internal_invoices.cancel`      | Cancelar facturas internas               | `BASE_ONLY`            | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.finance.internal_invoice_amounts.view` | Consultar valores de facturas internas   | `BASE_ONLY`            | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.finance.internal_prices.view`          | Consultar precios internos               | `BASE_ONLY`            | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.finance.internal_variances.view`       | Consultar variaciones internas           | `BASE_ONLY`            | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.finance.internal_variances.approve`    | Aprobar variaciones internas             | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | La capacidad exige autoridad base y contexto operativo simultáneos. Esta matriz no concede el componente base ni la capacidad completa.                                                     |
| `nexo.finance.internal_variances.resolve`    | Resolver variaciones internas            | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | La capacidad exige autoridad base y contexto operativo simultáneos. Esta matriz no concede el componente base ni la capacidad completa.                                                     |
| `nexo.finance.cost_centers.view`             | Consultar centros de costo en NEXO       | `BASE_ONLY`            | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.analytics.internal_reports.view`       | Consultar reportes internos              | `BASE_ONLY`            | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.analytics.margin_reports.view`         | Consultar reportes de margen             | `BASE_ONLY`            | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.printing.templates.update`             | Editar plantillas de impresión           | `BASE_ONLY`            | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.printing.jobs.view`                    | Consultar trabajos de impresión          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el salón o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.      |
| `nexo.settings.sites.view`                   | Consultar configuración de sedes         | `BASE_ONLY`            | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.settings.remission_policies.view`      | Consultar políticas de remisiones        | `BASE_ONLY`            | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                  | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |

##### 7.6 NUMERA — 6 permisos

| Permiso                                   | Capacidad humana               | Modalidad   | Decisión para servicio_salon | Alcance aprobado                                                       | Condición                                                                                              |
| ----------------------------------------- | ------------------------------ | ----------- | ---------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `numera.access`                           | Entrar a NUMERA                | `BASE_ONLY` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.finance.cost_centers.view`        | Consultar centros de costo     | `BASE_ONLY` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.finance.expenses.view`            | Consultar gastos               | `BASE_ONLY` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.analytics.break_even.view`        | Consultar punto de equilibrio  | `BASE_ONLY` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.analytics.profitability.view`     | Consultar rentabilidad         | `BASE_ONLY` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.analytics.financial_reports.view` | Consultar reportes financieros | `BASE_ONLY` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.7 ORIGO — 5 permisos

| Permiso                                  | Capacidad humana                  | Modalidad             | Decisión para servicio_salon | Alcance aprobado                                                       | Condición                                                                                              |
| ---------------------------------------- | --------------------------------- | --------------------- | ---------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `origo.access`                           | Entrar a ORIGO                    | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece a compras, recepción o proveedores y no corresponde a la servicio de salón.     |
| `origo.procurement.purchase_orders.view` | Consultar órdenes de compra       | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece a compras, recepción o proveedores y no corresponde a la servicio de salón.     |
| `origo.procurement.receipts.view`        | Consultar recepciones de compra   | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece a compras, recepción o proveedores y no corresponde a la servicio de salón.     |
| `origo.procurement.suppliers.view`       | Consultar proveedores             | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece a compras, recepción o proveedores y no corresponde a la servicio de salón.     |
| `origo.catalog.product_reviews.view`     | Consultar revisiones de productos | `BASE_ONLY`           | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.8 VENTO PASS — 1 permisos

| Permiso       | Capacidad humana    | Modalidad   | Decisión para servicio_salon | Alcance aprobado                                                       | Condición                                                                                              |
| ------------- | ------------------- | ----------- | ---------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `pass.access` | Entrar a Vento Pass | `BASE_ONLY` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.9 PULSO — 2 permisos

| Permiso                              | Capacidad humana                        | Modalidad              | Decisión para servicio_salon | Alcance aprobado                                                                                                                | Condición                                                                                                                                                                                                                                                        |
| ------------------------------------ | --------------------------------------- | ---------------------- | ---------------------------- | ------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `pulso.access`                       | Entrar a PULSO                          | `OPERATIONAL_ONLY`     | **ASIGNAR OPERATIVO**        | CTX-SERVICE-PULSO — turno publicado y vigente, rol `servicio_salon`, sede autorizada y área operativa válida de tipo `service`. | Carril operativo. Permite entrar a PULSO y mostrar el contexto de servicio de salón. No autoriza por sí solo gestionar mesas, tomar pedidos, modificar comandas, confirmar entregas, cobrar, operar caja, anular, devolver, acumular puntos ni cerrar servicios. |
| `pulso.delivery.deliveries.override` | Confirmar entregas de forma excepcional | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                          | Capacidad `BASE_AND_OPERATIONAL` de excepción. Requiere autoridad base explícita, turno, check-in, reautenticación fuerte, motivo y auditoría reforzada.                                                                                                         |

##### 7.10 VISO — 17 permisos

| Permiso                                       | Capacidad humana                          | Modalidad   | Decisión para servicio_salon | Alcance aprobado                                                       | Condición                                                                                              |
| --------------------------------------------- | ----------------------------------------- | ----------- | ---------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `viso.access`                                 | Entrar a VISO                             | `BASE_ONLY` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.platform.app_updates.view`              | Consultar actualizaciones de aplicaciones | `BASE_ONLY` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.organization.businesses.view`           | Consultar empresas y unidades de negocio  | `BASE_ONLY` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.workforce.employees.view`               | Consultar trabajadores                    | `BASE_ONLY` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.workforce.staff_calendar.view`          | Consultar calendario del personal         | `BASE_ONLY` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.workforce.schedules.view`               | Consultar programación de turnos          | `BASE_ONLY` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.workforce.vacancies.view`               | Consultar vacantes                        | `BASE_ONLY` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.authorization.context_simulations.view` | Consultar simulaciones de autorización    | `BASE_ONLY` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.authorization.audit_logs.view`          | Consultar auditoría de autorización       | `BASE_ONLY` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.catalog.commercial_categories.view`     | Consultar categorías comerciales          | `BASE_ONLY` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.content.content_blocks.view`            | Consultar bloques de contenido            | `BASE_ONLY` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.content.menu.view`                      | Consultar menú                            | `BASE_ONLY` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.content.website_content.view`           | Consultar contenido del sitio web         | `BASE_ONLY` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.finance.accounting.view`                | Consultar información contable            | `BASE_ONLY` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.delivery.rates.view`                    | Consultar tarifas de entrega              | `BASE_ONLY` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.loyalty.products.view`                  | Consultar productos de fidelización       | `BASE_ONLY` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.loyalty.customers.view`                 | Consultar clientes de fidelización        | `BASE_ONLY` | **NO ASIGNAR**               | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |


#### 8. Resumen por aplicación

| Aplicación | Permisos canónicos | Asignados | No asignados |
| ---------- | -----------------: | --------: | -----------: |
| SHELL      |                  1 |         0 |            1 |
| ANIMA      |                 10 |         0 |           10 |
| AURA       |                  1 |         0 |            1 |
| FOGO       |                  6 |         0 |            6 |
| NEXO       |                 63 |        10 |           53 |
| NUMERA     |                  6 |         0 |            6 |
| ORIGO      |                  5 |         0 |            5 |
| VENTO PASS |                  1 |         0 |            1 |
| PULSO      |                  2 |         1 |            1 |
| VISO       |                 17 |         0 |           17 |
| **Total**  |            **112** |    **11** |      **101** |

#### 9. Flujo operativo autorizado

```text
TURNO DE SERVICIO DE SALÓN VÁLIDO
        ↓
ENTRAR A PULSO
        ↓
FUNCIONES ATÓMICAS DE MESAS, PEDIDOS Y SERVICIO
PENDIENTES DE CATÁLOGO

TURNO + CHECK-IN
        ↓
ENTRAR A NEXO
        ↓
CONSULTAR REFERENCIAS DE SOLICITUD
        ↓
CONSULTAR / CREAR / EDITAR SOLICITUD PROPIA
```

La matriz no autoriza al personal de salón a preparar, despachar o recibir una remisión ni a operar inventario físico. Tampoco autoriza todavía la gestión de mesas, pedidos, comandas, entregas ordinarias o cobros: esas capacidades no existen en el catálogo canónico vigente y no pueden deducirse de `pulso.access`.

#### 10. Capacidades expresamente no concedidas

- cualquier permiso exclusivo del carril base;
- gestión de personal, documentos, turnos, permisos o seguridad;
- lotes, órdenes, recetas maestras o recetario de FOGO;
- entradas, retiros, traslados, conteos, ajustes, ubicaciones, LPN o validaciones de inventario;
- preparación, despacho o recepción de remisiones;
- cancelación de remisiones por defecto;
- operaciones logísticas, de conductor, cumplimiento o bodega;
- preparación de alimentos, barra, cocina, mostrador o producción central;
- compras, recepciones y proveedores de ORIGO;
- facturas internas, costos, márgenes, gastos, contabilidad o NUMERA;
- configuración de sedes, políticas, rutas, impresión o catálogos maestros;
- ventas, pagos, caja, anulaciones, devoluciones o descuentos por inferencia desde PULSO;
- `pulso.delivery.deliveries.override` sin autoridad base separada;
- acceso a clientes, puntos o canjes de fidelización por inferencia;
- acceso a APP-REVIEW o a sedes no habilitadas;
- cualquier permiso futuro no evaluado expresamente.

#### 11. Brechas del catálogo identificadas

El catálogo vigente solo contiene `pulso.access` y una excepción de entrega. Por tanto, todavía no representa las operaciones ordinarias del servicio de salón, entre ellas:

- consultar mesas, zonas o puestos asignados al área activa;
- abrir, consultar o actualizar el servicio de una mesa;
- tomar y modificar pedidos dentro de estados permitidos;
- consultar comandas y su avance sin modificar procesos de cocina o barra;
- registrar observaciones, modificadores, alergias y restricciones del cliente;
- confirmar entrega ordinaria de productos a una mesa o cliente;
- registrar productos faltantes, devoluciones o aclaraciones del servicio;
- solicitar separación, unión o traslado de mesas mediante reglas aprobadas;
- identificar responsable del pedido, de la entrega y de cada transición;
- solicitar cuenta, dividir consumo o remitir el cobro al rol autorizado;
- consultar tiempos, alertas y prioridades del servicio;
- gestionar pedidos para llevar cuando la sede y el proceso lo permitan;
- imprimir o reimprimir comandas o cuentas mediante permisos específicos;
- consultar historial operativo limitado a la sede, el área y el turno;
- operar desde dispositivo compartido conservando atribución al actor real.

Estas brechas no amplían la matriz. Hasta que existan permisos atómicos canónicos, `pulso.access` no podrá interpretarse como autorización implícita para gestionar mesas, pedidos, comandas, entregas, cobros o cierres. Las capacidades deberán asignarse a PULSO como aplicación propietaria del proceso comercial y separarse de caja, cocina, barra y mostrador.

#### 12. Dispositivo compartido de servicio de salón

La auditoría no identificó una plantilla específica y canónica para servicio de salón. Una futura plantilla o dispositivo móvil de salón podrá habilitar PULSO, NEXO y SHELL como superficies disponibles, pero no concederá por sí mismo la matriz del rol.

Antes de ejecutar una acción deberá existir:

```text
DISPOSITIVO TÉCNICO ACTIVO
+ ACTOR IDENTIFICADO
+ PIN O AUTENTICACIÓN EXIGIDA
+ TURNO servicio_salon VÁLIDO
+ ÁREA DEL DISPOSITIVO COINCIDENTE
+ CHECK-IN CUANDO CORRESPONDA
+ PERMISO DE ESTA MATRIZ
= ACCIÓN ATRIBUIBLE AL TRABAJADOR
```

La política de actor deberá exigir coincidencia de sede y área y validar expresamente el rol `servicio_salon`. No se aceptará `same_site_active_worker` como autorización suficiente, una sesión anónima, una acción atribuida al usuario técnico ni una navegación basada únicamente en `navigation_role`. La definición de la plantilla concreta corresponde a AUTH-RBAC-023 y no forma parte de esta tarea.

#### 13. Relación con el estado legacy

La auditoría encontró que `servicio_salon` tiene uso operativo real —66 turnos históricos y asignación en dos sedes— pero **cero permisos operativos propios**. Su funcionamiento actual puede depender del rol base legacy `mesero`, de rutas que solo verifican turno o de lógica sin permiso atómico.

Esta propuesta elimina esa dependencia conceptual y define una matriz operativa explícita:

```text
0 ASIGNACIONES OPERATIVAS PROPIAS
        ↓
VALIDACIÓN CONTRA 112 PERMISOS CANÓNICOS
        ↓
11 CONCESIONES OPERATIVAS EXPLÍCITAS
├── 6 referencias de catálogo y políticas
├── 3 capacidades sobre solicitudes/remisiones
├── 1 referencia de rutas de abastecimiento
└── 1 entrada a PULSO
```

Las 11 concesiones no intentan reconstruir silenciosamente los permisos legacy de `mesero`. Solo habilitan el abastecimiento propio del salón y la entrada controlada a PULSO. Las capacidades ordinarias de atención permanecen pendientes de permisos atómicos.

#### 14. Validaciones de integridad

- ✅ Los 112 permisos canónicos fueron evaluados exactamente una vez.
- ✅ Las cantidades por aplicación suman 112.
- ✅ Solo se asignaron permisos que admiten carril operativo.
- ✅ No se asignó ningún permiso `BASE_ONLY`.
- ✅ No se asignó ningún permiso `BASE_AND_OPERATIONAL`.
- ✅ Cada permiso concedido tiene contexto y recurso explícitos.
- ✅ El rol exige turno, sede y área de tipo `service` válidos.
- ✅ Las mutaciones concedidas exigen check-in cuando corresponde.
- ✅ `pulso.access` no se utiliza como wildcard de PULSO.
- ✅ No se concedieron operaciones físicas de inventario, logística, caja, cocina, barra o producción.
- ✅ No se concedieron capacidades financieras, laborales o de seguridad.
- ✅ No se heredaron permisos del rol base legacy `mesero`.
- ✅ No existen wildcards ni permisos implícitos.
- ✅ APP-REVIEW y sedes no habilitadas permanecen excluidas.
- ✅ Los permisos nuevos se deniegan por defecto.

#### 15. Impacto sobre tareas posteriores

| Tarea                     | Impacto                                                                                                                                                      |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| AUTH-RBAC-012             | Deberá definir `mostrador_satelite` sin heredar automáticamente esta matriz ni confundir entrega de mostrador con servicio de salón.                         |
| AUTH-RBAC-013             | Deberá definir `operador_integral_satelite` mediante capacidades explícitas, no mediante la unión automática de todos los roles satélite.                    |
| AUTH-RBAC-021             | Podrá añadir excepciones operativas individuales sin sustituir turno, área, rol ni permiso exacto.                                                           |
| AUTH-RBAC-023             | Deberá definir dispositivos de salón compatibles y limitar actor, sede, área, aplicaciones y duración.                                                       |
| AUTH-RBAC-025             | Deberá proyectar estas 11 concesiones en el dataset canónico de matriz operativa.                                                                            |
| AUTH-RBAC-027             | Deberá confirmar que ninguna concesión produzca acceso operativo global accidental.                                                                          |
| BLOQUE E                  | Deberá distinguir entrada, permiso, recurso y razones de bloqueo en la decisión final.                                                                       |
| PULSO y roadmap funcional | Deberán crear y clasificar permisos atómicos para mesas, pedidos, comandas, entrega ordinaria, cuentas, cobro derivado, historial y atribución del servicio. |
| BLOQUE R                  | Implementará la transición física mediante migraciones versionadas en `vento-shell`, pruebas, reconciliación y rollback.                                     |

#### 16. Criterios de aprobación

1. `servicio_salon` queda definido como rol operativo temporal de atención y servicio de salón.
2. Las 11 concesiones son explícitas y compatibles con el carril operativo.
3. El rol requiere turno, sede y área de tipo `service` válidos.
4. Las acciones vivas o mutadoras concedidas exigen check-in cuando corresponde.
5. El rol puede consultar referencias y solicitar abastecimiento sin acceder a inventario general.
6. La actualización se limita a solicitudes propias y editables.
7. No puede preparar, despachar, recibir o cancelar remisiones por defecto.
8. `pulso.access` no autoriza mesas, pedidos, comandas, entregas, cobros ni cierres por sí solo.
9. El rol no recibe permisos de caja, cocina, barra, mostrador o producción por similitud funcional.
10. No se recuperan permisos del rol base legacy `mesero`.
11. `delivery.override` permanece fuera de la matriz ordinaria.
12. Las 101 capacidades restantes permanecen denegadas por defecto.
13. No se implementa código, Supabase ni migraciones en esta tarea.
14. `AUTH-RBAC-012` permanece sin iniciar hasta solicitud expresa.

#### 17. Estado final de la propuesta

| Tarea         | Estado      |
| ------------- | ----------- |
| AUTH-RBAC-010 | APROBADA    |
| AUTH-RBAC-011 | APROBADA    |
| AUTH-RBAC-012 | NO INICIADA |

No se implementan código, migraciones, cambios en Supabase, RLS, RPC, datasets, repositorios, guards, dispositivos ni pantallas. La matriz solo será canónica cuando el usuario la apruebe expresamente.


### ✅ AUTH-RBAC-012 — Crear matriz de mostrador_satelite

#### 1. Identificación de la tarea

| Campo                     | Valor                                                              |
| ------------------------- | ------------------------------------------------------------------ |
| Bloque                    | BLOQUE D — Matrices canónicas de roles, excepciones y dispositivos |
| Tarea                     | AUTH-RBAC-012 — Crear matriz de mostrador_satelite                 |
| Estado                    | **APROBADA**                                                       |
| Naturaleza                | Definición documental de matriz operativa de mostrador satélite    |
| Implementación física     | No incluida                                                        |
| Catálogo evaluado         | 112 permisos canónicos vigentes                                    |
| Tarea anterior vigente    | AUTH-RBAC-011 — APROBADA                                           |
| Tarea posterior reservada | AUTH-RBAC-013 — Crear matriz de operador_integral_satelite         |

Esta tarea no modifica Supabase, migraciones, tablas, RLS, RPC, aplicaciones, repositorios ni datasets físicos. La aplicación posterior deberá realizarse mediante AUTH-RBAC-025 y las migraciones versionadas del BLOQUE R en `vento-shell`.

#### 2. Objetivo

Definir, permiso por permiso, las capacidades que puede ejercer el rol operativo `mostrador_satelite` durante un turno válido en el área de Mostrador de una sede satélite, sin atribuirle un rol base legacy inexistente y sin convertir el acceso a PULSO en autorización implícita para consultar colas, alistar pedidos, empacar productos, cambiar estados, confirmar entregas o ejecutar operaciones comerciales que todavía no están representadas por permisos atómicos.

#### 3. Decisión principal

`mostrador_satelite` representa la función temporal de **atención, entrega y operación de mostrador** en un punto de venta satélite. Su autoridad existe únicamente dentro del contexto operativo vigente y sobre recursos compatibles con la sede, el área exacta, la relación del actor, el canal del pedido y la etapa de entrega.

```text
ACTOR IDENTIFICADO
+ TURNO PUBLICADO Y VIGENTE
+ ROL mostrador_satelite
+ SEDE AUTORIZADA
+ ÁREA ACTIVA DE MOSTRADOR
+ TIPO DE ÁREA CANÓNICO RESUELTO
+ CHECK-IN CUANDO EL PERMISO LO EXIJA
+ PERMISO OPERATIVO EXPLÍCITO
+ RECURSO COMPATIBLE
= AUTORIZACIÓN OPERATIVA DE MOSTRADOR
```

No se admite:

```text
nombre del área = Mostrador → autorización
rol base aproximado → permisos de mostrador permanentes
pulso.access → autorización para alistar o entregar cualquier pedido
dispositivo de mostrador → rol automático
PIN del dispositivo → sustituto del permiso
sede seleccionada → autorización
mostrador_satelite → acceso a inventario general
mostrador_satelite → acceso automático a caja, salón, barra, cocina o producción
mostrador_satelite → delivery.override automático
```

#### 4. Resultado cuantitativo de la matriz

| Resultado                                    | Cantidad | Efecto                                                                                                                                  |
| -------------------------------------------- | -------: | --------------------------------------------------------------------------------------------------------------------------------------- |
| Capacidades operativas asignadas             |       11 | Se conceden por el carril operativo dentro del contexto de mostrador y de los recursos expresamente definidos.                          |
| Capacidades `BASE_AND_OPERATIONAL` asignadas |        0 | El rol operativo no recibe autoridad base adicional.                                                                                    |
| Capacidades no asignadas                     |      101 | Permanecen denegadas por defecto por pertenecer al carril base, a otros procesos operativos o a acciones sensibles ajenas al mostrador. |
| Total evaluado                               |      112 | Sin omisiones ni duplicados.                                                                                                            |

La matriz contiene **11 concesiones operativas a nivel de clave** y **101 ausencias de concesión**. La ausencia de concesión produce denegación por defecto; no se crean filas `deny` redundantes.

#### 5. Perfiles de alcance utilizados

| Perfil                          | Significado                                                                                                                                        |
| ------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------- |
| `CTX-COUNTER-APP`               | Entrada operativa a una aplicación con turno y rol válidos. El permiso puede mostrar requisitos faltantes, pero no concede capacidades internas.   |
| `CTX-COUNTER-REF`               | Consulta mínima de referencias necesarias para abastecimiento y operación del mostrador, limitada a la sede, el área y el flujo vigentes.          |
| `CTX-COUNTER-REMISSION`         | Consulta de remisiones por relación legítima con la sede destino o el actor solicitante.                                                           |
| `CTX-COUNTER-REMISSION-OWN`     | Modificación exclusiva de solicitudes propias y todavía editables.                                                                                 |
| `CTX-COUNTER-REMISSION-REQUEST` | Creación de solicitudes para la sede y el área activas con ruta, productos, presentaciones y políticas válidas.                                    |
| `CTX-COUNTER-PULSO`             | Entrada a la superficie de mostrador durante turno válido. No sustituye permisos de cola, alistamiento, empaque, estados, entrega, cobro o cierre. |

#### 6. Reglas obligatorias de la matriz

1. Cada concesión utiliza una clave canónica exacta; no existen wildcards, herencias implícitas ni autorización por el nombre del rol.
2. El rol operativo efectivo procede exclusivamente del turno publicado y vigente. Los perfiles y dispositivos solo sugieren o restringen; nunca asignan el rol.
3. `mostrador_satelite` requiere el área concreta de Mostrador configurada para la sede y compatible con el tipo de área canónico registrado. El nombre visible del área no sustituye esa clasificación.
4. Las concesiones con prerrequisito `T` pueden consultarse antes del check-in, pero continúan exigiendo turno y rol válidos.
5. Las concesiones con prerrequisito `T+C` requieren turno y check-in activos, sede y área coincidentes y recurso resoluble.
6. La sede activa se deriva del contexto válido; la sede seleccionada, primaria o enviada por el cliente no concede autoridad.
7. El permiso `pulso.access` solo permite entrar a PULSO y cargar la superficie compatible. No autoriza consultar colas, reclamar pedidos, alistar, empacar, cambiar estados, confirmar entregas, cobrar, operar caja, anular, devolver, acumular puntos ni cerrar servicios.
8. La consulta de catálogo desde NEXO se limita a los atributos necesarios para identificar productos, presentaciones, empaques e insumos solicitables para el mostrador.
9. La consulta de remisiones se limita a la relación del actor o de la sede destino; no concede visibilidad de toda la red.
10. La actualización de remisiones se limita a solicitudes propias, estados editables y campos permitidos, con reautenticación y auditoría.
11. La solicitud de remisiones debe ser idempotente y validar políticas, ruta, destino, cantidades y presentaciones.
12. El catálogo actual no contiene permisos atómicos de cola de entrega, alistamiento, empaque, cambio de estado o entrega ordinaria. Esas capacidades no se deducen de `pulso.access`.
13. `pulso.delivery.deliveries.override` no se asigna al rol. Solo podrá obtenerse mediante autoridad base explícita y contexto operativo simultáneo.
14. APP-REVIEW, entornos demo, recursos aislados y sedes no habilitadas permanecen excluidos.
15. Las denegaciones individuales, estructurales, de recurso, dispositivo o aislamiento prevalecen sobre esta matriz.
16. Todo permiso nuevo se deniega hasta que una versión canónica posterior lo evalúe expresamente para `mostrador_satelite`.

#### 7. Matriz canónica completa
##### 7.1 SHELL — 1 permisos

| Permiso        | Capacidad humana  | Modalidad   | Decisión para mostrador_satelite | Alcance aprobado                                                       | Condición                                                                                              |
| -------------- | ----------------- | ----------- | -------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `shell.access` | Entrar a Vento OS | `BASE_ONLY` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.2 ANIMA — 10 permisos

| Permiso                                     | Capacidad humana                     | Modalidad   | Decisión para mostrador_satelite | Alcance aprobado                                                       | Condición                                                                                              |
| ------------------------------------------- | ------------------------------------ | ----------- | -------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `anima.access`                              | Entrar a ANIMA                       | `BASE_ONLY` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.employee_documents.view`   | Consultar documentos de trabajadores | `BASE_ONLY` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.employee_documents.upload` | Cargar documentos de trabajadores    | `BASE_ONLY` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.employee_documents.delete` | Eliminar documentos de trabajadores  | `BASE_ONLY` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.employee_photos.upload`    | Cargar fotografías de trabajadores   | `BASE_ONLY` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.team_members.view`         | Consultar integrantes del equipo     | `BASE_ONLY` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.staff_invitations.create`  | Invitar trabajadores                 | `BASE_ONLY` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.attendance.shifts.create`            | Crear turnos                         | `BASE_ONLY` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.attendance.shifts.update`            | Actualizar turnos                    | `BASE_ONLY` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.attendance.shifts.cancel`            | Cancelar turnos                      | `BASE_ONLY` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.3 AURA — 1 permisos

| Permiso       | Capacidad humana | Modalidad   | Decisión para mostrador_satelite | Alcance aprobado                                                       | Condición                                                                                              |
| ------------- | ---------------- | ----------- | -------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `aura.access` | Entrar a AURA    | `BASE_ONLY` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.4 FOGO — 6 permisos

| Permiso                            | Capacidad humana                | Modalidad             | Decisión para mostrador_satelite | Alcance aprobado                                                       | Condición                                                                                                                                                                                                   |
| ---------------------------------- | ------------------------------- | --------------------- | -------------------------------- | ---------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `fogo.access`                      | Entrar a FOGO                   | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece al proceso productivo de FOGO y no se asigna automáticamente a la operación de mostrador.                                                                                            |
| `fogo.production.batches.view`     | Consultar lotes de producción   | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece al proceso productivo de FOGO y no se asigna automáticamente a la operación de mostrador.                                                                                            |
| `fogo.production.batches.create`   | Crear lotes de producción       | `OPERATIONAL_ONLY`    | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece al proceso productivo de FOGO y no se asigna automáticamente a la operación de mostrador.                                                                                            |
| `fogo.production.orders.view`      | Consultar órdenes de producción | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece al proceso productivo de FOGO y no se asigna automáticamente a la operación de mostrador.                                                                                            |
| `fogo.production.recipe_book.view` | Consultar recetario operativo   | `OPERATIONAL_ONLY`    | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | El recetario de FOGO no se concede por inferencia. La consulta de fórmulas o fichas de alimentos deberá contar con un permiso atómico y contrato de aplicabilidad propios antes de incorporarse a este rol. |
| `fogo.production.recipes.view`     | Consultar recetas               | `BASE_ONLY`           | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                      |

##### 7.5 NEXO — 63 permisos

| Permiso                                      | Capacidad humana                         | Modalidad              | Decisión para mostrador_satelite | Alcance aprobado                                                                                                                                                                                                                                                   | Condición                                                                                                                                                                                   |
| -------------------------------------------- | ---------------------------------------- | ---------------------- | -------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `nexo.access`                                | Entrar a NEXO                            | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**            | CTX-COUNTER-APP — turno publicado y vigente, rol efectivo `mostrador_satelite`, sede activa autorizada y área operativa válida de Mostrador, resuelta desde el área exacta del turno y su tipo canónico. No exige check-in para mostrar la entrada y los bloqueos. | Carril operativo. Permite entrar a NEXO y ver el estado del contexto. No concede por sí solo catálogo, remisiones, inventario ni otra acción.                                               |
| `nexo.catalog.products.view`                 | Consultar productos                      | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**            | CTX-COUNTER-REF — consulta operativa de productos vigentes aplicables a la sede activa. Excluye costos, márgenes, existencias, recetas, proveedores y campos técnicos no necesarios.                                                                               | Turno vigente y rol `mostrador_satelite` válido. La proyección se utiliza para identificar productos dentro del flujo de solicitud; no permite crear ni modificar el maestro.               |
| `nexo.catalog.products.create`               | Crear productos                          | `BASE_ONLY`            | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.catalog.presentations.view`            | Consultar presentaciones                 | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**            | CTX-COUNTER-REF — consulta de presentaciones vigentes y solicitables para la sede y ruta aplicables.                                                                                                                                                               | Turno vigente y rol válido. Solo lectura para seleccionar la presentación autorizada en una solicitud.                                                                                      |
| `nexo.catalog.request_policies.view`         | Consultar políticas de solicitud         | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**            | CTX-COUNTER-REF — consulta de políticas de solicitud aplicables al destino, producto, presentación y ruta de abastecimiento del contexto.                                                                                                                          | Turno vigente. No permite modificar políticas ni ignorar mínimos, frecuencias, ventanas o restricciones.                                                                                    |
| `nexo.catalog.categories.view`               | Consultar categorías                     | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**            | CTX-COUNTER-REF — consulta de categorías necesarias para buscar y organizar productos solicitables.                                                                                                                                                                | Turno vigente. Solo lectura; no permite administrar categorías.                                                                                                                             |
| `nexo.catalog.units.view`                    | Consultar unidades                       | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**            | CTX-COUNTER-REF — consulta de unidades, empaques y equivalencias publicadas necesarias para interpretar presentaciones solicitables.                                                                                                                               | Turno vigente. Solo lectura; no permite administrar unidades ni conversiones.                                                                                                               |
| `nexo.assets.items.view`                     | Consultar activos                        | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el mostrador o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.  |
| `nexo.assets.items.create`                   | Crear activos                            | `BASE_ONLY`            | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.assets.groups.view`                    | Consultar grupos de activos              | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el mostrador o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.  |
| `nexo.assets.counts.view`                    | Consultar conteos de activos             | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el mostrador o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.  |
| `nexo.inventory.adjustments.view`            | Consultar ajustes de inventario          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el mostrador o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.  |
| `nexo.inventory.adjustments.register`        | Registrar ajustes de inventario          | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | La capacidad exige autoridad base y contexto operativo simultáneos. Esta matriz no concede el componente base ni la capacidad completa.                                                     |
| `nexo.inventory.entries.view`                | Consultar entradas de inventario         | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el mostrador o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.  |
| `nexo.inventory.entries.register`            | Registrar entradas de inventario         | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el mostrador o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.  |
| `nexo.inventory.entries.override`            | Registrar entradas excepcionales         | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | La capacidad exige autoridad base y contexto operativo simultáneos. Esta matriz no concede el componente base ni la capacidad completa.                                                     |
| `nexo.inventory.locations.view`              | Consultar ubicaciones de inventario      | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el mostrador o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.  |
| `nexo.inventory.location_assignments.assign` | Asignar ubicaciones de inventario        | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el mostrador o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.  |
| `nexo.inventory.location_catalog.update`     | Actualizar el catálogo de una ubicación  | `BASE_ONLY`            | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.inventory.lpns.view`                   | Consultar LPN                            | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el mostrador o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.  |
| `nexo.inventory.movements.view`              | Consultar movimientos de inventario      | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el mostrador o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.  |
| `nexo.inventory.stock.view`                  | Consultar stock                          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | El stock exige área activa coincidente. El rol de cocina no recibe visibilidad general de existencias de cocina, bodega, otras cocinas ni otras áreas.                                      |
| `nexo.inventory.production_batches.view`     | Consultar lotes vinculados al inventario | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el mostrador o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.  |
| `nexo.inventory.transfers.view`              | Consultar traslados de inventario        | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el mostrador o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.  |
| `nexo.inventory.transfers.create`            | Crear traslados de inventario            | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el mostrador o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.  |
| `nexo.inventory.withdrawals.view`            | Consultar retiros de inventario          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el mostrador o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.  |
| `nexo.inventory.withdrawals.register`        | Registrar retiros de inventario          | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el mostrador o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.  |
| `nexo.inventory.zones.view`                  | Consultar zonas de almacenamiento        | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el mostrador o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.  |
| `nexo.inventory.storage_positions.view`      | Consultar posiciones de almacenamiento   | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el mostrador o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.  |
| `nexo.inventory.warehouse_operations.view`   | Consultar operaciones de bodega          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el mostrador o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.  |
| `nexo.inventory.stock_validations.perform`   | Ejecutar validaciones de inventario      | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el mostrador o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.  |
| `nexo.inventory.stock_counts.view`           | Consultar conteos de inventario          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el mostrador o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.  |
| `nexo.inventory.stock_counts.perform`        | Ejecutar conteos de inventario           | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el mostrador o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.  |
| `nexo.inventory.initial_counts.view`         | Consultar conteos iniciales              | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el mostrador o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.  |
| `nexo.inventory.remissions.view`             | Consultar remisiones                     | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**            | CTX-COUNTER-REMISSION — remisiones donde la sede activa sea destino, el actor sea solicitante o exista otra relación operativa explícita. No concede visibilidad general sobre otras sedes.                                                                        | Turno y check-in activos. Recurso resoluble y relacionado con el actor o la sede destino. Mostrar únicamente campos autorizados para el lado solicitante.                                   |
| `nexo.inventory.remissions.update`           | Actualizar remisiones                    | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**            | CTX-COUNTER-REMISSION-OWN — únicamente solicitudes creadas por el actor, en estados editables y sobre campos permitidos del lado solicitante.                                                                                                                      | Turno y check-in activos. Control optimista de versión, reautenticación fuerte y auditoría antes/después. No permite preparar, despachar, recibir, cancelar ni modificar el lado de origen. |
| `nexo.inventory.remissions.request`          | Solicitar remisiones                     | `OPERATIONAL_ONLY`     | **ASIGNAR OPERATIVO**            | CTX-COUNTER-REMISSION-REQUEST — crear una solicitud para la sede activa y desde el área de Mostrador activa, utilizando origen, ruta, productos, presentaciones y políticas válidas.                                                                               | Turno y check-in activos. Creación idempotente; validar destino, ruta, políticas, cantidades y presentaciones. El actor queda registrado como solicitante.                                  |
| `nexo.inventory.remissions.prepare`          | Preparar remisiones                      | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el mostrador o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.  |
| `nexo.inventory.remissions.dispatch`         | Despachar remisiones                     | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el mostrador o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.  |
| `nexo.inventory.remissions.receive`          | Recibir remisiones                       | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | Recibir remisiones cambia cantidades y custodia en destino. Corresponde al rol de recepción autorizado, no automáticamente al personal de mostrador.                                        |
| `nexo.inventory.remissions.cancel`           | Cancelar remisiones                      | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | La cancelación no se concede por defecto al personal de mostrador. Una necesidad de cancelar solicitudes propias deberá definirse como política explícita o excepción operativa auditada.   |
| `nexo.logistics.operations_board.view`       | Consultar tablero logístico              | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el mostrador o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.  |
| `nexo.logistics.operations.view`             | Consultar operaciones logísticas         | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el mostrador o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.  |
| `nexo.logistics.driver_operations.view`      | Consultar operaciones de conductores     | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el mostrador o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.  |
| `nexo.logistics.fulfillment.view`            | Consultar cumplimiento logístico         | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el mostrador o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.  |
| `nexo.logistics.fulfillment_routes.view`     | Consultar rutas de cumplimiento          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el mostrador o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.  |
| `nexo.logistics.supply_routes.view`          | Consultar rutas de abastecimiento        | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**            | CTX-COUNTER-REF — consulta únicamente de rutas de abastecimiento vigentes relacionadas con la sede activa y utilizables para solicitudes.                                                                                                                          | Turno vigente. Solo lectura; no permite modificar rutas ni consultar configuración logística ajena al flujo de solicitud.                                                                   |
| `nexo.finance.internal_invoices.view`        | Consultar facturas internas              | `BASE_ONLY`            | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.finance.internal_invoices.generate`    | Generar facturas internas                | `BASE_ONLY`            | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.finance.internal_invoices.issue`       | Emitir facturas internas                 | `BASE_ONLY`            | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.finance.internal_invoices.cancel`      | Cancelar facturas internas               | `BASE_ONLY`            | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.finance.internal_invoice_amounts.view` | Consultar valores de facturas internas   | `BASE_ONLY`            | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.finance.internal_prices.view`          | Consultar precios internos               | `BASE_ONLY`            | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.finance.internal_variances.view`       | Consultar variaciones internas           | `BASE_ONLY`            | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.finance.internal_variances.approve`    | Aprobar variaciones internas             | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | La capacidad exige autoridad base y contexto operativo simultáneos. Esta matriz no concede el componente base ni la capacidad completa.                                                     |
| `nexo.finance.internal_variances.resolve`    | Resolver variaciones internas            | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | La capacidad exige autoridad base y contexto operativo simultáneos. Esta matriz no concede el componente base ni la capacidad completa.                                                     |
| `nexo.finance.cost_centers.view`             | Consultar centros de costo en NEXO       | `BASE_ONLY`            | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.analytics.internal_reports.view`       | Consultar reportes internos              | `BASE_ONLY`            | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.analytics.margin_reports.view`         | Consultar reportes de margen             | `BASE_ONLY`            | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.printing.templates.update`             | Editar plantillas de impresión           | `BASE_ONLY`            | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.printing.jobs.view`                    | Consultar trabajos de impresión          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde el mostrador o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.  |
| `nexo.settings.sites.view`                   | Consultar configuración de sedes         | `BASE_ONLY`            | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.settings.remission_policies.view`      | Consultar políticas de remisiones        | `BASE_ONLY`            | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                                             | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |

##### 7.6 NUMERA — 6 permisos

| Permiso                                   | Capacidad humana               | Modalidad   | Decisión para mostrador_satelite | Alcance aprobado                                                       | Condición                                                                                              |
| ----------------------------------------- | ------------------------------ | ----------- | -------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `numera.access`                           | Entrar a NUMERA                | `BASE_ONLY` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.finance.cost_centers.view`        | Consultar centros de costo     | `BASE_ONLY` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.finance.expenses.view`            | Consultar gastos               | `BASE_ONLY` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.analytics.break_even.view`        | Consultar punto de equilibrio  | `BASE_ONLY` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.analytics.profitability.view`     | Consultar rentabilidad         | `BASE_ONLY` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.analytics.financial_reports.view` | Consultar reportes financieros | `BASE_ONLY` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.7 ORIGO — 5 permisos

| Permiso                                  | Capacidad humana                  | Modalidad             | Decisión para mostrador_satelite | Alcance aprobado                                                       | Condición                                                                                               |
| ---------------------------------------- | --------------------------------- | --------------------- | -------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- |
| `origo.access`                           | Entrar a ORIGO                    | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece a compras, recepción o proveedores y no corresponde a la operación de mostrador. |
| `origo.procurement.purchase_orders.view` | Consultar órdenes de compra       | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece a compras, recepción o proveedores y no corresponde a la operación de mostrador. |
| `origo.procurement.receipts.view`        | Consultar recepciones de compra   | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece a compras, recepción o proveedores y no corresponde a la operación de mostrador. |
| `origo.procurement.suppliers.view`       | Consultar proveedores             | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece a compras, recepción o proveedores y no corresponde a la operación de mostrador. |
| `origo.catalog.product_reviews.view`     | Consultar revisiones de productos | `BASE_ONLY`           | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.  |

##### 7.8 VENTO PASS — 1 permisos

| Permiso       | Capacidad humana    | Modalidad   | Decisión para mostrador_satelite | Alcance aprobado                                                       | Condición                                                                                              |
| ------------- | ------------------- | ----------- | -------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `pass.access` | Entrar a Vento Pass | `BASE_ONLY` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.9 PULSO — 2 permisos

| Permiso                              | Capacidad humana                        | Modalidad              | Decisión para mostrador_satelite | Alcance aprobado                                                                                                                                                                           | Condición                                                                                                                                                                                                                                                                               |
| ------------------------------------ | --------------------------------------- | ---------------------- | -------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `pulso.access`                       | Entrar a PULSO                          | `OPERATIONAL_ONLY`     | **ASIGNAR OPERATIVO**            | CTX-COUNTER-PULSO — turno publicado y vigente, rol `mostrador_satelite`, sede autorizada y área operativa válida de Mostrador, resuelta desde el área exacta del turno y su tipo canónico. | Carril operativo. Permite entrar a PULSO y mostrar el contexto de mostrador. No autoriza por sí solo consultar colas de entrega, alistar o empacar pedidos, cambiar estados, confirmar entregas ordinarias, cobrar, operar caja, anular, devolver, acumular puntos ni cerrar servicios. |
| `pulso.delivery.deliveries.override` | Confirmar entregas de forma excepcional | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                     | Capacidad `BASE_AND_OPERATIONAL` de excepción. Requiere autoridad base explícita, turno, check-in, reautenticación fuerte, motivo y auditoría reforzada.                                                                                                                                |

##### 7.10 VISO — 17 permisos

| Permiso                                       | Capacidad humana                          | Modalidad   | Decisión para mostrador_satelite | Alcance aprobado                                                       | Condición                                                                                              |
| --------------------------------------------- | ----------------------------------------- | ----------- | -------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `viso.access`                                 | Entrar a VISO                             | `BASE_ONLY` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.platform.app_updates.view`              | Consultar actualizaciones de aplicaciones | `BASE_ONLY` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.organization.businesses.view`           | Consultar empresas y unidades de negocio  | `BASE_ONLY` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.workforce.employees.view`               | Consultar trabajadores                    | `BASE_ONLY` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.workforce.staff_calendar.view`          | Consultar calendario del personal         | `BASE_ONLY` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.workforce.schedules.view`               | Consultar programación de turnos          | `BASE_ONLY` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.workforce.vacancies.view`               | Consultar vacantes                        | `BASE_ONLY` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.authorization.context_simulations.view` | Consultar simulaciones de autorización    | `BASE_ONLY` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.authorization.audit_logs.view`          | Consultar auditoría de autorización       | `BASE_ONLY` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.catalog.commercial_categories.view`     | Consultar categorías comerciales          | `BASE_ONLY` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.content.content_blocks.view`            | Consultar bloques de contenido            | `BASE_ONLY` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.content.menu.view`                      | Consultar menú                            | `BASE_ONLY` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.content.website_content.view`           | Consultar contenido del sitio web         | `BASE_ONLY` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.finance.accounting.view`                | Consultar información contable            | `BASE_ONLY` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.delivery.rates.view`                    | Consultar tarifas de entrega              | `BASE_ONLY` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.loyalty.products.view`                  | Consultar productos de fidelización       | `BASE_ONLY` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.loyalty.customers.view`                 | Consultar clientes de fidelización        | `BASE_ONLY` | **NO ASIGNAR**                   | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |


#### 8. Resumen por aplicación

| Aplicación | Permisos canónicos | Asignados | No asignados |
| ---------- | -----------------: | --------: | -----------: |
| SHELL      |                  1 |         0 |            1 |
| ANIMA      |                 10 |         0 |           10 |
| AURA       |                  1 |         0 |            1 |
| FOGO       |                  6 |         0 |            6 |
| NEXO       |                 63 |        10 |           53 |
| NUMERA     |                  6 |         0 |            6 |
| ORIGO      |                  5 |         0 |            5 |
| VENTO PASS |                  1 |         0 |            1 |
| PULSO      |                  2 |         1 |            1 |
| VISO       |                 17 |         0 |           17 |
| **Total**  |            **112** |    **11** |      **101** |

#### 9. Flujo operativo autorizado

```text
TURNO DE MOSTRADOR VÁLIDO
        ↓
ENTRAR A PULSO
        ↓
FUNCIONES ATÓMICAS DE COLA, ALISTAMIENTO,
EMPAQUE, ESTADOS Y ENTREGA
PENDIENTES DE CATÁLOGO

TURNO + CHECK-IN
        ↓
ENTRAR A NEXO
        ↓
CONSULTAR REFERENCIAS DE SOLICITUD
        ↓
CONSULTAR / CREAR / EDITAR SOLICITUD PROPIA
```

La matriz no autoriza al personal de mostrador a preparar, despachar o recibir una remisión ni a operar inventario físico. Tampoco autoriza todavía a consultar colas de entrega, reclamar pedidos, alistar o empacar productos, cambiar estados o confirmar entregas ordinarias: esas capacidades no existen en el catálogo canónico vigente y no pueden deducirse de `pulso.access`.

#### 10. Capacidades expresamente no concedidas

- cualquier permiso exclusivo del carril base;
- gestión de personal, documentos, turnos, permisos o seguridad;
- lotes, órdenes, recetas maestras o recetario de FOGO;
- entradas, retiros, traslados, conteos, ajustes, ubicaciones, LPN o validaciones de inventario;
- preparación, despacho o recepción de remisiones;
- cancelación de remisiones por defecto;
- operaciones logísticas, de conductor, cumplimiento o bodega;
- preparación de alimentos o bebidas;
- operación de caja, servicio de salón, barra, cocina o producción central;
- compras, recepciones y proveedores de ORIGO;
- facturas internas, costos, márgenes, gastos, contabilidad o NUMERA;
- configuración de sedes, políticas, rutas, impresión o catálogos maestros;
- ventas, pagos, caja, anulaciones, devoluciones o descuentos por inferencia desde PULSO;
- colas, alistamiento, empaque, estados o entrega ordinaria por inferencia desde `pulso.access`;
- `pulso.delivery.deliveries.override` sin autoridad base separada;
- acceso a clientes, puntos o canjes de fidelización por inferencia;
- acceso a APP-REVIEW o a sedes no habilitadas;
- cualquier permiso futuro no evaluado expresamente.

#### 11. Brechas del catálogo identificadas

El catálogo vigente solo contiene `pulso.access` y una excepción de entrega. Por tanto, todavía no representa las operaciones ordinarias del mostrador, entre ellas:

- consultar la cola de pedidos asignados al mostrador;
- distinguir pedidos para mesa, recogida, domicilio u otro canal autorizado;
- consultar productos terminados provenientes de cocina o barra;
- reclamar o asumir el alistamiento de un pedido;
- validar integridad, cantidades, presentación y observaciones antes del empaque;
- alistar empaques, acompañamientos, utensilios y elementos complementarios;
- registrar faltantes, daños, errores o devoluciones hacia el área de origen;
- marcar un pedido como recibido en mostrador, en alistamiento o listo para entrega;
- identificar al cliente, repartidor o actor autorizado para recibir;
- confirmar la entrega ordinaria y conservar actor, hora, canal y evidencia;
- administrar pedidos no reclamados, entregas parciales o incidencias;
- imprimir o reimprimir tickets, etiquetas o comprobantes mediante permisos específicos;
- consultar tiempos, alertas, prioridades e historial limitado al turno y la sede;
- operar desde un dispositivo compartido conservando atribución al actor real.

Estas brechas no amplían la matriz. Hasta que existan permisos atómicos canónicos, `pulso.access` no podrá interpretarse como autorización implícita para consultar, alistar, empacar, cambiar estados o entregar pedidos. PULSO deberá conservar la propiedad del proceso comercial y separar claramente mostrador, caja, servicio de salón, cocina, barra y entrega excepcional.

#### 12. Dispositivo compartido de mostrador

La auditoría no identificó una plantilla específica y canónica para mostrador. Una futura terminal de mostrador podrá habilitar PULSO, NEXO y SHELL como superficies disponibles, pero no concederá por sí misma la matriz del rol.

Antes de ejecutar una acción deberá existir:

```text
DISPOSITIVO TÉCNICO ACTIVO
+ ACTOR IDENTIFICADO
+ PIN O AUTENTICACIÓN EXIGIDA
+ TURNO mostrador_satelite VÁLIDO
+ SEDE Y ÁREA DEL DISPOSITIVO COINCIDENTES
+ CHECK-IN CUANDO CORRESPONDA
+ PERMISO DE ESTA MATRIZ
= ACCIÓN ATRIBUIBLE AL TRABAJADOR
```

La política de actor deberá exigir coincidencia de sede y área y validar expresamente el rol `mostrador_satelite`. No se aceptará `same_site_active_worker` como autorización suficiente, una sesión anónima, una acción atribuida al usuario técnico ni una navegación basada únicamente en `navigation_role`. La definición de la plantilla concreta corresponde a AUTH-RBAC-023 y no forma parte de esta tarea.

#### 13. Relación con el estado legacy

La auditoría encontró que `mostrador_satelite` está configurado en **Vento Café / Mostrador**, pero registra **cero turnos históricos, cero perfiles y cero permisos operativos propios**. No existe un rol base legacy equivalente directo denominado `mostrador`.

Esto exige conservar el rol para definición funcional, pero impide afirmar que ya esté operando realmente. Antes de su implementación deberán verificarse el uso actual del área, el personal que hoy cumple esa función, las pantallas existentes y si otro rol se está utilizando como sustituto informal.

La propuesta define una matriz explícita sin inventar herencia:

```text
0 TURNOS HISTÓRICOS
+ 1 ASIGNACIÓN SEDE / ÁREA
+ 0 PERMISOS OPERATIVOS
        ↓
VALIDACIÓN CONTRA 112 PERMISOS CANÓNICOS
        ↓
11 CONCESIONES OPERATIVAS EXPLÍCITAS
├── 6 referencias de catálogo y políticas
├── 3 capacidades sobre solicitudes/remisiones
├── 1 referencia de rutas de abastecimiento
└── 1 entrada a PULSO
```

Las 11 concesiones solo habilitan abastecimiento propio y entrada controlada a PULSO. No demuestran que el flujo de mostrador esté implementado ni sustituyen la auditoría funcional y de experiencia prevista para PULSO.

#### 14. Validaciones de integridad

- ✅ Los 112 permisos canónicos fueron evaluados exactamente una vez.
- ✅ Las cantidades por aplicación suman 112.
- ✅ Solo se asignaron permisos que admiten carril operativo.
- ✅ No se asignó ningún permiso `BASE_ONLY`.
- ✅ No se asignó ningún permiso `BASE_AND_OPERATIONAL`.
- ✅ Cada permiso concedido tiene contexto y recurso explícitos.
- ✅ El rol exige turno, sede y área exacta de Mostrador válidos.
- ✅ Las mutaciones concedidas exigen check-in cuando corresponde.
- ✅ `pulso.access` no se utiliza como wildcard de PULSO.
- ✅ No se concedieron operaciones físicas de inventario, logística, caja, salón, barra, cocina o producción.
- ✅ No se concedieron capacidades financieras, laborales o de seguridad.
- ✅ No se inventó un rol base legacy equivalente.
- ✅ No existen wildcards ni permisos implícitos.
- ✅ APP-REVIEW y sedes no habilitadas permanecen excluidas.
- ✅ Los permisos nuevos se deniegan por defecto.

#### 15. Impacto sobre tareas posteriores

| Tarea                     | Impacto                                                                                                                                                 |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| AUTH-RBAC-013             | Deberá definir `operador_integral_satelite` mediante capacidades explícitas, no mediante la unión automática de caja, barra, cocina, salón y mostrador. |
| AUTH-RBAC-021             | Podrá añadir excepciones operativas individuales sin sustituir turno, área, rol ni permiso exacto.                                                      |
| AUTH-RBAC-023             | Deberá definir terminales de mostrador compatibles y limitar actor, sede, área, aplicaciones y duración.                                                |
| AUTH-RBAC-025             | Deberá proyectar estas 11 concesiones en el dataset canónico de matriz operativa.                                                                       |
| AUTH-RBAC-027             | Deberá confirmar que ninguna concesión produzca acceso operativo global accidental.                                                                     |
| BLOQUE E                  | Deberá distinguir entrada, permiso, recurso, canal, etapa y razones de bloqueo en la decisión final.                                                    |
| PULSO y roadmap funcional | Deberán crear y clasificar permisos atómicos para cola, alistamiento, empaque, estados, entrega ordinaria, incidencias, tickets, evidencia e historial. |
| BLOQUE R                  | Implementará la transición física mediante migraciones versionadas en `vento-shell`, pruebas, reconciliación y rollback.                                |

#### 16. Criterios de aprobación

1. `mostrador_satelite` queda definido como rol operativo temporal de atención, entrega y operación de mostrador.
2. Las 11 concesiones son explícitas y compatibles con el carril operativo.
3. El rol requiere turno, sede y área exacta de Mostrador válidos.
4. El tipo de área se resuelve desde la configuración canónica y no desde el nombre visible.
5. Las acciones vivas o mutadoras concedidas exigen check-in cuando corresponde.
6. El rol puede consultar referencias y solicitar abastecimiento sin acceder a inventario general.
7. La actualización se limita a solicitudes propias y editables.
8. No puede preparar, despachar, recibir o cancelar remisiones por defecto.
9. `pulso.access` no autoriza colas, alistamiento, empaque, cambios de estado, entregas, cobros ni cierres por sí solo.
10. El rol no recibe permisos de caja, salón, barra, cocina o producción por similitud funcional.
11. No se inventa ni se recupera un rol base legacy equivalente.
12. La existencia de una asignación en Vento Café / Mostrador no se presenta como implementación funcional terminada.
13. `delivery.override` permanece fuera de la matriz ordinaria.
14. Las 101 capacidades restantes permanecen denegadas por defecto.
15. No se implementa código, Supabase ni migraciones en esta tarea.
16. `AUTH-RBAC-013` permanece sin iniciar hasta solicitud expresa.

#### 17. Estado final de la propuesta

| Tarea         | Estado      |
| ------------- | ----------- |
| AUTH-RBAC-011 | APROBADA    |
| AUTH-RBAC-012 | APROBADA    |
| AUTH-RBAC-013 | NO INICIADA |

No se implementan código, migraciones, cambios en Supabase, RLS, RPC, datasets, repositorios, guards, dispositivos ni pantallas. La matriz solo será canónica cuando el usuario la apruebe expresamente.


### ✅ AUTH-RBAC-013 — Crear matriz de operador_integral_satelite


#### 1. Identificación de la tarea

| Campo                     | Valor                                                              |
| ------------------------- | ------------------------------------------------------------------ |
| Bloque                    | BLOQUE D — Matrices canónicas de roles, excepciones y dispositivos |
| Tarea                     | AUTH-RBAC-013 — Crear matriz de operador_integral_satelite         |
| Estado                    | **APROBADA**                                                       |
| Naturaleza                | Definición documental de matriz de operador integral satélite      |
| Implementación física     | No incluida                                                        |
| Catálogo evaluado         | 112 permisos canónicos vigentes                                    |
| Tarea anterior vigente    | AUTH-RBAC-012 — APROBADA                                           |
| Tarea posterior reservada | AUTH-RBAC-014 — Crear matriz de produccion_cocina                  |

Esta tarea no modifica Supabase, migraciones, tablas, RLS, RPC, aplicaciones, repositorios ni datasets físicos. La aplicación posterior deberá realizarse mediante AUTH-RBAC-025 y las migraciones versionadas del BLOQUE R en `vento-shell`.

#### 2. Objetivo

Definir, permiso por permiso, las capacidades que puede ejercer el rol operativo `operador_integral_satelite` durante un turno válido en un formato satélite pequeño configurado expresamente para operación integrada, sin convertirlo en superusuario, sin fusionar automáticamente las matrices de caja, barra, cocina, salón y mostrador, y sin recuperar el permiso legacy amplio `pulso.pos.main`.

#### 3. Decisión principal

`operador_integral_satelite` representa una función temporal para sedes pequeñas donde una misma persona ejecuta varias responsabilidades ordinarias durante el turno. La integración pertenece al diseño operativo de la sede; no significa acceso total ni elimina la obligación de autorizar cada capacidad mediante una clave canónica exacta.

```text
ACTOR IDENTIFICADO
+ TURNO PUBLICADO Y VIGENTE
+ ROL operador_integral_satelite
+ SEDE HABILITADA COMO FORMATO INTEGRADO
+ ÁREA EXACTA CUANDO LA CONFIGURACIÓN DE LA SEDE LA EXIJA
+ CHECK-IN CUANDO EL PERMISO LO EXIJA
+ PERMISO OPERATIVO EXPLÍCITO
+ RECURSO COMPATIBLE
= AUTORIZACIÓN OPERATIVA INTEGRADA
```

No se admite:

```text
operador_integral_satelite = superusuario
operador_integral_satelite = unión automática de cinco matrices
formato pequeño = ausencia de controles
pulso.access = autorización para vender, cobrar o cerrar caja
pulso.pos.main legacy = permiso canónico reutilizable
dispositivo compartido = rol automático
PIN del dispositivo = sustituto del permiso
sede seleccionada = autorización
rol base administrativo = ampliación del contexto operativo
operador_integral_satelite = inventario general, logística o producción central
```

#### 4. Resultado cuantitativo de la matriz

| Resultado                                    | Cantidad | Efecto                                                                                                                                              |
| -------------------------------------------- | -------: | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| Capacidades operativas asignadas             |       12 | Se conceden por el carril operativo dentro del contexto de operación integrada y de los recursos expresamente definidos.                            |
| Capacidades `BASE_AND_OPERATIONAL` asignadas |        0 | El rol operativo no recibe autoridad base adicional.                                                                                                |
| Capacidades no asignadas                     |      100 | Permanecen denegadas por defecto por pertenecer al carril base, a otros procesos operativos o a acciones sensibles ajenas a la operación integrada. |
| Total evaluado                               |      112 | Sin omisiones ni duplicados.                                                                                                                        |

La matriz contiene **12 concesiones operativas a nivel de clave** y **100 ausencias de concesión**. La ausencia de concesión produce denegación por defecto; no se crean filas `deny` redundantes.

#### 5. Perfiles de alcance utilizados

| Perfil                             | Significado                                                                                                                                                        |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `CTX-INTEGRATED-APP`               | Entrada operativa a una aplicación con turno y rol válidos dentro de una sede habilitada para formato integrado. No concede capacidades internas.                  |
| `CTX-INTEGRATED-REF`               | Consulta mínima de productos, presentaciones, políticas, categorías, unidades y rutas necesarias para abastecimiento de la sede integrada.                         |
| `CTX-INTEGRATED-REMISSION`         | Consulta de remisiones por relación legítima con la sede destino o con el actor solicitante.                                                                       |
| `CTX-INTEGRATED-REMISSION-OWN`     | Modificación exclusiva de solicitudes propias y todavía editables.                                                                                                 |
| `CTX-INTEGRATED-REMISSION-REQUEST` | Creación de solicitudes para la sede integrada activa mediante rutas, productos, presentaciones y políticas válidas.                                               |
| `CTX-INTEGRATED-REMISSION-RECEIVE` | Confirmación ordinaria de recepción física en la sede integrada activa, con validación de cantidades, estado, actor, evidencia y concurrencia.                     |
| `CTX-INTEGRATED-PULSO`             | Entrada a la superficie comercial del formato pequeño. No sustituye permisos atómicos de pedidos, preparación, servicio, venta, pago, caja, fidelización o cierre. |

#### 6. Reglas obligatorias de la matriz

1. Cada concesión utiliza una clave canónica exacta; no existen wildcards, herencias implícitas ni autorización por el nombre del rol.
2. `operador_integral_satelite` no hereda automáticamente las concesiones de `cajero_satelite`, `barista_satelite`, `cocinero_satelite`, `servicio_salon` o `mostrador_satelite`.
3. El rol operativo efectivo procede exclusivamente del turno publicado y vigente. Los perfiles y dispositivos solo sugieren o restringen; nunca asignan el rol.
4. La sede debe estar habilitada expresamente para `operador_integral_satelite`. La configuración `site_operational_roles` determina si exige un área concreta o admite el área general de la sede.
5. Cuando la sede configure un área exacta, el turno y el recurso deberán coincidir con ella. Un `area_id` nulo no podrá utilizarse para eludir una restricción existente.
6. Las concesiones con prerrequisito `T` pueden consultarse antes del check-in, pero continúan exigiendo turno, rol y sede válidos.
7. Las concesiones con prerrequisito `T+C` requieren turno y check-in activos, sede compatible y recurso resoluble.
8. La sede activa se deriva del contexto válido; la sede seleccionada, primaria o enviada por el cliente no concede autoridad.
9. `pulso.access` solo permite entrar a PULSO y cargar la superficie compatible. No autoriza pedidos, preparación, servicio, venta, pago, caja, comprobantes, fidelización, anulaciones, devoluciones ni cierres.
10. El permiso legacy amplio `pulso.pos.main` permanece bloqueado y no se incorpora a esta matriz.
11. La consulta de catálogo desde NEXO se limita a los atributos necesarios para identificar productos, presentaciones, empaques e insumos solicitables para la sede integrada.
12. La consulta de remisiones se limita a la relación del actor o de la sede destino; no concede visibilidad de toda la red.
13. La actualización de remisiones se limita a solicitudes propias, estados editables y campos permitidos, con reautenticación y auditoría.
14. La solicitud de remisiones debe ser idempotente y validar políticas, ruta, destino, cantidades y presentaciones.
15. La recepción se limita a remisiones destinadas a la sede integrada activa y al estado empresarial que admita recepción. No permite preparar, despachar, cancelar ni corregir unilateralmente cantidades de origen.
16. Recibir una remisión no concede consulta general de stock, movimientos, ubicaciones, LPN, entradas, retiros, traslados, conteos o ajustes.
17. `pulso.delivery.deliveries.override` no se asigna al rol. Solo podrá obtenerse mediante autoridad base explícita y contexto operativo simultáneo.
18. APP-REVIEW, entornos demo, recursos aislados y sedes no habilitadas permanecen excluidos.
19. Las denegaciones individuales, estructurales, de recurso, dispositivo o aislamiento prevalecen sobre esta matriz.
20. Todo permiso nuevo se deniega hasta que una versión canónica posterior lo evalúe expresamente para `operador_integral_satelite`.

#### 7. Matriz canónica completa
##### 7.1 SHELL — 1 permisos

| Permiso        | Capacidad humana  | Modalidad   | Decisión para operador_integral_satelite | Alcance aprobado                                                       | Condición                                                                                              |
| -------------- | ----------------- | ----------- | ---------------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `shell.access` | Entrar a Vento OS | `BASE_ONLY` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.2 ANIMA — 10 permisos

| Permiso                                     | Capacidad humana                     | Modalidad   | Decisión para operador_integral_satelite | Alcance aprobado                                                       | Condición                                                                                              |
| ------------------------------------------- | ------------------------------------ | ----------- | ---------------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `anima.access`                              | Entrar a ANIMA                       | `BASE_ONLY` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.employee_documents.view`   | Consultar documentos de trabajadores | `BASE_ONLY` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.employee_documents.upload` | Cargar documentos de trabajadores    | `BASE_ONLY` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.employee_documents.delete` | Eliminar documentos de trabajadores  | `BASE_ONLY` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.employee_photos.upload`    | Cargar fotografías de trabajadores   | `BASE_ONLY` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.team_members.view`         | Consultar integrantes del equipo     | `BASE_ONLY` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.staff_invitations.create`  | Invitar trabajadores                 | `BASE_ONLY` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.attendance.shifts.create`            | Crear turnos                         | `BASE_ONLY` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.attendance.shifts.update`            | Actualizar turnos                    | `BASE_ONLY` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.attendance.shifts.cancel`            | Cancelar turnos                      | `BASE_ONLY` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.3 AURA — 1 permisos

| Permiso       | Capacidad humana | Modalidad   | Decisión para operador_integral_satelite | Alcance aprobado                                                       | Condición                                                                                              |
| ------------- | ---------------- | ----------- | ---------------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `aura.access` | Entrar a AURA    | `BASE_ONLY` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.4 FOGO — 6 permisos

| Permiso                            | Capacidad humana                | Modalidad             | Decisión para operador_integral_satelite | Alcance aprobado                                                       | Condición                                                                                                                                                                                                   |
| ---------------------------------- | ------------------------------- | --------------------- | ---------------------------------------- | ---------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `fogo.access`                      | Entrar a FOGO                   | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece al proceso productivo de FOGO y no se asigna automáticamente a la operación integrada del punto de venta.                                                                            |
| `fogo.production.batches.view`     | Consultar lotes de producción   | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece al proceso productivo de FOGO y no se asigna automáticamente a la operación integrada del punto de venta.                                                                            |
| `fogo.production.batches.create`   | Crear lotes de producción       | `OPERATIONAL_ONLY`    | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece al proceso productivo de FOGO y no se asigna automáticamente a la operación integrada del punto de venta.                                                                            |
| `fogo.production.orders.view`      | Consultar órdenes de producción | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece al proceso productivo de FOGO y no se asigna automáticamente a la operación integrada del punto de venta.                                                                            |
| `fogo.production.recipe_book.view` | Consultar recetario operativo   | `OPERATIONAL_ONLY`    | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | El recetario de FOGO no se concede por inferencia. La consulta de fórmulas o fichas de alimentos deberá contar con un permiso atómico y contrato de aplicabilidad propios antes de incorporarse a este rol. |
| `fogo.production.recipes.view`     | Consultar recetas               | `BASE_ONLY`           | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                      |

##### 7.5 NEXO — 63 permisos

| Permiso                                      | Capacidad humana                         | Modalidad              | Decisión para operador_integral_satelite | Alcance aprobado                                                                                                                                                                                                                            | Condición                                                                                                                                                                                                                    |
| -------------------------------------------- | ---------------------------------------- | ---------------------- | ---------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `nexo.access`                                | Entrar a NEXO                            | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**                    | CTX-INTEGRATED-APP — turno publicado y vigente, rol efectivo `operador_integral_satelite`, sede activa habilitada para formato integrado y área exacta cuando la configuración la exija. No exige check-in para mostrar entrada y bloqueos. | Carril operativo. Permite entrar a NEXO y ver el estado del contexto. No concede por sí solo catálogo, remisiones, inventario ni otra acción.                                                                                |
| `nexo.catalog.products.view`                 | Consultar productos                      | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**                    | CTX-INTEGRATED-REF — consulta operativa de productos vigentes aplicables a la sede activa. Excluye costos, márgenes, existencias, recetas, proveedores y campos técnicos no necesarios.                                                     | Turno vigente y rol `operador_integral_satelite` válido. La proyección se utiliza para identificar productos dentro del flujo de solicitud; no permite crear ni modificar el maestro.                                        |
| `nexo.catalog.products.create`               | Crear productos                          | `BASE_ONLY`            | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                       |
| `nexo.catalog.presentations.view`            | Consultar presentaciones                 | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**                    | CTX-INTEGRATED-REF — consulta de presentaciones vigentes y solicitables para la sede y ruta aplicables.                                                                                                                                     | Turno vigente y rol válido. Solo lectura para seleccionar la presentación autorizada en una solicitud.                                                                                                                       |
| `nexo.catalog.request_policies.view`         | Consultar políticas de solicitud         | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**                    | CTX-INTEGRATED-REF — consulta de políticas de solicitud aplicables al destino, producto, presentación y ruta de abastecimiento del contexto.                                                                                                | Turno vigente. No permite modificar políticas ni ignorar mínimos, frecuencias, ventanas o restricciones.                                                                                                                     |
| `nexo.catalog.categories.view`               | Consultar categorías                     | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**                    | CTX-INTEGRATED-REF — consulta de categorías necesarias para buscar y organizar productos solicitables.                                                                                                                                      | Turno vigente. Solo lectura; no permite administrar categorías.                                                                                                                                                              |
| `nexo.catalog.units.view`                    | Consultar unidades                       | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**                    | CTX-INTEGRATED-REF — consulta de unidades, empaques y equivalencias publicadas necesarias para interpretar presentaciones solicitables.                                                                                                     | Turno vigente. Solo lectura; no permite administrar unidades ni conversiones.                                                                                                                                                |
| `nexo.assets.items.view`                     | Consultar activos                        | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde la sede integrada o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.                              |
| `nexo.assets.items.create`                   | Crear activos                            | `BASE_ONLY`            | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                       |
| `nexo.assets.groups.view`                    | Consultar grupos de activos              | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde la sede integrada o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.                              |
| `nexo.assets.counts.view`                    | Consultar conteos de activos             | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde la sede integrada o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.                              |
| `nexo.inventory.adjustments.view`            | Consultar ajustes de inventario          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde la sede integrada o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.                              |
| `nexo.inventory.adjustments.register`        | Registrar ajustes de inventario          | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | La capacidad exige autoridad base y contexto operativo simultáneos. Esta matriz no concede el componente base ni la capacidad completa.                                                                                      |
| `nexo.inventory.entries.view`                | Consultar entradas de inventario         | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde la sede integrada o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.                              |
| `nexo.inventory.entries.register`            | Registrar entradas de inventario         | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde la sede integrada o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.                              |
| `nexo.inventory.entries.override`            | Registrar entradas excepcionales         | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | La capacidad exige autoridad base y contexto operativo simultáneos. Esta matriz no concede el componente base ni la capacidad completa.                                                                                      |
| `nexo.inventory.locations.view`              | Consultar ubicaciones de inventario      | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde la sede integrada o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.                              |
| `nexo.inventory.location_assignments.assign` | Asignar ubicaciones de inventario        | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde la sede integrada o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.                              |
| `nexo.inventory.location_catalog.update`     | Actualizar el catálogo de una ubicación  | `BASE_ONLY`            | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                       |
| `nexo.inventory.lpns.view`                   | Consultar LPN                            | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde la sede integrada o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.                              |
| `nexo.inventory.movements.view`              | Consultar movimientos de inventario      | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde la sede integrada o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.                              |
| `nexo.inventory.stock.view`                  | Consultar stock                          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | El stock exige área activa coincidente. El rol de cocina no recibe visibilidad general de existencias de cocina, bodega, otras cocinas ni otras áreas.                                                                       |
| `nexo.inventory.production_batches.view`     | Consultar lotes vinculados al inventario | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde la sede integrada o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.                              |
| `nexo.inventory.transfers.view`              | Consultar traslados de inventario        | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde la sede integrada o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.                              |
| `nexo.inventory.transfers.create`            | Crear traslados de inventario            | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde la sede integrada o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.                              |
| `nexo.inventory.withdrawals.view`            | Consultar retiros de inventario          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde la sede integrada o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.                              |
| `nexo.inventory.withdrawals.register`        | Registrar retiros de inventario          | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde la sede integrada o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.                              |
| `nexo.inventory.zones.view`                  | Consultar zonas de almacenamiento        | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde la sede integrada o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.                              |
| `nexo.inventory.storage_positions.view`      | Consultar posiciones de almacenamiento   | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde la sede integrada o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.                              |
| `nexo.inventory.warehouse_operations.view`   | Consultar operaciones de bodega          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde la sede integrada o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.                              |
| `nexo.inventory.stock_validations.perform`   | Ejecutar validaciones de inventario      | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde la sede integrada o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.                              |
| `nexo.inventory.stock_counts.view`           | Consultar conteos de inventario          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde la sede integrada o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.                              |
| `nexo.inventory.stock_counts.perform`        | Ejecutar conteos de inventario           | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde la sede integrada o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.                              |
| `nexo.inventory.initial_counts.view`         | Consultar conteos iniciales              | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde la sede integrada o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.                              |
| `nexo.inventory.remissions.view`             | Consultar remisiones                     | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**                    | CTX-INTEGRATED-REMISSION — remisiones donde la sede activa sea destino, el actor sea solicitante o exista otra relación operativa explícita. No concede visibilidad general sobre otras sedes.                                              | Turno y check-in activos. Recurso resoluble y relacionado con el actor o la sede destino. Mostrar únicamente campos autorizados para el lado solicitante.                                                                    |
| `nexo.inventory.remissions.update`           | Actualizar remisiones                    | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**                    | CTX-INTEGRATED-REMISSION-OWN — únicamente solicitudes creadas por el actor, en estados editables y sobre campos permitidos del lado solicitante.                                                                                            | Turno y check-in activos. Control optimista de versión, reautenticación fuerte y auditoría antes/después. No permite preparar, despachar, recibir, cancelar ni modificar el lado de origen.                                  |
| `nexo.inventory.remissions.request`          | Solicitar remisiones                     | `OPERATIONAL_ONLY`     | **ASIGNAR OPERATIVO**                    | CTX-INTEGRATED-REMISSION-REQUEST — crear una solicitud para la sede integrada activa y desde el área exacta cuando la configuración la exija, utilizando origen, ruta, productos, presentaciones y políticas válidas.                       | Turno y check-in activos. Creación idempotente; validar destino, ruta, políticas, cantidades y presentaciones. El actor queda registrado como solicitante.                                                                   |
| `nexo.inventory.remissions.prepare`          | Preparar remisiones                      | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde la sede integrada o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.                              |
| `nexo.inventory.remissions.dispatch`         | Despachar remisiones                     | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde la sede integrada o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.                              |
| `nexo.inventory.remissions.receive`          | Recibir remisiones                       | `OPERATIONAL_ONLY`     | **ASIGNAR OPERATIVO**                    | CTX-INTEGRATED-REMISSION-RECEIVE — recepción ordinaria de remisiones cuyo destino sea la sede integrada activa, con recurso, origen, cantidades y estado válidos.                                                                           | Turno y check-in activos. Reautenticación fuerte, verificación física, control de concurrencia y auditoría antes/después. Solo confirma recepción en destino; no permite preparar, despachar, cancelar ni alterar el origen. |
| `nexo.inventory.remissions.cancel`           | Cancelar remisiones                      | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | La cancelación no se concede por defecto al operador integral. Una necesidad de cancelar solicitudes propias deberá definirse como política explícita o excepción operativa auditada.                                        |
| `nexo.logistics.operations_board.view`       | Consultar tablero logístico              | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde la sede integrada o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.                              |
| `nexo.logistics.operations.view`             | Consultar operaciones logísticas         | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde la sede integrada o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.                              |
| `nexo.logistics.driver_operations.view`      | Consultar operaciones de conductores     | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde la sede integrada o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.                              |
| `nexo.logistics.fulfillment.view`            | Consultar cumplimiento logístico         | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde la sede integrada o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.                              |
| `nexo.logistics.fulfillment_routes.view`     | Consultar rutas de cumplimiento          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde la sede integrada o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.                              |
| `nexo.logistics.supply_routes.view`          | Consultar rutas de abastecimiento        | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**                    | CTX-INTEGRATED-REF — consulta únicamente de rutas de abastecimiento vigentes relacionadas con la sede activa y utilizables para solicitudes.                                                                                                | Turno vigente. Solo lectura; no permite modificar rutas ni consultar configuración logística ajena al flujo de solicitud.                                                                                                    |
| `nexo.finance.internal_invoices.view`        | Consultar facturas internas              | `BASE_ONLY`            | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                       |
| `nexo.finance.internal_invoices.generate`    | Generar facturas internas                | `BASE_ONLY`            | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                       |
| `nexo.finance.internal_invoices.issue`       | Emitir facturas internas                 | `BASE_ONLY`            | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                       |
| `nexo.finance.internal_invoices.cancel`      | Cancelar facturas internas               | `BASE_ONLY`            | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                       |
| `nexo.finance.internal_invoice_amounts.view` | Consultar valores de facturas internas   | `BASE_ONLY`            | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                       |
| `nexo.finance.internal_prices.view`          | Consultar precios internos               | `BASE_ONLY`            | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                       |
| `nexo.finance.internal_variances.view`       | Consultar variaciones internas           | `BASE_ONLY`            | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                       |
| `nexo.finance.internal_variances.approve`    | Aprobar variaciones internas             | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | La capacidad exige autoridad base y contexto operativo simultáneos. Esta matriz no concede el componente base ni la capacidad completa.                                                                                      |
| `nexo.finance.internal_variances.resolve`    | Resolver variaciones internas            | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | La capacidad exige autoridad base y contexto operativo simultáneos. Esta matriz no concede el componente base ni la capacidad completa.                                                                                      |
| `nexo.finance.cost_centers.view`             | Consultar centros de costo en NEXO       | `BASE_ONLY`            | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                       |
| `nexo.analytics.internal_reports.view`       | Consultar reportes internos              | `BASE_ONLY`            | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                       |
| `nexo.analytics.margin_reports.view`         | Consultar reportes de margen             | `BASE_ONLY`            | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                       |
| `nexo.printing.templates.update`             | Editar plantillas de impresión           | `BASE_ONLY`            | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                       |
| `nexo.printing.jobs.view`                    | Consultar trabajos de impresión          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde la sede integrada o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.                              |
| `nexo.settings.sites.view`                   | Consultar configuración de sedes         | `BASE_ONLY`            | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                       |
| `nexo.settings.remission_policies.view`      | Consultar políticas de remisiones        | `BASE_ONLY`            | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                                                      | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                                       |

##### 7.6 NUMERA — 6 permisos

| Permiso                                   | Capacidad humana               | Modalidad   | Decisión para operador_integral_satelite | Alcance aprobado                                                       | Condición                                                                                              |
| ----------------------------------------- | ------------------------------ | ----------- | ---------------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `numera.access`                           | Entrar a NUMERA                | `BASE_ONLY` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.finance.cost_centers.view`        | Consultar centros de costo     | `BASE_ONLY` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.finance.expenses.view`            | Consultar gastos               | `BASE_ONLY` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.analytics.break_even.view`        | Consultar punto de equilibrio  | `BASE_ONLY` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.analytics.profitability.view`     | Consultar rentabilidad         | `BASE_ONLY` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.analytics.financial_reports.view` | Consultar reportes financieros | `BASE_ONLY` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.7 ORIGO — 5 permisos

| Permiso                                  | Capacidad humana                  | Modalidad             | Decisión para operador_integral_satelite | Alcance aprobado                                                       | Condición                                                                                                               |
| ---------------------------------------- | --------------------------------- | --------------------- | ---------------------------------------- | ---------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| `origo.access`                           | Entrar a ORIGO                    | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece a compras, recepción o proveedores y no corresponde a la operación integrada del punto de venta. |
| `origo.procurement.purchase_orders.view` | Consultar órdenes de compra       | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece a compras, recepción o proveedores y no corresponde a la operación integrada del punto de venta. |
| `origo.procurement.receipts.view`        | Consultar recepciones de compra   | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece a compras, recepción o proveedores y no corresponde a la operación integrada del punto de venta. |
| `origo.procurement.suppliers.view`       | Consultar proveedores             | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece a compras, recepción o proveedores y no corresponde a la operación integrada del punto de venta. |
| `origo.catalog.product_reviews.view`     | Consultar revisiones de productos | `BASE_ONLY`           | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                  |

##### 7.8 VENTO PASS — 1 permisos

| Permiso       | Capacidad humana    | Modalidad   | Decisión para operador_integral_satelite | Alcance aprobado                                                       | Condición                                                                                              |
| ------------- | ------------------- | ----------- | ---------------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `pass.access` | Entrar a Vento Pass | `BASE_ONLY` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.9 PULSO — 2 permisos

| Permiso                              | Capacidad humana                        | Modalidad              | Decisión para operador_integral_satelite | Alcance aprobado                                                                                                                                             | Condición                                                                                                                                                                                                              |
| ------------------------------------ | --------------------------------------- | ---------------------- | ---------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `pulso.access`                       | Entrar a PULSO                          | `OPERATIONAL_ONLY`     | **ASIGNAR OPERATIVO**                    | CTX-INTEGRATED-PULSO — turno publicado y vigente, rol `operador_integral_satelite`, sede habilitada como formato integrado y área exacta cuando corresponda. | Carril operativo. Permite entrar a PULSO y mostrar la superficie integrada. No autoriza por sí solo pedidos, preparación, servicio, ventas, pagos, caja, anulaciones, devoluciones, fidelización, entregas ni cierres. |
| `pulso.delivery.deliveries.override` | Confirmar entregas de forma excepcional | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                       | Capacidad `BASE_AND_OPERATIONAL` de excepción. Requiere autoridad base explícita, turno, check-in, reautenticación fuerte, motivo y auditoría reforzada.                                                               |

##### 7.10 VISO — 17 permisos

| Permiso                                       | Capacidad humana                          | Modalidad   | Decisión para operador_integral_satelite | Alcance aprobado                                                       | Condición                                                                                              |
| --------------------------------------------- | ----------------------------------------- | ----------- | ---------------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `viso.access`                                 | Entrar a VISO                             | `BASE_ONLY` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.platform.app_updates.view`              | Consultar actualizaciones de aplicaciones | `BASE_ONLY` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.organization.businesses.view`           | Consultar empresas y unidades de negocio  | `BASE_ONLY` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.workforce.employees.view`               | Consultar trabajadores                    | `BASE_ONLY` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.workforce.staff_calendar.view`          | Consultar calendario del personal         | `BASE_ONLY` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.workforce.schedules.view`               | Consultar programación de turnos          | `BASE_ONLY` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.workforce.vacancies.view`               | Consultar vacantes                        | `BASE_ONLY` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.authorization.context_simulations.view` | Consultar simulaciones de autorización    | `BASE_ONLY` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.authorization.audit_logs.view`          | Consultar auditoría de autorización       | `BASE_ONLY` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.catalog.commercial_categories.view`     | Consultar categorías comerciales          | `BASE_ONLY` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.content.content_blocks.view`            | Consultar bloques de contenido            | `BASE_ONLY` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.content.menu.view`                      | Consultar menú                            | `BASE_ONLY` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.content.website_content.view`           | Consultar contenido del sitio web         | `BASE_ONLY` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.finance.accounting.view`                | Consultar información contable            | `BASE_ONLY` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.delivery.rates.view`                    | Consultar tarifas de entrega              | `BASE_ONLY` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.loyalty.products.view`                  | Consultar productos de fidelización       | `BASE_ONLY` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.loyalty.customers.view`                 | Consultar clientes de fidelización        | `BASE_ONLY` | **NO ASIGNAR**                           | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |


#### 8. Resumen por aplicación

| Aplicación | Permisos canónicos | Asignados | No asignados |
| ---------- | -----------------: | --------: | -----------: |
| SHELL      |                  1 |         0 |            1 |
| ANIMA      |                 10 |         0 |           10 |
| AURA       |                  1 |         0 |            1 |
| FOGO       |                  6 |         0 |            6 |
| NEXO       |                 63 |        11 |           52 |
| NUMERA     |                  6 |         0 |            6 |
| ORIGO      |                  5 |         0 |            5 |
| VENTO PASS |                  1 |         0 |            1 |
| PULSO      |                  2 |         1 |            1 |
| VISO       |                 17 |         0 |           17 |
| **Total**  |            **112** |    **12** |      **100** |

#### 9. Flujo operativo autorizado

```text
TURNO INTEGRADO VÁLIDO
        ↓
ENTRAR A PULSO
        ↓
FUNCIONES ATÓMICAS DE PEDIDOS, PREPARACIÓN,
SERVICIO, VENTA, PAGO Y CAJA
PENDIENTES DE CATÁLOGO

TURNO + CHECK-IN
        ↓
ENTRAR A NEXO
        ↓
CONSULTAR REFERENCIAS DE SOLICITUD
        ↓
CONSULTAR / CREAR / EDITAR SOLICITUD PROPIA
        ↓
RECIBIR REMISIÓN DESTINADA A LA SEDE INTEGRADA
```

La matriz permite que el operador integral gestione el abastecimiento ordinario de la sede pequeña desde la solicitud hasta la recepción. No lo convierte en bodeguero: no concede preparación en origen, despacho, cancelación, inventario general ni administración logística. Tampoco autoriza todavía las operaciones internas de PULSO porque el catálogo no contiene permisos atómicos suficientes.

#### 10. Capacidades expresamente no concedidas

- cualquier permiso exclusivo del carril base;
- gestión de personal, documentos, turnos, permisos o seguridad;
- lotes, órdenes, recetas maestras o producción central de FOGO;
- entradas generales, retiros, traslados, conteos, ajustes, ubicaciones, LPN o validaciones de inventario;
- preparación o despacho de remisiones en origen;
- cancelación de remisiones por defecto;
- correcciones unilaterales sobre cantidades despachadas o custodia de origen;
- operaciones logísticas de conductor, cumplimiento o bodega central;
- compras, recepciones de compra y proveedores de ORIGO;
- facturas internas, costos, márgenes, gastos, contabilidad o NUMERA;
- configuración de sedes, políticas, rutas, impresión o catálogos maestros;
- ventas, pagos, caja, anulaciones, devoluciones, descuentos o cierres por inferencia desde PULSO;
- preparación de alimentos, bebidas, servicio de salón o mostrador por simple nombre del rol, mientras no existan permisos atómicos;
- `pulso.pos.main` por ser un permiso legacy amplio y bloqueado;
- `pulso.delivery.deliveries.override` sin autoridad base separada;
- acceso a clientes, puntos o canjes de fidelización por inferencia;
- acceso a APP-REVIEW o a sedes no habilitadas;
- cualquier permiso futuro no evaluado expresamente.

#### 11. Brechas del catálogo identificadas

El catálogo vigente no representa todavía la operación comercial integrada de un formato pequeño. Como mínimo deberán separarse permisos atómicos para:

- consultar y gestionar pedidos del turno y la sede;
- distinguir pedido en mesa, mostrador, recogida, domicilio u otros canales;
- preparar productos simples o coordinar preparación por área;
- registrar estados de preparación, alistamiento y entrega;
- gestionar mesas o servicio cuando el formato lo utilice;
- crear ventas y aplicar reglas comerciales autorizadas;
- cobrar por medios permitidos y emitir comprobantes;
- abrir, operar y cerrar caja mediante capacidades separadas;
- anular, devolver, descontar o corregir mediante permisos sensibles específicos;
- acumular o redimir fidelización mediante permisos propios;
- registrar faltantes, desperdicios, incidencias y rehacer productos;
- atribuir acciones al trabajador real en dispositivos compartidos.

Estas brechas no amplían la matriz. `operador_integral_satelite` solo podrá ejecutar las capacidades que tengan permiso canónico explícito. El concepto “integral” describe la organización del trabajo en la sede, no una autorización total.

#### 12. Dispositivo compartido para formato integrado

No existe todavía una plantilla canónica específica para el operador integral. Una futura terminal de formato pequeño podrá habilitar PULSO, NEXO y SHELL como superficies disponibles, pero no concederá por sí misma esta matriz.

Antes de ejecutar una acción deberá existir:

```text
DISPOSITIVO TÉCNICO ACTIVO
+ ACTOR IDENTIFICADO
+ PIN O AUTENTICACIÓN EXIGIDA
+ TURNO operador_integral_satelite VÁLIDO
+ SEDE DEL DISPOSITIVO HABILITADA PARA FORMATO INTEGRADO
+ ÁREA COINCIDENTE CUANDO CORRESPONDA
+ CHECK-IN CUANDO EL PERMISO LO EXIJA
+ PERMISO DE ESTA MATRIZ
= ACCIÓN ATRIBUIBLE AL TRABAJADOR
```

La política de actor deberá validar expresamente el rol y la sede. `same_site_active_worker` no será suficiente por sí sola. Tampoco se admitirán sesiones anónimas, acciones atribuidas al usuario técnico ni navegación basada únicamente en `navigation_role`. La plantilla concreta corresponde a AUTH-RBAC-023.

#### 13. Relación con el estado legacy

La auditoría encontró que `operador_integral_satelite` registra **35 turnos históricos**, está habilitado en **Molka / sede general** y conserva seis permisos operativos legacy:

```text
nexo.access
nexo.inventory.remissions
nexo.inventory.remissions.request
nexo.inventory.remissions.receive
pulso.access
pulso.pos.main
```

La propuesta no copia esas seis cadenas de forma mecánica. Normaliza la consulta de remisiones, incorpora las referencias mínimas necesarias para una solicitud segura, conserva la recepción ordinaria en destino y excluye `pulso.pos.main` porque el catálogo lo clasifica como permiso amplio bloqueado.

```text
35 TURNOS HISTÓRICOS
+ 1 ASIGNACIÓN DE SEDE GENERAL
+ 6 PERMISOS LEGACY
        ↓
VALIDACIÓN CONTRA 112 PERMISOS CANÓNICOS
        ↓
12 CONCESIONES OPERATIVAS EXPLÍCITAS
├── 6 referencias de catálogo y políticas
├── 4 capacidades sobre solicitudes/remisiones
├── 1 referencia de rutas de abastecimiento
└── 1 entrada a PULSO
```

Las 12 concesiones no demuestran que la operación comercial integrada esté completamente implementada. Solo definen el mínimo autorizable con el catálogo vigente.

#### 14. Validaciones de integridad

- ✅ Los 112 permisos canónicos fueron evaluados exactamente una vez.
- ✅ Las cantidades por aplicación suman 112.
- ✅ Solo se asignaron permisos que admiten carril operativo.
- ✅ No se asignó ningún permiso `BASE_ONLY`.
- ✅ No se asignó ningún permiso `BASE_AND_OPERATIONAL`.
- ✅ Cada permiso concedido tiene contexto y recurso explícitos.
- ✅ El rol exige turno y sede integrada válidos; el área exacta se exige cuando la configuración de la sede lo determine.
- ✅ Las mutaciones concedidas exigen check-in.
- ✅ La recepción se limita al destino y no concede facultades de origen.
- ✅ `pulso.access` no se utiliza como wildcard de PULSO.
- ✅ `pulso.pos.main` no fue recuperado desde el modelo legacy.
- ✅ No se concedieron inventario general, logística central, producción, compras, finanzas, gestión laboral o seguridad.
- ✅ El rol no se definió como unión automática de otras matrices.
- ✅ No existen wildcards ni permisos implícitos.
- ✅ APP-REVIEW y sedes no habilitadas permanecen excluidas.
- ✅ Los permisos nuevos se deniegan por defecto.

#### 15. Impacto sobre tareas posteriores

| Tarea                     | Impacto                                                                                                                                                                   |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| AUTH-RBAC-014             | Deberá definir `produccion_cocina` como rol de producción central, sin heredar capacidades del operador integral ni de cocina satélite.                                   |
| AUTH-RBAC-021             | Podrá añadir excepciones operativas individuales sin sustituir turno, sede, área, rol ni permiso exacto.                                                                  |
| AUTH-RBAC-023             | Deberá definir terminales de formato integrado y limitar actor, sede, área, aplicaciones y duración.                                                                      |
| AUTH-RBAC-025             | Deberá proyectar estas 12 concesiones en el dataset canónico de matriz operativa.                                                                                         |
| AUTH-RBAC-027             | Deberá confirmar que el carácter integrado no produzca acceso operativo global accidental.                                                                                |
| BLOQUE E                  | Deberá distinguir entrada, permiso, recurso, territorio, estado y razones de bloqueo en la decisión final.                                                                |
| PULSO y roadmap funcional | Deberán descomponer `pulso.pos.main` y crear permisos atómicos para pedidos, preparación, servicio, venta, pago, caja, comprobantes, fidelización, incidencias y cierres. |
| BLOQUE R                  | Implementará la transición física mediante migraciones versionadas en `vento-shell`, pruebas, reconciliación y rollback.                                                  |

#### 16. Criterios de aprobación

1. `operador_integral_satelite` queda definido como rol temporal para formatos pequeños expresamente habilitados.
2. El rol no es un superusuario ni la unión automática de las matrices de caja, barra, cocina, salón y mostrador.
3. Las 12 concesiones son explícitas y compatibles con el carril operativo.
4. El rol requiere turno y sede válidos; el área exacta se exige según la configuración canónica de la sede.
5. Las acciones vivas o mutadoras concedidas exigen check-in.
6. El rol puede consultar referencias, solicitar abastecimiento y modificar solicitudes propias sin acceder a inventario general.
7. Puede recibir remisiones destinadas a la sede integrada activa, con validación física, reautenticación y auditoría.
8. No puede preparar, despachar o cancelar remisiones por defecto.
9. La recepción no concede stock, movimientos, ubicaciones, LPN, entradas, retiros, traslados, conteos ni ajustes.
10. `pulso.access` no autoriza pedidos, preparación, servicio, ventas, pagos, caja, fidelización ni cierres por sí solo.
11. `pulso.pos.main` permanece bloqueado y no se hereda desde el estado legacy.
12. `delivery.override` permanece fuera de la matriz ordinaria.
13. La asignación histórica en Molka no se presenta como implementación funcional completa.
14. Las 100 capacidades restantes permanecen denegadas por defecto.
15. No se implementa código, Supabase ni migraciones en esta tarea.
16. `AUTH-RBAC-014` permanece sin iniciar hasta solicitud expresa.

#### 17. Estado final de la propuesta

| Tarea         | Estado      |
| ------------- | ----------- |
| AUTH-RBAC-012 | APROBADA    |
| AUTH-RBAC-013 | APROBADA    |
| AUTH-RBAC-014 | NO INICIADA |

No se implementan código, migraciones, cambios en Supabase, RLS, RPC, datasets, repositorios, guards, dispositivos ni pantallas. La matriz solo será canónica cuando el usuario la apruebe expresamente.
