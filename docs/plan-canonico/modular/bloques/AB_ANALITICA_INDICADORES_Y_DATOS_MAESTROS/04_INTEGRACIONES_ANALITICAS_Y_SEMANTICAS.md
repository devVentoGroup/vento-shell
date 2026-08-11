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


### ✅ DATA-INT-002 — Definir capa semántica, modelos analíticos, snapshots, caché, consultas y rendimiento

**Estado:** APROBADA
**Tarea anterior:** `DATA-INT-001 — Definir contratos de eventos y lectura con todas las aplicaciones y fuentes externas` — APROBADA
**Tarea siguiente:** `DATA-INT-003 — Definir crosswalks, claves externas, identidad y reconciliación de datos maestros` — RESERVADA
**Tipo de tarea:** documental; diseño canónico y materializado de capa semántica, modelos analíticos, snapshots, caché, contratos de consulta y gobierno de rendimiento
**Bloque:** AB — Analítica, indicadores y datos maestros
**Fase:** exclusivamente documental dentro de `CONDITIONAL_DESIGN_ARTIFACTS`
**Implementación técnica:** no autorizada
**Código, DDL, DML, vistas físicas, vistas materializadas físicas, migraciones, funciones, RPC, índices, cachés productivos, jobs, snapshots físicos, backfills, despliegues o cambios en Supabase:** no autorizados
**Requisitos de prueba creados o modificados:** 0

#### 1. Propósito

Definir la capa semántica y el modelo lógico mediante los cuales Vento OS deberá convertir fuentes empresariales gobernadas, eventos canónicos y lecturas autorizadas en resultados analíticos consistentes, reproducibles y eficientes, sin duplicar autoridad, sin permitir fórmulas locales, sin convertir un modelo, caché o snapshot en fuente de verdad y sin perder versión, corte, calidad, autorización o historia.

La tarea debe permitir responder de forma determinista:

```text
qué fuente y contrato originan el resultado
qué hechos y maestros intervienen
qué grano gobierna cada cálculo
qué versión semántica de cada métrica se utiliza
qué versiones de dimensiones y reglas aplican al hecho
qué población queda autorizada antes del cálculo
qué periodo, calendario, zona horaria y corte se utilizan
qué estado de calidad y cobertura condiciona el resultado
qué consulta lógica puede resolver la pregunta
si el resultado puede reutilizar caché o requiere recálculo
si existe snapshot y qué tipo de snapshot es
qué eventos o correcciones invalidan una materialización derivada
qué evidencia permite reconstruir el resultado
cómo se mide rendimiento sin inventar un objetivo universal
cómo se preservan historia, reconstrucción y restatement
qué propietario debe resolver una identidad externa no reconciliada
```

La aprobación documental de esta tarea define el contrato objetivo. No afirma que exista ya una capa semántica física común, modelos compartidos, vistas materializadas, caché distribuido, índices analíticos, snapshots productivos o presupuestos de latencia validados.

#### 2. Resultado sustantivo

Queda materializado el diseño de `DATA-INT-002` con los siguientes resultados:

1. una arquitectura lógica única desde fuentes gobernadas hasta consumo analítico;
2. separación estricta entre fuente, hecho, dimensión, modelo lógico, métrica, consulta, caché, snapshot, publicación y restatement;
3. contrato mínimo de modelo semántico con treinta y seis coordenadas resolubles;
4. ocho arquetipos lógicos de modelado, sin imponer todavía una forma física de tablas o vistas;
5. matriz explícita para las quince familias de hechos, eventos y representaciones heredadas;
6. matriz explícita para los sesenta y dos objetos maestros y de referencia heredados;
7. preservación de cincuenta y nueve objetos `ESPECIFICADO` y tres objetos AURA `BLOQUEADO`;
8. matriz explícita para las cincuenta y cinco familias analíticas, conservando la distribución `11 + 12 + 10 + 12 + 10`;
9. contrato de ejecución de métricas que prohíbe fórmulas locales y exige versión semántica;
10. decisión explícita para las catorce métricas reales de asistencia, conservando once `NO EVALUADO` y tres `BLOQUEADO`;
11. separación de cinco clases de resultado temporal: vista viva, estado AS OF corte, snapshot analítico, publicación oficial y reconstrucción/restatement;
12. contrato de caché seguro por coordenada analítica, sin TTL universal inventado;
13. catálogo lógico de causas de invalidez de caché y snapshots derivados;
14. contrato de consulta con autorización previa al agregado, dimensiones/filtros gobernados, corte y evidencia;
15. seis perfiles de consulta para resumen, comparación, detalle autorizado, calidad, historia y publicación;
16. reglas de paginación, orden, cardinalidad y protección contra fan-out sin inventar una implementación física;
17. contrato de rendimiento medible con percentiles, cardinalidad, escaneo, concurrencia, staleness, hit/miss, reconstrucción, cancelación y costo, sin objetivos numéricos arbitrarios;
18. reglas de consistencia entre evento incremental y lectura gobernada para bootstrap, reparación y reconciliación;
19. propagación explícita de calidad, autorización, versiones, datos tardíos y correcciones hacia modelos, caché, snapshots y artefactos;
20. reglas de reproducibilidad e historia compatibles con correcciones, reconstrucciones y restatements;
21. decisión por las diez aplicaciones Vento sobre su papel como propietaria o consumidora de la capa;
22. cero fuentes de verdad transferidas a analítica;
23. cero fórmulas nuevas inventadas;
24. cero cambios físicos y cero cambios de requisitos de prueba.

#### 3. Entradas canónicas consumidas

La tarea consume y no redefine:

- `DATA-INT-001` para emisores, consumidoras, 395 definiciones normales, 2.020 relaciones consumidoras, eventos, lecturas gobernadas, cuatro mecanismos de entrada, quince familias, sesenta y dos objetos y contratos externos;
- `DATA-DOM-001` a `DATA-DOM-003` para propiedad, fuentes lógicas, identidades, atributos, vigencias, maestros, referencias y dimensiones;
- `DATA-DOM-004` para registro canónico de métricas, `metric_key`, versión semántica, fórmula, numerador, denominador, grano, dimensiones, filtros, inclusiones, exclusiones, unidad, moneda, calendario, zona horaria, calidad y comparación;
- `DATA-DOM-005` para hechos, eventos, tiempo del hecho, fecha empresarial, corte, granularidad, dimensiones históricas, snapshots y comparabilidad;
- `DATA-DOM-006` para contratos de entrada, transformación determinista, datos tardíos, replay, backfill, corrección, reconstrucción, reconciliación y linaje;
- `DATA-DOM-007` para calidad, cobertura, frescura, reconciliación, evidencia y estados de certificación;
- `DATA-DOM-008` para tablero, reporte, exportación, suscripción, alerta y snapshot oficial como artefactos distintos;
- `DATA-DOM-009` a `DATA-DOM-013` para las cincuenta y cinco familias analíticas;
- `DATA-DOM-014` a `DATA-DOM-016` para diagnóstico, objetivos, intervenciones, experimentos y comprobación;
- `DATA-DOM-017` para ejes de versión, historia, reconstrucción, restatement y reproducibilidad;
- `DATA-AUTH-001` a `DATA-AUTH-004` para construir el conjunto autorizado, proteger detalle sensible, separar capacidades y auditar el uso analítico;
- `DATA-UX-001` a `DATA-UX-008` como contrato de consumo, decisión, artefactos y validación de experiencia;
- el bloque de integraciones empresariales para catálogo de eventos, productoras, consumidoras, idempotencia, reintentos, reconciliación y prohibición de escrituras cruzadas;
- la arquitectura Supabase posterior únicamente como propietaria futura de materialización física cuando la continuidad habilite implementación.

La tarea no redefine eventos, productoras, consumidoras, fuentes de verdad, identidades externas, permisos, métricas, fórmulas, estados DQ ni artefactos de publicación.

#### 4. Decisión principal

Vento OS adopta una **capa semántica federada, versionada, autorizada y reproducible**.

```text
FUENTES EMPRESARIALES PROPIETARIAS
+ EVENTOS CANÓNICOS
+ LECTURAS GOBERNADAS
        ↓
HECHOS / ESTADOS / MAESTROS EVIDENCIADOS
        ↓
VALIDACIÓN + RECONCILIACIÓN + CALIDAD
        ↓
MODELO LÓGICO ANALÍTICO
        ↓
MÉTRICA CANÓNICA VERSIONADA
        ↓
CONJUNTO AUTORIZADO
        ↓
CONSULTA SEMÁNTICA
        ↓
RESULTADO REPRODUCIBLE
        ├── RESPUESTA VIVA
        ├── CACHÉ DERIVADO
        ├── SNAPSHOT ANALÍTICO
        └── ARTEFACTO/PUBLICACIÓN GOBERNADA
```

Regla cardinal:

```text
MISMAS FUENTES EVIDENCIADAS
+ MISMAS VERSIONES
+ MISMO CONJUNTO AUTORIZADO
+ MISMO CONTEXTO
+ MISMO CORTE
+ MISMAS REGLAS
=
MISMO RESULTADO LÓGICO
```

La optimización puede cambiar la forma de ejecución, pero no puede cambiar el resultado empresarial para una misma coordenada.

#### 5. Fronteras conceptuales obligatorias

```text
FUENTE DE VERDAD ≠ MODELO ANALÍTICO ≠ MÉTRICA ≠ CONSULTA ≠ CACHÉ ≠ SNAPSHOT ≠ REPORTE
```

```text
EVENTO ≠ ESTADO COMPLETO ≠ LECTURA DE RECONCILIACIÓN
```

```text
HECHO ≠ DIMENSIÓN ≠ AGREGADO
```

```text
VISTA VIVA ≠ ESTADO AS OF CORTE ≠ SNAPSHOT ANALÍTICO ≠ SNAPSHOT OFICIAL ≠ RESTATEMENT
```

```text
CACHÉ ≠ FUENTE ≠ CERTIFICACIÓN ≠ AUTORIZACIÓN
```

```text
FÓRMULA CANÓNICA ≠ EXPRESIÓN LOCAL DE PANTALLA
```

```text
VERSIÓN SEMÁNTICA ≠ VERSIÓN DE TRANSFORMACIÓN ≠ VERSIÓN TÉCNICA ≠ EDICIÓN DE PUBLICACIÓN
```

```text
FILTRO ≠ AUTORIZACIÓN
```

```text
CONJUNTO AUTORIZADO → AGREGACIÓN
NO
AGREGACIÓN AMPLIA → OCULTAMIENTO EN CLIENTE
```

```text
CERO ≠ NULO ≠ NO_APLICA ≠ DESCONOCIDO ≠ NO_RECIBIDO ≠ PENDIENTE ≠ DENOMINADOR_NO_DISPONIBLE
```

```text
REINTENTO ≠ REPLAY ≠ BACKFILL ≠ CORRECCIÓN ≠ RECONSTRUCCIÓN ≠ RESTATEMENT
```

```text
RENDIMIENTO MEJORADO ≠ SEMÁNTICA MODIFICADA
```

#### 6. Arquitectura lógica de la capa

La capa se divide conceptualmente en ocho responsabilidades, sin imponer componentes físicos:

1. **Resolución de fuente y contrato:** identifica autoridad, mecanismo de entrada, versión y corte.
2. **Hechos y estados evidenciados:** preserva grano, identidad, tiempos y evidencia original necesaria.
3. **Dimensiones históricas:** resuelve identidad y vigencia aplicables al hecho, no el maestro actual por conveniencia.
4. **Transformación semántica:** aplica reglas deterministas y versionadas sin modificar el original.
5. **Registro de métricas:** aporta definición, versión, agregación, numerador, denominador, unidad y comparabilidad.
6. **Autorización de conjunto:** determina la población y campos permitidos antes del cálculo.
7. **Ejecución y reutilización:** resuelve consulta, caché, snapshot o reconstrucción conservando la coordenada completa.
8. **Evidencia y publicación:** conserva calidad, linaje, reproducibilidad, edición e historia sin convertir el derivado en autoridad.

Ninguna responsabilidad autoriza escritura sobre el dominio propietario.

#### 7. Coordenada mínima de un modelo semántico — 36/36

Todo modelo lógico compartido deberá poder resolver, cuando aplique:

1. propósito empresarial;
2. propietario funcional del resultado;
3. familia de fuente;
4. aplicación o sistema propietario;
5. contrato de entrada y versión;
6. mecanismo de entrada;
7. rol de fuente;
8. identidad del hecho o estado;
9. granularidad;
10. tiempos del hecho, recepción, procesamiento y corrección relevantes;
11. fecha empresarial;
12. periodo;
13. corte;
14. zona horaria;
15. calendario;
16. población;
17. inclusiones y exclusiones;
18. dimensiones permitidas;
19. vigencias de dimensiones;
20. claves canónicas y relaciones;
21. crosswalk requerido cuando exista identidad externa;
22. métricas y versiones semánticas;
23. regla de agregación;
24. numerador y denominador cuando aplique;
25. unidad;
26. moneda y conversión cuando aplique;
27. precisión/redondeo semántico;
28. tratamiento de cero, ausencia y denominador no disponible;
29. datos tardíos, backfills y correcciones;
30. calidad, cobertura y reconciliación;
31. finalidad y restricciones de autorización;
32. linaje y versiones de transformación;
33. política de consulta y cardinalidad;
34. elegibilidad de caché/snapshot;
35. regla de invalidez/reconstrucción;
36. evidencia de reproducibilidad e historia.

**Reconciliación:** 36 componentes esperados; 36 materializados; 0 faltantes; 0 duplicados.

#### 8. Ocho arquetipos lógicos de modelado

Los siguientes arquetipos describen comportamiento semántico, no nombres de tablas ni obligación de adoptar un esquema estrella específico.

| Arquetipo lógico                    | Uso                                             | Grano dominante                            | Regla esencial                                                       |
| ----------------------------------- | ----------------------------------------------- | ------------------------------------------ | -------------------------------------------------------------------- |
| hecho atómico de evento/transacción | ventas, movimientos, decisiones, eventos        | una ocurrencia empresarial durable         | inmutable o corregible mediante contrato; no reemplazar por agregado |
| intervalo o sesión                  | asistencia, fases, tiempos de ciclo             | una sesión/intervalo relacionado con hitos | inicio/fin reales y estados abiertos al corte permanecen explícitos  |
| ledger de movimientos               | inventario, puntos, caja, obligaciones          | un movimiento o aplicación                 | saldo/estado se deriva; nunca sustituye el ledger                    |
| caso o ciclo de vida                | reclamos, tickets, compras, pedidos             | expediente/objeto con eventos              | estados e interacciones conservan secuencia y evidencia              |
| estado AS OF corte                  | existencia, disponibilidad, saldos, abiertos    | entidad/recurso x corte                    | se deriva desde hechos válidos conocidos al corte                    |
| plan o regla versionada             | receta, oferta, presupuesto, forecast, programa | coordenada x versión x vigencia            | hechos históricos usan la versión aplicable, no la actual            |
| escenario o simulación              | simulaciones, hipótesis, proyecciones           | escenario x versión x alcance              | nunca se presenta como hecho observado                               |
| resultado analítico/publicado       | métrica, dashboard, reporte, snapshot           | coordenada analítica x corte/edición       | derivado reproducible; nunca fuente editable de los hechos           |

Una familia puede combinar más de un arquetipo, pero deberá declarar cuál gobierna cada cálculo material.

#### 9. Contrato de hechos, dimensiones y joins

1. todo cálculo inicia desde hechos o estados con grano explícito;
2. una dimensión se une por identidad canónica o relación gobernada, nunca por etiqueta visible;
3. una identidad externa sin correspondencia demostrada permanece sin resolver hasta `DATA-INT-003`;
4. un hecho histórico resuelve la dimensión vigente al tiempo del hecho o corte aplicable;
5. no se aplica el maestro actual al pasado por conveniencia;
6. cada relación deberá declarar cardinalidad esperada antes de agregación;
7. una relación uno-a-muchos que pueda multiplicar hechos deberá preagregarse o resolverse con una regla semántica que evite fan-out;
8. un many-to-many requiere puente/relación gobernada y no se resuelve mediante producto cartesiano accidental;
9. las relaciones opcionales conservan ausencia explícita;
10. una dimensión desconocida no se rellena con un miembro genérico si eso altera significado;
11. las filas rechazadas o en cuarentena no se reincorporan por conveniencia del modelo;
12. una dimensión sensible no se materializa en detalle si la finalidad no lo autoriza.

#### 10. Decisión por aplicación — 10/10

| Aplicación | Procesos propietarios | Aporte canónico                                                  | Decisión de capa semántica                                                                                                               | Estado       |
| ---------- | --------------------- | ---------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- | ------------ |
| ANIMA      | 1                     | asistencia y marcación                                           | consume contexto laboral gobernado; produce hechos de asistencia; modelos derivados no alteran programación ni hechos originales         | ESPECIFICADO |
| VISO       | 20                    | organización, personas, gobierno y supervisión                   | expone maestros y hechos de sus procesos mediante contratos gobernados; semántica analítica conserva propiedad por dominio               | ESPECIFICADO |
| NEXO       | 16                    | producto, inventario, ubicaciones, activos y logística           | alimenta modelos de movimientos, existencias al corte, capacidad y abastecimiento sin convertir existencias derivadas en ledger editable | ESPECIFICADO |
| FOGO       | 6                     | recetas, producción, lotes, consumos y calidad                   | alimenta hechos productivos versionados; receta, lote, recurso y resultado conservan sus identidades y vigencias                         | ESPECIFICADO |
| ORIGO      | 4                     | compras, proveedores, órdenes y recepción comercial              | alimenta contratación y compra preservando proveedor, condición, orden, recepción y devolución como objetos distintos                    | ESPECIFICADO |
| PULSO      | 12                    | oferta, pedido, venta, pago, caja, devolución y entrega          | alimenta hechos comerciales separados; venta, pago, caja y entrega no se colapsan en un único hecho analítico                            | ESPECIFICADO |
| NUMERA     | 7                     | obligaciones, presupuesto, conciliación, costos y rentabilidad   | alimenta modelos económicos preservando moneda, reconocimiento, aplicación, periodo y conciliación                                       | ESPECIFICADO |
| AURA       | 2                     | campañas, contenido, audiencias, oportunidades y reputación      | el contrato lógico puede describirse, pero no se habilita materialización operativa mientras la fuente siga diferida                     | BLOQUEADO    |
| PASS       | 1                     | cliente, fidelización y autoservicio                             | alimenta identidad cliente autorizada, ledger de fidelización, preferencias y relaciones sin ampliar finalidad                           | ESPECIFICADO |
| SHELL      | 0                     | identidad técnica, catálogo de aplicaciones y acceso transversal | no aporta hechos empresariales propietarios; sus referencias técnicas se consumen solo cuando el contrato analítico las necesita         | ESPECIFICADO |

