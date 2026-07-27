MODELO DE ESTACIONES OPERATIVAS COMPARTIDAS

### Reglas obligatorias:

1. Ninguna modalidad de interacción se considerará predeterminada para todos los procesos.
2. Cada paso operativo deberá comparar, cuando sean aplicables:
   - interacción táctil visual;
   - escáner fijo;
   - cámara del dispositivo;
   - escáner portátil;
   - captura automática desde el contexto;
   - modalidad híbrida;
   - procedimiento manual de contingencia.
3. La modalidad deberá seleccionarse con base en:
   - operación real;
   - frecuencia;
   - movilidad;
   - ergonomía;
   - higiene;
   - manos ocupadas;
   - riesgo de error;
   - trazabilidad;
   - conectividad;
   - coste;
   - mantenimiento;
   - necesidad de periféricos.
4. No se aprobará una modalidad únicamente porque sea técnicamente posible o visualmente atractiva.
5. La alternativa definitiva deberá validarse mediante prototipo y prueba con trabajadores reales.
6. `UX-STATION-*` define la experiencia física y operativa objetivo.
7. `AUTH-DEV-*` implementa posteriormente la identidad, límites, sesión, autorización y auditoría del dispositivo compartido.
8. `PROC-SCREEN-*` no podrá diseñar una pantalla operativa definitiva antes de conocer la estación y modalidad de interacción aplicables.

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


### ✅ UX-STATION-004 — Diseñar identificación, cambio y cierre de actor en estaciones compartidas

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Marcador exacto que reemplaza:** `### [ ] UX-STATION-004 — Diseñar identificación, cambio y cierre de actor en estaciones compartidas`  
**Tarea anterior:** `UX-STATION-003 — Definir perfiles canónicos de estación compartida` — APROBADA  
**Siguiente tarea reservada:** `UX-STATION-005 — Diseñar la superficie operativa contextual por estación, zona y proceso` — NO INICIADA  
**Artefactos aprobados:** `UX-STATION-ACTOR-IDENTIFICATION-CONTRACT-001`; `UX-STATION-ACTOR-STATE-MACHINE-001`; `UX-STATION-ACTOR-TRANSITION-MATRIX-001`; `UX-STATION-ACTOR-HANDOFF-CONTRACT-001`; `UX-STATION-ACTOR-SESSION-CLEANUP-CONTRACT-001`; `UX-STATION-ACTOR-METHOD-CATALOG-001`; `UX-STATION-ACTOR-EXCEPTION-REGISTER-001`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`, por paso, perfil de estación, clase de uso compartido, actor, contexto y nivel de riesgo  
**Naturaleza:** contrato funcional de identificación y atribución del actor efectivo en estaciones compartidas; no implementación de autenticación, autorización, UI definitiva, hardware, credenciales, biometría, migraciones ni cambios en Supabase  
**Cambios en código, componentes, aplicaciones, migraciones, Supabase, cuentas, credenciales, dispositivos, hardware, red, periféricos o despliegues:** no autorizados

---

#### 1. Propósito

Definir cómo una estación compartida identifica al trabajador que actúa, cómo cambia de actor sin mezclar sesiones o trabajo y cómo cierra, bloquea o transfiere el contexto de forma segura.

```text
ESTACIÓN COMPARTIDA
+ DISPOSITIVO IDENTIFICADO
+ ACTOR EFECTIVO INDIVIDUAL
+ CONTEXTO LABORAL Y OPERATIVO VIGENTE
+ AUTORIZACIÓN REVALIDADA
+ TRAZABILIDAD
= ACCIÓN ATRIBUIBLE

ESTACIÓN COMPARTIDA
≠ CUENTA COMPARTIDA
≠ ACTOR PERMANENTE
≠ ROL GENÉRICO
≠ ÚLTIMO USUARIO
≠ PIN DEL ÁREA
```

La estación podrá conservar una identidad técnica propia, pero ninguna identidad técnica, perfil de estación o ubicación física sustituirá la identidad del trabajador que ejecuta una acción empresarial.

---

#### 2. Continuidad lógica

`UX-STATION-003` separó perfil, instancia, dispositivo, endpoint, sesión, actor y periférico. Esta tarea define el ciclo del actor efectivo sobre esos perfiles.

```text
PERFIL E INSTANCIA DE ESTACIÓN
        ↓
IDENTIFICAR ACTOR
        ↓
RESOLVER CONTEXTO VIGENTE
        ↓
HABILITAR SUPERFICIE Y ACCIONES PERMITIDAS
        ↓
REVALIDAR CADA COMANDO
        ↓
CAMBIAR, TRANSFERIR, BLOQUEAR O CERRAR
        ↓
LIMPIAR Y CONSERVAR EVIDENCIA
```

`UX-STATION-005` diseñará la superficie contextual que refleje estos estados. `AUTH-DEV-001` a `AUTH-DEV-016` implementarán posteriormente la identidad técnica, límites, sesiones, revocación, auditoría y pruebas de dispositivos compartidos.

---

#### 3. Principios obligatorios

1. Toda mutación empresarial tendrá un actor efectivo individual o una identidad técnica explícita y separada.
2. Una cuenta genérica de área, sede, rol, caja, cocina, bodega o servicio no podrá representar al trabajador.
3. La estación, el dispositivo, la aplicación, el rol visible y el último usuario no determinarán el actor.
4. Identificar a una persona no concede por sí solo permiso para la acción.
5. Cada comando sensible se autorizará en servidor con contexto vigente.
6. El cambio de actor será explícito, visible y auditable.
7. Ningún cambio de actor heredará silenciosamente borradores, filtros, archivos, cámara, portapapeles, permisos elevados o datos sensibles.
8. El trabajo confirmado conservará el actor original aunque otro trabajador continúe el proceso.
9. Un traspaso deberá producir evidencia de origen, destino, recurso, momento y aceptación.
10. Una sesión vencida, estación revocada o contexto inválido fallará de forma segura.
11. La identificación rápida reducirá fricción, pero nunca sustituirá la vinculación inequívoca con una identidad laboral vigente.
12. No se almacenarán PIN, contraseñas, datos biométricos crudos, tokens o secretos en artefactos de UX.
13. La señal del actor efectivo será perceptible sin depender únicamente de color, sonido o memoria.
14. La recuperación de acceso no podrá convertirse en bypass de autorización.
15. Las modalidades se validarán con trabajadores reales antes de aprobarse en `UX-STATION-009`.

---

#### 4. Separación conceptual obligatoria

| Concepto                       | Significado                                         |              Puede autorizar una acción |
| ------------------------------ | --------------------------------------------------- | --------------------------------------: |
| identidad de estación          | instancia física y perfil aplicable                 |                                      No |
| identidad de dispositivo       | endpoint administrado y revocable                   |                                      No |
| sesión técnica del dispositivo | canal autenticado del equipo con servicios          |                                      No |
| identidad laboral              | persona o sujeto laboral resuelto                   |                          No por sí sola |
| sesión de actor                | vínculo temporal entre identidad laboral y estación |                          No por sí sola |
| contexto laboral               | vigencia, asignaciones y cobertura administrativa   |                          No por sí solo |
| contexto operativo             | turno, check-in, rol operativo, sede y área activas |                          No por sí solo |
| actor efectivo                 | trabajador atribuido a la acción actual             |                Participa en la decisión |
| permiso efectivo               | resultado de autorización para acción y recurso     |                    Sí, solo con `ALLOW` |
| aprobador o segundo actor      | persona distinta que confirma una acción protegida  |       Solo dentro de la regla aplicable |
| identidad técnica              | servicio o integración sin actor humano             | Solo para comandos técnicos autorizados |

---

#### 5. Unidad contractual de la sesión de actor

Cada sesión de actor deberá conservar como mínimo:

```text
station_actor_session_id
station_instance_id
station_profile_id
station_profile_version
endpoint_id
application_id
identity_subject_id
employee_id
session_state
identification_method_class
assurance_level
identified_at
last_activity_at
expires_at
step_up_valid_until
shift_id
check_in_id
effective_operational_role
active_site_id
active_area_id
allowed_process_scopes[]
context_version
previous_station_actor_session_id
transfer_receipt_id
close_reason
closed_at
correlation_id
```

No se incluirán secretos ni material reutilizable de autenticación.

---

#### 6. Estados canónicos

| Estado              | Significado                                                                          |
| ------------------- | ------------------------------------------------------------------------------------ |
| `NO_ACTOR`          | la estación no tiene trabajador activo; solo muestra superficie pública o minimizada |
| `IDENTIFYING`       | se está comprobando la identidad mediante un método aprobado                         |
| `CONTEXT_RESOLVING` | se resuelven vigencia laboral, turno, check-in, sede, área, rol y límites            |
| `ACTIVE`            | existe actor efectivo válido para acciones ordinarias dentro de su alcance           |
| `STEP_UP_REQUIRED`  | la acción requiere una comprobación adicional o segundo control                      |
| `TRANSFER_PENDING`  | existe un traspaso iniciado que todavía no ha sido aceptado                          |
| `LOCKED`            | la superficie está bloqueada y no admite mutaciones                                  |
| `EXPIRED`           | la vigencia temporal o contextual terminó                                            |
| `CLOSING`           | se procesan pendientes, limpieza y evidencia de cierre                               |
| `CLOSED`            | no existe actor efectivo reutilizable                                                |
| `RECOVERY_REQUIRED` | la sesión quedó en estado incierto y exige recuperación controlada                   |

No se permitirá una transición directa de `NO_ACTOR` a `ACTIVE` sin identificación y resolución de contexto.

---

#### 7. Catálogo de clases de identificación

| Clase                        | Uso permitido                                                                          |
| ---------------------------- | -------------------------------------------------------------------------------------- |
| `FULL_SIGN_IN`               | establecimiento inicial de identidad con el mecanismo corporativo aprobado             |
| `QUICK_REENTRY`              | reentrada breve de una identidad previamente vinculada y aún elegible                  |
| `PERSONAL_TOKEN_SCAN`        | lectura de credencial o token personal no compartido con comprobaciones de vigencia    |
| `PERSONAL_QR_ASSERTION`      | afirmación personal de corta duración y protegida contra copia o reutilización         |
| `DEVICE_BIOMETRIC_ASSERTION` | afirmación del sistema operativo vinculada a una identidad y con alternativa accesible |
| `SUPERVISED_RECOVERY`        | recuperación excepcional con actor supervisor, motivo y evidencia                      |
| `SECOND_ACTOR_APPROVAL`      | identificación de aprobador distinto para una acción que exige doble control           |

La tarea no selecciona tecnología concreta ni declara que todas las clases sean aplicables a todos los perfiles.

---

#### 8. Métodos prohibidos como identificación individual

No serán válidos por sí solos:

- cuenta compartida del área o del rol;
- PIN común de caja, cocina, barra, bodega o sede;
- badge o QR compartido;
- iniciales escritas manualmente;
- nombre escogido de una lista sin comprobación;
- proximidad del teléfono sin confirmación;
- último trabajador que usó el equipo;
- turno programado sin presencia comprobada;
- check-in de otra persona;
- estación asignada a un rol;
- ubicación física;
- reconocimiento informal por parte de compañeros;
- credencial de supervisor utilizada para representar al trabajador;
- valor recibido desde el cliente sin validación autoritativa.

---

#### 9. Flujo de identificación ordinaria

1. La estación comienza en `NO_ACTOR`, `LOCKED` o `CLOSED`.
2. Presenta únicamente información permitida sin actor.
3. El trabajador inicia un método de identificación permitido por el perfil.
4. El servidor resuelve identidad laboral y vigencia.
5. Se comprueban dispositivo, estación, aplicación y perfil.
6. Se resuelven turno, check-in, rol operativo, sede, área y demás contexto aplicable.
7. Se calcula la intersección entre límites del dispositivo y permisos del trabajador.
8. Se comprueba que el método alcanza el nivel de aseguramiento requerido.
9. La interfaz muestra de forma inequívoca quién quedó activo y en qué contexto.
10. La sesión pasa a `ACTIVE` o a un estado de bloqueo explicado.
11. Cada comando posterior vuelve a comprobar autorización, recurso, contexto y frescura.

Una identificación exitosa no deberá ocultar una denegación de autorización.

---

#### 10. Resolución de contexto

La sesión del actor no confiará en valores de cliente como fuente autoritativa para:

- `employee_id`;
- rol base;
- rol operativo;
- turno;
- check-in;
- sede activa;
- área activa;
- cobertura;
- permisos;
- requisitos de autorización;
- recurso;
- territorio;
- aprobación requerida.

Una sede o área mostrada en la pantalla podrá orientar navegación, pero no ampliar autoridad. La estación tampoco podrá imponer el contexto solo por estar físicamente ubicada en una zona.

---

#### 11. Intersección trabajador-dispositivo

La capacidad efectiva se resolverá mediante:

```text
PERMISOS DEL TRABAJADOR
∩
LÍMITES DEL DISPOSITIVO
∩
APLICACIONES PERMITIDAS
∩
PERFIL DE ESTACIÓN
∩
CONTEXTO VIGENTE
∩
REQUISITOS DE LA ACCIÓN
```

El dispositivo no heredará permisos administrativos de un trabajador y el trabajador no superará el máximo permitido para el dispositivo.

---

#### 12. Indicador visible del actor efectivo

Mientras exista actor activo, la superficie deberá mostrar de forma persistente y accesible:

- nombre preferido o identificador humano suficiente;
- rol operativo efectivo cuando aplique;
- sede y área operativas;
- estado de sesión;
- señal de elevación o aprobación temporal;
- acción clara para bloquear, cambiar o cerrar;
- advertencia cuando el contexto esté vencido o incompleto.

Se minimizarán datos personales. El indicador no dependerá exclusivamente de color ni quedará oculto durante acciones sensibles.

---

#### 13. Cambio secuencial de actor

El cambio ordinario seguirá:

```text
ACTOR A ACTIVE
→ SOLICITUD EXPLÍCITA DE CAMBIO
→ BLOQUEO DE NUEVAS MUTACIONES
→ RESOLUCIÓN DE BORRADORES Y PENDIENTES
→ CIERRE Y LIMPIEZA DE ACTOR A
→ IDENTIFICACIÓN DE ACTOR B
→ RESOLUCIÓN DE CONTEXTO DE B
→ SUPERFICIE RECOMPUESTA
→ ACTOR B ACTIVE
```

No se permitirá que dos actores permanezcan simultáneamente activos para mutaciones en una estación `SHARED-SEQUENTIAL`.

---

#### 14. Tratamiento de trabajo durante el cambio

| Estado del trabajo            | Tratamiento                                                                           |
| ----------------------------- | ------------------------------------------------------------------------------------- |
| dato no confirmado            | descartar, conservar como borrador neutral o transferir explícitamente según política |
| comando enviado y pendiente   | conservar actor, contexto, idempotency key y receipt originales                       |
| resultado confirmado          | mantener autoría original y permitir continuación por otro actor                      |
| conflicto                     | enviar a bandeja o recuperación; no atribuir al nuevo actor                           |
| archivo o captura temporal    | limpiar o transferir con confirmación y finalidad válida                              |
| aprobación temporal           | revocar salvo que el contrato permita continuidad explícita                           |
| selección, filtros y búsqueda | limpiar salvo contexto de estación declarado como no personal                         |

El actor nuevo no heredará una acción lista para confirmar como si la hubiera preparado.

---

#### 15. Traspaso entre actores

El traspaso se distinguirá del cambio simple. Deberá conservar:

```text
transfer_receipt_id
source_actor_id
target_actor_id
process_id
step_id
work_item_id
resource_version
source_station_id
target_station_id
initiated_at
accepted_at
handoff_reason
state_at_transfer
pending_effects[]
evidence_reference
```

Reglas:

1. El actor de origen inicia y delimita el traspaso.
2. El destino se identifica de forma independiente.
3. El destino acepta el recurso y el estado recibido.
4. Los efectos confirmados conservan su autor original.
5. Los pendientes no se duplican ni se reenvían automáticamente.
6. La responsabilidad no cambia hasta la aceptación o la regla explícita de abandono.
7. Un traspaso rechazado, vencido o incierto permanece visible y recuperable.

---

#### 16. Cierre, bloqueo y expiración

La sesión deberá cerrarse o bloquearse por:

- acción manual;
- cambio de trabajador;
- finalización o pérdida de check-in;
- fin o invalidez de turno cuando aplique;
- vencimiento de sesión;
- inactividad según riesgo y perfil;
- bloqueo del sistema operativo;
- reinicio, suspensión o pérdida de estado no confiable;
- cierre de aplicación en una estación de riesgo;
- revocación del dispositivo;
- desasignación de la estación;
- pérdida de vigencia laboral;
- cambio material de permisos;
- detección de concurrencia incompatible;
- incidente de seguridad;
- retiro del dispositivo.

Los tiempos concretos se definirán por perfil y riesgo; no se impone un valor universal.

---

#### 17. Limpieza al cerrar

El cierre deberá considerar:

- formularios;
- borradores personales;
- filtros y búsquedas;
- recursos recientes;
- archivos;
- fotografías;
- cámara;
- escáner;
- portapapeles;
- descargas;
- datos sensibles visibles;
- caché identificable;
- credenciales y autocompletado;
- permisos elevados;
- aprobaciones temporales;
- notificaciones personales;
- rutas de retorno;
- estado del navegador o WebView.

La limpieza no eliminará evidencia empresarial confirmada ni colas que deban conservar actor original.

---

#### 18. Inactividad y presencia

La política de inactividad tendrá en cuenta:

- sensibilidad del proceso;
- exposición pública;
- clase de uso compartido;
- frecuencia de cambio de actor;
- posibilidad de abandono;
- guantes, higiene y manos ocupadas;
- operación de lectura continua;
- trabajo pendiente;
- conectividad;
- capacidad de bloqueo sin pérdida.

Una señal de movimiento, toque o presencia física no demostrará identidad. La estación podrá bloquearse sin cerrar inmediatamente cuando sea seguro, pero reanudará solo tras comprobación suficiente.

---

#### 19. Step-up y doble control

Se exigirá comprobación reforzada cuando lo determine la política, por ejemplo:

- pagos, cierres o diferencias;
- correcciones materiales;
- movimientos sensibles de inventario;
- aprobación o excepción;
- acceso a datos restringidos;
- cambio de sede o área;
- elevación temporal;
- sesión antigua;
- método de baja garantía;
- dispositivo o contexto degradado;
- segundo actor obligatorio.

El aprobador será distinto del ejecutor cuando la regla exija segregación. La credencial del aprobador no reemplazará al actor principal ni abrirá una sesión administrativa persistente.

---

#### 20. Fallos de identificación y recuperación

El diseño cubrirá:

- método no disponible;
- credencial inválida;
- trabajador inactivo;
- cuenta bloqueada;
- turno inexistente;
- check-in ausente;
- sede o área incompatible;
- estación revocada;
- dispositivo no reconocido;
- reloj desajustado;
- contexto incompleto;
- servicio de identidad no disponible;
- intento repetido;
- duplicidad de sesión;
- aplicación reiniciada;
- cierre incompleto;
- actor previo desconocido;
- estado offline.

La recuperación será guiada, limitada, auditada y reversible. No habilitará una cuenta genérica para “seguir trabajando”.

---

#### 21. Intentos fallidos y abuso

Cada método deberá definir:

- límite y ventana de intentos;
- demora progresiva o bloqueo;
- tratamiento de repetición desde varias estaciones;
- notificación de anomalía;
- recuperación autorizada;
- protección contra observación del PIN;
- prevención de replay;
- vigencia y uso único cuando aplique;
- respuesta que no revele información innecesaria;
- registro de método y resultado sin guardar secretos.

---

#### 22. Reinicio, suspensión y restauración de sesión

Después de reinicio, actualización, suspensión, caída de aplicación o pérdida de memoria:

1. no se restaurará automáticamente un actor como `ACTIVE` desde almacenamiento local no confiable;
2. se recuperará solo el trabajo permitido y firmado;
3. se comprobarán vigencia, dispositivo, contexto y sesión;
4. una sesión incierta pasará a `RECOVERY_REQUIRED`;
5. los pendientes conservarán actor y contexto originales;
6. la interfaz mostrará si existe trabajo por recuperar antes de aceptar nuevas mutaciones.

---

#### 23. Operación offline

La identificación offline solo podrá existir si una política futura demuestra:

- identidad previamente vinculada al dispositivo;
- credencial o afirmación verificable localmente;
- vigencia limitada;
- contexto previamente emitido y no revocado dentro de la tolerancia aprobada;
- alcance mínimo;
- datos protegidos;
- cola vinculada con actor, estación y versión de contexto;
- bloqueo de acciones que requieran comprobación online;
- revalidación al sincronizar;
- tratamiento explícito de revocaciones y conflictos.

Offline no permitirá crear autoridad nueva ni extender indefinidamente una sesión.

---

#### 24. Cola y sincronización

Cada comando offline o pendiente conservará:

```text
original_actor_id
station_actor_session_id
station_instance_id
context_version
process_id
step_id
resource_id
resource_version
idempotency_key
created_at
local_sequence
authorization_requirement
sync_state
```

El cambio de actor no reasignará automáticamente la cola. La sincronización revalidará lo que corresponda y enviará conflictos a recuperación, sin duplicar efectos.

---

#### 25. Privacidad y minimización

1. La estación mostrará únicamente datos suficientes para reconocer al actor correcto.
2. No expondrá documento, correo, teléfono u otros datos innecesarios.
3. Los registros no contendrán secretos ni valores biométricos crudos.
4. Las capturas de soporte deberán enmascarar datos personales.
5. La vista sin actor aplicará masking o bloqueo según el perfil.
6. El historial visible de actores se limitará a lo necesario para continuidad y soporte autorizado.
7. La analítica no se utilizará para vigilancia laboral punitiva sin gobierno explícito.

---

#### 26. Accesibilidad y operación real

Cada método tendrá alternativa cuando sea razonable para:

- limitaciones motoras;
- baja visión;
- daltonismo;
- dificultades auditivas;
- lectura limitada;
- guantes;
- humedad o grasa;
- ruido;
- baja iluminación;
- movilidad;
- ausencia temporal de cámara o escáner.

La confirmación de identidad no dependerá solo de memoria, velocidad, sonido o color. Los mensajes explicarán qué ocurrió y cómo continuar sin revelar datos sensibles.

---

#### 27. Auditoría mínima

Cada evento de identificación, cambio, bloqueo, cierre, recuperación o traspaso registrará:

```text
event_id
event_type
occurred_at
recorded_at
station_instance_id
endpoint_id
application_id
station_actor_session_id
actor_id
previous_actor_id
target_actor_id
identification_method_class
assurance_level
process_id
step_id
site_id
area_id
result
reason_code
context_version
correlation_id
transfer_receipt_id
```

La auditoría distinguirá intento, éxito, denegación, expiración, revocación, transferencia y recuperación.

---

#### 28. Revocación

La revocación de trabajador, dispositivo, estación, sesión o método deberá:

- impedir nuevas acciones;
- invalidar reentrada rápida;
- bloquear o cerrar según riesgo;
- conservar pendientes con su autor;
- exigir recuperación si existe resultado incierto;
- emitir evidencia técnica y funcional;
- propagarse a superficies activas;
- no depender únicamente de reiniciar la aplicación.

---

#### 29. Matriz de transición obligatoria

`UX-STATION-ACTOR-TRANSITION-MATRIX-001` cubrirá, por perfil y clase de uso compartido:

```text
ESTADO ORIGEN
→ DISPARADOR
→ ACTOR ACTUAL
→ TRABAJO PENDIENTE
→ COMPROBACIONES
→ ESTADO DESTINO
→ LIMPIEZA
→ EVIDENCIA
→ FALLBACK
```

Como mínimo incluirá identificación, reentrada, bloqueo, desbloqueo, cambio, traspaso, expiración, cierre, reinicio, revocación, offline y recuperación.

---

#### 30. Cobertura por proceso

Los 69 procesos deberán declarar por paso:

```text
process_id
step_id
station_profile_candidate
sharedness_class
actor_required
identification_method_classes[]
minimum_assurance_level
check_in_requirement
step_up_requirement
handoff_allowed
inactivity_policy_class
offline_identification_policy
close_triggers[]
cleanup_profile
audit_profile
prototype_questions[]
```

Un paso sin estación compartida deberá justificar `NO_SHARED_STATION_ACTOR_SESSION`.

---

#### 31. Brechas y destinos obligatorios

| Brecha                                                  | Tarea propietaria                     |
| ------------------------------------------------------- | ------------------------------------- |
| identidad técnica, límites y revocación del dispositivo | `AUTH-DEV-001` a `AUTH-DEV-016`       |
| resolución de contexto laboral y operativo              | `AUTH-CTX-007` a `AUTH-CTX-018`       |
| superficie, indicador y mensajes                        | `UX-STATION-005`                      |
| hardware o método físico                                | `UX-STATION-006`                      |
| offline, cola, contingencia y recuperación              | `UX-STATION-007`                      |
| validación con trabajadores                             | `UX-STATION-008`                      |
| aprobación final de matriz                              | `UX-STATION-009`                      |
| gramática, bandeja y composición                        | `UX-STATION-010` a `UX-STATION-012`   |
| pantallas definitivas                                   | `PROC-SCREEN-001` a `PROC-SCREEN-028` |
| pruebas de tablets, terminales y pantallas              | `AUTH-DEV-014` a `AUTH-DEV-016`       |

Toda excepción tendrá propietario, alcance, riesgo, control compensatorio, vencimiento y puerta de resolución.

---

#### 32. Límites de esta tarea

Esta tarea no:

- crea cuentas o credenciales;
- aprueba PIN, badge, QR o biometría concretos;
- define tiempos numéricos universales;
- implementa autenticación o autorización;
- modifica `AccessContext`;
- configura Supabase Auth;
- crea tablas o migraciones;
- diseña wireframes definitivos;
- compra o instala dispositivos;
- activa offline;
- habilita acceso de emergencia;
- aprueba despliegue.

---

#### Requisitos de prueba derivados

**Resultado:** GENERA 40 REQUISITOS DE PRUEBA.

Se incorporan `TREQ-PROC-661` a `TREQ-PROC-700` en el Registro Canónico de Requisitos de Prueba.

Estos requisitos protegen separación de identidades, atribución individual, estados, métodos, resolución de contexto, cambio, traspaso, cierre, limpieza, step-up, recuperación, offline, privacidad, auditoría, revocación y cobertura de los 69 procesos.

---

#### 33. Criterios de aceptación

- [ ] Se separan estación, dispositivo, sesión técnica, identidad laboral, sesión de actor y permiso efectivo.
- [ ] Se prohíben cuentas, PIN y credenciales compartidas como actor individual.
- [ ] Existe una máquina de estados completa.
- [ ] Cada método de identificación tiene alcance y restricciones.
- [ ] Se define identificación ordinaria con resolución autoritativa de contexto.
- [ ] Se define intersección entre límites del dispositivo y trabajador.
- [ ] El actor efectivo es visible y accesible.
- [ ] El cambio de actor resuelve borradores, pendientes y limpieza.
- [ ] El traspaso produce receipt y aceptación.
- [ ] Cierre, bloqueo, expiración y revocación tienen disparadores explícitos.
- [ ] Se define step-up sin convertir al aprobador en actor principal.
- [ ] Se definen recuperación y límites offline sin bypass.
- [ ] Se minimizan datos y se prohíbe almacenar secretos.
- [ ] Existe auditoría suficiente y correlacionable.
- [ ] Los 69 procesos tienen destino de cobertura.
- [ ] Cada brecha tiene tarea propietaria exacta.
- [ ] No se implementó autenticación, UI, hardware ni cambios en Supabase.
- [ ] `UX-STATION-005` permanece no iniciada.

---

#### 34. Estado y continuidad

```text
UX-STATION-003 APROBADA
UX-STATION-004 APROBADA
UX-STATION-005 NO INICIADA
```

La aprobación documental de esta tarea habilita continuar con `UX-STATION-005`. No autoriza cuentas compartidas, credenciales, configuración física, autenticación, migraciones, despliegue ni entrada a E5.


### ✅ UX-STATION-005 — Diseñar la superficie operativa contextual por estación, zona y proceso

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Marcador exacto que reemplaza:** `### [ ] UX-STATION-005 — Diseñar la superficie operativa contextual por estación, zona y proceso`  
**Tarea anterior:** `UX-STATION-004 — Diseñar identificación, cambio y cierre de actor en estaciones compartidas` — APROBADA  
**Siguiente tarea reservada:** `UX-STATION-006 — Definir periféricos, montaje, alimentación, conectividad y mantenimiento` — NO INICIADA  
**Artefactos aprobados:** `UX-STATION-CONTEXTUAL-SURFACE-CONTRACT-001`; `UX-STATION-CONTEXT-RESOLUTION-MODEL-001`; `UX-STATION-SURFACE-STATE-MACHINE-001`; `UX-STATION-INFORMATION-HIERARCHY-001`; `UX-STATION-WORK-SCOPE-CONTRACT-001`; `UX-STATION-SURFACE-PRIVACY-CONTRACT-001`; `UX-STATION-PROCESS-SURFACE-MATRIX-001`; `UX-STATION-SURFACE-EXCEPTION-REGISTER-001`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`, por paso, estación, zona, actor, contexto, estado, capacidad y modalidad  
**Naturaleza:** contrato funcional de resolución y presentación de una superficie operativa contextual; no diseño visual definitivo, wireframe final, implementación de componentes, navegación final, código, hardware, migraciones ni cambios en Supabase  
**Cambios en código, componentes, aplicaciones, rutas, navegación, migraciones, Supabase, hardware, red, periféricos, configuración o despliegues:** no autorizados

---

#### 1. Propósito

Definir qué información, trabajo, estado y acciones debe presentar una estación operativa después de conocer:

```text
ESTACIÓN Y PERFIL
+ ACTOR EFECTIVO
+ CONTEXTO LABORAL Y OPERATIVO
+ SEDE, ÁREA Y ZONA
+ PROCESO Y PASO
+ RECURSO Y TERRITORIO
+ CAPACIDADES DISPONIBLES
+ ESTADO DE CONECTIVIDAD Y SINCRONIZACIÓN
+ AUTORIZACIÓN VIGENTE
= SUPERFICIE OPERATIVA CONTEXTUAL
```

La superficie deberá ayudar al trabajador a reconocer dónde está, qué trabajo le corresponde, cuál es la siguiente acción segura y qué restricciones existen, sin convertir la interfaz en fuente de autoridad ni exponer información ajena.

```text
MOSTRAR UNA ACCIÓN
≠ AUTORIZARLA

MOSTRAR UNA COLA
≠ CONCEDER ACCESO A TODOS SUS RECURSOS

SEDE O ZONA SELECCIONADA
≠ TERRITORIO AUTORIZADO

ESTACIÓN COMPARTIDA
≠ SUPERFICIE GENÉRICA PARA TODOS
```

---

#### 2. Continuidad lógica

`UX-STATION-003` definió perfiles e instancias de estación. `UX-STATION-004` definió el actor efectivo y su ciclo de identificación, cambio y cierre. Esta tarea diseña la superficie que consume esos contratos.

```text
PERFIL E INSTANCIA
        ↓
ACTOR EFECTIVO
        ↓
CONTEXTO RESUELTO
        ↓
SUPERFICIE CONTEXTUAL
        ↓
GRAMÁTICA, BANDEJA Y COMPOSICIÓN
        ↓
