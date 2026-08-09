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


### ✅ TI-INT-002 — Definir contratos con SHELL, NEXO, ANIMA, VISO, ORIGO, NUMERA, PRINT-ARC, BLOQUE T y continuidad

**Estado:** APROBADA
**Tarea anterior:** `TI-INT-001 — Definir adaptadores de telemetría para endpoints, redes, impresoras, aplicaciones y servicios externos` — APROBADA
**Tarea siguiente:** `TI-INT-003 — Definir integraciones con MDM, soporte remoto, ISP, fabricantes, licenciamiento y proveedores tecnológicos` — RESERVADA
**Tipo de tarea:** documental; definición normativa y materializada de contratos internos entre tecnología y soporte, aplicaciones propietarias, servicio transversal de impresión, calidad y despliegue y continuidad empresarial
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/Z_TECNOLOGIA_Y_SOPORTE/04_INTEGRACIONES_Y_TELEMETRIA.md`
**Cambios físicos autorizados:** ninguno; no crea ni modifica código, paquetes, APIs, tablas, RLS, RPC, funciones, Edge Functions, migraciones, datos, colas, webhooks, topics, workers, pipelines, secretos, permisos, aplicaciones, dispositivos ni configuración de Supabase
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** cerrar el contrato tecnológico interno que permite a BLOQUE Z relacionarse con SHELL, NEXO, ANIMA, VISO, ORIGO, NUMERA, PRINT-ARC, BLOQUE T y continuidad sin duplicar fuentes de verdad, transferir propiedad por conveniencia, crear escrituras cruzadas, convertir infraestructura en autoridad empresarial ni inventar un transporte físico único todavía no aprobado.

---

#### 1. Resultado sustantivo

`TI-INT-002` queda documentalmente cerrada con **nueve contratos internos materializados**, uno por cada frontera indicada en el título:

1. SHELL;
2. NEXO;
3. ANIMA;
4. VISO;
5. ORIGO;
6. NUMERA;
7. PRINT-ARC;
8. BLOQUE T;
9. continuidad.

El resultado fija, para las nueve fronteras:

- autoridad y fuente propietaria;
- objetos que pueden referenciarse;
- entradas y salidas permitidas;
- tipo de interacción;
- identidad y correlación mínimas;
- reglas de autorización;
- semántica de idempotencia y reintento;
- reconciliación y tratamiento de resultado desconocido;
- sensibilidad y minimización;
- versionado y compatibilidad;
- responsabilidad sobre transporte físico;
- estado AS-IS verificable cuando existe evidencia;
- transición necesaria cuando el estado actual no respeta el contrato objetivo;
- propietario de cada pendiente y condición de salida.

Balance del resultado:

| Elemento                                   |  Resultado |
| ------------------------------------------ | ---------: |
| Fronteras esperadas                        |      **9** |
| Fronteras materializadas                   | **9 de 9** |
| Fronteras omitidas                         |      **0** |
| Contratos que crean nueva fuente de verdad |      **0** |
| Endpoints HTTP inventados                  |      **0** |
| Topics o canales inventados                |      **0** |
| Tablas nuevas inventadas                   |      **0** |
| Paquetes compartidos nuevos inventados     |      **0** |
| Cambios físicos                            |      **0** |
| Requisitos de prueba nuevos o modificados  |      **0** |

La tarea define el **contrato semántico y de frontera**. La selección o implementación de un endpoint, RPC, Edge Function, outbox, inbox, cola, worker, webhook, broker, topic o binding físico concreto solo puede ocurrir en la fase propietaria posterior y con evidencia del repositorio correspondiente.

---

#### 2. Entradas canónicas conservadas

La tarea consume y preserva, sin redefinir su autoridad:

- `TI-DOM-001` y `TI-SERVICE-001` a `TI-SERVICE-011`;
- `TI-DOM-002` a `TI-DOM-006` para identidades de configuración, endpoints, red, impresoras y aplicaciones;
- `TI-DOM-007` a `TI-DOM-009` para caso tecnológico, problema y cambio;
- `TI-DOM-010` y `TI-INT-001` para observabilidad, señales, health y adaptadores de telemetría;
- `TI-DOM-011` para respaldo, restauración y recuperación técnica;
- `TI-DOM-012` para licencias, garantías, contratos, renovaciones, uso y costos tecnológicos;
- `TI-DOM-013` para conocimiento, capacitación y adopción;
- `TI-AUTH-001` a `TI-AUTH-004` para segregación, privilegio, configuración protegida y datos técnicos sensibles;
- `TI-UX-001` a `TI-UX-006` para la experiencia objetivo de ANIMA y VISO;
- BLOQUE X, especialmente `INT-APP-001` a `INT-APP-010`;
- `ENTERPRISE-EVENT-CATALOG-001` y `EVENT-ENVELOPE-001`;
- BLOQUE H y `SHELL-CON-001` a `SHELL-CON-016` como futura materialización compartida de contratos;
- PRINT-ARC, incluidos sus contratos documentales ya aprobados de trabajo, enrutamiento, adaptador y confirmación;
- BLOQUE T y `SHELL-CI-001` a `SHELL-CI-024`;
- el dominio de continuidad y sus tareas `CONT-DOM-001` a `CONT-DOM-015`;
- `CONT-INT-001` a `CONT-INT-004` como continuidad futura del contrato desde el dominio de continuidad;
- los requisitos de prueba existentes de integración, SHELL, VISO, NEXO, ORIGO, NUMERA y continuidad.

No se crea un bus empresarial paralelo, un segundo catálogo de eventos, una segunda identidad de aplicación, una segunda fuente de activos, una segunda mesa de servicio, una segunda contabilidad, una segunda fuente contractual ni un segundo modelo de continuidad.

---

#### 3. Propiedad y frontera transversal

La regla base es:

```text
PROPIEDAD FUNCIONAL
≠ TRANSPORTE TECNICO
≠ PERSISTENCIA FISICA
≠ PUBLICADOR TECNICO
≠ CONSUMIDOR
≠ PERMISO
≠ VISIBILIDAD
```

Un componente puede transportar, publicar, proyectar o presentar información sin adquirir propiedad sobre el hecho empresarial.

Se preservan las siguientes autoridades:

| Dominio o superficie | Autoridad conservada                                                                                                            |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| SHELL                | identidad, catálogo de aplicaciones, cuentas y política de acceso                                                               |
| NEXO                 | activos tecnológicos físicos, ubicación, custodia, condición, mantenimiento y retiro físico                                     |
| ANIMA                | portal personal del trabajador, reporte simple, comunicación y aprendizaje contextual                                           |
| VISO                 | expediente tecnológico, solicitud, incidente, problema, cambio, prioridad, SLA, asignación y cierre canónico                    |
| ORIGO                | compra, proveedor, relación comercial y contrato                                                                                |
| NUMERA               | compromiso, gasto, costo y hecho económico                                                                                      |
| PRINT-ARC            | trabajo, cola, enrutamiento, adaptador, intento y resultado técnico de impresión                                                |
| BLOQUE T             | pruebas de consumidor, compatibilidad, release, despliegue, rollback y evidencia de entrega                                     |
| continuidad          | declaración y gobierno del incidente de continuidad, operación mínima, contingencia, recuperación empresarial y reincorporación |

BLOQUE Z conserva el modelo operativo tecnológico, las referencias técnicas y la coordinación entre estas autoridades. No toma propiedad de sus datos por consumirlos.

---

#### 4. Tipos de interacción permitidos

La tarea reconoce seis tipos de artefacto o interacción, que permanecen separados:

1. **consulta o proyección autorizada**: lectura de una fuente propietaria sin transferencia de propiedad;
2. **comando o solicitud**: petición para que la propietaria evalúe y ejecute una acción dentro de su dominio;
3. **evento empresarial**: hecho durable ya ocurrido bajo la propietaria correspondiente;
4. **observación técnica o evento adaptado**: telemetría, evidencia o señal gobernada por `TI-INT-001` y observabilidad;
5. **notificación humana**: comunicación para una persona, sin autoridad transaccional por sí sola;
6. **auditoría o log técnico**: evidencia de ejecución o diagnóstico, distinta del hecho empresarial.

Reglas:

- una consulta no autoriza escritura;
- un comando aceptado no prueba que el efecto empresarial ocurrió;
- un evento empresarial no es un comando;
- una observación técnica no es un evento empresarial por defecto;
- una notificación entregada no es una transición de estado;
- un log no reemplaza auditoría ni evidencia empresarial;
- un ACK técnico no equivale a éxito empresarial;
- ninguna de estas piezas concede permiso por su sola existencia.

`TI-INT-002` no crea un nuevo sobre de eventos. Los eventos empresariales reutilizan `EVENT-ENVELOPE-001` cuando correspondan.

Mientras `SHELL-CON-012` no materialice físicamente el contrato compartido de acciones, esta tarea no crea un envelope alternativo de comandos.

---

#### 5. Identidad, correlación y causalidad

Toda interacción que cruce una frontera deberá conservar las identidades canónicas que realmente apliquen y suficientes referencias para reconstruir la operación.

Como mínimo, cuando existan en el caso concreto, se preservan:

- aplicación productora o solicitante;
- proceso e instancia de proceso;
- recurso propietario;
- identidad del servicio tecnológico;
- identidad del caso tecnológico;
- identidad del activo, endpoint, dispositivo compartido, recurso de red, impresora o aplicación afectada;
- identidad del proveedor o contrato cuando corresponda;
- referencia económica cuando corresponda;
- trabajo de impresión cuando corresponda;
- cambio, release o despliegue cuando corresponda;
- incidente de continuidad cuando corresponda;
- actor o principal técnico efectivo;
- sede, área, dispositivo y contexto autorizado cuando apliquen;
- correlación, causalidad, solicitud e idempotencia;
- versión de contrato o esquema;
- evidencia y resultado.

No se usa coincidencia de nombre, IP, MAC, serial, correo, URL o texto libre para crear automáticamente una relación entre objetos distintos.

Una correlación relaciona expedientes o hechos; no fusiona identidades.

---

#### 6. Contrato de idempotencia, reintento y resultado desconocido

Toda operación reintentable o con efecto debe preservar las reglas ya aprobadas:

1. la identidad lógica de la operación se fija antes del primer envío;
2. el mismo identificador con el mismo contenido lógico no puede producir un segundo efecto;
3. el mismo identificador con contenido distinto produce conflicto y no reutiliza la operación;
4. los reintentos usan límites, backoff, jitter y clasificación de errores cuando apliquen;
5. `Retry-After` se respeta cuando la fuente lo provea;
6. un timeout posterior a un posible efecto se trata como resultado desconocido hasta reconciliar;
7. el resultado desconocido no autoriza repetición ciega;
8. replay y retry permanecen diferenciados;
9. compensar no significa borrar el hecho original;
10. toda reconciliación conserva antes, después, causa, actor o principal, referencia original y evidencia.

El contrato físico futuro podrá usar outbox, inbox, claim atómico, RPC, cola u otro mecanismo aprobado; esta tarea no elige uno por conveniencia documental.

---

#### 7. Autorización y sensibilidad

Cada propietaria debe volver a validar autorización en su frontera.

La presencia de alguno de estos elementos no concede autoridad:

- evento;
- `correlation_id`;
- referencia de caso;
- referencia de activo;
- URL;
- dispositivo compartido;
- cuenta técnica;
- rol visible;
- token de sesión de otra superficie;
- relación con un proveedor;
- pertenencia a una sede;
- acceso a un repositorio;
- capacidad técnica del transportador.

Los contratos internos no transportan, salvo mecanismo protegido específicamente aprobado:

- contraseñas;
- tokens reutilizables;
- claves privadas;
- OTP;
- códigos de recuperación;
- cookies de sesión;
- credenciales de proveedor;
- secretos de servicio;
- PSK de red;
- payloads completos sensibles cuando una referencia protegida es suficiente.

La minimización de datos aplica tanto al evento como al log, ticket, notificación, error y evidencia de integración.

---

#### 8. Versionado, compatibilidad y despliegue independiente

El contrato objetivo conserva las reglas de BLOQUE H y BLOQUE T:

- los contratos compartidos se materializan en la fundación común, no mediante copias manuales divergentes;
- un cambio incompatible de significado, obligatoriedad, sensibilidad o interpretación exige versión mayor;
- campos aditivos opcionales no pueden reinterpretar historia;
- cada versión publicada de un paquete compartido debe tener identidad inmutable y reproducible;
- cada consumidor afectado debe formar parte de la matriz de compatibilidad;
- una aplicación puede adoptar una versión compatible sin obligar a todas las demás a desplegar simultáneamente;
- rollback se prueba por repositorio y combinación soportada;
- deprecación y retiro no se ejecutan mientras existan consumidores no reconciliados;
- ninguna release se considera apta únicamente porque el paquete fuente compile.

La tarea no declara implementado `@vento/contracts`: `SHELL-CON-001` continúa siendo la autoridad de materialización física del paquete compartido.

---

#### 9. Decisión de transporte físico

No se adopta un transporte universal para estas nueve fronteras.

La decisión documental es deliberada:

```text
NO HAY ENDPOINT UNIVERSAL
NO HAY TOPIC UNIVERSAL
NO HAY TABLA UNIVERSAL DE INTEGRACION
NO HAY BROKER UNIVERSAL APROBADO POR ESTA TAREA
```

Motivo:

- BLOQUE X separa contrato empresarial de transporte;
- `TREQ-INTEGRATION-050` impide escoger prematuramente topics, tablas, colas, broker, triggers, webhooks, endpoints, jobs, credenciales o proveedor de transporte desde el contrato de eventos;
- el estado actual muestra mecanismos distintos y algunos son legacy;
- la implementación deberá elegir por frontera el mecanismo mínimo que respete propiedad, idempotencia, seguridad, observabilidad, compatibilidad y rollback.

Por tanto:

- la **semántica** de las nueve fronteras queda cerrada aquí;
- el **binding físico** solo se fija cuando exista la evidencia y fase propietaria;
- una ausencia de binding no autoriza una escritura directa temporal entre dominios.

---

#### 10. Contrato con SHELL

##### 10.1 Autoridad

SHELL conserva:

- identidad y autenticación;
- catálogo e identidad de aplicaciones;
- cuentas y política de acceso;
- códigos y contratos compartidos cuando BLOQUE H los materialice;
- contexto compartido y navegación transversal conforme a sus autoridades aprobadas.

##### 10.2 Lo que BLOQUE Z puede consumir

Tecnología puede consumir referencias autorizadas suficientes para:

- identificar persona o principal técnico;
- resolver aplicación canónica;
- relacionar una necesidad de acceso con el recurso correcto;
- diagnosticar estado de cuenta o restricción sin exponer secreto;
- correlacionar endpoint o dispositivo compartido con el contexto de acceso cuando exista relación aprobada;
- asociar un caso tecnológico con la aplicación o recurso protegido correspondiente.

##### 10.3 Lo que BLOQUE Z puede solicitar

Una acción sobre alta, cambio, recuperación, suspensión, revocación, privilegio o política de acceso debe entrar como solicitud autorizada hacia la autoridad correspondiente. BLOQUE Z no escribe una decisión de acceso porque diagnosticó el problema.

##### 10.4 Eventos y propiedad

SHELL conserva **cero procesos y cero definiciones de eventos empresariales como productora** dentro del registro aprobado de emisoras. Autenticación, navegación, contexto, un paquete compartido, Supabase o un publicador técnico no convierten SHELL en propietaria de los procesos de otras aplicaciones.

Cuando infraestructura de SHELL publique técnicamente por cuenta de una propietaria, la aplicación empresarial sigue siendo la productora y el componente técnico se registra por separado.

##### 10.5 Contrato compartido

La materialización común permanece en:

- `SHELL-CON-001` para `@vento/contracts`;
- `SHELL-CON-012` para acciones funcionales;
- `SHELL-CON-013` para eventos empresariales;
- `SHELL-CON-014` para traspasos entre aplicaciones;
- `SHELL-CON-015` para tareas pendientes;
- `SHELL-CON-016` para propiedad funcional.

TI-INT-002 no crea una copia tecnológica de esos contratos.

##### 10.6 Prohibiciones

No se permite:

- conceder acceso desde VISO por cambiar el estado de un ticket;
- inferir privilegio por ser `RESPONSABLE_TECNOLOGICO`;
- compartir credenciales administrativas en un caso;
- convertir `app_code` en prueba de despliegue o salud;
- publicar un evento empresarial ajeno bajo `shell`;
- usar el paquete compartido como bypass de autorización.

##### 10.7 Estado y salida

| Elemento                         | Estado         | Propietario                       | Condición de salida                                               |
| -------------------------------- | -------------- | --------------------------------- | ----------------------------------------------------------------- |
| Semántica SHELL ↔ TI             | `ESPECIFICADO` | `TI-INT-002`                      | cumplida en esta tarea                                            |
| Paquete común físico             | `NO INICIADA`  | `SHELL-CON-001`                   | paquete implementado, versionado y publicable con pruebas propias |
| Acciones/handoffs compartidos    | `NO INICIADA`  | `SHELL-CON-012` a `SHELL-CON-016` | contratos materializados sin copia divergente                     |
| Compatibilidad multi-repositorio | `NO INICIADA`  | `SHELL-CI-001` a `SHELL-CI-015`   | matrices, pruebas de consumidores y rollback demostrados          |

---

#### 11. Contrato con NEXO

##### 11.1 Autoridad

NEXO conserva la identidad física del activo tecnológico y su:

- clasificación;
- ubicación;
- custodia;
- condición;
- mantenimiento;
- garantía física cuando corresponda;
- retiro.

El activo físico permanece separado de:

- endpoint;
- dispositivo compartido;
- recurso de red;
- impresora lógica;
- cola de impresión;
- aplicación;
- servicio tecnológico.

##### 11.2 Estado AS-IS verificable

Existe una superficie física de activos basada en `asset_items`, con migración propietaria en `vento-shell` y consumidores de inventario en NEXO.

Ese hecho permite adoptar `asset_items` como **fuente física AS-IS del activo**, pero no permite usarla como identidad universal de endpoint, dispositivo compartido, red o impresora.

##### 11.3 Lecturas permitidas

BLOQUE Z puede consumir referencias de activo para:

- identificar el equipo físico afectado;
- conocer sede, ubicación, custodia y condición cuando estén disponibles;
- correlacionar mantenimiento y soporte;
- distinguir sustitución física de recuperación lógica;
- relacionar un activo con endpoint, red o impresora solo cuando la relación esté explícitamente reconciliada.

##### 11.4 Escrituras y handoff

Cuando soporte detecte una necesidad de:

- mantenimiento físico;
- traslado;
- cambio de custodia;
- alta o baja física;
- sustitución;
- retiro;

la solicitud debe llegar al dominio propietario. Un diagnóstico en VISO no autoriza actualización directa del inventario NEXO.

##### 11.5 Reconciliación

No se admite crear relación de activo a endpoint, dispositivo, impresora o red por coincidencia de:

- serial;
- MAC;
- IP;
- hostname;
- descripción;
- sede;
- marca o modelo.

La relación requiere evidencia explícita y debe preservar ambas identidades.

##### 11.6 Prohibiciones

No se permite:

- convertir `asset_items.id` en `endpoint_id`;
- convertir la condición física `OPERATIVA` en health `HEALTHY`;
- convertir ubicación física en autorización territorial;
- cambiar custodia desde una alerta;
- retirar un activo porque dejó de reportar telemetría;
- asumir que una impresora física y el target lógico de PRINT-ARC son el mismo objeto.

##### 11.7 Estado y salida

| Elemento                                     | Estado                   | Propietario                                                                                        | Condición de salida                                       |
| -------------------------------------------- | ------------------------ | -------------------------------------------------------------------------------------------------- | --------------------------------------------------------- |
| Semántica NEXO ↔ TI                          | `ESPECIFICADO`           | `TI-INT-002`                                                                                       | cumplida en esta tarea                                    |
| Fuente física de activos AS-IS               | `IMPLEMENTADO`           | NEXO / `vento-shell` para migraciones                                                              | se conserva; no requiere sustitución por esta tarea       |
| Reconciliación activo ↔ identidades técnicas | `PENDIENTE_DE_EVIDENCIA` | `TI-DOM-002`, `TI-DOM-003`, `TI-DOM-005` y `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` | relación estable materializada y validada sin inferencias |

---

#### 12. Contrato con ANIMA

##### 12.1 Autoridad

ANIMA conserva la experiencia personal del trabajador para:

- reportar una necesidad o síntoma;
- consultar sus casos autorizados;
- aportar información;
- recibir comunicación;
- seguir un workaround seguro;
- confirmar si el servicio volvió a funcionar;
- recibir conocimiento o capacitación contextual.

ANIMA no conserva autoridad para decidir:

- clasificación ITSM;
- impacto;
- urgencia;
- prioridad;
- SLA;
- causa;
- asignación técnica;
- cambio;
- cierre canónico del caso.

##### 12.2 Estado AS-IS verificable

La implementación actual de ANIMA usa directamente las superficies compartidas:

- `support_tickets`;
- `support_messages`;
- `support_ticket_reads`.

El comportamiento observado incluye:

- creación de ticket con `category = "attendance"` y estado `open`;
- creación del primer mensaje;
- actualización a `in_progress` al enviar un mensaje;
- actualización a `closed` y escritura de `resolved_at` desde la acción de cierre del cliente;
- ocultamiento mediante lectura personal.

Este comportamiento se conserva como evidencia AS-IS, **no como contrato objetivo**.

##### 12.3 Contrato objetivo ANIMA → VISO

El reporte del trabajador debe transportar:

- identidad y contexto autorizados ya conocidos;
- síntoma o necesidad en lenguaje humano;
- sede, área, aplicación o dispositivo cuando sean resolubles;
- evidencia permitida;
- una identidad estable de solicitud/correlación que evite duplicados.

La recepción debe devolver una referencia estable del caso o un resultado explícito de rechazo/fallo. La interfaz no presenta caso creado hasta tener confirmación autoritativa.

##### 12.4 Contrato de mensajes

Un mensaje del trabajador:

- se agrega a la comunicación del caso autorizado;
- conserva autoría y tiempo;
- no cambia por sí mismo prioridad, SLA, clasificación, causa o estado;
- no convierte automáticamente el caso a `in_progress`;
- no concede acceso a la cola administrativa.

##### 12.5 Contrato de validación

La confirmación del trabajador de que el servicio volvió a funcionar constituye una **entrada de validación** para VISO. No equivale a cerrar el caso, eliminar causa raíz o aceptar un cambio técnico.

##### 12.6 Transición obligatoria del legado

La futura implementación deberá eliminar como semántica objetivo estas equivalencias actuales:

```text
ENVIAR MENSAJE
≠ CAMBIAR ESTADO DEL CASO

