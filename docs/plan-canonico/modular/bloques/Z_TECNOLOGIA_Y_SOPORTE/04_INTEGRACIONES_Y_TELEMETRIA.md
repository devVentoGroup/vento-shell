### MINI-BLOQUE — INTEGRACIONES Y TELEMETRIA

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **integraciones y telemetria** dentro de **Z TECNOLOGÍA Y SOPORTE**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `TI-INT-001` a `TI-INT-003` — 3 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `TI-INT-001`: Definir adaptadores de telemetría para endpoints, redes, impresoras, aplicaciones y servicios externos
- `TI-INT-002`: Definir contratos con SHELL, NEXO, ANIMA, VISO, ORIGO, NUMERA, PRINT-ARC, BLOQUE T y continuidad
- `TI-INT-003`: Definir integraciones con MDM, soporte remoto, ISP, fabricantes, licenciamiento y proveedores tecnológicos
<!-- PLAN-SECTION-META:END -->

### ✅ TI-INT-001 — Definir adaptadores de telemetría para endpoints, redes, impresoras, aplicaciones y servicios externos

**Estado:** APROBADA
**Tarea anterior:** `TI-UX-006 — Diseñar diagnóstico guiado, base de conocimiento y capacitación contextual sin saturación técnica` — APROBADA
**Tarea siguiente:** `TI-INT-002 — Definir contratos con SHELL, NEXO, ANIMA, VISO, ORIGO, NUMERA, PRINT-ARC, BLOQUE T y continuidad` — RESERVADA
**Tipo de tarea:** documental; definición normativa y materializada de los adaptadores de telemetría que normalizan observaciones de endpoints, redes, impresoras, aplicaciones y servicios externos hacia el contrato transversal de observabilidad, preservando identidad, autenticación, reloj, frescura, retries, idempotencia, mapping, minimización, reconciliación y autoridad de cada fuente
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/Z_TECNOLOGIA_Y_SOPORTE/04_INTEGRACIONES_Y_TELEMETRIA.md`
**Fase:** exclusivamente documental
**Cambios físicos autorizados:** ninguno; no crea ni modifica código, SDK, agentes, collectors, exporters, webhooks, endpoints, jobs, colas, tablas, vistas, RLS, RPC, funciones, triggers, Edge Functions, migraciones, datos, dispositivos, redes, impresoras, aplicaciones, integraciones productivas, secretos, dashboards, alertas desplegadas ni configuración de Supabase
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir cómo VENTO incorporará telemetría procedente de fuentes técnicas heterogéneas sin permitir que cada proveedor, agente, aplicación o dispositivo imponga su propio significado sobre identidad, salud, severidad, tiempo o estado empresarial.

La tarea materializa una frontera de adaptación común que permita responder, para cada observación:

```text
¿QUÉ FUENTE PRODUJO EL DATO?
¿QUÉ OBJETO CANÓNICO PUEDE RELACIONARSE CON ESA FUENTE?
¿CUÁNDO OCURRIÓ LA OBSERVACIÓN Y CUÁNDO FUE RECIBIDA?
¿QUÉ TAN CONFIABLE ES SU RELOJ Y SU FRESCURA?
¿QUÉ FORMA DE OBSERVACIÓN REPRESENTA?
¿QUÉ CLASE DE SEÑAL PUEDE DERIVARSE SIN INVENTAR SEMÁNTICA?
¿CÓMO SE EVITAN DUPLICADOS Y EFECTOS REPETIDOS?
¿QUÉ PASA SI EL DATO LLEGA TARDE, FUERA DE ORDEN O CONTRADICTORIO?
¿QUÉ INFORMACIÓN DEBE MINIMIZARSE O RECHAZARSE?
¿QUÉ OCURRE SI EL ADAPTADOR FALLA O LA FUENTE DEJA DE responder?
```

El objetivo es que las fuentes externas y técnicas puedan alimentar observabilidad, diagnóstico y reconciliación sin convertirse en fuente de verdad de activos, aplicaciones, contratos, costos, identidad, casos o decisiones empresariales.

---

#### 2. Resultado sustantivo

Se materializan exactamente cinco familias de adaptación:

1. **Endpoint** — observaciones técnicas de endpoints sin confundir endpoint, activo, persona o dispositivo compartido.
2. **Red** — observaciones de recursos de red y conectividad sin convertir reachability en salud empresarial.
3. **Impresora** — observaciones físicas y técnicas de impresora conservando separadas cola, comando, receipt y resultado físico.
4. **Aplicación** — métricas, eventos, logs, heartbeat, pruebas sintéticas y resultados de operación de aplicaciones y ambientes.
5. **Servicio externo / proveedor técnico** — observaciones de dependencias externas sin convertir el estado del proveedor en verdad de disponibilidad VENTO.

Balance documental:

| Elemento                                            |  Resultado |
| --------------------------------------------------- | ---------: |
| Familias de adaptador                               | **5 de 5** |
| Formas de observación preservadas                   | **7 de 7** |
| Clases de señal preservadas                         | **6 de 6** |
| Estados de health preservados                       | **5 de 5** |
| Familias con decisión explícita de autenticación    | **5 de 5** |
| Familias con decisión explícita de reloj            | **5 de 5** |
| Familias con decisión explícita de retries          | **5 de 5** |
| Familias con decisión explícita de idempotencia     | **5 de 5** |
| Familias con decisión explícita de mapping          | **5 de 5** |
| Familias con degradación y reconciliación definidas | **5 de 5** |
| Integraciones productivas creadas                   |      **0** |
| Nuevos objetos canónicos de dominio                 |      **0** |
| Nuevos estados de health                            |      **0** |
| Cambios físicos                                     |      **0** |
| Requisitos de prueba nuevos o modificados           |      **0** |

---

#### 3. Entradas canónicas conservadas

La tarea consume y preserva, sin redefinir:

- `TI-DOM-002`, para clases y relaciones del grafo tecnológico;
- `TI-DOM-003`, para endpoint, lifecycle, baseline, postura y evidencia de dispositivo;
- `TI-DOM-004`, para recursos de red, topología, addressing y relaciones;
- `TI-DOM-005`, para impresoras y su reconciliación con activos, red y ejecución de impresión;
- `TI-DOM-006`, para aplicaciones, ambientes, dependencias y proveedores técnicos;
- `TI-DOM-007`, para caso tecnológico, incidente, prioridad, SLA, diagnóstico, restauración y cierre;
- `TI-DOM-009`, para cambios tecnológicos y configuración protegida;
- `TI-DOM-010`, como autoridad del contrato transversal de observabilidad, señales, health, SLI/SLO, alertas y frescura;
- `TI-DOM-011`, para recuperación técnica y evidencia de restore/recovery;
- `TI-DOM-012`, para proveedores, licencias, contratos, garantías y costos sin mezclar telemetría con autoridad comercial;
- `TI-DOM-013`, para conocimiento, diagnóstico guiado y adopción;
- `TI-AUTH-001` a `TI-AUTH-004`, para segregación, privilegio, configuración protegida, logs, evidencia, exportación y secretos;
- `TI-UX-002`, para la mesa de servicio y su correlación con señales y elementos;
- `TI-UX-003`, para mapa técnico, health, frescura y deuda de evidencia;
- `TI-UX-004`, para incidente, problema, cambio, mantenimiento y recuperación;
- `TI-UX-005`, para señales comerciales y tecnológicas asociadas a proveedor, licencia, costo y garantía;
- `TI-UX-006`, para diagnóstico guiado, conocimiento y señales de adopción;
- PRINT-ARC como autoridad sobre cola, routing, adaptador de impresión, ejecución y evidencia de resultado de impresión;
- SHELL, NEXO, ANIMA, VISO, ORIGO y NUMERA como fuentes propietarias de sus respectivos dominios.

La adaptación de telemetría no modifica la fuente de verdad de ninguno de esos objetos.

---

#### 4. Frontera exacta de TI-INT-001

TI-INT-001 define el contrato transversal que cualquier adaptador de telemetría deberá cumplir.

Incluye:

- identidad de fuente;
- relación con objeto canónico;
- autenticación referenciada;
- reloj y timestamps;
- modo de adquisición;
- mapping;
- forma de observación;
- clase de señal;
- frescura;
- retries;
- idempotencia;
- deduplicación;
- orden temporal;
- minimización;
- cardinalidad;
- degradación;
- self-observability;
- reconciliación;
- tratamiento de evidencia insuficiente.

No incluye:

- contratos interaplicación entre aplicaciones VENTO, que pertenecen a `TI-INT-002`;
- selección o implementación de MDM, soporte remoto, ISP, fabricante, plataforma de licenciamiento o proveedor específico, que pertenece a `TI-INT-003`;
- configuración física de collectors, agentes, webhooks o credenciales;
- definición de nuevas reglas de health, SLI, SLO o alerta;
- creación automática de incidentes;
- mutación de contratos, licencias, costos, activos o identidades.

---

#### 5. Principio de frontera anticorrupción

Cada adaptador se comporta como una frontera entre semántica propietaria y semántica VENTO.

```text
FUENTE PROPIETARIA
→ ADQUISICIÓN
→ VALIDACIÓN
→ NORMALIZACIÓN
→ RESOLUCIÓN DE IDENTIDAD
→ MAPPING
→ DEDUPLICACIÓN / ORDEN
→ OBSERVACIÓN CANÓNICA
→ RECONCILIACIÓN
→ CONSUMO DE OBSERVABILIDAD
```

Reglas:

1. el payload original no se convierte automáticamente en objeto canónico;
2. un nombre de host, IP, serial, MAC, URL, account ID o provider ID no crea identidad canónica por coincidencia;
3. la severidad del proveedor no reemplaza la clase de señal VENTO;
4. el estado `healthy` del proveedor no escribe `HEALTHY` directamente;
5. una respuesta HTTP exitosa no demuestra disponibilidad empresarial;
6. una ausencia de observación no se convierte en evidencia de normalidad;
7. el adaptador puede rechazar o dejar pendiente un dato antes que fabricar una relación.

---

#### 6. Flujo documental común de una observación

Toda familia de adaptador conserva este orden lógico:

```text
1. IDENTIFICAR FUENTE
2. AUTENTICAR / VERIFICAR ORIGEN
3. CAPTURAR TIEMPO DE FUENTE
4. CAPTURAR TIEMPO DE RECEPCIÓN
5. VALIDAR ESQUEMA Y TAMAÑO
6. RESOLVER OBJETO O DEJARLO SIN RECONCILIAR
7. NORMALIZAR UNIDAD / RESULTADO
8. DETERMINAR FORMA DE OBSERVACIÓN
9. DETERMINAR CLASE DE SEÑAL CUANDO APLIQUE
10. APLICAR IDEMPOTENCIA Y DEDUPLICACIÓN
11. CONSERVAR ORDEN Y LLEGADAS TARDÍAS
12. SANITIZAR Y MINIMIZAR
13. ENTREGAR A OBSERVABILIDAD
14. REGISTRAR ESTADO DEL PROPIO ADAPTADOR
15. RECONCILIAR DESCONOCIDOS, ERRORES Y CONTRADICCIONES
```

El orden es conceptual y no prescribe una arquitectura física específica.

---

#### 7. Envolvente conceptual mínima de observación

La adaptación deberá poder conservar, cuando la fuente lo permita y sin crear todavía un esquema físico:

| Campo conceptual       | Propósito                                                                     |
| ---------------------- | ----------------------------------------------------------------------------- |
| `source_ref`           | identificar la fuente o conector sin incluir secreto                          |
| `source_family`        | endpoint, red, impresora, aplicación o servicio externo                       |
| `source_object_ref`    | identificador propio de la fuente, sanitizado                                 |
| `canonical_object_ref` | objeto VENTO reconciliado cuando exista                                       |
| `observation_form`     | una de las siete formas aprobadas                                             |
| `signal_class`         | una de las seis clases cuando corresponda                                     |
| `observed_at`          | instante atribuido por la fuente                                              |
| `recorded_at`          | instante de recepción o registro VENTO                                        |
| `clock_quality`        | condición conocida del reloj/fuente temporal                                  |
| `source_version`       | versión del agente, API, payload o contrato cuando sea relevante              |
| `value_or_result`      | resultado normalizado mínimo                                                  |
| `unit`                 | unidad estable cuando sea métrica                                             |
| `safe_dimensions`      | dimensiones de baja cardinalidad y autorizadas                                |
| `correlation_ref`      | correlación segura cuando exista                                              |
| `idempotency_ref`      | clave estable o derivada de deduplicación                                     |
| `freshness_context`    | contexto necesario para evaluar vigencia                                      |
| `sanitization_state`   | resultado de minimización/rechazo de contenido sensible                       |
| `mapping_state`        | resuelto, ambiguo, no resuelto o inválido según el contrato de reconciliación |

La denominación física final pertenece a la implementación posterior. Esta tabla define la información mínima que la adaptación debe poder preservar semánticamente.

---

#### 8. Reloj y semántica temporal

Se separan obligatoriamente:

```text
MOMENTO OBSERVADO POR LA FUENTE
≠
MOMENTO RECIBIDO POR VENTO
≠
MOMENTO DE PROCESAMIENTO
≠
MOMENTO DE EFECTO EMPRESARIAL
```

Reglas:

1. `observed_at` se conserva cuando la fuente ofrece un instante confiable;
2. `recorded_at` se registra independientemente para conocer retraso de ingestión;
3. si la fuente no tiene reloj confiable, la observación se marca con calidad temporal reducida;
4. el adaptador no corrige silenciosamente el tiempo histórico para hacerlo coincidir con recepción;
5. un dato atrasado puede ser válido como evidencia histórica sin reemplazar automáticamente el estado vigente;
6. correlación temporal no equivale a causalidad;
7. timezone y offset se preservan o normalizan de forma explícita cuando sean materiales;
8. drift de reloj puede generar señal sobre la fuente, pero no reescribe eventos de negocio.

---

#### 9. Autenticación de fuente

Las cinco familias requieren una identidad de fuente verificable antes de aceptar datos como observación confiable.

La adaptación podrá referenciar mecanismos como certificado, identidad de máquina, token de integración, firma de webhook, sesión de servicio o credencial administrada, pero nunca almacena el secreto en el evento de telemetría.

Se conserva esta regla:

```text
AUTENTICAR LA FUENTE
≠
AUTORIZAR UNA MUTACIÓN SOBRE EL OBJETO
```

Una fuente autenticada puede estar autorizada para emitir observaciones y aun así carecer de permiso para cambiar configuración, cerrar casos, modificar contratos o ejecutar acciones remotas.

---

#### 10. Retries, límites e incertidumbre

El adaptador trata cada intento de adquisición o entrega con semántica explícita.

Reglas:

1. retry solo para resultados clasificados como retryables;
2. aplicar backoff y jitter cuando el canal lo exija;
3. respetar límites de tasa y `Retry-After` cuando existan;
4. limitar número de intentos y edad total;
5. un timeout puede dejar resultado `UNKNOWN`, no `FAILED` automático;
6. una respuesta tardía puede reconciliar el resultado original;
7. un retry no debe duplicar una observación lógica;
8. un proveedor temporalmente inaccesible genera deuda de evidencia y estado del adaptador, no una caída automática del objeto observado.

Los valores físicos de backoff, timeout o límite no se inventan en esta tarea; se parametrizan por fuente cuando exista implementación y evidencia.

---

#### 11. Idempotencia y deduplicación

Cada familia deberá resolver una identidad lógica reproducible para la observación.

Prioridad de deduplicación:

1. identificador de evento nativo estable, si existe;
2. identificador de operación o mensaje + versión/fuente;
3. combinación determinista de fuente, objeto, tipo, instante observado y contenido normalizado cuando no exista ID nativo;
4. estrategia específica de reconciliación cuando la fuente sea agregada y no permita identidad por evento.

Reglas:

```text
MISMA IDENTIDAD + MISMO CONTENIDO
→ UNA OBSERVACIÓN LÓGICA