PROTOTIPO Y MATRIZ FINAL
```

La tarea no adelanta la gramática de interacción de `UX-STATION-010`, la bandeja detallada de `UX-STATION-011`, la composición dinámica de `UX-STATION-012` ni las pantallas definitivas de `PROC-SCREEN-001` a `PROC-SCREEN-028`.

---

#### 3. Separación conceptual obligatoria

| Concepto              | Función                                                        | Fuente de autoridad                                |
| --------------------- | -------------------------------------------------------------- | -------------------------------------------------- |
| perfil de estación    | capacidades y restricciones esperadas                          | catálogo versionado de perfiles                    |
| instancia de estación | ubicación y configuración física concreta                      | inventario y configuración administrada            |
| actor efectivo        | trabajador atribuido a la acción actual                        | sesión de actor resuelta                           |
| contexto laboral      | identidad, asignaciones y cobertura                            | servicios autoritativos de identidad               |
| contexto operativo    | turno, check-in, rol operativo, sede y área activas            | resolver canónico de contexto                      |
| zona operativa        | lugar físico o lógico donde se realiza el trabajo              | configuración aprobada y relación con estación     |
| work scope            | conjunto de procesos, pasos y recursos potencialmente visibles | reglas de proceso y autorización                   |
| superficie contextual | representación de trabajo y acciones permitidas                | resultado derivado; nunca fuente de autoridad      |
| selección visual      | filtro o preferencia temporal                                  | cliente; no amplía autoridad                       |
| comando               | intención empresarial enviada al servidor                      | autorización revalidada en servidor                |
| bandeja               | colección contextual de trabajo pendiente                      | se concreta en `UX-STATION-011`                    |
| pantalla definitiva   | composición implementable por proceso                          | se define en `PROC-SCREEN-001` a `PROC-SCREEN-028` |

---

#### 4. Artefactos aprobados

1. `UX-STATION-CONTEXTUAL-SURFACE-CONTRACT-001`  
   Reglas generales de qué puede mostrar y habilitar la superficie.

2. `UX-STATION-CONTEXT-RESOLUTION-MODEL-001`  
   Entradas, precedencia, frescura, invalidez y resultado del contexto.

3. `UX-STATION-SURFACE-STATE-MACHINE-001`  
   Estados visibles de la superficie y transiciones permitidas.

4. `UX-STATION-INFORMATION-HIERARCHY-001`  
   Orden de información y acciones por prioridad operativa.

5. `UX-STATION-WORK-SCOPE-CONTRACT-001`  
   Forma de delimitar procesos, pasos, recursos y colas visibles.

6. `UX-STATION-SURFACE-PRIVACY-CONTRACT-001`  
   Minimización, ocultamiento, limpieza y prevención de filtraciones.

7. `UX-STATION-PROCESS-SURFACE-MATRIX-001`  
   Cobertura de los 69 procesos por paso y condición.

8. `UX-STATION-SURFACE-EXCEPTION-REGISTER-001`  
   Excepciones, riesgos, compensaciones, vencimientos y cierre.

---

#### 5. Unidad mínima de resolución

La superficie se resolverá para una combinación explícita:

```text
station_instance_id
station_profile_id
station_profile_version
endpoint_id
application_id
actor_session_id
identity_subject_id
employee_id
effective_role_context
active_site_id
active_area_id
zone_id
process_id
step_id
resource_type
resource_id
work_scope
capability_snapshot
connectivity_state
sync_state
authorization_snapshot
resolved_at
context_version
```

No todos los campos serán obligatorios en todos los estados, pero cualquier ausencia deberá producir un estado explícito, nunca una suposición silenciosa.

---

#### 6. Precedencia y autoridad

La superficie se derivará de la intersección:

```text
LÍMITES DE ESTACIÓN Y DISPOSITIVO
∩ APLICACIONES Y CAPACIDADES DISPONIBLES
∩ ACTOR Y CONTEXTO VIGENTES
∩ PROCESOS Y PASOS ASIGNABLES
∩ TERRITORIO REAL DEL RECURSO
∩ AUTORIZACIÓN PARA LA ACCIÓN
∩ ESTADO OPERATIVO Y TÉCNICO
```

El cliente no podrá ampliar el resultado mediante parámetros de ruta, query string, almacenamiento local, último filtro, aplicación abierta, nombre del rol, estación, zona o recurso conocido.

---

#### 7. Máquina de estados de la superficie

`UX-STATION-SURFACE-STATE-MACHINE-001` define:

| Estado           | Significado                                                   |                   Mutaciones |
| ---------------- | ------------------------------------------------------------- | ---------------------------: |
| `UNBOUND`        | la estación o aplicación no está vinculada correctamente      |                           No |
| `ACTOR_REQUIRED` | falta actor efectivo                                          |                           No |
| `RESOLVING`      | se resuelven identidad, contexto, capacidades y trabajo       |                           No |
| `READY`          | existe contexto suficiente y fresco                           |           Según autorización |
| `LIMITED`        | la estación o actor tiene capacidades parciales conocidas     |          Solo las explícitas |
| `DEGRADED`       | existe falla controlada con operación limitada                |               Según contrato |
| `OFFLINE`        | no existe comunicación autoritativa y aplica política offline |     Solo acciones permitidas |
| `SYNC_PENDING`   | existen comandos o evidencias locales pendientes              |                    Limitadas |
| `CONFLICT`       | la reincorporación requiere decisión o conciliación           | No sobre el recurso afectado |
| `HANDOFF`        | trabajo en transferencia entre actores o estaciones           |               Según contrato |
| `BLOCKED`        | contexto inválido, revocado o condición insegura              |                           No |
| `RECOVERY`       | se recupera estado después de falla, reinicio o expiración    |             No hasta validar |
| `CLOSED`         | sesión del actor cerrada y superficie limpiada                |                           No |

Toda transición deberá declarar disparador, comprobaciones, trabajo pendiente, limpieza, destino, evidencia y fallback.

---

#### 8. Condiciones de `READY`

La superficie solo podrá entrar en `READY` cuando:

- la estación e instancia sean reconocidas;
- el perfil y su versión sean válidos;
- exista actor efectivo cuando el paso lo requiera;
- el contexto laboral y operativo sea vigente;
- sede, área y zona sean coherentes;
- el proceso, paso y recurso estén resueltos;
- la capacidad necesaria esté disponible;
- no exista revocación o bloqueo;
- la información visible haya sido filtrada;
- la acción se someta a autorización de servidor;
- la frescura sea suficiente para el riesgo.

La carga parcial no se presentará como `READY`.

---

#### 9. Encabezado contextual mínimo

La superficie conservará un indicador persistente y accesible con:

```text
actor efectivo
estación o puesto
sede y área operativas
zona cuando sea relevante
proceso o modo actual
estado de conexión y sincronización
condición degradada o limitada
```

No mostrará permisos internos, tokens, identificadores técnicos innecesarios ni datos personales completos.

El indicador no dependerá únicamente de color y deberá actualizarse al cambiar actor, sede, área, zona, proceso, dispositivo, conectividad o estado.

---

#### 10. Jerarquía de información

`UX-STATION-INFORMATION-HIERARCHY-001` establece este orden:

1. condición que bloquea o pone en riesgo la operación;
2. siguiente acción segura;
3. trabajo actual y su estado;
4. pendientes que requieren atención;
5. confirmaciones y resultados recientes;
6. contexto mínimo del actor y estación;
7. navegación secundaria;
8. diagnóstico o detalle técnico bajo demanda.

Una estación operativa no se convertirá en dashboard administrativo por conveniencia.

---

#### 11. Siguiente acción segura

Cada paso podrá declarar:

```text
primary_safe_action
secondary_actions[]
blocked_actions[]
required_information
required_confirmation
required_peripheral
required_connectivity
required_assurance
success_receipt
recovery_action
```

La acción principal deberá corresponder al estado real del proceso y no únicamente al botón usado por última vez.

No se presentará una acción destructiva, irreversible o sensible como acción primaria sin las salvaguardas aplicables.

---

#### 12. Alcance de trabajo visible

`UX-STATION-WORK-SCOPE-CONTRACT-001` separará:

- trabajo asignado al actor;
- trabajo asignado a la estación o zona;
- trabajo disponible para tomar;
- trabajo en curso;
- trabajo bloqueado;
- trabajo transferido;
- trabajo pendiente de sincronización;
- trabajo que exige supervisión;
- trabajo histórico autorizado.

El alcance visible no se derivará únicamente del rol o de la aplicación abierta.

---

#### 13. Colas, contadores y vistas previas

Los contadores, agrupaciones, títulos y vistas previas se tratarán como datos protegidos.

Una persona no autorizada no podrá inferir:

- existencia de pedidos, empleados, clientes, incidentes o documentos;
- cantidad de trabajo de otra sede o área;
- nombres, valores, prioridades o fragmentos;
- estados de recursos fuera de su territorio;
- información sensible mediante diferencias entre cero, error y oculto.

Las colas deberán soportar estado desconocido, parcial, desactualizado y paginado sin presentar totales falsos.

---

#### 14. Proceso, paso y recurso

La superficie deberá distinguir:

```text
PROCESO
→ INSTANCIA DEL PROCESO
→ PASO ACTUAL
→ RECURSO AFECTADO
→ ESTADO DEL PASO
→ ACCIONES POSIBLES
→ RESULTADO ESPERADO
```

Cambiar de pantalla no cambiará el estado empresarial. El estado solo cambiará por un comando confirmado o por un evento autoritativo.

---

#### 15. Filtros y selecciones

Un filtro podrá reducir información visible, pero nunca ampliar el conjunto autorizado.

Toda selección de sede, área, zona, fecha, actor, estado o recurso deberá:

- mostrar su efecto;
- conservar procedencia;
- tener opción de restablecimiento;
- invalidarse cuando cambie el contexto;
- no persistir datos sensibles entre actores;
- no convertirse en parámetro autoritativo;
- evitar resultados de una selección anterior durante la transición.

---

#### 16. Cambio de sede, área o zona

Cuando el proceso admita cambio contextual:

1. se bloquearán mutaciones;
2. se resolverán borradores y pendientes;
3. se comprobará que la estación permite el destino;
4. se resolverá el contexto del actor;
5. se reconsultará el trabajo;
6. se limpiarán datos incompatibles;
7. se mostrará el nuevo contexto;
8. se registrará el cambio.

No existirá cambio silencioso por desplazamiento, geolocalización, red Wi-Fi o último lugar utilizado.

---

#### 17. Entradas externas y enlaces profundos

Una notificación, QR, código, enlace profundo, escaneo, atajo o evento externo podrá solicitar abrir un recurso, pero deberá revalidar:

- actor;
- estación;
- aplicación;
- proceso y paso;
- recurso y territorio;
- contexto;
- autorización;
- estado;
- capacidad requerida.

Cuando la validación falle, no se mostrará información sensible del recurso.

---

#### 18. Capacidades y periféricos

La superficie deberá adaptar las acciones a la capacidad efectiva:

- táctil;
- teclado;
- cámara;
- escáner;
- impresora;
- datáfono;
- báscula o sensor;
- audio o señal visual;
- almacenamiento local;
- conectividad.

La ausencia o falla de una capacidad producirá estado y alternativa explícitos. No ocultará silenciosamente una obligación empresarial.

`UX-STATION-006` definirá los periféricos, montaje, alimentación, conectividad y mantenimiento físicos.

---

#### 19. Conectividad y degradación

La superficie separará:

```text
CONECTIVIDAD DEL CLIENTE
ESTADO DEL BACKEND
ESTADO DE LA RED LOCAL
ESTADO DEL PERIFÉRICO
ESTADO DE SINCRONIZACIÓN
ESTADO DEL PROCESO
```

No se mostrará “sin Internet” para cualquier falla ni “todo correcto” porque la aplicación abrió.

`UX-STATION-007` definirá la operación degradada, offline, contingencia y recuperación.

---

#### 20. Trabajo local y sincronización

Cuando exista trabajo local, la superficie mostrará:

- cantidad y clase de pendientes;
- actor original;
- estación y contexto de origen;
- momento de captura;
- estado de envío;
- resultado conocido, desconocido o conflictivo;
- acción permitida;
- riesgo de cerrar o cambiar de actor;
- ruta de conciliación.

Un cambio de actor no reasignará pendientes locales.

---

#### 21. Estado desconocido, desactualizado o incierto

La superficie distinguirá:

- dato vigente;
- dato en actualización;
- dato desactualizado;
- estado desconocido;
- comando pendiente;
- resultado incierto;
- conflicto;
- información no autorizada.

No convertirá `unknown` en cero, vacío, éxito o disponibilidad.

---

#### 22. Latencia y prevención de duplicados

Mientras se resuelve contexto o se ejecuta un comando:

- la intención activa será visible;
- se impedirán dobles envíos;
- se conservará idempotency key cuando aplique;
- no se mostrará éxito antes de receipt;
- podrá cancelarse únicamente cuando el contrato lo permita;
- se ofrecerá recuperación ante timeout;
- el actor no deberá repetir a ciegas una acción.

---

#### 23. Errores y recuperación

Los errores se clasificarán por:

```text
VALIDACIÓN
AUTORIZACIÓN
CONFLICTO
DEPENDENCIA
CONECTIVIDAD
PERIFÉRICO
SINCRONIZACIÓN
ESTADO EMPRESARIAL
CONFIGURACIÓN
DESCONOCIDO
```

Cada error tendrá mensaje comprensible, acción segura, identificador de soporte cuando aplique y protección contra exposición de detalles internos.

---

#### 24. Cambio y cierre de actor

Al cambiar o cerrar actor, la superficie deberá:

- bloquear nuevas mutaciones;
- resolver o custodiar borradores;
- conservar autoría de pendientes;
- limpiar datos, filtros y vistas previas;
- cerrar cámara, archivos y permisos temporales;
- revocar elevaciones;
- volver a `ACTOR_REQUIRED` o `CLOSED`;
- conservar evidencia del cierre.

Estas reglas consumen el contrato aprobado en `UX-STATION-004`.

---

#### 25. Borradores, trabajo en curso y handoff

Cada borrador deberá declarar:

```text
draft_owner
process_instance
step_id
resource_id
station_origin
context_origin
sensitivity
handoff_allowed
expiry_policy
recovery_policy
```

Un borrador no podrá aparecer al siguiente trabajador sin traspaso explícito o regla operativa aprobada.

La continuación por otro actor conservará autoría de cada acción y no reescribirá el historial.

---

#### 26. Privacidad en superficie compartida

`UX-STATION-SURFACE-PRIVACY-CONTRACT-001` exigirá:

- minimización por paso;
- masking según actor, recurso y entorno;
- ocultamiento de información no necesaria;
- limpieza entre actores;
- bloqueo por inactividad;
- protección de notificaciones y vistas previas;
- control de capturas, impresión y exportación;
- ausencia de secretos en errores;
- no persistencia de datos personales en filtros o historial local;
- posicionamiento y timeout adecuados para zonas públicas.

---

#### 27. Accesibilidad y señales multimodales

Los estados, bloqueos, pendientes y acciones deberán poder comprenderse sin depender solo de:

- color;
- icono;
- sonido;
- vibración;
- animación;
- texto técnico;
- memoria del trabajador.

La superficie deberá soportar foco, teclado cuando aplique, tamaño de texto, contraste, lectura breve, objetivos táctiles, orientación y recuperación tras interrupción.

---

#### 28. Densidad y carga cognitiva

La densidad se definirá según:

- frecuencia;
- urgencia;
- número de elementos;
- distancia de lectura;
- postura;
- manos ocupadas;
- ambiente;
- experiencia del trabajador;
- riesgo del paso.

No se aprobará una superficie saturada para “mostrar todo” ni una superficie minimalista que oculte estado, pendientes o consecuencias.

---

#### 29. Personalización permitida

La personalización individual podrá incluir preferencias no autoritativas, como orden secundario o accesibilidad, pero no podrá modificar:

- permisos;
- work scope;
- sede o área operativa;
- prioridad empresarial;
- controles obligatorios;
- campos requeridos;
- trazabilidad;
- masking;
- contingencia;
- estado del proceso.

La personalización se limpiará o separará correctamente en estaciones compartidas.

---

#### 30. Configuración y versionado

La superficie contextual deberá tener una versión asociada a:

```text
station_profile_version
surface_contract_version
process_version
component_contract_version
authorization_contract_version
```

Un cambio material de información, acciones, privacidad, estados o work scope exigirá nueva versión, compatibilidad, pruebas y rollout controlado.

No se adoptará automáticamente la última configuración sin evaluar las instancias afectadas.

---

#### 31. Auditoría y observabilidad

Cada resolución y transición relevante deberá poder correlacionar:

```text
station_instance_id
actor_session_id
process_id
step_id
resource_id
context_version
surface_state
command_id
event_id
correlation_id
configuration_version
reason_code
resolved_at
```

La telemetría no almacenará payloads sensibles innecesarios ni sustituirá la auditoría empresarial.

`NFR-REQ-009` y `OBS-ARC-001` a `OBS-ARC-016` desarrollarán la implementación posterior.

---

#### 32. Matriz de cobertura por proceso

`UX-STATION-PROCESS-SURFACE-MATRIX-001` deberá declarar para cada paso de los 69 procesos:

```text
process_id
process_version
step_id
station_profile_candidate
zone_context
actor_requirement
required_context
work_scope_rule
surface_entry_state
primary_safe_action
visible_information
masked_information
capability_requirements
connectivity_modes
pending_work_behavior
handoff_behavior
close_behavior
error_classes
prototype_questions
final_owner_task
```

Cuando un paso no requiera superficie compartida se justificará `NO_SHARED_CONTEXTUAL_SURFACE`.

---

#### 33. Escenarios mínimos de validación posterior

La matriz deberá preparar, como mínimo:

1. estación sin vínculo;
2. actor ausente;
3. actor no vigente;
4. contexto incompleto;
5. cambio de actor con borrador;
6. cambio de zona con trabajo pendiente;
7. recurso de otra sede;
8. deep link no autorizado;
9. contador que podría filtrar información;
10. periférico ausente;
11. conectividad parcial;
12. backend disponible con proceso bloqueado;
13. estado desconocido;
14. comando con resultado incierto;
15. doble toque o reintento;
16. sincronización pendiente;
17. conflicto de reincorporación;
18. revocación durante una acción;
19. inactividad con datos sensibles;
20. configuración incompatible;
21. accesibilidad sin color o audio;
22. recuperación después de reinicio;
23. handoff aceptado y rechazado;
24. trabajo de alta concurrencia;
25. cierre limpio entre trabajadores.

Las pruebas con trabajadores reales pertenecen a `UX-STATION-008`.

---

#### 34. Brechas y destinos obligatorios

| Brecha                                                    | Tarea propietaria                                         |
| --------------------------------------------------------- | --------------------------------------------------------- |
| capacidades, periféricos, montaje, energía y conectividad | `UX-STATION-006`                                          |
| offline, degradación, contingencia y recuperación         | `UX-STATION-007`                                          |
| prototipo y validación con trabajadores                   | `UX-STATION-008`                                          |
| aprobación final de matriz                                | `UX-STATION-009`                                          |
| gramática de interacción                                  | `UX-STATION-010`                                          |
| bandeja contextual                                        | `UX-STATION-011`                                          |
| composición dinámica                                      | `UX-STATION-012`                                          |
| pantallas definitivas                                     | `PROC-SCREEN-001` a `PROC-SCREEN-028`                     |
| identidad y límites del dispositivo                       | `AUTH-DEV-001` a `AUTH-DEV-016`                           |
| resolución de contexto                                    | `AUTH-CTX-001` a `AUTH-CTX-030`                           |
| colas e idempotencia                                      | `QUEUE-ARC-001` a `QUEUE-ARC-012`                         |
| observabilidad y soporte                                  | `OBS-ARC-001` a `OBS-ARC-016`; `TI-DOM-007`; `TI-DOM-010` |
| cobertura final de procesos                               | `PROC-COVER-001` a `PROC-COVER-010`                       |

Toda brecha conservará propietario, evidencia requerida, riesgo, fecha o condición de revisión y puerta de cierre.

---

#### 35. Límites de esta tarea

Esta tarea no:

- crea wireframes o pantallas finales;
- define navegación definitiva;
- implementa componentes;
- aprueba iconos, colores o layouts concretos;
- diseña la bandeja completa;
- configura estaciones o periféricos;
- modifica autorización;
- crea cuentas o credenciales;
- implementa offline;
- crea colas;
- cambia procesos;
- crea tablas o migraciones;
- modifica Supabase;
- ejecuta prototipos;
- habilita E5.

---

#### Requisitos de prueba derivados

**Resultado:** GENERA 40 REQUISITOS DE PRUEBA.

Se incorporan `TREQ-PROC-701` a `TREQ-PROC-740` en el Registro Canónico de Requisitos de Prueba.

Estos requisitos protegen resolución contextual, autoridad, estados, jerarquía, work scope, privacidad, colas, acciones, cambios de contexto, deep links, capacidades, degradación, sincronización, errores, handoff, accesibilidad, versionado, auditoría y cobertura de los 69 procesos.

---

#### 36. Criterios de aceptación

- [ ] Se separa superficie contextual de autorización, proceso, bandeja y pantalla definitiva.
- [ ] Existe una unidad mínima de resolución completa.
- [ ] La precedencia se basa en intersección y fuentes autoritativas.
- [ ] Existe máquina de estados y condiciones explícitas para `READY`.
- [ ] El actor, estación y contexto son visibles sin exponer datos innecesarios.
- [ ] La jerarquía prioriza bloqueo, siguiente acción y trabajo actual.
- [ ] Work scope, colas, contadores y vistas previas están protegidos.
- [ ] Proceso, paso, recurso y estado permanecen separados.
- [ ] Filtros y selecciones no amplían autoridad.
- [ ] Cambios de sede, área y zona revalidan contexto.
- [ ] Entradas externas no evitan autorización.
- [ ] Capacidades y periféricos producen estados explícitos.
- [ ] Conectividad, backend, red local, periférico y sincronización se distinguen.
- [ ] El trabajo local conserva actor y contexto originales.
- [ ] Estado desconocido no se convierte en éxito o vacío.
- [ ] Se previenen dobles envíos y resultados falsos.
- [ ] Errores y recuperación tienen contrato.
- [ ] Cambio de actor limpia y conserva autoría.
- [ ] Privacidad, accesibilidad y carga cognitiva están cubiertas.
- [ ] La configuración es versionada.
- [ ] Los 69 procesos tienen destino de cobertura.
- [ ] Cada brecha tiene tarea exacta.
- [ ] No se implementó UI, código, hardware, migraciones ni Supabase.
- [ ] `UX-STATION-006` permanece no iniciada.

---

#### 37. Estado y continuidad

```text
UX-STATION-004 APROBADA
UX-STATION-005 APROBADA
UX-STATION-006 NO INICIADA
```

La aprobación documental de esta tarea habilita continuar con `UX-STATION-006`. No autoriza implementación, configuración física, navegación final, migraciones, despliegue ni entrada a E5.


### ✅ UX-STATION-006 — Definir periféricos, montaje, alimentación, conectividad y mantenimiento

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Marcador exacto que reemplaza:** `### [ ] UX-STATION-006 — Definir periféricos, montaje, alimentación, conectividad y mantenimiento`  
**Tarea anterior:** `UX-STATION-005 — Diseñar la superficie operativa contextual por estación, zona y proceso` — APROBADA  
**Siguiente tarea reservada:** `UX-STATION-007 — Definir operación degradada, offline, contingencia y recuperación` — NO INICIADA  
**Artefactos aprobados:** `UX-STATION-PHYSICAL-CAPABILITY-CONTRACT-001`; `UX-STATION-PERIPHERAL-CAPABILITY-CATALOG-001`; `UX-STATION-MOUNTING-AND-ENVIRONMENT-PROFILE-001`; `UX-STATION-POWER-RESILIENCE-MATRIX-001`; `UX-STATION-CONNECTIVITY-PROFILE-001`; `UX-STATION-MAINTENANCE-OPERATING-MODEL-001`; `UX-STATION-PROCESS-PHYSICAL-DEPENDENCY-MATRIX-001`; `UX-STATION-PHYSICAL-EXCEPTION-REGISTER-001`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`, por paso, perfil, instancia, periférico, montaje, energía, red, mantenimiento, fallback y criticidad  
**Naturaleza:** contrato funcional y físico objetivo de capacidades periféricas e infraestructura de estación; no selección de marcas o modelos, compra, instalación, cableado, configuración de red, alta de activos, implementación de drivers, cambios de firmware, migraciones ni cambios en Supabase  
**Cambios en código, aplicaciones, hardware, red, energía, periféricos, montaje, compras, inventario, firmware, drivers, configuración, migraciones, Supabase o despliegues:** no autorizados

---

#### 1. Propósito

Definir las condiciones mínimas para que una estación operativa pueda utilizar de forma segura, mantenible y verificable los periféricos y servicios físicos que necesita para producir un resultado empresarial.

```text
PASO OPERATIVO
+ CAPACIDAD FÍSICA REQUERIDA
+ PERIFÉRICO O ENDPOINT COMPATIBLE
+ MONTAJE Y AMBIENTE ADECUADOS
+ ALIMENTACIÓN SUFICIENTE
+ CONECTIVIDAD UTILIZABLE
+ MANTENIMIENTO Y SOPORTE
+ FALLBACK APROBADO
= CAPACIDAD OPERATIVA FÍSICA VERIFICABLE
```

La mera existencia de un equipo, un puerto, una dirección IP, una conexión Bluetooth o una impresora encendida no demostrará que el paso operativo puede completarse.

```text
DISPOSITIVO ENCENDIDO
≠ PERIFÉRICO DISPONIBLE

PERIFÉRICO CONECTADO
≠ RESULTADO EMPRESARIAL CONFIRMADO

IP FIJA
≠ CONECTIVIDAD RESILIENTE

MONTAJE POSIBLE
≠ MONTAJE SEGURO, HIGIÉNICO Y MANTENIBLE
```

---

#### 2. Continuidad lógica

`UX-STATION-003` definió perfiles canónicos; `UX-STATION-004` definió actor efectivo; `UX-STATION-005` definió la superficie contextual. Esta tarea define las capacidades físicas que esa superficie puede consumir y las condiciones bajo las cuales se consideran utilizables.

```text
PERFIL DE ESTACIÓN
        ↓
ACTOR Y CONTEXTO
        ↓
SUPERFICIE CONTEXTUAL
        ↓
CAPACIDADES FÍSICAS Y PERIFÉRICOS
        ↓
OPERACIÓN DEGRADADA Y RECUPERACIÓN
        ↓
PROTOTIPO Y MATRIZ FINAL
```

No adelanta la contingencia detallada de `UX-STATION-007`, el prototipo de `UX-STATION-008`, la aprobación final de `UX-STATION-009`, la arquitectura técnica de `TI-DOM-*`, la implementación de impresión `PRINT-ARC-*` ni la compra o instalación física.

---

#### 3. Separación conceptual obligatoria

| Concepto              | Significado                                                                                 | No equivale a                    |
| --------------------- | ------------------------------------------------------------------------------------------- | -------------------------------- |
| capacidad física      | función requerida por un paso, como escanear, pesar, imprimir, cobrar, capturar o señalizar | marca o modelo                   |
| periférico            | equipo que materializa una capacidad                                                        | estación completa                |
| endpoint              | identidad técnica administrable de un equipo o servicio                                     | actor humano                     |
| host                  | dispositivo que ejecuta adaptador o controla periféricos                                    | fuente de autoridad empresarial  |
| instancia de estación | puesto físico configurado y localizado                                                      | perfil abstracto                 |
| montaje               | forma física de fijación, ubicación, alcance y protección                                   | simple presencia en el área      |
| dominio de energía    | fuente, respaldo, protección y autonomía aplicables                                         | disponibilidad garantizada       |
| ruta de conectividad  | trayecto entre estación, periférico, red local y servicio                                   | autorización                     |
| consumible            | papel, etiqueta, tinta, batería u otro elemento agotable                                    | activo permanente                |
| configuración         | parámetros versionados del endpoint o adaptador                                             | permiso para modificarlos        |
| salud técnica         | estado observable del componente                                                            | resultado empresarial confirmado |
| mantenimiento         | inspección, limpieza, calibración, reparación, reemplazo y retiro                           | soporte improvisado              |

---

#### 4. Artefactos aprobados

1. `UX-STATION-PHYSICAL-CAPABILITY-CONTRACT-001`  
   Contrato transversal de capacidad física y condiciones de uso.

2. `UX-STATION-PERIPHERAL-CAPABILITY-CATALOG-001`  
   Catálogo abstracto y versionado de capacidades, clases y restricciones.

3. `UX-STATION-MOUNTING-AND-ENVIRONMENT-PROFILE-001`  
   Reglas de montaje, ergonomía, higiene, protección, accesibilidad y ambiente.

4. `UX-STATION-POWER-RESILIENCE-MATRIX-001`  
   Requisitos de alimentación, autonomía, protección y apagado seguro.

5. `UX-STATION-CONNECTIVITY-PROFILE-001`  
   Rutas primarias, secundarias, descubrimiento, vinculación y degradación.

6. `UX-STATION-MAINTENANCE-OPERATING-MODEL-001`  
   Ciclo de comisión, inspección, limpieza, calibración, incidente, reparación, sustitución y retiro.

7. `UX-STATION-PROCESS-PHYSICAL-DEPENDENCY-MATRIX-001`  
   Matriz de los 69 procesos por paso, capacidad, dependencia y fallback.

8. `UX-STATION-PHYSICAL-EXCEPTION-REGISTER-001`  
   Excepciones con riesgo, propietario, compensación, vencimiento y cierre.

---

#### 5. Unidad mínima de definición

Cada requisito físico se definirá para una combinación explícita:

```text
process_id
step_id
station_profile_id
station_instance_id
zone_id
physical_capability_id
peripheral_class
binding_mode
host_requirement
mounting_profile
power_profile
connectivity_profile
maintenance_profile
criticality_class
fallback_mode
functional_owner
technical_owner
validation_status
```

No se asignará un periférico únicamente por aplicación, rol o sede.

---

#### 6. Catálogo canónico de capacidades

El catálogo podrá contener, sin limitarse a:

| Familia                  | Capacidades abstractas                                                                       |
| ------------------------ | -------------------------------------------------------------------------------------------- |
| entrada e identificación | lectura de código, captura de imagen, teclado, tacto, firma, credencial individual           |
| medición                 | peso, temperatura, cantidad, dimensión u otra magnitud autorizada                            |
| salida documental        | impresión de recibo, comanda, etiqueta, documento o comprobante                              |
| señalización             | visualización, sonido, luz o aviso háptico como apoyo multimodal                             |
| pago                     | interacción con terminal o proveedor de pago sin convertir el periférico en fuente de verdad |
| evidencia                | fotografía, lectura, sello temporal o captura controlada                                     |
| comunicación local       | intercambio con host, adaptador, red o servicio transversal                                  |
| energía                  | carga, respaldo, autonomía, protección y apagado seguro                                      |

Cada capacidad tendrá ID, versión, entradas, salidas, precisión requerida cuando aplique, latencia tolerable, privacidad, seguridad, evidencias, estados de salud, fallback y pruebas.

---

#### 7. Selección por capacidad y no por marca

La documentación expresará primero la capacidad y después las características mínimas del equipo que podría satisfacerla.

No se fijarán en esta tarea:

- fabricante;
- modelo;
- proveedor;
- precio;
- voltaje o potencia concretos;
- protocolo definitivo;
- topología de red;
- dirección IP;
- driver específico;
- firmware objetivo;
- contrato de compra;
- cantidad final de unidades.

Esas decisiones deberán materializarse posteriormente mediante `TI-DOM-002` a `TI-DOM-005`, `ORIGO`, `NEXO`, `PRINT-ARC-*`, paquetes E5 y pruebas físicas.

---

#### 8. Estados de disponibilidad del periférico

Cada periférico o capacidad expondrá, como mínimo:

| Estado        | Significado                            | Acción permitida                 |
| ------------- | -------------------------------------- | -------------------------------- |
| `UNKNOWN`     | no existe evidencia suficiente         | bloquear dependencia crítica     |
| `UNMANAGED`   | equipo detectado pero no administrado  | no usar para mutaciones críticas |
| `DISCOVERED`  | detectado sin vinculación aprobada     | diagnóstico controlado           |
| `BOUND`       | vinculado a estación o host            | validar salud y contexto         |
| `READY`       | disponible y dentro de parámetros      | operar según autorización        |
| `BUSY`        | reservado por otra operación           | esperar o enrutar                |
| `DEGRADED`    | capacidad parcial conocida             | solo flujo permitido             |
| `OFFLINE`     | sin comunicación utilizable            | aplicar fallback aprobado        |
| `ERROR`       | fallo identificado                     | no repetir ciegamente            |
| `MAINTENANCE` | fuera de servicio planificado          | usar sustituto                   |
| `QUARANTINED` | inseguro, inconsistente o no confiable | bloquear                         |
| `RETIRED`     | retirado de operación                  | no vincular                      |

La interfaz no mostrará éxito mientras el estado o resultado permanezca desconocido.

---

#### 9. Vinculación y pertenencia

Toda relación entre estación y periférico declarará:

```text
station_instance_id
peripheral_endpoint_id
capability_ids[]
binding_type
allowed_zones[]
host_endpoint_id
configuration_version
commissioned_at
verified_at
owner
custodian
status
```

Tipos de vinculación posibles:

- dedicada a una estación;
- compartida por una zona;
- compartida por un grupo controlado;
- móvil con custodia;
- remota mediante servicio transversal;
- temporal con autorización y vencimiento.

Un periférico encontrado por proximidad no se adoptará automáticamente.

---

#### 10. Exclusividad y concurrencia

Las capacidades que no admitan uso simultáneo deberán contar con reserva, lease, correlación y liberación.

Se evitará que:

- dos estaciones envíen comandos incompatibles al mismo equipo;
- una báscula mezcle lecturas de dos operaciones;
- un escáner atribuya la lectura al actor equivocado;
- una impresora confirme un trabajo distinto al solicitado;
- una terminal de pago se reasigne mientras existe una transacción activa;
- un reinicio libere silenciosamente una operación incierta.

Toda expiración de lease deberá conducir a reconciliación, no a repetición automática ciega.

---

#### 11. Contrato de comando y resultado físico

Toda operación con efecto físico conservará:

```text
command_id
idempotency_key
actor_context
station_instance_id
peripheral_endpoint_id
capability_id
business_resource
requested_at
dispatched_at
acknowledged_at
completed_at
result_status
physical_evidence
retry_class
reconciliation_status
```

Estados mínimos:

```text
REQUESTED
→ ACCEPTED
→ DISPATCHED
→ ACKNOWLEDGED
→ COMPLETED | FAILED | UNKNOWN
→ RECONCILED
```

`ACCEPTED` no equivale a salida física completada. `UNKNOWN` exige comprobación antes de reintentar.

---

#### 12. Montaje y ubicación física

Cada perfil de montaje declarará:

- superficie o estructura de fijación;
- altura y alcance utilizables;
- orientación y ángulo de lectura;
- visibilidad sin obstruir trabajo;
- estabilidad frente a vibración o golpe;
- acceso para limpieza y mantenimiento;
- acceso controlado a puertos y botones;
- ruta de cables;
- protección contra tirones y tropiezos;
- posibilidad de retiro autorizado;
- compatibilidad con postura y movilidad;
- accesibilidad para personas con distintas capacidades;
- espacio para consumibles y sustitución.

No se considerará aprobado un montaje que solo funcione durante una demostración.

---

#### 13. Ambiente operativo

El perfil ambiental deberá evaluar:

- humedad y salpicaduras;
- grasa y residuos;
- polvo o harina;
- frío o calor;
- vapor y condensación;
- iluminación y reflejo;
- ruido;
- vibración;
- contacto con alimentos;
- químicos de limpieza;
- tránsito de personas y carros;
- riesgo de caída, impacto o manipulación no autorizada.

Las protecciones no podrán impedir ventilación, lectura, limpieza, carga ni acceso seguro.

---

#### 14. Higiene y limpieza

Para estaciones en producción, cocina, barra, bodega o servicio se definirá:

```text
cleaning_owner
cleaning_frequency_class
approved_method
power_state_for_cleaning
removable_parts
forbidden_products
inspection_after_cleaning
incident_route
```

La limpieza no deberá borrar configuración, cambiar vinculación, activar comandos ni dejar credenciales visibles.

La definición concreta de productos, frecuencias y procedimientos operativos deberá completarse en `TI-DOM-003`, mantenimiento, seguridad y procedimientos de cada sede.

---

#### 15. Seguridad física y manipulación

Se exigirá:

- fijación o custodia proporcional al riesgo;
- protección de puertos y medios removibles;
- prevención de credenciales por defecto;
- sello o evidencia de intervención cuando aplique;
- control de apertura, reemplazo y retiro;
- separación entre acceso de usuario y acceso técnico;
- bloqueo de equipos desconocidos;
- registro de cambios físicos relevantes;
- limpieza segura de datos antes de reasignar o retirar.

El soporte remoto no sustituirá la autorización ni la custodia local.

---

#### 16. Alimentación eléctrica

`UX-STATION-POWER-RESILIENCE-MATRIX-001` declarará por instancia o clase:

```text
normal_power_source
connector_or_delivery_class
expected_load_class
battery_or_ups_requirement
minimum_safe_autonomy_class
surge_or_transient_protection
charging_method
cable_and_adapter_ownership
graceful_shutdown_behavior
power_loss_detection
restart_behavior
recovery_validation
```

No se asignarán cifras técnicas sin levantamiento, ficha del fabricante y validación de `TI-DOM-002`, `TI-DOM-003` y `TI-DOM-009`.

---

#### 17. Pérdida y retorno de energía

Ante pérdida o inestabilidad:

1. se protegerá el comando empresarial en curso;
2. se evitará corrupción local;
3. se distinguirá operación completada, fallida o incierta;
4. se bloquearán reintentos peligrosos;
5. se conservará actor y contexto originales;
6. se aplicará apagado seguro cuando sea posible;
7. al retornar, se verificará reloj, vinculación, configuración, red, salud y pendientes;
8. no se declarará recuperación hasta conciliar efectos.

La operación degradada detallada queda en `UX-STATION-007`.

---

#### 18. Baterías, carga y autonomía

Los equipos con batería declararán:

- estado de salud;
- capacidad útil observable;
- ciclos o degradación cuando estén disponibles;
- umbrales operativos definidos posteriormente;
- política de carga;
- cargador autorizado;
- custodia de baterías removibles;
- sustitución;
- riesgo de hinchamiento, sobrecalentamiento o daño;
- fallback antes de agotamiento;
- evidencia de autonomía en condiciones reales.

Una batería que enciende el equipo no prueba autonomía suficiente para el proceso.

---

#### 19. Perfil de conectividad

Cada dependencia de red declarará:

```text
primary_path
secondary_path
local_or_remote_scope
name_resolution_method
addressing_dependency
discovery_method
segmentation_requirement
authentication_method
encryption_requirement
latency_class
packet_loss_tolerance
bandwidth_class
roaming_behavior
offline_behavior
health_check
recovery_check
```

Las cifras y topologías concretas pertenecen a `TI-DOM-004` y a paquetes posteriores.

---

#### 20. Identidad estable y direccionamiento

No se dependerá exclusivamente de:

- último octeto recordado;
- IP configurada manualmente sin reserva o inventario;
- nombre informal escrito en una etiqueta;
- descubrimiento abierto por proximidad;
- puerto USB concreto no administrado;
- emparejamiento Bluetooth persistido sin propietario;
- host personal no inventariado.

La resolución deberá utilizar identidad estable, inventario, configuración versionada y comprobación de pertenencia.

---

#### 21. Red local y segmentación

La estación deberá declarar qué comunicaciones necesita y con qué destino, sin diseñar todavía la red definitiva.

`TI-DOM-004` será responsable de:

- inventario y topología;
- segmentación;
- direccionamiento;
- reservas y nombres;
- reglas de comunicación;
- monitoreo;
- redundancia;
- contingencia de ISP o red local.

La estación no podrá requerir una red plana ni credenciales compartidas para funcionar.

---

#### 22. Conectividad inalámbrica y movilidad

Cuando aplique Wi-Fi, Bluetooth, NFC o conectividad celular se evaluará:

- alcance real y zonas muertas;
- interferencia;
- roaming;
- reconexión;
- emparejamiento seguro;
- consumo de batería;
- coexistencia con otros equipos;
- identidad del endpoint;
- revocación;
- uso sin conexión;
- exposición por proximidad.

La modalidad inalámbrica no será elegida solo para evitar cableado.

---

#### 23. Impresión y etiquetado

La capacidad de impresión distinguirá:

```text
INTENCIÓN EMPRESARIAL
→ TRABAJO DE IMPRESIÓN
→ ROUTING
→ COLA
→ ADAPTADOR O HOST
→ IMPRESORA
→ RESULTADO FÍSICO
→ CONFIRMACIÓN O RECONCILIACIÓN
```

Se definirán:

- tipo de documento o etiqueta;
- formato y medio;
- destino permitido;
- privacidad;
- copias;
- correlación;
- reimpresión;
- consumibles;
- atasco, falta de papel y desconexión;
- resultado conocido o incierto.

La arquitectura técnica y las colas corresponden a `PRINT-ARC-*` y `TI-DOM-005`.

---

#### 24. Escáneres y cámaras

Se definirá:

- simbologías o evidencia admitidas;
- distancia y orientación;
- iluminación;
- enfoque;
- confirmación multimodal;
- asociación con actor, recurso y paso;
- prevención de lectura duplicada;
- tratamiento de lectura inválida;
- privacidad de imágenes;
- almacenamiento temporal;
- limpieza entre actores;
- fallback manual controlado.

Una lectura no ejecutará una mutación irreversible sin mostrar y validar la intención correspondiente.

---

#### 25. Básculas, sensores y medición

Toda medición declarará:

- unidad canónica;
- rango y resolución requeridos;
- precisión o tolerancia aprobada posteriormente;
- tara;
- estabilidad;
- calibración;
- sello temporal;
- actor y recurso;
- lectura cruda y valor normalizado cuando aplique;
- estados fuera de rango;
- intervención manual;
- evidencia y auditoría.

No se aceptará un valor sin conocer la fuente, unidad y estado de calibración aplicables.

---

#### 26. Terminales de pago

La estación tratará la terminal de pago como dependencia externa controlada.

Se separarán:

- intención de cobro;
- monto y moneda;
- referencia empresarial;
- transacción del proveedor;
- resultado mostrado;
- comprobante;
- conciliación;
- reversión;
- estado desconocido;
- custodia física del terminal.

La confirmación verbal o visual sin referencia conciliable no cerrará el proceso.

---

#### 27. Señalización y avisos

Luces, sonidos, pantallas auxiliares, campanas o vibración serán apoyos, no única fuente de información.

Cada aviso deberá:

- ser atribuible a un evento;
- evitar alarmas indistinguibles;
- tener alternativa visual o textual cuando aplique;
- respetar ruido y ambiente;
- permitir reconocimiento sin confirmar automáticamente el trabajo;
- evitar exposición de datos sensibles;
- registrar fallos cuando sea crítico.

---

#### 28. Consumibles y medios

Papel, etiquetas, tinta, cinta, baterías y otros consumibles declararán:

- tipo compatible;
- propietario de reposición;
- ubicación;
- nivel mínimo definido posteriormente;
- evidencia de agotamiento;
- sustitución segura;
- lote o trazabilidad cuando aplique;
- residuos y disposición;
- alternativa de contingencia.

La ausencia de consumible se tratará como indisponibilidad de capacidad, no como error del trabajador.

---

#### 29. Configuración y versionado

Toda configuración relevante conservará:

```text
configuration_id
configuration_version
endpoint_id
station_instance_id
capability_contract_version
firmware_or_driver_reference
applied_at
applied_by
change_record
validation_result
rollback_reference
```

Un cambio en driver, firmware, cola, red, montaje o configuración deberá pasar por `TI-DOM-009`, pruebas y rollback cuando pueda afectar procesos.

---

#### 30. Observabilidad y diagnóstico

Se observarán, cuando sean proporcionales:

- disponibilidad;
- estado de enlace;
- errores;
- latencia;
- colas;
- batería o energía;
- consumibles;
- temperatura o condición técnica disponible;
- versión;
- reinicios;
- comandos inciertos;
- mantenimiento próximo;
- drift de configuración.

La telemetría no incluirá secretos, imágenes, documentos o datos personales innecesarios. `NFR-REQ-009`, `TI-DOM-010` y `TI-AUTH-004` gobiernan la observabilidad y protección.

---

#### 31. Modelo de mantenimiento

El ciclo mínimo será:

```text
PLANIFICADO
→ RECIBIDO
→ COMISIONADO
→ EN SERVICIO
→ INSPECCIONADO
→ MANTENIMIENTO PREVENTIVO O CORRECTIVO
→ VALIDADO
→ REASIGNADO O RETIRADO
```

Cada actividad conservará activo, endpoint, estación, responsable, fecha, motivo, acciones, partes o consumibles, configuración afectada, prueba posterior, indisponibilidad, evidencia y siguiente fecha cuando aplique.

---

#### 32. Mantenimiento preventivo

La frecuencia no será universal. Se derivará de:

- criticidad del proceso;
- ambiente;
- intensidad de uso;
- recomendación técnica;
- historial de fallos;
- limpieza;
- calibración;
- consumibles;
- garantía;
- riesgo de seguridad;
- disponibilidad de sustituto.

`TI-DOM-003`, `TI-DOM-005` y NEXO materializarán planes concretos.

---

#### 33. Mantenimiento correctivo e incidentes

Un fallo producirá:

1. clasificación de impacto;
2. identificación de estación, endpoint y capacidad;
3. protección del trabajo en curso;
4. diagnóstico no destructivo;
5. fallback o sustitución;
6. reparación o cambio controlado;
7. prueba técnica;
8. validación funcional con el proceso;
9. conciliación de pendientes;
10. cierre con evidencia.

La mesa de servicio, incidentes y problemas corresponden a `TI-DOM-007` y `TI-DOM-008`.

---

#### 34. Repuestos, sustitutos y single points of failure

Todo paso crítico dependiente de un equipo físico declarará:

- si existe sustituto;
- ubicación y custodia;
- tiempo de activación objetivo definido posteriormente;
- compatibilidad;
- configuración recuperable;
- consumibles;
- entrenamiento requerido;
- fallback manual u offline;
- criterio de escalamiento.

Una capacidad crítica sin sustituto ni procedimiento alternativo generará brecha para `UX-STATION-007`, `NFR-REQ-001`, continuidad y E5.

---

#### 35. Comisión y aceptación de una instancia

Antes de usar una instancia deberán validarse:

- identidad y ubicación;
- perfil y configuración;
- montaje;
- energía y autonomía;
- conectividad primaria y secundaria cuando aplique;
- vinculación de periféricos;
- seguridad;
- limpieza;
- accesibilidad;
- salud;
- comando y resultado físico;
- fallback;
- recuperación tras reinicio;
- prueba con carga y ambiente reales.

La aceptación documental no sustituirá la prueba física de `UX-STATION-008`, `AUTH-DEV-014` a `AUTH-DEV-016`, readiness y piloto.

---

#### 36. Cambio, traslado y reasignación

Trasladar un equipo o estación podrá cambiar zona, red, riesgo, alcance, actor, montaje, energía y periféricos.

Todo traslado exigirá:

- autorización;
- cierre del uso anterior;
- custodia;
- actualización de inventario;
- nueva vinculación;
- inspección;
- prueba de conectividad y capacidad;
- limpieza de datos locales cuando corresponda;
- evidencia de entrada en servicio.

No se conservará silenciosamente una sede o área anterior.

---

#### 37. Retiro y disposición

El retiro deberá:

- bloquear nuevas asignaciones;
- cerrar trabajos y pendientes;
- revocar credenciales y certificados;
- retirar secretos;
- limpiar datos;
- desvincular periféricos y estaciones;
- conservar evidencia y configuración necesaria;
- gestionar garantía, devolución, repuesto o disposición;
- actualizar inventario y documentación;
- verificar que el proceso conserva alternativa.

---

#### 38. Responsabilidades documentales

| Decisión                                  | Tarea propietaria                             |
| ----------------------------------------- | --------------------------------------------- |
| perfiles e instancias                     | `UX-STATION-003`                              |
| actor y limpieza de sesión                | `UX-STATION-004`                              |
| superficie y estados                      | `UX-STATION-005`                              |
| capacidades físicas objetivo              | `UX-STATION-006`                              |
| degradación, fallback y recuperación      | `UX-STATION-007`                              |
| pruebas con trabajadores y equipos reales | `UX-STATION-008`                              |
| matriz final aprobada                     | `UX-STATION-009`                              |
| dispositivo compartido y autorización     | `AUTH-DEV-001` a `AUTH-DEV-016`               |
| activos y endpoints                       | `TI-DOM-002` y `TI-DOM-003`; NEXO             |
| red                                       | `TI-DOM-004`                                  |
| impresión y periféricos                   | `TI-DOM-005`; `PRINT-ARC-*`                   |
| incidentes y problemas                    | `TI-DOM-007` y `TI-DOM-008`                   |
| cambio tecnológico                        | `TI-DOM-009`                                  |
| observabilidad                            | `NFR-REQ-009`; `TI-DOM-010`; `TI-INT-001`     |
| recuperación                              | `NFR-REQ-010`; `TI-DOM-011`; continuidad      |
| compras, garantías y contratos            | ORIGO; `TI-DOM-012`                           |
| capacitación                              | `TI-DOM-013`; ANIMA                           |
| paquetes, pruebas y rollout               | E5; BLOQUE T; `SHELL-CI-020` a `SHELL-CI-024` |

---

#### 39. Matriz de cobertura de procesos

`UX-STATION-PROCESS-PHYSICAL-DEPENDENCY-MATRIX-001` cubrirá los 69 procesos y cada paso relevante con:

```text
process_id
step_id
station_profile
station_instance_class
physical_capabilities[]
peripheral_classes[]
mounting_profile
power_profile
connectivity_profile
maintenance_profile
criticality
single_point_of_failure
fallback
validation_questions[]
owner
status
```

Un proceso sin dependencia física deberá registrar `NO_PHYSICAL_DEPENDENCY` con justificación.

---

#### 40. Preguntas obligatorias para prototipo

`UX-STATION-008` deberá comprobar, según aplique:

- alcance y postura reales;
- lectura bajo iluminación real;
- uso con guantes, humedad o grasa;
- tiempo de conexión y reconexión;
- cambio de actor;
- uso simultáneo;
- papel, etiquetas y consumibles;
- agotamiento de batería;
- pérdida y retorno de energía;
- pérdida y retorno de red;
- atasco o error físico;
- equipo sustituto;
- limpieza;
- reinicio;
- comando incierto;
- accesibilidad;
- ruido y señalización;
- mantenimiento sin bloquear indebidamente el área.

---

#### 41. Escenarios mínimos de validación

1. periférico requerido ausente;
2. periférico desconocido detectado;
3. vinculación a estación incorrecta;
4. dos estaciones compiten por un equipo exclusivo;
5. comando aceptado sin resultado físico;
6. resultado físico producido sin receipt;
7. pérdida de energía durante operación;
8. reinicio con operación incierta;
9. batería insuficiente durante pico;
10. cargador o adaptador no autorizado;
11. Wi-Fi con roaming o zona muerta;
12. IP o nombre del endpoint cambia;
13. pérdida de red local con servicio externo disponible;
14. impresora sin papel o atascada;
15. reimpresión de documento sensible;
16. escaneo duplicado;
17. cámara sin permiso o con iluminación insuficiente;
18. báscula sin tara o calibración vigente;
19. terminal de pago con estado desconocido;
20. aviso audible no perceptible por ruido;
21. limpieza provoca reinicio o cambio de configuración;
22. cable o montaje crea riesgo físico;
23. periférico entra en mantenimiento durante operación;
24. traslado conserva contexto territorial anterior;
25. retiro deja credenciales o datos;
26. equipo sustituto no tiene configuración compatible;
27. consumible agotado sin alerta;
28. firmware o driver cambia sin validación;
29. telemetría expone datos sensibles;
30. proceso crítico carece de fallback.

---

#### 42. Brechas y excepciones

Toda brecha conservará:

```text
exception_id
process_id
step_id
station_or_peripheral
condition
risk
temporary_compensation
owner
resolution_task
activation_condition
evidence_required
expiry
status
```

Clasificación:

| Clase        | Ejemplo                                                        | Tratamiento               |
| ------------ | -------------------------------------------------------------- | ------------------------- |
| `PHY-GAP-P0` | riesgo de seguridad, fraude o resultado crítico no conciliable | bloquea aprobación        |
| `PHY-GAP-P1` | proceso crítico sin capacidad o fallback                       | bloquea piloto aplicable  |
| `PHY-GAP-P2` | degradación importante con compensación temporal               | carryover con vencimiento |
| `PHY-GAP-P3` | mejora no crítica                                              | planificación ordinaria   |

Ninguna excepción permanecerá como nota narrativa sin tarea exacta.

---

#### Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

**Rango incorporado:** `TREQ-PROC-741` a `TREQ-PROC-780`

Los requisitos protegen capacidad, vinculación, concurrencia, resultados físicos, montaje, ambiente, higiene, energía, conectividad, impresión, captura, medición, pagos, consumibles, configuración, observabilidad, mantenimiento, sustitución, comisión, traslado, retiro y cobertura de los 69 procesos.

---

#### 43. Criterios de aceptación

- [ ] Se separan capacidad, periférico, endpoint, host, estación, montaje, energía, conectividad y mantenimiento.
- [ ] Ninguna marca, modelo, compra o topología queda aprobada prematuramente.
- [ ] Cada capacidad tiene contrato, estados, resultado y fallback.
- [ ] Los periféricos desconocidos o no administrados no se adoptan automáticamente.
- [ ] La concurrencia y los comandos inciertos quedan controlados.
- [ ] Montaje, ambiente, higiene, accesibilidad y seguridad física están cubiertos.
- [ ] Energía, batería, pérdida y retorno están definidos sin inventar cifras.
- [ ] La conectividad no depende de una IP informal o red plana.
- [ ] Impresión, escaneo, medición, pago y señalización conservan correlación y evidencia.
- [ ] Configuración, firmware y drivers quedan sujetos a versionado y cambio controlado.
- [ ] Observabilidad respeta privacidad.
- [ ] Mantenimiento preventivo, correctivo, sustitución y retiro tienen ciclo completo.
- [ ] Los procesos críticos identifican single points of failure y alternativa.
- [ ] Los 69 procesos quedan cubiertos o justifican no dependencia física.
- [ ] Toda brecha tiene propietario, tarea y condición de cierre.
- [ ] `UX-STATION-007` permanece sin iniciar.
- [ ] No se ejecutaron cambios físicos o tecnológicos.

---

#### 44. Estado y continuidad

```text
UX-STATION-005 APROBADA
UX-STATION-006 APROBADA
UX-STATION-007 NO INICIADA
```

No se inicia `UX-STATION-007` hasta la aprobación expresa de esta tarea y una solicitud explícita de continuidad.


### ✅ UX-STATION-007 — Definir operación degradada, offline, contingencia y recuperación

**Estado:** APROBADA

**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal

**Marcador exacto que reemplaza:** `### [ ] UX-STATION-007 — Definir operación degradada, offline, contingencia y recuperación`

