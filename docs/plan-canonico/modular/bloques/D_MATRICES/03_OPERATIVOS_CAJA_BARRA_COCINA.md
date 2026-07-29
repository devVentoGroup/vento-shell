### SECCIÓN — OPERATIVOS CAJA BARRA COCINA

<!-- PLAN-SECTION-META:START -->
Esta sección reúne contenido canónico con una responsabilidad documental única dentro del plan. Debe conservarse cohesionada y actualizarse junto con sus referencias y validaciones dependientes.

**Cobertura canónica:** `AUTH-RBAC-008` a `AUTH-RBAC-010` — 3 tareas.
<!-- PLAN-SECTION-META:END -->

### ✅ AUTH-RBAC-008 — Crear matriz de cajero_satelite

#### 1. Identificación de la tarea

| Campo                     | Valor                                                              |
| ------------------------- | ------------------------------------------------------------------ |
| Bloque                    | BLOQUE D — Matrices canónicas de roles, excepciones y dispositivos |
| Tarea                     | AUTH-RBAC-008 — Crear matriz de cajero_satelite                    |
| Estado                    | **APROBADA**                                                       |
| Naturaleza                | Definición documental de matriz operativa de caja satélite         |
| Implementación física     | No incluida                                                        |
| Catálogo evaluado         | 112 permisos canónicos vigentes                                    |
| Tarea anterior vigente    | AUTH-RBAC-007 — APROBADA                                           |
| Tarea posterior reservada | AUTH-RBAC-009 — Crear matriz de barista_satelite                   |

Esta tarea no modifica Supabase, migraciones, tablas, RLS, RPC, aplicaciones, repositorios ni datasets físicos. La aplicación posterior deberá realizarse mediante AUTH-RBAC-025 y las migraciones versionadas del BLOQUE R en `vento-shell`.

#### 2. Objetivo

Definir, permiso por permiso, las capacidades que puede ejercer el rol operativo `cajero_satelite` durante un turno válido en un área de caja, sin recuperar permisos permanentes del rol base legacy `cajero` ni convertir el acceso a PULSO en autorización implícita para todas las funciones de venta y caja.

#### 3. Decisión principal

`cajero_satelite` representa la función temporal de caja y operación POS en una sede satélite. Su autoridad existe únicamente dentro del contexto operativo vigente y sobre recursos compatibles con la sede, el área y la relación del actor.

```text
ACTOR IDENTIFICADO
+ TURNO PUBLICADO Y VIGENTE
+ ROL cajero_satelite
+ SEDE AUTORIZADA
+ ÁREA ACTIVA DE TIPO cashier
+ CHECK-IN CUANDO EL PERMISO LO EXIJA
+ PERMISO OPERATIVO EXPLÍCITO
+ RECURSO COMPATIBLE
= AUTORIZACIÓN OPERATIVA DE CAJA
```

No se admite:

```text
employees.role = cajero → acceso permanente
pulso.access → autorización para vender o cobrar
dispositivo de caja → rol automático
PIN del dispositivo → sustituto del permiso
sede seleccionada → autorización
cajero_satelite → acceso a inventario general
cajero_satelite → delivery.override automático
```

#### 4. Resultado cuantitativo de la matriz

| Resultado                                    | Cantidad | Efecto                                                                                                                                 |
| -------------------------------------------- | -------: | -------------------------------------------------------------------------------------------------------------------------------------- |
| Capacidades operativas asignadas             |       11 | Se conceden por el carril operativo dentro del contexto de caja y de los recursos expresamente definidos.                              |
| Capacidades `BASE_AND_OPERATIONAL` asignadas |        0 | El rol operativo no recibe autoridad base adicional.                                                                                   |
| Capacidades no asignadas                     |      101 | Permanecen denegadas por defecto por pertenecer al carril base, a otros procesos operativos o a acciones sensibles no propias de caja. |
| Total evaluado                               |      112 | Sin omisiones ni duplicados.                                                                                                           |

La matriz contiene **11 concesiones operativas a nivel de clave** y **101 ausencias de concesión**. La ausencia de concesión produce denegación por defecto; no se crean filas `deny` redundantes.

#### 5. Perfiles de alcance utilizados

| Perfil                          | Significado                                                                                                                                      |
| ------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------ |
| `CTX-CASHIER-APP`               | Entrada operativa a una aplicación con turno y rol válidos. El permiso puede mostrar requisitos faltantes, pero no concede capacidades internas. |
| `CTX-CASHIER-REF`               | Consulta mínima de referencias necesarias para operar caja o solicitar abastecimiento, limitada a la sede y al flujo vigentes.                   |
| `CTX-CASHIER-REMISSION`         | Consulta de remisiones por relación legítima con la sede destino o el actor solicitante.                                                         |
| `CTX-CASHIER-REMISSION-OWN`     | Modificación exclusiva de solicitudes propias y todavía editables.                                                                               |
| `CTX-CASHIER-REMISSION-REQUEST` | Creación de solicitudes para la sede y área activas con ruta y políticas válidas.                                                                |
| `CTX-CASHIER-POS`               | Entrada a la superficie POS durante turno válido en caja. No sustituye permisos de venta, pago o cierre.                                         |

#### 6. Reglas obligatorias de la matriz

1. Cada concesión utiliza una clave canónica exacta; no existen wildcards, herencias implícitas ni autorización por el nombre del rol.
2. El rol operativo efectivo procede exclusivamente del turno publicado y vigente. Los perfiles y dispositivos solo sugieren o restringen; nunca asignan el rol.
3. `cajero_satelite` requiere un área operativa concreta compatible con el tipo `cashier` y habilitada para la sede del turno.
4. Las concesiones con prerrequisito `T` pueden consultarse antes del check-in, pero continúan exigiendo turno y rol válidos.
5. Las concesiones con prerrequisito `T+C` requieren turno y check-in activos, sede y área coincidentes y recurso resoluble.
6. La sede activa se deriva del contexto válido; la sede seleccionada, primaria o enviada por el cliente no concede autoridad.
7. El permiso `pulso.access` solo permite entrar a PULSO. No autoriza ventas, cobros, caja, anulaciones, devoluciones, puntos ni cierres.
8. La consulta de catálogo desde NEXO se limita a los atributos necesarios para identificar productos y presentaciones solicitables.
9. La consulta de remisiones se limita a la relación del actor o de la sede destino; no concede visibilidad de toda la red.
10. La actualización de remisiones se limita a solicitudes propias, estados editables y campos permitidos, con reautenticación y auditoría.
11. La solicitud de remisiones debe ser idempotente y validar políticas, ruta, destino, cantidades y presentaciones.
12. `pulso.delivery.deliveries.override` no se asigna al rol. Solo podrá obtenerse mediante autoridad base explícita y contexto operativo simultáneo.
13. APP-REVIEW, entornos demo, recursos aislados y sedes no habilitadas permanecen excluidos.
14. Las denegaciones individuales, estructurales, de recurso, dispositivo o aislamiento prevalecen sobre esta matriz.
15. Todo permiso nuevo se deniega hasta que una versión canónica posterior lo evalúe expresamente para `cajero_satelite`.

#### 7. Matriz canónica completa
##### 7.1 SHELL — 1 permisos

| Permiso        | Capacidad humana  | Modalidad   | Decisión para cajero_satelite | Alcance aprobado                                                       | Condición                                                                                              |
| -------------- | ----------------- | ----------- | ----------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `shell.access` | Entrar a Vento OS | `BASE_ONLY` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.2 ANIMA — 10 permisos

