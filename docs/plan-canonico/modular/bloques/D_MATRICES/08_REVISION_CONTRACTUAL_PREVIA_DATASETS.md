## REVISIÓN CONTRACTUAL PREVIA A DATASETS

### ✅ AUTH-CAT-020 — Consolidar brechas contractuales detectadas por las matrices

**Estado:** APROBADA  
**Bloque:** BLOQUE D — Revisión contractual previa a datasets  
**Naturaleza:** Consolidación documental y trazable de brechas contractuales  
**Implementación física:** No incluida  
**Catálogo vigente de referencia:** 112 permisos canónicos  
**Versión del catálogo:** Sin modificación durante esta tarea  
**Tarea anterior vigente:** AUTH-RBAC-023 — APROBADA  
**Tarea posterior reservada:** AUTH-CAT-021 — Clasificar brechas listas para catálogo y brechas diferidas a roadmaps funcionales

Esta tarea no crea permisos, no aprueba claves candidatas, no modifica matrices, no publica una nueva versión del catálogo y no altera Supabase, RLS, RPC, aplicaciones, dispositivos, datasets ni migraciones.

La tarea produce exclusivamente un **registro consolidado, deduplicado y trazable de brechas** que servirá como entrada obligatoria para AUTH-CAT-021 a AUTH-CAT-024.

---

#### 1. Objetivo

Consolidar en un único inventario contractual todas las capacidades, descomposiciones, decisiones de propiedad funcional y vacíos estructurales identificados durante:

- AUTH-RBAC-009 a AUTH-RBAC-019 — matrices operativas y gerencia operativa;
- AUTH-RBAC-020 y AUTH-RBAC-021 — concesiones individuales base y operativas;
- AUTH-RBAC-022 — denegaciones individuales y transversales;
- AUTH-RBAC-023 — capacidades permitidas por dispositivo compartido;
- AUTH-CAT-003 a AUTH-CAT-019 — deuda legacy, clasificación y contratos del catálogo vigente.

La consolidación debe impedir que una misma necesidad aparezca repetida bajo nombres distintos en varias matrices y debe separar claramente:

1. capacidades empresariales faltantes;
2. permisos legacy demasiado amplios;
3. decisiones pendientes de aplicación propietaria;
4. brechas de contrato de recurso o ciclo de vida;
5. brechas estructurales de autorización o persistencia;
6. asuntos de implementación que no pertenecen al catálogo.

---

#### 2. Decisión principal

Las observaciones detectadas durante las matrices no se convertirán automáticamente en permisos.

```text
HALLAZGO EN UNA MATRIZ
        ↓
REGISTRO CONSOLIDADO DE BRECHA
        ↓
CLASIFICACIÓN DE MADUREZ
        ↓
DEFINICIÓN FUNCIONAL Y PROPIETARIO
        ↓
PROPUESTA DE CLAVE ATÓMICA, SI CORRESPONDE
        ↓
CLASIFICACIÓN COMPLETA DEL PERMISO
        ↓
REVISIÓN DE MATRICES AFECTADAS
        ↓
NUEVA VERSIÓN DEL CATÁLOGO
```

Reglas definitivas:

```text
BRECHA DOCUMENTADA
≠
PERMISO APROBADO
```

```text
NOMBRE PRELIMINAR
≠
PERMISSION_KEY CANÓNICA
```

```text
PROBLEMA DE TABLA, CONTEXTO O IMPLEMENTACIÓN
≠
NUEVO PERMISO
```

El catálogo vigente permanece en **112 permisos canónicos** hasta que AUTH-CAT-024 publique expresamente una nueva versión.

---

#### 3. Base normativa

Esta propuesta conserva sin cambios:

- ADR-AUTH-001 — Modelo canónico de identidad, contexto y autorización;
- AUTH-MOD-001 a AUTH-MOD-020;
- AUTH-CAT-001 a AUTH-CAT-019;
- AUTH-RBAC-001 a AUTH-RBAC-023;
- la convención `<app>.<module>.<resource>.<action>`;
- las cuatro modalidades de autorización;
- los alcances, prerrequisitos de turno, check-in y área;
- los contratos de recurso;
- la sensibilidad, simulación y compatibilidad con dispositivos;
- la precedencia de denegaciones;
- la regla de denegación por defecto;
- la prohibición de herencia por prefijo;
- la prohibición de convertir permisos amplios en aliases hacia varias capacidades.

También conserva la regla aprobada para permisos `DECOMPOSE_REQUIRED`:

```text
INVENTARIAR OPERACIONES REALES
→ CREAR PERMISOS ATÓMICOS
→ EVALUAR CADA PERMISO POR SEPARADO
→ NO COPIAR AUTOMÁTICAMENTE LA CONCESIÓN LEGACY
```

---

#### 4. Alcance de AUTH-CAT-020

Esta tarea sí define:

- identificadores documentales estables para cada brecha consolidada;
- aplicación propietaria candidata;
- dominio funcional afectado;
- descripción empresarial de la necesidad;
- permisos actuales que no deben ampliarse para cubrirla;
- matrices o capas que originaron el hallazgo;
- roles potencialmente afectados;
- dependencia funcional pendiente;
- relación con deuda legacy conocida;
- estado común `CONSOLIDATED_UNCLASSIFIED`;
- reglas de deduplicación y trazabilidad;
- entrada mínima exigida para AUTH-CAT-021.

Esta tarea no define:

- claves canónicas finales;
- modalidad, alcance, sensibilidad o solo lectura de permisos nuevos;
- requisitos definitivos de turno, check-in, área o dispositivo;
- contrato final de recurso de una capacidad nueva;
- matrices actualizadas;
- aliases o fechas de retiro legacy;
- estructura física de tablas;
- funciones SQL, RLS, RPC o Server Actions;
- pantallas definitivas;
- migraciones, backfills o limpieza de datos.

---

#### 5. Modelo canónico de registro de brecha

Cada brecha consolidada deberá quedar representada conceptualmente por:

| Campo                 | Significado                                                                     |
| --------------------- | ------------------------------------------------------------------------------- |
| `gap_id`              | Identificador documental estable de la brecha.                                  |
| `gap_type`            | Tipo de brecha: capacidad, descomposición, propiedad, contrato o estructura.    |
| `owner_candidate`     | Aplicación o dominio candidato a ser propietario. No constituye decisión final. |
| `business_capability` | Acción o resultado empresarial ausente o insuficientemente separado.            |
| `current_contract`    | Permiso o contrato actual relacionado.                                          |
| `forbidden_inference` | Permiso actual que no puede ampliarse para cubrir la brecha.                    |
| `source_tasks`        | Tareas que originaron o confirmaron el hallazgo.                                |
| `affected_roles`      | Roles cuyas matrices podrían requerir revisión posterior.                       |
| `required_definition` | Información funcional necesaria antes de crear una clave.                       |
| `legacy_relation`     | Permiso legacy amplio relacionado, cuando exista.                               |
| `status`              | Estado de la brecha dentro del proceso contractual.                             |

Estado inicial común:

```text
CONSOLIDATED_UNCLASSIFIED
```

Este estado significa:

- la brecha está reconocida y trazada;
- todavía no se decide si está madura;
- todavía no existe una clave canónica nueva;
- continúa aplicando denegación por defecto.

---

#### 6. Reglas de consolidación y deduplicación

1. Una misma capacidad descrita en varias matrices se registra una sola vez.
2. Las diferencias por actor se conservan como roles afectados, no como permisos distintos por rol.
3. Las diferencias reales de acción, recurso, estado o autoridad se mantienen separadas.
4. Una pantalla, ruta, botón o herramienta no constituye una brecha de permiso por sí misma.
5. Una ausencia de UI no implica ausencia de contrato y viceversa.
6. Los permisos de entrada `<app>.access` nunca absorben capacidades internas faltantes.
7. Los permisos de consulta no absorben mutaciones.
8. Los permisos de creación no absorben ejecución, aprobación, cierre o reversión.
9. Los permisos de actualización no absorben cambios de cualquier campo o estado.
10. Los permisos de cancelación no absorben reversión de efectos ya materializados.
11. Los permisos técnicos de impresión o escaneo no reemplazan la capacidad empresarial ejecutada.
12. Una brecha transversal deberá tener un propietario funcional único o un contrato compartido explícito.
13. Las brechas estructurales se separan del backlog de permisos.
14. Ningún nombre provisional incluido en esta tarea podrá utilizarse directamente en código.

---

#### 7. Resultado ejecutivo de la consolidación

Se establecen cinco inventarios coordinados:

| Inventario | Contenido                                                   | Resultado de esta tarea                                |
| ---------- | ----------------------------------------------------------- | ------------------------------------------------------ |
| A          | Capacidades empresariales faltantes detectadas por matrices | Consolidado por dominio y aplicación candidata         |
| B          | Permisos legacy amplios `DECOMPOSE_REQUIRED`                | 21 claves preservadas como deuda contractual bloqueada |
| C          | Decisiones pendientes de propiedad funcional                | Consolidación sin adjudicación definitiva              |
| D          | Brechas estructurales de autorización y persistencia        | Separadas del catálogo de permisos                     |
| E          | Cambios físicos o de implementación                         | Diferidos a BLOQUE E, E3, R y QA                       |

No se suman los inventarios A y B como si fueran brechas independientes, porque varias capacidades faltantes pueden ser precisamente el resultado futuro de descomponer una clave legacy amplia.

---

#### INVENTARIO A — CAPACIDADES EMPRESARIALES FALTANTES

##### 8. PULSO — Operación comercial, atención y producción satélite

Las matrices de `barista_satelite`, `cocinero_satelite`, `servicio_salon`, `mostrador_satelite`, `operador_integral_satelite` y `gerencia_operativa` convergen en las siguientes familias consolidadas.

| Gap ID          | Capacidad empresarial ausente                                                                                              | No inferir desde                               | Fuentes principales          | Roles potencialmente afectados                                         |
| --------------- | -------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------- | ---------------------------- | ---------------------------------------------------------------------- |
| `GAP-PULSO-001` | Consultar cola, detalle, modificadores, notas, alergias, prioridad y asignación de pedidos o comandas.                     | `pulso.access`                                 | AUTH-RBAC-009 a 013, 019     | barra, cocina, salón, mostrador, operador integral, gerencia operativa |
| `GAP-PULSO-002` | Reclamar, aceptar o iniciar preparación y registrar su responsable.                                                        | `pulso.access`                                 | AUTH-RBAC-009, 010, 013      | barra, cocina, operador integral                                       |
| `GAP-PULSO-003` | Ejecutar transiciones atómicas de preparación: pendiente, en preparación, listo, rechazado o entregado al siguiente actor. | `pulso.access`                                 | AUTH-RBAC-009, 010, 012, 013 | barra, cocina, mostrador, operador integral                            |
| `GAP-PULSO-004` | Registrar indisponibilidad, agotado, sustitución o solicitud de aclaración de un ítem.                                     | `pulso.access`                                 | AUTH-RBAC-009, 010, 011, 013 | barra, cocina, salón, operador integral                                |
| `GAP-PULSO-005` | Registrar rehacer, error, devolución a preparación, merma, derrame o desperdicio con causa.                                | `pulso.access`; ajustes de inventario          | AUTH-RBAC-009, 010, 011, 013 | barra, cocina, salón, operador integral, gerencia operativa            |
| `GAP-PULSO-006` | Gestionar mesas, zonas, apertura de servicio, traslado, unión, separación y cierre operativo del servicio.                 | `pulso.access`; `pulso.pos.main`               | AUTH-RBAC-011, 013, 019      | servicio de salón, operador integral, gerencia operativa               |
| `GAP-PULSO-007` | Crear y actualizar pedidos dentro de estados y campos permitidos.                                                          | `pulso.access`; `pulso.pos.main`               | AUTH-RBAC-011, 013, 019      | salón, mostrador, operador integral, caja, gerencia operativa          |
| `GAP-PULSO-008` | Alistar, empacar, validar integridad y preparar entrega por canal.                                                         | `pulso.access`; `delivery.override`            | AUTH-RBAC-012, 013           | mostrador, operador integral                                           |
| `GAP-PULSO-009` | Confirmar entrega ordinaria, identidad del receptor, canal, hora y evidencia básica.                                       | `pulso.delivery.deliveries.override`           | AUTH-RBAC-011, 012, 013      | salón, mostrador, operador integral                                    |
| `GAP-PULSO-010` | Crear ventas y aplicar reglas comerciales ordinarias autorizadas.                                                          | `pulso.pos.main`                               | AUTH-RBAC-013, 019           | cajero, operador integral, gerencia operativa                          |
| `GAP-PULSO-011` | Cobrar, registrar medio de pago, emitir comprobante y separar reversión de pago.                                           | `pulso.pos.main`                               | AUTH-RBAC-011, 013, 019      | cajero, operador integral, gerencia operativa                          |
| `GAP-PULSO-012` | Abrir, operar, controlar y cerrar sesión de caja mediante acciones separadas.                                              | `pulso.pos.main`                               | AUTH-RBAC-013, 019           | cajero, operador integral, gerencia operativa                          |
| `GAP-PULSO-013` | Anular, devolver, descontar, corregir o reabrir mediante permisos sensibles independientes.                                | `pulso.pos.main`; permisos ordinarios de venta | AUTH-RBAC-013, 019           | caja, operador integral, gerencia autorizada                           |
| `GAP-PULSO-014` | Acumular y redimir fidelización mediante acciones laborales separadas del acceso normal del cliente PASS.                  | `pulso.pos.main`; `pass.access`                | AUTH-RBAC-013                | caja, operador integral y actores autorizados                          |
| `GAP-PULSO-015` | Consultar tiempos, alertas, prioridades, historial operativo y supervisión comercial con alcance controlado.               | `pulso.access`                                 | AUTH-RBAC-009 a 013, 019     | roles operativos y gerencia operativa según proyección                 |
| `GAP-PULSO-016` | Resolver pedidos no reclamados, entregas parciales, incidencias y canales fallidos sin usar override genérico.             | `delivery.override`; cancelación genérica      | AUTH-RBAC-012, 013, 019      | mostrador, operador integral, gerencia autorizada                      |

Decisión de consolidación:

- Las variantes de barra, cocina, salón y mostrador no generan claves distintas únicamente por el nombre del área.
- AUTH-CAT-021 deberá determinar qué capacidades son comunes y cuáles tienen recursos o transiciones diferentes.
- `pulso.pos.main` permanece como deuda legacy amplia y bloqueada.

---

##### 9. FOGO — Ejecución y supervisión productiva

Las matrices de `produccion_cocina`, `produccion_panaderia`, `produccion_reposteria` y `gerencia_operativa` convergen en las siguientes familias.

| Gap ID         | Capacidad empresarial ausente                                                                            | No inferir desde                             | Fuentes principales                     | Roles potencialmente afectados             |
| -------------- | -------------------------------------------------------------------------------------------------------- | -------------------------------------------- | --------------------------------------- | ------------------------------------------ |
| `GAP-FOGO-001` | Aceptar o iniciar una orden de producción asignada.                                                      | `production.orders.view`; `batches.create`   | AUTH-RBAC-014 a 016                     | roles de producción y gerencia operativa   |
| `GAP-FOGO-002` | Ejecutar transiciones atómicas de orden o lote: iniciar, pausar, reanudar, terminar, cancelar o reabrir. | `batches.create`                             | AUTH-RBAC-014 a 016, 019                | producción y gerencia según acción         |
| `GAP-FOGO-003` | Registrar cantidades planificadas, producidas, rechazadas, aprovechables y rendimiento.                  | `batches.create`                             | AUTH-RBAC-014 a 016                     | producción y supervisión                   |
| `GAP-FOGO-004` | Registrar consumo teórico y real por insumo y sus diferencias.                                           | permisos de consulta de inventario           | AUTH-RBAC-014 a 016                     | producción y supervisión                   |
| `GAP-FOGO-005` | Registrar sustitución autorizada de ingrediente o insumo.                                                | edición genérica del lote o receta           | AUTH-RBAC-014 a 016                     | producción y autoridad aprobadora          |
| `GAP-FOGO-006` | Registrar merma, desperdicio, reproceso y causa.                                                         | ajuste de inventario; edición del lote       | AUTH-RBAC-014 a 016                     | producción y supervisión                   |
| `GAP-FOGO-007` | Registrar tiempos, temperatura, responsables, controles y evidencia del proceso.                         | `batches.create`; notas libres               | AUTH-RBAC-014 a 016                     | producción y calidad                       |
| `GAP-FOGO-008` | Registrar control de calidad, liberación o rechazo mediante autoridad separada.                          | cierre ordinario del lote                    | AUTH-RBAC-014 a 016                     | producción, calidad y autoridad base       |
| `GAP-FOGO-009` | Confirmar producto terminado, presentación, lote, vencimiento y ubicación destino.                       | `batches.create`; entradas genéricas de NEXO | AUTH-RBAC-014 a 016                     | producción y bodega según custodia         |
| `GAP-FOGO-010` | Emitir efectos idempotentes hacia inventario NEXO por consumo y producto terminado.                      | acceso simultáneo a FOGO y NEXO              | AUTH-RBAC-014 a 016                     | servicios de dominio y actores autorizados |
| `GAP-FOGO-011` | Corregir o revertir una ejecución productiva sin edición destructiva.                                    | update genérico; ajuste de inventario        | AUTH-RBAC-014 a 016                     | autoridad definida y supervisión           |
| `GAP-FOGO-012` | Consultar historial y evidencia completa del lote con alcance controlado.                                | `batches.view` sin contrato de proyección    | AUTH-RBAC-014 a 016, 019                | producción y gerencia operativa            |
| `GAP-FOGO-013` | Reprogramar, escalar o coordinar incidencias de producción.                                              | `batches.create`; permisos de recetas        | AUTH-RBAC-019                           | gerencia operativa y autoridad productiva  |
| `GAP-FOGO-014` | Separar administración del recetario en acciones atómicas sobre recetas y publicación.                   | `fogo.production.recipes.manage`             | AUTH-CAT-003 a 019; AUTH-RBAC-014 a 016 | roles administrativos que correspondan     |