**Tarea anterior:** `UX-STATION-006 — Definir periféricos, montaje, alimentación, conectividad y mantenimiento` — APROBADA

**Siguiente tarea reservada:** `UX-STATION-010 — Definir gramática de interacción operativa de lectura mínima` — NO INICIADA

**Validación posterior reservada:** `UX-STATION-008 — Prototipar alternativas con trabajadores reales`; `UX-STATION-009 — Aprobar la matriz proceso → paso → estación → interacción → periférico`

**Artefactos producidos:**

- `UX-STATION-DEGRADED-OPERATION-CONTRACT-001`;
- `UX-STATION-CONTINGENCY-MODE-MATRIX-001`;
- `UX-STATION-OFFLINE-WORK-CONTRACT-001`;
- `UX-STATION-RECOVERY-RECONCILIATION-CONTRACT-001`;
- `UX-STATION-ROLE-RUNBOOK-CATALOG-001`;
- `UX-STATION-SUPPORT-ESCALATION-MODEL-001`;
- `UX-STATION-HUMAN-LOAD-GUARDRAILS-001`;
- `UX-STATION-CONTINGENCY-EXCEPTION-REGISTER-001`.

**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`

**Naturaleza:** contrato funcional y operativo de degradación, trabajo offline, contingencia, retorno, reincorporación y carga humana; no implementación de infraestructura, aplicación, soporte o continuidad productiva

**Cambios en código, migraciones, Supabase, aplicaciones, dispositivos, redes, procedimientos productivos o dotación:** no autorizados

---

#### 1. Propósito

Definir cómo debe continuar, limitarse, detenerse y recuperarse cada paso operativo cuando una estación, dispositivo, red, aplicación, periférico, proveedor o dependencia no está disponible o no puede demostrar un resultado confiable.

El diseño deberá permitir que personas excelentes en su labor, aunque no posean formación tecnológica especializada, puedan:

1. reconocer el estado real de la operación;
2. ejecutar únicamente las acciones simples y seguras que les corresponden;
3. conservar folios, evidencia, pendientes y custodia;
4. solicitar ayuda mediante un canal claro;
5. continuar con una alternativa aprobada cuando sea posible;
6. detenerse cuando continuar produciría fraude, pérdida, peligro o inconsistencia;
7. entregar el caso a soporte sin diagnosticar internamente sistemas complejos;
8. reincorporar el trabajo con guía y validación posterior.

```text
CONTINUIDAD OPERATIVA
≠
CONVERTIR A CADA TRABAJADOR EN TÉCNICO
```

```text
CONTROL SUFICIENTE
≠
SUPERVISIÓN HUMANA PERMANENTE
```

---

#### 2. Decisión sobre capacidad humana y dotación

Vento OS se diseñará bajo estas restricciones reales:

- no habrá un técnico dedicado por sede, estación, turno o periférico;
- no se exigirá contratar una persona distinta para vigilar cada control;
- una persona operativa no deberá interpretar logs, editar red, reinstalar drivers, manipular bases de datos ni decidir recuperaciones complejas;
- la mayoría de incidencias ordinarias deberá resolverse mediante autoservicio guiado, sustitución simple, reintento seguro o escalamiento;
- las tareas técnicas se concentrarán en un soporte central, responsable autorizado o proveedor cuando exista;
- los controles automáticos, alertas, bloqueos, trazabilidad y conciliación deberán reducir la necesidad de vigilancia manual;
- los responsables de sede o área no se convertirán en administradores técnicos por ocupar ese cargo;
- cuando un proceso requiera una actividad humana permanente, esa necesidad deberá derivarse del proceso empresarial real y no de una deficiencia del sistema.

Ningún diseño será aceptable si su operación normal requiere recordar reglas técnicas extensas, consultar múltiples documentos, llamar permanentemente a una persona experta o mantener vigilancia manual para evitar inconsistencias previsibles.

---

#### 3. Modelo mínimo de responsabilidades

| Nivel                       | Responsable habitual                                   | Puede hacer                                                                                                    | No deberá hacer                                                                                              |
| --------------------------- | ------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| `L0_OPERACION`              | trabajador del proceso                                 | reconocer estado, seguir checklist corto, proteger trabajo, registrar folio, usar sustituto aprobado, reportar | diagnosticar infraestructura, alterar configuración, restaurar datos o decidir excepciones críticas          |
| `L1_COORDINACION_LOCAL`     | encargado, supervisor o responsable de sede disponible | confirmar impacto, activar alternativa local autorizada, coordinar relevo y comunicación                       | administrar credenciales privilegiadas, ejecutar cambios técnicos o conciliar hechos complejos sin autoridad |
| `L2_SOPORTE_CENTRAL`        | responsable tecnológico o soporte designado            | diagnóstico técnico, recuperación estándar, coordinación con proveedor y verificación técnica                  | declarar por sí solo recuperado el proceso empresarial                                                       |
| `L3_ESPECIALISTA_PROVEEDOR` | proveedor o especialista convocado                     | intervención excepcional sobre equipo, red, servicio o plataforma                                              | modificar proceso, datos o autorización fuera del alcance aprobado                                           |
| `VALIDACION_FUNCIONAL`      | propietario o delegado del proceso                     | comprobar resultado empresarial y conciliación                                                                 | sustituir sin evidencia la validación técnica o contable aplicable                                           |

Una misma persona podrá asumir más de un nivel cuando esté autorizada y sea viable, pero el diseño no supondrá que cada nivel exige una contratación exclusiva.

---

#### 4. Principio de personal mínimo suficiente

Cada modo de contingencia deberá declarar:

```text
minimum_people_required
roles_or_capabilities_required
can_be_combined_by_one_person
separation_required
remote_support_allowed
provider_required
maximum_local_complexity
```

Reglas:

1. El número mínimo de personas se derivará del riesgo y la segregación necesaria, no del número de pantallas o dispositivos.
2. Un control de doble aprobación solo se exigirá cuando la regla empresarial o el riesgo lo justifique.
3. No se usará doble control para compensar interfaces confusas, ausencia de validaciones o trazabilidad deficiente.
4. Cuando una misma persona pueda operar y coordinar sin conflicto, el contrato podrá permitirlo.
5. Cuando la segregación sea obligatoria, podrá utilizarse aprobación remota si conserva identidad, contexto, evidencia y vigencia.
6. Todo requerimiento de presencia permanente tendrá justificación, duración, propietario y alternativa evaluada.

---

#### 5. Distinciones canónicas

| Concepto               | Definición                                                                                                         |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------ |
| operación normal       | todas las dependencias requeridas están disponibles y verificadas                                                  |
| degradación            | el proceso sigue activo con capacidades limitadas y controles compensatorios                                       |
| offline                | el cliente no puede alcanzar temporalmente la autoridad remota requerida, pero conserva un contrato local aprobado |
| contingencia           | procedimiento alternativo activado formalmente para producir el resultado mínimo empresarial                       |
| fallback               | capacidad sustituta concreta dentro de un modo normal o degradado                                                  |
| interrupción           | no puede producirse el resultado mínimo autorizado                                                                 |
| recuperación técnica   | restauración de componentes, conectividad o servicios                                                              |
| recuperación funcional | el proceso vuelve a producir resultados correctos                                                                  |
| reincorporación        | ingreso controlado de hechos, documentos o pendientes creados durante la falla                                     |
| conciliación           | comparación y resolución entre hechos físicos, manuales, locales, remotos y de proveedores                         |
| estado desconocido     | no existe evidencia suficiente para afirmar éxito o fracaso                                                        |
| procedimiento manual   | alternativa controlada; no equivale a improvisación ni eliminación de controles                                    |

---

#### 6. Estados de la estación

La estación deberá poder expresar al menos:

```text
NORMAL
DEGRADED_READ_ONLY
DEGRADED_LIMITED_WRITE
OFFLINE_CAPTURE
CONTINGENCY_MANUAL
WAITING_FOR_DEPENDENCY
RESULT_UNKNOWN
RECOVERY_IN_PROGRESS
RECONCILIATION_REQUIRED
BLOCKED_SAFETY
BLOCKED_AUTHORIZATION
BLOCKED_INTEGRITY
RETURNING_TO_NORMAL
NORMAL_VALIDATED
```

Cada estado declarará:

- condición de entrada;
- autoridad que puede activarlo;
- acciones permitidas y prohibidas;
- datos o recursos visibles;
- evidencia obligatoria;
- límites temporales y cuantitativos cuando correspondan;
- canal de ayuda;
- condición de salida;
- tratamiento de pendientes;
- validación técnica y funcional requerida.

---

#### 7. Selección del modo permitido

El modo no se inferirá únicamente de que la red parezca desconectada o de que una petición falle.

La resolución considerará:

- proceso y paso;
- criticidad;
- resultado mínimo empresarial;
- actor efectivo y autorización vigente;
- estación y capacidades confiables;
- estado de red, backend, proveedor y periférico;
- frescura de contexto y catálogos;
- riesgo de duplicación;
- posibilidad de conciliación;
- disponibilidad de formularios, folios o sustitutos;
- duración estimada y duración real;
- existencia de soporte remoto;
- estado de incidentes o contingencia declarada.

---

#### 8. Regla de seguridad y detención

La degradación no autoriza a omitir:

- identidad del actor cuando sea exigible;
- segregación crítica;
- límites de dispositivo;
- integridad de cantidades, pagos o inventario;
- trazabilidad mínima;
- privacidad;
- seguridad alimentaria, laboral o física;
- protección contra doble ejecución;
- custodia de efectivo, documentos, productos o evidencia.

Cuando estos controles no puedan conservarse, el paso deberá quedar bloqueado y ofrecer una instrucción concreta de escalamiento o una alternativa aprobada.

---

#### 9. Resultado empresarial mínimo

Cada proceso definirá:

```text
minimum_business_outcome
minimum_information_required
minimum_controls_required
maximum_safe_degradation
manual_or_offline_alternative
stop_condition
recovery_owner
business_validation_owner
```

Una estación técnicamente encendida no se considerará operativa si el proceso no puede producir su resultado mínimo con evidencia y control suficientes.

---

#### 10. Modalidades de degradación

| Modalidad                  | Uso permitido                                                 | Prohibición principal                               |
| -------------------------- | ------------------------------------------------------------- | --------------------------------------------------- |
| solo lectura               | consulta segura de información suficientemente fresca         | presentar información obsoleta como vigente         |
| escritura limitada         | acciones acotadas, reversibles o conciliables                 | ejecutar mutaciones críticas no reconciliables      |
| captura offline            | registrar intención y evidencia para sincronización posterior | fingir confirmación remota o éxito definitivo       |
| sustitución de dispositivo | continuar en endpoint aprobado alterno                        | heredar sesión, actor o contexto residual           |
| sustitución de periférico  | usar capacidad equivalente validada                           | adoptar equipo desconocido o incompatible           |
| procedimiento manual       | producir resultado mínimo con folio y custodia                | operar sin numeración, propietario o reconciliación |
| espera controlada          | conservar trabajo hasta recuperar dependencia                 | repetir ciegamente acciones de resultado incierto   |
| cierre temporal            | detener paso o proceso de forma explícita                     | mantener cola invisible o trabajo sin responsable   |

---

#### 11. Contrato de trabajo offline

Toda operación offline deberá conservar como mínimo:

```text
offline_operation_id
process_id
step_id
resource_reference
actor_id
actor_session_id
station_id
device_id
site_id
area_id
zone_id
captured_at_device
captured_at_monotonic_reference
context_version
authorization_basis
payload_hash
idempotency_key
sequence_or_folio
sync_status
conflict_status
expiry
```

No se utilizará una cola local genérica que pierda actor, contexto, orden, dependencia o motivo.

---

#### 12. Autorización offline

La operación offline solo se permitirá cuando exista una política aprobada que defina:

- acciones autorizables sin consulta inmediata;
- credencial, contexto o autorización local verificable;
- antigüedad máxima admisible;
- límites por cantidad, valor, proceso o duración;
- denegaciones que continúan vigentes;
- tratamiento de revocación conocida o posterior;
- información que puede almacenarse localmente;
- cifrado y protección del dispositivo;
- salida segura cuando el contexto expire.

Una sesión técnica persistida no equivaldrá a autorización offline ilimitada.

---

#### 13. Folios y formularios manuales

Todo procedimiento manual que produzca hechos empresariales utilizará, cuando corresponda:

- identificador o folio único;
- versión del formulario;
- fecha y hora observada;
- actor y responsable;
- sede, área y zona;
- recurso o transacción relacionada;
- cantidades, unidades y motivo;
- firmas o confirmaciones necesarias;
- anexos o evidencia permitidos;
- estado de reincorporación;
- referencia a corrección, cancelación o reemplazo.

El papel, archivo local o formulario alterno no será una fuente de verdad permanente por defecto.

---

#### 14. Instrucciones de operación para personal no técnico

Cada contingencia deberá producir una tarjeta operativa breve con esta forma:

```text
QUÉ PASÓ
QUÉ PUEDO SEGUIR HACIENDO
QUÉ NO DEBO HACER
PASOS 1 A N
QUÉ DEBO REGISTRAR
A QUIÉN DEBO AVISAR
CUÁNDO DEBO DETENERME
CÓMO SÉ QUE TERMINÉ
```

Restricciones:

- máximo una decisión principal por paso;
- lenguaje del trabajo real, no terminología de infraestructura;
- ayudas visuales cuando aporten claridad;
- identificación por estación, proceso y modalidad;
- versión y fecha visibles;
- disponibilidad sin depender exclusivamente del sistema afectado;
- no exponer secretos, redes, credenciales ni procedimientos privilegiados;
- instrucciones practicables con guantes, ruido, presión y movilidad cuando aplique.

---

#### 15. Diseño de autoservicio guiado

La estación podrá ofrecer diagnósticos simples como:

- verificar energía visible;
- confirmar cable o enlace accesible sin desmontaje;
- seleccionar periférico sustituto aprobado;
- reiniciar una aplicación mediante acción controlada;
- cambiar a captura manual aprobada;
- generar folio de incidente;
- adjuntar código de error no sensible;
- probar una función de diagnóstico segura;
- solicitar soporte remoto.

No ofrecerá al trabajador ordinario:

- terminal de sistema;
- edición de IP, DNS, firewall o routing;
- instalación de drivers o firmware;
- credenciales administrativas;
- restauración de base de datos;
- eliminación manual de colas o registros;
- reejecución forzada de pagos, movimientos o impresiones inciertas.

---

#### 16. Escalamiento operativo y técnico

Cada incidente deberá responder:

```text
what_failed
business_impact
safe_actions_taken
work_preserved
pending_count
unknown_results
local_contact
remote_contact
provider_contact
next_update_due
escalation_level
```

El escalamiento no exigirá que el trabajador determine la causa raíz. Bastará con describir síntomas, impacto y evidencia segura.

---

#### 17. Comunicación y coordinación

La comunicación deberá indicar:

- proceso y sede afectados;
- modalidad activa;
- acciones permitidas;
- acciones detenidas;
- responsable coordinador;
- canal de actualización;
- hora de próxima revisión;
- tratamiento de clientes, proveedores o áreas dependientes;
- instrucción de retorno.

No se dependerá exclusivamente de grupos informales, mensajes verbales o una persona que recuerde avisar a todos.

---

#### 18. Pérdida de conectividad

La estación distinguirá, cuando sea posible:

- sin conectividad local;
- red local disponible sin salida;
- DNS o resolución fallida;
- backend no alcanzable;
- autenticación no alcanzable;
- proveedor externo no alcanzable;
- latencia o pérdida intermitente;
- portal cautivo;
- reloj o certificado incompatible.

El trabajador recibirá una instrucción operativa, no un diagnóstico técnico exhaustivo.

---

#### 19. Pérdida de energía

El contrato cubrirá:

1. aviso o detección de energía inestable cuando exista;
2. protección del trabajo en curso;
3. transición a batería, respaldo o procedimiento manual;
4. apagado seguro cuando corresponda;
5. custodia de efectivo, producto, documentos y equipos;
6. reinicio controlado;
7. verificación de reloj, red, periféricos, colas y actor;
8. reconciliación de trabajos interrumpidos.

---

#### 20. Falla de dispositivo o aplicación

No se asumirá que reiniciar resuelve todo.

Antes de repetir una acción se comprobará:

- si el comando pudo llegar al servidor o periférico;
- si existe `idempotency_key`;
- si hay resultado remoto o físico;
- si quedó un borrador o pendiente local;
- si el actor sigue vigente;
- si el recurso cambió durante la falla;
- si existe sustituto aprobado.

---

#### 21. Falla de periférico

Para impresión, escaneo, medición, cámara, pago o señalización se definirá:

- capacidad mínima sustituta;
- prueba segura de salud;
- resultado desconocido;
- cambio de equipo;
- consumibles;
- custodia de trabajos pendientes;
- reintento idempotente;
- validación física y empresarial.

Una impresora que no produjo papel, un datáfono sin referencia conciliable o una báscula sin estabilidad no se marcarán automáticamente como operación fallida o exitosa.

---

#### 22. Proveedor externo no disponible

Cuando falle un proveedor se definirá:

- alternativa de proveedor o canal;
- operación diferida;
- procedimiento manual;
- límites y aprobación;
- comunicaciones externas;
- evidencia de solicitudes y respuestas;
- conciliación al recuperar;
- protección contra duplicación entre proveedor principal y alterno.

---

#### 23. Trabajo pendiente y resultado desconocido

Cada pendiente deberá estar en uno de estos estados:

```text
DRAFT
CAPTURED_LOCAL
QUEUED
SENT_UNCONFIRMED
ACCEPTED_REMOTE
COMPLETED
FAILED_SAFE_TO_RETRY
FAILED_REVIEW_REQUIRED
RESULT_UNKNOWN
CONFLICT
CANCELLED
RECONCILED
```

`RESULT_UNKNOWN` bloqueará el reintento automático cuando exista riesgo de doble cobro, doble movimiento, doble documento, doble impresión sensible o doble notificación con efecto empresarial.

---

#### 24. Orden, dependencia e idempotencia

La recuperación conservará:

- orden entre pasos dependientes;
- referencias a hechos previos;
- idempotencia;
- versión de contrato;
- actor original;
- autorizaciones adicionales;
- lotes y unidades;
- eventos o documentos resultantes;
- efectos externos.

No se sincronizarán ciegamente pendientes por orden de llegada si el proceso exige otra secuencia.

---

#### 25. Cambio de actor, relevo y turno

Los pendientes no pasarán silenciosamente al siguiente trabajador.

El relevo deberá mostrar:

- trabajo abierto;
- operaciones offline;
- resultados desconocidos;
- formularios manuales;
- recursos bajo custodia;
- incidentes activos;
- acciones permitidas al receptor;
- elementos que requieren cierre del actor original o aprobación adicional.

---

#### 26. Privacidad y almacenamiento local

El modo offline o degradado aplicará:

- minimización de datos;
- cifrado cuando corresponda;
- aislamiento por actor y estación;
- masking;
- expiración;
- limpieza después de sincronizar o cerrar;
- bloqueo por inactividad;
- prevención de backups o capturas no autorizadas;
- tratamiento seguro de pérdida o retiro del dispositivo.

---

#### 27. Recuperación técnica frente a recuperación funcional

```text
SERVICIO RESPONDE
≠
PROCESO RECUPERADO
```

El retorno requerirá:

1. salud técnica suficiente;
2. contratos y versiones compatibles;
3. contexto y autorización vigentes;
4. periféricos vinculados;
5. pendientes identificados;
6. sincronización controlada;
7. conflictos resueltos;
8. conciliación completada;
9. validación del resultado empresarial;
10. comunicación de retorno normal.

---

#### 28. Secuencia de retorno

La recuperación seguirá dependencias explícitas, por ejemplo:

```text
IDENTIDAD Y AUTORIZACIÓN
→ CONTEXTO ORGANIZACIONAL Y OPERATIVO
→ FUENTES DE VERDAD
→ INTEGRACIONES Y PROVEEDORES
→ ESTACIONES Y PERIFÉRICOS
→ COLAS Y PENDIENTES
→ REINCORPORACIÓN
→ CONCILIACIÓN
→ VALIDACIÓN FUNCIONAL
→ OPERACIÓN NORMAL
```

La secuencia concreta se definirá por proceso; este ejemplo no impone una topología universal.

---

#### 29. Reincorporación del trabajo manual u offline

La reincorporación deberá:

- inventariar folios y operaciones;
- verificar integridad y custodia;
- detectar duplicados;
- validar actor y autoridad aplicable;
- resolver referencias faltantes;
- aplicar en orden;
- conservar origen manual u offline;
- registrar correcciones;
- producir comprobante de incorporación;
- permitir conciliación independiente.

No se transcribirá información sin vincularla al folio y al hecho original.

---

#### 30. Conflictos

Se clasificarán al menos:

- mismo recurso modificado online y offline;
- cantidad o estado incompatibles;
- actor revocado después de capturar;
- catálogo o precio cambiado;
- lote, ubicación o unidad inexistente;
- pago ya procesado;
- documento ya emitido;
- acción cancelada durante la falla;
- dependencia posterior ejecutada primero;
- evidencia manual incompleta.

Cada clase tendrá resolución automática segura, revisión humana o bloqueo. No se usará `last write wins` como regla universal.

---

#### 31. Observabilidad sin vigilancia permanente

El sistema deberá detectar y agrupar:

- estaciones offline;
- colas envejecidas;
- pendientes sin propietario;
- resultados desconocidos;
- errores repetidos;
- sincronización detenida;
- almacenamiento local cercano al límite;
- batería o energía crítica cuando exista telemetría;
- periféricos indisponibles;
- versiones incompatibles;
- incidentes sin actualización.

Las alertas se dirigirán al responsable adecuado y deberán evitar ruido masivo. La observabilidad reemplazará vigilancia humana continua, no la multiplicará.

---

#### 32. Guías, base de conocimiento y capacitación

La guía operativa completa se materializará posteriormente mediante responsabilidades exactas:

| Necesidad                                                                | Tarea propietaria |
| ------------------------------------------------------------------------ | ----------------- |
| reglas de degradación, offline, contingencia y retorno por estación      | `UX-STATION-007`  |
| prueba de comprensión y ejecución con trabajadores reales                | `UX-STATION-008`  |
| aprobación de matriz final por proceso y paso                            | `UX-STATION-009`  |
| runbooks y checklists simples por rol, proceso, sede y modalidad         | `CONT-UX-003`     |
| captura durante falla y reincorporación                                  | `CONT-UX-004`     |
| comunicaciones y escalamiento                                            | `CONT-UX-006`     |
| base de conocimiento, capacitación, adopción y comunicación tecnológica  | `TI-DOM-013`      |
| diagnóstico guiado sin saturación técnica                                | `TI-UX-006`       |
| planificación obligatoria de capacitación y soporte antes de implementar | `E5-GATE-006`     |

Por tanto, esta tarea no deja la guía como expectativa narrativa: define sus contenidos mínimos y asigna su materialización, validación y puerta de implementación.

---

#### 33. Capacitación mínima

La capacitación no será un curso técnico general.

Se organizará por:

- rol real;
- estación;
- proceso y paso;
- modalidad normal y degradada;
- acción crítica;
- incidente más probable;
- sustituto disponible;
- criterio de detención;
- escalamiento.

La evidencia podrá consistir en demostración práctica breve, simulación, checklist ejecutado y corrección de errores. No se exigirá memorizar manuales extensos.

---

#### 34. Walkthroughs y ejercicios

Los ejercicios incluirán, según riesgo:

- pérdida de red;
- pérdida de energía;
- falla de aplicación;
- falla de impresora o escáner;
- sustitución de dispositivo;
- captura manual;
- resultado desconocido;
- cambio de actor con pendientes;
- sincronización y conflicto;
- retorno al servicio normal.

El ejercicio evaluará tanto el sistema como la carga cognitiva y la necesidad real de apoyo humano.

---

#### 35. Presupuesto de complejidad humana

Cada procedimiento tendrá límites verificables:

```text
maximum_local_steps
maximum_decisions_without_help
maximum_documents_to_consult
maximum_manual_reentry
maximum_open_pendings_per_operator
expected_training_level
remote_assistance_available
```

No se fijan cifras universales en esta tarea. `UX-STATION-008` deberá observar y medir si la ejecución es viable para trabajadores reales.

Una alternativa que solo funciona con conocimiento técnico no documentado, memoria excepcional o asistencia constante se considerará fallida.

---

#### 36. Automatización y control

Para reducir carga humana se priorizarán:

- detección automática de estado;
- bloqueo de acciones incompatibles;
- folios e identificadores generados;
- conservación automática de contexto;
- reintentos idempotentes;
- agrupación de alertas;
- diagnóstico guiado;
- evidencia capturada por el sistema;
- conciliación asistida;
- checklist contextual;
- comunicación dirigida;
- expiración y limpieza automáticas.

La automatización no ocultará decisiones sensibles ni ejecutará reintentos peligrosos sin evidencia.

---

#### 37. Excepciones y soporte extraordinario

Toda excepción que requiera soporte adicional conservará:

```text
exception_id
process_id
station_id
failure_mode
business_impact
additional_people_required
specialist_required
reason
temporary_control
owner
resolution_task
expiry
validation
status
```

Si una contingencia requiere temporalmente más personas, deberá declararse como condición excepcional, no convertirse silenciosamente en la dotación normal.

---

#### 38. Matriz por proceso y paso

Cada uno de los 69 procesos deberá declarar por paso:

```text
process_id
step_id
minimum_business_outcome
normal_mode
degraded_modes[]
offline_allowed
manual_allowed
stop_conditions[]
minimum_people_required
segregation_required
local_actions[]
forbidden_local_actions[]
support_level
escalation_path
pending_contract
recovery_order
reconciliation_owner
business_validation_owner
runbook_owner
training_owner
prototype_questions[]
```

No bastará indicar que “el proceso funciona offline”.

---

#### 39. Relación con continuidad empresarial

Esta tarea diseña el comportamiento objetivo de las estaciones. El Bloque AC deberá convertirlo posteriormente en gobierno permanente de continuidad, operación mínima, estrategias manuales y offline, evidencia, reincorporación, runbooks, ejercicios y mejora.

La continuidad no será responsabilidad exclusiva de tecnología: los dominios propietarios conservan sus procesos, alternativas y validación empresarial; tecnología recupera componentes; continuidad coordina el conjunto.

---

#### 40. Relación con soporte tecnológico

El Bloque Z deberá desarrollar posteriormente:

- modelo de atención y SLA;
- incidentes y escalamiento;
- monitoreo;
- recuperación técnica;
- base de conocimiento;
- capacitación contextual;
- diagnóstico guiado;
- coordinación con proveedores.

Esto permite centralizar conocimiento técnico sin exigir personal especializado en cada sede.

---

#### 41. Escenarios mínimos de validación

1. trabajador sin conocimiento técnico identifica modo degradado;
2. guía indica qué continuar y qué detener;
3. red intermitente no duplica operaciones;
4. backend no disponible activa captura permitida;
5. autorización local expira;
6. actor cambia con pendientes;
7. dispositivo se reinicia con cola local;
8. almacenamiento local está lleno;
9. reloj del dispositivo es incorrecto;
10. energía se pierde durante una captura;
11. impresora produce resultado incierto;
12. datáfono procesa pero la aplicación no recibe confirmación;
13. báscula pierde calibración;
14. dispositivo sustituto conserva limpieza y contexto correcto;
15. formulario manual recibe folio;
16. folio duplicado se detecta;
17. operación online conflictúa con operación offline;
18. trabajador revocado había capturado una intención;
19. cola envejece y escala automáticamente;
20. soporte remoto resuelve sin compartir credenciales;
21. responsable local activa alternativa sin privilegio técnico;
22. proveedor externo no responde;
23. retorno técnico ocurre antes de conciliación;
24. recuperación funcional detecta datos faltantes;
25. reincorporación preserva origen y actor;
26. guía es accesible con guantes, ruido o presión;
27. alerta agrupada evita vigilancia permanente;
28. procedimiento excede complejidad viable y se rechaza;
29. contingencia exige segregación real;
30. modo normal solo se declara después de validación empresarial.

---

#### 42. Brechas y clasificación

| Clase        | Condición                                                                                            | Tratamiento                          |
| ------------ | ---------------------------------------------------------------------------------------------------- | ------------------------------------ |
| `OPS-GAP-P0` | riesgo de seguridad, fraude, pago, inventario, alimento, integridad o hecho irreversible sin control | bloquea modalidad                    |
| `OPS-GAP-P1` | proceso crítico sin resultado mínimo, fallback, guía o escalamiento                                  | bloquea prototipo o piloto aplicable |
| `OPS-GAP-P2` | procedimiento viable con compensación temporal y vencimiento                                         | carryover controlado                 |
| `OPS-GAP-P3` | mejora no crítica de claridad o eficiencia                                                           | planificación ordinaria              |

Toda brecha tendrá tarea exacta, responsable, evidencia, vencimiento y puerta de cierre.

---

#### Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

**Rango incorporado:** `TREQ-PROC-781` a `TREQ-PROC-820`

Los requisitos protegen estados degradados, continuidad con personal mínimo, límites de actuación local, escalamiento, trabajo offline, folios, autorización, pendientes, resultados desconocidos, idempotencia, fallas de red, energía, dispositivos y periféricos, relevo, privacidad, recuperación, reincorporación, conflictos, observabilidad, guías simples, capacitación, ejercicios y cobertura de los 69 procesos.

---

#### 43. Criterios de aceptación

- [ ] Se distingue operación normal, degradada, offline, contingencia, interrupción, recuperación y reincorporación.
- [ ] Ninguna modalidad depende de técnicos permanentes en cada sede.
- [ ] El modelo define personal mínimo y permite combinar responsabilidades cuando no existe conflicto.
- [ ] Los trabajadores ordinarios reciben acciones simples y límites explícitos.
- [ ] Los diagnósticos y cambios técnicos permanecen centralizados o escalados.
- [ ] Cada estado declara entrada, acciones, evidencia, salida y pendientes.
- [ ] La autorización offline tiene límites y no equivale a sesión ilimitada.
- [ ] Los procedimientos manuales conservan folio, custodia y conciliación.
- [ ] Los resultados desconocidos no se reintentan ciegamente.
- [ ] Los pendientes conservan actor, contexto, orden e idempotencia.
- [ ] Red, energía, dispositivo, periférico y proveedor tienen tratamiento diferenciado.
- [ ] El cambio de actor no hereda trabajo silenciosamente.
- [ ] Recuperación técnica y funcional permanecen separadas.
- [ ] La reincorporación y conciliación están definidas.
- [ ] Observabilidad sustituye vigilancia permanente y evita ruido.
- [ ] Las guías simples quedan asignadas a tareas exactas.
- [ ] Capacitación y soporte serán obligatorios antes de implementación.
- [ ] Los ejercicios medirán carga cognitiva y necesidad real de personal.
- [ ] Los 69 procesos quedan cubiertos por paso.
- [ ] Toda excepción de personal adicional es temporal, justificada y trazable.
- [ ] `UX-STATION-010` permanece sin iniciar.
- [ ] No se activó ningún procedimiento productivo ni se modificó dotación.

---

#### 44. Estado y continuidad

```text
UX-STATION-006 APROBADA
UX-STATION-007 APROBADA
UX-STATION-010 NO INICIADA
```

`UX-STATION-008` y `UX-STATION-009` permanecen reservadas para el prototipo y la aprobación posteriores al diseño de `UX-STATION-010` a `UX-STATION-012`.

No se inicia `UX-STATION-010` hasta la aprobación expresa de esta tarea y una solicitud explícita de continuidad.


### ✅ UX-STATION-008 — Prototipar alternativas con trabajadores reales

**Estado:** APROBADA

**Resultado:** `PASS_WITH_CARRYOVER`

**Método de cierre:** `EVIDENCE_SUBSTITUTION_APPROVED`

**Aclaración obligatoria:** no se afirma que ya se hayan realizado sesiones formales con trabajadores. La tarea se cierra mediante evidencia interna, investigación avanzada, patrones industriales, revisión heurística, walkthroughs adversariales y prototipos verificables. La validación humana final se traslada a pilotos posteriores y deja de bloquear el avance documental y técnico.

**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal

**Marcador exacto que reemplaza:** `### [ ] UX-STATION-008 — Prototipar alternativas con trabajadores reales`