**Reconciliación:** 10 aplicaciones esperadas; 10 materializadas; 69 procesos propietarios reconciliados; `SHELL = 0`; 0 aplicaciones omitidas; 0 fuentes de verdad transferidas.

#### 11. Matriz de las quince familias de hechos y representaciones — 15/15

| Familia heredada                                                         | Arquetipo dominante                               | Grano/clave semántica                                 | Decisión DATA-INT-002                                                                                                          | Entrada/reparación                                              | Estado       |
| ------------------------------------------------------------------------ | ------------------------------------------------- | ----------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------- | ------------ |
| SHIFT, ATTENDANCE_EVENT, ATTENDANCE_CORRECTION                           | hecho/intervalo laboral                           | trabajador x turno y eventos/sesiones relacionados    | modelo por turno con hechos de sesión y corrección separados; estado AS OF corte para abiertos/no-show                         | eventos + lectura gobernada                                     | ESPECIFICADO |
| CONSENT_RECORD, CONTACT_VERIFICATION                                     | hecho de consentimiento/verificación              | persona/contacto x finalidad x versión/vigencia       | hechos versionados con finalidad, fuente y vigencia; no inferir consentimiento desde relación o contacto                       | evento/lectura según propietario                                | ESPECIFICADO |
| LOYALTY_LEDGER_ENTRY, redención, ajuste de puntos                        | ledger/movimiento                                 | movimiento de cuenta de fidelización                  | modelo de movimientos inmutables; saldo y estado se derivan al corte y nunca sustituyen el ledger                              | eventos + lectura de reconciliación                             | ESPECIFICADO |
| solicitud, caso, cotización, orden, recepción, devolución de compra      | ciclo de compra                                   | objeto y línea en su identidad propia                 | modelo de ciclo con cabeceras/líneas y cambios de estado; no colapsar orden, recepción y devolución                            | eventos + lectura de estado                                     | ESPECIFICADO |
| lote, LPN, existencia, movimiento, conteo, ajuste                        | ledger físico + estado al corte                   | movimiento/conteo por producto-lote-ubicación         | movimientos y conteos son hechos; existencia es proyección AS OF corte reconciliable                                           | eventos + lectura de bootstrap/reparación                       | ESPECIFICADO |
| orden, lote, ejecución, consumo, merma y resultado productivo            | hecho productivo                                  | orden/lote/ejecución y consumos asociados             | modelo de ejecución con versión de receta, recursos, consumos, mermas y resultados; no fabricar balance faltante               | eventos + lectura de reconciliación                             | ESPECIFICADO |
| pedido, comanda, venta, pago, caja, devolución, entrega                  | hecho comercial compuesto por contratos separados | objeto comercial o movimiento en su grano propietario | modelo coordinado por correlación, no por fusión; cada efecto conserva identidad, moneda, estado y tiempo                      | eventos + lectura gobernada                                     | ESPECIFICADO |
| precio de venta, descuento, promoción vigente                            | regla/versionado aplicado                         | oferta/regla x contexto x vigencia                    | modelo de reglas con versión efectiva y snapshot de condición aplicada al hecho; no aplicar regla actual retroactivamente      | lectura versionada + eventos de cambio cuando existan           | ESPECIFICADO |
| SERVICE_CASE, reclamo, reserva, compensación, satisfacción, comunicación | caso/interacción                                  | expediente o interacción individual                   | modelo de ciclo de caso con interacciones y decisiones separadas; satisfacción y compensación no reemplazan el expediente      | eventos + lectura de estado                                     | ESPECIFICADO |
| hecho económico, obligación, pago, aplicación, conciliación              | ledger económico                                  | hecho/movimiento/aplicación por moneda y contraparte  | modelo económico que separa reconocimiento, obligación, pago, aplicación y conciliación; saldos son derivados                  | eventos + lectura gobernada                                     | ESPECIFICADO |
| presupuesto, forecast, escenario                                         | plan/versionado                                   | coordenada de plan x periodo x versión x alcance      | modelo versionado no factual; real, presupuesto, forecast y escenario permanecen contextos distintos                           | lectura versionada; eventos de aprobación/cambio cuando existan | ESPECIFICADO |
| campaña, pieza publicada, oportunidad, interacción, publicación          | hecho de marketing objetivo                       | identidad AURA futura x evento/versión                | contrato lógico reservado; no se materializa ni rellena desde listas paralelas o fuentes no confirmadas                        | sin consumo operativo hasta habilitación canónica               | BLOQUEADO    |
| ticket, incidente, problema, cambio tecnológico                          | caso técnico                                      | expediente TI x evento/estado                         | modelo de ciclo de servicio técnico con causa, cambio y evidencia separados; no confundir logs con hechos empresariales        | eventos + lectura de estado                                     | ESPECIFICADO |
| PRINTER como clase de configuración, ASSET como clase de configuración   | referencia técnica, no hecho autónomo             | no aplica como familia factual independiente          | consumir las identidades y hechos de sus dominios propietarios; no crear fact table conceptual solo por clase de configuración | referencias gobernadas cuando correspondan                      | NO_APLICA    |
| métrica, KPI, dashboard, reporte, exportación, snapshot                  | derivado analítico/publicación                    | coordenada analítica versionada                       | resultado derivado desde hechos/maestros gobernados; nunca se reingiere como autoridad de los mismos hechos                    | consulta semántica + snapshot/publicación gobernados            | ESPECIFICADO |

**Reconciliación:** 15 esperadas; 15 materializadas; 13 `ESPECIFICADO`; 1 `BLOQUEADO`; 1 `NO_APLICA`; 0 faltantes; 0 duplicadas.

El bloqueo AURA no se elude mediante caché, snapshot, scraping, copia manual o reconstrucción desde otra aplicación. La clase PRINTER/ASSET no se promueve a hecho analítico autónomo.

#### 12. Matriz de los sesenta y dos objetos maestros y de referencia — 62/62

| #   | Objeto canónico             | Papel semántico                               | Decisión DATA-INT-002                                                                            | Estado       |
| --- | --------------------------- | --------------------------------------------- | ------------------------------------------------------------------------------------------------ | ------------ |
| 1   | ORGANIZATION_SCOPE          | dimensión organizacional histórica            | identidad y vigencia; base de alcance sin convertir selección en autorización                    | ESPECIFICADO |
| 2   | LEGAL_SUBJECT               | dimensión legal restringida                   | atributos por autoridad y vigencia; evidencia externa no sustituye decisión interna              | ESPECIFICADO |
| 3   | BRAND                       | dimensión comercial histórica                 | identidad estable y vigencia; etiqueta no prueba equivalencia                                    | ESPECIFICADO |
| 4   | COMMERCIAL_ESTABLISHMENT    | dimensión organizacional/externa reconciliada | identidad interna con evidencia externa por atributo y vigencia                                  | ESPECIFICADO |
| 5   | BUSINESS_LINE               | dimensión empresarial                         | identidad y vigencia; no inferir sede o titularidad desde etiqueta                               | ESPECIFICADO |
| 6   | PHYSICAL_FACILITY           | dimensión física con autoridad por atributo   | identidad organizacional y atributos físicos reconciliados sin fusionar conceptos                | ESPECIFICADO |
| 7   | OPERATIONAL_SITE            | dimensión territorial histórica               | vigencia por hecho; base para territorio real, no permiso por sí sola                            | ESPECIFICADO |
| 8   | ORGANIZATIONAL_AREA         | dimensión funcional histórica                 | vigencia por hecho; no sustituye zona física ni estación                                         | ESPECIFICADO |
| 9   | PHYSICAL_ZONE               | dimensión física                              | identidad y relación vigente con instalación/sede                                                | ESPECIFICADO |
| 10  | WORKSTATION                 | dimensión de estación                         | identidad de estación; separada de dispositivo y actor                                           | ESPECIFICADO |
| 11  | EXTERNAL_OPERATIONAL_POINT  | dimensión externa controlada                  | fuente, finalidad y vigencia; repetición no lo convierte en sede                                 | ESPECIFICADO |
| 12  | PERSON_IDENTITY             | dimensión personal restringida                | identidad empresarial protegida; correlaciones externas no fusionan automáticamente              | ESPECIFICADO |
| 13  | WORKER_PROFILE              | dimensión laboral restringida                 | perfil y vigencia laboral separados de identidad personal                                        | ESPECIFICADO |
| 14  | EMPLOYMENT_RELATIONSHIP     | dimensión laboral histórica                   | cada vínculo conserva vigencia; hechos se resuelven contra vínculo aplicable                     | ESPECIFICADO |
| 15  | CONTRACTUAL_POSITION        | dimensión de referencia laboral               | vigencia y versión; no deriva permisos                                                           | ESPECIFICADO |
| 16  | BASE_ROLE                   | referencia autorizativa                       | referencia SHELL; no sustituye función operativa ni permiso efectivo                             | ESPECIFICADO |
| 17  | OPERATIONAL_ROLE            | dimensión funcional                           | función y vigencia; correlacionada con autorización sin fusionar conceptos                       | ESPECIFICADO |
| 18  | WORK_ASSIGNMENT             | dimensión laboral histórica                   | asignación por sede/área/función con vigencia efectiva                                           | ESPECIFICADO |
| 19  | CUSTOMER_PERSON             | dimensión cliente restringida                 | identidad autorizada; contacto coincidente no prueba identidad                                   | ESPECIFICADO |
| 20  | CUSTOMER_CONTACT            | dimensión de contacto restringida             | tipo, verificación, fuente y vigencia; no es identidad suficiente                                | ESPECIFICADO |
| 21  | CUSTOMER_RELATIONSHIP       | dimensión de relación                         | marca/alcance y vigencia; no equivale a consentimiento                                           | ESPECIFICADO |
| 22  | CUSTOMER_PROFILE            | proyección autorizada                         | solo atributos gobernados para finalidad; no superficie de edición                               | ESPECIFICADO |
| 23  | CUSTOMER_PREFERENCE         | dimensión de preferencia restringida          | preferencia y vigencia; no infiere consentimiento de marketing                                   | ESPECIFICADO |
| 24  | LOYALTY_ACCOUNT             | dimensión de cuenta                           | identidad de cuenta; saldo permanece derivado del ledger                                         | ESPECIFICADO |
| 25  | LOYALTY_PROGRAM_RULE        | dimensión/regla versionada                    | versión efectiva al hecho y vigencia histórica                                                   | ESPECIFICADO |
| 26  | PRODUCTO_MAESTRO            | dimensión producto conformada                 | identidad maestra; cruces externos requieren crosswalk gobernado                                 | ESPECIFICADO |
| 27  | VARIANTE                    | dimensión producto                            | identidad diferenciada; no colapsar producto/presentación                                        | ESPECIFICADO |
| 28  | PRESENTACION                | dimensión de presentación                     | producto, cantidad, unidad, multiplicador y contexto preservados                                 | ESPECIFICADO |
| 29  | UNIDAD_DE_MEDIDA            | referencia de unidad                          | código/dimensión gobernados; conversión requiere contrato vigente                                | ESPECIFICADO |
| 30  | TAXONOMIA_TIPO_MAESTRO      | dimensión taxonómica histórica                | referencia y vigencia; no reclasificar hechos con etiqueta actual por defecto                    | ESPECIFICADO |
| 31  | TAXONOMIA_INVENTARIO        | dimensión taxonómica histórica                | referencia y vigencia; no sustituye identidad ni política física                                 | ESPECIFICADO |
| 32  | TAXONOMIA_OPERACIONAL       | dimensión taxonómica histórica                | referencia para segmentación; no altera clasificación comercial                                  | ESPECIFICADO |
| 33  | LOC                         | dimensión de ubicación histórica              | identidad y vigencia aplicables al movimiento/hecho                                              | ESPECIFICADO |
| 34  | ACTIVO_FISICO               | dimensión de activo                           | identidad, ubicación/condición y vigencia; no fusionar con endpoint/dispositivo                  | ESPECIFICADO |
| 35  | CLASE_DE_ACTIVO             | referencia de activo                          | clasificación gobernada; no infiere identidad o mantenimiento                                    | ESPECIFICADO |
| 36  | ESPECIFICACION_PRODUCTO     | dimensión/regla versionada                    | versión y vigencia por autoridad de atributo; hechos históricos conservan versión aplicable      | ESPECIFICADO |
| 37  | PROVEEDOR                   | dimensión de contraparte                      | identidad de proveedor; evidencia externa se conserva para conciliación                          | ESPECIFICADO |
| 38  | CONTACTO_PROVEEDOR          | dimensión de contacto restringida             | separado de proveedor; coincidencia no fusiona proveedores                                       | ESPECIFICADO |
| 39  | RELACION_PRODUCTO_PROVEEDOR | dimensión relacional histórica                | relación y vigencia; no equivale a precio/contrato/oferta vigente                                | ESPECIFICADO |
| 40  | CONDICION_COMERCIAL         | regla comercial versionada                    | versión/vigencia; hechos conservan condición aplicada                                            | ESPECIFICADO |
| 41  | TAXONOMIA_COMPRA            | dimensión taxonómica histórica                | referencia gobernada; separada de taxonomías de producto/inventario/costo                        | ESPECIFICADO |
| 42  | RECETA                      | regla productiva versionada                   | identidad y versión publicada aplicable al hecho                                                 | ESPECIFICADO |
| 43  | FAMILIA_PRODUCTIVA          | dimensión productiva                          | identidad y vigencia; separada de categoría comercial/inventario                                 | ESPECIFICADO |
| 44  | RUTA_PRODUCTIVA             | regla/secuencia productiva versionada         | identidad reutilizable y versión; ejecución permanece hecho separado                             | ESPECIFICADO |
| 45  | RECURSO_PRODUCTIVO          | dimensión funcional de recurso                | recurso funcional correlacionado con activo sin fusionar identidades                             | ESPECIFICADO |
| 46  | COMMERCIAL_CHANNEL          | dimensión comercial                           | identidad de canal; cuentas externas se correlacionan, no crean canal por conveniencia           | ESPECIFICADO |
| 47  | CATEGORIA_COMERCIAL         | dimensión taxonómica histórica                | vigencia comercial; no cambia clasificación operativa o stock                                    | ESPECIFICADO |
| 48  | OFERTA_COMERCIAL            | regla/oferta versionada                       | configuración vendible y vigencia; el hecho conserva condición aplicada                          | ESPECIFICADO |
| 49  | CENTRO_DE_COSTO             | dimensión económica histórica                 | identidad y vigencia; no equivale a sede, área, marca o canal                                    | ESPECIFICADO |
| 50  | MONEDA                      | referencia monetaria                          | importe conserva moneda original; conversiones son derivados separados                           | ESPECIFICADO |
| 51  | PERIODO_ECONOMICO           | dimensión temporal económica                  | identidad y estado; separado de periodo contable/fiscal                                          | ESPECIFICADO |
| 52  | PERIODO_CONTABLE            | dimensión temporal contable                   | autoridad vigente y procedencia; no asumir equivalencia con periodo económico                    | ESPECIFICADO |
| 53  | PERIODO_FISCAL              | dimensión temporal fiscal                     | referencia interna reconciliada con autoridad externa cuando aplique                             | ESPECIFICADO |
| 54  | CLASIFICACION_ECONOMICA     | dimensión taxonómica histórica                | vigencia económica; no redefine hecho operativo                                                  | ESPECIFICADO |
| 55  | PERFIL_DE_MARCA             | dimensión AURA futura                         | no materializar desde fuentes paralelas mientras AURA siga inactiva                              | BLOQUEADO    |
| 56  | AUDIENCIA                   | dimensión AURA futura restringida             | requiere fuente AURA habilitada, finalidad y consentimiento; no construir desde listas paralelas | BLOQUEADO    |
| 57  | ACTIVO_DE_MARCA             | dimensión AURA futura                         | requiere fuente AURA habilitada y evidencia de derechos/vigencia                                 | BLOQUEADO    |
| 58  | ENDPOINT                    | dimensión técnica                             | identidad técnica administrada; separada de activo físico y dispositivo compartido               | ESPECIFICADO |
| 59  | SHARED_DEVICE               | dimensión técnica de dispositivo              | identidad lógica y vigencia; no infiere actor o endpoint                                         | ESPECIFICADO |
| 60  | NETWORK_RESOURCE            | dimensión técnica                             | identidad de recurso; IP/MAC/SSID aislados no determinan identidad                               | ESPECIFICADO |
| 61  | APPLICATION                 | dimensión técnica de aplicación               | app_code canónico; repositorio, URL, ambiente o proveedor no sustituyen identidad                | ESPECIFICADO |
| 62  | TECH_SERVICE                | dimensión técnica de servicio                 | identidad estable; cambios técnicos no renumeran el servicio                                     | ESPECIFICADO |

**Reconciliación:** 62 objetos esperados; 62 materializados; 62 identidades únicas; 59 `ESPECIFICADO`; 3 `BLOQUEADO`; 0 faltantes; 0 duplicados. Se preserva la distribución heredada de 43 datos maestros y 19 datos de referencia.

Reglas transversales:

- ninguna dimensión se convierte en copia editable;
- vigencia y jerarquía históricas se resuelven AS OF el hecho;
- una dimensión técnica no concede autoridad empresarial;
- una dimensión personal/cliente/proveedor conserva minimización y finalidad;
- los tres objetos AURA permanecen bloqueados hasta habilitación canónica de la fuente;
- crosswalks y claves externas pertenecen a `DATA-INT-003` y no se fabrican en esta tarea.

#### 13. Contrato de ejecución de métricas

Toda métrica servida por la capa deberá resolverse desde el registro canónico vigente. La ejecución recibe, como mínimo:

```text
metric_key
+ semantic_version
+ purpose
+ authorized_population
+ period
+ cut
+ timezone
+ calendar
+ dimensions
+ filters
+ unit_or_currency
+ source_versions
+ transformation_version
+ data_quality_state
=
REPRODUCIBLE_RESULT
```

Reglas:

1. una pantalla, reporte o consumidor no redefine fórmula;
2. una optimización física no cambia versión semántica si conserva exactamente el significado y resultado;
3. un cambio material de fórmula, numerador, denominador, población, grano, calendario, unidad, moneda, tratamiento de faltantes o fuente semántica exige la gobernanza de versión definida en D017;
4. conteos y sumas solo se agregan cuando grano, unidad, población y periodo lo permiten;
5. tasas se recomputan desde numerador y denominador compatibles; no se promedian porcentajes;
6. un estado AS OF no se suma entre cortes como si fueran movimientos;
7. un saldo no sustituye movimientos de ledger;
8. un escenario no se agrega al real;
9. una métrica `BLOQUEADO` conserva el bloqueo en modelos, consultas, caché y snapshots;
10. `NO EVALUADO` no se eleva a `CERTIFICADO` por estar precalculado;
11. resultados con versiones semánticas incompatibles se separan o usan una regla de puente explícita;
12. toda métrica debe conservar la posibilidad de descender hasta su evidencia autorizada.

#### 14. Las catorce métricas de asistencia — 14/14

| #   | metric_key          | Tipo semántico                                     | Grano                                      | Regla de capa                                                                                                | Estado heredado |
| --- | ------------------- | -------------------------------------------------- | ------------------------------------------ | ------------------------------------------------------------------------------------------------------------ | --------------- |
| 1   | `scheduledShifts`   | conteo de turnos programados elegibles             | trabajador x turno programado              | suma de conteos sobre población compatible; no deducir trabajo ejecutado                                     | NO EVALUADO     |
| 2   | `attendedShifts`    | conteo de turnos con asistencia elegible           | trabajador x turno programado              | suma de conteos; vinculación de sesión debe respetar identidad/ventana gobernada                             | NO EVALUADO     |
| 3   | `restDayCount`      | conteo de descansos programados                    | trabajador x turno/descanso programado     | suma de estados elegibles; descanso no es ausencia                                                           | NO EVALUADO     |
| 4   | `lateCount`         | conteo de tardanzas                                | trabajador x turno programado              | suma bajo regla de gracia/versionado aplicable                                                               | NO EVALUADO     |
| 5   | `noShowCount`       | conteo AS OF corte                                 | trabajador x turno programado              | solo turnos cuyo estado al corte satisface la definición canónica                                            | NO EVALUADO     |
| 6   | `openCount`         | conteo AS OF corte                                 | trabajador x sesión/turno relacionado      | sesiones abiertas al corte; no equivale a missing close                                                      | NO EVALUADO     |
| 7   | `missingCloseCount` | conteo AS OF corte condicionado por fin programado | trabajador x turno programado              | bloqueado hasta que la implementación preserve la condición canónica completa al corte                       | BLOQUEADO       |
| 8   | `autoCloseCount`    | conteo de autocierres                              | trabajador x sesión                        | suma de cierres identificados por semántica de origen; no inferir conducta laboral                           | NO EVALUADO     |
| 9   | `departureCount`    | conteo de salidas de sede elegibles                | trabajador x sesión/evento                 | agregación minimizada; detalle geográfico requiere finalidad y autorización                                  | NO EVALUADO     |
| 10  | `scheduledMinutes`  | suma de minutos programados netos                  | trabajador x turno programado              | suma solo en unidades/periodos compatibles                                                                   | NO EVALUADO     |
| 11  | `netMinutes`        | suma de minutos netos registrados                  | trabajador x sesión                        | suma después de descansos válidos; no equivale a productividad                                               | NO EVALUADO     |
| 12  | `incidentCount`     | conteo compuesto de incidencias                    | trabajador x turno/sesión                  | derivado compuesto; no concede acceso a señales subyacentes                                                  | NO EVALUADO     |
| 13  | `attendanceRate`    | tasa recomputada                                   | población compatible de turnos programados | recomputar numerador/denominador; nunca promediar tasas; sin valor numérico cuando denominador no disponible | BLOQUEADO       |
| 14  | `punctualityRate`   | tasa recomputada                                   | población compatible de turnos atendidos   | recomputar numerador/denominador; nunca promediar tasas; sin valor numérico cuando denominador no disponible | BLOQUEADO       |

**Reconciliación:** 14 métricas esperadas; 14 materializadas; 14 claves únicas; 11 `NO EVALUADO`; 3 `BLOQUEADO`; 0 faltantes; 0 duplicadas.

Las tres bloqueadas permanecen exactamente `missingCloseCount`, `attendanceRate` y `punctualityRate`.

La implementación observada de `attendance-report` sigue siendo evidencia técnica de una proyección existente, no de una capa semántica común ya implementada. Mientras los bloqueos permanezcan:

- un modelo no podrá corregir silenciosamente `missingCloseCount` sin que cambie la implementación propietaria y su evidencia;
- un modelo no podrá convertir el cero técnico de `attendanceRate` o `punctualityRate` con denominador ausente en dato oficial válido;
- un caché no podrá conservar como saludable un resultado que la definición canónica considera no evaluable;
- un snapshot que dependa materialmente de una de estas métricas heredará el bloqueo correspondiente.

#### 15. Matriz de las cincuenta y cinco familias analíticas — 55/55

Cada fila define el modelo lógico que la capa deberá poder servir. `ESPECIFICADO` significa que el contrato de modelado queda resuelto; no eleva la disponibilidad, calidad o certificación de las fuentes concretas.

| Dominio                     | Familia canónica                                        | Perfil lógico                    | Grano/condición                                           | Agregación y comparabilidad                                                                        | Snapshot/caché                                    | Estado de diseño |
| --------------------------- | ------------------------------------------------------- | -------------------------------- | --------------------------------------------------------- | -------------------------------------------------------------------------------------------------- | ------------------------------------------------- | ---------------- |
| Comercial                   | ventas netas y brutas                                   | flujo transaccional              | venta/línea elegible según definición                     | agregar hechos reconciliados; preservar bruta/neta, devoluciones, impuestos y moneda               | sí, por coordenada gobernada                      | ESPECIFICADO     |
| Comercial                   | pedidos y conversión                                    | ciclo + tasa derivada            | pedido/etapa elegible y población de oportunidad definida | conteos y tasas recomputadas; denominadores versionados                                            | sí, si la población/corte son reproducibles       | ESPECIFICADO     |
| Comercial                   | ticket y unidades                                       | flujo transaccional              | transacción elegible                                      | ticket se deriva de transacciones y denominador válido; unidades compatibles                       | sí, por corte                                     | ESPECIFICADO     |
| Comercial                   | mezcla por producto, categoría, canal y sede            | composición dimensional          | hecho comercial x dimensiones vigentes                    | participaciones recomputadas contra total compatible; dimensiones con vigencia                     | sí, respetando versión dimensional                | ESPECIFICADO     |
| Comercial                   | demanda por franja, día y temporada                     | serie temporal                   | hecho/solicitud elegible x tiempo empresarial             | comparación exige calendario, cobertura y estacionalidad compatibles                               | sí, por periodo/corte                             | ESPECIFICADO     |
| Comercial                   | disponibilidad perdida                                  | estado + demanda elegible        | necesidad/intención x disponibilidad histórica            | no derivar pérdida desde stock cero aislado; exige evidencia reconciliada                          | solo cuando dependencias sean evaluables          | ESPECIFICADO     |
| Comercial                   | cancelaciones, devoluciones y descuentos                | flujo de excepciones             | evento/objeto propietario                                 | cada fenómeno conserva identidad y denominador; no colapsar causas                                 | sí, por evento/corte                              | ESPECIFICADO     |
| Comercial                   | promociones y efecto incremental                        | intervención/experimento         | unidad elegible/expuesta según diseño                     | resultado observado separado de efecto atribuible; versión/exposición obligatorias                 | sí, si diseño y evidencia son reproducibles       | ESPECIFICADO     |
| Comercial                   | recurrencia y frecuencia                                | cohorte longitudinal             | cliente autorizado x ventana                              | identidad/finalidad/ventana gobernadas; ausencia no prueba abandono                                | sí, con autorización vigente                      | ESPECIFICADO     |
| Comercial                   | margen relacionado                                      | económico derivado               | venta/objeto con costo trazable                           | consume margen económico gobernado; no recalcular costo localmente                                 | sí, por versión económica                         | ESPECIFICADO     |
| Comercial                   | capacidad comercial no utilizada                        | estado/capacidad                 | unidad de capacidad x ventana                             | requiere denominador de capacidad compatible y demanda/uso elegibles                               | sí, si capacidad es reproducible                  | ESPECIFICADO     |
| Inventario y abastecimiento | existencia disponible y comprometida                    | ledger + estado AS OF            | producto/lote/ubicación x corte                           | derivar desde movimientos/estados; separar física, comprometida, cuarentena, tránsito y disponible | sí; preferible AS OF corte                        | ESPECIFICADO     |
| Inventario y abastecimiento | cobertura y días de inventario                          | estado + tasa de consumo/demanda | producto/ubicación x corte/ventana                        | requiere existencia elegible y tasa compatible; no dividir por tasa inválida                       | sí, si ambas bases son reproducibles              | ESPECIFICADO     |
| Inventario y abastecimiento | rotación y permanencia                                  | serie/cohorte de inventario      | producto/lote/ubicación x ventana                         | inventario medio e historia/cohorte compatibles                                                    | sí, por periodo y método                          | ESPECIFICADO     |
| Inventario y abastecimiento | faltantes y quiebres                                    | necesidad vs estado              | demanda/necesidad x disponibilidad                        | stock cero no prueba quiebre sin necesidad elegible                                                | sí, si necesidad y disponibilidad están alineadas | ESPECIFICADO     |
| Inventario y abastecimiento | vencimiento, daño y pérdida                             | flujo de excepción               | lote/activo/movimiento afectado                           | separar hecho, causa, cuarentena y disposición; no inferir causa                                   | sí, por eventos y corte                           | ESPECIFICADO     |
| Inventario y abastecimiento | diferencias de conteo                                   | reconciliación                   | conteo x producto/lote/ubicación                          | preservar signo, corte y antes/después del ajuste                                                  | sí, conservar edición de conciliación             | ESPECIFICADO     |
| Inventario y abastecimiento | cumplimiento de remisiones                              | ciclo logístico                  | remisión/línea x etapa                                    | preparación, despacho, recepción, faltante y cierre separados                                      | sí, por ciclo/versiones                           | ESPECIFICADO     |
| Inventario y abastecimiento | lead time y cumplimiento de proveedores                 | ciclo de compra                  | orden/recepción aceptada x proveedor                      | inicio contractual y promesa comparable obligatorios                                               | sí, por versión de condición                      | ESPECIFICADO     |
| Inventario y abastecimiento | compras urgentes                                        | clasificación de hecho           | solicitud/orden explícitamente clasificada                | solo hechos bajo definición gobernada de urgencia/emergencia                                       | sí, por corte                                     | ESPECIFICADO     |
| Inventario y abastecimiento | consumo versus plan                                     | plan vs real                     | producto/ingrediente/sede x ventana                       | plan y real de misma población, unidad y ventana                                                   | sí, preservando versión del plan                  | ESPECIFICADO     |
| Inventario y abastecimiento | costo de inventario                                     | económico derivado               | existencia/movimiento x método económico                  | consume valoración oficial y versión; no costo local alterno                                       | sí, por método/corte                              | ESPECIFICADO     |
| Inventario y abastecimiento | capacidad de almacenamiento                             | estado/capacidad                 | ubicación/recurso x corte                                 | capacidad utilizable y unidad física compatible                                                    | sí, si capacidad versionada                       | ESPECIFICADO     |
| Producción                  | demanda planificada versus producción                   | plan vs real                     | producto/lote/sede x ventana                              | necesidad/plan aceptado y producción elegible comparable                                           | sí, preservando plan y corte                      | ESPECIFICADO     |
| Producción                  | capacidad disponible y utilizada                        | estado/capacidad                 | recurso x ventana                                         | denominador integral de capacidad en unidad compatible                                             | sí, por ventana/corte                             | ESPECIFICADO     |
| Producción                  | adherencia al programa                                  | plan vs ejecución                | orden/recurso/hito x programa versionado                  | programa publicado y hitos reales; no comparar contra borrador                                     | sí, por versión de programa                       | ESPECIFICADO     |
| Producción                  | rendimiento teórico y real                              | plan/receta vs real              | lote/receta/escala                                        | receta, versión, escala y unidad compatibles                                                       | sí, preservando versión de receta                 | ESPECIFICADO     |
| Producción                  | consumo estándar y real                                 | estándar vs movimiento           | ingrediente/lote x receta/version                         | comparar ingrediente y unidad compatibles; sustituciones visibles                                  | sí, por versión estándar                          | ESPECIFICADO     |
| Producción                  | merma, reproceso y aprovechamiento                      | flujo de resultado/excepción     | lote/resultado x categoría                                | categorías y denominadores separados; diferencia de rendimiento no prueba merma                    | sí, por evento/corte                              | ESPECIFICADO     |
| Producción                  | calidad, retención y rechazo                            | ciclo de calidad                 | lote/control/decisión                                     | control, conformidad, retención, rechazo, reproceso y liberación separados                         | sí, con estado de calidad explícito               | ESPECIFICADO     |
| Producción                  | tiempo de ciclo                                         | intervalo/hitos                  | orden/lote/etapa                                          | requiere hitos reales; espera, pausa, retención y liberación no se colapsan                        | sí, por hito/versión                              | ESPECIFICADO     |
| Producción                  | cumplimiento de liberación                              | ciclo de calidad                 | lote x decisión de liberación                             | terminado no equivale a liberado                                                                   | sí, por estado/corte                              | ESPECIFICADO     |
| Producción                  | costo y variación por lote, producto y sede             | económico derivado               | lote/producto/sede x método económico                     | costo técnico no sustituye costo económico oficial                                                 | sí, por versión económica                         | ESPECIFICADO     |
| Servicio y clientes         | cumplimiento de promesa                                 | promesa vs real                  | pedido/servicio x promesa aceptada                        | solicitud no equivale a promesa; conservar versión y evento real                                   | sí, por promesa/corte                             | ESPECIFICADO     |
| Servicio y clientes         | tiempos de preparación, despacho y entrega              | intervalos/hitos                 | pedido x fase                                             | cada fase requiere eventos reales compatibles                                                      | sí, por hitos/corte                               | ESPECIFICADO     |
| Servicio y clientes         | pedidos completos                                       | completitud de ciclo             | pedido/línea                                              | resolver líneas, cantidades, revisiones y sustituciones aceptadas                                  | sí, por versión/cierre                            | ESPECIFICADO     |
| Servicio y clientes         | reclamos y tiempo de resolución                         | caso/ciclo                       | expediente de reclamo                                     | requiere expediente y SLA/versión aplicable                                                        | sí, por caso/corte                                | ESPECIFICADO     |
| Servicio y clientes         | compensaciones                                          | flujo de decisión/efecto         | compensación individual                                   | devolución, reembolso, descuento, cortesía, cupón y puntos separados                               | sí, por efecto/corte                              | ESPECIFICADO     |
| Servicio y clientes         | satisfacción y feedback                                 | señal perceptual                 | respuesta/feedback x población invitada                   | sesgo de respuesta y denominador visibles; feedback interno separado de reputación externa         | sí, con población y fuente                        | ESPECIFICADO     |
| Servicio y clientes         | recurrencia, frecuencia y abandono                      | cohorte longitudinal             | cliente autorizado x ventana                              | abandono requiere población elegible y ventana completa                                            | sí, con finalidad/autorización                    | ESPECIFICADO     |
| Servicio y clientes         | adquisición y activación                                | embudo/ciclo                     | persona/cuenta x hitos gobernados                         | adquisición y activación requieren eventos y origen; cuenta/login no equivalen a activación        | sí, por cohorte/corte                             | ESPECIFICADO     |
| Servicio y clientes         | fidelización, puntos y redenciones                      | ledger + cohorte                 | cuenta/movimiento                                         | saldo no sustituye ledger; movimientos y redenciones por estado                                    | sí, por ledger/corte                              | ESPECIFICADO     |
| Servicio y clientes         | reputación y temas recurrentes                          | señal temática                   | fuente/interacción x ventana                              | fuente pública externa y feedback interno separados; tema no prueba causa                          | solo con fuente gobernada disponible              | ESPECIFICADO     |
| Servicio y clientes         | reservas, no-show y utilización                         | ciclo + capacidad                | reserva/recurso x ventana                                 | reserva, cancelación y no-show distintos; utilización exige capacidad compatible                   | sí, por recurso/corte                             | ESPECIFICADO     |
| Servicio y clientes         | valor y rentabilidad del cliente cuando esté autorizado | económico restringido            | cliente autorizado x periodo                              | requiere identidad/finalidad autorizadas, ingreso y costos trazables                               | sí, solo por conjunto autorizado                  | ESPECIFICADO     |
| Económico-financiero        | costos estándar y reales                                | estándar vs real                 | objeto económico x periodo                                | método, versión, unidad, moneda y componentes comparables                                          | sí, por versión económica                         | ESPECIFICADO     |
| Económico-financiero        | variaciones                                             | comparación gobernada            | coordenada económica x base                               | cada variación conserva base; no mezclar costo, presupuesto, forecast, precio y cantidad           | sí, por base/version                              | ESPECIFICADO     |
| Económico-financiero        | margen y contribución                                   | económico derivado               | venta/objeto x periodo                                    | ingreso realizado + costos trazables/variables elegibles                                           | sí, por corte/método                              | ESPECIFICADO     |
| Económico-financiero        | gastos                                                  | flujo económico                  | gasto/soporte x estado                                    | capturado, reconocido, aprobado, pagado, anulado y conciliado separados                            | sí, por estado/corte                              | ESPECIFICADO     |
| Económico-financiero        | centros de costo                                        | dimensión económica              | hecho económico x centro vigente                          | centro es dimensión, no KPI por sí mismo                                                           | sí, preservando vigencia                          | ESPECIFICADO     |
| Económico-financiero        | presupuesto y forecast                                  | plan/versionado                  | coordenada de plan x periodo/version                      | presupuesto aprobado, revisión, forecast, escenario y real separados                               | sí, por edición/version                           | ESPECIFICADO     |
| Económico-financiero        | caja, bancos y tesorería                                | ledger + estado AS OF            | cuenta/movimiento x corte                                 | posición real exige saldos reconciliados y disponibilidad; pendientes separados                    | sí, por corte/conciliación                        | ESPECIFICADO     |
| Económico-financiero        | cartera y obligaciones                                  | ledger/ciclo                     | documento/obligación/aplicación x corte                   | saldo abierto deriva de reconocimiento menos aplicaciones válidas                                  | sí, por corte/version                             | ESPECIFICADO     |
| Económico-financiero        | rentabilidad multidimensional                           | económico derivado               | hecho atribuible x dimensión autorizada                   | ingreso, costos, asignaciones y residuo no atribuible visibles                                     | sí, por método/dimensión                          | ESPECIFICADO     |
| Económico-financiero        | escenarios y simulaciones                               | escenario versionado             | escenario x versión x alcance                             | simulado no sustituye real, baseline ni efecto observado                                           | sí, como artefacto de escenario, nunca como hecho | ESPECIFICADO     |