| Permiso                                     | Capacidad humana                     | Modalidad   | Decisión para cajero_satelite | Alcance aprobado                                                       | Condición                                                                                              |
| ------------------------------------------- | ------------------------------------ | ----------- | ----------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `anima.access`                              | Entrar a ANIMA                       | `BASE_ONLY` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.employee_documents.view`   | Consultar documentos de trabajadores | `BASE_ONLY` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.employee_documents.upload` | Cargar documentos de trabajadores    | `BASE_ONLY` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.employee_documents.delete` | Eliminar documentos de trabajadores  | `BASE_ONLY` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.employee_photos.upload`    | Cargar fotografías de trabajadores   | `BASE_ONLY` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.team_members.view`         | Consultar integrantes del equipo     | `BASE_ONLY` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.staff_invitations.create`  | Invitar trabajadores                 | `BASE_ONLY` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.attendance.shifts.create`            | Crear turnos                         | `BASE_ONLY` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.attendance.shifts.update`            | Actualizar turnos                    | `BASE_ONLY` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.attendance.shifts.cancel`            | Cancelar turnos                      | `BASE_ONLY` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.3 AURA — 1 permisos

| Permiso       | Capacidad humana | Modalidad   | Decisión para cajero_satelite | Alcance aprobado                                                       | Condición                                                                                              |
| ------------- | ---------------- | ----------- | ----------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `aura.access` | Entrar a AURA    | `BASE_ONLY` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.4 FOGO — 6 permisos

| Permiso                            | Capacidad humana                | Modalidad             | Decisión para cajero_satelite | Alcance aprobado                                                       | Condición                                                                                              |
| ---------------------------------- | ------------------------------- | --------------------- | ----------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `fogo.access`                      | Entrar a FOGO                   | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece a producción y no corresponde a la función de caja satélite.                    |
| `fogo.production.batches.view`     | Consultar lotes de producción   | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece a producción y no corresponde a la función de caja satélite.                    |
| `fogo.production.batches.create`   | Crear lotes de producción       | `OPERATIONAL_ONLY`    | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece a producción y no corresponde a la función de caja satélite.                    |
| `fogo.production.orders.view`      | Consultar órdenes de producción | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece a producción y no corresponde a la función de caja satélite.                    |
| `fogo.production.recipe_book.view` | Consultar recetario operativo   | `OPERATIONAL_ONLY`    | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece a producción y no corresponde a la función de caja satélite.                    |
| `fogo.production.recipes.view`     | Consultar recetas               | `BASE_ONLY`           | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.5 NEXO — 63 permisos

| Permiso                                      | Capacidad humana                         | Modalidad              | Decisión para cajero_satelite | Alcance aprobado                                                                                                                                                                                         | Condición                                                                                                                                                                                   |
| -------------------------------------------- | ---------------------------------------- | ---------------------- | ----------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `nexo.access`                                | Entrar a NEXO                            | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**         | CTX-CASHIER-APP — turno publicado y vigente, rol efectivo `cajero_satelite`, sede activa autorizada y área operativa válida de tipo `cashier`. No exige check-in para mostrar la entrada y los bloqueos. | Carril operativo. Permite entrar a NEXO y ver el estado del contexto. No concede por sí solo catálogo, remisiones, inventario ni otra acción.                                               |
| `nexo.catalog.products.view`                 | Consultar productos                      | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**         | CTX-CASHIER-REF — consulta operativa de productos vigentes aplicables a la sede activa. Excluye costos, márgenes, existencias, recetas, proveedores y campos técnicos no necesarios.                     | Turno vigente y rol `cajero_satelite` válido. La proyección se utiliza para identificar productos dentro del flujo de solicitud; no permite crear ni modificar el maestro.                  |
| `nexo.catalog.products.create`               | Crear productos                          | `BASE_ONLY`            | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.catalog.presentations.view`            | Consultar presentaciones                 | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**         | CTX-CASHIER-REF — consulta de presentaciones vigentes y solicitables para la sede y ruta aplicables.                                                                                                     | Turno vigente y rol válido. Solo lectura para seleccionar la presentación autorizada en una solicitud.                                                                                      |
| `nexo.catalog.request_policies.view`         | Consultar políticas de solicitud         | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**         | CTX-CASHIER-REF — consulta de políticas de solicitud aplicables al destino, producto, presentación y ruta de abastecimiento del contexto.                                                                | Turno vigente. No permite modificar políticas ni ignorar mínimos, frecuencias, ventanas o restricciones.                                                                                    |
| `nexo.catalog.categories.view`               | Consultar categorías                     | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**         | CTX-CASHIER-REF — consulta de categorías necesarias para buscar y organizar productos solicitables.                                                                                                      | Turno vigente. Solo lectura; no permite administrar categorías.                                                                                                                             |
| `nexo.catalog.units.view`                    | Consultar unidades                       | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**         | CTX-CASHIER-REF — consulta de unidades, empaques y equivalencias publicadas necesarias para interpretar presentaciones solicitables.                                                                     | Turno vigente. Solo lectura; no permite administrar unidades ni conversiones.                                                                                                               |
| `nexo.assets.items.view`                     | Consultar activos                        | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde caja o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.          |
| `nexo.assets.items.create`                   | Crear activos                            | `BASE_ONLY`            | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.assets.groups.view`                    | Consultar grupos de activos              | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde caja o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.          |
| `nexo.assets.counts.view`                    | Consultar conteos de activos             | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde caja o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.          |
| `nexo.inventory.adjustments.view`            | Consultar ajustes de inventario          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde caja o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.          |
| `nexo.inventory.adjustments.register`        | Registrar ajustes de inventario          | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | La capacidad exige autoridad base y contexto operativo simultáneos. Esta matriz no concede el componente base ni la capacidad completa.                                                     |
| `nexo.inventory.entries.view`                | Consultar entradas de inventario         | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde caja o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.          |
| `nexo.inventory.entries.register`            | Registrar entradas de inventario         | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde caja o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.          |
| `nexo.inventory.entries.override`            | Registrar entradas excepcionales         | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | La capacidad exige autoridad base y contexto operativo simultáneos. Esta matriz no concede el componente base ni la capacidad completa.                                                     |
| `nexo.inventory.locations.view`              | Consultar ubicaciones de inventario      | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde caja o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.          |
| `nexo.inventory.location_assignments.assign` | Asignar ubicaciones de inventario        | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde caja o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.          |
| `nexo.inventory.location_catalog.update`     | Actualizar el catálogo de una ubicación  | `BASE_ONLY`            | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.inventory.lpns.view`                   | Consultar LPN                            | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde caja o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.          |
| `nexo.inventory.movements.view`              | Consultar movimientos de inventario      | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde caja o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.          |
| `nexo.inventory.stock.view`                  | Consultar stock                          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | El stock exige área activa coincidente. El rol de caja no recibe visibilidad general de existencias de barra, cocina, bodega u otras áreas.                                                 |
| `nexo.inventory.production_batches.view`     | Consultar lotes vinculados al inventario | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde caja o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.          |
| `nexo.inventory.transfers.view`              | Consultar traslados de inventario        | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde caja o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.          |
| `nexo.inventory.transfers.create`            | Crear traslados de inventario            | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde caja o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.          |
| `nexo.inventory.withdrawals.view`            | Consultar retiros de inventario          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde caja o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.          |
| `nexo.inventory.withdrawals.register`        | Registrar retiros de inventario          | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde caja o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.          |
| `nexo.inventory.zones.view`                  | Consultar zonas de almacenamiento        | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde caja o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.          |
| `nexo.inventory.storage_positions.view`      | Consultar posiciones de almacenamiento   | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde caja o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.          |
| `nexo.inventory.warehouse_operations.view`   | Consultar operaciones de bodega          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde caja o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.          |
| `nexo.inventory.stock_validations.perform`   | Ejecutar validaciones de inventario      | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde caja o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.          |
| `nexo.inventory.stock_counts.view`           | Consultar conteos de inventario          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde caja o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.          |
| `nexo.inventory.stock_counts.perform`        | Ejecutar conteos de inventario           | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde caja o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.          |
| `nexo.inventory.initial_counts.view`         | Consultar conteos iniciales              | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde caja o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.          |
| `nexo.inventory.remissions.view`             | Consultar remisiones                     | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**         | CTX-CASHIER-REMISSION — remisiones donde la sede activa sea destino, el actor sea solicitante o exista otra relación operativa explícita. No concede visibilidad general sobre otras sedes.              | Turno y check-in activos. Recurso resoluble y relacionado con el actor o la sede destino. Mostrar únicamente campos autorizados para el lado solicitante.                                   |
| `nexo.inventory.remissions.update`           | Actualizar remisiones                    | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**         | CTX-CASHIER-REMISSION-OWN — únicamente solicitudes creadas por el actor, en estados editables y sobre campos permitidos del lado solicitante.                                                            | Turno y check-in activos. Control optimista de versión, reautenticación fuerte y auditoría antes/después. No permite preparar, despachar, recibir, cancelar ni modificar el lado de origen. |
| `nexo.inventory.remissions.request`          | Solicitar remisiones                     | `OPERATIONAL_ONLY`     | **ASIGNAR OPERATIVO**         | CTX-CASHIER-REMISSION-REQUEST — crear una solicitud para la sede activa y desde el área `cashier`, utilizando origen, ruta, productos, presentaciones y políticas válidas.                               | Turno y check-in activos. Creación idempotente; validar destino, ruta, políticas, cantidades y presentaciones. El actor queda registrado como solicitante.                                  |
| `nexo.inventory.remissions.prepare`          | Preparar remisiones                      | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde caja o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.          |
| `nexo.inventory.remissions.dispatch`         | Despachar remisiones                     | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde caja o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.          |
| `nexo.inventory.remissions.receive`          | Recibir remisiones                       | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | Recibir remisiones cambia cantidades y custodia en destino. Corresponde al rol de recepción autorizado, no automáticamente al cajero.                                                       |
| `nexo.inventory.remissions.cancel`           | Cancelar remisiones                      | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | La cancelación no se concede por defecto al cajero. Una necesidad de cancelar solicitudes propias deberá definirse como política explícita o excepción operativa auditada.                  |
| `nexo.logistics.operations_board.view`       | Consultar tablero logístico              | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde caja o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.          |
| `nexo.logistics.operations.view`             | Consultar operaciones logísticas         | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde caja o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.          |
| `nexo.logistics.driver_operations.view`      | Consultar operaciones de conductores     | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde caja o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.          |
| `nexo.logistics.fulfillment.view`            | Consultar cumplimiento logístico         | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde caja o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.          |
| `nexo.logistics.fulfillment_routes.view`     | Consultar rutas de cumplimiento          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde caja o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.          |
| `nexo.logistics.supply_routes.view`          | Consultar rutas de abastecimiento        | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**         | CTX-CASHIER-REF — consulta únicamente de rutas de abastecimiento vigentes relacionadas con la sede activa y utilizables para solicitudes.                                                                | Turno vigente. Solo lectura; no permite modificar rutas ni consultar configuración logística ajena al flujo de solicitud.                                                                   |
| `nexo.finance.internal_invoices.view`        | Consultar facturas internas              | `BASE_ONLY`            | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.finance.internal_invoices.generate`    | Generar facturas internas                | `BASE_ONLY`            | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.finance.internal_invoices.issue`       | Emitir facturas internas                 | `BASE_ONLY`            | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.finance.internal_invoices.cancel`      | Cancelar facturas internas               | `BASE_ONLY`            | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.finance.internal_invoice_amounts.view` | Consultar valores de facturas internas   | `BASE_ONLY`            | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.finance.internal_prices.view`          | Consultar precios internos               | `BASE_ONLY`            | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.finance.internal_variances.view`       | Consultar variaciones internas           | `BASE_ONLY`            | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.finance.internal_variances.approve`    | Aprobar variaciones internas             | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | La capacidad exige autoridad base y contexto operativo simultáneos. Esta matriz no concede el componente base ni la capacidad completa.                                                     |
| `nexo.finance.internal_variances.resolve`    | Resolver variaciones internas            | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | La capacidad exige autoridad base y contexto operativo simultáneos. Esta matriz no concede el componente base ni la capacidad completa.                                                     |
| `nexo.finance.cost_centers.view`             | Consultar centros de costo en NEXO       | `BASE_ONLY`            | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.analytics.internal_reports.view`       | Consultar reportes internos              | `BASE_ONLY`            | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.analytics.margin_reports.view`         | Consultar reportes de margen             | `BASE_ONLY`            | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.printing.templates.update`             | Editar plantillas de impresión           | `BASE_ONLY`            | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.printing.jobs.view`                    | Consultar trabajos de impresión          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde caja o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.          |
| `nexo.settings.sites.view`                   | Consultar configuración de sedes         | `BASE_ONLY`            | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.settings.remission_policies.view`      | Consultar políticas de remisiones        | `BASE_ONLY`            | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                   | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |

##### 7.6 NUMERA — 6 permisos

| Permiso                                   | Capacidad humana               | Modalidad   | Decisión para cajero_satelite | Alcance aprobado                                                       | Condición                                                                                              |
| ----------------------------------------- | ------------------------------ | ----------- | ----------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `numera.access`                           | Entrar a NUMERA                | `BASE_ONLY` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.finance.cost_centers.view`        | Consultar centros de costo     | `BASE_ONLY` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.finance.expenses.view`            | Consultar gastos               | `BASE_ONLY` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.analytics.break_even.view`        | Consultar punto de equilibrio  | `BASE_ONLY` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.analytics.profitability.view`     | Consultar rentabilidad         | `BASE_ONLY` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.analytics.financial_reports.view` | Consultar reportes financieros | `BASE_ONLY` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.7 ORIGO — 5 permisos

| Permiso                                  | Capacidad humana                  | Modalidad             | Decisión para cajero_satelite | Alcance aprobado                                                       | Condición                                                                                                   |
| ---------------------------------------- | --------------------------------- | --------------------- | ----------------------------- | ---------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| `origo.access`                           | Entrar a ORIGO                    | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece a compras, recepción o proveedores y no corresponde a la operación de caja satélite. |
| `origo.procurement.purchase_orders.view` | Consultar órdenes de compra       | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece a compras, recepción o proveedores y no corresponde a la operación de caja satélite. |
| `origo.procurement.receipts.view`        | Consultar recepciones de compra   | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece a compras, recepción o proveedores y no corresponde a la operación de caja satélite. |
| `origo.procurement.suppliers.view`       | Consultar proveedores             | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece a compras, recepción o proveedores y no corresponde a la operación de caja satélite. |
| `origo.catalog.product_reviews.view`     | Consultar revisiones de productos | `BASE_ONLY`           | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.      |

##### 7.8 VENTO PASS — 1 permisos

| Permiso       | Capacidad humana    | Modalidad   | Decisión para cajero_satelite | Alcance aprobado                                                       | Condición                                                                                              |
| ------------- | ------------------- | ----------- | ----------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `pass.access` | Entrar a Vento Pass | `BASE_ONLY` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.9 PULSO — 2 permisos

| Permiso                              | Capacidad humana                        | Modalidad              | Decisión para cajero_satelite | Alcance aprobado                                                                                                               | Condición                                                                                                                                                   |
| ------------------------------------ | --------------------------------------- | ---------------------- | ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `pulso.access`                       | Entrar a PULSO                          | `OPERATIONAL_ONLY`     | **ASIGNAR OPERATIVO**         | CTX-CASHIER-POS — turno publicado y vigente, rol `cajero_satelite`, sede autorizada y área operativa válida de tipo `cashier`. | Carril operativo. Permite entrar a PULSO y mostrar el requisito de marcación. No autoriza ventas, pagos, caja, anulaciones, puntos ni entregas por sí solo. |
| `pulso.delivery.deliveries.override` | Confirmar entregas de forma excepcional | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                         | Capacidad `BASE_AND_OPERATIONAL` de excepción. Requiere autoridad base explícita, turno, check-in, reautenticación fuerte, motivo y auditoría reforzada.    |

##### 7.10 VISO — 17 permisos

| Permiso                                       | Capacidad humana                          | Modalidad   | Decisión para cajero_satelite | Alcance aprobado                                                       | Condición                                                                                              |
| --------------------------------------------- | ----------------------------------------- | ----------- | ----------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `viso.access`                                 | Entrar a VISO                             | `BASE_ONLY` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.platform.app_updates.view`              | Consultar actualizaciones de aplicaciones | `BASE_ONLY` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.organization.businesses.view`           | Consultar empresas y unidades de negocio  | `BASE_ONLY` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.workforce.employees.view`               | Consultar trabajadores                    | `BASE_ONLY` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.workforce.staff_calendar.view`          | Consultar calendario del personal         | `BASE_ONLY` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.workforce.schedules.view`               | Consultar programación de turnos          | `BASE_ONLY` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.workforce.vacancies.view`               | Consultar vacantes                        | `BASE_ONLY` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.authorization.context_simulations.view` | Consultar simulaciones de autorización    | `BASE_ONLY` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.authorization.audit_logs.view`          | Consultar auditoría de autorización       | `BASE_ONLY` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.catalog.commercial_categories.view`     | Consultar categorías comerciales          | `BASE_ONLY` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.content.content_blocks.view`            | Consultar bloques de contenido            | `BASE_ONLY` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.content.menu.view`                      | Consultar menú                            | `BASE_ONLY` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.content.website_content.view`           | Consultar contenido del sitio web         | `BASE_ONLY` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.finance.accounting.view`                | Consultar información contable            | `BASE_ONLY` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.delivery.rates.view`                    | Consultar tarifas de entrega              | `BASE_ONLY` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.loyalty.products.view`                  | Consultar productos de fidelización       | `BASE_ONLY` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.loyalty.customers.view`                 | Consultar clientes de fidelización        | `BASE_ONLY` | **NO ASIGNAR**                | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

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
TURNO DE CAJA VÁLIDO
        ↓
ENTRAR A PULSO
        ↓
FUNCIONES POS ATÓMICAS PENDIENTES DE CATÁLOGO

TURNO + CHECK-IN
        ↓
ENTRAR A NEXO
        ↓
CONSULTAR REFERENCIAS DE SOLICITUD
        ↓
CONSULTAR / CREAR / EDITAR SOLICITUD PROPIA
```