CERRAR CONVERSACION EN ANIMA
≠ CERRAR CASO TECNOLOGICO

CATEGORY LEGACY ATTENDANCE
≠ CLASIFICACION TECNOLOGICA CANONICA
```

La implementación podrá reutilizar persistencia existente si demuestra que respeta la propiedad de VISO, autorización, estados, idempotencia y trazabilidad. Reutilizar tabla no autoriza reutilizar semántica legacy.

##### 12.7 Estado y salida

| Elemento                      | Estado                                         | Propietario                                                          | Condición de salida                                      |
| ----------------------------- | ---------------------------------------------- | -------------------------------------------------------------------- | -------------------------------------------------------- |
| Semántica ANIMA ↔ VISO        | `ESPECIFICADO`                                 | `TI-INT-002` + `TI-UX-001`/`TI-UX-002`                               | cumplida documentalmente                                 |
| Bandeja/mensajería AS-IS      | `IMPLEMENTADO` parcialmente                    | ANIMA + persistencia en `vento-shell`                                | se conserva como evidencia actual                        |
| Cambio automático por mensaje | `IMPLEMENTADO` legacy, no conforme al objetivo | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` + ANIMA/VISO | mensaje deja de mutar estado canónico por efecto lateral |
| Cierre desde cliente          | `IMPLEMENTADO` legacy, no conforme al objetivo | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` + ANIMA/VISO | cierre queda bajo contrato y autoridad de VISO           |
| Handoff compartido            | `NO INICIADA` físicamente como contrato común  | `SHELL-CON-014`                                                      | handoff versionado y probado por ambos consumidores      |

---

#### 13. Contrato con VISO

##### 13.1 Autoridad

VISO conserva el expediente tecnológico de `VPROC-0058` y el gobierno de:

- solicitud de servicio;
- incidente;
- problema;
- error conocido;
- cambio;
- impacto;
- urgencia;
- prioridad;
- SLA;
- asignación;
- comunicación;
- diagnóstico;
- restauración;
- validación;
- cierre y reapertura.

##### 13.2 Entradas permitidas

VISO puede recibir referencias y evidencia desde:

- ANIMA para reporte y comunicación del trabajador;
- SHELL para identidad, aplicación y contexto de acceso;
- NEXO para activo físico;
- el grafo de configuración de BLOQUE Z para endpoint, red, impresora, aplicación y servicio;
- `TI-INT-001` para observaciones técnicas;
- PRINT-ARC para trabajo, ruta, intento y resultado de impresión;
- ORIGO para proveedor o contrato relacionado;
- NUMERA para referencia económica cuando sea necesaria y autorizada;
- BLOQUE T para evidencia de prueba, release, despliegue y rollback;
- continuidad para correlación de un incidente empresarial de continuidad.

##### 13.3 Salidas permitidas

VISO puede producir o exponer, según autorización:

- referencia del caso;
- estado canónico;
- acción requerida;
- comunicación;
- asignación;
- prioridad y SLA;
- referencias a problema o cambio;
- necesidad de validación;
- decisión de cierre o reapertura;
- handoff autorizado a otra autoridad.

VISO no reescribe la fuente propietaria de un activo, contrato, costo, licencia, print job o identidad.

##### 13.4 Alertas, health y casos

Se preserva:

```text
SENAL
≠ ALERTA
≠ CASO
≠ INCIDENTE
≠ PROBLEMA
≠ CAMBIO
≠ HEALTH
```

Una alerta puede originar o enriquecer un caso conforme a política, pero no cambia automáticamente su prioridad ni lo cierra. `HEALTHY` posterior no cierra un incidente sin validación y criterio de cierre.

##### 13.5 Cambio frente a BLOQUE T

VISO conserva la decisión y expediente del cambio. BLOQUE T conserva la ejecución técnica de pruebas, release, despliegue y rollback.

Por tanto:

- aprobar cambio no equivale a desplegar;
- deployment exitoso no equivale a validar cambio;
- rollback técnico no elimina el expediente ni sus efectos;
- cerrar cambio requiere evidencia y validación conforme a su contrato.

##### 13.6 Estado y salida

| Elemento                                   | Estado                                 | Propietario                                                    | Condición de salida                                                          |
| ------------------------------------------ | -------------------------------------- | -------------------------------------------------------------- | ---------------------------------------------------------------------------- |
| Semántica VISO ↔ TI                        | `ESPECIFICADO`                         | `TI-INT-002` + `TI-DOM-007` a `TI-DOM-009`                     | cumplida documentalmente                                                     |
| Contrato físico completo del caso objetivo | `PENDIENTE_DE_EVIDENCIA`               | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` + VISO | persistencia/API/acciones implementadas y probadas contra el modelo objetivo |
| Handoff ANIMA ↔ VISO                       | `NO INICIADA` como contrato compartido | `SHELL-CON-014` + consumidores                                 | compatibilidad y pruebas de ambos lados                                      |

---

#### 14. Contrato con ORIGO

##### 14.1 Autoridad

ORIGO conserva:

- proveedor;
- compra;
- relación comercial;
- contrato;
- condiciones comerciales;
- renovación o terminación contractual.

BLOQUE Z conserva la necesidad técnica, el uso, el impacto operativo y la evidencia de soporte; no adquiere propiedad contractual.

##### 14.2 Estado AS-IS verificable

ORIGO dispone de superficies de proveedores y órdenes de compra. El código actual consulta autorización y opera sobre `suppliers`; además verifica relaciones con `purchase_orders` antes de eliminar un proveedor.

Esta evidencia confirma una fuente operativa actual de proveedor y compra, sin demostrar todavía un binding tecnológico completo entre proveedor, contrato, aplicación, licencia y costo.

##### 14.3 Entradas desde tecnología

Tecnología puede aportar a ORIGO, mediante la autoridad correspondiente:

- necesidad técnica;
- aplicación o servicio dependiente;
- producto o plan requerido;
- soporte necesario;
- alcance de ambientes;
- dependencia de datos o integración;
- impacto de renovación o terminación;
- evidencia técnica de incumplimiento o degradación;
- requisito de salida, exportación o transición.

Esa información no constituye orden de compra, contrato ni aprobación comercial por sí sola.

##### 14.4 Salidas hacia tecnología

ORIGO puede exponer referencias autorizadas suficientes para que BLOQUE Z conozca:

- proveedor propietario;
- contrato relacionado;
- vigencia y estado contractual;
- producto o plan;
- entitlement cuando aplique;
- soporte contratado;
- renovación o terminación relevante;
- condiciones necesarias para ejecutar un cambio técnico.

##### 14.5 Prohibiciones

No se permite:

- editar proveedor o contrato desde VISO por resolver un caso;
- convertir estado contractual en health técnico;
- convertir una factura o compra en licencia activa sin reconciliación;
- guardar credenciales del proveedor dentro del contrato de soporte;
- usar una referencia ORIGO como fuente del costo contable final.

##### 14.6 Estado y salida

| Elemento                                                  | Estado                      | Propietario                                                                          | Condición de salida                                     |
| --------------------------------------------------------- | --------------------------- | ------------------------------------------------------------------------------------ | ------------------------------------------------------- |
| Semántica ORIGO ↔ TI                                      | `ESPECIFICADO`              | `TI-INT-002` + `TI-DOM-012`                                                          | cumplida documentalmente                                |
| Fuente de proveedores/compras AS-IS                       | `IMPLEMENTADO` parcialmente | ORIGO                                                                                | se conserva como autoridad operativa existente          |
| Binding proveedor/contrato ↔ servicio/aplicación/licencia | `PENDIENTE_DE_EVIDENCIA`    | `TI-DOM-006`, `TI-DOM-012` y `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` | relación estable, autorizada y reconciliada con pruebas |

---

#### 15. Contrato con NUMERA

##### 15.1 Autoridad

NUMERA conserva:

- compromiso;
- gasto;
- costo;
- hecho económico;
- método y periodo de cálculo cuando corresponda.

BLOQUE Z conserva necesidad técnica, consumo técnico, referencias de uso y contexto de servicio. ORIGO conserva compra y contrato.

##### 15.2 Entradas desde tecnología

Tecnología puede aportar referencias para correlacionar:

- servicio o aplicación;
- licencia o asiento;
- proveedor y contrato;
- periodo de uso;
- centro, sede o contexto autorizado cuando aplique;
- evidencia de consumo técnico;
- evento de renovación, baja o cambio técnico.

Estas referencias no autorizan una escritura directa al libro, costo o hecho económico propietario.

##### 15.3 Salidas hacia tecnología

Tecnología puede consumir, cuando esté autorizado, una referencia económica suficiente para:

- visualizar costo tecnológico;
- analizar renovación;
- relacionar gasto con servicio o proveedor;
- identificar impacto económico de una decisión técnica.

La proyección tecnológica no se convierte en segunda contabilidad ni recalcula el hecho económico con una fórmula local.

##### 15.4 Estado físico actual

En las fuentes técnicas revisadas no se materializó una relación tecnológica específica y aprobada que vincule de extremo a extremo servicio, licencia, proveedor, contrato y hecho económico de NUMERA.

La ausencia de esa evidencia no se interpreta como ausencia de NUMERA ni de sus hechos económicos. Solo impide inventar aquí una tabla, campo o mapping técnico no demostrado.

##### 15.5 Pendiente con salida explícita

| Elemento                                           | Estado                   | Propietario                                                            | Condición de salida                                                                                      |
| -------------------------------------------------- | ------------------------ | ---------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------- |
| Semántica NUMERA ↔ TI                              | `ESPECIFICADO`           | `TI-INT-002` + `TI-DOM-012`                                            | cumplida documentalmente                                                                                 |
| Binding técnico costo ↔ servicio/licencia/contrato | `PENDIENTE_DE_EVIDENCIA` | `TI-DOM-012` + `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` | mapping estable hacia el hecho económico propietario, sin fuente competidora, con prueba de conciliación |

---