**Reconciliación:** 55 familias esperadas; 55 materializadas; 55 identidades únicas; distribución `11 + 12 + 10 + 12 + 10`; 0 faltantes; 0 duplicadas.

Ninguna fila crea una `metric_key`, una fórmula, un KPI, una meta o un score nuevo. Cada fórmula futura deberá provenir del registro semántico o de la tarea de dominio que la defina.

#### 16. Resultados temporales y snapshots

La capa deberá distinguir cinco clases de resultado:

| Clase                        | Qué representa                                                             | Mutabilidad lógica                                                                 | Regla de uso                                       |
| ---------------------------- | -------------------------------------------------------------------------- | ---------------------------------------------------------------------------------- | -------------------------------------------------- |
| vista viva                   | proyección actual bajo un corte de ejecución                               | cambia al cambiar fuentes/corte                                                    | siempre muestra frescura y corte                   |
| estado AS OF corte           | estado derivado con hechos conocidos hasta un instante                     | reproducible para las mismas entradas/versiones                                    | no equivale a publicación                          |
| snapshot analítico           | materialización derivada de una coordenada para reutilización/reproducción | inmutable respecto de su coordenada; una reconstrucción crea otra instancia lógica | no es fuente de verdad ni publicación por sí mismo |
| publicación/snapshot oficial | edición aprobada bajo D008/UX007                                           | inmutable; sucesiones/restatements se vinculan                                     | exige puerta de calidad y autorización aplicables  |
| reconstrucción/restatement   | resultado recalculado o reexpresado bajo evidencia/versiones declaradas    | conserva relación con original                                                     | nunca sobrescribe la edición histórica             |

Reglas:

1. un snapshot declara periodo, corte, versiones, población, dimensiones, filtros, unidad/moneda, calidad, fuentes y transformación;
2. un snapshot publicado conserva el estado de calidad que tenía al emitirse;
3. datos tardíos no mutan una edición histórica;
4. una corrección puede invalidar el uso futuro de un snapshot derivado sin borrar su existencia histórica;
5. reconstrucción y restatement son operaciones distintas;
6. una reconstrucción bajo nueva semántica se identifica como tal y no finge ser la serie histórica original;
7. un snapshot de saldo/estado no se suma como movimiento;
8. una publicación oficial no se utiliza como fuente para recalcularse a sí misma.

#### 17. Contrato de caché

El caché es una optimización de un resultado derivado, nunca una frontera de autorización ni una fuente de verdad.

La clave lógica de reutilización deberá particionar todo elemento que pueda cambiar materialmente el resultado, como mínimo cuando aplique:

- identidad y versión de métrica;
- propósito o perfil de consulta cuando cambie proyección autorizada;
- población/conjunto autorizado o una identidad segura equivalente de su política efectiva;
- territorio real;
- periodo;
- corte;
- zona horaria y calendario;
- dimensiones;
- filtros normalizados;
- unidad/moneda;
- versión de transformación;
- versiones de fuentes/maestros relevantes;
- estado o versión de calidad cuando altere elegibilidad del resultado;
- edición/snapshot cuando se solicite historia específica.

Reglas obligatorias:

1. nunca se calcula sobre población amplia para después ocultar miembros al actor;
2. un resultado cacheado solo se entrega si la autorización vigente permite la misma o una proyección más restrictiva explícitamente segura;
3. el caché no conserva credenciales, secretos o payloads sensibles innecesarios;
4. un hit de caché no omite evaluación de acceso vigente;
5. no existe TTL universal fijado por esta tarea;
6. el tiempo máximo de reutilización deberá derivarse de frescura exigida, fuente, uso, riesgo y contrato de publicación;
7. un resultado vencido puede mantenerse como evidencia histórica, pero no presentarse como actualización nueva;
8. un cache miss no justifica una consulta no autorizada;
9. una optimización no cambia precisión, redondeo o semántica para ahorrar costo;
10. se debe poder distinguir hit, miss, bypass, stale permitido y reconstrucción cuando la implementación futura los materialice.

#### 18. Causas de invalidez o reconstrucción

Una materialización derivada deberá reevaluarse cuando ocurra cualquiera de estas condiciones y afecte su linaje:

1. nueva versión semántica de una métrica;
2. cambio material de transformación;
3. cambio incompatible del contrato de fuente;
4. corrección de hecho fuente;
5. dato tardío que entre en la coordenada;
6. backfill del periodo;
7. corrección de identidad, jerarquía o vigencia dimensional;
8. cambio de crosswalk o mapeo aplicable;
9. cambio de unidad/moneda/conversión aplicable;
10. cambio de calendario, zona horaria o fecha empresarial con efecto;
11. cambio de población/cobertura;
12. reconciliación que cambie valor o aptitud para uso;
13. degradación, bloqueo o nueva certificación DQ cuando cambie elegibilidad;
14. restatement o reconstrucción de una dependencia publicada;
15. cambio de autorización/política que vuelva inseguro reutilizar el resultado;
16. retiro de una fuente o versión necesaria;
17. error técnico demostrado que haya producido un resultado distinto de la definición.

La invalidez de reutilización no equivale a borrar historia. Si el resultado fue publicado o usado en una decisión, su evidencia permanece vinculada a la versión original.

#### 19. Eventos y lecturas gobernadas

La capa usa la dualidad aprobada en `DATA-INT-001`:

```text
EVENTO
→ actualiza o invalida una proyección derivada cuando existe un hecho durable

LECTURA GOBERNADA
→ construye bootstrap
→ verifica estado actual
→ repara deriva
→ reconcilia cobertura
→ soporta reconstrucción/backfill autorizado
```

Reglas:

1. un evento no se interpreta como estado completo salvo que su contrato lo diga;
2. un evento perdido o entrega fallida no se corrige inventando el estado: se reconcilia mediante lectura propietaria;
3. redelivery conserva idempotencia y no duplica hechos;
4. no existe orden global de eventos; el orden se resuelve por agregado/versión/contrato aplicable;
5. un consumidor puede reconstruir su proyección desde lectura gobernada sin adquirir autoridad sobre la fuente;
6. la lectura de reparación debe producir el mismo estado lógico que la secuencia completa de hechos válidos para el mismo corte y versiones, cuando el contrato lo permita;
7. divergencias se conservan como reconciliación, no se ocultan modificando la fuente o el modelo.

#### 20. Contrato de consulta semántica

Toda consulta deberá declarar o resolver del lado servidor, cuando aplique:

1. principal y actor efectivo;
2. capacidad exacta;
3. finalidad;
4. dominio/recurso;
5. métrica(s) y versión(es);
6. población autorizada;
7. periodo;
8. corte;
9. zona horaria;
10. calendario;
11. dimensiones;
12. filtros solicitados;
13. inclusiones/exclusiones semánticas;
14. unidad/moneda;
15. granularidad de respuesta;
16. ordenamiento permitido;
17. paginación/cursor cuando corresponda;
18. estado mínimo de calidad para el uso;
19. necesidad de resultado vivo, histórico, snapshot o publicación;
20. tolerancia de frescura aplicable;
21. nivel de detalle autorizado;
22. requisito de reproducibilidad/auditoría.

La respuesta deberá poder devolver, según la pregunta y autorización:

- valor, distribución o conjunto solicitado;
- ausencia explícita cuando no exista valor válido;
- versión semántica;
- periodo/corte/zona horaria;
- población y dimensiones relevantes;
- unidad/moneda;
- frescura;
- cobertura;
- calidad/certificación;
- limitaciones materiales;
- referencia de linaje/reproducibilidad;
- condición de caché/snapshot cuando sea relevante para interpretar el resultado;
- edición histórica cuando corresponda.

#### 21. Seis perfiles de consulta

| Perfil lógico             | Propósito                                            | Regla principal                                    | Optimización admisible                                                |
| ------------------------- | ---------------------------------------------------- | -------------------------------------------------- | --------------------------------------------------------------------- |
| resumen interactivo       | responder estado/KPI principal con baja densidad     | conservar contexto, corte y DQ                     | preagregación o caché por coordenada si no altera seguridad/semántica |
| comparación               | comparar periodos, segmentos o versiones             | comprobar comparabilidad antes del cálculo         | resultados precomputados solo para coordenadas compatibles            |
| detalle autorizado        | explicar composición/drill-down                      | reautorizar en el nuevo recurso/grano              | paginación y proyección mínima; nunca heredar acceso por el agregado  |
| calidad y reconciliación  | explicar frescura, cobertura, diferencias y bloqueos | usar evidencia D007/D006, no reinterpretar negocio | caché corto o snapshot de evidencia si conserva corte y estado        |
| historia y reconstrucción | reproducir AS OF, edición original o reconstruida    | fijar versiones, corte y evidencia                 | snapshot/versiones históricas; no usar dimensión actual por defecto   |
| publicación oficial       | producir/servir una edición gobernada                | exige puerta de publicación, DQ y autorización     | snapshot inmutable y artefacto versionado                             |

No se crean endpoints ni nombres físicos para estos perfiles.

#### 22. Cardinalidad, paginación y orden

1. un agregado se calcula sobre la población autorizada completa definida por el contrato, no sobre una página visible;
2. una página es proyección de un conjunto ordenado de forma determinista cuando se requiere continuidad;
3. el orden deberá incluir desempate estable cuando la paginación pueda producir saltos o duplicados;
4. la ausencia de orden global en eventos no impide ordenar una consulta por claves gobernadas;
5. un límite de interfaz no se convierte en límite semántico del cálculo;
6. una consulta de detalle debe declarar cardinalidad esperada y tamaño observado cuando se materialice;
7. joins que aumenten cardinalidad deben detectarse antes de agregar;
8. un conteo no se infiere de `rows.length` de una página parcial;
9. la paginación no puede alterar periodo, corte, autorización o versión entre páginas sin indicar una nueva coordenada;
10. si la fuente cambia durante una lectura que exige snapshot estable, la implementación deberá usar una frontera consistente o declarar la limitación.

#### 23. Gobierno de rendimiento

`DATA-INT-002` no fija un número universal de milisegundos, filas, memoria, concurrencia o TTL. Cada consulta o familia material deberá recibir un presupuesto medible cuando se materialice físicamente.

El presupuesto deberá poder declarar:

- perfil de consulta;
- ambiente;
- volumen de entrada;
- cardinalidad retornada;
- cardinalidad escaneada o procesada;
- número/forma de joins;
- partición temporal o dimensional relevante;
- percentil de latencia objetivo y observado;
- concurrencia objetivo y observada;
- timeout y cancelación;
- memoria/CPU o costo de ejecución cuando sea medible;
- hit/miss/bypass de caché;
- edad del resultado cacheado;
- tiempo de reconstrucción de snapshot;
- retraso entre fuente y disponibilidad analítica;
- cobertura/frescura al momento de medir;
- errores, reintentos y resultados parciales;
- plan físico, pruning, índices u otra evidencia equivalente cuando exista implementación;
- costo de materialización/almacenamiento cuando sea relevante.

Reglas:

1. un presupuesto se define por perfil y riesgo, no por una cifra transversal arbitraria;
2. rendimiento se mide con datos/volúmenes representativos o límites declarados;
3. reducir población, precisión o historia para cumplir latencia exige una decisión funcional explícita y no puede ser una optimización silenciosa;
4. un caché rápido con dato vencido no satisface la consulta si la frescura exigida no lo permite;
5. una consulta lenta no justifica omitir autorización, DQ, reconciliación o versionado;
6. cualquier preagregación deberá reconciliar con el cálculo canónico para la misma coordenada;
7. la implementación deberá evidenciar regresiones antes de ampliar carga o consumo.

#### 24. Calidad y propagación de estado

La capa distingue:

```text
CALIDAD DE FUENTE
≠ CALIDAD DE MÉTRICA
≠ CALIDAD DE MODELO/CONSULTA
≠ CALIDAD DE SNAPSHOT/PUBLICACIÓN
```

Reglas:

1. una limitación de fuente material se propaga a dependencias;
2. una dependencia obligatoria `BLOQUEADO` impide certificar el resultado dependiente;
3. una fuente `NO EVALUADO` no se convierte en certificada por precálculo;
4. un modelo puede tener integridad técnica y aun depender de datos no certificados;
5. una consulta conserva frescura, cobertura, reconciliación y DQ relevantes;
6. un snapshot conserva el estado de calidad correspondiente a su corte/edición;
7. recertificar una fuente hoy no reescribe la calidad histórica de una publicación;
8. una reconstrucción/restatement requiere evaluación y certificación propias;
9. caché y snapshot no eliminan la necesidad de reevaluar el uso cuando cambia la calidad.

#### 25. Autorización y privacidad

1. el conjunto autorizado se construye antes de agregación, orden, paginación, caché o snapshot ad hoc;
2. filtros del usuario solo reducen el conjunto permitido;
3. una métrica visible no concede detalle fuente;
4. un resultado agregado no concede miembros de la población;
5. un caché compartido debe impedir mezcla entre conjuntos autorizados incompatibles;
6. una consulta transversal intersecta las autorizaciones de todas las dependencias materiales;
7. una edición histórica se consulta bajo autorización vigente para ese uso;
8. conocer un identificador no concede el recurso;
9. poblaciones pequeñas, sujetos sensibles, precisión y combinaciones de filtros consumen las protecciones de `DATA-AUTH-002`;
10. `PUBLISH`, `EXPORT`, `DEFINE`, `CERTIFY`, `SET_TARGET`, `ANNOTATE` y `ADMINISTER` permanecen capacidades distintas;
11. un proceso técnico o privilegio de infraestructura no sustituye actor/finalidad empresarial;
12. los logs de rendimiento no deben copiar payloads o filas sensibles para facilitar diagnóstico.

#### 26. Reproducibilidad e historia

La capa deberá poder resolver los elementos materiales exigidos por D017, incluidos:

- identidad y versión semántica;
- periodo, corte, zona horaria y calendario;
- población, grano, dimensiones, filtros e inclusiones/exclusiones;
- unidad, moneda y precisión;
- fuentes y versiones de contrato;
- originales cuando deban preservarse;
- claves/crosswalks aplicables;
- vigencias de dimensiones;
- versión de transformación;
- consulta/modelo/regla reproducible;
- versión técnica o referencia equivalente;
- datos tardíos, backfills y correcciones conocidos al corte;
- deduplicación, rechazo/cuarentena y reconciliación;
- estado DQ y decisión de certificación;
- evidencia de ejecución y salida.

La historia distingue obligatoriamente:

```text
RESULTADO CONOCIDO ENTONCES
≠ RESULTADO RECONSTRUIDO AHORA
```

Una nueva versión semántica no elimina la anterior. Un restatement conserva edición original, nueva edición, motivo, diferencia, calidad y evidencia. Una optimización de consulta o caché que no cambia semántica puede cambiar versión técnica sin crear una métrica nueva.

#### 27. Cambios, correcciones e invalidez por linaje

La evaluación de impacto se propaga por linaje:

```text
HECHO / MAESTRO / RELACIÓN CORREGIDA
→ TRANSFORMACIONES AFECTADAS
→ MODELOS AFECTADOS
→ MÉTRICAS AFECTADAS
→ CACHÉS / SNAPSHOTS AFECTADOS
→ ARTEFACTOS AFECTADOS
→ DIAGNÓSTICOS / OBJETIVOS / EVALUACIONES AFECTADOS
```

No se invalida ni reconstruye una métrica solo por similitud de nombre. Cada inclusión o exclusión debe justificarse por dependencia real.

Una corrección de crosswalk o identidad externa no se aplica hasta que `DATA-INT-003` materialice la correspondencia y vigencia necesarias.

#### 28. Observabilidad futura de la capa

Cuando exista implementación, deberá ser posible observar sin exponer información indebida:

- consulta/perfil ejecutado;
- coordenada semántica o referencia segura;
- versión de métrica y transformación;
- corte;
- fuente/modelo utilizado;
- filas procesadas/retornadas cuando sea seguro;
- duración y percentiles;
- hit/miss/bypass de caché;
- staleness;
- snapshot utilizado o reconstruido;
- outcome;
- error clasificado;
- reintento cuando aplique;
- principal técnico y actor/finalidad mediante referencias autorizadas;
- correlación con auditoría A004.

La observabilidad no se convierte en una segunda fuente de datos empresariales.

#### 29. Handoffs y propiedad exacta

| Necesidad fuera del alcance de DATA-INT-002                                                     | Propietario documental                                                      | Condición de salida                                                         |
| ----------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- |
| correspondencia de claves externas, crosswalks, identidad y reconciliación maestra              | `DATA-INT-003`                                                              | antes de unir hechos externos cuya identidad canónica no esté demostrada    |
| BI, hojas de cálculo, modelos externos e inteligencia artificial                                | `DATA-INT-004`                                                              | antes de exponer la capa a herramientas externas o automatización analítica |
| definición/fórmula/versionado de una métrica                                                    | `DATA-DOM-004` y `DATA-DOM-017`                                             | antes de ejecutar una semántica nueva o incompatible                        |
| calidad, frescura, cobertura, reconciliación y certificación                                    | `DATA-DOM-007`                                                              | antes de elevar un resultado a uso oficial                                  |
| publicación, edición y artefactos oficiales                                                     | `DATA-DOM-008` y `DATA-UX-007`                                              | antes de emitir o redistribuir una publicación                              |
| autorización de conjunto y detalle sensible                                                     | `DATA-AUTH-001` y `DATA-AUTH-002`                                           | antes de calcular o exponer población protegida                             |
| capacidades de definir, certificar, publicar, fijar meta, anotar, exportar o administrar        | `DATA-AUTH-003`                                                             | antes de cualquier decisión autoritativa correspondiente                    |
| auditoría productiva de consultas/modelos                                                       | `DATA-AUTH-004`                                                             | antes de habilitar evidencia operativa de uso analítico                     |
| integración de fuentes/eventos/lecturas                                                         | `DATA-INT-001` y contratos propietarios                                     | antes de incorporar una fuente nueva al modelo                              |
| implementación física de tablas, vistas, índices, funciones, cachés, snapshots y optimizaciones | fase de implementación Supabase aplicable cuando la continuidad la habilite | antes de ejecutar cambios físicos en `vento-shell`                          |
| validación con personas usuarias                                                                | `DATA-UX-008` y tareas `UX-QA-*`                                            | antes de declarar readiness de la experiencia que consume la capa           |

