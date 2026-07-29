### SECCIÓN — PROPIETARIO Y GERENCIAS

<!-- PLAN-SECTION-META:START -->
Esta sección reúne contenido canónico con una responsabilidad documental única dentro del plan. Debe conservarse cohesionada y actualizarse junto con sus referencias y validaciones dependientes.

**Cobertura canónica:** `AUTH-RBAC-001` a `AUTH-RBAC-004` — 4 tareas.
<!-- PLAN-SECTION-META:END -->

### ✅ AUTH-RBAC-001 — Crear matriz de propietario

#### 1. Identificación de la tarea

| Campo                     | Valor                                                              |
| ------------------------- | ------------------------------------------------------------------ |
| Bloque                    | BLOQUE D — Matrices canónicas de roles, excepciones y dispositivos |
| Tarea                     | AUTH-RBAC-001 — Crear matriz de propietario                        |
| Estado                    | **APROBADA**                                                       |
| Naturaleza                | Definición documental de matriz base                               |
| Implementación física     | No incluida                                                        |
| Catálogo evaluado         | 112 permisos canónicos vigentes                                    |
| Tarea anterior vigente    | AUTH-CAT-019 — Evitar cadenas de permisos escritas manualmente     |
| Tarea posterior reservada | AUTH-RBAC-002 — Crear matriz de gerente_general                    |

Esta tarea no modifica Supabase, migraciones, tablas, RLS, RPC, aplicaciones, repositorios ni datasets físicos. La aplicación posterior deberá realizarse mediante los datasets canónicos de AUTH-RBAC-024 y las migraciones versionadas del BLOQUE R en `vento-shell`.

#### 2. Objetivo

Definir, permiso por permiso, qué capacidades del catálogo canónico vigente recibe el rol base `propietario`, por qué carril, con qué alcance y bajo qué condiciones, sin utilizar wildcards, bypasses por nombre de rol ni permisos operativos permanentes.

#### 3. Decisión principal

`propietario` representa gobierno organizacional y recibe la cobertura administrativa más amplia permitida por cada permiso canónico, pero no recibe autoridad operativa automática.

```text
PROPIETARIO
+ PERMISO BASE EXPLÍCITO
+ ALCANCE VÁLIDO
+ RECURSO RESUELTO
= AUTORIZACIÓN ADMINISTRATIVA POSIBLE
```

No se admite:

```text
propietario = *
propietario = bypass operativo
propietario = service_role
propietario = acceso automático a APP-REVIEW
```

#### 4. Resultado cuantitativo de la matriz

| Resultado                             | Cantidad | Efecto                                                                             |
| ------------------------------------- | -------: | ---------------------------------------------------------------------------------- |
| Capacidades administrativas directas  |       94 | Se conceden por el carril base y pueden evaluarse sin turno ni check-in.           |
| Componentes base de doble condición   |        5 | Se conceden al propietario, pero la acción exige además contexto operativo válido. |
| Capacidades exclusivamente operativas |       13 | No se asignan en la matriz base de propietario.                                    |
| Total evaluado                        |      112 | Sin omisiones ni duplicados.                                                       |

Por tanto, la matriz contiene **99 decisiones de concesión a nivel de clave de permiso** y **13 ausencias de concesión**. La proyección física podrá requerir más de una fila cuando un permiso use territorios explícitos. La ausencia de concesión produce denegación por defecto; no se crean filas `deny` redundantes.

#### 5. Perfiles de alcance utilizados

| Perfil                       | Significado                                                                                                                                               |
| ---------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `NT-APP`                     | Entrada no territorial a una aplicación; no concede funciones internas.                                                                                   |
| `G(B)`                       | Cobertura base de la organización productiva ordinaria. Excluye APP-REVIEW, demo, pruebas, datos sintéticos, secretos y dominios aislados.                |
| `ORG`                        | Recurso organizacional exacto sin sede ficticia.                                                                                                          |
| `EXPLICIT_TERRITORY`         | Sede, tipo de sede, área o tipo de área expresamente asignados. No equivale a global y no incorpora sedes futuras automáticamente.                        |
| `BASE ∩ CTX`                 | El componente base está concedido, pero la acción solo se autoriza al intersectarlo con turno, check-in, rol operativo, sede, área y recurso compatibles. |
| `OWN + THIRD_PARTY_EXPLICIT` | Acceso propio y consulta de terceros únicamente mediante concesión sensible expresa.                                                                      |

#### 6. Reglas obligatorias de la matriz

1. Cada concesión utiliza una clave canónica exacta.
2. Ningún permiso nuevo se concede automáticamente.
3. Los 13 permisos `OPERATIONAL_ONLY` no se insertan en `role_permissions` para `propietario`.
4. Los cinco permisos `BASE_AND_OPERATIONAL` reciben únicamente el componente base.
5. Un permiso `BASE_OR_OPERATIONAL` concedido al propietario se evalúa por el carril base; su carril operativo conserva reglas independientes.
6. Los permisos base no requieren turno ni check-in, pero sí empleado activo, permiso activo, alcance válido y contrato de recurso satisfecho.
7. Todo alcance global excluye APP-REVIEW y demás entornos aislados.
8. Los permisos que no admiten `G(B)` se asignan mediante `ORG` o territorios explícitos; no se degradan a un global implícito.
9. Un recurso sin territorio resuelto se deniega cuando su contrato lo exige.
10. La matriz no elimina ni supera denegaciones individuales, estructurales, de recurso o de dispositivo.
11. El rol no permite ejecutar como `service_role`, impersonar trabajadores ni omitir auditoría.
12. Dispositivo compartido, simulación, sensibilidad y reautenticación conservan íntegramente las clasificaciones de AUTH-CAT-010 a AUTH-CAT-016.

#### 7. Matriz canónica completa

##### 7.1 SHELL — 1 permisos

| Permiso | Capacidad humana | Modalidad | Decisión para propietario | Alcance aprobado | Condición |
| ------- | ---------------- | --------- | ------------------------- | ---------------- | --------- |

| `shell.access` | Entrar a Vento OS | `BASE_ONLY` | **ASIGNAR** | NT-APP — acceso no territorial a la aplicación. | Carril base. Sin turno ni check-in. |



##### 7.2 ANIMA — 10 permisos

| Permiso | Capacidad humana | Modalidad | Decisión para propietario | Alcance aprobado | Condición |
| ------- | ---------------- | --------- | ------------------------- | ---------------- | --------- |

| `anima.access` | Entrar a ANIMA | `BASE_ONLY` | **ASIGNAR** | NT-APP — acceso no territorial a la aplicación. | Carril base. Sin turno ni check-in. |

| `anima.workforce.employee_documents.view` | Consultar documentos de trabajadores | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `anima.workforce.employee_documents.upload` | Cargar documentos de trabajadores | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `anima.workforce.employee_documents.delete` | Eliminar documentos de trabajadores | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `anima.workforce.employee_photos.upload` | Cargar fotografías de trabajadores | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `anima.workforce.team_members.view` | Consultar integrantes del equipo | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `anima.workforce.staff_invitations.create` | Invitar trabajadores | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `anima.attendance.shifts.create` | Crear turnos | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `anima.attendance.shifts.update` | Actualizar turnos | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `anima.attendance.shifts.cancel` | Cancelar turnos | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |



##### 7.3 AURA — 1 permisos

| Permiso | Capacidad humana | Modalidad | Decisión para propietario | Alcance aprobado | Condición |
| ------- | ---------------- | --------- | ------------------------- | ---------------- | --------- |

| `aura.access` | Entrar a AURA | `BASE_ONLY` | **ASIGNAR** | NT-APP — acceso no territorial a la aplicación. | Carril base. Sin turno ni check-in. |



##### 7.4 FOGO — 6 permisos

| Permiso | Capacidad humana | Modalidad | Decisión para propietario | Alcance aprobado | Condición |
| ------- | ---------------- | --------- | ------------------------- | ---------------- | --------- |

| `fogo.access` | Entrar a FOGO | `BASE_OR_OPERATIONAL` | **ASIGNAR** | NT-APP — acceso no territorial a la aplicación. | El propietario usa el carril base; el carril operativo continúa independiente. |

| `fogo.production.batches.view` | Consultar lotes de producción | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El propietario usa el carril base; el carril operativo continúa independiente. |

| `fogo.production.batches.create` | Crear lotes de producción | `OPERATIONAL_ONLY` | **NO ASIGNAR** | — Denegación por defecto en la matriz base; solo matriz operativa compatible. | El rol propietario no concede esta capacidad. Requiere rol operativo, turno y prerrequisitos canónicos. |

| `fogo.production.orders.view` | Consultar órdenes de producción | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El propietario usa el carril base; el carril operativo continúa independiente. |

| `fogo.production.recipe_book.view` | Consultar recetario operativo | `OPERATIONAL_ONLY` | **NO ASIGNAR** | — Denegación por defecto en la matriz base; solo matriz operativa compatible. | El rol propietario no concede esta capacidad. Requiere rol operativo, turno y prerrequisitos canónicos. |

| `fogo.production.recipes.view` | Consultar recetas | `BASE_ONLY` | **ASIGNAR** | ORG exacto dentro de la organización ordinaria; no equivale a alcance territorial global. | Carril base. Sin turno ni check-in. |



##### 7.5 NEXO — 63 permisos

| Permiso | Capacidad humana | Modalidad | Decisión para propietario | Alcance aprobado | Condición |
| ------- | ---------------- | --------- | ------------------------- | ---------------- | --------- |

| `nexo.access` | Entrar a NEXO | `BASE_OR_OPERATIONAL` | **ASIGNAR** | NT-APP — acceso no territorial a la aplicación. | El propietario usa el carril base; el carril operativo continúa independiente. |

| `nexo.catalog.products.view` | Consultar productos | `BASE_OR_OPERATIONAL` | **ASIGNAR** | ORG exacto dentro de la organización ordinaria; no equivale a alcance territorial global. | El propietario usa el carril base; el carril operativo continúa independiente. |

| `nexo.catalog.products.create` | Crear productos | `BASE_ONLY` | **ASIGNAR** | ORG exacto dentro de la organización ordinaria; no equivale a alcance territorial global. | Carril base. Sin turno ni check-in. |

| `nexo.catalog.presentations.view` | Consultar presentaciones | `BASE_OR_OPERATIONAL` | **ASIGNAR** | ORG exacto dentro de la organización ordinaria; no equivale a alcance territorial global. | El propietario usa el carril base; el carril operativo continúa independiente. |

| `nexo.catalog.request_policies.view` | Consultar políticas de solicitud | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El propietario usa el carril base; el carril operativo continúa independiente. |

| `nexo.catalog.categories.view` | Consultar categorías | `BASE_OR_OPERATIONAL` | **ASIGNAR** | ORG exacto dentro de la organización ordinaria; no equivale a alcance territorial global. | El propietario usa el carril base; el carril operativo continúa independiente. |

| `nexo.catalog.units.view` | Consultar unidades | `BASE_OR_OPERATIONAL` | **ASIGNAR** | ORG exacto dentro de la organización ordinaria; no equivale a alcance territorial global. | El propietario usa el carril base; el carril operativo continúa independiente. |

| `nexo.assets.items.view` | Consultar activos | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El propietario usa el carril base; el carril operativo continúa independiente. |

| `nexo.assets.items.create` | Crear activos | `BASE_ONLY` | **ASIGNAR** | AS/SS/AST/AA/SA/AAT explícitos sobre territorios ordinarios; sin G y sin incorporación automática de sedes futuras. | Carril base. Sin turno ni check-in. |

| `nexo.assets.groups.view` | Consultar grupos de activos | `BASE_OR_OPERATIONAL` | **ASIGNAR** | ORG exacto dentro de la organización ordinaria; no equivale a alcance territorial global. | El propietario usa el carril base; el carril operativo continúa independiente. |

| `nexo.assets.counts.view` | Consultar conteos de activos | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El propietario usa el carril base; el carril operativo continúa independiente. |

| `nexo.inventory.adjustments.view` | Consultar ajustes de inventario | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El propietario usa el carril base; el carril operativo continúa independiente. |

| `nexo.inventory.adjustments.register` | Registrar ajustes de inventario | `BASE_AND_OPERATIONAL` | **ASIGNAR COMPONENTE BASE** | G(B) para el componente base; ejecución = alcance base ∩ CTX operativo del recurso. | La concesión base sola no ejecuta la acción: exige turno, check-in y contexto operativo compatibles. |

| `nexo.inventory.entries.view` | Consultar entradas de inventario | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El propietario usa el carril base; el carril operativo continúa independiente. |

| `nexo.inventory.entries.register` | Registrar entradas de inventario | `OPERATIONAL_ONLY` | **NO ASIGNAR** | — Denegación por defecto en la matriz base; solo matriz operativa compatible. | El rol propietario no concede esta capacidad. Requiere rol operativo, turno y prerrequisitos canónicos. |

| `nexo.inventory.entries.override` | Registrar entradas excepcionales | `BASE_AND_OPERATIONAL` | **ASIGNAR COMPONENTE BASE** | G(B) para el componente base; ejecución = alcance base ∩ CTX operativo del recurso. | La concesión base sola no ejecuta la acción: exige turno, check-in y contexto operativo compatibles. |

| `nexo.inventory.locations.view` | Consultar ubicaciones de inventario | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El propietario usa el carril base; el carril operativo continúa independiente. |

| `nexo.inventory.location_assignments.assign` | Asignar ubicaciones de inventario | `OPERATIONAL_ONLY` | **NO ASIGNAR** | — Denegación por defecto en la matriz base; solo matriz operativa compatible. | El rol propietario no concede esta capacidad. Requiere rol operativo, turno y prerrequisitos canónicos. |

| `nexo.inventory.location_catalog.update` | Actualizar el catálogo de una ubicación | `BASE_ONLY` | **ASIGNAR** | AS/SS/AST/AA/SA/AAT explícitos sobre territorios ordinarios; sin G y sin incorporación automática de sedes futuras. | Carril base. Sin turno ni check-in. |

| `nexo.inventory.lpns.view` | Consultar LPN | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El propietario usa el carril base; el carril operativo continúa independiente. |

| `nexo.inventory.movements.view` | Consultar movimientos de inventario | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El propietario usa el carril base; el carril operativo continúa independiente. |

| `nexo.inventory.stock.view` | Consultar stock | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El propietario usa el carril base; el carril operativo continúa independiente. |

| `nexo.inventory.production_batches.view` | Consultar lotes vinculados al inventario | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El propietario usa el carril base; el carril operativo continúa independiente. |

| `nexo.inventory.transfers.view` | Consultar traslados de inventario | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El propietario usa el carril base; el carril operativo continúa independiente. |

| `nexo.inventory.transfers.create` | Crear traslados de inventario | `OPERATIONAL_ONLY` | **NO ASIGNAR** | — Denegación por defecto en la matriz base; solo matriz operativa compatible. | El rol propietario no concede esta capacidad. Requiere rol operativo, turno y prerrequisitos canónicos. |

| `nexo.inventory.withdrawals.view` | Consultar retiros de inventario | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El propietario usa el carril base; el carril operativo continúa independiente. |

| `nexo.inventory.withdrawals.register` | Registrar retiros de inventario | `OPERATIONAL_ONLY` | **NO ASIGNAR** | — Denegación por defecto en la matriz base; solo matriz operativa compatible. | El rol propietario no concede esta capacidad. Requiere rol operativo, turno y prerrequisitos canónicos. |

| `nexo.inventory.zones.view` | Consultar zonas de almacenamiento | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El propietario usa el carril base; el carril operativo continúa independiente. |

| `nexo.inventory.storage_positions.view` | Consultar posiciones de almacenamiento | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El propietario usa el carril base; el carril operativo continúa independiente. |

| `nexo.inventory.warehouse_operations.view` | Consultar operaciones de bodega | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El propietario usa el carril base; el carril operativo continúa independiente. |

| `nexo.inventory.stock_validations.perform` | Ejecutar validaciones de inventario | `OPERATIONAL_ONLY` | **NO ASIGNAR** | — Denegación por defecto en la matriz base; solo matriz operativa compatible. | El rol propietario no concede esta capacidad. Requiere rol operativo, turno y prerrequisitos canónicos. |

| `nexo.inventory.stock_counts.view` | Consultar conteos de inventario | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El propietario usa el carril base; el carril operativo continúa independiente. |

| `nexo.inventory.stock_counts.perform` | Ejecutar conteos de inventario | `OPERATIONAL_ONLY` | **NO ASIGNAR** | — Denegación por defecto en la matriz base; solo matriz operativa compatible. | El rol propietario no concede esta capacidad. Requiere rol operativo, turno y prerrequisitos canónicos. |

| `nexo.inventory.initial_counts.view` | Consultar conteos iniciales | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El propietario usa el carril base; el carril operativo continúa independiente. |

| `nexo.inventory.remissions.view` | Consultar remisiones | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El propietario usa el carril base; el carril operativo continúa independiente. |

| `nexo.inventory.remissions.update` | Actualizar remisiones | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El propietario usa el carril base; el carril operativo continúa independiente. |

| `nexo.inventory.remissions.request` | Solicitar remisiones | `OPERATIONAL_ONLY` | **NO ASIGNAR** | — Denegación por defecto en la matriz base; solo matriz operativa compatible. | El rol propietario no concede esta capacidad. Requiere rol operativo, turno y prerrequisitos canónicos. |

| `nexo.inventory.remissions.prepare` | Preparar remisiones | `OPERATIONAL_ONLY` | **NO ASIGNAR** | — Denegación por defecto en la matriz base; solo matriz operativa compatible. | El rol propietario no concede esta capacidad. Requiere rol operativo, turno y prerrequisitos canónicos. |

| `nexo.inventory.remissions.dispatch` | Despachar remisiones | `OPERATIONAL_ONLY` | **NO ASIGNAR** | — Denegación por defecto en la matriz base; solo matriz operativa compatible. | El rol propietario no concede esta capacidad. Requiere rol operativo, turno y prerrequisitos canónicos. |

| `nexo.inventory.remissions.receive` | Recibir remisiones | `OPERATIONAL_ONLY` | **NO ASIGNAR** | — Denegación por defecto en la matriz base; solo matriz operativa compatible. | El rol propietario no concede esta capacidad. Requiere rol operativo, turno y prerrequisitos canónicos. |

| `nexo.inventory.remissions.cancel` | Cancelar remisiones | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El propietario usa el carril base; el carril operativo continúa independiente. |

| `nexo.logistics.operations_board.view` | Consultar tablero logístico | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El propietario usa el carril base; el carril operativo continúa independiente. |

| `nexo.logistics.operations.view` | Consultar operaciones logísticas | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El propietario usa el carril base; el carril operativo continúa independiente. |

| `nexo.logistics.driver_operations.view` | Consultar operaciones de conductores | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El propietario usa el carril base; el carril operativo continúa independiente. |

| `nexo.logistics.fulfillment.view` | Consultar cumplimiento logístico | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El propietario usa el carril base; el carril operativo continúa independiente. |

| `nexo.logistics.fulfillment_routes.view` | Consultar rutas de cumplimiento | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El propietario usa el carril base; el carril operativo continúa independiente. |

| `nexo.logistics.supply_routes.view` | Consultar rutas de abastecimiento | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El propietario usa el carril base; el carril operativo continúa independiente. |

| `nexo.finance.internal_invoices.view` | Consultar facturas internas | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `nexo.finance.internal_invoices.generate` | Generar facturas internas | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `nexo.finance.internal_invoices.issue` | Emitir facturas internas | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `nexo.finance.internal_invoices.cancel` | Cancelar facturas internas | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `nexo.finance.internal_invoice_amounts.view` | Consultar valores de facturas internas | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `nexo.finance.internal_prices.view` | Consultar precios internos | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `nexo.finance.internal_variances.view` | Consultar variaciones internas | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `nexo.finance.internal_variances.approve` | Aprobar variaciones internas | `BASE_AND_OPERATIONAL` | **ASIGNAR COMPONENTE BASE** | G(B) para el componente base; ejecución = alcance base ∩ CTX operativo del recurso. | La concesión base sola no ejecuta la acción: exige turno, check-in y contexto operativo compatibles. |

| `nexo.finance.internal_variances.resolve` | Resolver variaciones internas | `BASE_AND_OPERATIONAL` | **ASIGNAR COMPONENTE BASE** | G(B) para el componente base; ejecución = alcance base ∩ CTX operativo del recurso. | La concesión base sola no ejecuta la acción: exige turno, check-in y contexto operativo compatibles. |

| `nexo.finance.cost_centers.view` | Consultar centros de costo en NEXO | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `nexo.analytics.internal_reports.view` | Consultar reportes internos | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `nexo.analytics.margin_reports.view` | Consultar reportes de margen | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `nexo.printing.templates.update` | Editar plantillas de impresión | `BASE_ONLY` | **ASIGNAR** | ORG exacto y, cuando sea local, AS/SS/AST/AA/SA/AAT explícitos; sin G genérico. | Carril base. Sin turno ni check-in. |

| `nexo.printing.jobs.view` | Consultar trabajos de impresión | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El propietario usa el carril base; el carril operativo continúa independiente. |

| `nexo.settings.sites.view` | Consultar configuración de sedes | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `nexo.settings.remission_policies.view` | Consultar políticas de remisiones | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |



##### 7.6 NUMERA — 6 permisos

| Permiso | Capacidad humana | Modalidad | Decisión para propietario | Alcance aprobado | Condición |
| ------- | ---------------- | --------- | ------------------------- | ---------------- | --------- |

| `numera.access` | Entrar a NUMERA | `BASE_ONLY` | **ASIGNAR** | NT-APP — acceso no territorial a la aplicación. | Carril base. Sin turno ni check-in. |

