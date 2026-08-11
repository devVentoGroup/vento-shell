### MINI-BLOQUE — INTEGRACIONES ANALITICAS Y SEMANTICAS

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **integraciones analiticas y semanticas** dentro de **AB ANALITICA INDICADORES Y DATOS MAESTROS**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `DATA-INT-001` a `DATA-INT-004` — 4 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `DATA-INT-001`: Definir contratos de eventos y lectura con todas las aplicaciones y fuentes externas
- `DATA-INT-002`: Definir capa semántica, modelos analíticos, snapshots, caché, consultas y rendimiento
- `DATA-INT-003`: Definir crosswalks, claves externas, identidad y reconciliación de datos maestros
- `DATA-INT-004`: Definir integración controlada con BI, hojas de cálculo, modelos analíticos e inteligencia artificial
<!-- PLAN-SECTION-META:END -->

### ✅ DATA-INT-001 — Definir contratos de eventos y lectura con todas las aplicaciones y fuentes externas

**Estado:** APROBADA
**Tarea anterior:** `DATA-UX-008 — Validar comprensión, tiempos y decisiones con usuarios reales` — APROBADA
**Tarea siguiente:** `DATA-INT-002 — Definir capa semántica, modelos analíticos, snapshots, caché, consultas y rendimiento` — RESERVADA
**Tipo de tarea:** documental; definición normativa y materializada de los contratos de eventos y lectura gobernada que alimentarán la analítica desde todas las aplicaciones Vento OS y desde fuentes externas autorizadas, sin implementar transporte, credenciales, pipelines, modelos físicos ni cambios de datos
**Bloque:** AB — Analítica, indicadores y datos maestros
**Fase:** exclusivamente documental dentro de `CONDITIONAL_DESIGN_ARTIFACTS`
**Implementación técnica:** no autorizada
**Código, DDL, DML, migraciones, RLS, RPC, grants, credenciales, webhooks, jobs, backfills, replays productivos, importaciones, escrituras, despliegues o cambios en Supabase:** no autorizados
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir cómo la capa analítica de Vento OS recibirá hechos durables y leerá estado gobernado desde cada aplicación propietaria y desde fuentes externas autorizadas sin crear una segunda fuente de verdad, sin permitir escrituras cruzadas y sin perder identidad, versión, corte, procedencia, autorización, calidad ni reconciliación.

La tarea debe permitir responder de forma determinista:

```text
qué aplicación o fuente conserva la autoridad del dato
qué mecanismo de entrada se utiliza
qué hecho durable puede consumirse como evento
qué estado debe obtenerse mediante lectura gobernada
qué versión de contrato y esquema se está consumiendo
qué población, proyección, periodo y corte representa una lectura
qué identidad permite correlacionar evento, lectura y fuente
cómo se preservan ocurrencia, registro, recepción y procesamiento
cómo se evita duplicar un hecho ante redelivery o reintento
cómo se completa un bootstrap sin perder los deltas posteriores
cómo se detectan diferencias entre eventos y estado leído
cómo se trata una fuente externa antes de aceptar un hecho interno
cómo se bloquea una lectura parcial, ambigua o no autorizada
qué evidencia permite reconstruir la ingestión
qué responsabilidad pertenece a DATA-INT-002, DATA-INT-003 o DATA-INT-004
```

La tarea no crea endpoints, topics, colas, vistas SQL, funciones, tablas, credenciales, adaptadores, webhooks, schedulers ni modelos físicos. Define el contrato documental que esas materializaciones deberán respetar en fases posteriores.

---

#### 2. Resultado sustantivo

Queda materializado el diseño de integración analítica con los siguientes resultados:

1. adopción por referencia del catálogo empresarial de **395 definiciones normales de eventos** sobre **69 procesos**, sin duplicarlo;
2. preservación de las **8 familias condicionales** de eventos ya gobernadas;
3. adopción por referencia de la emisora empresarial única de cada evento;
4. adopción por referencia de las **2.020 relaciones consumidoras** ya materializadas en BLOQUE X, sin crear audiencias paralelas;
5. preservación de los **10 perfiles de proyección** ya gobernados por el registro de consumidoras;
6. preservación de la garantía de transporte `AT_LEAST_ONCE`, del efecto empresarial como máximo una vez por alcance con reproducción del resultado y de la prohibición de orden global;
7. definición de un contrato analítico de evento que consume `EVENT-ENVELOPE-001` sin redefinirlo;
8. definición completa del contrato de lectura gobernada para API, vista y exportación controlada;
9. definición del patrón coordinado **bootstrap → deltas → reconciliación**;
10. reglas de corte estable, orden determinista, paginación y consistencia de población;
11. reglas de evolución de esquema, compatibilidad y bloqueo ante cambios incompatibles;
12. reglas de autorización y minimización previas a proyección, paginación y agregación;
13. matriz explícita de cobertura de las **10 aplicaciones Vento OS** actuales;
14. preservación de la distribución de propiedad de **69 procesos**: `1 + 20 + 16 + 6 + 4 + 12 + 7 + 2 + 1`, con `shell = 0` procesos empresariales;
15. matriz de integración para las **15 familias** heredadas de recopilación/ingestión;
16. decisión explícita de lectura gobernada para los **62 objetos maestros y de referencia**, preservando **59 `ESPECIFICADO` + 3 `BLOQUEADO`**;
17. preservación exacta de **43 datos maestros + 19 referencias**;
18. contrato observado de asistencia sobre **4 fuentes internas** y sus **14 métricas**;
19. preservación de **11 métricas `NO EVALUADO` + 3 `BLOQUEADO`** en asistencia;
20. contrato específico para Makos/POS externo mediante la única entrada actualmente evidenciada: exportación controlada/manual;
21. prohibición expresa de asumir API, webhook, polling o credencial del POS mientras las tareas propietarias no los confirmen;
22. gate universal para incorporar cualquier fuente externa futura sin inventar un inventario activo inexistente;
23. tratamiento fail closed de sistemas externos referenciados canónicamente cuya integración activa no está acreditada;
24. reglas de datos tardíos, replay, backfill, reconstrucción y conciliación sin reescritura histórica;
25. separación entre evento, lectura, comando, notificación, auditoría y fuente de verdad;
26. cero escrituras cruzadas y cero ampliación de autoridad por consumo analítico;
27. handoffs exactos hacia `DATA-INT-002`, `DATA-INT-003`, `DATA-INT-004`, BLOQUE X y fases de implementación;
28. cero cambios físicos y cero cambios de requisitos de prueba.

---

#### 3. Decisión principal

Vento OS adopta una integración analítica de **doble contrato coordinado**:

```text
CONTRATO DE EVENTO
→ hechos durables y cambios confirmados
→ incrementalidad y correlación
→ no sustituye la fuente propietaria

CONTRATO DE LECTURA GOBERNADA
→ estado, bootstrap, corte, reconciliación y reconstrucción autorizada
→ población y proyección explícitas
→ no concede escritura

EVENTO + LECTURA
→ convergen por identidad, versión, corte y procedencia
→ alimentan posteriormente la capa semántica
```

Regla cardinal:

```text
LA APLICACIÓN PROPIETARIA
CONSERVA LA AUTORIDAD EMPRESARIAL

LA INTEGRACIÓN ANALÍTICA
CONSUME HECHOS O PROYECCIONES

NUNCA
CONVIERTE EL CONSUMO EN PROPIEDAD
NI EL ESTADO DERIVADO EN FUENTE EDITABLE
```

Para fuentes externas:

```text
AFIRMACIÓN EXTERNA
→ CONTRATO EXTERNO AUTORIZADO
→ EVIDENCIA ORIGINAL
→ VALIDACIÓN / MAPPING / RECONCILIACIÓN
→ ACEPTACIÓN POR EL DOMINIO PROPIETARIO
→ HECHO INTERNO CUANDO CORRESPONDA
```

Una fuente externa no se registra como `producer_application` interna y no obtiene acceso directo a datos privados de Vento OS por participar en una integración.

---

#### 4. Fuentes y decisiones heredadas

DATA-INT-001 consume sin redefinir:

- `DATA-DOM-001` para gobierno federado, propiedad funcional, stewardship, fuentes de verdad y distribución de los 69 procesos;
- `DATA-DOM-002` y `DATA-DOM-003` para los 62 objetos maestros/referencia, identidad, vigencia y fronteras;
- `DATA-DOM-004` y `DATA-DOM-005` para métricas, hechos, eventos, grano, dimensiones, tiempo, calendarios y comparabilidad;
- `DATA-DOM-006` para los cuatro mecanismos de entrada, ingestión, esquema, idempotencia, datos tardíos, backfills, reconciliación y linaje;
- `DATA-DOM-007` para calidad, cobertura, frescura, certificación y bloqueo;
- `DATA-DOM-008` a `DATA-DOM-017` para artefactos, familias analíticas, diagnóstico, objetivos, intervenciones e historia;
- `DATA-AUTH-001` y `DATA-AUTH-002` para conjunto autorizado, finalidad, territorio, minimización, sensibilidad, poblaciones pequeñas y drill-down;
- `DATA-AUTH-003` para segregación entre definición, certificación, publicación, meta, anotación, exportación y administración;
- `DATA-AUTH-004` para evidencia de consulta y uso analítico;
- `DATA-UX-001` a `DATA-UX-008` para experiencia, interpretación, calidad, causalidad, decisiones, publicaciones y gate de usuarios reales;
- `INT-APP-001` para `ENTERPRISE-EVENT-CATALOG-001@1.0.0`, sus 395 definiciones normales y 8 familias condicionales;
- `INT-APP-002` para `ENTERPRISE-EVENT-PRODUCER-REGISTRY-001` y la emisora empresarial única;
- `INT-APP-003` para `ENTERPRISE-EVENT-CONSUMER-REGISTRY-001`, 2.020 relaciones consumidoras y 10 perfiles de proyección;
- `INT-APP-004` a `INT-APP-010` para idempotencia, entrega, orden, retry, auditoría y prohibición de escritura cruzada;
- `INT-EXT-001` a `INT-EXT-020` como tareas propietarias del inventario, identidad técnica, credenciales, contratos externos, webhook/polling, firma, rate limits, cuarentena, contingencia y retiro;
- `INT-POS-001` a `INT-POS-024` como tareas propietarias de la transición del POS externo;
- los requisitos de prueba vigentes que ya protegen contratos de origen, idempotencia, trazabilidad, captura única y reconciliación.