No queda una decisión sustantiva de esta tarea diferida sin propietario y condición de salida.

#### 30. Cobertura por requisitos vigentes

La conducta definida por esta tarea ya está protegida por requisitos canónicos vigentes:

- `TREQ-DATA-002` exige registro canónico versionado de métricas, igualdad de resultado para misma versión/contexto y prohíbe fórmulas locales; asigna responsabilidad a esta tarea;
- `TREQ-DATA-003` protege contrato de origen, tiempo, grano, claves, versión de esquema, cobertura, duplicados, integridad, datos tardíos, backfills, correcciones, cuarentena, reconciliación y linaje;
- `TREQ-DATA-004` protege versión, periodo, zona horaria, filtros, dimensiones, unidad/moneda, corte, frescura, cobertura, calidad, separación de artefactos, snapshots y restatements; asigna responsabilidad a esta tarea;
- los requisitos vigentes de integración protegen idempotencia, trazabilidad y propagación desde una única fuente propietaria sin copias competidoras;
- los requisitos UX vigentes protegen fuente de verdad, contexto, autorización, trazabilidad y consumo de resultados.

La tarea especializa cómo esas obligaciones se materializan en la capa semántica. No introduce una conducta ejecutable nueva, un permiso, una fórmula, una transición física o una integración que requiera una identidad adicional de prueba.

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** el contrato de capa semántica, modelos, consultas, snapshots, caché, calidad, autorización, reproducibilidad y rendimiento materializa obligaciones ya cubiertas por requisitos canónicos vigentes. La tarea no crea un comportamiento empresarial independiente ni modifica prioridad, modalidad, estado, relación o destino de implementación de los requisitos existentes.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

#### 31. Criterios de aceptación documental

1. la capa semántica permanece derivada de fuentes propietarias;
2. modelo analítico, métrica, consulta, caché, snapshot y reporte permanecen conceptos distintos;
3. evento y lectura gobernada conservan sus papeles complementarios;
4. un evento no se interpreta como estado completo por defecto;
5. una lectura de reparación no transfiere autoridad al consumidor;
6. se materializan exactamente 36 coordenadas mínimas de modelo;
7. se preservan exactamente ocho arquetipos lógicos sin imponer una forma física;
8. todo cálculo declara grano;
9. joins usan identidades/relaciones gobernadas y no etiquetas visibles;
10. dimensiones históricas se resuelven con vigencia aplicable al hecho;
11. una identidad externa no resuelta se deriva a DATA-INT-003;
12. fan-out y cardinalidad se tratan antes de agregar;
13. no se fabrican miembros genéricos para ocultar relaciones ausentes;
14. se materializan 10/10 aplicaciones;
15. se reconcilian 69 procesos propietarios y SHELL conserva cero;
16. ninguna aplicación consumidora adquiere fuente de verdad por modelado;
17. se materializan 15/15 familias de hechos/representaciones;
18. las 15 familias conservan 13 `ESPECIFICADO`, 1 `BLOQUEADO` y 1 `NO_APLICA`;
19. AURA no se activa mediante modelos o caché;
20. PRINTER/ASSET no se crean como hechos autónomos;
21. se materializan 62/62 objetos maestros/referencia;
22. los 62 objetos conservan 59 `ESPECIFICADO` y 3 `BLOQUEADO`;
23. se preserva la distribución 43 maestros + 19 referencias;
24. los tres objetos AURA bloqueados permanecen `PERFIL_DE_MARCA`, `AUDIENCIA` y `ACTIVO_DE_MARCA`;
25. ninguna dimensión es copia editable;
26. el registro canónico gobierna identidad y versión de métricas;
27. ninguna pantalla o reporte puede redefinir fórmula localmente;
28. optimizar físicamente no cambia semántica por sí mismo;
29. tasas se recomputan desde numerador/denominador y no se promedian;
30. saldos/estados no se suman como movimientos;
31. escenarios no se mezclan con hechos reales;
32. se materializan 14/14 métricas de asistencia;
33. las 14 claves son únicas;
34. se preservan exactamente 11 `NO EVALUADO` y 3 `BLOQUEADO`;
35. las tres bloqueadas siguen siendo `missingCloseCount`, `attendanceRate` y `punctualityRate`;
36. la capa no corrige silenciosamente los tres bloqueos técnicos observados;
37. un caché o snapshot dependiente de métrica bloqueada conserva el bloqueo;
38. se materializan exactamente 55 familias analíticas;
39. se conserva la distribución `11 + 12 + 10 + 12 + 10`;
40. las 55 identidades son únicas y no existen faltantes ni duplicados;
41. ninguna familia crea una métrica o fórmula nueva;
42. cada familia tiene perfil lógico, grano/condición, regla de comparabilidad y decisión de snapshot/caché;
43. vista viva, estado AS OF, snapshot analítico, publicación oficial y restatement permanecen distintos;
44. un snapshot declara corte y versiones;
45. una edición histórica no se sobrescribe por dato tardío;
46. reconstrucción y restatement permanecen operaciones distintas;
47. un snapshot de saldo no se suma como movimiento;
48. caché nunca se convierte en fuente, autorización o certificación;
49. la clave lógica de caché particiona todas las dimensiones materiales del resultado;
50. el acceso vigente se reevalúa incluso ante hit de caché;
51. no existe TTL universal inventado;
52. frescura exigida gobierna elegibilidad de reutilización;
53. se materializan diecisiete causas de reevaluación/invalidez;
54. invalidez de reutilización no borra evidencia histórica;
55. evento incremental y lectura gobernada convergen mediante reconciliación;
56. redelivery no duplica hechos;
57. no se exige orden global de eventos;
58. se materializan veintidós entradas/resoluciones del contrato de consulta;
59. la respuesta semántica conserva versión, corte, DQ y evidencia relevante;
60. se preservan seis perfiles lógicos de consulta;
61. ningún perfil crea endpoint físico;
62. agregados se calculan sobre población autorizada completa, no sobre página visible;
63. paginación usa orden determinista cuando la continuidad lo requiere;
64. un límite visual no cambia el universo del cálculo;
65. se controla cardinalidad y fan-out antes de agregación;
66. no se inventa un presupuesto universal de latencia, filas, memoria, concurrencia o TTL;
67. todo presupuesto futuro declara perfil, volumen, cardinalidad y ambiente;
68. rendimiento incluye percentiles de latencia y concurrencia cuando se materialice;
69. rendimiento incluye hit/miss, staleness y reconstrucción cuando aplique;
70. rendimiento no justifica reducir precisión, autorización o calidad silenciosamente;
71. preagregados deben reconciliar con el cálculo canónico;
72. calidad de fuente, métrica, modelo y publicación permanecen ejes distinguibles;
73. un `BLOQUEADO` material impide certificar el resultado dependiente;
74. `NO EVALUADO` no se convierte en certificado por caché;
75. reconstrucción/restatement requiere nueva evaluación de calidad;
76. el conjunto autorizado se construye antes de agregación/caché;
77. filtros solo reducen el conjunto autorizado;
78. un agregado no concede detalle;
79. un caché compartido no mezcla conjuntos autorizados incompatibles;
80. consultas transversales intersectan autorizaciones;
81. historia se consulta bajo autorización vigente;
82. capacidades de publicación/exportación/definición/certificación permanecen separadas;
83. observabilidad no copia datos sensibles por conveniencia;
84. reproducibilidad conserva los elementos materiales de D017;
85. resultado conocido entonces y reconstruido ahora permanecen distintos;
86. nueva versión semántica no elimina la anterior;
87. restatement conserva original, nueva edición, motivo, calidad y evidencia;
88. una optimización que conserva semántica puede cambiar versión técnica sin crear una métrica nueva;
89. evaluación de impacto se propaga por linaje real y no por similitud de nombre;
90. una corrección de crosswalk espera la materialización de DATA-INT-003;
91. cada handoff tiene propietario documental exacto y condición de salida;
92. la implementación física permanece fuera de alcance hasta habilitación canónica de fase;
93. no se crea ni modifica ningún requisito de prueba;
94. no se ejecuta código, DDL, DML, migración, índice, backfill, caché productivo, snapshot físico, despliegue o cambio de Supabase;
95. `DATA-INT-003` permanece únicamente reservada.

#### 32. Balance de cierre

| Control                                  |                                       Resultado |
| ---------------------------------------- | ----------------------------------------------: |
| Aplicaciones                             |                                     **10 / 10** |
| Procesos propietarios                    |                                     **69 / 69** |
| Familias fuente/hecho                    |                                     **15 / 15** |
| Estados familias                         | **13 ESPECIFICADO / 1 BLOQUEADO / 1 NO_APLICA** |
| Objetos maestros/referencia              |                                     **62 / 62** |
| Estados objetos                          |               **59 ESPECIFICADO / 3 BLOQUEADO** |
| Distribución objetos                     |                **43 maestros + 19 referencias** |
| Métricas de asistencia                   |                                     **14 / 14** |
| Estados métricas                         |                **11 NO EVALUADO / 3 BLOQUEADO** |
| Familias analíticas                      |                                     **55 / 55** |
| Distribución familias                    |                      **11 + 12 + 10 + 12 + 10** |
| Coordenadas mínimas de modelo            |                                     **36 / 36** |
| Arquetipos lógicos                       |                                       **8 / 8** |
| Perfiles de consulta                     |                                       **6 / 6** |
| Causas de invalidez/reconstrucción       |                                     **17 / 17** |
| Criterios de aceptación                  |                                     **95 / 95** |
| Fórmulas nuevas                          |                                           **0** |
| Fuentes de verdad transferidas           |                                           **0** |
| Cambios físicos                          |                                           **0** |
| Requisitos de prueba creados/modificados |                                           **0** |

#### 33. Continuidad

ÚLTIMA TAREA APROBADA
`DATA-INT-001 — Definir contratos de eventos y lectura con todas las aplicaciones y fuentes externas`

TAREA ACTUAL APROBADA
`DATA-INT-002 — Definir capa semántica, modelos analíticos, snapshots, caché, consultas y rendimiento`

SIGUIENTE TAREA RESERVADA
`DATA-INT-003 — Definir crosswalks, claves externas, identidad y reconciliación de datos maestros`


### ✅ DATA-INT-003 — Definir crosswalks, claves externas, identidad y reconciliación de datos maestros

**Estado:** APROBADA
**Tarea anterior:** `DATA-INT-002 — Definir capa semántica, modelos analíticos, snapshots, caché, consultas y rendimiento` — APROBADA
**Tarea siguiente:** `DATA-INT-004 — Definir integración controlada con BI, hojas de cálculo, modelos analíticos e inteligencia artificial` — RESERVADA
**Tipo de tarea:** documental; contrato transversal materializado de crosswalks, claves externas, resolución de identidad y reconciliación temporal de datos maestros y de referencia
**Bloque:** AB — Analítica, indicadores y datos maestros
**Fase:** exclusivamente documental dentro de `CONDITIONAL_DESIGN_ARTIFACTS`
**Implementación técnica:** no autorizada
**Código, DDL, DML, migraciones, backfills, merges, splits, correcciones de datos, escritura de crosswalks productivos, despliegues o cambios en Supabase:** no autorizados
**Instancias proveedor-específicas:** no se declaran como conciliadas sin inventario y evidencia verificables
**Requisitos de prueba creados o modificados:** 0

#### 1. Propósito

Definir cómo Vento OS relacionará identificadores provenientes de sistemas, autoridades, proveedores, canales, archivos o plataformas externas con las identidades canónicas de los **62 objetos** gobernados por el BLOQUE AB, sin convertir una coincidencia textual en identidad, sin crear una fuente de verdad paralela y sin perder la historia cuando una clave externa cambie, se reutilice, se retire o se descubra que estaba asociada al objeto incorrecto.

La tarea debe dejar resuelto documentalmente:

- qué es un crosswalk y qué no es;
- qué coordenadas mínimas identifican una correspondencia;
- qué estados puede atravesar un vínculo externo;
- qué evidencia permite resolver una identidad y cuál solo produce un candidato;
- cómo se manejan uno-a-uno, muchos-al-mismo, ambigüedades y conflictos;
- cómo se conserva la vigencia efectiva y el tiempo de la decisión;
- cómo se corrige una correspondencia sin reescribir historia;
- cómo se integran fusión y separación de maestros con claves externas;
- cómo consume la capa semántica una identidad reconciliada;
- qué decisión aplica a cada uno de los 62 objetos heredados;
- qué permanece bloqueado mientras no exista una fuente operativa habilitada;
- qué pertenece a la futura integración proveedor-específica y no puede inventarse en esta tarea.

El resultado es un contrato lógico completo y una matriz materializada por objeto. No prescribe todavía una tabla, schema, índice, UUID, constraint, trigger, RPC, endpoint o formato físico de persistencia.

#### 2. Resultado sustantivo

Queda materializado el contrato canónico de crosswalks e identidad externa con estos resultados:

- **62/62 objetos** con decisión explícita de conciliación de claves externas;
- distribución heredada preservada: **43 datos maestros + 19 datos de referencia**;
- estado heredado preservado: **59 ESPECIFICADO + 3 BLOQUEADO**;
- los tres objetos bloqueados continúan siendo exactamente `PERFIL_DE_MARCA`, `AUDIENCIA` y `ACTIVO_DE_MARCA`;
- **11/11 identidades TECH_SERVICE** preservadas sin renumeración;
- separación obligatoria entre identificador canónico, clave empresarial, clave técnica, código, alias externo, representación normalizada y credencial;
- contrato lógico de **30 coordenadas mínimas** para una correspondencia reproducible;
- ocho estados del vínculo de reconciliación, separados del ciclo de vida del maestro;
- seis niveles de evidencia para resolución, desde identidad interna directa hasta sugerencia estadística;
- reglas exhaustivas de cardinalidad, temporalidad, reasignación, conflicto, ambigüedad, fusión y separación;
- procedimiento determinista y fail closed para resolver una clave externa;
- tratamiento explícito de claves personales, registrales, fiscales, de proveedor, marketplace, catálogo, dispositivo, red, contabilidad y taxonomías;
- preservación de `endpoint_id`, `device_id`, `device_code`, `app_code` y `TI-SERVICE-001` a `TI-SERVICE-011`;
- frontera expresa con las tareas de integración externa que inventariarán sistemas concretos y sus mappings reales;
- cero mappings proveedor-específicos inventados;
- cero fusiones o separaciones ejecutadas;
- cero cambios físicos;
- cero cambios de requisitos de prueba.

#### 3. Decisión principal

Vento OS adopta un modelo de **identidad canónica interna con correspondencias externas versionadas y reconciliadas**.

```text
IDENTIDAD CANÓNICA
→ pertenece al dominio propietario
→ conserva autoridad y ciclo de vida interno

CLAVE EXTERNA
→ pertenece a un sistema/autoridad/namespace de origen
→ conserva valor original, alcance y vigencia

CROSSWALK
→ declara la correspondencia gobernada entre una clave externa y una identidad canónica
→ no crea la identidad
→ no transfiere propiedad
→ no concede autorización

CANDIDATO
→ puede surgir de una clave empresarial, forma normalizada o similitud
→ no puede usarse como identidad oficial

CONCILIACIÓN
→ resuelve la correspondencia con evidencia y autoridad suficientes

CONFLICTO / AMBIGÜEDAD
→ fallan cerrados
→ conservan evidencia y no fuerzan una elección
```

Regla cardinal:

```text
CLAVE EXTERNA ≠ IDENTIDAD CANÓNICA
CROSSWALK ≠ FUENTE DE VERDAD
COINCIDENCIA ≠ EQUIVALENCIA
NORMALIZACIÓN ≠ FUSIÓN
```

#### 4. Fuentes y decisiones heredadas

Esta tarea consume sin redefinir:

- `DATA-DOM-001`: gobierno federado, fuente de verdad, propietario y stewardship;
- `DATA-DOM-002`: catálogo materializado de 62 objetos, 43 maestros, 19 referencias y tres objetos AURA bloqueados;
- `DATA-DOM-003`: identidad estable, claves, códigos, jerarquías, ciclo de vida, fusión/separación y regla de que el modelo de crosswalk corresponde a esta tarea;
- `DATA-DOM-005`: tiempo del hecho, vigencias dimensionales, snapshots y comparabilidad histórica;
- `DATA-DOM-006`: contratos de origen, ingestión, replay, backfill, transformación, reconciliación y linaje;
- `DATA-DOM-007`: calidad, evidencia, duplicados, certificación y bloqueo;
- `DATA-DOM-017`: versiones, reconstrucción, correcciones históricas, impacto, restatements y reproducibilidad;
- `DATA-AUTH-001`: autorización por conjunto gobernado antes de agregación o consumo;
- `DATA-AUTH-003`: segregación de capacidades de definición, certificación, publicación, exportación y administración;
- `DATA-AUTH-004`: auditoría de uso analítico cuando corresponda;
- `DATA-INT-001`: contratos de evento y lectura que transportan identidades sin transferir autoridad;
- `DATA-INT-002`: capa semántica, joins gobernados, modelos, snapshots, caché y consultas;
- `INT-EXT-001`: inventario futuro de sistemas externos, proveedores, propietarios y finalidad;
- `INT-EXT-013`: mapeo proveedor-específico de identificadores externos y canónicos;
- `INT-EXT-014`: conservación controlada del payload original;
- `INT-EXT-017`: auditoría, métricas, alertas y conciliación de cada integración externa;
- `TREQ-DATA-001`: protección preexistente de identidad, claves externas, fusión, separación, historia efectiva y crosswalks;
- `TREQ-DATA-003`: protección preexistente de contratos de origen, claves, integridad, correcciones, reconciliación y linaje;
- `TREQ-INTEGRATION-006`: captura única en la fuente propietaria y resolución trazable de diferencias entre fuentes.