| `numera.finance.cost_centers.view` | Consultar centros de costo | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `numera.finance.expenses.view` | Consultar gastos | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `numera.analytics.break_even.view` | Consultar punto de equilibrio | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `numera.analytics.profitability.view` | Consultar rentabilidad | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `numera.analytics.financial_reports.view` | Consultar reportes financieros | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |



##### 7.7 ORIGO — 5 permisos

| Permiso | Capacidad humana | Modalidad | Decisión para propietario | Alcance aprobado | Condición |
| ------- | ---------------- | --------- | ------------------------- | ---------------- | --------- |

| `origo.access` | Entrar a ORIGO | `BASE_OR_OPERATIONAL` | **ASIGNAR** | NT-APP — acceso no territorial a la aplicación. | El propietario usa el carril base; el carril operativo continúa independiente. |

| `origo.procurement.purchase_orders.view` | Consultar órdenes de compra | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El propietario usa el carril base; el carril operativo continúa independiente. |

| `origo.procurement.receipts.view` | Consultar recepciones de compra | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El propietario usa el carril base; el carril operativo continúa independiente. |

| `origo.procurement.suppliers.view` | Consultar proveedores | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El propietario usa el carril base; el carril operativo continúa independiente. |

| `origo.catalog.product_reviews.view` | Consultar revisiones de productos | `BASE_ONLY` | **ASIGNAR** | ORG exacto dentro de la organización ordinaria; no equivale a alcance territorial global. | Carril base. Sin turno ni check-in. |



##### 7.8 VENTO PASS — 1 permisos

| Permiso | Capacidad humana | Modalidad | Decisión para propietario | Alcance aprobado | Condición |
| ------- | ---------------- | --------- | ------------------------- | ---------------- | --------- |

| `pass.access` | Entrar a Vento Pass | `BASE_ONLY` | **ASIGNAR** | NT-CLIENT-ADMIN — superficie laboral-administrativa no territorial. | Carril base. Sin turno ni check-in. |



##### 7.9 PULSO — 2 permisos

| Permiso | Capacidad humana | Modalidad | Decisión para propietario | Alcance aprobado | Condición |
| ------- | ---------------- | --------- | ------------------------- | ---------------- | --------- |

| `pulso.access` | Entrar a PULSO | `OPERATIONAL_ONLY` | **NO ASIGNAR** | — Denegación por defecto en la matriz base; solo matriz operativa compatible. | El rol propietario no concede esta capacidad. Requiere rol operativo, turno y prerrequisitos canónicos. |

| `pulso.delivery.deliveries.override` | Confirmar entregas de forma excepcional | `BASE_AND_OPERATIONAL` | **ASIGNAR COMPONENTE BASE** | Cobertura base explícita sobre sedes comerciales ordinarias; ejecución = alcance base ∩ CTX operativo de la entrega. | La concesión base sola no ejecuta la acción: exige turno, check-in y contexto operativo compatibles. |



##### 7.10 VISO — 17 permisos

| Permiso | Capacidad humana | Modalidad | Decisión para propietario | Alcance aprobado | Condición |
| ------- | ---------------- | --------- | ------------------------- | ---------------- | --------- |

| `viso.access` | Entrar a VISO | `BASE_ONLY` | **ASIGNAR** | NT-APP — acceso no territorial a la aplicación. | Carril base. Sin turno ni check-in. |

| `viso.platform.app_updates.view` | Consultar actualizaciones de aplicaciones | `BASE_ONLY` | **ASIGNAR** | ORG exacto dentro de la organización ordinaria; no equivale a alcance territorial global. | Carril base. Sin turno ni check-in. |

| `viso.organization.businesses.view` | Consultar empresas y unidades de negocio | `BASE_ONLY` | **ASIGNAR** | ORG exacto dentro de la organización ordinaria; no equivale a alcance territorial global. | Carril base. Sin turno ni check-in. |

| `viso.workforce.employees.view` | Consultar trabajadores | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `viso.workforce.staff_calendar.view` | Consultar calendario del personal | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `viso.workforce.schedules.view` | Consultar programación de turnos | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `viso.workforce.vacancies.view` | Consultar vacantes | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `viso.authorization.context_simulations.view` | Consultar simulaciones de autorización | `BASE_ONLY` | **ASIGNAR** | OWN más consulta de terceros mediante concesión administrativa sensible explícita; sin impersonación real. | Carril base. Sin turno ni check-in. |

| `viso.authorization.audit_logs.view` | Consultar auditoría de autorización | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `viso.catalog.commercial_categories.view` | Consultar categorías comerciales | `BASE_ONLY` | **ASIGNAR** | ORG, unidad, negocio, canal o campaña exactos; territorio únicamente cuando el recurso lo declare. | Carril base. Sin turno ni check-in. |

| `viso.content.content_blocks.view` | Consultar bloques de contenido | `BASE_ONLY` | **ASIGNAR** | ORG, unidad, negocio, canal o campaña exactos; territorio únicamente cuando el recurso lo declare. | Carril base. Sin turno ni check-in. |

| `viso.content.menu.view` | Consultar menú | `BASE_ONLY` | **ASIGNAR** | ORG, unidad, negocio, canal o campaña exactos; territorio únicamente cuando el recurso lo declare. | Carril base. Sin turno ni check-in. |

| `viso.content.website_content.view` | Consultar contenido del sitio web | `BASE_ONLY` | **ASIGNAR** | ORG, unidad, negocio, canal o campaña exactos; territorio únicamente cuando el recurso lo declare. | Carril base. Sin turno ni check-in. |

| `viso.finance.accounting.view` | Consultar información contable | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `viso.delivery.rates.view` | Consultar tarifas de entrega | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `viso.loyalty.products.view` | Consultar productos de fidelización | `BASE_ONLY` | **ASIGNAR** | ORG, unidad, negocio, canal o campaña exactos; territorio únicamente cuando el recurso lo declare. | Carril base. Sin turno ni check-in. |

| `viso.loyalty.customers.view` | Consultar clientes de fidelización | `BASE_ONLY` | **ASIGNAR** | Dominio cliente o negocio completo mediante concesión base explícita; sede solo como filtro de actividad. | Carril base. Sin turno ni check-in. |



#### 8. Resumen por aplicación

| Aplicación | Total | Directas por carril base | Componente base de doble condición | No asignadas por ser operativas |
| ---------- | ----: | -----------------------: | ---------------------------------: | ------------------------------: |

| SHELL | 1 | 1 | 0 | 0 |

| ANIMA | 10 | 10 | 0 | 0 |

| AURA | 1 | 1 | 0 | 0 |

| FOGO | 6 | 4 | 0 | 2 |

| NEXO | 63 | 49 | 4 | 10 |

| NUMERA | 6 | 6 | 0 | 0 |

| ORIGO | 5 | 5 | 0 | 0 |

| VENTO PASS | 1 | 1 | 0 | 0 |

| PULSO | 2 | 0 | 1 | 1 |

| VISO | 17 | 17 | 0 | 0 |

| **Total** | **112** | **94** | **5** | **13** |

#### 9. Capacidades reservadas y vacíos del catálogo vigente

El rol `propietario` puede recibir capacidades reservadas, pero únicamente cuando exista una clave canónica atómica que las represente. La matriz no reactiva permisos legacy amplios retirados o bloqueados, entre ellos los relacionados con administración general de personal, permisos, perfiles operativos, navegación o roles por sede.

En consecuencia, esta tarea **no concede implícitamente** capacidades como:

- administrar propietarios;
- administrar roles y permisos;
- crear o retirar denegaciones;
- ejecutar recuperación de seguridad;
- modificar perfiles operativos;
- administrar roles operativos por sede;
- modificar personal mediante un permiso genérico;
- administrar navegación mediante un permiso genérico.

Cuando estas capacidades se necesiten, deberán descomponerse en permisos exactos, clasificarse mediante el protocolo contractual, aprobarse y luego incorporarse expresamente a la matriz. Hasta entonces permanecen denegadas en el modelo canónico, aunque alguna ruta legacy todavía las permita físicamente.

#### 10. Tratamientos especiales

##### 10.1 AURA

`aura.access` se asigna como capacidad base no territorial, pero permanece **dormida** mientras AURA conserve su estado funcional diferido. La asignación no implica que la aplicación esté implementada ni habilitada para uso productivo.

##### 10.2 Vento Pass

`pass.access` autoriza únicamente la superficie laboral-administrativa de Pass. No autentica al cliente, no concede puntos, no permite redenciones y no expone automáticamente datos de fidelización.

##### 10.3 PULSO

`pulso.access` no se concede al propietario por el rol base porque es `OPERATIONAL_ONLY`. El componente base de `pulso.delivery.deliveries.override` sí se concede, pero solo puede ejecutarse cuando el propietario asume un rol operativo compatible y cumple el contexto completo.

##### 10.4 Operación física

Crear lotes, registrar entradas, asignar ubicaciones, crear traslados, registrar retiros, validar stock, realizar conteos y ejecutar transiciones físicas de remisiones continúan siendo capacidades operativas. El propietario deberá asumir un rol operativo canónico cuando necesite realizarlas.

#### 11. Relación con el estado legacy

Las 163 asignaciones legacy observadas para `propietario` no constituyen esta matriz. Durante la implementación deberá construirse una comparación explícita:

```text
MATRIZ LEGACY
vs.
MATRIZ CANÓNICA AUTH-RBAC-001
```

Toda asignación legacy deberá clasificarse como conservar, reemplazar, retirar o migrar. Ningún bypass existente por nombre de rol podrá utilizarse para completar diferencias.

#### 12. Validaciones de integridad

| Validación                                               | Resultado |
| -------------------------------------------------------- | --------- |
| Permisos canónicos evaluados                             | 112       |
| Permisos omitidos                                        | 0         |
| Permisos duplicados                                      | 0         |
| Claves de permiso con concesión base                     | 99        |
| Capacidades directas                                     | 94        |
| Capacidades de doble condición                           | 5         |
| Capacidades exclusivamente operativas sin concesión base | 13        |
| Wildcards                                                | 0         |
| Bypasses por nombre de rol                               | 0         |
| Permisos legacy reincorporados                           | 0         |
| Acceso automático a APP-REVIEW                           | 0         |

#### 13. Impacto sobre tareas posteriores

- `AUTH-RBAC-002` deberá diferenciar administración ejecutiva global de gobierno propietario y no podrá heredar automáticamente esta matriz.
- `AUTH-RBAC-008` a `AUTH-RBAC-019` definirán los roles que pueden conceder los 13 permisos exclusivamente operativos y los carriles operativos de permisos híbridos.
- `AUTH-RBAC-020` a `AUTH-RBAC-022` podrán añadir excepciones o denegaciones sin modificar esta matriz de rol.
- `AUTH-RBAC-024` deberá convertir esta definición en dataset canónico versionado.
- `AUTH-RBAC-027` deberá comprobar que ninguna concesión base produzca acceso operativo global accidental.
- `AUTH-RBAC-028` deberá comprobar que las 94 capacidades administrativas directas no dependan de turno ni check-in.

#### 14. Criterios de aprobación

AUTH-RBAC-001 podrá aprobarse cuando se acepte expresamente que:

- el propietario recibe 99 claves de permiso con concesión base explícita y no un wildcard;
- 94 capacidades pueden autorizarse por el carril base;
- cinco capacidades exigen simultáneamente contexto operativo;
- 13 capacidades operativas no se conceden por el rol propietario;
- los alcances especiales no se convierten silenciosamente en globales;
- APP-REVIEW y entornos aislados quedan excluidos;
- no se reactivan permisos legacy amplios;
- los vacíos de gobierno requieren permisos atómicos futuros;
- no se implementa todavía ningún cambio físico.

#### 15. Estado final de la propuesta

| Tarea         | Estado      |
| ------------- | ----------- |
| AUTH-CAT-019  | APROBADA    |
| AUTH-RBAC-001 | APROBADA    |
| AUTH-RBAC-002 | NO INICIADA |

No se avanza a AUTH-RBAC-002 hasta recibir aprobación explícita.


### ✅ AUTH-RBAC-002 — Crear matriz de gerente_general

#### 1. Identificación de la tarea

| Campo                     | Valor                                                              |
| ------------------------- | ------------------------------------------------------------------ |
| Bloque                    | BLOQUE D — Matrices canónicas de roles, excepciones y dispositivos |
| Tarea                     | AUTH-RBAC-002 — Crear matriz de gerente_general                    |
| Estado                    | **APROBADA**                                                       |
| Naturaleza                | Definición documental de matriz base                               |
| Implementación física     | No incluida                                                        |
| Catálogo evaluado         | 112 permisos canónicos vigentes                                    |
| Tarea anterior vigente    | AUTH-RBAC-001 — Crear matriz de propietario                        |
| Tarea posterior reservada | AUTH-RBAC-003 — Crear matriz de gerente                            |

Esta tarea no modifica Supabase, migraciones, tablas, RLS, RPC, aplicaciones, repositorios ni datasets físicos. La aplicación posterior deberá realizarse mediante los datasets canónicos de AUTH-RBAC-024 y las migraciones versionadas del BLOQUE R en `vento-shell`.

#### 2. Objetivo

Definir, permiso por permiso, qué capacidades del catálogo canónico vigente recibe el rol base `gerente_general`, por qué carril, con qué alcance y bajo qué condiciones, manteniendo administración ejecutiva global sin convertirla en gobierno propietario, wildcard, bypass operativo ni autoridad técnica privilegiada.

#### 3. Decisión principal

`gerente_general` representa dirección ejecutiva global. Puede supervisar y administrar transversalmente la organización mediante permisos explícitos, pero no gobierna propietarios, arquitectura de autorización, recuperación de seguridad, service role, aislamiento técnico ni controles reservados.

```text
GERENTE GENERAL
+ PERMISO BASE EXPLÍCITO
+ ALCANCE VÁLIDO
+ RECURSO RESUELTO
= AUTORIZACIÓN EJECUTIVA POSIBLE
```

No se admite:

```text
gerente_general = *
gerente_general = propietario
gerente_general = bypass operativo
gerente_general = service_role
gerente_general = acceso automático a APP-REVIEW
gerente_general = capacidad reservada futura
```

La coincidencia cuantitativa con `AUTH-RBAC-001` no constituye herencia. Cada una de las 112 claves fue evaluada nuevamente. El catálogo vigente no contiene todavía permisos atómicos de gobierno propietario; por eso las diferencias reservadas se expresan como prohibiciones contractuales y deberán materializarse cuando esas claves existan.

#### 4. Resultado cuantitativo de la matriz

| Resultado                             | Cantidad | Efecto                                                                                 |
| ------------------------------------- | -------: | -------------------------------------------------------------------------------------- |
| Capacidades administrativas directas  |       94 | Se conceden por el carril base y pueden evaluarse sin turno ni check-in.               |
| Componentes base de doble condición   |        5 | Se conceden al gerente general, pero la acción exige además contexto operativo válido. |
| Capacidades exclusivamente operativas |       13 | No se asignan en la matriz base de gerente_general.                                    |
| Total evaluado                        |      112 | Sin omisiones ni duplicados.                                                           |

Por tanto, la matriz contiene **99 decisiones de concesión a nivel de clave de permiso** y **13 ausencias de concesión**. La proyección física podrá requerir más de una fila cuando un permiso use territorios explícitos. Estas 99 concesiones coinciden con las concesiones no reservadas de `AUTH-RBAC-001`, pero fueron aprobadas por responsabilidad ejecutiva propia y no por herencia del rol propietario. La ausencia de concesión produce denegación por defecto; no se crean filas `deny` redundantes.

#### 5. Perfiles de alcance utilizados

| Perfil                       | Significado                                                                                                                                               |
| ---------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `NT-APP`                     | Entrada no territorial a una aplicación; no concede funciones internas.                                                                                   |
| `G(B)`                       | Cobertura base de la organización productiva ordinaria. Excluye APP-REVIEW, demo, pruebas, datos sintéticos, secretos y dominios aislados.                |
| `ORG`                        | Recurso organizacional exacto sin sede ficticia.                                                                                                          |
| `EXPLICIT_TERRITORY`         | Sede, tipo de sede, área o tipo de área expresamente asignados. No equivale a global y no incorpora sedes futuras automáticamente.                        |
| `BASE ∩ CTX`                 | El componente base está concedido, pero la acción solo se autoriza al intersectarlo con turno, check-in, rol operativo, sede, área y recurso compatibles. |
| `OWN + THIRD_PARTY_EXPLICIT` | Acceso propio y consulta de terceros únicamente mediante concesión sensible expresa.                                                                      |

#### 6. Reglas obligatorias de la matriz

1. Cada concesión utiliza una clave canónica exacta.
2. Ningún permiso nuevo se concede automáticamente.
3. Los 13 permisos `OPERATIONAL_ONLY` no se insertan en `role_permissions` para `gerente_general`.
4. Los cinco permisos `BASE_AND_OPERATIONAL` reciben únicamente el componente base.
5. Un permiso `BASE_OR_OPERATIONAL` concedido al gerente general se evalúa por el carril base; su carril operativo conserva reglas independientes.
6. Los permisos base no requieren turno ni check-in, pero sí empleado activo, permiso activo, alcance válido y contrato de recurso satisfecho.
7. Todo alcance global excluye APP-REVIEW y demás entornos aislados.
8. Los permisos que no admiten `G(B)` se asignan mediante `ORG` o territorios explícitos; no se degradan a un global implícito.
9. Un recurso sin territorio resuelto se deniega cuando su contrato lo exige.
10. La matriz no elimina ni supera denegaciones individuales, estructurales, de recurso o de dispositivo.
11. El rol no permite ejecutar como `service_role`, impersonar trabajadores ni omitir auditoría.
12. Dispositivo compartido, simulación, sensibilidad y reautenticación conservan íntegramente las clasificaciones de AUTH-CAT-010 a AUTH-CAT-016.
13. `gerente_general` no puede administrar propietarios, conceder equivalencia a propietario, alterar recuperación de seguridad, desactivar auditoría, modificar service role ni romper aislamiento técnico mediante permisos generales.
14. Una futura clave marcada como capacidad reservada de propietario deberá quedar **NO ASIGNADA** a `gerente_general`, aunque exista una concesión aparentemente relacionada.
15. La coincidencia con la matriz de propietario no genera vínculo de herencia ni sincronización automática entre matrices.

#### 7. Matriz canónica completa

##### 7.1 SHELL — 1 permisos

| Permiso | Capacidad humana | Modalidad | Decisión para gerente_general | Alcance aprobado | Condición |
| ------- | ---------------- | --------- | ----------------------------- | ---------------- | --------- |

| `shell.access` | Entrar a Vento OS | `BASE_ONLY` | **ASIGNAR** | NT-APP — acceso no territorial a la aplicación. | Carril base. Sin turno ni check-in. |



##### 7.2 ANIMA — 10 permisos

| Permiso | Capacidad humana | Modalidad | Decisión para gerente_general | Alcance aprobado | Condición |
| ------- | ---------------- | --------- | ----------------------------- | ---------------- | --------- |

| `anima.access` | Entrar a ANIMA | `BASE_ONLY` | **ASIGNAR** | NT-APP — acceso no territorial a la aplicación. | Carril base. Sin turno ni check-in. |

| `anima.workforce.employee_documents.view` | Consultar documentos de trabajadores | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `anima.workforce.employee_documents.upload` | Cargar documentos de trabajadores | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `anima.workforce.employee_documents.delete` | Eliminar documentos de trabajadores | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `anima.workforce.employee_photos.upload` | Cargar fotografías de trabajadores | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `anima.workforce.team_members.view` | Consultar integrantes del equipo | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `anima.workforce.staff_invitations.create` | Invitar trabajadores | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `anima.attendance.shifts.create` | Crear turnos | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `anima.attendance.shifts.update` | Actualizar turnos | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `anima.attendance.shifts.cancel` | Cancelar turnos | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |



##### 7.3 AURA — 1 permisos

| Permiso | Capacidad humana | Modalidad | Decisión para gerente_general | Alcance aprobado | Condición |
| ------- | ---------------- | --------- | ----------------------------- | ---------------- | --------- |

| `aura.access` | Entrar a AURA | `BASE_ONLY` | **ASIGNAR** | NT-APP — acceso no territorial a la aplicación. | Carril base. Sin turno ni check-in. |



##### 7.4 FOGO — 6 permisos

| Permiso | Capacidad humana | Modalidad | Decisión para gerente_general | Alcance aprobado | Condición |
| ------- | ---------------- | --------- | ----------------------------- | ---------------- | --------- |

| `fogo.access` | Entrar a FOGO | `BASE_OR_OPERATIONAL` | **ASIGNAR** | NT-APP — acceso no territorial a la aplicación. | El gerente general usa el carril base; el carril operativo continúa independiente. |

| `fogo.production.batches.view` | Consultar lotes de producción | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El gerente general usa el carril base; el carril operativo continúa independiente. |

| `fogo.production.batches.create` | Crear lotes de producción | `OPERATIONAL_ONLY` | **NO ASIGNAR** | — Denegación por defecto en la matriz base; solo matriz operativa compatible. | El rol gerente_general no concede esta capacidad. Requiere rol operativo, turno y prerrequisitos canónicos. |

| `fogo.production.orders.view` | Consultar órdenes de producción | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El gerente general usa el carril base; el carril operativo continúa independiente. |

| `fogo.production.recipe_book.view` | Consultar recetario operativo | `OPERATIONAL_ONLY` | **NO ASIGNAR** | — Denegación por defecto en la matriz base; solo matriz operativa compatible. | El rol gerente_general no concede esta capacidad. Requiere rol operativo, turno y prerrequisitos canónicos. |

| `fogo.production.recipes.view` | Consultar recetas | `BASE_ONLY` | **ASIGNAR** | ORG exacto dentro de la organización ordinaria; no equivale a alcance territorial global. | Carril base. Sin turno ni check-in. |