Ninguna decisión de esta tarea modifica el catálogo de eventos, las consumidoras, la propiedad de procesos, las fuentes lógicas ni las reglas de autorización existentes.

---

#### 5. Fronteras conceptuales obligatorias

```text
FUENTE DE VERDAD ≠ EVENTO ≠ LECTURA ≠ COPIA ANALÍTICA ≠ SNAPSHOT ≠ REPORTE
```

```text
EVENTO EMPRESARIAL ≠ COMANDO ≠ WEBHOOK TÉCNICO ≠ NOTIFICACIÓN ≠ LOG ≠ AUDITORÍA
```

```text
PRODUCTORA EMPRESARIAL ≠ PUBLICADOR TÉCNICO ≠ ADAPTADOR EXTERNO ≠ CONSUMIDORA
```

```text
LECTURA AUTORIZADA ≠ ESCRITURA AUTORIZADA
```

```text
FILTRO SOLICITADO ≠ TERRITORIO AUTORIZADO
```

```text
PROYECCIÓN ≠ MAESTRO EDITABLE
```

```text
API ≠ AUTORIDAD EMPRESARIAL
```

```text
VISTA ≠ FUENTE DE VERDAD
```

```text
EXPORTACIÓN CONTROLADA ≠ FUENTE EDITABLE
```

```text
WEBHOOK RECIBIDO ≠ HECHO INTERNO ACEPTADO
```

```text
RECEPCIÓN TÉCNICA ≠ VALIDACIÓN ≠ RECONCILIACIÓN ≠ CERTIFICACIÓN
```

```text
REDESPLIEGUE ≠ NUEVO HECHO
```

```text
REINTENTO ≠ REPLAY ≠ BACKFILL ≠ CORRECCIÓN ≠ RECONSTRUCCIÓN ≠ RESTATEMENT
```

```text
CREDENCIAL TÉCNICA ≠ PERMISO EMPRESARIAL
```

```text
MISMO TEXTO ≠ MISMA IDENTIDAD
```

```text
CERO ≠ NULO ≠ NO_APLICA ≠ DESCONOCIDO ≠ NO_RECIBIDO ≠ PENDIENTE
```

---

#### 6. Los cuatro mecanismos de entrada permanecen cerrados

DATA-INT-001 conserva exactamente los cuatro mecanismos aprobados en DATA-DOM-006:

|    # | Mecanismo              | Función en DATA-INT-001                                 | Uso principal                                                             | No autoriza                                                           |
| ---: | ---------------------- | ------------------------------------------------------- | ------------------------------------------------------------------------- | --------------------------------------------------------------------- |
|    1 | evento                 | consumir un hecho durable confirmado por la propietaria | deltas, historial, correlación y reacción incremental                     | reconstruir estado completo si la retención/cobertura no lo demuestra |
|    2 | API                    | lectura gobernada mediante contrato de servicio         | bootstrap, consulta puntual, reconciliación o historia cuando exista      | inferir endpoints, credenciales o historia que no estén confirmados   |
|    3 | vista                  | lectura gobernada de una proyección estable             | consulta de estado o conjunto dentro del contrato propietario             | editar la proyección ni convertirla en maestro                        |
|    4 | exportación controlada | lectura/ingestión de evidencia portable aprobada        | fuentes externas o intercambios donde no existe otro mecanismo acreditado | convertir el archivo en fuente de verdad por conveniencia             |

**Reconciliación:** 4 esperados; 4 materializados; 0 faltantes; 0 duplicados.

Un webhook se clasifica como entrega técnica de evento o API según su contrato. Polling es una estrategia técnica de obtención mediante lectura, no un quinto mecanismo. Un backfill reutiliza uno de los mecanismos anteriores sobre una ventana histórica y finalidad explícitas.

---

#### 7. Adopción del contrato empresarial de eventos

DATA-INT-001 no crea otro catálogo de eventos. Adopta por referencia:

```text
ENTERPRISE-EVENT-CATALOG-001@1.0.0
→ 395 definiciones normales
→ 69 procesos canónicos
→ 8 familias condicionales

ENTERPRISE-EVENT-PRODUCER-REGISTRY-001
→ una emisora empresarial por definición

ENTERPRISE-EVENT-CONSUMER-REGISTRY-001
→ 2.020 relaciones consumidoras
→ 10 perfiles de proyección
```

Reglas:

1. `event_definition_id` conserva la identidad aprobada `VPROC-####.EVT-###`;
2. cada definición normal conserva una sola `producer_application`;
3. la productora coincide con la aplicación propietaria del proceso;
4. una consumidora analítica no publica nuevamente el evento como si fuera la propietaria;
5. una indisponibilidad de la propietaria no crea otra productora;
6. el publicador técnico puede cambiar sin cambiar la productora empresarial;
7. una fuente externa pasa por adaptador/aceptación y no figura como productora interna;
8. AURA conserva el estado diferido ya aprobado y no se activa por esta tarea;
9. SHELL conserva cero procesos empresariales y cero eventos empresariales propios derivados de esos procesos;
10. los metadatos técnicos de entrega no alteran el significado empresarial del evento.

---

#### 8. Sobre de evento consumido por analítica

Toda ingestión analítica de un evento utiliza `EVENT-ENVELOPE-001` y preserva, cuando apliquen, los campos ya aprobados:

- identidad de emisión y definición;
- tipo y versión del evento;
- proceso e instancia;
- aplicación productora;
- agregado, identidad y versión;
- tiempo de ocurrencia y registro;
- zona horaria;
- principal y actor efectivo cuando sean materiales y autorizados;
- sede, área, turno y dispositivo cuando formen parte del contexto gobernado;
- estado previo y actual cuando aplique;
- correlación, causalidad y solicitud;
- identidad idempotente y comando fuente cuando aplique;
- referencias de resultado, salida, evidencia y auditoría;
- razón o clasificación aplicable;
- sensibilidad, alcance y retención;
- versión de esquema;
- contexto de trazabilidad técnica.

La proyección analítica puede minimizar el sobre conforme a finalidad y autorización. No puede eliminar la identidad, versión, tiempo, procedencia o correlación que sean necesarias para reproducibilidad, idempotencia o reconciliación.

---

#### 9. Semántica de transporte e idempotencia heredada

Se conservan las decisiones de BLOQUE X:

```text
TRANSPORTE
→ AT_LEAST_ONCE

EFECTO EMPRESARIAL
→ AT_MOST_ONCE_PER_SCOPE_WITH_RESULT_REPLAY

ORDEN GLOBAL
→ PROHIBIDO
```

Consecuencias para analítica:

1. un evento puede llegar más de una vez;
2. la deduplicación usa identidad/alcance gobernados, no igualdad aproximada de payload;
3. mismo identificador + mismo contenido lógico no crea un segundo hecho analítico;
4. mismo identificador + contenido materialmente distinto produce conflicto y conciliación;
5. el orden se resuelve únicamente donde el contrato lo permita, por agregado, versión y causalidad;
6. un timestamp aislado no crea un orden total entre procesos independientes;
7. redelivery no modifica `occurred_at`;
8. reintentar una entrega no convierte el intento en un nuevo evento;
9. un fallo de una consumidora no revierte el hecho persistido por la productora;
10. un evento procesado no demuestra por sí solo que todas las consumidoras estén reconciliadas.

---

#### 10. Cuándo usar evento y cuándo usar lectura

| Necesidad                | Evento                                              | Lectura gobernada                          | Regla                                               |
| ------------------------ | --------------------------------------------------- | ------------------------------------------ | --------------------------------------------------- |
| cambio durable nuevo     | principal cuando existe definición aplicable        | apoyo para reconciliación                  | no inventar evento nuevo en DATA-INT-001            |
| estado actual completo   | insuficiente por sí solo salvo cobertura demostrada | principal                                  | la fuente propietaria define la proyección          |
| bootstrap inicial        | deltas posteriores al corte                         | principal para la fotografía inicial       | corte y transición deben ser reproducibles          |
| reconstrucción histórica | posible si existe retención completa y contrato     | principal o complementaria según fuente    | no inferir historia desde estado actual             |
| backfill                 | puede usarse replay si existe evidencia completa    | puede usar API/vista/exportación histórica | declarar periodo y cobertura real                   |
| conciliación             | evidencia de cambios                                | estado fuente al corte                     | ninguna diferencia se corrige en la copia analítica |
| detalle puntual          | evento puede referenciar el recurso                 | lectura autorizada del recurso             | reautorizar detalle                                 |
| fuente externa           | callback/webhook no basta para aceptación           | lectura/evidencia según contrato externo   | aceptar primero bajo dominio propietario            |

---

#### 11. Coordenada mínima de lectura gobernada

Toda lectura analítica debe resolver, cuando aplique:

1. dominio propietario;
2. aplicación o sistema fuente;
3. rol de la fuente: autoridad, evidencia externa, proyección o derivado;
4. objeto, familia de hechos o colección solicitada;
5. finalidad empresarial;
6. consumidor autorizado;
7. población autorizada antes de filtros adicionales;
8. territorio real de los recursos/hechos;
9. proyección/campos autorizados;
10. inclusiones y exclusiones;
11. filtros materiales;
12. dimensiones solicitadas;
13. periodo o ventana;
14. corte de lectura;
15. zona horaria y calendario cuando afecten semántica;
16. granularidad;
17. identidad estable y claves de correlación;
18. versión del contrato;
19. versión del esquema;
20. versión o vigencia de maestros/dimensiones aplicables;
21. orden estable cuando exista paginación;
22. regla de continuación/paginación sin duplicar ni omitir elementos del mismo corte;
23. cobertura esperada cuando sea cognoscible;
24. cobertura observada;
25. frescura o última observación válida;
26. estados de dato ausente/no recibido/pendiente;
27. sensibilidad y minimización;
28. evidencia de procedencia;
29. resultado de la lectura: completa, parcial, bloqueada o fallida según semántica propietaria;
30. referencia de reconciliación cuando corresponda;
31. linaje hacia fuente y posteriores transformaciones;
32. evidencia suficiente para reproducir la coordenada sin copiar información sensible innecesaria.