Decisión de consolidación:

- Cocina caliente, panadería y repostería comparten el ciclo contractual base.
- Las diferencias de fórmula, control o equipo pertenecen al recurso y al proceso, no necesariamente a claves diferentes.
- `fogo.production.recipes.manage` permanece bloqueado hasta descomposición.

---

##### 10. NEXO — Inventario, remisiones y logística

| Gap ID         | Capacidad empresarial ausente o demasiado amplia                                                              | No inferir desde                                          | Fuentes principales                 | Roles potencialmente afectados                           |
| -------------- | ------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------- | ----------------------------------- | -------------------------------------------------------- |
| `GAP-NEXO-001` | Registrar cuarentena, rechazo, vencimiento, avería, daño o merma de inventario mediante flujos diferenciados. | entradas ordinarias; ajustes genéricos                    | AUTH-RBAC-017                       | bodega, supervisión y autoridad de calidad               |
| `GAP-NEXO-002` | Aprobar o resolver diferencias de conteo de forma separada de la captura.                                     | `stock_counts.perform`; ajuste automático                 | AUTH-RBAC-017                       | bodeguero como capturador; autoridad base como aprobador |
| `GAP-NEXO-003` | Limitar actualización de remisiones por campos, actor y estado.                                               | `nexo.inventory.remissions.update` como edición universal | AUTH-RBAC-019                       | solicitantes, preparación y gerencia según campo         |
| `GAP-NEXO-004` | Diferenciar cancelación previa, cancelación con preparación y reversión después de movimientos o custodia.    | `remissions.cancel`                                       | AUTH-RBAC-019                       | gerencia y autoridades definidas                         |
| `GAP-NEXO-005` | Separar aceptación de custodia por el conductor e inicio de tránsito.                                         | `remissions.dispatch` como acción única                   | AUTH-RBAC-018                       | bodega y conductor logística                             |
| `GAP-NEXO-006` | Registrar entrega física ordinaria y transferencia de custodia al receptor.                                   | `dispatch`; `receive`                                     | AUTH-RBAC-018                       | conductor y receptor autorizado                          |
| `GAP-NEXO-007` | Registrar prueba de entrega: firma, fotografía, código, sello u otra evidencia aprobada.                      | permiso de entrega genérico                               | AUTH-RBAC-018                       | conductor, receptor y supervisión limitada               |
| `GAP-NEXO-008` | Registrar incidentes de transporte: avería, faltante, rechazo, accidente, demora o imposibilidad.             | ajuste, cancelación o nota libre                          | AUTH-RBAC-018, 019                  | conductor y gerencia operativa                           |
| `GAP-NEXO-009` | Registrar llegada, salida, omisión, reprogramación y progreso de una parada.                                  | `operations.view`; consulta de ruta                       | AUTH-RBAC-018                       | conductor y coordinación logística                       |
| `GAP-NEXO-010` | Registrar entrega fallida, devolución y transferencia de custodia de retorno.                                 | cancelación o recepción ordinaria                         | AUTH-RBAC-018                       | conductor, bodega, destino y gerencia                    |
| `GAP-NEXO-011` | Inspeccionar, aceptar y asignar vehículo; registrar checklist, kilometraje y combustible.                     | permisos genéricos de activos                             | AUTH-RBAC-018                       | conductor y gestión logística                            |
| `GAP-NEXO-012` | Reasignar actor, ruta, vehículo o responsable por emergencia con vigencia y auditoría.                        | update genérico; cambio directo de registros              | AUTH-RBAC-019                       | gerencia operativa y autoridad logística                 |
| `GAP-NEXO-013` | Registrar incidentes operativos transversales sin convertirlos en ajustes, cancelaciones o notas.             | ajustes; cancelaciones; notas libres                      | AUTH-RBAC-019                       | producción, inventario, transporte y gerencia            |
| `GAP-NEXO-014` | Imprimir o reimprimir documentos, etiquetas o comprobantes vinculados a una operación empresarial.            | `printing.jobs.view`; acceso al diseñador                 | AUTH-RBAC-017 y matrices operativas | bodega, producción, logística y actores autorizados      |

Decisión de consolidación:

- La impresión se registra aquí como capacidad empresarial vinculada a recursos NEXO, pero AUTH-CAT-021 deberá decidir si existe una familia transversal de impresión o acciones por dominio.
- Las incidencias no podrán resolverse ampliando ajustes o cancelaciones.
- `remissions.update`, `remissions.cancel` y `remissions.dispatch` deberán conservar contratos estrictos mientras se decide si requieren descomposición adicional.

---

##### 11. ORIGO — Recepción y abastecimiento

| Gap ID          | Capacidad empresarial ausente                                     | No inferir desde                     | Fuentes principales | Roles potencialmente afectados               |
| --------------- | ----------------------------------------------------------------- | ------------------------------------ | ------------------- | -------------------------------------------- |
| `GAP-ORIGO-001` | Registrar formalmente la recepción física de una orden de compra. | `origo.procurement.receipts.view`    | AUTH-RBAC-017       | bodeguero, receptor de compras y supervisión |
| `GAP-ORIGO-002` | Separar administración de proveedores en acciones atómicas.       | `origo.procurement.suppliers.manage` | AUTH-CAT-003 a 019  | actores administrativos y de compras         |

Regla:

```text
CONSULTAR RECEPCIÓN
≠
REGISTRAR RECEPCIÓN
```

La entrada física en NEXO y la recepción comercial en ORIGO deberán coordinarse, pero no se fusionarán automáticamente en una sola autorización.

---

##### 12. VISO — Gobierno de excepciones y denegaciones

| Gap ID         | Capacidad empresarial ausente                                                                                    | No inferir desde                                           | Fuentes principales | Roles potencialmente afectados                        |
| -------------- | ---------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------- | ------------------- | ----------------------------------------------------- |
| `GAP-VISO-001` | Consultar, solicitar, crear, aprobar, activar, suspender, revocar y auditar concesiones individuales base.       | `staff.permissions.manage`; permisos de lectura            | AUTH-RBAC-020       | propietarios, gerencias y administradores autorizados |
| `GAP-VISO-002` | Consultar, solicitar, crear, aprobar, activar, suspender, revocar y auditar concesiones individuales operativas. | `staff.permissions.manage`; gestión de perfiles operativos | AUTH-RBAC-021       | propietarios, gerencias y administradores autorizados |
| `GAP-VISO-003` | Crear, aprobar, activar, revocar y auditar denegaciones de carril y bloqueos transversales.                      | gestión genérica de permisos                               | AUTH-RBAC-022       | autoridad de seguridad y recuperación                 |
| `GAP-VISO-004` | Separar las nueve familias legacy amplias de administración VISO en acciones atómicas.                           | permisos `*.manage` legacy                                 | AUTH-CAT-003 a 019  | roles administrativos según cada dominio              |

La futura administración deberá conservar segregación entre solicitante, aprobador y actor afectado cuando la sensibilidad lo exija.

---

##### 13. Dominios sin nuevas capacidades confirmadas por las matrices

| Aplicación | Resultado de AUTH-CAT-020                                                                                                                                      |
| ---------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| SHELL      | No se identifican nuevas capacidades empresariales; `shell.access` continúa como entrada al hub.                                                               |
| ANIMA      | Las matrices no introducen nuevas capacidades; las brechas de contexto, turnos y check-in se tratarán en BLOQUE E y roadmaps funcionales.                      |
| NUMERA     | No aparecen nuevas necesidades derivadas directamente de matrices; conserva dos permisos legacy amplios pendientes de descomposición.                          |
| AURA       | Continúa diferida; no se amplía el catálogo.                                                                                                                   |
| PASS       | No se amplía el RBAC laboral. Las operaciones de fidelización laboral deberán pertenecer a PULSO, VISO o al adaptador definido, sin mezclar la sesión cliente. |

---

#### INVENTARIO B — DEUDA LEGACY DE DESCOMPOSICIÓN

##### 14. Permisos `DECOMPOSE_REQUIRED` preservados

Los siguientes 21 permisos legacy continúan:

```text
catalog_status = deprecated
assignment_status = blocked
authorization_requirement = null
```

No reciben claves nuevas durante AUTH-CAT-020.

###### FOGO — 1

```text
fogo.production.recipes.manage
```

###### NEXO — 7

```text
nexo.settings.categories.manage
nexo.settings.units.manage
nexo.settings.supply_routes.manage
nexo.internal_prices.manage
nexo.cost_centers.manage
nexo.settings.sites.manage
nexo.settings.remissions.manage
```

###### NUMERA — 2

```text
numera.cost_centers.manage
numera.expenses.manage
```

###### ORIGO — 1

```text
origo.suppliers.manage
```

###### PULSO — 1

```text
pulso.pos.main
```

###### VISO — 9

```text
viso.app_navigation.manage
viso.employee_operational_profiles.manage
viso.menu.images.manage
viso.operational_points.manage
viso.site_operational_roles.manage
viso.staff.documents.manage
viso.staff.employee_photos.manage
viso.staff.manage
viso.staff.permissions.manage
```

Reglas:

1. Ninguna asignación legacy se copiará a todas las capacidades resultantes.
2. Cada acción resultante deberá evaluarse contra matrices base, operativas, excepciones, dispositivos y denegaciones.
3. Una capacidad funcional faltante del Inventario A puede convertirse en resultado de esta descomposición, pero la relación deberá declararse expresamente.
4. La descomposición efectiva corresponde a AUTH-CAT-022, después de la clasificación de AUTH-CAT-021.

---

#### INVENTARIO C — DECISIONES PENDIENTES DE PROPIEDAD FUNCIONAL

##### 15. Propiedad funcional por resolver

| Gap ID        | Decisión pendiente                                                         | Aplicaciones candidatas                                  | Regla temporal                                                             |
| ------------- | -------------------------------------------------------------------------- | -------------------------------------------------------- | -------------------------------------------------------------------------- |
| `GAP-OWN-001` | Propietario del recetario operativo utilizado por barra y cocina satélite. | PULSO, FOGO o contrato compartido con propietario único  | No conceder `fogo.production.recipe_book.view` por inferencia desde PULSO. |
| `GAP-OWN-002` | Propietario del flujo de impresión y reimpresión empresarial.              | Aplicación del proceso con servicio técnico compartido   | `printing.jobs.view` no autoriza imprimir.                                 |
| `GAP-OWN-003` | Propietario del incidente operativo transversal y su resolución.           | Dominio de origen, NEXO o servicio transversal gobernado | No utilizar ajustes, cancelaciones o notas como sustituto.                 |
| `GAP-OWN-004` | Frontera entre recepción comercial ORIGO y entrada/custodia física NEXO.   | ORIGO + NEXO mediante integración contractual            | Cada efecto conserva autorización propia.                                  |
| `GAP-OWN-005` | Frontera entre entrega comercial PULSO y transporte/custodia NEXO.         | PULSO + NEXO                                             | Entrega de pedido y handoff logístico no se fusionan por nombre.           |
| `GAP-OWN-006` | Propietario laboral de acumulación y redención de fidelización.            | PULSO, VISO o adaptador PASS                             | La identidad cliente PASS permanece separada del RBAC laboral.             |

AUTH-CAT-020 no adjudica estas propiedades. AUTH-CAT-021 deberá marcar cuáles requieren roadmap funcional previo.

---

#### INVENTARIO D — BRECHAS ESTRUCTURALES QUE NO SON PERMISOS

##### 16. Brechas del modelo de asignaciones y excepciones

| Gap ID           | Brecha estructural                                                                                           | Tratamiento posterior                                           |
| ---------------- | ------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------- |
| `GAP-STRUCT-001` | `employee_permissions` no distingue obligatoriamente carril base y operativo.                                | Diseño físico del BLOQUE E3 y dataset AUTH-RBAC-026.            |
| `GAP-STRUCT-002` | Una excepción operativa no declara roles o familias operativas compatibles.                                  | Contrato de excepción y estructura objetivo.                    |
| `GAP-STRUCT-003` | Las excepciones actuales no representan adecuadamente vigencia, motivo, aprobación, suspensión y revocación. | Ciclo de vida canónico y auditoría.                             |
| `GAP-STRUCT-004` | Las funciones actuales no consumen una única decisión de autorización.                                       | BLOQUE E — `AccessContext` y `AuthorizationDecision`.           |
| `GAP-STRUCT-005` | Los allows y denies legacy no poseen semántica física suficiente para todos los carriles.                    | BLOQUE E3, AUTH-RBAC-026 y BLOQUE R.                            |
| `GAP-STRUCT-006` | Existen concesiones individuales legacy redundantes y duplicadas.                                            | Reconciliación y backfill controlado; no crear permisos nuevos. |
| `GAP-STRUCT-007` | Los roles base legacy todavía pueden conceder capacidades operativas permanentes.                            | Transición de matrices y retiro controlado en BLOQUE R.         |
| `GAP-STRUCT-008` | La relación textual de permisos operativos carece de integridad referencial fuerte.                          | Arquitectura de datos y migración futura.                       |

Estas brechas no ingresan al catálogo como claves.

---

##### 17. Brechas de dispositivo y actor efectivo

| Gap ID           | Brecha estructural                                                                               | Tratamiento posterior                               |
| ---------------- | ------------------------------------------------------------------------------------------------ | --------------------------------------------------- |
| `GAP-DEVICE-001` | Plantillas legacy mezclan roles base y operativos en `navigation_role`.                          | Migración de plantillas definida por AUTH-RBAC-023. |
| `GAP-DEVICE-002` | `same_site_active_worker` es demasiado amplio para bodega y otras terminales especializadas.     | Política restrictiva de actor, sede, área y rol.    |
| `GAP-DEVICE-003` | No existen sesiones persistidas de actor humano en los dispositivos auditados.                   | BLOQUE E, E3 y R; no es una brecha de permiso.      |
| `GAP-DEVICE-004` | La identidad técnica puede terminar apareciendo como actor si no se aplica el contrato aprobado. | Separación principal técnico / actor efectivo.      |
| `GAP-DEVICE-005` | La reautenticación fuerte no puede ser sustituida por PIN ligero.                                | Contrato de autenticación y decisión unificada.     |
| `GAP-DEVICE-006` | Los permisos nuevos deben quedar bloqueados en plantillas hasta versionar paquetes e instancias. | Gobierno de versiones de dispositivos.              |

---

##### 18. Brechas de recurso, estado y transición

Las siguientes observaciones pueden exigir mejorar contratos de permisos existentes sin crear una clave nueva:

| Gap ID             | Contrato insuficiente                                                                     | Permisos relacionados                |
| ------------------ | ----------------------------------------------------------------------------------------- | ------------------------------------ |
| `GAP-CONTRACT-001` | Actualización de remisión sin lista de campos y estados permitidos.                       | `nexo.inventory.remissions.update`   |
| `GAP-CONTRACT-002` | Cancelación de remisión sin diferenciar etapa y efectos ya ejecutados.                    | `nexo.inventory.remissions.cancel`   |
| `GAP-CONTRACT-003` | Despacho que combina aceptación de custodia e inicio de tránsito.                         | `nexo.inventory.remissions.dispatch` |
| `GAP-CONTRACT-004` | Consulta de lote sin proyección diferenciada entre operador, supervisor y administración. | `fogo.production.batches.view`       |
| `GAP-CONTRACT-005` | Creación de lote sin límites claros frente a ejecución, cierre e inventario.              | `fogo.production.batches.create`     |
| `GAP-CONTRACT-006` | Override de entrega sin contrato de caso excepcional, evidencia y autoridad base.         | `pulso.delivery.deliveries.override` |

AUTH-CAT-021 deberá decidir para cada fila si procede:

- precisar el contrato del permiso existente;
- descomponer el permiso;
- crear una capacidad adicional;
- diferir la decisión al roadmap funcional.

---

#### INVENTARIO E — ASUNTOS DE IMPLEMENTACIÓN DIFERIDOS