##### 7.5 NEXO — 63 permisos

| Permiso | Capacidad humana | Modalidad | Decisión para gerente_general | Alcance aprobado | Condición |
| ------- | ---------------- | --------- | ----------------------------- | ---------------- | --------- |

| `nexo.access` | Entrar a NEXO | `BASE_OR_OPERATIONAL` | **ASIGNAR** | NT-APP — acceso no territorial a la aplicación. | El gerente general usa el carril base; el carril operativo continúa independiente. |

| `nexo.catalog.products.view` | Consultar productos | `BASE_OR_OPERATIONAL` | **ASIGNAR** | ORG exacto dentro de la organización ordinaria; no equivale a alcance territorial global. | El gerente general usa el carril base; el carril operativo continúa independiente. |

| `nexo.catalog.products.create` | Crear productos | `BASE_ONLY` | **ASIGNAR** | ORG exacto dentro de la organización ordinaria; no equivale a alcance territorial global. | Carril base. Sin turno ni check-in. |

| `nexo.catalog.presentations.view` | Consultar presentaciones | `BASE_OR_OPERATIONAL` | **ASIGNAR** | ORG exacto dentro de la organización ordinaria; no equivale a alcance territorial global. | El gerente general usa el carril base; el carril operativo continúa independiente. |

| `nexo.catalog.request_policies.view` | Consultar políticas de solicitud | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El gerente general usa el carril base; el carril operativo continúa independiente. |

| `nexo.catalog.categories.view` | Consultar categorías | `BASE_OR_OPERATIONAL` | **ASIGNAR** | ORG exacto dentro de la organización ordinaria; no equivale a alcance territorial global. | El gerente general usa el carril base; el carril operativo continúa independiente. |

| `nexo.catalog.units.view` | Consultar unidades | `BASE_OR_OPERATIONAL` | **ASIGNAR** | ORG exacto dentro de la organización ordinaria; no equivale a alcance territorial global. | El gerente general usa el carril base; el carril operativo continúa independiente. |

| `nexo.assets.items.view` | Consultar activos | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El gerente general usa el carril base; el carril operativo continúa independiente. |

| `nexo.assets.items.create` | Crear activos | `BASE_ONLY` | **ASIGNAR** | AS/SS/AST/AA/SA/AAT explícitos sobre territorios ordinarios; sin G y sin incorporación automática de sedes futuras. | Carril base. Sin turno ni check-in. |

| `nexo.assets.groups.view` | Consultar grupos de activos | `BASE_OR_OPERATIONAL` | **ASIGNAR** | ORG exacto dentro de la organización ordinaria; no equivale a alcance territorial global. | El gerente general usa el carril base; el carril operativo continúa independiente. |

| `nexo.assets.counts.view` | Consultar conteos de activos | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El gerente general usa el carril base; el carril operativo continúa independiente. |

| `nexo.inventory.adjustments.view` | Consultar ajustes de inventario | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El gerente general usa el carril base; el carril operativo continúa independiente. |

| `nexo.inventory.adjustments.register` | Registrar ajustes de inventario | `BASE_AND_OPERATIONAL` | **ASIGNAR COMPONENTE BASE** | G(B) para el componente base; ejecución = alcance base ∩ CTX operativo del recurso. | La concesión base sola no ejecuta la acción: exige turno, check-in y contexto operativo compatibles. |

| `nexo.inventory.entries.view` | Consultar entradas de inventario | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El gerente general usa el carril base; el carril operativo continúa independiente. |

| `nexo.inventory.entries.register` | Registrar entradas de inventario | `OPERATIONAL_ONLY` | **NO ASIGNAR** | — Denegación por defecto en la matriz base; solo matriz operativa compatible. | El rol gerente_general no concede esta capacidad. Requiere rol operativo, turno y prerrequisitos canónicos. |

| `nexo.inventory.entries.override` | Registrar entradas excepcionales | `BASE_AND_OPERATIONAL` | **ASIGNAR COMPONENTE BASE** | G(B) para el componente base; ejecución = alcance base ∩ CTX operativo del recurso. | La concesión base sola no ejecuta la acción: exige turno, check-in y contexto operativo compatibles. |

| `nexo.inventory.locations.view` | Consultar ubicaciones de inventario | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El gerente general usa el carril base; el carril operativo continúa independiente. |

| `nexo.inventory.location_assignments.assign` | Asignar ubicaciones de inventario | `OPERATIONAL_ONLY` | **NO ASIGNAR** | — Denegación por defecto en la matriz base; solo matriz operativa compatible. | El rol gerente_general no concede esta capacidad. Requiere rol operativo, turno y prerrequisitos canónicos. |

| `nexo.inventory.location_catalog.update` | Actualizar el catálogo de una ubicación | `BASE_ONLY` | **ASIGNAR** | AS/SS/AST/AA/SA/AAT explícitos sobre territorios ordinarios; sin G y sin incorporación automática de sedes futuras. | Carril base. Sin turno ni check-in. |

| `nexo.inventory.lpns.view` | Consultar LPN | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El gerente general usa el carril base; el carril operativo continúa independiente. |

| `nexo.inventory.movements.view` | Consultar movimientos de inventario | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El gerente general usa el carril base; el carril operativo continúa independiente. |

| `nexo.inventory.stock.view` | Consultar stock | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El gerente general usa el carril base; el carril operativo continúa independiente. |

| `nexo.inventory.production_batches.view` | Consultar lotes vinculados al inventario | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El gerente general usa el carril base; el carril operativo continúa independiente. |

| `nexo.inventory.transfers.view` | Consultar traslados de inventario | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El gerente general usa el carril base; el carril operativo continúa independiente. |

| `nexo.inventory.transfers.create` | Crear traslados de inventario | `OPERATIONAL_ONLY` | **NO ASIGNAR** | — Denegación por defecto en la matriz base; solo matriz operativa compatible. | El rol gerente_general no concede esta capacidad. Requiere rol operativo, turno y prerrequisitos canónicos. |

| `nexo.inventory.withdrawals.view` | Consultar retiros de inventario | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El gerente general usa el carril base; el carril operativo continúa independiente. |

| `nexo.inventory.withdrawals.register` | Registrar retiros de inventario | `OPERATIONAL_ONLY` | **NO ASIGNAR** | — Denegación por defecto en la matriz base; solo matriz operativa compatible. | El rol gerente_general no concede esta capacidad. Requiere rol operativo, turno y prerrequisitos canónicos. |

| `nexo.inventory.zones.view` | Consultar zonas de almacenamiento | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El gerente general usa el carril base; el carril operativo continúa independiente. |

| `nexo.inventory.storage_positions.view` | Consultar posiciones de almacenamiento | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El gerente general usa el carril base; el carril operativo continúa independiente. |

| `nexo.inventory.warehouse_operations.view` | Consultar operaciones de bodega | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El gerente general usa el carril base; el carril operativo continúa independiente. |

| `nexo.inventory.stock_validations.perform` | Ejecutar validaciones de inventario | `OPERATIONAL_ONLY` | **NO ASIGNAR** | — Denegación por defecto en la matriz base; solo matriz operativa compatible. | El rol gerente_general no concede esta capacidad. Requiere rol operativo, turno y prerrequisitos canónicos. |

| `nexo.inventory.stock_counts.view` | Consultar conteos de inventario | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El gerente general usa el carril base; el carril operativo continúa independiente. |

| `nexo.inventory.stock_counts.perform` | Ejecutar conteos de inventario | `OPERATIONAL_ONLY` | **NO ASIGNAR** | — Denegación por defecto en la matriz base; solo matriz operativa compatible. | El rol gerente_general no concede esta capacidad. Requiere rol operativo, turno y prerrequisitos canónicos. |

| `nexo.inventory.initial_counts.view` | Consultar conteos iniciales | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El gerente general usa el carril base; el carril operativo continúa independiente. |

| `nexo.inventory.remissions.view` | Consultar remisiones | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El gerente general usa el carril base; el carril operativo continúa independiente. |

| `nexo.inventory.remissions.update` | Actualizar remisiones | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El gerente general usa el carril base; el carril operativo continúa independiente. |

| `nexo.inventory.remissions.request` | Solicitar remisiones | `OPERATIONAL_ONLY` | **NO ASIGNAR** | — Denegación por defecto en la matriz base; solo matriz operativa compatible. | El rol gerente_general no concede esta capacidad. Requiere rol operativo, turno y prerrequisitos canónicos. |

| `nexo.inventory.remissions.prepare` | Preparar remisiones | `OPERATIONAL_ONLY` | **NO ASIGNAR** | — Denegación por defecto en la matriz base; solo matriz operativa compatible. | El rol gerente_general no concede esta capacidad. Requiere rol operativo, turno y prerrequisitos canónicos. |

| `nexo.inventory.remissions.dispatch` | Despachar remisiones | `OPERATIONAL_ONLY` | **NO ASIGNAR** | — Denegación por defecto en la matriz base; solo matriz operativa compatible. | El rol gerente_general no concede esta capacidad. Requiere rol operativo, turno y prerrequisitos canónicos. |

| `nexo.inventory.remissions.receive` | Recibir remisiones | `OPERATIONAL_ONLY` | **NO ASIGNAR** | — Denegación por defecto en la matriz base; solo matriz operativa compatible. | El rol gerente_general no concede esta capacidad. Requiere rol operativo, turno y prerrequisitos canónicos. |

| `nexo.inventory.remissions.cancel` | Cancelar remisiones | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El gerente general usa el carril base; el carril operativo continúa independiente. |

| `nexo.logistics.operations_board.view` | Consultar tablero logístico | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El gerente general usa el carril base; el carril operativo continúa independiente. |

| `nexo.logistics.operations.view` | Consultar operaciones logísticas | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El gerente general usa el carril base; el carril operativo continúa independiente. |

| `nexo.logistics.driver_operations.view` | Consultar operaciones de conductores | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El gerente general usa el carril base; el carril operativo continúa independiente. |

| `nexo.logistics.fulfillment.view` | Consultar cumplimiento logístico | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El gerente general usa el carril base; el carril operativo continúa independiente. |

| `nexo.logistics.fulfillment_routes.view` | Consultar rutas de cumplimiento | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El gerente general usa el carril base; el carril operativo continúa independiente. |

| `nexo.logistics.supply_routes.view` | Consultar rutas de abastecimiento | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El gerente general usa el carril base; el carril operativo continúa independiente. |

| `nexo.finance.internal_invoices.view` | Consultar facturas internas | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `nexo.finance.internal_invoices.generate` | Generar facturas internas | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `nexo.finance.internal_invoices.issue` | Emitir facturas internas | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `nexo.finance.internal_invoices.cancel` | Cancelar facturas internas | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `nexo.finance.internal_invoice_amounts.view` | Consultar valores de facturas internas | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `nexo.finance.internal_prices.view` | Consultar precios internos | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `nexo.finance.internal_variances.view` | Consultar variaciones internas | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `nexo.finance.internal_variances.approve` | Aprobar variaciones internas | `BASE_AND_OPERATIONAL` | **ASIGNAR COMPONENTE BASE** | G(B) para el componente base; ejecución = alcance base ∩ CTX operativo del recurso. | La concesión base sola no ejecuta la acción: exige turno, check-in y contexto operativo compatibles. |

| `nexo.finance.internal_variances.resolve` | Resolver variaciones internas | `BASE_AND_OPERATIONAL` | **ASIGNAR COMPONENTE BASE** | G(B) para el componente base; ejecución = alcance base ∩ CTX operativo del recurso. | La concesión base sola no ejecuta la acción: exige turno, check-in y contexto operativo compatibles. |

| `nexo.finance.cost_centers.view` | Consultar centros de costo en NEXO | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `nexo.analytics.internal_reports.view` | Consultar reportes internos | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `nexo.analytics.margin_reports.view` | Consultar reportes de margen | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `nexo.printing.templates.update` | Editar plantillas de impresión | `BASE_ONLY` | **ASIGNAR** | ORG exacto y, cuando sea local, AS/SS/AST/AA/SA/AAT explícitos; sin G genérico. | Carril base. Sin turno ni check-in. |

| `nexo.printing.jobs.view` | Consultar trabajos de impresión | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El gerente general usa el carril base; el carril operativo continúa independiente. |

| `nexo.settings.sites.view` | Consultar configuración de sedes | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `nexo.settings.remission_policies.view` | Consultar políticas de remisiones | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |



##### 7.6 NUMERA — 6 permisos

| Permiso | Capacidad humana | Modalidad | Decisión para gerente_general | Alcance aprobado | Condición |
| ------- | ---------------- | --------- | ----------------------------- | ---------------- | --------- |

| `numera.access` | Entrar a NUMERA | `BASE_ONLY` | **ASIGNAR** | NT-APP — acceso no territorial a la aplicación. | Carril base. Sin turno ni check-in. |

| `numera.finance.cost_centers.view` | Consultar centros de costo | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `numera.finance.expenses.view` | Consultar gastos | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `numera.analytics.break_even.view` | Consultar punto de equilibrio | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `numera.analytics.profitability.view` | Consultar rentabilidad | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `numera.analytics.financial_reports.view` | Consultar reportes financieros | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |



##### 7.7 ORIGO — 5 permisos

| Permiso | Capacidad humana | Modalidad | Decisión para gerente_general | Alcance aprobado | Condición |
| ------- | ---------------- | --------- | ----------------------------- | ---------------- | --------- |

| `origo.access` | Entrar a ORIGO | `BASE_OR_OPERATIONAL` | **ASIGNAR** | NT-APP — acceso no territorial a la aplicación. | El gerente general usa el carril base; el carril operativo continúa independiente. |

| `origo.procurement.purchase_orders.view` | Consultar órdenes de compra | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El gerente general usa el carril base; el carril operativo continúa independiente. |

| `origo.procurement.receipts.view` | Consultar recepciones de compra | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El gerente general usa el carril base; el carril operativo continúa independiente. |

| `origo.procurement.suppliers.view` | Consultar proveedores | `BASE_OR_OPERATIONAL` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | El gerente general usa el carril base; el carril operativo continúa independiente. |

| `origo.catalog.product_reviews.view` | Consultar revisiones de productos | `BASE_ONLY` | **ASIGNAR** | ORG exacto dentro de la organización ordinaria; no equivale a alcance territorial global. | Carril base. Sin turno ni check-in. |



##### 7.8 VENTO PASS — 1 permisos

| Permiso | Capacidad humana | Modalidad | Decisión para gerente_general | Alcance aprobado | Condición |
| ------- | ---------------- | --------- | ----------------------------- | ---------------- | --------- |

| `pass.access` | Entrar a Vento Pass | `BASE_ONLY` | **ASIGNAR** | NT-CLIENT-ADMIN — superficie laboral-administrativa no territorial. | Carril base. Sin turno ni check-in. |



##### 7.9 PULSO — 2 permisos

| Permiso | Capacidad humana | Modalidad | Decisión para gerente_general | Alcance aprobado | Condición |
| ------- | ---------------- | --------- | ----------------------------- | ---------------- | --------- |

| `pulso.access` | Entrar a PULSO | `OPERATIONAL_ONLY` | **NO ASIGNAR** | — Denegación por defecto en la matriz base; solo matriz operativa compatible. | El rol gerente_general no concede esta capacidad. Requiere rol operativo, turno y prerrequisitos canónicos. |

| `pulso.delivery.deliveries.override` | Confirmar entregas de forma excepcional | `BASE_AND_OPERATIONAL` | **ASIGNAR COMPONENTE BASE** | Cobertura base explícita sobre sedes comerciales ordinarias; ejecución = alcance base ∩ CTX operativo de la entrega. | La concesión base sola no ejecuta la acción: exige turno, check-in y contexto operativo compatibles. |



##### 7.10 VISO — 17 permisos

| Permiso | Capacidad humana | Modalidad | Decisión para gerente_general | Alcance aprobado | Condición |
| ------- | ---------------- | --------- | ----------------------------- | ---------------- | --------- |

| `viso.access` | Entrar a VISO | `BASE_ONLY` | **ASIGNAR** | NT-APP — acceso no territorial a la aplicación. | Carril base. Sin turno ni check-in. |

| `viso.platform.app_updates.view` | Consultar actualizaciones de aplicaciones | `BASE_ONLY` | **ASIGNAR** | ORG exacto dentro de la organización ordinaria; no equivale a alcance territorial global. | Carril base. Sin turno ni check-in. |

| `viso.organization.businesses.view` | Consultar empresas y unidades de negocio | `BASE_ONLY` | **ASIGNAR** | ORG exacto dentro de la organización ordinaria; no equivale a alcance territorial global. | Carril base. Sin turno ni check-in. |

| `viso.workforce.employees.view` | Consultar trabajadores | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `viso.workforce.staff_calendar.view` | Consultar calendario del personal | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `viso.workforce.schedules.view` | Consultar programación de turnos | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `viso.workforce.vacancies.view` | Consultar vacantes | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `viso.authorization.context_simulations.view` | Consultar simulaciones de autorización | `BASE_ONLY` | **ASIGNAR** | OWN más consulta de terceros mediante concesión administrativa sensible explícita; sin impersonación real. | Carril base. Sin turno ni check-in. |

| `viso.authorization.audit_logs.view` | Consultar auditoría de autorización | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `viso.catalog.commercial_categories.view` | Consultar categorías comerciales | `BASE_ONLY` | **ASIGNAR** | ORG, unidad, negocio, canal o campaña exactos; territorio únicamente cuando el recurso lo declare. | Carril base. Sin turno ni check-in. |

| `viso.content.content_blocks.view` | Consultar bloques de contenido | `BASE_ONLY` | **ASIGNAR** | ORG, unidad, negocio, canal o campaña exactos; territorio únicamente cuando el recurso lo declare. | Carril base. Sin turno ni check-in. |

| `viso.content.menu.view` | Consultar menú | `BASE_ONLY` | **ASIGNAR** | ORG, unidad, negocio, canal o campaña exactos; territorio únicamente cuando el recurso lo declare. | Carril base. Sin turno ni check-in. |

| `viso.content.website_content.view` | Consultar contenido del sitio web | `BASE_ONLY` | **ASIGNAR** | ORG, unidad, negocio, canal o campaña exactos; territorio únicamente cuando el recurso lo declare. | Carril base. Sin turno ni check-in. |

| `viso.finance.accounting.view` | Consultar información contable | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `viso.delivery.rates.view` | Consultar tarifas de entrega | `BASE_ONLY` | **ASIGNAR** | G(B) — organización productiva ordinaria; excluye APP-REVIEW, demo, pruebas, secretos y dominios aislados. | Carril base. Sin turno ni check-in. |

| `viso.loyalty.products.view` | Consultar productos de fidelización | `BASE_ONLY` | **ASIGNAR** | ORG, unidad, negocio, canal o campaña exactos; territorio únicamente cuando el recurso lo declare. | Carril base. Sin turno ni check-in. |

| `viso.loyalty.customers.view` | Consultar clientes de fidelización | `BASE_ONLY` | **ASIGNAR** | Dominio cliente o negocio completo mediante concesión base explícita; sede solo como filtro de actividad. | Carril base. Sin turno ni check-in. |



#### 8. Resumen por aplicación

| Aplicación | Total | Directas por carril base | Componente base de doble condición | No asignadas por ser operativas |
| ---------- | ----: | -----------------------: | ---------------------------------: | ------------------------------: |

| SHELL | 1 | 1 | 0 | 0 |

| ANIMA | 10 | 10 | 0 | 0 |

| AURA | 1 | 1 | 0 | 0 |

| FOGO | 6 | 4 | 0 | 2 |

| NEXO | 63 | 49 | 4 | 10 |

| NUMERA | 6 | 6 | 0 | 0 |

| ORIGO | 5 | 5 | 0 | 0 |

| VENTO PASS | 1 | 1 | 0 | 0 |

| PULSO | 2 | 0 | 1 | 1 |

| VISO | 17 | 17 | 0 | 0 |

| **Total** | **112** | **94** | **5** | **13** |

#### 9. Separación frente a propietario y vacíos del catálogo vigente

El catálogo de 112 permisos todavía no contiene claves atómicas para las capacidades que separan de manera material al propietario del gerente general. Por esa razón, esta matriz coincide cuantitativamente con `AUTH-RBAC-001` en las capacidades ordinarias actuales, pero declara una frontera contractual obligatoria.

`gerente_general` **no recibe ni podrá recibir por equivalencia, permiso amplio o inferencia** capacidades como:

- administrar propietarios;
- conceder o retirar autoridad equivalente a propietario;
- modificar la arquitectura del modelo de autorización;
- crear, alterar o revocar mecanismos de recuperación de seguridad;
- desactivar, ocultar o debilitar auditoría;
- modificar procesos técnicos de `service_role`;
- entregar credenciales, secretos o acceso técnico privilegiado;
- alterar el aislamiento de APP-REVIEW, demo o pruebas;
- asumir identidad real de otro actor;
- ejecutar acciones destructivas que una versión futura clasifique como reservadas de propietario.

Los permisos legacy amplios retirados o bloqueados no pueden utilizarse para reconstruir esas facultades. Cuando el catálogo incorpore capacidades atómicas de gobierno propietario, la regla inicial para `gerente_general` será:

```text
CAPACIDAD RESERVADA DE PROPIETARIO
+ role = gerente_general
= NO ASIGNAR
```

Cualquier excepción futura requeriría una decisión canónica expresa que modifique esta matriz y la política de gobierno; no podrá aparecer por migración, compatibilidad legacy ni asignación genérica.

Hasta que esas claves existan, las funciones reservadas permanecen denegadas, aunque alguna ruta legacy todavía las permita físicamente. La fase de implementación deberá retirar esos bypasses y cerrar la divergencia entre matriz documental y comportamiento desplegado.

#### 10. Tratamientos especiales

##### 10.1 AURA