MISMA IDENTIDAD + CONTENIDO MATERIALMENTE DISTINTO
→ CONFLICTO / RECONCILIACIÓN
```

El adaptador no silencia un conflicto de contenido bajo una deduplicación agresiva.

---

#### 12. Orden, llegadas tardías y datos fuera de secuencia

La adaptación no presupone orden global.

Debe poder distinguir:

- evento recibido en orden;
- evento atrasado pero válido;
- evento duplicado;
- evento con reloj dudoso;
- evento que contradice una observación posterior;
- snapshot de estado frente a transición;
- agregado frente a evento individual.

Una llegada tardía conserva su tiempo original y puede actualizar historia, pero no debe retroceder silenciosamente el estado actual si existe evidencia más reciente y válida.

---

#### 13. Mapping de identidad

El mapping usa relaciones canónicas y evidencia explícita.

Resultados conceptuales:

| Resultado     | Significado                                                           |
| ------------- | --------------------------------------------------------------------- |
| `RESUELTO`    | existe correspondencia inequívoca con objeto canónico vigente         |
| `AMBIGUO`     | existen múltiples candidatos o evidencia contradictoria               |
| `NO_RESUELTO` | la fuente existe pero todavía no puede vincularse con objeto canónico |
| `INVALIDO`    | el dato incumple contrato, identidad o semántica mínima               |

`AMBIGUO` y `NO_RESUELTO` nunca se fuerzan a `RESUELTO` por similitud de nombre, IP o serial.

La implementación física podrá usar identificadores y tablas propias del dominio, pero la política de mapping permanece esta.

---

#### 14. Reconciliación de desconocidos

Toda observación no reconciliada conserva, como mínimo:

- fuente;
- objeto origen;
- razón del bloqueo;
- candidatos cuando existan;
- evidencia disponible;
- último intento de resolución;
- propietario del objeto o integración;
- condición de salida.

La deuda de mapping debe ser visible para operación técnica. No se elimina por caducidad sin conservar la evidencia necesaria para auditoría o corrección.

---

#### 15. Formas de observación — 7 de 7

Se preservan exactamente las siete formas aprobadas:

1. **métrica**;
2. **evento o transición**;
3. **log**;
4. **heartbeat**;
5. **prueba sintética**;
6. **resultado de operación**;
7. **observación manual controlada**.

Cada adaptador declara cuáles puede producir realmente. La ausencia de soporte para una forma no se rellena mediante datos sintéticos inventados.

---

#### 16. Clases de señal — 6 de 6

Se preservan exactamente:

- `INFO`;
- `WARNING`;
- `FAILURE`;
- `RECOVERY`;
- `SATURATION`;
- `SECURITY_SIGNAL`.

La adaptación puede mapear códigos de proveedor hacia estas clases únicamente cuando la semántica esté documentada.

Un código de severidad propietario no se copia como si fuera clase canónica sin mapping.

---

#### 17. Health — 5 de 5

Los adaptadores no crean nuevos estados de health.

Se preservan:

- `HEALTHY`;
- `DEGRADED`;
- `OFFLINE`;
- `MISCONFIGURED`;
- `UNKNOWN`.

Regla central:

```text
ADAPTADOR
→ ENTREGA EVIDENCIA

