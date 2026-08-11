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


### [ ] DATA-UX-003 — Diseñar tableros por dominio con filtros, comparación, drill-down y trazabilidad
### [ ] DATA-UX-004 — Diseñar centro de calidad, frescura, conciliaciones y certificación
### [ ] DATA-UX-005 — Diseñar espacio de investigación de variaciones, anomalías y causas
### [ ] DATA-UX-006 — Diseñar objetivos, metas, drivers, guardrails y acciones de mejora
### [ ] DATA-UX-007 — Diseñar reportes, exportaciones, suscripciones y snapshots versionados
### [ ] DATA-UX-008 — Validar comprensión, tiempos y decisiones con usuarios reales