##### 19. Hallazgos excluidos de creación de permisos

No se crearán permisos para resolver directamente:

- tablas sin columnas suficientes;
- llaves foráneas ausentes;
- índices únicos defectuosos;
- RLS incompletas;
- funciones SECURITY DEFINER;
- exposición RPC;
- idempotencia, concurrencia o versionado técnico;
- eventos fuera de orden;
- conectividad offline;
- ausencia de sesiones de actor;
- inconsistencias de `navigation_role`;
- falta de plantilla de dispositivo;
- migración de datos legacy;
- ausencia de pantalla;
- nombres de rutas o componentes;
- auditoría física o retención de evidencia.

Estos asuntos deberán resolverse en:

```text
BLOQUE E
→ contexto y decisión unificados

BLOQUE E2
→ procesos, pantallas e integración funcional

BLOQUE E3
→ arquitectura objetivo de Supabase

BLOQUE R
→ implementación y migraciones

BLOQUE QA
→ pruebas funcionales, contractuales y de seguridad
```

---

#### 20. Trazabilidad hacia matrices afectadas

La creación o descomposición posterior de permisos no reabrirá todas las matrices indiscriminadamente.

| Dominio              | Matrices que deberán revisarse principalmente                                                                                                                                                    |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| PULSO operativo      | `cajero_satelite`, `barista_satelite`, `cocinero_satelite`, `servicio_salon`, `mostrador_satelite`, `operador_integral_satelite`, `gerencia_operativa` y roles base administrativos relacionados |
| FOGO                 | `produccion_cocina`, `produccion_panaderia`, `produccion_reposteria`, `gerencia_operativa` y roles base con autoridad productiva                                                                 |
| NEXO bodega          | `bodeguero`, `gerencia_operativa` y roles base con autoridad de inventario                                                                                                                       |
| NEXO logística       | `conductor_logistica`, `bodeguero`, `gerencia_operativa` y receptores autorizados                                                                                                                |
| ORIGO recepción      | `bodeguero`, posibles roles de recepción de compras y roles base de abastecimiento                                                                                                               |
| VISO autorización    | `propietario`, `gerente_general`, `gerente`, `supervisor` y otros roles administrativos que se aprueben                                                                                          |
| Excepciones y denies | AUTH-RBAC-020 a 022 y dataset AUTH-RBAC-026                                                                                                                                                      |
| Dispositivos         | paquetes y plantillas de AUTH-RBAC-023 relacionadas con las nuevas claves                                                                                                                        |

Regla:

```text
CAMBIO DE PERMISO
→ REVISAR SOLO MATRICES, EXCEPCIONES Y DISPOSITIVOS IMPACTADOS
```

---

#### 21. Entregable obligatorio para AUTH-CAT-021

AUTH-CAT-021 deberá recibir de esta tarea:

1. todos los `gap_id` del Inventario A;
2. los 21 permisos del Inventario B;
3. las seis decisiones de propiedad del Inventario C;
4. las brechas contractuales del Inventario D;
5. la lista de asuntos excluidos del catálogo;
6. las matrices potencialmente afectadas;
7. trazabilidad a las tareas fuente.

AUTH-CAT-021 deberá asignar a cada brecha una de estas categorías, sin crear todavía claves:

```text
READY_FOR_CATALOG_DESIGN
NEEDS_FUNCTIONAL_ROADMAP
NEEDS_OWNER_DECISION
NEEDS_EXISTING_CONTRACT_REFINEMENT
STRUCTURAL_NOT_PERMISSION
IMPLEMENTATION_ONLY
DUPLICATE_OR_ABSORBED
REJECTED_AS_PERMISSION
```

La clasificación anterior se reserva expresamente para AUTH-CAT-021. AUTH-CAT-020 solo entrega el inventario consolidado.

---

#### 22. Invariantes

1. El catálogo vigente continúa con 112 permisos.
2. Ninguna brecha crea autorización.
3. Ningún nombre preliminar se convierte en clave canónica.
4. `app.access` no absorbe operaciones internas.
5. Ningún permiso de lectura absorbe mutaciones.
6. Ningún permiso de creación absorbe ejecución o cierre.
7. Ningún permiso de actualización se interpreta como edición universal.
8. Ninguna cancelación sustituye reversión.
9. Ningún override se convierte en operación ordinaria.
10. Ningún permiso técnico de pantalla, escáner o impresión reemplaza la capacidad empresarial.
11. Los 21 permisos legacy amplios permanecen bloqueados.
12. Las asignaciones legacy no se copian automáticamente.
13. Las brechas estructurales no se convierten en permisos.
14. Las decisiones de propiedad no se resuelven por conveniencia técnica.
15. PASS cliente permanece separado del RBAC laboral.
16. Los dispositivos no amplían permisos.
17. Las nuevas claves futuras quedarán denegadas por defecto.
18. Solo se revisarán matrices realmente afectadas.
19. Toda nueva versión conservará diff, trazabilidad y compatibilidad.
20. La implementación física permanece fuera de esta tarea.

---

#### 23. Riesgos controlados

##### Riesgo 1 — Crear demasiados permisos por cada pantalla

Control:

```text
CAPACIDAD EMPRESARIAL
≠
RUTA O COMPONENTE
```

##### Riesgo 2 — Consolidar acciones realmente distintas

Control:

- conservar separación por acción, recurso, estado y autoridad;
- no deduplicar únicamente por similitud de palabras.

##### Riesgo 3 — Crear permisos antes de definir el proceso

Control:

- AUTH-CAT-021 podrá diferir brechas al roadmap funcional;
- no se fuerza una clave para cerrar documentalmente una matriz.

##### Riesgo 4 — Convertir deuda estructural en permisos

Control:

- Inventario D separado;
- tablas, contexto, RLS y dispositivos se resuelven en sus bloques.

##### Riesgo 5 — Duplicar la deuda legacy y las brechas nuevas

Control:

- Inventarios A y B no se suman automáticamente;
- AUTH-CAT-022 deberá declarar relaciones de sustitución.

##### Riesgo 6 — Rehacer todas las matrices

Control:

- tabla de impacto dirigida;
- revisión únicamente por diff contractual.

##### Riesgo 7 — Autorizar silenciosamente al publicar una clave

Control:

```text
NUEVO PERMISO
→ CERO CONCESIONES IMPLÍCITAS
→ REVISIÓN EXPRESA DE MATRICES
```

---

#### 24. Impacto sobre tareas posteriores

| Tarea               | Impacto                                                                                        |
| ------------------- | ---------------------------------------------------------------------------------------------- |
| AUTH-CAT-021        | Clasificará cada brecha por madurez, propiedad y destino documental.                           |
| AUTH-CAT-022        | Diseñará únicamente las claves atómicas y descomposiciones declaradas maduras.                 |
| AUTH-CAT-023        | Aplicará el diff contractual solo a matrices, excepciones y paquetes de dispositivo afectados. |
| AUTH-CAT-024        | Publicará y congelará la nueva versión del catálogo que alimentará datasets.                   |
| AUTH-RBAC-024 a 026 | Consumirán exclusivamente la versión congelada por AUTH-CAT-024.                               |
| AUTH-RBAC-027 y 028 | Validarán alcance operativo y separación de administración.                                    |
| BLOQUE E            | Implementará contexto y decisión unificados.                                                   |
| BLOQUE E2           | Definirá procesos todavía inmaduros y propiedad funcional.                                     |
| BLOQUE E3           | Diseñará estructuras físicas, integridad y transición de Supabase.                             |
| BLOQUE R            | Implementará migraciones, backfills, aliases, retiro legacy y rollback en `vento-shell`.       |
| BLOQUE QA           | Probará contratos, matrices, dispositivos, excepciones, denegaciones y compatibilidad.         |

---

#### 25. Criterios de aprobación

AUTH-CAT-020 podrá aprobarse cuando se acepte expresamente que:

- el inventario consolidado incluye capacidades faltantes, deuda legacy, propiedad, estructura y contratos;
- las capacidades repetidas entre roles se deduplican por resultado empresarial;
- PULSO, FOGO, NEXO, ORIGO y VISO concentran las brechas funcionales identificadas;
- los 21 permisos `DECOMPOSE_REQUIRED` continúan bloqueados;
- los problemas de estructura, contexto, dispositivo o implementación no se convierten en permisos;
- no se crean claves canónicas durante esta tarea;
- el catálogo permanece en 112 permisos;
- toda brecha conserva trazabilidad a matrices y capas fuente;
- AUTH-CAT-021 decidirá madurez y destino;
- solo las brechas maduras pasarán a diseño atómico en AUTH-CAT-022;
- ninguna matriz se modifica todavía;
- no se realizan cambios físicos.

---

#### 26. Estado final de la propuesta

| Tarea         | Estado      |
| ------------- | ----------- |
| AUTH-RBAC-023 | APROBADA    |
| AUTH-CAT-020  | APROBADA    |
| AUTH-CAT-021  | NO INICIADA |

No se avanza a AUTH-CAT-021 hasta recibir aprobación explícita.


### ✅ AUTH-CAT-021 — Clasificar brechas listas para catálogo y brechas diferidas a roadmaps funcionales

**Estado:** APROBADA  
**Bloque:** BLOQUE D — Revisión contractual previa a datasets  
**Naturaleza:** Clasificación contractual de madurez y destino documental  
**Implementación física:** No incluida  
**Catálogo vigente de referencia:** 112 permisos canónicos  
**Versión del catálogo:** Sin modificación durante esta tarea  
**Tarea anterior vigente:** AUTH-CAT-020 — APROBADA  
**Tarea posterior reservada:** AUTH-CAT-022 — Descomponer permisos legacy maduros y definir nuevas claves atómicas

Esta tarea clasifica las brechas consolidadas en AUTH-CAT-020. No crea claves canónicas, no modifica permisos existentes, no actualiza matrices, no publica una nueva versión del catálogo y no altera Supabase, RLS, RPC, aplicaciones, dispositivos, datasets ni migraciones.

---

#### 1. Objetivo

Determinar cuáles brechas contractuales poseen suficiente madurez para pasar a diseño atómico en AUTH-CAT-022 y cuáles deben permanecer diferidas hasta que el roadmap funcional correspondiente defina con precisión:

- proceso empresarial;
- aplicación propietaria;
- actor ejecutor y autoridad aprobadora;
- recurso protegido;
- acción y transición de estado;
- alcance territorial y contextual;
- efectos laterales;
- evidencia y auditoría;
- integración con otros dominios.

La clasificación evita dos errores opuestos:

```text
CREAR UN PERMISO ANTES DE DEFINIR EL PROCESO
→ contrato prematuro y difícil de corregir
```

```text
CONSERVAR UN PERMISO AMPLIO AUNQUE LA ACCIÓN YA ESTÉ CLARA
→ autorización excesiva y matrices ambiguas
```

---

#### 2. Decisión principal

Una brecha podrá pasar a AUTH-CAT-022 únicamente cuando cumpla todos los criterios mínimos de madurez aplicables.

```text
BRECHA CONSOLIDADA
        ↓
EVALUACIÓN DE MADUREZ
        ↓
┌──────────────────────────────┬──────────────────────────────┐
│ CONTRATO SUFICIENTE          │ CONTRATO INSUFICIENTE        │
│ READY_FOR_CATALOG_DESIGN     │ ROADMAP / OWNER / CONTRACT   │
└──────────────────────────────┴──────────────────────────────┘
```

La clasificación `READY_FOR_CATALOG_DESIGN` significa exclusivamente:

- la capacidad puede diseñarse contractualmente en AUTH-CAT-022;
- todavía no existe una `PermissionKey` aprobada;
- todavía no existe una concesión para ningún rol;
- la brecha continúa denegada por defecto;
- la matriz solo podrá cambiar en AUTH-CAT-023;
- el catálogo solo podrá versionarse en AUTH-CAT-024.

---

#### 3. Categorías canónicas de clasificación

| Categoría                            | Significado                                                                                                 | Destino                                                      |
| ------------------------------------ | ----------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| `READY_FOR_CATALOG_DESIGN`           | La capacidad tiene propietario, acción, recurso y frontera de autoridad suficientemente claros.             | AUTH-CAT-022                                                 |
| `NEEDS_FUNCTIONAL_ROADMAP`           | El permiso dependería de un proceso, estados, campos, excepciones o UX todavía no definidos.                | Roadmap funcional y de autorización de la aplicación         |
| `NEEDS_OWNER_DECISION`               | La capacidad cruza dominios o no tiene un propietario funcional único aprobado.                             | Roadmap e integración transversal correspondiente            |
| `NEEDS_EXISTING_CONTRACT_REFINEMENT` | Puede bastar con precisar el recurso o límites de un permiso vigente; aún no se justifica crear otra clave. | Revisión contractual previa o durante el roadmap propietario |
| `STRUCTURAL_NOT_PERMISSION`          | La brecha pertenece al modelo de datos, contexto, identidad, persistencia o dispositivo.                    | BLOQUES E, E3 y R                                            |
| `IMPLEMENTATION_ONLY`                | El problema es técnico y no representa una capacidad empresarial.                                           | Repositorio propietario, BLOQUE R o QA                       |
| `DUPLICATE_OR_ABSORBED`              | El registro es una agrupación documental o ya está representado por otras brechas más precisas.             | No genera permiso propio                                     |
| `REJECTED_AS_PERMISSION`             | El hallazgo no debe convertirse en permiso bajo ninguna convención canónica.                                | Se conserva como regla negativa                              |

No se introduce una categoría de “parcialmente listo”. Cuando una familia contiene acciones maduras e inmaduras:

- las acciones maduras se trazan mediante brechas específicas `READY_FOR_CATALOG_DESIGN`;
- las acciones restantes continúan diferidas;
- el permiso legacy amplio no se retira hasta que exista cobertura contractual suficiente;
- no se autoriza mediante aliases uno-a-muchos.

---

#### 4. Puertas mínimas de madurez

Una brecha será `READY_FOR_CATALOG_DESIGN` cuando se pueda responder afirmativamente:

| Puerta                         | Pregunta obligatoria                                                                                  |
| ------------------------------ | ----------------------------------------------------------------------------------------------------- |
| `M1_OWNER`                     | ¿Existe una aplicación propietaria confirmada?                                                        |
| `M2_ACTION`                    | ¿La acción empresarial es inequívoca y distinta de consultar, actualizar o administrar genéricamente? |
| `M3_RESOURCE`                  | ¿Existe un recurso o agregado empresarial identificable?                                              |
| `M4_ACTOR`                     | ¿Se conocen los actores ordinarios y las autoridades excepcionales?                                   |
| `M5_BOUNDARY`                  | ¿Se sabe qué no concede la capacidad?                                                                 |
| `M6_LIFECYCLE`                 | ¿La acción puede ubicarse en un estado o transición reconocible?                                      |
| `M7_EFFECTS`                   | ¿Sus efectos laterales pueden declararse sin inventar el proceso?                                     |
| `M8_SECURITY`                  | ¿Puede distinguirse operación ordinaria, sensible, base u operativa?                                  |
| `M9_NO_OWNER_CONFLICT`         | ¿No existe una decisión pendiente de propiedad funcional?                                             |
| `M10_NO_STRUCTURAL_SUBSTITUTE` | ¿La necesidad no intenta compensar un problema de tablas, RLS, RPC, dispositivo o UI?                 |

La ausencia de cualquiera de `M1`, `M2`, `M3`, `M4` o `M9` impide pasar a AUTH-CAT-022.

---

#### 5. Resultado ejecutivo

##### Inventario A — 50 brechas funcionales

| Clasificación                        | Cantidad |
| ------------------------------------ | -------: |
| `READY_FOR_CATALOG_DESIGN`           |       11 |
| `NEEDS_FUNCTIONAL_ROADMAP`           |       30 |
| `NEEDS_OWNER_DECISION`               |        4 |
| `NEEDS_EXISTING_CONTRACT_REFINEMENT` |        3 |
| `DUPLICATE_OR_ABSORBED`              |        1 |
| `REJECTED_AS_PERMISSION`             |        1 |
| **Total**                            |   **50** |

##### Inventario B — 21 permisos legacy `DECOMPOSE_REQUIRED`

| Clasificación              | Cantidad |
| -------------------------- | -------: |
| `READY_FOR_CATALOG_DESIGN` |        2 |
| `NEEDS_FUNCTIONAL_ROADMAP` |       19 |
| **Total**                  |   **21** |

##### Inventarios complementarios

| Inventario                                             | Clasificación                        | Cantidad |
| ------------------------------------------------------ | ------------------------------------ | -------: |
| Propiedad funcional                                    | `NEEDS_OWNER_DECISION`               |        6 |
| Contratos vigentes insuficientes                       | `NEEDS_EXISTING_CONTRACT_REFINEMENT` |        6 |
| Estructura y dispositivos                              | `STRUCTURAL_NOT_PERMISSION`          |       14 |
| Asuntos técnicos excluidos                             | `IMPLEMENTATION_ONLY`                |       14 |
| Rutas, pantallas o componentes como supuestos permisos | `REJECTED_AS_PERMISSION`             |        2 |