#### 16. Contrato con PRINT-ARC

##### 16.1 Autoridad

PRINT-ARC conserva:

- trabajo de impresión;
- decisión de enrutamiento;
- target;
- adaptador;
- intento;
- cola;
- retry;
- confirmación;
- reconciliación del resultado técnico.

NEXO conserva el activo físico de impresora. La aplicación que origina el documento conserva el hecho empresarial que se quiere representar.

##### 16.2 Contratos existentes reutilizados

TI-INT-002 no crea un segundo contrato de impresión. Reutiliza los contratos aprobados de PRINT-ARC, incluyendo:

- `VENTO-PRINT-JOB`;
- `VENTO-PRINT-ROUTE`;
- el contrato de adaptador;
- el contrato de confirmación;
- las identidades de trabajo, ruta, intento, copia y correlación definidas allí.

##### 16.3 Estado AS-IS relevante

La superficie actual de NEXO detecta dispositivos BrowserPrint y puede enviar representación directamente al dispositivo, pero la documentación PRINT-ARC ya clasifica esa superficie como no equivalente al contrato transversal objetivo.

Por tanto, TI-INT-002 no convierte ese envío local en el binding interno canónico.

##### 16.4 Entradas desde BLOQUE Z y VISO

Soporte puede referenciar:

- impresora lógica;
- activo físico reconciliado;
- trabajo de impresión;
- decisión de ruta;
- intento;
- estado de cola;
- error normalizado;
- confirmación disponible;
- evidencia de heartbeat o telemetría;
- caso o cambio correlacionado.

Una acción de reimpresión, cancelación, cambio de target, routing o administración sigue el contrato y autorización propietaria de PRINT-ARC.

##### 16.5 No equivalencias obligatorias

```text
JOB ADMITIDO
≠ JOB ENCOLADO
≠ ENVIADO
≠ ADAPTER_ACCEPTED
≠ PERIPHERAL_ACCEPTED
≠ PRINTED_VERIFIED
≠ DELIVERED_VERIFIED
```

Además:

- heartbeat no demuestra impresión;
- conectividad no demuestra impresión;
- timeout no demuestra fallo ni éxito;
- `RESULT_UNKNOWN` bloquea repetición ciega;
- reintento conserva la misma intención/copia;
- reimpresión es una acción separada y autorizada;
- soporte no cambia el hecho empresarial que originó el documento.

##### 16.6 Estado y salida

