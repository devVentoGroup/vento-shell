# REGISTRO DE APROBACIÓN — CONDITIONAL_IMPLEMENTATION_SCOPE DE NEXO-REMISSIONS-001

> **REGISTRO HISTÓRICO INACTIVO.** La aprobación consignada aquí conserva la
> trazabilidad de la clasificación realizada para el carril, pero dejó de
> gobernar la continuidad cuando `execution-route.json` seleccionó
> `NORMAL-CANONICAL-FLOW-001`. No aprueba tareas globales, no crea un
> `package_id`, no habilita `DELIV-PKG-*` para Remisiones y no autoriza
> implementación física. Cualquier paquete futuro deberá definirse desde cero
> mediante `DELIV-PKG-001..025::<package_id>` dentro del flujo integral.

### ✅ Control virtual `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` — Resolver y aprobar CONDITIONAL_IMPLEMENTATION_SCOPE

**Estado:** APROBADA  
**Control virtual propietario:** `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE`  
**Ruta:** `NEXO-REMISSIONS-001`  
**Etapa:** 16 de 44 — `CONDITIONAL_IMPLEMENTATION_SCOPE`  
**Tarea anterior:** `CONT-INT-004 — Definir contratos de captura, replay, idempotencia, reincorporación, conciliación y retorno al servicio normal` — APROBADA  
**Continuidad habilitada:** `DELIV-PKG-001::NEXO-REMISSIONS-001 — Crear identificador estable para cada paquete de implementación [NEXO-REMISSIONS-001]` — NO INICIADA  
**Repositorio propietario:** `vento-shell`  
**Archivo incorporado después de aprobación explícita:** `docs/plan-canonico/modular/priority-route-progress.json`  
**Fecha de corte de evidencia:** `2026-08-11`  
**Implementación, DDL, DML, migraciones, backfills, despliegues y cambios remotos:** NO AUTORIZADOS  
**Requisitos de prueba creados o modificados:** 0

---

## 1. Decisión aprobada

Los tres grupos condicionales de implementación quedan clasificados sin
ambigüedad:

| Orden | Grupo | Decisión aprobada | Tareas que entran al paquete | Fundamento de cierre |
| ---: | --- | --- | --- | --- |
| 1 | `PRODUCTION_LINK_IMPLEMENTATION` | `APLICABLE` | `NEXO-AUTH-007` | `INT-PROD-005` aprobado ordena activar el grupo y materializar después la protección de producción vinculada. |
| 2 | `PHYSICAL_NORMALIZATION_CONDITIONAL` | `APLICABLE` | `DATA-NORM-DB-001` a `DATA-NORM-DB-010` | El paquete debe transformar y reconciliar datos existentes de catálogo, UOM, solicitudes, movimientos y proyecciones de inventario; los handoffs aprobados exigen backfills deterministas y compatibilidad legacy. |
| 3 | `EXTERNAL_INTEGRATION_CONDITIONAL` | `NO APLICA` | ninguna | El alcance vigente no consume ni publica remisiones mediante ERP, WMS, 3PL, transportista o API externa y no requiere infraestructura física `INT-DB-001..008`. |

**Balance:** 3 de 3 grupos clasificados; 2 aplicables; 1 no aplicable; 0
faltantes; 0 duplicados; 0 desconocidos.

Esta clasificación determina composición futura del paquete. No ejecuta las
tareas seleccionadas, no aprueba sus marcadores globales y no inicia
`DELIV-PKG-001`.

---

## 2. Evidencia de `PRODUCTION_LINK_IMPLEMENTATION`

### 2.1. Contrato aprobado

`INT-PROD-005` está aprobado y define el tratamiento de producción
insuficiente para remisiones. Su cierre ordena expresamente:

1. activar `PRODUCTION_LINK_IMPLEMENTATION`;
2. incorporar `NEXO-AUTH-007` al alcance condicional de implementación;
3. impedir que una remisión, lote, producto visible o nombre de rol conceda por
   sí solo autoridad sobre producción vinculada.

### 2.2. Decisión

`PRODUCTION_LINK_IMPLEMENTATION = APLICABLE`.

La decisión no ejecuta `NEXO-AUTH-007`. Esa tarea se realizará únicamente en
la etapa de implementación condicional, bajo el mismo `package_id`, después de
`E5-GATE-008::NEXO-REMISSIONS-001` y dentro de
`SHELL-CI-020::NEXO-REMISSIONS-001`.

---