El catálogo continúa con **112 permisos canónicos**.

---

#### CLASIFICACIÓN DEL INVENTARIO A

##### 6. PULSO — 16 brechas

| Gap ID          | Clasificación              | Justificación                                                                                                                            | Destino                                         |
| --------------- | -------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------- |
| `GAP-PULSO-001` | `NEEDS_FUNCTIONAL_ROADMAP` | La cola, detalle, asignación, prioridad, alergias y modificadores mezclan proyecciones y recursos aún no inventariados.                  | PULSO-AUTH-001 a 005; PULSO-UX-001 a 006        |
| `GAP-PULSO-002` | `NEEDS_FUNCTIONAL_ROADMAP` | Reclamar, aceptar e iniciar preparación requieren definir propiedad de la comanda, concurrencia y reasignación.                          | PULSO-AUTH y PULSO-UX operativos                |
| `GAP-PULSO-003` | `NEEDS_FUNCTIONAL_ROADMAP` | Los estados de preparación y sus transiciones todavía no poseen una máquina de estados canónica aprobada.                                | PULSO-UX y contrato de órdenes                  |
| `GAP-PULSO-004` | `NEEDS_FUNCTIONAL_ROADMAP` | Agotado, sustitución y aclaración pueden pertenecer a recursos y actores distintos.                                                      | PULSO-UX; integración con catálogo e inventario |
| `GAP-PULSO-005` | `NEEDS_FUNCTIONAL_ROADMAP` | Rehacer, error, devolución a preparación, merma y desperdicio tienen efectos comerciales, productivos e inventariables aún no definidos. | PULSO-UX; integración PULSO–NEXO                |
| `GAP-PULSO-006` | `NEEDS_FUNCTIONAL_ROADMAP` | La administración de mesas y servicio requiere definir agregados, estados y fronteras entre salón, caja y pedido.                        | PULSO-AUTH-003; PULSO-UX-001 a 006              |
| `GAP-PULSO-007` | `NEEDS_FUNCTIONAL_ROADMAP` | “Crear y actualizar pedidos” no identifica todavía campos mutables, estados ni diferencia entre pedido, venta y comanda.                 | PULSO-UX-007; contrato canónico de ventas       |
| `GAP-PULSO-008` | `NEEDS_FUNCTIONAL_ROADMAP` | Alistamiento, empaque y validación por canal dependen del flujo de mostrador y entrega aún no diseñado.                                  | PULSO-UX-004, 005 y procesos de entrega         |
| `GAP-PULSO-009` | `NEEDS_FUNCTIONAL_ROADMAP` | La entrega ordinaria requiere definir receptor, evidencia, canal y relación con NEXO.                                                    | PULSO-UX; `GAP-OWN-005`                         |
| `GAP-PULSO-010` | `READY_FOR_CATALOG_DESIGN` | Crear una venta es una capacidad empresarial inequívoca, propiedad de PULSO, separada de cobrar, anular y cerrar caja.                   | AUTH-CAT-022                                    |
| `GAP-PULSO-011` | `READY_FOR_CATALOG_DESIGN` | Cobrar y revertir un pago son acciones diferenciables sobre pagos; CAT-022 deberá separarlas y no crear un permiso compuesto.            | AUTH-CAT-022                                    |
| `GAP-PULSO-012` | `READY_FOR_CATALOG_DESIGN` | Abrir y cerrar una sesión de caja son transiciones claras y distintas; operar caja no podrá convertirse en un wildcard.                  | AUTH-CAT-022                                    |
| `GAP-PULSO-013` | `READY_FOR_CATALOG_DESIGN` | Anular, devolver, reembolsar y aplicar descuentos son acciones sensibles reconocidas y deberán diseñarse como claves independientes.     | AUTH-CAT-022                                    |
| `GAP-PULSO-014` | `NEEDS_OWNER_DECISION`     | La operación laboral está clara, pero la propiedad entre PULSO, PASS y adaptadores aún no está aprobada.                                 | `GAP-OWN-006`; PASS-INT-001 y 002               |
| `GAP-PULSO-015` | `NEEDS_FUNCTIONAL_ROADMAP` | Tiempos, alertas, historial y supervisión agrupan proyecciones distintas y alcances aún no definidos.                                    | PULSO-AUTH-007; PULSO-UX-006                    |
| `GAP-PULSO-016` | `NEEDS_FUNCTIONAL_ROADMAP` | Pedidos no reclamados, parciales, incidencias y canales fallidos requieren estados y responsables específicos.                           | PULSO-UX-009 y 013; flujo de entrega            |

Resultado PULSO:

```text
4 familias maduras para diseño contractual
11 familias diferidas al roadmap funcional
1 decisión de propiedad pendiente
```

La madurez de `GAP-PULSO-010` a `013` no significa que PULSO esté implementado ni que sea actualmente la fuente fiscal definitiva. Las claves podrán existir como contrato futuro y permanecer sin concesiones físicas hasta la fase correspondiente.

---

##### 7. FOGO — 14 brechas

| Gap ID         | Clasificación                        | Justificación                                                                                                             | Destino                                |
| -------------- | ------------------------------------ | ------------------------------------------------------------------------------------------------------------------------- | -------------------------------------- |
| `GAP-FOGO-001` | `NEEDS_FUNCTIONAL_ROADMAP`           | Aceptar una orden e iniciar producción pueden ser acciones distintas y requieren definir asignación, cola y concurrencia. | FOGO-AUTH-001 a 009; FOGO-UX-001 a 005 |
| `GAP-FOGO-002` | `NEEDS_FUNCTIONAL_ROADMAP`           | Pausar, reanudar, terminar, cancelar y reabrir dependen de una máquina de estados todavía no aprobada.                    | FOGO-AUTH-009 a 012; FOGO-UX-005 a 011 |
| `GAP-FOGO-003` | `NEEDS_FUNCTIONAL_ROADMAP`           | Las cantidades y rendimientos requieren unidad, tolerancia, lote y autoridad de corrección.                               | FOGO-UX-006, 007 y 010                 |
| `GAP-FOGO-004` | `NEEDS_FUNCTIONAL_ROADMAP`           | El consumo teórico y real depende del contrato FOGO–NEXO y de reservas, sustituciones y cierres.                          | FOGO-UX-012; INT-PROD-001 a 004        |
| `GAP-FOGO-005` | `NEEDS_FUNCTIONAL_ROADMAP`           | La sustitución de insumos exige reglas de receta, equivalencia y aprobación todavía no definidas.                         | FOGO-UX-008 a 011                      |
| `GAP-FOGO-006` | `NEEDS_FUNCTIONAL_ROADMAP`           | Merma, desperdicio y reproceso deben coordinar producción e inventario sin duplicar ajustes.                              | FOGO-UX-010 a 013                      |
| `GAP-FOGO-007` | `NEEDS_FUNCTIONAL_ROADMAP`           | Los controles de proceso varían por área, receta, etapa y equipo.                                                         | FOGO-UX-002, 008 y 010                 |
| `GAP-FOGO-008` | `NEEDS_FUNCTIONAL_ROADMAP`           | Calidad, liberación y rechazo requieren confirmar si existe un actor o dominio de calidad separado.                       | FOGO-AUTH-008; FOGO-UX-014             |
| `GAP-FOGO-009` | `NEEDS_FUNCTIONAL_ROADMAP`           | Confirmar producto terminado depende de presentación, lote, vencimiento, ubicación y handoff con NEXO.                    | FOGO-UX-007 y 013; INT-PROD            |
| `GAP-FOGO-010` | `REJECTED_AS_PERMISSION`             | Emitir efectos idempotentes entre FOGO y NEXO es una responsabilidad de servicio e integración, no una capacidad humana.  | INT-PROD; BLOQUES E3 y R               |
| `GAP-FOGO-011` | `NEEDS_FUNCTIONAL_ROADMAP`           | Corregir o revertir producción exige definir compensaciones, estados irreversibles y autoridad.                           | FOGO-AUTH-012; FOGO-UX-011             |
| `GAP-FOGO-012` | `NEEDS_EXISTING_CONTRACT_REFINEMENT` | Puede resolverse mediante proyecciones y alcance del permiso vigente `batches.view`; no se justifica aún otra clave.      | Refinar contrato durante FOGO-AUTH-013 |
| `GAP-FOGO-013` | `NEEDS_FUNCTIONAL_ROADMAP`           | Reprogramar, escalar y coordinar incidencias agrupan acciones diferentes y actores no cerrados.                           | FOGO-AUTH-008; FOGO-UX-014             |
| `GAP-FOGO-014` | `NEEDS_FUNCTIONAL_ROADMAP`           | La descomposición de recetas depende de separar recetario operativo, autoría, aprobación y publicación.                   | FOGO-UX-009; FOGO-AUTH-013             |

Resultado FOGO:

```text
0 brechas funcionales nuevas pasan ahora a AUTH-CAT-022
12 se difieren al roadmap funcional
1 requiere refinamiento de contrato existente
1 se rechaza como permiso humano
```

Los permisos FOGO ya concedidos por las matrices aprobadas permanecen vigentes contractualmente. Esta clasificación evita inventar ahora una máquina de estados productiva que el roadmap todavía debe aprobar.

---

##### 8. NEXO — 14 brechas

| Gap ID         | Clasificación                        | Justificación                                                                                                                 | Destino                               |
| -------------- | ------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------- | ------------------------------------- |
| `GAP-NEXO-001` | `NEEDS_FUNCTIONAL_ROADMAP`           | Cuarentena, rechazo, daño, vencimiento y merma requieren estados, ubicaciones y efectos diferentes.                           | NEXO-AUTH-011; NEXO-UX-014, 019 y 022 |
| `GAP-NEXO-002` | `READY_FOR_CATALOG_DESIGN`           | Capturar un conteo y aprobar o resolver su diferencia son autoridades inequívocamente separadas.                              | AUTH-CAT-022                          |
| `GAP-NEXO-003` | `NEEDS_EXISTING_CONTRACT_REFINEMENT` | Antes de crear permisos nuevos debe definirse si `remissions.update` puede restringirse por campos, actor y estado.           | NEXO-AUTH-005; NEXO-UX-009 a 013      |
| `GAP-NEXO-004` | `NEEDS_EXISTING_CONTRACT_REFINEMENT` | Debe determinarse qué cubre cancelación y cuándo se requiere una reversión separada.                                          | NEXO-AUTH-005; NEXO-UX-022            |
| `GAP-NEXO-005` | `READY_FOR_CATALOG_DESIGN`           | Aceptar custodia y comenzar tránsito son acciones distinguibles sobre una remisión preparada.                                 | AUTH-CAT-022                          |
| `GAP-NEXO-006` | `READY_FOR_CATALOG_DESIGN`           | Entregar físicamente y transferir custodia al receptor es una acción clara y no puede inferirse desde `dispatch` o `receive`. | AUTH-CAT-022                          |
| `GAP-NEXO-007` | `NEEDS_FUNCTIONAL_ROADMAP`           | La prueba de entrega requiere definir evidencia, almacenamiento, obligatoriedad y actores.                                    | NEXO-UX-012, 013 y 022                |
| `GAP-NEXO-008` | `NEEDS_FUNCTIONAL_ROADMAP`           | Los incidentes de transporte requieren taxonomía, severidad, efectos y resolución.                                            | NEXO-UX-012 y 022                     |
| `GAP-NEXO-009` | `NEEDS_FUNCTIONAL_ROADMAP`           | El progreso de parada depende del modelo de ruta y su máquina de estados.                                                     | NEXO-UX-012; logística y rutas        |
| `GAP-NEXO-010` | `NEEDS_FUNCTIONAL_ROADMAP`           | Entrega fallida, devolución y retorno de custodia requieren un flujo compensatorio completo.                                  | NEXO-UX-012, 013 y 022                |
| `GAP-NEXO-011` | `NEEDS_OWNER_DECISION`               | Vehículos, checklist y combustible pueden pertenecer a activos, logística o un dominio futuro de flota.                       | `GAP-OWN` derivada; NEXO-UX-005       |
| `GAP-NEXO-012` | `NEEDS_FUNCTIONAL_ROADMAP`           | Reasignar actor, vehículo o ruta exige definir emergencia, vigencia y restricciones de cada recurso.                          | NEXO-UX-012 y 022                     |
| `GAP-NEXO-013` | `NEEDS_OWNER_DECISION`               | El incidente transversal no debe adjudicarse automáticamente a NEXO.                                                          | `GAP-OWN-003`                         |
| `GAP-NEXO-014` | `NEEDS_OWNER_DECISION`               | La acción empresarial de imprimir está clara, pero el propietario debe ser el proceso y no el servicio técnico genérico.      | `GAP-OWN-002`                         |

Resultado NEXO:

```text
3 brechas maduras para diseño contractual
6 diferidas al roadmap funcional
2 requieren refinamiento de contratos existentes
3 requieren decisión de propiedad
```

---

##### 9. ORIGO — 2 brechas

| Gap ID          | Clasificación              | Justificación                                                                                                                                     | Destino                                       |
| --------------- | -------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------- |
| `GAP-ORIGO-001` | `READY_FOR_CATALOG_DESIGN` | Registrar una recepción comercial es una mutación inequívoca, propiedad de ORIGO y distinta de consultar la recepción o crear la entrada en NEXO. | AUTH-CAT-022                                  |
| `GAP-ORIGO-002` | `NEEDS_FUNCTIONAL_ROADMAP` | La administración de proveedores requiere definir creación, edición, activación, bloqueo, datos sensibles y deduplicación.                        | ORIGO-AUTH-002, 004 a 010; ORIGO-UX-001 y 002 |

CAT-022 podrá diseñar una capacidad de registro de recepción, pero no decidirá todavía si total, parcial y corrección requieren claves adicionales. Esas diferencias permanecen bajo ORIGO-AUTH-007 y 008.

---

##### 10. VISO — 4 brechas

| Gap ID         | Clasificación              | Justificación                                                                                                                | Destino      |
| -------------- | -------------------------- | ---------------------------------------------------------------------------------------------------------------------------- | ------------ |
| `GAP-VISO-001` | `READY_FOR_CATALOG_DESIGN` | AUTH-RBAC-020 ya definió sujeto, carril, alcance, vigencia, justificación, aprobación y auditoría de concesiones base.       | AUTH-CAT-022 |
| `GAP-VISO-002` | `READY_FOR_CATALOG_DESIGN` | AUTH-RBAC-021 ya definió el contrato de concesiones operativas y sus requisitos de turno, área y rol compatible.             | AUTH-CAT-022 |
| `GAP-VISO-003` | `READY_FOR_CATALOG_DESIGN` | AUTH-RBAC-022 ya definió denegaciones por carril, bloqueos transversales, precedencia y recuperación.                        | AUTH-CAT-022 |
| `GAP-VISO-004` | `DUPLICATE_OR_ABSORBED`    | Es una agrupación de nueve permisos legacy que se clasifican individualmente en el Inventario B. No genera una clave propia. | Inventario B |

Resultado VISO:

```text
3 familias maduras para diseño contractual
1 registro agrupador absorbido por la clasificación individual legacy
```

---

#### CLASIFICACIÓN DEL INVENTARIO B

##### 11. Permisos legacy `DECOMPOSE_REQUIRED`