**Tarea anterior:** `UX-STATION-012 — Definir composición dinámica de pasos mediante componentes operativos aprobados` — APROBADA

**Siguiente tarea reservada:** `UX-STATION-009 — Aprobar la matriz proceso → paso → estación → interacción → periférico` — NO INICIADA

**Artefactos producidos:**

- `UX-STATION-EVIDENCE-SUBSTITUTION-DECISION-001`;
- `UX-STATION-INDUSTRY-PATTERN-BASELINE-001`;
- `UX-STATION-FIVE-ARCHETYPE-CATALOG-001`;
- `UX-STATION-ASSUMPTION-AND-RESIDUAL-RISK-REGISTER-001`;
- `UX-STATION-REFERENCE-SCENARIO-CATALOG-001`;
- `UX-STATION-CONDITIONAL-IMPLEMENTATION-GATE-001`;
- `UX-STATION-DEFERRED-HUMAN-VALIDATION-MAP-001`;
- `UX-STATION-CODE-ENABLEMENT-BOUNDARY-001`.

**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`, mediante arquetipos, equivalencia de pasos, excepciones críticas y validación posterior explícita.

**Naturaleza:** decisión documental de proporcionalidad, prototipado basado en evidencia y habilitación condicionada de continuidad; no piloto productivo ni certificación final de uso.

**Cambios en producción, datos reales, permisos, migraciones, RLS, RPC, Supabase, compras o hardware definitivo:** no autorizados por esta tarea.

---

#### 1. Propósito

Cerrar el bloqueo creado por exigir una campaña extensa de pruebas de campo antes de poder continuar el diseño y la implementación, sin degradar la seguridad operativa ni fingir evidencia inexistente.

Vento Group ya dispone de:

- un catálogo canónico de 69 procesos;
- actores, estados, transiciones, entradas, salidas y eventos definidos;
- inventario físico y operativo parcial de sus sedes;
- reglas aprobadas de identidad, sesión, bandeja, siguiente acción, componentes, periféricos, offline, recuperación y accesibilidad;
- conocimiento directo del jefe de operaciones sobre restaurante, pizzería, panadería, centro de producción y bodega;
- patrones ampliamente estabilizados en POS, KDS, WMS, MES y aplicaciones de personal de primera línea.

Con esta base es razonable construir una línea de implementación de alta confianza y reservar la validación humana final para el piloto, cuando exista software real que probar.

```text
NO HACER PRUEBAS DE CAMPO AHORA
≠
IGNORAR A LOS TRABAJADORES
```

```text
APROBAR UNA LÍNEA BASE DE IMPLEMENTACIÓN
≠
CERTIFICAR PRODUCCIÓN
```

```text
USAR PATRONES PROBADOS
+
EVIDENCIA INTERNA
+
PRUEBAS TÉCNICAS
+
PILOTO POSTERIOR
=
AVANCE PROPORCIONAL Y CONTROLADO
```

---

#### 2. Decisión canónica de proporcionalidad

Se aprueba sustituir la ejecución inmediata de sesiones formales con trabajadores por un método escalonado:

1. **ahora:** evidencia interna, investigación avanzada, comparación industrial, revisión heurística, contratos verificables, datos sintéticos y prototipos navegables;
2. **durante diseño e implementación:** pruebas automatizadas, Storybook o equivalente, mocks, walkthroughs adversariales y simulación de fallas;
3. **antes de producción:** pilotos controlados con trabajadores reales mediante `UX-QA-020` y `UX-QA-021` a `UX-QA-030`;
4. **para cierre productivo:** resolución de hallazgos críticos, evidencia del BLOQUE U y puerta `E5-GATE-008`.

Por tanto, la ausencia de una campaña formal de campo en esta etapa:

- no bloquea `UX-STATION-009`;
- no bloquea `UX-ADMIN-*`;
- no bloquea `PROC-SCREEN-*`;
- no bloquea componentes, contratos, mocks ni paquetes de implementación posteriores;
- sí conserva una obligación de validación real antes del despliegue productivo.

---

#### 3. Ajuste de la regla de validación real

La regla general de este subbloque indica que una alternativa definitiva debe validarse con trabajadores reales. Esta tarea la conserva, pero aclara su momento y alcance:

| Nivel                                                                | Puede aprobarse sin prueba humana inmediata | Requiere trabajadores reales                       |
| -------------------------------------------------------------------- | ------------------------------------------- | -------------------------------------------------- |
| patrón transversal                                                   | sí                                          | solo si el piloto detecta divergencia              |
| componente reusable                                                  | sí                                          | validación integrada en el piloto de la aplicación |
| matriz de implementación                                             | sí, como condicionada                       | no para iniciar código                             |
| montaje, alcance, guantes, calor, humedad, ruido y Wi-Fi             | solo como supuesto                          | sí antes del despliegue físico                     |
| pago, identidad, medición, ajuste, conciliación y resultado incierto | prototipo y contrato sí                     | sí antes de producción                             |
| certificación final de una aplicación                                | no                                          | sí mediante BLOQUE U y piloto                      |

`UX-STATION-009` aprobará una **línea base de implementación condicionada**, no una certificación de producción.

---

#### 4. Fundamento de evidencia

La decisión se apoya en cuatro capas acumulativas.

##### 4.1. Evidencia interna de Vento

La línea base ya documenta, entre otros hechos:

- tablets compartidas en servicio;
- estaciones de caja y datáfonos móviles;
- comandas distribuidas a cocina, bar y barra;
- comunicación verbal y por impresora;
- kiosco o referencia técnica de bodega;
- áreas de producción con frío, mesones, canastas y trabajo manual;
- ausencia de una sesión individual persistida en varios dispositivos compartidos.

Esta evidencia permite diseñar el TO-BE sin empezar desde cero.

##### 4.2. Investigación avanzada externa

Se revisaron patrones y guías de:

- ISO 9241-11 para usabilidad en contexto;
- Nielsen Norman Group para estado visible, prevención de error, reconocimiento y lenguaje de acciones;
- WCAG 2.2 para controles táctiles, etiquetas, contraste, ayuda y revisión previa;
- Microsoft Shared Device Mode para personal de primera línea;
- OWASP para timeout, cierre de sesión, limpieza y logging;
- Android offline-first y trabajo persistente;
- Material Design para listas, jerarquía de acciones, confirmaciones y feedback;
- Toast y otros KDS para cocina y expedición;
- Square para recepción, escaneo y ajuste de inventario;
- SAP y Oracle para operación móvil de bodega;
- GS1 para identificación y lectura humana de códigos;
- NIST para criterios observables de eficacia, error y completitud.

##### 4.3. Conocimiento operativo estándar

Restaurante, pizzería, panadería, producción alimentaria y bodega comparten patrones estables:

- trabajo entrante ordenado;
- preparación o ejecución por etapas;
- confirmación de cantidad, estado o destino;
- transferencia entre personas o áreas;
- excepciones por faltantes, errores o fallas de equipo;
- necesidad de continuidad aun con conectividad o periféricos degradados.

##### 4.4. Evidencia técnica posterior

Los patrones deberán comprobarse mediante:

- tipos y contratos;
- pruebas unitarias;
- pruebas de componentes;
- pruebas de integración;
- pruebas E2E;
- pruebas offline e idempotencia;
- pruebas de accesibilidad;
- pilotos de aplicación.

---

#### 5. Principio de personal existente y carga humana mínima

La arquitectura deberá funcionar con la dotación operativa actual.

No se presupone:

- contratar investigadores UX;
- crear un supervisor tecnológico por estación;
- mantener soporte técnico presencial;
- incorporar digitadores para conciliar operaciones;
- pedir al trabajador que diagnostique red, software o periféricos;
- duplicar el trabajo en papel y sistema de forma permanente.

El sistema deberá:

1. indicar qué toca hacer;
2. impedir acciones no elegibles;
3. pedir solo datos no derivables;
4. explicar el error en lenguaje cotidiano;
5. conservar el trabajo cuando la falla sea recuperable;
6. bloquear de forma segura cuando continuar sea peligroso;
7. escalar solo las excepciones reales;
8. dejar evidencia suficiente para soporte sin convertir al trabajador en técnico.

```text
EXCELENTE EN SU LABOR
+
POCA FORMACIÓN TECNOLÓGICA
=
USUARIO OBJETIVO NORMAL DEL SISTEMA
```

La interfaz no se diseñará para expertos en software.

---

#### 6. Cinco arquetipos canónicos de estación

Se adopta un catálogo reducido para evitar una interfaz distinta por cada área.

| Arquetipo          | Áreas principales                                | Trabajo dominante                                            | Interacción base                                                   |
| ------------------ | ------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------------ |
| `SERVICE_CHECKOUT` | servicio, mostrador, caja, entrega               | pedido, cobro, entrega y atención de pendientes              | tacto rápido, selección contextual y confirmación explícita        |
| `KITCHEN_PREP`     | cocina, barra, horno, pizza, expedición          | cola de preparación y cambio de estado                       | pantalla visible, tarjetas de pedido y acción principal grande     |
| `PRODUCTION_BATCH` | panadería, repostería, cocina caliente, empaque  | lote, receta, cantidad, pesaje, avance y cierre              | pasos guiados, cantidades estructuradas y periféricos desacoplados |
| `WAREHOUSE_FLOW`   | recepción, bodega, ubicación, picking y despacho | identificar, contar, mover, recibir y entregar               | escaneo preferente, teclado numérico y revisión antes de confirmar |
| `SUPERVISION_EXPO` | supervisor, gerente, expedición y excepciones    | priorizar, aprobar, reasignar, conciliar y resolver bloqueos | tablero consolidado y detalle progresivo                           |

Una sede puede usar varios arquetipos. Un trabajador puede usar más de uno. La estructura se reutiliza; cambian permisos, datos, reglas y próximos pasos.

---

#### 7. Reglas transversales de interfaz

Toda estación deberá conservar:

1. trabajador activo visible;
2. lugar, área o función vigente;
3. estado de conectividad;
4. trabajo actual;
5. siguiente acción;
6. una única acción principal por estado;
7. objeto y consecuencia antes de confirmar;
8. feedback que diferencie captura local de confirmación empresarial;
9. recuperación clara;
10. acceso a ayuda contextual sin manual técnico.

No se aceptarán interfaces que dependan de:

- memorizar códigos;
- leer párrafos largos durante la operación;
- distinguir estados únicamente por color;
- abrir múltiples menús para una acción frecuente;
- entender términos de arquitectura;
- saber si un timeout significa éxito o fracaso;
- preguntar constantemente al supervisor qué sigue.

---

#### 8. Identificación y sesión compartida

La línea base recomendada es:

- selección o reconocimiento del trabajador;
- PIN corto o QR personal según el dispositivo;
- nombre y función visibles durante la sesión;
- opción `Cambiar trabajador` siempre disponible;
- bloqueo por inactividad según riesgo;
- invalidación server-side;
- limpieza de datos y credenciales al cerrar;
- preservación de tareas empresariales mediante relevo, no mediante sesión compartida.

Biometría no es requisito para la primera versión.

---

#### 9. Bandeja de trabajo y siguiente acción

La bandeja mostrará trabajo, no ruido.

Cada elemento deberá declarar:

- objeto principal;
- estado;
- prioridad y razón;
- tiempo o compromiso relevante;
- bloqueo;
- siguiente acción;
- responsable actual;
- origen del trabajo.

Eventos, alertas, mensajes y notificaciones se distinguirán de una tarea ejecutable.

La prioridad será calculada. El supervisor podrá intervenir por excepción autorizada, pero no tendrá que repartir manualmente cada acción ordinaria.

---

#### 10. Cantidades, unidades y presentaciones

Una cantidad no será un campo numérico aislado.

El contrato mínimo incluirá:

```text
VALOR
+ UNIDAD
+ PRESENTACIÓN
+ TARA, SI APLICA
+ ORIGEN DE CAPTURA
+ REGLA DE CONVERSIÓN
```

Casos cubiertos:

- paquete y unidad suelta;
- gramos y kilos;
- litros y mililitros;
- caja, bandeja y porción;
- peso bruto, tara y peso neto;
- recibido frente a esperado;
- producción real frente a planificada.

Capturar y confirmar serán momentos distintos para operaciones sensibles.

---

#### 11. Identificación de producto, ubicación y contenedor

Regla base:

| Contexto                             | Modalidad principal                             | Respaldo                                          |
| ------------------------------------ | ----------------------------------------------- | ------------------------------------------------- |
| bodega, recepción, picking, despacho | escaneo                                         | cámara o captura manual validada                  |
| producción y empaque                 | escaneo o selección contextual según frecuencia | cámara o búsqueda                                 |
| cocina, barra y servicio             | tacto y selección contextual                    | búsqueda breve                                    |
| contingencia                         | referencia legible y entrada manual autorizada  | escalamiento cuando la validación sea obligatoria |

La captura manual no permitirá inventar códigos. Las etiquetas propias deberán mostrar referencia legible.

---

#### 12. Acciones críticas y correcciones

Requieren revisión explícita:

- cobro;
- anulación;
- recepción final;
- despacho;
- cierre de lote;
- ajuste de inventario;
- cambio de responsable;
- generación definitiva de etiqueta;
- corrección con efecto contable, físico o de trazabilidad.

La pantalla deberá mostrar qué objeto cambia, cuánto, desde dónde, hacia dónde y con qué consecuencia.

`Guardar borrador`, `Registrar avance` y `Finalizar` no serán equivalentes.

---

#### 13. Offline, incertidumbre y recuperación

Se adoptan al menos cuatro estados comprensibles:

| Estado técnico canónico | Texto operativo sugerido                  |
| ----------------------- | ----------------------------------------- |
| `LOCAL_SAVED`           | Guardado en este dispositivo              |
| `SENDING`               | Enviando                                  |
| `CONFIRMED`             | Confirmado                                |
| `RESULT_UNKNOWN`        | Todavía no podemos confirmar si se guardó |

Ante `RESULT_UNKNOWN`:

- no se repetirá la acción a ciegas;
- se consultará estado por referencia;
- se esperará sincronización;
- se escalará solo si no se resuelve.

Cada acción declarará si:

- exige conexión;
- admite lectura offline;
- admite captura pendiente;
- requiere contingencia manual;
- debe bloquearse.

---

#### 14. Periféricos y hardware no bloqueantes

El software se diseñará contra capacidades, no contra marcas concretas.

Se usarán adaptadores para:

- escáner;
- cámara;
- impresora;
- báscula;
- datáfono;
- señalización o alarma.

El desarrollo podrá usar mocks hasta confirmar el equipo físico.

La falla de un periférico deberá producir una de estas respuestas:

1. respaldo digital;
2. método alternativo autorizado;
3. equipo alterno aprobado;
4. bloqueo seguro;
5. escalamiento.

No se permitirá estimar una medición obligatoria ni fingir una impresión exitosa.

---

#### 15. Cobertura de los 69 procesos sin explosión combinatoria

No se probarán 69 procesos por cada dispositivo, sede, rol y falla posible.

Se construirá la matriz:

```text
PROCESO
→ PASO HUMANO
→ ARQUETIPO DE ESTACIÓN
→ PATRÓN DE INTERACCIÓN
→ RIESGO
→ EVIDENCIA REUTILIZABLE
→ EXCEPCIÓN QUE REQUIERE PRUEBA DIRECTA
```

La evidencia podrá heredarse cuando coincidan:

- contrato;
- objeto;
- riesgo;
- modalidad;
- entorno;
- consecuencia;
- autoridad;
- recuperación.

No heredarán evidencia genérica:

- pagos;
- identidad y autorización;
- mediciones obligatorias;
- ajustes de inventario;
- conciliaciones;
- resultados no confirmados;
- pasos únicos o irreversibles de criticidad alta.

---

#### 16. Supuestos aceptados para avanzar

Se aceptan como línea base de alta confianza:

- dispositivos compartidos con identificación individual;
- cinco arquetipos reutilizables;
- una acción principal por estado;
- lenguaje directo y no técnico;
- captura y revisión separadas;
- escaneo preferente en flujos logísticos;
- táctil contextual en servicio y cocina;
- offline con cola durable e idempotencia;
- relevo explícito entre personas;
- confirmación reforzada para efectos críticos;
- componentes desacoplados de hardware;
- soporte por excepción y no supervisión permanente.

Estos supuestos pueden codificarse.

---

#### 17. Aspectos que no se pueden conocer solo por investigación

Quedan como riesgo residual físico:

- ubicación exacta de cada pantalla;
- alcance cómodo desde el puesto;
- visibilidad con luz, vapor o harina;
- uso real con guantes o manos húmedas;
- calidad de Wi-Fi en cada punto;
- distancia de lectura del escáner;
- ruido suficiente para señales sonoras;
- disponibilidad de energía y carga;
- ubicación de impresoras y básculas;
- concurrencia real durante picos.

Estos aspectos no bloquean el código desacoplado. Se verificarán en readiness, montaje y piloto.

---

#### 18. Validación técnica antes de pantallas definitivas

Cada patrón candidato deberá contar con:

- contrato tipado;
- estados permitidos;
- datos sintéticos;
- componente aislado;
- revisión heurística;
- prueba de accesibilidad;
- prueba de error;
- prueba offline cuando aplique;
- prueba de idempotencia cuando produzca efectos;
- walkthrough de recuperación;
- evidencia de que no requiere supervisión ordinaria.

Una pantalla bonita sin estas pruebas no será candidata.

---

#### 19. Validación humana diferida y mínima

La validación real no desaparece: cambia de momento.

Se ejecutará mediante:

- `UX-QA-020 — Cada aplicación supera piloto con usuarios reales`;
- `UX-QA-021` a `UX-QA-030` por aplicación;
- escenarios críticos definidos en los requisitos `TREQ-*`;
- personal existente durante ventanas controladas;
- observación integrada al piloto, no una campaña separada de investigación.

No será necesario:

- probar todos los procesos con todas las personas;
- contratar participantes;
- detener varios días la operación;
- crear un equipo permanente de observación;
- repetir patrones ya equivalentes.

La prueba mínima posterior se concentrará en:

- comprensión de la siguiente acción;
- error crítico;
- ergonomía física;
- condiciones ambientales;
- fallas y recuperación;
- tiempo operativo razonable;
- ausencia de supervisión constante.

---

#### 20. Límite de autorización de código

Esta tarea no ordena modificar repositorios todavía. Sí elimina el bloqueo conceptual que impedía llegar a las tareas de diseño e implementación.

Después de aprobar `UX-STATION-009`, la secuencia podrá continuar con:

```text
UX-ADMIN-001 a UX-ADMIN-005
→ PROC-SCREEN-001 a PROC-SCREEN-028
→ PROC-COVER-001 a PROC-COVER-010
→ NFR-REQ-012
→ BLOQUES DE ARQUITECTURA, DATOS Y PAQUETES DE IMPLEMENTACIÓN
```

Desde esas tareas podrán construirse:

- shell de estación;
- sesión compartida;
- bandeja de trabajo;
- componentes de cantidad;
- escaneo y captura manual;
- confirmaciones críticas;
- cola offline;
- telemetría;
- mocks;
- prototipos navegables;
- pruebas automatizadas.

---

#### 21. Hallazgos y cambios obligatorios

Todo hallazgo posterior deberá:

- tener identificador;
- declarar severidad y riesgo;
- indicar patrón o proceso afectado;
- vincular tarea responsable;
- definir cambio y evidencia de cierre;
- impedir producción cuando sea crítico;
- no reabrir toda la arquitectura si el cambio es local.

Los resultados de piloto se incorporarán a la tarea exacta propietaria, no a una lista narrativa sin dueño.

---

#### 22. Estados de decisión

| Estado                           | Significado                                                         |
| -------------------------------- | ------------------------------------------------------------------- |
| `ASSUMED_HIGH_CONFIDENCE`        | patrón ampliamente validado y compatible con evidencia interna      |
| `IMPLEMENTATION_CANDIDATE`       | listo para `UX-STATION-009` y diseño de pantalla                    |
| `PHYSICAL_CONFIRMATION_REQUIRED` | requiere comprobación de puesto o hardware antes de despliegue      |
| `DIRECT_PILOT_REQUIRED`          | paso crítico que debe probarse con trabajadores antes de producción |
| `REJECTED`                       | alternativa incompatible, insegura o innecesariamente compleja      |
| `CERTIFIED_FOR_PRODUCTION`       | solo puede asignarse después del piloto y BLOQUE U                  |

`UX-STATION-008` no asignará `CERTIFIED_FOR_PRODUCTION`.

---

#### 23. Puerta de salida hacia UX-STATION-009

La tarea queda en `PASS_WITH_CARRYOVER` cuando:

- existe la jerarquía de evidencia;
- se adoptan los cinco arquetipos;
- se delimitan patrones de alta confianza;
- se identifican riesgos físicos residuales;
- se separa aprobación de diseño de certificación productiva;
- se asigna la validación real a `UX-QA-020` y `UX-QA-021` a `UX-QA-030`;
- se confirma que no se requiere contratación ni supervisión permanente;
- se generan los requisitos de prueba;
- `UX-STATION-009` queda habilitada.

No se exige ejecutar sesiones de campo antes de continuar.

---

#### Requisitos de prueba derivados

**Rango incorporado:** `TREQ-PROC-941` a `TREQ-PROC-980`

**Cantidad:** 40 requisitos

**Registro canónico regenerado:** `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`

---

#### 24. Criterios de aceptación

- [ ] Se aprobó explícitamente el cierre proporcional sin fingir sesiones realizadas.
- [ ] La validación humana final se conserva antes de producción.
- [ ] El trabajo de campo deja de bloquear diseño, contratos y código posterior.
- [ ] Se definieron cinco arquetipos reutilizables.
- [ ] Se evitó una interfaz distinta por sede o área.
- [ ] La operación ordinaria no requiere supervisión ni soporte técnico permanente.
- [ ] Se adoptó lenguaje cotidiano para personal con baja formación tecnológica.
- [ ] Se definieron identidad individual, bandeja, cantidades, escaneo, confirmación, offline, relevo y periféricos.
- [ ] Los 69 procesos pueden cubrirse por equivalencia controlada.
- [ ] Los pasos críticos conservan prueba directa posterior.
- [ ] Los riesgos físicos residuales tienen dueño y puerta de cierre.
- [ ] No se autorizó producción ni hardware definitivo.
- [ ] Se generaron `TREQ-PROC-941` a `TREQ-PROC-980` sin duplicados ni relaciones inválidas.
- [ ] `UX-STATION-009` permanece como siguiente tarea exacta.

---

#### 25. Resultado y continuidad

```text
UX-STATION-012 APROBADA
UX-STATION-008 APROBADA — PASS_WITH_CARRYOVER
UX-STATION-009 NO INICIADA
```

La continuidad exacta es:

```text
UX-STATION-009 — Aprobar la matriz proceso → paso → estación → interacción → periférico
```

No se inicia `UX-ADMIN-001` hasta la aprobación expresa de `UX-STATION-009`.


### ✅ UX-STATION-009 — Aprobar la matriz proceso → paso → estación → interacción → periférico

**Estado:** APROBADA

**Resultado:** `PASS_WITH_CARRYOVER`

**Matriz aprobada:** `CANONICAL_BASELINE_WITH_PILOT_CARRYOVER`

**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal

**Marcador exacto que reemplaza:** `### [ ] UX-STATION-009 — Aprobar la matriz proceso → paso → estación → interacción → periférico`

**Tarea anterior:** `UX-STATION-008 — Prototipar alternativas con trabajadores reales` — APROBADA mediante `EVIDENCE_SUBSTITUTION_APPROVED`

**Siguiente tarea reservada:** `UX-ADMIN-001 — Inventariar tareas administrativas por dominio, frecuencia y complejidad` — NO INICIADA

**Artefactos producidos:**

- `UX-STATION-FINAL-PROCESS-STEP-MATRIX-001`;
- `UX-STATION-ARCHETYPE-RESOLUTION-CATALOG-001`;
- `UX-STATION-INTERACTION-PATTERN-CATALOG-001`;
- `UX-STATION-PERIPHERAL-CAPABILITY-MATRIX-001`;
- `UX-STATION-NO-STATION-RESOLUTION-REGISTER-001`;
- `UX-STATION-SITE-VARIANT-OVERLAY-001`;
- `UX-STATION-PILOT-CARRYOVER-REGISTER-001`;
- `UX-STATION-IMPLEMENTATION-BOUNDARY-001`.