`aura.access` se asigna como capacidad base no territorial, pero permanece **dormida** mientras AURA conserve su estado funcional diferido. La asignación no implica que la aplicación esté implementada ni habilitada para uso productivo.

##### 10.2 Vento Pass

`pass.access` autoriza únicamente la superficie laboral-administrativa de Pass. No autentica al cliente, no concede puntos, no permite redenciones y no expone automáticamente datos de fidelización.

##### 10.3 PULSO

`pulso.access` no se concede al gerente general por el rol base porque es `OPERATIONAL_ONLY`. El componente base de `pulso.delivery.deliveries.override` sí se concede, pero solo puede ejecutarse cuando el gerente general asume un rol operativo compatible y cumple el contexto completo.

##### 10.4 Operación física

Crear lotes, registrar entradas, asignar ubicaciones, crear traslados, registrar retiros, validar stock, realizar conteos y ejecutar transiciones físicas de remisiones continúan siendo capacidades operativas. El gerente general deberá asumir un rol operativo canónico cuando necesite realizarlas.

#### 11. Relación con el estado legacy

Las 148 asignaciones legacy observadas para `gerente_general` no constituyen esta matriz. Durante la implementación deberá construirse una comparación explícita:

```text
MATRIZ LEGACY
vs.
MATRIZ CANÓNICA AUTH-RBAC-002
```

Toda asignación legacy deberá clasificarse como conservar, reemplazar, retirar o migrar. Ningún bypass existente por nombre de rol podrá utilizarse para completar diferencias.

#### 12. Validaciones de integridad

| Validación                                               | Resultado |
| -------------------------------------------------------- | --------- |
| Permisos canónicos evaluados                             | 112       |
| Permisos omitidos                                        | 0         |
| Permisos duplicados                                      | 0         |
| Claves de permiso con concesión base                     | 99        |
| Capacidades directas                                     | 94        |
| Capacidades de doble condición                           | 5         |
| Capacidades exclusivamente operativas sin concesión base | 13        |
| Wildcards                                                | 0         |
| Bypasses por nombre de rol                               | 0         |
| Permisos legacy reincorporados                           | 0         |
| Acceso automático a APP-REVIEW                           | 0         |

#### 13. Impacto sobre tareas posteriores

- `AUTH-RBAC-003` deberá definir al gerente de sede con alcance territorial limitado y no podrá copiar esta matriz global.
- `AUTH-RBAC-008` a `AUTH-RBAC-019` definirán los roles que pueden conceder los 13 permisos exclusivamente operativos y los carriles operativos de permisos híbridos.
- `AUTH-RBAC-020` a `AUTH-RBAC-022` podrán añadir excepciones o denegaciones sin modificar esta matriz de rol.
- `AUTH-RBAC-024` deberá convertir esta definición en dataset canónico versionado sin establecer herencia automática desde propietario.
- `AUTH-RBAC-027` deberá comprobar que ninguna concesión base produzca acceso operativo global accidental.
- `AUTH-RBAC-028` deberá comprobar que las 94 capacidades administrativas directas no dependan de turno ni check-in.
- Toda versión futura del catálogo que incorpore capacidades reservadas de propietario deberá revisar expresamente `AUTH-RBAC-001` y mantenerlas no asignadas en `AUTH-RBAC-002` salvo decisión canónica posterior.

#### 14. Criterios de aprobación

AUTH-RBAC-002 podrá aprobarse cuando se acepte expresamente que:

- el gerente general recibe 99 claves de permiso con concesión base explícita y no un wildcard;
- 94 capacidades pueden autorizarse por el carril base;
- cinco capacidades exigen simultáneamente contexto operativo;
- 13 capacidades operativas no se conceden por el rol gerente_general;
- las 99 concesiones actuales fueron evaluadas independientemente y no heredadas del propietario;
- la coincidencia cuantitativa se explica porque el catálogo actual todavía no contiene capacidades atómicas reservadas de propietario;
- toda futura capacidad reservada de propietario se denegará inicialmente a gerente_general;
- gerente_general no administra propietarios, recuperación de seguridad, service role, secretos ni aislamiento técnico;
- los alcances especiales no se convierten silenciosamente en globales;
- APP-REVIEW y entornos aislados quedan excluidos;
- no se reactivan permisos legacy amplios;
- no se implementa todavía ningún cambio físico.

#### 15. Estado final de la propuesta

| Tarea         | Estado      |
| ------------- | ----------- |
| AUTH-RBAC-001 | APROBADA    |
| AUTH-RBAC-002 | APROBADA    |
| AUTH-RBAC-003 | NO INICIADA |

No se avanza a AUTH-RBAC-003 hasta recibir aprobación explícita.


### ✅ AUTH-RBAC-003 — Crear matriz de gerente

#### 1. Identificación de la tarea

| Campo                     | Valor                                                              |
| ------------------------- | ------------------------------------------------------------------ |
| Bloque                    | BLOQUE D — Matrices canónicas de roles, excepciones y dispositivos |
| Tarea                     | AUTH-RBAC-003 — Crear matriz de gerente                            |
| Estado                    | **APROBADA**                                                       |
| Naturaleza                | Definición documental de matriz base territorial                   |
| Implementación física     | No incluida                                                        |
| Catálogo evaluado         | 112 permisos canónicos vigentes                                    |
| Tarea anterior vigente    | AUTH-RBAC-002 — Crear matriz de gerente_general                    |
| Tarea posterior reservada | AUTH-RBAC-004 — Crear matriz de supervisor                         |

Esta tarea no modifica Supabase, migraciones, tablas, RLS, RPC, aplicaciones, repositorios ni datasets físicos. La aplicación posterior deberá realizarse mediante los datasets canónicos de AUTH-RBAC-024 y las migraciones versionadas del BLOQUE R en `vento-shell`.

#### 2. Objetivo

Definir, permiso por permiso, qué capacidades del catálogo vigente recibe el rol base `gerente`, limitándolas a la administración integral de una o varias sedes expresamente asignadas, sin convertir la sede primaria o seleccionada en autorización, sin alcance organizacional global y sin acceso operativo automático.

#### 3. Decisión principal

`gerente` representa administración integral de sede. Su autoridad nace de la combinación entre permiso base explícito, cobertura administrativa activa y territorio real del recurso.

```text
GERENTE
+ PERMISO BASE EXPLÍCITO
+ SEDE O ÁREA ASIGNADA
+ RECURSO DENTRO DE ESA COBERTURA
= AUTORIZACIÓN ADMINISTRATIVA LOCAL POSIBLE
```

No se admite:

```text
gerente = todas las sedes
gerente = gerente_general
gerente = permiso global
gerente = sede seleccionada como autorización
gerente = operación sin turno
gerente = administración de seguridad
gerente = acceso automático a APP-REVIEW
```

Una asignación activa en `employee_sites` habilita cobertura potencial, pero no concede permisos. La sede del recurso debe estar dentro de esa cobertura y cada capacidad debe existir expresamente en esta matriz.

#### 4. Resultado cuantitativo de la matriz

| Resultado                            | Cantidad | Efecto                                                                                                                     |
| ------------------------------------ | -------: | -------------------------------------------------------------------------------------------------------------------------- |
| Capacidades administrativas directas |       80 | Se conceden por el carril base dentro de sedes, áreas o unidades de negocio derivadas de la cobertura asignada.            |
| Componentes base de doble condición  |        5 | Se conceden territorialmente, pero la acción exige además contexto operativo válido.                                       |
| Capacidades no concedidas            |       27 | Permanecen denegadas por defecto por ser operativas, globales, técnicas, de seguridad o ajenas a la responsabilidad local. |
| Total evaluado                       |      112 | Sin omisiones ni duplicados.                                                                                               |

La matriz contiene **85 decisiones de concesión a nivel de clave** y **27 ausencias de concesión**. La ausencia de concesión produce denegación por defecto; no se crean filas `deny` redundantes. Ninguna concesión utiliza alcance `G`.

#### 5. Perfiles de alcance utilizados

| Perfil        | Significado                                                                                                                             |
| ------------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| `NT-APP`      | Entrada a una aplicación. No concede por sí sola acceso a recursos fuera de la cobertura territorial.                                   |
| `AS`          | Todas las sedes laborales activamente asignadas al gerente mediante la fuente canónica de cobertura.                                    |
| `AA`          | Áreas activamente asignadas dentro de sedes autorizadas, cuando el recurso sea realmente de nivel área.                                 |
| `ORG-LOCAL`   | Recurso organizacional exacto vinculado a las unidades de negocio servidas por las sedes AS. No equivale a organización completa.       |
| `AS-REL`      | Recurso que relaciona varias sedes. Se permite cuando participa una sede AS y la acción cumple la autoridad exigida sobre cada extremo. |
| `AS/AA ∩ CTX` | Componente base local que solo produce autorización final al intersectarse con turno, check-in, rol operativo y recurso compatibles.    |

#### 6. Reglas obligatorias de la matriz

1. Cada concesión utiliza una clave canónica exacta; no existen wildcards ni permisos implícitos.
2. `AS` se resuelve desde asignaciones activas de sede y nunca desde `employees.site_id`, la sede primaria o la sede seleccionada.
3. La sede primaria es un valor predeterminado y la sede seleccionada es una preferencia de interfaz; ninguna amplía la autorización.
4. El gerente puede tener una o varias sedes asignadas, pero la unión de esas sedes no constituye alcance global.
5. Ninguna fila de esta matriz utiliza `G`, `TST` ni un tipo de área sin límite superior de sedes.
6. Los recursos no territoriales solo se conceden como `ORG-LOCAL` cuando existe una relación verificable con las unidades de negocio de las sedes asignadas.
7. Una lectura transversal devuelve únicamente la unión de territorios individualmente autorizados.
8. Una mutación relacional exige autorización sobre todos los extremos obligatorios definidos por el contrato del recurso.
9. Los 13 permisos `OPERATIONAL_ONLY` no se insertan en la matriz base de gerente.
10. Los cinco permisos `BASE_AND_OPERATIONAL` reciben solo el componente base local; no se ejecutan sin contexto operativo.
11. Los permisos base no requieren turno ni check-in, pero sí empleado activo, permiso activo, alcance válido y recurso resuelto.
12. Las denegaciones individuales, estructurales, de recurso, de dispositivo o de aislamiento prevalecen sobre esta matriz.
13. APP-REVIEW, demo, pruebas, puntos físicos de marcación y espacios técnicos quedan fuera de la cobertura ordinaria.
14. El gerente no administra propietarios, roles globales, matrices globales, recuperación de seguridad, service role, secretos ni aislamiento técnico.
15. Todo permiso nuevo se deniega hasta que una versión canónica posterior lo evalúe expresamente para este rol.

#### 7. Matriz canónica completa

##### 7.1 SHELL — 1 permisos

| Permiso        | Capacidad humana  | Modalidad   | Decisión para gerente | Alcance aprobado                                                                                       | Condición                                                                                              |
| -------------- | ----------------- | ----------- | --------------------- | ------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------ |
| `shell.access` | Entrar a Vento OS | `BASE_ONLY` | **ASIGNAR**           | NT-APP — acceso a la aplicación. La autorización interna continúa limitada por AS/AA y por el recurso. | Carril base. No requiere turno ni check-in. Entrar a la aplicación no amplía la cobertura territorial. |

##### 7.2 ANIMA — 10 permisos

| Permiso                                     | Capacidad humana                     | Modalidad   | Decisión para gerente | Alcance aprobado                                                                                                 | Condición                                                                                                                           |
| ------------------------------------------- | ------------------------------------ | ----------- | --------------------- | ---------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| `anima.access`                              | Entrar a ANIMA                       | `BASE_ONLY` | **ASIGNAR**           | NT-APP — acceso a la aplicación. La autorización interna continúa limitada por AS/AA y por el recurso.           | Carril base. No requiere turno ni check-in. Entrar a la aplicación no amplía la cobertura territorial.                              |
| `anima.workforce.employee_documents.view`   | Consultar documentos de trabajadores | `BASE_ONLY` | **ASIGNAR**           | AS/AA — trabajadores, turnos, documentos o vacantes vinculados a sedes o áreas activamente asignadas al gerente. | Carril base. No requiere turno ni check-in. La persona o recurso objetivo debe pertenecer a la cobertura administrativa autorizada. |
| `anima.workforce.employee_documents.upload` | Cargar documentos de trabajadores    | `BASE_ONLY` | **ASIGNAR**           | AS/AA — trabajadores, turnos, documentos o vacantes vinculados a sedes o áreas activamente asignadas al gerente. | Carril base. No requiere turno ni check-in. La persona o recurso objetivo debe pertenecer a la cobertura administrativa autorizada. |
| `anima.workforce.employee_documents.delete` | Eliminar documentos de trabajadores  | `BASE_ONLY` | **ASIGNAR**           | AS/AA — trabajadores, turnos, documentos o vacantes vinculados a sedes o áreas activamente asignadas al gerente. | Carril base. No requiere turno ni check-in. La persona o recurso objetivo debe pertenecer a la cobertura administrativa autorizada. |
| `anima.workforce.employee_photos.upload`    | Cargar fotografías de trabajadores   | `BASE_ONLY` | **ASIGNAR**           | AS/AA — trabajadores, turnos, documentos o vacantes vinculados a sedes o áreas activamente asignadas al gerente. | Carril base. No requiere turno ni check-in. La persona o recurso objetivo debe pertenecer a la cobertura administrativa autorizada. |
| `anima.workforce.team_members.view`         | Consultar integrantes del equipo     | `BASE_ONLY` | **ASIGNAR**           | AS/AA — trabajadores, turnos, documentos o vacantes vinculados a sedes o áreas activamente asignadas al gerente. | Carril base. No requiere turno ni check-in. La persona o recurso objetivo debe pertenecer a la cobertura administrativa autorizada. |
| `anima.workforce.staff_invitations.create`  | Invitar trabajadores                 | `BASE_ONLY` | **ASIGNAR**           | AS/AA — trabajadores, turnos, documentos o vacantes vinculados a sedes o áreas activamente asignadas al gerente. | Carril base. No requiere turno ni check-in. La persona o recurso objetivo debe pertenecer a la cobertura administrativa autorizada. |
| `anima.attendance.shifts.create`            | Crear turnos                         | `BASE_ONLY` | **ASIGNAR**           | AS/AA — trabajadores, turnos, documentos o vacantes vinculados a sedes o áreas activamente asignadas al gerente. | Carril base. No requiere turno ni check-in. La persona o recurso objetivo debe pertenecer a la cobertura administrativa autorizada. |
| `anima.attendance.shifts.update`            | Actualizar turnos                    | `BASE_ONLY` | **ASIGNAR**           | AS/AA — trabajadores, turnos, documentos o vacantes vinculados a sedes o áreas activamente asignadas al gerente. | Carril base. No requiere turno ni check-in. La persona o recurso objetivo debe pertenecer a la cobertura administrativa autorizada. |
| `anima.attendance.shifts.cancel`            | Cancelar turnos                      | `BASE_ONLY` | **ASIGNAR**           | AS/AA — trabajadores, turnos, documentos o vacantes vinculados a sedes o áreas activamente asignadas al gerente. | Carril base. No requiere turno ni check-in. La persona o recurso objetivo debe pertenecer a la cobertura administrativa autorizada. |

##### 7.3 AURA — 1 permisos

| Permiso       | Capacidad humana | Modalidad   | Decisión para gerente | Alcance aprobado                                                  | Condición                                                                                            |
| ------------- | ---------------- | ----------- | --------------------- | ----------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- |
| `aura.access` | Entrar a AURA    | `BASE_ONLY` | **NO ASIGNAR**        | — Denegación por defecto; no se crea concesión en la matriz base. | AURA es administrativa diferida y no pertenece a la responsabilidad natural de una gerencia de sede. |

##### 7.4 FOGO — 6 permisos

| Permiso                            | Capacidad humana                | Modalidad             | Decisión para gerente | Alcance aprobado                                                                                                                         | Condición                                                                                                                      |
| ---------------------------------- | ------------------------------- | --------------------- | --------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| `fogo.access`                      | Entrar a FOGO                   | `BASE_OR_OPERATIONAL` | **ASIGNAR**           | NT-APP — acceso a la aplicación. La autorización interna continúa limitada por AS/AA y por el recurso.                                   | Carril base. No requiere turno ni check-in. Entrar a la aplicación no amplía la cobertura territorial.                         |
| `fogo.production.batches.view`     | Consultar lotes de producción   | `BASE_OR_OPERATIONAL` | **ASIGNAR**           | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados. | El gerente usa el carril base; el carril operativo continúa independiente.                                                     |
| `fogo.production.batches.create`   | Crear lotes de producción       | `OPERATIONAL_ONLY`    | **NO ASIGNAR**        | — Denegación por defecto en la matriz base; solo matriz operativa compatible.                                                            | El rol gerente no concede esta capacidad. Requiere rol operativo, turno y prerrequisitos canónicos.                            |
| `fogo.production.orders.view`      | Consultar órdenes de producción | `BASE_OR_OPERATIONAL` | **ASIGNAR**           | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados. | El gerente usa el carril base; el carril operativo continúa independiente.                                                     |
| `fogo.production.recipe_book.view` | Consultar recetario operativo   | `OPERATIONAL_ONLY`    | **NO ASIGNAR**        | — Denegación por defecto en la matriz base; solo matriz operativa compatible.                                                            | El rol gerente no concede esta capacidad. Requiere rol operativo, turno y prerrequisitos canónicos.                            |
| `fogo.production.recipes.view`     | Consultar recetas               | `BASE_ONLY`           | **NO ASIGNAR**        | — Denegación por defecto; no se crea concesión en la matriz base.                                                                        | Las definiciones estructurales y sensibles de recetas son organizacionales; la supervisión local se cubre con lotes y órdenes. |

##### 7.5 NEXO — 63 permisos

