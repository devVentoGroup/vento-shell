### MINI-BLOQUE — INVENTARIO INTERACCION Y PERFILES DE ESTACION

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **inventario interaccion y perfiles de estacion** dentro de **E2 PROCESOS Y EXPERIENCIA**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `UX-STATION-001` a `UX-STATION-003` — 3 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `UX-STATION-001`: Inventariar puestos físicos, zonas de trabajo y condiciones reales de operación
- `UX-STATION-002`: Comparar modalidades de interacción para cada paso operativo
- `UX-STATION-003`: Definir perfiles canónicos de estación compartida
<!-- PLAN-SECTION-META:END -->

### ✅ UX-STATION-001 — Inventariar puestos físicos, zonas de trabajo y condiciones reales de operación

**Estado:** APROBADA

**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal

**Marcador exacto que reemplaza:** `### [ ] UX-STATION-001 — Inventariar puestos físicos, zonas de trabajo y condiciones reales de operación`

**Tarea anterior:** `PROC-ACTOR-010 — Prohibir autorización derivada únicamente del nombre del rol` — APROBADA

**Siguiente tarea reservada:** `OPS-CAN-001 — Diseñar la arquitectura objetivo de canales corporativos y comerciales`

**Artefacto producido:** `UX-STATION-INVENTORY-001`

**Cambios en código, migraciones o Supabase:** no autorizados

---

#### 1. Propósito

Crear una línea base única de los lugares, áreas, puestos, dispositivos,
periféricos y condiciones físicas que deberán soportar la experiencia
operativa de Vento OS.

Esta tarea describe el **AS-IS físico y operativo**. No selecciona todavía
hardware objetivo, modalidad definitiva de interacción, montaje, navegación,
pantallas ni arquitectura de autorización.

---

#### 2. Dependencias canónicas

- BLOQUE E1 cerrado con resultado `PASS_WITH_CARRYOVER`;
- `PROC-CAT-001` a `PROC-CAT-020`;
- `PROC-ACTOR-001` a `PROC-ACTOR-010`;
- catálogo de áreas, sedes, zonas y capacidades de BLOQUE E1;
- auditoría de dispositivos y seguridad de BLOQUE A;
- `TREQ-UX-004`, que protege la viabilidad física de estaciones y
  periféricos.

Las observaciones históricas de E1 son evidencia inicial. No se convierten
automáticamente en especificación objetivo ni prueban que la condición siga
vigente.

---

#### 3. Alcance territorial

El inventario cubrirá:

| Lugar canónico       | Cobertura mínima                                                                                                                             |
| -------------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| Oficina 1            | puestos administrativos que participan o supervisan procesos operativos                                                                      |
| Centro de Producción | bodega, recepción, despacho, Cocina Caliente, Panadería y Bollería, Repostería, Pastelería y Tortas, Galletería, Barra y Servicios Generales |
| Vento Café           | caja, servicio interior, servicio exterior, cocina, bar, barra, mostrador y entrega                                                          |
| Saudo                | caja, servicio, cocina, bebidas, mostrador y entrega                                                                                         |
| Molka                | mostrador, caja, preparación, servicio y entrega                                                                                             |

`Centro de Distribución` no se inventariará como sede: E1 confirmó que no
existe físicamente y que la logística se ejecuta desde el Centro de
Producción.

---

#### 4. Unidad mínima de inventario

Cada fila de `UX-STATION-INVENTORY-001` representará una combinación
observable:

```text
LUGAR
+ ÁREA O ZONA
+ PUESTO O PUNTO DE TRABAJO
+ FUNCIÓN OPERATIVA
+ FRANJA O CONDICIÓN RELEVANTE
```

No se fusionarán puestos únicamente porque utilicen la misma aplicación o el
mismo nombre de rol.

---

#### 5. Campos obligatorios

| Grupo           | Campos                                                                                             |
| --------------- | -------------------------------------------------------------------------------------------------- |
| identidad       | ID estable, lugar, área, zona, nombre operativo y responsable de verificación                      |
| operación       | procesos y pasos observados, actor habitual, relevos, concurrencia y picos                         |
| movilidad       | fijo, semifijo, móvil, recorrido, distancia y cambios de zona                                      |
| interacción     | manos libres u ocupadas, guantes, humedad, grasa, ruido, iluminación, postura y lectura disponible |
| dispositivo     | equipo observado, propiedad, uso personal o compartido, ubicación y aplicaciones usadas            |
| sesión          | cuenta individual o conjunta, cambio de actor, bloqueo, abandono y atribución real                 |
| periféricos     | impresora, escáner, cámara, datáfono, campana, comandera, etiqueta u otro apoyo                    |
| infraestructura | energía, montaje, protección física, red, señal, carga y mantenimiento                             |
| contingencia    | operación manual, pérdida de red o energía, equipo alterno y reconciliación posterior              |
| evidencia       | fuente, fecha, observador, soporte permitido y nivel de confianza                                  |
| estado          | `CONFIRMADO`, `CONFIRMADO_PARCIAL`, `POR_VERIFICAR` o `NO_APLICA`                                  |

No se recopilarán PIN, contraseña, token, dato de pago ni información personal
innecesaria.

---

#### 6. Línea base documental conocida

| Lugar o familia                   | Hecho documentado que debe verificarse                                                                                           | Estado inicial       |
| --------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- | -------------------- |
| Vento Café — servicio             | los meseros usan una tablet compartida con cuenta conjunta de Servicio                                                           | `CONFIRMADO_PARCIAL` |
| Vento Café — caja                 | existe una estación de caja; el datáfono puede circular y el pago se informa verbalmente                                         | `CONFIRMADO_PARCIAL` |
| Vento Café — cocina, bar y barra  | Makos distribuye comandas; existen impresoras y entrega mediante ventana o campana                                               | `CONFIRMADO_PARCIAL` |
| Saudo — servicio                  | se utiliza tablet compartida o celular con cuenta operativa conjunta                                                             | `CONFIRMADO_PARCIAL` |
| Saudo — caja y cocina             | la comunicación ordinaria es verbal; existe una impresora que no se usa habitualmente                                            | `CONFIRMADO_PARCIAL` |
| Molka — mostrador                 | una persona puede atender, cobrar, preparar, servir y entregar desde un flujo concentrado                                        | `CONFIRMADO_PARCIAL` |
| Centro de Producción — bodega     | existe referencia técnica a un kiosco de bodega con política amplia que requiere verificación física y funcional                 | `CONFIRMADO_PARCIAL` |
| Centro de Producción — producción | existen áreas con frío, mesones, canastas, bandejas y trabajo manual cuya interacción física aún no está inventariada por puesto | `POR_VERIFICAR`      |
| dispositivos compartidos          | la auditoría no encontró sesiones persistidas de actor en tablets o dispositivos operativos compartidos                          | `CONFIRMADO_PARCIAL` |

`CONFIRMADO_PARCIAL` significa que existe evidencia documental suficiente para
iniciar el inventario, pero no una observación física vigente y completa.

---

#### 7. Instrumento de verificación

La verificación podrá ejecutarla un responsable de sede o área sin
conocimientos técnicos:

1. recorrer cada área durante una condición ordinaria y, cuando sea posible,
   durante un pico;
2. identificar cada punto donde se consulta, registra, confirma, imprime,
   escanea, cobra, entrega o corrige;
3. registrar quién lo usa realmente y cómo cambia el actor;
4. anotar restricciones físicas y ambientales;
5. identificar dispositivo, periféricos, energía y red disponibles;
6. describir qué ocurre cuando el equipo o la conexión no están disponibles;
7. adjuntar únicamente evidencia no sensible y necesaria;
8. confirmar la fila con responsable del área y fecha.

Una respuesta `NO SÉ` se convertirá en `POR_VERIFICAR`; nunca se sustituirá
por una suposición técnica.

---

#### 8. Reglas de calidad y cierre de vacíos

1. Cada lugar y área tendrá al menos una fila o una justificación
   `NO_APLICA`.
2. Toda fila tendrá fuente, fecha y responsable de verificación.
3. Un dispositivo registrado en Supabase no probará por sí solo su existencia,
   ubicación o uso físico vigente.