| Elemento                       | Estado                        | Propietario                                             | Condición de salida                                                        |
| ------------------------------ | ----------------------------- | ------------------------------------------------------- | -------------------------------------------------------------------------- |
| Semántica PRINT-ARC ↔ TI       | `ESPECIFICADO`                | `TI-INT-002` + PRINT-ARC                                | cumplida documentalmente                                                   |
| Contratos PRINT-ARC            | `ESPECIFICADO`                | `PRINT-ARC-001` a `PRINT-ARC-020`                       | cerrados documentalmente según su propio bloque                            |
| Binding físico transversal     | `NO INICIADA`                 | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` | workers/adaptadores/colas implementados y validados sin sustituir contrato |
| Superficie BrowserPrint actual | `IMPLEMENTADO` legacy/parcial | NEXO                                                    | no se presenta como conformidad hasta consumir contratos PRINT-ARC         |

---

#### 17. Contrato con BLOQUE T

##### 17.1 Autoridad

BLOQUE T conserva:

- pruebas de paquetes compartidos;
- build independiente;
- releases versionados;
- changelog;
- matriz de compatibilidad;
- pruebas de consumidores;
- actualización controlada de consumidores;
- rollback por repositorio;
- despliegue no simultáneo obligatorio;
- comando reproducible de pruebas;
- gate de requisitos de prueba;
- bloqueo por pruebas fallidas;
- publicación de evidencia;
- despliegue, readiness, cutover, piloto, hypercare, estabilización y cierre de cada paquete aprobado.

##### 17.2 Entrada VISO/BLOQUE Z → BLOQUE T

Cuando un cambio tecnológico requiera código, paquete, configuración o despliegue, la entrada debe conservar:

- referencia del cambio;
- sistema, servicio y consumidores afectados;
- versión actual y objetivo cuando sean conocidas;
- criterio de aceptación;
- riesgo y ventana aprobados;
- dependencias;
- requisitos `TREQ-*` aplicables;
- evidencia preexistente;
- condiciones de rollback;
- señales que deben observarse antes, durante y después.

##### 17.3 Salida BLOQUE T → VISO/BLOQUE Z

La salida debe permitir correlacionar:

- build;
- pruebas;
- compatibilidad;
- versión/release;
- consumidor actualizado;
- despliegue;
- rollback si ocurrió;
- evidencia;
- incidencias de ejecución;
- estado de estabilización.

La evidencia de BLOQUE T enriquece el expediente de cambio, pero no lo cierra automáticamente.

##### 17.4 Secuencia propietaria

Se preservan:

- `SHELL-CI-001` a `SHELL-CI-006` para package/release/compatibilidad;
- `SHELL-CI-007` a `SHELL-CI-015` para consumidores y rollback;
- `SHELL-CI-016` a `SHELL-CI-019` para automatización, evidencia y gates;
- `SHELL-CI-020` a `SHELL-CI-024` para ejecución de un paquete previamente aprobado.

##### 17.5 No equivalencias

```text
BUILD EXITOSO
≠ PRUEBAS COMPLETAS
≠ COMPATIBILIDAD DEMOSTRADA
≠ RELEASE PUBLICADA
≠ DESPLIEGUE EXITOSO
≠ CAMBIO VALIDADO
≠ SERVICIO RESTAURADO
```

##### 17.6 Estado y salida

| Elemento                                   | Estado                                             | Propietario                     | Condición de salida                                     |
| ------------------------------------------ | -------------------------------------------------- | ------------------------------- | ------------------------------------------------------- |
| Semántica BLOQUE T ↔ TI                    | `ESPECIFICADO`                                     | `TI-INT-002` + `TI-DOM-009`     | cumplida documentalmente                                |
| Pipeline de package/release/compatibilidad | `NO INICIADA`                                      | `SHELL-CI-001` a `SHELL-CI-019` | automatización y evidencia reproducible implementadas   |
| Ejecución de paquetes                      | `NO INICIADA` salvo instancias autorizadas futuras | `SHELL-CI-020` a `SHELL-CI-024` | paquete aprobado atraviesa ciclo completo con evidencia |

---

#### 18. Contrato con continuidad

##### 18.1 Frontera

El incidente tecnológico y el incidente de continuidad son expedientes diferentes y correlacionables.

```text
INCIDENTE TECNOLOGICO
≠ INCIDENTE DE CONTINUIDAD
```

VISO y BLOQUE Z gobiernan el expediente técnico. El dominio de continuidad gobierna la declaración, operación mínima, contingencia, mando, recuperación empresarial, reincorporación y cierre de continuidad.

##### 18.2 Entrada TI → continuidad

Cuando la afectación pueda superar el umbral empresarial, tecnología puede aportar:

- servicio afectado;
- proceso o capacidad dependiente;
- sede o alcance;
- estado técnico y frescura de evidencia;
- incidente tecnológico correlacionado;
- dependencia afectada;
- proveedor o infraestructura relacionada;
- hipótesis técnica identificada como hipótesis;
- recuperación técnica disponible;
- riesgo de datos pendientes o efectos duplicados;
- cambios o releases correlacionados;
- evidencia de respaldo/restauración cuando aplique.

Una señal `OFFLINE`, una alerta crítica o un proveedor caído **no activa por sí solos continuidad**.

##### 18.3 Entrada continuidad → TI

Continuidad puede solicitar, mediante autoridad válida:

- evaluación técnica de una alternativa;
- recuperación o restauración;
- failover autorizado;
- retorno controlado;
- soporte para modo mínimo;
- reconciliación de pendientes;
- evidencia de restauración y health.

La urgencia empresarial no elimina autorización, segregación, integridad ni protección de secretos. Las reglas específicas de emergencia pertenecen al bloque de continuidad.

##### 18.4 Recuperación y cierre

Se conserva:

- backup exitoso no equivale a restauración probada;
- restauración técnica no equivale a recuperación empresarial;
- recuperación empresarial no equivale a cierre del incidente tecnológico;
- el retorno de conectividad no equivale a reconciliación completa;
- pendientes creados durante contingencia se reincorporan con identidad, idempotencia y resolución de conflictos;
- una operación manual no se sobrescribe silenciosamente al reconectar;
- los dos expedientes conservan su propia autoridad de cierre.

##### 18.5 Continuidad documental posterior

`TI-INT-002` fija la frontera desde tecnología. El dominio de continuidad profundizará su lado mediante:

- `CONT-DOM-001` a `CONT-DOM-015`;
- `CONT-INT-001` para criticidad, dependencia, health, degradación e incidente;
- `CONT-INT-002` para contratos con SHELL, VISO, ANIMA, BLOQUE Z y bloques transversales;
- `CONT-INT-003` para nube, energía, ISP, pagos, mensajería, transporte y proveedores críticos;
- `CONT-INT-004` para captura, replay, idempotencia, reincorporación, conciliación y retorno a normalidad.

Esta asignación no reabre las fronteras fijadas aquí ni autoriza a continuidad a escribir estados privados de otros dominios.

##### 18.6 Estado y salida

| Elemento                         | Estado         | Propietario                     | Condición de salida                                                   |
| -------------------------------- | -------------- | ------------------------------- | --------------------------------------------------------------------- |
| Frontera TI ↔ continuidad        | `ESPECIFICADO` | `TI-INT-002`                    | cumplida desde BLOQUE Z                                               |
| Dominio detallado de continuidad | `NO INICIADA`  | `CONT-DOM-001` a `CONT-DOM-015` | tareas desarrolladas en su continuidad canónica                       |
| Contratos de continuidad         | `NO INICIADA`  | `CONT-INT-001` a `CONT-INT-004` | contratos complementarios desarrollados sin contradecir esta frontera |

---

#### 19. Matriz consolidada de las nueve fronteras

| Frontera    | Fuente o autoridad                                 | TI consume                                                | TI solicita o entrega                                                 | Escritura cruzada                                   | Binding físico adoptado aquí                                                                | Estado contractual |
| ----------- | -------------------------------------------------- | --------------------------------------------------------- | --------------------------------------------------------------------- | --------------------------------------------------- | ------------------------------------------------------------------------------------------- | ------------------ |
| SHELL       | identidad, aplicaciones, cuentas, acceso           | identidad, app, contexto, decisión/referencia de acceso   | solicitud autorizada de acción o diagnóstico                          | prohibida                                           | ninguno universal                                                                           | `ESPECIFICADO`     |
| NEXO        | activo físico, ubicación, custodia, condición      | referencia de activo y estado físico                      | mantenimiento, traslado, sustitución o reconciliación autorizados     | prohibida                                           | `asset_items` solo como fuente AS-IS del activo                                             | `ESPECIFICADO`     |
| ANIMA       | experiencia personal del trabajador                | reporte, mensaje, validación, contexto                    | estado humano, comunicación y acción requerida                        | prohibida sobre estado canónico de VISO             | persistencia legacy documentada, no adoptada como semántica objetivo                        | `ESPECIFICADO`     |
| VISO        | caso tecnológico, ITSM, prioridad, SLA, cambio     | expediente, estado, acción, referencias                   | evidencia, observación, handoff y resultados de otros dominios        | prohibida sobre fuentes propietarias                | no se inventa mecanismo objetivo                                                            | `ESPECIFICADO`     |
| ORIGO       | proveedor, compra, contrato                        | proveedor/contrato/renovación autorizados                 | necesidad técnica y evidencia de soporte                              | prohibida                                           | `suppliers`/`purchase_orders` como AS-IS observado                                          | `ESPECIFICADO`     |
| NUMERA      | compromiso, gasto, costo, hecho económico          | referencia económica autorizada                           | contexto técnico correlacionable                                      | prohibida                                           | ninguno específico de TI demostrado                                                         | `ESPECIFICADO`     |
| PRINT-ARC   | job, routing, adapter, attempt, confirmation       | trabajo, intento, estado, resultado y evidencia           | solicitud autorizada de impresión/acción técnica                      | prohibida sobre intención empresarial o activo NEXO | contratos PRINT-ARC reutilizados; BrowserPrint legacy no se adopta como binding transversal | `ESPECIFICADO`     |
| BLOQUE T    | pruebas, release, deploy, rollback                 | evidencia de build/test/release/deploy                    | cambio, alcance, criterios, TREQ y rollback                           | no aplica como escritura empresarial                | ninguno ejecutado por esta tarea                                                            | `ESPECIFICADO`     |
| continuidad | activación, contingencia, recuperación empresarial | incidente de continuidad, decisiones y estado empresarial | incidente técnico, dependencia, health, recuperación y reconciliación | prohibida                                           | ninguno ejecutado por esta tarea                                                            | `ESPECIFICADO`     |

Reconciliación:

- esperadas: **9**;
- materializadas: **9**;
- faltantes: **0**;
- duplicadas: **0**.

---

#### 20. Reconciliación AS-IS frente al contrato objetivo

| Superficie o comportamiento observado                                | AS-IS                          | Contrato objetivo                                                                   | Tratamiento                                           |
| -------------------------------------------------------------------- | ------------------------------ | ----------------------------------------------------------------------------------- | ----------------------------------------------------- |
| ANIMA crea `support_tickets` y primer mensaje                        | existe                         | puede conservar captura si la creación confirma un caso autoritativo e idempotente  | transición de implementación                          |
| ANIMA cambia ticket a `in_progress` al enviar mensaje                | existe                         | mensaje no modifica estado por sí solo                                              | debe retirarse esa equivalencia                       |
| ANIMA cambia a `closed` y escribe `resolved_at` desde acción cliente | existe                         | trabajador aporta validación; VISO conserva cierre canónico                         | debe retirarse esa equivalencia                       |
| NEXO usa `asset_items` para activos físicos                          | existe                         | se conserva como autoridad física, sin convertirla en endpoint/red/impresora lógica | conservar y reconciliar relaciones                    |
| ORIGO usa `suppliers` y `purchase_orders`                            | existe                         | se conserva propiedad comercial; TI consume referencias                             | conservar y añadir binding técnico solo con evidencia |
| mapping específico NUMERA ↔ costo tecnológico                        | no demostrado en la revisión   | referencia a hecho económico propietario                                            | `PENDIENTE_DE_EVIDENCIA`                              |
| `@vento/contracts` físico                                            | tarea canónica aún no iniciada | paquete compartido para contratos                                                   | `SHELL-CON-001`                                       |
| NEXO BrowserPrint local                                              | existe como capacidad parcial  | debe consumir contrato PRINT-ARC antes de declararse servicio transversal conforme  | no se promueve a binding objetivo                     |
| BLOQUE T de package/release/compatibilidad                           | tareas no iniciadas            | gates y releases reproducibles                                                      | `SHELL-CI-001` a `SHELL-CI-019`                       |
| continuidad detallada                                                | tareas no iniciadas            | dominio y contratos propios correlacionados con TI                                  | `CONT-DOM-*` y `CONT-INT-*`                           |

La tabla distingue ausencia de evidencia de ausencia del objeto. Ninguna fila `PENDIENTE_DE_EVIDENCIA` permite inferir que la capacidad no exista fuera de lo inspeccionado.

---

#### 21. Flujo material — trabajador reporta una falla de aplicación

```text
TRABAJADOR EN ANIMA
→ reporta sintoma y contexto disponible
→ se conserva identidad de solicitud e idempotencia
→ VISO crea o vincula el caso tecnologico autoritativo
→ VISO clasifica, prioriza y asigna
→ soporte referencia SHELL para app/identidad/acceso
→ soporte referencia NEXO o grafo tecnico si existe endpoint/activo relacionado
→ TI-INT-001 aporta observaciones tecnicas
→ VISO comunica avance hacia ANIMA
→ trabajador aporta validacion de recuperacion
→ VISO decide cierre o continuidad del caso
```

Reglas:

- ANIMA no decide prioridad;
- SHELL no se convierte en propietaria del caso;
- telemetría no cierra el caso;
- una validación negativa del trabajador mantiene trabajo pendiente;
- reintentar el reporte no crea un segundo caso por el mismo efecto lógico.

---

#### 22. Flujo material — falla de impresión

```text
CASO EN VISO
→ referencia impresora y servicio afectados
→ NEXO aporta identidad/condicion del activo fisico si esta reconciliado
→ PRINT-ARC aporta job/ruta/intento/confirmacion
→ TI-INT-001 aporta health/telemetria disponible
→ soporte diagnostica sin fabricar resultado
→ una accion sobre routing/retry/reimpresion usa autoridad PRINT-ARC
→ si requiere cambio protegido, se crea o relaciona el cambio VISO
→ la evidencia de resultado vuelve al caso
```

Reglas:

- `ADAPTER_ACCEPTED` no es `PRINTED_VERIFIED`;
- `RESULT_UNKNOWN` no se corrige imprimiendo otra copia a ciegas;
- NEXO no toma propiedad del trabajo de impresión;
- VISO no toma propiedad del job;
- el hecho empresarial que generó el documento permanece en su aplicación propietaria.

---

#### 23. Flujo material — proveedor, licencia, renovación y costo

```text
TI IDENTIFICA DEPENDENCIA O NECESIDAD
→ correlaciona servicio/aplicacion/licencia
→ ORIGO conserva proveedor/compra/contrato/renovacion
→ NUMERA conserva compromiso/gasto/costo/hecho economico
→ TI conserva uso tecnico, soporte y riesgo operativo
→ VISO puede abrir o relacionar solicitud/cambio si hay accion tecnica
→ cualquier cambio fisico sigue autorizacion y BLOQUE T cuando corresponda
```

Reglas:

- ORIGO no calcula el costo técnico por conveniencia;
- NUMERA no decide si una aplicación está saludable;
- TI no modifica contrato o gasto desde la mesa de servicio;
- un contrato vigente no demuestra que la capacidad esté desplegada;
- una licencia adquirida no demuestra asignación o uso correcto.

---

#### 24. Flujo material — cambio y despliegue

```text
VISO CONSERVA EL CAMBIO
→ define alcance, riesgo, aprobacion, ventana y criterios
→ BLOQUE T recibe referencia y artefactos del cambio
→ ejecuta pruebas de package y consumidores
→ valida compatibilidad
→ publica/adopta version cuando corresponde
→ ejecuta despliegue autorizado
→ recoge evidencia y health pre/durante/post
→ ejecuta rollback si se activa su condicion
→ devuelve resultado y evidencia a VISO
→ VISO valida el cambio y decide cierre
```

Reglas:

- VISO no despliega por cambiar un estado;
- BLOQUE T no autoaprueba el cambio;
- un rollback puede restaurar versión sin resolver automáticamente el incidente;
- consumidores no se obligan a desplegar simultáneamente;
- una incompatibilidad bloquea adopción aunque el package fuente compile.

---

#### 25. Flujo material — interrupción mayor y continuidad

```text
SENAL / ALERTA / REPORTE
→ VISO mantiene incidente tecnologico
→ BLOQUE Z identifica servicio y dependencias afectadas
→ si se alcanza el umbral empresarial, se correlaciona continuidad
→ autoridad de continuidad decide activacion
→ se ejecuta modo minimo/contingencia autorizado
→ TI ejecuta recuperacion tecnica autorizada
→ se valida servicio y datos
→ se reincorpora trabajo pendiente de forma idempotente
→ continuidad y VISO cierran sus expedientes por autoridades separadas
```

Reglas:

- alarma crítica no activa continuidad automáticamente;
- failover no puede saltarse autorización;
- restaurar backup no prueba recuperación empresarial;
- reconectar no vacía colas sin reconciliación;
- trabajo manual durante falla conserva identidad y no se sobrescribe en silencio.

---

#### 26. Observabilidad y handoff desde TI-INT-001

TI-INT-001 entrega observaciones normalizadas de endpoint, red, impresora, aplicación y servicio externo. TI-INT-002 fija cómo esas observaciones atraviesan las fronteras internas:

- hacia VISO: como evidencia o señal correlacionada, no como transición automática del caso;
- hacia NEXO: como indicio para mantenimiento o reconciliación, no como mutación de inventario;
- hacia SHELL: como indicio de acceso/aplicación, no como permiso;
- hacia ORIGO: como evidencia de soporte/proveedor, no como modificación contractual;
- hacia NUMERA: como contexto técnico, no como asiento o costo;
- hacia PRINT-ARC: como health/contexto de infraestructura, no como confirmación de impresión;
- hacia BLOQUE T: como señal pre/durante/post cambio, no como aceptación final;
- hacia continuidad: como evidencia de afectación, no como declaración automática.

Un adaptador degradado sigue sin equivaler a objeto degradado. La ausencia de telemetría sigue sin equivaler a salud.

---

#### 27. Fallos parciales y reconciliación

Cada frontera debe soportar explícitamente estos resultados:

- éxito confirmado;
- rechazo de contrato;
- rechazo de autorización;
- conflicto de versión;
- duplicado reconocido;
- dependencia no disponible;
- error reintentable;
- error no reintentable;
- timeout con resultado desconocido;
- evidencia contradictoria;
- operación pendiente de reconciliación.

Reglas:

1. un fallo parcial no se convierte en éxito total;
2. una aplicación no corrige el estado propietario de otra directamente;
3. la compensación se solicita al dominio propietario;
4. la reconciliación conserva historia;
5. el consumidor debe poder identificar qué acción sigue pendiente;
6. los casos `UNKNOWN` o equivalentes no se resuelven por urgencia;
7. una recuperación tardía puede resolver incertidumbre sin borrar fallos previos.

---

#### 28. Lecturas, caché y proyecciones

Las aplicaciones pueden mantener proyecciones o cachés solo si:

- la fuente propietaria está declarada;
- la versión o momento de actualización es rastreable;
- la proyección no se edita como segunda fuente;
- el contrato define comportamiento cuando queda obsoleta;
- el usuario puede distinguir dato confirmado de pendiente cuando esa distinción afecte decisión;
- la reconciliación no sobrescribe cambios propietarios no observados;
- no se amplía la audiencia por conveniencia de caché.

Un dashboard de TI, una vista VISO o una tarjeta ANIMA no adquieren autoridad por mostrar el dato.

---

#### 29. Reglas de seguridad entre repositorios

1. Ningún repositorio consumidor recibe credenciales de otro dominio para escribir su estado privado.
2. Un `service_role` o principal técnico no se usa como bypass de la frontera empresarial.
3. Las cuentas técnicas tienen finalidad, alcance, vigencia, custodia y revocación propios.
4. Toda operación protegida conserva el actor humano o autoridad que la originó cuando corresponda.
5. La aplicación receptora vuelve a validar recurso, acción, contexto y alcance.
6. Logs de integración no contienen secretos ni payload sensible completo.
7. Errores hacia el cliente no exponen topología, credenciales, datos de terceros o internals innecesarios.
8. El transporte futuro deberá aplicar los mismos límites de sensibilidad que el dato propietario.
9. Un proveedor externo no se convierte en autoridad interna por ejecutar técnicamente una integración.

---

#### 30. Reglas de compatibilidad y rollback por frontera

##### 30.1 Contrato compatible

Una versión puede adoptarse gradualmente cuando:

- el consumidor actual sigue siendo compatible;
- los campos nuevos son opcionales o tienen transición definida;
- la interpretación histórica no cambia;
- la propietaria mantiene la versión anterior durante la ventana aprobada cuando sea necesario;
- las pruebas de consumidor son verdes.

##### 30.2 Cambio incompatible

Requiere:

- versión mayor;
- inventario de consumidores;
- estrategia de transición;
- pruebas de compatibilidad;
- ventana de adopción;
- rollback hacia una combinación soportada;
- evidencia de no duplicación o pérdida de efectos;
- retirada controlada de la versión anterior.

##### 30.3 Rollback

Rollback de contrato, código o despliegue no puede:

- revivir permisos revocados;
- borrar eventos ya producidos;
- repetir compras, costos, impresiones o cierres;
- restaurar una segunda fuente de verdad;
- perder auditoría generada durante la ventana.

---

#### 31. Prohibiciones transversales

Quedan expresamente prohibidas estas equivalencias:

```text
VISIBLE = AUTORIZADO
EVENTO = COMANDO
ACK = EXITO EMPRESARIAL
MENSAJE = CAMBIO DE ESTADO
HEALTHY = CASO CERRADO
OFFLINE = CONTINUIDAD ACTIVADA
ACTIVO FISICO = ENDPOINT
IMPRESORA FISICA = PRINT JOB
PROVEEDOR = CONTRATO
CONTRATO = COSTO
LICENCIA COMPRADA = LICENCIA ASIGNADA
DEPLOY EXITOSO = CAMBIO CERRADO
BACKUP EXITOSO = RESTAURACION PROBADA
RECONEXION = RECONCILIACION COMPLETA
PUBLICADOR TECNICO = PRODUCTOR EMPRESARIAL
```

También se prohíbe:

- escritura directa cruzada sobre estado privado de otra propietaria;
- duplicar datos maestros para evitar integrar;
- inventar identidad al recibir una referencia ambigua;
- usar texto libre como clave de reconciliación;
- retry ciego tras resultado desconocido;
- cambiar un contrato para ocultar un fallo de consumidor;
- exigir despliegue simultáneo de todo Vento OS para adoptar una versión compatible;
- interpretar un transporte concreto actual como estándar universal sin decisión canónica.

---

#### 32. Pendientes, propietarios y condiciones de salida

| Pendiente                                                           | Insumo faltante                                         | Propietario documental o técnico                                       | Condición de salida                                                     |
| ------------------------------------------------------------------- | ------------------------------------------------------- | ---------------------------------------------------------------------- | ----------------------------------------------------------------------- |
| Materializar paquete común de contratos                             | implementación compartida                               | `SHELL-CON-001`                                                        | package real, versionado, probado y consumible                          |
| Materializar acciones/eventos/handoffs comunes                      | tipos y contratos físicos                               | `SHELL-CON-012` a `SHELL-CON-016`                                      | contratos compartidos sin duplicación local                             |
| Sustituir efectos laterales legacy de ANIMA sobre estado de soporte | implementación ANIMA/VISO                               | alcance de implementación autorizado                                   | mensaje y cierre personal dejan de mutar estado canónico por inferencia |
| Completar binding de caso VISO objetivo                             | persistencia/servicio físico alineados con `VPROC-0058` | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` + VISO         | caso completo implementado y probado                                    |
| Reconciliar activo físico con endpoint/red/impresora                | evidencia de relación estable                           | `TI-DOM-002`, `TI-DOM-003`, `TI-DOM-005` + implementación autorizada   | relaciones persistidas o derivadas de forma explícita y validadas       |
| Reconciliar proveedor/contrato con servicio, app y licencia         | vínculo técnico estable                                 | `TI-DOM-006`, `TI-DOM-012` + implementación autorizada                 | referencias trazables y autorizadas sin duplicar ORIGO                  |
| Reconciliar costo tecnológico con hecho económico                   | mapping NUMERA demostrado                               | `TI-DOM-012` + `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` | relación única al hecho económico y prueba de conciliación              |
| Implementar PRINT-ARC transversal                                   | workers, adaptadores, cola y persistencia               | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE`                | contratos PRINT-ARC consumidos y resultado físico verificable           |
| Implementar releases y consumer tests                               | CI, package y ambientes                                 | `SHELL-CI-001` a `SHELL-CI-019`                                        | pruebas, matrices, gates y evidencia reproducible                       |
| Implementar ciclo de despliegue por paquete                         | paquete previamente aprobado                            | `SHELL-CI-020` a `SHELL-CI-024`                                        | readiness, cutover, piloto, hypercare y transferencia cerrados          |
| Profundizar dominio y contratos de continuidad                      | tareas AC todavía no iniciadas                          | `CONT-DOM-001` a `CONT-DOM-015`; `CONT-INT-001` a `CONT-INT-004`       | continuidad desarrolla su lado del contrato y reconciliación            |

No queda un pendiente narrativo sin propietario documental o condición de salida.

---

#### 33. Estados del resultado

| Objeto                                       | Estado                    | Evidencia o límite                                               |
| -------------------------------------------- | ------------------------- | ---------------------------------------------------------------- |
| Contrato SHELL ↔ TI                          | `ESPECIFICADO`            | frontera, autoridad, acciones, eventos y transición definidas    |
| Contrato NEXO ↔ TI                           | `ESPECIFICADO`            | fuente física AS-IS y límites de reconciliación definidos        |
| Contrato ANIMA ↔ TI/VISO                     | `ESPECIFICADO`            | transición desde semántica legacy materializada                  |
| Contrato VISO ↔ TI                           | `ESPECIFICADO`            | caso, entradas, salidas y límites con otras fuentes definidos    |
| Contrato ORIGO ↔ TI                          | `ESPECIFICADO`            | propiedad comercial y referencias técnicas definidas             |
| Contrato NUMERA ↔ TI                         | `ESPECIFICADO`            | autoridad económica y prohibición de escritura cruzada definidas |
| Contrato PRINT-ARC ↔ TI                      | `ESPECIFICADO`            | contratos existentes reutilizados y no equivalencias preservadas |
| Contrato BLOQUE T ↔ TI                       | `ESPECIFICADO`            | cambio frente a release/deploy/rollback definido                 |
| Contrato continuidad ↔ TI                    | `ESPECIFICADO`            | frontera técnica/empresarial y doble cierre preservados          |
| Implementación física de los nueve contratos | `NO_APLICA` en esta tarea | fase documental; ninguna mutación física autorizada              |

---

#### 34. Criterios de aceptación

`TI-INT-002` queda documentalmente satisfecha porque:

- [x] se materializan exactamente nueve fronteras de las nueve esperadas;
- [x] SHELL conserva identidad, aplicaciones, cuentas y acceso;
- [x] SHELL no se convierte en productora de eventos empresariales ajenos;
- [x] NEXO conserva la identidad del activo físico y `asset_items` se trata únicamente como fuente física AS-IS;
- [x] endpoint, dispositivo compartido, red, impresora y activo permanecen separados;
- [x] ANIMA conserva reporte, comunicación y validación del trabajador sin propiedad del estado ITSM;
- [x] el comportamiento legacy de ANIMA que cambia estado por mensaje o cierre queda identificado y con transición explícita;
- [x] VISO conserva caso, clasificación, prioridad, SLA, asignación, problema, cambio y cierre;
- [x] ORIGO conserva proveedor, compra y contrato;
- [x] NUMERA conserva compromiso, gasto, costo y hecho económico;
- [x] PRINT-ARC conserva job, routing, adapter, attempt y confirmación;
- [x] se preserva que aceptación técnica de impresión no equivale a impresión o entrega confirmadas;
- [x] BLOQUE T conserva pruebas, compatibilidad, release, despliegue y rollback;
- [x] despliegue exitoso no equivale a cambio cerrado;
- [x] incidente tecnológico permanece separado del incidente de continuidad;
- [x] continuidad no se activa automáticamente por una señal o alerta;
- [x] se reutiliza `EVENT-ENVELOPE-001` y no se crea un segundo catálogo de eventos;
- [x] se conserva idempotencia, retry controlado, resultado desconocido y reconciliación;
- [x] se preserva autorización independiente del transporte;
- [x] no se crea endpoint, topic, broker, tabla ni schema físico inventado;
- [x] se preserva despliegue independiente de consumidores y rollback por repositorio;
- [x] todo pendiente tiene propietario y condición de salida;
- [x] no se inicia ni desarrolla `TI-INT-003`;
- [x] no se ejecuta ningún cambio físico.

---

#### 35. Requisitos de prueba

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

La tarea crea o modifica **0** requisitos `TREQ-*` porque los comportamientos verificables que fija ya están cubiertos por requisitos canónicos vigentes, entre ellos:

- idempotencia, reintentos, resultado desconocido, trazabilidad, handoff, fuente única y escritura entre dominios en la familia `TREQ-INTEGRATION-*`;
- contrato tecnológico transversal en `TREQ-INTEGRATION-020`;
- continuidad e integración degradada en `TREQ-INTEGRATION-023` y `TREQ-CONT-001` a `TREQ-CONT-006`;
- contratos compartidos, compatibilidad y rollback en `TREQ-SHELL-006` a `TREQ-SHELL-008` y requisitos posteriores de package/release;
- administración tecnológica y fronteras de identidad/acceso en `TREQ-SHELL-010`;
- mesa de servicio y cambio en `TREQ-VISO-002`, `TREQ-VISO-046`, `TREQ-VISO-047` y `TREQ-VISO-048`;
- identidad física y configuración tecnológica en `TREQ-NEXO-019`;
- proveedor y contrato en `TREQ-ORIGO-005`;
- hechos económicos y costo en `TREQ-NUMERA-001`, `TREQ-NUMERA-002` y `TREQ-NUMERA-004`.

Balance:

| Operación sobre TREQ | Cantidad |
| -------------------- | -------: |
| Creados              |    **0** |
| Modificados          |    **0** |
| Diferidos            |    **0** |
| Descartados          |    **0** |
| Obsoletos            |    **0** |

No se requiere actualización del registro 04A.

---

#### 36. Continuidad

ÚLTIMA TAREA APROBADA
`TI-INT-001 — Definir adaptadores de telemetría para endpoints, redes, impresoras, aplicaciones y servicios externos`

TAREA ACTUAL APROBADA
`TI-INT-002 — Definir contratos con SHELL, NEXO, ANIMA, VISO, ORIGO, NUMERA, PRINT-ARC, BLOQUE T y continuidad`

SIGUIENTE TAREA RESERVADA
`TI-INT-003 — Definir integraciones con MDM, soporte remoto, ISP, fabricantes, licenciamiento y proveedores tecnológicos`


### ✅ TI-INT-003 — Definir integraciones con MDM, soporte remoto, ISP, fabricantes, licenciamiento y proveedores tecnológicos

**Estado:** APROBADA
**Tarea anterior:** `TI-INT-002 — Definir contratos con SHELL, NEXO, ANIMA, VISO, ORIGO, NUMERA, PRINT-ARC, BLOQUE T y continuidad` — APROBADA
**Tarea siguiente:** `INFO-DOM-001 — Definir gobierno de información, inventario, propietarios, custodios, responsables, encargados, finalidades y territorios` — RESERVADA
**Tipo de tarea:** documental; definición normativa y materializada de las integraciones tecnológicas externas con administración de endpoints, soporte remoto, conectividad, fabricantes, licenciamiento y proveedores técnicos, preservando autoridad VENTO, autenticación, identidad, privilegio, telemetría, idempotencia, límites, conciliación, evidencia, reversibilidad y salida del proveedor
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/Z_TECNOLOGIA_Y_SOPORTE/04_INTEGRACIONES_Y_TELEMETRIA.md`
**Fase:** exclusivamente documental
**Cambios físicos autorizados:** ninguno; no selecciona ni contrata proveedores, no crea ni modifica código, SDK, agentes, MDM, clientes de soporte remoto, APIs, webhooks, jobs, colas, tablas, vistas, RLS, RPC, funciones, triggers, Edge Functions, migraciones, datos, cuentas, tenants, licencias, asientos, contratos, costos, secretos, dispositivos, redes, firmware, drivers, despliegues ni configuración de Supabase
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** cerrar el diseño de la frontera tecnológica externa de VENTO para seis familias —MDM, soporte remoto, ISP, fabricantes, licenciamiento y proveedores tecnológicos—, materializando qué puede intercambiarse, qué autoridad conserva VENTO, cómo se autentica y correlaciona cada interacción, qué acciones requieren autorización o cambio, cómo se tratan límites, reintentos y resultados desconocidos, qué evidencia se conserva, cómo se reconcilian discrepancias y qué condiciones deben cumplirse antes de habilitar una integración física.