## 3. Evidencia de `PHYSICAL_NORMALIZATION_CONDITIONAL`

### 3.1. Regla de activación

El grupo se activa exclusivamente cuando la transición aprobada modifica o
normaliza datos existentes de catálogo, búsqueda o inventario. La pertenencia
a NEXO, la existencia de tablas o la aprobación previa de arquitectura no son
suficientes por sí solas.

### 3.2. Datos existentes verificados

La consulta remota de solo lectura al proyecto VENTO
`clzdpinthhtknkmefsxx` confirmó:

| Conjunto vigente | Filas observadas |
| --- | ---: |
| `products` | 963 |
| `product_inventory_profiles` | 963 |
| `product_uom_profiles` | 1.190 |
| `restock_requests` | 11 |
| `restock_request_items` | 294 |
| `restock_item_fulfillments` | 65 |
| `inventory_movements` | 803 |
| `inventory_stock_by_site` | 202 |
| `inventory_stock_by_location` | 218 |
| `inventory_stock_by_position` | 172 |

Estos conjuntos no son estructuras vacías asociadas nominalmente con NEXO:
contienen catálogo, unidades, solicitudes, cumplimiento, movimientos y
proyecciones que el paquete debe conservar, reconciliar o transformar.

### 3.3. Consumo actual en `vento-nexo`

El flujo desplegado de remisiones lee o escribe, entre otros:

- `restock_requests` y `restock_request_items`;
- `restock_item_fulfillments`;
- `product_inventory_profiles`, `product_uom_profiles` y
  `product_request_policies`;
- `inventory_movements`;
- `inventory_stock_by_site`, `inventory_stock_by_location` e
  `inventory_stock_by_position`;
- `remission_shipments`, `remission_receipts` y sus líneas objetivo.

El diseño aprobado conserva compatibilidad temporal entre el modelo legacy y
el objetivo, pero no permite mantener dos escritores ni reinterpretar estados
por etiqueta.

### 3.4. Handoffs aprobados que exigen transformación física

Las tareas `NEXO-UX-014` a `NEXO-UX-016` ya asignan a `vento-shell` y al
paquete E5, entre otros resultados:

- migración de entradas, aliases y fuente mediante backfill determinista;
- migración de saldos sin LOC o posición, con reconciliación y cero doble
  asignación;
- transición de movimientos y transfers legacy con lectores compatibles, no
  duplicidad y rollback;
- convergencia de RLS, grants, RPC, writers y proyecciones;
- preservación de hechos históricos sin inventar origen, destino, receipt,
  propietario, cantidad o signo.

Por tanto, el paquete no puede cumplir el diseño aprobado únicamente mediante
código nuevo sobre datos futuros. Debe gobernar la transición de datos ya
existentes.

### 3.5. Decisión

`PHYSICAL_NORMALIZATION_CONDITIONAL = APLICABLE`.

Entran al alcance futuro `DATA-NORM-DB-001` a `DATA-NORM-DB-010`. Esta decisión
no crea ni ejecuta migraciones. Toda migración VENTO se creará, versionará y
ejecutará posteriormente desde `vento-shell`, bajo el `package_id`, el gate y
el ciclo de implementación aprobados.

---

## 4. Evidencia de `EXTERNAL_INTEGRATION_CONDITIONAL`

### 4.1. Regla de activación

El grupo se activa cuando la remisión consume o publica datos mediante un
sistema externo y necesita la infraestructura física de integración de
`INT-DB-001` a `INT-DB-008`.

No activan el grupo por sí solos:

- integraciones internas entre aplicaciones VENTO;
- una URL de navegación a FOGO, ORIGO o SHELL;
- una referencia manual a proveedor, transportista o tercero;
- impresión local o renderización de una etiqueta;
- la mera posibilidad futura de conectar un ERP, WMS, 3PL o transportista.

### 4.2. Auditoría del flujo vigente

Se revisaron 36 archivos TypeScript/TSX de remisiones y de sus configuraciones
de rutas. El resultado fue:

| Control | Resultado |
| --- | ---: |
| archivos de alcance revisados | 36 |
| archivos que consumen Supabase mediante tablas/RPC | 26 |
| usos de `fetch`, Axios, webhook, URL externa, ERP, WMS, 3PL o carrier en ese alcance | 0 |

El manifiesto de dependencias de `vento-nexo` tampoco incorpora SDK de ERP,
WMS, transportista o middleware externo. El flujo observado opera contra
Supabase y contratos internos del ecosistema VENTO.