4. Una plantilla de dispositivo no se confundirá con una instancia real.
5. Cuenta compartida, dispositivo compartido y estación compartida se
   registrarán como conceptos distintos.
6. Las variantes por sede o turno se conservarán como condiciones, no como
   procesos duplicados.
7. Todo `POR_VERIFICAR` que permanezca al aprobar esta tarea tendrá:
   responsable, evidencia requerida, condición de activación y cierre en
   `UX-STATION-008`.
8. Un riesgo de identidad o autorización se vinculará además con
   `AUTH-DEV-001` a `AUTH-DEV-016`.
9. Un vacío de red, energía, dispositivo o contingencia alimentará
   `NFR-REQ-004`, `NFR-REQ-008`, `NFR-REQ-010` o `NFR-REQ-011`, según
   corresponda.

---

#### 9. Uso posterior del inventario

| Decisión                               | Tarea propietaria                                 |
| -------------------------------------- | ------------------------------------------------- |
| comparar modalidades de interacción    | `UX-STATION-002`                                  |
| definir perfiles canónicos de estación | `UX-STATION-003`                                  |
| identidad y cambio de actor            | `UX-STATION-004`; `AUTH-DEV-001` a `AUTH-DEV-016` |
| superficie contextual                  | `UX-STATION-005`                                  |
| hardware y periféricos objetivo        | `UX-STATION-006`                                  |
| contingencia y recuperación            | `UX-STATION-007`                                  |
| gramática, bandeja y composición       | `UX-STATION-010` a `UX-STATION-012`               |
| validación con trabajadores            | `UX-STATION-008`                                  |
| matriz final                           | `UX-STATION-009`                                  |
| contrato de pantallas                  | `PROC-SCREEN-001` a `PROC-SCREEN-028`             |

---

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea crea un inventario documental del entorno físico y
no introduce ni modifica comportamiento ejecutable. La regla de viabilidad
física ya está protegida por `TREQ-UX-004`; sus escenarios se concretarán
durante `UX-STATION-008` y la planificación de pruebas correspondiente.

---

#### 10. Criterios de aceptación

- [ ] Los cinco lugares reales y todas sus áreas relevantes están cubiertos.
- [ ] `Centro de Distribución` no reaparece como sede física.
- [ ] Cada fila usa la unidad mínima y los campos obligatorios.
- [ ] Se distinguen puesto, estación, dispositivo, sesión, actor y periférico.
- [ ] Se documentan movilidad, ergonomía, higiene, ambiente, energía y red.
- [ ] Se documenta la contingencia observada sin diseñar todavía la solución.
- [ ] Toda evidencia tiene fuente, fecha, responsable y nivel de confianza.
- [ ] No se recopilan secretos ni datos personales innecesarios.
- [ ] Cada vacío conserva un destino exacto y una condición de cierre.
- [ ] No se seleccionó hardware, modalidad o pantalla definitiva.
- [ ] No se implementó código, migraciones ni cambios en Supabase.
- [ ] `OPS-CAN-001` permanece sin iniciar.

---

#### 11. Estado y continuidad

```text
PROC-ACTOR-010 APROBADA
UX-STATION-001 APROBADA
OPS-CAN-001 NO INICIADA
```

No se inicia `OPS-CAN-001` hasta la aprobación expresa de esta tarea y una
solicitud explícita de continuidad.


### ✅ UX-STATION-002 — Comparar modalidades de interacción para cada paso operativo

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Marcador exacto que reemplaza:** `### [ ] UX-STATION-002 — Comparar modalidades de interacción para cada paso operativo`  
**Tarea anterior:** `NFR-REQ-011 — Definir compatibilidad mínima por dispositivo` — APROBADA  
**Siguiente tarea reservada:** `UX-STATION-003 — Definir perfiles canónicos de estación compartida` — NO INICIADA  
**Artefactos aprobados:** `UX-STATION-MODALITY-COMPARISON-CONTRACT-001`; `UX-STATION-STEP-MODALITY-MATRIX-001`; `UX-STATION-MODALITY-SCORING-MODEL-001`; `UX-STATION-PROTOTYPE-BACKLOG-001`; `UX-STATION-MODALITY-REJECTION-REGISTER-001`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`, con descomposición por paso, variante territorial y condición operativa  
**Naturaleza:** contrato comparativo de modalidades de interacción y selección de candidatos para prototipo; no aprobación final de estación, compra de hardware, diseño definitivo de pantallas ni implementación técnica  
**Cambios en código, componentes, aplicaciones, migraciones, Supabase, red, hardware, periféricos, montaje, compras o despliegues:** no autorizados

---

#### 1. Propósito

Definir un método único, verificable y trazable para comparar las modalidades mediante las cuales una persona, estación o periférico podrá observar, capturar, confirmar, corregir y cerrar cada paso operativo de Vento OS.

```text
QUE UNA MODALIDAD SEA POSIBLE
≠ QUE SEA ADECUADA

QUE SEA RÁPIDA EN UNA DEMOSTRACIÓN
≠ QUE SEA SEGURA DURANTE UN PICO

QUE USE MENOS TOQUES
≠ QUE PRODUZCA MENOS ERRORES

QUE NO REQUIERA PERIFÉRICO
≠ QUE SEA MÁS BARATA EN OPERACIÓN

QUE RESULTE RECOMENDADA PARA PROTOTIPO
≠ QUE QUEDE APROBADA COMO MODALIDAD FINAL
```

La tarea no elegirá una única forma de interacción para toda una aplicación, rol o sede. Cada decisión se realizará por paso operativo y condición real.

---

#### 2. Continuidad lógica y ubicación en la secuencia

`UX-STATION-001` inventarió los puestos, zonas y condiciones físicas observadas. Posteriormente se aprobaron procesos transversales, capacidades de talento, principios UX y los requisitos no funcionales `NFR-REQ-001` a `NFR-REQ-011`.

La secuencia vigente continúa así:

```text
REALIDAD FÍSICA INVENTARIADA
+ PROCESOS Y ACTORES APROBADOS
+ PRINCIPIOS UX
+ REQUISITOS NO FUNCIONALES
        ↓
UX-STATION-002
COMPARAR MODALIDADES POR PASO
        ↓
UX-STATION-003 a UX-STATION-007
DISEÑAR ESTACIÓN, IDENTIDAD, SUPERFICIE,
PERIFÉRICOS Y CONTINGENCIA
        ↓
UX-STATION-010 a UX-STATION-012
DEFINIR GRAMÁTICA Y COMPOSICIÓN
        ↓
UX-STATION-008
PROTOTIPAR CON TRABAJADORES
        ↓
