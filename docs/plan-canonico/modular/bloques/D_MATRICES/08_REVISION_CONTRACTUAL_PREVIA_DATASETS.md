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
| `GAP-PULSO-011` | `READY_FOR_CATALOG_DESIGN` | Cobrar y revertir un pago son acciones diferenciables sobre pagos; AUTH-CAT-022 deberá separarlas y no crear un permiso compuesto.            | AUTH-CAT-022                                    |
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

AUTH-CAT-022 podrá diseñar una capacidad de registro de recepción, pero no decidirá todavía si total, parcial y corrección requieren claves adicionales. Esas diferencias permanecen bajo ORIGO-AUTH-007 y ORIGO-AUTH-008.

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

| Tarea        | Estado   |
| ------------ | -------- |
| AUTH-CAT-021 | APROBADA |
| AUTH-CAT-022 | APROBADA |
| AUTH-CAT-023 | APROBADA |
| AUTH-CAT-024 | APROBADA |

No se avanza a AUTH-CAT-023 hasta recibir aprobación explícita.


### ✅ AUTH-CAT-023 — Actualizar matrices, excepciones, denegaciones y paquetes de dispositivo afectados por el diff contractual

**Estado:** APROBADA  
**Bloque:** BLOQUE D — Revisión contractual previa a datasets  
**Naturaleza:** Revisión diferencial de matrices, capas individuales, denegaciones y filtros de dispositivo  
**Implementación física:** No incluida  
**Catálogo vigente de referencia:** 112 permisos canónicos activos  
**Diff contractual recibido:** 29 claves candidatas nuevas y 1 clave activa candidata a sustitución  
**Conjunto activo objetivo:** 140 permisos, sujeto a validación y congelación en AUTH-CAT-024  
**Tarea anterior vigente:** AUTH-CAT-022 — APROBADA  
**Tarea posterior reservada:** AUTH-CAT-024 — Validar, publicar y congelar la versión canónica que alimentará los datasets

Esta tarea no publica una versión del catálogo, no crea datasets físicos, no inserta asignaciones, no modifica Supabase, no altera RLS, RPC, aplicaciones, dispositivos desplegados ni migraciones.

Su resultado es exclusivamente el **diff documental objetivo** que AUTH-CAT-024 deberá validar antes de congelar la versión canónica consumida posteriormente por AUTH-RBAC-024, AUTH-RBAC-025 y AUTH-RBAC-026.

---

#### 1. Objetivo

Revisar explícitamente las 29 claves candidatas aprobadas en AUTH-CAT-022 contra:

- matrices de roles base;
- matrices de roles operativos;
- concesiones individuales base;
- concesiones individuales operativas;
- denegaciones de carril y bloqueos transversales;
- paquetes de capacidades de dispositivos compartidos;
- asignaciones relacionadas con permisos legacy sustituidos.

La tarea deberá determinar, para cada clave:

1. qué rol recibe una concesión por matriz;
2. en qué carril se incorpora;
3. qué roles permanecen sin concesión y, por tanto, bajo denegación por defecto;
4. qué excepciones individuales podrían otorgarla sin alterar matrices;
5. cómo deberán revisarse denegaciones legacy relacionadas;
6. desde qué paquetes de dispositivo podrá intentarse la acción;
7. qué clave legacy deberá permanecer bloqueada, sustituirse o retirarse posteriormente.

---

#### 2. Decisión principal

El diff contractual no se aplicará copiando permisos legacy ni ampliando roles por semejanza funcional.

```text
CLAVE NUEVA
        ↓
EVALUACIÓN POR PERMISO, ROL Y CARRIL
        ↓
CONCESIÓN DE MATRIZ EXPLÍCITA
O
EXCEPCIÓN INDIVIDUAL EXPLÍCITA
O
DENEGACIÓN POR DEFECTO
        ↓
FILTRO RESTRICTIVO DE DISPOSITIVO
        ↓
VALIDACIÓN Y CONGELACIÓN EN AUTH-CAT-024
```

Reglas definitivas de esta propuesta:

```text
PERMISO LEGACY AMPLIO
≠
TODAS SUS CLAVES RESULTANTES
```

```text
PAQUETE DE DISPOSITIVO
≠
CONCESIÓN DE PERMISO
```

```text
AUSENCIA DE CONCESIÓN
→ DEFAULT_DENY
```

```text
BASE_AND_OPERATIONAL
→ MISMO ACTOR
→ CARRIL BASE COMPLETO
+
CARRIL OPERATIVO COMPLETO
```

```text
DENY APLICABLE
>
ALLOW
```

Ninguna de las 29 claves se asigna por prefijo, herencia, alias uno-a-muchos, nombre de rol, aplicación abierta, dispositivo utilizado o existencia previa de un permiso legacy relacionado.

---

#### 3. Base normativa conservada

Esta propuesta conserva sin cambios:

- ADR-AUTH-001;
- AUTH-MOD-001 a AUTH-MOD-020;
- AUTH-CAT-001 a AUTH-CAT-022;
- AUTH-RBAC-001 a AUTH-RBAC-023;
- las cuatro modalidades de autorización;
- la separación entre rol base y rol operativo;
- la precedencia de denegaciones;
- el alcance territorial y contractual por recurso;
- los requisitos de turno, check-in y área;
- la atribución obligatoria a un actor humano;
- la reautenticación fuerte para acciones sensibles;
- la segregación entre solicitante, aprobador y actor afectado;
- la prohibición de usar dispositivos como fuente de autoridad;
- la prohibición de reutilizar claves retiradas con otro significado;
- la denegación por defecto para permisos nuevos o no asignados.

Las decisiones de esta tarea son diferenciales. No reescriben las matrices completas de 112 permisos ni cambian concesiones ajenas al diff de AUTH-CAT-022.

---

#### 4. Alcance autorizado

Esta tarea sí define:

- adiciones propuestas a matrices base;
- adiciones propuestas a matrices operativas;
- retiro documental de la concesión operativa de `nexo.inventory.remissions.dispatch`;
- compatibilidad de las claves nuevas con concesiones individuales;
- revisión dirigida de denegaciones legacy;
- actualización objetivo de siete paquetes de dispositivo;
- condiciones de segregación y recurso aplicables al diff;
- conteos de integridad del diff documental.

Esta tarea no define:

- filas físicas de `role_permissions` u otras tablas;
- dataset definitivo de matrices;
- migraciones o backfills;
- aliases físicos;
- fecha de retiro de claves legacy;
- versión semántica definitiva;
- hash contractual;
- guards, Server Actions, RPC o políticas RLS;
- interfaces finales de PULSO, NEXO, ORIGO o VISO;
- procesos diferidos a roadmaps funcionales;
- nuevos roles base u operativos;
- nuevas plantillas físicas de dispositivo.

---

#### 5. Resultado ejecutivo del diff

##### 5.1 Claves revisadas

| Aplicación | Claves nuevas revisadas |
| ---------- | ----------------------: |
| PULSO      |                       9 |
| NEXO       |                       5 |
| ORIGO      |                       1 |
| VISO       |                      14 |
| **Total**  |                  **29** |

##### 5.2 Decisiones diferenciales propuestas

| Capa                                                          | Resultado propuesto |
| ------------------------------------------------------------- | ------------------: |
| Componentes de concesión añadidos a matrices base             |                  50 |
| Componentes de concesión añadidos a matrices operativas       |                  29 |
| Concesiones legacy retiradas de una matriz operativa objetivo |                   1 |
| Concesiones individuales creadas automáticamente              |                   0 |
| Denegaciones individuales creadas automáticamente             |                   0 |
| Paquetes de dispositivo revisados                             |                   7 |
| Expansiones automáticas desde permisos legacy                 |                   0 |

Los conteos anteriores representan **decisiones documentales por rol, carril y clave**. No representan filas físicas ni autorizaciones desplegadas.

---

#### PULSO — VENTAS, PAGOS Y CAJA

#### 6. Claves PULSO incluidas en el diff

```text
pulso.sales.orders.create
pulso.payments.transactions.collect
pulso.payments.transactions.reverse
pulso.cash.sessions.start
pulso.cash.sessions.close
pulso.sales.orders.cancel
pulso.sales.returns.create
pulso.payments.transactions.refund
pulso.sales.discounts.apply
```

Se conservan las separaciones aprobadas:

```text
collect
≠ reverse
≠ refund
```

```text
cancel order
≠ create return
≠ refund payment
```

```text
start cash session
≠ collect payment
≠ close cash session
≠ approve cash difference
```

La aprobación o resolución de diferencias de caja continúa fuera de este diff porque AUTH-CAT-022 no creó una clave madura para esa autoridad.

---

#### 7. Diff de matrices PULSO

##### 7.1 Decisión por clave y carril

| PermissionKey                         | Concesión por matriz base                   | Concesión por matriz operativa                                        | Roles revisados sin concesión por defecto                           |
| ------------------------------------- | ------------------------------------------- | --------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `pulso.sales.orders.create`           | Ninguna; es `OPERATIONAL_ONLY`              | `cajero_satelite`, `operador_integral_satelite`                       | `gerencia_operativa`, demás roles operativos y todos los roles base |
| `pulso.payments.transactions.collect` | Ninguna; es `OPERATIONAL_ONLY`              | `cajero_satelite`, `operador_integral_satelite`                       | `gerencia_operativa`, demás roles operativos y todos los roles base |
| `pulso.cash.sessions.start`           | Ninguna; es `OPERATIONAL_ONLY`              | `cajero_satelite`, `operador_integral_satelite`                       | `gerencia_operativa`, demás roles operativos y todos los roles base |
| `pulso.cash.sessions.close`           | Ninguna; es `OPERATIONAL_ONLY`              | `cajero_satelite`, `operador_integral_satelite`                       | `gerencia_operativa`, demás roles operativos y todos los roles base |
| `pulso.payments.transactions.reverse` | `propietario`, `gerente_general`, `gerente` | `cajero_satelite`, `operador_integral_satelite`, `gerencia_operativa` | `supervisor` y demás roles base u operativos no listados            |
| `pulso.sales.orders.cancel`           | `propietario`, `gerente_general`, `gerente` | `cajero_satelite`, `operador_integral_satelite`, `gerencia_operativa` | `supervisor` y demás roles base u operativos no listados            |
| `pulso.sales.returns.create`          | `propietario`, `gerente_general`, `gerente` | `cajero_satelite`, `operador_integral_satelite`, `gerencia_operativa` | `supervisor` y demás roles base u operativos no listados            |
| `pulso.payments.transactions.refund`  | `propietario`, `gerente_general`, `gerente` | `cajero_satelite`, `operador_integral_satelite`, `gerencia_operativa` | `supervisor` y demás roles base u operativos no listados            |
| `pulso.sales.discounts.apply`         | `propietario`, `gerente_general`, `gerente` | `cajero_satelite`, `operador_integral_satelite`, `gerencia_operativa` | `supervisor` y demás roles base u operativos no listados            |

##### 7.2 Interpretación de las acciones ordinarias

Las cuatro claves `OPERATIONAL_ONLY` se incorporan únicamente a las funciones que operan caja de forma ordinaria:

```text
cajero_satelite
operador_integral_satelite
```

`gerencia_operativa` no recibe por matriz:

```text
orders.create
transactions.collect
cash.sessions.start
cash.sessions.close
```

La coordinación operativa no sustituye el rol especialista de caja. Cuando una persona de gerencia deba cubrir materialmente la caja deberá:

- asumir un rol operativo compatible; o
- recibir una concesión individual operativa válida para la clave exacta.

##### 7.3 Interpretación de las acciones sensibles

Las cinco claves sensibles son `BASE_AND_OPERATIONAL`.

El componente base se concede a:

```text
propietario
OR
gerente_general
OR
gerente dentro de su territorio asignado
```

El componente operativo se concede a:

```text
cajero_satelite
OR
operador_integral_satelite
OR
gerencia_operativa
```

La autorización final exige ambos componentes para el mismo actor, el mismo recurso y la misma solicitud.

Ejemplo válido:

```text
ROL BASE gerente
+
ROL OPERATIVO cajero_satelite
+
TURNO Y CHECK-IN VÁLIDOS
+
SEDE Y ÁREA DE CAJA COMPATIBLES
+
AMBOS COMPONENTES DE pulso.payments.transactions.refund
+
REAUTENTICACIÓN FUERTE
+
RECURSO REEMBOLSABLE
=
DECISIÓN POSIBLE
```

Ejemplos inválidos:

```text
GERENTE SIN TURNO
→ NO PUEDE REEMBOLSAR
```

```text
CAJERO SIN COMPONENTE BASE
→ NO PUEDE REEMBOLSAR
```

```text
SUPERVISOR + CAJERO
→ NO PUEDE REEMBOLSAR POR MATRIZ
```

`supervisor` permanece sin componentes base de doble condición. Una necesidad excepcional deberá resolverse mediante concesión individual base explícita, no ampliando su matriz completa.

##### 7.4 Alcances y condiciones

- `propietario` y `gerente_general` conservan alcance organizacional ordinario, sin incluir APP-REVIEW, demo o entornos aislados por inferencia.
- `gerente` se limita a sedes y recursos dentro de su cobertura administrativa activa.
- `cajero_satelite` exige turno, check-in y área de caja compatibles.
- `operador_integral_satelite` exige sede habilitada como formato integrado y capacidad de caja activada para el área o punto.
- `gerencia_operativa` se limita a sede, jornada y recurso activos.
- Las cinco acciones sensibles exigen reautenticación fuerte, motivo, evidencia, versionado del recurso y auditoría.
- Una sesión de caja pertenece a un actor y punto concretos; el dispositivo no permite reutilizar la sesión de otro actor.
- Cerrar caja no aprueba automáticamente diferencias.
- Cancelar una venta no revierte pagos, inventario o producción por implicación.
- Crear una devolución no ejecuta automáticamente un reembolso.

---

#### NEXO — DIFERENCIAS, CUSTODIA Y TRÁNSITO

#### 8. Claves NEXO incluidas en el diff

```text
nexo.inventory.stock_count_variances.approve
nexo.inventory.stock_count_variances.resolve
nexo.inventory.remissions.accept_custody
nexo.inventory.remissions.start_transit
nexo.inventory.remissions.deliver
```

Se conserva la separación contractual:

```text
stock_counts.perform
→ captura

stock_count_variances.approve
→ decisión de aprobación

stock_count_variances.resolve
→ registro de resolución

inventory.adjustments.register
→ ejecución posterior del ajuste autorizado
```

Y la secuencia logística:

```text
remissions.prepare
→ accept_custody
→ start_transit
→ deliver
→ receive
```

`deliver` registra el handoff del transportador. No autoriza `receive` ni crea inventario en el destino.

---

#### 9. Diff de matrices NEXO

| PermissionKey                                  | Concesión por matriz base                   | Concesión por matriz operativa | Roles revisados sin concesión por defecto                               |
| ---------------------------------------------- | ------------------------------------------- | ------------------------------ | ----------------------------------------------------------------------- |
| `nexo.inventory.stock_count_variances.approve` | `propietario`, `gerente_general`, `gerente` | `gerencia_operativa`           | `supervisor`, `bodeguero` y demás roles no listados                     |
| `nexo.inventory.stock_count_variances.resolve` | `propietario`, `gerente_general`, `gerente` | `gerencia_operativa`           | `supervisor`, `bodeguero` y demás roles no listados                     |
| `nexo.inventory.remissions.accept_custody`     | Ninguna; es `OPERATIONAL_ONLY`              | `conductor_logistica`          | `bodeguero`, receptores, `gerencia_operativa` y demás roles no listados |
| `nexo.inventory.remissions.start_transit`      | Ninguna; es `OPERATIONAL_ONLY`              | `conductor_logistica`          | `bodeguero`, receptores, `gerencia_operativa` y demás roles no listados |
| `nexo.inventory.remissions.deliver`            | Ninguna; es `OPERATIONAL_ONLY`              | `conductor_logistica`          | `bodeguero`, receptores, `gerencia_operativa` y demás roles no listados |

##### 9.1 Diferencias de conteo

Las claves `approve` y `resolve` son `BASE_AND_OPERATIONAL`.

El componente base representa autoridad administrativa sobre inventario dentro del territorio permitido.

El componente operativo de `gerencia_operativa` confirma participación real en la sede, área y jornada donde existe la diferencia.

`bodeguero` no recibe ninguna de las dos claves por matriz porque su función ordinaria comprende:

- capturar el conteo;
- aportar evidencia;
- custodiar el inventario;
- ejecutar movimientos autorizados mediante permisos separados.

No comprende aprobar o resolver unilateralmente la diferencia que él mismo capturó.

Regla mínima de segregación:

```text
ACTOR QUE CAPTURA
≠
ACTOR QUE APRUEBA O RESUELVE
```

Una política de proceso podrá exigir además que aprobación, resolución y ajuste correspondan a actores distintos. Esa decisión no se relaja mediante esta matriz.

##### 9.2 Custodia y tránsito

`conductor_logistica` recibe tres concesiones operativas exactas:

```text
accept_custody
start_transit
deliver
```

Condiciones:

- remisión preparada y asignada al actor o segmento logístico;
- bultos, LPN o cantidades declaradas disponibles;
- turno y check-in válidos;
- ruta y vehículo válidos cuando correspondan;
- transición idempotente;
- ubicación y hora auditables;
- el actor no puede modificar cantidades declaradas mediante estas claves;
- discrepancias no se convierten en ajustes silenciosos.

`bodeguero` conserva `remissions.prepare` y los receptores conservan `remissions.receive` según sus matrices vigentes. Ninguna de esas capacidades se fusiona con las tres claves nuevas.

`gerencia_operativa` no recibe custodia o tránsito por matriz. Una sustitución de emergencia deberá utilizar una concesión individual operativa exacta, con asignación logística, vigencia, ruta, vehículo y motivo documentados.

---

#### ORIGO — RECEPCIÓN COMERCIAL

#### 10. Clave ORIGO incluida en el diff

```text
origo.procurement.receipts.register
```

La clave es `BASE_OR_OPERATIONAL`.

Puede satisfacerse mediante un carril base completo o mediante un carril operativo completo. Los carriles no se mezclan entre sí para producir una autorización parcial.

---

#### 11. Diff de matrices ORIGO

| PermissionKey                         | Concesión por matriz base                   | Concesión por matriz operativa | Roles revisados sin concesión por defecto                                               |
| ------------------------------------- | ------------------------------------------- | ------------------------------ | --------------------------------------------------------------------------------------- |
| `origo.procurement.receipts.register` | `propietario`, `gerente_general`, `gerente` | `bodeguero`                    | `supervisor`, `auxiliar_administrativa`, `gerencia_operativa` y demás roles no listados |

##### 11.1 Carril base

- `propietario` y `gerente_general` podrán registrar la recepción comercial dentro de la organización ordinaria autorizada.
- `gerente` podrá hacerlo exclusivamente para órdenes, proveedores, documentos y sedes dentro de su cobertura administrativa.
- `supervisor` no recibe esta mutación sensible por matriz.
- `auxiliar_administrativa` no la recibe por matriz general. Cuando una persona tenga responsabilidad formal de recepción o abastecimiento deberá utilizarse una concesión individual base exacta y territorial.

##### 11.2 Carril operativo

`bodeguero` podrá registrar una recepción comercial cuando:

- tenga turno y check-in válidos;
- opere en la sede receptora;
- la orden y el proveedor sean válidos;
- las líneas y cantidades sean recibibles;
- exista actor humano identificado;
- el registro sea atómico e idempotente;
- se conserve documento, condición, evidencia y auditoría.

La concesión no autoriza:

- crear o aprobar órdenes de compra;
- modificar proveedores;
- corregir o revertir recepciones;
- registrar directamente stock;
- omitir la entrada física propietaria de NEXO.

Separación obligatoria:

```text
ORIGO
→ recepción comercial

NEXO
→ entrada física y custodia de inventario
```

Una recepción comercial confirmada podrá originar posteriormente un evento de integración idempotente. La identidad técnica del adaptador no recibe esta concesión humana.

---

#### 12. Claves VISO incluidas en el diff

##### 12.1 Concesiones individuales base

```text
viso.authorization.base_grants.view
viso.authorization.base_grants.create
viso.authorization.base_grants.approve
viso.authorization.base_grants.suspend
viso.authorization.base_grants.revoke
```

##### 12.2 Concesiones individuales operativas

```text
viso.authorization.operational_grants.view
viso.authorization.operational_grants.create
viso.authorization.operational_grants.approve
viso.authorization.operational_grants.suspend
viso.authorization.operational_grants.revoke
```

##### 12.3 Denegaciones

```text
viso.authorization.denials.view
viso.authorization.denials.create
viso.authorization.denials.approve
viso.authorization.denials.revoke
```

Las 14 claves son `BASE_ONLY`, sensibles bajo `AUTHORIZATION_SECURITY`, no dependen de turno ni check-in y exigen reautenticación fuerte.

---

#### 13. Diff de matrices VISO

| PermissionKey                                   | `propietario` | `gerente_general` | `gerente`   | `supervisor` | Otros roles base       |
| ----------------------------------------------- | ------------- | ----------------- | ----------- | ------------ | ---------------------- |
| `viso.authorization.base_grants.view`           | Conceder      | Conceder          | No conceder | No conceder  | No conceder por matriz |
| `viso.authorization.base_grants.create`         | Conceder      | Conceder          | No conceder | No conceder  | No conceder por matriz |
| `viso.authorization.base_grants.approve`        | Conceder      | Conceder          | No conceder | No conceder  | No conceder por matriz |
| `viso.authorization.base_grants.suspend`        | Conceder      | Conceder          | No conceder | No conceder  | No conceder por matriz |
| `viso.authorization.base_grants.revoke`         | Conceder      | Conceder          | No conceder | No conceder  | No conceder por matriz |
| `viso.authorization.operational_grants.view`    | Conceder      | Conceder          | No conceder | No conceder  | No conceder por matriz |
| `viso.authorization.operational_grants.create`  | Conceder      | Conceder          | No conceder | No conceder  | No conceder por matriz |
| `viso.authorization.operational_grants.approve` | Conceder      | Conceder          | No conceder | No conceder  | No conceder por matriz |
| `viso.authorization.operational_grants.suspend` | Conceder      | Conceder          | No conceder | No conceder  | No conceder por matriz |
| `viso.authorization.operational_grants.revoke`  | Conceder      | Conceder          | No conceder | No conceder  | No conceder por matriz |
| `viso.authorization.denials.view`               | Conceder      | Conceder          | No conceder | No conceder  | No conceder por matriz |
| `viso.authorization.denials.create`             | Conceder      | Conceder          | No conceder | No conceder  | No conceder por matriz |
| `viso.authorization.denials.approve`            | Conceder      | No conceder       | No conceder | No conceder  | No conceder por matriz |
| `viso.authorization.denials.revoke`             | Conceder      | No conceder       | No conceder | No conceder  | No conceder por matriz |

##### 13.1 Propietario

`propietario` recibe las 14 claves como responsabilidad de gobierno global explícito, no como bypass por nombre de rol.

La existencia simultánea de `create` y `approve` en su matriz no permite autoaprobación sobre el mismo registro.

##### 13.2 Gerente general

`gerente_general` recibe:

- el ciclo completo de consulta, creación, aprobación, suspensión y revocación de concesiones individuales base;
- el ciclo completo de consulta, creación, aprobación, suspensión y revocación de concesiones individuales operativas;
- consulta y creación de propuestas de denegación.

No recibe por matriz:

```text
viso.authorization.denials.approve
viso.authorization.denials.revoke
```

Estas dos acciones pueden bloquear o restaurar autoridad a través de carriles completos y se reservan a propietario o a una autoridad de seguridad designada mediante concesión individual base.

##### 13.3 Gerente, supervisor y otros roles

`gerente`, `supervisor`, `auxiliar_administrativa`, `contador`, `marketing` y los oficios base legacy permanecen sin concesiones VISO de gobierno de autorización por matriz.

Una responsabilidad delegada deberá representarse mediante una concesión individual base exacta, con:

- alcance territorial explícito;
- vigencia;
- motivo;
- solicitante y aprobador distintos cuando corresponda;
- reautenticación fuerte;
- auditoría;
- prohibición de autoafectación.

##### 13.4 Segregación obligatoria

```text
CREADOR DE PROPUESTA
≠
APROBADOR DEL MISMO REGISTRO
```

```text
ACTOR AFECTADO
≠
APROBADOR DE SU PROPIA CONCESIÓN O DENEGACIÓN
```

```text
REVOKE DENIAL
≠
GRANT PERMISSION
```

Revocar una denegación solo elimina ese bloqueo. La autorización resultante seguirá requiriendo una concesión válida por matriz o excepción.

Las denegaciones no utilizan `suspend`. Terminan por expiración o revocación auditable.

---

####
 CONCESIONES INDIVIDUALES

#### 14. Actualización de concesiones individuales base

Las 29 claves nuevas no crean concesiones individuales automáticamente.

Podrán ser objetivo de una concesión individual base únicamente cuando su modalidad admita el carril base:

| Familia          | Claves elegibles para concesión individual base                  | Condición                                                                                                        |
| ---------------- | ---------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| PULSO sensible   | Las cinco claves `BASE_AND_OPERATIONAL`                          | La concesión aporta solo el componente base; no sustituye turno, rol operativo, check-in ni componente operativo |
| NEXO diferencias | `stock_count_variances.approve`, `stock_count_variances.resolve` | Aporta solo el componente base y no puede concederse al capturador para su propia diferencia                     |
| ORIGO recepción  | `origo.procurement.receipts.register`                            | Puede autorizar por carril base completo dentro del territorio concedido                                         |
| VISO gobierno    | Las 14 claves `BASE_ONLY`                                        | Exige gobierno reforzado, alcance, reautenticación y segregación                                                 |
| PULSO ordinario  | Ninguna de las cuatro claves `OPERATIONAL_ONLY`                  | Prohibidas en concesiones base                                                                                   |
| NEXO custodia    | Ninguna de las tres claves `OPERATIONAL_ONLY`                    | Prohibidas en concesiones base                                                                                   |

Reglas:

1. Una concesión individual base no cambia la modalidad del permiso.
2. Una concesión de una clave `BASE_AND_OPERATIONAL` no crea el componente operativo.
3. Una concesión VISO no podrá aprobarse por el actor afectado.
4. Una concesión global sensible exige justificación reforzada y no incorpora APP-REVIEW por inferencia.
5. Los registros legacy actuales no se consideran concesiones canónicas nuevas.
6. Las concesiones redundantes con una matriz vigente deberán rechazarse o justificarse como alcance más específico sin pretender restringir el allow de matriz.

---

#### 15. Actualización de concesiones individuales operativas

Podrán ser objetivo de una concesión individual operativa las claves cuya modalidad admita el carril operativo:

| Familia          | Claves elegibles                                                                      | Roles o funciones compatibles mínimas                                                              |
| ---------------- | ------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------- |
| PULSO ordinario  | `orders.create`, `transactions.collect`, `cash.sessions.start`, `cash.sessions.close` | `cajero_satelite`, `operador_integral_satelite` o cobertura temporal de caja expresamente aprobada |
| PULSO sensible   | Las cinco claves `BASE_AND_OPERATIONAL`                                               | caja, operador integral o `gerencia_operativa`; la excepción aporta solo el componente operativo   |
| NEXO diferencias | `stock_count_variances.approve`, `stock_count_variances.resolve`                      | `gerencia_operativa` o futura función de control de inventario expresamente aprobada               |
| NEXO logística   | `accept_custody`, `start_transit`, `deliver`                                          | `conductor_logistica` o sustituto logístico asignado de forma explícita                            |
| ORIGO recepción  | `origo.procurement.receipts.register`                                                 | `bodeguero` o futura función operativa de recepción aprobada                                       |
| VISO gobierno    | Ninguna                                                                               | Las 14 claves son `BASE_ONLY`                                                                      |

Toda concesión individual operativa exige:

- permiso exacto;
- actor concreto;
- rol o familia operativa compatible;
- turno vigente;
- check-in cuando corresponda;
- sede y área compatibles;
- recurso dentro del alcance;
- vigencia limitada;
- motivo y solicitante;
- aprobación;
- auditoría.

Para sustituciones logísticas de emergencia deberán registrarse además:

- remisión o ruta;
- vehículo cuando aplique;
- segmento de custodia;
- inicio y fin de vigencia;
- motivo de sustitución.

---

#### 16. Prohibición de migración automática de excepciones legacy

No se admite:

```text
CONCESIÓN DE pulso.pos.main
→ CONCEDER 9 CLAVES PULSO
```

```text
CONCESIÓN DE viso.staff.permissions.manage
→ CONCEDER 14 CLAVES VISO
```

```text
CONCESIÓN DE remissions.dispatch
→ CONCEDER accept_custody + start_transit
```

Cada concesión legacy deberá clasificarse como:

```text
DISCARD
REPLACE_WITH_EXACT_GRANT
KEEP_LEGACY_TEMPORARILY
REVIEW_REQUIRED
```

La clasificación física y el backfill se realizarán posteriormente en AUTH-RBAC-026 y BLOQUE R, después de congelar el catálogo.

---

#### 17. Tratamiento de las claves nuevas

Las 29 claves comienzan sin denegaciones individuales creadas automáticamente.

La ausencia de concesión ya produce:

```text
DEFAULT_DENY
```

No se crearán filas `deny` redundantes para todos los roles no asignados.

Una denegación nueva deberá mantener el contrato aprobado:

```text
PERMISO EXACTO
∩
SUJETO
∩
CARRIL O BLOQUEO TRANSVERSAL
∩
ALCANCE
∩
VIGENCIA
∩
RECURSO
```

No existen denegaciones por prefijo, aplicación, familia implícita o wildcard.

---

#### 18. Revisión de denegaciones relacionadas con permisos legacy

| Clave legacy relacionada             | Tratamiento                 | Claves que deberán revisarse individualmente si existe una denegación legacy con intención vigente   |
| ------------------------------------ | --------------------------- | ---------------------------------------------------------------------------------------------------- |
| `pulso.pos.main`                     | No expandir automáticamente | Las nueve claves PULSO, una por una                                                                  |
| `nexo.inventory.remissions.dispatch` | No expandir automáticamente | `accept_custody`, `start_transit` y, cuando la intención sea impedir transporte o entrega, `deliver` |
| `viso.staff.permissions.manage`      | No expandir automáticamente | Las 14 claves VISO, una por una                                                                      |

Reglas:

1. Una denegación sobre una clave legacy no se convierte en una denegación por prefijo.
2. Una denegación legacy puede reflejar una intención más amplia o más estrecha que la clave original; exige revisión humana.
3. Mientras no se cree un allow nuevo, la clave permanece denegada por defecto aunque la denegación legacy no se migre.
4. Si se propone una nueva concesión, la revisión deberá comprobar primero si existe una intención de bloqueo vigente relacionada.
5. Una denegación aplicable prevalece sobre matrices y concesiones individuales.
6. `LANE_DENY` afecta solo el carril declarado; `ACTOR_WIDE_DENY` bloquea ambos carriles para la clave exacta.
7. Ningún flujo de VISO podrá aprobar una denegación que elimine a todos los actores ordinarios capaces de revocarla sin preservar un mecanismo de recuperación gobernado.

---

#### 19. Denegaciones sobre claves `BASE_AND_OPERATIONAL`

Para una clave `BASE_AND_OPERATIONAL`:

```text
BASE_LANE_DENY
→ impide completar el carril base
→ DENEGAR
```

```text
OPERATIONAL_LANE_DENY
→ impide completar el carril operativo
→ DENEGAR
```

```text
ACTOR_WIDE_DENY
→ bloquea ambos carriles
→ DENEGAR
```

Una concesión individual en el otro carril no vence la denegación.

---

#### 20. Principio de actualización

Los paquetes se actualizan como allowlists técnicas restrictivas.

```text
PERMISO DEL ACTOR
+
CONTEXTO VÁLIDO
+
RECURSO VÁLIDO
+
CLAVE PERMITIDA POR EL PAQUETE
=
ACCIÓN POSIBLE
```

La inclusión en el paquete nunca crea permiso, rol, turno, check-in, área, componente base, componente operativo ni reautenticación.

Los paquetes conservarán versión independiente y no se desplegarán hasta que AUTH-CAT-024 congele la versión del catálogo y las tareas posteriores generen los datasets correspondientes.

---

#### 21. Diff de paquetes

##### 21.1 `pos_satellite`

Agregar al filtro permitido:

```text
pulso.sales.orders.create
pulso.payments.transactions.collect
pulso.cash.sessions.start
pulso.cash.sessions.close
pulso.payments.transactions.reverse
pulso.sales.orders.cancel
pulso.sales.returns.create
pulso.payments.transactions.refund
pulso.sales.discounts.apply
```

Condiciones:

- las cuatro acciones ordinarias requieren actor `cajero_satelite` o excepción compatible;
- las cinco acciones sensibles solo se habilitan cuando el mismo actor completa ambos carriles;
- reautenticación fuerte no puede heredarse del actor anterior;
- la sesión de caja no puede sobrevivir al cambio de actor;
- el PIN ligero del dispositivo no satisface reautenticación fuerte.

##### 21.2 `integrated_satellite`

Agregar las mismas nueve claves PULSO.

Condiciones adicionales:

- la sede debe estar configurada como formato integrado;
- el punto o área debe admitir operación de caja;
- `operador_integral_satelite` no se convierte en superusuario;
- ninguna capacidad de inventario, logística central o VISO se incorpora por la naturaleza integrada del dispositivo.

##### 21.3 `operations_management_terminal`

Agregar:

```text
pulso.payments.transactions.reverse
pulso.sales.orders.cancel
pulso.sales.returns.create
pulso.payments.transactions.refund
pulso.sales.discounts.apply
nexo.inventory.stock_count_variances.approve
nexo.inventory.stock_count_variances.resolve
```

Condiciones:

- el paquete solo permite presentar o intentar la acción;
- PULSO y NEXO continúan exigiendo ambos carriles;
- la terminal no presta el componente base a un actor operativo;
- la terminal no presta el componente operativo a un actor administrativo;
- toda acción exige reautenticación fuerte y recurso exacto.

##### 21.4 `warehouse_kiosk`

No agregar ninguna de las 29 claves por defecto.

En particular, mantener excluidas:

```text
nexo.inventory.stock_count_variances.approve
nexo.inventory.stock_count_variances.resolve
nexo.inventory.remissions.accept_custody
nexo.inventory.remissions.start_transit
nexo.inventory.remissions.deliver
```

`origo.procurement.receipts.register` solo podrá aparecer cuando el mismo dispositivo entre en un modo o paquete `procurement_reception` expresamente habilitado. El modo ordinario de bodega no adquiere autoridad comercial por coexistir en el mismo hardware.

##### 21.5 `logistics_vehicle_terminal`

Retirar del paquete objetivo:

```text
nexo.inventory.remissions.dispatch
```

Agregar:

```text
nexo.inventory.remissions.accept_custody
nexo.inventory.remissions.start_transit
nexo.inventory.remissions.deliver
```

Mantener excluido:

```text
nexo.inventory.remissions.receive
```

El terminal no autoriza al conductor a recibir por el destino, modificar cantidades declaradas o crear inventario.

##### 21.6 `procurement_reception`

Agregar:

```text
origo.procurement.receipts.register
```

Condiciones:

- actor humano identificado;
- carril base u operativo completo;
- sede receptora y orden compatibles;
- sesión estándar de actor;
- documento y evidencia requeridos;
- sin escritura directa de stock;
- sin corrección o reversión por inferencia.

##### 21.7 `management_terminal`

Agregar las 14 claves `viso.authorization.*` definidas en esta tarea.

Condiciones:

- sesión administrativa personal;
- prohibición de sesión anónima o principal técnico como actor;
- reautenticación fuerte por acción sensible;
- cierre de reautenticación al cambiar de actor;
- segregación creador/aprobador;
- alcance administrativo real;
- no permitir estas acciones en simulación ejecutable;
- las claves `denials.approve` y `denials.revoke` permanecen disponibles solo para actor con concesión real de propietario o seguridad designada.

##### 21.8 Paquetes no listados

Los paquetes y plantillas no incluidos en esta sección mantienen las 29 claves bajo denegación por defecto hasta una revisión contractual posterior.

---

#### TRANSICIÓN LEGACY

#### 22. `pulso.pos.main`

Estado objetivo conservado:

```text
catalog_status = deprecated
assignment_status = blocked
resolution = DECOMPOSE_REQUIRED
```

Decisiones:

- no se reactiva;
- no se incorpora a paquetes nuevos;
- no se convierte en alias hacia las nueve claves;
- sus asignaciones no se copian;
- no se retira físicamente todavía porque existen operaciones PULSO inmaduras y consumidores pendientes.

---

#### 23. `viso.staff.permissions.manage`

Estado objetivo conservado:

```text
catalog_status = deprecated
authorization_status = blocked
resolution = DEPRECATED_SPLIT_PENDING_MIGRATION
```

Decisiones:

- no se sustituye por otro `manage`;
- no se convierte en alias hacia 14 claves;
- ninguna matriz o excepción legacy se copia;
- los consumidores deberán migrarse a la acción exacta;
- la clave solo podrá retirarse físicamente después de inventario de consumidores, migración, reconciliación y pruebas de segregación.

---

#### 24. `nexo.inventory.remissions.dispatch`

Estado objetivo:

```text
catalog_status = deprecated
assignment_status = blocked_for_new_assignments
resolution = DEPRECATED_SPLIT_PENDING_MIGRATION
replacement_set:
  - nexo.inventory.remissions.accept_custody
  - nexo.inventory.remissions.start_transit
```

Diff confirmado de matriz:

```text
conductor_logistica
- nexo.inventory.remissions.dispatch
+ nexo.inventory.remissions.accept_custody
+ nexo.inventory.remissions.start_transit
+ nexo.inventory.remissions.deliver
```

`deliver` no es alias ni parte automática del `replacement_set`. Se incorpora porque AUTH-CAT-022 aprobó una tercera capacidad logística distinta para registrar el handoff.

La eliminación física de `dispatch` se reserva para BLOQUE R después de migrar todos los consumidores y después de que AUTH-CAT-024 determine el impacto de versión.

---

#### 25. Conteo por matriz base

| Rol base          |  PULSO |  NEXO | ORIGO |   VISO | Total de componentes añadidos |
| ----------------- | -----: | ----: | ----: | -----: | ----------------------------: |
| `propietario`     |      5 |     2 |     1 |     14 |                            22 |
| `gerente_general` |      5 |     2 |     1 |     12 |                            20 |
| `gerente`         |      5 |     2 |     1 |      0 |                             8 |
| `supervisor`      |      0 |     0 |     0 |      0 |                             0 |
| Otros roles base  |      0 |     0 |     0 |      0 |                             0 |
| **Total**         | **15** | **6** | **3** | **26** |                        **50** |

`supervisor` y los demás roles fueron revisados. El valor cero es una decisión explícita de no concesión por matriz, no una omisión.

---

#### 26. Conteo por matriz operativa

| Rol operativo                |  PULSO |  NEXO | ORIGO | Total añadido | Retiro legacy |
| ---------------------------- | -----: | ----: | ----: | ------------: | ------------: |
| `cajero_satelite`            |      9 |     0 |     0 |             9 |             0 |
| `operador_integral_satelite` |      9 |     0 |     0 |             9 |             0 |
| `gerencia_operativa`         |      5 |     2 |     0 |             7 |             0 |
| `conductor_logistica`        |      0 |     3 |     0 |             3 |  1 `dispatch` |
| `bodeguero`                  |      0 |     0 |     1 |             1 |             0 |
| Otros roles operativos       |      0 |     0 |     0 |             0 |             0 |
| **Total**                    | **23** | **5** | **1** |        **29** |         **1** |

Los componentes operativos de permisos `BASE_AND_OPERATIONAL` no autorizan por sí solos.

---

#### 27. Cobertura de las 29 claves

- ✅ Las nueve claves PULSO fueron evaluadas por modalidad, rol base y rol operativo.
- ✅ Las cinco claves NEXO fueron evaluadas por autoridad de inventario, custodia, tránsito y handoff.
- ✅ La clave ORIGO fue evaluada en ambos carriles compatibles.
- ✅ Las catorce claves VISO fueron evaluadas individualmente.
- ✅ `propietario`, `gerente_general`, `gerente` y `supervisor` fueron revisados en el carril base.
- ✅ `cajero_satelite`, `operador_integral_satelite`, `gerencia_operativa`, `conductor_logistica` y `bodeguero` fueron revisados en el carril operativo.
- ✅ Las concesiones individuales base y operativas fueron actualizadas conceptualmente.
- ✅ Las denegaciones legacy relacionadas quedaron sujetas a revisión exacta y no a expansión automática.
- ✅ Siete paquetes de dispositivo recibieron un diff explícito.
- ✅ Ningún permiso nuevo se concedió por nombre de rol, prefijo o dispositivo.
- ✅ Ninguna clave VISO se incorporó al carril operativo.
- ✅ Ninguna clave `OPERATIONAL_ONLY` se incorporó a una matriz base.
- ✅ Ninguna clave `BASE_AND_OPERATIONAL` se presentó como autorización de un solo carril.

---

#### 28. Invariantes

1. El catálogo vigente continúa formalmente en 112 permisos hasta AUTH-CAT-024.
2. Las 29 claves permanecen candidatas hasta la congelación contractual.
3. Esta tarea no crea asignaciones físicas.
4. La ausencia de una concesión produce denegación por defecto.
5. No se crean denies redundantes para representar ausencia de allow.
6. Ninguna asignación legacy se copia a varias claves nuevas.
7. Ningún alias puede apuntar a más de una clave.
8. `pulso.pos.main` permanece bloqueado.
9. `viso.staff.permissions.manage` permanece bloqueado hasta migración.
10. `nexo.inventory.remissions.dispatch` no admite nuevas asignaciones objetivo.
11. `collect`, `reverse` y `refund` permanecen separados.
12. `cancel`, `return` y `refund` permanecen separados.
13. Abrir, cobrar y cerrar caja permanecen separados.
14. Aprobar o resolver diferencias no equivale a capturarlas ni ajustarlas.
15. Aceptar custodia, iniciar tránsito, entregar y recibir permanecen separados.
16. Registrar recepción comercial ORIGO no registra stock NEXO.
17. Las claves VISO no dependen de turno ni check-in.
18. Las claves VISO exigen reautenticación fuerte y segregación.
19. Un paquete de dispositivo restringe, pero nunca amplía.
20. Un actor técnico no recibe permisos humanos.
21. Una sesión compartida no conserva identidad o reautenticación del actor anterior.
22. APP-REVIEW y entornos aislados no se incorporan por inferencia.
23. Toda acción sensible conserva motivo, evidencia, recurso, versión y auditoría.
24. Las concesiones individuales no cambian la modalidad del permiso.
25. Una denegación aplicable prevalece sobre matrices y excepciones.
26. La simulación no ejecuta mutaciones sensibles.
27. Ningún flujo diferido a roadmaps funcionales se introduce mediante este diff.
28. No se fija versión, hash, fecha de retiro ni despliegue en esta tarea.

---

#### 29. Riesgos controlados

##### Riesgo 1 — Convertir `pulso.pos.main` en nueve permisos para todos sus usuarios

Control:

```text
CERO MIGRACIÓN AUTOMÁTICA
```

Solo se conceden las claves expresamente listadas por matriz o excepción.

##### Riesgo 2 — Permitir acciones sensibles a cualquier cajero

Control:

- las cinco claves sensibles son `BASE_AND_OPERATIONAL`;
- el carril operativo del cajero no basta;
- se exige componente base, reautenticación, recurso y contexto.

##### Riesgo 3 — Convertir `gerencia_operativa` en rol especialista universal

Control:

- no recibe ventas ordinarias, cobro ni sesiones de caja;
- no recibe custodia o tránsito logístico;
- solo recibe componentes operativos sensibles explícitos.

##### Riesgo 4 — Permitir que bodega apruebe su propio conteo

Control:

- `bodeguero` no recibe `approve` ni `resolve`;
- se exige autoridad base y componente operativo compatible;
- el capturador no aprueba o resuelve su propia diferencia.

##### Riesgo 5 — Permitir que el conductor reciba por el destino

Control:

- `deliver` registra handoff;
- `receive` permanece excluido del rol y del terminal logístico.

##### Riesgo 6 — Fusionar recepción comercial e inventario

Control:

- ORIGO registra la recepción comercial;
- NEXO registra entrada y custodia física;
- cada efecto conserva autorización propia.

##### Riesgo 7 — Crear autoaprobación en VISO

Control:

- `create` y `approve` son claves separadas;
- el creador no aprueba el mismo registro;
- el actor afectado no aprueba su propia concesión o denegación.

##### Riesgo 8 — Bloquear toda recuperación mediante denegaciones

Control:

- `denials.approve` y `denials.revoke` no se conceden por matriz a `gerente_general`;
- se reservan a propietario o autoridad de seguridad individualmente designada;
- toda política deberá preservar recuperación gobernada.

##### Riesgo 9 — Confundir paquete de dispositivo con permiso

Control:

```text
PACKAGE_ALLOWLIST
≠
RBAC_ALLOW
```

La decisión final continúa exigiendo actor, carril, contexto y recurso.

##### Riesgo 10 — Publicar un cambio incompatible como versión menor

Control:

AUTH-CAT-024 deberá verificar si `nexo.inventory.remissions.dispatch` fue publicado como clave activa antes de decidir la versión definitiva.

---

#### 30. Impacto sobre tareas posteriores

| Tarea         | Resultado recibido de AUTH-CAT-023                                                                                                           |
| ------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| AUTH-CAT-024  | Diff completo de 29 claves, matrices, excepciones, denegaciones, paquetes y transición legacy para validación, versionado y hash contractual |
| AUTH-RBAC-024 | Decisiones de matriz base congeladas por la versión publicada                                                                                |
| AUTH-RBAC-025 | Decisiones de matriz operativa congeladas por la versión publicada                                                                           |
| AUTH-RBAC-026 | Contratos de concesiones individuales, denegaciones y revisión legacy                                                                        |
| AUTH-RBAC-027 | Casos para validar que no exista acceso operativo global accidental                                                                          |
| AUTH-RBAC-028 | Casos para confirmar que la administración base válida no dependa de turno o check-in                                                        |
| BLOQUE E      | Combinación efectiva de carriles, contexto, recurso, denegaciones y razones de decisión                                                      |
| BLOQUE E3     | Estructuras objetivo para matrices, concesiones, denegaciones, paquetes y auditoría                                                          |
| BLOQUE R      | Migraciones, backfills, retiro legacy, reconciliación, compatibilidad y rollback                                                             |
| BLOQUE QA     | Pruebas de roles, carriles, dispositivos, segregación, transición y denegaciones                                                             |

AUTH-RBAC-024 a AUTH-RBAC-026 no deberán iniciarse con una versión provisional. Consumirán únicamente la versión congelada por AUTH-CAT-024.

---

#### 31. Criterios de aprobación

AUTH-CAT-023 podrá aprobarse cuando se acepte expresamente que:

1. las 29 claves candidatas fueron evaluadas por rol y carril;
2. las acciones ordinarias PULSO se asignan únicamente a caja y operación integrada;
3. las cinco acciones sensibles PULSO exigen componentes base y operativo para el mismo actor;
4. `supervisor` no recibe nuevos componentes de doble condición por matriz;
5. aprobar y resolver diferencias de conteo permanecen fuera de `bodeguero`;
6. `gerencia_operativa` aporta el componente operativo para diferencias de conteo, dentro de contexto real;
7. `conductor_logistica` sustituye `dispatch` por `accept_custody`, `start_transit` y `deliver` como capacidades separadas;
8. `deliver` no concede `receive`;
9. ORIGO registra la recepción comercial y NEXO conserva la entrada física;
10. `propietario` recibe las 14 claves VISO de gobierno explícito;
11. `gerente_general` recibe el ciclo de concesiones y la propuesta de denegaciones, pero no aprobación o revocación de denegaciones por matriz;
12. los demás roles no reciben gobierno VISO por nombre o jerarquía implícita;
13. las concesiones individuales pueden utilizar las claves nuevas solo en carriles compatibles;
14. ninguna concesión legacy se expande automáticamente;
15. las denegaciones legacy se revisan clave por clave y no por prefijo;
16. los siete paquetes de dispositivo actúan únicamente como filtros restrictivos;
17. `warehouse_kiosk` no incorpora autoridad para aprobar o resolver diferencias;
18. `logistics_vehicle_terminal` elimina `dispatch` e incorpora las tres acciones logísticas exactas;
19. `management_terminal` exige actor administrativo y reautenticación fuerte para VISO;
20. `pulso.pos.main` y `viso.staff.permissions.manage` permanecen bloqueados;
21. `nexo.inventory.remissions.dispatch` queda destinado a retiro controlado después de migrar consumidores;
22. no se publica todavía el número de versión ni el hash contractual;
23. no se implementa código, Supabase, datasets ni migraciones;
24. AUTH-CAT-024 permanece reservada hasta aprobación explícita de esta tarea.

---

#### 32. Estado final de la propuesta

| Tarea        | Estado      |
| ------------ | ----------- |
| AUTH-CAT-022 | APROBADA    |
| AUTH-CAT-023 | APROBADA    |
| AUTH-CAT-024 | NO INICIADA |

No se avanza a AUTH-CAT-024 hasta recibir aprobación explícita de AUTH-CAT-023.


### ✅ AUTH-CAT-024 — Validar, publicar y congelar la versión canónica que alimentará los datasets

**Estado:** APROBADA
**Bloque:** BLOQUE D — Revisión contractual previa a datasets  
**Naturaleza:** Validación integral, publicación contractual y congelación de versión  
**Implementación física:** No incluida  
**Tarea anterior vigente:** AUTH-CAT-023 — APROBADA  
**Tarea posterior reservada:** AUTH-RBAC-024 — Definir dataset canónico de matriz base  
**Catálogo contractual de salida:** `vento.authorization@1.0.0`  
**Schema contractual de referencia:** `1.0.0`  
**Permisos activos congelados:** 140  
**Aplicaciones registradas:** 10  
**Huella contractual propuesta:** `sha256:687e1bc19c0cf7332e76ed940cf5a23b829492ebbee399af718fd326cf473cbe`

Esta tarea valida y congela el contrato documental que deberán consumir
AUTH-RBAC-024, AUTH-RBAC-025 y AUTH-RBAC-026.

No crea todavía los archivos físicos de `@vento/contracts`, no publica un
paquete, no modifica Supabase, no inserta datasets, no altera RLS, RPC,
aplicaciones, dispositivos desplegados ni migraciones.

La aprobación de esta tarea publicará una **versión contractual documental
inmutable**. La publicación técnica del catálogo físico continuará reservada
para la implementación correspondiente y deberá demostrar equivalencia exacta
con esta versión.

---

#### 1. Objetivo

Cerrar la revisión contractual iniciada en AUTH-CAT-020 y confirmar que:

1. las brechas maduras fueron transformadas en claves atómicas;
2. las claves nuevas poseen clasificación contractual completa;
3. las matrices, excepciones, denegaciones y paquetes afectados fueron
   revisados mediante diff;
4. el conjunto activo resultante es exacto, único y reproducible;
5. las claves legacy no se expanden automáticamente;
6. los datasets posteriores recibirán una versión y una huella inmutables;
7. ninguna decisión documental se confunde con implementación física.

Flujo de cierre:

```text
AUTH-CAT-020
→ consolidación de brechas

AUTH-CAT-021
→ clasificación de madurez

AUTH-CAT-022
→ 29 claves atómicas nuevas
→ 1 clave activa destinada a sustitución

AUTH-CAT-023
→ diff de matrices
→ excepciones
→ denegaciones
→ paquetes de dispositivo

AUTH-CAT-024
→ validación integral
→ versión contractual
→ huella contractual
→ congelación
→ apertura de datasets
```

---

#### 2. Separación entre publicación contractual y publicación física

Se establecen dos planos distintos.

##### 2.1 Publicación contractual

Ocurre mediante la aprobación expresa de esta tarea.

Produce:

- número de versión;
- conjunto exacto de permisos activos;
- estados legacy y retirados;
- diff contractual aprobado;
- decisiones de matrices y paquetes;
- huella documental reproducible;
- puerta de entrada para datasets.

Estado después de aprobación:

```text
contractual_status = PUBLISHED
contractual_catalog_version = 1.0.0
contract_release_hash = sha256:687e1bc19c0cf7332e76ed940cf5a23b829492ebbee399af718fd326cf473cbe
```

##### 2.2 Publicación física

Ocurrirá posteriormente cuando se implementen y validen:

- `manifest.json`;
- `applications.json`;
- `permissions.json`;
- `aliases.json`;
- `legacy-permissions.json`;
- `retired-permissions.json`;
- `resource-contracts.json`;
- JSON Schema;
- tipos derivados;
- checksums;
- changelog;
- pruebas contractuales;
- `current.json`;
- paquete `@vento/contracts/authorization`.

Estado actual:

```text
physical_catalog_status = NOT_IMPLEMENTED
physical_catalog_hash = NOT_GENERATED
package_publication_status = NOT_PUBLISHED
```

Regla:

```text
PUBLICACIÓN CONTRACTUAL
≠
PUBLICACIÓN FÍSICA
```

La publicación física no podrá cambiar el contenido semántico congelado.
Si detecta una inconsistencia contractual, deberá detenerse y producir una
nueva tarea y versión; no podrá corregir silenciosamente `1.0.0`.

---

#### 3. Decisión de versión

La versión contractual inicial se congela como:

```text
catalog_id = vento.authorization
catalog_version = 1.0.0
schema_version = 1.0.0
```

Justificación:

1. AUTH-CAT-017 reservó `1.0.0` para la primera publicación.
2. No existe una publicación física anterior de `1.0.0`.
3. La fase vigente continúa siendo exclusivamente documental.
4. El conjunto intermedio de 112 permisos nunca fue publicado físicamente
   como versión inmutable.
5. Por tanto, la primera versión podrá nacer directamente con 140 permisos
   activos.
6. No corresponde publicar primero una versión de 112 permisos para luego
   retirarla artificialmente.
7. `nexo.inventory.remissions.dispatch` no formará parte del conjunto activo
   inicial; permanecerá como deuda legacy de migración.

Regla definitiva:

```text
PRIMERA PUBLICACIÓN CONTRACTUAL
→ 1.0.0
→ 140 PERMISOS ACTIVOS
```

No se utiliza `1.1.0` porque no existe una `1.0.0` publicada previa.

No se utiliza `2.0.0` porque la incompatibilidad de retirar `dispatch`
solo aplicaría frente a una versión publicada anterior que lo hubiera
incluido como activo.

---

#### 4. Entradas normativas validadas

La versión queda respaldada por:

- ADR-AUTH-001;
- AUTH-MOD-001 a AUTH-MOD-020;
- AUTH-CAT-001 a AUTH-CAT-024;
- AUTH-RBAC-001 a AUTH-RBAC-023;
- catálogo de 112 permisos aprobado antes de la revisión contractual;
- 29 claves aprobadas en AUTH-CAT-022;
- diff de matrices, excepciones, denegaciones y paquetes aprobado en
  AUTH-CAT-023.

No se incorpora ninguna decisión pendiente de:

- E1;
- E2;
- E3;
- E4;
- E5;
- roadmaps funcionales;
- auditorías futuras de aplicaciones;
- implementación física.

Las capacidades futuras descubiertas después de esta congelación requerirán
otra `catalog_version`.

---

#### 5. Resultado de conteos

##### 5.1 Evolución del conjunto activo

| Concepto                                    | Cantidad |
| ------------------------------------------- | -------: |
| Permisos activos de referencia              |      112 |
| Claves nuevas aprobadas                     |       29 |
| Clave retirada del conjunto activo objetivo |        1 |
| **Permisos activos congelados**             |  **140** |

Cálculo:

```text
112
+ 29
- 1
= 140
```

La clave retirada del conjunto activo es:

```text
nexo.inventory.remissions.dispatch
```

##### 5.2 Distribución por aplicación

| Aplicación | Permisos activos en `1.0.0` |
| ---------- | --------------------------: |
| `shell`    |                           1 |
| `anima`    |                          10 |
| `aura`     |                           1 |
| `fogo`     |                           6 |
| `nexo`     |                          67 |
| `numera`   |                           6 |
| `origo`    |                           6 |
| `pass`     |                           1 |
| `pulso`    |                          11 |
| `viso`     |                          31 |
| **Total**  |                     **140** |

##### 5.3 Integridad

- 140 claves activas.
- 140 claves únicas.
- 10 aplicaciones.
- Toda clave activa pertenece a una aplicación registrada.
- Ninguna clave activa aparece simultáneamente como legacy o retirada.
- Las 29 claves nuevas aparecen exactamente una vez.
- `nexo.inventory.remissions.dispatch` no aparece como activa.
- `pulso.pos.main` no aparece como activa.
- `viso.staff.permissions.manage` no aparece como activa.
- No se crean aliases uno-a-muchos.
- No existen concesiones implícitas derivadas de la publicación.

---

#### 6. Claves agregadas en `1.0.0`

##### 6.1 PULSO — 9

```text
pulso.cash.sessions.close
pulso.cash.sessions.start
pulso.payments.transactions.collect
pulso.payments.transactions.refund
pulso.payments.transactions.reverse
pulso.sales.discounts.apply
pulso.sales.orders.cancel
pulso.sales.orders.create
pulso.sales.returns.create
```

##### 6.2 NEXO — 5

```text
nexo.inventory.remissions.accept_custody
nexo.inventory.remissions.deliver
nexo.inventory.remissions.start_transit
nexo.inventory.stock_count_variances.approve
nexo.inventory.stock_count_variances.resolve
```

##### 6.3 ORIGO — 1

```text
origo.procurement.receipts.register
```

##### 6.4 VISO — 14

```text
viso.authorization.base_grants.approve
viso.authorization.base_grants.create
viso.authorization.base_grants.revoke
viso.authorization.base_grants.suspend
viso.authorization.base_grants.view
viso.authorization.denials.approve
viso.authorization.denials.create
viso.authorization.denials.revoke
viso.authorization.denials.view
viso.authorization.operational_grants.approve
viso.authorization.operational_grants.create
viso.authorization.operational_grants.revoke
viso.authorization.operational_grants.suspend
viso.authorization.operational_grants.view
```

---

#### 7. Estado de claves legacy

##### 7.1 Inventario legacy bloqueado

La versión contractual reconoce 22 claves legacy amplias o sustituidas:

```text
fogo.production.recipes.manage
nexo.cost_centers.manage
nexo.internal_prices.manage
nexo.inventory.remissions.dispatch
nexo.settings.categories.manage
nexo.settings.remissions.manage
nexo.settings.sites.manage
nexo.settings.supply_routes.manage
nexo.settings.units.manage
numera.cost_centers.manage
numera.expenses.manage
origo.suppliers.manage
pulso.pos.main
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

- no son permisos activos;
- no admiten asignaciones nuevas;
- no aparecen en datasets de concesiones canónicas;
- no se expanden automáticamente;
- pueden conservarse físicamente solo para compatibilidad, telemetría,
  inventario de consumidores y migración;
- su retiro físico exige BLOQUE R, pruebas y rollback.

##### 7.2 Claves sustituidas relevantes

| Clave legacy                         | Estado                               | Reemplazo contractual                                                              |
| ------------------------------------ | ------------------------------------ | ---------------------------------------------------------------------------------- |
| `pulso.pos.main`                     | `deprecated_incomplete_split`        | Nueve claves PULSO maduras y futuros permisos diferidos                            |
| `viso.staff.permissions.manage`      | `deprecated_split_pending_migration` | 14 claves VISO                                                                     |
| `nexo.inventory.remissions.dispatch` | `deprecated_split_pending_migration` | `accept_custody` + `start_transit`; `deliver` es capacidad adicional independiente |

Ninguna forma un alias uno-a-muchos.

---

#### 8. Permisos técnicos retirados

Las siguientes 14 claves permanecen retiradas y no pueden reactivarse:

```text
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
```

Regla:

```text
PERMISO TÉCNICO RETIRADO SOLICITADO
→ DENEGAR
→ REGISTRAR DIAGNÓSTICO
→ NO REACTIVAR POR FALLBACK
```

---

#### 9. Validación del diff de matrices

AUTH-CAT-023 dejó congeladas las siguientes cantidades documentales:

| Capa                                                      | Resultado |
| --------------------------------------------------------- | --------: |
| Componentes de concesión añadidos a matrices base         |        50 |
| Componentes añadidos a matrices operativas                |        29 |
| Concesiones legacy retiradas de matriz operativa objetivo |         1 |
| Concesiones individuales automáticas                      |         0 |
| Denegaciones individuales automáticas                     |         0 |
| Paquetes de dispositivo revisados                         |         7 |

Validaciones:

- PULSO ordinario se concede solo mediante carril operativo compatible.
- Las cinco acciones sensibles PULSO requieren `BASE_AND_OPERATIONAL`.
- NEXO separa captura, aprobación, resolución y ajuste.
- `bodeguero` no aprueba ni resuelve su propia diferencia por matriz.
- `conductor_logistica` recibe custodia, tránsito y entrega por claves
  separadas.
- `deliver` no concede `receive`.
- ORIGO registra recepción comercial; NEXO conserva entrada física.
- Las 14 claves VISO son `BASE_ONLY`.
- Las denegaciones legacy se revisan clave por clave.
- Los paquetes de dispositivo restringen, pero nunca conceden.
- Los permisos nuevos no se asignan por prefijo, alias, rol, aplicación o
  dispositivo.

---

#### 10. Congelación de decisiones de matrices

Los datasets posteriores deberán reproducir exactamente el diff aprobado.

##### 10.1 Matriz base

AUTH-RBAC-024 deberá partir de:

```text
base_grant_components_added = 50
```

No podrá:

- incorporar componentes nuevos sin una nueva revisión contractual;
- conceder permisos `OPERATIONAL_ONLY` a roles base;
- utilizar roles legacy para reconstruir permisos amplios;
- otorgar VISO por jerarquía implícita;
- conceder a `supervisor` componentes no aprobados.

##### 10.2 Matriz operativa

AUTH-RBAC-025 deberá partir de:

```text
operational_grant_components_added = 29
operational_legacy_grants_removed = 1
```

La concesión retirada es:

```text
conductor_logistica
- nexo.inventory.remissions.dispatch
```

Y se sustituye documentalmente por:

```text
conductor_logistica
+ nexo.inventory.remissions.accept_custody
+ nexo.inventory.remissions.start_transit
+ nexo.inventory.remissions.deliver
```

##### 10.3 Excepciones y denegaciones

AUTH-RBAC-026 deberá partir de:

```text
automatic_individual_grants = 0
automatic_denials = 0
```

Toda excepción o denegación deberá:

- usar la clave exacta;
- respetar modalidad y carril;
- definir sujeto, alcance, vigencia y recurso;
- conservar aprobación y auditoría;
- evitar expansiones desde claves legacy.

---

#### 11. Congelación de paquetes de dispositivo

Los siete paquetes revisados son:

```text
pos_satellite
integrated_satellite
operations_management_terminal
warehouse_kiosk
logistics_vehicle_terminal
procurement_reception
management_terminal
```

Reglas para datasets y configuraciones posteriores:

1. cada paquete deberá declarar `catalog_version = 1.0.0`;
2. cada paquete deberá declarar la huella contractual de esta tarea;
3. ninguna plantilla o instancia puede agregar una clave fuera del paquete;
4. ninguna inclusión crea autorización;
5. `warehouse_kiosk` no incorpora las nuevas autoridades sensibles;
6. `logistics_vehicle_terminal` excluye `dispatch` e incluye las tres claves
   logísticas nuevas;
7. `procurement_reception` incluye únicamente la capacidad ORIGO aprobada;
8. `management_terminal` puede presentar las 14 claves VISO, pero la
   decisión depende del actor real;
9. las versiones específicas de cada paquete se definirán en su artefacto
   correspondiente y no sustituyen `catalog_version`.

---

#### 12. Huella contractual

##### 12.1 Campo publicado

```text
contract_release_hash = sha256:687e1bc19c0cf7332e76ed940cf5a23b829492ebbee399af718fd326cf473cbe
```

Esta huella identifica el contenido semántico congelado para datasets.

No es el futuro `catalog_hash` compuesto de los archivos físicos.

##### 12.2 Algoritmo

La huella se calcula sobre el bloque canónico de la sección 12.4 mediante:

- UTF-8 sin BOM;
- saltos LF;
- una asignación por línea;
- sin espacios finales;
- listas ordenadas lexicográficamente;
- campos en el orden publicado;
- un único salto LF al final;
- SHA-256 sobre los bytes resultantes;
- sin fecha, hora ni estado mutable dentro del payload.

Resultado esperado:

```text
687e1bc19c0cf7332e76ed940cf5a23b829492ebbee399af718fd326cf473cbe
```

##### 12.3 Separación de hashes

```text
contract_release_hash
→ identifica la decisión documental congelada

catalog_hash
→ identificará posteriormente los archivos físicos publicados