La matriz no autoriza al cajero a preparar, despachar o recibir una remisión ni a operar inventario físico. Esas acciones pertenecen a otros roles y etapas de custodia.

#### 10. Capacidades expresamente no concedidas

- cualquier permiso exclusivo del carril base;
- gestión de personal, documentos, turnos, permisos o seguridad;
- producción, recetas, lotes u órdenes de FOGO;
- entradas, retiros, traslados, conteos, ajustes, ubicaciones, LPN o validaciones de inventario;
- preparación, despacho o recepción de remisiones;
- cancelación de remisiones por defecto;
- operaciones logísticas, de conductor, cumplimiento o bodega;
- compras, recepciones y proveedores de ORIGO;
- facturas internas, costos, márgenes, gastos, contabilidad o NUMERA;
- configuración de sedes, políticas, rutas, impresión o catálogos maestros;
- `pulso.delivery.deliveries.override` sin autoridad base separada;
- acceso a clientes, puntos o canjes de fidelización por inferencia;
- acceso a APP-REVIEW o a sedes no habilitadas;
- cualquier permiso futuro no evaluado expresamente.

#### 11. Brechas del catálogo identificadas

El catálogo vigente solo contiene `pulso.access` y una excepción de entrega. Por tanto, todavía no representa las operaciones ordinarias que hacen funcional una caja, entre ellas:

- consultar, crear y actualizar órdenes o cuentas;
- registrar productos, cantidades, modificadores y notas;
- abrir, consultar y cerrar sesión de caja;
- registrar pagos por medio y confirmar su resultado;
- imprimir o reimprimir comprobantes;
- cancelar ítems, órdenes o pagos con niveles de autoridad diferenciados;
- registrar devoluciones y reversos;
- gestionar descuentos, cortesías y autorizaciones;
- acumular y redimir puntos de fidelización desde la operación comercial;
- consultar entregas asignadas y confirmar entregas ordinarias;
- registrar movimientos de efectivo, arqueos y diferencias;
- consultar historial operativo de la caja dentro de la sede y turno.

Estas brechas no amplían la matriz. Hasta que existan permisos atómicos canónicos, `pulso.access` no podrá interpretarse como autorización implícita para esas acciones. Las nuevas capacidades deberán clasificarse, asignarse y probarse expresamente antes de su implementación.

#### 12. Dispositivo compartido de caja

La plantilla o dispositivo de caja puede habilitar PULSO, NEXO y SHELL como superficies disponibles, pero no concede la matriz del rol. Antes de ejecutar una acción deberá existir:

```text
DISPOSITIVO TÉCNICO ACTIVO
+ ACTOR IDENTIFICADO
+ PIN O AUTENTICACIÓN EXIGIDA
+ TURNO cajero_satelite VÁLIDO
+ ÁREA DEL DISPOSITIVO COINCIDENTE
+ CHECK-IN CUANDO CORRESPONDA
+ PERMISO DE ESTA MATRIZ
= ACCIÓN ATRIBUIBLE AL TRABAJADOR
```

La política `role_in_area` es compatible con este rol. No se aceptará una sesión anónima, una acción atribuida al usuario técnico ni una navegación basada únicamente en `navigation_role`.

#### 13. Relación con el estado legacy

La auditoría encontró cinco asignaciones operativas legacy para `cajero_satelite`: NEXO acceso, consulta y solicitud de remisiones, PULSO acceso y la antigua superficie POS. Esta propuesta no conserva `pulso.pos.main`, porque ya no es una capacidad canónica activa, y amplía únicamente las referencias necesarias para que el flujo de solicitud pueda operar con claves vigentes.

```text
5 ASIGNACIONES LEGACY
        ↓
VALIDACIÓN CONTRA 112 PERMISOS CANÓNICOS
        ↓
11 CONCESIONES OPERATIVAS EXPLÍCITAS
├── 6 referencias de catálogo y políticas
├── 3 capacidades sobre solicitudes/remisiones
├── 1 referencia de rutas de abastecimiento
└── 1 entrada a PULSO
```

El aumento no concede inventario general ni autoridad logística. Sustituye dependencias implícitas del flujo de solicitud por referencias explícitas y mantiene denegadas las acciones físicas y sensibles.

#### 14. Validaciones de integridad

- ✅ Los 112 permisos canónicos fueron evaluados exactamente una vez.
- ✅ Las cantidades por aplicación suman 112.
- ✅ Solo se asignaron permisos que admiten carril operativo.
- ✅ No se asignó ningún permiso `BASE_ONLY`.
- ✅ No se asignó ningún permiso `BASE_AND_OPERATIONAL`.
- ✅ Cada permiso concedido tiene contexto y recurso explícitos.
- ✅ El rol exige turno, sede y área de caja válidos.
- ✅ Las mutaciones concedidas exigen check-in cuando corresponde.
- ✅ `pulso.access` no se utiliza como wildcard de PULSO.
- ✅ No se concedieron operaciones físicas de inventario, logística o producción.
- ✅ No se concedieron capacidades financieras, laborales o de seguridad.
- ✅ No existen wildcards ni permisos implícitos.
- ✅ APP-REVIEW y sedes no habilitadas permanecen excluidas.
- ✅ Los permisos nuevos se deniegan por defecto.

#### 15. Impacto sobre tareas posteriores

| Tarea                         | Impacto                                                                                                                       |
| ----------------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| AUTH-RBAC-009 a AUTH-RBAC-013 | Deberán definir las demás funciones satélite sin heredar automáticamente esta matriz.                                         |
| AUTH-RBAC-021                 | Podrá añadir excepciones operativas individuales, como una capacidad excepcional de entrega, sin sustituir turno, área o rol. |
| AUTH-RBAC-023                 | Deberá limitar los dispositivos de caja a actores, aplicaciones y áreas compatibles.                                          |
| AUTH-RBAC-025                 | Deberá proyectar estas 11 concesiones en el dataset canónico de matriz operativa.                                             |
| AUTH-RBAC-027                 | Deberá confirmar que ninguna concesión produzca acceso operativo global accidental.                                           |
| BLOQUE E                      | Deberá distinguir entrada, permiso, recurso y razones de bloqueo en la decisión final.                                        |
| PULSO y roadmap funcional     | Deberán crear y clasificar los permisos atómicos ordinarios de venta, pago, caja, comprobantes y fidelización.                |
| BLOQUE R                      | Implementará la transición física mediante migraciones versionadas en `vento-shell`, pruebas, reconciliación y rollback.      |

#### 16. Criterios de aprobación

1. `cajero_satelite` queda definido como rol operativo temporal de caja y POS.
2. Las 11 concesiones son explícitas y compatibles con el carril operativo.
3. El rol requiere turno, sede y área de caja válidos.
4. Las acciones vivas o mutadoras concedidas exigen check-in cuando corresponde.
5. El rol puede consultar referencias y solicitar abastecimiento sin acceder a inventario general.
6. La actualización se limita a solicitudes propias y editables.
7. No puede preparar, despachar, recibir o cancelar remisiones por defecto.
8. `pulso.access` no autoriza ventas, pagos ni caja por sí solo.
9. `delivery.override` permanece fuera de la matriz ordinaria.
10. Las 101 capacidades restantes permanecen denegadas por defecto.
11. No se implementa código, Supabase ni migraciones en esta tarea.
12. `AUTH-RBAC-009` permanece sin iniciar hasta solicitud expresa.

#### 17. Estado final de la propuesta

| Tarea         | Estado      |
| ------------- | ----------- |
| AUTH-RBAC-007 | APROBADA    |
| AUTH-RBAC-008 | APROBADA    |
| AUTH-RBAC-009 | NO INICIADA |

No se implementan código, migraciones, cambios en Supabase, RLS, RPC, datasets, repositorios, guards, dispositivos ni pantallas. La matriz solo será canónica cuando el usuario la apruebe expresamente.


### ✅ AUTH-RBAC-009 — Crear matriz de barista_satelite

#### 1. Identificación de la tarea

| Campo                     | Valor                                                              |
| ------------------------- | ------------------------------------------------------------------ |
| Bloque                    | BLOQUE D — Matrices canónicas de roles, excepciones y dispositivos |
| Tarea                     | AUTH-RBAC-009 — Crear matriz de barista_satelite                   |
| Estado                    | **APROBADA**                                                       |
| Naturaleza                | Definición documental de matriz operativa de barra satélite        |
| Implementación física     | No incluida                                                        |
| Catálogo evaluado         | 112 permisos canónicos vigentes                                    |
| Tarea anterior vigente    | AUTH-RBAC-008 — APROBADA                                           |
| Tarea posterior reservada | AUTH-RBAC-010 — Crear matriz de cocinero_satelite                  |

Esta tarea no modifica Supabase, migraciones, tablas, RLS, RPC, aplicaciones, repositorios ni datasets físicos. La aplicación posterior deberá realizarse mediante AUTH-RBAC-025 y las migraciones versionadas del BLOQUE R en `vento-shell`.

#### 2. Objetivo

Definir, permiso por permiso, las capacidades que puede ejercer el rol operativo `barista_satelite` durante un turno válido en un área de barra, sin recuperar permisos permanentes del rol base legacy `barista` ni convertir el acceso a PULSO en autorización implícita para consultar comandas, preparar bebidas, modificar estados o ejecutar operaciones comerciales no representadas todavía por permisos atómicos.

#### 3. Decisión principal

`barista_satelite` representa la función temporal de preparación de bebidas y operación de barra en una sede satélite. Su autoridad existe únicamente dentro del contexto operativo vigente y sobre recursos compatibles con la sede, el área, la relación del actor y la etapa del proceso.

```text
ACTOR IDENTIFICADO
+ TURNO PUBLICADO Y VIGENTE
+ ROL barista_satelite
+ SEDE AUTORIZADA
+ ÁREA ACTIVA DE TIPO bar
+ CHECK-IN CUANDO EL PERMISO LO EXIJA
+ PERMISO OPERATIVO EXPLÍCITO
+ RECURSO COMPATIBLE
= AUTORIZACIÓN OPERATIVA DE BARRA
```

No se admite:

```text
employees.role = barista → acceso permanente
pulso.access → autorización para consultar o preparar cualquier comanda
dispositivo de barra → rol automático
PIN del dispositivo → sustituto del permiso
sede seleccionada → autorización
barista_satelite → acceso a inventario general
barista_satelite → acceso automático a recetas de FOGO
barista_satelite → delivery.override automático
```

#### 4. Resultado cuantitativo de la matriz

| Resultado                                    | Cantidad | Efecto                                                                                                                                  |
| -------------------------------------------- | -------: | --------------------------------------------------------------------------------------------------------------------------------------- |
| Capacidades operativas asignadas             |       11 | Se conceden por el carril operativo dentro del contexto de barra y de los recursos expresamente definidos.                              |
| Capacidades `BASE_AND_OPERATIONAL` asignadas |        0 | El rol operativo no recibe autoridad base adicional.                                                                                    |
| Capacidades no asignadas                     |      101 | Permanecen denegadas por defecto por pertenecer al carril base, a otros procesos operativos o a acciones sensibles no propias de barra. |
| Total evaluado                               |      112 | Sin omisiones ni duplicados.                                                                                                            |

La matriz contiene **11 concesiones operativas a nivel de clave** y **101 ausencias de concesión**. La ausencia de concesión produce denegación por defecto; no se crean filas `deny` redundantes.

#### 5. Perfiles de alcance utilizados

| Perfil                      | Significado                                                                                                                                         |
| --------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| `CTX-BAR-APP`               | Entrada operativa a una aplicación con turno y rol válidos. El permiso puede mostrar requisitos faltantes, pero no concede capacidades internas.    |
| `CTX-BAR-REF`               | Consulta mínima de referencias necesarias para operar barra o solicitar abastecimiento, limitada a la sede y al flujo vigentes.                     |
| `CTX-BAR-REMISSION`         | Consulta de remisiones por relación legítima con la sede destino o el actor solicitante.                                                            |
| `CTX-BAR-REMISSION-OWN`     | Modificación exclusiva de solicitudes propias y todavía editables.                                                                                  |
| `CTX-BAR-REMISSION-REQUEST` | Creación de solicitudes para la sede y área activas con ruta y políticas válidas.                                                                   |
| `CTX-BAR-PULSO`             | Entrada a la superficie de operación comercial de barra durante turno válido. No sustituye permisos de comandas, preparación, venta, pago o cierre. |

#### 6. Reglas obligatorias de la matriz