| Permiso legacy                              | Clasificación              | Motivo y destino                                                                                                                           |
| ------------------------------------------- | -------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| `fogo.production.recipes.manage`            | `NEEDS_FUNCTIONAL_ROADMAP` | Requiere separar recetario operativo, creación, edición, aprobación y publicación en FOGO.                                                 |
| `nexo.settings.categories.manage`           | `NEEDS_FUNCTIONAL_ROADMAP` | No están definidas las acciones, ciclo de vida ni impacto sobre productos.                                                                 |
| `nexo.settings.units.manage`                | `NEEDS_FUNCTIONAL_ROADMAP` | Cambiar unidades puede afectar conversiones y datos históricos; requiere proceso y reglas.                                                 |
| `nexo.settings.supply_routes.manage`        | `NEEDS_FUNCTIONAL_ROADMAP` | El modelo de rutas y su administración todavía debe diseñarse.                                                                             |
| `nexo.internal_prices.manage`               | `NEEDS_FUNCTIONAL_ROADMAP` | Requiere definir vigencia, aprobación, alcance y relación financiera.                                                                      |
| `nexo.cost_centers.manage`                  | `NEEDS_FUNCTIONAL_ROADMAP` | Debe resolverse la propiedad compartida con NUMERA y el ciclo de vida.                                                                     |
| `nexo.settings.sites.manage`                | `NEEDS_FUNCTIONAL_ROADMAP` | La sede es una entidad transversal; no debe descomponerse desde NEXO sin decisión organizacional.                                          |
| `nexo.settings.remissions.manage`           | `NEEDS_FUNCTIONAL_ROADMAP` | Agrupa políticas, estados y configuración de remisiones aún no inventariados.                                                              |
| `numera.cost_centers.manage`                | `NEEDS_FUNCTIONAL_ROADMAP` | Debe coordinarse con la fuente canónica de centros de costo.                                                                               |
| `numera.expenses.manage`                    | `NEEDS_FUNCTIONAL_ROADMAP` | Crear, aprobar, contabilizar, corregir y anular gastos no están separados.                                                                 |
| `origo.suppliers.manage`                    | `NEEDS_FUNCTIONAL_ROADMAP` | Depende de ORIGO-AUTH y del proceso completo de proveedores.                                                                               |
| `pulso.pos.main`                            | `READY_FOR_CATALOG_DESIGN` | Puede iniciar una descomposición dirigida mediante `GAP-PULSO-010` a `013`; seguirá bloqueado hasta cubrir y migrar todas sus operaciones. |
| `viso.app_navigation.manage`                | `NEEDS_FUNCTIONAL_ROADMAP` | Requiere definir configuración, publicación y alcance de navegación.                                                                       |
| `viso.employee_operational_profiles.manage` | `NEEDS_FUNCTIONAL_ROADMAP` | Crear, actualizar, activar y desactivar perfiles debe alinearse con VISO-AUTH-007 y el modelo físico.                                      |
| `viso.menu.images.manage`                   | `NEEDS_FUNCTIONAL_ROADMAP` | La propiedad funcional y el ciclo editorial no están definidos en autorización.                                                            |
| `viso.operational_points.manage`            | `NEEDS_FUNCTIONAL_ROADMAP` | Los puntos operativos requieren definir tipo, sede, geocerca y administración.                                                             |
| `viso.site_operational_roles.manage`        | `NEEDS_FUNCTIONAL_ROADMAP` | Debe separarse habilitación por sede, por área y vigencia según VISO-AUTH-005 y 006.                                                       |
| `viso.staff.documents.manage`               | `NEEDS_FUNCTIONAL_ROADMAP` | Los tipos documentales, visibilidad, carga, sustitución y eliminación requieren contrato.                                                  |
| `viso.staff.employee_photos.manage`         | `NEEDS_FUNCTIONAL_ROADMAP` | Cargar, reemplazar, aprobar y retirar fotografías no están separados.                                                                      |
| `viso.staff.manage`                         | `NEEDS_FUNCTIONAL_ROADMAP` | Trabajadores, invitaciones, activación, edición y terminación laboral no pueden quedar bajo una sola clave.                                |
| `viso.staff.permissions.manage`             | `READY_FOR_CATALOG_DESIGN` | AUTH-RBAC-020 a 022 ya definieron concesiones base, operativas y denegaciones con ciclo de vida suficiente.                                |

Reglas para los dos permisos legacy maduros:

```text
pulso.pos.main
→ descomposición inicial limitada a familias maduras
→ sin alias uno-a-muchos
→ sin retiro hasta cubrir consumidores y operaciones restantes
```

```text
viso.staff.permissions.manage
→ sustituir mediante acciones atómicas sobre concesiones y denegaciones
→ conservar separación solicitante / aprobador / actor afectado
→ retirar solo después de migración y pruebas
```

---

#### CLASIFICACIÓN DE PROPIEDAD Y CONTRATOS

##### 12. Decisiones pendientes de propiedad funcional

Las seis decisiones del Inventario C se clasifican como `NEEDS_OWNER_DECISION`.

| Gap ID        | Decisión que debe resolverse                             | Destino mínimo                                                |
| ------------- | -------------------------------------------------------- | ------------------------------------------------------------- |
| `GAP-OWN-001` | Recetario operativo para barra y cocina satélite         | FOGO-UX-009, PULSO-UX y contrato compartido si aplica         |
| `GAP-OWN-002` | Impresión y reimpresión empresarial                      | Roadmap del proceso propietario + servicio técnico compartido |
| `GAP-OWN-003` | Incidente operativo transversal                          | BLOQUE E2 e integración entre dominios                        |
| `GAP-OWN-004` | Recepción comercial ORIGO frente a entrada física NEXO   | ORIGO-UX-013 y 014; INT-PROC                                  |
| `GAP-OWN-005` | Entrega comercial PULSO frente a custodia logística NEXO | PULSO-UX, NEXO-UX e integración de ventas/logística           |
| `GAP-OWN-006` | Acumulación y redención laboral de fidelización          | PULSO-AUTH-009 y 010; PASS-INT-001 y 002                      |

Mientras no exista decisión:

- no se crea una clave transversal provisional;
- no se duplica la misma mutación en dos aplicaciones;
- no se concede acceso por usar ambas aplicaciones;
- continúa la denegación por defecto.

---

##### 13. Contratos vigentes insuficientes

Las seis brechas contractuales del Inventario D se clasifican como `NEEDS_EXISTING_CONTRACT_REFINEMENT`.

| Gap ID             | Permiso vigente                      | Pregunta contractual previa                                                     |
| ------------------ | ------------------------------------ | ------------------------------------------------------------------------------- |
| `GAP-CONTRACT-001` | `nexo.inventory.remissions.update`   | ¿Puede limitarse por campos, estados y actor sin crear claves adicionales?      |
| `GAP-CONTRACT-002` | `nexo.inventory.remissions.cancel`   | ¿Qué etapas cubre y cuándo debe existir una reversión separada?                 |
| `GAP-CONTRACT-003` | `nexo.inventory.remissions.dispatch` | ¿Debe conservar despacho o dividir aceptación de custodia e inicio de tránsito? |
| `GAP-CONTRACT-004` | `fogo.production.batches.view`       | ¿La proyección por actor resuelve el acceso sin otro permiso de historial?      |
| `GAP-CONTRACT-005` | `fogo.production.batches.create`     | ¿Su contrato puede limitarse a crear sin ejecutar, cerrar o afectar inventario? |
| `GAP-CONTRACT-006` | `pulso.delivery.deliveries.override` | ¿Qué caso excepcional cubre, qué evidencia exige y qué autoridad base requiere? |

AUTH-CAT-022 no creará automáticamente permisos nuevos para estas seis filas. Solo podrá hacerlo si el análisis de una brecha madura demuestra que el contrato vigente no puede representar la separación necesaria.

---

#### CLASIFICACIÓN DE BRECHAS NO CONTRACTUALES

##### 14. Estructura de asignaciones y autorización

Los siguientes registros son `STRUCTURAL_NOT_PERMISSION`:

```text
GAP-STRUCT-001
GAP-STRUCT-002
GAP-STRUCT-003
GAP-STRUCT-004
GAP-STRUCT-005
GAP-STRUCT-006
GAP-STRUCT-007
GAP-STRUCT-008
```

Destino:

- BLOQUE E — contexto y decisión unificados;
- AUTH-RBAC-024 a 026 — datasets;
- BLOQUE E3 — arquitectura física;
- BLOQUE R — transición y migraciones.

No podrán originar claves como:

```text
permissions.use_new_table
permissions.use_lane
permissions.use_foreign_key
permissions.use_unified_decision
```

---

##### 15. Dispositivos y actor efectivo

Los siguientes registros son `STRUCTURAL_NOT_PERMISSION`:

```text
GAP-DEVICE-001
GAP-DEVICE-002
GAP-DEVICE-003
GAP-DEVICE-004
GAP-DEVICE-005
GAP-DEVICE-006
```

El dispositivo continuará operando como filtro restrictivo. La ausencia de sesión de actor, la mezcla de roles o una plantilla insuficiente se corrige en el contrato del dispositivo y la implementación, no mediante permisos compensatorios.

---

##### 16. Asuntos técnicos excluidos

Se clasifican como `IMPLEMENTATION_ONLY`:

1. tablas sin columnas suficientes;
2. llaves foráneas ausentes;
3. índices únicos defectuosos;
4. RLS incompletas;
5. funciones `SECURITY DEFINER`;
6. exposición RPC;
7. idempotencia, concurrencia y versionado técnico;
8. eventos fuera de orden;
9. conectividad y operación offline;
10. ausencia física de sesiones de actor;
11. inconsistencia técnica de `navigation_role`;
12. ausencia de plantillas o instancias de dispositivo;
13. migración o limpieza de datos legacy;
14. retención técnica, almacenamiento y recuperación de evidencia.

Se clasifican como `REJECTED_AS_PERMISSION`:

1. ausencia de una pantalla;
2. nombres de rutas, carpetas, componentes o archivos.

Regla:

```text
EXISTE BOTÓN O PANTALLA
≠
EXISTE CAPACIDAD AUTORIZABLE
```

---

#### ALCANCE AUTORIZADO PARA AUTH-CAT-022

##### 17. Brechas maduras que podrán diseñarse

AUTH-CAT-022 podrá trabajar exclusivamente sobre estas 11 brechas:

###### PULSO

```text
GAP-PULSO-010 — crear venta
GAP-PULSO-011 — cobrar y revertir pago como acciones separadas
GAP-PULSO-012 — abrir y cerrar sesión de caja como acciones separadas
GAP-PULSO-013 — anular, devolver, reembolsar y descontar como acciones separadas
```

###### NEXO

```text
GAP-NEXO-002 — aprobar y resolver diferencias de conteo
GAP-NEXO-005 — aceptar custodia e iniciar tránsito como acciones separadas
GAP-NEXO-006 — entregar y transferir custodia
```

###### ORIGO

```text
GAP-ORIGO-001 — registrar recepción comercial
```

###### VISO

```text
GAP-VISO-001 — gobierno de concesiones individuales base
GAP-VISO-002 — gobierno de concesiones individuales operativas
GAP-VISO-003 — gobierno de denegaciones y bloqueos transversales
```

Y podrá iniciar la descomposición controlada de:

```text
pulso.pos.main
viso.staff.permissions.manage
```

---

##### 18. Restricciones de AUTH-CAT-022

AUTH-CAT-022 no podrá:

- convertir automáticamente cada familia madura en una sola clave amplia;
- crear un permiso `manage`, `main`, `override` o `execute_all` para cerrar varias acciones;
- diseñar claves para las 30 brechas diferidas;
- adjudicar las seis decisiones de propiedad;
- resolver brechas estructurales mediante permisos;
- retirar permisos legacy sin inventario de consumidores y compatibilidad;
- copiar concesiones legacy a las claves nuevas;
- actualizar matrices dentro de la misma tarea;
- publicar una versión del catálogo;
- implementar tablas, RLS, RPC o migraciones.

Cada clave candidata deberá superar nuevamente:

- convención canónica;
- descripción humana;
- modalidad;
- alcance;
- turno y check-in;
- área activa;
- dispositivo compartido;
- sensibilidad;
- simulación;
- contrato de recurso;
- compatibilidad y deprecación.

---

#### REGISTRO DE DIFERIDOS

##### 19. Destino obligatorio por aplicación

| Aplicación o dominio  | Brechas diferidas                   | Roadmap obligatorio antes de reconsiderarlas                                      |
| --------------------- | ----------------------------------- | --------------------------------------------------------------------------------- |
| PULSO                 | `001` a `009`, `014` a `016`        | PULSO-AUTH-001 a 016; PULSO-UX-001 a 019; INT-SALES y PASS-INT cuando corresponda |
| FOGO                  | `001` a `009`, `011`, `013`, `014`  | FOGO-AUTH-001 a 016; FOGO-UX-001 a 015; INT-PROD                                  |
| NEXO                  | `001`, `007` a `010`, `012`         | NEXO-AUTH-001 a 020; NEXO-UX-001 a 025                                            |
| ORIGO                 | `002`                               | ORIGO-AUTH-001 a 015; ORIGO-UX-001 a 016                                          |
| VISO legacy           | permisos administrativos no maduros | VISO-AUTH-001 a 020; VISO-UX-001 a 020                                            |
| NUMERA legacy         | centros de costo y gastos           | Roadmap funcional y de autorización de NUMERA                                     |
| Propiedad transversal | `GAP-OWN-001` a `006`               | BLOQUE E2 e integraciones correspondientes                                        |

Una tarea del roadmap funcional deberá devolver la brecha a revisión contractual cuando defina:

```text
owner
resource
operation
state transition
actor
scope
sensitivity
evidence
side effects
```

No será necesario reabrir AUTH-CAT-021 completa. La nueva versión futura registrará un diff sobre los `gap_id` afectados.

---

#### 20. Efecto sobre matrices aprobadas

En esta tarea no se modifica ninguna matriz.

La futura revisión de AUTH-CAT-023 se limitará inicialmente a las claves resultantes de las 11 brechas maduras y a los dos permisos legacy relacionados.

Matrices probablemente afectadas:

| Dominio                         | Matrices principales                                                                                                                                        |
| ------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| PULSO ventas, pagos y caja      | `propietario`, `gerente_general`, `gerente`, `supervisor`, `cajero_satelite`, `operador_integral_satelite`, `gerencia_operativa` y excepciones relacionadas |
| NEXO diferencias de conteo      | `bodeguero`, `gerencia_operativa` y autoridades base de inventario                                                                                          |
| NEXO custodia y entrega         | `bodeguero`, `conductor_logistica`, receptores operativos y `gerencia_operativa`                                                                            |
| ORIGO recepción                 | `bodeguero`, futuros receptores de compras y roles administrativos de abastecimiento                                                                        |
| VISO concesiones y denegaciones | `propietario`, `gerente_general`, roles de seguridad aprobados y dispositivos administrativos compatibles                                                   |

Regla:

```text
BRECHA DIFERIDA
→ NO ACTUALIZA MATRIZ AHORA
```

---

#### 21. Gobierno de evolución posterior

La clasificación es versionable y no bloquea la evolución futura.

```text
NEEDS_FUNCTIONAL_ROADMAP
        ↓ proceso aprobado
READY_FOR_CATALOG_DESIGN
        ↓ clave aprobada
CATALOG_VERSIONED
        ↓ matriz revisada
DATASET_READY
```

También puede ocurrir:

```text
BRECHA ANALIZADA
→ DUPLICATE_OR_ABSORBED
→ REJECTED_AS_PERMISSION
→ NEEDS_EXISTING_CONTRACT_REFINEMENT
```

Un cambio de clasificación deberá conservar:

- `gap_id` estable;
- clasificación anterior;
- clasificación nueva;
- tarea que aportó madurez;
- justificación;
- impacto sobre catálogo, matrices y dispositivos.

---

#### 22. Invariantes

1. El catálogo continúa con 112 permisos.
2. Ninguna clasificación crea autorización.
3. Solo 11 brechas funcionales pasan a AUTH-CAT-022.
4. Solo dos permisos legacy quedan habilitados para descomposición inmediata.
5. `pulso.pos.main` permanece bloqueado durante la transición.
6. `viso.staff.permissions.manage` permanece bloqueado hasta sustitución y migración.
7. Ningún permiso legacy concede automáticamente sus descendientes.
8. Las brechas PULSO inmaduras esperan el diseño real del proceso.
9. Las brechas FOGO inmaduras esperan la máquina de estados productiva.
10. Las brechas NEXO inmaduras esperan rutas, incidencias y devoluciones definidas.
11. La administración de proveedores espera el roadmap ORIGO.
12. Las decisiones transversales no se resuelven por conveniencia técnica.
13. Los eventos entre servicios no son permisos humanos.
14. Los problemas estructurales no se convierten en permisos.
15. Las pantallas y rutas no se convierten en permisos.
16. Un permiso existente se refina antes de duplicarlo cuando sea suficiente.
17. La nueva versión del catálogo no se publica en esta tarea.
18. Las matrices no se modifican en esta tarea.
19. Los datasets no se inician todavía.
20. No se realizan cambios físicos.

---

#### 23. Riesgos controlados

##### Riesgo 1 — Diseñar todo el backlog ahora

Control:

```text
50 BRECHAS FUNCIONALES
→ SOLO 11 MADURAS
```

##### Riesgo 2 — Congelar permisos demasiado amplios por falta de diseño funcional

Control:

- se permite descomposición dirigida de `pulso.pos.main` y `viso.staff.permissions.manage`;
- las demás claves legacy permanecen bloqueadas y trazadas.

##### Riesgo 3 — Crear permisos que luego cambien al diseñar la pantalla

Control:

- las brechas dependientes de estados, campos o flujo se difieren;
- el contrato se diseña desde el proceso, no desde la UI.

##### Riesgo 4 — Confundir integración con autorización humana

Control:

- `GAP-FOGO-010` queda rechazado como permiso;
- los efectos entre dominios se protegen mediante identidad técnica, contrato e idempotencia.

##### Riesgo 5 — Duplicar permisos cuando basta restringir el contrato vigente

Control:

- nueve registros quedan bajo `NEEDS_EXISTING_CONTRACT_REFINEMENT`: tres funcionales y seis contractuales.

##### Riesgo 6 — Rehacer todas las matrices

Control:

- AUTH-CAT-023 aplicará únicamente el diff de las claves aprobadas.

---

#### 24. Impacto sobre tareas posteriores