contract_hash
→ identificará el contrato de recurso usado por una decisión concreta
```

La implementación física deberá registrar su `catalog_hash`, pero además
deberá declarar que implementa:

```text
catalog_version = 1.0.0
contract_release_hash = sha256:687e1bc19c0cf7332e76ed940cf5a23b829492ebbee399af718fd326cf473cbe
```

##### 12.4 Payload canónico de la publicación

```text
catalog_id=vento.authorization
catalog_version=1.0.0
schema_version=1.0.0
release_kind=contractual_snapshot
application_count=10
permission_count=140
legacy_blocked_count=22
retired_technical_count=14
base_grant_components_added=50
operational_grant_components_added=29
operational_legacy_grants_removed=1
automatic_individual_grants=0
automatic_denials=0
device_packages_reviewed=7
physical_changes_allowed=false
next_dataset_task=AUTH-RBAC-024
source_task=ADR-AUTH-001
source_task=AUTH-CAT-001..AUTH-CAT-024
source_task=AUTH-RBAC-001..AUTH-RBAC-023
application_permission_count=anima:10
application_permission_count=aura:1
application_permission_count=fogo:6
application_permission_count=nexo:67
application_permission_count=numera:6
application_permission_count=origo:6
application_permission_count=pass:1
application_permission_count=pulso:11
application_permission_count=shell:1
application_permission_count=viso:31
active_permission=anima.access
active_permission=anima.attendance.shifts.cancel
active_permission=anima.attendance.shifts.create
active_permission=anima.attendance.shifts.update
active_permission=anima.workforce.employee_documents.delete
active_permission=anima.workforce.employee_documents.upload
active_permission=anima.workforce.employee_documents.view
active_permission=anima.workforce.employee_photos.upload
active_permission=anima.workforce.staff_invitations.create
active_permission=anima.workforce.team_members.view
active_permission=aura.access
active_permission=fogo.access
active_permission=fogo.production.batches.create
active_permission=fogo.production.batches.view
active_permission=fogo.production.orders.view
active_permission=fogo.production.recipe_book.view
active_permission=fogo.production.recipes.view
active_permission=nexo.access
active_permission=nexo.analytics.internal_reports.view
active_permission=nexo.analytics.margin_reports.view
active_permission=nexo.assets.counts.view
active_permission=nexo.assets.groups.view
active_permission=nexo.assets.items.create
active_permission=nexo.assets.items.view
active_permission=nexo.catalog.categories.view
active_permission=nexo.catalog.presentations.view
active_permission=nexo.catalog.products.create
active_permission=nexo.catalog.products.view
active_permission=nexo.catalog.request_policies.view
active_permission=nexo.catalog.units.view
active_permission=nexo.finance.cost_centers.view
active_permission=nexo.finance.internal_invoice_amounts.view
active_permission=nexo.finance.internal_invoices.cancel
active_permission=nexo.finance.internal_invoices.generate
active_permission=nexo.finance.internal_invoices.issue
active_permission=nexo.finance.internal_invoices.view
active_permission=nexo.finance.internal_prices.view
active_permission=nexo.finance.internal_variances.approve
active_permission=nexo.finance.internal_variances.resolve
active_permission=nexo.finance.internal_variances.view
active_permission=nexo.inventory.adjustments.register
active_permission=nexo.inventory.adjustments.view
active_permission=nexo.inventory.entries.override
active_permission=nexo.inventory.entries.register
active_permission=nexo.inventory.entries.view
active_permission=nexo.inventory.initial_counts.view
active_permission=nexo.inventory.location_assignments.assign
active_permission=nexo.inventory.location_catalog.update
active_permission=nexo.inventory.locations.view
active_permission=nexo.inventory.lpns.view
active_permission=nexo.inventory.movements.view
active_permission=nexo.inventory.production_batches.view
active_permission=nexo.inventory.remissions.accept_custody
active_permission=nexo.inventory.remissions.cancel
active_permission=nexo.inventory.remissions.deliver
active_permission=nexo.inventory.remissions.prepare
active_permission=nexo.inventory.remissions.receive
active_permission=nexo.inventory.remissions.request
active_permission=nexo.inventory.remissions.start_transit
active_permission=nexo.inventory.remissions.update
active_permission=nexo.inventory.remissions.view
active_permission=nexo.inventory.stock.view
active_permission=nexo.inventory.stock_count_variances.approve
active_permission=nexo.inventory.stock_count_variances.resolve
active_permission=nexo.inventory.stock_counts.perform
active_permission=nexo.inventory.stock_counts.view
active_permission=nexo.inventory.stock_validations.perform
active_permission=nexo.inventory.storage_positions.view
active_permission=nexo.inventory.transfers.create
active_permission=nexo.inventory.transfers.view
active_permission=nexo.inventory.warehouse_operations.view
active_permission=nexo.inventory.withdrawals.register
active_permission=nexo.inventory.withdrawals.view
active_permission=nexo.inventory.zones.view
active_permission=nexo.logistics.driver_operations.view
active_permission=nexo.logistics.fulfillment.view
active_permission=nexo.logistics.fulfillment_routes.view
active_permission=nexo.logistics.operations.view
active_permission=nexo.logistics.operations_board.view
active_permission=nexo.logistics.supply_routes.view
active_permission=nexo.printing.jobs.view
active_permission=nexo.printing.templates.update
active_permission=nexo.settings.remission_policies.view
active_permission=nexo.settings.sites.view
active_permission=numera.access
active_permission=numera.analytics.break_even.view
active_permission=numera.analytics.financial_reports.view
active_permission=numera.analytics.profitability.view
active_permission=numera.finance.cost_centers.view
active_permission=numera.finance.expenses.view
active_permission=origo.access
active_permission=origo.catalog.product_reviews.view
active_permission=origo.procurement.purchase_orders.view
active_permission=origo.procurement.receipts.register
active_permission=origo.procurement.receipts.view
active_permission=origo.procurement.suppliers.view
active_permission=pass.access
active_permission=pulso.access
active_permission=pulso.cash.sessions.close
active_permission=pulso.cash.sessions.start
active_permission=pulso.delivery.deliveries.override
active_permission=pulso.payments.transactions.collect
active_permission=pulso.payments.transactions.refund
active_permission=pulso.payments.transactions.reverse
active_permission=pulso.sales.discounts.apply
active_permission=pulso.sales.orders.cancel
active_permission=pulso.sales.orders.create
active_permission=pulso.sales.returns.create
active_permission=shell.access
active_permission=viso.access
active_permission=viso.authorization.audit_logs.view
active_permission=viso.authorization.base_grants.approve
active_permission=viso.authorization.base_grants.create
active_permission=viso.authorization.base_grants.revoke
active_permission=viso.authorization.base_grants.suspend
active_permission=viso.authorization.base_grants.view
active_permission=viso.authorization.context_simulations.view
active_permission=viso.authorization.denials.approve
active_permission=viso.authorization.denials.create
active_permission=viso.authorization.denials.revoke
active_permission=viso.authorization.denials.view
active_permission=viso.authorization.operational_grants.approve
active_permission=viso.authorization.operational_grants.create
active_permission=viso.authorization.operational_grants.revoke
active_permission=viso.authorization.operational_grants.suspend
active_permission=viso.authorization.operational_grants.view
active_permission=viso.catalog.commercial_categories.view
active_permission=viso.content.content_blocks.view
active_permission=viso.content.menu.view
active_permission=viso.content.website_content.view
active_permission=viso.delivery.rates.view
active_permission=viso.finance.accounting.view
active_permission=viso.loyalty.customers.view
active_permission=viso.loyalty.products.view
active_permission=viso.organization.businesses.view
active_permission=viso.platform.app_updates.view
active_permission=viso.workforce.employees.view
active_permission=viso.workforce.schedules.view
active_permission=viso.workforce.staff_calendar.view
active_permission=viso.workforce.vacancies.view
added_permission=nexo.inventory.remissions.accept_custody
added_permission=nexo.inventory.remissions.deliver
added_permission=nexo.inventory.remissions.start_transit
added_permission=nexo.inventory.stock_count_variances.approve
added_permission=nexo.inventory.stock_count_variances.resolve
added_permission=origo.procurement.receipts.register
added_permission=pulso.cash.sessions.close
added_permission=pulso.cash.sessions.start
added_permission=pulso.payments.transactions.collect
added_permission=pulso.payments.transactions.refund
added_permission=pulso.payments.transactions.reverse
added_permission=pulso.sales.discounts.apply
added_permission=pulso.sales.orders.cancel
added_permission=pulso.sales.orders.create
added_permission=pulso.sales.returns.create
added_permission=viso.authorization.base_grants.approve
added_permission=viso.authorization.base_grants.create
added_permission=viso.authorization.base_grants.revoke
added_permission=viso.authorization.base_grants.suspend
added_permission=viso.authorization.base_grants.view
added_permission=viso.authorization.denials.approve
added_permission=viso.authorization.denials.create
added_permission=viso.authorization.denials.revoke
added_permission=viso.authorization.denials.view
added_permission=viso.authorization.operational_grants.approve
added_permission=viso.authorization.operational_grants.create
added_permission=viso.authorization.operational_grants.revoke
added_permission=viso.authorization.operational_grants.suspend
added_permission=viso.authorization.operational_grants.view
removed_from_active=nexo.inventory.remissions.dispatch
legacy_blocked_permission=fogo.production.recipes.manage
legacy_blocked_permission=nexo.cost_centers.manage
legacy_blocked_permission=nexo.internal_prices.manage
legacy_blocked_permission=nexo.inventory.remissions.dispatch
legacy_blocked_permission=nexo.settings.categories.manage
legacy_blocked_permission=nexo.settings.remissions.manage
legacy_blocked_permission=nexo.settings.sites.manage
legacy_blocked_permission=nexo.settings.supply_routes.manage
legacy_blocked_permission=nexo.settings.units.manage
legacy_blocked_permission=numera.cost_centers.manage
legacy_blocked_permission=numera.expenses.manage
legacy_blocked_permission=origo.suppliers.manage
legacy_blocked_permission=pulso.pos.main
legacy_blocked_permission=viso.app_navigation.manage
legacy_blocked_permission=viso.employee_operational_profiles.manage
legacy_blocked_permission=viso.menu.images.manage
legacy_blocked_permission=viso.operational_points.manage
legacy_blocked_permission=viso.site_operational_roles.manage
legacy_blocked_permission=viso.staff.documents.manage
legacy_blocked_permission=viso.staff.employee_photos.manage
legacy_blocked_permission=viso.staff.manage
legacy_blocked_permission=viso.staff.permissions.manage
retired_technical_permission=nexo.code.view
retired_technical_permission=nexo.edit.view
retired_technical_permission=nexo.login.view
retired_technical_permission=nexo.new.view
retired_technical_permission=nexo.no_access.view
retired_technical_permission=nexo.open.view
retired_technical_permission=nexo.page_tsx.view
retired_technical_permission=nexo.quick.view
retired_technical_permission=nexo.scanner.view
retired_technical_permission=nexo.settings.view
retired_technical_permission=nexo.setup.view
retired_technical_permission=nexo.slug.view
retired_technical_permission=origo.login.view
retired_technical_permission=origo.no_access.view
```

---

#### 13. Contrato de consumo para datasets

AUTH-RBAC-024, AUTH-RBAC-025 y AUTH-RBAC-026 deberán incluir obligatoriamente:

```text
catalog_id = vento.authorization
catalog_version = 1.0.0
schema_version = 1.0.0
contract_release_hash = sha256:687e1bc19c0cf7332e76ed940cf5a23b829492ebbee399af718fd326cf473cbe
```

Cada dataset deberá declarar además:

- `dataset_id`;
- `dataset_version`;
- tarea fuente;
- fecha documental de aprobación;
- cantidad esperada de registros;
- roles o sujetos incluidos;
- claves activas utilizadas;
- claves legacy referenciadas solo para migración;
- validaciones;
- checksum propio;
- estado `proposal`, `approved` o equivalente documental.

Reglas:

1. un dataset no puede crear permisos;
2. un dataset no puede cambiar propiedades del catálogo;
3. un dataset no puede incluir claves fuera del conjunto activo;
4. una clave legacy solo puede aparecer como referencia de transición, nunca
   como concesión canónica nueva;
5. las ausencias continúan siendo `DEFAULT_DENY`;
6. el dataset base y operativo no pueden completar mutuamente componentes
   para actores distintos;
7. cada fila deberá poder trazarse a AUTH-CAT-023;
8. toda divergencia exige detener la tarea y reabrir revisión contractual.

---

#### 14. Validaciones que bloquean datasets

AUTH-RBAC-024 no podrá iniciarse si ocurre cualquiera de estos casos:

- el conjunto activo no contiene exactamente 140 claves;
- aparece una clave duplicada;
- falta una de las 29 claves nuevas;
- `dispatch` aparece como activa;
- un permiso técnico retirado aparece como activo;
- una clave legacy aparece como asignable;
- la distribución por aplicación no coincide;
- el hash contractual no coincide;
- el diff de AUTH-CAT-023 no fue aprobado;
- se detecta una publicación física anterior incompatible;
- existe una modificación sustantiva posterior no versionada.

Durante el desarrollo de datasets, cualquier inconsistencia deberá producir:

```text
STOP
→ DOCUMENTAR DIFERENCIA
→ NO CORREGIR SILENCIOSAMENTE
→ REABRIR CATÁLOGO SI CAMBIA EL CONTRATO
```

---

#### 15. Congelación e inmutabilidad

Después de aprobar AUTH-CAT-024:

- `vento.authorization@1.0.0` será inmutable contractualmente;
- el conjunto de 140 permisos no podrá editarse en sitio;
- la huella contractual no podrá recalcularse sobre contenido diferente;
- las matrices no podrán reinterpretar las propiedades de un permiso;
- los datasets deberán referenciar versión y hash exactos;
- una corrección ortográfica sin efecto semántico requerirá al menos una
  nueva versión documental;
- una capacidad nueva requerirá `MINOR`;
- un cambio incompatible requerirá `MAJOR`;
- una clave retirada nunca podrá reutilizarse;
- `current` físico solo podrá apuntar posteriormente a una versión publicada
  y validada.

La existencia de versiones futuras no invalida `1.0.0`. Las decisiones y
auditorías históricas conservarán su versión exacta.

---

#### 16. Cambios futuros

Después de `1.0.0`:

##### 16.1 Cambio menor

Ejemplos:

- nueva clave atómica;
- nueva aplicación aprobada;
- nuevo contrato no usado previamente;
- metadato opcional compatible.

Resultado:

```text
1.0.0
→ 1.1.0
```

##### 16.2 Cambio mayor

Ejemplos:

- retirar una clave activa publicada;
- cambiar significado;
- cambiar modalidad de forma incompatible;
- ampliar o reducir alcance de forma incompatible;
- cambiar requisitos de turno, check-in, área, dispositivo o recurso de
  forma incompatible.

Resultado:

```text
1.x.x
→ 2.0.0
```

##### 16.3 Parche

Solo para correcciones sin cambio de capacidad y mediante nueva versión:

```text
1.0.0
→ 1.0.1
```

Nunca se modifica `1.0.0` en sitio.

---

#### 17. Publicación contractual al aprobar

La aprobación expresa de esta propuesta producirá:

```text
AUTH-CAT-024 = APROBADA
catalog_version = 1.0.0
contractual_status = PUBLISHED
permission_count = 140
contract_release_hash = sha256:687e1bc19c0cf7332e76ed940cf5a23b829492ebbee399af718fd326cf473cbe
next_task = AUTH-RBAC-024
```

La fecha efectiva deberá registrarse durante la consolidación documental del
encabezado y no forma parte de la huella semántica.

No será necesario regenerar este archivo únicamente para cambiar el marcador
🟡 por ✅, salvo que la aprobación incluya una corrección sustantiva.

---

#### 18. Fuera del alcance

AUTH-CAT-024 no implementa:

- archivos físicos del catálogo;
- paquete `@vento/contracts`;
- publicación npm o registry;
- `current.json`;
- tipos TypeScript físicos;
- constantes o parsers;
- migraciones;
- tablas;
- filas de matrices;
- RLS;
- RPC;
- guards;
- dispositivos;
- backfills;
- retiro físico de legacy;
- activación en aplicaciones;
- rollout;
- rollback técnico.

La implementación física deberá ocurrir posteriormente mediante paquetes
versionados en `vento-shell`.

---

#### 19. Riesgos controlados

##### Riesgo 1 — Declarar publicado algo que no existe físicamente

Control:

```text
PUBLISHED CONTRACTUAL
≠
PUBLISHED PHYSICAL
```

##### Riesgo 2 — Inventar una versión intermedia de 112 permisos

Control:

```text
NO EXISTIÓ PUBLICACIÓN FÍSICA PREVIA
→ PRIMERA VERSIÓN = 1.0.0 CON 140 ACTIVOS
```

##### Riesgo 3 — Conceder automáticamente las 29 claves

Control:

```text
PERMISO ACTIVO EN CATÁLOGO
≠
PERMISO CONCEDIDO
```

##### Riesgo 4 — Mantener `dispatch` como activo por compatibilidad

Control:

- permanece legacy;
- no aparece en datasets nuevos;
- puede existir físicamente solo durante migración controlada.

##### Riesgo 5 — Hash no reproducible

Control:

- payload normativo embebido;
- normalización exacta;
- SHA-256 fijo;
- exclusión de timestamps.

##### Riesgo 6 — Dataset modifica el contrato

Control:

```text
CATÁLOGO
→ DEFINE CAPACIDAD

DATASET
→ DEFINE ASIGNACIÓN
```

##### Riesgo 7 — Versiones futuras reinterpretan historia

Control:

- versión exacta;
- hash exacto;
- snapshots inmutables;
- trazabilidad en decisiones y auditoría.

---

#### 20. Criterios de aprobación

AUTH-CAT-024 podrá aprobarse cuando se acepte expresamente que:

1. la primera versión contractual se publica como `1.0.0`;
2. `schema_version` permanece en `1.0.0`;
3. el conjunto activo contiene exactamente 140 claves;
4. la distribución por aplicación queda congelada;
5. las 29 claves de AUTH-CAT-022 quedan activas y asignables únicamente
   mediante reglas explícitas;
6. `nexo.inventory.remissions.dispatch` sale del conjunto activo;
7. existen 22 claves legacy bloqueadas;
8. existen 14 claves técnicas retiradas;
9. ninguna clave legacy se expande automáticamente;
10. AUTH-CAT-023 aporta 50 componentes base, 29 operativos y un retiro
    legacy;
11. no se crean concesiones o denegaciones individuales automáticas;
12. los siete paquetes revisados permanecen como filtros restrictivos;
13. la huella contractual es
    `sha256:687e1bc19c0cf7332e76ed940cf5a23b829492ebbee399af718fd326cf473cbe`;
14. el payload de la sección 12.4 es la fuente reproducible de esa huella;
15. la publicación contractual no afirma implementación física;
16. la implementación posterior deberá declarar versión y huella exactas;
17. AUTH-RBAC-024 a AUTH-RBAC-026 deberán consumir esta versión;
18. cualquier divergencia bloqueará datasets y exigirá revisión;
19. no se modifica Supabase, código, RLS, RPC, dispositivos ni migraciones;
20. AUTH-RBAC-024 queda habilitada únicamente después de aprobación expresa.

---

#### 21. Estado final de la propuesta

| Tarea         | Estado      |
| ------------- | ----------- |
| AUTH-CAT-023  | APROBADA    |
| AUTH-CAT-024  | APROBADA    |
| AUTH-RBAC-024 | NO INICIADA |

No se avanza a AUTH-RBAC-024 hasta recibir aprobación explícita de
AUTH-CAT-024.

### ✅ AUTH-CAT-025 — Completar contratos de alcance y recurso de las 29 PermissionKey incorporadas por AUTH-CAT-024 y publicar la versión contractual sucesora

**Estado:** APROBADA
**Tarea anterior:** AUTH-CAT-024 — Validar, publicar y congelar la versión canónica que alimentará los datasets
**Tarea siguiente:** AUTH-DB-034 — Implementar evaluate_authorization canónico, su núcleo de evaluación, resolvers de recurso y proyecciones seguras
**Tipo de tarea:** Documental
**Bloque:** BLOQUE D — Revisión contractual previa a datasets / corrección transversal de contrato
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/D_MATRICES/08_REVISION_CONTRACTUAL_PREVIA_DATASETS.md`
**Estado físico resultante:** contrato documental sucesor `vento.authorization@1.1.0` cerrado; materialización física no incluida
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Cerrar la no conformidad documental registrada por `AUTH-CAT-024::CORR-001` sin modificar en sitio `vento.authorization@1.0.0`, sin inventar semántica durante `AUTH-DB-034` y sin reescribir datasets históricos.

`AUTH-CAT-025` define de forma explícita y reproducible la metadata contractual que faltaba para las 29 `PermissionKey` incorporadas por `AUTH-CAT-022` y congeladas por `AUTH-CAT-024`, incluyendo alcance, prerrequisitos por carril, representación, contrato de recurso, políticas de campos, auditoría, compatibilidad y huellas por permiso.

La tarea conserva exactamente **140 permisos activos** y **10 aplicaciones**. No crea una trigésima clave, no reactiva `nexo.inventory.remissions.dispatch`, no altera las modalidades aprobadas en `AUTH-CAT-022` y no modifica asignaciones de `AUTH-CAT-023` ni de `AUTH-RBAC-024..026`.

---

#### 2. No conformidad que se cierra

`AUTH-CAT-011` y `AUTH-CAT-016` cerraron alcance y contratos completos de recurso para 112 permisos. `AUTH-CAT-022` añadió 29 claves con clasificación y contratos mínimos; `AUTH-CAT-024` congeló un universo de 140 permisos. Sin embargo, `AUTH-CAT-017` exige que todo permiso activo publique explícitamente propiedades que no pueden deducirse en runtime.

Para las 29 claves nuevas faltaba cerrar, como mínimo:

- `allowed_scopes` y `maximum_scope`;
- `allows_own_resource`;
- `allows_third_party_resource`;
- `allows_cross_site_relation`;
- `allows_organizational_non_territorial`;
- forma completa de `base_lane` y `operational_lane`;
- `resource_contract_id`;
- `resolution_mode`;
- `required_sides`;
- `field_policy_id`;
- `audit_policy_id`;
- contrato reutilizable completo de recurso;
- metadata humana obligatoria y huella contractual individual reproducible.

No se permite que `AUTH-DB-034`, Supabase, un generador o un consumidor reconstruyan esos valores por semejanza, nombre de rol, grant observado, prefijo o heurística.

---

#### 3. Fuentes vinculantes y precedencia

Esta tarea consume y preserva:

1. `ADR-AUTH-001` y `AUTH-MOD-001..020` para el modelo de autorización;
2. `AUTH-CAT-011` para vocabulario y semántica de alcance;
3. `AUTH-CAT-016` para forma completa del contrato de recurso;
4. `AUTH-CAT-017` para versionado y campos obligatorios de `permissions.json` y `resource-contracts.json`;
5. `AUTH-CAT-022` para identidad, capacidad, modalidad, sensibilidad, contexto, área, dispositivo, simulación y contratos mínimos de las 29 claves;
6. `AUTH-CAT-023` para grants de matriz, segregación, paquetes de dispositivo y compatibilidad del diff;
7. `AUTH-CAT-024` para el universo activo de 140 claves y la inmutabilidad de `vento.authorization@1.0.0`;
8. `SHELL-CON-006` para los trece `PermissionScopeCode` exactos `NT`, `ORG`, `G`, `AS`, `SS`, `AST`, `TST`, `AA`, `SA`, `AAT`, `ATW`, `CTX`, `OWN`;
9. `AUTH-ERR-020` y `SHELL-CON-008` para el namespace cerrado de razones de autorización;
10. `AUTH-DB-034` como consumidor físico posterior de `PermissionContractSnapshot` y `ResourceContractSnapshot`.

Precedencia específica:

```text
AUTH-CAT-024@1.0.0
→ permanece histórico e inmutable

AUTH-CAT-025@1.1.0
→ sucesor contractual para materialización futura

AUTH-DB-034
→ proyecta exactamente 1.1.0
→ no inventa campos faltantes
```

---

#### 4. Decisión de versión

Se aprueba:

```text
catalog_id = vento.authorization
catalog_version = 1.1.0
schema_version = 1.0.0
supersedes = 1.0.0
permission_count = 140
application_count = 10
active_permission_keyset_changed = false
publication_kind = CONTRACTUAL_ONLY
physical_publication_status = NOT_EXECUTED
```

La versión es **MINOR** y no PATCH porque se incorporan 29 contratos completos de recurso que no estaban publicados de forma utilizable, supuesto que `AUTH-CAT-024` clasifica como nuevo contrato compatible. No es MAJOR porque:

- no cambia el conjunto de 140 `PermissionKey` activas;
- no cambia ninguna `authorization_requirement` aprobada;
- no cambia lectura/configuración/sensibilidad, dispositivo o simulación;
- no reactiva ni retira otra clave;
- no cambia los grants aprobados;
- no existe una semántica completa previa de estas propiedades que sea reemplazada por otra incompatible;
- los valores definidos aquí son compatibles con las matrices y grants ya aprobados en `AUTH-CAT-023`.

`vento.authorization@1.0.0` no se corrige en sitio. Su hash histórico sigue siendo `sha256:687e1bc19c0cf7332e76ed940cf5a23b829492ebbee399af718fd326cf473cbe`.

---

#### 5. Reglas de alcance cerradas

##### 5.1 Operación ordinaria por sede

Para las claves `OPERATIONAL_ONLY` de PULSO y para las acciones logísticas NEXO:

```text
allowed_scopes = [AS, SS, AST, AA, SA, AAT, CTX]
maximum_scope = AS
```

Una concesión estática puede acotar sedes o áreas, pero la ejecución real siempre intersecta ese límite con `CTX`. No se admite `G`, `TST` ni `ATW` en el carril operativo ordinario.

##### 5.2 Doble condición base + operativa

Para las claves `BASE_AND_OPERATIONAL` de PULSO y NEXO:

```text
allowed_scopes = [G, AS, SS, AST, TST, AA, SA, AAT, ATW, CTX]
maximum_scope = G
```

`G` solo puede existir en el componente base. La ejecución nunca es global por sí sola:

```text
ALCANCE EFECTIVO
=
ALCANCE BASE
∩
CTX OPERATIVO
∩
RECURSO RESUELTO
```

##### 5.3 ORIGO base u operativo

`origo.procurement.receipts.register` admite el mismo conjunto territorial del carril base y `CTX` en el carril operativo, con `maximum_scope = G`. Cada recepción concreta resuelve una sola sede receptora.

##### 5.4 Gobierno VISO

Las catorce claves VISO usan exclusivamente:

```text
allowed_scopes = [ORG]
maximum_scope = ORG
allows_organizational_non_territorial = true
```

El alcance territorial contenido dentro de una concesión o denegación es **dato protegido del recurso objetivo**, no el alcance del permiso administrativo VISO. No se fabrica una sede para gobernar un registro de autorización.

---

#### 6. Reglas de carril y representación

1. `BASE_ONLY`: `base_lane.requires_shift = false`, `base_lane.requires_checkin = false`, `operational_lane = null`.
2. `OPERATIONAL_ONLY`: `base_lane = null`; el carril operativo exige turno y check-in.
3. `BASE_OR_OPERATIONAL`: base sin turno/check-in u operativo con turno+check-in; un carril completo basta.
4. `BASE_AND_OPERATIONAL`: base sin turno/check-in y operativo con turno+check-in; ambos deben pertenecer al mismo actor y estar completos.
5. `operational_lane.area_requirement` conserva exactamente `SITE_SUFFICIENT`, `REQUIRED` o `NOT_APPLICABLE` según `AUTH-CAT-022`.
6. `STRONG_REAUTH_REQUIRED` implica `requires_strong_reauthentication = true`.
7. `STANDARD_ACTOR_SESSION` no elimina permiso, alcance, recurso, turno, check-in ni auditoría.
8. `DECISION_ONLY` jamás habilita ejecución real en simulación.

---

#### 7. Matriz contractual explícita de las 29 PermissionKey

| PermissionKey | Modalidad | allowed_scopes | máximo | own | terceros | relación multisede | org no territorial | carriles `base / operacional` | resource_contract_id | contract_hash |
| --- | --- | --- | --- | ---: | ---: | ---: | ---: | --- | --- | --- |
| `nexo.inventory.remissions.accept_custody` | `OPERATIONAL_ONLY` | `AS,SS,AST,AA,SA,AAT,CTX` | `AS` | false | true | true | false | `— / T+C/SITE_SUFFICIENT` | `nexo.remission.accept_custody.v1` | `sha256:cecf77209928b41ac23587832d45e3d5ad3a1ae0c01f3084cfec4b9b315a18b6` |
| `nexo.inventory.remissions.deliver` | `OPERATIONAL_ONLY` | `AS,SS,AST,AA,SA,AAT,CTX` | `AS` | false | true | true | false | `— / T+C/SITE_SUFFICIENT` | `nexo.remission.deliver.v1` | `sha256:973df08c36cb005d6ce6cdd78f7b4b568d619e09fb2ed7a8d5cbc22eb81efce4` |
| `nexo.inventory.remissions.start_transit` | `OPERATIONAL_ONLY` | `AS,SS,AST,AA,SA,AAT,CTX` | `AS` | false | true | true | false | `— / T+C/SITE_SUFFICIENT` | `nexo.remission.start_transit.v1` | `sha256:81076a4342fe11f8d0f9e1eefbf0bc63868e3d6d84cb731a763e26123fa7c045` |
| `nexo.inventory.stock_count_variances.approve` | `BASE_AND_OPERATIONAL` | `G,AS,SS,AST,TST,AA,SA,AAT,ATW,CTX` | `G` | false | true | false | false | `N / T+C/REQUIRED` | `nexo.stock_count_variance.approve.v1` | `sha256:f445bd4e9df565f02033321f2664971a3e1840283c1f893cbb4829a2e7e293a6` |
| `nexo.inventory.stock_count_variances.resolve` | `BASE_AND_OPERATIONAL` | `G,AS,SS,AST,TST,AA,SA,AAT,ATW,CTX` | `G` | false | true | false | false | `N / T+C/REQUIRED` | `nexo.stock_count_variance.resolve.v1` | `sha256:bead9c0b4919c7625e98b0ef1436527ada91385456f802316347f2ebe5286b2c` |
| `origo.procurement.receipts.register` | `BASE_OR_OPERATIONAL` | `G,AS,SS,AST,TST,AA,SA,AAT,ATW,CTX` | `G` | false | true | false | false | `N / T+C/SITE_SUFFICIENT` | `origo.purchase_receipt.register.v1` | `sha256:f948fae1200f41d6cef2795db53f445f1b92f93680e0b43c5fb1acb886e853b6` |
| `pulso.cash.sessions.close` | `OPERATIONAL_ONLY` | `AS,SS,AST,AA,SA,AAT,CTX` | `AS` | false | true | false | false | `— / T+C/REQUIRED` | `pulso.cash_session.close.v1` | `sha256:f723acc83ecd1a34a96d9078b2a7cb1c67dd5f0f9c8b083fe56b7caeffa991e8` |
| `pulso.cash.sessions.start` | `OPERATIONAL_ONLY` | `AS,SS,AST,AA,SA,AAT,CTX` | `AS` | false | false | false | false | `— / T+C/REQUIRED` | `pulso.cash_session.start.v1` | `sha256:a200888e09de24d6680483c41ffc40a00671ae043475b785cc1f8a5e1db6006b` |
| `pulso.payments.transactions.collect` | `OPERATIONAL_ONLY` | `AS,SS,AST,AA,SA,AAT,CTX` | `AS` | false | true | false | false | `— / T+C/REQUIRED` | `pulso.payment_transaction.collect.v1` | `sha256:482dc1e001c841d4bb01a3042dde05216c2786d34c17547c9896dbfa04aafce9` |
| `pulso.payments.transactions.refund` | `BASE_AND_OPERATIONAL` | `G,AS,SS,AST,TST,AA,SA,AAT,ATW,CTX` | `G` | false | true | false | false | `N / T+C/REQUIRED` | `pulso.payment_refund.create.v1` | `sha256:e3e6f53812ee51022ecb85de0ab3a254e9a486fb31941c3bb1d82e796684b632` |
| `pulso.payments.transactions.reverse` | `BASE_AND_OPERATIONAL` | `G,AS,SS,AST,TST,AA,SA,AAT,ATW,CTX` | `G` | false | true | false | false | `N / T+C/REQUIRED` | `pulso.payment_transaction.reverse.v1` | `sha256:53d2af544cfd8de14a221c5457a302224b2a9ea2b1a02de0ab5773cdbe0e4f41` |
| `pulso.sales.discounts.apply` | `BASE_AND_OPERATIONAL` | `G,AS,SS,AST,TST,AA,SA,AAT,ATW,CTX` | `G` | false | true | false | false | `N / T+C/SITE_SUFFICIENT` | `pulso.discount_application.apply.v1` | `sha256:710ea6f1f37421f9c0c1ddd46ae83587964b160a8a5245f70a412685fefe65a7` |
| `pulso.sales.orders.cancel` | `BASE_AND_OPERATIONAL` | `G,AS,SS,AST,TST,AA,SA,AAT,ATW,CTX` | `G` | false | true | false | false | `N / T+C/SITE_SUFFICIENT` | `pulso.sale_order.cancel.v1` | `sha256:c52dbab78c2896690ac15cc1f127d4650348b844eda1cb5e622a58b1eb7b9100` |
| `pulso.sales.orders.create` | `OPERATIONAL_ONLY` | `AS,SS,AST,AA,SA,AAT,CTX` | `AS` | false | false | false | false | `— / T+C/SITE_SUFFICIENT` | `pulso.sale_order.create.v1` | `sha256:aa2242e13c244d249f08c4a709b7fc1d2416d05d22e01aaa60aabe5c26240dcc` |
| `pulso.sales.returns.create` | `BASE_AND_OPERATIONAL` | `G,AS,SS,AST,TST,AA,SA,AAT,ATW,CTX` | `G` | false | true | false | false | `N / T+C/SITE_SUFFICIENT` | `pulso.sale_return.create.v1` | `sha256:bef4f8e3f30905c404a596ae77d3fe079899d352d1d4c77b8253a09312d4ddd5` |
| `viso.authorization.base_grants.approve` | `BASE_ONLY` | `ORG` | `ORG` | false | true | false | true | `N / —` | `viso.base_grants.approve.v1` | `sha256:9e83fe92024fefa49e8974651c507d309d5a0d18b4262de7f4eaea6006032e4a` |
| `viso.authorization.base_grants.create` | `BASE_ONLY` | `ORG` | `ORG` | false | true | false | true | `N / —` | `viso.base_grants.create.v1` | `sha256:57b8eab60a9df626403b747dcba30ce3cce9031f55fa554d05c01ee95f2a457e` |
| `viso.authorization.base_grants.revoke` | `BASE_ONLY` | `ORG` | `ORG` | false | true | false | true | `N / —` | `viso.base_grants.revoke.v1` | `sha256:babe71f9954323b71e22a573125fbf7e77e0a97f40e6e0a460858a443a48f343` |
| `viso.authorization.base_grants.suspend` | `BASE_ONLY` | `ORG` | `ORG` | false | true | false | true | `N / —` | `viso.base_grants.suspend.v1` | `sha256:d1601789e57989f46d469053a8c5a34c65d656ff2759a30d4b1a9f17bfe4862c` |
| `viso.authorization.base_grants.view` | `BASE_ONLY` | `ORG` | `ORG` | false | true | false | true | `N / —` | `viso.base_grants.view.v1` | `sha256:002f43496b411336b652caf7bee8ba232d596671c27d245f44023c8fcc769211` |
| `viso.authorization.denials.approve` | `BASE_ONLY` | `ORG` | `ORG` | false | true | false | true | `N / —` | `viso.denials.approve.v1` | `sha256:a1859d923ac3d582c8cc7133d844dee257445b9be65d849eba9c0f212f7a7f8d` |
| `viso.authorization.denials.create` | `BASE_ONLY` | `ORG` | `ORG` | false | true | false | true | `N / —` | `viso.denials.create.v1` | `sha256:c9771ab1c2a1460d165226c503c7168311811dbf06dec98cd93e5d3c4e02e4f2` |
| `viso.authorization.denials.revoke` | `BASE_ONLY` | `ORG` | `ORG` | false | true | false | true | `N / —` | `viso.denials.revoke.v1` | `sha256:8c4429ec3a2c7586a0a10ba384c524ac01b96fd5ce9152850813181501f12465` |
| `viso.authorization.denials.view` | `BASE_ONLY` | `ORG` | `ORG` | false | true | false | true | `N / —` | `viso.denials.view.v1` | `sha256:ec5e73b4e557d9b020d481fa8d55f684b12009cc03717954bf7bc703a1a52f1a` |
| `viso.authorization.operational_grants.approve` | `BASE_ONLY` | `ORG` | `ORG` | false | true | false | true | `N / —` | `viso.operational_grants.approve.v1` | `sha256:6ffa1584ebf86cc58f812e0400a269a080aa12c04bc116ec2fae80f8717bd5cc` |
| `viso.authorization.operational_grants.create` | `BASE_ONLY` | `ORG` | `ORG` | false | true | false | true | `N / —` | `viso.operational_grants.create.v1` | `sha256:48879dfed7211e5132c9384cc86f2acd549d631740da2f32c69c2c9a81e5e08c` |
| `viso.authorization.operational_grants.revoke` | `BASE_ONLY` | `ORG` | `ORG` | false | true | false | true | `N / —` | `viso.operational_grants.revoke.v1` | `sha256:d323fb3309406a87a609834665fadf684ad494041d3a857cce641480fb597648` |
| `viso.authorization.operational_grants.suspend` | `BASE_ONLY` | `ORG` | `ORG` | false | true | false | true | `N / —` | `viso.operational_grants.suspend.v1` | `sha256:419e4057b34a625765d3635de3e4083ba61174ad88e33a35abfc976e64d753c4` |
| `viso.authorization.operational_grants.view` | `BASE_ONLY` | `ORG` | `ORG` | false | true | false | true | `N / —` | `viso.operational_grants.view.v1` | `sha256:7423f713debfa5aa00f9e4640071415280043c006a0dad99d79d1726568f7ceb` |

Los perfiles de la tabla son normativos. `maximum_scope` siempre pertenece a `allowed_scopes`. `allows_cross_site_relation = true` se limita a las tres acciones logísticas de remisión porque una misma remisión relaciona origen, custodia/ruta y destino. Ninguna otra mutación de este diff puede usar una relación multisede como bypass.

---

#### 8. Contratos completos de recurso