No se modifica ninguna de estas decisiones.

#### 5. Fronteras conceptuales obligatorias

```text
identificador canónico ≠ clave empresarial ≠ clave técnica ≠ código visible
```

```text
alias externo ≠ representación normalizada ≠ credencial secreta
```

```text
sistema externo ≠ dominio propietario interno
```

```text
crosswalk ≠ maestro universal ≠ tabla dimensional ≠ caché
```

```text
candidato ≠ conciliado
```

```text
conciliado ≠ fusionado
```

```text
misma etiqueta ≠ misma identidad
```

```text
misma clave en namespaces distintos ≠ misma identidad
```

```text
clave externa reutilizada en otro periodo ≠ equivalencia histórica permanente
```

```text
mapeo actual ≠ mapeo aplicable al hecho histórico
```

```text
secreto de integración ≠ identificador externo del maestro
```

#### 6. Coordenada mínima de una correspondencia

Toda correspondencia materializable deberá poder resolver conceptualmente estas **30 coordenadas** cuando sean aplicables:

1. sistema o autoridad externa de origen;
2. integración o contexto de adquisición;
3. namespace externo;
4. tipo de objeto externo;
5. clave externa original;
6. representación normalizada de búsqueda, separada del original;
7. versión o esquema del contrato externo;
8. objeto canónico de destino;
9. clase canónica del objeto;
10. identificador canónico relacionado;
11. dominio propietario interno;
12. fuente de verdad lógica interna;
13. alcance organizacional;
14. entidad legal cuando sea material;
15. territorio o sede cuando sea material;
16. canal, marca u otra dimensión de scope cuando sea material;
17. inicio de vigencia efectiva;
18. fin de vigencia efectiva cuando exista;
19. momento en que la clave externa fue observada;
20. momento en que se tomó la decisión de conciliación;
21. estado del vínculo;
22. nivel/clase de evidencia utilizada;
23. evidencia o procedencia verificable;
24. steward responsable de revisión;
25. propietario o autoridad que decide cuando corresponda;
26. motivo de alta, corrección, sustitución o retiro;
27. relación con correspondencia precedente o sucesora;
28. referencia a conflicto, cuarentena o incidencia cuando exista;
29. versión técnica o contractual suficiente para reproducir la resolución;
30. impacto conocido sobre consumidores, hechos o derivados cuando una corrección cambie la correspondencia.

No todas estas coordenadas requieren una columna física. Todas deberán poder resolverse cuando sean materiales para explicar la correspondencia.

#### 7. Estados del vínculo de reconciliación

Estos estados pertenecen al vínculo externo y **no** sustituyen el ciclo de vida del maestro definido por su dominio.

| Estado          | Significado                                                                                                               | Uso permitido                                                         |
| --------------- | ------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------- |
| `NO_CONCILIADO` | La clave externa fue observada con procedencia suficiente, pero todavía no existe decisión de equivalencia.               | conservar, revisar y medir; no usar como join oficial por identidad   |
| `CANDIDATO`     | Existe una o más identidades internas plausibles sustentadas por evidencia parcial.                                       | revisión de steward; nunca resolver automáticamente un uso oficial    |
| `CONCILIADO`    | Una identidad canónica única fue confirmada para el sistema, namespace, alcance y vigencia declarados.                    | resolución determinista mientras todas las condiciones sigan vigentes |
| `AMBIGUO`       | La evidencia permite más de una identidad plausible y no existe criterio autorizado para elegir.                          | fail closed; investigación y revisión                                 |
| `CONFLICTO`     | Dos fuentes, reglas o mappings vigentes son incompatibles o una misma coordenada pretende resolver identidades distintas. | fail closed; resolución por steward/propietario                       |
| `SUPERADO`      | La correspondencia dejó de ser vigente porque una corrección o decisión posterior la sustituyó.                           | historia y reproducción; no usos nuevos fuera de su vigencia          |
| `RETIRADO`      | La clave o integración dejó de admitirse para nuevos usos sin ser sustituida por otra correspondencia.                    | historia y auditoría solamente                                        |
| `BLOQUEADO`     | La fuente, objeto o evidencia no permite materializar ni usar la correspondencia.                                         | no resolución oficial hasta satisfacer la condición de salida         |

Reglas:

- el silencio no equivale a `CONCILIADO`;
- `NO_CONCILIADO` no equivale a dato inexistente;
- `CANDIDATO` no equivale a match aceptado;
- `AMBIGUO` y `CONFLICTO` impiden la resolución oficial;
- `SUPERADO` y `RETIRADO` conservan historia;
- el estado del vínculo no eleva el estado de calidad del maestro, fuente o métrica.

#### 8. Cardinalidad y unicidad

La unidad de unicidad de una clave externa no es el valor textual aislado. Como mínimo se evalúa:

```text
sistema externo
+ namespace
+ tipo de objeto
+ valor original
+ alcance aplicable
+ vigencia
```

Reglas:

1. una identidad canónica puede tener múltiples claves externas de distintos sistemas o namespaces;
2. varias claves externas pueden resolver la misma identidad canónica si cada vínculo conserva procedencia propia;
3. una misma coordenada externa activa no puede resolver dos identidades canónicas simultáneamente;
4. si una clave externa es reutilizada legítimamente por el emisor en otro periodo, se cierra la vigencia anterior y se crea una nueva decisión; no se reescribe la historia;
5. un mismo valor en sistemas diferentes no implica relación;
6. un mismo valor en namespaces diferentes del mismo sistema no implica relación;
7. una relación muchos-a-muchos empresarial no se representa como crosswalk de identidad;
8. cuando dos clases canónicas distintas se relacionan, se conserva una relación tipada y no se fuerza equivalencia;
9. el objeto canónico y la clase forman parte del control para impedir mapeos entre conceptos incompatibles;
10. cualquier colisión no resoluble queda `CONFLICTO` o `AMBIGUO`, nunca “primero gana” ni “última escritura gana”.

#### 9. Niveles de evidencia para resolución

Se define una escala de **seis niveles de evidencia**. No es una probabilidad matemática ni una autorización automática.

| Nivel                  | Evidencia                                                                                              | Decisión máxima                                                                              |
| ---------------------- | ------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------- |
| `E0_INTERNA`           | El contrato interno ya transporta el identificador canónico válido.                                    | no requiere crosswalk para identificar ese objeto; se valida el contrato y autorización      |
| `E1_MAPEO_VIGENTE`     | Existe correspondencia previa `CONCILIADO` para la misma coordenada y continúa vigente, sin conflicto. | resolución determinista a la identidad ya conciliada                                         |
| `E2_AUTORIDAD_EXTERNA` | Clave emitida por autoridad/proveedor con semántica, namespace, alcance y vigencia verificables.       | puede sustentar una primera conciliación, sujeta al control de steward/propietario aplicable |
| `E3_CLAVE_EMPRESARIAL` | Combinación fuerte de atributos empresariales controlados y compatibles.                               | candidato priorizado; no fusión automática                                                   |
| `E4_REPRESENTACION`    | Nombre, correo, teléfono, dirección, serial, barcode, etiqueta u otra representación comparable.       | candidato para revisión; nunca resolución oficial por sí sola                                |
| `E5_INFERENCIA`        | Fuzzy matching, recomendación estadística, heurística o modelo de IA.                                  | señal de investigación únicamente                                                            |

Una evidencia de nivel más alto no omite controles de clase, alcance, vigencia, autorización o conflicto.

#### 10. Orden determinista de resolución

1. Identificar sistema, integración, namespace, tipo de objeto y valor original sin transformar destructivamente la entrada.
2. Resolver el objeto/clase canónica que el contrato de integración pretende referenciar.
3. Comprobar si el contrato ya transporta una identidad interna válida; si es así, validar esa identidad y no fabricar un crosswalk innecesario.
4. Buscar una correspondencia `CONCILIADO` vigente por la coordenada externa completa.
5. Si existe exactamente una y no hay conflicto, resolver la identidad canónica declarada.
6. Si existen varias correspondencias activas incompatibles, marcar `CONFLICTO` y fallar cerrado.
7. Si no existe mapping vigente, evaluar claves de autoridad y claves empresariales permitidas para producir candidatos.
8. Aplicar normalización únicamente como representación de búsqueda y nunca como decisión.
9. Si no hay candidato suficiente, conservar `NO_CONCILIADO` con procedencia.
10. Si existe un candidato único pero la evidencia requiere revisión, conservar `CANDIDATO` hasta la decisión competente.
11. Si existen varios candidatos plausibles, conservar `AMBIGUO`.
12. El steward revisa claves, relaciones, vigencias, fuentes, historial y evidencia.
13. El propietario funcional decide cuando el caso excede la delegación del steward o cambia una identidad/materialidad gobernada.
14. La decisión de conciliación conserva evidencia, motivo, vigencia y relación con cualquier vínculo anterior.
15. Los consumidores reciben la identidad mediante el contrato aprobado; no replican la lógica de matching localmente.
16. Cualquier corrección posterior recorre impacto, linaje y reproducibilidad antes de alterar derivados oficiales.

#### 11. Vigencia, bitemporalidad de la decisión e historia

Toda correspondencia deberá distinguir al menos dos tiempos:

- **vigencia efectiva:** desde cuándo la clave externa representa la identidad dentro del contrato externo;
- **tiempo de conocimiento/decisión:** cuándo Vento recibió evidencia y aceptó, corrigió o retiró la correspondencia.

Esto permite responder preguntas distintas:

```text
¿QUÉ IDENTIDAD REPRESENTABA LA CLAVE SEGÚN SU VIGENCIA?
```

```text
¿QUÉ CORRESPONDENCIA CONOCÍA Y PODÍA USAR VENTO EN ESE MOMENTO?
```

Reglas:

- una correspondencia posterior no se inserta retroactivamente en el expediente como si siempre hubiera sido conocida;
- una corrección puede cambiar reconstrucciones actuales sin falsificar decisiones históricas;
- una clave externa reutilizada conserva intervalos distintos;
- una correspondencia retirada continúa resolviendo historia cuando el actor y la finalidad estén autorizados;
- el corte de una publicación determina qué mapping, evidencia y estado eran conocidos;
- la reconstrucción actual puede usar evidencia corregida, pero debe distinguirse de “como fue conocido/publicado”.

#### 12. Corrección, sustitución, fusión y separación

##### 12.1. Corrección de una correspondencia

Cuando un crosswalk estaba asociado al objeto incorrecto:

1. preservar el vínculo original;
2. registrar la evidencia que demuestra el error;
3. cerrar o superar su vigencia de uso según el caso;
4. crear la decisión corregida con la identidad adecuada;
5. identificar hechos, modelos, snapshots, reportes y decisiones potencialmente afectados mediante linaje;
6. no mover hechos históricos por aproximación;
7. ejecutar correcciones físicas únicamente mediante las tareas/paquetes autorizados;
8. evaluar reconstrucción o restatement conforme al contrato histórico cuando una salida oficial cambie.

##### 12.2. Fusión de maestros

La existencia de dos crosswalks hacia dos identidades internas parecidas no autoriza una fusión. La fusión continúa gobernada por `DATA-DOM-003` y exige demostrar que los registros representan la misma identidad dentro de la misma clase.

Cuando una fusión aprobada exista, los aliases externos de ambas identidades se conservan y se relacionan con la identidad superviviente de forma versionada, sin borrar qué identidad resolvían previamente.

##### 12.3. Separación de maestros

Una separación distribuye aliases y crosswalks únicamente con evidencia. No se redistribuyen hechos, pedidos, movimientos, sesiones, pagos, lotes o publicaciones por similitud.

##### 12.4. Reutilización externa

Si un proveedor reutiliza un código que antes identificaba otro objeto:

- la vigencia anterior se cierra;
- la nueva correspondencia conserva evidencia de reutilización;
- el historial anterior no se reasigna;
- la consulta histórica utiliza el intervalo aplicable;
- si el proveedor no ofrece evidencia temporal suficiente, la correspondencia queda `AMBIGUO` o `CONFLICTO`.

#### 13. Autorización, privacidad y seguridad

1. Un crosswalk no concede permiso para leer la identidad interna ni la clave externa.
2. La exposición de claves externas se somete a la autorización vigente por dominio, entidad, territorio y finalidad.
3. Documento, correo, teléfono y otros identificadores personales se minimizan y no se publican como códigos empresariales.
4. Una representación hash o tokenizada puede servir para comparación técnica cuando el contrato lo permita, pero no demuestra equivalencia por sí sola.
5. La evidencia de conciliación puede contener información sensible y hereda clasificación, retención y auditoría aplicables.
6. API key, client secret, access token, refresh token, certificado privado y service role son credenciales; **no** son claves externas de maestros.
7. Un proveedor externo nunca recibe autoridad de escritura directa sobre el maestro interno por existir un crosswalk.
8. Los logs de conciliación deben referenciar la evidencia sin registrar secretos completos ni ampliar la exposición de PII.
9. Un consumidor autorizado para un agregado no adquiere acceso a los identificadores externos de los sujetos subyacentes.
10. La historia de mappings se consulta bajo autorización vigente, no bajo el permiso histórico del actor que los creó.

#### 14. Matriz materializada por los 62 objetos

La matriz conserva exactamente el catálogo y estado heredados. La columna “Decisión de crosswalk” define qué puede aceptarse y qué queda prohibido para cada identidad; **no afirma que esas claves externas existan hoy**.