1. Cada concesión utiliza una clave canónica exacta; no existen wildcards, herencias implícitas ni autorización por el nombre del rol.
2. El rol operativo efectivo procede exclusivamente del turno publicado y vigente. Los perfiles y dispositivos solo sugieren o restringen; nunca asignan el rol.
3. `barista_satelite` requiere un área operativa concreta compatible con el tipo `bar` y habilitada para la sede del turno.
4. Las concesiones con prerrequisito `T` pueden consultarse antes del check-in, pero continúan exigiendo turno y rol válidos.
5. Las concesiones con prerrequisito `T+C` requieren turno y check-in activos, sede y área coincidentes y recurso resoluble.
6. La sede activa se deriva del contexto válido; la sede seleccionada, primaria o enviada por el cliente no concede autoridad.
7. El permiso `pulso.access` solo permite entrar a PULSO y cargar la superficie compatible. No autoriza consultar comandas, cambiar estados, confirmar preparaciones, registrar faltantes, operar ventas, cobros, caja, anulaciones, devoluciones, puntos ni cierres.
8. La consulta de catálogo desde NEXO se limita a los atributos necesarios para identificar productos y presentaciones solicitables para la barra.
9. La consulta de remisiones se limita a la relación del actor o de la sede destino; no concede visibilidad de toda la red.
10. La actualización de remisiones se limita a solicitudes propias, estados editables y campos permitidos, con reautenticación y auditoría.
11. La solicitud de remisiones debe ser idempotente y validar políticas, ruta, destino, cantidades y presentaciones.
12. `fogo.production.recipe_book.view` no se asigna por inferencia. La necesidad de consultar recetas o fichas de bebidas deberá resolverse mediante una capacidad atómica y un contrato de recurso aprobados.
13. `pulso.delivery.deliveries.override` no se asigna al rol. Solo podrá obtenerse mediante autoridad base explícita y contexto operativo simultáneo.
14. APP-REVIEW, entornos demo, recursos aislados y sedes no habilitadas permanecen excluidos.
15. Las denegaciones individuales, estructurales, de recurso, dispositivo o aislamiento prevalecen sobre esta matriz.
16. Todo permiso nuevo se deniega hasta que una versión canónica posterior lo evalúe expresamente para `barista_satelite`.

#### 7. Matriz canónica completa
##### 7.1 SHELL — 1 permisos

| Permiso        | Capacidad humana  | Modalidad   | Decisión para barista_satelite | Alcance aprobado                                                       | Condición                                                                                              |
| -------------- | ----------------- | ----------- | ------------------------------ | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `shell.access` | Entrar a Vento OS | `BASE_ONLY` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.2 ANIMA — 10 permisos

| Permiso                                     | Capacidad humana                     | Modalidad   | Decisión para barista_satelite | Alcance aprobado                                                       | Condición                                                                                              |
| ------------------------------------------- | ------------------------------------ | ----------- | ------------------------------ | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `anima.access`                              | Entrar a ANIMA                       | `BASE_ONLY` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.employee_documents.view`   | Consultar documentos de trabajadores | `BASE_ONLY` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.employee_documents.upload` | Cargar documentos de trabajadores    | `BASE_ONLY` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.employee_documents.delete` | Eliminar documentos de trabajadores  | `BASE_ONLY` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.employee_photos.upload`    | Cargar fotografías de trabajadores   | `BASE_ONLY` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.team_members.view`         | Consultar integrantes del equipo     | `BASE_ONLY` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.workforce.staff_invitations.create`  | Invitar trabajadores                 | `BASE_ONLY` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.attendance.shifts.create`            | Crear turnos                         | `BASE_ONLY` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.attendance.shifts.update`            | Actualizar turnos                    | `BASE_ONLY` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `anima.attendance.shifts.cancel`            | Cancelar turnos                      | `BASE_ONLY` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.3 AURA — 1 permisos

| Permiso       | Capacidad humana | Modalidad   | Decisión para barista_satelite | Alcance aprobado                                                       | Condición                                                                                              |
| ------------- | ---------------- | ----------- | ------------------------------ | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `aura.access` | Entrar a AURA    | `BASE_ONLY` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.4 FOGO — 6 permisos

| Permiso                            | Capacidad humana                | Modalidad             | Decisión para barista_satelite | Alcance aprobado                                                       | Condición                                                                                                                                                                                                 |
| ---------------------------------- | ------------------------------- | --------------------- | ------------------------------ | ---------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `fogo.access`                      | Entrar a FOGO                   | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece al proceso productivo de FOGO y no se asigna automáticamente a la operación de barra satélite.                                                                                     |
| `fogo.production.batches.view`     | Consultar lotes de producción   | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece al proceso productivo de FOGO y no se asigna automáticamente a la operación de barra satélite.                                                                                     |
| `fogo.production.batches.create`   | Crear lotes de producción       | `OPERATIONAL_ONLY`    | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece al proceso productivo de FOGO y no se asigna automáticamente a la operación de barra satélite.                                                                                     |
| `fogo.production.orders.view`      | Consultar órdenes de producción | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece al proceso productivo de FOGO y no se asigna automáticamente a la operación de barra satélite.                                                                                     |
| `fogo.production.recipe_book.view` | Consultar recetario operativo   | `OPERATIONAL_ONLY`    | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | El recetario de FOGO no se concede por inferencia. La consulta de fórmulas o fichas de bebidas deberá contar con un permiso atómico y contrato de aplicabilidad propios antes de incorporarse a este rol. |
| `fogo.production.recipes.view`     | Consultar recetas               | `BASE_ONLY`           | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                    |

##### 7.5 NEXO — 63 permisos

| Permiso                                      | Capacidad humana                         | Modalidad              | Decisión para barista_satelite | Alcance aprobado                                                                                                                                                                                  | Condición                                                                                                                                                                                   |
| -------------------------------------------- | ---------------------------------------- | ---------------------- | ------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `nexo.access`                                | Entrar a NEXO                            | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**          | CTX-BAR-APP — turno publicado y vigente, rol efectivo `barista_satelite`, sede activa autorizada y área operativa válida de tipo `bar`. No exige check-in para mostrar la entrada y los bloqueos. | Carril operativo. Permite entrar a NEXO y ver el estado del contexto. No concede por sí solo catálogo, remisiones, inventario ni otra acción.                                               |
| `nexo.catalog.products.view`                 | Consultar productos                      | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**          | CTX-BAR-REF — consulta operativa de productos vigentes aplicables a la sede activa. Excluye costos, márgenes, existencias, recetas, proveedores y campos técnicos no necesarios.                  | Turno vigente y rol `barista_satelite` válido. La proyección se utiliza para identificar productos dentro del flujo de solicitud; no permite crear ni modificar el maestro.                 |
| `nexo.catalog.products.create`               | Crear productos                          | `BASE_ONLY`            | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.catalog.presentations.view`            | Consultar presentaciones                 | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**          | CTX-BAR-REF — consulta de presentaciones vigentes y solicitables para la sede y ruta aplicables.                                                                                                  | Turno vigente y rol válido. Solo lectura para seleccionar la presentación autorizada en una solicitud.                                                                                      |
| `nexo.catalog.request_policies.view`         | Consultar políticas de solicitud         | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**          | CTX-BAR-REF — consulta de políticas de solicitud aplicables al destino, producto, presentación y ruta de abastecimiento del contexto.                                                             | Turno vigente. No permite modificar políticas ni ignorar mínimos, frecuencias, ventanas o restricciones.                                                                                    |
| `nexo.catalog.categories.view`               | Consultar categorías                     | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**          | CTX-BAR-REF — consulta de categorías necesarias para buscar y organizar productos solicitables.                                                                                                   | Turno vigente. Solo lectura; no permite administrar categorías.                                                                                                                             |
| `nexo.catalog.units.view`                    | Consultar unidades                       | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**          | CTX-BAR-REF — consulta de unidades, empaques y equivalencias publicadas necesarias para interpretar presentaciones solicitables.                                                                  | Turno vigente. Solo lectura; no permite administrar unidades ni conversiones.                                                                                                               |
| `nexo.assets.items.view`                     | Consultar activos                        | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde barra o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.         |
| `nexo.assets.items.create`                   | Crear activos                            | `BASE_ONLY`            | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.assets.groups.view`                    | Consultar grupos de activos              | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde barra o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.         |
| `nexo.assets.counts.view`                    | Consultar conteos de activos             | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde barra o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.         |
| `nexo.inventory.adjustments.view`            | Consultar ajustes de inventario          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde barra o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.         |
| `nexo.inventory.adjustments.register`        | Registrar ajustes de inventario          | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | La capacidad exige autoridad base y contexto operativo simultáneos. Esta matriz no concede el componente base ni la capacidad completa.                                                     |
| `nexo.inventory.entries.view`                | Consultar entradas de inventario         | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde barra o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.         |
| `nexo.inventory.entries.register`            | Registrar entradas de inventario         | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde barra o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.         |
| `nexo.inventory.entries.override`            | Registrar entradas excepcionales         | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | La capacidad exige autoridad base y contexto operativo simultáneos. Esta matriz no concede el componente base ni la capacidad completa.                                                     |
| `nexo.inventory.locations.view`              | Consultar ubicaciones de inventario      | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde barra o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.         |
| `nexo.inventory.location_assignments.assign` | Asignar ubicaciones de inventario        | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde barra o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.         |
| `nexo.inventory.location_catalog.update`     | Actualizar el catálogo de una ubicación  | `BASE_ONLY`            | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.inventory.lpns.view`                   | Consultar LPN                            | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde barra o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.         |
| `nexo.inventory.movements.view`              | Consultar movimientos de inventario      | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde barra o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.         |
| `nexo.inventory.stock.view`                  | Consultar stock                          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | El stock exige área activa coincidente. El rol de barra no recibe visibilidad general de existencias de cocina, bodega, otras barras ni otras áreas.                                        |
| `nexo.inventory.production_batches.view`     | Consultar lotes vinculados al inventario | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde barra o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.         |
| `nexo.inventory.transfers.view`              | Consultar traslados de inventario        | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde barra o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.         |
| `nexo.inventory.transfers.create`            | Crear traslados de inventario            | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde barra o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.         |
| `nexo.inventory.withdrawals.view`            | Consultar retiros de inventario          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde barra o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.         |
| `nexo.inventory.withdrawals.register`        | Registrar retiros de inventario          | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde barra o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.         |
| `nexo.inventory.zones.view`                  | Consultar zonas de almacenamiento        | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde barra o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.         |
| `nexo.inventory.storage_positions.view`      | Consultar posiciones de almacenamiento   | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde barra o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.         |
| `nexo.inventory.warehouse_operations.view`   | Consultar operaciones de bodega          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde barra o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.         |
| `nexo.inventory.stock_validations.perform`   | Ejecutar validaciones de inventario      | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde barra o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.         |
| `nexo.inventory.stock_counts.view`           | Consultar conteos de inventario          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde barra o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.         |
| `nexo.inventory.stock_counts.perform`        | Ejecutar conteos de inventario           | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde barra o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.         |
| `nexo.inventory.initial_counts.view`         | Consultar conteos iniciales              | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde barra o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.         |
| `nexo.inventory.remissions.view`             | Consultar remisiones                     | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**          | CTX-BAR-REMISSION — remisiones donde la sede activa sea destino, el actor sea solicitante o exista otra relación operativa explícita. No concede visibilidad general sobre otras sedes.           | Turno y check-in activos. Recurso resoluble y relacionado con el actor o la sede destino. Mostrar únicamente campos autorizados para el lado solicitante.                                   |
| `nexo.inventory.remissions.update`           | Actualizar remisiones                    | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**          | CTX-BAR-REMISSION-OWN — únicamente solicitudes creadas por el actor, en estados editables y sobre campos permitidos del lado solicitante.                                                         | Turno y check-in activos. Control optimista de versión, reautenticación fuerte y auditoría antes/después. No permite preparar, despachar, recibir, cancelar ni modificar el lado de origen. |
| `nexo.inventory.remissions.request`          | Solicitar remisiones                     | `OPERATIONAL_ONLY`     | **ASIGNAR OPERATIVO**          | CTX-BAR-REMISSION-REQUEST — crear una solicitud para la sede activa y desde el área `bar`, utilizando origen, ruta, productos, presentaciones y políticas válidas.                                | Turno y check-in activos. Creación idempotente; validar destino, ruta, políticas, cantidades y presentaciones. El actor queda registrado como solicitante.                                  |
| `nexo.inventory.remissions.prepare`          | Preparar remisiones                      | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde barra o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.         |
| `nexo.inventory.remissions.dispatch`         | Despachar remisiones                     | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde barra o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.         |
| `nexo.inventory.remissions.receive`          | Recibir remisiones                       | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | Recibir remisiones cambia cantidades y custodia en destino. Corresponde al rol de recepción autorizado, no automáticamente al barista.                                                      |
| `nexo.inventory.remissions.cancel`           | Cancelar remisiones                      | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | La cancelación no se concede por defecto al barista. Una necesidad de cancelar solicitudes propias deberá definirse como política explícita o excepción operativa auditada.                 |
| `nexo.logistics.operations_board.view`       | Consultar tablero logístico              | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde barra o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.         |
| `nexo.logistics.operations.view`             | Consultar operaciones logísticas         | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde barra o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.         |
| `nexo.logistics.driver_operations.view`      | Consultar operaciones de conductores     | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde barra o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.         |
| `nexo.logistics.fulfillment.view`            | Consultar cumplimiento logístico         | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde barra o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.         |
| `nexo.logistics.fulfillment_routes.view`     | Consultar rutas de cumplimiento          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde barra o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.         |
| `nexo.logistics.supply_routes.view`          | Consultar rutas de abastecimiento        | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**          | CTX-BAR-REF — consulta únicamente de rutas de abastecimiento vigentes relacionadas con la sede activa y utilizables para solicitudes.                                                             | Turno vigente. Solo lectura; no permite modificar rutas ni consultar configuración logística ajena al flujo de solicitud.                                                                   |
| `nexo.finance.internal_invoices.view`        | Consultar facturas internas              | `BASE_ONLY`            | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.finance.internal_invoices.generate`    | Generar facturas internas                | `BASE_ONLY`            | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.finance.internal_invoices.issue`       | Emitir facturas internas                 | `BASE_ONLY`            | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.finance.internal_invoices.cancel`      | Cancelar facturas internas               | `BASE_ONLY`            | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.finance.internal_invoice_amounts.view` | Consultar valores de facturas internas   | `BASE_ONLY`            | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.finance.internal_prices.view`          | Consultar precios internos               | `BASE_ONLY`            | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.finance.internal_variances.view`       | Consultar variaciones internas           | `BASE_ONLY`            | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.finance.internal_variances.approve`    | Aprobar variaciones internas             | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | La capacidad exige autoridad base y contexto operativo simultáneos. Esta matriz no concede el componente base ni la capacidad completa.                                                     |
| `nexo.finance.internal_variances.resolve`    | Resolver variaciones internas            | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | La capacidad exige autoridad base y contexto operativo simultáneos. Esta matriz no concede el componente base ni la capacidad completa.                                                     |
| `nexo.finance.cost_centers.view`             | Consultar centros de costo en NEXO       | `BASE_ONLY`            | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.analytics.internal_reports.view`       | Consultar reportes internos              | `BASE_ONLY`            | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.analytics.margin_reports.view`         | Consultar reportes de margen             | `BASE_ONLY`            | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.printing.templates.update`             | Editar plantillas de impresión           | `BASE_ONLY`            | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.printing.jobs.view`                    | Consultar trabajos de impresión          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde barra o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.         |
| `nexo.settings.sites.view`                   | Consultar configuración de sedes         | `BASE_ONLY`            | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.settings.remission_policies.view`      | Consultar políticas de remisiones        | `BASE_ONLY`            | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                            | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |

##### 7.6 NUMERA — 6 permisos

| Permiso                                   | Capacidad humana               | Modalidad   | Decisión para barista_satelite | Alcance aprobado                                                       | Condición                                                                                              |
| ----------------------------------------- | ------------------------------ | ----------- | ------------------------------ | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `numera.access`                           | Entrar a NUMERA                | `BASE_ONLY` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.finance.cost_centers.view`        | Consultar centros de costo     | `BASE_ONLY` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.finance.expenses.view`            | Consultar gastos               | `BASE_ONLY` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.analytics.break_even.view`        | Consultar punto de equilibrio  | `BASE_ONLY` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.analytics.profitability.view`     | Consultar rentabilidad         | `BASE_ONLY` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.analytics.financial_reports.view` | Consultar reportes financieros | `BASE_ONLY` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.7 ORIGO — 5 permisos