UX-STATION-009
APROBAR LA MATRIZ FINAL
```

Por tanto, esta tarea produce **candidatos comparados**, no decisiones finales irrevocables.

---

#### 3. Alcance

La comparación cubrirá como mínimo:

- los procesos `VPROC-0001` a `VPROC-0069`;
- cada paso donde una persona o equipo consulta, identifica, captura, selecciona, cuenta, pesa, escanea, confirma, corrige, imprime, cobra, entrega, aprueba o cierra;
- variantes por sede, área, zona, turno, pico, movilidad y contingencia;
- operación individual, compartida, fija, semifija y móvil;
- tareas administrativas, productivas, logísticas, comerciales y de soporte;
- condiciones de manos libres u ocupadas, guantes, humedad, grasa, frío, calor, ruido, reflejo, distancia y movimiento;
- conexión normal, degradada, intermitente y ausente;
- disponibilidad o falla de cámara, escáner, impresora, datáfono, báscula, sensor, teclado, mouse y táctil;
- necesidades visuales, auditivas, motrices, cognitivas, temporales y situacionales;
- operación ordinaria, excepción, reverso, corrección y recuperación.

Una variante podrá compartir resultado con otra únicamente cuando sus diferencias no cambien seguridad, ergonomía, accesibilidad, trazabilidad, rendimiento, hardware o contingencia.

---

#### 4. Exclusiones

Esta tarea no:

- diseña todavía el perfil completo de una estación;
- define el mecanismo definitivo de identificación del trabajador;
- diseña pantallas, navegación o componentes finales;
- selecciona marca, modelo, proveedor o referencia comercial;
- aprueba una modalidad solo por costo o disponibilidad actual;
- sustituye la observación física ni la prueba con trabajadores;
- declara compatible un dispositivo concreto;
- autoriza cuentas compartidas, bypasses de autorización o captura sin actor;
- implementa lectores, colas, drivers, APIs, PWA, almacenamiento local ni integración con periféricos;
- ejecuta compras, instalaciones, cableado, montaje o despliegues.

---

#### 5. Distinciones canónicas

| Concepto                 | Definición                                                                                 |
| ------------------------ | ------------------------------------------------------------------------------------------ |
| paso operativo           | unidad de trabajo con entrada, actor, acción, resultado, estado y evidencia esperada       |
| modalidad de interacción | forma primaria mediante la cual se observa o produce la acción                             |
| estación                 | combinación física y lógica de lugar, dispositivo, montaje, sesión, contexto y periféricos |
| dispositivo              | equipo de cómputo que ejecuta o presenta la aplicación                                     |
| periférico               | equipo especializado que captura, emite o confirma información                             |
| superficie               | contenido y acciones mostrados al actor en un contexto determinado                         |
| fallback                 | alternativa autorizada que conserva resultado, control y evidencia                         |
| contingencia             | procedimiento temporal gobernado ante indisponibilidad o degradación                       |
| candidato                | modalidad que supera la comparación documental y debe probarse                             |
| modalidad final          | alternativa aprobada posteriormente por `UX-STATION-009` después del prototipo             |

Una impresora no será una modalidad completa por sí sola; una cámara no será equivalente a un escáner solo porque ambos lean códigos; una pantalla táctil no definirá automáticamente una estación compartida.

---

#### 6. Unidad mínima de comparación

Cada fila de `UX-STATION-STEP-MODALITY-MATRIX-001` representará:

```text
PROCESS_ID Y PROCESS_VERSION
+ STEP_ID Y STEP_VERSION
+ SEDE, ÁREA, ZONA O VARIANTE
+ ACTOR Y CONTEXTO EFECTIVOS
+ CONDICIÓN OPERATIVA
+ MODALIDAD CANDIDATA
```

No se permitirá una sola fila genérica por aplicación, módulo, rol o pantalla cuando existan pasos con frecuencia, riesgo o ambiente distintos.

---

#### 7. Catálogo inicial de modalidades comparables

| Código                       | Modalidad                                  | Uso previsto                                                                        |
| ---------------------------- | ------------------------------------------ | ----------------------------------------------------------------------------------- |
| `IM0_MANUAL_CONTROLLED`      | procedimiento manual controlado            | contingencia, captura temporal o respaldo con folio, custodia y conciliación        |
| `IM1_TOUCH_VISUAL`           | interacción táctil visual                  | selección, confirmación y captura directa sobre pantalla táctil                     |
| `IM2_KEYBOARD_POINTER`       | teclado y dispositivo apuntador            | trabajo administrativo, captura extensa, consulta y navegación de precisión         |
| `IM3_FIXED_SCANNER`          | escáner fijo o presentación ante lector    | pasos repetitivos en punto estable con manos parcialmente ocupadas                  |
| `IM4_HANDHELD_SCANNER`       | escáner portátil                           | movilidad, recorrido, conteo, recepción, picking y validación física                |
| `IM5_DEVICE_CAMERA`          | cámara del dispositivo                     | lectura ocasional, evidencia visual o identificación sin lector dedicado            |
| `IM6_CONTEXT_AUTOMATION`     | captura automática desde contexto o sensor | identidad de estación, ubicación, peso, estado o evento observable sin redigitación |
| `IM7_SPECIALIZED_PERIPHERAL` | periférico especializado                   | datáfono, báscula, medidor, impresora, display u otro equipo con contrato propio    |
| `IM8_ORCHESTRATED_HYBRID`    | modalidad híbrida orquestada               | combinación deliberada de dos o más modalidades con un único resultado coherente    |

El catálogo es extensible mediante decisión documentada. Una modalidad nueva deberá declarar capacidad, riesgo, fallback, soporte, evidencia y tarea propietaria.

---

#### 8. Regla de aplicabilidad

Cada modalidad se clasificará inicialmente como:

| Estado                     | Significado                                                                |
| -------------------------- | -------------------------------------------------------------------------- |
| `APPLICABLE`               | puede compararse porque responde al paso y al ambiente                     |
| `CONDITIONALLY_APPLICABLE` | requiere condición, periférico, montaje o control adicional                |
| `NOT_APPLICABLE`           | no produce el resultado o contradice una restricción verificable           |
| `EVIDENCE_REQUIRED`        | no existe evidencia suficiente para evaluarla                              |
| `FORBIDDEN`                | vulnera seguridad, autorización, integridad, privacidad o seguridad física |

`NOT_APPLICABLE` y `FORBIDDEN` deberán conservar razón y fuente; no se eliminarán silenciosamente de la matriz.

---

#### 9. Puertas duras previas a cualquier puntuación

Una modalidad no podrá convertirse en candidata si falla cualquiera de estas puertas:

1. **resultado empresarial:** permite completar el paso y producir el estado esperado;
2. **seguridad física e higiene:** no introduce riesgo inaceptable por postura, alcance, cable, calor, humedad, grasa o contaminación;
3. **identidad y autorización:** conserva actor efectivo, dispositivo, sede, área, turno, permiso y segregación;
4. **integridad y evidencia:** valida contexto, evita duplicados y conserva receipt o prueba proporcional;
5. **accesibilidad:** ofrece equivalencia funcional y señales perceptibles según `NFR-REQ-007`;
6. **privacidad:** limita exposición, persistencia y observación por terceros;
7. **compatibilidad:** dispone de dispositivo, runtime, capacidad y periférico soportables;
8. **degradación y recuperación:** tiene estado de falla, alternativa autorizada y conciliación;
9. **mantenibilidad:** puede diagnosticarse, probarse, sustituirse y mantenerse sin conocimiento informal único.

Una puntuación alta no compensará una puerta dura fallida.

---

#### 10. Modelo de puntuación comparativa

Las modalidades que superen las puertas duras se evaluarán de `0` a `4`:

| Valor | Interpretación                                |
| ----: | --------------------------------------------- |
|   `0` | incompatible o daño inaceptable               |
|   `1` | deficiente; requiere rediseño sustancial      |
|   `2` | viable con condiciones y controles relevantes |
|   `3` | adecuada para prototipo                       |
|   `4` | fuerte candidata según evidencia disponible   |

Dimensiones mínimas:

- ajuste al resultado y frecuencia;
- tiempo y rendimiento durante operación ordinaria y pico;
- carga física, postura, alcance, precisión y repetición;
- carga cognitiva, lectura, memoria y cambio de contexto;
- accesibilidad y equivalencia;
- prevención, detección y corrección de errores;
- actor, autorización, segregación y privacidad;
- trazabilidad, idempotencia y evidencia;
- movilidad y adecuación ambiental;
- conectividad, offline y recuperación;
- dependencia de hardware, consumibles y mantenimiento;
- soporte, diagnóstico y sustituibilidad;
- costo total de ciclo de vida;
- aprendizaje, adopción y riesgo de uso informal.

No existirá una ponderación universal. Cada arquetipo de paso declarará pesos y justificación versionados.

---

#### 11. Arquetipos de paso y ponderación

| Arquetipo                          | Dimensiones que normalmente dominan                                         |
| ---------------------------------- | --------------------------------------------------------------------------- |
| captura repetitiva de alto volumen | rendimiento, error, ergonomía, duplicación y mantenimiento                  |
| decisión crítica o irreversible    | identidad, contexto, confirmación, evidencia y corrección                   |
| consulta rápida                    | legibilidad, latencia, siguiente acción y mínima carga cognitiva            |
| movilidad y recorrido              | peso, batería, cobertura, manos disponibles, caída y sustitución            |
| trabajo administrativo extenso     | teclado, foco, estructura, precisión y multitarea controlada                |
| preparación o producción           | higiene, guantes, humedad, manos ocupadas, distancia y señales alternativas |
| cobro o conciliación               | monto, referencia, resultado desconocido, segregación e idempotencia        |
| impresión o etiquetado             | routing, plantilla, consumible, receipt, sustituto y recuperación           |
| pesaje o medición                  | unidad, rango, tara, estabilidad, calibración, timestamp y captura          |
| contingencia                       | folio, custodia, límite, evidencia, transcripción y conciliación            |

Los arquetipos orientan los pesos; no sustituyen la evaluación del paso concreto.

---

#### 12. Campos obligatorios de la matriz

Cada fila conservará como mínimo:

```text
comparison_id
process_id
process_version
step_id
step_version
site_scope
area_or_zone
station_inventory_reference
actor_and_context
operational_condition
criticality_and_frequency
input_and_expected_outcome
candidate_modality_code
applicability_state
hard_gate_results
score_profile_version
scores_by_dimension
weighted_result
required_device_profile
required_peripherals
network_and_offline_assumptions
accessibility_and_ergonomic_constraints
identity_and_privacy_constraints
failure_modes
fallback_and_contingency
correction_and_recovery
source_evidence
confidence_level
rejected_alternatives
prototype_question
prototype_priority
responsible_task
status
version
```

No se aceptará una recomendación sin restricciones, supuestos, fallas y alternativa documentados.

---

#### 13. Procedimiento obligatorio de comparación

Para cada paso:

1. confirmar proceso, versión, actor, resultado y criticidad;
2. vincular la condición física de `UX-STATION-INVENTORY-001`;
3. identificar variantes territoriales, de turno, pico y contingencia;
4. enumerar todas las modalidades razonablemente aplicables;
5. justificar `NOT_APPLICABLE` o `FORBIDDEN`;
6. ejecutar las puertas duras;
7. aplicar el perfil de puntuación correspondiente;
8. identificar fallas parciales, resultado desconocido y recuperación;
9. definir fallback sin ampliar permisos ni reducir evidencia;
10. comparar costo total, soporte y sustitución;
11. registrar la alternativa preferida y una secundaria cuando sea viable;
12. convertir toda incertidumbre material en pregunta de prototipo;
13. dirigir cada vacío a una tarea existente;
14. marcar como máximo `RECOMMENDED_FOR_PROTOTYPE`, nunca `APPROVED_FINAL`.

---

#### 14. Estados de decisión

| Estado                      | Significado                                                |
| --------------------------- | ---------------------------------------------------------- |
| `NOT_EVALUATED`             | el paso todavía no fue comparado                           |
| `EVIDENCE_INCOMPLETE`       | la decisión depende de observación o dato faltante         |
| `COMPARISON_IN_PROGRESS`    | modalidades y puertas están siendo evaluadas               |
| `REJECTED`                  | modalidad descartada con razón conservada                  |
| `CANDIDATE_WITH_CONDITIONS` | supera puertas, pero requiere controles o diseño posterior |
| `RECOMMENDED_FOR_PROTOTYPE` | candidata priorizada para `UX-STATION-008`                 |
| `NO_APLICA`                 | el paso no requiere interacción en esa variante            |
| `SUPERSEDED`                | comparación sustituida por una versión posterior           |

`APPROVED_FINAL` no es un estado permitido en esta tarea.

---

#### 15. Reglas para interacción táctil

La modalidad táctil deberá evaluar:

- tamaño y separación de objetivos;
- frecuencia y riesgo de toque accidental;
- guantes, humedad, grasa, frío, reflejo y vibración;
- postura, altura, inclinación, alcance y mano disponible;
- teclado virtual, orientación y zoom;
- confirmación de acciones críticas;
- limpieza y contaminación cruzada;
- alternativa para teclado, lector de pantalla o limitación motriz cuando aplique;
- persistencia de foco, estado y datos tras suspensión o cambio de actor.

Una pantalla grande no probará por sí sola ergonomía ni legibilidad.

---

#### 16. Reglas para teclado y dispositivo apuntador

Se compararán:

- volumen y precisión de captura;
- navegación completa por teclado;
- foco visible y orden lógico;
- atajos documentados sin conflicto;
- postura prolongada y espacio físico;
- uso en estación fija o móvil;
- acceso mediante tecnología de asistencia;
- protección frente a envío, borrado o confirmación accidental.

No se elegirá teclado para una zona móvil o contaminada únicamente porque facilite desarrollo.

---

#### 17. Reglas para escáner fijo, portátil y cámara

Cada alternativa deberá comparar:

- formatos, calidad, distancia, orientación e iluminación;
- velocidad de lectura y doble lectura;
- manos ocupadas y recorrido;
- emparejamiento, batería, roaming y caída;
- validación del valor contra el recurso, ubicación y estado esperados;
- lectura parcial, ilegible, ajena o duplicada;
- alternativa manual autorizada;
- privacidad de imágenes y temporales;
- mantenimiento, limpieza, reemplazo y diagnóstico;
- idempotencia y receipt del resultado.

Escanear un código no equivale a validar que el objeto correcto se encuentre en el contexto correcto.

---

#### 18. Reglas para captura automática y sensores

Toda captura automática deberá declarar:

- fuente, identidad y estado del sensor;
- magnitud, unidad, rango, resolución, tolerancia y calibración;
- timestamp y relación con el paso;
- calidad, frescura y estabilidad;
- posibilidad de revisión y corrección autorizada;
- tratamiento de lectura ausente, fuera de rango o conflictiva;
- atribución entre dato observado y decisión humana;
- fallback y reconciliación;
- evidencia que permita explicar el valor posteriormente.

La automatización no podrá ocultar una inferencia como si fuera un hecho confirmado.

---

#### 19. Reglas para periféricos especializados

Datáfonos, básculas, impresoras, displays, luces, campanas y otros periféricos se evaluarán como sistemas con estados propios:

```text
DISPONIBLE
+ CONFIGURADO
+ CONECTADO
+ CAPAZ
+ RESPONDIÓ
+ RESULTADO CONFIRMADO
```

La solicitud enviada no demostrará resultado físico. Cada paso deberá distinguir timeout, rechazo, resultado desconocido, consumible agotado, sustitución y recuperación.

---

#### 20. Reglas para modalidad híbrida

Una modalidad híbrida deberá:

- producir una sola intención empresarial;
- mantener correlación entre las modalidades;
- evitar doble captura o doble efecto;
- declarar cuál fuente prevalece en conflicto;
- conservar un único actor y contexto efectivos;
- permitir reanudación después de falla parcial;
- ofrecer experiencia coherente aunque cambie el periférico;
- registrar qué modalidad produjo cada evidencia.

Agregar un escáner a un formulario sin eliminar la redigitación duplicada no será una modalidad híbrida válida.

---

#### 21. Reglas para procedimiento manual controlado

`IM0_MANUAL_CONTROLLED` solo será candidato cuando declare:

- condición de activación y autoridad;
- formulario, folio o numeración controlada;
- actor, hora, sede, área y recurso;
- datos mínimos y prohibiciones;
- custodia, acceso y protección;
- límite temporal y capacidad máxima;
- método de transcripción o reincorporación;
- idempotencia, revisión y conciliación;
- tratamiento de errores y faltantes;
- condición de cierre y destrucción o archivo.

Una nota libre, mensaje verbal o fotografía no estructurada no constituirá contingencia aprobada.

---

#### 22. Identidad y estaciones compartidas

Toda modalidad deberá preservar:

```text
DISPOSITIVO O ESTACIÓN
+ PRINCIPAL TÉCNICO
+ ACTOR HUMANO EFECTIVO
+ SEDE Y ÁREA
+ TURNO Y CHECK-IN
+ PROCESO Y PASO
+ PERMISO Y CONTEXTO
```

El cambio de modalidad no podrá cambiar silenciosamente al actor. El cambio de trabajador deberá retirar contenido, preferencias, borradores, selecciones, portapapeles y datos sensibles del actor anterior conforme a `UX-STATION-004` y `AUTH-DEV-*`.

---

#### 23. Accesibilidad y ergonomía

La comparación incorporará el contrato de `NFR-REQ-007` y verificará:

- alternativa equivalente para gestos, sonido, color o trayectoria precisa;
- objetivos, foco, semántica, contraste, zoom y reflow;
- señales visuales, sonoras y hápticas equivalentes cuando corresponda;
- duración, repetición, fuerza, precisión, postura y alcance;
- necesidades permanentes, temporales y situacionales;
- comprensión del estado, error y siguiente acción;
- viabilidad con trabajador real y no solo con diseñador o desarrollador.

Una alternativa accesible no podrá omitir confirmación, autorización, privacidad o auditoría.

---

#### 24. Conectividad, offline y degradación

Cada modalidad indicará:

- dependencias de red, Internet, backend, DNS y periférico;
- datos o catálogos requeridos localmente;
- comportamiento ante latencia, pérdida, reconexión y resultado desconocido;
- qué acciones pueden quedar como borrador o intención pendiente;
- cuándo una operación deberá bloquearse;
- cómo se preservan orden, actor, contexto, versión e idempotencia;
- cómo se informa estado local, sincronizado, confirmado o en conflicto;
- fallback y conciliación posteriores.

La modalidad más rápida online no será preferida si falla de forma opaca bajo la conectividad real del puesto.

---

#### 25. Prevención, corrección y recuperación de errores

La comparación incluirá al menos:

- recurso equivocado;
- ubicación o área incorrecta;
- lectura duplicada o parcial;
- cantidad, unidad o monto incorrectos;
- actor o contexto vencido;
- toque accidental;
- envío repetido por timeout;
- periférico desconectado durante la acción;
- aplicación suspendida o cerrada;
- pérdida de red después de confirmar;
- cambio de trabajador con operación incompleta;
- corrección, reverso o cancelación posterior.

La modalidad preferida deberá reducir el error y, cuando ocurra, hacerlo visible y recuperable sin crear un segundo hecho.

---

#### 26. Privacidad y exposición

Se comparará:

- información visible por distancia y ángulo;
- permanencia en pantalla compartida;
- datos en imágenes, archivos, temporales y portapapeles;
- contenido emitido por impresora, display o señal sonora;
- minimización del payload y del diagnóstico;
- limpieza entre actores;
- acceso a historial, búsquedas y sugerencias;
- exposición durante soporte o contingencia.

La modalidad de menor fricción no podrá proyectar información innecesaria al área completa.

---

#### 27. Rendimiento y capacidad

Los tiempos se medirán extremo a extremo e incluirán:

- preparación del puesto;
- identificación del actor;
- adquisición o lectura;
- validación del contexto;
- corrección de error;
- confirmación empresarial;
- espera de periférico;
- cambio entre personas;
- recuperación después de falla.

Se evaluarán operación ordinaria, pico, fatiga y repetición. Un tiempo de lectura aislado no representará el tiempo del paso completo.

---

#### 28. Mantenimiento y costo total

La comparación considerará:

- compra o reutilización;
- montaje, cableado, protección y energía;
- consumibles y accesorios;
- limpieza, calibración y mantenimiento;
- configuración y actualización;
- reemplazo, repuesto y equipo sustituto;
- diagnóstico y soporte;
- capacitación y errores evitados;
- vida útil y retiro;
- costo de indisponibilidad y conciliación manual.

El costo inicial más bajo no prevalecerá cuando eleve errores, soporte, tiempos o dependencia de conocimiento informal.

---

#### 29. Evidencia y nivel de confianza

Cada decisión usará una o más fuentes:

| Nivel           | Evidencia                                                      |
| --------------- | -------------------------------------------------------------- |
| `C0_ASSUMED`    | hipótesis no verificada; no permite recomendación              |
| `C1_DOCUMENTED` | fuente documental vigente pero sin observación física completa |
| `C2_OBSERVED`   | observación directa en condición representativa                |
| `C3_MEASURED`   | medición reproducible del paso o modalidad                     |
| `C4_PROTOTYPED` | prueba controlada con trabajadores y evidencia                 |
| `C5_PILOTED`    | resultado de piloto en operación real controlada               |

Esta tarea podrá llegar como máximo a `C3_MEASURED` cuando exista evidencia previa válida. `C4` corresponde a `UX-STATION-008` y la aprobación final a `UX-STATION-009`.

---

#### 30. Registro de alternativas rechazadas

`UX-STATION-MODALITY-REJECTION-REGISTER-001` conservará:

```text
process_id
step_id
variant
modality
rejection_reason
failed_gate_or_dimension
source
risk
condition_for_reconsideration
replacement_candidate
decision_owner
version
```

Una alternativa retirada podrá reconsiderarse cuando cambie el proceso, ambiente, tecnología o evidencia; nunca reaparecerá sin nueva comparación.

---

#### 31. Backlog obligatorio de prototipos

Toda fila `RECOMMENDED_FOR_PROTOTYPE` deberá producir:

- pregunta concreta que el prototipo debe resolver;
- hipótesis y criterio de éxito;
- trabajadores y condiciones representativas;
- modalidad principal y alternativa;
- equipo o maqueta necesaria;
- escenario ordinario, pico y falla;
- métricas de tiempo, error, comprensión, esfuerzo y recuperación;
- riesgos y datos sensibles que no deben capturarse;
- responsable y tarea de cierre en `UX-STATION-008`;
- vínculo con la decisión final de `UX-STATION-009`.

No se prototipará para confirmar una decisión ya cerrada, sino para resolver incertidumbre verificable.

---

#### 32. Enrutamiento de decisiones posteriores

| Decisión o vacío                                  | Tarea propietaria                                         |
| ------------------------------------------------- | --------------------------------------------------------- |
| perfil completo de estación                       | `UX-STATION-003`                                          |
| identificación, cambio y cierre de actor          | `UX-STATION-004`; `AUTH-DEV-001` a `AUTH-DEV-016`         |
| superficie contextual                             | `UX-STATION-005`                                          |
| periférico, montaje, energía, red y mantenimiento | `UX-STATION-006`; `NFR-REQ-008`; BLOQUE Z                 |
| contingencia y recuperación                       | `UX-STATION-007`; `NFR-REQ-004`; `NFR-REQ-010`; BLOQUE AC |
| gramática, bandeja y composición                  | `UX-STATION-010` a `UX-STATION-012`                       |
| validación con trabajadores                       | `UX-STATION-008`                                          |
| aprobación final de modalidad                     | `UX-STATION-009`                                          |
| pantalla y navegación definitivas                 | `PROC-SCREEN-001` a `PROC-SCREEN-028`                     |
| cobertura integral por proceso                    | `PROC-COVER-001` a `PROC-COVER-010`                       |
| paquete ejecutable                                | BLOQUE E5                                                 |

Toda brecha detectada deberá vincularse inmediatamente con una de estas tareas o con otra tarea canónica existente.

---

#### 33. Cobertura obligatoria de los 69 procesos

La matriz deberá demostrar para cada `VPROC-0001` a `VPROC-0069`:

- que todos sus pasos fueron inventariados;
- que cada paso tiene variante o justificación única;
- que se compararon las modalidades aplicables;
- que las alternativas no aplicables conservan razón;
- que existe candidato principal o `EVIDENCE_INCOMPLETE` con dueño;
- que se declaró fallback o bloqueo seguro;
- que la recomendación se vincula con estación, actor y NFR;
- que las preguntas de prototipo están en el backlog;
- que no se usó una modalidad universal por aplicación.

`PROC-COVER-*` verificará posteriormente la cobertura, pero esta tarea deberá producir la base completa que esa puerta consumirá.

---

#### 34. Requisitos de prueba derivados

**Resultado:** GENERA 40 REQUISITOS DE PRUEBA.

Se incorporan `TREQ-PROC-581` a `TREQ-PROC-620` al Registro Canónico completo.

Estos requisitos protegen cobertura, puertas duras, puntuación, tacto, teclado, escáneres, cámara, sensores, periféricos, modalidad híbrida, contingencia, actor, privacidad, offline, ambiente, movilidad, errores, accesibilidad, reanudación, compatibilidad, mantenimiento y prototipo.

Todos quedan en `IDENTIFICADO`; su implementación y evidencia pertenecen a tareas posteriores, paquetes E5, BLOQUE T, pilotos y BLOQUE U.

---

#### 35. Criterios de aceptación

- [x] La unidad de comparación es paso + variante + actor + condición + modalidad.
- [x] No existe modalidad predeterminada por aplicación, rol o sede.
- [x] El catálogo inicial contiene modalidades manual, táctil, teclado, escáner fijo, escáner portátil, cámara, automática, periférica e híbrida.
- [x] Cada modalidad tiene aplicabilidad y razones conservadas.
- [x] Las puertas duras preceden a cualquier puntuación.
- [x] La puntuación usa perfiles versionados y no pesos universales.
- [x] Se conservan alternativas rechazadas y condición de reconsideración.
- [x] Se integran identidad, autorización, privacidad, accesibilidad, ergonomía, offline, compatibilidad y recuperación.
- [x] Se definen reglas específicas para tacto, teclado, escáner, cámara, sensores y periféricos.
- [x] La modalidad híbrida produce una sola intención y resultado coherente.
- [x] La contingencia manual exige folio, custodia y conciliación.
- [x] La matriz cubre `VPROC-0001` a `VPROC-0069` por paso.
- [x] Toda incertidumbre material genera una pregunta de prototipo con dueño.
- [x] Esta tarea no usa `APPROVED_FINAL` ni sustituye `UX-STATION-008` o `UX-STATION-009`.
- [x] Los vacíos se asignan a tareas canónicas existentes.
- [x] Se incorporan `TREQ-PROC-581` a `TREQ-PROC-620` al registro completo.
- [x] No se implementan código, hardware, red, periféricos, migraciones ni cambios en Supabase.
- [x] `UX-STATION-003` permanece no iniciada.

---

#### 36. Estado y continuidad

```text
NFR-REQ-011   APROBADA
UX-STATION-002 APROBADA
UX-STATION-003 NO INICIADA
```

La aprobación de esta tarea congela el contrato comparativo y los artefactos de matriz. No certifica que las modalidades candidatas funcionen en operación real ni autoriza su implementación.


### ✅ UX-STATION-003 — Definir perfiles canónicos de estación compartida

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Marcador exacto que reemplaza:** `### [ ] UX-STATION-003 — Definir perfiles canónicos de estación compartida`  
**Tarea anterior:** `UX-STATION-002 — Comparar modalidades de interacción para cada paso operativo` — APROBADA  
**Siguiente tarea reservada:** `UX-STATION-004 — Diseñar identificación, cambio y cierre de actor en estaciones compartidas` — NO INICIADA  
**Artefactos aprobados:** `UX-STATION-PROFILE-TAXONOMY-001`; `UX-STATION-PROFILE-SCHEMA-001`; `UX-STATION-PROFILE-CATALOG-001`; `UX-STATION-PROFILE-SELECTION-MATRIX-001`; `UX-STATION-PROFILE-INSTANCE-CONTRACT-001`; `UX-STATION-VARIANT-OVERLAY-REGISTER-001`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`, por paso, modalidad candidata, sede, área, zona y condición operativa  
**Naturaleza:** contrato de clasificación y composición de estaciones compartidas; no diseño definitivo de identidad, pantallas, hardware, montaje, red, contingencia ni implementación técnica  
**Cambios en código, componentes, aplicaciones, migraciones, Supabase, red, hardware, periféricos, compras, instalaciones o despliegues:** no autorizados

---

#### 1. Propósito

Definir un catálogo canónico, versionado y verificable de perfiles de estación compartida que permita transformar las modalidades comparadas en `UX-STATION-002` en configuraciones operativas coherentes, sin confundir una estación con un dispositivo, una cuenta, una pantalla o un periférico.

```text
ESTACIÓN COMPARTIDA
= PERFIL OPERATIVO
+ INSTANCIA FÍSICA IDENTIFICABLE
+ DISPOSITIVO O HOST
+ CONTEXTO DE SEDE, ÁREA Y ZONA
+ MECANISMO DE ACTOR EFECTIVO
+ CAPACIDADES Y RESTRICCIONES
+ PERIFÉRICOS APLICABLES
+ ESTADO OPERATIVO Y DEGRADACIÓN

