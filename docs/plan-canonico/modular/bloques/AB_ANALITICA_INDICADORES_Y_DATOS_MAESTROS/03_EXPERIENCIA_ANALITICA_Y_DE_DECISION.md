### MINI-BLOQUE — EXPERIENCIA ANALITICA Y DE DECISIÓN

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **experiencia analitica y de decisión** dentro de **AB ANALITICA INDICADORES Y DATOS MAESTROS**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `DATA-UX-001` a `DATA-UX-008` — 8 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Límites funcionales:** comienza con “Diseñar inicio ejecutivo simple y accionable por rol” y concluye con “Validar comprensión, tiempos y decisiones con usuarios reales”.
<!-- PLAN-SECTION-META:END -->

### ✅ DATA-UX-001 — Diseñar inicio ejecutivo simple y accionable por rol

**Estado:** APROBADA
**Tarea anterior:** `DATA-AUTH-004 — Auditar consultas, descargas, suscripciones, alertas, modelos y recomendaciones` — APROBADA
**Tarea siguiente:** `DATA-UX-002 — Diseñar catálogo de métricas y datos maestros con definición, dueño, fuente, calidad y linaje` — RESERVADA
**Tipo de tarea:** documental; diseño normativo y materializado de la experiencia de inicio ejecutivo por rol, con priorización de resultados, atención requerida, calidad, contexto, navegación y divulgación progresiva sin convertir el rol en autorización
**Bloque:** AB — Analítica, indicadores y datos maestros
**Fase:** exclusivamente documental
**Implementación técnica:** no autorizada
**Código, rutas físicas, componentes, DDL, DML, migraciones, RLS, RPC, grants, cambios de permisos, datos, backfills, despliegues o cambios en Supabase:** no autorizados
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Diseñar una superficie de inicio ejecutivo que permita a cada actor autorizado comprender rápidamente qué requiere atención, qué resultados importan para su responsabilidad, qué limitaciones de calidad condicionan la lectura y cuál es la siguiente navegación útil, sin obligarlo a recorrer primero catálogos, reportes extensos o pantallas técnicas.

El inicio deberá responder, dentro del alcance real del actor, cinco preguntas:

1. ¿qué cambió o requiere atención?;
2. ¿cuáles son los resultados principales para mi responsabilidad?;
3. ¿qué dato, calidad, bloqueo o guardrail limita la interpretación?;
4. ¿qué acción o investigación autorizada corresponde a continuación?;
5. ¿qué periodo, corte, territorio y versión estoy observando?

La experiencia no crea métricas, no redefine fórmulas, no decide calidad, no publica resultados, no otorga acceso y no ejecuta recomendaciones. Ordena y proyecta información gobernada que ya pasó por `DATA-AUTH-001` a `DATA-AUTH-004`.

Principio rector:

```text
INICIO EJECUTIVO
=
CONTEXTO EFECTIVO
+ RESULTADOS AUTORIZADOS
+ PRIORIZACIÓN DE PRESENTACIÓN POR RESPONSABILIDAD
+ CALIDAD Y LIMITACIONES VISIBLES
+ ATENCIÓN REQUERIDA
+ NAVEGACIÓN A LA FUENTE PROPIETARIA

NO

ROL = ACCESO
ROL = PERMISO
ROL = FILTRO DE SEGURIDAD
ROL = KPI INVENTADO
ROL = DASHBOARD UNIVERSAL
```

---

#### 2. Resultado sustantivo

La tarea materializa cuatro artefactos lógicos coordinados:

1. `DATA-EXECUTIVE-HOME-UX-CONTRACT-001`: contrato de composición, contexto, simplicidad, navegación, estados y divulgación progresiva del inicio.
2. `DATA-EXECUTIVE-HOME-ROLE-PROFILE-MATRIX-001`: decisión explícita de presentación para los nueve roles base canónicos vigentes.
3. `DATA-EXECUTIVE-HOME-ATTENTION-CONTRACT-001`: reglas para construir una cola breve de atención desde condiciones canónicas existentes, sin crear estados de negocio nuevos.
4. `DATA-EXECUTIVE-HOME-ANALYTIC-COVERAGE-MATRIX-001`: cobertura materializada de las 14 métricas de asistencia, las 55 familias analíticas y las seis familias de artefacto D008 que pueden alimentar el inicio cuando exista una métrica o salida concreta autorizada.

Balance materializado:

| Control                                          |                  Resultado |
| ------------------------------------------------ | -------------------------: |
| Roles base canónicos con perfil explícito        |                  **9 / 9** |
| Métricas de asistencia reconciliadas             |                **14 / 14** |
| Métricas `NO EVALUADO` / `BLOQUEADO` preservadas |                 **11 / 3** |
| Familias analíticas reconciliadas                |                **55 / 55** |
| Distribución D009–D013                           | **11 + 12 + 10 + 12 + 10** |
| Familias de artefacto D008 reconciliadas         |                  **6 / 6** |
| Objetos maestros/referencia redefinidos          |                      **0** |
| Fórmulas o metric keys creados                   |                      **0** |
| Permisos, grants o roles creados                 |                      **0** |
| Cambios físicos                                  |                      **0** |
| Requisitos TREQ creados o modificados            |                      **0** |

Los 62 objetos maestros y de referencia no se duplican en esta tarea. Su experiencia de catálogo, definición, dueño, fuente, calidad y linaje pertenece expresamente a `DATA-UX-002`.

---

#### 3. Entradas canónicas consumidas

`DATA-UX-001` consume sin redefinir:

- `DATA-DOM-004` para identidad y versión de métricas;
- `DATA-DOM-005` para tiempo, grano, dimensiones, comparabilidad y lectura correcta del resultado;
- `DATA-DOM-007` para los estados `NO EVALUADO`, `EN OBSERVACIÓN`, `CERTIFICADO`, `DEGRADADO` y `BLOQUEADO`;
- `DATA-DOM-008` para tablero, reporte, exportación, suscripción, alerta y snapshot oficial;
- `DATA-DOM-009` a `DATA-DOM-013` para las 55 familias analíticas;
- `DATA-DOM-014` para señal, diagnóstico, hipótesis, confianza y recomendación;
- `DATA-DOM-015` para línea base, objetivo, meta, drivers y guardrails;
- `DATA-DOM-016` para acción, experimento, medición, aprendizaje y decisión;
- `DATA-DOM-017` para versiones, correcciones, restatements e historia;
- `DATA-AUTH-001` para construir el conjunto autorizado antes de agregación o presentación;
- `DATA-AUTH-002` para clasificación, minimización, inferencia, poblaciones pequeñas, comparación y drill-down;
- `DATA-AUTH-003` para separar definición, certificación, publicación, meta, anotación, exportación y administración;
- `DATA-AUTH-004` para trazabilidad de consultas, descargas, suscripciones, alertas, modelos y recomendaciones;
- `UX-BASE-001` a `UX-BASE-015` para separación de carriles, relevancia, contexto visible, lenguaje humano, simplicidad, excepciones, divulgación progresiva, densidad y accesibilidad de la interacción;
- `NFR-REQ-005` a `NFR-REQ-007` para privacidad, trazabilidad, accesibilidad y ergonomía;
- las nueve identidades de rol base materializadas por las matrices vigentes: `propietario`, `gerente_general`, `gerente`, `supervisor`, `contador`, `marketing`, `logistica`, `auxiliar_administrativa` y `talento_humano`;
- los requisitos vigentes `TREQ-DATA-002`, `TREQ-DATA-004`, `TREQ-UX-003`, `TREQ-UX-005` y `TREQ-UX-010`.

La prioridad visual por rol se limita a ordenar información que el actor ya puede conocer. La fuente de autorización continúa siendo el contrato canónico de permisos, contexto, recurso, alcance y finalidad.

---

#### 4. Fronteras conceptuales obligatorias

```text
ROL BASE ≠ PERMISO ≠ AUTORIZACIÓN FINAL
```

```text
PRIORIDAD VISUAL ≠ ACCESO
```

```text
INICIO EJECUTIVO ≠ TABLERO COMPLETO ≠ CATÁLOGO DE MÉTRICAS
```

```text
SEÑAL ≠ DIAGNÓSTICO ≠ RECOMENDACIÓN ≠ ACCIÓN
```

```text
ALERTA ≠ INCUMPLIMIENTO ≠ CAUSA
```

```text
VALOR ACTUAL ≠ META ≠ FORECAST ≠ BASELINE
```

```text
DELTA ≠ CAUSALIDAD
```

```text
AGREGADO ≠ DERECHO AL DETALLE
```

```text
BLOQUEADO ≠ CERO ≠ SIN DATOS
```

```text
NO EVALUADO ≠ CERTIFICADO
```

```text
PUBLICADO ≠ EXPORTABLE
```

```text
FILTRO SELECCIONADO ≠ TERRITORIO AUTORIZADO
```

```text
PREFERENCIA DE HOME ≠ FUENTE DE VERDAD
```

---

#### 5. Contrato `DATA-EXECUTIVE-HOME-UX-CONTRACT-001`

Toda representación del inicio deberá poder resolver conceptualmente:

```text
actor efectivo
+ rol base real para prioridad de presentación
+ permisos efectivos
+ alcance y territorio autorizados
+ finalidad de consulta
+ periodo y corte
+ métricas y versiones gobernadas
+ estado de calidad
+ protección de divulgación
+ condiciones canónicas de atención
+ destinos autorizados
→ inicio ejecutivo
```

Reglas:

1. el rol base puede alterar orden, prominencia y texto contextual, pero nunca ampliar población, campos, aplicaciones, territorios o acciones;
2. una tarjeta, conteo, tendencia o alerta se calcula solo sobre el conjunto autorizado de A001 y la proyección protegida de A002;
3. una acción desde el inicio exige la capacidad correspondiente de A003 y una nueva evaluación en la superficie destino;
4. las consultas que alimentan la home conservan la trazabilidad de A004;
5. una métrica sin identidad/version canónica no se presenta como KPI ejecutivo;
6. un resultado sin periodo, corte o contexto suficiente no se presenta como cifra autosuficiente;
7. un resultado `BLOQUEADO` no se reemplaza por cero ni por una cifra provisional presentada como oficial;
8. la home no crea umbrales, metas, alertas o reglas de prioridad empresarial que no existan en una fuente gobernada;
9. una recomendación no puede ejecutar cambios desde la home;
10. la home no es una fuente editable y no admite corrección directa de datos fuente.

---

#### 6. Simplicidad obligatoria de la primera vista

La primera vista se limita a cinco zonas principales:

1. **Contexto efectivo**.
2. **Atención requerida**.
3. **Resultados principales**.
4. **Calidad y limitaciones**.
5. **Continuar análisis**.

Reglas de densidad:

- máximo **6 resultados principales** simultáneos en la vista inicial;
- máximo **5 elementos de atención** visibles antes de una acción explícita para consultar el resto;
- un resultado principal representa una métrica concreta y versionada, no una familia genérica;
- no se muestran tablas extensas, catálogos completos, filas fuente ni más de un nivel de detalle en la primera vista;
- las opciones avanzadas, filtros exhaustivos, comparaciones complejas, exportaciones y configuraciones permanecen en superficies posteriores;
- en pantallas estrechas las zonas se apilan y conservan jerarquía; no se presenta una versión encogida de escritorio;
- densidad administrativa no elimina accesibilidad, contexto, calidad ni protección.

Si el actor no tiene seis resultados relevantes y autorizados, se muestran menos. No se rellenan espacios con métricas de vanidad o indicadores sin propósito de decisión.

---

#### 7. Encabezado de contexto efectivo

El encabezado deberá mostrar, cuando aplique y sea seguro:

- actor o identidad de sesión en términos humanos;
- rol base usado únicamente como perfil de presentación;
- organización o alcance empresarial efectivo;
- sede, área o territorio cuando el resultado esté territorializado;
- periodo observado;
- fecha/hora de corte;
- zona horaria cuando sea material;
- filtros materiales activos;
- indicación de vista parcial cuando el alcance autorizado no represente toda la organización;
- estado de disponibilidad cuando alguna fuente necesaria no pueda confirmarse.

El encabezado no usa la sede seleccionada para fabricar autoridad. Un alcance parcial deberá quedar claro para impedir que el usuario interprete una cifra local como total organizacional.

---

#### 8. Resultados principales

Cada tarjeta principal deberá contener únicamente lo necesario para decidir si se requiere profundizar:

```text
nombre empresarial de la métrica
valor o estado protegido
unidad o moneda
periodo y corte
comparación gobernada cuando exista
estado de calidad
alcance relevante
señal de atención cuando una regla gobernada la produzca
navegación siguiente autorizada
```

Reglas:

1. el nombre visible proviene del registro canónico de métricas;
2. fórmula, numerador, denominador y detalle fuente no se copian a la home; se consultan en `DATA-UX-002` cuando corresponda;
3. una comparación solo aparece cuando ambos lados son comparables, autorizados y divulgables;
4. el delta debe identificar referencia, periodo o baseline; nunca se presenta un porcentaje sin denominador interpretable;
5. color, flecha o icono nunca son la única forma de expresar tendencia o calidad;
6. el resultado puede mostrar una tendencia compacta, pero el análisis completo pertenece a `DATA-UX-003`;
7. la tarjeta no permite editar el agregado ni la fuente;
8. el click o navegación no concede drill-down; el destino vuelve a autorizar el siguiente nivel.

---

#### 9. Contrato `DATA-EXECUTIVE-HOME-ATTENTION-CONTRACT-001`

La cola de atención reúne únicamente condiciones ya gobernadas. No crea un estado de negocio paralelo.

Una fila lógica deberá poder proyectar:

```text
source_kind
source_ref
metric_or_artifact_ref
condition_ref
scope_summary
period_or_cut
quality_state
human_reason
owner_or_destination
next_navigation
```

Puede entrar a la cola cuando una fuente canónica determine, por ejemplo:

- una dependencia `BLOQUEADO` relevante para una decisión del actor;
- calidad `DEGRADADO` o `EN OBSERVACIÓN` que deba ser visible para ese uso;
- una regla de alerta gobernada que produjo señal;
- una meta o guardrail gobernado que requiere revisión;
- una entrega, publicación o artefacto cuyo estado fuente exige actuación;
- una investigación, diagnóstico u objetivo ya existente con una acción pendiente dentro de la autoridad del actor.

No puede entrar por:

- un umbral inventado por la interfaz;
- una comparación local no registrada;
- una recomendación de IA convertida directamente en prioridad;
- una métrica sin versión;
- una cifra de otro territorio que el actor no puede conocer;
- un supuesto de causalidad;
- una regla basada solo en el nombre del rol.

Orden de presentación:

1. condición bloqueante con acción autorizada inmediata;
2. guardrail, alerta o compromiso gobernado con atención vigente;
3. calidad degradada o en observación que limite una decisión actual;
4. revisión o investigación ya iniciada;
5. información relevante sin acción queda fuera de la cola principal.

Si dos condiciones provienen del mismo recurso se evita duplicar la fila; se conserva el motivo de mayor prioridad y se permiten razones adicionales mediante divulgación progresiva.

---

#### 10. Proyección de calidad y disponibilidad

La home conserva literalmente los cinco estados D007 y los traduce a lenguaje humano sin crear equivalencias nuevas:

| Estado D007      | Presentación mínima | Efecto en la home                                                                                          |
| ---------------- | ------------------- | ---------------------------------------------------------------------------------------------------------- |
| `NO EVALUADO`    | **No evaluado**     | Puede mostrarse solo si el uso admite resultado no certificado; nunca usa apariencia de dato certificado.  |
| `EN OBSERVACIÓN` | **En observación**  | Mantiene visible la condición y su navegación a calidad cuando sea relevante.                              |
| `CERTIFICADO`    | **Certificado**     | Informa el estado aplicable; no concede acceso ni publicación.                                             |
| `DEGRADADO`      | **Degradado**       | Expone la limitación de calidad y evita una lectura sin advertencia.                                       |
| `BLOQUEADO`      | **Bloqueado**       | No presenta una cifra oficial dependiente del bloqueo; puede mostrar el bloqueo como condición autorizada. |

Estados de presentación que no deben confundirse con D007:

- **No disponible:** la fuente o dependencia necesaria no pudo confirmarse;
- **Sin datos:** la fuente confirma válidamente ausencia de observaciones dentro del conjunto autorizado;
- **Vista parcial:** la cifra corresponde a un subconjunto autorizado y no al universo total;
- **Suprimido:** A002 impide revelar una celda, comparación o detalle;
- **No mostrado:** el elemento es irrelevante o no autorizable para la home; no se revela su existencia.

`0`, `Sin datos`, `No disponible`, `Suprimido` y `Bloqueado` nunca son intercambiables.

---

#### 11. `DATA-EXECUTIVE-HOME-ROLE-PROFILE-MATRIX-001`

Las nueve filas siguientes son perfiles de **priorización visual**, no matrices de acceso. Cada fila se intersecta con permisos, alcance, finalidad, protección y calidad antes de producir contenido.

| Rol base                  | Pregunta principal del inicio                                                                    | Prioridad visual por defecto                                                                                                   | Contenido que no se presupone                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------- |
| `propietario`             | ¿Qué resultados, riesgos y decisiones requieren atención organizacional?                         | lectura transversal de los dominios autorizados; metas, guardrails, bloqueos y resultados ejecutivos                           | wildcard de datos, detalle sensible, operación física o capacidad por jerarquía                           |
| `gerente_general`         | ¿Dónde se desvía el desempeño y qué decisión ejecutiva requiere seguimiento?                     | resultados transversales, comparaciones gobernadas, objetivos, calidad y atención prioritaria                                  | gobierno propietario, acceso universal, detalle personal o ejecución operativa                            |
| `gerente`                 | ¿Qué requiere atención dentro de mis sedes y responsabilidades asignadas?                        | comercial/servicio, inventario, producción y resultados de personas dentro del alcance; finanzas solo cuando estén autorizadas | otras sedes, total organizacional implícito, datos financieros o personales por nombre del rol            |
| `supervisor`              | ¿Qué condición operativa necesita coordinación o escalamiento dentro de mi alcance?              | señales operativas, calidad, capacidad, inventario, producción, servicio y asistencia autorizada del equipo                    | configuración, finanzas estratégicas, rankings personales o aprobación por supervisar                     |
| `contador`                | ¿Qué resultado financiero, costo, variación o conciliación requiere análisis?                    | costos, margen, gastos, presupuesto, caja, cartera, rentabilidad y componentes autorizados que explican el resultado           | detalle operativo o personal no necesario, autoridad sobre fuentes productivas o comerciales              |
| `marketing`               | ¿Qué resultado comercial, de cliente, promoción o reputación requiere decisión?                  | ventas/demanda, promociones, recurrencia, adquisición, satisfacción y reputación dentro de finalidad autorizada                | acceso individual a clientes, uso posterior de marketing no autorizado o datos AURA operativos inventados |
| `logistica`               | ¿Qué condición de abastecimiento, inventario, proveedor o capacidad logística requiere atención? | existencias, cobertura, faltantes, remisiones, lead time, consumo/plan y capacidad de almacenamiento                           | autoridad financiera, productiva o comercial fuera de la capacidad exacta                                 |
| `auxiliar_administrativa` | ¿Qué seguimiento administrativo autorizado necesita ser atendido o escalado?                     | cola de atención, estados administrativos, programación y resultados de apoyo que sus permisos permitan                        | administración global, aprobación sensible, finanzas estratégicas o detalle operativo por conveniencia    |
| `talento_humano`          | ¿Qué señal laboral o de asistencia requiere revisión dentro de la finalidad autorizada?          | métricas de asistencia, cobertura, calidad y condiciones laborales agregadas permitidas                                        | ranking individual por defecto, datos médicos/disciplinarios, detalle personal o causalidad inferida      |

Reglas:

1. un `role_code` desconocido, contradictorio o no resoluble no selecciona otro perfil por similitud;
2. sin perfil resoluble, la home conserva únicamente una proyección genérica autorizada y muestra el problema de contexto de forma segura; no adopta `propietario` o `gerente_general` como fallback;
3. cambiar de rol real o contexto invalida la priorización anterior y obliga a reconstruir la home;
4. una misma persona puede ver distinto orden al cambiar de responsabilidad autorizada, pero no más datos por el cambio visual;
5. un `INDIVIDUAL_GRANT` puede alterar acciones disponibles, no reescribe el rol base ni convierte el perfil visual en otro rol.

---

#### 12. Métricas de asistencia: cobertura 14/14

Las métricas de asistencia son candidatas naturales para perfiles `talento_humano`, `gerente`, `supervisor`, `gerente_general` y `propietario` únicamente cuando el actor, la finalidad, la población y la divulgación lo permitan. La prioridad no concede detalle individual.

|    # | `metric_key`        | DQ heredado   | Decisión de inicio                                                                                                                        |
| ---: | ------------------- | ------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
|    1 | `scheduledShifts`   | `NO EVALUADO` | Elegible como resultado de cobertura/programación; mostrar periodo, población y calidad; no revelar calendario individual por agregación. |
|    2 | `attendedShifts`    | `NO EVALUADO` | Elegible como señal de asistencia agregada; el detalle por trabajador exige nueva autorización.                                           |
|    3 | `restDayCount`      | `NO EVALUADO` | Elegible cuando la decisión requiere interpretar programación/descanso; no permite inferir presencia individual.                          |
|    4 | `lateCount`         | `NO EVALUADO` | Elegible como señal laboral agregada; no se usa para ranking individual por defecto.                                                      |
|    5 | `noShowCount`       | `NO EVALUADO` | Elegible como señal agregada dentro de población autorizada; proteger inferencia y diferencias de grupos pequeños.                        |
|    6 | `openCount`         | `NO EVALUADO` | Elegible para atención sobre sesiones abiertas; no identifica trabajadores sin autoridad directa.                                         |
|    7 | `missingCloseCount` | `BLOQUEADO`   | No se presenta como KPI oficial; puede aparecer como condición `BLOQUEADO` con navegación a calidad/investigación autorizada.             |
|    8 | `autoCloseCount`    | `NO EVALUADO` | Elegible como señal de calidad/operación; no implica causa ni responsabilidad individual.                                                 |
|    9 | `departureCount`    | `NO EVALUADO` | Elegible solo con minimización reforzada por posible implicación de ubicación/comportamiento.                                             |
|   10 | `scheduledMinutes`  | `NO EVALUADO` | Elegible como carga programada agregada; no concede comparación individual.                                                               |
|   11 | `netMinutes`        | `NO EVALUADO` | Elegible como resultado agregado; diferencias no prueban desempeño o causalidad.                                                          |
|   12 | `incidentCount`     | `NO EVALUADO` | Elegible como señal agregada; causas y expedientes permanecen protegidos.                                                                 |
|   13 | `attendanceRate`    | `BLOQUEADO`   | No se presenta como KPI oficial mientras persista D007; la home muestra el bloqueo cuando sea relevante y autorizado.                     |
|   14 | `punctualityRate`   | `BLOQUEADO`   | No se presenta como KPI oficial mientras persista D007; no se usa para ranking ni comparación personal por inferencia.                    |

**Reconciliación:** 14 esperadas; 14 materializadas; 14 claves únicas; 11 `NO EVALUADO`; 3 `BLOQUEADO`; 0 faltantes; 0 duplicadas.

---

#### 13. `DATA-EXECUTIVE-HOME-ANALYTIC-COVERAGE-MATRIX-001` — 55 familias

Una familia es un agrupador de análisis, no una métrica ejecutable. Para aparecer en la home deberá existir una métrica concreta y versionada de esa familia, apta para el uso y autorizada para el actor. La columna de perfiles indica **prioridad de presentación candidata**, nunca autorización.

##### 13.1. Comercial — `DATA-DOM-009` — 11 familias

|    # | Familia canónica                             | Perfiles de prioridad candidata                                       | Decisión de inicio                                                                                                 |
| ---: | -------------------------------------------- | --------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
|    1 | ventas netas y brutas                        | `propietario`, `gerente_general`, `gerente`, `marketing`              | Elegible como resultado principal si la base comercial/fiscal está gobernada; no presentar “ventas” ambiguas.      |
|    2 | pedidos y conversión                         | `propietario`, `gerente_general`, `gerente`, `marketing`              | Elegible solo con numerador/denominador comparables; conversión bloqueada no se fabrica desde conteos de pedidos.  |
|    3 | ticket y unidades                            | `propietario`, `gerente_general`, `gerente`, `marketing`              | Elegible con transacciones y unidades compatibles; no dividir por filas de producto por conveniencia.              |
|    4 | mezcla por producto, categoría, canal y sede | `propietario`, `gerente_general`, `gerente`, `marketing`              | Elegible como composición; la dimensión no amplía población y el detalle completo queda en `DATA-UX-003`.          |
|    5 | demanda por franja, día y temporada          | `propietario`, `gerente_general`, `gerente`, `marketing`, `logistica` | Elegible con calendario y cobertura suficientes; demanda observada no se rotula como demanda total.                |
|    6 | disponibilidad perdida                       | `propietario`, `gerente_general`, `gerente`, `marketing`, `logistica` | Solo aparece cuando sus componentes están realmente gobernados; un bloqueo se muestra como bloqueo, no como cifra. |
|    7 | cancelaciones, devoluciones y descuentos     | `propietario`, `gerente_general`, `gerente`, `marketing`              | Elegible como resultado/señal con hechos separados; causas sensibles no se infieren desde el agregado.             |
|    8 | promociones y efecto incremental             | `propietario`, `gerente_general`, `gerente`, `marketing`              | Elegible únicamente con exposición y comparación gobernadas; efecto incremental no implica causalidad automática.  |
|    9 | recurrencia y frecuencia                     | `propietario`, `gerente_general`, `gerente`, `marketing`              | Elegible como agregado protegido; no concede identidad o perfil de cliente.                                        |
|   10 | margen relacionado                           | `propietario`, `gerente_general`, `contador`                          | Elegible solo cuando el resultado financiero autorizado esté disponible; venta no se presenta como margen.         |
|   11 | capacidad comercial no utilizada             | `propietario`, `gerente_general`, `gerente`, `marketing`, `logistica` | Elegible si capacidad y venta comparten población/intersección autorizada.                                         |

##### 13.2. Inventario y abastecimiento — `DATA-DOM-010` — 12 familias

|    # | Familia canónica                        | Perfiles de prioridad candidata                                        | Decisión de inicio                                                                               |
| ---: | --------------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------ |
|    1 | existencia disponible y comprometida    | `propietario`, `gerente_general`, `gerente`, `supervisor`, `logistica` | Elegible por LOC/sede autorizada; no revelar ubicaciones excluidas mediante totales.             |
|    2 | cobertura y días de inventario          | `propietario`, `gerente_general`, `gerente`, `supervisor`, `logistica` | Elegible con inventario y consumo/demanda compatibles; contexto y corte visibles.                |
|    3 | rotación y permanencia                  | `propietario`, `gerente_general`, `gerente`, `logistica`               | Elegible con historia y cohortes gobernadas; no extrapolar territorio.                           |
|    4 | faltantes y quiebres                    | `propietario`, `gerente_general`, `gerente`, `supervisor`, `logistica` | Candidata a atención cuando una regla gobernada lo determine; no inventar umbral de urgencia.    |
|    5 | vencimiento, daño y pérdida             | `propietario`, `gerente_general`, `gerente`, `supervisor`, `logistica` | Elegible como señal de calidad/pérdida; causa o responsable requieren detalle autorizado.        |
|    6 | diferencias de conteo                   | `propietario`, `gerente_general`, `gerente`, `supervisor`, `logistica` | Elegible como señal; no convierte la home en superficie de ajuste o aprobación.                  |
|    7 | cumplimiento de remisiones              | `propietario`, `gerente_general`, `gerente`, `supervisor`, `logistica` | Elegible con origen/destino/estado autorizados; cada lado conserva su frontera.                  |
|    8 | lead time y cumplimiento de proveedores | `propietario`, `gerente_general`, `gerente`, `logistica`               | Elegible como desempeño de abastecimiento; no revela expediente comercial completo.              |
|    9 | compras urgentes                        | `propietario`, `gerente_general`, `gerente`, `logistica`               | Elegible si la urgencia proviene de clasificación gobernada; no inventarla en la home.           |
|   10 | consumo versus plan                     | `propietario`, `gerente_general`, `gerente`, `supervisor`, `logistica` | Elegible si plan y consumo comparten alcance/versiones compatibles.                              |
|   11 | costo de inventario                     | `propietario`, `gerente_general`, `contador`                           | Elegible con autorización financiera; stock visible no concede costo por implicación.            |
|   12 | capacidad de almacenamiento             | `propietario`, `gerente_general`, `gerente`, `supervisor`, `logistica` | Elegible sobre instalaciones autorizadas; total organizacional no se fabrica desde subconjuntos. |

##### 13.3. Producción — `DATA-DOM-011` — 10 familias

|    # | Familia canónica                            | Perfiles de prioridad candidata                           | Decisión de inicio                                                                                     |
| ---: | ------------------------------------------- | --------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
|    1 | demanda planificada versus producción       | `propietario`, `gerente_general`, `gerente`, `supervisor` | Elegible con plan y producción comparables; no concede órdenes o necesidades fuente.                   |
|    2 | capacidad disponible y utilizada            | `propietario`, `gerente_general`, `gerente`, `supervisor` | Elegible como capacidad; no inferir otra sede desde el agregado.                                       |
|    3 | adherencia al programa                      | `propietario`, `gerente_general`, `gerente`, `supervisor` | Elegible por versión del programa; KPI no concede edición de programación.                             |
|    4 | rendimiento teórico y real                  | `propietario`, `gerente_general`, `gerente`, `supervisor` | Elegible con receta/versión y lote compatibles; no confundir desviación con causa.                     |
|    5 | consumo estándar y real                     | `propietario`, `gerente_general`, `gerente`, `supervisor` | Elegible con estándar y consumo autorizados; costos/proveedores no se heredan.                         |
|    6 | merma, reproceso y aprovechamiento          | `propietario`, `gerente_general`, `gerente`, `supervisor` | Elegible como señal productiva; causa y responsable permanecen protegidos.                             |
|    7 | calidad, retención y rechazo                | `propietario`, `gerente_general`, `gerente`, `supervisor` | Candidata a atención cuando el estado fuente lo determine; no concede evidencia sensible.              |
|    8 | tiempo de ciclo                             | `propietario`, `gerente_general`, `gerente`, `supervisor` | Elegible con hitos y población autorizados; el agregado no expone recursos excluidos.                  |
|    9 | cumplimiento de liberación                  | `propietario`, `gerente_general`, `gerente`, `supervisor` | Elegible con estados gobernados; no ejecuta liberación desde la home.                                  |
|   10 | costo y variación por lote, producto y sede | `propietario`, `gerente_general`, `contador`              | Elegible con intersección producción-finanzas autorizada; no expone detalle de costos por implicación. |

##### 13.4. Servicio y cliente — `DATA-DOM-012` — 12 familias

|    # | Familia canónica                                        | Perfiles de prioridad candidata                                        | Decisión de inicio                                                                                                        |
| ---: | ------------------------------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
|    1 | cumplimiento de promesa                                 | `propietario`, `gerente_general`, `gerente`, `supervisor`, `marketing` | Elegible como resultado de servicio; no concede expediente de cliente.                                                    |
|    2 | tiempos de preparación, despacho y entrega              | `propietario`, `gerente_general`, `gerente`, `supervisor`, `logistica` | Elegible con fases autorizadas; no se mezclan procesos con poblaciones incompatibles.                                     |
|    3 | pedidos completos                                       | `propietario`, `gerente_general`, `gerente`, `supervisor`              | Elegible con cabecera/líneas/sustituciones gobernadas; detalle permanece fuera de la home.                                |
|    4 | reclamos y tiempo de resolución                         | `propietario`, `gerente_general`, `gerente`, `marketing`               | Elegible como agregado sensible; contenido del caso no se expone por el KPI.                                              |
|    5 | compensaciones                                          | `propietario`, `gerente_general`, `gerente`                            | Elegible con protección de cliente/finanzas; beneficiario e importe no aparecen por defecto.                              |
|    6 | satisfacción y feedback                                 | `propietario`, `gerente_general`, `gerente`, `marketing`               | Elegible con finalidad y fuente diferenciadas; feedback interno y reputación externa no se fusionan.                      |
|    7 | recurrencia, frecuencia y abandono                      | `propietario`, `gerente_general`, `gerente`, `marketing`               | Elegible como población protegida; segmentos pequeños se suprimen.                                                        |
|    8 | adquisición y activación                                | `propietario`, `gerente_general`, `marketing`                          | Elegible cuando origen y evento de activación están gobernados; no concede marketing posterior.                           |
|    9 | fidelización, puntos y redenciones                      | `propietario`, `gerente_general`, `gerente`, `marketing`               | Elegible como agregado; cuenta, ledger y movimientos conservan autorización separada.                                     |
|   10 | reputación y temas recurrentes                          | `propietario`, `gerente_general`, `marketing`                          | Elegible solo desde fuentes gobernadas; no inventar fuentes externas o AURA operativa.                                    |
|   11 | reservas, no-show y utilización                         | `propietario`, `gerente_general`, `gerente`, `marketing`               | Elegible con reserva/capacidad/resultados comparables; no deriva identidad del cliente.                                   |
|   12 | valor y rentabilidad del cliente cuando esté autorizado | `propietario`, `gerente_general`, `contador`, `marketing`              | Solo elegible cuando coinciden autoridad de cliente y resultado económico; si una frontera falla, no se produce el cruce. |

##### 13.5. Económico-financiero — `DATA-DOM-013` — 10 familias

|    # | Familia canónica              | Perfiles de prioridad candidata              | Decisión de inicio                                                                                          |
| ---: | ----------------------------- | -------------------------------------------- | ----------------------------------------------------------------------------------------------------------- |
|    1 | costos estándar y reales      | `propietario`, `gerente_general`, `contador` | Elegible con centro/producto/sede/periodo autorizados; estándar y real conservan semántica propia.          |
|    2 | variaciones                   | `propietario`, `gerente_general`, `contador` | Elegible si base y real son comparables; variación no revela componentes restringidos.                      |
|    3 | margen y contribución         | `propietario`, `gerente_general`, `contador` | Elegible con ingreso y costos autorizados; ventas no conceden costos.                                       |
|    4 | gastos                        | `propietario`, `gerente_general`, `contador` | Elegible por centro/entidad/sede/periodo autorizado; documento fuente no se expone.                         |
|    5 | centros de costo              | `propietario`, `gerente_general`, `contador` | Elegible como dimensión financiera; consultar el centro no concede todos sus hechos.                        |
|    6 | presupuesto y forecast        | `propietario`, `gerente_general`, `contador` | Elegible por versión/escenario; forecast no se presenta como hecho operativo.                               |
|    7 | caja, bancos y tesorería      | `propietario`, `gerente_general`, `contador` | Elegible únicamente con capacidad financiera explícita; saldos sensibles permanecen protegidos.             |
|    8 | cartera y obligaciones        | `propietario`, `gerente_general`, `contador` | Elegible como resumen autorizado; contrapartes y documentos conservan protección propia.                    |
|    9 | rentabilidad multidimensional | `propietario`, `gerente_general`, `contador` | Elegible solo con intersección válida de dimensiones/fuentes; no se filtra seguridad únicamente en cliente. |
|   10 | escenarios y simulaciones     | `propietario`, `gerente_general`, `contador` | Elegible como escenario identificado y no como hecho; simulación no produce autoridad real.                 |

**Reconciliación:** `11 + 12 + 10 + 12 + 10 = 55`; 55 esperadas; 55 materializadas; 0 faltantes; 0 duplicadas.

---

#### 14. Familias de artefacto D008 — cobertura 6/6

|    # | Familia          | Uso desde el inicio                                                                          | Límite                                                                                                   |
| ---: | ---------------- | -------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------- |
|    1 | tablero          | El inicio puede navegar a un tablero analítico más profundo cuando el actor esté autorizado. | El tablero detallado pertenece a `DATA-UX-003`; la home no duplica sus filtros o visualizaciones.        |
|    2 | reporte          | Puede mostrar una referencia breve a una edición relevante u oficial.                        | El contenido, versionado, navegación y distribución pertenecen a `DATA-UX-007`.                          |
|    3 | exportación      | Puede ofrecer la acción solo cuando `EXPORT` esté autorizado.                                | No se muestra como capacidad implícita por poder consultar; generación y descarga siguen A002/A003/A004. |
|    4 | suscripción      | Puede mostrar estado o atención de una suscripción autorizada.                               | Configuración y experiencia detallada pertenecen a `DATA-UX-007`; cada entrega reautoriza.               |
|    5 | alerta           | Puede alimentar la cola de atención cuando una regla gobernada produjo señal.                | La alerta no se convierte en diagnóstico, recomendación o acción.                                        |
|    6 | snapshot oficial | Puede mostrar una referencia a la publicación relevante para el corte.                       | La edición permanece inmutable; comparación/restatement conserva D017 y `DATA-UX-007`.                   |

**Reconciliación:** 6 esperadas; 6 materializadas; 0 faltantes; 0 duplicadas.

---

#### 15. Navegación y divulgación progresiva

La home no contiene todas las decisiones del dominio. Cada expansión tiene un propietario documental exacto:

| Necesidad desde el inicio                                                 | Destino propietario | Regla de handoff                                                             |
| ------------------------------------------------------------------------- | ------------------- | ---------------------------------------------------------------------------- |
| entender definición, dueño, fuente, calidad o linaje de una métrica/dato  | `DATA-UX-002`       | conservar `metric_key`, versión, periodo y contexto sin redefinir la métrica |
| explorar tendencias, comparaciones, dimensiones o drill-down analítico    | `DATA-UX-003`       | reautorizar el nivel de detalle; la home no transmite permiso de drill-down  |
| comprender o resolver calidad, bloqueo, frescura o reconciliación         | `DATA-UX-004`       | conservar estado D007 y referencias de fuente/corte                          |
| investigar una señal, anomalía, hipótesis o recomendación                 | `DATA-UX-005`       | separar señal, diagnóstico, hipótesis, confianza y evidencia                 |
| revisar objetivo, baseline, meta, drivers o guardrails                    | `DATA-UX-006`       | conservar identidad/version del objetivo y no editarlo desde la home         |
| abrir reporte, exportación, suscripción o snapshot                        | `DATA-UX-007`       | conservar artefacto, versión, corte, autorización y protección de salida     |
| validar comprensión, utilidad, densidad y decisiones por rol con usuarios | `DATA-UX-008`       | probar la home materializada antes de declarar readiness de experiencia      |
| materializar consultas, modelos, caché y contratos de rendimiento         | `DATA-INT-002`      | implementar la capa semántica sin convertir la UI en fuente de cálculo       |
| integrar BI, hojas, modelos externos o IA                                 | `DATA-INT-004`      | preservar autorización, minimización y auditoría de herramientas externas    |

No queda una decisión de experiencia del inicio diferida sin tarea propietaria exacta.

---

#### 16. Acciones desde el inicio

La home puede ofrecer navegación o acciones de presentación como:

- revisar una condición de calidad;
- abrir una investigación existente o iniciar el flujo autorizado para investigarla;
- abrir un objetivo o guardrail;
- abrir un tablero más profundo;
- abrir una edición de reporte o snapshot;
- solicitar una exportación cuando la capacidad exista;
- revisar una alerta o suscripción;
- consultar la definición de la métrica.

Reglas:

1. cada acción conserva una etiqueta humana que describe el destino real;
2. una acción oculta por falta de autoridad no se sustituye por un botón deshabilitado que revele capacidades sensibles;
3. si la acción es pertinente pero está bloqueada por una condición visible, se explica con la gramática de `UX-BASE-006`;
4. la home no incluye botones genéricos como “Resolver” o “Optimizar” que oculten el efecto empresarial;
5. una recomendación nunca se presenta como “Aplicar automáticamente” salvo que otra tarea propietaria defina y autorice expresamente un flujo de acción, que seguirá siendo una decisión independiente.

---

#### 17. Filtros

La primera vista utiliza pocos filtros materiales. Como mínimo, cuando sean aplicables y autorizables:

- periodo;
- territorio o sede;
- área o unidad organizacional;
- dominio/familia analítica.

Reglas:

- los filtros reducen el conjunto autorizado y no crean autoridad;
- las opciones de filtro no enumeran valores no autorizados;
- cambiar periodo, territorio o población obliga a recalcular métricas y atención bajo el nuevo contexto;
- filtros avanzados, cohortes, múltiples dimensiones y comparaciones complejas pertenecen a `DATA-UX-003`;
- el rol base selecciona prioridades de presentación, no un filtro de seguridad oculto;
- una vista “toda la organización” solo existe cuando el alcance real lo permite y todas las fuentes participantes son compatibles con ese resultado.

---

#### 18. Metas, guardrails y recomendaciones

- una meta solo aparece cuando existe un objetivo D015 autorizado y la home puede identificar su métrica, baseline, horizonte y versión;
- la home no permite editar meta ni baseline;
- un guardrail se muestra como condición distinta del KPI principal;
- una alerta no fija una meta;
- una recomendación puede mostrarse como referencia informativa cuando esté autorizada, con confianza y límites disponibles;
- una recomendación no cambia prioridad empresarial por sí sola, no demuestra causalidad y no ejecuta acción;
- un modelo predictivo no obtiene una tarjeta ejecutiva solo por producir un score: debe existir propósito de decisión, versión, calidad y autorización.

---

#### 19. Historia, correcciones y restatements

1. toda tarjeta o señal histórica conserva la versión semántica y corte aplicables;
2. una corrección posterior no reescribe silenciosamente la cifra que fue visible antes;
3. original y restatement se presentan como resultados distinguibles cuando la comparación esté autorizada;
4. la home no mezcla una meta histórica con una versión actual sin identificar el cambio;
5. una tendencia que cruza una ruptura semántica debe indicar la incompatibilidad o usar la reconstrucción gobernada que D017 admita;
6. un snapshot oficial conserva identidad propia y no se sustituye por el valor vivo actual.

---

#### 20. Privacidad, inferencia y datos sensibles

- la home usa agregados y proyecciones mínimas; no carga modelos completos para ocultar campos en cliente;
- poblaciones pequeñas y comparaciones sensibles aplican A002 antes de renderizar;
- no se presenta ranking individual de trabajadores, clientes o proveedores por defecto;
- nombres, identificadores, contactos, ubicaciones individuales, importes restringidos, evidencia, secretos y configuraciones técnicas no aparecen en tarjetas ordinarias salvo necesidad y autorización específicas;
- un conteo, tooltip, título o texto alternativo no puede reintroducir una celda suprimida;
- una tarjeta de cliente o talento no concede navegación a personas por herencia;
- un error de autorización no revela que existe una métrica, segmento o recurso secreto.

---

#### 21. Accesibilidad y ergonomía

El inicio deberá cumplir la línea base de `NFR-REQ-007` y `UX-BASE-*`:

- orden semántico equivalente al orden visual;
- navegación completa por teclado cuando corresponda;
- foco visible;
- nombres accesibles de controles y estados;
- calidad, tendencia y prioridad no dependen exclusivamente de color;
- gráficos compactos tienen resumen textual equivalente;
- cambios automáticos no desplazan foco ni reordenan contenido mientras la persona interactúa;
- tamaño y espaciado de objetivos siguen la superficie/dispositivo aplicables;
- zoom y reflow no requieren scroll horizontal ordinario en la home;
- mensajes de bloqueo indican qué ocurrió, qué puede hacerse y cuál es el destino correcto sin exponer códigos internos;
- la simplificación no elimina fecha de corte, calidad, alcance o contexto necesarios para interpretar la cifra.

La validación con personas y contextos reales pertenece a `DATA-UX-008`.

---

#### 22. Auditoría y observabilidad

- la carga y las consultas materiales de la home quedan bajo A004;
- cambios de filtros que alteren materialmente población o resultado son solicitudes analíticas nuevas cuando el contrato de auditoría así lo exija;
- la auditoría registra referencias/versiones y no copia datasets o PII en logs;
- navegación hacia reporte, exportación, suscripción, alerta, modelo o recomendación conserva correlación;
- un fallo técnico al construir la home no se presenta como `DENY` empresarial;
- ausencia de evento físico no se interpreta como ausencia de uso mientras la implementación de auditoría no exista.

---

#### 23. Cobertura de requisitos de prueba vigente

La conducta materializada por `DATA-UX-001` ya está protegida por requisitos canónicos vigentes:

- `TREQ-DATA-002` exige identidad/versionado común de métricas, propósito, propietario, fórmula, granularidad, dimensiones, fuente, calidad, estado de certificación, drill-down y comparación; asigna responsabilidad a `DATA-UX-001` a `DATA-UX-003`;
- `TREQ-DATA-004` exige que la vista principal sea simple y accionable, con versión, periodo, zona horaria, filtros, dimensiones, corte, frescura, cobertura, calidad, divulgación progresiva y drill-down autorizado; asigna responsabilidad a `DATA-UX-001` a `DATA-UX-008`;
- `TREQ-UX-003` exige que cada actor vea únicamente información, acciones y densidad adecuadas a su tarea y autorización, con opciones irrelevantes ocultas;
- `TREQ-UX-005` exige fuente de verdad, estado, actor y último cambio visibles cuando apliquen, evitando copias competidoras y doble captura;
- `TREQ-UX-010` exige que superficies administrativas muestren territorio, periodo, versión, estado, población, actor, permiso, segregación e impacto cuando apliquen y que una proyección no se convierta en fuente de verdad.

La presente tarea especializa esas obligaciones para el inicio ejecutivo y materializa perfiles de presentación, cobertura analítica, atención, contexto y navegación. No introduce una nueva capacidad ejecutable, un algoritmo de cálculo, una regla de autorización, una métrica o un estado de dominio adicional.

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** el comportamiento verificable de simplicidad, relevancia por actor, contexto, métricas versionadas, calidad visible, divulgación progresiva, navegación autorizada, fuente de verdad y densidad administrativa ya está protegido por los requisitos canónicos vigentes enumerados en la sección de cobertura anterior. `DATA-UX-001` materializa su aplicación al inicio ejecutivo sin crear una regla ejecutable adicional fuera de esa cobertura.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 24. Criterios de aceptación

1. la home se define como superficie de presentación y navegación, no como fuente de verdad;
2. existen exactamente cinco zonas principales en la primera vista: contexto, atención, resultados, calidad/limitaciones y continuar análisis;
3. se muestran como máximo seis resultados principales simultáneos;
4. se muestran como máximo cinco elementos de atención antes de divulgación progresiva;
5. ninguna tarjeta se crea desde una familia genérica sin métrica concreta y versionada;
6. cada tarjeta conserva nombre empresarial, valor/estado, unidad, periodo/corte, calidad, alcance y navegación cuando apliquen;
7. el rol base solo altera prioridad y orden de presentación;
8. rol base, jerarquía o perfil visual nunca amplían autorización;
9. los nueve roles base canónicos tienen decisión de presentación explícita;
10. la reconciliación de roles es 9/9, sin perfiles faltantes ni códigos inventados;
11. un rol desconocido o conflictivo no usa otro rol como fallback;
12. el conjunto autorizado se construye antes de agregación y presentación;
13. A002 se aplica antes de renderizar campos, comparaciones, poblaciones o drill-down;
14. una acción de A003 se reautoriza y no se hereda desde la home;
15. las consultas materiales conservan trazabilidad A004;
16. filtros reducen alcance y no fabrican territorio o autoridad;
17. una vista parcial se identifica como parcial y no como total organizacional;
18. `NO EVALUADO`, `EN OBSERVACIÓN`, `CERTIFICADO`, `DEGRADADO` y `BLOQUEADO` conservan su semántica D007;
19. `0`, `Sin datos`, `No disponible`, `Suprimido` y `Bloqueado` permanecen distintos;
20. los tres indicadores de asistencia bloqueados no se presentan como KPI oficial;
21. se materializan exactamente 14 métricas de asistencia con 11 `NO EVALUADO` y 3 `BLOQUEADO`;
22. no se habilita ranking individual de trabajadores por permiso agregado;
23. se materializan exactamente 55 familias analíticas;
24. se conserva la distribución `11 + 12 + 10 + 12 + 10`;
25. cada una de las 55 familias tiene decisión de elegibilidad de inicio explícita;
26. una familia no se convierte en permiso, métrica o KPI por aparecer en la matriz;
27. se materializan exactamente seis familias de artefacto D008;
28. tablero, reporte, exportación, suscripción, alerta y snapshot conservan límites distintos;
29. una exportación no aparece como capacidad implícita por poder consultar;
30. una alerta no equivale a diagnóstico, recomendación o acción;
31. una meta no equivale a valor observado y no se edita desde la home;
32. una recomendación no modifica baseline, certificación o prioridad por sí sola;
33. un modelo o IA no aparece como resultado ejecutivo sin propósito, versión, calidad y autorización;
34. la cola de atención solo consume condiciones canónicas y no inventa umbrales;
35. una condición bloqueante puede priorizarse sin cambiar el estado del recurso;
36. se evita duplicar el mismo recurso en la cola por múltiples razones compatibles;
37. definición y linaje navegan a `DATA-UX-002`;
38. análisis profundo y drill-down navegan a `DATA-UX-003`;
39. calidad y bloqueos navegan a `DATA-UX-004`;
40. investigación navega a `DATA-UX-005`;
41. objetivos y guardrails navegan a `DATA-UX-006`;
42. reportes, exportaciones, suscripciones y snapshots navegan a `DATA-UX-007`;
43. validación con usuarios queda asignada a `DATA-UX-008`;
44. capa semántica física queda asignada a `DATA-INT-002`;
45. BI/modelos externos/IA quedan asignados a `DATA-INT-004`;
46. no queda un pendiente narrativo sin propietario documental exacto;
47. la home no duplica los 62 objetos maestros/referencia ni invade `DATA-UX-002`;
48. no se crean rutas, aplicaciones, componentes o nombres físicos;
49. no se crea ni asigna ningún permiso, grant, rol o excepción;
50. no se modifica código, DDL, DML, RLS, RPC, datos, migraciones, backfills, despliegues o Supabase;
51. no se crea ni modifica ningún requisito de prueba;
52. `DATA-UX-002` permanece únicamente reservada.

---

#### 25. Balance de cierre

| Control                                         |   Resultado |
| ----------------------------------------------- | ----------: |
| Roles base esperados / materializados           |   **9 / 9** |
| Resultados principales máximos en primera vista |       **6** |
| Ítems de atención máximos en primera vista      |       **5** |
| Métricas de asistencia                          | **14 / 14** |
| Métricas `NO EVALUADO` / `BLOQUEADO`            |  **11 / 3** |
| Familias comerciales                            | **11 / 11** |
| Familias inventario/abastecimiento              | **12 / 12** |
| Familias producción                             | **10 / 10** |
| Familias servicio/cliente                       | **12 / 12** |
| Familias económico-financieras                  | **10 / 10** |
| Familias analíticas totales                     | **55 / 55** |
| Artefactos D008                                 |   **6 / 6** |
| Objetos maestros/referencia duplicados          |       **0** |
| Permisos/roles/grants creados                   |       **0** |
| Cambios físicos                                 |       **0** |
| Requisitos TREQ nuevos o modificados            |       **0** |

---

#### 26. Continuidad

ÚLTIMA TAREA APROBADA
`DATA-AUTH-004 — Auditar consultas, descargas, suscripciones, alertas, modelos y recomendaciones`

TAREA ACTUAL APROBADA
`DATA-UX-001 — Diseñar inicio ejecutivo simple y accionable por rol`

SIGUIENTE TAREA RESERVADA
`DATA-UX-002 — Diseñar catálogo de métricas y datos maestros con definición, dueño, fuente, calidad y linaje`


### ✅ DATA-UX-002 — Diseñar catálogo de métricas y datos maestros con definición, dueño, fuente, calidad y linaje

**Estado:** APROBADA
**Tarea anterior:** `DATA-UX-001 — Diseñar inicio ejecutivo simple y accionable por rol` — APROBADA
**Tarea siguiente:** `DATA-UX-003 — Diseñar tableros por dominio con filtros, comparación, drill-down y trazabilidad` — RESERVADA
**Tipo de tarea:** documental; diseño materializado de la experiencia de catálogo gobernado para métricas, datos maestros y datos de referencia con definición, gobierno, fuente, calidad, linaje e historia
**Bloque:** AB — Analítica, indicadores y datos maestros
**Fase:** exclusivamente documental
**Implementación técnica:** no autorizada
**Código, DDL, DML, migraciones, RLS, RPC, grants, backfills, cambios de datos, despliegues o cambios en Supabase:** no autorizados
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Diseñar y materializar la experiencia de un catálogo gobernado que permita localizar y comprender una métrica, un dato maestro o un dato de referencia sin depender de nombres de tablas, fórmulas locales, conocimiento tribal o navegación por aplicaciones propietarias.

La persona autorizada deberá poder responder, desde una única experiencia conceptual:

```text
qué es este elemento
qué identidad y versión tiene
quién responde por su definición
quién ejerce stewardship
cuál es su fuente de verdad lógica
qué calidad o bloqueo tiene hoy
qué linaje puede demostrarse
qué consumidores o usos dependen de él
qué cambió históricamente
qué detalle adicional puede consultar con su autorización actual
```

El catálogo es una superficie de gobierno, descubrimiento y navegación. No es una base maestra universal, no es la capa semántica física, no es un editor genérico, no certifica calidad por presentar un estado y no concede acceso al contenido fuente por mostrar metadatos.

---

#### 2. Resultado sustantivo

Queda materializado el diseño del catálogo con los siguientes resultados:

- una arquitectura de información única con dos colecciones gobernadas: métricas/indicadores y datos maestros/de referencia;
- una ficha de catálogo que separa definición, gobierno, fuente, calidad, linaje e historia;
- búsqueda y filtros sobre metadatos previamente autorizados, sin usar opciones de filtro como canal de enumeración;
- separación entre fuente de verdad lógica, implementación técnica observada y consumidor;
- separación entre estado documental y estado de calidad/certificación;
- linaje lógico navegable que conserva origen, versiones y derivados sin convertirlo en permiso de acceso al detalle;
- decisiones explícitas para los **62 objetos** heredados del catálogo maestro: **43 maestros, 19 referencias, 58 dimensiones compartidas y 3 objetos AURA bloqueados**;
- calidad visible para esos 62 objetos: **59 `NO EVALUADO` y 3 `BLOQUEADO`** en la coordenada DQ vigente;
- decisiones explícitas para las **14 métricas de asistencia v1** del registro canónico inicial;
- calidad visible para esas métricas: **11 `NO EVALUADO` y 3 `BLOQUEADO`**;
- preservación de `missingCloseCount`, `attendanceRate` y `punctualityRate` como bloqueadas para certificación;
- cero métricas nuevas inventadas para las 55 familias analíticas que todavía no tienen una definición concreta incorporada al registro de métricas;
- cero cambios físicos y cero cambios de requisitos de prueba.

---

#### 3. Entradas canónicas consumidas

Esta tarea consume sin redefinir:

- `DATA-UX-001`, que reserva explícitamente a esta tarea la navegación de definición y linaje desde el inicio ejecutivo;
- `DATA-DOM-001`, para gobierno federado, propietario funcional, steward, custodio, consumidor y fuente de verdad lógica;
- `DATA-DOM-002`, para el inventario materializado de 62 objetos, clases, rol dimensional, fuentes, propietarios, stewards, consumidores, estados y fronteras;
- `DATA-DOM-003`, para identidad, claves, códigos, jerarquías, vigencia, ciclo de vida, fusión y separación;
- `DATA-DOM-004`, para identidad/versionado de métricas y el registro inicial de 14 métricas reales de asistencia;
- `DATA-DOM-005`, para grano, tiempo, corte, dimensiones y comparabilidad histórica;
- `DATA-DOM-006`, para origen, ingestión, transformación, reconciliación y linaje hasta evidencia/versiones aplicadas;
- `DATA-DOM-007`, para calidad, frescura, cobertura, certificación y estados DQ;
- `DATA-DOM-017`, para versionado, correcciones, restatements e historia reproducible;
- `DATA-AUTH-001`, para conjunto autorizado por actor, recurso, dominio, territorio, finalidad, vigencia y población;
- `DATA-AUTH-002`, para minimización, metadatos sensibles, poblaciones pequeñas, comparaciones y detalle;
- `DATA-AUTH-003`, para segregación entre definición, certificación, publicación, metas, anotación, exportación y administración;
- `DATA-AUTH-004`, para trazabilidad de consultas y navegación analítica;
- los requisitos DATA y UX vigentes que ya protegen maestros gobernados, registro canónico de métricas, linaje, calidad visible, fuente de verdad y superficies administrativas.

El catálogo proyecta estas decisiones; no crea un modelo paralelo de identidad, calidad, propiedad, autorización o linaje.

---

#### 4. Fronteras conceptuales obligatorias

```text
CATÁLOGO ≠ FUENTE DE VERDAD
CATÁLOGO ≠ TABLA MAESTRA UNIVERSAL
CATÁLOGO ≠ CAPA SEMÁNTICA FÍSICA
CATÁLOGO ≠ EDITOR GENÉRICO
CATÁLOGO ≠ MOTOR DE CERTIFICACIÓN
CATÁLOGO ≠ AUTORIZACIÓN
CATÁLOGO ≠ INVENTARIO DE TABLAS
```

```text
DEFINICIÓN ≠ VALOR OBSERVADO
DUEÑO ≠ STEWARD ≠ CUSTODIO ≠ CERTIFICADOR
FUENTE LÓGICA ≠ TABLA FÍSICA ≠ COPIA ANALÍTICA
ESTADO DOCUMENTAL ≠ ESTADO DQ
LINAJE ≠ PERMISO DE DRILL-DOWN
DIMENSIÓN COMPARTIDA ≠ NUEVA IDENTIDAD
MÉTRICA ≠ KPI ≠ META ≠ ALERTA ≠ DASHBOARD
```

Reglas:

1. un registro del catálogo referencia la autoridad canónica y no duplica el estado de negocio como nueva verdad;
2. mostrar un dueño no concede al dueño acceso técnico irrestricto;
3. mostrar una fuente no convierte al consumidor en propietario;
4. mostrar linaje no permite abrir nodos o filas que el actor no esté autorizado a conocer;
5. una fórmula visible se toma de la versión canónica de la métrica y nunca de código local de una pantalla;
6. `ESPECIFICADO` documentalmente no significa `CERTIFICADO` en calidad;
7. `NO EVALUADO` no se presenta como error, degradación ni aprobación;
8. `BLOQUEADO` conserva la causa y no se reemplaza por un dato aproximado;
9. el nombre físico de una tabla, función o archivo no sustituye el nombre empresarial y la identidad canónica;
10. una familia analítica no crea una métrica por el solo hecho de aparecer en el catálogo de dominios.

---

#### 5. Arquitectura de información

La experiencia se organiza en dos colecciones hermanas bajo una misma entrada conceptual:

| Colección                      | Contenido materializado actual | Regla                                                                                                    |
| ------------------------------ | -----------------------------: | -------------------------------------------------------------------------------------------------------- |
| Métricas e indicadores         |   14 métricas de asistencia v1 | cada entrada es una identidad semántica versionada; fórmulas y estados se consumen del registro canónico |
| Datos maestros y de referencia |                     62 objetos | cada entrada conserva su identidad federada, clase, fuente, dueño, steward, calidad y rol dimensional    |

No se fusionan ambas colecciones en una tabla indiferenciada. Comparten patrones de búsqueda, gobierno, calidad, linaje e historia, pero mantienen metadatos específicos.

Las 55 familias analíticas de ventas, inventario, producción, servicio/cliente y finanzas funcionan como contexto de descubrimiento cuando una métrica concreta las referencie. No se crean 55 métricas nominales ni fórmulas vacías para llenar la interfaz.

---

#### 6. Vista de catálogo

La vista principal del catálogo deberá permitir comprender cada resultado sin abrir inmediatamente su detalle.

##### 6.1. Campos comunes mínimos

Cada resultado autorizado muestra, según aplicabilidad:

- nombre empresarial o identidad canónica;
- tipo: métrica, dato maestro o dato de referencia;
- versión o vigencia resoluble;
- propietario funcional;
- steward;
- fuente de verdad lógica;
- estado DQ vigente;
- indicación de bloqueo cuando exista;
- rol de dimensión compartida para maestros/referencias;
- fecha o corte únicamente cuando exista una referencia temporal confiable;
- acceso al detalle gobernado.

No se muestra un falso `Actualizado hoy` si la fuente no aporta una referencia temporal válida.

##### 6.2. Campos específicos de métrica

Una fila de métrica puede mostrar además:

- unidad;
- tipo de métrica;
- propósito o definición breve;
- dimensiones permitidas de la versión;
- estado de certificación;
- existencia de una divergencia o limitación conocida.

La fórmula completa, numerador/denominador, inclusiones, exclusiones, grano, calendario, zona horaria y dependencias se presentan por divulgación progresiva en la ficha.

##### 6.3. Campos específicos de maestro o referencia

Una fila de dato gobernado puede mostrar además:

- clase base;
- si desempeña rol de dimensión compartida;
- frontera funcional breve;
- aplicación o contrato que conserva la fuente lógica;
- estado documental separado del estado DQ.

Claves, aliases, jerarquías y ciclo de vida se muestran únicamente cuando existan en los contratos de identidad vigentes; la interfaz no inventa esos metadatos cuando no estén materializados.

---

#### 7. Búsqueda, filtros y ordenamiento

La búsqueda opera sobre el universo de metadatos que el actor puede conocer, nunca sobre un índice más amplio filtrado después en el cliente.

Filtros conceptuales permitidos cuando existan valores autorizados:

- colección: métricas / maestros / referencias;
- dominio o fuente lógica;
- propietario funcional;
- steward;
- estado DQ;
- bloqueado / no bloqueado;
- dimensión compartida: sí / no;
- versión o vigencia;
- consumidor o uso relacionado cuando esa relación sea visible;
- familia analítica únicamente para métricas realmente vinculadas a ella.

Reglas:

1. una opción de filtro no revela la existencia de un objeto no autorizado;
2. combinar filtros reduce el conjunto visible;
3. limpiar filtros vuelve al universo autorizado, no al universo global;
4. ordenar por calidad no convierte el estado DQ en una puntuación inventada;
5. la búsqueda por nombre técnico puede existir como alias secundario solo cuando el identificador esté canónicamente reconocido y autorizado;
6. resultados bloqueados pueden seguir siendo visibles como metadato de gobierno si el actor está autorizado a conocer su existencia, pero su bloqueo no habilita datos operativos;
7. conteos de resultados, autocomplete y sugerencias aplican la misma protección que las filas visibles.

---

#### 8. Ficha de detalle

Toda ficha de catálogo se divide conceptualmente en seis zonas:

1. **Definición** — qué significa, identidad, clase o tipo, versión/vigencia y frontera semántica.
2. **Gobierno** — propietario funcional, steward, custodio o certificador cuando sean relevantes, sin confundir funciones.
3. **Fuente** — fuente de verdad lógica y, solo cuando esté documentada y autorizada, implementación técnica observada.
4. **Calidad** — estado DQ, frescura/cobertura resolubles, bloqueos y limitaciones; no calcula certificación local.
5. **Linaje** — origen/evidencia, transformaciones/versiones conocidas, identidad gobernada y derivados/consumidores autorizados.
6. **Historia** — versiones, vigencias, correcciones y restatements que el actor esté autorizado a consultar.

La ficha no presenta una pestaña de edición universal. Cualquier mutación, certificación, publicación, anotación o administración se dirige al flujo propietario y reevalúa la capacidad exacta correspondiente.

---

#### 9. Definición

Para una métrica, la zona de definición puede exponer:

```text
metric_key
nombre empresarial
versión semántica
propósito de decisión
fórmula
numerador / denominador
unidad / moneda
precisión
inclusiones / exclusiones
grano
dimensiones permitidas
filtros canónicos
calendario
zona horaria
reglas de comparación
```

Solo se muestran los campos realmente definidos por la versión vigente. Una tasa sin denominador positivo no se explica como `0`.

Para un maestro o referencia, la zona de definición puede exponer:

```text
objeto canónico
clase base
rol de dimensión compartida
frontera semántica
identidad / claves / códigos ya gobernados
jerarquías y vigencia cuando apliquen
ciclo de vida y relaciones canónicas disponibles
```

La coincidencia de etiqueta, nombre, correo, código o valor normalizado nunca se presenta como identidad suficiente para fusionar objetos.

---

#### 10. Dueño y stewardship

La experiencia distingue siempre:

| Función               | Presentación                                                    | No significa                                 |
| --------------------- | --------------------------------------------------------------- | -------------------------------------------- |
| propietario funcional | responsable de semántica y decisión empresarial                 | permiso técnico automático                   |
| steward               | responsable de metadatos, calidad y triage dentro de delegación | acceso irrestricto o certificación universal |
| custodio técnico      | responsable de infraestructura y soporte                        | propiedad empresarial                        |
| certificador          | responsable de la decisión de certificación cuando corresponda  | dueño, publicador o administrador universal  |
| consumidor            | uso autorizado del dato o métrica                               | propiedad, edición o detalle fuente          |

Si la responsabilidad es compartida por atributo, la ficha lo muestra como frontera explícita; no aplana la autoridad en un único “owner” visual.

---

#### 11. Fuente

El campo principal de fuente muestra la **fuente de verdad lógica** o contrato propietario.

Reglas:

- una tabla física no sustituye a la fuente lógica;
- una vista, caché, reporte, snapshot o dataset analítico se presenta como derivado cuando corresponda;
- una fuente externa conserva su procedencia y no se presenta como autoridad interna más amplia de la que posee;
- una implementación técnica observada puede aparecer como evidencia secundaria si existe en los contratos vigentes y el actor puede conocerla;
- una fuente no resoluble no se completa por similitud de nombres;
- los objetos de AURA conservan `AURA objetivo` y su bloqueo, sin inventar una fuente operativa vigente.

---

#### 12. Calidad

El catálogo presenta exactamente los estados DQ definidos por `DATA-DOM-007`:

```text
NO EVALUADO
EN OBSERVACIÓN
CERTIFICADO
DEGRADADO
BLOQUEADO
```

Reglas de presentación:

1. el estado se acompaña de texto, no solo color;
2. `NO EVALUADO` significa que falta evidencia suficiente para certificar, no que el dato sea falso;
3. `EN OBSERVACIÓN` conserva la condición que requiere seguimiento;
4. `CERTIFICADO` solo aparece si existe decisión de certificación vigente;
5. `DEGRADADO` conserva la limitación y el alcance afectado;
6. `BLOQUEADO` impide presentar el elemento como oficial cuando el bloqueo afecta ese uso;
7. la ficha puede explicar controles o evidencia disponible, pero la evaluación profunda y su workflow pertenecen a `DATA-UX-004`;
8. un cambio de calidad produce una nueva proyección del catálogo; no reescribe la historia de lo que estaba vigente en un corte anterior.

---

#### 13. Linaje

El catálogo muestra linaje en capas, con divulgación progresiva:

```text
FUENTE / EVIDENCIA
→ MECANISMO DE ENTRADA O PROYECCIÓN
→ TRANSFORMACIÓN Y VERSIÓN CUANDO APLIQUE
→ OBJETO O MÉTRICA CANÓNICA + VERSIÓN/VIGENCIA
→ DERIVADOS, ARTEFACTOS O CONSUMIDORES AUTORIZADOS
```

Para métricas se añaden:

- versión de métrica;
- corte;
- dimensiones y filtros;
- hechos y maestros participantes;
- snapshot o modelo cuando forme parte del resultado;
- métricas base cuando una tasa o compuesto derive de ellas.

Reglas:

1. el linaje no concede acceso al contenido de un nodo;
2. nodos sensibles se minimizan o se representan mediante referencias protegidas;
3. la ausencia de una transformación física materializada se muestra como ausencia de evidencia técnica, no se inventa un paso;
4. una copia derivada no se eleva a fuente de verdad;
5. una corrección o restatement crea una relación histórica adicional y no borra el origen previo;
6. la materialización física de consultas, modelos, cachés y contratos técnicos pertenece a `DATA-INT-002`;
7. crosswalks e identidades externas pertenecen a `DATA-INT-003`;
8. contratos de eventos y lectura pertenecen a `DATA-INT-001`.

---

#### 14. Historia y versionado

- las 14 métricas actuales conservan versión semántica `1`;
- un cambio material de significado exige una versión posterior y no reemplaza silenciosamente v1;
- una corrección de datos no cambia retrospectivamente la definición de la métrica;
- un objeto maestro conserva vigencias, fusiones, separaciones y relaciones según `DATA-DOM-003`;
- una reconstrucción o restatement conserva la relación con la versión/corte anterior;
- la ficha distingue “vigente ahora” de “vigente en el corte consultado”;
- un elemento retirado puede permanecer visible históricamente cuando la autorización y finalidad lo permitan;
- una versión antigua no se presenta como actual por ser la última que el cliente almacenó en caché.

---

#### 15. Autorización, privacidad y metadatos

El catálogo se construye después de aplicar autorización a su propio universo de metadatos.

Reglas:

1. conocer el nombre de un objeto, fuente, dueño, relación o consumidor puede ser información sensible;
2. filtros, autocomplete, conteos, errores, títulos y linaje aplican la misma clasificación efectiva;
3. el catálogo no recupera metadatos globales para ocultarlos solo en interfaz;
4. acceso a una métrica no concede las filas fuente;
5. acceso a un maestro no concede hechos que lo referencian;
6. acceso a definición no concede certificación, publicación, anotación, exportación o administración;
7. un actor no autorizado no recibe pistas diferenciadas sobre la existencia de un recurso sensible;
8. un drill-down de linaje o definición reevalúa actor, recurso, finalidad, clasificación y alcance;
9. campos personales, financieros, técnicos o comerciales sensibles se minimizan conforme a la protección vigente;
10. los tres objetos AURA bloqueados no exponen una población o dataset operativo inexistente.

---

#### 16. Matriz materializada de los 62 objetos

Cada fila consume el catálogo de `DATA-DOM-002` y la coordenada DQ de `DATA-DOM-007`. `Estado doc.` y `DQ` son deliberadamente columnas distintas.

|    # | Objeto                        | Clase             | Dim. compartida | Fuente lógica                                                | Dueño / steward                                                                         | Estado doc. / DQ               | Definición o frontera                                                                                            | Linaje visible                                                                                                                   |
| ---: | ----------------------------- | ----------------- | :-------------: | ------------------------------------------------------------ | --------------------------------------------------------------------------------------- | ------------------------------ | ---------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
|    1 | `ORGANIZATION_SCOPE`          | `DATO_MAESTRO`    |      `SI`       | VISO                                                         | Dirección / gobierno organizacional / `RESPONSABLE_DEL_PROCESO`                         | `ESPECIFICADO` / `NO EVALUADO` | Paraguas interno; no equivale a persona jurídica.                                                                | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|    2 | `LEGAL_SUBJECT`               | `DATO_MAESTRO`    |      `SI`       | VISO                                                         | Dirección / Contabilidad según atributo / `RESPONSABLE_DEL_PROCESO`                     | `ESPECIFICADO` / `NO EVALUADO` | La condición jurídica exige evidencia externa; la fuente interna conserva el estado empresarial reconciliado.    | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|    3 | `BRAND`                       | `DATO_MAESTRO`    |      `SI`       | VISO                                                         | Dirección / responsable de marca / `RESPONSABLE_DE_MARCA`                               | `ESPECIFICADO` / `NO EVALUADO` | Marca no equivale a titular, establecimiento ni sede.                                                            | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|    4 | `COMMERCIAL_ESTABLISHMENT`    | `DATO_MAESTRO`    |      `SI`       | VISO                                                         | Dirección / Contabilidad / `RESPONSABLE_DEL_PROCESO`                                    | `ESPECIFICADO` / `NO EVALUADO` | Solo se considera verificado con evidencia externa aplicable.                                                    | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|    5 | `BUSINESS_LINE`               | `DATO_MAESTRO`    |      `SI`       | VISO                                                         | Dirección / Gerencia General / `RESPONSABLE_DEL_PROCESO`                                | `ESPECIFICADO` / `NO EVALUADO` | Una línea de negocio no crea automáticamente sede ni titular.                                                    | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|    6 | `PHYSICAL_FACILITY`           | `DATO_MAESTRO`    |      `SI`       | VISO con operación NEXO                                      | Gerencia General / Operaciones / `RESPONSABLE_DE_INSTALACIONES`                         | `ESPECIFICADO` / `NO EVALUADO` | Instalación física y sede operativa permanecen separadas.                                                        | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|    7 | `OPERATIONAL_SITE`            | `DATO_MAESTRO`    |      `SI`       | VISO                                                         | Gerencia General / Operaciones / `RESPONSABLE_DEL_PROCESO`                              | `ESPECIFICADO` / `NO EVALUADO` | Unidad territorial primaria; capacidades se declaran por contrato, no por nombre.                                | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|    8 | `ORGANIZATIONAL_AREA`         | `DATO_MAESTRO`    |      `SI`       | VISO                                                         | Gerencia / Operaciones / `RESPONSABLE_DEL_PROCESO`                                      | `ESPECIFICADO` / `NO EVALUADO` | Área funcional; no equivale a zona física ni estación.                                                           | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|    9 | `PHYSICAL_ZONE`               | `DATO_MAESTRO`    |      `SI`       | NEXO con referencia VISO                                     | Operaciones / Instalaciones / `RESPONSABLE_DE_INSTALACIONES`                            | `ESPECIFICADO` / `NO EVALUADO` | Subdivisión espacial sin autoridad funcional implícita.                                                          | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   10 | `WORKSTATION`                 | `DATO_MAESTRO`    |      `SI`       | NEXO con contratos SHELL/AUTH-DEV cuando aplique             | Operaciones / `RESPONSABLE_DEL_PROCESO`                                                 | `ESPECIFICADO` / `NO EVALUADO` | Punto de ejecución; no equivale a área, dispositivo o actor.                                                     | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   11 | `EXTERNAL_OPERATIONAL_POINT`  | `DATO_MAESTRO`    |      `SI`       | VISO con custodia NEXO                                       | Operaciones / `RESPONSABLE_DEL_PROCESO`                                                 | `ESPECIFICADO` / `NO EVALUADO` | Punto externo temporal o privado con finalidad y vigencia; no se promueve a sede por inferencia.                 | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   12 | `PERSON_IDENTITY`             | `DATO_MAESTRO`    |      `SI`       | VISO para identidad empresarial de persona administrada      | Administración de personas / `RESPONSABLE_DE_PERSONAS`                                  | `ESPECIFICADO` / `NO EVALUADO` | No se duplica por nueva vinculación; la relación con CUSTOMER_PERSON no autoriza fusión automática.              | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   13 | `WORKER_PROFILE`              | `DATO_MAESTRO`    |      `SI`       | VISO                                                         | Administración laboral / `RESPONSABLE_DE_PERSONAS`                                      | `ESPECIFICADO` / `NO EVALUADO` | Proyección laboral del vínculo vigente; no sustituye identidad ni relación histórica.                            | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   14 | `EMPLOYMENT_RELATIONSHIP`     | `DATO_MAESTRO`    |      `SI`       | VISO                                                         | Administración laboral / `RESPONSABLE_DE_PERSONAS`                                      | `ESPECIFICADO` / `NO EVALUADO` | Vínculo versionado con vigencia; acceso técnico permanece separado.                                              | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   15 | `CONTRACTUAL_POSITION`        | `DATO_REFERENCIA` |      `SI`       | VISO                                                         | Administración laboral / `RESPONSABLE_DE_PERSONAS`                                      | `ESPECIFICADO` / `NO EVALUADO` | Denominación contractual/administrativa; no concede permisos.                                                    | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   16 | `BASE_ROLE`                   | `DATO_REFERENCIA` |      `NO`       | SHELL / modelo canónico de autorización                      | Gobierno de autorización / `RESPONSABLE_DEL_PROCESO`                                    | `ESPECIFICADO` / `NO EVALUADO` | Rol base de autorización; no se confunde con cargo ni función operativa.                                         | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   17 | `OPERATIONAL_ROLE`            | `DATO_REFERENCIA` |      `SI`       | VISO con consumo del modelo de autorización                  | Operaciones / propietario del proceso / `RESPONSABLE_DEL_PROCESO`                       | `ESPECIFICADO` / `NO EVALUADO` | Función efectiva; su activación contextual no crea una identidad nueva.                                          | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   18 | `WORK_ASSIGNMENT`             | `DATO_MAESTRO`    |      `SI`       | VISO                                                         | Administración laboral / Gerencia / `RESPONSABLE_DE_PERSONAS`                           | `ESPECIFICADO` / `NO EVALUADO` | Asignación vigente o histórica a sede, área, función o cobertura.                                                | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   19 | `CUSTOMER_PERSON`             | `DATO_MAESTRO`    |      `SI`       | PASS                                                         | Relación con clientes / `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`                             | `ESPECIFICADO` / `NO EVALUADO` | Persona cliente independiente de cuenta autenticada; coincidencia de contacto no prueba identidad.               | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   20 | `CUSTOMER_CONTACT`            | `DATO_MAESTRO`    |      `NO`       | PASS                                                         | Relación con clientes / `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`                             | `ESPECIFICADO` / `NO EVALUADO` | Correo/teléfono con tipo, verificación, fuente y vigencia; no es identidad suficiente.                           | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   21 | `CUSTOMER_RELATIONSHIP`       | `DATO_MAESTRO`    |      `SI`       | PASS                                                         | Relación con clientes / `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`                             | `ESPECIFICADO` / `NO EVALUADO` | Relación por marca/alcance; no equivale a consentimiento.                                                        | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   22 | `CUSTOMER_PROFILE`            | `DATO_MAESTRO`    |      `SI`       | PASS                                                         | Relación con clientes / `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`                             | `ESPECIFICADO` / `NO EVALUADO` | Perfil de autoservicio; no contiene decisiones internas no autoadministrables.                                   | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   23 | `CUSTOMER_PREFERENCE`         | `DATO_MAESTRO`    |      `SI`       | PASS                                                         | Relación con clientes / `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`                             | `ESPECIFICADO` / `NO EVALUADO` | Preferencia no equivale a autorización o consentimiento.                                                         | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   24 | `LOYALTY_ACCOUNT`             | `DATO_MAESTRO`    |      `SI`       | PASS                                                         | Relación con clientes / `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`                             | `ESPECIFICADO` / `NO EVALUADO` | La cuenta de fidelización es distinta del saldo y de los movimientos del ledger.                                 | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   25 | `LOYALTY_PROGRAM_RULE`        | `DATO_REFERENCIA` |      `SI`       | PASS                                                         | Relación con clientes / `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`                             | `ESPECIFICADO` / `NO EVALUADO` | Reglas versionadas de beneficio; movimientos y redenciones son hechos, no referencias.                           | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   26 | `PRODUCTO_MAESTRO`            | `DATO_MAESTRO`    |      `SI`       | NEXO                                                         | Catálogo empresarial / `RESPONSABLE_DE_CATALOGO`                                        | `ESPECIFICADO` / `NO EVALUADO` | Identidad estable del elemento; admite roles múltiples sin duplicación.                                          | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   27 | `VARIANTE`                    | `DATO_MAESTRO`    |      `SI`       | NEXO                                                         | Catálogo empresarial / `RESPONSABLE_DE_CATALOGO`                                        | `ESPECIFICADO` / `NO EVALUADO` | Configuración diferenciada del producto; no equivale a presentación.                                             | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   28 | `PRESENTACION`                | `DATO_MAESTRO`    |      `SI`       | NEXO                                                         | Catálogo empresarial / `RESPONSABLE_DE_CATALOGO`                                        | `ESPECIFICADO` / `NO EVALUADO` | Representa empaque o forma física de compra, recepción, stock, remisión o venta; no es unidad.                   | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   29 | `UNIDAD_DE_MEDIDA`            | `DATO_REFERENCIA` |      `SI`       | NEXO                                                         | Catálogo empresarial / `RESPONSABLE_DE_CATALOGO`                                        | `ESPECIFICADO` / `NO EVALUADO` | Código y dimensión controlados; no se inventan unidades para servicios o empaques.                               | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   30 | `TAXONOMIA_TIPO_MAESTRO`      | `DATO_REFERENCIA` |      `SI`       | NEXO                                                         | Catálogo empresarial / `RESPONSABLE_DE_CATALOGO`                                        | `ESPECIFICADO` / `NO EVALUADO` | Distingue producto, servicio, ingrediente, preparación y empaque.                                                | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   31 | `TAXONOMIA_INVENTARIO`        | `DATO_REFERENCIA` |      `SI`       | NEXO                                                         | Inventario / Bodega / `BODEGA_Y_ABASTECIMIENTO`                                         | `ESPECIFICADO` / `NO EVALUADO` | Clasifica comportamiento de stock, medición, lote y vencimiento; no sustituye identidad.                         | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   32 | `TAXONOMIA_OPERACIONAL`       | `DATO_REFERENCIA` |      `SI`       | NEXO                                                         | Operaciones de catálogo e inventario / `RESPONSABLE_DE_CATALOGO`                        | `ESPECIFICADO` / `NO EVALUADO` | Agrupa búsqueda, almacenamiento, remisión y operación; no controla menú.                                         | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   33 | `LOC`                         | `DATO_MAESTRO`    |      `SI`       | NEXO                                                         | Inventario / Instalaciones según objeto / `BODEGA_Y_ABASTECIMIENTO`                     | `ESPECIFICADO` / `NO EVALUADO` | Ubicación lógica/física de inventario; no equivale a sede, área o instalación completa.                          | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   34 | `ACTIVO_FISICO`               | `DATO_MAESTRO`    |      `SI`       | NEXO                                                         | Activos / Instalaciones / `RESPONSABLE_DE_INSTALACIONES`                                | `ESPECIFICADO` / `NO EVALUADO` | NEXO conserva identidad física, ubicación, condición, custodia, mantenimiento y retiro.                          | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   35 | `CLASE_DE_ACTIVO`             | `DATO_REFERENCIA` |      `SI`       | NEXO                                                         | Activos / `RESPONSABLE_DE_INSTALACIONES`                                                | `ESPECIFICADO` / `NO EVALUADO` | Clasificación controlada; no crea por sí sola identidad ni política de mantenimiento.                            | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   36 | `ESPECIFICACION_PRODUCTO`     | `DATO_MAESTRO`    |      `NO`       | NEXO; FOGO para especificación productiva cuando corresponda | Catálogo / Calidad / `RESPONSABLE_DE_CATALOGO con RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`   | `ESPECIFICADO` / `NO EVALUADO` | Objeto versionado y vigente; no reescribe recepciones o lotes históricos.                                        | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   37 | `PROVEEDOR`                   | `DATO_MAESTRO`    |      `SI`       | ORIGO                                                        | Compras / Gerencia según sensibilidad / `RESPONSABLE_DE_COMPRAS`                        | `ESPECIFICADO` / `NO EVALUADO` | Proveedor y contacto son conceptos distintos; datos sensibles se minimizan.                                      | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   38 | `CONTACTO_PROVEEDOR`          | `DATO_MAESTRO`    |      `NO`       | ORIGO                                                        | Compras / `RESPONSABLE_DE_COMPRAS`                                                      | `ESPECIFICADO` / `NO EVALUADO` | Persona o canal de relación; no sustituye identidad del proveedor.                                               | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   39 | `RELACION_PRODUCTO_PROVEEDOR` | `DATO_MAESTRO`    |      `SI`       | ORIGO                                                        | Compras / `RESPONSABLE_DE_COMPRAS`                                                      | `ESPECIFICADO` / `NO EVALUADO` | Declara capacidad de suministro; no equivale a oferta, contrato o precio vigente.                                | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   40 | `CONDICION_COMERCIAL`         | `DATO_MAESTRO`    |      `SI`       | ORIGO                                                        | Compras / Gerencia según sensibilidad / `RESPONSABLE_DE_COMPRAS`                        | `ESPECIFICADO` / `NO EVALUADO` | Condición versionada con vigencia y contexto; órdenes conservan snapshot de lo aprobado.                         | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   41 | `TAXONOMIA_COMPRA`            | `DATO_REFERENCIA` |      `SI`       | ORIGO                                                        | Compras / `RESPONSABLE_DE_COMPRAS`                                                      | `ESPECIFICADO` / `NO EVALUADO` | Agrupación de abastecimiento; no sustituye taxonomías de inventario, producto o costo.                           | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   42 | `RECETA`                      | `DATO_MAESTRO`    |      `SI`       | FOGO                                                         | Producción / `RESPONSABLE_PRODUCTIVO`                                                   | `ESPECIFICADO` / `NO EVALUADO` | Identidad estable del conocimiento; versiones publicadas y ejecuciones permanecen separadas.                     | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   43 | `FAMILIA_PRODUCTIVA`          | `DATO_REFERENCIA` |      `SI`       | FOGO                                                         | Producción / `RESPONSABLE_PRODUCTIVO`                                                   | `ESPECIFICADO` / `NO EVALUADO` | Taxonomía productiva; no sustituye categoría de producto, compra o menú.                                         | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   44 | `RUTA_PRODUCTIVA`             | `DATO_MAESTRO`    |      `SI`       | FOGO                                                         | Producción / `RESPONSABLE_PRODUCTIVO`                                                   | `ESPECIFICADO` / `NO EVALUADO` | Ruta o proceso productivo reutilizable; ejecución y lote siguen siendo hechos.                                   | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   45 | `RECURSO_PRODUCTIVO`          | `DATO_MAESTRO`    |      `SI`       | FOGO con referencia a activos NEXO cuando corresponda        | Producción / `RESPONSABLE_PRODUCTIVO`                                                   | `ESPECIFICADO` / `NO EVALUADO` | Recurso funcional productivo; el activo físico relacionado mantiene identidad NEXO.                              | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   46 | `COMMERCIAL_CHANNEL`          | `DATO_REFERENCIA` |      `SI`       | PULSO                                                        | Comercial / `RESPONSABLE_COMERCIAL`                                                     | `ESPECIFICADO` / `NO EVALUADO` | Canal comercial; no equivale a sede, marca, pedido ni cuenta externa.                                            | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   47 | `CATEGORIA_COMERCIAL`         | `DATO_REFERENCIA` |      `SI`       | PULSO                                                        | Comercial / `RESPONSABLE_COMERCIAL`                                                     | `ESPECIFICADO` / `NO EVALUADO` | Taxonomía de navegación/oferta; no controla stock ni clasificación operativa.                                    | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   48 | `OFERTA_COMERCIAL`            | `DATO_MAESTRO`    |      `SI`       | PULSO                                                        | Comercial / `RESPONSABLE_COMERCIAL`                                                     | `ESPECIFICADO` / `NO EVALUADO` | Configuración vendible versionada por contexto; precio, disponibilidad y venta permanecen objetos distintos.     | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   49 | `CENTRO_DE_COSTO`             | `DATO_MAESTRO`    |      `SI`       | NUMERA                                                       | Finanzas / `RESPONSABLE_FINANCIERO`                                                     | `ESPECIFICADO` / `NO EVALUADO` | Centro económico; no equivale a sede, área, marca o canal.                                                       | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   50 | `MONEDA`                      | `DATO_REFERENCIA` |      `SI`       | NUMERA                                                       | Finanzas / `RESPONSABLE_FINANCIERO`                                                     | `ESPECIFICADO` / `NO EVALUADO` | Código o unidad monetaria controlada; conversiones y tasas tienen vigencia separada.                             | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   51 | `PERIODO_ECONOMICO`           | `DATO_REFERENCIA` |      `SI`       | NUMERA                                                       | Finanzas / `RESPONSABLE_FINANCIERO`                                                     | `ESPECIFICADO` / `NO EVALUADO` | Periodo económico separado de operación, contabilidad y fiscalidad.                                              | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   52 | `PERIODO_CONTABLE`            | `DATO_REFERENCIA` |      `SI`       | NUMERA o sistema contable autorizado según alcance vigente   | Finanzas / Contabilidad / `RESPONSABLE_FINANCIERO`                                      | `ESPECIFICADO` / `NO EVALUADO` | No se confunde con periodo económico ni operativo.                                                               | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   53 | `PERIODO_FISCAL`              | `DATO_REFERENCIA` |      `SI`       | NUMERA con autoridad externa aplicable                       | Finanzas / Contabilidad / `RESPONSABLE_FINANCIERO`                                      | `ESPECIFICADO` / `NO EVALUADO` | La autoridad oficial externa se conserva cuando aplique.                                                         | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   54 | `CLASIFICACION_ECONOMICA`     | `DATO_REFERENCIA` |      `SI`       | NUMERA                                                       | Finanzas / `RESPONSABLE_FINANCIERO`                                                     | `ESPECIFICADO` / `NO EVALUADO` | Clasificación de gasto, costo, ingreso u otras categorías económicas; no redefine hechos operativos.             | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   55 | `PERFIL_DE_MARCA`             | `DATO_MAESTRO`    |      `SI`       | AURA objetivo                                                | Marca / Comercial / `RESPONSABLE_DE_MARCA`                                              | `BLOQUEADO` / `BLOQUEADO`      | Fuente lógica objetivo; no existe fuente operativa AURA habilitada.                                              | Mostrar fuente objetivo → objeto gobernado y bloqueo; no representar un tramo operativo AURA inexistente.                        |
|   56 | `AUDIENCIA`                   | `DATO_MAESTRO`    |      `SI`       | AURA objetivo                                                | Marca / Comercial / `RESPONSABLE_DE_MARCA`                                              | `BLOQUEADO` / `BLOQUEADO`      | Debe respetar finalidad, consentimiento y exclusiones; activación depende de AURA habilitada.                    | Mostrar fuente objetivo → objeto gobernado y bloqueo; no representar un tramo operativo AURA inexistente.                        |
|   57 | `ACTIVO_DE_MARCA`             | `DATO_MAESTRO`    |      `SI`       | AURA objetivo bajo gobierno documental                       | Marca / `RESPONSABLE_DE_MARCA`                                                          | `BLOQUEADO` / `BLOQUEADO`      | Originales y derivados conservan derechos, uso, vigencia y relación; AURA no operativa impide autoridad vigente. | Mostrar fuente objetivo → objeto gobernado y bloqueo; no representar un tramo operativo AURA inexistente.                        |
|   58 | `ENDPOINT`                    | `DATO_MAESTRO`    |      `SI`       | BLOQUE Z / contrato TI-DOM-002                               | Tecnología / `RESPONSABLE_TECNOLOGICO`                                                  | `ESPECIFICADO` / `NO EVALUADO` | Instalación técnica administrada; distinta de activo físico y dispositivo compartido.                            | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   59 | `SHARED_DEVICE`               | `DATO_MAESTRO`    |      `SI`       | SHELL / contratos AUTH-DEV consumidos por BLOQUE Z           | Gobierno de dispositivo compartido / `RESPONSABLE_TECNOLOGICO`                          | `ESPECIFICADO` / `NO EVALUADO` | Dispositivo lógico empresarial; no equivale a actor, endpoint, activo o estación.                                | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   60 | `NETWORK_RESOURCE`            | `DATO_MAESTRO`    |      `SI`       | BLOQUE Z                                                     | Tecnología / `RESPONSABLE_TECNOLOGICO`                                                  | `ESPECIFICADO` / `NO EVALUADO` | Clase técnica de conectividad; IP, MAC o SSID aislados no crean identidad.                                       | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   61 | `APPLICATION`                 | `DATO_MAESTRO`    |      `SI`       | SHELL                                                        | Gobierno transversal de aplicaciones / `funciones propietarias de SHELL según contrato` | `ESPECIFICADO` / `NO EVALUADO` | Aplicación no equivale a repositorio, URL, ambiente, despliegue o servicio.                                      | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |
|   62 | `TECH_SERVICE`                | `DATO_REFERENCIA` |      `SI`       | BLOQUE Z / TI-DOM-001                                        | Tecnología / `RESPONSABLE_TECNOLOGICO`                                                  | `ESPECIFICADO` / `NO EVALUADO` | Familia estable de servicio; conserva las once identidades TI-SERVICE-001 a 011.                                 | Mostrar fuente lógica → objeto/vigencia → derivados o consumidores autorizados; ampliar solo con evidencia de linaje disponible. |


**Reconciliación de objetos:** 62 esperados; 62 materializados; 0 faltantes; 0 duplicados; 43 `DATO_MAESTRO`; 19 `DATO_REFERENCIA`; 58 con rol de dimensión compartida; 59 `NO EVALUADO`; 3 `BLOQUEADO`.

Los tres bloqueados son exactamente `PERFIL_DE_MARCA`, `AUDIENCIA` y `ACTIVO_DE_MARCA`. El catálogo puede mostrar su existencia y gobierno solo al actor autorizado; no simula fuente operativa, población, calidad certificada ni linaje de ejecución.

---

#### 17. Matriz materializada de las 14 métricas de asistencia

Las 14 entradas conservan versión semántica `1`. El propietario empresarial de la definición es `RESPONSABLE_DE_PERSONAS`; el stewardship corresponde a `RESPONSABLE_DE_PERSONAS`, con participación de `RESPONSABLE_DE_PROGRAMACION_LABORAL` cuando la definición depende del turno programado. La fuente lógica de programación permanece VISO y la de hechos de asistencia permanece ANIMA.

| `metric_key`        | Nombre empresarial                                 | Tipo             | Definición canónica v1                                                                                                               | Unidad                                       | Fuente lógica | Entradas de linaje                                                    | DQ            | Decisión de catálogo                                                                                                           |
| ------------------- | -------------------------------------------------- | ---------------- | ------------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------- | ------------- | --------------------------------------------------------------------- | ------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| `scheduledShifts`   | Turnos programados computables                     | conteo           | contar turnos programados del contexto que no sean descanso                                                                          | turnos                                       | VISO          | `scheduled_shifts`                                                    | `NO EVALUADO` | Mostrar definición v1, dueño, fuente, DQ y linaje; puede presentarse como provisional con estado visible, no como certificado. |
| `attendedShifts`    | Turnos con asistencia registrada                   | conteo           | contar turnos programados computables con check-in asociado                                                                          | turnos                                       | VISO + ANIMA  | `scheduled_shifts + attendance_sessions`                              | `NO EVALUADO` | Mostrar definición v1, dueño, fuente, DQ y linaje; puede presentarse como provisional con estado visible, no como certificado. |
| `restDayCount`      | Turnos clasificados como descanso                  | conteo           | contar turnos cuya clasificación vigente corresponda a descanso                                                                      | turnos                                       | VISO          | `scheduled_shifts`                                                    | `NO EVALUADO` | Mostrar definición v1, dueño, fuente, DQ y linaje; puede presentarse como provisional con estado visible, no como certificado. |
| `lateCount`         | Turnos con llegada tardía                          | conteo           | contar turnos computables con check-in posterior al inicio programado más la gracia de tardanza aplicable                            | turnos                                       | VISO + ANIMA  | `scheduled_shifts + attendance_sessions`                              | `NO EVALUADO` | Mostrar definición v1, dueño, fuente, DQ y linaje; puede presentarse como provisional con estado visible, no como certificado. |
| `noShowCount`       | Turnos finalizados sin asistencia                  | conteo           | contar turnos computables cuyo fin programado ya ocurrió al corte y que no tienen sesión de asistencia asociada                      | turnos                                       | VISO + ANIMA  | `scheduled_shifts + attendance_sessions`                              | `NO EVALUADO` | Mostrar definición v1, dueño, fuente, DQ y linaje; puede presentarse como provisional con estado visible, no como certificado. |
| `openCount`         | Turnos con sesión de asistencia abierta            | conteo           | contar turnos computables con sesión de asistencia aún abierta al corte                                                              | turnos                                       | VISO + ANIMA  | `scheduled_shifts + attendance_sessions`                              | `NO EVALUADO` | Mostrar definición v1, dueño, fuente, DQ y linaje; puede presentarse como provisional con estado visible, no como certificado. |
| `missingCloseCount` | Turnos vencidos sin cierre                         | conteo           | contar turnos computables cuyo fin programado ya ocurrió al corte y cuya sesión de asistencia continúa abierta                       | turnos                                       | VISO + ANIMA  | `scheduled_shifts + attendance_sessions`                              | `BLOQUEADO`   | Mostrar definición v1 y bloqueo de certificación; no presentar como KPI oficial ni ocultar la divergencia conocida.            |
| `autoCloseCount`    | Turnos cerrados automáticamente                    | conteo           | contar turnos computables cuya sesión asociada fue cerrada mediante el mecanismo de autocierre                                       | turnos                                       | ANIMA         | `attendance_sessions`                                                 | `NO EVALUADO` | Mostrar definición v1, dueño, fuente, DQ y linaje; puede presentarse como provisional con estado visible, no como certificado. |
| `departureCount`    | Turnos con salida de sede detectada durante sesión | conteo           | contar turnos computables con evento de salida de sede correlacionado a la sesión                                                    | turnos                                       | VISO + ANIMA  | `scheduled_shifts + attendance_sessions + attendance_geofence_events` | `NO EVALUADO` | Mostrar definición v1, dueño, fuente, DQ y linaje; puede presentarse como provisional con estado visible, no como certificado. |
| `scheduledMinutes`  | Minutos netos programados                          | suma             | sumar los minutos netos programados de los turnos computables, descontando descanso programado conforme al turno                     | minutos                                      | VISO          | `scheduled_shifts`                                                    | `NO EVALUADO` | Mostrar definición v1, dueño, fuente, DQ y linaje; puede presentarse como provisional con estado visible, no como certificado. |
| `netMinutes`        | Minutos netos registrados                          | suma             | sumar minutos de sesión registrados menos minutos de descanso superpuestos válidos, limitados a valores no negativos                 | minutos                                      | ANIMA         | `attendance_sessions + attendance_breaks`                             | `NO EVALUADO` | Mostrar definición v1, dueño, fuente, DQ y linaje; puede presentarse como provisional con estado visible, no como certificado. |
| `incidentCount`     | Turnos con señal de incidencia de asistencia       | conteo compuesto | contar una vez cada turno computable que presente al menos tardanza, ausencia, sesión abierta, autocierre o salida de sede detectada | turnos                                       | VISO + ANIMA  | `scheduled_shifts + attendance_sessions + attendance_geofence_events` | `NO EVALUADO` | Mostrar definición v1, dueño, fuente, DQ y linaje; puede presentarse como provisional con estado visible, no como certificado. |
| `attendanceRate`    | Tasa de asistencia                                 | tasa             | attendedShifts / scheduledShifts cuando existe denominador positivo; sin denominador no se emite valor numérico                      | proporción; presentación porcentual derivada | VISO + ANIMA  | `attendedShifts + scheduledShifts`                                    | `BLOQUEADO`   | Mostrar definición v1 y bloqueo de certificación; no presentar como KPI oficial ni ocultar la divergencia conocida.            |
| `punctualityRate`   | Tasa de puntualidad entre turnos asistidos         | tasa             | (attendedShifts - lateCount) / attendedShifts cuando existe denominador positivo; sin denominador no se emite valor numérico         | proporción; presentación porcentual derivada | VISO + ANIMA  | `attendedShifts + lateCount`                                          | `BLOQUEADO`   | Mostrar definición v1 y bloqueo de certificación; no presentar como KPI oficial ni ocultar la divergencia conocida.            |


**Reconciliación de métricas:** 14 esperadas; 14 materializadas; 14 claves únicas; 0 faltantes; 0 duplicadas; 9 conteos; 2 sumas; 2 tasas; 1 conteo compuesto; 11 `NO EVALUADO`; 3 `BLOQUEADO`.

Las tres métricas bloqueadas son exactamente:

- `missingCloseCount`: la definición v1 exige turno vencido al corte con sesión aún abierta; su certificación permanece bloqueada mientras la implementación observada no se alinee con esa semántica;
- `attendanceRate`: no se emite tasa numérica cuando `scheduledShifts = 0`;
- `punctualityRate`: no se emite tasa numérica cuando `attendedShifts = 0`.

El catálogo no corrige esas divergencias ni modifica fórmulas; las presenta de forma explícita y dirige el análisis de calidad al propietario documental correspondiente.

---

#### 18. Relación entre métricas y datos maestros

El catálogo permite navegar relaciones semánticas sin crear joins de autoridad:

- una métrica puede declarar las dimensiones maestras permitidas por su versión;
- una dimensión apunta al objeto maestro o referencia vigente, no a una copia editable;
- una relación visible no concede acceso a los miembros de la dimensión;
- una métrica no puede añadir una dimensión no aprobada en su versión;
- `BASE_ROLE`, `CUSTOMER_CONTACT`, `ESPECIFICACION_PRODUCTO` y `CONTACTO_PROVEEDOR` conservan `Dimensión compartida = NO` en el inventario actual;
- producto, variante, presentación y unidad permanecen identidades distintas aunque aparezcan en una misma cadena de análisis;
- persona, trabajador, cliente y contactos permanecen separados; el catálogo no propone fusiones por coincidencia textual;
- fuente, dueño y calidad se resuelven por el objeto o métrica concreto y no se heredan ciegamente desde una familia analítica.

---

#### 19. Navegación y acciones

Desde una fila o ficha, la experiencia puede ofrecer únicamente destinos que correspondan al actor y al estado actual, por ejemplo:

- ver definición completa;
- ver gobierno y responsabilidades;
- ver calidad y limitaciones;
- explorar linaje autorizado;
- consultar historia/versiones;
- abrir el análisis o tablero propietario cuando exista;
- abrir el centro de calidad para una incidencia autorizada;
- abrir la fuente propietaria o el flujo de gobierno cuando una capacidad separada lo permita.

La acción de “editar” no aparece como capacidad universal del catálogo. Definir, certificar, publicar, fijar metas, anotar, exportar y administrar permanecen operaciones segregadas y reautorizadas.

---

#### 20. Estados incompletos, bloqueos y ausencia de evidencia

La interfaz deberá distinguir:

```text
METADATO NO AUTORIZADO
≠ METADATO AUSENTE
≠ DATO NO EVALUADO
≠ DATO DEGRADADO
≠ DATO BLOQUEADO
≠ FUENTE NO RESOLUBLE
≠ LINAJE TÉCNICO AÚN NO MATERIALIZADO
```

Reglas:

- un valor ausente no se reemplaza por “no aplica” sin contrato que lo determine;
- una fuente no resoluble no se adivina desde tabla, aplicación consumidora o nombre parecido;
- un nodo de linaje no observado se identifica como evidencia no materializada y no como un salto invisible;
- un bloqueo muestra la causa segura y el propietario de resolución cuando esa información sea autorizada;
- una dependencia técnica fallida no degrada por inferencia el estado DQ empresarial;
- un estado DQ no se recalcula en el frontend.

---

#### 21. Accesibilidad y densidad

- el listado debe poder operarse con teclado y foco visible cuando corresponda;
- estado DQ, clase y bloqueo no dependen exclusivamente de color;
- columnas extensas se condensan en la lista y se expanden en la ficha, sin ocultar semántica necesaria;
- la fórmula de una métrica mantiene una representación textual comprensible además de cualquier notación compacta;
- el linaje tiene representación textual equivalente a un eventual grafo;
- el orden semántico conserva nombre, estado, dueño, fuente y acción principal;
- en superficies estrechas se priorizan identidad, tipo, calidad, fuente y dueño; el resto pasa a divulgación progresiva;
- los términos empresariales preceden a identificadores técnicos, aunque el identificador canónico permanezca disponible para trazabilidad.

---

#### 22. Handoffs con propietario documental exacto

| Decisión o materialización fuera del alcance                           | Propietario documental | Condición de salida                                                          |
| ---------------------------------------------------------------------- | ---------------------- | ---------------------------------------------------------------------------- |
| tableros por dominio, filtros, comparación y drill-down analítico      | `DATA-UX-003`          | antes de materializar la experiencia de análisis profundo por dominio        |
| centro de calidad, frescura, conciliaciones y certificación            | `DATA-UX-004`          | antes de materializar workflows de evaluación o resolución DQ                |
| investigación de variaciones, anomalías y causas                       | `DATA-UX-005`          | antes de convertir una señal del catálogo en investigación analítica         |
| objetivos, metas, drivers, guardrails y acciones de mejora             | `DATA-UX-006`          | antes de convertir métricas en un flujo de objetivo o intervención           |
| reportes, exportaciones, suscripciones y snapshots versionados         | `DATA-UX-007`          | antes de materializar salidas o distribución desde el catálogo               |
| validación de comprensión, tiempos y decisiones con usuarios reales    | `DATA-UX-008`          | antes de declarar readiness de esta experiencia                              |
| contratos físicos de eventos y lectura                                 | `DATA-INT-001`         | antes de materializar linaje físico basado en eventos o fuentes compartidas  |
| capa semántica, consultas, modelos, caché, snapshots y rendimiento     | `DATA-INT-002`         | antes de materializar consultas, grafo técnico o almacenamiento del catálogo |
| crosswalks, claves externas, identidad y reconciliación                | `DATA-INT-003`         | antes de navegar identidades externas o equivalencias físicas                |
| BI, hojas, modelos externos e IA                                       | `DATA-INT-004`         | antes de exponer el catálogo a herramientas analíticas externas              |
| claves, códigos, jerarquías, vigencia, fusión y separación de maestros | `DATA-DOM-003`         | cuando la ficha necesite esos metadatos; se consumen sin redefinirlos        |
| calidad, frescura, cobertura y certificación                           | `DATA-DOM-007`         | siempre que se proyecte un estado DQ; el catálogo no recalcula la decisión   |
| linaje, ingestión, transformación y reconciliación                     | `DATA-DOM-006`         | siempre que se proyecte procedencia; solo se muestran pasos documentados     |
| historia, correcciones y restatements                                  | `DATA-DOM-017`         | siempre que se consulte una versión o corte histórico                        |

No queda una decisión material de `DATA-UX-002` diferida sin propietario documental y condición de salida.

---

#### 23. Cobertura de requisitos de prueba vigente

La conducta materializada por esta tarea ya está protegida por requisitos canónicos vigentes:

- `TREQ-DATA-001` exige identificador estable, propietario funcional, steward, fuente de verdad, claves, jerarquías, estados, vigencia, ciclo de vida e historia para maestros y referencias, y asigna responsabilidad a `DATA-UX-002`;
- `TREQ-DATA-002` exige registro canónico versionado de métricas con nombre, propósito, propietario, fórmula, numerador, denominador, grano, dimensiones, filtros, unidad, tiempo, fuente, calidad, certificación, drill-down y comparación, y asigna responsabilidad a `DATA-UX-001` a `DATA-UX-003`;
- `TREQ-DATA-003` protege contratos de origen, transformaciones, reconciliación y linaje y prohíbe certificación oficial sin calidad suficiente;
- `TREQ-DATA-004` protege versión, corte, frescura, cobertura, calidad, divulgación progresiva y drill-down autorizado en las superficies analíticas;
- los requisitos UX vigentes sobre fuente de verdad, estado, versión, población, contexto, densidad y no exposición indirecta continúan aplicando al catálogo.

`DATA-UX-002` especializa esas reglas como experiencia de descubrimiento y gobierno y no introduce un comportamiento verificable independiente que carezca de cobertura.

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** los requisitos canónicos vigentes ya cubren de forma directa la identidad y gobierno de maestros, el registro versionado de métricas, la fuente de verdad, el estado de calidad, el linaje, la divulgación progresiva y la protección de metadatos. La tarea materializa su experiencia de catálogo sin crear una regla de negocio, cálculo, autorización, transición, integración o comportamiento ejecutable adicional.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 24. Criterios de aceptación

1. existe una sola experiencia conceptual de catálogo con colecciones separadas para métricas y datos maestros/referencia;
2. el catálogo no se convierte en fuente de verdad, maestro universal, capa semántica física o editor genérico;
3. definición, gobierno, fuente, calidad, linaje e historia aparecen como zonas distintas;
4. propietario, steward, custodio, certificador y consumidor permanecen funciones separadas;
5. la fuente principal presentada es la fuente de verdad lógica y no una tabla elegida por conveniencia técnica;
6. la implementación técnica solo aparece cuando esté documentada y autorizada;
7. estado documental y estado DQ permanecen separados;
8. se conservan exactamente los cinco estados DQ vigentes sin crear equivalencias nuevas;
9. `NO EVALUADO` no se presenta como error ni certificación;
10. `BLOQUEADO` no se reemplaza por dato aproximado o estimado;
11. el linaje conserva fuente/evidencia, transformaciones/versiones conocidas, identidad gobernada y derivados autorizados;
12. un nodo de linaje no concede acceso automático a su contenido;
13. búsquedas, filtros, autocomplete y conteos se calculan únicamente sobre metadatos autorizados;
14. una opción de filtro no revela recursos no autorizados;
15. acceso a métrica no concede filas fuente;
16. acceso a maestro no concede hechos que lo referencian;
17. definición no concede certificación, publicación, meta, anotación, exportación o administración;
18. las 55 familias analíticas no generan métricas nominales sin definición concreta;
19. se materializan exactamente 62 objetos de catálogo;
20. la reconciliación de objetos conserva 43 maestros y 19 referencias;
21. se conservan exactamente 58 objetos con rol de dimensión compartida;
22. `BASE_ROLE`, `CUSTOMER_CONTACT`, `ESPECIFICACION_PRODUCTO` y `CONTACTO_PROVEEDOR` conservan dimensión compartida `NO`;
23. cada uno de los 62 objetos tiene fuente lógica, dueño/steward, estado documental, DQ, definición/frontera y decisión de linaje explícitos;
24. los 59 objetos no AURA conservan DQ `NO EVALUADO` hasta evidencia suficiente;
25. `PERFIL_DE_MARCA`, `AUDIENCIA` y `ACTIVO_DE_MARCA` permanecen `BLOQUEADO`;
26. ningún objeto AURA recibe fuente operativa o cadena de linaje de ejecución inventada;
27. `TECH_SERVICE` conserva la referencia a sus once identidades tecnológicas aprobadas sin crear aliases nuevos;
28. se materializan exactamente 14 métricas de asistencia;
29. las 14 métricas conservan versión semántica `1`;
30. el registro conserva 9 conteos, 2 sumas, 2 tasas y 1 conteo compuesto;
31. cada métrica muestra definición canónica, unidad, dueño, fuente, entradas de linaje y estado DQ;
32. `scheduledShifts`, `restDayCount` y `scheduledMinutes` preservan programación VISO como fuente lógica principal;
33. `autoCloseCount` y `netMinutes` preservan hechos de asistencia ANIMA como fuente lógica principal;
34. las métricas que combinan programación y asistencia preservan ambas fuentes sin convertir la proyección analítica en autoridad;
35. `attendanceRate` y `punctualityRate` conservan numerador y denominador y no representan ausencia de denominador como cero;
36. `openCount` y `missingCloseCount` permanecen semánticamente separados;
37. `missingCloseCount`, `attendanceRate` y `punctualityRate` permanecen `BLOQUEADO` para certificación;
38. las otras 11 métricas permanecen `NO EVALUADO` y no se presentan como certificadas;
39. una dimensión consume el objeto gobernado vigente y no crea otra identidad editable;
40. persona, trabajador, cliente, proveedor y contactos no se fusionan por coincidencia textual;
41. el catálogo distingue vigencia actual de vigencia en el corte histórico;
42. correcciones y restatements no reescriben silenciosamente versiones previas;
43. un elemento retirado solo conserva consulta histórica bajo autorización y finalidad compatibles;
44. la ficha no expone campos sensibles, secretos o topología técnica por ser “solo metadata”;
45. un actor no autorizado no recibe diferencias de error que revelen existencia de recursos sensibles;
46. calidad profunda navega a `DATA-UX-004` sin recalcular DQ localmente;
47. análisis profundo navega a `DATA-UX-003` sin convertir el catálogo en dashboard;
48. linaje físico y capa semántica se mantienen en `DATA-INT-001` a `DATA-INT-003` según su responsabilidad exacta;
49. validación con usuarios queda asignada a `DATA-UX-008`;
50. no queda un pendiente narrativo sin propietario documental exacto;
51. no se crean rutas, componentes, tablas, vistas, modelos, permisos, roles, grants o excepciones;
52. no se modifica código, DDL, DML, RLS, RPC, datos, migraciones, backfills, despliegues o Supabase;
53. no se crea ni modifica ningún requisito de prueba;
54. `DATA-UX-003` permanece únicamente reservada.

---

#### 25. Balance de cierre

| Control                                                |         Resultado |
| ------------------------------------------------------ | ----------------: |
| Objetos maestros/referencia esperados / materializados |       **62 / 62** |
| Datos maestros / referencias                           |       **43 / 19** |
| Dimensiones compartidas SI / NO                        |        **58 / 4** |
| Objetos DQ `NO EVALUADO` / `BLOQUEADO`                 |        **59 / 3** |
| Objetos AURA bloqueados                                |         **3 / 3** |
| Métricas esperadas / materializadas                    |       **14 / 14** |
| Versiones semánticas de métricas preservadas en v1     |       **14 / 14** |
| Métricas `NO EVALUADO` / `BLOQUEADO`                   |        **11 / 3** |
| Conteos / sumas / tasas / compuesto                    | **9 / 2 / 2 / 1** |
| Métricas nuevas inventadas para familias analíticas    |             **0** |
| Permisos, roles o grants creados                       |             **0** |
| Cambios físicos                                        |             **0** |
| Requisitos TREQ nuevos o modificados                   |             **0** |

---

#### 26. Continuidad

ÚLTIMA TAREA APROBADA
`DATA-UX-001 — Diseñar inicio ejecutivo simple y accionable por rol`

TAREA ACTUAL APROBADA
`DATA-UX-002 — Diseñar catálogo de métricas y datos maestros con definición, dueño, fuente, calidad y linaje`

SIGUIENTE TAREA RESERVADA
`DATA-UX-003 — Diseñar tableros por dominio con filtros, comparación, drill-down y trazabilidad`


### ✅ DATA-UX-003 — Diseñar tableros por dominio con filtros, comparación, drill-down y trazabilidad

**Estado:** APROBADA
**Tarea anterior:** `DATA-UX-002 — Diseñar catálogo de métricas y datos maestros con definición, dueño, fuente, calidad y linaje` — APROBADA
**Tarea siguiente:** `DATA-UX-004 — Diseñar centro de calidad, frescura, conciliaciones y certificación` — RESERVADA
**Tipo de tarea:** documental; diseño normativo y materializado de tableros analíticos por dominio, con filtros gobernados, comparación compatible, drill-down autorizado y trazabilidad reproducible
**Bloque:** AB — Analítica, indicadores y datos maestros
**Fase:** exclusivamente documental
**Implementación técnica:** no autorizada
**Código, rutas físicas, componentes, DDL, DML, migraciones, RLS, RPC, grants, cambios de permisos, datos, backfills, despliegues o cambios en Supabase:** no autorizados
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Diseñar la experiencia analítica de profundidad de Vento OS para que un actor autorizado pueda pasar desde una señal o resultado resumido hasta un tablero de dominio que permita comprender tendencia, composición, comparación y trazabilidad sin redefinir métricas, fabricar poblaciones, ampliar autorización ni convertir el tablero en fuente de verdad.

La tarea deberá permitir responder, para cada resultado visible:

1. ¿qué métrica concreta estoy observando y qué versión la define?;
2. ¿sobre qué población, territorio, periodo y corte fue calculada?;
3. ¿qué filtros reducen el conjunto autorizado?;
4. ¿contra qué referencia es legítimo compararla?;
5. ¿qué dimensiones explican su composición sin alterar su significado?;
6. ¿hasta qué nivel de detalle puedo profundizar?;
7. ¿qué fuente, calidad, frescura, cobertura y linaje sostienen el resultado?;
8. ¿qué versión histórica, snapshot o restatement estoy consultando?;
9. ¿qué limitación impide una comparación o un detalle más profundo?;
10. ¿cuál es el siguiente destino documental o analítico cuando el tablero detecta un problema de calidad, una anomalía, un objetivo o una salida distribuible?

Principio rector:

```text
TABLERO DE DOMINIO
=
CONTEXTO EFECTIVO
+ MÉTRICAS CONCRETAS Y VERSIONADAS
+ CONJUNTO AUTORIZADO
+ FILTROS COMO REDUCCIÓN
+ COMPARACIÓN COMPATIBLE
+ DESGLOSE AUTORIZADO
+ DRILL-DOWN REAUTORIZADO
+ CALIDAD Y COBERTURA VISIBLES
+ TRAZABILIDAD REPRODUCIBLE

NO

FAMILIA ANALÍTICA = MÉTRICA
FILTRO = AUTORIZACIÓN
DELTA = CAUSALIDAD
AGREGADO = DERECHO AL DETALLE
TABLERO = FUENTE DE VERDAD
PUBLICADO = EXPORTABLE
BLOQUEADO = CERO
NO EVALUADO = CERTIFICADO
```

---

#### 2. Resultado sustantivo

La tarea materializa cinco artefactos lógicos coordinados:

1. `DATA-DOMAIN-DASHBOARD-UX-CONTRACT-001`: contrato de composición, contexto, densidad, navegación, estados y límites de cada tablero analítico de dominio.
2. `DATA-DASHBOARD-FILTER-COMPARISON-CONTRACT-001`: reglas de filtros, compatibilidad de comparaciones, referencias, cohortes y desgloses sin ampliar población ni reinterpretar métricas.
3. `DATA-DASHBOARD-DRILLDOWN-TRACEABILITY-CONTRACT-001`: escalera de drill-down reautorizado, trazabilidad, procedencia, versión, corte y reproducción del resultado.
4. `DATA-DASHBOARD-ANALYTIC-COVERAGE-MATRIX-001`: decisión explícita para las 55 familias analíticas heredadas de `DATA-DOM-009` a `DATA-DOM-013`.
5. `DATA-ATTENDANCE-DASHBOARD-MATRIX-001`: decisión explícita para las 14 métricas de asistencia v1 ya incorporadas al registro canónico de métricas.

Balance materializado:

| Control                                          |                  Resultado |
| ------------------------------------------------ | -------------------------: |
| Tableros de familias de dominio                  |                  **5 / 5** |
| Superficie especializada de asistencia           |                  **1 / 1** |
| Familias analíticas reconciliadas                |                **55 / 55** |
| Distribución D009–D013                           | **11 + 12 + 10 + 12 + 10** |
| Métricas de asistencia reconciliadas             |                **14 / 14** |
| Métricas `NO EVALUADO` / `BLOQUEADO` preservadas |                 **11 / 3** |
| Familias de artefacto D008 reconciliadas         |                  **6 / 6** |
| Niveles conceptuales máximos de drill-down       |                      **5** |
| Fórmulas o `metric_key` creados                  |                      **0** |
| Permisos, roles o grants creados                 |                      **0** |
| Cambios físicos                                  |                      **0** |
| Requisitos de prueba creados o modificados       |                      **0** |

Los cinco tableros de familias corresponden exclusivamente a los ámbitos ya materializados en `DATA-DOM-009` a `DATA-DOM-013`: comercial; inventario, abastecimiento, proveedores y logística; producción; servicio y clientes; y económico-financiero. La asistencia se presenta como una superficie especializada porque es el único conjunto actual con 14 métricas concretas versionadas ya incorporadas al registro inicial; no crea un sexto dominio analítico nuevo.

---

#### 3. Entradas canónicas consumidas

`DATA-UX-003` consume sin redefinir:

- `DATA-UX-001`, que reserva a esta tarea tendencias, comparaciones, filtros avanzados y análisis profundo desde el inicio ejecutivo;
- `DATA-UX-002`, que entrega la experiencia de catálogo, definición, dueño, fuente, calidad, linaje e historia para métricas y datos maestros;
- `DATA-DOM-004`, para identidad, versión, propósito, fórmula, numerador, denominador, unidad, dimensiones y registro canónico de métricas;
- `DATA-DOM-005`, para grano, tiempo del hecho, periodo, corte, calendario, zona horaria, snapshots y comparabilidad histórica;
- `DATA-DOM-006`, para origen, ingestión, transformación, backfill, reconciliación y linaje;
- `DATA-DOM-007`, para calidad, frescura, cobertura, certificación y los estados `NO EVALUADO`, `EN OBSERVACIÓN`, `CERTIFICADO`, `DEGRADADO` y `BLOQUEADO`;
- `DATA-DOM-008`, para tablero, reporte, exportación, suscripción, alerta y snapshot oficial como artefactos distintos;
- `DATA-DOM-009` a `DATA-DOM-013`, para las 55 familias analíticas y sus fronteras de evidencia y certificación;
- `DATA-DOM-014`, para separar señal, diagnóstico, hipótesis, confianza y recomendación;
- `DATA-DOM-015`, para baseline, objetivo, meta, drivers y guardrails;
- `DATA-DOM-016`, para intervención, experimento, medición, aprendizaje y decisión;
- `DATA-DOM-017`, para versionado, correcciones, restatements, resultado conocido entonces y resultado reconstruido ahora;
- `DATA-AUTH-001`, para construir el conjunto autorizado antes de filtros, agregación, comparación o cálculo;
- `DATA-AUTH-002`, para protección de campos, poblaciones pequeñas, inferencia, comparación, exportación y cada nivel de drill-down;
- `DATA-AUTH-003`, para separar `DEFINE`, `CERTIFY`, `PUBLISH`, `SET_TARGET`, `ANNOTATE`, `EXPORT` y `ADMINISTER`;
- `DATA-AUTH-004`, para trazabilidad de consulta, descarga, suscripción, alerta, modelo y recomendación;
- `UX-BASE-001` a `UX-BASE-015`, para carril analítico, contexto, relevancia, lenguaje humano, divulgación progresiva, densidad y recuperación;
- `NFR-REQ-005` a `NFR-REQ-007`, para privacidad, trazabilidad, retención, accesibilidad y ergonomía;
- los requisitos canónicos vigentes que protegen identidad/versionado de métricas, artefactos analíticos, fuente de verdad, autorización, densidad, contexto y drill-down.

La tarea no define consultas físicas, modelos, índices, cachés, vistas, componentes, endpoints ni rutas. Esa materialización pertenece a `DATA-INT-002` y a los paquetes posteriores que implementen la experiencia aprobada.

---

#### 4. Fronteras conceptuales obligatorias

```text
TABLERO ≠ HOME EJECUTIVA ≠ REPORTE ≠ SNAPSHOT ≠ EXPORTACIÓN
```

```text
FAMILIA ANALÍTICA ≠ MÉTRICA ≠ KPI ≠ DIMENSIÓN
```

```text
FILTRO ≠ ALCANCE ≠ TERRITORIO ≠ FINALIDAD
```

```text
SEDE SELECCIONADA ≠ TERRITORIO AUTORIZADO
```

```text
DESGLOSE ≠ DRILL-DOWN ≠ EXPORTACIÓN
```

```text
COMPARACIÓN ≠ CAUSALIDAD
```

```text
TENDENCIA ≠ PRONÓSTICO
```

```text
CORRELACIÓN ≠ CAUSA
```

```text
MÉTRICA VISIBLE ≠ FILAS FUENTE VISIBLES
```

```text
DETALLE AUTORIZADO EN UN NIVEL ≠ AUTORIZACIÓN DEL NIVEL SIGUIENTE
```

```text
FUENTE LÓGICA ≠ IMPLEMENTACIÓN TÉCNICA ≠ TABLERO
```

```text
CALIDAD ≠ AUTORIZACIÓN ≠ PUBLICACIÓN
```

```text
VERSIÓN ACTUAL ≠ VERSIÓN HISTÓRICA ≠ RESTATEMENT
```

```text
SIN DATO ≠ CERO ≠ BLOQUEADO ≠ SUPRIMIDO
```

---

#### 5. Contrato `DATA-DOMAIN-DASHBOARD-UX-CONTRACT-001`

Todo tablero deberá poder resolver conceptualmente:

```text
actor efectivo
+ capacidad de consulta aplicable
+ finalidad
+ dominio y recurso
+ población autorizada
+ territorio real
+ periodo y corte
+ zona horaria y calendario aplicables
+ metric_key y versión
+ dimensiones permitidas por esa versión
+ filtros activos
+ referencia de comparación
+ unidad o moneda
+ estado DQ, frescura y cobertura
+ versión de publicación, snapshot o restatement cuando aplique
+ linaje hacia fuentes y transformaciones
→ resultado analítico interpretable y reproducible
```

Reglas:

1. el tablero consume únicamente métricas concretas registradas; una familia no aparece como cifra por carecer de fórmula propia;
2. el conjunto autorizado se resuelve antes de aplicar cualquier filtro de usuario;
3. todo filtro adicional solo puede reducir ese conjunto;
4. las dimensiones ofrecidas deben estar permitidas por la versión de la métrica y ser divulgables para el actor;
5. una comparación se construye únicamente después de validar compatibilidad semántica, temporal, poblacional, dimensional, de unidad y de versión;
6. un drill-down vuelve a resolver autorización y protección en cada nivel;
7. el tablero conserva el estado de calidad heredado y no puede elevarlo por diseño visual;
8. la ausencia de dato no se representa como cero salvo que la definición de la métrica determine legítimamente un cero;
9. una dependencia bloqueada no produce una cifra oficial substituta;
10. la UI puede resumir metadatos, pero debe ofrecer navegación gobernada al catálogo de `DATA-UX-002` para definición y linaje;
11. el tablero no corrige fuentes, no redefine fórmulas, no certifica, no fija metas y no ejecuta recomendaciones;
12. una navegación hacia investigación, calidad, objetivo o salida conserva referencias de métrica, versión, periodo, corte y contexto sin transferir autoridad implícita.

---

#### 6. Arquitectura de información de un tablero profundo

La superficie profunda se organiza en seis zonas lógicas. Son zonas funcionales, no nombres de componentes físicos:

1. **Contexto efectivo y corte** — actor, alcance, territorio, periodo, corte, zona horaria, filtros materiales y condición de vista parcial.
2. **Resultados y estado** — métricas concretas seleccionadas, valor protegido, unidad, DQ, frescura y cobertura.
3. **Tendencia y comparación** — series o referencias compatibles con identificación explícita del comparador.
4. **Composición y desglose** — distribución por dimensiones autorizadas y permitidas por la versión de la métrica.
5. **Limitaciones y calidad** — bloqueos, cobertura parcial, cambios semánticos, datos faltantes, supresión o incompatibilidad que condicionen la lectura.
6. **Drill-down y trazabilidad** — nivel disponible, fuente, definición, versión, linaje y navegación al siguiente detalle autorizado.

Esta arquitectura profundiza la home de `DATA-UX-001`; no la duplica. La home conserva simplicidad y máximo un nivel de tendencia compacta, mientras esta tarea admite análisis comparativo y dimensional explícito.

Reglas de densidad:

- la densidad se justifica por trabajo analítico y no por disponibilidad de columnas;
- el contexto y el estado DQ permanecen visibles aunque el usuario despliegue más detalle;
- las tablas o visualizaciones extensas utilizan divulgación progresiva y no compiten con la interpretación principal;
- un tablero puede mostrar múltiples métricas solo cuando comparten un contexto suficientemente compatible o cuando cada panel declara claramente su propio contexto;
- no se obliga a alinear escalas incompatibles en un mismo eje;
- una visualización no oculta valores, denominadores o limitaciones necesarias para interpretar el resultado;
- el gráfico no es la única representación de un estado crítico: existe texto equivalente y semánticamente interpretable.

---

#### 7. Contrato de filtros

Los filtros son transformaciones de selección sobre el conjunto ya autorizado. No son una segunda capa de seguridad ni una forma de cambiar el territorio real del recurso.

Orden obligatorio:

```text
AUTORIZAR POBLACIÓN
→ RESOLVER MÉTRICA Y VERSIÓN
→ RESOLVER DIMENSIONES ELEGIBLES
→ CONSTRUIR OPCIONES DE FILTRO AUTORIZADAS
→ APLICAR FILTROS DEL USUARIO
→ RECALCULAR RESULTADO
→ REEVALUAR COMPARACIÓN Y DIVULGACIÓN
```

Reglas:

1. una opción de filtro no podrá enumerar una sede, persona, cliente, proveedor, producto, recurso o valor que el actor no pueda conocer;
2. una búsqueda dentro del filtro aplica la misma frontera de divulgación;
3. cambiar periodo, territorio, población, dimensión o métrica recalcula el resultado y puede invalidar la comparación previa;
4. los filtros conservan un estado reproducible asociado al resultado; no se infieren después desde la URL o el texto visible;
5. una selección vacía, parcial o incompatible se muestra como estado de selección, no como cero;
6. los filtros de alta cardinalidad utilizan búsqueda gobernada o selección progresiva; no requieren cargar todos los valores en cliente;
7. filtros personales o sensibles no aparecen por defecto en superficies ejecutivas o compartidas;
8. el rol base puede influir en orden de presentación heredado de `DATA-UX-001`, pero no constituye un filtro de seguridad;
9. un filtro de calidad permite localizar resultados por su estado cuando el actor puede conocer esos metadatos, pero no cambia ni certifica el estado;
10. los filtros no crean una dimensión que no esté permitida por la métrica.

---

#### 8. Matriz materializada de filtros por superficie

| Superficie                                          | Filtros base visibles cuando apliquen                                               | Filtros dimensionales elegibles                                                                   | Regla de protección                                                                                                                            |
| --------------------------------------------------- | ----------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| Comercial                                           | periodo, corte, territorio/sede autorizados                                         | producto, categoría, canal y otras dimensiones registradas por la métrica                         | canal, cliente o producto solo se enumeran dentro de la población autorizada; identidad de cliente requiere finalidad y protección específicas |
| Inventario, abastecimiento, proveedores y logística | periodo/corte, territorio/sede autorizados                                          | producto, ubicación gobernada, proveedor y otras dimensiones registradas por la métrica           | LOC, proveedor, activos o referencias sensibles no se descubren mediante filtros fuera del acceso concedido                                    |
| Producción                                          | periodo/corte, territorio/sede autorizados                                          | producto, receta/versión, lote o recurso únicamente cuando la métrica y autorización lo permitan  | lote, receta, costo técnico, calidad o recurso no amplían acceso por aparecer como dimensión                                                   |
| Servicio y clientes                                 | periodo/corte, territorio/sede autorizados                                          | canal, segmento o dimensión cliente únicamente cuando esté gobernada, autorizada y sea divulgable | no se habilita exploración individual ni poblaciones pequeñas por tener un agregado visible                                                    |
| Económico-financiera                                | periodo económico/contable/fiscal aplicable, corte, entidad o territorio autorizado | centro de costo, moneda y dimensiones aprobadas por la métrica                                    | clasificación financiera y precisión se protegen; centro de costo no equivale a sede, área, marca o canal                                      |
| Asistencia                                          | periodo/corte y sede autorizada                                                     | trabajador autorizado solo cuando la finalidad y el nivel de detalle lo permitan                  | no existe ranking individual por defecto; la dimensión trabajador no concede expediente laboral ni otros datos personales                      |

Los nombres de filtros físicos, widgets, URLs, parámetros y controles quedan fuera de esta tarea. La matriz define la experiencia y sus fronteras lógicas.

---

#### 9. Contrato de comparación

Toda comparación deberá responder qué dos resultados se comparan y por qué son suficientemente compatibles.

La comprobación mínima cubre once ejes:

1. `metric_key` y versión semántica;
2. fórmula, numerador y denominador cuando apliquen;
3. grano;
4. población y cobertura;
5. periodo, corte y condición `AS OF`;
6. calendario y zona horaria;
7. dimensiones y filtros materiales;
8. unidad, moneda y precisión;
9. estado DQ, frescura y limitaciones materiales;
10. identidad de snapshot, publicación o restatement cuando aplique;
11. autorización y perfil de divulgación de ambos lados.

Resultado de presentación:

- cuando todos los ejes materiales son compatibles, se permite comparación directa;
- cuando existe una diferencia conocida que no destruye el significado, la comparación puede mostrarse únicamente junto con la limitación que condiciona su interpretación;
- cuando una diferencia altera significado, población, unidad, versión o protección de forma material, la comparación directa no se muestra;
- la ausencia de un comparador válido no se reemplaza por un periodo arbitrario o una media global.

Tipos de referencia admitidos cuando las entradas son compatibles:

- periodo anterior equivalente;
- periodo homólogo bajo calendario comparable;
- territorio autorizado frente a otro territorio autorizado;
- segmento o dimensión autorizada frente a otra de la misma definición;
- resultado original frente a restatement o reconstrucción, conservando identidad de ambos;
- valor observado frente a baseline, meta o guardrail solo cuando esos elementos existan bajo el contrato de `DATA-DOM-015` y la experiencia de `DATA-UX-006`.

Una comparación no demuestra causalidad. Las causas, hipótesis, confianza y recomendaciones pertenecen a `DATA-UX-005`.

---

#### 10. Reglas especiales de agregación y comparación

1. los conteos y sumas se agregan únicamente sobre conjuntos disjuntos o con deduplicación explícita y trazable;
2. las tasas no se promedian entre sedes, personas, periodos o segmentos: se recomputan desde numerador y denominador sobre la población combinada;
3. una participación o mezcla conserva el denominador del total reconciliado correspondiente;
4. importes de monedas distintas no se suman sin una regla de conversión gobernada y temporalmente válida;
5. unidades físicas incompatibles no se mezclan por conveniencia visual;
6. un calendario modificado puede romper la comparación aunque los nombres de los periodos coincidan;
7. un cambio de jerarquía o maestro utiliza la vigencia histórica aplicable al hecho; no se reagrupa silenciosamente la historia con la jerarquía actual;
8. una fuente parcial no se compara como cobertura completa sin indicación explícita;
9. `BLOQUEADO` en cualquiera de los componentes necesarios impide publicar una cifra oficial derivada de esa comparación;
10. `NO EVALUADO` permanece visible y no se convierte en una señal verde por ausencia de defectos conocidos.

---

#### 11. Contrato de drill-down

El drill-down se define como una escalera de detalle gobernado y no como un enlace libre hacia filas fuente.

Niveles conceptuales máximos:

| Nivel | Contenido                                                  | Condición de entrada                                                               | Resultado posible                                                    |
| ----: | ---------------------------------------------------------- | ---------------------------------------------------------------------------------- | -------------------------------------------------------------------- |
|     1 | tablero de dominio y métrica resumida                      | actor autorizado para el resultado agregado                                        | valor/estado y contexto general                                      |
|     2 | tendencia o comparación de la métrica                      | comparabilidad y divulgación válidas                                               | serie, referencia y limitaciones                                     |
|     3 | desglose por dimensión autorizada                          | dimensión permitida por versión y población divulgable                             | grupos/segmentos protegidos                                          |
|     4 | hechos, eventos, casos o registros subyacentes autorizados | capacidad exacta de detalle, finalidad, territorio, campos y población reevaluados | detalle mínimo necesario                                             |
|     5 | fuente, evidencia o expediente propietario                 | contrato del recurso fuente y autorización específica                              | evidencia o referencia de origen dentro de la aplicación propietaria |

Reglas:

1. no todas las métricas alcanzan los cinco niveles;
2. el nivel máximo se determina por semántica, disponibilidad, autorización y protección, no por diseño del componente;
3. cada transición reevalúa actor, recurso, territorio, finalidad, clasificación, campos y población;
4. conocer un identificador no permite saltar niveles;
5. un KPI visible no concede filas fuente;
6. una celda suprimida no admite tooltip, deep link, búsqueda o metadato que revele sus miembros;
7. un grupo pequeño puede generalizarse, suprimirse o detener el drill-down conforme a A002;
8. el nivel fuente no permite corregir el dato desde el tablero; cualquier corrección ocurre mediante el proceso propietario;
9. volver al nivel superior conserva el contexto del análisis sin conservar autoridad obsoleta para una acción diferente;
10. si cambia actor, finalidad, periodo, recurso o autorización, el detalle incompatible se invalida y debe reconstruirse.

---

#### 12. Trazabilidad y reproducibilidad

Cada resultado material del tablero deberá conservar suficientes referencias para reconstruir qué se mostró sin copiar innecesariamente el dataset.

Contrato lógico mínimo:

```text
metric_key
metric_version
business_purpose_reference
owner_and_steward_reference
source_reference_set
transformation_or_model_version_reference
period
cutoff
business_timezone
calendar_reference
population_scope_reference
territory_reference
active_filter_snapshot
active_dimension_set
unit_or_currency
quality_state
freshness_reference
coverage_reference
publication_snapshot_or_restatement_reference
lineage_reference
query_or_interaction_correlation_reference_when_applicable
```

Reglas:

- las referencias no exigen que exista una columna física con esos nombres;
- la trazabilidad no registra PII, secretos o datasets completos cuando una referencia segura es suficiente;
- el catálogo de `DATA-UX-002` es el destino para comprender definición, dueño, fuente y linaje lógico;
- la implementación física de modelos, snapshots, caché, consulta y rendimiento pertenece a `DATA-INT-002`;
- un fallo al resolver una referencia material se presenta como limitación o bloqueo y no se rellena con contexto actual por conveniencia;
- el último cambio o versión relevante se muestra cuando la fuente lo permite; no se inventa una fecha de actualización ausente.

---

#### 13. Estado, calidad, frescura y cobertura

El tablero conserva los cinco estados DQ vigentes:

- `NO EVALUADO`;
- `EN OBSERVACIÓN`;
- `CERTIFICADO`;
- `DEGRADADO`;
- `BLOQUEADO`.

Reglas de experiencia:

1. el estado se muestra junto al resultado o mediante una referencia inequívoca visible sin depender solo de color;
2. `NO EVALUADO` puede presentarse como resultado provisional cuando el contrato de dominio lo permite, pero nunca como oficial certificado;
3. `EN OBSERVACIÓN` conserva la condición que exige vigilancia;
4. `DEGRADADO` identifica que el resultado puede estar disponible bajo una limitación material y no oculta esa limitación;
5. `BLOQUEADO` detiene el uso oficial que dependa del elemento bloqueado;
6. una cifra bloqueada no se sustituye por cero, por el último valor conocido ni por una estimación local;
7. frescura y cobertura se muestran cuando son materiales para interpretar el resultado;
8. la resolución operativa de calidad, conciliación y certificación pertenece a `DATA-UX-004`; el tablero solo conserva y enlaza el estado gobernado.

---

#### 14. Matriz de cobertura — Comercial, 11/11

Regla común: una familia es una categoría de análisis. Solo se convierte en contenido cuantitativo del tablero mediante una métrica concreta, registrada, versionada, autorizada y con estado heredado visible.

|    # | Familia canónica                             | Decisión UX003                                                                                                                | Comparación y drill-down                                                                                                                      |
| ---: | -------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
|    1 | ventas netas y brutas                        | mostrar únicamente métricas que distingan base comercial/fiscal, descuentos, devoluciones e importes conforme a su definición | comparar periodos, sedes, productos o canales solo si la métrica permite esas dimensiones; no convertir venta en margen                       |
|    2 | pedidos y conversión                         | separar conteo de pedidos de conversión; la conversión oficial permanece condicionada a numerador y denominador gobernados    | drill-down de conteo no concede la población de oportunidades; una tasa se recomputa desde sus componentes                                    |
|    3 | ticket y unidades                            | mantener ticket y unidades como métricas distintas con población y unidad explícitas                                          | comparar ticket solo sobre transacciones elegibles compatibles; unidades se desglosan únicamente en unidades compatibles                      |
|    4 | mezcla por producto, categoría, canal y sede | habilitar composición solo sobre dimensiones gobernadas y reconciliadas al total                                              | cada nivel reautoriza producto/categoría/canal/sede; una participación conserva su denominador                                                |
|    5 | demanda por franja, día y temporada          | distinguir demanda observada de demanda total y mostrar cobertura histórica                                                   | comparaciones estacionales requieren calendario e historia suficientes; no fabricar estacionalidad con cobertura parcial                      |
|    6 | disponibilidad perdida                       | mostrar bloqueo o resultado únicamente cuando intención y disponibilidad estén reconciliadas                                  | no inferir demanda perdida desde stock cero o ventas bajas; detalle conserva ventana, producto, oferta, sede y canal cuando estén autorizados |
|    7 | cancelaciones, devoluciones y descuentos     | mantener los tres fenómenos separados                                                                                         | comparar cada fenómeno con su propio denominador y corte; causas o sujetos requieren detalle autorizado independiente                         |
|    8 | promociones y efecto incremental             | distinguir descuento, promoción, exposición y efecto incremental                                                              | comparación before/after no prueba efecto causal; investigación causal se entrega a `DATA-UX-005`                                             |
|    9 | recurrencia y frecuencia                     | mostrar únicamente sobre identidad y finalidad gobernadas                                                                     | cohortes y frecuencia no permiten reidentificar clientes excluidos; detalle individual requiere capacidad separada                            |
|   10 | margen relacionado                           | consumir la definición económica gobernada; no calcular margen local en el tablero comercial                                  | comparación hereda método/costo D013 y su versión; drill-down no concede costos restringidos por mostrar ventas                               |
|   11 | capacidad comercial no utilizada             | presentar solo con denominador de capacidad compatible                                                                        | ventas bajas no prueban capacidad ociosa; desglose conserva unidad, sede, canal y ventana del denominador aprobado                            |

**Reconciliación:** 11 esperadas; 11 materializadas; 0 faltantes; 0 duplicadas.

---

#### 15. Matriz de cobertura — Inventario, abastecimiento, proveedores y logística, 12/12

|    # | Familia canónica                        | Decisión UX003                                                                         | Comparación y drill-down                                                                                                   |
| ---: | --------------------------------------- | -------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
|    1 | existencia disponible y comprometida    | separar física, comprometida, bloqueada/cuarentena, tránsito y disponible              | comparar cortes equivalentes; drill-down por producto/ubicación no mezcla estados ni concede movimientos no autorizados    |
|    2 | cobertura y días de inventario          | mostrar únicamente cuando existencia y tasa de demanda/consumo sean compatibles        | comparar horizontes con la misma unidad y definición; sin denominador válido no emitir valor numérico                      |
|    3 | rotación y permanencia                  | mantener flujo, inventario medio y antigüedad/cohorte explícitos                       | comparación requiere historia suficiente; no aproximar permanencia desde último movimiento                                 |
|    4 | faltantes y quiebres                    | distinguir faltante explícito de quiebre demostrado                                    | stock cero no prueba quiebre; drill-down exige necesidad elegible y disponibilidad correspondiente                         |
|    5 | vencimiento, daño y pérdida             | mantener vencimiento, daño, pérdida, cuarentena y disposición separados                | comparación de pérdida conserva causa y población; detalle de lote o evidencia se reautoriza                               |
|    6 | diferencias de conteo                   | conservar diferencia firmada, diferencia absoluta, corte y antes/después del ajuste    | desglose por producto/ubicación conserva signo; el tablero no ejecuta ajustes                                              |
|    7 | cumplimiento de remisiones              | separar solicitado, preparado, despachado, recibido, faltante y cierre                 | porcentajes se recomputan sobre cantidades compatibles; detalle de remisión se autoriza como recurso propio                |
|    8 | lead time y cumplimiento de proveedores | mostrar solo con evento inicial contractual y recepción aceptada comparables           | separar tiempo, cantidad, promesa, rechazo y parcialidad; proveedor/contacto sensible no se expone por agregado            |
|    9 | compras urgentes                        | contar únicamente hechos explícitamente clasificados bajo el carril gobernado          | una recepción de emergencia no se etiqueta automáticamente como compra urgente canónica; detalle conserva motivo protegido |
|   10 | consumo versus plan                     | exigir plan explícito de la misma población, unidad, sede y ventana                    | requisición, OC, remisión o forecast no sustituyen el plan; comparación se bloquea sin base compatible                     |
|   11 | costo de inventario                     | distinguir costo observado de compra y valoración oficial                              | valoración oficial consume definición D013; drill-down no revela condiciones comerciales restringidas sin autorización     |
|   12 | capacidad de almacenamiento             | mostrar ocupación/utilización solo con capacidad física utilizable y unidad compatible | no mezclar volumen, peso, posiciones, pallets o unidades; ubicación técnica no se enumera fuera de acceso                  |

**Reconciliación:** 12 esperadas; 12 materializadas; 0 faltantes; 0 duplicadas.

---

#### 16. Matriz de cobertura — Producción, 10/10

|    # | Familia canónica                            | Decisión UX003                                                                      | Comparación y drill-down                                                                                                   |
| ---: | ------------------------------------------- | ----------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
|    1 | demanda planificada versus producción       | comparar únicamente plan FOGO aceptado con producción elegible compatible           | señal, pedido o remisión no sustituyen el plan; preservar producto, versión/unidad, sede, ventana y revisión               |
|    2 | capacidad disponible y utilizada            | mantener denominador y uso en la misma unidad                                       | no mezclar horas, kg, lotes, estaciones o personas sin puente explícito; recurso físico exige autorización de detalle      |
|    3 | adherencia al programa                      | mostrar únicamente sobre programa publicado/versionado y hitos reales               | inicio, finalización y cantidad se comparan por separado antes de un compuesto                                             |
|    4 | rendimiento teórico y real                  | reconciliar receta/versión, escala, unidad y salida real                            | el costo o rendimiento técnico no se convierte en resultado económico; historia requiere versiones compatibles             |
|    5 | consumo estándar y real                     | comparar estándar aprobado con consumo real por ingrediente/unidad compatibles      | sustituciones permanecen visibles; el desglose no reescribe receta ni consumo fuente                                       |
|    6 | merma, reproceso y aprovechamiento          | exigir hechos explícitos y denominadores propios                                    | no inferir merma como residuo de rendimiento; genealogía y evidencia requieren drill-down autorizado                       |
|    7 | calidad, retención y rechazo                | separar control, resultado, conformidad, retención, rechazo, reproceso y liberación | tasas usan población inspeccionada/elegible declarada; detalle de calidad respeta sensibilidad y caso                      |
|    8 | tiempo de ciclo                             | construir duración solo entre hitos reales y compatibles                            | espera, preparación, ejecución, pausa, retención y liberación permanecen separables; una fecha genérica no prueba duración |
|    9 | cumplimiento de liberación                  | distinguir terminado de liberado y usar autoridad válida                            | drill-down al lote o expediente de liberación no se concede por el agregado                                                |
|   10 | costo y variación por lote, producto y sede | separar costo técnico observado de costo/variación económica oficial                | comparación económica consume D013; detalle conserva lote, asignación y versión sin exponer costos fuera de finalidad      |

**Reconciliación:** 10 esperadas; 10 materializadas; 0 faltantes; 0 duplicadas.

---

#### 17. Matriz de cobertura — Servicio y clientes, 12/12

|    # | Familia canónica                                        | Decisión UX003                                                                           | Comparación y drill-down                                                                            |
| ---: | ------------------------------------------------------- | ---------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
|    1 | cumplimiento de promesa                                 | comparar compromiso aceptado/versionado contra evento terminal elegible                  | solicitud o ventana pedida no equivale a promesa; detalle de pedido conserva estados y autorización |
|    2 | tiempos de preparación, despacho y entrega              | mantener cada fase y sus hitos reales separados                                          | no usar duración total como sustituto de fases; ausencia de hito se muestra como limitación         |
|    3 | pedidos completos                                       | exigir cumplimiento línea a línea, cantidades, revisiones y sustituciones aceptadas      | `delivered` no prueba completitud; drill-down no revela cliente por defecto                         |
|    4 | reclamos y tiempo de resolución                         | usar expediente explícito, recepción, resolución y SLA/version aplicable                 | chat o contacto no sustituyen reclamo; caso individual exige finalidad y acceso propios             |
|    5 | compensaciones                                          | separar devolución, reembolso, descuento, cortesía, cupón y puntos                       | comparar por tipo/política compatibles; valor individual o causa se protege en detalle              |
|    6 | satisfacción y feedback                                 | distinguir feedback interno, invitación y reputación externa                             | estadísticos muestran sesgo/cobertura; tasa de respuesta exige denominador de invitaciones          |
|    7 | recurrencia, frecuencia y abandono                      | reutilizar identidad gobernada; abandono exige población, ventana y observación completa | ausencia no prueba abandono; cohortes pequeñas aplican protección contra reidentificación           |
|    8 | adquisición y activación                                | exigir origen gobernado y eventos de adquisición/activación versionados                  | crear cuenta o iniciar sesión no equivale a activación; origen sensible no se infiere localmente    |
|    9 | fidelización, puntos y redenciones                      | separar `earn`, `spend`, `adjust`, redenciones y saldo                                   | saldo es proyección del ledger; drill-down a movimientos requiere acceso específico                 |
|   10 | reputación y temas recurrentes                          | distinguir fuente pública gobernada de feedback interno y clasificación temática         | temas no prueban causa; fuentes externas y detalle textual conservan protección y procedencia       |
|   11 | reservas, no-show y utilización                         | separar reserva, cancelación, asistencia y no-show; utilización exige capacidad          | comparación requiere capacidad compatible; reserva individual se reautoriza                         |
|   12 | valor y rentabilidad del cliente cuando esté autorizado | permitir solo sobre identidad/finalidad autorizadas y definición económica D013          | no recalcular margen local; el agregado no concede perfil, compras ni rentabilidad individual       |

**Reconciliación:** 12 esperadas; 12 materializadas; 0 faltantes; 0 duplicadas.

---

#### 18. Matriz de cobertura — Económico-financiera, 10/10

|    # | Familia canónica              | Decisión UX003                                                                                | Comparación y drill-down                                                                                                      |
| ---: | ----------------------------- | --------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
|    1 | costos estándar y reales      | separar bases estándar y reales con método, versión, unidad, moneda y periodo                 | comparación oficial queda condicionada al método económico gobernado; detalle de componentes respeta clasificación financiera |
|    2 | variaciones                   | mantener cada base de comparación explícita                                                   | costo, presupuesto, forecast, precio y cantidad no se colapsan en una variación genérica                                      |
|    3 | margen y contribución         | exigir ingreso realizado y costo/costo variable trazables                                     | cada porcentaje conserva denominador; ventas no sustituyen margen y el drill-down de costo se protege                         |
|    4 | gastos                        | separar capturado, reconocido, aprobado, pagado, anulado y conciliado                         | comparar solo estados elegibles equivalentes; detalle documental no se concede desde el total                                 |
|    5 | centros de costo              | utilizarlo como dimensión económica gobernada, no como KPI autónomo                           | centro no equivale a sede, área, marca o canal; reparenting usa vigencia histórica                                            |
|    6 | presupuesto y forecast        | mantener presupuesto aprobado, revisión, forecast, escenario y real como artefactos distintos | comparar versiones sin sobrescribirlas; hipótesis no se presentan como dato observado                                         |
|    7 | caja, bancos y tesorería      | distinguir posición reconciliada, flujo realizado y proyección                                | saldos y disponibilidad requieren fuentes reconciliadas; detalle bancario permanece restringido                               |
|    8 | cartera y obligaciones        | derivar saldo abierto desde reconocimiento y aplicaciones válidas                             | pago/cobro sin aplicación no cierra saldo; aging conserva corte y vencimiento                                                 |
|    9 | rentabilidad multidimensional | exigir ingreso realizado, costos trazables, asignaciones y residuo no atribuible visibles     | dimensiones sensibles y combinaciones de baja población se protegen; no recalcular con costo actual la historia               |
|   10 | escenarios y simulaciones     | mantener supuestos/versiones y línea base inmutable                                           | resultado simulado no sustituye real, presupuesto, forecast ni evidencia observada                                            |

**Reconciliación:** 10 esperadas; 10 materializadas; 0 faltantes; 0 duplicadas.

---

#### 19. Reconciliación global de las 55 familias

| Dominio de familias                                 | Esperadas | Materializadas | Faltantes | Duplicadas |
| --------------------------------------------------- | --------: | -------------: | --------: | ---------: |
| Comercial                                           |        11 |             11 |         0 |          0 |
| Inventario, abastecimiento, proveedores y logística |        12 |             12 |         0 |          0 |
| Producción                                          |        10 |             10 |         0 |          0 |
| Servicio y clientes                                 |        12 |             12 |         0 |          0 |
| Económico-financiera                                |        10 |             10 |         0 |          0 |
| **Total**                                           |    **55** |         **55** |     **0** |      **0** |

Regla global: ninguna de estas 55 filas crea una métrica nominal. El tablero solo materializa un valor cuando existe una métrica concreta con `metric_key`, versión, definición y fuente gobernadas. Los estados mixtos o bloqueos de `DATA-DOM-009` a `DATA-DOM-013` se resuelven en la métrica concreta y no se simplifican a un estado ficticio de familia.

---

#### 20. Superficie especializada de asistencia — 14/14 métricas

Las 14 métricas v1 conservan exactamente su identidad, dimensiones permitidas y estado DQ heredado.

|    # | `metric_key`        | DQ heredado   | Presentación UX003                                                              | Comparación y drill-down                                                                                                                                |
| ---: | ------------------- | ------------- | ------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
|    1 | `scheduledShifts`   | `NO EVALUADO` | valor provisional con estado visible                                            | comparar por sede/periodo y trabajador autorizado cuando proceda; detalle a turnos programados solo con acceso de detalle                               |
|    2 | `attendedShifts`    | `NO EVALUADO` | valor provisional con estado visible                                            | comparar poblaciones equivalentes; drill-down a turno/sesión reautoriza datos laborales                                                                 |
|    3 | `restDayCount`      | `NO EVALUADO` | valor provisional con estado visible                                            | conservar clasificación de descanso y periodo; detalle a turno programado autorizado                                                                    |
|    4 | `lateCount`         | `NO EVALUADO` | valor provisional con gracia/contexto trazables                                 | comparar solo con misma regla o versión de gracia; detalle conserva inicio programado, check-in y zona horaria                                          |
|    5 | `noShowCount`       | `NO EVALUADO` | valor provisional `AS OF` corte                                                 | solo contar turnos cuyo fin ocurrió al corte; detalle reautoriza turno y ausencia asociada                                                              |
|    6 | `openCount`         | `NO EVALUADO` | valor provisional `AS OF` corte                                                 | no confundir sesión abierta con falta de cierre; drill-down a sesión requiere acceso específico                                                         |
|    7 | `missingCloseCount` | `BLOQUEADO`   | mostrar bloqueo y definición; no publicar cifra oficial                         | no sustituir por `openCount`; navegación prioritaria hacia calidad/limitación y definición                                                              |
|    8 | `autoCloseCount`    | `NO EVALUADO` | valor provisional con mecanismo de autocierre distinguido                       | comparar periodos compatibles; detalle de sesión conserva evidencia de autocierre                                                                       |
|    9 | `departureCount`    | `NO EVALUADO` | valor provisional con protección reforzada del detalle                          | evento geográfico no se expone por el agregado; drill-down exige finalidad y autorización específicas                                                   |
|   10 | `scheduledMinutes`  | `NO EVALUADO` | suma provisional en minutos; horas solo como presentación derivada              | comparar misma regla de descanso y unidad; detalle a turnos autorizados                                                                                 |
|   11 | `netMinutes`        | `NO EVALUADO` | suma provisional en minutos                                                     | conservar sesión y descansos superpuestos; no reconstruir desde estado actual del trabajador                                                            |
|   12 | `incidentCount`     | `NO EVALUADO` | conteo compuesto provisional, máximo una incidencia agregada por turno elegible | el compuesto no concede automáticamente las señales individuales; cada detalle se protege                                                               |
|   13 | `attendanceRate`    | `BLOQUEADO`   | mostrar bloqueo y componentes cuando sean autorizados; no emitir KPI oficial    | nunca promediar porcentajes; recomputar desde `attendedShifts / scheduledShifts` solo cuando exista denominador positivo y la divergencia esté resuelta |
|   14 | `punctualityRate`   | `BLOQUEADO`   | mostrar bloqueo y componentes cuando sean autorizados; no emitir KPI oficial    | recomputar desde su numerador y `attendedShifts`; sin denominador positivo no emitir valor numérico                                                     |

**Reconciliación:** 14 esperadas; 14 materializadas; 14 únicas; 0 faltantes; 0 duplicadas; 11 `NO EVALUADO`; 3 `BLOQUEADO`.

Reglas adicionales:

- dimensiones v1: sede, trabajador autorizado y periodo, conforme a la definición de cada métrica;
- trabajador es una dimensión sensible y no implica ranking, comparación individual o acceso al expediente laboral;
- tasas se agregan mediante numeradores y denominadores, no mediante promedio simple de porcentajes;
- `noShowCount`, `openCount` y `missingCloseCount` dependen del corte;
- la zona horaria efectiva se conserva en cada resultado; no se infiere una zona universal para historia o comparaciones;
- `missingCloseCount`, `attendanceRate` y `punctualityRate` permanecen bloqueadas hasta que sus condiciones canónicas de salida estén resueltas por sus tareas propietarias.

---

#### 21. Familias de artefacto D008 — cobertura 6/6

|    # | Familia          | Papel en UX003                                                           | Límite                                                                                         |
| ---: | ---------------- | ------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------- |
|    1 | tablero          | artefacto principal de esta tarea para análisis interactivo gobernado    | no redefine fórmula, no certifica y no se convierte en fuente de verdad                        |
|    2 | reporte          | puede ser destino o referencia de una edición gobernada                  | experiencia de edición, versionado y distribución pertenece a `DATA-UX-007`                    |
|    3 | exportación      | puede aparecer como acción separada solo cuando `EXPORT` esté autorizado | consultar o publicar no concede exportación ni detalle adicional                               |
|    4 | suscripción      | puede conservar vínculo con el tablero o resultado gobernado             | configuración y entrega pertenecen a `DATA-UX-007`; cada entrega conserva autorización vigente |
|    5 | alerta           | puede señalar una condición gobernada y servir como entrada de análisis  | alerta no equivale a diagnóstico, causa, meta, recomendación ni acción automática              |
|    6 | snapshot oficial | puede compararse con resultado vivo o restatement bajo reglas D017       | es inmutable como edición publicada; publicación, certificación y exportación siguen separadas |

**Reconciliación:** 6 esperadas; 6 materializadas; 0 faltantes; 0 duplicadas.

---

#### 22. Navegación entre tablero, catálogo y calidad

La experiencia preserva destinos distintos:

```text
¿QUÉ SIGNIFICA ESTA MÉTRICA?
→ DATA-UX-002

¿CÓMO CAMBIÓ Y DÓNDE SE CONCENTRA?
→ DATA-UX-003

¿PUEDO CONFIAR EN SU CALIDAD, FRESCURA O RECONCILIACIÓN?
→ DATA-UX-004

¿POR QUÉ CAMBIÓ O QUÉ HIPÓTESIS EXPLICA LA VARIACIÓN?
→ DATA-UX-005

¿CONTRA QUÉ OBJETIVO, META, DRIVER O GUARDRAIL SE GESTIONA?
→ DATA-UX-006

¿CÓMO SE PUBLICA, DISTRIBUYE O PRESERVA COMO SALIDA?
→ DATA-UX-007
```

Un mismo actor puede navegar entre destinos solo si cada superficie resuelve nuevamente su autorización. La continuidad visual no es continuidad de privilegios.

---

#### 23. Autorización, privacidad y segregación

Reglas obligatorias:

1. A001 construye la población autorizada antes del cálculo;
2. los filtros de UX003 nunca amplían esa población;
3. A002 protege campos, precisión, grupos pequeños, comparaciones, tooltips, búsquedas, metadatos y cada nivel de drill-down;
4. una métrica agregada no concede acceso a sus sujetos, hechos o documentos;
5. una dimensión sensible puede ocultarse aunque la métrica agregada sea visible;
6. un resultado parcial se identifica como parcial cuando no representa toda la población organizacional;
7. no se usa total menos subtotal para inferir una población excluida;
8. no se muestran rankings de trabajadores, clientes o proveedores por defecto;
9. `PUBLISH` no concede `EXPORT`;
10. `CERTIFY` no concede `PUBLISH`;
11. `ANNOTATE` no cambia fórmula, calidad, meta, publicación ni historia;
12. `ADMINISTER` no es superpermiso;
13. el tablero no ofrece una mutación de fuente por tener acceso a detalle;
14. al abrir una acción distinta se exige la capacidad exacta correspondiente;
15. una opción no pertinente o no autorizada no se expone como pista de una capacidad sensible.

---

#### 24. Auditoría y correlación

`DATA-AUTH-004` mantiene seis familias auditables: consulta, descarga, suscripción, alerta, modelo y recomendación.

Para UX003:

- la apertura o reconstrucción material de un tablero se considera consumo analítico sujeto al contrato de consulta aplicable;
- un cambio de filtros que materialmente cambie población, periodo, recurso o resultado puede constituir una nueva consulta lógica conforme al contrato de auditoría;
- la transición de un agregado a un detalle conserva correlación cuando el contrato transversal lo exige;
- una navegación a modelo o recomendación no convierte el tablero en propietario de ese artefacto;
- la auditoría registra referencias y contexto suficiente, no datasets o PII por defecto;
- auditoría no constituye autorización, certificación, fuente de verdad, publicación ni prueba causal;
- un fallo técnico de consulta no se registra como denegación empresarial por inferencia.

---

#### 25. Historia, snapshots, correcciones y restatements

1. toda comparación histórica conserva la versión semántica aplicable a cada lado;
2. el resultado conocido en un corte anterior permanece distinguible del resultado reconstruido posteriormente;
3. una corrección de fuente no reescribe silenciosamente un snapshot o publicación previa;
4. un restatement conserva referencia al resultado anterior y explica qué versión o dependencia cambió cuando esa información esté disponible;
5. un restatement no hereda automáticamente certificación de la versión anterior;
6. una serie que cruza una ruptura semántica no dibuja continuidad falsa: separa tramos, muestra limitación o utiliza una reconstrucción gobernada compatible;
7. cambios de maestros o jerarquías utilizan vigencia histórica y no reagrupan hechos pasados con relaciones actuales por defecto;
8. comparar original y restatement exige autorización vigente para ambos resultados;
9. un snapshot oficial sigue siendo un artefacto distinto del valor vivo actual;
10. exportar una versión histórica requiere `EXPORT` y no se deriva de la capacidad de comparar.

---

#### 26. Accesibilidad, ergonomía y comportamiento visual

Los tableros son superficies analíticas/administrativas y pueden utilizar mayor densidad que una estación operativa, pero deben conservar la línea base de accesibilidad y ergonomía vigente.

Reglas:

- orden semántico y visual coherentes;
- navegación por teclado y foco visible cuando corresponda;
- nombres, estados, valores y relaciones programáticamente determinables cuando aplique;
- color, forma o posición no son la única señal de calidad, tendencia o selección;
- zoom y reflow no deben exigir scroll horizontal ordinario para interpretar el contexto principal;
- visualizaciones disponen de resumen textual o tabla accesible cuando sea necesario para entender el resultado;
- tooltips no son el único lugar donde existe información esencial;
- filtros y controles conservan etiquetas inequívocas y estado seleccionado;
- cambios de filtros no desplazan el foco de forma impredecible;
- carga progresiva no cambia silenciosamente el significado del resultado;
- en pantallas estrechas se priorizan contexto, métrica y estado antes de visualizaciones secundarias;
- una superficie táctil, si posteriormente se habilita, deberá aplicar además el perfil táctil correspondiente; esta tarea no declara una estación física ni un dispositivo objetivo.

La validación con usuarios y contextos reales corresponde a `DATA-UX-008`.

---

#### 27. Estados de ausencia, supresión y bloqueo

La experiencia distingue al menos estos significados sin crear un estado de dominio nuevo:

| Presentación        | Significado                                                                                              |
| ------------------- | -------------------------------------------------------------------------------------------------------- |
| valor `0`           | la métrica produjo legítimamente cero bajo su definición                                                 |
| sin dato disponible | no existe un valor suficiente para el contexto solicitado                                                |
| resultado parcial   | la cobertura o el alcance no representa el universo completo                                             |
| contenido suprimido | el resultado existe o podría existir, pero la política de divulgación impide mostrarlo en esa proyección |
| función no mostrada | la opción no es pertinente o no puede exponerse al actor actual                                          |
| `BLOQUEADO`         | una condición DQ o de dependencia impide el uso gobernado correspondiente                                |

No se utiliza la diferencia entre mensajes para revelar la existencia de un recurso secreto. La redacción concreta de bloqueos consume la gramática de `UX-BASE-006`.

---

#### 28. Handoffs con propietario documental exacto

| Decisión o materialización fuera del alcance                                  | Propietario documental | Condición de salida                                                               |
| ----------------------------------------------------------------------------- | ---------------------- | --------------------------------------------------------------------------------- |
| ficha de definición, dueño, fuente, calidad, linaje e historia                | `DATA-UX-002`          | cuando el usuario necesite comprender el significado o procedencia del elemento   |
| centro de calidad, frescura, conciliaciones y certificación                   | `DATA-UX-004`          | antes de materializar workflows de resolución DQ desde una limitación del tablero |
| investigación de variaciones, anomalías, hipótesis y causas                   | `DATA-UX-005`          | antes de convertir una señal o delta en investigación explicativa                 |
| objetivos, baseline, metas, drivers, guardrails y acciones de mejora          | `DATA-UX-006`          | antes de gestionar desempeño contra objetivos desde una métrica                   |
| reportes, exportaciones, suscripciones y snapshots versionados                | `DATA-UX-007`          | antes de materializar salida, distribución o edición oficial desde un análisis    |
| validación de comprensión, tiempos, densidad y decisiones con usuarios reales | `DATA-UX-008`          | antes de declarar readiness de la experiencia analítica                           |
| contratos de eventos y lectura con aplicaciones y fuentes externas            | `DATA-INT-001`         | antes de implementar una lectura o evento físico que alimente el tablero          |
| modelos semánticos, snapshots, caché, consultas y rendimiento                 | `DATA-INT-002`         | antes de implementar cálculo, consulta o materialización física de UX003          |
| crosswalks, claves externas e identidad/reconciliación de maestros            | `DATA-INT-003`         | antes de unir dimensiones cuya identidad externa no esté resuelta                 |
| BI, hojas de cálculo, modelos analíticos e inteligencia artificial            | `DATA-INT-004`         | antes de permitir consumidores o herramientas externas del tablero                |

No queda una brecha de UX003 sin propietario documental exacto.

---

#### 29. Cobertura de requisitos de prueba vigente

La conducta materializada por `DATA-UX-003` ya está protegida por requisitos canónicos vigentes:

- `TREQ-DATA-002` exige identidad/versionado de métricas, propósito, propietario, fórmula, granularidad, dimensiones, filtros, unidad, tiempo, fuente, calidad, certificación, drill-down y comparación, y asigna responsabilidad a `DATA-UX-001` a `DATA-UX-003`;
- `TREQ-DATA-003` protege contratos de origen, tiempo, granularidad, cobertura, correcciones, reconciliación y linaje;
- `TREQ-DATA-004` exige que tableros y otras salidas declaren versión, periodo, zona horaria, filtros, dimensiones, unidad/moneda, corte, frescura, cobertura y calidad, con divulgación progresiva y drill-down autorizado, y asigna responsabilidad a `DATA-UX-001` a `DATA-UX-008`;
- `TREQ-UX-003` exige información, acciones y densidad adecuadas a tarea y autorización, con minimización de información sensible;
- `TREQ-UX-005` exige fuente de verdad, estado, actor y último cambio visibles cuando apliquen y evita copias competidoras;
- `TREQ-UX-010` exige contexto administrativo de territorio, periodo, versión, estado, población, actor, permiso, segregación e impacto cuando apliquen, y prohíbe tratar un filtro como contexto operativo o una proyección como fuente de verdad.

La presente tarea especializa esas obligaciones para tableros por dominio, filtros, comparación, drill-down y trazabilidad. No introduce una regla ejecutable independiente fuera de esa cobertura ni cambia la semántica de los requisitos existentes.

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** el comportamiento verificable de identidad y versión de métricas, filtros gobernados, comparación compatible, contexto, protección de población, divulgación progresiva, drill-down autorizado, fuente de verdad y trazabilidad ya está protegido por los requisitos canónicos vigentes enumerados en la sección de cobertura anterior. La tarea materializa su aplicación a tableros analíticos de profundidad sin crear una regla ejecutable adicional fuera de esa cobertura.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 30. Criterios de aceptación

`DATA-UX-003` se considera documentalmente completa cuando se compruebe que:

1. el tablero se define como artefacto analítico derivado y no como fuente de verdad;
2. la experiencia profunda no duplica la home ejecutiva de `DATA-UX-001`;
3. definición, dueño, fuente y linaje permanecen gobernados por `DATA-UX-002`;
4. existen cinco tableros de familias correspondientes a D009–D013 y una superficie especializada de asistencia sin crear un dominio nuevo;
5. la arquitectura lógica del tablero contiene contexto, resultados, tendencia/comparación, composición/desglose, calidad/limitaciones y drill-down/trazabilidad;
6. toda cifra visible proviene de una métrica concreta y versionada;
7. una familia analítica nunca se convierte en métrica por aparecer en el tablero;
8. el conjunto autorizado se construye antes de filtros y cálculo;
9. un filtro solo reduce el conjunto autorizado;
10. las opciones de filtro no enumeran recursos o valores no autorizados;
11. la sede seleccionada no sustituye territorio real;
12. una dimensión solo aparece cuando la versión de la métrica la permite;
13. cambiar contexto material recalcula el resultado y reevalúa comparación/divulgación;
14. el estado de filtros queda asociado al resultado reproducible;
15. existen once ejes mínimos de compatibilidad de comparación;
16. una comparación incompatible no se fuerza por conveniencia visual;
17. una diferencia material conocida puede mostrarse solo junto con su limitación;
18. un delta nunca se interpreta como causalidad;
19. tasas agregadas se recomputan desde numerador y denominador;
20. importes de monedas o unidades incompatibles no se suman sin contrato gobernado;
21. cambios de calendario, zona horaria, cobertura o versión pueden invalidar una comparación;
22. jerarquías históricas usan la vigencia aplicable al hecho;
23. existen cinco niveles conceptuales máximos de drill-down;
24. cada nivel reevalúa actor, recurso, territorio, finalidad, clasificación, campos y población;
25. conocer un identificador no permite saltar niveles;
26. un KPI o agregado visible no concede filas fuente;
27. una celda suprimida no revela miembros por tooltip, búsqueda, conteo o deep link;
28. el nivel fuente no permite corregir datos desde el tablero;
29. cada resultado conserva metric key, versión, periodo, corte, zona horaria, filtros, dimensiones, unidad/moneda, DQ, frescura, cobertura y referencias de linaje cuando apliquen;
30. trazabilidad no exige copiar PII o datasets completos en logs;
31. los cinco estados DQ vigentes conservan su semántica;
32. `NO EVALUADO` no se presenta como `CERTIFICADO`;
33. `BLOQUEADO` no se presenta como cero, último valor conocido o estimación oficial;
34. se materializan exactamente 55 familias analíticas;
35. se conserva la distribución exacta 11 + 12 + 10 + 12 + 10;
36. las 55 familias aparecen una sola vez y no faltan identidades;
37. se materializan exactamente 14 métricas de asistencia;
38. las 14 claves son únicas y conservan versión semántica v1;
39. se preservan exactamente 11 métricas `NO EVALUADO` y 3 `BLOQUEADO`;
40. `missingCloseCount`, `attendanceRate` y `punctualityRate` permanecen bloqueadas;
41. `openCount` y `missingCloseCount` permanecen semánticamente separados;
42. `noShowCount`, `openCount` y `missingCloseCount` conservan semántica dependiente del corte;
43. `attendanceRate` y `punctualityRate` nunca se agregan por promedio simple de porcentajes;
44. la dimensión trabajador no habilita ranking individual por defecto;
45. se materializan exactamente seis familias de artefacto D008;
46. tablero, reporte, exportación, suscripción, alerta y snapshot oficial permanecen artefactos distintos;
47. publicación no concede exportación;
48. el tablero no certifica, define fórmulas, fija metas, administra fuentes ni ejecuta recomendaciones;
49. consultas, filtros y drill-down conservan trazabilidad A004 cuando corresponda;
50. historia, snapshot, original y restatement permanecen distinguibles;
51. un restatement no hereda automáticamente certificación previa;
52. una ruptura semántica no se oculta mediante una serie continua engañosa;
53. privacidad, grupos pequeños, precisión y exposición indirecta aplican también a filtros y metadatos;
54. color no es la única señal de tendencia, calidad o selección;
55. la experiencia conserva teclado, foco, semántica, reflow y representación accesible cuando apliquen;
56. no se crean rutas, componentes, endpoints, modelos físicos, cachés, vistas o nombres técnicos de implementación;
57. no se crean ni asignan permisos, roles, grants o excepciones;
58. no se modifica código, DDL, DML, RLS, RPC, datos, migraciones, backfills, despliegues o Supabase;
59. no se crea ni modifica ningún requisito de prueba;
60. cada decisión fuera de alcance tiene un propietario documental exacto;
61. `DATA-UX-004` permanece únicamente reservada como siguiente tarea.

---

#### 31. Balance de cierre

| Control                                       |   Resultado |
| --------------------------------------------- | ----------: |
| Tableros de familias de dominio               |   **5 / 5** |
| Superficie especializada de asistencia        |   **1 / 1** |
| Familias comerciales                          | **11 / 11** |
| Familias inventario/abastecimiento            | **12 / 12** |
| Familias producción                           | **10 / 10** |
| Familias servicio/clientes                    | **12 / 12** |
| Familias económico-financieras                | **10 / 10** |
| Familias analíticas totales                   | **55 / 55** |
| Métricas de asistencia                        | **14 / 14** |
| Métricas `NO EVALUADO` / `BLOQUEADO`          |  **11 / 3** |
| Familias de artefacto D008                    |   **6 / 6** |
| Ejes mínimos de compatibilidad de comparación |      **11** |
| Niveles conceptuales máximos de drill-down    |       **5** |
| Identidades nuevas de métrica                 |       **0** |
| Permisos, roles o grants creados              |       **0** |
| Cambios físicos                               |       **0** |
| Requisitos TREQ nuevos o modificados          |       **0** |

---

#### 32. Continuidad

ÚLTIMA TAREA APROBADA
`DATA-UX-002 — Diseñar catálogo de métricas y datos maestros con definición, dueño, fuente, calidad y linaje`

TAREA ACTUAL APROBADA
`DATA-UX-003 — Diseñar tableros por dominio con filtros, comparación, drill-down y trazabilidad`

SIGUIENTE TAREA RESERVADA
`DATA-UX-004 — Diseñar centro de calidad, frescura, conciliaciones y certificación`


### ✅ DATA-UX-004 — Diseñar centro de calidad, frescura, conciliaciones y certificación

**Estado:** APROBADA
**Tarea anterior:** `DATA-UX-003 — Diseñar tableros por dominio con filtros, comparación, drill-down y trazabilidad` — APROBADA
**Tarea siguiente:** `DATA-UX-005 — Diseñar espacio de investigación de variaciones, anomalías y causas` — RESERVADA
**Tipo de tarea:** documental; diseño normativo y materializado de la experiencia del centro de calidad para evaluar frescura, cobertura, conciliaciones, incidencias y decisiones de certificación sin alterar datos fuente ni elevar estados por inferencia
**Bloque:** AB — Analítica, indicadores y datos maestros
**Fase:** exclusivamente documental
**Implementación técnica:** no autorizada
**Código, rutas físicas, componentes, DDL, DML, migraciones, RLS, RPC, grants, cambios de permisos, datos, backfills, despliegues o cambios en Supabase:** no autorizados
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Diseñar la experiencia mediante la cual un actor autorizado puede comprender el estado real de calidad de una fuente, objeto maestro, familia de hechos, métrica o resultado analítico; identificar qué dimensión falla; verificar frescura, cobertura y conciliación; conocer el propietario de resolución; revisar evidencia; y, únicamente cuando posea la capacidad separada correspondiente, emitir una decisión de certificación para una coordenada exacta.

El centro deberá responder de forma determinista:

1. ¿qué recurso o resultado se está evaluando?;
2. ¿para qué uso, periodo, versión y corte se evalúa?;
3. ¿cuál es su estado de calidad vigente para esa coordenada?;
4. ¿qué dimensión o dependencia explica una observación, degradación o bloqueo?;
5. ¿hasta qué corte están actualizadas las fuentes necesarias?;
6. ¿qué población y cobertura están realmente demostradas?;
7. ¿qué diferencias permanecen abiertas en la conciliación?;
8. ¿qué evidencia respalda el estado mostrado?;
9. ¿quién es propietario, steward y, cuando corresponda, certificador autorizado?;
10. ¿qué acción de resolución pertenece a la fuente o contrato propietario?;
11. ¿qué debe reevaluarse después de una corrección, backfill, reconstrucción o restatement?;
12. ¿qué información puede conocer el actor sin ampliar su autorización por entrar al centro?

Principio rector:

```text
CENTRO DE CALIDAD
=
COORDENADA DE EVALUACIÓN
+ ESTADO DQ VIGENTE
+ DIMENSIONES Y CONTROLES APLICABLES
+ FRESCURA Y COBERTURA REALES
+ CONCILIACIÓN Y DIFERENCIAS VISIBLES
+ EVIDENCIA Y RESPONSABILIDAD
+ ACCIONES GOBERNADAS SEPARADAS

NO

PANTALLA = CERTIFICACIÓN
CHECK VERDE = CERTIFICADO
CORRECCIÓN = RECERTIFICACIÓN
PUBLICACIÓN = CERTIFICACIÓN
ACCESO AL CENTRO = ACCESO AL DETALLE
```

---

#### 2. Resultado sustantivo

Queda materializado el diseño del centro de calidad con los siguientes resultados:

- una única experiencia conceptual de calidad para fuentes, mecanismos de entrada, familias de hechos, objetos maestros/de referencia, métricas y resultados analíticos;
- diez dimensiones DQ visibles y diferenciadas, sin colapsarlas en un puntaje universal;
- cinco estados canónicos de certificación preservados exactamente y `NO_APLICA` tratado aparte como decisión de alcance;
- una coordenada de evaluación explícita por recurso, uso, periodo, versión, corte, dependencias y evidencia;
- una primera vista que prioriza bloqueos, degradaciones, observaciones y recursos no evaluados sin confundir prioridad visual con severidad global;
- una experiencia de frescura que muestra corte, referencia temporal y atraso respecto del contrato concreto, sin inventar un SLA común;
- una experiencia de cobertura que distingue atributos, relaciones y población y nunca fabrica denominadores;
- una experiencia de conciliación que conserva origen, aceptados, rechazados, cuarentena, duplicados, exclusiones, resultado y diferencias cuando esos datos existan en el contrato;
- una cola de incidencias que conserva dimensión, coordenada, impacto sobre el uso, propietario/steward y evidencia de resolución;
- una puerta de certificación de doce condiciones, visible como evaluación gobernada y no como automatismo visual;
- segregación estricta entre evaluación, corrección, certificación, publicación, anotación, exportación y administración;
- cobertura explícita de los cuatro mecanismos de entrada aprobados;
- cobertura explícita de las quince familias heredadas de hechos/eventos/representaciones;
- cobertura explícita de los sesenta y dos objetos maestros y de referencia;
- cobertura explícita de las cuatro fuentes observadas de asistencia;
- cobertura explícita de las catorce métricas de asistencia, preservando once `NO EVALUADO` y tres `BLOQUEADO`;
- preservación de `missingCloseCount`, `attendanceRate` y `punctualityRate` como bloqueadas;
- cero fórmulas nuevas, cero estados DQ nuevos, cero umbrales universales, cero permisos nuevos y cero cambios físicos;
- cero cambios de requisitos de prueba.

Reconciliación documental:

| Inventario consumido               | Esperado | Materializado | Faltantes | Duplicados |
| ---------------------------------- | -------: | ------------: | --------: | ---------: |
| Dimensiones de calidad             |       10 |            10 |         0 |          0 |
| Estados canónicos de certificación |        5 |             5 |         0 |          0 |
| Mecanismos de entrada              |        4 |             4 |         0 |          0 |
| Familias heredadas                 |       15 |            15 |         0 |          0 |
| Objetos maestros/referencia        |       62 |            62 |         0 |          0 |
| Fuentes observadas de asistencia   |        4 |             4 |         0 |          0 |
| Métricas de asistencia             |       14 |            14 |         0 |          0 |

Estos conjuntos no se suman como un único total de recursos porque se solapan conceptualmente: una métrica, por ejemplo, puede depender de una fuente incluida en otro inventario. El centro evita un contador global aditivo que sugiera independencia inexistente.

---

#### 3. Entradas canónicas consumidas

Esta tarea consume sin redefinir:

- `DATA-DOM-006` para mecanismos de entrada, ingestión, duplicados, cuarentena, reconciliación, backfill, corrección, reconstrucción y linaje;
- `DATA-DOM-007` para las diez dimensiones DQ, los cinco estados, la coordenada de evaluación, la puerta de certificación, frescura, cobertura, propagación, incidencias y los inventarios materializados;
- `DATA-DOM-008` para la separación entre calidad/certificación y publicación de tableros, reportes, exportaciones, suscripciones, alertas y snapshots;
- `DATA-DOM-017` para correcciones históricas, restatements y reproducibilidad;
- `DATA-AUTH-001` para construir el conjunto autorizado antes de presentar recursos o agregados;
- `DATA-AUTH-002` para minimizar detalle sensible, proteger poblaciones pequeñas e impedir inferencias mediante conteos, filtros, tooltips o navegación profunda;
- `DATA-AUTH-003` para separar `DEFINE`, `CERTIFY`, `PUBLISH`, `SET_TARGET`, `ANNOTATE`, `EXPORT` y `ADMINISTER`;
- `DATA-AUTH-004` para trazabilidad de consumo analítico sin convertir auditoría en autorización o certificación;
- `DATA-UX-001` para la navegación desde calidad y limitaciones de la vista ejecutiva;
- `DATA-UX-002` para definición, gobierno, fuente, calidad, linaje e historia de métricas y objetos de catálogo;
- `DATA-UX-003` para contexto, corte, calidad y navegación desde tableros por dominio;
- `UX-BASE-001` a `UX-BASE-015` para carril administrativo/analítico, contexto visible, lenguaje humano, simplicidad, excepciones y divulgación progresiva;
- `NFR-REQ-005` a `NFR-REQ-007` para privacidad, trazabilidad, accesibilidad y ergonomía;
- los requisitos de prueba vigentes que ya protegen identidad, calidad, frescura, conciliación, artefactos analíticos y experiencia administrativa.

---

#### 4. Fronteras conceptuales obligatorias

```text
CALIDAD ≠ AUTORIZACIÓN
```

```text
ESTADO DOCUMENTAL ≠ ESTADO DQ
```

```text
PROCESADO ≠ RECONCILIADO ≠ EVALUADO ≠ CERTIFICADO ≠ PUBLICADO
```

```text
FRESCO ≠ COMPLETO ≠ VÁLIDO ≠ RECONCILIADO ≠ CERTIFICADO
```

```text
SEÑAL DQ ≠ INCIDENCIA ≠ CORRECCIÓN ≠ CERTIFICACIÓN
```

```text
CERTIFICADOR ≠ PROPIETARIO ≠ STEWARD ≠ CUSTODIO TÉCNICO ≠ PUBLICADOR
```

```text
CERO MEDIDO ≠ NULO ≠ NO APLICA ≠ DESCONOCIDO ≠ NO RECIBIDO ≠ DATO PENDIENTE
```

```text
DUPLICADO TÉCNICO ≠ DUPLICADO EMPRESARIAL ≠ FUSIÓN DE IDENTIDADES
```

```text
ÚLTIMO CORTE CONOCIDO ≠ ACTUALIZACIÓN NUEVA
```

```text
PUNTAJE AGREGADO ≠ EVIDENCIA DE CALIDAD
```

El centro no crea un semáforo único que oculte cuál dimensión falló. Cuando se use una síntesis visual, debe conservar acceso al estado DQ, la dimensión, la coordenada, la evidencia y la consecuencia real sobre el uso.

---

#### 5. Arquitectura de información del centro

La experiencia se organiza en seis zonas lógicas coordinadas:

1. **Contexto de evaluación**: recurso, uso, periodo, corte, versiones, población, alcance y finalidad.
2. **Estado y atención**: estado DQ vigente, limitaciones materiales y recursos que requieren revisión.
3. **Dimensiones de calidad**: resultado por las diez dimensiones aplicables, sin puntaje universal obligatorio.
4. **Frescura, cobertura y conciliación**: actualidad, población cubierta y diferencias respecto del origen o contrato.
5. **Evidencia e historia**: controles, dependencias, decisiones previas, correcciones y recertificaciones vinculadas.
6. **Acciones gobernadas**: únicamente las acciones exactas que el actor tenga autorizadas, manteniendo segregación.

La primera vista no intenta mostrar simultáneamente los 62 objetos, las 15 familias, las 14 métricas y todas sus evidencias. Presenta atención y resumen autorizado; la expansión del inventario exige una acción explícita y mantiene filtros, contexto y protección.

---

#### 6. Coordenada visible de evaluación

Toda ficha de calidad deberá poder mostrar, cuando aplique y sea seguro:

| Componente                  | Decisión UX                                                                                       |
| --------------------------- | ------------------------------------------------------------------------------------------------- |
| recurso evaluado            | nombre empresarial o identidad canónica autorizada; no usar tabla física como sustituto semántico |
| clase de recurso            | fuente, mecanismo, familia, maestro/referencia, métrica, resultado o artefacto, según contrato    |
| uso empresarial             | expresa qué decisión o consumo se pretende soportar                                               |
| periodo o ventana           | delimita la población temporal evaluada                                                           |
| fecha y hora de corte       | fija hasta qué información debía estar incorporada                                                |
| versión semántica           | visible cuando el significado depende de una versión                                              |
| versión de esquema/contrato | visible cuando condiciona interpretación o compatibilidad                                         |
| versión de transformación   | visible para derivados cuando aplica                                                              |
| población esperada          | solo se presenta si existe un denominador demostrable                                             |
| dimensiones críticas        | muestra cuáles controles son materiales para el uso                                               |
| fuentes y dependencias      | muestra únicamente dependencias que el actor esté autorizado a conocer                            |
| resultado de conciliación   | expone diferencias materiales y estado de resolución cuando aplica                                |
| evidencia                   | resume existencia, fecha y referencia segura; el detalle sigue autorización propia                |
| propietario y steward       | indica responsabilidad funcional y de mantenimiento                                               |
| certificador                | se muestra únicamente cuando su identidad o función sea divulgable y necesaria                    |

Cambiar uso, periodo, corte, versión, población o dependencia puede cambiar la coordenada y obliga a recuperar de nuevo el estado aplicable. El centro no reutiliza por conveniencia una certificación de otra coordenada.

---

#### 7. Matriz UX de las diez dimensiones de calidad

|    # | Dimensión              | Qué muestra el centro                                                                                        | Consecuencia UX cuando existe falla material                                                                            |
| ---: | ---------------------- | ------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------- |
|    1 | completitud            | atributos, relaciones y población requeridos, separados; faltantes y cobertura demostrable                   | indicar qué plano está incompleto y si el uso queda degradado o bloqueado; nunca convertir ausencia en cero             |
|    2 | unicidad               | clave/alcance evaluados, duplicados técnicos o conflictos de identidad demostrados                           | impedir que similitud visual se presente como duplicidad empresarial; dirigir la resolución al propietario              |
|    3 | validez                | contrato/versión aplicables y controles de dominio, formato, estado, rango o regla                           | mostrar valores o conjuntos no válidos sin corregirlos silenciosamente para aprobar                                     |
|    4 | consistencia           | contradicciones entre atributos, estados, tiempos, fuentes o representaciones                                | conservar qué fuentes divergen y cuál autoridad por atributo debe resolver; una copia no prevalece por ser más reciente |
|    5 | integridad referencial | referencias críticas resueltas al tiempo y contexto correctos                                                | mostrar referencias no resueltas o en cuarentena; nunca proponer emparejamiento por parecido como hecho                 |
|    6 | frescura               | corte exigido, último corte conocido, ocurrencia/recepción/procesamiento relevantes y referencia contractual | declarar atraso o vigencia real; no inventar un umbral universal ni presentar un dato antiguo como actualizado          |
|    7 | cobertura              | población declarada, incluida y parcialidad conocida                                                         | mostrar porcentaje solo si existe denominador demostrable; en caso contrario mostrar cobertura parcial/no cuantificable |
|    8 | volumen y forma        | conteos, estructura y cambios materiales respecto de la forma esperada cuando el contrato lo defina          | observar, degradar o bloquear según evidencia; una variación estadística por sí sola no se rotula error                 |
|    9 | reconciliación         | origen, aceptados, rechazados, cuarentena, duplicados, exclusiones, resultado y diferencia cuando aplican    | impedir certificación mientras exista diferencia material abierta; nunca ocultarla ajustando el agregado                |
|   10 | estabilidad histórica  | versión/corte reproducibles, correcciones, reconstrucciones y restatements                                   | mostrar divergencia histórica y vínculo entre versiones; bloquear certificación histórica cuando no pueda explicarse    |

**Reconciliación:** 10 dimensiones esperadas; 10 materializadas; 10 identidades únicas; 0 faltantes; 0 duplicadas.

---

#### 8. Estados DQ y presentación

| Estado           | Presentación principal                                                            | Acción conceptual permitida por el estado                                                   | Prohibición UX                                                                  |
| ---------------- | --------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- |
| `NO EVALUADO`    | indicar ausencia de evidencia suficiente para la coordenada                       | consultar controles, dependencias y propietario; iniciar workflow autorizado si corresponde | no presentarlo como aceptable, saludable o certificado por defecto              |
| `EN OBSERVACIÓN` | mostrar señal bajo seguimiento, dimensión afectada y uso condicionado             | revisar evidencia y seguimiento autorizado                                                  | no equipararlo a certificado ni a degradado sin decisión material               |
| `CERTIFICADO`    | mostrar coordenada exacta, corte, versión y evidencia de decisión                 | consumir dentro del uso certificado y consultar historia                                    | no extenderlo a otra población, periodo, versión, uso o publicación             |
| `DEGRADADO`      | mostrar limitación conocida, alcance afectado y advertencia explícita             | permitir solo usos que el contrato admita bajo degradación                                  | no ocultar la limitación ni presentarla como certificada                        |
| `BLOQUEADO`      | mostrar impedimento crítico, dependencia/causa segura y propietario de resolución | consultar evidencia y navegar al proceso propietario cuando esté autorizado                 | no mostrar cifra sustituta, cero, estado verde ni acción de publicación oficial |

`NO_APLICA` se presenta en un filtro y etiqueta de alcance separados. No participa en conteos de los cinco estados de certificación ni se ofrece como resultado emitible por `CERTIFY`.

El orden predeterminado de atención puede priorizar visualmente `BLOQUEADO`, `DEGRADADO`, `EN OBSERVACIÓN` y `NO EVALUADO` antes de `CERTIFICADO`. Ese orden solo organiza la revisión y no crea una escala universal de severidad.

---

#### 9. Resumen y conteos de calidad

Los conteos de la primera vista cumplen estas reglas:

1. se calculan únicamente sobre recursos que el actor esté autorizado a conocer;
2. cada contador identifica el conjunto y la coordenada resumidos;
3. no se usan conteos globales para inferir recursos ocultos;
4. `NO_APLICA` se informa separado de los cinco estados;
5. un mismo recurso no se duplica en el mismo contador por múltiples dimensiones afectadas;
6. los conjuntos superpuestos no se suman entre sí para producir un total ficticio;
7. una selección de estado solo reduce el conjunto autorizado y no concede acceso a evidencia o detalle;
8. una cifra de `CERTIFICADO` no implica que el actor pueda publicar, exportar o administrar esos recursos.

---

#### 10. Búsqueda y filtros

El centro admite como filtros conceptuales únicamente valores de metadatos que el actor esté autorizado a conocer:

- estado DQ;
- decisión `NO_APLICA` separada;
- dimensión afectada;
- clase de recurso;
- dominio o fuente propietaria;
- propietario/steward cuando sea divulgable;
- periodo o corte;
- uso empresarial;
- estado de conciliación cuando exista una decisión material;
- presencia de incidencia abierta o evidencia pendiente, cuando el contrato fuente lo determine.

Reglas:

- las opciones de filtro no enumeran recursos, dominios, propietarios o estados ocultos;
- un filtro nunca cambia la autorización final;
- búsqueda por identificador requiere la misma autorización que la navegación normal;
- un resultado oculto no puede revelarse mediante autocomplete, conteo, tooltip, error o URL;
- no se crea un filtro local de “certificable” basado en heurística; la puerta de certificación se evalúa sobre la coordenada concreta.

---

#### 11. Frescura y vigencia

La experiencia de frescura conserva la referencia propia de cada clase de origen:

| Clase                         | Información mínima visible                                                     | Regla UX                                                                             |
| ----------------------------- | ------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------ |
| evento                        | ocurrencia, recepción y último evento esperado cuando el contrato lo define    | distinguir atraso de origen, transporte y procesamiento                              |
| API                           | instante de consulta/corte, ventana solicitada y última información confirmada | respuesta exitosa no equivale a fuente fresca                                        |
| vista                         | corte de dependencias y versión de definición                                  | hereda frescura de dependencias; no crea frescura propia                             |
| exportación controlada        | periodo/corte cubierto por el archivo, recepción y cobertura declarada         | una importación reciente de un archivo antiguo sigue siendo antigua para ese periodo |
| maestro/referencia versionada | vigencia efectiva y última decisión válida requerida por el uso                | no mostrar reloj de atraso cuando la ausencia de cambio empresarial es correcta      |
| snapshot                      | corte de publicación                                                           | puede ser histórico, íntegro y válido sin ser actual                                 |

El centro debe poder diferenciar, cuando apliquen, ocurrencia, fecha empresarial, recepción, procesamiento, corrección, conciliación y corte. No transforma esa secuencia en una sola marca “actualizado hace X” si ello altera el significado.

---

#### 12. Cobertura y estados de ausencia

La experiencia de cobertura mantiene tres planos visibles cuando el uso los exige:

1. **atributos requeridos**;
2. **relaciones requeridas**;
3. **población esperada**.

La interfaz conserva de forma diferenciada:

- `0` como valor medido;
- `NULO` según semántica contractual;
- `NO APLICA` como exclusión semántica;
- `DESCONOCIDO` cuando no puede determinarse;
- `NO RECIBIDO` cuando la evidencia esperada no llegó;
- `DATO PENDIENTE` cuando existe una resolución o llegada todavía abierta.

No se presenta `100 %` de cobertura si el universo esperado no es demostrable. En ese caso se explica que la cobertura no puede cuantificarse con evidencia suficiente y se conserva el efecto real sobre el uso.

---

#### 13. Experiencia de conciliación

Cuando el contrato del recurso lo permita, el panel de conciliación muestra como piezas separadas:

- evidencia u origen identificado;
- periodo y corte;
- población o unidades recibidas;
- aceptados;
- rechazados;
- cuarentena;
- duplicados tratados conforme a identidad/idempotencia;
- exclusiones permitidas por definición;
- resultado materializado o derivado;
- diferencias absolutas o relativas únicamente cuando la semántica las permita;
- diferencias explicadas;
- diferencias materiales abiertas;
- última reevaluación;
- propietario/steward de resolución;
- evidencia vinculada.

No se impone una ecuación universal de conciliación sobre dominios con semánticas distintas. El centro presenta los componentes que el contrato propietario define y exige que toda diferencia material pueda explicarse antes de una decisión `CERTIFICADO`.

Una corrección no se ejecuta sobre el agregado del centro. La resolución ocurre en la fuente, relación, mapping, contrato o proceso propietario y después puede provocar reproceso, reconstrucción, conciliación y nueva evaluación.

---

#### 14. Incidencias de calidad

El centro materializa el workflow documental aprobado sin crear un enum técnico nuevo:

```text
DETECCIÓN
→ IDENTIFICAR DIMENSIÓN Y COORDENADA AFECTADA
→ DETERMINAR IMPACTO SOBRE EL USO
→ ASIGNAR PROPIETARIO / STEWARD
→ OBSERVAR, DEGRADAR O BLOQUEAR
→ CORREGIR EN LA FUENTE, RELACIÓN O CONTRATO PROPIETARIO
→ REPROCESAR O RECONSTRUIR CUANDO APLIQUE
→ RECONCILIAR
→ REEVALUAR CALIDAD
→ RECERTIFICAR SOLO CON EVIDENCIA
```

Cada incidencia visible conserva como mínimo, cuando aplique:

- recurso y coordenada afectados;
- dimensión DQ;
- uso afectado;
- estado DQ resultante o vigente;
- causa segura y evidencia disponible;
- fuente/dependencia relacionada;
- propietario y steward;
- consecuencia sobre consumo, comparación o publicación;
- referencia a la corrección o reconciliación cuando exista;
- última evaluación y decisión vinculada.

Una incidencia no desaparece de la experiencia solo porque el recurso deje de aparecer en un tablero. Su cierre documental exige evidencia de corrección/reconciliación o una decisión explícita permitida por el contrato.

---

#### 15. Puerta UX para una decisión de certificación

El centro solo presenta una acción de decisión de calidad cuando el actor posee autorización exacta para `CERTIFY` sobre el recurso y la coordenada. La acción no se habilita por rol, propiedad funcional, stewardship, custodia técnica, administración ni capacidad de publicación.

Antes de emitir una decisión, la experiencia debe permitir comprobar las doce condiciones canónicas:

1. definición y versión identificadas;
2. fuente o fuentes propietarias identificadas;
3. corte y periodo explícitos;
4. controles críticos definidos y ejecutables;
5. frescura compatible con el uso;
6. completitud y cobertura suficientes;
7. unicidad, validez, consistencia e integridad referencial satisfechas en controles críticos;
8. conciliación cerrada o diferencias materialmente explicadas y aceptadas conforme al contrato;
9. linaje hacia fuente/evidencia y versiones aplicadas;
10. ausencia de incidencia bloqueante abierta para el uso;
11. actor autorizado para certificar y segregación aplicable satisfecha;
12. evidencia retenida de evaluación y excepciones aceptadas.

Reglas UX:

- el cumplimiento visual de las condiciones no cambia el estado automáticamente;
- una decisión debe referenciar la coordenada exacta y la evidencia utilizada;
- un estado `BLOQUEADO` de una dependencia requerida no puede ser neutralizado desde el centro;
- `CERTIFICADO` no concede `PUBLISH`, `EXPORT` ni otra acción;
- una corrección o backfill posterior no hereda automáticamente la decisión previa;
- una recertificación es una decisión vinculada nueva y no reescribe la anterior;
- cuando la política exige independencia entre actores, la interfaz bloquea la segunda acción si la segregación no puede demostrarse;
- no se ofrece certificación masiva genérica que omita uso, periodo, versión, corte, dependencia o evidencia.

---

#### 16. Acciones gobernadas y segregación

| Acción A003  | Tratamiento dentro del centro                                                                                                              |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------------------ |
| `DEFINE`     | no se ejecuta por inferencia desde calidad; cambios semánticos navegan al gobierno propietario cuando estén autorizados                    |
| `CERTIFY`    | acción propia de decisión DQ; exige autorización exacta, coordenada, evidencia y segregación                                               |
| `PUBLISH`    | no se concede por certificar; la publicación pertenece a su superficie gobernada                                                           |
| `SET_TARGET` | no forma parte de calidad; una meta no cambia controles, hechos ni estado DQ                                                               |
| `ANNOTATE`   | puede aportar contexto no autoritativo cuando exista autorización separada; nunca cambia estado por sí sola                                |
| `EXPORT`     | no se concede por consultar calidad; toda salida portable requiere autorización independiente y protección de detalle                      |
| `ADMINISTER` | puede operar asignación o mecánica de workflow cuando esté autorizada; nunca permite autoasignarse certificación ni neutralizar un bloqueo |

No existe una barra universal de acciones basada únicamente en que el usuario abrió el centro.

---

#### 17. Cobertura de los cuatro mecanismos de entrada

|    # | Mecanismo              | Estado documental heredado | DQ base       | Decisión de experiencia                                                                                                                                                             |
| ---: | ---------------------- | -------------------------- | ------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|    1 | Evento                 | `ESPECIFICADO`             | `NO EVALUADO` | mostrar identidad/correlación, versión, idempotencia, referencias críticas, ocurrencia/recepción y cobertura de ventana; la corrida concreta requiere evidencia antes de certificar |
|    2 | API                    | `ESPECIFICADO`             | `NO EVALUADO` | mostrar contrato/versión, parámetros materiales, corte, paginación, errores parciales, última información confirmada y cobertura del proveedor                                      |
|    3 | Vista                  | `ESPECIFICADO`             | `NO EVALUADO` | mostrar definición, dependencias, filtros, grano, joins, corte y calidad heredada; no permitir que la vista se certifique aislada de sus fuentes                                    |
|    4 | Exportación controlada | `ESPECIFICADO`             | `NO EVALUADO` | mostrar original/evidencia, formato/versión, periodo, recepción, mapping, duplicados, cuarentena y cobertura; importación no equivale a certificación                               |

**Reconciliación:** 4 mecanismos esperados; 4 materializados; 4 únicos; 0 faltantes; 0 duplicados; 4 con DQ base `NO EVALUADO`.

---

#### 18. Cobertura de las quince familias heredadas

|    # | Familia canónica                                                         | DQ heredado   | Decisión de experiencia                                                                                                                     |
| ---: | ------------------------------------------------------------------------ | ------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
|    1 | SHIFT, ATTENDANCE_EVENT, ATTENDANCE_CORRECTION                           | `NO EVALUADO` | presentar controles de turnos/eventos, correspondencia turno-sesión, tiempos, correcciones y corte laboral; no certificar sin evidencia     |
|    2 | CONSENT_RECORD, CONTACT_VERIFICATION                                     | `NO EVALUADO` | presentar evidencia/versión/finalidad, persona/contacto, vigencia y retiro con protección reforzada de detalle                              |
|    3 | LOYALTY_LEDGER_ENTRY, redención, ajuste de puntos                        | `NO EVALUADO` | presentar unicidad/idempotencia, cuenta/regla, vigencia y conciliación del ledger sin usar el saldo como sustituto de movimientos           |
|    4 | solicitud, caso, cotización, orden, recepción, devolución de compra      | `NO EVALUADO` | presentar identidad cabecera/línea, referencias, cantidades/importes/estados, vigencias y conciliación propietaria                          |
|    5 | lote, LPN, existencia, movimiento, conteo, ajuste                        | `NO EVALUADO` | presentar identidad de lote/LPN, integridad producto-LOC, cortes y reconciliación entre movimientos, conteos, ajustes y existencia derivada |
|    6 | orden, lote, ejecución, consumo, merma y resultado productivo            | `NO EVALUADO` | presentar receta/versión/recursos, cantidades, balance y corte real de ejecución sin elevar costo técnico a verdad económica                |
|    7 | pedido, comanda, venta, pago, caja, devolución, entrega                  | `NO EVALUADO` | presentar identidades separadas, líneas/partes monetarias, referencias, estados y conciliación por hecho                                    |
|    8 | precio de venta, descuento, promoción vigente                            | `NO EVALUADO` | presentar versión/vigencia y contexto aplicado; AURA solo conserva intención promocional cuando corresponda y no adquiere fuente operativa  |
|    9 | SERVICE_CASE, reclamo, reserva, compensación, satisfacción, comunicación | `NO EVALUADO` | presentar identidad de caso/evento, actor/relación, tiempos, estados y evidencia con minimización de información sensible                   |
|   10 | hecho económico, obligación, pago, aplicación, conciliación              | `NO EVALUADO` | presentar identidades, moneda, referencias, importes, aplicaciones y saldos conciliables bajo corte económico/contable                      |
|   11 | presupuesto, forecast, escenario                                         | `NO EVALUADO` | presentar versión/periodo/escenario, dimensiones, totales y estado de aprobación; no mezclar real, presupuesto, forecast y simulación       |
|   12 | campaña, pieza publicada, oportunidad, interacción, publicación          | `BLOQUEADO`   | mostrar que AURA objetivo no dispone de fuente operativa vigente; no ofrecer certificación desde hojas, listas o copias paralelas           |
|   13 | ticket, incidente, problema, cambio tecnológico                          | `NO EVALUADO` | presentar identidades separadas, servicio/recurso, secuencia de estados, tiempos y evidencia de cierre                                      |
|   14 | PRINTER como clase de configuración, ASSET como clase de configuración   | `NO_APLICA`   | mostrar como decisión de alcance separada; evaluar objetos/eventos propietarios en lugar de fabricar una familia de hecho autónoma          |
|   15 | métrica, KPI, dashboard, reporte, exportación, snapshot                  | `NO EVALUADO` | presentar versión, fuentes, corte, dimensiones/filtros, calidad heredada, conciliación y linaje; publicación permanece separada             |

**Reconciliación:** 15 familias esperadas; 15 materializadas; 15 únicas; 0 faltantes; 0 duplicados. Distribución DQ preservada: 13 `NO EVALUADO`, 1 `BLOQUEADO`, 1 `NO_APLICA`.

---

#### 19. Cobertura de los sesenta y dos objetos maestros y de referencia

Cada fila conserva la identidad y clase de `DATA-DOM-002` y el estado DQ base de `DATA-DOM-007`. El centro no redefine sus controles ni su fuente; materializa la decisión de experiencia para cada identidad.

|    # | Objeto canónico               | Clase             | DQ heredado   | Decisión en el centro                                                                                                             |
| ---: | ----------------------------- | ----------------- | ------------- | --------------------------------------------------------------------------------------------------------------------------------- |
|    1 | `ORGANIZATION_SCOPE`          | `DATO_MAESTRO`    | `NO EVALUADO` | mostrar vigencia, controles aplicables, evidencia y propietario; no ofrecer certificación sin evaluación contextual               |
|    2 | `LEGAL_SUBJECT`               | `DATO_MAESTRO`    | `NO EVALUADO` | mostrar vigencia, controles aplicables, evidencia y propietario; no ofrecer certificación sin evaluación contextual               |
|    3 | `BRAND`                       | `DATO_MAESTRO`    | `NO EVALUADO` | mostrar vigencia, controles aplicables, evidencia y propietario; no ofrecer certificación sin evaluación contextual               |
|    4 | `COMMERCIAL_ESTABLISHMENT`    | `DATO_MAESTRO`    | `NO EVALUADO` | mostrar vigencia, controles aplicables, evidencia y propietario; no ofrecer certificación sin evaluación contextual               |
|    5 | `BUSINESS_LINE`               | `DATO_MAESTRO`    | `NO EVALUADO` | mostrar vigencia, controles aplicables, evidencia y propietario; no ofrecer certificación sin evaluación contextual               |
|    6 | `PHYSICAL_FACILITY`           | `DATO_MAESTRO`    | `NO EVALUADO` | mostrar vigencia, controles aplicables, evidencia y propietario; no ofrecer certificación sin evaluación contextual               |
|    7 | `OPERATIONAL_SITE`            | `DATO_MAESTRO`    | `NO EVALUADO` | mostrar vigencia, controles aplicables, evidencia y propietario; no ofrecer certificación sin evaluación contextual               |
|    8 | `ORGANIZATIONAL_AREA`         | `DATO_MAESTRO`    | `NO EVALUADO` | mostrar vigencia, controles aplicables, evidencia y propietario; no ofrecer certificación sin evaluación contextual               |
|    9 | `PHYSICAL_ZONE`               | `DATO_MAESTRO`    | `NO EVALUADO` | mostrar vigencia, controles aplicables, evidencia y propietario; no ofrecer certificación sin evaluación contextual               |
|   10 | `WORKSTATION`                 | `DATO_MAESTRO`    | `NO EVALUADO` | mostrar vigencia, controles aplicables, evidencia y propietario; no ofrecer certificación sin evaluación contextual               |
|   11 | `EXTERNAL_OPERATIONAL_POINT`  | `DATO_MAESTRO`    | `NO EVALUADO` | mostrar vigencia, controles aplicables, evidencia y propietario; no ofrecer certificación sin evaluación contextual               |
|   12 | `PERSON_IDENTITY`             | `DATO_MAESTRO`    | `NO EVALUADO` | mostrar controles de identidad bajo minimización reforzada; no exponer relaciones o evidencias fuera de finalidad                 |
|   13 | `WORKER_PROFILE`              | `DATO_MAESTRO`    | `NO EVALUADO` | mostrar controles y vigencia laboral solo a actores autorizados; el estado DQ no amplía acceso a información personal             |
|   14 | `EMPLOYMENT_RELATIONSHIP`     | `DATO_MAESTRO`    | `NO EVALUADO` | mostrar controles y vigencia del vínculo con protección de detalle; no certificar por existencia documental                       |
|   15 | `CONTRACTUAL_POSITION`        | `DATO_REFERENCIA` | `NO EVALUADO` | mostrar código/identidad, definición, vigencia y evidencia; no ofrecer certificación sin evaluación contextual                    |
|   16 | `BASE_ROLE`                   | `DATO_REFERENCIA` | `NO EVALUADO` | mostrar identidad, definición, vigencia y consistencia; la calidad del catálogo de roles no concede permisos                      |
|   17 | `OPERATIONAL_ROLE`            | `DATO_REFERENCIA` | `NO EVALUADO` | mostrar identidad, definición y vigencia; la calidad no fabrica contexto operativo ni autoridad                                   |
|   18 | `WORK_ASSIGNMENT`             | `DATO_MAESTRO`    | `NO EVALUADO` | mostrar referencias, intervalos y vigencia bajo autorización; no usar asignación actual para reparar historia                     |
|   19 | `CUSTOMER_PERSON`             | `DATO_MAESTRO`    | `NO EVALUADO` | mostrar controles de identidad y evidencia con minimización; contacto similar no prueba identidad                                 |
|   20 | `CUSTOMER_CONTACT`            | `DATO_MAESTRO`    | `NO EVALUADO` | mostrar formato, fuente, verificación y vigencia únicamente según finalidad autorizada                                            |
|   21 | `CUSTOMER_RELATIONSHIP`       | `DATO_MAESTRO`    | `NO EVALUADO` | mostrar referencias y vigencia sin inferir consentimiento ni ampliar finalidad                                                    |
|   22 | `CUSTOMER_PROFILE`            | `DATO_MAESTRO`    | `NO EVALUADO` | mostrar calidad de la proyección y fuente autorizada sin revelar atributos innecesarios                                           |
|   23 | `CUSTOMER_PREFERENCE`         | `DATO_MAESTRO`    | `NO EVALUADO` | mostrar fuente, finalidad y vigencia; calidad no sustituye consentimiento ni autorización                                         |
|   24 | `LOYALTY_ACCOUNT`             | `DATO_MAESTRO`    | `NO EVALUADO` | mostrar identidad, referencias y conciliación del saldo con ledger cuando exista evidencia                                        |
|   25 | `LOYALTY_PROGRAM_RULE`        | `DATO_REFERENCIA` | `NO EVALUADO` | mostrar versión, reglas y vigencia; no reconstruir historia con una versión actual distinta                                       |
|   26 | `PRODUCTO_MAESTRO`            | `DATO_MAESTRO`    | `NO EVALUADO` | mostrar identidad, códigos, taxonomías, relaciones y vigencia; no fusionar por nombre                                             |
|   27 | `VARIANTE`                    | `DATO_MAESTRO`    | `NO EVALUADO` | mostrar referencia a producto, atributos diferenciadores y vigencia; no reparar por similitud visual                              |
|   28 | `PRESENTACION`                | `DATO_MAESTRO`    | `NO EVALUADO` | mostrar producto, cantidad, unidad, multiplicador y vigencia sin alterar equivalencias desde el centro                            |
|   29 | `UNIDAD_DE_MEDIDA`            | `DATO_REFERENCIA` | `NO EVALUADO` | mostrar código, dimensión, conversiones gobernadas y vigencia; no mezclar identidad con conversión                                |
|   30 | `TAXONOMIA_TIPO_MAESTRO`      | `DATO_REFERENCIA` | `NO EVALUADO` | mostrar jerarquía/relaciones y vigencia; no reparentar historia por corrección visual                                             |
|   31 | `TAXONOMIA_INVENTARIO`        | `DATO_REFERENCIA` | `NO EVALUADO` | mostrar jerarquía/relaciones y vigencia; no reparentar historia por corrección visual                                             |
|   32 | `TAXONOMIA_OPERACIONAL`       | `DATO_REFERENCIA` | `NO EVALUADO` | mostrar jerarquía/relaciones y vigencia; no reparentar historia por corrección visual                                             |
|   33 | `LOC`                         | `DATO_MAESTRO`    | `NO EVALUADO` | mostrar identidad, tipo, relaciones y vigencia; no usar ubicación parecida como referencia automática                             |
|   34 | `ACTIVO_FISICO`               | `DATO_MAESTRO`    | `NO EVALUADO` | mostrar identidad, clase, ubicación/custodia y vigencia; serie no sustituye identidad canónica                                    |
|   35 | `CLASE_DE_ACTIVO`             | `DATO_REFERENCIA` | `NO EVALUADO` | mostrar código/identidad, definición y vigencia; no ofrecer certificación sin evaluación contextual                               |
|   36 | `ESPECIFICACION_PRODUCTO`     | `DATO_MAESTRO`    | `NO EVALUADO` | mostrar identidad/versión, producto y autoridad por atributo; no corregir especificación desde un agregado                        |
|   37 | `PROVEEDOR`                   | `DATO_MAESTRO`    | `NO EVALUADO` | mostrar identidad, procedencia, estado y vigencia bajo protección comercial                                                       |
|   38 | `CONTACTO_PROVEEDOR`          | `DATO_MAESTRO`    | `NO EVALUADO` | mostrar referencia, canal, formato, fuente y vigencia solo según finalidad autorizada                                             |
|   39 | `RELACION_PRODUCTO_PROVEEDOR` | `DATO_MAESTRO`    | `NO EVALUADO` | mostrar coordenada proveedor-producto, contexto y vigencia; duplicidad se evalúa con identidad aprobada                           |
|   40 | `CONDICION_COMERCIAL`         | `DATO_MAESTRO`    | `NO EVALUADO` | mostrar versión, contexto, valores y vigencia con minimización de condiciones sensibles                                           |
|   41 | `TAXONOMIA_COMPRA`            | `DATO_REFERENCIA` | `NO EVALUADO` | mostrar código, jerarquía/relación y vigencia; no reescribir hechos históricos al cambiar clasificación                           |
|   42 | `RECETA`                      | `DATO_MAESTRO`    | `NO EVALUADO` | mostrar identidad/versión, referencias y vigencia con protección de conocimiento propietario                                      |
|   43 | `FAMILIA_PRODUCTIVA`          | `DATO_REFERENCIA` | `NO EVALUADO` | mostrar código/identidad, definición y relaciones; no certificar por mera existencia del catálogo                                 |
|   44 | `RUTA_PRODUCTIVA`             | `DATO_MAESTRO`    | `NO EVALUADO` | mostrar identidad/versión, secuencia, recursos y vigencia; no modificar secuencia desde calidad                                   |
|   45 | `RECURSO_PRODUCTIVO`          | `DATO_MAESTRO`    | `NO EVALUADO` | mostrar identidad, relación funcional/física, estado y vigencia; corrección pertenece a la fuente propietaria                     |
|   46 | `COMMERCIAL_CHANNEL`          | `DATO_REFERENCIA` | `NO EVALUADO` | mostrar código/identidad, definición, alcance y vigencia; mappings externos permanecen gobernados aparte                          |
|   47 | `CATEGORIA_COMERCIAL`         | `DATO_REFERENCIA` | `NO EVALUADO` | mostrar jerarquía/relaciones y vigencia; no recalcular mezcla histórica con jerarquía actual                                      |
|   48 | `OFERTA_COMERCIAL`            | `DATO_MAESTRO`    | `NO EVALUADO` | mostrar identidad/versión, producto/canal/contexto y vigencia; publicación no deriva del estado DQ                                |
|   49 | `CENTRO_DE_COSTO`             | `DATO_MAESTRO`    | `NO EVALUADO` | mostrar identidad/código, relaciones económicas y vigencia; no equiparar centro con sede o canal                                  |
|   50 | `MONEDA`                      | `DATO_REFERENCIA` | `NO EVALUADO` | mostrar código, definición y vigencia; conversión monetaria no cambia identidad de moneda                                         |
|   51 | `PERIODO_ECONOMICO`           | `DATO_REFERENCIA` | `NO EVALUADO` | mostrar límites, estado y vigencia del periodo; no reinterpretar un corte con periodo actual                                      |
|   52 | `PERIODO_CONTABLE`            | `DATO_REFERENCIA` | `NO EVALUADO` | mostrar límites, cierre/reapertura y vigencia; cambios de estado quedan históricos                                                |
|   53 | `PERIODO_FISCAL`              | `DATO_REFERENCIA` | `NO EVALUADO` | mostrar límites, autoridad y vigencia; no inferir equivalencia con periodo contable                                               |
|   54 | `CLASIFICACION_ECONOMICA`     | `DATO_REFERENCIA` | `NO EVALUADO` | mostrar código, jerarquía/relaciones y vigencia; no reclasificar historia silenciosamente                                         |
|   55 | `PERFIL_DE_MARCA`             | `DATO_MAESTRO`    | `BLOQUEADO`   | mostrar bloqueo por ausencia de fuente operativa AURA; no ofrecer certificación desde copias paralelas                            |
|   56 | `AUDIENCIA`                   | `DATO_MAESTRO`    | `BLOQUEADO`   | mostrar bloqueo por ausencia de fuente operativa AURA y requisitos de finalidad/consentimiento; no materializar listas sustitutas |
|   57 | `ACTIVO_DE_MARCA`             | `DATO_MAESTRO`    | `BLOQUEADO`   | mostrar bloqueo por ausencia de fuente operativa AURA y evidencia de derechos/vigencia; no usar carpetas como fuente sustituta    |
|   58 | `ENDPOINT`                    | `DATO_MAESTRO`    | `NO EVALUADO` | mostrar identidad técnica, estado, relaciones y vigencia sin exponer secretos o topología innecesaria                             |
|   59 | `SHARED_DEVICE`               | `DATO_MAESTRO`    | `NO EVALUADO` | mostrar identidad lógica, sede/estación/uso y vigencia; dispositivo no sustituye actor humano                                     |
|   60 | `NETWORK_RESOURCE`            | `DATO_MAESTRO`    | `NO EVALUADO` | mostrar identidad, tipo, relaciones y vigencia con minimización técnica; IP/MAC/SSID no prueban identidad                         |
|   61 | `APPLICATION`                 | `DATO_MAESTRO`    | `NO EVALUADO` | mostrar identidad canónica, código y vigencia; ambiente/repositorio no sustituyen identidad empresarial                           |
|   62 | `TECH_SERVICE`                | `DATO_REFERENCIA` | `NO EVALUADO` | mostrar identidad TI-SERVICE, relaciones y vigencia; no inventar aliases ni servicios para cerrar faltantes                       |

**Reconciliación:** 62 objetos esperados; 62 materializados; 62 identidades únicas; 0 faltantes; 0 duplicados; 43 `DATO_MAESTRO`; 19 `DATO_REFERENCIA`; 59 `NO EVALUADO`; 3 `BLOQUEADO`.

Los tres objetos bloqueados son exactamente `PERFIL_DE_MARCA`, `AUDIENCIA` y `ACTIVO_DE_MARCA`. El centro no crea una fuente AURA alternativa ni un estado intermedio para eludir ese bloqueo.

---

#### 20. Cobertura de las cuatro fuentes observadas de asistencia

|    # | Fuente                       | Autoridad lógica              | DQ heredado   | Decisión de experiencia                                                                                                                                              |
| ---: | ---------------------------- | ----------------------------- | ------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|    1 | `scheduled_shifts`           | programación laboral de VISO  | `NO EVALUADO` | mostrar identidad de turno, trabajador/sede, intervalo, estado/clasificación, cobertura del periodo y vigencia de publicación; no certificar por existencia de filas |
|    2 | `attendance_sessions`        | hechos de asistencia de ANIMA | `NO EVALUADO` | mostrar identidad/correlación, trabajador/sede, check-in/check-out, estado, duplicados y corte; distinguir sesión abierta de dato faltante                           |
|    3 | `attendance_breaks`          | hechos de asistencia de ANIMA | `NO EVALUADO` | mostrar inicio/fin, relación temporal con sesión, superposición tratada y corte aplicable; no fabricar descanso cuando falta evidencia                               |
|    4 | `attendance_geofence_events` | hechos de asistencia de ANIMA | `NO EVALUADO` | mostrar tipo de evento, ocurrencia, correlación con sesión/turno y valores requeridos; preservar ocurrencia original                                                 |

**Reconciliación:** 4 fuentes esperadas; 4 materializadas; 4 únicas; 0 faltantes; 0 duplicadas; 4 `NO EVALUADO`.

La proyección `attendance-report` puede figurar como consumidor técnico observado cuando el actor esté autorizado a conocer ese dato, pero su ejecución no eleva el estado de ninguna fuente.

---

#### 21. Cobertura de las catorce métricas de asistencia

|    # | `metric_key`        | Entradas mínimas                                                          | DQ heredado   | Decisión de experiencia                                                                                                                                |
| ---: | ------------------- | ------------------------------------------------------------------------- | ------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
|    1 | `scheduledShifts`   | `scheduled_shifts`                                                        | `NO EVALUADO` | mostrar identidad de turno, trabajador/sede, intervalo/clasificación y cobertura como gates; no certificar sin evidencia                               |
|    2 | `attendedShifts`    | `scheduled_shifts` + `attendance_sessions`                                | `NO EVALUADO` | mostrar correspondencia turno-sesión, check-in y duplicados como gates; no confundir asistencia con puntualidad o cierre                               |
|    3 | `restDayCount`      | `scheduled_shifts`                                                        | `NO EVALUADO` | mostrar clasificación de descanso y separación de población computable como gate                                                                       |
|    4 | `lateCount`         | `scheduled_shifts` + `attendance_sessions`                                | `NO EVALUADO` | mostrar inicio, check-in, gracia/versión y zona horaria como gates reproducibles                                                                       |
|    5 | `noShowCount`       | `scheduled_shifts` + `attendance_sessions`                                | `NO EVALUADO` | mostrar fin programado ocurrido al corte y ausencia de sesión válida; turnos futuros no son ausencia cerrada                                           |
|    6 | `openCount`         | `scheduled_shifts` + `attendance_sessions`                                | `NO EVALUADO` | mostrar sesión abierta AS OF corte y referencias válidas; no equiparar con falta de cierre                                                             |
|    7 | `missingCloseCount` | `scheduled_shifts` + `attendance_sessions`                                | `BLOQUEADO`   | mostrar divergencia: el resumen observado no conserva completamente la condición de fin programado vencido; no ofrecer certificación mientras persista |
|    8 | `autoCloseCount`    | `attendance_sessions`                                                     | `NO EVALUADO` | mostrar evidencia de autocierre y sesión válida; no confundir autocierre con cierre normal                                                             |
|    9 | `departureCount`    | `scheduled_shifts` + `attendance_sessions` + `attendance_geofence_events` | `NO EVALUADO` | mostrar correlación del evento con sesión/turno, identidad, tiempo y contexto como gates                                                               |
|   10 | `scheduledMinutes`  | `scheduled_shifts`                                                        | `NO EVALUADO` | mostrar intervalo programado y descanso programado interpretables; resultado debe permanecer no negativo                                               |
|   11 | `netMinutes`        | `attendance_sessions` + `attendance_breaks`                               | `NO EVALUADO` | mostrar intervalo de sesión, descansos superpuestos válidos, no negatividad y ausencia de doble conteo                                                 |
|   12 | `incidentCount`     | `scheduled_shifts` + `attendance_sessions` + `attendance_geofence_events` | `NO EVALUADO` | mostrar máximo una incidencia agregada por turno elegible para las señales canónicas                                                                   |
|   13 | `attendanceRate`    | `scheduledShifts` + `attendedShifts`                                      | `BLOQUEADO`   | mostrar divergencia: implementación observada devuelve cero sin denominador; la definición exige ausencia de valor numérico; no ofrecer certificación  |
|   14 | `punctualityRate`   | `attendedShifts` + `lateCount`                                            | `BLOQUEADO`   | mostrar divergencia: implementación observada devuelve cero sin denominador; la definición exige ausencia de valor numérico; no ofrecer certificación  |

**Reconciliación:** 14 métricas esperadas; 14 materializadas; 14 claves únicas; 0 faltantes; 0 duplicadas; 11 `NO EVALUADO`; 3 `BLOQUEADO`.

Las tres métricas bloqueadas permanecen bloqueadas hasta que sus propietarios técnicos/documentales materialicen las condiciones de salida ya definidas y una evaluación posterior produzca evidencia. Esta tarea no cambia código, función, fórmula ni datos.

---

#### 22. Historia, correcciones y recertificación

El centro conserva una cronología documental que diferencia:

- evaluación original;
- estado DQ emitido;
- evidencia usada;
- incidencia detectada;
- corrección en fuente o contrato propietario;
- reproceso/backfill/reconstrucción cuando aplique;
- conciliación posterior;
- nueva evaluación;
- recertificación vinculada;
- restatement o nueva publicación cuando corresponda.

Reglas:

1. una nueva evaluación no elimina la anterior;
2. una recertificación no reescribe el estado histórico de otra coordenada;
3. una corrección no cambia silenciosamente un snapshot o reporte publicado;
4. cuando se compare original y restatement, ambos conservan versiones, cortes y autorización vigente;
5. el centro no usa el estado actual de un maestro para explicar automáticamente un resultado histórico;
6. la estabilidad histórica es una dimensión DQ propia y no una nota opcional.

---

#### 23. Privacidad, autorización y protección del detalle

La experiencia aplica estas reglas:

- la lista de recursos se construye desde el conjunto autorizado antes de contar, ordenar o filtrar;
- la calidad de un recurso no concede acceso a sus filas, sujetos, documentos o evidencias;
- la identidad de propietario, steward o certificador se minimiza cuando no sea necesaria para la finalidad;
- evidencia sensible puede mostrarse como referencia segura sin exponer contenido completo;
- cada expansión hacia detalle reevalúa actor, recurso, territorio, finalidad, campos y población;
- poblaciones pequeñas, laboral, financiera, de cliente, técnica o de seguridad conservan las protecciones vigentes;
- los conteos de incidencias no se usan como canal para inferir recursos ocultos;
- un actor autorizado a `CERTIFY` no recibe automáticamente `PUBLISH`, `EXPORT`, `ADMINISTER` ni acceso al detalle fuente;
- un steward no recibe `CERTIFY` por ser responsable de mantenimiento;
- un custodio técnico no puede certificar usando autoridad técnica o `service_role` como sustituto de actor empresarial.

---

#### 24. Navegación hacia otras experiencias y propietarios exactos

| Necesidad detectada en el centro                                            | Propietario documental         | Regla de handoff                                                                |
| --------------------------------------------------------------------------- | ------------------------------ | ------------------------------------------------------------------------------- |
| entender definición, fuente, dueño, linaje o versión de un objeto/métrica   | `DATA-UX-002`                  | conservar recurso, versión, periodo y corte; calidad no redefine semántica      |
| volver al análisis por dominio manteniendo limitación DQ visible            | `DATA-UX-003`                  | conservar filtros materiales y coordenada; el tablero no eleva estado           |
| investigar variación, anomalía, causa o hipótesis                           | `DATA-UX-005`                  | separar incidencia DQ de diagnóstico causal; esta tarea no atribuye causas      |
| revisar objetivos, metas, drivers o guardrails                              | `DATA-UX-006`                  | el estado DQ condiciona el uso de métricas pero no cambia objetivos por sí solo |
| reportes, exportaciones, suscripciones y snapshots versionados              | `DATA-UX-007`                  | publicación/distribución consume el estado real y autorización separada         |
| validar comprensión, tiempos y decisiones con usuarios reales               | `DATA-UX-008`                  | probar la experiencia materializada antes de readiness                          |
| instrumentar eventos, lecturas y controles físicos                          | `DATA-INT-001`                 | antes de automatizar controles productivos                                      |
| servir/persistir estados DQ en capa semántica, consultas, caché o snapshots | `DATA-INT-002`                 | antes de materialización técnica del centro                                     |
| resolver crosswalks e identidad externa                                     | `DATA-INT-003`                 | antes de certificar integridad referencial externa                              |
| correcciones históricas y restatements                                      | `DATA-DOM-017`                 | antes de reexpresar una publicación previa                                      |
| publicación oficial de artefactos                                           | `DATA-DOM-008` y `DATA-UX-007` | `CERTIFY` y `PUBLISH` permanecen decisiones separadas                           |

No queda un pendiente sustantivo detectado por esta tarea sin propietario documental y condición de salida.

---

#### 25. Accesibilidad y lenguaje

El centro es una superficie administrativa/analítica densa, pero debe conservar:

- estados expresados por texto y semántica, no únicamente color;
- foco y navegación por teclado;
- encabezados y relaciones programáticamente determinables;
- contraste y reflow conforme a la línea base vigente;
- mensajes humanos que expliquen qué uso está limitado, por qué, qué evidencia existe y quién puede resolver;
- diferenciación explícita entre ausencia de dato, ausencia de permiso y estado `NO EVALUADO`;
- tablas extensas bajo divulgación progresiva, filtros y encabezados persistentes sin ocultar contexto;
- acciones excepcionales y autoritativas separadas de la consulta ordinaria.

El centro no traduce `BLOQUEADO` como “error” genérico ni `NO EVALUADO` como “sin problemas”.

---

#### 26. Cobertura de requisitos de prueba vigente

La conducta materializada por esta tarea ya se encuentra protegida por requisitos canónicos vigentes:

- `TREQ-DATA-001` protege identidad, duplicidad, calidad e historia de maestros y referencias;
- `TREQ-DATA-002` protege que cada métrica conserve fuente, frescura, calidad y estado de certificación dentro de una definición versionada;
- `TREQ-DATA-003` protege directamente origen, tiempos, cobertura, duplicados, integridad referencial, datos tardíos, backfills, correcciones, cuarentena, conciliación, linaje, estados de ausencia y la prohibición de certificación con fuentes vencidas, incompletas, degradadas o sin conciliar, y asigna expresamente responsabilidad a `DATA-UX-004`;
- `TREQ-DATA-004` protege la exposición de corte, frescura, cobertura y calidad en las superficies analíticas y mantiene el drill-down autorizado;
- los requisitos UX vigentes protegen densidad administrativa, contexto, privacidad, trazabilidad y no exposición indirecta.

La tarea especializa esas reglas como experiencia de revisión y decisión DQ. No introduce una conducta verificable independiente que carezca de cobertura ni modifica prioridad, modalidad, relaciones o destino de implementación de los requisitos existentes.

---

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** el centro materializa en experiencia obligaciones de calidad, frescura, cobertura, conciliación, evidencia, estados y segregación que ya tienen protección canónica vigente y una responsabilidad documental explícita. No introduce un nuevo comportamiento ejecutable, un nuevo estado, una nueva fórmula, un nuevo permiso, un umbral universal ni una implementación física que requieran una fila adicional o una modificación del registro.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 27. Criterios de aceptación

1. el centro está diseñado como experiencia administrativa/analítica y no como fuente de verdad;
2. la coordenada de evaluación incluye recurso, uso, periodo, versión, corte, dependencias y evidencia cuando apliquen;
3. existen exactamente diez dimensiones DQ materializadas, con 0 faltantes y 0 duplicadas;
4. no existe un puntaje universal que sustituya las diez dimensiones;
5. se preservan exactamente cinco estados de certificación;
6. `NO_APLICA` permanece fuera de esos cinco estados;
7. `NO EVALUADO` no se presenta como saludable ni certificado;
8. `EN OBSERVACIÓN` no equivale a `DEGRADADO` ni a `CERTIFICADO`;
9. `DEGRADADO` conserva limitación y uso condicionado visibles;
10. `BLOQUEADO` no se sustituye por cero, dato provisional rotulado como oficial ni semáforo positivo;
11. `CERTIFICADO` conserva uso, periodo, versión, corte y evidencia;
12. no se inventa un SLA universal de frescura;
13. evento, API, vista, exportación controlada, maestro/referencia y snapshot conservan referencias de frescura distintas;
14. cobertura distingue atributos, relaciones y población;
15. no se calcula porcentaje cuando el denominador no es demostrable;
16. cero, nulo, no aplica, desconocido, no recibido y dato pendiente permanecen distinguibles;
17. la conciliación conserva componentes y diferencias materiales sin forzar igualdad;
18. una incidencia no desaparece por dejar de aparecer en un tablero;
19. la corrección se realiza en la fuente, relación o contrato propietario y no en el agregado del centro;
20. recertificación exige nueva evaluación y evidencia;
21. una decisión previa no se reescribe silenciosamente;
22. se comprueban las doce condiciones antes de una decisión de certificación;
23. la interfaz no cambia automáticamente el estado al completar controles;
24. `CERTIFY` exige autorización exacta y segregación aplicable;
25. propiedad, stewardship, custodia técnica y administración no conceden certificación por inferencia;
26. certificación no concede publicación ni exportación;
27. los cuatro mecanismos de entrada están materializados 4/4 y permanecen `NO EVALUADO` hasta evidencia contextual;
28. las quince familias heredadas están materializadas 15/15, con 13 `NO EVALUADO`, 1 `BLOQUEADO` y 1 `NO_APLICA`;
29. los sesenta y dos objetos están materializados 62/62, con 43 maestros y 19 referencias;
30. los tres objetos AURA permanecen exactamente `PERFIL_DE_MARCA`, `AUDIENCIA` y `ACTIVO_DE_MARCA`, todos `BLOQUEADO`;
31. los otros 59 objetos permanecen `NO EVALUADO` hasta evidencia;
32. las cuatro fuentes observadas de asistencia están materializadas 4/4 y `NO EVALUADO`;
33. las catorce métricas de asistencia están materializadas 14/14;
34. se preservan exactamente 11 métricas `NO EVALUADO` y 3 `BLOQUEADO`;
35. `missingCloseCount`, `attendanceRate` y `punctualityRate` son exactamente las tres bloqueadas;
36. `attendance-report` no se presenta como fuente de verdad ni como evidencia suficiente de certificación;
37. filtros, búsqueda y conteos no enumeran recursos no autorizados;
38. cada expansión hacia evidencia o detalle reevalúa autorización;
39. datos sensibles y evidencias se minimizan conforme al contrato vigente;
40. el centro no crea permisos, roles, grants o excepciones;
41. el centro no define causas, hipótesis o recomendaciones, que pertenecen a `DATA-UX-005`;
42. el centro no modifica objetivos, metas o guardrails, que pertenecen a `DATA-UX-006`;
43. el centro no publica ni distribuye artefactos, responsabilidad de `DATA-UX-007` y el contrato D008;
44. la instrumentación física de controles queda en `DATA-INT-001` y la materialización semántica en `DATA-INT-002`;
45. crosswalks físicos quedan en `DATA-INT-003`;
46. restatements permanecen en `DATA-DOM-017`;
47. no se modifica código, SQL, Supabase, datos, migraciones, backfills, dashboards, reportes ni snapshots oficiales;
48. no se crea ni modifica ningún requisito de prueba;
49. no queda un pendiente narrativo sin propietario documental exacto;
50. la continuidad queda exclusivamente en `DATA-UX-005` como siguiente tarea reservada.

---

#### 28. Continuidad

ÚLTIMA TAREA APROBADA
`DATA-UX-003 — Diseñar tableros por dominio con filtros, comparación, drill-down y trazabilidad`

TAREA ACTUAL APROBADA
`DATA-UX-004 — Diseñar centro de calidad, frescura, conciliaciones y certificación`

SIGUIENTE TAREA RESERVADA
`DATA-UX-005 — Diseñar espacio de investigación de variaciones, anomalías y causas`


### ✅ DATA-UX-005 — Diseñar espacio de investigación de variaciones, anomalías y causas

**Estado:** APROBADA
**Tarea anterior:** `DATA-UX-004 — Diseñar centro de calidad, frescura, conciliaciones y certificación` — APROBADA
**Tarea siguiente:** `DATA-UX-006 — Diseñar objetivos, metas, drivers, guardrails y acciones de mejora` — RESERVADA
**Tipo de tarea:** documental; diseño normativo y materializado de la experiencia de investigación analítica para variaciones, anomalías, hipótesis, evidencia, causas, impacto, oportunidades y confianza diagnóstica sin automatizar decisiones empresariales ni alterar fuentes
**Bloque:** AB — Analítica, indicadores y datos maestros
**Fase:** exclusivamente documental
**Implementación técnica:** no autorizada
**Código, componentes, DDL, DML, migraciones, RLS, RPC, grants, cambios de permisos, datos, backfills, modelos productivos, automatizaciones, experimentos, despliegues o cambios en Supabase:** no autorizados
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Diseñar la experiencia mediante la cual un actor autorizado puede convertir una señal o variación gobernada en una investigación analítica trazable, localizar dónde ocurre, comprobar si es una anomalía empresarial o un problema de datos, formular hipótesis, reunir evidencia favorable y contradictoria, evaluar explicaciones alternativas, asignar el nivel de confianza permitido y documentar una oportunidad sin presentar correlaciones como causas ni ejecutar recomendaciones.

La experiencia deberá permitir responder, para cada investigación:

1. ¿qué señal, métrica, hecho o familia origina la investigación?;
2. ¿respecto de qué referencia compatible se observó el cambio?;
3. ¿qué versión, población, periodo, corte, dimensiones y cobertura sustentan la señal?;
4. ¿la señal es reproducible y las dependencias DQ permiten interpretarla?;
5. ¿se trata de comportamiento empresarial, calidad de datos, reconciliación, cambio semántico o cambio de cobertura?;
6. ¿en qué segmentos, periodos o dimensiones se concentra la variación?;
7. ¿qué factores candidatos se investigaron y cuál es el mecanismo propuesto?;
8. ¿qué explicaciones alternativas siguen abiertas o fueron descartadas con evidencia?;
9. ¿qué evidencia apoya, contradice o todavía falta para cada afirmación?;
10. ¿la temporalidad permite sostener asociación o lenguaje causal?;
11. ¿qué nivel de confianza diagnóstica corresponde y qué lo limita?;
12. ¿qué impacto observado o potencial puede sostenerse sin atribución excesiva?;
13. ¿qué oportunidad puede documentarse sin convertirla todavía en meta o acción?;
14. ¿quién conserva propiedad sobre la interpretación empresarial y sobre cada fuente?;
15. ¿qué navegación posterior corresponde cuando la salida es calidad, objetivo, acción, experimento, publicación o integración?

Principio rector:

```text
INVESTIGACIÓN ANALÍTICA
=
SEÑAL REPRODUCIBLE
+ CONTEXTO Y REFERENCIA COMPATIBLES
+ CALIDAD Y COBERTURA VISIBLES
+ LOCALIZACIÓN DE LA VARIACIÓN
+ HIPÓTESIS Y ALTERNATIVAS
+ EVIDENCIA FAVORABLE, CONTRADICTORIA Y FALTANTE
+ TEMPORALIDAD Y MECANISMO
+ CONFIANZA EXPLICABLE
+ IMPACTO TRAZABLE
+ OPORTUNIDAD DOCUMENTADA

NO

VARIACIÓN = ANOMALÍA
CORRELACIÓN = CAUSA
HIPÓTESIS = CONCLUSIÓN
MODELO = EVIDENCIA CAUSAL
IA = AUTORIDAD EMPRESARIAL
OPORTUNIDAD = META
RECOMENDACIÓN = ACCIÓN
```

---

#### 2. Resultado sustantivo

Queda materializado el diseño del espacio de investigación con los siguientes resultados:

- una experiencia única de investigación basada en afirmaciones diagnósticas trazables y no en narrativas libres sin evidencia;
- una secuencia de trece momentos de investigación desde confirmación de señal hasta transferencia a objetivo o intervención;
- clasificación obligatoria previa a causalidad entre comportamiento de negocio, calidad de datos, reconciliación, cambio semántico y cambio de cobertura;
- ocho patrones diagnósticos descriptivos materializados sin convertirlos en causas;
- seis niveles canónicos de confianza diagnóstica preservados exactamente desde `NO_EVALUABLE` hasta `EFECTO_COMPROBADO`;
- ocho dimensiones mínimas de evidencia visibles por afirmación;
- topes de confianza que impiden elevar conclusiones cuando faltan calidad, comparabilidad, precedencia temporal, alternativas o estrategia de identificación;
- evidencia favorable, contradictoria y faltante separadas en la experiencia;
- trazabilidad entre señal, referencia, población, evidencia, factor o hipótesis, alternativas, impacto, confianza, propietario y conclusión;
- separación explícita entre investigación D014 y calidad/certificación D007;
- separación explícita entre oportunidad D014 y objetivos/metas/guardrails D015;
- separación explícita entre oportunidad y acciones/experimentos D016;
- cinco recorridos transversales de investigación para comercial, inventario/abastecimiento, producción/calidad, servicio/cliente y economía/finanzas;
- cobertura explícita de las 55 familias analíticas heredadas de D009 a D013, preservando la distribución `11 + 12 + 10 + 12 + 10`;
- cobertura explícita de las 14 métricas de asistencia ya registradas, preservando 11 `NO EVALUADO` y 3 `BLOQUEADO`;
- cobertura explícita de las seis familias de artefacto D008 como posibles orígenes, referencias o salidas gobernadas sin convertirlas en fuentes de verdad;
- protección de poblaciones pequeñas, dimensiones sensibles, evidencia individual, proveedores, trabajadores, clientes, información financiera y detalle técnico;
- auditoría conceptual de consultas, modelos y recomendaciones sin convertir auditoría en autorización o causalidad;
- cero umbrales estadísticos universales, cero porcentajes universales de confianza, cero fórmulas nuevas, cero `metric_key` nuevas, cero permisos nuevos y cero cambios físicos;
- cero cambios de requisitos de prueba.

Reconciliación documental:

| Inventario consumido                  | Esperado | Materializado | Faltantes | Duplicados |
| ------------------------------------- | -------: | ------------: | --------: | ---------: |
| Patrones diagnósticos                 |        8 |             8 |         0 |          0 |
| Niveles de confianza                  |        6 |             6 |         0 |          0 |
| Dimensiones mínimas de evidencia      |        8 |             8 |         0 |          0 |
| Familias analíticas                   |       55 |            55 |         0 |          0 |
| Métricas de asistencia                |       14 |            14 |         0 |          0 |
| Familias de artefacto D008            |        6 |             6 |         0 |          0 |
| Nuevas métricas o fórmulas            |        0 |             0 |         0 |          0 |
| Nuevos estados DQ o de confianza      |        0 |             0 |         0 |          0 |
| Cambios físicos                       |        0 |             0 |         0 |          0 |
| Requisitos TREQ creados o modificados |        0 |             0 |         0 |          0 |

---

#### 3. Entradas canónicas consumidas

Esta tarea consume sin redefinir:

- `DATA-DOM-014` como contrato canónico de diagnóstico transversal, anomalías, causas, oportunidades y confianza;
- `DATA-UX-001` para entradas desde atención ejecutiva sin convertir la priorización visual en causalidad;
- `DATA-UX-002` para definición, propietario, fuente, versión, calidad, linaje e historia de métricas y objetos;
- `DATA-UX-003` para señales, comparaciones, filtros, segmentación, corte y drill-down desde tableros por dominio;
- `DATA-UX-004` para calidad, frescura, cobertura, conciliaciones, incidencias y certificación antes de interpretar una anomalía como comportamiento empresarial;
- el contrato de autorización DATA para construir la población autorizada antes de segmentar, comparar o profundizar;
- el contrato de protección DATA para poblaciones pequeñas, dimensiones sensibles, precisión, comparación, exportación y drill-down;
- el contrato de segregación DATA que mantiene separadas `DEFINE`, `CERTIFY`, `PUBLISH`, `SET_TARGET`, `ANNOTATE`, `EXPORT` y `ADMINISTER`;
- el contrato de auditoría DATA para consulta, descarga, suscripción, alerta, modelo y recomendación;
- `DATA-DOM-015` únicamente como frontera posterior para objetivos, líneas base, metas, drivers, guardrails y plan de medición;
- `DATA-DOM-016` únicamente como frontera posterior para acciones, experimentos, responsables, seguimiento y comprobación;
- `DATA-DOM-017` únicamente como propietario de correcciones históricas, restatements y reproducibilidad de conclusiones publicadas;
- `DATA-INT-002` como propietario futuro de la materialización física de capa semántica, consultas, modelos, snapshots, caché y rendimiento;
- `DATA-INT-004` como propietario futuro de la integración controlada con BI, hojas de cálculo, modelos analíticos e inteligencia artificial;
- la línea base transversal vigente de privacidad, trazabilidad, accesibilidad, lenguaje humano, divulgación progresiva y densidad administrativa.

Ninguna de estas entradas transfiere propiedad de datos o autoridad empresarial al espacio de investigación.

---

#### 4. Fronteras conceptuales obligatorias

```text
MÉTRICA ≠ SEÑAL ≠ VARIACIÓN ≠ ANOMALÍA
```

```text
ANOMALÍA DE NEGOCIO ≠ INCIDENCIA DE CALIDAD
```

```text
DIFERENCIA DE RECONCILIACIÓN ≠ CAÍDA DE DESEMPEÑO
```

```text
ALERTA ≠ DIAGNÓSTICO ≠ RECOMENDACIÓN ≠ ACCIÓN
```

```text
CORRELACIÓN ≠ CAUSALIDAD ≠ HIPÓTESIS RESPALDADA ≠ EFECTO COMPROBADO
```

```text
FACTOR CANDIDATO ≠ CAUSA PRINCIPAL ≠ CAUSA RAÍZ
```

```text
IMPACTO OBSERVADO ≠ IMPACTO POTENCIAL ≠ BENEFICIO REALIZADO
```

```text
OPORTUNIDAD ≠ OBJETIVO ≠ META ≠ PLAN ≠ EXPERIMENTO
```

```text
CONFIANZA DIAGNÓSTICA ≠ CERTIFICACIÓN DE DATOS ≠ PROBABILIDAD ESTADÍSTICA
```

```text
EXPLICACIÓN DE MODELO ≠ EVIDENCIA FUENTE
```

```text
ESCENARIO SIMULADO ≠ CONTRAFACTUAL OBSERVADO ≠ RESULTADO REAL
```

```text
INCUMPLIMIENTO DE META ≠ ANOMALÍA ESTADÍSTICA
```

La experiencia nunca oculta estas fronteras mediante un único indicador, score, semáforo o narrativa generada.

---

#### 5. Arquitectura de información del espacio de investigación

La experiencia se organiza en siete zonas lógicas coordinadas:

1. **Contexto y señal**: objeto investigado, métrica/familia, versión, periodo, corte, población, referencia, magnitud y método de detección.
2. **Puerta de calidad y clasificación**: DQ de dependencias, cobertura, conciliación y clasificación de la señal antes de causalidad.
3. **Localización de la variación**: tendencia, segmentación y descomposición únicamente sobre dimensiones autorizadas y comparables.
4. **Hipótesis y alternativas**: factores candidatos, mecanismo propuesto, temporalidad, condiciones de aplicación y explicaciones competidoras.
5. **Evidencia y confianza**: evidencia favorable, contradictoria y faltante, independencia de evidencias, ocho dimensiones y nivel de confianza permitido.
6. **Impacto y oportunidad**: impacto observado/potencial, residuo no atribuido, restricciones, riesgos y oportunidad documentada.
7. **Historia y continuidad**: cambios de hipótesis/confianza, propietario de interpretación, correlación de consultas/modelos y transferencias posteriores.

La primera vista prioriza la señal, la clasificación, el estado DQ, el nivel de confianza y las preguntas abiertas. La evidencia extensa, los segmentos detallados, los modelos y la historia se presentan mediante divulgación progresiva.

---

#### 6. Coordenada visible de una investigación

Toda investigación deberá poder reconstruir, cuando aplique:

| Componente            | Decisión UX                                                                                                |
| --------------------- | ---------------------------------------------------------------------------------------------------------- |
| objeto investigado    | métrica, hecho, proceso o familia analítica exacta; no usar la pantalla como identidad                     |
| versión semántica     | versión de métrica, fórmula, población e inclusiones/exclusiones                                           |
| periodo y corte       | ventana observada y fecha/hora de corte                                                                    |
| granularidad          | unidad de observación y agregación                                                                         |
| dimensiones           | únicamente dimensiones admitidas, compatibles y autorizadas                                                |
| referencia            | comparador explícito: periodo, plan, presupuesto, peer, distribución o modelo gobernado                    |
| fuentes               | fuentes propietarias y dependencias materiales que el actor esté autorizado a conocer                      |
| calidad               | estado DQ de cada dependencia crítica                                                                      |
| cobertura             | población incluida, exclusiones y parcialidad conocida                                                     |
| método de señal       | manual, regla, estadística o modelo, con versión cuando aplique                                            |
| evidencia             | referencias favorables, contradictorias y faltantes                                                        |
| factores candidatos   | explicaciones investigadas y mecanismo propuesto                                                           |
| alternativas          | explicaciones competidoras abiertas o descartadas con evidencia                                            |
| impacto               | magnitud observada o potencial, unidad/moneda y método de atribución cuando exista                         |
| confianza             | uno de los seis niveles D014 con justificación y topes                                                     |
| propietario           | función responsable de la interpretación empresarial                                                       |
| estado de publicación | exploratorio, interno controlado u oficial cuando exista una decisión de publicación separada y autorizada |

Cambiar versión, población, periodo, corte, referencia, granularidad o dimensión material produce otra coordenada de investigación y exige reevaluar comparabilidad, evidencia y confianza.

---

#### 7. Secuencia de investigación materializada

El espacio materializa la siguiente secuencia lógica de trece momentos:

1. **Confirmar la señal**: reproducir valor, versión, referencia, corte y población.
2. **Verificar calidad**: consultar estado DQ, cobertura, frescura, integridad y conciliación de dependencias críticas.
3. **Clasificar la señal**: distinguir negocio, calidad, reconciliación, cambio semántico o cambio de cobertura.
4. **Localizar la variación**: descomponer por dimensiones compatibles y autorizadas sin alterar la definición.
5. **Establecer temporalidad**: ordenar hechos y factores antes, durante y después del cambio.
6. **Enumerar factores candidatos**: registrar condiciones internas, externas y restricciones conocidas.
7. **Enumerar alternativas**: registrar explicaciones plausibles que compiten con la hipótesis principal.
8. **Reunir evidencia**: separar favorable, contradictoria y faltante.
9. **Comprobar independencia**: identificar evidencias derivadas del mismo hecho para evitar falsa triangulación.
10. **Asignar confianza**: aplicar los seis niveles y los topes obligatorios.
11. **Estimar impacto**: cuantificar solo con métricas, unidades y bases gobernadas.
12. **Formular oportunidad**: describir espacio de mejora, protección o captura de valor sin ejecutar solución.
13. **Transferir**: a calidad cuando la señal no sea interpretable, a objetivos cuando exista oportunidad medible o a intervención cuando corresponda un candidato de acción/experimento.

La salida `SIN_CAUSA_RESUELTA` es válida. La experiencia no obliga a seleccionar una causa dominante para cerrar una investigación.

---

#### 8. Clasificación previa a causalidad

Antes de abrir hipótesis empresariales, la experiencia exige clasificar la señal:

| Clase                     | Pregunta UX                                                                            | Consecuencia                                                                                            |
| ------------------------- | -------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- |
| comportamiento de negocio | ¿el hecho cambió realmente en la operación?                                            | continuar investigación empresarial                                                                     |
| calidad de datos          | ¿la señal puede provenir de fuente vencida, faltante, duplicada, inválida o degradada? | conservar la investigación, pero priorizar resolución en `DATA-UX-004` antes de elevar confianza causal |
| reconciliación            | ¿representaciones del mismo proceso no concilian?                                      | mostrar diferencia y resolver fuente/contrato antes de interpretar desempeño                            |
| cambio semántico          | ¿cambió fórmula, población, dimensión, unidad o versión?                               | bloquear continuidad comparativa hasta reconciliar versiones                                            |
| cambio de cobertura       | ¿entró o salió una fuente, sede, canal o población?                                    | explicar cobertura antes de atribuir cambio a la operación                                              |

Una señal aparente producida por una ruptura de datos no se presenta como problema empresarial.

---

#### 9. Ocho patrones diagnósticos

|    # | Patrón                                     | Presentación UX                                                                 | Prohibición                                                                |
| ---: | ------------------------------------------ | ------------------------------------------------------------------------------- | -------------------------------------------------------------------------- |
|    1 | desviación de nivel                        | mostrar observado, referencia, diferencia absoluta y relativa cuando sea válida | no llamar causa a la diferencia                                            |
|    2 | cambio de tendencia                        | mostrar dirección/pendiente y ventana comparable                                | no extrapolar causalidad desde la forma de la serie                        |
|    3 | cambio de volatilidad                      | mostrar dispersión/variabilidad y método                                        | una variación estadística no se rotula error por sí sola                   |
|    4 | cambio de distribución o mezcla            | mostrar composición antes/después y poblaciones compatibles                     | el cambio de mezcla no se presenta como causa automáticamente              |
|    5 | ruptura temporal o estacional              | mostrar patrón esperado, calendario y ruptura                                   | no inventar estacionalidad sin cobertura suficiente                        |
|    6 | divergencia entre segmentos                | mostrar segmentos comparables y protección de grupos pequeños                   | diferencia entre grupos no autoriza explicación causal                     |
|    7 | ruptura de relación o reconciliación       | mostrar relación esperada y residuo/diferencia                                  | no ocultar el residuo para conservar una narrativa de desempeño            |
|    8 | recurrencia o concentración de excepciones | mostrar concentración por dimensión y repetición                                | concentración no identifica causa individual ni responsable por inferencia |

**Reconciliación:** 8 patrones esperados; 8 materializados; 8 únicos; 0 faltantes; 0 duplicados.

El método de detección conserva versión, población, mínimo de observaciones aplicable, tratamiento de faltantes, estacionalidad, outliers y sensibilidad cuando corresponda. No existe un umbral estadístico universal creado por esta tarea.

---

#### 10. Hipótesis, factores candidatos y alternativas

Cada factor candidato visible deberá poder declarar:

- mecanismo empresarial propuesto;
- relación temporal con el resultado;
- población donde debería observarse el efecto;
- evidencia favorable;
- evidencia contradictoria;
- evidencia faltante;
- explicaciones alternativas materiales;
- condiciones bajo las cuales el mecanismo no aplicaría;
- nivel de confianza alcanzado;
- propietario funcional capaz de validar la interpretación.

Tipos de relación permitidos en la experiencia:

```text
coincidencia temporal
asociación descriptiva
factor contribuyente plausible
hipótesis respaldada
relación con evidencia causal
intervención con efecto comprobado
```

El tipo de relación siempre se muestra. La etiqueta genérica “causa” no sustituye el nivel de evidencia.

Una causa declarada en un expediente propietario puede incorporarse como evidencia de causa declarada, conservando fuente, actor, fecha, versión y alcance. No se generaliza automáticamente a otra sede, producto, canal, población, periodo o efecto.

---

#### 11. Temporalidad y explicaciones alternativas

Reglas de temporalidad:

1. un factor propuesto debe preceder al efecto cuando el mecanismo causal lo exige;
2. una variable registrada después del resultado no se presenta como causa por mera correlación;
3. un patrón simultáneo permite asociación salvo diseño adicional que identifique dirección;
4. cambios de precio, promoción, disponibilidad, capacidad, receta, proveedor, proceso o política usan la vigencia realmente aplicable al hecho;
5. una resolución temporal insuficiente queda como limitación explícita.

Alternativas materiales a revisar según el caso:

- cambio de cobertura o fuente;
- cambio de fórmula o definición;
- estacionalidad o calendario;
- precio o promoción;
- mezcla de producto, canal, sede o cliente;
- disponibilidad de inventario;
- capacidad productiva, comercial, de almacenamiento o logística;
- cambio de proveedor o lead time;
- calidad, rechazo o liberación;
- cambio de servicio o promesa;
- presupuesto, forecast o escenario usado como referencia;
- eventos extraordinarios externos documentados;
- datos tardíos, backfills o restatements;
- sesgo de selección, identidad o población;
- otra intervención simultánea.

Descartar una alternativa exige evidencia. La ausencia de una etiqueta no constituye descarte.

---

#### 12. Evidencia favorable, contradictoria y faltante

Cada afirmación conserva tres grupos separados:

```text
EVIDENCIA FAVORABLE
EVIDENCIA CONTRADICTORIA
EVIDENCIA FALTANTE O NO DISPONIBLE
```

Reglas:

- evidencia contradictoria no se oculta para elevar confianza;
- falta de evidencia no se registra como evidencia en contra;
- ausencia de una causa alternativa observada no demuestra que no exista;
- una evidencia posterior puede reducir la confianza de una afirmación anterior;
- varias métricas derivadas del mismo hecho no cuentan como fuentes independientes;
- la evidencia sensible puede mostrarse mediante referencia protegida sin exponer su contenido completo;
- una conclusión oficial modificada conserva historia y relación con la versión anterior conforme al gobierno de correcciones y restatements.

---

#### 13. Ocho dimensiones mínimas de evidencia

|    # | Dimensión                   | Pregunta visible                                                                              |
| ---: | --------------------------- | --------------------------------------------------------------------------------------------- |
|    1 | calidad de fuente           | ¿las dependencias críticas tienen estado DQ compatible con el uso?                            |
|    2 | cobertura                   | ¿la población observada representa el alcance de la afirmación?                               |
|    3 | comparabilidad              | ¿resultado y referencia comparten definición, unidad, granularidad, calendario y dimensiones? |
|    4 | precedencia temporal        | ¿el factor ocurre antes del efecto cuando el mecanismo lo exige?                              |
|    5 | mecanismo                   | ¿existe una explicación empresarial coherente y verificable del vínculo?                      |
|    6 | alternativas                | ¿se investigaron explicaciones materiales competidoras?                                       |
|    7 | estabilidad/replicación     | ¿la relación persiste en ventanas, segmentos o repeticiones compatibles cuando corresponde?   |
|    8 | intervención/identificación | ¿existe diseño que permita separar efecto de correlación cuando se usa lenguaje causal?       |

**Reconciliación:** 8 dimensiones esperadas; 8 materializadas; 8 únicas; 0 faltantes; 0 duplicadas.

No se promedian mecánicamente. Una condición crítica puede limitar todo el nivel de confianza.

---

#### 14. Seis niveles canónicos de confianza

| Nivel                  | Presentación UX                                                                                             | Lenguaje permitido                                                                |
| ---------------------- | ----------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- |
| `NO_EVALUABLE`         | falta base suficiente para interpretar la afirmación; mostrar qué dependencia, comparador o evidencia falta | “no evaluable”, “información insuficiente”, “causa no resuelta”                   |
| `SEÑAL_DESCRIPTIVA`    | cambio reproducible sin atribución a factor                                                                 | “se observó”, “aumentó/disminuyó”, “se concentra en”                              |
| `ASOCIACION`           | relación reproducible sin identificación causal                                                             | “está asociado con”, “coincide con”, “es compatible con”                          |
| `HIPOTESIS_RESPALDADA` | varias evidencias apoyan un mecanismo y se investigaron alternativas materiales                             | “la evidencia respalda la hipótesis de que”                                       |
| `EVIDENCIA_CAUSAL`     | existe estrategia de identificación con supuestos y sensibilidad explícitos                                 | “la evidencia apoya un efecto causal bajo estos supuestos y contexto”             |
| `EFECTO_COMPROBADO`    | intervención o experimento gobernado observó efecto bajo diseño previo                                      | “el efecto fue comprobado en la población, ventana y condiciones del experimento” |

**Reconciliación:** 6 niveles esperados; 6 materializados; 6 únicos; 0 faltantes; 0 duplicados.

`EFECTO_COMPROBADO` no autoriza generalización fuera de la población, ventana y condiciones demostradas.

---

#### 15. Topes obligatorios de confianza

1. una dependencia crítica `BLOQUEADO` fuerza `NO_EVALUABLE` para toda afirmación que dependa de ella;
2. una diferencia no reproducible fuerza `NO_EVALUABLE`;
3. sin referencia comparable, el máximo es `SEÑAL_DESCRIPTIVA`;
4. sin precedencia temporal demostrable, el máximo es `ASOCIACION` para afirmaciones causales;
5. sin investigación de alternativas materiales, el máximo es `ASOCIACION`;
6. evidencia redundante derivada del mismo hecho no eleva el nivel por multiplicidad;
7. un output de IA o de un modelo predictivo por sí solo no eleva por encima de `ASOCIACION`;
8. correlación, p-value, feature importance, SHAP, score o precisión predictiva no prueban causalidad por sí solos;
9. `EVIDENCIA_CAUSAL` exige fuentes aptas, estrategia de identificación y supuestos explícitos;
10. `EFECTO_COMPROBADO` solo consume evidencia de una intervención o experimento gobernado por su tarea propietaria;
11. una afirmación no puede tener mayor alcance territorial, temporal o poblacional que la evidencia;
12. un cambio de fórmula o definición dentro de la ventana debe reconciliarse antes de elevar confianza.

No se crea un porcentaje universal de confianza ni un score ponderado que pueda compensar una falla crítica.

---

#### 16. Localización y segmentación

La localización de una variación ocurre únicamente sobre el conjunto autorizado y con dimensiones admitidas por la versión de la métrica.

Reglas:

- segmentar no amplía población;
- un filtro solo reduce el conjunto autorizado;
- la sede seleccionada no sustituye territorio real;
- la dimensión trabajador, cliente o proveedor no habilita ranking individual por defecto;
- un grupo pequeño o sensible puede suprimirse aunque el total sea visible;
- una diferencia de subtotales no se usa para reconstruir un grupo oculto;
- la comparación entre segmentos conserva definición, periodo, corte, unidad, calendario, cobertura y DQ compatibles;
- la investigación puede mostrar un residuo “no explicado” en lugar de forzar atribución total;
- el drill-down a hechos, expedientes o evidencia reevalúa autorización en cada nivel.

---

#### 17. Impacto observado, impacto potencial y oportunidad

**Impacto observado** cuantifica una diferencia ya ocurrida y conserva:

- resultado afectado;
- población;
- periodo y corte;
- magnitud absoluta;
- magnitud relativa cuando exista denominador válido;
- unidad o moneda;
- método de atribución, si existe;
- incertidumbre o rango cuando el método lo produzca;
- parte no atribuible o residual;
- calidad y confianza aplicables.

**Impacto potencial** expresa lo que podría evitarse, recuperarse o capturarse y conserva referencia, supuesto/escenario, horizonte, población, mecanismo, límites, sensibilidad y confianza. Nunca se presenta como beneficio realizado.

Reglas de atribución:

- impacto comercial no se monetiza sin una base económica gobernada;
- margen, costo y rentabilidad conservan las definiciones económicas propietarias;
- merma física no se transforma automáticamente en pérdida financiera;
- reclamo o rating no se transforma automáticamente en pérdida de cliente;
- falta de inventario no se transforma automáticamente en venta perdida;
- correlación no autoriza atribuir el 100 % de una variación a un factor;
- el residuo no explicado permanece visible.

Una **oportunidad** describe un espacio de mejora, protección o captura de valor e incluye señal/diagnóstico origen, población, resultado afectado, impacto observado o potencial, mecanismo, confianza, restricciones, propietario, riesgos, información faltante y destino posterior. No prescribe todavía una acción.

---

#### 18. Cinco recorridos transversales de investigación

Estos recorridos orientan navegación; no son cadenas causales predefinidas.

| Recorrido                   | Secuencia orientativa de investigación                                                                                                                  | Límite principal                                                           |
| --------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------- |
| comercial y demanda         | ventas/pedidos/ticket/demanda → cobertura/mezcla → disponibilidad → capacidad → servicio → precio/promoción/margen                                      | separar asociación, restricción y causa                                    |
| inventario y abastecimiento | existencia/cobertura/faltante/vencimiento → demanda/consumo → remisiones/proveedores → plan/capacidad → costo/liquidez                                  | distinguir restricción, excepción y problema de datos                      |
| producción y calidad        | plan/capacidad/rendimiento/consumo/merma/calidad → insumos → receta/secuencia productiva/programa → liberación/ciclo → servicio/venta → costo/variación | hechos productivos no se convierten en explicación económica sin evidencia |
| servicio y cliente          | promesa/tiempos/completitud/reclamos/satisfacción → pedido/canal → inventario/producción → logística → compensación/recurrencia/reputación              | identidad, finalidad y detalle sensible se reautorizan                     |
| económica y financiera      | costo/variación/margen/gasto/liquidez/rentabilidad → ventas/compras/inventario/producción/servicio → asignaciones/reconciliaciones                      | diferencia económica no se convierte en causa operacional sin evidencia    |

---

#### 19. Matriz de cobertura — Comercial, 11/11

|    # | Familia canónica                             | Uso dentro de la investigación               | Límite UX005                                                                      |
| ---: | -------------------------------------------- | -------------------------------------------- | --------------------------------------------------------------------------------- |
|    1 | ventas netas y brutas                        | señal, resultado e impacto comercial         | venta o ingreso no prueban margen ni causa                                        |
|    2 | pedidos y conversión                         | señal de volumen/funnel y segmentación       | conversión exige denominador gobernado antes de cuantificar                       |
|    3 | ticket y unidades                            | señal de intensidad y mezcla                 | solo se comparan sobre población compatible                                       |
|    4 | mezcla por producto, categoría, canal y sede | localización de cambio composicional         | cambio de mezcla puede explicar agregados, no causa por sí solo                   |
|    5 | demanda por franja, día y temporada          | patrón temporal y referencia comparable      | estacionalidad requiere cobertura suficiente                                      |
|    6 | disponibilidad perdida                       | factor candidato de demanda no satisfecha    | sin intención y disponibilidad reconciliadas no se cuantifica como pérdida causal |
|    7 | cancelaciones, devoluciones y descuentos     | factor, resultado o impacto según expediente | los tres conceptos permanecen separados                                           |
|    8 | promociones y efecto incremental             | hipótesis de intervención comercial          | descuento o before/after no demuestran exposición ni efecto causal                |
|    9 | recurrencia y frecuencia                     | comportamiento longitudinal                  | identidad y finalidad autorizadas son requisito previo                            |
|   10 | margen relacionado                           | impacto económico consumido                  | margen no se recalcula localmente                                                 |
|   11 | capacidad comercial no utilizada             | restricción o capacidad candidata            | venta baja no prueba capacidad ociosa                                             |

**Reconciliación:** 11 esperadas; 11 materializadas; 0 faltantes; 0 duplicadas.

---

#### 20. Matriz de cobertura — Inventario, abastecimiento, proveedores y logística, 12/12

|    # | Familia canónica                        | Uso dentro de la investigación                            | Límite UX005                                                         |
| ---: | --------------------------------------- | --------------------------------------------------------- | -------------------------------------------------------------------- |
|    1 | existencia disponible y comprometida    | contexto de disponibilidad y restricción                  | conserva bloqueos y definiciones de fuente                           |
|    2 | cobertura y días de inventario          | señal de exposición y restricción                         | no existe cobertura sin consumo/demanda compatible                   |
|    3 | rotación y permanencia                  | señal de movimiento, obsolescencia o capital inmovilizado | exige historia y cohorte/lote comparables                            |
|    4 | faltantes y quiebres                    | evento o factor candidato                                 | stock cero no prueba faltante o quiebre sin necesidad elegible       |
|    5 | vencimiento, daño y pérdida             | hecho de pérdida/calidad e impacto                        | causa proviene de evidencia explícita, no de diferencia residual     |
|    6 | diferencias de conteo                   | señal de integridad física/reconciliación                 | puede ser causa operativa o síntoma; debe investigarse               |
|    7 | cumplimiento de remisiones              | señal de cumplimiento interno                             | preparación, despacho, recepción y faltante permanecen separados     |
|    8 | lead time y cumplimiento de proveedores | factor temporal y de abastecimiento                       | exige evento contractual inicial y recepción aceptada                |
|    9 | compras urgentes                        | señal de excepción                                        | recepción de emergencia no equivale automáticamente a compra urgente |
|   10 | consumo versus plan                     | relación entre consumo real y base planificada            | sin plan compatible no existe comparación válida                     |
|   11 | costo de inventario                     | impacto económico                                         | valoración oficial consume definición económica                      |
|   12 | capacidad de almacenamiento             | restricción física candidata                              | exige denominador físico utilizable y unidad compatible              |

**Reconciliación:** 12 esperadas; 12 materializadas; 0 faltantes; 0 duplicadas.

---

#### 21. Matriz de cobertura — Producción, rendimiento, capacidad, merma y calidad, 10/10

|    # | Familia canónica                            | Uso dentro de la investigación                   | Límite UX005                                                               |
| ---: | ------------------------------------------- | ------------------------------------------------ | -------------------------------------------------------------------------- |
|    1 | demanda planificada versus producción       | señal plan-real y localización de brecha         | pedido o remisión no sustituyen el plan aceptado                           |
|    2 | capacidad disponible y utilizada            | restricción o factor candidato                   | no mezclar unidades de capacidad sin puente explícito                      |
|    3 | adherencia al programa                      | señal temporal de ejecución                      | exige programa publicado y versionado                                      |
|    4 | rendimiento teórico y real                  | señal de rendimiento y posible factor productivo | receta, escala y unidad deben ser comparables                              |
|    5 | consumo estándar y real                     | variación de consumo por ingrediente             | sustituciones y unidades se preservan                                      |
|    6 | merma, reproceso y aprovechamiento          | pérdida, retrabajo o recuperación observada      | merma no se deriva automáticamente de diferencia de rendimiento            |
|    7 | calidad, retención y rechazo                | señal o resultado de calidad                     | control, conformidad, retención, rechazo y liberación permanecen separados |
|    8 | tiempo de ciclo                             | señal temporal y cuello de botella candidato     | requiere hitos reales; una fecha genérica no prueba duración               |
|    9 | cumplimiento de liberación                  | resultado de calidad/cumplimiento                | terminado no equivale a liberado                                           |
|   10 | costo y variación por lote, producto y sede | impacto económico/productivo                     | costo técnico productivo no se eleva a costo económico oficial             |

**Reconciliación:** 10 esperadas; 10 materializadas; 0 faltantes; 0 duplicadas.

---

#### 22. Matriz de cobertura — Servicio, clientes, fidelización, reputación y experiencia, 12/12

|    # | Familia canónica                                        | Uso dentro de la investigación                | Límite UX005                                                                    |
| ---: | ------------------------------------------------------- | --------------------------------------------- | ------------------------------------------------------------------------------- |
|    1 | cumplimiento de promesa                                 | señal de servicio y resultado de cumplimiento | promesa solicitada no equivale a promesa aceptada                               |
|    2 | tiempos de preparación, despacho y entrega              | localización temporal del deterioro           | no fabricar fase cuando falta un hito real                                      |
|    3 | pedidos completos                                       | resultado de cumplimiento                     | estado terminal no prueba completitud línea a línea                             |
|    4 | reclamos y tiempo de resolución                         | señal de problema y expediente de impacto     | reclamo exige expediente; contacto o chat no lo sustituyen                      |
|    5 | compensaciones                                          | impacto y respuesta de servicio               | devolución, reembolso, descuento, cortesía, cupón y puntos no son equivalentes  |
|    6 | satisfacción y feedback                                 | señal perceptual                              | sesgo de respuesta y denominador deben permanecer visibles                      |
|    7 | recurrencia, frecuencia y abandono                      | comportamiento longitudinal                   | ausencia no prueba abandono sin población y ventana elegibles                   |
|    8 | adquisición y activación                                | señal de entrada y progresión                 | cuenta creada o login no equivalen a activación                                 |
|    9 | fidelización, puntos y redenciones                      | señal de comportamiento de fidelización       | saldo no sustituye el ledger                                                    |
|   10 | reputación y temas recurrentes                          | señal temática o reputacional                 | feedback interno no equivale a reputación pública; tema no prueba causa         |
|   11 | reservas, no-show y utilización                         | señal de capacidad/servicio                   | utilización exige capacidad compatible                                          |
|   12 | valor y rentabilidad del cliente cuando esté autorizado | impacto económico por población autorizada    | rentabilidad consume definición económica y detalle sensible conserva finalidad |

**Reconciliación:** 12 esperadas; 12 materializadas; 0 faltantes; 0 duplicadas.

---

#### 23. Matriz de cobertura — Costos, rentabilidad, liquidez, presupuesto y escenarios, 10/10

|    # | Familia canónica              | Uso dentro de la investigación             | Límite UX005                                                                      |
| ---: | ----------------------------- | ------------------------------------------ | --------------------------------------------------------------------------------- |
|    1 | costos estándar y reales      | señal base-real e impacto                  | costo oficial conserva método y reconciliación propietaria                        |
|    2 | variaciones                   | señal diagnóstica primaria                 | cada variación conserva su base; no mezclar costo, presupuesto, precio y cantidad |
|    3 | margen y contribución         | impacto y resultado económico              | exige ingreso realizado y costos trazables                                        |
|    4 | gastos                        | señal e impacto económico                  | gasto capturado no equivale automáticamente a reconocido o pagado                 |
|    5 | centros de costo              | dimensión de localización                  | centro no equivale a sede, área, marca o canal                                    |
|    6 | presupuesto y forecast        | comparador planificado o pronosticado      | presupuesto, forecast, revisión, escenario y real permanecen separados            |
|    7 | caja, bancos y tesorería      | señal de liquidez y restricción financiera | posición real exige saldos reconciliados y disponibilidad                         |
|    8 | cartera y obligaciones        | señal de exposición y flujo futuro         | pago/cobro sin aplicación no cierra saldo                                         |
|    9 | rentabilidad multidimensional | impacto económico transversal              | exige ingreso, costos, asignaciones y residuo no atribuible visibles              |
|   10 | escenarios y simulaciones     | comparador hipotético y exploración        | escenario no es evidencia observada ni prueba causal                              |

**Reconciliación:** 10 esperadas; 10 materializadas; 0 faltantes; 0 duplicadas.

---

#### 24. Reconciliación global de las 55 familias

| Dominio de familias                                 | Esperadas | Materializadas | Faltantes | Duplicadas |
| --------------------------------------------------- | --------: | -------------: | --------: | ---------: |
| Comercial                                           |        11 |             11 |         0 |          0 |
| Inventario, abastecimiento, proveedores y logística |        12 |             12 |         0 |          0 |
| Producción                                          |        10 |             10 |         0 |          0 |
| Servicio y clientes                                 |        12 |             12 |         0 |          0 |
| Económico-financiera                                |        10 |             10 |         0 |          0 |
| **Total**                                           |    **55** |         **55** |     **0** |      **0** |

Las 55 familias son categorías semánticas de investigación. Ninguna se convierte en métrica, score o detector por aparecer en este espacio.

---

#### 25. Métricas de asistencia — cobertura 14/14

Las 14 métricas v1 conservan identidad y DQ heredado. La investigación no eleva su certificación.

|    # | `metric_key`        | DQ heredado   | Tratamiento UX005                                                                                                            |
| ---: | ------------------- | ------------- | ---------------------------------------------------------------------------------------------------------------------------- |
|    1 | `scheduledShifts`   | `NO EVALUADO` | puede originar señal descriptiva de programación/cobertura con estado visible; no atribuir causas laborales individuales     |
|    2 | `attendedShifts`    | `NO EVALUADO` | puede investigar variación de asistencia sobre población compatible; detalle de trabajador se reautoriza                     |
|    3 | `restDayCount`      | `NO EVALUADO` | puede explicar composición de población programada; descanso no se interpreta como ausencia ni desempeño                     |
|    4 | `lateCount`         | `NO EVALUADO` | puede investigar patrones temporales con gracia/versión y zona horaria; no producir ranking individual                       |
|    5 | `noShowCount`       | `NO EVALUADO` | puede investigar concentración solo sobre turnos vencidos al corte; no inferir causa de ausencia sin expediente/evidencia    |
|    6 | `openCount`         | `NO EVALUADO` | puede investigar sesiones abiertas AS OF corte; no equiparar con falta de cierre ni incidencia confirmada                    |
|    7 | `missingCloseCount` | `BLOQUEADO`   | toda conclusión empresarial dependiente queda `NO_EVALUABLE`; la divergencia se deriva al centro de calidad                  |
|    8 | `autoCloseCount`    | `NO EVALUADO` | puede investigar patrón de autocierre; mecanismo técnico no se interpreta automáticamente como comportamiento del trabajador |
|    9 | `departureCount`    | `NO EVALUADO` | puede originar investigación agregada con minimización reforzada; evento geográfico individual requiere finalidad específica |
|   10 | `scheduledMinutes`  | `NO EVALUADO` | puede investigar carga programada con periodos y reglas compatibles; no equivale a trabajo ejecutado                         |
|   11 | `netMinutes`        | `NO EVALUADO` | puede investigar duración registrada con sesiones/descansos válidos; no atribuir productividad por duración únicamente       |
|   12 | `incidentCount`     | `NO EVALUADO` | el conteo compuesto puede ser señal; no concede las señales subyacentes ni identifica una causa por sí solo                  |
|   13 | `attendanceRate`    | `BLOQUEADO`   | toda conclusión dependiente queda `NO_EVALUABLE` hasta resolver el caso de denominador ausente representado como cero        |
|   14 | `punctualityRate`   | `BLOQUEADO`   | toda conclusión dependiente queda `NO_EVALUABLE` hasta resolver el caso de denominador ausente representado como cero        |

**Reconciliación:** 14 métricas esperadas; 14 materializadas; 14 claves únicas; 0 faltantes; 0 duplicadas; 11 `NO EVALUADO`; 3 `BLOQUEADO`.

Reglas adicionales:

- `missingCloseCount`, `attendanceRate` y `punctualityRate` son exactamente las tres métricas bloqueadas;
- una métrica `NO EVALUADO` puede soportar exploración con su DQ visible, pero nunca se presenta como evidencia certificada por inferencia;
- una dependencia crítica `BLOQUEADO` impide evaluar la afirmación que dependa de ella;
- tasas se recomputan desde numerador y denominador compatibles; no se promedian porcentajes;
- trabajador es dimensión sensible y no habilita ranking, perfil disciplinario ni expediente por permiso agregado;
- `incidentCount` no concede acceso automático a las señales individuales que lo componen.

---

#### 26. Familias de artefacto D008 — cobertura 6/6

|    # | Familia          | Papel en UX005                                                                         | Límite                                                           |
| ---: | ---------------- | -------------------------------------------------------------------------------------- | ---------------------------------------------------------------- |
|    1 | tablero          | puede originar una señal o abrir una investigación conservando contexto                | no se convierte en fuente ni en diagnóstico por existir          |
|    2 | reporte          | puede servir como referencia o publicación previa con versión/corte                    | una edición oficial no autoriza reinterpretación silenciosa      |
|    3 | exportación      | puede ser evidencia portable únicamente si conserva procedencia e integridad           | una copia no adquiere autoridad ni amplía acceso                 |
|    4 | suscripción      | una entrega puede originar señal sobre el mismo resultado gobernado                    | la entrega recurrente no crea definición ni población nueva      |
|    5 | alerta           | es entrada natural de atención e investigación                                         | alerta no equivale a diagnóstico, causa, recomendación ni acción |
|    6 | snapshot oficial | permite comparar una publicación histórica con otro resultado o restatement autorizado | snapshot permanece inmutable y separado del valor vivo           |

**Reconciliación:** 6 familias esperadas; 6 materializadas; 0 faltantes; 0 duplicadas.

---

#### 27. Modelos, estadística e inteligencia artificial

Un modelo puede detectar patrones, estimar expectativas, segmentar, clasificar, pronosticar o sugerir factores para investigar. La experiencia deberá mostrar, cuando aplique, objetivo, versión, dataset/corte, variables, exclusiones, población de entrenamiento/evaluación, desempeño, limitaciones, fecha y responsable.

Una herramienta de inteligencia artificial puede asistir para:

- resumir evidencia;
- proponer preguntas;
- sugerir segmentaciones;
- identificar inconsistencias para revisión;
- proponer hipótesis candidatas;
- explicar consultas o visualizaciones.

No puede por sí sola:

- certificar datos;
- declarar una causa;
- aprobar una oportunidad;
- fijar una meta;
- ejecutar una acción empresarial;
- modificar una fuente de verdad;
- ocultar evidencia contradictoria;
- reemplazar al propietario funcional.

Todo output de modelo o IA se identifica como tal, conserva procedencia y limitaciones y no se estiliza como evidencia fuente.

---

#### 28. Lenguaje causal y comunicación de incertidumbre

| Nivel o situación    | Lenguaje permitido                                                    | Lenguaje que no corresponde sin evidencia adicional        |
| -------------------- | --------------------------------------------------------------------- | ---------------------------------------------------------- |
| señal descriptiva    | “se observó una caída de…”                                            | “X causó la caída”                                         |
| asociación           | “la caída está asociada con…”                                         | “la caída se debe a…”                                      |
| hipótesis respaldada | “la evidencia respalda la hipótesis de…”                              | “la causa confirmada es…”                                  |
| evidencia causal     | “la evidencia apoya un efecto causal bajo estos supuestos y contexto” | generalización categórica fuera del diseño                 |
| efecto comprobado    | “el efecto fue observado bajo las condiciones del experimento”        | generalizar fuera de población/ventana sin nueva evidencia |
| sin causa resuelta   | “no existe evidencia suficiente para resolver una causa”              | seleccionar una causa por obligación de cierre             |

La incertidumbre, las alternativas y el residuo no atribuido permanecen visibles.

---

#### 29. Autorización, privacidad y protección de evidencia

Reglas obligatorias:

1. la población autorizada se resuelve antes de calcular señal, segmentación, comparación o modelo;
2. los filtros del espacio solo reducen el conjunto autorizado;
3. una métrica visible no concede detalle fuente;
4. una hipótesis que menciona un sujeto, cliente, trabajador, proveedor o contraparte no concede acceso a su expediente;
5. evidencia sensible puede permanecer referenciada sin exponer contenido completo;
6. grupos pequeños, cohortes, precisión, denominadores, tooltips, búsquedas y metadatos aplican la misma protección contra inferencia;
7. conocer un identificador no permite saltar a evidencia no autorizada;
8. el drill-down reevalúa actor, recurso, territorio, finalidad, clasificación, campos y población;
9. publicación y exportación son capacidades independientes;
10. anotación no cambia una métrica, estado DQ, confianza metodológica, meta, publicación o fuente por sí sola;
11. administración no constituye superpermiso;
12. un modelo o proceso técnico conserva la autorización empresarial de la finalidad y población; privilegio técnico no sustituye autoridad.

La experiencia no crea una capacidad nueva denominada “investigar”. Las acciones autoritativas continúan resolviéndose mediante las capacidades canónicas existentes y la autorización de lectura/consumo correspondiente.

---

#### 30. Auditoría y reproducibilidad

Cada expediente de investigación deberá conservar conceptualmente:

- actor o proceso que inició la investigación;
- fecha/hora;
- señal original;
- consultas utilizadas;
- modelos o recomendaciones utilizados;
- versiones de métricas;
- fuentes y cortes;
- filtros y dimensiones;
- evidencia incorporada;
- hipótesis creadas, descartadas o revisadas;
- cambios de nivel de confianza y motivo;
- propietario funcional que revisó la interpretación;
- oportunidad resultante, si existe;
- relación con objetivos, acciones o experimentos posteriores.

La auditoría no es autorización, fuente de verdad, certificación, publicación ni evidencia causal. Los logs conservan referencias mínimas y no recrean datasets sensibles por defecto.

---

#### 31. Historia, correcciones y restatements

1. una investigación nueva no borra una conclusión anterior;
2. una evidencia posterior puede reducir o elevar confianza mediante una nueva decisión trazable;
3. cambios de fuente, fórmula, población, cobertura o DQ se distinguen de cambios reales de negocio;
4. una corrección histórica no reescribe silenciosamente una conclusión publicada;
5. original y restatement permanecen distinguibles y comparables solo bajo autorización vigente;
6. una ruptura semántica no se dibuja como continuidad homogénea;
7. la explicación histórica usa identidades, jerarquías y vigencias aplicables al hecho;
8. una conclusión revisada conserva el motivo del cambio y su relación con la evidencia nueva.

---

#### 32. Accesibilidad, densidad y ergonomía

El espacio es una superficie analítica/administrativa y puede usar densidad alta, pero conserva:

- contexto, señal, DQ y confianza visibles antes del detalle secundario;
- navegación por teclado y foco visible;
- orden semántico coherente;
- texto, icono o semántica además de color para estados, confianza y evidencia;
- visualizaciones con resumen textual o alternativa tabular cuando sea necesaria para comprender el hallazgo;
- tooltips no utilizados como único lugar de información esencial;
- filtros con etiqueta inequívoca y estado seleccionado;
- divulgación progresiva para evidencia extensa y modelos;
- mensajes humanos que distingan falta de datos, falta de autorización, DQ bloqueado y causa no resuelta;
- reflow que preserve contexto principal sin convertir escritorio en una versión simplemente encogida;
- acciones autoritativas visualmente separadas de exploración y lectura.

La validación con usuarios reales corresponde a `DATA-UX-008`.

---

#### 33. Handoffs con propietario documental exacto

| Necesidad detectada durante la investigación                              | Propietario documental         | Condición de salida                                                    |
| ------------------------------------------------------------------------- | ------------------------------ | ---------------------------------------------------------------------- |
| comprender definición, fórmula, fuente, dueño, versión o linaje           | `DATA-UX-002`                  | cuando la pregunta sea semántica o de procedencia                      |
| volver a tendencia, comparación o composición de una métrica              | `DATA-UX-003`                  | conservar contexto, filtros, referencia, periodo y corte               |
| resolver frescura, cobertura, conciliación, incidencia o certificación    | `DATA-UX-004`                  | antes de interpretar como negocio una señal afectada por DQ            |
| convertir oportunidad en objetivo, línea base, meta, drivers o guardrails | `DATA-UX-006` y `DATA-DOM-015` | cuando exista una oportunidad suficientemente descrita para medición   |
| definir acción, experimento, responsable, seguimiento o comprobación      | `DATA-DOM-016`                 | antes de ejecutar o declarar efecto de una intervención                |
| publicar, distribuir, exportar, suscribir o preservar una conclusión      | `DATA-UX-007` y `DATA-DOM-008` | cuando corresponda una salida gobernada y exista autorización separada |
| validar comprensión, tiempos, confianza y decisión con personas usuarias  | `DATA-UX-008`                  | antes de declarar readiness de la experiencia                          |
| corregir historia o reexpresar una conclusión publicada                   | `DATA-DOM-017`                 | antes de modificar una interpretación histórica oficial                |
| materializar consultas, modelos, snapshots, caché o rendimiento           | `DATA-INT-002`                 | antes de implementar el espacio físicamente                            |
| resolver correspondencias e identidades externas                          | `DATA-INT-003`                 | antes de unir evidencia cuya identidad no esté demostrada              |
| integrar BI, hojas, modelos analíticos o inteligencia artificial          | `DATA-INT-004`                 | antes de conectar herramientas externas o modelos productivos          |

No queda una decisión material de UX005 diferida sin propietario documental y condición de salida.

---

#### 34. Cobertura de requisitos de prueba vigente

La conducta materializada por esta tarea ya está protegida por requisitos canónicos vigentes:

- `TREQ-DATA-005` asigna expresamente responsabilidad a `DATA-UX-005` y protege la separación entre señal, diagnóstico, hipótesis, acción, experimento, responsable, línea base, meta, indicador principal, drivers, guardrails, ventana, segmentos, resultado, confianza, aprendizaje y decisión; además prohíbe presentar correlación como causa demostrada y ejecutar recomendaciones automáticamente;
- `TREQ-DATA-002` protege definición, versión, fórmula, población, dimensiones, fuente, calidad y comparación de métricas;
- `TREQ-DATA-003` protege calidad, cobertura, datos tardíos, reconciliación, linaje y separación entre ausencia y cero;
- `TREQ-DATA-004` protege contexto, corte, calidad, artefactos analíticos, snapshots y drill-down autorizado;
- `TREQ-UX-003` protege que información, acciones y densidad correspondan a tarea y autorización con minimización sensible;
- `TREQ-UX-005` protege fuente de verdad, estados, diferencias, correcciones trazables y ausencia de copias competidoras;
- `TREQ-UX-010` protege contexto administrativo de territorio, periodo, versión, estado, población, actor, permiso, segregación e impacto.

La tarea especializa el contrato diagnóstico D014 como experiencia de investigación. No introduce una conducta ejecutable independiente que carezca de cobertura ni modifica prioridad, modalidad, estado, relación o destino de implementación de los requisitos existentes.

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la experiencia materializa obligaciones de separación entre señal, diagnóstico, hipótesis, causa, acción y experimento; confianza explicable; calidad y comparabilidad; trazabilidad; privacidad; y prohibición de causalidad automática que ya están protegidas por requisitos canónicos vigentes y asignadas a esta responsabilidad documental. No crea un nuevo comportamiento ejecutable, un nuevo nivel de confianza, una nueva fórmula, un nuevo permiso, un nuevo modelo productivo ni una implementación física.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 35. Criterios de aceptación

1. el espacio se define como experiencia analítica/administrativa y no como fuente de verdad;
2. una investigación se organiza por afirmaciones trazables y no por narrativa libre sin evidencia;
3. señal, variación y anomalía permanecen conceptos distintos;
4. anomalía de negocio, calidad, reconciliación, cambio semántico y cobertura se clasifican antes de causalidad;
5. correlación no se presenta como causa;
6. factor candidato, causa principal y causa raíz permanecen separados;
7. alerta, diagnóstico, recomendación y acción permanecen separados;
8. impacto observado, potencial y beneficio realizado permanecen separados;
9. oportunidad, objetivo, meta, plan y experimento permanecen separados;
10. confianza diagnóstica permanece separada de certificación DQ;
11. se materializan exactamente trece momentos de investigación;
12. la salida `SIN_CAUSA_RESUELTA` se admite sin obligar a escoger una explicación;
13. se materializan exactamente ocho patrones diagnósticos;
14. los ocho patrones no implican causalidad;
15. no se inventa un umbral estadístico universal;
16. el método de detección conserva versión, población y tratamiento material de faltantes;
17. se materializan exactamente ocho dimensiones mínimas de evidencia;
18. no se promedian las dimensiones para ocultar una falla crítica;
19. se materializan exactamente seis niveles de confianza;
20. `NO_EVALUABLE` identifica falta de base suficiente;
21. `SEÑAL_DESCRIPTIVA` no atribuye factores;
22. `ASOCIACION` no autoriza lenguaje causal;
23. `HIPOTESIS_RESPALDADA` exige temporalidad, mecanismo y alternativas investigadas;
24. `EVIDENCIA_CAUSAL` exige estrategia de identificación y supuestos explícitos;
25. `EFECTO_COMPROBADO` requiere evidencia de intervención/experimento gobernado;
26. una dependencia crítica `BLOQUEADO` fuerza `NO_EVALUABLE` para la afirmación dependiente;
27. sin referencia comparable el máximo es `SEÑAL_DESCRIPTIVA`;
28. sin precedencia temporal el máximo causal es `ASOCIACION`;
29. sin alternativas materiales investigadas el máximo es `ASOCIACION`;
30. evidencia derivada del mismo hecho no se cuenta como confirmación independiente;
31. modelo, IA, p-value, correlación, feature importance, SHAP o precisión no prueban causalidad por sí solos;
32. no existe un porcentaje universal de confianza;
33. evidencia favorable, contradictoria y faltante permanecen separadas;
34. evidencia contradictoria no se oculta para elevar confianza;
35. falta de evidencia no se presenta como evidencia en contra;
36. la temporalidad de factores y efectos permanece visible cuando es material;
37. una variable posterior no se atribuye como causa por mera correlación;
38. las explicaciones alternativas se descartan únicamente con evidencia;
39. la población autorizada se construye antes de segmentación o cálculo;
40. los filtros solo reducen el conjunto autorizado;
41. grupos pequeños y dimensiones sensibles no se revelan por subtotales, precisión, búsqueda o drill-down;
42. cada nivel de detalle reevalúa autorización;
43. la experiencia no crea una nueva capacidad de autorización para “investigar”;
44. anotación, publicación, exportación, certificación, meta y administración permanecen acciones separadas;
45. se materializan exactamente 55 familias analíticas;
46. se conserva la distribución `11 + 12 + 10 + 12 + 10`;
47. las 55 familias aparecen exactamente una vez en sus matrices de cobertura;
48. ninguna familia se convierte en `metric_key` por aparecer en la investigación;
49. se materializan exactamente 14 métricas de asistencia;
50. se preservan exactamente 11 `NO EVALUADO` y 3 `BLOQUEADO`;
51. `missingCloseCount`, `attendanceRate` y `punctualityRate` son exactamente las tres bloqueadas;
52. toda conclusión empresarial dependiente de una de las tres bloqueadas queda `NO_EVALUABLE`;
53. `incidentCount` no concede sus señales subyacentes;
54. trabajador no se convierte en ranking o perfil disciplinario por aparecer como dimensión;
55. se materializan exactamente seis familias de artefacto D008;
56. tablero, reporte, exportación, suscripción, alerta y snapshot permanecen distintos;
57. una alerta no se presenta como diagnóstico o causa;
58. una exportación no se convierte en fuente de verdad;
59. modelos e IA se muestran con procedencia, versión y limitaciones cuando apliquen;
60. IA no certifica, declara causa, aprueba oportunidad, fija meta ni ejecuta acción;
61. el lenguaje visible corresponde al nivel de confianza;
62. el residuo no atribuido permanece visible;
63. una falta de inventario no se monetiza automáticamente como venta perdida;
64. una merma física no se monetiza automáticamente como pérdida económica;
65. un reclamo o rating no se convierte automáticamente en abandono;
66. historia y cambios de confianza permanecen trazables;
67. una corrección histórica no reescribe silenciosamente una conclusión publicada;
68. auditoría no constituye causalidad ni autorización;
69. logs no copian datasets sensibles por defecto;
70. accesibilidad no depende únicamente de color, posición o tooltip;
71. evidencia extensa utiliza divulgación progresiva sin ocultar contexto crítico;
72. cada handoff conserva propietario documental y condición de salida;
73. no se crean componentes físicos, endpoints, tablas, vistas, modelos, scores o nombres técnicos de implementación;
74. no se crean permisos, roles, grants o excepciones;
75. no se modifica código, SQL, Supabase, datos, migraciones, backfills, modelos, automatizaciones, experimentos ni despliegues;
76. no se crea ni modifica ningún requisito de prueba;
77. `DATA-UX-006` permanece únicamente reservada como siguiente tarea.

---

#### 36. Balance de cierre

| Control                              | Resultado |
| ------------------------------------ | --------: |
| Momentos de investigación            |    **13** |
| Patrones diagnósticos                |   **8/8** |
| Niveles de confianza                 |   **6/6** |
| Dimensiones mínimas de evidencia     |   **8/8** |
| Recorridos transversales             |   **5/5** |
| Familias comerciales                 | **11/11** |
| Familias inventario/abastecimiento   | **12/12** |
| Familias producción                  | **10/10** |
| Familias servicio/clientes           | **12/12** |
| Familias económico-financieras       | **10/10** |
| Familias analíticas totales          | **55/55** |
| Métricas de asistencia               | **14/14** |
| Métricas `NO EVALUADO` / `BLOQUEADO` |  **11/3** |
| Familias de artefacto D008           |   **6/6** |
| Nuevas métricas o fórmulas           |     **0** |
| Nuevos niveles de confianza          |     **0** |
| Nuevos permisos                      |     **0** |
| Cambios físicos                      |     **0** |
| Requisitos TREQ creados/modificados  |     **0** |

---

#### 37. Continuidad

ÚLTIMA TAREA APROBADA
`DATA-UX-004 — Diseñar centro de calidad, frescura, conciliaciones y certificación`

TAREA ACTUAL APROBADA
`DATA-UX-005 — Diseñar espacio de investigación de variaciones, anomalías y causas`

SIGUIENTE TAREA RESERVADA
`DATA-UX-006 — Diseñar objetivos, metas, drivers, guardrails y acciones de mejora`


### ✅ DATA-UX-006 — Diseñar objetivos, metas, drivers, guardrails y acciones de mejora

**Estado:** APROBADA
**Tarea anterior:** `DATA-UX-005 — Diseñar espacio de investigación de variaciones, anomalías y causas` — APROBADA
**Tarea siguiente:** `DATA-UX-007 — Diseñar reportes, exportaciones, suscripciones y snapshots versionados` — RESERVADA
**Tipo de tarea:** documental; diseño normativo y materializado de la experiencia de objetivos medibles, metas gobernadas, drivers, guardrails, planes de medición, acciones de mejora, intervenciones y comprobación de resultados
**Bloque:** AB — Analítica, indicadores y datos maestros
**Fase:** exclusivamente documental
**Implementación técnica:** no autorizada
**Código, rutas físicas, componentes, DDL, DML, migraciones, RLS, RPC, grants, cambios de permisos, datos, backfills, automatizaciones, experimentos reales, despliegues, cambios de proceso, cambios de configuración o cambios en Supabase:** no autorizados
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Diseñar la experiencia mediante la cual un actor autorizado puede convertir una oportunidad, obligación, riesgo o prioridad empresarial en un objetivo medible; fijar una meta únicamente mediante la autoridad gobernada correspondiente; comprender su línea base, KPI principal, drivers y guardrails; preparar un plan de medición reproducible; diseñar y seguir una acción o intervención sin confundir propuesta con ejecución; y comprobar resultados sin convertir mejora observada en efecto causal por conveniencia visual.

La experiencia deberá permitir responder, de forma trazable:

1. ¿qué resultado empresarial se quiere cambiar, proteger, sostener o recuperar?;
2. ¿qué decisión, oportunidad, obligación o riesgo origina el objetivo?;
3. ¿quién es propietario funcional del resultado?;
4. ¿cuál es el único indicador principal del objetivo y qué versión lo gobierna?;
5. ¿cuál es la línea base reproducible y con qué calidad fue observada?;
6. ¿qué meta está vigente, con qué operador, unidad, horizonte, fuente y autoridad?;
7. ¿qué drivers se observan y qué nivel de evidencia respalda su interpretación?;
8. ¿qué guardrails protegen resultados o riesgos materiales distintos del KPI?;
9. ¿qué población, segmentos, dimensiones, calendario, ventana y corte delimitan la medición?;
10. ¿está el objetivo listo para medición oficial o permanece pendiente/bloqueado?;
11. ¿qué acción o intervención se propone y qué mecanismo pretende activar?;
12. ¿se requiere experimento o basta seguimiento no causal?;
13. ¿quién aprueba, quién ejecuta y quién mide?;
14. ¿qué población fue elegible, asignada y realmente expuesta?;
15. ¿qué ocurrió con KPI, meta, drivers, guardrails y efectos no deseados?;
16. ¿qué parte del resultado es observada y qué parte puede atribuirse a la intervención?;
17. ¿qué confianza diagnóstica permite la evidencia?;
18. ¿qué decisión de cierre está vigente y qué aprendizaje queda preservado?;
19. ¿qué restricciones impiden publicar, ampliar, exportar o actuar?;
20. ¿qué destino propietario corresponde cuando se requiere investigación, calidad, implementación, publicación o restatement?

Principio rector:

```text
OBJETIVO GOBERNADO
=
RESULTADO EMPRESARIAL
+ PROPIETARIO
+ KPI PRINCIPAL VERSIONADO
+ LÍNEA BASE REPRODUCIBLE
+ META AUTORIZADA
+ DRIVERS CON LÍMITE DE INTERPRETACIÓN
+ GUARDRAILS MATERIALES
+ PLAN DE MEDICIÓN
+ POBLACIÓN / SEGMENTOS / VENTANA
+ CALIDAD Y COMPARABILIDAD

INTERVENCIÓN EVALUABLE
=
OBJETIVO GOBERNADO
+ ACCIÓN CONCRETA
+ MECANISMO / HIPÓTESIS
+ RESPONSABILIDADES SEPARADAS
+ DISEÑO PREESPECIFICADO
+ ASIGNACIÓN Y EXPOSICIÓN RECONSTRUIBLES
+ SEGUIMIENTO DE FIDELIDAD Y GUARDRAILS
+ COMPROBACIÓN
+ APRENDIZAJE
+ DECISIÓN DE CIERRE

NO

MÉTRICA VISIBLE = KPI
VALOR DE CONFIGURACIÓN = META VIGENTE
DRIVER = CAUSA DEMOSTRADA
GUARDRAIL = INDICADOR DECORATIVO
RECOMENDACIÓN = ACCIÓN APROBADA
ACCIÓN DISEÑADA = ACCIÓN EJECUTADA
ASIGNACIÓN = EXPOSICIÓN
CUMPLIR META = EFECTO CAUSAL
MEJORAR KPI = ÉXITO SI HAY DAÑO MATERIAL
ALERTA = PAUSA AUTOMÁTICA
PANTALLA = AUTORIDAD PARA ACTUAR
```

---

#### 2. Resultado sustantivo

Queda materializada la experiencia completa de objetivos y mejora con los siguientes resultados:

- una experiencia única de portafolio y ficha de objetivo, sin convertir el tablero en fuente de verdad;
- una cadena explícita desde origen empresarial hasta objetivo, KPI, baseline, meta, drivers, guardrails, plan de medición e intervención;
- un único KPI principal por objetivo;
- tres métodos documentales de línea base preservados;
- cinco formas semánticas de meta preservadas, sin inventar valores numéricos;
- tratamiento gobernado de `SET_TARGET`, separado de definición, certificación, publicación, anotación, exportación y administración;
- veintiocho elementos mínimos del plan de medición;
- catorce condiciones de puerta para medición oficial;
- decisión explícita de elegibilidad para las cincuenta y cinco familias analíticas heredadas, con 11 + 12 + 10 + 12 + 10 identidades y cero faltantes;
- cobertura explícita de las catorce métricas de asistencia ya registradas, preservando once `NO EVALUADO` y tres `BLOQUEADO`;
- un expediente de intervención con treinta y tres coordenadas mínimas;
- veinte condiciones previas para declarar una intervención documentalmente lista para ejecución futura;
- seis clases de intervención preservadas;
- seis diseños de evaluación o experimento con su techo de interpretación;
- seis ventanas diferenciadas de una intervención;
- separación visible entre población elegible, asignación, exposición y cumplimiento;
- comprobación de resultado en dieciocho dimensiones;
- siete decisiones empresariales de cierre preservadas exactamente;
- separación entre resultado observado y efecto atribuible;
- cero metas concretas inventadas;
- cero nuevas `metric_key`;
- cero acciones empresariales ejecutadas;
- cero experimentos ejecutados;
- cero permisos, roles o grants creados;
- cero cambios físicos;
- cero cambios de requisitos de prueba.

Reconciliación documental:

| Inventario o contrato               |               Esperado |          Materializado | Faltantes | Duplicados |
| ----------------------------------- | ---------------------: | ---------------------: | --------: | ---------: |
| Familias analíticas                 |                     55 |                     55 |         0 |          0 |
| Distribución por dominio            | 11 + 12 + 10 + 12 + 10 | 11 + 12 + 10 + 12 + 10 |         0 |          0 |
| Métricas de asistencia              |                     14 |                     14 |         0 |          0 |
| Formas semánticas de meta           |                      5 |                      5 |         0 |          0 |
| Métodos documentales de baseline    |                      3 |                      3 |         0 |          0 |
| Elementos del plan de medición      |                     28 |                     28 |         0 |          0 |
| Condiciones de medición oficial     |                     14 |                     14 |         0 |          0 |
| Coordenadas de intervención         |                     33 |                     33 |         0 |          0 |
| Condiciones previas de intervención |                     20 |                     20 |         0 |          0 |
| Clases de intervención              |                      6 |                      6 |         0 |          0 |
| Diseños de evaluación               |                      6 |                      6 |         0 |          0 |
| Ventanas de intervención            |                      6 |                      6 |         0 |          0 |
| Decisiones de cierre                |                      7 |                      7 |         0 |          0 |

---

#### 3. Entradas canónicas consumidas

La experiencia consume sin redefinir:

- `DATA-DOM-004` y `DATA-DOM-005` para identidad y versión de métricas, granularidad, tiempo, dimensiones, calendario, comparabilidad y snapshots;
- `DATA-DOM-006` y `DATA-DOM-007` para procedencia, datos tardíos, reconciliación, calidad, cobertura y estados DQ;
- `DATA-DOM-008` para mantener tablero, reporte, alerta, exportación, suscripción y snapshot como artefactos distintos;
- `DATA-DOM-009` a `DATA-DOM-013` para las cincuenta y cinco familias analíticas y sus restricciones reales;
- `DATA-DOM-014` para oportunidad, diagnóstico, confianza, causalidad y límites de generalización;
- `DATA-DOM-015` para objetivo, KPI, baseline, meta, drivers, guardrails y plan de medición;
- `DATA-DOM-016` para acción, intervención, experimento, ejecución, exposición, seguimiento, comprobación, aprendizaje y cierre;
- `DATA-DOM-017` para versiones, correcciones históricas, restatements y reproducibilidad;
- `DATA-AUTH-001` y `DATA-AUTH-002` para construir el conjunto autorizado y proteger detalle sensible, poblaciones pequeñas, comparaciones y drill-down;
- `DATA-AUTH-003` para separar `DEFINE`, `CERTIFY`, `PUBLISH`, `SET_TARGET`, `ANNOTATE`, `EXPORT` y `ADMINISTER`;
- `DATA-AUTH-004` para la trazabilidad de consultas, modelos y recomendaciones sin convertir auditoría en autoridad;
- `DATA-UX-001` para el resumen ejecutivo simple;
- `DATA-UX-002` para definición, dueño, fuente, calidad, linaje e historia de métricas;
- `DATA-UX-003` para tableros por dominio, comparación y drill-down;
- `DATA-UX-004` para calidad, frescura, conciliaciones y certificación;
- `DATA-UX-005` para señal, variación, anomalía, investigación, evidencia, oportunidad y confianza;
- la línea base UX y NFR vigente para contexto administrativo, privacidad, trazabilidad, accesibilidad y ergonomía;
- los requisitos canónicos vigentes que ya protegen el ciclo de mejora basada en datos.

La tarea no define nombres físicos de rutas, componentes, tablas, vistas, modelos, jobs, colas, funciones, RPC, permisos o eventos. La materialización técnica pertenece a los paquetes y tareas propietarias posteriores.

---

#### 4. Fronteras conceptuales obligatorias

```text
PRIORIDAD EMPRESARIAL ≠ OBJETIVO ≠ META
```

```text
MÉTRICA ≠ KPI ≠ DRIVER ≠ GUARDRAIL
```

```text
LÍNEA BASE ≠ META ≠ BENCHMARK ≠ FORECAST ≠ ESCENARIO
```

```text
DRIVER ≠ CAUSA DEMOSTRADA
```

```text
GUARDRAIL ≠ KPI SECUNDARIO DECORATIVO
```

```text
META ≠ ALERTA ≠ LÍMITE TÉCNICO
```

```text
CALIDAD DQ ≠ CONFIANZA DIAGNÓSTICA ≠ CUMPLIMIENTO DE META
```

```text
OPORTUNIDAD ≠ OBJETIVO ≠ ACCIÓN ≠ EXPERIMENTO
```

```text
RECOMENDACIÓN ≠ DECISIÓN ≠ ACCIÓN
```

```text
INTERVENCIÓN DISEÑADA ≠ INTERVENCIÓN EJECUTADA
```

```text
ASIGNADO ≠ EXPUESTO ≠ CUMPLIÓ INTERVENCIÓN
```

```text
RESULTADO OBSERVADO ≠ EFECTO ATRIBUIBLE
```

```text
CUMPLIR META ≠ DEMOSTRAR CAUSALIDAD
```

```text
BEFORE/AFTER ≠ EXPERIMENTO CONTROLADO
```

```text
PAUSA ≠ REVERSA ≠ FRACASO DEFINITIVO
```

```text
ACCIÓN COMPLETADA ≠ OBJETIVO COMPROBADO
```

```text
PUBLICACIÓN ≠ SET_TARGET ≠ EJECUCIÓN
```

---

#### 5. Arquitectura de información de la experiencia

La experiencia se organiza en siete zonas lógicas coordinadas. Son responsabilidades de UX y no nombres físicos de componentes:

1. **Portafolio de objetivos** — objetivos visibles para el actor, propietario, KPI, preparación, calidad, horizonte y riesgos materiales.
2. **Definición y medición** — resultado empresarial, KPI principal, baseline, meta, población, segmentos, ventanas y regla de evaluación.
3. **Drivers y guardrails** — factores observables, confianza, controlabilidad, riesgos protegidos y tratamiento de incumplimiento.
4. **Evidencia y comparabilidad** — calidad, cobertura, versiones, cambios semánticos, snapshots y limitaciones que condicionan la lectura.
5. **Acciones e intervenciones** — propuesta, clase, mecanismo, responsabilidades, diseño de evaluación, población y readiness documental.
6. **Seguimiento y comprobación** — exposición, fidelidad, KPI, meta, guardrails, segmentos, cambios concurrentes, efectos no deseados y confianza.
7. **Aprendizaje e historia** — decisión de cierre, aprendizaje, iteraciones, versiones, restatements y navegación a fuentes propietarias.

La primera vista no muestra las cincuenta y cinco familias ni todos los campos del expediente simultáneamente. Prioriza objetivo, KPI, estado de preparación, meta/horizonte, guardrails materiales, calidad y siguiente decisión autorizada. El detalle se expande de forma progresiva.

---

#### 6. Coordenada visible de un objetivo

Toda ficha deberá poder presentar, cuando aplique y sea autorizado:

| Coordenada                | Decisión UX006                                                                                                |
| ------------------------- | ------------------------------------------------------------------------------------------------------------- |
| resultado empresarial     | describir qué se quiere mejorar, reducir, proteger, sostener o recuperar                                      |
| justificación             | mostrar decisión, oportunidad, obligación o prioridad de origen y su referencia                               |
| propietario funcional     | mostrar la función responsable del resultado, sin inferir permiso desde el cargo                              |
| indicador principal       | mostrar la métrica registrada, versión y propósito de decisión; exactamente uno por objetivo                  |
| línea base                | mostrar valor/distribución, periodo, corte, población, versión, calidad y evidencia                           |
| meta                      | mostrar operador, valor/rango aprobado, unidad, horizonte, vigencia y fuente de decisión                      |
| drivers                   | mostrar métricas/factores, dirección esperada, evidencia, controlabilidad y nivel de confianza cuando aplique |
| guardrails                | mostrar resultado/riesgo protegido, métrica, límite/regla, estado y tratamiento previsto                      |
| población                 | mostrar inclusiones, exclusiones y estados computables                                                        |
| dimensiones               | mostrar únicamente dimensiones gobernadas y autorizadas                                                       |
| periodo                   | mostrar horizonte y ventanas de evaluación                                                                    |
| calendario/zona horaria   | conservar semántica temporal de la métrica                                                                    |
| fuentes                   | mostrar referencias propietarias autorizadas, no copias de detalle innecesarias                               |
| calidad                   | conservar estado DQ de dependencias críticas                                                                  |
| confianza                 | mostrar nivel diagnóstico cuando el objetivo deriva de hipótesis o investigación                              |
| segmentos                 | mostrar cortes predefinidos relevantes y su protección                                                        |
| cadencia                  | distinguir actualización, cálculo, revisión y evaluación                                                      |
| regla de evaluación       | explicar cómo se determina comparabilidad y cumplimiento                                                      |
| tratamiento de guardrails | explicar qué significa un incumplimiento para la evaluación del objetivo                                      |
| evidencia                 | mostrar referencias seguras a snapshots, consultas, versiones y decisiones                                    |

Dos objetivos con el mismo nombre narrativo se presentan como coordenadas distintas si difieren materialmente en métrica, versión, población, baseline, meta, horizonte o guardrails.

---

#### 7. Estados transversales de preparación

La experiencia utiliza los estados transversales ya definidos para describir preparación y evidencia; no crea un enum UX paralelo.

| Estado                   | Presentación UX006                                                                   | Prohibición                                 |
| ------------------------ | ------------------------------------------------------------------------------------ | ------------------------------------------- |
| `ESPECIFICADO`           | contrato documental suficiente identificado                                          | no presentarlo como implementado o validado |
| `PENDIENTE_DE_EVIDENCIA` | mostrar exactamente qué evidencia falta y qué decisión queda condicionada            | no rellenar el dato con supuestos           |
| `BLOQUEADO`              | mostrar dependencia crítica, efecto sobre medición y propietario de resolución       | no mostrar medición oficial saludable       |
| `VALIDADO`               | solo reflejar evidencia reproducible proveniente del proceso que realmente lo valide | no asignarlo por redacción documental       |
| `IMPLEMENTADO`           | solo reflejar materialización técnica u operativa real                               | no asignarlo por diseño UX                  |
| `NO_APLICA`              | excluir una dimensión/guardrail concreto con justificación y propietario             | no usarlo como equivalente a dato faltante  |
| `FUERA_DE_ALCANCE`       | indicar que la decisión pertenece a otra tarea o proceso propietario                 | no ocultar una obligación propia de UX006   |

---

#### 8. Cadena UX obligatoria de objetivo

```text
ORIGEN EMPRESARIAL
→ OBJETIVO
→ KPI PRINCIPAL
→ LÍNEA BASE
→ META
→ DRIVERS
→ GUARDRAILS
→ PLAN DE MEDICIÓN
→ PUERTA DE MEDICIÓN OFICIAL
→ ELEGIBILIDAD PARA ACCIÓN O EXPERIMENTO
```

Reglas:

1. una oportunidad de UX005 puede iniciar la ficha conservando diagnóstico, confianza, evidencia, población, periodo y límites;
2. no se permite presentar una meta como lista para gobernarse antes de resolver KPI, baseline y contexto;
3. un objetivo puede existir por obligación, riesgo o prioridad aunque no provenga de diagnóstico causal;
4. un driver conserva el nivel de evidencia real y no se convierte en causa por aparecer junto al objetivo;
5. todo riesgo material conocido requiere guardrail o decisión `NO_APLICA` justificada;
6. la acción se diseña únicamente cuando el plan de medición puede comprobar resultados con suficiente claridad;
7. no todo objetivo exige experimento;
8. una brecha de calidad remite a UX004; una brecha causal remite a UX005; una brecha de definición remite a UX002.

---

#### 9. KPI principal

Cada objetivo presenta exactamente **un KPI principal** como respuesta primaria de éxito.

Reglas UX:

- consumir una métrica registrada y versionada;
- no crear una fórmula local para la ficha de objetivo;
- mostrar nombre empresarial antes del identificador técnico, conservando este último para trazabilidad autorizada;
- permitir métricas secundarias sin presentarlas como resultados primarios competidores;
- permitir que la misma métrica sea KPI, driver o guardrail en objetivos distintos sin duplicar definición;
- identificar cuando una métrica aún no puede soportar medición oficial;
- no declarar KPI globales por frecuencia, popularidad o posición visual;
- navegar a UX002 para definición y a UX003 para análisis profundo.

---

#### 10. Línea base

La línea base deberá mostrar como mínimo:

- métrica y versión;
- valor o distribución observada;
- población;
- periodo de observación;
- corte;
- granularidad;
- dimensiones;
- unidad o moneda;
- fuentes;
- calidad DQ;
- cobertura;
- regla de agregación;
- referencia reproducible cuando aplique.

Métodos documentales preservados:

| Método                        | Uso                                                      | Condición UX                                                     |
| ----------------------------- | -------------------------------------------------------- | ---------------------------------------------------------------- |
| periodo fijo observado        | ventana histórica cerrada y comparable                   | mostrar periodo, corte y cobertura definidos antes de evaluación |
| referencia histórica agregada | varios periodos comparables resumidos de forma gobernada | mostrar regla de agregación, estacionalidad y exclusiones        |
| cohorte o segmento comparable | población emparejada o segmento de referencia            | mostrar dimensiones, elegibilidad y diferencias materiales       |

Reglas:

1. forecast, presupuesto o escenario no sustituyen el observado base;
2. una fuente `BLOQUEADO` no produce baseline oficial;
3. `NO EVALUADO`, `EN OBSERVACIÓN` o `DEGRADADO` conservan su estado real;
4. datos faltantes no se convierten en cero;
5. una corrección posterior no sobrescribe silenciosamente la línea base original;
6. una ruptura semántica detiene la comparación directa hasta reconciliar versiones.

---

#### 11. Meta y sus cinco formas semánticas

Toda meta visible conserva indicador, versión, operador, valor/rango, unidad, población, horizonte, vigencia, evaluación, fuente, propietario, supuestos y relación con baseline.

| Forma                         | Semántica UX                                                 | Evaluación conceptual                                         |
| ----------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------- |
| punto                         | alcanzar un valor concreto                                   | resultado = valor objetivo bajo tolerancia declarada          |
| mínimo                        | no quedar por debajo                                         | resultado ≥ mínimo aprobado                                   |
| máximo                        | no superar                                                   | resultado ≤ máximo aprobado                                   |
| rango                         | permanecer entre límites                                     | inferior ≤ resultado ≤ superior                               |
| cambio respecto de línea base | mover el resultado una magnitud absoluta o relativa definida | comparar contra baseline bajo versión y población compatibles |

Reglas:

- la interfaz no inventa valores de meta;
- “mejorar”, “reducir” o “aumentar” no sustituyen una meta evaluable cuando se declara medición oficial;
- un presupuesto, forecast, SLA, contrato, benchmark o escenario solo informa la meta si existe una decisión explícita de usarlo;
- una meta porcentual no se evalúa con denominador inválido;
- una meta monetaria conserva moneda y conversión gobernada;
- un cambio de meta crea una decisión/version nueva para la vigencia definida y conserva la anterior;
- la meta no reescribe el valor real observado.

---

#### 12. Acción gobernada `SET_TARGET`

La experiencia presenta una decisión autoritativa de meta únicamente cuando el actor posee la capacidad exacta aplicable al objetivo.

Antes de una decisión de meta, UX006 deberá poder comprobar:

- objetivo exacto;
- KPI y versión;
- baseline;
- valor/rango propuesto;
- horizonte;
- población;
- segmentos;
- drivers;
- guardrails;
- plan de medición;
- calidad y versión aplicables;
- autoridad efectiva y segregación correspondiente.

Reglas:

1. propiedad funcional puede hacer elegible al actor, pero no sustituye autorización exacta;
2. una anomalía, forecast, presupuesto, escenario, recomendación o modelo no fija meta automáticamente;
3. baseline observado no se modifica para hacer alcanzable la meta;
4. un bloqueo crítico de baseline o fuente permanece visible y evita presentar la decisión como medición oficial lista;
5. fijar meta no crea alerta ni acción empresarial;
6. medir no concede autoridad para cambiar meta;
7. `DEFINE`, `CERTIFY`, `PUBLISH`, `ANNOTATE`, `EXPORT` y `ADMINISTER` permanecen acciones independientes;
8. un cambio concurrente de definición, calidad, meta, permiso o alcance obliga a revalidar antes del efecto;
9. una simulación o preview nunca representa una meta real vigente.

---

#### 13. Drivers

Cada driver muestra:

- métrica o factor;
- versión/definición;
- dirección esperada;
- población y ventana;
- evidencia favorable, contradictoria y faltante cuando corresponda;
- nivel de confianza diagnóstica si existe afirmación explicativa;
- propietario funcional;
- frecuencia de observación;
- condición de controlabilidad: controlable, parcialmente controlable o externo, cuando esté documentada;
- límite de interpretación.

La experiencia debe impedir que la proximidad visual entre driver y KPI sugiera causalidad no demostrada. Para relaciones descriptivas o asociativas usa lenguaje compatible con el nivel real de confianza. Una acción que dependa de causalidad no demostrada debe navegar a investigación o diseñar una evaluación apropiada en vez de ocultar la incertidumbre.

---

#### 14. Guardrails

Cada guardrail muestra:

- resultado o riesgo protegido;
- métrica y versión;
- población y dimensiones;
- límite, rango o regla de no deterioro;
- unidad;
- periodo y corte;
- calidad mínima;
- propietario;
- tratamiento ante incumplimiento;
- relación con KPI principal.

Reglas:

1. un riesgo material identificado requiere al menos un guardrail o `NO_APLICA` justificado;
2. el guardrail protege un resultado distinto o una restricción que el KPI podría empeorar;
3. cumplir el KPI no se presenta como éxito pleno cuando un guardrail bloqueante se incumple;
4. un guardrail de datos no sustituye certificación DQ;
5. el límite no ejecuta automáticamente pausa, reversa o cambio;
6. el límite conserva fuente de decisión;
7. redefinir un guardrail durante una intervención conserva versiones y afecta comparabilidad.

---

#### 15. Plan de medición — 28/28 elementos

Todo objetivo `ESPECIFICADO` deberá poder presentar o navegar los veintiocho elementos siguientes:

1. propósito de decisión;
2. propietario funcional;
3. indicador principal y versión;
4. línea base y evidencia;
5. meta y fuente de decisión;
6. drivers y límites de interpretación;
7. guardrails y tratamiento documental de incumplimiento;
8. población e inclusiones/exclusiones;
9. segmentos predefinidos;
10. dimensiones de comparación;
11. unidad, moneda y precisión;
12. calendario y zona horaria;
13. ventana de observación;
14. fecha de corte;
15. cadencia de actualización;
16. cadencia de revisión empresarial;
17. calidad mínima de fuentes;
18. cobertura mínima o condición de suficiencia cuando aplique;
19. tratamiento de faltantes, nulos y denominadores inválidos;
20. regla de comparabilidad con baseline;
21. tratamiento de datos tardíos y backfills;
22. condición para revaluar tras cambio semántico;
23. regla de evaluación de meta;
24. regla de evaluación de guardrails;
25. evidencia que deberá conservarse;
26. restricción de detalle sensible y poblaciones pequeñas;
27. condición de handoff hacia intervención;
28. tratamiento de correcciones y restatements.

**Reconciliación:** 28 esperados; 28 materializados; 0 faltantes; 0 duplicados.

La UI diferencia cadencia de datos, cadencia de cálculo, cadencia de revisión y ventana de evaluación; no inventa una frecuencia universal.

---

#### 16. Puerta de medición oficial — 14/14 condiciones

Un objetivo solo se presenta como listo para medición oficial cuando se comprueba:

1. propietario funcional;
2. resultado empresarial definido;
3. KPI identificado y versionado;
4. baseline reproducible;
5. meta con fuente, operador, unidad y horizonte;
6. riesgos materiales con guardrail o exclusión `NO_APLICA` justificada;
7. población, segmentos, periodo y corte;
8. plan de medición completo;
9. fuentes críticas sin `BLOQUEADO`;
10. comparabilidad con baseline resuelta;
11. calidad compatible con el uso;
12. cualquier dependencia causal comunicada al nivel de confianza realmente alcanzado;
13. restricciones de autorización y privacidad identificadas;
14. evidencia suficiente para reproducir la evaluación.

Si una condición crítica falla, la experiencia conserva `PENDIENTE_DE_EVIDENCIA` o `BLOQUEADO`. No existe un botón visual que convierta una ficha incompleta en objetivo saludable.

---

#### 17. Seguimiento del objetivo antes de intervenir

Cuando exista valor actual autorizado, la ficha puede mostrar:

- valor actual y corte;
- baseline;
- meta vigente;
- distancia a meta con semántica compatible;
- estado de guardrails;
- calidad y cobertura;
- segmentos predefinidos;
- cambios de definición;
- periodos parciales;
- información faltante.

Reglas:

- distancia a meta no implica tendencia ni causalidad;
- una ventana incompleta se presenta como parcial;
- una meta terminal no se declara incumplida antes del cierre salvo hitos predefinidos;
- cero, nulo, no aplica, desconocido, no recibido, pendiente y denominador no disponible permanecen distinguibles;
- ausencia de observación no prueba cumplimiento;
- resultados agregados no se generalizan automáticamente a segmentos.

---

#### 18. Portafolio de objetivos y conflictos

La vista de portafolio puede ordenar o filtrar únicamente objetivos autorizados por:

- propietario;
- dominio;
- estado transversal de preparación;
- horizonte;
- KPI;
- calidad;
- presencia de guardrail afectado;
- dependencia de investigación o evidencia;
- relación con intervención cuando exista.

No se crea un score universal de prioridad. La experiencia mantiene visibles, cuando apliquen, impacto esperado/protegido, urgencia, confianza, calidad de medición, riesgo, restricciones, dependencias y propietario.

Cuando objetivos compartan población, recursos o métricas, la experiencia debe advertir posibles conflictos y desplazamientos. Mejorar un objetivo no permite ocultar deterioro de otro resultado material.

---

#### 19. Handoff desde investigación

Cuando UX005 origine el objetivo, el handoff conserva:

- señal/diagnóstico u oportunidad de origen;
- conclusión y nivel de confianza;
- evidencia favorable, contradictoria y faltante;
- población;
- periodo y corte;
- impacto observado o potencial;
- factores/mecanismos relevantes;
- alternativas abiertas;
- propietario funcional;
- límites de generalización;
- calidad de dependencias.

UX006 no reescribe la conclusión diagnóstica. Si la evidencia causal es insuficiente, el objetivo puede orientarse a aprendizaje o protección, pero un driver no se presenta como causa demostrada.

---

#### 20. Expediente de intervención — 33/33 coordenadas

La experiencia de acción trabaja sobre un expediente de intervención evaluable. Deberá poder resolver:

1. objetivo y versión;
2. origen de la intervención;
3. propietario funcional;
4. hipótesis o mecanismo;
5. acción propuesta;
6. tipo de intervención;
7. necesidad de experimento: sí, no o no evaluable, con justificación;
8. diseño de evaluación;
9. responsable de ejecución;
10. aprobador;
11. unidad de intervención;
12. población elegible;
13. asignación;
14. exposición prevista;
15. KPI y versión;
16. baseline;
17. meta;
18. drivers;
19. guardrails;
20. segmentos;
21. ventanas;
22. calidad mínima;
23. confianza de origen;
24. riesgos de actuar, no actuar y ejecutar parcialmente;
25. cambios concurrentes;
26. criterio de pausa;
27. criterio de reversa;
28. evidencia de ejecución;
29. evidencia de exposición;
30. regla de análisis;
31. decisión de cierre;
32. aprendizaje;
33. reproducibilidad.

**Reconciliación:** 33 coordenadas esperadas; 33 materializadas; 0 faltantes; 0 duplicadas.

La experiencia separa visualmente propuesta, diseño, ejecución observada y comprobación. La existencia del expediente no autoriza la intervención ni prueba que haya sido ejecutada.

---

#### 21. Puerta previa de intervención — 20/20 condiciones

Solo se presenta una intervención como documentalmente lista para una eventual ejecución cuando constan:

1. objetivo identificado;
2. propietario funcional;
3. KPI versionado;
4. baseline reproducible o limitación aceptada que impida declarar efecto;
5. meta vigente o propósito de aprendizaje explícito;
6. guardrails materiales;
7. población elegible y unidad de intervención;
8. acción concreta;
9. mecanismo o hipótesis;
10. responsable de ejecución;
11. autoridad de aprobación identificada;
12. riesgos de actuar y no actuar;
13. decisión sobre necesidad de experimento;
14. diseño de evaluación previo a exposición;
15. criterios de pausa/reversa cuando apliquen;
16. ventana y cortes;
17. calidad mínima compatible;
18. restricciones de autorización, privacidad, seguridad, inocuidad, cumplimiento o capacidad;
19. evidencia que deberá demostrar ejecución y exposición;
20. regla de cierre y aprendizaje.

Una puerta completa sigue siendo documental. No crea permiso de cambio ni dispara ejecución.

---

#### 22. Seis clases de intervención

|    # | Clase                                                 | Propósito                                                                          | Identificación causal                                                                           | Restricción UX                                                                             |
| ---: | ----------------------------------------------------- | ---------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
|    1 | corrección obligatoria                                | eliminar incumplimiento, riesgo crítico o defecto cuya remediación es obligatoria  | puede no requerir experimento para decidir actuar; sí requiere comprobar resultado y guardrails | no usar experimento para aplazar una obligación de seguridad, legal o integridad           |
|    2 | ajuste operativo reversible                           | modificar una regla, secuencia, nivel, asignación o práctica que puede restaurarse | depende de incertidumbre causal y riesgo                                                        | reversibilidad debe ser real y documentada                                                 |
|    3 | cambio de proceso o política                          | modificar una forma gobernada de operar                                            | alta cuando se pretende atribuir impacto al cambio                                              | requiere versión, vigencia y control de cambios concurrentes                               |
|    4 | intervención de comunicación, capacitación o adopción | cambiar conocimiento, comportamiento o adopción                                    | depende de si se necesita demostrar efecto sobre resultado final                                | actividad realizada no equivale a adopción ni a resultado                                  |
|    5 | piloto controlado                                     | limitar alcance para comprobar operación, riesgo y señal de resultado              | puede usar comparación; no implica causalidad automáticamente                                   | piloto sin comparador no se presenta como experimento causal                               |
|    6 | experimento deliberado                                | crear variación controlada para estimar efecto de una intervención                 | sí; existe para identificación causal                                                           | requiere ética, autorización, elegibilidad, asignación, exposición y guardrails gobernados |

**Reconciliación:** 6 clases esperadas; 6 materializadas; 0 faltantes; 0 duplicadas.

La clase de intervención no asigna por sí sola una técnica estadística. Una corrección obligatoria no se retrasa para conservar un control si una obligación exige actuar. Un piloto reduce alcance, pero no se denomina causal sin un diseño compatible.

---

#### 23. Seis diseños de evaluación y techo de interpretación

|    # | Diseño                                      | Estructura mínima                                                           | Techo por diseño aislado                                                                      | Condición crítica                                                                    |
| ---: | ------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------ |
|    1 | seguimiento pre/post de una sola población  | baseline y periodo posterior bajo misma definición                          | `ASOCIACION` como máximo para atribución causal                                               | cambios concurrentes y tendencia permanecen alternativas                             |
|    2 | comparación contemporánea no aleatoria      | intervención y comparador elegible en la misma ventana                      | hasta `HIPOTESIS_RESPALDADA` salvo estrategia de identificación adicional                     | diferencias basales y selección deben medirse y tratarse                             |
|    3 | diseño cuasi-experimental gobernado         | comparador o contrafactual y supuestos explícitos                           | puede alcanzar `EVIDENCIA_CAUSAL`                                                             | supuestos, sensibilidad y tendencias deben quedar documentados                       |
|    4 | despliegue escalonado controlado            | unidades reciben intervención en momentos predefinidos con comparabilidad   | puede alcanzar `EVIDENCIA_CAUSAL` o `EFECTO_COMPROBADO` si la asignación y diseño lo soportan | calendario, contaminación y cambios simultáneos deben controlarse                    |
|    5 | switchback o alternancia temporal gobernada | periodos de intervención/control predefinidos sobre unidades aptas          | puede alcanzar `EFECTO_COMPROBADO` cuando controla carryover, temporalidad y exposición       | efectos persistentes o estacionalidad pueden invalidar la comparación                |
|    6 | experimento aleatorizado controlado         | asignación aleatoria gobernada, control, exposición y análisis predefinidos | puede alcanzar `EFECTO_COMPROBADO`                                                            | aleatorización, cumplimiento, interferencia, pérdidas y guardrails deben verificarse |

**Reconciliación:** 6 diseños esperados; 6 materializados; 0 faltantes; 0 duplicados.

Reglas UX:

- el nombre del diseño no garantiza un nivel de confianza;
- el diseño se presenta como preespecificado únicamente si quedó definido antes de observar resultados;
- cambios posteriores crean versión nueva y quedan visibles;
- un pre/post de una sola población no se estiliza como experimento causal;
- p-value, significancia o precisión predictiva no sustituyen tamaño de efecto, relevancia empresarial o identificación causal;
- el nivel `EFECTO_COMPROBADO` solo se muestra cuando la evidencia gobernada realmente permite ese nivel.

---

#### 24. Diseño preespecificado

Antes de exposición, la ficha de evaluación deberá poder registrar o presentar, según autorización:

- pregunta de decisión;
- objetivo e hipótesis;
- intervención;
- unidad de asignación;
- unidad de análisis;
- población elegible;
- inclusiones/exclusiones;
- comparador/control cuando exista;
- método de asignación;
- KPI principal;
- meta o efecto de interés;
- guardrails;
- segmentos predefinidos;
- baseline;
- duración prevista;
- estabilización;
- faltantes;
- no adherencia/exposición parcial;
- contaminación/interferencia;
- cambios concurrentes;
- regla analítica;
- suficiencia de evidencia;
- criterio de pausa;
- criterio de reversa;
- regla de cierre;
- versión del diseño.

La UI diferencia lo preespecificado de lo añadido después de observar resultados.

---

#### 25. Población, asignación, exposición y cumplimiento

```text
POBLACIÓN ELEGIBLE
→ quién o qué puede recibir la intervención

ASIGNADO
→ unidad seleccionada para una condición

EXPUESTO
→ intervención realmente recibida según definición aprobada

CUMPLIÓ INTERVENCIÓN
→ intensidad o condición prevista realmente satisfecha
```

Reglas:

1. asignación sin exposición no cuenta como exposición plena;
2. exposición sin evidencia suficiente permanece pendiente;
3. exposición parcial, abandono, cruce de condición y contaminación quedan visibles;
4. el análisis declara si usa asignación, exposición o cumplimiento y sus limitaciones;
5. despliegue técnico no prueba uso efectivo;
6. comunicación enviada no prueba comprensión, adopción ni resultado;
7. el detalle de personas o poblaciones sensibles requiere autorización específica.

---

#### 26. Seis ventanas de intervención

|    # | Ventana               | Presentación UX006                                                                |
| ---: | --------------------- | --------------------------------------------------------------------------------- |
|    1 | baseline              | periodo observado previo definido por el objetivo                                 |
|    2 | preparación           | configuración, capacitación, asignación o readiness sin contabilizar efecto       |
|    3 | exposición            | periodo en que la intervención puede afectar la población                         |
|    4 | estabilización        | tiempo necesario antes de interpretar resultado cuando exista latencia/adaptación |
|    5 | evaluación            | ventana predefinida para KPI y guardrails                                         |
|    6 | seguimiento posterior | persistencia, reversión tardía o efectos no deseados posteriores                  |

No existe una duración universal. La experiencia muestra ventanas y cortes reales del expediente, no un calendario inventado.

---

#### 27. Responsabilidades separadas

La ficha distingue al menos:

| Función                   | Responsabilidad                                      | No obtiene por esa función                             |
| ------------------------- | ---------------------------------------------------- | ------------------------------------------------------ |
| propietario del resultado | resultado, prioridad y aceptación empresarial        | permiso técnico automático                             |
| decisor de intervenir     | decisión empresarial de actuar                       | capacidad de alterar métricas o seguridad              |
| aprobador del cambio      | autorización aplicable a la intervención concreta    | propiedad universal del resultado                      |
| responsable de ejecución  | preparar y ejecutar conforme a versión/alcance       | cambiar KPI/meta o declarar causalidad                 |
| responsable de medición   | corte, comparabilidad, calidad, análisis y evidencia | adoptar o revertir por sí solo                         |
| responsable de calidad    | estado DQ de fuentes                                 | alterar acción o meta por conveniencia                 |
| propietario del guardrail | decisión sobre riesgo protegido                      | autoridad sobre el KPI principal por defecto           |
| decisor final             | adoptar, ampliar, iterar, pausar, revertir o cerrar  | elevar retrospectivamente la confianza de la evidencia |

La misma persona solo acumula funciones cuando las autorizaciones independientes y la segregación aplicable lo permiten.

---

#### 28. Seguimiento de fidelidad de implementación

Antes de interpretar resultados, UX006 deberá poder mostrar si la intervención ocurrió como se diseñó:

- unidades asignadas con exposición verificable cuando la métrica sea válida;
- intensidad/dosis cuando aplique;
- secuencia;
- versión aplicada;
- retrasos;
- exclusiones no previstas;
- interrupciones;
- errores de configuración;
- cambios concurrentes;
- desviaciones aprobadas/no aprobadas;
- incidencias que alteren medición.

Una intervención mal ejecutada puede producir un resultado no concluyente. La UI no la convierte automáticamente en refutación del mecanismo.

---

#### 29. Guardrails durante una intervención

Reglas:

1. el estado de guardrails permanece visible junto al KPI cuando sea material;
2. un guardrail deteriorado no queda oculto por una mejora del KPI;
3. el límite por sí solo no ejecuta pausa ni reversa;
4. la acción prevista puede ser revisar, pausar, reducir exposición, revertir o escalar únicamente conforme al contrato y autoridad aplicables;
5. riesgos de seguridad, legalidad, privacidad, inocuidad o integridad conservan sus procesos propietarios;
6. un guardrail con fuente `BLOQUEADO` impide afirmar que el riesgo estuvo adecuadamente controlado;
7. cambios de versión del guardrail permanecen en historia.

---

#### 30. Pausa y reversa

La experiencia mantiene como conceptos distintos:

- **pausa**: suspensión controlada para revisar evidencia o riesgo;
- **reversa**: cambio empresarial/técnico propietario que deshace una intervención reversible;
- **cierre**: decisión empresarial sobre el expediente y su aprendizaje.

Una pausa conserva exposición y evidencia acumuladas. Una reversa no borra exposición ni resultados históricos. Las intervenciones irreversibles deben mostrar esa condición antes de cualquier ejecución futura.

UX006 no materializa el procedimiento técnico de reversa del dominio propietario.

---

#### 31. Cambios concurrentes

La experiencia permite registrar y mostrar cambios que pueden afectar interpretación, por ejemplo precio/promoción, inventario, proveedor, receta, capacidad, dotación, servicio, canal, cobertura, definición de métrica, incidentes, cambios tecnológicos, otra intervención o evento externo documentado.

El cambio concurrente se presenta como explicación alternativa o limitación; no invalida ni explica automáticamente el resultado.

---

#### 32. Comprobación del resultado — 18/18 dimensiones

Toda comprobación de cierre deberá considerar conjuntamente:

1. ejecución conforme al diseño;
2. población asignada y expuesta;
3. comparabilidad de KPI, baseline y meta;
4. calidad de datos;
5. resultado del KPI;
6. distancia/cumplimiento de meta cuando sea evaluable;
7. comportamiento de drivers;
8. comportamiento de guardrails;
9. segmentos predefinidos;
10. efectos no deseados;
11. cambios concurrentes;
12. pérdidas, contaminación o interferencia;
13. incertidumbre del método;
14. resultado observado frente a efecto atribuible;
15. nivel de confianza sustentable;
16. límites de generalización;
17. persistencia cuando exista seguimiento posterior;
18. decisión empresarial de cierre.

Un único valor favorable del KPI no satisface la comprobación.

---

#### 33. Resultado observado y efecto atribuible

La UI presenta en planos separados:

```text
RESULTADO OBSERVADO
→ qué ocurrió en KPI, drivers y guardrails

EFECTO ATRIBUIBLE
→ qué parte del cambio puede atribuirse razonablemente a la intervención bajo diseño y supuestos
```

Reglas:

- resultado observado puede existir sin efecto atribuible;
- cumplir meta no demuestra que la intervención la causó;
- no cumplir meta no demuestra efecto exactamente cero;
- una acción puede producir efecto favorable sin alcanzar aún la meta;
- KPI favorable con daño material en guardrails no se presenta como éxito pleno;
- un experimento sin efecto detectable puede producir aprendizaje útil;
- el residuo no explicado permanece visible.

---

#### 34. Siete decisiones de cierre

|    # | Decisión                | Semántica                                                        | Condición mínima                                                                                       |
| ---: | ----------------------- | ---------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
|    1 | `ADOPTAR`               | mantener la intervención dentro del alcance comprobado           | beneficio o resultado suficiente, riesgos aceptables y guardrails compatibles                          |
|    2 | `AMPLIAR`               | extender a una población o alcance adicional                     | resultado suficiente y justificación de transferibilidad; la ampliación crea una nueva coordenada      |
|    3 | `ITERAR`                | modificar hipótesis, acción o diseño y volver a evaluar          | aprendizaje concreto y nueva versión del expediente                                                    |
|    4 | `PAUSAR`                | suspender antes de una nueva decisión                            | riesgo, evidencia insuficiente o condición predefinida de pausa                                        |
|    5 | `REVERTIR`              | deshacer una intervención reversible                             | balance de riesgo/resultado o condición de reversa satisfecha y autoridad aplicable                    |
|    6 | `ESCALAR_INVESTIGACION` | regresar a diagnóstico o medición antes de intervenir nuevamente | resultado no concluyente, explicación alternativa o calidad insuficiente                               |
|    7 | `CERRAR_SIN_ADOPCION`   | terminar la iniciativa sin mantener la intervención              | ausencia de beneficio suficiente, riesgo no aceptable, inviabilidad o decisión empresarial documentada |

**Reconciliación:** 7 decisiones esperadas; 7 materializadas; 0 faltantes; 0 duplicados.

Reglas:

- solo una decisión representa la decisión vigente de una evaluación cerrada, sin borrar decisiones anteriores;
- `AMPLIAR` crea nueva coordenada y no demuestra efecto en la población nueva;
- `ITERAR` crea nueva versión de hipótesis, acción o diseño;
- `ESCALAR_INVESTIGACION` retorna a UX005/contrato diagnóstico cuando la evidencia es insuficiente;
- una adopción empresarial no aumenta retrospectivamente el nivel causal de la evidencia;
- resultados nulos o desfavorables permanecen visibles y producen aprendizaje.

---

#### 35. Aprendizaje

Todo cierre deberá presentar, cuando sea autorizado:

```text
QUÉ SE HIZO
QUÉ SE OBSERVÓ
QUÉ PUEDE ATRIBUIRSE
QUÉ NO PUDO DETERMINARSE
QUÉ GUARDRAILS O EFECTOS NO DESEADOS APARECIERON
QUÉ LIMITACIONES EXISTIERON
QUÉ DECISIÓN SE TOMÓ
DÓNDE PUEDE Y NO PUEDE GENERALIZARSE
```

El aprendizaje no reescribe resultados previos. Una iteración enlaza una nueva versión con la anterior.

---

#### 36. Matriz materializada de las 55 familias analíticas

Cada identidad conserva el rol contextual admitido y su condición canónica. `ESPECIFICADO` significa únicamente que la experiencia puede gobernar ese rol; no crea un objetivo, meta ni certificación.

##### Comercial — 11/11

|    # | Familia canónica                             | Roles contextuales                          | Condición UX006                                                                                            | Estado         |
| ---: | -------------------------------------------- | ------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | -------------- |
|    1 | ventas netas y brutas                        | KPI, driver, guardrail o métrica secundaria | usar base comercial/fiscal y población gobernadas; no confundir venta con margen                           | `ESPECIFICADO` |
|    2 | pedidos y conversión                         | KPI o driver                                | conversión requiere numerador y denominador gobernados; conteo de pedidos conserva su propia población     | `ESPECIFICADO` |
|    3 | ticket y unidades                            | KPI o driver                                | ticket usa transacciones elegibles y unidades compatibles; no dividir por filas de producto                | `ESPECIFICADO` |
|    4 | mezcla por producto, categoría, canal y sede | KPI contextual, driver o guardrail          | dimensiones y denominadores de participación deben reconciliar al total                                    | `ESPECIFICADO` |
|    5 | demanda por franja, día y temporada          | KPI o driver                                | demanda observada no equivale a demanda total; estacionalidad exige historia suficiente                    | `ESPECIFICADO` |
|    6 | disponibilidad perdida                       | KPI, driver o guardrail                     | permanece bloqueada para medición oficial sin intención y disponibilidad histórica reconciliadas           | `ESPECIFICADO` |
|    7 | cancelaciones, devoluciones y descuentos     | KPI, driver o guardrail                     | mantener cada fenómeno y denominador separados                                                             | `ESPECIFICADO` |
|    8 | promociones y efecto incremental             | KPI o driver                                | exposición y versión son previas; cualquier efecto causal conserva los límites de diagnóstico y evaluación | `ESPECIFICADO` |
|    9 | recurrencia y frecuencia                     | KPI o driver                                | identidad, finalidad, población y ventana deben estar gobernadas                                           | `ESPECIFICADO` |
|   10 | margen relacionado                           | KPI o guardrail                             | consumir margen económico gobernado; no recalcular costo localmente                                        | `ESPECIFICADO` |
|   11 | capacidad comercial no utilizada             | KPI contextual, driver o guardrail          | requiere denominador de capacidad compatible                                                               | `ESPECIFICADO` |

**Reconciliación:** 11 esperadas; 11 materializadas; 0 faltantes; 0 duplicadas.

##### Inventario, abastecimiento, proveedores y logística — 12/12

|    # | Familia canónica                        | Roles contextuales                 | Condición UX006                                                                     | Estado         |
| ---: | --------------------------------------- | ---------------------------------- | ----------------------------------------------------------------------------------- | -------------- |
|    1 | existencia disponible y comprometida    | KPI, driver o guardrail            | separar física, comprometida, cuarentena, tránsito y disponible                     | `ESPECIFICADO` |
|    2 | cobertura y días de inventario          | KPI, driver o guardrail            | requiere existencia elegible y tasa de demanda/consumo compatible                   | `ESPECIFICADO` |
|    3 | rotación y permanencia                  | KPI, driver o guardrail            | requiere inventario medio e historia/cohorte compatibles                            | `ESPECIFICADO` |
|    4 | faltantes y quiebres                    | KPI, driver o guardrail            | stock cero no prueba faltante o quiebre sin necesidad elegible                      | `ESPECIFICADO` |
|    5 | vencimiento, daño y pérdida             | KPI o guardrail                    | hechos y causas deben ser explícitos; cuarentena y disposición permanecen separadas | `ESPECIFICADO` |
|    6 | diferencias de conteo                   | KPI, driver o guardrail            | conservar signo, corte y relación antes/después del ajuste                          | `ESPECIFICADO` |
|    7 | cumplimiento de remisiones              | KPI o driver                       | preparación, despacho, recepción, faltante y cierre se evalúan por separado         | `ESPECIFICADO` |
|    8 | lead time y cumplimiento de proveedores | KPI o driver                       | requiere inicio contractual y recepción aceptada con promesa comparable             | `ESPECIFICADO` |
|    9 | compras urgentes                        | KPI o guardrail                    | solo hechos clasificados explícitamente como urgentes o de emergencia               | `ESPECIFICADO` |
|   10 | consumo versus plan                     | KPI o driver                       | requiere plan explícito de misma población, unidad, sede y ventana                  | `ESPECIFICADO` |
|   11 | costo de inventario                     | KPI o guardrail                    | valoración oficial consume método económico aprobado                                | `ESPECIFICADO` |
|   12 | capacidad de almacenamiento             | KPI contextual, driver o guardrail | requiere capacidad utilizable y unidad física compatible                            | `ESPECIFICADO` |

**Reconciliación:** 12 esperadas; 12 materializadas; 0 faltantes; 0 duplicadas.

##### Producción, rendimiento, capacidad, merma y calidad — 10/10

|    # | Familia canónica                            | Roles contextuales      | Condición UX006                                                                                     | Estado         |
| ---: | ------------------------------------------- | ----------------------- | --------------------------------------------------------------------------------------------------- | -------------- |
|    1 | demanda planificada versus producción       | KPI o driver            | requiere necesidad o plan aceptado y producción elegible comparable                                 | `ESPECIFICADO` |
|    2 | capacidad disponible y utilizada            | KPI, driver o guardrail | requiere denominador integral de capacidad en unidad compatible                                     | `ESPECIFICADO` |
|    3 | adherencia al programa                      | KPI o driver            | exige programa publicado y versionado con hitos y población                                         | `ESPECIFICADO` |
|    4 | rendimiento teórico y real                  | KPI o driver            | teoría y real deben reconciliar receta/versión, escala y unidad                                     | `ESPECIFICADO` |
|    5 | consumo estándar y real                     | KPI, driver o guardrail | estándar y real se comparan por ingrediente y unidad compatible                                     | `ESPECIFICADO` |
|    6 | merma, reproceso y aprovechamiento          | KPI, driver o guardrail | cada categoría requiere hecho explícito y denominador propio                                        | `ESPECIFICADO` |
|    7 | calidad, retención y rechazo                | KPI o guardrail         | control, resultado, retención, rechazo, reproceso y liberación permanecen separados                 | `ESPECIFICADO` |
|    8 | tiempo de ciclo                             | KPI o driver            | requiere hitos reales; espera, preparación, ejecución, pausa, retención y liberación no se colapsan | `ESPECIFICADO` |
|    9 | cumplimiento de liberación                  | KPI o guardrail         | producción terminada no equivale a lote liberado                                                    | `ESPECIFICADO` |
|   10 | costo y variación por lote, producto y sede | KPI, driver o guardrail | costo técnico no sustituye costo económico oficial                                                  | `ESPECIFICADO` |

**Reconciliación:** 10 esperadas; 10 materializadas; 0 faltantes; 0 duplicadas.

##### Servicio, clientes, fidelización, reputación y experiencia — 12/12

|    # | Familia canónica                                        | Roles contextuales                 | Condición UX006                                                                                | Estado         |
| ---: | ------------------------------------------------------- | ---------------------------------- | ---------------------------------------------------------------------------------------------- | -------------- |
|    1 | cumplimiento de promesa                                 | KPI o driver                       | promesa aceptada y versionada es requisito; solicitud no equivale a compromiso                 | `ESPECIFICADO` |
|    2 | tiempos de preparación, despacho y entrega              | KPI o driver                       | cada fase requiere eventos reales compatibles                                                  | `ESPECIFICADO` |
|    3 | pedidos completos                                       | KPI o driver                       | completitud se resuelve por líneas, cantidades, revisiones y sustituciones aceptadas           | `ESPECIFICADO` |
|    4 | reclamos y tiempo de resolución                         | KPI, driver o guardrail            | reclamo exige expediente y SLA o versión aplicable                                             | `ESPECIFICADO` |
|    5 | compensaciones                                          | KPI contextual, driver o guardrail | devolución, reembolso, descuento, cortesía, cupón y puntos permanecen distintos                | `ESPECIFICADO` |
|    6 | satisfacción y feedback                                 | KPI, driver o guardrail            | feedback interno, invitación y reputación externa permanecen separados                         | `ESPECIFICADO` |
|    7 | recurrencia, frecuencia y abandono                      | KPI o driver                       | abandono exige población elegible, ventana y observación completa                              | `ESPECIFICADO` |
|    8 | adquisición y activación                                | KPI o driver                       | adquisición y activación requieren eventos y origen gobernados                                 | `ESPECIFICADO` |
|    9 | fidelización, puntos y redenciones                      | KPI, driver o guardrail            | movimientos y redenciones se analizan por estado; saldo no sustituye ledger                    | `ESPECIFICADO` |
|   10 | reputación y temas recurrentes                          | KPI, driver o guardrail            | reputación pública requiere fuente externa gobernada; feedback interno permanece distinto      | `ESPECIFICADO` |
|   11 | reservas, no-show y utilización                         | KPI, driver o guardrail            | utilización requiere capacidad gobernada; reserva, cancelación y no-show son estados distintos | `ESPECIFICADO` |
|   12 | valor y rentabilidad del cliente cuando esté autorizado | KPI o guardrail                    | identidad y finalidad autorizadas, junto con rentabilidad gobernada, son requisitos            | `ESPECIFICADO` |

**Reconciliación:** 12 esperadas; 12 materializadas; 0 faltantes; 0 duplicadas.

##### Costos, rentabilidad, liquidez, presupuesto y escenarios — 10/10

|    # | Familia canónica              | Roles contextuales                      | Condición UX006                                                                                 | Estado         |
| ---: | ----------------------------- | --------------------------------------- | ----------------------------------------------------------------------------------------------- | -------------- |
|    1 | costos estándar y reales      | KPI, driver o guardrail                 | estándar y real usan método, versión, unidad, moneda y componentes comparables                  | `ESPECIFICADO` |
|    2 | variaciones                   | KPI o driver                            | cada variación conserva su base; costo, presupuesto, forecast, precio y cantidad no se colapsan | `ESPECIFICADO` |
|    3 | margen y contribución         | KPI o guardrail                         | exige ingreso realizado y costos trazables o variables elegibles                                | `ESPECIFICADO` |
|    4 | gastos                        | KPI, driver o guardrail                 | capturado, reconocido, aprobado, pagado, anulado y conciliado permanecen separados              | `ESPECIFICADO` |
|    5 | centros de costo              | driver, dimensión o métrica secundaria  | un centro es dimensión económica; no es KPI por sí mismo sin métrica definida sobre él          | `ESPECIFICADO` |
|    6 | presupuesto y forecast        | KPI contextual, driver o comparador     | presupuesto aprobado, revisión, forecast, escenario y real permanecen distintos                 | `ESPECIFICADO` |
|    7 | caja, bancos y tesorería      | KPI o guardrail                         | posición real exige saldos reconciliados y disponibilidad                                       | `ESPECIFICADO` |
|    8 | cartera y obligaciones        | KPI, driver o guardrail                 | saldo abierto deriva de reconocimiento menos aplicaciones válidas                               | `ESPECIFICADO` |
|    9 | rentabilidad multidimensional | KPI o guardrail                         | exige ingreso realizado, costos trazables, asignaciones y residuo visibles                      | `ESPECIFICADO` |
|   10 | escenarios y simulaciones     | driver, comparador o métrica secundaria | simulado no sustituye real, baseline ni efecto observado                                        | `ESPECIFICADO` |

**Reconciliación:** 10 esperadas; 10 materializadas; 0 faltantes; 0 duplicadas.

**Reconciliación global:** `11 + 12 + 10 + 12 + 10 = 55`; 55 esperadas; 55 materializadas; 55 identidades únicas; 0 faltantes; 0 duplicadas.

Reglas globales:

1. ninguna familia crea un objetivo automático;
2. ninguna familia se convierte en KPI hasta vincularse a una métrica registrada y a un objetivo concreto;
3. los estados y bloqueos de origen se heredan sin mejora silenciosa;
4. una familia con dependencia `BLOQUEADO` no produce medición oficial del componente afectado;
5. una familia `NO EVALUADO` puede soportar exploración visible, no baseline certificado;
6. una dimensión, comparador o escenario no se presenta como resultado real;
7. una familia puede combinar varias métricas con estados distintos y la experiencia conserva el estado de cada dependencia material;
8. no existe obligación de un objetivo por familia ni de una familia por objetivo.

---

#### 37. Cobertura de las catorce métricas de asistencia

Las métricas concretas de asistencia permanecen disponibles únicamente como métricas gobernadas dentro de un objetivo. UX006 no les asigna metas universales ni modifica sus fórmulas.

|    # | `metric_key`        | DQ heredado   | Decisión UX006                                                                                                                                                                                     |
| ---: | ------------------- | ------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|    1 | `scheduledShifts`   | `NO EVALUADO` | elegible contextualmente como KPI, driver, guardrail o métrica secundaria según semántica del objetivo; conserva `NO EVALUADO` y no recibe meta por defecto                                        |
|    2 | `attendedShifts`    | `NO EVALUADO` | elegible contextualmente como KPI, driver, guardrail o métrica secundaria según semántica del objetivo; conserva `NO EVALUADO` y no recibe meta por defecto                                        |
|    3 | `restDayCount`      | `NO EVALUADO` | elegible contextualmente como KPI, driver, guardrail o métrica secundaria según semántica del objetivo; conserva `NO EVALUADO` y no recibe meta por defecto                                        |
|    4 | `lateCount`         | `NO EVALUADO` | elegible contextualmente como KPI, driver, guardrail o métrica secundaria según semántica del objetivo; conserva `NO EVALUADO` y no recibe meta por defecto                                        |
|    5 | `noShowCount`       | `NO EVALUADO` | elegible contextualmente como KPI, driver, guardrail o métrica secundaria según semántica del objetivo; conserva `NO EVALUADO` y no recibe meta por defecto                                        |
|    6 | `openCount`         | `NO EVALUADO` | elegible contextualmente como KPI, driver, guardrail o métrica secundaria según semántica del objetivo; conserva `NO EVALUADO` y no recibe meta por defecto                                        |
|    7 | `missingCloseCount` | `BLOQUEADO`   | puede figurar en un objetivo o borrador contextual, pero no soporta baseline/medición oficial mientras persista el bloqueo; no se muestra como KPI saludable ni se neutraliza desde la experiencia |
|    8 | `autoCloseCount`    | `NO EVALUADO` | elegible contextualmente como KPI, driver, guardrail o métrica secundaria según semántica del objetivo; conserva `NO EVALUADO` y no recibe meta por defecto                                        |
|    9 | `departureCount`    | `NO EVALUADO` | elegible contextualmente como KPI, driver, guardrail o métrica secundaria según semántica del objetivo; conserva `NO EVALUADO` y no recibe meta por defecto                                        |
|   10 | `scheduledMinutes`  | `NO EVALUADO` | elegible contextualmente como KPI, driver, guardrail o métrica secundaria según semántica del objetivo; conserva `NO EVALUADO` y no recibe meta por defecto                                        |
|   11 | `netMinutes`        | `NO EVALUADO` | elegible contextualmente como KPI, driver, guardrail o métrica secundaria según semántica del objetivo; conserva `NO EVALUADO` y no recibe meta por defecto                                        |
|   12 | `incidentCount`     | `NO EVALUADO` | elegible contextualmente como KPI, driver, guardrail o métrica secundaria según semántica del objetivo; conserva `NO EVALUADO` y no recibe meta por defecto                                        |
|   13 | `attendanceRate`    | `BLOQUEADO`   | puede figurar en un objetivo o borrador contextual, pero no soporta baseline/medición oficial mientras persista el bloqueo; no se muestra como KPI saludable ni se neutraliza desde la experiencia |
|   14 | `punctualityRate`   | `BLOQUEADO`   | puede figurar en un objetivo o borrador contextual, pero no soporta baseline/medición oficial mientras persista el bloqueo; no se muestra como KPI saludable ni se neutraliza desde la experiencia |

**Reconciliación:** 14 esperadas; 14 materializadas; 14 claves únicas; 0 faltantes; 0 duplicadas; 11 `NO EVALUADO`; 3 `BLOQUEADO`.

Las tres bloqueadas permanecen exactamente `missingCloseCount`, `attendanceRate` y `punctualityRate`.

---

#### 38. Autorización, privacidad y segregación

Reglas obligatorias:

1. el portafolio se construye únicamente con objetivos y metadatos que el actor esté autorizado a conocer;
2. ver un objetivo no concede `SET_TARGET`;
3. `SET_TARGET` no concede `DEFINE`, `CERTIFY`, `PUBLISH`, `ANNOTATE`, `EXPORT` ni `ADMINISTER`;
4. ver un KPI no concede filas fuente;
5. ver una meta no concede editarla;
6. ver una acción propuesta no concede aprobarla ni ejecutarla;
7. ejecutar una intervención requiere la autorización del proceso propietario y no se deriva de la experiencia analítica;
8. comparar segmentos o poblaciones sensibles reevalúa protección y divulgación;
9. no se muestran opciones de filtro, conteos o errores que revelen objetivos, personas, clientes, proveedores, importes o poblaciones fuera del conjunto autorizado;
10. un principal técnico o `service_role` no sustituye actor empresarial;
11. las anotaciones autorizadas siguen siendo no autoritativas;
12. la identidad de aprobadores, responsables o participantes se minimiza según finalidad;
13. la evidencia sensible puede representarse mediante referencia segura;
14. cada salto a detalle o expediente propietario reevalúa autorización;
15. una acción masiva futura no se infiere de que varios objetivos sean visibles simultáneamente.

---

#### 39. Auditoría, historia y reproducibilidad

La experiencia deberá poder mostrar historia segura de decisiones sin convertirla en una segunda fuente de verdad.

Para objetivos y metas conserva, cuando exista evidencia:

- propuesta/origen;
- propietario;
- decisión y fecha;
- KPI/versión;
- baseline;
- meta y fuente;
- drivers y guardrails;
- plan de medición;
- cambios de población/horizonte/segmentos;
- motivo de revisión;
- relación con diagnóstico;
- relación con intervención;
- relación con restatement.

Para intervenciones conserva:

- quien propuso, aprobó, ejecutó, midió y decidió;
- timestamps;
- versiones de objetivo, acción y diseño;
- elegibilidad, asignación y exposición;
- consultas/modelos referenciados;
- fuentes/cortes;
- pausas/reversas;
- desviaciones;
- cambios concurrentes;
- resultados/guardrails;
- cambios de confianza;
- aprendizaje;
- decisiones anteriores y vigentes;
- iteraciones posteriores.

Una evidencia posterior no se presenta como disponible en una decisión histórica si no lo estaba entonces. Correcciones, backfills o cambios de definición que afecten baseline, KPI, meta o guardrail navegan al gobierno histórico correspondiente y no reescriben silenciosamente la ficha original.

---

#### 40. Navegación y handoffs con propietario documental exacto

| Necesidad detectada en UX006                                                        | Propietario documental                                    | Condición de handoff                                                                            |
| ----------------------------------------------------------------------------------- | --------------------------------------------------------- | ----------------------------------------------------------------------------------------------- |
| comprender definición, versión, fuente o linaje de KPI/driver/guardrail             | `DATA-UX-002`                                             | conservar objetivo, métrica, versión, población y corte                                         |
| analizar tendencia, comparación o composición del KPI                               | `DATA-UX-003`                                             | conservar métrica, filtros, población, periodo, corte y meta solo como referencia               |
| resolver calidad, frescura, cobertura, conciliación o certificación                 | `DATA-UX-004`                                             | conservar recurso, uso, periodo, versión y corte; no cambiar DQ en UX006                        |
| investigar causa, anomalía, alternativa o confianza                                 | `DATA-UX-005`                                             | conservar objetivo, señal, evidencia, población y límites; `ESCALAR_INVESTIGACION` retorna aquí |
| publicar, distribuir o preservar reportes, exportaciones, suscripciones o snapshots | `DATA-UX-007`                                             | antes de materializar salidas oficiales o portables                                             |
| validar comprensión, tiempos y decisiones con usuarios reales                       | `DATA-UX-008`                                             | antes de declarar readiness del flujo analítico completo                                        |
| semántica de objetivos, baseline, meta, drivers, guardrails y medición              | `DATA-DOM-015`                                            | siempre que se cree o cambie la definición del objetivo                                         |
| clases de intervención, diseños, exposición, comprobación y cierre                  | `DATA-DOM-016`                                            | siempre que se diseñe o evalúe una acción/intervención                                          |
| correcciones históricas y restatements                                              | `DATA-DOM-017`                                            | antes de reexpresar baseline, evaluación o publicación previa                                   |
| autorización de `SET_TARGET` y otras capacidades de gobierno                        | `DATA-AUTH-003`                                           | antes de cualquier decisión autoritativa de meta o gobierno                                     |
| auditoría de consultas, modelos y recomendaciones                                   | `DATA-AUTH-004`                                           | antes de instrumentar trazabilidad operativa                                                    |
| capa semántica, cálculos, consultas, caché y snapshots                              | `DATA-INT-002`                                            | antes de materializar técnicamente la experiencia                                               |
| BI, hojas, modelos analíticos e inteligencia artificial                             | `DATA-INT-004`                                            | antes de integrar herramientas externas o automatización analítica                              |
| ejecución física de una intervención concreta                                       | tarea o paquete propietario del comportamiento modificado | solo cuando exista una intervención real, autorización aplicable y paquete físico definido      |

No queda una brecha sustantiva detectada por UX006 sin propietario documental y condición de salida.

---

#### 41. Accesibilidad, densidad y lenguaje

La experiencia es administrativa/analítica y puede ser densa, pero deberá conservar:

- objetivo, KPI, meta/horizonte y estado de preparación en un orden semántico claro;
- texto equivalente para estado, tendencia, riesgo y guardrails; el color no es señal única;
- foco visible y navegación por teclado;
- encabezados y relaciones programáticamente determinables;
- representación textual equivalente para gráficos de progreso o efecto;
- divulgación progresiva de los veintiocho elementos del plan y treinta y tres coordenadas de intervención;
- tooltips nunca como único lugar de información esencial;
- redacción humana para bloqueos: qué impide medir o actuar, qué se conserva y qué propietario debe resolver;
- diferenciación explícita entre dato ausente, no autorizado, pendiente de evidencia y `BLOQUEADO`;
- preservación de contexto al navegar entre objetivo, investigación, calidad y tablero sin preservar privilegios obsoletos;
- reflow sin depender de tablas horizontales para comprender la decisión principal.

---

#### 42. Cobertura de requisitos de prueba vigente

La conducta materializada por UX006 ya se encuentra protegida por requisitos canónicos vigentes:

- `TREQ-DATA-005` protege de forma directa la separación entre señal, diagnóstico, hipótesis, acción, experimento, responsable, línea base, meta, indicador principal, drivers, guardrails, ventana de medición, segmentos, resultado, confianza, aprendizaje y decisión de cierre/iteración, además de exigir comparación contra baseline/guardrails y conservar efectos no deseados;
- `TREQ-DATA-002` protege identidad, versión, propósito, fórmula, población, dimensiones, unidad, fuente, calidad y comparación de métricas;
- `TREQ-DATA-003` protege calidad, cobertura, datos tardíos, backfills, reconciliación y linaje;
- `TREQ-DATA-004` protege contexto analítico, corte, calidad, artefactos separados, drill-down y reproducibilidad de salidas;
- los requisitos UX vigentes protegen densidad, contexto, privacidad, fuente de verdad, trazabilidad y no exposición indirecta.

UX006 especializa esas obligaciones como experiencia de objetivo, meta, drivers, guardrails, acción, intervención, comprobación y cierre. No introduce una conducta ejecutable nueva fuera de esa cobertura ni cambia prioridad, modalidad, relaciones o destino de implementación de los requisitos existentes.

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea materializa en experiencia obligaciones ya protegidas para objetivos medibles, línea base, meta, KPI principal, drivers, guardrails, acciones, experimentos, exposición, comprobación, confianza, aprendizaje y cierre. No introduce una regla ejecutable independiente, un nuevo estado operativo, una fórmula, una transición física, un permiso, una integración o una automatización que requiera una fila nueva o modificación del registro.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 43. Criterios de aceptación

1. prioridad empresarial, objetivo y meta permanecen conceptos distintos;
2. métrica, KPI, driver y guardrail permanecen roles distintos;
3. baseline, meta, benchmark, forecast y escenario permanecen separados;
4. cada objetivo contiene exactamente un KPI principal;
5. el KPI consume una métrica registrada/versionada y no redefine fórmula;
6. ninguna métrica se declara KPI global por conveniencia visual;
7. una misma métrica puede asumir roles contextuales distintos sin duplicar definición;
8. la ficha materializa las veinte coordenadas mínimas del objetivo;
9. la línea base conserva versión, periodo, corte, población, unidad y calidad;
10. baseline observado no se sustituye por forecast o escenario;
11. una dependencia `BLOQUEADO` no produce baseline oficial;
12. `NO EVALUADO`, `EN OBSERVACIÓN`, `DEGRADADO` y `BLOQUEADO` conservan semántica real;
13. se preservan exactamente tres métodos documentales de baseline;
14. se preservan exactamente cinco formas semánticas de meta;
15. ninguna forma de meta contiene un valor numérico inventado;
16. toda meta concreta conserva fuente, propietario, operador, unidad, horizonte y vigencia;
17. un presupuesto, forecast, SLA, contrato o benchmark no se convierte automáticamente en meta;
18. `SET_TARGET` se resuelve como capacidad separada;
19. propiedad funcional no sustituye permiso de `SET_TARGET`;
20. fijar una meta no crea alerta ni acción empresarial;
21. `SET_TARGET` no cambia KPI, baseline observado, calidad ni resultado medido;
22. driver no equivale a causa demostrada;
23. driver conserva evidencia y confianza diagnóstica cuando exista afirmación explicativa;
24. guardrail protege un riesgo o resultado material distinto del KPI;
25. todo riesgo material identificado tiene guardrail o `NO_APLICA` justificado;
26. un KPI favorable no oculta guardrail material incumplido;
27. se materializan exactamente 28 elementos del plan de medición;
28. se materializan exactamente 14 condiciones de medición oficial;
29. una condición crítica faltante conserva pendiente o bloqueo;
30. calidad DQ, confianza diagnóstica y cumplimiento de meta permanecen ejes distintos;
31. comparabilidad conserva métrica/version, grano, población, calendario, periodo, dimensiones, unidad/moneda, cobertura y fuentes;
32. cero, nulo, no aplica, desconocido, no recibido, pendiente y denominador no disponible permanecen distinguibles;
33. cadencia de datos, cálculo, revisión y ventana de evaluación permanecen separadas;
34. el portafolio no crea un score universal de prioridad;
35. conflictos entre objetivos permanecen visibles cuando son materiales;
36. el handoff desde UX005 conserva confianza, evidencia, población, impacto y límites;
37. se materializan exactamente 33 coordenadas de intervención;
38. se materializan exactamente 20 condiciones previas de intervención;
39. una puerta documental completa no autoriza ejecución;
40. recomendación, decisión y acción permanecen separadas;
41. acción y experimento permanecen separados;
42. intervención diseñada y ejecutada permanecen distintas;
43. asignación, exposición y cumplimiento permanecen distintos;
44. se preservan exactamente seis clases de intervención;
45. una corrección obligatoria no se retrasa para mantener un control experimental cuando existe obligación de actuar;
46. un piloto sin comparador no se presenta como causal;
47. se preservan exactamente seis diseños de evaluación;
48. pre/post de una sola población tiene techo `ASOCIACION` para atribución causal por sí solo;
49. el nombre del diseño no garantiza nivel de confianza;
50. cambios posteriores al diseño conservan nueva versión;
51. se preservan exactamente seis ventanas de intervención;
52. no se inventa duración universal;
53. propietario, aprobador, ejecutor, medición y decisión final permanecen funciones distinguibles;
54. ejecutar no concede cambiar KPI/meta;
55. medir no concede adoptar o revertir;
56. fidelidad de implementación se comprueba antes de interpretar resultado;
57. guardrails permanecen visibles durante intervención;
58. guardrail no crea pausa/reversa automática;
59. pausa y reversa permanecen conceptos distintos;
60. una reversa no borra exposición ni historia;
61. cambios concurrentes se conservan como alternativas o limitaciones;
62. se materializan exactamente 18 dimensiones de comprobación;
63. resultado observado y efecto atribuible permanecen separados;
64. cumplir meta no demuestra causalidad;
65. un resultado no concluyente no se presenta como éxito;
66. el residuo no explicado permanece visible;
67. se preservan exactamente siete decisiones de cierre;
68. `ADOPTAR`, `AMPLIAR`, `ITERAR`, `PAUSAR`, `REVERTIR`, `ESCALAR_INVESTIGACION` y `CERRAR_SIN_ADOPCION` permanecen distintas;
69. ampliar no demuestra efecto en población nueva;
70. iterar crea nueva versión y no sobrescribe resultados previos;
71. todo cierre conserva aprendizaje y límites;
72. resultados negativos o nulos no se eliminan;
73. IA, BI o modelos no pueden fijar metas, aprobar acciones, declarar efecto comprobado ni ejecutar cambios por sí solos;
74. se materializan 55/55 familias analíticas con distribución 11 + 12 + 10 + 12 + 10;
75. las 55 identidades son únicas y no existen faltantes ni duplicados;
76. ninguna familia crea un objetivo automático ni una nueva `metric_key`;
77. se materializan 14/14 métricas de asistencia;
78. se preservan exactamente 11 métricas `NO EVALUADO` y 3 `BLOQUEADO`;
79. `missingCloseCount`, `attendanceRate` y `punctualityRate` permanecen las tres bloqueadas;
80. ninguna de las catorce métricas recibe meta universal ni mejora DQ por aparecer en un objetivo;
81. búsquedas, filtros y conteos operan únicamente sobre objetivos/metadatos autorizados;
82. ver objetivo no concede fijar meta, publicar, exportar ni ejecutar;
83. cada expansión de detalle reevalúa autorización y protección;
84. decisiones e historia no se reescriben silenciosamente;
85. correcciones y restatements conservan vínculo con versión original;
86. cada handoff tiene propietario documental exacto y condición de salida;
87. no se crean rutas, componentes, endpoints, tablas, vistas, jobs, modelos físicos, permisos, roles, grants o excepciones;
88. no se modifica código, DDL, DML, RLS, RPC, datos, migraciones, backfills, despliegues, automatizaciones, experimentos reales ni Supabase;
89. no se crea ni modifica ningún requisito de prueba;
90. `DATA-UX-007` permanece únicamente reservada.

---

#### 44. Balance de cierre

| Control                                   |                  Resultado |
| ----------------------------------------- | -------------------------: |
| Familias analíticas                       |                **55 / 55** |
| Distribución                              | **11 + 12 + 10 + 12 + 10** |
| Métricas de asistencia                    |                **14 / 14** |
| Métricas `NO EVALUADO` / `BLOQUEADO`      |                 **11 / 3** |
| Métodos de baseline                       |                  **3 / 3** |
| Formas de meta                            |                  **5 / 5** |
| Elementos de plan de medición             |                **28 / 28** |
| Condiciones de medición oficial           |                **14 / 14** |
| Coordenadas de intervención               |                **33 / 33** |
| Condiciones previas de intervención       |                **20 / 20** |
| Clases de intervención                    |                  **6 / 6** |
| Diseños de evaluación                     |                  **6 / 6** |
| Ventanas de intervención                  |                  **6 / 6** |
| Dimensiones de comprobación               |                **18 / 18** |
| Decisiones de cierre                      |                  **7 / 7** |
| Valores de meta inventados                |                      **0** |
| Nuevas `metric_key`                       |                      **0** |
| Acciones empresariales ejecutadas         |                      **0** |
| Experimentos ejecutados                   |                      **0** |
| Permisos, roles o grants creados          |                      **0** |
| Cambios físicos                           |                      **0** |
| Requisitos de prueba nuevos o modificados |                      **0** |

---

#### 45. Continuidad

ÚLTIMA TAREA APROBADA
`DATA-UX-005 — Diseñar espacio de investigación de variaciones, anomalías y causas`

TAREA ACTUAL APROBADA
`DATA-UX-006 — Diseñar objetivos, metas, drivers, guardrails y acciones de mejora`

SIGUIENTE TAREA RESERVADA
`DATA-UX-007 — Diseñar reportes, exportaciones, suscripciones y snapshots versionados`


### ✅ DATA-UX-007 — Diseñar reportes, exportaciones, suscripciones y snapshots versionados

**Estado:** APROBADA
**Tarea anterior:** `DATA-UX-006 — Diseñar objetivos, metas, drivers, guardrails y acciones de mejora` — APROBADA
**Tarea siguiente:** `DATA-UX-008 — Validar comprensión, tiempos y decisiones con usuarios reales` — RESERVADA
**Tipo de tarea:** documental; diseño normativo y materializado de la experiencia de reportes, exportaciones, suscripciones, snapshots oficiales, ediciones versionadas, correcciones y restatements sin alterar fuentes ni ejecutar distribución productiva
**Bloque:** AB — Analítica, indicadores y datos maestros
**Fase:** exclusivamente documental
**Implementación técnica:** no autorizada
**Código, componentes, DDL, DML, migraciones, RLS, RPC, grants, cambios de permisos, datos, backfills, replays, reconstrucciones productivas, publicaciones, redistribuciones, jobs, automatizaciones, despliegues o cambios en Supabase:** no autorizados
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Diseñar la experiencia canónica mediante la cual una persona autorizada pueda comprender, consultar y distinguir reportes, exportaciones, suscripciones y snapshots versionados sin convertir una representación derivada en fuente de verdad, sin ocultar el corte o la calidad de los datos y sin perder la edición histórica cuando exista una corrección o restatement.

La experiencia deberá permitir responder, como mínimo:

```text
qué artefacto estoy viendo
qué pregunta empresarial responde
qué versión y edición estoy consumiendo
qué periodo y corte representa
qué población, filtros y dimensiones contiene
qué métricas y versiones utiliza
qué calidad, frescura y cobertura tenían sus entradas
si es vivo, provisional, degradado, oficial, histórico o simulado
si existe una edición posterior o un restatement
qué cambió respecto de la edición anterior
qué puedo consultar, publicar, exportar o suscribir según mi autorización
qué evidencia permite reproducir el resultado
qué información está protegida o suprimida
qué ocurrió en una entrega de suscripción concreta
qué relación existe entre el artefacto y la fuente propietaria
```

La tarea no implementa motores de reporting, generación física de archivos, jobs de suscripción, almacenamiento de snapshots, conectores BI, replays, reconstrucciones ni distribución automática. Esas materializaciones pertenecen a las tareas DATA-INT y paquetes posteriores autorizados.

---

#### 2. Resultado sustantivo

Queda materializado el diseño de experiencia con los siguientes resultados:

- cuatro familias foco de UX007 con comportamiento explícito: reporte, exportación, suscripción y snapshot oficial;
- preservación visible del universo D008 de seis familias: tablero, reporte, exportación, suscripción, alerta y snapshot oficial;
- separación entre vista viva, reporte oficial, exportación, suscripción, alerta, snapshot oficial y simulación;
- coordenada común de artefacto con diecinueve componentes obligatorios;
- puerta de publicación oficial con diez condiciones verificables;
- experiencia específica para reporte, exportación, suscripción y snapshot;
- ocho ejes de versión que impiden reducir la historia a un único número de versión;
- seis operaciones históricas diferenciadas: reintento, replay, backfill, corrección de fuente, reconstrucción y restatement;
- experiencia dual para valor o edición original y valor o edición restated;
- navegación histórica que conserva ediciones retiradas o superadas sin presentarlas como vigentes;
- divulgación progresiva de treinta y dos elementos de reproducibilidad;
- reglas de autorización que mantienen `PUBLISH` y `EXPORT` como capacidades distintas y reevalúan acceso en cada entrega de suscripción;
- experiencia de calidad que preserva los estados D007 y evita estilizar datos bloqueados como oficiales;
- decisión explícita para las catorce métricas actuales de asistencia, manteniendo once `NO EVALUADO` y tres `BLOQUEADO`;
- decisión explícita sobre los reportes de asistencia JSON y XLSX actuales como artefactos técnicamente existentes pero no elegibles hoy para publicación oficial completa;
- matriz de elegibilidad de las cincuenta y cinco familias analíticas sin crear cincuenta y cinco reportes obligatorios;
- estados vacíos, degradados, bloqueados y no comparables tratados sin sustituir ausencia por cero;
- fronteras exactas con DATA-UX-003, DATA-UX-005, DATA-UX-006 y DATA-UX-008;
- cero cambios físicos y cero cambios de requisitos de prueba.

---

#### 3. Decisión principal

Vento OS adopta una experiencia de **artefacto analítico versionado por contexto, edición y evidencia**.

```text
FUENTE PROPIETARIA
→ conserva los hechos y maestros autoritativos

CAPA SEMÁNTICA
→ conserva definición y versión de métricas

CALIDAD / CERTIFICACIÓN
→ determina si las entradas son aptas para el uso declarado

ARTEFACTO ANALÍTICO
→ representa un resultado derivado para una pregunta, población, periodo y corte

EDICIÓN
→ conserva qué se publicó o generó en un momento concreto

HISTORIA
→ preserva ediciones anteriores, reconstrucciones y restatements

AUTORIZACIÓN
→ decide qué puede consultar, publicar, exportar o recibir cada actor

REPRODUCIBILIDAD
→ permite reconstruir qué datos, versiones y decisiones produjeron el resultado
```

La interfaz no podrá presentar “último” como sinónimo de “única verdad histórica”. La edición vigente y la edición originalmente publicada son conceptos distintos cuando existe corrección o restatement.

---

#### 4. Fuentes y decisiones heredadas

UX007 consume sin redefinir:

- `DATA-DOM-004` para identidad, fórmula, versión, unidad, moneda, granularidad, filtros y dimensiones de métricas;
- `DATA-DOM-005` para tiempo, cortes, calendarios, snapshots y comparabilidad;
- `DATA-DOM-006` para ingestión, datos tardíos, backfills, correcciones, reconciliación y linaje;
- `DATA-DOM-007` para frescura, cobertura, calidad, certificación y estados `NO EVALUADO`, `EN OBSERVACIÓN`, `CERTIFICADO`, `DEGRADADO` y `BLOQUEADO`;
- `DATA-DOM-008` para las seis familias de artefacto y sus contratos de publicación;
- `DATA-DOM-009` a `DATA-DOM-013` para las cincuenta y cinco familias analíticas;
- `DATA-DOM-014` para diagnóstico, evidencia y límites de causalidad;
- `DATA-DOM-015` para objetivos, baseline, meta, drivers, guardrails y plan de medición;
- `DATA-DOM-016` para intervenciones, seguimiento, comprobación y aprendizaje;
- `DATA-DOM-017` para versionado, correcciones históricas, reconstrucciones, restatements y reproducibilidad;
- `DATA-AUTH-001` y `DATA-AUTH-002` para conjunto autorizado, minimización, poblaciones pequeñas, comparación, detalle y protección de salidas;
- `DATA-AUTH-003` para la separación de `DEFINE`, `CERTIFY`, `PUBLISH`, `SET_TARGET`, `ANNOTATE`, `EXPORT` y `ADMINISTER`;
- `DATA-AUTH-004` para evidencia de consulta, descarga, suscripción, alerta, modelo y recomendación;
- `DATA-UX-003` para tableros por dominio, comparaciones y drill-down;
- `DATA-UX-004` para calidad, frescura, conciliación y certificación visibles;
- `DATA-UX-005` para investigación de variaciones, anomalías y causas;
- `DATA-UX-006` para objetivos, metas, drivers, guardrails y acciones;
- `DATA-INT-001` a `DATA-INT-004` como propietarios futuros de contratos físicos, capa semántica, snapshots, consultas, BI, hojas de cálculo, modelos e inteligencia artificial.

UX007 no eleva certificación, no cambia definiciones, no concede permisos y no transforma una entrega histórica en fuente de verdad.

---

#### 5. Fronteras conceptuales obligatorias

```text
VISTA VIVA ≠ TABLERO ≠ REPORTE OFICIAL ≠ EXPORTACIÓN ≠ SUSCRIPCIÓN ≠ ALERTA ≠ SNAPSHOT OFICIAL ≠ SIMULACIÓN
```

```text
PUBLICADO ≠ CERTIFICADO
```

```text
PUBLICAR ≠ EXPORTAR
```

```text
EXPORTACIÓN ≠ FUENTE DE VERDAD
```

```text
SUSCRIPCIÓN ≠ ACCESO PERMANENTE
```

```text
ALERTA ≠ DIAGNÓSTICO ≠ DECISIÓN ≠ ACCIÓN
```

```text
SNAPSHOT OFICIAL ≠ RESPALDO TÉCNICO ≠ ESTADO VIVO ≠ RESTATEMENT
```

```text
EDICIÓN ORIGINAL ≠ EDICIÓN RESTATED
```

```text
CORRECCIÓN DE FUENTE ≠ RECONSTRUCCIÓN ≠ RESTATEMENT
```

```text
VERSIÓN SEMÁNTICA ≠ EDICIÓN DE PUBLICACIÓN ≠ VERSIÓN TÉCNICA
```

```text
GENERAR UNA EXPORTACIÓN ≠ OBTENERLA
```

```text
CONFIGURAR UNA SUSCRIPCIÓN ≠ RECIBIR UNA ENTREGA
```

```text
CERO MEDIDO ≠ SIN DATOS ≠ DENOMINADOR INVÁLIDO ≠ NO_APLICA ≠ PENDIENTE
```

---

#### 6. Universo D008 y foco UX007

La experiencia conserva las seis familias D008. UX007 profundiza cuatro de ellas sin redefinir las dos restantes.

|    # | Familia D008     | Tratamiento en UX007                  | Frontera principal                                                                                       |
| ---: | ---------------- | ------------------------------------- | -------------------------------------------------------------------------------------------------------- |
|    1 | tablero          | contexto y enlace de origen o destino | su diseño principal pertenece a DATA-UX-003; una vista viva no se vuelve snapshot por conservación local |
|    2 | reporte          | diseño completo                       | edición, corte, estado de publicación, calidad, historia y relación con restatement deben ser visibles   |
|    3 | exportación      | diseño completo                       | es una proyección portable autorizada; no amplía detalle ni se vuelve fuente de verdad                   |
|    4 | suscripción      | diseño completo                       | configura entregas futuras; cada entrega reevalúa autorización, calidad, corte y versión                 |
|    5 | alerta           | contexto y enlace                     | su regla y señal pertenecen a D008; UX007 no la convierte en diagnóstico ni acción                       |
|    6 | snapshot oficial | diseño completo                       | es una edición inmutable; cualquier corrección material produce una reconstrucción o edición vinculada   |

**Reconciliación:** 6 familias esperadas; 6 materializadas; 0 faltantes; 0 duplicadas. Foco UX007: 4 familias; 4 materializadas; 0 faltantes; 0 duplicadas.

---

#### 7. Coordenada común de artefacto: diecinueve componentes

Todo reporte, exportación, suscripción materializada o snapshot que se muestre deberá poder resolver, mediante información visible o divulgación progresiva, los siguientes diecinueve componentes:

1. pregunta empresarial;
2. propósito y audiencia;
3. clase de artefacto;
4. periodo;
5. fecha/hora de corte;
6. zona horaria;
7. filtros;
8. dimensiones;
9. métricas y versiones;
10. unidad y moneda;
11. frescura;
12. cobertura;
13. calidad/certificación;
14. fuentes y dependencias;
15. última actualización o generación;
16. responsable;
17. trazabilidad al detalle autorizado;
18. estado de publicación;
19. relación con publicación anterior.

La vista compacta prioriza identidad, periodo, corte, estado, calidad y edición. El resto permanece a un nivel de detalle accesible sin forzar al usuario a interpretar metadatos técnicos antes de comprender el resultado.

---

#### 8. Jerarquía visual común

La experiencia ordena la información en cinco niveles lógicos:

##### 8.1. Identidad y vigencia

Muestra primero:

- nombre del artefacto;
- clase;
- periodo;
- corte;
- edición o versión visible;
- estado de publicación;
- indicador de si existe una edición posterior.

##### 8.2. Resultado

Muestra el contenido empresarial principal sin esconder:

- unidad o moneda;
- población resumida;
- filtros que cambien materialmente la interpretación;
- calidad cuando no sea `CERTIFICADO` para el uso declarado.

##### 8.3. Contexto analítico

Permite abrir:

- métricas y versiones;
- dimensiones;
- fuentes;
- cobertura;
- frescura;
- dependencias;
- notas o limitaciones autorizadas.

##### 8.4. Historia

Permite distinguir:

- edición original;
- ediciones posteriores;
- reconstrucciones;
- restatements;
- retiros de vigencia;
- relación entre ediciones.

##### 8.5. Evidencia

Permite llegar, según autorización, a:

- snapshot de contexto;
- linaje;
- consulta o modelo referenciado;
- evidencia de publicación;
- evidencia de entrega;
- detalle autorizado.

---

#### 9. Puerta de publicación oficial: diez condiciones

Un artefacto solo podrá presentarse como publicación oficial cuando se hayan resuelto las diez condiciones canónicas:

1. definiciones y versiones de métricas identificadas;
2. periodo, corte y zona horaria definidos;
3. filtros, dimensiones, unidad y moneda explícitos cuando sean materiales;
4. fuentes y dependencias identificables;
5. frescura y cobertura conocidas;
6. reconciliación completada o tratada explícitamente;
7. ninguna dependencia obligatoria se encuentra `BLOQUEADO`;
8. si se presenta como certificado, la certificación de dependencias permite el uso declarado;
9. autorización de actor y destinatario evaluada de manera independiente;
10. existe información suficiente para reproducir o explicar el resultado sin convertir el artefacto en fuente de verdad.

Si una condición crítica falla, la experiencia no maquilla el estado. El resultado permanece provisional, degradado, bloqueado o pendiente según la condición real.

---

#### 10. Estados visibles de publicación y calidad

UX007 no crea un enum técnico nuevo. La interfaz combina el estado de publicación con el estado de calidad heredado.

| Situación                                         | Presentación obligatoria                      | Presentación prohibida                               |
| ------------------------------------------------- | --------------------------------------------- | ---------------------------------------------------- |
| entrada `CERTIFICADO` y puerta oficial satisfecha | publicación oficial con corte y edición       | ocultar corte o tratar la edición como fuente        |
| `NO EVALUADO`                                     | provisional con estado visible                | certificado por apariencia o por existir el archivo  |
| `EN OBSERVACIÓN`                                  | condición y limitación visibles               | normalizarlo visualmente como saludable              |
| `DEGRADADO`                                       | degradación, alcance y uso permitido visibles | certificado sin condición                            |
| dependencia crítica `BLOQUEADO`                   | bloqueo visible y motivo                      | publicación oficial completa dependiente de ese dato |
| dato faltante                                     | ausencia explícita                            | cero fabricado                                       |
| denominador inválido                              | no evaluable con explicación                  | porcentaje cero fabricado                            |
| simulación                                        | etiqueta de escenario o simulación            | resultado observado u oficial                        |

---

#### 11. Experiencia de reporte

Un reporte es una composición analítica preparada para una pregunta y audiencia concretas. La experiencia deberá mostrar como mínimo:

- nombre y propósito;
- responsable;
- periodo y corte;
- fecha de generación o publicación;
- zona horaria;
- métricas y versiones;
- filtros y dimensiones;
- unidad o moneda;
- frescura, cobertura y calidad;
- fuentes y dependencias;
- condición oficial, provisional o degradada;
- edición;
- relación con una edición anterior cuando exista corrección o restatement.

Reglas:

1. una nueva emisión no altera la edición anterior;
2. una edición corregida queda enlazada a la original;
3. un cambio de formato sin cambio semántico no fuerza restatement numérico;
4. un reporte que dependa de un elemento crítico `BLOQUEADO` no se presenta como oficial completo;
5. una edición puede retirarse de uso vigente sin desaparecer del historial;
6. un reporte no concede acceso adicional a sus hechos fuente;
7. el detalle autorizado se reevalúa al navegar, no se hereda de la mera apertura del reporte;
8. el usuario puede identificar rápidamente si está viendo la edición vigente o una histórica;
9. cuando una corrección afecte una cifra publicada, la experiencia muestra la relación original-restated;
10. el diseño visual puede evolucionar sin fingir que la edición histórica tuvo ese diseño.

---

#### 12. Cabecera canónica de reporte

La cabecera deberá resolver, sin obligar a abrir un panel secundario:

```text
NOMBRE DEL REPORTE
CLASE / ESTADO DE PUBLICACIÓN
PERIODO · CORTE · ZONA HORARIA
EDICIÓN VIGENTE O HISTÓRICA
CALIDAD / LIMITACIÓN MATERIAL
RESPONSABLE
```

Cuando exista restatement, deberá añadirse una señal inequívoca de “edición corregida” o equivalente semántico, con acceso a la comparación entre ediciones.

---

#### 13. Cuerpo y anexos de reporte

El cuerpo prioriza la pregunta empresarial y puede contener:

- KPI principales;
- tablas;
- gráficos;
- comparaciones;
- comentarios autorizados;
- segmentación;
- hallazgos;
- referencias a diagnóstico u objetivo.

Los anexos o paneles de detalle concentran:

- definición de métricas;
- fuentes;
- calidad;
- metodología;
- linaje;
- historial de ediciones;
- evidencia de reproducibilidad.

Un anexo no se usa para esconder una limitación que cambie materialmente la interpretación del resultado principal.

---

#### 14. Experiencia de exportación

Una exportación representa únicamente la proyección autorizada de un conjunto o resultado.

Antes de generar la proyección, la experiencia deberá poder confirmar:

- recurso de origen;
- edición o corte de origen;
- población;
- filtros y dimensiones;
- columnas o campos autorizados;
- unidad o moneda;
- formato disponible;
- clasificación o protección relevante;
- finalidad cuando sea exigible;
- condición de calidad;
- si la proyección está ligada a una publicación oficial o a una vista ad hoc.

Después de la generación, deberá conservarse la referencia de contexto necesaria para saber qué se produjo, sin convertir el archivo resultante en fuente de verdad.

---

#### 15. Reglas de exportación protegida

1. `EXPORT` se autoriza de forma independiente de `PUBLISH` y de la consulta ordinaria;
2. una proyección nunca amplía población, territorio, detalle o campos;
3. celdas, columnas o poblaciones suprimidas por protección no reaparecen por cambiar de formato;
4. el formato no altera la semántica de métricas;
5. la exportación conserva periodo, corte, filtros, dimensiones, versiones, unidad, moneda y calidad;
6. una nueva generación crea una nueva evidencia de salida; no reescribe la anterior;
7. una exportación ligada a un reporte oficial conserva la edición del reporte de origen;
8. una exportación ad hoc no se presenta como snapshot oficial;
9. una exportación histórica no se sustituye silenciosamente cuando existe restatement;
10. una versión corregida se produce como nueva generación vinculada a la anterior cuando corresponda;
11. la obtención efectiva y la generación son hechos auditables distintos cuando el mecanismo físico lo permita;
12. un archivo exportado no adquiere autoridad para actualizar la fuente propietaria.

---

#### 16. Experiencia de suscripción

La suscripción es una regla gobernada para evaluar y, cuando corresponda, entregar un artefacto o conjunto analítico en el futuro. La experiencia deberá declarar:

- artefacto o conjunto de métricas;
- política de versión;
- periodo o ventana;
- filtros y dimensiones;
- cadencia o condición;
- zona horaria de evaluación y entrega;
- formato de salida;
- destinatario o audiencia autorizada;
- estado mínimo de calidad exigido para una entrega oficial;
- tratamiento de datos degradados, bloqueados o incompletos;
- relación con reporte o snapshot cuando aplique;
- finalidad empresarial;
- estado de la regla;
- última evaluación disponible cuando exista implementación futura.

UX007 no define un job, scheduler, canal físico ni mecanismo de reintento.

---

#### 17. Regla de entrega de suscripción

Cada entrega futura constituye una coordenada nueva y no hereda autoridad de una entrega anterior.

Antes de cada entrega deberán reevaluarse, por los componentes propietarios futuros:

1. actor o destinatario vigente;
2. autorización;
3. clasificación;
4. población;
5. campos o proyección;
6. periodo y corte;
7. versión de métricas;
8. calidad;
9. frescura;
10. cobertura;
11. estado de publicación cuando la entrega dependa de una edición oficial;
12. restricciones del canal o destino cuando apliquen.

La experiencia debe poder mostrar por entrega si fue producida, suprimida, bloqueada o falló, sin imponer esos términos como enum técnico universal antes de su materialización.

---

#### 18. Historial de suscripción

La vista de una suscripción deberá separar:

```text
REGLA DE SUSCRIPCIÓN
→ qué está configurado actualmente

HISTORIAL DE CAMBIOS
→ cómo cambió la regla y quién tomó la decisión autorizada

EVALUACIONES
→ cuándo se evaluó la regla

ENTREGAS
→ qué edición, corte y versión se distribuyó realmente
```

Una modificación de la regla no reescribe entregas previas. Una persona retirada de la audiencia no conserva acceso futuro por haber sido destinataria anteriormente.

---

#### 19. Experiencia de snapshot oficial

Un snapshot oficial es una edición analítica inmutable de una coordenada publicada.

La experiencia deberá mostrar o permitir resolver:

- identidad del snapshot;
- periodo y corte;
- contexto organizacional o territorial;
- filtros y dimensiones;
- métricas y versiones;
- unidad o moneda;
- fuentes y dependencias;
- calidad y certificación vigentes al publicar;
- fecha/hora de generación y publicación;
- responsable de publicación;
- edición;
- relación con edición anterior o posterior;
- estado de vigencia;
- existencia de reconstrucción o restatement posterior.

El snapshot no es un respaldo técnico ni una copia editable de la fuente.

---

#### 20. Inmutabilidad y corrección de snapshots

1. una edición oficial publicada no se sobrescribe;
2. datos tardíos no cambian silenciosamente el snapshot;
3. una corrección de fuente no muta la edición histórica;
4. una reconstrucción crea una nueva representación distinguible;
5. un restatement crea una edición vinculada que declara qué corrigió;
6. retirar una edición del uso vigente no borra su existencia;
7. el acceso a ediciones antiguas continúa sujeto a autorización;
8. la reconstrucción debe indicar si usa las versiones históricas originales o versiones actuales;
9. una edición reconstruida bajo una nueva semántica no se presenta como la publicación original;
10. la materialización física de snapshots pertenece a `DATA-INT-002`.

---

#### 21. Vista viva, provisional, oficial y simulación

| Clase de presentación | Qué representa                                                     | Obligación visible             | Nunca significa                 |
| --------------------- | ------------------------------------------------------------------ | ------------------------------ | ------------------------------- |
| viva                  | proyección actual de una coordenada                                | corte y frescura               | edición histórica inmutable     |
| provisional           | resultado pendiente de cierre, reconciliación o calidad suficiente | condición pendiente            | publicación oficial certificada |
| oficial               | edición publicada que superó la puerta aplicable                   | edición, corte y estado        | fuente de verdad operativa      |
| degradada             | resultado cuyo uso admite una limitación de calidad                | limitación y alcance           | certificación plena             |
| simulación            | escenario construido con supuestos                                 | supuestos y condición simulada | resultado observado             |
| histórica             | edición que ya no es la vigente o fue sucedida                     | fecha, edición y relación      | error que deba ocultarse        |

---

#### 22. Ocho ejes de versión

La experiencia deberá evitar un único campo “versión” ambiguo. D017 exige distinguir ocho ejes cuando sean materiales:

1. identidad empresarial;
2. versión semántica;
3. versión de esquema o contrato;
4. versión de transformación;
5. versión de maestros o dimensiones;
6. versión técnica;
7. edición de publicación;
8. versión de diagnóstico, objetivo o intervención relacionada.

La vista principal muestra solo los ejes necesarios para comprender vigencia y comparabilidad. El detalle de reproducibilidad conserva el resto.

---

#### 23. Selector de edición e historia

Cuando un artefacto tenga más de una edición, la experiencia deberá permitir:

- identificar la edición vigente;
- abrir una edición histórica autorizada;
- ver fecha de publicación;
- ver corte;
- ver motivo de sucesión;
- distinguir corrección, reconstrucción o restatement;
- comparar original y vigente cuando sean comparables;
- ver si cambió la versión semántica;
- ver si cambió la calidad o certificación;
- ver qué consumidores o entregas pudieron depender de la edición anterior cuando esa información esté autorizada.

El selector no ordena únicamente por “más reciente”. Debe preservar la relación semántica entre ediciones.

---

#### 24. Seis operaciones históricas

UX007 representa sin colapsar las seis operaciones D017:

|    # | Operación            | Presentación UX                                            | Regla                                                 |
| ---: | -------------------- | ---------------------------------------------------------- | ----------------------------------------------------- |
|    1 | reintento            | nuevo intento correlacionado                               | no crea por sí solo una nueva verdad empresarial      |
|    2 | replay               | repetición controlada de procesamiento                     | debe conservar versión y propósito del replay         |
|    3 | backfill             | incorporación gobernada de datos faltantes o tardíos       | no sobrescribe una publicación oficial sin evaluación |
|    4 | corrección de fuente | cambio autorizado en el origen                             | puede o no afectar una publicación; se evalúa impacto |
|    5 | reconstrucción       | recomputación de una coordenada histórica                  | debe indicar versiones y relación con el original     |
|    6 | restatement          | nueva edición oficial que corrige o reexpresa una anterior | preserva original y nueva edición vinculadas          |

**Reconciliación:** 6 operaciones esperadas; 6 materializadas; 0 faltantes; 0 duplicadas.

---

#### 25. Experiencia de restatement

Cuando exista restatement, la interfaz no reemplaza un valor por otro sin contexto. La vista deberá poder mostrar:

- artefacto o resultado original;
- clase de artefacto;
- periodo original;
- corte original;
- fecha de publicación original;
- versión de métrica original;
- fuentes o transformaciones originales cuando sean materiales;
- valor o resultado original;
- motivo del evento de corrección;
- periodo y población restated;
- corte restated;
- versiones restated;
- fuentes restated;
- valor o resultado restated;
- diferencia absoluta cuando sea válida;
- diferencia relativa cuando exista denominador válido;
- componentes no comparables;
- calidad o certificación de cada edición;
- responsable de la decisión;
- responsable de certificación o publicación cuando corresponda;
- consumidores o artefactos derivados afectados cuando estén disponibles;
- relación con diagnósticos, objetivos o intervenciones;
- decisión de comunicación o redistribución;
- evidencia autorizada.

No existe un umbral universal de materialidad inventado por UX007.

---

#### 26. Vista comparativa original versus restated

La comparación deberá privilegiar la claridad:

| Campo           | Edición original             | Edición restated                    |
| --------------- | ---------------------------- | ----------------------------------- |
| publicación     | fecha original               | fecha de restatement                |
| periodo/corte   | coordenada original          | coordenada corregida                |
| métrica/versión | versión original             | versión vigente para el restatement |
| valor           | resultado original           | resultado corregido                 |
| calidad         | estado original              | estado de la nueva edición          |
| diferencia      | base de comparación          | magnitud válida o “no comparable”   |
| motivo          | contexto disponible entonces | evento que justificó reexpresión    |

La edición original siempre permanece identificable. “Restated” no significa que el dato original nunca haya sido publicado.

---

#### 27. Decisión de restatement en la experiencia

La interfaz deberá ser compatible con las reglas D017:

- actualización normal de un periodo abierto sin publicación inmutable previa no se presenta como restatement;
- dato tardío que afecta una edición oficial exige evaluación, reconstrucción y decisión gobernada;
- corrección sin impacto numérico oficial puede no requerir restatement numérico;
- corrección que cambia una cifra oficial puede producir una edición restated;
- bug técnico que no cambia semántica mantiene la versión semántica y puede cambiar versión técnica;
- una nueva semántica prospectiva no muta retrospectivamente una edición previa;
- una reconstrucción con nueva semántica queda distinguida de la serie original;
- un cambio solo de layout no se presenta como corrección numérica;
- una corrección material de metadatos puede requerir una edición vinculada aun sin cambio de cifra;
- un cambio de calidad sin cambio numérico no borra la calidad que tenía la edición original.

---

#### 28. Reproducibilidad: treinta y dos elementos resolubles

La experiencia deberá permitir llegar progresivamente a los treinta y dos elementos mínimos necesarios para reconstruir o explicar una edición cuando apliquen:

1. identidad del artefacto;
2. clase de artefacto;
3. edición;
4. propósito;
5. audiencia;
6. periodo;
7. corte;
8. zona horaria;
9. población;
10. inclusiones y exclusiones;
11. filtros;
12. dimensiones;
13. métricas;
14. versiones semánticas;
15. unidad;
16. moneda;
17. fuentes;
18. versiones de esquema o contrato;
19. transformaciones;
20. versiones de transformación;
21. maestros o dimensiones vigentes;
22. versiones técnicas materiales;
23. frescura;
24. cobertura;
25. calidad o certificación;
26. reconciliaciones relevantes;
27. datos tardíos o backfills aplicables;
28. consultas, modelos o reglas por referencia;
29. responsable de generación;
30. responsable de publicación;
31. relación con edición anterior o posterior;
32. evidencia suficiente para reproducir la coordenada sin duplicar contenido sensible.

La ausencia histórica de un insumo no se completa por inferencia. El expediente queda `PENDIENTE_DE_EVIDENCIA` o `BLOQUEADO` según la dependencia.

---

#### 29. Divulgación progresiva de reproducibilidad

La densidad se distribuye así:

```text
NIVEL 1 — COMPRENDER
artefacto, periodo, corte, edición, estado, calidad

NIVEL 2 — INTERPRETAR
métricas, filtros, dimensiones, población, unidad, fuentes

NIVEL 3 — COMPARAR HISTORIA
ediciones, restatement, diferencias, motivo, calidad por edición

NIVEL 4 — REPRODUCIR
versiones, transformaciones, maestros, consultas/modelos, reconciliación, evidencia
```

Una limitación crítica nunca queda escondida exclusivamente en el nivel 4.

---

#### 30. Autorización en reportes y snapshots

La lectura de un reporte o snapshot se resuelve sobre el conjunto autorizado. La experiencia deberá cumplir:

1. abrir un artefacto no concede detalle fuente;
2. cambiar de edición reevalúa autorización si cambia recurso, población o clasificación;
3. una edición histórica no se vuelve pública por haber sido publicada internamente antes;
4. drill-down reevalúa recurso y nivel de detalle;
5. poblaciones pequeñas o sensibles aplican protección A002;
6. metadatos sensibles también pueden requerir minimización;
7. una edición retirada conserva protección;
8. la UI no usa ocultamiento visual como sustituto de autorización server-side futura.

---

#### 31. `PUBLISH` y `EXPORT` permanecen separados

UX007 representa ambas acciones como decisiones distintas:

| Acción    | Efecto                                                   | No concede                                                                                  |
| --------- | -------------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| `PUBLISH` | emitir una edición oficial para una audiencia autorizada | certificación, exportación, mayor detalle, cambio de meta o fuente                          |
| `EXPORT`  | producir una proyección portable autorizada              | publicación oficial, nueva finalidad, mayor población, detalle fuente o autoridad histórica |

Una persona que pueda abrir un reporte no recibe por inferencia ninguna de estas capacidades. Una persona que pueda publicar no recibe exportación por inferencia, y viceversa.

---

#### 32. Auditoría visible y evidencia correlacionable

UX007 consume A004 sin convertir auditoría en una segunda fuente de verdad.

Las seis familias auditables se mantienen distinguibles:

|    # | Familia A004  | Relación con UX007                                                                         |
| ---: | ------------- | ------------------------------------------------------------------------------------------ |
|    1 | consulta      | apertura, filtros o drill-down protegidos pueden producir evidencia lógica correlacionable |
|    2 | descarga      | generación y obtención efectiva de una proyección portable se distinguen cuando aplique    |
|    3 | suscripción   | gobierno de la regla, evaluación y entrega son hechos distintos                            |
|    4 | alerta        | puede vincularse desde un artefacto, pero no se convierte en diagnóstico o acción          |
|    5 | modelo        | su ejecución puede explicar un resultado, sin certificarlo ni probar causalidad            |
|    6 | recomendación | puede acompañar una decisión, sin ejecutar cambios empresariales                           |

**Reconciliación:** 6 familias auditables esperadas; 6 materializadas; 0 faltantes; 0 duplicadas.

La experiencia de auditoría ordinaria muestra referencias, actores, cortes, versiones y resultado lógico suficiente; no replica filas protegidas ni payloads sensibles.

---

#### 33. Calidad, bloqueo y publicación

UX007 consume la calidad de DATA-UX-004 y D007.

Reglas:

- `CERTIFICADO` solo aplica al uso, periodo, corte y versión cubiertos;
- `NO EVALUADO` no se presenta como certificado;
- `EN OBSERVACIÓN` conserva la condición;
- `DEGRADADO` conserva la limitación;
- `BLOQUEADO` impide publicación oficial del elemento dependiente;
- un artefacto puede incluir secciones con estados distintos, pero la cabecera deberá reflejar cualquier dependencia material que limite la interpretación global;
- omitir visualmente una métrica bloqueada solo permite liberar el resto si la pregunta empresarial y el contrato del artefacto siguen completos sin esa dependencia;
- una edición histórica conserva el estado de calidad que tenía al ser publicada;
- una recertificación posterior no reescribe el estado histórico.

---

#### 34. Catorce métricas actuales de asistencia

UX007 materializa una decisión explícita para las catorce métricas heredadas.

|    # | Métrica             | Estado heredado | Tratamiento UX007                                                                        |
| ---: | ------------------- | --------------- | ---------------------------------------------------------------------------------------- |
|    1 | `scheduledShifts`   | `NO EVALUADO`   | admisible en vista provisional con estado visible; no certificado por UX007              |
|    2 | `attendedShifts`    | `NO EVALUADO`   | admisible en vista provisional con estado visible; no certificado por UX007              |
|    3 | `restDayCount`      | `NO EVALUADO`   | admisible en vista provisional con estado visible; no certificado por UX007              |
|    4 | `lateCount`         | `NO EVALUADO`   | admisible en vista provisional con estado visible; no certificado por UX007              |
|    5 | `noShowCount`       | `NO EVALUADO`   | admisible en vista provisional con estado visible; no certificado por UX007              |
|    6 | `openCount`         | `NO EVALUADO`   | admisible en vista provisional con estado visible; no certificado por UX007              |
|    7 | `missingCloseCount` | `BLOQUEADO`     | no elegible para publicación oficial dependiente; mostrar bloqueo y motivo autorizado    |
|    8 | `autoCloseCount`    | `NO EVALUADO`   | admisible en vista provisional con estado visible; no certificado por UX007              |
|    9 | `departureCount`    | `NO EVALUADO`   | admisible en vista provisional con estado visible; no certificado por UX007              |
|   10 | `scheduledMinutes`  | `NO EVALUADO`   | admisible en vista provisional con estado visible; no certificado por UX007              |
|   11 | `netMinutes`        | `NO EVALUADO`   | admisible en vista provisional con estado visible; no certificado por UX007              |
|   12 | `incidentCount`     | `NO EVALUADO`   | admisible en vista provisional con estado visible; no certificado por UX007              |
|   13 | `attendanceRate`    | `BLOQUEADO`     | no elegible para publicación oficial dependiente; no fabricar 0 ante denominador ausente |
|   14 | `punctualityRate`   | `BLOQUEADO`     | no elegible para publicación oficial dependiente; no fabricar 0 ante denominador ausente |

**Reconciliación:** 14 métricas esperadas; 14 materializadas; 0 faltantes; 0 duplicadas. Distribución heredada: 11 `NO EVALUADO`; 3 `BLOQUEADO`.

---

#### 35. Bloqueos concretos de asistencia

La experiencia conserva, sin intentar resolverlos, los tres bloqueos documentados:

- `missingCloseCount`: el resumen actual no preserva de forma suficiente la condición de que el fin programado ya haya pasado al corte;
- `attendanceRate`: la implementación actual devuelve cero cuando `scheduledShifts = 0`, mientras la definición requiere ausencia de valor numérico;
- `punctualityRate`: la implementación actual devuelve cero cuando `attendedShifts = 0`, mientras la definición requiere ausencia de valor numérico.

UX007 no corrige código ni redefine estas métricas. La UI deberá impedir que esos valores sean estilizados como cifras oficiales mientras el bloqueo siga vigente.

---

#### 36. Reporte de asistencia JSON actual

La salida JSON actual de asistencia se clasifica para UX007 como una proyección técnicamente existente de naturaleza viva o ad hoc, no como una publicación oficial certificada.

Razones visibles que deben poder expresarse:

- contiene o puede depender de métricas `BLOQUEADO`;
- las demás métricas relevantes permanecen `NO EVALUADO`;
- la experiencia actual no materializa por sí sola la puerta completa de publicación;
- un response técnicamente correcto no certifica calidad;
- conservar un archivo o payload no lo convierte en snapshot oficial.

La corrección física de contrato, metadata o generación corresponde a las tareas de integración y aplicación propietarias futuras.

---

#### 37. Reporte XLSX actual de asistencia

El reporte XLSX identificado como “REPORTE OPERATIVO DE TURNOS Y ASISTENCIA” se trata como reporte/exportación técnicamente existente pero hoy `BLOQUEADO` para publicación oficial completa en su forma actual.

La experiencia deberá poder hacer visibles, cuando corresponda:

- las tres métricas bloqueadas;
- el estado `NO EVALUADO` de las restantes;
- ausencia de certificación oficial suficiente;
- periodo y scope;
- corte o fecha de generación;
- condición derivada del artefacto;
- relación con su fuente propietaria.

UX007 no modifica el generador XLSX.

---

#### 38. Cincuenta y cinco familias analíticas: elegibilidad de artefactos

Las cincuenta y cinco familias de D009 a D013 pueden alimentar reportes, exportaciones, suscripciones o snapshots según su estado real. UX007 no crea un reporte obligatorio por familia.

##### 38.1. Comercial — 11 familias

|    # | Familia                                      | Decisión UX007                                                                           |
| ---: | -------------------------------------------- | ---------------------------------------------------------------------------------------- |
|    1 | ventas netas y brutas                        | elegible con base, población, versión, unidad/moneda y calidad explícitas                |
|    2 | pedidos y conversión                         | elegible preservando conteos y denominadores; una tasa inválida no se sustituye por cero |
|    3 | ticket y unidades                            | elegible con transacciones y unidades compatibles                                        |
|    4 | mezcla por producto, categoría, canal y sede | elegible con dimensiones gobernadas y reconciliación al total                            |
|    5 | demanda por franja, día y temporada          | elegible con periodo, estacionalidad y cobertura visibles                                |
|    6 | disponibilidad perdida                       | solo publicación oficial cuando intención y disponibilidad histórica estén reconciliadas |
|    7 | cancelaciones, devoluciones y descuentos     | cada fenómeno conserva identidad y denominador propios                                   |
|    8 | promociones y efecto incremental             | efecto incremental conserva diseño, versión y límites causales                           |
|    9 | recurrencia y frecuencia                     | elegible solo con identidad, finalidad y ventana autorizadas                             |
|   10 | margen relacionado                           | consume el margen económico gobernado; no recalcula costo localmente                     |
|   11 | capacidad comercial no utilizada             | requiere denominador de capacidad compatible                                             |

##### 38.2. Inventario, abastecimiento, proveedores y logística — 12 familias

|    # | Familia                                 | Decisión UX007                                                                |
| ---: | --------------------------------------- | ----------------------------------------------------------------------------- |
|    1 | existencia disponible y comprometida    | separar estados físicos, comprometidos, tránsito, cuarentena y disponibilidad |
|    2 | cobertura y días de inventario          | mostrar base de existencia y demanda o consumo compatible                     |
|    3 | rotación y permanencia                  | conservar método, inventario medio e historia o cohorte aplicable             |
|    4 | faltantes y quiebres                    | no inferir quiebre desde stock cero sin necesidad elegible                    |
|    5 | vencimiento, daño y pérdida             | separar hechos, causas, cuarentena y disposición                              |
|    6 | diferencias de conteo                   | conservar signo, corte y relación antes/después del ajuste                    |
|    7 | cumplimiento de remisiones              | separar preparación, despacho, recepción, faltante y cierre                   |
|    8 | lead time y cumplimiento de proveedores | conservar inicio contractual, promesa y recepción aceptada                    |
|    9 | compras urgentes                        | incluir solo hechos clasificados bajo la definición gobernada                 |
|   10 | consumo versus plan                     | comparar población, unidad, sede y ventana equivalentes                       |
|   11 | costo de inventario                     | consumir valoración económica gobernada                                       |
|   12 | capacidad de almacenamiento             | usar capacidad utilizable y unidad física compatible                          |

##### 38.3. Producción, rendimiento, capacidad, merma y calidad — 10 familias

|    # | Familia                                     | Decisión UX007                                                         |
| ---: | ------------------------------------------- | ---------------------------------------------------------------------- |
|    1 | demanda planificada versus producción       | preservar plan aceptado y producción comparable                        |
|    2 | capacidad disponible y utilizada            | declarar denominador integral de capacidad                             |
|    3 | adherencia al programa                      | conservar programa publicado/versionado e hitos                        |
|    4 | rendimiento teórico y real                  | reconciliar receta, versión, escala y unidad                           |
|    5 | consumo estándar y real                     | comparar ingrediente y unidad compatibles                              |
|    6 | merma, reproceso y aprovechamiento          | separar cada categoría y su denominador                                |
|    7 | calidad, retención y rechazo                | separar control, resultado, retención, rechazo, reproceso y liberación |
|    8 | tiempo de ciclo                             | conservar hitos reales y no colapsar espera, pausa o liberación        |
|    9 | cumplimiento de liberación                  | no equiparar producción terminada con lote liberado                    |
|   10 | costo y variación por lote, producto y sede | distinguir costo técnico de costo económico oficial                    |

##### 38.4. Servicio, clientes, fidelización, reputación y experiencia — 12 familias

|    # | Familia                                                 | Decisión UX007                                                         |
| ---: | ------------------------------------------------------- | ---------------------------------------------------------------------- |
|    1 | cumplimiento de promesa                                 | requiere promesa aceptada y versionada                                 |
|    2 | tiempos de preparación, despacho y entrega              | separar fases y eventos reales                                         |
|    3 | pedidos completos                                       | resolver líneas, cantidades, revisiones y sustituciones aceptadas      |
|    4 | reclamos y tiempo de resolución                         | conservar expediente y SLA o versión aplicable                         |
|    5 | compensaciones                                          | no colapsar devolución, reembolso, descuento, cortesía, cupón y puntos |
|    6 | satisfacción y feedback                                 | separar feedback interno de reputación externa                         |
|    7 | recurrencia, frecuencia y abandono                      | declarar población elegible y ventana completa                         |
|    8 | adquisición y activación                                | conservar eventos y origen gobernados                                  |
|    9 | fidelización, puntos y redenciones                      | saldo no sustituye movimientos o ledger                                |
|   10 | reputación y temas recurrentes                          | fuente externa e interna permanecen distinguibles                      |
|   11 | reservas, no-show y utilización                         | reserva, cancelación, no-show y capacidad permanecen distintos         |
|   12 | valor y rentabilidad del cliente cuando esté autorizado | exige identidad/finalidad autorizadas y rentabilidad gobernada         |

##### 38.5. Costos, rentabilidad, liquidez, presupuesto y escenarios — 10 familias

|    # | Familia                       | Decisión UX007                                                             |
| ---: | ----------------------------- | -------------------------------------------------------------------------- |
|    1 | costos estándar y reales      | conservar método, versión, unidad, moneda y componentes                    |
|    2 | variaciones                   | cada variación conserva su base de comparación                             |
|    3 | margen y contribución         | exige ingreso realizado y costos trazables o variables elegibles           |
|    4 | gastos                        | separar capturado, reconocido, aprobado, pagado, anulado y conciliado      |
|    5 | centros de costo              | mostrarlo como dimensión económica cuando corresponda, no KPI por sí mismo |
|    6 | presupuesto y forecast        | separar presupuesto, revisión, forecast, escenario y real                  |
|    7 | caja, bancos y tesorería      | posición real exige saldos reconciliados y disponibilidad                  |
|    8 | cartera y obligaciones        | saldo abierto deriva de reconocimiento menos aplicaciones válidas          |
|    9 | rentabilidad multidimensional | conservar costos trazables, asignaciones y residuo visible                 |
|   10 | escenarios y simulaciones     | simulado nunca sustituye real, baseline ni efecto observado                |

**Reconciliación:** `11 + 12 + 10 + 12 + 10 = 55` familias. 55 esperadas; 55 decisiones UX007 materializadas; 0 faltantes; 0 duplicadas.

---

#### 39. Regla transversal para las cincuenta y cinco familias

1. la elegibilidad UX no certifica la familia;
2. el estado real de cada dependencia se hereda;
3. una familia puede aparecer en varias clases de artefacto sin duplicar su definición;
4. una exportación no crea una nueva métrica;
5. una suscripción no congela una versión de forma implícita: su política debe ser explícita;
6. un snapshot sí conserva la versión de la edición publicada;
7. un reporte puede mezclar familias solo si población, tiempo, unidad y comparación son compatibles o la diferencia queda explícita;
8. un restatement de una familia no obliga a reexpresar automáticamente todo artefacto consumidor; el impacto se evalúa;
9. una métrica bloqueada no se libera por aparecer junto a métricas certificadas;
10. UX007 no crea cincuenta y cinco objetivos, reportes, suscripciones ni snapshots.

---

#### 40. Navegación entre superficies analíticas

La experiencia puede ofrecer vínculos contextuales, sujetos a autorización, hacia:

- tablero de dominio en `DATA-UX-003`;
- calidad y conciliación en `DATA-UX-004`;
- diagnóstico en `DATA-UX-005`;
- objetivo o acción en `DATA-UX-006`;
- edición histórica o restatement de este mismo artefacto;
- detalle fuente autorizado.

Reglas:

- navegar no transfiere permisos;
- volver a una edición anterior no modifica el contexto vigente;
- un reporte puede referenciar un diagnóstico sin convertirlo en causa probada;
- una suscripción puede entregar un reporte sin convertir la regla de suscripción en publicación;
- una alerta puede abrir un reporte o diagnóstico, pero no ejecuta una acción;
- un snapshot puede ser evidencia de contexto, pero no fuente editable.

---

#### 41. Búsqueda, orden y filtros de biblioteca

Una biblioteca futura de reportes o snapshots deberá permitir encontrar artefactos por criterios autorizados como:

- clase;
- dominio;
- propósito;
- responsable;
- periodo;
- fecha de publicación;
- estado de publicación;
- edición;
- existencia de restatement;
- calidad;
- métrica o familia cuando el índice pueda exponerla;
- audiencia o colección cuando esté autorizada.

La búsqueda no revela títulos, etiquetas, conteos o metadatos de recursos a los que el actor no tenga acceso.

---

#### 42. Estados vacíos y recuperación

La experiencia define estados explícitos:

| Estado                     | Mensaje funcional                                      | Acción permitida                                                    |
| -------------------------- | ------------------------------------------------------ | ------------------------------------------------------------------- |
| sin artefactos autorizados | no existen resultados visibles para el contexto actual | cambiar únicamente filtros permitidos o volver al contexto anterior |
| sin datos para el periodo  | no hay observaciones elegibles                         | revisar periodo o cobertura, sin fabricar cero                      |
| bloqueado por calidad      | una dependencia crítica impide uso oficial             | abrir detalle de calidad si está autorizado                         |
| degradado                  | resultado disponible con limitación                    | revisar limitación y decidir si el uso declarado la admite          |
| no comparable              | las ediciones no pueden compararse directamente        | abrir diferencias de versión o definición                           |
| edición histórica          | existe una edición posterior                           | abrir edición vigente o comparar                                    |
| restatement disponible     | la publicación original fue reexpresada                | ver motivo y diferencias                                            |
| acceso denegado            | el recurso o la acción no están autorizados            | no revelar contenido protegido                                      |
| evidencia incompleta       | no puede reconstruirse todo el contexto                | mostrar pendiente sin rellenar supuestos                            |

---

#### 43. Accesibilidad y densidad

UX007 adopta las siguientes reglas:

- el estado no depende únicamente de color;
- edición histórica y restatement usan texto y estructura, no solo iconos;
- tablas permiten lectura lineal y encabezados comprensibles;
- diferencias original/restated incluyen signos y unidades;
- tooltips no contienen la única explicación de una limitación crítica;
- controles de edición y fecha tienen etiquetas accesibles;
- la navegación por teclado mantiene orden lógico;
- en pantallas estrechas se priorizan identidad, periodo, corte, estado, edición y resultado;
- metadatos de reproducibilidad se agrupan progresivamente;
- una exportación o suscripción no se ofrece como acción primaria si no está autorizada;
- los estados `BLOQUEADO`, `DEGRADADO` y `NO EVALUADO` conservan lenguaje explícito;
- el formato numérico no elimina signo, unidad, moneda o condición de ausencia.

---

#### 44. Dispositivos y superficies compactas

En superficies compactas:

1. no se intenta mostrar los diecinueve metadatos simultáneamente;
2. la cabecera conserva artefacto, periodo, corte, edición, estado y calidad;
3. una tabla amplia puede cambiar a filas apiladas sin alterar valores;
4. la historia de ediciones puede presentarse como lista cronológica;
5. comparación original/restated prioriza valor, diferencia, motivo y fecha;
6. acciones de publicación o exportación no se esconden dentro de gestos ambiguos;
7. la existencia de un restatement permanece visible aunque el detalle se abra aparte;
8. el usuario no necesita obtener una copia para conocer versión y corte.

---

#### 45. Privacidad y poblaciones pequeñas

La experiencia aplica A002 antes de exponer:

- sujetos individuales;
- segmentos pequeños;
- numeradores o denominadores que permitan inferencia;
- combinaciones de filtros que reduzcan demasiado la población;
- metadatos que revelen identidad o actividad protegida;
- nombres de destinatarios de suscripción;
- evidencia de auditoría;
- versiones históricas con clasificaciones diferentes.

Una edición histórica no evade políticas actuales de acceso. Si la política actual exige mayor protección, la interfaz aplica la protección vigente al acto de consulta sin reescribir la edición histórica.

---

#### 46. Publicación, anotación y corrección

UX007 mantiene acciones distintas:

- una anotación agrega contexto y no cambia la edición;
- una corrección de fuente modifica el origen autorizado, no el reporte directamente;
- una reconstrucción recalcula una coordenada;
- un restatement produce una nueva edición oficial cuando la decisión lo exige;
- publicar una nueva edición no certifica las fuentes;
- retirar una edición no borra el historial;
- corregir una anotación no modifica valores;
- una nota de un administrador no sustituye una decisión `PUBLISH` o `CERTIFY`.

---

#### 47. Política de versión en suscripciones

Toda suscripción futura deberá adoptar explícitamente una política compatible con uno de estos patrones documentales, sin crear un enum técnico obligatorio:

- versión fija de una métrica o artefacto mientras permanezca válida;
- versión vigente compatible al momento de cada entrega;
- edición oficial exacta referenciada;
- política de transición gobernada entre versiones.

Reglas:

1. la política debe ser visible antes de activar la suscripción;
2. cambiar la política conserva historia;
3. una versión incompatible puede bloquear una entrega;
4. una nueva versión semántica no se adopta silenciosamente si cambia comparabilidad;
5. entregas históricas conservan la versión efectivamente utilizada;
6. una futura entrega con nueva versión no reescribe las anteriores.

---

#### 48. Tratamiento de restatement en suscripciones

Cuando una edición ya distribuida recibe restatement:

- la entrega original permanece registrada;
- la nueva edición queda vinculada;
- la existencia de una nueva edición no implica redistribución automática;
- la decisión de redistribuir debe estar gobernada y autorizada;
- el destinatario actual se reevalúa antes de cualquier nueva entrega;
- la evidencia debe permitir conocer qué edición recibió cada destinatario cuando la implementación futura lo materialice;
- una corrección histórica no convierte una entrega fallida anterior en exitosa.

---

#### 49. Tratamiento de restatement en exportaciones

Cuando una exportación se originó en una edición posteriormente restated:

- el archivo histórico no se modifica;
- la relación con la edición original permanece;
- una nueva exportación corregida constituye una nueva generación;
- la UI puede advertir que existe una edición más reciente;
- obtener la nueva exportación exige autorización vigente;
- los campos o población de la nueva salida se recalculan según la autorización actual;
- una exportación histórica no se etiqueta como falsa; se identifica como correspondiente a la edición original.

---

#### 50. Tratamiento de restatement en reportes

Cuando un reporte oficial cambia:

1. se conserva la edición original;
2. se crea o referencia la edición corregida;
3. se documenta motivo;
4. se muestra diferencia cuando sea válida;
5. se indica no comparabilidad cuando corresponda;
6. la fecha de publicación original no se cambia;
7. la edición corregida conserva su propia fecha;
8. la vista vigente puede abrir la anterior;
9. la vista histórica puede advertir que existe una posterior;
10. un cambio de layout sin cambio material no se presenta como restatement numérico.

---

#### 51. Tratamiento de restatement en snapshots

Para snapshots oficiales:

- el snapshot original permanece inmutable;
- la reconstrucción se materializará en el componente técnico propietario futuro;
- el restatement se representa como nueva edición vinculada;
- la vista de historia conserva ambas;
- no se sobrescribe el timestamp original;
- la calidad original permanece registrada;
- la nueva edición muestra su propia calidad;
- la relación entre versiones semánticas queda explícita;
- el usuario puede distinguir lo conocido entonces de lo reconstruido ahora.

---

#### 52. Handoffs con propietario documental exacto

| Decisión o materialización fuera del alcance                         | Propietario documental | Condición de salida                                                               |
| -------------------------------------------------------------------- | ---------------------- | --------------------------------------------------------------------------------- |
| contratos físicos de eventos y lectura                               | `DATA-INT-001`         | antes de consumir fuentes productivas mediante eventos o contratos especializados |
| capa semántica, consultas, caché, snapshots y rendimiento            | `DATA-INT-002`         | antes de generar o servir artefactos compartidos productivos                      |
| crosswalks e identidades externas                                    | `DATA-INT-003`         | antes de reconciliar entidades externas en artefactos transversales               |
| BI, hojas de cálculo, modelos analíticos e inteligencia artificial   | `DATA-INT-004`         | antes de conectar herramientas externas o automatizar generación analítica        |
| protección por dominio, territorio, finalidad y recurso              | `DATA-AUTH-001`        | antes de exponer una edición o detalle restringido                                |
| protección de poblaciones pequeñas, campos, comparaciones y salidas  | `DATA-AUTH-002`        | antes de mostrar o exportar detalle sensible                                      |
| autorización de publicación, exportación, anotación y administración | `DATA-AUTH-003`        | antes de ejecutar cualquiera de esas acciones                                     |
| auditoría de consulta, descarga, suscripción y otros usos            | `DATA-AUTH-004`        | antes de materializar evidencia productiva de uso analítico                       |
| tableros por dominio                                                 | `DATA-UX-003`          | antes de rediseñar la superficie viva de tablero                                  |
| investigación de anomalías y causas                                  | `DATA-UX-005`          | antes de convertir una señal del artefacto en diagnóstico                         |
| objetivos y acciones de mejora                                       | `DATA-UX-006`          | antes de convertir un resultado en objetivo o intervención                        |
| validación con usuarios reales                                       | `DATA-UX-008`          | antes de declarar usable el flujo analítico completo                              |
| correcciones históricas y restatements                               | `DATA-DOM-017`         | antes de decidir reexpresión oficial de una edición publicada                     |

No queda una decisión material de UX007 diferida sin propietario documental y condición de salida.

---

#### 53. Cobertura de requisitos de prueba vigente

La experiencia queda protegida por requisitos vigentes ya identificados:

- `TREQ-DATA-002` protege definición, versión, fórmula, población, unidad, moneda, fuente, calidad y comparabilidad de métricas y asigna expresamente UX007;
- `TREQ-DATA-003` impide presentar como certificado un reporte oficial con fuente vencida, incompleta, degradada o sin reconciliar;
- `TREQ-DATA-004` protege periodo, corte, zona horaria, filtros, dimensiones, unidad, moneda, frescura, cobertura, calidad, divulgación progresiva, drill-down y separación entre artefactos;
- `TREQ-UX-001` protege claridad de tarea y siguiente acción;
- `TREQ-UX-003` protege densidad, acciones y datos adecuados al actor y autorización;
- `TREQ-UX-005` protege fuente de verdad, estado confirmado o pendiente, último cambio y trazabilidad de correcciones;
- `TREQ-UX-010` protege contexto administrativo, versión, periodo, población, actor y la separación entre filtro, contexto y proyección.

UX007 especializa la experiencia de consumo y versionado dentro de estas reglas. No cambia su regla protegida, prioridad, modalidad, estado, relaciones ni destino de implementación.

---

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea materializa documentalmente la experiencia de reportes, exportaciones, suscripciones, snapshots, ediciones, calidad, autorización, restatements e historia dentro de requisitos vigentes que ya protegen semántica, publicación, versionado, calidad, autorización, trazabilidad y separación entre artefactos. No introduce comportamiento ejecutable, transición física, contrato técnico, autorización, dato, integración, job, distribución o cambio productivo nuevo.

---

#### 54. Criterios de aceptación

1. UX007 materializa exactamente cuatro familias foco: reporte, exportación, suscripción y snapshot oficial;
2. las seis familias D008 permanecen presentes y distinguibles;
3. la reconciliación de familias D008 es 6 esperadas, 6 materializadas, 0 faltantes y 0 duplicadas;
4. tablero permanece bajo la experiencia principal de DATA-UX-003;
5. alerta permanece separada de diagnóstico, decisión y acción;
6. vista viva, tablero, reporte oficial, exportación, suscripción, alerta, snapshot oficial y simulación permanecen conceptos distintos;
7. publicado y certificado permanecen distintos;
8. publicación y exportación permanecen acciones autorizables distintas;
9. exportación no se presenta como fuente de verdad;
10. suscripción no se presenta como acceso permanente;
11. snapshot oficial no se presenta como respaldo técnico;
12. snapshot oficial no se presenta como estado vivo;
13. snapshot oficial no se presenta como restatement;
14. se materializan los diecinueve componentes comunes de artefacto;
15. una limitación material no se oculta únicamente en metadata secundaria;
16. la puerta oficial contiene exactamente diez condiciones;
17. una dependencia crítica `BLOQUEADO` impide publicación oficial dependiente;
18. `NO EVALUADO` no se presenta como `CERTIFICADO`;
19. `DEGRADADO` conserva su limitación;
20. ausencia de dato no se convierte en cero;
21. denominador inválido no se convierte en porcentaje cero;
22. todo reporte oficial identifica periodo, corte y edición;
23. una nueva edición de reporte no altera la anterior;
24. un cambio de formato sin cambio semántico no se presenta como restatement numérico;
25. una edición retirada permanece en historia;
26. abrir un reporte no concede detalle fuente adicional;
27. toda exportación conserva contexto suficiente de periodo, corte, filtros, dimensiones, versión y calidad;
28. una exportación no amplía población o campos;
29. una exportación ad hoc no se presenta como snapshot oficial;
30. generación y obtención de una exportación permanecen hechos distinguibles cuando aplique;
31. una suscripción declara artefacto, política de versión, ventana, filtros, cadencia, zona horaria, formato, audiencia y calidad mínima;
32. cada entrega de suscripción reevalúa autorización;
33. cambiar una suscripción no reescribe entregas previas;
34. una dependencia bloqueada no produce silenciosamente una entrega oficial completa;
35. cada snapshot oficial conserva corte, versiones, calidad y fecha de publicación;
36. un snapshot oficial publicado permanece inmutable;
37. dato tardío no sobrescribe silenciosamente un snapshot;
38. reconstrucción y restatement producen representaciones vinculadas y distinguibles;
39. se preservan exactamente ocho ejes de versión;
40. versión semántica y edición de publicación permanecen separadas;
41. versión técnica y versión semántica permanecen separadas;
42. el selector de historia identifica edición vigente e históricas;
43. “último” no sustituye la historia;
44. se materializan exactamente seis operaciones históricas;
45. reintento, replay, backfill, corrección, reconstrucción y restatement no se colapsan;
46. una corrección de fuente no implica automáticamente restatement;
47. una reconstrucción no se presenta como publicación original;
48. un restatement conserva la edición original;
49. la vista comparativa muestra original y restated por separado;
50. una diferencia relativa no se calcula con denominador inválido;
51. no existe umbral universal de materialidad inventado;
52. se materializan treinta y dos elementos de reproducibilidad;
53. la ausencia histórica de evidencia no se rellena por inferencia;
54. divulgación progresiva no oculta una limitación crítica;
55. `PUBLISH` y `EXPORT` requieren decisiones separadas;
56. una persona autorizada a consultar no recibe publicación o exportación por inferencia;
57. las seis familias A004 permanecen distinguibles;
58. auditoría no se convierte en autorización ni fuente de verdad;
59. se materializan las catorce métricas de asistencia exactamente una vez;
60. la distribución de asistencia permanece 11 `NO EVALUADO` y 3 `BLOQUEADO`;
61. `missingCloseCount` permanece `BLOQUEADO`;
62. `attendanceRate` permanece `BLOQUEADO`;
63. `punctualityRate` permanece `BLOQUEADO`;
64. UX007 no corrige el comportamiento técnico de las tres métricas bloqueadas;
65. el JSON actual de asistencia no se declara publicación oficial certificada;
66. el XLSX actual de asistencia no se declara publicación oficial completa mientras dependencias críticas sigan bloqueadas o no evaluadas;
67. las cincuenta y cinco familias analíticas aparecen exactamente una vez en la matriz de elegibilidad;
68. se conservan 11 familias comerciales;
69. se conservan 12 familias de inventario y abastecimiento;
70. se conservan 10 familias productivas;
71. se conservan 12 familias de servicio y clientes;
72. se conservan 10 familias económico-financieras;
73. existen 55 decisiones UX007, 0 faltantes y 0 duplicadas;
74. ninguna familia crea una métrica o reporte automático nuevo;
75. una familia bloqueada no se libera por aparecer en un artefacto;
76. navegación entre superficies reevalúa autorización;
77. una alerta enlazada no se convierte en diagnóstico o acción;
78. una búsqueda no revela metadatos de artefactos no autorizados;
79. estados vacíos distinguen sin datos, bloqueado, degradado, no comparable, histórico y restatement disponible;
80. el estado no depende únicamente de color;
81. la existencia de restatement permanece perceptible en superficies compactas;
82. una edición histórica continúa sujeta a autorización vigente de consulta;
83. poblaciones pequeñas y sensibles consumen A002;
84. una anotación no cambia edición, valor, calidad ni publicación;
85. la política de versión de suscripción es explícita;
86. una nueva versión semántica no se adopta silenciosamente cuando rompe comparabilidad;
87. un restatement no redistribuye automáticamente una suscripción histórica;
88. una exportación histórica no se modifica después de un restatement;
89. el reporte original conserva su fecha de publicación;
90. el snapshot original conserva su timestamp y calidad histórica;
91. cada handoff tiene propietario documental y condición de salida;
92. DATA-INT-001 a DATA-INT-004 permanecen no iniciadas y no son materializadas por UX007;
93. no se crea, modifica, difiere, descarta ni vuelve obsoleto ningún requisito de prueba;
94. no se ejecuta código, DDL, DML, migración, backfill, replay, reconstrucción productiva, publicación, job, distribución, despliegue ni cambio de Supabase;
95. `DATA-UX-008` permanece únicamente reservada.

---

#### 55. Reconciliación final de diseño

| Conjunto                                   | Esperado | Materializado | Faltantes | Duplicados |
| ------------------------------------------ | -------: | ------------: | --------: | ---------: |
| familias D008                              |        6 |             6 |         0 |          0 |
| familias foco UX007                        |        4 |             4 |         0 |          0 |
| componentes comunes de artefacto           |       19 |            19 |         0 |          0 |
| condiciones de publicación oficial         |       10 |            10 |         0 |          0 |
| ejes de versión                            |        8 |             8 |         0 |          0 |
| operaciones históricas                     |        6 |             6 |         0 |          0 |
| elementos de reproducibilidad              |       32 |            32 |         0 |          0 |
| familias auditables A004                   |        6 |             6 |         0 |          0 |
| métricas de asistencia                     |       14 |            14 |         0 |          0 |
| métricas `NO EVALUADO`                     |       11 |            11 |         0 |          0 |
| métricas `BLOQUEADO`                       |        3 |             3 |         0 |          0 |
| familias analíticas                        |       55 |            55 |         0 |          0 |
| requisitos de prueba creados o modificados |        0 |             0 |         0 |          0 |

No se materializa ninguna integración, publicación, exportación productiva, suscripción operativa ni snapshot físico en esta fase.

---

#### 56. Continuidad

```text
ÚLTIMA TAREA APROBADA
DATA-UX-006 — Diseñar objetivos, metas, drivers, guardrails y acciones de mejora

TAREA ACTUAL APROBADA
DATA-UX-007 — Diseñar reportes, exportaciones, suscripciones y snapshots versionados

SIGUIENTE TAREA RESERVADA
DATA-UX-008 — Validar comprensión, tiempos y decisiones con usuarios reales
```


### ✅ DATA-UX-008 — Validar comprensión, tiempos y decisiones con usuarios reales

**Estado:** APROBADA
**Tarea anterior:** `DATA-UX-007 — Diseñar reportes, exportaciones, suscripciones y snapshots versionados` — APROBADA
**Tarea siguiente:** `DATA-INT-001 — Definir contratos de eventos y lectura con todas las aplicaciones y fuentes externas` — RESERVADA
**Tipo de tarea:** documental; contrato materializado de validación con usuarios reales, medición de comprensión y tiempos, evaluación de decisiones y gate de evidencia para la experiencia analítica definida en DATA-UX-001 a DATA-UX-007
**Bloque:** AB — Analítica, indicadores y datos maestros
**Fase:** exclusivamente documental dentro de `CONDITIONAL_DESIGN_ARTIFACTS`
**Implementación técnica:** no autorizada
**Sesiones con usuarios reales:** no acreditadas por evidencia verificable en las fuentes consumidas para esta tarea
**Readiness de la experiencia analítica:** PENDIENTE_DE_EVIDENCIA
**Requisitos de prueba creados o modificados:** 0

#### 1. Propósito

Definir de forma completa y verificable cómo Vento OS deberá comprobar, con usuarios reales y en contexto de decisión, que la experiencia analítica diseñada en `DATA-UX-001` a `DATA-UX-007` se entiende, puede recorrerse en tiempos observables, conduce a decisiones correctas y no induce errores de calidad, causalidad, autorización, publicación, exportación, versionado o interpretación.

La aprobación de esta tarea aprueba el contrato de validación y el gate de evidencia. No afirma que las sesiones humanas ya ocurrieron, no inventa participantes, no inventa tiempos y no convierte una superficie analítica en usable o lista para ampliación sin evidencia posterior.

Regla principal:

```text
CONTRATO DE VALIDACIÓN APROBADO
≠ SESIÓN EJECUTADA
≠ EVIDENCIA HUMANA OBSERVADA
≠ READINESS APROBADO
≠ DESPLIEGUE AMPLIADO
```

La experiencia solo podrá superar el gate de usuarios reales cuando exista evidencia trazable producida por las tareas canónicas de pruebas integrales que demuestre comprensión, tiempo objetivo, decisión correcta, recuperación, protección de información y ausencia de errores bloqueantes.

#### 2. Resultado sustantivo

Quedan materializados:

1. la unidad mínima de validación de experiencia analítica;
2. una matriz obligatoria para las siete superficies heredadas de `DATA-UX-001` a `DATA-UX-007`;
3. una matriz de cobertura para los nueve perfiles analíticos heredados;
4. catorce escenarios de prueba que cubren comprensión, tiempo, decisión, calidad, causalidad, objetivos, guardrails, publicación, exportación, restatement y autorización;
5. un contrato único de observación y medición de tiempos;
6. un contrato de comprensión por `teach-back`, predicción y conducta observable;
7. un contrato de corrección de decisión, no limitado a satisfacción subjetiva;
8. una taxonomía de severidad heredada para hallazgos;
9. doce errores analíticos bloqueantes que deben detectarse en sesiones;
10. reglas de privacidad, minimización y no uso disciplinario de la evidencia;
11. reglas de selección de participantes sin inventar tamaños de muestra;
12. reglas para tratar `NO_APLICA`, ausencia de evidencia y cobertura insuficiente;
13. un gate de readiness con estados canónicos de decisión;
14. una matriz de propiedad exacta hacia `UX-QA-*` para ejecutar la evidencia real;
15. el estado actual de las siete superficies como `PENDIENTE_DE_EVIDENCIA`;
16. cero cambios físicos, cero sesiones fabricadas y cero requisitos de prueba nuevos.

#### 3. Fuentes y decisiones preservadas

Esta tarea consume y no redefine:

- `DATA-UX-001` a `DATA-UX-007` como contrato de experiencia analítica que debe someterse a prueba;
- `DATA-DOM-004` a `DATA-DOM-017` para definición de métricas, tiempo, calidad, artefactos, análisis, objetivos, experimentos y reproducibilidad;
- `DATA-AUTH-001` a `DATA-AUTH-004` para autorización, sensibilidad, segregación de capacidades y auditoría;
- los requisitos vigentes que protegen artefactos analíticos, mejora basada en datos y pilotos con usuarios reales, incluidos `TREQ-DATA-004`, `TREQ-DATA-005` y `TREQ-UX-007`;
- `UX-BASE-015` para validación contextual con trabajadores reales, protocolo neutral, `teach-back`, severidad, privacidad y la regla de que aprobar un contrato no inventa resultados de sesiones;
- `AUTH-UI-055` a `AUTH-UI-060` como precedente de prototipo, medición, criterios, sesiones reales, corrección y cierre de UX;
- `UX-QA-001` a `UX-QA-030` como paquete canónico que materializa pruebas integrales de experiencia y pilotos por aplicación;
- la separación entre definición, certificación, publicación, fijación de metas, anotación, exportación y administración;
- la obligación de conservar fuente, versión, corte, calidad, población, autorización y trazabilidad durante toda decisión analítica.

No se crea una capacidad nueva para “validar” ni se asigna autoridad a un rol por participar en una sesión.

#### 4. Fronteras conceptuales obligatorias

```text
comprender una pantalla ≠ estar de acuerdo con el resultado
```

```text
encontrar una acción ≠ tener autorización para ejecutarla
```

```text
tiempo rápido ≠ decisión correcta
```

```text
satisfacción alta ≠ comprensión demostrada
```

```text
capacitación previa ≠ claridad de la experiencia
```

```text
explicar una métrica ≠ validar su fórmula
```

```text
leer un valor ≠ entender su calidad y corte
```

```text
correlación observada ≠ causa demostrada
```

```text
recomendación ≠ acción empresarial autorizada
```

```text
publicación ≠ exportación
```

```text
exportación ≠ fuente de verdad
```

```text
restatement ≠ borrado de la edición original
```

```text
filtro seleccionado ≠ territorio autorizado
```

```text
sesión moderada ≠ piloto superado
```

```text
hallazgo observado ≠ desempeño laboral individual
```

#### 5. Unidad mínima de validación

Cada observación deberá resolver como mínimo:

```text
PARTICIPANTE REPRESENTATIVO
+ FUNCIÓN O RESPONSABILIDAD REAL
+ SUPERFICIE ANALÍTICA
+ TAREA DE DECISIÓN
+ CONTEXTO EMPRESARIAL
+ DATO / MÉTRICA / ARTEFACTO
+ VERSIÓN Y CORTE
+ ESTADO DE CALIDAD
+ ALCANCE AUTORIZADO
+ DISPOSITIVO O MODO DE USO
+ RESULTADO ESPERADO
+ CONDUCTA OBSERVADA
+ TIEMPO OBSERVADO
+ DECISIÓN TOMADA
+ EVIDENCIA
= OBSERVACIÓN EVALUABLE
```

Si una dimensión material no puede resolverse, la observación no puede utilizarse para declarar conformidad de esa superficie.

#### 6. Estados del gate de evidencia

Se preservan los cuatro estados del precedente canónico de usabilidad:

| Estado                   | Significado                                                                                                          |
| ------------------------ | -------------------------------------------------------------------------------------------------------------------- |
| `CONFORME_PARA_CIERRE`   | existe evidencia suficiente, los criterios aplicables se cumplen y no quedan hallazgos bloqueantes abiertos          |
| `REQUIERE_AJUSTE`        | existe evidencia, pero uno o más hallazgos exigen corrección y nueva comprobación antes del cierre                   |
| `BLOQUEADA`              | existe un error crítico/alto, una exposición, una decisión insegura o una condición que impide continuar con el gate |
| `PENDIENTE_DE_EVIDENCIA` | falta ejecutar o completar la evidencia real necesaria para emitir una decisión de readiness                         |

`PENDIENTE_DE_EVIDENCIA` no se transforma en conformidad por aprobación documental, demostración interna, revisión de escritorio o ausencia de reportes de error.

#### 7. Matriz materializada de las siete superficies analíticas

| Tarea propietaria | Superficie que debe probarse                       | Pregunta humana principal                                                         | Decisión que debe observarse                                                      | Error que no puede pasar inadvertido                                                  | Estado actual de evidencia | Propietario de salida                                                                     |
| ----------------- | -------------------------------------------------- | --------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- | -------------------------- | ----------------------------------------------------------------------------------------- |
| `DATA-UX-001`     | inicio y orientación analítica                     | ¿entiende qué está viendo, para qué decisión sirve y cuál es el contexto vigente? | elegir el siguiente análisis sin confundir resumen con fuente de verdad           | decidir con periodo, población o calidad incorrectos                                  | `PENDIENTE_DE_EVIDENCIA`   | `UX-QA-001` a `UX-QA-020`; `UX-QA-023`/`UX-QA-028` según aplicación                       |
| `DATA-UX-002`     | catálogo y definición de métricas                  | ¿puede encontrar y explicar la métrica correcta, su versión y sus límites?        | seleccionar la definición adecuada para la pregunta                               | aceptar fórmula local, versión incorrecta o denominador no comprendido                | `PENDIENTE_DE_EVIDENCIA`   | `UX-QA-002`, `UX-QA-003`, `UX-QA-014`, `UX-QA-017`, `UX-QA-020`                           |
| `DATA-UX-003`     | tablero, comparación y drill-down                  | ¿comprende qué comparación es válida y qué cambia al profundizar?                 | comparar solo contextos compatibles y abrir detalle autorizado                    | asumir causalidad por un delta o interpretar filtro como autorización                 | `PENDIENTE_DE_EVIDENCIA`   | `UX-QA-003`, `UX-QA-005`, `UX-QA-007`, `UX-QA-014`, `UX-QA-016`, `UX-QA-020`              |
| `DATA-UX-004`     | calidad, frescura, conciliación y certificación    | ¿distingue disponibilidad del dato de su aptitud para uso oficial?                | detener, continuar con advertencia o escalar según estado DQ                      | usar `BLOQUEADO` como dato oficial o convertir `NO EVALUADO` en cero                  | `PENDIENTE_DE_EVIDENCIA`   | `UX-QA-003`, `UX-QA-004`, `UX-QA-014`, `UX-QA-015`, `UX-QA-017`, `UX-QA-019`, `UX-QA-020` |
| `DATA-UX-005`     | investigación de variaciones, anomalías y causas   | ¿separa señal, diagnóstico, hipótesis, evidencia y causa?                         | formular la conclusión con nivel de confianza compatible con evidencia            | presentar asociación como causa o ignorar evidencia contradictoria/faltante           | `PENDIENTE_DE_EVIDENCIA`   | `UX-QA-002`, `UX-QA-003`, `UX-QA-014`, `UX-QA-015`, `UX-QA-016`, `UX-QA-020`              |
| `DATA-UX-006`     | objetivos, metas, drivers, guardrails y mejora     | ¿distingue resultado, baseline, meta, driver, guardrail, acción y experimento?    | proponer o rechazar una acción considerando objetivo y guardrails                 | optimizar el KPI ignorando efectos adversos o tratar driver como meta                 | `PENDIENTE_DE_EVIDENCIA`   | `UX-QA-002`, `UX-QA-003`, `UX-QA-014`, `UX-QA-016`, `UX-QA-017`, `UX-QA-020`              |
| `DATA-UX-007`     | reportes, exportaciones, suscripciones y snapshots | ¿reconoce qué artefacto es oficial, portable, recurrente o histórico?             | elegir publicación/exportación/suscripción/snapshot con versión y corte correctos | creer que publicar autoriza exportar o que un restatement elimina la edición anterior | `PENDIENTE_DE_EVIDENCIA`   | `UX-QA-003`, `UX-QA-004`, `UX-QA-014`, `UX-QA-016`, `UX-QA-017`, `UX-QA-019`, `UX-QA-020` |

Reconciliación:

```text
SUPERFICIES ESPERADAS: 7
SUPERFICIES MATERIALIZADAS: 7
FALTANTES: 0
DUPLICADOS: 0
CON EVIDENCIA HUMANA VERIFICADA EN LAS FUENTES CONSUMIDAS: 0
PENDIENTE_DE_EVIDENCIA: 7
```

#### 8. Cobertura de perfiles analíticos

Se preservan los nueve perfiles heredados por la experiencia analítica. Esta tarea no presume que todos deban usar todas las superficies: la aplicabilidad depende de responsabilidad real, finalidad y autorización.

| Perfil heredado           | Decisión de cobertura                                                                   | Evidencia actual         | Condición de salida                                                                           |
| ------------------------- | --------------------------------------------------------------------------------------- | ------------------------ | --------------------------------------------------------------------------------------------- |
| `propietario`             | incluir cuando ejerza una decisión analítica dentro de su alcance autorizado            | `PENDIENTE_DE_EVIDENCIA` | sesión representativa en las superficies realmente usadas y gate correspondiente en `UX-QA-*` |
| `gerente_general`         | incluir cuando ejerza visión transversal o decisión ejecutiva autorizada                | `PENDIENTE_DE_EVIDENCIA` | sesión representativa y evidencia de comprensión/decisión                                     |
| `gerente`                 | incluir por el dominio y territorio que gobierna                                        | `PENDIENTE_DE_EVIDENCIA` | sesión representativa y evidencia de comprensión/decisión                                     |
| `supervisor`              | incluir cuando la analítica forme parte de supervisión autorizada                       | `PENDIENTE_DE_EVIDENCIA` | sesión representativa o `NO_APLICA` justificado por superficie                                |
| `contador`                | incluir en superficies económicas/financieras y otras autorizadas                       | `PENDIENTE_DE_EVIDENCIA` | evidencia bajo `UX-QA-028` cuando corresponda a NUMERA y pruebas comunes aplicables           |
| `marketing`               | incluir en análisis comercial/cliente dentro de finalidad autorizada                    | `PENDIENTE_DE_EVIDENCIA` | sesión representativa o `NO_APLICA` justificado por superficie                                |
| `logistica`               | incluir en análisis de inventario, abastecimiento/logística y otros autorizados         | `PENDIENTE_DE_EVIDENCIA` | sesión representativa o `NO_APLICA` justificado por superficie                                |
| `auxiliar_administrativa` | evaluar aplicabilidad a consulta, preparación o apoyo analítico sin ampliar capacidades | `PENDIENTE_DE_EVIDENCIA` | sesión representativa si existe uso real; de lo contrario `NO_APLICA` con razón               |
| `talento_humano`          | incluir cuando consuma analítica de talento/asistencia autorizada                       | `PENDIENTE_DE_EVIDENCIA` | sesión representativa o `NO_APLICA` justificado por superficie                                |

Reconciliación:

```text
PERFILES HEREDADOS: 9
PERFILES CON DECISIÓN DE COBERTURA: 9
FALTANTES: 0
DUPLICADOS: 0
```

No se fija un número arbitrario de participantes. La ejecución deberá justificar representatividad por funciones, decisiones, sedes/áreas, dispositivos, niveles de experiencia y excepciones aplicables, y deberá registrar por qué una combinación queda cubierta o es `NO_APLICA`.

#### 9. Selección de participantes

La muestra de ejecución deberá cumplir simultáneamente:

1. participantes que realizan o reciben realmente la decisión representada;
2. mezcla suficiente de experiencia para no validar solo con expertos del sistema;
3. cobertura del territorio o contexto cuando cambie la decisión;
4. cobertura de dispositivos/modos de uso cuando cambie la interacción;
5. separación entre quien diseñó la experiencia y quien la prueba cuando sea posible;
6. autorización válida para el escenario o datos ficticios/minimizados que no exijan acceso adicional;
7. ausencia de presión disciplinaria;
8. capacidad de detener la sesión;
9. registro anónimo o pseudonimizado mediante `participant_code`;
10. no reutilizar una misma sesión para declarar cobertura de una superficie que el participante no recorrió.

La experiencia previa con Vento OS se registra como contexto; no se utiliza para enseñar la respuesta durante la prueba.

#### 10. Protocolo de sesión

Cada escenario se ejecutará con esta secuencia:

1. presentar el contexto y el objetivo de negocio sin explicar la interfaz;
2. pedir al participante que diga qué entiende del estado actual;
3. pedir que identifique qué información necesita antes de decidir;
4. iniciar medición de tiempo en el mismo punto definido para todos los participantes del escenario;
5. observar la primera interpretación y la primera acción elegida;
6. registrar aperturas incorrectas, retrocesos, ayuda y bloqueos;
7. pedir la decisión concreta que tomaría;
8. pedir que explique por qué y con qué limitaciones;
9. solicitar `teach-back`: explicar a otra persona qué significa el resultado y qué no significa;
10. introducir, cuando aplique, una excepción de calidad, autorización, restatement, guardrail o evidencia contradictoria;
11. observar si revisa su decisión correctamente;
12. cerrar con dificultad percibida, comentario y evidencia del moderador;
13. clasificar hallazgos sin convertir la dificultad del participante en evaluación laboral.

El moderador no puede señalar dónde hacer clic, traducir el significado antes de medir comprensión ni confirmar que una interpretación es correcta antes de registrar la decisión inicial.

#### 11. Contrato de observación y tiempo

Por observación deberán registrarse, como mínimo:

| Campo                                    | Uso                                                                             |
| ---------------------------------------- | ------------------------------------------------------------------------------- |
| `participant_code`                       | pseudónimo de la persona; no identidad laboral visible en el análisis ordinario |
| `function_tested`                        | función o responsabilidad real bajo prueba                                      |
| `surface_owner_task`                     | una de `DATA-UX-001` a `DATA-UX-007`                                            |
| `application_context`                    | aplicación o contexto donde se presenta la experiencia                          |
| `device_mode`                            | escritorio, tablet u otro modo realmente utilizado                              |
| `scenario_prompt`                        | consigna entregada sin enseñar la respuesta                                     |
| `business_context`                       | territorio, periodo, población y finalidad relevantes                           |
| `metric_or_artifact_context`             | métrica, análisis o artefacto involucrado                                       |
| `version_cut_quality_context`            | versión, corte y estado de calidad necesarios para interpretar                  |
| `expected_decision`                      | resultado o decisión correcta definida por el escenario                         |
| `first_interpretation`                   | significado que el participante atribuye antes de ayuda                         |
| `first_action_chosen`                    | primera acción o recorrido seleccionado                                         |
| `found_correct_action`                   | si llegó a la acción correcta sin ayuda material                                |
| `time_to_action_seconds`                 | tiempo hasta localizar la acción requerida                                      |
| `time_to_correct_interpretation_seconds` | tiempo hasta expresar una interpretación correcta                               |
| `time_to_correct_decision_seconds`       | tiempo hasta emitir la decisión correcta bajo el escenario                      |
| `task_completion_seconds`                | tiempo total hasta completar el escenario cuando aplique                        |
| `wrong_openings`                         | aperturas o recorridos que no aportan a la tarea                                |
| `backtracks`                             | retrocesos por interpretación o navegación                                      |
| `moderator_help`                         | ayuda requerida y momento de la ayuda                                           |
| `context_understanding`                  | comprensión de periodo, población, territorio y finalidad                       |
| `quality_understanding`                  | comprensión de frescura, cobertura, conciliación y estado DQ                    |
| `version_understanding`                  | comprensión de versión, edición, corte y restatement                            |
| `effect_understanding`                   | predicción correcta del efecto de una acción                                    |
| `causal_understanding`                   | separación entre asociación, hipótesis y evidencia causal                       |
| `guardrail_understanding`                | comprensión de restricciones y efectos adversos                                 |
| `authorization_understanding`            | reconocimiento de límites de acceso/acción sin inferir autoridad desde UI       |
| `teach_back_result`                      | explicación final en palabras del participante                                  |
| `recovery_behavior`                      | respuesta ante excepción, error, dato bloqueado o cambio de evidencia           |
| `critical_error`                         | error que activa gate de bloqueo cuando corresponda                             |
| `severity`                               | `S0_CRITICAL`, `S1_HIGH`, `S2_MEDIUM`, `S3_LOW` u `OBSERVATION`                 |
| `difficulty_1_to_7`                      | dificultad subjetiva; no sustituye resultado observado                          |
| `participant_comment`                    | comentario libre minimizado                                                     |
| `observer_notes`                         | observación factual separada de interpretación posterior                        |
| `evidence_refs`                          | referencias a captura, registro, nota o artefacto permitido de evidencia        |
| `linked_requirement_or_defect`           | vínculo al requisito/defecto cuando exista, sin inventarlo durante la sesión    |

La tarea no fija umbrales universales de segundos. `UX-QA-014` deberá validar el tiempo objetivo aplicable a cada tarea real; UX008 exige que el tiempo se mida con punto de inicio y final reproducibles y que un resultado rápido pero incorrecto nunca se considere conforme.

#### 12. Dimensiones obligatorias de comprensión

Una superficie no demuestra comprensión porque el participante complete un clic. Deberán evaluarse las siguientes dimensiones:

1. **propósito:** para qué decisión sirve la superficie;
2. **contexto:** empresa/territorio, periodo, población y filtros relevantes;
3. **identidad semántica:** qué métrica, objeto o artefacto está viendo;
4. **versión y corte:** qué edición y momento representan el resultado;
5. **calidad:** qué significa su estado de frescura, cobertura, conciliación y certificación;
6. **comparabilidad:** con qué referencia puede compararse legítimamente;
7. **fuente:** qué es derivado y qué fuente conserva autoridad;
8. **efecto de acción:** qué ocurrirá al abrir, publicar, exportar, suscribirse, fijar una meta o iniciar una investigación;
9. **causalidad:** qué puede afirmarse y qué no puede afirmarse a partir de la evidencia;
10. **guardrails:** qué límites pueden invalidar una acción aparentemente favorable;
11. **autorización:** qué información/acción queda fuera de su alcance aunque sea imaginable desde la pantalla;
12. **historia:** qué ocurre con la publicación anterior cuando existe corrección o restatement;
13. **recuperación:** qué hacer ante bloqueo, degradación, evidencia faltante o conflicto;
14. **siguiente paso:** qué decisión o tarea corresponde después de interpretar el resultado.

#### 13. Catorce escenarios materializados

|    # | Superficie principal                      | Consigna de decisión                                                                                | Evidencia que debe observarse                                                                                     |
| ---: | ----------------------------------------- | --------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------- |
|    1 | `DATA-UX-001`                             | identificar qué pregunta puede responder el resumen y cuál requiere profundizar                     | comprensión de propósito, periodo, población, calidad y siguiente paso                                            |
|    2 | `DATA-UX-002`                             | localizar la métrica correcta entre definiciones cercanas y explicar fórmula/denominador            | selección de versión correcta y rechazo de una fórmula local o ambigua                                            |
|    3 | `DATA-UX-003`                             | comparar dos periodos/segmentos y decidir si la comparación es válida                               | revisión de compatibilidad antes de interpretar el delta                                                          |
|    4 | `DATA-UX-003`                             | profundizar desde un agregado hasta detalle permitido                                               | no asumir que drill-down autoriza cualquier detalle ni que el agregado es editable como fuente                    |
|    5 | `DATA-UX-004`                             | interpretar una métrica `NO EVALUADO` frente a otra `BLOQUEADO`                                     | no convertir ausencia de evaluación en cero ni usar bloqueado como oficial                                        |
|    6 | `DATA-UX-004`                             | decidir qué hacer cuando una diferencia de reconciliación afecta una cifra publicada                | detener/advertir/escalar según contrato y preservar fuente/estado                                                 |
|    7 | `DATA-UX-005`                             | explicar una variación con asociación fuerte pero sin evidencia causal suficiente                   | lenguaje de confianza correcto; no declarar causa demostrada                                                      |
|    8 | `DATA-UX-005`                             | revisar una hipótesis cuando aparece evidencia contradictoria o faltante                            | modificar confianza/conclusión y conservar evidencia contraria visible                                            |
|    9 | `DATA-UX-006`                             | distinguir baseline, meta, indicador principal y drivers de un objetivo                             | decisión sin confundir driver con resultado ni meta con observación                                               |
|   10 | `DATA-UX-006`                             | aceptar o rechazar una acción cuyo KPI mejora pero un guardrail empeora                             | reconocimiento del efecto adverso y decisión de no declarar éxito automático                                      |
|   11 | `DATA-UX-007`                             | escoger entre reporte oficial, exportación, suscripción y snapshot para una necesidad concreta      | selección del artefacto correcto y comprensión de destinatario/corte/versión                                      |
|   12 | `DATA-UX-007`                             | interpretar una edición restated junto con su publicación original                                  | comprender que ambas permanecen trazables y que la corrección no borra historia                                   |
|   13 | transversal                               | solicitar detalle fuera del territorio o sensibilidad autorizada                                    | detener el acceso/acción; no usar filtro de pantalla como prueba de autoridad                                     |
|   14 | transversal `DATA-UX-001` a `DATA-UX-007` | pasar de señal a decisión, con calidad degradada, evidencia incompleta, objetivo y salida gobernada | cadena completa: contexto → métrica → calidad → análisis → decisión → guardrail → artefacto, sin saltar controles |

Reconciliación:

```text
ESCENARIOS DEFINIDOS: 14
SUPERFICIES UX CUBIERTAS: 7 DE 7
ESCENARIOS TRANSVERSALES: 2
ESCENARIOS CON EXCEPCIÓN O CONDICIÓN DE RIESGO: 10
```

#### 14. Caso obligatorio de asistencia con datos bloqueados

La validación deberá incluir al menos un escenario que preserve la decisión ya aprobada sobre las catorce métricas de asistencia:

```text
TOTAL MÉTRICAS: 14
NO EVALUADO: 11
BLOQUEADO: 3
```

Las tres métricas bloqueadas son:

- `missingCloseCount`;
- `attendanceRate`;
- `punctualityRate`.

El escenario deberá comprobar que el usuario:

1. identifica visualmente que el estado bloquea el uso oficial dependiente;
2. no interpreta el bloqueo como valor cero;
3. no compensa el bloqueo con conocimiento informal;
4. no publica una conclusión oficial que dependa materialmente de la métrica bloqueada;
5. puede explicar qué falta y cuál es el siguiente paso permitido;
6. no recibe un recorrido visual que oculte el estado al pasar a dashboard, investigación, objetivo o salida.

Una decisión humana correcta no cambia el estado de calidad. La resolución de los tres bloqueos permanece en las tareas propietarias de datos/implementación ya definidas por sus contratos; UX008 únicamente comprueba que la experiencia no induce a ignorarlos.

#### 15. Validación de calidad de decisión

Toda sesión deberá separar cuatro resultados:

| Resultado   | Pregunta                                                                                                       |
| ----------- | -------------------------------------------------------------------------------------------------------------- |
| comprensión | ¿entendió correctamente el dato, contexto, calidad, versión y límites?                                         |
| eficiencia  | ¿llegó a la interpretación/acción dentro del tiempo objetivo aplicable y sin navegación improductiva material? |
| decisión    | ¿eligió una acción o conclusión compatible con la evidencia, guardrails, autorización y estado?                |
| explicación | ¿puede explicar a otra persona por qué decidió así y qué incertidumbre permanece?                              |

Una superficie no puede quedar conforme cuando el participante llega por azar a la acción correcta pero explica un significado incorrecto.

Tampoco puede quedar conforme cuando la interpretación es correcta, pero la interfaz induce de manera repetida una acción no autorizada o una decisión incompatible con calidad/guardrails.

#### 16. Taxonomía de severidad

Se preserva la taxonomía transversal aprobada:

- `S0_CRITICAL`: puede producir daño, pérdida, exposición o efecto irreversible;
- `S1_HIGH`: conduce a acción incorrecta o bloqueo frecuente;
- `S2_MEDIUM`: requiere ayuda o produce retraso considerable;
- `S3_LOW`: fricción menor y recuperable;
- `OBSERVATION`: variante o fricción sin impacto demostrado.

Reglas:

1. cualquier `S0_CRITICAL` bloquea el gate de la superficie afectada;
2. cualquier `S1_HIGH` abierto bloquea el cierre de la superficie afectada;
3. varios hallazgos repetidos de menor severidad pueden justificar `REQUIERE_AJUSTE` cuando degradan tiempo o comprensión;
4. satisfacción alta no reduce severidad;
5. un hallazgo de autorización, privacidad o causalidad se clasifica por efecto real posible, no por facilidad de corrección visual;
6. una corrección debe volver a probar el escenario afectado antes de cambiar a `CONFORME_PARA_CIERRE`.

#### 17. Doce errores analíticos que bloquean o fuerzan ajuste

La sesión deberá detectar explícitamente si ocurre alguno de estos patrones:

1. usar un dato `BLOQUEADO` como si estuviera certificado para el uso oficial;
2. interpretar `NO EVALUADO`, nulo, no recibido o desconocido como cero;
3. comparar periodos/versiones/granos incompatibles sin advertir la incompatibilidad;
4. interpretar un filtro seleccionado como alcance de autorización;
5. tratar tablero, reporte, exportación o snapshot como fuente transaccional editable;
6. presentar correlación, coincidencia temporal o output de modelo como causa demostrada;
7. tratar una recomendación como autorización automática para ejecutar un cambio empresarial;
8. confundir indicador principal, driver, baseline, meta o guardrail;
9. declarar éxito ignorando un guardrail o efecto adverso material;
10. asumir que un restatement eliminó la publicación o versión original;
11. tratar `PUBLISH` y `EXPORT` como la misma capacidad o inferir una desde la otra;
12. abrir, inferir o exportar detalle sensible/no autorizado desde un agregado o drill-down.

La severidad se decide por el riesgo del escenario concreto. Los patrones anteriores nunca se descartan como simple preferencia estética.

#### 18. Autorización, privacidad y ética de la prueba

Las sesiones deberán:

- utilizar datos ficticios, minimizados o autorizados para la finalidad de prueba;
- no registrar credenciales, PIN, secretos, datos médicos u otra información que no sea necesaria;
- explicar propósito y uso de la evidencia;
- permitir que la persona detenga la sesión;
- evitar comparar productividad individual de trabajadores;
- evitar convertir tiempos de prueba en métrica disciplinaria;
- pseudonimizar participantes cuando sea posible;
- separar observación de identidad personal;
- no ampliar capacidades por ser participante;
- reautorizar cualquier acción real que la sesión requiera;
- no usar `service_role`, rol, dispositivo, filtro, propiedad funcional o acceso visual como sustituto de autorización;
- conservar `PUBLISH` y `EXPORT` como decisiones separadas;
- no exponer a un participante a datos fuera de su territorio/finalidad para fabricar un escenario.

Si una prueba de seguridad exige comprobar una denegación, deberá construirse con datos controlados o un entorno autorizado; no se obtiene cobertura provocando acceso real indebido.

#### 19. Aplicaciones y propiedad de la evidencia real

La ejecución de este contrato se distribuye por las tareas canónicas de pruebas integrales:

| Cobertura                                                                        | Tarea propietaria de evidencia                            |
| -------------------------------------------------------------------------------- | --------------------------------------------------------- |
| principios generales de experiencia, comprensión, errores, recuperación y tiempo | `UX-QA-001` a `UX-QA-020`                                 |
| SHELL por tipo de actor cuando consuma la experiencia analítica aplicable        | `UX-QA-021`                                               |
| ANIMA con trabajadores y administradores cuando consuma analítica aplicable      | `UX-QA-022`                                               |
| VISO por rol administrativo                                                      | `UX-QA-023`                                               |
| NEXO por rol operativo cuando consuma analítica aplicable                        | `UX-QA-024`                                               |
| FOGO por área productiva cuando consuma analítica aplicable                      | `UX-QA-025`                                               |
| ORIGO por etapa de compra cuando consuma analítica aplicable                     | `UX-QA-026`                                               |
| PULSO por punto operativo cuando consuma analítica aplicable                     | `UX-QA-027`                                               |
| NUMERA por alcance financiero                                                    | `UX-QA-028`                                               |
| PASS como cliente cuando consuma una superficie analítica aplicable              | `UX-QA-029`                                               |
| AURA                                                                             | `UX-QA-030`, únicamente después de aprobar su continuidad |

`UX-QA-020` mantiene el gate de piloto con usuarios reales. Una prueba específica de VISO o NUMERA no sustituye las dimensiones comunes aplicables de `UX-QA-001` a `UX-QA-020`.

#### 20. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA.

La tarea materializa el contrato de evidencia y los escenarios necesarios para comprobar comportamientos ya protegidos por requisitos vigentes. No introduce una regla empresarial, de autorización, seguridad, datos, calidad, interfaz o integración nueva que requiera una identidad adicional en el registro canónico.

#### 21. Gate de readiness

Una superficie solo puede pasar de `PENDIENTE_DE_EVIDENCIA` a `CONFORME_PARA_CIERRE` cuando existan conjuntamente:

1. participantes representativos para el uso real aplicable;
2. escenarios correspondientes ejecutados con protocolo neutral;
3. tiempos observados con puntos de inicio/fin definidos;
4. comprensión de contexto, versión, calidad y efecto demostrada;
5. decisión correcta en los escenarios de riesgo aplicables;
6. `teach-back` compatible con el significado canónico;
7. cobertura de errores, recuperación y excepción cuando corresponda;
8. ausencia de `S0_CRITICAL` abierto;
9. ausencia de `S1_HIGH` abierto;
10. autorización y privacidad preservadas durante la prueba;
11. hallazgos vinculados a requisitos/defectos/tareas propietarias cuando existan;
12. revalidación de los escenarios afectados después de una corrección;
13. decisión de readiness registrada por la tarea `UX-QA-*` propietaria;
14. evidencia suficiente para el ambiente/aplicación donde se pretende ampliar el uso.

No se exige que todas las superficies se cierren simultáneamente. Cada una conserva su estado y evidencia; una superficie conforme no oculta otra bloqueada.

#### 22. Reglas para cobertura insuficiente

Cuando falte evidencia:

```text
FALTA SESIÓN REAL
→ PENDIENTE_DE_EVIDENCIA
→ propietario: UX-QA correspondiente
→ salida: sesión representativa ejecutada y evidencia registrada
```

Cuando una combinación no exista en operación:

```text
COMBINACIÓN NO APLICABLE
→ NO_APLICA
→ razón explícita
→ propietario que confirma la no aplicabilidad
→ sin usar NO_APLICA para ocultar una cobertura difícil
```

Cuando exista un hallazgo material:

```text
HALLAZGO CORREGIBLE
→ REQUIERE_AJUSTE
→ tarea/defecto propietario
→ corrección
→ repetir escenario afectado
```

Cuando exista un riesgo crítico/alto:

```text
S0 O S1 ABIERTO
→ BLOQUEADA
→ no ampliar readiness
→ corregir en tarea propietaria
→ repetir evidencia
```

No se utiliza “sin reportes” como equivalente de conformidad.

#### 23. Evidencia mínima por superficie

Cada una de las siete superficies deberá conservar un paquete trazable que incluya:

- versión de la experiencia o prototipo probado;
- aplicación y ambiente;
- fecha de la sesión;
- `participant_code` y función probada;
- escenario(s) ejecutados;
- datos/contexto utilizados;
- estado de calidad y autorización relevantes;
- tiempos observados;
- primera interpretación y primera acción;
- decisión y explicación;
- ayuda requerida;
- errores y severidad;
- `teach-back`;
- comentario del participante, si lo aporta;
- observación factual del moderador;
- evidencia permitida;
- requisito o defecto vinculado cuando corresponda;
- decisión de gate;
- referencia a revalidación si hubo ajuste.

Los agregados de resultados no sustituyen las observaciones individuales necesarias para reconstruir un hallazgo.

#### 24. Resultados agregados permitidos

Después de ejecutar evidencia real podrán calcularse, por escenario/superficie y sin convertirlos en métricas disciplinarias:

- tasa de decisión correcta;
- tasa de comprensión correcta;
- tasa de `teach-back` correcto;
- mediana y dispersión de tiempo a interpretación correcta;
- mediana y dispersión de tiempo a decisión correcta;
- proporción con ayuda del moderador;
- aperturas incorrectas por escenario;
- tasa de recuperación correcta;
- hallazgos por severidad;
- errores de causalidad;
- errores de calidad/versionado;
- errores de autorización/privacidad;
- dificultad percibida.

No se fija un porcentaje universal de aprobación. Las tareas de prueba deberán establecer criterios compatibles con riesgo, tarea y tiempo objetivo, respetando que un solo `S0` o `S1` abierto bloquea el cierre afectado.

#### 25. Trazabilidad hacia la decisión de producto

Cada hallazgo deberá terminar en uno de estos resultados:

```text
SIN CAMBIO
→ evidencia suficiente y comportamiento conforme

AJUSTE DE EXPERIENCIA
→ superficie/tarea propietaria
→ revalidación requerida

AJUSTE DE TEXTO O TERMINOLOGÍA
→ propietario semántico/UX aplicable
→ revalidación si cambia comprensión

AJUSTE DE DATO / CALIDAD
→ propietario DATA correspondiente
→ UX no certifica la corrección

AJUSTE DE AUTORIZACIÓN
→ propietario AUTH correspondiente
→ UX no amplía permisos

AJUSTE DE INTEGRACIÓN
→ propietario DATA-INT / integración correspondiente
→ UX no implementa el contrato físico

DEFECTO DE IMPLEMENTACIÓN
→ repositorio/tarea propietaria
→ evidencia técnica y nueva prueba

NO_APLICA
→ justificación explícita y verificable
```

Ningún hallazgo material queda como nota sin propietario y condición de salida.

#### 26. Estado material actual del gate

Con las fuentes verificables consumidas para esta tarea:

| Dimensión                                             | Estado                         |
| ----------------------------------------------------- | ------------------------------ |
| contrato de validación DATA                           | `ESPECIFICADO`                 |
| siete superficies mapeadas                            | `ESPECIFICADO` — 7/7           |
| nueve perfiles con regla de cobertura                 | `ESPECIFICADO` — 9/9           |
| escenarios                                            | `ESPECIFICADO` — 14            |
| contrato de tiempos                                   | `ESPECIFICADO`                 |
| contrato de decisión y `teach-back`                   | `ESPECIFICADO`                 |
| privacidad y ética                                    | `ESPECIFICADO`                 |
| sesiones reales vinculadas a esta tarea               | `PENDIENTE_DE_EVIDENCIA`       |
| tiempos humanos medidos vinculados a esta tarea       | `PENDIENTE_DE_EVIDENCIA`       |
| decisiones humanas observadas vinculadas a esta tarea | `PENDIENTE_DE_EVIDENCIA`       |
| defectos derivados de sesiones de esta tarea          | `PENDIENTE_DE_EVIDENCIA`       |
| readiness por superficie                              | `PENDIENTE_DE_EVIDENCIA` — 7/7 |
| implementación física de instrumentación              | `FUERA_DE_ALCANCE`             |

No se interpreta `PENDIENTE_DE_EVIDENCIA` como defecto del contrato documental. Es el estado correcto hasta que `UX-QA-*` produzca observación real.

#### 27. Criterios de aceptación documental

- [x] Se distingue aprobación del contrato frente a ejecución real de sesiones.
- [x] Se preservan las siete superficies de `DATA-UX-001` a `DATA-UX-007`.
- [x] Las siete superficies tienen una pregunta, una decisión, un error crítico y un propietario de evidencia.
- [x] Se preservan los nueve perfiles analíticos heredados sin asignarles acceso por inferencia.
- [x] Se define cómo resolver `NO_APLICA` sin ocultar cobertura.
- [x] Se materializan catorce escenarios de prueba.
- [x] Se incluye un escenario de principio a fin.
- [x] Se incluye calidad, frescura, reconciliación y certificación.
- [x] Se preservan las tres métricas de asistencia bloqueadas.
- [x] Se incluye causalidad y evidencia contradictoria/faltante.
- [x] Se incluyen baseline, meta, driver y guardrail.
- [x] Se distinguen reporte, exportación, suscripción y snapshot.
- [x] Se incluye restatement e historia.
- [x] Se distingue filtro de autorización.
- [x] Se preserva la separación `PUBLISH`/`EXPORT`.
- [x] Se define observación de comprensión mediante predicción, conducta y `teach-back`.
- [x] Se definen campos para tiempos sin inventar umbrales universales.
- [x] Se preserva la taxonomía `S0_CRITICAL` a `OBSERVATION`.
- [x] `S0` y `S1` abiertos bloquean el cierre afectado.
- [x] Se definen reglas de privacidad, minimización y ética.
- [x] Se prohíbe usar tiempos como evaluación disciplinaria.
- [x] Cada falta de evidencia tiene propietario y condición de salida.
- [x] La ejecución real queda asignada a tareas `UX-QA-*` existentes.
- [x] No se declara readiness sin evidencia humana.
- [x] No se crean requisitos de prueba nuevos.
- [x] No se implementa código, datos, integración ni instrumentación física.

#### 28. Límites de la tarea

Esta tarea no:

- recluta participantes;
- agenda ni simula sesiones;
- inventa tiempos;
- inventa respuestas de participantes;
- inventa satisfacción;
- inventa defectos observados;
- declara aprobada una aplicación por ausencia de evidencia negativa;
- modifica métricas, fórmulas, fuentes o calidad;
- cambia estados DQ;
- publica, exporta o fija metas;
- modifica permisos o autorización;
- implementa instrumentación, telemetría, BI, modelos o IA;
- ejecuta `DATA-INT-*`;
- habilita AURA antes de su continuidad;
- sustituye las pruebas integrales del BLOQUE U.

#### 29. Handoff exacto

La salida documental de `DATA-UX-008` queda disponible para:

- `UX-QA-001` a `UX-QA-020` como contrato común de comprensión, tiempo, errores, recuperación y piloto;
- `UX-QA-023` para VISO;
- `UX-QA-028` para NUMERA;
- las pruebas por aplicación `UX-QA-021` a `UX-QA-029` cuando consuman superficies analíticas;
- `UX-QA-030` para AURA solo después de aprobar su continuidad;
- `DATA-INT-001` como siguiente tarea reservada del mini-bloque AB, sin que este handoff autorice iniciar integraciones antes de la continuidad correspondiente.

La condición de salida del estado `PENDIENTE_DE_EVIDENCIA` es una sesión real trazable bajo la tarea `UX-QA-*` propietaria, seguida de una decisión de gate compatible con los hallazgos.

#### 30. Continuidad

ÚLTIMA TAREA APROBADA
`DATA-UX-007 — Diseñar reportes, exportaciones, suscripciones y snapshots versionados`

TAREA ACTUAL APROBADA
`DATA-UX-008 — Validar comprensión, tiempos y decisiones con usuarios reales`

SIGUIENTE TAREA RESERVADA
`DATA-INT-001 — Definir contratos de eventos y lectura con todas las aplicaciones y fuentes externas`