| Permiso                                      | Capacidad humana                         | Modalidad              | Decisión para gerente       | Alcance aprobado                                                                                                                                          | Condición                                                                                                                                  |
| -------------------------------------------- | ---------------------------------------- | ---------------------- | --------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| `nexo.access`                                | Entrar a NEXO                            | `BASE_OR_OPERATIONAL`  | **ASIGNAR**                 | NT-APP — acceso a la aplicación. La autorización interna continúa limitada por AS/AA y por el recurso.                                                    | Carril base. No requiere turno ni check-in. Entrar a la aplicación no amplía la cobertura territorial.                                     |
| `nexo.catalog.products.view`                 | Consultar productos                      | `BASE_OR_OPERATIONAL`  | **ASIGNAR**                 | ORG-LOCAL — recurso organizacional exacto vinculado a las unidades de negocio servidas por las sedes AS; sin acceso al resto de la organización.          | Carril base. Solo lectura. La relación con la unidad o negocio debe resolverse desde el recurso; no se inventa desde la sede seleccionada. |
| `nexo.catalog.products.create`               | Crear productos                          | `BASE_ONLY`            | **NO ASIGNAR**              | — Denegación por defecto; no se crea concesión en la matriz base.                                                                                         | Crear productos altera el catálogo organizacional compartido y no es configuración local de sede.                                          |
| `nexo.catalog.presentations.view`            | Consultar presentaciones                 | `BASE_OR_OPERATIONAL`  | **ASIGNAR**                 | ORG-LOCAL — recurso organizacional exacto vinculado a las unidades de negocio servidas por las sedes AS; sin acceso al resto de la organización.          | Carril base. Solo lectura. La relación con la unidad o negocio debe resolverse desde el recurso; no se inventa desde la sede seleccionada. |
| `nexo.catalog.request_policies.view`         | Consultar políticas de solicitud         | `BASE_OR_OPERATIONAL`  | **ASIGNAR**                 | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados.                  | El gerente usa el carril base; el carril operativo continúa independiente.                                                                 |
| `nexo.catalog.categories.view`               | Consultar categorías                     | `BASE_OR_OPERATIONAL`  | **ASIGNAR**                 | ORG-LOCAL — recurso organizacional exacto vinculado a las unidades de negocio servidas por las sedes AS; sin acceso al resto de la organización.          | Carril base. Solo lectura. La relación con la unidad o negocio debe resolverse desde el recurso; no se inventa desde la sede seleccionada. |
| `nexo.catalog.units.view`                    | Consultar unidades                       | `BASE_OR_OPERATIONAL`  | **ASIGNAR**                 | ORG-LOCAL — recurso organizacional exacto vinculado a las unidades de negocio servidas por las sedes AS; sin acceso al resto de la organización.          | Carril base. Solo lectura. La relación con la unidad o negocio debe resolverse desde el recurso; no se inventa desde la sede seleccionada. |
| `nexo.assets.items.view`                     | Consultar activos                        | `BASE_OR_OPERATIONAL`  | **ASIGNAR**                 | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados.                  | El gerente usa el carril base; el carril operativo continúa independiente.                                                                 |
| `nexo.assets.items.create`                   | Crear activos                            | `BASE_ONLY`            | **ASIGNAR**                 | AS/SS/AA/SA explícitos — configuración o recurso local de una sede o área asignada; sin G, TST ni incorporación automática de sedes futuras.              | Carril base. Solo sobre configuración local. No modifica catálogos, políticas ni plantillas globales.                                      |
| `nexo.assets.groups.view`                    | Consultar grupos de activos              | `BASE_OR_OPERATIONAL`  | **ASIGNAR**                 | ORG-LOCAL — recurso organizacional exacto vinculado a las unidades de negocio servidas por las sedes AS; sin acceso al resto de la organización.          | Carril base. Solo lectura. La relación con la unidad o negocio debe resolverse desde el recurso; no se inventa desde la sede seleccionada. |
| `nexo.assets.counts.view`                    | Consultar conteos de activos             | `BASE_OR_OPERATIONAL`  | **ASIGNAR**                 | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados.                  | El gerente usa el carril base; el carril operativo continúa independiente.                                                                 |
| `nexo.inventory.adjustments.view`            | Consultar ajustes de inventario          | `BASE_OR_OPERATIONAL`  | **ASIGNAR**                 | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados.                  | El gerente usa el carril base; el carril operativo continúa independiente.                                                                 |
| `nexo.inventory.adjustments.register`        | Registrar ajustes de inventario          | `BASE_AND_OPERATIONAL` | **ASIGNAR COMPONENTE BASE** | AS/AA ∩ CTX — componente base limitado a sedes o áreas asignadas; ejecución sobre un recurso concreto dentro del contexto operativo válido.               | La concesión base no ejecuta la acción. Requiere turno, check-in, rol operativo compatible y territorio coincidente.                       |
| `nexo.inventory.entries.view`                | Consultar entradas de inventario         | `BASE_OR_OPERATIONAL`  | **ASIGNAR**                 | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados.                  | El gerente usa el carril base; el carril operativo continúa independiente.                                                                 |
| `nexo.inventory.entries.register`            | Registrar entradas de inventario         | `OPERATIONAL_ONLY`     | **NO ASIGNAR**              | — Denegación por defecto en la matriz base; solo matriz operativa compatible.                                                                             | El rol gerente no concede esta capacidad. Requiere rol operativo, turno y prerrequisitos canónicos.                                        |
| `nexo.inventory.entries.override`            | Registrar entradas excepcionales         | `BASE_AND_OPERATIONAL` | **ASIGNAR COMPONENTE BASE** | AS/AA ∩ CTX — componente base limitado a sedes o áreas asignadas; ejecución sobre un recurso concreto dentro del contexto operativo válido.               | La concesión base no ejecuta la acción. Requiere turno, check-in, rol operativo compatible y territorio coincidente.                       |
| `nexo.inventory.locations.view`              | Consultar ubicaciones de inventario      | `BASE_OR_OPERATIONAL`  | **ASIGNAR**                 | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados.                  | El gerente usa el carril base; el carril operativo continúa independiente.                                                                 |
| `nexo.inventory.location_assignments.assign` | Asignar ubicaciones de inventario        | `OPERATIONAL_ONLY`     | **NO ASIGNAR**              | — Denegación por defecto en la matriz base; solo matriz operativa compatible.                                                                             | El rol gerente no concede esta capacidad. Requiere rol operativo, turno y prerrequisitos canónicos.                                        |
| `nexo.inventory.location_catalog.update`     | Actualizar el catálogo de una ubicación  | `BASE_ONLY`            | **ASIGNAR**                 | AS/SS/AA/SA explícitos — configuración o recurso local de una sede o área asignada; sin G, TST ni incorporación automática de sedes futuras.              | Carril base. Solo sobre configuración local. No modifica catálogos, políticas ni plantillas globales.                                      |
| `nexo.inventory.lpns.view`                   | Consultar LPN                            | `BASE_OR_OPERATIONAL`  | **ASIGNAR**                 | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados.                  | El gerente usa el carril base; el carril operativo continúa independiente.                                                                 |
| `nexo.inventory.movements.view`              | Consultar movimientos de inventario      | `BASE_OR_OPERATIONAL`  | **ASIGNAR**                 | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados.                  | El gerente usa el carril base; el carril operativo continúa independiente.                                                                 |
| `nexo.inventory.stock.view`                  | Consultar stock                          | `BASE_OR_OPERATIONAL`  | **ASIGNAR**                 | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados.                  | El gerente usa el carril base; el carril operativo continúa independiente.                                                                 |
| `nexo.inventory.production_batches.view`     | Consultar lotes vinculados al inventario | `BASE_OR_OPERATIONAL`  | **ASIGNAR**                 | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados.                  | El gerente usa el carril base; el carril operativo continúa independiente.                                                                 |
| `nexo.inventory.transfers.view`              | Consultar traslados de inventario        | `BASE_OR_OPERATIONAL`  | **ASIGNAR**                 | AS-REL — recursos relacionales que involucren al menos una sede AS; toda mutación exige autoridad sobre los lados obligatorios definidos por el contrato. | Carril base. La visibilidad de un extremo no concede autoridad general sobre el otro ni sobre sedes no asignadas.                          |
| `nexo.inventory.transfers.create`            | Crear traslados de inventario            | `OPERATIONAL_ONLY`     | **NO ASIGNAR**              | — Denegación por defecto en la matriz base; solo matriz operativa compatible.                                                                             | El rol gerente no concede esta capacidad. Requiere rol operativo, turno y prerrequisitos canónicos.                                        |
| `nexo.inventory.withdrawals.view`            | Consultar retiros de inventario          | `BASE_OR_OPERATIONAL`  | **ASIGNAR**                 | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados.                  | El gerente usa el carril base; el carril operativo continúa independiente.                                                                 |
| `nexo.inventory.withdrawals.register`        | Registrar retiros de inventario          | `OPERATIONAL_ONLY`     | **NO ASIGNAR**              | — Denegación por defecto en la matriz base; solo matriz operativa compatible.                                                                             | El rol gerente no concede esta capacidad. Requiere rol operativo, turno y prerrequisitos canónicos.                                        |
| `nexo.inventory.zones.view`                  | Consultar zonas de almacenamiento        | `BASE_OR_OPERATIONAL`  | **ASIGNAR**                 | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados.                  | El gerente usa el carril base; el carril operativo continúa independiente.                                                                 |
| `nexo.inventory.storage_positions.view`      | Consultar posiciones de almacenamiento   | `BASE_OR_OPERATIONAL`  | **ASIGNAR**                 | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados.                  | El gerente usa el carril base; el carril operativo continúa independiente.                                                                 |
| `nexo.inventory.warehouse_operations.view`   | Consultar operaciones de bodega          | `BASE_OR_OPERATIONAL`  | **ASIGNAR**                 | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados.                  | El gerente usa el carril base; el carril operativo continúa independiente.                                                                 |
| `nexo.inventory.stock_validations.perform`   | Ejecutar validaciones de inventario      | `OPERATIONAL_ONLY`     | **NO ASIGNAR**              | — Denegación por defecto en la matriz base; solo matriz operativa compatible.                                                                             | El rol gerente no concede esta capacidad. Requiere rol operativo, turno y prerrequisitos canónicos.                                        |
| `nexo.inventory.stock_counts.view`           | Consultar conteos de inventario          | `BASE_OR_OPERATIONAL`  | **ASIGNAR**                 | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados.                  | El gerente usa el carril base; el carril operativo continúa independiente.                                                                 |
| `nexo.inventory.stock_counts.perform`        | Ejecutar conteos de inventario           | `OPERATIONAL_ONLY`     | **NO ASIGNAR**              | — Denegación por defecto en la matriz base; solo matriz operativa compatible.                                                                             | El rol gerente no concede esta capacidad. Requiere rol operativo, turno y prerrequisitos canónicos.                                        |
| `nexo.inventory.initial_counts.view`         | Consultar conteos iniciales              | `BASE_OR_OPERATIONAL`  | **ASIGNAR**                 | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados.                  | El gerente usa el carril base; el carril operativo continúa independiente.                                                                 |
| `nexo.inventory.remissions.view`             | Consultar remisiones                     | `BASE_OR_OPERATIONAL`  | **ASIGNAR**                 | AS-REL — recursos relacionales que involucren al menos una sede AS; toda mutación exige autoridad sobre los lados obligatorios definidos por el contrato. | Carril base. La visibilidad de un extremo no concede autoridad general sobre el otro ni sobre sedes no asignadas.                          |
| `nexo.inventory.remissions.update`           | Actualizar remisiones                    | `BASE_OR_OPERATIONAL`  | **ASIGNAR**                 | AS-REL — recursos relacionales que involucren al menos una sede AS; toda mutación exige autoridad sobre los lados obligatorios definidos por el contrato. | Carril base. La visibilidad de un extremo no concede autoridad general sobre el otro ni sobre sedes no asignadas.                          |
| `nexo.inventory.remissions.request`          | Solicitar remisiones                     | `OPERATIONAL_ONLY`     | **NO ASIGNAR**              | — Denegación por defecto en la matriz base; solo matriz operativa compatible.                                                                             | El rol gerente no concede esta capacidad. Requiere rol operativo, turno y prerrequisitos canónicos.                                        |
| `nexo.inventory.remissions.prepare`          | Preparar remisiones                      | `OPERATIONAL_ONLY`     | **NO ASIGNAR**              | — Denegación por defecto en la matriz base; solo matriz operativa compatible.                                                                             | El rol gerente no concede esta capacidad. Requiere rol operativo, turno y prerrequisitos canónicos.                                        |
| `nexo.inventory.remissions.dispatch`         | Despachar remisiones                     | `OPERATIONAL_ONLY`     | **NO ASIGNAR**              | — Denegación por defecto en la matriz base; solo matriz operativa compatible.                                                                             | El rol gerente no concede esta capacidad. Requiere rol operativo, turno y prerrequisitos canónicos.                                        |
| `nexo.inventory.remissions.receive`          | Recibir remisiones                       | `OPERATIONAL_ONLY`     | **NO ASIGNAR**              | — Denegación por defecto en la matriz base; solo matriz operativa compatible.                                                                             | El rol gerente no concede esta capacidad. Requiere rol operativo, turno y prerrequisitos canónicos.                                        |
| `nexo.inventory.remissions.cancel`           | Cancelar remisiones                      | `BASE_OR_OPERATIONAL`  | **ASIGNAR**                 | AS-REL — recursos relacionales que involucren al menos una sede AS; toda mutación exige autoridad sobre los lados obligatorios definidos por el contrato. | Carril base. La visibilidad de un extremo no concede autoridad general sobre el otro ni sobre sedes no asignadas.                          |
| `nexo.logistics.operations_board.view`       | Consultar tablero logístico              | `BASE_OR_OPERATIONAL`  | **ASIGNAR**                 | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados.                  | El gerente usa el carril base; el carril operativo continúa independiente.                                                                 |
| `nexo.logistics.operations.view`             | Consultar operaciones logísticas         | `BASE_OR_OPERATIONAL`  | **ASIGNAR**                 | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados.                  | El gerente usa el carril base; el carril operativo continúa independiente.                                                                 |
| `nexo.logistics.driver_operations.view`      | Consultar operaciones de conductores     | `BASE_OR_OPERATIONAL`  | **ASIGNAR**                 | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados.                  | El gerente usa el carril base; el carril operativo continúa independiente.                                                                 |
| `nexo.logistics.fulfillment.view`            | Consultar cumplimiento logístico         | `BASE_OR_OPERATIONAL`  | **ASIGNAR**                 | AS-REL — recursos relacionales que involucren al menos una sede AS; toda mutación exige autoridad sobre los lados obligatorios definidos por el contrato. | Carril base. La visibilidad de un extremo no concede autoridad general sobre el otro ni sobre sedes no asignadas.                          |
| `nexo.logistics.fulfillment_routes.view`     | Consultar rutas de cumplimiento          | `BASE_OR_OPERATIONAL`  | **ASIGNAR**                 | AS-REL — recursos relacionales que involucren al menos una sede AS; toda mutación exige autoridad sobre los lados obligatorios definidos por el contrato. | Carril base. La visibilidad de un extremo no concede autoridad general sobre el otro ni sobre sedes no asignadas.                          |
| `nexo.logistics.supply_routes.view`          | Consultar rutas de abastecimiento        | `BASE_OR_OPERATIONAL`  | **ASIGNAR**                 | AS-REL — recursos relacionales que involucren al menos una sede AS; toda mutación exige autoridad sobre los lados obligatorios definidos por el contrato. | Carril base. La visibilidad de un extremo no concede autoridad general sobre el otro ni sobre sedes no asignadas.                          |
| `nexo.finance.internal_invoices.view`        | Consultar facturas internas              | `BASE_ONLY`            | **ASIGNAR**                 | AS-REL — recursos relacionales que involucren al menos una sede AS; toda mutación exige autoridad sobre los lados obligatorios definidos por el contrato. | Carril base. La visibilidad de un extremo no concede autoridad general sobre el otro ni sobre sedes no asignadas.                          |
| `nexo.finance.internal_invoices.generate`    | Generar facturas internas                | `BASE_ONLY`            | **NO ASIGNAR**              | — Denegación por defecto; no se crea concesión en la matriz base.                                                                                         | Generar facturas internas no se concede por defecto a una gerencia de sede.                                                                |
| `nexo.finance.internal_invoices.issue`       | Emitir facturas internas                 | `BASE_ONLY`            | **NO ASIGNAR**              | — Denegación por defecto; no se crea concesión en la matriz base.                                                                                         | Emitir facturas internas no se concede por defecto a una gerencia de sede.                                                                 |
| `nexo.finance.internal_invoices.cancel`      | Cancelar facturas internas               | `BASE_ONLY`            | **NO ASIGNAR**              | — Denegación por defecto; no se crea concesión en la matriz base.                                                                                         | Cancelar facturas internas no se concede por defecto a una gerencia de sede.                                                               |
| `nexo.finance.internal_invoice_amounts.view` | Consultar valores de facturas internas   | `BASE_ONLY`            | **ASIGNAR**                 | AS-REL — recursos relacionales que involucren al menos una sede AS; toda mutación exige autoridad sobre los lados obligatorios definidos por el contrato. | Carril base. La visibilidad de un extremo no concede autoridad general sobre el otro ni sobre sedes no asignadas.                          |
| `nexo.finance.internal_prices.view`          | Consultar precios internos               | `BASE_ONLY`            | **ASIGNAR**                 | AS/ORG-LOCAL — información financiera y analítica de sedes asignadas o de sus unidades de negocio exactas; nunca consolidado organizacional global.       | Carril base. Lectura sensible local; mantiene filtros por recurso, período, negocio y sede.                                                |
| `nexo.finance.internal_variances.view`       | Consultar variaciones internas           | `BASE_ONLY`            | **ASIGNAR**                 | AS/ORG-LOCAL — información financiera y analítica de sedes asignadas o de sus unidades de negocio exactas; nunca consolidado organizacional global.       | Carril base. Lectura sensible local; mantiene filtros por recurso, período, negocio y sede.                                                |
| `nexo.finance.internal_variances.approve`    | Aprobar variaciones internas             | `BASE_AND_OPERATIONAL` | **ASIGNAR COMPONENTE BASE** | AS/AA ∩ CTX — componente base limitado a sedes o áreas asignadas; ejecución sobre un recurso concreto dentro del contexto operativo válido.               | La concesión base no ejecuta la acción. Requiere turno, check-in, rol operativo compatible y territorio coincidente.                       |
| `nexo.finance.internal_variances.resolve`    | Resolver variaciones internas            | `BASE_AND_OPERATIONAL` | **ASIGNAR COMPONENTE BASE** | AS/AA ∩ CTX — componente base limitado a sedes o áreas asignadas; ejecución sobre un recurso concreto dentro del contexto operativo válido.               | La concesión base no ejecuta la acción. Requiere turno, check-in, rol operativo compatible y territorio coincidente.                       |
| `nexo.finance.cost_centers.view`             | Consultar centros de costo en NEXO       | `BASE_ONLY`            | **ASIGNAR**                 | AS/ORG-LOCAL — información financiera y analítica de sedes asignadas o de sus unidades de negocio exactas; nunca consolidado organizacional global.       | Carril base. Lectura sensible local; mantiene filtros por recurso, período, negocio y sede.                                                |
| `nexo.analytics.internal_reports.view`       | Consultar reportes internos              | `BASE_ONLY`            | **ASIGNAR**                 | AS/ORG-LOCAL — información financiera y analítica de sedes asignadas o de sus unidades de negocio exactas; nunca consolidado organizacional global.       | Carril base. Lectura sensible local; mantiene filtros por recurso, período, negocio y sede.                                                |
| `nexo.analytics.margin_reports.view`         | Consultar reportes de margen             | `BASE_ONLY`            | **ASIGNAR**                 | AS/ORG-LOCAL — información financiera y analítica de sedes asignadas o de sus unidades de negocio exactas; nunca consolidado organizacional global.       | Carril base. Lectura sensible local; mantiene filtros por recurso, período, negocio y sede.                                                |
| `nexo.printing.templates.update`             | Editar plantillas de impresión           | `BASE_ONLY`            | **ASIGNAR**                 | AS/SS/AA/SA explícitos — configuración o recurso local de una sede o área asignada; sin G, TST ni incorporación automática de sedes futuras.              | Carril base. Solo sobre configuración local. No modifica catálogos, políticas ni plantillas globales.                                      |
| `nexo.printing.jobs.view`                    | Consultar trabajos de impresión          | `BASE_OR_OPERATIONAL`  | **ASIGNAR**                 | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del gerente; excluye APP-REVIEW y territorios aislados.                  | El gerente usa el carril base; el carril operativo continúa independiente.                                                                 |
| `nexo.settings.sites.view`                   | Consultar configuración de sedes         | `BASE_ONLY`            | **ASIGNAR**                 | AS/SS/AA/SA explícitos — configuración o recurso local de una sede o área asignada; sin G, TST ni incorporación automática de sedes futuras.              | Carril base. Solo sobre configuración local. No modifica catálogos, políticas ni plantillas globales.                                      |
| `nexo.settings.remission_policies.view`      | Consultar políticas de remisiones        | `BASE_ONLY`            | **ASIGNAR**                 | AS/SS/AA/SA explícitos — configuración o recurso local de una sede o área asignada; sin G, TST ni incorporación automática de sedes futuras.              | Carril base. Solo sobre configuración local. No modifica catálogos, políticas ni plantillas globales.                                      |

##### 7.6 NUMERA — 6 permisos

| Permiso                                   | Capacidad humana               | Modalidad   | Decisión para gerente | Alcance aprobado                                                                                                                                    | Condición                                                                                              |
| ----------------------------------------- | ------------------------------ | ----------- | --------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `numera.access`                           | Entrar a NUMERA                | `BASE_ONLY` | **ASIGNAR**           | NT-APP — acceso a la aplicación. La autorización interna continúa limitada por AS/AA y por el recurso.                                              | Carril base. No requiere turno ni check-in. Entrar a la aplicación no amplía la cobertura territorial. |
| `numera.finance.cost_centers.view`        | Consultar centros de costo     | `BASE_ONLY` | **ASIGNAR**           | AS/ORG-LOCAL — información financiera y analítica de sedes asignadas o de sus unidades de negocio exactas; nunca consolidado organizacional global. | Carril base. Lectura sensible local; mantiene filtros por recurso, período, negocio y sede.            |
| `numera.finance.expenses.view`            | Consultar gastos               | `BASE_ONLY` | **ASIGNAR**           | AS/ORG-LOCAL — información financiera y analítica de sedes asignadas o de sus unidades de negocio exactas; nunca consolidado organizacional global. | Carril base. Lectura sensible local; mantiene filtros por recurso, período, negocio y sede.            |
| `numera.analytics.break_even.view`        | Consultar punto de equilibrio  | `BASE_ONLY` | **ASIGNAR**           | AS/ORG-LOCAL — información financiera y analítica de sedes asignadas o de sus unidades de negocio exactas; nunca consolidado organizacional global. | Carril base. Lectura sensible local; mantiene filtros por recurso, período, negocio y sede.            |
| `numera.analytics.profitability.view`     | Consultar rentabilidad         | `BASE_ONLY` | **ASIGNAR**           | AS/ORG-LOCAL — información financiera y analítica de sedes asignadas o de sus unidades de negocio exactas; nunca consolidado organizacional global. | Carril base. Lectura sensible local; mantiene filtros por recurso, período, negocio y sede.            |
| `numera.analytics.financial_reports.view` | Consultar reportes financieros | `BASE_ONLY` | **ASIGNAR**           | AS/ORG-LOCAL — información financiera y analítica de sedes asignadas o de sus unidades de negocio exactas; nunca consolidado organizacional global. | Carril base. Lectura sensible local; mantiene filtros por recurso, período, negocio y sede.            |

##### 7.7 ORIGO — 5 permisos

| Permiso                                  | Capacidad humana                  | Modalidad             | Decisión para gerente | Alcance aprobado                                                                                                                                          | Condición                                                                                                                                  |
| ---------------------------------------- | --------------------------------- | --------------------- | --------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| `origo.access`                           | Entrar a ORIGO                    | `BASE_OR_OPERATIONAL` | **ASIGNAR**           | NT-APP — acceso a la aplicación. La autorización interna continúa limitada por AS/AA y por el recurso.                                                    | Carril base. No requiere turno ni check-in. Entrar a la aplicación no amplía la cobertura territorial.                                     |
| `origo.procurement.purchase_orders.view` | Consultar órdenes de compra       | `BASE_OR_OPERATIONAL` | **ASIGNAR**           | AS-REL — recursos relacionales que involucren al menos una sede AS; toda mutación exige autoridad sobre los lados obligatorios definidos por el contrato. | Carril base. La visibilidad de un extremo no concede autoridad general sobre el otro ni sobre sedes no asignadas.                          |
| `origo.procurement.receipts.view`        | Consultar recepciones de compra   | `BASE_OR_OPERATIONAL` | **ASIGNAR**           | AS-REL — recursos relacionales que involucren al menos una sede AS; toda mutación exige autoridad sobre los lados obligatorios definidos por el contrato. | Carril base. La visibilidad de un extremo no concede autoridad general sobre el otro ni sobre sedes no asignadas.                          |
| `origo.procurement.suppliers.view`       | Consultar proveedores             | `BASE_OR_OPERATIONAL` | **ASIGNAR**           | ORG-LOCAL — recurso organizacional exacto vinculado a las unidades de negocio servidas por las sedes AS; sin acceso al resto de la organización.          | Carril base. Solo lectura. La relación con la unidad o negocio debe resolverse desde el recurso; no se inventa desde la sede seleccionada. |
| `origo.catalog.product_reviews.view`     | Consultar revisiones de productos | `BASE_ONLY`           | **ASIGNAR**           | ORG-LOCAL — recurso organizacional exacto vinculado a las unidades de negocio servidas por las sedes AS; sin acceso al resto de la organización.          | Carril base. Solo lectura. La relación con la unidad o negocio debe resolverse desde el recurso; no se inventa desde la sede seleccionada. |