---

#### 1. Resultado sustantivo

`TI-INT-003` queda documentalmente cerrada con seis familias externas materializadas:

1. **MDM**;
2. **soporte remoto**;
3. **ISP**;
4. **fabricantes**;
5. **licenciamiento**;
6. **proveedores tecnológicos**.

Cada familia queda definida con:

- propósito exacto de integración;
- fuente y autoridad que VENTO conserva;
- identidad del objeto externo y del objeto VENTO relacionado;
- información mínima de entrada y salida;
- mecanismo conceptual de autenticación;
- reglas de autorización y privilegio;
- acciones permitidas y acciones prohibidas;
- eventos, observaciones y resultados aceptables;
- tratamiento de idempotencia, retries y límites;
- tratamiento del reloj y de evidencia tardía;
- tratamiento de timeout y resultado desconocido;
- conciliación y manejo de discrepancias;
- minimización de datos y prohibición de secretos en casos o telemetría;
- relación con contrato, licencia, costo y proveedor;
- estado AS-IS verificable;
- propietario de cada pendiente y condición de salida.

Balance documental:

| Elemento                                                                         |    Resultado |
| -------------------------------------------------------------------------------- | -----------: |
| Familias externas esperadas                                                      |        **6** |
| Familias externas materializadas                                                 |   **6 de 6** |
| Proveedores MDM confirmados                                                      |        **0** |
| Herramientas de soporte remoto productivo confirmadas                            |        **0** |
| Acceso remoto no atendido persistente aprobado                                   |        **0** |
| Instancias canónicas de red validadas para vincular con ISP                      |        **0** |
| Referencias de impresora conservadas para relación con fabricante                |   **9 de 9** |
| Familias de producto/fabricante observadas en impresión                          |        **3** |
| Familias técnicas externas reconocidas por evidencia actual                      |        **5** |
| Plataformas empresariales de licenciamiento confirmadas como maestro tecnológico |        **0** |
| Aplicaciones del catálogo con decisión de proveedor/licenciamiento               | **10 de 10** |
| Integraciones productivas creadas                                                |        **0** |
| Cambios físicos                                                                  |        **0** |
| Requisitos de prueba nuevos o modificados                                        |        **0** |

La tarea define contratos de integración y condiciones de habilitación. No declara como contratado, activo, saludable, licenciado o autorizado un proveedor por la sola presencia de un SDK, repositorio, cuenta técnica, producto físico, URL, agente o configuración local.

---

#### 2. Entradas canónicas conservadas

La tarea consume y preserva, sin redefinir su autoridad:

1. `TI-INT-001`, incluidas las cinco familias de adaptador, las siete formas de observación, las seis clases de señal, los cinco estados de health y las reglas de autenticación, reloj, mapping, retries, idempotencia, minimización y reconciliación;
2. `TI-INT-002`, como contrato de integración interno entre SHELL, NEXO, ANIMA, VISO, ORIGO, NUMERA, PRINT-ARC, BLOQUE T y continuidad;
3. `TI-DOM-001`, incluidos `TI-SERVICE-001` a `TI-SERVICE-011` y `TI-ATTN-004 — L3_PROVEEDOR_O_FABRICANTE`;
4. `TI-DOM-002`, para identidad separada de activo, endpoint, dispositivo compartido, red, impresora, aplicación y servicio;
5. `TI-DOM-003`, para lifecycle, baseline, postura, configuración observada, mantenimiento, revocación y retiro de endpoints;
6. `TI-DOM-004`, para recursos de red, topología, direccionamiento, health y contingencia;
7. `TI-DOM-005`, para impresoras, periféricos, reconciliación física y relación con PRINT-ARC;
8. `TI-DOM-006`, para catálogo de aplicaciones, ambientes, dependencias y proveedores técnicos;
9. `TI-DOM-007`, para caso tecnológico, escalamiento y relación L1/L2/L3;
10. `TI-DOM-008`, para evidencia externa de fabricante o proveedor dentro de problema, causa, error conocido y workaround;
11. `TI-DOM-009`, para cambios sobre endpoint, red, firmware, driver, integración, proveedor o configuración;
12. `TI-DOM-010`, para observabilidad, health, señales, alertas, logs y frescura;
13. `TI-DOM-011`, para recuperación técnica y relación con continuidad;
14. `TI-DOM-012`, para licencias, asientos, garantías, contratos, renovaciones, uso y costos;
15. `TI-DOM-013`, para documentación de fabricante o proveedor como conocimiento curado, no como verdad automática;
16. `TI-AUTH-001` a `TI-AUTH-004`, para segregación, acceso privilegiado, soporte remoto, configuración protegida, logs, capturas, secretos y datos personales;
17. `TI-UX-002` a `TI-UX-006`, para mesa de servicio, mapa técnico, incidentes/cambios, proveedores/licencias/costos y diagnóstico guiado;
18. PRINT-ARC, para identidad de impresora, trabajo, enrutamiento, adaptador, intentos, resultados y confirmaciones;
19. ORIGO, como autoridad sobre proveedor, compra y contrato;
20. NUMERA, como autoridad sobre compromiso, gasto y costo;
21. NEXO, como autoridad sobre identidad física, ubicación, condición y custodia de activos;
22. SHELL y el modelo general de autorización, para identidad, permisos, aplicaciones y decisiones de acceso;
23. BLOQUE T y E5, para compatibilidad, pruebas, release, rollback, readiness, piloto y estabilización;
24. continuidad empresarial, para dependencias críticas, operación mínima, recuperación y proveedores alternativos cuando corresponda.

No se crea un segundo catálogo de proveedores, un segundo inventario de activos, un segundo maestro de licencias, un segundo expediente de soporte ni un segundo modelo de identidad.

---

#### 3. Frontera general de integración externa

Toda integración de esta tarea conserva la secuencia lógica:

```text
OBJETO Y NECESIDAD VENTO
→ AUTORIDAD VENTO RESUELTA
→ CONTRATO O RELACIÓN EXTERNA IDENTIFICADOS
→ PRINCIPAL TÉCNICO Y ALCANCE MÍNIMO
→ INTERACCIÓN CON EL PROVEEDOR
→ RESPUESTA, EVENTO U OBSERVACIÓN EXTERNOS
→ ADAPTACIÓN Y VALIDACIÓN
→ CORRELACIÓN CON OBJETO VENTO
→ RECONCILIACIÓN
→ EVIDENCIA
→ DECISIÓN O CIERRE BAJO AUTORIDAD VENTO
```

Invariantes:

```text
PROVEEDOR
≠ AUTORIDAD EMPRESARIAL

CUENTA DEL PROVEEDOR
≠ IDENTIDAD VENTO

TENANT DEL PROVEEDOR
≠ EMPRESA VENTO

DISPOSITIVO DEL PROVEEDOR
≠ ENDPOINT CANÓNICO

SUSCRIPCIÓN
≠ CONTRATO
≠ LICENCIA
≠ ASIENTO
≠ CUENTA
≠ CREDENCIAL

ESTADO DEL PROVEEDOR
≠ HEALTH VENTO

TICKET DEL PROVEEDOR
≠ CASO TECNOLÓGICO VENTO

RESPUESTA DEL PROVEEDOR
≠ RESTAURACIÓN VALIDADA
≠ CIERRE CANÓNICO
```

---

#### 4. Contrato común de identidad y mapping

Cada integración deberá resolver explícitamente dos identidades:

- el objeto que conoce el proveedor;
- el objeto canónico que VENTO reconoce.

El vínculo nunca se crea únicamente por coincidencia de:

- correo electrónico;
- nombre de persona;
- hostname;
- serial;
- MAC;
- IP;
- URL;
- nombre de aplicación;
- código de producto;
- nombre comercial;
- tenant;
- account ID;
- subscription ID.

El mapping conserva como mínimo:

| Elemento conceptual   | Regla                                                                      |
| --------------------- | -------------------------------------------------------------------------- |
| fuente externa        | proveedor y familia de integración identificables                          |
| referencia externa    | identificador estable del objeto en la fuente, cuando exista               |
| objeto VENTO          | identidad canónica resuelta o estado no reconciliado                       |
| evidencia del vínculo | referencia suficiente para demostrar por qué se considera la misma entidad |
| vigencia              | instante o versión desde la que el vínculo es válido                       |
| estado                | resuelto, ambiguo, pendiente o inválido según la evidencia disponible      |
| propietario           | dominio VENTO que puede aprobar o corregir la relación                     |

Un mapping ambiguo bloquea acciones mutantes. Puede conservarse como evidencia para diagnóstico, pero no autoriza cambio, borrado, reasignación, bloqueo, activación, consumo de licencia ni cierre.

---

#### 5. Autenticación y principales técnicos

Toda fuente o acción externa requiere un mecanismo de autenticación administrado y referenciable.

Pueden existir, según el proveedor y la implementación posterior:

- OAuth o autorización delegada;
- principal de servicio;
- credencial de API;
- certificado;
- firma de webhook;
- identidad de dispositivo;
- sesión humana autenticada;
- credencial temporal;
- token de acceso de alcance limitado.

Esta tarea no selecciona uno por intuición.

Reglas obligatorias:

1. el secreto no se copia a VISO, ANIMA, logs, eventos, telemetría o documentación operativa;
2. la identidad del principal técnico se conserva separada de la credencial;
3. una credencial válida no concede autoridad empresarial;
4. el principal debe tener propietario humano o de servicio identificable;
5. el alcance solicitado debe ser mínimo para el caso de uso;
6. los permisos de lectura y mutación permanecen separados;
7. una integración que pueda modificar dispositivos, red, licencias o configuración queda sujeta a autorización y cambio cuando corresponda;
8. expiración, revocación o rotación invalidan el uso posterior de la credencial anterior;
9. no se admite fallback hacia una credencial más amplia para ocultar un fallo de permisos.

---

#### 6. Eventos, telemetría y afirmaciones externas

Los proveedores pueden producir:

- métricas;
- eventos o transiciones;
- logs;
- heartbeats;
- resultados de prueba;
- resultados de operación;
- observaciones manuales o de soporte.

Cuando una fuente externa produzca telemetría, se adapta mediante `TI-INT-001`.

Reglas:

1. el proveedor conserva la afirmación original;
2. VENTO conserva cuándo fue recibida;
3. la afirmación se valida antes de transformarse en señal interna;
4. severidad externa no sustituye prioridad, impacto, urgencia ni clase de señal VENTO;
5. `healthy`, `online`, `resolved`, `closed`, `paid`, `licensed`, `compliant` o equivalentes del proveedor no escriben automáticamente el estado canónico VENTO;
6. ausencia de evento no demuestra salud;
7. evento tardío conserva su tiempo original;
8. correlación temporal no prueba causalidad;
9. un webhook autenticado no autoriza una mutación ajena a su contrato;
10. un evento de proveedor nunca se convierte por sí solo en aprobación humana.

---

#### 7. Idempotencia, retries, límites y resultados desconocidos

Toda interacción reintentable deberá conservar una identidad estable suficiente para distinguir:

```text
MISMA OPERACIÓN + MISMO CONTENIDO
→ MISMO EFECTO O MISMO RESULTADO RECUPERABLE

MISMA IDENTIDAD + CONTENIDO DIFERENTE
→ CONFLICTO
```

Reglas:

1. los reintentos conservan correlación con el intento original;
2. un retry no crea un segundo caso, sesión, dispositivo, asignación, compra, licencia, RMA o cambio;
3. se respetan límites y señales de rate limiting del proveedor;
4. `Retry-After` se respeta cuando el contrato físico lo exponga;
5. no se inventan tiempos de backoff o número de intentos en esta tarea;
6. un timeout después de una operación posiblemente aceptada se clasifica como resultado desconocido hasta reconciliación;
7. una acción destructiva o sensible no se repite para comprobar si funcionó;
8. la conciliación consulta estado o evidencia cuando sea seguro antes de repetir;
9. dead-letter o intervención manual futura deberá conservar identidad, causa y actor;
10. una reconciliación no borra intentos, respuestas ni errores anteriores.

---

#### 8. Reloj, versiones y compatibilidad

Se distinguen:

```text
MOMENTO DEL PROVEEDOR
≠ MOMENTO DE RECEPCIÓN VENTO
≠ MOMENTO DE PROCESAMIENTO
≠ MOMENTO DE EFECTO EMPRESARIAL
```

Toda integración deberá conservar, cuando aplique:

- versión de API o contrato;
- versión de agente o cliente;
- versión de payload;
- versión de política;
- instante observado por la fuente;
- instante registrado por VENTO;
- zona u offset cuando sean materiales;
- calidad o confianza del reloj cuando sea conocida.

Un cambio incompatible de API, esquema, agente o SDK deberá tratarse como cambio versionado y probarse contra consumidores. No se modifica silenciosamente el significado histórico de campos recibidos.

---

#### 9. Familia 1 — MDM

##### 9.1. Propósito

La integración MDM permite administrar y observar endpoints mediante una plataforma externa sin convertir el inventario del proveedor en fuente de verdad de activos, personas, autorizaciones o dispositivos compartidos.

