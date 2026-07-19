
REVISIÓN CONTRACTUAL PREVIA A DATASETS

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

## INVENTARIO A — CAPACIDADES EMPRESARIALES FALTANTES

#### 8. PULSO — Operación comercial, atención y producción satélite

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

#### 9. FOGO — Ejecución y supervisión productiva

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

#### 10. NEXO — Inventario, remisiones y logística

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

#### 11. ORIGO — Recepción y abastecimiento

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

#### 12. VISO — Gobierno de excepciones y denegaciones

| Gap ID         | Capacidad empresarial ausente                                                                                    | No inferir desde                                           | Fuentes principales | Roles potencialmente afectados                        |
| -------------- | ---------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------- | ------------------- | ----------------------------------------------------- |
| `GAP-VISO-001` | Consultar, solicitar, crear, aprobar, activar, suspender, revocar y auditar concesiones individuales base.       | `staff.permissions.manage`; permisos de lectura            | AUTH-RBAC-020       | propietarios, gerencias y administradores autorizados |
| `GAP-VISO-002` | Consultar, solicitar, crear, aprobar, activar, suspender, revocar y auditar concesiones individuales operativas. | `staff.permissions.manage`; gestión de perfiles operativos | AUTH-RBAC-021       | propietarios, gerencias y administradores autorizados |
| `GAP-VISO-003` | Crear, aprobar, activar, revocar y auditar denegaciones de carril y bloqueos transversales.                      | gestión genérica de permisos                               | AUTH-RBAC-022       | autoridad de seguridad y recuperación                 |
| `GAP-VISO-004` | Separar las nueve familias legacy amplias de administración VISO en acciones atómicas.                           | permisos `*.manage` legacy                                 | AUTH-CAT-003 a 019  | roles administrativos según cada dominio              |

La futura administración deberá conservar segregación entre solicitante, aprobador y actor afectado cuando la sensibilidad lo exija.

---

#### 13. Dominios sin nuevas capacidades confirmadas por las matrices

| Aplicación | Resultado de AUTH-CAT-020                                                                                                                                      |
| ---------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| SHELL      | No se identifican nuevas capacidades empresariales; `shell.access` continúa como entrada al hub.                                                               |
| ANIMA      | Las matrices no introducen nuevas capacidades; las brechas de contexto, turnos y check-in se tratarán en BLOQUE E y roadmaps funcionales.                      |
| NUMERA     | No aparecen nuevas necesidades derivadas directamente de matrices; conserva dos permisos legacy amplios pendientes de descomposición.                          |
| AURA       | Continúa diferida; no se amplía el catálogo.                                                                                                                   |
| PASS       | No se amplía el RBAC laboral. Las operaciones de fidelización laboral deberán pertenecer a PULSO, VISO o al adaptador definido, sin mezclar la sesión cliente. |

---

## INVENTARIO B — DEUDA LEGACY DE DESCOMPOSICIÓN

#### 14. Permisos `DECOMPOSE_REQUIRED` preservados

Los siguientes 21 permisos legacy continúan:

```text
catalog_status = deprecated
assignment_status = blocked
authorization_requirement = null
```

No reciben claves nuevas durante AUTH-CAT-020.

##### FOGO — 1

```text
fogo.production.recipes.manage
```

##### NEXO — 7

```text
nexo.settings.categories.manage
nexo.settings.units.manage
nexo.settings.supply_routes.manage
nexo.internal_prices.manage
nexo.cost_centers.manage
nexo.settings.sites.manage
nexo.settings.remissions.manage
```

##### NUMERA — 2

```text
numera.cost_centers.manage
numera.expenses.manage
```

##### ORIGO — 1

```text
origo.suppliers.manage
```

##### PULSO — 1

```text
pulso.pos.main
```

##### VISO — 9

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

## INVENTARIO C — DECISIONES PENDIENTES DE PROPIEDAD FUNCIONAL

#### 15. Propiedad funcional por resolver

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

## INVENTARIO D — BRECHAS ESTRUCTURALES QUE NO SON PERMISOS

#### 16. Brechas del modelo de asignaciones y excepciones

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

#### 17. Brechas de dispositivo y actor efectivo

| Gap ID           | Brecha estructural                                                                               | Tratamiento posterior                               |
| ---------------- | ------------------------------------------------------------------------------------------------ | --------------------------------------------------- |
| `GAP-DEVICE-001` | Plantillas legacy mezclan roles base y operativos en `navigation_role`.                          | Migración de plantillas definida por AUTH-RBAC-023. |
| `GAP-DEVICE-002` | `same_site_active_worker` es demasiado amplio para bodega y otras terminales especializadas.     | Política restrictiva de actor, sede, área y rol.    |
| `GAP-DEVICE-003` | No existen sesiones persistidas de actor humano en los dispositivos auditados.                   | BLOQUE E, E3 y R; no es una brecha de permiso.      |
| `GAP-DEVICE-004` | La identidad técnica puede terminar apareciendo como actor si no se aplica el contrato aprobado. | Separación principal técnico / actor efectivo.      |
| `GAP-DEVICE-005` | La reautenticación fuerte no puede ser sustituida por PIN ligero.                                | Contrato de autenticación y decisión unificada.     |
| `GAP-DEVICE-006` | Los permisos nuevos deben quedar bloqueados en plantillas hasta versionar paquetes e instancias. | Gobierno de versiones de dispositivos.              |

---

#### 18. Brechas de recurso, estado y transición

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

## INVENTARIO E — ASUNTOS DE IMPLEMENTACIÓN DIFERIDOS

#### 19. Hallazgos excluidos de creación de permisos

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


### [ ] AUTH-CAT-021 — Clasificar brechas listas para catálogo y brechas diferidas a roadmaps funcionales

### [ ] AUTH-CAT-022 — Descomponer permisos legacy maduros y definir nuevas claves atómicas

### [ ] AUTH-CAT-023 — Actualizar matrices y paquetes de dispositivo afectados por el diff contractual

### [ ] AUTH-CAT-024 — Publicar y congelar la versión canónica que alimentará los datasets