| resource_contract_id | resource_type | required_sides | subject_resolver | territory_resolver | state_predicate | concurrency_policy | field_policy_id | audit_policy_id | resource_contract_hash |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `nexo.remission.accept_custody.v1` | `REMISSION` | `ORIGIN,CUSTODY` | `ASSIGNED_LOGISTICS_ACTOR` | `REMISSION_ORIGIN_AND_ASSIGNED_CUSTODY_RELATION` | `REMISSION_PREPARED_AND_ASSIGNED` | `EXPECTED_VERSION_AND_ROW_LOCK` | `nexo.remission.accept_custody.fields.v1` | `audit.custody_mutation.v1` | `sha256:2a33e61fce68df643bb8f9a492ac159fa36e4ebc0a1b5dea081b574c2a46657c` |
| `nexo.remission.deliver.v1` | `REMISSION` | `CUSTODY,ROUTE,DESTINATION` | `ASSIGNED_LOGISTICS_ACTOR_AND_IDENTIFIED_RECEIVER` | `REMISSION_CUSTODY_ROUTE_AND_DESTINATION_RELATION` | `REMISSION_IN_TRANSIT_AND_DESTINATION_VALID` | `EXPECTED_VERSION_AND_ROW_LOCK` | `nexo.remission.deliver.fields.v1` | `audit.custody_mutation.v1` | `sha256:6e2b931941fa365c138a633411ab57e40ebd0708ad9a94bade4a97de4d9ac508` |
| `nexo.remission.start_transit.v1` | `REMISSION` | `ORIGIN,CUSTODY,ROUTE` | `ASSIGNED_LOGISTICS_ACTOR` | `REMISSION_ORIGIN_CUSTODY_AND_ROUTE_RELATION` | `REMISSION_CUSTODY_ACCEPTED_AND_ROUTE_VALID` | `EXPECTED_VERSION_AND_ROW_LOCK` | `nexo.remission.start_transit.fields.v1` | `audit.custody_mutation.v1` | `sha256:fd73a8792fe244d55d920b1405fc68b57e9cbb1854607c1edad279b93a46656c` |
| `nexo.stock_count_variance.approve.v1` | `STOCK_COUNT_VARIANCE` | `COUNT_SITE` | `EFFECTIVE_ACTOR_WITH_CAPTURE_SEGREGATION` | `STOCK_COUNT_SITE_AND_AREA` | `VARIANCE_APPROVABLE_AND_SEGREGATION_VALID` | `EXPECTED_VERSION_AND_ROW_LOCK` | `nexo.stock_count_variance.approve.fields.v1` | `audit.dual_lane_sensitive_mutation.v1` | `sha256:9ea1755dd696f959c138c726dfc1d34d47b72d92bd3960e4a4b7564cf92af596` |
| `nexo.stock_count_variance.resolve.v1` | `STOCK_COUNT_VARIANCE` | `COUNT_SITE` | `EFFECTIVE_ACTOR_WITH_CAPTURE_SEGREGATION` | `STOCK_COUNT_SITE_AND_AREA` | `VARIANCE_RESOLVABLE_AND_SEGREGATION_VALID` | `EXPECTED_VERSION_AND_ROW_LOCK` | `nexo.stock_count_variance.resolve.fields.v1` | `audit.dual_lane_sensitive_mutation.v1` | `sha256:1f182b5d2b1e4a0199554845f1d4e20de39ba3b870c6bcd02bd5ac481d75203e` |
| `origo.purchase_receipt.register.v1` | `PURCHASE_RECEIPT_DRAFT` | `RECEIVING_SITE` | `EFFECTIVE_ACTOR` | `PURCHASE_ORDER_AND_RECEIVING_SITE` | `PURCHASE_ORDER_RECEIVABLE` | `IDEMPOTENCY_KEY` | `origo.purchase_receipt.register.fields.v1` | `audit.sensitive_mutation.v1` | `sha256:a5cc1456c8fbbf11b6d5ee7dbe747d579b59aee7979f541b8201ac434160f3b5` |
| `pulso.cash_session.close.v1` | `CASH_SESSION` | `CASH_SESSION_SITE` | `EFFECTIVE_ACTOR_AND_EXPLICIT_CASH_SESSION_ASSIGNMENT` | `CASH_SESSION_SITE_AND_AREA` | `CASH_SESSION_OPEN_AND_CLOSABLE` | `EXPECTED_VERSION_AND_ROW_LOCK` | `pulso.cash_session.close.fields.v1` | `audit.sensitive_mutation.v1` | `sha256:ed788bf96af86aee9c1533dd8f4e2fa89b0deb2961695f5bf7a6f04598ed9e20` |
| `pulso.cash_session.start.v1` | `CASH_SESSION_DRAFT` | `CASH_POINT_SITE` | `EFFECTIVE_ACTOR` | `CASH_POINT_SITE_AND_AREA` | `NO_INCOMPATIBLE_OPEN_CASH_SESSION` | `IDEMPOTENCY_KEY` | `pulso.cash_session.start.fields.v1` | `audit.sensitive_mutation.v1` | `sha256:2a8e1035e2e76faea5571cdfc0a338833212797a6b5028532cb4b854d4f96c19` |
| `pulso.discount_application.apply.v1` | `DISCOUNT_APPLICATION` | `ORDER_SITE` | `EFFECTIVE_ACTOR` | `SALE_ORDER_SITE` | `ORDER_DISCOUNTABLE_AND_RULE_APPLICABLE` | `EXPECTED_VERSION_AND_ROW_LOCK` | `pulso.discount_application.apply.fields.v1` | `audit.dual_lane_sensitive_mutation.v1` | `sha256:f401d19344886c44d7b4127eea6d0eb439c51a218f877df57a5c0e8ed9e29187` |
| `pulso.payment_refund.create.v1` | `PAYMENT_REFUND_DRAFT` | `PAYMENT_SITE,RETURN_OR_RESOLUTION_SITE` | `EFFECTIVE_ACTOR` | `INTERSECTION_OF_PAYMENT_AND_RESOLUTION_TERRITORY` | `PAYMENT_REFUNDABLE_AND_AMOUNT_WITHIN_BALANCE` | `IDEMPOTENCY_KEY` | `pulso.payment_refund.create.fields.v1` | `audit.dual_lane_sensitive_mutation.v1` | `sha256:9868adc18563938a50c622b60305dd82c75ca9dd23d8ee239809a8a98b8795a2` |
| `pulso.payment_transaction.collect.v1` | `PAYMENT_TRANSACTION_DRAFT` | `ORDER_SITE,CASH_SESSION_SITE` | `EFFECTIVE_ACTOR_AND_CASH_SESSION_ATTRIBUTION` | `INTERSECTION_OF_ORDER_AND_CASH_SESSION_TERRITORY` | `ORDER_COLLECTIBLE_AND_CASH_SESSION_OPEN` | `IDEMPOTENCY_KEY` | `pulso.payment_transaction.collect.fields.v1` | `audit.sensitive_mutation.v1` | `sha256:64979f0f675aab10ab85a7ed63d6705ca862768db40d946b2c4e107c7f400176` |
| `pulso.payment_transaction.reverse.v1` | `PAYMENT_TRANSACTION` | `PAYMENT_SITE` | `EFFECTIVE_ACTOR` | `PAYMENT_TRANSACTION_SITE` | `PAYMENT_REVERSIBLE` | `EXPECTED_VERSION_AND_ROW_LOCK` | `pulso.payment_transaction.reverse.fields.v1` | `audit.dual_lane_sensitive_mutation.v1` | `sha256:776e74bbdc4c8ee591f39fe09d78a9c31b07773f9c8665631396dbf5c703494b` |
| `pulso.sale_order.cancel.v1` | `SALE_ORDER` | `ORDER_SITE` | `EFFECTIVE_ACTOR` | `SALE_ORDER_SITE` | `ORDER_CANCELABLE` | `EXPECTED_VERSION_AND_ROW_LOCK` | `pulso.sale_order.cancel.fields.v1` | `audit.dual_lane_sensitive_mutation.v1` | `sha256:d90a571ab3dae3aabfe45a6a28e0d0bc6930b891634e6624e6117f6efdfc935c` |
| `pulso.sale_order.create.v1` | `SALE_ORDER_DRAFT` | `TARGET_SITE` | `EFFECTIVE_ACTOR` | `TARGET_SITE_AND_OPTIONAL_AREA_FROM_DRAFT` | `COMMERCIAL_CONTEXT_VALID_AND_ORDER_DRAFT_CREATABLE` | `IDEMPOTENCY_KEY` | `pulso.sale_order.create.fields.v1` | `audit.operational_mutation.v1` | `sha256:bb0c016241e53fdd45e45869da89a89b10bc3c998a6af3e0ecb128ffd7df792b` |
| `pulso.sale_return.create.v1` | `SALE_RETURN_DRAFT` | `ORDER_SITE` | `EFFECTIVE_ACTOR` | `SALE_ORDER_SITE` | `ORDER_LINES_RETURNABLE` | `IDEMPOTENCY_KEY` | `pulso.sale_return.create.fields.v1` | `audit.dual_lane_sensitive_mutation.v1` | `sha256:9f9ebc31d231ea5a424e323e8d971a1ba90500d3ff240b44a0c15ae149a2ecdf` |
| `viso.base_grants.approve.v1` | `INDIVIDUAL_BASE_GRANT` | `ORGANIZATION,TARGET_SUBJECT,TARGET_PERMISSION_SCOPE` | `EFFECTIVE_ADMIN_ACTOR_AND_TARGET_EMPLOYEE` | `ORGANIZATIONAL_GOVERNANCE_RECORD_WITH_TARGET_SCOPE_VALIDATION` | `PROPOSAL_PENDING_AND_SEGREGATION_VALID` | `EXPECTED_VERSION_AND_ROW_LOCK` | `viso.base_grants.approve.fields.v1` | `audit.authorization_governance_mutation.v1` | `sha256:f9aac6a5629a5be67a731d142d4f4d2756e68e2d0aaec8975d4b9a5b61dbfb76` |
| `viso.base_grants.create.v1` | `INDIVIDUAL_BASE_GRANT` | `ORGANIZATION,TARGET_SUBJECT,TARGET_PERMISSION_SCOPE` | `EFFECTIVE_ADMIN_ACTOR_AND_TARGET_EMPLOYEE` | `ORGANIZATIONAL_GOVERNANCE_RECORD_WITH_TARGET_SCOPE_VALIDATION` | `TARGET_PERMISSION_AND_SCOPE_VALID_AND_PROPOSABLE` | `IDEMPOTENCY_KEY` | `viso.base_grants.create.fields.v1` | `audit.authorization_governance_mutation.v1` | `sha256:39e636d749b6d1ef8f188fd2c90ab1a3034a3b7344da3c2388252631365d76e6` |
| `viso.base_grants.revoke.v1` | `INDIVIDUAL_BASE_GRANT` | `ORGANIZATION,TARGET_SUBJECT,TARGET_PERMISSION_SCOPE` | `EFFECTIVE_ADMIN_ACTOR_AND_TARGET_EMPLOYEE` | `ORGANIZATIONAL_GOVERNANCE_RECORD_WITH_TARGET_SCOPE_VALIDATION` | `RECORD_ACTIVE_OR_SUSPENDED_AND_REVOCABLE` | `EXPECTED_VERSION_AND_ROW_LOCK` | `viso.base_grants.revoke.fields.v1` | `audit.authorization_governance_mutation.v1` | `sha256:35e6e0e1cea57b0b76ecf6e611840d8e9f69db93f776b87c44a70c5ee81a68ec` |
| `viso.base_grants.suspend.v1` | `INDIVIDUAL_BASE_GRANT` | `ORGANIZATION,TARGET_SUBJECT,TARGET_PERMISSION_SCOPE` | `EFFECTIVE_ADMIN_ACTOR_AND_TARGET_EMPLOYEE` | `ORGANIZATIONAL_GOVERNANCE_RECORD_WITH_TARGET_SCOPE_VALIDATION` | `POSITIVE_GRANT_ACTIVE_AND_SUSPENDABLE` | `EXPECTED_VERSION_AND_ROW_LOCK` | `viso.base_grants.suspend.fields.v1` | `audit.authorization_governance_mutation.v1` | `sha256:7ba7a961db49ad02da25f85f8349d9d8f23cdb4e895f4296f8a57004ced1f424` |
| `viso.base_grants.view.v1` | `INDIVIDUAL_BASE_GRANT` | `ORGANIZATION,TARGET_SUBJECT,TARGET_PERMISSION_SCOPE` | `EFFECTIVE_ADMIN_ACTOR_AND_TARGET_EMPLOYEE` | `ORGANIZATIONAL_GOVERNANCE_RECORD_WITH_TARGET_SCOPE_VALIDATION` | `RECORD_VISIBLE_WITHIN_AUTHORIZATION_GOVERNANCE_SCOPE` | `CONSISTENT_SNAPSHOT_READ` | `viso.base_grants.view.fields.v1` | `audit.authorization_governance_read.v1` | `sha256:44f5e4e6ec9bfeb92bbeca987e816a2dd60d0133eeaa51713400ae30a22b880c` |
| `viso.denials.approve.v1` | `INDIVIDUAL_DENIAL` | `ORGANIZATION,TARGET_SUBJECT,TARGET_PERMISSION_SCOPE` | `EFFECTIVE_ADMIN_ACTOR_AND_TARGET_EMPLOYEE` | `ORGANIZATIONAL_GOVERNANCE_RECORD_WITH_TARGET_SCOPE_VALIDATION` | `PROPOSAL_PENDING_AND_SEGREGATION_VALID` | `EXPECTED_VERSION_AND_ROW_LOCK` | `viso.denials.approve.fields.v1` | `audit.authorization_governance_mutation.v1` | `sha256:157b2599016b489faff28fd32048722a91d681e5ea9e110a96cbcc2b72979e6e` |
| `viso.denials.create.v1` | `INDIVIDUAL_DENIAL` | `ORGANIZATION,TARGET_SUBJECT,TARGET_PERMISSION_SCOPE` | `EFFECTIVE_ADMIN_ACTOR_AND_TARGET_EMPLOYEE` | `ORGANIZATIONAL_GOVERNANCE_RECORD_WITH_TARGET_SCOPE_VALIDATION` | `TARGET_PERMISSION_AND_SCOPE_VALID_AND_PROPOSABLE` | `IDEMPOTENCY_KEY` | `viso.denials.create.fields.v1` | `audit.authorization_governance_mutation.v1` | `sha256:84370ebbf30124856571ef0522e5b6b5bcfdcc2b7f36ecbf8d777e21fb90e2da` |
| `viso.denials.revoke.v1` | `INDIVIDUAL_DENIAL` | `ORGANIZATION,TARGET_SUBJECT,TARGET_PERMISSION_SCOPE` | `EFFECTIVE_ADMIN_ACTOR_AND_TARGET_EMPLOYEE` | `ORGANIZATIONAL_GOVERNANCE_RECORD_WITH_TARGET_SCOPE_VALIDATION` | `RECORD_ACTIVE_OR_SUSPENDED_AND_REVOCABLE` | `EXPECTED_VERSION_AND_ROW_LOCK` | `viso.denials.revoke.fields.v1` | `audit.authorization_governance_mutation.v1` | `sha256:087f25649d77a67214d7514210138796daeefd641f02c8364d12b6c2cc510df1` |
| `viso.denials.view.v1` | `INDIVIDUAL_DENIAL` | `ORGANIZATION,TARGET_SUBJECT,TARGET_PERMISSION_SCOPE` | `EFFECTIVE_ADMIN_ACTOR_AND_TARGET_EMPLOYEE` | `ORGANIZATIONAL_GOVERNANCE_RECORD_WITH_TARGET_SCOPE_VALIDATION` | `RECORD_VISIBLE_WITHIN_AUTHORIZATION_GOVERNANCE_SCOPE` | `CONSISTENT_SNAPSHOT_READ` | `viso.denials.view.fields.v1` | `audit.authorization_governance_read.v1` | `sha256:7822522e23e06028d420c7ddc0f2f1e2d6c69aae4a9c2a98701ee4aedb3b25d2` |
| `viso.operational_grants.approve.v1` | `INDIVIDUAL_OPERATIONAL_GRANT` | `ORGANIZATION,TARGET_SUBJECT,TARGET_PERMISSION_SCOPE` | `EFFECTIVE_ADMIN_ACTOR_AND_TARGET_EMPLOYEE` | `ORGANIZATIONAL_GOVERNANCE_RECORD_WITH_TARGET_SCOPE_VALIDATION` | `PROPOSAL_PENDING_AND_SEGREGATION_VALID` | `EXPECTED_VERSION_AND_ROW_LOCK` | `viso.operational_grants.approve.fields.v1` | `audit.authorization_governance_mutation.v1` | `sha256:029573dacc9d59f067f0c1b5602b09f987f2f9a60851758c9f81b009ea0ee8e8` |
| `viso.operational_grants.create.v1` | `INDIVIDUAL_OPERATIONAL_GRANT` | `ORGANIZATION,TARGET_SUBJECT,TARGET_PERMISSION_SCOPE` | `EFFECTIVE_ADMIN_ACTOR_AND_TARGET_EMPLOYEE` | `ORGANIZATIONAL_GOVERNANCE_RECORD_WITH_TARGET_SCOPE_VALIDATION` | `TARGET_PERMISSION_AND_SCOPE_VALID_AND_PROPOSABLE` | `IDEMPOTENCY_KEY` | `viso.operational_grants.create.fields.v1` | `audit.authorization_governance_mutation.v1` | `sha256:da17058c53f42abe9c838c85d5c37ea4aba140ea3f2604f50a734fa2e242bb8c` |
| `viso.operational_grants.revoke.v1` | `INDIVIDUAL_OPERATIONAL_GRANT` | `ORGANIZATION,TARGET_SUBJECT,TARGET_PERMISSION_SCOPE` | `EFFECTIVE_ADMIN_ACTOR_AND_TARGET_EMPLOYEE` | `ORGANIZATIONAL_GOVERNANCE_RECORD_WITH_TARGET_SCOPE_VALIDATION` | `RECORD_ACTIVE_OR_SUSPENDED_AND_REVOCABLE` | `EXPECTED_VERSION_AND_ROW_LOCK` | `viso.operational_grants.revoke.fields.v1` | `audit.authorization_governance_mutation.v1` | `sha256:3c51f51390508b8d41853e47ef25c6755b45efaf12fe83846ff4fff13fb1a2c8` |
| `viso.operational_grants.suspend.v1` | `INDIVIDUAL_OPERATIONAL_GRANT` | `ORGANIZATION,TARGET_SUBJECT,TARGET_PERMISSION_SCOPE` | `EFFECTIVE_ADMIN_ACTOR_AND_TARGET_EMPLOYEE` | `ORGANIZATIONAL_GOVERNANCE_RECORD_WITH_TARGET_SCOPE_VALIDATION` | `POSITIVE_GRANT_ACTIVE_AND_SUSPENDABLE` | `EXPECTED_VERSION_AND_ROW_LOCK` | `viso.operational_grants.suspend.fields.v1` | `audit.authorization_governance_mutation.v1` | `sha256:ac26d2e51ef62da7eac7816ae76fa8bd0b4b79faa974b8b90ad05a9066a8963e` |
| `viso.operational_grants.view.v1` | `INDIVIDUAL_OPERATIONAL_GRANT` | `ORGANIZATION,TARGET_SUBJECT,TARGET_PERMISSION_SCOPE` | `EFFECTIVE_ADMIN_ACTOR_AND_TARGET_EMPLOYEE` | `ORGANIZATIONAL_GOVERNANCE_RECORD_WITH_TARGET_SCOPE_VALIDATION` | `RECORD_VISIBLE_WITHIN_AUTHORIZATION_GOVERNANCE_SCOPE` | `CONSISTENT_SNAPSHOT_READ` | `viso.operational_grants.view.fields.v1` | `audit.authorization_governance_read.v1` | `sha256:80c22f6f5654b4ba0b732f48b5692650882401015ebe27366e5ca7dbc57399cb` |

Reglas comunes:

1. `ownership_resolver = NONE` para los 29 contratos. La autoría, atribución o custodia puede ser condición del recurso, pero no concede por sí sola un `OWN` implícito.
2. Los resultados de resolución admitidos son exactamente `RESOLVED`, `MULTI_RESOLVED`, `NOT_APPLICABLE`, `UNRESOLVED`, `CONFLICT`, `ISOLATED`.
3. `UNRESOLVED`, `CONFLICT` o un contrato ausente fallan cerrado.
4. `field_policy` prohíbe silenciosamente ampliar campos mutables; un campo solicitado fuera de la política causa denegación o error contractual, nunca eliminación silenciosa.
5. `audit_policy` exige identidad humana atribuible, permiso exacto, recurso, versión contractual, decisión y tiempo. Los perfiles sensibles agregan motivo, evidencia, reautenticación y antes/después cuando corresponde.
6. Ningún par de acciones distintas comparte `resource_contract_id`.
7. Las razones de bloqueo se limitan al catálogo cerrado de `AuthorizationReasonCode`; no se inventan strings locales.

---

#### 9. Invariantes específicas por dominio

##### PULSO

- `orders.create` no cobra ni aplica descuentos.
- `collect`, `reverse` y `refund` son capacidades distintas.
- `cash.sessions.start` y `cash.sessions.close` son capacidades distintas.
- `orders.cancel`, `returns.create` y `refund` no se sustituyen mutuamente.
- ningún efecto de inventario o producción ocurre por implicación.
- las cinco acciones `BASE_AND_OPERATIONAL` exigen el mismo actor, reautenticación fuerte y recurso compatible.

##### NEXO

- capturar, aprobar, resolver y ajustar una diferencia son acciones distintas;
- aprobación y resolución respetan segregación respecto del capturador cuando aplique;
- `accept_custody`, `start_transit`, `deliver` y `receive` son acciones distintas;
- `deliver` registra handoff del transportador y nunca confirma recepción del destino;
- `dispatch` no reaparece como alias ni como fallback.

##### ORIGO

- `receipts.register` registra recepción comercial;
- no crea stock;
- no sustituye la entrada física propietaria de NEXO;
- una recepción concreta tiene una sede receptora resoluble.

##### VISO

- `create` genera propuesta no activa;
- `approve` exige propuesta pendiente y segregación;
- el afectado no aprueba su propio registro;
- un actor no crea una concesión a su favor;
- `suspend` aplica solo a concesiones positivas;
- `revoke` conserva historial;
- revocar una denegación no concede un allow;
- ninguna clave administra matrices, catálogo o dispositivos;
- no existen wildcards ni herencia desde `viso.staff.permissions.manage`.

---

#### 10. Payload contractual canónico de `vento.authorization@1.1.0`

El siguiente bloque JSONL es la fuente documental reproducible del delta contractual. Está ordenado por `permission_key` y luego por `resource_contract_id`.

Algoritmo de huella:

1. codificación UTF-8;
2. terminadores LF;
3. cada línea es JSON canónico con claves ordenadas y sin espacios;
4. se conserva exactamente un LF final;
5. SHA-256 sobre todos los bytes del bloque, sin incluir los fences Markdown.