Puede soportar, cuando exista proveedor aprobado:

- enrolamiento;
- estado de gestión;
- baseline o política asignada;
- postura observada;
- versión de sistema;
- cifrado y bloqueo cuando la fuente los exponga;
- software administrado;
- señal de actualización;
- estado de agente;
- comandos autorizados de administración;
- revocación y retiro.

##### 9.2. Autoridad conservada

| Objeto                          | Autoridad VENTO                             |
| ------------------------------- | ------------------------------------------- |
| activo físico                   | NEXO                                        |
| endpoint                        | `TI-DOM-003`                                |
| dispositivo compartido          | modelo de dispositivos compartidos / SHELL  |
| trabajador o actor              | identidad y autorización VENTO              |
| baseline esperado               | `TI-DOM-003` + cambio tecnológico aplicable |
| privilegio                      | `TI-AUTH-002` / `TI-AUTH-003`               |
| caso de soporte                 | VISO                                        |
| contrato/licencia/costo del MDM | `TI-DOM-012` + ORIGO + NUMERA               |
| observación técnica             | `TI-INT-001` + `TI-DOM-010`                 |

##### 9.3. Mapping mínimo

La plataforma MDM deberá poder relacionar su objeto administrado con un `endpoint` canónico mediante evidencia estable.

No se acepta como vínculo suficiente:

- nombre del dispositivo;
- email del usuario;
- IP;
- MAC aislada;
- serial sin reconciliación;
- nombre local;
- etiqueta libre del administrador.

Cuando el endpoint no esté reconciliado, la observación puede conservarse como evidencia externa sin habilitar acciones mutantes.

##### 9.4. Acciones protegidas

Cualquier capacidad como:

- bloqueo remoto;
- borrado;
- instalación o retiro de software;
- cambio de política;
- modificación de configuración;
- rotación o eliminación de perfil;
- aislamiento;
- actualización forzada;

requiere autorización específica y, cuando cambie configuración o riesgo operativo, gobierno de cambio.

La telemetría MDM no puede ejecutar automáticamente una acción destructiva por mera clasificación externa de `non-compliant`, `risky`, `offline` o equivalente.

##### 9.5. AS-IS

**Estado:** `PENDIENTE_DE_EVIDENCIA`.

No existe proveedor MDM aprobado ni integración runtime demostrada por las fuentes actuales. `TI-DOM-003` deliberadamente no seleccionó proveedor MDM.

Bloqueo:

- proveedor/tenant no confirmados;
- población canónica de endpoints todavía no materializada de forma completa;
- mapping endpoint–objeto MDM no demostrado;
- permisos y credenciales no definidos físicamente;
- contrato, licencia, costo y salida no demostrados.

Propietarios de salida:

- `TI-DOM-003` para endpoint y baseline;
- `TI-AUTH-002` y `TI-AUTH-003` para privilegio y configuración;
- `TI-DOM-012` + ORIGO + NUMERA para relación comercial;
- alcance de implementación tecnológica autorizado para el conector físico.

Condición de salida:

- proveedor y cuenta/tenant identificados;
- endpoint canónico reconciliado;
- scopes mínimos definidos;
- credencial o principal técnico gobernado;
- contratos de lectura y mutación separados;
- mapping reproducible;
- eventos/telemetría adaptados;
- revocación/offboarding demostrables;
- sandbox o laboratorio disponible;
- pruebas de autorización, idempotencia y reconciliación aprobadas.

---

#### 10. Familia 2 — soporte remoto

##### 10.1. Propósito

La integración de soporte remoto permite que un técnico interno o externo interactúe con un endpoint o sistema únicamente dentro de una sesión autorizada, trazable y temporal.

La herramienta es un medio de ejecución. No es autoridad, aprobador, propietario del caso ni fuente de identidad.

##### 10.2. Contrato de sesión

Toda sesión privilegiada deberá poder conservar:

- caso o cambio correlacionado;
- finalidad;
- patrocinador interno;
- técnico o proveedor identificable;
- recurso exacto;
- alcance permitido;
- modalidad atendida o no atendida;
- decisión de autorización aplicable;
- ventana de vigencia;
- instante de inicio;
- instante de fin;
- acciones o evidencia permitidas;
- estado de revocación;
- resultado técnico;
- validación posterior.

##### 10.3. Modalidad atendida

Una sesión atendida puede ser habilitable cuando:

- el caso y la finalidad están vigentes;
- existe autorización suficiente;
- el recurso está correctamente resuelto;
- la persona afectada o responsable participa cuando el procedimiento lo exija;
- se limita la divulgación a lo necesario;
- el cierre de la sesión no se confunde con cierre del caso.

##### 10.4. Modalidad no atendida

**Estado actual:** `BLOQUEADO` para acceso persistente no atendido.

No se habilita hasta demostrar:

- identidad técnica estable;
- alcance específico;
- política aprobada;
- autorización compatible con la modalidad;
- expiración;
- revocación verificable;
- registro de sesión;
- minimización de datos;
- auditoría suficiente;
- pruebas de desconexión y no reutilización de autoridad vencida.

La presencia de un agente instalado no equivale a acceso aprobado.

##### 10.5. Datos sensibles

La sesión no concede por sí misma derecho a:

- leer secretos;
- exportar logs completos;
- copiar datos personales;
- capturar toda la pantalla;
- extraer archivos;
- revelar credenciales;
- inspeccionar información ajena a la finalidad.

Ver, capturar, copiar, exportar y compartir continúan como acciones diferenciadas bajo `TI-AUTH-004`.

##### 10.6. Reintento y reconexión

Una reconexión no hereda una autorización expirada.

Si la sesión pierde conectividad:

```text
AUTORIDAD TODAVÍA VIGENTE
+
MISMO RECURSO
+
MISMA FINALIDAD
+
POLÍTICA QUE PERMITE RECONEXIÓN
→ PUEDE EVALUARSE RECONEXIÓN

AUTORIDAD EXPIRADA O REVOCADA
→ NUEVA DECISIÓN O BLOQUEO
```

##### 10.7. AS-IS

**Estado:** `PENDIENTE_DE_EVIDENCIA` para herramienta productiva.

Las fuentes actuales no demuestran una herramienta canónica de soporte remoto en producción ni un ledger transversal completo de sesiones privilegiadas.

Propietarios de salida:

- `TI-AUTH-002` para gobierno de sesión y elevación;
- `TI-AUTH-004` para evidencia y divulgación;
- `TI-DOM-007` / VISO para caso maestro;
- alcance de implementación autorizado para herramienta y registro físico.

Condición de salida:

- proveedor/herramienta identificados;
- contrato y soporte comercial reconciliados;
- sesión atendida implementada con autorización, vigencia y revocación;
- identidad del técnico/proveedor trazable;
- acciones registrables sin capturar secretos;
- reconexión segura;
- cierre de sesión separado del cierre del caso;
- pruebas de expiración, revocación y segregación aprobadas.

---

#### 11. Familia 3 — ISP

##### 11.1. Propósito

La integración ISP conecta la operación tecnológica con el proveedor de conectividad para:

- identificar el servicio contratado;
- relacionarlo con un enlace y una sede;
- recibir estados o avisos externos;
- abrir o correlacionar soporte externo;
- conservar mantenimientos anunciados;
- correlacionar degradaciones;
- verificar recuperación sin delegar el cierre empresarial al ISP.

##### 11.2. Objeto externo frente a objeto VENTO

El objeto del ISP puede ser un servicio, circuito, cuenta, ticket o referencia contractual.

El objeto VENTO deberá ser una identidad de red reconciliada, principalmente `NETWORK_LINK`, relacionada con sede, servicio y dependencias cuando exista evidencia.

Una cuenta del ISP no sustituye:

- `NETWORK_LINK`;
- router;
- switch;
- access point;
- segmento;
- SSID;
- reserva de direccionamiento.

##### 11.3. Subtipos de red preservados

| Subtipo canónico      | Relación con ISP                                                                       |
| --------------------- | -------------------------------------------------------------------------------------- |
| `NETWORK_LINK`        | objeto primario para vincular servicio externo de conectividad cuando exista evidencia |
| `ROUTER`              | equipo interno o administrado; no se convierte en servicio ISP por coincidencia de IP  |
| `SWITCH`              | recurso interno; no representa contrato ISP                                            |
| `ACCESS_POINT`        | recurso interno; no representa contrato ISP                                            |
| `SEGMENT`             | configuración interna; no representa circuito contratado                               |
| `SSID`                | superficie de acceso interno; no representa proveedor                                  |
| `ADDRESS_RESERVATION` | dato de direccionamiento; no identifica proveedor ni contrato                          |

##### 11.4. Afirmaciones externas

El ISP puede comunicar:

- indisponibilidad;
- degradación;
- mantenimiento;
- apertura o actualización de ticket;
- recuperación declarada;
- métricas o estado de circuito cuando su plataforma lo ofrezca.

Estas afirmaciones son evidencia externa.

`RECUPERADO` en el portal del ISP no equivale a `HEALTHY` ni a cierre de incidente VENTO hasta comprobar el servicio desde la perspectiva necesaria.

##### 11.5. Escalamiento

Cuando un caso requiera intervención del ISP:

```text
CASO VISO
→ ESC_PROVIDER
→ SUBCASO O REFERENCIA DEL ISP
→ DIAGNÓSTICO / TRABAJO EXTERNO
→ EVIDENCIA DEVUELTA
→ VALIDACIÓN VENTO
→ CIERRE INTERNO CUANDO CORRESPONDA
```

El proveedor externo nunca sustituye el caso maestro ni decide la aceptación empresarial.

##### 11.6. AS-IS

**Estado:** `PENDIENTE_DE_EVIDENCIA`.

La arquitectura de red conserva siete subtipos, pero las fuentes actuales registran **0 instancias canónicas validadas**. Por tanto, no se inventa nombre de ISP, circuito, account ID, IP pública, contrato, SLA ni canal API.

Propietarios de salida:

- `TI-DOM-004` para inventario y topología;
- `TI-DOM-012` + ORIGO para contrato/proveedor;
- NUMERA para costo;
- `TI-INT-001` para adaptación de telemetría;
- alcance de implementación autorizado para integración física.

Condición de salida:

- `NETWORK_LINK` reconciliado;
- sede y dependencias conocidas;
- ISP y referencia contractual confirmados;
- canal de soporte y autenticación conocidos;
- mapping de servicio/circuito demostrable;
- estados externos normalizados;
- retries, límites y reloj definidos;
- recuperación conciliada con comprobación VENTO;
- contingencia o alternativa registrada cuando corresponda.

---

#### 12. Familia 4 — fabricantes

##### 12.1. Propósito

La integración con fabricante permite utilizar información y soporte externo sobre equipos sin convertir al fabricante en propietario del activo, de la configuración, del caso ni del cambio.

Puede abarcar:

- garantía;
- RMA;
- defecto conocido;
- advisory;
- firmware;
- driver;
- documentación técnica;
- compatibilidad;
- diagnóstico;
- soporte de producto;
- pieza o reemplazo;
- evidencia de reparación.

##### 12.2. Familias de producto observadas

La evidencia actual de impresión permite conservar tres familias de producto/fabricante sin afirmar una integración activa con sus portales:

1. Zebra / ZD230;
2. Epson / EcoTank L5590 y EcoTank L4260;
3. Digital POS / DIG-E200I.

No se infiere:

- cuenta de soporte;
- contrato de fabricante;
- garantía vigente;
- API;
- portal activo;
- entitlement;
- serial registrado;
- RMA existente;
- relación comercial directa.

##### 12.3. Matriz de las nueve referencias de impresora

| `printer_reference`         | Modelo/familia conservada | Estado de integración con fabricante | Decisión                                                                           |
| --------------------------- | ------------------------- | ------------------------------------ | ---------------------------------------------------------------------------------- |
| `PRN-VP-ZD230-01`           | Zebra ZD230               | `PENDIENTE_DE_EVIDENCIA`             | conservar referencia de producto; no inferir cuenta, garantía ni canal de soporte  |
| `PRN-VP-L5590-01`           | Epson EcoTank L5590       | `PENDIENTE_DE_EVIDENCIA`             | mantenimiento actual no demuestra gestión de garantía o fabricante                 |
| `PRN-ADMIN-L4260-01`        | Epson EcoTank L4260       | `PENDIENTE_DE_EVIDENCIA`             | vínculo físico NEXO aún requiere reconciliación antes de asociar serial o garantía |
| `PRN-MOLKA-DIGE200I-01`     | Digital POS DIG-E200I     | `PENDIENTE_DE_EVIDENCIA`             | no inferir canal de fabricante desde modelo o uso actual                           |
| `PRN-SAUDO-DIGE200I-01`     | Digital POS DIG-E200I     | `PENDIENTE_DE_EVIDENCIA`             | no inferir canal de fabricante desde modelo o uso actual                           |
| `PRN-VC-CAJA-DIGE200I-01`   | Digital POS DIG-E200I     | `PENDIENTE_DE_EVIDENCIA`             | individualizar activo antes de asociar serial, garantía o RMA                      |
| `PRN-VC-BARRA-DIGE200I-01`  | Digital POS DIG-E200I     | `PENDIENTE_DE_EVIDENCIA`             | individualizar activo antes de asociar serial, garantía o RMA                      |
| `PRN-VC-BAR-DIGE200I-01`    | Digital POS DIG-E200I     | `PENDIENTE_DE_EVIDENCIA`             | individualizar activo antes de asociar serial, garantía o RMA                      |
| `PRN-VC-COCINA-DIGE200I-01` | Digital POS DIG-E200I     | `PENDIENTE_DE_EVIDENCIA`             | individualizar activo antes de asociar serial, garantía o RMA                      |

Control:

```text
REFERENCIAS ESPERADAS = 9
REFERENCIAS MATERIALIZADAS = 9
FALTANTES = 0
DUPLICADOS = 0
INTEGRACIONES DE FABRICANTE CONFIRMADAS = 0
```

##### 12.4. Firmware, drivers y configuración

Una recomendación de fabricante no autoriza aplicación automática.

Todo cambio de:

- firmware;
- driver;
- configuración;
- protocolo;
- interfaz;
- versión;

se evalúa mediante `TI-DOM-009` y `TI-AUTH-003` cuando corresponda, con compatibilidad, prueba, rollback y evidencia.

##### 12.5. Garantía y RMA

La relación debe poder conservar:

- activo o impresora;
- fabricante/proveedor;
- evidencia de compra cuando exista;
- estado de garantía conocido o desconocido;
- caso interno;
- referencia externa;
- diagnóstico;
- decisión de reparación/reemplazo;
- envío/recepción cuando aplique;
- resultado externo;
- activo resultante si existe reemplazo.

Un reemplazo no sobrescribe la identidad histórica del activo anterior. NEXO conserva la identidad física y su transición.

##### 12.6. AS-IS

**Estado:** `PENDIENTE_DE_EVIDENCIA` para integración con fabricante.

Propietarios de salida:

- NEXO + `TI-DOM-005` para activo/impresora;
- `TI-DOM-012` + ORIGO para garantía/contrato/proveedor;
- `TI-DOM-009` para cambios;
- PRINT-ARC para prueba funcional de impresión;
- alcance de implementación autorizado para API/portal/conector.

Condición de salida:

- activo individual reconciliado;
- fabricante/proveedor confirmado;
- serial o identificador requerido demostrado cuando aplique;
- garantía o no-aplicabilidad comprobada;
- canal de soporte aprobado;
- referencia externa correlacionable;
- política de firmware/driver gobernada;
- RMA o intervención reproducible y auditable cuando ocurra.

---

#### 13. Familia 5 — licenciamiento

##### 13.1. Propósito

La integración de licenciamiento permite observar y administrar derechos tecnológicos sin confundir objetos distintos.

```text
CONTRATO
≠ PLAN
≠ SUSCRIPCIÓN
≠ LICENCIA
≠ ENTITLEMENT
≠ ASIENTO
≠ CUENTA
≠ USUARIO
≠ CREDENCIAL
≠ COSTO
```

##### 13.2. Autoridades

| Materia                     | Autoridad                                            |
| --------------------------- | ---------------------------------------------------- |
| necesidad y uso técnico     | TI / `TI-DOM-012`                                    |
| aplicación afectada         | catálogo de aplicaciones + propietario de aplicación |
| proveedor y contrato        | ORIGO                                                |
| compromiso, gasto y costo   | NUMERA                                               |
| identidad de persona        | SHELL / identidad VENTO                              |
| asignación o uso de asiento | contrato tecnológico gobernado por `TI-DOM-012`      |
| cambio de configuración     | `TI-DOM-009` / `TI-AUTH-003` cuando aplique          |