CONTRATO DE OBSERVABILIDAD
→ DERIVA HEALTH CUANDO LA EVIDENCIA ES SUFICIENTE
```

Por tanto:

- ausencia de heartbeat no implica `OFFLINE` sin contrato de frescura y evidencia suficiente;
- fuente inaccesible no implica `OFFLINE` del objeto;
- respuesta exitosa aislada no implica `HEALTHY`;
- contradicción entre fuentes conduce a `UNKNOWN` o revisión según el contrato propietario;
- `RECOVERY` es señal y no equivale a cierre de incidente.

---

#### 18. Frescura

Cada fuente debe declarar cómo se evalúa vigencia sin imponer un umbral universal.

La evaluación considera:

- cadencia esperada;
- instante de observación;
- retraso de ingestión;
- tolerancia conocida de la fuente;
- ventana de agregación;
- calidad de reloj;
- estado del adaptador;
- último dato válido.

La interfaz consumidora puede presentar condiciones humanas como vigente, retrasada, obsoleta o desconocida, pero el adaptador conserva la evidencia temporal que permite esa derivación.

---

#### 19. Self-observability del adaptador

Cada adaptador deberá ser observable como componente independiente del objeto que monitorea.

Debe poder producir evidencia sobre:

- última adquisición exitosa;
- última entrega exitosa;
- errores de autenticación;
- errores de mapping;
- payloads inválidos;
- retries;
- rate limit;
- backlog;
- edad del backlog;
- descartes por política;
- duplicados detectados;
- reloj de fuente degradado;
- fuente inaccesible;
- versión del adaptador o contrato.

Regla:

```text
ADAPTADOR DEGRADADO
≠ OBJETO DEGRADADO
```

Cuando el adaptador no puede observar, la consecuencia primaria es pérdida o degradación de evidencia.

---

#### 20. Adaptador de endpoint

**Objeto objetivo:** `ENDPOINT` cuando exista identidad canónica reconciliada.

**No equivale a:** `ASSET`, `SHARED_DEVICE`, trabajador, sesión, IP, MAC o serial.

Observaciones que puede normalizar cuando la fuente las soporte:

- heartbeat;
- energía o batería;
- almacenamiento;
- reloj y drift;
- versión de sistema o agente;
- link/conectividad;
- baseline observado;
- postura técnica;
- estado de actualización;
- resultado de comprobación o comando;
- última evaluación.

Mapping:

1. usar identificador canónico o vínculo explícito si existe;
2. si solo existe serial, MAC, hostname o employee device, conservarlo como evidencia de fuente hasta reconciliar;
3. no crear endpoint por coincidencia;
4. no usar identidad personal como clave primaria de telemetría técnica.

Autenticación:

- identidad de agente, dispositivo o collector administrado;
- secreto referenciado y protegido fuera del payload.

Reloj:

- conservar tiempo del endpoint y calidad del reloj;
- detectar drift cuando sea observable;
- no asumir que el clock local es autoritativo.

Retries e idempotencia:

- heartbeat repetido conserva identidad temporal;
- comandos o resultados usan correlación estable;
- reintento de envío no duplica resultado lógico.

Degradación:

- agente caído o fuente sin heartbeat produce evidencia insuficiente hasta aplicar el contrato de frescura;
- no se declara `OFFLINE` por ausencia aislada de telemetría.

Estado documental del contrato: `ESPECIFICADO`.

---

#### 21. Adaptador de red

**Objeto objetivo:** `NETWORK_RESOURCE` cuando exista identidad reconciliada.

Puede normalizar, según fuente:

- link state;
- reachability;
- latencia;
- pérdida de paquetes;
- jitter;
- DNS;
- interface state;
- saturación/capacidad;
- failover observado;
- route result;
- disponibilidad de gateway o dependencia;
- cambio de configuración observado cuando exista evidencia autorizada.

Reglas:

1. `reachable` no equivale a `HEALTHY`;
2. DNS exitoso no demuestra disponibilidad completa;
3. pérdida parcial puede producir evidencia de degradación sin decidir prioridad de incidente;
4. una vía alterna funcional puede conservar capacidad mientras una dependencia está degradada;
5. el adaptador no persiste PSK, passwords, private keys ni dumps completos de configuración;
6. topología sensible se minimiza y solo se referencia cuando es necesaria y autorizada.

Autenticación:

- identidad de collector, dispositivo o API técnica;
- credenciales fuera de la observación.

Reloj:

- separar timestamp del equipo, collector y recepción;
- marcar calidad temporal cuando el dispositivo no tenga sincronización confiable.

Retries e idempotencia:

- polls repetidos se tratan como snapshots distintos por ventana, no como eventos empresariales duplicados;
- traps/webhooks usan ID nativo o identidad determinista cuando sea posible.

Estado documental del contrato: `ESPECIFICADO`.

---

#### 22. Adaptador de impresora

**Objeto objetivo:** `PRINTER` cuando exista identidad reconciliada.

La adaptación mantiene separadas:

```text
IMPRESORA FÍSICA
≠ CONECTIVIDAD
≠ COLA
≠ ROUTING
≠ COMANDO
≠ JOB ACEPTADO
≠ RECEIPT
≠ RESULTADO FÍSICO
≠ CONSUMIBLE
```

Puede normalizar:

- heartbeat o presencia;
- conexión de red;
- estado técnico del dispositivo;
- error de hardware;
- papel, toner, tinta u otro consumible cuando la fuente lo permita;
- cola o backlog correlacionado desde la autoridad correspondiente;
- aceptación de job;
- command result;
- receipt;
- resultado físico cuando exista una fuente capaz de demostrarlo.

Reglas:

1. job aceptado no equivale a impresión física exitosa;
2. receipt no equivale automáticamente a salida física;
3. impresora en condición física `OPERATIVA` puede mantener health `UNKNOWN` si no existe señal vigente;
4. cola degradada no convierte por sí sola el hardware en `DEGRADED`;
5. PRINT-ARC conserva autoridad sobre routing, cola, trabajo y adaptadores propios de impresión;
6. TI-INT-001 normaliza la telemetría y correlación, no redefine el ciclo de impresión.

Autenticación:

- collector, dispositivo o interfaz de impresión identificada;
- ninguna credencial queda en la observación.

Retries e idempotencia:

- los poll snapshots se versionan por tiempo;
- eventos de job conservan idempotency/correlation ref;
- reintento de ingestión no crea otro resultado físico.

Estado documental del contrato: `ESPECIFICADO`.

---

#### 23. Adaptador de aplicación

**Objeto objetivo:** `APPLICATION` y ambiente identificado cuando exista evidencia.

Puede normalizar:

- métricas;
- eventos/transiciones;
- logs estructurados;
- heartbeat;
- pruebas sintéticas;
- resultados de operación;
- observaciones manuales controladas;
- señales de cliente web/móvil;
- dependencia externa correlacionada;
- versión, release o configuración como contexto cuando estén demostrados.

Contexto seguro esperado:

- `app_code`;
- ambiente;
- versión observada;
- componente seguro;
- operación o capacidad;
- resultado;
- duración cuando aplique;
- correlation ref;
- timestamp;
- dimensiones de baja cardinalidad.

Reglas:

1. `apps.is_active` no equivale a despliegue saludable;
2. URL accesible no equivale a disponibilidad empresarial;
3. repositorio existente no equivale a producción;
4. SDK presente no demuestra proveedor contratado ni plan comercial;
5. una prueba sintética no crea pedidos, ventas, pagos, documentos o efectos reales;
6. errores de cliente no deben capturar formulario, secreto, token ni dato personal innecesario;
7. log y métrica conservan identidades distintas;
8. un cambio cercano en el tiempo no se presenta como causa sin evidencia.

Autenticación:

- principal de aplicación, collector o plataforma de observabilidad;
- secreto fuera del evento y con alcance mínimo.

Retries e idempotencia:

- eventos usan ID estable cuando exista;
- métricas agregadas conservan ventana y dimensiones;
- logs repetidos por retry no se convierten en múltiples hechos empresariales.

Estado documental del contrato: `ESPECIFICADO`.

---

#### 24. Adaptador de servicio externo o proveedor técnico

La tarea no crea un nuevo tipo canónico `EXTERNAL_SERVICE`.

La observación externa se relaciona con la dependencia técnica correspondiente, incluido `EXTERNAL_PROVIDER` cuando aplique, y con el servicio o aplicación VENTO que consume esa dependencia.

Puede normalizar, según proveedor:

- provider status;
- disponibilidad de API;
- latencia;
- request result;
- timeout;
- rate limit;
- quota/capacidad;
- error de autenticación;
- webhook recibido;
- degradación regional;
- maintenance notice;
- incident/status event del proveedor;
- soporte o escalamiento correlacionado cuando exista referencia segura.

Reglas:

1. estado “operational” del proveedor no equivale a servicio VENTO saludable;
2. incidente del proveedor no crea automáticamente incidente VENTO;
3. severidad del proveedor no reemplaza prioridad P1–P4;
4. provider account no equivale a contrato, licencia o entitlement;
5. telemetría externa no modifica ORIGO, NUMERA ni NEXO;
6. credenciales, account secrets y tokens nunca se incorporan al expediente de telemetría;
7. mapping específico de API, campos y autenticación de un proveedor real se materializa en `TI-INT-003`.

Autenticación:

- firma, token, cuenta técnica, certificado u otro mecanismo específico cuando la integración exista;
- TI-INT-001 exige la propiedad, no inventa el mecanismo de un proveedor todavía no seleccionado.

Reloj:

- conservar timestamp del proveedor, recepción VENTO y calidad/limitación conocida.

Retries e idempotencia:

- respetar IDs de evento o webhook cuando existan;
- deduplicar entregas repetidas;
- mantener resultado desconocido cuando no pueda confirmarse el efecto de una solicitud.

Estado documental del contrato: `ESPECIFICADO`; integración específica: `FUERA_DE_ALCANCE` de esta tarea.

---

#### 25. Matriz transversal de las cinco familias

| Familia          | Objeto o relación objetivo                       | Autenticación                                    | Reloj                             | Retries                     | Idempotencia                         | Mapping                                                 | Estado         |
| ---------------- | ------------------------------------------------ | ------------------------------------------------ | --------------------------------- | --------------------------- | ------------------------------------ | ------------------------------------------------------- | -------------- |
| Endpoint         | `ENDPOINT`                                       | identidad de agente/dispositivo/collector        | fuente + recepción + calidad      | controlados por canal       | evento/heartbeat/operación estable   | identidad explícita; no inferir desde persona/IP/serial | `ESPECIFICADO` |
| Red              | `NETWORK_RESOURCE`                               | collector/dispositivo/API técnica                | equipo/collector + recepción      | backoff/rate limit          | evento nativo o snapshot por ventana | recurso reconciliado; topología no inferida             | `ESPECIFICADO` |
| Impresora        | `PRINTER` + referencias PRINT-ARC                | dispositivo/collector/servicio autorizado        | dispositivo/servicio + recepción  | canal y polling controlados | job/event/ref estable                | impresora reconciliada; cola/job separados              | `ESPECIFICADO` |
| Aplicación       | `APPLICATION` + ambiente                         | principal de aplicación/collector                | aplicación/plataforma + recepción | según transporte            | event/correlation/window             | `app_code` y ambiente demostrados                       | `ESPECIFICADO` |
| Servicio externo | dependencia / `EXTERNAL_PROVIDER` cuando aplique | mecanismo específico del proveedor, referenciado | proveedor + recepción             | límites y `Retry-After`     | provider event/request ref           | dependencia explícita; no inventar contrato o servicio  | `ESPECIFICADO` |

Control:

```text
5 familias esperadas
5 familias materializadas
0 omitidas
0 duplicadas
5 con autenticación definida
5 con reloj definido
5 con retries definidos
5 con idempotencia definida
5 con mapping definido
```

---

#### 26. Minimización y cardinalidad

La adaptación aplica minimización antes de persistir o exponer observaciones.

No se usan como dimensiones ordinarias de métricas:

- nombre o ID de persona;
- documento;
- correo;
- token;
- payload libre;
- URL cruda con parámetros;
- mensaje libre sin normalización;
- request body;
- session ID;
- trace con secreto;
- identificador de negocio de cardinalidad no controlada.

No se almacena dentro de telemetría:

- contraseña;
- API key;
- service-role key;
- private key;
- PSK;
- cookie de sesión;
- recovery code;
- secreto de webhook;
- configuración completa cuando basta una referencia o fingerprint seguro.

Si un diagnóstico requiere material sensible, se referencia la evidencia bajo `TI-AUTH-004`; no se amplía el payload ordinario del adaptador.

---

#### 27. Logs y mensajes de error

Los logs normalizados conservan estructura estable y un código o template seguro cuando sea posible.

Se prioriza:

```text
timestamp
severity
service/application/component
environment/version
stable_code
template
safe_context
result
correlation_ref
```

Un mensaje libre puede conservarse como evidencia restringida cuando sea imprescindible, pero no se convierte en dimensión de alta cardinalidad ni se publica indiscriminadamente.

---

#### 28. Pruebas sintéticas

Una prueba sintética emitida por un adaptador deberá ser:

- identificable como sintética;
- no destructiva;
- separable del tráfico real;
- segura para datos y procesos;
- limitada a la capacidad que pretende comprobar;
- trazable a ambiente, versión y resultado;
- incapaz de fabricar éxito empresarial por sí sola.

No se crea una venta, pago, compra, orden, movimiento de inventario, documento laboral o efecto real solo para probar disponibilidad.

---

#### 29. Observación manual controlada

Cuando no exista telemetría automática suficiente, una observación manual puede alimentar evidencia si conserva:

- actor;
- método;
- momento;
- objeto observado;
- fuente o instrumento;
- resultado;
- limitación;
- evidencia segura;
- vigencia esperada.

La observación manual no se disfraza de heartbeat automático ni de medición continua.

---

#### 30. Datos inválidos, sospechosos o contradictorios

El adaptador no intenta “arreglar” silenciosamente un dato que alteraría semántica.

Puede:

- rechazar payload inválido;
- sanitizar campo no necesario;
- conservar observación sin mapping;
- marcar ambigüedad;
- aislar dato contradictorio;
- solicitar reconciliación;
- conservar versión anterior como vigente hasta que exista evidencia mejor.

No puede:

- inventar objeto;
- elegir proveedor por nombre parecido;
- convertir `null` en cero;
- convertir timeout en failure definitivo;
- convertir silencio en healthy;
- sobrescribir evidencia más reciente con dato atrasado sin evaluación temporal.

---

#### 31. Degradación y pérdida de fuente

Se distinguen al menos:

```text
FUENTE NO DISPONIBLE
ADAPTADOR NO DISPONIBLE
AUTENTICACIÓN FALLIDA
RATE LIMIT
BACKLOG
MAPPING FALLIDO
PAYLOAD INVÁLIDO
RELOJ DUDOSO
OBSERVACIÓN OBSOLETA
OBJETO SIN TELEMETRÍA
```

Cada condición informa qué parte de la evidencia quedó afectada.

La superficie consumidora no debe traducir cualquiera de estas condiciones a `OFFLINE` del objeto sin evidencia adicional.

---

#### 32. Relación con alertas

La adaptación termina en observaciones y señales normalizadas.

```text
OBSERVACIÓN
→ SEÑAL
→ EVALUACIÓN DE HEALTH / SLI
→ ALERTA CUANDO LA REGLA LO DETERMINE
→ CASO O ACCIÓN CUANDO EL PROCESO LO DETERMINE
```

TI-INT-001 no define ni ejecuta:

- umbrales;
- silencios;
- ventanas de mantenimiento;
- routing de alertas;
- prioridad de incidente;
- creación automática de ticket;
- cierre automático.

Esas decisiones permanecen en `TI-DOM-010`, `TI-DOM-007`, autorización y las implementaciones propietarias.

---

#### 33. Configuración protegida de observabilidad

La implementación posterior deberá tratar como configuración protegida, según la autoridad vigente:

- habilitar o deshabilitar collector;
- cambiar fuente;
- cambiar binding señal–recurso–servicio;
- cambiar perfil de health;
- cambiar regla o threshold;
- cambiar routing o escalamiento;
- crear mute/supresión/ventana;
- cambiar política de colección o retención;
- modificar dashboard cuando produzca una decisión protegida o exposición de información.

La mera existencia de una alerta, incidente o recomendación de proveedor no autoriza esas mutaciones.

---

#### 34. Relación con TI-UX-003 — mapa técnico

TI-UX-003 consume telemetría para mostrar health, frescura, dependencias y deuda de evidencia.

TI-INT-001 entrega el contrato necesario para que esa vista pueda distinguir:

- señal disponible;
- fuente;
- instante;
- frescura;
- objeto reconciliado;
- ausencia de telemetría;
- fuente no disponible;
- mapping pendiente;
- contradicción.

El mapa no recibe un estado verde fabricado por el adaptador; recibe evidencia suficiente para que el contrato de observabilidad pueda derivar el estado correspondiente.

---

#### 35. Relación con TI-UX-002 y TI-UX-004

La mesa de servicio y los flujos especializados pueden correlacionar observaciones con:

- caso;
- servicio afectado;
- elemento afectado;
- incidente;
- problema;
- cambio;
- mantenimiento;
- recuperación.

La correlación no altera el objeto de telemetría y no convierte automáticamente una señal en incidente o causa.

Un técnico puede usar una observación como evidencia; el expediente conserva por separado diagnóstico, hipótesis, cambio, restauración y validación.

---

#### 36. Relación con TI-UX-005

Las futuras señales sobre licencia, renovación, costo, garantía o proveedor pueden consumir el mismo contrato de observabilidad únicamente cuando exista una fuente autorizada y reconciliada.

TI-INT-001 no convierte:

- una fecha contractual en alerta por sí sola;
- ausencia de gasto en costo cero;
- cuenta de proveedor en licencia activa;
- proveedor operacional en contrato vigente;
- señal de uso en decisión de renovación.

Los hechos comerciales y económicos conservan ORIGO y NUMERA como autoridad.

---

#### 37. Relación con TI-UX-006

Las señales de adopción, uso, error, soporte o aprendizaje pueden usar fuentes instrumentadas bajo este contrato.

Reglas:

- toda señal declara fuente y periodo;
- lectura o finalización no equivalen a adopción;
- telemetría de uso no se convierte por defecto en vigilancia individual;
- datos personales se minimizan;
- una señal de aprendizaje no concede competencia ni autorización;
- el conocimiento no cambia de vigencia por telemetría sin pasar por su ciclo editorial.

---

#### 38. Relación con PRINT-ARC

PRINT-ARC conserva el contrato del trabajo de impresión, cola, routing, idempotencia del job, receipt y resultado.

TI-INT-001 únicamente normaliza observaciones provenientes de impresora o camino técnico de impresión para que puedan ser correlacionadas con health y soporte.

Por tanto:

```text
TELEMETRÍA DE IMPRESORA
≠
AUTORIDAD SOBRE PRINT JOB
```

Y:

```text
JOB ACEPTADO
≠
RESULTADO FÍSICO CONFIRMADO
```

---

#### 39. Frontera con TI-INT-002

`TI-INT-002` permanece responsable de definir contratos entre SHELL, NEXO, ANIMA, VISO, ORIGO, NUMERA, PRINT-ARC, BLOQUE T y continuidad.

TI-INT-001 no fija todavía:

- endpoint concreto de una API interna;
- topic o canal concreto;
- schema físico interaplicación;
- mapping entre tablas específicas de aplicaciones VENTO;
- ownership técnico de cada transporte interno;
- despliegue o versionado de dichos contratos.

El handoff de TI-INT-001 es el contrato semántico de telemetría que esos contratos deberán respetar cuando transporten observaciones.

---

#### 40. Frontera con TI-INT-003

`TI-INT-003` permanece responsable de integraciones específicas con:

- MDM;
- soporte remoto;
- ISP;
- fabricantes;
- licenciamiento;
- proveedores tecnológicos.

Para cada proveedor real, TI-INT-003 deberá materializar los detalles que TI-INT-001 deja deliberadamente parametrizados:

- mecanismo concreto de autenticación;
- API o canal;
- versión;
- límites y cuotas;
- IDs nativos;
- mapping de campos;
- timestamps;
- retries;
- rate limits;
- webhook signatures;
- salida del proveedor;
- prueba y operación.

TI-INT-001 no inventa esos datos antes de seleccionar o demostrar la fuente real.

---

#### 41. Reconciliación AS-IS frente al contrato objetivo

Las fuentes canónicas vigentes demuestran el contrato documental de observabilidad, health, alertas, mapa técnico y requisitos de integración, pero no demuestran una implementación transversal completa de adaptadores productivos para las cinco familias.

Se conserva el máximo nivel de afirmación permitido:

| Familia          | Estado canónico demostrable                              | Resultado de TI-INT-001         | Implementación física                                      |
| ---------------- | -------------------------------------------------------- | ------------------------------- | ---------------------------------------------------------- |
| Endpoint         | modelo y necesidades de observación definidos            | contrato de adaptación completo | `FUERA_DE_ALCANCE`                                         |
| Red              | modelo, subtipos y señales esperadas definidos           | contrato de adaptación completo | `FUERA_DE_ALCANCE`                                         |
| Impresora        | identidades y semántica de impresión/health documentadas | contrato de adaptación completo | `FUERA_DE_ALCANCE`                                         |
| Aplicación       | catálogo, ambientes y observabilidad definidos           | contrato de adaptación completo | `FUERA_DE_ALCANCE`                                         |
| Servicio externo | dependencia externa y reglas de integración definidas    | contrato transversal completo   | proveedor específico `FUERA_DE_ALCANCE` hasta `TI-INT-003` |

La ausencia de evidencia de implementación completa no se utiliza como prueba de que no exista ninguna herramienta o integración parcial fuera de las fuentes revisadas.

---

#### 42. Pendientes físicos y condiciones de salida

| Pendiente                            | Estado                   | Propietario / destino                                    | Condición de salida                                                                      |
| ------------------------------------ | ------------------------ | -------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| implementación física de adaptadores | `FUERA_DE_ALCANCE`       | alcance de implementación autorizado para tecnología     | adapters implementados, versionados, protegidos y probados contra este contrato          |
| contratos interaplicación VENTO      | `FUERA_DE_ALCANCE`       | `TI-INT-002`                                             | fuentes, transportes, schemas, versiones, errores y reconciliación definidos por sistema |
| fuentes MDM y soporte remoto reales  | `PENDIENTE_DE_EVIDENCIA` | `TI-INT-003`                                             | proveedor/fuente seleccionados y autenticación, mapping, límites y salida demostrados    |
| fuentes ISP y fabricantes reales     | `PENDIENTE_DE_EVIDENCIA` | `TI-INT-003`                                             | APIs/canales y objetos reconciliados con evidencia suficiente                            |
| fuentes de licenciamiento/proveedor  | `PENDIENTE_DE_EVIDENCIA` | `TI-INT-003` + ORIGO/TI cuando aplique                   | proveedor, cuenta técnica, contrato de integración y mapping demostrados                 |
| identidades endpoint completas       | `PENDIENTE_DE_EVIDENCIA` | dominio endpoint + implementación tecnológica autorizada | población canónica reconciliada con claves estables antes de ingestión autoritativa      |
| topología de red materializada       | `PENDIENTE_DE_EVIDENCIA` | dominio de red + implementación tecnológica autorizada   | recursos y relaciones reconciliados sin inferencias por IP o nombre                      |
| health runtime productiva            | `FUERA_DE_ALCANCE`       | implementación de observabilidad + TI-DOM-010            | fuentes activas, frescura, reglas y evidencia permiten derivar health reproducible       |
| alertas productivas                  | `FUERA_DE_ALCANCE`       | implementación de observabilidad + autorización          | señales, reglas, routing, silencios y ownership implementados y probados                 |

No queda un pendiente de esta tarea sin propietario y condición de salida.

---

#### 43. Invariantes

1. fuente de telemetría no equivale a fuente de verdad empresarial;
2. adaptador no equivale a objeto monitoreado;
3. fallo del adaptador no equivale a fallo del objeto;
4. silencio no equivale a salud;
5. timeout no equivale automáticamente a failure definitivo;
6. reachability no equivale a health completa;
7. health no equivale a prioridad;
8. señal no equivale a alerta;
9. alerta no equivale a incidente;
10. incidente no equivale a causa;
11. `RECOVERY` no equivale a cierre;
12. provider status no equivale a disponibilidad empresarial;
13. severidad de proveedor no equivale a prioridad VENTO;
14. ID externo no crea identidad canónica por sí solo;
15. IP, MAC, serial o hostname no crean endpoint por inferencia;
16. printer job aceptado no equivale a impresión física confirmada;
17. `apps.is_active` no equivale a despliegue saludable;
18. URL accesible no equivale a servicio empresarial saludable;
19. SDK no equivale a proveedor contratado;
20. retry no puede crear doble observación lógica;
21. deduplicación no puede ocultar contenido contradictorio;
22. dato atrasado conserva su instante original;
23. correlación temporal no prueba causalidad;
24. observación manual no se disfraza de señal automática;
25. prueba sintética no produce efecto empresarial real;
26. telemetría ordinaria no contiene secretos;
27. cardinalidad alta no se acepta como dimensión ordinaria sin control;
28. autenticación de fuente no concede autoridad de configuración;
29. configuración de observabilidad permanece protegida;
30. TI-INT-001 no ejecuta ninguna integración física.

---

#### 44. Cobertura de prueba consumida

La tarea consume cobertura canónica vigente que ya protege:

- observabilidad por servicio, proceso, integración y dependencia;
- separación entre métricas, logs, health, eventos, alertas, incidentes y evidencia;
- nombres, unidades, dimensiones y severidad estables y versionados;
- presupuestos de cardinalidad;
- logs estructurados y sanitización;
- trazas y correlación segura;
- pérdida o expiración de telemetría sin eliminación del hecho empresarial;
- liveness, readiness, dependencia, degradación y health separados;
- pruebas sintéticas no destructivas;
- telemetría web/móvil segura;
- energía, batería, almacenamiento, reloj, versión, conectividad, DNS, cola, consumible, comando, receipt y resultado físico de dispositivos y periféricos;
- observabilidad de integraciones internas y externas con éxito, rechazo, timeout, unknown, retries, deduplicación, backlog y reconciliación;
- telemetría específica de impresión sin confundir job, comando y resultado físico;
- retry, idempotencia, timeout con resultado desconocido y `Retry-After`;
- reloj coherente y separación entre instante ocurrido, registrado y completado;
- autenticación, limits, retries, reconciliación y minimización de adaptadores externos;
- protección de secrets, logs, exports y configuración;
- mapping y deuda de evidencia para mapa técnico.

Esta tarea materializa el contrato documental que esa cobertura exige para las cinco familias sin introducir una conducta nueva independiente.

---

#### 45. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la cobertura vigente ya protege de forma explícita el contrato de observabilidad, la telemetría de dispositivos y periféricos, las integraciones internas y externas, la autenticación de fuentes, reloj, retries, idempotencia, deduplicación, reconciliación, cardinalidad, privacidad, ausencia de telemetría, separación de health/alerta/incidente y protección de configuración. TI-INT-001 materializa esas obligaciones para cinco familias de adaptador sin crear un nuevo estado, regla empresarial, permiso, algoritmo de health, esquema físico, integración desplegada o efecto técnico adicional.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 46. Criterios de aceptación

- [x] la continuidad vigente es `TI-UX-006 → TI-INT-001 → TI-INT-002`;
- [x] la tarea permanece exclusivamente documental;
- [x] se materializan exactamente cinco familias de adaptador;
- [x] las cinco familias tienen decisión de fuente, objeto, autenticación, reloj, retries, idempotencia y mapping;
- [x] se preservan siete formas de observación;
- [x] se preservan seis clases de señal;
- [x] se preservan cinco estados de health;
- [x] el adaptador no escribe health por semántica propietaria sin contrato de evidencia;
- [x] ausencia de telemetría no se presenta como salud;
- [x] fallo del adaptador no se presenta como fallo del objeto;
- [x] se separa tiempo de fuente y tiempo de recepción;
- [x] se conserva calidad de reloj;
- [x] se definen llegadas tardías y eventos fuera de secuencia;
- [x] se define idempotencia y conflicto de contenido;
- [x] se define deduplicación sin ocultar contradicción;
- [x] se define mapping resuelto, ambiguo, no resuelto e inválido;
- [x] no se crea identidad canónica desde IP, MAC, serial, hostname o texto similar;
- [x] endpoint permanece separado de activo, dispositivo compartido y persona;
- [x] red separa reachability de health;
- [x] impresora separa hardware, cola, job, command, receipt, consumible y resultado físico;
- [x] aplicación separa catálogo, despliegue, health y disponibilidad empresarial;
- [x] servicio externo no crea un tipo canónico nuevo ni convierte provider status en health VENTO;
- [x] pruebas sintéticas quedan no destructivas;
- [x] observación manual queda identificada como manual;
- [x] secrets y credenciales permanecen fuera de la telemetría ordinaria;
- [x] se controla cardinalidad y contenido libre;
- [x] se define self-observability del adaptador;
- [x] se definen degradación, backlog, rate limit, autenticación fallida y mapping fallido;
- [x] configuración de observabilidad permanece bajo autorización separada;
- [x] TI-UX-003 recibe fuente, frescura, mapping y evidencia sin estados fabricados;
- [x] TI-UX-002/TI-UX-004 reciben correlación sin creación automática de incidente o causa;
- [x] TI-UX-005 conserva ORIGO/NUMERA como autoridad comercial y económica;
- [x] TI-UX-006 conserva minimización y separación entre señal de adopción y evaluación individual;
- [x] PRINT-ARC conserva autoridad sobre el ciclo de impresión;
- [x] TI-INT-002 conserva contratos interaplicación;
- [x] TI-INT-003 conserva integraciones específicas de MDM, soporte remoto, ISP, fabricantes, licenciamiento y proveedores;
- [x] cada pendiente tiene propietario y condición de salida;
- [x] no se ejecuta código, Supabase, configuración, despliegue ni integración física;
- [x] se crean cero requisitos de prueba y se modifican cero existentes;
- [x] `TI-INT-002` permanece únicamente reservada.

---

#### 47. Estado de materialización

| Resultado                                        | Estado                            |
| ------------------------------------------------ | --------------------------------- |
| contrato transversal de adaptación de telemetría | `ESPECIFICADO`                    |
| envolvente conceptual mínima                     | `ESPECIFICADO`                    |
| autenticación de fuente                          | `ESPECIFICADO`                    |
| semántica temporal y calidad de reloj            | `ESPECIFICADO`                    |
| retries y límites                                | `ESPECIFICADO`                    |
| idempotencia y deduplicación                     | `ESPECIFICADO`                    |
| orden y llegadas tardías                         | `ESPECIFICADO`                    |
| mapping y reconciliación                         | `ESPECIFICADO`                    |
| frescura                                         | `ESPECIFICADO`                    |
| self-observability                               | `ESPECIFICADO`                    |
| adaptador endpoint                               | `ESPECIFICADO`                    |
| adaptador red                                    | `ESPECIFICADO`                    |
| adaptador impresora                              | `ESPECIFICADO`                    |
| adaptador aplicación                             | `ESPECIFICADO`                    |
| adaptador servicio externo/proveedor             | `ESPECIFICADO`                    |
| minimización y cardinalidad                      | `ESPECIFICADO`                    |
| correlación con UX y soporte                     | `ESPECIFICADO`                    |
| contratos físicos interaplicación                | `FUERA_DE_ALCANCE` — `TI-INT-002` |
| integraciones específicas de proveedor           | `FUERA_DE_ALCANCE` — `TI-INT-003` |
| implementación de collectors/agentes/webhooks    | `FUERA_DE_ALCANCE`                |
| cambios Supabase                                 | `NO_APLICA` en esta tarea         |
| cambios en requisitos de prueba                  | `NO_APLICA` — cero cambios        |

---

#### 48. Continuidad

ÚLTIMA TAREA APROBADA
`TI-UX-006 — Diseñar diagnóstico guiado, base de conocimiento y capacitación contextual sin saturación técnica`

TAREA ACTUAL APROBADA
`TI-INT-001 — Definir adaptadores de telemetría para endpoints, redes, impresoras, aplicaciones y servicios externos`

SIGUIENTE TAREA RESERVADA
`TI-INT-002 — Definir contratos con SHELL, NEXO, ANIMA, VISO, ORIGO, NUMERA, PRINT-ARC, BLOQUE T y continuidad`


### [ ] TI-INT-002 — Definir contratos con SHELL, NEXO, ANIMA, VISO, ORIGO, NUMERA, PRINT-ARC, BLOQUE T y continuidad
### [ ] TI-INT-003 — Definir integraciones con MDM, soporte remoto, ISP, fabricantes, licenciamiento y proveedores tecnológicos
