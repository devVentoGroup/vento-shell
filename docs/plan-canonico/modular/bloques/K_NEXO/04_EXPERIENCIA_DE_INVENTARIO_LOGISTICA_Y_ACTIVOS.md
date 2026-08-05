### MINI-BLOQUE — EXPERIENCIA DE INVENTARIO LOGISTICA Y ACTIVOS

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **experiencia de inventario logistica y activos** dentro de **K NEXO**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `NEXO-UX-001` a `NEXO-UX-048` — 48 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Límites funcionales:** comienza con “Inventariar procesos reales de inventario y logística” y concluye con “Validar el prototipo con Operaciones, Producción, Limpieza, Mantenimiento, SST y responsables de sede”.
<!-- PLAN-SECTION-META:END -->

### ✅ NEXO-UX-001 — Inventariar procesos reales de inventario y logística

**Estado:** APROBADA
**Tarea anterior:** `NEXO-DOM-001 — Clasificar consumibles, stock por cantidad, reutilizables, activos serializados, repuestos, kits y contenedores` — APROBADA
**Tarea siguiente:** `NEXO-UX-002 — Separar operación, supervisión y configuración` — RESERVADA
**Tipo de tarea:** documental; inventario AS-IS materializado, reconciliación de procesos canónicos, etapas reales, actores, superficies, datos, evidencia desplegada, variantes manuales y brechas de inventario y logística de NEXO
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/K_NEXO/04_EXPERIENCIA_DE_INVENTARIO_LOGISTICA_Y_ACTIVOS.md`
**Repositorio de aplicación inspeccionado:** `vento-nexo`
**Artefactos producidos:** `NEXO-REAL-PROCESS-INVENTORY-001`, `NEXO-CURRENT-PROCESS-EVIDENCE-MATRIX-001` y `NEXO-REAL-PROCESS-HANDOFF-001`
**Decisiones consumidas:** `PROC-ASIS-CATALOG-001`; `VPROC-0023` a `VPROC-0028`; propiedad, consumidores, iniciadores y continuadores aprobados en `PROC-CAT-004` a `PROC-CAT-008`; `AUTH-UI-001`; `NEXO-DOM-001`; requisitos `TREQ-NEXO-*` vigentes; código actual de `vento-nexo`; esquema y datos desplegados de solo lectura
**Cambios físicos autorizados:** ninguno; no modifica procesos operativos, código, rutas, permisos, productos, stock, movimientos, remisiones, activos, Supabase, tablas, funciones, RLS, migraciones, datos ni despliegues

---

#### 1. Propósito

Inventariar de forma completa y verificable cómo se ejecutan actualmente los
procesos reales de inventario y logística de NEXO, sin confundir:

- proceso empresarial;
- etapa o actividad;
- pantalla;
- ruta técnica;
- tabla;
- movimiento;
- documento;
- comportamiento objetivo todavía no implementado.

La regla de esta tarea es:

```text
IDENTIDAD CANÓNICA DE PROCESO
+
EVIDENCIA OPERATIVA AS-IS
+
ETAPAS REALES
+
ACTORES Y SOPORTES ACTUALES
+
DATOS Y SUPERFICIES OBSERVABLES
+
ESTADO, BLOQUEO Y DESTINO DOCUMENTAL
→
INVENTARIO REAL DE PROCESOS NEXO
```

Una ruta existente no demuestra por sí sola que un proceso esté completo. Una
tabla vacía no demuestra operación. Un registro desplegado demuestra uso del
objeto observado, pero no validación integral, calidad operativa ni aceptación
del proceso objetivo.

---

#### 2. Resultado material

Se aprueban tres artefactos documentales:

1. `NEXO-REAL-PROCESS-INVENTORY-001`, que materializa exactamente los seis
   procesos canónicos `VPROC-0023` a `VPROC-0028`, con cuarenta etapas AS-IS,
   disparadores, participantes, soportes, resultados actuales, estado,
   bloqueo y condición de salida;
2. `NEXO-CURRENT-PROCESS-EVIDENCE-MATRIX-001`, que reconcilia cada proceso con
   rutas reales de NEXO, estructuras desplegadas y evidencia cuantitativa;
3. `NEXO-REAL-PROCESS-HANDOFF-001`, que vincula cada ruptura o decisión
   pendiente con una tarea exacta de `NEXO-UX-002` a `NEXO-UX-025` sin iniciar
   dichas tareas.

Cobertura materializada:

| Elemento                                       | Total esperado | Total materializado | Faltantes | Duplicados |
| ---------------------------------------------- | -------------: | ------------------: | --------: | ---------: |
| Procesos canónicos de inventario y logística   |              6 |                   6 |         0 |          0 |
| Identificadores `VPROC-*` únicos               |              6 |                   6 |         0 |          0 |
| Alias AS-IS reconciliados                      |              6 |                   6 |         0 |          0 |
| Etapas actuales inventariadas                  |             40 |                  40 |         0 |          0 |
| Procesos con evidencia desplegada de ejecución |              5 |                   5 |         0 |          0 |
| Procesos sin flujo ejecutable completo         |              1 |                   1 |         0 |          0 |
| Procesos declarados `VALIDADO`                 |              0 |                   0 |         0 |          0 |
| Procesos con destino documental explícito      |              6 |                   6 |         0 |          0 |
| Requisitos de prueba nuevos o modificados      |              0 |                   0 |         0 |          0 |

Los seis procesos conservan su identidad canónica. Las claves de etapa
`VPROC-####::ASIS-##` pertenecen únicamente a este inventario y no crean
procesos empresariales nuevos.

---

#### 3. Corte de evidencia

El inventario utiliza un corte verificable del `2026-08-04` y distingue cuatro
niveles de evidencia:

| Nivel               | Significado                                                              |
| ------------------- | ------------------------------------------------------------------------ |
| `CANONICAL`         | decisión aprobada del plan canónico                                      |
| `CODE`              | superficie, acción o consulta presente en `vento-nexo`                   |
| `DEPLOYED`          | estructura o registro observado en el estado desplegado mediante lectura |
| `OPERATIONAL_CLAIM` | afirmación de operación humana conservada desde el levantamiento AS-IS   |

Ningún nivel sustituye a otro:

```text
CANONICAL ≠ CODE ≠ DEPLOYED ≠ VALIDATED_OPERATION
```

La tarea no declara validación operativa presencial, piloto, dispositivo,
intermitencia de red, conteo físico, despacho físico ni recepción física.

---

#### 4. Identidad de proceso y granularidad

El inventario conserva seis identidades estables:

```text
VPROC-0023
VPROC-0024
VPROC-0025
VPROC-0026
VPROC-0027
VPROC-0028
```

No se convierten en procesos independientes:

- consultar una pantalla;
- escanear un código;
- escoger una presentación;
- crear una fila;
- marcar un estado;
- imprimir una etiqueta;
- asignar una posición;
- registrar un movimiento;
- abrir un formulario;
- ejecutar una redirección.

Esas acciones se inventarían como etapas, variantes o soportes del proceso
propietario correspondiente.

---

#### 5. Alcance incluido

La tarea incluye:

- estructura de almacenamiento, LOC, zonas y posiciones;
- consulta de stock por sede, LOC, posición y presentación;
- ingreso físico y ubicación de existencias;
- entrada ordinaria correlacionable con compra y entrada de emergencia;
- corrección y reversión de entradas;
- retiros, consumos, asignaciones y traslados internos;
- historial de movimientos;
- conteos por LOC y posición;
- diferencias y ajustes;
- condición, vencimiento, cuarentena, merma, pérdida, frío y disposición;
- solicitud, preparación, transporte y recepción de abastecimiento interno;
- variantes manuales, parciales y fragmentadas que continúan existiendo;
- superficies de NEXO utilizadas como evidencia;
- estructuras desplegadas y sus conteos agregados;
- brechas y handoffs exactos hacia las tareas siguientes del mini-bloque.

---

#### 6. Límites y exclusiones

Esta tarea no desarrolla todavía:

- separación de operación, supervisión y configuración;
- home por rol;
- navegación por tareas;
- rediseño de bandejas o detalles;
- diseño final de solicitud, preparación, conductor o recepción;
- escaneo como contrato completo;
- diseño tablet o kiosco;
- prototipo o piloto;
- ciclo operativo de LPN;
- ciclo de activos, mantenimientos, kits o contenedores;
- permisos detallados;
- proceso TO-BE nuevo;
- migraciones o cambios de datos.

Las capacidades de LPN, activos, mantenimientos, kits y contenedores se
preservan, pero sus experiencias pertenecen a `NEXO-UX-026` y tareas
posteriores. No se cuentan como procesos adicionales dentro de este inventario.

---

#### 7. Estados usados por el inventario

Cada proceso y etapa declara uno de estos estados materiales:

| Estado                   | Uso en esta tarea                                                                |
| ------------------------ | -------------------------------------------------------------------------------- |
| `IMPLEMENTADO`           | existe soporte ejecutable y evidencia de uso o efecto desplegado                 |
| `ESPECIFICADO`           | existe contrato o estructura, pero no evidencia suficiente de ejecución completa |
| `BLOQUEADO`              | falta una capacidad necesaria para ejecutar el resultado de principio a fin      |
| `PENDIENTE_DE_EVIDENCIA` | existe soporte, pero no se observó evidencia operativa suficiente                |
| `NO_APLICA`              | la etapa no pertenece al proceso o al alcance                                    |
| `FUERA_DE_ALCANCE`       | pertenece a otra tarea o subdominio                                              |

`VALIDADO` no se utiliza porque no se ejecutó una validación operativa integral.

Las condiciones AS-IS conservadas son:

```text
OPERATIVO_CON_VARIANTES
PARCIAL
FRAGMENTADO
```

---

#### 8. Reconciliación de identidades canónicas

| Proceso      | Alias AS-IS    | Nombre objetivo aprobado                                                                       | Resultado real inventariado                                                                         | Condición AS-IS           | Estado material | Bloqueo principal                                                                                                                       | Destino inmediato                                                           |
| ------------ | -------------- | ---------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | ------------------------- | --------------- | --------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------- |
| `VPROC-0023` | `ASIS-SRC-023` | Gobernar sedes, LOC, zonas, posiciones y condiciones de almacenamiento                         | estructura física y lógica de almacenamiento disponible para ubicar, consultar y operar existencias | `PARCIAL`                 | `IMPLEMENTADO`  | catálogo de compatibilidad por ubicación sin materialización operativa y condiciones físicas no certificadas                            | `NEXO-UX-002`; `NEXO-UX-015`; `NEXO-UX-020`; `NEXO-UX-021`                  |
| `VPROC-0024` | `ASIS-SRC-024` | Registrar ingreso, ubicación y reubicación mediante movimientos correlacionados                | entradas y asignaciones que producen stock y trazabilidad física                                    | `PARCIAL`                 | `IMPLEMENTADO`  | recepción normal de ORIGO incompleta como experiencia nativa; posición, lote y vencimiento no materializados en las entradas observadas | `NEXO-UX-014`; `NEXO-UX-015`; `NEXO-UX-020`; `NEXO-UX-021`                  |
| `VPROC-0025` | `ASIS-SRC-025` | Retirar, consumir o trasladar existencias conservando unidad, conversión, origen y destino     | salidas y transferencias ejecutadas desde stock, LOC o posición con movimientos auditables          | `OPERATIVO_CON_VARIANTES` | `IMPLEMENTADO`  | flujos separados por superficie, selección limitada por contexto y ausencia de un contrato UX único por etapa                           | `NEXO-UX-016`; `NEXO-UX-017`; `NEXO-UX-020`; `NEXO-UX-021`; `NEXO-UX-023`   |
| `VPROC-0026` | `ASIS-SRC-026` | Contar como observación, investigar diferencias y ajustar mediante decisión separada           | sesiones de conteo, captura por línea o posición, diferencias y ajustes                             | `PARCIAL`                 | `IMPLEMENTADO`  | observación, investigación y autorización de ajuste no están separadas de forma completa en la experiencia actual                       | `NEXO-UX-018`; `NEXO-UX-019`; `NEXO-UX-021`; `NEXO-UX-024`; `NEXO-UX-025`   |
| `VPROC-0027` | `ASIS-SRC-027` | Gestionar condición, vencimiento, cuarentena, merma, pérdida, frío y disposición               | detección y tratamiento físico de existencia no apta o condicionada                                 | `FRAGMENTADO`             | `BLOQUEADO`     | no existe flujo dedicado completo ni casos desplegados que materialicen cuarentena, evaluación, decisión y disposición                  | `NEXO-UX-021`; `NEXO-UX-022`; `NEXO-UX-024`; `NEXO-UX-025`                  |
| `VPROC-0028` | `ASIS-SRC-028` | Ejecutar abastecimiento interno de solicitud a recepción con cantidades conciliables por etapa | remisiones internas soportadas por solicitud legacy, preparación, tránsito y recepción parcial      | `FRAGMENTADO`             | `IMPLEMENTADO`  | coexistencia entre modelo legacy activo y modelo de envíos, recibos y excepciones sin registros operativos                              | `NEXO-UX-009` a `NEXO-UX-013`; `NEXO-UX-020` a `NEXO-UX-022`; `NEXO-UX-025` |

Reconciliación:

```text
EXPECTED_PROCESS_IDS = 6
MATERIALIZED_PROCESS_IDS = 6
UNIQUE_PROCESS_IDS = 6
MISSING_PROCESS_IDS = 0
DUPLICATE_PROCESS_IDS = 0
```

---

#### 9. `NEXO-REAL-PROCESS-INVENTORY-001`

##### 9.1. `VPROC-0023` — Estructura de almacenamiento

**Propietaria:** `nexo`

**Iniciador primario:** `BODEGA_Y_ABASTECIMIENTO`

**Continuadores principales:** `BODEGA_Y_ABASTECIMIENTO` y
`RESPONSABLE_DE_CATALOGO`

**Control:** `GERENCIA_GENERAL`

**Disparador real:** necesidad de crear, modificar, habilitar, bloquear,
identificar o consultar una ubicación de almacenamiento.

**Resultado actual:** estructura de doce LOC activas y ochenta y seis
posiciones activas, consultable desde rutas de ubicaciones, stock, boards,
kioscos y enlaces de código.

| Etapa                 | Actividad AS-IS                                           | Actor actual                                | Soporte actual                                                            | Evidencia                                                                                       | Estado                   | Bloqueo o salida                                                          |
| --------------------- | --------------------------------------------------------- | ------------------------------------------- | ------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- | ------------------------ | ------------------------------------------------------------------------- |
| `VPROC-0023::ASIS-01` | crear o editar LOC por sede y área                        | bodega; catálogo; administración autorizada | `/inventory/locations`; `/inventory/locations/[id]`                       | 12 LOC activas                                                                                  | `IMPLEMENTADO`           | separar configuración de operación en `NEXO-UX-002`                       |
| `VPROC-0023::ASIS-02` | crear zonas, niveles y posiciones internas                | bodega; catálogo                            | `/inventory/locations/zones`; `/inventory/locations/zone`; detalle de LOC | 86 posiciones activas                                                                           | `IMPLEMENTADO`           | cerrar diseño de selección y escaneo en `NEXO-UX-015` y `NEXO-UX-020`     |
| `VPROC-0023::ASIS-03` | definir qué productos pueden almacenarse en una ubicación | catálogo; bodega                            | configuración de catálogo por LOC                                         | tabla disponible sin filas observadas                                                           | `BLOQUEADO`              | materializar reglas y experiencia sin iniciarlas en esta tarea            |
| `VPROC-0023::ASIS-04` | consultar stock por sede, LOC y posición                  | bodega; supervisión; áreas consumidoras     | `/inventory/stock`; board de LOC; vistas de stock                         | 202 saldos por sede, 218 por LOC y 172 por posición; 128 y 127 filas no cero por LOC y posición | `IMPLEMENTADO`           | distinguir lectura, supervisión y acción en `NEXO-UX-002` y `NEXO-UX-021` |
| `VPROC-0023::ASIS-05` | abrir una ubicación mediante board, kiosco o código       | equipo operativo; bodega                    | board, kiosco y deep link `/l/[code]`                                     | rutas existentes; uso físico no certificado                                                     | `PENDIENTE_DE_EVIDENCIA` | validar dispositivo y operación en `NEXO-UX-023` a `NEXO-UX-025`          |

**Rupturas conservadas:**

- una ubicación lógica todavía no demuestra capacidad, peso, volumen,
  temperatura, higiene o incompatibilidades;
- la existencia del código o etiqueta no habilita por sí sola almacenamiento;
- el catálogo por ubicación existe como estructura, pero no tiene filas
  observadas;
- lectura de stock, configuración y acción física aparecen próximas en la
  navegación actual.

---

##### 9.2. `VPROC-0024` — Ingreso, ubicación y reubicación

**Propietaria:** `nexo`

**Iniciador primario:** `RECEPCION_EN_SEDE`

**Continuadores principales:** `RECEPCION_EN_SEDE` y
`BODEGA_Y_ABASTECIMIENTO`

**Control:** `GERENCIA_O_SUPERVISION_DE_SEDE`

**Disparador real:** recepción aceptada, producción liberada, devolución,
entrada excepcional o existencia que requiere ubicación.

**Resultado actual:** cuatro entradas desplegadas, seis líneas de entrada y
movimientos de recepción, asignación y reversión.

| Etapa                 | Actividad AS-IS                                           | Actor actual                                       | Soporte actual                                | Evidencia                                                                                 | Estado         | Bloqueo o salida                                                     |
| --------------------- | --------------------------------------------------------- | -------------------------------------------------- | --------------------------------------------- | ----------------------------------------------------------------------------------------- | -------------- | -------------------------------------------------------------------- |
| `VPROC-0024::ASIS-01` | iniciar entrada excepcional sin flujo normal de ORIGO     | recepción; bodega; actor con permiso de emergencia | `/inventory/entries`                          | 2 entradas `emergency`                                                                    | `IMPLEMENTADO` | conservar como excepción y diseñar entrada en `NEXO-UX-014`          |
| `VPROC-0024::ASIS-02` | iniciar entrada normal correlacionada con orden de compra | recepción; ORIGO como origen documental            | `/inventory/entries?purchase_order_id=...`    | 2 entradas `normal`; 1 vinculada con orden de compra                                      | `IMPLEMENTADO` | completar experiencia nativa y diferencias en `NEXO-UX-014`          |
| `VPROC-0024::ASIS-03` | capturar producto, cantidad, presentación, unidad y costo | recepción                                          | formulario de entradas y perfiles UOM         | 6 líneas; 6 con perfil UOM y costo                                                        | `IMPLEMENTADO` | preservar presentación real y exactitud en `NEXO-UX-014`             |
| `VPROC-0024::ASIS-04` | asignar LOC de destino                                    | recepción; bodega                                  | entrada y `/inventory/stock/assign-location`  | 2 líneas con LOC; 2 movimientos `stock_assign_location`                                   | `IMPLEMENTADO` | volver obligatoria la selección válida en `NEXO-UX-015`              |
| `VPROC-0024::ASIS-05` | asignar posición interna                                  | recepción; bodega                                  | selector de posición y asignación de stock    | 0 líneas de entrada con posición; 20 movimientos `stock_assign_position` fuera de entrada | `PARCIAL`      | integrar LOC y posición en `NEXO-UX-015` y escaneo en `NEXO-UX-020`  |
| `VPROC-0024::ASIS-06` | publicar efecto, corregir o revertir entrada              | bodega; supervisión                                | movimientos, correcciones y estado de entrada | 3 `receipt_in`; 1 `receipt_reversal`; 1 corrección; 1 entrada `reversed`                  | `IMPLEMENTADO` | hacer visible causa, autor y efecto en `NEXO-UX-016` y `NEXO-UX-021` |

**Rupturas conservadas:**

- la recepción comercial de ORIGO y el ingreso físico de NEXO no conforman
  todavía una experiencia completa y conciliada;
- ninguna de las seis líneas observadas conserva posición interna;
- no se observaron lote ni vencimiento en las líneas desplegadas;
- el flujo de emergencia comparte parte del soporte con la entrada normal y
  deberá permanecer explícitamente excepcional;
- una entrada no debe inferirse desde factura, orden o pantalla sin hecho físico.

---

##### 9.3. `VPROC-0025` — Retiro, consumo y traslado

**Propietaria:** `nexo`

**Iniciador primario:** `AREA_SOLICITANTE`

**Continuadores principales:** `EQUIPO_OPERATIVO_DEL_AREA` y
`BODEGA_Y_ABASTECIMIENTO`

**Control:** `GERENCIA_O_SUPERVISION_DE_SEDE`

**Disparador real:** necesidad válida de retirar, consumir, transferir o mover
una cantidad identificable.

**Resultado actual:** salidas por stock y posición, transferencias internas y
ledger de movimientos desplegado.

| Etapa                 | Actividad AS-IS                                      | Actor actual              | Soporte actual                                 | Evidencia                                                                     | Estado                   | Bloqueo o salida                                                            |
| --------------------- | ---------------------------------------------------- | ------------------------- | ---------------------------------------------- | ----------------------------------------------------------------------------- | ------------------------ | --------------------------------------------------------------------------- |
| `VPROC-0025::ASIS-01` | identificar sede, LOC, posición y producto de origen | área solicitante; bodega  | stock, board, kiosco y retiro                  | saldos por sede, LOC y posición disponibles                                   | `IMPLEMENTADO`           | simplificar selección por tarea en `NEXO-UX-008` y `NEXO-UX-017`            |
| `VPROC-0025::ASIS-02` | escoger presentación o unidad de captura             | área solicitante; bodega  | perfiles UOM y formularios de retiro           | campos de cantidad, unidad y conversión desplegados                           | `IMPLEMENTADO`           | preservar unidad elegida y mínimos en `NEXO-UX-017`                         |
| `VPROC-0025::ASIS-03` | verificar disponibilidad y alcance antes del efecto  | NEXO; bodega; supervisión | consultas de stock y autorización              | soporte de stock presente; prueba operativa no ejecutada                      | `PENDIENTE_DE_EVIDENCIA` | hacer visible bloqueo y recuperación en `NEXO-UX-021` y `NEXO-UX-022`       |
| `VPROC-0025::ASIS-04` | consumir o retirar desde stock general               | equipo operativo; bodega  | `/inventory/withdraw`                          | 45 movimientos `consumption`                                                  | `IMPLEMENTADO`           | rediseñar retiro por presentación en `NEXO-UX-017`                          |
| `VPROC-0025::ASIS-05` | consumir o retirar desde posición o kiosco           | equipo operativo del área | kiosk withdraw y board                         | 68 movimientos `stock_consume_position`                                       | `IMPLEMENTADO`           | validar experiencia compartida en `NEXO-UX-023` a `NEXO-UX-025`             |
| `VPROC-0025::ASIS-06` | transferir entre LOC y conservar historial           | bodega; logística         | `/inventory/transfers`; `/inventory/movements` | 35 transferencias completadas, 51 líneas y 48 movimientos `transfer_internal` | `IMPLEMENTADO`           | consolidar lectura y etapas en `NEXO-UX-016`, `NEXO-UX-020` y `NEXO-UX-021` |

**Rupturas conservadas:**

- retiro general, retiro por posición, kiosco y transferencia usan superficies
  diferentes;
- la autorización, la disponibilidad, la unidad y el origen deben seguir
  visibles como hechos separados;
- un botón o escaneo no podrá descontar por inferencia;
- la consulta de movimientos es soporte transversal y no un proceso nuevo;
- los recorridos físicos y la intermitencia de red no están validados.

---

##### 9.4. `VPROC-0026` — Conteo, investigación y ajuste

**Propietaria:** `nexo`

**Iniciador primario:** `REGLA_PROGRAMADA`

**Continuadores principales:** `BODEGA_Y_ABASTECIMIENTO` y
`EQUIPO_OPERATIVO_DEL_AREA`

**Control:** `GERENCIA_O_SUPERVISION_DE_SEDE`

**Disparador real:** calendario de conteo, discrepancia, incidente o necesidad
de verificación extraordinaria.

**Resultado actual:** sesiones cerradas por LOC, líneas y capturas múltiples,
deltas y movimientos de reconciliación o ajuste.

| Etapa                 | Actividad AS-IS                                         | Actor actual                          | Soporte actual                            | Evidencia                                                         | Estado         | Bloqueo o salida                                                                        |
| --------------------- | ------------------------------------------------------- | ------------------------------------- | ----------------------------------------- | ----------------------------------------------------------------- | -------------- | --------------------------------------------------------------------------------------- |
| `VPROC-0026::ASIS-01` | abrir sesión con sede y LOC                             | bodega; regla programada; supervisión | `/inventory/count-initial`                | 75 sesiones; todas con alcance `loc`                              | `IMPLEMENTADO` | rediseñar conteo en `NEXO-UX-018`                                                       |
| `VPROC-0026::ASIS-02` | congelar alcance y conservar stock al abrir             | NEXO                                  | sesión y líneas de conteo                 | campos `current_qty_at_open` y alcance desplegados                | `ESPECIFICADO` | demostrar comportamiento concurrente en `NEXO-UX-024` y `NEXO-UX-025`                   |
| `VPROC-0026::ASIS-03` | registrar observación por producto                      | equipo operativo; bodega              | sesión de conteo                          | 386 líneas                                                        | `IMPLEMENTADO` | simplificar captura y faltantes en `NEXO-UX-018`                                        |
| `VPROC-0026::ASIS-04` | capturar varias presentaciones o posiciones             | equipo operativo                      | entradas de línea y posiciones            | 176 entradas de línea                                             | `IMPLEMENTADO` | validar teclado, escáner y concurrencia en `NEXO-UX-020`, `NEXO-UX-023` y `NEXO-UX-024` |
| `VPROC-0026::ASIS-05` | calcular diferencia sin sobrescribir el hecho observado | NEXO; supervisión                     | cantidad contada, stock al cierre y delta | campos de delta desplegados                                       | `IMPLEMENTADO` | separar investigación y decisión en `NEXO-UX-018` y `NEXO-UX-019`                       |
| `VPROC-0026::ASIS-06` | aplicar reconciliación o ajuste autorizado              | supervisión; bodega                   | `/inventory/adjust`; acciones de cierre   | 91 movimientos `stock_reconcile_position_count`; 522 `adjustment` | `IMPLEMENTADO` | preservar motivo, autoridad y evidencia en `NEXO-UX-019` y `NEXO-UX-021`                |
| `VPROC-0026::ASIS-07` | cerrar sesión y conservar historial                     | bodega; supervisión                   | detalle de sesión y movimientos           | 75 sesiones `closed`                                              | `IMPLEMENTADO` | certificar que cierre y ajuste no se confundan en `NEXO-UX-024` y `NEXO-UX-025`         |

**Rupturas conservadas:**

- el catálogo del ajuste conserva un límite inicial de consulta y solo recupera
  expresamente productos faltantes con stock visible;
- contar, investigar y aprobar ajuste no están representados como
  responsabilidades completamente separadas en todas las superficies;
- el volumen de ajustes observado no demuestra que cada uno tenga evidencia
  suficiente;
- no se ejecutaron pruebas de dos contadores, conteo ciego, red intermitente o
  cambios de stock durante una sesión.

---

##### 9.5. `VPROC-0027` — Condición, vencimiento y disposición

**Propietaria:** `nexo`

**Iniciador primario:** `UMBRAL_O_ALERTA`

**Continuadores principales:** `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD` y
`BODEGA_Y_ABASTECIMIENTO`

**Control:** `GERENCIA_O_SUPERVISION_DE_SEDE`

**Disparador real:** vencimiento próximo, excursión de frío, daño, pérdida,
merma, condición anómala, rechazo o necesidad de disposición.

**Resultado actual:** actividad humana fragmentada y algunos campos de lote o
vencimiento disponibles en recepción, sin un caso operativo completo.

| Etapa                 | Actividad AS-IS                                           | Actor actual                    | Soporte actual                            | Evidencia                                                                  | Estado         | Bloqueo o salida                                                           |
| --------------------- | --------------------------------------------------------- | ------------------------------- | ----------------------------------------- | -------------------------------------------------------------------------- | -------------- | -------------------------------------------------------------------------- |
| `VPROC-0027::ASIS-01` | detectar alerta, daño, pérdida, merma o vencimiento       | trabajador; calidad; bodega     | observación, avisos y registros dispersos | sin superficie dedicada observada                                          | `BLOQUEADO`    | diseñar estados y alertas en `NEXO-UX-021` y `NEXO-UX-022`                 |
| `VPROC-0027::ASIS-02` | identificar producto, existencia, lote, LOC y condición   | calidad; bodega                 | campos de entrada y stock                 | campos de lote y vencimiento existen; 0 líneas observadas con dichos datos | `ESPECIFICADO` | validar captura real en `NEXO-UX-024` y `NEXO-UX-025`                      |
| `VPROC-0027::ASIS-03` | bloquear o poner en cuarentena                            | calidad; bodega                 | no se observó caso dedicado               | sin filas de caso o cuarentena materializadas                              | `BLOQUEADO`    | resolver en `NEXO-UX-022` sin inferir disponibilidad                       |
| `VPROC-0027::ASIS-04` | evaluar condición, temperatura y aptitud                  | calidad; responsable productivo | revisión física y evidencia dispersa      | sin contrato operativo desplegado observado                                | `BLOQUEADO`    | prototipar y validar en `NEXO-UX-024` y `NEXO-UX-025`                      |
| `VPROC-0027::ASIS-05` | decidir liberación, merma, pérdida, rechazo o disposición | supervisión; calidad            | decisión manual                           | sin estado de decisión desplegado observado                                | `BLOQUEADO`    | separar decisión y ejecución en `NEXO-UX-022`                              |
| `VPROC-0027::ASIS-06` | ejecutar movimiento físico y efecto de stock              | bodega; equipo operativo        | movimientos genéricos                     | no se identificó tipo dedicado de cuarentena o disposición                 | `BLOQUEADO`    | vincular causa y efecto en `NEXO-UX-016`, `NEXO-UX-021` y `NEXO-UX-022`    |
| `VPROC-0027::ASIS-07` | conservar evidencia y cerrar caso                         | calidad; supervisión            | documentos o mensajes dispersos           | sin cierre de caso desplegado observado                                    | `BLOQUEADO`    | definir evidencia y piloto en `NEXO-UX-022`, `NEXO-UX-024` y `NEXO-UX-025` |

**Rupturas conservadas:**

- no existe una superficie dedicada de principio a fin;
- lote y vencimiento como columnas no equivalen a control operativo;
- no se observó cuarentena, liberación, disposición ni cierre como casos
  trazables;
- daño o pérdida no pueden resolverse mediante ajuste genérico sin causa,
  decisión y evidencia;
- el proceso permanece bloqueado para adopción digital completa.

---

##### 9.6. `VPROC-0028` — Abastecimiento interno y remisiones

**Propietaria:** `nexo`

**Iniciador primario:** `AREA_SOLICITANTE`

**Continuadores principales:** `BODEGA_Y_ABASTECIMIENTO`,
`LOGISTICA_Y_TRANSPORTE` y `RECEPCION_EN_SEDE`

**Control:** `COORDINACION_DE_OPERACIONES`

**Disparador real:** necesidad interna con producto, cantidad, destino y fecha
requerida.

**Resultado actual:** once solicitudes internas legacy con doscientas noventa
y cuatro líneas, sesenta y cinco cumplimientos y estados de preparación,
tránsito y recepción; el modelo físico nuevo de picking, envío, recibo y
excepción no tiene registros observados.

| Etapa                 | Actividad AS-IS                                               | Actor actual                                        | Soporte actual                                                     | Evidencia                                                                                        | Estado         | Bloqueo o salida                                                                                    |
| --------------------- | ------------------------------------------------------------- | --------------------------------------------------- | ------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------ | -------------- | --------------------------------------------------------------------------------------------------- |
| `VPROC-0028::ASIS-01` | crear solicitud por sede, área, producto, cantidad y fecha    | área solicitante; producción; servicio; supervisión | `/inventory/remissions`                                            | 11 solicitudes internas; 294 líneas                                                              | `IMPLEMENTADO` | rediseñar solicitud en `NEXO-UX-009`                                                                |
| `VPROC-0028::ASIS-02` | aplicar ruta, producto elegible y política de solicitud       | NEXO; catálogo; bodega                              | settings de rutas, remisiones y políticas                          | 3 rutas de suministro, 26 rutas de fulfillment, 1.122 políticas y 367 presentaciones de política | `IMPLEMENTADO` | separar configuración en `NEXO-UX-002` y simplificar captura en `NEXO-UX-009`                       |
| `VPROC-0028::ASIS-03` | crear fuente o fulfillment para cada línea                    | bodega; NEXO                                        | fulfillment                                                        | 65 filas: 44 `blocked`, 21 `pending`                                                             | `IMPLEMENTADO` | mostrar causa y recuperación en `NEXO-UX-010` y `NEXO-UX-022`                                       |
| `VPROC-0028::ASIS-04` | escoger LOC, posición y cantidad real de picking              | preparador; bodega                                  | preparación por LOC y estructura `restock_request_item_picks`      | 0 picks observados                                                                               | `BLOQUEADO`    | diseñar preparación en `NEXO-UX-010` y escaneo en `NEXO-UX-020`                                     |
| `VPROC-0028::ASIS-05` | preparar y declarar cantidad lista o faltante                 | preparador; bodega                                  | `/inventory/remissions/prepare`; fulfillment                       | 3 solicitudes `preparing`; cantidades preparadas en líneas                                       | `IMPLEMENTADO` | separar solicitado, preparado y faltante en `NEXO-UX-010` y `NEXO-UX-021`                           |
| `VPROC-0028::ASIS-06` | cargar, sellar y despachar un envío físico                    | bodega; logística                                   | modelo de dispatch y shipment; superficies de conductor y tránsito | 0 dispatch runs, shipments y shipment items                                                      | `BLOQUEADO`    | diseñar conductor y handoff en `NEXO-UX-011` y `NEXO-UX-012`                                        |
| `VPROC-0028::ASIS-07` | transportar y confirmar tránsito                              | conductor o responsable de ruta                     | `/inventory/remissions/conductor`; `/transit`                      | 2 solicitudes legacy `in_transit`; 0 shipments nuevos                                            | `IMPLEMENTADO` | reconciliar custodia física en `NEXO-UX-011`, `NEXO-UX-012` y `NEXO-UX-020`                         |
| `VPROC-0028::ASIS-08` | recibir cantidades parciales o completas                      | recepción en sede                                   | `/inventory/remissions/receive`                                    | 1 solicitud legacy `received`; 0 receipts y receipt items nuevos                                 | `IMPLEMENTADO` | diseñar recepción independiente en `NEXO-UX-013` y estados en `NEXO-UX-021`                         |
| `VPROC-0028::ASIS-09` | registrar faltante, sobrante, daño, rechazo, retorno y cierre | recepción; logística; coordinación                  | campos legacy de faltante y modelo `remission_exceptions`          | 0 excepciones nuevas observadas                                                                  | `BLOQUEADO`    | materializar recuperación en `NEXO-UX-013`, `NEXO-UX-021`, `NEXO-UX-022` y validar en `NEXO-UX-025` |

**Rupturas conservadas:**

- el modelo legacy de solicitudes está usado, mientras las estructuras nuevas
  de envío, recibo y excepción permanecen sin registros;
- existen cuarenta y cuatro fulfillments bloqueados y ninguno tiene pick
  materializado;
- el estado mutable de la solicitud no sustituye cantidades independientes por
  etapa;
- conductor, despacho y receptor requieren aceptación y custodia propias;
- una solicitud en tránsito legacy no demuestra que exista shipment físico;
- recepción legacy no demuestra receipt idempotente ni resolución de
  diferencias;
- papel, Excel, capturas y WhatsApp siguen siendo variantes AS-IS preservadas
  por el catálogo y no se eliminan por la existencia de rutas digitales.

---

#### 10. `NEXO-CURRENT-PROCESS-EVIDENCE-MATRIX-001`

##### 10.1. Superficies actuales relevantes

| Proceso      | Rutas o familias de ruta observadas                                                                          | Papel actual                                                                                 | Límite interpretativo                                                                |
| ------------ | ------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------ |
| `VPROC-0023` | `NEXO-ROUTE-020` a `NEXO-ROUTE-027`; `NEXO-ROUTE-052`; `NEXO-ROUTE-053`; `NEXO-ROUTE-058`                    | ubicaciones, zonas, posiciones, board, kiosco, stock y asignación                            | una ruta no demuestra capacidad física ni validación de uso                          |
| `VPROC-0024` | `NEXO-ROUTE-019`; `NEXO-ROUTE-053`; apoyo de `NEXO-ROUTE-029`                                                | entrada, asignación y consulta de movimiento                                                 | el formulario de entrada no sustituye aceptación comercial ni conciliación con ORIGO |
| `VPROC-0025` | `NEXO-ROUTE-023`; `NEXO-ROUTE-029`; `NEXO-ROUTE-054` a `NEXO-ROUTE-056`                                      | retiro por kiosco, movimientos, transferencias y retiro general                              | superficies separadas no equivalen a un único recorrido validado                     |
| `VPROC-0026` | `NEXO-ROUTE-002`; `NEXO-ROUTE-017`; `NEXO-ROUTE-018`; apoyo de `NEXO-ROUTE-029`                              | ajuste, apertura y detalle de conteo, historial                                              | conteo, investigación y ajuste deben conservar decisiones separadas                  |
| `VPROC-0027` | sin ruta dedicada de principio a fin                                                                         | campos parciales y operación humana                                                          | ausencia de ruta no elimina el proceso; confirma su condición fragmentada            |
| `VPROC-0028` | `NEXO-ROUTE-031` a `NEXO-ROUTE-038`; `NEXO-ROUTE-041`; `NEXO-ROUTE-045` a `NEXO-ROUTE-047`; `NEXO-ROUTE-050` | solicitud, detalle, fulfillment, preparación, conductor, recepción, tránsito y configuración | múltiples rutas no prueban conciliación física completa ni adopción del modelo nuevo |

##### 10.2. Evidencia desplegada agregada

| Objeto o hecho                            | Filas observadas | Interpretación permitida                               |
| ----------------------------------------- | ---------------: | ------------------------------------------------------ |
| `inventory_locations` activas             |               12 | existen LOC activas                                    |
| `inventory_location_positions` activas    |               86 | existe jerarquía de posiciones                         |
| `inventory_location_product_catalog`      |                0 | no se materializó catálogo por ubicación               |
| stock por sede                            |              202 | existe proyección de stock por sede                    |
| stock por LOC                             |              218 | existe proyección por LOC                              |
| stock por posición                        |              172 | existe proyección por posición                         |
| stock por presentación                    |              121 | existen saldos físicos por perfil UOM                  |
| `inventory_movements`                     |              803 | existe ledger con uso material                         |
| `inventory_entries`                       |                4 | existe operación de entrada limitada                   |
| líneas de entrada                         |                6 | existen líneas con UOM y costo                         |
| correcciones de entrada                   |                1 | existe corrección materializada                        |
| transferencias                            |               35 | existe operación de traslado interno                   |
| líneas de transferencia                   |               51 | existen productos trasladados                          |
| sesiones de conteo                        |               75 | existe operación de conteo por LOC                     |
| líneas de conteo                          |              386 | existen observaciones por producto                     |
| entradas múltiples de conteo              |              176 | existe captura desagregada                             |
| solicitudes internas                      |               11 | existe proceso legacy de remisiones                    |
| líneas solicitadas                        |              294 | existe demanda interna registrada                      |
| fulfillments                              |               65 | existe asignación de fuente parcial                    |
| picks                                     |                0 | no existe picking materializado en la estructura nueva |
| dispatch runs, shipments y shipment items |                0 | el despacho físico nuevo no está adoptado              |
| receipts y receipt items                  |                0 | la recepción nueva no está adoptada                    |
| excepciones de remisión                   |                0 | la resolución estructurada no está adoptada            |
| LPN y contenidos                          |                0 | LPN no está operativo en el corte                      |
| activos individuales                      |               38 | evidencia de subdominio posterior                      |
| grupos reutilizables                      |               90 | evidencia de subdominio posterior                      |
| movimientos de activos                    |              131 | evidencia de uso del subdominio posterior              |

##### 10.3. Tipos de movimiento observados

| Tipo desplegado                  | Filas | Proceso principal |
| -------------------------------- | ----: | ----------------- |
| `adjustment`                     |   522 | `VPROC-0026`      |
| `stock_reconcile_position_count` |    91 | `VPROC-0026`      |
| `consumption`                    |    45 | `VPROC-0025`      |
| `stock_consume_position`         |    68 | `VPROC-0025`      |
| `transfer_internal`              |    48 | `VPROC-0025`      |
| `receipt_in`                     |     3 | `VPROC-0024`      |
| `receipt_reversal`               |     1 | `VPROC-0024`      |
| `stock_assign_location`          |     2 | `VPROC-0024`      |
| `stock_assign_position`          |    20 | `VPROC-0024`      |
| `initial_count`                  |     3 | `VPROC-0026`      |

La suma de tipos observados es 803. El tipo de movimiento no sustituye la
identidad ni el cierre del proceso que lo origina.

---

#### 11. Actores y continuidad real

| Proceso      | Iniciador                 | Continuadores                | Control                        | Apoyos o consumidores relevantes                                                               |
| ------------ | ------------------------- | ---------------------------- | ------------------------------ | ---------------------------------------------------------------------------------------------- |
| `VPROC-0023` | `BODEGA_Y_ABASTECIMIENTO` | bodega; catálogo             | gerencia general               | instalaciones; operaciones; FOGO; ORIGO; PULSO; VISO                                           |
| `VPROC-0024` | `RECEPCION_EN_SEDE`       | recepción; bodega            | gerencia o supervisión de sede | logística; calidad; ORIGO; FOGO; PULSO; NUMERA                                                 |
| `VPROC-0025` | `AREA_SOLICITANTE`        | equipo operativo; bodega     | gerencia o supervisión de sede | producción; logística; caja, mostrador o servicio; FOGO; PULSO; ORIGO; NUMERA                  |
| `VPROC-0026` | `REGLA_PROGRAMADA`        | bodega; equipo operativo     | gerencia o supervisión de sede | operaciones; analítica; NUMERA; VISO; consumidores condicionales                               |
| `VPROC-0027` | `UMBRAL_O_ALERTA`         | calidad; bodega              | gerencia o supervisión de sede | producción; instalaciones; equipo operativo; técnico externo; FOGO; PULSO; ORIGO; VISO; NUMERA |
| `VPROC-0028` | `AREA_SOLICITANTE`        | bodega; logística; recepción | coordinación de operaciones    | producción; caja, mostrador o servicio; FOGO; ORIGO; PULSO; NUMERA                             |

La matriz no modifica roles ni permisos. Registra responsabilidades funcionales
aprobadas y evidencia actual para que `NEXO-UX-002` separe operación,
supervisión y configuración.

---

#### 12. Variantes manuales y externas preservadas

El inventario no elimina ni normaliza silenciosamente estas variantes:

| Variante                                                        | Procesos afectados         | Estado         | Tratamiento en esta tarea                           |
| --------------------------------------------------------------- | -------------------------- | -------------- | --------------------------------------------------- |
| conocimiento local para ubicar existencias                      | `VPROC-0023`; `VPROC-0024` | `PARCIAL`      | preservada como evidencia AS-IS                     |
| papel, Excel, capturas y WhatsApp en remisiones                 | `VPROC-0028`               | `FRAGMENTADO`  | preservada hasta que exista adopción validada       |
| observación y avisos para daño, merma, frío o vencimiento       | `VPROC-0027`               | `FRAGMENTADO`  | preservada; no presentada como flujo digital        |
| revisión manual de diferencias de conteo                        | `VPROC-0026`               | `PARCIAL`      | preservada; autorización pendiente de separación UX |
| recepción excepcional fuera del flujo normal de ORIGO           | `VPROC-0024`               | `IMPLEMENTADO` | conservada como excepción explícita                 |
| coordinación verbal durante preparación, transporte o recepción | `VPROC-0028`               | `FRAGMENTADO`  | preservada como variante y riesgo de trazabilidad   |

La existencia de una superficie digital no autoriza retirar una variante manual
hasta que el proceso objetivo esté implementado, validado y tenga contingencia.

---

#### 13. Fronteras entre procesos

```text
VPROC-0023
DEFINE DÓNDE PUEDE ESTAR UNA EXISTENCIA

VPROC-0024
REGISTRA CÓMO INGRESA O CAMBIA DE UBICACIÓN

VPROC-0025
REGISTRA CÓMO SALE, SE CONSUME O SE TRASLADA

VPROC-0026
OBSERVA CUÁNTO HAY Y DECIDE AJUSTES SEPARADAMENTE

VPROC-0027
DECIDE SI UNA EXISTENCIA ES APTA, BLOQUEADA O DISPUESTA

VPROC-0028
COORDINA ABASTECIMIENTO INTERNO ENTRE SEDES Y ACTORES
```

Prohibiciones:

- una LOC no crea existencia;
- una entrada no aprueba una compra;
- una solicitud no reserva ni despacha automáticamente;
- una preparación no confirma transporte;
- tránsito no confirma recepción;
- recepción no resuelve diferencias por silencio;
- conteo no ajusta por el hecho de observar una diferencia;
- ajuste no sustituye merma, pérdida, cuarentena o disposición;
- un movimiento no sustituye el proceso ni su evidencia;
- una vista de historial no crea un proceso de auditoría separado.

---

#### 14. Dependencias entre aplicaciones

| Proceso      | Aplicación propietaria | Aplicaciones consumidoras                       | Frontera actual                                                                            |
| ------------ | ---------------------- | ----------------------------------------------- | ------------------------------------------------------------------------------------------ |
| `VPROC-0023` | NEXO                   | FOGO; ORIGO; PULSO; VISO                        | las consumidoras referencian ubicaciones; no crean una fuente paralela                     |
| `VPROC-0024` | NEXO                   | ORIGO; FOGO; PULSO; NUMERA                      | ORIGO acepta comercialmente; NEXO registra efecto físico                                   |
| `VPROC-0025` | NEXO                   | FOGO; PULSO; ORIGO; NUMERA                      | la aplicación origen solicita el efecto; NEXO gobierna stock y movimiento                  |
| `VPROC-0026` | NEXO                   | NUMERA; VISO; FOGO, PULSO y ORIGO condicionales | consumidores reciben diferencias y ajustes aprobados, no observaciones ambiguas            |
| `VPROC-0027` | NEXO                   | FOGO; PULSO; ORIGO; VISO; NUMERA                | calidad u otra aplicación puede originar alerta; NEXO gobierna condición física            |
| `VPROC-0028` | NEXO                   | FOGO; ORIGO; PULSO; NUMERA                      | aplicaciones originan necesidades; NEXO gobierna solicitud, custodia, tránsito y recepción |

No se implementa integración en esta tarea.

---

#### 15. `NEXO-REAL-PROCESS-HANDOFF-001`

Cada brecha queda vinculada con una tarea exacta:

| Handoff  | Hallazgo material                                                    | Tarea responsable             | Condición de salida                                                                 |
| -------- | -------------------------------------------------------------------- | ----------------------------- | ----------------------------------------------------------------------------------- |
| `HX-001` | operación, supervisión y configuración conviven en familias próximas | `NEXO-UX-002`                 | cada superficie y acción queda clasificada sin cambiar identidad de proceso         |
| `HX-002` | cada rol requiere punto de entrada distinto                          | `NEXO-UX-003` a `NEXO-UX-007` | homes por rol consumen el inventario sin duplicar procesos                          |
| `HX-003` | navegación actual se organiza parcialmente por módulos y rutas       | `NEXO-UX-008`                 | navegación se organiza por tareas reales y handoffs                                 |
| `HX-004` | solicitud legacy mezcla política, catálogo, cantidad y estado        | `NEXO-UX-009`                 | solicitud tiene captura simple, origen, destino, fecha y cantidad inequívocos       |
| `HX-005` | preparación tiene fulfillments bloqueados y cero picks               | `NEXO-UX-010`                 | preparación separa asignación, pick, cantidad real, faltante y listo                |
| `HX-006` | conductor opera sobre estado legacy sin shipment físico              | `NEXO-UX-011`                 | conductor recibe unidades de custodia identificables y acciones limitadas           |
| `HX-007` | despacho, tránsito y handoff no tienen evidencia física nueva        | `NEXO-UX-012`                 | despacho conserva carga, salida, custodia y aceptación del transportador            |
| `HX-008` | recepción legacy no materializa receipts ni excepciones nuevas       | `NEXO-UX-013`                 | recepción conserva recibido, aceptado, faltante, sobrante, daño y rechazo por línea |
| `HX-009` | entrada ordinaria y emergencia comparten soporte parcial             | `NEXO-UX-014`                 | flujo normal y excepción quedan inequívocos y correlacionados                       |
| `HX-010` | solo dos líneas de entrada tienen LOC y ninguna posición             | `NEXO-UX-015`                 | destino exige LOC y posición válidas según el contexto                              |
| `HX-011` | historial mezcla tipos de movimiento sin narrativa por proceso       | `NEXO-UX-016`                 | cada hecho muestra causa, origen, destino, cantidad, actor y correlación            |
| `HX-012` | retiro usa variantes general, posición y kiosco                      | `NEXO-UX-017`                 | selección de presentación, unidad y cantidad permanece estable por recorrido        |
| `HX-013` | conteo, investigación y ajuste no están completamente segregados     | `NEXO-UX-018`; `NEXO-UX-019`  | observación, diferencia, decisión y movimiento quedan separados                     |
| `HX-014` | escaneo no es contrato común de las etapas físicas                   | `NEXO-UX-020`                 | escaneo identifica recurso y propone acción sin ejecutar por inferencia             |
| `HX-015` | bloqueos y cantidades por etapa no están visibles de forma uniforme  | `NEXO-UX-021`                 | cada etapa muestra estado, cantidad, responsable y siguiente acción válida          |
| `HX-016` | VPROC-0027 y excepciones de remisión carecen de recorrido completo   | `NEXO-UX-022`                 | excepciones conservan causa, contención, decisión, resolución y cierre              |
| `HX-017` | tablet, kiosco, periféricos y red intermitente no están certificados | `NEXO-UX-023`                 | perfil de dispositivo y contingencia se definen por estación                        |
| `HX-018` | no existe prototipo operativo validado con actores                   | `NEXO-UX-024`                 | recorridos prioritarios se prueban con actores y escenarios reales                  |
| `HX-019` | no existen métricas de éxito de experiencia ni piloto completo       | `NEXO-UX-025`                 | se aprueban métricas, umbrales y evidencia de piloto                                |

No se crea una tarea nueva. Todos los hallazgos tienen propietario existente.

---

#### 16. Riesgos AS-IS identificados

| Riesgo                                                      | Evidencia                                      | Procesos                   | Estado                   |
| ----------------------------------------------------------- | ---------------------------------------------- | -------------------------- | ------------------------ |
| ubicación lógica sin compatibilidad materializada           | catálogo por LOC con 0 filas                   | `VPROC-0023`               | `BLOQUEADO`              |
| ingreso sin posición interna                                | 0 líneas de entrada con posición               | `VPROC-0024`               | `PARCIAL`                |
| lote y vencimiento no usados en entradas observadas         | 0 de 6 líneas                                  | `VPROC-0024`; `VPROC-0027` | `PENDIENTE_DE_EVIDENCIA` |
| alto volumen de ajustes sin validación operativa del motivo | 522 movimientos                                | `VPROC-0026`               | `PENDIENTE_DE_EVIDENCIA` |
| proceso de condición sin caso dedicado                      | ausencia de superficie y registros             | `VPROC-0027`               | `BLOQUEADO`              |
| fulfillment sin picking                                     | 65 fulfillments y 0 picks                      | `VPROC-0028`               | `BLOQUEADO`              |
| modelo nuevo de remisión sin adopción                       | 0 shipments, receipts y exceptions             | `VPROC-0028`               | `BLOQUEADO`              |
| coexistencia legacy y objetivo                              | solicitudes legacy usadas y modelo nuevo vacío | `VPROC-0028`               | `PARCIAL`                |
| interfaces manuales aún necesarias                          | catálogo AS-IS aprobado                        | `VPROC-0027`; `VPROC-0028` | `PENDIENTE_DE_EVIDENCIA` |
| LPN no operativo                                            | 0 LPN y 0 contenidos                           | frontera posterior         | `FUERA_DE_ALCANCE`       |

Estos riesgos no se cierran en NEXO-UX-001. Se conservan como entradas
obligatorias de las tareas responsables.

---

#### 17. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA NUEVOS NI MODIFICA REQUISITOS EXISTENTES.

**Justificación:** la tarea consolida evidencia AS-IS de procesos, etapas,
superficies y uso desplegado. No aprueba un comportamiento objetivo nuevo, no
modifica contratos ejecutables y no declara satisfecha ninguna prueba. Los
riesgos observados ya quedan cubiertos por requisitos vigentes, incluidos
`TREQ-NEXO-002`, `TREQ-NEXO-011` a `TREQ-NEXO-016`, `TREQ-NEXO-020`,
`TREQ-NEXO-032`, `TREQ-NEXO-035`, `TREQ-NEXO-040` a `TREQ-NEXO-049` y los
requisitos transversales de `VPROC-0023` a `VPROC-0028`.

No se genera una copia del registro 04A.

---

#### 18. Decisiones aprobadas

1. el inventario de procesos reales de NEXO contiene exactamente seis
   identidades canónicas: `VPROC-0023` a `VPROC-0028`;
2. las cuarenta etapas materializadas son etapas AS-IS y no procesos nuevos;
3. `VPROC-0023`, `VPROC-0024`, `VPROC-0025`, `VPROC-0026` y `VPROC-0028`
   poseen evidencia desplegada de ejecución;
4. `VPROC-0027` permanece bloqueado como flujo digital completo;
5. ningún proceso se declara validado;
6. el flujo de entrada de emergencia es excepción y no sustituto del flujo
   normal de ORIGO;
7. conteo, investigación y ajuste son resultados diferentes aunque compartan
   datos o superficies;
8. la solicitud legacy de remisión no equivale al modelo nuevo de shipment y
   receipt;
9. un estado legacy `in_transit` no demuestra shipment físico;
10. un estado legacy `received` no demuestra receipt idempotente ni resolución
    de diferencias;
11. manuales, mensajes, papel y Excel permanecen como variantes AS-IS hasta
    adopción validada;
12. rutas, tablas y movimientos son evidencia y soporte, no identidades de
    proceso;
13. cada ruptura tiene una tarea responsable existente;
14. no se modifica código, Supabase, datos ni operación;
15. `NEXO-UX-002` permanece reservada.

---

#### 19. Criterios de aceptación

1. aparecen exactamente `VPROC-0023` a `VPROC-0028`;
2. cada proceso aparece una sola vez en la matriz principal;
3. no falta ningún alias `ASIS-SRC-023` a `ASIS-SRC-028`;
4. se preservan los nombres y fronteras aprobados;
5. se materializan exactamente cuarenta etapas con clave única;
6. cada etapa declara actividad, actor, soporte, evidencia, estado y salida;
7. se diferencian proceso, etapa, ruta, tabla, movimiento y documento;
8. se preservan variantes manuales y fragmentadas;
9. se registran doce LOC activas y ochenta y seis posiciones activas;
10. se registra catálogo por ubicación con cero filas;
11. se registran 803 movimientos y su distribución observada;
12. se registran cuatro entradas, seis líneas y una corrección;
13. se registra una entrada vinculada con orden de compra;
14. se registran dos líneas con LOC y cero con posición;
15. se registran cero líneas con lote o vencimiento;
16. se registran treinta y cinco transferencias y cincuenta y una líneas;
17. se registran setenta y cinco sesiones cerradas por LOC;
18. se registran trescientas ochenta y seis líneas y ciento setenta y seis
    entradas de conteo;
19. se registran once solicitudes internas y doscientas noventa y cuatro líneas;
20. se registran sesenta y cinco fulfillments, cuarenta y cuatro bloqueados y
    veintiuno pendientes;
21. se registran cero picks;
22. se registran cero dispatch runs, shipments, receipts y excepciones del
    modelo nuevo;
23. se diferencia operación legacy de modelo nuevo sin adopción;
24. `VPROC-0027` no se presenta como implementado;
25. no se declara ningún proceso `VALIDADO`;
26. cada hallazgo tiene tarea responsable exacta;
27. no se crea una tarea nueva;
28. se declaran cero cambios TREQ;
29. no se genera una copia innecesaria de 04A;
30. no se inicia `NEXO-UX-002`;
31. no se modifica código, datos, Supabase, rutas, permisos ni despliegues.

---

#### 20. Evidencia disponible y pendiente

**Evidencia disponible:**

- catálogo canónico AS-IS;
- seis identidades `VPROC-*` y sus fronteras aprobadas;
- propiedad, consumidoras, iniciadores y continuadores;
- inventario canónico de 64 rutas NEXO;
- superficies y acciones existentes en `vento-nexo`;
- esquema desplegado de inventario, remisiones y activos;
- conteos agregados de estructuras y estados;
- distribución de movimientos;
- coexistencia entre remisiones legacy y estructuras nuevas vacías;
- requisitos de prueba vigentes.

**Evidencia pendiente:**

- observación presencial de cada sede y rol;
- tiempos reales por etapa;
- recorridos físicos y distancias;
- uso real de escáner, etiquetas, báscula e impresora;
- operación con red intermitente;
- conteo concurrente y conteo ciego;
- prueba de disponibilidad durante ajustes;
- preparación, carga, handoff y recepción físicas;
- diferencias, daños, sobrantes, faltantes y devoluciones reales;
- operación completa de condición, cuarentena y disposición;
- piloto y métricas de éxito.

La evidencia pendiente tiene destino en `NEXO-UX-020` a `NEXO-UX-025` y no se
presenta como cumplimiento.

---

#### 21. Fuera del alcance

NEXO-UX-001 no:

- rediseña pantallas;
- cambia navegación;
- separa permisos o modalidades;
- modifica la aplicación;
- crea o actualiza tablas;
- cambia estados de remisión;
- transforma solicitudes legacy;
- crea shipments, receipts, picks o excepciones;
- modifica stock o movimientos;
- crea LOC, posiciones o catálogo por ubicación;
- corrige entradas o conteos;
- aprueba clasificaciones de producto;
- implementa LPN, activos, kits o contenedores;
- ejecuta DDL, DML, backfills o despliegues;
- inicia `NEXO-UX-002`.

---

#### 22. Cierre de tarea y continuidad

**ÚLTIMA TAREA APROBADA**

`NEXO-DOM-001 — Clasificar consumibles, stock por cantidad, reutilizables, activos serializados, repuestos, kits y contenedores`

**TAREA ACTUAL APROBADA**

`NEXO-UX-001 — Inventariar procesos reales de inventario y logística`

**SIGUIENTE TAREA RESERVADA**

`NEXO-UX-002 — Separar operación, supervisión y configuración`

Las tareas `NEXO-UX-002` a `NEXO-UX-048` permanecen no iniciadas. La
continuidad normal de `NEXO-DOM-002` a `NEXO-DOM-038` permanece preservada y
no se modifica en esta tarea.


### ✅ NEXO-UX-002 — Separar operación, supervisión y configuración

**Estado:** APROBADA
**Tarea anterior:** NEXO-UX-001 — Inventariar procesos reales de inventario y logística
**Tarea siguiente:** NEXO-UX-003 — Diseñar inicio para solicitante
**Tipo de tarea:** Documental
**Bloque:** BLOQUE K — NEXO
**Mini-bloque:** Experiencia de inventario, logística y activos
**Fase:** Diseño funcional de experiencia, sin implementación física
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Aplicación analizada:** `devVentoGroup/vento-nexo`
**Cambios en código, migraciones, Supabase, permisos, rutas o despliegues:** no autorizados ni ejecutados

**Artefactos canónicos producidos:**

- `NEXO-UX-LANE-CONTRACT-001`;
- `NEXO-ASIS-STAGE-LANE-MATRIX-001`;
- `NEXO-ROUTE-LANE-DISPOSITION-001`;
- `NEXO-LANE-NAVIGATION-HANDOFF-001`.

---

#### 1. Propósito

Separar de forma explícita el trabajo operativo, el control supervisor y la administración de configuración dentro de NEXO, de modo que cada actor encuentre las tareas que le corresponden sin recibir facultades implícitas, pantallas mezcladas ni acciones incompatibles en una misma proyección de experiencia.

La separación se aplica a las **40 etapas AS-IS** aprobadas en `NEXO-UX-001` y a las **64 rutas reales** inventariadas para NEXO. No cambia todavía rutas, navegación, permisos, componentes, tablas ni comportamiento ejecutable.

```text
PROCESO Y ETAPA CANÓNICOS
        +
RUTA O SUPERFICIE ACTUAL
        ↓
CARRIL FUNCIONAL EXPLÍCITO
        ↓
OPERACIÓN | SUPERVISIÓN | CONFIGURACIÓN
        +
SEPARACIÓN EXPLÍCITA CUANDO UNA SUPERFICIE MEZCLA AUTORIDADES
```

---

#### 2. Resultado obligatorio

La tarea produce una clasificación materializada y reconciliada que:

1. asigna exactamente un carril a cada etapa AS-IS;
2. asigna exactamente una disposición a cada ruta real;
3. identifica los puntos que requieren separación visible de captura, decisión, publicación o cierre;
4. preserva la autorización de servidor como autoridad independiente de la clasificación visual;
5. evita que configuración aparezca en el flujo primario de personal operativo;
6. evita que supervisión modifique hechos operativos sin decisión y evidencia explícitas;
7. conserva referencias de solo lectura cuando una tarea operativa necesita contexto supervisor;
8. entrega handoffs exactos a las tareas posteriores del mismo mini-bloque.

---

#### 3. Fuentes canónicas y técnicas consumidas

- `01_PROTOCOLO.md`;
- `delivery-contract.json`;
- `active-sequence.json`;
- `execution-route.json`;
- `priority-route-progress.json`;
- `NEXO-UX-001 — Inventariar procesos reales de inventario y logística`;
- `NEXO-DOM-001 — Clasificar consumibles, stock por cantidad, activos, reutilizables, LPN y costo`;
- `PROC-CAT-004` a `PROC-CAT-008`;
- `AUTH-UI-001`;
- `AUTH-UI-015` a `AUTH-UI-018`;
- inventario de rutas y clasificación funcional vigente de BLOQUE I;
- `devVentoGroup/vento-nexo`, rama `main`, incluyendo el inicio actual y sus secciones `operate`, `verify`, `configure` y `utilities`.

---

#### 4. `NEXO-UX-LANE-CONTRACT-001`

##### 4.1. Carriles canónicos

| Carril                 | Definición                                                                                                            | Puede contener                                                                        | No puede contener                                                               |
| ---------------------- | --------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- |
| `OPERACION`            | Trabajo activo sobre un caso, existencia, ubicación, documento o custodia concretos.                                  | captura, ejecución física, confirmación de etapa, consulta contextual de solo lectura | gobierno de políticas, edición de maestros, aprobación implícita de excepciones |
| `SUPERVISION`          | Control de colas, diferencias, excepciones, cumplimiento y decisiones que condicionan o corrigen la operación.        | seguimiento, investigación, autorización, priorización, cierre de control             | mutación silenciosa de hechos operativos, configuración reutilizable            |
| `CONFIGURACION`        | Gobierno de datos maestros, políticas, rutas, unidades, capacidades de sede, dispositivos y parámetros reutilizables. | creación, edición, activación, versionado y retiro controlado de configuración        | ejecución de un caso operativo concreto, cierre de una excepción operativa      |
| `TRANSVERSAL_TECNICA`  | Acceso, redirección, deep link o utilidad compartida que no constituye por sí misma un carril empresarial.            | autenticación, resolución de destino, escaneo contextual                              | autoridad funcional propia                                                      |
| `SEPARACION_EXPLICITA` | Condición temporal de una etapa o ruta que hoy reúne acciones pertenecientes a más de un carril.                      | lectura compartida y proyecciones diferenciadas por actor                             | una sola acción o pantalla con autoridad ambigua                                |

##### 4.2. Invariantes

1. El carril funcional no concede permisos; la autorización de servidor continúa siendo la autoridad ejecutable.
2. Una pantalla operativa puede consultar referencias maestras, pero no modificarlas desde el flujo ordinario.
3. Una pantalla supervisora puede investigar y decidir, pero no reescribir hechos ni saldos sin una transición explícita y auditable.
4. Una pantalla de configuración no forma parte del inicio predeterminado de solicitantes, preparadores, conductores o receptores.
5. Una misma entidad puede tener vistas de lectura en varios carriles, pero cada acción de mutación pertenece a uno solo.
6. Las rutas de redirección y deep links heredan el carril de la superficie destino.
7. `utilities` no constituye un cuarto carril empresarial; cada utilidad se invoca desde el contexto que la necesita.
8. Esta tarea no renombra rutas ni modifica el código actual.

##### 4.3. Tratamiento del inicio actual

| Sección actual | Decisión canónica                                                                                                                                              |
| -------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `operate`      | Se convierte en la fuente del carril `OPERACION` y se proyecta por actor en `NEXO-UX-003` a `NEXO-UX-006`.                                                     |
| `verify`       | Se divide entre `SUPERVISION` y referencias contextuales de solo lectura dentro de una tarea operativa. No mantiene acciones de control mezcladas con captura. |
| `configure`    | Se conserva exclusivamente como `CONFIGURACION`, fuera del inicio predeterminado de personal operativo.                                                        |
| `utilities`    | Se distribuye como herramienta contextual; escáner, impresión o búsqueda no obtienen autoridad funcional independiente.                                        |

---

#### 5. `NEXO-ASIS-STAGE-LANE-MATRIX-001`

##### 5.1. Reconciliación cuantitativa

| Métrica                              | Resultado |
| ------------------------------------ | --------: |
| Etapas esperadas desde `NEXO-UX-001` |    **40** |
| Etapas materializadas                |    **40** |
| Identificadores únicos               |    **40** |
| Faltantes                            |     **0** |
| Duplicados                           |     **0** |
| `OPERACION`                          |    **22** |
| `SUPERVISION`                        |     **9** |
| `CONFIGURACION`                      |     **4** |
| `SEPARACION_EXPLICITA`               |     **5** |

##### 5.2. Decisión por etapa

| Etapa            | Proceso      | Trabajo real                                                    | Carril                 | Estado         | Decisión materializada                                                                                                                                              | Tarea de salida |
| ---------------- | ------------ | --------------------------------------------------------------- | ---------------------- | -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------- |
| `VPROC-0023-E01` | `VPROC-0023` | Crear o editar LOC                                              | `CONFIGURACION`        | `ESPECIFICADO` | La identidad y los atributos reutilizables de una LOC pertenecen a configuración.                                                                                   | `NEXO-UX-015`   |
| `VPROC-0023-E02` | `VPROC-0023` | Crear zonas, niveles y posiciones                               | `CONFIGURACION`        | `ESPECIFICADO` | La estructura física reutilizable se mantiene fuera de la operación diaria.                                                                                         | `NEXO-UX-015`   |
| `VPROC-0023-E03` | `VPROC-0023` | Definir productos permitidos por ubicación                      | `CONFIGURACION`        | `ESPECIFICADO` | La regla de elegibilidad es una política reutilizable y versionable.                                                                                                | `NEXO-UX-015`   |
| `VPROC-0023-E04` | `VPROC-0023` | Consultar stock por sede, LOC o posición                        | `SUPERVISION`          | `ESPECIFICADO` | La consulta consolidada se usa para control, investigación y priorización; la consulta contextual de una tarea operativa permanece como referencia de solo lectura. | `NEXO-UX-007`   |
| `VPROC-0023-E05` | `VPROC-0023` | Abrir una ubicación mediante tablero, kiosco o código           | `OPERACION`            | `ESPECIFICADO` | La apertura contextual inicia trabajo sobre una ubicación concreta sin alterar su configuración.                                                                    | `NEXO-UX-004`   |
| `VPROC-0024-E01` | `VPROC-0024` | Registrar una entrada de emergencia                             | `OPERACION`            | `ESPECIFICADO` | Captura un hecho físico excepcional sobre un caso concreto.                                                                                                         | `NEXO-UX-014`   |
| `VPROC-0024-E02` | `VPROC-0024` | Registrar una entrada correlacionada con orden de compra        | `OPERACION`            | `ESPECIFICADO` | Materializa la recepción física vinculada a una referencia aprobada.                                                                                                | `NEXO-UX-014`   |
| `VPROC-0024-E03` | `VPROC-0024` | Capturar producto, cantidad, unidad y costo                     | `OPERACION`            | `ESPECIFICADO` | Registra datos del hecho recibido; no define unidades ni políticas maestras.                                                                                        | `NEXO-UX-014`   |
| `VPROC-0024-E04` | `VPROC-0024` | Asignar LOC de almacenamiento                                   | `OPERACION`            | `ESPECIFICADO` | Decide el destino físico de la existencia recibida dentro del caso.                                                                                                 | `NEXO-UX-015`   |
| `VPROC-0024-E05` | `VPROC-0024` | Asignar posición interna                                        | `OPERACION`            | `ESPECIFICADO` | Completa la ubicación física de la existencia sin modificar la estructura de posiciones.                                                                            | `NEXO-UX-015`   |
| `VPROC-0024-E06` | `VPROC-0024` | Publicar, corregir o reversar la entrada                        | `SEPARACION_EXPLICITA` | `BLOQUEADO`    | Publicar pertenece a operación; revisar y autorizar corrección o reversión pertenece a supervisión. Deben existir acciones y evidencia separadas.                   | `NEXO-UX-022`   |
| `VPROC-0025-E01` | `VPROC-0025` | Identificar sede, LOC, posición y producto                      | `OPERACION`            | `ESPECIFICADO` | Resuelve el contexto mínimo del movimiento que se ejecutará.                                                                                                        | `NEXO-UX-016`   |
| `VPROC-0025-E02` | `VPROC-0025` | Elegir presentación o unidad de medida                          | `OPERACION`            | `ESPECIFICADO` | Selecciona una opción ya configurada para una transacción concreta.                                                                                                 | `NEXO-UX-016`   |
| `VPROC-0025-E03` | `VPROC-0025` | Verificar disponibilidad y alcance                              | `OPERACION`            | `ESPECIFICADO` | La verificación contextual habilita o bloquea la acción sin convertirse en tablero supervisor.                                                                      | `NEXO-UX-016`   |
| `VPROC-0025-E04` | `VPROC-0025` | Consumir stock general                                          | `OPERACION`            | `ESPECIFICADO` | Ejecuta un retiro o consumo identificado.                                                                                                                           | `NEXO-UX-017`   |
| `VPROC-0025-E05` | `VPROC-0025` | Consumir desde posición o kiosco                                | `OPERACION`            | `ESPECIFICADO` | Ejecuta el retiro desde una ubicación física concreta.                                                                                                              | `NEXO-UX-017`   |
| `VPROC-0025-E06` | `VPROC-0025` | Transferir entre LOC conservando historial                      | `OPERACION`            | `ESPECIFICADO` | Ejecuta un movimiento correlacionado entre origen y destino.                                                                                                        | `NEXO-UX-016`   |
| `VPROC-0026-E01` | `VPROC-0026` | Abrir sesión de conteo                                          | `SUPERVISION`          | `ESPECIFICADO` | La apertura define un control formal, alcance y responsabilidad de verificación.                                                                                    | `NEXO-UX-018`   |
| `VPROC-0026-E02` | `VPROC-0026` | Congelar alcance y stock de apertura                            | `SUPERVISION`          | `ESPECIFICADO` | Establece la línea base controlada contra la que se compararán observaciones.                                                                                       | `NEXO-UX-018`   |
| `VPROC-0026-E03` | `VPROC-0026` | Registrar observación por producto                              | `OPERACION`            | `ESPECIFICADO` | El contador captura un hecho observado sin decidir el ajuste.                                                                                                       | `NEXO-UX-018`   |
| `VPROC-0026-E04` | `VPROC-0026` | Registrar múltiples presentaciones o posiciones                 | `OPERACION`            | `ESPECIFICADO` | Completa la observación física usando opciones ya configuradas.                                                                                                     | `NEXO-UX-018`   |
| `VPROC-0026-E05` | `VPROC-0026` | Calcular diferencia                                             | `SUPERVISION`          | `ESPECIFICADO` | La diferencia es información de control y no modifica por sí misma el saldo.                                                                                        | `NEXO-UX-018`   |
| `VPROC-0026-E06` | `VPROC-0026` | Aplicar reconciliación o ajuste autorizado                      | `SEPARACION_EXPLICITA` | `BLOQUEADO`    | La investigación y autorización pertenecen a supervisión; la publicación del movimiento autorizado pertenece a operación controlada.                                | `NEXO-UX-019`   |
| `VPROC-0026-E07` | `VPROC-0026` | Cerrar sesión y conservar historial                             | `SUPERVISION`          | `ESPECIFICADO` | El cierre confirma completitud del control y preserva evidencia.                                                                                                    | `NEXO-UX-018`   |
| `VPROC-0027-E01` | `VPROC-0027` | Detectar alerta, daño, pérdida, merma o vencimiento             | `SEPARACION_EXPLICITA` | `BLOQUEADO`    | La captura puede originarse en operación o automatización; la clasificación y prioridad del caso pertenecen a supervisión.                                          | `NEXO-UX-022`   |
| `VPROC-0027-E02` | `VPROC-0027` | Identificar producto, existencia, lote, LOC y condición         | `OPERACION`            | `ESPECIFICADO` | Materializa el objeto físico afectado y su contexto.                                                                                                                | `NEXO-UX-022`   |
| `VPROC-0027-E03` | `VPROC-0027` | Poner en cuarentena o bloquear                                  | `SEPARACION_EXPLICITA` | `BLOQUEADO`    | La ejecución física es operación; la autoridad para imponer o levantar el bloqueo pertenece a supervisión.                                                          | `NEXO-UX-022`   |
| `VPROC-0027-E04` | `VPROC-0027` | Evaluar condición, temperatura y aptitud                        | `SUPERVISION`          | `ESPECIFICADO` | Produce una evaluación de control sobre evidencia operativa.                                                                                                        | `NEXO-UX-022`   |
| `VPROC-0027-E05` | `VPROC-0027` | Decidir liberación, merma, pérdida, rechazo o disposición       | `SUPERVISION`          | `ESPECIFICADO` | Es una decisión de control con impacto sobre disponibilidad y destino.                                                                                              | `NEXO-UX-022`   |
| `VPROC-0027-E06` | `VPROC-0027` | Ejecutar movimiento físico y efecto de stock                    | `OPERACION`            | `ESPECIFICADO` | Materializa la decisión autorizada sin sustituirla.                                                                                                                 | `NEXO-UX-022`   |
| `VPROC-0027-E07` | `VPROC-0027` | Conservar evidencia y cerrar caso                               | `SUPERVISION`          | `ESPECIFICADO` | Confirma resolución y mantiene trazabilidad de la excepción.                                                                                                        | `NEXO-UX-022`   |
| `VPROC-0028-E01` | `VPROC-0028` | Crear solicitud interna                                         | `OPERACION`            | `ESPECIFICADO` | El solicitante crea un caso concreto de abastecimiento.                                                                                                             | `NEXO-UX-009`   |
| `VPROC-0028-E02` | `VPROC-0028` | Aplicar ruta, producto y política de solicitud                  | `CONFIGURACION`        | `ESPECIFICADO` | Las reglas reutilizables se gobiernan en configuración; la operación solo consume la resolución vigente.                                                            | `NEXO-UX-009`   |
| `VPROC-0028-E03` | `VPROC-0028` | Crear origen y fulfillment por línea                            | `SUPERVISION`          | `ESPECIFICADO` | La asignación determina responsabilidad de abastecimiento y tratamiento de faltantes por línea.                                                                     | `NEXO-UX-010`   |
| `VPROC-0028-E04` | `VPROC-0028` | Elegir LOC, posición y cantidad de picking                      | `OPERACION`            | `ESPECIFICADO` | El preparador ejecuta la selección física dentro de una asignación vigente.                                                                                         | `NEXO-UX-010`   |
| `VPROC-0028-E05` | `VPROC-0028` | Preparar, dejar listo o registrar faltante                      | `OPERACION`            | `ESPECIFICADO` | Materializa cantidades preparadas y faltantes del caso.                                                                                                             | `NEXO-UX-010`   |
| `VPROC-0028-E06` | `VPROC-0028` | Cargar, sellar y despachar                                      | `OPERACION`            | `ESPECIFICADO` | Transfiere custodia física al transporte.                                                                                                                           | `NEXO-UX-011`   |
| `VPROC-0028-E07` | `VPROC-0028` | Transportar y confirmar tránsito                                | `OPERACION`            | `ESPECIFICADO` | Mantiene custodia y evidencia durante el traslado.                                                                                                                  | `NEXO-UX-012`   |
| `VPROC-0028-E08` | `VPROC-0028` | Recibir parcial o totalmente                                    | `OPERACION`            | `ESPECIFICADO` | El receptor confirma cantidades y condición efectivamente recibidas.                                                                                                | `NEXO-UX-013`   |
| `VPROC-0028-E09` | `VPROC-0028` | Resolver faltante, sobrante, daño, rechazo, devolución o cierre | `SEPARACION_EXPLICITA` | `BLOQUEADO`    | La captura de la diferencia pertenece a operación; la decisión de resolución y cierre pertenece a supervisión.                                                      | `NEXO-UX-022`   |

---

#### 6. `NEXO-ROUTE-LANE-DISPOSITION-001`

##### 6.1. Reconciliación cuantitativa

| Métrica                             | Resultado |
| ----------------------------------- | --------: |
| Rutas esperadas desde `AUTH-UI-001` |    **64** |
| Rutas materializadas                |    **64** |
| Identificadores únicos              |    **64** |
| Faltantes                           |     **0** |
| Duplicados                          |     **0** |
| `OPERACION`                         |    **14** |
| `SUPERVISION`                       |    **14** |
| `CONFIGURACION`                     |    **25** |
| `SEPARACION_EXPLICITA`              |     **5** |
| `TRANSVERSAL_TECNICA`               |     **6** |

##### 6.2. Decisión por ruta

| Ruta             | Patrón actual                                | Carril                 | Disposición                    | Estado         | Decisión materializada                                                                                                      | Tarea de salida                         |
| ---------------- | -------------------------------------------- | ---------------------- | ------------------------------ | -------------- | --------------------------------------------------------------------------------------------------------------------------- | --------------------------------------- |
| `NEXO-ROUTE-001` | `/`                                          | `SUPERVISION`          | `SEPARAR_PROYECCION`           | `ESPECIFICADO` | El inicio actual funciona como tablero agregado; deberá ofrecer accesos por carril sin mezclar decisiones ni configuración. | `NEXO-UX-003; NEXO-UX-007; NEXO-UX-008` |
| `NEXO-ROUTE-002` | `/inventory/adjust`                          | `SUPERVISION`          | `MANTENER_EN_SUPERVISION`      | `ESPECIFICADO` | La superficie decide correcciones de saldo; la publicación autorizada deberá permanecer segregada.                          | `NEXO-UX-019`                           |
| `NEXO-ROUTE-003` | `/inventory/assets`                          | `SUPERVISION`          | `MANTENER_EN_SUPERVISION`      | `ESPECIFICADO` | Consulta consolidada de activos; el subdominio se diseña en su bloque reservado.                                            | `NEXO-UX-030`                           |
| `NEXO-ROUTE-004` | `/inventory/assets/counts`                   | `SUPERVISION`          | `MANTENER_EN_SUPERVISION`      | `ESPECIFICADO` | Administra sesiones de conteo de activos.                                                                                   | `NEXO-UX-034`                           |
| `NEXO-ROUTE-005` | `/inventory/assets/counts/[id]`              | `SEPARACION_EXPLICITA` | `DIVIDIR_CAPTURA_Y_CIERRE`     | `BLOQUEADO`    | La captura de observaciones y la decisión de cierre no deben compartir autoridad implícita.                                 | `NEXO-UX-034`                           |
| `NEXO-ROUTE-006` | `/inventory/assets/groups/[id]`              | `SUPERVISION`          | `MANTENER_EN_SUPERVISION`      | `ESPECIFICADO` | Consulta condición, completitud y custodia del conjunto.                                                                    | `NEXO-UX-033`                           |
| `NEXO-ROUTE-007` | `/inventory/assets/items/[id]`               | `SUPERVISION`          | `MANTENER_EN_SUPERVISION`      | `ESPECIFICADO` | Consulta historial, condición y custodia del activo individual.                                                             | `NEXO-UX-031; NEXO-UX-032`              |
| `NEXO-ROUTE-008` | `/inventory/assets/new`                      | `CONFIGURACION`        | `MANTENER_EN_CONFIGURACION`    | `ESPECIFICADO` | Crea identidad reutilizable de activo.                                                                                      | `NEXO-UX-030`                           |
| `NEXO-ROUTE-009` | `/inventory/assets/quick`                    | `OPERACION`            | `MANTENER_EN_OPERACION`        | `ESPECIFICADO` | Captura rápida de un activo o grupo durante trabajo de campo.                                                               | `NEXO-UX-039`                           |
| `NEXO-ROUTE-010` | `/inventory/catalog`                         | `CONFIGURACION`        | `MANTENER_EN_CONFIGURACION`    | `ESPECIFICADO` | Gobierna maestro de productos logísticos.                                                                                   | `NEXO-UX-008`                           |
| `NEXO-ROUTE-011` | `/inventory/catalog/[id]`                    | `CONFIGURACION`        | `MANTENER_EN_CONFIGURACION`    | `ESPECIFICADO` | Edita atributos reutilizables del producto.                                                                                 | `NEXO-UX-008`                           |
| `NEXO-ROUTE-012` | `/inventory/catalog/[id]/ficha`              | `CONFIGURACION`        | `MANTENER_EN_CONFIGURACION`    | `ESPECIFICADO` | Mantiene ficha canónica de referencia.                                                                                      | `NEXO-UX-008`                           |
| `NEXO-ROUTE-013` | `/inventory/catalog/[id]/presentations`      | `CONFIGURACION`        | `MANTENER_EN_CONFIGURACION`    | `ESPECIFICADO` | Mantiene presentaciones y conversiones reutilizables.                                                                       | `NEXO-UX-008`                           |
| `NEXO-ROUTE-014` | `/inventory/catalog/new`                     | `CONFIGURACION`        | `MANTENER_EN_CONFIGURACION`    | `ESPECIFICADO` | Crea una identidad maestra de producto.                                                                                     | `NEXO-UX-008`                           |
| `NEXO-ROUTE-015` | `/inventory/catalog/presentations`           | `CONFIGURACION`        | `MANTENER_EN_CONFIGURACION`    | `ESPECIFICADO` | Administra presentaciones del catálogo.                                                                                     | `NEXO-UX-008`                           |
| `NEXO-ROUTE-016` | `/inventory/cost-center`                     | `CONFIGURACION`        | `MANTENER_EN_CONFIGURACION`    | `ESPECIFICADO` | Mantiene referencias de centro de costo; no ejecuta movimiento físico.                                                      | `NEXO-UX-008`                           |
| `NEXO-ROUTE-017` | `/inventory/count-initial`                   | `SUPERVISION`          | `MANTENER_EN_SUPERVISION`      | `ESPECIFICADO` | Abre y administra sesiones formales de conteo.                                                                              | `NEXO-UX-018`                           |
| `NEXO-ROUTE-018` | `/inventory/count-initial/session/[id]`      | `SEPARACION_EXPLICITA` | `DIVIDIR_CAPTURA_Y_DECISION`   | `BLOQUEADO`    | La captura operativa, el cálculo de diferencia y el cierre supervisor requieren affordances diferenciadas.                  | `NEXO-UX-018; NEXO-UX-019`              |
| `NEXO-ROUTE-019` | `/inventory/entries`                         | `OPERACION`            | `MANTENER_EN_OPERACION`        | `ESPECIFICADO` | Registra entradas físicas y excepcionales.                                                                                  | `NEXO-UX-014`                           |
| `NEXO-ROUTE-020` | `/inventory/locations`                       | `SUPERVISION`          | `MANTENER_EN_SUPERVISION`      | `ESPECIFICADO` | Consulta estructura y estado de ubicaciones; la edición debe remitirse a configuración.                                     | `NEXO-UX-015`                           |
| `NEXO-ROUTE-021` | `/inventory/locations/[id]`                  | `SUPERVISION`          | `MANTENER_EN_SUPERVISION`      | `ESPECIFICADO` | Consulta detalle y stock de una ubicación.                                                                                  | `NEXO-UX-015`                           |
| `NEXO-ROUTE-022` | `/inventory/locations/[id]/board`            | `OPERACION`            | `MANTENER_EN_OPERACION`        | `ESPECIFICADO` | Tablero contextual para ejecutar trabajo sobre una LOC.                                                                     | `NEXO-UX-015; NEXO-UX-017`              |
| `NEXO-ROUTE-023` | `/inventory/locations/[id]/kiosk-withdraw`   | `OPERACION`            | `MANTENER_EN_OPERACION`        | `ESPECIFICADO` | Retiro operativo desde kiosco.                                                                                              | `NEXO-UX-017`                           |
| `NEXO-ROUTE-024` | `/inventory/locations/[id]/positions`        | `CONFIGURACION`        | `MANTENER_EN_CONFIGURACION`    | `ESPECIFICADO` | Mantiene posiciones internas de una LOC.                                                                                    | `NEXO-UX-015`                           |
| `NEXO-ROUTE-025` | `/inventory/locations/open`                  | `OPERACION`            | `MANTENER_EN_OPERACION`        | `ESPECIFICADO` | Resuelve una ubicación para iniciar trabajo contextual.                                                                     | `NEXO-UX-015`                           |
| `NEXO-ROUTE-026` | `/inventory/locations/zone`                  | `OPERACION`            | `MANTENER_EN_OPERACION`        | `ESPECIFICADO` | Opera una zona filtrada de almacenamiento.                                                                                  | `NEXO-UX-015`                           |
| `NEXO-ROUTE-027` | `/inventory/locations/zones`                 | `CONFIGURACION`        | `MANTENER_EN_CONFIGURACION`    | `ESPECIFICADO` | Mantiene zonas reutilizables.                                                                                               | `NEXO-UX-015`                           |
| `NEXO-ROUTE-028` | `/inventory/lpns`                            | `SUPERVISION`          | `MANTENER_EN_SUPERVISION`      | `ESPECIFICADO` | Consulta estado e identidad de LPN; su ciclo de vida se diseña en tareas reservadas.                                        | `NEXO-UX-026; NEXO-UX-029`              |
| `NEXO-ROUTE-029` | `/inventory/movements`                       | `SUPERVISION`          | `MANTENER_EN_SUPERVISION`      | `ESPECIFICADO` | Consulta ledger e historial para investigación.                                                                             | `NEXO-UX-016`                           |
| `NEXO-ROUTE-030` | `/inventory/production-batches`              | `SUPERVISION`          | `MANTENER_EN_SUPERVISION`      | `ESPECIFICADO` | Consume evidencia de lotes producidos sin asumir propiedad de FOGO.                                                         | `NEXO-UX-007`                           |
| `NEXO-ROUTE-031` | `/inventory/remissions`                      | `SEPARACION_EXPLICITA` | `DIVIDIR_BANDEJA_POR_ACTOR`    | `BLOQUEADO`    | La bandeja actual mezcla creación, seguimiento, preparación y control; deberá proyectarse por actor y carril.               | `NEXO-UX-003; NEXO-UX-004; NEXO-UX-007` |
| `NEXO-ROUTE-032` | `/inventory/remissions/[id]`                 | `SEPARACION_EXPLICITA` | `DIVIDIR_ACCIONES_POR_ETAPA`   | `BLOQUEADO`    | El detalle puede ser compartido como lectura, pero las acciones deben separarse por etapa, actor y autoridad.               | `NEXO-UX-009; NEXO-UX-013; NEXO-UX-022` |
| `NEXO-ROUTE-033` | `/inventory/remissions/[id]/edit`            | `OPERACION`            | `MANTENER_EN_OPERACION`        | `ESPECIFICADO` | Edita una solicitud todavía operable sin alterar políticas maestras.                                                        | `NEXO-UX-009`                           |
| `NEXO-ROUTE-034` | `/inventory/remissions/conductor`            | `OPERACION`            | `MANTENER_EN_OPERACION`        | `ESPECIFICADO` | Concentra custodia y acciones del conductor.                                                                                | `NEXO-UX-005; NEXO-UX-012`              |
| `NEXO-ROUTE-035` | `/inventory/remissions/fulfillment`          | `OPERACION`            | `MANTENER_EN_OPERACION`        | `ESPECIFICADO` | Ejecuta asignación y disponibilidad por línea.                                                                              | `NEXO-UX-010`                           |
| `NEXO-ROUTE-036` | `/inventory/remissions/prepare`              | `OPERACION`            | `MANTENER_EN_OPERACION`        | `ESPECIFICADO` | Ejecuta picking y preparación.                                                                                              | `NEXO-UX-010`                           |
| `NEXO-ROUTE-037` | `/inventory/remissions/receive`              | `OPERACION`            | `MANTENER_EN_OPERACION`        | `ESPECIFICADO` | Captura recepción y cantidades recibidas.                                                                                   | `NEXO-UX-006; NEXO-UX-013`              |
| `NEXO-ROUTE-038` | `/inventory/remissions/transit`              | `SEPARACION_EXPLICITA` | `DIVIDIR_CUSTODIA_Y_MONITOREO` | `BLOQUEADO`    | La confirmación de custodia pertenece a operación; el monitoreo de retrasos y excepciones pertenece a supervisión.          | `NEXO-UX-005; NEXO-UX-007; NEXO-UX-012` |
| `NEXO-ROUTE-039` | `/inventory/settings`                        | `CONFIGURACION`        | `MANTENER_EN_CONFIGURACION`    | `ESPECIFICADO` | Hub exclusivo de configuración.                                                                                             | `NEXO-UX-008`                           |
| `NEXO-ROUTE-040` | `/inventory/settings/categories`             | `CONFIGURACION`        | `MANTENER_EN_CONFIGURACION`    | `ESPECIFICADO` | Mantiene categorías operativas.                                                                                             | `NEXO-UX-008`                           |
| `NEXO-ROUTE-041` | `/inventory/settings/fulfillment-routes`     | `CONFIGURACION`        | `MANTENER_EN_CONFIGURACION`    | `ESPECIFICADO` | Mantiene reglas reutilizables de fulfillment.                                                                               | `NEXO-UX-008`                           |
| `NEXO-ROUTE-042` | `/inventory/settings/internal-prices`        | `CONFIGURACION`        | `MANTENER_EN_CONFIGURACION`    | `ESPECIFICADO` | Mantiene listas y referencias de precio interno.                                                                            | `NEXO-UX-008`                           |
| `NEXO-ROUTE-043` | `/inventory/settings/locations/[id]/catalog` | `CONFIGURACION`        | `MANTENER_EN_CONFIGURACION`    | `ESPECIFICADO` | Mantiene elegibilidad de productos por ubicación.                                                                           | `NEXO-UX-015`                           |
| `NEXO-ROUTE-044` | `/inventory/settings/products`               | `CONFIGURACION`        | `MANTENER_EN_CONFIGURACION`    | `ESPECIFICADO` | Mantiene configuración logística por producto.                                                                              | `NEXO-UX-008`                           |
| `NEXO-ROUTE-045` | `/inventory/settings/remissions`             | `CONFIGURACION`        | `MANTENER_EN_CONFIGURACION`    | `ESPECIFICADO` | Mantiene parámetros generales de remisiones.                                                                                | `NEXO-UX-008`                           |
| `NEXO-ROUTE-046` | `/inventory/settings/remissions/products`    | `CONFIGURACION`        | `MANTENER_EN_CONFIGURACION`    | `ESPECIFICADO` | Mantiene elegibilidad y comportamiento de productos en remisiones.                                                          | `NEXO-UX-008`                           |
| `NEXO-ROUTE-047` | `/inventory/settings/request-policies`       | `CONFIGURACION`        | `MANTENER_EN_CONFIGURACION`    | `ESPECIFICADO` | Mantiene restricciones, mínimos y pasos de solicitud.                                                                       | `NEXO-UX-008`                           |
| `NEXO-ROUTE-048` | `/inventory/settings/sites`                  | `CONFIGURACION`        | `MANTENER_EN_CONFIGURACION`    | `ESPECIFICADO` | Mantiene parámetros logísticos por sede.                                                                                    | `NEXO-UX-008`                           |
| `NEXO-ROUTE-049` | `/inventory/settings/sites/[id]/operations`  | `CONFIGURACION`        | `MANTENER_EN_CONFIGURACION`    | `ESPECIFICADO` | Mantiene capacidades operativas configurables de una sede.                                                                  | `NEXO-UX-008`                           |
| `NEXO-ROUTE-050` | `/inventory/settings/supply-routes`          | `CONFIGURACION`        | `MANTENER_EN_CONFIGURACION`    | `ESPECIFICADO` | Mantiene rutas de abastecimiento reutilizables.                                                                             | `NEXO-UX-008`                           |
| `NEXO-ROUTE-051` | `/inventory/settings/units`                  | `CONFIGURACION`        | `MANTENER_EN_CONFIGURACION`    | `ESPECIFICADO` | Mantiene unidades y conversiones maestras.                                                                                  | `NEXO-UX-008`                           |
| `NEXO-ROUTE-052` | `/inventory/stock`                           | `SUPERVISION`          | `MANTENER_EN_SUPERVISION`      | `ESPECIFICADO` | Consulta consolidada de existencias y diferencias.                                                                          | `NEXO-UX-007`                           |
| `NEXO-ROUTE-053` | `/inventory/stock/assign-location`           | `OPERACION`            | `MANTENER_EN_OPERACION`        | `ESPECIFICADO` | Asigna físicamente stock existente a una ubicación.                                                                         | `NEXO-UX-015`                           |
| `NEXO-ROUTE-054` | `/inventory/transfers`                       | `OPERACION`            | `MANTENER_EN_OPERACION`        | `ESPECIFICADO` | Ejecuta traslados entre LOC.                                                                                                | `NEXO-UX-016`                           |
| `NEXO-ROUTE-055` | `/inventory/warehouse`                       | `TRANSVERSAL_TECNICA`  | `HEREDAR_DESTINO`              | `ESPECIFICADO` | Alias técnico; hereda el carril de la ruta objetivo y no constituye superficie autónoma.                                    | `NEXO-UX-008`                           |
| `NEXO-ROUTE-056` | `/inventory/withdraw`                        | `OPERACION`            | `MANTENER_EN_OPERACION`        | `ESPECIFICADO` | Ejecuta retiro o consumo de inventario.                                                                                     | `NEXO-UX-017`                           |
| `NEXO-ROUTE-057` | `/kiosk/[slug]`                              | `TRANSVERSAL_TECNICA`  | `HEREDAR_DESTINO`              | `ESPECIFICADO` | Entrada por slug que resuelve una superficie operativa contextual.                                                          | `NEXO-UX-008`                           |
| `NEXO-ROUTE-058` | `/l/[code]`                                  | `TRANSVERSAL_TECNICA`  | `HEREDAR_DESTINO`              | `ESPECIFICADO` | Deep link de LOC; hereda el carril operativo del destino.                                                                   | `NEXO-UX-008`                           |
| `NEXO-ROUTE-059` | `/login`                                     | `TRANSVERSAL_TECNICA`  | `MANTENER_TRANSVERSAL`         | `ESPECIFICADO` | Acceso técnico; no pertenece a un carril empresarial.                                                                       | `NEXO-UX-008`                           |
| `NEXO-ROUTE-060` | `/no-access`                                 | `TRANSVERSAL_TECNICA`  | `MANTENER_TRANSVERSAL`         | `ESPECIFICADO` | Resultado técnico de autorización; no es una superficie empresarial.                                                        | `NEXO-UX-008`                           |
| `NEXO-ROUTE-061` | `/printing/designer`                         | `CONFIGURACION`        | `MANTENER_EN_CONFIGURACION`    | `ESPECIFICADO` | Mantiene diseños reutilizables de impresión.                                                                                | `NEXO-UX-037`                           |
| `NEXO-ROUTE-062` | `/printing/jobs`                             | `SUPERVISION`          | `MANTENER_EN_SUPERVISION`      | `ESPECIFICADO` | Monitorea trabajos, errores y reintentos de impresión.                                                                      | `NEXO-UX-037`                           |
| `NEXO-ROUTE-063` | `/printing/setup`                            | `CONFIGURACION`        | `MANTENER_EN_CONFIGURACION`    | `ESPECIFICADO` | Mantiene dispositivos y parámetros reutilizables de impresión.                                                              | `NEXO-UX-037`                           |
| `NEXO-ROUTE-064` | `/scanner`                                   | `TRANSVERSAL_TECNICA`  | `HEREDAR_DESTINO`              | `ESPECIFICADO` | Utilidad técnica que hereda el carril de la tarea que invoca el escaneo.                                                    | `NEXO-UX-020`                           |

---

#### 7. Reglas de composición de superficies

##### 7.1. Operación

Una superficie operativa deberá presentar, en este orden:

1. el caso o recurso sobre el que se trabaja;
2. la siguiente acción permitida;
3. la cantidad, unidad, origen, destino, custodia o condición relevante;
4. referencias de solo lectura necesarias para decidir;
5. confirmación y evidencia del hecho ejecutado;
6. salida clara hacia la siguiente etapa o hacia una excepción.

No mostrará editores de políticas, rutas, unidades, sedes, catálogos o dispositivos.

##### 7.2. Supervisión

Una superficie supervisora deberá presentar:

1. alcance y filtro explícitos;
2. cola, diferencia, excepción o riesgo;
3. evidencia del hecho original;
4. decisión permitida y autoridad requerida;
5. responsable y vencimiento cuando aplique;
6. resultado de la decisión sin sobrescribir el hecho original.

##### 7.3. Configuración

Una superficie de configuración deberá presentar:

1. identidad del objeto reutilizable;
2. alcance por empresa, sede, área, producto o dispositivo;
3. vigencia y estado;
4. dependencias y consumidores;
5. validación previa a publicar;
6. historial o evidencia de cambio cuando el contrato lo exija.

---

#### 8. Puntos obligatorios de separación explícita

| Punto                         | Captura o ejecución operativa                            | Decisión supervisora                                      | Condición de salida                                                       |
| ----------------------------- | -------------------------------------------------------- | --------------------------------------------------------- | ------------------------------------------------------------------------- |
| Entrada corregida o reversada | Registrar el hecho original y la solicitud de corrección | Autorizar, rechazar o definir reversión                   | `NEXO-UX-022` materializa acciones y evidencia separadas                  |
| Conteo con diferencia         | Registrar observaciones físicas                          | Investigar, aprobar diferencia y ordenar ajuste           | `NEXO-UX-018` y `NEXO-UX-019` separan observación, decisión y publicación |
| Alerta de condición           | Identificar existencia y capturar evidencia              | Clasificar, priorizar y decidir tratamiento               | `NEXO-UX-022` define caso y excepción                                     |
| Cuarentena o bloqueo          | Ejecutar inmovilización física                           | Imponer, mantener o levantar la condición                 | `NEXO-UX-022` define autoridad y transición                               |
| Remisión con diferencia       | Capturar faltante, sobrante, daño, rechazo o devolución  | Resolver responsabilidad, reposición, aceptación o cierre | `NEXO-UX-022` diseña manejo de diferencias                                |
| Tránsito                      | Confirmar entrega y custodia                             | Monitorear retraso, pérdida o ruptura de custodia         | `NEXO-UX-005`, `NEXO-UX-007` y `NEXO-UX-012` separan las proyecciones     |

---

#### 9. `NEXO-LANE-NAVIGATION-HANDOFF-001`

| Tarea consumidora             | Handoff aprobado                                                                                                                                           |
| ----------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `NEXO-UX-003`                 | Diseñar inicio del solicitante usando solo creación y seguimiento operativo de sus propias solicitudes.                                                    |
| `NEXO-UX-004`                 | Diseñar inicio del bodeguero con colas operativas, referencias de stock de solo lectura y acceso separado a controles supervisores cuando tenga autoridad. |
| `NEXO-UX-005`                 | Diseñar inicio del conductor sobre custodia, carga, tránsito y entrega, sin configuración ni control global.                                               |
| `NEXO-UX-006`                 | Diseñar inicio del receptor sobre recepción, diferencias capturables y evidencia del caso.                                                                 |
| `NEXO-UX-007`                 | Diseñar inicio del supervisor con colas, diferencias, cumplimiento, autorizaciones y cierres de control.                                                   |
| `NEXO-UX-008`                 | Organizar navegación por tareas y carriles, no por la estructura técnica de rutas.                                                                         |
| `NEXO-UX-009` a `NEXO-UX-019` | Aplicar el carril y las separaciones definidas a cada flujo de inventario y remisiones.                                                                    |
| `NEXO-UX-020`                 | Mantener escáner y captura como utilidades contextuales del carril invocante.                                                                              |
| `NEXO-UX-022`                 | Materializar excepciones sin mezclar captura operativa con decisión supervisora.                                                                           |
| `NEXO-UX-026` a `NEXO-UX-040` | Conservar la clasificación de rutas de LPN y activos sin anticipar el diseño detallado del subdominio.                                                     |
| `NEXO-UX-037` a `NEXO-UX-038` | Separar diseño de impresión, monitoreo de trabajos y uso contextual del escáner.                                                                           |

---

#### 10. Decisiones fuera de alcance

Esta tarea no:

- cambia permisos ni matrices RBAC;
- crea nuevas rutas o elimina rutas actuales;
- modifica el inicio implementado en `vento-nexo`;
- cambia estados, transiciones o cantidades de remisiones;
- cambia tablas, RPC, RLS, funciones, triggers o datos;
- implementa filtros por rol o dispositivo;
- decide el diseño visual detallado de los inicios por actor;
- aprueba como validado ningún flujo operativo.

---

#### 11. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA.

**Justificación:** la tarea reconcilia y compone clasificaciones funcionales ya aprobadas para procesos, etapas y vistas. No introduce una regla ejecutable nueva de autorización, transición, cálculo, persistencia, API, mutación, integración o comportamiento en runtime. Los diseños posteriores deberán crear o modificar requisitos únicamente cuando materialicen comportamiento verificable adicional.

---

#### 12. Criterios de aceptación

- [ ] Las 40 etapas de `NEXO-UX-001` están materializadas una sola vez.
- [ ] Las 64 rutas de `AUTH-UI-001` están materializadas una sola vez.
- [ ] No existen etapas ni rutas faltantes o duplicadas.
- [ ] Cada etapa tiene un carril, estado, decisión y tarea de salida.
- [ ] Cada ruta tiene carril, disposición, estado y tarea de salida.
- [ ] Operación, supervisión y configuración tienen fronteras normativas distintas.
- [ ] Las superficies mezcladas están identificadas como `SEPARACION_EXPLICITA`.
- [ ] La clasificación no se presenta como permiso ni como implementación.
- [ ] Configuración queda fuera del inicio predeterminado de actores operativos.
- [ ] Referencias supervisoras dentro de una tarea operativa son de solo lectura.
- [ ] Los redirects y utilidades heredan el carril de su destino o contexto.
- [ ] No se modificaron código, Supabase, permisos, rutas ni despliegues.
- [ ] La tarea declara cero cambios `TREQ-*` con justificación concreta.
- [ ] `NEXO-UX-003` permanece reservada y no iniciada.

---

#### 13. Continuidad

**ÚLTIMA TAREA APROBADA**
`NEXO-UX-001 — Inventariar procesos reales de inventario y logística`

**TAREA ACTUAL APROBADA**
`NEXO-UX-002 — Separar operación, supervisión y configuración`

**SIGUIENTE TAREA RESERVADA**
`NEXO-UX-003 — Diseñar inicio para solicitante`


### ✅ NEXO-UX-003 — Diseñar inicio para solicitante

**Estado:** APROBADA
**Tarea anterior:** `NEXO-UX-002 — Separar operación, supervisión y configuración` — APROBADA
**Tarea siguiente:** `NEXO-UX-004 — Diseñar inicio para bodeguero` — RESERVADA
**Tipo de tarea:** documental; diseño funcional completo de la proyección de inicio para el solicitante, arquitectura de información, priorización, estados, autorización, decisiones por iniciador, etapa y ruta, y handoff de implementación
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/K_NEXO/04_EXPERIENCIA_DE_INVENTARIO_LOGISTICA_Y_ACTIVOS.md`
**Repositorio de aplicación inspeccionado:** `vento-nexo`
**Artefactos producidos:** `NEXO-REQUESTER-HOME-CONTRACT-001`, `NEXO-REQUESTER-HOME-INFORMATION-ARCHITECTURE-001`, `NEXO-REQUESTER-INITIATOR-DECISION-MATRIX-001`, `NEXO-REQUESTER-STAGE-PROJECTION-MATRIX-001`, `NEXO-REQUESTER-ROUTE-DISPOSITION-001`, `NEXO-REQUESTER-HOME-STATE-CONTRACT-001` y `NEXO-REQUESTER-HOME-HANDOFF-001`
**Decisiones consumidas:** `NEXO-UX-LANE-CONTRACT-001`; `NEXO-ASIS-STAGE-LANE-MATRIX-001`; `NEXO-ROUTE-LANE-DISPOSITION-001`; `NEXO-LANE-NAVIGATION-HANDOFF-001`; `VPROC-0028`; actores, iniciadores y continuadores aprobados para abastecimiento interno; inventario canónico `NEXO-ROUTE-001` a `NEXO-ROUTE-064`; requisitos `TREQ-*` vigentes; código actual de `vento-nexo`
**Cambios físicos autorizados:** ninguno; no modifica código, rutas, permisos, datos, remisiones, stock, movimientos, Supabase, migraciones, RLS, configuración ni despliegues

---

#### 1. Propósito

Diseñar de forma completa la proyección de inicio de NEXO para el actor que
solicita abastecimiento interno, de modo que pueda:

- iniciar una solicitud autorizada;
- identificar qué solicitudes propias requieren una acción suya;
- seguir el avance de sus solicitudes sin asumir funciones de bodega,
  transporte, recepción, supervisión o configuración;
- comprender el siguiente paso, el responsable actual y cualquier bloqueo;
- acceder únicamente a las superficies compatibles con su participación,
  contexto y autorización vigentes.

La regla canónica de esta tarea es:

```text
ACTOR SOLICITANTE RESUELTO
+
AUTORIZACIÓN Y TERRITORIO VIGENTES
+
SOLICITUDES PROPIAS O PARTICIPADAS COMO SOLICITANTE
+
ESTADO Y ETAPA CANÓNICOS DE VPROC-0028
+
PRÓXIMA ACCIÓN ATRIBUIDA
→
INICIO OPERATIVO DEL SOLICITANTE
```

La proyección visual no concede autoridad. Una etiqueta de rol, una ruta
visible, una tarjeta, un conteo o la condición de creador no autorizan por sí
solos lectura, edición, aprobación, preparación, traslado, recepción, cierre ni
resolución de diferencias.

---

#### 2. Resultado material

Se aprueban siete artefactos documentales consumibles:

1. `NEXO-REQUESTER-HOME-CONTRACT-001`, que define audiencia, propósito,
   límites, autoridad, alcance territorial y reglas de composición del inicio;
2. `NEXO-REQUESTER-HOME-INFORMATION-ARCHITECTURE-001`, que materializa la
   jerarquía, secciones, contenido mínimo, acciones y orden de lectura;
3. `NEXO-REQUESTER-INITIATOR-DECISION-MATRIX-001`, que resuelve explícitamente
   las cinco identidades de iniciación aprobadas para `VPROC-0028`;
4. `NEXO-REQUESTER-STAGE-PROJECTION-MATRIX-001`, que decide la proyección del
   solicitante para las nueve etapas canónicas del proceso;
5. `NEXO-REQUESTER-ROUTE-DISPOSITION-001`, que decide las catorce rutas
   relacionadas con el inicio y el abastecimiento interno sin inventar URLs;
6. `NEXO-REQUESTER-HOME-STATE-CONTRACT-001`, que define estados de carga,
   vacío, datos parciales, autorización y fallos;
7. `NEXO-REQUESTER-HOME-HANDOFF-001`, que separa lo especificado de lo todavía
   no implementado y asigna cada continuación a una tarea exacta.

Cobertura materializada:

| Elemento                                                 | Total esperado | Total materializado | Faltantes | Duplicados |
| -------------------------------------------------------- | -------------: | ------------------: | --------: | ---------: |
| Identidades de iniciación de `VPROC-0028`                |              5 |                   5 |         0 |          0 |
| Etapas canónicas de `VPROC-0028`                         |              9 |                   9 |         0 |          0 |
| Rutas relevantes para inicio y abastecimiento interno    |             14 |                  14 |         0 |          0 |
| Estados de interfaz definidos                            |              8 |                   8 |         0 |          0 |
| Secciones obligatorias de la arquitectura de información |              7 |                   7 |         0 |          0 |
| Acciones primarias del solicitante                       |              1 |                   1 |         0 |          0 |
| Carriles autorizados dentro de esta proyección           |              1 |                   1 |         0 |          0 |
| Requisitos de prueba nuevos o modificados                |              6 |                   6 |         0 |          0 |

Esta tarea diseña una proyección documental `ESPECIFICADA`. No declara la
superficie `IMPLEMENTADA`, `VALIDADA` ni disponible en producción.

---

#### 3. Alcance funcional

##### 3.1. Incluido

La tarea incluye:

- inicio de NEXO proyectado para el actor solicitante;
- creación autorizada de una solicitud propia;
- seguimiento de solicitudes propias;
- identificación de solicitudes que requieren información o acción del
  solicitante;
- resumen de avance, etapa, responsable actual y siguiente paso;
- visibilidad de novedades relacionadas con la solicitud propia;
- acceso al detalle y edición solo cuando la etapa y autorización lo permitan;
- estados vacíos, fallos, revocación, datos parciales y recuperación;
- reglas responsive y de accesibilidad del inicio;
- decisión explícita por iniciador, etapa y ruta relevante;
- separación entre diseño objetivo y soporte físico actual.

##### 3.2. Excluido

No pertenece a esta tarea:

- inicio del bodeguero, conductor, receptor o supervisor;
- preparación, picking, reserva, fulfillment o despacho;
- custodia, transporte o confirmación de entrega;
- recepción física, conteo recibido o aceptación de diferencias;
- aprobación, autorización, conciliación o cierre de control;
- modificación de políticas, productos, rutas de abastecimiento o parámetros;
- administración de catálogos;
- diseño detallado del formulario completo de solicitud;
- diseño detallado del flujo de preparación, tránsito o recepción;
- implementación de rutas o componentes;
- definición de permisos nuevos;
- cambios de datos o Supabase;
- validación operativa con usuarios o dispositivos.

El solicitante puede observar el avance de esas etapas cuando participe en la
solicitud, pero no recibe sus acciones operativas por esta proyección.

---

#### 4. `NEXO-REQUESTER-HOME-CONTRACT-001`

##### 4.1. Audiencia canónica

La audiencia primaria es `AREA_SOLICITANTE` dentro de `VPROC-0028`.

Las identidades alternativas de iniciación aprobadas no crean homes distintos.
Cuando una persona autorizada inicia una solicitud en nombre de una unidad
operativa, consume la misma proyección de solicitante exclusivamente para esa
participación. Si también posee capacidades de bodega, conducción, recepción o
supervisión, esas capacidades se presentan en proyecciones separadas.

```text
MISMA PERSONA
≠
MISMA FUNCIÓN EN TODA LA INTERFAZ
```

##### 4.2. Carril único

La proyección pertenece únicamente al carril `OPERACION` y limita su operación
a crear y seguir solicitudes propias.

No se incorporan dentro de esta proyección:

- controles de `SUPERVISION`;
- edición de `CONFIGURACION`;
- herramientas técnicas transversales;
- indicadores globales de desempeño;
- colas de otros actores;
- accesos implícitos derivados de jerarquía.

##### 4.3. Alcance de datos

El inicio solo puede materializar información cuya autorización resuelva una de
estas relaciones:

```text
SOLICITUD_CREADA_POR_ACTOR_SOLICITANTE
SOLICITUD_INICIADA_EN_NOMBRE_DE_UNIDAD_AUTORIZADA
SOLICITUD_CON_PARTICIPACION_SOLICITANTE_EXPLICITA
SOLICITUD_CON_ACCION_ATRIBUIDA_AL_SOLICITANTE
```

No se admite como alcance suficiente:

- pertenecer a la misma empresa;
- pertenecer a la misma sede sin relación con la solicitud;
- compartir área nominal;
- conocer el identificador o URL;
- haber creado una solicitud histórica bajo otro actor o contexto;
- poseer una etiqueta de rol genérica;
- recibir un enlace reenviado.

##### 4.4. Contexto obligatorio

Antes de mostrar datos o habilitar la acción primaria, la proyección deberá
resolver como mínimo:

| Componente              | Regla                                                                                   |
| ----------------------- | --------------------------------------------------------------------------------------- |
| principal técnico       | identidad autenticada vigente                                                           |
| actor efectivo          | actor empresarial vigente y atribuible                                                  |
| función                 | participación como solicitante                                                          |
| sede                    | sede desde la que puede solicitar                                                       |
| área                    | área solicitante exacta o unidad autorizada                                             |
| permiso                 | capacidad concreta para crear, leer o editar la solicitud                               |
| territorio              | cobertura aplicable a origen, destino y unidad solicitante                              |
| turno o check-in        | solo cuando el contrato de la acción lo exija                                           |
| dispositivo             | contexto de dispositivo cuando la política lo exija                                     |
| versión de autorización | referencia necesaria para detectar revocación o cambio mientras la vista permanece viva |

La ausencia de un componente obligatorio produce fallo cerrado. El usuario no
elige manualmente un contexto que el servicio de autorización no haya resuelto.

##### 4.5. Regla de propiedad funcional

El inicio no convierte al solicitante en propietario del proceso completo.
Crear una solicitud no concede:

- validarla operativamente;
- aprobarla;
- reservar inventario;
- preparar líneas;
- firmar despacho;
- asumir custodia;
- confirmar recepción;
- resolver diferencias;
- conciliar movimientos;
- cerrar la remisión.

Cada acción posterior conserva actor, permiso, territorio, etapa y segregación
independientes.

---

#### 5. `NEXO-REQUESTER-HOME-INFORMATION-ARCHITECTURE-001`

##### 5.1. Orden obligatorio de la página

La proyección se compone en este orden:

| Orden | Sección                        | Propósito                                                                                     | Acción permitida                                      |
| ----: | ------------------------------ | --------------------------------------------------------------------------------------------- | ----------------------------------------------------- |
|     1 | Contexto activo                | identificar actor, sede y área con los que se consulta o solicita                             | cambiar solo mediante el selector canónico autorizado |
|     2 | Acción primaria                | iniciar una nueva solicitud                                                                   | `NUEVA_SOLICITUD`                                     |
|     3 | Requiere mi acción             | mostrar solicitudes propias con información, corrección o decisión atribuida al solicitante   | abrir la acción exacta autorizada                     |
|     4 | En curso                       | seguir solicitudes propias que avanzan bajo responsabilidad de otros actores                  | abrir detalle de solo lectura o acción permitida      |
|     5 | Con novedad                    | destacar bloqueos o diferencias que afectan una solicitud propia                              | abrir detalle; responder solo si existe atribución    |
|     6 | Cerradas recientes             | permitir confirmar resultado e historial reciente sin convertir el inicio en archivo completo | abrir detalle de solo lectura                         |
|     7 | Ayuda contextual y continuidad | explicar siguiente paso, responsable actual y canal de soporte cuando exista un bloqueo       | abrir ayuda o canal canónico                          |

Las siete secciones tienen identidad estable. Una sección puede estar vacía,
pero no puede sustituirse por contenido de supervisión o configuración.

##### 5.2. Encabezado de contexto

El encabezado deberá mostrar de forma breve:

- nombre visible del actor efectivo;
- sede activa;
- área o unidad solicitante;
- condición del contexto cuando falte un requisito;
- fecha y hora de actualización de la proyección cuando los datos no sean en
  tiempo real.

El encabezado no presenta el rol como prueba de autoridad. Si el usuario puede
operar en más de una unidad, la selección usa el selector canónico de contexto
y vuelve a resolver autorización y datos antes de mostrar otra proyección.

##### 5.3. Acción primaria

La única acción primaria del inicio es:

```text
NUEVA SOLICITUD
```

Reglas:

1. solo se muestra habilitada cuando el servicio de autorización confirma la
   capacidad de iniciar para el contexto activo;
2. abre el flujo de solicitud asociado a `NEXO-ROUTE-031` sin crear una URL no
   inventariada;
3. el formulario y sus reglas detalladas pertenecen a `NEXO-UX-009`;
4. la acción no promete disponibilidad ni aprobación;
5. una denegación muestra razón comprensible y no ofrece un bypass;
6. un doble envío no debe representarse como dos solicitudes confirmadas;
7. la pérdida de conectividad no presenta éxito sin receipt verificable.

##### 5.4. Resumen operativo

El inicio podrá mostrar cuatro conteos derivados, siempre restringidos al
alcance autorizado:

| Conteo               | Definición                                                                                   |
| -------------------- | -------------------------------------------------------------------------------------------- |
| `REQUIERE_MI_ACCION` | solicitudes propias con una acción exacta atribuida al solicitante                           |
| `EN_CURSO`           | solicitudes propias no cerradas cuya siguiente acción pertenece a otro actor                 |
| `CON_NOVEDAD`        | solicitudes propias con diferencia, bloqueo, rechazo, devolución o información faltante      |
| `CERRADAS_RECIENTES` | solicitudes propias cerradas dentro de la ventana de consulta definida por la implementación |

Los conteos son navegación resumida, no métricas de desempeño, SLA, ranking ni
control de otros trabajadores.

##### 5.5. Tarjeta o fila mínima

Cada solicitud visible deberá materializar como mínimo:

| Campo visual         | Regla                                                                        |
| -------------------- | ---------------------------------------------------------------------------- |
| identificador humano | código estable y diferenciable                                               |
| origen y destino     | sedes o unidades pertinentes, minimizadas al alcance                         |
| resumen de líneas    | cantidad de líneas y descripción breve sin exponer datos innecesarios        |
| etapa actual         | etiqueta comprensible derivada de una etapa canónica                         |
| estado operativo     | estado vigente; no inferido desde color o texto libre                        |
| siguiente paso       | acción o hecho esperado                                                      |
| responsable actual   | función o equipo, no necesariamente datos personales                         |
| última actualización | fecha y hora del último hecho confirmado                                     |
| novedad              | tipo y severidad cuando exista                                               |
| acción disponible    | una acción exacta o acceso al detalle; nunca un menú genérico de capacidades |

##### 5.6. Jerarquía y priorización

El orden de atención es:

```text
1. ACCION_ATRIBUIDA_AL_SOLICITANTE
2. NOVEDAD_QUE_REQUIERE_INFORMACION_DEL_SOLICITANTE
3. SOLICITUD_EN_CURSO
4. SOLICITUD_CERRADA_RECIENTE
```

Dentro de `REQUIERE_MI_ACCION` se ordena por vencimiento confirmado y, cuando
no exista, por antigüedad de la atribución. Dentro de `CON_NOVEDAD` se ordena
por severidad canónica y antigüedad. No se inventan prioridades, fechas límite
ni severidades desde la interfaz.

##### 5.7. Filtros permitidos

La proyección puede filtrar únicamente dentro del conjunto ya autorizado por:

- estado o etapa;
- sede de origen o destino visible;
- rango de fecha;
- código de solicitud;
- presencia de acción atribuida;
- presencia de novedad.

Un filtro no amplía cobertura ni convierte una búsqueda por identificador en
acceso a una solicitud ajena.

---

#### 6. `NEXO-REQUESTER-INITIATOR-DECISION-MATRIX-001`

La tarea conserva las cinco identidades de iniciación aprobadas para
`VPROC-0028` y decide su relación con el inicio.

| Identidad de iniciación          | Tipo    | Proyección del inicio                            | Alcance visible                                                 | Decisión materializada                                                                                        | Estado         |
| -------------------------------- | ------- | ------------------------------------------------ | --------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- | -------------- |
| `AREA_SOLICITANTE`               | humana  | `SOLICITANTE_PRIMARIO`                           | solicitudes de la unidad y participación solicitante autorizada | consume el inicio completo de solicitante                                                                     | `ESPECIFICADO` |
| `RESPONSABLE_PRODUCTIVO`         | humana  | `SOLICITANTE_ALTERNATIVO`                        | solicitudes iniciadas para su unidad productiva autorizada      | consume la misma proyección sin obtener funciones de preparación o aprobación                                 | `ESPECIFICADO` |
| `CAJA_MOSTRADOR_O_SERVICIO`      | humana  | `SOLICITANTE_ALTERNATIVO`                        | solicitudes iniciadas para la unidad de servicio autorizada     | consume la misma proyección; la actividad comercial no amplía inventario ni territorio                        | `ESPECIFICADO` |
| `GERENCIA_O_SUPERVISION_DE_SEDE` | humana  | `SOLICITANTE_ALTERNATIVO_CON_CARRILES_SEPARADOS` | solicitudes propias iniciadas como solicitante                  | usa esta proyección solo para solicitudes propias; sus controles supervisores permanecen fuera de este inicio | `ESPECIFICADO` |
| `UMBRAL_O_ALERTA`                | técnica | `NO_APLICA_INTERFAZ_DIRECTA`                     | ninguna sesión humana derivada del disparador                   | puede originar una señal o candidato mediante contrato posterior; no recibe home ni autoridad humana          | `NO_APLICA`    |

Reconciliación:

```text
EXPECTED_INITIATOR_IDENTITIES = 5
MATERIALIZED_INITIATOR_IDENTITIES = 5
UNIQUE_INITIATOR_IDENTITIES = 5
MISSING_INITIATOR_IDENTITIES = 0
DUPLICATE_INITIATOR_IDENTITIES = 0
```

---

#### 7. Estados de proyección del solicitante

La interfaz utiliza ocho agrupaciones derivadas. No sustituyen los estados del
dominio ni se persisten como una segunda máquina de estados.

| Agrupación UI        | Regla de inclusión                                                    | Acción del solicitante                                               |
| -------------------- | --------------------------------------------------------------------- | -------------------------------------------------------------------- |
| `BORRADOR_EDITABLE`  | solicitud propia todavía editable según etapa, versión y autorización | continuar o editar mediante la acción exacta                         |
| `REQUIERE_MI_ACCION` | existe una acción vigente y atribuida expresamente al solicitante     | ejecutar esa acción autorizada                                       |
| `EN_VALIDACION`      | la solicitud espera revisión, validación o decisión de otro actor     | seguimiento de solo lectura                                          |
| `EN_PREPARACION`     | reserva, fulfillment o preparación bajo responsabilidad de bodega     | seguimiento de solo lectura                                          |
| `EN_TRANSITO`        | custodia o traslado confirmados                                       | seguimiento de solo lectura                                          |
| `EN_RECEPCION`       | recepción, aceptación o conciliación en destino                       | seguimiento de solo lectura                                          |
| `CON_NOVEDAD`        | diferencia, bloqueo, rechazo, devolución o solicitud de información   | responder solo si la acción está atribuida; de lo contrario, lectura |
| `CERRADA`            | proceso terminado con resultado final observable                      | consulta de solo lectura                                             |

Reglas de derivación:

- una solicitud puede aparecer en una única agrupación principal;
- `CON_NOVEDAD` prevalece sobre una agrupación ordinaria mientras la novedad
  esté abierta;
- `REQUIERE_MI_ACCION` prevalece cuando existe una acción explícita vigente;
- el estado del dominio sigue siendo la fuente autoritativa;
- una agrupación UI nunca habilita una transición por sí sola.

---

#### 8. `NEXO-REQUESTER-STAGE-PROJECTION-MATRIX-001`

Se materializa una decisión para cada una de las nueve etapas canónicas de
`VPROC-0028`.

| Etapa            | Nombre canónico                                                 | Visibilidad en inicio | Agrupación UI ordinaria                                | Acción del solicitante                                                    | Funciones excluidas                                                              | Decisión materializada                                                                                 | Estado         |
| ---------------- | --------------------------------------------------------------- | --------------------- | ------------------------------------------------------ | ------------------------------------------------------------------------- | -------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ | -------------- |
| `VPROC-0028-E01` | Crear solicitud interna                                         | completa              | `BORRADOR_EDITABLE` o `REQUIERE_MI_ACCION`             | crear, completar, corregir o enviar cuando esté autorizado                | validar políticas, reservar, preparar o aprobar                                  | es la única etapa de creación propia; toda edición revalida versión, contexto y permiso                | `ESPECIFICADO` |
| `VPROC-0028-E02` | Aplicar ruta, producto y política de solicitud                  | resumen y detalle     | `EN_VALIDACION` o `REQUIERE_MI_ACCION`                 | corregir información solo cuando el resultado vigente le atribuya acción  | configurar rutas, productos, mínimos, restricciones o políticas                  | muestra reglas aplicadas y razones de validación sin exponer controles de configuración                | `ESPECIFICADO` |
| `VPROC-0028-E03` | Crear origen y fulfillment por línea                            | resumen y detalle     | `EN_VALIDACION`                                        | seguimiento de solo lectura                                               | asignar origen, crear fulfillment, decidir faltantes o priorizar abastecimiento  | muestra la resolución por línea necesaria para comprender el avance, sin conceder decisión supervisora | `ESPECIFICADO` |
| `VPROC-0028-E04` | Elegir LOC, posición y cantidad de picking                      | resumen               | `EN_PREPARACION`                                       | seguimiento de solo lectura                                               | consultar stock sensible, elegir LOC o posición, reservar o confirmar picking    | expone avance agregado y responsable funcional, no herramientas ni detalle operativo de bodega         | `ESPECIFICADO` |
| `VPROC-0028-E05` | Preparar, dejar listo o registrar faltante                      | resumen y detalle     | `EN_PREPARACION`, `CON_NOVEDAD` o `REQUIERE_MI_ACCION` | responder únicamente cuando una aclaración o decisión le sea atribuida    | preparar, sustituir sin aprobación, declarar listo o cerrar faltante             | diferencia avance ordinario, faltante y acción atribuida sin convertir al solicitante en preparador    | `ESPECIFICADO` |
| `VPROC-0028-E06` | Cargar, sellar y despachar                                      | resumen y detalle     | `EN_PREPARACION` o `EN_TRANSITO`                       | seguimiento de solo lectura                                               | cargar, sellar, firmar despacho, transferir custodia o confirmar salida          | cambia la proyección solo desde hechos confirmados; no anticipa despacho ni ofrece controles de salida | `ESPECIFICADO` |
| `VPROC-0028-E07` | Transportar y confirmar tránsito                                | resumen y detalle     | `EN_TRANSITO`                                          | seguimiento de solo lectura                                               | asumir custodia, registrar hitos, entregar o resolver incidentes                 | muestra último hito confirmado y responsable funcional sin controles de conductor                      | `ESPECIFICADO` |
| `VPROC-0028-E08` | Recibir parcial o totalmente                                    | resumen y detalle     | `EN_RECEPCION` o `CON_NOVEDAD`                         | consultar cantidades y condición recibidas; responder solo si se atribuye | recibir, contar, aceptar, rechazar o conciliar diferencias                       | el solicitante no se convierte en receptor; la recepción parcial no se presenta como cierre            | `ESPECIFICADO` |
| `VPROC-0028-E09` | Resolver faltante, sobrante, daño, rechazo, devolución o cierre | destacada o histórica | `CON_NOVEDAD`, `REQUIERE_MI_ACCION` o `CERRADA`        | explicar, corregir o aportar evidencia solo cuando esté atribuido         | investigar globalmente, decidir disposición, aprobar resolución o cerrar el caso | separa informar de resolver y solo presenta cierre cuando existe un hecho canónico confirmado          | `ESPECIFICADO` |

Reconciliación:

```text
EXPECTED_PROCESS_STAGES = 9
MATERIALIZED_PROCESS_STAGES = 9
UNIQUE_PROCESS_STAGES = 9
MISSING_PROCESS_STAGES = 0
DUPLICATE_PROCESS_STAGES = 0
```

---

#### 9. `NEXO-REQUESTER-ROUTE-DISPOSITION-001`

La matriz decide todas las rutas vinculadas por el inventario al inicio y a
`VPROC-0028`. No crea rutas nuevas ni altera su identidad.

| Ruta             | Patrón actual                             | Disposición para el inicio del solicitante         | Navegación visible | Acción o uso permitido                                             | Decisión materializada                                                                         | Estado             |
| ---------------- | ----------------------------------------- | -------------------------------------------------- | ------------------ | ------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------- | ------------------ |
| `NEXO-ROUTE-001` | `/`                                       | `PROYECTAR_INICIO_SOLICITANTE`                     | sí                 | acceder al resumen propio y a `NUEVA_SOLICITUD`                    | conserva la ruta raíz y separa esta proyección de supervisión y configuración                  | `ESPECIFICADO`     |
| `NEXO-ROUTE-031` | `/inventory/remissions`                   | `DESTINO_OPERATIVO_PRIMARIO`                       | sí                 | crear y listar solicitudes propias autorizadas                     | la bandeja se filtra por actor y función; no mezcla preparación, conducción ni control         | `ESPECIFICADO`     |
| `NEXO-ROUTE-032` | `/inventory/remissions/[id]`              | `DETALLE_PROPIO_CON_ACCIONES_POR_ETAPA`            | sí                 | consultar una solicitud propia y ejecutar solo acciones atribuidas | lectura compartida no implica autoridad; cada acción se resuelve de forma independiente        | `ESPECIFICADO`     |
| `NEXO-ROUTE-033` | `/inventory/remissions/[id]/edit`         | `EDICION_CONDICIONAL`                              | condicional        | editar solicitud propia únicamente en etapa editable               | falla cerrado si cambió versión, etapa, actor, territorio o permiso                            | `ESPECIFICADO`     |
| `NEXO-ROUTE-034` | `/inventory/remissions/conductor`         | `EXCLUIR_DEL_INICIO`                               | no                 | ninguna                                                            | pertenece al inicio del conductor                                                              | `FUERA_DE_ALCANCE` |
| `NEXO-ROUTE-035` | `/inventory/remissions/fulfillment`       | `EXCLUIR_DEL_INICIO`                               | no                 | ninguna                                                            | pertenece a asignación y disponibilidad operativa de bodega                                    | `FUERA_DE_ALCANCE` |
| `NEXO-ROUTE-036` | `/inventory/remissions/prepare`           | `EXCLUIR_DEL_INICIO`                               | no                 | ninguna                                                            | pertenece a picking y preparación                                                              | `FUERA_DE_ALCANCE` |
| `NEXO-ROUTE-037` | `/inventory/remissions/receive`           | `EXCLUIR_DEL_INICIO`                               | no                 | ninguna                                                            | pertenece al receptor; el solicitante observa resultado desde el detalle                       | `FUERA_DE_ALCANCE` |
| `NEXO-ROUTE-038` | `/inventory/remissions/transit`           | `EXCLUIR_CONTROLES_Y_PROYECTAR_RESUMEN_EN_DETALLE` | no                 | seguimiento de hitos desde `NEXO-ROUTE-032`                        | no expone custodia ni monitoreo supervisor dentro del inicio                                   | `ESPECIFICADO`     |
| `NEXO-ROUTE-041` | `/inventory/settings/fulfillment-routes`  | `EXCLUIR_DEL_INICIO`                               | no                 | ninguna                                                            | el solicitante consume el resultado de las reglas, no su configuración                         | `FUERA_DE_ALCANCE` |
| `NEXO-ROUTE-045` | `/inventory/settings/remissions`          | `EXCLUIR_DEL_INICIO`                               | no                 | ninguna                                                            | los parámetros generales no pertenecen a operación del solicitante                             | `FUERA_DE_ALCANCE` |
| `NEXO-ROUTE-046` | `/inventory/settings/remissions/products` | `EXCLUIR_DEL_INICIO`                               | no                 | ninguna                                                            | elegibilidad y comportamiento de productos se aplican como reglas, no como controles editables | `FUERA_DE_ALCANCE` |
| `NEXO-ROUTE-047` | `/inventory/settings/request-policies`    | `EXCLUIR_Y_MOSTRAR_RESULTADO_DE_POLITICA`          | no                 | leer mensajes de validación derivados                              | mínimos y restricciones se explican durante la solicitud sin abrir configuración               | `ESPECIFICADO`     |
| `NEXO-ROUTE-050` | `/inventory/settings/supply-routes`       | `EXCLUIR_DEL_INICIO`                               | no                 | ninguna                                                            | las rutas de abastecimiento son configuración reutilizable                                     | `FUERA_DE_ALCANCE` |

Reconciliación:

```text
EXPECTED_RELEVANT_ROUTES = 14
MATERIALIZED_RELEVANT_ROUTES = 14
UNIQUE_RELEVANT_ROUTES = 14
MISSING_RELEVANT_ROUTES = 0
DUPLICATE_RELEVANT_ROUTES = 0
NEW_ROUTE_IDENTITIES = 0
```

---

#### 10. Contrato de datos de la proyección

El inicio consume una proyección de lectura y comandos autorizados. No crea un
nuevo sistema de registro.

##### 10.1. Contexto

```text
requester_context
- principal_id
- actor_id
- actor_function = REQUESTER
- site_id
- area_id o requesting_unit_id
- authorization_version
- context_version
- resolved_at
```

##### 10.2. Capacidades resueltas

```text
requester_capabilities
- can_create_request
- can_read_own_requests
- can_edit_own_request
- can_respond_to_assigned_action
- denial_reasons[]
```

Las capacidades se reciben del servicio canónico de autorización. La interfaz
no las infiere desde nombres de rol, texto del menú ni datos locales.

##### 10.3. Resumen

```text
requester_summary
- requires_my_action_count
- in_progress_count
- issue_count
- recently_closed_count
- calculated_at
- freshness_status
```

##### 10.4. Elemento de lista

```text
requester_request_item
- remission_id
- human_code
- requester_actor_id
- requesting_unit_id
- origin_site_ref
- destination_site_ref
- line_count
- canonical_stage_id
- canonical_status_code
- requester_ui_group
- next_action_code
- next_action_owner_function
- action_assignment_id
- is_editable
- issue_code
- issue_severity
- last_confirmed_event_at
- detail_route_id = NEXO-ROUTE-032
- version
```

Los nombres anteriores son un contrato lógico de proyección. Esta tarea no
ordena columnas, tablas, vistas, RPC ni endpoints físicos.

##### 10.5. Reglas de consistencia

- los conteos y listas usan el mismo corte lógico o declaran su diferencia de
  frescura;
- una solicitud visible debe resolver a un detalle visible bajo el mismo
  contexto;
- una acción visible debe corresponder a una atribución vigente;
- la edición usa control de versión y vuelve a validar etapa y permiso;
- la revocación retira acciones y datos no permitidos sin esperar una nueva
  sesión;
- una respuesta parcial no se presenta como conjunto completo;
- un resultado desconocido no se presenta como éxito ni como cierre.

---

#### 11. `NEXO-REQUESTER-HOME-STATE-CONTRACT-001`

Se definen ocho estados completos de interfaz:

| Estado                 | Condición                                                             | Presentación obligatoria                                                    | Acciones habilitadas                                |
| ---------------------- | --------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------- |
| `LOADING`              | contexto o proyección en resolución                                   | esqueleto estable sin datos ficticios                                       | ninguna                                             |
| `READY_WITH_ACTIONS`   | existen solicitudes y al menos una acción atribuida                   | acción primaria, sección prioritaria y listas propias                       | acciones exactas autorizadas                        |
| `READY_NO_ACTIONS`     | existen solicitudes pero ninguna acción atribuida                     | seguimiento en curso y creación cuando esté autorizada                      | crear o abrir detalle                               |
| `EMPTY_NO_HISTORY`     | no existen solicitudes visibles en el alcance actual                  | explicación breve y acción primaria cuando esté autorizada                  | crear solicitud                                     |
| `PARTIAL_DATA`         | una fuente o sección no pudo resolverse completamente                 | datos confirmados, secciones afectadas identificadas y frescura visible     | solo acciones cuya precondición esté confirmada     |
| `AUTH_CONTEXT_MISSING` | falta actor, sede, área, permiso u otro componente obligatorio        | razón estructurada y mecanismo canónico para resolver contexto              | ninguna acción empresarial                          |
| `ACCESS_REVOKED`       | la autorización cambió o fue retirada mientras la vista estaba activa | retiro inmediato de datos y acciones; mensaje comprensible                  | volver a resolver contexto o salir                  |
| `SERVICE_UNAVAILABLE`  | no se puede obtener una respuesta confiable                           | error recuperable, última actualización si existe y ausencia de éxito falso | reintentar lectura; ninguna escritura no confirmada |

##### 11.1. Estado vacío

`EMPTY_NO_HISTORY` no se interpreta como error ni como permiso concedido. La
acción primaria solo aparece habilitada cuando `can_create_request=true`.

##### 11.2. Datos parciales

En `PARTIAL_DATA`:

- no se completa un conteo con cero inventado;
- no se oculta una sección fallida como si estuviera vacía;
- no se conserva una acción cuya atribución no pudo revalidarse;
- se permite lectura confirmada si no amplía el riesgo;
- se identifica el momento del último dato confirmado.

##### 11.3. Conectividad y reintento

La interfaz no almacena una creación como confirmada sin receipt autoritativo.
Cuando el resultado de una escritura sea desconocido, deberá recuperar el
resultado por identidad o idempotencia antes de permitir otro intento. El
diseño detallado de operación offline pertenece a las tareas que materialicen
el flujo y la arquitectura de colas.

---

#### 12. Contenido y lenguaje operacional

##### 12.1. Etiquetas principales

Se utilizan conceptos comprensibles para el solicitante:

- `Nueva solicitud`;
- `Requiere tu acción`;
- `En validación`;
- `En preparación`;
- `En tránsito`;
- `En recepción`;
- `Con novedad`;
- `Cerrada`;
- `Siguiente paso`;
- `Responsable actual`;
- `Última actualización`.

No se exponen como lenguaje principal:

- nombres de tablas;
- claves internas de estado;
- nombres de componentes;
- códigos de permisos;
- RLS, RPC o detalles técnicos;
- mensajes crudos de base de datos;
- trazas o identificadores sensibles.

##### 12.2. Mensajes de política

Cuando una regla impida solicitar o editar, el mensaje debe indicar:

1. qué condición no se cumple;
2. qué dato o contexto se utilizó;
3. qué acción ordinaria puede resolverla;
4. si la situación requiere otra función o un canal de soporte.

No se utilizan mensajes que sugieran cambiar de rol, manipular una URL,
solicitar un bypass o pedir a otro actor que use su sesión.

---

#### 13. Responsive, accesibilidad y estaciones

##### 13.1. Prioridad por tamaño

| Superficie          | Regla                                                                                                  |
| ------------------- | ------------------------------------------------------------------------------------------------------ |
| móvil               | acción primaria y `Requiere mi acción` antes del primer desplazamiento largo                           |
| tablet              | resumen y lista principal visibles sin convertir la pantalla en tablero supervisor                     |
| escritorio          | dos columnas como máximo para listas y detalle resumido; no mostrar configuración por espacio sobrante |
| estación compartida | contexto del actor visible, cambio de actor controlado y retiro de datos al cerrar o expirar sesión    |

##### 13.2. Accesibilidad

- toda acción debe ser alcanzable por teclado;
- el foco sigue un orden coherente con las siete secciones;
- estado, severidad y bloqueo no dependen solo del color;
- los conteos tienen etiqueta textual;
- los cambios de estado importantes se anuncian de forma accesible;
- el CTA principal mantiene nombre y propósito estables;
- los errores se asocian con la sección o acción afectada;
- las tarjetas conservan alternativa tabular o semántica equivalente;
- no se ocultan acciones críticas únicamente detrás de hover o gesto.

---

#### 14. Seguridad, privacidad y segregación

1. La consulta se filtra en servidor o frontera autoritativa antes de llegar a
   la proyección.
2. La interfaz no obtiene solicitudes globales para filtrarlas localmente.
3. Cada detalle y acción vuelve a validar identidad, actor, territorio, etapa,
   versión y permiso.
4. Los datos personales de otros actores se minimizan a función o equipo cuando
   el nombre no sea necesario.
5. Los precios internos, costos, existencias sensibles, notas de control y
   diagnósticos no aparecen por defecto.
6. La persona que posee varias funciones no recibe una pantalla mezclada; usa
   la proyección correspondiente a la función activa.
7. Crear una solicitud no permite aprobarla, prepararla, transportarla,
   recibirla ni cerrarla.
8. Una acción excepcional se presenta separada del camino ordinario y conserva
   razón, evidencia, vigencia y autoridad.
9. Una URL directa no omite las mismas comprobaciones aplicadas desde el menú.
10. La pérdida de autorización elimina acciones visibles y bloquea nuevas
    mutaciones.

---

#### 15. Estado técnico actual y brecha de implementación

El código inspeccionado de `vento-nexo` conserva un inicio agregado y las
superficies físicas de remisiones para bandeja, detalle, edición, conductor,
fulfillment, preparación, recepción y tránsito. Esa existencia técnica no
materializa por sí sola la proyección exclusiva del solicitante ni demuestra
que las acciones estén separadas conforme a este contrato.

Por tanto:

| Elemento                                     | Estado                   | Evidencia permitida                                                            | Condición de salida                                              |
| -------------------------------------------- | ------------------------ | ------------------------------------------------------------------------------ | ---------------------------------------------------------------- |
| contrato de inicio del solicitante           | `ESPECIFICADO`           | esta tarea                                                                     | implementación posterior conforme al contrato                    |
| arquitectura de información                  | `ESPECIFICADO`           | siete secciones y reglas materializadas                                        | prototipo e implementación                                       |
| decisión por iniciador                       | `ESPECIFICADO`           | cinco identidades reconciliadas                                                | consumo por autorización y contexto                              |
| proyección de nueve etapas                   | `ESPECIFICADO`           | matriz alineada con `VPROC-0028-E01` a `VPROC-0028-E09`                        | conexión con estados, cantidades y acciones reales               |
| disposición de catorce rutas                 | `ESPECIFICADO`           | matriz completa sobre identidades ya inventariadas                             | implementación y guards de navegación                            |
| inicio actual agregado                       | `IMPLEMENTADO_PARCIAL`   | superficie raíz con agrupaciones de operación, verificación y configuración    | separar proyecciones por actor y carril                          |
| superficies actuales de remisiones           | `IMPLEMENTADO_PARCIAL`   | bandeja, detalle, edición y subrutas operativas presentes en `vento-nexo`      | reconciliar cada superficie con actor, etapa, acción y autoridad |
| inicio exclusivo del solicitante             | `NO_IMPLEMENTADO`        | no existe evidencia de las siete secciones ni de la jerarquía aprobada         | implementación conforme a `NEXO-REQUESTER-HOME-CONTRACT-001`     |
| flujo integral de remisión validado          | `PENDIENTE_DE_EVIDENCIA` | las superficies existentes no prueban cobertura ni corrección de todo el ciclo | `NEXO-UX-009` a `NEXO-UX-013`, implementación, pruebas y piloto  |
| validación operativa con solicitantes reales | `PENDIENTE_DE_EVIDENCIA` | no ejecutada en esta tarea                                                     | prototipo, piloto y certificación reservados en el roadmap       |

No se interpreta el diseño como disponibilidad productiva.

---

#### 16. Requisitos de prueba derivados

Esta tarea crea **seis requisitos de prueba** y no modifica, difiere, descarta
ni declara obsoleto ningún requisito histórico:

| Identificador   | Regla protegida resumida                                                                                                                | Estado inicial |
| --------------- | --------------------------------------------------------------------------------------------------------------------------------------- | -------------- |
| `TREQ-NEXO-050` | El inicio del solicitante se proyecta desde actor efectivo, autorización, territorio y participación propia resueltos en servidor.      | `IDENTIFICADO` |
| `TREQ-NEXO-051` | La arquitectura conserva siete secciones, una sola acción primaria y prioridad por acción propia, riesgo temporal y resultado reciente. | `IDENTIFICADO` |
| `TREQ-NEXO-052` | Las nueve etapas de `VPROC-0028` separan creación y seguimiento de preparación, transporte, recepción, supervisión y cierre.            | `IDENTIFICADO` |
| `TREQ-NEXO-053` | Las catorce rutas relevantes mantienen disposición por actor, etapa y carril, con acceso directo denegado cuando falte autoridad.       | `IDENTIFICADO` |
| `TREQ-NEXO-054` | En dispositivo compartido, toda mutación exige sesión humana activa y atribución conjunta de dispositivo, actor y contexto.             | `IDENTIFICADO` |
| `TREQ-NEXO-055` | Los ocho estados de interfaz fallan cerrados y no presentan datos parciales, fallos, reintentos o conectividad incierta como éxito.     | `IDENTIFICADO` |

Los seis requisitos permanecen pendientes de implementación, automatización y
evidencia. Su detalle completo se conserva en el Registro Canónico de
Requisitos de Prueba.

Requisitos vigentes consumidos sin modificación:

- `TREQ-NEXO-006`;
- `TREQ-PROC-136`;
- `TREQ-PROC-138`;
- `TREQ-UX-160`;
- `TREQ-UX-161`;
- `TREQ-UX-163`.

---

#### 17. Criterios de aceptación

La tarea se considera documentalmente completa cuando se confirme que:

- existe un único contrato de inicio para el solicitante;
- la audiencia primaria es `AREA_SOLICITANTE`;
- las cinco identidades de iniciación tienen decisión explícita;
- las nueve etapas de `VPROC-0028` tienen proyección explícita;
- las catorce rutas relevantes tienen disposición explícita;
- no se inventaron rutas ni identidades de proceso;
- el carril de la proyección es exclusivamente `OPERACION`;
- la única acción primaria es `NUEVA_SOLICITUD`;
- el inicio solo crea y sigue solicitudes propias;
- preparación, conducción, recepción, supervisión y configuración están
  excluidas;
- la creación no concede autoridad sobre etapas posteriores;
- la arquitectura materializa siete secciones obligatorias;
- existen ocho estados completos de interfaz;
- el contexto y la autorización fallan cerrados;
- una persona con múltiples funciones no recibe controles mezclados;
- los conteos no amplían alcance ni se presentan como métricas de desempeño;
- los datos parciales y resultados desconocidos no se presentan como éxito;
- el diseño distingue `ESPECIFICADO` de `IMPLEMENTADO` y `VALIDADO`;
- todas las brechas tienen tarea o condición de salida;
- se crean exactamente seis requisitos `TREQ-NEXO-050` a `TREQ-NEXO-055`, sin modificar requisitos históricos;
- `NEXO-UX-004` permanece únicamente reservada.

---

#### 18. `NEXO-REQUESTER-HOME-HANDOFF-001`

| Destino                        | Handoff aprobado                                                                                                         |
| ------------------------------ | ------------------------------------------------------------------------------------------------------------------------ |
| `NEXO-UX-004`                  | diseñar el inicio del bodeguero sin reutilizar el inicio del solicitante como cola de preparación                        |
| `NEXO-UX-005`                  | diseñar custodia y acciones del conductor en una proyección independiente                                                |
| `NEXO-UX-006`                  | diseñar recepción y diferencias desde la función del receptor                                                            |
| `NEXO-UX-007`                  | diseñar control global, autorizaciones, retrasos y cierres fuera del inicio del solicitante                              |
| `NEXO-UX-008`                  | organizar navegación por tareas y proyecciones sin mezclar carriles                                                      |
| `NEXO-UX-009`                  | definir el formulario, reglas, envío y edición de la solicitud                                                           |
| `NEXO-UX-010`                  | diseñar fulfillment, reserva y preparación                                                                               |
| `NEXO-UX-011`                  | diseñar documento, firma y despacho                                                                                      |
| `NEXO-UX-012`                  | diseñar carga, transporte, custodia y entrega                                                                            |
| `NEXO-UX-013`                  | diseñar recepción, diferencias y cierre                                                                                  |
| paquete de implementación NEXO | construir componentes, proyección de datos, guards, comandos, pruebas y observabilidad cuando la continuidad lo autorice |
| certificación posterior        | validar con solicitantes reales, contextos territoriales, dispositivos, conectividad y segregación                       |

Ningún destino anterior se inicia mediante esta tarea.

---

#### 19. Continuidad canónica

**ÚLTIMA TAREA APROBADA**

`NEXO-UX-002 — Separar operación, supervisión y configuración`

**TAREA ACTUAL APROBADA**

`NEXO-UX-003 — Diseñar inicio para solicitante`

**SIGUIENTE TAREA RESERVADA**

`NEXO-UX-004 — Diseñar inicio para bodeguero`


### ✅ NEXO-UX-004 — Diseñar inicio para bodeguero

**Estado:** APROBADA
**Tarea anterior:** `NEXO-UX-003 — Diseñar inicio para solicitante` — APROBADA
**Tarea siguiente:** `NEXO-UX-005 — Diseñar inicio para conductor` — RESERVADA
**Tipo de tarea:** documental; diseño funcional completo del inicio operativo del bodeguero, colas de trabajo, prioridad, arquitectura de información, estados, autorización, decisiones por proceso, etapa y ruta, y handoff de implementación
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/K_NEXO/04_EXPERIENCIA_DE_INVENTARIO_LOGISTICA_Y_ACTIVOS.md`
**Repositorio de aplicación inspeccionado:** `vento-nexo`
**Artefactos producidos:** `NEXO-WAREHOUSE-HOME-CONTRACT-001`, `NEXO-WAREHOUSE-HOME-INFORMATION-ARCHITECTURE-001`, `NEXO-WAREHOUSE-WORK-QUEUE-CATALOG-001`, `NEXO-WAREHOUSE-STAGE-PROJECTION-MATRIX-001`, `NEXO-WAREHOUSE-ROUTE-DISPOSITION-001`, `NEXO-WAREHOUSE-HOME-STATE-CONTRACT-001` y `NEXO-WAREHOUSE-HOME-HANDOFF-001`
**Decisiones consumidas:** `NEXO-REAL-PROCESS-INVENTORY-001`; `NEXO-UX-LANE-CONTRACT-001`; `NEXO-ASIS-STAGE-LANE-MATRIX-001`; `NEXO-ROUTE-LANE-DISPOSITION-001`; `NEXO-REQUESTER-HOME-CONTRACT-001`; `AUTH-RBAC-017`; `PROC-BUSINESS-PURPOSE-REGISTRY-001`; `PROC-PROCESS-INITIATOR-MATRIX-001`; `PROC-PROCESS-CONTINUATOR-MATRIX-001`; `PROC-PROCESS-RACI-MATRIX-001`; `VPROC-0023` a `VPROC-0028`; inventario `NEXO-ROUTE-001` a `NEXO-ROUTE-064`; requisitos `TREQ-*` vigentes; código actual de `vento-nexo`
**Cambios físicos autorizados:** ninguno; no modifica código, rutas, permisos, datos, stock, movimientos, remisiones, Supabase, migraciones, RLS, configuración ni despliegues

---

#### 1. Propósito

Diseñar el inicio operativo de NEXO para la función `BODEGA_Y_ABASTECIMIENTO`
y el rol operativo `bodeguero`, de modo que la persona pueda continuar el
trabajo físico realmente atribuible a su turno y a la bodega activa sin recibir
un tablero global, un menú técnico ni controles de supervisión o configuración.

La regla canónica es:

```text
ACTOR HUMANO EFECTIVO
+
ROL OPERATIVO bodeguero
+
TURNO Y CHECK-IN VIGENTES CUANDO APLIQUEN
+
SEDE Y ÁREA warehouse AUTORIZADAS
+
TAREAS ASIGNADAS, CUSTODIA O HANDOFF VÁLIDOS
+
PERMISO EXACTO Y RECURSO RESUELTOS EN SERVIDOR
+
PRIORIDAD OPERATIVA AUTORITATIVA
→
INICIO DEL BODEGUERO
```

El inicio no concede autoridad por mostrar una tarjeta, conteo, ruta, stock,
LOC, remisión o etiqueta. Cada lectura y mutación conserva actor, permiso,
territorio, etapa, versión y segregación de funciones.

---

#### 2. Resultado material

Se aprueban siete artefactos documentales consumibles:

1. `NEXO-WAREHOUSE-HOME-CONTRACT-001`, que define audiencia, autoridad,
   contexto, límites y regla de composición;
2. `NEXO-WAREHOUSE-HOME-INFORMATION-ARCHITECTURE-001`, que fija ocho secciones,
   una única acción primaria y la jerarquía de lectura;
3. `NEXO-WAREHOUSE-WORK-QUEUE-CATALOG-001`, que materializa diez clases de cola
   operativa con entrada, salida, bloqueo y propiedad;
4. `NEXO-WAREHOUSE-STAGE-PROJECTION-MATRIX-001`, que decide las cuarenta etapas
   de `VPROC-0023` a `VPROC-0028` para esta proyección;
5. `NEXO-WAREHOUSE-ROUTE-DISPOSITION-001`, que decide treinta rutas existentes
   relacionadas con el inicio del bodeguero sin inventar URLs;
6. `NEXO-WAREHOUSE-HOME-STATE-CONTRACT-001`, que define diez estados completos
   de interfaz, conectividad, conflicto y revocación;
7. `NEXO-WAREHOUSE-HOME-HANDOFF-001`, que separa el diseño aprobado de los
   flujos, implementación, pruebas y certificación posteriores.

Cobertura materializada:

| Elemento                                  | Total esperado | Total materializado | Faltantes | Duplicados |
| ----------------------------------------- | -------------: | ------------------: | --------: | ---------: |
| Procesos canónicos reconciliados          |              6 |                   6 |         0 |          0 |
| Etapas canónicas decididas                |             40 |                  40 |         0 |          0 |
| Clases de cola operativa                  |             10 |                  10 |         0 |          0 |
| Rutas relevantes decididas                |             30 |                  30 |         0 |          0 |
| Secciones obligatorias                    |              8 |                   8 |         0 |          0 |
| Acciones primarias                        |              1 |                   1 |         0 |          0 |
| Estados de interfaz                       |             10 |                  10 |         0 |          0 |
| Requisitos de prueba nuevos o modificados |              6 |                   6 |         0 |          0 |

La tarea deja el diseño en estado `ESPECIFICADO`. No declara el home
`IMPLEMENTADO`, `VALIDADO` ni disponible en producción.

---

#### 3. Alcance funcional

##### 3.1. Incluido

- continuación de tareas asignadas de recepción, ubicación, preparación,
  handoff, recepción interna, conteo, traslado, retiro y condición;
- referencia de stock, LOC, posición, lote, LPN y movimientos solo dentro del
  contexto necesario para ejecutar una tarea;
- priorización autoritativa y estable del siguiente trabajo;
- captura de faltantes, diferencias, daños, bloqueos y evidencia sin asumir la
  decisión supervisora;
- funcionamiento en dispositivo personal o compartido con sesión humana;
- estados de carga, vacío, datos parciales, error, revocación, conectividad y
  conflicto de concurrencia;
- decisión explícita por proceso, etapa, clase de cola y ruta relevante.

##### 3.2. Excluido

- crear solicitudes por cuenta de áreas solicitantes;
- crear o reasignar fulfillment;
- iniciar o confirmar tránsito como conductor;
- autoaceptar una entrega preparada por el mismo actor en el mismo extremo;
- abrir, congelar, aprobar o cerrar sesiones de conteo;
- aprobar diferencias o publicar ajustes;
- decidir liberación, merma, pérdida, rechazo o disposición;
- crear productos, LOC, zonas, posiciones, políticas, rutas, plantillas o
  configuración logística;
- consultar costos, márgenes, información financiera o inventario global;
- operar otras sedes o áreas por conocer una URL o identificador;
- implementar componentes, permisos, datos o migraciones.

---

#### 4. `NEXO-WAREHOUSE-HOME-CONTRACT-001`

##### 4.1. Audiencia y función

La audiencia primaria es `BODEGA_Y_ABASTECIMIENTO`, proyectada mediante el rol
operativo `bodeguero` dentro de una sede autorizada y un área activa de tipo
`warehouse`.

El nombre del cargo, `employees.role`, `navigation_role`, el tipo de sede o la
presencia en un centro de producción no sustituyen la resolución de la función.
Una persona con capacidades administrativas o supervisoras consume esas
capacidades en una proyección separada.

##### 4.2. Carril único

El home pertenece exclusivamente al carril `OPERACION`.

Puede consumir referencias de solo lectura necesarias para una tarea, pero no
incorpora:

- decisiones de `SUPERVISION`;
- edición de `CONFIGURACION`;
- monitoreo global;
- métricas de desempeño individual;
- utilidades técnicas sin tarea propietaria;
- accesos implícitos derivados del tipo de sede.

##### 4.3. Contexto obligatorio

| Componente         | Regla                                                             |
| ------------------ | ----------------------------------------------------------------- |
| principal técnico  | identidad autenticada vigente                                     |
| actor efectivo     | persona empresarial atribuible a cada lectura y mutación          |
| función            | `BODEGA_Y_ABASTECIMIENTO` mediante `bodeguero` vigente            |
| turno              | publicado y vigente cuando el permiso lo exija                    |
| check-in           | activo cuando la acción o el dispositivo lo exijan                |
| sede               | sede explícitamente autorizada                                    |
| área               | área activa de tipo `warehouse`                                   |
| permiso            | capacidad atómica exacta para la acción                           |
| territorio         | intersección entre sede, área, LOC, recurso y extremo del proceso |
| relación operativa | asignación, custodia, origen, destino, sesión o handoff válido    |
| dispositivo        | identidad y política del dispositivo cuando aplique               |
| versión            | versión de tarea, recurso y autorización para detectar deriva     |

La ausencia o conflicto de cualquier componente requerido falla cerrado.

##### 4.4. Alcance de datos

El home solo materializa trabajo cuando existe al menos una relación válida:

```text
TAREA_ASIGNADA_AL_ACTOR_O_AREA
RECURSO_BAJO_CUSTODIA_DE_BODEGA_ACTIVA
ORIGEN_DE_REMISION_IGUAL_A_BODEGA_AUTORIZADA
DESTINO_RECEPTOR_IGUAL_A_BODEGA_AUTORIZADA
SESION_DE_CONTEO_ASIGNADA
MOVIMIENTO_DENTRO_DEL_TERRITORIO_AUTORIZADO
INSTRUCCION_DE_CONDICION_AUTORIZADA
HANDOFF_PENDIENTE_CON_PARTICIPACION_EXPLICITA
```

No son relaciones válidas por sí solas: pertenecer a la empresa, compartir
sede, conocer el ID, recibir un enlace, poseer un rol visual o haber participado
en otro turno.

##### 4.5. Segregaciones obligatorias

1. Preparar no concede iniciar tránsito.
2. Entregar a transporte no concede confirmar recepción.
3. Contar no concede ver el saldo teórico antes de la etapa autorizada.
4. Contar o investigar no concede aprobar ni publicar el ajuste.
5. Reportar daño no concede decidir cuarentena, liberación o disposición.
6. Recibir una entrada no concede corregirla o reversarla.
7. Consultar stock no concede moverlo.
8. Ver una asignación no concede reasignarla.
9. Usar un dispositivo compartido no convierte al dispositivo en actor.
10. Una misma persona con varias funciones no recibe controles mezclados.

---

#### 5. `NEXO-WAREHOUSE-HOME-INFORMATION-ARCHITECTURE-001`

##### 5.1. Orden obligatorio

| Orden | Sección                   | Propósito                                                                      | Acción permitida                                                     |
| ----- | ------------------------- | ------------------------------------------------------------------------------ | -------------------------------------------------------------------- |
| 1     | Contexto operativo activo | Actor humano, turno, sede, área warehouse, dispositivo y última actualización. | Cambiar contexto únicamente mediante resolución canónica autorizada. |
| 2     | Siguiente tarea           | Una sola tarea prioritaria resuelta en servidor.                               | CONTINUAR_SIGUIENTE_TAREA                                            |
| 3     | Recibir y ubicar          | Entradas, recepciones internas y existencias sin ubicación completa.           | Abrir únicamente la tarea exacta.                                    |
| 4     | Preparar y entregar       | Preparación, faltantes, carga lista y handoff a transporte.                    | Continuar la etapa atribuida.                                        |
| 5     | Mover y retirar           | Traslados internos y retiros autorizados.                                      | Ejecutar el movimiento contextual.                                   |
| 6     | Contar y reportar         | Conteos asignados y captura de condición o incidente.                          | Capturar observación o evidencia.                                    |
| 7     | Bloqueos y aclaraciones   | Trabajo detenido, conflicto de asignación, diferencia o autorización revocada. | Ver causa y acción permitida; nunca resolver autoridad ajena.        |
| 8     | Referencias y utilidades  | Stock contextual, LOC, movimiento relacionado, lote, impresión y escaneo.      | Consultar o invocar desde una tarea; sin configuración.              |

La sección `Siguiente tarea` contiene la única acción primaria del home:

```text
CONTINUAR_SIGUIENTE_TAREA
```

No existe un botón primario genérico para crear entradas, ajustar stock,
configurar ubicaciones o abrir todas las remisiones.

##### 5.2. Tarjeta de tarea mínima

Cada tarea visible deberá mostrar únicamente datos necesarios para actuar:

- tipo de trabajo;
- recurso o documento identificable;
- sede, área, LOC o extremo aplicable;
- etapa y estado canónicos;
- fecha requerida, ventana o antigüedad relevante;
- cantidad pendiente y unidad cuando exista;
- siguiente acción autorizada;
- bloqueo concreto y actor responsable cuando no pueda continuar;
- versión o marca de actualización suficiente para detectar conflicto.

No se muestra como éxito una cantidad desconocida, estimada o no conciliada.

##### 5.3. Regla de prioridad

La siguiente tarea se resuelve en servidor y aplica, en orden:

1. tarea ya reclamada y todavía vigente por el mismo actor;
2. condición física autorizada con riesgo de seguridad, inocuidad o pérdida;
3. handoff físico presente que requiere recepción o transferencia de custodia;
4. preparación o entrega con ventana comprometida próxima a vencer;
5. existencia recibida cuya falta de ubicación bloquea disponibilidad;
6. conteo asignado con fecha o ventana vigente;
7. traslado o retiro autorizado con necesidad operativa vigente;
8. trabajo ordinario por fecha requerida, creación y clave estable.

Los desempates usan datos autoritativos y una clave estable. El cliente no puede
reordenar la cola enviando prioridad, rol, sede o estado.

##### 5.4. Reclamo y concurrencia

Antes de mutar, la tarea deberá confirmar:

```text
ACTOR_ACTUAL
+
TAREA_TODAVIA_ASIGNABLE
+
VERSION_ESPERADA
+
ESTADO_Y_ETAPA_COMPATIBLES
+
RECURSO_EN_TERRITORIO
+
COMANDO_IDEMPOTENTE
```

Si otra persona tomó, cambió o cerró la tarea, el home no conserva una acción
obsoleta. Muestra el estado `TAREA_RECLAMADA_O_CAMBIADA` y recarga la fuente
autoritativa.

---

#### 6. `NEXO-WAREHOUSE-WORK-QUEUE-CATALOG-001`

| Identificador           | Clase de trabajo      | Entrada mínima                                                                          | Procesos                                               |
| ----------------------- | --------------------- | --------------------------------------------------------------------------------------- | ------------------------------------------------------ |
| `WHQ-ENTRADA`           | Entrada por recibir   | Recepción física con fuente empresarial válida o excepción expresamente autorizada.     | `VPROC-0024`                                           |
| `WHQ-UBICACION`         | Ubicación pendiente   | Existencia recibida que aún requiere LOC o posición compatible.                         | `VPROC-0023`; `VPROC-0024`                             |
| `WHQ-PREPARACION`       | Preparación asignada  | Líneas de abastecimiento asignadas al origen de la bodega activa.                       | `VPROC-0028`                                           |
| `WHQ-HANDOFF`           | Entrega a transporte  | Carga lista que requiere sellado, evidencia y transferencia de custodia.                | `VPROC-0028`                                           |
| `WHQ-RECEPCION_INTERNA` | Recepción interna     | Remisión cuyo destino autorizado es la bodega activa.                                   | `VPROC-0028`                                           |
| `WHQ-CONTEO`            | Conteo asignado       | Sesión con alcance congelado y captura física pendiente.                                | `VPROC-0026`                                           |
| `WHQ-TRASLADO`          | Traslado interno      | Movimiento ordinario entre LOC o posiciones autorizadas.                                | `VPROC-0025`                                           |
| `WHQ-RETIRO`            | Retiro autorizado     | Salida por consumo, uso interno o destino operativo válido.                             | `VPROC-0025`                                           |
| `WHQ-CONDICION`         | Condición o incidente | Reporte, aislamiento o ejecución física condicionada por una decisión autorizada.       | `VPROC-0027`                                           |
| `WHQ-BLOQUEO`           | Bloqueo o aclaración  | Tarea operativa detenida por stock, política, contexto, diferencia o handoff pendiente. | `VPROC-0024`; `VPROC-0025`; `VPROC-0027`; `VPROC-0028` |

Cada clase deberá declarar en implementación:

- consulta autoritativa de elegibilidad;
- responsable o ámbito de asignación;
- estado de entrada;
- comando permitido;
- estado de salida;
- bloqueo estructurado;
- estrategia de idempotencia;
- evento o evidencia resultante;
- destino exacto cuando requiera otro actor.

Una fila de cola no crea un proceso empresarial nuevo. Es una proyección de
trabajo sobre `VPROC-0023` a `VPROC-0028`.

---

#### 7. `NEXO-WAREHOUSE-STAGE-PROJECTION-MATRIX-001`

##### 7.1. Reconciliación

```text
EXPECTED_STAGE_IDS = 40
MATERIALIZED_STAGE_IDS = 40
UNIQUE_STAGE_IDS = 40
MISSING_STAGE_IDS = 0
DUPLICATE_STAGE_IDS = 0
```

##### 7.2. Decisión por etapa

| Etapa            | Proceso      | Trabajo canónico                                                | Tratamiento en el home           | Cola                         | Estado         | Decisión materializada                                                                                                                                          |
| ---------------- | ------------ | --------------------------------------------------------------- | -------------------------------- | ---------------------------- | -------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0023-E01` | `VPROC-0023` | Crear o editar LOC                                              | `CONFIGURACION_EXCLUIDA`         | —                            | `ESPECIFICADO` | No se presenta en el inicio; el bodeguero consume la estructura publicada y no edita el maestro.                                                                |
| `VPROC-0023-E02` | `VPROC-0023` | Crear zonas, niveles y posiciones                               | `CONFIGURACION_EXCLUIDA`         | —                            | `ESPECIFICADO` | No se presenta en el inicio; la estructura física reutilizable pertenece a configuración.                                                                       |
| `VPROC-0023-E03` | `VPROC-0023` | Definir productos permitidos por ubicación                      | `CONFIGURACION_EXCLUIDA`         | —                            | `ESPECIFICADO` | No se presenta en el inicio; la elegibilidad se resuelve como política publicada.                                                                               |
| `VPROC-0023-E04` | `VPROC-0023` | Consultar stock por sede, LOC o posición                        | `REFERENCIA_CONTEXTUAL`          | —                            | `ESPECIFICADO` | Solo se muestra el saldo necesario para ejecutar una tarea autorizada dentro de la bodega activa; no abre un tablero global.                                    |
| `VPROC-0023-E05` | `VPROC-0023` | Abrir una ubicación mediante tablero, kiosco o código           | `ACCION_OPERATIVA`               | `WHQ-UBICACION`              | `ESPECIFICADO` | Puede abrir la LOC o zona resuelta para continuar trabajo físico, sin alterar configuración.                                                                    |
| `VPROC-0024-E01` | `VPROC-0024` | Registrar una entrada de emergencia                             | `EXCEPCION_CONDICIONAL`          | `WHQ-ENTRADA`                | `ESPECIFICADO` | Solo aparece con permiso excepcional exacto, causa obligatoria y ausencia demostrada del flujo ordinario; nunca es acceso predeterminado.                       |
| `VPROC-0024-E02` | `VPROC-0024` | Registrar una entrada correlacionada con orden de compra        | `ACCION_OPERATIVA`               | `WHQ-ENTRADA`                | `ESPECIFICADO` | Se presenta como recepción pendiente desde una fuente empresarial válida, no como formulario libre.                                                             |
| `VPROC-0024-E03` | `VPROC-0024` | Capturar producto, cantidad, unidad y costo                     | `ACCION_DENTRO_DE_TAREA`         | `WHQ-ENTRADA`                | `ESPECIFICADO` | Se captura dentro de la recepción autorizada; el costo protegido no se expone cuando no sea necesario para la verificación física.                              |
| `VPROC-0024-E04` | `VPROC-0024` | Asignar LOC de almacenamiento                                   | `ACCION_OPERATIVA`               | `WHQ-UBICACION`              | `ESPECIFICADO` | Se presenta cuando una existencia recibida conserva ubicación pendiente y existen destinos compatibles.                                                         |
| `VPROC-0024-E05` | `VPROC-0024` | Asignar posición interna                                        | `ACCION_OPERATIVA`               | `WHQ-UBICACION`              | `ESPECIFICADO` | Se presenta después de resolver LOC, compatibilidad y posición autorizadas.                                                                                     |
| `VPROC-0024-E06` | `VPROC-0024` | Publicar, corregir o reversar la entrada                        | `SEPARACION_EXPLICITA`           | `WHQ-ENTRADA`                | `ESPECIFICADO` | El bodeguero puede publicar el ingreso ordinario autorizado; corregir o reversar requiere una decisión supervisora separada y no aparece como acción ordinaria. |
| `VPROC-0025-E01` | `VPROC-0025` | Identificar sede, LOC, posición y producto                      | `ACCION_DENTRO_DE_TAREA`         | `WHQ-TRASLADO`; `WHQ-RETIRO` | `ESPECIFICADO` | El contexto se resuelve desde la tarea, el escaneo o la ubicación autorizada; no se acepta un alcance arbitrario enviado por cliente.                           |
| `VPROC-0025-E02` | `VPROC-0025` | Elegir presentación o unidad de medida                          | `ACCION_DENTRO_DE_TAREA`         | `WHQ-TRASLADO`; `WHQ-RETIRO` | `ESPECIFICADO` | Solo ofrece presentaciones publicadas y compatibles con el producto y la tarea.                                                                                 |
| `VPROC-0025-E03` | `VPROC-0025` | Verificar disponibilidad y alcance                              | `VALIDACION_CONTEXTUAL`          | `WHQ-TRASLADO`; `WHQ-RETIRO` | `ESPECIFICADO` | Habilita o bloquea la mutación con una respuesta autoritativa; no se convierte en indicador global.                                                             |
| `VPROC-0025-E04` | `VPROC-0025` | Consumir stock general                                          | `ACCION_OPERATIVA`               | `WHQ-RETIRO`                 | `ESPECIFICADO` | Se presenta únicamente para un retiro autorizado con motivo, destino y cantidad identificables.                                                                 |
| `VPROC-0025-E05` | `VPROC-0025` | Consumir desde posición o kiosco                                | `ACCION_OPERATIVA`               | `WHQ-RETIRO`                 | `ESPECIFICADO` | Conserva la posición exacta, el actor humano y la confirmación idempotente de la salida.                                                                        |
| `VPROC-0025-E06` | `VPROC-0025` | Transferir entre LOC conservando historial                      | `ACCION_OPERATIVA`               | `WHQ-TRASLADO`               | `ESPECIFICADO` | Solo permite traslados ordinarios dentro del alcance autorizado; los movimientos entre sedes usan remisiones.                                                   |
| `VPROC-0026-E01` | `VPROC-0026` | Abrir sesión de conteo                                          | `SUPERVISION_EXCLUIDA`           | —                            | `ESPECIFICADO` | El inicio muestra sesiones asignadas, pero no concede crear o abrir el control formal.                                                                          |
| `VPROC-0026-E02` | `VPROC-0026` | Congelar alcance y stock de apertura                            | `SISTEMA_O_SUPERVISION`          | —                            | `ESPECIFICADO` | No se presenta como acción; el bodeguero consume el alcance congelado y no puede modificarlo.                                                                   |
| `VPROC-0026-E03` | `VPROC-0026` | Registrar observación por producto                              | `ACCION_OPERATIVA`               | `WHQ-CONTEO`                 | `ESPECIFICADO` | Se presenta para sesiones asignadas y preserva conteo ciego cuando corresponda.                                                                                 |
| `VPROC-0026-E04` | `VPROC-0026` | Registrar múltiples presentaciones o posiciones                 | `ACCION_DENTRO_DE_TAREA`         | `WHQ-CONTEO`                 | `ESPECIFICADO` | Permite capturas desagregadas sin revelar stock teórico antes de la etapa autorizada.                                                                           |
| `VPROC-0026-E05` | `VPROC-0026` | Calcular diferencia                                             | `SUPERVISION_O_SISTEMA`          | —                            | `ESPECIFICADO` | No se presenta durante la captura; la diferencia solo se muestra después del envío y según autoridad.                                                           |
| `VPROC-0026-E06` | `VPROC-0026` | Aplicar reconciliación o ajuste autorizado                      | `SUPERVISION_EXCLUIDA`           | —                            | `ESPECIFICADO` | El bodeguero no aprueba ni publica ajustes por esta proyección; observa el resultado cuando afecte su tarea.                                                    |
| `VPROC-0026-E07` | `VPROC-0026` | Cerrar sesión y conservar historial                             | `SUPERVISION_EXCLUIDA`           | —                            | `ESPECIFICADO` | El envío de observaciones no equivale a cerrar la sesión ni aprobar la diferencia.                                                                              |
| `VPROC-0027-E01` | `VPROC-0027` | Detectar alerta, daño, pérdida, merma o vencimiento             | `CAPTURA_OPERATIVA_SEPARADA`     | `WHQ-CONDICION`              | `ESPECIFICADO` | Puede reportar la novedad y aportar evidencia; no clasifica prioridad ni decide disposición.                                                                    |
| `VPROC-0027-E02` | `VPROC-0027` | Identificar producto, existencia, lote, LOC y condición         | `ACCION_DENTRO_DE_TAREA`         | `WHQ-CONDICION`              | `ESPECIFICADO` | Debe identificar el objeto físico y su ubicación antes de cualquier acción.                                                                                     |
| `VPROC-0027-E03` | `VPROC-0027` | Poner en cuarentena o bloquear                                  | `EJECUCION_CONDICIONAL`          | `WHQ-CONDICION`              | `ESPECIFICADO` | Solo ejecuta el aislamiento físico cuando exista instrucción autorizada; no impone ni levanta unilateralmente el bloqueo.                                       |
| `VPROC-0027-E04` | `VPROC-0027` | Evaluar condición, temperatura y aptitud                        | `SUPERVISION_CALIDAD_EXCLUIDA`   | —                            | `ESPECIFICADO` | El bodeguero aporta lecturas y evidencia, pero la evaluación pertenece a control o calidad.                                                                     |
| `VPROC-0027-E05` | `VPROC-0027` | Decidir liberación, merma, pérdida, rechazo o disposición       | `SUPERVISION_CALIDAD_EXCLUIDA`   | —                            | `ESPECIFICADO` | La decisión no aparece en el home operativo.                                                                                                                    |
| `VPROC-0027-E06` | `VPROC-0027` | Ejecutar movimiento físico y efecto de stock                    | `ACCION_CONDICIONADA_A_DECISION` | `WHQ-CONDICION`              | `ESPECIFICADO` | Puede ejecutar la instrucción autorizada y registrar evidencia sin modificar su decisión.                                                                       |
| `VPROC-0027-E07` | `VPROC-0027` | Conservar evidencia y cerrar caso                               | `SUPERVISION_EXCLUIDA`           | —                            | `ESPECIFICADO` | El bodeguero adjunta evidencia de ejecución; el cierre permanece separado.                                                                                      |
| `VPROC-0028-E01` | `VPROC-0028` | Crear solicitud interna                                         | `OTRO_ACTOR_EXCLUIDO`            | —                            | `ESPECIFICADO` | Pertenece al solicitante y no se reutiliza como acción del bodeguero.                                                                                           |
| `VPROC-0028-E02` | `VPROC-0028` | Aplicar ruta, producto y política de solicitud                  | `CONFIGURACION_RESUELTA`         | —                            | `ESPECIFICADO` | La resolución vigente se consume en servidor; no se muestra como configuración.                                                                                 |
| `VPROC-0028-E03` | `VPROC-0028` | Crear origen y fulfillment por línea                            | `SUPERVISION_RESUELTA`           | `WHQ-PREPARACION`            | `ESPECIFICADO` | El bodeguero ve únicamente líneas ya asignadas a su origen; no crea ni reasigna fuentes.                                                                        |
| `VPROC-0028-E04` | `VPROC-0028` | Elegir LOC, posición y cantidad de picking                      | `ACCION_OPERATIVA`               | `WHQ-PREPARACION`            | `ESPECIFICADO` | Se presenta dentro de la preparación asignada con stock y ubicación contextual.                                                                                 |
| `VPROC-0028-E05` | `VPROC-0028` | Preparar, dejar listo o registrar faltante                      | `ACCION_OPERATIVA`               | `WHQ-PREPARACION`            | `ESPECIFICADO` | Registra cantidad preparada, faltante y evidencia sin sobrescribir lo solicitado.                                                                               |
| `VPROC-0028-E06` | `VPROC-0028` | Cargar, sellar y despachar                                      | `HANDOFF_OPERATIVO_CONDICIONAL`  | `WHQ-HANDOFF`                | `ESPECIFICADO` | Permite dejar lista la carga y registrar entrega de custodia al actor autorizado; no inicia tránsito ni sustituye firma o documento.                            |
| `VPROC-0028-E07` | `VPROC-0028` | Transportar y confirmar tránsito                                | `OTRO_ACTOR_EXCLUIDO`            | —                            | `ESPECIFICADO` | Pertenece al conductor o responsable de ruta; el bodeguero solo observa el handoff propio.                                                                      |
| `VPROC-0028-E08` | `VPROC-0028` | Recibir parcial o totalmente                                    | `ACCION_OPERATIVA_CONDICIONAL`   | `WHQ-RECEPCION_INTERNA`      | `ESPECIFICADO` | Solo aparece cuando la bodega activa es destino autorizado y se preserva segregación frente a quien preparó el mismo extremo.                                   |
| `VPROC-0028-E09` | `VPROC-0028` | Resolver faltante, sobrante, daño, rechazo, devolución o cierre | `CAPTURA_SEPARADA_DE_DECISION`   | `WHQ-BLOQUEO`                | `ESPECIFICADO` | Puede registrar cantidades y evidencia de la diferencia; la resolución y el cierre pertenecen a supervisión.                                                    |

---

#### 8. `NEXO-WAREHOUSE-ROUTE-DISPOSITION-001`

##### 8.1. Reconciliación

Las treinta rutas siguientes ya existen en el inventario canónico de sesenta y
cuatro rutas. Esta tarea no crea rutas nuevas.

```text
EXPECTED_RELEVANT_ROUTE_IDS = 30
MATERIALIZED_RELEVANT_ROUTE_IDS = 30
UNIQUE_RELEVANT_ROUTE_IDS = 30
MISSING_RELEVANT_ROUTE_IDS = 0
DUPLICATE_RELEVANT_ROUTE_IDS = 0
```

##### 8.2. Decisión por ruta

| Ruta             | Patrón existente                           | Disposición para bodeguero     | Estado         | Decisión materializada                                                                                        |
| ---------------- | ------------------------------------------ | ------------------------------ | -------------- | ------------------------------------------------------------------------------------------------------------- |
| `NEXO-ROUTE-001` | `/`                                        | `PROYECTAR_HOME_BODEGUERO`     | `ESPECIFICADO` | Inicio por colas operativas del actor y la bodega activa; no conserva el tablero agregado actual.             |
| `NEXO-ROUTE-002` | `/inventory/adjust`                        | `EXCLUIR_SUPERVISION`          | `ESPECIFICADO` | No aparece como acción del bodeguero; un ajuste autorizado se tramita por su flujo separado.                  |
| `NEXO-ROUTE-017` | `/inventory/count-initial`                 | `PROYECTAR_COLA_ASIGNADA`      | `ESPECIFICADO` | Solo muestra sesiones asignadas o participadas; no habilita abrir, administrar o cerrar sesiones.             |
| `NEXO-ROUTE-018` | `/inventory/count-initial/session/[id]`    | `DIVIDIR_CAPTURA_Y_DECISION`   | `ESPECIFICADO` | Permite captura operativa de la sesión asignada y excluye diferencia, aprobación y cierre no autorizados.     |
| `NEXO-ROUTE-019` | `/inventory/entries`                       | `CONTEXTUALIZAR_POR_FUENTE`    | `ESPECIFICADO` | Se abre desde una recepción o fuente válida; la entrada de emergencia queda oculta salvo permiso excepcional. |
| `NEXO-ROUTE-020` | `/inventory/locations`                     | `REFERENCIA_ACOTADA`           | `ESPECIFICADO` | Consulta la estructura de la bodega activa sin controles de edición.                                          |
| `NEXO-ROUTE-021` | `/inventory/locations/[id]`                | `REFERENCIA_ACOTADA`           | `ESPECIFICADO` | Muestra detalle y stock de una LOC autorizada; configuración y control global quedan excluidos.               |
| `NEXO-ROUTE-022` | `/inventory/locations/[id]/board`          | `ACCION_OPERATIVA`             | `ESPECIFICADO` | Abre trabajo contextual sobre una LOC y sus tareas disponibles.                                               |
| `NEXO-ROUTE-023` | `/inventory/locations/[id]/kiosk-withdraw` | `ACCION_OPERATIVA`             | `ESPECIFICADO` | Ejecuta retiro desde posición con sesión humana activa y alcance exacto.                                      |
| `NEXO-ROUTE-025` | `/inventory/locations/open`                | `ENTRADA_CONTEXTUAL`           | `ESPECIFICADO` | Resuelve LOC o código y redirige a una tarea autorizada; no concede permisos.                                 |
| `NEXO-ROUTE-026` | `/inventory/locations/zone`                | `ACCION_OPERATIVA`             | `ESPECIFICADO` | Opera una zona autorizada sin modificar su estructura.                                                        |
| `NEXO-ROUTE-028` | `/inventory/lpns`                          | `REFERENCIA_ACOTADA`           | `ESPECIFICADO` | Consulta LPN bajo custodia cuando exista; el ciclo de vida completo permanece reservado.                      |
| `NEXO-ROUTE-029` | `/inventory/movements`                     | `REFERENCIA_CONTEXTUAL`        | `ESPECIFICADO` | Muestra movimientos relacionados con la tarea o recurso; no expone el ledger global como home.                |
| `NEXO-ROUTE-030` | `/inventory/production-batches`            | `REFERENCIA_CONTEXTUAL`        | `ESPECIFICADO` | Muestra el lote productivo asociado a una entrada sin operar FOGO.                                            |
| `NEXO-ROUTE-031` | `/inventory/remissions`                    | `DIVIDIR_BANDEJA_BODEGA`       | `ESPECIFICADO` | Proyecta solo preparación, handoff, recepción y bloqueos atribuibles a la bodega activa.                      |
| `NEXO-ROUTE-032` | `/inventory/remissions/[id]`               | `DIVIDIR_ACCIONES_POR_ETAPA`   | `ESPECIFICADO` | El detalle es común como lectura, pero solo muestra comandos del actor y etapa actuales.                      |
| `NEXO-ROUTE-034` | `/inventory/remissions/conductor`          | `EXCLUIR_OTRO_ACTOR`           | `ESPECIFICADO` | No aparece en el inicio del bodeguero.                                                                        |
| `NEXO-ROUTE-035` | `/inventory/remissions/fulfillment`        | `REFERENCIA_ASIGNADA`          | `ESPECIFICADO` | Muestra asignaciones ya resueltas; el bodeguero no crea ni reasigna fulfillment.                              |
| `NEXO-ROUTE-036` | `/inventory/remissions/prepare`            | `ACCION_OPERATIVA`             | `ESPECIFICADO` | Concentra picking y preparación de solicitudes asignadas al origen autorizado.                                |
| `NEXO-ROUTE-037` | `/inventory/remissions/receive`            | `ACCION_OPERATIVA_CONDICIONAL` | `ESPECIFICADO` | Solo se abre cuando la bodega activa es destino y el actor puede aceptar físicamente.                         |
| `NEXO-ROUTE-038` | `/inventory/remissions/transit`            | `REFERENCIA_DE_HANDOFF`        | `ESPECIFICADO` | Muestra custodia transferida o entrega pendiente; no habilita iniciar ni confirmar tránsito.                  |
| `NEXO-ROUTE-052` | `/inventory/stock`                         | `REFERENCIA_CONTEXTUAL`        | `ESPECIFICADO` | Muestra stock de la bodega activa necesario para una tarea; no actúa como tablero supervisor.                 |
| `NEXO-ROUTE-053` | `/inventory/stock/assign-location`         | `ACCION_OPERATIVA`             | `ESPECIFICADO` | Ejecuta putaway sobre existencia recibida y destino compatible.                                               |
| `NEXO-ROUTE-054` | `/inventory/transfers`                     | `ACCION_OPERATIVA`             | `ESPECIFICADO` | Ejecuta traslados ordinarios dentro del alcance autorizado.                                                   |
| `NEXO-ROUTE-055` | `/inventory/warehouse`                     | `HEREDAR_HOME`                 | `ESPECIFICADO` | Alias técnico que hereda la proyección del inicio del bodeguero y no constituye otra superficie.              |
| `NEXO-ROUTE-056` | `/inventory/withdraw`                      | `ACCION_OPERATIVA`             | `ESPECIFICADO` | Ejecuta retiro trazable con origen, destino, unidad, motivo y disponibilidad verificados.                     |
| `NEXO-ROUTE-057` | `/kiosk/[slug]`                            | `HEREDAR_TAREA`                | `ESPECIFICADO` | Resuelve una superficie contextual y conserva sesión humana, actor y tarea.                                   |
| `NEXO-ROUTE-058` | `/l/[code]`                                | `HEREDAR_TAREA`                | `ESPECIFICADO` | El deep link de LOC revalida contexto y abre únicamente la acción permitida.                                  |
| `NEXO-ROUTE-062` | `/printing/jobs`                           | `REFERENCIA_DE_TRABAJO_PROPIO` | `ESPECIFICADO` | Muestra trabajos de impresión originados por la operación propia; no monitorea la cola global.                |
| `NEXO-ROUTE-064` | `/scanner`                                 | `HEREDAR_TAREA`                | `ESPECIFICADO` | El escáner es utilidad de la tarea invocante y no una navegación autónoma.                                    |

Las otras treinta y cuatro rutas conservan la disposición aprobada en
`NEXO-ROUTE-LANE-DISPOSITION-001` y no se convierten en accesos del home por
omisión.

---

#### 9. Reglas de acciones y referencias

##### 9.1. Acciones operativas

Una acción aparece solo cuando la misma respuesta autoritativa entrega:

- tarea o recurso;
- comando permitido;
- estado y etapa esperados;
- alcance territorial;
- versión;
- requisitos de turno o check-in;
- condición de idempotencia.

La interfaz no reconstruye autoridad desde nombres de roles, estados locales o
rutas visibles.

##### 9.2. Referencias de solo lectura

Stock, LOC, posiciones, movimientos, lotes, LPN, políticas publicadas e
impresión se muestran solo cuando apoyan una tarea. No se convierten en:

- inventario multisede;
- investigación supervisora;
- editor de catálogo;
- configuración de abastecimiento;
- monitor global de impresión;
- acceso financiero.

##### 9.3. Excepciones

Entrada de emergencia, retiro excepcional, corrección, reversión, cuarentena,
disposición y diferencias no comparten el camino ordinario. Toda excepción
exige causa estructurada, autoridad exacta, evidencia, vigencia y trazabilidad.

---

#### 10. Dispositivos compartidos, escaneo e impresión

En dispositivo compartido:

1. el dispositivo conserva identidad técnica propia;
2. cada mutación exige sesión humana activa;
3. la tarea se atribuye al actor humano, dispositivo, turno, sede y área;
4. el escaneo solo resuelve un recurso y no concede autoridad;
5. la expiración de sesión bloquea nuevas mutaciones;
6. cambiar de persona invalida la tarea reclamada y vuelve a resolver la cola;
7. una impresión conserva origen, plantilla publicada, recurso y actor;
8. un reintento de impresión no duplica movimientos empresariales.

El home no ofrece diseñador, setup o monitor global de impresión al bodeguero.

---

#### 11. `NEXO-WAREHOUSE-HOME-STATE-CONTRACT-001`

| Estado                       | Comportamiento obligatorio                                                                  |
| ---------------------------- | ------------------------------------------------------------------------------------------- |
| `RESOLVIENDO_CONTEXTO`       | Todavía no se muestran colas ni conteos.                                                    |
| `CARGANDO_TRABAJO`           | Se conserva el contexto visible y no se habilitan mutaciones.                               |
| `TRABAJO_DISPONIBLE`         | Se presenta una tarea prioritaria y sus colas acotadas.                                     |
| `SIN_TRABAJO_ASIGNADO`       | Se confirma que no existen tareas accionables dentro del alcance consultado.                |
| `DATOS_PARCIALES`            | Se identifica qué cola o referencia falta y no se totaliza como si fuera completa.          |
| `ERROR_RECUPERABLE`          | Se permite reintentar una lectura sin duplicar comandos.                                    |
| `SIN_AUTORIZACION`           | Se ocultan datos y acciones; se conserva un mensaje de bloqueo sin filtrar información.     |
| `CONTEXTO_REVOCADO`          | Se invalida la cola y cualquier tarea abierta antes de una nueva mutación.                  |
| `CONECTIVIDAD_INCIERTA`      | No se confirma éxito ni se habilita una nueva mutación sin reconciliar el resultado previo. |
| `TAREA_RECLAMADA_O_CAMBIADA` | Se informa conflicto de propiedad, versión o estado y se recarga la fuente autoritativa.    |

Reglas transversales:

- ninguna mutación se confirma solo porque el cliente haya enviado una petición;
- al reconectar se consulta primero el resultado previo mediante clave
  idempotente;
- una cola parcial no publica totales definitivos;
- una autorización revocada elimina comandos visibles y bloquea la mutación;
- el modo offline no permite movimientos, recepciones, conteos enviados,
  handoffs ni efectos de stock sin un contrato posterior explícito;
- el orden local nunca sustituye la prioridad autoritativa.

---

#### 12. Accesibilidad y adaptación física

El diseño deberá:

- permitir operación completa por teclado cuando la superficie lo admita;
- conservar foco visible y orden de lectura coherente;
- no depender únicamente de color para prioridad, bloqueo o estado;
- usar objetivos táctiles suficientes en tablet y kiosco;
- mantener cantidad, unidad, origen y destino juntos;
- confirmar acciones irreversibles o de transferencia de custodia;
- reducir escritura libre mediante motivos y opciones estructuradas;
- tolerar orientación vertical y horizontal sin ocultar la siguiente acción;
- mostrar el código o identidad legible además del código escaneable;
- distinguir claramente lectura, captura y confirmación.

---

#### 13. Estado técnico actual y brecha

El código inspeccionado de `vento-nexo` contiene un inicio agregado que:

- determina un modo operativo principalmente por tipo de sede y exclusión de
  roles de gerencia, no por una proyección exclusiva de `bodeguero`;
- en centro de producción prioriza preparación y entrada, pero omite del modo
  enfocado las colas de ubicación, conteo, traslado, retiro, condición y
  handoff;
- consulta hasta ocho solicitudes legacy por sede y usa estado general de la
  solicitud como aproximación de trabajo inmediato;
- enlaza preparación, entradas, stock, movimientos, ubicaciones y configuración
  mediante tarjetas de acceso, en vez de proyectar una cola material por tarea;
- mantiene accesos de configuración o rutas de abastecimiento próximos al
  trabajo operativo;
- no materializa las diez clases de cola ni las cuarenta decisiones de etapa de
  esta tarea.

La evidencia desplegada consumida desde `NEXO-UX-001` confirma uso material de
stock, movimientos, entradas, traslados, conteos y solicitudes, pero también
registra fulfillments bloqueados, cero picks y ausencia de adopción del modelo
nuevo de envíos y recibos. Esos datos justifican la separación entre cola
especificada y soporte físico actual; no prueban que el home objetivo exista.

| Elemento                        | Estado                   | Condición de salida                                   |
| ------------------------------- | ------------------------ | ----------------------------------------------------- |
| contrato del home del bodeguero | `ESPECIFICADO`           | implementación conforme a esta tarea                  |
| catálogo de diez colas          | `ESPECIFICADO`           | consultas y comandos ejecutables por clase            |
| proyección de cuarenta etapas   | `ESPECIFICADO`           | binding con estados, actores, datos y permisos reales |
| disposición de treinta rutas    | `ESPECIFICADO`           | navegación, guards y proyecciones implementados       |
| inicio agregado actual          | `IMPLEMENTADO_PARCIAL`   | separar actor, carril, cola y autoridad               |
| home exclusivo del bodeguero    | `NO_IMPLEMENTADO`        | construir proyección y componentes                    |
| validación operativa en bodega  | `PENDIENTE_DE_EVIDENCIA` | prototipo, piloto y certificación física              |

---

#### 14. Requisitos de prueba derivados

Esta tarea crea seis requisitos y no modifica, difiere, descarta ni declara
obsoleto ningún requisito histórico:

| Identificador   | Regla protegida resumida                                                                                                                  | Estado inicial |
| --------------- | ----------------------------------------------------------------------------------------------------------------------------------------- | -------------- |
| `TREQ-NEXO-056` | El home se resuelve desde actor efectivo, rol `bodeguero`, turno, área warehouse, permiso, territorio y relación operativa autoritativos. | `IDENTIFICADO` |
| `TREQ-NEXO-057` | La arquitectura conserva ocho secciones, una única acción primaria y diez colas priorizadas en servidor.                                  | `IDENTIFICADO` |
| `TREQ-NEXO-058` | Las cuarenta etapas separan trabajo de bodega, referencia contextual, otros actores, supervisión y configuración.                         | `IDENTIFICADO` |
| `TREQ-NEXO-059` | Las treinta rutas relevantes conservan disposición por actor, etapa y tarea, y el acceso directo falla cerrado.                           | `IDENTIFICADO` |
| `TREQ-NEXO-060` | Reclamo, concurrencia, dispositivo compartido, escaneo, handoff e idempotencia conservan atribución y evitan duplicidad.                  | `IDENTIFICADO` |
| `TREQ-NEXO-061` | Los diez estados de interfaz no presentan datos parciales, conectividad incierta, conflicto o revocación como éxito.                      | `IDENTIFICADO` |

Los seis requisitos permanecen pendientes de implementación, automatización y
evidencia.

---

#### 15. Criterios de aceptación

La tarea queda documentalmente completa cuando se confirme que:

- la audiencia primaria es `BODEGA_Y_ABASTECIMIENTO` mediante `bodeguero`;
- el home pertenece solo al carril `OPERACION`;
- existen ocho secciones y una sola acción primaria;
- existen diez clases de cola con identidad única;
- las cuarenta etapas tienen una decisión explícita;
- las treinta rutas relevantes tienen disposición explícita;
- no se inventaron URLs, procesos, actores ni permisos;
- entrada ordinaria nace de una fuente válida y la emergencia es excepcional;
- preparar no concede tránsito y recibir no permite autoaceptación incompatible;
- contar no concede ajustar ni cerrar;
- reportar condición no concede decidir disposición;
- configuración, supervisión y finanzas permanecen excluidas;
- stock y movimientos solo se presentan como referencia contextual;
- la prioridad se resuelve en servidor con desempate estable;
- los conflictos de versión o propiedad bloquean la mutación obsoleta;
- los diez estados de interfaz fallan cerrados;
- el dispositivo compartido exige sesión humana;
- se distinguen `ESPECIFICADO`, `IMPLEMENTADO_PARCIAL`, `NO_IMPLEMENTADO` y
  `PENDIENTE_DE_EVIDENCIA`;
- se crean exactamente `TREQ-NEXO-056` a `TREQ-NEXO-061`;
- `NEXO-UX-005` permanece únicamente reservada.

---

#### 16. `NEXO-WAREHOUSE-HOME-HANDOFF-001`

| Destino                        | Handoff aprobado                                                                                                             |
| ------------------------------ | ---------------------------------------------------------------------------------------------------------------------------- |
| `NEXO-UX-005`                  | diseñar el inicio del conductor sin reutilizar colas, custodia o comandos del bodeguero                                      |
| `NEXO-UX-006`                  | diseñar la recepción de sede y diferencias desde la función receptora independiente                                          |
| `NEXO-UX-007`                  | diseñar control global, autorizaciones, diferencias, ajustes y cierres fuera del home operativo                              |
| `NEXO-UX-008`                  | organizar navegación por tareas, colas y proyecciones, no por rutas técnicas                                                 |
| `NEXO-UX-010`                  | definir asignación, reserva, picking, faltante y preparación por línea                                                       |
| `NEXO-UX-011`                  | definir documento, sellado, firma, despacho y transferencia de custodia                                                      |
| `NEXO-UX-013`                  | definir recepción, cantidades, diferencias y cierre sin autoaceptación                                                       |
| `NEXO-UX-014` a `NEXO-UX-019`  | diseñar entradas, ubicaciones, movimientos, retiros, conteos y ajustes respetando las separaciones aprobadas                 |
| `NEXO-UX-020` a `NEXO-UX-025`  | cerrar escaneo, cantidades, errores, tablet, conectividad y piloto operativo                                                 |
| paquete de implementación NEXO | construir proyecciones, consultas, comandos, componentes, guards, pruebas y observabilidad cuando la continuidad lo autorice |
| certificación posterior        | validar con bodegueros reales, tablets, kioscos, impresoras, escáneres, red intermitente y operación física                  |

Ningún destino anterior se inicia mediante esta tarea.

---

#### 17. Continuidad canónica

**ÚLTIMA TAREA APROBADA**

`NEXO-UX-003 — Diseñar inicio para solicitante`

**TAREA ACTUAL APROBADA**

`NEXO-UX-004 — Diseñar inicio para bodeguero`

**SIGUIENTE TAREA RESERVADA**

`NEXO-UX-005 — Diseñar inicio para conductor`


### ✅ NEXO-UX-005 — Diseñar inicio para conductor

**Estado:** APROBADA
**Tarea anterior:** `NEXO-UX-004 — Diseñar inicio para bodeguero` — APROBADA
**Tarea siguiente:** `NEXO-UX-006 — Diseñar inicio para receptor` — RESERVADA
**Tipo de tarea:** documental; diseño funcional completo del inicio operativo del conductor, trabajo asignado, prioridad, custodia, ruta, composición de capacidades, estados, autorización, decisiones por etapa y ruta, y handoff de implementación
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/K_NEXO/04_EXPERIENCIA_DE_INVENTARIO_LOGISTICA_Y_ACTIVOS.md`
**Repositorio de aplicación inspeccionado:** `vento-nexo`
**Artefactos producidos:** `NEXO-DRIVER-HOME-CONTRACT-001`, `NEXO-DRIVER-HOME-INFORMATION-ARCHITECTURE-001`, `NEXO-DRIVER-WORK-QUEUE-CATALOG-001`, `NEXO-DRIVER-CAPABILITY-COMPOSITION-CONTRACT-001`, `NEXO-DRIVER-STAGE-PROJECTION-MATRIX-001`, `NEXO-DRIVER-ROUTE-DISPOSITION-001`, `NEXO-DRIVER-HOME-STATE-CONTRACT-001` y `NEXO-DRIVER-HOME-HANDOFF-001`
**Decisiones consumidas:** `NEXO-UX-LANE-CONTRACT-001`; `NEXO-ASIS-STAGE-LANE-MATRIX-001`; `NEXO-ROUTE-LANE-DISPOSITION-001`; `NEXO-REQUESTER-HOME-CONTRACT-001`; `NEXO-WAREHOUSE-HOME-CONTRACT-001`; `NEXO-WAREHOUSE-WORK-QUEUE-CATALOG-001`; `AUTH-RBAC-018`; `VPROC-0028`; inventario `NEXO-ROUTE-001` a `NEXO-ROUTE-064`; requisitos `TREQ-*` vigentes; código actual de `vento-nexo`
**Cambios físicos autorizados:** ninguno; no modifica código, rutas, permisos, datos, remisiones, stock, movimientos, Supabase, migraciones, RLS, configuración ni despliegues

---

#### 1. Propósito

Diseñar el inicio operativo de NEXO para la función `conductor_logistica`, de
modo que la persona identifique y continúe únicamente el trabajo de transporte
que le fue asignado, conozca la carga bajo su custodia, la siguiente parada y
los bloqueos vigentes, y pueda componer otras capacidades operativas sin
confundirlas con la autoridad del conductor.

La regla canónica es:

```text
ACTOR HUMANO EFECTIVO
+
TURNO Y CHECK-IN VIGENTES CUANDO APLIQUEN
+
FUNCION OPERATIVA conductor_logistica
+
RUTA, VEHICULO U OPERACION ASIGNADOS
+
PERMISO EXACTO Y TERRITORIO RESUELTOS EN SERVIDOR
+
CUSTODIA Y VERSION VIGENTES
+
PRIORIDAD OPERATIVA AUTORITATIVA
→
INICIO DEL CONDUCTOR
```

La proyección visual no concede autoridad. El nombre del cargo, una ruta
visible, un vehículo, una sede, un dispositivo, un PIN o el conocimiento del
identificador no autorizan leer, aceptar custodia, iniciar tránsito, entregar,
recibir, ajustar, cancelar ni cerrar una remisión.

---

#### 2. Resultado material

Se aprueban ocho artefactos documentales consumibles:

1. `NEXO-DRIVER-HOME-CONTRACT-001`, que define audiencia, contexto,
   asignación, custodia, autoridad y límites;
2. `NEXO-DRIVER-HOME-INFORMATION-ARCHITECTURE-001`, que materializa ocho
   secciones y una única acción primaria;
3. `NEXO-DRIVER-WORK-QUEUE-CATALOG-001`, que define ocho colas propias de
   recogida, custodia, tránsito, parada, entrega, incidente, retorno y bloqueo;
4. `NEXO-DRIVER-CAPABILITY-COMPOSITION-CONTRACT-001`, que resuelve seis casos
   de composición, incluido el actor que prepara y conduce;
5. `NEXO-DRIVER-STAGE-PROJECTION-MATRIX-001`, que decide las nueve etapas de
   `VPROC-0028` para esta proyección;
6. `NEXO-DRIVER-ROUTE-DISPOSITION-001`, que decide dieciséis rutas existentes
   sin inventar URLs ni convertir navegación en permiso;
7. `NEXO-DRIVER-HOME-STATE-CONTRACT-001`, que define catorce estados de carga,
   vacío, conflicto, autorización, versión y conectividad;
8. `NEXO-DRIVER-HOME-HANDOFF-001`, que separa diseño, implementación,
   contratos atómicos, pruebas y certificación posteriores.

Cobertura materializada:

| Elemento                                  | Total esperado | Total materializado | Faltantes | Duplicados |
| ----------------------------------------- | -------------: | ------------------: | --------: | ---------: |
| Procesos canónicos reconciliados          |              1 |                   1 |         0 |          0 |
| Etapas canónicas decididas                |              9 |                   9 |         0 |          0 |
| Clases de cola del conductor              |              8 |                   8 |         0 |          0 |
| Casos de composición de capacidades       |              6 |                   6 |         0 |          0 |
| Rutas relevantes decididas                |             16 |                  16 |         0 |          0 |
| Secciones obligatorias                    |              8 |                   8 |         0 |          0 |
| Acciones primarias                        |              1 |                   1 |         0 |          0 |
| Estados de interfaz                       |             14 |                  14 |         0 |          0 |
| Requisitos de prueba nuevos o modificados |              7 |                   7 |         0 |          0 |

La tarea deja el diseño en estado `ESPECIFICADO`. No declara el inicio dedicado
`IMPLEMENTADO` ni `VALIDADO`.

---

#### 3. Alcance funcional

##### 3.1. Incluido

- inicio del conductor resuelto por función, asignación y custodia;
- cargas preparadas y asignadas para recogida;
- contraste de manifiesto, bultos, LPN, sellos, vehículo, origen y destino;
- aceptación explícita de custodia e inicio de tránsito;
- carga bajo custodia, ruta activa y siguiente parada;
- entrega física y handoff como estados diferenciados de la recepción;
- incidentes, entrega fallida y retorno como colas reconocibles aunque sus
  capacidades atómicas continúen pendientes;
- prioridad y desempate autoritativos;
- estados vacíos, revocación, conflicto, datos parciales y red intermitente;
- composición entre preparación y conducción para una misma persona;
- decisión explícita por etapa y ruta relevante;
- diagnóstico de las superficies actuales de `vento-nexo`.

##### 3.2. Excluido

- creación o edición de solicitudes;
- asignación de origen, fulfillment, conductor, ruta, vehículo o parada;
- preparación concedida por el solo hecho de ser conductor;
- modificación de cantidades, picks, manifiestos, sellos o bultos preparados;
- recepción en nombre del destino;
- autoaceptación de diferencias;
- ajustes, cancelaciones, cierres, overrides o decisiones supervisoras;
- configuración de rutas, ventanas, productos, políticas o vehículos;
- monitoreo global de conductores o desempeño;
- definición detallada del documento, despacho, entrega, incidente o retorno;
- cambios en código, datos, permisos o Supabase;
- validación operativa, móvil, offline o de vehículo.

---

#### 4. `NEXO-DRIVER-HOME-CONTRACT-001`

##### 4.1. Audiencia y función activa

La audiencia primaria es la función operativa `conductor_logistica`. Esta
función es temporal y contextual; no equivale a un cargo permanente, un
vehículo, un usuario técnico ni una autoridad logística global.

El inicio deberá resolver como mínimo:

| Componente        | Regla                                                           |
| ----------------- | --------------------------------------------------------------- |
| principal técnico | identidad autenticada y vigente                                 |
| actor efectivo    | persona empresarial responsable de la acción                    |
| función activa    | participación como conductor para la jornada                    |
| turno y check-in  | vigentes cuando el contrato de la acción los exija              |
| asignación        | ruta, vehículo, operación, parada o remisión vinculada al actor |
| territorio        | origen, destinos y paradas autorizados                          |
| permiso           | capacidad exacta para lectura o transición                      |
| custodia          | actor custodio, estado, versión y momento de transferencia      |
| dispositivo       | contexto técnico sin autoridad empresarial propia               |
| conectividad      | condición necesaria para confirmar o reconciliar mutaciones     |

Toda ausencia o conflicto falla cerrado.

##### 4.2. Alcance de datos

Una operación solo puede aparecer cuando exista una relación autoritativa:

```text
ACTOR_ASIGNADO_A_OPERACION
ACTOR_ASIGNADO_A_RUTA
ACTOR_ASIGNADO_A_VEHICULO_EN_JORNADA
ACTOR_CUSTODIO_VIGENTE
ACTOR_REQUERIDO_PARA_HANDOFF
```

No bastan la misma empresa, sede, fecha, origen, destino, tipo de ruta, estado,
permiso genérico o conocimiento de la URL.

##### 4.3. Carril funcional

El inicio pertenece al carril `OPERACION`. Puede incluir referencias
contextuales de solo lectura, pero excluye:

- monitoreo y decisión de `SUPERVISION`;
- maestros y políticas de `CONFIGURACION`;
- utilidades sin una tarea invocante;
- colas de solicitante, bodeguero o receptor como si fueran autoridad del
  conductor.

##### 4.4. Regla de custodia

La custodia cambia únicamente mediante un hecho explícito, autorizado,
versionado e idempotente. Como mínimo deberá conservar:

- actor que entrega;
- actor que acepta;
- remisión o shipment;
- versión de manifiesto;
- bultos, LPN y sellos;
- origen, destino y vehículo;
- fecha y hora de servidor;
- estado anterior y posterior;
- evidencia o causa de rechazo;
- clave idempotente.

Preparación, custodia, tránsito, entrega física y recepción son hechos
diferentes aunque una misma persona ejecute más de una función.

---

#### 5. `NEXO-DRIVER-HOME-INFORMATION-ARCHITECTURE-001`

##### 5.1. Orden obligatorio

| Orden | Sección                            | Propósito                                                                                    | Acción permitida                                               |
| ----: | ---------------------------------- | -------------------------------------------------------------------------------------------- | -------------------------------------------------------------- |
|     1 | Contexto de jornada                | mostrar actor, función, turno, check-in, ruta, vehículo y condición de custodia              | cambiar contexto solo mediante el selector canónico autorizado |
|     2 | Siguiente tarea                    | presentar una única prioridad autoritativa                                                   | `CONTINUAR_SIGUIENTE_TAREA`                                    |
|     3 | Por recoger                        | cargas preparadas, asignadas y dentro de ventana                                             | abrir verificación de recogida                                 |
|     4 | Bajo mi custodia                   | cargas cuya custodia pertenece al actor                                                      | continuar tránsito, parada o handoff válido                    |
|     5 | Ruta y próxima parada              | secuencia asignada y siguiente destino autorizado                                            | abrir detalle de parada o navegación permitida                 |
|     6 | Entregas y handoffs                | cargas presentadas o próximas a transferencia                                                | ejecutar solo la capacidad atómica disponible                  |
|     7 | Incidentes y bloqueos              | diferencias, seguridad, entrega fallida, retorno o conflicto                                 | reportar o consultar resolución según autoridad                |
|     8 | Funciones adicionales y utilidades | acceso separado a preparación u otra función realmente concedida y herramientas contextuales | cambiar de función o invocar utilidad sin mezclar comandos     |

Las secciones pueden estar vacías, pero no se sustituyen por indicadores
supervisores, configuración, rutas ajenas ni métricas de productividad.

##### 5.2. Acción primaria

La única acción primaria es:

```text
CONTINUAR_SIGUIENTE_TAREA
```

Se habilita solo cuando el servidor devuelve una tarea vigente con actor,
función, asignación, etapa, permiso, territorio, versión y custodia
compatibles. La acción no recibe del cliente la prioridad, el rol, la sede, el
estado ni el destino como autoridad.

##### 5.3. Tarjeta mínima

Cada carga o tarea visible muestra como mínimo:

| Campo                | Regla                                                |
| -------------------- | ---------------------------------------------------- |
| identificador humano | código estable de remisión, shipment o tarea         |
| origen y destino     | únicamente los extremos necesarios para la operación |
| ruta y parada        | ruta asignada y siguiente parada cuando existan      |
| vehículo             | identificador operativo mínimo cuando esté asignado  |
| manifiesto           | versión y resumen de bultos, LPN y sellos            |
| etapa y estado       | valores derivados de hechos canónicos                |
| custodia             | actor o condición de custodia vigente                |
| ventana              | hora confirmada, nunca inventada por cliente         |
| bloqueo              | causa accionable y propietario funcional             |
| siguiente acción     | una transición exacta o acceso de solo lectura       |
| última actualización | fecha y hora del último hecho confirmado             |

##### 5.4. Prioridad

La prioridad se resuelve en este orden:

```text
1. SEGURIDAD_O_INCIDENTE_SOBRE_CUSTODIA_ACTIVA
2. CARGA_BAJO_CUSTODIA_CON_SIGUIENTE_PARADA
3. HANDOFF_O_ENTREGA_DENTRO_DE_VENTANA
4. CARGA_ASIGNADA_LISTA_PARA_RECOGIDA
5. RETORNO_O_TRANSFERENCIA_FORMAL_PENDIENTE
6. PREPARACION_ADICIONAL_QUE_ES_PRERREQUISITO_DE_LA_PROPIA_RECOGIDA
7. OTRA_FUNCION_ADICIONAL_AUTORIZADA
```

Una tarea de preparación adicional nunca desplaza una incidencia o carga ya
bajo custodia. Cuando la misma persona debe preparar la carga que luego
transportará y todavía no posee custodia activa, el sistema puede señalar la
tarea separada de preparación como siguiente prerrequisito.

Dentro de cada nivel se ordena por ventana confirmada, secuencia de ruta,
antigüedad de atribución y un identificador estable. La interfaz no inventa
urgencia, SLA o severidad.

---

#### 6. `NEXO-DRIVER-WORK-QUEUE-CATALOG-001`

| Cola                    | Propósito                                                                                    | Entrada                                                                         | Salida                                                           | Bloqueo principal                                                                  | Propiedad funcional                               |
| ----------------------- | -------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- | ---------------------------------------------------------------- | ---------------------------------------------------------------------------------- | ------------------------------------------------- |
| `DRVQ-RECOGIDA`         | Carga preparada y asignada que espera verificación física en el origen.                      | Remisión lista, actor o vehículo asignado y ventana vigente.                    | Carga contrastada o desviada a bloqueo.                          | No existe asignación; la carga no está lista; falta manifiesto o ventana.          | conductor_logistica                               |
| `DRVQ-ACEPTAR_CUSTODIA` | Carga verificada que espera aceptación explícita de custodia.                                | Bultos, LPN, sellos, manifiesto, origen, destino, vehículo y versión coinciden. | Custodia atribuida o aceptación rechazada con causa.             | Diferencia física, versión obsoleta, actor incorrecto o autorización revocada.     | conductor_logistica                               |
| `DRVQ-TRANSITO`         | Carga actualmente bajo custodia del actor y en desplazamiento autorizado.                    | Custodia aceptada e inicio de tránsito confirmado.                              | Arribo a siguiente parada, entrega física, incidencia o retorno. | Ruta suspendida, conexión incierta, pérdida de asignación o conflicto de custodia. | conductor_logistica                               |
| `DRVQ-PARADA`           | Próxima parada autorizada de la ruta activa.                                                 | Ruta publicada, parada vigente y carga relacionada bajo custodia.               | Arribo o salida confirmados cuando exista capacidad atómica.     | Progreso de ruta todavía sin contrato ejecutable o secuencia modificada.           | conductor_logistica                               |
| `DRVQ-ENTREGA`          | Carga presentada al receptor y pendiente de transferencia documentada.                       | Destino autorizado, receptor disponible y carga identificada.                   | Handoff aceptado por el receptor o entrega fallida documentada.  | No existe capacidad atómica de entrega, prueba de entrega o receptor válido.       | conductor_logistica + receptor                    |
| `DRVQ-INCIDENTE`        | Demora, avería, daño, rechazo, faltante, accidente o imposibilidad de continuar.             | Hecho detectado durante recogida, custodia, tránsito o entrega.                 | Incidente registrado y escalado a la autoridad responsable.      | No existe capacidad atómica de incidente o falta información mínima segura.        | conductor_logistica reporta; supervisión resuelve |
| `DRVQ-RETORNO`          | Carga no entregada que debe volver, transferirse o continuar mediante decisión autorizada.   | Entrega fallida o instrucción formal de retorno.                                | Custodia transferida, devolución recibida o excepción cerrada.   | No existe flujo atómico de devolución o destino de retorno autorizado.             | conductor_logistica + origen o receptor           |
| `DRVQ-BLOQUEO`          | Trabajo detenido por diferencia, conflicto, autorización, versión, seguridad o conectividad. | Cualquier condición que impida una transición segura.                           | Causa resuelta y tarea revalidada desde servidor.                | El actor no puede resolver unilateralmente la causa.                               | actor responsable según causa                     |

Reconciliación:

```text
EXPECTED_DRIVER_QUEUES = 8
MATERIALIZED_DRIVER_QUEUES = 8
UNIQUE_DRIVER_QUEUES = 8
MISSING_DRIVER_QUEUES = 0
DUPLICATE_DRIVER_QUEUES = 0
```

Las colas `DRVQ-PARADA`, `DRVQ-ENTREGA`, `DRVQ-INCIDENTE` y `DRVQ-RETORNO`
reconocen trabajo necesario, pero no declaran implementadas las capacidades
atómicas pendientes.

---

#### 7. `NEXO-DRIVER-CAPABILITY-COMPOSITION-CONTRACT-001`

##### 7.1. Principio

```text
MISMA PERSONA
PUEDE TENER VARIAS CAPACIDADES
PERO CADA FUNCION, COLA, COMANDO Y TRANSICION
CONSERVA SU PROPIO CONTRATO
```

La composición no modifica `AUTH-RBAC-018`: el rol operativo
`conductor_logistica` no recibe preparación. La misma persona puede preparar
porque posee además la capacidad efectiva de preparación en un contexto
compatible.

##### 7.2. Casos materializados

| Caso                            | Condición                                                                                          | Proyección resultante                                                                                                                                 | Límite obligatorio                                                                                                         | Estado         |
| ------------------------------- | -------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- | -------------- |
| `CONDUCTOR_UNICAMENTE`          | Capacidad vigente de transporte sin preparación.                                                   | Inicio del conductor con colas propias asignadas.                                                                                                     | No muestra preparación, recepción, supervisión ni configuración.                                                           | `ESPECIFICADO` |
| `PREPARADOR_UNICAMENTE`         | Capacidad vigente de preparación sin transporte.                                                   | Inicio del bodeguero o proyección de preparación.                                                                                                     | No abre colas de custodia o tránsito por el nombre del cargo o la sede.                                                    | `ESPECIFICADO` |
| `CONDUCTOR_Y_PREPARADOR`        | La misma persona posee capacidades vigentes y territorios compatibles para preparar y transportar. | El inicio del conductor conserva sus colas y muestra una entrada separada a la tarea de preparación autorizada cuando sea la siguiente acción válida. | La preparación no se convierte en acción del rol conductor; finalizar preparación no acepta custodia ni inicia tránsito.   | `ESPECIFICADO` |
| `CONDUCTOR_Y_RECEPTOR`          | La misma persona posee ambas capacidades en contextos distintos.                                   | Cada función se proyecta por contexto, extremo y etapa.                                                                                               | No puede auto-recibir la carga que permanece bajo su propia custodia ni confirmar por el destino sin transferencia válida. | `ESPECIFICADO` |
| `CONDUCTOR_Y_SUPERVISION`       | La misma persona posee capacidad supervisora adicional.                                            | El control se abre en proyección separada y revalida autoridad.                                                                                       | El inicio del conductor no incorpora decisiones de excepción, ajustes, cierre o monitoreo global.                          | `ESPECIFICADO` |
| `DISPOSITIVO_SIN_SESION_HUMANA` | Existe dispositivo o vehículo identificado, pero no actor humano vigente.                          | No existe inicio operativo ni acciones empresariales.                                                                                                 | El equipo, vehículo, PIN o código no sustituyen identidad ni permiso.                                                      | `BLOQUEADO`    |

Reconciliación:

```text
EXPECTED_COMPOSITION_CASES = 6
MATERIALIZED_COMPOSITION_CASES = 6
UNIQUE_COMPOSITION_CASES = 6
MISSING_COMPOSITION_CASES = 0
DUPLICATE_COMPOSITION_CASES = 0
```

##### 7.3. Secuencia obligatoria cuando la misma persona prepara y conduce

```text
PREPARACION_INICIADA
→
PREPARACION_FINALIZADA
→
CARGA_LISTA_PARA_HANDOFF
→
VERIFICACION_DE_MANIFIESTO_Y_BULTOS
→
CUSTODIA_ACEPTADA
→
TRANSITO_INICIADO
```

No se permite convertir `PREPARACION_FINALIZADA` directamente en
`TRANSITO_INICIADO`. El registro podrá conservar el mismo actor en
`prepared_by` y `custody_accepted_by`, pero deberá mantener hechos, tiempos,
versiones y evidencias separados.

Una política posterior puede exigir doble verificación para cargas críticas;
esta tarea no impone esa condición a todas las remisiones ni elimina la
posibilidad de que una sola persona ejecute ambas funciones.

---

#### 8. `NEXO-DRIVER-STAGE-PROJECTION-MATRIX-001`

| Etapa            | Nombre canónico                                                 | Proyección                                 | Acción del conductor                                                                                                                                 | Límite                                                                                  | Estado         |
| ---------------- | --------------------------------------------------------------- | ------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- | -------------- |
| `VPROC-0028-E01` | Crear solicitud interna                                         | `REFERENCIA_POSTERIOR_A_ASIGNACION`        | Ninguna acción de creación como conductor.                                                                                                           | La solicitud solo aparece cuando una remisión derivada queda asignada a su operación.   | `ESPECIFICADO` |
| `VPROC-0028-E02` | Aplicar ruta, producto y política de solicitud                  | `RESULTADO_DE_POLITICA_EN_SOLO_LECTURA`    | Consultar restricciones relevantes para transportar.                                                                                                 | No configura rutas, productos, ventanas, mínimos ni políticas.                          | `ESPECIFICADO` |
| `VPROC-0028-E03` | Crear origen y fulfillment por línea                            | `REFERENCIA_DE_CARGA_ASIGNADA`             | Consultar origen, destino, líneas y estado de preparación.                                                                                           | No crea fulfillment, asigna origen ni decide disponibilidad.                            | `ESPECIFICADO` |
| `VPROC-0028-E04` | Elegir LOC, posición y cantidad de picking                      | `OTRA_FUNCION_CON_COMPOSICION_CONDICIONAL` | Ninguna acción en función conductor; puede abrir la tarea separada de preparación si el mismo actor posee capacidad vigente.                         | El permiso de transporte no concede picking y la interfaz no mezcla comandos.           | `ESPECIFICADO` |
| `VPROC-0028-E05` | Preparar, dejar listo o registrar faltante                      | `OTRA_FUNCION_CON_COMPOSICION_CONDICIONAL` | Ver estado de carga; preparar solo mediante la proyección separada y el permiso exacto de preparación.                                               | Dejar listo no acepta custodia, no despacha y no inicia tránsito.                       | `ESPECIFICADO` |
| `VPROC-0028-E06` | Cargar, sellar y despachar                                      | `FRONTERA_PRIMARIA_DE_CUSTODIA`            | Contrastar manifiesto, bultos, LPN, sellos, vehículo, origen, destino y versión; aceptar custodia e iniciar tránsito mediante transición autorizada. | No altera cantidades, picks, sellos o manifiesto; una diferencia bloquea la aceptación. | `ESPECIFICADO` |
| `VPROC-0028-E07` | Transportar y confirmar tránsito                                | `TRABAJO_PRIMARIO_DEL_CONDUCTOR`           | Continuar ruta asignada, consultar próxima parada y registrar hitos únicamente cuando exista capacidad atómica.                                      | No ve rutas ajenas, reordena paradas, cambia vehículo ni declara recepción.             | `ESPECIFICADO` |
| `VPROC-0028-E08` | Recibir parcial o totalmente                                    | `HANDOFF_SIN_AUTORIDAD_DE_RECEPCION`       | Presentar carga y conservar custodia hasta aceptación documentada del receptor.                                                                      | No ejecuta `remissions.receive`, no decide cantidades aceptadas y no auto-recibe.       | `ESPECIFICADO` |
| `VPROC-0028-E09` | Resolver faltante, sobrante, daño, rechazo, devolución o cierre | `REPORTE_Y_CUSTODIA_SIN_RESOLUCION`        | Registrar evidencia o incidencia cuando exista capacidad atómica y seguir la instrucción autorizada.                                                 | No ajusta inventario, cancela, resuelve diferencias ni cierra unilateralmente.          | `ESPECIFICADO` |

Reconciliación:

```text
EXPECTED_PROCESS_STAGES = 9
MATERIALIZED_PROCESS_STAGES = 9
UNIQUE_PROCESS_STAGES = 9
MISSING_PROCESS_STAGES = 0
DUPLICATE_PROCESS_STAGES = 0
```

---

#### 9. `NEXO-DRIVER-ROUTE-DISPOSITION-001`

| Ruta             | Patrón actual                             | Disposición                                   | Decisión materializada                                                                                                                | Estado         |
| ---------------- | ----------------------------------------- | --------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------- | -------------- |
| `NEXO-ROUTE-001` | `/`                                       | `PROYECTAR_HOME_CONDUCTOR`                    | Inicio por trabajo asignado, custodia y siguiente parada; no conserva el cockpit agregado como autoridad.                             | `ESPECIFICADO` |
| `NEXO-ROUTE-031` | `/inventory/remissions`                   | `LISTA_ACOTADA_A_OPERACIONES_ASIGNADAS`       | Muestra únicamente remisiones relacionadas con el actor, ruta, vehículo o custodia vigentes.                                          | `ESPECIFICADO` |
| `NEXO-ROUTE-032` | `/inventory/remissions/[id]`              | `DETALLE_COMPARTIDO_CON_ACCIONES_POR_FUNCION` | Expone el detalle mínimo y comandos de conductor según etapa; otras funciones revalidan sus propias capacidades.                      | `ESPECIFICADO` |
| `NEXO-ROUTE-033` | `/inventory/remissions/[id]/edit`         | `EXCLUIR_DEL_HOME_CONDUCTOR`                  | El conductor no edita solicitud, líneas, origen, destino, cantidades ni política.                                                     | `ESPECIFICADO` |
| `NEXO-ROUTE-034` | `/inventory/remissions/conductor`         | `DESTINO_OPERATIVO_PRIMARIO_TRANSITORIO`      | Concentra cargas físicas del conductor, pero debe filtrarse por asignación y adoptar el contrato de custodia.                         | `ESPECIFICADO` |
| `NEXO-ROUTE-035` | `/inventory/remissions/fulfillment`       | `REFERENCIA_O_FUNCION_SEPARADA`               | Como conductor solo consulta el resultado asignado; si también prepara, abre la proyección separada autorizada.                       | `ESPECIFICADO` |
| `NEXO-ROUTE-036` | `/inventory/remissions/prepare`           | `FUNCION_ADICIONAL_SEPARADA`                  | No pertenece a la autoridad del conductor; solo aparece mediante capacidad efectiva de preparación y contexto compatible.             | `ESPECIFICADO` |
| `NEXO-ROUTE-037` | `/inventory/remissions/receive`           | `EXCLUIR_AUTO_RECEPCION`                      | Pertenece al receptor; no se enlaza como continuación ordinaria desde una carga bajo custodia del conductor.                          | `ESPECIFICADO` |
| `NEXO-ROUTE-038` | `/inventory/remissions/transit`           | `DIVIDIR_CUSTODIA_Y_MONITOREO`                | La operación propia de custodia y tránsito pertenece al conductor; monitoreo global, retrasos y excepciones pertenecen a supervisión. | `ESPECIFICADO` |
| `NEXO-ROUTE-041` | `/inventory/settings/fulfillment-routes`  | `EXCLUIR_CONFIGURACION`                       | El conductor consume el resultado publicado; no modifica fulfillment ni asignaciones maestras.                                        | `ESPECIFICADO` |
| `NEXO-ROUTE-045` | `/inventory/settings/remissions`          | `EXCLUIR_CONFIGURACION`                       | No expone parámetros generales de remisiones.                                                                                         | `ESPECIFICADO` |
| `NEXO-ROUTE-046` | `/inventory/settings/remissions/products` | `EXCLUIR_CONFIGURACION`                       | No modifica elegibilidad, presentación ni comportamiento de productos.                                                                | `ESPECIFICADO` |
| `NEXO-ROUTE-047` | `/inventory/settings/request-policies`    | `MOSTRAR_SOLO_RESULTADO_APLICABLE`            | Puede explicar una restricción aplicada a su carga sin abrir controles de política.                                                   | `ESPECIFICADO` |
| `NEXO-ROUTE-050` | `/inventory/settings/supply-routes`       | `PROYECTAR_RUTA_ASIGNADA_EN_SOLO_LECTURA`     | Muestra secuencia y ventanas de la jornada asignada; no permite configurar ni reordenar.                                              | `ESPECIFICADO` |
| `NEXO-ROUTE-062` | `/printing/jobs`                          | `UTILIDAD_CONTEXTUAL_PROPIA`                  | Solo accede a documentos o trabajos originados por su operación y no a la cola global.                                                | `ESPECIFICADO` |
| `NEXO-ROUTE-064` | `/scanner`                                | `HEREDAR_TAREA_Y_CUSTODIA`                    | Identifica manifiesto, bulto, LPN o parada dentro de la tarea invocante; no ejecuta transición por inferencia.                        | `ESPECIFICADO` |

Reconciliación:

```text
EXPECTED_RELEVANT_ROUTES = 16
MATERIALIZED_RELEVANT_ROUTES = 16
UNIQUE_RELEVANT_ROUTES = 16
MISSING_RELEVANT_ROUTES = 0
DUPLICATE_RELEVANT_ROUTES = 0
```

Toda ruta revalida en servidor el actor, función, asignación, permiso,
territorio, etapa, versión y custodia. La navegación visible no sustituye el
guard de lectura ni el comando de mutación.

---

#### 10. `NEXO-DRIVER-HOME-STATE-CONTRACT-001`

| Estado de interfaz       | Condición                                                                                       | Respuesta obligatoria                                                               |
| ------------------------ | ----------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| `RESOLVIENDO_CONTEXTO`   | Se están resolviendo actor, turno, check-in, ruta, vehículo, asignaciones, permisos y custodia. | No mostrar colas definitivas ni habilitar mutaciones.                               |
| `SIN_JORNADA_VALIDA`     | No existe turno o check-in exigible vigente.                                                    | Mostrar causa y acceso al mecanismo canónico de regularización; bloquear operación. |
| `SIN_ASIGNACION`         | Existe sesión válida, pero no ruta, vehículo, operación ni carga asignados.                     | Mostrar vacío operativo sin exponer trabajo general ni permitir autoasignación.     |
| `CARGANDO_TRABAJO`       | La consulta autoritativa de tareas está en curso.                                               | Mantener contexto visible y evitar conteos parciales como definitivos.              |
| `TRABAJO_DISPONIBLE`     | Existe al menos una tarea válida y atribuida.                                                   | Habilitar solo `CONTINUAR_SIGUIENTE_TAREA` sobre la prioridad resuelta.             |
| `SIN_TRABAJO_ASIGNADO`   | La consulta completa no devuelve tareas vigentes.                                               | Mostrar vacío confirmado y hora de actualización.                                   |
| `MANIFIESTO_NO_COINCIDE` | Bultos, LPN, sellos, cantidades, origen, destino, vehículo o versión difieren.                  | Bloquear custodia y tránsito; enviar a `DRVQ-BLOQUEO`.                              |
| `CUSTODIA_EN_CONFLICTO`  | Otro actor figura como custodio o existe transferencia incompleta.                              | Bloquear mutación y requerir resolución autoritativa.                               |
| `DATOS_PARCIALES`        | Una fuente secundaria falló o la proyección es incompleta.                                      | Etiquetar parcialidad; no inferir ausencia, prioridad ni éxito.                     |
| `ERROR_RECUPERABLE`      | La operación de lectura falló sin resultado confirmado.                                         | Permitir reintento idempotente después de revalidar contexto.                       |
| `SIN_AUTORIZACION`       | Falta permiso, territorio, relación o condición de la acción.                                   | Fallar cerrado y explicar la razón sin revelar datos protegidos.                    |
| `CONTEXTO_REVOCADO`      | Cambió turno, check-in, asignación, rol operativo, permiso, ruta, vehículo o custodia.          | Invalidar colas y comandos; resolver nuevamente desde servidor.                     |
| `CONECTIVIDAD_INCIERTA`  | No se conoce el resultado de una mutación o la red está intermitente.                           | No repetir a ciegas ni mostrar éxito; reconciliar por clave idempotente.            |
| `TAREA_CAMBIADA`         | La versión, estado, prioridad o actor responsable cambió desde la carga de la vista.            | Rechazar el comando obsoleto y recargar la siguiente acción válida.                 |

Reconciliación:

```text
EXPECTED_INTERFACE_STATES = 14
MATERIALIZED_INTERFACE_STATES = 14
UNIQUE_INTERFACE_STATES = 14
MISSING_INTERFACE_STATES = 0
DUPLICATE_INTERFACE_STATES = 0
```

Una petición enviada no equivale a custodia aceptada, salida, arribo, entrega,
recepción, incidencia o retorno confirmados. Ante resultado desconocido, el
cliente reconcilia el hecho antes de ofrecer reintento.

---

#### 11. Reglas de dispositivo, movilidad y conectividad

1. el dispositivo personal, corporativo o instalado en el vehículo no es el
   actor empresarial;
2. un dispositivo compartido exige sesión humana vigente antes de mostrar
   información protegida o mutar;
3. escaneo y geolocalización heredan la tarea y no conceden permisos;
4. la geolocalización, cuando se implemente, se limita a finalidad logística,
   jornada y retención definidas;
5. cada mutación usa clave idempotente, versión esperada y hora de servidor;
6. una operación offline queda pendiente de reconciliación y no se representa
   como exitosa;
7. si la asignación o custodia cambió durante la desconexión, el comando
   obsoleto se rechaza;
8. no se almacena una cola global completa en el dispositivo para simular
   autorización sin conexión;
9. fotografías, firmas, códigos o pruebas de entrega requieren contrato
   atómico, minimización y retención antes de habilitarse;
10. la pérdida de conexión no habilita saltar manifiesto, handoff o recepción.

---

#### 12. Evidencia técnica actual y diagnóstico

| Superficie o capacidad actual                                        | Evidencia permitida                                                                                                                                                                                  | Estado                   | Destino                                               |
| -------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------ | ----------------------------------------------------- |
| Inicio raíz `src/app/page.tsx`                                       | Organiza acciones por tipo de sede y permisos generales; no resuelve una proyección dedicada del conductor ni su custodia.                                                                           | `IMPLEMENTADO_PARCIAL`   | Paquete de implementación NEXO                        |
| `NEXO-ROUTE-034` y `src/app/inventory/remissions/conductor/page.tsx` | Consulta envíos físicos en varios estados, pero no demuestra filtro por actor, ruta, vehículo o territorio y enlaza una carga en tránsito hacia recepción.                                           | `IMPLEMENTADO_PARCIAL`   | NEXO-UX-011; NEXO-UX-012; implementación NEXO         |
| `src/app/inventory/remissions/conductor/actions.ts`                  | Actualiza un envío a `in_transit` con sesión autenticada y estado permitido, sin materializar en esa acción el contrato completo de turno, asignación, manifiesto, custodia, versión e idempotencia. | `IMPLEMENTADO_PARCIAL`   | NEXO-UX-011; NEXO-UX-012; AUTH-SRV-001 a AUTH-SRV-005 |
| `NEXO-ROUTE-038` y `src/app/inventory/remissions/transit/page.tsx`   | Usa guard operativo y permiso legacy por sede, pero consulta remisiones de centros autorizados y mezcla preparando, tránsito y parcial sin demostrar asignación exclusiva al conductor.              | `IMPLEMENTADO_PARCIAL`   | NEXO-UX-012; NEXO-UX-007; implementación NEXO         |
| Detalle y acciones de remisión                                       | Conviven `restock_requests`, shipments físicos, posting de inventario y transiciones complejas; su existencia no prueba un home, handoff o modelo único adoptado.                                    | `IMPLEMENTADO_PARCIAL`   | NEXO-UX-009 a NEXO-UX-013                             |
| Inicio dedicado por actor, ruta y custodia                           | No existe una superficie única que materialice el contrato aprobado de esta tarea.                                                                                                                   | `NO_IMPLEMENTADO`        | Paquete de implementación NEXO                        |
| Entrega, prueba de entrega, incidente, progreso de ruta y retorno    | Las brechas atómicas continúan declaradas en `AUTH-RBAC-018` y no deben aparentarse como funciones disponibles.                                                                                      | `BLOQUEADO`              | NEXO-UX-011; NEXO-UX-012; NEXO-UX-022                 |
| Validación móvil, offline y física                                   | No se ejecutó piloto con rutas, vehículos, bultos, sellos, receptores ni conectividad intermitente.                                                                                                  | `PENDIENTE_DE_EVIDENCIA` | NEXO-UX-023 a NEXO-UX-025                             |

El código actual demuestra superficies y transiciones parciales. No demuestra
el contrato completo del home ni valida operación física, asignación real,
custodia, movilidad o conectividad intermitente.

---

#### 13. Brechas y bloqueos preservados

| Brecha                                                | Efecto en el inicio                                                     | Propietario documental         | Condición de salida                                        |
| ----------------------------------------------------- | ----------------------------------------------------------------------- | ------------------------------ | ---------------------------------------------------------- |
| capacidad atómica de entrega o handoff ausente        | `DRVQ-ENTREGA` no puede presentar una confirmación ejecutable ordinaria | `NEXO-UX-011`; `NEXO-UX-012`   | contrato, estado, comando, permiso y prueba aprobados      |
| prueba de entrega ausente                             | firma, fotografía, código o sello no se muestran como disponibles       | `NEXO-UX-012`; `NEXO-UX-022`   | evidencia, sensibilidad y retención definidas              |
| incidente de transporte sin acción atómica            | `DRVQ-INCIDENTE` permanece informativa o bloqueada                      | `NEXO-UX-012`; `NEXO-UX-022`   | registrar, escalar y resolver con estados separados        |
| progreso de ruta sin contrato atómico                 | `DRVQ-PARADA` no confirma llegada o salida por inferencia               | `NEXO-UX-012`                  | acciones idempotentes de progreso aprobadas                |
| entrega fallida y retorno sin flujo completo          | `DRVQ-RETORNO` no cierra ni transfiere custodia automáticamente         | `NEXO-UX-012`; `NEXO-UX-022`   | retorno, destino, custodia y recepción definidos           |
| asignación de conductor, vehículo y ruta no unificada | las consultas actuales pueden ser más amplias que el trabajo propio     | paquete de implementación NEXO | fuente autoritativa y filtros de servidor materializados   |
| coexistencia de `restock_requests` y shipments        | dos superficies pueden representar etapas semejantes sin adopción única | `NEXO-UX-009` a `NEXO-UX-013`  | modelo de transición y compatibilidad aprobado             |
| validación móvil y offline pendiente                  | no existe evidencia de seguridad o usabilidad en ruta                   | `NEXO-UX-023` a `NEXO-UX-025`  | piloto con dispositivos, red intermitente y actores reales |

Ningún bloqueo queda sin tarea responsable.

---

#### 14. Decisiones aprobadas

1. el inicio se resuelve por función activa, trabajo asignado y custodia, no
   por cargo, sede o vehículo;
2. existe una sola acción primaria: `CONTINUAR_SIGUIENTE_TAREA`;
3. las ocho colas del conductor representan hechos de transporte y custodia;
4. la prioridad protege primero seguridad y cargas bajo custodia;
5. el conductor ve únicamente operaciones asignadas o bajo su custodia;
6. preparación, custodia, tránsito, entrega física y recepción no se fusionan;
7. la misma persona puede preparar y conducir mediante capacidades separadas;
8. la preparación adicional abre la proyección de bodega y no modifica la
   autoridad de `conductor_logistica`;
9. finalizar preparación no acepta custodia ni inicia tránsito;
10. el mismo actor puede quedar atribuido en etapas consecutivas sin perder
    separación de hechos y evidencia;
11. el conductor no auto-recibe ni confirma por el destino;
12. una incidencia no ajusta, cancela, recibe ni cierra automáticamente;
13. ruta, vehículo, dispositivo, perfil y URL no conceden permiso;
14. escáner, impresión y geolocalización son utilidades contextuales;
15. las dieciséis rutas existentes conservan identidad y disposición;
16. los catorce estados fallan cerrados y no inventan éxito;
17. las brechas atómicas permanecen visibles como bloqueos, no como funciones;
18. las superficies actuales son evidencia parcial y no validación;
19. no se modifica código, Supabase, permisos, datos ni operación;
20. `NEXO-UX-006` permanece reservada.

---

#### 15. Requisitos de prueba derivados

Esta tarea crea siete requisitos y no modifica, difiere, descarta ni declara
obsoleto ningún requisito histórico:

| Identificador   | Regla protegida resumida                                                                                                                          | Estado inicial |
| --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- |
| `TREQ-NEXO-062` | El home se resuelve desde actor efectivo, turno, check-in, asignación, ruta, vehículo, permiso, territorio y custodia autoritativos.              | `IDENTIFICADO` |
| `TREQ-NEXO-063` | La arquitectura conserva ocho secciones, una acción primaria y ocho colas priorizadas en servidor sobre trabajo asignado.                         | `IDENTIFICADO` |
| `TREQ-NEXO-064` | Las nueve etapas conservan fronteras entre solicitante, preparación, custodia, tránsito, recepción, supervisión y configuración.                  | `IDENTIFICADO` |
| `TREQ-NEXO-065` | La misma persona puede preparar y conducir mediante capacidades separadas, sin fusionar colas, comandos, atribución ni transiciones.              | `IDENTIFICADO` |
| `TREQ-NEXO-066` | Las dieciséis rutas relevantes fallan cerradas y no conceden edición, auto-recepción, configuración, monitoreo global ni trabajo ajeno.           | `IDENTIFICADO` |
| `TREQ-NEXO-067` | Manifiesto, bultos, sellos, LPN, versión, custodia, idempotencia, concurrencia y conectividad impiden transiciones duplicadas o fuera de orden.   | `IDENTIFICADO` |
| `TREQ-NEXO-068` | Los catorce estados y las brechas contractuales no se presentan como éxito, entrega, recepción, incidencia o retorno implementados sin evidencia. | `IDENTIFICADO` |

Los siete requisitos permanecen pendientes de implementación, automatización y
evidencia.

---

#### 16. Criterios de aceptación

La tarea queda documentalmente completa cuando se confirme que:

- la audiencia primaria es `conductor_logistica` en una jornada válida;
- actor, asignación, permiso, territorio y custodia se resuelven en servidor;
- existe una única acción primaria y ocho secciones;
- existen ocho colas únicas y catorce estados únicos;
- las nueve etapas de `VPROC-0028` tienen decisión explícita;
- las dieciséis rutas relevantes tienen disposición explícita;
- no se inventaron rutas, permisos, estados de dominio ni resultados técnicos;
- la prioridad protege seguridad y custodia activa;
- la visibilidad se limita a operaciones asignadas;
- manifiesto, bultos, LPN, sellos, vehículo y versión se contrastan antes de
  aceptar custodia;
- preparación no concede transporte y transporte no concede recepción;
- una misma persona puede preparar y conducir sin fusionar funciones;
- el cambio de función revalida permiso y contexto;
- terminar preparación no dispara tránsito automáticamente;
- entrega física y recepción permanecen separadas;
- incidentes, retornos y diferencias no producen efectos automáticos;
- el acceso directo por URL falla cerrado;
- la conectividad incierta no muestra éxito ni repite mutaciones a ciegas;
- las brechas contractuales conservan propietario y condición de salida;
- se crean exactamente `TREQ-NEXO-062` a `TREQ-NEXO-068`;
- `NEXO-UX-006` permanece únicamente reservada.

---

#### 17. `NEXO-DRIVER-HOME-HANDOFF-001`

| Destino                        | Handoff aprobado                                                                                                       |
| ------------------------------ | ---------------------------------------------------------------------------------------------------------------------- |
| `NEXO-UX-006`                  | diseñar el inicio receptor sin reutilizar custodia o confirmaciones del conductor                                      |
| `NEXO-UX-007`                  | separar monitoreo global, retrasos, excepciones y decisiones supervisoras                                              |
| `NEXO-UX-008`                  | organizar navegación por tareas y función activa, incluida la composición de capacidades                               |
| `NEXO-UX-009`; `NEXO-UX-010`   | consolidar solicitud, fulfillment, picks y preparación sin fusionarlos con transporte                                  |
| `NEXO-UX-011`                  | definir documento, carga, sellado, aceptación de custodia y despacho                                                   |
| `NEXO-UX-012`                  | definir ruta, progreso, entrega, prueba, incidencia, retorno y transferencia de custodia                               |
| `NEXO-UX-013`                  | definir recepción independiente y conciliación de cantidades                                                           |
| `NEXO-UX-020` a `NEXO-UX-022`  | definir escaneo, cantidades, estados, errores y excepciones                                                            |
| `NEXO-UX-023` a `NEXO-UX-025`  | validar móvil, vehículo, conectividad, prototipo, métricas y piloto                                                    |
| paquete de implementación NEXO | construir home, consultas asignadas, selector de función, guards, comandos, pruebas y observabilidad                   |
| certificación posterior        | validar con preparadores-conductores, conductores exclusivos, receptores, vehículos, bultos, sellos y red intermitente |

Ningún destino anterior se inicia mediante esta tarea.

---

#### 18. Continuidad canónica

**ÚLTIMA TAREA APROBADA**

`NEXO-UX-004 — Diseñar inicio para bodeguero`

**TAREA ACTUAL APROBADA**

`NEXO-UX-005 — Diseñar inicio para conductor`

**SIGUIENTE TAREA RESERVADA**

`NEXO-UX-006 — Diseñar inicio para receptor`


### ✅ NEXO-UX-006 — Diseñar inicio para receptor

**Estado:** APROBADA
**Tarea anterior:** `NEXO-UX-005 — Diseñar inicio para conductor` — APROBADA
**Tarea siguiente:** `NEXO-UX-007 — Diseñar inicio para supervisor` — RESERVADA
**Tipo de tarea:** documental; diseño funcional completo del inicio operativo del receptor, trabajo entrante, handoff, verificación física, recepción parcial o completa, diferencias, composición de capacidades, estados, autorización, decisiones por etapa y ruta, y handoff de implementación
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/K_NEXO/04_EXPERIENCIA_DE_INVENTARIO_LOGISTICA_Y_ACTIVOS.md`
**Repositorio de aplicación inspeccionado:** `vento-nexo`
**Artefactos producidos:** `NEXO-RECEIVER-HOME-CONTRACT-001`, `NEXO-RECEIVER-HOME-INFORMATION-ARCHITECTURE-001`, `NEXO-RECEIVER-WORK-QUEUE-CATALOG-001`, `NEXO-RECEIVER-CAPABILITY-COMPOSITION-CONTRACT-001`, `NEXO-RECEIVER-STAGE-PROJECTION-MATRIX-001`, `NEXO-RECEIVER-ROUTE-DISPOSITION-001`, `NEXO-RECEIVER-HOME-STATE-CONTRACT-001` y `NEXO-RECEIVER-HOME-HANDOFF-001`
**Decisiones consumidas:** `NEXO-UX-LANE-CONTRACT-001`; `NEXO-REQUESTER-HOME-CONTRACT-001`; `NEXO-WAREHOUSE-HOME-CONTRACT-001`; `NEXO-DRIVER-HOME-CONTRACT-001`; `NEXO-DRIVER-CAPABILITY-COMPOSITION-CONTRACT-001`; `AUTH-RBAC-008` a `AUTH-RBAC-019`; `PROC-BASE-ROLE-APPLICABILITY-MATRIX-001`; `PROC-OPERATIONAL-ROLE-APPLICABILITY-MATRIX-001`; `PROC-PROCESS-RACI-MATRIX-001`; `VPROC-0028`; inventario `NEXO-ROUTE-001` a `NEXO-ROUTE-064`; requisitos `TREQ-*` vigentes; código, migraciones y contratos actuales de `vento-nexo` y `vento-shell`
**Cambios físicos autorizados:** ninguno; no modifica código, rutas, permisos, datos, remisiones, receipts, stock, movimientos, Supabase, migraciones, RLS, configuración ni despliegues

---

#### 1. Propósito

Diseñar el inicio operativo de NEXO para la función empresarial
`RECEPCION_EN_SEDE`, de modo que la persona autorizada identifique qué carga
está por llegar, cuál se encuentra en handoff, qué recepción física debe
continuar y qué diferencia requiere evidencia, sin convertir la recepción en
solicitud, preparación, conducción, supervisión, ajuste, disposición o
configuración.

La regla canónica es:

```text
ACTOR HUMANO EFECTIVO
+
TURNO Y CHECK-IN VIGENTES CUANDO APLIQUEN
+
FUNCION RECEPCION_EN_SEDE RESUELTA
+
SEDE Y AREA DESTINO AUTORIZADAS
+
PERMISO EXACTO nexo.inventory.remissions.receive
+
REMISION O SHIPMENT RELACIONADO CON EL DESTINO
+
HANDOFF, CUSTODIA, ETAPA Y VERSION VIGENTES
+
PRIORIDAD OPERATIVA AUTORITATIVA
→
INICIO DEL RECEPTOR
```

La proyección visual no concede autoridad. El nombre del cargo, trabajar en la
sede destino, haber solicitado la remisión, conocer la URL, recibir físicamente
un bulto, escanear un código o usar un dispositivo de la sede no autorizan por
sí solos consultar, aceptar custodia, registrar cantidades, confirmar una
recepción, resolver diferencias, ajustar inventario ni cerrar el caso.

---

#### 2. Resultado material

Se aprueban ocho artefactos documentales consumibles:

1. `NEXO-RECEIVER-HOME-CONTRACT-001`, que define audiencia, fuentes de
   habilitación, contexto, relación con el destino, custodia y límites;
2. `NEXO-RECEIVER-HOME-INFORMATION-ARCHITECTURE-001`, que materializa ocho
   secciones y una única acción primaria;
3. `NEXO-RECEIVER-WORK-QUEUE-CATALOG-001`, que define ocho colas de arribo,
   handoff, verificación, recepción parcial, diferencia, evidencia,
   continuidad y bloqueo;
4. `NEXO-RECEIVER-CAPABILITY-COMPOSITION-CONTRACT-001`, que resuelve siete
   casos de composición entre receptor, solicitante, bodeguero, conductor,
   supervisor y concesión individual;
5. `NEXO-RECEIVER-STAGE-PROJECTION-MATRIX-001`, que decide las nueve etapas de
   `VPROC-0028` para esta proyección;
6. `NEXO-RECEIVER-ROUTE-DISPOSITION-001`, que decide dieciséis rutas existentes
   sin inventar URLs ni convertir navegación en permiso;
7. `NEXO-RECEIVER-HOME-STATE-CONTRACT-001`, que define catorce estados de
   contexto, carga, vacío, handoff, custodia, concurrencia, autorización y
   conectividad;
8. `NEXO-RECEIVER-HOME-HANDOFF-001`, que separa diseño, detalle de recepción,
   resolución de diferencias, implementación, pruebas y certificación.

Cobertura materializada:

| Elemento                                  | Total esperado | Total materializado | Faltantes | Duplicados |
| ----------------------------------------- | -------------: | ------------------: | --------: | ---------: |
| Procesos canónicos reconciliados          |              1 |                   1 |         0 |          0 |
| Etapas canónicas decididas                |              9 |                   9 |         0 |          0 |
| Clases de cola del receptor               |              8 |                   8 |         0 |          0 |
| Casos de composición de capacidades       |              7 |                   7 |         0 |          0 |
| Rutas relevantes decididas                |             16 |                  16 |         0 |          0 |
| Secciones obligatorias                    |              8 |                   8 |         0 |          0 |
| Acciones primarias                        |              1 |                   1 |         0 |          0 |
| Estados de interfaz                       |             14 |                  14 |         0 |          0 |
| Requisitos de prueba nuevos o modificados |              7 |                   7 |         0 |          0 |

La tarea deja el diseño en estado `ESPECIFICADO`. No declara el inicio dedicado
`IMPLEMENTADO` ni `VALIDADO`.

---

#### 3. Alcance funcional

##### 3.1. Incluido

- inicio del receptor resuelto por función, permiso y relación con el destino;
- entregas próximas, cargas en tránsito y arribos confirmados;
- handoff físico entre custodio de transporte y receptor autorizado;
- contraste de remisión o shipment, manifiesto, bultos, LPN, sellos, origen,
  destino, cantidades y versión;
- apertura y continuación de verificación física por línea;
- registro de recepción parcial o completa mediante una acción exacta;
- visibilidad de faltantes, sobrantes, producto incorrecto, daño, rechazo,
  cuarentena o evidencia pendiente sin resolverlos por inferencia;
- prioridad y desempate autoritativos;
- estados vacíos, revocación, conflicto, datos parciales y red intermitente;
- composición entre recepción, solicitud y bodega para una misma persona;
- decisión explícita por etapa y ruta relevante;
- diagnóstico de las superficies, contratos y modelos actuales de
  `vento-nexo`.

##### 3.2. Excluido

- creación o edición de solicitudes desde la función receptora;
- asignación de origen, fulfillment, preparador, conductor, ruta o vehículo;
- preparación, picking, empaque, sellado o modificación del manifiesto;
- aceptación de custodia por el conductor en nombre del receptor;
- recepción concedida por trabajar en la sede destino o por haber solicitado;
- resolución supervisora de faltantes, sobrantes, daños, rechazos o
  devoluciones;
- ajuste de inventario, merma, disposición, liberación de cuarentena o cierre
  administrativo;
- ubicación o putaway concedidos por el solo hecho de confirmar recepción;
- recepción de proveedores de ORIGO como si fuera la misma acción;
- configuración de productos, políticas, rutas, ubicaciones o unidades;
- monitoreo global de transporte o desempeño;
- diseño detallado de captura por línea y evidencia, que pertenece a
  `NEXO-UX-013` y `NEXO-UX-022`;
- cambios en código, datos, permisos o Supabase;
- validación operativa, física, tablet, kiosco u offline.

---

#### 4. `NEXO-RECEIVER-HOME-CONTRACT-001`

##### 4.1. Audiencia funcional

La audiencia primaria es `RECEPCION_EN_SEDE`, identidad empresarial aprobada
como ejecutor y aceptante de `VPROC-0028`. No constituye un rol base nuevo ni
un permiso implícito para todos los trabajadores de la sede destino.

Las fuentes ordinarias actualmente aprobadas para habilitar la función son:

| Fuente de capacidad                                 | Condición de aplicación                                                                                                       | Decisión                                                              |
| --------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------- |
| `operador_integral_satelite`                        | sede integrada activa, turno, check-in, área compatible, destino de la remisión y permiso `nexo.inventory.remissions.receive` | puede consumir la proyección receptora ordinaria de la sede integrada |
| `bodeguero`                                         | bodega activa como destino autorizado, turno, check-in, área `warehouse`, recurso relacionado y permiso exacto                | puede consumir la proyección receptora de bodega                      |
| concesión individual o asignación temporal canónica | actor, vigencia, alcance, motivo, permiso exacto y recurso compatibles                                                        | puede consumir únicamente la cobertura concedida y revocable          |

No habilitan automáticamente la recepción:

```text
cajero_satelite
barista_satelite
cocinero_satelite
servicio_salon
mostrador_satelite
produccion_cocina
produccion_panaderia
produccion_reposteria
conductor_logistica
gerencia_operativa
```

La aplicabilidad de un rol a `VPROC-0028`, la consulta de remisiones o la
pertenencia al destino no sustituyen la concesión exacta de recepción.

##### 4.2. Contexto obligatorio

El inicio deberá resolver como mínimo:

| Componente                 | Regla                                                                |
| -------------------------- | -------------------------------------------------------------------- |
| principal técnico          | identidad autenticada y vigente                                      |
| actor efectivo             | persona empresarial atribuible a la recepción                        |
| función activa             | participación vigente como `RECEPCION_EN_SEDE`                       |
| turno y check-in           | vigentes cuando el permiso y la estación los exijan                  |
| sede destino               | extremo exacto autorizado de la remisión o shipment                  |
| área destino               | área operativa compatible con la carga y la función                  |
| permiso                    | `nexo.inventory.remissions.receive` o su versión canónica vigente    |
| relación                   | destino, asignación receptora o acción atribuida al actor            |
| recurso                    | remisión, shipment, líneas, bultos y manifiesto relacionados         |
| handoff y custodia         | custodio actual, actor que entrega, estado y transferencia pendiente |
| versión                    | estado, manifiesto, cantidades y versión esperada del recurso        |
| dispositivo y conectividad | contexto técnico sin autoridad propia y condición de reconciliación  |

Toda ausencia, revocación, incompatibilidad o conflicto falla cerrado.

##### 4.3. Alcance de datos

Una entrega solo puede aparecer cuando exista al menos una relación
autoritativa:

```text
DESTINO_AUTORIZADO_DE_LA_REMISION
ACTOR_RECEPTOR_ASIGNADO
ACTOR_CON_ACCION_DE_RECEPCION_ATRIBUIDA
ACTOR_RECEPTOR_DE_HANDOFF_VIGENTE
ACTOR_QUE_REGISTRO_UN_RECEIPT_DENTRO_DE_SU_ALCANCE
```

No bastan la misma empresa, sede, área nominal, fecha, ruta, estado,
identificador, URL, dispositivo, solicitud propia o conocimiento físico de la
carga.

##### 4.4. Carril funcional

El inicio pertenece al carril `OPERACION`. Puede mostrar referencias de solo
lectura necesarias para verificar la entrega, pero excluye:

- control, priorización global y resolución de `SUPERVISION`;
- maestros y políticas de `CONFIGURACION`;
- custodia de transporte como si fuera recepción;
- putaway, traslado o ajuste como efectos implícitos;
- utilidades sin una tarea receptora invocante.

##### 4.5. Regla de handoff y aceptación

La recepción empieza después de un handoff verificable o de una condición de
arribo equivalente aprobada. Como mínimo deberá conservar:

- actor que entrega o custodio anterior;
- actor que recibe;
- remisión o shipment;
- versión de manifiesto;
- bultos, LPN y sellos observados;
- origen y destino;
- cantidades despachadas y recibidas por línea;
- estado y condición física observados;
- fecha y hora de servidor;
- estado anterior y posterior;
- evidencia y diferencias abiertas;
- clave idempotente y versión esperada.

Aceptar físicamente una carga no equivale a aprobar administrativamente una
diferencia, ubicar inventario, ajustar saldo, liberar cuarentena, disponer un
producto ni cerrar el proceso.

---

#### 5. `NEXO-RECEIVER-HOME-INFORMATION-ARCHITECTURE-001`

##### 5.1. Orden obligatorio

| Orden | Sección                            | Propósito                                                                                                          | Acción permitida                                                   |
| ----: | ---------------------------------- | ------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------ |
|     1 | Contexto receptor                  | mostrar actor, función, turno, sede, área, estación y condición de recepción                                       | cambiar contexto solo mediante el selector canónico autorizado     |
|     2 | Siguiente tarea                    | presentar una única prioridad autoritativa                                                                         | `CONTINUAR_SIGUIENTE_TAREA`                                        |
|     3 | Próximas entregas                  | mostrar cargas asignadas en tránsito o dentro de una ventana confirmada                                            | abrir seguimiento mínimo de la entrega propia                      |
|     4 | Listas para recibir                | mostrar cargas arribadas o con handoff disponible                                                                  | abrir verificación física autorizada                               |
|     5 | Recepciones en curso               | continuar verificaciones parciales, líneas pendientes o recibos no confirmados                                     | retomar la acción exacta vigente                                   |
|     6 | Diferencias y evidencia            | destacar faltantes, sobrantes, daños, producto incorrecto, rechazo o evidencia requerida                           | aportar o corregir evidencia permitida sin resolver el caso        |
|     7 | Recibidas recientes y continuidad  | mostrar el resultado confirmado y la siguiente función separada                                                    | consultar receipt o cambiar a putaway solo con capacidad adicional |
|     8 | Funciones adicionales y utilidades | acceso separado a solicitud, bodega u otra función realmente concedida, además de escaneo e impresión contextuales | cambiar de función o invocar utilidad sin mezclar comandos         |

Las secciones pueden estar vacías, pero no se sustituyen por indicadores
supervisores, configuración, trabajo de otros destinos ni métricas de
productividad.

##### 5.2. Acción primaria

La única acción primaria es:

```text
CONTINUAR_SIGUIENTE_TAREA
```

Se habilita solo cuando el servidor devuelve una tarea vigente con actor,
función receptora, destino, área, permiso, relación, handoff, etapa, versión y
custodia compatibles. La acción no recibe del cliente la prioridad, el rol, la
sede, el estado, las cantidades ni el resultado como autoridad.

##### 5.3. Tarjeta mínima

Cada entrega o tarea visible muestra como mínimo:

| Campo                    | Regla                                                                |
| ------------------------ | -------------------------------------------------------------------- |
| identificador humano     | código estable de remisión, shipment, receipt o tarea                |
| origen y destino         | extremos necesarios y destino receptor autorizado                    |
| transportador o custodio | función o actor mínimo necesario para el handoff                     |
| ventana o arribo         | hora confirmada y último hito verificable                            |
| manifiesto               | versión y resumen de bultos, LPN, sellos y líneas                    |
| etapa y estado           | valores derivados de hechos canónicos                                |
| verificación             | avance por líneas, sin presentar una recepción incompleta como total |
| diferencia               | tipo, cantidad afectada y estado de evidencia cuando exista          |
| handoff y custodia       | condición actual de transferencia al destino                         |
| siguiente acción         | una transición exacta o acceso de solo lectura                       |
| última actualización     | fecha y hora del último hecho confirmado                             |

##### 5.4. Prioridad

La prioridad se resuelve en este orden:

```text
1. SEGURIDAD_CONDICION_O_CUSTODIA_BLOQUEANTE_EN_HANDOFF_ACTIVO
2. HANDOFF_PRESENTE_QUE_REQUIERE_RESPUESTA_DEL_RECEPTOR
3. CARGA_ARRIBADA_DENTRO_DE_VENTANA_CONFIRMADA
4. RECEPCION_INICIADA_CON_LINEAS_PENDIENTES
5. DIFERENCIA_QUE_REQUIERE_EVIDENCIA_O_CORRECCION_DEL_RECEPTOR
6. CARGA_ASIGNADA_LISTA_PARA_RECIBIR
7. CONTINUIDAD_POSTERIOR_CON_CAPACIDAD_ADICIONAL
8. OTRA_FUNCION_ADICIONAL_AUTORIZADA
```

Los desempates usan, en orden: riesgo confirmado, ventana, antigüedad del
handoff o de la acción atribuida, fecha de arribo y un identificador estable.
El cliente no puede elevar prioridad mediante parámetros, orden local o
modificación visual.

---

#### 6. `NEXO-RECEIVER-WORK-QUEUE-CATALOG-001`

| Cola                     | Criterio de inclusión                                                                          | Acción propia del receptor                                                                  | Límite obligatorio                                                                        | Estado         |
| ------------------------ | ---------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- | -------------- |
| `RCVQ-BLOQUEO`           | sello, bulto, destino, custodio, seguridad, condición o versión incompatibles                  | inspeccionar la causa, rechazar el comando obsoleto y escalar mediante la acción disponible | no ajusta, cancela, dispone ni resuelve por inferencia                                    | `ESPECIFICADO` |
| `RCVQ-HANDOFF`           | carga presentada por el custodio y transferencia pendiente                                     | contrastar identidad, manifiesto, bultos y condición antes de abrir recepción               | el receptor no representa al conductor ni altera el manifiesto                            | `ESPECIFICADO` |
| `RCVQ-ARRIBO`            | carga asignada en tránsito, arribada o dentro de ventana confirmada                            | consultar último hito y preparar la estación receptora                                      | no registra llegada, recepción o custodia por anticipación                                | `ESPECIFICADO` |
| `RCVQ-VERIFICACION`      | handoff válido y líneas disponibles para comprobación física                                   | abrir o continuar captura de cantidades y condición por línea                               | el detalle completo pertenece a `NEXO-UX-013`; el home no confirma en masa por inferencia | `ESPECIFICADO` |
| `RCVQ-RECEPCION_PARCIAL` | existe recepción iniciada, líneas pendientes o resultado parcial confirmado                    | continuar únicamente las líneas y cantidades todavía recibibles                             | no convierte parcial en completa ni sobrescribe un receipt confirmado                     | `ESPECIFICADO` |
| `RCVQ-DIFERENCIA`        | faltante, sobrante, daño, producto incorrecto, rechazo, devolución o cuarentena abierta        | consultar, aportar explicación o corregir captura todavía editable                          | reportar no equivale a resolver, ajustar, aceptar pérdida o cerrar                        | `ESPECIFICADO` |
| `RCVQ-EVIDENCIA`         | una recepción o diferencia exige nota, firma, fotografía, código u otra evidencia aprobada     | aportar la evidencia exacta cuando exista contrato atómico disponible                       | una brecha no implementada se muestra bloqueada y no como acción ejecutable               | `ESPECIFICADO` |
| `RCVQ-CONTINUIDAD`       | recepción confirmada y existe una acción posterior separada para bodega, putaway o seguimiento | consultar receipt y cambiar a la función adicional autorizada                               | confirmar recepción no ubica, mueve, ajusta ni cierra automáticamente                     | `ESPECIFICADO` |

Reconciliación:

```text
EXPECTED_RECEIVER_QUEUES = 8
MATERIALIZED_RECEIVER_QUEUES = 8
UNIQUE_RECEIVER_QUEUES = 8
MISSING_RECEIVER_QUEUES = 0
DUPLICATE_RECEIVER_QUEUES = 0
```

Una misma entrega puede aportar señales a varias colas, pero tendrá una única
tarea primaria, resuelta en servidor. Una fila visual no crea un segundo
comando ni un receipt adicional.

---

#### 7. `NEXO-RECEIVER-CAPABILITY-COMPOSITION-CONTRACT-001`

##### 7.1. Principio

```text
MISMA PERSONA
≠
MISMA FUNCION
≠
MISMO PERMISO
≠
MISMA ETAPA
≠
MISMO COMANDO
```

La composición agrega accesos a funciones vigentes; nunca fusiona permisos,
colas, transiciones, auditoría o custodia.

##### 7.2. Casos materializados

| Caso           | Capacidades de la persona                               | Proyección resultante                                                                   | Regla obligatoria                                                                                       | Estado         |
| -------------- | ------------------------------------------------------- | --------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- | -------------- |
| `RCV-COMP-001` | `operador_integral_satelite` con recepción vigente      | home receptor de la sede integrada, además de sus funciones propias                     | la concesión se limita al destino, turno, área y recurso autorizados                                    | `ESPECIFICADO` |
| `RCV-COMP-002` | `bodeguero` y receptor de bodega                        | home receptor cuando la bodega activa es destino; home de bodega como función adicional | recibir no concede preparar, ajustar ni disponer; el contexto determina el extremo                      | `ESPECIFICADO` |
| `RCV-COMP-003` | solicitante y receptor                                  | ambas proyecciones disponibles por separado                                             | haber solicitado no autoriza recibir; la recepción exige permiso, handoff y etapa propios               | `ESPECIFICADO` |
| `RCV-COMP-004` | receptor y bodeguero con putaway                        | recepción primero; putaway después mediante cambio de función                           | el receipt confirmado no crea movimiento ni ubicación automáticamente                                   | `ESPECIFICADO` |
| `RCV-COMP-005` | receptor y autoridad supervisora o base                 | recepción bajo función operativa; control bajo carril supervisor separado               | el actor no aprueba su propia diferencia, ajuste, devolución o disposición sensible                     | `ESPECIFICADO` |
| `RCV-COMP-006` | conductor y receptor                                    | para la misma carga, el custodio no puede auto-entregarse ni auto-recibirse             | otro receptor autorizado debe aceptar el handoff; una carga ajena exige contexto receptor independiente | `ESPECIFICADO` |
| `RCV-COMP-007` | receptor por concesión individual o asignación temporal | home receptor limitado a recursos y vigencia de la concesión                            | no crea rol permanente, alcance de sede completo ni acceso posterior a revocación                       | `ESPECIFICADO` |

Reconciliación:

```text
EXPECTED_COMPOSITION_CASES = 7
MATERIALIZED_COMPOSITION_CASES = 7
UNIQUE_COMPOSITION_CASES = 7
MISSING_COMPOSITION_CASES = 0
DUPLICATE_COMPOSITION_CASES = 0
```

##### 7.3. Secuencia obligatoria de handoff y recepción

```text
CARGA_EN_TRANSITO_O_ARRIBADA
→
CUSTODIO_PRESENTA_CARGA
→
RECEPTOR_CONTRASTA_IDENTIDAD_Y_MANIFIESTO
→
HANDOFF_ACEPTABLE
→
VERIFICACION_FISICA_POR_LINEA
→
RECEPCION_PARCIAL_O_COMPLETA_CONFIRMADA
→
DIFERENCIAS_ABIERTAS_O_CONTINUIDAD_SEPARADA
```

No se permite convertir `CARGA_ARRIBADA` directamente en
`RECEPCION_COMPLETA`. El mismo actor puede haber solicitado la carga o ejecutar
putaway después, pero cada función conserva permiso, etapa, comando, versión,
fecha, evidencia y efecto independientes.

---

#### 8. `NEXO-RECEIVER-STAGE-PROJECTION-MATRIX-001`

| Etapa            | Nombre canónico                                                 | Proyección                                       | Acción del receptor                                                                                                           | Límite                                                                                                           | Estado         |
| ---------------- | --------------------------------------------------------------- | ------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- | -------------- |
| `VPROC-0028-E01` | Crear solicitud interna                                         | `REFERENCIA_SI_EXISTE_RELACION_CON_DESTINO`      | Ninguna acción de creación desde la función receptora.                                                                        | Si la misma persona solicitó, usa el home de solicitante y un comando separado.                                  | `ESPECIFICADO` |
| `VPROC-0028-E02` | Aplicar ruta, producto y política de solicitud                  | `RESULTADO_APLICABLE_EN_SOLO_LECTURA`            | Consultar restricciones necesarias para interpretar entrega, unidad o condición.                                              | No configura rutas, productos, mínimos, presentaciones ni políticas.                                             | `ESPECIFICADO` |
| `VPROC-0028-E03` | Crear origen y fulfillment por línea                            | `REFERENCIA_DE_CARGA_ESPERADA`                   | Consultar origen, líneas, cantidades esperadas y responsable funcional.                                                       | No crea fulfillment, reasigna origen ni decide disponibilidad.                                                   | `ESPECIFICADO` |
| `VPROC-0028-E04` | Elegir LOC, posición y cantidad de picking                      | `RESUMEN_DE_PREPARACION_EN_SOLO_LECTURA`         | Consultar únicamente el resultado necesario para contrastar la carga.                                                         | No consulta stock sensible, elige origen, reserva ni confirma picking.                                           | `ESPECIFICADO` |
| `VPROC-0028-E05` | Preparar, dejar listo o registrar faltante                      | `ENTREGA_PROXIMA_Y_NOVEDAD_DE_ORIGEN`            | Ver cantidades preparadas, faltantes declarados y estado de disponibilidad.                                                   | No prepara, sustituye, declara listo ni modifica el manifiesto.                                                  | `ESPECIFICADO` |
| `VPROC-0028-E06` | Cargar, sellar y despachar                                      | `PRERREQUISITO_DE_HANDOFF`                       | Consultar manifiesto, bultos, LPN, sellos, origen, destino y versión que deberán contrastarse.                                | No carga, sella, despacha, acepta custodia de transporte ni inicia tránsito.                                     | `ESPECIFICADO` |
| `VPROC-0028-E07` | Transportar y confirmar tránsito                                | `ARRIBO_Y_HANDOFF_ENTRANTE`                      | Consultar último hito confirmado, ventana y custodio; abrir recepción solo cuando el handoff sea válido.                      | No monitorea rutas globales, registra hitos del conductor ni anticipa recepción.                                 | `ESPECIFICADO` |
| `VPROC-0028-E08` | Recibir parcial o totalmente                                    | `TRABAJO_PRIMARIO_DEL_RECEPTOR`                  | Contrastar carga, capturar cantidades y condición por línea y confirmar recepción parcial o completa mediante comando exacto. | No autoacepta desde el arribo, no excede despachado, no duplica receipt y no ejecuta putaway o ajuste implícito. | `ESPECIFICADO` |
| `VPROC-0028-E09` | Resolver faltante, sobrante, daño, rechazo, devolución o cierre | `CAPTURA_Y_EVIDENCIA_SIN_RESOLUCION_SUPERVISORA` | Aportar evidencia, explicación o corrección todavía permitida y consultar la decisión.                                        | No aprueba su propia diferencia, ajusta saldo, dispone producto, cancela ni cierra unilateralmente.              | `ESPECIFICADO` |

Reconciliación:

```text
EXPECTED_PROCESS_STAGES = 9
MATERIALIZED_PROCESS_STAGES = 9
UNIQUE_PROCESS_STAGES = 9
MISSING_PROCESS_STAGES = 0
DUPLICATE_PROCESS_STAGES = 0
```

---

#### 9. `NEXO-RECEIVER-ROUTE-DISPOSITION-001`

| Ruta             | Patrón actual                             | Disposición                                  | Decisión materializada                                                                                                                  | Estado         |
| ---------------- | ----------------------------------------- | -------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------- | -------------- |
| `NEXO-ROUTE-001` | `/`                                       | `PROYECTAR_HOME_RECEPTOR`                    | Inicio por destino, handoff, recepción pendiente y siguiente tarea; no conserva el cockpit por tipo de sede como autoridad.             | `ESPECIFICADO` |
| `NEXO-ROUTE-031` | `/inventory/remissions`                   | `LISTA_ACOTADA_A_DESTINO_Y_FUNCION`          | Muestra únicamente remisiones relacionadas con la sede, área, actor o acción receptora vigentes.                                        | `ESPECIFICADO` |
| `NEXO-ROUTE-032` | `/inventory/remissions/[id]`              | `DETALLE_COMPARTIDO_CON_ACCIONES_RECEPTORAS` | Expone detalle mínimo, progreso y comandos de recepción por etapa; otras funciones revalidan capacidades independientes.                | `ESPECIFICADO` |
| `NEXO-ROUTE-033` | `/inventory/remissions/[id]/edit`         | `EXCLUIR_DE_LA_FUNCION_RECEPTORA`            | El receptor no edita solicitud, origen, destino, política ni cantidades solicitadas.                                                    | `ESPECIFICADO` |
| `NEXO-ROUTE-034` | `/inventory/remissions/conductor`         | `EXCLUIR_CUSTODIA_DE_TRANSPORTE`             | Pertenece al conductor; el receptor solo observa el handoff y último hito necesarios desde su propia tarea.                             | `ESPECIFICADO` |
| `NEXO-ROUTE-035` | `/inventory/remissions/fulfillment`       | `REFERENCIA_DE_CARGA_ESPERADA`               | Presenta únicamente el resultado por línea necesario para verificar lo despachado; no permite reasignar fulfillment.                    | `ESPECIFICADO` |
| `NEXO-ROUTE-036` | `/inventory/remissions/prepare`           | `REFERENCIA_O_FUNCION_SEPARADA`              | Como receptor solo consulta el resultado confirmado; una capacidad adicional de bodega abre su propia proyección.                       | `ESPECIFICADO` |
| `NEXO-ROUTE-037` | `/inventory/remissions/receive`           | `DESTINO_OPERATIVO_PRIMARIO_TRANSITORIO`     | Concentra cargas físicas por recibir, pero deberá adoptar filtro por destino, función, handoff, versión, concurrencia e idempotencia.   | `ESPECIFICADO` |
| `NEXO-ROUTE-038` | `/inventory/remissions/transit`           | `PROYECTAR_SOLO_ARRIBO_RELACIONADO`          | Muestra último hito y ventana de cargas del destino; monitoreo global y acciones de conductor permanecen fuera.                         | `ESPECIFICADO` |
| `NEXO-ROUTE-041` | `/inventory/settings/fulfillment-routes`  | `EXCLUIR_CONFIGURACION`                      | El receptor consume el resultado publicado; no modifica fulfillment ni rutas.                                                           | `ESPECIFICADO` |
| `NEXO-ROUTE-045` | `/inventory/settings/remissions`          | `EXCLUIR_CONFIGURACION`                      | No expone parámetros generales de remisiones.                                                                                           | `ESPECIFICADO` |
| `NEXO-ROUTE-046` | `/inventory/settings/remissions/products` | `EXCLUIR_CONFIGURACION`                      | No modifica elegibilidad, presentación, tolerancia ni comportamiento de productos.                                                      | `ESPECIFICADO` |
| `NEXO-ROUTE-047` | `/inventory/settings/request-policies`    | `MOSTRAR_SOLO_RESULTADO_APLICABLE`           | Puede explicar cantidad, unidad o restricción aplicada sin abrir controles de política.                                                 | `ESPECIFICADO` |
| `NEXO-ROUTE-050` | `/inventory/settings/supply-routes`       | `MOSTRAR_VENTANA_Y_ORIGEN_EN_SOLO_LECTURA`   | Expone únicamente ruta y ventana necesarias para la entrega del destino; no configura ni reordena.                                      | `ESPECIFICADO` |
| `NEXO-ROUTE-062` | `/printing/jobs`                          | `UTILIDAD_CONTEXTUAL_PROPIA`                 | Solo accede a comprobantes, etiquetas o trabajos originados por la recepción propia; no a la cola global ni a plantillas.               | `ESPECIFICADO` |
| `NEXO-ROUTE-064` | `/scanner`                                | `HEREDAR_TAREA_RECEPTORA`                    | Identifica remisión, shipment, bulto, LPN, sello o línea dentro de la tarea invocante; no confirma handoff ni recepción por inferencia. | `ESPECIFICADO` |

Reconciliación:

```text
EXPECTED_RELEVANT_ROUTES = 16
MATERIALIZED_RELEVANT_ROUTES = 16
UNIQUE_RELEVANT_ROUTES = 16
MISSING_RELEVANT_ROUTES = 0
DUPLICATE_RELEVANT_ROUTES = 0
```

Toda ruta revalida en servidor actor, función, destino, área, permiso, relación,
handoff, etapa, versión y custodia. La navegación visible no sustituye el
guard de lectura ni el comando de mutación.

---

#### 10. `NEXO-RECEIVER-HOME-STATE-CONTRACT-001`

| Estado de interfaz         | Condición                                                                                                 | Respuesta obligatoria                                                                       |
| -------------------------- | --------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| `RESOLVIENDO_CONTEXTO`     | Se están resolviendo actor, turno, check-in, sede, área, función, permisos, relaciones y custodia.        | No mostrar colas definitivas ni habilitar mutaciones.                                       |
| `SIN_FUNCION_RECEPTORA`    | La sesión es válida, pero no existe capacidad receptora vigente para el destino.                          | Mostrar causa sin exponer cargas y ofrecer solo cambio de función o contexto autorizado.    |
| `CARGANDO_TRABAJO`         | La consulta autoritativa de entregas y tareas está en curso.                                              | Mantener contexto visible y evitar conteos parciales como definitivos.                      |
| `TRABAJO_DISPONIBLE`       | Existe al menos una tarea válida y atribuida al receptor.                                                 | Habilitar solo `CONTINUAR_SIGUIENTE_TAREA` sobre la prioridad resuelta.                     |
| `SIN_ENTREGAS_POR_RECIBIR` | La consulta completa no devuelve arribos, handoffs o recepciones pendientes.                              | Mostrar vacío confirmado y hora de actualización, sin exponer trabajo de otros destinos.    |
| `HANDOFF_NO_CONFIRMADO`    | La carga figura arribada, pero faltan custodio, entrega, manifiesto, bultos o condición de transferencia. | No abrir confirmación final; dirigir a `RCVQ-HANDOFF` o `RCVQ-BLOQUEO`.                     |
| `CUSTODIA_EN_CONFLICTO`    | El custodio vigente no coincide, existe auto-handoff o la transferencia quedó incompleta.                 | Bloquear recepción y exigir resolución autoritativa.                                        |
| `RECEPCION_EN_CONFLICTO`   | Otro actor inició o confirmó receipt, cambió la versión o las cantidades ya fueron materializadas.        | Rechazar el comando obsoleto y recargar estado, líneas y receipt vigentes.                  |
| `DATOS_PARCIALES`          | Una fuente secundaria falló o la proyección de manifiesto, líneas o evidencia es incompleta.              | Etiquetar parcialidad; no inferir ausencia, igualdad ni recepción completa.                 |
| `ERROR_RECUPERABLE`        | La lectura o preparación del comando falló sin resultado confirmado.                                      | Permitir reintento después de revalidar contexto, versión e idempotencia.                   |
| `SIN_AUTORIZACION`         | Falta permiso, destino, área, relación, etapa o condición de la acción.                                   | Fallar cerrado y explicar la razón sin revelar datos protegidos.                            |
| `CONTEXTO_REVOCADO`        | Cambió turno, check-in, rol operativo, permiso, destino, área, asignación o custodia.                     | Invalidar colas y comandos; resolver nuevamente desde servidor.                             |
| `CONECTIVIDAD_INCIERTA`    | No se conoce el resultado de una mutación o la red está intermitente.                                     | No repetir a ciegas ni mostrar éxito; reconciliar por receipt, versión y clave idempotente. |
| `TAREA_CAMBIADA`           | La etapa, versión, prioridad, handoff o actor responsable cambió desde la carga de la vista.              | Rechazar el comando obsoleto y recargar la siguiente acción válida.                         |

Reconciliación:

```text
EXPECTED_INTERFACE_STATES = 14
MATERIALIZED_INTERFACE_STATES = 14
UNIQUE_INTERFACE_STATES = 14
MISSING_INTERFACE_STATES = 0
DUPLICATE_INTERFACE_STATES = 0
```

Una petición enviada no equivale a handoff aceptado, cantidad recibida,
receipt confirmado, inventario publicado, diferencia resuelta o cierre. Ante
resultado desconocido, el cliente reconcilia el hecho antes de ofrecer otro
intento.

---

#### 11. Reglas de estación, escaneo, evidencia y conectividad

1. el dispositivo personal, tablet, kiosco o estación de recepción no es el
   actor empresarial;
2. un dispositivo compartido exige sesión humana vigente antes de mostrar
   información protegida o mutar;
3. el escaneo identifica un recurso y hereda la tarea; no confirma handoff,
   cantidad, condición ni recepción;
4. la captura masiva puede reducir pasos, pero no asumir que todo llegó ni
   ocultar líneas que requieren cantidad real, conteo auxiliar o condición;
5. cada mutación usa clave idempotente, versión esperada y hora de servidor;
6. una operación offline queda pendiente de reconciliación y no se representa
   como exitosa;
7. si cambió el handoff, receipt, versión o custodia durante la desconexión, el
   comando obsoleto se rechaza;
8. fotografías, firmas, códigos o evidencia sensible requieren permiso,
   finalidad, retención y contrato atómico antes de habilitarse;
9. impresión y comprobantes se limitan a la recepción propia y no conceden
   acceso a la cola global;
10. la falta de evidencia no autoriza convertir una diferencia en recepción
    completa ni resolverla por silencio;
11. la recepción en un dispositivo compartido conserva actor, dispositivo,
    turno, sede, área, recurso y claves de correlación;
12. la pérdida de conexión no habilita saltar handoff, verificación, diferencia
    o decisión posterior.

---

#### 12. Evidencia técnica actual y diagnóstico

| Superficie o capacidad actual                          | Evidencia permitida                                                                                                                                                                                                   | Estado                   | Destino                                                       |
| ------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------ | ------------------------------------------------------------- |
| Inicio raíz `src/app/page.tsx`                         | Organiza acciones principalmente por tipo de sede y combina solicitar y recibir en el foco satélite; no resuelve una proyección dedicada por función receptora.                                                       | `IMPLEMENTADO_PARCIAL`   | Paquete de implementación NEXO                                |
| `NEXO-ROUTE-031` y hub de remisiones                   | Filtra por destino y alcance operativo de área en el flujo satélite, pero mezcla creación, seguimiento, recepción y acciones de otros carriles en una superficie extensa.                                             | `IMPLEMENTADO_PARCIAL`   | NEXO-UX-008; NEXO-UX-013; implementación NEXO                 |
| `NEXO-ROUTE-032` y detalle legacy                      | Usa `access.canReceive`, estados `in_transit` y `partial`, cantidades recibidas y faltantes, y diferencia recepción parcial de completa.                                                                              | `IMPLEMENTADO_PARCIAL`   | NEXO-UX-013; NEXO-UX-021; NEXO-UX-022                         |
| `ReceiveBatchShell`                                    | Permite selección por líneas y exige cantidad real o conteo auxiliar según medición, pero es un workbench de detalle y no un home de receptor.                                                                        | `IMPLEMENTADO_PARCIAL`   | NEXO-UX-013; NEXO-UX-023                                      |
| `NEXO-ROUTE-037` y página de shipments                 | Consulta shipments `in_transit`, captura cantidad por línea y confirma por RPC; la superficie por sí sola no demuestra filtro visible por función, destino, asignación o handoff.                                     | `IMPLEMENTADO_PARCIAL`   | NEXO-UX-013; implementación NEXO                              |
| RPC `confirm_remission_shipment_receipt`               | Bloquea el shipment, exige estado `in_transit`, valida líneas y cantidades, crea receipt y faltantes; no recibe clave idempotente ni versión esperada y acepta cada cantidad recibida como aceptada.                  | `IMPLEMENTADO_PARCIAL`   | NEXO-UX-013; AUTH-SRV-001 a AUTH-SRV-005; implementación NEXO |
| Modelo físico de receipts                              | Existen receipts, líneas, cantidades recibidas, aceptadas, rechazadas, en cuarentena, diferencias e índice opcional de idempotencia; la migración declara publicación de inventario destino para una etapa posterior. | `ESPECIFICADO`           | NEXO-UX-013; NEXO-UX-022; paquete de implementación NEXO      |
| Inicio dedicado por actor, destino, handoff y receipt  | No existe una superficie única que materialice el contrato aprobado de esta tarea.                                                                                                                                    | `NO_IMPLEMENTADO`        | Paquete de implementación NEXO                                |
| Coexistencia de `restock_requests` y shipments físicos | Ambos modelos representan recepción con estructuras y estados distintos; su coexistencia no prueba adopción, equivalencia ni conciliación única.                                                                      | `BLOQUEADO`              | NEXO-UX-009 a NEXO-UX-013                                     |
| Validación física, tablet, kiosco y offline            | No se ejecutó piloto con receptores, conductores, bultos, sellos, diferencias ni conectividad intermitente.                                                                                                           | `PENDIENTE_DE_EVIDENCIA` | NEXO-UX-023 a NEXO-UX-025                                     |

El código y las migraciones actuales demuestran superficies, contratos y
transiciones parciales. No demuestran el home completo, su priorización,
composición de capacidades, handoff físico, adopción única ni validación con
receptores reales.

---

#### 13. Brechas y bloqueos preservados

| Brecha                                                              | Efecto en el inicio                                                                   | Propietario documental                                       | Condición de salida                                                   |
| ------------------------------------------------------------------- | ------------------------------------------------------------------------------------- | ------------------------------------------------------------ | --------------------------------------------------------------------- |
| home dedicado inexistente                                           | el receptor entra por un inicio general o un hub mixto                                | paquete de implementación NEXO                               | proyección por función, destino y tarea materializada                 |
| coexistencia legacy y shipments                                     | una entrega puede tener dos representaciones no conciliadas                           | `NEXO-UX-009` a `NEXO-UX-013`                                | modelo de compatibilidad, precedencia y adopción aprobado             |
| handoff ordinario no materializado como comando independiente       | arribo, entrega física y recepción pueden confundirse                                 | `NEXO-UX-012`; `NEXO-UX-013`                                 | actores, estado, custodia, versión y evidencia del handoff definidos  |
| RPC sin clave idempotente ni versión esperada en su contrato actual | un reintento o vista obsoleta puede requerir reconciliación externa                   | `NEXO-UX-013`; AUTH-SRV-001 a AUTH-SRV-005                   | comando idempotente y control optimista materializados                |
| cantidad recibida aceptada automáticamente en RPC físico            | condición, rechazo y cuarentena no tienen decisión visible separada en esa superficie | `NEXO-UX-013`; `NEXO-UX-022`                                 | captura y decisión por línea diferenciadas                            |
| publicación de inventario destino diferida                          | receipt no demuestra saldo disponible ni ubicación                                    | `NEXO-UX-013`; `NEXO-UX-015`; paquete de implementación NEXO | asiento de inventario y putaway separados, idempotentes y conciliados |
| evidencia sensible sin contrato completo                            | fotografía, firma o código no se muestran como disponibles por inferencia             | `NEXO-UX-022`; `NEXO-UX-023`                                 | permiso, finalidad, retención, storage y comando aprobados            |
| validación física y offline pendiente                               | no existe evidencia de seguridad o usabilidad en la estación real                     | `NEXO-UX-023` a `NEXO-UX-025`                                | piloto con actores, dispositivos, handoffs y diferencias reales       |

Ningún bloqueo queda sin tarea responsable.

---

#### 14. Decisiones aprobadas

1. el inicio se resuelve por función `RECEPCION_EN_SEDE`, destino, permiso y
   relación, no por cargo ni presencia física en la sede;
2. existe una sola acción primaria: `CONTINUAR_SIGUIENTE_TAREA`;
3. las ocho colas representan arribo, handoff, verificación, recepción,
   diferencia, evidencia, continuidad y bloqueo;
4. la prioridad protege primero seguridad, custodia y handoffs activos;
5. el receptor ve únicamente cargas relacionadas con su destino y función;
6. `operador_integral_satelite` y `bodeguero` son fuentes ordinarias aprobadas
   dentro de sus contextos exactos;
7. caja, barra, cocina, salón, mostrador, producción, conductor y gerencia no
   reciben la función por inferencia;
8. una concesión individual conserva vigencia y alcance exactos;
9. haber solicitado no concede recepción, aunque una misma persona pueda
   ejercer ambas funciones;
10. el conductor no se auto-entrega ni auto-recibe la misma carga;
11. handoff, verificación física y confirmación son hechos separados;
12. recepción parcial no se presenta como completa;
13. reportar diferencia no equivale a resolverla ni ajustar inventario;
14. recibir no ejecuta putaway, traslado, publicación de saldo o cierre por
    inferencia;
15. una función adicional se abre como proyección separada;
16. las dieciséis rutas existentes conservan identidad y disposición;
17. los catorce estados fallan cerrados y no inventan éxito;
18. los modelos legacy y físico permanecen reconocidos sin declarar adopción
    única;
19. las superficies actuales son evidencia parcial y no validación;
20. no se modifica código, Supabase, permisos, datos ni operación;
21. `NEXO-UX-007` permanece reservada.

---

#### 15. Requisitos de prueba derivados

Se crean exactamente siete requisitos:

| Requisito       | Cobertura                                                                                                |
| --------------- | -------------------------------------------------------------------------------------------------------- |
| `TREQ-NEXO-069` | resolución autoritativa de actor, función receptora, destino, área, permiso, relación, handoff y versión |
| `TREQ-NEXO-070` | ocho secciones, acción primaria única, ocho colas y prioridad de servidor                                |
| `TREQ-NEXO-071` | decisión de las nueve etapas y separación entre handoff, recepción, diferencia, putaway y ajuste         |
| `TREQ-NEXO-072` | composición de siete casos y prohibición de auto-handoff o auto-recepción del conductor                  |
| `TREQ-NEXO-073` | disposición de dieciséis rutas con revalidación y fallo cerrado                                          |
| `TREQ-NEXO-074` | receipt, cantidades, condición, concurrencia, versión, idempotencia y coexistencia de modelos            |
| `TREQ-NEXO-075` | catorce estados y representación honesta de parcialidad, brechas y resultado desconocido                 |

No se modifica, difiere, descarta ni vuelve obsoleto ningún requisito histórico.

---

#### 16. Criterios de aceptación

- [ ] El archivo contiene exclusivamente `NEXO-UX-006`.
- [ ] La audiencia se define como `RECEPCION_EN_SEDE`, no como un rol universal.
- [ ] Se materializan exactamente tres fuentes de habilitación receptora.
- [ ] Se enumeran las funciones que no reciben permiso por inferencia.
- [ ] El contexto obligatorio contiene actor, turno, sede, área, permiso,
      relación, recurso, handoff, custodia, versión, dispositivo y conectividad.
- [ ] Existen exactamente ocho secciones y una acción primaria.
- [ ] Existen exactamente ocho colas únicas `RCVQ-*`.
- [ ] Existen exactamente siete casos únicos `RCV-COMP-*`.
- [ ] La misma persona puede solicitar y recibir solo mediante capacidades
      separadas.
- [ ] El conductor no puede auto-entregarse ni auto-recibirse la misma carga.
- [ ] Recepción y putaway permanecen separados.
- [ ] Las nueve etapas de `VPROC-0028` aparecen una sola vez.
- [ ] `VPROC-0028-E08` es el trabajo primario del receptor.
- [ ] `VPROC-0028-E09` permite captura y evidencia, no resolución unilateral.
- [ ] Las dieciséis rutas aparecen una sola vez y no se inventan URLs.
- [ ] `NEXO-ROUTE-037` se conserva como destino transitorio, no como prueba de
      home completo.
- [ ] Escaneo e impresión heredan la tarea y no conceden autoridad.
- [ ] Se materializan exactamente catorce estados únicos.
- [ ] Handoff, recepción parcial, conflicto, revocación y conectividad incierta
      no se muestran como éxito.
- [ ] El diagnóstico distingue código, migración, diseño, implementación y
      evidencia operativa.
- [ ] La coexistencia de los dos modelos queda reconocida y asignada.
- [ ] Se crean exactamente `TREQ-NEXO-069` a `TREQ-NEXO-075`.
- [ ] No se modifica ningún requisito histórico.
- [ ] No se modifica código, Supabase, permisos, datos ni despliegues.
- [ ] `NEXO-UX-007` permanece reservada y no iniciada.

---

#### 17. `NEXO-RECEIVER-HOME-HANDOFF-001`

| Resultado o brecha                                  | Estado actual                        | Tarea responsable              | Condición de salida                                                   |
| --------------------------------------------------- | ------------------------------------ | ------------------------------ | --------------------------------------------------------------------- |
| navegación por tarea receptora                      | `ESPECIFICADO`                       | `NEXO-UX-008`                  | inicio y navegación consumen tarea, función y contexto autoritativos  |
| detalle de recepción, cantidades y condition        | `ESPECIFICADO`                       | `NEXO-UX-013`                  | captura por línea, handoff, receipt, idempotencia y efectos definidos |
| ubicación posterior y putaway                       | `ESPECIFICADO` como función separada | `NEXO-UX-015`                  | receipt y movimiento de ubicación se correlacionan sin duplicarse     |
| escaneo contextual                                  | `ESPECIFICADO`                       | `NEXO-UX-020`                  | código identifica recurso y propone acción sin ejecutarla             |
| estados, cantidades y responsable visibles          | `ESPECIFICADO`                       | `NEXO-UX-021`                  | etapa, cantidad y siguiente acción se representan uniformemente       |
| diferencias, daño, rechazo, cuarentena y devolución | `BLOQUEADO`                          | `NEXO-UX-022`                  | captura, contención, decisión, resolución y cierre separados          |
| tablet, kiosco, periféricos y red intermitente      | `PENDIENTE_DE_EVIDENCIA`             | `NEXO-UX-023`                  | perfil de estación y contingencia certificados                        |
| prototipo con receptores                            | `PENDIENTE_DE_EVIDENCIA`             | `NEXO-UX-024`                  | recorridos prioritarios probados con actores y escenarios reales      |
| métricas y piloto                                   | `PENDIENTE_DE_EVIDENCIA`             | `NEXO-UX-025`                  | umbrales y evidencia operativa aprobados                              |
| implementación del home                             | `NO_IMPLEMENTADO`                    | paquete de implementación NEXO | componentes, consultas, guards, comandos y pruebas materializados     |

Esta tarea no inicia ninguno de esos trabajos.

---

#### 18. Continuidad canónica

**ÚLTIMA TAREA APROBADA**

`NEXO-UX-005 — Diseñar inicio para conductor`

**TAREA ACTUAL APROBADA**

`NEXO-UX-006 — Diseñar inicio para receptor`

**SIGUIENTE TAREA RESERVADA**

`NEXO-UX-007 — Diseñar inicio para supervisor`


### ✅ NEXO-UX-007 — Diseñar inicio para supervisor

**Estado:** APROBADA
**Tarea anterior:** `NEXO-UX-006 — Diseñar inicio para receptor` — APROBADA
**Tarea siguiente:** `NEXO-UX-008 — Organizar navegación por tareas y no por rutas técnicas` — RESERVADA
**Tipo de tarea:** documental; diseño funcional completo del inicio de supervisión de NEXO, alcance territorial, colas de control, diferencias, excepciones, cumplimiento, autorizaciones atómicas, vencimientos, cierres, composición de capacidades, estados, decisiones por etapa y ruta, y handoff de implementación
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/K_NEXO/04_EXPERIENCIA_DE_INVENTARIO_LOGISTICA_Y_ACTIVOS.md`
**Repositorio de aplicación inspeccionado:** `vento-nexo`
**Artefactos producidos:** `NEXO-SUPERVISOR-HOME-CONTRACT-001`, `NEXO-SUPERVISOR-HOME-INFORMATION-ARCHITECTURE-001`, `NEXO-SUPERVISOR-WORK-QUEUE-CATALOG-001`, `NEXO-SUPERVISOR-CAPABILITY-COMPOSITION-CONTRACT-001`, `NEXO-SUPERVISOR-STAGE-PROJECTION-MATRIX-001`, `NEXO-SUPERVISOR-ROUTE-DISPOSITION-001`, `NEXO-SUPERVISOR-HOME-STATE-CONTRACT-001` y `NEXO-SUPERVISOR-HOME-HANDOFF-001`
**Decisiones consumidas:** `NEXO-UX-LANE-CONTRACT-001`; `NEXO-REQUESTER-HOME-CONTRACT-001`; `NEXO-WAREHOUSE-HOME-CONTRACT-001`; `NEXO-DRIVER-HOME-CONTRACT-001`; `NEXO-RECEIVER-HOME-CONTRACT-001`; `AUTH-RBAC-001` a `AUTH-RBAC-004`; `AUTH-RBAC-019`; `PROC-PROCESS-RACI-MATRIX-001`; `VPROC-0023` a `VPROC-0028`; inventario `NEXO-ROUTE-001` a `NEXO-ROUTE-064`; requisitos `TREQ-*` vigentes; código, migraciones y contratos actuales de `vento-nexo` y `vento-shell`
**Cambios físicos autorizados:** ninguno; no modifica código, rutas, permisos, roles, datos, stock, movimientos, conteos, remisiones, ajustes, Supabase, migraciones, RLS, configuración ni despliegues

---

#### 1. Propósito

Diseñar el inicio de NEXO para la función de `SUPERVISION`, de modo que una
persona con autoridad territorial y permiso exactos pueda identificar el caso
de control más urgente, investigar hechos, vigilar vencimientos, revisar
cumplimiento, ejecutar únicamente decisiones atómicas realmente concedidas y
cerrar controles con evidencia, sin convertirse por inferencia en solicitante,
bodeguero, conductor, receptor, configurador ni aprobador general de
excepciones.

La regla canónica es:

```text
PRINCIPAL TECNICO VIGENTE
+
ACTOR EMPRESARIAL EFECTIVO
+
FUNCION SUPERVISORA O CAPACIDAD BASE EXACTA
+
SEDES Y AREAS ACTIVAMENTE ASIGNADAS
+
RECURSO LOCAL O RELACIONAL COMPATIBLE
+
PERMISO ATOMICO DE CONSULTA O DECISION
+
HECHO OPERATIVO ORIGINAL INMUTABLE
+
EVIDENCIA, RESPONSABLE, VENCIMIENTO Y VERSION VIGENTES
+
PRIORIDAD DE CONTROL AUTORITATIVA
→
INICIO DEL SUPERVISOR
```

La proyección visual no concede autoridad. El nombre del cargo, aparecer como
rol administrativo, pertenecer a una sede, seleccionar otra sede, conocer la
URL, observar una diferencia o tener acceso de lectura no habilitan por sí
solos registrar ajustes, aprobar variaciones, cancelar remisiones, ejecutar
conteos, mutar inventario, resolver excepciones sensibles ni operar en nombre
de otro actor.

---

#### 2. Resultado material

Se aprueban ocho artefactos documentales consumibles:

1. `NEXO-SUPERVISOR-HOME-CONTRACT-001`, que define audiencia, autoridad,
   territorio, recursos, evidencia, segregación y límites;
2. `NEXO-SUPERVISOR-HOME-INFORMATION-ARCHITECTURE-001`, que materializa ocho
   secciones y una única acción primaria;
3. `NEXO-SUPERVISOR-WORK-QUEUE-CATALOG-001`, que define ocho colas de bloqueo,
   vencimiento, excepción, diferencia, autorización, cumplimiento, cierre y
   continuidad;
4. `NEXO-SUPERVISOR-CAPABILITY-COMPOSITION-CONTRACT-001`, que resuelve siete
   casos de composición entre supervisión, solicitud, bodega, conducción,
   recepción, autoridad superior y concesión individual;
5. `NEXO-SUPERVISOR-STAGE-PROJECTION-MATRIX-001`, que decide doce etapas de
   control pertenecientes a `VPROC-0023`, `VPROC-0024`, `VPROC-0026`,
   `VPROC-0027` y `VPROC-0028`;
6. `NEXO-SUPERVISOR-ROUTE-DISPOSITION-001`, que decide dieciocho rutas
   existentes sin inventar URLs ni convertir navegación en permiso;
7. `NEXO-SUPERVISOR-HOME-STATE-CONTRACT-001`, que define catorce estados de
   contexto, carga, vacío, evidencia, conflicto, versión, autorización y
   resultado desconocido;
8. `NEXO-SUPERVISOR-HOME-HANDOFF-001`, que separa diseño, navegación, flujos de
   control, implementación, pruebas y certificación.

Cobertura materializada:

| Elemento                                  | Total esperado | Total materializado | Faltantes | Duplicados |
| ----------------------------------------- | -------------: | ------------------: | --------: | ---------: |
| Procesos canónicos reconciliados          |              5 |                   5 |         0 |          0 |
| Etapas canónicas decididas                |             12 |                  12 |         0 |          0 |
| Clases de cola supervisora                |              8 |                   8 |         0 |          0 |
| Casos de composición de capacidades       |              7 |                   7 |         0 |          0 |
| Rutas relevantes decididas                |             18 |                  18 |         0 |          0 |
| Secciones obligatorias                    |              8 |                   8 |         0 |          0 |
| Acciones primarias                        |              1 |                   1 |         0 |          0 |
| Estados de interfaz                       |             14 |                  14 |         0 |          0 |
| Requisitos de prueba nuevos o modificados |              7 |                   7 |         0 |          0 |

La tarea deja el diseño en estado `ESPECIFICADO`. No declara el inicio dedicado
`IMPLEMENTADO` ni `VALIDADO`.

---

#### 3. Alcance funcional

##### 3.1. Incluido

- inicio supervisor resuelto por actor, cobertura territorial, recurso y
  permiso exactos;
- colas de control sobre inventario, ubicaciones, conteos, condición,
  remisiones, logística, activos relacionados e impresión operativa;
- diferencias, excepciones, riesgos, vencimientos y casos sin responsable;
- evidencia del hecho original, historial, actor, fecha, versión y correlación;
- investigación y comparación entre stock, movimientos, conteos, remisiones,
  receipts, LPN, ubicaciones y lotes visibles dentro del alcance;
- decisiones atómicas cuando exista permiso canónico específico;
- escalamiento cuando el catálogo no conceda la decisión al supervisor;
- seguimiento de responsable, fecha objetivo, SLA o vencimiento aprobado;
- cierre de control separado del hecho operativo y de la mutación correctiva;
- prioridad y desempate autoritativos;
- composición entre rol base supervisor y funciones operativas adicionales;
- decisión explícita por etapa y ruta relevante;
- diagnóstico de las superficies y comandos actuales de `vento-nexo`.

##### 3.2. Excluido

- acceso global derivado del rol o de la selección visual de sede;
- operación física por el solo hecho de supervisar;
- solicitud, preparación, conducción o recepción de remisiones sin capacidad
  operativa independiente;
- ejecución de conteos, entradas, retiros, transferencias o validaciones de
  stock mediante el rol base;
- registro de ajustes por el rol base `supervisor`;
- aprobación o resolución general de variaciones internas;
- cancelación sensible de remisiones;
- modificación estructural de productos, ubicaciones, rutas, políticas,
  plantillas o permisos;
- reescritura, eliminación o sustitución del hecho operativo original;
- cierre sin evidencia, responsable, decisión y resultado verificables;
- autoridad financiera completa, márgenes o valores internos protegidos;
- diseño detallado de cada flujo de conteo, ajuste, condición o excepción,
  asignado a `NEXO-UX-018`, `NEXO-UX-019` y `NEXO-UX-022`;
- cambios en código, datos, permisos o Supabase;
- validación operativa, física, tablet, kiosco u offline.

---

#### 4. `NEXO-SUPERVISOR-HOME-CONTRACT-001`

##### 4.1. Audiencia funcional

La audiencia primaria es el rol base `supervisor` dentro de las sedes y áreas
activamente asignadas. Esta identidad representa autoridad administrativa
local limitada y subordinada a la gerencia; no constituye administración
integral de sede, aprobación general de excepciones, configuración estructural
ni acceso operativo automático.

También podrá consumir una proyección supervisora una persona distinta cuando
posea una concesión base o individual explícita que otorgue la capacidad exacta
sobre el territorio y recurso correspondientes. El nombre `propietario`,
`gerente_general`, `gerente`, `gerencia_operativa` o cualquier otro cargo no
sustituye la evaluación de su matriz, permiso, alcance y recurso.

La matriz base vigente del supervisor concede, entre otras, consultas sobre:

```text
nexo.inventory.adjustments.view
nexo.inventory.entries.view
nexo.inventory.locations.view
nexo.inventory.lpns.view
nexo.inventory.movements.view
nexo.inventory.stock.view
nexo.inventory.production_batches.view
nexo.inventory.transfers.view
nexo.inventory.withdrawals.view
nexo.inventory.zones.view
nexo.inventory.storage_positions.view
nexo.inventory.warehouse_operations.view
nexo.inventory.stock_counts.view
nexo.inventory.initial_counts.view
nexo.inventory.remissions.view
nexo.logistics.operations_board.view
nexo.logistics.operations.view
nexo.logistics.driver_operations.view
nexo.logistics.fulfillment.view
nexo.printing.jobs.view
```

La misma matriz no concede por defecto:

```text
nexo.inventory.adjustments.register
nexo.inventory.entries.register
nexo.inventory.entries.override
nexo.inventory.transfers.create
nexo.inventory.withdrawals.register
nexo.inventory.stock_validations.perform
nexo.inventory.stock_counts.perform
nexo.inventory.remissions.request
nexo.inventory.remissions.prepare
nexo.inventory.remissions.dispatch
nexo.inventory.remissions.receive
nexo.inventory.remissions.cancel
nexo.finance.internal_variances.approve
nexo.finance.internal_variances.resolve
```

La ausencia de una capacidad de decisión no se corrige mostrando un botón más
amplio. El caso permanece informativo, bloqueado o escalado hasta que exista
una autoridad canónica aplicable.

##### 4.2. Contexto obligatorio

El inicio deberá resolver como mínimo:

| Componente                 | Regla                                                                     |
| -------------------------- | ------------------------------------------------------------------------- |
| principal técnico          | identidad autenticada y vigente                                           |
| actor efectivo             | persona empresarial atribuible a cada lectura y decisión                  |
| carril                     | `SUPERVISION`, separado de funciones operativas y configuración           |
| rol o concesión            | fuente exacta de la capacidad supervisora                                 |
| territorio                 | unión explícita de sedes `AS` y áreas `AA`, nunca global implícito        |
| recurso                    | entidad local o relacional cuyo contrato satisface el alcance             |
| permiso de lectura         | clave exacta necesaria para observar el caso y su evidencia               |
| permiso de decisión        | clave atómica independiente cuando la acción muta o resuelve              |
| hecho original             | evento, observación, movimiento, receipt, sesión o diferencia preservados |
| evidencia                  | fuentes disponibles, completitud, integridad y restricciones              |
| responsable                | actor o función dueña de la siguiente acción                              |
| vencimiento                | fecha, ventana, SLA o condición temporal aprobada                         |
| versión                    | estado, política, recurso y versión esperada del caso                     |
| dispositivo y conectividad | contexto técnico sin autoridad propia y condición de reconciliación       |

Las capacidades base del supervisor no exigen turno ni check-in, pero sí
empleado activo, asignaciones territoriales vigentes, recurso resoluble,
permiso activo y ausencia de denegaciones. Cuando la misma persona cambia a
una función operativa, esa función sí resuelve sus propios prerrequisitos de
turno, check-in, sede, área, estación y recurso.

##### 4.3. Alcance territorial y de recurso

Un caso solo puede aparecer cuando la lectura autorizada coincida con al menos
una relación verificable:

```text
RECURSO_LOCAL_EN_SEDE_ASIGNADA
RECURSO_DE_AREA_ASIGNADA
RECURSO_RELACIONAL_CON_EXTREMO_ASIGNADO
CASO_FORMALMENTE_ASIGNADO_AL_SUPERVISOR
DECISION_ATRIBUIDA_MEDIANTE_CONCESION_EXPLICITA
CASO_CREADO_POR_UN_PROCESO_DENTRO_DE_SU_COBERTURA
```

La visibilidad de un extremo de una remisión o traslado no concede autoridad
sobre el otro extremo. Una sede elegida en un filtro no amplía la cobertura.
Una unión de varias sedes asignadas no se transforma en alcance global.

##### 4.4. Contrato de hecho y decisión

Toda tarjeta supervisora conserva dos planos independientes:

```text
HECHO_OPERATIVO_ORIGINAL
+
EVIDENCIA_Y_VERSION
→
CASO_DE_CONTROL

CASO_DE_CONTROL
+
AUTORIDAD_ATOMICA
+
MOTIVO_Y_RESULTADO
→
DECISION_SUPERVISORA_AUDITABLE
```

La decisión no borra ni reescribe el hecho. Cuando requiera una mutación de
inventario, remisión, condición o estado, deberá emitir o autorizar una
transición explícita ejecutada por el actor y comando correspondientes.

##### 4.5. Segregación y conflicto de interés

La misma persona puede tener rol base supervisor y una función operativa, pero
no puede usar esa composición para:

- aprobar su propia captura, diferencia o excepción sensible;
- confirmar su propio conteo y aplicar el ajuste derivado sin una separación
  canónica;
- recibir una carga y resolver unilateralmente su faltante, daño o rechazo;
- conducir una carga y cerrar su propia ruptura de custodia;
- preparar una remisión y declarar resuelto su propio faltante;
- registrar un ajuste y aprobarlo desde la misma atribución;
- ejecutar y certificar la misma acción cuando la política exija independencia.

El servidor detecta actor real, actor efectivo, autores del hecho, responsables,
participantes y decisiones previas antes de ofrecer una acción.

---

#### 5. `NEXO-SUPERVISOR-HOME-INFORMATION-ARCHITECTURE-001`

##### 5.1. Orden obligatorio

| Orden | Sección                            | Propósito                                                                                               | Acción permitida                                                       |
| ----: | ---------------------------------- | ------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------- |
|     1 | Contexto supervisor                | mostrar actor, fuente de autoridad, sedes, áreas, filtros, hora de corte y calidad de datos             | cambiar alcance solo mediante selector canónico dentro de la cobertura |
|     2 | Siguiente control                  | presentar una única prioridad autoritativa                                                              | `CONTINUAR_SIGUIENTE_TAREA`                                            |
|     3 | Riesgos y vencimientos             | destacar seguridad, custodia, condición, SLA y acciones vencidas o próximas                             | abrir el caso exacto sin resolverlo por inferencia                     |
|     4 | Diferencias e investigación        | reunir discrepancias de stock, conteo, remisión, receipt, ubicación, condición o documento              | abrir evidencia, historial y comparación                               |
|     5 | Autorizaciones y escalamiento      | mostrar decisiones pendientes y autoridad requerida                                                     | decidir solo con permiso atómico o escalar al actor competente         |
|     6 | Cumplimiento y seguimiento         | vigilar responsables, etapas, cantidades, tiempos y compromisos                                         | registrar seguimiento permitido sin mutar el hecho                     |
|     7 | Cierres y resultados recientes     | presentar controles listos para cierre y decisiones confirmadas                                         | cerrar únicamente con evidencia y permiso exactos                      |
|     8 | Funciones adicionales y utilidades | acceso separado a funciones operativas realmente concedidas, búsqueda, escaneo e impresión contextuales | cambiar de función o invocar utilidad sin fusionar carriles            |

Las secciones pueden estar vacías. No se rellenan con trabajo de territorios no
autorizados, indicadores sin fuente, configuración reutilizable ni acciones
operativas concedidas por conveniencia.

##### 5.2. Acción primaria

La única acción primaria es:

```text
CONTINUAR_SIGUIENTE_TAREA
```

Se habilita solo cuando el servidor devuelve un caso vigente con actor,
territorio, recurso, permiso de lectura, acción atribuida, evidencia mínima,
responsable, vencimiento, estado, versión y ausencia de conflicto compatibles.
El cliente no envía como autoridad el rol, territorio, prioridad, severidad,
estado, decisión, actor responsable ni resultado.

##### 5.3. Tarjeta mínima

Cada caso visible muestra como mínimo:

| Campo               | Regla                                                                            |
| ------------------- | -------------------------------------------------------------------------------- |
| identificador       | código estable del caso y del recurso origen                                     |
| categoría           | bloqueo, vencimiento, excepción, diferencia, autorización, cumplimiento o cierre |
| territorio          | sede, área y extremos relacionales autorizados                                   |
| hecho original      | evento, observación o estado que originó el control                              |
| evidencia           | fuentes, completitud y última actualización                                      |
| impacto             | inventario, custodia, condición, continuidad, servicio o cumplimiento afectado   |
| severidad           | valor derivado de reglas vigentes, no editado libremente por el cliente          |
| responsable         | actor o función de la siguiente acción                                           |
| vencimiento         | fecha, ventana o condición temporal aplicable                                    |
| autoridad requerida | permiso atómico y segregación exigidos                                           |
| versión             | estado y versión esperada del caso y recurso                                     |
| siguiente acción    | transición exacta, escalamiento o acceso de solo lectura                         |

##### 5.4. Prioridad

La prioridad se resuelve en este orden:

```text
1. SEGURIDAD_CUSTODIA_O_CONDICION_BLOQUEANTE
2. CASO_VENCIDO_CON_IMPACTO_OPERATIVO
3. EXCEPCION_CRITICA_SIN_RESPONSABLE_O_SIN_CONTENCION
4. DIFERENCIA_CON_RIESGO_DE_PROPAGACION_O_DOBLE_EFECTO
5. AUTORIZACION_ATOMICA_QUE_DESBLOQUEA_TRABAJO
6. INCUMPLIMIENTO_ACTIVO_DE_ETAPA_CANTIDAD_O_TIEMPO
7. CASO_COMPLETO_LISTO_PARA_CIERRE
8. CONTINUIDAD_O_SEGUIMIENTO_NO_URGENTE
```

Los desempates usan, en orden: severidad canónica, vencimiento, antigüedad del
caso, alcance afectado, fecha del último hecho y un identificador estable. El
cliente no puede elevar prioridad mediante filtros, orden local o parámetros.

---

#### 6. `NEXO-SUPERVISOR-WORK-QUEUE-CATALOG-001`

| Cola                | Criterio de inclusión                                                                                | Acción supervisora                                                                          | Límite obligatorio                                                      | Estado         |
| ------------------- | ---------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------- | -------------- |
| `SUPQ-BLOQUEO`      | seguridad, custodia, condición, territorio, integridad, versión o dependencia impiden continuar      | inspeccionar causa, confirmar contención visible y dirigir al propietario exacto            | no levanta cuarentena, ajusta, cancela ni libera sin permiso atómico    | `ESPECIFICADO` |
| `SUPQ-VENCIMIENTO`  | SLA, ventana, inspección, conteo, recepción, evidencia o acción responsable vencidos o próximos      | priorizar, asignar seguimiento permitido y escalar                                          | no altera fechas, políticas o hechos para ocultar incumplimiento        | `ESPECIFICADO` |
| `SUPQ-EXCEPCION`    | daño, pérdida, ruptura de custodia, rechazo, devolución, error de impresión u otra excepción abierta | investigar, clasificar dentro del catálogo aprobado y contener mediante acciones concedidas | no inventa resolución ni aplica efectos de inventario o disposición     | `ESPECIFICADO` |
| `SUPQ-DIFERENCIA`   | diferencia entre observación, stock, conteo, movimiento, remisión, receipt, ubicación o documento    | comparar fuentes, solicitar evidencia y determinar la siguiente autoridad                   | calcular o observar no equivale a ajustar ni aprobar                    | `ESPECIFICADO` |
| `SUPQ-AUTORIZACION` | una transición requiere decisión atómica y existe actor competente identificable                     | decidir cuando el permiso exacto y la segregación coincidan, o escalar                      | el rol supervisor no recibe aprobación general ni capacidades denegadas | `ESPECIFICADO` |
| `SUPQ-CUMPLIMIENTO` | etapa, cantidad, responsable, tiempo, evidencia o secuencia se apartan del contrato esperado         | hacer seguimiento, solicitar corrección operativa y registrar estado de control             | no reescribe el hecho ni ejecuta en nombre del responsable              | `ESPECIFICADO` |
| `SUPQ-CIERRE`       | evidencia, decisiones y efectos requeridos están completos y conciliados                             | cerrar el caso de control con motivo, resultado y versión                                   | cerrar control no borra diferencia, movimiento, receipt o historial     | `ESPECIFICADO` |
| `SUPQ-CONTINUIDAD`  | caso resuelto, seguimiento programado o función adicional autorizada                                 | consultar resultado, programar seguimiento permitido o cambiar de función                   | no crea trabajo ficticio ni mantiene casos cerrados como pendientes     | `ESPECIFICADO` |

Reconciliación:

```text
EXPECTED_SUPERVISOR_QUEUES = 8
MATERIALIZED_SUPERVISOR_QUEUES = 8
UNIQUE_SUPERVISOR_QUEUES = 8
MISSING_SUPERVISOR_QUEUES = 0
DUPLICATE_SUPERVISOR_QUEUES = 0
```

Un mismo hecho puede originar señales en varias colas, pero tendrá un caso
primario y una siguiente acción autoritativos. La deduplicación conserva
correlación, no oculta impactos distintos ni crea decisiones duplicadas.

---

#### 7. `NEXO-SUPERVISOR-CAPABILITY-COMPOSITION-CONTRACT-001`

##### 7.1. Principio

```text
MISMA PERSONA
≠
MISMA FUNCION
≠
MISMO TERRITORIO
≠
MISMO PERMISO
≠
MISMA ETAPA
≠
MISMA DECISION
```

La composición agrega accesos vigentes; nunca fusiona permisos, colas,
transiciones, autoría, segregación ni auditoría.

##### 7.2. Casos materializados

| Caso           | Capacidades de la persona                                 | Proyección resultante                                                                  | Regla obligatoria                                                                        | Estado         |
| -------------- | --------------------------------------------------------- | -------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- | -------------- |
| `SUP-COMP-001` | rol base `supervisor` sin función operativa adicional     | home supervisor limitado a `AS`, `AA`, recursos compatibles y permisos base concedidos | no muestra ni ejecuta capacidades `OPERATIONAL_ONLY` o `BASE_AND_OPERATIONAL` denegadas  | `ESPECIFICADO` |
| `SUP-COMP-002` | supervisor y solicitante                                  | supervisión y solicitud como proyecciones separadas                                    | no prioriza, corrige ni aprueba su propia solicitud mediante el carril supervisor        | `ESPECIFICADO` |
| `SUP-COMP-003` | supervisor y bodeguero                                    | control local y operación de bodega separados                                          | conteo, picking, movimiento o captura propios no se convierten en decisión independiente | `ESPECIFICADO` |
| `SUP-COMP-004` | supervisor y conductor                                    | monitoreo supervisor y custodia de transporte separados                                | no cierra su propia ruptura, retraso, entrega o retorno cuando se exige independencia    | `ESPECIFICADO` |
| `SUP-COMP-005` | supervisor y receptor                                     | recepción y control de diferencias separados                                           | no aprueba su propio faltante, daño, rechazo, devolución, cuarentena o ajuste            | `ESPECIFICADO` |
| `SUP-COMP-006` | supervisor y autoridad superior con permisos adicionales  | cada acción usa la fuente de autoridad y alcance exactos                               | la capacidad superior no se presume por jerarquía ni convierte el home en global         | `ESPECIFICADO` |
| `SUP-COMP-007` | capacidad supervisora por concesión individual o temporal | proyección limitada a permiso, territorio, recurso, vigencia y motivo                  | no crea rol permanente, herencia, acceso global ni autoridad posterior a revocación      | `ESPECIFICADO` |

Reconciliación:

```text
EXPECTED_COMPOSITION_CASES = 7
MATERIALIZED_COMPOSITION_CASES = 7
UNIQUE_COMPOSITION_CASES = 7
MISSING_COMPOSITION_CASES = 0
DUPLICATE_COMPOSITION_CASES = 0
```

##### 7.3. Secuencia obligatoria de control

```text
HECHO_OPERATIVO_CONFIRMADO
→
CASO_DE_CONTROL_CORRELACIONADO
→
ALCANCE_Y_EVIDENCIA_RESUELTOS
→
INVESTIGACION_SIN_MUTACION_SILENCIOSA
→
DECISION_ATOMICA_O_ESCALAMIENTO
→
EFECTO_SEPARADO_EJECUTADO_POR_COMANDO_AUTORIZADO
→
CONCILIACION_DE_RESULTADO
→
CIERRE_DE_CONTROL_AUDITABLE
```

No se permite saltar del hallazgo al ajuste, cancelación, disposición o cierre.
La persona que originó el hecho puede aportar evidencia, pero la independencia
exigida se conserva antes de decidir o certificar.

---

#### 8. `NEXO-SUPERVISOR-STAGE-PROJECTION-MATRIX-001`

| Etapa            | Nombre canónico                                                 | Proyección supervisora                 | Acción permitida                                                                                  | Límite                                                                 | Estado         |
| ---------------- | --------------------------------------------------------------- | -------------------------------------- | ------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------- | -------------- |
| `VPROC-0023-E04` | Consultar stock por sede, LOC o posición                        | `CONTROL_DE_EXISTENCIAS_Y_UBICACION`   | consultar consolidado, anomalías y trazabilidad dentro del alcance                                | no configura ubicación ni mueve stock por inferencia                   | `ESPECIFICADO` |
| `VPROC-0024-E06` | Publicar, corregir o reversar entrada                           | `SEPARACION_DE_HECHO_Y_DECISION`       | investigar entrada, evidencia y efecto; decidir o escalar mediante permiso atómico                | no registra ni reversa por el solo rol supervisor                      | `ESPECIFICADO` |
| `VPROC-0026-E01` | Abrir sesión de conteo                                          | `CONTROL_DE_APERTURA`                  | definir o revisar alcance, responsable y propósito cuando exista autoridad exacta                 | abrir control no concede ejecución del conteo                          | `ESPECIFICADO` |
| `VPROC-0026-E02` | Congelar alcance y stock de apertura                            | `LINEA_BASE_DE_CONTROL`                | verificar corte, universo, versión y exclusiones                                                  | no altera el stock inicial para acomodar resultados                    | `ESPECIFICADO` |
| `VPROC-0026-E05` | Calcular diferencia                                             | `INVESTIGACION_DE_DIFERENCIA`          | comparar observación, línea base, movimientos y evidencia                                         | la diferencia calculada no muta saldo                                  | `ESPECIFICADO` |
| `VPROC-0026-E06` | Aplicar reconciliación o ajuste autorizado                      | `DECISION_Y_EFECTO_SEPARADOS`          | autorizar o escalar solo con capacidad atómica; verificar efecto posterior                        | el rol base no recibe `nexo.inventory.adjustments.register`            | `ESPECIFICADO` |
| `VPROC-0026-E07` | Cerrar sesión y conservar historial                             | `CIERRE_DE_CONTROL`                    | comprobar completitud, decisiones, efectos y evidencia antes del cierre                           | no elimina observaciones ni diferencias históricas                     | `ESPECIFICADO` |
| `VPROC-0027-E04` | Evaluar condición, temperatura y aptitud                        | `EVALUACION_DE_CONDICION`              | revisar evidencia, política aplicable, riesgo y contención                                        | no libera, dispone ni reclasifica sin autoridad exacta                 | `ESPECIFICADO` |
| `VPROC-0027-E05` | Decidir liberación, merma, pérdida, rechazo o disposición       | `DECISION_SENSIBLE_ATOMICA`            | decidir solo con permiso específico y segregación; de lo contrario escalar                        | supervisión no equivale a aprobación general                           | `ESPECIFICADO` |
| `VPROC-0027-E07` | Conservar evidencia y cerrar caso                               | `CIERRE_DE_EXCEPCION`                  | conciliar decisión, efecto, responsable y evidencia                                               | cerrar no borra condición, movimiento ni documento                     | `ESPECIFICADO` |
| `VPROC-0028-E03` | Crear origen y fulfillment por línea                            | `CONTROL_DE_ASIGNACION_Y_CUMPLIMIENTO` | consultar responsabilidad, disponibilidad y faltantes; corregir solo campos ordinarios permitidos | no prepara, despacha ni reasigna por inferencia                        | `ESPECIFICADO` |
| `VPROC-0028-E09` | Resolver faltante, sobrante, daño, rechazo, devolución o cierre | `RESOLUCION_SEGREGADA_DE_DIFERENCIA`   | investigar, atribuir, decidir o escalar y conciliar el resultado                                  | no autoaprueba hechos creados por una función propia ni duplica efecto | `ESPECIFICADO` |

Reconciliación:

```text
EXPECTED_SUPERVISOR_STAGES = 12
MATERIALIZED_SUPERVISOR_STAGES = 12
UNIQUE_SUPERVISOR_STAGES = 12
MISSING_SUPERVISOR_STAGES = 0
DUPLICATE_SUPERVISOR_STAGES = 0
```

Las demás etapas de `VPROC-0023` a `VPROC-0028` permanecen operativas,
configurativas o de solo referencia. No adquieren carácter supervisor por
aparecer en una investigación.

---

#### 9. `NEXO-SUPERVISOR-ROUTE-DISPOSITION-001`

| Ruta             | Patrón actual                           | Disposición                                           | Decisión materializada                                                                                                                  | Estado         |
| ---------------- | --------------------------------------- | ----------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------- | -------------- |
| `NEXO-ROUTE-001` | `/`                                     | `PROYECTAR_HOME_SUPERVISOR`                           | reemplazar el cockpit administrativo genérico por contexto, siguiente control y colas territoriales                                     | `ESPECIFICADO` |
| `NEXO-ROUTE-002` | `/inventory/adjust`                     | `SEPARAR_INVESTIGACION_DE_REGISTRO`                   | consultar causa y evidencia; registrar ajuste solo mediante capacidad independiente no concedida por defecto al supervisor              | `ESPECIFICADO` |
| `NEXO-ROUTE-003` | `/inventory/assets`                     | `RESUMEN_SUPERVISOR_DE_SOLO_LECTURA`                  | consultar condición, custodia y casos dentro del alcance; el subdominio se conserva para tareas posteriores                             | `ESPECIFICADO` |
| `NEXO-ROUTE-004` | `/inventory/assets/counts`              | `COLA_DE_CONTROL_DE_ACTIVOS`                          | consultar sesiones, diferencias y vencimientos; ejecución y decisiones sensibles se separan                                             | `ESPECIFICADO` |
| `NEXO-ROUTE-005` | `/inventory/assets/counts/[id]`         | `DIVIDIR_CAPTURA_Y_DECISION`                          | mostrar observaciones, investigación, decisión y cierre como affordances independientes                                                 | `ESPECIFICADO` |
| `NEXO-ROUTE-006` | `/inventory/assets/groups/[id]`         | `REFERENCIA_DE_CONDICION_Y_COMPLETITUD`               | consultar composición, faltantes, custodias y casos relacionados                                                                        | `ESPECIFICADO` |
| `NEXO-ROUTE-007` | `/inventory/assets/items/[id]`          | `REFERENCIA_DE_HISTORIAL_Y_CUSTODIA`                  | consultar identidad, condición, historial, documentos y casos vinculados                                                                | `ESPECIFICADO` |
| `NEXO-ROUTE-017` | `/inventory/count-initial`              | `CONTROL_DE_SESIONES`                                 | abrir o consultar sesiones únicamente según permiso atómico, alcance y segregación                                                      | `ESPECIFICADO` |
| `NEXO-ROUTE-018` | `/inventory/count-initial/session/[id]` | `DIVIDIR_OBSERVACION_INVESTIGACION_DECISION_Y_CIERRE` | separar captura operativa, diferencia, aprobación de efecto y cierre                                                                    | `ESPECIFICADO` |
| `NEXO-ROUTE-020` | `/inventory/locations`                  | `CONSULTA_SUPERVISORA`                                | consultar estructura, capacidad, bloqueos y anomalías; edición permanece en configuración                                               | `ESPECIFICADO` |
| `NEXO-ROUTE-021` | `/inventory/locations/[id]`             | `DETALLE_SUPERVISOR_DE_UBICACION`                     | consultar stock, posiciones, diferencias, movimientos y casos del recurso                                                               | `ESPECIFICADO` |
| `NEXO-ROUTE-028` | `/inventory/lpns`                       | `CONSULTA_SUPERVISORA_DE_IDENTIDAD`                   | consultar estado, custodia, contenido y excepciones de LPN dentro del alcance                                                           | `ESPECIFICADO` |
| `NEXO-ROUTE-029` | `/inventory/movements`                  | `LEDGER_DE_INVESTIGACION`                             | filtrar y correlacionar movimientos sin editar, eliminar ni compensar silenciosamente                                                   | `ESPECIFICADO` |
| `NEXO-ROUTE-030` | `/inventory/production-batches`         | `EVIDENCIA_DE_LOTE_EN_SOLO_LECTURA`                   | consumir identidad y trazabilidad necesarias sin asumir propiedad de FOGO                                                               | `ESPECIFICADO` |
| `NEXO-ROUTE-031` | `/inventory/remissions`                 | `COLA_SUPERVISORA_SEPARADA`                           | mostrar cumplimiento, diferencias y casos relacionados con sedes autorizadas; no mezclar solicitud, preparación, conducción o recepción | `ESPECIFICADO` |
| `NEXO-ROUTE-038` | `/inventory/remissions/transit`         | `SEPARAR_CUSTODIA_Y_MONITOREO`                        | el conductor conserva acciones de custodia; supervisión observa retrasos, rupturas y excepciones                                        | `ESPECIFICADO` |
| `NEXO-ROUTE-052` | `/inventory/stock`                      | `RESUMEN_DE_CONTROL_E_INVESTIGACION`                  | consultar saldo, ubicación, diferencias, antigüedad y trazabilidad dentro del territorio                                                | `ESPECIFICADO` |
| `NEXO-ROUTE-062` | `/printing/jobs`                        | `MONITOREO_TERRITORIAL_DE_TRABAJOS`                   | consultar fallos, reintentos y correlación de trabajos autorizados; plantillas permanecen fuera                                         | `ESPECIFICADO` |

Reconciliación:

```text
EXPECTED_RELEVANT_ROUTES = 18
MATERIALIZED_RELEVANT_ROUTES = 18
UNIQUE_RELEVANT_ROUTES = 18
MISSING_RELEVANT_ROUTES = 0
DUPLICATE_RELEVANT_ROUTES = 0
```

Toda ruta revalida en servidor principal, actor, fuente de autoridad, territorio,
recurso, permiso de lectura, permiso de decisión, autores del hecho, estado y
versión. El enlace visible, el filtro o la ruta alcanzable no sustituyen el
guard ni el contrato de mutación.

---

#### 10. `NEXO-SUPERVISOR-HOME-STATE-CONTRACT-001`

| Estado de interfaz        | Condición                                                                             | Respuesta obligatoria                                                         |
| ------------------------- | ------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------- |
| `RESOLVIENDO_CONTEXTO`    | se están resolviendo actor, autoridad, territorios, permisos, recursos y denegaciones | no mostrar colas definitivas ni habilitar decisiones                          |
| `SIN_FUNCION_SUPERVISORA` | la sesión es válida, pero no existe capacidad supervisora aplicable                   | mostrar causa sin exponer casos y ofrecer solo cambio de función autorizado   |
| `CARGANDO_CONTROL`        | la consulta autoritativa de casos está en curso                                       | mantener contexto visible y evitar métricas parciales como definitivas        |
| `CONTROL_DISPONIBLE`      | existe al menos una tarea supervisora válida y atribuida                              | habilitar solo `CONTINUAR_SIGUIENTE_TAREA` sobre la prioridad resuelta        |
| `SIN_CASOS_ABIERTOS`      | la consulta completa no devuelve casos pendientes dentro del alcance                  | mostrar vacío confirmado, hora de corte y filtros aplicados                   |
| `ALCANCE_INVALIDO`        | sede, área, extremo relacional o recurso no pertenecen a la cobertura                 | fallar cerrado y restablecer el último alcance válido                         |
| `EVIDENCIA_INSUFICIENTE`  | faltan fuentes obligatorias o existe contradicción material entre ellas               | permitir investigación o solicitud de evidencia, no decisión final            |
| `CONFLICTO_DE_INTERES`    | el actor participó en el hecho y la política exige independencia                      | bloquear decisión propia y escalar a otro actor competente                    |
| `CONFLICTO_DE_VERSION`    | cambió el caso, recurso, política, estado, responsable o efecto esperado              | rechazar el comando obsoleto y recargar hechos y versión vigentes             |
| `DATOS_PARCIALES`         | una fuente secundaria falló o el agregado está incompleto                             | etiquetar parcialidad; no inferir ausencia, igualdad, cumplimiento o cierre   |
| `ERROR_RECUPERABLE`       | la lectura o preparación del comando falló sin resultado confirmado                   | permitir reintento después de revalidar contexto y versión                    |
| `SIN_AUTORIZACION`        | existe lectura o caso, pero falta el permiso atómico de la acción                     | mantener solo la vista autorizada y ofrecer escalamiento, sin botón ficticio  |
| `CONTEXTO_REVOCADO`       | cambió empleado, asignación, permiso, concesión, territorio o denegación              | invalidar colas y comandos y resolver nuevamente desde servidor               |
| `RESULTADO_DESCONOCIDO`   | no se conoce el resultado de una decisión o mutación correlacionada                   | no repetir a ciegas ni mostrar éxito; reconciliar caso, efecto e idempotencia |

Reconciliación:

```text
EXPECTED_INTERFACE_STATES = 14
MATERIALIZED_INTERFACE_STATES = 14
UNIQUE_INTERFACE_STATES = 14
MISSING_INTERFACE_STATES = 0
DUPLICATE_INTERFACE_STATES = 0
```

Una decisión enviada no equivale a ajuste aplicado, remisión cancelada,
condición liberada, variación resuelta ni caso cerrado. Ante resultado
incompleto o desconocido, la interfaz conserva el hecho y reconcilia el efecto
antes de ofrecer otra acción.

---

#### 11. Reglas de filtros, indicadores, evidencia y conectividad

1. los filtros solo reducen un territorio ya autorizado; nunca lo amplían;
2. los indicadores se calculan desde casos y hechos trazables, con hora de
   corte, definición y estado de completitud;
3. un cero derivado de datos parciales no se presenta como ausencia confirmada;
4. severidad, prioridad, vencimiento y cumplimiento se derivan de reglas
   publicadas y conservan versión;
5. la búsqueda no expone identificadores o recursos fuera de la cobertura;
6. escaneo e impresión heredan el caso supervisor invocante y no conceden
   permiso de decisión;
7. cada decisión usa actor, motivo, permiso, versión esperada, correlación,
   clave idempotente y fecha de servidor;
8. una operación offline queda pendiente de reconciliación y no se representa
   como exitosa;
9. evidencia sensible aplica finalidad, minimización, retención y permisos
   antes de mostrarse o adjuntarse;
10. el cierre exige que decisiones, efectos y responsables obligatorios estén
    resueltos o formalmente transferidos;
11. el seguimiento no puede editar el hecho para hacer coincidir un indicador;
12. el acceso en dispositivo compartido conserva actor humano, estación,
    territorio, caso y trazabilidad, sin convertir el dispositivo en supervisor;
13. las métricas agregadas no habilitan acceso al detalle cuando falta permiso;
14. una brecha de contrato se muestra como bloqueo con propietario y condición
    de salida, no como función ejecutable.

---

#### 12. Evidencia técnica actual y diagnóstico

| Superficie o capacidad actual                           | Evidencia permitida                                                                                                                                                                                                                                                   | Estado                   | Destino                                               |
| ------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------ | ----------------------------------------------------- |
| Inicio raíz `src/app/page.tsx`                          | Identifica algunos roles administrativos mediante una lista literal, organiza accesos en `operate`, `verify`, `configure` y `utilities`, y mezcla acciones según tipo de sede; no resuelve un home supervisor por permisos, territorio, casos y conflicto de interés. | `IMPLEMENTADO_PARCIAL`   | paquete de implementación NEXO                        |
| comprobación de permisos del inicio                     | Consulta varias claves actuales y combina rol, override, sede y permisos, pero la etiqueta `isManagementRole` influye en el modo visual y no materializa la función supervisora canónica.                                                                             | `IMPLEMENTADO_PARCIAL`   | AUTH-UI-052; paquete de implementación NEXO           |
| `NEXO-ROUTE-002` y formulario de ajustes                | La página exige una capacidad amplia y permite seleccionar sede y registrar diferencia con motivo; no separa de forma visible investigación, autorización y ejecución atómica.                                                                                        | `IMPLEMENTADO_PARCIAL`   | NEXO-UX-019; paquete de implementación NEXO           |
| API actual de ajustes                                   | Autentica al usuario, lee saldos y escribe movimientos y saldos; la ruta no revalida explícitamente una capacidad canónica diferenciada de consulta y registro, ni presenta caso, aprobador, versión esperada o clave idempotente.                                    | `BLOQUEADO`              | AUTH-SRV-001 a AUTH-SRV-005; NEXO-UX-019              |
| `NEXO-ROUTE-017` y sesiones de conteo                   | Existen superficies para iniciar, capturar y consultar sesiones, pero no constituyen una bandeja supervisora unificada.                                                                                                                                               | `IMPLEMENTADO_PARCIAL`   | NEXO-UX-018; NEXO-UX-019                              |
| API actual de aprobación de conteo inicial              | Autentica, exige sesión `closed` y ejecuta `apply_inventory_count_adjustments`; la ruta no muestra una revalidación explícita de permiso atómico, territorio, segregación, versión o idempotencia.                                                                    | `BLOQUEADO`              | AUTH-SRV-001 a AUTH-SRV-005; NEXO-UX-018; NEXO-UX-019 |
| `NEXO-ROUTE-029` y `NEXO-ROUTE-052`                     | Movimientos y stock ofrecen fuentes útiles para investigación, pero son consultas independientes y no casos correlacionados con responsable, evidencia, vencimiento y cierre.                                                                                         | `IMPLEMENTADO_PARCIAL`   | NEXO-UX-008; implementación NEXO                      |
| `NEXO-ROUTE-031`                                        | El hub de remisiones reúne solicitud, preparación, conducción, recepción y seguimiento; no separa una cola supervisora de diferencias, cumplimiento y cierre.                                                                                                         | `IMPLEMENTADO_PARCIAL`   | NEXO-UX-008 a NEXO-UX-013                             |
| `NEXO-ROUTE-038`                                        | La página se presenta como vista de conductor y contiene acciones de custodia; no materializa monitoreo supervisor separado de retrasos, rupturas y excepciones.                                                                                                      | `IMPLEMENTADO_PARCIAL`   | NEXO-UX-012; implementación NEXO                      |
| `NEXO-ROUTE-062`                                        | Existe consulta de trabajos de impresión, pero la incorporación de fallos como casos supervisores territoriales no está demostrada.                                                                                                                                   | `IMPLEMENTADO_PARCIAL`   | NEXO-UX-037; implementación NEXO                      |
| inicio dedicado con casos correlacionados               | No existe una superficie única que materialice territorio, colas, evidencia, autoridad atómica, conflicto, vencimiento y cierre conforme a esta tarea.                                                                                                                | `NO_IMPLEMENTADO`        | paquete de implementación NEXO                        |
| validación operativa, tablet, kiosco y red intermitente | No se ejecutó piloto con supervisores, operadores, diferencias, decisiones, revocación y resultados desconocidos.                                                                                                                                                     | `PENDIENTE_DE_EVIDENCIA` | NEXO-UX-023 a NEXO-UX-025                             |

El código actual demuestra consultas y mutaciones parciales, no el contrato del
home supervisor ni una autorización suficiente para cada decisión sensible.
Una pantalla alcanzable o una API autenticada no demuestran segregación,
idempotencia, alcance territorial ni aprobación canónica.

---

#### 13. Brechas y bloqueos preservados

| Brecha                                                 | Efecto en el inicio                                                                                                | Propietario documental                                    | Condición de salida                                                           |
| ------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------- | ----------------------------------------------------------------------------- |
| home supervisor inexistente                            | la autoridad local entra por un cockpit genérico y debe reconstruir prioridades manualmente                        | paquete de implementación NEXO                            | proyección por actor, territorio, caso y siguiente control materializada      |
| permisos amplios o legacy en superficies actuales      | lectura, investigación y mutación pueden aparecer bajo una misma capacidad técnica                                 | AUTH-CAT-022; AUTH-SRV-001 a AUTH-SRV-005                 | claves atómicas adoptadas por guards y comandos                               |
| ajuste actual sin caso y aprobación separada           | una mutación puede ejecutarse sin materializar investigación, segregación y versión del caso                       | `NEXO-UX-019`                                             | flujo de diferencia, decisión, efecto y auditoría implementado                |
| aprobación de conteo sin revalidación visible completa | un usuario autenticado puede alcanzar un comando sensible sin que la ruta demuestre autoridad atómica y territorio | `NEXO-UX-018`; `NEXO-UX-019`; AUTH-SRV-001 a AUTH-SRV-005 | guard, segregación, versión, idempotencia y pruebas implementados             |
| catálogo no concede aprobación general al supervisor   | algunos casos pueden verse, pero no resolverse por este rol base                                                   | AUTH-CAT-022; tareas funcionales propietarias             | capacidad atómica creada y evaluada, o escalamiento definitivo aprobado       |
| hechos y casos no están correlacionados uniformemente  | stock, movimiento, conteo, remisión y receipt deben investigarse en superficies separadas                          | `NEXO-UX-008`; `NEXO-UX-021`; `NEXO-UX-022`               | contrato de caso, relaciones y estados materializado                          |
| vencimientos y SLA sin fuente unificada                | la prioridad temporal podría ser subjetiva o visual                                                                | `NEXO-UX-021`; `NEXO-UX-025`                              | reglas, eventos, umbrales y evidencia operativa aprobados                     |
| validación multicanal pendiente                        | no existe evidencia de seguridad o usabilidad en operación real                                                    | `NEXO-UX-023` a `NEXO-UX-025`                             | piloto con actores, dispositivos, revocación, concurrencia y red intermitente |

Ningún bloqueo queda sin tarea responsable.

---

#### 14. Decisiones aprobadas

1. el inicio se resuelve por autoridad, territorio, recurso y permiso exactos,
   no por nombre del cargo ni sede seleccionada;
2. el rol base `supervisor` conserva alcance local limitado `AS`, `AA`,
   `ORG-LOCAL` o `AS-REL`, nunca global implícito;
3. existe una sola acción primaria: `CONTINUAR_SIGUIENTE_TAREA`;
4. las ocho colas representan bloqueo, vencimiento, excepción, diferencia,
   autorización, cumplimiento, cierre y continuidad;
5. la prioridad protege primero seguridad, custodia, condición y casos vencidos;
6. el hecho original y la decisión supervisora permanecen separados;
7. observar una diferencia no concede ajustar, aprobar, cancelar o disponer;
8. el supervisor base no recibe capacidades operativas ni
   `BASE_AND_OPERATIONAL` denegadas;
9. la falta de permiso atómico produce vista de solo lectura o escalamiento,
   no un botón ficticio;
10. la misma persona puede supervisar y operar solo mediante funciones,
    permisos y contextos separados;
11. no se permite autoaprobación cuando el actor participó en el hecho y la
    política exige independencia;
12. los casos conservan evidencia, responsable, vencimiento, versión y
    trazabilidad;
13. cerrar un control no borra ni reescribe el hecho operativo;
14. los filtros reducen territorio y nunca lo amplían;
15. las doce etapas conservan fronteras entre observación, investigación,
    decisión, efecto y cierre;
16. las dieciocho rutas existentes conservan identidad y disposición;
17. los catorce estados fallan cerrados y no inventan éxito;
18. ajustes y aprobación de conteos actuales se reconocen como bloqueos de
    autorización y segregación, no como diseño terminado;
19. las superficies actuales son evidencia parcial y no validación;
20. no se modifica código, Supabase, permisos, datos ni operación;
21. `NEXO-UX-008` permanece reservada.

---

#### 15. Requisitos de prueba derivados

Se crean exactamente siete requisitos:

| Requisito       | Cobertura                                                                                                         |
| --------------- | ----------------------------------------------------------------------------------------------------------------- |
| `TREQ-NEXO-076` | resolución autoritativa de actor, fuente de autoridad, territorio, recurso, permisos, autores del hecho y versión |
| `TREQ-NEXO-077` | ocho secciones, acción primaria única, ocho colas y prioridad de control resuelta en servidor                     |
| `TREQ-NEXO-078` | decisión de doce etapas y separación entre hecho, investigación, decisión, efecto y cierre                        |
| `TREQ-NEXO-079` | composición de siete casos, segregación y prohibición de autoaprobación                                           |
| `TREQ-NEXO-080` | disposición de dieciocho rutas con revalidación territorial y de permisos atómicos                                |
| `TREQ-NEXO-081` | integridad de casos, evidencia, responsable, vencimiento, versión, idempotencia, decisión y cierre                |
| `TREQ-NEXO-082` | catorce estados y representación honesta de parcialidad, conflicto y resultado desconocido                        |

No se modifica, difiere, descarta ni vuelve obsoleto ningún requisito histórico.

---

#### 16. Criterios de aceptación

- [ ] El archivo contiene exclusivamente `NEXO-UX-007`.
- [ ] La audiencia primaria es el rol base `supervisor` con alcance territorial
      limitado, no una autoridad global.
- [ ] Se distinguen permisos de lectura, decisión y operación.
- [ ] Se enumeran capacidades relevantes concedidas y denegadas por defecto.
- [ ] El contexto contiene actor, carril, fuente, territorio, recurso,
      permisos, hecho, evidencia, responsable, vencimiento y versión.
- [ ] Existen exactamente ocho secciones y una acción primaria.
- [ ] Existen exactamente ocho colas únicas `SUPQ-*`.
- [ ] Existen exactamente siete casos únicos `SUP-COMP-*`.
- [ ] La misma persona puede supervisar y operar solo mediante capacidades
      separadas.
- [ ] Se detecta y bloquea conflicto de interés cuando la política exige
      independencia.
- [ ] Las doce etapas aparecen una sola vez.
- [ ] Diferencia, decisión, efecto y cierre permanecen separados.
- [ ] Las dieciocho rutas aparecen una sola vez y no se inventan URLs.
- [ ] Ajustes y aprobación de conteos no se presentan como autoridad ya
      resuelta.
- [ ] Los filtros nunca amplían sedes, áreas o extremos relacionales.
- [ ] Se materializan exactamente catorce estados únicos.
- [ ] Datos parciales, conflicto de versión, revocación y resultado desconocido
      no se muestran como éxito.
- [ ] El diagnóstico distingue código, diseño, implementación y evidencia
      operativa.
- [ ] Cada brecha conserva propietario y condición de salida.
- [ ] Se crean exactamente `TREQ-NEXO-076` a `TREQ-NEXO-082`.
- [ ] No se modifica ningún requisito histórico.
- [ ] No se modifica código, Supabase, permisos, datos ni despliegues.
- [ ] `NEXO-UX-008` permanece reservada y no iniciada.

---

#### 17. `NEXO-SUPERVISOR-HOME-HANDOFF-001`

| Resultado o brecha                                    | Estado actual            | Tarea responsable                         | Condición de salida                                                                    |
| ----------------------------------------------------- | ------------------------ | ----------------------------------------- | -------------------------------------------------------------------------------------- |
| navegación por tarea y carril supervisor              | `ESPECIFICADO`           | `NEXO-UX-008`                             | inicio y navegación consumen función, caso, territorio y siguiente tarea autoritativos |
| flujo completo de conteos                             | `ESPECIFICADO`           | `NEXO-UX-018`                             | apertura, línea base, captura, diferencia y cierre materializados                      |
| investigación y ajustes                               | `BLOQUEADO`              | `NEXO-UX-019`                             | diferencia, autorización, efecto, idempotencia y auditoría separados                   |
| escaneo contextual                                    | `ESPECIFICADO`           | `NEXO-UX-020`                             | código identifica recurso y caso sin ejecutar decisión                                 |
| estados, cantidades, responsable y vencimiento        | `ESPECIFICADO`           | `NEXO-UX-021`                             | representación uniforme y fuente temporal aprobadas                                    |
| excepciones, condición, cuarentena, daño y devolución | `BLOQUEADO`              | `NEXO-UX-022`                             | captura, contención, decisión, efecto y cierre separados                               |
| tablet, kiosco, periféricos y red intermitente        | `PENDIENTE_DE_EVIDENCIA` | `NEXO-UX-023`                             | perfil de estación y contingencia certificados                                         |
| prototipo con supervisores y operadores               | `PENDIENTE_DE_EVIDENCIA` | `NEXO-UX-024`                             | recorridos, conflictos y escalamiento probados con actores reales                      |
| métricas y piloto                                     | `PENDIENTE_DE_EVIDENCIA` | `NEXO-UX-025`                             | umbrales, SLA y evidencia operativa aprobados                                          |
| permisos atómicos y guards de servidor                | `BLOQUEADO`              | AUTH-CAT-022; AUTH-SRV-001 a AUTH-SRV-005 | claves, alcance, segregación y contratos ejecutables adoptados                         |
| implementación del home                               | `NO_IMPLEMENTADO`        | paquete de implementación NEXO            | componentes, consultas, casos, guards, comandos y pruebas materializados               |

Esta tarea no inicia ninguno de esos trabajos.

---

#### 18. Continuidad canónica

**ÚLTIMA TAREA APROBADA**

`NEXO-UX-006 — Diseñar inicio para receptor`

**TAREA ACTUAL APROBADA**

`NEXO-UX-007 — Diseñar inicio para supervisor`

**SIGUIENTE TAREA RESERVADA**

`NEXO-UX-008 — Organizar navegación por tareas y no por rutas técnicas`


### ✅ NEXO-UX-008 — Organizar navegación por tareas y no por rutas técnicas

**Estado:** APROBADA
**Tarea anterior:** `NEXO-UX-007 — Diseñar inicio para supervisor` — APROBADA
**Tarea siguiente:** `NEXO-UX-009 — Diseñar flujo completo de solicitud de remisión` — RESERVADA
**Tipo de tarea:** documental; arquitectura funcional completa de navegación de NEXO por tareas humanas, familias de trabajo, composición por actor y contexto, binding de rutas existentes, deep links, retorno, utilidades contextuales, estados y handoff de implementación
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/K_NEXO/04_EXPERIENCIA_DE_INVENTARIO_LOGISTICA_Y_ACTIVOS.md`
**Repositorio de aplicación inspeccionado:** `vento-nexo`
**Artefactos producidos:** `NEXO-TASK-NAVIGATION-CONTRACT-001`, `NEXO-NAVIGATION-TASK-CATALOG-001`, `NEXO-ACTOR-TASK-COMPOSITION-MATRIX-001`, `NEXO-ROUTE-TO-TASK-REGISTRY-001`, `NEXO-NAVIGATION-ENTRY-RETURN-CONTRACT-001`, `NEXO-CONTEXTUAL-UTILITY-CONTRACT-001`, `NEXO-NAVIGATION-STATE-CONTRACT-001` y `NEXO-TASK-NAVIGATION-HANDOFF-001`
**Decisiones consumidas:** `UX-BASE-001` a `UX-BASE-005`; `UX-STATION-010` a `UX-STATION-012`; `PROC-SCREEN-001` a `PROC-SCREEN-004`; `NEXO-REAL-PROCESS-INVENTORY-001`; `NEXO-UX-LANE-CONTRACT-001`; `NEXO-ROUTE-LANE-DISPOSITION-001`; `NEXO-REQUESTER-HOME-CONTRACT-001`; `NEXO-WAREHOUSE-HOME-CONTRACT-001`; `NEXO-DRIVER-HOME-CONTRACT-001`; `NEXO-RECEIVER-HOME-CONTRACT-001`; `NEXO-SUPERVISOR-HOME-CONTRACT-001`; inventario `NEXO-ROUTE-001` a `NEXO-ROUTE-064`; requisitos `TREQ-*` vigentes; código, contratos de navegación y migraciones actuales de `vento-nexo` y `vento-shell`
**Cambios físicos autorizados:** ninguno; no modifica rutas, componentes, permisos, datos, navegación desplegada, Supabase, migraciones, RLS, RPC, configuración ni despliegues

---

#### 1. Propósito

Organizar la navegación de NEXO alrededor de lo que una persona necesita hacer, continuar, consultar o administrar, y no alrededor de la estructura de carpetas, segmentos de URL, nombres de tablas, componentes o rutas técnicas existentes.

La regla canónica es:

```text
ACTOR EFECTIVO Y FUNCION VIGENTES
+ CONTEXTO, TERRITORIO Y DISPOSITIVO COMPATIBLES
+ TAREA HUMANA O INSTANCIA DE TRABAJO
+ ETAPA, RECURSO Y PERMISO EXACTOS
+ BINDING VERSIONADO HACIA UNA SUPERFICIE FISICA
→ NAVEGACION POR TAREA
```

La URL continúa siendo un mecanismo de implementación. No es identidad de tarea, no es nombre de pantalla, no es permiso, no concede autoridad y no determina por sí sola qué debe ver una persona.

---

#### 2. Resultado material

Se aprueban ocho artefactos documentales consumibles:

1. `NEXO-TASK-NAVIGATION-CONTRACT-001`, que define identidad de tarea, jerarquía, lenguaje, autoridad y composición;
2. `NEXO-NAVIGATION-TASK-CATALOG-001`, que materializa ocho familias y veintinueve tareas humanas o resolutores;
3. `NEXO-ACTOR-TASK-COMPOSITION-MATRIX-001`, que decide ocho contextos de actor, función y dispositivo;
4. `NEXO-ROUTE-TO-TASK-REGISTRY-001`, que vincula las sesenta y cuatro rutas existentes con una tarea y una disposición explícitas;
5. `NEXO-NAVIGATION-ENTRY-RETURN-CONTRACT-001`, que define entrada, continuación, deep link, breadcrumb, retorno y reanudación;
6. `NEXO-CONTEXTUAL-UTILITY-CONTRACT-001`, que mantiene escaneo, alias, kioscos y resolutores fuera del menú global;
7. `NEXO-NAVIGATION-STATE-CONTRACT-001`, que materializa catorce estados verificables;
8. `NEXO-TASK-NAVIGATION-HANDOFF-001`, que asigna los flujos detallados, la implementación y la certificación a sus responsables canónicos.

| Elemento                                  | Total esperado | Total materializado | Faltantes | Duplicados |
| ----------------------------------------- | -------------: | ------------------: | --------: | ---------: |
| Familias de tareas                        |              8 |                   8 |         0 |          0 |
| Tareas o resolutores de navegación        |             29 |                  29 |         0 |          0 |
| Contextos de composición                  |              8 |                   8 |         0 |          0 |
| Rutas existentes vinculadas               |             64 |                  64 |         0 |          0 |
| Grupos humanos de navegación global       |              4 |                   4 |         0 |          0 |
| Estados de navegación                     |             14 |                  14 |         0 |          0 |
| Requisitos de prueba nuevos o modificados |              8 |                   8 |         0 |          0 |

El resultado queda `ESPECIFICADO`. No declara la navegación objetivo `IMPLEMENTADA`, `VALIDADA` ni desplegada.

---

#### 3. Alcance funcional

##### 3.1. Incluido

- identidad estable de tarea humana separada de URL y pantalla;
- grupos de navegación en lenguaje de trabajo;
- composición dinámica por actor, función, permiso, territorio, dispositivo y trabajo vigente;
- una entrada primaria hacia la tarea actual y accesos secundarios mínimos;
- binding completo de las sesenta y cuatro rutas inventariadas;
- tratamiento de rutas de detalle, configuración, referencia, acceso, alias y utilidad;
- deep links, retorno, reanudación, breadcrumbs y cambio de contexto;
- estados de carga, vacío, denegación, revocación, datos parciales, offline y resultado desconocido;
- diagnóstico verificable del soporte físico actual;
- handoff a los flujos `NEXO-UX-009` a `NEXO-UX-039` y al paquete de implementación NEXO.

##### 3.2. Excluido

- diseñar el contenido detallado de los flujos reservados desde `NEXO-UX-009`;
- crear nuevas URLs, pantallas, permisos o roles;
- renombrar físicamente rutas actuales;
- ejecutar migraciones o modificar `app_navigation_items`;
- implementar el resolutor de tareas, componentes de navegación o eventos;
- certificar navegación en producción, tablet, kiosco, escáner o impresora;
- redefinir las matrices de autorización aprobadas;
- convertir la navegación en fuente de autorización.

---

#### 4. `NEXO-TASK-NAVIGATION-CONTRACT-001`

##### 4.1. Identidades distintas

| Identidad            | Qué representa                                  | Regla                                                |
| -------------------- | ----------------------------------------------- | ---------------------------------------------------- |
| `task_key`           | intención humana estable                        | no contiene URL, rol, sede, componente ni versión    |
| `task_instance_id`   | trabajo concreto que puede continuarse          | existe solo cuando hay una instancia autoritativa    |
| `task_family_key`    | agrupación de intenciones relacionadas          | no concede acceso a todas las tareas de la familia   |
| `screen_id`          | superficie lógica estable                       | puede servir a una o varias tareas y cambiar de ruta |
| `route_binding`      | asociación versionada entre tarea y ruta física | es reemplazable y nunca constituye permiso           |
| `process_id` y etapa | posición empresarial del trabajo                | determina elegibilidad junto con estado y actor      |
| permiso              | capacidad atómica evaluada por servidor         | no se deriva de que una opción sea visible           |

##### 4.2. Resolución autoritativa

El servidor resolverá como mínimo:

```text
principal tecnico
+ actor efectivo
+ fuente de autoridad
+ funcion o carril
+ sede, area y territorio
+ turno, check-in y dispositivo cuando apliquen
+ proceso, etapa, recurso y version
+ permisos de lectura y accion
+ tarea vigente y prioridad
+ binding de superficie vigente
```

El cliente puede solicitar una `task_key`, pero no puede declarar como autoridad el rol, la función, la sede, el territorio, la prioridad, la etapa, el estado, el recurso, el permiso ni la ruta final.

##### 4.3. Lenguaje de navegación

Toda etiqueta visible deberá:

1. comenzar con un verbo o expresar una intención reconocible;
2. nombrar el objeto empresarial necesario;
3. evitar nombres de carpetas, tablas, componentes y tecnologías;
4. evitar como etiqueta primaria `settings`, `fulfillment`, `transit`, `scanner`, `LOC`, `LPN`, `API`, `RPC`, `stock` o slugs sin explicación humana;
5. conservar el mismo significado aunque cambie la URL;
6. distinguir ejecutar, consultar, controlar y administrar;
7. no prometer autoridad que el actor no posee.

Ejemplos:

| No usar como entrada primaria    | Usar                                 |
| -------------------------------- | ------------------------------------ |
| `remissions/receive`             | Recibir abastecimiento               |
| `inventory/adjust`               | Controlar la operación               |
| `settings/request-policies`      | Configurar abastecimiento            |
| `inventory/locations/[id]/board` | Ubicar existencias                   |
| `printing/jobs`                  | Controlar impresión                  |
| `scanner`                        | no aparece; se invoca desde la tarea |

##### 4.4. Grupos globales

| Orden | Grupo visible         | Contenido permitido                                      | Regla                                          |
| ----: | --------------------- | -------------------------------------------------------- | ---------------------------------------------- |
|     1 | Inicio                | proyección vigente, siguiente tarea y cambios relevantes | siempre primero                                |
|     2 | Mi trabajo            | tareas ejecutables propias o asignadas                   | solo acciones compatibles con actor y contexto |
|     3 | Consultar y controlar | lecturas, investigación y casos de supervisión           | separado de ejecución y configuración          |
|     4 | Administrar           | maestros, políticas, referencias y dispositivos          | solo capacidades exactas de configuración      |

No existe un grupo global `Utilidades`. Una utilidad aparece dentro de la tarea que la requiere.

##### 4.5. Acción principal

La navegación conserva una sola acción primaria por proyección:

```text
CONTINUAR_SIGUIENTE_TAREA
```

Para el solicitante, cuando no exista trabajo propio que continuar y sí exista capacidad de iniciación, la acción especializada aprobada `NUEVA_SOLICITUD` permanece disponible. Esa excepción no convierte el menú en un catálogo de rutas.

---

#### 5. `NEXO-NAVIGATION-TASK-CATALOG-001`

##### 5.1. Familias

| Familia                | Nombre humano                    | Frontera                                                                                                           |
| ---------------------- | -------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| `NEXO-TASK-FAMILY-001` | Inicio y continuidad             | Resolver la proyección vigente y la siguiente tarea sin convertir el inicio en un catálogo de módulos.             |
| `NEXO-TASK-FAMILY-002` | Abastecimiento interno           | Solicitar, preparar, transportar y recibir abastecimiento mediante funciones separadas.                            |
| `NEXO-TASK-FAMILY-003` | Ejecución física de inventario   | Registrar entradas, ubicar, mover, retirar y contar existencias.                                                   |
| `NEXO-TASK-FAMILY-004` | Consulta, control y trazabilidad | Consultar saldos, ubicaciones, contenedores, movimientos y casos de supervisión.                                   |
| `NEXO-TASK-FAMILY-005` | Ciclo de activos                 | Consultar, capturar, contar y configurar activos sin anticipar los flujos reservados del subdominio.               |
| `NEXO-TASK-FAMILY-006` | Maestros y configuración         | Administrar productos, ubicaciones, reglas de abastecimiento y referencias internas.                               |
| `NEXO-TASK-FAMILY-007` | Impresión                        | Controlar trabajos y mantener configuración de impresión en carriles separados.                                    |
| `NEXO-TASK-FAMILY-008` | Acceso y utilidades contextuales | Resolver autenticación, denegación, deep links, alias, kioscos y escaneo sin exponerlos como tareas empresariales. |

##### 5.2. Tareas materializadas

| Tarea           | Etiqueta humana                   | Familia                | Carril                 | Grupo                 | Audiencia funcional                                 | Regla de exposición          | Responsable del detalle                                  |
| --------------- | --------------------------------- | ---------------------- | ---------------------- | --------------------- | --------------------------------------------------- | ---------------------------- | -------------------------------------------------------- |
| `NEXO-TASK-001` | Ir al inicio                      | `NEXO-TASK-FAMILY-001` | `SUPERVISION`          | Inicio                | todos los actores con acceso a NEXO                 | `RESOLVER_PROYECCION`        | NEXO-UX-003 a NEXO-UX-007                                |
| `NEXO-TASK-002` | Gestionar abastecimiento interno  | `NEXO-TASK-FAMILY-002` | `SEPARACION_EXPLICITA` | Mi trabajo            | actor participante en VPROC-0028                    | `RESOLVER_FUNCION_Y_ETAPA`   | NEXO-UX-009 a NEXO-UX-013; NEXO-UX-022                   |
| `NEXO-TASK-003` | Solicitar abastecimiento          | `NEXO-TASK-FAMILY-002` | `OPERACION`            | Mi trabajo            | solicitante autorizado                              | `MOSTRAR_SI_AUTORIZADA`      | NEXO-UX-009                                              |
| `NEXO-TASK-004` | Preparar abastecimiento           | `NEXO-TASK-FAMILY-002` | `OPERACION`            | Mi trabajo            | bodeguero o preparador autorizado                   | `MOSTRAR_SI_HAY_TRABAJO`     | NEXO-UX-010; NEXO-UX-011                                 |
| `NEXO-TASK-005` | Transportar abastecimiento        | `NEXO-TASK-FAMILY-002` | `OPERACION`            | Mi trabajo            | conductor o custodio autorizado                     | `MOSTRAR_SI_HAY_CUSTODIA`    | NEXO-UX-012                                              |
| `NEXO-TASK-006` | Recibir abastecimiento            | `NEXO-TASK-FAMILY-002` | `OPERACION`            | Mi trabajo            | receptor autorizado                                 | `MOSTRAR_SI_HAY_ENTREGA`     | NEXO-UX-013                                              |
| `NEXO-TASK-007` | Registrar una entrada             | `NEXO-TASK-FAMILY-003` | `OPERACION`            | Mi trabajo            | receptor de inventario autorizado                   | `MOSTRAR_SI_AUTORIZADA`      | NEXO-UX-014                                              |
| `NEXO-TASK-008` | Ubicar existencias                | `NEXO-TASK-FAMILY-003` | `OPERACION`            | Mi trabajo            | bodeguero autorizado                                | `MOSTRAR_SI_HAY_EXISTENCIA`  | NEXO-UX-015                                              |
| `NEXO-TASK-009` | Mover existencias                 | `NEXO-TASK-FAMILY-003` | `OPERACION`            | Mi trabajo            | bodeguero autorizado                                | `MOSTRAR_SI_AUTORIZADA`      | NEXO-UX-016                                              |
| `NEXO-TASK-010` | Registrar un retiro               | `NEXO-TASK-FAMILY-003` | `OPERACION`            | Mi trabajo            | actor de retiro autorizado                          | `MOSTRAR_SI_AUTORIZADA`      | NEXO-UX-017                                              |
| `NEXO-TASK-011` | Contar inventario                 | `NEXO-TASK-FAMILY-003` | `SEPARACION_EXPLICITA` | Mi trabajo            | contador operativo o supervisor según etapa         | `RESOLVER_CAPTURA_O_CONTROL` | NEXO-UX-018; NEXO-UX-019                                 |
| `NEXO-TASK-012` | Controlar la operación            | `NEXO-TASK-FAMILY-004` | `SUPERVISION`          | Consultar y controlar | supervisor con cobertura territorial                | `MOSTRAR_SI_HAY_CASOS`       | NEXO-UX-007; NEXO-UX-019; NEXO-UX-021 a NEXO-UX-025      |
| `NEXO-TASK-013` | Consultar existencias             | `NEXO-TASK-FAMILY-004` | `SUPERVISION`          | Consultar y controlar | actor con permiso de lectura                        | `MOSTRAR_SI_AUTORIZADA`      | NEXO-UX-007; NEXO-UX-021                                 |
| `NEXO-TASK-014` | Investigar movimientos            | `NEXO-TASK-FAMILY-004` | `SUPERVISION`          | Consultar y controlar | supervisor o auditor autorizado                     | `MOSTRAR_SI_AUTORIZADA`      | NEXO-UX-016; NEXO-UX-021                                 |
| `NEXO-TASK-015` | Consultar ubicaciones             | `NEXO-TASK-FAMILY-004` | `SUPERVISION`          | Consultar y controlar | actor con permiso territorial de lectura            | `MOSTRAR_SI_AUTORIZADA`      | NEXO-UX-015                                              |
| `NEXO-TASK-016` | Consultar contenedores logísticos | `NEXO-TASK-FAMILY-004` | `SUPERVISION`          | Consultar y controlar | actor con permiso de lectura de LPN                 | `MOSTRAR_SI_AUTORIZADA`      | NEXO-UX-026 a NEXO-UX-029                                |
| `NEXO-TASK-017` | Gestionar activos                 | `NEXO-TASK-FAMILY-005` | `SUPERVISION`          | Consultar y controlar | actor con permiso de lectura de activos             | `MOSTRAR_SI_AUTORIZADA`      | NEXO-UX-030 a NEXO-UX-036                                |
| `NEXO-TASK-018` | Capturar activos                  | `NEXO-TASK-FAMILY-005` | `OPERACION`            | Mi trabajo            | actor de campo autorizado                           | `MOSTRAR_SI_AUTORIZADA`      | NEXO-UX-039                                              |
| `NEXO-TASK-019` | Contar activos                    | `NEXO-TASK-FAMILY-005` | `SEPARACION_EXPLICITA` | Mi trabajo            | contador de activos o supervisor según etapa        | `RESOLVER_CAPTURA_O_CIERRE`  | NEXO-UX-034                                              |
| `NEXO-TASK-020` | Configurar activos                | `NEXO-TASK-FAMILY-005` | `CONFIGURACION`        | Administrar           | configurador de activos autorizado                  | `MOSTRAR_SI_AUTORIZADA`      | NEXO-UX-030 a NEXO-UX-036                                |
| `NEXO-TASK-021` | Administrar NEXO                  | `NEXO-TASK-FAMILY-006` | `CONFIGURACION`        | Administrar           | actor con al menos una capacidad de configuración   | `RESOLVER_CAPACIDADES`       | NEXO-UX-008; paquete de implementación NEXO              |
| `NEXO-TASK-022` | Administrar productos y unidades  | `NEXO-TASK-FAMILY-006` | `CONFIGURACION`        | Administrar           | configurador de catálogo autorizado                 | `MOSTRAR_SI_AUTORIZADA`      | NEXO-UX-008; NEXO-UX-009 a NEXO-UX-019 como consumidores |
| `NEXO-TASK-023` | Administrar ubicaciones           | `NEXO-TASK-FAMILY-006` | `CONFIGURACION`        | Administrar           | configurador de ubicaciones autorizado              | `MOSTRAR_SI_AUTORIZADA`      | NEXO-UX-015                                              |
| `NEXO-TASK-024` | Configurar abastecimiento         | `NEXO-TASK-FAMILY-006` | `CONFIGURACION`        | Administrar           | configurador logístico autorizado                   | `MOSTRAR_SI_AUTORIZADA`      | NEXO-UX-009 a NEXO-UX-013                                |
| `NEXO-TASK-025` | Configurar referencias internas   | `NEXO-TASK-FAMILY-006` | `CONFIGURACION`        | Administrar           | actor con permiso financiero o de referencia exacto | `MOSTRAR_SI_AUTORIZADA`      | NEXO-UX-008; tareas financieras propietarias             |
| `NEXO-TASK-026` | Controlar impresión               | `NEXO-TASK-FAMILY-007` | `SUPERVISION`          | Consultar y controlar | supervisor o soporte autorizado                     | `MOSTRAR_SI_HAY_TRABAJOS`    | NEXO-UX-037; NEXO-UX-038                                 |
| `NEXO-TASK-027` | Configurar impresión              | `NEXO-TASK-FAMILY-007` | `CONFIGURACION`        | Administrar           | configurador de impresión autorizado                | `MOSTRAR_SI_AUTORIZADA`      | NEXO-UX-037; NEXO-UX-038                                 |
| `NEXO-TASK-028` | Resolver un destino contextual    | `NEXO-TASK-FAMILY-008` | `TRANSVERSAL_TECNICA`  | Oculta                | actor, dispositivo y tarea invocante compatibles    | `NO_MOSTRAR_EN_MENU`         | NEXO-UX-015; NEXO-UX-020                                 |
| `NEXO-TASK-029` | Resolver acceso                   | `NEXO-TASK-FAMILY-008` | `TRANSVERSAL_TECNICA`  | Oculta                | sesión técnica o actor que entra a NEXO             | `NO_MOSTRAR_EN_MENU`         | AUTH-UI-045; paquete de implementación NEXO              |

Reconciliación:

```text
EXPECTED_TASK_FAMILIES = 8
MATERIALIZED_TASK_FAMILIES = 8
EXPECTED_TASK_KEYS = 29
MATERIALIZED_TASK_KEYS = 29
DUPLICATE_TASK_KEYS = 0
TASK_KEYS_WITHOUT_FAMILY = 0
```

---

#### 6. `NEXO-ACTOR-TASK-COMPOSITION-MATRIX-001`

| Caso           | Contexto resuelto                       | Entradas prioritarias                                                    | Entradas secundarias                                        | Ocultamiento obligatorio                                                      | Resultado                                  |
| -------------- | --------------------------------------- | ------------------------------------------------------------------------ | ----------------------------------------------------------- | ----------------------------------------------------------------------------- | ------------------------------------------ |
| `NAV-COMP-001` | solicitante autorizado                  | `NEXO-TASK-003`; solicitudes propias continuables                        | `NEXO-TASK-013` solo si existe permiso de lectura necesario | preparación, conducción, recepción, supervisión y configuración no concedidas | inicio y navegación de solicitante         |
| `NAV-COMP-002` | bodeguero o preparador autorizado       | `NEXO-TASK-004`; `007`; `008`; `009`; `010`; `011` según trabajo vigente | `NEXO-TASK-013`; `014`; `015` cuando sirven a la tarea      | funciones de conductor, receptor, supervisor y configuración no concedidas    | cola de bodega por prioridad               |
| `NAV-COMP-003` | conductor o custodio autorizado         | `NEXO-TASK-005`                                                          | detalle de carga y referencias necesarias                   | solicitud, picking, recepción, ajustes y configuración                        | cola de custodia y ruta                    |
| `NAV-COMP-004` | receptor autorizado                     | `NEXO-TASK-006`; `007` cuando el origen empresarial lo permita           | existencia, ubicación y evidencia necesarias                | conducción, preparación, decisiones supervisoras y configuración              | cola de entregas por recibir               |
| `NAV-COMP-005` | supervisor con cobertura territorial    | `NEXO-TASK-012`                                                          | `013` a `017` y `026` según permisos                        | mutaciones operativas o de configuración no concedidas                        | cola de control y referencias              |
| `NAV-COMP-006` | configurador autorizado                 | `NEXO-TASK-021`                                                          | `020`; `022` a `025`; `027` según capacidades exactas       | ejecución física y supervisión no concedidas                                  | administración por capacidad, no por cargo |
| `NAV-COMP-007` | persona con varias funciones            | la siguiente tarea autoritativa de la función activa                     | entradas de otras funciones en secciones separadas          | mezcla de acciones, autoridad heredada y autoaprobación                       | composición sin colapsar carriles          |
| `NAV-COMP-008` | dispositivo compartido con actor activo | únicamente tareas compatibles con dispositivo, actor, turno y contexto   | utilidades contextuales requeridas por la tarea             | administración, datos sensibles y acciones sin actor                          | sesión atribuida y navegación mínima       |

Reglas:

1. la composición no se basa en una lista fija de nombres de rol;
2. cada entrada se evalúa por tarea, acción, territorio, recurso y etapa;
3. una persona multifunción no obtiene una interfaz híbrida con todas las acciones simultáneas;
4. cambiar de función invalida tarea, filtros, borradores y bindings incompatibles;
5. una opción oculta sigue protegida en servidor frente a acceso directo;
6. supervisar una tarea propia no concede aprobación cuando se exige independencia.

---

#### 7. `NEXO-ROUTE-TO-TASK-REGISTRY-001`

##### 7.1. Clases de binding

| Clase                 | Uso                                                                                                                              | Visibilidad global |
| --------------------- | -------------------------------------------------------------------------------------------------------------------------------- | ------------------ |
| `TASK_RESOLVER`       | Puede aparecer como entrada humana, pero el servidor resuelve función, tarea, instancia y destino antes de abrir una superficie. | condicionada       |
| `TASK_ENTRY`          | Puede aparecer como tarea humana cuando existe permiso, contexto y trabajo compatibles; la etiqueta no deriva de la URL.         | condicionada       |
| `TASK_STEP`           | No aparece como entrada independiente; se abre desde la tarea vigente y conserva contexto, instancia y retorno.                  | oculta             |
| `REFERENCE_STEP`      | No aparece como módulo; se abre como referencia de solo lectura desde una tarea autorizada.                                      | oculta             |
| `CONFIGURATION_ENTRY` | Puede aparecer únicamente bajo Administrar y solo cuando existe una capacidad exacta de configuración.                           | condicionada       |
| `CONFIGURATION_STEP`  | No aparece como opción principal; se abre dentro de la tarea de administración correspondiente.                                  | oculta             |
| `CONTEXT_RESOLVER`    | Permanece oculto; resuelve código, ubicación, slug o dispositivo y redirige a una tarea autorizada.                              | oculta             |
| `LEGACY_ALIAS`        | Permanece oculto como alias compatible y no adquiere identidad ni etiqueta de navegación.                                        | oculta             |
| `ACCESS_SYSTEM`       | Permanece fuera de la navegación empresarial; resuelve autenticación o denegación segura.                                        | oculta             |
| `CONTEXT_UTILITY`     | Permanece oculto y solo se invoca desde una tarea que necesita la utilidad; al terminar retorna al mismo contexto.               | oculta             |

##### 7.2. Registro completo

| Ruta             | Patrón físico actual                         | Tarea           | Etiqueta humana                   | Carril heredado        | Clase de binding      | Decisión de navegación                                                                                                           | Responsable del flujo                 |
| ---------------- | -------------------------------------------- | --------------- | --------------------------------- | ---------------------- | --------------------- | -------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------- |
| `NEXO-ROUTE-001` | `/`                                          | `NEXO-TASK-001` | Ir al inicio                      | `SUPERVISION`          | `TASK_RESOLVER`       | Puede aparecer como entrada humana, pero el servidor resuelve función, tarea, instancia y destino antes de abrir una superficie. | NEXO-UX-003; NEXO-UX-007; NEXO-UX-008 |
| `NEXO-ROUTE-002` | `/inventory/adjust`                          | `NEXO-TASK-012` | Controlar la operación            | `SUPERVISION`          | `TASK_STEP`           | No aparece como entrada independiente; se abre desde la tarea vigente y conserva contexto, instancia y retorno.                  | NEXO-UX-019                           |
| `NEXO-ROUTE-003` | `/inventory/assets`                          | `NEXO-TASK-017` | Gestionar activos                 | `SUPERVISION`          | `TASK_ENTRY`          | Puede aparecer como tarea humana cuando existe permiso, contexto y trabajo compatibles; la etiqueta no deriva de la URL.         | NEXO-UX-030                           |
| `NEXO-ROUTE-004` | `/inventory/assets/counts`                   | `NEXO-TASK-019` | Contar activos                    | `SUPERVISION`          | `TASK_ENTRY`          | Puede aparecer como tarea humana cuando existe permiso, contexto y trabajo compatibles; la etiqueta no deriva de la URL.         | NEXO-UX-034                           |
| `NEXO-ROUTE-005` | `/inventory/assets/counts/[id]`              | `NEXO-TASK-019` | Contar activos                    | `SEPARACION_EXPLICITA` | `TASK_STEP`           | No aparece como entrada independiente; se abre desde la tarea vigente y conserva contexto, instancia y retorno.                  | NEXO-UX-034                           |
| `NEXO-ROUTE-006` | `/inventory/assets/groups/[id]`              | `NEXO-TASK-017` | Gestionar activos                 | `SUPERVISION`          | `REFERENCE_STEP`      | No aparece como módulo; se abre como referencia de solo lectura desde una tarea autorizada.                                      | NEXO-UX-033                           |
| `NEXO-ROUTE-007` | `/inventory/assets/items/[id]`               | `NEXO-TASK-017` | Gestionar activos                 | `SUPERVISION`          | `REFERENCE_STEP`      | No aparece como módulo; se abre como referencia de solo lectura desde una tarea autorizada.                                      | NEXO-UX-031; NEXO-UX-032              |
| `NEXO-ROUTE-008` | `/inventory/assets/new`                      | `NEXO-TASK-020` | Configurar activos                | `CONFIGURACION`        | `CONFIGURATION_STEP`  | No aparece como opción principal; se abre dentro de la tarea de administración correspondiente.                                  | NEXO-UX-030                           |
| `NEXO-ROUTE-009` | `/inventory/assets/quick`                    | `NEXO-TASK-018` | Capturar activos                  | `OPERACION`            | `TASK_ENTRY`          | Puede aparecer como tarea humana cuando existe permiso, contexto y trabajo compatibles; la etiqueta no deriva de la URL.         | NEXO-UX-039                           |
| `NEXO-ROUTE-010` | `/inventory/catalog`                         | `NEXO-TASK-022` | Administrar productos y unidades  | `CONFIGURACION`        | `CONFIGURATION_ENTRY` | Puede aparecer únicamente bajo Administrar y solo cuando existe una capacidad exacta de configuración.                           | NEXO-UX-008                           |
| `NEXO-ROUTE-011` | `/inventory/catalog/[id]`                    | `NEXO-TASK-022` | Administrar productos y unidades  | `CONFIGURACION`        | `CONFIGURATION_STEP`  | No aparece como opción principal; se abre dentro de la tarea de administración correspondiente.                                  | NEXO-UX-008                           |
| `NEXO-ROUTE-012` | `/inventory/catalog/[id]/ficha`              | `NEXO-TASK-022` | Administrar productos y unidades  | `CONFIGURACION`        | `CONFIGURATION_STEP`  | No aparece como opción principal; se abre dentro de la tarea de administración correspondiente.                                  | NEXO-UX-008                           |
| `NEXO-ROUTE-013` | `/inventory/catalog/[id]/presentations`      | `NEXO-TASK-022` | Administrar productos y unidades  | `CONFIGURACION`        | `CONFIGURATION_STEP`  | No aparece como opción principal; se abre dentro de la tarea de administración correspondiente.                                  | NEXO-UX-008                           |
| `NEXO-ROUTE-014` | `/inventory/catalog/new`                     | `NEXO-TASK-022` | Administrar productos y unidades  | `CONFIGURACION`        | `CONFIGURATION_STEP`  | No aparece como opción principal; se abre dentro de la tarea de administración correspondiente.                                  | NEXO-UX-008                           |
| `NEXO-ROUTE-015` | `/inventory/catalog/presentations`           | `NEXO-TASK-022` | Administrar productos y unidades  | `CONFIGURACION`        | `CONFIGURATION_STEP`  | No aparece como opción principal; se abre dentro de la tarea de administración correspondiente.                                  | NEXO-UX-008                           |
| `NEXO-ROUTE-016` | `/inventory/cost-center`                     | `NEXO-TASK-025` | Configurar referencias internas   | `CONFIGURACION`        | `CONFIGURATION_ENTRY` | Puede aparecer únicamente bajo Administrar y solo cuando existe una capacidad exacta de configuración.                           | NEXO-UX-008                           |
| `NEXO-ROUTE-017` | `/inventory/count-initial`                   | `NEXO-TASK-011` | Contar inventario                 | `SUPERVISION`          | `TASK_ENTRY`          | Puede aparecer como tarea humana cuando existe permiso, contexto y trabajo compatibles; la etiqueta no deriva de la URL.         | NEXO-UX-018                           |
| `NEXO-ROUTE-018` | `/inventory/count-initial/session/[id]`      | `NEXO-TASK-011` | Contar inventario                 | `SEPARACION_EXPLICITA` | `TASK_STEP`           | No aparece como entrada independiente; se abre desde la tarea vigente y conserva contexto, instancia y retorno.                  | NEXO-UX-018; NEXO-UX-019              |
| `NEXO-ROUTE-019` | `/inventory/entries`                         | `NEXO-TASK-007` | Registrar una entrada             | `OPERACION`            | `TASK_ENTRY`          | Puede aparecer como tarea humana cuando existe permiso, contexto y trabajo compatibles; la etiqueta no deriva de la URL.         | NEXO-UX-014                           |
| `NEXO-ROUTE-020` | `/inventory/locations`                       | `NEXO-TASK-015` | Consultar ubicaciones             | `SUPERVISION`          | `TASK_ENTRY`          | Puede aparecer como tarea humana cuando existe permiso, contexto y trabajo compatibles; la etiqueta no deriva de la URL.         | NEXO-UX-015                           |
| `NEXO-ROUTE-021` | `/inventory/locations/[id]`                  | `NEXO-TASK-015` | Consultar ubicaciones             | `SUPERVISION`          | `REFERENCE_STEP`      | No aparece como módulo; se abre como referencia de solo lectura desde una tarea autorizada.                                      | NEXO-UX-015                           |
| `NEXO-ROUTE-022` | `/inventory/locations/[id]/board`            | `NEXO-TASK-008` | Ubicar existencias                | `OPERACION`            | `TASK_STEP`           | No aparece como entrada independiente; se abre desde la tarea vigente y conserva contexto, instancia y retorno.                  | NEXO-UX-015; NEXO-UX-017              |
| `NEXO-ROUTE-023` | `/inventory/locations/[id]/kiosk-withdraw`   | `NEXO-TASK-010` | Registrar un retiro               | `OPERACION`            | `TASK_STEP`           | No aparece como entrada independiente; se abre desde la tarea vigente y conserva contexto, instancia y retorno.                  | NEXO-UX-017                           |
| `NEXO-ROUTE-024` | `/inventory/locations/[id]/positions`        | `NEXO-TASK-023` | Administrar ubicaciones           | `CONFIGURACION`        | `CONFIGURATION_STEP`  | No aparece como opción principal; se abre dentro de la tarea de administración correspondiente.                                  | NEXO-UX-015                           |
| `NEXO-ROUTE-025` | `/inventory/locations/open`                  | `NEXO-TASK-028` | Resolver un destino contextual    | `OPERACION`            | `CONTEXT_RESOLVER`    | Permanece oculto; resuelve código, ubicación, slug o dispositivo y redirige a una tarea autorizada.                              | NEXO-UX-015                           |
| `NEXO-ROUTE-026` | `/inventory/locations/zone`                  | `NEXO-TASK-008` | Ubicar existencias                | `OPERACION`            | `TASK_STEP`           | No aparece como entrada independiente; se abre desde la tarea vigente y conserva contexto, instancia y retorno.                  | NEXO-UX-015                           |
| `NEXO-ROUTE-027` | `/inventory/locations/zones`                 | `NEXO-TASK-023` | Administrar ubicaciones           | `CONFIGURACION`        | `CONFIGURATION_STEP`  | No aparece como opción principal; se abre dentro de la tarea de administración correspondiente.                                  | NEXO-UX-015                           |
| `NEXO-ROUTE-028` | `/inventory/lpns`                            | `NEXO-TASK-016` | Consultar contenedores logísticos | `SUPERVISION`          | `TASK_ENTRY`          | Puede aparecer como tarea humana cuando existe permiso, contexto y trabajo compatibles; la etiqueta no deriva de la URL.         | NEXO-UX-026; NEXO-UX-029              |
| `NEXO-ROUTE-029` | `/inventory/movements`                       | `NEXO-TASK-014` | Investigar movimientos            | `SUPERVISION`          | `TASK_ENTRY`          | Puede aparecer como tarea humana cuando existe permiso, contexto y trabajo compatibles; la etiqueta no deriva de la URL.         | NEXO-UX-016                           |
| `NEXO-ROUTE-030` | `/inventory/production-batches`              | `NEXO-TASK-012` | Controlar la operación            | `SUPERVISION`          | `REFERENCE_STEP`      | No aparece como módulo; se abre como referencia de solo lectura desde una tarea autorizada.                                      | NEXO-UX-007                           |
| `NEXO-ROUTE-031` | `/inventory/remissions`                      | `NEXO-TASK-002` | Gestionar abastecimiento interno  | `SEPARACION_EXPLICITA` | `TASK_RESOLVER`       | Puede aparecer como entrada humana, pero el servidor resuelve función, tarea, instancia y destino antes de abrir una superficie. | NEXO-UX-003; NEXO-UX-004; NEXO-UX-007 |
| `NEXO-ROUTE-032` | `/inventory/remissions/[id]`                 | `NEXO-TASK-002` | Gestionar abastecimiento interno  | `SEPARACION_EXPLICITA` | `TASK_STEP`           | No aparece como entrada independiente; se abre desde la tarea vigente y conserva contexto, instancia y retorno.                  | NEXO-UX-009; NEXO-UX-013; NEXO-UX-022 |
| `NEXO-ROUTE-033` | `/inventory/remissions/[id]/edit`            | `NEXO-TASK-003` | Solicitar abastecimiento          | `OPERACION`            | `TASK_STEP`           | No aparece como entrada independiente; se abre desde la tarea vigente y conserva contexto, instancia y retorno.                  | NEXO-UX-009                           |
| `NEXO-ROUTE-034` | `/inventory/remissions/conductor`            | `NEXO-TASK-005` | Transportar abastecimiento        | `OPERACION`            | `TASK_ENTRY`          | Puede aparecer como tarea humana cuando existe permiso, contexto y trabajo compatibles; la etiqueta no deriva de la URL.         | NEXO-UX-005; NEXO-UX-012              |
| `NEXO-ROUTE-035` | `/inventory/remissions/fulfillment`          | `NEXO-TASK-004` | Preparar abastecimiento           | `OPERACION`            | `TASK_STEP`           | No aparece como entrada independiente; se abre desde la tarea vigente y conserva contexto, instancia y retorno.                  | NEXO-UX-010                           |
| `NEXO-ROUTE-036` | `/inventory/remissions/prepare`              | `NEXO-TASK-004` | Preparar abastecimiento           | `OPERACION`            | `TASK_ENTRY`          | Puede aparecer como tarea humana cuando existe permiso, contexto y trabajo compatibles; la etiqueta no deriva de la URL.         | NEXO-UX-010                           |
| `NEXO-ROUTE-037` | `/inventory/remissions/receive`              | `NEXO-TASK-006` | Recibir abastecimiento            | `OPERACION`            | `TASK_ENTRY`          | Puede aparecer como tarea humana cuando existe permiso, contexto y trabajo compatibles; la etiqueta no deriva de la URL.         | NEXO-UX-006; NEXO-UX-013              |
| `NEXO-ROUTE-038` | `/inventory/remissions/transit`              | `NEXO-TASK-005` | Transportar abastecimiento        | `SEPARACION_EXPLICITA` | `TASK_STEP`           | No aparece como entrada independiente; se abre desde la tarea vigente y conserva contexto, instancia y retorno.                  | NEXO-UX-005; NEXO-UX-007; NEXO-UX-012 |
| `NEXO-ROUTE-039` | `/inventory/settings`                        | `NEXO-TASK-021` | Administrar NEXO                  | `CONFIGURACION`        | `CONFIGURATION_ENTRY` | Puede aparecer únicamente bajo Administrar y solo cuando existe una capacidad exacta de configuración.                           | NEXO-UX-008                           |
| `NEXO-ROUTE-040` | `/inventory/settings/categories`             | `NEXO-TASK-022` | Administrar productos y unidades  | `CONFIGURACION`        | `CONFIGURATION_STEP`  | No aparece como opción principal; se abre dentro de la tarea de administración correspondiente.                                  | NEXO-UX-008                           |
| `NEXO-ROUTE-041` | `/inventory/settings/fulfillment-routes`     | `NEXO-TASK-024` | Configurar abastecimiento         | `CONFIGURACION`        | `CONFIGURATION_STEP`  | No aparece como opción principal; se abre dentro de la tarea de administración correspondiente.                                  | NEXO-UX-008                           |
| `NEXO-ROUTE-042` | `/inventory/settings/internal-prices`        | `NEXO-TASK-025` | Configurar referencias internas   | `CONFIGURACION`        | `CONFIGURATION_STEP`  | No aparece como opción principal; se abre dentro de la tarea de administración correspondiente.                                  | NEXO-UX-008                           |
| `NEXO-ROUTE-043` | `/inventory/settings/locations/[id]/catalog` | `NEXO-TASK-023` | Administrar ubicaciones           | `CONFIGURACION`        | `CONFIGURATION_STEP`  | No aparece como opción principal; se abre dentro de la tarea de administración correspondiente.                                  | NEXO-UX-015                           |
| `NEXO-ROUTE-044` | `/inventory/settings/products`               | `NEXO-TASK-022` | Administrar productos y unidades  | `CONFIGURACION`        | `CONFIGURATION_STEP`  | No aparece como opción principal; se abre dentro de la tarea de administración correspondiente.                                  | NEXO-UX-008                           |
| `NEXO-ROUTE-045` | `/inventory/settings/remissions`             | `NEXO-TASK-024` | Configurar abastecimiento         | `CONFIGURACION`        | `CONFIGURATION_STEP`  | No aparece como opción principal; se abre dentro de la tarea de administración correspondiente.                                  | NEXO-UX-008                           |
| `NEXO-ROUTE-046` | `/inventory/settings/remissions/products`    | `NEXO-TASK-024` | Configurar abastecimiento         | `CONFIGURACION`        | `CONFIGURATION_STEP`  | No aparece como opción principal; se abre dentro de la tarea de administración correspondiente.                                  | NEXO-UX-008                           |
| `NEXO-ROUTE-047` | `/inventory/settings/request-policies`       | `NEXO-TASK-024` | Configurar abastecimiento         | `CONFIGURACION`        | `CONFIGURATION_STEP`  | No aparece como opción principal; se abre dentro de la tarea de administración correspondiente.                                  | NEXO-UX-008                           |
| `NEXO-ROUTE-048` | `/inventory/settings/sites`                  | `NEXO-TASK-024` | Configurar abastecimiento         | `CONFIGURACION`        | `CONFIGURATION_STEP`  | No aparece como opción principal; se abre dentro de la tarea de administración correspondiente.                                  | NEXO-UX-008                           |
| `NEXO-ROUTE-049` | `/inventory/settings/sites/[id]/operations`  | `NEXO-TASK-024` | Configurar abastecimiento         | `CONFIGURACION`        | `CONFIGURATION_STEP`  | No aparece como opción principal; se abre dentro de la tarea de administración correspondiente.                                  | NEXO-UX-008                           |
| `NEXO-ROUTE-050` | `/inventory/settings/supply-routes`          | `NEXO-TASK-024` | Configurar abastecimiento         | `CONFIGURACION`        | `CONFIGURATION_STEP`  | No aparece como opción principal; se abre dentro de la tarea de administración correspondiente.                                  | NEXO-UX-008                           |
| `NEXO-ROUTE-051` | `/inventory/settings/units`                  | `NEXO-TASK-022` | Administrar productos y unidades  | `CONFIGURACION`        | `CONFIGURATION_STEP`  | No aparece como opción principal; se abre dentro de la tarea de administración correspondiente.                                  | NEXO-UX-008                           |
| `NEXO-ROUTE-052` | `/inventory/stock`                           | `NEXO-TASK-013` | Consultar existencias             | `SUPERVISION`          | `TASK_ENTRY`          | Puede aparecer como tarea humana cuando existe permiso, contexto y trabajo compatibles; la etiqueta no deriva de la URL.         | NEXO-UX-007                           |
| `NEXO-ROUTE-053` | `/inventory/stock/assign-location`           | `NEXO-TASK-008` | Ubicar existencias                | `OPERACION`            | `TASK_STEP`           | No aparece como entrada independiente; se abre desde la tarea vigente y conserva contexto, instancia y retorno.                  | NEXO-UX-015                           |
| `NEXO-ROUTE-054` | `/inventory/transfers`                       | `NEXO-TASK-009` | Mover existencias                 | `OPERACION`            | `TASK_ENTRY`          | Puede aparecer como tarea humana cuando existe permiso, contexto y trabajo compatibles; la etiqueta no deriva de la URL.         | NEXO-UX-016                           |
| `NEXO-ROUTE-055` | `/inventory/warehouse`                       | `NEXO-TASK-028` | Resolver un destino contextual    | `TRANSVERSAL_TECNICA`  | `LEGACY_ALIAS`        | Permanece oculto como alias compatible y no adquiere identidad ni etiqueta de navegación.                                        | NEXO-UX-008                           |
| `NEXO-ROUTE-056` | `/inventory/withdraw`                        | `NEXO-TASK-010` | Registrar un retiro               | `OPERACION`            | `TASK_ENTRY`          | Puede aparecer como tarea humana cuando existe permiso, contexto y trabajo compatibles; la etiqueta no deriva de la URL.         | NEXO-UX-017                           |
| `NEXO-ROUTE-057` | `/kiosk/[slug]`                              | `NEXO-TASK-028` | Resolver un destino contextual    | `TRANSVERSAL_TECNICA`  | `CONTEXT_RESOLVER`    | Permanece oculto; resuelve código, ubicación, slug o dispositivo y redirige a una tarea autorizada.                              | NEXO-UX-008                           |
| `NEXO-ROUTE-058` | `/l/[code]`                                  | `NEXO-TASK-028` | Resolver un destino contextual    | `TRANSVERSAL_TECNICA`  | `CONTEXT_RESOLVER`    | Permanece oculto; resuelve código, ubicación, slug o dispositivo y redirige a una tarea autorizada.                              | NEXO-UX-008                           |
| `NEXO-ROUTE-059` | `/login`                                     | `NEXO-TASK-029` | Resolver acceso                   | `TRANSVERSAL_TECNICA`  | `ACCESS_SYSTEM`       | Permanece fuera de la navegación empresarial; resuelve autenticación o denegación segura.                                        | NEXO-UX-008                           |
| `NEXO-ROUTE-060` | `/no-access`                                 | `NEXO-TASK-029` | Resolver acceso                   | `TRANSVERSAL_TECNICA`  | `ACCESS_SYSTEM`       | Permanece fuera de la navegación empresarial; resuelve autenticación o denegación segura.                                        | NEXO-UX-008                           |
| `NEXO-ROUTE-061` | `/printing/designer`                         | `NEXO-TASK-027` | Configurar impresión              | `CONFIGURACION`        | `CONFIGURATION_STEP`  | No aparece como opción principal; se abre dentro de la tarea de administración correspondiente.                                  | NEXO-UX-037                           |
| `NEXO-ROUTE-062` | `/printing/jobs`                             | `NEXO-TASK-026` | Controlar impresión               | `SUPERVISION`          | `TASK_ENTRY`          | Puede aparecer como tarea humana cuando existe permiso, contexto y trabajo compatibles; la etiqueta no deriva de la URL.         | NEXO-UX-037                           |
| `NEXO-ROUTE-063` | `/printing/setup`                            | `NEXO-TASK-027` | Configurar impresión              | `CONFIGURACION`        | `CONFIGURATION_ENTRY` | Puede aparecer únicamente bajo Administrar y solo cuando existe una capacidad exacta de configuración.                           | NEXO-UX-037                           |
| `NEXO-ROUTE-064` | `/scanner`                                   | `NEXO-TASK-028` | Resolver un destino contextual    | `TRANSVERSAL_TECNICA`  | `CONTEXT_UTILITY`     | Permanece oculto y solo se invoca desde una tarea que necesita la utilidad; al terminar retorna al mismo contexto.               | NEXO-UX-020                           |

Reconciliación:

```text
EXPECTED_ROUTES = 64
MATERIALIZED_ROUTES = 64
UNIQUE_ROUTE_IDENTITIES = 64
MISSING_ROUTE_BINDINGS = 0
DUPLICATE_ROUTE_BINDINGS = 0
ACCESS_SYSTEM = 2
CONFIGURATION_ENTRY = 4
CONFIGURATION_STEP = 21
CONTEXT_RESOLVER = 3
CONTEXT_UTILITY = 1
LEGACY_ALIAS = 1
REFERENCE_STEP = 4
TASK_ENTRY = 15
TASK_RESOLVER = 2
TASK_STEP = 11
```

##### 7.3. Invariantes del registro

1. cada ruta inventariada tiene exactamente un binding primario;
2. una tarea puede utilizar varias rutas y una ruta resolutora puede proyectar varias funciones, pero la resolución final conserva una sola intención principal;
3. ninguna ruta de detalle, acción, referencia, alias, acceso o utilidad se agrega al menú por existir;
4. las rutas dinámicas no producen etiquetas desde sus segmentos;
5. cambiar una URL exige actualizar el binding sin renombrar la `task_key`;
6. retirar una ruta conserva historial y establece sustitución o alias;
7. el acceso directo revalida toda la autoridad y no confía en el binding enviado por el cliente.

---

#### 8. `NEXO-NAVIGATION-ENTRY-RETURN-CONTRACT-001`

##### 8.1. Contexto mínimo de entrada

| Campo                     | Regla                                                                   |
| ------------------------- | ----------------------------------------------------------------------- |
| `task_key`                | identidad humana solicitada o resuelta                                  |
| `task_instance_id`        | instancia autoritativa cuando existe trabajo concreto                   |
| `process_id` y etapa      | posición empresarial vigente                                            |
| `actor_context_ref`       | referencia a actor, función y fuente de autoridad                       |
| `territory_ref`           | sede, área o relación territorial resuelta                              |
| `resource_ref`            | recurso mínimo de la tarea                                              |
| `permission_decision_ref` | decisión server-side de lectura o acción                                |
| `route_binding_version`   | versión del binding físico aplicado                                     |
| `continuation_ref`        | referencia opaca para continuar sin confiar en parámetros del cliente   |
| `return_task_key`         | tarea humana a la que debe volver la superficie                         |
| `origin_channel`          | inicio, cola, deep link, QR, kiosco, escáner, notificación o referencia |
| `expected_version`        | versión del recurso o tarea para evitar acciones obsoletas              |

##### 8.2. Entrada directa y deep link

Un deep link puede identificar un recurso o código, pero deberá:

1. resolver la tarea compatible en servidor;
2. comprobar actor, dispositivo, territorio, recurso, permiso, estado y versión;
3. redirigir a la proyección humana, no a un módulo genérico;
4. ocultar existencia y detalles cuando el actor no tenga lectura;
5. conservar un retorno seguro;
6. no ejecutar una mutación por abrir el enlace;
7. expirar o invalidarse cuando cambie la autoridad o el recurso.

##### 8.3. Breadcrumb y retorno

La jerarquía visible tendrá como máximo:

```text
Inicio > Tarea humana > Paso o recurso
```

No se construirán breadcrumbs desde segmentos de URL. El botón de retorno vuelve a la tarea o cola que originó el paso, preservando filtros permitidos, no a una carpeta técnica. Si el origen ya no es válido, vuelve al inicio contextual y explica el cambio.

##### 8.4. Reanudación

Una tarea se reanuda únicamente cuando la instancia, asignación, etapa, permiso, territorio y versión continúan vigentes. Si cambió, se muestra `NAV_TASK_CHANGED` y se ofrece la nueva continuación autoritativa; nunca se conserva un botón obsoleto.

---

#### 9. `NEXO-CONTEXTUAL-UTILITY-CONTRACT-001`

| Utilidad o entrada    | Rutas actuales                     | Regla                                                                              | Retorno                                 |
| --------------------- | ---------------------------------- | ---------------------------------------------------------------------------------- | --------------------------------------- |
| escaneo               | `NEXO-ROUTE-064`                   | se invoca desde una tarea y recibe tipos de código permitidos; no es módulo global | misma tarea e instancia                 |
| código de ubicación   | `NEXO-ROUTE-058`                   | resuelve recurso, tarea y autoridad antes de abrir una superficie                  | tarea compatible o inicio seguro        |
| kiosco por slug       | `NEXO-ROUTE-057`                   | resuelve dispositivo, sede, área, actor y tarea permitida                          | tarea de kiosco autorizada              |
| apertura de ubicación | `NEXO-ROUTE-025`                   | resuelve la ubicación antes de iniciar trabajo                                     | tarea de ubicación                      |
| alias de bodega       | `NEXO-ROUTE-055`                   | mantiene compatibilidad sin identidad ni opción de menú propia                     | destino humano resuelto                 |
| acceso y denegación   | `NEXO-ROUTE-059`; `NEXO-ROUTE-060` | permanecen fuera de la navegación empresarial                                      | destino autorizado o explicación segura |

La utilidad no hereda autoridad por haber sido invocada. El retorno tampoco conserva un contexto revocado.

---

#### 10. `NEXO-NAVIGATION-STATE-CONTRACT-001`

| Estado                      | Significado                                                | Comportamiento obligatorio                                                              |
| --------------------------- | ---------------------------------------------------------- | --------------------------------------------------------------------------------------- |
| `NAV_CONTEXT_RESOLVING`     | se está resolviendo actor, función, territorio y permisos  | no mostrar tareas ni conteos como confirmados                                           |
| `NAV_TASK_READY`            | existe una siguiente tarea ejecutable                      | mostrar una sola acción primaria y contexto mínimo                                      |
| `NAV_MULTIPLE_TASKS`        | existen varias tareas compatibles                          | priorizar en servidor y ofrecer las demás como cola secundaria                          |
| `NAV_NO_CURRENT_TASK`       | no existe trabajo ejecutable vigente                       | mostrar vacío útil y únicamente iniciadores autorizados                                 |
| `NAV_REFERENCE_ONLY`        | solo existe capacidad de consulta                          | no presentar botones de mutación ni lenguaje de ejecución                               |
| `NAV_CONFIGURATION_ONLY`    | solo existen capacidades de administración                 | mostrar Administrar sin simular trabajo operativo                                       |
| `NAV_TASK_CHANGED`          | la tarea, asignación, etapa o versión cambió               | invalidar la acción anterior y cargar la nueva fuente                                   |
| `NAV_CONTEXT_REVOKED`       | actor, turno, territorio o permiso dejó de ser válido      | fallar cerrado, limpiar contexto y volver al inicio seguro                              |
| `NAV_DIRECT_LINK_DENIED`    | una ruta directa no supera autorización                    | no revelar existencia ni ofrecer bypass                                                 |
| `NAV_DEEP_LINK_UNRESOLVED`  | el código o recurso no produce una tarea válida            | explicar que no puede abrirse y conservar un retorno seguro                             |
| `NAV_PARTIAL_DATA`          | alguna fuente necesaria no respondió o es incompleta       | marcar parcialidad y no calcular una prioridad definitiva                               |
| `NAV_OFFLINE_LIMITED`       | no existe conectividad suficiente                          | mostrar solo capacidades offline previamente admitidas y sin éxito empresarial ficticio |
| `NAV_ACTION_RESULT_UNKNOWN` | la navegación o acción fue enviada sin receipt verificable | bloquear repetición ciega y reconciliar antes de continuar                              |
| `NAV_FATAL_ERROR`           | no es posible resolver navegación de forma segura          | mostrar error canónico, correlación y recuperación sin rutas técnicas                   |

Reconciliación:

```text
EXPECTED_NAVIGATION_STATES = 14
MATERIALIZED_NAVIGATION_STATES = 14
DUPLICATE_NAVIGATION_STATES = 0
```

---

#### 11. Autorización, seguridad y privacidad

1. la navegación solo consume decisiones de autorización; nunca las reemplaza;
2. cada carga de menú, tarea, paso y recurso aplica filtro server-side;
3. el `href` no se considera permiso ni territorio;
4. una opción visible no autoriza Server Action, API, RPC ni escritura;
5. una opción oculta no sustituye la denegación de servidor;
6. los conteos y etiquetas del menú no revelan recursos de otros territorios;
7. un dispositivo compartido no recibe configuración ni datos sensibles por sesión técnica;
8. cambiar actor, función, sede operativa, turno o dispositivo invalida bindings y datos incompatibles;
9. la simulación conserva intersección con la autoridad real y no publica mutaciones;
10. toda telemetría usa `task_key`, `screen_id` cuando exista y ruta física por separado, sin tratar la URL como identidad empresarial.

---

#### 12. Evidencia técnica actual y diagnóstico

| Fuente actual                                    | Evidencia verificable                                                                                                                  | Estado frente al diseño | Decisión                                                                                                         |
| ------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------- | ----------------------- | ---------------------------------------------------------------------------------------------------------------- |
| `app_navigation_items`                           | conserva grupo, etiqueta, `href`, icono y permiso; la unicidad por aplicación y URL hace que el registro físico sea el centro del ítem | `IMPLEMENTADO_PARCIAL`  | ampliar el modelo en implementación con identidad de tarea y binding versionado, sin usar la ruta como identidad |
| `src/components/vento/standard/vento-shell.tsx`  | carga grupos e ítems desde `app_navigation_items` y filtra por permisos                                                                | `IMPLEMENTADO_PARCIAL`  | consumir un resolutor de tareas y contexto además del permiso                                                    |
| `src/components/vento/standard/vento-chrome.tsx` | renderiza directamente `group.label`, `item.label` e `item.href`                                                                       | `IMPLEMENTADO_PARCIAL`  | renderizar grupos humanos, tarea, estado y retorno resueltos                                                     |
| `scripts/sync-navigation.mjs`                    | propone grupos desde segmentos de URL, etiquetas desde el último segmento y permisos desde el patrón de ruta                           | `BRECHA_CONFIRMADA`     | limitar el escaneo a inventario técnico de superficies; no promover automáticamente una ruta como tarea de menú  |
| `src/app/page.tsx`                               | agrupa acciones en `operate`, `verify`, `configure` y `utilities` y usa rutas como destino                                             | `IMPLEMENTADO_PARCIAL`  | sustituir la composición genérica por las proyecciones de actor aprobadas y por `task_key`                       |
| inventario actual de rutas                       | existen sesenta y cuatro patrones con detalles, acciones, configuración, acceso, alias y utilidades                                    | `CLASIFICADO`           | aplicar el registro completo de esta tarea sin crear URLs nuevas                                                 |

No se modifica código en esta tarea. La evidencia describe el estado actual y el contrato de salida para implementación posterior.

---

#### 13. Decisiones aprobadas

1. `task_key` es la identidad de intención humana y la URL es un binding reemplazable;
2. se aprueban exactamente ocho familias y veintinueve tareas o resolutores;
3. la navegación global utiliza exactamente cuatro grupos humanos;
4. Inicio y la siguiente tarea preceden cualquier lista secundaria;
5. cada una de las sesenta y cuatro rutas tiene una disposición explícita;
6. detalles, acciones, referencias, aliases, acceso y utilidades no aparecen como módulos independientes;
7. escaneo, kiosco, código y deep link se invocan en contexto y regresan a la tarea;
8. la composición se resuelve por actor, función, territorio, recurso, permiso, etapa y dispositivo;
9. una persona multifunción conserva carriles y autoridad separados;
10. los labels no se generan desde segmentos de URL;
11. breadcrumbs y retorno usan tareas y recursos, no carpetas técnicas;
12. una ruta directa revalida autoridad y no constituye bypass;
13. los catorce estados representan revocación, parcialidad, offline y resultado desconocido sin éxito ficticio;
14. el catálogo de rutas puede seguir existiendo como inventario técnico, pero no gobierna la experiencia humana.

---

#### 14. Requisitos de prueba derivados

| Requisito       | Cobertura                                                                                                        |
| --------------- | ---------------------------------------------------------------------------------------------------------------- |
| `TREQ-NEXO-083` | identidad de tarea, binding versionado y resolución autoritativa separada de URL                                 |
| `TREQ-NEXO-084` | ocho familias, veintinueve tareas, cuatro grupos y prioridad de siguiente tarea                                  |
| `TREQ-NEXO-085` | composición de ocho contextos sin herencia por rol ni colapso de carriles                                        |
| `TREQ-NEXO-086` | registro completo de sesenta y cuatro rutas con una disposición por identidad                                    |
| `TREQ-NEXO-087` | entrada, deep link, breadcrumb, retorno y reanudación con revalidación                                           |
| `TREQ-NEXO-088` | utilidades, alias, kioscos, códigos y escáner ocultos y contextuales                                             |
| `TREQ-NEXO-089` | catorce estados y representación honesta de revocación, parcialidad, offline y resultado desconocido             |
| `TREQ-NEXO-090` | compatibilidad e implementación sin promover rutas técnicas automáticamente ni usar navegación como autorización |

No se modifica ningún requisito histórico.

---

#### 15. Criterios de aceptación

- [ ] Existen exactamente ocho familias de tareas y veintinueve `task_key` únicas.
- [ ] Las etiquetas visibles están formuladas como intenciones humanas y no se derivan de URLs.
- [ ] Existen exactamente cuatro grupos globales: Inicio, Mi trabajo, Consultar y controlar, Administrar.
- [ ] La siguiente tarea aparece antes que módulos, consultas o configuración.
- [ ] Los ocho contextos de composición tienen entradas y ocultamientos explícitos.
- [ ] Las sesenta y cuatro rutas inventariadas aparecen exactamente una vez en el binding primario.
- [ ] Ninguna ruta dinámica, de detalle, acción, referencia, acceso, alias o utilidad se promueve por existir.
- [ ] Los accesos directos revalidan actor, contexto, territorio, recurso, permiso, etapa y versión.
- [ ] Breadcrumb, retorno y reanudación utilizan tarea e instancia, no segmentos de URL.
- [ ] Escaneo, kiosco, código de ubicación y alias regresan a la tarea invocante.
- [ ] La navegación no concede permisos ni amplía territorios.
- [ ] Los catorce estados evitan éxito, prioridad o autoridad ficticios.
- [ ] Se crean exactamente `TREQ-NEXO-083` a `TREQ-NEXO-090`.
- [ ] Los flujos detallados posteriores consumen este contrato sin alterar la continuidad.

---

#### 16. `NEXO-TASK-NAVIGATION-HANDOFF-001`

| Resultado                                                                                        | Estado             | Responsable canónico                         | Condición de consumo                                                                              |
| ------------------------------------------------------------------------------------------------ | ------------------ | -------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| arquitectura por tareas, familias, grupos y estados                                              | `ESPECIFICADO`     | `NEXO-UX-008`                                | toda navegación posterior utiliza `task_key` y bindings                                           |
| flujo completo de solicitud                                                                      | `RESERVADO`        | `NEXO-UX-009`                                | consumir `NEXO-TASK-003` y el resolutor de abastecimiento                                         |
| preparación, despacho, transporte y recepción                                                    | `RESERVADO`        | `NEXO-UX-010` a `NEXO-UX-013`                | consumir `NEXO-TASK-004` a `NEXO-TASK-006`                                                        |
| entradas, ubicaciones, movimientos, retiros, conteos y ajustes                                   | `RESERVADO`        | `NEXO-UX-014` a `NEXO-UX-019`                | consumir `NEXO-TASK-007` a `NEXO-TASK-015`                                                        |
| escaneo, búsqueda, excepciones, filtros, masivos y offline                                       | `RESERVADO`        | `NEXO-UX-020` a `NEXO-UX-025`                | conservar utilidad contextual y estados de navegación                                             |
| LPN, activos e impresión                                                                         | `RESERVADO`        | `NEXO-UX-026` a `NEXO-UX-039`                | conservar las tareas clasificadas sin anticipar sus flujos                                        |
| modelo físico de tareas y bindings, resolutor server-side, componentes, migraciones y telemetría | `FUERA_DE_ALCANCE` | paquete de implementación NEXO en la fase E5 | iniciar solo cuando la secuencia habilite implementación y versionar Supabase desde `vento-shell` |
| pruebas automatizadas y validación operativa                                                     | `FUERA_DE_ALCANCE` | paquete E5 NEXO y certificación del BLOQUE U | implementar `TREQ-NEXO-083` a `TREQ-NEXO-090` y producir evidencia reproducible                   |

---

#### 17. Continuidad canónica

**ÚLTIMA TAREA APROBADA**

`NEXO-UX-007 — Diseñar inicio para supervisor`

**TAREA ACTUAL APROBADA**

`NEXO-UX-008 — Organizar navegación por tareas y no por rutas técnicas`

**SIGUIENTE TAREA RESERVADA**

`NEXO-UX-009 — Diseñar flujo completo de solicitud de remisión`


### ✅ NEXO-UX-009 — Diseñar flujo completo de solicitud de remisión

**Estado:** APROBADA
**Tarea anterior:** `NEXO-UX-008 — Organizar navegación por tareas y no por rutas técnicas` — APROBADA
**Tarea siguiente:** `NEXO-UX-010 — Diseñar flujo completo de preparación y despacho` — RESERVADA
**Tipo de tarea:** documental; diseño funcional completo del flujo de solicitud de abastecimiento interno, borrador reanudable, captura de líneas, resolución de origen, revisión, confirmación, persistencia idempotente, receipt, seguimiento y handoff a preparación
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/K_NEXO/04_EXPERIENCIA_DE_INVENTARIO_LOGISTICA_Y_ACTIVOS.md`
**Repositorio de aplicación inspeccionado:** `vento-nexo`
**Proceso propietario:** `VPROC-0028 — Abastecer inventario interno de sedes y áreas`
**Tarea de navegación consumida:** `NEXO-TASK-003 — SOLICITAR_ABASTECIMIENTO_INTERNO`
**Artefactos producidos:** `NEXO-REMISSION-REQUEST-FLOW-CONTRACT-001`, `NEXO-REMISSION-REQUEST-STATE-MACHINE-001`, `NEXO-REMISSION-REQUEST-STEP-CATALOG-001`, `NEXO-REMISSION-REQUEST-DATA-CONTRACT-001`, `NEXO-REMISSION-REQUEST-LINE-CONTRACT-001`, `NEXO-REMISSION-REQUEST-DRAFT-RESUME-CONTRACT-001`, `NEXO-REMISSION-REQUEST-VALIDATION-CATALOG-001`, `NEXO-REMISSION-REQUEST-IDEMPOTENCY-CONTRACT-001`, `NEXO-REMISSION-REQUEST-CONFIRMATION-RECEIPT-001`, `NEXO-REMISSION-REQUEST-HANDOFF-001`, `NEXO-REMISSION-REQUEST-ROUTE-DISPOSITION-001` y `NEXO-REMISSION-REQUEST-IMPLEMENTATION-HANDOFF-001`
**Decisiones consumidas:** `UX-BASE-001` a `UX-BASE-005`; `UX-STATION-010` a `UX-STATION-012`; `NEXO-DOM-001`; `NEXO-UX-001` a `NEXO-UX-008`; `NEXO-REQUESTER-HOME-CONTRACT-001`; `NEXO-REQUESTER-HOME-INFORMATION-ARCHITECTURE-001`; `NEXO-REQUESTER-INITIATOR-DECISION-MATRIX-001`; `NEXO-REQUESTER-STAGE-PROJECTION-MATRIX-001`; `NEXO-TASK-NAVIGATION-CONTRACT-001`; `NEXO-NAVIGATION-TASK-CATALOG-001`; `NEXO-ROUTE-TO-TASK-REGISTRY-001`; contratos de autorización, contexto activo, unidades, presentaciones, políticas de solicitud, rutas de abastecimiento, firma de dispositivo compartido y requisitos `TREQ-*` vigentes
**Cambios físicos autorizados:** ninguno; no modifica código, tablas, RPC, migraciones, RLS, permisos, datos, navegación desplegada, configuración ni ambientes remotos

---

#### 1. Propósito

Definir de extremo a extremo cómo una persona autorizada solicita abastecimiento interno para su sede y área, desde la entrada a la tarea hasta la obtención de un resultado empresarial verificable y el handoff a preparación.

El flujo deberá evitar que la interfaz trate como equivalentes:

- escribir datos en un formulario;
- conservar un borrador;
- validar una intención;
- confirmar una solicitud;
- crear un registro parcial;
- recibir un resultado empresarial;
- crear una remisión física;
- preparar, despachar, transportar o recibir mercancía.

La regla canónica es:

```text
CONTEXTO SOLICITANTE AUTORIZADO
+ NECESIDAD Y LINEAS VALIDAS
+ ORIGEN DE ABASTECIMIENTO RESUELTO
+ REVISION COMPLETA
+ CONFIRMACION EXPLICITA
+ COMANDO ATOMICO E IDEMPOTENTE
+ RECEIPT VERIFICABLE
→ SOLICITUD EMPRESARIAL EN ESTADO REQUESTED
```

Una solicitud confirmada no reserva inventario, no aprueba disponibilidad, no constituye picking, no crea custodia, no prueba despacho y no acredita recepción.

---

#### 2. Resultado material

Se aprueban doce artefactos documentales consumibles:

1. `NEXO-REMISSION-REQUEST-FLOW-CONTRACT-001`, que fija frontera, lenguaje, actor, autoridad y resultado;
2. `NEXO-REMISSION-REQUEST-STATE-MACHINE-001`, que separa estado de interfaz, borrador y solicitud empresarial;
3. `NEXO-REMISSION-REQUEST-STEP-CATALOG-001`, que materializa doce pasos completos y sus transiciones;
4. `NEXO-REMISSION-REQUEST-DATA-CONTRACT-001`, que define contexto, cabecera, plan de solicitudes y snapshots;
5. `NEXO-REMISSION-REQUEST-LINE-CONTRACT-001`, que define producto, política, cantidad, unidad, conversión, área y ruta por línea;
6. `NEXO-REMISSION-REQUEST-DRAFT-RESUME-CONTRACT-001`, que define un borrador activo, autosave, versión, reanudación, descarte y cambio de contexto;
7. `NEXO-REMISSION-REQUEST-VALIDATION-CATALOG-001`, que materializa veinticuatro validaciones y su momento de aplicación;
8. `NEXO-REMISSION-REQUEST-IDEMPOTENCY-CONTRACT-001`, que impide duplicados, escrituras parciales y repetición ciega;
9. `NEXO-REMISSION-REQUEST-CONFIRMATION-RECEIPT-001`, que define revisión, confirmación, receipt y recuperación de resultado desconocido;
10. `NEXO-REMISSION-REQUEST-HANDOFF-001`, que entrega solicitudes inmutables y versionadas al flujo de preparación;
11. `NEXO-REMISSION-REQUEST-ROUTE-DISPOSITION-001`, que decide las rutas actuales relacionadas sin inventar URLs;
12. `NEXO-REMISSION-REQUEST-IMPLEMENTATION-HANDOFF-001`, que separa el contrato aprobado de los cambios físicos posteriores.

| Elemento                                        | Total esperado | Total materializado | Faltantes | Duplicados |
| ----------------------------------------------- | -------------: | ------------------: | --------: | ---------: |
| Pasos del flujo                                 |             12 |                  12 |         0 |          0 |
| Estados de interfaz                             |             16 |                  16 |         0 |          0 |
| Estados del borrador                            |              6 |                   6 |         0 |          0 |
| Estados empresariales producidos por esta tarea |              1 |                   1 |         0 |          0 |
| Validaciones materializadas                     |             24 |                  24 |         0 |          0 |
| Disposiciones de rutas relacionadas             |              6 |                   6 |         0 |          0 |
| Requisitos de prueba nuevos o modificados       |             10 |                  10 |         0 |          0 |

El resultado queda `ESPECIFICADO`. No declara el flujo `IMPLEMENTADO`, `VALIDADO` ni desplegado.

---

#### 3. Alcance

##### 3.1. Incluido

- entrada desde `NEXO-TASK-003` y desde el inicio del solicitante;
- resolución del actor, sede, área, dispositivo, turno y permiso;
- detección y reanudación del borrador activo;
- captura de necesidad, fecha requerida y observaciones cuando apliquen;
- búsqueda y selección de productos habilitados para la unidad solicitante;
- cantidad, unidad, presentación, política de solicitud y conversión por línea;
- resolución de la fuente y ruta de abastecimiento sin selección arbitraria;
- agrupación explícita cuando las líneas pertenecen a más de una fuente;
- validaciones cliente y servidor con autoridad exclusivamente server-side;
- revisión final, consecuencias y confirmación explícita;
- escritura atómica, idempotencia, concurrencia y recuperación de timeout;
- receipt estructurado y retorno a seguimiento;
- handoff inmutable hacia preparación;
- diagnóstico del código, esquema y flujo actuales.

##### 3.2. Excluido

- aprobar solicitudes;
- reservar o descontar inventario;
- elegir LOC, posición interna, lote o LPN de picking;
- producir, preparar, sustituir, empacar, cargar, sellar o despachar;
- asumir custodia, transportar, entregar o recibir;
- resolver faltantes, sobrantes, daños, rechazos, devoluciones o cierres;
- cambiar políticas, productos, UOM, rutas de abastecimiento o permisos;
- implementar tablas de borrador, claves de idempotencia, RPC o componentes;
- ejecutar migraciones, backfills, DDL, DML o despliegues;
- certificar el flujo en tablet, kiosco, dispositivo compartido o producción.

---

#### 4. `NEXO-REMISSION-REQUEST-FLOW-CONTRACT-001`

##### 4.1. Nombre humano y efecto empresarial

La experiencia utilizará como término principal:

```text
SOLICITUD DE ABASTECIMIENTO
```

El término “remisión” podrá conservarse como nombre técnico o documental legacy mientras exista compatibilidad, pero el solicitante no verá “remisión creada” como si el despacho ya existiera.

El único efecto empresarial exitoso de este flujo es:

```text
REQUEST_CREATED
business_status = requested
next_lane = PREPARATION_OR_FULFILLMENT
```

##### 4.2. Actor autorizado

El actor ordinario es una persona que participa como solicitante en `VPROC-0028` y posee la capacidad exacta `nexo.inventory.remissions.request` dentro del contexto operativo vigente.

La elegibilidad exige conjuntamente:

- identidad y actor efectivo válidos;
- función solicitante vigente;
- sede y área solicitantes autorizadas;
- turno o check-in cuando el contrato operativo lo requiera;
- dispositivo permitido;
- permiso exacto;
- capacidad de la sede para solicitar;
- producto, política y ruta compatibles;
- ausencia de revocación, suplantación o contexto obsoleto.

El nombre del rol, una ruta visible, un query parameter o una sesión técnica no sustituyen estas condiciones.

##### 4.3. Segregación

Desde este flujo el solicitante puede:

- crear o continuar su borrador;
- modificar líneas mientras el borrador sea editable;
- revisar y confirmar;
- recibir el receipt;
- consultar el seguimiento de solicitudes propias autorizadas.

No puede por esta participación:

- aprobar;
- preparar;
- seleccionar inventario físico;
- despachar;
- registrar tránsito;
- recibir;
- conciliar diferencias;
- cerrar la solicitud;
- cambiar maestros o políticas.

##### 4.4. Iniciadores admitidos

| Iniciador                       | Entrada                             | Decisión                                                                  |
| ------------------------------- | ----------------------------------- | ------------------------------------------------------------------------- |
| `MANUAL_REQUESTER`              | acción `NUEVA_SOLICITUD`            | abre o reanuda el único borrador ordinario compatible                     |
| `REPLENISHMENT_SUGGESTION`      | sugerencia autorizada de reposición | precarga líneas como propuesta; exige revisión y confirmación humana      |
| `ASSIGNED_CLARIFICATION_RETURN` | tarea devuelta al solicitante       | reabre únicamente campos autorizados sobre una solicitud todavía editable |
| `DEEP_LINK_TO_DRAFT`            | referencia opaca de continuación    | revalida actor, contexto, versión y propiedad antes de abrir              |
| `SHARED_DEVICE_ENTRY`           | tarea en dispositivo compartido     | exige identificación y firma del actor efectivo antes de confirmar        |

Una sugerencia automática nunca se convierte por sí sola en solicitud empresarial.

---

#### 5. `NEXO-REMISSION-REQUEST-STATE-MACHINE-001`

##### 5.1. Tres máquinas de estado separadas

```text
ESTADO DE INTERFAZ
≠ ESTADO DEL BORRADOR
≠ ESTADO EMPRESARIAL DE LA SOLICITUD
```

La interfaz representa lo que puede hacer la persona. El borrador representa una intención todavía mutable. La solicitud empresarial representa un hecho confirmado y consumible por otros actores.

##### 5.2. Estados del borrador

| Estado             | Significado                                           | Mutabilidad                         |
| ------------------ | ----------------------------------------------------- | ----------------------------------- |
| `DRAFT_EMPTY`      | existe contexto válido sin contenido material         | editable                            |
| `DRAFT_EDITABLE`   | contiene al menos un dato o línea                     | editable                            |
| `DRAFT_STALE`      | cambió contexto, catálogo, política, ruta o versión   | bloqueado hasta reconciliar         |
| `DRAFT_CONFLICTED` | otra sesión modificó la misma versión                 | bloqueado hasta recargar o resolver |
| `DRAFT_DISCARDED`  | descarte explícito y auditado                         | terminal                            |
| `DRAFT_SUBMITTED`  | fue consumido por un resultado empresarial confirmado | terminal                            |

El borrador no usa `pending`, `requested` ni estados de preparación.

##### 5.3. Estados de interfaz

| Estado                          | Condición                            | Comportamiento obligatorio                                           |
| ------------------------------- | ------------------------------------ | -------------------------------------------------------------------- |
| `REQUEST_CONTEXT_RESOLVING`     | se resuelve actor y contexto         | no mostrar formulario operable ni datos como definitivos             |
| `REQUEST_CONTEXT_BLOCKED`       | falta una condición obligatoria      | explicar bloqueo y no ofrecer bypass                                 |
| `REQUEST_DRAFT_DECISION`        | existe un borrador compatible        | ofrecer continuar, descartar o volver; no crear otro silenciosamente |
| `REQUEST_EDITING_EMPTY`         | borrador sin líneas                  | enfocar producto o sugerencias autorizadas                           |
| `REQUEST_EDITING`               | borrador con contenido               | autosave versionado y resumen visible                                |
| `REQUEST_DRAFT_SAVING`          | persiste una versión                 | conservar edición local y mostrar estado real                        |
| `REQUEST_DRAFT_SAVE_FAILED`     | falló el autosave                    | no perder datos; permitir reintento controlado                       |
| `REQUEST_DRAFT_STALE`           | cambió una dependencia               | listar cambios y exigir reconciliación                               |
| `REQUEST_VALIDATION_BLOCKED`    | existe al menos un error impeditivo  | identificar línea, regla y corrección necesaria                      |
| `REQUEST_READY_FOR_REVIEW`      | todas las validaciones previas pasan | habilitar revisión, no envío directo                                 |
| `REQUEST_REVIEWING`             | se presenta el resumen completo      | impedir edición accidental durante la confirmación                   |
| `REQUEST_CONFIRMATION_REQUIRED` | consecuencia lista para aceptar      | exigir gesto explícito del actor efectivo                            |
| `REQUEST_SUBMITTING`            | comando aceptado para envío          | bloquear doble acción y conservar `submission_intent_id`             |
| `REQUEST_RESULT_UNKNOWN`        | no existe receipt concluyente        | consultar por intención; prohibir repetición ciega                   |
| `REQUEST_SUBMITTED`             | existe receipt verificable           | mostrar código, estado, siguiente responsable y seguimiento          |
| `REQUEST_FATAL_ERROR`           | no puede recuperarse con seguridad   | preservar correlación, borrador y retorno seguro                     |

##### 5.4. Estado empresarial producido

Este flujo solo produce:

```text
requested
```

Compatibilidad legacy permitida:

```text
request_status = pending
flow_status = requested
```

La implementación deberá mantener una traducción explícita y no inferir que `pending` significa preparado, aprobado o en tránsito.

---

#### 6. `NEXO-REMISSION-REQUEST-STEP-CATALOG-001`

| Paso | Identidad                       | Entrada                   | Acción principal                     | Resultado                       | Interrupción y reanudación                |
| ---: | ------------------------------- | ------------------------- | ------------------------------------ | ------------------------------- | ----------------------------------------- |
|    1 | `REQ-STEP-01-RESOLVE-CONTEXT`   | entrada a `NEXO-TASK-003` | validar contexto                     | contexto solicitante o bloqueo  | volver al inicio seguro si se revoca      |
|    2 | `REQ-STEP-02-RESOLVE-DRAFT`     | contexto válido           | continuar o iniciar                  | borrador único compatible       | referencia opaca y versión                |
|    3 | `REQ-STEP-03-DEFINE-NEED`       | borrador editable         | registrar necesidad                  | cabecera mínima                 | autosave sin efecto empresarial           |
|    4 | `REQ-STEP-04-ADD-PRODUCT`       | catálogo autorizado       | añadir producto                      | línea candidata                 | conserva búsqueda y posición de trabajo   |
|    5 | `REQ-STEP-05-SET-QUANTITY`      | producto elegido          | definir cantidad y política          | cantidad normalizada            | conserva valor original y conversión      |
|    6 | `REQ-STEP-06-RESOLVE-ROUTE`     | línea completa            | resolver fuente y ruta               | línea elegible o bloqueada      | revalidación si cambia configuración      |
|    7 | `REQ-STEP-07-CONSOLIDATE-LINES` | una o más líneas          | unir duplicados y agrupar fuentes    | plan de solicitud               | decisión explícita ante líneas bloqueadas |
|    8 | `REQ-STEP-08-VALIDATE-DRAFT`    | plan completo             | corregir errores                     | borrador listo                  | errores vinculados a campo o línea        |
|    9 | `REQ-STEP-09-REVIEW`            | borrador válido           | revisar consecuencia                 | resumen inmutable de revisión   | volver a edición conserva borrador        |
|   10 | `REQ-STEP-10-CONFIRM`           | revisión vigente          | confirmar                            | comando firmado                 | cambio de versión obliga nueva revisión   |
|   11 | `REQ-STEP-11-SUBMIT`            | comando confirmado        | persistir atómicamente               | receipt o resultado desconocido | reconciliar por intención                 |
|   12 | `REQ-STEP-12-TRACK`             | receipt verificado        | abrir seguimiento o volver al inicio | solicitud propia visible        | retorno a la tarea originaria             |

Reconciliación:

```text
EXPECTED_REQUEST_STEPS = 12
MATERIALIZED_REQUEST_STEPS = 12
MISSING_REQUEST_STEPS = 0
DUPLICATE_REQUEST_STEPS = 0
```

---

#### 7. `NEXO-REMISSION-REQUEST-DATA-CONTRACT-001`

##### 7.1. Contexto autoritativo

```text
request_context
- principal_id
- actor_id
- actor_source
- actor_function = REQUESTER
- destination_site_id
- requesting_area_id
- requesting_area_kind
- shift_id cuando aplique
- device_id y device_mode
- permission_decision_id
- authorization_version
- context_version
- resolved_at
```

La sede destino y el área solicitante se derivan del contexto activo. El flujo ordinario no permite seleccionar arbitrariamente otra sede o área mediante el formulario.

##### 7.2. Cabecera del borrador

```text
request_draft
- request_draft_id
- draft_version
- lifecycle_state
- task_key = NEXO-TASK-003
- destination_site_id
- requesting_area_id
- initiator_type
- need_by_date
- need_reason_code cuando una política lo exija
- notes
- created_by_actor_id
- updated_by_actor_id
- created_at
- updated_at
- dependency_snapshot_version
```

La fecha requerida:

- no puede estar en el pasado del contexto operativo;
- no promete entrega ni crea un SLA;
- solo será obligatoria cuando una política aprobada lo determine;
- se interpreta en la zona horaria canónica de la sede;
- se conserva como solicitud del actor, no como compromiso de bodega.

##### 7.3. Plan de solicitudes

El modelo actual exige un origen por solicitud. Por tanto, la resolución produce uno de estos planes:

| Plan                    | Condición                                            | Resultado de revisión                                          |
| ----------------------- | ---------------------------------------------------- | -------------------------------------------------------------- |
| `SINGLE_SOURCE`         | todas las líneas elegibles resuelven la misma fuente | una solicitud empresarial                                      |
| `MULTI_SOURCE_SPLIT`    | líneas elegibles resuelven fuentes distintas         | varias solicitudes agrupadas bajo una única intención de envío |
| `BLOCKED_LINES_PRESENT` | una o más líneas carecen de ruta válida              | no enviar hasta corregir o excluir explícitamente esas líneas  |
| `NO_ELIGIBLE_LINES`     | ninguna línea puede solicitarse                      | bloquear confirmación                                          |

Una separación por fuentes será visible antes de confirmar. No se crearán solicitudes ocultas ni se omitirá una línea silenciosamente.

##### 7.4. Snapshot de dependencias

La revisión conserva como mínimo:

```text
catalog_version
request_policy_version
uom_profile_version
supply_route_version
product_fulfillment_route_version
context_version
draft_version
```

Si cualquiera cambia materialmente antes de persistir, el servidor devuelve conflicto y obliga a revisar nuevamente.

---

#### 8. `NEXO-REMISSION-REQUEST-LINE-CONTRACT-001`

##### 8.1. Línea normalizada

```text
request_line
- client_line_id
- product_id
- product_display_snapshot
- requesting_area_kind
- request_policy_id
- requested_policy_qty
- input_unit_code
- input_uom_profile_id
- input_qty
- conversion_factor_to_stock
- stock_unit_code
- requested_base_qty
- fulfillment_source_site_id
- fulfillment_route_id
- supply_mode
- route_resolution_status
- line_version
```

##### 8.2. Cantidad y unidad

Toda cantidad conserva simultáneamente:

```text
VALOR SOLICITADO POR LA PERSONA
+ UNIDAD O PRESENTACION ELEGIDA
+ POLITICA APLICADA
+ FACTOR DE CONVERSION VIGENTE
+ CANTIDAD BASE RESULTANTE
```

Reglas:

1. la interfaz no guarda únicamente la cantidad convertida;
2. una conversión no se deriva de texto visible ni de una constante local;
3. el servidor vuelve a validar política, mínimo, paso, fracción y factor;
4. una unidad incompatible bloquea la línea;
5. el cambio de perfil o política vuelve obsoleta la revisión;
6. una cantidad base calculada no autoriza despacho de esa misma cantidad;
7. productos de peso, conteo con peso, volumen o presentación fija conservan su modo de medición;
8. planes de empaque productivo permanecen separados de la cantidad solicitada y se consumen después según la ruta.

##### 8.3. Duplicados de línea

La clave lógica de consolidación es:

```text
product_id
+ requesting_area_kind
+ request_policy_id
+ input_uom_profile_id
+ fulfillment_source_site_id
```

Cuando dos líneas comparten la clave:

- la interfaz propone consolidarlas;
- la cantidad combinada se revalida contra mínimo, paso y fracción;
- no se envían duplicadas silenciosamente;
- si el usuario conserva separación por una razón empresarial admitida, deberá existir una identidad de línea distinta y una justificación estructurada.

##### 8.4. Disponibilidad y stock

La disponibilidad de la fuente es información de apoyo, no compromiso.

- solo se muestra si el actor posee permiso de lectura compatible;
- puede reducirse a estado `AVAILABLE`, `LOW`, `UNAVAILABLE` o `UNKNOWN`;
- no expone ubicaciones, lotes o cantidades sensibles al solicitante sin autorización;
- un stock bajo no convierte al solicitante en preparador ni bloquea por sí solo la solicitud;
- preparación decide disponibilidad física y faltantes en `NEXO-UX-010`.

---

#### 9. `NEXO-REMISSION-REQUEST-DRAFT-RESUME-CONTRACT-001`

##### 9.1. Unicidad del borrador ordinario

Existe como máximo un borrador ordinario editable para la combinación:

```text
actor_id
+ destination_site_id
+ requesting_area_id
+ task_key = NEXO-TASK-003
+ initiator_type = MANUAL_REQUESTER
```

Una sugerencia automática o una devolución de aclaración conserva identidad de iniciador independiente y no se mezcla silenciosamente con el borrador ordinario.

##### 9.2. Entrada cuando existe borrador

La persona recibe tres decisiones:

| Acción               | Efecto                                 |
| -------------------- | -------------------------------------- |
| `CONTINUAR_BORRADOR` | abre la última versión autoritativa    |
| `DESCARTAR_BORRADOR` | exige confirmación y registra descarte |
| `VOLVER_AL_INICIO`   | no modifica el borrador                |

No se permite “nuevo” cuando produciría un segundo borrador ordinario compatible.

##### 9.3. Autosave

El autosave:

- persiste después de cambios materiales;
- utiliza `draft_version` esperada;
- no crea solicitud empresarial;
- no reserva stock;
- no cambia prioridad;
- no envía tareas a bodega;
- conserva un indicador honesto entre guardado, pendiente y fallido;
- no elimina contenido local hasta confirmar la versión persistida;
- en dispositivo compartido asocia cada cambio al actor efectivo.

##### 9.4. Cambio de contexto

Ante cambio de actor, sede, área, función, turno o dispositivo:

1. se detiene edición;
2. se conserva el borrador bajo su contexto original;
3. se limpia contenido sensible de la nueva sesión;
4. se vuelve a resolver autoridad;
5. solo el propietario autorizado puede reanudarlo;
6. no se traslada el borrador a otra sede o área mediante cambio de selector.

##### 9.5. Obsolescencia

Un borrador se marca `DRAFT_STALE` cuando cambia una dependencia material. La reconciliación muestra por línea:

- valor anterior;
- valor vigente;
- impacto;
- decisión requerida;
- posibilidad de conservar, reemplazar o retirar.

No se actualizan cantidades, unidades, rutas o productos sin conocimiento del actor.

---

#### 10. `NEXO-REMISSION-REQUEST-VALIDATION-CATALOG-001`

| ID            | Regla                                                     | Momento                  | Resultado cuando falla         |
| ------------- | --------------------------------------------------------- | ------------------------ | ------------------------------ |
| `REQ-VAL-001` | sesión y actor efectivo válidos                           | entrada y envío          | bloqueo cerrado                |
| `REQ-VAL-002` | función solicitante vigente                               | entrada y envío          | bloqueo cerrado                |
| `REQ-VAL-003` | permiso exacto vigente                                    | entrada y envío          | denegación sin bypass          |
| `REQ-VAL-004` | sede destino coincide con contexto autorizado             | entrada, edición y envío | invalidar contexto             |
| `REQ-VAL-005` | área solicitante válida y activa                          | entrada, línea y envío   | bloquear líneas y contexto     |
| `REQ-VAL-006` | sede admite solicitudes                                   | entrada y envío          | no iniciar                     |
| `REQ-VAL-007` | borrador pertenece al actor y contexto                    | reanudación              | denegar sin revelar contenido  |
| `REQ-VAL-008` | versión del borrador coincide                             | autosave y envío         | conflicto de concurrencia      |
| `REQ-VAL-009` | existe al menos una línea elegible                        | revisión y envío         | bloquear confirmación          |
| `REQ-VAL-010` | producto existe, está activo y habilitado                 | línea y envío            | bloquear línea                 |
| `REQ-VAL-011` | producto corresponde al área solicitante                  | línea y envío            | bloquear línea                 |
| `REQ-VAL-012` | política de solicitud existe y está activa                | línea y envío            | bloquear línea                 |
| `REQ-VAL-013` | cantidad es finita y mayor que cero                       | edición y envío          | error de campo                 |
| `REQ-VAL-014` | mínimo, paso y fracción cumplen política                  | edición y envío          | explicar corrección exacta     |
| `REQ-VAL-015` | UOM y presentación pertenecen al producto                 | línea y envío            | bloquear línea                 |
| `REQ-VAL-016` | conversión y cantidad base son reproducibles              | línea y envío            | conflicto de contrato          |
| `REQ-VAL-017` | la ruta de abastecimiento está activa y completa          | línea y envío            | línea bloqueada                |
| `REQ-VAL-018` | fuente resuelta coincide con la ruta vigente              | revisión y envío         | recalcular plan                |
| `REQ-VAL-019` | duplicados fueron consolidados o justificados             | revisión                 | impedir envío silencioso       |
| `REQ-VAL-020` | fecha requerida es válida para la sede                    | edición y envío          | error de campo                 |
| `REQ-VAL-021` | dependencias conservan sus versiones                      | revisión y envío         | volver a revisión              |
| `REQ-VAL-022` | firma de actor de dispositivo compartido es válida        | confirmación y envío     | bloquear comando               |
| `REQ-VAL-023` | `submission_intent_id` y fingerprint son coherentes       | envío y retry            | recuperar o devolver conflicto |
| `REQ-VAL-024` | no existe resultado previo incompatible para la intención | envío                    | impedir duplicado              |

Reconciliación:

```text
EXPECTED_REQUEST_VALIDATIONS = 24
MATERIALIZED_REQUEST_VALIDATIONS = 24
MISSING_REQUEST_VALIDATIONS = 0
DUPLICATE_REQUEST_VALIDATIONS = 0
```

La validación cliente mejora interacción. La validación server-side decide autoridad, integridad y persistencia.

---

#### 11. `NEXO-REMISSION-REQUEST-IDEMPOTENCY-CONTRACT-001`

##### 11.1. Identidad del comando

Antes de la confirmación se genera:

```text
submission_intent_id
```

El servidor calcula un fingerprint sobre el payload normalizado:

```text
actor y contexto
+ destino y área
+ iniciador
+ necesidad y fecha
+ grupos por fuente
+ líneas normalizadas
+ snapshots y versiones
+ firma cuando aplique
```

##### 11.2. Semántica

| Caso                                                      | Resultado                                             |
| --------------------------------------------------------- | ----------------------------------------------------- |
| misma intención y mismo fingerprint, sin resultado previo | ejecutar una vez                                      |
| misma intención y mismo fingerprint, con resultado previo | devolver el mismo receipt                             |
| misma intención y fingerprint distinto                    | conflicto; no escribir                                |
| intención nueva con payload equivalente                   | evaluar regla de duplicado empresarial antes de crear |
| timeout después de enviar                                 | buscar por intención antes de reintentar              |

##### 11.3. Duplicado empresarial

Antes de confirmar, el sistema busca solicitudes activas propias con coincidencia material de:

- sede y área solicitantes;
- fuente resuelta;
- productos y cantidades comparables;
- ventana temporal compatible;
- estado no terminal.

La coincidencia no se cancela automáticamente. Se presenta:

- solicitud existente;
- diferencias materiales;
- opción de abrirla;
- opción de continuar solo cuando una regla permita una necesidad adicional y el actor confirme el motivo.

##### 11.4. Atomicidad

La persistencia exitosa incluye en una sola unidad transaccional:

1. encabezado o encabezados de solicitud;
2. líneas;
3. snapshots de política y conversión;
4. resolución de fulfillment por línea;
5. vínculo de agrupación cuando existen varias fuentes;
6. evento de auditoría;
7. vínculo de firma de dispositivo compartido;
8. receipt recuperable por intención;
9. transición del borrador a `DRAFT_SUBMITTED`.

Un fallo en cualquiera de estos elementos no puede dejar una solicitud visible como creada parcialmente.

##### 11.5. Concurrencia

El comando exige:

- `expected_draft_version`;
- versiones de contexto y dependencias;
- bloqueo o control optimista de la intención;
- unicidad de `submission_intent_id`;
- rechazo cuando la revisión quedó obsoleta;
- resultado determinista ante dos clics, dos pestañas o retry de red.

---

#### 12. `NEXO-REMISSION-REQUEST-CONFIRMATION-RECEIPT-001`

##### 12.1. Revisión previa

La pantalla de revisión muestra, sin campos editables:

- actor y unidad solicitante;
- destino;
- fecha requerida y su carácter no comprometido;
- número de solicitudes que se crearán;
- fuente de cada grupo;
- productos, cantidades originales, unidades y cantidades base;
- líneas excluidas o bloqueadas;
- observaciones;
- advertencias de disponibilidad cuando estén autorizadas;
- consecuencia exacta;
- siguiente responsable funcional.

Volver a editar invalida la versión de revisión. Confirmar siempre consume la revisión vigente.

##### 12.2. Texto de consecuencia

La confirmación deberá comunicar:

```text
Se enviará la solicitud al equipo responsable de abastecimiento.
La disponibilidad y las cantidades preparadas se confirmarán después.
```

No deberá comunicar que:

- la mercancía está reservada;
- la solicitud fue aprobada;
- la remisión está lista;
- la fecha solicitada está garantizada;
- el inventario ya se movió.

##### 12.3. Receipt mínimo

```text
request_submission_receipt
- receipt_id
- submission_intent_id
- request_group_id cuando aplique
- request_ids[]
- human_codes[]
- business_status = requested
- created_at
- actor_id
- destination_site_id
- requesting_area_id
- source_groups[]
- accepted_line_count
- excluded_line_count
- warning_codes[]
- next_lane
- tracking_task_reference
- server_correlation_id
```

##### 12.4. Resultado desconocido

Si el cliente no recibe receipt:

1. muestra `REQUEST_RESULT_UNKNOWN`;
2. conserva la intención y la revisión;
3. consulta el resultado por `submission_intent_id`;
4. si existe, devuelve el receipt original;
5. si no existe y el servidor certifica ausencia, permite reintentar con la misma intención;
6. si no puede certificarlo, no crea otra intención ni muestra éxito.

##### 12.5. Retorno

Después del receipt se ofrecen solo:

- `VER_SOLICITUD`;
- `VOLVER_A_MI_TRABAJO`;
- `CREAR_OTRA_SOLICITUD`, únicamente después de cerrar el resultado anterior y crear una intención distinta.

El retorno conserva `task_key`, referencia de origen y contexto autorizado.

---

#### 13. `NEXO-REMISSION-REQUEST-HANDOFF-001`

##### 13.1. Salida consumible por preparación

Cada solicitud entrega:

```text
request_id
request_version
human_code
business_status = requested
requesting_context_snapshot
source_site_id
destination_site_id
need_by_date
line_snapshot[]
policy_snapshot[]
fulfillment_resolution[]
created_by_actor_id
created_at
submission_intent_id
```

##### 13.2. Inmutabilidad y cambios posteriores

Una vez confirmada:

- el borrador deja de ser editable;
- las líneas entregadas a preparación no cambian por editar el catálogo;
- una corrección autorizada crea una nueva versión o comando explícito;
- preparación consume `request_version` esperada;
- una edición concurrente o anulación invalida una acción de preparación obsoleta;
- los cambios no reescriben historia ni el receipt original.

##### 13.3. Frontera con `NEXO-UX-010`

La siguiente tarea recibe:

- solicitud en `requested`;
- grupos y fuente resueltos;
- líneas y cantidades solicitadas;
- rutas de fulfillment y bloqueos conocidos;
- snapshots de políticas;
- actor y contexto de origen;
- versión esperada.

`NEXO-UX-010` decidirá preparación, disponibilidad, picking, producción, faltantes, cantidades reales, empaque y despacho. Esta tarea no anticipa esas acciones.

---

#### 14. `NEXO-REMISSION-REQUEST-ROUTE-DISPOSITION-001`

| Ruta             | Patrón actual                          | Disposición                            | Uso en el flujo                                                                                    | Estado             |
| ---------------- | -------------------------------------- | -------------------------------------- | -------------------------------------------------------------------------------------------------- | ------------------ |
| `NEXO-ROUTE-001` | `/`                                    | entrada desde inicio solicitante       | resolver `NEXO-TASK-003` y abrir o reanudar                                                        | `ESPECIFICADO`     |
| `NEXO-ROUTE-031` | `/inventory/remissions`                | superficie primaria existente          | alojar entrada, edición, revisión, resultado y lista propia sin crear una URL nueva                | `ESPECIFICADO`     |
| `NEXO-ROUTE-032` | `/inventory/remissions/[id]`           | detalle y seguimiento                  | mostrar receipt, estado y siguiente responsable; revalidar recurso                                 | `ESPECIFICADO`     |
| `NEXO-ROUTE-033` | `/inventory/remissions/[id]/edit`      | compatibilidad de edición condicionada | solo para una solicitud empresarial todavía editable por regla explícita; no sustituye el borrador | `ESPECIFICADO`     |
| `NEXO-ROUTE-047` | `/inventory/settings/request-policies` | configuración excluida                 | el flujo consume su resultado, nunca permite editar políticas                                      | `FUERA_DE_ALCANCE` |
| `NEXO-ROUTE-050` | `/inventory/settings/supply-routes`    | configuración excluida                 | el flujo consume rutas vigentes y muestra bloqueos derivados                                       | `FUERA_DE_ALCANCE` |

Reconciliación:

```text
EXPECTED_RELATED_ROUTES = 6
MATERIALIZED_RELATED_ROUTES = 6
MISSING_RELATED_ROUTES = 0
DUPLICATE_RELATED_ROUTES = 0
NEW_ROUTE_IDENTITIES = 0
```

---

#### 15. Estados vacíos, bloqueo, conectividad y recuperación

| Situación                  | Mensaje funcional                               | Acción disponible                                               | Acción prohibida               |
| -------------------------- | ----------------------------------------------- | --------------------------------------------------------------- | ------------------------------ |
| sin productos habilitados  | la unidad no tiene productos solicitables       | volver e informar al responsable de configuración               | mostrar catálogo global        |
| sin ruta para una línea    | el producto no tiene abastecimiento configurado | retirar línea o volver                                          | elegir una sede arbitraria     |
| política inválida          | la cantidad o presentación ya no es válida      | corregir con la regla vigente                                   | convertir silenciosamente      |
| contexto revocado          | la jornada o autorización cambió                | volver al inicio seguro                                         | conservar formulario operable  |
| conflicto de borrador      | existe una versión más reciente                 | recargar y comparar                                             | sobrescribir sin advertencia   |
| offline antes de confirmar | no puede verificarse autoridad ni dependencias  | conservar borrador local controlado si el dispositivo lo admite | producir solicitud empresarial |
| conexión perdida al enviar | el resultado no está confirmado                 | reconciliar por intención                                       | crear una intención nueva      |
| error transaccional        | la solicitud no fue creada                      | volver al borrador con correlación                              | mostrar receipt parcial        |
| duplicado probable         | existe una solicitud materialmente similar      | abrir y comparar                                                | crear automáticamente otra     |
| receipt recuperado         | el servidor ya procesó la intención             | mostrar el mismo resultado                                      | repetir inserciones            |

La captura offline, si se implementa, permanece en borrador y exige revalidación completa al reconectar. No existe éxito empresarial offline por defecto.

---

#### 16. Autorización, seguridad y privacidad

1. el servidor revalida actor, contexto, permiso, recurso y estado al cargar, guardar, revisar y confirmar;
2. el solicitante ve únicamente productos, políticas, sedes, áreas y solicitudes dentro de su territorio;
3. los identificadores de sitio, área, producto, ruta y borrador enviados por cliente se tratan como no confiables;
4. la firma de dispositivo compartido identifica al actor humano y se vincula atómicamente al resultado;
5. un PIN no se almacena en borrador, receipt, log ni analytics;
6. el detalle de stock, LOC, lotes y disponibilidad se minimiza según permiso;
7. notas y motivos no admiten secretos, credenciales ni datos personales innecesarios;
8. el receipt no contiene tokens reutilizables ni rutas internas sensibles;
9. la telemetría distingue `request_draft_id`, `submission_intent_id`, `request_id` y `task_key`;
10. una denegación no revela solicitudes, productos o rutas fuera del alcance;
11. la UI nunca concede autoridad por mostrar un control;
12. una Server Action, API o RPC no confía en validaciones previas del navegador.

---

#### 17. Evidencia técnica actual y diagnóstico

| Fuente actual                                     | Evidencia verificable                                                                                                  | Estado frente al diseño    | Decisión                                                                                              |
| ------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- | -------------------------- | ----------------------------------------------------------------------------------------------------- |
| `src/app/inventory/remissions/page.tsx`           | concentra creación, lista y carriles de varios actores en una misma superficie                                         | `IMPLEMENTADO_PARCIAL`     | conservar ruta física y componer la tarea solicitante sin exponer preparación, conducción o recepción |
| `src/components/vento/remissions-create-form.tsx` | mantiene origen, fecha, notas y líneas en estado cliente; acepta filas iniciales y ejecuta una acción de envío         | `IMPLEMENTADO_PARCIAL`     | incorporar borrador autoritativo, autosave, revisión, confirmación y estados honestos                 |
| `src/app/inventory/remissions/actions.ts`         | revalida sesión, contexto, permiso, sede, área, productos, políticas, UOM y firma de dispositivo compartido            | `IMPLEMENTADO_PARCIAL`     | preservar controles y mover la persistencia a un comando transaccional e idempotente                  |
| persistencia actual                               | inserta encabezado, después líneas y luego fulfillments mediante operaciones separadas                                 | `BRECHA_CONFIRMADA`        | evitar solicitud parcial y producir un único receipt recuperable                                      |
| resultado actual                                  | redirige con mensaje genérico “Remisión creada” y no devuelve código, IDs, intención ni siguiente responsable          | `BRECHA_CONFIRMADA`        | devolver receipt estructurado y lenguaje de solicitud                                                 |
| selección de origen actual                        | el formulario recibe opciones y un origen por defecto                                                                  | `BRECHA_CONFIRMADA`        | resolver fuente por rutas vigentes y mostrar cualquier división antes de confirmar                    |
| modelo de estado actual                           | persiste `status = pending`; otras migraciones sincronizan estados legacy desde cantidades                             | `COMPATIBILIDAD_REQUERIDA` | mapear explícitamente `pending` a `requested` sin confundir etapas posteriores                        |
| idempotencia actual                               | no existe clave de intención ni recuperación por fingerprint en el comando inspeccionado                               | `BRECHA_CONFIRMADA`        | implementar unicidad, retry determinista y consulta de resultado                                      |
| borrador actual                                   | no existe evidencia de un borrador server-side reanudable para creación ordinaria                                      | `NO_IMPLEMENTADO`          | materializar contrato de borrador en el paquete E5 NEXO                                               |
| rutas de fulfillment                              | se resuelven después de crear encabezado y líneas; un fallo puede informar que la solicitud se creó sin generar tareas | `BRECHA_CRITICA`           | resolver y validar antes, y persistir todo en la misma transacción                                    |

No se modifica código en esta tarea. El diagnóstico fija el comportamiento esperado y los riesgos que la implementación deberá cerrar.

---

#### 18. Decisiones aprobadas

1. la experiencia se denomina solicitud de abastecimiento y no afirma que exista despacho;
2. el borrador, la interfaz y la solicitud empresarial tienen estados separados;
3. existen exactamente doce pasos y dieciséis estados de interfaz;
4. el flujo ordinario conserva un solo borrador editable por actor, sede, área y tarea;
5. destino y área se derivan del contexto autorizado;
6. la fuente se resuelve desde rutas activas y no se elige arbitrariamente;
7. varias fuentes producen una división visible y confirmada;
8. ninguna línea se omite silenciosamente;
9. cantidad original, unidad, política, factor y cantidad base quedan vinculados;
10. veinticuatro validaciones se aplican en los momentos definidos;
11. la revisión completa precede la confirmación;
12. la confirmación no promete stock, aprobación ni fecha;
13. el comando usa intención, fingerprint, versión esperada y atomicidad;
14. un timeout se reconcilia antes de reintentar;
15. el receipt es el único comprobante de éxito empresarial;
16. una solicitud confirmada queda en `requested` y se entrega versionada a preparación;
17. el solicitante no adquiere capacidades de aprobación, preparación, despacho, recepción o configuración;
18. no se crean rutas físicas nuevas en esta tarea.

---

#### 19. Requisitos de prueba derivados

| Requisito       | Cobertura                                                                     |
| --------------- | ----------------------------------------------------------------------------- |
| `TREQ-NEXO-091` | separación de borrador, interfaz y solicitud empresarial con doce pasos       |
| `TREQ-NEXO-092` | resolución de actor, destino, área, fuente y elegibilidad por contexto        |
| `TREQ-NEXO-093` | integridad de línea, política, UOM, conversión, área y duplicados             |
| `TREQ-NEXO-094` | borrador único, autosave, versión, reanudación, descarte y cambio de contexto |
| `TREQ-NEXO-095` | catálogo completo de veinticuatro validaciones y revalidación server-side     |
| `TREQ-NEXO-096` | revisión, consecuencia y confirmación explícita sin promesas falsas           |
| `TREQ-NEXO-097` | atomicidad, idempotencia, fingerprint, concurrencia y recuperación de timeout |
| `TREQ-NEXO-098` | receipt estructurado, resultado desconocido, retorno y seguimiento            |
| `TREQ-NEXO-099` | handoff inmutable y versionado a preparación con segregación de funciones     |
| `TREQ-NEXO-100` | compatibilidad y cierre de brechas del código, estado y persistencia actuales |

No se modifica ningún requisito histórico.

---

#### 20. Criterios de aceptación

- [ ] El flujo materializa exactamente doce pasos desde resolución de contexto hasta seguimiento.
- [ ] Existen exactamente dieciséis estados de interfaz y seis estados de borrador.
- [ ] Borrador, solicitud y remisión física no se presentan como equivalentes.
- [ ] El actor, destino y área se resuelven desde contexto y permiso vigentes.
- [ ] Existe como máximo un borrador ordinario compatible por actor y unidad.
- [ ] El autosave no produce efecto empresarial ni pérdida silenciosa de datos.
- [ ] Producto, política, unidad, presentación, cantidad original y conversión quedan vinculados.
- [ ] La fuente se deriva de rutas activas y cualquier división por fuentes es visible.
- [ ] Las veinticuatro validaciones tienen momento y respuesta definidos.
- [ ] La revisión muestra toda la consecuencia antes de confirmar.
- [ ] El servidor revalida autoridad, dependencias y versión al enviar.
- [ ] El envío completo es atómico e idempotente.
- [ ] Un doble clic, retry o dos pestañas no crean duplicados.
- [ ] Un timeout se reconcilia por `submission_intent_id`.
- [ ] El éxito exige receipt con códigos, IDs, estado y siguiente responsable.
- [ ] La solicitud producida queda en `requested` y no mueve inventario.
- [ ] El handoff a preparación conserva versión y snapshots inmutables.
- [ ] El solicitante no recibe acciones de preparación, despacho o recepción.
- [ ] Se crean exactamente `TREQ-NEXO-091` a `TREQ-NEXO-100`.
- [ ] No se crean rutas, migraciones ni cambios físicos durante esta tarea documental.

---

#### 21. `NEXO-REMISSION-REQUEST-IMPLEMENTATION-HANDOFF-001`

| Resultado                                                | Estado             | Responsable canónico                 | Condición de consumo                                                    |
| -------------------------------------------------------- | ------------------ | ------------------------------------ | ----------------------------------------------------------------------- |
| contrato funcional, estados, pasos, datos y líneas       | `ESPECIFICADO`     | `NEXO-UX-009`                        | toda implementación consume estas identidades y reglas                  |
| borrador persistente y versionado                        | `FUERA_DE_ALCANCE` | paquete E5 NEXO                      | implementar propiedad, RLS, limpieza y concurrencia desde `vento-shell` |
| comando transaccional e idempotente                      | `FUERA_DE_ALCANCE` | paquete E5 NEXO                      | migración y RPC versionados desde `vento-shell`, con rollback y pruebas |
| componentes de edición, revisión, confirmación y receipt | `FUERA_DE_ALCANCE` | paquete E5 NEXO                      | conservar task-first, accesibilidad y estados aprobados                 |
| compatibilidad con `restock_requests` y estados legacy   | `FUERA_DE_ALCANCE` | paquete E5 NEXO                      | traducción explícita y migración compatible                             |
| preparación y despacho                                   | `RESERVADO`        | `NEXO-UX-010`                        | consumir solicitudes `requested` y su versión                           |
| pruebas automatizadas                                    | `FUERA_DE_ALCANCE` | paquete E5 NEXO y `SHELL-CI-017`     | implementar `TREQ-NEXO-091` a `TREQ-NEXO-100`                           |
| validación operativa con solicitantes                    | `FUERA_DE_ALCANCE` | `UX-QA-020` a `UX-QA-030` y BLOQUE U | ejecutar con software y ambientes autorizados                           |

---

#### 22. Continuidad canónica

**ÚLTIMA TAREA APROBADA**

`NEXO-UX-008 — Organizar navegación por tareas y no por rutas técnicas`

**TAREA ACTUAL APROBADA**

`NEXO-UX-009 — Diseñar flujo completo de solicitud de remisión`

**SIGUIENTE TAREA RESERVADA**

`NEXO-UX-010 — Diseñar flujo completo de preparación y despacho`


### ✅ NEXO-UX-010 — Diseñar flujo completo de preparación

**Estado:** APROBADA
**Tarea anterior:** `NEXO-UX-009 — Diseñar flujo completo de solicitud de remisión` — APROBADA
**Tarea siguiente:** `NEXO-UX-011 — Diseñar flujo completo de despacho` — RESERVADA
**Tipo de tarea:** documental; diseño funcional completo de la preparación de abastecimiento interno, cola y reclamo de trabajo, ramas de stock y producción, picking, cantidades reales, parciales, faltantes, empaque, evidencia, confirmación idempotente, receipt y handoff a despacho
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/K_NEXO/04_EXPERIENCIA_DE_INVENTARIO_LOGISTICA_Y_ACTIVOS.md`
**Repositorio de aplicación inspeccionado:** `vento-nexo`
**Proceso propietario:** `VPROC-0028 — Abastecer inventario interno de sedes y áreas`
**Etapas propietarias:** `VPROC-0028-E03`, `VPROC-0028-E04` y `VPROC-0028-E05`
**Tarea de navegación consumida:** `NEXO-TASK-004 — PREPARAR_ABASTECIMIENTO`
**Colas consumidas:** `WHQ-PREPARACION` y `WHQ-BLOQUEO`
**Permiso exacto de mutación:** `nexo.inventory.remissions.prepare`
**Artefactos producidos:** `NEXO-REMISSION-PREPARATION-FLOW-CONTRACT-001`, `NEXO-REMISSION-PREPARATION-STATE-MACHINE-001`, `NEXO-REMISSION-PREPARATION-STEP-CATALOG-001`, `NEXO-REMISSION-PREPARATION-WORK-QUEUE-CONTRACT-001`, `NEXO-REMISSION-PREPARATION-TASK-LINE-CONTRACT-001`, `NEXO-REMISSION-PREPARATION-STOCK-BRANCH-001`, `NEXO-REMISSION-PREPARATION-PRODUCTION-BRANCH-001`, `NEXO-REMISSION-PREPARATION-PICK-PACK-CONTRACT-001`, `NEXO-REMISSION-PREPARATION-EXCEPTION-CONTRACT-001`, `NEXO-REMISSION-PREPARATION-IDEMPOTENCY-RECEIPT-001`, `NEXO-REMISSION-PREPARATION-TO-DISPATCH-HANDOFF-001`, `NEXO-REMISSION-PREPARATION-ROUTE-DISPOSITION-001` y `NEXO-REMISSION-PREPARATION-IMPLEMENTATION-HANDOFF-001`
**Decisiones consumidas:** `UX-BASE-001` a `UX-BASE-005`; `UX-STATION-010` a `UX-STATION-012`; `NEXO-DOM-001`; `NEXO-UX-001` a `NEXO-UX-009`; `NEXO-WAREHOUSE-HOME-CONTRACT-001`; `NEXO-WAREHOUSE-WORK-QUEUE-CATALOG-001`; `NEXO-WAREHOUSE-STAGE-PROJECTION-MATRIX-001`; `NEXO-TASK-NAVIGATION-CONTRACT-001`; `NEXO-NAVIGATION-TASK-CATALOG-001`; `NEXO-ROUTE-TO-TASK-REGISTRY-001`; `NEXO-REMISSION-REQUEST-HANDOFF-001`; contratos de autorización, contexto activo, productos, UOM, políticas de solicitud, rutas de fulfillment, LOC, posiciones, producción, firma de dispositivo compartido y requisitos `TREQ-*` vigentes
**Cambios físicos autorizados:** ninguno; no modifica código, tablas, RPC, migraciones, RLS, permisos, datos, navegación desplegada, configuración, inventario real ni ambientes remotos

---

#### 1. Propósito

Definir de extremo a extremo cómo una persona o área autorizada transforma una necesidad de abastecimiento en cantidades físicamente preparadas y verificables, sin confundir ese resultado con despacho, salida de inventario, custodia, tránsito o recepción.

La preparación deberá consumir una solicitud inmutable y versionada, resolver trabajo por sede y área responsable, ejecutar la rama correcta de abastecimiento, registrar cantidades reales y excepciones, y producir un handoff consumible por despacho.

La regla canónica es:

```text
SOLICITUD REQUESTED Y VERSIONADA
+ FULFILLMENT ASIGNADO AL ORIGEN Y AREA RESPONSABLE
+ ACTOR Y CONTEXTO AUTORIZADOS
+ RAMA DE STOCK O PRODUCCION RESUELTA
+ TRABAJO FISICO EJECUTADO
+ CANTIDADES, UBICACIONES, PRESENTACIONES Y EVIDENCIA RECONCILIADAS
+ PARCIALES Y EXCEPCIONES EXPLICITAS
+ CONFIRMACION ATOMICA E IDEMPOTENTE
+ RECEIPT VERIFICABLE
→ CANTIDAD READY O PARTIALLY_READY PARA DESPACHO
```

La regla de frontera es:

```text
PREPARADO ≠ DESPACHADO
READY_BASE_QTY ≠ SHIPPED_BASE_QTY
UBICADO PARA SALIDA ≠ DESCONTADO DE INVENTARIO
EMPAQUE PREPARADO ≠ CARGA SELLADA
ACTOR PREPARADOR ≠ CUSTODIO O CONDUCTOR
```

---

#### 2. Resultado material

Se aprueban trece artefactos documentales consumibles:

1. `NEXO-REMISSION-PREPARATION-FLOW-CONTRACT-001`, que fija frontera, autoridad, lenguaje y resultado empresarial;
2. `NEXO-REMISSION-PREPARATION-STATE-MACHINE-001`, que separa interfaz, reclamo, fulfillment, ejecución física y despacho;
3. `NEXO-REMISSION-PREPARATION-STEP-CATALOG-001`, que materializa catorce pasos y sus transiciones;
4. `NEXO-REMISSION-PREPARATION-WORK-QUEUE-CONTRACT-001`, que define elegibilidad, orden, reclamo, reanudación y concurrencia;
5. `NEXO-REMISSION-PREPARATION-TASK-LINE-CONTRACT-001`, que conserva identidad, versión, cantidades y snapshots por tarea y línea;
6. `NEXO-REMISSION-PREPARATION-STOCK-BRANCH-001`, que define selección de LOC, posición, presentación y picks físicos;
7. `NEXO-REMISSION-PREPARATION-PRODUCTION-BRANCH-001`, que define la frontera NEXO–FOGO y el consumo de producto terminado liberado;
8. `NEXO-REMISSION-PREPARATION-PICK-PACK-CONTRACT-001`, que define picks múltiples, unidades preparadas, empaque y evidencia;
9. `NEXO-REMISSION-PREPARATION-EXCEPTION-CONTRACT-001`, que trata faltantes, daños, bloqueos, sustituciones, sobrantes y cambios de ruta;
10. `NEXO-REMISSION-PREPARATION-IDEMPOTENCY-RECEIPT-001`, que impide resultados parciales, duplicados y reintentos ciegos;
11. `NEXO-REMISSION-PREPARATION-TO-DISPATCH-HANDOFF-001`, que entrega cantidades listas, no asignadas y versionadas a despacho;
12. `NEXO-REMISSION-PREPARATION-ROUTE-DISPOSITION-001`, que decide las rutas existentes relacionadas sin inventar URLs;
13. `NEXO-REMISSION-PREPARATION-IMPLEMENTATION-HANDOFF-001`, que separa el contrato aprobado de los cambios físicos posteriores.

| Elemento                                  | Total esperado | Total materializado | Faltantes | Duplicados |
| ----------------------------------------- | -------------: | ------------------: | --------: | ---------: |
| Pasos del flujo                           |             14 |                  14 |         0 |          0 |
| Estados de interfaz                       |             20 |                  20 |         0 |          0 |
| Estados de fulfillment reconciliados      |             10 |                  10 |         0 |          0 |
| Ramas operativas                          |              2 |                   2 |         0 |          0 |
| Validaciones materializadas               |             30 |                  30 |         0 |          0 |
| Disposiciones de rutas relacionadas       |              9 |                   9 |         0 |          0 |
| Requisitos de prueba nuevos o modificados |             10 |                  10 |         0 |          0 |

El resultado queda `ESPECIFICADO`. No declara el flujo `IMPLEMENTADO`, `VALIDADO` ni desplegado.

---

#### 3. Alcance

##### 3.1. Incluido

- entrada desde `NEXO-TASK-004`, el home del bodeguero y una referencia opaca de tarea;
- resolución de actor, sede origen, área preparadora, turno, dispositivo y permiso;
- cola por fulfillment, no por encabezado completo de solicitud;
- reclamo, reanudación, liberación y pérdida de reclamo;
- consumo del snapshot y versión aprobados en `NEXO-UX-009`;
- resolución automática de la rama `stock` o `production`;
- selección física de LOC, posición, presentación y cantidades cuando la rama sea stock;
- consumo de producción liberada y LOC de producto listo cuando la rama sea producción;
- picks múltiples por línea sin reescribir la intención solicitada;
- cantidades solicitadas, reservadas cuando exista contrato, preparadas, listas, asignadas y pendientes;
- preparación parcial, faltante, bloqueo, daño, calidad, sustitución propuesta y ruta obsoleta;
- empaque y agrupación física previa al despacho sin crear carga ni custodia;
- revisión, confirmación, idempotencia, concurrencia, receipt y recuperación de resultado desconocido;
- handoff inmutable a `NEXO-UX-011`;
- diagnóstico del código, esquema y migraciones actuales.

##### 3.2. Excluido

- crear o modificar la solicitud original;
- aprobar una necesidad comercial o productiva;
- cambiar producto, política, UOM, ruta o fuente sin una transición autorizada;
- ejecutar receta, consumo productivo, lote o liberación de calidad dentro de NEXO;
- descontar inventario por transferencia de salida durante preparación;
- crear envío, viaje, carga, sello, documento de despacho o asignación a conductor;
- transferir custodia o iniciar tránsito;
- recibir, aceptar, rechazar o ubicar en destino;
- conciliar diferencias posteriores al despacho;
- crear el modelo canónico de LPN, contenedores o etiquetas reservado a tareas posteriores;
- implementar componentes, tablas, RPC, migraciones, RLS, eventos o pruebas;
- ejecutar DDL, DML, backfills, despliegues o cambios remotos.

---

#### 4. `NEXO-REMISSION-PREPARATION-FLOW-CONTRACT-001`

##### 4.1. Nombre humano y efecto empresarial

La experiencia utilizará como términos principales:

```text
PREPARAR ABASTECIMIENTO
CANTIDAD LISTA
PREPARACION PARCIAL
FALTANTE O BLOQUEO
```

No utilizará “despachado”, “enviado” o “en tránsito” antes de que `NEXO-UX-011` confirme el hecho correspondiente.

El efecto exitoso ordinario es uno de estos dos:

```text
PREPARATION_CONFIRMED
fulfillment_status = ready
```

```text
PREPARATION_CONFIRMED
fulfillment_status = partially_ready
remaining_work = pending_or_blocked
```

Una preparación con cero cantidad lista solo puede terminar en `blocked`, `reassigned` o `cancelled` mediante causa y autoridad explícitas; nunca se presenta como éxito completo.

##### 4.2. Actor autorizado

El actor ordinario participa como preparador en `VPROC-0028`, pertenece al territorio de la sede origen y área responsable, y posee `nexo.inventory.remissions.prepare` en el contexto operativo vigente.

La elegibilidad exige conjuntamente:

- principal autenticado y actor efectivo identificable;
- función preparadora vigente;
- sede origen coincidente con el fulfillment;
- área activa coincidente con `preparing_area_kind`;
- turno o check-in cuando aplique;
- dispositivo permitido;
- permiso exacto;
- tarea vigente, asignable y no terminal;
- versión esperada de solicitud y fulfillment;
- ruta y dependencias todavía válidas.

El rol `bodeguero`, la visibilidad de una ruta, un identificador enviado por cliente o el acceso global de lectura no conceden por sí solos autoridad de preparación.

##### 4.3. Segregación de funciones

El preparador puede:

- consultar su cola autorizada;
- reclamar o continuar una tarea compatible;
- ejecutar picks o consumir una liberación productiva válida;
- registrar cantidad lista, parcial y bloqueo;
- documentar evidencia y dejar unidades preparadas;
- confirmar la preparación y producir receipt.

No puede por esta participación:

- alterar la intención solicitada;
- autorizar sustituciones materiales;
- ejecutar producción propietaria de FOGO;
- asignar una cantidad lista a un envío;
- descontar `transfer_out`;
- sellar carga;
- asumir custodia;
- iniciar tránsito;
- registrar recepción;
- cerrar diferencias.

##### 4.4. Iniciadores admitidos

| Iniciador                  | Entrada                                                    | Decisión                                                                |
| -------------------------- | ---------------------------------------------------------- | ----------------------------------------------------------------------- |
| `WAREHOUSE_QUEUE`          | fila elegible de `WHQ-PREPARACION`                         | abre el fulfillment exacto después de revalidarlo                       |
| `RESUME_CLAIMED_TASK`      | tarea reclamada por el mismo actor                         | reanuda la última versión autoritativa                                  |
| `OPAQUE_TASK_REFERENCE`    | referencia opaca desde seguimiento o supervisión           | resuelve recurso y permiso sin confiar en parámetros de contexto        |
| `SCANNER_CONTEXT`          | código de LOC, posición, producto o tarea dentro del flujo | completa contexto permitido; nunca muta por escanear                    |
| `SHARED_DEVICE_ENTRY`      | cola en estación compartida                                | exige actor efectivo y firma para confirmar                             |
| `PRODUCTION_RELEASE_EVENT` | producto terminado liberado para una tarea                 | actualiza disponibilidad de la rama producción; no confirma por sí solo |

---

#### 5. `NEXO-REMISSION-PREPARATION-STATE-MACHINE-001`

##### 5.1. Máquinas de estado separadas

```text
ESTADO DE INTERFAZ
≠ ESTADO DE RECLAMO
≠ ESTADO DE FULFILLMENT
≠ ESTADO DE PICK O PRODUCCION
≠ ESTADO DE ENVIO
```

La interfaz describe la experiencia actual. El reclamo describe quién puede continuar. El fulfillment describe cumplimiento de una necesidad. Los picks y liberaciones prueban cantidades físicas. El envío pertenece a `NEXO-UX-011`.

##### 5.2. Estados de fulfillment reconciliados

| Estado            | Significado canónico                                                         | Puede establecerlo preparación                       | Tratamiento                                               |
| ----------------- | ---------------------------------------------------------------------------- | ---------------------------------------------------- | --------------------------------------------------------- |
| `pending`         | tarea creada y todavía no iniciada                                           | sí, como estado de entrada                           | aparece en cola elegible                                  |
| `reserved`        | existe una reserva explícita y vigente                                       | solo si la implementación posee un ledger de reserva | no equivale a pick ni cantidad lista                      |
| `preparing`       | ejecución física iniciada                                                    | sí                                                   | conserva actor, versión y tiempo de inicio                |
| `partially_ready` | existe cantidad lista menor que la solicitada                                | sí                                                   | el remanente sigue pendiente o bloqueado                  |
| `ready`           | toda la cantidad todavía exigible está lista                                 | sí                                                   | queda disponible para asignación de despacho              |
| `blocked`         | existe impedimento estructurado                                              | sí                                                   | requiere causa, cantidad afectada y siguiente responsable |
| `reassigned`      | otra tarea o fuente reemplaza el cumplimiento                                | solo por transición autorizada                       | conserva vínculo y motivo                                 |
| `cancelled`       | la obligación de preparar fue cancelada por autoridad válida                 | no como acción ordinaria                             | terminal y auditable                                      |
| `allocated`       | cantidad lista fue asignada a una carga                                      | no                                                   | estado de despacho, solo lectura aquí                     |
| `released`        | cantidad salió del carril de preparación por despacho o liberación posterior | no                                                   | estado posterior, solo lectura aquí                       |

Reglas:

- preparación nunca cambia directamente a `allocated` o `released`;
- `ready` no cambia `restock_requests` a `in_transit`;
- `partially_ready` no cierra el remanente;
- `blocked` no borra cantidad ya lista;
- `reserved` no se inferirá desde `prepared_quantity` ni desde una nota;
- un estado legacy deberá mapearse explícitamente, no reinterpretarse por etiqueta.

##### 5.3. Estados de interfaz

| Estado                    | Condición                                       | Comportamiento obligatorio                                                  |
| ------------------------- | ----------------------------------------------- | --------------------------------------------------------------------------- |
| `PREP_CONTEXT_RESOLVING`  | resolución de actor y contexto                  | no muestra controles operables                                              |
| `PREP_CONTEXT_BLOCKED`    | falta sede, área, turno, dispositivo o permiso  | explica la condición sin bypass                                             |
| `PREP_QUEUE_LOADING`      | se consulta trabajo autoritativo                | no muestra conteos como definitivos                                         |
| `PREP_QUEUE_EMPTY`        | no existe trabajo elegible                      | muestra ausencia honesta y retorno                                          |
| `PREP_QUEUE_READY`        | existen tareas elegibles                        | ordena y presenta la siguiente acción                                       |
| `PREP_TASK_CLAIMING`      | se intenta reclamar                             | bloquea doble envío y espera resultado                                      |
| `PREP_TASK_ACTIVE`        | reclamo y versiones vigentes                    | permite ejecutar la tarea                                                   |
| `PREP_STOCK_PLANNING`     | rama stock requiere plan físico                 | guía LOC, posición, UOM y cantidad                                          |
| `PREP_PRODUCTION_WAITING` | rama producción espera resultado liberado       | muestra dependencia y responsable                                           |
| `PREP_EXECUTING`          | trabajo físico en curso                         | conserva progreso sin afirmar resultado                                     |
| `PREP_PARTIAL`            | existe cantidad lista y remanente               | diferencia listo, pendiente y bloqueado                                     |
| `PREP_BLOCKED`            | no puede continuar una parte o toda la tarea    | muestra causa y handoff de resolución                                       |
| `PREP_REVIEW`             | plan ejecutado listo para confirmar             | congela fingerprint y consecuencias                                         |
| `PREP_SUBMITTING`         | comando de confirmación en curso                | impide nueva intención                                                      |
| `PREP_RESULT_UNKNOWN`     | se perdió el resultado del comando              | reconcilia por intención                                                    |
| `PREP_CONFIRMED`          | receipt autoritativo recuperado                 | muestra cantidades y siguiente carril                                       |
| `PREP_CONFLICTED`         | cambió tarea, stock, ruta, versión o reclamo    | impide sobrescritura y exige recarga                                        |
| `PREP_CONTEXT_REVOKED`    | autorización o actor cambió                     | cierra controles y vuelve a un punto seguro                                 |
| `PREP_OFFLINE_LIMITED`    | no pueden revalidarse autoridad o stock         | permite solo consulta o captura local no empresarial cuando exista política |
| `PREP_FATAL_ERROR`        | no es posible recuperar contexto o consistencia | no muestra éxito ni permite mutación                                        |

##### 5.4. Reclamo de trabajo

El reclamo es una entidad separada del fulfillment y deberá conservar:

```text
claim_id
fulfillment_id
actor_id
site_id
area_id
claimed_at
expires_at
claim_version
status
released_at
release_reason
```

Un fulfillment admite como máximo un reclamo operativo activo por vez. Una sesión expirada, un cambio de actor, una revocación o una liberación explícita termina el reclamo sin alterar cantidades listas ya confirmadas.

---

#### 6. `NEXO-REMISSION-PREPARATION-WORK-QUEUE-CONTRACT-001`

##### 6.1. Unidad de trabajo

La fila de cola es un `fulfillment_id`, no el encabezado completo de una solicitud. Una solicitud con líneas para varias áreas, fuentes o modos produce tareas separadas y cada una conserva su propia autoridad y estado.

Identidad mínima de fila:

```text
fulfillment_id
request_id
request_version
request_line_id
fulfillment_version
source_site_id
preparing_area_kind
supply_mode
product_id
requested_base_qty
ready_base_qty
allocated_base_qty
remaining_base_qty
status
need_by_at
priority_class
blocking_code
```

##### 6.2. Elegibilidad

Una fila aparece cuando:

- pertenece a la sede origen activa;
- su `preparing_area_kind` coincide con el área autorizada, salvo supervisión global expresamente permitida;
- su estado es `pending`, `reserved`, `preparing`, `partially_ready`, `ready` o `blocked` según la vista;
- el actor posee permiso y territorio;
- la solicitud y la tarea no están canceladas, sustituidas ni obsoletas;
- la ruta snapshot es consumible o el bloqueo debe ser visible al responsable autorizado.

Una vista “todas las sedes” es de supervisión o configuración y no concede mutación hasta resolver una sede y área operativas exactas.

##### 6.3. Orden de trabajo

Orden canónico:

1. tarea reclamada por el actor que necesita reanudación;
2. bloqueo crítico con acción atribuida al área actual;
3. fecha requerida vencida;
4. fecha requerida más próxima;
5. prioridad empresarial autorizada;
6. tareas parcialmente listas con remanente;
7. antigüedad de creación;
8. clave estable `fulfillment_id`.

El navegador no puede elevar prioridad mediante parámetros, orden local o nombre del rol.

##### 6.4. Reclamo y concurrencia

Antes de reclamar o mutar se comprueba:

```text
ACTOR_ACTUAL
+ TAREA_TODAVIA_ELEGIBLE
+ CLAIM_VERSION_ESPERADA
+ REQUEST_VERSION_ESPERADA
+ FULFILLMENT_VERSION_ESPERADA
+ ESTADO_COMPATIBLE
+ TERRITORIO_Y_AREA_COMPATIBLES
+ COMANDO_IDEMPOTENTE
```

Si otra persona reclama, modifica, bloquea, asigna a despacho o cancela la tarea, la interfaz cambia a `PREP_CONFLICTED` y no conserva controles obsoletos.

##### 6.5. Vistas permitidas

| Vista                  | Contenido                                 | Autoridad                                 |
| ---------------------- | ----------------------------------------- | ----------------------------------------- |
| `MI_TAREA_ACTIVA`      | reclamo vigente del actor                 | mutación según etapa                      |
| `PENDIENTES`           | tareas elegibles sin reclamo incompatible | reclamar                                  |
| `PARCIALMENTE_LISTAS`  | cantidad lista con remanente              | continuar o revisar bloqueo               |
| `ESPERANDO_PRODUCCION` | dependencia productiva no liberada        | consulta y handoff, no inventar salida    |
| `BLOQUEADAS`           | causas estructuradas del área             | resolver únicamente acciones atribuidas   |
| `LISTAS_PARA_DESPACHO` | cantidades ready no totalmente allocated  | consulta; asignación pertenece a despacho |

---

#### 7. `NEXO-REMISSION-PREPARATION-TASK-LINE-CONTRACT-001`

##### 7.1. Handoff de entrada

La tarea consume de `NEXO-UX-009`:

```text
request_id
request_version
request_line_id
human_code
business_status = requested
source_site_id
destination_site_id
requesting_area_kind
preparing_area_kind
route_id
route_version_or_snapshot
supply_mode
production_execution_mode
source_location_id
ready_location_id
product_snapshot
request_policy_snapshot
requested_input_qty
requested_input_unit_code
requested_base_qty
stock_unit_code
need_by_at
created_by_actor_id
```

##### 7.2. Snapshot y mutabilidad

Preparación no edita:

- producto solicitado;
- política utilizada;
- cantidad original;
- conversión aprobada;
- sede solicitante;
- área solicitante;
- fuente resuelta;
- receipt de solicitud.

Las correcciones crean una nueva versión, una reasignación o una transición compensatoria vinculada. Nunca se cambia silenciosamente el snapshot consumido.

##### 7.3. Campos de ejecución

Cada fulfillment deberá poder representar:

```text
fulfillment_id
fulfillment_version
claim_id
status
reserved_base_qty
ready_base_qty
allocated_base_qty
cancelled_base_qty
remaining_base_qty
started_at
started_by_actor_id
available_at
blocking_code
blocking_detail
exception_refs[]
preparation_receipt_refs[]
```

Cada pick de stock deberá representar:

```text
pick_id
fulfillment_id
request_line_id
product_id
source_location_id
source_position_id
uom_profile_id
presentation_qty
base_qty
lot_or_batch_ref_when_required
condition_code
scan_evidence_ref
prepared_unit_ref
```

Cada aporte de producción deberá representar:

```text
production_supply_ref
fulfillment_id
production_order_or_task_ref
batch_ref
release_event_ref
product_id
released_base_qty
ready_location_id
released_at
quality_status
```

##### 7.4. Versiones esperadas

Todo comando material incluye como mínimo:

- `request_version`;
- `fulfillment_version`;
- `claim_version` cuando existe reclamo;
- `stock_snapshot_version` o evidencia equivalente para picks;
- `route_snapshot_fingerprint`;
- `preparation_intent_id`;
- `payload_fingerprint`.

Un cambio en cualquiera de estas autoridades invalida la revisión anterior.

---

#### 8. `NEXO-REMISSION-PREPARATION-STEP-CATALOG-001`

| Paso | Identificador                        | Entrada                         | Acción principal                                                | Salida                          | Recuperación                            |
| ---: | ------------------------------------ | ------------------------------- | --------------------------------------------------------------- | ------------------------------- | --------------------------------------- |
|    1 | `PREP-STEP-01-RESOLVE-CONTEXT`       | entrada a `NEXO-TASK-004`       | resolver actor, sede, área, turno, dispositivo y permiso        | contexto autorizado o bloqueo   | volver al inicio seguro                 |
|    2 | `PREP-STEP-02-LOAD-QUEUE`            | contexto autorizado             | cargar fulfillments elegibles                                   | cola, vacío o datos parciales   | reintentar sin inventar trabajo         |
|    3 | `PREP-STEP-03-CLAIM-OR-RESUME`       | fulfillment elegido             | reclamar o reanudar con versión esperada                        | reclamo activo                  | informar conflicto y recargar           |
|    4 | `PREP-STEP-04-REVALIDATE-HANDOFF`    | reclamo activo                  | validar solicitud, línea, fulfillment, ruta y snapshots         | tarea vigente o bloqueo         | liberar reclamo si no es consumible     |
|    5 | `PREP-STEP-05-RESOLVE-BRANCH`        | handoff válido                  | derivar `stock` o `production` desde snapshot                   | rama exacta                     | no permitir selección manual de modo    |
|    6 | `PREP-STEP-06-BUILD-EXECUTION-PLAN`  | rama resuelta                   | construir picks o dependencia productiva                        | plan de ejecución               | conservar borrador operativo versionado |
|    7 | `PREP-STEP-07-VALIDATE-DEPENDENCIES` | plan preliminar                 | comprobar LOC, posición, UOM, stock o liberación productiva     | plan ejecutable o bloqueo       | mostrar responsable y causa             |
|    8 | `PREP-STEP-08-EXECUTE-PHYSICAL-WORK` | plan ejecutable                 | recoger, medir, contar o tomar terminado liberado               | evidencia física en curso       | pausar sin declarar listo               |
|    9 | `PREP-STEP-09-CAPTURE-ACTUALS`       | trabajo físico                  | registrar picks, liberaciones y cantidades reales               | cantidades reconciliadas        | detectar cambios y recargar             |
|   10 | `PREP-STEP-10-PACK-AND-STAGE`        | cantidad físicamente disponible | agrupar, empacar y dejar en zona lista                          | unidades preparadas             | separar daño o condición no apta        |
|   11 | `PREP-STEP-11-RESOLVE-REMAINDER`     | solicitado frente a listo       | registrar parcial, faltante, bloqueo o propuesta de sustitución | remanente explícito             | escalar sin cerrar silenciosamente      |
|   12 | `PREP-STEP-12-REVIEW`                | plan ejecutado                  | revisar cantidades, ubicaciones, evidencia y consecuencia       | fingerprint de revisión         | cualquier edición invalida revisión     |
|   13 | `PREP-STEP-13-CONFIRM`               | revisión vigente                | ejecutar comando atómico e idempotente                          | receipt o resultado desconocido | reconciliar por intención               |
|   14 | `PREP-STEP-14-HANDOFF`               | receipt confirmado              | publicar cantidad lista para despacho y retornar a trabajo      | handoff versionado              | conservar remanente y bloqueos          |

Reconciliación:

```text
EXPECTED_PREPARATION_STEPS = 14
MATERIALIZED_PREPARATION_STEPS = 14
MISSING_PREPARATION_STEPS = 0
DUPLICATE_PREPARATION_STEPS = 0
```

---

#### 9. `NEXO-REMISSION-PREPARATION-STOCK-BRANCH-001`

##### 9.1. Entrada

La rama se activa exclusivamente cuando el snapshot declara:

```text
supply_mode = stock
```

El actor no puede cambiarla a producción para evitar un faltante ni elegir otra sede de origen.

##### 9.2. Plan físico

El plan permite múltiples picks para una misma línea:

```text
UNA LINEA SOLICITADA
→ UNO O MAS LOC
→ CERO O UNA POSICION POR PICK
→ CERO O UNA PRESENTACION FISICA POR PICK
→ CANTIDAD BASE POR PICK
```

No se parte ni reescribe la línea original para representar múltiples ubicaciones. Los picks se agregan bajo el mismo `request_line_id` y `fulfillment_id`.

##### 9.3. LOC y posición

Cada pick exige:

- LOC activo de la sede origen;
- LOC permitido por la ruta snapshot o transición autorizada;
- posición activa perteneciente al LOC cuando se especifique;
- producto habilitado y stock compatible;
- condición física apta;
- cantidad no negativa y superior a cero;
- trazabilidad de actor y momento.

Una recomendación de LOC no es autoridad final. El servidor revalida existencia, pertenencia y saldo al confirmar.

##### 9.4. Presentaciones y unidades

Cuando existe presentación física:

- `uom_profile_id` pertenece al producto y está activo;
- `presentation_qty > 0`;
- `base_qty` coincide con el factor vigente o snapshot autorizado;
- la suma de picks se reconcilia en unidad base;
- peso variable, conteo más peso y granel conservan sus mediciones reales;
- una presentación agotada no permite inventar otra conversión.

##### 9.5. Stock y reservas

La preparación consulta stock por sede, LOC y posición. No descuenta `current_qty` ni publica `transfer_out`.

Si se implementa reserva, deberá existir como ledger explícito, versionado y reversible. No se inferirá una reserva desde:

- `prepared_quantity`;
- un estado visual;
- una nota;
- un pick sin confirmación;
- una disminución anticipada del saldo real.

##### 9.6. Cambios durante la ejecución

Si el stock cambia entre plan y confirmación:

- se rechaza el comando obsoleto;
- no se borran picks confirmados anteriores;
- se presenta `PREP_CONFLICTED`;
- el actor recarga y reconcilia;
- no se reduce silenciosamente la cantidad para lograr éxito.

---

#### 10. `NEXO-REMISSION-PREPARATION-PRODUCTION-BRANCH-001`

##### 10.1. Entrada

La rama se activa exclusivamente cuando:

```text
supply_mode = production
production_execution_mode in (simple, recipe)
ready_location_id is not null
```

Una ruta incompleta produce `blocked`, no un formulario libre de cantidad lista.

##### 10.2. Propiedad funcional

FOGO conserva la autoridad sobre:

- orden o tarea de producción;
- receta y versión;
- lote;
- consumos;
- rendimiento;
- controles de calidad;
- liberación del terminado;
- empaque productivo cuando aplique.

NEXO conserva:

- la necesidad de abastecimiento;
- el fulfillment vinculado;
- la cantidad liberada consumible;
- el LOC donde queda listo el terminado;
- el handoff físico a despacho.

Por tanto:

```text
NEXO NO FABRICA UN LOTE
NEXO NO DECLARA CALIDAD APROBADA
NEXO NO CONSUME RECETA
NEXO CONSUME UN RESULTADO PRODUCTIVO LIBERADO Y CORRELACIONADO
```

##### 10.3. Producción simple

`production_execution_mode = simple` no autoriza escribir una cantidad arbitraria. Requiere un hecho de producción identificado, actor autorizado, producto, cantidad, momento, LOC listo y evidencia mínima. La implementación podrá usar un flujo simplificado de FOGO, pero la autoridad del hecho sigue siendo productiva.

##### 10.4. Producción por receta

`production_execution_mode = recipe` exige:

- orden o tarea FOGO vinculada;
- receta y versión;
- lote o batch;
- cantidad terminada;
- control y liberación aplicables;
- evento idempotente de liberación;
- `ready_location_id` coincidente;
- saldo liberado no consumido por otro fulfillment.

##### 10.5. Cantidad lista

La cantidad ready de producción no puede superar:

- la cantidad solicitada todavía exigible;
- la cantidad liberada y no asignada;
- la cantidad físicamente presente en el LOC listo cuando exista inventario real por ubicación.

Una orden iniciada, una estimación de rendimiento o un lote no liberado no cuentan como cantidad lista.

##### 10.6. Fallos y replanificación

Si producción no puede completar:

- conserva cualquier cantidad liberada válida;
- registra remanente y causa;
- crea o vincula excepción;
- identifica responsable y condición de salida;
- no cambia automáticamente a stock;
- una reasignación crea una transición versionada y conserva el vínculo histórico.

---

#### 11. Cantidades e invariantes

##### 11.1. Variables

| Campo                          | Significado                                          | Propietario        |
| ------------------------------ | ---------------------------------------------------- | ------------------ |
| `requested_base_qty`           | cantidad confirmada por solicitud                    | solicitud          |
| `reserved_base_qty`            | cantidad reservada mediante ledger explícito         | reserva, si existe |
| `picked_base_qty`              | suma de picks físicos confirmados                    | preparación stock  |
| `released_production_base_qty` | cantidad productiva liberada y vinculada             | FOGO / integración |
| `ready_base_qty`               | cantidad apta, empacada o dispuesta para despacho    | preparación        |
| `allocated_base_qty`           | parte de ready asignada a una carga                  | despacho           |
| `dispatched_base_qty`          | cantidad cuya salida fue confirmada                  | despacho           |
| `cancelled_base_qty`           | cantidad cuya obligación fue cancelada con autoridad | control autorizado |
| `blocked_base_qty`             | cantidad temporalmente impedida                      | excepción          |
| `remaining_base_qty`           | cantidad todavía exigible y no lista                 | derivada           |

##### 11.2. Invariantes

```text
0 <= allocated_base_qty <= ready_base_qty
0 <= ready_base_qty
0 <= cancelled_base_qty
ready_base_qty + cancelled_base_qty <= requested_base_qty
remaining_base_qty = requested_base_qty - ready_base_qty - cancelled_base_qty
```

Para stock:

```text
ready_base_qty <= SUM(confirmed_pick.base_qty)
```

Para producción:

```text
ready_base_qty <= SUM(unconsumed_released_production.base_qty)
```

Para cualquier rama:

- una cantidad bloqueada puede solaparse conceptualmente con el remanente, pero no se suma como cumplida;
- una cantidad allocated continúa siendo ready hasta que despacho confirme la salida;
- una cantidad despachada no se escribe durante preparación;
- un sobrante físico no amplía la solicitud;
- las comparaciones usan precisión y redondeo canónicos por unidad.

##### 11.3. Preparación parcial

Una tarea puede confirmar `partially_ready` cuando:

- `ready_base_qty > 0`;
- `ready_base_qty < requested_base_qty - cancelled_base_qty`;
- el remanente tiene estado, causa y siguiente acción;
- no se presenta como preparación completa;
- la cantidad lista queda disponible para despacho sin borrar el remanente.

##### 11.4. Líneas múltiples

Cada fulfillment se confirma de forma independiente. Una solicitud puede contener simultáneamente líneas `ready`, `partially_ready`, `preparing` y `blocked`. El encabezado no se reduce a un único estado que oculte esta distribución.

---

#### 12. `NEXO-REMISSION-PREPARATION-PICK-PACK-CONTRACT-001`

##### 12.1. Picks

Cada pick es un hecho físico trazable. No se sustituye por una cantidad agregada sin origen.

Reglas:

1. un pick pertenece a un único fulfillment y producto;
2. puede usar LOC y posición exactos;
3. puede usar una presentación física compatible;
4. conserva cantidad de presentación y cantidad base;
5. puede registrar lote o batch cuando el producto lo requiera;
6. puede corregirse antes de confirmar la revisión;
7. después de confirmar, una corrección crea reversa o nueva versión, no edición silenciosa;
8. la suma de picks no supera la cantidad exigible;
9. dos picks no consumen la misma unidad física identificada;
10. el escaneo aporta evidencia, no autoridad por sí solo.

##### 12.2. Unidades preparadas

La preparación puede agrupar picks en una o más unidades físicas de preparación con referencia opaca:

```text
prepared_unit_ref
fulfillment_refs[]
product_and_qty_summary[]
package_kind
seal_required = false_or_reserved_for_dispatch
staging_location_id
condition
weight_or_count_when_required
evidence_refs[]
```

`prepared_unit_ref` no se declara LPN canónico por esta tarea. Si existe un LPN autorizado, podrá vincularse; el modelo definitivo de contenedores y etiquetas permanece en sus tareas propietarias.

##### 12.3. Empaque

El empaque de preparación:

- protege y agrupa la cantidad lista;
- conserva compatibilidad de producto, condición y destino;
- no crea envío;
- no asigna conductor;
- no sella una carga logística;
- no cambia custodia;
- no descuenta inventario;
- puede exigir peso, conteo, temperatura o foto según política publicada.

##### 12.4. Zona de listo

La unidad queda en un LOC de staging o `ready_location_id` autorizado. Una zona de listo no equivale a vehículo, muelle de salida, carga o tránsito.

##### 12.5. Evidencia mínima

La evidencia se determina por riesgo y producto. Puede incluir:

- escaneo de tarea, producto, LOC o posición;
- medición de cantidad;
- presentación o empaque;
- lote o batch;
- condición;
- foto cuando la política lo exija;
- actor y dispositivo;
- fecha y correlación.

No se capturan secretos, PIN, credenciales ni datos personales innecesarios.

---

#### 13. `NEXO-REMISSION-PREPARATION-EXCEPTION-CONTRACT-001`

| Código                           | Situación                                        | Tratamiento                                             | Acción prohibida                   |
| -------------------------------- | ------------------------------------------------ | ------------------------------------------------------- | ---------------------------------- |
| `PREP-EXC-STOCK_SHORTAGE`        | stock insuficiente en sede, LOC o posición       | conservar cantidad lista, registrar afectada y causa    | reducir solicitado silenciosamente |
| `PREP-EXC-LOC_INVALID`           | LOC inactivo, ajeno o no permitido               | bloquear picks afectados y escalar ruta o configuración | escoger otro LOC sin autoridad     |
| `PREP-EXC-POSITION_INVALID`      | posición inexistente o incompatible              | recargar estructura y corregir plan                     | ignorar la posición enviada        |
| `PREP-EXC-UOM_UNAVAILABLE`       | presentación agotada o incompatible              | proponer alternativa autorizable                        | convertir con factor improvisado   |
| `PREP-EXC-DAMAGE`                | producto dañado durante preparación              | separar, registrar cantidad y evidencia                 | incluirlo como ready               |
| `PREP-EXC-QUALITY_HOLD`          | condición o calidad no liberada                  | aislar y esperar decisión propietaria                   | declarar aptitud desde NEXO        |
| `PREP-EXC-PRODUCTION_DELAY`      | producción no liberó a tiempo                    | conservar dependencia y responsable                     | registrar estimación como lista    |
| `PREP-EXC-SUBSTITUTION_PROPOSED` | se propone otro producto o presentación material | crear propuesta vinculada para decisión                 | sustituir silenciosamente          |
| `PREP-EXC-ROUTE_STALE`           | cambió o fue retirada la ruta                    | mantener snapshot y solicitar transición                | mutar la fuente original           |
| `PREP-EXC-REQUEST_CHANGED`       | nueva versión invalida la tarea                  | detener y reconciliar                                   | continuar contra versión obsoleta  |
| `PREP-EXC-CLAIM_LOST`            | otro actor o sesión posee reclamo válido         | cerrar controles y recargar                             | sobrescribir trabajo concurrente   |
| `PREP-EXC-OVERAGE`               | existe cantidad física superior                  | dejar excedente en inventario y registrar observación   | ampliar ready sobre solicitado     |

##### 13.1. Faltante

Un faltante requiere:

```text
exception_id
fulfillment_id
affected_base_qty
reason_code
description
observed_at
observed_by_actor_id
evidence_refs[]
responsible_lane
resolution_condition
status
```

Una nota libre como `FALTANTE ORIGEN` no es el contrato final y no puede ser la única fuente de estado.

##### 13.2. Sustitución

La preparación solo propone. Una sustitución aprobada deberá:

- identificar quién autorizó;
- conservar producto y cantidad originales;
- crear línea o fulfillment de reemplazo vinculado;
- conservar equivalencia de unidad y política;
- invalidar revisiones anteriores;
- no modificar historia ni receipt de solicitud.

##### 13.3. Reasignación

Una reasignación de fuente, área o modo crea una nueva versión o fulfillment. El fulfillment anterior pasa a `reassigned`, conserva cantidad ya lista o la transfiere mediante comando explícito, y registra el sucesor.

---

#### 14. Catálogo de validaciones

| ID             | Momento            | Regla                                                                                    | Respuesta segura                               |
| -------------- | ------------------ | ---------------------------------------------------------------------------------------- | ---------------------------------------------- |
| `PREP-VAL-001` | entrada            | principal y actor efectivo válidos                                                       | bloquear sin revelar trabajo                   |
| `PREP-VAL-002` | entrada            | contexto operativo vigente                                                               | volver a inicio seguro                         |
| `PREP-VAL-003` | entrada y mutación | permiso exacto de preparación                                                            | denegar server-side                            |
| `PREP-VAL-004` | carga              | sede origen coincide con contexto                                                        | no cargar la tarea                             |
| `PREP-VAL-005` | carga              | área preparadora coincide con alcance                                                    | excluir o mostrar solo a supervisor autorizado |
| `PREP-VAL-006` | carga              | solicitud, línea y fulfillment existen                                                   | error no recuperable o recarga                 |
| `PREP-VAL-007` | reclamo            | versiones esperadas coinciden                                                            | conflicto, no sobrescribir                     |
| `PREP-VAL-008` | reclamo            | estado admite preparación                                                                | retirar control obsoleto                       |
| `PREP-VAL-009` | reclamo            | no existe reclamo incompatible                                                           | informar propietario o expiración              |
| `PREP-VAL-010` | apertura           | snapshot de ruta es íntegro                                                              | bloquear con causa estructurada                |
| `PREP-VAL-011` | apertura           | `supply_mode` pertenece a la rama permitida                                              | no permitir cambio manual                      |
| `PREP-VAL-012` | plan               | producto coincide con solicitud y fulfillment                                            | rechazar payload                               |
| `PREP-VAL-013` | plan               | cantidad solicitada e invariantes son válidas                                            | bloquear inconsistencia                        |
| `PREP-VAL-014` | stock              | LOC activo, del origen y permitido                                                       | rechazar pick                                  |
| `PREP-VAL-015` | stock              | posición activa y perteneciente al LOC                                                   | rechazar pick                                  |
| `PREP-VAL-016` | stock              | UOM profile activo y del producto                                                        | rechazar presentación                          |
| `PREP-VAL-017` | stock              | conversión presentación-base coincide                                                    | rechazar factor divergente                     |
| `PREP-VAL-018` | stock              | stock por sede, LOC y posición cubre picks                                               | conflicto y recarga                            |
| `PREP-VAL-019` | stock              | picks no duplican unidad física identificada                                             | rechazar duplicado                             |
| `PREP-VAL-020` | agregado           | suma de picks o liberaciones no supera exigible                                          | rechazar exceso                                |
| `PREP-VAL-021` | producción         | orden, tarea o evento productivo correlacionado                                          | mantener espera                                |
| `PREP-VAL-022` | producción         | lote o salida liberados cuando aplica                                                    | no contar cantidad no liberada                 |
| `PREP-VAL-023` | producción         | LOC listo coincide con snapshot                                                          | bloquear handoff incorrecto                    |
| `PREP-VAL-024` | excepción          | parcial o cero exige causa y cantidad afectada                                           | no confirmar resultado ambiguo                 |
| `PREP-VAL-025` | excepción          | sustitución posee autorización vinculada                                                 | conservar como propuesta                       |
| `PREP-VAL-026` | condición          | daño o calidad no apta se excluyen de ready                                              | crear excepción                                |
| `PREP-VAL-027` | revisión           | ready cubre allocated y no supera solicitado                                             | invalidar revisión                             |
| `PREP-VAL-028` | confirmación       | firma de actor compartido válida cuando aplica                                           | rechazar y no guardar PIN                      |
| `PREP-VAL-029` | confirmación       | intención, fingerprint y versiones son coherentes                                        | devolver mismo receipt o conflicto             |
| `PREP-VAL-030` | persistencia       | picks, cantidades, estados, excepciones, evidencia y receipt se comprometen atómicamente | rollback total y resultado no exitoso          |

Reconciliación:

```text
EXPECTED_PREPARATION_VALIDATIONS = 30
MATERIALIZED_PREPARATION_VALIDATIONS = 30
MISSING_PREPARATION_VALIDATIONS = 0
DUPLICATE_PREPARATION_VALIDATIONS = 0
```

La validación cliente mejora la experiencia. La validación servidor es la autoridad.

---

#### 15. Revisión, confirmación, idempotencia y receipt

##### 15.1. Revisión

Antes de confirmar, la interfaz muestra una proyección congelada con:

- solicitud, destino y fecha requerida;
- sede y área preparadoras;
- rama de abastecimiento;
- producto, política y unidad;
- cantidad solicitada;
- picks o liberaciones productivas;
- cantidad lista;
- cantidad ya asignada, si existe;
- remanente;
- excepciones;
- unidades preparadas y LOC de staging;
- evidencia obligatoria;
- consecuencia: “dejar disponible para despacho”.

No muestra “enviar”, “poner en tránsito” ni “descontar inventario”.

##### 15.2. Fingerprint

La revisión produce un fingerprint sobre:

```text
request_version
fulfillment_version
claim_version
route_snapshot
product_and_policy_snapshot
picks_or_production_release_refs
ready_base_qty
remaining_base_qty
exception_refs
prepared_unit_refs
evidence_refs
```

Cualquier cambio invalida la confirmación.

##### 15.3. Comando objetivo

El comando lógico `CONFIRM_PREPARATION` recibe:

```text
preparation_intent_id
payload_fingerprint
expected_request_version
expected_fulfillment_version
expected_claim_version
actor_signature_ref
fulfillment_id
confirmed_picks[]
production_release_refs[]
prepared_units[]
ready_base_qty
exceptions[]
evidence_refs[]
```

La persistencia es una sola unidad transaccional. Debe:

1. bloquear o comparar las versiones autoritativas;
2. revalidar permiso, contexto y reclamo;
3. revalidar stock o liberaciones productivas;
4. insertar o versionar picks;
5. registrar unidades y evidencia;
6. registrar excepciones;
7. actualizar cantidades y estado de fulfillment;
8. conservar la solicitud original;
9. registrar auditoría y firma;
10. producir un receipt único;
11. publicar el handoff a despacho;
12. comprometer todo o nada.

##### 15.4. Idempotencia

- una intención con el mismo fingerprint devuelve el mismo receipt;
- la misma intención con payload distinto falla;
- doble clic, retry, dos pestañas o reconexión no duplican picks, cantidades, evidencia ni excepciones;
- un fallo no deja picks nuevos con estado anterior o ready sin receipt;
- el servidor no borra primero el plan confirmado para luego intentar reconstruirlo;
- las correcciones posteriores usan una intención nueva y una operación versionada.

##### 15.5. Receipt

El receipt mínimo contiene:

```text
preparation_receipt_id
preparation_intent_id
request_id
request_version
fulfillment_id
fulfillment_version
actor_id
source_site_id
preparing_area_kind
supply_mode
requested_base_qty
ready_base_qty
allocated_base_qty
remaining_base_qty
pick_count
production_release_refs[]
prepared_unit_refs[]
exception_refs[]
fulfillment_status
available_at
next_lane = DISPATCH
server_correlation_id
created_at
```

##### 15.6. Resultado desconocido

Si se pierde la respuesta:

1. la interfaz entra en `PREP_RESULT_UNKNOWN`;
2. conserva intención y fingerprint;
3. consulta por `preparation_intent_id`;
4. si existe, devuelve el receipt original;
5. si el servidor certifica ausencia, permite reintentar la misma intención;
6. si no puede certificarlo, no crea otra intención ni muestra cantidad lista.

---

#### 16. `NEXO-REMISSION-PREPARATION-TO-DISPATCH-HANDOFF-001`

##### 16.1. Salida consumible

Despacho recibe únicamente cantidades confirmadas:

```text
fulfillment_id
fulfillment_version
request_id
request_version
request_line_id
product_snapshot
source_site_id
destination_site_id
source_location_or_ready_location_id
preparing_area_kind
supply_mode
ready_base_qty
allocated_base_qty
available_unallocated_base_qty
stock_unit_code
request_policy_snapshot
prepared_unit_refs[]
condition_and_evidence_refs[]
exception_refs[]
available_at
preparation_receipt_id
```

##### 16.2. Disponibilidad para despacho

```text
available_unallocated_base_qty = ready_base_qty - allocated_base_qty
```

Solo una cantidad positiva puede asignarse a una carga. La asignación deberá bloquear concurrentemente el fulfillment y pertenece a `NEXO-UX-011`.

##### 16.3. Frontera obligatoria

Preparación no:

- crea `remission_shipment`;
- crea `remission_shipment_item`;
- cambia estado a `loading`, `sealed` o `in_transit`;
- escribe `shipped_quantity` como copia de lo preparado;
- aplica `transfer_out`;
- consume empaque productivo por despacho;
- asigna conductor o vehículo;
- transfiere custodia.

##### 16.4. Cambios posteriores

Si una cantidad ready cambia antes de ser allocated:

- se crea una nueva versión de preparación;
- la versión anterior se conserva;
- despacho ve el nuevo saldo disponible.

Si ya existe cantidad allocated:

- preparación no puede reducir ready por debajo de allocated;
- cualquier corrección exige liberar o compensar la asignación mediante el flujo de despacho;
- no se modifica silenciosamente una carga existente.

##### 16.5. Handoff a `NEXO-UX-011`

La siguiente tarea recibe:

- cantidades ready y partially_ready;
- saldo no asignado;
- unidades preparadas;
- LOC de staging;
- evidencia;
- excepciones visibles;
- origen y destino;
- versión de fulfillment y receipt;
- prohibición de cargar cantidad no confirmada.

`NEXO-UX-011` decidirá selección para carga, asignación concurrente, agrupación por destino, envío físico, sellado, documentos, salida de inventario, custodia y transición logística. Esta tarea no anticipa esas decisiones.

---

#### 17. `NEXO-REMISSION-PREPARATION-ROUTE-DISPOSITION-001`

| Ruta             | Patrón actual                            | Disposición                         | Uso en preparación                                                            | Estado                  |
| ---------------- | ---------------------------------------- | ----------------------------------- | ----------------------------------------------------------------------------- | ----------------------- |
| `NEXO-ROUTE-001` | `/`                                      | entrada desde home                  | resolver `NEXO-TASK-004` cuando exista trabajo compatible                     | `ESPECIFICADO`          |
| `NEXO-ROUTE-031` | `/inventory/remissions`                  | resolutor compartido                | dirigir a la tarea preparadora sin mezclar solicitud, conducción o recepción  | `ESPECIFICADO`          |
| `NEXO-ROUTE-032` | `/inventory/remissions/[id]`             | detalle existente                   | mostrar contexto de solicitud y preparación autorizada; conservar retorno     | `ESPECIFICADO`          |
| `NEXO-ROUTE-035` | `/inventory/remissions/fulfillment`      | superficie de fulfillment existente | cola por área y rama; debe separar preparación de creación de cargas          | `ESPECIFICADO`          |
| `NEXO-ROUTE-036` | `/inventory/remissions/prepare`          | entrada de preparación existente    | conservar como entrada task-first o alias convergente, sin segunda verdad     | `ESPECIFICADO`          |
| `NEXO-ROUTE-030` | `/inventory/production-batches`          | referencia productiva               | consulta contextual de lote o resultado liberado; no ejecutar FOGO desde NEXO | `REFERENCIA_CONTEXTUAL` |
| `NEXO-ROUTE-064` | `/scanner`                               | utilidad contextual                 | escanear tarea, LOC, posición o producto y retornar al mismo paso             | `UTILIDAD_OCULTA`       |
| `NEXO-ROUTE-041` | `/inventory/settings/fulfillment-routes` | configuración excluida              | preparación consume el snapshot; no edita la ruta                             | `FUERA_DE_ALCANCE`      |
| `NEXO-ROUTE-050` | `/inventory/settings/supply-routes`      | configuración excluida              | preparación no selecciona ni corrige fuentes                                  | `FUERA_DE_ALCANCE`      |

Reconciliación:

```text
EXPECTED_RELATED_ROUTES = 9
MATERIALIZED_RELATED_ROUTES = 9
MISSING_RELATED_ROUTES = 0
DUPLICATE_RELATED_ROUTES = 0
NEW_ROUTE_IDENTITIES = 0
```

Las rutas `035` y `036` no podrán mantener modelos empresariales divergentes. La implementación deberá convergerlas sobre los mismos fulfillments, estados, comandos y receipts.

---

#### 18. Conectividad, dispositivos y recuperación

| Situación                         | Comportamiento                                                               | Acción prohibida                              |
| --------------------------------- | ---------------------------------------------------------------------------- | --------------------------------------------- |
| sin conexión antes de reclamar    | mostrar trabajo cacheado solo como no autoritativo                           | crear reclamo empresarial                     |
| sin conexión durante captura      | conservar borrador operativo local si la política del dispositivo lo permite | confirmar ready offline por defecto           |
| reconexión                        | revalidar actor, reclamo, versiones, stock y dependencias                    | sincronizar sin detectar conflicto            |
| dispositivo compartido            | identificar actor efectivo para toda mutación                                | atribuir trabajo a la sesión técnica          |
| cambio de actor                   | cerrar o transferir explícitamente el borrador operativo                     | heredar picks del actor anterior sin revisión |
| escaneo duplicado                 | detectar la misma identidad y cantidad                                       | agregar un pick duplicado silenciosamente     |
| resultado de confirmación perdido | consultar por intención                                                      | repetir con una intención nueva               |
| contexto revocado                 | bloquear controles y liberar reclamo según política                          | permitir terminar con permiso anterior        |
| batería o cierre abrupto          | reanudar desde estado autoritativo y borrador compatible                     | asumir que la última acción fue confirmada    |

No existe preparación empresarial offline por defecto. Una futura política offline deberá definir firma, límites, reconciliación, conflictos y evidencia antes de habilitar confirmación diferida.

---

#### 19. Autorización, seguridad y privacidad

1. el servidor revalida actor, contexto, permiso, recurso, estado y versión en carga, reclamo, guardado y confirmación;
2. una persona ve solo fulfillments de su sede y área, salvo permiso global explícito de supervisión;
3. el permiso global de lectura no se convierte en permiso operativo de mutación;
4. IDs de solicitud, fulfillment, LOC, posición, producto, UOM, batch o prepared unit enviados por cliente son no confiables;
5. la firma de dispositivo compartido se vincula al comando y receipt, no a una nota;
6. PIN, credenciales y secretos no se guardan en picks, evidencia, logs o analytics;
7. el detalle de stock por posición se minimiza al contexto necesario;
8. una denegación no revela cantidades ni rutas fuera del territorio;
9. la evidencia visual respeta minimización y retención;
10. toda mutación conserva actor humano, dispositivo, correlación y timestamp;
11. la UI no concede autoridad por mostrar botones o campos;
12. una Server Action, API o RPC no confía en filtros o validaciones del navegador;
13. la integración NEXO–FOGO verifica identidad, versión, procedencia e idempotencia del evento;
14. ningún código escaneado ejecuta una mutación sin confirmación y permiso.

---

#### 20. Evidencia técnica actual y diagnóstico

| Fuente actual                                         | Evidencia verificable                                                                                                                 | Estado frente al diseño    | Decisión                                                                                              |
| ----------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------- | -------------------------- | ----------------------------------------------------------------------------------------------------- |
| `src/app/inventory/remissions/prepare/page.tsx`       | proyecta solicitudes legacy `pending` y `preparing`, calcula alertas de stock y LOC y ofrece acceso al detalle                        | `IMPLEMENTADO_PARCIAL`     | conservar como superficie compatible, pero migrar de encabezados a fulfillments y área responsable    |
| `src/app/inventory/remissions/fulfillment/page.tsx`   | consulta `restock_item_fulfillments`, separa `stock` y `production`, filtra por sede y área y muestra estados hasta `allocated`       | `IMPLEMENTADO_PARCIAL`     | usar como base task-first; separar controles preparadores de creación de carga                        |
| `src/app/inventory/remissions/fulfillment/actions.ts` | `markFulfillmentReady` permite escribir `ready_base_qty` para stock o producción con validaciones de sede, área y rango               | `BRECHA_CONFIRMADA`        | exigir evidencia de picks o liberación productiva; una cantidad digitada no basta                     |
| `src/app/inventory/remissions/fulfillment/actions.ts` | `createShipmentFromReady` comparte superficie con preparación y requiere permiso de tránsito                                          | `COMPATIBILIDAD_REQUERIDA` | trasladar la decisión completa de carga y despacho a `NEXO-UX-011` sin duplicar fulfillment           |
| `src/app/inventory/remissions/[id]/detail-actions.ts` | `commitPreparationDraft` valida picks contra stock, pero elimina todos los picks y luego inserta los nuevos por operaciones separadas | `BRECHA_CRITICA`           | confirmar mediante comando atómico, versionado e idempotente                                          |
| `src/app/inventory/remissions/[id]/detail-actions.ts` | al confirmar preparación actualiza `prepared_quantity` y también `shipped_quantity` con la misma cantidad                             | `BRECHA_CRITICA`           | dejar `shipped` exclusivamente al despacho                                                            |
| `src/app/inventory/remissions/[id]/detail-actions.ts` | el fallback de líneas puede partir `restock_request_items` mediante `split_restock_request_item`                                      | `BRECHA_CONFIRMADA`        | representar multi-LOC con picks bajo una línea inmutable, no reescribir la intención                  |
| `restock_request_item_picks`                          | permite varios picks por línea, LOC, posición y UOM; valida pertenencia física                                                        | `IMPLEMENTADO_PARCIAL`     | conservar la granularidad y añadir versionado, intención, evidencia y atomicidad                      |
| `restock_item_fulfillments`                           | separa cantidad solicitada, ready, allocated, estados y rama de abastecimiento                                                        | `IMPLEMENTADO_PARCIAL`     | convertirlo en unidad autoritativa de preparación y reconciliar su lifecycle                          |
| snapshot de ruta en fulfillment                       | conserva `supply_mode`, modo productivo y `ready_location_id`                                                                         | `IMPLEMENTADO_PARCIAL`     | consumir el snapshot y bloquear tareas incompletas; no releer una ruta mutable como historia          |
| `apply_restock_shipment_from_picks`                   | valida y descuenta stock al aplicar salida desde picks                                                                                | `FUERA_DE_PREPARACION`     | invocarlo únicamente desde despacho autorizado, no al marcar ready                                    |
| estados legacy de `restock_requests`                  | sincronizan `pending`, `preparing`, `in_transit`, `partial` y `received` desde cantidades                                             | `COMPATIBILIDAD_REQUERIDA` | no usar el encabezado como única máquina de estado; derivar proyección desde fulfillments y shipments |
| rama producción actual                                | la cola reconoce `simple` y `recipe`, pero el comando inspeccionado no exige una liberación FOGO para marcar ready                    | `BRECHA_CRITICA`           | materializar contrato de producción liberada y correlacionada                                         |
| receipt actual de preparación                         | las acciones revalidan rutas o redirigen, pero no existe evidencia inspeccionada de receipt recuperable por intención                 | `NO_IMPLEMENTADO`          | crear receipt, consulta por intención y recuperación determinista                                     |

No se modifica código en esta tarea. El diagnóstico define el comportamiento objetivo y las incompatibilidades que el paquete de implementación deberá resolver.

---

#### 21. Decisiones aprobadas

1. `NEXO-UX-010` diseña solo preparación; despacho permanece en `NEXO-UX-011`;
2. la unidad de cola es el fulfillment por línea, fuente y área, no el encabezado de solicitud;
3. existen exactamente catorce pasos y veinte estados de interfaz;
4. se reconciliaron diez estados de fulfillment, de los cuales `allocated` y `released` son posteriores y solo lectura;
5. el permiso exacto es `nexo.inventory.remissions.prepare` dentro del contexto vigente;
6. el reclamo de trabajo es separado del estado empresarial y admite una única instancia activa;
7. la rama se deriva del snapshot `supply_mode` y no se selecciona manualmente;
8. stock y producción son ramas distintas con la misma salida contractual `ready_base_qty`;
9. la rama stock admite múltiples picks por línea, LOC, posición y presentación;
10. multi-LOC no requiere partir ni reescribir la línea solicitada;
11. la preparación no descuenta inventario ni publica `transfer_out`;
12. una reserva futura requiere ledger explícito y no se infiere de cantidades preparadas;
13. FOGO conserva receta, lote, consumo, rendimiento, calidad y liberación;
14. NEXO consume únicamente producción liberada y correlacionada;
15. `production_execution_mode = simple` no autoriza una cantidad arbitraria;
16. ready, allocated, shipped y received son cantidades y hechos distintos;
17. una preparación parcial conserva cantidad lista y remanente visible;
18. faltantes y bloqueos usan excepciones estructuradas, no solo notas libres;
19. sustitución y cambio de ruta requieren transición autorizada y versionada;
20. el empaque de preparación no crea envío, sello, custodia ni LPN canónico;
21. treinta validaciones se ejecutarán en los momentos definidos;
22. la revisión completa precede la confirmación y cualquier cambio invalida el fingerprint;
23. el comando de confirmación es atómico, idempotente y devuelve receipt recuperable;
24. la misma intención no puede producir payloads diferentes;
25. un timeout se reconcilia antes de reintentar;
26. preparación nunca copia automáticamente `ready` a `shipped`;
27. la cantidad ready no puede reducirse por debajo de lo ya allocated;
28. el handoff a despacho conserva versiones, evidencia, prepared units y saldo no asignado;
29. las rutas existentes se reutilizan y `035`/`036` deben converger sobre una sola verdad;
30. toda modificación futura de Supabase se crea y versiona desde `vento-shell`.

---

#### 22. Pendientes materializados y propietarios

| Pendiente                              | Estado                   | Propietario                     | Tarea o puerta                        | Condición de salida                                             |
| -------------------------------------- | ------------------------ | ------------------------------- | ------------------------------------- | --------------------------------------------------------------- |
| implementar claim operativo            | `ESPECIFICADO`           | paquete E5 NEXO                 | implementación de `NEXO-TASK-004`     | unicidad, expiración, liberación y pruebas concurrentes         |
| comando atómico de preparación         | `ESPECIFICADO`           | `vento-shell` y paquete E5 NEXO | migración/RPC de preparación          | todo o nada, idempotencia y rollback probados                   |
| separar `prepared` de `shipped`        | `ESPECIFICADO`           | paquete E5 NEXO                 | convergencia del modelo legacy        | despacho sea único escritor del hecho enviado                   |
| integrar liberación de producción      | `ESPECIFICADO`           | FOGO, NEXO e integración        | contrato e implementación E5/X        | evento versionado, idempotente y con lote/LOC                   |
| receipt y reconciliación por intención | `ESPECIFICADO`           | paquete E5 NEXO                 | implementación de confirmación        | recuperación determinista ante timeout                          |
| política de reservas                   | `PENDIENTE_DE_EVIDENCIA` | NEXO/Data                       | diseño e implementación de inventario | ledger explícito aprobado o decisión documentada de no reservar |
| LPN y contenedores                     | `FUERA_DE_ALCANCE`       | tareas NEXO propietarias        | `NEXO-UX-026` a `NEXO-UX-029`         | contrato canónico de identidad y lifecycle                      |
| despacho                               | `RESERVADO`              | `NEXO-UX-011`                   | siguiente tarea                       | flujo de carga, salida, custodia y documento especificado       |
| pruebas operativas en dispositivos     | `PENDIENTE_DE_EVIDENCIA` | UX-QA y paquete E5 NEXO         | piloto autorizado                     | evidencia reproducible en tablet, compartido y escáner          |

Ningún pendiente queda sin propietario, tarea o condición de salida.

---

#### 23. Requisitos de prueba creados

Esta tarea crea:

- `TREQ-NEXO-101`;
- `TREQ-NEXO-102`;
- `TREQ-NEXO-103`;
- `TREQ-NEXO-104`;
- `TREQ-NEXO-105`;
- `TREQ-NEXO-106`;
- `TREQ-NEXO-107`;
- `TREQ-NEXO-108`;
- `TREQ-NEXO-109`;
- `TREQ-NEXO-110`.

No modifica ni obsoleta requisitos históricos. El detalle canónico reside en el registro completo 04A actualizado coordinadamente con esta tarea.

---

#### 24. Criterios de aceptación

La tarea se considera documentalmente completa cuando:

1. existe una frontera inequívoca entre solicitud, preparación y despacho;
2. los catorce pasos están materializados sin faltantes ni duplicados;
3. los veinte estados de interfaz poseen condición y comportamiento seguro;
4. los diez estados de fulfillment están reconciliados y se distingue quién puede escribirlos;
5. la cola opera por fulfillment, sede y área responsable;
6. reclamo, reanudación y concurrencia poseen versiones esperadas;
7. las ramas stock y producción tienen entrada, autoridad, evidencia y salida explícitas;
8. la rama stock soporta picks múltiples sin alterar la línea solicitada;
9. la rama producción exige resultado liberado por la autoridad productiva;
10. las cantidades e invariantes impiden mezclar ready, allocated, shipped y received;
11. parciales, faltantes, daños, calidad, sustitución y reasignación tienen tratamiento estructurado;
12. el empaque y staging no crean despacho ni custodia;
13. las treinta validaciones están asignadas a momentos concretos;
14. la revisión, fingerprint, intención, atomicidad y receipt están definidos;
15. el handoff a `NEXO-UX-011` contiene únicamente cantidades confirmadas y no asignadas;
16. las nueve rutas relacionadas tienen una disposición explícita y no se crean identidades nuevas;
17. el diagnóstico técnico distingue implementación parcial, brecha y fuera de alcance;
18. los diez requisitos nuevos están incorporados al 04A completo;
19. no se ejecutan cambios físicos ni operaciones remotas;
20. la siguiente tarea permanece reservada.

---

#### 25. Continuidad

**ÚLTIMA TAREA APROBADA:** `NEXO-UX-009 — Diseñar flujo completo de solicitud de remisión`

**TAREA ACTUAL APROBADA:** `NEXO-UX-010 — Diseñar flujo completo de preparación`

**SIGUIENTE TAREA RESERVADA:** `NEXO-UX-011 — Diseñar flujo completo de despacho`

`NEXO-UX-011` deberá consumir `NEXO-REMISSION-PREPARATION-TO-DISPATCH-HANDOFF-001`, preservar la separación entre ready, allocated y shipped, y no reabrir las decisiones de preparación aquí aprobadas salvo contradicción canónica comprobada.


### ✅ NEXO-UX-011 — Diseñar flujo completo de despacho

**Estado:** APROBADA
**Tarea anterior:** `NEXO-UX-010 — Diseñar flujo completo de preparación` — APROBADA
**Tarea siguiente:** `NEXO-UX-012 — Diseñar flujo completo de tránsito` — RESERVADA
**Tipo de tarea:** documental; diseño funcional completo de asignación de cantidad lista, armado de carga, verificación física, sellado, liberación de inventario, transferencia de custodia, confirmación idempotente de despacho, receipt y handoff a tránsito
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/K_NEXO/04_EXPERIENCIA_DE_INVENTARIO_LOGISTICA_Y_ACTIVOS.md`
**Repositorio de aplicación inspeccionado:** `vento-nexo`
**Proceso propietario:** `VPROC-0028 — Abastecer inventario interno de sedes y áreas`
**Permiso exacto de despacho:** `nexo.inventory.remissions.dispatch`
**Permiso posterior de transporte:** `nexo.inventory.remissions.transit`
**Artefactos producidos:** `NEXO-REMISSION-DISPATCH-FLOW-CONTRACT-001`, `NEXO-REMISSION-DISPATCH-STATE-MACHINE-001`, `NEXO-REMISSION-DISPATCH-STEP-CATALOG-001`, `NEXO-REMISSION-DISPATCH-WORK-QUEUE-CONTRACT-001`, `NEXO-REMISSION-DISPATCH-ALLOCATION-CONTRACT-001`, `NEXO-REMISSION-DISPATCH-LOADING-CHECKLIST-001`, `NEXO-REMISSION-DISPATCH-SEAL-CUSTODY-CONTRACT-001`, `NEXO-REMISSION-DISPATCH-DEPARTURE-COMMAND-001`, `NEXO-REMISSION-DISPATCH-EXCEPTION-CONTRACT-001`, `NEXO-REMISSION-DISPATCH-IDEMPOTENCY-RECEIPT-001`, `NEXO-REMISSION-DISPATCH-TO-TRANSIT-HANDOFF-001`, `NEXO-REMISSION-DISPATCH-ROUTE-DISPOSITION-001` y `NEXO-REMISSION-DISPATCH-IMPLEMENTATION-HANDOFF-001`
**Decisiones consumidas:** `UX-BASE-001` a `UX-BASE-005`; `UX-STATION-010` a `UX-STATION-012`; `NEXO-DOM-001`; `NEXO-UX-001` a `NEXO-UX-010`; `NEXO-TASK-NAVIGATION-CONTRACT-001`; `NEXO-NAVIGATION-TASK-CATALOG-001`; `NEXO-ROUTE-TO-TASK-REGISTRY-001`; `NEXO-REMISSION-REQUEST-HANDOFF-001`; `NEXO-REMISSION-PREPARATION-TO-DISPATCH-HANDOFF-001`; contratos de autorización, contexto activo, productos, UOM, fulfillment, LOC, posiciones, producción, dispositivos compartidos, impresión y requisitos `TREQ-*` vigentes
**Cambios físicos autorizados:** ninguno; no modifica código, tablas, RPC, migraciones, RLS, permisos, datos, navegación desplegada, configuración, inventario real ni ambientes remotos

---

#### 1. Propósito

Definir de extremo a extremo cómo una sede origen convierte cantidades confirmadas como listas en una carga física despachada, trazable y entregable al proceso de tránsito, sin confundir selección, asignación, carga, sellado, salida de inventario, custodia y desplazamiento.

El flujo deberá consumir exclusivamente fulfillments versionados con saldo listo no asignado, permitir consolidación controlada por origen y destino, preservar la relación con cada solicitud y unidad preparada, revalidar el estado físico al momento crítico, y confirmar la salida mediante un único comando atómico e idempotente.

La regla canónica es:

```text
CANTIDAD READY CONFIRMADA Y NO ASIGNADA
+ ORIGEN Y DESTINO UNICOS PARA EL ENVIO
+ ACTOR Y CONTEXTO DE DESPACHO AUTORIZADOS
+ ASIGNACION CONCURRENTE DE CANTIDAD
+ CARGA FISICA VERIFICADA
+ EMPAQUES, LOC, POSICIONES, UOM Y LOTES RECONCILIADOS
+ SELLO Y CUSTODIA DOCUMENTADOS
+ INVENTARIO Y PAQUETES REVALIDADOS
+ CONFIRMACION ATOMICA E IDEMPOTENTE
+ RECEIPT DE DESPACHO
→ ENVIO DESPACHADO Y HANDOFF CONSUMIBLE POR TRANSITO
```

La frontera obligatoria es:

```text
READY ≠ ALLOCATED
ALLOCATED ≠ LOADED
LOADED ≠ SEALED
SEALED ≠ DISPATCHED
DISPATCHED ≠ IN_TRANSIT OBSERVADO
SELECCIONAR ≠ DESCONTAR INVENTARIO
ASIGNAR CONDUCTOR ≠ TRANSFERIR CUSTODIA
GENERAR CODIGO ≠ CONFIRMAR SALIDA
```

---

#### 2. Resultado material

Se aprueban trece artefactos documentales consumibles:

1. `NEXO-REMISSION-DISPATCH-FLOW-CONTRACT-001`, que fija frontera, autoridad, lenguaje, entrada y efecto empresarial;
2. `NEXO-REMISSION-DISPATCH-STATE-MACHINE-001`, que separa fulfillment, asignación, carga, shipment, sello, custodia, despacho y tránsito;
3. `NEXO-REMISSION-DISPATCH-STEP-CATALOG-001`, que materializa dieciocho pasos y sus transiciones;
4. `NEXO-REMISSION-DISPATCH-WORK-QUEUE-CONTRACT-001`, que define elegibilidad, agrupación, prioridad, reclamo y concurrencia;
5. `NEXO-REMISSION-DISPATCH-ALLOCATION-CONTRACT-001`, que gobierna cantidad lista, cantidad asignada, liberación y consolidación;
6. `NEXO-REMISSION-DISPATCH-LOADING-CHECKLIST-001`, que define verificación física de carga, cantidades, UOM, paquetes, lote, LOC y evidencia;
7. `NEXO-REMISSION-DISPATCH-SEAL-CUSTODY-CONTRACT-001`, que separa cierre físico, sello, responsable de origen y aceptación de custodia;
8. `NEXO-REMISSION-DISPATCH-DEPARTURE-COMMAND-001`, que define el único punto autoritativo de salida de inventario y despacho;
9. `NEXO-REMISSION-DISPATCH-EXCEPTION-CONTRACT-001`, que trata faltantes de carga, daño, ruptura de sello, cambio de vehículo, rechazo de custodia y conflicto de stock;
10. `NEXO-REMISSION-DISPATCH-IDEMPOTENCY-RECEIPT-001`, que impide duplicidad, doble descuento y resultados desconocidos;
11. `NEXO-REMISSION-DISPATCH-TO-TRANSIT-HANDOFF-001`, que entrega un envío despachado y no un viaje ficticio;
12. `NEXO-REMISSION-DISPATCH-ROUTE-DISPOSITION-001`, que decide las superficies existentes relacionadas sin inventar URLs;
13. `NEXO-REMISSION-DISPATCH-IMPLEMENTATION-HANDOFF-001`, que separa el contrato aprobado de los cambios físicos posteriores.

| Elemento                                       | Total esperado | Total materializado | Faltantes | Duplicados |
| ---------------------------------------------- | -------------: | ------------------: | --------: | ---------: |
| Pasos del flujo                                |             18 |                  18 |         0 |          0 |
| Estados de interfaz                            |             24 |                  24 |         0 |          0 |
| Estados empresariales y técnicos reconciliados |             13 |                  13 |         0 |          0 |
| Familias de excepción                          |             12 |                  12 |         0 |          0 |
| Validaciones materializadas                    |             34 |                  34 |         0 |          0 |
| Disposiciones de rutas relacionadas            |             10 |                  10 |         0 |          0 |
| Requisitos de prueba nuevos o modificados      |             10 |                  10 |         0 |          0 |

El resultado queda `ESPECIFICADO`. No declara el flujo `IMPLEMENTADO`, `VALIDADO` ni desplegado.

---

#### 3. Alcance

##### 3.1. Incluido

- entrada desde trabajo listo entregado por `NEXO-UX-010`;
- resolución de actor, sede origen, contexto operativo y permiso exacto de despacho;
- cola de cantidades listas no asignadas por origen, destino, prioridad y ventana;
- creación o selección de una salida logística compatible;
- creación de shipment y asignación concurrente de cantidades listas;
- consolidación de varias solicitudes en un shipment cuando comparten origen y destino;
- división de una solicitud o fulfillment entre varios shipments sin alterar la demanda original;
- verificación de unidad preparada, picks, paquete, UOM, lote, ubicación y evidencia;
- carga física, conteo, pesaje o lectura auxiliar cuando la política lo exija;
- revisión de capacidad, vehículo, conductor o custodio sin convertirlos en autoridad automática;
- sellado, reapertura controlada y auditoría de cambios;
- transferencia de custodia con aceptación verificable cuando aplique;
- confirmación final de despacho, salida de inventario y consumo de paquetes productivos;
- idempotencia, control de versión, receipt y recuperación ante resultado desconocido;
- handoff a `NEXO-UX-012` con envío, custodia, sello y cantidades efectivamente despachadas;
- diagnóstico del código, esquema y migraciones actuales.

##### 3.2. Excluido

- crear, modificar o aprobar la solicitud original;
- preparar físicamente el producto o marcarlo listo;
- ejecutar producción, receta, lote o liberación de calidad;
- cambiar producto, origen, destino o política sin transición autorizada;
- planear rutas geográficas, secuencias de paradas o navegación vehicular;
- iniciar seguimiento GPS, registrar hitos de carretera o gestionar incidentes en movimiento;
- recibir, aceptar, rechazar, poner en cuarentena o ubicar mercancía en destino;
- cerrar diferencias de recepción o conciliación económica;
- diseñar el modelo canónico completo de vehículos, LPN, contenedores o impresión reservado a tareas propietarias;
- implementar componentes, tablas, RPC, migraciones, RLS, eventos, tipos o pruebas;
- ejecutar DDL, DML, backfills, despliegues o cambios remotos.

---

#### 4. `NEXO-REMISSION-DISPATCH-FLOW-CONTRACT-001`

##### 4.1. Lenguaje humano

La experiencia utilizará:

```text
ARMAR CARGA
CANTIDAD ASIGNADA
CARGA VERIFICADA
SELLAR CARGA
CONFIRMAR DESPACHO
ENTREGAR A TRANSITO
```

No utilizará “en tránsito”, “entregado” o “recibido” antes del evento correspondiente.

El efecto exitoso es:

```text
DISPATCH_CONFIRMED
+ shipment_id
+ dispatch_receipt_id
+ dispatched_at
+ dispatched_by
+ custody_handoff
+ inventory_postings
+ immutable_shipment_snapshot
```

##### 4.2. Actor y autoridad

El actor ordinario de despacho deberá:

- estar autenticado y vinculado a un actor laboral vigente;
- operar en la sede origen del shipment;
- tener contexto operativo activo cuando aplique;
- poseer `nexo.inventory.remissions.dispatch` en ese territorio;
- usar un dispositivo permitido;
- actuar sobre un shipment vigente, no terminal y versionado;
- confirmar una intención cuya identidad no haya sido consumida con otro payload.

`nexo.inventory.remissions.prepare` permite producir cantidad lista, pero no despacharla. `nexo.inventory.remissions.transit` permite asumir y operar el transporte dentro de su alcance, pero no sustituye la autoridad de despacho de origen.

##### 4.3. Segregación de funciones

| Capacidad                         | Preparador                     | Despachador                | Custodio o conductor        | Receptor |
| --------------------------------- | ------------------------------ | -------------------------- | --------------------------- | -------- |
| marcar cantidad lista             | sí, con permiso de preparación | no por defecto             | no                          | no       |
| asignar cantidad lista a shipment | no por defecto                 | sí                         | consulta                    | no       |
| verificar carga                   | apoyo autorizado               | sí                         | puede cotejar               | no       |
| sellar o reabrir                  | no por defecto                 | sí, según permiso y estado | puede observar              | no       |
| confirmar salida de inventario    | no                             | sí                         | no por sí solo              | no       |
| aceptar custodia                  | no                             | registra entrega           | sí, con identidad propia    | no       |
| operar tránsito                   | no                             | no por defecto             | sí, con permiso de tránsito | no       |
| registrar recepción               | no                             | no                         | no                          | sí       |

La misma persona puede ejercer más de una función únicamente si posee cada capacidad exacta, el contexto las permite y cada acción queda registrada con intención y etapa independientes.

---

#### 5. Entidades canónicas y decisiones por identidad

| Entidad             | Identidad estable                          | Propiedad                           | Decisión en despacho              | Prohibición                            |
| ------------------- | ------------------------------------------ | ----------------------------------- | --------------------------------- | -------------------------------------- |
| solicitud           | `request_id`                               | necesidad de abastecimiento         | referencia histórica              | no se reescribe                        |
| línea solicitada    | `request_item_id`                          | producto y cantidad solicitada      | correlación obligatoria           | no se parte para ocultar consolidación |
| fulfillment         | `fulfillment_id`                           | cumplimiento por fuente y área      | fuente de cantidad ready          | no se sobreasigna                      |
| unidad preparada    | `prepared_unit_id` o identidad equivalente | evidencia física de preparación     | se verifica y asigna              | no se duplica entre shipments activos  |
| pick                | `pick_id`                                  | origen físico, UOM y cantidad       | sustenta la salida                | no se altera después de sellar         |
| salida logística    | `dispatch_run_id`                          | ventana, vehículo y custodio        | agrupa shipments compatibles      | no sustituye shipment                  |
| shipment            | `shipment_id`                              | carga física por origen y destino   | unidad sellable y despachable     | no mezcla destinos                     |
| línea de shipment   | `shipment_item_id`                         | cantidad asignada de un fulfillment | snapshot de carga                 | no excede saldo ready                  |
| sello               | `seal_record_id`                           | cierre físico y evidencia           | inmoviliza payload                | no es un texto libre                   |
| handoff de custodia | `custody_handoff_id`                       | transferencia entre actores         | evidencia de entrega y aceptación | no se presume por asignación           |
| intención           | `dispatch_intent_id`                       | comando idempotente                 | controla confirmación             | no se reutiliza con otro payload       |
| receipt             | `dispatch_receipt_id`                      | resultado verificable               | prueba del despacho               | no se reconstruye desde la UI          |
| excepción           | `dispatch_exception_id`                    | novedad estructurada                | bloquea o cambia el flujo         | no se resuelve solo con nota           |

Cada identidad conserva correlación, versión, actor, timestamps y estado. Un código visual o URL es una representación, no la identidad empresarial.

---

#### 6. Entrada contractual desde preparación

Un fulfillment es elegible únicamente cuando el handoff contiene:

- `request_id`, `request_item_id` y `fulfillment_id`;
- versiones esperadas de solicitud, línea, fulfillment y preparación;
- `from_site_id` y `to_site_id`;
- producto, política, UOM base y snapshots aplicables;
- `ready_base_qty` y `allocated_base_qty`;
- `available_to_allocate = ready_base_qty - allocated_base_qty` mayor que cero;
- unidades preparadas, picks o liberaciones productivas correlacionadas;
- LOC o zona de staging autorizada;
- lote, paquete o presentación cuando aplique;
- evidencia mínima completa;
- excepciones abiertas y su efecto sobre la cantidad;
- fingerprint de preparación;
- timestamp de disponibilidad;
- ausencia de cancelación, revocación o bloqueo terminal.

El despacho no corrige preparación silenciosamente. Ante una inconsistencia devuelve la cantidad o unidad a una excepción con propietario y conserva la evidencia original.

---

#### 7. `NEXO-REMISSION-DISPATCH-WORK-QUEUE-CONTRACT-001`

##### 7.1. Unidad y agrupación

La cola opera sobre saldo ready no asignado, no sobre la solicitud completa.

Orden recomendado:

1. shipments en carga que el actor puede continuar;
2. cantidades listas asociadas a una ventana de salida vigente;
3. prioridades críticas autorizadas;
4. antigüedad de `available_at`;
5. compatibilidad de origen, destino, vehículo y capacidad;
6. vencimiento, frío, calidad o restricciones de producto;
7. saldo parcial que completa un shipment existente;
8. trabajo ordinario.

Los filtros solo reducen el territorio ya autorizado. No amplían permisos ni cambian la sede origen.

##### 7.2. Tarjeta de cola

Cada agrupación muestra:

- origen y destino;
- ventana de salida;
- shipment existente o propuesta de nueva carga;
- cantidad de fulfillments y solicitudes correlacionadas;
- unidades o paquetes listos;
- peso, volumen o conteo disponible cuando exista dato confiable;
- restricciones de frío, calidad, manipulación o vehículo;
- saldo ready, saldo asignado y saldo no asignado;
- prioridad y antigüedad;
- bloqueos y excepciones;
- siguiente acción autorizada.

##### 7.3. Reclamo y concurrencia

Un shipment en `loading` admite un único coordinador de edición activo por defecto. Otras personas pueden ejecutar verificaciones físicas concurrentes solo si el contrato de checklist divide responsabilidades sin permitir sobrescritura.

El reclamo posee:

- identidad propia;
- actor y dispositivo;
- versión;
- inicio, expiración y renovación;
- liberación explícita;
- motivo de toma administrativa;
- referencia al shipment.

Perder el reclamo no revierte automáticamente asignaciones ya confirmadas. Bloquea nuevas mutaciones hasta resolver el conflicto.

---

#### 8. `NEXO-REMISSION-DISPATCH-ALLOCATION-CONTRACT-001`

##### 8.1. Invariantes

Para cada fulfillment:

```text
0 <= dispatched_base_qty
0 <= allocated_base_qty
0 <= ready_base_qty
allocated_base_qty <= ready_base_qty
released_base_qty <= allocated_base_qty
available_to_allocate = ready_base_qty - allocated_base_qty
```

Para cada shipment item:

```text
shipment_item.base_qty > 0
SUM(active shipment items by fulfillment) = allocated_base_qty
SUM(dispatched shipment items by fulfillment) <= ready_base_qty
```

##### 8.2. Asignación

Asignar significa reservar cantidad ready para un shipment específico. No significa descontar inventario ni marcarla enviada.

La operación deberá:

1. bloquear o versionar los fulfillments seleccionados;
2. comprobar origen y destino homogéneos;
3. comprobar saldo ready no asignado;
4. crear o reutilizar un shipment compatible;
5. crear líneas de shipment con snapshots;
6. incrementar `allocated_base_qty` exactamente una vez;
7. devolver receipt de asignación;
8. conservar saldo no asignado para futuras cargas.

##### 8.3. Parciales y consolidación

- un fulfillment puede aportar cantidades a varios shipments;
- un shipment puede contener líneas de varias solicitudes;
- toda consolidación exige mismo origen y destino;
- una línea de shipment conserva `request_item_id` y `fulfillment_id`;
- la cantidad no asignada permanece visible;
- una cancelación de shipment libera solo cantidad no despachada;
- una cantidad despachada nunca vuelve a ready por edición simple;
- la desasignación exige estado anterior al sello y operación auditada.

##### 8.4. Prohibiciones de consolidación

No se mezclan en el mismo shipment:

- sedes origen distintas;
- sedes destino distintas;
- mercancía incompatible por calidad, temperatura o seguridad;
- unidades con excepción bloqueante;
- productos cuya política prohíba co-carga;
- cantidades ya asignadas a otro shipment activo;
- snapshots o versiones incompatibles sin reconciliación explícita.

---

#### 9. `NEXO-REMISSION-DISPATCH-STEP-CATALOG-001`

| Paso     | Nombre                   | Entrada                  | Acción principal                            | Salida                         | Escritura autorizada                     |
| -------- | ------------------------ | ------------------------ | ------------------------------------------- | ------------------------------ | ---------------------------------------- |
| `DSP-01` | resolver contexto        | entrada task-first       | resolver actor, sede, permiso y dispositivo | contexto válido o denegación   | ninguna                                  |
| `DSP-02` | cargar cola              | contexto válido          | consultar saldo ready no asignado           | cola versionada                | ninguna                                  |
| `DSP-03` | elegir destino o salida  | cola                     | seleccionar agrupación compatible           | alcance de carga               | borrador local                           |
| `DSP-04` | crear o abrir shipment   | alcance                  | reclamar shipment o crear borrador          | shipment editable              | shipment draft y claim                   |
| `DSP-05` | seleccionar cantidades   | shipment editable        | proponer fulfillments y cantidades          | plan de asignación             | borrador local                           |
| `DSP-06` | confirmar asignación     | plan válido              | asignar atómicamente saldo ready            | shipment loading               | shipment items y allocated               |
| `DSP-07` | localizar unidades       | shipment loading         | resolver staging, paquetes y picks          | mapa físico                    | evidencia operativa                      |
| `DSP-08` | cargar físicamente       | mapa físico              | mover unidades al vehículo o zona de carga  | carga física provisional       | checklist                                |
| `DSP-09` | verificar cantidades     | carga provisional        | contar, pesar o escanear según política     | cantidades verificadas         | checklist y evidencia                    |
| `DSP-10` | verificar compatibilidad | cantidades verificadas   | validar vehículo, capacidad y restricciones | carga compatible               | checklist                                |
| `DSP-11` | resolver diferencias     | hallazgo                 | corregir asignación o abrir excepción       | carga reconciliada o bloqueada | excepción o desasignación                |
| `DSP-12` | revisar resumen          | carga reconciliada       | comparar shipment, evidencia y snapshots    | fingerprint de carga           | borrador de confirmación                 |
| `DSP-13` | sellar carga             | resumen válido           | cerrar contenido y registrar sello          | shipment sealed                | sello y versión                          |
| `DSP-14` | identificar custodia     | sealed                   | resolver custodio, conductor y vehículo     | handoff preparado              | asignaciones de custodia                 |
| `DSP-15` | aceptar custodia         | handoff preparado        | registrar aceptación o rechazo              | custodia aceptada o excepción  | handoff de custodia                      |
| `DSP-16` | confirmar despacho       | sealed y custodia válida | ejecutar comando autoritativo               | despacho confirmado            | inventario, paquetes, shipment y receipt |
| `DSP-17` | recuperar resultado      | timeout o desconexión    | consultar intención y receipt               | resultado conocido             | ninguna o reanudación segura             |
| `DSP-18` | entregar a tránsito      | receipt válido           | proyectar handoff a `NEXO-UX-012`           | entrada de tránsito            | evento y proyección autorizada           |

Ningún paso puede omitirse mediante una ruta legacy. Una implementación puede combinar pantallas, pero debe conservar las decisiones y evidencias de los dieciocho pasos.

---

#### 10. `NEXO-REMISSION-DISPATCH-STATE-MACHINE-001`

##### 10.1. Estados reconciliados

| Estado canónico         | Entidad          | Significado                               | Escritor autorizado      | Transición siguiente                             |
| ----------------------- | ---------------- | ----------------------------------------- | ------------------------ | ------------------------------------------------ |
| `READY_AVAILABLE`       | fulfillment      | existe saldo listo no asignado            | preparación              | asignación o excepción                           |
| `PARTIALLY_ALLOCATED`   | fulfillment      | parte de ready está en shipments          | despacho                 | más asignación, liberación o despacho            |
| `ALLOCATED`             | fulfillment      | todo el saldo ready está asignado         | despacho                 | liberación o salida confirmada                   |
| `DRAFT`                 | shipment         | carga creada sin asignación confirmada    | despacho                 | loading o cancelled                              |
| `LOADING`               | shipment         | contiene asignaciones editables           | despacho                 | load_verified, cancelled o exception             |
| `LOAD_VERIFIED`         | shipment         | contenido físico reconciliado             | despacho                 | sealed o loading                                 |
| `SEALED`                | shipment         | payload inmovilizado y sello vigente      | despacho                 | custody_pending, reopened o cancelled controlado |
| `CUSTODY_PENDING`       | handoff          | entrega preparada sin aceptación final    | despacho y custodio      | accepted o rejected                              |
| `CUSTODY_ACCEPTED`      | handoff          | custodio identificado aceptó el contenido | custodio autorizado      | dispatch_confirmed                               |
| `DISPATCH_CONFIRMED`    | evento/receipt   | salida física e inventario comprometidos  | comando de despacho      | transit_handoff_ready                            |
| `TRANSIT_HANDOFF_READY` | proyección       | `NEXO-UX-012` puede iniciar seguimiento   | sistema                  | tránsito                                         |
| `EXCEPTION`             | shipment o línea | novedad bloqueante o investigable         | actor autorizado         | resolución o cancelación                         |
| `CANCELLED`             | shipment         | carga anulada antes del despacho          | autoridad de cancelación | terminal con liberación                          |

##### 10.2. Compatibilidad con estados actuales

Los estados existentes `draft`, `loading`, `sealed`, `in_transit`, `arrived`, `partial_receipt`, `received`, `exception`, `cancelled` y `closed` son evidencia técnica, no sustituyen esta semántica. La implementación deberá decidir una proyección compatible sin colapsar `SEALED`, `CUSTODY_ACCEPTED`, `DISPATCH_CONFIRMED` e inicio real de tránsito en un único cambio opaco.

`in_transit` pertenece al handoff y seguimiento de `NEXO-UX-012`; un despacho confirmado puede proyectar una entrada pendiente de inicio o un estado inicial compatible, pero no inventar ubicación, movimiento o avance del vehículo.

---

#### 11. `NEXO-REMISSION-DISPATCH-LOADING-CHECKLIST-001`

##### 11.1. Checklist por shipment

| Grupo              | Comprobación                               | Evidencia mínima                  | Bloquea despacho            |
| ------------------ | ------------------------------------------ | --------------------------------- | --------------------------- |
| identidad          | shipment, origen, destino y versión        | lectura de identidad              | sí                          |
| línea              | fulfillment y request item correlacionados | vínculo autoritativo              | sí                          |
| producto           | producto y variante correctos              | escaneo o verificación controlada | sí                          |
| cantidad           | base qty cargada coincide con asignada     | conteo, peso o medición           | sí                          |
| UOM                | presentación y conversión vigentes         | perfil y cantidad                 | sí cuando aplica            |
| LOC/posición       | unidad proviene del origen preparado       | picks y staging                   | sí                          |
| lote/calidad       | lote liberado y vigente                    | batch y liberación                | sí cuando aplica            |
| paquete productivo | empaque disponible y no consumido          | package id y saldo                | sí cuando aplica            |
| integridad         | daño, fuga, temperatura o sello interno    | resultado y evidencia             | sí según política           |
| vehículo           | capacidad y compatibilidad                 | vehículo y capacidad              | sí cuando aplica            |
| custodia           | actor receptor identificado                | aceptación o excepción            | sí según política           |
| documentos         | snapshot y referencias disponibles         | receipt preliminar                | sí si la política los exige |

##### 11.2. Medición variable

Los productos de peso o volumen variable deben registrar la cantidad real de despacho y, cuando la política lo exija, conteo auxiliar. La tolerancia no autoriza superar la cantidad ready ni convertir una diferencia en ajuste automático.

Si la medición real difiere de la cantidad asignada:

- antes del sello puede corregirse la línea mediante una operación de reasignación versionada;
- después del sello exige reapertura controlada;
- después de confirmar despacho exige excepción y proceso posterior, no edición del receipt.

##### 11.3. Escaneo

El escáner puede identificar shipment, unidad preparada, producto, paquete, lote, LOC, posición, vehículo o sello. Cada lectura se interpreta dentro del paso vigente; nunca ejecuta por sí sola una mutación irreversible.

---

#### 12. Carga, vehículo y capacidad

La salida logística puede agrupar shipments del mismo origen. Cada shipment conserva un único destino. La capacidad del vehículo se evalúa sobre datos disponibles y confiables:

```text
SUM(weight_confirmed) <= vehicle_capacity_weight
SUM(volume_confirmed) <= vehicle_capacity_volume
restricted_compatibility = satisfied
```

Cuando peso o volumen no estén disponibles, la interfaz declara `DATOS_DE_CAPACIDAD_INSUFICIENTES`; no presume capacidad.

La asignación de vehículo o conductor:

- no concede permiso de despacho;
- no confirma carga;
- no descuenta inventario;
- no prueba aceptación de custodia;
- puede cambiar antes del sello mediante versión;
- después del sello exige reapertura o excepción;
- queda incluida en el snapshot del receipt.

---

#### 13. `NEXO-REMISSION-DISPATCH-SEAL-CUSTODY-CONTRACT-001`

##### 13.1. Sello

Sellar significa inmovilizar el manifiesto de carga y registrar:

- shipment y versión;
- fingerprint de líneas, cantidades y unidades;
- identificador de sello físico cuando exista;
- tipo de sello o mecanismo de cierre;
- actor, dispositivo, fecha y lugar;
- evidencia mínima;
- estado de checklist;
- vehículo y custodio previstos.

El sello no descuenta inventario y no confirma despacho.

##### 13.2. Reapertura

Solo se permite antes del despacho, con:

- permiso exacto;
- motivo estructurado;
- actor y aprobador cuando la política lo exija;
- conservación del sello anterior;
- nueva versión;
- invalidación de fingerprint y aceptación de custodia previos;
- retorno a `LOADING`;
- nueva verificación y nuevo sello.

##### 13.3. Custodia

La transferencia de custodia separa dos declaraciones:

```text
ORIGEN ENTREGA
CUSTODIO ACEPTA
```

La aceptación incluye:

- identidad del custodio o conductor;
- shipment, sello y versión observados;
- vehículo o medio de transporte;
- timestamp;
- observaciones y excepciones;
- firma o mecanismo permitido por dispositivo;
- correlación con el despacho.

Un rechazo mantiene el shipment sin despachar y abre una excepción. La asignación administrativa de un conductor no equivale a aceptación.

---

#### 14. Punto autoritativo de salida de inventario

La única transición que materializa salida física es `DISPATCH_CONFIRMED`.

Antes de ese punto:

- `ready_base_qty` permanece preparado;
- `allocated_base_qty` permanece reservado al shipment;
- los picks y paquetes permanecen físicamente presentes;
- no existe `transfer_out` autoritativo;
- no se incrementa `shipped_quantity`;
- no se marca el shipment en tránsito.

En el comando final se ejecutan conjuntamente:

1. revalidación de actor, permiso, contexto y versiones;
2. bloqueo de shipment, líneas, fulfillments, picks, paquetes y saldos afectados;
3. verificación de estado sellado y custodia;
4. validación de fingerprint de carga;
5. validación final de stock por sede, LOC, posición y presentación;
6. consumo de paquete productivo cuando aplique;
7. creación de movimientos de salida correlacionados;
8. actualización de cantidades despachadas o released;
9. actualización de shipment y handoff;
10. creación del receipt y evento outbox;
11. commit único.

Un fallo revierte todo. No puede existir inventario descontado con shipment no despachado, ni shipment despachado sin movimientos y receipt.

---

#### 15. `NEXO-REMISSION-DISPATCH-DEPARTURE-COMMAND-001`

##### 15.1. Entrada mínima

```text
dispatch_intent_id
shipment_id
expected_shipment_version
expected_seal_version
expected_custody_version
expected_fulfillment_versions[]
load_fingerprint
actor_context
client_observed_at
```

Los IDs enviados por cliente son no confiables y deben resolverse en servidor.

##### 15.2. Salida mínima

```text
dispatch_receipt_id
shipment_id
shipment_code
dispatch_intent_id
dispatched_at
dispatched_by
origin_site_id
destination_site_id
custody_handoff_id
seal_record_id
shipment_snapshot
inventory_movement_ids[]
production_package_effects[]
fulfillment_effects[]
transit_handoff_version
```

##### 15.3. Semántica transaccional

- una intención nueva ejecuta como máximo una vez;
- la misma intención y mismo payload devuelve el mismo receipt;
- la misma intención con payload distinto devuelve conflicto;
- un shipment despachado no admite segundo comando;
- la transacción bloquea cantidades y saldos antes de descontar;
- toda escritura Supabase futura se versiona desde `vento-shell`;
- el comando no confía en estado calculado por navegador;
- el receipt es persistente y consultable por intención.

---

#### 16. Validaciones obligatorias

| ID            | Momento      | Validación                                                      | Resultado ante fallo             |
| ------------- | ------------ | --------------------------------------------------------------- | -------------------------------- |
| `DSP-VAL-001` | entrada      | principal autenticado y actor efectivo vigente                  | denegación segura                |
| `DSP-VAL-002` | entrada      | sede origen dentro del territorio                               | denegación                       |
| `DSP-VAL-003` | entrada      | permiso exacto `nexo.inventory.remissions.dispatch`             | denegación                       |
| `DSP-VAL-004` | entrada      | turno, check-in o contexto cuando aplique                       | bloqueo contextual               |
| `DSP-VAL-005` | entrada      | dispositivo permitido e identidad verificable                   | bloqueo                          |
| `DSP-VAL-006` | cola         | fulfillment no terminal ni bloqueado                            | excluir de cola                  |
| `DSP-VAL-007` | cola         | saldo ready no asignado mayor que cero                          | excluir de cola                  |
| `DSP-VAL-008` | cola         | versiones de preparación vigentes                               | refrescar                        |
| `DSP-VAL-009` | creación     | origen distinto de destino                                      | rechazo                          |
| `DSP-VAL-010` | creación     | shipment o run pertenece al origen                              | rechazo                          |
| `DSP-VAL-011` | asignación   | origen y destino homogéneos                                     | rechazo                          |
| `DSP-VAL-012` | asignación   | estado de fulfillment cargable                                  | conflicto                        |
| `DSP-VAL-013` | asignación   | cantidad solicitada mayor que cero                              | rechazo                          |
| `DSP-VAL-014` | asignación   | cantidad no supera ready menos allocated                        | conflicto concurrente            |
| `DSP-VAL-015` | asignación   | no existe asignación duplicada de unidad física                 | conflicto                        |
| `DSP-VAL-016` | asignación   | snapshot de producto y UOM compatible                           | bloqueo                          |
| `DSP-VAL-017` | carga        | unidad, paquete o pick pertenece a la línea                     | rechazo de lectura               |
| `DSP-VAL-018` | carga        | LOC y posición pertenecen al origen                             | bloqueo                          |
| `DSP-VAL-019` | carga        | cantidad física coincide con línea de shipment                  | diferencia estructurada          |
| `DSP-VAL-020` | carga        | política de medición y conteo auxiliar satisfecha               | bloqueo                          |
| `DSP-VAL-021` | carga        | lote y calidad vigentes                                         | bloqueo de calidad               |
| `DSP-VAL-022` | carga        | paquete productivo disponible y no consumido                    | conflicto                        |
| `DSP-VAL-023` | vehículo     | capacidad y compatibilidad conocidas y suficientes              | bloqueo o aprobación excepcional |
| `DSP-VAL-024` | revisión     | checklist completo y sin excepción bloqueante                   | impedir sello                    |
| `DSP-VAL-025` | sello        | fingerprint coincide con payload observado                      | conflicto de versión             |
| `DSP-VAL-026` | sello        | identificador de sello no duplicado cuando aplique              | rechazo                          |
| `DSP-VAL-027` | custodia     | custodio identificado y habilitado                              | bloqueo                          |
| `DSP-VAL-028` | custodia     | sello y shipment aceptados en la misma versión                  | rechazo o excepción              |
| `DSP-VAL-029` | confirmación | intención válida y no usada con otro payload                    | conflicto idempotente            |
| `DSP-VAL-030` | confirmación | shipment continúa sellado y no despachado                       | conflicto                        |
| `DSP-VAL-031` | confirmación | stock actual cubre todos los movimientos                        | rollback y excepción             |
| `DSP-VAL-032` | confirmación | cantidades agregadas por fulfillment no exceden ready           | rollback                         |
| `DSP-VAL-033` | confirmación | movimientos, paquetes, shipment y receipt se comprometen juntos | rollback total                   |
| `DSP-VAL-034` | recuperación | timeout se reconcilia por intención antes de reintentar         | resultado conocido o bloqueo     |

Las treinta y cuatro validaciones son acumulativas. Una validación de interfaz no sustituye su equivalente en servidor o base de datos.

---

#### 17. `NEXO-REMISSION-DISPATCH-EXCEPTION-CONTRACT-001`

| Excepción              | Momento           | Efecto                              | Resolución permitida               | Propietario            |
| ---------------------- | ----------------- | ----------------------------------- | ---------------------------------- | ---------------------- |
| `READY_CHANGED`        | asignación        | bloquea cantidad afectada           | recargar y reasignar               | despacho y preparación |
| `OVER_ALLOCATION`      | asignación        | rechaza operación                   | reducir o usar otro saldo          | despacho               |
| `UNIT_NOT_FOUND`       | carga             | mantiene shipment loading           | localizar o desasignar             | origen                 |
| `LOAD_SHORTAGE`        | carga             | diferencia entre asignado y cargado | reducir antes del sello            | despacho               |
| `LOAD_SURPLUS`         | carga             | unidad no autorizada                | retirar o crear transición válida  | despacho               |
| `DAMAGE_AT_LOADING`    | carga             | bloquea unidad                      | excluir y registrar daño           | origen y supervisión   |
| `QUALITY_HOLD`         | carga             | bloquea producto o lote             | liberar por autoridad de calidad   | calidad/FOGO           |
| `VEHICLE_INCOMPATIBLE` | revisión          | impide sello                        | cambiar vehículo                   | logística              |
| `SEAL_BROKEN`          | después del sello | invalida sello y custodia           | reapertura controlada              | despacho y supervisión |
| `CUSTODY_REJECTED`     | handoff           | impide despacho                     | corregir o reasignar custodio      | despacho/logística     |
| `STOCK_CHANGED`        | confirmación      | rollback total                      | volver a preparación o reconciliar | inventario             |
| `RESULT_UNKNOWN`       | confirmación      | bloquea nuevo comando               | consultar intención y receipt      | sistema                |

Toda excepción conserva tipo, etapa, cantidad afectada, evidencia, actor, responsable, plazo, estado y resolución. Una nota libre puede complementar, nunca sustituir esos campos.

---

#### 18. Cancelación, desasignación y reapertura

##### 18.1. Antes del sello

Se puede:

- reducir o retirar una línea de shipment;
- liberar `allocated_base_qty`;
- cancelar un shipment vacío;
- cambiar vehículo o ventana;
- corregir medición mediante nueva versión;
- conservar historial de cada asignación y liberación.

##### 18.2. Después del sello y antes del despacho

Toda modificación exige reapertura controlada, invalida el sello y cualquier aceptación de custodia, y retorna a `LOADING`.

##### 18.3. Después del despacho

No se edita ni cancela el receipt. Daño, pérdida, retorno, error de carga o destino incorrecto se manejan como excepciones y procesos posteriores con movimientos compensatorios autorizados. Nunca se borra el movimiento original.

---

#### 19. `NEXO-REMISSION-DISPATCH-IDEMPOTENCY-RECEIPT-001`

##### 19.1. Fingerprints

Existen fingerprints separados:

- preparación consumida;
- asignación de shipment;
- carga verificada;
- sello;
- custodia;
- confirmación final.

Cualquier cambio material invalida los fingerprints posteriores.

##### 19.2. Resultado desconocido

Ante timeout, cierre de aplicación o pérdida de conexión:

1. la interfaz conserva `dispatch_intent_id`;
2. consulta el estado autoritativo de la intención;
3. si existe receipt, lo muestra sin ejecutar de nuevo;
4. si la intención está pendiente, espera o reconcilia;
5. si falló sin efectos, permite corregir y usar una nueva intención;
6. si el payload difiere, bloquea el reintento;
7. nunca asume éxito por un mensaje local.

##### 19.3. Receipt

El receipt conserva el snapshot completo del despacho, los efectos de inventario, las cantidades por fulfillment, los paquetes productivos consumidos, el sello, la custodia y la versión entregada a tránsito.

---

#### 20. Estados de interfaz

| Estado                             | Condición                 | Mensaje o comportamiento    | Acción segura                  |
| ---------------------------------- | ------------------------- | --------------------------- | ------------------------------ |
| `RESOLVIENDO_CONTEXTO`             | entrada inicial           | validar actor y sede        | esperar                        |
| `SIN_AUTORIZACION`                 | permiso ausente           | explicar sin filtrar datos  | volver                         |
| `CONTEXTO_INACTIVO`                | turno o check-in inválido | bloquear mutaciones         | resolver contexto              |
| `SIN_SEDE_ORIGEN`                  | no existe sede operativa  | no cargar cola              | seleccionar contexto permitido |
| `CARGANDO_COLA`                    | consulta vigente          | skeleton estable            | esperar                        |
| `COLA_VACIA`                       | no hay saldo ready        | indicar ausencia de trabajo | refrescar                      |
| `COLA_DISPONIBLE`                  | hay trabajo               | mostrar prioridades         | abrir agrupación               |
| `SHIPMENT_DRAFT`                   | carga nueva               | permitir plan inicial       | seleccionar cantidades         |
| `SHIPMENT_RECLAMADO`               | actor posee claim         | habilitar edición           | continuar                      |
| `SHIPMENT_RECLAMADO_POR_OTRO`      | claim ajeno               | solo lectura                | actualizar                     |
| `ASIGNANDO_CANTIDADES`             | plan en curso             | mostrar saldo y límites     | confirmar asignación           |
| `CONFLICTO_DE_ASIGNACION`          | saldo cambió              | no sobrescribir             | recargar                       |
| `CARGANDO_FISICAMENTE`             | shipment loading          | checklist por unidad        | escanear o verificar           |
| `DIFERENCIA_DE_CARGA`              | físico no coincide        | abrir excepción             | corregir antes de sellar       |
| `CARGA_VERIFICADA`                 | checklist completo        | resumen y fingerprint       | sellar                         |
| `DATOS_DE_CAPACIDAD_INSUFICIENTES` | falta peso o volumen      | declarar incertidumbre      | completar o escalar            |
| `CARGA_SELLADA`                    | sello vigente             | bloquear edición ordinaria  | preparar custodia              |
| `REAPERTURA_REQUERIDA`             | cambio material           | invalidar sello             | solicitar reapertura           |
| `CUSTODIA_PENDIENTE`               | sin aceptación            | no despachar                | identificar y aceptar          |
| `CUSTODIA_RECHAZADA`               | custodio no acepta        | abrir excepción             | corregir handoff               |
| `LISTO_PARA_DESPACHAR`             | sello y custodia válidos  | mostrar impacto final       | confirmar despacho             |
| `CONFIRMANDO_DESPACHO`             | comando enviado           | bloquear doble clic         | esperar o reconciliar          |
| `RESULTADO_DESCONOCIDO`            | timeout                   | consultar intención         | recuperar receipt              |
| `DESPACHO_CONFIRMADO`              | receipt válido            | mostrar resumen inmutable   | entregar a tránsito            |

Los estados vacíos, errores y bloqueos no ofrecen controles que el servidor rechazará por diseño.

---

#### 21. `NEXO-REMISSION-DISPATCH-TO-TRANSIT-HANDOFF-001`

El handoff contiene:

```text
shipment_id
shipment_code
dispatch_receipt_id
dispatch_intent_id
origin_site_id
destination_site_id
dispatched_at
dispatched_by
seal_record_id
seal_fingerprint
custody_handoff_id
custodian_actor_id
vehicle_snapshot
shipment_items[]
fulfillment_effects[]
package_and_batch_refs[]
inventory_movement_refs[]
open_nonblocking_exceptions[]
transit_handoff_version
```

Garantías:

- las cantidades son las efectivamente despachadas;
- el inventario de origen ya refleja la salida;
- el contenido del shipment es inmutable;
- el sello y la custodia están correlacionados;
- cada línea conserva solicitud y fulfillment;
- no se afirma ubicación, avance, llegada ni recepción;
- `NEXO-UX-012` no vuelve a descontar inventario ni consume paquetes;
- una excepción posterior no reescribe el receipt.

`NEXO-UX-012` será propietario de inicio operativo del viaje, seguimiento, hitos, incidentes en tránsito y llegada. El despacho entrega un hecho consumible; no ejecuta esas etapas.

---

#### 22. `NEXO-REMISSION-DISPATCH-ROUTE-DISPOSITION-001`

| Ruta             | Patrón actual                       | Disposición               | Uso en despacho                                                                 | Estado                  |
| ---------------- | ----------------------------------- | ------------------------- | ------------------------------------------------------------------------------- | ----------------------- |
| `NEXO-ROUTE-001` | `/`                                 | entrada desde home        | resolver trabajo de despacho compatible sin exponer una URL técnica             | `ESPECIFICADO`          |
| `NEXO-ROUTE-031` | `/inventory/remissions`             | resolutor compartido      | dirigir a despacho, preparación, tránsito o recepción según función e instancia | `ESPECIFICADO`          |
| `NEXO-ROUTE-032` | `/inventory/remissions/[id]`        | detalle existente         | consultar solicitud y shipment correlacionados conservando retorno              | `ESPECIFICADO`          |
| `NEXO-ROUTE-035` | `/inventory/remissions/fulfillment` | superficie existente      | separar la cola preparadora de la asignación y armado de carga                  | `ESPECIFICADO`          |
| `NEXO-ROUTE-036` | `/inventory/remissions/prepare`     | entrada de preparación    | entregar únicamente cantidades ready al despacho                                | `REFERENCIA_ANTERIOR`   |
| `NEXO-ROUTE-034` | `/inventory/remissions/conductor`   | entrada de transporte     | recibir handoff después del despacho; no crear ni confirmar la carga            | `HANDOFF_POSTERIOR`     |
| `NEXO-ROUTE-038` | `/inventory/remissions/transit`     | paso de transporte        | consumir shipment despachado en `NEXO-UX-012`                                   | `HANDOFF_POSTERIOR`     |
| `NEXO-ROUTE-037` | `/inventory/remissions/receive`     | entrada de recepción      | permanecer downstream y no recibir shipment no despachado                       | `FUERA_DE_ALCANCE`      |
| `NEXO-ROUTE-052` | `/inventory/stock`                  | referencia de existencias | consulta contextual; no corregir stock dentro del despacho                      | `REFERENCIA_CONTEXTUAL` |
| `NEXO-ROUTE-064` | `/scanner`                          | utilidad contextual       | escanear shipment, unidad, producto, sello o vehículo y retornar al paso        | `UTILIDAD_OCULTA`       |

Reconciliación:

```text
EXPECTED_RELATED_ROUTES = 10
MATERIALIZED_RELATED_ROUTES = 10
MISSING_RELATED_ROUTES = 0
DUPLICATE_RELATED_ROUTES = 0
NEW_ROUTE_IDENTITIES = 0
```

No se crea una URL nueva por esta tarea. La implementación deberá converger la creación de shipment actualmente alojada en fulfillment con una experiencia de despacho separada semánticamente, aunque reutilice componentes o rutas existentes.

---

#### 23. Conectividad, dispositivo y recuperación

| Situación                          | Comportamiento                                | Acción prohibida              |
| ---------------------------------- | --------------------------------------------- | ----------------------------- |
| sin conexión antes de asignar      | mostrar datos cacheados solo como referencia  | asignar cantidad              |
| pérdida durante carga              | conservar checklist local permitido           | afirmar carga verificada      |
| reconexión                         | revalidar shipment, claim, versiones y saldos | sincronizar ciegamente        |
| dispositivo compartido             | identificar actor efectivo en cada mutación   | atribuir al dispositivo       |
| cambio de actor                    | transferir claim y revisar carga              | heredar confirmación final    |
| escaneo duplicado                  | detectar identidad ya procesada               | sumar cantidad de nuevo       |
| timeout de asignación              | consultar receipt de asignación               | crear segundo shipment        |
| timeout de despacho                | consultar intención final                     | repetir descuento             |
| contexto revocado                  | bloquear y conservar estado autoritativo      | terminar con permiso anterior |
| fallo de batería después del sello | recuperar shipment sealed y claim             | asumir despacho confirmado    |

No existe despacho offline por defecto. Una futura política offline deberá garantizar firma, límite de riesgo, inventario reservado, reconciliación, idempotencia y evidencia antes de habilitar una confirmación diferida.

---

#### 24. Autorización, seguridad y privacidad

1. el servidor revalida actor, contexto, permiso, recurso, estado y versión en creación, asignación, sello, custodia y despacho;
2. el permiso global de lectura no concede mutación;
3. `prepare` no sustituye `dispatch`, y `transit` no sustituye `dispatch`;
4. los parámetros de URL, campos ocultos y botones visibles no conceden autoridad;
5. IDs de shipment, fulfillment, pick, unidad, paquete, lote, sello, vehículo y actor son no confiables;
6. RLS, grants y RPC deberán reproducir la misma frontera exacta;
7. la firma de dispositivo compartido se vincula al actor humano, intención y receipt;
8. PIN, credenciales y secretos no aparecen en evidencia o logs;
9. una denegación no revela stock, rutas ni cargas de otro territorio;
10. el manifiesto minimiza datos personales y muestra solo lo necesario para custodia;
11. toda reapertura, cancelación, desasignación y toma de claim conserva auditoría;
12. el receipt es inmutable y no se elimina por corrección posterior;
13. el evento de integración a tránsito usa outbox e idempotencia;
14. ninguna integración puede volver a aplicar la salida de inventario.

---

#### 25. Evidencia técnica actual y diagnóstico

| Fuente actual                                         | Evidencia verificable                                                                                                                     | Estado frente al diseño    | Decisión                                                                                      |
| ----------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- | -------------------------- | --------------------------------------------------------------------------------------------- |
| `src/app/inventory/remissions/fulfillment/page.tsx`   | combina “Preparar necesidades y armar envíos” en una misma superficie y agrupa saldo ready por destino                                    | `IMPLEMENTADO_PARCIAL`     | conservar la verdad de fulfillment, pero separar intención preparadora de despacho            |
| `src/app/inventory/remissions/fulfillment/actions.ts` | `createShipmentFromReady` exige permiso de tránsito, consulta saldo ready y llama a un RPC de asignación                                  | `BRECHA_DE_AUTORIZACION`   | usar permiso exacto de despacho y revalidación equivalente en todas las capas                 |
| `create_remission_shipment_from_fulfillments`         | crea shipment `loading`, bloquea fulfillments, asigna cantidades y evita sobreasignación mediante `for update`                            | `IMPLEMENTADO_PARCIAL`     | conservar atomicidad de asignación y añadir versión, intención, receipt y snapshots completos |
| `create_remission_shipment_from_fulfillments`         | autoriza `all_sites`, `transit` o `prepare`, mientras la Server Action exige `transit`                                                    | `BRECHA_CRITICA`           | eliminar divergencia UI-servidor-RPC y exigir la capacidad aprobada                           |
| `create_remission_shipment_from_fulfillments`         | recibe `p_dispatch_run_id`, pero la acción inspeccionada siempre envía `null`                                                             | `IMPLEMENTADO_PARCIAL`     | integrar salida logística, vehículo y custodio cuando sean aplicables                         |
| `remission_dispatch_runs`                             | representa draft, loading, sealed, departed, cancelled y closed                                                                           | `IMPLEMENTADO_PARCIAL`     | separar run de shipment y preservar versión y eventos                                         |
| `remission_shipments`                                 | representa draft, loading, sealed, in_transit, arrived, partial_receipt, received, exception, cancelled y closed                          | `COMPATIBILIDAD_REQUERIDA` | proyectar estados sin colapsar sello, custodia, despacho y tránsito                           |
| `remission_shipment_items`                            | conserva fulfillment, request item, producto, origen, destino y cantidad                                                                  | `IMPLEMENTADO_PARCIAL`     | añadir snapshot físico, versión y vínculo a prepared units o picks                            |
| `src/app/inventory/remissions/[id]/detail-actions.ts` | `submitTransitChecklist` puede pasar directamente de `preparing` a `in_transit`                                                           | `BRECHA_CRITICA`           | interponer shipment, sello, custodia y receipt de despacho                                    |
| `src/app/inventory/remissions/[id]/detail-actions.ts` | la misma acción aplica salida de stock y consumo de paquetes productivos al iniciar tránsito                                              | `COMPATIBILIDAD_REQUERIDA` | mover el efecto autoritativo al comando de despacho y prohibir doble aplicación en tránsito   |
| `apply_restock_shipment_from_picks`                   | valida stock y evita una segunda `transfer_out` por request                                                                               | `IMPLEMENTADO_PARCIAL`     | operar por shipment y líneas, no por encabezado completo, con intención y receipt             |
| modelo legacy de `restock_request_items`              | `prepared_quantity` y `shipped_quantity` pueden permanecer acoplados                                                                      | `BRECHA_CRITICA`           | despacho será el único escritor del hecho enviado                                             |
| sello y custodia actuales                             | las tablas inspeccionadas contienen timestamps y estados, pero no evidencian contrato completo de sello versionado y aceptación bilateral | `NO_IMPLEMENTADO_COMPLETO` | crear identidades, versiones, evidencia y transiciones auditables                             |
| receipt de despacho                                   | no existe evidencia inspeccionada de receipt persistente consultable por intención para la salida                                         | `NO_IMPLEMENTADO`          | crear ledger de intención y receipt atómico                                                   |

No se modifica código en esta tarea. El diagnóstico define el comportamiento objetivo y las incompatibilidades que el paquete de implementación deberá resolver.

---

#### 26. `NEXO-REMISSION-DISPATCH-IMPLEMENTATION-HANDOFF-001`

Una implementación posterior deberá, como mínimo:

1. separar permisos `prepare`, `dispatch` y `transit` en interfaz, Server Actions, APIs, RPC y RLS;
2. conservar fulfillments y shipments existentes sin inventar una segunda verdad;
3. añadir control de versión e intención idempotente a asignación, sello, custodia y despacho;
4. materializar identidad y evidencia de sello;
5. materializar handoff de custodia con entrega y aceptación;
6. convertir el comando final en transacción única para stock, paquetes, cantidades, shipment, receipt y outbox;
7. mover el efecto de salida fuera del inicio de tránsito legacy;
8. evitar doble descuento durante convivencia de rutas;
9. preservar snapshots de UOM, lote, paquete, LOC, posición, vehículo y actor;
10. implementar liberación de asignación y cancelación antes del despacho;
11. mantener receipt inmutable y movimientos compensatorios posteriores;
12. generar tipos y contratos compartidos cuando el esquema cambie;
13. versionar toda modificación Supabase desde `vento-shell`;
14. incluir rollback, compatibilidad, RLS, grants, pruebas y despliegue autorizado.

##### 26.1. Rollback funcional esperado

Antes del despacho confirmado, el rollback puede liberar asignaciones y cancelar un shipment mediante eventos auditados. Después del despacho, el rollback técnico no borra hechos; exige transición compensatoria y conciliación.

##### 26.2. Compatibilidad

Durante migración:

- una solicitud legacy puede proyectarse a fulfillments y shipments, pero no disparar ambos carriles;
- cada request o shipment tendrá un único escritor autoritativo de salida;
- los flags temporales serán explícitos, versionados y observables;
- los receipts permiten distinguir operaciones nuevas de efectos legacy;
- la desactivación del carril anterior requiere reconciliación de datos y pruebas de no duplicidad.

---

#### 27. Decisiones aprobadas

1. `NEXO-UX-011` diseña despacho; tránsito permanece en `NEXO-UX-012`;
2. despacho consume saldo ready confirmado y no reabre la solicitud;
3. existen exactamente dieciocho pasos y veinticuatro estados de interfaz;
4. se reconciliaron trece estados empresariales y técnicos;
5. el permiso exacto es `nexo.inventory.remissions.dispatch`;
6. preparación, despacho y tránsito son capacidades distintas;
7. la cola opera por saldo ready no asignado, origen y destino;
8. asignar cantidad no descuenta inventario;
9. un fulfillment puede dividirse entre varios shipments;
10. un shipment puede consolidar varias solicitudes con un único origen y destino;
11. la consolidación conserva identidad por línea y no reescribe demanda;
12. la sobreasignación se evita de forma atómica y concurrente;
13. carga física, carga verificada, sello, custodia y despacho son hechos separados;
14. el sello inmoviliza el payload, pero no confirma salida;
15. toda reapertura invalida sello, fingerprint y aceptación de custodia;
16. asignar conductor no equivale a aceptación de custodia;
17. la custodia registra entrega y aceptación separadas;
18. el punto autoritativo de salida es `DISPATCH_CONFIRMED`;
19. el descuento de stock y consumo de paquetes ocurren solo en el comando final;
20. el comando final es atómico, idempotente y recuperable por intención;
21. un fallo revierte shipment, cantidades, paquetes, movimientos y receipt;
22. el receipt es inmutable y conserva el snapshot completo;
23. se materializaron treinta y cuatro validaciones;
24. doce familias de excepción tienen efecto y propietario;
25. un cambio posterior al despacho se corrige con excepción o movimiento compensatorio;
26. el handoff a tránsito no inventa ubicación ni avance;
27. tránsito no vuelve a descontar inventario;
28. las rutas actuales se reutilizan y no se crean URLs;
29. fulfillment y detalle legacy deben converger sobre un único escritor de salida;
30. toda modificación futura de Supabase se crea y versiona desde `vento-shell`.

---

#### 28. Pendientes materializados y propietarios

| Pendiente                                | Estado                   | Propietario                     | Tarea o puerta                   | Condición de salida                                         |
| ---------------------------------------- | ------------------------ | ------------------------------- | -------------------------------- | ----------------------------------------------------------- |
| permiso atómico de despacho              | `ESPECIFICADO`           | autorización y NEXO             | implementación E5                | catálogo, grants, RLS y pruebas coherentes                  |
| receipt de asignación                    | `ESPECIFICADO`           | NEXO/Data                       | implementación de shipment       | intención, versión y recuperación probadas                  |
| identidad de sello                       | `ESPECIFICADO`           | NEXO                            | implementación E5                | entidad, evidencia, unicidad y reapertura                   |
| handoff bilateral de custodia            | `ESPECIFICADO`           | NEXO y logística                | implementación E5                | entrega, aceptación, rechazo y firma válidos                |
| comando atómico de despacho              | `ESPECIFICADO`           | `vento-shell` y paquete E5 NEXO | migración/RPC                    | stock, paquetes, shipment y receipt todo o nada             |
| separación del inicio de tránsito legacy | `ESPECIFICADO`           | paquete E5 NEXO                 | convergencia de carriles         | un único escritor de salida y cero doble descuento          |
| modelo de vehículo y capacidad completo  | `PENDIENTE_DE_EVIDENCIA` | NEXO/Activos                    | tareas propietarias de activos   | identidad, disponibilidad y capacidad aprobadas             |
| impresión de manifiesto o etiqueta       | `FUERA_DE_ALCANCE`       | impresión NEXO                  | tareas propietarias de impresión | contrato de plantilla, dispositivo y reimpresión            |
| tránsito                                 | `RESERVADO`              | `NEXO-UX-012`                   | siguiente tarea                  | seguimiento e incidentes especificados                      |
| pruebas operativas en dispositivo        | `PENDIENTE_DE_EVIDENCIA` | UX-QA y paquete E5 NEXO         | piloto autorizado                | evidencia reproducible con escáner y dispositivo compartido |

Ningún pendiente queda sin propietario, tarea o condición de salida.

---

#### 29. Requisitos de prueba creados

Esta tarea crea:

- `TREQ-NEXO-111`;
- `TREQ-NEXO-112`;
- `TREQ-NEXO-113`;
- `TREQ-NEXO-114`;
- `TREQ-NEXO-115`;
- `TREQ-NEXO-116`;
- `TREQ-NEXO-117`;
- `TREQ-NEXO-118`;
- `TREQ-NEXO-119`;
- `TREQ-NEXO-120`.

No modifica ni obsoleta requisitos históricos. El detalle canónico reside en el registro completo 04A actualizado coordinadamente con esta tarea.

---

#### 30. Criterios de aceptación

La tarea se considera documentalmente completa cuando:

1. existe una frontera inequívoca entre preparación, despacho y tránsito;
2. los dieciocho pasos están materializados sin faltantes ni duplicados;
3. los veinticuatro estados de interfaz poseen condición y acción segura;
4. los trece estados empresariales y técnicos están reconciliados;
5. la cola opera por saldo ready no asignado, origen y destino;
6. el permiso de despacho está separado de preparación y tránsito;
7. asignación, liberación y cancelación preservan cantidades e historia;
8. la consolidación admite varias solicitudes sin mezclar origen o destino;
9. la carga física se verifica contra unidad, pick, UOM, lote, paquete y LOC;
10. la medición variable no excede ready ni crea ajustes silenciosos;
11. vehículo, capacidad y compatibilidad tienen tratamiento explícito;
12. sello, reapertura y custodia tienen identidades y versiones;
13. el descuento de inventario ocurre solo al confirmar despacho;
14. stock, paquetes, fulfillment, shipment, receipt y outbox son atómicos;
15. las treinta y cuatro validaciones están asignadas a momentos concretos;
16. las doce excepciones tienen efecto, resolución y propietario;
17. idempotencia y recuperación impiden doble descuento;
18. el handoff a `NEXO-UX-012` contiene un shipment inmutable y despachado;
19. las diez rutas relacionadas tienen disposición explícita;
20. el diagnóstico diferencia implementación parcial, brecha y fuera de alcance;
21. los diez requisitos nuevos están incorporados al 04A completo;
22. no se ejecutan cambios físicos ni operaciones remotas;
23. la siguiente tarea permanece reservada.

---

#### 31. Continuidad

**ÚLTIMA TAREA APROBADA:** `NEXO-UX-010 — Diseñar flujo completo de preparación`

**TAREA ACTUAL APROBADA:** `NEXO-UX-011 — Diseñar flujo completo de despacho`

**SIGUIENTE TAREA RESERVADA:** `NEXO-UX-012 — Diseñar flujo completo de tránsito`

`NEXO-UX-012` deberá consumir `NEXO-REMISSION-DISPATCH-TO-TRANSIT-HANDOFF-001`, preservar el receipt de despacho y no volver a descontar inventario, consumir paquetes productivos, editar el shipment sellado ni reinterpretar la custodia aquí confirmada salvo contradicción canónica comprobada.


### ✅ NEXO-UX-012 — Diseñar flujo completo de tránsito

**Estado:** APROBADA
**Tarea anterior:** `NEXO-UX-011 — Diseñar flujo completo de despacho` — APROBADA
**Tarea siguiente:** `NEXO-UX-013 — Diseñar flujo completo de recepción` — RESERVADA
**Tipo de tarea:** documental; diseño funcional completo del inicio operativo del viaje, trabajo asignado, secuencia de paradas, hitos de tránsito, continuidad de custodia, observaciones de ubicación, incidentes, entrega fallida, retorno, arribo, prueba de presentación, transferencia de custodia en destino, idempotencia y handoff a recepción
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/K_NEXO/04_EXPERIENCIA_DE_INVENTARIO_LOGISTICA_Y_ACTIVOS.md`
**Repositorio de aplicación inspeccionado:** `vento-nexo`
**Proceso propietario:** `VPROC-0028 — Abastecer inventario interno de sedes y áreas`
**Permiso exacto de tránsito:** `nexo.inventory.remissions.transit`
**Artefactos producidos:** `NEXO-REMISSION-TRANSIT-FLOW-CONTRACT-001`, `NEXO-REMISSION-TRANSIT-STATE-MACHINE-001`, `NEXO-REMISSION-TRANSIT-STEP-CATALOG-001`, `NEXO-REMISSION-TRANSIT-WORK-QUEUE-CONTRACT-001`, `NEXO-REMISSION-TRANSIT-JOURNEY-ASSIGNMENT-CONTRACT-001`, `NEXO-REMISSION-TRANSIT-START-COMMAND-001`, `NEXO-REMISSION-TRANSIT-STOP-PROGRESS-CONTRACT-001`, `NEXO-REMISSION-TRANSIT-LOCATION-OBSERVATION-CONTRACT-001`, `NEXO-REMISSION-TRANSIT-CUSTODY-CONTINUITY-CONTRACT-001`, `NEXO-REMISSION-TRANSIT-INCIDENT-CONTRACT-001`, `NEXO-REMISSION-TRANSIT-FAILED-DELIVERY-RETURN-CONTRACT-001`, `NEXO-REMISSION-TRANSIT-ARRIVAL-PROOF-CONTRACT-001`, `NEXO-REMISSION-TRANSIT-TO-RECEPTION-HANDOFF-001`, `NEXO-REMISSION-TRANSIT-IDEMPOTENCY-RECEIPT-001`, `NEXO-REMISSION-TRANSIT-ROUTE-DISPOSITION-001` y `NEXO-REMISSION-TRANSIT-IMPLEMENTATION-HANDOFF-001`
**Decisiones consumidas:** `UX-BASE-001` a `UX-BASE-005`; `UX-STATION-010` a `UX-STATION-012`; `NEXO-DOM-001`; `NEXO-UX-001` a `NEXO-UX-011`; `NEXO-DRIVER-HOME-CONTRACT-001`; `NEXO-DRIVER-WORK-QUEUE-CATALOG-001`; `NEXO-DRIVER-STAGE-PROJECTION-MATRIX-001`; `NEXO-TASK-NAVIGATION-CONTRACT-001`; `NEXO-ROUTE-TO-TASK-REGISTRY-001`; `NEXO-REMISSION-DISPATCH-TO-TRANSIT-HANDOFF-001`; `NEXO-REMISSION-DISPATCH-IDEMPOTENCY-RECEIPT-001`; contratos de autorización, contexto activo, dispositivos compartidos, evidencia, impresión y requisitos `TREQ-*` vigentes
**Cambios físicos autorizados:** ninguno; no modifica código, rutas, tablas, RPC, migraciones, RLS, permisos, datos, inventario, paquetes, shipments, receipts, navegación desplegada, configuración ni ambientes remotos

---

#### 1. Propósito

Definir de extremo a extremo cómo una carga ya despachada y bajo custodia se
convierte en un viaje operativo trazable, progresa por una secuencia autorizada,
trata incidentes sin perder la cadena de custodia y llega al destino con un
handoff consumible por recepción.

El tránsito consume un despacho confirmado. No vuelve a materializar la salida
de inventario, no cambia el contenido del shipment, no consume paquetes
productivos y no registra cantidades recibidas.

La regla canónica es:

```text
SHIPMENT DESPACHADO E INMUTABLE
+ RECEIPT DE DESPACHO VERIFICABLE
+ SELLO Y CUSTODIA VIGENTES
+ ACTOR, VEHICULO Y VIAJE ASIGNADOS
+ RUTA Y PARADAS VERSIONADAS
+ INICIO OPERATIVO IDEMPOTENTE
+ HITOS ORDENADOS Y TRAZABLES
+ INCIDENTES E INSTRUCCIONES ESTRUCTURADOS
+ ARRIBO Y PRESENTACION EN DESTINO
+ TRANSFERENCIA DE CUSTODIA DOCUMENTADA
→ HANDOFF CONSUMIBLE POR RECEPCION
```

La frontera obligatoria es:

```text
DISPATCH_CONFIRMED ≠ TRANSIT_STARTED
TRANSIT_STARTED ≠ VEHICLE_MOVING
GPS_OBSERVED ≠ STOP_ARRIVED
STOP_ARRIVED ≠ STOP_COMPLETED
DESTINATION_ARRIVED ≠ DELIVERY_PRESENTED
DELIVERY_PRESENTED ≠ DESTINATION_CUSTODY_ACCEPTED
DESTINATION_CUSTODY_ACCEPTED ≠ INVENTORY_RECEIVED
INCIDENT_REPORTED ≠ INCIDENT_RESOLVED
RETURN_AUTHORIZED ≠ RETURN_RECEIVED
```

`DISPATCH_CONFIRMED` conserva la salida logística e inventarial aprobada en
`NEXO-UX-011`. `TRANSIT_STARTED` activa el seguimiento operativo del viaje y
su secuencia; no vuelve a descontar inventario ni altera el receipt de despacho.

---

#### 2. Resultado material

Se aprueban dieciséis artefactos documentales consumibles:

1. `NEXO-REMISSION-TRANSIT-FLOW-CONTRACT-001`, que fija frontera, autoridad,
   entrada, resultado y lenguaje del tránsito;
2. `NEXO-REMISSION-TRANSIT-STATE-MACHINE-001`, que separa journey, shipment,
   parada, incidente, custodia, arribo y handoff;
3. `NEXO-REMISSION-TRANSIT-STEP-CATALOG-001`, que materializa veinte pasos y
   sus decisiones;
4. `NEXO-REMISSION-TRANSIT-WORK-QUEUE-CONTRACT-001`, que consume las ocho
   colas `DRVQ-*` aprobadas y define elegibilidad, prioridad y reclamo;
5. `NEXO-REMISSION-TRANSIT-JOURNEY-ASSIGNMENT-CONTRACT-001`, que gobierna
   actor, vehículo, dispatch run, shipments, ruta, paradas y versiones;
6. `NEXO-REMISSION-TRANSIT-START-COMMAND-001`, que define el inicio operativo
   autoritativo e idempotente sin efectos de inventario;
7. `NEXO-REMISSION-TRANSIT-STOP-PROGRESS-CONTRACT-001`, que materializa
   llegada, resultado y salida de cada parada en orden;
8. `NEXO-REMISSION-TRANSIT-LOCATION-OBSERVATION-CONTRACT-001`, que separa
   observación geográfica de autoridad empresarial;
9. `NEXO-REMISSION-TRANSIT-CUSTODY-CONTINUITY-CONTRACT-001`, que conserva la
   cadena de custodia y sus transferencias explícitas;
10. `NEXO-REMISSION-TRANSIT-INCIDENT-CONTRACT-001`, que define catorce
    familias de incidente, severidad, bloqueo, escalamiento y propietario;
11. `NEXO-REMISSION-TRANSIT-FAILED-DELIVERY-RETURN-CONTRACT-001`, que gobierna
    receptor ausente, rechazo, espera, reintento, retorno y destino alterno;
12. `NEXO-REMISSION-TRANSIT-ARRIVAL-PROOF-CONTRACT-001`, que separa arribo,
    presentación, prueba mínima y aceptación de custodia;
13. `NEXO-REMISSION-TRANSIT-TO-RECEPTION-HANDOFF-001`, que entrega a
    `NEXO-UX-013` un shipment presentado y una custodia de destino verificable;
14. `NEXO-REMISSION-TRANSIT-IDEMPOTENCY-RECEIPT-001`, que impide hitos,
    transferencias e incidentes duplicados y permite recuperar resultados;
15. `NEXO-REMISSION-TRANSIT-ROUTE-DISPOSITION-001`, que decide diez
    superficies existentes sin inventar URLs;
16. `NEXO-REMISSION-TRANSIT-IMPLEMENTATION-HANDOFF-001`, que separa el diseño
    aprobado de los cambios físicos posteriores.

| Elemento                                       | Total esperado | Total materializado | Faltantes | Duplicados |
| ---------------------------------------------- | -------------: | ------------------: | --------: | ---------: |
| Pasos del flujo                                |             20 |                  20 |         0 |          0 |
| Estados de interfaz                            |             28 |                  28 |         0 |          0 |
| Estados empresariales y técnicos reconciliados |             18 |                  18 |         0 |          0 |
| Colas de trabajo heredadas                     |              8 |                   8 |         0 |          0 |
| Familias de incidente                          |             14 |                  14 |         0 |          0 |
| Validaciones materializadas                    |             36 |                  36 |         0 |          0 |
| Disposiciones de rutas relacionadas            |             10 |                  10 |         0 |          0 |
| Requisitos de prueba nuevos o modificados      |             12 |                  12 |         0 |          0 |

El resultado queda `ESPECIFICADO`. No declara el flujo `IMPLEMENTADO`,
`VALIDADO`, desplegado ni probado en ruta real.

---

#### 3. Alcance

##### 3.1. Incluido

- consumo del handoff aprobado por `NEXO-UX-011`;
- resolución de actor, sesión, turno, check-in, dispositivo, permiso, custodia,
  vehículo, dispatch run, journey, ruta y shipments asignados;
- cola del conductor limitada a trabajo propio y vigente;
- agrupación de uno o más shipments despachados en un journey compatible;
- secuencia finita y versionada de paradas;
- inicio operativo idempotente del tránsito;
- llegada, resultado y salida de cada parada;
- observaciones eventuales de ubicación y geocerca sin convertirlas en
  autorización ni prueba única;
- continuidad y transferencia explícita de custodia;
- reporte de incidentes, severidad, bloqueo y escalamiento;
- instrucciones autorizadas de espera, continuación, transferencia, retorno o
  destino alterno;
- arribo al destino, presentación de carga, verificación de sello y prueba
  mínima;
- aceptación de custodia por el destino como hecho separado de recepción;
- handoff a `NEXO-UX-013` sin registrar inventario recibido;
- idempotencia, control de versión, receipts y recuperación ante resultado
  desconocido;
- diagnóstico del código, esquema y migraciones actuales.

##### 3.2. Excluido

- crear o modificar la solicitud original;
- preparar, asignar, cargar, sellar o despachar mercancía;
- volver a aplicar movimientos de salida, consumo de paquetes o cantidades
  despachadas;
- cambiar producto, cantidad, UOM, lote, paquete, origen, destino o contenido
  del shipment;
- configurar rutas maestras, vehículos o políticas logísticas;
- decidir unilateralmente la resolución supervisora de un incidente;
- registrar cantidades recibidas, aceptadas, rechazadas o en cuarentena;
- publicar inventario en destino o ejecutar putaway;
- cerrar diferencias económicas, reclamaciones o responsabilidades;
- habilitar seguimiento continuo de ubicación sin controles de finalidad,
  retención y dispositivo;
- implementar componentes, tablas, RPC, migraciones, RLS, eventos, tipos o
  pruebas;
- ejecutar DDL, DML, backfills, despliegues o cambios remotos.

---

#### 4. `NEXO-REMISSION-TRANSIT-FLOW-CONTRACT-001`

##### 4.1. Lenguaje humano

La experiencia utilizará:

```text
INICIAR RUTA
SIGUIENTE PARADA
CONFIRMAR LLEGADA
REGISTRAR NOVEDAD
CONTINUAR RUTA
LLEGUE AL DESTINO
PRESENTAR CARGA
ENTREGAR CUSTODIA
ENTREGAR A RECEPCION
```

No utilizará “recibido”, “aceptado en inventario”, “ubicado”, “diferencia
cerrada” o “ruta completada” antes del hecho correspondiente.

El resultado exitoso del tránsito es:

```text
RECEPTION_HANDOFF_READY
+ transit_journey_id
+ transit_receipt_id
+ shipment_ids[]
+ destination_arrival
+ proof_records[]
+ destination_custody_handoff
+ open_incidents[]
+ immutable_dispatch_receipts[]
+ reception_handoff_version
```

##### 4.2. Actor y autoridad

El actor ordinario deberá:

- estar autenticado y vinculado a un actor laboral vigente;
- tener sesión personal o identificación humana vigente en dispositivo
  compartido;
- poseer `nexo.inventory.remissions.transit` para el journey y territorio
  aplicables;
- estar asignado al journey o recibir una transferencia de custodia válida;
- operar un vehículo o medio compatible cuando la política lo exija;
- tener turno, check-in y contexto operativo vigentes cuando apliquen;
- actuar sobre shipments ya `DISPATCH_CONFIRMED`;
- usar intenciones no consumidas con otro payload;
- revalidar autoridad, asignación, custodia, estado y versión en cada mutación.

El permiso de tránsito no concede despacho, recepción, ajuste, configuración,
resolución supervisora, cambio de ruta maestra ni acceso a journeys ajenos.

##### 4.3. Autoridad por etapa

| Hecho                                  | Conductor o custodio          | Despacho origen              | Supervisor                  | Receptor destino             |
| -------------------------------------- | ----------------------------- | ---------------------------- | --------------------------- | ---------------------------- |
| consultar receipt de despacho asignado | sí                            | consulta                     | consulta territorial        | consulta mínima al presentar |
| iniciar journey                        | sí, con asignación y custodia | no por defecto               | toma autorizada excepcional | no                           |
| confirmar parada                       | sí                            | no                           | monitorea                   | no                           |
| registrar incidente                    | sí                            | puede complementar en origen | sí, investiga y decide      | puede reportar al presentar  |
| resolver incidente                     | no por defecto                | según causa                  | sí, con permiso exacto      | según causa y etapa          |
| cambiar ruta o destino                 | no                            | no                           | solo instrucción autorizada | no                           |
| presentar carga                        | sí                            | no                           | monitorea                   | coteja                       |
| aceptar custodia de destino            | entrega                       | no                           | no por defecto              | sí, con identidad propia     |
| registrar recepción                    | no                            | no                           | no por tránsito             | sí, en `NEXO-UX-013`         |

La misma persona puede poseer más de una función, pero cada función revalida su
permiso y contexto. Por defecto no puede auto-recibir una carga que permanece
bajo su propia custodia.

---

#### 5. Entidades canónicas y decisiones por identidad

| Entidad                  | Identidad estable                | Propiedad                          | Decisión en tránsito         | Prohibición                             |
| ------------------------ | -------------------------------- | ---------------------------------- | ---------------------------- | --------------------------------------- |
| receipt de despacho      | `dispatch_receipt_id`            | salida e inventario origen         | entrada inmutable            | no se recalcula ni modifica             |
| shipment                 | `shipment_id`                    | contenido físico por destino       | carga transportada           | no se editan líneas ni cantidades       |
| dispatch run             | `dispatch_run_id`                | agrupación logística de origen     | referencia de salida         | no sustituye journey                    |
| journey                  | `transit_journey_id`             | viaje operativo versionado         | unidad de seguimiento        | no se infiere de una URL o estado       |
| asignación               | `transit_assignment_id`          | actor, vehículo y vigencia         | habilita trabajo propio      | no concede permisos por sí sola         |
| parada                   | `transit_stop_id`                | secuencia y destino finitos        | unidad de progreso           | no es texto libre ni geocerca solamente |
| evento de tránsito       | `transit_event_id`               | hito de journey o parada           | evidencia de progreso        | no se reescribe                         |
| intención                | `transit_intent_id`              | comando idempotente                | controla cada mutación       | no se reutiliza con otro payload        |
| receipt de tránsito      | `transit_receipt_id`             | resultado de inicio o evento       | prueba consultable           | no se reconstruye desde la interfaz     |
| observación de ubicación | `location_observation_id`        | dato contextual                    | evidencia auxiliar           | no ejecuta transiciones                 |
| incidente                | `transit_incident_id`            | novedad estructurada               | bloquea, escala o condiciona | no se resuelve con nota libre           |
| entrada de custodia      | `custody_chain_entry_id`         | actor, etapa y transferencia       | preserva cadena              | no se presume por proximidad            |
| prueba de presentación   | `proof_record_id`                | evidencia mínima de entrega física | sustenta handoff             | no equivale a recepción                 |
| handoff de destino       | `destination_custody_handoff_id` | entrega y aceptación bilaterales   | transfiere custodia          | no publica inventario                   |
| handoff a recepción      | `reception_handoff_id`           | entrada consumible por receptor    | cierra tránsito funcional    | no resuelve cantidades recibidas        |

Cada identidad conserva versión, actor, dispositivo, timestamps de servidor,
correlación y estado. Un código visual, coordenada, fotografía o URL es una
representación, no la identidad empresarial.

---

#### 6. Entrada contractual desde despacho

El tránsito solo admite un shipment cuando el handoff contiene o permite
resolver de forma autoritativa:

- `shipment_id`, `shipment_code` y versión inmutable;
- `dispatch_receipt_id` y `dispatch_intent_id`;
- origen, destino y `dispatched_at`;
- actor de despacho;
- sello, fingerprint y versión;
- handoff de custodia aceptado y custodio vigente;
- vehículo o medio de transporte observado;
- líneas y cantidades efectivamente despachadas;
- efectos de fulfillment, paquetes, lotes y movimientos ya consumados;
- excepciones abiertas no bloqueantes;
- `transit_handoff_version`;
- ausencia de revocación, duplicidad o conflicto terminal.

La asignación de journey, ruta y paradas se resuelve como proyección separada.
No se modifica el payload aprobado por `NEXO-UX-011`. Si no existe una
asignación inequívoca y vigente, el shipment queda en `ASSIGNMENT_PENDING` y no
puede iniciar seguimiento operativo.

El tránsito no corrige un handoff incompleto. Devuelve un bloqueo estructurado
al propietario correspondiente y conserva el receipt original.

---

#### 7. `NEXO-REMISSION-TRANSIT-WORK-QUEUE-CONTRACT-001`

Se consumen exactamente las ocho colas aprobadas en
`NEXO-DRIVER-WORK-QUEUE-CATALOG-001`:

| Cola                    | Elegibilidad en esta tarea                                 | Acción primaria                          | Resultado                       |
| ----------------------- | ---------------------------------------------------------- | ---------------------------------------- | ------------------------------- |
| `DRVQ-RECOGIDA`         | shipment despachado, asignación vigente y handoff completo | revisar carga asignada                   | listo para iniciar o bloqueo    |
| `DRVQ-ACEPTAR_CUSTODIA` | transferencia pendiente antes del inicio                   | aceptar o rechazar custodia              | custodia vigente o excepción    |
| `DRVQ-TRANSITO`         | journey iniciado bajo custodia del actor                   | continuar siguiente tarea                | parada, incidente o arribo      |
| `DRVQ-PARADA`           | existe siguiente parada vigente                            | confirmar llegada, resultado o salida    | progreso versionado             |
| `DRVQ-ENTREGA`          | destino alcanzado y carga presentada                       | entregar custodia                        | handoff aceptado o fallido      |
| `DRVQ-INCIDENTE`        | incidente abierto relacionado con trabajo propio           | completar evidencia o seguir instrucción | bloqueo, continuación o retorno |
| `DRVQ-RETORNO`          | existe instrucción autorizada de retorno                   | continuar retorno                        | arribo y handoff de retorno     |
| `DRVQ-BLOQUEO`          | conflicto de versión, custodia, seguridad o conectividad   | reconciliar                              | causa resuelta o escalada       |

Orden recomendado:

1. seguridad personal, accidente, pérdida o ruptura de custodia;
2. incidentes críticos y journeys bloqueados;
3. handoffs de destino pendientes con el actor presente;
4. siguiente parada de un journey activo;
5. journeys listos para iniciar dentro de su ventana;
6. retornos autorizados;
7. documentación o evidencia incompleta;
8. trabajo ordinario por ventana y antigüedad.

La cola muestra únicamente trabajo relacionado con el actor, custodia,
asignación, vehículo o journey vigentes. Una sede autorizada no concede acceso
a todas las rutas de esa sede.

El reclamo de una tarea posee actor, dispositivo, versión, inicio, expiración,
renovación y toma administrativa auditada. Perder el reclamo no transfiere la
custodia ni revierte un evento confirmado.

---

#### 8. `NEXO-REMISSION-TRANSIT-JOURNEY-ASSIGNMENT-CONTRACT-001`

##### 8.1. Composición

Un journey puede transportar uno o más shipments cuando:

- todos están `DISPATCH_CONFIRMED`;
- comparten custodio y vehículo compatibles;
- pertenecen al dispatch run o asignación autorizada;
- cada shipment conserva un único destino;
- la secuencia de paradas contiene todos los destinos exactamente una vez o
  mediante una relación explícita cuando varias cargas comparten parada;
- ninguna carga aparece en otro journey activo;
- no existe incidente bloqueante ni transferencia de custodia incompleta.

##### 8.2. Campos mínimos

```text
transit_journey_id
journey_version
transit_assignment_id
assigned_actor_id
vehicle_ref
origin_site_id
route_plan_id
route_plan_version
shipment_ids[]
stop_ids[]
planned_start_at
valid_from
valid_until
assignment_state
```

`vehicle_ref` deberá resolverse contra la identidad canónica disponible en el
subdominio propietario. Una etiqueta libre puede mostrarse como snapshot, pero
no prueba por sí sola el vehículo físico.

##### 8.3. Ruta y paradas

Cada parada declara:

```text
transit_stop_id
sequence_number
stop_kind
site_id_or_typed_physical_point
shipment_ids[]
planned_window
required_actions[]
stop_version
```

Reglas:

- la secuencia es finita, única y versionada;
- el cliente no puede insertar, eliminar, reordenar o sustituir paradas;
- una geocerca no sustituye la identidad de sede o punto físico;
- una parada de destino solo relaciona shipments cuyo destino coincide;
- un cambio crea una nueva versión y revalida actor, vehículo, custodia,
  ventanas e incidentes;
- un cambio posterior al inicio exige instrucción autorizada y conserva la
  versión anterior;
- una parada futura no concede acceso a datos ajenos a los shipments asignados.

##### 8.4. Reasignación

Antes de `TRANSIT_STARTED`, una asignación puede cancelarse o sustituirse sin
cambiar el receipt de despacho. Después del inicio, todo cambio de actor o
vehículo exige:

- motivo estructurado;
- autoridad competente;
- cierre de la asignación anterior;
- transferencia explícita de custodia;
- nueva versión de journey;
- invalidación de caché, reclamos e intenciones pendientes;
- confirmación del actor receptor de custodia;
- conservación de la cadena histórica.

---

#### 9. `NEXO-REMISSION-TRANSIT-STEP-CATALOG-001`

| Paso     | Nombre                     | Entrada                     | Acción principal                                                              | Salida                             | Escritura autorizada                |
| -------- | -------------------------- | --------------------------- | ----------------------------------------------------------------------------- | ---------------------------------- | ----------------------------------- |
| `TRN-01` | resolver contexto          | entrada task-first          | resolver actor, sesión, permiso, dispositivo y territorio                     | contexto válido o denegación       | ninguna                             |
| `TRN-02` | cargar trabajo asignado    | contexto válido             | consultar journeys, shipments y colas propias                                 | cola versionada                    | ninguna                             |
| `TRN-03` | abrir handoff              | trabajo elegido             | cargar shipment y receipt de despacho                                         | handoff observable                 | ninguna                             |
| `TRN-04` | reconciliar despacho       | handoff                     | verificar contenido, sello, efectos y versión                                 | handoff válido o bloqueo           | evidencia de revisión               |
| `TRN-05` | resolver journey           | handoff válido              | cargar asignación, vehículo, ruta y paradas                                   | journey asignado                   | claim operativo                     |
| `TRN-06` | reconciliar custodia       | journey asignado            | cotejar custodio, actor, vehículo y sello                                     | custodia vigente o conflicto       | aceptación o rechazo cuando aplique |
| `TRN-07` | revisar inicio             | custodia vigente            | mostrar ruta, cargas, paradas, ventanas e incidentes                          | fingerprint de inicio              | borrador local                      |
| `TRN-08` | iniciar tránsito           | revisión válida             | ejecutar comando autoritativo                                                 | `TRANSIT_STARTED` y receipt        | journey, evento, receipt y outbox   |
| `TRN-09` | cargar siguiente parada    | journey activo              | resolver parada vigente y acciones requeridas                                 | tarea de parada                    | ninguna                             |
| `TRN-10` | confirmar llegada          | parada vigente              | registrar arribo con evidencia mínima                                         | `STOP_ARRIVED`                     | evento idempotente                  |
| `TRN-11` | verificar parada           | llegada confirmada          | cotejar identidad, shipments, sello y contexto                                | parada compatible o incidente      | evidencia de parada                 |
| `TRN-12` | registrar resultado        | parada compatible           | registrar acción realizada o imposibilidad                                    | `STOP_COMPLETED` o incidente       | evento y evidencia                  |
| `TRN-13` | confirmar salida           | resultado válido            | cerrar permanencia y avanzar secuencia                                        | `STOP_DEPARTED`                    | evento idempotente                  |
| `TRN-14` | continuar journey          | salida confirmada           | resolver siguiente parada o destino final                                     | nueva tarea                        | ninguna                             |
| `TRN-15` | reportar incidente         | hallazgo en cualquier etapa | clasificar, contener y escalar                                                | incidente abierto                  | incidente y evidencia               |
| `TRN-16` | ejecutar instrucción       | incidente con decisión      | esperar, continuar, transferir, retornar o ir a destino alterno               | journey reanudado o retorno        | instrucción y nueva versión         |
| `TRN-17` | confirmar arribo a destino | parada final                | registrar llegada sin recepción                                               | `DESTINATION_ARRIVED`              | evento idempotente                  |
| `TRN-18` | presentar carga            | arribo válido               | cotejar shipment, sello, receptor y prueba mínima                             | `DELIVERY_PRESENTED`               | prueba de presentación              |
| `TRN-19` | transferir custodia        | presentación válida         | registrar entrega y aceptación o rechazo                                      | custodia destino o entrega fallida | handoff bilateral                   |
| `TRN-20` | entregar a recepción       | custodia aceptada           | emitir handoff consumible por `NEXO-UX-013` y recuperar resultados pendientes | `RECEPTION_HANDOFF_READY`          | receipt y proyección autorizada     |

Una implementación puede combinar pantallas, pero debe conservar las veinte
decisiones, identidades y evidencias. Ninguna ruta legacy puede omitir el
receipt de despacho, la asignación, la custodia o la idempotencia.

---

#### 10. `NEXO-REMISSION-TRANSIT-STATE-MACHINE-001`

| Estado canónico                | Entidad               | Significado                                             | Escritor autorizado           | Transición siguiente                |
| ------------------------------ | --------------------- | ------------------------------------------------------- | ----------------------------- | ----------------------------------- |
| `HANDOFF_READY`                | proyección            | despacho entregó shipment y receipt consumibles         | despacho                      | asignación o bloqueo                |
| `ASSIGNMENT_PENDING`           | journey               | falta actor, vehículo, ruta o relación inequívoca       | logística autorizada          | assigned                            |
| `ASSIGNED`                     | journey               | actor, vehículo, shipments y ruta están vinculados      | asignación autorizada         | start_ready o reasignación          |
| `START_READY`                  | journey               | handoff, custodia, ruta y contexto fueron reconciliados | conductor                     | transit_started                     |
| `TRANSIT_STARTED`              | journey               | seguimiento operativo inició con receipt                | comando de inicio             | en_route                            |
| `EN_ROUTE`                     | journey               | viaje activo entre paradas                              | eventos de tránsito           | stop_pending, exception o destino   |
| `STOP_PENDING`                 | stop                  | parada siguiente resuelta y no alcanzada                | sistema                       | stop_arrived                        |
| `STOP_ARRIVED`                 | stop                  | actor confirmó llegada a parada exacta                  | conductor                     | stop_completed o exception          |
| `STOP_COMPLETED`               | stop                  | acciones requeridas quedaron registradas                | conductor                     | stop_departed                       |
| `STOP_DEPARTED`                | stop                  | salida de la parada quedó confirmada                    | conductor                     | siguiente parada o destino          |
| `DESTINATION_ARRIVED`          | journey/shipment      | carga llegó físicamente al destino                      | conductor                     | delivery_presented                  |
| `DELIVERY_PRESENTED`           | handoff               | carga y sello fueron presentados al receptor            | conductor                     | custody pending                     |
| `DESTINATION_CUSTODY_PENDING`  | handoff               | origen entregó, destino aún no acepta                   | conductor y receptor          | accepted o failed delivery          |
| `DESTINATION_CUSTODY_ACCEPTED` | handoff               | receptor identificado aceptó custodia física            | receptor autorizado           | reception handoff ready             |
| `EXCEPTION_OPEN`               | journey/shipment/stop | incidente activo condiciona el recorrido                | actor autorizado              | instrucción, continuación o retorno |
| `RETURN_AUTHORIZED`            | journey               | existe instrucción versionada de retorno                | supervisor o autoridad exacta | return in progress                  |
| `RETURN_IN_PROGRESS`           | journey               | carga continúa bajo custodia hacia destino autorizado   | conductor                     | arribo y handoff de retorno         |
| `RECEPTION_HANDOFF_READY`      | proyección            | recepción puede iniciar su flujo independiente          | sistema                       | `NEXO-UX-013`                       |

Los estados actuales `preparing`, `in_transit`, `partial`, `arrived`,
`partial_receipt`, `received`, `exception` y `closed` son evidencia técnica y
no sustituyen esta semántica. La implementación deberá proyectarlos sin
colapsar despacho, journey, parada, arribo, custodia y recepción.

`in_transit` no autoriza por sí mismo a un actor, no demuestra una ruta activa,
no prueba movimiento y no permite aplicar nuevamente inventario.

---

#### 11. `NEXO-REMISSION-TRANSIT-START-COMMAND-001`

##### 11.1. Entrada mínima

```text
transit_intent_id
transit_journey_id
expected_journey_version
dispatch_receipt_ids[]
expected_transit_handoff_versions[]
expected_custody_versions[]
route_plan_version
actor_context
client_observed_at
```

Los identificadores enviados por cliente son no confiables y deben resolverse
en servidor.

##### 11.2. Salida mínima

```text
transit_receipt_id
transit_journey_id
journey_version
started_at
started_by
vehicle_snapshot
shipment_ids[]
dispatch_receipt_ids[]
active_stop_id
route_plan_version
custody_chain_version
outbox_event_id
```

##### 11.3. Semántica

- una intención nueva ejecuta como máximo una vez;
- la misma intención y mismo payload devuelve el mismo receipt;
- la misma intención con payload distinto produce conflicto;
- el journey debe estar `START_READY` y no tener otro inicio confirmado;
- cada shipment debe conservar un único journey activo;
- el comando revalida actor, permiso, asignación, vehículo, receipt, sello,
  custodia, ruta, paradas, versiones e incidentes;
- el comando crea el evento de inicio, receipt y outbox en una transacción;
- el comando no actualiza cantidades, stock, paquetes, picks ni movimientos;
- un fallo revierte todo el inicio operativo;
- el receipt se consulta por intención y permanece inmutable.

`TRANSIT_STARTED` puede ocurrir inmediatamente después del despacho, pero sigue
siendo un hecho distinto y recuperable.

---

#### 12. `NEXO-REMISSION-TRANSIT-STOP-PROGRESS-CONTRACT-001`

##### 12.1. Eventos permitidos

```text
STOP_ARRIVE
STOP_COMPLETE
STOP_DEPART
DESTINATION_ARRIVE
```

Cada comando incluye intención, journey, parada, versión esperada, actor,
acción requerida, hora observada, hora de servidor y evidencia mínima.

##### 12.2. Orden

Para cada parada:

```text
STOP_PENDING
→ STOP_ARRIVED
→ STOP_COMPLETED
→ STOP_DEPARTED
```

Reglas:

- no se puede confirmar una parada que no sea la siguiente;
- `STOP_COMPLETE` exige `STOP_ARRIVED` confirmado;
- `STOP_DEPART` exige resultado registrado o excepción con instrucción;
- una parada no se completa dos veces;
- un reintento idempotente devuelve el mismo receipt;
- un cambio de secuencia invalida intenciones no ejecutadas;
- la hora del cliente se conserva como observación y la del servidor ordena los
  hechos;
- una demora no reordena automáticamente la ruta;
- el progreso no cambia custodia, inventario ni recepción por inferencia.

##### 12.3. Resultado de parada

| Resultado            | Significado                                 | Efecto                          |
| -------------------- | ------------------------------------------- | ------------------------------- |
| `COMPLETED`          | acciones requeridas cumplidas               | permite salida                  |
| `SKIPPED_AUTHORIZED` | autoridad aprobó omisión concreta           | conserva motivo y nueva versión |
| `FAILED`             | no fue posible cumplir                      | abre incidente                  |
| `WAITING`            | espera autorizada                           | mantiene parada abierta         |
| `TRANSFERRED`        | carga o custodia se transfirió expresamente | exige cadena de custodia        |
| `RETURN_DIRECTED`    | existe instrucción de retorno               | cambia journey a retorno        |

---

#### 13. `NEXO-REMISSION-TRANSIT-LOCATION-OBSERVATION-CONTRACT-001`

La ubicación es evidencia auxiliar. No es una decisión empresarial.

Campos mínimos:

```text
location_observation_id
transit_journey_id
transit_stop_id_optional
actor_id
device_id
observed_at_client
received_at_server
latitude
longitude
accuracy_meters
source
consent_or_policy_version
```

Reglas:

1. una coordenada no inicia tránsito ni confirma una parada;
2. una geocerca no sustituye `site_id` ni `transit_stop_id`;
3. una observación imprecisa, antigua, simulada o ausente no produce un hecho
   positivo automático;
4. la interfaz puede sugerir la parada compatible, pero el actor confirma la
   acción y el servidor revalida;
5. la ubicación no amplía territorio, permisos ni custodia;
6. se minimiza la precisión y frecuencia según finalidad;
7. no se registra seguimiento continuo por defecto;
8. telemetría continua permanece deshabilitada hasta que `NEXO-UX-023`
   materialice dispositivo, consentimiento, retención, contingencia y piloto;
9. una falla de GPS no autoriza saltar identidad, sello, custodia o evidencia;
10. las observaciones no se exponen fuera del alcance autorizado.

---

#### 14. `NEXO-REMISSION-TRANSIT-CUSTODY-CONTINUITY-CONTRACT-001`

##### 14.1. Invariante

Desde el handoff de despacho hasta la aceptación de destino debe existir una
cadena continua y no ambigua:

```text
exactly_one_active_custodian_per_shipment = true
```

La custodia se resuelve por shipment aunque varios shipments compartan journey.

##### 14.2. Eventos

```text
ORIGIN_CUSTODY_ACCEPTED
TRANSIT_CUSTODY_CONFIRMED
CUSTODY_TRANSFER_OFFERED
CUSTODY_TRANSFER_ACCEPTED
CUSTODY_TRANSFER_REJECTED
CUSTODY_SUSPENDED_BY_INCIDENT
DESTINATION_CUSTODY_ACCEPTED
RETURN_CUSTODY_ACCEPTED
```

Cada entrada conserva actor que entrega, actor que recibe, shipment, journey,
sello, vehículo, motivo, lugar, timestamp, versión, evidencia e incidente
relacionado cuando aplique.

##### 14.3. Transferencia

Una transferencia exige dos declaraciones separadas:

```text
CUSTODIO ACTUAL ENTREGA
NUEVO CUSTODIO ACEPTA
```

Hasta la aceptación, el custodio anterior conserva responsabilidad. Un cambio
de conductor, dispositivo, vehículo, ruta o turno no transfiere custodia por sí
solo.

Si el mismo humano posee función de conductor y receptor, no puede auto-aceptar
el destino por defecto. Se requiere otro receptor autorizado o una excepción
expresa, segregada y auditada definida por la política correspondiente.

---

#### 15. `NEXO-REMISSION-TRANSIT-INCIDENT-CONTRACT-001`

| Incidente                | Severidad mínima | Efecto inicial                      | Acción inmediata                            | Propietario de decisión    |
| ------------------------ | ---------------- | ----------------------------------- | ------------------------------------------- | -------------------------- |
| `ROUTE_DELAY`            | media            | journey continúa condicionado       | registrar causa y estimación                | supervisión logística      |
| `VEHICLE_BREAKDOWN`      | alta             | bloquea movimiento                  | asegurar carga y escalar                    | logística y supervisión    |
| `ACCIDENT_OR_SAFETY`     | crítica          | bloquea journey                     | proteger personas y activar protocolo       | SST y supervisión          |
| `ROAD_BLOCKED`           | alta             | bloquea siguiente parada            | esperar o solicitar desvío                  | supervisión logística      |
| `CONNECTIVITY_LOSS`      | media            | bloquea mutaciones no reconciliadas | conservar intenciones y operar contingencia | sistema y supervisión      |
| `SEAL_TAMPERED`          | crítica          | suspende custodia normal            | no abrir, preservar evidencia y escalar     | supervisión y seguridad    |
| `LOAD_DAMAGE`            | alta             | bloquea shipment afectado           | contener sin alterar contenido registrado   | supervisión y calidad      |
| `LOAD_LOSS`              | crítica          | bloquea journey                     | asegurar remanente y escalar                | supervisión y seguridad    |
| `TEMPERATURE_OR_QUALITY` | crítica          | bloquea carga afectada              | preservar condición y escalar               | calidad y supervisión      |
| `CUSTODY_CONFLICT`       | crítica          | bloquea mutaciones                  | conservar cadena y resolver actor           | supervisión y autorización |
| `WRONG_DESTINATION`      | alta             | impide presentación                 | detener y solicitar instrucción             | supervisión logística      |
| `RECIPIENT_UNAVAILABLE`  | media            | mantiene custodia                   | esperar, reintentar o escalar               | supervisión y destino      |
| `DELIVERY_REJECTED`      | alta             | impide handoff                      | registrar rechazo y evidencia               | receptor y supervisión     |
| `RETURN_REQUIRED`        | alta             | exige instrucción formal            | conservar custodia y esperar destino        | supervisión logística      |

Cada incidente conserva tipo, severidad, etapa, shipment, journey, parada,
cantidad o unidades afectadas cuando aplique, sello, custodia, evidencia,
actor, propietario, plazo, estado, instrucción y resolución.

Estados:

```text
OPEN
ACKNOWLEDGED
INVESTIGATING
ACTION_REQUIRED
CONTAINED
RESOLVED
CANCELLED
```

El conductor reporta y ejecuta instrucciones dentro de su capacidad. No ajusta
inventario, cambia cantidades, declara pérdida resuelta, levanta calidad ni
cierra responsabilidad unilateralmente.

---

#### 16. `NEXO-REMISSION-TRANSIT-FAILED-DELIVERY-RETURN-CONTRACT-001`

##### 16.1. Entrega fallida

Una entrega puede fallar por receptor ausente, rechazo, destino inaccesible,
sello en conflicto, shipment incorrecto, ventana vencida, incidente de
seguridad o instrucción autorizada.

El resultado no se expresa como “no recibido” dentro del receipt de inventario.
Se registra un incidente y una decisión de tránsito.

##### 16.2. Instrucciones permitidas

| Instrucción                        | Condición                                  | Efecto                             |
| ---------------------------------- | ------------------------------------------ | ---------------------------------- |
| `WAIT_AT_DESTINATION`              | espera segura y ventana definida           | mantiene custodia y parada abierta |
| `RETRY_SAME_DESTINATION`           | nuevo intento autorizado                   | crea nueva ventana y versión       |
| `CONTINUE_NEXT_STOP`               | ruta multi-parada y carga permanece segura | conserva shipment pendiente        |
| `TRANSFER_TO_AUTHORIZED_CUSTODIAN` | custodio alterno identificado              | exige handoff bilateral            |
| `RETURN_TO_ORIGIN`                 | origen apto y autorizado                   | crea ruta de retorno               |
| `RETURN_TO_AUTHORIZED_SITE`        | destino alterno explícito                  | crea parada y versión nuevas       |
| `HOLD_AT_SECURE_POINT`             | punto seguro tipado y autorizado           | mantiene custodia bajo control     |

No se permite cambiar el destino empresarial del shipment por una selección del
cliente. El destino alterno es una instrucción de custodia o retorno, no una
reescritura del pedido.

##### 16.3. Retorno

El retorno conserva:

- shipment y receipt de despacho originales;
- motivo e incidente;
- autoridad y versión de instrucción;
- destino de retorno exacto;
- custodio y vehículo;
- nueva secuencia de paradas;
- estado del sello y carga;
- timestamps y evidencia;
- handoff final al origen o sitio autorizado.

El retorno no repone inventario automáticamente. Su recepción y cualquier
movimiento compensatorio pertenecen a `NEXO-UX-013` y `NEXO-UX-022`.

---

#### 17. `NEXO-REMISSION-TRANSIT-ARRIVAL-PROOF-CONTRACT-001`

##### 17.1. Hechos separados

```text
DESTINATION_ARRIVED
→ DELIVERY_PRESENTED
→ DESTINATION_CUSTODY_ACCEPTED
→ RECEPTION_HANDOFF_READY
→ RECEPCION EN NEXO-UX-013
```

Arribar no prueba que el receptor vio la carga. Presentar no prueba que aceptó
custodia. Aceptar custodia no registra cantidades recibidas ni condición.

##### 17.2. Prueba mínima obligatoria

La prueba mínima incluye:

- journey, parada, shipment y receipt de despacho;
- actor conductor y receptor identificado;
- destino y timestamp de servidor;
- verificación de sello y versión;
- manifestación de entrega del custodio;
- aceptación, rechazo o ausencia del receptor;
- observaciones estructuradas;
- correlación con incidente cuando exista.

Modos permitidos:

| Modo                 | Uso                               | Autoridad                                        |
| -------------------- | --------------------------------- | ------------------------------------------------ |
| `MANIFEST_SCAN`      | identifica shipment o documento   | no confirma entrega por sí solo                  |
| `SEAL_CHECK`         | coteja sello y estado             | no acepta custodia por sí solo                   |
| `RECIPIENT_IDENTITY` | resuelve receptor autorizado      | no registra recepción por sí solo                |
| `BILATERAL_ACK`      | entrega y aceptación separadas    | transfiere custodia física                       |
| `SIGNATURE`          | evidencia reforzada               | condicionada a privacidad y retención            |
| `PHOTO`              | evidencia contextual              | condicionada a finalidad, minimización y Storage |
| `ONE_TIME_CODE`      | prueba de presencia o aceptación  | secreto no persistente ni reutilizable           |
| `DEVICE_ATTESTATION` | evidencia técnica del dispositivo | no sustituye actor humano                        |

`MANIFEST_SCAN`, `SEAL_CHECK`, `RECIPIENT_IDENTITY` y `BILATERAL_ACK` forman el
mínimo funcional. Firma, fotografía y código de un solo uso permanecen
condicionados a los controles de evidencia, sensibilidad, retención y
dispositivo materializados por `NEXO-UX-022` y `NEXO-UX-023`.

##### 17.3. Privacidad

- no se almacena el código de un solo uso en claro;
- firma y fotografía no se incluyen en logs ni respuestas generales;
- la evidencia se minimiza al shipment y finalidad;
- el receptor solo ve datos necesarios para cotejar la carga;
- una denegación no revela rutas, cargas o actores ajenos;
- la revocación de contexto invalida accesos temporales a evidencia;
- el almacenamiento futuro deberá usar referencias protegidas y auditables.

---

#### 18. `NEXO-REMISSION-TRANSIT-TO-RECEPTION-HANDOFF-001`

El handoff contiene:

```text
reception_handoff_id
reception_handoff_version
transit_journey_id
transit_receipt_id
shipment_id
shipment_code
dispatch_receipt_id
origin_site_id
destination_site_id
destination_arrived_at
delivery_presented_at
destination_custody_handoff_id
destination_custodian_actor_id
seal_record_id
seal_status
shipment_snapshot
proof_record_refs[]
route_and_stop_snapshot
open_incidents[]
return_or_exception_context_optional
```

Garantías:

- el shipment y su contenido coinciden con el receipt de despacho;
- no se reaplicó inventario de origen ni consumo de paquetes;
- la ruta y los hitos conservan versiones;
- el destino fue alcanzado y la carga presentada;
- la custodia de destino fue aceptada o el handoff queda bloqueado;
- el sello y los incidentes están declarados;
- el conductor dejó de ser custodio solo después de aceptación válida;
- no se declaran cantidades recibidas, aceptadas, rechazadas o en cuarentena;
- `NEXO-UX-013` inicia una recepción independiente e idempotente;
- un incidente o retorno no reescribe los receipts históricos.

Si la custodia no fue aceptada, no se genera `RECEPTION_HANDOFF_READY`; se
mantiene entrega fallida, espera, transferencia o retorno.

---

#### 19. `NEXO-REMISSION-TRANSIT-IDEMPOTENCY-RECEIPT-001`

Existen intenciones y receipts separados para:

- inicio de journey;
- llegada a parada;
- resultado de parada;
- salida de parada;
- incidente;
- instrucción de continuidad o retorno;
- arribo a destino;
- prueba de presentación;
- transferencia de custodia;
- handoff a recepción.

Reglas:

1. la misma intención con igual payload devuelve el mismo resultado;
2. la misma intención con payload distinto produce conflicto;
3. cada intención se vincula a actor, dispositivo, journey, etapa y versión;
4. un timeout se reconcilia antes de habilitar reintento;
5. un evento confirmado no se elimina ni sobrescribe;
6. una corrección crea evento compensatorio o incidente;
7. las versiones posteriores invalidan intenciones pendientes incompatibles;
8. el cliente no asume éxito por estado local, navegación o mensaje optimista;
9. los receipts son consultables por intención y correlación;
10. outbox e integraciones no aplican un mismo evento dos veces.

Ante desconexión:

```text
CONSERVAR INTENCION
→ CONSULTAR ESTADO AUTORITATIVO
→ MOSTRAR RECEIPT SI EXISTE
→ REANUDAR SI SIGUE PENDIENTE
→ NUEVA INTENCION SOLO SI FALLO SIN EFECTOS
```

No existe confirmación offline irreversible por defecto.

---

#### 20. Validaciones obligatorias

| ID            | Momento      | Validación                                                          | Resultado ante fallo       |
| ------------- | ------------ | ------------------------------------------------------------------- | -------------------------- |
| `TRN-VAL-001` | entrada      | principal autenticado y actor efectivo vigente                      | denegación segura          |
| `TRN-VAL-002` | entrada      | permiso exacto `nexo.inventory.remissions.transit`                  | denegación                 |
| `TRN-VAL-003` | entrada      | turno, check-in y contexto aplicables vigentes                      | bloqueo contextual         |
| `TRN-VAL-004` | entrada      | dispositivo permitido e identidad humana verificable                | bloqueo                    |
| `TRN-VAL-005` | cola         | journey o shipment está asignado al actor o custodia                | excluir de cola            |
| `TRN-VAL-006` | cola         | asignación vigente, única y no revocada                             | bloqueo                    |
| `TRN-VAL-007` | handoff      | dispatch receipt existe y es inmutable                              | bloqueo crítico            |
| `TRN-VAL-008` | handoff      | shipment está despachado y no terminal                              | bloqueo                    |
| `TRN-VAL-009` | handoff      | efectos de inventario y paquetes ya están correlacionados           | devolver a despacho        |
| `TRN-VAL-010` | handoff      | sello, fingerprint y versión coinciden                              | incidente o bloqueo        |
| `TRN-VAL-011` | handoff      | custodio activo coincide con actor o transferencia válida           | conflicto de custodia      |
| `TRN-VAL-012` | asignación   | vehículo y medio son compatibles                                    | bloqueo                    |
| `TRN-VAL-013` | asignación   | shipment no pertenece a otro journey activo                         | conflicto concurrente      |
| `TRN-VAL-014` | asignación   | ruta y paradas tienen versión vigente                               | refrescar                  |
| `TRN-VAL-015` | asignación   | todos los destinos están cubiertos por paradas exactas              | rechazo                    |
| `TRN-VAL-016` | inicio       | intención no fue usada con otro payload                             | conflicto idempotente      |
| `TRN-VAL-017` | inicio       | journey continúa `START_READY`                                      | conflicto de estado        |
| `TRN-VAL-018` | inicio       | no existe incidente bloqueante                                      | impedir inicio             |
| `TRN-VAL-019` | inicio       | versions de journey, handoff, sello y custodia coinciden            | conflicto                  |
| `TRN-VAL-020` | inicio       | comando no contiene ni produce efectos de inventario                | rollback                   |
| `TRN-VAL-021` | progreso     | actor conserva asignación, permiso y custodia                       | bloqueo                    |
| `TRN-VAL-022` | progreso     | parada es la siguiente de la secuencia vigente                      | rechazo                    |
| `TRN-VAL-023` | progreso     | evento anterior requerido está confirmado                           | rechazo                    |
| `TRN-VAL-024` | progreso     | intención y versión de parada son vigentes                          | conflicto                  |
| `TRN-VAL-025` | progreso     | hora de servidor mantiene orden causal                              | rechazo o ajuste observado |
| `TRN-VAL-026` | ubicación    | coordenada y geocerca solo se usan como evidencia                   | no ejecutar transición     |
| `TRN-VAL-027` | parada       | resultado y acciones requeridas están completos                     | mantener parada abierta    |
| `TRN-VAL-028` | incidente    | tipo, severidad, etapa, evidencia y responsable existen             | rechazo estructurado       |
| `TRN-VAL-029` | incidente    | incidente crítico bloquea avance incompatible                       | bloqueo                    |
| `TRN-VAL-030` | instrucción  | autoridad, motivo, destino y versión son válidos                    | rechazo                    |
| `TRN-VAL-031` | custodia     | entrega y aceptación son bilaterales y correlacionadas              | mantener custodio anterior |
| `TRN-VAL-032` | arribo       | destino y parada coinciden con shipment                             | incidente                  |
| `TRN-VAL-033` | presentación | sello, manifest, receptor y prueba mínima son coherentes            | entrega fallida            |
| `TRN-VAL-034` | handoff      | arribo y custodia no registran recepción ni inventario              | rollback                   |
| `TRN-VAL-035` | retorno      | instrucción y destino de retorno son exactos y autorizados          | bloqueo                    |
| `TRN-VAL-036` | recuperación | resultado desconocido se consulta por intención antes de reintentar | receipt o bloqueo          |

Las treinta y seis validaciones son acumulativas. Una validación visual o GPS
no sustituye servidor, RPC, RLS, integridad, custodia o idempotencia.

---

#### 21. Estados de interfaz

| Estado                       | Condición                                 | Mensaje o comportamiento                       | Acción segura                 |
| ---------------------------- | ----------------------------------------- | ---------------------------------------------- | ----------------------------- |
| `RESOLVIENDO_CONTEXTO`       | entrada inicial                           | validar actor, sesión y trabajo                | esperar                       |
| `SIN_AUTORIZACION`           | permiso o relación ausente                | explicar sin filtrar datos                     | volver                        |
| `SIN_JORNADA_VALIDA`         | turno o check-in inválido                 | bloquear mutaciones                            | resolver contexto             |
| `SIN_ASIGNACION`             | no hay journey, vehículo o custodia       | no mostrar trabajo general                     | actualizar o escalar          |
| `CARGANDO_TRABAJO`           | consulta vigente                          | skeleton estable                               | esperar                       |
| `COLA_VACIA`                 | no hay trabajo propio                     | vacío confirmado                               | refrescar                     |
| `TRABAJO_ASIGNADO`           | journey atribuible                        | mostrar siguiente tarea                        | abrir                         |
| `HANDOFF_INCOMPLETO`         | falta receipt, sello o versión            | bloquear inicio                                | devolver a despacho           |
| `MANIFIESTO_NO_COINCIDE`     | carga observada difiere                   | no aceptar ni iniciar                          | abrir bloqueo                 |
| `CUSTODIA_EN_CONFLICTO`      | custodio ambiguo o ajeno                  | bloquear mutaciones                            | reconciliar                   |
| `LISTO_PARA_INICIAR`         | contexto y ruta válidos                   | mostrar impacto del inicio                     | confirmar                     |
| `INICIANDO_TRANSITO`         | comando enviado                           | impedir doble acción                           | esperar o reconciliar         |
| `RESULTADO_DESCONOCIDO`      | timeout o cierre                          | consultar intención                            | recuperar receipt             |
| `EN_TRANSITO`                | journey activo                            | mostrar siguiente parada                       | continuar                     |
| `CARGANDO_RUTA`              | se resuelve versión vigente               | no mostrar secuencia parcial como final        | esperar                       |
| `PROXIMA_PARADA`             | parada pendiente                          | mostrar ventana y acciones                     | navegar o confirmar llegada   |
| `LLEGADA_PENDIENTE`          | proximidad observada sin evento           | sugerir confirmación                           | revisar identidad             |
| `PARADA_CONFIRMADA`          | llegada idempotente válida                | mostrar acciones requeridas                    | completar parada              |
| `PARADA_COMPLETADA`          | resultado registrado                      | habilitar salida                               | confirmar salida              |
| `INCIDENCIA_ABIERTA`         | novedad registrada                        | mostrar severidad y propietario                | completar evidencia o esperar |
| `TRANSITO_BLOQUEADO`         | incidente crítico o instrucción pendiente | impedir avance incompatible                    | escalar                       |
| `SIN_CONECTIVIDAD`           | red intermitente                          | conservar datos mínimos y estado no confirmado | reconciliar                   |
| `RETORNO_AUTORIZADO`         | instrucción válida                        | mostrar destino y motivo                       | iniciar retorno               |
| `RETORNO_EN_CURSO`           | journey de retorno activo                 | conservar custodia y paradas                   | continuar                     |
| `ARRIBO_DESTINO`             | parada final confirmada                   | no mostrar recibido                            | presentar carga               |
| `ENTREGA_PRESENTADA`         | carga y sello cotejados                   | esperar aceptación de destino                  | transferir custodia           |
| `CUSTODIA_DESTINO_PENDIENTE` | entrega registrada sin aceptación         | conductor sigue responsable                    | esperar, rechazar o escalar   |
| `HANDOFF_A_RECEPCION_LISTO`  | custodia destino aceptada                 | mostrar resumen inmutable                      | abrir recepción               |

Los estados vacíos, errores, retornos y bloqueos no ofrecen controles que el
servidor rechazará por diseño.

---

#### 22. `NEXO-REMISSION-TRANSIT-ROUTE-DISPOSITION-001`

| Ruta             | Patrón actual                       | Disposición                | Uso en tránsito                                            | Estado                  |
| ---------------- | ----------------------------------- | -------------------------- | ---------------------------------------------------------- | ----------------------- |
| `NEXO-ROUTE-001` | `/`                                 | entrada task-first         | resolver jornada, journey y siguiente tarea propia         | `ESPECIFICADO`          |
| `NEXO-ROUTE-031` | `/inventory/remissions`             | resolutor compartido       | mostrar solo trabajo relacionado con asignación o custodia | `ESPECIFICADO`          |
| `NEXO-ROUTE-032` | `/inventory/remissions/[id]`        | detalle compartido         | consultar shipment y receipts con acciones por etapa       | `ESPECIFICADO`          |
| `NEXO-ROUTE-034` | `/inventory/remissions/conductor`   | entrada operativa primaria | converger a journeys asignados, no a todos los shipments   | `ESPECIFICADO`          |
| `NEXO-ROUTE-037` | `/inventory/remissions/receive`     | downstream                 | abrir solo después de handoff de custodia válido           | `HANDOFF_POSTERIOR`     |
| `NEXO-ROUTE-038` | `/inventory/remissions/transit`     | superficie de tránsito     | separar operación del conductor de monitoreo supervisor    | `ESPECIFICADO`          |
| `NEXO-ROUTE-050` | `/inventory/settings/supply-routes` | referencia de solo lectura | consumir ruta publicada sin configurarla ni reordenarla    | `REFERENCIA_CONTEXTUAL` |
| `NEXO-ROUTE-052` | `/inventory/stock`                  | referencia de inventario   | consultar evidencia autorizada sin ajustar ni repostear    | `REFERENCIA_CONTEXTUAL` |
| `NEXO-ROUTE-062` | `/printing/jobs`                    | utilidad contextual        | consultar documentos propios del journey                   | `UTILIDAD_CONTEXTUAL`   |
| `NEXO-ROUTE-064` | `/scanner`                          | utilidad contextual        | identificar shipment, sello, parada o handoff y retornar   | `UTILIDAD_OCULTA`       |

Reconciliación:

```text
EXPECTED_RELATED_ROUTES = 10
MATERIALIZED_RELATED_ROUTES = 10
MISSING_RELATED_ROUTES = 0
DUPLICATE_RELATED_ROUTES = 0
NEW_ROUTE_IDENTITIES = 0
```

No se crea una URL nueva. Las rutas `conductor` y `transit` deberán converger
sobre una única fuente de journey, asignación, custodia, estado y receipts sin
fusionar operación con supervisión.

---

#### 23. Conectividad, dispositivo y recuperación

| Situación                           | Comportamiento                                            | Acción prohibida                |
| ----------------------------------- | --------------------------------------------------------- | ------------------------------- |
| sin conexión antes del inicio       | mostrar datos cacheados solo como referencia              | iniciar journey                 |
| pérdida después de enviar intención | conservar intención y estado pendiente                    | repetir comando                 |
| reconexión                          | revalidar actor, assignment, custody, journey y versiones | sincronizar ciegamente          |
| dispositivo compartido              | identificar actor efectivo en cada mutación               | atribuir al dispositivo         |
| cambio de actor                     | cerrar sesión operativa y revalidar custodia              | heredar journey                 |
| cambio de vehículo                  | exigir instrucción y transferencia cuando aplique         | editar snapshot silenciosamente |
| escaneo duplicado                   | reconocer identidad ya procesada                          | crear segundo evento            |
| GPS ausente o impreciso             | permitir evidencia alternativa autorizada                 | inventar llegada                |
| parada confirmada con timeout       | consultar intención                                       | confirmar nuevamente            |
| contexto revocado                   | bloquear y conservar hechos autoritativos                 | continuar con caché             |
| batería agotada                     | recuperar journey y siguiente evento                      | asumir progreso                 |
| incidente sin red                   | conservar borrador de emergencia y prioridad humana       | marcar incidente resuelto       |

La seguridad de personas prevalece sobre la captura digital. La contingencia no
convierte un evento local en hecho confirmado; toda mutación pendiente se
reconcilia cuando existe conectividad.

---

#### 24. Autorización, seguridad y privacidad

1. interfaz, servidor, RPC y RLS revalidan actor, permiso, asignación, journey,
   shipment, parada, custodia, estado y versión;
2. una sede asignada no concede lectura de todos los journeys de la sede;
3. `dispatch`, `transit` y `receive` son capacidades distintas;
4. una URL, botón, código, coordenada o estado visible no concede autoridad;
5. actor técnico, vehículo y dispositivo no sustituyen al humano efectivo;
6. los datos del cliente no deciden ruta, destino, parada, custodia o estado;
7. el servidor ordena eventos y conserva la hora observada por separado;
8. las denegaciones no revelan rutas, cargas, incidentes o receptores ajenos;
9. evidencia de ubicación, firma, fotografía y receptor se minimiza por
   finalidad y alcance;
10. secretos, PIN y códigos de un solo uso no aparecen en logs ni receipts;
11. toda transferencia, reasignación, incidente, instrucción y toma
    administrativa conserva auditoría;
12. los receipts de despacho y tránsito son inmutables;
13. outbox y consumidores aplican idempotencia;
14. tránsito no puede ejecutar movimientos de inventario de origen o destino;
15. el receptor solo accede a la carga presentada y al contexto mínimo;
16. supervisión observa y decide dentro de su territorio sin apropiarse de la
    custodia operativa.

---

#### 25. Evidencia técnica actual y diagnóstico

| Fuente actual                                       | Evidencia verificable                                                                                                                          | Estado frente al diseño    | Decisión                                                                     |
| --------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------- | ---------------------------------------------------------------------------- |
| `src/app/inventory/remissions/transit/page.tsx`     | consulta `restock_requests` de centros autorizados en `preparing`, `in_transit` y `partial`; no filtra por journey, actor, vehículo o custodia | `IMPLEMENTADO_PARCIAL`     | sustituir la cola amplia por trabajo propio y versionado                     |
| `src/app/inventory/remissions/transit/page.tsx`     | mezcla “listas para despacho”, “en tránsito” y “parciales” en una vista denominada conductor                                                   | `BRECHA_DE_ETAPA`          | separar despacho, tránsito y recepción parcial                               |
| `src/app/inventory/remissions/conductor/page.tsx`   | consulta shipments `draft`, `loading`, `sealed` e `in_transit` sin demostrar asignación territorial o de custodio                              | `BRECHA_DE_AUTORIZACION`   | mostrar solo journeys y shipments atribuibles                                |
| `src/app/inventory/remissions/conductor/page.tsx`   | cualquier shipment no `in_transit` aparece como pendiente de salida y un shipment en tránsito enlaza directamente a recepción                  | `BRECHA_CRITICA`           | exigir despacho confirmado, journey, hitos y handoff antes de recepción      |
| `src/app/inventory/remissions/conductor/actions.ts` | con sesión autenticada cambia `draft`, `loading` o `sealed` directamente a `in_transit`                                                        | `BRECHA_CRITICA`           | retirar el bypass y consumir el comando de despacho e inicio separados       |
| `src/app/inventory/remissions/conductor/actions.ts` | no evidencia permiso exacto, asignación, custodia, route plan, versión, intención, receipt ni outbox                                           | `NO_IMPLEMENTADO_COMPLETO` | materializar comando de inicio autoritativo                                  |
| `submitTransitChecklist` en el detalle legacy       | desde `preparing` aplica movimientos, consume paquetes y luego cambia la solicitud a `in_transit`                                              | `DOBLE_FRONTERA_CRITICA`   | mover efectos de salida exclusivamente al despacho y prohibirlos en tránsito |
| `submitTransitChecklist` en el detalle legacy       | escribe notas libres de conductor por línea y ejecuta varias mutaciones separadas                                                              | `BRECHA_DE_ATOMICIDAD`     | usar incidente, evento, intención y receipt estructurados                    |
| `remission_dispatch_runs` y `remission_shipments`   | representan salida, vehículo y estados parciales, pero no journey, paradas, eventos, cadena de custodia o receipts de tránsito completos       | `IMPLEMENTADO_PARCIAL`     | conservar identidades útiles y añadir proyección compatible                  |
| `remission_exceptions`                              | admite etapa `transit` y algunos tipos, pero no cubre las catorce familias, instrucciones y estados aprobados                                  | `IMPLEMENTADO_PARCIAL`     | ampliar contrato sin perder historial                                        |
| progreso de ruta y paradas                          | no se observó entidad ni comando idempotente completo                                                                                          | `NO_IMPLEMENTADO`          | materializar journey, stops, events e intenciones                            |
| prueba de presentación y handoff de destino         | no se observó contrato bilateral completo separado de receipt                                                                                  | `NO_IMPLEMENTADO`          | materializar prueba mínima y transferencia de custodia                       |
| validación móvil, offline y física                  | no existe evidencia de piloto con actor, vehículo, paradas, incidentes y red intermitente                                                      | `PENDIENTE_DE_EVIDENCIA`   | validar en `NEXO-UX-023` a `NEXO-UX-025`                                     |

La coexistencia actual permite que dos superficies distintas produzcan
`in_transit` con semánticas incompatibles. La implementación deberá establecer
un único escritor autoritativo para despacho y otro para inicio/progreso de
tránsito, sin doble contabilización.

---

#### 26. `NEXO-REMISSION-TRANSIT-IMPLEMENTATION-HANDOFF-001`

Una implementación posterior deberá, como mínimo:

1. adoptar `NEXO-REMISSION-DISPATCH-TO-TRANSIT-HANDOFF-001` como entrada única;
2. impedir que tránsito aplique stock, paquetes o cantidades despachadas;
3. retirar o encapsular los dos bypasses actuales hacia `in_transit`;
4. materializar journey, asignación, paradas, eventos, intenciones, receipts,
   cadena de custodia, incidentes, instrucciones, prueba y handoff de destino;
5. filtrar toda consulta por actor, asignación, custodia y territorio;
6. separar operación del conductor y monitoreo supervisor;
7. implementar comandos idempotentes de inicio y progreso;
8. conservar orden causal, control optimista y recuperación por intención;
9. implementar transferencia bilateral de custodia;
10. materializar las catorce familias de incidente y sus bloqueos;
11. impedir que arribo o custodia publiquen inventario recibido;
12. entregar a recepción un payload versionado e inmutable;
13. generar contratos y tipos compartidos cuando cambie el esquema;
14. versionar toda modificación Supabase desde `vento-shell`;
15. incluir RLS, grants, índices, concurrencia, outbox, compatibilidad y
    observabilidad;
16. incluir rollback, migración de estados legacy y pruebas de no duplicidad;
17. impedir que rutas legacy y nuevas escriban el mismo hecho durante la
    convivencia;
18. certificar dispositivo, red intermitente, ubicación y evidencia antes de
    habilitar capacidades condicionadas.

##### 26.1. Rollback funcional esperado

Antes de `TRANSIT_STARTED`, puede cancelarse o reasignarse el journey sin
alterar despacho. Después del inicio, el rollback no borra eventos: crea
instrucción, transferencia, retorno o corrección compensatoria. Ningún rollback
restaura inventario por sí mismo.

##### 26.2. Compatibilidad

Durante la transición:

- cada shipment tendrá un único journey activo;
- cada hecho tendrá un único escritor autoritativo;
- `restock_requests.status` será una proyección compatible, no la única verdad;
- `remission_shipments.status` no sustituirá paradas, custodia o receipts;
- los flags temporales serán explícitos, versionados y observables;
- los receipts distinguirán operaciones nuevas de transiciones legacy;
- la desactivación de bypasses exigirá reconciliación y prueba de cero doble
  descuento y cero doble evento.

---

#### 27. Decisiones aprobadas

1. `NEXO-UX-012` diseña tránsito; recepción permanece en `NEXO-UX-013`;
2. tránsito consume un shipment ya despachado e inmutable;
3. despacho e inicio operativo del journey son hechos distintos;
4. tránsito nunca vuelve a descontar inventario ni consumir paquetes;
5. existen exactamente veinte pasos y veintiocho estados de interfaz;
6. se reconciliaron dieciocho estados empresariales y técnicos;
7. se consumen exactamente las ocho colas `DRVQ-*` aprobadas;
8. el permiso exacto es `nexo.inventory.remissions.transit`;
9. una sede autorizada no concede todos los journeys de esa sede;
10. el trabajo se filtra por asignación, actor, custodia y vehículo;
11. un journey puede transportar varios shipments compatibles;
12. cada shipment conserva un único destino y un único journey activo;
13. la ruta y las paradas son finitas, exactas y versionadas;
14. el cliente no reordena ni inventa paradas;
15. `TRANSIT_STARTED` usa intención y receipt propios;
16. los hitos de parada son llegada, resultado y salida separados;
17. GPS y geocerca son observaciones, no autoridad;
18. no existe seguimiento continuo por defecto;
19. cada shipment tiene exactamente un custodio activo;
20. cambiar actor o vehículo no transfiere custodia automáticamente;
21. toda transferencia exige entrega y aceptación separadas;
22. se materializaron catorce familias de incidente;
23. el conductor reporta, pero no resuelve decisiones supervisoras por defecto;
24. una entrega fallida mantiene custodia y abre una decisión estructurada;
25. retorno no equivale a reposición de inventario;
26. arribo, presentación, aceptación de custodia y recepción son hechos distintos;
27. la prueba mínima no requiere fotografía ni firma;
28. evidencia reforzada queda condicionada a privacidad, Storage y dispositivo;
29. el handoff a recepción no contiene cantidades recibidas;
30. cada mutación usa intención, versión y receipt;
31. resultado desconocido se reconcilia antes de reintentar;
32. no se crean nuevas URLs;
33. las rutas de conductor y tránsito convergen sin mezclar supervisión;
34. los dos bypasses actuales a `in_transit` deben retirarse o encapsularse;
35. toda modificación futura de Supabase se crea y versiona desde `vento-shell`;
36. esta tarea no modifica código, datos ni ambientes.

---

#### 28. Pendientes materializados y propietarios

| Pendiente                                 | Estado                   | Propietario                  | Tarea o puerta                                | Condición de salida                                                            |
| ----------------------------------------- | ------------------------ | ---------------------------- | --------------------------------------------- | ------------------------------------------------------------------------------ |
| fuente física de vehículo                 | `PENDIENTE_DE_EVIDENCIA` | NEXO y logística             | `NEXO-UX-012`; `NEXO-UX-023`; paquete E5 NEXO | identidad, disponibilidad, custodia y compatibilidad materializadas y probadas |
| comandos de journey y paradas             | `ESPECIFICADO`           | NEXO y Data                  | paquete E5 NEXO; `SHELL-CI-017`               | esquema, RPC, RLS, idempotencia y pruebas materializados                       |
| separación de doble escritor `in_transit` | `ESPECIFICADO`           | NEXO                         | paquete E5 NEXO                               | un escritor por hecho y pruebas de no duplicidad                               |
| resolución supervisora de incidentes      | `ESPECIFICADO`           | supervisión NEXO             | `NEXO-UX-007`; `NEXO-UX-022`                  | permisos, estados, instrucciones y cierres separados                           |
| fotografía, firma y código de un solo uso | `BLOQUEADO`              | evidencia y UX NEXO          | `NEXO-UX-022`; `NEXO-UX-023`                  | finalidad, Storage, retención, privacidad y dispositivo aprobados              |
| recepción y cantidades en destino         | `RESERVADO`              | receptor NEXO                | `NEXO-UX-013`                                 | receipt, líneas, condición, diferencias y publicación especificados            |
| retorno recibido y compensación           | `ESPECIFICADO`           | recepción y supervisión      | `NEXO-UX-013`; `NEXO-UX-022`                  | handoff, decisión y movimientos compensatorios aprobados                       |
| seguimiento continuo de ubicación         | `BLOQUEADO`              | UX, privacidad y dispositivo | `NEXO-UX-023`                                 | finalidad, frecuencia, consentimiento, retención y piloto aprobados            |
| validación móvil y offline                | `PENDIENTE_DE_EVIDENCIA` | UX-QA NEXO                   | `NEXO-UX-023`; `NEXO-UX-024`                  | pruebas con dispositivo, revocación, batería y red intermitente                |
| métricas y piloto de ruta real            | `PENDIENTE_DE_EVIDENCIA` | Operaciones y UX-QA          | `NEXO-UX-025`                                 | umbrales, muestra, evidencia y aceptación operativa                            |

Ningún pendiente queda sin propietario, tarea o condición de salida.

---

#### 29. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

Esta tarea crea:

- `TREQ-NEXO-121`;
- `TREQ-NEXO-122`;
- `TREQ-NEXO-123`;
- `TREQ-NEXO-124`;
- `TREQ-NEXO-125`;
- `TREQ-NEXO-126`;
- `TREQ-NEXO-127`;
- `TREQ-NEXO-128`;
- `TREQ-NEXO-129`;
- `TREQ-NEXO-130`;
- `TREQ-NEXO-131`;
- `TREQ-NEXO-132`.

No modifica, difiere, descarta ni vuelve obsoleto ningún requisito histórico.
El detalle canónico reside en el registro completo 04A actualizado
coordinadamente con esta tarea.

---

#### 30. Criterios de aceptación

La tarea se considera documentalmente completa cuando:

1. existe una frontera inequívoca entre despacho, tránsito y recepción;
2. el handoff de `NEXO-UX-011` se consume sin modificarlo;
3. los veinte pasos están materializados sin faltantes ni duplicados;
4. los veintiocho estados de interfaz tienen condición y acción segura;
5. los dieciocho estados empresariales y técnicos están reconciliados;
6. las ocho colas `DRVQ-*` conservan identidad y propósito;
7. el permiso exacto de tránsito está separado de despacho y recepción;
8. la cola muestra únicamente journeys y shipments atribuibles al actor;
9. journey, assignment, route, stops, events, intentions y receipts tienen
   identidades estables;
10. un shipment no pertenece a dos journeys activos;
11. la secuencia de paradas es finita, exacta y versionada;
12. el inicio del tránsito es atómico e idempotente;
13. el inicio no produce ningún movimiento de inventario;
14. llegada, resultado y salida de parada permanecen separados;
15. la ubicación es evidencia auxiliar y no autoridad;
16. la cadena de custodia no presenta vacíos ni ambigüedad;
17. una transferencia exige entrega y aceptación independientes;
18. las catorce familias de incidente tienen severidad, efecto y propietario;
19. un incidente crítico bloquea avance incompatible;
20. espera, reintento, transferencia, retorno y destino alterno requieren
    instrucción autorizada;
21. el retorno conserva el hecho original y no repone inventario;
22. arribo, presentación, custodia destino y recepción son hechos separados;
23. la prueba mínima puede operar sin fotografía o firma;
24. evidencia sensible permanece condicionada a controles explícitos;
25. el handoff a `NEXO-UX-013` no declara cantidades recibidas;
26. las treinta y seis validaciones están asignadas a momentos concretos;
27. las diez rutas relacionadas tienen disposición explícita;
28. el diagnóstico diferencia implementación parcial, brecha y ausencia;
29. los doce requisitos nuevos están incorporados al 04A completo;
30. todos los pendientes tienen propietario y condición de salida;
31. no se ejecutan cambios físicos ni operaciones remotas;
32. la siguiente tarea permanece reservada.

---

#### 31. Continuidad

**ÚLTIMA TAREA APROBADA:** `NEXO-UX-011 — Diseñar flujo completo de despacho`

**TAREA ACTUAL APROBADA:** `NEXO-UX-012 — Diseñar flujo completo de tránsito`

**SIGUIENTE TAREA RESERVADA:** `NEXO-UX-013 — Diseñar flujo completo de recepción`

`NEXO-UX-013` deberá consumir
`NEXO-REMISSION-TRANSIT-TO-RECEPTION-HANDOFF-001`, conservar los receipts de
despacho y tránsito, iniciar una recepción independiente y no reinterpretar
arribo, presentación o custodia como cantidades aceptadas sin su propio
comando idempotente y evidencia verificable.


### [ ] NEXO-UX-013 — Diseñar flujo completo de recepción
### [ ] NEXO-UX-014 — Diseñar flujo completo de entradas
### [ ] NEXO-UX-015 — Diseñar flujo completo de ubicación
### [ ] NEXO-UX-016 — Diseñar flujo completo de movimientos
### [ ] NEXO-UX-017 — Diseñar flujo completo de retiros
### [ ] NEXO-UX-018 — Diseñar flujo completo de conteos
### [ ] NEXO-UX-019 — Diseñar flujo completo de ajustes
### [ ] NEXO-UX-020 — Simplificar escáner y captura
### [ ] NEXO-UX-021 — Mostrar solo información necesaria según etapa
### [ ] NEXO-UX-022 — Diseñar manejo de diferencias y excepciones
### [ ] NEXO-UX-023 — Probar flujos en tablets y kioscos
### [ ] NEXO-UX-024 — Validar el prototipo con bodeguero, conductor y receptores
### [ ] NEXO-UX-025 — Definir métricas de tiempo, error y capacitación para el piloto operativo

### [ ] NEXO-UX-026 — Diseñar ciclo de vida completo de LPN
### [ ] NEXO-UX-027 — Diseñar empaque, desempaque y consulta de contenido
### [ ] NEXO-UX-028 — Diseñar división, unión, transferencia y reetiquetado
### [ ] NEXO-UX-029 — Diseñar contenedores anidados y retornables
### [ ] NEXO-UX-030 — Diseñar catálogo de activos y reutilizables
### [ ] NEXO-UX-031 — Diseñar custodia, préstamo, devolución y transferencia
### [ ] NEXO-UX-032 — Diseñar estado, daño, pérdida, reparación y baja
### [ ] NEXO-UX-033 — Diseñar kits, conjuntos y control de completitud
### [ ] NEXO-UX-034 — Diseñar conteos de activos y reutilizables
### [ ] NEXO-UX-035 — Diseñar repuestos, compatibilidad y reposición mínima
### [ ] NEXO-UX-036 — Diseñar búsqueda por LOC, LPN, código, responsable y contenido
### [ ] NEXO-UX-037 — Diseñar impresión de LOC, LPN, activo y documento
### [ ] NEXO-UX-038 — Diseñar operación con escáner y etiquetas dañadas
### [ ] NEXO-UX-039 — Diseñar inventario inicial de contenedores y activos
### [ ] NEXO-UX-040 — Validar el prototipo del subdominio con decoración, vajilla, herramientas y repuestos
### [ ] NEXO-UX-041 — Definir línea base y métricas objetivo de pérdidas, búsqueda y diferencias
### [ ] NEXO-UX-042 — Aprobar el diseño del subdominio y remitirlo a E5 antes de implementarlo físicamente
### [ ] NEXO-UX-043 — Diseñar registro y mapa simple de instalaciones, espacios, condición y disponibilidad
### [ ] NEXO-UX-044 — Diseñar solicitudes, órdenes de trabajo, mantenimiento y reparaciones
### [ ] NEXO-UX-045 — Diseñar limpieza, saneamiento, plagas y evidencia operativa por área
### [ ] NEXO-UX-046 — Diseñar inspecciones, calibración, servicios, medidores y alertas
### [ ] NEXO-UX-047 — Diseñar llaves, acceso físico, obras, cierres temporales y novedades
### [ ] NEXO-UX-048 — Validar el prototipo con Operaciones, Producción, Limpieza, Mantenimiento, SST y responsables de sede