ESTACIÓN COMPARTIDA
≠ CUENTA COMPARTIDA
≠ TABLET GENÉRICA
≠ PANTALLA FIJA
≠ IMPRESORA
≠ NOMBRE DEL ÁREA
```

El perfil describe qué debe poder hacer una clase de estación y bajo qué condiciones. La instancia representa el puesto físico concreto desplegado en una sede y zona.

---

#### 2. Continuidad lógica

`UX-STATION-002` comparó modalidades por paso y produjo candidatos para diseño y prototipo. Esta tarea convierte esas necesidades en perfiles reutilizables.

```text
PASO OPERATIVO
+ MODALIDAD CANDIDATA
+ CONDICIONES REALES
+ REQUISITOS NO FUNCIONALES
        ↓
UX-STATION-003
PERFIL BASE + OVERLAYS + RESTRICCIONES
        ↓
UX-STATION-004
IDENTIDAD Y CAMBIO DE ACTOR
        ↓
UX-STATION-005
SUPERFICIE CONTEXTUAL
        ↓
UX-STATION-006
PERIFÉRICOS, MONTAJE, ENERGÍA Y RED
        ↓
UX-STATION-007
DEGRADACIÓN, OFFLINE Y RECUPERACIÓN
```

No se aprobará una estación final en esta tarea. `UX-STATION-009` conservará la aprobación final después de `UX-STATION-008`.

---

#### 3. Principios obligatorios

1. Ningún perfil autoriza una cuenta conjunta entre trabajadores.
2. Perfil, instancia, dispositivo, endpoint, sesión, actor y periférico son entidades distintas.
3. Una estación podrá ser compartida por varias personas, pero cada acción conservará actor efectivo.
4. No existirá un perfil universal denominado solamente “tablet”, “PC”, “caja” o “kiosco”.
5. Los perfiles se definirán por resultado operativo y condiciones, no por marca o modelo.
6. Las variaciones se resolverán primero mediante overlays; no se clonará un perfil por sede sin diferencia material.
7. Un perfil no podrá declarar capacidades que el dispositivo o periférico real no haya demostrado.
8. Las capacidades sensibles se habilitarán por paso, permiso y contexto; nunca por pertenecer físicamente a la estación.
9. Toda instancia tendrá propietario operativo, custodio, ubicación, estado y versión de perfil.
10. Ningún perfil será `FINAL` antes del prototipo con trabajadores y la aprobación de `UX-STATION-009`.

---

#### 4. Distinciones canónicas

| Concepto              | Definición                                                                    |
| --------------------- | ----------------------------------------------------------------------------- |
| perfil de estación    | contrato reusable de propósito, capacidades, restricciones y condiciones      |
| instancia de estación | puesto físico concreto vinculado con una sede, área, zona y perfil versionado |
| dispositivo           | equipo de cómputo que presenta o ejecuta la experiencia                       |
| endpoint              | identidad técnica administrable del dispositivo o host                        |
| sesión de dispositivo | estado técnico de autenticación y configuración de la instancia               |
| actor efectivo        | trabajador identificado que ejecuta la acción actual                          |
| superficie contextual | conjunto de información y acciones visibles según estación, actor y proceso   |
| periférico            | equipo externo que captura, mide, imprime, cobra, señala o confirma           |
| overlay               | condición adicional que modifica requisitos sin duplicar el perfil base       |
| capacidad             | función verificable disponible para pasos autorizados                         |
| restricción           | condición que limita o prohíbe una función                                    |
| estado operativo      | disponibilidad de la estación y de sus dependencias en un momento concreto    |

---

#### 5. Modelo de composición

Cada estación objetivo se compondrá mediante:

```text
BASE_PROFILE
+ ENVIRONMENT_OVERLAYS[]
+ MOBILITY_OVERLAY
+ INPUT_OVERLAYS[]
+ PRIVACY_OVERLAY
+ CONNECTIVITY_OVERLAY
+ PERIPHERAL_CAPABILITY_SET
+ ACCESSIBILITY_REQUIREMENTS[]
+ AUTHORIZATION_CONSTRAINTS[]
```

El orden de precedencia será:

```text
PROHIBICIÓN DE SEGURIDAD O AUTORIZACIÓN
→ RESTRICCIÓN DEL PROCESO O PASO
→ RESTRICCIÓN DEL OVERLAY
→ CONTRATO DEL PERFIL BASE
→ CAPACIDAD OPCIONAL DE LA INSTANCIA
```

Una capacidad opcional nunca podrá superar una prohibición superior.

---

#### 6. Esquema canónico del perfil

Cada perfil conservará como mínimo:

```text
station_profile_id
station_profile_version
name
purpose
status
functional_owner
technical_owner_task
supported_step_archetypes[]
excluded_step_archetypes[]
sharedness_class
mobility_class
primary_interaction_modalities[]
secondary_interaction_modalities[]
required_capabilities[]
optional_capabilities[]
forbidden_capabilities[]
required_overlays[]
allowed_overlays[]
actor_transition_requirement
privacy_class
data_persistence_policy
session_reset_requirement
minimum_display_requirements
minimum_input_requirements
peripheral_capability_classes[]
connectivity_class
power_continuity_class
offline_expectation
accessibility_profile
observability_requirements[]
maintenance_class
capacity_and_concurrency_assumptions
fallback_reference
prototype_questions[]
source_evidence[]
approval_state
supersedes_profile_version
```

No se usarán campos libres para ocultar decisiones que deban ser comparables.

---

#### 7. Estados permitidos del perfil

| Estado                    | Significado                                                   |
| ------------------------- | ------------------------------------------------------------- |
| `DRAFT`                   | estructura incompleta; no puede asignarse a una instancia     |
| `CANDIDATE`               | contrato documental completo pendiente de prototipo           |
| `PROTOTYPE_APPROVED`      | autorizado para prueba controlada, no para despliegue general |
| `CANONICAL`               | aprobado por `UX-STATION-009` para planificación posterior    |
| `CONDITIONALLY_CANONICAL` | válido bajo overlays y restricciones explícitas               |
| `DEPRECATED`              | no se asigna a instancias nuevas                              |
| `RETIRED`                 | ninguna instancia activa puede conservarlo                    |

En esta tarea los perfiles quedan como `CANDIDATE`.

---

#### 8. Catálogo inicial de perfiles base

| Código                              | Perfil base                            | Propósito principal                                                                     | Exclusiones relevantes                                                    |
| ----------------------------------- | -------------------------------------- | --------------------------------------------------------------------------------------- | ------------------------------------------------------------------------- |
| `STP-01-SHARED-OPERATIVE-TOUCH`     | estación táctil operativa compartida   | selección, consulta, confirmación y captura breve en punto fijo o semifijo              | captura extensa, decisiones financieras sin controles adicionales         |
| `STP-02-SHARED-POS-CASH`            | estación compartida de caja y cobro    | pedido, cobro, caja, comprobantes y conciliación con segregación reforzada              | producción, inventario itinerante y acceso administrativo general         |
| `STP-03-SHARED-PRODUCTION-HUB`      | estación de producción compartida      | ver trabajo, iniciar, confirmar, pausar, reportar novedad y cerrar en áreas productivas | navegación administrativa extensa y exposición de datos no necesarios     |
| `STP-04-SHARED-WAREHOUSE-SCAN`      | estación de bodega y recorrido         | conteo, ubicación, picking, recepción, traslado y validación mediante escaneo           | cobros, cierre financiero y edición administrativa general                |
| `STP-05-SHARED-RECEIVING-MEASURE`   | estación de recepción y medición       | capturar presentación, lote, cantidad, peso, unidad, evidencia y discrepancia           | aceptar mediciones sin estabilidad, tara, unidad o actor                  |
| `STP-06-SHARED-DISPATCH-HANDOFF`    | estación de despacho y entrega         | consolidar, verificar, cargar, entregar, recibir y registrar prueba de traspaso         | considerar impresión o escaneo como prueba única de entrega               |
| `STP-07-SHARED-MOBILE-POOL`         | dispositivo móvil compartido asignable | recorridos, servicio, soporte, captura en movimiento y tareas temporales                | sesión persistente entre actores o almacenamiento local sin limpieza      |
| `STP-08-SHARED-OBSERVATION-DISPLAY` | visualizador compartido de estado      | mostrar cola, prioridad, avance, llamado o estado sin mutación sensible                 | usar el display como actor o permitir acciones sin identificación         |
| `STP-09-SHARED-PERIPHERAL-HOST`     | host compartido de periféricos         | conectar y supervisar impresión, escaneo, medición u otros adaptadores                  | convertirse en fuente de verdad empresarial o aceptar efectos sin receipt |

Este catálogo es inicial. Una necesidad que no encaje deberá documentar brecha y ser probada en `UX-STATION-008` antes de ampliar el catálogo.

---

#### 9. Overlays ambientales

| Código               | Condición protegida                                                      |
| -------------------- | ------------------------------------------------------------------------ |
| `ENV-FOOD-HYGIENE`   | limpieza, inocuidad, contaminación cruzada y superficies lavables        |
| `ENV-WET-GREASY`     | humedad, grasa, salpicaduras, tacto degradado y limpieza frecuente       |
| `ENV-COLD`           | baja temperatura, condensación, guantes y batería                        |
| `ENV-HOT`            | calor, ventilación, exposición y protección del equipo                   |
| `ENV-NOISY`          | señales no exclusivamente auditivas y confirmaciones visibles o hápticas |
| `ENV-GLARE-LOWLIGHT` | reflejo, luz directa, baja iluminación y contraste                       |
| `ENV-DUST-PARTICLES` | partículas, harina, residuos y mantenimiento preventivo                  |
| `ENV-PUBLIC-VIEW`    | shoulder surfing, masking, bloqueo rápido y minimización visual          |

Un overlay ambiental podrá aumentar requisitos, nunca reducir controles de seguridad, identidad o integridad.

---

#### 10. Overlays de movilidad, entrada y postura

| Familia   | Valores iniciales                                                        |
| --------- | ------------------------------------------------------------------------ |
| movilidad | `MOB-FIXED`, `MOB-SEMIFIXED`, `MOB-MOBILE-POOL`, `MOB-ROUTE`             |
| manos     | `INPUT-HANDS-FREE`, `INPUT-ONE-HAND`, `INPUT-HANDS-BUSY`, `INPUT-GLOVED` |
| postura   | `POSTURE-SEATED`, `POSTURE-STANDING`, `POSTURE-WALKING`, `POSTURE-MIXED` |
| alcance   | `REACH-NEAR`, `REACH-ARM`, `REACH-DISTANT-DISPLAY`                       |
| lectura   | `READ-MINIMAL`, `READ-STANDARD`, `READ-EXTENDED`                         |

Las combinaciones físicamente incompatibles serán prohibidas. Por ejemplo, captura extensa durante `POSTURE-WALKING` no se resolverá aumentando el tamaño de la pantalla.

---

#### 11. Clases de uso compartido

| Clase                    | Regla                                                                                  |
| ------------------------ | -------------------------------------------------------------------------------------- |
| `SHARED-SEQUENTIAL`      | un actor efectivo a la vez, con cambio y cierre explícitos                             |
| `SHARED-HANDOFF`         | el trabajo se transfiere entre actores con receipt y contexto conservado               |
| `SHARED-CONCURRENT-VIEW` | varias personas pueden observar, pero una acción mutable exige actor individual        |
| `SHARED-POOL-ASSIGNED`   | el dispositivo se asigna temporalmente a una persona y se libera al finalizar          |
| `UNATTENDED-SERVICE`     | host técnico sin actor humano permanente; toda mutación proviene de comando atribuible |

`SHARED-CONCURRENT-ACTION` no se admite como clase inicial porque impediría atribuir correctamente una mutación. Cualquier caso excepcional deberá resolverse en `UX-STATION-004`.

---

#### 12. Privacidad, persistencia y limpieza entre actores

Cada perfil declarará:

- datos que pueden permanecer visibles sin actor;
- datos que requieren masking;
- tiempo y condición de bloqueo;
- limpieza de formularios, búsquedas, filtros, archivos, cámara y portapapeles;
- tratamiento de descargas y capturas;
- persistencia local permitida durante offline;
- eliminación o cifrado al cerrar, reasignar o retirar la instancia;
- señal visible del actor efectivo y contexto activo;
- prohibición de autocompletar secretos o datos personales en una estación compartida.

Cambiar de actor no equivaldrá a cambiar solamente un nombre visual.

---

#### 13. Capacidad, concurrencia y disponibilidad

Cada perfil tendrá supuestos explícitos de:

- actores por turno;
- cambios de actor por hora;
- operaciones ordinarias y de pico;
- longitud máxima de cola local;
- latencia tolerable por arquetipo de paso;
- disponibilidad requerida por franja;
- tiempo aceptable de sustitución;
- dependencia de red, batería, energía y periféricos;
- cantidad máxima de procesos simultáneos visibles;
- capacidad de bloqueo sin perder trabajo confirmado.

Una sola instancia no podrá asignarse a varios pasos críticos simultáneos cuando ello cree cola, conflicto físico o punto único de falla no aceptado.

---

#### 14. Selección de perfil por paso

La selección se realizará así:

1. tomar la fila aprobada de comparación de `UX-STATION-002`;
2. identificar resultado, actor, frecuencia, ambiente, movilidad y modalidad candidata;
3. descartar perfiles que incumplan puertas duras;
4. seleccionar el perfil base más cercano por propósito;
5. aplicar overlays necesarios;
6. declarar capacidades requeridas y prohibidas;
7. identificar dependencias aún no diseñadas en `UX-STATION-004` a `UX-STATION-007`;
8. generar preguntas de prototipo para `UX-STATION-008`;
9. conservar la asignación como candidata hasta `UX-STATION-009`.

No se seleccionará por disponibilidad actual del equipo ni por preferencia del proveedor.

---

#### 15. Instancias físicas y trazabilidad

Cada instancia futura deberá conservar:

```text
station_instance_id
station_profile_id
station_profile_version
site_id
area_id
zone_id
physical_name
asset_ids[]
endpoint_ids[]
mounting_location
custodian
operational_owner
commissioned_at
current_state
last_verified_at
configuration_version
allowed_process_scopes[]
peripheral_instance_ids[]
network_profile_reference
power_profile_reference
```

La existencia de una fila en inventario no probará que la instancia esté instalada, operativa o certificada.

---

#### 16. Reglas para dispositivos y periféricos

1. Un perfil declarará clases de capacidad, no marcas o modelos.
2. El dispositivo real deberá cumplir `NFR-REQ-011`.
3. Hardware, montaje, alimentación, conectividad y mantenimiento se concretarán en `UX-STATION-006`.
4. Una impresora, cámara, báscula, escáner o datáfono conservará estado independiente.
5. La estación no asumirá éxito empresarial por un ACK técnico del periférico.
6. Toda dependencia crítica tendrá alternativa o criterio explícito de bloqueo.
7. Un host periférico no almacenará decisiones empresariales como fuente de verdad.

---

#### 17. Identidad y autorización reservadas

Esta tarea exige, pero no diseña todavía:

- identificación individual del actor;
- cambio, relevo, bloqueo y cierre;
- timeout y abandono;
- autorización por proceso, acción, sede, área y estación;
- elevación temporal y doble control;
- aislamiento entre actor humano y cuenta técnica;
- auditoría de la acción y del dispositivo.

El diseño propietario corresponde a `UX-STATION-004` y `AUTH-DEV-001` a `AUTH-DEV-016`.

---

#### 18. Superficie contextual reservada

Cada perfil declarará necesidades de superficie, pero `UX-STATION-005` definirá:

- qué información aparece sin actor;
- qué cambia al identificar actor, proceso, zona y estado;
- acciones primarias, secundarias y excepcionales;
- tratamiento de datos sensibles;
- siguiente acción y trabajo pendiente;
- comportamiento durante cambio de actor o degradación.

El perfil no incluirá wireframes definitivos.

---

#### 19. Degradación y recuperación reservadas

Cada perfil deberá declarar expectativa de operación:

- `ONLINE_REQUIRED`;
- `DEGRADED_READ_ONLY`;
- `OFFLINE_CAPTURE_CONTROLLED`;
- `MANUAL_CONTINGENCY_REQUIRED`;
- `BLOCK_SAFELY`.

`UX-STATION-007` definirá activación, cola local, idempotencia, sincronización, conflicto, reincorporación, conciliación y cierre.

---

#### 20. Gobierno de versiones

Todo cambio material en propósito, capacidades, restricciones, privacidad, sharedness, offline o periféricos incrementará la versión del perfil.

Una versión nueva deberá declarar:

- motivo;
- compatibilidad con instancias existentes;
- migración o reasignación requerida;
- periodo de coexistencia;
- riesgos;
- pruebas afectadas;
- perfiles o versiones sustituidos.

Las instancias no adoptarán silenciosamente la versión más reciente.

---

#### 21. Brechas, excepciones y extensión

Toda brecha deberá clasificarse:

| Clase                                           | Destino obligatorio                 |
| ----------------------------------------------- | ----------------------------------- |
| identidad o cambio de actor                     | `UX-STATION-004`                    |
| superficie o contexto                           | `UX-STATION-005`                    |
| hardware, montaje, red, energía o mantenimiento | `UX-STATION-006`                    |
| offline, contingencia o recuperación            | `UX-STATION-007`                    |
| evidencia insuficiente o ergonomía incierta     | `UX-STATION-008`                    |
| aprobación final o conflicto entre perfiles     | `UX-STATION-009`                    |
| gramática y componentes operativos              | `UX-STATION-010` a `UX-STATION-012` |

Una excepción tendrá propietario, alcance, riesgo, controles compensatorios, vencimiento y puerta de resolución.

---

#### 22. Matriz de cobertura obligatoria

`UX-STATION-PROFILE-SELECTION-MATRIX-001` deberá demostrar para cada paso relevante:

```text
PROCESS_ID
→ STEP_ID
→ MODALIDAD CANDIDATA
→ PERFIL BASE
→ OVERLAYS
→ CAPACIDADES REQUERIDAS
→ RESTRICCIONES
→ DEPENDENCIAS PENDIENTES
→ PREGUNTAS DE PROTOTIPO
→ ESTADO DE APROBACIÓN
```

Los 69 procesos tendrán cobertura o una justificación `NO_REQUIRES_SHARED_STATION` verificable.

---

#### Requisitos de prueba derivados

**Resultado:** GENERA 40 REQUISITOS DE PRUEBA.

Se incorporan `TREQ-PROC-621` a `TREQ-PROC-660` en el Registro Canónico de Requisitos de Prueba.

Estos requisitos protegen la separación entre perfil e instancia, composición por overlays, actor efectivo, privacidad, capacidad, selección, versionado, periféricos, degradación, cobertura y aprobación posterior.

---

#### 23. Criterios de aceptación

- [ ] Existe una definición inequívoca de perfil, instancia, dispositivo, endpoint, sesión, actor y periférico.
- [ ] El esquema del perfil contiene todos los campos obligatorios.
- [ ] Los perfiles quedan en estado `CANDIDATE`.
- [ ] El catálogo inicial cubre los principales arquetipos compartidos sin usar marcas.
- [ ] Se evita crear perfiles duplicados por sede mediante overlays.
- [ ] Se prohíben cuentas compartidas y mutaciones sin actor efectivo.
- [ ] Cada perfil declara privacidad, persistencia y limpieza entre actores.
- [ ] Cada perfil declara capacidad, concurrencia y disponibilidad esperada.
- [ ] Se define selección trazable desde cada paso y modalidad candidata.
- [ ] Los 69 procesos tienen destino de cobertura.
- [ ] Cada brecha tiene tarea propietaria exacta.
- [ ] No se diseñaron todavía identidad, superficie, hardware o contingencia finales.
- [ ] No se implementó ni desplegó ninguna estación.
- [ ] `UX-STATION-004` permanece no iniciada.

---

#### 24. Estado y continuidad

```text
UX-STATION-002 APROBADA
UX-STATION-003 APROBADA
UX-STATION-004 NO INICIADA
```

La aprobación documental de esta tarea habilita continuar con `UX-STATION-004`. No autoriza compras, configuración física, cuentas compartidas, instalación ni despliegue.