##### 7.8 VENTO PASS — 1 permisos

| Permiso       | Capacidad humana    | Modalidad   | Decisión para gerente | Alcance aprobado                                                  | Condición                                                                                       |
| ------------- | ------------------- | ----------- | --------------------- | ----------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- |
| `pass.access` | Entrar a Vento Pass | `BASE_ONLY` | **NO ASIGNAR**        | — Denegación por defecto; no se crea concesión en la matriz base. | La superficie administrativa de Vento Pass no forma parte de la matriz base de gerente de sede. |

##### 7.9 PULSO — 2 permisos

| Permiso                              | Capacidad humana                        | Modalidad              | Decisión para gerente       | Alcance aprobado                                                                                                                                | Condición                                                                                                                |
| ------------------------------------ | --------------------------------------- | ---------------------- | --------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| `pulso.access`                       | Entrar a PULSO                          | `OPERATIONAL_ONLY`     | **NO ASIGNAR**              | — Denegación por defecto en la matriz base; solo matriz operativa compatible.                                                                   | El rol gerente no concede esta capacidad. Requiere rol operativo, turno y prerrequisitos canónicos.                      |
| `pulso.delivery.deliveries.override` | Confirmar entregas de forma excepcional | `BASE_AND_OPERATIONAL` | **ASIGNAR COMPONENTE BASE** | AS-COMERCIAL ∩ CTX — componente base limitado a sedes comerciales asignadas; ejecución solo dentro del contexto operativo válido de la entrega. | La concesión base no ejecuta la acción. Requiere turno, check-in, rol operativo compatible, recurso y sede coincidentes. |

##### 7.10 VISO — 17 permisos

| Permiso                                       | Capacidad humana                          | Modalidad   | Decisión para gerente | Alcance aprobado                                                                                                                                    | Condición                                                                                                                                  |
| --------------------------------------------- | ----------------------------------------- | ----------- | --------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| `viso.access`                                 | Entrar a VISO                             | `BASE_ONLY` | **ASIGNAR**           | NT-APP — acceso a la aplicación. La autorización interna continúa limitada por AS/AA y por el recurso.                                              | Carril base. No requiere turno ni check-in. Entrar a la aplicación no amplía la cobertura territorial.                                     |
| `viso.platform.app_updates.view`              | Consultar actualizaciones de aplicaciones | `BASE_ONLY` | **NO ASIGNAR**        | — Denegación por defecto; no se crea concesión en la matriz base.                                                                                   | Las actualizaciones de plataforma son información técnica transversal, no administración local.                                            |
| `viso.organization.businesses.view`           | Consultar empresas y unidades de negocio  | `BASE_ONLY` | **ASIGNAR**           | ORG-LOCAL — recurso organizacional exacto vinculado a las unidades de negocio servidas por las sedes AS; sin acceso al resto de la organización.    | Carril base. Solo lectura. La relación con la unidad o negocio debe resolverse desde el recurso; no se inventa desde la sede seleccionada. |
| `viso.workforce.employees.view`               | Consultar trabajadores                    | `BASE_ONLY` | **ASIGNAR**           | AS/AA — trabajadores, turnos, documentos o vacantes vinculados a sedes o áreas activamente asignadas al gerente.                                    | Carril base. No requiere turno ni check-in. La persona o recurso objetivo debe pertenecer a la cobertura administrativa autorizada.        |
| `viso.workforce.staff_calendar.view`          | Consultar calendario del personal         | `BASE_ONLY` | **ASIGNAR**           | AS/AA — trabajadores, turnos, documentos o vacantes vinculados a sedes o áreas activamente asignadas al gerente.                                    | Carril base. No requiere turno ni check-in. La persona o recurso objetivo debe pertenecer a la cobertura administrativa autorizada.        |
| `viso.workforce.schedules.view`               | Consultar programación de turnos          | `BASE_ONLY` | **ASIGNAR**           | AS/AA — trabajadores, turnos, documentos o vacantes vinculados a sedes o áreas activamente asignadas al gerente.                                    | Carril base. No requiere turno ni check-in. La persona o recurso objetivo debe pertenecer a la cobertura administrativa autorizada.        |
| `viso.workforce.vacancies.view`               | Consultar vacantes                        | `BASE_ONLY` | **ASIGNAR**           | AS/AA — trabajadores, turnos, documentos o vacantes vinculados a sedes o áreas activamente asignadas al gerente.                                    | Carril base. No requiere turno ni check-in. La persona o recurso objetivo debe pertenecer a la cobertura administrativa autorizada.        |
| `viso.authorization.context_simulations.view` | Consultar simulaciones de autorización    | `BASE_ONLY` | **NO ASIGNAR**        | — Denegación por defecto; no se crea concesión en la matriz base.                                                                                   | La simulación de autorización es una capacidad sensible de seguridad y no se concede por el rol gerente.                                   |
| `viso.authorization.audit_logs.view`          | Consultar auditoría de autorización       | `BASE_ONLY` | **NO ASIGNAR**        | — Denegación por defecto; no se crea concesión en la matriz base.                                                                                   | La auditoría de autorización es una capacidad sensible de seguridad y no una función administrativa local ordinaria.                       |
| `viso.catalog.commercial_categories.view`     | Consultar categorías comerciales          | `BASE_ONLY` | **ASIGNAR**           | ORG-LOCAL — recurso organizacional exacto vinculado a las unidades de negocio servidas por las sedes AS; sin acceso al resto de la organización.    | Carril base. Solo lectura. La relación con la unidad o negocio debe resolverse desde el recurso; no se inventa desde la sede seleccionada. |
| `viso.content.content_blocks.view`            | Consultar bloques de contenido            | `BASE_ONLY` | **NO ASIGNAR**        | — Denegación por defecto; no se crea concesión en la matriz base.                                                                                   | Los bloques de contenido son un recurso transversal de contenido; requieren responsabilidad funcional adicional.                           |
| `viso.content.menu.view`                      | Consultar menú                            | `BASE_ONLY` | **ASIGNAR**           | ORG-LOCAL — recurso organizacional exacto vinculado a las unidades de negocio servidas por las sedes AS; sin acceso al resto de la organización.    | Carril base. Solo lectura. La relación con la unidad o negocio debe resolverse desde el recurso; no se inventa desde la sede seleccionada. |
| `viso.content.website_content.view`           | Consultar contenido del sitio web         | `BASE_ONLY` | **NO ASIGNAR**        | — Denegación por defecto; no se crea concesión en la matriz base.                                                                                   | El contenido web es un recurso transversal; requiere responsabilidad funcional adicional.                                                  |
| `viso.finance.accounting.view`                | Consultar información contable            | `BASE_ONLY` | **ASIGNAR**           | AS/ORG-LOCAL — información financiera y analítica de sedes asignadas o de sus unidades de negocio exactas; nunca consolidado organizacional global. | Carril base. Lectura sensible local; mantiene filtros por recurso, período, negocio y sede.                                                |
| `viso.delivery.rates.view`                    | Consultar tarifas de entrega              | `BASE_ONLY` | **ASIGNAR**           | AS/SS/AA/SA explícitos — configuración o recurso local de una sede o área asignada; sin G, TST ni incorporación automática de sedes futuras.        | Carril base. Solo sobre configuración local. No modifica catálogos, políticas ni plantillas globales.                                      |
| `viso.loyalty.products.view`                  | Consultar productos de fidelización       | `BASE_ONLY` | **NO ASIGNAR**        | — Denegación por defecto; no se crea concesión en la matriz base.                                                                                   | El catálogo de fidelización pertenece al dominio cliente y requiere responsabilidad funcional adicional.                                   |
| `viso.loyalty.customers.view`                 | Consultar clientes de fidelización        | `BASE_ONLY` | **NO ASIGNAR**        | — Denegación por defecto; no se crea concesión en la matriz base.                                                                                   | Los datos de clientes de fidelización son sensibles y no se conceden por defecto a una gerencia de sede.                                   |

#### 8. Resumen por aplicación

| Aplicación |   Total | Directas por carril base | Componente base de doble condición | No asignadas |
| ---------- | ------: | -----------------------: | ---------------------------------: | -----------: |
| SHELL      |       1 |                        1 |                                  0 |            0 |
| ANIMA      |      10 |                       10 |                                  0 |            0 |
| AURA       |       1 |                        0 |                                  0 |            1 |
| FOGO       |       6 |                        3 |                                  0 |            3 |
| NEXO       |      63 |                       45 |                                  4 |           14 |
| NUMERA     |       6 |                        6 |                                  0 |            0 |
| ORIGO      |       5 |                        5 |                                  0 |            0 |
| VENTO PASS |       1 |                        0 |                                  0 |            1 |
| PULSO      |       2 |                        0 |                                  1 |            1 |
| VISO       |      17 |                       10 |                                  0 |            7 |
| **Total**  | **112** |                   **80** |                              **5** |       **27** |

#### 9. Frontera frente a gerente_general

La diferencia entre `gerente_general` y `gerente` no es solamente cuantitativa. Es territorial y de gobierno:

```text
gerente_general
→ dirección ejecutiva global mediante permisos explícitos

gerente
→ administración integral únicamente dentro de AS/AA y ORG-LOCAL derivados
```

`gerente` no puede convertir una vista local en una vista organizacional, consultar recursos de una sede no asignada, administrar seguridad global ni recibir automáticamente permisos concedidos a `gerente_general`. Una ampliación multisede debe provenir de nuevas asignaciones activas o de una excepción individual aprobada, no de la sede seleccionada ni del nombre del rol.

#### 10. Capacidades expresamente no concedidas

Además de los 13 permisos exclusivamente operativos, se mantienen sin concesión base las capacidades que:

- pertenecen a AURA o a la administración laboral de Vento Pass;
- crean productos dentro del catálogo organizacional compartido;
- exponen definiciones estructurales sensibles de recetas;
- generan, emiten o cancelan facturación interna;
- consultan actualizaciones técnicas de plataforma;
- permiten simulación o auditoría de autorización;
- exponen contenido web transversal o bloques de contenido sin responsabilidad funcional adicional;
- exponen productos o clientes del dominio de fidelización;
- exceden la administración integral de sedes asignadas.

Estas capacidades podrán ser objeto de una concesión individual o de otra matriz funcional únicamente cuando las tareas AUTH-RBAC-020 a AUTH-RBAC-022 definan el mecanismo y exista una necesidad empresarial aprobada.

#### 11. Tratamientos especiales

##### 11.1 Catálogos organizacionales de solo lectura

La consulta de productos, presentaciones, categorías, unidades, proveedores, negocios, categorías comerciales y menú se limita a recursos exactos vinculados con las unidades de negocio de las sedes asignadas. No concede administración del catálogo ni lectura de unidades sin relación con la cobertura del gerente.

##### 11.2 Operaciones excepcionales

Ajustes, entradas excepcionales, aprobación o resolución de variaciones y confirmaciones excepcionales de entrega reciben únicamente el componente base. El gerente deberá asumir un rol operativo compatible y cumplir turno, check-in, territorio y contrato del recurso antes de ejecutar la acción.

##### 11.3 Relaciones entre sedes

Traslados, remisiones, rutas, compras y facturas internas pueden involucrar varias sedes. El gerente puede consultar recursos relacionados con una sede asignada, pero no obtiene autoridad general sobre la sede opuesta. Las mutaciones deben cumplir la autoridad exigida por el contrato en cada extremo.

##### 11.4 Información financiera

Los permisos financieros y analíticos concedidos se limitan a sedes asignadas o a sus unidades de negocio exactas. No permiten consolidado global, acceso a otra unidad ni sustituyen permisos contables especializados.

#### 12. Relación con el estado legacy

Los 115 permisos globales legacy observados para `gerente` contradicen esta matriz. Durante la implementación deberá construirse una comparación explícita:

```text
MATRIZ LEGACY GLOBAL DE GERENTE
vs.
MATRIZ CANÓNICA TERRITORIAL AUTH-RBAC-003
```

Cada asignación legacy deberá clasificarse como conservar con alcance AS/AA, reemplazar por ORG-LOCAL, retirar o trasladar a una excepción individual. No podrá mantenerse ningún permiso global por compatibilidad silenciosa.

#### 13. Validaciones de integridad

| Validación                       | Resultado |
| -------------------------------- | --------- |
| Permisos canónicos evaluados     | 112       |
| Permisos omitidos                | 0         |
| Permisos duplicados              | 0         |
| Claves con concesión base        | 85        |
| Capacidades directas             | 80        |
| Capacidades de doble condición   | 5         |
| Capacidades sin concesión base   | 27        |
| Concesiones con alcance global G | 0         |
| Wildcards                        | 0         |
| Bypasses por nombre de rol       | 0         |
| Acceso automático a APP-REVIEW   | 0         |

#### 14. Impacto sobre tareas posteriores

- `AUTH-RBAC-004` deberá definir una matriz de supervisor más limitada y no podrá copiar la administración integral de sede.
- `AUTH-RBAC-008` a `AUTH-RBAC-019` definirán los roles operativos que pueden conceder las capacidades `OPERATIONAL_ONLY` y los carriles operativos de permisos híbridos.
- `AUTH-RBAC-020` a `AUTH-RBAC-022` podrán añadir concesiones o denegaciones individuales sin convertir al gerente en rol global.
- `AUTH-RBAC-024` deberá proyectar `AS`, `AA`, `ORG-LOCAL` y `AS-REL` a un dataset reproducible sin utilizar `scope_type = global`.
- `AUTH-RBAC-027` deberá comprobar que ninguna relación entre sedes produzca acceso operativo o administrativo global accidental.
- `AUTH-RBAC-028` deberá comprobar que las capacidades administrativas directas funcionan sin turno ni check-in dentro de su cobertura local.

#### 15. Criterios de aprobación

AUTH-RBAC-003 podrá aprobarse cuando se acepte expresamente que:

- el gerente recibe 85 claves con concesión base explícita y no un wildcard;
- 80 capacidades pueden autorizarse administrativamente dentro de su cobertura local;
- 5 capacidades exigen simultáneamente contexto operativo;
- 27 capacidades permanecen sin concesión base;
- ninguna concesión utiliza alcance global `G`;
- la cobertura se resuelve desde sedes y áreas activamente asignadas;
- la sede primaria y la sede seleccionada no autorizan;
- una relación con una sede asignada no concede autoridad general sobre la otra sede;
- el gerente no administra seguridad, propietarios, roles globales ni arquitectura de autorización;
- APP-REVIEW y entornos aislados quedan excluidos;
- los permisos legacy globales deben retirarse o territorializarse durante la implementación;
- no se implementa todavía ningún cambio físico.

#### 16. Estado final de la propuesta

| Tarea         | Estado      |
| ------------- | ----------- |
| AUTH-RBAC-001 | APROBADA    |
| AUTH-RBAC-002 | APROBADA    |
| AUTH-RBAC-003 | APROBADA    |
| AUTH-RBAC-004 | NO INICIADA |

No se avanza a AUTH-RBAC-004 hasta recibir aprobación explícita.


### ✅ AUTH-RBAC-004 — Crear matriz de supervisor

#### 1. Identificación de la tarea

| Campo                     | Valor                                                              |
| ------------------------- | ------------------------------------------------------------------ |
| Bloque                    | BLOQUE D — Matrices canónicas de roles, excepciones y dispositivos |
| Tarea                     | AUTH-RBAC-004 — Crear matriz de supervisor                         |
| Estado                    | **APROBADA**                                                       |
| Naturaleza                | Definición documental de matriz base territorial limitada          |
| Implementación física     | No incluida                                                        |
| Catálogo evaluado         | 112 permisos canónicos vigentes                                    |
| Tarea anterior vigente    | AUTH-RBAC-003 — Crear matriz de gerente                            |
| Tarea posterior reservada | AUTH-RBAC-005 — Crear matriz de auxiliar_administrativa            |

Esta tarea no modifica Supabase, migraciones, tablas, RLS, RPC, aplicaciones, repositorios ni datasets físicos. La aplicación posterior deberá realizarse mediante los datasets canónicos de AUTH-RBAC-024 y las migraciones versionadas del BLOQUE R en `vento-shell`.

#### 2. Objetivo

Definir, permiso por permiso, qué capacidades del catálogo vigente recibe el rol base `supervisor`, limitándolo al seguimiento diario, coordinación local, revisión de personal y control operativo dentro de una o varias sedes expresamente asignadas, sin convertirlo en administrador integral de sede, sin autoridad financiera completa y sin acceso operativo automático.

#### 3. Decisión principal

`supervisor` representa autoridad administrativa local limitada y subordinada a la gerencia de sede. Su autorización exige permiso explícito, cobertura territorial activa y un recurso local compatible.

```text
SUPERVISOR
+ PERMISO BASE EXPLÍCITO
+ SEDE O ÁREA ASIGNADA
+ RECURSO LOCAL COMPATIBLE
= AUTORIZACIÓN LIMITADA POSIBLE
```

No se admite:

```text
supervisor = gerente reducido por inferencia
supervisor = administración integral de sede
supervisor = aprobación general de excepciones
supervisor = acceso financiero completo
supervisor = configuración estructural
supervisor = operación sin turno
supervisor = sede seleccionada como autorización
supervisor = acceso automático a APP-REVIEW
```

La matriz se concentra en consulta, seguimiento, programación limitada y correcciones ordinarias expresamente representadas por el catálogo. Una capacidad amplia que mezcle corrección menor con anulación, aprobación o efecto financiero sensible permanece denegada hasta su descomposición contractual.

#### 4. Resultado cuantitativo de la matriz

| Resultado                            | Cantidad | Efecto                                                                                                                             |
| ------------------------------------ | -------: | ---------------------------------------------------------------------------------------------------------------------------------- |
| Capacidades administrativas directas |       58 | Se conceden por el carril base dentro de sedes, áreas o recursos locales expresamente autorizados.                                 |
| Componentes base de doble condición  |        0 | Ninguna capacidad `BASE_AND_OPERATIONAL` se concede por defecto al supervisor.                                                     |
| Capacidades no concedidas            |       54 | Permanecen denegadas por ser operativas, sensibles, financieras, estructurales, transversales o propias de una autoridad superior. |
| Total evaluado                       |      112 | Sin omisiones ni duplicados.                                                                                                       |

La matriz contiene **58 decisiones de concesión base directa** y **54 ausencias de concesión**. La ausencia de concesión produce denegación por defecto; no se crean filas `deny` redundantes. Ninguna concesión utiliza alcance `G`.

#### 5. Perfiles de alcance utilizados

| Perfil      | Significado                                                                                                                                        |
| ----------- | -------------------------------------------------------------------------------------------------------------------------------------------------- |
| `NT-APP`    | Entrada a una aplicación necesaria para ejercer capacidades concedidas. No amplía el territorio ni habilita módulos no autorizados.                |
| `AS`        | Todas las sedes laborales activamente asignadas al supervisor mediante la fuente canónica de cobertura.                                            |
| `AA`        | Áreas activamente asignadas dentro de sedes autorizadas cuando el recurso sea realmente de nivel área.                                             |
| `ORG-LOCAL` | Catálogo o recurso organizacional de solo lectura estrictamente relacionado con la operación de las sedes AS. No equivale a organización completa. |
| `AS-REL`    | Recurso que relaciona varias sedes. Solo permite la vista o corrección exacta autorizada desde el extremo perteneciente a AS.                      |
| `AS/AA`     | Recurso local cuya sede o área está dentro de la cobertura activa del supervisor.                                                                  |

#### 6. Reglas obligatorias de la matriz

1. Cada concesión utiliza una clave canónica exacta; no existen wildcards ni permisos implícitos.
2. `AS` se resuelve desde asignaciones activas de sede y nunca desde la sede primaria o la sede seleccionada.
3. El supervisor puede tener varias sedes explícitas, pero su unión no constituye alcance global.
4. La jerarquía `gerente > supervisor` no crea herencia automática; ambas matrices son independientes.
5. La autoridad del supervisor se limita a seguimiento, consulta, programación local permitida y correcciones ordinarias expresamente representadas.
6. El supervisor no publica autoridad organizacional, no administra roles, permisos, propietarios, matrices ni perfiles administrativos.
7. Las capacidades de configuración estructural, anulación, aprobación financiera o excepción sensible permanecen denegadas por defecto.
8. Los 13 permisos `OPERATIONAL_ONLY` no se insertan en esta matriz base; podrán obtenerse únicamente desde un rol operativo válido.
9. Los cinco permisos `BASE_AND_OPERATIONAL` no reciben componente base en esta matriz. El catálogo actual no separa suficientemente las intervenciones menores de las excepciones sensibles.
10. Las capacidades base concedidas no requieren turno ni check-in, pero sí empleado activo, cobertura local, recurso resuelto y ausencia de denegaciones aplicables.
11. La entrada a una aplicación no concede automáticamente todas sus funciones.
12. Un recurso sin sede o territorio resoluble se deniega, salvo que el contrato permita expresamente `ORG-LOCAL` de solo lectura.
13. APP-REVIEW, entornos demo, áreas aisladas, puntos de marcación y espacios técnicos quedan fuera de la cobertura ordinaria.
14. Los datos financieros completos, márgenes, contabilidad, valores internos y decisiones de variación no se conceden por defecto.
15. Todo permiso nuevo se deniega hasta que una versión canónica posterior lo evalúe expresamente para este rol.

#### 7. Matriz canónica completa
##### 7.1 SHELL — 1 permisos