**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`.

**Naturaleza:** aprobación documental de la línea base proceso-paso-estación-interacción-periférico. No equivale a pantalla final, compra de hardware, despliegue, certificación productiva ni cierre de pilotos.

**Cambios en código, aplicaciones, componentes, rutas, Supabase, tablas, migraciones, RLS, RPC, red, hardware, compras o producción:** no autorizados por esta tarea.

---

#### 1. Propósito

Consolidar en una sola matriz ejecutable las decisiones aprobadas en `UX-STATION-002` a `UX-STATION-008` y `UX-STATION-010` a `UX-STATION-012`, de forma que cada paso humano de los 69 procesos tenga una resolución explícita de:

```text
PROCESO
-> PASO O GRUPO DE PASOS EQUIVALENTES
-> ESTACIÓN O AUSENCIA JUSTIFICADA DE ESTACIÓN COMPARTIDA
-> PATRON DE INTERACCIÓN
-> CAPACIDAD PERIFERICA
-> CONTINGENCIA
-> VALIDACIÓN POSTERIOR
```

La matriz elimina dos errores opuestos:

1. crear una pantalla y una estación distinta para cada proceso, sede o rol;
2. imponer una única interfaz genérica a tareas físicas, administrativas, financieras y automáticas que tienen riesgos diferentes.

---

#### 2. Decisión canónica

Se aprueba `UX-STATION-FINAL-PROCESS-STEP-MATRIX-001` como línea base obligatoria para el diseño posterior.

La aprobación significa:

- los cinco arquetipos operativos de `UX-STATION-008` quedan utilizables para diseño y planificación;
- una tarea administrativa o privada puede resolver expresamente a `NO_SHARED / UX-ADMIN`;
- un paso automático puede resolver a `NO_HUMAN`;
- un periférico se expresa por capacidad y no por marca o modelo;
- cada paso conserva modalidad principal, respaldo y condición de bloqueo;
- las variantes de sede se modelan mediante overlays y no mediante procesos duplicados;
- la matriz puede implementarse de forma incremental por paquetes;
- los pilotos posteriores conservan autoridad para corregir texto, orden, ergonomía, montaje o modalidad cuando exista evidencia real.

La aprobación no significa:

- que todos los dispositivos físicos ya existan;
- que cada pantalla definitiva este diseñada;
- que los trabajadores hayan certificado todas las variantes;
- que una impresora, escáner, báscula o datáfono concreto este seleccionado;
- que una aplicación pueda pasar a producción sin readiness, piloto y certificación.

---

#### 3. Dependencias consolidadas

Esta tarea consume y no reemplaza:

- `PROC-CAT-001` a `PROC-CAT-020`;
- `PROC-ACTOR-001` a `PROC-ACTOR-010`;
- `UX-STATION-001` a `UX-STATION-008`;
- `UX-STATION-010` a `UX-STATION-012`;
- `UX-BASE-001` a `UX-BASE-015`;
- `NFR-REQ-001` a `NFR-REQ-011`;
- las decisiones de identidad y autorización `AUTH-*`;
- la validación humana diferida a `UX-QA-020` y `UX-QA-021` a `UX-QA-030`.

Cuando la matriz indique `NO_SHARED / UX-ADMIN`, el diseño detallado pertenece a `UX-ADMIN-001` a `UX-ADMIN-005`. Cuando indique un arquetipo operativo, el contrato de pantalla pertenece a `PROC-SCREEN-001` a `PROC-SCREEN-028`.

---

#### 4. Unidad mínima de la matriz

Cada fila representa:

```text
PROCESO
+ PASO O GRUPO DE PASOS CON EL MISMO CONTRATO DE INTERACCIÓN
+ AMBITO OPERATIVO
+ RESOLUCION DE ESTACIÓN
+ INTERACCIÓN PRINCIPAL
+ CAPACIDAD PERIFERICA
+ RESPALDO O BLOQUEO
+ ESTADO DE DECISIÓN
```

Agrupar pasos esta permitido solo cuando coinciden objeto, riesgo, autoridad, modalidad, consecuencia y recuperación. No se agrupan pagos, mediciones obligatorias, cambios de actor, ajustes, entregas de custodia o acciones irreversibles con pasos de menor riesgo.

---

#### 5. Estados de decisión

| Estado                    | Significado                                                                                                 |
| ------------------------- | ----------------------------------------------------------------------------------------------------------- |
| `CANONICAL`               | resolución aprobada para diseño y planificación posterior                                                   |
| `CONDITIONALLY_CANONICAL` | aprobada con overlay, capacidad, variante o piloto explicito                                                |
| `NO_SHARED_STATION`       | tarea humana real, pero no debe ejecutarse en una estación operativa compartida                             |
| `NO_HUMAN_STATION`        | paso automático sin operador humano en ese instante                                                         |
| `PILOT_CHANGE_REQUIRED`   | estado futuro si un piloto demuestra riesgo o friccion material; no se asigna preventivamente en esta tarea |

No queda permitido `UNDECIDED`, `TBD`, `POR DEFINIR` ni una fila sin tarea propietaria.

---

#### 6. Catalogo de resoluciones de estación

| Código                 | Resolución                                                     | Uso permitido                                                         | Limite obligatorio                                                    |
| ---------------------- | -------------------------------------------------------------- | --------------------------------------------------------------------- | --------------------------------------------------------------------- |
| `SERVICE_CHECKOUT`     | servicio, mostrador, caja y entrega                            | selección táctil, pedido, cobro, cliente, reserva y entrega           | no expone administración general ni conserva actor anterior           |
| `KITCHEN_PREP`         | cocina, barra, horno, pizza y expedición                       | cola visible, prioridad, preparación y cambio de estado               | no fuerza captura extensa ni usa sonido como única señal              |
| `PRODUCTION_BATCH`     | panaderia, reposteria, cocina caliente, empaque y calidad      | lote, receta, cantidad, medición, avance y cierre                     | no estima mediciones obligatorias ni oculta versión de receta         |
| `WAREHOUSE_FLOW`       | recepción, bodega, ubicación, conteo, picking, despacho y ruta | escaneo, cantidades, custodia, movimiento y handoff                   | no cierra entrega sin aceptación cuando sea obligatoria               |
| `SUPERVISION_EXPO`     | supervisión, expedición, excepciones y coordinación            | priorización, aprobación, reasignación, conciliación y alertas        | opera por excepción; no reparte manualmente todo el trabajo ordinario |
| `NO_SHARED / UX-ADMIN` | tarea administrativa personal o privada                        | se disena en `UX-ADMIN-001` a `UX-ADMIN-005`                          | no se fuerza dentro de una estación operativa compartida              |
| `NO_HUMAN`             | paso automático o integración técnica                          | evento, cola, adaptador o reconciliación sin operador en ese instante | no se presenta como trabajador ni como estación humana                |


Los overlays `MOBILE`, `MOBILE_ROUTE`, `MEASURE`, `FOOD_HYGIENE`, `PUBLIC_VIEW`, `WET_GREASY`, `COLD`, `HOT`, `NOISY` y equivalentes agregan restricciones; nunca reducen identidad, seguridad, trazabilidad o integridad.

---

#### 7. Catalogo de patrones de interacción

| Patron                       | Propósito                                            | Regla principal                                                                           |
| ---------------------------- | ---------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| `BANDEJA_Y_SIGUIENTE_ACCION` | mostrar trabajo ejecutable y prioridad               | una acción primaria por estado y razón de prioridad visible                               |
| `SELECCION_TACTIL`           | elegir objeto, producto o opcion frecuente           | blancos tactiles amplios, busqueda breve y sin codigos memorizados                        |
| `PASOS_GUIADOS`              | ejecutar secuencia con dependencias                  | no avanzar si falta un dato obligatorio; conservar borrador y contexto                    |
| `CAPTURA_CANTIDAD`           | registrar valor, unidad y presentación               | valor, unidad, presentación, conversion y origen permanecen separados                     |
| `ESCANEO_Y_VERIFICACION`     | identificar producto, ubicación, activo o contenedor | muestra objeto resuelto antes de confirmar; captura manual no inventa codigos             |
| `MEDICION_GUIADA`            | capturar peso u otra medición                        | unidad, estabilidad, tara y origen quedan visibles cuando aplican                         |
| `CAMBIO_DE_ESTADO`           | iniciar, pausar, avanzar o finalizar                 | el botón describe el efecto empresarial y no escribe estados arbitrarios                  |
| `ENTREGA_Y_ACEPTACION`       | transferir custodia o responsabilidad                | enviar no equivale a recibir; emisor, receptor, contenido y pendientes quedan registrados |
| `REVISION_GUIADA`            | comparar evidencia y decidir                         | datos criticos, diferencias y consecuencia se muestran antes de decidir                   |
| `APROBACION_CON_IMPACTO`     | autorizar una acción sensible                        | autoridad, objeto, alcance, versión e impacto quedan visibles y auditados                 |
| `PAGO_CONFIRMADO`            | autorizar y comprobar un pago                        | captura, autorización, comprobante y conciliación son hechos separados                    |
| `EVIDENCIA`                  | tomar foto, archivo, firma o soporte                 | solo datos necesarios, con propietario, fecha, clasificación y limpieza local             |
| `EVENTO_AUTOMATICO`          | ejecutar integración o reacción técnica              | idempotencia, correlacion, reintento y conciliación obligatorios                          |
| `MODO_CONTINGENCIA`          | conservar resultado mínimo durante falla             | indica que puede continuar, que debe detenerse y como reconciliar después                 |


Los nombres tecnicos pueden existir en contratos internos, pero el texto mostrado al trabajador deberá usar lenguaje cotidiano y orientado a la acción.

---

#### 8. Catalogo de capacidades perifericas

| Capacidad                | Condición de uso                                                           | Respaldo permitido                                                                 |
| ------------------------ | -------------------------------------------------------------------------- | ---------------------------------------------------------------------------------- |
| `ESCÁNER`                | identificación repetitiva de producto, ubicación, activo, kit o contenedor | cámara o captura manual validada cuando la política lo permita                     |
| `CÁMARA`                 | evidencia, lectura de código o documento                                   | archivo posterior o registro manual; nunca prueba por si sola el hecho empresarial |
| `BASCULA_MEDICION`       | peso o medición obligatoria                                                | equipo alterno aprobado; no estimacion manual de un valor obligatorio              |
| `ETIQUETADORA_IMPRESORA` | etiqueta, comanda o soporte físico                                         | vista digital, reimpresion o formato controlado; imprimir no confirma el efecto    |
| `DATÁFONO`               | pago por medio externo                                                     | medio alterno autorizado o bloqueo; el datáfono no es la fuente final del pedido   |
| `SENALIZACION`           | llamada, prioridad o alerta ambiental                                      | señal visual y textual; nunca sonido o color como única evidencia                  |
| `NINGUNO`                | el paso no necesita capacidad física especial                              | no se compra hardware solo por conveniencia visual                                 |


Toda capacidad se implementara mediante adaptador desacoplado. Una falla física nunca podrá producir una confirmación empresarial ficticia.

---

#### 9. Reglas transversales de la matriz

1. Cada paso humano resuelve a un arquetipo o a `NO_SHARED / UX-ADMIN`.
2. Cada paso automático resuelve a `NO_HUMAN` y conserva propietario técnico y empresarial.
3. La aplicación no determina por si sola la estación.
4. El rol no determina por si solo la estación.
5. La sede no duplica el proceso; aplica overlay o variante versionada.
6. Una estación compartida mantiene trabajador efectivo visible y cambio de trabajador accesible.
7. La bandeja muestra trabajo ejecutable y una siguiente acción; no mezcla alertas con tareas.
8. Capturar no equivale a confirmar.
9. Imprimir no equivale a pagar, recibir, producir, despachar ni entregar.
10. Escanear no equivale a aceptar el objeto resuelto.
11. Enviar no equivale a recibir.
12. Guardar localmente no equivale a confirmación empresarial.
13. Un resultado incierto no permite reintento ciego.
14. Ninguna estación exige un técnico o supervisor permanente.
15. El trabajador ejecuta acciones simples, seguras y guiadas; soporte atiende excepciones.

---

#### 10. Resolución de variantes por sede

| Variante                         | Regla aprobada                                                                                                                           |
| -------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| Vento Cafe                       | combina `SERVICE_CHECKOUT`, `KITCHEN_PREP`, caja, barra, servicio y recepción; las diferencias de zona no crean procesos nuevos          |
| Saudo                            | usa los mismos contratos de servicio, mostrador, cocina y caja; la operación verbal actual no se convierte en diseño objetivo            |
| Molka                            | permite concentrar servicio, cobro, preparación y entrega en menos personas sin fusionar los hechos empresariales                        |
| Centro de Producción             | usa `PRODUCTION_BATCH`, `WAREHOUSE_FLOW` y `SUPERVISION_EXPO` con overlays por panaderia, reposteria, cocina, empaque, bodega y despacho |
| Oficina y trabajo administrativo | resuelve a `NO_SHARED / UX-ADMIN` salvo tableros de supervisión o excepciones operativas                                                 |

Una variante local solo podrá cambiar presentación, montaje, periférico opcional, densidad, zona, capacidad o respaldo. No podrá cambiar por si sola propiedad del proceso, autorización, fuente de verdad o significado de una acción.

---

#### 11. Matriz final proceso → paso → estación → interacción → periférico

##### 11.1. Gobierno, personas, SST y cumplimiento
| Proceso                                                                | Propietaria | Paso o grupo de pasos                                            | Ambito principal                                  | Estación resuelta                                                              | Interacción aprobada                                  | Perifericos por capacidad                 | Contingencia o respaldo                                             | Estado                    |
| ---------------------------------------------------------------------- | ----------- | ---------------------------------------------------------------- | ------------------------------------------------- | ------------------------------------------------------------------------------ | ----------------------------------------------------- | ----------------------------------------- | ------------------------------------------------------------------- | ------------------------- |
| `VPROC-0001` — Gobernar decisiones empresariales                       | `viso`      | analizar, aprobar y hacer seguimiento                            | corporativo y gerencia                            | `NO_SHARED / UX-ADMIN`                                                         | `REVISION_GUIADA + APROBACION_CON_IMPACTO`            | `NINGUNO`                                 | borrador local controlado; sin conexión no se aprueba               | `NO_SHARED_STATION`       |
| `VPROC-0001`                                                           | `viso`      | resolver excepciones operativas                                  | sedes y áreas afectadas                           | `SUPERVISION_EXPO`                                                             | `BANDEJA_Y_SIGUIENTE_ACCION + EXCEPCION_GUIADA`       | `CAMARA_OPCIONAL`                         | escalar con contexto y evidencia; no decidir desde mensaje informal | `CONDITIONALLY_CANONICAL` |
| `VPROC-0002` — Mantener estructura organizativa y jurídica             | `viso`      | crear, revisar y aplicar cambios de empresa, marca, sede o área  | corporativo                                       | `NO_SHARED / UX-ADMIN`                                                         | `FORMULARIO_GUIADO + VISTA_PREVIA_DE_IMPACTO`         | `NINGUNO`                                 | guardar borrador; bloquear aplicación sin validación completa       | `NO_SHARED_STATION`       |
| `VPROC-0003` — Gobernar politicas, delegaciones y limites              | `viso`      | redactar, revisar, aprobar, publicar y versionar                 | corporativo                                       | `NO_SHARED / UX-ADMIN`                                                         | `REVISION_GUIADA + APROBACION_CON_IMPACTO`            | `NINGUNO`                                 | versión anterior permanece vigente hasta publicación confirmada     | `NO_SHARED_STATION`       |
| `VPROC-0004` — Coordinar compromisos y transferencias internas         | `viso`      | registrar, aceptar, ejecutar y verificar compromiso              | corporativo, sedes y áreas                        | `SUPERVISION_EXPO`                                                             | `BANDEJA_Y_SIGUIENTE_ACCION + ENTREGA_Y_ACEPTACION`   | `CAMARA_OPCIONAL`                         | entrega manual correlacionada y aceptación posterior                | `CANONICAL`               |
| `VPROC-0005` — Planear dotación y ejecutar selección                   | `talento`   | aprobar necesidad, publicar vacante, evaluar y seleccionar       | talento y gerencia                                | `NO_SHARED / UX-ADMIN`                                                         | `FORMULARIO_GUIADO + REVISION_COMPARATIVA`            | `DOCUMENTO_OPCIONAL`                      | guardar borrador y reanudar; no usar estación operativa compartida  | `NO_SHARED_STATION`       |
| `VPROC-0006` — Orquestar vinculación e incorporación                   | `viso`      | validar identidad, documentos, asignaciones, accesos e inducción | talento y administración                          | `NO_SHARED / UX-ADMIN`                                                         | `PASOS_GUIADOS + CHECKLIST + APROBACION_CON_IMPACTO`  | `CAMARA_DOCUMENTO_OPCIONAL`               | no habilitar trabajador hasta completar controles                   | `NO_SHARED_STATION`       |
| `VPROC-0006`                                                           | `viso`      | confirmar preparación del puesto y recepción por el trabajador   | sede y área asignada                              | `SUPERVISION_EXPO`                                                             | `CHECKLIST + ENTREGA_Y_ACEPTACION`                    | `CAMARA_OPCIONAL`                         | pendiente visible con responsable; no cierre verbal                 | `CONDITIONALLY_CANONICAL` |
| `VPROC-0007` — Administrar asignaciones y programación laboral         | `viso`      | crear, revisar y publicar programación                           | administración y gerencia                         | `NO_SHARED / UX-ADMIN`                                                         | `CALENDARIO_GUIADO + VALIDACION_PREVENTIVA`           | `NINGUNO`                                 | conservar versión publicada anterior hasta confirmar la nueva       | `NO_SHARED_STATION`       |
| `VPROC-0007`                                                           | `viso`      | consultar asignación vigente y cambios                           | todas las áreas operativas                        | `SERVICE_CHECKOUT / KITCHEN_PREP / PRODUCTION_BATCH / WAREHOUSE_FLOW`          | `CONSULTA_SOLO_LECTURA`                               | `NINGUNO`                                 | mostrar última versión confirmada y advertir si esta desactualizada | `CANONICAL`               |
| `VPROC-0008` — Capturar y conciliar asistencia                         | `anima`     | identificarse, registrar entrada, pausa o salida                 | todas las áreas operativas                        | `SERVICE_CHECKOUT / KITCHEN_PREP / PRODUCTION_BATCH / WAREHOUSE_FLOW + MOBILE` | `IDENTIFICACION_RAPIDA + CONFIRMACIÓN`                | `QR_O_PIN; CAMARA_NO_REQUERIDA`           | folio local firmado e idempotente; reconciliación posterior         | `CANONICAL`               |
| `VPROC-0008`                                                           | `anima`     | revisar y decidir correcciones                                   | supervisión y administración                      | `SUPERVISION_EXPO`                                                             | `REVISION_GUIADA + APROBACION_CON_IMPACTO`            | `NINGUNO`                                 | no modificar el hecho original; crear decisión vinculada            | `CANONICAL`               |
| `VPROC-0009` — Gestionar novedades, ausencias, permisos y reemplazos   | `viso`      | registrar solicitud o novedad laboral                            | todas las áreas operativas                        | `SERVICE_CHECKOUT / KITCHEN_PREP / PRODUCTION_BATCH / WAREHOUSE_FLOW + MOBILE` | `FORMULARIO_CORTO + MOTIVO_ESTRUCTURADO`              | `CAMARA_DOCUMENTO_OPCIONAL`               | guardar pendiente con folio; no prometer aprobación                 | `CONDITIONALLY_CANONICAL` |
| `VPROC-0009`                                                           | `viso`      | revisar, decidir y coordinar reemplazo                           | supervisión y administración                      | `SUPERVISION_EXPO`                                                             | `BANDEJA_Y_SIGUIENTE_ACCION + APROBACION_CON_IMPACTO` | `NINGUNO`                                 | escalar a responsable vigente                                       | `CANONICAL`               |
| `VPROC-0010` — Preparar y reconciliar pagos y beneficios laborales     | `numera`    | consolidar, revisar, aprobar, pagar y conciliar                  | finanzas y gerencia                               | `NO_SHARED / UX-ADMIN`                                                         | `REVISION_GUIADA + DOBLE_CONTROL`                     | `NINGUNO`                                 | bloquear pago; conservar lote y diferencias para reanudacion        | `NO_SHARED_STATION`       |
| `VPROC-0011` — Orquestar retiro laboral y cierre                       | `viso`      | planear retiro, revocar accesos y cerrar expediente              | talento, administración y seguridad               | `NO_SHARED / UX-ADMIN`                                                         | `PASOS_GUIADOS + CHECKLIST + APROBACION_CON_IMPACTO`  | `NINGUNO`                                 | revocacion urgente independiente del cierre documental              | `NO_SHARED_STATION`       |
| `VPROC-0011`                                                           | `viso`      | recibir activos, llaves, uniformes o elementos                   | bodega o responsable de custodia                  | `WAREHOUSE_FLOW`                                                               | `ESCANEO_Y_VERIFICACION + ENTREGA_Y_ACEPTACION`       | `ESCANER_PREFERENTE; CAMARA_OPCIONAL`     | captura manual validada con folio y verificacion posterior          | `CANONICAL`               |
| `VPROC-0012` — Gestionar riesgos de seguridad y salud en el trabajo    | `viso`      | identificar, evaluar, tratar y verificar riesgo                  | áreas y supervisión                               | `SUPERVISION_EXPO + MOBILE`                                                    | `CHECKLIST + EVIDENCIA + EXCEPCION_GUIADA`            | `CAMARA_OPCIONAL; MEDICION_OPCIONAL`      | detención segura y reporte con folio                                | `CANONICAL`               |
| `VPROC-0013` — Gestionar incidentes, accidentes y emergencias          | `viso`      | reportar, estabilizar y escalar                                  | cualquier sede o área                             | `SERVICE_CHECKOUT / KITCHEN_PREP / PRODUCTION_BATCH / WAREHOUSE_FLOW + MOBILE` | `ACCION_DE_EMERGENCIA + FORMULARIO_CORTO`             | `CAMARA_OPCIONAL; SENALIZACION_OPCIONAL`  | priorizar seguridad; reporte diferido cuando sea seguro             | `CANONICAL`               |
| `VPROC-0013`                                                           | `viso`      | investigar, definir acciones y cerrar                            | supervisión y administración                      | `SUPERVISION_EXPO`                                                             | `REVISION_GUIADA + CHECKLIST`                         | `DOCUMENTO_OPCIONAL`                      | conservar evidencia y cronología                                    | `CANONICAL`               |
| `VPROC-0014` — Ejecutar controles de higiene, inocuidad y cumplimiento | `viso`      | realizar control, registrar resultado y contener riesgo          | cocina, barra, producción, bodega e instalaciones | `KITCHEN_PREP / PRODUCTION_BATCH / WAREHOUSE_FLOW + FOOD_HYGIENE`              | `CHECKLIST + MEDICION_GUIADA + EVIDENCIA`             | `CAMARA_OPCIONAL; MEDICION_SEGUN_CONTROL` | formato manual controlado y cuarentena cuando aplique               | `CANONICAL`               |

##### 11.2. Producto, recetas, oferta y especificaciones
| Proceso                                                                     | Propietaria | Paso o grupo de pasos                             | Ambito principal                     | Estación resuelta                   | Interacción aprobada                                 | Perifericos por capacidad                           | Contingencia o respaldo                                                | Estado                    |
| --------------------------------------------------------------------------- | ----------- | ------------------------------------------------- | ------------------------------------ | ----------------------------------- | ---------------------------------------------------- | --------------------------------------------------- | ---------------------------------------------------------------------- | ------------------------- |
| `VPROC-0015` — Gobernar productos, presentaciones, unidades y equivalencias | `nexo`      | definir, revisar, aprobar y publicar maestro      | administración de producto           | `NO_SHARED / UX-ADMIN`              | `FORMULARIO_GUIADO + VISTA_PREVIA_DE_IMPACTO`        | `NINGUNO`                                           | conservar versión vigente anterior                                     | `NO_SHARED_STATION`       |
| `VPROC-0015`                                                                | `nexo`      | verificar código, presentación o etiqueta física  | bodega y producción                  | `WAREHOUSE_FLOW / PRODUCTION_BATCH` | `ESCANEO_Y_VERIFICACION`                             | `ESCANER_PREFERENTE; CÁMARA; ETIQUETADORA_OPCIONAL` | busqueda manual validada; no inventar codigos                          | `CONDITIONALLY_CANONICAL` |
| `VPROC-0016` — Gestionar desarrollo y versión de recetas                    | `fogo`      | definir, revisar, aprobar y publicar receta       | desarrollo, calidad y administración | `NO_SHARED / UX-ADMIN`              | `FORMULARIO_GUIADO + REVISION_COMPARATIVA`           | `NINGUNO`                                           | conservar versión vigente anterior                                     | `NO_SHARED_STATION`       |
| `VPROC-0016`                                                                | `fogo`      | ejecutar prueba y registrar rendimiento           | producción                           | `PRODUCTION_BATCH + MEASURE`        | `PASOS_GUIADOS + CAPTURA_CANTIDAD + MEDICION_GUIADA` | `BASCULA_SEGUN_RECETA; CAMARA_OPCIONAL`             | registro manual controlado y revisión técnica                          | `CANONICAL`               |
| `VPROC-0017` — Publicar oferta y disponibilidad                             | `pulso`     | validar, aprobar, programar y publicar oferta     | comercial y administración           | `NO_SHARED / UX-ADMIN`              | `REVISION_GUIADA + VISTA_PREVIA_DE_IMPACTO`          | `NINGUNO`                                           | mantener oferta anterior o retirar de forma segura                     | `NO_SHARED_STATION`       |
| `VPROC-0017`                                                                | `pulso`     | consultar oferta disponible durante venta         | servicio, caja y mostrador           | `SERVICE_CHECKOUT`                  | `SELECCION_TACTIL + CONSULTA_SOLO_LECTURA`           | `NINGUNO`                                           | mostrar última oferta confirmada y no prometer disponibilidad incierta | `CANONICAL`               |
| `VPROC-0017`                                                                | `pulso`     | propagar a canales                                | servicios tecnicos                   | `NO_HUMAN`                          | `EVENTO_AUTOMATICO`                                  | `NINGUNO`                                           | reintento idempotente y conciliación                                   | `NO_HUMAN_STATION`        |
| `VPROC-0018` — Mantener especificaciones, alérgenos y criterios de calidad  | `nexo`      | definir, revisar, aprobar y versionar             | calidad y administración             | `NO_SHARED / UX-ADMIN`              | `FORMULARIO_GUIADO + REVISION_GUIADA`                | `DOCUMENTO_OPCIONAL`                                | versión anterior sigue vigente                                         | `NO_SHARED_STATION`       |
| `VPROC-0018`                                                                | `nexo`      | consultar criterio durante recepción o producción | bodega, recepción y producción       | `WAREHOUSE_FLOW / PRODUCTION_BATCH` | `CONSULTA_SOLO_LECTURA + ALERTA_CRITICA`             | `NINGUNO`                                           | bloqueo seguro si falta especificacion obligatoria                     | `CANONICAL`               |

##### 11.3. Compras y recepción
| Proceso                                                    | Propietaria | Paso o grupo de pasos                                        | Ambito principal            | Estación resuelta                                      | Interacción aprobada                                          | Perifericos por capacidad                                     | Contingencia o respaldo                                     | Estado              |
| ---------------------------------------------------------- | ----------- | ------------------------------------------------------------ | --------------------------- | ------------------------------------------------------ | ------------------------------------------------------------- | ------------------------------------------------------------- | ----------------------------------------------------------- | ------------------- |
| `VPROC-0019` — Registrar y priorizar necesidades de compra | `origo`     | capturar necesidad desde consumo o faltante                  | bodega, producción y sedes  | `WAREHOUSE_FLOW / PRODUCTION_BATCH / SUPERVISION_EXPO` | `CAPTURA_CANTIDAD + MOTIVO_ESTRUCTURADO`                      | `ESCANER_OPCIONAL`                                            | guardar solicitud con folio; no crear orden automaticamente | `CANONICAL`         |
| `VPROC-0019`                                               | `origo`     | validar y priorizar                                          | compras y gerencia          | `NO_SHARED / UX-ADMIN`                                 | `REVISION_GUIADA`                                             | `NINGUNO`                                                     | mantener pendiente con responsable                          | `NO_SHARED_STATION` |
| `VPROC-0020` — Evaluar mercado, cotizaciones y proveedor   | `origo`     | solicitar, comparar, recomendar y decidir                    | compras y gerencia          | `NO_SHARED / UX-ADMIN`                                 | `REVISION_COMPARATIVA + APROBACION_CON_IMPACTO`               | `DOCUMENTO_OPCIONAL`                                          | guardar evidencia y no seleccionar por omision              | `NO_SHARED_STATION` |
| `VPROC-0021` — Aprobar y formalizar compra                 | `origo`     | revisar, aprobar, emitir y confirmar orden                   | compras y gerencia          | `NO_SHARED / UX-ADMIN`                                 | `PASOS_GUIADOS + DOBLE_CONTROL`                               | `DOCUMENTO_O_IMPRESION_OPCIONAL`                              | conservar borrador; envío idempotente                       | `NO_SHARED_STATION` |
| `VPROC-0022` — Recibir y reconciliar compras               | `origo`     | registrar llegada y verificar producto, documento y cantidad | recepción y bodega          | `WAREHOUSE_FLOW + MEASURE`                             | `ESCANEO_Y_VERIFICACION + CAPTURA_CANTIDAD + MEDICION_GUIADA` | `ESCANER_PREFERENTE; BASCULA_SEGUN_PRODUCTO; CAMARA_OPCIONAL` | captura manual validada y folio de contingencia             | `CANONICAL`         |
| `VPROC-0022`                                               | `origo`     | aceptar diferencia, ubicar y cerrar                          | recepción, bodega y compras | `WAREHOUSE_FLOW / SUPERVISION_EXPO`                    | `REVISION_ANTES_DE_CONFIRMAR + ENTREGA_Y_ACEPTACION`          | `ETIQUETADORA_O_IMPRESORA_OPCIONAL`                           | recepción parcial y pendiente explicito                     | `CANONICAL`         |

##### 11.4. Inventario, activos y logística interna
| Proceso                                                            | Propietaria | Paso o grupo de pasos                                     | Ambito principal                         | Estación resuelta                                                     | Interacción aprobada                                               | Perifericos por capacidad                                    | Contingencia o respaldo                                                  | Estado      |
| ------------------------------------------------------------------ | ----------- | --------------------------------------------------------- | ---------------------------------------- | --------------------------------------------------------------------- | ------------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------------------ | ----------- |
| `VPROC-0023` — Gestionar ubicaciones de inventario                 | `nexo`      | definir, activar, cambiar y verificar ubicación           | bodega                                   | `WAREHOUSE_FLOW`                                                      | `ESCANEO_Y_VERIFICACION + FORMULARIO_GUIADO`                       | `ESCANER_PREFERENTE; ETIQUETADORA_OPCIONAL`                  | código legible y captura manual validada                                 | `CANONICAL` |
| `VPROC-0024` — Ejecutar entradas y ubicación de inventario         | `nexo`      | validar, mover, confirmar y ubicar                        | recepción y bodega                       | `WAREHOUSE_FLOW`                                                      | `ESCANEO_Y_VERIFICACION + CAPTURA_CANTIDAD + CAMBIO_DE_ESTADO`     | `ESCANER_PREFERENTE; ETIQUETADORA_OPCIONAL`                  | captura manual con folio y conciliación                                  | `CANONICAL` |
| `VPROC-0025` — Ejecutar salidas, retiros y traslados de inventario | `nexo`      | reservar, preparar, retirar, entregar y confirmar destino | bodega y áreas receptoras                | `WAREHOUSE_FLOW + MOBILE`                                             | `ESCANEO_Y_VERIFICACION + CAPTURA_CANTIDAD + ENTREGA_Y_ACEPTACION` | `ESCANER_PREFERENTE`                                         | captura manual autorizada; no cerrar sin receptor cuando sea obligatorio | `CANONICAL` |
| `VPROC-0026` — Ejecutar conteos y ajustes de inventario            | `nexo`      | capturar conteo físico por ubicación y presentación       | bodega y áreas con stock                 | `WAREHOUSE_FLOW + MOBILE`                                             | `ESCANEO_Y_VERIFICACION + CAPTURA_CANTIDAD`                        | `ESCANER_PREFERENTE`                                         | hoja controlada y doble digitacion posterior                             | `CANONICAL` |
| `VPROC-0026`                                                       | `nexo`      | investigar diferencia y aprobar ajuste                    | supervisión y control de inventario      | `SUPERVISION_EXPO`                                                    | `REVISION_GUIADA + DOBLE_CONTROL`                                  | `CAMARA_OPCIONAL`                                            | no ajustar por el mismo acto de conteo                                   | `CANONICAL` |
| `VPROC-0027` — Gestionar condición, cuarentena y disposición       | `nexo`      | detectar, aislar, evaluar y ejecutar decisión             | bodega, calidad y producción             | `WAREHOUSE_FLOW / PRODUCTION_BATCH + MOBILE`                          | `ESCANEO_Y_VERIFICACION + EVIDENCIA + EXCEPCION_GUIADA`            | `CAMARA_PREFERENTE; ETIQUETADORA_OPCIONAL`                   | separacion física y folio; no liberar sin decisión                       | `CANONICAL` |
| `VPROC-0028` — Gestionar reabastecimiento interno y remisiones     | `nexo`      | solicitar y aprobar reabastecimiento                      | sede solicitante y bodega                | `SERVICE_CHECKOUT / KITCHEN_PREP / PRODUCTION_BATCH / WAREHOUSE_FLOW` | `CAPTURA_CANTIDAD + BANDEJA_Y_SIGUIENTE_ACCION`                    | `NINGUNO`                                                    | solicitud pendiente con prioridad visible                                | `CANONICAL` |
| `VPROC-0028`                                                       | `nexo`      | preparar, despachar, transportar, recibir y conciliar     | bodega, despacho y sede receptora        | `WAREHOUSE_FLOW + MOBILE`                                             | `ESCANEO_Y_VERIFICACION + ENTREGA_Y_ACEPTACION`                    | `ESCANER_PREFERENTE; IMPRESORA_OPCIONAL`                     | folio de remision y recepción parcial                                    | `CANONICAL` |
| `VPROC-0029` — Gestionar activos y custodia                        | `nexo`      | registrar, etiquetar, asignar, transferir y devolver      | bodega, tecnologia y responsables        | `WAREHOUSE_FLOW + MOBILE`                                             | `ESCANEO_Y_VERIFICACION + ENTREGA_Y_ACEPTACION`                    | `ESCANER_PREFERENTE; ETIQUETADORA_OPCIONAL; CAMARA_OPCIONAL` | identificación legible y acta controlada                                 | `CANONICAL` |
| `VPROC-0030` — Gestionar mantenimiento de activos y equipos        | `nexo`      | reportar, diagnosticar, reparar, probar y liberar         | todas las sedes; soporte y mantenimiento | `WAREHOUSE_FLOW / SUPERVISION_EXPO + MOBILE`                          | `FORMULARIO_CORTO + CHECKLIST + EVIDENCIA`                         | `CAMARA_OPCIONAL; MEDICION_SEGUN_EQUIPO`                     | equipo fuera de servicio y escalamiento                                  | `CANONICAL` |
| `VPROC-0031` — Gestionar inspeccion y operación de vehículos       | `nexo`      | inspeccionar, asignar, usar y revisar                     | despacho y transporte                    | `WAREHOUSE_FLOW + MOBILE_ROUTE`                                       | `CHECKLIST + EVIDENCIA + ENTREGA_Y_ACEPTACION`                     | `CAMARA_OPCIONAL; LECTOR_OPCIONAL`                           | formato de inspeccion y bloqueo seguro                                   | `CANONICAL` |
| `VPROC-0032` — Controlar reutilizables y contenedores              | `nexo`      | preparar, entregar, custodiar, devolver y verificar       | producción, bodega, despacho y sedes     | `WAREHOUSE_FLOW + MOBILE`                                             | `ESCANEO_Y_VERIFICACION + CAPTURA_CANTIDAD + ENTREGA_Y_ACEPTACION` | `ESCANER_PREFERENTE`                                         | conteo manual con folio y conciliación                                   | `CANONICAL` |

##### 11.5. Planeación, ejecucion y cierre productivo
| Proceso                                                    | Propietaria | Paso o grupo de pasos                                                        | Ambito principal                                     | Estación resuelta                             | Interacción aprobada                                          | Perifericos por capacidad                                           | Contingencia o respaldo                                        | Estado                    |
| ---------------------------------------------------------- | ----------- | ---------------------------------------------------------------------------- | ---------------------------------------------------- | --------------------------------------------- | ------------------------------------------------------------- | ------------------------------------------------------------------- | -------------------------------------------------------------- | ------------------------- |
| `VPROC-0033` — Planear producción                          | `fogo`      | consolidar demanda, validar capacidad, aprobar y publicar                    | planeación y supervisión                             | `SUPERVISION_EXPO / NO_SHARED UX-ADMIN`       | `TABLERO + REVISION_GUIADA + APROBACION_CON_IMPACTO`          | `NINGUNO`                                                           | mantener plan vigente anterior y cambios versionados           | `CONDITIONALLY_CANONICAL` |
| `VPROC-0033`                                               | `fogo`      | consultar trabajo publicado                                                  | áreas productivas                                    | `PRODUCTION_BATCH`                            | `BANDEJA_Y_SIGUIENTE_ACCION`                                  | `PANTALLA_O_IMPRESION_OPCIONAL`                                     | última versión confirmada visible                              | `CANONICAL`               |
| `VPROC-0034` — Ejecutar producción                         | `fogo`      | reservar materiales, iniciar, registrar consumos, producir y reportar salida | panaderia, reposteria, cocina caliente y demas áreas | `PRODUCTION_BATCH + MEASURE + FOOD_HYGIENE`   | `PASOS_GUIADOS + CAPTURA_CANTIDAD + CAMBIO_DE_ESTADO`         | `BASCULA_SEGUN_PROCESO; ESCANER_OPCIONAL`                           | registro manual controlado; no estimar medición obligatoria    | `CANONICAL`               |
| `VPROC-0035` — Inspeccionar calidad y decidir disposición  | `fogo`      | inspeccionar, registrar resultados y ejecutar disposición                    | calidad y producción                                 | `PRODUCTION_BATCH + MEASURE`                  | `CHECKLIST + MEDICION_GUIADA + EVIDENCIA`                     | `CAMARA_OPCIONAL; MEDICION_SEGUN_CONTROL`                           | cuarentena y formato controlado                                | `CANONICAL`               |
| `VPROC-0036` — Empacar, etiquetar y transferir producto    | `fogo`      | preparar materiales, empacar, verificar etiqueta y registrar salida          | empaque, producción y bodega                         | `PRODUCTION_BATCH / WAREHOUSE_FLOW + MEASURE` | `PASOS_GUIADOS + ESCANEO_Y_VERIFICACION + CAPTURA_CANTIDAD`   | `ETIQUETADORA_PREFERENTE; BASCULA_SEGUN_PRODUCTO; ESCANER_OPCIONAL` | etiqueta manual controlada y bloqueo si falta dato obligatorio | `CANONICAL`               |
| `VPROC-0037` — Cerrar producción y reconciliar rendimiento | `fogo`      | consolidar producción, consumo, merma, reproceso e inventario                | producción y supervisión                             | `PRODUCTION_BATCH / SUPERVISION_EXPO`         | `REVISION_GUIADA + CAPTURA_CANTIDAD + APROBACION_CON_IMPACTO` | `BASCULA_SEGUN_PROCESO`                                             | dejar cierre pendiente; no inventar cantidades                 | `CANONICAL`               |

##### 11.6. Servicio, ventas, pagos y cliente
| Proceso                                                    | Propietaria | Paso o grupo de pasos                                            | Ambito principal                        | Estación resuelta                                      | Interacción aprobada                                                | Perifericos por capacidad                   | Contingencia o respaldo                                    | Estado                    |
| ---------------------------------------------------------- | ----------- | ---------------------------------------------------------------- | --------------------------------------- | ------------------------------------------------------ | ------------------------------------------------------------------- | ------------------------------------------- | ---------------------------------------------------------- | ------------------------- |
| `VPROC-0038` — Atender servicio en mesa                    | `pulso`     | abrir mesa, tomar pedido y modificar antes de preparación        | salón y servicio                        | `SERVICE_CHECKOUT + MOBILE`                            | `SELECCION_TACTIL + BANDEJA_Y_SIGUIENTE_ACCION`                     | `IMPRESORA_OPCIONAL`                        | envío digital; comprobante en pantalla                     | `CANONICAL`               |
| `VPROC-0038`                                               | `pulso`     | preparar y marcar entrega parcial o total                        | cocina, barra y expedición              | `KITCHEN_PREP`                                         | `COLA_VISUAL + CAMBIO_DE_ESTADO`                                    | `IMPRESORA_OPCIONAL; SENALIZACION_OPCIONAL` | pantalla como respaldo de comandas                         | `CANONICAL`               |
| `VPROC-0038`                                               | `pulso`     | cobrar y cerrar mesa                                             | caja y servicio autorizado              | `SERVICE_CHECKOUT`                                     | `PAGO_CONFIRMADO + REVISION_ANTES_DE_CONFIRMAR`                     | `DATAFONO_SEGUN_MEDIO; IMPRESORA_OPCIONAL`  | no repetir cobro; consulta por referencia                  | `CANONICAL`               |
| `VPROC-0039` — Atender venta de mostrador                  | `pulso`     | seleccionar productos, preparar, cobrar y entregar               | mostrador, caja y preparación           | `SERVICE_CHECKOUT / KITCHEN_PREP`                      | `SELECCION_TACTIL + CAMBIO_DE_ESTADO + PAGO_CONFIRMADO`             | `DATAFONO_SEGUN_MEDIO; IMPRESORA_OPCIONAL`  | flujo digital y consulta de pago antes de reintentar       | `CANONICAL`               |
| `VPROC-0040` — Integrar pedidos de canales externos        | `pulso`     | recibir, validar y mapear pedido                                 | servicio técnico                        | `NO_HUMAN`                                             | `EVENTO_AUTOMATICO`                                                 | `NINGUNO`                                   | reintento idempotente y cola durable                       | `NO_HUMAN_STATION`        |
| `VPROC-0040`                                               | `pulso`     | aceptar, preparar y conciliar excepciones                        | caja, cocina, barra y supervisión       | `SERVICE_CHECKOUT / KITCHEN_PREP / SUPERVISION_EXPO`   | `BANDEJA_Y_SIGUIENTE_ACCION + CAMBIO_DE_ESTADO`                     | `IMPRESORA_OPCIONAL; SENALIZACION_OPCIONAL` | mantener pedido visible y bloquear duplicados              | `CANONICAL`               |
| `VPROC-0041` — Gestionar venta comercial B2B y catering    | `pulso`     | revisar requerimientos, cotizar, aprobar y confirmar             | comercial y gerencia                    | `NO_SHARED / UX-ADMIN`                                 | `FORMULARIO_GUIADO + REVISION_COMPARATIVA + APROBACION_CON_IMPACTO` | `DOCUMENTO_OPCIONAL`                        | guardar borrador y conservar vigencia                      | `NO_SHARED_STATION`       |
| `VPROC-0041`                                               | `pulso`     | cumplir producción, despacho, entrega y facturacion              | producción, bodega, despacho y finanzas | `PRODUCTION_BATCH / WAREHOUSE_FLOW / SUPERVISION_EXPO` | `BANDEJA_Y_SIGUIENTE_ACCION + ENTREGA_Y_ACEPTACION`                 | `ESCANER_OPCIONAL; IMPRESORA_OPCIONAL`      | pendientes separados por proceso propietario               | `CONDITIONALLY_CANONICAL` |
| `VPROC-0042` — Gestionar cambios de pedido                 | `pulso`     | solicitar, evaluar impacto, autorizar y aplicar cambio           | servicio, caja, cocina y supervisión    | `SERVICE_CHECKOUT / KITCHEN_PREP / SUPERVISION_EXPO`   | `REVISION_ANTES_DE_CONFIRMAR + EXCEPCION_GUIADA`                    | `NINGUNO`                                   | no aplicar si el estado cambio; crear corrección vinculada | `CANONICAL`               |
| `VPROC-0043` — Gestionar pago y conciliación de venta      | `pulso`     | seleccionar medio, autorizar, capturar y confirmar               | caja y mostrador                        | `SERVICE_CHECKOUT`                                     | `PAGO_CONFIRMADO + RESULTADO_VISIBLE`                               | `DATAFONO_SEGUN_MEDIO; IMPRESORA_OPCIONAL`  | consultar por referencia; nunca reintentar a ciegas        | `CANONICAL`               |
| `VPROC-0043`                                               | `pulso`     | emitir documento y conciliar                                     | caja y finanzas                         | `SERVICE_CHECKOUT / NO_SHARED UX-ADMIN`                | `REVISION_GUIADA`                                                   | `IMPRESORA_OPCIONAL`                        | documento digital y reimpresion separada del pago          | `CONDITIONALLY_CANONICAL` |
| `VPROC-0044` — Cerrar y conciliar caja                     | `pulso`     | contar, comparar ventas, revisar diferencia y aprobar cierre     | caja y supervisión                      | `SERVICE_CHECKOUT / SUPERVISION_EXPO`                  | `CAPTURA_CANTIDAD + DOBLE_CONTROL + APROBACION_CON_IMPACTO`         | `IMPRESORA_OPCIONAL`                        | guardar conteo; no cerrar con diferencia sin tratamiento   | `CANONICAL`               |
| `VPROC-0045` — Gestionar fidelizacion, puntos y beneficios | `pass`      | identificar cliente, validar elegibilidad y registrar movimiento | caja, mostrador y servicio              | `SERVICE_CHECKOUT`                                     | `ESCANEO_QR + REVISION_ANTES_DE_CONFIRMAR`                          | `CAMARA_O_LECTOR_QR`                        | busqueda autorizada y código de un solo uso                | `CANONICAL`               |
| `VPROC-0045`                                               | `pass`      | conciliar ledger y consentimientos                               | servicio técnico y administración       | `NO_HUMAN / NO_SHARED UX-ADMIN`                        | `EVENTO_AUTOMATICO + REVISION_GUIADA`                               | `NINGUNO`                                   | idempotencia y no alterar saldo por reintento              | `CONDITIONALLY_CANONICAL` |
| `VPROC-0046` — Gestionar reclamos y remedios               | `pulso`     | recibir y clasificar reclamo                                     | servicio, caja o canal autorizado       | `SERVICE_CHECKOUT + MOBILE`                            | `FORMULARIO_CORTO + EVIDENCIA`                                      | `CAMARA_OPCIONAL`                           | folio y traspaso a responsable                             | `CANONICAL`               |
| `VPROC-0046`                                               | `pulso`     | investigar, aprobar remedio y cerrar                             | supervisión y administración            | `SUPERVISION_EXPO / NO_SHARED UX-ADMIN`                | `REVISION_GUIADA + APROBACION_CON_IMPACTO`                          | `DOCUMENTO_OPCIONAL`                        | no prometer compensación sin autoridad                     | `CONDITIONALLY_CANONICAL` |
| `VPROC-0047` — Gestionar reservas                          | `pulso`     | consultar disponibilidad, proponer terminos y confirmar          | servicio, caja y administración         | `SERVICE_CHECKOUT / NO_SHARED UX-ADMIN`                | `CALENDARIO_GUIADO + REVISION_ANTES_DE_CONFIRMAR`                   | `DATAFONO_SEGUN_DEPOSITO`                   | mantener solicitud pendiente y no duplicar reserva         | `CONDITIONALLY_CANONICAL` |
| `VPROC-0047`                                               | `pulso`     | preparar y completar servicio                                    | servicio, cocina y supervisión          | `SERVICE_CHECKOUT / KITCHEN_PREP`                      | `BANDEJA_Y_SIGUIENTE_ACCION + CAMBIO_DE_ESTADO`                     | `IMPRESORA_OPCIONAL`                        | última reserva confirmada visible                          | `CANONICAL`               |

##### 11.7. Transporte y entregas
| Proceso                                           | Propietaria | Paso o grupo de pasos                                    | Ambito principal                  | Estación resuelta                                      | Interacción aprobada                                            | Perifericos por capacidad             | Contingencia o respaldo                            | Estado                    |
| ------------------------------------------------- | ----------- | -------------------------------------------------------- | --------------------------------- | ------------------------------------------------------ | --------------------------------------------------------------- | ------------------------------------- | -------------------------------------------------- | ------------------------- |
| `VPROC-0048` — Planear rutas, vehículos y carga   | `nexo`      | consolidar demanda, optimizar, asignar y publicar        | logística y supervisión           | `SUPERVISION_EXPO / NO_SHARED UX-ADMIN`                | `MAPA_O_LISTA + REVISION_GUIADA + APROBACION_CON_IMPACTO`       | `NINGUNO`                             | conservar plan anterior y cambios versionados      | `CONDITIONALLY_CANONICAL` |
| `VPROC-0049` — Ejecutar ruta y confirmar entregas | `nexo`      | validar carga y transferir custodia                      | despacho                          | `WAREHOUSE_FLOW + MOBILE_ROUTE`                        | `ESCANEO_Y_VERIFICACION + ENTREGA_Y_ACEPTACION`                 | `ESCANER_PREFERENTE; CAMARA_OPCIONAL` | lista controlada y folio de salida                 | `CANONICAL`               |
| `VPROC-0049`                                      | `nexo`      | navegar, registrar parada, entregar, rechazar o retornar | ruta y destino                    | `WAREHOUSE_FLOW + MOBILE_ROUTE`                        | `BANDEJA_Y_SIGUIENTE_ACCION + EVIDENCIA + ENTREGA_Y_ACEPTACION` | `CAMARA_OPCIONAL; UBICACION_OPCIONAL` | captura offline durable y sincronizacion posterior | `CANONICAL`               |
| `VPROC-0050` — Integrar entrega de tercero        | `pulso`     | enviar solicitud, recibir estados y conciliar            | servicio técnico                  | `NO_HUMAN`                                             | `EVENTO_AUTOMATICO`                                             | `NINGUNO`                             | reintento idempotente y reconciliación             | `NO_HUMAN_STATION`        |
| `VPROC-0050`                                      | `pulso`     | entregar al proveedor y resolver incidentes              | mostrador, despacho y supervisión | `SERVICE_CHECKOUT / WAREHOUSE_FLOW / SUPERVISION_EXPO` | `ENTREGA_Y_ACEPTACION + EXCEPCION_GUIADA`                       | `CAMARA_OPCIONAL; ESCANER_OPCIONAL`   | entrega interna controlada o bloqueo seguro        | `CONDITIONALLY_CANONICAL` |

##### 11.8. Finanzas y obligaciones
| Proceso                                                              | Propietaria | Paso o grupo de pasos                                      | Ambito principal     | Estación resuelta      | Interacción aprobada                            | Perifericos por capacidad | Contingencia o respaldo                                | Estado              |
| -------------------------------------------------------------------- | ----------- | ---------------------------------------------------------- | -------------------- | ---------------------- | ----------------------------------------------- | ------------------------- | ------------------------------------------------------ | ------------------- |
| `VPROC-0051` — Registrar hechos economicos desde eventos             | `numera`    | recibir, clasificar y registrar evento económico           | servicio técnico     | `NO_HUMAN`             | `EVENTO_AUTOMATICO`                             | `NINGUNO`                 | cola idempotente y cuarentena de evento invalido       | `NO_HUMAN_STATION`  |
| `VPROC-0051`                                                         | `numera`    | revisar excepción y conciliar                              | finanzas             | `NO_SHARED / UX-ADMIN` | `REVISION_GUIADA + APROBACION_CON_IMPACTO`      | `DOCUMENTO_OPCIONAL`      | no contabilizar sin evento o soporte valido            | `NO_SHARED_STATION` |
| `VPROC-0052` — Gestionar obligaciones y pagos a proveedores          | `numera`    | validar documento, aprobar, programar, pagar y conciliar   | finanzas y gerencia  | `NO_SHARED / UX-ADMIN` | `PASOS_GUIADOS + DOBLE_CONTROL`                 | `DOCUMENTO_OPCIONAL`      | retener pago y conservar instruccion                   | `NO_SHARED_STATION` |
| `VPROC-0053` — Gestionar cartera, cobro y recaudo                    | `numera`    | registrar obligación, cobrar, aplicar y conciliar          | finanzas y comercial | `NO_SHARED / UX-ADMIN` | `BANDEJA_Y_SIGUIENTE_ACCION + REVISION_GUIADA`  | `DOCUMENTO_OPCIONAL`      | mantener recaudo sin aplicar hasta resolver diferencia | `NO_SHARED_STATION` |
| `VPROC-0054` — Gestionar costos, distribucion, cierre y rentabilidad | `numera`    | consolidar entradas, calcular, revisar, aprobar y publicar | finanzas y gerencia  | `NO_SHARED / UX-ADMIN` | `REVISION_COMPARATIVA + APROBACION_CON_IMPACTO` | `NINGUNO`                 | conservar versión previa y calculo reproducible        | `NO_SHARED_STATION` |

##### 11.9. Instalaciones, marketing, tecnologia e información
| Proceso                                                              | Propietaria | Paso o grupo de pasos                                       | Ambito principal                 | Estación resuelta                                                              | Interacción aprobada                                          | Perifericos por capacidad              | Contingencia o respaldo                                               | Estado                    |
| -------------------------------------------------------------------- | ----------- | ----------------------------------------------------------- | -------------------------------- | ------------------------------------------------------------------------------ | ------------------------------------------------------------- | -------------------------------------- | --------------------------------------------------------------------- | ------------------------- |
| `VPROC-0055` — Gestionar instalaciones, limpieza, plagas y servicios | `nexo`      | reportar, planear, ejecutar, verificar y liberar            | todas las sedes e instalaciones  | `WAREHOUSE_FLOW / SUPERVISION_EXPO + MOBILE`                                   | `CHECKLIST + EVIDENCIA + CAMBIO_DE_ESTADO`                    | `CAMARA_OPCIONAL; MEDICION_SEGUN_CASO` | cierre temporal o proveedor alterno; folio de trabajo                 | `CANONICAL`               |
| `VPROC-0056` — Gestionar contenido y promociones                     | `aura`      | crear, revisar, aprobar, programar y publicar               | marketing y gerencia             | `NO_SHARED / UX-ADMIN`                                                         | `FORMULARIO_GUIADO + VISTA_PREVIA_DE_IMPACTO`                 | `ARCHIVO_MULTIMEDIA`                   | mantener versión anterior o pausar publicación                        | `NO_SHARED_STATION`       |
| `VPROC-0056`                                                         | `aura`      | publicar y medir por integración                            | servicio técnico                 | `NO_HUMAN`                                                                     | `EVENTO_AUTOMATICO`                                           | `NINGUNO`                              | reintento idempotente y retiro seguro                                 | `NO_HUMAN_STATION`        |
| `VPROC-0057` — Gestionar consultas y oportunidades digitales         | `aura`      | clasificar, asignar, responder y dar seguimiento            | marketing y comercial            | `NO_SHARED / UX-ADMIN`                                                         | `BANDEJA_Y_SIGUIENTE_ACCION + FORMULARIO_GUIADO`              | `ARCHIVO_OPCIONAL`                     | mantener caso con folio y canal de respuesta                          | `NO_SHARED_STATION`       |
| `VPROC-0058` — Gestionar solicitudes e incidentes tecnologicos       | `viso`      | reportar caso desde el punto afectado                       | cualquier sede o estación        | `SERVICE_CHECKOUT / KITCHEN_PREP / PRODUCTION_BATCH / WAREHOUSE_FLOW + MOBILE` | `FORMULARIO_CORTO + DIAGNOSTICO_GUIADO`                       | `CAMARA_OPCIONAL`                      | instrucciones seguras y escalamiento; no pedir configuración avanzada | `CANONICAL`               |
| `VPROC-0058`                                                         | `viso`      | diagnosticar, resolver, validar y documentar                | soporte y administración         | `NO_SHARED / UX-ADMIN`                                                         | `BANDEJA_Y_SIGUIENTE_ACCION + CHECKLIST`                      | `HERRAMIENTA_TECNICA_SEPARADA`         | workaround controlado y rollback                                      | `NO_SHARED_STATION`       |
| `VPROC-0059` — Gestionar ciclo de acceso tecnologico                 | `viso`      | solicitar, revisar, aprobar, provisionar, revisar y revocar | seguridad y administración       | `NO_SHARED / UX-ADMIN`                                                         | `FORMULARIO_GUIADO + DOBLE_CONTROL + VISTA_PREVIA_DE_IMPACTO` | `NINGUNO`                              | revocacion de emergencia y bloqueo seguro                             | `NO_SHARED_STATION`       |
| `VPROC-0060` — Gestionar documentos y evidencia                      | `viso`      | capturar evidencia desde operación                          | cualquier sede o área autorizada | `SERVICE_CHECKOUT / KITCHEN_PREP / PRODUCTION_BATCH / WAREHOUSE_FLOW + MOBILE` | `EVIDENCIA + CLASIFICACION_MINIMA`                            | `CAMARA_O_ARCHIVO_SEGUN_CASO`          | guardar cifrado y cargar después; no exponer entre actores            | `CONDITIONALLY_CANONICAL` |
| `VPROC-0060`                                                         | `viso`      | revisar, aprobar, retener y disponer                        | administración y control         | `NO_SHARED / UX-ADMIN`                                                         | `REVISION_GUIADA + APROBACION_CON_IMPACTO`                    | `NINGUNO`                              | bloqueo por retención y versión vinculada                             | `NO_SHARED_STATION`       |

##### 11.10. Mejora, continuidad, riesgos y procesos adicionales
| Proceso                                                               | Propietaria | Paso o grupo de pasos                                                         | Ambito principal                    | Estación resuelta                                                     | Interacción aprobada                                                | Perifericos por capacidad                   | Contingencia o respaldo                                              | Estado                    |
| --------------------------------------------------------------------- | ----------- | ----------------------------------------------------------------------------- | ----------------------------------- | --------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------- | -------------------------------------------------------------------- | ------------------------- |
| `VPROC-0061` — Gestionar medición, mejora y verificacion de resultado | `numera`    | definir indicador, analizar, decidir y verificar                              | gerencia y análisis                 | `NO_SHARED / UX-ADMIN`                                                | `REVISION_COMPARATIVA + APROBACION_CON_IMPACTO`                     | `NINGUNO`                                   | conservar línea base y resultado inconcluso                          | `NO_SHARED_STATION`       |
| `VPROC-0061`                                                          | `numera`    | consultar alertas y acciones de mejora                                        | supervisión                         | `SUPERVISION_EXPO`                                                    | `TABLERO + BANDEJA_Y_SIGUIENTE_ACCION`                              | `NINGUNO`                                   | última medición confirmada con fecha                                 | `CONDITIONALLY_CANONICAL` |
| `VPROC-0062` — Gestionar continuidad y recuperación                   | `viso`      | detectar, declarar, priorizar y coordinar respuesta                           | supervisión y gerencia              | `SUPERVISION_EXPO + MOBILE`                                           | `ALERTA_CRITICA + BANDEJA_Y_SIGUIENTE_ACCION + EXCEPCION_GUIADA`    | `SENALIZACION_OPCIONAL`                     | guía manual aprobada y canal alterno                                 | `CANONICAL`               |
| `VPROC-0062`                                                          | `viso`      | operar mínimo, recuperar y reconciliar                                        | todas las estaciones afectadas      | `SERVICE_CHECKOUT / KITCHEN_PREP / PRODUCTION_BATCH / WAREHOUSE_FLOW` | `MODO_CONTINGENCIA + RECUPERACION_GUIADA`                           | `SEGUN_CAPACIDAD`                           | folio manual u offline y reincorporacion controlada                  | `CANONICAL`               |
| `VPROC-0063` — Gestionar riesgos empresariales                        | `viso`      | identificar, valorar, tratar, aceptar y revisar                               | gerencia y control                  | `NO_SHARED / UX-ADMIN`                                                | `FORMULARIO_GUIADO + REVISION_COMPARATIVA + APROBACION_CON_IMPACTO` | `DOCUMENTO_OPCIONAL`                        | mantener riesgo abierto y escalado                                   | `NO_SHARED_STATION`       |
| `VPROC-0064` — Gestionar relaciones con asesores y autoridades        | `viso`      | recibir, asignar, preparar, aprobar, enviar y verificar respuesta             | administración, gerencia y asesores | `NO_SHARED / UX-ADMIN`                                                | `BANDEJA_Y_SIGUIENTE_ACCION + CHECKLIST + APROBACION_CON_IMPACTO`   | `DOCUMENTO_REQUERIDO_SEGUN_CASO`            | conservar vencimiento, acuse y evidencia                             | `NO_SHARED_STATION`       |
| `VPROC-0065` — Acompanar desempeño y desarrollo                       | `viso`      | definir objetivos, dar seguimiento, retroalimentar y decidir                  | trabajador y responsable autorizado | `NO_SHARED / UX-ADMIN PRIVADO`                                        | `FORMULARIO_GUIADO + REVISION_PRIVADA`                              | `NINGUNO`                                   | borrador privado y acceso mínimo                                     | `NO_SHARED_STATION`       |
| `VPROC-0066` — Entregar y controlar elementos de protección           | `viso`      | validar necesidad, reservar, entregar, aceptar, reemplazar y devolver         | bodega, SST y trabajador            | `WAREHOUSE_FLOW + MOBILE`                                             | `ESCANEO_Y_VERIFICACION + ENTREGA_Y_ACEPTACION`                     | `ESCANER_PREFERENTE; CAMARA_OPCIONAL`       | acta controlada y bloqueo si elemento no cumple                      | `CANONICAL`               |
| `VPROC-0067` — Gestionar kits y conjuntos                             | `nexo`      | definir y aprobar composicion                                                 | administración de inventario        | `NO_SHARED / UX-ADMIN`                                                | `FORMULARIO_GUIADO + REVISION_GUIADA`                               | `NINGUNO`                                   | versión previa permanece vigente                                     | `NO_SHARED_STATION`       |
| `VPROC-0067`                                                          | `nexo`      | armar, verificar, asignar, usar y devolver                                    | bodega y responsables               | `WAREHOUSE_FLOW + MOBILE`                                             | `ESCANEO_Y_VERIFICACION + CHECKLIST + ENTREGA_Y_ACEPTACION`         | `ESCANER_PREFERENTE; ETIQUETADORA_OPCIONAL` | conteo manual con folio y conciliación                               | `CANONICAL`               |
| `VPROC-0068` — Medir satisfacción del cliente                         | `pulso`     | preparar muestra e instrumento y analizar resultados                          | comercial y gerencia                | `NO_SHARED / UX-ADMIN`                                                | `FORMULARIO_GUIADO + REVISION_COMPARATIVA`                          | `NINGUNO`                                   | conservar sesgo, consentimiento y limitaciones                       | `NO_SHARED_STATION`       |
| `VPROC-0068`                                                          | `pulso`     | invitar y capturar respuesta                                                  | cliente en punto o canal propio     | `SERVICE_CHECKOUT / CLIENT_MOBILE`                                    | `QR_O_ENLACE + FORMULARIO_CORTO`                                    | `CAMARA_QR_OPCIONAL`                        | respuesta posterior por enlace; no obligar al trabajador a responder | `CONDITIONALLY_CANONICAL` |
| `VPROC-0069` — Gestionar presupuestos versionados                     | `numera`    | definir supuestos, consolidar, revisar, aprobar, vigilar y revisar proyección | finanzas y gerencia                 | `NO_SHARED / UX-ADMIN`                                                | `REVISION_COMPARATIVA + APROBACION_CON_IMPACTO`                     | `NINGUNO`                                   | conservar presupuesto base y crear nueva versión                     | `NO_SHARED_STATION`       |



---

#### 12. Reglas para procesos con varias estaciones

Un proceso puede recorrer varias estaciones. En esos casos:

1. cada work item conserva proceso, paso, objeto, versión y responsable;
2. el cambio de estación no crea una instancia nueva;
3. la entrega exige aceptación cuando cambia custodia o responsabilidad;
4. el receptor ve trabajo realizado, pendientes, evidencia y siguiente acción;
5. dos estaciones no pueden confirmar simultáneamente el mismo efecto;
6. la fuente de verdad permanece en la aplicación propietaria;
7. una proyección o impresion local no sustituye el estado canónico.

---

#### 13. Pasos administrativos y automaticos

`NO_SHARED / UX-ADMIN` es una decisión positiva, no un vacio. Protege privacidad, captura extensa, revisión comparativa, edicion masiva y decisiones sensibles que no deben ejecutarse en una tablet operativa compartida.

`NO_HUMAN` tampoco elimina responsabilidad. Todo paso automático conserva:

- comando o evento identificado;
- versión contractual;
- idempotencia;
- correlacion;
- reintento limitado;
- observabilidad;
- reconciliación;
- escalamiento a una bandeja humana cuando falle.

---

#### 14. Operación offline, falla y recuperación

Cada fila deberá materializar una de estas respuestas:

1. continuar localmente con cola durable;
2. continuar en modo degradado digital;
3. utilizar formato manual controlado;
4. cambiar a capacidad o equipo alterno;
5. bloquear de forma segura;
6. escalar con contexto suficiente.

La respuesta elegida dependera del proceso y paso. No existe un modo offline universal.

---

#### 15. Privacidad, accesibilidad y ambiente

Toda implementación derivada deberá:

- limpiar datos temporales al cambiar de trabajador;
- ocultar información no necesaria en vista pública;
- no depender solo de color o sonido;
- permitir tacto confiable en la condición física aplicable;
- evitar captura extensa caminando o con manos ocupadas;
- conservar lectura mínima y acción primaria visible;
- impedir que fotos, archivos o busquedas del actor anterior queden expuestos;
- diferenciar claramente exito, pendiente, error y resultado aun no confirmado.

---

#### 16. Capacidad humana y soporte

La matriz se aprueba bajo estas restricciones:

- no se contrata una persona para repartir trabajo ordinario;
- no se asigna un técnico permanente por sede, turno o estación;
- los responsables actuales pueden combinar facilitacion, observacion y soporte cuando no exista conflicto;
- las estaciones ofrecen diagnostico guiado de primer nivel;
- los problemas repetitivos generan corrección de producto, infraestructura o capacitacion;
- la necesidad de ayuda permanente se considera defecto, no modelo operativo objetivo.

---

#### 17. Gobierno de cambios

Todo cambio posterior deberá indicar:

```text
process_id
step_or_group
current_station_resolution
proposed_resolution
reason
risk
source_of_evidence
affected_sites
affected_components
migration_or_compatibility
pilot_requirement
approver
versión
```

Cambiar hardware por disponibilidad comercial no cambia automaticamente la matriz. Cambiar el contrato del paso, su riesgo o su consecuencia si exige nueva versión y revisión de requisitos.

---

#### 18. Habilitacion de diseño y código

Esta tarea habilita:

- `UX-ADMIN-001` a `UX-ADMIN-005`;
- `PROC-SCREEN-001` a `PROC-SCREEN-028` después del subbloque administrativo;
- prototipos tecnicos y componentes desacoplados;
- mocks de perifericos;
- contratos de adaptadores;
- pruebas unitarias y contractuales tempranas;
- planificación E5 posterior.

No habilita despliegue productivo ni compra definitiva. Cada paquete de implementación deberá declarar las filas de esta matriz que materializa y los `TREQ-*` que protege.

---

#### 19. Validación humana diferida

La sustitucion de evidencia aprobada en `UX-STATION-008` se conserva. Los pilotos posteriores deberán comprobar, como mínimo:

- identificación y cambio de trabajador;
- siguiente acción y prioridad;
- cantidades, unidades y presentaciones;
- escaneo y respaldo manual;
- mediciones obligatorias;
- pagos y resultados inciertos;
- entrega y aceptación;
- operación degradada;
- ergonomía en el puesto real;
- ausencia de dependencia de supervisión permanente.

Un hallazgo crítico podrá modificar la fila afectada sin invalidar automaticamente las demas filas que no compartan el mismo contrato o riesgo.

---

#### 20. Cobertura y consistencia

La matriz cubre exactamente `VPROC-0001` a `VPROC-0069` y no inventa `Centro de Distribucion` como sede física. Cada proceso tiene por lo menos una resolución; cada fila tiene estación o ausencia justificada, interacción, capacidad periferica, respaldo y estado.

`PROC-COVER-001` a `PROC-COVER-010` verificaran posteriormente que las pantallas y paquetes implementados no omitan ninguna fila aplicable.

---

#### Requisitos de prueba derivados

**Resultado:** GENERA 40 REQUISITOS DE PRUEBA.

Se incorporan `TREQ-PROC-981` a `TREQ-PROC-1020` al Registro Canónico completo.

Todos quedan en `IDENTIFICADO`. Su implementación y evidencia pertenecen a `UX-ADMIN-*`, `PROC-SCREEN-*`, paquetes E5, BLOQUE T, pilotos y BLOQUE U.

---

#### 21. Criterios de aceptación

- [x] Se cubren exactamente los 69 procesos.
- [x] Cada paso o grupo equivalente tiene estación o ausencia justificada.
- [x] Se distinguen pasos operativos, administrativos y automaticos.
- [x] Se conservan los cinco arquetipos aprobados.
- [x] Las variantes usan overlays y no duplican procesos.
- [x] Cada fila tiene interacción principal, periférico por capacidad y respaldo.
- [x] Pagos, mediciones, ajustes, identidad y handoffs conservan tratamiento especifico.
- [x] No se usa impresion, escaneo o almacenamiento local como prueba automática del efecto empresarial.
- [x] No se requiere supervisión o soporte permanente.
- [x] Los pasos administrativos se entregan a `UX-ADMIN-001` a `UX-ADMIN-005`.
- [x] Los pasos automaticos conservan contratos y reconciliación.
- [x] La validación humana queda vinculada a pilotos posteriores.
- [x] Se incorporan `TREQ-PROC-981` a `TREQ-PROC-1020`.
- [x] No se implementa código, hardware, Supabase ni despliegue.
- [x] `UX-ADMIN-001` permanece no iniciada.

---

#### 22. Resultado y continuidad

```text
UX-STATION-008 APROBADA
UX-STATION-009 APROBADA — PASS_WITH_CARRYOVER
UX-ADMIN-001 NO INICIADA
```

La continuidad documental pasa exclusivamente a:

```text
UX-ADMIN-001 — Inventariar tareas administrativas por dominio, frecuencia y complejidad
```


### ✅ UX-STATION-010 — Definir gramática de interacción operativa de lectura mínima

**Estado:** APROBADA

**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal

**Marcador exacto que reemplaza:** `### [ ] UX-STATION-010 — Definir gramática de interacción operativa de lectura mínima`