| Permiso                                  | Capacidad humana                  | Modalidad             | Decisión para barista_satelite | Alcance aprobado                                                       | Condición                                                                                                    |
| ---------------------------------------- | --------------------------------- | --------------------- | ------------------------------ | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| `origo.access`                           | Entrar a ORIGO                    | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece a compras, recepción o proveedores y no corresponde a la operación de barra satélite. |
| `origo.procurement.purchase_orders.view` | Consultar órdenes de compra       | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece a compras, recepción o proveedores y no corresponde a la operación de barra satélite. |
| `origo.procurement.receipts.view`        | Consultar recepciones de compra   | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece a compras, recepción o proveedores y no corresponde a la operación de barra satélite. |
| `origo.procurement.suppliers.view`       | Consultar proveedores             | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece a compras, recepción o proveedores y no corresponde a la operación de barra satélite. |
| `origo.catalog.product_reviews.view`     | Consultar revisiones de productos | `BASE_ONLY`           | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.       |

##### 7.8 VENTO PASS — 1 permisos

| Permiso       | Capacidad humana    | Modalidad   | Decisión para barista_satelite | Alcance aprobado                                                       | Condición                                                                                              |
| ------------- | ------------------- | ----------- | ------------------------------ | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `pass.access` | Entrar a Vento Pass | `BASE_ONLY` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.9 PULSO — 2 permisos

| Permiso                              | Capacidad humana                        | Modalidad              | Decisión para barista_satelite | Alcance aprobado                                                                                                          | Condición                                                                                                                                                                                                                                    |
| ------------------------------------ | --------------------------------------- | ---------------------- | ------------------------------ | ------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `pulso.access`                       | Entrar a PULSO                          | `OPERATIONAL_ONLY`     | **ASIGNAR OPERATIVO**          | CTX-BAR-PULSO — turno publicado y vigente, rol `barista_satelite`, sede autorizada y área operativa válida de tipo `bar`. | Carril operativo. Permite entrar a PULSO y mostrar el contexto de barra. No autoriza por sí solo consultar comandas, cambiar estados de preparación, registrar faltantes, rehacer productos, operar ventas, pagos, caja, puntos ni entregas. |
| `pulso.delivery.deliveries.override` | Confirmar entregas de forma excepcional | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                    | Capacidad `BASE_AND_OPERATIONAL` de excepción. Requiere autoridad base explícita, turno, check-in, reautenticación fuerte, motivo y auditoría reforzada.                                                                                     |

##### 7.10 VISO — 17 permisos

| Permiso                                       | Capacidad humana                          | Modalidad   | Decisión para barista_satelite | Alcance aprobado                                                       | Condición                                                                                              |
| --------------------------------------------- | ----------------------------------------- | ----------- | ------------------------------ | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `viso.access`                                 | Entrar a VISO                             | `BASE_ONLY` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.platform.app_updates.view`              | Consultar actualizaciones de aplicaciones | `BASE_ONLY` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.organization.businesses.view`           | Consultar empresas y unidades de negocio  | `BASE_ONLY` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.workforce.employees.view`               | Consultar trabajadores                    | `BASE_ONLY` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.workforce.staff_calendar.view`          | Consultar calendario del personal         | `BASE_ONLY` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.workforce.schedules.view`               | Consultar programación de turnos          | `BASE_ONLY` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.workforce.vacancies.view`               | Consultar vacantes                        | `BASE_ONLY` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.authorization.context_simulations.view` | Consultar simulaciones de autorización    | `BASE_ONLY` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.authorization.audit_logs.view`          | Consultar auditoría de autorización       | `BASE_ONLY` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.catalog.commercial_categories.view`     | Consultar categorías comerciales          | `BASE_ONLY` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.content.content_blocks.view`            | Consultar bloques de contenido            | `BASE_ONLY` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.content.menu.view`                      | Consultar menú                            | `BASE_ONLY` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.content.website_content.view`           | Consultar contenido del sitio web         | `BASE_ONLY` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.finance.accounting.view`                | Consultar información contable            | `BASE_ONLY` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.delivery.rates.view`                    | Consultar tarifas de entrega              | `BASE_ONLY` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.loyalty.products.view`                  | Consultar productos de fidelización       | `BASE_ONLY` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `viso.loyalty.customers.view`                 | Consultar clientes de fidelización        | `BASE_ONLY` | **NO ASIGNAR**                 | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

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
TURNO DE BARRA VÁLIDO
        ↓
ENTRAR A PULSO
        ↓
FUNCIONES ATÓMICAS DE COMANDAS Y PREPARACIÓN
PENDIENTES DE CATÁLOGO

TURNO + CHECK-IN
        ↓
ENTRAR A NEXO
        ↓
CONSULTAR REFERENCIAS DE SOLICITUD
        ↓
CONSULTAR / CREAR / EDITAR SOLICITUD PROPIA
```

La matriz no autoriza al barista a preparar, despachar o recibir una remisión ni a operar inventario físico. Tampoco autoriza todavía la lectura o mutación de comandas de barra: esas capacidades no existen en el catálogo canónico vigente y no pueden deducirse de `pulso.access`.

#### 10. Capacidades expresamente no concedidas

- cualquier permiso exclusivo del carril base;
- gestión de personal, documentos, turnos, permisos o seguridad;
- lotes, órdenes, recetas maestras o recetario de FOGO por inferencia;
- entradas, retiros, traslados, conteos, ajustes, ubicaciones, LPN o validaciones de inventario;
- preparación, despacho o recepción de remisiones;
- cancelación de remisiones por defecto;
- operaciones logísticas, de conductor, cumplimiento o bodega;
- compras, recepciones y proveedores de ORIGO;
- facturas internas, costos, márgenes, gastos, contabilidad o NUMERA;
- configuración de sedes, políticas, rutas, impresión o catálogos maestros;
- ventas, pagos, caja, anulaciones, devoluciones o descuentos por inferencia desde PULSO;
- `pulso.delivery.deliveries.override` sin autoridad base separada;
- acceso a clientes, puntos o canjes de fidelización por inferencia;
- acceso a APP-REVIEW o a sedes no habilitadas;
- cualquier permiso futuro no evaluado expresamente.

#### 11. Brechas del catálogo identificadas

El catálogo vigente solo contiene `pulso.access` y una excepción de entrega. Por tanto, todavía no representa las operaciones ordinarias de una barra, entre ellas:

- consultar la cola de comandas asignada a la barra;
- consultar detalle, modificadores, notas, alergias y prioridad de cada ítem;
- aceptar o iniciar una preparación;
- cambiar estados como pendiente, en preparación, listo, entregado o rechazado;
- confirmar cantidades y responsable de preparación;
- registrar un producto temporalmente agotado o no disponible;
- solicitar sustitución o aclaración de una comanda;
- registrar rehacer, merma, derrame, error o desperdicio;
- consultar fichas técnicas, recetas publicadas y porciones aplicables a bebidas;
- separar preparación de bebidas de acciones comerciales de venta y cobro;
- imprimir o reimprimir tickets de producción cuando corresponda;
- consultar historial operativo de la barra dentro de la sede y el turno;
- gestionar tiempos, alertas y priorización de preparación;
- atribuir cada transición al actor real, incluso desde dispositivo compartido.

Estas brechas no amplían la matriz. Hasta que existan permisos atómicos canónicos, `pulso.access` no podrá interpretarse como autorización implícita para consultar, preparar o modificar comandas. También deberá definirse expresamente si el recetario de bebidas pertenece a PULSO, FOGO o a una capacidad transversal con aplicación propietaria única.

#### 12. Dispositivo compartido de barra

La plantilla `bar_satellite` puede habilitar PULSO, NEXO y SHELL como superficies disponibles, pero no concede la matriz del rol. Antes de ejecutar una acción deberá existir:

```text
DISPOSITIVO TÉCNICO ACTIVO
+ ACTOR IDENTIFICADO
+ PIN O AUTENTICACIÓN EXIGIDA
+ TURNO barista_satelite VÁLIDO
+ ÁREA DEL DISPOSITIVO COINCIDENTE
+ CHECK-IN CUANDO CORRESPONDA
+ PERMISO DE ESTA MATRIZ
= ACCIÓN ATRIBUIBLE AL TRABAJADOR
```

La política `same_area_active_worker` puede utilizarse como filtro territorial inicial, pero no sustituye la validación del rol `barista_satelite` ni del permiso exacto. La configuración legacy `navigation_role = barista` deberá corregirse posteriormente para no mezclar el rol base heredado con el rol operativo canónico. No se aceptará una sesión anónima, una acción atribuida al usuario técnico ni una navegación basada únicamente en `navigation_role`.

#### 13. Relación con el estado legacy

La auditoría encontró tres asignaciones operativas legacy para `barista_satelite`: NEXO acceso, remisiones y solicitud de remisiones. Esta propuesta conserva la intención mínima del flujo, reemplaza la capacidad genérica de remisiones por claves canónicas y añade únicamente las referencias necesarias para operar la solicitud y la entrada controlada a PULSO.

```text
3 ASIGNACIONES LEGACY
        ↓
VALIDACIÓN CONTRA 112 PERMISOS CANÓNICOS
        ↓
11 CONCESIONES OPERATIVAS EXPLÍCITAS
├── 6 referencias de catálogo y políticas
├── 3 capacidades sobre solicitudes/remisiones
├── 1 referencia de rutas de abastecimiento
└── 1 entrada a PULSO
```