```jsonl
{"active_permission_keyset_changed":false,"added_resource_contract_count":29,"application_count":10,"base_release_hash":"sha256:687e1bc19c0cf7332e76ed940cf5a23b829492ebbee399af718fd326cf473cbe","catalog_id":"vento.authorization","catalog_version":"1.1.0","changed_permission_contract_count":29,"compatibility":{"authorization_modalities":"UNCHANGED_FROM_1.0.0","grant_assignments":"UNCHANGED","minimum_consumer_major":1,"permission_key_union":"UNCHANGED_FROM_1.0.0","schema_major":1},"permission_count":140,"physical_publication_status":"NOT_EXECUTED","publication_kind":"CONTRACTUAL_ONLY","record_type":"release_header","schema_version":"1.0.0","source_correction":"AUTH-CAT-024::CORR-001","source_tasks":["AUTH-CAT-011","AUTH-CAT-016","AUTH-CAT-017","AUTH-CAT-022","AUTH-CAT-023","AUTH-CAT-024","AUTH-CAT-025"],"status":"published","supersedes":"1.0.0"}
{"action_code":"accept_custody","aliases":[],"allowed_scopes":["AS","SS","AST","AA","SA","AAT","CTX"],"allows_cross_site_relation":true,"allows_organizational_non_territorial":false,"allows_own_resource":false,"allows_third_party_resource":true,"app_code":"nexo","audit_policy_id":"audit.custody_mutation.v1","authorization_requirement":"OPERATIONAL_ONLY","base_lane":null,"consumer_notes":"Forma parte del split de dispatch; no existe alias uno-a-muchos.","contract_hash":"sha256:cecf77209928b41ac23587832d45e3d5ad3a1ae0c01f3084cfec4b9b315a18b6","deprecated_in":null,"field_policy_id":"nexo.remission.accept_custody.fields.v1","human_description":"Confirmar que el conductor o actor logístico asignado recibe físicamente la carga preparada bajo cantidades y bultos declarados.","human_group":"Remisiones","human_label":"Aceptar custodia de una remisión","human_locale":"es-CO","human_sort_order":200,"introduced_in":"1.0.0","is_configuration":false,"is_operational":true,"is_read_only":false,"is_sensitive":true,"lifecycle_status":"active","maximum_scope":"AS","module_code":"inventory","operational_lane":{"area_requirement":"SITE_SUFFICIENT","requires_checkin":true,"requires_shift":true},"permission_key":"nexo.inventory.remissions.accept_custody","record_type":"permission_contract","replaced_by":[],"replaces":[],"required_sides":["ORIGIN","CUSTODY"],"requires_strong_reauthentication":false,"resolution_mode":"MULTI_SIDE_RESOURCE","resource_code":"remissions","resource_contract_id":"nexo.remission.accept_custody.v1","resource_type":"REMISSION","retired_in":null,"sensitivity_reason":"CUSTODY_CONFIRMATION","shared_device_mode":"STANDARD_ACTOR_SESSION","simulation_mode":"FULL_PREVIEW"}
{"action_code":"deliver","aliases":[],"allowed_scopes":["AS","SS","AST","AA","SA","AAT","CTX"],"allows_cross_site_relation":true,"allows_organizational_non_territorial":false,"allows_own_resource":false,"allows_third_party_resource":true,"app_code":"nexo","audit_policy_id":"audit.custody_mutation.v1","authorization_requirement":"OPERATIONAL_ONLY","base_lane":null,"consumer_notes":"deliver no concede nexo.inventory.remissions.receive.","contract_hash":"sha256:973df08c36cb005d6ce6cdd78f7b4b568d619e09fb2ed7a8d5cbc22eb81efce4","deprecated_in":null,"field_policy_id":"nexo.remission.deliver.fields.v1","human_description":"Registrar el handoff físico de una remisión en tránsito a un receptor autorizado del destino.","human_group":"Remisiones","human_label":"Registrar entrega física de una remisión","human_locale":"es-CO","human_sort_order":220,"introduced_in":"1.0.0","is_configuration":false,"is_operational":true,"is_read_only":false,"is_sensitive":true,"lifecycle_status":"active","maximum_scope":"AS","module_code":"inventory","operational_lane":{"area_requirement":"SITE_SUFFICIENT","requires_checkin":true,"requires_shift":true},"permission_key":"nexo.inventory.remissions.deliver","record_type":"permission_contract","replaced_by":[],"replaces":[],"required_sides":["CUSTODY","ROUTE","DESTINATION"],"requires_strong_reauthentication":false,"resolution_mode":"MULTI_SIDE_RESOURCE","resource_code":"remissions","resource_contract_id":"nexo.remission.deliver.v1","resource_type":"REMISSION","retired_in":null,"sensitivity_reason":"CUSTODY_CONFIRMATION","shared_device_mode":"STANDARD_ACTOR_SESSION","simulation_mode":"FULL_PREVIEW"}
{"action_code":"start_transit","aliases":[],"allowed_scopes":["AS","SS","AST","AA","SA","AAT","CTX"],"allows_cross_site_relation":true,"allows_organizational_non_territorial":false,"allows_own_resource":false,"allows_third_party_resource":true,"app_code":"nexo","audit_policy_id":"audit.custody_mutation.v1","authorization_requirement":"OPERATIONAL_ONLY","base_lane":null,"consumer_notes":"Forma parte del split de dispatch; requiere aceptación de custodia previa.","contract_hash":"sha256:81076a4342fe11f8d0f9e1eefbf0bc63868e3d6d84cb731a763e26123fa7c045","deprecated_in":null,"field_policy_id":"nexo.remission.start_transit.fields.v1","human_description":"Iniciar el tránsito de una remisión cuya custodia ya fue aceptada por el actor y cuya ruta o destino son válidos.","human_group":"Remisiones","human_label":"Iniciar tránsito de una remisión","human_locale":"es-CO","human_sort_order":210,"introduced_in":"1.0.0","is_configuration":false,"is_operational":true,"is_read_only":false,"is_sensitive":true,"lifecycle_status":"active","maximum_scope":"AS","module_code":"inventory","operational_lane":{"area_requirement":"SITE_SUFFICIENT","requires_checkin":true,"requires_shift":true},"permission_key":"nexo.inventory.remissions.start_transit","record_type":"permission_contract","replaced_by":[],"replaces":[],"required_sides":["ORIGIN","CUSTODY","ROUTE"],"requires_strong_reauthentication":false,"resolution_mode":"MULTI_SIDE_RESOURCE","resource_code":"remissions","resource_contract_id":"nexo.remission.start_transit.v1","resource_type":"REMISSION","retired_in":null,"sensitivity_reason":"CUSTODY_CONFIRMATION","shared_device_mode":"STANDARD_ACTOR_SESSION","simulation_mode":"FULL_PREVIEW"}
{"action_code":"approve","aliases":[],"allowed_scopes":["G","AS","SS","AST","TST","AA","SA","AAT","ATW","CTX"],"allows_cross_site_relation":false,"allows_organizational_non_territorial":false,"allows_own_resource":false,"allows_third_party_resource":true,"app_code":"nexo","audit_policy_id":"audit.dual_lane_sensitive_mutation.v1","authorization_requirement":"BASE_AND_OPERATIONAL","base_lane":{"requires_checkin":false,"requires_shift":false},"consumer_notes":"Capturar, aprobar, resolver y ajustar permanecen capacidades separadas.","contract_hash":"sha256:f445bd4e9df565f02033321f2664971a3e1840283c1f893cbb4829a2e7e293a6","deprecated_in":null,"field_policy_id":"nexo.stock_count_variance.approve.fields.v1","human_description":"Aprobar una diferencia capturada en un conteo de inventario, sin resolverla ni aplicar un ajuste por implicación.","human_group":"Diferencias de inventario","human_label":"Aprobar diferencias de conteo","human_locale":"es-CO","human_sort_order":100,"introduced_in":"1.0.0","is_configuration":false,"is_operational":true,"is_read_only":false,"is_sensitive":true,"lifecycle_status":"active","maximum_scope":"G","module_code":"inventory","operational_lane":{"area_requirement":"REQUIRED","requires_checkin":true,"requires_shift":true},"permission_key":"nexo.inventory.stock_count_variances.approve","record_type":"permission_contract","replaced_by":[],"replaces":[],"required_sides":["COUNT_SITE"],"requires_strong_reauthentication":true,"resolution_mode":"EXISTING_RESOURCE_TERRITORY","resource_code":"stock_count_variances","resource_contract_id":"nexo.stock_count_variance.approve.v1","resource_type":"STOCK_COUNT_VARIANCE","retired_in":null,"sensitivity_reason":"INVENTORY_INTEGRITY","shared_device_mode":"STRONG_REAUTH_REQUIRED","simulation_mode":"DECISION_ONLY"}
{"action_code":"resolve","aliases":[],"allowed_scopes":["G","AS","SS","AST","TST","AA","SA","AAT","ATW","CTX"],"allows_cross_site_relation":false,"allows_organizational_non_territorial":false,"allows_own_resource":false,"allows_third_party_resource":true,"app_code":"nexo","audit_policy_id":"audit.dual_lane_sensitive_mutation.v1","authorization_requirement":"BASE_AND_OPERATIONAL","base_lane":{"requires_checkin":false,"requires_shift":false},"consumer_notes":"La resolución no ejecuta inventory.adjustments.register por implicación.","contract_hash":"sha256:bead9c0b4919c7625e98b0ef1436527ada91385456f802316347f2ebe5286b2c","deprecated_in":null,"field_policy_id":"nexo.stock_count_variance.resolve.fields.v1","human_description":"Registrar la resolución documentada de una diferencia aprobable o aprobada, indicando tratamiento y evidencia.","human_group":"Diferencias de inventario","human_label":"Resolver diferencias de conteo","human_locale":"es-CO","human_sort_order":110,"introduced_in":"1.0.0","is_configuration":false,"is_operational":true,"is_read_only":false,"is_sensitive":true,"lifecycle_status":"active","maximum_scope":"G","module_code":"inventory","operational_lane":{"area_requirement":"REQUIRED","requires_checkin":true,"requires_shift":true},"permission_key":"nexo.inventory.stock_count_variances.resolve","record_type":"permission_contract","replaced_by":[],"replaces":[],"required_sides":["COUNT_SITE"],"requires_strong_reauthentication":true,"resolution_mode":"EXISTING_RESOURCE_TERRITORY","resource_code":"stock_count_variances","resource_contract_id":"nexo.stock_count_variance.resolve.v1","resource_type":"STOCK_COUNT_VARIANCE","retired_in":null,"sensitivity_reason":"INVENTORY_INTEGRITY","shared_device_mode":"STRONG_REAUTH_REQUIRED","simulation_mode":"DECISION_ONLY"}
{"action_code":"register","aliases":[],"allowed_scopes":["G","AS","SS","AST","TST","AA","SA","AAT","ATW","CTX"],"allows_cross_site_relation":false,"allows_organizational_non_territorial":false,"allows_own_resource":false,"allows_third_party_resource":true,"app_code":"origo","audit_policy_id":"audit.sensitive_mutation.v1","authorization_requirement":"BASE_OR_OPERATIONAL","base_lane":{"requires_checkin":false,"requires_shift":false},"consumer_notes":"ORIGO registra recepción comercial; NEXO conserva ownership de la entrada física de inventario.","contract_hash":"sha256:f948fae1200f41d6cef2795db53f445f1b92f93680e0b43c5fb1acb886e853b6","deprecated_in":null,"field_policy_id":"origo.purchase_receipt.register.fields.v1","human_description":"Registrar formalmente la recepción comercial de una orden de compra, proveedor, documento y cantidades recibidas para una sede receptora autorizada.","human_group":"Recepciones de compra","human_label":"Registrar recepciones de compra","human_locale":"es-CO","human_sort_order":100,"introduced_in":"1.0.0","is_configuration":false,"is_operational":true,"is_read_only":false,"is_sensitive":true,"lifecycle_status":"active","maximum_scope":"G","module_code":"procurement","operational_lane":{"area_requirement":"SITE_SUFFICIENT","requires_checkin":true,"requires_shift":true},"permission_key":"origo.procurement.receipts.register","record_type":"permission_contract","replaced_by":[],"replaces":[],"required_sides":["RECEIVING_SITE"],"requires_strong_reauthentication":false,"resolution_mode":"DRAFT_TARGET_TERRITORY","resource_code":"receipts","resource_contract_id":"origo.purchase_receipt.register.v1","resource_type":"PURCHASE_RECEIPT_DRAFT","retired_in":null,"sensitivity_reason":"COMMERCIAL_CONFIDENTIALITY | INVENTORY_INTEGRITY","shared_device_mode":"STANDARD_ACTOR_SESSION","simulation_mode":"FULL_PREVIEW"}
{"action_code":"close","aliases":[],"allowed_scopes":["AS","SS","AST","AA","SA","AAT","CTX"],"allows_cross_site_relation":false,"allows_organizational_non_territorial":false,"allows_own_resource":false,"allows_third_party_resource":true,"app_code":"pulso","audit_policy_id":"audit.sensitive_mutation.v1","authorization_requirement":"OPERATIONAL_ONLY","base_lane":null,"consumer_notes":"Cerrar no concede aprobar diferencias ni corregir movimientos.","contract_hash":"sha256:f723acc83ecd1a34a96d9078b2a7cb1c67dd5f0f9c8b083fe56b7caeffa991e8","deprecated_in":null,"field_policy_id":"pulso.cash_session.close.fields.v1","human_description":"Cerrar la sesión de caja propia o expresamente asignada, registrando conteos y diferencias exigidas.","human_group":"Caja","human_label":"Cerrar sesión de caja","human_locale":"es-CO","human_sort_order":310,"introduced_in":"1.0.0","is_configuration":false,"is_operational":true,"is_read_only":false,"is_sensitive":true,"lifecycle_status":"active","maximum_scope":"AS","module_code":"cash","operational_lane":{"area_requirement":"REQUIRED","requires_checkin":true,"requires_shift":true},"permission_key":"pulso.cash.sessions.close","record_type":"permission_contract","replaced_by":[],"replaces":[],"required_sides":["CASH_SESSION_SITE"],"requires_strong_reauthentication":false,"resolution_mode":"EXISTING_RESOURCE_TERRITORY","resource_code":"sessions","resource_contract_id":"pulso.cash_session.close.v1","resource_type":"CASH_SESSION","retired_in":null,"sensitivity_reason":"FINANCIAL_DATA","shared_device_mode":"STANDARD_ACTOR_SESSION","simulation_mode":"FULL_PREVIEW"}
{"action_code":"start","aliases":[],"allowed_scopes":["AS","SS","AST","AA","SA","AAT","CTX"],"allows_cross_site_relation":false,"allows_organizational_non_territorial":false,"allows_own_resource":false,"allows_third_party_resource":false,"app_code":"pulso","audit_policy_id":"audit.sensitive_mutation.v1","authorization_requirement":"OPERATIONAL_ONLY","base_lane":null,"consumer_notes":"La sesión es atribuible al actor; esa atribución no crea un bypass de permiso.","contract_hash":"sha256:a200888e09de24d6680483c41ffc40a00671ae043475b785cc1f8a5e1db6006b","deprecated_in":null,"field_policy_id":"pulso.cash_session.start.fields.v1","human_description":"Iniciar una sesión de caja para un actor, punto y sede autorizados.","human_group":"Caja","human_label":"Abrir sesión de caja","human_locale":"es-CO","human_sort_order":300,"introduced_in":"1.0.0","is_configuration":false,"is_operational":true,"is_read_only":false,"is_sensitive":true,"lifecycle_status":"active","maximum_scope":"AS","module_code":"cash","operational_lane":{"area_requirement":"REQUIRED","requires_checkin":true,"requires_shift":true},"permission_key":"pulso.cash.sessions.start","record_type":"permission_contract","replaced_by":[],"replaces":[],"required_sides":["CASH_POINT_SITE"],"requires_strong_reauthentication":false,"resolution_mode":"DRAFT_TARGET_TERRITORY","resource_code":"sessions","resource_contract_id":"pulso.cash_session.start.v1","resource_type":"CASH_SESSION_DRAFT","retired_in":null,"sensitivity_reason":"FINANCIAL_DATA","shared_device_mode":"STANDARD_ACTOR_SESSION","simulation_mode":"FULL_PREVIEW"}
{"action_code":"collect","aliases":[],"allowed_scopes":["AS","SS","AST","AA","SA","AAT","CTX"],"allows_cross_site_relation":false,"allows_organizational_non_territorial":false,"allows_own_resource":false,"allows_third_party_resource":true,"app_code":"pulso","audit_policy_id":"audit.sensitive_mutation.v1","authorization_requirement":"OPERATIONAL_ONLY","base_lane":null,"consumer_notes":"Puede cobrar una orden creada por otro actor, pero solo desde una sesión de caja válida y atribuida.","contract_hash":"sha256:482dc1e001c841d4bb01a3042dde05216c2786d34c17547c9896dbfa04aafce9","deprecated_in":null,"field_policy_id":"pulso.payment_transaction.collect.fields.v1","human_description":"Registrar un cobro ordinario mediante un medio de pago autorizado y vincularlo con una venta y sesión de caja válidas.","human_group":"Pagos","human_label":"Cobrar pagos","human_locale":"es-CO","human_sort_order":200,"introduced_in":"1.0.0","is_configuration":false,"is_operational":true,"is_read_only":false,"is_sensitive":true,"lifecycle_status":"active","maximum_scope":"AS","module_code":"payments","operational_lane":{"area_requirement":"REQUIRED","requires_checkin":true,"requires_shift":true},"permission_key":"pulso.payments.transactions.collect","record_type":"permission_contract","replaced_by":[],"replaces":[],"required_sides":["ORDER_SITE","CASH_SESSION_SITE"],"requires_strong_reauthentication":false,"resolution_mode":"RELATED_RESOURCES_TERRITORY","resource_code":"transactions","resource_contract_id":"pulso.payment_transaction.collect.v1","resource_type":"PAYMENT_TRANSACTION_DRAFT","retired_in":null,"sensitivity_reason":"FINANCIAL_DATA","shared_device_mode":"STANDARD_ACTOR_SESSION","simulation_mode":"FULL_PREVIEW"}
{"action_code":"refund","aliases":[],"allowed_scopes":["G","AS","SS","AST","TST","AA","SA","AAT","ATW","CTX"],"allows_cross_site_relation":false,"allows_organizational_non_territorial":false,"allows_own_resource":false,"allows_third_party_resource":true,"app_code":"pulso","audit_policy_id":"audit.dual_lane_sensitive_mutation.v1","authorization_requirement":"BASE_AND_OPERATIONAL","base_lane":{"requires_checkin":false,"requires_shift":false},"consumer_notes":"Reembolsar no crea una devolución ni cancela la venta.","contract_hash":"sha256:e3e6f53812ee51022ecb85de0ab3a254e9a486fb31941c3bb1d82e796684b632","deprecated_in":null,"field_policy_id":"pulso.payment_refund.create.fields.v1","human_description":"Ejecutar un reembolso sobre una transacción y monto elegibles, con motivo y vínculo a devolución o resolución aprobada.","human_group":"Pagos","human_label":"Reembolsar pagos","human_locale":"es-CO","human_sort_order":220,"introduced_in":"1.0.0","is_configuration":false,"is_operational":true,"is_read_only":false,"is_sensitive":true,"lifecycle_status":"active","maximum_scope":"G","module_code":"payments","operational_lane":{"area_requirement":"REQUIRED","requires_checkin":true,"requires_shift":true},"permission_key":"pulso.payments.transactions.refund","record_type":"permission_contract","replaced_by":[],"replaces":[],"required_sides":["PAYMENT_SITE","RETURN_OR_RESOLUTION_SITE"],"requires_strong_reauthentication":true,"resolution_mode":"RELATED_RESOURCES_TERRITORY","resource_code":"transactions","resource_contract_id":"pulso.payment_refund.create.v1","resource_type":"PAYMENT_REFUND_DRAFT","retired_in":null,"sensitivity_reason":"FINANCIAL_DATA | EXCEPTIONAL_ACTION","shared_device_mode":"STRONG_REAUTH_REQUIRED","simulation_mode":"DECISION_ONLY"}
{"action_code":"reverse","aliases":[],"allowed_scopes":["G","AS","SS","AST","TST","AA","SA","AAT","ATW","CTX"],"allows_cross_site_relation":false,"allows_organizational_non_territorial":false,"allows_own_resource":false,"allows_third_party_resource":true,"app_code":"pulso","audit_policy_id":"audit.dual_lane_sensitive_mutation.v1","authorization_requirement":"BASE_AND_OPERATIONAL","base_lane":{"requires_checkin":false,"requires_shift":false},"consumer_notes":"Reversión y reembolso son capacidades distintas; no existe fallback entre ambas.","contract_hash":"sha256:53d2af544cfd8de14a221c5457a302224b2a9ea2b1a02de0ab5773cdbe0e4f41","deprecated_in":null,"field_policy_id":"pulso.payment_transaction.reverse.fields.v1","human_description":"Invalidar una transacción de pago reversible antes de que el proceso exija un reembolso formal.","human_group":"Pagos","human_label":"Revertir pagos","human_locale":"es-CO","human_sort_order":210,"introduced_in":"1.0.0","is_configuration":false,"is_operational":true,"is_read_only":false,"is_sensitive":true,"lifecycle_status":"active","maximum_scope":"G","module_code":"payments","operational_lane":{"area_requirement":"REQUIRED","requires_checkin":true,"requires_shift":true},"permission_key":"pulso.payments.transactions.reverse","record_type":"permission_contract","replaced_by":[],"replaces":[],"required_sides":["PAYMENT_SITE"],"requires_strong_reauthentication":true,"resolution_mode":"EXISTING_RESOURCE_TERRITORY","resource_code":"transactions","resource_contract_id":"pulso.payment_transaction.reverse.v1","resource_type":"PAYMENT_TRANSACTION","retired_in":null,"sensitivity_reason":"FINANCIAL_DATA | EXCEPTIONAL_ACTION","shared_device_mode":"STRONG_REAUTH_REQUIRED","simulation_mode":"DECISION_ONLY"}
{"action_code":"apply","aliases":[],"allowed_scopes":["G","AS","SS","AST","TST","AA","SA","AAT","ATW","CTX"],"allows_cross_site_relation":false,"allows_organizational_non_territorial":false,"allows_own_resource":false,"allows_third_party_resource":true,"app_code":"pulso","audit_policy_id":"audit.dual_lane_sensitive_mutation.v1","authorization_requirement":"BASE_AND_OPERATIONAL","base_lane":{"requires_checkin":false,"requires_shift":false},"consumer_notes":"La clave aplica reglas existentes; no administra políticas de descuentos.","contract_hash":"sha256:710ea6f1f37421f9c0c1ddd46ae83587964b160a8a5245f70a412685fefe65a7","deprecated_in":null,"field_policy_id":"pulso.discount_application.apply.fields.v1","human_description":"Aplicar un descuento permitido a una venta o línea concreta, conservando regla, actor, motivo y cálculo.","human_group":"Descuentos","human_label":"Aplicar descuentos","human_locale":"es-CO","human_sort_order":130,"introduced_in":"1.0.0","is_configuration":false,"is_operational":true,"is_read_only":false,"is_sensitive":true,"lifecycle_status":"active","maximum_scope":"G","module_code":"sales","operational_lane":{"area_requirement":"SITE_SUFFICIENT","requires_checkin":true,"requires_shift":true},"permission_key":"pulso.sales.discounts.apply","record_type":"permission_contract","replaced_by":[],"replaces":[],"required_sides":["ORDER_SITE"],"requires_strong_reauthentication":true,"resolution_mode":"EXISTING_RESOURCE_TERRITORY","resource_code":"discounts","resource_contract_id":"pulso.discount_application.apply.v1","resource_type":"DISCOUNT_APPLICATION","retired_in":null,"sensitivity_reason":"COMMERCIAL_CONFIDENTIALITY | EXCEPTIONAL_ACTION","shared_device_mode":"STRONG_REAUTH_REQUIRED","simulation_mode":"DECISION_ONLY"}
{"action_code":"cancel","aliases":[],"allowed_scopes":["G","AS","SS","AST","TST","AA","SA","AAT","ATW","CTX"],"allows_cross_site_relation":false,"allows_organizational_non_territorial":false,"allows_own_resource":false,"allows_third_party_resource":true,"app_code":"pulso","audit_policy_id":"audit.dual_lane_sensitive_mutation.v1","authorization_requirement":"BASE_AND_OPERATIONAL","base_lane":{"requires_checkin":false,"requires_shift":false},"consumer_notes":"No hereda autoridad de pulso.pos.main y no ejecuta efectos de otros dominios por implicación.","contract_hash":"sha256:c52dbab78c2896690ac15cc1f127d4650348b844eda1cb5e622a58b1eb7b9100","deprecated_in":null,"field_policy_id":"pulso.sale_order.cancel.fields.v1","human_description":"Cancelar una venta u orden en un estado cancelable mediante motivo y trazabilidad.","human_group":"Ventas","human_label":"Anular ventas","human_locale":"es-CO","human_sort_order":110,"introduced_in":"1.0.0","is_configuration":false,"is_operational":true,"is_read_only":false,"is_sensitive":true,"lifecycle_status":"active","maximum_scope":"G","module_code":"sales","operational_lane":{"area_requirement":"SITE_SUFFICIENT","requires_checkin":true,"requires_shift":true},"permission_key":"pulso.sales.orders.cancel","record_type":"permission_contract","replaced_by":[],"replaces":[],"required_sides":["ORDER_SITE"],"requires_strong_reauthentication":true,"resolution_mode":"EXISTING_RESOURCE_TERRITORY","resource_code":"orders","resource_contract_id":"pulso.sale_order.cancel.v1","resource_type":"SALE_ORDER","retired_in":null,"sensitivity_reason":"EXCEPTIONAL_ACTION","shared_device_mode":"STRONG_REAUTH_REQUIRED","simulation_mode":"DECISION_ONLY"}
{"action_code":"create","aliases":[],"allowed_scopes":["AS","SS","AST","AA","SA","AAT","CTX"],"allows_cross_site_relation":false,"allows_organizational_non_territorial":false,"allows_own_resource":false,"allows_third_party_resource":false,"app_code":"pulso","audit_policy_id":"audit.operational_mutation.v1","authorization_requirement":"OPERATIONAL_ONLY","base_lane":null,"consumer_notes":"No hereda concesiones de pulso.pos.main; la creación no concede cobro, descuento, cancelación, devolución ni cierre de caja.","contract_hash":"sha256:aa2242e13c244d249f08c4a709b7fc1d2416d05d22e01aaa60aabe5c26240dcc","deprecated_in":null,"field_policy_id":"pulso.sale_order.create.fields.v1","human_description":"Crear una orden de venta o venta inicial dentro de la sede, canal y reglas comerciales autorizadas.","human_group":"Ventas","human_label":"Crear ventas","human_locale":"es-CO","human_sort_order":100,"introduced_in":"1.0.0","is_configuration":false,"is_operational":true,"is_read_only":false,"is_sensitive":false,"lifecycle_status":"active","maximum_scope":"AS","module_code":"sales","operational_lane":{"area_requirement":"SITE_SUFFICIENT","requires_checkin":true,"requires_shift":true},"permission_key":"pulso.sales.orders.create","record_type":"permission_contract","replaced_by":[],"replaces":[],"required_sides":["TARGET_SITE"],"requires_strong_reauthentication":false,"resolution_mode":"DRAFT_TARGET_TERRITORY","resource_code":"orders","resource_contract_id":"pulso.sale_order.create.v1","resource_type":"SALE_ORDER_DRAFT","retired_in":null,"sensitivity_reason":null,"shared_device_mode":"STANDARD_ACTOR_SESSION","simulation_mode":"FULL_PREVIEW"}
{"action_code":"create","aliases":[],"allowed_scopes":["G","AS","SS","AST","TST","AA","SA","AAT","ATW","CTX"],"allows_cross_site_relation":false,"allows_organizational_non_territorial":false,"allows_own_resource":false,"allows_third_party_resource":true,"app_code":"pulso","audit_policy_id":"audit.dual_lane_sensitive_mutation.v1","authorization_requirement":"BASE_AND_OPERATIONAL","base_lane":{"requires_checkin":false,"requires_shift":false},"consumer_notes":"La devolución comercial no ejecuta por sí sola reembolso ni ajuste de inventario.","contract_hash":"sha256:bef4f8e3f30905c404a596ae77d3fe079899d352d1d4c77b8253a09312d4ddd5","deprecated_in":null,"field_policy_id":"pulso.sale_return.create.fields.v1","human_description":"Crear una devolución comercial vinculada a líneas concretas de una venta entregada o facturada.","human_group":"Devoluciones","human_label":"Registrar devoluciones","human_locale":"es-CO","human_sort_order":120,"introduced_in":"1.0.0","is_configuration":false,"is_operational":true,"is_read_only":false,"is_sensitive":true,"lifecycle_status":"active","maximum_scope":"G","module_code":"sales","operational_lane":{"area_requirement":"SITE_SUFFICIENT","requires_checkin":true,"requires_shift":true},"permission_key":"pulso.sales.returns.create","record_type":"permission_contract","replaced_by":[],"replaces":[],"required_sides":["ORDER_SITE"],"requires_strong_reauthentication":true,"resolution_mode":"RELATED_RESOURCES_TERRITORY","resource_code":"returns","resource_contract_id":"pulso.sale_return.create.v1","resource_type":"SALE_RETURN_DRAFT","retired_in":null,"sensitivity_reason":"FINANCIAL_DATA | INVENTORY_INTEGRITY","shared_device_mode":"STRONG_REAUTH_REQUIRED","simulation_mode":"DECISION_ONLY"}
{"action_code":"approve","aliases":[],"allowed_scopes":["ORG"],"allows_cross_site_relation":false,"allows_organizational_non_territorial":true,"allows_own_resource":false,"allows_third_party_resource":true,"app_code":"viso","audit_policy_id":"audit.authorization_governance_mutation.v1","authorization_requirement":"BASE_ONLY","base_lane":{"requires_checkin":false,"requires_shift":false},"consumer_notes":"Sustituye parte de viso.staff.permissions.manage sin herencia de concesiones, sin alias uno-a-muchos y con segregación obligatoria.","contract_hash":"sha256:9e83fe92024fefa49e8974651c507d309d5a0d18b4262de7f4eaea6006032e4a","deprecated_in":null,"field_policy_id":"viso.base_grants.approve.fields.v1","human_description":"Aprobar y activar una propuesta base válida creada por otro actor autorizado.","human_group":"Concesiones base","human_label":"Aprobar concesiones individuales base","human_locale":"es-CO","human_sort_order":120,"introduced_in":"1.0.0","is_configuration":true,"is_operational":false,"is_read_only":false,"is_sensitive":true,"lifecycle_status":"active","maximum_scope":"ORG","module_code":"authorization","operational_lane":null,"permission_key":"viso.authorization.base_grants.approve","record_type":"permission_contract","replaced_by":[],"replaces":[],"required_sides":["ORGANIZATION","TARGET_SUBJECT","TARGET_PERMISSION_SCOPE"],"requires_strong_reauthentication":true,"resolution_mode":"AUTHORIZATION_RECORD_SCOPE","resource_code":"base_grants","resource_contract_id":"viso.base_grants.approve.v1","resource_type":"INDIVIDUAL_BASE_GRANT","retired_in":null,"sensitivity_reason":"AUTHORIZATION_SECURITY","shared_device_mode":"STRONG_REAUTH_REQUIRED","simulation_mode":"DECISION_ONLY"}
{"action_code":"create","aliases":[],"allowed_scopes":["ORG"],"allows_cross_site_relation":false,"allows_organizational_non_territorial":true,"allows_own_resource":false,"allows_third_party_resource":true,"app_code":"viso","audit_policy_id":"audit.authorization_governance_mutation.v1","authorization_requirement":"BASE_ONLY","base_lane":{"requires_checkin":false,"requires_shift":false},"consumer_notes":"Sustituye parte de viso.staff.permissions.manage sin herencia de concesiones, sin alias uno-a-muchos y con segregación obligatoria.","contract_hash":"sha256:57b8eab60a9df626403b747dcba30ce3cce9031f55fa554d05c01ee95f2a457e","deprecated_in":null,"field_policy_id":"viso.base_grants.create.fields.v1","human_description":"Crear una propuesta no activa para un trabajador, permiso, carril base, alcance, vigencia y justificación exactos.","human_group":"Concesiones base","human_label":"Crear propuestas de concesión base","human_locale":"es-CO","human_sort_order":110,"introduced_in":"1.0.0","is_configuration":true,"is_operational":false,"is_read_only":false,"is_sensitive":true,"lifecycle_status":"active","maximum_scope":"ORG","module_code":"authorization","operational_lane":null,"permission_key":"viso.authorization.base_grants.create","record_type":"permission_contract","replaced_by":[],"replaces":[],"required_sides":["ORGANIZATION","TARGET_SUBJECT","TARGET_PERMISSION_SCOPE"],"requires_strong_reauthentication":true,"resolution_mode":"AUTHORIZATION_RECORD_SCOPE","resource_code":"base_grants","resource_contract_id":"viso.base_grants.create.v1","resource_type":"INDIVIDUAL_BASE_GRANT","retired_in":null,"sensitivity_reason":"AUTHORIZATION_SECURITY","shared_device_mode":"STRONG_REAUTH_REQUIRED","simulation_mode":"DECISION_ONLY"}
{"action_code":"revoke","aliases":[],"allowed_scopes":["ORG"],"allows_cross_site_relation":false,"allows_organizational_non_territorial":true,"allows_own_resource":false,"allows_third_party_resource":true,"app_code":"viso","audit_policy_id":"audit.authorization_governance_mutation.v1","authorization_requirement":"BASE_ONLY","base_lane":{"requires_checkin":false,"requires_shift":false},"consumer_notes":"Sustituye parte de viso.staff.permissions.manage sin herencia de concesiones, sin alias uno-a-muchos y con segregación obligatoria.","contract_hash":"sha256:babe71f9954323b71e22a573125fbf7e77e0a97f40e6e0a460858a443a48f343","deprecated_in":null,"field_policy_id":"viso.base_grants.revoke.fields.v1","human_description":"Terminar de forma auditable una concesión base sin eliminar su historial.","human_group":"Concesiones base","human_label":"Revocar concesiones individuales base","human_locale":"es-CO","human_sort_order":140,"introduced_in":"1.0.0","is_configuration":true,"is_operational":false,"is_read_only":false,"is_sensitive":true,"lifecycle_status":"active","maximum_scope":"ORG","module_code":"authorization","operational_lane":null,"permission_key":"viso.authorization.base_grants.revoke","record_type":"permission_contract","replaced_by":[],"replaces":[],"required_sides":["ORGANIZATION","TARGET_SUBJECT","TARGET_PERMISSION_SCOPE"],"requires_strong_reauthentication":true,"resolution_mode":"AUTHORIZATION_RECORD_SCOPE","resource_code":"base_grants","resource_contract_id":"viso.base_grants.revoke.v1","resource_type":"INDIVIDUAL_BASE_GRANT","retired_in":null,"sensitivity_reason":"AUTHORIZATION_SECURITY","shared_device_mode":"STRONG_REAUTH_REQUIRED","simulation_mode":"DECISION_ONLY"}
{"action_code":"suspend","aliases":[],"allowed_scopes":["ORG"],"allows_cross_site_relation":false,"allows_organizational_non_territorial":true,"allows_own_resource":false,"allows_third_party_resource":true,"app_code":"viso","audit_policy_id":"audit.authorization_governance_mutation.v1","authorization_requirement":"BASE_ONLY","base_lane":{"requires_checkin":false,"requires_shift":false},"consumer_notes":"Sustituye parte de viso.staff.permissions.manage sin herencia de concesiones, sin alias uno-a-muchos y con segregación obligatoria.","contract_hash":"sha256:d1601789e57989f46d469053a8c5a34c65d656ff2759a30d4b1a9f17bfe4862c","deprecated_in":null,"field_policy_id":"viso.base_grants.suspend.fields.v1","human_description":"Suspender temporalmente una concesión base activa, conservando historial, motivo y vigencia de la suspensión.","human_group":"Concesiones base","human_label":"Suspender concesiones individuales base","human_locale":"es-CO","human_sort_order":130,"introduced_in":"1.0.0","is_configuration":true,"is_operational":false,"is_read_only":false,"is_sensitive":true,"lifecycle_status":"active","maximum_scope":"ORG","module_code":"authorization","operational_lane":null,"permission_key":"viso.authorization.base_grants.suspend","record_type":"permission_contract","replaced_by":[],"replaces":[],"required_sides":["ORGANIZATION","TARGET_SUBJECT","TARGET_PERMISSION_SCOPE"],"requires_strong_reauthentication":true,"resolution_mode":"AUTHORIZATION_RECORD_SCOPE","resource_code":"base_grants","resource_contract_id":"viso.base_grants.suspend.v1","resource_type":"INDIVIDUAL_BASE_GRANT","retired_in":null,"sensitivity_reason":"AUTHORIZATION_SECURITY","shared_device_mode":"STRONG_REAUTH_REQUIRED","simulation_mode":"DECISION_ONLY"}
{"action_code":"view","aliases":[],"allowed_scopes":["ORG"],"allows_cross_site_relation":false,"allows_organizational_non_territorial":true,"allows_own_resource":false,"allows_third_party_resource":true,"app_code":"viso","audit_policy_id":"audit.authorization_governance_read.v1","authorization_requirement":"BASE_ONLY","base_lane":{"requires_checkin":false,"requires_shift":false},"consumer_notes":"Sustituye parte de viso.staff.permissions.manage sin herencia de concesiones, sin alias uno-a-muchos y con segregación obligatoria.","contract_hash":"sha256:002f43496b411336b652caf7bee8ba232d596671c27d245f44023c8fcc769211","deprecated_in":null,"field_policy_id":"viso.base_grants.view.fields.v1","human_description":"Consultar propuestas, concesiones activas, suspendidas, vencidas o revocadas dentro del alcance administrativo real.","human_group":"Concesiones base","human_label":"Consultar concesiones individuales base","human_locale":"es-CO","human_sort_order":100,"introduced_in":"1.0.0","is_configuration":true,"is_operational":false,"is_read_only":true,"is_sensitive":true,"lifecycle_status":"active","maximum_scope":"ORG","module_code":"authorization","operational_lane":null,"permission_key":"viso.authorization.base_grants.view","record_type":"permission_contract","replaced_by":[],"replaces":[],"required_sides":["ORGANIZATION","TARGET_SUBJECT","TARGET_PERMISSION_SCOPE"],"requires_strong_reauthentication":true,"resolution_mode":"AUTHORIZATION_RECORD_SCOPE","resource_code":"base_grants","resource_contract_id":"viso.base_grants.view.v1","resource_type":"INDIVIDUAL_BASE_GRANT","retired_in":null,"sensitivity_reason":"AUTHORIZATION_SECURITY","shared_device_mode":"STRONG_REAUTH_REQUIRED","simulation_mode":"DECISION_ONLY"}
{"action_code":"approve","aliases":[],"allowed_scopes":["ORG"],"allows_cross_site_relation":false,"allows_organizational_non_territorial":true,"allows_own_resource":false,"allows_third_party_resource":true,"app_code":"viso","audit_policy_id":"audit.authorization_governance_mutation.v1","authorization_requirement":"BASE_ONLY","base_lane":{"requires_checkin":false,"requires_shift":false},"consumer_notes":"Sustituye parte de viso.staff.permissions.manage sin herencia de concesiones, sin alias uno-a-muchos y con segregación obligatoria.","contract_hash":"sha256:a1859d923ac3d582c8cc7133d844dee257445b9be65d849eba9c0f212f7a7f8d","deprecated_in":null,"field_policy_id":"viso.denials.approve.fields.v1","human_description":"Aprobar y activar una denegación válida creada por otro actor autorizado, verificando recuperación y segregación.","human_group":"Denegaciones","human_label":"Aprobar denegaciones individuales","human_locale":"es-CO","human_sort_order":320,"introduced_in":"1.0.0","is_configuration":true,"is_operational":false,"is_read_only":false,"is_sensitive":true,"lifecycle_status":"active","maximum_scope":"ORG","module_code":"authorization","operational_lane":null,"permission_key":"viso.authorization.denials.approve","record_type":"permission_contract","replaced_by":[],"replaces":[],"required_sides":["ORGANIZATION","TARGET_SUBJECT","TARGET_PERMISSION_SCOPE"],"requires_strong_reauthentication":true,"resolution_mode":"AUTHORIZATION_RECORD_SCOPE","resource_code":"denials","resource_contract_id":"viso.denials.approve.v1","resource_type":"INDIVIDUAL_DENIAL","retired_in":null,"sensitivity_reason":"AUTHORIZATION_SECURITY","shared_device_mode":"STRONG_REAUTH_REQUIRED","simulation_mode":"DECISION_ONLY"}
{"action_code":"create","aliases":[],"allowed_scopes":["ORG"],"allows_cross_site_relation":false,"allows_organizational_non_territorial":true,"allows_own_resource":false,"allows_third_party_resource":true,"app_code":"viso","audit_policy_id":"audit.authorization_governance_mutation.v1","authorization_requirement":"BASE_ONLY","base_lane":{"requires_checkin":false,"requires_shift":false},"consumer_notes":"Sustituye parte de viso.staff.permissions.manage sin herencia de concesiones, sin alias uno-a-muchos y con segregación obligatoria.","contract_hash":"sha256:c9771ab1c2a1460d165226c503c7168311811dbf06dec98cd93e5d3c4e02e4f2","deprecated_in":null,"field_policy_id":"viso.denials.create.fields.v1","human_description":"Crear una propuesta no activa para una clave exacta, trabajador, carril o bloqueo transversal, alcance, vigencia y motivo.","human_group":"Denegaciones","human_label":"Crear propuestas de denegación","human_locale":"es-CO","human_sort_order":310,"introduced_in":"1.0.0","is_configuration":true,"is_operational":false,"is_read_only":false,"is_sensitive":true,"lifecycle_status":"active","maximum_scope":"ORG","module_code":"authorization","operational_lane":null,"permission_key":"viso.authorization.denials.create","record_type":"permission_contract","replaced_by":[],"replaces":[],"required_sides":["ORGANIZATION","TARGET_SUBJECT","TARGET_PERMISSION_SCOPE"],"requires_strong_reauthentication":true,"resolution_mode":"AUTHORIZATION_RECORD_SCOPE","resource_code":"denials","resource_contract_id":"viso.denials.create.v1","resource_type":"INDIVIDUAL_DENIAL","retired_in":null,"sensitivity_reason":"AUTHORIZATION_SECURITY","shared_device_mode":"STRONG_REAUTH_REQUIRED","simulation_mode":"DECISION_ONLY"}
{"action_code":"revoke","aliases":[],"allowed_scopes":["ORG"],"allows_cross_site_relation":false,"allows_organizational_non_territorial":true,"allows_own_resource":false,"allows_third_party_resource":true,"app_code":"viso","audit_policy_id":"audit.authorization_governance_mutation.v1","authorization_requirement":"BASE_ONLY","base_lane":{"requires_checkin":false,"requires_shift":false},"consumer_notes":"Sustituye parte de viso.staff.permissions.manage sin herencia de concesiones, sin alias uno-a-muchos y con segregación obligatoria.","contract_hash":"sha256:8c4429ec3a2c7586a0a10ba384c524ac01b96fd5ce9152850813181501f12465","deprecated_in":null,"field_policy_id":"viso.denials.revoke.fields.v1","human_description":"Terminar una denegación de forma auditable; la revocación no concede por sí sola ningún permiso.","human_group":"Denegaciones","human_label":"Revocar denegaciones individuales","human_locale":"es-CO","human_sort_order":330,"introduced_in":"1.0.0","is_configuration":true,"is_operational":false,"is_read_only":false,"is_sensitive":true,"lifecycle_status":"active","maximum_scope":"ORG","module_code":"authorization","operational_lane":null,"permission_key":"viso.authorization.denials.revoke","record_type":"permission_contract","replaced_by":[],"replaces":[],"required_sides":["ORGANIZATION","TARGET_SUBJECT","TARGET_PERMISSION_SCOPE"],"requires_strong_reauthentication":true,"resolution_mode":"AUTHORIZATION_RECORD_SCOPE","resource_code":"denials","resource_contract_id":"viso.denials.revoke.v1","resource_type":"INDIVIDUAL_DENIAL","retired_in":null,"sensitivity_reason":"AUTHORIZATION_SECURITY","shared_device_mode":"STRONG_REAUTH_REQUIRED","simulation_mode":"DECISION_ONLY"}
{"action_code":"view","aliases":[],"allowed_scopes":["ORG"],"allows_cross_site_relation":false,"allows_organizational_non_territorial":true,"allows_own_resource":false,"allows_third_party_resource":true,"app_code":"viso","audit_policy_id":"audit.authorization_governance_read.v1","authorization_requirement":"BASE_ONLY","base_lane":{"requires_checkin":false,"requires_shift":false},"consumer_notes":"Sustituye parte de viso.staff.permissions.manage sin herencia de concesiones, sin alias uno-a-muchos y con segregación obligatoria.","contract_hash":"sha256:ec5e73b4e557d9b020d481fa8d55f684b12009cc03717954bf7bc703a1a52f1a","deprecated_in":null,"field_policy_id":"viso.denials.view.fields.v1","human_description":"Consultar denegaciones de carril y bloqueos transversales dentro del alcance administrativo real.","human_group":"Denegaciones","human_label":"Consultar denegaciones individuales","human_locale":"es-CO","human_sort_order":300,"introduced_in":"1.0.0","is_configuration":true,"is_operational":false,"is_read_only":true,"is_sensitive":true,"lifecycle_status":"active","maximum_scope":"ORG","module_code":"authorization","operational_lane":null,"permission_key":"viso.authorization.denials.view","record_type":"permission_contract","replaced_by":[],"replaces":[],"required_sides":["ORGANIZATION","TARGET_SUBJECT","TARGET_PERMISSION_SCOPE"],"requires_strong_reauthentication":true,"resolution_mode":"AUTHORIZATION_RECORD_SCOPE","resource_code":"denials","resource_contract_id":"viso.denials.view.v1","resource_type":"INDIVIDUAL_DENIAL","retired_in":null,"sensitivity_reason":"AUTHORIZATION_SECURITY","shared_device_mode":"STRONG_REAUTH_REQUIRED","simulation_mode":"DECISION_ONLY"}
{"action_code":"approve","aliases":[],"allowed_scopes":["ORG"],"allows_cross_site_relation":false,"allows_organizational_non_territorial":true,"allows_own_resource":false,"allows_third_party_resource":true,"app_code":"viso","audit_policy_id":"audit.authorization_governance_mutation.v1","authorization_requirement":"BASE_ONLY","base_lane":{"requires_checkin":false,"requires_shift":false},"consumer_notes":"Sustituye parte de viso.staff.permissions.manage sin herencia de concesiones, sin alias uno-a-muchos y con segregación obligatoria.","contract_hash":"sha256:6ffa1584ebf86cc58f812e0400a269a080aa12c04bc116ec2fae80f8717bd5cc","deprecated_in":null,"field_policy_id":"viso.operational_grants.approve.fields.v1","human_description":"Aprobar y activar una propuesta operativa válida creada por otro actor autorizado.","human_group":"Concesiones operativas","human_label":"Aprobar concesiones individuales operativas","human_locale":"es-CO","human_sort_order":220,"introduced_in":"1.0.0","is_configuration":true,"is_operational":false,"is_read_only":false,"is_sensitive":true,"lifecycle_status":"active","maximum_scope":"ORG","module_code":"authorization","operational_lane":null,"permission_key":"viso.authorization.operational_grants.approve","record_type":"permission_contract","replaced_by":[],"replaces":[],"required_sides":["ORGANIZATION","TARGET_SUBJECT","TARGET_PERMISSION_SCOPE"],"requires_strong_reauthentication":true,"resolution_mode":"AUTHORIZATION_RECORD_SCOPE","resource_code":"operational_grants","resource_contract_id":"viso.operational_grants.approve.v1","resource_type":"INDIVIDUAL_OPERATIONAL_GRANT","retired_in":null,"sensitivity_reason":"AUTHORIZATION_SECURITY","shared_device_mode":"STRONG_REAUTH_REQUIRED","simulation_mode":"DECISION_ONLY"}
{"action_code":"create","aliases":[],"allowed_scopes":["ORG"],"allows_cross_site_relation":false,"allows_organizational_non_territorial":true,"allows_own_resource":false,"allows_third_party_resource":true,"app_code":"viso","audit_policy_id":"audit.authorization_governance_mutation.v1","authorization_requirement":"BASE_ONLY","base_lane":{"requires_checkin":false,"requires_shift":false},"consumer_notes":"Sustituye parte de viso.staff.permissions.manage sin herencia de concesiones, sin alias uno-a-muchos y con segregación obligatoria.","contract_hash":"sha256:48879dfed7211e5132c9384cc86f2acd549d631740da2f32c69c2c9a81e5e08c","deprecated_in":null,"field_policy_id":"viso.operational_grants.create.fields.v1","human_description":"Crear una propuesta no activa para un trabajador, permiso, carril operativo, roles compatibles, alcance y vigencia.","human_group":"Concesiones operativas","human_label":"Crear propuestas de concesión operativa","human_locale":"es-CO","human_sort_order":210,"introduced_in":"1.0.0","is_configuration":true,"is_operational":false,"is_read_only":false,"is_sensitive":true,"lifecycle_status":"active","maximum_scope":"ORG","module_code":"authorization","operational_lane":null,"permission_key":"viso.authorization.operational_grants.create","record_type":"permission_contract","replaced_by":[],"replaces":[],"required_sides":["ORGANIZATION","TARGET_SUBJECT","TARGET_PERMISSION_SCOPE"],"requires_strong_reauthentication":true,"resolution_mode":"AUTHORIZATION_RECORD_SCOPE","resource_code":"operational_grants","resource_contract_id":"viso.operational_grants.create.v1","resource_type":"INDIVIDUAL_OPERATIONAL_GRANT","retired_in":null,"sensitivity_reason":"AUTHORIZATION_SECURITY","shared_device_mode":"STRONG_REAUTH_REQUIRED","simulation_mode":"DECISION_ONLY"}
{"action_code":"revoke","aliases":[],"allowed_scopes":["ORG"],"allows_cross_site_relation":false,"allows_organizational_non_territorial":true,"allows_own_resource":false,"allows_third_party_resource":true,"app_code":"viso","audit_policy_id":"audit.authorization_governance_mutation.v1","authorization_requirement":"BASE_ONLY","base_lane":{"requires_checkin":false,"requires_shift":false},"consumer_notes":"Sustituye parte de viso.staff.permissions.manage sin herencia de concesiones, sin alias uno-a-muchos y con segregación obligatoria.","contract_hash":"sha256:d323fb3309406a87a609834665fadf684ad494041d3a857cce641480fb597648","deprecated_in":null,"field_policy_id":"viso.operational_grants.revoke.fields.v1","human_description":"Terminar de forma auditable una concesión operativa sin alterar matrices o turnos.","human_group":"Concesiones operativas","human_label":"Revocar concesiones individuales operativas","human_locale":"es-CO","human_sort_order":240,"introduced_in":"1.0.0","is_configuration":true,"is_operational":false,"is_read_only":false,"is_sensitive":true,"lifecycle_status":"active","maximum_scope":"ORG","module_code":"authorization","operational_lane":null,"permission_key":"viso.authorization.operational_grants.revoke","record_type":"permission_contract","replaced_by":[],"replaces":[],"required_sides":["ORGANIZATION","TARGET_SUBJECT","TARGET_PERMISSION_SCOPE"],"requires_strong_reauthentication":true,"resolution_mode":"AUTHORIZATION_RECORD_SCOPE","resource_code":"operational_grants","resource_contract_id":"viso.operational_grants.revoke.v1","resource_type":"INDIVIDUAL_OPERATIONAL_GRANT","retired_in":null,"sensitivity_reason":"AUTHORIZATION_SECURITY","shared_device_mode":"STRONG_REAUTH_REQUIRED","simulation_mode":"DECISION_ONLY"}
{"action_code":"suspend","aliases":[],"allowed_scopes":["ORG"],"allows_cross_site_relation":false,"allows_organizational_non_territorial":true,"allows_own_resource":false,"allows_third_party_resource":true,"app_code":"viso","audit_policy_id":"audit.authorization_governance_mutation.v1","authorization_requirement":"BASE_ONLY","base_lane":{"requires_checkin":false,"requires_shift":false},"consumer_notes":"Sustituye parte de viso.staff.permissions.manage sin herencia de concesiones, sin alias uno-a-muchos y con segregación obligatoria.","contract_hash":"sha256:419e4057b34a625765d3635de3e4083ba61174ad88e33a35abfc976e64d753c4","deprecated_in":null,"field_policy_id":"viso.operational_grants.suspend.fields.v1","human_description":"Suspender temporalmente una concesión operativa sin modificar el rol del turno ni borrar el historial.","human_group":"Concesiones operativas","human_label":"Suspender concesiones individuales operativas","human_locale":"es-CO","human_sort_order":230,"introduced_in":"1.0.0","is_configuration":true,"is_operational":false,"is_read_only":false,"is_sensitive":true,"lifecycle_status":"active","maximum_scope":"ORG","module_code":"authorization","operational_lane":null,"permission_key":"viso.authorization.operational_grants.suspend","record_type":"permission_contract","replaced_by":[],"replaces":[],"required_sides":["ORGANIZATION","TARGET_SUBJECT","TARGET_PERMISSION_SCOPE"],"requires_strong_reauthentication":true,"resolution_mode":"AUTHORIZATION_RECORD_SCOPE","resource_code":"operational_grants","resource_contract_id":"viso.operational_grants.suspend.v1","resource_type":"INDIVIDUAL_OPERATIONAL_GRANT","retired_in":null,"sensitivity_reason":"AUTHORIZATION_SECURITY","shared_device_mode":"STRONG_REAUTH_REQUIRED","simulation_mode":"DECISION_ONLY"}
{"action_code":"view","aliases":[],"allowed_scopes":["ORG"],"allows_cross_site_relation":false,"allows_organizational_non_territorial":true,"allows_own_resource":false,"allows_third_party_resource":true,"app_code":"viso","audit_policy_id":"audit.authorization_governance_read.v1","authorization_requirement":"BASE_ONLY","base_lane":{"requires_checkin":false,"requires_shift":false},"consumer_notes":"Sustituye parte de viso.staff.permissions.manage sin herencia de concesiones, sin alias uno-a-muchos y con segregación obligatoria.","contract_hash":"sha256:7423f713debfa5aa00f9e4640071415280043c006a0dad99d79d1726568f7ceb","deprecated_in":null,"field_policy_id":"viso.operational_grants.view.fields.v1","human_description":"Consultar propuestas y estados de concesiones operativas, incluidos roles compatibles, territorio y vigencia.","human_group":"Concesiones operativas","human_label":"Consultar concesiones individuales operativas","human_locale":"es-CO","human_sort_order":200,"introduced_in":"1.0.0","is_configuration":true,"is_operational":false,"is_read_only":true,"is_sensitive":true,"lifecycle_status":"active","maximum_scope":"ORG","module_code":"authorization","operational_lane":null,"permission_key":"viso.authorization.operational_grants.view","record_type":"permission_contract","replaced_by":[],"replaces":[],"required_sides":["ORGANIZATION","TARGET_SUBJECT","TARGET_PERMISSION_SCOPE"],"requires_strong_reauthentication":true,"resolution_mode":"AUTHORIZATION_RECORD_SCOPE","resource_code":"operational_grants","resource_contract_id":"viso.operational_grants.view.v1","resource_type":"INDIVIDUAL_OPERATIONAL_GRANT","retired_in":null,"sensitivity_reason":"AUTHORIZATION_SECURITY","shared_device_mode":"STRONG_REAUTH_REQUIRED","simulation_mode":"DECISION_ONLY"}
{"audit_policy":{"audit_policy_id":"audit.custody_mutation.v1","rule":"Actor logístico, origen, bultos/LPN, cantidades declaradas, versión, evidencia, contexto, decisión y timestamp."},"blocked_reason_codes":["AUTH_NO_SESSION","AUTH_USER_INACTIVE","AUTH_APP_ACCESS_DENIED","AUTH_OPERATIONAL_PERMISSION_DENIED","AUTH_SITE_ASSIGNMENT_REQUIRED","AUTH_ACTIVE_SITE_REQUIRED","AUTH_PUBLISHED_SHIFT_REQUIRED","AUTH_OUTSIDE_SHIFT_WINDOW","AUTH_CHECKIN_REQUIRED","AUTH_OPERATIONAL_ROLE_REQUIRED","AUTH_OPERATIONAL_ROLE_INVALID_FOR_SITE","AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT","AUTH_PERMISSION_NOT_REGISTERED","AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE","AUTH_SHARED_DEVICE_NOT_AUTHORIZED","AUTH_ACTION_NOT_ALLOWED_IN_SIMULATION"],"concurrency_policy":"EXPECTED_VERSION_AND_ROW_LOCK","contract_version":"1.0.0","field_policy":{"field_policy_id":"nexo.remission.accept_custody.fields.v1","rule":"Solo confirma custodia de bultos/cantidades declaradas y evidencia; prohíbe preparar, cambiar cantidades, iniciar tránsito o recibir en destino."},"ownership_resolver":"NONE","record_type":"resource_contract","required_sides":["ORIGIN","CUSTODY"],"resolution_outcomes":["RESOLVED","MULTI_RESOLVED","NOT_APPLICABLE","UNRESOLVED","CONFLICT","ISOLATED"],"resource_contract_hash":"sha256:2a33e61fce68df643bb8f9a492ac159fa36e4ebc0a1b5dea081b574c2a46657c","resource_contract_id":"nexo.remission.accept_custody.v1","resource_locator":["remission_id","logistics_actor_id","packages_or_lpns","declared_quantities","expected_version","evidence_ref?"],"resource_type":"REMISSION","state_predicate":"REMISSION_PREPARED_AND_ASSIGNED","subject_resolver":"ASSIGNED_LOGISTICS_ACTOR","territory_resolver":"REMISSION_ORIGIN_AND_ASSIGNED_CUSTODY_RELATION"}
{"audit_policy":{"audit_policy_id":"audit.custody_mutation.v1","rule":"Actor logístico, receptor, destino, ruta, tiempo/ubicación, versión, evidencia, contexto, decisión y timestamp."},"blocked_reason_codes":["AUTH_NO_SESSION","AUTH_USER_INACTIVE","AUTH_APP_ACCESS_DENIED","AUTH_OPERATIONAL_PERMISSION_DENIED","AUTH_SITE_ASSIGNMENT_REQUIRED","AUTH_ACTIVE_SITE_REQUIRED","AUTH_PUBLISHED_SHIFT_REQUIRED","AUTH_OUTSIDE_SHIFT_WINDOW","AUTH_CHECKIN_REQUIRED","AUTH_OPERATIONAL_ROLE_REQUIRED","AUTH_OPERATIONAL_ROLE_INVALID_FOR_SITE","AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT","AUTH_PERMISSION_NOT_REGISTERED","AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE","AUTH_SHARED_DEVICE_NOT_AUTHORIZED","AUTH_ACTION_NOT_ALLOWED_IN_SIMULATION"],"concurrency_policy":"EXPECTED_VERSION_AND_ROW_LOCK","contract_version":"1.0.0","field_policy":{"field_policy_id":"nexo.remission.deliver.fields.v1","rule":"Solo registra handoff, receptor, momento y evidencia; prohíbe confirmar receive, crear inventario o cerrar diferencias en nombre del destino."},"ownership_resolver":"NONE","record_type":"resource_contract","required_sides":["CUSTODY","ROUTE","DESTINATION"],"resolution_outcomes":["RESOLVED","MULTI_RESOLVED","NOT_APPLICABLE","UNRESOLVED","CONFLICT","ISOLATED"],"resource_contract_hash":"sha256:6e2b931941fa365c138a633411ab57e40ebd0708ad9a94bade4a97de4d9ac508","resource_contract_id":"nexo.remission.deliver.v1","resource_locator":["remission_id","destination_site_id","receiver_actor_id","delivered_at","location_ref?","expected_version","evidence_ref?"],"resource_type":"REMISSION","state_predicate":"REMISSION_IN_TRANSIT_AND_DESTINATION_VALID","subject_resolver":"ASSIGNED_LOGISTICS_ACTOR_AND_IDENTIFIED_RECEIVER","territory_resolver":"REMISSION_CUSTODY_ROUTE_AND_DESTINATION_RELATION"}
{"audit_policy":{"audit_policy_id":"audit.custody_mutation.v1","rule":"Actor logístico, aceptación de custodia, ruta, vehículo cuando aplique, versión, contexto, decisión y timestamp."},"blocked_reason_codes":["AUTH_NO_SESSION","AUTH_USER_INACTIVE","AUTH_APP_ACCESS_DENIED","AUTH_OPERATIONAL_PERMISSION_DENIED","AUTH_SITE_ASSIGNMENT_REQUIRED","AUTH_ACTIVE_SITE_REQUIRED","AUTH_PUBLISHED_SHIFT_REQUIRED","AUTH_OUTSIDE_SHIFT_WINDOW","AUTH_CHECKIN_REQUIRED","AUTH_OPERATIONAL_ROLE_REQUIRED","AUTH_OPERATIONAL_ROLE_INVALID_FOR_SITE","AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT","AUTH_PERMISSION_NOT_REGISTERED","AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE","AUTH_SHARED_DEVICE_NOT_AUTHORIZED","AUTH_ACTION_NOT_ALLOWED_IN_SIMULATION"],"concurrency_policy":"EXPECTED_VERSION_AND_ROW_LOCK","contract_version":"1.0.0","field_policy":{"field_policy_id":"nexo.remission.start_transit.fields.v1","rule":"Solo inicia tránsito con custodia vigente y ruta válida; prohíbe aceptar custodia por retroactividad, reasignar actor/ruta o entregar."},"ownership_resolver":"NONE","record_type":"resource_contract","required_sides":["ORIGIN","CUSTODY","ROUTE"],"resolution_outcomes":["RESOLVED","MULTI_RESOLVED","NOT_APPLICABLE","UNRESOLVED","CONFLICT","ISOLATED"],"resource_contract_hash":"sha256:fd73a8792fe244d55d920b1405fc68b57e9cbb1854607c1edad279b93a46656c","resource_contract_id":"nexo.remission.start_transit.v1","resource_locator":["remission_id","custody_acceptance_id","route_id","vehicle_id?","expected_version","evidence_ref?"],"resource_type":"REMISSION","state_predicate":"REMISSION_CUSTODY_ACCEPTED_AND_ROUTE_VALID","subject_resolver":"ASSIGNED_LOGISTICS_ACTOR","territory_resolver":"REMISSION_ORIGIN_CUSTODY_AND_ROUTE_RELATION"}
{"audit_policy":{"audit_policy_id":"audit.dual_lane_sensitive_mutation.v1","rule":"Actor, capturador, carriles, reautenticación, conteo/diferencia, versión, motivo, evidencia, decisión y timestamp."},"blocked_reason_codes":["AUTH_NO_SESSION","AUTH_USER_INACTIVE","AUTH_APP_ACCESS_DENIED","AUTH_ADMIN_PERMISSION_DENIED","AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT","AUTH_PERMISSION_NOT_REGISTERED","AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE","AUTH_SHARED_DEVICE_NOT_AUTHORIZED","AUTH_ACTION_NOT_ALLOWED_IN_SIMULATION","AUTH_OPERATIONAL_PERMISSION_DENIED","AUTH_SITE_ASSIGNMENT_REQUIRED","AUTH_ACTIVE_SITE_REQUIRED","AUTH_PUBLISHED_SHIFT_REQUIRED","AUTH_OUTSIDE_SHIFT_WINDOW","AUTH_CHECKIN_REQUIRED","AUTH_OPERATIONAL_ROLE_REQUIRED","AUTH_OPERATIONAL_ROLE_INVALID_FOR_SITE","AUTH_AREA_ASSIGNMENT_REQUIRED","AUTH_ACTIVE_AREA_REQUIRED","AUTH_OPERATIONAL_ROLE_INVALID_FOR_AREA"],"concurrency_policy":"EXPECTED_VERSION_AND_ROW_LOCK","contract_version":"1.0.0","field_policy":{"field_policy_id":"nexo.stock_count_variance.approve.fields.v1","rule":"Solo permite decisión de aprobación, motivo/evidencia y versión; prohíbe alterar captura, resolver o registrar ajuste."},"ownership_resolver":"NONE","record_type":"resource_contract","required_sides":["COUNT_SITE"],"resolution_outcomes":["RESOLVED","MULTI_RESOLVED","NOT_APPLICABLE","UNRESOLVED","CONFLICT","ISOLATED"],"resource_contract_hash":"sha256:9ea1755dd696f959c138c726dfc1d34d47b72d92bd3960e4a4b7564cf92af596","resource_contract_id":"nexo.stock_count_variance.approve.v1","resource_locator":["variance_id","count_id","expected_version","evidence_ref"],"resource_type":"STOCK_COUNT_VARIANCE","state_predicate":"VARIANCE_APPROVABLE_AND_SEGREGATION_VALID","subject_resolver":"EFFECTIVE_ACTOR_WITH_CAPTURE_SEGREGATION","territory_resolver":"STOCK_COUNT_SITE_AND_AREA"}
{"audit_policy":{"audit_policy_id":"audit.dual_lane_sensitive_mutation.v1","rule":"Actor, capturador, carriles, reautenticación, diferencia, resolución, versión, motivo, evidencia, decisión y timestamp."},"blocked_reason_codes":["AUTH_NO_SESSION","AUTH_USER_INACTIVE","AUTH_APP_ACCESS_DENIED","AUTH_ADMIN_PERMISSION_DENIED","AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT","AUTH_PERMISSION_NOT_REGISTERED","AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE","AUTH_SHARED_DEVICE_NOT_AUTHORIZED","AUTH_ACTION_NOT_ALLOWED_IN_SIMULATION","AUTH_OPERATIONAL_PERMISSION_DENIED","AUTH_SITE_ASSIGNMENT_REQUIRED","AUTH_ACTIVE_SITE_REQUIRED","AUTH_PUBLISHED_SHIFT_REQUIRED","AUTH_OUTSIDE_SHIFT_WINDOW","AUTH_CHECKIN_REQUIRED","AUTH_OPERATIONAL_ROLE_REQUIRED","AUTH_OPERATIONAL_ROLE_INVALID_FOR_SITE","AUTH_AREA_ASSIGNMENT_REQUIRED","AUTH_ACTIVE_AREA_REQUIRED","AUTH_OPERATIONAL_ROLE_INVALID_FOR_AREA"],"concurrency_policy":"EXPECTED_VERSION_AND_ROW_LOCK","contract_version":"1.0.0","field_policy":{"field_policy_id":"nexo.stock_count_variance.resolve.fields.v1","rule":"Solo permite tipo de resolución, motivo/evidencia y transición; prohíbe alterar captura o aplicar ajuste sin permiso separado."},"ownership_resolver":"NONE","record_type":"resource_contract","required_sides":["COUNT_SITE"],"resolution_outcomes":["RESOLVED","MULTI_RESOLVED","NOT_APPLICABLE","UNRESOLVED","CONFLICT","ISOLATED"],"resource_contract_hash":"sha256:1f182b5d2b1e4a0199554845f1d4e20de39ba3b870c6bcd02bd5ac481d75203e","resource_contract_id":"nexo.stock_count_variance.resolve.v1","resource_locator":["variance_id","resolution_type","reason_code","expected_version","evidence_ref"],"resource_type":"STOCK_COUNT_VARIANCE","state_predicate":"VARIANCE_RESOLVABLE_AND_SEGREGATION_VALID","subject_resolver":"EFFECTIVE_ACTOR_WITH_CAPTURE_SEGREGATION","territory_resolver":"STOCK_COUNT_SITE_AND_AREA"}
{"audit_policy":{"audit_policy_id":"audit.sensitive_mutation.v1","rule":"Actor, carril utilizado, orden, proveedor, documento, sede, líneas/cantidades, idempotencia, decisión y timestamp."},"blocked_reason_codes":["AUTH_NO_SESSION","AUTH_USER_INACTIVE","AUTH_APP_ACCESS_DENIED","AUTH_ADMIN_PERMISSION_DENIED","AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT","AUTH_PERMISSION_NOT_REGISTERED","AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE","AUTH_SHARED_DEVICE_NOT_AUTHORIZED","AUTH_ACTION_NOT_ALLOWED_IN_SIMULATION","AUTH_OPERATIONAL_PERMISSION_DENIED","AUTH_SITE_ASSIGNMENT_REQUIRED","AUTH_ACTIVE_SITE_REQUIRED","AUTH_PUBLISHED_SHIFT_REQUIRED","AUTH_OUTSIDE_SHIFT_WINDOW","AUTH_CHECKIN_REQUIRED","AUTH_OPERATIONAL_ROLE_REQUIRED","AUTH_OPERATIONAL_ROLE_INVALID_FOR_SITE"],"concurrency_policy":"IDEMPOTENCY_KEY","contract_version":"1.0.0","field_policy":{"field_policy_id":"origo.purchase_receipt.register.fields.v1","rule":"Solo permite documento, líneas, cantidades/condición recibidas y sede receptora; prohíbe modificar proveedor/orden o escribir inventario directamente."},"ownership_resolver":"NONE","record_type":"resource_contract","required_sides":["RECEIVING_SITE"],"resolution_outcomes":["RESOLVED","MULTI_RESOLVED","NOT_APPLICABLE","UNRESOLVED","CONFLICT","ISOLATED"],"resource_contract_hash":"sha256:a5cc1456c8fbbf11b6d5ee7dbe747d579b59aee7979f541b8201ac434160f3b5","resource_contract_id":"origo.purchase_receipt.register.v1","resource_locator":["purchase_order_id","supplier_id","commercial_document_ref","receiving_site_id","lines","received_quantities","condition","actor_id","idempotency_key"],"resource_type":"PURCHASE_RECEIPT_DRAFT","state_predicate":"PURCHASE_ORDER_RECEIVABLE","subject_resolver":"EFFECTIVE_ACTOR","territory_resolver":"PURCHASE_ORDER_AND_RECEIVING_SITE"}
{"audit_policy":{"audit_policy_id":"audit.sensitive_mutation.v1","rule":"Actor, sesión, conteo, diferencias, versión, contexto, antes/después, decisión y timestamp."},"blocked_reason_codes":["AUTH_NO_SESSION","AUTH_USER_INACTIVE","AUTH_APP_ACCESS_DENIED","AUTH_OPERATIONAL_PERMISSION_DENIED","AUTH_SITE_ASSIGNMENT_REQUIRED","AUTH_ACTIVE_SITE_REQUIRED","AUTH_PUBLISHED_SHIFT_REQUIRED","AUTH_OUTSIDE_SHIFT_WINDOW","AUTH_CHECKIN_REQUIRED","AUTH_OPERATIONAL_ROLE_REQUIRED","AUTH_OPERATIONAL_ROLE_INVALID_FOR_SITE","AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT","AUTH_PERMISSION_NOT_REGISTERED","AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE","AUTH_SHARED_DEVICE_NOT_AUTHORIZED","AUTH_ACTION_NOT_ALLOWED_IN_SIMULATION","AUTH_AREA_ASSIGNMENT_REQUIRED","AUTH_ACTIVE_AREA_REQUIRED","AUTH_OPERATIONAL_ROLE_INVALID_FOR_AREA"],"concurrency_policy":"EXPECTED_VERSION_AND_ROW_LOCK","contract_version":"1.0.0","field_policy":{"field_policy_id":"pulso.cash_session.close.fields.v1","rule":"Solo permite conteo final, diferencias y cierre; prohíbe aprobar diferencias, corregir movimientos o cerrar sesiones ajenas sin asignación explícita."},"ownership_resolver":"NONE","record_type":"resource_contract","required_sides":["CASH_SESSION_SITE"],"resolution_outcomes":["RESOLVED","MULTI_RESOLVED","NOT_APPLICABLE","UNRESOLVED","CONFLICT","ISOLATED"],"resource_contract_hash":"sha256:ed788bf96af86aee9c1533dd8f4e2fa89b0deb2961695f5bf7a6f04598ed9e20","resource_contract_id":"pulso.cash_session.close.v1","resource_locator":["cash_session_id","final_count","differences","expected_version","evidence_ref?"],"resource_type":"CASH_SESSION","state_predicate":"CASH_SESSION_OPEN_AND_CLOSABLE","subject_resolver":"EFFECTIVE_ACTOR_AND_EXPLICIT_CASH_SESSION_ASSIGNMENT","territory_resolver":"CASH_SESSION_SITE_AND_AREA"}
{"audit_policy":{"audit_policy_id":"audit.sensitive_mutation.v1","rule":"Actor, punto de caja, sede, área, monto inicial cuando aplique, contexto, idempotencia, decisión y timestamp."},"blocked_reason_codes":["AUTH_NO_SESSION","AUTH_USER_INACTIVE","AUTH_APP_ACCESS_DENIED","AUTH_OPERATIONAL_PERMISSION_DENIED","AUTH_SITE_ASSIGNMENT_REQUIRED","AUTH_ACTIVE_SITE_REQUIRED","AUTH_PUBLISHED_SHIFT_REQUIRED","AUTH_OUTSIDE_SHIFT_WINDOW","AUTH_CHECKIN_REQUIRED","AUTH_OPERATIONAL_ROLE_REQUIRED","AUTH_OPERATIONAL_ROLE_INVALID_FOR_SITE","AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT","AUTH_PERMISSION_NOT_REGISTERED","AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE","AUTH_SHARED_DEVICE_NOT_AUTHORIZED","AUTH_ACTION_NOT_ALLOWED_IN_SIMULATION","AUTH_AREA_ASSIGNMENT_REQUIRED","AUTH_ACTIVE_AREA_REQUIRED","AUTH_OPERATIONAL_ROLE_INVALID_FOR_AREA"],"concurrency_policy":"IDEMPOTENCY_KEY","contract_version":"1.0.0","field_policy":{"field_policy_id":"pulso.cash_session.start.fields.v1","rule":"Solo permite crear la sesión para el actor efectivo, punto y área autorizados; prohíbe abrir sesiones incompatibles o atribuirlas a otro actor."},"ownership_resolver":"NONE","record_type":"resource_contract","required_sides":["CASH_POINT_SITE"],"resolution_outcomes":["RESOLVED","MULTI_RESOLVED","NOT_APPLICABLE","UNRESOLVED","CONFLICT","ISOLATED"],"resource_contract_hash":"sha256:2a8e1035e2e76faea5571cdfc0a338833212797a6b5028532cb4b854d4f96c19","resource_contract_id":"pulso.cash_session.start.v1","resource_locator":["site_id","area_id","cash_point_id","actor_id","opening_amount?","idempotency_key"],"resource_type":"CASH_SESSION_DRAFT","state_predicate":"NO_INCOMPATIBLE_OPEN_CASH_SESSION","subject_resolver":"EFFECTIVE_ACTOR","territory_resolver":"CASH_POINT_SITE_AND_AREA"}
{"audit_policy":{"audit_policy_id":"audit.dual_lane_sensitive_mutation.v1","rule":"Actor, carriles, reautenticación, orden/línea, regla, cálculo antes/después, versión, motivo, evidencia, decisión y timestamp."},"blocked_reason_codes":["AUTH_NO_SESSION","AUTH_USER_INACTIVE","AUTH_APP_ACCESS_DENIED","AUTH_ADMIN_PERMISSION_DENIED","AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT","AUTH_PERMISSION_NOT_REGISTERED","AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE","AUTH_SHARED_DEVICE_NOT_AUTHORIZED","AUTH_ACTION_NOT_ALLOWED_IN_SIMULATION","AUTH_OPERATIONAL_PERMISSION_DENIED","AUTH_SITE_ASSIGNMENT_REQUIRED","AUTH_ACTIVE_SITE_REQUIRED","AUTH_PUBLISHED_SHIFT_REQUIRED","AUTH_OUTSIDE_SHIFT_WINDOW","AUTH_CHECKIN_REQUIRED","AUTH_OPERATIONAL_ROLE_REQUIRED","AUTH_OPERATIONAL_ROLE_INVALID_FOR_SITE"],"concurrency_policy":"EXPECTED_VERSION_AND_ROW_LOCK","contract_version":"1.0.0","field_policy":{"field_policy_id":"pulso.discount_application.apply.fields.v1","rule":"Solo permite una regla y valor dentro de límites aprobados; prohíbe modificar precios maestros, crear políticas o exceder límites."},"ownership_resolver":"NONE","record_type":"resource_contract","required_sides":["ORDER_SITE"],"resolution_outcomes":["RESOLVED","MULTI_RESOLVED","NOT_APPLICABLE","UNRESOLVED","CONFLICT","ISOLATED"],"resource_contract_hash":"sha256:f401d19344886c44d7b4127eea6d0eb439c51a218f877df57a5c0e8ed9e29187","resource_contract_id":"pulso.discount_application.apply.v1","resource_locator":["order_id","line_id?","discount_rule_id","value","reason_code","expected_version","evidence_ref"],"resource_type":"DISCOUNT_APPLICATION","state_predicate":"ORDER_DISCOUNTABLE_AND_RULE_APPLICABLE","subject_resolver":"EFFECTIVE_ACTOR","territory_resolver":"SALE_ORDER_SITE"}
{"audit_policy":{"audit_policy_id":"audit.dual_lane_sensitive_mutation.v1","rule":"Actor, carriles, reautenticación, pago, resolución/devolución, monto, motivo, evidencia, idempotencia, decisión y timestamp."},"blocked_reason_codes":["AUTH_NO_SESSION","AUTH_USER_INACTIVE","AUTH_APP_ACCESS_DENIED","AUTH_ADMIN_PERMISSION_DENIED","AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT","AUTH_PERMISSION_NOT_REGISTERED","AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE","AUTH_SHARED_DEVICE_NOT_AUTHORIZED","AUTH_ACTION_NOT_ALLOWED_IN_SIMULATION","AUTH_OPERATIONAL_PERMISSION_DENIED","AUTH_SITE_ASSIGNMENT_REQUIRED","AUTH_ACTIVE_SITE_REQUIRED","AUTH_PUBLISHED_SHIFT_REQUIRED","AUTH_OUTSIDE_SHIFT_WINDOW","AUTH_CHECKIN_REQUIRED","AUTH_OPERATIONAL_ROLE_REQUIRED","AUTH_OPERATIONAL_ROLE_INVALID_FOR_SITE","AUTH_AREA_ASSIGNMENT_REQUIRED","AUTH_ACTIVE_AREA_REQUIRED","AUTH_OPERATIONAL_ROLE_INVALID_FOR_AREA"],"concurrency_policy":"IDEMPOTENCY_KEY","contract_version":"1.0.0","field_policy":{"field_policy_id":"pulso.payment_refund.create.fields.v1","rule":"Solo permite monto reembolsable, medio elegible, motivo y vínculo aprobado; prohíbe alterar la transacción original o exceder el saldo."},"ownership_resolver":"NONE","record_type":"resource_contract","required_sides":["PAYMENT_SITE","RETURN_OR_RESOLUTION_SITE"],"resolution_outcomes":["RESOLVED","MULTI_RESOLVED","NOT_APPLICABLE","UNRESOLVED","CONFLICT","ISOLATED"],"resource_contract_hash":"sha256:9868adc18563938a50c622b60305dd82c75ca9dd23d8ee239809a8a98b8795a2","resource_contract_id":"pulso.payment_refund.create.v1","resource_locator":["payment_transaction_id","return_or_resolution_id","amount","payment_method_id","reason_code","idempotency_key","evidence_ref"],"resource_type":"PAYMENT_REFUND_DRAFT","state_predicate":"PAYMENT_REFUNDABLE_AND_AMOUNT_WITHIN_BALANCE","subject_resolver":"EFFECTIVE_ACTOR","territory_resolver":"INTERSECTION_OF_PAYMENT_AND_RESOLUTION_TERRITORY"}
{"audit_policy":{"audit_policy_id":"audit.sensitive_mutation.v1","rule":"Actor, caja, orden, medio, monto, moneda, contexto, decisión, idempotencia, resultado y timestamp."},"blocked_reason_codes":["AUTH_NO_SESSION","AUTH_USER_INACTIVE","AUTH_APP_ACCESS_DENIED","AUTH_OPERATIONAL_PERMISSION_DENIED","AUTH_SITE_ASSIGNMENT_REQUIRED","AUTH_ACTIVE_SITE_REQUIRED","AUTH_PUBLISHED_SHIFT_REQUIRED","AUTH_OUTSIDE_SHIFT_WINDOW","AUTH_CHECKIN_REQUIRED","AUTH_OPERATIONAL_ROLE_REQUIRED","AUTH_OPERATIONAL_ROLE_INVALID_FOR_SITE","AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT","AUTH_PERMISSION_NOT_REGISTERED","AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE","AUTH_SHARED_DEVICE_NOT_AUTHORIZED","AUTH_ACTION_NOT_ALLOWED_IN_SIMULATION","AUTH_AREA_ASSIGNMENT_REQUIRED","AUTH_ACTIVE_AREA_REQUIRED","AUTH_OPERATIONAL_ROLE_INVALID_FOR_AREA"],"concurrency_policy":"IDEMPOTENCY_KEY","contract_version":"1.0.0","field_policy":{"field_policy_id":"pulso.payment_transaction.collect.fields.v1","rule":"Permite medio, monto cobrable, moneda y evidencia del cobro; prohíbe modificar precios, líneas, dueño de caja o monto fuera del saldo elegible."},"ownership_resolver":"NONE","record_type":"resource_contract","required_sides":["ORDER_SITE","CASH_SESSION_SITE"],"resolution_outcomes":["RESOLVED","MULTI_RESOLVED","NOT_APPLICABLE","UNRESOLVED","CONFLICT","ISOLATED"],"resource_contract_hash":"sha256:64979f0f675aab10ab85a7ed63d6705ca862768db40d946b2c4e107c7f400176","resource_contract_id":"pulso.payment_transaction.collect.v1","resource_locator":["order_id","cash_session_id","payment_method_id","amount","currency","idempotency_key"],"resource_type":"PAYMENT_TRANSACTION_DRAFT","state_predicate":"ORDER_COLLECTIBLE_AND_CASH_SESSION_OPEN","subject_resolver":"EFFECTIVE_ACTOR_AND_CASH_SESSION_ATTRIBUTION","territory_resolver":"INTERSECTION_OF_ORDER_AND_CASH_SESSION_TERRITORY"}
{"audit_policy":{"audit_policy_id":"audit.dual_lane_sensitive_mutation.v1","rule":"Actor, componentes base y operativo, reautenticación, pago, versión esperada, motivo, evidencia, antes/después, decisión y timestamp."},"blocked_reason_codes":["AUTH_NO_SESSION","AUTH_USER_INACTIVE","AUTH_APP_ACCESS_DENIED","AUTH_ADMIN_PERMISSION_DENIED","AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT","AUTH_PERMISSION_NOT_REGISTERED","AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE","AUTH_SHARED_DEVICE_NOT_AUTHORIZED","AUTH_ACTION_NOT_ALLOWED_IN_SIMULATION","AUTH_OPERATIONAL_PERMISSION_DENIED","AUTH_SITE_ASSIGNMENT_REQUIRED","AUTH_ACTIVE_SITE_REQUIRED","AUTH_PUBLISHED_SHIFT_REQUIRED","AUTH_OUTSIDE_SHIFT_WINDOW","AUTH_CHECKIN_REQUIRED","AUTH_OPERATIONAL_ROLE_REQUIRED","AUTH_OPERATIONAL_ROLE_INVALID_FOR_SITE","AUTH_AREA_ASSIGNMENT_REQUIRED","AUTH_ACTIVE_AREA_REQUIRED","AUTH_OPERATIONAL_ROLE_INVALID_FOR_AREA"],"concurrency_policy":"EXPECTED_VERSION_AND_ROW_LOCK","contract_version":"1.0.0","field_policy":{"field_policy_id":"pulso.payment_transaction.reverse.fields.v1","rule":"Solo permite razón, evidencia y transición de reversión; prohíbe alterar el pago original, crear devolución o exceder el monto reversible."},"ownership_resolver":"NONE","record_type":"resource_contract","required_sides":["PAYMENT_SITE"],"resolution_outcomes":["RESOLVED","MULTI_RESOLVED","NOT_APPLICABLE","UNRESOLVED","CONFLICT","ISOLATED"],"resource_contract_hash":"sha256:776e74bbdc4c8ee591f39fe09d78a9c31b07773f9c8665631396dbf5c703494b","resource_contract_id":"pulso.payment_transaction.reverse.v1","resource_locator":["payment_transaction_id","reason_code","expected_version","evidence_ref"],"resource_type":"PAYMENT_TRANSACTION","state_predicate":"PAYMENT_REVERSIBLE","subject_resolver":"EFFECTIVE_ACTOR","territory_resolver":"PAYMENT_TRANSACTION_SITE"}
{"audit_policy":{"audit_policy_id":"audit.dual_lane_sensitive_mutation.v1","rule":"Actor, carriles base/operativo, reautenticación, orden, versión, motivo, evidencia, antes/después, decisión y timestamp."},"blocked_reason_codes":["AUTH_NO_SESSION","AUTH_USER_INACTIVE","AUTH_APP_ACCESS_DENIED","AUTH_ADMIN_PERMISSION_DENIED","AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT","AUTH_PERMISSION_NOT_REGISTERED","AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE","AUTH_SHARED_DEVICE_NOT_AUTHORIZED","AUTH_ACTION_NOT_ALLOWED_IN_SIMULATION","AUTH_OPERATIONAL_PERMISSION_DENIED","AUTH_SITE_ASSIGNMENT_REQUIRED","AUTH_ACTIVE_SITE_REQUIRED","AUTH_PUBLISHED_SHIFT_REQUIRED","AUTH_OUTSIDE_SHIFT_WINDOW","AUTH_CHECKIN_REQUIRED","AUTH_OPERATIONAL_ROLE_REQUIRED","AUTH_OPERATIONAL_ROLE_INVALID_FOR_SITE"],"concurrency_policy":"EXPECTED_VERSION_AND_ROW_LOCK","contract_version":"1.0.0","field_policy":{"field_policy_id":"pulso.sale_order.cancel.fields.v1","rule":"Solo permite la transición de cancelación y su evidencia; prohíbe reembolsar, devolver, ajustar inventario o eliminar historial por implicación."},"ownership_resolver":"NONE","record_type":"resource_contract","required_sides":["ORDER_SITE"],"resolution_outcomes":["RESOLVED","MULTI_RESOLVED","NOT_APPLICABLE","UNRESOLVED","CONFLICT","ISOLATED"],"resource_contract_hash":"sha256:d90a571ab3dae3aabfe45a6a28e0d0bc6930b891634e6624e6117f6efdfc935c","resource_contract_id":"pulso.sale_order.cancel.v1","resource_locator":["order_id","reason_code","expected_version","evidence_ref"],"resource_type":"SALE_ORDER","state_predicate":"ORDER_CANCELABLE","subject_resolver":"EFFECTIVE_ACTOR","territory_resolver":"SALE_ORDER_SITE"}
{"audit_policy":{"audit_policy_id":"audit.operational_mutation.v1","rule":"Actor, contexto efectivo, alcance resuelto, borrador normalizado, decisión, idempotency_key y timestamp."},"blocked_reason_codes":["AUTH_NO_SESSION","AUTH_USER_INACTIVE","AUTH_APP_ACCESS_DENIED","AUTH_OPERATIONAL_PERMISSION_DENIED","AUTH_SITE_ASSIGNMENT_REQUIRED","AUTH_ACTIVE_SITE_REQUIRED","AUTH_PUBLISHED_SHIFT_REQUIRED","AUTH_OUTSIDE_SHIFT_WINDOW","AUTH_CHECKIN_REQUIRED","AUTH_OPERATIONAL_ROLE_REQUIRED","AUTH_OPERATIONAL_ROLE_INVALID_FOR_SITE","AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT","AUTH_PERMISSION_NOT_REGISTERED","AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE","AUTH_SHARED_DEVICE_NOT_AUTHORIZED","AUTH_ACTION_NOT_ALLOWED_IN_SIMULATION"],"concurrency_policy":"IDEMPOTENCY_KEY","contract_version":"1.0.0","field_policy":{"field_policy_id":"pulso.sale_order.create.fields.v1","rule":"Solo permite sede/área autorizadas, canal, líneas, lista de precios aprobada e idempotencia; prohíbe totales o precios libres no autorizados."},"ownership_resolver":"NONE","record_type":"resource_contract","required_sides":["TARGET_SITE"],"resolution_outcomes":["RESOLVED","MULTI_RESOLVED","NOT_APPLICABLE","UNRESOLVED","CONFLICT","ISOLATED"],"resource_contract_hash":"sha256:bb0c016241e53fdd45e45869da89a89b10bc3c998a6af3e0ecb128ffd7df792b","resource_contract_id":"pulso.sale_order.create.v1","resource_locator":["site_id","area_id?","channel","lines","price_list_id","idempotency_key"],"resource_type":"SALE_ORDER_DRAFT","state_predicate":"COMMERCIAL_CONTEXT_VALID_AND_ORDER_DRAFT_CREATABLE","subject_resolver":"EFFECTIVE_ACTOR","territory_resolver":"TARGET_SITE_AND_OPTIONAL_AREA_FROM_DRAFT"}
{"audit_policy":{"audit_policy_id":"audit.dual_lane_sensitive_mutation.v1","rule":"Actor, carriles, reautenticación, orden/líneas, cantidades, motivo, evidencia, idempotencia, decisión y timestamp."},"blocked_reason_codes":["AUTH_NO_SESSION","AUTH_USER_INACTIVE","AUTH_APP_ACCESS_DENIED","AUTH_ADMIN_PERMISSION_DENIED","AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT","AUTH_PERMISSION_NOT_REGISTERED","AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE","AUTH_SHARED_DEVICE_NOT_AUTHORIZED","AUTH_ACTION_NOT_ALLOWED_IN_SIMULATION","AUTH_OPERATIONAL_PERMISSION_DENIED","AUTH_SITE_ASSIGNMENT_REQUIRED","AUTH_ACTIVE_SITE_REQUIRED","AUTH_PUBLISHED_SHIFT_REQUIRED","AUTH_OUTSIDE_SHIFT_WINDOW","AUTH_CHECKIN_REQUIRED","AUTH_OPERATIONAL_ROLE_REQUIRED","AUTH_OPERATIONAL_ROLE_INVALID_FOR_SITE"],"concurrency_policy":"IDEMPOTENCY_KEY","contract_version":"1.0.0","field_policy":{"field_policy_id":"pulso.sale_return.create.fields.v1","rule":"Solo permite líneas y cantidades elegibles, motivo y receptor; prohíbe exceder cantidades entregadas, reembolsar o ajustar inventario silenciosamente."},"ownership_resolver":"NONE","record_type":"resource_contract","required_sides":["ORDER_SITE"],"resolution_outcomes":["RESOLVED","MULTI_RESOLVED","NOT_APPLICABLE","UNRESOLVED","CONFLICT","ISOLATED"],"resource_contract_hash":"sha256:9f9ebc31d231ea5a424e323e8d971a1ba90500d3ff240b44a0c15ae149a2ecdf","resource_contract_id":"pulso.sale_return.create.v1","resource_locator":["order_id","lines","quantities","reason_code","receiver_id?","idempotency_key","evidence_ref"],"resource_type":"SALE_RETURN_DRAFT","state_predicate":"ORDER_LINES_RETURNABLE","subject_resolver":"EFFECTIVE_ACTOR","territory_resolver":"SALE_ORDER_SITE"}
{"audit_policy":{"audit_policy_id":"audit.authorization_governance_mutation.v1","rule":"Actor aprobador, creador, afectado, permiso, alcance, versión, reautenticación, motivo/evidencia, antes/después, decisión y timestamp."},"blocked_reason_codes":["AUTH_NO_SESSION","AUTH_USER_INACTIVE","AUTH_APP_ACCESS_DENIED","AUTH_ADMIN_PERMISSION_DENIED","AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT","AUTH_PERMISSION_NOT_REGISTERED","AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE","AUTH_SHARED_DEVICE_NOT_AUTHORIZED","AUTH_ACTION_NOT_ALLOWED_IN_SIMULATION"],"concurrency_policy":"EXPECTED_VERSION_AND_ROW_LOCK","contract_version":"1.0.0","field_policy":{"field_policy_id":"viso.base_grants.approve.fields.v1","rule":"Solo permite aprobación/activación y evidencia sobre propuesta inmutable; prohíbe cambiar sujeto, permiso, carril o alcance durante la aprobación."},"ownership_resolver":"NONE","record_type":"resource_contract","required_sides":["ORGANIZATION","TARGET_SUBJECT","TARGET_PERMISSION_SCOPE"],"resolution_outcomes":["RESOLVED","MULTI_RESOLVED","NOT_APPLICABLE","UNRESOLVED","CONFLICT","ISOLATED"],"resource_contract_hash":"sha256:f9aac6a5629a5be67a731d142d4f4d2756e68e2d0aaec8975d4b9a5b61dbfb76","resource_contract_id":"viso.base_grants.approve.v1","resource_locator":["record_id","reason","evidence_ref","expected_version"],"resource_type":"INDIVIDUAL_BASE_GRANT","state_predicate":"PROPOSAL_PENDING_AND_SEGREGATION_VALID","subject_resolver":"EFFECTIVE_ADMIN_ACTOR_AND_TARGET_EMPLOYEE","territory_resolver":"ORGANIZATIONAL_GOVERNANCE_RECORD_WITH_TARGET_SCOPE_VALIDATION"}
{"audit_policy":{"audit_policy_id":"audit.authorization_governance_mutation.v1","rule":"Actor creador, afectado, permiso, carril, alcance, vigencia, motivo, origen, reautenticación, idempotencia, decisión y timestamp."},"blocked_reason_codes":["AUTH_NO_SESSION","AUTH_USER_INACTIVE","AUTH_APP_ACCESS_DENIED","AUTH_ADMIN_PERMISSION_DENIED","AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT","AUTH_PERMISSION_NOT_REGISTERED","AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE","AUTH_SHARED_DEVICE_NOT_AUTHORIZED","AUTH_ACTION_NOT_ALLOWED_IN_SIMULATION"],"concurrency_policy":"IDEMPOTENCY_KEY","contract_version":"1.0.0","field_policy":{"field_policy_id":"viso.base_grants.create.fields.v1","rule":"Solo crea propuesta no activa con sujeto, permiso, carril, alcance, vigencia, motivo y origen exactos; prohíbe autoactivación y wildcard."},"ownership_resolver":"NONE","record_type":"resource_contract","required_sides":["ORGANIZATION","TARGET_SUBJECT","TARGET_PERMISSION_SCOPE"],"resolution_outcomes":["RESOLVED","MULTI_RESOLVED","NOT_APPLICABLE","UNRESOLVED","CONFLICT","ISOLATED"],"resource_contract_hash":"sha256:39e636d749b6d1ef8f188fd2c90ab1a3034a3b7344da3c2388252631365d76e6","resource_contract_id":"viso.base_grants.create.v1","resource_locator":["target_employee_id","permission_key","lane","scope","valid_from","valid_until","reason","source_reference","idempotency_key"],"resource_type":"INDIVIDUAL_BASE_GRANT","state_predicate":"TARGET_PERMISSION_AND_SCOPE_VALID_AND_PROPOSABLE","subject_resolver":"EFFECTIVE_ADMIN_ACTOR_AND_TARGET_EMPLOYEE","territory_resolver":"ORGANIZATIONAL_GOVERNANCE_RECORD_WITH_TARGET_SCOPE_VALIDATION"}
{"audit_policy":{"audit_policy_id":"audit.authorization_governance_mutation.v1","rule":"Actor, afectado, permiso, alcance, versión, reautenticación, motivo/evidencia, antes/después, decisión, invalidación requerida y timestamp."},"blocked_reason_codes":["AUTH_NO_SESSION","AUTH_USER_INACTIVE","AUTH_APP_ACCESS_DENIED","AUTH_ADMIN_PERMISSION_DENIED","AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT","AUTH_PERMISSION_NOT_REGISTERED","AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE","AUTH_SHARED_DEVICE_NOT_AUTHORIZED","AUTH_ACTION_NOT_ALLOWED_IN_SIMULATION"],"concurrency_policy":"EXPECTED_VERSION_AND_ROW_LOCK","contract_version":"1.0.0","field_policy":{"field_policy_id":"viso.base_grants.revoke.fields.v1","rule":"Solo permite revocación auditable; prohíbe eliminación física, modificación retroactiva y cualquier concesión implícita al revocar una denegación."},"ownership_resolver":"NONE","record_type":"resource_contract","required_sides":["ORGANIZATION","TARGET_SUBJECT","TARGET_PERMISSION_SCOPE"],"resolution_outcomes":["RESOLVED","MULTI_RESOLVED","NOT_APPLICABLE","UNRESOLVED","CONFLICT","ISOLATED"],"resource_contract_hash":"sha256:35e6e0e1cea57b0b76ecf6e611840d8e9f69db93f776b87c44a70c5ee81a68ec","resource_contract_id":"viso.base_grants.revoke.v1","resource_locator":["record_id","reason","evidence_ref","expected_version"],"resource_type":"INDIVIDUAL_BASE_GRANT","state_predicate":"RECORD_ACTIVE_OR_SUSPENDED_AND_REVOCABLE","subject_resolver":"EFFECTIVE_ADMIN_ACTOR_AND_TARGET_EMPLOYEE","territory_resolver":"ORGANIZATIONAL_GOVERNANCE_RECORD_WITH_TARGET_SCOPE_VALIDATION"}
{"audit_policy":{"audit_policy_id":"audit.authorization_governance_mutation.v1","rule":"Actor, afectado, permiso, alcance, versión, reautenticación, motivo/evidencia, vigencia de suspensión, antes/después, decisión y timestamp."},"blocked_reason_codes":["AUTH_NO_SESSION","AUTH_USER_INACTIVE","AUTH_APP_ACCESS_DENIED","AUTH_ADMIN_PERMISSION_DENIED","AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT","AUTH_PERMISSION_NOT_REGISTERED","AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE","AUTH_SHARED_DEVICE_NOT_AUTHORIZED","AUTH_ACTION_NOT_ALLOWED_IN_SIMULATION"],"concurrency_policy":"EXPECTED_VERSION_AND_ROW_LOCK","contract_version":"1.0.0","field_policy":{"field_policy_id":"viso.base_grants.suspend.fields.v1","rule":"Solo permite suspender una concesión positiva activa con motivo/evidencia; prohíbe modificar su identidad contractual o borrar historial."},"ownership_resolver":"NONE","record_type":"resource_contract","required_sides":["ORGANIZATION","TARGET_SUBJECT","TARGET_PERMISSION_SCOPE"],"resolution_outcomes":["RESOLVED","MULTI_RESOLVED","NOT_APPLICABLE","UNRESOLVED","CONFLICT","ISOLATED"],"resource_contract_hash":"sha256:7ba7a961db49ad02da25f85f8349d9d8f23cdb4e895f4296f8a57004ced1f424","resource_contract_id":"viso.base_grants.suspend.v1","resource_locator":["record_id","reason","evidence_ref","expected_version","suspension_until?"],"resource_type":"INDIVIDUAL_BASE_GRANT","state_predicate":"POSITIVE_GRANT_ACTIVE_AND_SUSPENDABLE","subject_resolver":"EFFECTIVE_ADMIN_ACTOR_AND_TARGET_EMPLOYEE","territory_resolver":"ORGANIZATIONAL_GOVERNANCE_RECORD_WITH_TARGET_SCOPE_VALIDATION"}
{"audit_policy":{"audit_policy_id":"audit.authorization_governance_read.v1","rule":"Actor, filtros, alcance ORG, categoría de registros consultada, conteo/proyección, reautenticación, decisión y timestamp."},"blocked_reason_codes":["AUTH_NO_SESSION","AUTH_USER_INACTIVE","AUTH_APP_ACCESS_DENIED","AUTH_ADMIN_PERMISSION_DENIED","AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT","AUTH_PERMISSION_NOT_REGISTERED","AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE","AUTH_SHARED_DEVICE_NOT_AUTHORIZED","AUTH_ACTION_NOT_ALLOWED_IN_SIMULATION"],"concurrency_policy":"CONSISTENT_SNAPSHOT_READ","contract_version":"1.0.0","field_policy":{"field_policy_id":"viso.base_grants.view.fields.v1","rule":"Solo expone metadata de gobierno necesaria dentro de ORG; no expone secretos ni convierte lectura en autoridad de mutación."},"ownership_resolver":"NONE","record_type":"resource_contract","required_sides":["ORGANIZATION","TARGET_SUBJECT","TARGET_PERMISSION_SCOPE"],"resolution_outcomes":["RESOLVED","MULTI_RESOLVED","NOT_APPLICABLE","UNRESOLVED","CONFLICT","ISOLATED"],"resource_contract_hash":"sha256:44f5e4e6ec9bfeb92bbeca987e816a2dd60d0133eeaa51713400ae30a22b880c","resource_contract_id":"viso.base_grants.view.v1","resource_locator":["record_id?","target_employee_id?","permission_key?","lifecycle_status?"],"resource_type":"INDIVIDUAL_BASE_GRANT","state_predicate":"RECORD_VISIBLE_WITHIN_AUTHORIZATION_GOVERNANCE_SCOPE","subject_resolver":"EFFECTIVE_ADMIN_ACTOR_AND_TARGET_EMPLOYEE","territory_resolver":"ORGANIZATIONAL_GOVERNANCE_RECORD_WITH_TARGET_SCOPE_VALIDATION"}
{"audit_policy":{"audit_policy_id":"audit.authorization_governance_mutation.v1","rule":"Actor aprobador, creador, afectado, permiso, alcance, versión, reautenticación, motivo/evidencia, antes/después, decisión y timestamp."},"blocked_reason_codes":["AUTH_NO_SESSION","AUTH_USER_INACTIVE","AUTH_APP_ACCESS_DENIED","AUTH_ADMIN_PERMISSION_DENIED","AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT","AUTH_PERMISSION_NOT_REGISTERED","AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE","AUTH_SHARED_DEVICE_NOT_AUTHORIZED","AUTH_ACTION_NOT_ALLOWED_IN_SIMULATION"],"concurrency_policy":"EXPECTED_VERSION_AND_ROW_LOCK","contract_version":"1.0.0","field_policy":{"field_policy_id":"viso.denials.approve.fields.v1","rule":"Solo permite aprobación/activación y evidencia sobre propuesta inmutable; prohíbe cambiar sujeto, permiso, carril o alcance durante la aprobación."},"ownership_resolver":"NONE","record_type":"resource_contract","required_sides":["ORGANIZATION","TARGET_SUBJECT","TARGET_PERMISSION_SCOPE"],"resolution_outcomes":["RESOLVED","MULTI_RESOLVED","NOT_APPLICABLE","UNRESOLVED","CONFLICT","ISOLATED"],"resource_contract_hash":"sha256:157b2599016b489faff28fd32048722a91d681e5ea9e110a96cbcc2b72979e6e","resource_contract_id":"viso.denials.approve.v1","resource_locator":["record_id","reason","evidence_ref","expected_version"],"resource_type":"INDIVIDUAL_DENIAL","state_predicate":"PROPOSAL_PENDING_AND_SEGREGATION_VALID","subject_resolver":"EFFECTIVE_ADMIN_ACTOR_AND_TARGET_EMPLOYEE","territory_resolver":"ORGANIZATIONAL_GOVERNANCE_RECORD_WITH_TARGET_SCOPE_VALIDATION"}
{"audit_policy":{"audit_policy_id":"audit.authorization_governance_mutation.v1","rule":"Actor creador, afectado, permiso, carril, alcance, vigencia, motivo, origen, reautenticación, idempotencia, decisión y timestamp."},"blocked_reason_codes":["AUTH_NO_SESSION","AUTH_USER_INACTIVE","AUTH_APP_ACCESS_DENIED","AUTH_ADMIN_PERMISSION_DENIED","AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT","AUTH_PERMISSION_NOT_REGISTERED","AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE","AUTH_SHARED_DEVICE_NOT_AUTHORIZED","AUTH_ACTION_NOT_ALLOWED_IN_SIMULATION"],"concurrency_policy":"IDEMPOTENCY_KEY","contract_version":"1.0.0","field_policy":{"field_policy_id":"viso.denials.create.fields.v1","rule":"Solo crea propuesta no activa con sujeto, permiso, carril, alcance, vigencia, motivo y origen exactos; prohíbe autoactivación y wildcard."},"ownership_resolver":"NONE","record_type":"resource_contract","required_sides":["ORGANIZATION","TARGET_SUBJECT","TARGET_PERMISSION_SCOPE"],"resolution_outcomes":["RESOLVED","MULTI_RESOLVED","NOT_APPLICABLE","UNRESOLVED","CONFLICT","ISOLATED"],"resource_contract_hash":"sha256:84370ebbf30124856571ef0522e5b6b5bcfdcc2b7f36ecbf8d777e21fb90e2da","resource_contract_id":"viso.denials.create.v1","resource_locator":["target_employee_id","permission_key","lane","scope","valid_from","valid_until","reason","source_reference","idempotency_key"],"resource_type":"INDIVIDUAL_DENIAL","state_predicate":"TARGET_PERMISSION_AND_SCOPE_VALID_AND_PROPOSABLE","subject_resolver":"EFFECTIVE_ADMIN_ACTOR_AND_TARGET_EMPLOYEE","territory_resolver":"ORGANIZATIONAL_GOVERNANCE_RECORD_WITH_TARGET_SCOPE_VALIDATION"}
{"audit_policy":{"audit_policy_id":"audit.authorization_governance_mutation.v1","rule":"Actor, afectado, permiso, alcance, versión, reautenticación, motivo/evidencia, antes/después, decisión, invalidación requerida y timestamp."},"blocked_reason_codes":["AUTH_NO_SESSION","AUTH_USER_INACTIVE","AUTH_APP_ACCESS_DENIED","AUTH_ADMIN_PERMISSION_DENIED","AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT","AUTH_PERMISSION_NOT_REGISTERED","AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE","AUTH_SHARED_DEVICE_NOT_AUTHORIZED","AUTH_ACTION_NOT_ALLOWED_IN_SIMULATION"],"concurrency_policy":"EXPECTED_VERSION_AND_ROW_LOCK","contract_version":"1.0.0","field_policy":{"field_policy_id":"viso.denials.revoke.fields.v1","rule":"Solo permite revocación auditable; prohíbe eliminación física, modificación retroactiva y cualquier concesión implícita al revocar una denegación."},"ownership_resolver":"NONE","record_type":"resource_contract","required_sides":["ORGANIZATION","TARGET_SUBJECT","TARGET_PERMISSION_SCOPE"],"resolution_outcomes":["RESOLVED","MULTI_RESOLVED","NOT_APPLICABLE","UNRESOLVED","CONFLICT","ISOLATED"],"resource_contract_hash":"sha256:087f25649d77a67214d7514210138796daeefd641f02c8364d12b6c2cc510df1","resource_contract_id":"viso.denials.revoke.v1","resource_locator":["record_id","reason","evidence_ref","expected_version"],"resource_type":"INDIVIDUAL_DENIAL","state_predicate":"RECORD_ACTIVE_OR_SUSPENDED_AND_REVOCABLE","subject_resolver":"EFFECTIVE_ADMIN_ACTOR_AND_TARGET_EMPLOYEE","territory_resolver":"ORGANIZATIONAL_GOVERNANCE_RECORD_WITH_TARGET_SCOPE_VALIDATION"}
{"audit_policy":{"audit_policy_id":"audit.authorization_governance_read.v1","rule":"Actor, filtros, alcance ORG, categoría de registros consultada, conteo/proyección, reautenticación, decisión y timestamp."},"blocked_reason_codes":["AUTH_NO_SESSION","AUTH_USER_INACTIVE","AUTH_APP_ACCESS_DENIED","AUTH_ADMIN_PERMISSION_DENIED","AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT","AUTH_PERMISSION_NOT_REGISTERED","AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE","AUTH_SHARED_DEVICE_NOT_AUTHORIZED","AUTH_ACTION_NOT_ALLOWED_IN_SIMULATION"],"concurrency_policy":"CONSISTENT_SNAPSHOT_READ","contract_version":"1.0.0","field_policy":{"field_policy_id":"viso.denials.view.fields.v1","rule":"Solo expone metadata de gobierno necesaria dentro de ORG; no expone secretos ni convierte lectura en autoridad de mutación."},"ownership_resolver":"NONE","record_type":"resource_contract","required_sides":["ORGANIZATION","TARGET_SUBJECT","TARGET_PERMISSION_SCOPE"],"resolution_outcomes":["RESOLVED","MULTI_RESOLVED","NOT_APPLICABLE","UNRESOLVED","CONFLICT","ISOLATED"],"resource_contract_hash":"sha256:7822522e23e06028d420c7ddc0f2f1e2d6c69aae4a9c2a98701ee4aedb3b25d2","resource_contract_id":"viso.denials.view.v1","resource_locator":["record_id?","target_employee_id?","permission_key?","lifecycle_status?"],"resource_type":"INDIVIDUAL_DENIAL","state_predicate":"RECORD_VISIBLE_WITHIN_AUTHORIZATION_GOVERNANCE_SCOPE","subject_resolver":"EFFECTIVE_ADMIN_ACTOR_AND_TARGET_EMPLOYEE","territory_resolver":"ORGANIZATIONAL_GOVERNANCE_RECORD_WITH_TARGET_SCOPE_VALIDATION"}
{"audit_policy":{"audit_policy_id":"audit.authorization_governance_mutation.v1","rule":"Actor aprobador, creador, afectado, permiso, alcance, versión, reautenticación, motivo/evidencia, antes/después, decisión y timestamp."},"blocked_reason_codes":["AUTH_NO_SESSION","AUTH_USER_INACTIVE","AUTH_APP_ACCESS_DENIED","AUTH_ADMIN_PERMISSION_DENIED","AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT","AUTH_PERMISSION_NOT_REGISTERED","AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE","AUTH_SHARED_DEVICE_NOT_AUTHORIZED","AUTH_ACTION_NOT_ALLOWED_IN_SIMULATION"],"concurrency_policy":"EXPECTED_VERSION_AND_ROW_LOCK","contract_version":"1.0.0","field_policy":{"field_policy_id":"viso.operational_grants.approve.fields.v1","rule":"Solo permite aprobación/activación y evidencia sobre propuesta inmutable; prohíbe cambiar sujeto, permiso, carril o alcance durante la aprobación."},"ownership_resolver":"NONE","record_type":"resource_contract","required_sides":["ORGANIZATION","TARGET_SUBJECT","TARGET_PERMISSION_SCOPE"],"resolution_outcomes":["RESOLVED","MULTI_RESOLVED","NOT_APPLICABLE","UNRESOLVED","CONFLICT","ISOLATED"],"resource_contract_hash":"sha256:029573dacc9d59f067f0c1b5602b09f987f2f9a60851758c9f81b009ea0ee8e8","resource_contract_id":"viso.operational_grants.approve.v1","resource_locator":["record_id","reason","evidence_ref","expected_version"],"resource_type":"INDIVIDUAL_OPERATIONAL_GRANT","state_predicate":"PROPOSAL_PENDING_AND_SEGREGATION_VALID","subject_resolver":"EFFECTIVE_ADMIN_ACTOR_AND_TARGET_EMPLOYEE","territory_resolver":"ORGANIZATIONAL_GOVERNANCE_RECORD_WITH_TARGET_SCOPE_VALIDATION"}
{"audit_policy":{"audit_policy_id":"audit.authorization_governance_mutation.v1","rule":"Actor creador, afectado, permiso, carril, alcance, vigencia, motivo, origen, reautenticación, idempotencia, decisión y timestamp."},"blocked_reason_codes":["AUTH_NO_SESSION","AUTH_USER_INACTIVE","AUTH_APP_ACCESS_DENIED","AUTH_ADMIN_PERMISSION_DENIED","AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT","AUTH_PERMISSION_NOT_REGISTERED","AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE","AUTH_SHARED_DEVICE_NOT_AUTHORIZED","AUTH_ACTION_NOT_ALLOWED_IN_SIMULATION"],"concurrency_policy":"IDEMPOTENCY_KEY","contract_version":"1.0.0","field_policy":{"field_policy_id":"viso.operational_grants.create.fields.v1","rule":"Solo crea propuesta no activa con sujeto, permiso, carril, alcance, vigencia, motivo y origen exactos; prohíbe autoactivación y wildcard."},"ownership_resolver":"NONE","record_type":"resource_contract","required_sides":["ORGANIZATION","TARGET_SUBJECT","TARGET_PERMISSION_SCOPE"],"resolution_outcomes":["RESOLVED","MULTI_RESOLVED","NOT_APPLICABLE","UNRESOLVED","CONFLICT","ISOLATED"],"resource_contract_hash":"sha256:da17058c53f42abe9c838c85d5c37ea4aba140ea3f2604f50a734fa2e242bb8c","resource_contract_id":"viso.operational_grants.create.v1","resource_locator":["target_employee_id","permission_key","lane","scope","valid_from","valid_until","reason","source_reference","idempotency_key"],"resource_type":"INDIVIDUAL_OPERATIONAL_GRANT","state_predicate":"TARGET_PERMISSION_AND_SCOPE_VALID_AND_PROPOSABLE","subject_resolver":"EFFECTIVE_ADMIN_ACTOR_AND_TARGET_EMPLOYEE","territory_resolver":"ORGANIZATIONAL_GOVERNANCE_RECORD_WITH_TARGET_SCOPE_VALIDATION"}
{"audit_policy":{"audit_policy_id":"audit.authorization_governance_mutation.v1","rule":"Actor, afectado, permiso, alcance, versión, reautenticación, motivo/evidencia, antes/después, decisión, invalidación requerida y timestamp."},"blocked_reason_codes":["AUTH_NO_SESSION","AUTH_USER_INACTIVE","AUTH_APP_ACCESS_DENIED","AUTH_ADMIN_PERMISSION_DENIED","AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT","AUTH_PERMISSION_NOT_REGISTERED","AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE","AUTH_SHARED_DEVICE_NOT_AUTHORIZED","AUTH_ACTION_NOT_ALLOWED_IN_SIMULATION"],"concurrency_policy":"EXPECTED_VERSION_AND_ROW_LOCK","contract_version":"1.0.0","field_policy":{"field_policy_id":"viso.operational_grants.revoke.fields.v1","rule":"Solo permite revocación auditable; prohíbe eliminación física, modificación retroactiva y cualquier concesión implícita al revocar una denegación."},"ownership_resolver":"NONE","record_type":"resource_contract","required_sides":["ORGANIZATION","TARGET_SUBJECT","TARGET_PERMISSION_SCOPE"],"resolution_outcomes":["RESOLVED","MULTI_RESOLVED","NOT_APPLICABLE","UNRESOLVED","CONFLICT","ISOLATED"],"resource_contract_hash":"sha256:3c51f51390508b8d41853e47ef25c6755b45efaf12fe83846ff4fff13fb1a2c8","resource_contract_id":"viso.operational_grants.revoke.v1","resource_locator":["record_id","reason","evidence_ref","expected_version"],"resource_type":"INDIVIDUAL_OPERATIONAL_GRANT","state_predicate":"RECORD_ACTIVE_OR_SUSPENDED_AND_REVOCABLE","subject_resolver":"EFFECTIVE_ADMIN_ACTOR_AND_TARGET_EMPLOYEE","territory_resolver":"ORGANIZATIONAL_GOVERNANCE_RECORD_WITH_TARGET_SCOPE_VALIDATION"}
{"audit_policy":{"audit_policy_id":"audit.authorization_governance_mutation.v1","rule":"Actor, afectado, permiso, alcance, versión, reautenticación, motivo/evidencia, vigencia de suspensión, antes/después, decisión y timestamp."},"blocked_reason_codes":["AUTH_NO_SESSION","AUTH_USER_INACTIVE","AUTH_APP_ACCESS_DENIED","AUTH_ADMIN_PERMISSION_DENIED","AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT","AUTH_PERMISSION_NOT_REGISTERED","AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE","AUTH_SHARED_DEVICE_NOT_AUTHORIZED","AUTH_ACTION_NOT_ALLOWED_IN_SIMULATION"],"concurrency_policy":"EXPECTED_VERSION_AND_ROW_LOCK","contract_version":"1.0.0","field_policy":{"field_policy_id":"viso.operational_grants.suspend.fields.v1","rule":"Solo permite suspender una concesión positiva activa con motivo/evidencia; prohíbe modificar su identidad contractual o borrar historial."},"ownership_resolver":"NONE","record_type":"resource_contract","required_sides":["ORGANIZATION","TARGET_SUBJECT","TARGET_PERMISSION_SCOPE"],"resolution_outcomes":["RESOLVED","MULTI_RESOLVED","NOT_APPLICABLE","UNRESOLVED","CONFLICT","ISOLATED"],"resource_contract_hash":"sha256:ac26d2e51ef62da7eac7816ae76fa8bd0b4b79faa974b8b90ad05a9066a8963e","resource_contract_id":"viso.operational_grants.suspend.v1","resource_locator":["record_id","reason","evidence_ref","expected_version","suspension_until?"],"resource_type":"INDIVIDUAL_OPERATIONAL_GRANT","state_predicate":"POSITIVE_GRANT_ACTIVE_AND_SUSPENDABLE","subject_resolver":"EFFECTIVE_ADMIN_ACTOR_AND_TARGET_EMPLOYEE","territory_resolver":"ORGANIZATIONAL_GOVERNANCE_RECORD_WITH_TARGET_SCOPE_VALIDATION"}
{"audit_policy":{"audit_policy_id":"audit.authorization_governance_read.v1","rule":"Actor, filtros, alcance ORG, categoría de registros consultada, conteo/proyección, reautenticación, decisión y timestamp."},"blocked_reason_codes":["AUTH_NO_SESSION","AUTH_USER_INACTIVE","AUTH_APP_ACCESS_DENIED","AUTH_ADMIN_PERMISSION_DENIED","AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT","AUTH_PERMISSION_NOT_REGISTERED","AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE","AUTH_SHARED_DEVICE_NOT_AUTHORIZED","AUTH_ACTION_NOT_ALLOWED_IN_SIMULATION"],"concurrency_policy":"CONSISTENT_SNAPSHOT_READ","contract_version":"1.0.0","field_policy":{"field_policy_id":"viso.operational_grants.view.fields.v1","rule":"Solo expone metadata de gobierno necesaria dentro de ORG; no expone secretos ni convierte lectura en autoridad de mutación."},"ownership_resolver":"NONE","record_type":"resource_contract","required_sides":["ORGANIZATION","TARGET_SUBJECT","TARGET_PERMISSION_SCOPE"],"resolution_outcomes":["RESOLVED","MULTI_RESOLVED","NOT_APPLICABLE","UNRESOLVED","CONFLICT","ISOLATED"],"resource_contract_hash":"sha256:80c22f6f5654b4ba0b732f48b5692650882401015ebe27366e5ca7dbc57399cb","resource_contract_id":"viso.operational_grants.view.v1","resource_locator":["record_id?","target_employee_id?","permission_key?","lifecycle_status?"],"resource_type":"INDIVIDUAL_OPERATIONAL_GRANT","state_predicate":"RECORD_VISIBLE_WITHIN_AUTHORIZATION_GOVERNANCE_SCOPE","subject_resolver":"EFFECTIVE_ADMIN_ACTOR_AND_TARGET_EMPLOYEE","territory_resolver":"ORGANIZATIONAL_GOVERNANCE_RECORD_WITH_TARGET_SCOPE_VALIDATION"}
{"bindings":[{"compatibility":"EXPLICITLY_COMPATIBLE","dataset_hash":"sha256:5fcde3858d5fc6ba1c210987962e32b3e2d535dc286b225b1ddb6ba4b0bb06d0","dataset_id":"vento.authorization.base-role-grants","dataset_version":"1.1.0","manifest_catalog_version":"1.0.0","rule":"Rows remain immutable; every permission_key must exist in 1.1.0 and every granted scope must be admitted by the 1.1.0 permission contract."},{"compatibility":"EXPLICITLY_COMPATIBLE","dataset_hash":"sha256:3e28cb780c346fbc5cf583fe9cf20d1a88333c4fd459fc233380d9e627c6f94f","dataset_id":"vento.authorization.operational-role-grants","dataset_version":"1.0.0","manifest_catalog_version":"1.0.0","rule":"Rows remain immutable; operational grants resolve through CTX and must satisfy the 1.1.0 permission contract and resource contract."}],"catalog_version":"1.1.0","historical_manifest_mutation_forbidden":true,"record_type":"dataset_compatibility","runtime_requirement":"AUTH-DB-034 must record the 1.1.0 catalog hash and each exact dataset hash independently; compatibility never rewrites an historical dataset manifest."}
```