**Tarea anterior:** `UX-STATION-007 — Definir operación degradada, offline, contingencia y recuperación` — APROBADA

**Siguiente tarea reservada:** `UX-STATION-011 — Diseñar bandeja contextual de trabajo y siguiente acción` — NO INICIADA

**Validación posterior reservada:** `UX-STATION-008 — Prototipar alternativas con trabajadores reales`; `UX-STATION-009 — Aprobar la matriz proceso → paso → estación → interacción → periférico`

**Artefactos producidos:**

- `UX-STATION-INTERACTION-GRAMMAR-001`;
- `UX-STATION-OPERATIONAL-LEXICON-001`;
- `UX-STATION-ACTION-HIERARCHY-CONTRACT-001`;
- `UX-STATION-STATUS-SIGNAL-CONTRACT-001`;
- `UX-STATION-FEEDBACK-CONFIRMATION-CONTRACT-001`;
- `UX-STATION-ERROR-RECOVERY-GRAMMAR-001`;
- `UX-STATION-ACCESSIBILITY-SENSORY-CONTRACT-001`;
- `UX-STATION-GRAMMAR-VALIDATION-MATRIX-001`.

**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`

**Naturaleza:** contrato transversal de lenguaje, jerarquía, señales, controles, feedback y recuperación para superficies operativas; no diseño visual definitivo ni implementación de componentes

**Cambios en código, componentes, pantallas, navegación, traducciones productivas, aplicaciones, migraciones o Supabase:** no autorizados

---

#### 1. Propósito

Definir una gramática común para que cualquier trabajador pueda reconocer con rapidez:

1. dónde está;
2. quién está actuando;
3. qué trabajo tiene delante;
4. cuál es el estado real;
5. qué acción debe ejecutar ahora;
6. qué resultado producirá;
7. qué ocurrió después de actuar;
8. qué hacer cuando existe un bloqueo, error, duda o contingencia.

La gramática deberá disminuir lectura, memoria, capacitación técnica y decisiones irrelevantes sin ocultar información necesaria para operar con seguridad.

```text
LECTURA MÍNIMA
≠
INFORMACIÓN INCOMPLETA
```

```text
INTERFAZ SIMPLE
≠
PROCESO SIMPLIFICADO DE FORMA INSEGURA
```

```text
MISMA GRAMÁTICA
≠
MISMA PANTALLA PARA TODOS
```

---

#### 2. Restricción humana obligatoria

La interacción se diseñará para personas expertas en su oficio, pero que no necesariamente dominan conceptos tecnológicos, administrativos o de sistemas.

Por tanto:

- no se exigirá conocer nombres de servicios, tablas, colas, drivers, estados técnicos o códigos internos;
- no se dependerá de manuales extensos para ejecutar una acción frecuente;
- no se pedirá recordar secuencias que el sistema pueda guiar;
- no se presentarán simultáneamente decisiones que no correspondan al paso actual;
- no se utilizarán palabras técnicas cuando exista una expresión operacional precisa;
- la ayuda deberá aparecer en el punto de decisión, no únicamente en documentación externa;
- una acción crítica deberá poder explicarse con frases breves, ejemplos concretos y consecuencias visibles;
- el diseño deberá ser utilizable bajo presión, ruido, guantes, interrupciones y atención dividida cuando el perfil de estación lo exija.

La simplicidad no trasladará al trabajador validaciones, conciliaciones o decisiones que pertenecen al sistema, al supervisor o a un especialista.

---

#### 3. Unidad mínima de gramática

Cada interacción operativa se describirá mediante:

```text
CONTEXTO
+ OBJETO DE TRABAJO
+ ESTADO
+ INTENCIÓN
+ ACCIÓN
+ EFECTO ESPERADO
+ FEEDBACK
+ SIGUIENTE PASO
+ RECUPERACIÓN
```

No se diseñará un botón, mensaje, campo, ícono o gesto aislado sin conocer esa unidad.

Campos mínimos del contrato:

```text
grammar_rule_id
process_id
step_id
station_profile_id
surface_state
actor_requirement
work_object_type
work_object_reference
canonical_status
primary_intent
primary_action_label
secondary_actions[]
critical_information[]
confirmation_policy
feedback_policy
error_policy
recovery_action
help_entry
accessibility_modes[]
validation_questions[]
```

---

#### 4. Zonas semánticas de una superficie

La gramática reconoce estas zonas lógicas, aunque su posición visual definitiva se diseñe después:

| Zona                 | Contenido permitido                                                           | Regla                                                             |
| -------------------- | ----------------------------------------------------------------------------- | ----------------------------------------------------------------- |
| identidad y contexto | actor efectivo, estación, sede, área o zona relevante                         | visible cuando una confusión pueda afectar autoridad o atribución |
| objeto de trabajo    | pedido, lote, solicitud, mesa, recepción, pago, documento u otro recurso      | debe ser inequívoco antes de actuar                               |
| estado               | situación empresarial vigente y frescura                                      | no se sustituye por color o animación                             |
| siguiente acción     | acción primaria segura del paso                                               | debe destacar sobre acciones secundarias                          |
| información crítica  | cantidad, unidad, destino, vencimiento, restricciones o excepción             | solo la necesaria para decidir correctamente                      |
| acciones secundarias | consultar, pausar, corregir, escalar o abandonar según contrato               | no compiten visualmente con la acción primaria                    |
| feedback             | aceptación local, confirmación autoritativa, pendiente, falla o incertidumbre | debe distinguir intención enviada de efecto confirmado            |
| ayuda y recuperación | instrucción breve, alternativa, contacto o folio                              | aparece sin exigir abandonar el contexto                          |

`UX-STATION-011` organizará estas zonas dentro de la bandeja de trabajo y `UX-STATION-012` definirá su composición dinámica mediante componentes aprobados.

---

#### 5. Léxico operacional canónico

Cada concepto empresarial tendrá:

```text
canonical_term
plain_language_definition
approved_short_label
approved_long_label
allowed_synonyms_for_search
forbidden_ambiguous_terms[]
domain_owner
examples[]
```

Reglas:

1. La etiqueta visible utilizará el término canónico o una abreviación aprobada.
2. Los sinónimos podrán ayudar a buscar, pero no crearán múltiples nombres visibles para el mismo hecho.
3. Una misma palabra no representará estados diferentes dentro de una misma superficie.
4. Los términos físicos usados por los trabajadores podrán adoptarse cuando sean precisos y hayan sido validados.
5. Un término interno de software no se mostrará si el trabajador necesita entender un resultado empresarial.
6. La traducción o variante lingüística conservará la misma intención, efecto y nivel de riesgo.
7. Cambiar una palabra crítica exigirá análisis de impacto, actualización de ayudas y regresión.

Ejemplos de distinciones que deberán conservarse:

```text
SOLICITAR ≠ APROBAR ≠ EJECUTAR ≠ CONFIRMAR
RECIBIR ≠ CONTAR ≠ ACEPTAR ≠ CONCILIAR
GUARDAR BORRADOR ≠ REGISTRAR HECHO ≠ COMPLETAR PROCESO
CANCELAR ≠ CORREGIR ≠ REVERSAR ≠ ANULAR
ENVIADO ≠ RECIBIDO ≠ APLICADO ≠ CONCILIADO
```

---

#### 6. Forma de las acciones

La etiqueta ordinaria seguirá:

```text
VERBO CONCRETO
+ OBJETO
+ CALIFICADOR SOLO CUANDO EVITA AMBIGÜEDAD
```

Ejemplos válidos:

- `Registrar cantidad`;
- `Confirmar recepción`;
- `Enviar a producción`;
- `Imprimir etiqueta`;
- `Pausar preparación`;
- `Solicitar corrección`;
- `Entregar pedido`;
- `Reanudar conteo`.

Se evitarán como acción principal, salvo contexto demostrado:

- `OK`;
- `Sí`;
- `No`;
- `Listo`;
- `Aceptar` sin objeto;
- `Procesar`;
- `Gestionar`;
- `Continuar` cuando existan varios efectos posibles;
- `Guardar` cuando en realidad se publica, confirma o ejecuta;
- íconos sin etiqueta para acciones no universales o críticas.

La etiqueta describirá el efecto empresarial, no el evento técnico de interfaz.

---

#### 7. Jerarquía de acciones

Cada estado tendrá como máximo una acción primaria inequívoca.

| Clase                | Uso                                                              | Tratamiento                                          |
| -------------------- | ---------------------------------------------------------------- | ---------------------------------------------------- |
| `PRIMARY_NEXT`       | siguiente acción ordinaria segura                                | mayor prioridad visual y de foco                     |
| `REQUIRED_SECONDARY` | acción necesaria que no constituye avance principal              | visible sin competir con la primaria                 |
| `OPTIONAL_SUPPORT`   | consulta, ayuda o detalle                                        | disponible por divulgación progresiva                |
| `EXCEPTION`          | corrección, rechazo, pausa, sustitución o escalamiento           | separada del flujo ordinario                         |
| `DESTRUCTIVE`        | cancelación, anulación, descarte o reversión con pérdida posible | lenguaje explícito y protección proporcional         |
| `BLOCKED`            | acción conocida pero no permitida ahora                          | muestra causa y resolución; no simula disponibilidad |
| `SYSTEM_ONLY`        | efecto automático sin acción humana                              | no se representa como botón ejecutable               |

Reglas:

1. No se usarán dos acciones primarias con igual jerarquía.
2. Una acción frecuente no se ocultará detrás de menús genéricos.
3. Una excepción no se volverá dominante por ser técnicamente fácil de implementar.
4. Una acción no autorizada no aparecerá habilitada para fallar después.
5. La ausencia de permiso, contexto, capacidad o condición se explicará de forma accionable cuando sea seguro revelarla.
6. Las acciones masivas deberán mostrar alcance, selección, exclusiones y efecto antes de ejecutarse.

---

#### 8. Divulgación progresiva

La lectura mínima se logrará por capas:

1. **capa inmediata:** objeto, estado, dato crítico y siguiente acción;
2. **capa de verificación:** cantidades, unidad, destino, restricciones y evidencia necesaria;
3. **capa de excepción:** corrección, rechazo, conflicto, contingencia y escalamiento;
4. **capa de detalle:** historial, auditoría, diagnósticos permitidos y metadatos.

No se ocultará detrás de una capa secundaria aquello que pueda cambiar la decisión principal, el riesgo, la autorización o el efecto.

El trabajador no deberá recorrer varias pantallas para confirmar datos que caben razonablemente en la decisión actual.

---

#### 9. Gramática de estados

Los estados visibles se derivarán del proceso empresarial y no de nombres técnicos internos.

Conjunto transversal mínimo:

```text
NOT_STARTED
READY
IN_PROGRESS
WAITING
PENDING_CONFIRMATION
COMPLETED
BLOCKED
FAILED
RESULT_UNKNOWN
OFFLINE
CONFLICT
CANCELLED
EXPIRED
```

Cada dominio podrá especializarlos sin contradecir su significado transversal.

Todo estado declarará:

- nombre corto;
- explicación en lenguaje operativo;
- quién o qué debe actuar;
- antigüedad y frescura relevantes;
- acciones permitidas;
- condición de salida;
- tratamiento cuando se desconoce el resultado.

Estado y acción no utilizarán el mismo lenguaje de forma confusa. Por ejemplo, `Recibido` como estado no sustituye `Confirmar recepción` como acción.

---

#### 10. Señalización redundante y accesible

Ningún estado crítico dependerá exclusivamente de:

- color;
- posición;
- animación;
- sonido;
- vibración;
- forma;
- un ícono no etiquetado.

La señal combinará, según el contexto:

```text
TEXTO BREVE
+ FORMA O ÍCONO
+ JERARQUÍA
+ COLOR
+ SEÑAL SENSORIAL OPCIONAL
```

El sonido y la vibración podrán reforzar una confirmación o alerta, pero no serán el único canal porque puede existir ruido, discapacidad, volumen desactivado o dispositivo sin esa capacidad.

---

#### 11. Gramática de información crítica

Antes de una acción con efecto deberán ser visibles, cuando apliquen:

- objeto exacto;
- cantidad y unidad;
- origen y destino;
- sede, área o zona relevante;
- lote, presentación o variante;
- actor o responsable;
- fecha, hora, vigencia o antigüedad;
- restricción;
- efecto irreversible o externo;
- existencia de pendientes o conflictos.

Los números no se mostrarán sin unidad cuando la unidad pueda cambiar el significado.

Los valores predeterminados deberán ser seguros, visibles y reversibles antes de confirmar. Una selección heredada de otra operación no se conservará silenciosamente.

---

#### 12. Gramática de captura

La captura deberá:

1. solicitar únicamente información no derivable de forma segura;
2. utilizar el control adecuado para el dato y el entorno;
3. mostrar unidad, rango y formato antes del error;
4. preservar lo ingresado ante fallas recuperables;
5. distinguir cero, vacío, desconocido y no aplica;
6. evitar transcribir información ya disponible de una fuente confiable;
7. permitir corrección antes de producir el efecto;
8. confirmar lecturas automáticas cuando exista riesgo de asociación incorrecta.

Para escáner, cámara, báscula, sensor o periférico se mostrará:

```text
CAPTURANDO
LECTURA RECIBIDA
OBJETO INTERPRETADO
VALIDACIÓN
ACEPTADA / RECHAZADA / DUPLICADA / INCIERTA
```

Un sonido de escáner no probará por sí solo que el hecho empresarial fue registrado.

---

#### 13. Confirmaciones proporcionales al riesgo

No se confirmará cada acción rutinaria, porque la confirmación constante produce habituación y errores.

Política mínima:

| Tipo                               | Confirmación                                                                    |
| ---------------------------------- | ------------------------------------------------------------------------------- |
| reversible y de bajo riesgo        | ejecución directa con feedback y opción de corrección                           |
| reversible pero sensible           | revisión breve del efecto o undo controlado                                     |
| irreversible, externo o financiero | confirmación explícita con objeto, cantidad, destino y efecto                   |
| destructivo                        | verbo destructivo específico, consecuencia y protección contra toque accidental |
| resultado incierto                 | no se ofrece reintento ciego; se consulta estado o escala                       |
| doble control                      | identidad separada del aprobador y alcance exacto                               |

La pregunta genérica `¿Está seguro?` no será suficiente para una acción crítica.

---

#### 14. Prevención de doble ejecución

La gramática deberá impedir que latencia, doble toque, escaneo repetido o reanudación produzcan efectos duplicados.

La superficie distinguirá:

```text
INTENCIÓN CAPTURADA
SOLICITUD ENVIADA
ACEPTACIÓN TÉCNICA
EFECTO EMPRESARIAL CONFIRMADO
RESULTADO DESCONOCIDO
```

Mientras una intención siga activa:

- la acción no se volverá a habilitar sin regla;
- el trabajador verá que el sistema continúa trabajando;
- un timeout no se presentará automáticamente como fracaso;
- la reanudación conservará la referencia idempotente;
- un reintento requerirá conocer si es seguro.

---

#### 15. Feedback y cierre perceptible

Toda acción producirá feedback inmediato, pero deberá diferenciarse:

| Feedback                  | Significado                                   |
| ------------------------- | --------------------------------------------- |
| reconocimiento local      | el dispositivo capturó la intención           |
| pendiente remoto          | el efecto espera respuesta o sincronización   |
| confirmación autoritativa | la fuente de verdad aceptó el efecto          |
| confirmación física       | periférico o proceso físico reportó resultado |
| validación empresarial    | el proceso alcanzó el estado esperado         |
| resultado desconocido     | no puede afirmarse éxito o fracaso            |

El cierre mostrará qué cambió y cuál es el siguiente paso. No se utilizará una animación breve como única evidencia de éxito.

---

#### 16. Gramática de espera, latencia y frescura

La superficie distinguirá:

- cargando por primera vez;
- actualizando información existente;
- enviando una intención;
- esperando una dependencia;
- pendiente offline;
- reintentando de forma segura;
- resultado desconocido;
- información desactualizada.

Cuando la edad del dato importe, deberá mostrarse en lenguaje comprensible, por ejemplo:

```text
Actualizado hace 2 minutos
Pendiente de sincronizar
Datos vigentes hasta las 14:35
```

No se borrará información útil durante una actualización ni se sustituirá un estado conocido por un spinner indefinido.

---

#### 17. Gramática de errores y bloqueos

Un mensaje operativo deberá responder, según aplique:

```text
QUÉ OCURRIÓ
QUÉ NO OCURRIÓ
QUÉ SE CONSERVÓ
POR QUÉ IMPORTA
QUÉ PUEDE HACER AHORA
QUIÉN DEBE AYUDAR
REFERENCIA DEL CASO
```

Ejemplo estructural:

```text
No se confirmó la recepción.
La cantidad ingresada quedó guardada como borrador.
Revise la conexión y vuelva a intentar una sola vez.
Si continúa, reporte el folio RX-2048.
```

No serán aceptables como único mensaje:

- `Error`;
- `Algo salió mal`;
- `500`;
- `RPC failed`;
- `Network request failed`;
- `Invalid payload`;
- un código sin explicación y acción.

Los detalles técnicos se conservarán para diagnóstico autorizado, no como instrucción principal al trabajador.

---

#### 18. Vacío, cero resultados, filtro y falla

La interfaz diferenciará:

| Situación                        | Mensaje esperado                             |
| -------------------------------- | -------------------------------------------- |
| no existen elementos             | estado vacío legítimo y qué ocurrirá después |
| no existen resultados del filtro | filtro activo y opción para retirarlo        |
| aún no se cargaron datos         | estado de espera o carga                     |
| no se pudo consultar             | falla y acción segura                        |
| no existe autorización           | bloqueo sin exponer información innecesaria  |
| información incompleta           | faltante exacto y propietario de resolución  |

Una lista vacía no probará que no existe trabajo.

---

#### 19. Offline, degradación y contingencia

Los modos definidos en `UX-STATION-007` deberán utilizar la misma gramática central y añadir señales inequívocas de:

- modo activo;
- limitaciones;
- datos posiblemente desactualizados;
- acciones permitidas y prohibidas;
- pendientes locales;
- necesidad de folio o formulario;
- persona o canal de ayuda;
- condición de retorno.

El modo offline no imitará visualmente al modo normal cuando el efecto todavía no está confirmado.

---

#### 20. Interrupción y reanudación

Al reanudar después de bloqueo, cambio de aplicación, cambio de actor, pérdida de energía o suspensión, la superficie mostrará:

- proceso y paso;
- objeto de trabajo;
- actor propietario;
- cambios ya confirmados;
- datos en borrador;
- acciones pendientes;
- resultados desconocidos;
- siguiente acción segura.

No se asumirá que el último botón visible antes de la interrupción sigue siendo válido.

---

#### 21. Identidad, contexto y privacidad

La gramática deberá mostrar el actor efectivo y el contexto suficiente cuando una confusión pueda atribuir una acción a otra persona, sede, área, zona o recurso.

No mostrará por defecto:

- permisos internos completos;
- identificadores técnicos innecesarios;
- datos personales ajenos;
- secretos;
- información sensible no requerida para el paso.

En estaciones compartidas, el cambio de actor deberá limpiar etiquetas, datos, ayudas, búsquedas, selecciones y mensajes que no correspondan al nuevo contexto.

---

#### 22. Ergonomía física y lectura a distancia

La validación deberá considerar:

- distancia real de lectura;
- tamaño y densidad;
- contraste;
- iluminación y reflejo;
- movimiento;
- guantes;
- humedad o grasa;
- postura;
- mano dominante;
- precisión táctil;
- teclado o escáner;
- ruido;
- tiempo disponible para mirar la pantalla.

No se utilizarán objetivos táctiles pequeños, hover obligatorio, gestos ocultos o secuencias de precisión fina para acciones ordinarias de una estación operativa.

---

#### 23. Accesibilidad y modalidades alternativas

Toda gramática crítica deberá conservar significado con:

- navegación por teclado cuando el perfil la admita;
- lector de pantalla cuando corresponda;
- escalado de texto;
- alto contraste;
- reducción de movimiento;
- interacción táctil;
- escáner o captura automática;
- ayudas no dependientes de audio;
- lenguaje comprensible.

Los íconos familiares podrán reducir texto repetitivo, pero una acción crítica o poco frecuente conservará etiqueta o explicación accesible.

---

#### 24. Ayuda contextual y escalamiento

La ayuda se organizará en tres niveles:

1. **microayuda:** una frase junto al dato o acción;
2. **guía del paso:** pocas instrucciones, ejemplo y criterio de finalización;
3. **escalamiento:** canal, información que se enviará y folio.

La ayuda no obligará a abandonar el trabajo ni a repetir información que la estación ya conoce.

Cuando se escale, el sistema preparará contexto técnico seguro para soporte sin pedir al trabajador que interprete logs o copie secretos.

---

#### 25. Selección múltiple y acciones masivas

Antes de una acción sobre varios elementos se mostrará:

- cantidad seleccionada;
- alcance territorial y temporal;
- elementos excluidos y motivo;
- efecto común;
- excepciones;
- posibilidad de ejecución parcial;
- tratamiento del fallo intermedio;
- evidencia de resultados individuales.

La etiqueta `Seleccionar todo` declarará si cubre solo la página, el filtro o el conjunto completo autorizado.

---

#### 26. Consistencia transversal y especialización

La gramática transversal fijará:

- jerarquía de acciones;
- semántica de estados;
- anatomía de mensajes;
- feedback;
- confirmaciones;
- tratamiento de espera, error, offline e incertidumbre;
- señales accesibles.

Cada aplicación conservará su vocabulario empresarial y podrá especializar componentes, pero no cambiar silenciosamente el significado de una acción o estado transversal.

Una persona que cambie entre NEXO, FOGO, PULSO, ORIGO, VISO, ANIMA u otra superficie deberá reconocer el patrón sin aprender un sistema de señales completamente distinto.

---

#### 27. Fechas, cantidades, unidades y localización

La gramática deberá:

- usar formatos de fecha y hora comprensibles para el contexto;
- distinguir fecha empresarial, fecha de captura y fecha de sincronización;
- mostrar zona horaria cuando pueda existir ambigüedad;
- mantener separadores y decimales coherentes;
- mostrar moneda y unidad;
- conservar precisión requerida;
- impedir que una localización cambie el valor canónico;
- tratar texto largo, nombres, tildes, Unicode y truncamiento sin ocultar identidad crítica.

---

#### 28. Telemetría de fricción sin vigilancia invasiva

La validación futura podrá medir:

- errores de selección;
- retrocesos;
- cancelaciones;
- tiempo por paso;
- ayuda solicitada;
- reintentos;
- dobles toques;
- bloqueos;
- abandonos;
- recuperación;
- necesidad de asistencia.

No se recopilarán grabaciones, pulsaciones, datos personales o vigilancia individual innecesaria para medir usabilidad.

La telemetría indicará dónde simplificar el sistema, no servirá para culpar automáticamente al trabajador.

---

#### 29. Matriz obligatoria por proceso y paso

Para `VPROC-0001` a `VPROC-0069`, cada paso con interacción deberá declarar:

```text
process_id
step_id
station_profile_id
actor
work_object
canonical_term_set
surface_state
critical_information
primary_action
secondary_actions
status_signal
capture_grammar
confirmation_policy
feedback_policy
error_policy
offline_variant
resume_policy
help_policy
accessibility_requirements
validation_scenarios
```

Un paso sin interacción humana se marcará `SYSTEM_ONLY` y explicará qué estado o resultado deberá comunicar a las superficies consumidoras.

---

#### 30. Criterios para prototipo con trabajadores

`UX-STATION-008` deberá medir como mínimo:

- identificación correcta del objeto y estado;
- comprensión de la acción primaria;
- tiempo hasta la primera acción correcta;
- errores de interpretación;
- necesidad de leer ayuda;
- recuerdo después de una interrupción;
- distinción entre pendiente, completado, fallido y desconocido;
- capacidad de corregir;
- desempeño con ruido, guantes o movilidad aplicables;
- carga percibida;
- asistencia requerida;
- términos que los trabajadores no entienden.

No bastará preguntar si la pantalla “les gusta”.

---

#### 31. Responsabilidades posteriores

| Materia                             | Tarea propietaria                        |
| ----------------------------------- | ---------------------------------------- |
| bandeja y priorización del trabajo  | `UX-STATION-011`                         |
| composición dinámica de componentes | `UX-STATION-012`                         |
| prototipo con trabajadores          | `UX-STATION-008`                         |
| aprobación de matriz final          | `UX-STATION-009`                         |
| pantallas definitivas               | `PROC-SCREEN-001` a `PROC-SCREEN-028`    |
| cobertura integral de pantallas     | `PROC-COVER-001` a `PROC-COVER-010`      |
| implementación por paquetes         | BLOQUE E5                                |
| infraestructura de pruebas          | BLOQUE T                                 |
| capacitación y soporte              | `TI-DOM-013`; `TI-UX-006`; `E5-GATE-006` |

Esta tarea no crea un sistema de diseño visual completo ni sustituye las tareas posteriores.

---

#### 32. Reglas de rechazo

La gramática será rechazada para un paso cuando:

1. no pueda reconocerse el objeto o estado;
2. existan varias acciones primarias equivalentes;
3. una etiqueta no describa el efecto;
4. una acción crítica use `OK`, `Aceptar`, `Continuar` o un ícono ambiguo;
5. color, sonido o memoria sean el único canal;
6. un número carezca de unidad relevante;
7. una confirmación crítica no muestre efecto;
8. una acción rutinaria tenga confirmaciones innecesarias;
9. una espera permita doble ejecución;
10. un timeout se declare fracaso sin certeza;
11. una lista vacía o error sean indistinguibles;
12. offline parezca operación confirmada;
13. un cambio de actor conserve contexto ajeno;
14. la ayuda requiera conocimientos técnicos;
15. el flujo dependa de gestos ocultos o precisión incompatible con la estación;
16. no exista recuperación o escalamiento;
17. no pueda probarse con trabajadores reales;
18. el mismo término cambie de significado entre aplicaciones sin justificación.

---

#### Requisitos de prueba derivados

**Resultado:** GENERA 40 REQUISITOS DE PRUEBA.

Se incorporan al registro canónico:

`TREQ-PROC-821` a `TREQ-PROC-860`.

Los requisitos protegen:

- propósito de lectura mínima;
- unidad y zonas semánticas;
- léxico y etiquetas;
- jerarquía y divulgación progresiva;
- estados y señalización;
- datos, captura y periféricos;
- confirmación y prevención de duplicados;
- feedback, espera, error e incertidumbre;
- offline, reanudación, identidad y privacidad;
- ergonomía, accesibilidad y ayuda;
- selección masiva, localización y consistencia transversal;
- telemetría y validación con trabajadores;
- cobertura de los 69 procesos.

El detalle completo reside en `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`.

---

#### 33. Criterios de aceptación

- [ ] La lectura mínima está definida como reducción de carga, no como ocultamiento de información crítica.
- [ ] La unidad mínima de gramática contiene contexto, objeto, estado, acción, efecto, feedback y recuperación.
- [ ] Existe léxico canónico con sinónimos y términos prohibidos.
- [ ] Las acciones usan verbo y objeto concretos.
- [ ] Cada estado admite una sola acción primaria.
- [ ] Estados, acciones y resultados no se confunden.
- [ ] La señalización no depende de un único canal sensorial.
- [ ] Cantidades, unidades, origen, destino y restricciones se muestran cuando afectan la decisión.
- [ ] Captura automática y periféricos distinguen lectura de registro empresarial.
- [ ] Confirmaciones y protecciones son proporcionales al riesgo.
- [ ] Latencia, timeout y doble toque no producen doble ejecución.
- [ ] Feedback local, remoto, físico y empresarial están diferenciados.
- [ ] Errores y bloqueos ofrecen una acción segura.
- [ ] Vacío, filtro, carga y falla son distinguibles.
- [ ] Offline y resultado desconocido no imitan éxito.
- [ ] Reanudación conserva actor, objeto, estado y pendientes.
- [ ] Privacidad y limpieza entre actores están definidas.
- [ ] Se cubren ergonomía física y accesibilidad.
- [ ] La ayuda es contextual y no exige formación técnica.
- [ ] Acciones masivas muestran alcance y resultados.
- [ ] La gramática transversal permite especialización sin cambiar semántica.
- [ ] Los 69 procesos tienen matriz por paso o justificación `SYSTEM_ONLY`.
- [ ] Los escenarios para `UX-STATION-008` miden comprensión y ejecución real.
- [ ] `UX-STATION-011` permanece sin iniciar.
- [ ] No se implementaron pantallas, componentes, código, traducciones, migraciones ni cambios en Supabase.

---

#### 34. Resultado y continuidad

```text
UX-STATION-007 APROBADA
UX-STATION-010 APROBADA
UX-STATION-011 NO INICIADA
```

La continuidad documental pasa exclusivamente a:

```text
UX-STATION-011 — Diseñar bandeja contextual de trabajo y siguiente acción
```

No se inicia `UX-STATION-011` hasta la aprobación expresa de esta tarea y una solicitud explícita de continuidad.


### ✅ UX-STATION-011 — Diseñar bandeja contextual de trabajo y siguiente acción

**Estado:** APROBADA

**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal

**Marcador exacto que reemplaza:** `### [ ] UX-STATION-011 — Diseñar bandeja contextual de trabajo y siguiente acción`