**Reconciliación:** 32 componentes definidos; 0 componentes técnicos obligados a convertirse en columnas físicas por esta tarea.

---

#### 12. Contrato de lectura sin efectos empresariales

Una lectura analítica:

- no modifica el recurso consultado;
- no corrige maestros, hechos ni relaciones;
- no ejecuta una acción de negocio;
- no crea autorización adicional;
- no convierte un filtro del consumidor en territorio;
- no puede usar un `service_role` como sustituto de actor o finalidad;
- puede generar evidencia técnica/auditoría del acto de consulta sin cambiar el hecho empresarial;
- devuelve como máximo el conjunto y la proyección autorizados;
- puede ser denegada aunque el mismo consumidor haya leído el recurso en el pasado;
- reevalúa autorización al cambiar periodo, población, detalle, finalidad o edición histórica;
- preserva los bloqueos y estados de calidad del dato sin mejorarlos.

Toda mutación requerida por un hallazgo analítico se realiza mediante el contrato propietario correspondiente y queda fuera de esta lectura.

---

#### 13. Bootstrap, deltas y reconciliación

El patrón transversal aprobado para una proyección incremental es:

```text
1. RESOLVER AUTORIZACIÓN Y CONTRATO
2. FIJAR CORTE DE BOOTSTRAP
3. LEER POBLACIÓN COMPLETA AUTORIZADA AL CORTE
4. REGISTRAR IDENTIDADES, VERSIONES Y COBERTURA
5. ACTIVAR/CONTINUAR DELTAS POSTERIORES AL CORTE
6. APLICAR IDEMPOTENCIA Y VERSIONADO
7. RECONCILIAR CONTRA NUEVA LECTURA PROPIETARIA
8. CONSERVAR DIFERENCIAS HASTA RESOLUCIÓN
```

Reglas:

1. no existe una ventana ciega entre bootstrap y deltas;
2. si la fuente no puede ofrecer un corte coherente, la limitación queda visible y el mecanismo no se declara equivalente a snapshot consistente;
3. eventos ocurridos antes del corte pero registrados después se tratan conforme al contrato de datos tardíos;
4. un evento posterior no puede aplicar sobre una versión del agregado incompatible sin conflicto;
5. si el stream no garantiza retención suficiente, no se usa como única fuente de reconstrucción;
6. una lectura periódica de reconciliación no convierte la copia analítica en fuente;
7. las diferencias se resuelven en el dominio propietario o su proceso de conciliación;
8. la reconciliación no se logra eliminando filas divergentes para hacer coincidir totales.

---

#### 14. Corte estable, orden y paginación

Cuando una lectura sea paginada o incremental debe preservar:

- una misma definición de población durante el recorrido;
- un corte o condición de consistencia reproducible;
- orden total estable dentro de la colección cuando la paginación lo requiera;
- clave de desempate estable;
- continuación asociada al mismo contrato/corte;
- ausencia de duplicados entre páginas por movimiento de orden;
- ausencia de omisiones provocadas por insertar o actualizar registros durante el recorrido;
- detección explícita de una continuación inválida o vencida;
- conteos o cobertura solo cuando la fuente pueda demostrarlos;
- identidad de la lectura/corrida cuando se necesite reconciliar páginas.

Una implementación que solo use `offset` sobre una colección mutable no se considerará automáticamente consistente. El mecanismo físico deberá demostrar la semántica anterior o declarar su limitación.

---

#### 15. Tiempo y orden de los hechos

El contrato conserva separadamente, cuando apliquen:

```text
TIEMPO DEL HECHO
TIEMPO EMPRESARIAL
TIEMPO DE REGISTRO EN LA FUENTE
TIEMPO DE RECEPCIÓN
TIEMPO DE PROCESAMIENTO
TIEMPO DE CORRECCIÓN
CORTE DE LA LECTURA
```

Reglas:

1. la recepción tardía no mueve el hecho al periodo de recepción;
2. una corrección conserva el tiempo del hecho original y su propia vigencia;
3. un evento técnico sin tiempo empresarial suficiente no recibe uno inventado;
4. comparaciones históricas usan el calendario/zona horaria gobernados;
5. la analítica no ordena hechos de procesos independientes únicamente por timestamp;
6. el corte de lectura no sustituye el tiempo del hecho;
7. una zona horaria del cliente no reinterpreta la zona empresarial por conveniencia.

---

#### 16. Versiones y evolución de esquema

Todo productor o fuente debe hacer resoluble la forma del contenido consumido.

Se distinguen:

- cambio compatible aditivo;
- cambio de representación con adaptación explícita;
- cambio incompatible de tipo, clave, granularidad, semántica o población;
- consumidor que desconoce la versión recibida.

Reglas:

1. un evento de versión mayor incompatible no se procesa como la anterior por similitud;
2. una lectura con esquema incompatible se bloquea o adapta mediante contrato versionado;
3. un campo renombrado no se equipara por nombre aproximado;
4. eliminar una clave, cambiar granularidad o alterar población exige transición explícita;
5. la proyección analítica conserva la versión que produjo cada resultado;
6. la compatibilidad del contrato no prueba calidad de los datos;
7. una nueva versión técnica no cambia semántica empresarial si el contrato semántico permanece igual;
8. un cambio semántico que afecte historia consume el gobierno de versiones/restatements antes de reexpresar publicaciones.

---

#### 17. Autorización antes de leer y proyectar

Orden obligatorio:

```text
CAPACIDAD EXACTA
→ ACTOR / PRINCIPAL APLICABLE
→ DOMINIO Y RECURSO
→ TERRITORIO REAL
→ FINALIDAD
→ VERSIONES Y VIGENCIA
→ DENEGACIONES
→ CONJUNTO AUTORIZADO
→ PROYECCIÓN AUTORIZADA
→ FILTROS DEL CONSUMIDOR
→ LECTURA / AGREGACIÓN POSTERIOR
```

Reglas:

- ninguna lectura amplia se recupera para ocultar después filas en el cliente;
- la paginación opera sobre el conjunto ya autorizado;
- una integración técnica no recibe un wildcard empresarial;
- la aplicación propietaria no implica que cualquier actor de esa aplicación pueda leer todos sus datos;
- una lectura histórica aplica autorización vigente al acto de consulta;
- datos sensibles pueden requerir una proyección menor incluso cuando el recurso sea visible;
- el evento puede ser minimizado por consumidora y finalidad;
- un agregado no concede drill-down;
- cross-domain implica intersección de fronteras, no unión permisiva;
- una denegación prevalente no se neutraliza mediante caché, evento o snapshot.

---

#### 18. Calidad, cobertura y estados parciales

DATA-INT-001 transporta evidencia de calidad; no certifica.

Toda lectura o ingestión debe poder distinguir:

- conjunto completo bajo el contrato;
- conjunto parcial conocido;
- cobertura no comprobable;
- dato tardío;
- dato pendiente;
- referencia no resuelta;
- elemento en cuarentena;
- fuente degradada o indisponible;
- esquema incompatible;
- lectura bloqueada;
- lectura fallida;
- dato no aplicable.

Reglas:

1. completar técnicamente una lectura no la convierte en reconciliada;
2. reconciliar no la convierte automáticamente en certificada;
3. no conocer el total esperado impide inventar un porcentaje de cobertura;
4. una página faltante deja la corrida parcial;
5. una fuente `BLOQUEADO` no se presenta como saludable por llegar técnicamente;
6. una fuente AURA diferida no se sustituye por otra fuente informal;
7. los estados de DQ pertenecen al contrato de calidad y se conservan en consumidores.

---

#### 19. Matriz de las diez aplicaciones Vento OS

| Aplicación | Procesos propietarios | Rol como fuente para analítica                                                                                                        | Eventos                                                                              | Lectura gobernada                                                                                    | Estado documental                |
| ---------- | --------------------: | ------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------- | -------------------------------- |
| `anima`    |                     1 | hechos de asistencia/marcación del proceso propietario                                                                                | emite únicamente eventos de sus hechos según catálogo; no reemite programación VISO  | expone hechos de asistencia autorizados, versiones y cortes requeridos por consumidores              | `ESPECIFICADO`                   |
| `viso`     |                    20 | organización, personas administradas, programación laboral, gobierno y dominios transversales que posee                               | emisora de eventos de sus procesos; conserva programación como fuente frente a ANIMA | expone maestros/hechos autorizados de sus dominios sin convertir reportes en fuente                  | `ESPECIFICADO`                   |
| `nexo`     |                    16 | producto maestro, inventario, movimientos, ubicaciones, activos e instalaciones                                                       | emisora de hechos de inventario/logística que posee                                  | expone identidad/estado de inventario y maestros autorizados al corte                                | `ESPECIFICADO`                   |
| `fogo`     |                     6 | recetas, órdenes, lotes, consumos, producción, calidad y cierre productivo                                                            | emisora de hechos productivos propios                                                | expone versiones de receta, lotes, ejecuciones y resultados autorizados                              | `ESPECIFICADO`                   |
| `origo`    |                     4 | proveedores, necesidades, órdenes y aceptación comercial de compra                                                                    | emisora de hechos del ciclo de compra que posee                                      | expone proveedores, relaciones y documentos/estados de compra autorizados                            | `ESPECIFICADO`                   |
| `pulso`    |                    12 | oferta vendible, pedidos, servicio, venta, pago, caja, devolución y entrega                                                           | emisora de hechos comerciales propios                                                | expone ventas, pedidos, oferta y estados comerciales autorizados                                     | `ESPECIFICADO`                   |
| `numera`   |                     7 | obligaciones, presupuesto, registros económicos, conciliación, costos y rentabilidad                                                  | emisora de hechos económicos de sus procesos                                         | expone hechos, periodos, clasificaciones y resultados económicos autorizados                         | `ESPECIFICADO`                   |
| `aura`     |                     2 | fuente lógica objetivo de marketing/campañas, todavía sin fuente operativa habilitada                                                 | catálogo definido con ejecución diferida; no se activa productora runtime            | no se habilita lectura operativa ni backfill desde fuentes sustitutas                                | `BLOQUEADO` / `DEFINED_DEFERRED` |
| `pass`     |                     1 | identidad de cliente, fidelización y autoservicio                                                                                     | emisora de hechos del proceso propietario                                            | expone cliente, relación, preferencias y ledger autorizado sin convertir perfil analítico en maestro | `ESPECIFICADO`                   |
| `shell`    |                     0 | referencias transversales propias como aplicación, rol base e identidad técnica; no fuente de hechos empresariales de los 69 procesos | cero eventos empresariales por propiedad de proceso                                  | puede exponer referencias transversales gobernadas estrictamente dentro de sus contratos             | `ESPECIFICADO`                   |

