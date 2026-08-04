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


### [ ] NEXO-UX-002 — Separar operación, supervisión y configuración
### [ ] NEXO-UX-003 — Diseñar inicio para solicitante
### [ ] NEXO-UX-004 — Diseñar inicio para bodeguero
### [ ] NEXO-UX-005 — Diseñar inicio para conductor
### [ ] NEXO-UX-006 — Diseñar inicio para receptor
### [ ] NEXO-UX-007 — Diseñar inicio para supervisor
### [ ] NEXO-UX-008 — Organizar navegación por tareas y no por rutas técnicas
### [ ] NEXO-UX-009 — Diseñar flujo completo de solicitud de remisión
### [ ] NEXO-UX-010 — Diseñar flujo completo de preparación
### [ ] NEXO-UX-011 — Diseñar flujo completo de despacho
### [ ] NEXO-UX-012 — Diseñar flujo completo de tránsito
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