| Tarea                | Resultado recibido de AUTH-CAT-021                                                       |
| -------------------- | ---------------------------------------------------------------------------------------- |
| AUTH-CAT-022         | 11 brechas maduras y 2 permisos legacy habilitados para diseño o descomposición.         |
| AUTH-CAT-023         | Solo recibirá claves finalmente aprobadas por AUTH-CAT-022.                              |
| AUTH-CAT-024         | Publicará una nueva versión únicamente si el diff contractual queda completo y validado. |
| AUTH-RBAC-024 a 026  | Consumirán la versión congelada, no el backlog diferido.                                 |
| Roadmaps funcionales | Reciben los `gap_id` diferidos como condiciones de salida obligatorias.                  |
| BLOQUE E y E3        | Reciben las brechas estructurales, de contexto y persistencia.                           |
| BLOQUE R             | Recibe únicamente contratos aprobados, datasets congelados y plan de transición.         |

---

#### 25. Criterios de aprobación

AUTH-CAT-021 podrá aprobarse cuando se acepte que:

- las ocho categorías de clasificación son suficientes;
- las puertas de madurez impiden crear permisos prematuros;
- 11 de las 50 brechas funcionales están listas para diseño;
- 30 brechas funcionales deben esperar roadmaps;
- cuatro requieren propiedad funcional;
- tres requieren refinamiento inicial de permisos existentes;
- una brecha funcional se rechaza como permiso humano;
- una agrupación se considera absorbida;
- únicamente `pulso.pos.main` y `viso.staff.permissions.manage` pueden iniciar descomposición ahora;
- los otros 19 permisos legacy permanecen diferidos y bloqueados;
- las seis decisiones de propiedad continúan pendientes;
- las seis brechas de contrato se refinan antes de crear otra clave;
- las 14 brechas estructurales no entran al catálogo;
- los asuntos técnicos, rutas y pantallas no se convierten en permisos;
- AUTH-CAT-022 queda limitado expresamente al alcance aprobado;
- las matrices y dispositivos no cambian todavía;
- el catálogo sigue en 112 permisos;
- no se realizan cambios físicos.

---

#### 26. Estado final de la propuesta

| Tarea        | Estado      |
| ------------ | ----------- |
| AUTH-CAT-020 | APROBADA    |
| AUTH-CAT-021 | APROBADA    |
| AUTH-CAT-022 | NO INICIADA |

No se avanza a AUTH-CAT-022 hasta recibir aprobación explícita.


### ✅ AUTH-CAT-022 — Descomponer permisos legacy maduros y definir nuevas claves atómicas

**Estado:** APROBADA  
**Bloque:** BLOQUE D — Revisión contractual previa a datasets  
**Naturaleza:** Diseño contractual de claves atómicas y sustitución controlada de permisos amplios  
**Implementación física:** No incluida  
**Catálogo vigente de referencia:** 112 permisos canónicos activos  
**Tarea anterior vigente:** AUTH-CAT-021 — APROBADA  
**Tarea posterior reservada:** AUTH-CAT-023 — Actualizar matrices, excepciones, denegaciones y paquetes de dispositivo afectados por el diff contractual

Esta tarea diseña exclusivamente las claves autorizadas por AUTH-CAT-021. No asigna permisos a roles o trabajadores, no actualiza matrices, no modifica paquetes de dispositivos, no publica una versión del catálogo y no altera Supabase, RLS, RPC, aplicaciones, datasets, código ni migraciones.

---

#### 1. Objetivo

Descomponer de forma controlada los permisos amplios maduros y definir claves atómicas para las once brechas `READY_FOR_CATALOG_DESIGN`, garantizando que cada clave represente una sola capacidad empresarial verificable.

El resultado deberá impedir:

```text
PERMISO AMPLIO LEGACY
→ COPIAR TODAS SUS CONCESIONES
→ TODAS LAS CLAVES NUEVAS
```

La regla obligatoria será:

```text
PERMISO AMPLIO O CONTRATO INSUFICIENTE
        ↓
CAPACIDADES ATÓMICAS APROBADAS
        ↓
REVISIÓN EXPLÍCITA DE MATRICES
        ↓
MIGRACIÓN DE CADA CONSUMIDOR
        ↓
RETIRO CONTROLADO DEL LEGACY
```

---

#### 2. Base normativa

Esta propuesta conserva sin cambios:

- ADR-AUTH-001;
- AUTH-MOD-001 a AUTH-MOD-020;
- AUTH-CAT-001 a AUTH-CAT-021;
- AUTH-RBAC-001 a AUTH-RBAC-023;
- la convención `app.modulo.recurso.accion`;
- las cuatro modalidades de autorización;
- la precedencia de denegaciones;
- el alcance, turno, check-in, área, dispositivo, simulación y contrato de recurso aprobados;
- la separación entre rol base, rol operativo, concesiones individuales y denegaciones;
- la regla de que las aplicaciones propietarias protegen capacidades empresariales y no rutas o pantallas.

AUTH-CAT-022 no reabre las 30 brechas diferidas ni las seis decisiones de propiedad funcional pendientes.

---

#### 3. Alcance autorizado

La tarea trabaja exclusivamente sobre:

##### Brechas PULSO

```text
GAP-PULSO-010
GAP-PULSO-011
GAP-PULSO-012
GAP-PULSO-013
```

##### Brechas NEXO

```text
GAP-NEXO-002
GAP-NEXO-005
GAP-NEXO-006
```

##### Brecha ORIGO

```text
GAP-ORIGO-001
```

##### Brechas VISO

```text
GAP-VISO-001
GAP-VISO-002
GAP-VISO-003
```

##### Permisos legacy habilitados para descomposición

```text
pulso.pos.main
viso.staff.permissions.manage
```

##### Contrato vigente que debe dividirse por evidencia de una brecha madura

```text
nexo.inventory.remissions.dispatch
```

---

#### 4. Decisión ejecutiva

Se proponen **29 claves canónicas nuevas**:

| Aplicación | Claves nuevas |
| ---------- | ------------: |
| PULSO      |             9 |
| NEXO       |             5 |
| ORIGO      |             1 |
| VISO       |            14 |
| **Total**  |        **29** |

Además:

- `nexo.inventory.remissions.dispatch` deberá salir del conjunto activo cuando sus consumidores se migren;
- `pulso.pos.main` continuará como legacy amplio bloqueado porque la descomposición actual solo cubre parte de PULSO;
- `viso.staff.permissions.manage` tendrá una familia de reemplazo contractual completa, pero no podrá retirarse físicamente hasta inventariar y migrar consumidores;
- ninguna asignación legacy se copiará automáticamente;
- ninguna clave nueva tendrá concesiones implícitas.

Resultado objetivo si AUTH-CAT-024 congela este diff:

```text
112 permisos activos vigentes
- 1 permiso activo sustituido: nexo.inventory.remissions.dispatch
+ 29 claves atómicas nuevas
= 140 permisos activos objetivo
```

El número de versión definitivo corresponde a AUTH-CAT-024.

---

#### PULSO — VENTAS, PAGOS Y CAJA

##### 5. Claves nuevas de PULSO

| PermissionKey                         | Etiqueta humana        | Capacidad exacta                                                                                                        | No concede                                                                                                |
| ------------------------------------- | ---------------------- | ----------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| `pulso.sales.orders.create`           | Crear ventas           | Crear una orden de venta o venta inicial dentro de la sede, canal y reglas comerciales autorizadas.                     | Cobrar, aplicar descuentos, cancelar, devolver, reembolsar o cerrar caja.                                 |
| `pulso.payments.transactions.collect` | Cobrar pagos           | Registrar un cobro ordinario mediante un medio de pago autorizado y vincularlo con una venta y sesión de caja válidas.  | Revertir, reembolsar, cambiar precios o cerrar caja.                                                      |
| `pulso.payments.transactions.reverse` | Revertir pagos         | Invalidar una transacción de pago reversible antes de que el proceso exija un reembolso formal.                         | Crear devoluciones, reembolsar pagos liquidados o cancelar la venta completa.                             |
| `pulso.cash.sessions.start`           | Abrir sesión de caja   | Iniciar una sesión de caja para un actor, punto y sede autorizados.                                                     | Cobrar por sí solo, abrir varias sesiones incompatibles o utilizar la caja de otro actor.                 |
| `pulso.cash.sessions.close`           | Cerrar sesión de caja  | Cerrar la sesión de caja propia o expresamente asignada, registrando conteos y diferencias exigidas.                    | Aprobar diferencias, corregir movimientos o cerrar sesiones ajenas por inferencia.                        |
| `pulso.sales.orders.cancel`           | Anular ventas          | Cancelar una venta u orden en un estado cancelable mediante motivo y trazabilidad.                                      | Reembolsar pagos, devolver artículos, revertir inventario o eliminar evidencia.                           |
| `pulso.sales.returns.create`          | Registrar devoluciones | Crear una devolución comercial vinculada a líneas concretas de una venta entregada o facturada.                         | Reembolsar dinero, modificar la venta original o ajustar inventario silenciosamente.                      |
| `pulso.payments.transactions.refund`  | Reembolsar pagos       | Ejecutar un reembolso sobre una transacción y monto elegibles, con motivo y vínculo a devolución o resolución aprobada. | Crear la devolución, cancelar la venta o modificar el pago original fuera del monto permitido.            |
| `pulso.sales.discounts.apply`         | Aplicar descuentos     | Aplicar un descuento permitido a una venta o línea concreta, conservando regla, actor, motivo y cálculo.                | Modificar precios maestros, crear políticas de descuentos o otorgar descuentos fuera del límite aprobado. |

---

##### 6. Separaciones obligatorias de PULSO

###### 6.1 Cobro, reversión y reembolso

```text
collect
→ registrar cobro ordinario

reverse
→ invalidar una transacción todavía reversible

refund
→ devolver dinero después de una transacción liquidada o materializada
```

Estas acciones no son aliases ni variantes de una sola capacidad.

###### 6.2 Anulación, devolución y reembolso

```text
cancel order
≠ create return
≠ refund payment
```

Una operación podrá requerir varias decisiones en secuencia, pero ninguna clave absorbe a las demás.

###### 6.3 Caja

```text
start cash session
≠ collect payment
≠ close cash session
≠ approve cash difference
```

La aprobación o resolución de diferencias de caja no se crea en esta tarea porque su contrato funcional todavía no fue clasificado como maduro.

---

##### 7. Clasificación contractual de PULSO

| PermissionKey                         | `authorization_requirement` | Solo lectura | Configuración | Sensible                                                  | Contexto operativo           | Área operativa    | Dispositivo compartido   | Simulación      |
| ------------------------------------- | --------------------------- | ------------ | ------------- | --------------------------------------------------------- | ---------------------------- | ----------------- | ------------------------ | --------------- |
| `pulso.sales.orders.create`           | `OPERATIONAL_ONLY`          | false        | false         | false                                                     | `T+C`                        | `SITE_SUFFICIENT` | `STANDARD_ACTOR_SESSION` | `FULL_PREVIEW`  |
| `pulso.payments.transactions.collect` | `OPERATIONAL_ONLY`          | false        | false         | true — `FINANCIAL_DATA`                                   | `T+C`                        | `REQUIRED`        | `STANDARD_ACTOR_SESSION` | `FULL_PREVIEW`  |
| `pulso.payments.transactions.reverse` | `BASE_AND_OPERATIONAL`      | false        | false         | true — `FINANCIAL_DATA`, `EXCEPTIONAL_ACTION`             | base `N` + operacional `T+C` | `REQUIRED`        | `STRONG_REAUTH_REQUIRED` | `DECISION_ONLY` |
| `pulso.cash.sessions.start`           | `OPERATIONAL_ONLY`          | false        | false         | true — `FINANCIAL_DATA`                                   | `T+C`                        | `REQUIRED`        | `STANDARD_ACTOR_SESSION` | `FULL_PREVIEW`  |
| `pulso.cash.sessions.close`           | `OPERATIONAL_ONLY`          | false        | false         | true — `FINANCIAL_DATA`                                   | `T+C`                        | `REQUIRED`        | `STANDARD_ACTOR_SESSION` | `FULL_PREVIEW`  |
| `pulso.sales.orders.cancel`           | `BASE_AND_OPERATIONAL`      | false        | false         | true — `EXCEPTIONAL_ACTION`                               | base `N` + operacional `T+C` | `SITE_SUFFICIENT` | `STRONG_REAUTH_REQUIRED` | `DECISION_ONLY` |
| `pulso.sales.returns.create`          | `BASE_AND_OPERATIONAL`      | false        | false         | true — `FINANCIAL_DATA`, `INVENTORY_INTEGRITY`            | base `N` + operacional `T+C` | `SITE_SUFFICIENT` | `STRONG_REAUTH_REQUIRED` | `DECISION_ONLY` |
| `pulso.payments.transactions.refund`  | `BASE_AND_OPERATIONAL`      | false        | false         | true — `FINANCIAL_DATA`, `EXCEPTIONAL_ACTION`             | base `N` + operacional `T+C` | `REQUIRED`        | `STRONG_REAUTH_REQUIRED` | `DECISION_ONLY` |
| `pulso.sales.discounts.apply`         | `BASE_AND_OPERATIONAL`      | false        | false         | true — `COMMERCIAL_CONFIDENTIALITY`, `EXCEPTIONAL_ACTION` | base `N` + operacional `T+C` | `SITE_SUFFICIENT` | `STRONG_REAUTH_REQUIRED` | `DECISION_ONLY` |

Reglas:

- `T+C` exige turno publicado vigente y check-in activo compatible.
- `BASE_AND_OPERATIONAL` exige ambos carriles para el mismo actor, recurso y solicitud.
- el componente base no crea caja, área ni sesión operativa;
- el componente operativo no crea autoridad administrativa;
- una terminal compartida no permite que el actor anterior conserve reautenticación o sesión de caja.

---

##### 8. Contratos mínimos de recurso de PULSO

| PermissionKey                         | Recurso                     | Localizador mínimo                                                                 | Estado y condiciones                                                                                                                                   |
| ------------------------------------- | --------------------------- | ---------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `pulso.sales.orders.create`           | `SALE_ORDER_DRAFT`          | sede, área cuando aplique, canal, líneas, lista de precios y clave de idempotencia | Crear desde un contexto comercial válido; validar precios y disponibilidad mediante contratos propietarios; no aceptar importes libres no autorizados. |
| `pulso.payments.transactions.collect` | `PAYMENT_TRANSACTION_DRAFT` | `order_id`, `cash_session_id`, medio, monto, moneda y clave de idempotencia        | Venta cobrable, sesión abierta y medio permitido; escritura atómica y comprobante trazable.                                                            |
| `pulso.payments.transactions.reverse` | `PAYMENT_TRANSACTION`       | `payment_transaction_id`, motivo y versión                                         | Solo transacción reversible; bloqueo de concurrencia; no utilizar cuando el estado exige reembolso.                                                    |
| `pulso.cash.sessions.start`           | `CASH_SESSION_DRAFT`        | sede, área, punto de caja, actor y monto inicial cuando aplique                    | Impedir sesiones incompatibles simultáneas; creación idempotente; atribución personal.                                                                 |
| `pulso.cash.sessions.close`           | `CASH_SESSION`              | `cash_session_id`, conteo final, diferencias y versión                             | Solo sesión abierta y autorizada; no aprobar automáticamente diferencias; cierre atómico y auditable.                                                  |
| `pulso.sales.orders.cancel`           | `SALE_ORDER`                | `order_id`, motivo y versión                                                       | Solo estado cancelable; conservar evidencia; los efectos de pago, inventario o producción requieren contratos separados.                               |
| `pulso.sales.returns.create`          | `SALE_RETURN_DRAFT`         | `order_id`, líneas, cantidades, motivo, receptor y clave de idempotencia           | Solo líneas elegibles; impedir exceso sobre cantidad entregada; no ejecutar reembolso por implicación.                                                 |
| `pulso.payments.transactions.refund`  | `PAYMENT_REFUND_DRAFT`      | transacción, devolución o resolución, monto, medio, motivo y clave de idempotencia | Monto reembolsable y estado válido; impedir exceder el saldo; operación atómica y auditable.                                                           |
| `pulso.sales.discounts.apply`         | `DISCOUNT_APPLICATION`      | `order_id`, línea opcional, regla, valor, motivo y versión                         | La regla y el límite deben existir; no modificar precios maestros; registrar cálculo antes y después.                                                  |

---

##### 9. Estado de `pulso.pos.main`

`pulso.pos.main` permanece:

```text
catalog_status = deprecated
assignment_status = blocked
resolution = DECOMPOSE_REQUIRED
```

No tendrá alias uno-a-muchos hacia las nueve claves nuevas.

No podrá retirarse todavía porque permanecen diferidos, entre otros:

- consulta y actualización de pedidos;
- operación de mesas y servicio;
- preparación y comandas;
- fidelización;
- entrega ordinaria;
- incidencias y supervisión comercial.

Regla:

```text
MIGRAR UNA PANTALLA POS
→ INVENTARIAR CADA ACCIÓN REAL
→ EXIGIR SU PERMISO ATÓMICO
→ NUNCA ACEPTAR pos.main COMO FALLBACK
```

---

#### NEXO — DIFERENCIAS, CUSTODIA Y ENTREGA

##### 10. Claves nuevas de NEXO

| PermissionKey                                  | Etiqueta humana                          | Capacidad exacta                                                                                                                 | No concede                                                                            |
| ---------------------------------------------- | ---------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- |
| `nexo.inventory.stock_count_variances.approve` | Aprobar diferencias de conteo            | Aprobar una diferencia capturada en un conteo de inventario, sin resolverla ni aplicar un ajuste por implicación.                | Capturar el conteo, resolver la diferencia o registrar el ajuste.                     |
| `nexo.inventory.stock_count_variances.resolve` | Resolver diferencias de conteo           | Registrar la resolución documentada de una diferencia aprobable o aprobada, indicando tratamiento y evidencia.                   | Aprobar automáticamente, aplicar ajustes silenciosos o modificar la captura original. |
| `nexo.inventory.remissions.accept_custody`     | Aceptar custodia de una remisión         | Confirmar que el conductor o actor logístico asignado recibe físicamente la carga preparada bajo cantidades y bultos declarados. | Preparar, cambiar cantidades, iniciar tránsito o recibir en destino.                  |
| `nexo.inventory.remissions.start_transit`      | Iniciar tránsito de una remisión         | Iniciar el tránsito de una remisión cuya custodia ya fue aceptada por el actor y cuya ruta o destino son válidos.                | Aceptar custodia, reasignar conductor, cambiar ruta, entregar o recibir.              |
| `nexo.inventory.remissions.deliver`            | Registrar entrega física de una remisión | Registrar el handoff físico de una remisión en tránsito a un receptor autorizado del destino.                                    | Recibir cantidades en nombre del destino, crear inventario o cerrar diferencias.      |

---

##### 11. Separación de diferencias de conteo

```text
stock_counts.perform
→ captura conteo

stock_count_variances.approve
→ autoridad aprueba la diferencia

stock_count_variances.resolve
→ autoridad registra la resolución

inventory.adjustments.register
→ ejecuta el ajuste autorizado cuando corresponda
```

La misma persona no podrá capturar, aprobar, resolver y ajustar una diferencia cuando la segregación aprobada exija actores distintos.

---

##### 12. Separación logística de custodia

```text
BODEGA PREPARA
nexo.inventory.remissions.prepare
        ↓
ACTOR LOGÍSTICO ACEPTA CUSTODIA
nexo.inventory.remissions.accept_custody
        ↓
ACTOR LOGÍSTICO INICIA TRÁNSITO
nexo.inventory.remissions.start_transit
        ↓
ACTOR LOGÍSTICO REGISTRA HANDOFF
nexo.inventory.remissions.deliver
        ↓
DESTINO ACEPTA CANTIDADES Y CUSTODIA
nexo.inventory.remissions.receive
```

`deliver` no autoriza al conductor a ejecutar `receive`.

La entrega registra el handoff del lado transportador. La aceptación definitiva de cantidades y la entrada de inventario continúan perteneciendo al receptor mediante `nexo.inventory.remissions.receive`.

---

##### 13. Clasificación contractual de NEXO

| PermissionKey                                  | `authorization_requirement` | Solo lectura | Configuración | Sensible                      | Contexto operativo           | Área operativa    | Dispositivo compartido   | Simulación      |
| ---------------------------------------------- | --------------------------- | ------------ | ------------- | ----------------------------- | ---------------------------- | ----------------- | ------------------------ | --------------- |
| `nexo.inventory.stock_count_variances.approve` | `BASE_AND_OPERATIONAL`      | false        | false         | true — `INVENTORY_INTEGRITY`  | base `N` + operacional `T+C` | `REQUIRED`        | `STRONG_REAUTH_REQUIRED` | `DECISION_ONLY` |
| `nexo.inventory.stock_count_variances.resolve` | `BASE_AND_OPERATIONAL`      | false        | false         | true — `INVENTORY_INTEGRITY`  | base `N` + operacional `T+C` | `REQUIRED`        | `STRONG_REAUTH_REQUIRED` | `DECISION_ONLY` |
| `nexo.inventory.remissions.accept_custody`     | `OPERATIONAL_ONLY`          | false        | false         | true — `CUSTODY_CONFIRMATION` | `T+C`                        | `SITE_SUFFICIENT` | `STANDARD_ACTOR_SESSION` | `FULL_PREVIEW`  |
| `nexo.inventory.remissions.start_transit`      | `OPERATIONAL_ONLY`          | false        | false         | true — `CUSTODY_CONFIRMATION` | `T+C`                        | `SITE_SUFFICIENT` | `STANDARD_ACTOR_SESSION` | `FULL_PREVIEW`  |
| `nexo.inventory.remissions.deliver`            | `OPERATIONAL_ONLY`          | false        | false         | true — `CUSTODY_CONFIRMATION` | `T+C`                        | `SITE_SUFFICIENT` | `STANDARD_ACTOR_SESSION` | `FULL_PREVIEW`  |

---

##### 14. Contratos mínimos de recurso de NEXO

| PermissionKey                                  | Recurso                | Localizador mínimo                                                                      | Estado y condiciones                                                                                                          |
| ---------------------------------------------- | ---------------------- | --------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| `nexo.inventory.stock_count_variances.approve` | `STOCK_COUNT_VARIANCE` | `variance_id`, `count_id`, versión y evidencia disponible                               | Solo estado aprobable; el aprobador no puede ser el capturador cuando aplique; decisión idempotente y auditable.              |
| `nexo.inventory.stock_count_variances.resolve` | `STOCK_COUNT_VARIANCE` | `variance_id`, tipo de resolución, evidencia, motivo y versión                          | Solo estado resoluble; no altera la captura; el ajuste posterior exige su propio permiso y referencia a la resolución.        |
| `nexo.inventory.remissions.accept_custody`     | `REMISSION`            | `remission_id`, actor logístico, bultos/LPN, cantidades declaradas y versión            | Solo remisión preparada y asignada; no cambiar cantidades; discrepancias no se ocultan ni se convierten en ajuste automático. |
| `nexo.inventory.remissions.start_transit`      | `REMISSION`            | `remission_id`, aceptación de custodia vigente, ruta, vehículo cuando aplique y versión | Solo después de aceptar custodia; inicio atómico e idempotente; actor y segmento logístico exactos.                           |
| `nexo.inventory.remissions.deliver`            | `REMISSION`            | `remission_id`, destino, receptor identificado, hora, ubicación y versión               | Solo remisión en tránsito y destino válido; registra handoff; no crea recepción ni entrada de inventario.                     |

Las pruebas de entrega, incidentes, entrega fallida, devolución y reasignación permanecen diferidas a los roadmaps NEXO.

---

##### 15. Sustitución de `nexo.inventory.remissions.dispatch`

La evidencia de `GAP-NEXO-005` y `GAP-CONTRACT-003` confirma que `dispatch` combina dos autoridades distintas:

```text
aceptar custodia
+
iniciar tránsito
```

Por tanto, su resolución objetivo será:

```text
nexo.inventory.remissions.dispatch
→ DEPRECATED_SPLIT_PENDING_MIGRATION
→ replacement_set:
   - nexo.inventory.remissions.accept_custody
   - nexo.inventory.remissions.start_transit
```

Reglas:

1. No existe alias uno-a-muchos.
2. Una asignación de `dispatch` no se copia a ambas claves.
3. Cada actor deberá evaluarse separadamente en AUTH-CAT-023.
4. Cada guard, RPC y transición deberá migrarse según la acción real ejecutada.
5. Mientras exista un consumidor sin migrar, la compatibilidad deberá fallar de forma cerrada o mantenerse en una capa legacy explícita; nunca mediante fallback silencioso.
6. La clave retirada no podrá reutilizarse con otro significado.

---

#### ORIGO — RECEPCIÓN COMERCIAL

##### 16. Clave nueva de ORIGO

| PermissionKey                         | Etiqueta humana                 | Descripción                                                                                                                                          | No concede                                                                                                     |
| ------------------------------------- | ------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `origo.procurement.receipts.register` | Registrar recepciones de compra | Registrar formalmente la recepción comercial de una orden de compra, proveedor, documento y cantidades recibidas para una sede receptora autorizada. | Crear órdenes de compra, modificar proveedores, registrar directamente stock, corregir o revertir recepciones. |

---

##### 17. Clasificación contractual de ORIGO

| PermissionKey                         | `authorization_requirement` | Solo lectura | Configuración | Sensible                                                   | Contexto operativo           | Área operativa    | Dispositivo compartido   | Simulación     |
| ------------------------------------- | --------------------------- | ------------ | ------------- | ---------------------------------------------------------- | ---------------------------- | ----------------- | ------------------------ | -------------- |
| `origo.procurement.receipts.register` | `BASE_OR_OPERATIONAL`       | false        | false         | true — `COMMERCIAL_CONFIDENTIALITY`, `INVENTORY_INTEGRITY` | base `N` u operacional `T+C` | `SITE_SUFFICIENT` | `STANDARD_ACTOR_SESSION` | `FULL_PREVIEW` |

Contrato mínimo:

| Recurso                  | Localizador mínimo                                                                                                            | Estado y condiciones                                                                                                                        |
| ------------------------ | ----------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `PURCHASE_RECEIPT_DRAFT` | orden de compra, proveedor, documento comercial, sede receptora, líneas, cantidades, condición, actor y clave de idempotencia | Orden y proveedor válidos; cantidades recibibles; registro atómico; evidencia y auditoría; no escribir directamente inventario desde ORIGO. |

Separación propietaria:

```text
ORIGO
→ registra la recepción comercial
→ conserva proveedor, orden, documento y cantidades recibidas

NEXO
→ registra la entrada física de inventario mediante su contrato propietario
```

La integración deberá emitir un evento canónico idempotente después de confirmar la recepción comercial. La identidad técnica del adaptador no recibe permisos humanos.

Recepciones parciales, correcciones y reversión permanecen diferidas a ORIGO-AUTH-007 y ORIGO-AUTH-008.

---

#### VISO — GOBIERNO DE CONCESIONES Y DENEGACIONES

##### 18. Principio de diseño

`viso.staff.permissions.manage` no será reemplazado por otro permiso `manage`.

Las capacidades se separan por:

```text
TIPO DE REGISTRO
├── concesión individual base
├── concesión individual operativa
└── denegación individual o transversal

ACCIÓN DE GOBIERNO
├── consultar
├── crear propuesta
├── aprobar y activar
├── suspender concesión positiva
└── revocar
```

Las denegaciones no utilizan `suspend`: una denegación se activa mediante aprobación y termina por expiración o revocación auditable. Suspender temporalmente una denegación podría reactivar permisos heredados de forma implícita y queda prohibido.

---

##### 19. Claves nuevas para concesiones individuales base

| PermissionKey                            | Etiqueta humana                         | Capacidad exacta                                                                                                     |
| ---------------------------------------- | --------------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| `viso.authorization.base_grants.view`    | Consultar concesiones individuales base | Consultar propuestas, concesiones activas, suspendidas, vencidas o revocadas dentro del alcance administrativo real. |
| `viso.authorization.base_grants.create`  | Crear propuestas de concesión base      | Crear una propuesta no activa para un trabajador, permiso, carril base, alcance, vigencia y justificación exactos.   |
| `viso.authorization.base_grants.approve` | Aprobar concesiones individuales base   | Aprobar y activar una propuesta base válida creada por otro actor autorizado.                                        |
| `viso.authorization.base_grants.suspend` | Suspender concesiones individuales base | Suspender temporalmente una concesión base activa, conservando historial, motivo y vigencia de la suspensión.        |
| `viso.authorization.base_grants.revoke`  | Revocar concesiones individuales base   | Terminar de forma auditable una concesión base sin eliminar su historial.                                            |

---

##### 20. Claves nuevas para concesiones individuales operativas

| PermissionKey                                   | Etiqueta humana                               | Capacidad exacta                                                                                                    |
| ----------------------------------------------- | --------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| `viso.authorization.operational_grants.view`    | Consultar concesiones individuales operativas | Consultar propuestas y estados de concesiones operativas, incluidos roles compatibles, territorio y vigencia.       |
| `viso.authorization.operational_grants.create`  | Crear propuestas de concesión operativa       | Crear una propuesta no activa para un trabajador, permiso, carril operativo, roles compatibles, alcance y vigencia. |
| `viso.authorization.operational_grants.approve` | Aprobar concesiones individuales operativas   | Aprobar y activar una propuesta operativa válida creada por otro actor autorizado.                                  |
| `viso.authorization.operational_grants.suspend` | Suspender concesiones individuales operativas | Suspender temporalmente una concesión operativa sin modificar el rol del turno ni borrar el historial.              |
| `viso.authorization.operational_grants.revoke`  | Revocar concesiones individuales operativas   | Terminar de forma auditable una concesión operativa sin alterar matrices o turnos.                                  |

---

##### 21. Claves nuevas para denegaciones

| PermissionKey                        | Etiqueta humana                     | Capacidad exacta                                                                                                           |
| ------------------------------------ | ----------------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| `viso.authorization.denials.view`    | Consultar denegaciones individuales | Consultar denegaciones de carril y bloqueos transversales dentro del alcance administrativo real.                          |
| `viso.authorization.denials.create`  | Crear propuestas de denegación      | Crear una propuesta no activa para una clave exacta, trabajador, carril o bloqueo transversal, alcance, vigencia y motivo. |
| `viso.authorization.denials.approve` | Aprobar denegaciones individuales   | Aprobar y activar una denegación válida creada por otro actor autorizado, verificando recuperación y segregación.          |
| `viso.authorization.denials.revoke`  | Revocar denegaciones individuales   | Terminar una denegación de forma auditable; la revocación no concede por sí sola ningún permiso.                           |

---

##### 22. Clasificación contractual de VISO

| PermissionKey                                   | `authorization_requirement` | Solo lectura | Configuración | Sensible                        | Contexto | Área             | Dispositivo compartido   | Simulación      |
| ----------------------------------------------- | --------------------------- | ------------ | ------------- | ------------------------------- | -------- | ---------------- | ------------------------ | --------------- |
| `viso.authorization.base_grants.view`           | `BASE_ONLY`                 | true         | true          | true — `AUTHORIZATION_SECURITY` | `N`      | `NOT_APPLICABLE` | `STRONG_REAUTH_REQUIRED` | `DECISION_ONLY` |
| `viso.authorization.base_grants.create`         | `BASE_ONLY`                 | false        | true          | true — `AUTHORIZATION_SECURITY` | `N`      | `NOT_APPLICABLE` | `STRONG_REAUTH_REQUIRED` | `DECISION_ONLY` |
| `viso.authorization.base_grants.approve`        | `BASE_ONLY`                 | false        | true          | true — `AUTHORIZATION_SECURITY` | `N`      | `NOT_APPLICABLE` | `STRONG_REAUTH_REQUIRED` | `DECISION_ONLY` |
| `viso.authorization.base_grants.suspend`        | `BASE_ONLY`                 | false        | true          | true — `AUTHORIZATION_SECURITY` | `N`      | `NOT_APPLICABLE` | `STRONG_REAUTH_REQUIRED` | `DECISION_ONLY` |
| `viso.authorization.base_grants.revoke`         | `BASE_ONLY`                 | false        | true          | true — `AUTHORIZATION_SECURITY` | `N`      | `NOT_APPLICABLE` | `STRONG_REAUTH_REQUIRED` | `DECISION_ONLY` |
| `viso.authorization.operational_grants.view`    | `BASE_ONLY`                 | true         | true          | true — `AUTHORIZATION_SECURITY` | `N`      | `NOT_APPLICABLE` | `STRONG_REAUTH_REQUIRED` | `DECISION_ONLY` |
| `viso.authorization.operational_grants.create`  | `BASE_ONLY`                 | false        | true          | true — `AUTHORIZATION_SECURITY` | `N`      | `NOT_APPLICABLE` | `STRONG_REAUTH_REQUIRED` | `DECISION_ONLY` |
| `viso.authorization.operational_grants.approve` | `BASE_ONLY`                 | false        | true          | true — `AUTHORIZATION_SECURITY` | `N`      | `NOT_APPLICABLE` | `STRONG_REAUTH_REQUIRED` | `DECISION_ONLY` |
| `viso.authorization.operational_grants.suspend` | `BASE_ONLY`                 | false        | true          | true — `AUTHORIZATION_SECURITY` | `N`      | `NOT_APPLICABLE` | `STRONG_REAUTH_REQUIRED` | `DECISION_ONLY` |
| `viso.authorization.operational_grants.revoke`  | `BASE_ONLY`                 | false        | true          | true — `AUTHORIZATION_SECURITY` | `N`      | `NOT_APPLICABLE` | `STRONG_REAUTH_REQUIRED` | `DECISION_ONLY` |
| `viso.authorization.denials.view`               | `BASE_ONLY`                 | true         | true          | true — `AUTHORIZATION_SECURITY` | `N`      | `NOT_APPLICABLE` | `STRONG_REAUTH_REQUIRED` | `DECISION_ONLY` |
| `viso.authorization.denials.create`             | `BASE_ONLY`                 | false        | true          | true — `AUTHORIZATION_SECURITY` | `N`      | `NOT_APPLICABLE` | `STRONG_REAUTH_REQUIRED` | `DECISION_ONLY` |
| `viso.authorization.denials.approve`            | `BASE_ONLY`                 | false        | true          | true — `AUTHORIZATION_SECURITY` | `N`      | `NOT_APPLICABLE` | `STRONG_REAUTH_REQUIRED` | `DECISION_ONLY` |
| `viso.authorization.denials.revoke`             | `BASE_ONLY`                 | false        | true          | true — `AUTHORIZATION_SECURITY` | `N`      | `NOT_APPLICABLE` | `STRONG_REAUTH_REQUIRED` | `DECISION_ONLY` |