**Reconciliación:** 10 aplicaciones; 10 con decisión explícita; procesos empresariales `1 + 20 + 16 + 6 + 4 + 12 + 7 + 2 + 1 = 69`; `shell = 0`; faltantes 0; duplicados 0.

---

#### 20. Regla transversal por aplicación

Para cada aplicación:

1. los hechos de su proceso se originan en su contrato propietario;
2. el evento confirma un hecho durable y no es una orden de escritura para otra aplicación;
3. el consumidor decide su efecto dentro de su propio dominio;
4. una lectura analítica es de solo lectura empresarial;
5. una copia local no puede convertirse en master editable;
6. la aplicación consumidora no redefine fórmula, identidad, versión o fuente;
7. toda lectura conserva el corte y la versión necesarios para reproducirla;
8. una corrección se realiza en la fuente propietaria y llega luego por evento, lectura o reconstrucción;
9. un evento no autoriza acceso al resto del agregado;
10. un agregado visible no autoriza acceso a cada fila fuente.

---

#### 21. Estado de las fuentes externas

Las fuentes canónicas actuales no contienen todavía el inventario materializado de todas las integraciones externas activas. Esa responsabilidad está asignada explícitamente a `INT-EXT-001`.

Por tanto, DATA-INT-001 adopta estas dos decisiones simultáneas:

1. **el contrato externo es universal y obligatorio para cualquier fuente externa que se incorpore**;
2. **no se inventa una lista de integraciones activas que el repositorio aún no ha confirmado**.

Estado verificable actual:

| Fuente/sistema            | Evidencia canónica actual                                         | Mecanismo DATA acreditado                            | Estado de integración automática                      | Propietario de la evidencia faltante                   |
| ------------------------- | ----------------------------------------------------------------- | ---------------------------------------------------- | ----------------------------------------------------- | ------------------------------------------------------ |
| Makos/POS externo vigente | convivencia mediante importación manual de Excel y mapeo de ítems | exportación controlada                               | `PENDIENTE_DE_EVIDENCIA`; no se presupone API/webhook | `INT-POS-001`, `INT-POS-002` y tareas aplicables       |
| Rappi                     | referido como sistema externo posible en BLOQUE X                 | ninguno acreditado por DATA-INT-001                  | `PENDIENTE_DE_EVIDENCIA`                              | `INT-EXT-001` y tareas específicas que correspondan    |
| Shopify                   | referido como sistema externo posible en BLOQUE X                 | ninguno acreditado por DATA-INT-001                  | `PENDIENTE_DE_EVIDENCIA`                              | `INT-EXT-001`                                          |
| ManyChat                  | referido como sistema externo posible en BLOQUE X                 | ninguno acreditado por DATA-INT-001                  | `PENDIENTE_DE_EVIDENCIA`                              | `INT-EXT-001`                                          |
| bancos                    | clase externa referida canónicamente                              | ninguno acreditado de forma transversal              | `PENDIENTE_DE_EVIDENCIA`                              | `INT-EXT-001` y dominio financiero aplicable           |
| proveedores de pago       | clase externa referida canónicamente                              | ninguno acreditado de forma transversal              | `PENDIENTE_DE_EVIDENCIA`                              | `INT-EXT-001` y dominio comercial/financiero aplicable |
| mensajería                | clase externa referida canónicamente                              | ninguno acreditado como fuente DATA                  | `PENDIENTE_DE_EVIDENCIA`                              | `INT-EXT-001`                                          |
| autoridades               | clase externa referida canónicamente                              | solo evidencia externa cuando el dominio la gobierne | `PENDIENTE_DE_EVIDENCIA` como integración concreta    | `INT-EXT-001` y dominio propietario                    |
| asesores                  | clase externa referida canónicamente                              | ninguno acreditado como fuente DATA                  | `PENDIENTE_DE_EVIDENCIA`                              | `INT-EXT-001`                                          |

Las filas distintas de Makos/POS son referencias canónicas a posibles terceros, no declaraciones de integración activa. No se asignan endpoints, credenciales, webhooks, formatos, propietarios técnicos ni ventanas históricas sin evidencia posterior.

---

#### 22. Gate de incorporación de una fuente externa

Antes de que una fuente externa pueda alimentar analítica deberán quedar resueltos, por las tareas propietarias correspondientes:

1. identidad del sistema/proveedor;
2. propietario funcional del dato interno afectado;
3. finalidad empresarial;
4. rol de la fuente externa: autoridad sobre afirmación externa, evidencia, proveedor de servicio o transportador;
5. mecanismo de entrada;
6. principal técnico independiente cuando corresponda;
7. referencia de credencial, sin exponer el secreto;
8. ambiente;
9. versión del contrato externo;
10. versión/formato del payload o lectura;
11. identidad externa y estrategia de correlación;
12. firma/origen/timestamp cuando aplique;
13. política de replay e idempotencia;
14. rate limits y política de reintentos cuando apliquen;
15. conservación del original cuando sea necesaria;
16. cobertura histórica disponible y límites reales;
17. mapping/crosswalk aprobado cuando la identidad sea externa;
18. cuarentena de no resueltos;
19. autorización y minimización;
20. conciliación con el dominio propietario;
21. contingencia ante indisponibilidad;
22. auditoría y evidencia;
23. retención;
24. retiro y revocación.

Si una dimensión material no puede resolverse, la fuente permanece `PENDIENTE_DE_EVIDENCIA` o `BLOQUEADO` según el riesgo. La ausencia de inventario externo no se sustituye por un proveedor genérico inventado.

---

#### 23. Makos/POS externo — contrato vigente de entrada

La única entrada externa de ventas acreditada en las fuentes consumidas para esta tarea es la convivencia mediante exportación manual de Excel y mapeo de ítems.

Contrato documental actual:

```text
POS EXTERNO
→ EXPORTACIÓN CONTROLADA
→ ORIGINAL CONSERVABLE CUANDO CORRESPONDA
→ VALIDACIÓN DE FORMATO Y COBERTURA
→ MAPPING CONTRA IDENTIDADES CANÓNICAS
→ CUARENTENA DE NO RESUELTOS
→ TRANSFORMACIÓN AL CONTRATO DE VENTA
→ RECONCILIACIÓN
→ CONSUMO AUTORIZADO
```

Reglas:

1. no se declara conexión automática confirmada;
2. no se declara API disponible hasta `INT-POS-002`;
3. no se declara webhook hasta que la auditoría propietaria lo confirme;
4. producto externo y producto Vento no se vinculan por coincidencia textual;
5. una línea sin mapping válido no produce silenciosamente inventario, fidelización o efecto financiero;
6. reingresar el mismo archivo/lote no duplica ventas ni efectos;
7. descuentos, impuestos, propinas, medios de pago, anulaciones y devoluciones conservan semántica de origen cuando estén presentes y contratados;
8. la cobertura histórica real permanece sujeta a la evidencia existente y no se inventa;
9. PULSO futuro no puede convivir como segunda autoridad activa de la misma venta sin transición explícita;
10. el proveedor no obtiene escritura directa en tablas internas ni acceso a Supabase por este contrato.

---

#### 24. Matriz de las quince familias heredadas

|    # | Familia de DATA-DOM-006                                                   | Propietaria/fuente                   | Contrato DATA-INT-001                                                                                              | Estado         |
| ---: | ------------------------------------------------------------------------- | ------------------------------------ | ------------------------------------------------------------------------------------------------------------------ | -------------- |
|    1 | SHIFT, ATTENDANCE_EVENT, ATTENDANCE_CORRECTION                            | VISO / ANIMA según frontera          | eventos de cambios durables + lectura gobernada de programación/hechos para bootstrap y reconciliación             | `ESPECIFICADO` |
|    2 | CONSENT_RECORD, CONTACT_VERIFICATION                                      | PASS / gobierno de privacidad        | eventos/evidencias versionados + lectura mínima por persona/finalidad/vigencia                                     | `ESPECIFICADO` |
|    3 | LOYALTY_LEDGER_ENTRY, redención, ajuste de puntos                         | PASS / PULSO según proceso           | eventos idempotentes del ledger + lectura de movimientos/estado para reconciliación                                | `ESPECIFICADO` |
|    4 | solicitud, caso, cotización, orden, recepción y devolución de compra      | ORIGO                                | eventos de ciclo de compra + lectura de cabeceras/líneas/estados/versiones                                         | `ESPECIFICADO` |
|    5 | lote, LPN, existencia, movimiento, conteo y ajuste                        | NEXO / FOGO                          | movimientos/eventos para deltas; existencia por lectura al corte y reconstrucción desde hechos                     | `ESPECIFICADO` |
|    6 | orden, lote, ejecución, consumo, merma y resultado productivo             | FOGO                                 | eventos de ejecución + lectura de lotes, receta/versión y resultados para reconciliación                           | `ESPECIFICADO` |
|    7 | pedido, comanda, venta, pago, caja, devolución y entrega                  | PULSO                                | eventos comerciales + lectura de estado/lineas al corte; POS externo solo por contrato aceptado durante transición | `ESPECIFICADO` |
|    8 | precio de venta, descuento y promoción vigente                            | PULSO; AURA solo intención futura    | versiones/cambios por eventos cuando existan + lectura de reglas vigentes/históricas; AURA no activa autoridad     | `ESPECIFICADO` |
|    9 | SERVICE_CASE, reclamo, reserva, compensación, satisfacción y comunicación | VISO / PASS / PULSO según frontera   | eventos de expediente + lectura gobernada de casos/interacciones autorizados                                       | `ESPECIFICADO` |
|   10 | hecho económico, obligación, pago, aplicación y conciliación              | NUMERA                               | eventos económicos + lectura de documentos/saldos/aplicaciones para conciliación                                   | `ESPECIFICADO` |
|   11 | presupuesto, forecast y escenario                                         | NUMERA                               | lectura versionada de artefactos; eventos de publicación/cambio solo cuando el catálogo los defina                 | `ESPECIFICADO` |
|   12 | campaña, pieza publicada, oportunidad, interacción y publicación          | AURA objetivo                        | contrato documental definido pero sin lectura/eventos runtime activos hasta habilitación canónica                  | `BLOQUEADO`    |
|   13 | ticket, incidente, problema y cambio tecnológico                          | VISO / BLOQUE Z                      | eventos de expediente + lectura gobernada del servicio/recurso y estado                                            | `ESPECIFICADO` |
|   14 | PRINTER y ASSET como clases de configuración                              | PRINT-ARC / NEXO                     | no se consumen como familia de hechos analíticos autónoma; se leen identidades/eventos de dominios propietarios    | `NO_APLICA`    |
|   15 | métrica, KPI, dashboard, reporte, exportación y snapshot                  | BLOQUE AB sobre fuentes propietarias | no se usan como autoridad de sus hechos fuente; la materialización semántica pertenece a DATA-INT-002              | `ESPECIFICADO` |