El aumento no concede inventario general, autoridad logística, recetas de FOGO ni operaciones comerciales implícitas. Sustituye dependencias internas del flujo de solicitud por referencias explícitas y deja documentadas las capacidades de barra que aún faltan en el catálogo.

#### 14. Validaciones de integridad

- ✅ Los 112 permisos canónicos fueron evaluados exactamente una vez.
- ✅ Las cantidades por aplicación suman 112.
- ✅ Solo se asignaron permisos que admiten carril operativo.
- ✅ No se asignó ningún permiso `BASE_ONLY`.
- ✅ No se asignó ningún permiso `BASE_AND_OPERATIONAL`.
- ✅ Cada permiso concedido tiene contexto y recurso explícitos.
- ✅ El rol exige turno, sede y área de barra válidos.
- ✅ Las mutaciones concedidas exigen check-in cuando corresponde.
- ✅ `pulso.access` no se utiliza como wildcard de PULSO.
- ✅ No se concedieron operaciones físicas de inventario, logística o producción central.
- ✅ No se concedieron recetas de FOGO por inferencia.
- ✅ No se concedieron capacidades financieras, laborales o de seguridad.
- ✅ No existen wildcards ni permisos implícitos.
- ✅ APP-REVIEW y sedes no habilitadas permanecen excluidas.
- ✅ Los permisos nuevos se deniegan por defecto.

#### 15. Impacto sobre tareas posteriores

| Tarea                         | Impacto                                                                                                                                          |
| ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------ |
| AUTH-RBAC-010 a AUTH-RBAC-013 | Deberán definir las demás funciones satélite sin heredar automáticamente esta matriz.                                                            |
| AUTH-RBAC-021                 | Podrá añadir excepciones operativas individuales sin sustituir turno, área, rol ni permiso exacto.                                               |
| AUTH-RBAC-023                 | Deberá corregir y limitar los dispositivos de barra a actores, aplicaciones, roles y áreas compatibles.                                          |
| AUTH-RBAC-025                 | Deberá proyectar estas 11 concesiones en el dataset canónico de matriz operativa.                                                                |
| AUTH-RBAC-027                 | Deberá confirmar que ninguna concesión produzca acceso operativo global accidental.                                                              |
| BLOQUE E                      | Deberá distinguir entrada, permiso, recurso y razones de bloqueo en la decisión final.                                                           |
| PULSO y roadmap funcional     | Deberán crear y clasificar permisos atómicos para comandas, preparación, estados, faltantes, mermas, tiempos y tickets de barra.                 |
| FOGO y arquitectura funcional | Deberán resolver la propiedad del recetario aplicable a bebidas sin duplicar recetas ni conceder `fogo.production.recipe_book.view` por defecto. |
| BLOQUE R                      | Implementará la transición física mediante migraciones versionadas en `vento-shell`, pruebas, reconciliación y rollback.                         |

#### 16. Criterios de aprobación

1. `barista_satelite` queda definido como rol operativo temporal de preparación de bebidas y barra.
2. Las 11 concesiones son explícitas y compatibles con el carril operativo.
3. El rol requiere turno, sede y área de barra válidos.
4. Las acciones vivas o mutadoras concedidas exigen check-in cuando corresponde.
5. El rol puede consultar referencias y solicitar abastecimiento sin acceder a inventario general.
6. La actualización se limita a solicitudes propias y editables.
7. No puede preparar, despachar, recibir o cancelar remisiones por defecto.
8. `pulso.access` no autoriza comandas, preparación, ventas, pagos ni caja por sí solo.
9. `fogo.production.recipe_book.view` permanece fuera de la matriz mientras no exista una decisión funcional y contractual específica para recetas de bebidas.
10. `delivery.override` permanece fuera de la matriz ordinaria.
11. Las 101 capacidades restantes permanecen denegadas por defecto.
12. No se implementa código, Supabase ni migraciones en esta tarea.
13. `AUTH-RBAC-010` permanece sin iniciar hasta solicitud expresa.

#### 17. Estado final de la propuesta

| Tarea         | Estado      |
| ------------- | ----------- |
| AUTH-RBAC-008 | APROBADA    |
| AUTH-RBAC-009 | APROBADA    |
| AUTH-RBAC-010 | NO INICIADA |

No se implementan código, migraciones, cambios en Supabase, RLS, RPC, datasets, repositorios, guards, dispositivos ni pantallas. La matriz solo será canónica cuando el usuario la apruebe expresamente.


### ✅ AUTH-RBAC-010 — Crear matriz de cocinero_satelite

#### 1. Identificación de la tarea

| Campo                     | Valor                                                              |
| ------------------------- | ------------------------------------------------------------------ |
| Bloque                    | BLOQUE D — Matrices canónicas de roles, excepciones y dispositivos |
| Tarea                     | AUTH-RBAC-010 — Crear matriz de cocinero_satelite                  |
| Estado                    | **APROBADA**                                                       |
| Naturaleza                | Definición documental de matriz operativa de cocina satélite       |
| Implementación física     | No incluida                                                        |
| Catálogo evaluado         | 112 permisos canónicos vigentes                                    |
| Tarea anterior vigente    | AUTH-RBAC-009 — APROBADA                                           |
| Tarea posterior reservada | AUTH-RBAC-011 — Crear matriz de servicio_salon                     |

Esta tarea no modifica Supabase, migraciones, tablas, RLS, RPC, aplicaciones, repositorios ni datasets físicos. La aplicación posterior deberá realizarse mediante AUTH-RBAC-025 y las migraciones versionadas del BLOQUE R en `vento-shell`.

#### 2. Objetivo

Definir, permiso por permiso, las capacidades que puede ejercer el rol operativo `cocinero_satelite` durante un turno válido en un área de cocina de una sede satélite, sin recuperar permisos permanentes del rol base legacy `cocinero`, sin confundirlo con `produccion_cocina` y sin convertir el acceso a PULSO en autorización implícita para consultar comandas, preparar alimentos, modificar estados o ejecutar operaciones comerciales no representadas todavía por permisos atómicos.

#### 3. Decisión principal

`cocinero_satelite` representa la función temporal de preparación de alimentos en la cocina de un punto de venta satélite. Su autoridad existe únicamente dentro del contexto operativo vigente y sobre recursos compatibles con la sede, el área, la relación del actor y la etapa del proceso.

```text
ACTOR IDENTIFICADO
+ TURNO PUBLICADO Y VIGENTE
+ ROL cocinero_satelite
+ SEDE AUTORIZADA
+ ÁREA ACTIVA DE TIPO bar
+ CHECK-IN CUANDO EL PERMISO LO EXIJA
+ PERMISO OPERATIVO EXPLÍCITO
+ RECURSO COMPATIBLE
= AUTORIZACIÓN OPERATIVA DE COCINA
```

No se admite:

```text
employees.role = cocinero → acceso permanente
pulso.access → autorización para consultar o preparar cualquier comanda
dispositivo de cocina → rol automático
PIN del dispositivo → sustituto del permiso
sede seleccionada → autorización
cocinero_satelite → acceso a inventario general
cocinero_satelite → acceso automático a recetas o producción central de FOGO
cocinero_satelite → delivery.override automático
```

#### 4. Resultado cuantitativo de la matriz

| Resultado                                    | Cantidad | Efecto                                                                                                                                   |
| -------------------------------------------- | -------: | ---------------------------------------------------------------------------------------------------------------------------------------- |
| Capacidades operativas asignadas             |       11 | Se conceden por el carril operativo dentro del contexto de cocina y de los recursos expresamente definidos.                              |
| Capacidades `BASE_AND_OPERATIONAL` asignadas |        0 | El rol operativo no recibe autoridad base adicional.                                                                                     |
| Capacidades no asignadas                     |      101 | Permanecen denegadas por defecto por pertenecer al carril base, a otros procesos operativos o a acciones sensibles no propias de cocina. |
| Total evaluado                               |      112 | Sin omisiones ni duplicados.                                                                                                             |

La matriz contiene **11 concesiones operativas a nivel de clave** y **101 ausencias de concesión**. La ausencia de concesión produce denegación por defecto; no se crean filas `deny` redundantes.

#### 5. Perfiles de alcance utilizados

| Perfil                          | Significado                                                                                                                                          |
| ------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| `CTX-KITCHEN-APP`               | Entrada operativa a una aplicación con turno y rol válidos. El permiso puede mostrar requisitos faltantes, pero no concede capacidades internas.     |
| `CTX-KITCHEN-REF`               | Consulta mínima de referencias necesarias para operar cocina o solicitar abastecimiento, limitada a la sede y al flujo vigentes.                     |
| `CTX-KITCHEN-REMISSION`         | Consulta de remisiones por relación legítima con la sede destino o el actor solicitante.                                                             |
| `CTX-KITCHEN-REMISSION-OWN`     | Modificación exclusiva de solicitudes propias y todavía editables.                                                                                   |
| `CTX-KITCHEN-REMISSION-REQUEST` | Creación de solicitudes para la sede y área activas con ruta y políticas válidas.                                                                    |
| `CTX-KITCHEN-PULSO`             | Entrada a la superficie de operación comercial de cocina durante turno válido. No sustituye permisos de comandas, preparación, venta, pago o cierre. |

#### 6. Reglas obligatorias de la matriz

1. Cada concesión utiliza una clave canónica exacta; no existen wildcards, herencias implícitas ni autorización por el nombre del rol.
2. El rol operativo efectivo procede exclusivamente del turno publicado y vigente. Los perfiles y dispositivos solo sugieren o restringen; nunca asignan el rol.
3. `cocinero_satelite` requiere un área operativa concreta compatible con el tipo `kitchen` y habilitada para la sede del turno.
4. Las concesiones con prerrequisito `T` pueden consultarse antes del check-in, pero continúan exigiendo turno y rol válidos.
5. Las concesiones con prerrequisito `T+C` requieren turno y check-in activos, sede y área coincidentes y recurso resoluble.
6. La sede activa se deriva del contexto válido; la sede seleccionada, primaria o enviada por el cliente no concede autoridad.
7. El permiso `pulso.access` solo permite entrar a PULSO y cargar la superficie compatible. No autoriza consultar comandas, cambiar estados, confirmar preparaciones, registrar faltantes, operar ventas, cobros, caja, anulaciones, devoluciones, puntos ni cierres.
8. La consulta de catálogo desde NEXO se limita a los atributos necesarios para identificar productos y presentaciones solicitables para la cocina.
9. La consulta de remisiones se limita a la relación del actor o de la sede destino; no concede visibilidad de toda la red.
10. La actualización de remisiones se limita a solicitudes propias, estados editables y campos permitidos, con reautenticación y auditoría.
11. La solicitud de remisiones debe ser idempotente y validar políticas, ruta, destino, cantidades y presentaciones.
12. `fogo.production.recipe_book.view` no se asigna por inferencia. La necesidad de consultar recetas o fichas de preparación deberá resolverse mediante una capacidad atómica y un contrato de recurso aprobados.
13. `pulso.delivery.deliveries.override` no se asigna al rol. Solo podrá obtenerse mediante autoridad base explícita y contexto operativo simultáneo.
14. APP-REVIEW, entornos demo, recursos aislados y sedes no habilitadas permanecen excluidos.
15. Las denegaciones individuales, estructurales, de recurso, dispositivo o aislamiento prevalecen sobre esta matriz.
16. Todo permiso nuevo se deniega hasta que una versión canónica posterior lo evalúe expresamente para `cocinero_satelite`.

#### 7. Matriz canónica completa
##### 7.1 SHELL — 1 permisos

| Permiso        | Capacidad humana  | Modalidad   | Decisión para cocinero_satelite | Alcance aprobado                                                       | Condición                                                                                              |
| -------------- | ----------------- | ----------- | ------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `shell.access` | Entrar a Vento OS | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.2 ANIMA — 10 permisos

| Permiso                                     | Capacidad humana                     | Modalidad   | Decisión para cocinero_satelite | Alcance aprobado                                                       | Condición                                                                                              |
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

| Permiso       | Capacidad humana | Modalidad   | Decisión para cocinero_satelite | Alcance aprobado                                                       | Condición                                                                                              |
| ------------- | ---------------- | ----------- | ------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `aura.access` | Entrar a AURA    | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.4 FOGO — 6 permisos

