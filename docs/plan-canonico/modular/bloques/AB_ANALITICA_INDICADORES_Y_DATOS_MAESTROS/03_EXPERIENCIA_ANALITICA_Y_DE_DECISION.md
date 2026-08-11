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


### [ ] DATA-UX-002 — Diseñar catálogo de métricas y datos maestros con definición, dueño, fuente, calidad y linaje
### [ ] DATA-UX-003 — Diseñar tableros por dominio con filtros, comparación, drill-down y trazabilidad
### [ ] DATA-UX-004 — Diseñar centro de calidad, frescura, conciliaciones y certificación
### [ ] DATA-UX-005 — Diseñar espacio de investigación de variaciones, anomalías y causas
### [ ] DATA-UX-006 — Diseñar objetivos, metas, drivers, guardrails y acciones de mejora
### [ ] DATA-UX-007 — Diseñar reportes, exportaciones, suscripciones y snapshots versionados
### [ ] DATA-UX-008 — Validar comprensión, tiempos y decisiones con usuarios reales