| Permiso        | Capacidad humana  | Modalidad   | Decisión para supervisor | Alcance aprobado                                                                                       | Condición                                                                                              |
| -------------- | ----------------- | ----------- | ------------------------ | ------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------ |
| `shell.access` | Entrar a Vento OS | `BASE_ONLY` | **ASIGNAR**              | NT-APP — acceso a la aplicación. La autorización interna continúa limitada por AS/AA y por el recurso. | Carril base. No requiere turno ni check-in. Entrar a la aplicación no amplía la cobertura territorial. |

##### 7.2 ANIMA — 10 permisos

| Permiso                                     | Capacidad humana                     | Modalidad   | Decisión para supervisor | Alcance aprobado                                                                                                    | Condición                                                                                                                                                        |
| ------------------------------------------- | ------------------------------------ | ----------- | ------------------------ | ------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `anima.access`                              | Entrar a ANIMA                       | `BASE_ONLY` | **ASIGNAR**              | NT-APP — acceso a la aplicación. La autorización interna continúa limitada por AS/AA y por el recurso.              | Carril base. No requiere turno ni check-in. Entrar a la aplicación no amplía la cobertura territorial.                                                           |
| `anima.workforce.employee_documents.view`   | Consultar documentos de trabajadores | `BASE_ONLY` | **ASIGNAR**              | AS/AA — trabajadores, turnos, documentos o vacantes vinculados a sedes o áreas activamente asignadas al supervisor. | Carril base. No requiere turno ni check-in. La persona o recurso objetivo debe pertenecer a la cobertura administrativa autorizada.                              |
| `anima.workforce.employee_documents.upload` | Cargar documentos de trabajadores    | `BASE_ONLY` | **ASIGNAR**              | AS/AA — documentos del personal vinculados a sedes o áreas asignadas al supervisor.                                 | Carril base. Solo carga de documentos admitidos por el flujo local; no elimina, reclasifica ni administra expedientes fuera de su cobertura.                     |
| `anima.workforce.employee_documents.delete` | Eliminar documentos de trabajadores  | `BASE_ONLY` | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                   | Eliminar documentos laborales es una acción sensible y potencialmente irreversible reservada a una autoridad administrativa superior o funcional especializada.  |
| `anima.workforce.employee_photos.upload`    | Cargar fotografías de trabajadores   | `BASE_ONLY` | **ASIGNAR**              | AS/AA — trabajadores vinculados a sedes o áreas asignadas al supervisor.                                            | Carril base. Solo actualización autorizada de fotografía; no modifica identidad, rol base, sede ni perfil administrativo.                                        |
| `anima.workforce.team_members.view`         | Consultar integrantes del equipo     | `BASE_ONLY` | **ASIGNAR**              | AS/AA — trabajadores, turnos, documentos o vacantes vinculados a sedes o áreas activamente asignadas al supervisor. | Carril base. No requiere turno ni check-in. La persona o recurso objetivo debe pertenecer a la cobertura administrativa autorizada.                              |
| `anima.workforce.staff_invitations.create`  | Invitar trabajadores                 | `BASE_ONLY` | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                   | Invitar trabajadores afecta identidad y acceso al sistema; no forma parte de la supervisión local ordinaria.                                                     |
| `anima.attendance.shifts.create`            | Crear turnos                         | `BASE_ONLY` | **ASIGNAR**              | AS/AA — turnos del personal y de las áreas dentro de la cobertura administrativa activa del supervisor.             | Carril base. Apoyo a la programación local. No crea cobertura territorial, no cambia roles base y no sustituye una aprobación superior cuando el flujo la exija. |
| `anima.attendance.shifts.update`            | Actualizar turnos                    | `BASE_ONLY` | **ASIGNAR**              | AS/AA — turnos del personal y de las áreas dentro de la cobertura administrativa activa del supervisor.             | Carril base. Solo cambios permitidos por estado y campo. No cancela turnos ni modifica relaciones laborales fuera de la sede administrada.                       |
| `anima.attendance.shifts.cancel`            | Cancelar turnos                      | `BASE_ONLY` | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                   | Cancelar turnos puede afectar programación, asistencia y nómina; queda reservado al gerente o a una concesión individual aprobada.                               |

##### 7.3 AURA — 1 permisos

| Permiso       | Capacidad humana | Modalidad   | Decisión para supervisor | Alcance aprobado                                                  | Condición                                                                                                          |
| ------------- | ---------------- | ----------- | ------------------------ | ----------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| `aura.access` | Entrar a AURA    | `BASE_ONLY` | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base. | AURA permanece como aplicación administrativa diferida y no pertenece a la responsabilidad natural del supervisor. |

##### 7.4 FOGO — 6 permisos

| Permiso                            | Capacidad humana                | Modalidad             | Decisión para supervisor | Alcance aprobado                                                                                                                            | Condición                                                                                                                                           |
| ---------------------------------- | ------------------------------- | --------------------- | ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| `fogo.access`                      | Entrar a FOGO                   | `BASE_OR_OPERATIONAL` | **ASIGNAR**              | NT-APP — acceso a la aplicación. La autorización interna continúa limitada por AS/AA y por el recurso.                                      | Carril base. No requiere turno ni check-in. Entrar a la aplicación no amplía la cobertura territorial.                                              |
| `fogo.production.batches.view`     | Consultar lotes de producción   | `BASE_OR_OPERATIONAL` | **ASIGNAR**              | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados. | El supervisor usa el carril base; el carril operativo continúa independiente.                                                                       |
| `fogo.production.batches.create`   | Crear lotes de producción       | `OPERATIONAL_ONLY`    | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                                           | El rol supervisor no concede esta capacidad. Solo podrá obtenerse mediante una matriz operativa compatible, turno y demás prerrequisitos canónicos. |
| `fogo.production.orders.view`      | Consultar órdenes de producción | `BASE_OR_OPERATIONAL` | **ASIGNAR**              | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados. | El supervisor usa el carril base; el carril operativo continúa independiente.                                                                       |
| `fogo.production.recipe_book.view` | Consultar recetario operativo   | `OPERATIONAL_ONLY`    | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                                           | El rol supervisor no concede esta capacidad. Solo podrá obtenerse mediante una matriz operativa compatible, turno y demás prerrequisitos canónicos. |
| `fogo.production.recipes.view`     | Consultar recetas               | `BASE_ONLY`           | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                                           | Las recetas constituyen información estructural y sensible; la supervisión diaria se cubre mediante lotes y órdenes de producción.                  |

##### 7.5 NEXO — 63 permisos

| Permiso                                      | Capacidad humana                         | Modalidad              | Decisión para supervisor | Alcance aprobado                                                                                                                                          | Condición                                                                                                                                                                                                          |
| -------------------------------------------- | ---------------------------------------- | ---------------------- | ------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `nexo.access`                                | Entrar a NEXO                            | `BASE_OR_OPERATIONAL`  | **ASIGNAR**              | NT-APP — acceso a la aplicación. La autorización interna continúa limitada por AS/AA y por el recurso.                                                    | Carril base. No requiere turno ni check-in. Entrar a la aplicación no amplía la cobertura territorial.                                                                                                             |
| `nexo.catalog.products.view`                 | Consultar productos                      | `BASE_OR_OPERATIONAL`  | **ASIGNAR**              | ORG-LOCAL — recurso organizacional exacto vinculado a las unidades de negocio servidas por las sedes AS; sin acceso al resto de la organización.          | Carril base. Solo lectura. La relación con la unidad o negocio debe resolverse desde el recurso; no se inventa desde la sede seleccionada.                                                                         |
| `nexo.catalog.products.create`               | Crear productos                          | `BASE_ONLY`            | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                                                         | Crear productos modifica el catálogo organizacional compartido y excede la autoridad local limitada.                                                                                                               |
| `nexo.catalog.presentations.view`            | Consultar presentaciones                 | `BASE_OR_OPERATIONAL`  | **ASIGNAR**              | ORG-LOCAL — recurso organizacional exacto vinculado a las unidades de negocio servidas por las sedes AS; sin acceso al resto de la organización.          | Carril base. Solo lectura. La relación con la unidad o negocio debe resolverse desde el recurso; no se inventa desde la sede seleccionada.                                                                         |
| `nexo.catalog.request_policies.view`         | Consultar políticas de solicitud         | `BASE_OR_OPERATIONAL`  | **ASIGNAR**              | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados.               | El supervisor usa el carril base; el carril operativo continúa independiente.                                                                                                                                      |
| `nexo.catalog.categories.view`               | Consultar categorías                     | `BASE_OR_OPERATIONAL`  | **ASIGNAR**              | ORG-LOCAL — recurso organizacional exacto vinculado a las unidades de negocio servidas por las sedes AS; sin acceso al resto de la organización.          | Carril base. Solo lectura. La relación con la unidad o negocio debe resolverse desde el recurso; no se inventa desde la sede seleccionada.                                                                         |
| `nexo.catalog.units.view`                    | Consultar unidades                       | `BASE_OR_OPERATIONAL`  | **ASIGNAR**              | ORG-LOCAL — recurso organizacional exacto vinculado a las unidades de negocio servidas por las sedes AS; sin acceso al resto de la organización.          | Carril base. Solo lectura. La relación con la unidad o negocio debe resolverse desde el recurso; no se inventa desde la sede seleccionada.                                                                         |
| `nexo.assets.items.view`                     | Consultar activos                        | `BASE_OR_OPERATIONAL`  | **ASIGNAR**              | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados.               | El supervisor usa el carril base; el carril operativo continúa independiente.                                                                                                                                      |
| `nexo.assets.items.create`                   | Crear activos                            | `BASE_ONLY`            | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                                                         | Crear activos modifica el registro patrimonial; requiere autoridad administrativa superior o responsabilidad funcional específica.                                                                                 |
| `nexo.assets.groups.view`                    | Consultar grupos de activos              | `BASE_OR_OPERATIONAL`  | **ASIGNAR**              | ORG-LOCAL — recurso organizacional exacto vinculado a las unidades de negocio servidas por las sedes AS; sin acceso al resto de la organización.          | Carril base. Solo lectura. La relación con la unidad o negocio debe resolverse desde el recurso; no se inventa desde la sede seleccionada.                                                                         |
| `nexo.assets.counts.view`                    | Consultar conteos de activos             | `BASE_OR_OPERATIONAL`  | **ASIGNAR**              | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados.               | El supervisor usa el carril base; el carril operativo continúa independiente.                                                                                                                                      |
| `nexo.inventory.adjustments.view`            | Consultar ajustes de inventario          | `BASE_OR_OPERATIONAL`  | **ASIGNAR**              | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados.               | El supervisor usa el carril base; el carril operativo continúa independiente.                                                                                                                                      |
| `nexo.inventory.adjustments.register`        | Registrar ajustes de inventario          | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                                                         | La acción combina autoridad permanente con ejecución operativa sensible. El supervisor no recibe el componente base por defecto; requiere una capacidad futura más específica o una excepción individual aprobada. |
| `nexo.inventory.entries.view`                | Consultar entradas de inventario         | `BASE_OR_OPERATIONAL`  | **ASIGNAR**              | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados.               | El supervisor usa el carril base; el carril operativo continúa independiente.                                                                                                                                      |
| `nexo.inventory.entries.register`            | Registrar entradas de inventario         | `OPERATIONAL_ONLY`     | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                                                         | El rol supervisor no concede esta capacidad. Solo podrá obtenerse mediante una matriz operativa compatible, turno y demás prerrequisitos canónicos.                                                                |
| `nexo.inventory.entries.override`            | Registrar entradas excepcionales         | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                                                         | La acción combina autoridad permanente con ejecución operativa sensible. El supervisor no recibe el componente base por defecto; requiere una capacidad futura más específica o una excepción individual aprobada. |
| `nexo.inventory.locations.view`              | Consultar ubicaciones de inventario      | `BASE_OR_OPERATIONAL`  | **ASIGNAR**              | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados.               | El supervisor usa el carril base; el carril operativo continúa independiente.                                                                                                                                      |
| `nexo.inventory.location_assignments.assign` | Asignar ubicaciones de inventario        | `OPERATIONAL_ONLY`     | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                                                         | El rol supervisor no concede esta capacidad. Solo podrá obtenerse mediante una matriz operativa compatible, turno y demás prerrequisitos canónicos.                                                                |
| `nexo.inventory.location_catalog.update`     | Actualizar el catálogo de una ubicación  | `BASE_ONLY`            | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                                                         | Modificar el catálogo de una ubicación es configuración local estructural, no seguimiento operativo ordinario.                                                                                                     |
| `nexo.inventory.lpns.view`                   | Consultar LPN                            | `BASE_OR_OPERATIONAL`  | **ASIGNAR**              | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados.               | El supervisor usa el carril base; el carril operativo continúa independiente.                                                                                                                                      |
| `nexo.inventory.movements.view`              | Consultar movimientos de inventario      | `BASE_OR_OPERATIONAL`  | **ASIGNAR**              | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados.               | El supervisor usa el carril base; el carril operativo continúa independiente.                                                                                                                                      |
| `nexo.inventory.stock.view`                  | Consultar stock                          | `BASE_OR_OPERATIONAL`  | **ASIGNAR**              | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados.               | El supervisor usa el carril base; el carril operativo continúa independiente.                                                                                                                                      |
| `nexo.inventory.production_batches.view`     | Consultar lotes vinculados al inventario | `BASE_OR_OPERATIONAL`  | **ASIGNAR**              | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados.               | El supervisor usa el carril base; el carril operativo continúa independiente.                                                                                                                                      |
| `nexo.inventory.transfers.view`              | Consultar traslados de inventario        | `BASE_OR_OPERATIONAL`  | **ASIGNAR**              | AS-REL — recursos relacionales que involucren al menos una sede AS; toda mutación exige autoridad sobre los lados obligatorios definidos por el contrato. | Carril base. La visibilidad de un extremo no concede autoridad general sobre el otro ni sobre sedes no asignadas.                                                                                                  |
| `nexo.inventory.transfers.create`            | Crear traslados de inventario            | `OPERATIONAL_ONLY`     | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                                                         | El rol supervisor no concede esta capacidad. Solo podrá obtenerse mediante una matriz operativa compatible, turno y demás prerrequisitos canónicos.                                                                |
| `nexo.inventory.withdrawals.view`            | Consultar retiros de inventario          | `BASE_OR_OPERATIONAL`  | **ASIGNAR**              | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados.               | El supervisor usa el carril base; el carril operativo continúa independiente.                                                                                                                                      |
| `nexo.inventory.withdrawals.register`        | Registrar retiros de inventario          | `OPERATIONAL_ONLY`     | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                                                         | El rol supervisor no concede esta capacidad. Solo podrá obtenerse mediante una matriz operativa compatible, turno y demás prerrequisitos canónicos.                                                                |
| `nexo.inventory.zones.view`                  | Consultar zonas de almacenamiento        | `BASE_OR_OPERATIONAL`  | **ASIGNAR**              | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados.               | El supervisor usa el carril base; el carril operativo continúa independiente.                                                                                                                                      |
| `nexo.inventory.storage_positions.view`      | Consultar posiciones de almacenamiento   | `BASE_OR_OPERATIONAL`  | **ASIGNAR**              | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados.               | El supervisor usa el carril base; el carril operativo continúa independiente.                                                                                                                                      |
| `nexo.inventory.warehouse_operations.view`   | Consultar operaciones de bodega          | `BASE_OR_OPERATIONAL`  | **ASIGNAR**              | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados.               | El supervisor usa el carril base; el carril operativo continúa independiente.                                                                                                                                      |
| `nexo.inventory.stock_validations.perform`   | Ejecutar validaciones de inventario      | `OPERATIONAL_ONLY`     | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                                                         | El rol supervisor no concede esta capacidad. Solo podrá obtenerse mediante una matriz operativa compatible, turno y demás prerrequisitos canónicos.                                                                |
| `nexo.inventory.stock_counts.view`           | Consultar conteos de inventario          | `BASE_OR_OPERATIONAL`  | **ASIGNAR**              | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados.               | El supervisor usa el carril base; el carril operativo continúa independiente.                                                                                                                                      |
| `nexo.inventory.stock_counts.perform`        | Ejecutar conteos de inventario           | `OPERATIONAL_ONLY`     | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                                                         | El rol supervisor no concede esta capacidad. Solo podrá obtenerse mediante una matriz operativa compatible, turno y demás prerrequisitos canónicos.                                                                |
| `nexo.inventory.initial_counts.view`         | Consultar conteos iniciales              | `BASE_OR_OPERATIONAL`  | **ASIGNAR**              | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados.               | El supervisor usa el carril base; el carril operativo continúa independiente.                                                                                                                                      |
| `nexo.inventory.remissions.view`             | Consultar remisiones                     | `BASE_OR_OPERATIONAL`  | **ASIGNAR**              | AS-REL — recursos relacionales que involucren al menos una sede AS; toda mutación exige autoridad sobre los lados obligatorios definidos por el contrato. | Carril base. La visibilidad de un extremo no concede autoridad general sobre el otro ni sobre sedes no asignadas.                                                                                                  |
| `nexo.inventory.remissions.update`           | Actualizar remisiones                    | `BASE_OR_OPERATIONAL`  | **ASIGNAR**              | AS-REL — remisiones en las que participe una sede asignada y el contrato permita edición desde ese extremo.                                               | Carril base. Solo correcciones ordinarias en estados y campos editables. No cancela, despacha, recibe ni altera efectos ya consolidados.                                                                           |
| `nexo.inventory.remissions.request`          | Solicitar remisiones                     | `OPERATIONAL_ONLY`     | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                                                         | El rol supervisor no concede esta capacidad. Solo podrá obtenerse mediante una matriz operativa compatible, turno y demás prerrequisitos canónicos.                                                                |
| `nexo.inventory.remissions.prepare`          | Preparar remisiones                      | `OPERATIONAL_ONLY`     | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                                                         | El rol supervisor no concede esta capacidad. Solo podrá obtenerse mediante una matriz operativa compatible, turno y demás prerrequisitos canónicos.                                                                |
| `nexo.inventory.remissions.dispatch`         | Despachar remisiones                     | `OPERATIONAL_ONLY`     | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                                                         | El rol supervisor no concede esta capacidad. Solo podrá obtenerse mediante una matriz operativa compatible, turno y demás prerrequisitos canónicos.                                                                |
| `nexo.inventory.remissions.receive`          | Recibir remisiones                       | `OPERATIONAL_ONLY`     | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                                                         | El rol supervisor no concede esta capacidad. Solo podrá obtenerse mediante una matriz operativa compatible, turno y demás prerrequisitos canónicos.                                                                |
| `nexo.inventory.remissions.cancel`           | Cancelar remisiones                      | `BASE_OR_OPERATIONAL`  | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                                                         | Cancelar remisiones es una anulación sensible con efectos entre sedes; queda reservada a una autoridad superior o permiso individual específico.                                                                   |
| `nexo.logistics.operations_board.view`       | Consultar tablero logístico              | `BASE_OR_OPERATIONAL`  | **ASIGNAR**              | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados.               | El supervisor usa el carril base; el carril operativo continúa independiente.                                                                                                                                      |
| `nexo.logistics.operations.view`             | Consultar operaciones logísticas         | `BASE_OR_OPERATIONAL`  | **ASIGNAR**              | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados.               | El supervisor usa el carril base; el carril operativo continúa independiente.                                                                                                                                      |
| `nexo.logistics.driver_operations.view`      | Consultar operaciones de conductores     | `BASE_OR_OPERATIONAL`  | **ASIGNAR**              | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados.               | El supervisor usa el carril base; el carril operativo continúa independiente.                                                                                                                                      |
| `nexo.logistics.fulfillment.view`            | Consultar cumplimiento logístico         | `BASE_OR_OPERATIONAL`  | **ASIGNAR**              | AS-REL — recursos relacionales que involucren al menos una sede AS; toda mutación exige autoridad sobre los lados obligatorios definidos por el contrato. | Carril base. La visibilidad de un extremo no concede autoridad general sobre el otro ni sobre sedes no asignadas.                                                                                                  |
| `nexo.logistics.fulfillment_routes.view`     | Consultar rutas de cumplimiento          | `BASE_OR_OPERATIONAL`  | **ASIGNAR**              | AS-REL — recursos relacionales que involucren al menos una sede AS; toda mutación exige autoridad sobre los lados obligatorios definidos por el contrato. | Carril base. La visibilidad de un extremo no concede autoridad general sobre el otro ni sobre sedes no asignadas.                                                                                                  |
| `nexo.logistics.supply_routes.view`          | Consultar rutas de abastecimiento        | `BASE_OR_OPERATIONAL`  | **ASIGNAR**              | AS-REL — recursos relacionales que involucren al menos una sede AS; toda mutación exige autoridad sobre los lados obligatorios definidos por el contrato. | Carril base. La visibilidad de un extremo no concede autoridad general sobre el otro ni sobre sedes no asignadas.                                                                                                  |
| `nexo.finance.internal_invoices.view`        | Consultar facturas internas              | `BASE_ONLY`            | **ASIGNAR**              | AS-REL — facturas internas relacionadas con sedes asignadas al supervisor.                                                                                | Carril base. Consulta operativa del documento y su estado; no incluye valores protegidos por permiso separado ni permite generar, emitir o cancelar.                                                               |
| `nexo.finance.internal_invoices.generate`    | Generar facturas internas                | `BASE_ONLY`            | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                                                         | Generar facturación interna produce efectos financieros y no corresponde a supervisión local.                                                                                                                      |
| `nexo.finance.internal_invoices.issue`       | Emitir facturas internas                 | `BASE_ONLY`            | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                                                         | Emitir facturación interna produce un efecto financiero formal y no corresponde a supervisión local.                                                                                                               |
| `nexo.finance.internal_invoices.cancel`      | Cancelar facturas internas               | `BASE_ONLY`            | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                                                         | Cancelar facturación interna es una anulación financiera sensible reservada.                                                                                                                                       |
| `nexo.finance.internal_invoice_amounts.view` | Consultar valores de facturas internas   | `BASE_ONLY`            | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                                                         | Los valores de facturas internas son información financiera sensible completa y no se conceden por defecto al supervisor.                                                                                          |
| `nexo.finance.internal_prices.view`          | Consultar precios internos               | `BASE_ONLY`            | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                                                         | Los precios internos son información financiera sensible y estratégica no necesaria para el seguimiento diario general.                                                                                            |
| `nexo.finance.internal_variances.view`       | Consultar variaciones internas           | `BASE_ONLY`            | **ASIGNAR**              | AS/AA — variaciones operativas asociadas a sedes o áreas asignadas.                                                                                       | Carril base. Solo revisión y seguimiento. No aprueba ni resuelve la variación.                                                                                                                                     |
| `nexo.finance.internal_variances.approve`    | Aprobar variaciones internas             | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                                                         | La acción combina autoridad permanente con ejecución operativa sensible. El supervisor no recibe el componente base por defecto; requiere una capacidad futura más específica o una excepción individual aprobada. |
| `nexo.finance.internal_variances.resolve`    | Resolver variaciones internas            | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                                                         | La acción combina autoridad permanente con ejecución operativa sensible. El supervisor no recibe el componente base por defecto; requiere una capacidad futura más específica o una excepción individual aprobada. |
| `nexo.finance.cost_centers.view`             | Consultar centros de costo en NEXO       | `BASE_ONLY`            | **ASIGNAR**              | AS/ORG-LOCAL — centros de costo estrictamente vinculados a las sedes asignadas.                                                                           | Carril base. Consulta de referencia operativa; no concede reportes financieros completos ni capacidad de configuración.                                                                                            |
| `nexo.analytics.internal_reports.view`       | Consultar reportes internos              | `BASE_ONLY`            | **ASIGNAR**              | AS/AA — reportes operativos de sedes o áreas asignadas.                                                                                                   | Carril base. Excluye margen completo, rentabilidad consolidada y datos de otras unidades.                                                                                                                          |
| `nexo.analytics.margin_reports.view`         | Consultar reportes de margen             | `BASE_ONLY`            | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                                                         | Los reportes de margen exponen información financiera sensible completa y no forman parte de la matriz base del supervisor.                                                                                        |
| `nexo.printing.templates.update`             | Editar plantillas de impresión           | `BASE_ONLY`            | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                                                         | Editar plantillas de impresión es configuración estructural y puede afectar documentos de toda la operación.                                                                                                       |
| `nexo.printing.jobs.view`                    | Consultar trabajos de impresión          | `BASE_OR_OPERATIONAL`  | **ASIGNAR**              | AS/AA — recursos cuya sede o área pertenece a la cobertura administrativa activa del supervisor; excluye APP-REVIEW y territorios aislados.               | El supervisor usa el carril base; el carril operativo continúa independiente.                                                                                                                                      |
| `nexo.settings.sites.view`                   | Consultar configuración de sedes         | `BASE_ONLY`            | **ASIGNAR**              | AS/SS/AA/SA explícitos — configuración o recurso local de una sede o área asignada; sin G, TST ni incorporación automática de sedes futuras.              | Carril base. Solo consulta o seguimiento local. No modifica catálogos, políticas, plantillas ni estructura de sede.                                                                                                |
| `nexo.settings.remission_policies.view`      | Consultar políticas de remisiones        | `BASE_ONLY`            | **ASIGNAR**              | AS/SS/AA/SA explícitos — configuración o recurso local de una sede o área asignada; sin G, TST ni incorporación automática de sedes futuras.              | Carril base. Solo consulta o seguimiento local. No modifica catálogos, políticas, plantillas ni estructura de sede.                                                                                                |