| Permiso                            | Capacidad humana                | Modalidad             | Decisión para cocinero_satelite | Alcance aprobado                                                       | Condición                                                                                                                                                                                                   |
| ---------------------------------- | ------------------------------- | --------------------- | ------------------------------- | ---------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `fogo.access`                      | Entrar a FOGO                   | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece al proceso productivo de FOGO y no se asigna automáticamente a la operación de cocina satélite.                                                                                      |
| `fogo.production.batches.view`     | Consultar lotes de producción   | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece al proceso productivo de FOGO y no se asigna automáticamente a la operación de cocina satélite.                                                                                      |
| `fogo.production.batches.create`   | Crear lotes de producción       | `OPERATIONAL_ONLY`    | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece al proceso productivo de FOGO y no se asigna automáticamente a la operación de cocina satélite.                                                                                      |
| `fogo.production.orders.view`      | Consultar órdenes de producción | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece al proceso productivo de FOGO y no se asigna automáticamente a la operación de cocina satélite.                                                                                      |
| `fogo.production.recipe_book.view` | Consultar recetario operativo   | `OPERATIONAL_ONLY`    | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | El recetario de FOGO no se concede por inferencia. La consulta de fórmulas o fichas de alimentos deberá contar con un permiso atómico y contrato de aplicabilidad propios antes de incorporarse a este rol. |
| `fogo.production.recipes.view`     | Consultar recetas               | `BASE_ONLY`           | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                                      |

##### 7.5 NEXO — 63 permisos

| Permiso                                      | Capacidad humana                         | Modalidad              | Decisión para cocinero_satelite | Alcance aprobado                                                                                                                                                                                           | Condición                                                                                                                                                                                   |
| -------------------------------------------- | ---------------------------------------- | ---------------------- | ------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `nexo.access`                                | Entrar a NEXO                            | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**           | CTX-KITCHEN-APP — turno publicado y vigente, rol efectivo `cocinero_satelite`, sede activa autorizada y área operativa válida de tipo `kitchen`. No exige check-in para mostrar la entrada y los bloqueos. | Carril operativo. Permite entrar a NEXO y ver el estado del contexto. No concede por sí solo catálogo, remisiones, inventario ni otra acción.                                               |
| `nexo.catalog.products.view`                 | Consultar productos                      | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**           | CTX-KITCHEN-REF — consulta operativa de productos vigentes aplicables a la sede activa. Excluye costos, márgenes, existencias, recetas, proveedores y campos técnicos no necesarios.                       | Turno vigente y rol `cocinero_satelite` válido. La proyección se utiliza para identificar productos dentro del flujo de solicitud; no permite crear ni modificar el maestro.                |
| `nexo.catalog.products.create`               | Crear productos                          | `BASE_ONLY`            | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.catalog.presentations.view`            | Consultar presentaciones                 | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**           | CTX-KITCHEN-REF — consulta de presentaciones vigentes y solicitables para la sede y ruta aplicables.                                                                                                       | Turno vigente y rol válido. Solo lectura para seleccionar la presentación autorizada en una solicitud.                                                                                      |
| `nexo.catalog.request_policies.view`         | Consultar políticas de solicitud         | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**           | CTX-KITCHEN-REF — consulta de políticas de solicitud aplicables al destino, producto, presentación y ruta de abastecimiento del contexto.                                                                  | Turno vigente. No permite modificar políticas ni ignorar mínimos, frecuencias, ventanas o restricciones.                                                                                    |
| `nexo.catalog.categories.view`               | Consultar categorías                     | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**           | CTX-KITCHEN-REF — consulta de categorías necesarias para buscar y organizar productos solicitables.                                                                                                        | Turno vigente. Solo lectura; no permite administrar categorías.                                                                                                                             |
| `nexo.catalog.units.view`                    | Consultar unidades                       | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**           | CTX-KITCHEN-REF — consulta de unidades, empaques y equivalencias publicadas necesarias para interpretar presentaciones solicitables.                                                                       | Turno vigente. Solo lectura; no permite administrar unidades ni conversiones.                                                                                                               |
| `nexo.assets.items.view`                     | Consultar activos                        | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde cocina o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.        |
| `nexo.assets.items.create`                   | Crear activos                            | `BASE_ONLY`            | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.assets.groups.view`                    | Consultar grupos de activos              | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde cocina o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.        |
| `nexo.assets.counts.view`                    | Consultar conteos de activos             | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde cocina o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.        |
| `nexo.inventory.adjustments.view`            | Consultar ajustes de inventario          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde cocina o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.        |
| `nexo.inventory.adjustments.register`        | Registrar ajustes de inventario          | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | La capacidad exige autoridad base y contexto operativo simultáneos. Esta matriz no concede el componente base ni la capacidad completa.                                                     |
| `nexo.inventory.entries.view`                | Consultar entradas de inventario         | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde cocina o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.        |
| `nexo.inventory.entries.register`            | Registrar entradas de inventario         | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde cocina o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.        |
| `nexo.inventory.entries.override`            | Registrar entradas excepcionales         | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | La capacidad exige autoridad base y contexto operativo simultáneos. Esta matriz no concede el componente base ni la capacidad completa.                                                     |
| `nexo.inventory.locations.view`              | Consultar ubicaciones de inventario      | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde cocina o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.        |
| `nexo.inventory.location_assignments.assign` | Asignar ubicaciones de inventario        | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde cocina o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.        |
| `nexo.inventory.location_catalog.update`     | Actualizar el catálogo de una ubicación  | `BASE_ONLY`            | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.inventory.lpns.view`                   | Consultar LPN                            | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde cocina o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.        |
| `nexo.inventory.movements.view`              | Consultar movimientos de inventario      | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde cocina o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.        |
| `nexo.inventory.stock.view`                  | Consultar stock                          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | El stock exige área activa coincidente. El rol de cocina no recibe visibilidad general de existencias de cocina, bodega, otras cocinas ni otras áreas.                                      |
| `nexo.inventory.production_batches.view`     | Consultar lotes vinculados al inventario | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde cocina o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.        |
| `nexo.inventory.transfers.view`              | Consultar traslados de inventario        | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde cocina o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.        |
| `nexo.inventory.transfers.create`            | Crear traslados de inventario            | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde cocina o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.        |
| `nexo.inventory.withdrawals.view`            | Consultar retiros de inventario          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde cocina o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.        |
| `nexo.inventory.withdrawals.register`        | Registrar retiros de inventario          | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde cocina o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.        |
| `nexo.inventory.zones.view`                  | Consultar zonas de almacenamiento        | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde cocina o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.        |
| `nexo.inventory.storage_positions.view`      | Consultar posiciones de almacenamiento   | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde cocina o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.        |
| `nexo.inventory.warehouse_operations.view`   | Consultar operaciones de bodega          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde cocina o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.        |
| `nexo.inventory.stock_validations.perform`   | Ejecutar validaciones de inventario      | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde cocina o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.        |
| `nexo.inventory.stock_counts.view`           | Consultar conteos de inventario          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde cocina o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.        |
| `nexo.inventory.stock_counts.perform`        | Ejecutar conteos de inventario           | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde cocina o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.        |
| `nexo.inventory.initial_counts.view`         | Consultar conteos iniciales              | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde cocina o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.        |
| `nexo.inventory.remissions.view`             | Consultar remisiones                     | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**           | CTX-KITCHEN-REMISSION — remisiones donde la sede activa sea destino, el actor sea solicitante o exista otra relación operativa explícita. No concede visibilidad general sobre otras sedes.                | Turno y check-in activos. Recurso resoluble y relacionado con el actor o la sede destino. Mostrar únicamente campos autorizados para el lado solicitante.                                   |
| `nexo.inventory.remissions.update`           | Actualizar remisiones                    | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**           | CTX-KITCHEN-REMISSION-OWN — únicamente solicitudes creadas por el actor, en estados editables y sobre campos permitidos del lado solicitante.                                                              | Turno y check-in activos. Control optimista de versión, reautenticación fuerte y auditoría antes/después. No permite preparar, despachar, recibir, cancelar ni modificar el lado de origen. |
| `nexo.inventory.remissions.request`          | Solicitar remisiones                     | `OPERATIONAL_ONLY`     | **ASIGNAR OPERATIVO**           | CTX-KITCHEN-REMISSION-REQUEST — crear una solicitud para la sede activa y desde el área `kitchen`, utilizando origen, ruta, productos, presentaciones y políticas válidas.                                 | Turno y check-in activos. Creación idempotente; validar destino, ruta, políticas, cantidades y presentaciones. El actor queda registrado como solicitante.                                  |
| `nexo.inventory.remissions.prepare`          | Preparar remisiones                      | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde cocina o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.        |
| `nexo.inventory.remissions.dispatch`         | Despachar remisiones                     | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde cocina o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.        |
| `nexo.inventory.remissions.receive`          | Recibir remisiones                       | `OPERATIONAL_ONLY`     | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | Recibir remisiones cambia cantidades y custodia en destino. Corresponde al rol de recepción autorizado, no automáticamente al cocinero.                                                     |
| `nexo.inventory.remissions.cancel`           | Cancelar remisiones                      | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | La cancelación no se concede por defecto al cocinero. Una necesidad de cancelar solicitudes propias deberá definirse como política explícita o excepción operativa auditada.                |
| `nexo.logistics.operations_board.view`       | Consultar tablero logístico              | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde cocina o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.        |
| `nexo.logistics.operations.view`             | Consultar operaciones logísticas         | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde cocina o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.        |
| `nexo.logistics.driver_operations.view`      | Consultar operaciones de conductores     | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde cocina o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.        |
| `nexo.logistics.fulfillment.view`            | Consultar cumplimiento logístico         | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde cocina o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.        |
| `nexo.logistics.fulfillment_routes.view`     | Consultar rutas de cumplimiento          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde cocina o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.        |
| `nexo.logistics.supply_routes.view`          | Consultar rutas de abastecimiento        | `BASE_OR_OPERATIONAL`  | **ASIGNAR OPERATIVO**           | CTX-KITCHEN-REF — consulta únicamente de rutas de abastecimiento vigentes relacionadas con la sede activa y utilizables para solicitudes.                                                                  | Turno vigente. Solo lectura; no permite modificar rutas ni consultar configuración logística ajena al flujo de solicitud.                                                                   |
| `nexo.finance.internal_invoices.view`        | Consultar facturas internas              | `BASE_ONLY`            | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.finance.internal_invoices.generate`    | Generar facturas internas                | `BASE_ONLY`            | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.finance.internal_invoices.issue`       | Emitir facturas internas                 | `BASE_ONLY`            | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.finance.internal_invoices.cancel`      | Cancelar facturas internas               | `BASE_ONLY`            | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.finance.internal_invoice_amounts.view` | Consultar valores de facturas internas   | `BASE_ONLY`            | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.finance.internal_prices.view`          | Consultar precios internos               | `BASE_ONLY`            | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.finance.internal_variances.view`       | Consultar variaciones internas           | `BASE_ONLY`            | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.finance.internal_variances.approve`    | Aprobar variaciones internas             | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | La capacidad exige autoridad base y contexto operativo simultáneos. Esta matriz no concede el componente base ni la capacidad completa.                                                     |
| `nexo.finance.internal_variances.resolve`    | Resolver variaciones internas            | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | La capacidad exige autoridad base y contexto operativo simultáneos. Esta matriz no concede el componente base ni la capacidad completa.                                                     |
| `nexo.finance.cost_centers.view`             | Consultar centros de costo en NEXO       | `BASE_ONLY`            | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.analytics.internal_reports.view`       | Consultar reportes internos              | `BASE_ONLY`            | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.analytics.margin_reports.view`         | Consultar reportes de margen             | `BASE_ONLY`            | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.printing.templates.update`             | Editar plantillas de impresión           | `BASE_ONLY`            | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.printing.jobs.view`                    | Consultar trabajos de impresión          | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | La capacidad de NEXO no es necesaria para solicitar abastecimiento desde cocina o implica inventario, bodega, logística, finanzas, configuración o una acción sensible ajena al rol.        |
| `nexo.settings.sites.view`                   | Consultar configuración de sedes         | `BASE_ONLY`            | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |
| `nexo.settings.remission_policies.view`      | Consultar políticas de remisiones        | `BASE_ONLY`            | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                                                                                                     | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.                                                                                      |

##### 7.6 NUMERA — 6 permisos

| Permiso                                   | Capacidad humana               | Modalidad   | Decisión para cocinero_satelite | Alcance aprobado                                                       | Condición                                                                                              |
| ----------------------------------------- | ------------------------------ | ----------- | ------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `numera.access`                           | Entrar a NUMERA                | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.finance.cost_centers.view`        | Consultar centros de costo     | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.finance.expenses.view`            | Consultar gastos               | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.analytics.break_even.view`        | Consultar punto de equilibrio  | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.analytics.profitability.view`     | Consultar rentabilidad         | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |
| `numera.analytics.financial_reports.view` | Consultar reportes financieros | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.7 ORIGO — 5 permisos