|    # | Objeto canónico               | Clase             | Fuente lógica heredada                  | Decisión de crosswalk                                                                                                                                                                                      | Estado         |
| ---: | ----------------------------- | ----------------- | --------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- |
|    1 | `ORGANIZATION_SCOPE`          | `DATO_MAESTRO`    | VISO                                    | Identificadores externos de organización se admiten solo con sistema, namespace, alcance y vigencia; no se deriva equivalencia desde nombre, titular, marca o sede.                                        | `ESPECIFICADO` |
|    2 | `LEGAL_SUBJECT`               | `DATO_MAESTRO`    | VISO                                    | Identificadores registrales o tributarios son claves externas de alta fuerza probatoria cuando la autoridad, jurisdicción y vigencia están acreditadas; nunca sustituyen la identidad interna.             | `ESPECIFICADO` |
|    3 | `BRAND`                       | `DATO_MAESTRO`    | VISO                                    | Identificadores de registro, plataforma o proveedor pueden vincularse como aliases con procedencia; nombre comercial, dominio web o similitud visual no bastan para conciliar identidad.                   | `ESPECIFICADO` |
|    4 | `COMMERCIAL_ESTABLISHMENT`    | `DATO_MAESTRO`    | VISO                                    | Matrículas y registros externos se concilian por autoridad, jurisdicción, alcance y vigencia; una denominación o dirección coincidente solo genera candidato.                                              | `ESPECIFICADO` |
|    5 | `BUSINESS_LINE`               | `DATO_MAESTRO`    | VISO                                    | Códigos externos de portafolio o clasificación requieren equivalencia semántica aprobada; una categoría externa no crea ni fusiona una línea de negocio.                                                   | `ESPECIFICADO` |
|    6 | `PHYSICAL_FACILITY`           | `DATO_MAESTRO`    | VISO con operación NEXO                 | Referencias catastrales, contractuales o de proveedor pueden ser claves externas con procedencia; dirección, coordenadas o nombre del inmueble no son identidad suficiente.                                | `ESPECIFICADO` |
|    7 | `OPERATIONAL_SITE`            | `DATO_MAESTRO`    | VISO                                    | Identificadores de tienda, sucursal o ubicación de terceros se mapean a la sede solo con alcance y evidencia; no se confunden con PHYSICAL_FACILITY, área o establecimiento.                               | `ESPECIFICADO` |
|    8 | `ORGANIZATIONAL_AREA`         | `DATO_MAESTRO`    | VISO                                    | Códigos de departamento o área externos se aceptan como aliases scoped; nombre, nivel jerárquico o centro de costo parecido no autoriza equivalencia.                                                      | `ESPECIFICADO` |
|    9 | `PHYSICAL_ZONE`               | `DATO_MAESTRO`    | NEXO con referencia VISO                | Códigos externos de zona se concilian dentro de la instalación o sede aplicable y con vigencia; la etiqueta espacial por sí sola no es identidad.                                                          | `ESPECIFICADO` |
|   10 | `WORKSTATION`                 | `DATO_MAESTRO`    | NEXO con contratos SHELL/AUTH-DEV       | Identificadores de terminal, estación o punto de proveedor son aliases de contexto; ENDPOINT, SHARED_DEVICE y etiquetas visibles permanecen identidades distintas.                                         | `ESPECIFICADO` |
|   11 | `EXTERNAL_OPERATIONAL_POINT`  | `DATO_MAESTRO`    | VISO con custodia NEXO                  | La referencia externa es admisible solo con fuente, finalidad, territorio, custodio y vigencia; no se promueve automáticamente a OPERATIONAL_SITE.                                                         | `ESPECIFICADO` |
|   12 | `PERSON_IDENTITY`             | `DATO_MAESTRO`    | VISO                                    | Documento, identificador de autenticación o autoridad puede aportar evidencia; correo, teléfono, nombre o usuario nunca resuelven por sí solos una fusión y toda conciliación sensible exige autorización. | `ESPECIFICADO` |
|   13 | `WORKER_PROFILE`              | `DATO_MAESTRO`    | VISO                                    | Identificadores de nómina, RR. HH. o plataforma laboral se vinculan al perfil y a PERSON_IDENTITY/vínculo correctos; no crean una persona nueva ni fusionan vínculos.                                      | `ESPECIFICADO` |
|   14 | `EMPLOYMENT_RELATIONSHIP`     | `DATO_MAESTRO`    | VISO                                    | Números de contrato, nómina o relación externos son aliases del vínculo exacto con vigencia; reingresos o vínculos distintos no se colapsan.                                                               | `ESPECIFICADO` |
|   15 | `CONTRACTUAL_POSITION`        | `DATO_REFERENCIA` | VISO                                    | Códigos de cargo de sistemas externos requieren equivalencia semántica y vigencia; nunca conceden permisos ni se mapean por etiqueta solamente.                                                            | `ESPECIFICADO` |
|   16 | `BASE_ROLE`                   | `DATO_REFERENCIA` | SHELL / modelo canónico de autorización | No se admite traducción automática de roles externos a BASE_ROLE por nombre o permisos aparentes; cualquier equivalencia debe provenir de un contrato de autorización aprobado.                            | `ESPECIFICADO` |
|   17 | `OPERATIONAL_ROLE`            | `DATO_REFERENCIA` | VISO con modelo de autorización         | Códigos externos de función operativa pueden ser aliases revisados; no crean herencia de permisos, jerarquía ni equivalencia con BASE_ROLE.                                                                | `ESPECIFICADO` |
|   18 | `WORK_ASSIGNMENT`             | `DATO_MAESTRO`    | VISO                                    | Identificadores de asignación o programación externos se concilian con persona, sede, área, función y vigencia; el solapamiento temporal se conserva como conflicto cuando corresponda.                    | `ESPECIFICADO` |
|   19 | `CUSTOMER_PERSON`             | `DATO_MAESTRO`    | PASS                                    | Identificadores CRM, marketplace o canal son aliases de cliente; correo, teléfono, documento, QR o cuenta autenticada no bastan para resolver identidad sin evidencia.                                     | `ESPECIFICADO` |
|   20 | `CUSTOMER_CONTACT`            | `DATO_MAESTRO`    | PASS                                    | Identificadores de contacto de proveedores pueden mapear el contacto exacto; el valor normalizado sirve para búsqueda/candidato, no para fusionar personas.                                                | `ESPECIFICADO` |
|   21 | `CUSTOMER_RELATIONSHIP`       | `DATO_MAESTRO`    | PASS                                    | Identificadores de relación, membresía o cuenta externa se concilian por persona, marca/alcance, tipo y vigencia; no equivalen a consentimiento.                                                           | `ESPECIFICADO` |
|   22 | `CUSTOMER_PROFILE`            | `DATO_MAESTRO`    | PASS                                    | Identificadores de perfil externo se vinculan al perfil exacto y a su persona/relación; cuenta técnica y CUSTOMER_PERSON permanecen separadas.                                                             | `ESPECIFICADO` |
|   23 | `CUSTOMER_PREFERENCE`         | `DATO_MAESTRO`    | PASS                                    | Identificadores de preferencia o canal externo se conservan con tipo, alcance y vigencia; preferencia no se reconcilia como consentimiento ni autorización.                                                | `ESPECIFICADO` |
|   24 | `LOYALTY_ACCOUNT`             | `DATO_MAESTRO`    | PASS                                    | Número visible, QR, token o identificador de programa externo son referencias rotables; la cuenta canónica y su ledger conservan identidad e historia propias.                                             | `ESPECIFICADO` |
|   25 | `LOYALTY_PROGRAM_RULE`        | `DATO_REFERENCIA` | PASS                                    | Códigos de regla o programa externos requieren versión, alcance y vigencia; versiones distintas no se fusionan por compartir descripción.                                                                  | `ESPECIFICADO` |
|   26 | `PRODUCTO_MAESTRO`            | `DATO_MAESTRO`    | NEXO                                    | SKU, barcode, identificador de proveedor o canal son aliases/crosswalks con namespace y vigencia; ningún código externo fusiona productos por sí solo.                                                     | `ESPECIFICADO` |
|   27 | `VARIANTE`                    | `DATO_MAESTRO`    | NEXO                                    | Identificador externo de variante se concilia dentro del PRODUCTO_MAESTRO y contexto aplicables; atributos o nombres similares solo generan candidato.                                                     | `ESPECIFICADO` |
|   28 | `PRESENTACION`                | `DATO_MAESTRO`    | NEXO                                    | SKU o código de empaque externo solo puede mapearse cuando cantidad, unidad, multiplicador, empaque, producto y contexto sean compatibles; etiqueta visible no basta.                                      | `ESPECIFICADO` |
|   29 | `UNIDAD_DE_MEDIDA`            | `DATO_REFERENCIA` | NEXO                                    | Código estándar o externo puede mapearse únicamente si dimensión y significado son equivalentes; símbolo o abreviatura coincidente no autoriza equivalencia.                                               | `ESPECIFICADO` |
|   30 | `TAXONOMIA_TIPO_MAESTRO`      | `DATO_REFERENCIA` | NEXO                                    | Taxonomías externas requieren correspondencia semántica explícita y versionada; códigos o etiquetas parecidas no se elevan automáticamente a equivalencia.                                                 | `ESPECIFICADO` |
|   31 | `TAXONOMIA_INVENTARIO`        | `DATO_REFERENCIA` | NEXO                                    | Clasificaciones externas de inventario se concilian por semántica, alcance y versión; comportamiento de stock similar no prueba identidad taxonómica.                                                      | `ESPECIFICADO` |
|   32 | `TAXONOMIA_OPERACIONAL`       | `DATO_REFERENCIA` | NEXO                                    | Clasificaciones operacionales externas se mapean de manera explícita; nombre, prefijo o posición jerárquica solo apoyan revisión.                                                                          | `ESPECIFICADO` |
|   33 | `LOC`                         | `DATO_MAESTRO`    | NEXO                                    | Identificadores WMS, bodega o ubicación externa se concilian dentro de sede/instalación y vigencia; etiqueta o camino textual no sustituyen la identidad LOC.                                              | `ESPECIFICADO` |
|   34 | `ACTIVO_FISICO`               | `DATO_MAESTRO`    | NEXO                                    | Serial, placa, fabricante o identificador patrimonial externo son claves auxiliares con procedencia; sustitución física y duplicidad registral no se resuelven por serial solamente.                       | `ESPECIFICADO` |
|   35 | `CLASE_DE_ACTIVO`             | `DATO_REFERENCIA` | NEXO                                    | Clases externas de activos requieren equivalencia semántica y versión; categoría parecida no reclasifica historia automáticamente.                                                                         | `ESPECIFICADO` |
|   36 | `ESPECIFICACION_PRODUCTO`     | `DATO_MAESTRO`    | NEXO; FOGO cuando corresponda           | Referencias de ficha, proveedor o documento externo se vinculan a la identidad raíz, versión, alcance y vigencia de la especificación; el texto del documento no es identidad.                             | `ESPECIFICADO` |
|   37 | `PROVEEDOR`                   | `DATO_MAESTRO`    | ORIGO                                   | Identificadores tributarios, registrales o de plataforma pueden ser claves externas fuertes cuando su autoridad y vigencia son verificables; nombre, banco, correo o contacto no bastan.                   | `ESPECIFICADO` |
|   38 | `CONTACTO_PROVEEDOR`          | `DATO_MAESTRO`    | ORIGO                                   | Identificador de contacto externo se concilia con la persona/canal y proveedor correctos; correo o teléfono repetidos no fusionan proveedores ni contactos sin evidencia.                                  | `ESPECIFICADO` |
|   39 | `RELACION_PRODUCTO_PROVEEDOR` | `DATO_MAESTRO`    | ORIGO                                   | Código de artículo del proveedor o identificador de relación externa mapea la relación producto–proveedor y su alcance; no convierte ese código en identidad global de PRODUCTO_MAESTRO.                   | `ESPECIFICADO` |
|   40 | `CONDICION_COMERCIAL`         | `DATO_MAESTRO`    | ORIGO                                   | Identificadores de contrato, lista o condición externa se concilian por proveedor/relación, tipo, alcance, versión y vigencia; importe o texto parecido no bastan.                                         | `ESPECIFICADO` |
|   41 | `TAXONOMIA_COMPRA`            | `DATO_REFERENCIA` | ORIGO                                   | Clasificaciones externas de abastecimiento requieren equivalencia semántica explícita; no se heredan automáticamente desde taxonomías de producto o inventario.                                            | `ESPECIFICADO` |
|   42 | `RECETA`                      | `DATO_MAESTRO`    | FOGO                                    | Identificadores externos de fórmula/receta se vinculan a la identidad raíz y versión; nombre, ingredientes o producto de salida parecidos no prueban equivalencia.                                         | `ESPECIFICADO` |
|   43 | `FAMILIA_PRODUCTIVA`          | `DATO_REFERENCIA` | FOGO                                    | Códigos externos de familia productiva requieren mapeo semántico y versión; no se confunden con categorías de producto, compra o menú.                                                                     | `ESPECIFICADO` |
|   44 | `RUTA_PRODUCTIVA`             | `DATO_MAESTRO`    | FOGO                                    | Códigos externos de proceso o routing pueden ser aliases de la definición y versión correctas; secuencia de pasos parecida no autoriza fusión.                                                             | `ESPECIFICADO` |
|   45 | `RECURSO_PRODUCTIVO`          | `DATO_MAESTRO`    | FOGO con referencia NEXO                | Identificadores externos de máquina/recurso pueden mapear el recurso funcional o relacionarlo con ACTIVO_FISICO; nunca fusionan ambas clases.                                                              | `ESPECIFICADO` |
|   46 | `COMMERCIAL_CHANNEL`          | `DATO_REFERENCIA` | PULSO                                   | Identificadores de marketplace, web, mensajería u otro proveedor se mapean al canal dentro del namespace y alcance correctos; compartir proveedor no fusiona canales.                                      | `ESPECIFICADO` |
|   47 | `CATEGORIA_COMERCIAL`         | `DATO_REFERENCIA` | PULSO                                   | Categorías externas de menú/marketplace se concilian por canal, marca/alcance, versión y semántica; etiqueta coincidente no basta.                                                                         | `ESPECIFICADO` |
|   48 | `OFERTA_COMERCIAL`            | `DATO_MAESTRO`    | PULSO                                   | Identificador de listing, menú u oferta externa mapea OFERTA_COMERCIAL con producto/variante, sede, canal y vigencia; no mapea directamente PRODUCTO_MAESTRO por conveniencia.                             | `ESPECIFICADO` |
|   49 | `CENTRO_DE_COSTO`             | `DATO_MAESTRO`    | NUMERA                                  | Código ERP/contable puede mapearse dentro de entidad, plan y vigencia; centro de costo no se reemplaza por sede, área, marca o canal aunque compartan código.                                              | `ESPECIFICADO` |
|   50 | `MONEDA`                      | `DATO_REFERENCIA` | NUMERA                                  | Código monetario de fuente autorizada puede resolver equivalencia semántica; símbolo o nombre parecido no basta y la fuente aplicable se conserva.                                                         | `ESPECIFICADO` |
|   51 | `PERIODO_ECONOMICO`           | `DATO_REFERENCIA` | NUMERA                                  | Identificadores externos de periodo se concilian por calendario, alcance, inicio/fin y vigencia; compartir fechas no implica identidad.                                                                    | `ESPECIFICADO` |
|   52 | `PERIODO_CONTABLE`            | `DATO_REFERENCIA` | NUMERA o sistema contable autorizado    | Código o referencia del sistema contable se conserva con fuente, entidad, calendario y vigencia; no se confunde con PERIODO_ECONOMICO.                                                                     | `ESPECIFICADO` |
|   53 | `PERIODO_FISCAL`              | `DATO_REFERENCIA` | NUMERA con autoridad externa aplicable  | Referencia fiscal externa se mapea únicamente dentro de autoridad, jurisdicción, calendario y vigencia aplicables; fechas iguales no fusionan periodos.                                                    | `ESPECIFICADO` |
|   54 | `CLASIFICACION_ECONOMICA`     | `DATO_REFERENCIA` | NUMERA                                  | Código de plan de cuentas o clasificación externa requiere estándar/versión, entidad y semántica; no reclasifica hechos históricos sin proceso gobernado.                                                  | `ESPECIFICADO` |
|   55 | `PERFIL_DE_MARCA`             | `DATO_MAESTRO`    | AURA objetivo                           | Se define la política futura de aliases, pero no se admite crosswalk operativo ni equivalencia productiva mientras la fuente AURA permanezca diferida.                                                     | `BLOQUEADO`    |
|   56 | `AUDIENCIA`                   | `DATO_MAESTRO`    | AURA objetivo                           | Identificadores de audiencia externos podrán mapear definiciones cuando exista fuente habilitada, finalidad y versión; listas o membresías coincidentes nunca prueban identidad.                           | `BLOQUEADO`    |
|   57 | `ACTIVO_DE_MARCA`             | `DATO_MAESTRO`    | AURA objetivo                           | Identificadores de Storage o proveedor serán referencias técnicas con procedencia; no existe crosswalk operativo habilitado mientras AURA permanezca diferida.                                             | `BLOQUEADO`    |
|   58 | `ENDPOINT`                    | `DATO_MAESTRO`    | BLOQUE Z / TI-DOM-002                   | endpoint_id permanece identidad canónica; IDs de MDM/proveedor pueden ser aliases. Hostname, IP, MAC, serial, user agent o fingerprint no bastan para fusionar endpoints.                                  | `ESPECIFICADO` |
|   59 | `SHARED_DEVICE`               | `DATO_MAESTRO`    | SHELL / AUTH-DEV                        | device_id permanece identidad y device_code código empresarial; identificadores de kiosk/proveedor son aliases con vigencia y no sustituyen endpoint, activo, estación ni actor.                           | `ESPECIFICADO` |
|   60 | `NETWORK_RESOURCE`            | `DATO_MAESTRO`    | BLOQUE Z                                | Identificadores de proveedor o inventario de red pueden ser aliases; IP, MAC, SSID, hostname o puerto son atributos observables y no identidad suficiente.                                                 | `ESPECIFICADO` |
|   61 | `APPLICATION`                 | `DATO_MAESTRO`    | SHELL                                   | app_code permanece identidad canónica legible; IDs OAuth/proveedor/plataforma pueden ser aliases. Repositorio, URL, ambiente, despliegue o proveedor no identifican la aplicación.                         | `ESPECIFICADO` |
|   62 | `TECH_SERVICE`                | `DATO_REFERENCIA` | BLOQUE Z / TI-DOM-001                   | TI-SERVICE-001 a TI-SERVICE-011 permanecen identidades canónicas; códigos de catálogo/proveedor solo pueden mapearse como aliases y nunca renumerar o fusionar familias.                                   | `ESPECIFICADO` |

#### 15. Casos de identidad que requieren protección reforzada

##### 15.1. Persona administrada y cliente

`PERSON_IDENTITY` y `CUSTOMER_PERSON` pueden representar a la misma persona natural en contextos distintos, pero son clases canónicas diferentes. Un documento, correo o teléfono coincidente puede sostener una relación revisada entre ambas identidades cuando exista finalidad y autorización, pero **nunca** una fusión automática entre clases.

##### 15.2. Producto, variante, presentación y unidad

Un SKU de proveedor, barcode o listing puede referir a una oferta, variante, presentación o relación producto–proveedor según su contrato. El crosswalk debe declarar el objeto exacto. Queda prohibido mapear todo código externo directamente a `PRODUCTO_MAESTRO` para simplificar joins.

##### 15.3. Sede, instalación, área, zona, LOC y estación

Una dirección, código de tienda o etiqueta de bodega no determina por sí sola si el objeto es `OPERATIONAL_SITE`, `PHYSICAL_FACILITY`, `ORGANIZATIONAL_AREA`, `PHYSICAL_ZONE`, `LOC` o `WORKSTATION`. La clase forma parte obligatoria de la correspondencia.

##### 15.4. Activo, endpoint y dispositivo compartido

`ACTIVO_FISICO`, `ENDPOINT` y `SHARED_DEVICE` se relacionan, pero no son la misma identidad. Serial, MAC, IP o fingerprint solo pueden apoyar conciliación. Se conservan `endpoint_id`, `device_id` y `device_code` según sus contratos.

##### 15.5. Aplicación

`APPLICATION` conserva `app_code`. IDs OAuth, IDs de tienda, dominios, URLs, repositorios, ambientes y despliegues pueden relacionarse con la aplicación mediante contratos específicos, pero no sustituyen su identidad.

##### 15.6. TECH_SERVICE

Se preservan las once identidades vigentes:

| Identidad        | Servicio                                                                | Decisión                                                                                                                 | Estado         |
| ---------------- | ----------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ | -------------- |
| `TI-SERVICE-001` | Cuentas, identidad y acceso tecnológico                                 | Identidad canónica preservada; cualquier código externo solo puede existir como alias scoped, versionado y reconciliado. | `ESPECIFICADO` |
| `TI-SERVICE-002` | Endpoints, computadores, celulares, tabletas y dispositivos compartidos | Identidad canónica preservada; cualquier código externo solo puede existir como alias scoped, versionado y reconciliado. | `ESPECIFICADO` |
| `TI-SERVICE-003` | Redes y conectividad                                                    | Identidad canónica preservada; cualquier código externo solo puede existir como alias scoped, versionado y reconciliado. | `ESPECIFICADO` |
| `TI-SERVICE-004` | Impresoras y periféricos                                                | Identidad canónica preservada; cualquier código externo solo puede existir como alias scoped, versionado y reconciliado. | `ESPECIFICADO` |
| `TI-SERVICE-005` | Aplicaciones, ambientes y proveedores tecnológicos                      | Identidad canónica preservada; cualquier código externo solo puede existir como alias scoped, versionado y reconciliado. | `ESPECIFICADO` |
| `TI-SERVICE-006` | Solicitudes de soporte tecnológico                                      | Identidad canónica preservada; cualquier código externo solo puede existir como alias scoped, versionado y reconciliado. | `ESPECIFICADO` |
| `TI-SERVICE-007` | Incidentes y restauración tecnológica                                   | Identidad canónica preservada; cualquier código externo solo puede existir como alias scoped, versionado y reconciliado. | `ESPECIFICADO` |
| `TI-SERVICE-008` | Cambios, configuración y versiones tecnológicas                         | Identidad canónica preservada; cualquier código externo solo puede existir como alias scoped, versionado y reconciliado. | `ESPECIFICADO` |
| `TI-SERVICE-009` | Pruebas y aceptación técnica de soluciones                              | Identidad canónica preservada; cualquier código externo solo puede existir como alias scoped, versionado y reconciliado. | `ESPECIFICADO` |
| `TI-SERVICE-010` | Licencias, garantías, contratos y costos tecnológicos                   | Identidad canónica preservada; cualquier código externo solo puede existir como alias scoped, versionado y reconciliado. | `ESPECIFICADO` |
| `TI-SERVICE-011` | Conocimiento, capacitación y adopción tecnológica                       | Identidad canónica preservada; cualquier código externo solo puede existir como alias scoped, versionado y reconciliado. | `ESPECIFICADO` |

**Reconciliación TECH_SERVICE:** 11 esperadas; 11 preservadas; 0 faltantes; 0 duplicadas; 0 renumeradas.