**Tarea anterior:** `UX-STATION-010 — Definir gramática de interacción operativa de lectura mínima` — APROBADA

**Siguiente tarea reservada:** `UX-STATION-012 — Definir composición dinámica de pasos mediante componentes operativos aprobados` — NO INICIADA

**Validación posterior reservada:** `UX-STATION-008 — Prototipar alternativas con trabajadores reales`; `UX-STATION-009 — Aprobar la matriz proceso → paso → estación → interacción → periférico`

**Artefactos producidos:**

- `UX-STATION-CONTEXTUAL-WORK-TRAY-CONTRACT-001`;
- `UX-STATION-WORK-ITEM-SCHEMA-001`;
- `UX-STATION-NEXT-ACTION-RESOLUTION-CONTRACT-001`;
- `UX-STATION-PRIORITY-AND-ORDERING-POLICY-001`;
- `UX-STATION-ASSIGNMENT-CLAIM-HANDOFF-CONTRACT-001`;
- `UX-STATION-BLOCKER-ESCALATION-CONTRACT-001`;
- `UX-STATION-OFFLINE-WORK-TRAY-CONTRACT-001`;
- `UX-STATION-WORK-TRAY-VALIDATION-MATRIX-001`.

**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`

**Naturaleza:** contrato transversal para presentar, ordenar, asignar, reclamar, ejecutar, bloquear, transferir, reanudar y cerrar trabajo operativo; no diseño visual definitivo ni implementación de colas

**Cambios en código, componentes, pantallas, navegación, algoritmos productivos, datos, migraciones, RLS, RPC, Supabase, dispositivos o dotación:** no autorizados

---

#### 1. Propósito

Diseñar una bandeja operativa que permita a cada trabajador reconocer, con la menor lectura y supervisión posibles:

1. qué trabajo puede ejecutar ahora;
2. cuál elemento requiere atención primero;
3. por qué aparece en la bandeja;
4. qué condición lo habilita o bloquea;
5. cuál es la siguiente acción segura;
6. qué resultado se espera;
7. quién conserva la responsabilidad;
8. qué ocurrió si el trabajo fue interrumpido, transferido o ejecutado offline.

La bandeja deberá convertir estados y dependencias complejos en una secuencia operativa comprensible, sin trasladar al trabajador decisiones de autorización, conciliación, priorización técnica o diagnóstico que pertenecen al sistema o a responsables especializados.

```text
BANDEJA DE TRABAJO
≠
TABLERO GERENCIAL
```

```text
NOTIFICACIÓN
≠
TRABAJO EJECUTABLE
```

```text
ELEMENTO VISIBLE
≠
ACCIÓN AUTORIZADA
```

```text
PRIORIDAD AUTOMÁTICA
≠
SUPERVISIÓN HUMANA PERMANENTE
```

---

#### 2. Restricción humana y operativa obligatoria

La solución se diseñará para una organización donde cada persona domina su oficio, pero no necesariamente conceptos de software, colas, sincronización, estados distribuidos o soporte técnico.

Por tanto:

- no se exigirá que un supervisor reparta manualmente cada unidad de trabajo;
- no se exigirá un coordinador observando continuamente todas las bandejas;
- no se necesitará un técnico por sede, área, turno o estación;
- el sistema resolverá automáticamente la mayoría de asignaciones, prioridades, bloqueos y siguientes acciones ordinarias;
- la supervisión se concentrará en excepciones, conflictos, vencimientos, riesgos y trabajo sin propietario;
- la bandeja explicará los bloqueos con lenguaje operativo y señalará el responsable o canal correcto;
- la persona no deberá conocer la aplicación propietaria, tabla, servicio o integración que originó el trabajo;
- una falla técnica no se transformará en una instrucción de diagnóstico avanzado para el trabajador;
- la capacitación ordinaria se basará en patrones repetibles, ejemplos y práctica breve;
- cualquier necesidad de dotación adicional deberá justificarse fuera de esta tarea mediante capacidad, riesgo, duración y costo verificables.

El diseño preferirá automatización, autoasignación gobernada, escalamiento por excepción y soporte centralizado antes que aumentar permanentemente la carga humana.

---

#### 3. Dependencias canónicas

Esta tarea consume y no reemplaza:

- `PROC-CAT-001` a `PROC-CAT-020`;
- `PROC-ACTOR-001` a `PROC-ACTOR-010`;
- `UX-STATION-001` a `UX-STATION-007`;
- `UX-STATION-010`;
- `NFR-REQ-001` a `NFR-REQ-011`;
- el catálogo de procesos `VPROC-0001` a `VPROC-0069`;
- el modelo de actor efectivo, contexto, autorización, dispositivo compartido, idempotencia, auditoría y segregación ya aprobado;
- los contratos de operación degradada, offline, contingencia y recuperación;
- la regla de lectura mínima y una única acción primaria por estado.

Esta tarea no define todavía la biblioteca final de componentes. Esa composición corresponde a `UX-STATION-012`.

---

#### 4. Separación conceptual obligatoria

Se mantendrán separados:

| Concepto           | Significado                                   | No equivale a               |
| ------------------ | --------------------------------------------- | --------------------------- |
| evento empresarial | hecho ocurrido en un dominio                  | trabajo pendiente           |
| notificación       | comunicación sobre un hecho                   | orden de ejecución          |
| alerta             | condición que exige atención                  | unidad de trabajo ordinaria |
| mensaje            | comunicación entre actores o sistemas         | transición de proceso       |
| work item          | representación operativa de trabajo pendiente | registro fuente completo    |
| siguiente acción   | intención actualmente elegible                | autorización permanente     |
| asignación         | responsabilidad propuesta o vigente           | permiso                     |
| claim              | reserva temporal para ejecutar                | propiedad definitiva        |
| handoff            | transferencia trazable                        | reasignación silenciosa     |
| contador           | resumen de elementos visibles y frescos       | fuente de verdad            |
| estado leído       | reconocimiento visual                         | trabajo completado          |
| prioridad          | orden empresarial calculado                   | urgencia aislada            |

Una misma causa podrá producir evento, notificación y work item, pero cada artefacto conservará propósito, propietario y ciclo de vida distintos.

---

#### 5. Unidad mínima: `WorkItem`

Cada fila de la bandeja representará una unidad operativa explícita:

```text
WORK ITEM
+ OBJETO EMPRESARIAL
+ PROCESO Y PASO
+ ESTADO REAL
+ ACTOR O POOL ELEGIBLE
+ TERRITORIO
+ PRIORIDAD
+ SIGUIENTE ACCIÓN
+ BLOQUEOS
+ FRESCURA
+ TRAZABILIDAD
```

Contrato conceptual mínimo:

```text
work_item_id
work_item_version
source_domain
source_reference
process_id
process_version
step_id
business_object_type
business_object_id
business_object_label
current_business_state
surface_state
site_id
area_id
zone_id
station_profile_constraints[]
eligible_actor_scope
assigned_actor_id
assigned_pool_id
claim_status
claim_owner_id
claim_expires_at
priority_class
priority_score
priority_reasons[]
urgency_deadline
business_deadline
age_started_at
next_action_id
next_action_label
next_action_eligibility
next_action_effect
blocking_reasons[]
dependency_references[]
risk_flags[]
freshness_state
source_updated_at
last_reconciled_at
offline_state
pending_command_ids[]
handoff_reference
sensitive_display_policy
created_at
closed_at
```

La bandeja no copiará el expediente completo del objeto empresarial. Consumirá una proyección mínima, versionada y autorizada.

---

#### 6. Identidad estable y deduplicación

`work_item_id` identificará una obligación operativa concreta y no una tarjeta visual efímera.

Reglas:

1. la misma obligación no aparecerá duplicada por recarga, cambio de filtro, reintento o reconexión;
2. dos pasos distintos del mismo proceso podrán generar work items distintos cuando requieran actores, condiciones o acciones diferentes;
3. una actualización mantendrá historial de versión y no creará silenciosamente un elemento nuevo;
4. la bandeja deberá detectar duplicados semánticos producidos por integraciones o reintentos;
5. cerrar visualmente una tarjeta no eliminará el trabajo fuente;
6. un elemento reabierto conservará vínculo con su ciclo previo.

---

#### 7. Fuente autoritativa

El estado del work item se derivará de hechos y contratos del proceso propietario.

No serán fuente autoritativa:

- estado local de React;
- contador almacenado en el cliente;
- posición visual;
- tarjeta arrastrada;
- marca `read`;
- caché sin versión;
- notificación push;
- correo o mensaje;
- almacenamiento local sin reconciliación;
- selección de sede o área enviada por el cliente;
- nombre del rol;
- estación compartida por sí sola.

La bandeja podrá mantener proyecciones para rendimiento, pero deberá declarar origen, versión, frescura y mecanismo de reconstrucción.

---

#### 8. Resolución de la siguiente acción

La siguiente acción se resolverá como intersección de:

```text
ESTADO DEL PROCESO
∩ PRERREQUISITOS CUMPLIDOS
∩ ACTOR EFECTIVO
∩ AUTORIZACIÓN VIGENTE
∩ TERRITORIO DEL RECURSO
∩ ESTACIÓN Y CAPACIDADES
∩ MODALIDAD OPERATIVA
∩ CONECTIVIDAD Y FRESCURA
∩ REGLAS DE SEGREGACIÓN
```

La interfaz no inventará una acción porque exista un botón disponible.

El contrato de resolución devolverá como mínimo:

```text
next_action_id
eligibility = ELIGIBLE | BLOCKED | REQUIRES_STEP_UP | REQUIRES_HANDOFF | SYSTEM_ONLY
label
business_effect
required_confirmation
required_capabilities[]
blocking_reasons[]
recheck_triggers[]
expires_at
```

La autorización se reevaluará en el servidor al ejecutar; la elegibilidad mostrada no será un permiso durable.

---

#### 9. Una acción primaria

Cada estado de work item tendrá como máximo una acción `PRIMARY_NEXT`.

Podrán existir:

- acciones secundarias de consulta;
- corrección controlada;
- handoff;
- escalamiento;
- cancelación autorizada;
- acción excepcional con step-up;
- acciones automáticas del sistema.

No competirán visualmente con la siguiente acción ordinaria.

Cuando no exista una acción elegible, la bandeja mostrará el motivo y la condición de desbloqueo, no un botón inactivo sin explicación.

---

#### 10. Familias canónicas de bandeja

La bandeja podrá organizar trabajo en familias semánticas consistentes:

| Familia                   | Contenido                                                          |
| ------------------------- | ------------------------------------------------------------------ |
| `READY_NOW`               | trabajo ejecutable por el actor y estación actuales                |
| `IN_PROGRESS`             | trabajo ya iniciado y no concluido                                 |
| `PENDING_CONFIRMATION`    | efecto solicitado sin resultado empresarial confirmado             |
| `WAITING_DEPENDENCY`      | espera legítima de persona, insumo, tiempo, evento o sistema       |
| `BLOCKED_ACTION_REQUIRED` | bloqueo que requiere una intervención identificada                 |
| `HANDOFF_PENDING`         | transferencia emitida o por aceptar                                |
| `OFFLINE_LOCAL`           | trabajo capturado localmente pendiente de sincronización           |
| `CONFLICT_REVIEW`         | discrepancia que impide continuar automáticamente                  |
| `RESULT_UNKNOWN`          | efecto incierto que exige consulta o conciliación                  |
| `COMPLETED_RECENT`        | cierre reciente visible solo cuando ayude a confirmar el resultado |

No se crearán pestañas diferentes únicamente por estado técnico interno.

---

#### 11. Priorización empresarial

La prioridad no se basará únicamente en orden de llegada o fecha de creación.

Podrá considerar, según el proceso:

- seguridad de personas y alimentos;
- integridad financiera;
- cliente presente o esperando;
- perecibilidad;
- vencimiento empresarial;
- dependencia de otros pasos;
- impacto en producción, despacho o servicio;
- riesgo de inventario;
- compromiso externo;
- antigüedad;
- ventana de ejecución;
- capacidad disponible;
- severidad de un bloqueo;
- necesidad de segregación o aprobación.

Cada prioridad mostrará una explicación operacional breve y conservará razones auditables.

Un peso numérico interno no se mostrará al trabajador salvo que aporte valor real.

---

#### 12. Prioridad, urgencia y vencimiento

Se distinguirán:

```text
PRIORIDAD
→ qué debe atenderse primero

URGENCIA
→ cuánto tiempo existe para actuar

VENCIMIENTO
→ momento o condición después del cual cambia el riesgo o la elegibilidad
```

Un elemento urgente no desplazará automáticamente un trabajo crítico si el modelo empresarial determina lo contrario.

Los vencimientos deberán indicar zona horaria, fuente y consecuencia.

---

#### 13. Orden determinista y estable

La bandeja deberá conservar un orden explicable y estable.

Reglas:

- la recarga no reordenará arbitrariamente elementos equivalentes;
- los empates usarán criterios deterministas;
- un elemento no saltará continuamente por cambios mínimos de score;
- cambios materiales podrán reposicionarlo con señal discreta;
- el actor podrá entender por qué un elemento subió o bajó;
- no se permitirá manipular prioridad mediante una fecha enviada por el cliente;
- el orden respetará filtros autorizados sin cambiar el estado fuente.

---

#### 14. Frescura y datos desactualizados

Cada work item declarará:

- momento de actualización de la fuente;
- momento de última reconciliación;
- estado `FRESH`, `AGING`, `STALE`, `OFFLINE_SNAPSHOT` o `UNKNOWN`;
- acciones que siguen siendo seguras;
- acciones bloqueadas por falta de frescura;
- disparadores de actualización.

La bandeja no presentará una acción como disponible cuando la información necesaria esté vencida o no pueda verificarse.

---

#### 15. Contadores y resúmenes

Todo contador deberá corresponder al mismo alcance, autorización, filtro y frescura que la lista visible.

Se prohibirá:

- mostrar un número global que incluya elementos que el actor no puede consultar;
- mantener un badge desactualizado después de completar o transferir trabajo;
- contar notificaciones como work items;
- inferir `0` cuando falló la consulta;
- usar el contador como única prueba de existencia;
- exponer información sensible mediante cantidades agregadas no autorizadas.

---

#### 16. Bandeja personal y pool compartido

La solución distinguirá:

| Modalidad   | Regla                                                            |
| ----------- | ---------------------------------------------------------------- |
| personal    | responsabilidad asignada a un actor específico                   |
| pool        | trabajo disponible para un conjunto elegible                     |
| estación    | trabajo condicionado por capacidades o zona de una estación      |
| equipo      | trabajo compartido por una unidad operativa con reglas de claim  |
| supervisión | excepciones visibles por alcance, no trabajo ordinario duplicado |

Un elemento de pool no aparecerá como asignado a todos simultáneamente.

---

#### 17. Asignación, claim y lease

Cuando varios trabajadores puedan ejecutar el mismo elemento:

1. el sistema podrá autoasignar, permitir claim o mantener pool según el proceso;
2. el claim deberá ser atómico;
3. dos actores no podrán creer válidamente que poseen exclusividad simultánea;
4. el lease tendrá vencimiento y renovación gobernados;
5. perder conectividad no liberará de inmediato un trabajo con efectos pendientes;
6. una expiración no duplicará comandos ya enviados;
7. la liberación manual conservará razón y auditoría;
8. una reasignación forzada requerirá autoridad y manejo de borradores.

---

#### 18. Concurrencia y trabajo simultáneo

La bandeja deberá reconocer:

- otro actor trabajando;
- actor desconocido por desconexión;
- edición o ejecución incompatible;
- acciones compatibles en paralelo;
- bloqueo optimista o pesimista según riesgo;
- versión del objeto;
- conflicto al confirmar;
- resultado ya completado por otro actor.

La respuesta `ya fue realizado` deberá mostrar el resultado vigente y evitar repetir el efecto.

---

#### 19. Handoff y transferencia

El handoff definido en `UX-STATION-004` aparecerá como transición explícita:

```text
EMISOR
→ OBJETO Y ESTADO
→ RESPONSABILIDAD TRANSFERIDA
→ RECEPTOR O POOL
→ CONDICIONES PENDIENTES
→ ACEPTACIÓN O RECHAZO
→ RECEIPT
```

No se transferirá silenciosamente trabajo con borradores, comandos pendientes, resultados desconocidos o datos sensibles sin una política explícita.

El emisor deberá saber si el receptor aceptó, rechazó o dejó vencer el handoff.

---

#### 20. Cambio de actor en estación compartida

Al cambiar de trabajador:

- se retirará la bandeja personal anterior;
- se conservarán pendientes locales bajo su actor original;
- no se heredarán selecciones, filtros privados, borradores ni autorizaciones;
- los work items de pool se recalcularán para el nuevo actor;
- claims vigentes seguirán su política de lease y transferencia;
- el nuevo actor no podrá confirmar acciones iniciadas por otro sin regla de takeover;
- la pantalla no revelará trabajo sensible del actor anterior.

---

#### 21. Lectura, visto y completado

Los estados de comunicación y ejecución permanecerán separados:

```text
MOSTRADO
≠ LEÍDO
≠ RECONOCIDO
≠ ACEPTADO
≠ INICIADO
≠ COMPLETADO
≠ VALIDADO
```

Marcar como leído nunca cerrará un work item empresarial.

Ocultar una notificación tampoco cancelará el trabajo que la originó.

---

#### 22. Dependencias y bloqueos

Cada bloqueo declarará:

```text
blocking_reason_code
mensaje operativo
propietario de resolución
condición de desbloqueo
momento estimado, si existe
acción local segura
canal de escalamiento
referencia de dependencia
```

No se mostrará únicamente `Bloqueado`, `Error` o `No disponible`.

Los bloqueos automáticos se retirarán por hechos verificables, no por refrescar la página.

---

#### 23. Esperas legítimas

`WAITING_DEPENDENCY` distinguirá espera de:

- tiempo o ventana;
- insumo;
- producción;
- transporte;
- cliente;
- aprobación;
- validación;
- integración;
- periférico;
- sincronización;
- proveedor externo.

La espera no consumirá atención constante. La bandeja notificará cuando cambie la condición o se supere un umbral.

---

#### 24. Supervisión por excepción

La vista de supervisión se limitará a:

- trabajo sin propietario;
- vencido o próximo a vencer;
- bloqueos prolongados;
- riesgo alto;
- conflictos;
- fallos repetidos;
- resultados desconocidos;
- sobrecarga de un pool;
- handoffs rechazados o vencidos;
- desviaciones de capacidad.

No duplicará toda la bandeja ordinaria de cada trabajador.

El diseño deberá permitir que una sola persona coordine varias áreas cuando el volumen y el riesgo lo permitan, sin obligarla a asignar manualmente cada actividad.

---

#### 25. Escalamiento mínimo y dirigido

El escalamiento deberá:

1. identificar el tipo de ayuda;
2. sugerir el canal correcto;
3. adjuntar contexto seguro ya conocido;
4. evitar pedir logs, secretos o códigos técnicos al trabajador;
5. generar folio cuando corresponda;
6. indicar qué puede seguir haciendo mientras espera;
7. notificar la resolución;
8. cerrar o reactivar el work item de forma trazable.

Una misma persona podrá asumir coordinación y soporte básico si está capacitada, pero el sistema no dependerá de esa coincidencia para funcionar.

---

#### 26. Capacidad y límites de trabajo en curso

La bandeja deberá identificar sobrecarga sin convertirla automáticamente en una exigencia de más personal.

Podrá aplicar:

- límite de work in progress;
- tamaño de lote;
- reserva de capacidad;
- redistribución entre pools compatibles;
- secuenciación por estación;
- pausa de trabajo no prioritario;
- agrupación de acciones repetitivas;
- escalamiento de capacidad.

Una recomendación de dotación requerirá evidencia de volumen, tiempos, variabilidad, riesgo y alternativas de automatización o rediseño.

---

#### 27. Búsqueda, filtros y vistas

Los filtros servirán para localizar trabajo, no para cambiar autoridad o estado.

Deberán:

- mostrar claramente que están activos;
- permitir volver al alcance operativo recomendado;
- conservar criterios autorizados;
- distinguir `sin resultados` de `sin trabajo`;
- funcionar con paginación o virtualización;
- mantener orden estable;
- no ocultar silenciosamente elementos críticos;
- admitir búsqueda por referencias humanas permitidas;
- no depender de identificadores técnicos memorizados.

---

#### 28. Offline y trabajo local

En modo offline la bandeja distinguirá:

- snapshot disponible;
- work items habilitados offline;
- acciones prohibidas;
- nuevos registros locales;
- comandos pendientes;
- resultado local no confirmado;
- posibles conflictos;
- actor y estación originales;
- momento de última sincronización;
- condición para volver al modo normal.

No mezclará trabajo remoto confirmado con trabajo local pendiente sin señal inequívoca.

---

#### 29. Reconciliación y retorno

Al reconectar:

1. se actualizará la fuente antes de proponer acciones incompatibles;
2. se consultará el resultado de comandos inciertos;
3. se deduplicarán intenciones mediante idempotencia;
4. se detectarán cambios realizados por otros actores;
5. se conservarán datos locales hasta confirmar su incorporación o rechazo;
6. los conflictos se dirigirán a una revisión concreta;
7. la bandeja explicará qué quedó completado, pendiente, rechazado o duplicado;
8. no se borrará evidencia por el solo hecho de sincronizar.

---

#### 30. Resultado desconocido

Un work item con `RESULT_UNKNOWN`:

- no ofrecerá repetición ciega de la acción;
- mostrará que el efecto puede haber ocurrido;
- permitirá consultar, reconciliar o escalar;
- conservará idempotency key, actor, contexto, dispositivo y tiempo;
- bloqueará acciones incompatibles;
- saldrá del estado solo por evidencia suficiente.

---

#### 31. Interrupción y reanudación

Al reanudar se mostrará:

- objeto;
- paso;
- actor propietario;
- última acción confirmada;
- borradores;
- comandos pendientes;
- bloqueo o dependencia;
- versión vigente;
- siguiente acción recalculada.

No se restaurará automáticamente una acción destructiva o confirmación vencida.

---

#### 32. Acciones masivas

Una acción masiva deberá declarar:

- conjunto exacto;
- filtro y alcance;
- elementos no elegibles;
- resultado esperado;
- atomicidad o parcialidad;
- orden de ejecución;
- tratamiento de fallos;
- posibilidad de cancelación;
- evidencia por elemento;
- reconciliación.

No se habilitará una acción masiva solo porque los elementos compartan una etiqueta visual.

---

#### 33. Privacidad y minimización

La bandeja mostrará únicamente datos requeridos para identificar y ejecutar el trabajo.

Aplicará:

- masking contextual;
- revelado progresivo autorizado;
- limpieza al cambiar de actor;
- protección de contadores sensibles;
- separación entre datos operativos y personales;
- restricción de vistas de supervisión;
- retención mínima de proyecciones locales;
- ausencia de información sensible en títulos de notificación cuando no sea necesaria.

---

#### 34. Accesibilidad y lectura mínima

La bandeja deberá ser operable mediante las modalidades aprobadas para la estación y conservar:

- una acción primaria reconocible;
- orden lógico de foco;
- objetivos táctiles adecuados;
- señales no dependientes solo de color;
- etiquetas accesibles;
- densidad adaptable;
- lectura a distancia cuando aplique;
- soporte para teclado, lector de pantalla o escáner según perfil;
- mensajes breves con detalle disponible;
- estabilidad visual durante actualizaciones.

La simplificación no ocultará prioridades, riesgos, unidades, cantidades o consecuencias.

---

#### 35. Telemetría sin vigilancia invasiva

La mejora de la bandeja podrá medir de forma agregada:

- tiempo hasta la primera acción correcta;
- elementos ignorados por orden incorrecto;
- claims fallidos;
- conflictos;
- bloqueos;
- escalamiento;
- ayuda solicitada;
- reintentos;
- abandonos;
- cambios de prioridad;
- carga por pool;
- resultados desconocidos;
- recuperación offline.

No se utilizará para clasificar automáticamente a trabajadores, vigilar cada movimiento o inferir desempeño individual sin finalidad y gobierno explícitos.

---

#### 36. Estados vacíos, fallas y ausencia de trabajo

La bandeja diferenciará:

| Estado             | Significado                                      |
| ------------------ | ------------------------------------------------ |
| `EMPTY_CONFIRMED`  | no existe trabajo en el alcance consultado       |
| `FILTER_EMPTY`     | el filtro actual no encuentra resultados         |
| `LOADING`          | todavía no existe resultado                      |
| `STALE`            | existe snapshot, pero puede estar desactualizado |
| `QUERY_FAILED`     | no pudo confirmarse la lista                     |
| `UNAUTHORIZED`     | el actor no puede consultar ese alcance          |
| `CONTEXT_REQUIRED` | falta actor, sede, área, zona o estación válida  |

Una falla de consulta nunca se mostrará como bandeja vacía.

---

#### 37. Ayuda contextual

Cada work item podrá ofrecer:

1. explicación breve de por qué está aquí;
2. criterio de finalización;
3. dato o ejemplo necesario;
4. causa de bloqueo;
5. procedimiento de contingencia aplicable;
6. canal de escalamiento.

La ayuda no obligará a abandonar la bandeja ni a navegar por documentación extensa para una acción frecuente.

---

#### 38. Pruebas con trabajadores reales

`UX-STATION-008` deberá comprobar, como mínimo:

- reconocimiento del trabajo prioritario;
- comprensión de por qué está primero;
- selección de la siguiente acción correcta;
- distinción entre personal, pool y supervisión;
- claim y liberación;
- handoff;
- bloqueo y escalamiento;
- interrupción y reanudación;
- offline y reconciliación;
- resultado desconocido;
- búsqueda y filtros;
- carga cognitiva;
- necesidad de ayuda;
- cantidad de supervisión real requerida.

No bastará validar estética o preferencia.

---

#### 39. Matriz obligatoria por proceso y paso

Para `VPROC-0001` a `VPROC-0069`, cada paso deberá declarar:

```text
process_id
process_version
step_id
work_item_required
work_item_identity_rule
source_domain
business_object
eligible_actor_scope
assignment_mode
pool_id
claim_policy
handoff_policy
priority_class
priority_reasons
urgency_deadline
ordering_tiebreaker
next_action_rule
blocking_reasons
waiting_conditions
station_constraints
capability_constraints
freshness_policy
offline_policy
reconciliation_policy
sensitive_display_policy
help_policy
supervision_exception
validation_scenarios
```

Un paso que no deba aparecer en bandeja se marcará `NO_WORK_ITEM` y justificará cómo se comunica su resultado o excepción.

---

#### 40. Responsabilidades posteriores

| Materia                                                   | Tarea propietaria                        |
| --------------------------------------------------------- | ---------------------------------------- |
| componentes operativos y composición dinámica             | `UX-STATION-012`                         |
| prototipo con trabajadores                                | `UX-STATION-008`                         |
| matriz final proceso-paso-estación-interacción-periférico | `UX-STATION-009`                         |
| pantallas operativas definitivas                          | `PROC-SCREEN-001` a `PROC-SCREEN-028`    |
| cobertura de pantallas                                    | `PROC-COVER-001` a `PROC-COVER-010`      |
| algoritmos, colas y persistencia                          | paquetes de implementación de BLOQUE E5  |
| pruebas y regresión                                       | BLOQUE T y BLOQUE U                      |
| capacitación y soporte                                    | `TI-DOM-013`; `TI-UX-006`; `E5-GATE-006` |
| continuidad permanente                                    | BLOQUE AC                                |

Esta tarea no autoriza crear colas, cron jobs, tablas, workers, componentes, dashboards ni algoritmos productivos.

---

#### 41. Reglas de rechazo

La bandeja será rechazada si:

1. exige asignación manual ordinaria para funcionar;
2. depende de supervisión humana permanente;
3. mezcla notificaciones con trabajo ejecutable;
4. muestra acciones no autorizadas como elegibles;
5. oculta la razón de prioridad o bloqueo;
6. duplica trabajo por recarga, claim o sincronización;
7. permite dos claims exclusivos simultáneos;
8. confunde leído con completado;
9. muestra `0` cuando falló la consulta;
10. reintenta resultados desconocidos sin consulta;
11. hereda trabajo sensible al cambiar de actor;
12. exige conocimientos técnicos para escalar;
13. usa métricas para vigilancia invasiva;
14. no posee modalidad offline o contingencia donde sea necesaria;
15. no cubre los 69 procesos.

---

#### Requisitos de prueba derivados

Esta tarea genera los requisitos:

- `TREQ-PROC-861` a `TREQ-PROC-900`.

---

#### 42. Criterios de aceptación

- [ ] Se distingue work item, evento, notificación, alerta, mensaje y siguiente acción.
- [ ] Existe contrato mínimo versionable de `WorkItem`.
- [ ] La siguiente acción se resuelve por estado, actor, autorización, territorio, estación, capacidades, frescura y segregación.
- [ ] Cada estado posee como máximo una acción primaria.
- [ ] Prioridad, urgencia y vencimiento se mantienen separados.
- [ ] El orden es determinista, explicable y estable.
- [ ] Contadores y listas comparten alcance, autorización y frescura.
- [ ] Se definen bandeja personal, pool, estación, equipo y supervisión.
- [ ] Claim, lease, concurrencia, handoff y takeover están gobernados.
- [ ] El cambio de actor no filtra trabajo, datos o autorización del anterior.
- [ ] Leído no equivale a completado.
- [ ] Bloqueos, esperas y escalamiento tienen propietario y condición de cierre.
- [ ] La supervisión se concentra en excepciones.
- [ ] No se requiere técnico ni coordinador permanente por sede o estación.
- [ ] La capacidad se trata antes de recomendar aumento de dotación.
- [ ] Offline, reconciliación y resultado desconocido están definidos.
- [ ] Se protege privacidad y se evita vigilancia invasiva.
- [ ] Se definen pruebas con trabajadores reales.
- [ ] Los 69 procesos tienen matriz o justificación `NO_WORK_ITEM`.
- [ ] `UX-STATION-012` permanece sin iniciar.
- [ ] No se implementó código, datos, infraestructura ni cambios físicos.

---

#### 43. Resultado y continuidad

```text
UX-STATION-010 APROBADA
UX-STATION-011 APROBADA
UX-STATION-012 NO INICIADA
UX-STATION-008 NO INICIADA
UX-STATION-009 NO INICIADA
```

`UX-STATION-011` define el contrato documental de bandeja y siguiente acción. No demuestra todavía que el diseño funcione con trabajadores reales ni aprueba la matriz final.

La siguiente tarea canónica es:

```text
UX-STATION-012 — Definir composición dinámica de pasos mediante componentes operativos aprobados
```


### ✅ UX-STATION-012 — Definir composición dinámica de pasos mediante componentes operativos aprobados

**Estado:** APROBADA

**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal

**Marcador exacto que reemplaza:** `### [ ] UX-STATION-012 — Definir composición dinámica de pasos mediante componentes operativos aprobados`