**Reconciliación:** 15 esperadas; 15 materializadas; 13 `ESPECIFICADO`; 1 `BLOQUEADO`; 1 `NO_APLICA`; faltantes 0; duplicados 0.

---

#### 25. Regla para maestros y referencias

Todo objeto maestro/referencia se consume mediante lectura gobernada de la fuente lógica aprobada.

Un evento de cambio puede complementar la lectura únicamente cuando existe una definición canónica que representa ese hecho. DATA-INT-001 no crea un evento por objeto para llenar huecos.

La lectura debe preservar como mínimo:

- identidad canónica;
- vigencia aplicable;
- atributos autorizados;
- fuente y autoridad por atributo cuando exista federación;
- versión/esquema;
- relaciones necesarias para el consumidor;
- territorio cuando corresponda;
- clasificación/sensibilidad;
- estado de calidad cuando sea material;
- linaje suficiente para demostrar de dónde provino la proyección.

No se permite:

- fusionar por nombre;
- sustituir un identificador por texto visible;
- aplicar estado actual a hechos pasados sin vigencia;
- editar el maestro desde una proyección analítica;
- convertir un crosswalk en identidad empresarial;
- usar una dimensión denormalizada como nueva fuente.

---

#### 26. Matriz de lectura gobernada de los 62 objetos

|    # | Objeto                        | Fuente lógica aprobada                       | Decisión DATA-INT-001                                                                                                              | Estado         |
| ---: | ----------------------------- | -------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- | -------------- |
|    1 | `ORGANIZATION_SCOPE`          | VISO                                         | lectura de identidad, vigencia y contexto organizacional autorizados; eventos solo si existen definiciones propietarias aplicables | `ESPECIFICADO` |
|    2 | `LEGAL_SUBJECT`               | VISO con evidencia externa aplicable         | lectura de autoridad interna y procedencia por atributo; evidencia externa no reemplaza historia                                   | `ESPECIFICADO` |
|    3 | `BRAND`                       | VISO                                         | lectura de identidad/vigencia; etiquetas externas no crean otra identidad                                                          | `ESPECIFICADO` |
|    4 | `COMMERCIAL_ESTABLISHMENT`    | VISO con evidencia externa aplicable         | lectura de estado empresarial y evidencia reconciliada sin promover registro externo a autoridad total                             | `ESPECIFICADO` |
|    5 | `BUSINESS_LINE`               | VISO                                         | lectura de identidad/vigencia sin inferir sede o titular desde etiqueta                                                            | `ESPECIFICADO` |
|    6 | `PHYSICAL_FACILITY`           | VISO con atributos físicos NEXO              | lectura federada por atributo y vigencia; conservar fuentes distintas sin fusionarlas                                              | `ESPECIFICADO` |
|    7 | `OPERATIONAL_SITE`            | VISO                                         | lectura de identidad/vigencia territorial aplicable al corte                                                                       | `ESPECIFICADO` |
|    8 | `ORGANIZATIONAL_AREA`         | VISO                                         | lectura de identidad/vigencia funcional; no sustituir zona física                                                                  | `ESPECIFICADO` |
|    9 | `PHYSICAL_ZONE`               | NEXO con referencia VISO                     | lectura de identidad física y relaciones vigentes con instalación/sede                                                             | `ESPECIFICADO` |
|   10 | `WORKSTATION`                 | NEXO con contratos SHELL/AUTH-DEV aplicables | lectura de estación y relaciones técnicas autorizadas sin fusionar dispositivo o actor                                             | `ESPECIFICADO` |
|   11 | `EXTERNAL_OPERATIONAL_POINT`  | VISO con custodia NEXO                       | lectura de identidad, finalidad y vigencia; no convertir en sede por repetición histórica                                          | `ESPECIFICADO` |
|   12 | `PERSON_IDENTITY`             | VISO                                         | lectura de identidad empresarial autorizada; correlación externa no produce fusión automática                                      | `ESPECIFICADO` |
|   13 | `WORKER_PROFILE`              | VISO                                         | lectura de perfil y vigencia laboral; no sustituir identidad de persona                                                            | `ESPECIFICADO` |
|   14 | `EMPLOYMENT_RELATIONSHIP`     | VISO                                         | lectura histórica de cada vínculo y vigencia aplicable al hecho                                                                    | `ESPECIFICADO` |
|   15 | `CONTRACTUAL_POSITION`        | VISO                                         | lectura de referencia versionada/vigente; no derivar permisos                                                                      | `ESPECIFICADO` |
|   16 | `BASE_ROLE`                   | SHELL                                        | lectura de referencia autorizativa gobernada; no derivar cargo o función operativa                                                 | `ESPECIFICADO` |
|   17 | `OPERATIONAL_ROLE`            | VISO con modelo de autorización              | lectura de función operativa/vigencia sin fusionarla con permiso                                                                   | `ESPECIFICADO` |
|   18 | `WORK_ASSIGNMENT`             | VISO                                         | lectura de asignación y vigencia histórica por sede/área/función                                                                   | `ESPECIFICADO` |
|   19 | `CUSTOMER_PERSON`             | PASS                                         | lectura de identidad cliente autorizada; contactos coincidentes no prueban identidad                                               | `ESPECIFICADO` |
|   20 | `CUSTOMER_CONTACT`            | PASS                                         | lectura minimizada de contacto, verificación, fuente y vigencia                                                                    | `ESPECIFICADO` |
|   21 | `CUSTOMER_RELATIONSHIP`       | PASS                                         | lectura por marca/alcance/vigencia; no equiparar con consentimiento                                                                | `ESPECIFICADO` |
|   22 | `CUSTOMER_PROFILE`            | PASS                                         | lectura de proyección autorizada; la copia analítica no es superficie de edición                                                   | `ESPECIFICADO` |
|   23 | `CUSTOMER_PREFERENCE`         | PASS                                         | lectura de preferencia/vigencia; no inferir autorización de marketing                                                              | `ESPECIFICADO` |
|   24 | `LOYALTY_ACCOUNT`             | PASS                                         | lectura de identidad de cuenta; saldo derivado no sustituye ledger                                                                 | `ESPECIFICADO` |
|   25 | `LOYALTY_PROGRAM_RULE`        | PASS                                         | lectura de regla/versión vigente e histórica aplicable                                                                             | `ESPECIFICADO` |
|   26 | `PRODUCTO_MAESTRO`            | NEXO                                         | lectura de identidad maestra; externos se correlacionan por crosswalk aprobado                                                     | `ESPECIFICADO` |
|   27 | `VARIANTE`                    | NEXO                                         | lectura de identidad diferenciada; no colapsar con producto/presentación                                                           | `ESPECIFICADO` |
|   28 | `PRESENTACION`                | NEXO                                         | lectura preservando producto, cantidad, unidad, multiplicador y contexto                                                           | `ESPECIFICADO` |
|   29 | `UNIDAD_DE_MEDIDA`            | NEXO                                         | lectura de código/dimensión; conversiones usan contrato vigente separado                                                           | `ESPECIFICADO` |
|   30 | `TAXONOMIA_TIPO_MAESTRO`      | NEXO                                         | lectura de referencia/vigencia; no reclasificar historia con etiqueta actual                                                       | `ESPECIFICADO` |
|   31 | `TAXONOMIA_INVENTARIO`        | NEXO                                         | lectura de referencia/vigencia sin sustituir identidad o política física                                                           | `ESPECIFICADO` |
|   32 | `TAXONOMIA_OPERACIONAL`       | NEXO                                         | lectura para segmentación autorizada; no alterar clasificación comercial                                                           | `ESPECIFICADO` |
|   33 | `LOC`                         | NEXO                                         | lectura de identidad/vigencia; hechos históricos usan la ubicación aplicable al tiempo                                             | `ESPECIFICADO` |
|   34 | `ACTIVO_FISICO`               | NEXO                                         | lectura de identidad, ubicación/condición autorizadas y vigencia                                                                   | `ESPECIFICADO` |
|   35 | `CLASE_DE_ACTIVO`             | NEXO                                         | lectura de referencia gobernada; clase no infiere identidad o mantenimiento                                                        | `ESPECIFICADO` |
|   36 | `ESPECIFICACION_PRODUCTO`     | NEXO; FOGO por atributo productivo           | lectura federada por atributo/versión; no reescribir hechos históricos                                                             | `ESPECIFICADO` |
|   37 | `PROVEEDOR`                   | ORIGO                                        | lectura de identidad proveedor; evidencia externa preserva procedencia                                                             | `ESPECIFICADO` |
|   38 | `CONTACTO_PROVEEDOR`          | ORIGO                                        | lectura separada del proveedor; coincidencia de contacto no fusiona proveedores                                                    | `ESPECIFICADO` |
|   39 | `RELACION_PRODUCTO_PROVEEDOR` | ORIGO                                        | lectura de relación/vigencia; no equiparar con contrato/precio/oferta actual                                                       | `ESPECIFICADO` |
|   40 | `CONDICION_COMERCIAL`         | ORIGO                                        | lectura de versión/vigencia; hechos conservan condición aplicada                                                                   | `ESPECIFICADO` |
|   41 | `TAXONOMIA_COMPRA`            | ORIGO                                        | lectura de referencia gobernada sin sustituir taxonomías de otros dominios                                                         | `ESPECIFICADO` |
|   42 | `RECETA`                      | FOGO                                         | lectura de identidad y versión publicada aplicable; ejecución conserva versión usada                                               | `ESPECIFICADO` |
|   43 | `FAMILIA_PRODUCTIVA`          | FOGO                                         | lectura de referencia/vigencia sin sustituir categoría comercial/inventario                                                        | `ESPECIFICADO` |
|   44 | `RUTA_PRODUCTIVA`             | FOGO                                         | lectura de definición/versionado reusable; la ejecución permanece hecho separado                                                   | `ESPECIFICADO` |
|   45 | `RECURSO_PRODUCTIVO`          | FOGO con referencia NEXO                     | lectura de recurso funcional y correlación con activo físico sin fusionar identidades                                              | `ESPECIFICADO` |
|   46 | `COMMERCIAL_CHANNEL`          | PULSO                                        | lectura de canal; identificador externo no crea canal canónico nuevo                                                               | `ESPECIFICADO` |
|   47 | `CATEGORIA_COMERCIAL`         | PULSO                                        | lectura de taxonomía/vigencia; no modifica stock o clasificación operativa                                                         | `ESPECIFICADO` |
|   48 | `OFERTA_COMERCIAL`            | PULSO                                        | lectura de configuración vendible/versionada; hechos conservan condición aplicada                                                  | `ESPECIFICADO` |
|   49 | `CENTRO_DE_COSTO`             | NUMERA                                       | lectura de identidad/vigencia económica; no inferir equivalencia con sede/área                                                     | `ESPECIFICADO` |
|   50 | `MONEDA`                      | NUMERA                                       | lectura de referencia monetaria; conversiones permanecen separadas                                                                 | `ESPECIFICADO` |
|   51 | `PERIODO_ECONOMICO`           | NUMERA                                       | lectura de referencia/estado; no mezclar con periodo contable/fiscal/operativo                                                     | `ESPECIFICADO` |
|   52 | `PERIODO_CONTABLE`            | NUMERA o sistema contable autorizado         | lectura desde la autoridad vigente con procedencia; sistema externo concreto no se inventa                                         | `ESPECIFICADO` |
|   53 | `PERIODO_FISCAL`              | NUMERA con autoridad externa aplicable       | lectura interna reconciliada con evidencia externa cuando aplique                                                                  | `ESPECIFICADO` |
|   54 | `CLASIFICACION_ECONOMICA`     | NUMERA                                       | lectura de referencia/vigencia sin redefinir el hecho operativo clasificado                                                        | `ESPECIFICADO` |
|   55 | `PERFIL_DE_MARCA`             | AURA objetivo                                | no habilitar lectura operativa, backfill ni fuente sustituta hasta activación canónica                                             | `BLOQUEADO`    |
|   56 | `AUDIENCIA`                   | AURA objetivo                                | no materializar desde listas paralelas; requiere AURA, finalidad y consentimiento                                                  | `BLOQUEADO`    |
|   57 | `ACTIVO_DE_MARCA`             | AURA objetivo                                | no migrar autoridad desde carpetas/copias mientras la fuente objetivo siga diferida                                                | `BLOQUEADO`    |
|   58 | `ENDPOINT`                    | BLOQUE Z / TI-DOM-002                        | lectura de identidad técnica administrada; no fusionar con activo/dispositivo                                                      | `ESPECIFICADO` |
|   59 | `SHARED_DEVICE`               | SHELL / AUTH-DEV consumidos por BLOQUE Z     | lectura de identidad lógica/vigencia; no inferir actor o endpoint                                                                  | `ESPECIFICADO` |
|   60 | `NETWORK_RESOURCE`            | BLOQUE Z                                     | lectura de identidad gobernada; IP/MAC/SSID aislados no determinan identidad                                                       | `ESPECIFICADO` |
|   61 | `APPLICATION`                 | SHELL                                        | lectura de `app_code` e identidad canónica; repositorio, URL o ambiente no sustituyen aplicación                                   | `ESPECIFICADO` |
|   62 | `TECH_SERVICE`                | BLOQUE Z / TI-DOM-001                        | lectura de referencia estable y sus identidades aprobadas                                                                          | `ESPECIFICADO` |