##### 13.3. Datos mínimos de una integración de licencia

Cuando el proveedor los exponga, la integración deberá poder reconciliar:

- producto o servicio;
- plan o edición;
- entitlement;
- cantidad o capacidad contratada cuando aplique;
- asiento o asignación;
- usuario, principal o recurso relacionado;
- estado;
- vigencia;
- renovación;
- consumo o uso cuando sea legítimo medirlo;
- soporte incluido;
- referencia contractual;
- costo referenciado, sin recrear el ledger económico;
- evento de expiración, restricción o cambio;
- evidencia de baja o reasignación.

##### 13.4. Licencia sin usuario y asiento huérfano

La conciliación deberá detectar, cuando aplique:

- asiento sin usuario o recurso vigente;
- usuario sin identidad VENTO reconciliada;
- licencia asignada a persona inactiva;
- producto sin contrato reconciliado;
- renovación sin propietario;
- consumo superior a capacidad conocida;
- licencia sin uso demostrable cuando la medición sea admisible;
- cuenta eliminada con asiento todavía asignado;
- costo sin referencia técnica suficiente.

La detección no autoriza retirar automáticamente el acceso. La acción posterior usa su autoridad correspondiente.

##### 13.5. RevenueCat no es maestro de licencias empresariales

El código actual de PASS utiliza RevenueCat para configurar compras, obtener ofertas, realizar una compra y restaurar compras del Club.

Ese uso representa una integración comercial del cliente de PASS y **no** demuestra una plataforma maestra para licencias tecnológicas internas, asientos de personal, contratos de software o costos de TI.

Por tanto:

```text
REVENUECAT / PASS CLUB
≠ LICENCIAMIENTO EMPRESARIAL DE VENTO OS
```

Cualquier licencia tecnológica interna deberá conservar su propio contrato y autoridad bajo `TI-DOM-012`.

##### 13.6. AS-IS

**Estado:** `PENDIENTE_DE_EVIDENCIA` para una plataforma empresarial consolidada de licenciamiento.

Las cinco familias técnicas externas reconocidas por `TI-DOM-006` mantienen estado comercial, contractual y de asiento pendiente de evidencia donde no exista fuente demostrada.

Propietarios de salida:

- `TI-DOM-012`;
- ORIGO;
- NUMERA;
- propietario de identidad/aplicación cuando aplique;
- alcance de implementación autorizado para conectores físicos.

Condición de salida:

- proveedor y producto reconciliados;
- contrato y propietario demostrables;
- entitlement y asiento definidos cuando apliquen;
- identidad de usuario/recurso reconciliada;
- renovación y salida definidas;
- costo referenciado a NUMERA;
- scopes de API mínimos;
- eventos y conciliación probados;
- baja y reasignación auditables.

---

#### 14. Familia 6 — proveedores tecnológicos

##### 14.1. Propósito

Esta familia cubre plataformas técnicas externas utilizadas por una o más aplicaciones VENTO y que no deben quedar gobernadas únicamente por presencia de SDK, variables de ambiente o configuración de build.

La evidencia actual reconoce cinco familias técnicas externas:

1. GitHub;
2. Supabase;
3. Expo/EAS;
4. Sentry;
5. RevenueCat.

Este conjunto representa las familias técnicas demostradas por las fuentes actuales. No se afirma que constituya el universo contractual completo de proveedores de VENTO.

##### 14.2. Matriz materializada de proveedores técnicos observados

| Familia    | Evidencia técnica actual                                          | Alcance observado                             | Estado comercial/licencia | Decisión de integración                                                                                                                                                                         |
| ---------- | ----------------------------------------------------------------- | --------------------------------------------- | ------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| GitHub     | repositorios actuales                                             | nueve aplicaciones con repositorio confirmado | `PENDIENTE_DE_EVIDENCIA`  | conservar como proveedor de código/colaboración; repositorio o workflow no adquieren propiedad funcional ni autoridad empresarial                                                               |
| Supabase   | SDK en nueve repositorios confirmados y proyecto VENTO observable | nueve aplicaciones con repositorio confirmado | `PENDIENTE_DE_EVIDENCIA`  | conservar como plataforma técnica; esquema, RLS, funciones y datos siguen bajo gobierno VENTO; toda modificación Supabase se versiona desde `vento-shell` cuando una fase autorizada lo permita |
| Expo/EAS   | configuración técnica de build/update                             | `anima`, `pass`                               | `PENDIENTE_DE_EVIDENCIA`  | conservar cuenta/proyecto/build/update como objetos técnicos separados; plan, propietario, permisos y costo requieren evidencia                                                                 |
| Sentry     | SDK y configuración de monitoreo observados en ANIMA              | `anima`                                       | `PENDIENTE_DE_EVIDENCIA`  | integrar únicamente observabilidad autorizada y minimizada; SDK presente no demuestra servicio contratado, retención, plan o salud                                                              |
| RevenueCat | SDK y flujo de compra/restauración observados en PASS             | `pass`                                        | `PENDIENTE_DE_EVIDENCIA`  | conservar como proveedor de compras/suscripción de cliente cuando aplique; no convertirlo en maestro de licenciamiento empresarial                                                              |

Control:

```text
FAMILIAS TÉCNICAS EXTERNAS RECONOCIDAS = 5
FILAS MATERIALIZADAS = 5
FALTANTES = 0
DUPLICADOS = 0
CONTRATOS COMERCIALES CONFIRMADOS POR ESTA TAREA = 0
```

##### 14.3. GitHub

La integración puede, en una implementación futura, consumir evidencia de:

- repositorio;
- commit;
- release;
- workflow;
- artifact;
- estado de checks;
- incidente o cambio correlacionado.

No puede inferir:

- propietario funcional del proceso;
- autorización empresarial;
- despliegue productivo;
- costo o contrato;
- health de una aplicación únicamente porque el repositorio exista.

##### 14.4. Supabase

Supabase puede proveer capacidad técnica de base de datos, Auth, Storage, funciones y otros servicios, pero:

- no se convierte en autoridad empresarial por ejecutar físicamente una operación;
- `service_role` u otra credencial privilegiada no equivale a autorización humana;
- cambios de esquema, políticas, funciones, datos o configuración permanecen bajo el gobierno de VENTO;
- cualquier futura modificación de Supabase perteneciente a VENTO se crea y versiona desde `vento-shell`;
- estado del proveedor no equivale a disponibilidad empresarial de todos los procesos consumidores.

##### 14.5. Expo/EAS

La presencia de configuración de build/update en ANIMA y PASS demuestra dependencia técnica, no:

- plan contratado;
- titular de cuenta;
- número de asientos;
- costo;
- SLA;
- autorización de publicación.

Build, distribución, update y credenciales de plataforma permanecen objetos separados y gobernados.

##### 14.6. Sentry

ANIMA contiene integración de código que:

- inicializa Sentry cuando existe DSN;
- diferencia development/production;
- adjunta referencias de Expo Update;
- permite capturar errores;
- puede asociar `id` y `email` del usuario al contexto de monitoreo.

Decisiones:

1. la presencia del SDK no demuestra que exista hoy un contrato comercial activo;
2. `EXPO_PUBLIC_SENTRY_DSN` es configuración técnica y no se reproduce en casos o documentación;
3. identificación de usuario y contexto de error debe respetar minimización y finalidad;
4. un error capturado no crea automáticamente incidente;
5. un issue cerrado en Sentry no cierra un caso VISO;
6. el mapping de release/update se conserva como evidencia técnica, no como causa automática.

##### 14.7. RevenueCat

PASS contiene integración de código que:

- carga el SDK `react-native-purchases`;
- selecciona una clave pública según plataforma;
- configura el cliente con `appUserID`;
- consulta offerings;
- ejecuta una compra;
- restaura compras.

Decisiones:

1. el `appUserID` debe reconciliarse con la identidad de cliente que corresponda en PASS, no con un trabajador por conveniencia;
2. la respuesta del proveedor no se transforma en contrato interno de licencia tecnológica;
3. reintentos de compra requieren la semántica transaccional propia del dominio comercial, no la de asientos tecnológicos;
4. una restauración de compra no equivale a restauración técnica de servicio VENTO;
5. la relación comercial del proveedor, plan y costos continúan pendientes de evidencia bajo sus autoridades correspondientes.

---

#### 15. Matriz de las diez aplicaciones frente a proveedor y licenciamiento

Se preservan exactamente las diez aplicaciones del catálogo tecnológico.

| `app_code` | Evidencia técnica externa heredada         | Decisión de TI-INT-003                                                                                          | Estado comercial/licencia |
| ---------- | ------------------------------------------ | --------------------------------------------------------------------------------------------------------------- | ------------------------- |
| `shell`    | GitHub; Supabase; hosting no identificado  | conservar GitHub/Supabase como dependencias técnicas; no inventar hosting ni contrato                           | `PENDIENTE_DE_EVIDENCIA`  |
| `anima`    | GitHub; Supabase; Expo/EAS; Sentry SDK     | conservar las cuatro familias y aplicar contratos específicos de build/monitoring; no inferir plan ni retención | `PENDIENTE_DE_EVIDENCIA`  |
| `viso`     | GitHub; Supabase; hosting no identificado  | conservar dependencias técnicas; no crear proveedor de hosting por inferencia                                   | `PENDIENTE_DE_EVIDENCIA`  |
| `nexo`     | GitHub; Supabase; hosting no identificado  | conservar dependencias técnicas y separar activos/periféricos de proveedor de aplicación                        | `PENDIENTE_DE_EVIDENCIA`  |
| `fogo`     | GitHub; Supabase; hosting no identificado  | conservar dependencias técnicas; no inferir contrato de hosting                                                 | `PENDIENTE_DE_EVIDENCIA`  |
| `origo`    | GitHub; Supabase; hosting no identificado  | conservar dependencias técnicas; la aplicación ORIGO no se convierte en proveedor de sí misma                   | `PENDIENTE_DE_EVIDENCIA`  |
| `pulso`    | GitHub; Supabase; hosting no identificado  | conservar dependencias técnicas; relación POS externa sigue su contrato propio cuando aplique                   | `PENDIENTE_DE_EVIDENCIA`  |
| `numera`   | GitHub; Supabase; hosting no identificado  | conservar dependencias técnicas; registrar costos no vuelve a NUMERA autoridad de su propia licencia            | `PENDIENTE_DE_EVIDENCIA`  |
| `aura`     | proveedores actuales no confirmados        | no activar ni asignar proveedor por estar presente en catálogo; conservar decisión de continuidad propietaria   | `PENDIENTE_DE_EVIDENCIA`  |
| `pass`     | GitHub; Supabase; Expo/EAS; RevenueCat SDK | conservar cuatro familias; RevenueCat permanece proveedor del flujo Club, no maestro de licencias TI            | `PENDIENTE_DE_EVIDENCIA`  |

Control:

```text
APLICACIONES ESPERADAS = 10
APLICACIONES MATERIALIZADAS = 10
FALTANTES = 0
DUPLICADOS = 0
```

---

#### 16. Proveedor técnico frente a proveedor comercial

Se fija la separación:

```text
DEPENDENCIA TÉCNICA OBSERVADA
≠ RELACIÓN COMERCIAL CONFIRMADA
≠ CONTRATO VIGENTE
≠ LICENCIA VIGENTE
≠ COSTO CONFIRMADO
≠ SLA CONFIRMADO
```

Un SDK, repositorio, variable, project ID, endpoint o paquete puede demostrar una relación técnica. No basta para afirmar:

- plan;
- titular;
- contrato;
- costo;
- asiento;
- fecha de renovación;
- soporte incluido;
- nivel de servicio;
- derecho a administración.

La reconciliación comercial se mantiene bajo `TI-DOM-012`, ORIGO y NUMERA.

---

#### 17. Caso maestro VENTO y subcaso externo

Todo proveedor que participe en soporte sigue el patrón:

```text
CASO VENTO
→ NECESIDAD DE ESCALAMIENTO EXTERNO
→ PROVEEDOR Y CONTRATO APLICABLES
→ SUBCASO / RMA / REFERENCIA EXTERNA
→ TRABAJO DEL TERCERO
→ RESULTADO Y EVIDENCIA
→ RECONCILIACIÓN VENTO
→ VALIDACIÓN
→ CIERRE INTERNO SI CORRESPONDE
```

Reglas:

1. el identificador externo no reemplaza el caso VENTO;
2. el proveedor no modifica prioridad VENTO;
3. el proveedor no concede autorización;
4. el proveedor no cierra el caso maestro;
5. un resultado externo puede ser contradicho por evidencia interna;
6. cada reapertura conserva relación con el subcaso previo;
7. el expediente interno evita copiar datos innecesarios del portal externo;
8. adjuntos externos se gobiernan como evidencia, no como contenido confiable por defecto.

---

#### 18. Cambios iniciados por proveedor

Un advisory, fin de soporte, nueva versión, firmware, cambio de API, cambio de certificado, cambio de plan o mantenimiento programado puede originar una necesidad de cambio.

No autoriza ejecución automática.

El flujo es:

```text
AFIRMACIÓN DEL PROVEEDOR
→ EVALUACIÓN DE APLICABILIDAD
→ OBJETOS VENTO AFECTADOS
→ RIESGO Y COMPATIBILIDAD
→ CAMBIO CUANDO CORRESPONDA
→ PRUEBA
→ EJECUCIÓN AUTORIZADA
→ VALIDACIÓN
→ RECONCILIACIÓN
```

Un proveedor no puede convertir una recomendación en cambio aprobado.

---

#### 19. Seguridad, privacidad y minimización

Queda prohibido incorporar en casos, telemetría o documentación operativa:

- contraseñas;
- secretos de API;
- refresh tokens;
- access tokens completos;
- claves privadas;
- OTP;
- códigos de recuperación;
- cookies de sesión;
- service-role credentials;
- PSK;
- credenciales de fabricante o ISP;
- payloads completos cuando una referencia sea suficiente.

Las integraciones deben aplicar:

- scopes mínimos;
- separación lectura/escritura;
- minimización de payload;
- masking;
- retención justificada;
- auditoría de acceso privilegiado;
- revocación;
- rotación de credenciales;
- evidencia sanitizada para soporte.

Una herramienta externa no recibe acceso a información adicional por ser proveedor contratado.

---

#### 20. Reconciliación transversal

La conciliación de TI-INT-003 deberá poder detectar, cuando aplique:

1. objeto MDM sin endpoint canónico;
2. endpoint canónico con asignación MDM contradictoria;
3. sesión remota sin caso o autorización vigentes;
4. sesión remota todavía activa después de expiración o revocación;
5. enlace de ISP sin `NETWORK_LINK` reconciliado;
6. ticket ISP sin caso VENTO correlacionado;
7. proveedor que reporta recuperación mientras VENTO sigue degradado;
8. garantía o RMA sin activo individual reconciliado;
9. firmware recomendado que no coincide con versión o modelo aplicable;
10. licencia o asiento sin usuario/recurso válido;
11. usuario inactivo con asiento todavía asignado;
12. producto tecnológico sin contrato reconciliado;
13. contrato sin servicio o aplicación dependiente;
14. costo sin referencia contractual/técnica suficiente;
15. integración técnica activa sin propietario interno;
16. credencial o principal sin propósito vigente;
17. proveedor técnico observado sin relación comercial demostrada;
18. webhook o evento duplicado;
19. timeout con efecto desconocido;
20. cambio de API o esquema sin compatibilidad demostrada.

Cada discrepancia conserva:

- fuente A;
- fuente B;
- objeto;
- diferencia;
- instante;
- severidad operativa cuando corresponda;
- propietario de resolución;
- estado;
- evidencia;
- resultado de conciliación.

No se corrige sobrescribiendo silenciosamente una de las fuentes.

---

#### 21. Relación con observabilidad

Las fuentes externas pueden alimentar observabilidad mediante `TI-INT-001`, pero se preservan estas fronteras:

```text
SEÑAL DEL PROVEEDOR
≠ ALERTA VENTO
≠ HEALTH VENTO
≠ INCIDENTE
≠ PROBLEMA
≠ CAMBIO
≠ CONTINUIDAD
```