Huella contractual resultante:

```text
contract_release_hash = sha256:9e8d1d7452ed5844fa76b9c718e7bb82ae029d6031234b3b6d9a17f22c2a4359
```

Cada `contract_hash` es SHA-256 del objeto de permiso canónico antes de incorporar `contract_hash`; `record_type` pertenece únicamente al sobre JSONL y no forma parte de esa preimagen. Cada `resource_contract_hash` aplica la misma regla excluyendo `resource_contract_hash` y `record_type`. Las preimágenes individuales usan JSON UTF-8 con claves ordenadas y separadores compactos, sin espacios. `contract_release_hash` se calcula sobre las 60 líneas JSONL finales, incluyendo `record_type` y las huellas individuales, separadas por LF y con LF final.

---

#### 11. Compatibilidad de datasets congelados

`AUTH-CAT-025` no reescribe manifests ni hashes históricos.

Se declara compatibilidad explícita con:

```text
vento.authorization.base-role-grants@1.1.0
sha256:5fcde3858d5fc6ba1c210987962e32b3e2d535dc286b225b1ddb6ba4b0bb06d0

vento.authorization.operational-role-grants@1.0.0
sha256:3e28cb780c346fbc5cf583fe9cf20d1a88333c4fd459fc233380d9e627c6f94f
```