**Reconciliación:** 62 esperados; 62 materializados; 62 identidades únicas; 59 `ESPECIFICADO`; 3 `BLOQUEADO`; 43 maestros + 19 referencias preservados; faltantes 0; duplicados 0.

---

#### 27. Contrato observado de asistencia — cuatro fuentes

La implementación actual de `attendance-report` consulta cuatro fuentes internas observadas:

```text
scheduled_shifts
attendance_sessions
attendance_breaks
attendance_geofence_events
```

Decisiones DATA-INT-001:

1. VISO conserva programación laboral;
2. ANIMA conserva hechos de asistencia dentro de su proceso propietario;
3. el reporte es consumidor/proyección, no fuente;
4. la lectura debe conservar periodo, filtros autorizados, zona horaria y corte;
5. paginación ordenada debe producir el mismo conjunto para un corte estable;
6. sesiones, descansos y eventos geográficos permanecen granos distintos;
7. una corrección se materializa primero en la fuente propietaria;
8. una nueva lectura/reconstrucción refleja después la corrección;
9. no se declara un backfill histórico implementado por la existencia del reporte;
10. frescura, completitud y certificación permanecen en el contrato DQ.

**Reconciliación:** 4 fuentes observadas; 4 incorporadas; faltantes 0; duplicados 0.

---

#### 28. Dependencias de las catorce métricas de asistencia

|    # | `metric_key`        | Entradas de lectura                                                       | Estado DQ heredado | Decisión DATA-INT-001                                                             |
| ---: | ------------------- | ------------------------------------------------------------------------- | ------------------ | --------------------------------------------------------------------------------- |
|    1 | `scheduledShifts`   | `scheduled_shifts`                                                        | `NO EVALUADO`      | lectura de programación al corte; no se ingiere el resultado agregado como fuente |
|    2 | `attendedShifts`    | `scheduled_shifts` + `attendance_sessions`                                | `NO EVALUADO`      | correlación por contrato; el agregado sigue derivado                              |
|    3 | `restDayCount`      | `scheduled_shifts`                                                        | `NO EVALUADO`      | lectura de programación; estado derivado                                          |
|    4 | `lateCount`         | `scheduled_shifts` + `attendance_sessions`                                | `NO EVALUADO`      | preservar tiempo del hecho y regla de cálculo posterior                           |
|    5 | `noShowCount`       | `scheduled_shifts` + `attendance_sessions`                                | `NO EVALUADO`      | evaluación al corte; no fabricar ausencia como cero fuera de contrato             |
|    6 | `openCount`         | `scheduled_shifts` + `attendance_sessions`                                | `NO EVALUADO`      | evaluación al corte con sesiones vigentes                                         |
|    7 | `missingCloseCount` | `scheduled_shifts` + `attendance_sessions`                                | `BLOQUEADO`        | transportar fuentes sin elevar estado; bloqueo permanece                          |
|    8 | `autoCloseCount`    | `attendance_sessions`                                                     | `NO EVALUADO`      | lectura de sesiones; resultado derivado                                           |
|    9 | `departureCount`    | `scheduled_shifts` + `attendance_sessions` + `attendance_geofence_events` | `NO EVALUADO`      | preservar eventos geográficos separados y correlacionados                         |
|   10 | `scheduledMinutes`  | `scheduled_shifts`                                                        | `NO EVALUADO`      | lectura de programación; cálculo posterior                                        |
|   11 | `netMinutes`        | `attendance_sessions` + `attendance_breaks`                               | `NO EVALUADO`      | sesiones y descansos conservan granos/tiempos propios                             |
|   12 | `incidentCount`     | `scheduled_shifts` + `attendance_sessions` + `attendance_geofence_events` | `NO EVALUADO`      | composición posterior sin convertir incidente derivado en fuente                  |
|   13 | `attendanceRate`    | métricas base derivadas de `scheduled_shifts` y `attendance_sessions`     | `BLOQUEADO`        | no transportar el cero incorrecto como valor oficial; bloqueo permanece           |
|   14 | `punctualityRate`   | métricas base derivadas de `attendance_sessions` y programación           | `BLOQUEADO`        | no transportar el cero incorrecto como valor oficial; bloqueo permanece           |

**Reconciliación:** 14 métricas; 14 decisiones; 11 `NO EVALUADO`; 3 `BLOQUEADO`; las bloqueadas siguen siendo `missingCloseCount`, `attendanceRate` y `punctualityRate`.

---

#### 29. Eventos frente a métricas y agregados

Reglas:

- una métrica agregada no se emite como sustituto de los hechos que la componen;
- el catálogo empresarial puede contener eventos de publicación/decisión material, pero eso no convierte un KPI calculado en hecho transaccional de origen;
- DATA-INT-002 consume fuentes/eventos y define la capa semántica y cálculos compartidos;
- una actualización de dashboard no es evento empresarial;
- un cambio de filtro no es evento empresarial;
- una reconstrucción de métrica conserva sus versiones y fuentes;
- los consumidores no pueden escribir el valor agregado de vuelta a los hechos para “corregir” una diferencia;
- una métrica bloqueada no se sanea transportándola por otro mecanismo.