Un proveedor puede declarar indisponibilidad y VENTO puede permanecer parcialmente operativo.

Un proveedor puede declarar recuperación y VENTO puede seguir degradado por caché, configuración, datos, red local, dependencia secundaria o proceso empresarial.

Un adaptador degradado tampoco demuestra que el objeto observado esté degradado.

---

#### 22. Relación con continuidad

Una falla de MDM, soporte remoto, ISP, fabricante, licenciamiento o proveedor tecnológico puede convertirse en dependencia de continuidad únicamente cuando su impacto sobre una capacidad empresarial crítica haya sido establecido por la autoridad de continuidad.

No se activa continuidad por:

- nombre del proveedor;
- prioridad del ticket externo;
- severidad del dashboard del proveedor;
- indisponibilidad de una herramienta no crítica;
- ausencia de una integración de administración que no afecte la operación mínima.

Cuando corresponda, el caso tecnológico y el caso de continuidad permanecen relacionados pero no intercambiables.

---

#### 23. Relación con ORIGO y NUMERA

##### 23.1. ORIGO

ORIGO conserva:

- proveedor;
- compra;
- contrato;
- documentos comerciales;
- condiciones vigentes;
- relación contractual.

TI-INT-003 conserva referencias técnicas suficientes para integrar el servicio sin recrear ese maestro.

##### 23.2. NUMERA

NUMERA conserva:

- compromiso;
- gasto;
- costo;
- periodo y centro económico cuando aplique.

Una API de proveedor puede aportar uso o monto informativo, pero el dato externo no se convierte automáticamente en hecho económico final.

##### 23.3. Regla conjunta

```text
PROVEEDOR TÉCNICO
→ REFERENCIA DE CONTRATO EN ORIGO
→ REFERENCIA ECONÓMICA EN NUMERA
→ USO Y DEPENDENCIA TÉCNICA EN TI
```

Las tres perspectivas se correlacionan sin fusionarse.

---

#### 24. Alta de una integración externa

Antes de habilitar físicamente una integración deberá existir, como mínimo:

1. proveedor identificado;
2. propietario interno;
3. propósito y servicio afectado;
4. objeto VENTO relacionado;
5. contrato o decisión de no-aplicabilidad comercial cuando corresponda;
6. clasificación de datos;
7. mecanismo de autenticación;
8. principal técnico;
9. scopes mínimos;
10. ambientes o sandbox cuando existan;
11. versión de API/SDK;
12. mapping de identidades;
13. operaciones de lectura;
14. operaciones de mutación separadas;
15. eventos/webhooks/telemetría esperados;
16. idempotencia;
17. retry y rate limits;
18. tratamiento de timeout;
19. monitoreo del propio conector;
20. revocación;
21. salida del proveedor;
22. compatibilidad y rollback;
23. pruebas aplicables;
24. evidencia de readiness.

La ausencia de cualquiera de estos elementos no se rellena con valores genéricos.

---

#### 25. Cambio o ampliación de scopes

Ampliar permisos de una integración es un cambio de seguridad y configuración.

No se permite:

```text
FALLÓ POR PERMISOS
→ USAR TOKEN MÁS PODEROSO
→ CONTINUAR
```

La conducta correcta es:

```text
FALLÓ POR PERMISOS
→ IDENTIFICAR OPERACIÓN
→ COMPARAR CON CONTRATO APROBADO
→ CORREGIR BUG O SOLICITAR CAMBIO DE SCOPE
→ APROBAR CUANDO CORRESPONDA
→ ROTAR / ACTUALIZAR CREDENCIAL
→ PROBAR
→ REINTENTAR CON NUEVA AUTORIDAD
```

---

#### 26. Baja y salida del proveedor

Toda integración deberá ser desmontable sin perder la historia VENTO.

La salida contempla:

- revocar credenciales;
- retirar webhooks;
- retirar agentes cuando corresponda;
- cerrar accesos humanos;
- reasignar o liberar licencias;
- preservar evidencia necesaria;
- exportar datos cuando contrato y gobierno lo permitan;
- eliminar datos o accesos residuales conforme a autoridad aplicable;
- reemplazar mappings;
- actualizar dependencias;
- verificar ausencia de automatizaciones huérfanas;
- conservar la historia del proveedor anterior;
- demostrar que el nuevo proveedor no reutiliza identidades ambiguas.

Cambiar de proveedor no autoriza dual ownership indefinido.

---

#### 27. Datos y evidencia externos

La integración conserva únicamente lo necesario para demostrar:

- qué se solicitó;
- quién o qué lo solicitó;
- bajo qué autoridad;
- qué proveedor recibió la interacción;
- qué objeto externo participó;
- qué respuesta produjo;
- qué efecto se observó;
- cómo se reconcilió;
- qué quedó pendiente.

No se duplica un portal externo completo dentro de VENTO.

Cuando una referencia protegida sea suficiente, se conserva la referencia y no el payload íntegro.

---

#### 28. Errores y clasificación de fallo

La integración distingue, como mínimo:

- autenticación fallida;
- autorización insuficiente;
- objeto no encontrado;
- mapping ambiguo;
- schema incompatible;
- rate limit;
- timeout antes de envío;
- timeout con efecto posible;
- indisponibilidad del proveedor;
- respuesta inválida;
- conflicto de versión;
- operación duplicada;
- rechazo de política;
- secreto o dato sensible detectado;
- evidencia insuficiente.

La interfaz y el caso muestran un mensaje seguro. El detalle técnico restringido se conserva bajo autorización.

---

#### 29. Propiedad del cambio físico futuro

TI-INT-003 no selecciona archivos físicos, endpoints de API, nombres de tablas, topics, colas, tokens, tenants ni secretos.

La implementación futura se distribuye según el objeto:

| Resultado físico futuro                             | Propietario                                                                |
| --------------------------------------------------- | -------------------------------------------------------------------------- |
| adaptación de telemetría externa                    | `TI-INT-001` + alcance de implementación autorizado                        |
| contratos internos VENTO consumidos por el conector | `TI-INT-002` + BLOQUE H cuando se materialicen paquetes compartidos        |
| MDM / endpoint                                      | `TI-DOM-003` + AUTH + alcance autorizado                                   |
| soporte remoto                                      | `TI-AUTH-002` / `TI-AUTH-004` + VISO + alcance autorizado                  |
| ISP / red                                           | `TI-DOM-004` + alcance autorizado                                          |
| fabricante / hardware                               | NEXO + `TI-DOM-005` + PRINT-ARC cuando aplique                             |
| licenciamiento                                      | `TI-DOM-012` + ORIGO + NUMERA                                              |
| proveedor tecnológico genérico                      | `TI-DOM-006` / `TI-DOM-012` + propietario de aplicación                    |
| Supabase                                            | exclusivamente `vento-shell` cuando una fase de implementación lo autorice |
| compatibilidad, release y rollback                  | BLOQUE T + E5                                                              |

---

#### 30. Pendientes y condiciones de salida

| Pendiente                                          | Estado                   | Propietario / destino                                 | Condición de salida                                                                             |
| -------------------------------------------------- | ------------------------ | ----------------------------------------------------- | ----------------------------------------------------------------------------------------------- |
| selección o confirmación de MDM                    | `PENDIENTE_DE_EVIDENCIA` | `TI-DOM-003` + `TI-DOM-012` + alcance autorizado      | proveedor, tenant, scopes, endpoint mapping, seguridad, salida y pruebas demostrados            |
| integración MDM física                             | `FUERA_DE_ALCANCE`       | alcance de implementación autorizado                  | cliente/API/agente implementados, versionados y probados contra este contrato                   |
| herramienta de soporte remoto                      | `PENDIENTE_DE_EVIDENCIA` | `TI-AUTH-002` + `TI-INT-003`                          | proveedor, modalidad atendida, identidad, sesión, revocación y evidencia demostrados            |
| acceso no atendido persistente                     | `BLOQUEADO`              | `TI-AUTH-002` + autoridad de seguridad                | contrato explícito, alcance, expiración, revocación, auditoría y pruebas equivalentes aprobados |
| inventario ISP                                     | `PENDIENTE_DE_EVIDENCIA` | `TI-DOM-004` + `TI-DOM-012`                           | enlace canónico, ISP, contrato, canal de soporte y mapping reconciliados                        |
| integración ISP física                             | `FUERA_DE_ALCANCE`       | alcance de implementación autorizado                  | API/webhook/portal adaptado, autenticado, limitado y probado                                    |
| canales de fabricante y garantía                   | `PENDIENTE_DE_EVIDENCIA` | NEXO + `TI-DOM-005` + `TI-DOM-012` + ORIGO            | activo individual, fabricante, garantía y canal externo demostrados                             |
| APIs/RMA de fabricante                             | `PENDIENTE_DE_EVIDENCIA` | propietario técnico + alcance autorizado              | soporte/API aplicables, mapping, autenticación y evidencia de caso externo demostrados          |
| maestro empresarial de licenciamiento              | `PENDIENTE_DE_EVIDENCIA` | `TI-DOM-012` + ORIGO + NUMERA                         | productos, contratos, entitlements, asientos, usuarios, renovación y costos reconciliados       |
| GitHub — contrato/plan/asientos/costo              | `PENDIENTE_DE_EVIDENCIA` | `TI-DOM-012` + ORIGO + NUMERA                         | cuenta propietaria, plan, contrato, uso, renovación y costo demostrables                        |
| Supabase — contrato/plan/costo                     | `PENDIENTE_DE_EVIDENCIA` | `TI-DOM-012` + ORIGO + NUMERA                         | relación comercial y económica reconciliada con dependencia técnica existente                   |
| Expo/EAS — cuenta/plan/permisos/costo              | `PENDIENTE_DE_EVIDENCIA` | `TI-DOM-012` + propietarios ANIMA/PASS + ORIGO/NUMERA | cuenta, plan, permisos, renovación y costo demostrables                                         |
| Sentry — servicio/plan/retención/costo             | `PENDIENTE_DE_EVIDENCIA` | `TI-DOM-012` + ANIMA + INFO cuando aplique            | cuenta, servicio activo, política de datos, retención, contrato y costo demostrables            |
| RevenueCat — relación comercial/costo              | `PENDIENTE_DE_EVIDENCIA` | `TI-DOM-012` + PASS + ORIGO/NUMERA                    | producto contratado, cuenta, renovación, costo y gobierno de datos demostrables                 |
| hosting de aplicaciones sin proveedor identificado | `PENDIENTE_DE_EVIDENCIA` | `TI-DOM-006` + `TI-DOM-012`                           | proveedor o no-aplicabilidad confirmados por cada aplicación correspondiente                    |
| secretos y principales técnicos                    | `FUERA_DE_ALCANCE`       | implementación segura posterior + `TI-AUTH-*`         | secret store, scopes, rotación, revocación y auditoría implementados sin exponer secretos       |
| pruebas contractuales y de consumidores            | `FUERA_DE_ALCANCE`       | BLOQUE T / E5                                         | contratos implementados y suites ejecutables sobre sandbox/staging                              |

No queda un pendiente documental de TI-INT-003 sin propietario y condición de salida.

---

#### 31. Criterios de aceptación

`TI-INT-003` queda documentalmente satisfecha cuando:

- [x] desarrolla exclusivamente TI-INT-003;
- [x] preserva TI-INT-002 como tarea anterior aprobada;
- [x] reserva INFO-DOM-001 sin desarrollarla;
- [x] mantiene la fase exclusivamente documental;
- [x] materializa exactamente seis familias externas;
- [x] MDM queda definido sin inventar proveedor;
- [x] soporte remoto queda definido con sesiones temporales y acceso no atendido persistente bloqueado;
- [x] ISP queda definido sin inventar proveedor ni circuito ante 0 instancias de red validadas;
- [x] fabricantes quedan materializados contra las nueve referencias de impresora sin inventar cuenta, garantía o API;
- [x] licenciamiento conserva separados contrato, suscripción, licencia, entitlement, asiento, cuenta, credencial y costo;
- [x] RevenueCat no se utiliza como maestro de licencias empresariales;
- [x] las cinco familias técnicas externas observadas quedan materializadas con evidencia y estado;
- [x] las diez aplicaciones conservan una decisión explícita de proveedor/licenciamiento;
- [x] toda afirmación externa se reconcilia antes de convertirse en estado VENTO;
- [x] autenticación de fuente permanece separada de autorización de mutación;
- [x] retries, límites, reloj, timeout y resultado desconocido quedan definidos;
- [x] no se almacenan secretos en casos, eventos o telemetría;
- [x] proveedor, contrato, costo y uso técnico conservan autoridades separadas;
- [x] todo pendiente posee propietario y condición de salida;
- [x] no se ejecuta código, Supabase, contratación, configuración, despliegue ni cambio físico;
- [x] se crean cero requisitos de prueba y se modifican cero existentes.

---

#### 32. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la conducta ejecutable que esta tarea especializa ya está protegida por requisitos vigentes. `TREQ-INTEGRATION-020` asigna expresamente `TI-INT-001` a `TI-INT-003` y exige que MDM, herramientas de soporte remoto, ISP, fabricantes y licenciamiento utilicen autenticación mínima, idempotencia, reloj coherente, límites, retries y reconciliación, sin convertir adaptadores en maestros de identidad, activo, contrato o costo. `TREQ-SHELL-010` ya protege la separación entre cuenta, permiso, credencial, secreto, asiento, endpoint, dispositivo y sesión, además del ciclo de soporte remoto y proveedor. `TREQ-VISO-002` protege el caso tecnológico maestro y su validación; `TREQ-ORIGO-005` protege proveedor y contrato; `TREQ-NUMERA-001`, `TREQ-NUMERA-002` y `TREQ-NUMERA-004` protegen hechos y costos económicos; y los requisitos de continuidad ya protegen dependencias y recuperación de proveedores.

Esta tarea materializa la especialización documental y las condiciones de habilitación de integraciones externas. No introduce una conducta ejecutable adicional que requiera una fila nueva ni altera el significado de los requisitos existentes.

**Balance:**

| Movimiento  | Cantidad |
| ----------- | -------: |
| Creados     |    **0** |
| Modificados |    **0** |
| Diferidos   |    **0** |
| Descartados |    **0** |
| Obsoletos   |    **0** |

No se requiere actualización del registro 04A.

---

#### 33. Estado de materialización

| Resultado                                     | Estado                               |
| --------------------------------------------- | ------------------------------------ |
| contrato MDM                                  | `ESPECIFICADO`                       |
| proveedor MDM real                            | `PENDIENTE_DE_EVIDENCIA`             |
| contrato de soporte remoto                    | `ESPECIFICADO`                       |
| herramienta de soporte remoto real            | `PENDIENTE_DE_EVIDENCIA`             |
| acceso remoto no atendido persistente         | `BLOQUEADO`                          |
| contrato ISP                                  | `ESPECIFICADO`                       |
| ISP/circuitos reales reconciliados            | `PENDIENTE_DE_EVIDENCIA`             |
| contrato de fabricante                        | `ESPECIFICADO`                       |
| canales/API/garantía de fabricante reales     | `PENDIENTE_DE_EVIDENCIA`             |
| contrato de licenciamiento                    | `ESPECIFICADO`                       |
| maestro empresarial de licencias implementado | `PENDIENTE_DE_EVIDENCIA`             |
| cinco familias técnicas externas observadas   | `ESPECIFICADO` como relación técnica |
| contratos comerciales de las cinco familias   | `PENDIENTE_DE_EVIDENCIA`             |
| integración física de proveedores             | `FUERA_DE_ALCANCE`                   |
| cambios Supabase                              | `NO_APLICA` en esta tarea            |
| cambios en requisitos de prueba               | `NO_APLICA` — cero cambios           |

---

#### 34. Continuidad

ÚLTIMA TAREA APROBADA
`TI-INT-002 — Definir contratos con SHELL, NEXO, ANIMA, VISO, ORIGO, NUMERA, PRINT-ARC, BLOQUE T y continuidad`

TAREA ACTUAL APROBADA
`TI-INT-003 — Definir integraciones con MDM, soporte remoto, ISP, fabricantes, licenciamiento y proveedores tecnológicos`

SIGUIENTE TAREA RESERVADA
`INFO-DOM-001 — Definir gobierno de información, inventario, propietarios, custodios, responsables, encargados, finalidades y territorios`