| Permiso                                  | Capacidad humana                  | Modalidad             | Decisión para cocinero_satelite | Alcance aprobado                                                       | Condición                                                                                                     |
| ---------------------------------------- | --------------------------------- | --------------------- | ------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| `origo.access`                           | Entrar a ORIGO                    | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece a compras, recepción o proveedores y no corresponde a la operación de cocina satélite. |
| `origo.procurement.purchase_orders.view` | Consultar órdenes de compra       | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece a compras, recepción o proveedores y no corresponde a la operación de cocina satélite. |
| `origo.procurement.receipts.view`        | Consultar recepciones de compra   | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece a compras, recepción o proveedores y no corresponde a la operación de cocina satélite. |
| `origo.procurement.suppliers.view`       | Consultar proveedores             | `BASE_OR_OPERATIONAL` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | La capacidad pertenece a compras, recepción o proveedores y no corresponde a la operación de cocina satélite. |
| `origo.catalog.product_reviews.view`     | Consultar revisiones de productos | `BASE_ONLY`           | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente.        |

##### 7.8 VENTO PASS — 1 permisos

| Permiso       | Capacidad humana    | Modalidad   | Decisión para cocinero_satelite | Alcance aprobado                                                       | Condición                                                                                              |
| ------------- | ------------------- | ----------- | ------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `pass.access` | Entrar a Vento Pass | `BASE_ONLY` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa. | Capacidad exclusiva del carril base. Un rol operativo no puede recibirla ni convertirla en permanente. |

##### 7.9 PULSO — 2 permisos

| Permiso                              | Capacidad humana                        | Modalidad              | Decisión para cocinero_satelite | Alcance aprobado                                                                                                                   | Condición                                                                                                                                                                                                                                     |
| ------------------------------------ | --------------------------------------- | ---------------------- | ------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `pulso.access`                       | Entrar a PULSO                          | `OPERATIONAL_ONLY`     | **ASIGNAR OPERATIVO**           | CTX-KITCHEN-PULSO — turno publicado y vigente, rol `cocinero_satelite`, sede autorizada y área operativa válida de tipo `kitchen`. | Carril operativo. Permite entrar a PULSO y mostrar el contexto de cocina. No autoriza por sí solo consultar comandas, cambiar estados de preparación, registrar faltantes, rehacer productos, operar ventas, pagos, caja, puntos ni entregas. |
| `pulso.delivery.deliveries.override` | Confirmar entregas de forma excepcional | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**                  | — Denegación por defecto; no se crea concesión en la matriz operativa.                                                             | Capacidad `BASE_AND_OPERATIONAL` de excepción. Requiere autoridad base explícita, turno, check-in, reautenticación fuerte, motivo y auditoría reforzada.                                                                                      |

##### 7.10 VISO — 17 permisos

| Permiso                                       | Capacidad humana                          | Modalidad   | Decisión para cocinero_satelite | Alcance aprobado                                                       | Condición                                                                                              |
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
TURNO DE COCINA VÁLIDO
        ↓
ENTRAR A PULSO
        ↓
FUNCIONES ATÓMICAS DE COMANDAS Y PREPARACIÓN
PENDIENTES DE CATÁLOGO

TURNO + CHECK-IN
        ↓
ENTRAR A NEXO
        ↓
CONSULTAR REFERENCIAS DE SOLICITUD
        ↓
CONSULTAR / CREAR / EDITAR SOLICITUD PROPIA
```

La matriz no autoriza al cocinero a preparar, despachar o recibir una remisión ni a operar inventario físico. Tampoco autoriza todavía la lectura o mutación de comandas de cocina: esas capacidades no existen en el catálogo canónico vigente y no pueden deducirse de `pulso.access`.

#### 10. Capacidades expresamente no concedidas

- cualquier permiso exclusivo del carril base;
- gestión de personal, documentos, turnos, permisos o seguridad;
- lotes, órdenes, recetas maestras o recetario de FOGO por inferencia;
- entradas, retiros, traslados, conteos, ajustes, ubicaciones, LPN o validaciones de inventario;
- preparación, despacho o recepción de remisiones;
- cancelación de remisiones por defecto;
- operaciones logísticas, de conductor, cumplimiento o bodega;
- compras, recepciones y proveedores de ORIGO;
- facturas internas, costos, márgenes, gastos, contabilidad o NUMERA;
- configuración de sedes, políticas, rutas, impresión o catálogos maestros;
- ventas, pagos, caja, anulaciones, devoluciones o descuentos por inferencia desde PULSO;
- `pulso.delivery.deliveries.override` sin autoridad base separada;
- acceso a clientes, puntos o canjes de fidelización por inferencia;
- acceso a APP-REVIEW o a sedes no habilitadas;
- cualquier permiso futuro no evaluado expresamente.

#### 11. Brechas del catálogo identificadas

El catálogo vigente solo contiene `pulso.access` y una excepción de entrega. Por tanto, todavía no representa las operaciones ordinarias de una cocina satélite, entre ellas:

- consultar la cola de comandas asignada a cocina;
- consultar detalle, modificadores, notas, alergias, restricciones y prioridad de cada ítem;
- aceptar o iniciar una preparación;
- cambiar estados como pendiente, en preparación, listo, entregado o rechazado;
- confirmar cantidades, porciones y responsable de preparación;
- registrar un producto temporalmente agotado o no disponible;
- solicitar sustitución o aclaración de una comanda;
- registrar rehacer, merma, desperdicio, error de preparación o devolución a cocina;
- consultar fichas técnicas, recetas publicadas y porciones aplicables a cocina satélite;
- separar preparación de alimentos de acciones comerciales de venta y cobro;
- imprimir o reimprimir tickets de producción cuando corresponda;
- consultar historial operativo de cocina dentro de la sede y el turno;
- gestionar tiempos, alertas, secuencias y priorización de preparación;
- atribuir cada transición al actor real, incluso desde dispositivo compartido.

Estas brechas no amplían la matriz. Hasta que existan permisos atómicos canónicos, `pulso.access` no podrá interpretarse como autorización implícita para consultar, preparar o modificar comandas. También deberá definirse expresamente si las recetas operativas de cocina satélite pertenecen a PULSO, FOGO o a una capacidad transversal con aplicación propietaria única, sin confundirlas con la planificación y ejecución de producción central.

#### 12. Dispositivo compartido de cocina satélite

La auditoría no identificó una plantilla específica y canónica para cocina satélite. La plantilla legacy `production_center` no puede reutilizarse automáticamente porque fue concebida para producción central, utiliza `navigation_role = cocinero` del catálogo base heredado y no distingue la función `cocinero_satelite` de los roles `produccion_cocina`, `produccion_panaderia` y `produccion_reposteria`.

Una futura plantilla de cocina satélite podrá habilitar PULSO, NEXO y SHELL como superficies disponibles, pero no concederá por sí misma la matriz del rol. Antes de ejecutar una acción deberá existir:

```text
DISPOSITIVO TÉCNICO ACTIVO
+ ACTOR IDENTIFICADO
+ PIN O AUTENTICACIÓN EXIGIDA
+ TURNO cocinero_satelite VÁLIDO
+ ÁREA DEL DISPOSITIVO COINCIDENTE
+ CHECK-IN CUANDO CORRESPONDA
+ PERMISO DE ESTA MATRIZ
= ACCIÓN ATRIBUIBLE AL TRABAJADOR
```

La política de actor deberá exigir coincidencia de sede y área y validar expresamente el rol `cocinero_satelite`. No se aceptará `same_site_active_worker` como autorización suficiente, una sesión anónima, una acción atribuida al usuario técnico ni una navegación basada únicamente en `navigation_role`. La definición de la plantilla concreta corresponde a AUTH-RBAC-023 y no forma parte de esta tarea.

#### 13. Relación con el estado legacy

La auditoría encontró tres asignaciones operativas legacy para `cocinero_satelite`: NEXO acceso, remisiones y solicitud de remisiones. Esta propuesta conserva la intención mínima del flujo, reemplaza la capacidad genérica de remisiones por claves canónicas y añade únicamente las referencias necesarias para operar la solicitud y la entrada controlada a PULSO.

```text
3 ASIGNACIONES LEGACY
        ↓
VALIDACIÓN CONTRA 112 PERMISOS CANÓNICOS
        ↓
11 CONCESIONES OPERATIVAS EXPLÍCITAS
├── 6 referencias de catálogo y políticas
├── 3 capacidades sobre solicitudes/remisiones
├── 1 referencia de rutas de abastecimiento
└── 1 entrada a PULSO
```

El aumento no concede inventario general, autoridad logística, producción central ni operaciones comerciales implícitas. Sustituye dependencias internas del flujo de solicitud por referencias explícitas y deja documentadas las capacidades de cocina que aún faltan en el catálogo.

#### 14. Validaciones de integridad

- ✅ Los 112 permisos canónicos fueron evaluados exactamente una vez.
- ✅ Las cantidades por aplicación suman 112.
- ✅ Solo se asignaron permisos que admiten carril operativo.
- ✅ No se asignó ningún permiso `BASE_ONLY`.
- ✅ No se asignó ningún permiso `BASE_AND_OPERATIONAL`.
- ✅ Cada permiso concedido tiene contexto y recurso explícitos.
- ✅ El rol exige turno, sede y área de cocina válidos.
- ✅ Las mutaciones concedidas exigen check-in cuando corresponde.
- ✅ `pulso.access` no se utiliza como wildcard de PULSO.
- ✅ No se concedieron operaciones físicas de inventario, logística o producción central.
- ✅ No se concedieron recetas de FOGO por inferencia.
- ✅ No se concedieron capacidades financieras, laborales o de seguridad.
- ✅ No existen wildcards ni permisos implícitos.
- ✅ APP-REVIEW y sedes no habilitadas permanecen excluidas.
- ✅ Los permisos nuevos se deniegan por defecto.

#### 15. Impacto sobre tareas posteriores

| Tarea                         | Impacto                                                                                                                                                  |
| ----------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
| AUTH-RBAC-011 a AUTH-RBAC-013 | Deberán definir las demás funciones satélite sin heredar automáticamente esta matriz.                                                                    |
| AUTH-RBAC-021                 | Podrá añadir excepciones operativas individuales sin sustituir turno, área, rol ni permiso exacto.                                                       |
| AUTH-RBAC-023                 | Deberá definir una plantilla específica de cocina satélite y excluir la reutilización automática de `production_center`.                                 |
| AUTH-RBAC-025                 | Deberá proyectar estas 11 concesiones en el dataset canónico de matriz operativa.                                                                        |
| AUTH-RBAC-027                 | Deberá confirmar que ninguna concesión produzca acceso operativo global accidental.                                                                      |
| BLOQUE E                      | Deberá distinguir entrada, permiso, recurso y razones de bloqueo en la decisión final.                                                                   |
| PULSO y roadmap funcional     | Deberán crear y clasificar permisos atómicos para comandas, preparación, estados, faltantes, mermas, tiempos y tickets de cocina.                        |
| FOGO y arquitectura funcional | Deberán resolver la propiedad de recetas aplicables a cocina satélite sin mezclar el rol con producción central ni conceder el recetario por inferencia. |
| BLOQUE R                      | Implementará la transición física mediante migraciones versionadas en `vento-shell`, pruebas, reconciliación y rollback.                                 |

#### 16. Criterios de aprobación

1. `cocinero_satelite` queda definido como rol operativo temporal de preparación de alimentos en cocina de punto de venta.
2. Las 11 concesiones son explícitas y compatibles con el carril operativo.
3. El rol requiere turno, sede y área de cocina válidos.
4. Las acciones vivas o mutadoras concedidas exigen check-in cuando corresponde.
5. El rol puede consultar referencias y solicitar abastecimiento sin acceder a inventario general.
6. La actualización se limita a solicitudes propias y editables.
7. No puede preparar, despachar, recibir o cancelar remisiones por defecto.
8. `pulso.access` no autoriza comandas, preparación, ventas, pagos ni caja por sí solo.
9. `fogo.production.recipe_book.view` permanece fuera de la matriz mientras no exista una decisión funcional y contractual específica para recetas de cocina satélite.
10. El rol no recibe permisos de producción central por similitud semántica con `produccion_cocina`.
11. La plantilla legacy `production_center` no puede utilizarse como plantilla de cocina satélite sin rediseño y aprobación.
12. `delivery.override` permanece fuera de la matriz ordinaria.
13. Las 101 capacidades restantes permanecen denegadas por defecto.
14. No se implementa código, Supabase ni migraciones en esta tarea.
15. `AUTH-RBAC-011` permanece sin iniciar hasta solicitud expresa.

#### 17. Estado final de la propuesta

| Tarea         | Estado      |
| ------------- | ----------- |
| AUTH-RBAC-009 | APROBADA    |
| AUTH-RBAC-010 | APROBADA    |
| AUTH-RBAC-011 | NO INICIADA |

No se implementan código, migraciones, cambios en Supabase, RLS, RPC, datasets, repositorios, guards, dispositivos ni pantallas. La matriz solo será canónica cuando el usuario la apruebe expresamente.