#### 16. Sistemas externos concretos y límite de evidencia

Las fuentes canónicas actuales reservan `INT-EXT-001` para inventariar sistemas externos y `INT-EXT-013` para definir cada mapeo proveedor-específico. Mientras ese inventario no exista, esta tarea no puede afirmar de forma responsable:

- qué proveedores entregan identificadores para cada uno de los 62 objetos;
- qué namespaces reales utiliza cada API, archivo, webhook o plataforma;
- qué claves son globales o scoped en cada proveedor;
- qué IDs han sido efectivamente conciliados en datos reales;
- qué mappings históricos ya existen físicamente;
- qué payload concreto constituye evidencia suficiente por proveedor.

La ausencia de ese inventario **no** deja incompleto el contrato transversal. La decisión material para cualquier clave externa recibida queda definida:

```text
SIN MAPPING VIGENTE VERIFICABLE
→ conservar origen y valor
→ NO_CONCILIADO
→ resolver objeto y namespace
→ evaluar evidencia
→ CANDIDATO / AMBIGUO / CONFLICTO
→ revisión competente
→ CONCILIADO solo con decisión trazable
```

Handoffs exactos:

| Necesidad                                                             | Propietario documental | Condición de salida                                                            |
| --------------------------------------------------------------------- | ---------------------- | ------------------------------------------------------------------------------ |
| inventario de sistemas externos, proveedores, propietario y finalidad | `INT-EXT-001`          | antes de declarar cobertura proveedor-específica completa                      |
| contrato de entrada/salida de cada integración                        | `INT-EXT-009`          | antes de interpretar campos o namespaces de un proveedor concreto              |
| mapeo de identificadores externos y canónicos por integración         | `INT-EXT-013`          | antes de declarar un mapping proveedor-específico operativo                    |
| conservación controlada del payload original                          | `INT-EXT-014`          | antes de depender del payload como evidencia reproducible                      |
| auditoría, métricas, alertas y conciliación por integración           | `INT-EXT-017`          | antes de declarar operación controlada y observable de la conciliación externa |
| ingestión, replay, backfill, transformación y reconciliación de datos | `DATA-DOM-006`         | antes de ejecutar correcciones o reconstrucciones físicas de datos             |
| calidad/certificación de la fuente y del dato reconciliado            | `DATA-DOM-007`         | antes de declarar aptitud oficial del resultado dependiente                    |
| impacto histórico, reconstrucción y restatement                       | `DATA-DOM-017`         | antes de reexpresar una publicación afectada por una corrección de identidad   |

No se crea una tarea nueva ni queda un pendiente sin propietario exacto.

#### 17. Consumo por la capa semántica

La capa definida en `DATA-INT-002` deberá consumir la identidad así:

```text
HECHO / FUENTE
→ clave interna canónica, cuando exista
→ si solo existe clave externa: crosswalk vigente y autorizado
→ identidad canónica resuelta
→ dimensión efectiva aplicable
→ modelo / métrica / consulta
```

Reglas:

- un join oficial no usa nombre, etiqueta, correo, SKU externo o texto normalizado como sustituto del crosswalk;
- `NO_CONCILIADO`, `AMBIGUO`, `CONFLICTO` o `BLOQUEADO` permanecen visibles como limitación de calidad/cobertura;
- una fila no conciliada no se descarta silenciosamente para mejorar un porcentaje de cobertura;
- tampoco se asigna a un miembro “desconocido” como si esa identidad fuera real; si una representación técnica de desconocido es necesaria, debe permanecer distinguible del maestro;
- la corrección de un crosswalk invalida/reconstruye únicamente derivados alcanzados por linaje;
- caché, snapshot y modelo no adquieren autoridad sobre el mapping;
- una métrica dependiente de una población incompleta conserva la limitación de calidad correspondiente;
- comparar periodos exige resolver la vigencia de mappings y dimensiones aplicable a cada hecho.

#### 18. Reglas para archivos importados y cargas controladas

Cuando una fuente externa llegue mediante archivo, exportación u otra carga controlada:

1. el archivo/lote y su procedencia permanecen identificables;
2. el valor original de la clave no se corrige destructivamente antes de conciliación;
3. la normalización se almacena o calcula como representación separada;
4. cada fila conserva la decisión de mapping utilizada o su estado no conciliado;
5. una fila con identidad ambigua no se asigna al primer resultado de búsqueda;
6. volver a cargar el mismo archivo no debe producir mappings divergentes por orden de procesamiento;
7. una corrección del proveedor no borra la evidencia anterior;
8. el archivo no se convierte en fuente de verdad del maestro;
9. si faltan namespace, alcance o versión necesarios, la fila queda no conciliada o bloqueada según el contrato;
10. la promoción a uso oficial requiere la calidad y autorización correspondientes.

#### 19. Reconciliación de cobertura

| Control                                        |   Resultado |
| ---------------------------------------------- | ----------: |
| Objetos esperados                              |      **62** |
| Objetos con decisión de crosswalk              |      **62** |
| Faltantes                                      |       **0** |
| Duplicados por objeto canónico                 |       **0** |
| Datos maestros                                 |      **43** |
| Datos de referencia                            |      **19** |
| Objetos `ESPECIFICADO`                         |      **59** |
| Objetos `BLOQUEADO`                            |       **3** |
| Objetos AURA habilitados por esta tarea        |       **0** |
| Identidades TECH_SERVICE esperadas/preservadas | **11 / 11** |
| Estados de vínculo definidos                   |       **8** |
| Niveles de evidencia definidos                 |       **6** |
| Coordenadas mínimas definidas                  |      **30** |
| Fusiones automáticas autorizadas               |       **0** |
| Fusiones entre clases distintas autorizadas    |       **0** |
| Mappings proveedor-específicos inventados      |       **0** |
| Fuentes de verdad transferidas                 |       **0** |
| Cambios físicos                                |       **0** |
| Requisitos de prueba creados/modificados       |       **0** |

No se declara un número de crosswalks físicos existentes ni un porcentaje de conciliación real porque las fuentes consumidas no aportan un inventario proveedor-específico completo y verificable. Declarar esa cifra exigiría inventar evidencia.

#### 20. Cobertura por requisitos vigentes

La conducta de esta tarea ya está protegida por requisitos canónicos vigentes:

- `TREQ-DATA-001` cubre identificador estable, claves empresariales y externas, jerarquías, vigencia, fusión/separación, historia efectiva y crosswalks, y asigna responsabilidad a esta tarea;
- `TREQ-DATA-003` cubre contratos de origen, claves, integridad referencial, duplicados, correcciones, cuarentena, reconciliación y linaje, incluyendo esta tarea entre sus responsables;
- `TREQ-INTEGRATION-006` cubre fuente propietaria única, propagación por contratos y resolución trazable de fuentes competidoras o conciliaciones.

El contrato actual especializa y materializa esas obligaciones sin cambiar regla, prioridad, modalidad, estado, relación ni destino de implementación de ningún requisito existente.

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** las reglas de identidad, claves externas, crosswalks, reconciliación, historia, fuentes competidoras y linaje ya están protegidas por requisitos canónicos vigentes que asignan esta responsabilidad al dominio DATA y a sus integraciones. La tarea materializa el diseño documental sin introducir una conducta ejecutable nueva, cambiar un contrato físico o ejecutar una corrección de datos.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

#### 21. Criterios de aceptación

1. la tarea conserva el gobierno federado y ninguna clave externa transfiere la fuente de verdad;
2. identificador canónico, clave empresarial, clave técnica, código, alias y clave externa permanecen conceptos distintos;
3. un crosswalk representa una correspondencia gobernada y nunca una nueva identidad empresarial;
4. se materializan decisiones para 62 de 62 objetos del catálogo;
5. los 62 nombres canónicos aparecen exactamente una vez en la matriz;
6. se conservan exactamente 43 datos maestros y 19 datos de referencia;
7. se conservan exactamente 59 objetos ESPECIFICADO y 3 BLOQUEADO;
8. PERFIL_DE_MARCA, AUDIENCIA y ACTIVO_DE_MARCA conservan el bloqueo heredado;
9. no se declara operativa ninguna fuente AURA inexistente;
10. se preservan las once identidades TI-SERVICE-001 a TI-SERVICE-011 sin renumeración;
11. endpoint_id continúa siendo identidad canónica de ENDPOINT;
12. device_id y device_code conservan sus funciones distintas en SHARED_DEVICE;
13. app_code continúa siendo la identidad canónica legible de APPLICATION;
14. un sistema externo y su namespace forman parte obligatoria de la coordenada de una clave externa;
15. el valor original recibido se conserva separado de cualquier representación normalizada;
16. la normalización solo apoya búsqueda y comparación y no crea equivalencia;
17. cada correspondencia declara objeto canónico y clase compatibles;
18. una correspondencia declara alcance cuando la clave no es global dentro de su sistema de origen;
19. cada correspondencia declara vigencia efectiva y tiempo de decisión;
20. la historia de una correspondencia retirada o sustituida permanece resoluble;
21. una misma clave externa activa no puede resolver simultáneamente dos identidades canónicas dentro de la misma coordenada;
22. un mismo objeto canónico puede tener múltiples aliases externos de sistemas distintos sin duplicar identidad;
23. una relación muchos-a-muchos empresarial no se representa como crosswalk de identidad;
24. una correspondencia entre clases canónicas distintas se representa como relación tipada, no como fusión;
25. PERSON_IDENTITY y CUSTOMER_PERSON nunca se fusionan mediante crosswalk;
26. PRODUCTO_MAESTRO, VARIANTE, PRESENTACION y UNIDAD_DE_MEDIDA permanecen separados;
27. OPERATIONAL_SITE y PHYSICAL_FACILITY permanecen separados;
28. ACTIVO_FISICO, ENDPOINT y SHARED_DEVICE permanecen separados;
29. BASE_ROLE no se deriva de un rol externo por similitud de nombre o permisos aparentes;
30. correo, teléfono, nombre, dirección, serial, IP, MAC, SSID, URL y barcode no bastan por sí solos para conciliar identidad;
31. la evidencia de una autoridad externa conserva autoridad, jurisdicción y vigencia cuando corresponda;
32. una primera correspondencia de clave externa fuerte requiere la decisión de reconciliación aplicable y no se autoconsagra por unicidad aparente;
33. una correspondencia previamente conciliada puede resolverse de forma determinista solo mientras continúen válidos sistema, namespace, objeto, alcance, vigencia y ausencia de conflicto;
34. una coincidencia de clave empresarial no aprobada solo genera candidato;
35. una coincidencia normalizada o fuzzy solo genera candidato y nunca fusión automática;
36. una sugerencia algorítmica o de IA nunca decide equivalencia por sí sola;
37. CONFLICTO y AMBIGUO fallan cerrados para usos oficiales;
38. NO_CONCILIADO no se interpreta como ausencia del objeto ni como cero;
39. la cuarentena de una clave externa conserva el payload o evidencia necesaria según el contrato propietario;
40. la corrección de una correspondencia no sobrescribe la decisión anterior;
41. la reasignación legítima de una clave externa reutilizada por su emisor cierra una vigencia y abre otra con evidencia;
42. los hechos históricos resuelven la correspondencia efectiva pertinente al hecho, corte y versión aplicables;
43. una corrección tardía se propaga mediante linaje y evaluación de impacto, no mediante edición silenciosa de hechos;
44. un restatement conserva original y reexpresión cuando la corrección altera una publicación oficial;
45. la fusión de identidades sigue exigiendo evidencia, stewardship y autoridad del dominio propietario;
46. la separación de identidades conserva procedencia, aliases y hechos sin reatribución aproximada;
47. el steward puede revisar y proponer pero no adquiere por ello autorización técnica o autoridad universal;
48. el propietario funcional resuelve conflictos que exceden la delegación del steward;
49. el consumidor no puede crear un crosswalk local que compita con la decisión gobernada;
50. la capa semántica consume únicamente identidades reconciliadas o conserva explícitamente el estado no conciliado;
51. un join analítico no puede usar nombre o código externo como sustituto del crosswalk gobernado;
52. la autorización se evalúa antes de exponer claves externas, candidatos, conflictos o evidencia;
53. las claves con PII se minimizan y no se reutilizan como identificadores empresariales por conveniencia;
54. un secreto, token de acceso o credencial de integración nunca se almacena ni modela como clave externa de maestro;
55. los logs y evidencias no deben convertir valores sensibles en un nuevo canal de exposición;
56. una exportación no se convierte en fuente de verdad ni en registro de crosswalk;
57. la conciliación de un archivo importado conserva archivo/lote/origen y no convierte la fila importada en autoridad;
58. las integraciones proveedor-específicas se inventarían solo si existiera evidencia; esta tarea no fabrica sistemas, namespaces ni mappings;
59. INT-EXT-001 conserva la responsabilidad de inventariar sistemas externos concretos;
60. INT-EXT-013 conserva la responsabilidad de definir el mapeo proveedor-específico de identificadores externos y canónicos;
61. INT-EXT-014 conserva la responsabilidad sobre conservación controlada de payload original;
62. INT-EXT-017 conserva auditoría, métricas, alertas y conciliación de cada integración externa;
63. DATA-DOM-006 conserva ingestión, replay, backfill, transformación y reconciliación de datos;
64. DATA-DOM-007 conserva calidad y certificación y un crosswalk no eleva calidad por sí mismo;
65. DATA-DOM-017 conserva reconstrucción, corrección histórica, impacto y restatement;
66. DATA-AUTH-001 conserva la construcción del conjunto autorizado antes de cualquier consumo analítico;
67. DATA-AUTH-003 conserva segregación de capacidades sobre definición, certificación, publicación y administración;
68. DATA-INT-002 consume crosswalks sin convertir modelos, caché o snapshots en autoridad;
69. la tarea no prescribe tabla, schema, UUID, índice, constraint, trigger, función, RPC ni forma física;
70. la tarea no ejecuta DDL, DML, migraciones, backfills, merges, splits ni correcciones productivas;
71. no se crea, modifica, difiere, descarta ni vuelve obsoleto ningún requisito de prueba;
72. la cobertura preexistente de requisitos DATA e INTEGRATION permanece suficiente para este contrato;
73. no se declara validada ninguna correspondencia real que no tenga evidencia verificable;
74. no se declara un conteo de instancias de crosswalk existente sin inventario canónico ejecutado;
75. la ausencia de mapping verificable se conserva como estado explícito y con propietario de resolución;
76. cada conflicto tiene propietario documental o de integración exacto y condición de salida;
77. no queda un pendiente narrativo sin destino cuando surge de esta definición;
78. la siguiente tarea permanece únicamente reservada;
79. DATA-INT-004 no se inicia ni se modifica en esta tarea;
80. la implementación física continúa prohibida durante la fase documental actual;
81. el archivo contiene una sola tarea canónica y su continuidad inmediata;
82. la matriz de objetos conserva cero duplicados y cero faltantes;
83. las once familias TECH_SERVICE conservan cero duplicados y cero faltantes;
84. el contrato de resolución fail closed impide usar candidatos ambiguos como claves de join oficial;
85. la historia conserva tanto la clave externa observada entonces como la reconciliación conocida entonces;
86. una reconciliación posterior no falsifica que una decisión histórica pudo haberse tomado con identidad no resuelta;
87. las correcciones de crosswalk que afecten modelos analíticos obligan a reevaluar caché/snapshot por linaje, sin transferir autoridad;
88. las claves externas pueden ser muchas por identidad canónica, pero cada una conserva su procedencia y alcance propios;
89. una clave externa retirada no se reutiliza internamente como si siempre hubiera representado la identidad nueva;
90. un crosswalk aprobado no autoriza escritura directa del sistema externo sobre la fuente interna;
91. el adaptador externo sigue obligado a validar, transformar, mapear, deduplicar y auditar antes de afectar dominios;
92. los contratos de eventos y lecturas de DATA-INT-001 conservan la identidad canónica y no dependen de aliases locales;
93. la conciliación de identidades no cambia por sí sola la semántica de una métrica ni crea una fórmula nueva;
94. la correspondencia de periodos, monedas y taxonomías exige equivalencia semántica además de coincidencia de código;
95. el vínculo de OFERTA_COMERCIAL externa no se colapsa con PRODUCTO_MAESTRO;
96. el código de artículo de proveedor se concilia con RELACION_PRODUCTO_PROVEEDOR cuando corresponda y no se promueve a SKU global sin contrato;
97. los identificadores de marketplace se scoped a su canal, cuenta, marca o contexto cuando el proveedor lo requiera;
98. una clave de autenticación empresarial se mantiene separada de la credencial secreta usada por una integración;
99. la tarea queda documentalmente completa aunque el inventario proveedor-específico aún no exista, porque define la decisión transversal y el tratamiento de cada objeto sin fingir instancias.

#### 22. Límites de la tarea

Esta tarea **sí** define completamente:

- el significado y la autoridad de un crosswalk;
- la coordenada lógica de una clave externa;
- estados de conciliación;
- niveles de evidencia;
- cardinalidad y unicidad;
- procedimiento fail closed de resolución;
- vigencia e historia;
- corrección, sustitución, fusión y separación;
- protección de PII y credenciales;
- decisión individual para 62 objetos;
- preservación de 11 TECH_SERVICE;
- handoffs proveedor-específicos con propietario exacto.

Esta tarea **no** ejecuta:

- inventario real de proveedores aún no materializado por su tarea propietaria;
- mapping concreto de IDs de una API/plataforma no inventariada;
- migración o creación física de estructura de crosswalk;
- escritura o corrección productiva de maestros;
- merge o split de registros;
- backfill o replay;
- reatribución de hechos;
- restatement;
- cambio de autorización;
- alta de secretos o credenciales;
- creación de endpoints o adaptadores.

Estas exclusiones son fronteras de fase y no reducen el resultado documental de DATA-INT-003.

#### 23. Continuidad

ÚLTIMA TAREA APROBADA
`DATA-INT-002 — Definir capa semántica, modelos analíticos, snapshots, caché, consultas y rendimiento`

TAREA ACTUAL APROBADA
`DATA-INT-003 — Definir crosswalks, claves externas, identidad y reconciliación de datos maestros`

SIGUIENTE TAREA RESERVADA
`DATA-INT-004 — Definir integración controlada con BI, hojas de cálculo, modelos analíticos e inteligencia artificial`


### [ ] DATA-INT-004 — Definir integración controlada con BI, hojas de cálculo, modelos analíticos e inteligencia artificial