La sesión administrativa no requiere turno ni check-in. El uso desde `management_terminal` exige actor individual, reautenticación fuerte y limpieza completa al cambiar de actor.

---

##### 23. Contrato común de recursos VISO

###### 23.1 Concesiones base

```text
resource_type = INDIVIDUAL_BASE_GRANT
```

Localizador mínimo:

- `grant_id` para registros existentes;
- o borrador con `target_employee_id`, `permission_key`, `lane = BASE`, alcance, vigencia, motivo y referencia de origen.

###### 23.2 Concesiones operativas

```text
resource_type = INDIVIDUAL_OPERATIONAL_GRANT
```

Localizador mínimo:

- `grant_id`;
- o borrador con trabajador, permiso, `lane = OPERATIONAL`, roles operativos compatibles, alcance, vigencia y justificación.

###### 23.3 Denegaciones

```text
resource_type = INDIVIDUAL_DENIAL
```

Localizador mínimo:

- `denial_id`;
- o borrador con trabajador, permiso exacto, clase `BASE_LANE_DENY`, `OPERATIONAL_LANE_DENY` o `ACTOR_WIDE_DENY`, alcance, vigencia y motivo.

---

##### 24. Reglas de gobierno VISO

1. `create` genera una propuesta no activa.
2. `approve` activa una propuesta válida.
3. El beneficiario o afectado no aprueba su propio registro.
4. Un actor no crea una concesión a su favor ni una denegación sobre sí mismo para manipular su autorización o la trazabilidad.
5. El creador no se presume aprobador.
6. Quien administra técnicamente la interfaz no obtiene autoridad empresarial.
7. `suspend` solo aplica a concesiones positivas activas.
8. `revoke` conserva historial y no elimina físicamente el registro.
9. Revocar una denegación no crea un allow.
10. Suspender o revocar una concesión invalida caché y decisiones reutilizables.
11. Toda mutación exige versión esperada, motivo, evidencia y auditoría reforzada.
12. Ninguna clave concede administración de matrices de roles.
13. Ninguna clave concede publicar versiones del catálogo.
14. Ninguna clave concede administrar dispositivos compartidos.
15. Ninguna clave permite wildcards, prefijos o permisos inexistentes.
16. No existe permiso para ignorar denegaciones.
17. No existe autoaprobación por ser propietario o gerente general.
18. Debe conservarse al menos un principal válido de recuperación.

---

##### 25. Estado de `viso.staff.permissions.manage`

La familia nueva sustituye el contrato de administración de concesiones y denegaciones individuales.

Resolución:

```text
viso.staff.permissions.manage
→ DEPRECATED_SPLIT_PENDING_MIGRATION
→ replacement_family:
   viso.authorization.base_grants.*
   viso.authorization.operational_grants.*
   viso.authorization.denials.*
```

No existe alias uno-a-muchos.

El permiso legacy no concede automáticamente:

- consultar todos los registros;
- crear propuestas;
- aprobarlas;
- suspenderlas;
- revocarlas.

Tampoco se interpreta como autorización para:

- administrar matrices base u operativas;
- modificar el catálogo;
- publicar versiones;
- cambiar roles;
- ignorar segregación de funciones.

---

#### DIFF CONTRACTUAL CONSOLIDADO

##### 26. Lista canónica de las 29 claves candidatas

```text
PULSO
pulso.sales.orders.create
pulso.payments.transactions.collect
pulso.payments.transactions.reverse
pulso.cash.sessions.start
pulso.cash.sessions.close
pulso.sales.orders.cancel
pulso.sales.returns.create
pulso.payments.transactions.refund
pulso.sales.discounts.apply

NEXO
nexo.inventory.stock_count_variances.approve
nexo.inventory.stock_count_variances.resolve
nexo.inventory.remissions.accept_custody
nexo.inventory.remissions.start_transit
nexo.inventory.remissions.deliver

ORIGO
origo.procurement.receipts.register

VISO
viso.authorization.base_grants.view
viso.authorization.base_grants.create
viso.authorization.base_grants.approve
viso.authorization.base_grants.suspend
viso.authorization.base_grants.revoke
viso.authorization.operational_grants.view
viso.authorization.operational_grants.create
viso.authorization.operational_grants.approve
viso.authorization.operational_grants.suspend
viso.authorization.operational_grants.revoke
viso.authorization.denials.view
viso.authorization.denials.create
viso.authorization.denials.approve
viso.authorization.denials.revoke
```

Todas cumplen la estructura:

```text
app.modulo.recurso.accion
```

No contienen:

- nombres de rutas;
- nombres de pantallas;
- `main`;
- `manage`;
- `all`;
- `override` genérico;
- territorio dentro de la clave;
- propiedad `own` dentro de la clave;
- estado dentro de la clave;
- nombres de roles.

---

##### 27. Distribución objetivo del catálogo activo

Si AUTH-CAT-024 congela el diff tal como está propuesto:

| Aplicación | Activos actuales |  Altas | Bajas activas | Activos objetivo |
| ---------- | ---------------: | -----: | ------------: | ---------------: |
| SHELL      |                1 |      0 |             0 |                1 |
| ANIMA      |               10 |      0 |             0 |               10 |
| AURA       |                1 |      0 |             0 |                1 |
| FOGO       |                6 |      0 |             0 |                6 |
| NEXO       |               63 |      5 |             1 |               67 |
| NUMERA     |                6 |      0 |             0 |                6 |
| ORIGO      |                5 |      1 |             0 |                6 |
| PASS       |                1 |      0 |             0 |                1 |
| PULSO      |                2 |      9 |             0 |               11 |
| VISO       |               17 |     14 |             0 |               31 |
| **Total**  |          **112** | **29** |         **1** |          **140** |

La baja activa corresponde a:

```text
nexo.inventory.remissions.dispatch
```

Los permisos `pulso.pos.main` y `viso.staff.permissions.manage` ya pertenecen al inventario legacy bloqueado y no forman parte de los 112 activos.

---

##### 28. Estado objetivo de claves sustituidas

| Clave                                | Estado objetivo                      | Asignable                 | Reemplazo                                                 | Retiro físico                                                       |
| ------------------------------------ | ------------------------------------ | ------------------------- | --------------------------------------------------------- | ------------------------------------------------------------------- |
| `pulso.pos.main`                     | `deprecated_incomplete_split`        | No                        | Nueve claves maduras más futuros permisos PULSO diferidos | Solo después de cubrir todos los consumidores y operaciones reales. |
| `viso.staff.permissions.manage`      | `deprecated_split_pending_migration` | No                        | 14 claves VISO de concesiones y denegaciones              | Después de migrar consumidores, datos y pruebas de segregación.     |
| `nexo.inventory.remissions.dispatch` | `deprecated_split_pending_migration` | No en la versión objetivo | `accept_custody` + `start_transit`                        | Después de migrar guards, RPC, eventos, matrices y dispositivos.    |

Ninguna de estas claves tendrá alias uno-a-muchos.

---

##### 29. Impacto de versión

AUTH-CAT-024 decidirá el número definitivo.

Regla:

```text
SI LA PRIMERA VERSIÓN FÍSICA 1.0.0 TODAVÍA NO FUE PUBLICADA
→ podrá congelarse directamente con 140 permisos activos
→ sin publicar primero el conjunto intermedio de 112
```

```text
SI YA EXISTE UNA VERSIÓN PUBLICADA QUE CONTIENE
nexo.inventory.remissions.dispatch COMO CLAVE ACTIVA
→ retirarla o cambiar su contrato exige MAJOR
```

Agregar las 29 claves es aditivo. Retirar `dispatch` del conjunto activo es incompatible.

No se fijará `1.1.0`, `2.0.0` u otro número dentro de esta tarea.

---

#### IMPACTO RESERVADO PARA AUTH-CAT-023

##### 30. Matrices potencialmente afectadas

| Dominio                       | Matrices a revisar mediante diff                                                                                                                             |
| ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| PULSO ventas, pagos y caja    | `propietario`, `gerente_general`, `gerente`, `supervisor`, `cajero_satelite`, `operador_integral_satelite`, `gerencia_operativa` y excepciones relacionadas. |
| NEXO diferencias de conteo    | `bodeguero`, `gerencia_operativa` y roles base con autoridad de aprobación o resolución.                                                                     |
| NEXO custodia y tránsito      | `conductor_logistica`, `bodeguero` cuando corresponda al handoff, receptores operativos y `gerencia_operativa` solo en casos expresamente aprobados.         |
| ORIGO recepción               | `bodeguero`, roles administrativos de abastecimiento y futuros receptores aprobados.                                                                         |
| VISO gobierno de autorización | `propietario`, `gerente_general` y cualquier rol de seguridad expresamente aprobado; nunca por nombre o bypass.                                              |

AUTH-CAT-023 deberá evaluar cada clave, rol y carril. No podrá copiar la matriz de la clave legacy.

---

##### 31. Paquetes de dispositivo potencialmente afectados

| Plantilla o paquete              | Diff esperado                                                                                           |
| -------------------------------- | ------------------------------------------------------------------------------------------------------- |
| `pos_satellite`                  | Incorporar solo acciones PULSO asignadas al actor y al flujo real de caja.                              |
| `integrated_satellite`           | Incorporar únicamente las acciones comerciales aprobadas para el operador integral.                     |
| `operations_management_terminal` | Incorporar componentes operativos sensibles solo cuando exista también el componente base requerido.    |
| `warehouse_kiosk`                | No incorporar aprobación o resolución de diferencias; puede requerir flujos de evidencia, no autoridad. |
| `logistics_vehicle_terminal`     | Sustituir `dispatch` por `accept_custody`, `start_transit` y `deliver` según la matriz aprobada.        |
| `procurement_reception`          | Incorporar `origo.procurement.receipts.register` únicamente en el modo y carril autorizados.            |
| `management_terminal`            | Incorporar claves VISO solo con actor administrativo y reautenticación fuerte.                          |

El paquete del dispositivo sigue siendo un filtro restrictivo. Nunca concede la clave.

---

#### COMPATIBILIDAD Y MIGRACIÓN FUTURA

##### 32. Reglas de transición

1. Inventariar todos los consumidores de cada clave legacy antes de cambiarla.
2. Clasificar cada consumidor por acción empresarial real.
3. Sustituir el guard por una única clave atómica o por varias decisiones explícitas en secuencia.
4. Migrar asignaciones únicamente después de revisar intención, carril y alcance.
5. No crear aliases uno-a-muchos.
6. No usar el permiso legacy como fallback cuando falte una clave nueva.
7. No aceptar cadenas desconocidas como `PermissionKey`.
8. Mantener las claves legacy separadas en `LegacyPermissionKey` durante la compatibilidad.
9. Una solicitud con clave retirada deberá denegarse y registrar diagnóstico.
10. La migración física deberá crearse en `vento-shell` y contener pruebas y rollback.
11. RLS, RPC, Server Actions, frontend y eventos deberán consumir la misma versión del catálogo.
12. La publicación no habilita automáticamente ninguna pantalla ni operación.

---

##### 33. Brechas que permanecen diferidas

Esta tarea no crea permisos para:

- lectura o actualización general de pedidos PULSO;
- mesas, comandas, preparación o entrega comercial ordinaria;
- fidelización PULSO/PASS;
- diferencias y aprobación de caja;
- máquinas de estado productivas FOGO;
- pruebas de entrega, incidentes, devoluciones logísticas o reasignaciones NEXO;
- correcciones o reversión de recepción ORIGO;
- administración de proveedores;
- administración de matrices de roles;
- publicación del catálogo;
- administración de dispositivos;
- eventos técnicos entre servicios.

Todas continúan en denegación por defecto.

---

#### 34. Invariantes

1. Se crean exactamente 29 claves candidatas.
2. Cada clave expresa una sola acción empresarial.
3. Ninguna clave utiliza `manage`, `main` o wildcard.
4. Ninguna clave contiene alcance, propiedad, estado o nombre de rol.
5. `pulso.pos.main` no tiene alias y permanece bloqueado.
6. `viso.staff.permissions.manage` no tiene alias y no concede su familia de reemplazo.
7. `nexo.inventory.remissions.dispatch` no se convierte automáticamente en dos permisos.
8. Cobrar, revertir y reembolsar son acciones diferentes.
9. Anular, devolver y reembolsar son acciones diferentes.
10. Abrir y cerrar caja son acciones diferentes.
11. Capturar, aprobar, resolver y ajustar una diferencia son acciones diferentes.
12. Aceptar custodia, iniciar tránsito, entregar y recibir son acciones diferentes.
13. Registrar recepción comercial ORIGO no equivale a registrar entrada física NEXO.
14. Crear una propuesta VISO no la activa.
15. Aprobar exige segregación de funciones.
16. Revocar una denegación no concede acceso.
17. Las concesiones positivas pueden suspenderse; las denegaciones no se suspenden.
18. No se actualizan matrices en esta tarea.
19. No se actualizan paquetes de dispositivos en esta tarea.
20. No se publica una versión en esta tarea.
21. No se crean datasets en esta tarea.
22. No se realizan cambios físicos.

---

#### 35. Riesgos controlados

##### Riesgo 1 — Convertir `pos.main` en nueve permisos para todos sus usuarios

Control:

```text
NO HAY MIGRACIÓN AUTOMÁTICA DE ASIGNACIONES
```

##### Riesgo 2 — Confundir reversión con reembolso

Control:

- recursos y estados diferentes;
- claves diferentes;
- contratos y auditoría diferentes.

##### Riesgo 3 — Permitir que el conductor reciba por el destino

Control:

- `deliver` registra handoff;
- `receive` permanece como aceptación del destino.

##### Riesgo 4 — Autorizar autoaprobación en VISO

Control:

- `create` y `approve` son claves separadas;
- sujeto, solicitante y aprobador quedan trazados;
- el afectado no aprueba su propio registro.

##### Riesgo 5 — Publicar una versión menor incompatible

Control:

- AUTH-CAT-024 deberá verificar si `dispatch` llegó a publicarse;
- si fue publicado, su retiro exige versión mayor.

##### Riesgo 6 — Crear permisos antes de diseñar procesos pendientes

Control:

- el alcance continúa limitado a las once brechas maduras;
- todos los diferidos permanecen fuera.

---

#### 36. Criterios de aprobación

AUTH-CAT-022 podrá aprobarse cuando se acepte que:

- se crean 29 claves candidatas;
- PULSO recibe nueve claves para ventas, pagos y caja;
- NEXO recibe cinco claves para diferencias, custodia, tránsito y entrega;
- ORIGO recibe una clave para registrar recepción comercial;
- VISO recibe catorce claves para gobernar concesiones y denegaciones;
- `pulso.pos.main` continúa bloqueado y sin alias;
- `viso.staff.permissions.manage` se sustituye mediante una familia atómica sin copiar concesiones;
- `nexo.inventory.remissions.dispatch` debe dividirse sin alias uno-a-muchos;
- el conjunto activo objetivo sería de 140 permisos;
- el número de versión se reserva para AUTH-CAT-024;
- las clasificaciones de modalidad, lectura, configuración, sensibilidad, contexto, área, dispositivo, simulación y recurso quedan explícitas;
- AUTH-CAT-023 deberá actualizar únicamente las matrices, concesiones individuales, denegaciones y paquetes de dispositivo afectados por el diff contractual;
- ninguna clave nueva se asigna automáticamente;
- no se implementan cambios físicos.

---

#### 37. Estado final de la propuesta

| Tarea        | Estado      |
| ------------ | ----------- |
| AUTH-CAT-021 | APROBADA    |
| AUTH-CAT-022 | APROBADA    |
| AUTH-CAT-023 | NO INICIADA |

No se avanza a AUTH-CAT-023 hasta recibir aprobación explícita.


### [ ] AUTH-CAT-023 — Actualizar matrices, excepciones, denegaciones y paquetes de dispositivo afectados por el diff contractual

### [ ] AUTH-CAT-024 — Validar, publicar y congelar la versión canónica que alimentará los datasets