**Tarea anterior:** `UX-STATION-011 — Diseñar bandeja contextual de trabajo y siguiente acción` — APROBADA

**Siguiente tarea reservada:** `UX-STATION-008 — Prototipar alternativas con trabajadores reales` — NO INICIADA

**Aprobación posterior reservada:** `UX-STATION-009 — Aprobar la matriz proceso → paso → estación → interacción → periférico`

**Artefactos producidos:**

- `UX-STATION-OPERATIONAL-COMPONENT-CATALOG-001`;
- `UX-STATION-DYNAMIC-COMPOSITION-MANIFEST-001`;
- `UX-STATION-COMPONENT-STATE-CONTRACT-001`;
- `UX-STATION-COMPONENT-DATA-AND-COMMAND-CONTRACT-001`;
- `UX-STATION-COMPONENT-COMPATIBILITY-MATRIX-001`;
- `UX-STATION-COMPONENT-LIFECYCLE-AND-VERSIONING-001`;
- `UX-STATION-COMPONENT-FALLBACK-CONTRACT-001`;
- `UX-STATION-COMPONENT-VALIDATION-MATRIX-001`.

**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`, por paso con interacción humana o superficie operativa

**Naturaleza:** contrato semántico, declarativo y versionado para componer superficies operativas a partir de componentes permitidos; no biblioteca implementada, constructor visual, pantalla definitiva ni motor productivo

**Cambios en código, componentes ejecutables, aplicaciones, rutas, esquemas remotos, tablas, migraciones, RLS, RPC, Supabase, hardware o despliegues:** no autorizados

---

#### 1. Propósito

Definir cómo cada paso operativo podrá materializarse mediante una composición controlada de componentes semánticos, reutilizables y versionados, sin construir una pantalla distinta y artesanal para cada combinación de proceso, sede, actor, estación o estado.

La composición deberá permitir que el trabajador encuentre una experiencia estable, predecible y de lectura mínima, mientras el sistema adapta lo necesario según:

1. proceso y versión;
2. paso y estado empresarial;
3. work item y objeto afectado;
4. actor efectivo y autorización vigente;
5. sede, área, zona y estación;
6. modalidad de interacción;
7. capacidades y periféricos disponibles;
8. conectividad, sincronización y contingencia;
9. privacidad, accesibilidad y riesgo;
10. resultado de la acción anterior.

```text
COMPOSICIÓN DINÁMICA
≠
PANTALLA ARBITRARIA GENERADA DESDE DATOS
```

```text
COMPONENTE VISIBLE
≠
ACCIÓN AUTORIZADA
```

```text
REUTILIZACIÓN
≠
UNIFORMIDAD CIEGA ENTRE PROCESOS DIFERENTES
```

---

#### 2. Resultado documental aprobado

Esta tarea aprueba el **contrato semántico** de los componentes y de su composición.

No aprueba todavía:

- una implementación React, React Native o nativa;
- un paquete de diseño productivo;
- una pantalla concreta;
- una configuración remota de producción;
- una versión visual final;
- la idoneidad con trabajadores reales;
- la matriz final proceso-paso-estación-interacción-periférico.

Los contratos definidos aquí quedan `CONTRACT_APPROVED`. Sus implementaciones futuras deberán pasar prototipo, pruebas, paquete, release y evidencia antes de utilizarse en producción.

---

#### 3. Dependencias canónicas

Esta tarea consume y no reemplaza:

- `PROC-CAT-001` a `PROC-CAT-020`;
- `PROC-ACTOR-001` a `PROC-ACTOR-010`;
- `UX-STATION-001` a `UX-STATION-007`;
- `UX-STATION-010` y su gramática de lectura mínima;
- `UX-STATION-011` y su contrato de bandeja, work item y siguiente acción;
- `NFR-REQ-001` a `NFR-REQ-011`;
- el catálogo de procesos `VPROC-0001` a `VPROC-0069`;
- identidad, contexto, autorización, segregación, idempotencia, auditoría, privacidad, offline y recuperación ya aprobados.

`UX-STATION-008` validará los prototipos con trabajadores reales. `UX-STATION-009` aprobará la matriz final. `PROC-SCREEN-001` a `PROC-SCREEN-028` diseñarán las pantallas definitivas después de esas decisiones.

---

#### 4. Separación conceptual obligatoria

| Concepto                     | Significado                                                      | No equivale a                |
| ---------------------------- | ---------------------------------------------------------------- | ---------------------------- |
| componente semántico         | unidad con propósito, entradas, estados, salidas y restricciones | archivo de código específico |
| implementación de componente | realización técnica para una plataforma                          | contrato canónico            |
| instancia de componente      | uso concreto dentro de un paso                                   | componente nuevo             |
| manifiesto de composición    | declaración versionada de componentes y relaciones               | lógica empresarial libre     |
| regla de visibilidad         | condición para presentar información                             | autorización                 |
| regla de habilitación        | condición de experiencia previa al comando                       | decisión final de servidor   |
| comando                      | intención empresarial identificada                               | evento visual                |
| estado visual                | representación del estado real                                   | fuente de verdad             |
| slot                         | zona semántica de la superficie                                  | posición absoluta o pixel    |
| variante                     | adaptación permitida del mismo contrato                          | semántica diferente          |
| plantilla                    | composición reusable                                             | pantalla universal           |

---

#### 5. Principio de biblioteca cerrada

La superficie solo podrá utilizar componentes cuyo identificador y versión existan en el catálogo canónico.

Se prohíbe:

- cargar componentes ejecutables desde una base de datos;
- ejecutar JavaScript, expresiones, plantillas o fórmulas arbitrarias recibidas del servidor;
- interpretar HTML no confiable como control operativo;
- permitir que un administrador cree comandos nuevos mediante un constructor visual;
- usar nombres de componentes libres sin esquema;
- introducir una variante que cambie silenciosamente el efecto empresarial;
- importar un componente remoto sin paquete, firma, versión y release aprobados.

La configuración podrá seleccionar y parametrizar contratos permitidos, pero no crear comportamiento ejecutable nuevo.

---

#### 6. Catálogo semántico inicial

El catálogo documental inicial incluirá, como mínimo:

| ID semántico         | Componente                | Responsabilidad                                    |
| -------------------- | ------------------------- | -------------------------------------------------- |
| `OPC-CONTEXT-001`    | contexto persistente      | actor, sede, área, zona, estación y modo           |
| `OPC-ACTOR-001`      | identidad del actor       | mostrar actor efectivo y cambio seguro             |
| `OPC-CONNECTION-001` | conexión y sincronización | estado online, degradado, offline y pendientes     |
| `OPC-WORK-001`       | identidad del trabajo     | work item, objeto, proceso y paso                  |
| `OPC-STATE-001`      | estado empresarial        | estado real, frescura y significado                |
| `OPC-RISK-001`       | riesgo o bloqueo          | advertencia, causa, responsable y resolución       |
| `OPC-ACTION-001`     | acción primaria           | siguiente intención segura y efecto                |
| `OPC-ACTION-002`     | acciones secundarias      | consultar, pausar, corregir, escalar o salir       |
| `OPC-TEXT-001`       | captura textual breve     | dato libre permitido y validado                    |
| `OPC-QUANTITY-001`   | cantidad y unidad         | valor, unidad, rango, precisión y conversión       |
| `OPC-SELECTION-001`  | selección simple          | elegir una opción versionada                       |
| `OPC-SELECTION-002`  | selección múltiple        | elegir conjunto con límites y significado          |
| `OPC-SCAN-001`       | captura por escáner       | interpretar identificador y confirmar objeto       |
| `OPC-CAMERA-001`     | captura por cámara        | evidencia o lectura autorizada                     |
| `OPC-MEASURE-001`    | medición periférica       | obtener valor, unidad, origen y estabilidad        |
| `OPC-CHECKLIST-001`  | lista operativa           | confirmar condiciones sin simular resultado        |
| `OPC-REASON-001`     | motivo estructurado       | registrar excepción, corrección o rechazo          |
| `OPC-CONFIRM-001`    | confirmación reforzada    | consecuencia, objeto, alcance y actor              |
| `OPC-HANDOFF-001`    | transferencia             | origen, destino, pendientes y aceptación           |
| `OPC-OFFLINE-001`    | pendiente local           | estado, autoría, sincronización y conflicto        |
| `OPC-PERIPHERAL-001` | capacidad física          | disponibilidad, reserva, salud y alternativa       |
| `OPC-RECEIPT-001`    | resultado y recibo        | resultado empresarial, referencia y siguiente paso |
| `OPC-HELP-001`       | ayuda y escalamiento      | instrucción breve, canal y contexto                |
| `OPC-PRIVACY-001`    | protección visual         | ocultamiento, revelado y limpieza                  |

La existencia de este catálogo no obliga a mostrar todos los componentes en todos los pasos.

---

#### 7. Contrato mínimo de un componente

Cada componente semántico deberá declarar:

```text
component_id
component_version
semantic_name
purpose
allowed_slots[]
input_schema
output_schema
supported_surface_states[]
supported_station_profiles[]
supported_modalities[]
required_capabilities[]
optional_capabilities[]
validation_contract
command_contract
privacy_policy
accessibility_contract
offline_contract
fallback_contract
actor_change_policy
focus_policy
telemetry_contract
error_contract
compatibility_range
deprecation_state
test_references[]
approval_references[]
```

Un campo sin contrato no podrá recibir semántica implícita desde una pantalla concreta.

---

#### 8. Manifiesto de composición

Cada paso con superficie componible declarará un manifiesto versionado:

```text
composition_manifest_id
composition_manifest_version
status
process_id
process_version
step_id
step_version
work_item_contract_version
surface_contract_version
supported_station_profiles[]
supported_modalities[]
required_context[]
component_instances[]
primary_action_instance_id
secondary_action_instance_ids[]
capability_requirements[]
privacy_policy
accessibility_policy
offline_policy
fallback_policy
state_mapping
telemetry_policy
validation_scenarios[]
approval_references[]
```

El manifiesto será declarativo. No contendrá código, consultas SQL, secretos, permisos escritos manualmente ni fórmulas ejecutables arbitrarias.

---

#### 9. Instancia de componente

Cada entrada de `component_instances[]` declarará:

```text
instance_id
component_id
component_version
slot
semantic_order
cardinality
input_binding
output_binding
visibility_predicate
experience_enablement_predicate
required
sensitive
reset_policy
retain_policy
fallback_instance_id
dependency_instance_ids[]
```

`input_binding` y `output_binding` usarán contratos conocidos. No podrán apuntar a cualquier propiedad interna del sistema ni escribir directamente en tablas.

---

#### 10. Slots semánticos

La superficie utilizará un orden conceptual estable:

1. `PERSISTENT_CONTEXT` — actor, lugar, estación, conectividad y modo;
2. `BLOCKING_STATE` — riesgos, bloqueos y condiciones de detención;
3. `WORK_IDENTITY` — objeto, proceso, paso y estado;
4. `STEP_CONTENT` — datos, captura, verificación o evidencia necesaria;
5. `PRIMARY_ACTION` — una sola acción primaria;
6. `SECONDARY_SUPPORT` — corrección, pausa, ayuda o escalamiento;
7. `RESULT_AND_RECEIPT` — resultado, referencia y siguiente paso.

La adaptación visual podrá reorganizar espacio, pero no alterar silenciosamente este orden semántico ni esconder contexto crítico.

---

#### 11. Resolución determinista de la composición

La composición resultará de:

```text
PROCESO Y PASO VERSIONADOS
+ ESTADO EMPRESARIAL
+ WORK ITEM Y OBJETO
+ ACTOR Y AUTORIZACIÓN
+ TERRITORIO
+ PERFIL DE ESTACIÓN
+ MODALIDAD
+ CAPACIDADES DISPONIBLES
+ CONECTIVIDAD Y FRESCURA
+ PRIVACIDAD Y ACCESIBILIDAD
= MANIFIESTO RESUELTO
```

Con las mismas entradas autoritativas y versiones deberá producirse la misma composición semántica.

El cliente no podrá elegir una composición más permisiva enviando otro perfil, paso, estado, sede o capacidad.

---

#### 12. Estados de la composición

| Estado           | Significado                                     | Mutaciones ordinarias      |
| ---------------- | ----------------------------------------------- | -------------------------- |
| `UNRESOLVED`     | faltan entradas autoritativas                   | No                         |
| `RESOLVING`      | se valida manifiesto, contexto y compatibilidad | No                         |
| `READY`          | composición completa y acción elegible          | Sí, con autorización       |
| `BLOCKED`        | existe condición empresarial o de seguridad     | No                         |
| `DEGRADED`       | falta capacidad no fatal o existe alternativa   | Según contrato             |
| `OFFLINE_READY`  | operación local autorizada y acotada            | Según contrato             |
| `PENDING_SYNC`   | existe comando local pendiente                  | No duplicar                |
| `RESULT_UNKNOWN` | no se conoce el efecto final                    | Consultar antes de repetir |
| `CONFLICT`       | estado local y autoritativo divergen            | No hasta resolver          |
| `RECOVERY`       | se reconstruye después de falla o cambio        | No hasta validar           |
| `CLOSED`         | paso o actor cerrados y superficie limpia       | No                         |

Cada componente recibirá el estado de superficie aplicable y no inventará uno incompatible.

---

#### 13. Una sola acción primaria

La composición contendrá como máximo una instancia en `PRIMARY_ACTION`.

Reglas:

1. la acción primaria corresponderá a la siguiente acción elegible de `UX-STATION-011`;
2. no se derivará de la posición visual ni del componente enfocado;
3. las acciones secundarias no competirán en jerarquía;
4. una acción sensible requerirá confirmación o step-up cuando corresponda;
5. un componente de captura no completará el proceso por sí solo;
6. una tecla, escaneo o evento automático no evitará las validaciones.

---

#### 14. Autoridad y comandos

Los componentes no poseen autoridad empresarial.

Toda salida mutable deberá emitir una intención conocida:

```text
command_id
command_contract_version
business_object_reference
expected_object_version
actor_context_reference
station_context_reference
idempotency_key
payload
client_observed_at
```

El servidor volverá a resolver identidad, autorización, territorio, estado, prerrequisitos, segregación y concurrencia antes de aceptar el comando.

Ningún `visibility_predicate` o `experience_enablement_predicate` sustituirá esta decisión.

---

#### 15. Validación de datos

La validación se distribuirá así:

| Nivel      | Responsabilidad                                          |
| ---------- | -------------------------------------------------------- |
| componente | formato, presencia y ayuda inmediata                     |
| manifiesto | dependencia, cardinalidad y coherencia entre componentes |
| proceso    | regla empresarial y transición permitida                 |
| servidor   | autoridad, integridad, concurrencia y persistencia       |
| periférico | calidad, estabilidad y procedencia de la lectura         |

Una validación del cliente nunca será la única protección de una regla empresarial.

---

#### 16. Cantidades, unidades y presentaciones

`OPC-QUANTITY-001` deberá conservar separados:

- valor observado;
- unidad de captura;
- unidad empresarial;
- presentación seleccionada;
- factor de conversión versionado;
- precisión y tolerancia;
- origen manual o periférico;
- cantidad esperada y cantidad real;
- motivo de diferencia.

No convertirá silenciosamente paquetes en unidades, gramos en kilogramos ni cantidades esperadas en cantidades confirmadas.

---

#### 17. Escaneo, cámara y captura manual

`OPC-SCAN-001`, `OPC-CAMERA-001` y la alternativa manual producirán la misma identidad empresarial cuando representen la misma acción.

El sistema deberá:

1. validar tipo, formato y contexto del identificador;
2. mostrar el objeto resuelto antes de una acción sensible;
3. impedir que un código válido para otra sede, zona, proceso o estado se acepte por coincidencia técnica;
4. conservar origen de captura;
5. permitir fallback manual controlado;
6. evitar dobles efectos por lectura repetida.

---

#### 18. Selecciones y catálogos

Los componentes de selección usarán opciones versionadas, autorizadas y frescas.

Se distinguirá:

- catálogo vacío;
- filtro sin resultados;
- carga pendiente;
- consulta fallida;
- opción retirada;
- opción visible pero no elegible;
- selección previa ya incompatible.

Una etiqueta visible no será el identificador empresarial almacenado.

---

#### 19. Checklist, evidencia y motivos

Un checklist confirma condiciones declaradas, no demuestra automáticamente que el efecto empresarial ocurrió.

La evidencia deberá declarar finalidad, obligatoriedad, autor, tiempo, objeto, retención y privacidad.

Los motivos de corrección, rechazo, cancelación o excepción serán estructurados cuando afecten auditoría, conciliación o análisis posterior. El texto libre se limitará a contexto adicional.

---

#### 20. Confirmación reforzada

`OPC-CONFIRM-001` mostrará, según riesgo:

- acción exacta;
- objeto y versión;
- cantidad y unidad;
- origen y destino;
- consecuencia;
- posibilidad de reversión;
- actor que ejecuta;
- aprobador separado cuando aplique.

No se usará confirmación repetitiva para todas las acciones, porque genera habituación y errores.

---

#### 21. Borradores y datos locales

Todo estado local quedará aislado por:

```text
actor_effective_id
+ station_instance_id
+ process_id
+ step_id
+ work_item_id
+ component_instance_id
+ manifest_version
```

Al cambiar actor, contexto, work item, manifiesto o versión, cada componente aplicará una política explícita de conservar, transferir, descartar, reconciliar o bloquear.

No existirán borradores globales heredables por el siguiente trabajador.

---

#### 22. Interrupción y reanudación

La composición deberá poder reconstruirse después de:

- navegación accidental;
- bloqueo de pantalla;
- expiración de actor;
- pérdida de red;
- reinicio de aplicación;
- falla de periférico;
- cambio controlado de trabajador;
- actualización del objeto empresarial;
- cambio de manifiesto compatible.

La reanudación validará de nuevo estado, actor, autorización, versión, capacidades y pendientes antes de habilitar la acción.

---

#### 23. Cambios dinámicos sin sorpresa

Una actualización no podrá:

- mover una acción destructiva bajo el dedo o foco activo;
- borrar datos ya capturados sin explicación;
- cambiar unidad o presentación silenciosamente;
- sustituir el objeto empresarial mientras se confirma;
- habilitar una acción por una respuesta tardía de otro componente;
- cerrar una alerta antes de que el trabajador la perciba;
- convertir un resultado desconocido en éxito por timeout.

Los cambios materiales producirán estabilización, aviso o revalidación según riesgo.

---

#### 24. Capacidades y periféricos

Un componente que requiera escáner, cámara, báscula, impresora, datáfono u otra capacidad declarará:

- capacidad mínima;
- versión o compatibilidad;
- estado de salud;
- reserva o lease cuando aplique;
- fallback permitido;
- efecto de indisponibilidad;
- evidencia de resultado físico.

La composición no mostrará un control inutilizable ni ocultará el trabajo sin explicar la alternativa.

---

#### 25. Offline, sincronización y conflicto

Cada componente declarará uno de estos comportamientos:

- `ONLINE_ONLY`;
- `OFFLINE_READ_ONLY`;
- `OFFLINE_CAPTURE_DRAFT`;
- `OFFLINE_COMMAND_ALLOWED`;
- `MANUAL_CONTINGENCY_ONLY`;
- `NOT_APPLICABLE`.

Una composición offline no mezclará componentes incompatibles. Los comandos pendientes conservarán actor, contexto, versión, idempotencia y manifiesto originales.

`RESULT_UNKNOWN` bloqueará la repetición hasta consultar, conciliar o escalar.

---

#### 26. Fallo aislado y coherencia global

Un componente podrá fallar sin derribar toda la superficie solo cuando:

1. no sea crítico para comprender el estado;
2. no altere la siguiente acción;
3. exista fallback seguro;
4. la ausencia sea visible y trazable.

Si falla contexto, actor, estado, riesgo, acción primaria o confirmación necesaria, la composición completa deberá bloquear mutaciones.

---

#### 27. Privacidad en estación compartida

Cada componente declarará qué datos puede mostrar:

- antes de identificar actor;
- con actor activo;
- durante cambio de trabajador;
- en modo supervisión;
- en pantalla visible a terceros;
- durante contingencia;
- después de cierre.

La composición aplicará el nivel más restrictivo entre dato, proceso, actor, estación y componente.

`OPC-PRIVACY-001` no sustituye las reglas de acceso; solo materializa protecciones de presentación y limpieza.

---

#### 28. Accesibilidad y modalidades

El mismo contrato semántico podrá tener variantes táctil, teclado, escáner, cámara, lectura a distancia o asistencia accesible.

Todas conservarán:

- nombre y efecto de la acción;
- orden semántico;
- estado y riesgo;
- foco y navegación predecibles;
- objetivos adecuados;
- alternativas a color, sonido, gesto o arrastre;
- mensajes breves con detalle disponible;
- recuperación tras interrupción.

Una variante no podrá eliminar controles críticos para caber en una pantalla menor.

---

#### 29. Adaptación por perfil de estación

La composición podrá adaptar densidad, agrupación, orientación y modalidad según el perfil aprobado.

No podrá:

- convertir una estación de consulta en estación de mutación;
- usar una capacidad inexistente;
- ampliar territorio o permisos;
- asumir privacidad no disponible;
- mostrar información sensible por mayor tamaño de pantalla;
- usar responsive design como justificación para una experiencia universal no probada.

---

#### 30. Versionado y compatibilidad

Se versionarán independientemente:

- contrato del componente;
- implementación por plataforma;
- manifiesto de composición;
- proceso y paso;
- work item;
- contrato de comando;
- esquema de entrada y salida.

Una nueva versión deberá declarar compatibilidad, migración de borradores, impacto offline, rollout, rollback, pruebas y fecha de retiro de la versión anterior.

---

#### 31. Ciclo de vida

| Estado                   | Significado                                   |
| ------------------------ | --------------------------------------------- |
| `CONTRACT_APPROVED`      | semántica documental aprobada                 |
| `PROTOTYPE_PENDING`      | falta prototipo representativo                |
| `PROTOTYPE_VALIDATED`    | comportamiento comprendido por trabajadores   |
| `IMPLEMENTATION_PENDING` | falta componente ejecutable y paquete         |
| `RELEASE_APPROVED`       | versión autorizada para un ambiente y alcance |
| `DEPRECATED`             | no debe incorporarse a manifiestos nuevos     |
| `RETIRED`                | no puede ejecutarse                           |
| `REJECTED`               | variante no aceptada                          |

Una implementación no heredará automáticamente la aprobación del contrato semántico.

---

#### 32. Deprecación y retiro

La retirada de un componente exigirá:

1. inventario de manifiestos consumidores;
2. sustituto o justificación;
3. compatibilidad con trabajo abierto y borradores;
4. tratamiento de operación offline;
5. actualización de pruebas;
6. rollout y rollback;
7. fecha y responsable;
8. verificación de que no quedan versiones productivas huérfanas.

---

#### 33. Telemetría y auditoría

La composición podrá registrar:

- manifiesto y componentes resueltos;
- versión y plataforma;
- estados presentados;
- componente que originó una intención;
- fallback utilizado;
- errores y recuperaciones;
- tiempo hasta la primera acción correcta;
- ayuda solicitada;
- cambios inesperados evitados;
- conflictos y resultados desconocidos.

No registrará secretos, credenciales, contenido sensible innecesario ni cada gesto con fines de vigilancia individual.

---

#### 34. Rendimiento y carga técnica

La composición no justificará una consulta independiente y secuencial por cada componente.

El diseño deberá permitir:

- proyecciones agregadas y versionadas;
- carga por prioridad;
- caché segura con frescura explícita;
- actualizaciones incrementales estables;
- aislamiento de componentes no críticos;
- presupuesto de complejidad y dependencias;
- diagnóstico centralizado.

Una superficie que requiera vigilancia técnica permanente o ajustes manuales frecuentes será rechazada.

---

#### 35. Gobierno de variantes

Una variante solo se creará cuando cambie de manera real:

- modalidad;
- perfil de estación;
- accesibilidad;
- riesgo;
- privacidad;
- capacidad física;
- densidad operativa.

No se creará una variante por sede, trabajador, color, preferencia aislada o aplicación si el contrato semántico es el mismo.

Toda excepción tendrá propietario, justificación, prueba y condición de retiro.

---

#### 36. Composiciones reutilizables

Podrán definirse plantillas semánticas como:

- identificación y selección de trabajo;
- captura de cantidad;
- verificación por escaneo;
- recepción con diferencia;
- preparación mediante checklist;
- transferencia y handoff;
- confirmación de entrega;
- registro de excepción;
- operación offline;
- resultado y recibo.

La plantilla no reemplazará el manifiesto del paso ni podrá omitir sus contratos de estado, autoridad o resultado.

---

#### 37. Relación con pantallas definitivas

`PROC-SCREEN-001` a `PROC-SCREEN-028` podrán agrupar varios pasos o manifiestos dentro de una pantalla, ruta o flujo.

Sin embargo:

- cada paso conservará su manifiesto y trazabilidad;
- una pantalla no podrá cambiar la semántica de los componentes;
- la navegación no sustituirá el estado empresarial;
- una optimización visual no eliminará validaciones;
- las pantallas solo usarán versiones aprobadas para su paquete y ambiente.

---

#### 38. Pruebas con trabajadores reales

`UX-STATION-008` deberá prototipar combinaciones representativas y comprobar:

- reconocimiento del objeto y estado;
- comprensión de la acción primaria;
- captura correcta con distintas modalidades;
- cambio de actor;
- interrupción y reanudación;
- bloqueo y escalamiento;
- fallo de componente o periférico;
- offline y reconciliación;
- resultado desconocido;
- consistencia entre aplicaciones;
- carga cognitiva;
- necesidad real de ayuda o supervisión.

No bastará validar componentes aislados en un catálogo de diseño.

---

#### 39. Matriz obligatoria por proceso y paso

Para `VPROC-0001` a `VPROC-0069`, cada paso con interacción humana declarará:

```text
process_id
process_version
step_id
step_version
composition_required
composition_manifest_id
composition_manifest_version
work_item_contract_version
supported_station_profiles
supported_modalities
required_context
component_instances
primary_action_instance
secondary_action_instances
state_mapping
capability_requirements
privacy_policy
accessibility_policy
offline_policy
fallback_policy
draft_and_reset_policy
command_contracts
validation_scenarios
prototype_scenarios
```

Un paso sin composición declarará `NO_DYNAMIC_COMPOSITION` y justificará su ejecución automática, externa o puramente informativa.

---

#### 40. Responsabilidades posteriores

| Materia                                    | Tarea propietaria                        |
| ------------------------------------------ | ---------------------------------------- |
| prototipo de componentes y composiciones   | `UX-STATION-008`                         |
| aprobación de matriz final                 | `UX-STATION-009`                         |
| diseño de pantallas operativas definitivas | `PROC-SCREEN-001` a `PROC-SCREEN-028`    |
| cobertura integral de pantallas            | `PROC-COVER-001` a `PROC-COVER-010`      |
| implementación de biblioteca y motor       | paquetes E5 por aplicación y plataforma  |
| pruebas automatizadas y regresión          | BLOQUE T y BLOQUE U                      |
| rollout, rollback y contingencia           | BLOQUE E5, BLOQUE Z y BLOQUE AC          |
| capacitación y soporte                     | `TI-DOM-013`; `TI-UX-006`; `E5-GATE-006` |

Esta tarea no crea un constructor de formularios, CMS operativo, motor de reglas, paquete de componentes ni configuración productiva.

---

#### 41. Reglas de rechazo

La composición será rechazada si:

1. permite componentes no catalogados;
2. ejecuta código o expresiones arbitrarias desde datos;
3. confunde visibilidad con autorización;
4. presenta más de una acción primaria;
5. permite que un componente cambie estado empresarial directamente;
6. oculta actor, contexto, objeto, riesgo o estado crítico;
7. pierde o mezcla borradores entre trabajadores;
8. repite comandos después de un resultado desconocido;
9. depende de un periférico sin fallback o bloqueo explícito;
10. cambia la interfaz bajo el foco de forma insegura;
11. usa validación exclusivamente en cliente;
12. rompe unidades, presentaciones o conversiones;
13. genera consultas o dependencias sin presupuesto;
14. requiere mantenimiento manual frecuente para seguir funcionando;
15. no tiene versionado, compatibilidad, pruebas o retiro;
16. no cubre los 69 procesos.

---

#### Requisitos de prueba derivados

Esta tarea genera los requisitos:

- `TREQ-PROC-901` a `TREQ-PROC-940`.

---

#### 42. Criterios de aceptación

- [ ] Existe catálogo cerrado de componentes semánticos.
- [ ] Cada componente declara entradas, estados, salidas, privacidad, accesibilidad, offline, fallback y versión.
- [ ] Existe manifiesto declarativo por proceso y paso.
- [ ] No se ejecuta código arbitrario desde configuración.
- [ ] Se separan visibilidad, habilitación de experiencia y autorización de servidor.
- [ ] Existe orden semántico estable de slots.
- [ ] Cada composición admite como máximo una acción primaria.
- [ ] Comandos, idempotencia y versión esperada están definidos.
- [ ] Los borradores se aíslan por actor, estación, paso, work item, componente y manifiesto.
- [ ] Cambio de actor, interrupción y reanudación tienen políticas explícitas.
- [ ] Capacidades, periféricos, fallback y operación degradada están integrados.
- [ ] Offline, sincronización, conflicto y resultado desconocido están definidos.
- [ ] Privacidad y accesibilidad se resuelven por el criterio más restrictivo.
- [ ] Cantidades, unidades, selecciones, escaneo, evidencia y confirmación conservan semántica empresarial.
- [ ] Existe ciclo de vida, compatibilidad, deprecación y retiro.
- [ ] La telemetría no se convierte en vigilancia invasiva.
- [ ] La composición no exige soporte o supervisión permanente.
- [ ] Los 69 procesos tienen manifiesto o justificación `NO_DYNAMIC_COMPOSITION`.
- [ ] `UX-STATION-008` permanece sin iniciar.
- [ ] No se implementó código, componentes, datos, infraestructura ni cambios físicos.

---

#### 43. Resultado y continuidad

```text
UX-STATION-011 APROBADA
UX-STATION-012 APROBADA
UX-STATION-008 NO INICIADA
UX-STATION-009 NO INICIADA
```

`UX-STATION-012` cierra el diseño documental previo al prototipo. Define qué componentes y composiciones podrán probarse, pero no demuestra todavía su comprensión, eficiencia o seguridad con trabajadores reales.

La siguiente tarea canónica es:

```text
UX-STATION-008 — Prototipar alternativas con trabajadores reales
```