Reglas:

1. esos datasets siguen conservando su manifest histórico vinculado a `vento.authorization@1.0.0`;
2. no se cambia una sola fila, grant, scope_expression, source_task o hash;
3. su consumo junto con `vento.authorization@1.1.0` exige una validación explícita de compatibilidad;
4. cada `permission_key` concedida debe existir en 1.1.0;
5. cada concesión debe quedar dentro de `allowed_scopes` y de la modalidad del permiso;
6. el carril operativo siempre vuelve a resolver `CTX` y el contrato de recurso;
7. `AUTH-DB-034` registra por separado `contract_release_hash` y `dataset_hashes`; nunca recalcula un hash histórico para fingir que el dataset nació bajo 1.1.0.

La compatibilidad declarada aquí es válida porque las 29 claves conservan exactamente las modalidades y grants aprobados por `AUTH-CAT-022` y `AUTH-CAT-023`, y los nuevos `allowed_scopes` incluyen las expresiones ya aprobadas `G(B)`, `AS/AA`, `ORG` y `CTX` según cada familia.

---

#### 12. Relación con `AUTH-CAT-024::CORR-001`

`AUTH-CAT-025` no modifica el bloque histórico de `AUTH-CAT-024` ni recalcula la huella de `vento.authorization@1.0.0`.