---

#### 30. Datos tardíos y backfill

Para cada fuente, un backfill solo es elegible cuando existe:

- fuente aprobada;
- periodo exacto;
- identidad suficiente;
- esquema/formato conocido;
- cobertura demostrable o limitación explícita;
- mappings/crosswalks aplicables;
- deduplicación e idempotencia;
- transformación versionada;
- reconciliación;
- relación con publicaciones/snapshots que puedan verse afectados.

Reglas:

1. un dato tardío conserva tiempo del hecho;
2. un backfill no inventa eventos que nunca fueron observados;
3. una lectura actual sin historia no permite reconstruir por sí sola el pasado;
4. un snapshot publicado puede evidenciar lo publicado, pero no se desagrega para inventar hechos;
5. un archivo histórico externo solo cubre lo que realmente contiene;
6. una API se usa para backfill únicamente si el proveedor demuestra esa capacidad y ventana;
7. AURA no recibe backfill mientras siga sin fuente operativa;
8. reexpresar una publicación previa consume el gobierno de restatement.

---

#### 31. Reconciliación evento ↔ lectura

La analítica deberá poder detectar, como mínimo:

- evento presente y recurso presente en lectura;
- evento presente y recurso ausente bajo una razón válida;
- evento presente y recurso ausente sin explicación;
- recurso presente sin evento dentro de una ventana donde el evento era obligatorio;
- versión de agregado adelantada o retrasada;
- evento duplicado;
- evento fuera de orden válido;
- lectura parcial;
- referencia no resuelta;
- dato tardío;
- corrección posterior;
- diferencia de atributo con autoridad federada.

Una diferencia no autoriza a modificar la fuente desde la copia analítica. Debe producir evidencia y remitirse al propietario del dato/contrato.

---

#### 32. Prohibición de escrituras cruzadas

DATA-INT-001 aplica la regla transversal:

```text
LECTURA ANALÍTICA
→ SIN EFECTO EMPRESARIAL DE ESCRITURA

EVENTO CONSUMIDO
→ PUEDE DISPARAR UN EFECTO PROPIO AUTORIZADO EN EL DOMINIO CONSUMIDOR
→ NUNCA UNA ESCRITURA PRIVADA EN EL DOMINIO PRODUCTOR
```

Queda prohibido:

- actualizar una tabla propietaria de otra aplicación desde analítica;
- corregir un maestro mediante una vista o snapshot;
- reingresar una exportación como mutación implícita;
- usar una credencial de lectura como credencial de escritura;
- ejecutar compensaciones sin contrato propietario;
- crear un hecho interno porque un webhook técnico llegó;
- usar Supabase `service_role` como atajo de integración empresarial;
- reemitir el evento fuente con otra `producer_application`;
- hacer doble digitación para compensar la ausencia de integración.

---

#### 33. Seguridad y minimización

El contrato exige:

1. proyección mínima por finalidad;
2. campos sensibles fuera del payload si no son necesarios;
3. credenciales y secretos nunca dentro del payload analítico;
4. referencias de credencial en logs, no valores secretos;
5. aislamiento por ambiente cuando la integración externa se materialice;
6. actor y principal técnico diferenciados;
7. retención compatible con clasificación y finalidad;
8. cuarentena con protección igual o mayor a la fuente;
9. drill-down con autorización independiente;
10. evidencia externa original protegida según su contenido;
11. no registrar payloads completos sensibles por conveniencia de depuración;
12. no exponer campos ocultos mediante mensajes de error, conteos o filtros.

---

#### 34. Linaje y evidencia

Todo resultado materializado posteriormente deberá poder recorrer:

```text
RESULTADO ANALÍTICO
→ MODELO / TRANSFORMACIÓN Y VERSIÓN
→ LECTURA O EVENTOS DE ENTRADA
→ CORTE / CORRIDA
→ CONTRATO Y ESQUEMA
→ FUENTE / PRODUCTORA
→ RECURSO O EVIDENCIA ORIGINAL
```

Para fuentes externas además:

```text
FUENTE EXTERNA
→ RECEPCIÓN / ARCHIVO / RESPUESTA
→ VALIDACIÓN
→ IDENTIDAD EXTERNA
→ CROSSWALK CUANDO APLIQUE
→ ACEPTACIÓN / CUARENTENA
→ HECHO O PROYECCIÓN INTERNA
```

El linaje no concede acceso al detalle. La autorización se evalúa en cada salto.

---

#### 35. Fallos, reintentos y recuperación

Toda materialización posterior deberá distinguir:

- fallo antes de recibir evidencia;
- evidencia recibida pero no validada;
- validada pero no procesada;
- procesada pero no reconciliada;
- resultado desconocido;
- conflicto de identidad/versión;
- cuarentena;
- fuente indisponible;
- página faltante;
- continuación inválida;
- evento duplicado;
- evento con reutilización conflictiva de identidad;
- consumidor retrasado;
- reconstrucción o supersesión posterior.

Reglas:

1. timeout no implica que el proveedor no ejecutó;
2. el reintento consulta el estado/receipt cuando el resultado puede ser desconocido;
3. backoff, jitter, `Retry-After`, límites de intentos y edad pertenecen al contrato técnico aplicable;
4. una falla terminal no se oculta mediante retry infinito;
5. la recuperación conserva correlación con el intento original;
6. un fallo del consumidor no cambia la verdad del productor;
7. una corrida parcial permanece parcial hasta reconciliar.

---

#### 36. AURA permanece diferida

AURA conserva simultáneamente:

- 2 procesos propietarios definidos documentalmente;
- eventos y relaciones documentales que puedan existir en los catálogos aprobados;
- runtime `DEFINED_DEFERRED`;
- tres objetos de datos `BLOQUEADO`;
- ausencia de fuente operativa que DATA-INT-001 pueda activar.

Prohibiciones:

- no adoptar carpetas, hojas, exports o listas paralelas como fuente AURA;
- no inventar backfill de campañas/audiencias;
- no migrar autoridad desde otra aplicación por conveniencia;
- no activar consumos externos o internos en nombre de AURA;
- no presentar la existencia del contrato como implementación.

---

#### 37. Frontera con la capa semántica y las 55 familias analíticas

DATA-INT-001 garantiza contratos de entrada; no materializa todavía las 55 familias analíticas como modelos físicos.

La cadena correcta es:

```text
15 FAMILIAS DE FUENTE / HECHO
+ 62 MAESTROS Y REFERENCIAS
+ EVENTOS EMPRESARIALES GOBERNADOS
+ LECTURAS GOBERNADAS
        ↓
DATA-INT-002
        ↓
CAPA SEMÁNTICA / MODELOS / CONSULTAS / SNAPSHOTS / CACHÉ
        ↓
55 FAMILIAS ANALÍTICAS
        ↓
EXPERIENCIA DATA-UX
```

Las 55 familias permanecen definidas por DATA-DOM-009 a DATA-DOM-013. DATA-INT-001 no inventa fórmulas, modelos o joins para producirlas anticipadamente.

---

#### 38. Handoffs con propietario documental exacto

| Decisión o materialización fuera de alcance                                              | Propietario documental                                          | Condición de salida                                                        |
| ---------------------------------------------------------------------------------------- | --------------------------------------------------------------- | -------------------------------------------------------------------------- |
| capa semántica, modelos, snapshots, caché, consultas y rendimiento                       | `DATA-INT-002`                                                  | antes de materializar proyecciones analíticas compartidas                  |
| crosswalks, claves externas, matching, merge/split y reconciliación de identidades       | `DATA-INT-003`                                                  | antes de resolver físicamente identidad entre sistemas                     |
| BI, hojas de cálculo, modelos analíticos e inteligencia artificial                       | `DATA-INT-004`                                                  | antes de permitir herramientas externas/automatizadas como consumidoras    |
| inventario real de sistemas externos, propietarios y finalidad                           | `INT-EXT-001`                                                   | antes de declarar completa la lista de integraciones externas activas      |
| principal técnico, credenciales, ambientes, secretos y rotación                          | `INT-EXT-002` a `INT-EXT-008`, `INT-EXT-020`                    | antes de autenticar una integración externa                                |
| contrato externo, webhook/polling, firma, replay, rate limits, cuarentena y contingencia | `INT-EXT-009` a `INT-EXT-019`                                   | antes de operar físicamente una fuente/proveedor externo                   |
| auditoría de capacidades del POS externo                                                 | `INT-POS-001`, `INT-POS-002`                                    | antes de afirmar API, webhook, ventanas o límites del proveedor            |
| adaptación, mapping, idempotencia y transición del POS                                   | `INT-POS-003` a `INT-POS-024`                                   | antes de producir efectos productivos desde el POS externo                 |
| autorizaciones de lectura y protección de detalle                                        | `DATA-AUTH-001`, `DATA-AUTH-002`                                | antes de exponer cualquier conjunto o proyección                           |
| certificación de calidad                                                                 | `DATA-DOM-007`                                                  | antes de declarar una fuente o salida apta para uso certificado            |
| correcciones históricas/restatements                                                     | `DATA-DOM-017`                                                  | antes de reexpresar una publicación histórica                              |
| implementación de contratos compartidos                                                  | BLOQUE H / arquitectura y paquetes de implementación aplicables | después de la aprobación de diseño y cuando la fase física esté habilitada |
| infraestructura, Supabase, colas, funciones y persistencia                               | tareas E3/E4/R aplicables                                       | solo en fase de implementación autorizada                                  |

No queda una decisión material propia de DATA-INT-001 sin propietario y condición de salida.

---

#### 39. Cobertura de requisitos vigentes

La conducta definida aquí ya se encuentra protegida por requisitos canónicos vigentes:

- `TREQ-DATA-003` exige contratos de origen, tiempos, granularidad, claves, versión de esquema, cobertura, duplicados, integridad, datos tardíos, backfills, correcciones, cuarentena, reconciliación y linaje, y asigna expresamente responsabilidades a DATA-INT;
- `TREQ-DATA-002` exige que una misma versión/contexto produzca el mismo resultado y protege identidad/versionado semántico;
- `TREQ-INTEGRATION-003` protege idempotencia, resultado recuperable, conflictos por reutilización de identidad, retry y fronteras de concurrencia;
- `TREQ-INTEGRATION-004` protege trazabilidad de cadenas asíncronas y efectos finales;
- `TREQ-INTEGRATION-006` protege captura única en la aplicación propietaria, propagación por contratos/eventos y reconciliación de fuentes competidoras;
- los requisitos de autorización vigentes protegen la lectura por capacidad, recurso, territorio, finalidad y proyección;
- los requisitos UX vigentes protegen fuente de verdad, trazabilidad, estado y no duplicación de captura.

DATA-INT-001 especializa estas reglas para la frontera analítica sin cambiar su prioridad, modalidad, estado, relaciones ni destino de implementación.

---

#### 40. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** los requisitos vigentes ya cubren de forma directa los contratos de origen, eventos, lectura reproducible, esquema, tiempos, idempotencia, cobertura, datos tardíos, backfill, conciliación, trazabilidad, autorización, captura única y prohibición de fuentes competidoras. DATA-INT-001 materializa el contrato documental y su cobertura por aplicación/fuente sin introducir una familia de comportamiento independiente que exija una identidad adicional en el registro.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 41. Criterios de aceptación

1. se distinguen fuente de verdad, evento, lectura, copia analítica, snapshot y reporte;
2. se distinguen evento empresarial, comando, webhook técnico, notificación, log y auditoría;
3. se preservan exactamente cuatro mecanismos de entrada;
4. webhook y polling no crean mecanismos adicionales;
5. se adopta el catálogo de 395 eventos sin duplicarlo;
6. se preservan los 69 procesos cubiertos;
7. se preservan las 8 familias condicionales;
8. cada evento conserva una productora empresarial única;
9. una fuente externa no figura como `producer_application` interna;
10. se adoptan las 2.020 relaciones consumidoras sin crear una audiencia paralela;
11. se preservan los 10 perfiles de proyección;
12. SHELL conserva cero procesos y eventos empresariales propios de los 69 procesos;
13. AURA permanece diferida y no recibe runtime por esta tarea;
14. se preserva `EVENT-ENVELOPE-001` como sobre común;
15. el contrato analítico puede minimizar campos sin perder identidad/version/procedencia material;
16. se conserva transporte `AT_LEAST_ONCE`;
17. el efecto empresarial no se duplica por redelivery;
18. no se impone orden global entre procesos;
19. mismo identificador y mismo contenido no crean otro hecho;
20. reutilización conflictiva de identidad no se resuelve por sobrescritura;
21. se definen 32 componentes de lectura gobernada;
22. una lectura no produce efectos empresariales de escritura;
23. autorización se resuelve antes de población, proyección, filtros y paginación;
24. el territorio no se deriva de filtros enviados por el consumidor;
25. la lectura histórica reevalúa autorización vigente;
26. bootstrap y deltas no dejan ventana ciega sin tratamiento;
27. el stream no se usa como historia completa si su retención no está demostrada;
28. reconciliación compara evento y estado propietario sin corregir la fuente desde analítica;
29. una lectura paginada conserva corte y orden estable o declara su limitación;
30. páginas no pueden duplicar u omitir elementos silenciosamente por mutación concurrente;
31. tiempo del hecho y tiempo de recepción permanecen distintos;
32. el corte no sustituye el tiempo del hecho;
33. cambios de esquema incompatibles requieren transición explícita;
34. la compatibilidad de esquema no se interpreta como certificación DQ;
35. se materializan las 10 aplicaciones actuales;
36. las 10 aplicaciones tienen decisión de eventos y lectura;
37. se preserva la distribución de 69 procesos y `shell = 0`;
38. no se inventa una productora alternativa ante indisponibilidad;
39. se materializan las 15 familias de DATA-DOM-006;
40. se preserva la distribución 13 `ESPECIFICADO`, 1 `BLOQUEADO`, 1 `NO_APLICA`;
41. se materializan 62 objetos maestros/referencia;
42. los 62 objetos aparecen una sola vez;
43. se preservan 43 maestros y 19 referencias;
44. se preservan 59 objetos `ESPECIFICADO` y 3 `BLOQUEADO`;
45. los tres bloqueados siguen siendo los objetos AURA aprobados;
46. ningún maestro se fusiona por texto, nombre o etiqueta;
47. una proyección analítica no se edita como maestro;
48. se preservan las cuatro fuentes observadas de asistencia;
49. `attendance-report` permanece consumidor/proyector;
50. se materializan las 14 métricas de asistencia;
51. se preservan 11 `NO EVALUADO` y 3 `BLOQUEADO`;
52. las tres métricas bloqueadas permanecen exactamente `missingCloseCount`, `attendanceRate` y `punctualityRate`;
53. transportar una métrica no eleva su estado DQ;
54. no se usa un agregado como fuente de sus hechos;
55. Makos/POS conserva como entrada acreditada únicamente la exportación controlada/manual;
56. no se inventa API del POS;
57. no se inventa webhook del POS;
58. no se inventa ventana histórica del POS;
59. una línea externa sin mapping no genera efectos internos silenciosos;
60. el proveedor externo no escribe directamente en tablas internas;
61. un sistema externo referido canónicamente no se declara activo sin inventario/evidencia;
62. `INT-EXT-001` conserva la propiedad del inventario de integraciones externas;
63. toda fuente externa futura debe superar el gate de 24 elementos;
64. credencial técnica y permiso empresarial permanecen distintos;
65. secretos no forman parte del payload analítico;
66. datos tardíos conservan el tiempo del hecho;
67. backfill no inventa historia;
68. snapshot publicado no se desagrega para inventar hechos;
69. una fuente actual sin historia no produce historia por inferencia;
70. una diferencia evento/lectura conserva evidencia y propietario;
71. no existe escritura cruzada desde analítica;
72. un evento consumido solo puede producir un efecto propio autorizado en la consumidora;
73. una exportación no se reingresa como mutación implícita;
74. `service_role` no sustituye un contrato empresarial;
75. linaje puede recorrer resultado, transformación, entrada, corte, contrato y fuente;
76. linaje externo conserva original, validación, identidad externa y aceptación/cuarentena;
77. linaje no concede acceso al detalle;
78. fallos parciales permanecen visibles;
79. procesado no equivale a reconciliado;
80. reconciliado no equivale a certificado;
81. cobertura desconocida no se transforma en porcentaje inventado;
82. AURA no recibe una fuente sustituta;
83. DATA-INT-001 no implementa capa semántica ni modelos físicos;
84. las 55 familias analíticas continúan bajo definición de dominio y materialización posterior de DATA-INT-002;
85. crosswalks físicos permanecen en DATA-INT-003;
86. BI, hojas, modelos externos e IA permanecen en DATA-INT-004;
87. credenciales y estrategia técnica de terceros permanecen en INT-EXT;
88. la transición física del POS permanece en INT-POS;
89. no se ejecuta código, DDL, DML, migración, backfill, replay, importación, publicación ni cambio de datos;
90. no se crea ni modifica ningún requisito de prueba;
91. no se modifica `active-sequence.json` por este artefacto;
92. `DATA-INT-002` permanece únicamente reservada.

---

#### 42. Balance de cierre

| Control                                                                   |                                            Resultado |
| ------------------------------------------------------------------------- | ---------------------------------------------------: |
| Aplicaciones Vento OS cubiertas                                           |                                          **10 / 10** |
| Procesos empresariales preservados                                        |                                          **69 / 69** |
| Procesos empresariales de SHELL                                           |                                                **0** |
| Definiciones normales de evento adoptadas                                 |                                        **395 / 395** |
| Familias condicionales de evento preservadas                              |                                            **8 / 8** |
| Relaciones consumidoras adoptadas                                         |                                    **2.020 / 2.020** |
| Perfiles de proyección preservados                                        |                                          **10 / 10** |
| Mecanismos de entrada                                                     |                                            **4 / 4** |
| Componentes de lectura gobernada                                          |                                          **32 / 32** |
| Familias de fuente/hecho                                                  |                                          **15 / 15** |
| Distribución de familias                                                  |      **13 ESPECIFICADO / 1 BLOQUEADO / 1 NO_APLICA** |
| Objetos maestros/referencia                                               |                                          **62 / 62** |
| Distribución de objetos                                                   |                    **59 ESPECIFICADO / 3 BLOQUEADO** |
| Maestros / referencias                                                    |                                          **43 / 19** |
| Fuentes observadas de asistencia                                          |                                            **4 / 4** |
| Métricas de asistencia                                                    |                                          **14 / 14** |
| Estado asistencia                                                         |                     **11 NO EVALUADO / 3 BLOQUEADO** |
| Fuentes externas con mecanismo DATA actualmente evidenciado en esta tarea |  **1 — Makos/POS por exportación controlada/manual** |
| Inventario completo de integraciones externas activas                     | **PENDIENTE_DE_EVIDENCIA — propietario INT-EXT-001** |
| API/webhook del POS inventados                                            |                                                **0** |
| Escrituras cruzadas autorizadas                                           |                                                **0** |
| Fuentes de verdad transferidas a analítica                                |                                                **0** |
| Cambios físicos                                                           |                                                **0** |
| Requisitos de prueba creados o modificados                                |                                                **0** |

---

#### 43. Continuidad

ÚLTIMA TAREA APROBADA
`DATA-UX-008 — Validar comprensión, tiempos y decisiones con usuarios reales`

TAREA ACTUAL APROBADA
`DATA-INT-001 — Definir contratos de eventos y lectura con todas las aplicaciones y fuentes externas`

SIGUIENTE TAREA RESERVADA
`DATA-INT-002 — Definir capa semántica, modelos analíticos, snapshots, caché, consultas y rendimiento`


### [ ] DATA-INT-002 — Definir capa semántica, modelos analíticos, snapshots, caché, consultas y rendimiento
### [ ] DATA-INT-003 — Definir crosswalks, claves externas, identidad y reconciliación de datos maestros
### [ ] DATA-INT-004 — Definir integración controlada con BI, hojas de cálculo, modelos analíticos e inteligencia artificial