La revisión remota de columnas en tablas `restock*` y `remission*` no encontró
campos de proveedor de integración, sistema externo, carrier, webhook, ERP,
WMS o tercero.

### 4.3. Elementos externos que no cambian la decisión

`vento-nexo` contiene utilidades generales que alcanzan servicios como
Labelary o generación de QR, además de enlaces hacia aplicaciones VENTO. No
forman parte del transporte autoritativo de datos de remisión ni requieren el
registro, staging, mapeo, idempotencia, cuarentena, auditoría y conciliación de
`INT-DB-001..008` para este paquete.

Las excepciones de remisión pueden registrar referencia, evidencia o espera
frente a proveedor, transportista, asegurador o tercero. Ese handoff manual o
documental no demuestra una integración física con su sistema.

### 4.4. Decisión

`EXTERNAL_INTEGRATION_CONDITIONAL = NO APLICA` para el alcance exacto de
`NEXO-REMISSIONS-001`.

La exclusión deberá reevaluarse antes de ampliar el paquete si se incorpora
cualquiera de estas condiciones:

1. API, webhook, archivo automatizado o cola de ERP/WMS/3PL/transportista;
2. identidad externa que necesite mapeo canónico persistente;
3. payload externo que requiera staging inmutable o cuarentena;
4. reintentos, compensaciones o conciliación contra receipts de un tercero;
5. credenciales o configuración de un sistema externo para ejecutar la
   remisión.

El propietario de la reevaluación será `DELIV-PKG` para el mismo `package_id`,
con `INT-EXT-*` como contrato y `INT-DB-001..008` como implementación física si
la condición se vuelve verdadera.

---

## 5. Estado canónico incorporado

Tras la confirmación literal **APROBADO**, el objeto
`conditional_scopes.CONDITIONAL_IMPLEMENTATION_SCOPE` de
`priority-route-progress.json` fue incorporado exactamente así:

```json
{
  "decision_state": "APROBADA",
  "applicable_groups": [
    "PRODUCTION_LINK_IMPLEMENTATION",
    "PHYSICAL_NORMALIZATION_CONDITIONAL"
  ],
  "not_applicable_groups": [
    "EXTERNAL_INTEGRATION_CONDITIONAL"
  ]
}
```

No se editará manualmente `active-sequence.json`. El compilador deberá derivar
automáticamente la transición hacia
`DELIV-PKG-001::NEXO-REMISSIONS-001` después de incorporar la aprobación.

---

## 6. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA.

**Justificación:** el control clasifica tres grupos ya definidos y conserva sus
tareas y requisitos vigentes. No crea comportamiento nuevo, contrato externo,
permiso, migración, writer, dato, endpoint ni efecto productivo.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

## 7. Criterios de aceptación

1. Los tres grupos están clasificados una sola vez.
2. `PRODUCTION_LINK_IMPLEMENTATION` queda aplicable por mandato de
   `INT-PROD-005`.
3. `PHYSICAL_NORMALIZATION_CONDITIONAL` queda aplicable por transformación
   necesaria de datos existentes, no por simple asociación con NEXO.
4. `EXTERNAL_INTEGRATION_CONDITIONAL` queda no aplicable por ausencia de un
   sistema externo dentro del alcance exacto.
5. La exclusión externa conserva propietario y cinco condiciones de
   reevaluación.
6. La selección de un grupo no aprueba sus tareas globales.
7. Ninguna tarea física se ejecuta antes de `E5-GATE-008` y
   `SHELL-CI-020::NEXO-REMISSIONS-001`.
8. Toda futura migración Supabase permanece bajo propiedad de `vento-shell`.
9. `priority-route-progress.json` fue actualizado únicamente después de la
   aprobación explícita.
10. `active-sequence.json` permanece derivado y no se edita manualmente.
11. `DELIV-PKG-001::NEXO-REMISSIONS-001` queda habilitado como siguiente tarea,
    pero permanece no iniciado.
12. No se crean ni modifican requisitos `TREQ-*`.

---

## 8. Continuidad aprobada

```text
ÚLTIMO CONTROL APROBADO
NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE
        ↓
TAREA ACTUAL HABILITADA Y NO INICIADA
DELIV-PKG-001::NEXO-REMISSIONS-001
```

Este archivo registra la aprobación explícita y la incorporación del estado del
control virtual en `priority-route-progress.json`. La clasificación es canónica
y habilita la continuidad, pero no inicia `DELIV-PKG-001` ni autoriza trabajo
físico por sí sola.