Una vez esta tarea exista en `main` y sus validaciones documentales pasen:

```text
AUTH-CAT-024::CORR-001
→ puede autorizarse para reconocer la resolución por versión sucesora
→ debe conservar 1.0.0 inmutable
→ debe registrar 1.1.0 como contrato sucesor
→ puede cerrarse VERIFIED_ON_MAIN
```

Hasta ese cierre:

```text
AUTH-DB-034::GLOBAL = BLOQUEADA
```

Después de `VERIFIED_ON_MAIN`:

```text
AUTH-DB-034::GLOBAL
→ puede materializar el snapshot 1.1.0
→ permisos activos = 140
→ PermissionContractSnapshot válidos = 140
→ faltantes = 0
→ resource_contract_id sin resolver = 0
```

---

#### 13. Frontera de implementación física

Esta tarea no crea ni modifica:

- SQL;
- migraciones;
- RLS;
- RPC;
- tablas Supabase;
- `packages/contracts/authorization/**`;
- `permissions.json` físico;
- `resource-contracts.json` físico;
- `catalog/current.json`;
- tags, registry o release npm;
- datasets físicos;
- roles o grants físicos;
- aplicaciones consumidoras.

El payload JSONL de la sección 10 es fuente contractual documental. Una materialización posterior deberá copiar o generar sus valores de forma determinista y demostrar la misma huella; no podrá reconstruir semántica desde nombres o roles.

---

#### 14. Requisitos de prueba derivados

No se crean ni modifican requisitos de prueba. La cobertura de autorización ya aprobada permanece vigente y esta tarea no altera el Registro 04A.

```text
TREQ_CHANGES = 0
04A_CHANGES = 0
```

---

#### 15. Evidencia de validación

| Clase     | Estado           | Evidencia                                                                                                      |
| --------- | ---------------- | -------------------------------------------------------------------------------------------------------------- |
| BUILD     | `NOT_EXECUTED`   | La integración y compilación documental pertenecen al lifecycle del repositorio después de insertar la tarea. |
| LOCAL     | `NOT_EXECUTED`   | Las validaciones locales del repositorio se ejecutan durante el cierre documental de la tarea.                |
| REMOTA    | `NOT_EXECUTED`   | Los checks remotos se ejecutan sobre el PR de cierre documental.                                               |
| OPERATIVA | `NOT_APPLICABLE` | La tarea no modifica comportamiento operativo ni aplicaciones.                                                |
| FÍSICA    | `NOT_APPLICABLE` | La tarea no autoriza DDL, DML, migraciones, despliegues ni publicación física del catálogo.                    |

---

#### 16. Criterios de aceptación

`AUTH-CAT-025` queda aprobada cuando se mantengan simultáneamente:

1. exactamente 29 contratos de permiso en el payload;
2. distribución 9 PULSO + 5 NEXO + 1 ORIGO + 14 VISO;
3. exactamente 29 `resource_contract_id` únicos;
4. cada permiso contiene todos los campos obligatorios de `AUTH-CAT-017` 11.1 a 11.8;
5. cada contrato de recurso contiene todos los campos obligatorios de `AUTH-CAT-017` sección 14;
6. todos los scopes pertenecen al conjunto de 13 códigos de `SHELL-CON-006`;
7. `maximum_scope` pertenece a `allowed_scopes`;
8. `is_operational` coincide con `authorization_requirement`;
9. modalidades, sensibilidad, área, dispositivo y simulación coinciden con `AUTH-CAT-022`;
10. grants de `AUTH-CAT-023` caben dentro de los scopes definidos;
11. el conjunto activo permanece en 140 permisos;
12. `nexo.inventory.remissions.dispatch` permanece fuera del conjunto activo;
13. `vento.authorization@1.0.0` permanece inmutable;
14. `vento.authorization@1.1.0` supersede contractualmente a 1.0.0 para futura materialización;
15. los datasets históricos mantienen sus hashes;
16. ninguna operación física se ejecuta por esta tarea;
17. `AUTH-DB-034::GLOBAL` permanece bloqueada hasta cierre `VERIFIED_ON_MAIN` de `AUTH-CAT-024::CORR-001`.

---

#### 17. Límites

`AUTH-CAT-025` no:

- crea nuevas capacidades empresariales;
- agrega o retira PermissionKey respecto de las 140 de AUTH-CAT-024;
- cambia matrices o concesiones;
- resuelve brechas funcionales diferidas;
- crea aliases uno-a-muchos;
- redefine `AUTH-ERR`, contexto, simulación o dispositivos;
- habilita pantallas o acciones;
- autoriza la implementación física de AUTH-DB-034;
- modifica el Registro 04A.

---

#### 17.1. Corrección canónica AUTH-CAT-025::CORR-001 — Completar identidad técnica explícita de contratos de recurso heredados

<!-- VENTO-CORRECTION:AUTH-CAT-025::CORR-001:START -->

Esta corrección cierra exclusivamente la ausencia de `resource_contract_id` concretos para los contratos activos heredados que forman parte de `vento.authorization@1.1.0`.

Los 29 `resource_contract_id` publicados originalmente por AUTH-CAT-025 permanecen byte-identical y conservan su propia nomenclatura. Esta corrección no intenta normalizarlos ni deducirlos desde `resource_type`.

Para los 111 contratos activos heredados sin identidad publicada, esta corrección asigna y publica valores literales nuevos mediante el esquema técnico de asignación:

```text
<permission_key>.v1
```

Ese esquema existe únicamente para construir esta corrección de forma determinista. Después de la publicación, el valor canónico es la cadena literal registrada para cada PermissionKey. Los evaluadores, resolvers, migraciones y consumidores no pueden volver a derivar `resource_contract_id` desde PermissionKey, `resource_type`, `action_code`, rutas, tablas o nombres de recurso.

AUTH-CAT-016 conserva íntegramente la autoridad sobre el significado del recurso: tipo, localizador, territorio, sujeto, ownership, estados, concurrencia, campos y auditoría. La asignación de una clave estable no modifica ninguno de esos componentes.

```text
correction_id = AUTH-CAT-025::CORR-001
resource_contract_identity_completion = PUBLISHED
catalog_version = 1.1.0
active_permission_count = 140
successor_resource_contract_count = 29
inherited_resource_contract_count = 111
total_resolved_resource_contract_id = 140
unresolved_resource_contract_id = 0
assignment_kind = EXPLICIT_CORRECTION_ASSIGNMENT
assignment_scheme = <permission_key>.v1
assignment_scheme_scope = AUTH-CAT-025::CORR-001_ONLY
runtime_derivation_allowed = false
permission_keyset_changed = false
semantic_change = false
base_release_hash = sha256:687e1bc19c0cf7332e76ed940cf5a23b829492ebbee399af718fd326cf473cbe
successor_release_hash = sha256:9e8d1d7452ed5844fa76b9c718e7bb82ae029d6031234b3b6d9a17f22c2a4359
identity_registry_sha256 = sha256:2f19d2ebabcc87f8a6bb8029da8f87e05ea86c9acb027aec134995d338604bf4
TREQ_CHANGES = 0
04A_CHANGES = 0
```

Registro complementario canónico:

```jsonl
{"active_permission_count":140,"assignment_scheme":"<permission_key>.v1","assignment_scheme_scope":"AUTH-CAT-025::CORR-001_ONLY","base_release_hash":"sha256:687e1bc19c0cf7332e76ed940cf5a23b829492ebbee399af718fd326cf473cbe","catalog_id":"vento.authorization","catalog_version":"1.1.0","correction_id":"AUTH-CAT-025::CORR-001","inherited_resource_contract_count":111,"permission_keyset_changed":false,"record_type":"resource_contract_identity_completion_header","runtime_derivation_allowed":false,"semantic_change":false,"successor_release_hash":"sha256:9e8d1d7452ed5844fa76b9c718e7bb82ae029d6031234b3b6d9a17f22c2a4359","successor_resource_contract_count":29,"total_resolved_resource_contract_id":140,"unresolved_resource_contract_id":0}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"anima.access","record_type":"inherited_resource_contract_identity","resource_contract_id":"anima.access.v1","resource_type":"APP_SURFACE","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:29c8c84c14218b8428c653561b4e44cc6ba0ea180fd93ff2748a15164072714a"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"anima.attendance.shifts.cancel","record_type":"inherited_resource_contract_identity","resource_contract_id":"anima.attendance.shifts.cancel.v1","resource_type":"SHIFT","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:80b1d817498b4a8e1c337b69bc0900451d62d5d4ff8cd2402b213b3c166ef29b"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"anima.attendance.shifts.create","record_type":"inherited_resource_contract_identity","resource_contract_id":"anima.attendance.shifts.create.v1","resource_type":"SHIFT","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:509b22056c7a7423e56ea2f157a962a9669811aea685bb4f95677399e08e2cd0"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"anima.attendance.shifts.update","record_type":"inherited_resource_contract_identity","resource_contract_id":"anima.attendance.shifts.update.v1","resource_type":"SHIFT","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:1449a5d80a1b544aa4848fa2fed90b6fb8e58285d4ba96ffc198804359d79b49"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"anima.workforce.employee_documents.delete","record_type":"inherited_resource_contract_identity","resource_contract_id":"anima.workforce.employee_documents.delete.v1","resource_type":"EMPLOYEE_DOCUMENT","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:1599134588e213c86a4b997ae53bfc777da0697d2153d084bcf1fa768e860462"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"anima.workforce.employee_documents.upload","record_type":"inherited_resource_contract_identity","resource_contract_id":"anima.workforce.employee_documents.upload.v1","resource_type":"EMPLOYEE_DOCUMENT","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:ee7f28df3e734ffb229bd2c05fbe878c9638874c1f0d3eefd29458eea5c99140"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"anima.workforce.employee_documents.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"anima.workforce.employee_documents.view.v1","resource_type":"EMPLOYEE_DOCUMENT","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:da9c8f01549937067369026285f6b636b2eb061f1233c80fdcd5810ce953f000"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"anima.workforce.employee_photos.upload","record_type":"inherited_resource_contract_identity","resource_contract_id":"anima.workforce.employee_photos.upload.v1","resource_type":"EMPLOYEE_PHOTO","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:4be85743ed95172805c195689ef3a2e29e5a342e10b51f15d9f8a1d7857407ca"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"anima.workforce.staff_invitations.create","record_type":"inherited_resource_contract_identity","resource_contract_id":"anima.workforce.staff_invitations.create.v1","resource_type":"STAFF_INVITATION","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:384c93ea506e46746574d3e2ad832ded67a72a6991804ff8f099c0b540dd45e7"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"anima.workforce.team_members.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"anima.workforce.team_members.view.v1","resource_type":"EMPLOYEE_COLLECTION","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:801efefba1582b74ed120497cce4ceeca04b430d394c63354c931e08aa93e81d"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"aura.access","record_type":"inherited_resource_contract_identity","resource_contract_id":"aura.access.v1","resource_type":"APP_SURFACE","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:be075f86f2d21fd709fd8875e4771ed0806ab67be81ef7fe7ce22cb69bc68dd2"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"fogo.access","record_type":"inherited_resource_contract_identity","resource_contract_id":"fogo.access.v1","resource_type":"APP_SURFACE","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:8386c103ade71f4420ef4dd6ee852d5b94c9efe1dcd8310a5b167ac029c47ae1"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"fogo.production.batches.create","record_type":"inherited_resource_contract_identity","resource_contract_id":"fogo.production.batches.create.v1","resource_type":"PRODUCTION_BATCH","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:aa7587870b17454cb8ca1103a5a23baa380b70ba276301b8fbff4f28815aa6b4"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"fogo.production.batches.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"fogo.production.batches.view.v1","resource_type":"PRODUCTION_BATCH","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:e07981ae4847845a00c8378f0f78ea0cee39000bdf1ab883e48179c735747089"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"fogo.production.orders.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"fogo.production.orders.view.v1","resource_type":"PRODUCTION_ORDER","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:1affb338e71b6ea330c257942dd912519d39be14b11a70a7d79a94160c11f5b6"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"fogo.production.recipe_book.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"fogo.production.recipe_book.view.v1","resource_type":"RECIPE_PUBLICATION","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:6906a6be1f76bf86d2db86804957eebbfd9c067a4a12f201d5a01ec61a75fd7c"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"fogo.production.recipes.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"fogo.production.recipes.view.v1","resource_type":"RECIPE_DEFINITION","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:0983e7e51ac33ce0c4b508ffc7ecd695f23cac059ad07223323586041b2873d2"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.access","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.access.v1","resource_type":"APP_SURFACE","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:8b3c23ddc17aa776dba9cfa939159e694d37b286d956dc99cf7c00ef1f40c9cf"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.analytics.internal_reports.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.analytics.internal_reports.view.v1","resource_type":"ANALYTICS_RESULT","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:08c033194ea6f9afccac9dc3a3d3f676d8079f2049027c338cf5c791d27bfa15"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.analytics.margin_reports.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.analytics.margin_reports.view.v1","resource_type":"MARGIN_RESULT","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:0155d5bf56f48ec431f2b8cd9c52bce0c57e62dfa06def910387344a5b7c813e"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.assets.counts.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.assets.counts.view.v1","resource_type":"ASSET_COUNT","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:4bbbc269e655a8a30df798f3f6afcd066fb3dbca11fae0bf16926ff1f71a61ad"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.assets.groups.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.assets.groups.view.v1","resource_type":"ASSET_GROUP","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:d2ef3557baaa9cdfe3bef5eb202ed1803879052fe339ec233723a99c590bc165"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.assets.items.create","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.assets.items.create.v1","resource_type":"ASSET_ITEM","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:3db099a50860ded3fb38efe327305aef286603e12170646cf89077f37ab6a57a"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.assets.items.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.assets.items.view.v1","resource_type":"ASSET_ITEM","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:daa9e19ea4ba72295fd10c595a403ab307228d3ef34442f130a3f32e871a5dfc"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.catalog.categories.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.catalog.categories.view.v1","resource_type":"CATEGORY_MASTER","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:13ef5a88a1a3735929bc717ac18c90c31892c1e605dff1f56361dd81b701f00c"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.catalog.presentations.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.catalog.presentations.view.v1","resource_type":"PRESENTATION_MASTER","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:4372067ce496795037edd55654de4acfc8cd507ff036f8a1666cec0bf0b3373b"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.catalog.products.create","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.catalog.products.create.v1","resource_type":"PRODUCT_MASTER","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:e07e5b0cf0f7ec0a08901d0c4c06653ada9b69cf6d7ac01dca75ce5f3a7cfdcc"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.catalog.products.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.catalog.products.view.v1","resource_type":"PRODUCT_MASTER","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:a98cf32ad92b27dc09c896d54118e20a93143782cb575f624fb873642d0c52dd"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.catalog.request_policies.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.catalog.request_policies.view.v1","resource_type":"REQUEST_POLICY","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:7ad799285193ad71780c7461f908fdc89ee5330550f5aea85cd2c0d7bed0b83a"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.catalog.units.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.catalog.units.view.v1","resource_type":"UNIT_MASTER","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:9058eac726516c9b2ceb47247852263a4ec17f98adde8b0814689272723a5465"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.finance.cost_centers.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.finance.cost_centers.view.v1","resource_type":"COST_CENTER","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:795bd7683fa74c88ab7fedb49d6811f64565cf1241068742db929e534a67fab7"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.finance.internal_invoice_amounts.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.finance.internal_invoice_amounts.view.v1","resource_type":"INTERNAL_INVOICE_AMOUNTS","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:2979a8370e02fc81c33c1d3ab6f647a742fbbcb24d5986d10d3d883262f7af6c"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.finance.internal_invoices.cancel","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.finance.internal_invoices.cancel.v1","resource_type":"INTERNAL_INVOICE","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:7110c6f02d51cb85c51bf69a09444d3e29daa290f59242f31227413bf14ad3d5"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.finance.internal_invoices.generate","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.finance.internal_invoices.generate.v1","resource_type":"INTERNAL_INVOICE","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:bcccad6523c84935d6bea7dd1ff6135a2a94198c884fb8d3d1113a5b8f19bcc9"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.finance.internal_invoices.issue","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.finance.internal_invoices.issue.v1","resource_type":"INTERNAL_INVOICE","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:b9c74bf9f22208b98e8549f6fca358eadf45dd23f1a768adafcdd17e32ce3311"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.finance.internal_invoices.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.finance.internal_invoices.view.v1","resource_type":"INTERNAL_INVOICE","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:3dcdb5656d3e541edb485fc8b0750d578a125c53f6ad6daa90abf743a2a151d0"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.finance.internal_prices.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.finance.internal_prices.view.v1","resource_type":"INTERNAL_PRICE","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:da22dab908f15801b0c48c3d0cce37eac6c634375f722b37f51f63befbe79f55"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.finance.internal_variances.approve","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.finance.internal_variances.approve.v1","resource_type":"INTERNAL_VARIANCE","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:290fae8cc77b6e1941d3736191b0dfeeda45e0f14b7a3df5d47f7261d21ae397"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.finance.internal_variances.resolve","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.finance.internal_variances.resolve.v1","resource_type":"INTERNAL_VARIANCE","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:919ecfd37cc93f1dc3b29e7dc025ace8ac44c46a1d6565422ed73ed07cbcc19d"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.finance.internal_variances.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.finance.internal_variances.view.v1","resource_type":"INTERNAL_VARIANCE","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:7baa1ff70bdfd56f400f63de1216ac1ee6dfcb27cf7befa8b3e15f8573cf4d4f"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.inventory.adjustments.register","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.inventory.adjustments.register.v1","resource_type":"INVENTORY_ADJUSTMENT","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:6471d476cd469b81f18a5ca206359eacc98e853c57bd8dca7f4d2fb4ca49aab9"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.inventory.adjustments.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.inventory.adjustments.view.v1","resource_type":"INVENTORY_ADJUSTMENT","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:6487af48897af435e20db84b65aa3e1840b001cb9520e198e024c345042f5001"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.inventory.entries.override","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.inventory.entries.override.v1","resource_type":"INVENTORY_ENTRY_OVERRIDE","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:8868c54df57af261d530495327e0cd05fc3c78ff62ca0d9432794444b17cc1c2"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.inventory.entries.register","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.inventory.entries.register.v1","resource_type":"INVENTORY_ENTRY","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:49f965e7a80c0ea7d1a45ba9de578042acccb33b9c0d042c9d3a234aa4ea434c"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.inventory.entries.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.inventory.entries.view.v1","resource_type":"INVENTORY_ENTRY","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:bf4e446a9303b8f7789efa1fa7d2c755ed77c4ca3c463ee512caeff7a2aaf5a0"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.inventory.initial_counts.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.inventory.initial_counts.view.v1","resource_type":"INITIAL_STOCK_COUNT","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:69e2e1778cbc7112e2185370290cb68d3ce02c8044440fb1b0d15abd99f70a94"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.inventory.location_assignments.assign","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.inventory.location_assignments.assign.v1","resource_type":"LOCATION_ASSIGNMENT","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:9b1a6e7b025ae63926eed531eb3e114ad0a7bd53e9cf1a820e74e76c10c0683e"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.inventory.location_catalog.update","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.inventory.location_catalog.update.v1","resource_type":"LOCATION_CATALOG","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:b702b6b19c99cb0215e3aabe77cf6c0f23eae1023eb25b8407e188461549a55d"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.inventory.locations.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.inventory.locations.view.v1","resource_type":"INVENTORY_LOCATION","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:1564e17b0b53f7288f0c7b2345aacf60ef975545593f737d6701e1187f621432"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.inventory.lpns.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.inventory.lpns.view.v1","resource_type":"LPN","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:97e9596fda27de777be4863e0b67adfd0f1f4dcac843cc9ed58259b8a616c9c9"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.inventory.movements.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.inventory.movements.view.v1","resource_type":"INVENTORY_MOVEMENT","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:214b31342cbedbca23c05c38138a7eb32c2921d54ffa541e251e681b6a6cce9f"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.inventory.production_batches.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.inventory.production_batches.view.v1","resource_type":"INVENTORY_PRODUCTION_BATCH","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:928783a8f202a141357cf63c972647c24f4363e906ef21e1695213eefaced7c7"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.inventory.remissions.cancel","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.inventory.remissions.cancel.v1","resource_type":"REMISSION","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:c43ae64942f34746101b99c685ac4288a8ccf78dbbf980a67051a41dc2ca9717"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.inventory.remissions.prepare","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.inventory.remissions.prepare.v1","resource_type":"REMISSION","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:733b8f9a4abcdc3766bfac8a0b2034e3e1572c1ddb3fbdee9a39ee05490e6249"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.inventory.remissions.receive","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.inventory.remissions.receive.v1","resource_type":"REMISSION","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:561b09dcde9c03194238bdd0003b709b4a59e9c268224081dd2e0b50289b4f4d"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.inventory.remissions.request","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.inventory.remissions.request.v1","resource_type":"REMISSION","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:b8df6523fddb00619bd95d98406326ec379d63996b4a86b8f3c545a322cd6968"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.inventory.remissions.update","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.inventory.remissions.update.v1","resource_type":"REMISSION","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:c9e0985e0086529f57570c587799e24346e633826d4fa67d31cd2e35fe34c4f4"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.inventory.remissions.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.inventory.remissions.view.v1","resource_type":"REMISSION","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:2dd56b60fa2e5766795a69aecc6530056f8c7c3139144927292d1721881cfb45"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.inventory.stock_counts.perform","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.inventory.stock_counts.perform.v1","resource_type":"STOCK_COUNT","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:43e8356c29f7cacdce8fead702f6ca022b6e35ae9b0384cdbd6bcbbd76bc1d63"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.inventory.stock_counts.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.inventory.stock_counts.view.v1","resource_type":"STOCK_COUNT","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:ccd23948a93611f2cb2ed66a25e877af8fbdb61ee4711520958e80e825de534d"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.inventory.stock_validations.perform","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.inventory.stock_validations.perform.v1","resource_type":"STOCK_VALIDATION","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:d1e5efcfe86d0cbfdbbf05163de16b0ff5bda0b81a560c41b851d0e860de938e"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.inventory.stock.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.inventory.stock.view.v1","resource_type":"STOCK_POSITION","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:062dacba023776861f258d92d55587e17a2b926dac3c6083e205c1fe879b4e3f"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.inventory.storage_positions.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.inventory.storage_positions.view.v1","resource_type":"STORAGE_POSITION","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:536763485b036c77d9e681af83990e0725cb270fb41dd632f8aed32a3b427e7c"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.inventory.transfers.create","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.inventory.transfers.create.v1","resource_type":"INVENTORY_TRANSFER","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:75d775f74186c9ac57e4ced7c1a6ad744775808c1509c1e75e173ed529550232"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.inventory.transfers.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.inventory.transfers.view.v1","resource_type":"INVENTORY_TRANSFER","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:d2d3cb2af02619600da0216b93515fcbe19c8f4ebd0612765d35756ddca85c56"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.inventory.warehouse_operations.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.inventory.warehouse_operations.view.v1","resource_type":"WAREHOUSE_OPERATION","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:ad5ba9498797e5e6987cbb00b0814b97d7e187d5d7a187fff8c883698e051ada"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.inventory.withdrawals.register","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.inventory.withdrawals.register.v1","resource_type":"INVENTORY_WITHDRAWAL","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:a6aa12aba3f0cc9cbe6d92436c9a6c688086fd2f26dd4641f70591add01c3fa1"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.inventory.withdrawals.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.inventory.withdrawals.view.v1","resource_type":"INVENTORY_WITHDRAWAL","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:ed2a11c710dde8e30c76d53b76e03b0cab5809b6a08b829f4e02e712b5013df1"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.inventory.zones.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.inventory.zones.view.v1","resource_type":"INVENTORY_ZONE","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:652481003cce148f9b117619bb874b04655672e8cac5c5ca46d5aa103b749b04"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.logistics.driver_operations.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.logistics.driver_operations.view.v1","resource_type":"DRIVER_OPERATION","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:cae1a47210a49d8371340ed8b895857a7e1b17910ccc5f2a365fdf5abff76b67"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.logistics.fulfillment_routes.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.logistics.fulfillment_routes.view.v1","resource_type":"FULFILLMENT_ROUTE","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:02b4562115971bdc45534bf589b33754cf9b1368bb6b720943d54c76228ce100"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.logistics.fulfillment.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.logistics.fulfillment.view.v1","resource_type":"FULFILLMENT_TASK","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:a6d6c41c064ba3ed325b762933aa86f3251bc2fb9a1e3cf9aa83b9afd435a108"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.logistics.operations_board.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.logistics.operations_board.view.v1","resource_type":"LOGISTICS_BOARD","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:77865b10e46ca4f8fcb88d35bc7f0ca9f85705f1b8d566acaee9b4d4536cd924"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.logistics.operations.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.logistics.operations.view.v1","resource_type":"LOGISTICS_OPERATION","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:c55d010a2bdd9866e18f88ceda035382c2cbae7138a8a3a02b9a361b72bdda49"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.logistics.supply_routes.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.logistics.supply_routes.view.v1","resource_type":"SUPPLY_ROUTE","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:f2bcdf881354160aad51591f3c2c9058cb49a742e726dae8ba6bb726bf930b81"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.printing.jobs.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.printing.jobs.view.v1","resource_type":"PRINT_JOB","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:bea7330fa34bc317caa2799b4caabdea2f13b2aac959b87add2f465da2e805aa"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.printing.templates.update","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.printing.templates.update.v1","resource_type":"PRINT_TEMPLATE","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:715b6b1e182dd55f4f4710b7525596a89faaa9d285ea4c5b906874df3f57f2e0"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.settings.remission_policies.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.settings.remission_policies.view.v1","resource_type":"REMISSION_POLICY","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:0d3380f5180ea33ddd5003526af425c98932cb003293f58f3abd90179b9eae3b"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"nexo.settings.sites.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"nexo.settings.sites.view.v1","resource_type":"SITE_DEFINITION","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:5cb55280b3f779003d5f3968e41e9b34aa0bf4d05f82b999dbf068a38352e97b"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"numera.access","record_type":"inherited_resource_contract_identity","resource_contract_id":"numera.access.v1","resource_type":"APP_SURFACE","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:046be70272dca8d118161a65dbdd3601391da8bed6ad5b73e6c6e7a48120711a"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"numera.analytics.break_even.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"numera.analytics.break_even.view.v1","resource_type":"BREAK_EVEN_RESULT","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:6bf2d57302cbddc7908f158f93daa4f3d98c9dce06a97a76de4084d695a9a6b4"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"numera.analytics.financial_reports.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"numera.analytics.financial_reports.view.v1","resource_type":"FINANCIAL_REPORT","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:fcced022789b0e6c0d80d0a33881b3e69f183ca91752f78dfd5dd4f3daa38161"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"numera.analytics.profitability.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"numera.analytics.profitability.view.v1","resource_type":"PROFITABILITY_RESULT","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:2dcaf021c81a6d98135c754819e25c1b49e9793ebe1ef25d77a4df941bc1a8c1"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"numera.finance.cost_centers.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"numera.finance.cost_centers.view.v1","resource_type":"COST_CENTER","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:28ae21da6111d515007463363faadbb6c3301d969c5701f3e2cef07eb403613b"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"numera.finance.expenses.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"numera.finance.expenses.view.v1","resource_type":"EXPENSE","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:beabebe9a4bc5197c81fa30f98e6f63e12d7f4acb4db3b55064452b69f5ed5f0"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"origo.access","record_type":"inherited_resource_contract_identity","resource_contract_id":"origo.access.v1","resource_type":"APP_SURFACE","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:9af67705e2692760458056a7c8e519b12efb3ee907496938588704cd4209aa4c"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"origo.catalog.product_reviews.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"origo.catalog.product_reviews.view.v1","resource_type":"PRODUCT_REVIEW_QUEUE","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:459c61934710c9126ed2d8a55291e579382fc6258626a1f1612e780e242ebe1a"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"origo.procurement.purchase_orders.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"origo.procurement.purchase_orders.view.v1","resource_type":"PURCHASE_ORDER","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:e46194c30ea74380141e85525d0bd3f1db16afb3c4f2113e880ac3198bed4c4b"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"origo.procurement.receipts.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"origo.procurement.receipts.view.v1","resource_type":"PURCHASE_RECEIPT","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:2dfc8f977f04f44b1190de0670a4807a11b7d634acb4454870a1ba02ecc7d07c"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"origo.procurement.suppliers.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"origo.procurement.suppliers.view.v1","resource_type":"SUPPLIER","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:a498f466b70586789e80243e32a4329f4ef55f8aa18a0144e054512055a17623"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"pass.access","record_type":"inherited_resource_contract_identity","resource_contract_id":"pass.access.v1","resource_type":"APP_SURFACE","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:374924cb500cac45d58c0770405ab685c94c6312d697f432d0a7fec3d806bdf0"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"pulso.access","record_type":"inherited_resource_contract_identity","resource_contract_id":"pulso.access.v1","resource_type":"APP_SURFACE","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:3a6011ff8ec227f4844be6e51b7709ad84ad2e91bffb6482689db1c5e3760a87"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"pulso.delivery.deliveries.override","record_type":"inherited_resource_contract_identity","resource_contract_id":"pulso.delivery.deliveries.override.v1","resource_type":"DELIVERY","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:bdb5dfbb56b52ef3c2861bed107c4a307f76e12d4d0a446a0a2c4d0dd3e39916"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"shell.access","record_type":"inherited_resource_contract_identity","resource_contract_id":"shell.access.v1","resource_type":"APP_SURFACE","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:bc16bfc1a2e28ea3052cc07947d47f283068ad335a9ad0622e4444fd87bea9da"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"viso.access","record_type":"inherited_resource_contract_identity","resource_contract_id":"viso.access.v1","resource_type":"APP_SURFACE","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:f68e98e20c1064c54fa9874536daddf7834e28ae3a130fa01a05862c5f1b6d5b"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"viso.authorization.audit_logs.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"viso.authorization.audit_logs.view.v1","resource_type":"AUDIT_EVENT","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:dceede3a4c516d6235a10d77e006964dd2e96b510f346f2930e453878eb9b7b4"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"viso.authorization.context_simulations.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"viso.authorization.context_simulations.view.v1","resource_type":"CONTEXT_SIMULATION","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:fbb3acf963bbad5f960dab05bcb872802a36af71681fd19c04e4b651aa6a7287"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"viso.catalog.commercial_categories.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"viso.catalog.commercial_categories.view.v1","resource_type":"COMMERCIAL_CATEGORY","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:324ef142f5d6d56b5c20f36d137589e88db1588d8d3d2f2411c01b9a01b4c8c8"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"viso.content.content_blocks.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"viso.content.content_blocks.view.v1","resource_type":"CONTENT_BLOCK","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:8a6e4360bd47f985915453e0da8d25544885f18fb233c526d67ea6450a10e32a"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"viso.content.menu.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"viso.content.menu.view.v1","resource_type":"MENU","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:4cc8526b611662ca4b0934c8b257b953eb59de038eb5bec8965390eb84db29db"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"viso.content.website_content.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"viso.content.website_content.view.v1","resource_type":"WEBSITE_CONTENT","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:4ae17cf7d2a3d4dc9c319558c663f40ccb1d8c643f20abb7c11d43b5feb9bf11"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"viso.delivery.rates.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"viso.delivery.rates.view.v1","resource_type":"DELIVERY_RATE","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:87e62f25305f31c62b1a8e20c12c2776b9e41a656af2cf6044db1bdac87f1cbb"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"viso.finance.accounting.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"viso.finance.accounting.view.v1","resource_type":"ACCOUNTING_DATA","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:e07cb66faee589f9dbb516df5705e790699fd546fe9b93b4a8c01ec3ef431309"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"viso.loyalty.customers.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"viso.loyalty.customers.view.v1","resource_type":"LOYALTY_CUSTOMER","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:5d68be0e2b75164b248830c2eb5acfcf8d5c1b92453b1279705c8d312473d35b"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"viso.loyalty.products.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"viso.loyalty.products.view.v1","resource_type":"LOYALTY_PRODUCT","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:b61805884453190160b2e6d7e86ab7d06b347ed9144fe9300d65917c72ba7900"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"viso.organization.businesses.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"viso.organization.businesses.view.v1","resource_type":"BUSINESS_UNIT","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:1a4879aab4f5cb2dbe126dcf3b94494ffcedfdb3b9cff8b247f4c8a17b46804b"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"viso.platform.app_updates.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"viso.platform.app_updates.view.v1","resource_type":"APP_UPDATE","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:71a48f1efeb7afe2096e28c17d3ee076aa6108fe511d73994791236a2a9ce78b"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"viso.workforce.employees.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"viso.workforce.employees.view.v1","resource_type":"EMPLOYEE_PROFILE","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:60401f60aae0396746cf3e9a495dcabe641cf40bb0951bd3dafbcde6fb5d23c8"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"viso.workforce.schedules.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"viso.workforce.schedules.view.v1","resource_type":"SHIFT","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:c68825a8131cf83283cfc0ff523386ce1b7e3f120b29816ad378567f50dbf7a5"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"viso.workforce.staff_calendar.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"viso.workforce.staff_calendar.view.v1","resource_type":"STAFF_CALENDAR","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:19513afdbec41fb0f1c70ef1b19133a5ae9d2e75e19e05b39c30c01f19868758"}
{"assignment_kind":"EXPLICIT_CORRECTION_ASSIGNMENT","contract_version":"1.0.0","effective_catalog_version":"1.1.0","lifecycle_status":"active","permission_key":"viso.workforce.vacancies.view","record_type":"inherited_resource_contract_identity","resource_contract_id":"viso.workforce.vacancies.view.v1","resource_type":"VACANCY","runtime_derivation_allowed":false,"semantic_change":false,"source_correction":"AUTH-CAT-025::CORR-001","source_resource_semantics_task":"AUTH-CAT-016","source_row_sha256":"sha256:f2554e2dcc4f5eceb15379201c61c5d1960536c461c00ece7d03949ad67e9954"}
```

Invariantes:

1. las 140 PermissionKey activas permanecen intactas;
2. los 29 contratos completos de AUTH-CAT-025 permanecen intactos;
3. los 29 `resource_contract_id` existentes permanecen intactos;
4. se publican exactamente 111 identidades técnicas heredadas nuevas;
5. las 140 identidades efectivas son únicas;
6. `unresolved_resource_contract_id = 0`;
7. `runtime_derivation_allowed = false`;
8. no cambian recurso, scope, modalidad, prerrequisitos, sensibilidad, grants ni datasets;
9. no cambia ningún TREQ ni el Registro 04A;
10. AUTH-DB-034 deberá consumir las cadenas literales publicadas por esta corrección.

<!-- VENTO-CORRECTION:AUTH-CAT-025::CORR-001:END -->

---

#### 18. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-CAT-024 — Validar, publicar y congelar la versión canónica que alimentará los datasets`

**TAREA ACTUAL APROBADA**
`AUTH-CAT-025 — Completar contratos de alcance y recurso de las 29 PermissionKey incorporadas por AUTH-CAT-024 y publicar la versión contractual sucesora`

**SIGUIENTE TAREA RESERVADA**
`AUTH-DB-034 — Implementar evaluate_authorization canónico, su núcleo de evaluación, resolvers de recurso y proyecciones seguras`