##### 7.6 NUMERA — 6 permisos

| Permiso                                   | Capacidad humana               | Modalidad   | Decisión para supervisor | Alcance aprobado                                                  | Condición                                                                                                                                 |
| ----------------------------------------- | ------------------------------ | ----------- | ------------------------ | ----------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| `numera.access`                           | Entrar a NUMERA                | `BASE_ONLY` | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base. | NUMERA es una superficie financiera y analítica especializada; el supervisor no recibe acceso por defecto.                                |
| `numera.finance.cost_centers.view`        | Consultar centros de costo     | `BASE_ONLY` | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base. | La capacidad excede la supervisión local limitada o requiere una responsabilidad funcional, financiera, técnica o de seguridad adicional. |
| `numera.finance.expenses.view`            | Consultar gastos               | `BASE_ONLY` | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base. | La capacidad excede la supervisión local limitada o requiere una responsabilidad funcional, financiera, técnica o de seguridad adicional. |
| `numera.analytics.break_even.view`        | Consultar punto de equilibrio  | `BASE_ONLY` | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base. | La capacidad excede la supervisión local limitada o requiere una responsabilidad funcional, financiera, técnica o de seguridad adicional. |
| `numera.analytics.profitability.view`     | Consultar rentabilidad         | `BASE_ONLY` | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base. | La capacidad excede la supervisión local limitada o requiere una responsabilidad funcional, financiera, técnica o de seguridad adicional. |
| `numera.analytics.financial_reports.view` | Consultar reportes financieros | `BASE_ONLY` | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base. | La capacidad excede la supervisión local limitada o requiere una responsabilidad funcional, financiera, técnica o de seguridad adicional. |

##### 7.7 ORIGO — 5 permisos

| Permiso                                  | Capacidad humana                  | Modalidad             | Decisión para supervisor | Alcance aprobado                                                                                                                                          | Condición                                                                                                                                         |
| ---------------------------------------- | --------------------------------- | --------------------- | ------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| `origo.access`                           | Entrar a ORIGO                    | `BASE_OR_OPERATIONAL` | **ASIGNAR**              | NT-APP — acceso a la aplicación. La autorización interna continúa limitada por AS/AA y por el recurso.                                                    | Carril base. No requiere turno ni check-in. Entrar a la aplicación no amplía la cobertura territorial.                                            |
| `origo.procurement.purchase_orders.view` | Consultar órdenes de compra       | `BASE_OR_OPERATIONAL` | **ASIGNAR**              | AS-REL — recursos relacionales que involucren al menos una sede AS; toda mutación exige autoridad sobre los lados obligatorios definidos por el contrato. | Carril base. La visibilidad de un extremo no concede autoridad general sobre el otro ni sobre sedes no asignadas.                                 |
| `origo.procurement.receipts.view`        | Consultar recepciones de compra   | `BASE_OR_OPERATIONAL` | **ASIGNAR**              | AS-REL — recursos relacionales que involucren al menos una sede AS; toda mutación exige autoridad sobre los lados obligatorios definidos por el contrato. | Carril base. La visibilidad de un extremo no concede autoridad general sobre el otro ni sobre sedes no asignadas.                                 |
| `origo.procurement.suppliers.view`       | Consultar proveedores             | `BASE_OR_OPERATIONAL` | **ASIGNAR**              | ORG-LOCAL — proveedores relacionados con compras o recepciones de las sedes asignadas.                                                                    | Carril base. Solo datos operativos necesarios para seguimiento; campos contractuales o financieros sensibles permanecen enmascarados o denegados. |
| `origo.catalog.product_reviews.view`     | Consultar revisiones de productos | `BASE_ONLY`           | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                                                         | Las revisiones maestras de producto pertenecen al gobierno del catálogo, no a la supervisión diaria de sede.                                      |

##### 7.8 VENTO PASS — 1 permisos

| Permiso       | Capacidad humana    | Modalidad   | Decisión para supervisor | Alcance aprobado                                                  | Condición                                                                                                                  |
| ------------- | ------------------- | ----------- | ------------------------ | ----------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| `pass.access` | Entrar a Vento Pass | `BASE_ONLY` | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base. | La superficie administrativa de Vento Pass pertenece al dominio cliente y no forma parte de la matriz base del supervisor. |

##### 7.9 PULSO — 2 permisos

| Permiso                              | Capacidad humana                        | Modalidad              | Decisión para supervisor | Alcance aprobado                                                  | Condición                                                                                                                                                                                                          |
| ------------------------------------ | --------------------------------------- | ---------------------- | ------------------------ | ----------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `pulso.access`                       | Entrar a PULSO                          | `OPERATIONAL_ONLY`     | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base. | El rol supervisor no concede esta capacidad. Solo podrá obtenerse mediante una matriz operativa compatible, turno y demás prerrequisitos canónicos.                                                                |
| `pulso.delivery.deliveries.override` | Confirmar entregas de forma excepcional | `BASE_AND_OPERATIONAL` | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base. | La acción combina autoridad permanente con ejecución operativa sensible. El supervisor no recibe el componente base por defecto; requiere una capacidad futura más específica o una excepción individual aprobada. |

##### 7.10 VISO — 17 permisos

| Permiso                                       | Capacidad humana                          | Modalidad   | Decisión para supervisor | Alcance aprobado                                                                                                    | Condición                                                                                                                                       |
| --------------------------------------------- | ----------------------------------------- | ----------- | ------------------------ | ------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| `viso.access`                                 | Entrar a VISO                             | `BASE_ONLY` | **ASIGNAR**              | NT-APP — acceso a la aplicación. La autorización interna continúa limitada por AS/AA y por el recurso.              | Carril base. No requiere turno ni check-in. Entrar a la aplicación no amplía la cobertura territorial.                                          |
| `viso.platform.app_updates.view`              | Consultar actualizaciones de aplicaciones | `BASE_ONLY` | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                   | Las actualizaciones de plataforma son información técnica transversal, no una función de supervisión local.                                     |
| `viso.organization.businesses.view`           | Consultar empresas y unidades de negocio  | `BASE_ONLY` | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                   | La estructura de empresas y unidades de negocio es información organizacional superior; el supervisor opera sobre sedes asignadas ya resueltas. |
| `viso.workforce.employees.view`               | Consultar trabajadores                    | `BASE_ONLY` | **ASIGNAR**              | AS/AA — trabajadores, turnos, documentos o vacantes vinculados a sedes o áreas activamente asignadas al supervisor. | Carril base. No requiere turno ni check-in. La persona o recurso objetivo debe pertenecer a la cobertura administrativa autorizada.             |
| `viso.workforce.staff_calendar.view`          | Consultar calendario del personal         | `BASE_ONLY` | **ASIGNAR**              | AS/AA — trabajadores, turnos, documentos o vacantes vinculados a sedes o áreas activamente asignadas al supervisor. | Carril base. No requiere turno ni check-in. La persona o recurso objetivo debe pertenecer a la cobertura administrativa autorizada.             |
| `viso.workforce.schedules.view`               | Consultar programación de turnos          | `BASE_ONLY` | **ASIGNAR**              | AS/AA — trabajadores, turnos, documentos o vacantes vinculados a sedes o áreas activamente asignadas al supervisor. | Carril base. No requiere turno ni check-in. La persona o recurso objetivo debe pertenecer a la cobertura administrativa autorizada.             |
| `viso.workforce.vacancies.view`               | Consultar vacantes                        | `BASE_ONLY` | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                   | La gestión de vacantes pertenece al proceso administrativo de contratación y no a la supervisión local ordinaria.                               |
| `viso.authorization.context_simulations.view` | Consultar simulaciones de autorización    | `BASE_ONLY` | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                   | La simulación de autorización es una capacidad sensible de seguridad y no se concede al supervisor.                                             |
| `viso.authorization.audit_logs.view`          | Consultar auditoría de autorización       | `BASE_ONLY` | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                   | La auditoría de autorización es una capacidad sensible de seguridad y no una función de seguimiento operativo.                                  |
| `viso.catalog.commercial_categories.view`     | Consultar categorías comerciales          | `BASE_ONLY` | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                   | Las categorías comerciales pertenecen al catálogo transversal; no son necesarias para la supervisión local general.                             |
| `viso.content.content_blocks.view`            | Consultar bloques de contenido            | `BASE_ONLY` | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                   | Los bloques de contenido pertenecen a la administración transversal de contenido.                                                               |
| `viso.content.menu.view`                      | Consultar menú                            | `BASE_ONLY` | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                   | El menú es un catálogo transversal. Su consulta administrativa no se concede por defecto al supervisor.                                         |
| `viso.content.website_content.view`           | Consultar contenido del sitio web         | `BASE_ONLY` | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                   | El contenido web pertenece a una responsabilidad funcional transversal.                                                                         |
| `viso.finance.accounting.view`                | Consultar información contable            | `BASE_ONLY` | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                   | La información contable es financiera sensible completa y queda fuera de la matriz base del supervisor.                                         |
| `viso.delivery.rates.view`                    | Consultar tarifas de entrega              | `BASE_ONLY` | **ASIGNAR**              | AS/SS/AA/SA explícitos — tarifas aplicables a sedes o áreas asignadas.                                              | Carril base. Solo consulta para operación local; no modifica tarifas ni políticas de entrega.                                                   |
| `viso.loyalty.products.view`                  | Consultar productos de fidelización       | `BASE_ONLY` | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                   | Los productos de fidelización pertenecen al dominio cliente y requieren responsabilidad funcional específica.                                   |
| `viso.loyalty.customers.view`                 | Consultar clientes de fidelización        | `BASE_ONLY` | **NO ASIGNAR**           | — Denegación por defecto; no se crea concesión en la matriz base.                                                   | Los datos de clientes de fidelización son sensibles y no corresponden a supervisión laboral local.                                              |

#### 8. Resumen por aplicación

| Aplicación |   Total | Directas por carril base | Componente base de doble condición | No asignadas |
| ---------- | ------: | -----------------------: | ---------------------------------: | -----------: |
| SHELL      |       1 |                        1 |                                  0 |            0 |
| ANIMA      |      10 |                        7 |                                  0 |            3 |
| AURA       |       1 |                        0 |                                  0 |            1 |
| FOGO       |       6 |                        3 |                                  0 |            3 |
| NEXO       |      63 |                       38 |                                  0 |           25 |
| NUMERA     |       6 |                        0 |                                  0 |            6 |
| ORIGO      |       5 |                        4 |                                  0 |            1 |
| VENTO PASS |       1 |                        0 |                                  0 |            1 |
| PULSO      |       2 |                        0 |                                  0 |            2 |
| VISO       |      17 |                        5 |                                  0 |           12 |
| **Total**  | **112** |                   **58** |                              **0** |       **54** |

#### 9. Frontera frente a gerente

La diferencia entre `gerente` y `supervisor` es funcional, no solo cuantitativa:

```text
gerente
→ administración integral de las sedes asignadas

supervisor
→ seguimiento y coordinación local limitada
```

El supervisor puede consultar la operación y realizar acciones locales expresamente concedidas, pero no hereda las configuraciones, aprobaciones, anulaciones ni vistas financieras del gerente. La existencia de un gerente ausente, una urgencia operativa o una sede seleccionada no amplía automáticamente esta matriz.

#### 10. Capacidades expresamente no concedidas

Además de las capacidades exclusivamente operativas, se mantienen sin concesión base las que permiten:

- eliminar documentos laborales o invitar trabajadores;
- cancelar turnos;
- crear productos o activos;
- modificar catálogos y plantillas estructurales;
- registrar entradas excepcionales o cancelar remisiones;
- generar, emitir o cancelar facturación interna;
- consultar importes, precios internos, márgenes, rentabilidad, contabilidad o reportes financieros completos;
- aprobar o resolver variaciones internas;
- confirmar entregas de forma excepcional;
- administrar contenido transversal, fidelización, seguridad o arquitectura organizacional;
- ejecutar cualquier permiso `BASE_AND_OPERATIONAL` cuyo componente base esté reservado a una autoridad superior.

Estas capacidades no se consideran concedidas por subordinación, suplencia informal ni responsabilidad diaria.

#### 11. Brechas del catálogo identificadas

Las responsabilidades conceptuales aprobadas para supervisor incluyen funciones que los 112 permisos actuales no representan con suficiente precisión:

- consultar asistencia y gestionar novedades laborales mediante capacidades separadas;
- consultar ventas operativas sin recibir una función de caja;
- validar tareas o cierres autorizados;
- distinguir creación de borrador, publicación, actualización y cancelación de turnos;
- distinguir una corrección menor de un ajuste sensible;
- distinguir actualización ordinaria de una remisión de su anulación o cambio irreversible.

Estas brechas:

- no autorizan acciones implícitas;
- no se resuelven reutilizando permisos amplios;
- permanecen denegadas cuando no exista una clave exacta;
- deberán producir una nueva versión del catálogo antes de ampliar esta matriz.

#### 12. Tratamientos especiales

##### 12.1 Programación de personal

El supervisor puede crear y actualizar turnos dentro de sus sedes y áreas autorizadas. No puede cancelar turnos, cambiar roles base, crear cobertura territorial ni administrar relaciones laborales de otras sedes. Cualquier publicación o aprobación superior que el flujo defina deberá conservarse.

##### 12.2 Documentos y fotografías

Puede consultar y cargar documentos o fotografías dentro de su equipo local. No puede eliminar documentos ni utilizar estas capacidades para modificar identidad, rol, sede o perfil administrativo.

##### 12.3 Remisiones y correcciones locales

Puede consultar y actualizar remisiones únicamente en estados y campos ordinariamente editables. La actualización no incluye cancelar, preparar, despachar, recibir ni modificar efectos ya consolidados. Las operaciones físicas continúan en las matrices operativas.

##### 12.4 Información financiera limitada

Puede consultar estados de facturas internas, variaciones y centros de costo cuando sean necesarios para seguimiento local. No recibe valores protegidos, precios internos, margen, rentabilidad, contabilidad ni autoridad para aprobar, resolver, emitir o cancelar.

##### 12.5 Compras y proveedores

Puede revisar órdenes, recepciones y los datos operativos mínimos de proveedores relacionados con sus sedes. Los términos contractuales, datos financieros y gobierno del catálogo permanecen fuera de su matriz.

#### 13. Relación con el estado legacy

El rol `supervisor` no aparece todavía como rol base plenamente implementado en el inventario auditado. Por tanto, esta matriz no deberá construirse copiando permisos de `gerente`, `auxiliar_administrativa` ni de un oficio operativo legacy.

Durante la implementación se deberá:

```text
CREAR O VALIDAR ROL BASE supervisor
→ PROYECTAR SOLO AUTH-RBAC-004
→ ASIGNAR COBERTURA TERRITORIAL EXPLÍCITA
→ IMPEDIR HERENCIA GLOBAL
→ PROBAR SEPARACIÓN FRENTE A gerente
```

Cualquier uso previo del término supervisor en frontend, políticas o datos deberá inventariarse antes de vincularlo con este rol canónico.

#### 14. Validaciones de integridad

| Validación                       | Resultado |
| -------------------------------- | --------- |
| Permisos canónicos evaluados     | 112       |
| Permisos omitidos                | 0         |
| Permisos duplicados              | 0         |
| Claves con concesión base        | 58        |
| Capacidades directas             | 58        |
| Capacidades de doble condición   | 0         |
| Capacidades sin concesión base   | 54        |
| Concesiones con alcance global G | 0         |
| Wildcards                        | 0         |
| Bypasses por nombre de rol       | 0         |
| Acceso automático a APP-REVIEW   | 0         |

#### 15. Impacto sobre tareas posteriores

- `AUTH-RBAC-005` deberá definir la matriz funcional de `auxiliar_administrativa` sin convertirla en una supervisora territorial ni en autoridad organizacional general.
- `AUTH-RBAC-008` a `AUTH-RBAC-019` definirán las capacidades operativas que un supervisor podrá obtener durante un turno mediante un rol operativo independiente.
- `AUTH-RBAC-020` a `AUTH-RBAC-022` podrán representar suplencias o responsabilidades especiales mediante excepciones individuales con vigencia y justificación, sin ampliar esta matriz general.
- `AUTH-RBAC-024` deberá proyectar `AS`, `AA`, `ORG-LOCAL` y `AS-REL` sin utilizar alcance global.
- `AUTH-RBAC-027` deberá comprobar que las vistas relacionales no expongan sedes no asignadas ni campos financieros protegidos.
- `AUTH-RBAC-028` deberá probar que la supervisión administrativa funciona sin turno y que las acciones operativas continúan bloqueadas sin contexto válido.

#### 16. Criterios de aprobación

AUTH-RBAC-004 podrá aprobarse cuando se acepte expresamente que:

- el supervisor recibe 58 capacidades base directas y no un wildcard;
- 54 capacidades permanecen sin concesión base;
- no recibe componentes base de permisos `BASE_AND_OPERATIONAL`;
- su autoridad se limita a sedes y áreas activamente asignadas;
- puede consultar y hacer seguimiento de la operación local;
- puede apoyar la programación mediante creación y actualización limitada de turnos, pero no cancelarlos;
- puede cargar documentos y fotografías, pero no eliminarlos ni administrar identidades;
- puede efectuar únicamente las actualizaciones ordinarias expresamente representadas, sin anulaciones ni aprobaciones sensibles;
- no recibe NUMERA, contabilidad, márgenes, importes internos ni gobierno de seguridad;
- no hereda permisos del gerente ni obtiene autoridad por suplencia informal;
- las brechas del catálogo se registran y permanecen denegadas;
- no se implementa todavía ningún cambio físico.

#### 17. Estado final de la propuesta

| Tarea         | Estado      |
| ------------- | ----------- |
| AUTH-RBAC-001 | APROBADA    |
| AUTH-RBAC-002 | APROBADA    |
| AUTH-RBAC-003 | APROBADA    |
| AUTH-RBAC-004 | APROBADA    |
| AUTH-RBAC-005 | NO INICIADA |

No se avanza a AUTH-RBAC-005 hasta recibir aprobación explícita.
