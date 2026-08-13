### MINI-BLOQUE — PRODUCCION E INVENTARIO

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **produccion e inventario** dentro de **X INTEGRACIONES**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `INT-PROD-001` a `INT-PROD-005` — 5 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `INT-PROD-001`: Definir contrato para que FOGO solicite o reserve insumos
- `INT-PROD-002`: Definir contrato para que NEXO registre el consumo
- `INT-PROD-003`: Definir contrato para que FOGO finalice el lote
- `INT-PROD-004`: Definir contrato para que NEXO registre el producto terminado
- `INT-PROD-005`: Definir tratamiento de producción insuficiente para remisiones
<!-- PLAN-SECTION-META:END -->

### ✅ INT-PROD-001 — Definir contrato para que FOGO solicite o reserve insumos

**Estado:** APROBADA  
**Tarea anterior:** `INT-PROC-005 — Definir control que evite una recepción duplicada`  
**Tarea siguiente:** `INT-PROD-002 — Definir contrato para que NEXO registre el consumo`  
**Tipo de tarea:** documental; definición contractual de solicitud, validación y reserva de materiales entre FOGO y NEXO, sin implementación física, migraciones, cambios de datos, despliegue ni modificación de Supabase  
**Línea base documental:** `vento-shell@5e652947bbcf9820c916ef8385d32984aee787f3`  
**Aplicaciones involucradas:** `FOGO`, `NEXO` y `SHELL`; `ORIGO`, `NUMERA`, `VISO`, `PULSO` y `PASS` únicamente cuando una dependencia canónica ya aprobada aporte una señal o consuma un resultado  
**Cambios físicos autorizados:** ninguno

---

#### 1. Propósito

Definir de forma inequívoca cómo una orden productiva de FOGO obtiene disponibilidad material verificable sin convertir a FOGO en propietaria del inventario ni permitir que una solicitud se confunda con una reserva, un consumo o un movimiento físico.

La regla raíz es:

```text
ORDEN PRODUCTIVA AUTORIZADA EN FOGO
+
VERSIÓN EXACTA DE RECETA
+
REQUERIMIENTOS MATERIALES DETERMINADOS
        ↓
SOLICITUD CORRELACIONADA A NEXO
        ↓
VALIDACIÓN AUTORITATIVA DE NEXO
        ↓
RESERVA FÍSICA CONFIRMADA POR NEXO
        ↓
FOGO PUEDE CONSIDERAR EL MATERIAL PREPARABLE
        ↓
EL CONSUMO QUEDA RESERVADO A INT-PROD-002
```

La tarea elimina las siguientes ambigüedades:

1. `VPROC-0034.MATERIALS_RESERVING` es un estado de preparación del proceso productivo de FOGO y no convierte a FOGO en propietaria de la reserva física;
2. `VPROC-0025.STOCK_OPERATION_REQUESTED` demuestra que NEXO recibió una operación de existencias válida, pero todavía no demuestra reserva;
3. `VPROC-0025.RESERVED` es el hecho autoritativo de que una cantidad quedó apartada en NEXO;
4. reserva no equivale a retiro, consumo, traslado, posting ni conciliación final;
5. disponibilidad observada no equivale a disponibilidad reservada;
6. una lectura de stock obtenida por FOGO no autoriza a descontar, apartar ni seleccionar existencias por fuera del proceso propietario de NEXO;
7. una reserva confirmada no autoriza por sí sola el inicio de producción si faltan las demás condiciones de `VPROC-0034`;
8. ninguna corrección de cantidad puede sobrescribir silenciosamente la solicitud o reserva anterior.

---

#### 2. Alcance funcional

Esta tarea gobierna exclusivamente el tramo comprendido entre una orden productiva autorizada y la confirmación de reserva de los materiales necesarios para prepararla.

Incluye:

- derivación de requerimientos materiales desde la orden y la versión exacta de receta;
- construcción de la solicitud de materiales que FOGO entrega a NEXO;
- validación autoritativa de existencia, unidad, conversión, lote, ubicación, condición y autoridad en NEXO;
- reserva total o parcial de existencias;
- tratamiento de faltantes y restricciones;
- sustituciones autorizadas;
- concurrencia entre órdenes que compiten por la misma existencia;
- idempotencia, respuesta perdida, reintento y resultado incierto;
- cancelación de trabajo todavía no consumido;
- conciliación entre requerimiento productivo, solicitud y reserva;
- auditoría y evidencia de todo el handoff.

No incluye:

- consumo efectivo de ingredientes, que corresponde a `INT-PROD-002`;
- finalización de lote, que corresponde a `INT-PROD-003`;
- ingreso de producto terminado, que corresponde a `INT-PROD-004`;
- tratamiento de producción insuficiente para remisiones, ya definido en `INT-PROD-005`;
- creación o modificación de recetas;
- aprobación o publicación de planes productivos;
- decisión de calidad;
- creación de movimientos alternos de inventario fuera de NEXO;
- implementación de tablas, funciones, RPC, triggers, políticas RLS, colas, jobs o adaptadores.

---

#### 3. Dependencias canónicas preservadas

El contrato consume sin reinterpretación las siguientes decisiones ya aprobadas:

- `VPROC-0033` como proceso FOGO de planificación productiva;
- `VPROC-0034` como proceso FOGO de preparación de materiales y ejecución contra una versión aprobada;
- `VPROC-0025` como proceso NEXO de retiro, consumo o traslado de existencias;
- `VPROC-0016` como origen de la versión de receta publicada;
- `EVENT-ENVELOPE-001` como sobre transversal de identidad, contexto, correlación e idempotencia;
- el contrato transversal de idempotencia de `INT-APP-004`;
- el contrato transversal de reintentos de `INT-APP-005`;
- la prohibición de escrituras cruzadas de `INT-APP-010`;
- las fronteras de propiedad y cantidades ya congeladas por `INT-PROD-005` para el vínculo producción–inventario.

No se crea un proceso paralelo para reservar materiales y no se crea un segundo ledger de existencias en FOGO.

---

#### 4. Propiedad empresarial

| Elemento                                                            | Propietaria                    | Regla obligatoria                                                                                 |
| ------------------------------------------------------------------- | ------------------------------ | ------------------------------------------------------------------------------------------------- |
| orden productiva, versión y estado de ejecución                     | `FOGO`                         | FOGO conserva la autoridad sobre qué se pretende producir y en qué versión                        |
| receta y versión aplicada                                           | `FOGO`                         | la ejecución utiliza una versión publicada, estable y trazable                                    |
| requerimiento material derivado de la orden                         | `FOGO`                         | FOGO calcula qué material requiere la orden según receta, escala y reglas aprobadas               |
| stock físico                                                        | `NEXO`                         | NEXO conserva cantidad, ubicación, lote, condición, disponibilidad y custodia                     |
| reserva física                                                      | `NEXO`                         | únicamente NEXO puede afirmar que una cantidad está reservada                                     |
| selección autoritativa de existencia física                         | `NEXO`                         | lote, LOC, LPN, condición y cantidad aplicable se validan en el dominio de inventario             |
| sustitución de ingrediente de receta                                | `FOGO` con autoridad aplicable | no puede decidirla NEXO por conveniencia de stock                                                 |
| sustitución física compatible dentro de la operación de existencias | `NEXO`                         | debe respetar producto, presentación, unidad, política y cualquier restricción productiva vigente |
| contratos compartidos y compatibilidad                              | `SHELL`                        | SHELL no fabrica hechos de producción ni de inventario                                            |
| consumo real                                                        | `NEXO`, por contrato posterior | se desarrolla en `INT-PROD-002`                                                                   |

Regla de segregación:

```text
FOGO DEFINE LA NECESIDAD PRODUCTIVA
NEXO DEFINE LA RESERVA FÍSICA
FOGO CONSUME LA CONFIRMACIÓN DE RESERVA
NINGUNA DE LAS DOS APLICACIONES FABRICA EL HECHO DE LA OTRA
```

---

#### 5. Semántica obligatoria de solicitud, reserva y consumo

| Concepto               | Qué demuestra                                                                                | Qué no demuestra                             |
| ---------------------- | -------------------------------------------------------------------------------------------- | -------------------------------------------- |
| requerimiento material | una orden autorizada necesita una cantidad calculada de un material                          | que exista stock o que esté reservado        |
| solicitud a NEXO       | FOGO pidió evaluar/apartar una cantidad para un uso productivo concreto                      | que NEXO la haya aceptado o reservado        |
| validación NEXO        | NEXO está comprobando existencia, unidad, conversión, lote, origen, destino, uso y autoridad | que la reserva exista                        |
| reserva NEXO           | una cantidad concreta quedó apartada para la operación                                       | que haya salido físicamente o sido consumida |
| material listo         | la reserva requerida y las demás condiciones aplicables permiten preparar la ejecución       | que la producción haya comenzado             |
| consumo                | una cantidad real fue retirada o consumida contra la ejecución                               | que el lote haya finalizado                  |

Se prohíbe usar una sola bandera genérica como `materials_ok` o equivalente para representar simultáneamente solicitud, reserva, preparación y consumo.

---

#### 6. Condición de entrada

FOGO solo podrá iniciar el tramo de reserva cuando exista una instancia válida de `VPROC-0034` en `VPROC-0034.PRODUCTION_ORDER_READY` y puedan resolverse, como mínimo:

- referencia estable a la orden productiva;
- versión vigente de la orden;
- referencia a la versión exacta de receta;
- producto de salida y cantidad planificada;
- sede y área productiva;
- actor o principal autorizado;
- contexto temporal aplicable;
- materiales derivados de la receta;
- cantidades y unidades compatibles;
- correlación con el plan o necesidad que originó la orden cuando aplique.

Si cualquiera de esos elementos es ambiguo, obsoleto o incompatible, no se solicita una reserva autoritativa y la orden no debe presentarse como materialmente preparada.

---

#### 7. Derivación de requerimientos materiales

Los requerimientos se derivarán desde la combinación inmutable de:

```text
ORDEN PRODUCTIVA Y VERSIÓN
+
RECETA PUBLICADA Y VERSIÓN
+
CANTIDAD PLANIFICADA DE SALIDA
+
REGLAS DETERMINISTAS DE ESCALA, UNIDAD, REDONDEO Y TOLERANCIA
```

Por cada material requerido deberá conservarse, como mínimo:

- referencia a la orden y su versión;
- referencia a la receta y su versión;
- referencia estable al material o componente productivo aplicable;
- producto canónico requerido;
- cantidad teórica derivada;
- unidad canónica;
- precisión, redondeo y tolerancia aplicados cuando correspondan;
- sede y área productiva;
- momento requerido cuando exista una política aprobada;
- restricciones de lote, condición, vencimiento, trazabilidad o calidad cuando correspondan;
- referencia a una sustitución autorizada cuando exista;
- revisión del requerimiento.

La cantidad solicitada no podrá depender de un cálculo efectuado únicamente en la interfaz. El cálculo deberá ser reproducible desde la orden, receta y reglas versionadas.

---

#### 8. Regla sobre versiones de receta

Una reserva de materiales deberá quedar vinculada a la versión de receta utilizada para determinarla.

Si cambia materialmente la receta después de creada la solicitud:

1. la solicitud anterior no se transforma silenciosamente;
2. se calcula una nueva revisión del requerimiento;
3. las reservas todavía no utilizadas se conservan como hechos históricos y reciben la acción propietaria que corresponda para su liberación, ajuste o sustitución;
4. las cantidades ya consumidas no se revierten mediante edición del requerimiento;
5. la nueva revisión debe volver a validar disponibilidad y autorización;
6. el vínculo entre revisión anterior y posterior queda auditado.

Una versión retirada de receta no podrá originar una nueva orden o una nueva solicitud material, aunque siga siendo consultable para reconstruir historia.

---

#### 9. Contrato mínimo de la solicitud de FOGO a NEXO

La solicitud deberá transportar únicamente la información necesaria para que NEXO pueda crear y validar su propia instancia de `VPROC-0025`.

Información empresarial mínima:

- referencia a la orden productiva;
- versión de la orden;
- referencia a la instancia de `VPROC-0034`;
- referencia a la versión de receta;
- referencia al requerimiento material y su revisión;
- producto requerido;
- cantidad solicitada;
- unidad canónica;
- sede y área productiva;
- uso o destino productivo esperado, suficiente para resolver `destination_or_consumption_ref`;
- referencia de origen físico cuando ya exista una asignación NEXO válida, o contexto suficiente para que NEXO la resuelva antes de crear la instancia de existencias;
- momento requerido cuando exista;
- restricciones materiales autorizadas;
- referencia de sustitución aprobada cuando aplique.

Contexto transversal mínimo cuando aplique:

- `request_id`;
- `idempotency_key`;
- `source_command_id`;
- `correlation_id`;
- `causation_id`;
- `process_instance_id` de la instancia productiva de origen;
- versión del recurso afectado;
- principal técnico;
- actor efectivo;
- sede y área;
- versión contractual;
- referencias de evidencia necesarias.

FOGO no enviará como autoridad:

- saldo disponible definitivo;
- cantidad reservada definitiva;
- estado de reserva NEXO;
- movimiento de inventario;
- lote físico seleccionado como hecho ya confirmado;
- ubicación física definitiva como hecho ya confirmado;
- estado de posting;
- cantidad consumida;
- ajuste de inventario.

FOGO podrá proponer restricciones o una asignación conocida cuando el contrato lo permita, pero NEXO deberá revalidarlas contra su fuente de verdad antes de producir cualquier efecto.

Antes de persistir `VPROC-0025.STOCK_OPERATION_REQUESTED`, NEXO deberá haber resuelto un `source_stock_ref` válido y un `destination_or_consumption_ref` válido, porque ambos forman parte del contrato de entrada canónico de `VPROC-0025`. Si FOGO no conoce todavía el origen físico, su solicitud se mantiene como comando de handoff y NEXO resuelve el origen desde su stock, ubicaciones, condiciones y políticas. Si no puede resolver un origen elegible, no fabricará una instancia incompleta ni una reserva ficticia: devolverá el faltante, conflicto o decisión aplicable.

---

#### 10. Creación de la instancia NEXO

Una solicitud aceptable da origen o recupera una instancia de `VPROC-0025` vinculada al requerimiento productivo.

Secuencia canónica aplicable:

```text
VPROC-0025.STOCK_OPERATION_REQUESTED
        ↓
VPROC-0025.VALIDATION_IN_PROGRESS
        ↓
VPROC-0025.RESERVED
```

Interpretación obligatoria:

- `STOCK_OPERATION_REQUESTED`: la solicitud existe; todavía no se descontó, reservó, consumió ni trasladó inventario;
- `VALIDATION_IN_PROGRESS`: NEXO valida disponibilidad, unidad, conversión, lote, origen, destino, uso y autoridad;
- `RESERVED`: la cantidad quedó apartada para la operación y dejó de ser libremente asignable a una operación competidora, sin haber sido todavía consumida.

La instancia de `VPROC-0025` conservará identidad propia. FOGO guardará o consumirá su referencia y sus hechos, pero no copiará la máquina de estados como fuente editable propia.

---

#### 11. Significado de `VPROC-0034.MATERIALS_RESERVING`

La transición:

```text
VPROC-0034.PRODUCTION_ORDER_READY
→ VPROC-0034.MATERIALS_RESERVING
```

significa que FOGO comenzó la fase de verificación y obtención de materiales contra la orden.

No significa por sí sola que:

- todos los materiales estén reservados;
- exista suficiente inventario;
- NEXO haya aceptado todas las líneas;
- un lote o LOC concreto esté confirmado;
- pueda iniciarse consumo;
- pueda iniciarse producción.

El evento `VPROC-0034.EVT-002` conserva la verdad de FOGO: el proceso está reservando materiales. La prueba de una reserva física individual proviene de NEXO mediante `VPROC-0025.EVT-003` o su resultado durable equivalente.

---

#### 12. Relación con `VPROC-0034.MATERIALS_READY`

La reserva completa es una condición necesaria de preparación material, pero no es por sí sola prueba suficiente de `VPROC-0034.MATERIALS_READY`. El estado canónico de FOGO exige que los insumos y recursos requeridos estén preparados y validados, no solamente apartados en el ledger de NEXO.

Antes de que FOGO pueda considerar satisfecha la dimensión de reserva de cada requerimiento de la revisión vigente, debe existir una de estas condiciones autorizadas:

1. cantidad requerida completamente reservada por NEXO;
2. cantidad parcialmente reservada y una excepción de parcialidad permite continuar con el alcance explícitamente aprobado;
3. material sustituido mediante una decisión autorizada y ya reflejada en la revisión vigente del requerimiento;
4. material no aplicable a esa ejecución por una decisión versionada y auditable que no cambie silenciosamente la receta.

Aun después de cumplir esa dimensión, el avance a `MATERIALS_READY` requiere la evidencia propia de FOGO de que los materiales y demás recursos aplicables están efectivamente preparados y validados. Esta tarea no convierte `VPROC-0025.RESERVED` en un alias de `MATERIALS_READY`.

No bastan para demostrar reserva ni readiness:

- una lectura previa de stock;
- una cantidad positiva mostrada en una pantalla;
- una reserva calculada solo por FOGO;
- una respuesta técnica sin resultado durable;
- una promesa verbal de bodega;
- una selección local todavía no confirmada por NEXO.

La falta de una línea requerida impide satisfacer la dimensión de reserva para la cantidad completa, salvo excepción aprobada que declare exactamente la cantidad y alcance que puede continuar. La preparación física y validación final permanecen como hechos propios de `VPROC-0034`.

---

#### 13. Cantidades canónicas

Para cada requerimiento material se preservarán al menos las siguientes magnitudes conceptuales:

```text
required_qty
requested_qty
reserved_qty
remaining_to_reserve_qty
```

Con las invariantes:

```text
required_qty >= 0
requested_qty >= 0
reserved_qty >= 0
remaining_to_reserve_qty >= 0

reserved_qty <= requested_qty
remaining_to_reserve_qty = max(requested_qty - reserved_qty, 0)
```

Para una revisión activa sin sustitución o dispensa:

```text
requested_qty = required_qty
```

Si existe parcialidad autorizada, la diferencia no desaparece: permanece como cantidad faltante, diferida, sustituida o cancelada mediante una decisión explícita.

La suma de reservas activas vinculadas al mismo requerimiento no podrá superar la cantidad solicitada para esa revisión.

---

#### 14. Disponibilidad y reserva

NEXO distinguirá, como mínimo, cantidad física, cantidad reservada y cantidad disponible según su modelo canónico.

Principio:

```text
DISPONIBLE PARA NUEVA ASIGNACIÓN
≠ EXISTENCIA FÍSICA TOTAL
≠ EXISTENCIA YA RESERVADA
```

La reserva deberá impedir sobreasignación concurrente.

Una consulta de disponibilidad usada durante planificación puede quedar obsoleta antes de reservar. Por tanto:

- FOGO podrá usar snapshots de inventario como señal para planificar;
- el snapshot no crea derecho sobre la existencia;
- NEXO vuelve a validar contra el estado vigente al reservar;
- si la versión o disponibilidad cambió, la operación falla o queda en tratamiento explícito;
- FOGO no reescribe su necesidad para hacerla coincidir artificialmente con el stock disponible.

---

#### 15. Selección de lote, ubicación y condición

NEXO resolverá la existencia física que puede respaldar la reserva según:

- producto canónico;
- unidad y conversión aprobadas;
- sede;
- ubicación elegible;
- lote o LPN cuando aplique;
- condición utilizable;
- cuarentena, bloqueo, vencimiento o restricción vigente;
- política FEFO u otra política canónica aplicable;
- alcance y autoridad del actor;
- restricciones productivas transmitidas de forma autorizada.

FOGO no podrá convertir una preferencia de lote o ubicación en un hecho físico confirmado.

Si una receta, especificación o decisión productiva exige un lote o atributo concreto, NEXO deberá validar esa restricción; no podrá sustituirla silenciosamente por disponibilidad genérica.

---

#### 16. Reserva total

Una reserva total ocurre cuando NEXO puede apartar la cantidad completa solicitada para la revisión vigente.

Resultado mínimo consumible por FOGO:

- referencia a la instancia NEXO;
- referencia a la solicitud de origen;
- producto;
- cantidad reservada;
- unidad;
- sede;
- desgloses físicos necesarios por lote, ubicación o LPN cuando correspondan;
- versión del recurso o ledger relevante;
- estado `VPROC-0025.RESERVED`;
- referencia de resultado durable;
- actor y timestamps autoritativos;
- correlación e idempotencia.

La reserva total no produce consumo.

---

#### 17. Reserva parcial y faltante

Si NEXO solo puede reservar una parte:

- no reducirá silenciosamente `requested_qty`;
- conservará cantidad solicitada, reservada y pendiente;
- la continuación parcial deberá usar `VPROC-0025.EX-004` cuando la política y autoridad permitan cumplimiento parcial;
- el faltante podrá escalarse mediante `VPROC-0025.EX-003`;
- FOGO decidirá si la orden puede continuar parcialmente, debe esperar, debe revisar cantidades o requiere una sustitución productiva;
- NEXO no alterará la receta para cubrir el faltante;
- FOGO no fabricará stock inexistente para cerrar la línea.

Una reserva parcial no debe presentarse como `MATERIALS_READY` para la cantidad completa, salvo que una decisión autorizada haya reducido o dividido explícitamente el alcance productivo y creado la revisión correspondiente.

---

#### 18. Competencia entre órdenes

Cuando dos o más órdenes productivas compitan por la misma existencia:

1. NEXO aplicará control atómico, versión, bloqueo, claim o mecanismo equivalente sobre el alcance material;
2. solo una operación podrá confirmar cada unidad de disponibilidad comprometible;
3. una lectura previa no concede prioridad;
4. una segunda operación basada en una versión obsoleta deberá revalidar y no sobreasignar;
5. el resultado perdedor conserva un faltante o conflicto explícito;
6. FOGO no resolverá la carrera modificando directamente la proyección de inventario;
7. la conciliación deberá detectar cualquier cantidad simultáneamente reservada a más de un requerimiento incompatible.

---

#### 19. Sustitución de material

Se distinguen dos clases de sustitución.

**Sustitución física compatible dentro del mismo material**

Puede abarcar origen, ubicación, lote, LPN o presentación cuando la equivalencia y conversión estén autorizadas. NEXO la gobierna mediante `VPROC-0025.EX-002` y conserva la trazabilidad física.

**Sustitución que cambia el material productivo**

Cuando cambia ingrediente, especificación o composición productiva, requiere `VPROC-0034.EX-002` y autoridad FOGO. Debe conservar:

- material originalmente requerido;
- material sustituto;
- equivalencia o justificación;
- cantidad y unidad antes y después;
- impacto en receta o snapshot de ejecución;
- actor y autoridad;
- motivo;
- restricciones de calidad o alérgenos;
- revisión resultante del requerimiento;
- nuevas referencias de reserva NEXO.

NEXO nunca sustituirá un ingrediente por otro solo porque haya existencias disponibles.

---

#### 20. Cancelación de una reserva todavía no consumida

Cuando una orden, revisión o requerimiento deja de necesitar material antes del consumo:

- FOGO conserva su decisión productiva de cancelar, reducir o sustituir el requerimiento;
- NEXO recibe la acción correlacionada sobre su instancia;
- `VPROC-0025.CCR-001` detiene únicamente el trabajo restante aplicable;
- la cantidad que deje de estar reservada vuelve a la proyección disponible únicamente mediante el efecto propietario de NEXO;
- el historial de la reserva permanece consultable;
- la cancelación no elimina la solicitud original ni reutiliza su identidad para otro requerimiento.

Si ya existe consumo o movimiento válido, no se tratará como una reserva sin usar. La corrección pasa al contrato de consumo y a las acciones compensatorias aplicables.

---

#### 21. Instrucción duplicada o inválida

`VPROC-0025.CCR-002` podrá anular una instrucción duplicada o inválida únicamente cuando no exista un efecto físico válido que deba conservarse o compensarse.

No se utilizará `VOID` para:

- esconder una reserva que sí produjo un efecto legítimo;
- borrar una carrera de concurrencia;
- corregir un consumo real;
- eliminar una historia incómoda;
- reutilizar el identificador de otra operación.

Si existe un efecto válido incompatible con la intención actual, deberá conservarse y resolverse mediante cancelación residual, retorno, ajuste o conciliación según el estado real.

---

#### 22. Corrección de cantidades

Un cambio de cantidad de la orden o del requerimiento después de solicitar reserva produce una nueva revisión.

**Aumento:**

- conserva la reserva ya válida;
- solicita únicamente la cantidad adicional necesaria o una nueva operación correlacionada según el contrato materializado;
- no vuelve a reservar la cantidad ya confirmada.

**Reducción:**

- conserva la solicitud y reserva originales como historia;
- libera o cancela únicamente el excedente todavía no consumido mediante NEXO;
- no resta directamente de una proyección FOGO.

**Cambio incompatible:**

- no reutiliza la misma clave idempotente;
- conserva relación causal con la revisión anterior;
- exige nueva validación de producto, unidad, receta y autoridad.

---

#### 23. Idempotencia

Cada operación reintentable obtiene una clave estable antes del primer envío y una huella lógica versionada del contenido.

La huella deberá cubrir al menos:

- tipo de acción;
- orden productiva y versión;
- requerimiento material y revisión;
- producto;
- cantidad;
- unidad;
- sede y área;
- restricciones materiales relevantes;
- versión contractual.

Resultados lógicos aplicables:

| Resultado                   | Tratamiento                                                                           |
| --------------------------- | ------------------------------------------------------------------------------------- |
| `APPLIED`                   | la solicitud o efecto propietario se materializó por primera vez                      |
| `DUPLICATE_RESULT_RETURNED` | mismo alcance y misma huella; se retorna el resultado durable previo sin nuevo efecto |
| `CONFLICTING_REUSE`         | misma clave con contenido incompatible; se rechaza antes de efecto parcial            |
| `IN_PROGRESS_RECOVERABLE`   | existe otra ejecución con claim vigente; se recuperará su resultado                   |
| `STALE_VERSION`             | la operación se basó en una revisión anterior y no se aplica silenciosamente          |
| `OUT_OF_ORDER_DEFERRED`     | falta una dependencia o versión previa                                                |
| `RECONCILIATION_REQUIRED`   | el resultado no puede determinarse con seguridad mediante otro intento automático     |

Una respuesta perdida no autoriza generar una nueva clave para repetir la reserva.

---

#### 24. Respuesta perdida y resultado desconocido

Ante timeout, caída de red o pérdida de respuesta:

1. FOGO conserva `request_id`, `idempotency_key`, `source_command_id` y correlación originales;
2. consulta o recupera el resultado durable antes de reenviar;
3. si reintenta, utiliza la misma identidad lógica;
4. NEXO retorna el resultado previo cuando la misma operación ya fue aplicada;
5. si el sistema no puede determinar si la reserva ocurrió, el resultado es `RECONCILIATION_REQUIRED`;
6. no se crea una segunda reserva para “estar seguros”.

---

#### 25. Evento fuera de orden

Si FOGO recibe una confirmación NEXO correspondiente a una revisión anterior:

- no retrocede silenciosamente la revisión vigente;
- conserva el evento y su correlación;
- compara orden, requerimiento, versión y cantidad;
- aplica el resultado únicamente si sigue siendo válido para el alcance actual;
- en caso contrario lo difiere o abre conciliación;
- ninguna confirmación tardía libera automáticamente una reserva distinta ni inicia consumo.

---

#### 26. Eventos canónicos utilizados

No se crea un catálogo adicional de eventos.

| Hecho                              | Definición canónica  | Interpretación en este contrato                                                                   |
| ---------------------------------- | -------------------- | ------------------------------------------------------------------------------------------------- |
| orden productiva lista             | `VPROC-0034.EVT-001` | habilita la preparación; no demuestra reserva ni consumo                                          |
| FOGO entra a reserva de materiales | `VPROC-0034.EVT-002` | informa que la orden está verificando y obteniendo materiales; no afirma reserva NEXO             |
| operación NEXO solicitada          | `VPROC-0025.EVT-001` | NEXO tiene una solicitud válida; no reservó todavía                                               |
| validación NEXO en curso           | `VPROC-0025.EVT-002` | se comprueban disponibilidad, unidad, lote, origen, destino, uso y autoridad                      |
| reserva NEXO confirmada            | `VPROC-0025.EVT-003` | la cantidad quedó apartada y todavía no se consumió                                               |
| confirmación de destino pendiente  | `VPROC-0025.EVT-004` | corresponde a fases posteriores de ejecución física; no se usa como prueba inicial de reserva     |
| posting pendiente                  | `VPROC-0025.EVT-005` | un efecto físico validado espera su registro canónico; no equivale a reserva inicial              |
| operación conciliada               | `VPROC-0025.EVT-006` | la operación quedó reconciliada sin doble efecto; no sustituye la semántica específica de consumo |

Los comandos que solicitan una acción no se confunden con estos eventos. Los eventos describen hechos durables ya persistidos por su propietaria.

---

#### 27. Relación con `INT-PROD-002`

`INT-PROD-001` termina conceptualmente cuando el requerimiento material puede demostrar la reserva necesaria o una excepción explícita que permita continuar.

`INT-PROD-002` deberá definir posteriormente:

- cuándo una reserva puede pasar a consumo;
- qué cantidad real se consume;
- cómo NEXO registra el movimiento;
- cómo se comparan reservado, consumido, devuelto y desperdiciado;
- cómo se impide doble consumo;
- cómo se compensa una diferencia real.

Por tanto:

```text
RESERVADO
≠ CONSUMIDO
```

Ninguna regla de esta tarea adelanta el cierre de `INT-PROD-002`.

---

#### 28. Relación con `INT-PROD-005`

La evidencia ya aprobada en `INT-PROD-005` se preserva como restricción posterior:

- NEXO sigue siendo propietaria del inventario, reservas y movimientos;
- FOGO sigue siendo propietaria de receta, plan, orden, lote, ejecución y calidad;
- una necesidad productiva no crea stock;
- una salida productiva no queda disponible sin el handoff correspondiente;
- cantidades parciales conservan saldo pendiente;
- cada aplicación confirma únicamente sus propios hechos.

Este contrato no redefine las políticas de cumplimiento de remisiones ni las cantidades ya establecidas en esa tarea.

---

#### 29. Autorización y segregación

Cada acción debe validar de nuevo identidad, permiso, recurso, versión y contexto.

Se distinguen al menos:

- crear o modificar una orden productiva;
- solicitar materiales;
- validar una solicitud de existencias;
- reservar existencia;
- autorizar parcialidad;
- autorizar sustitución productiva;
- sustituir origen, destino o presentación física compatible;
- cancelar cantidad todavía no consumida;
- ejecutar consumo;
- ajustar o devolver un efecto físico.

La capacidad de producir no concede por sí sola autoridad para reservar stock; la capacidad de operar inventario no concede autoridad para cambiar la receta.

Un principal técnico no sustituye la identidad del actor efectivo cuando la acción exige responsabilidad humana.

---

#### 30. Privacidad y minimización

La integración transportará solo las referencias necesarias.

NEXO no necesita recibir el contenido completo de la receta para reservar existencias. Debe recibir únicamente los materiales, cantidades, unidades, restricciones y referencias necesarias para su función.

FOGO no necesita copiar el ledger completo de NEXO. Debe consumir el resultado de reserva y las referencias físicas mínimas necesarias para preparar, ejecutar y auditar la producción.

No se incluirán credenciales, secretos, fórmulas completas ni datos personales no necesarios en payloads, logs o proyecciones compartidas.

---

#### 31. Auditoría mínima

Debe poder reconstruirse:

```text
PLAN O NECESIDAD DE ORIGEN
→ ORDEN PRODUCTIVA Y VERSIÓN
→ RECETA Y VERSIÓN
→ REQUERIMIENTO MATERIAL Y REVISIÓN
→ SOLICITUD A NEXO
→ INSTANCIA VPROC-0025
→ VALIDACIÓN
→ RESERVA TOTAL O PARCIAL
→ EXCEPCIÓN, SUSTITUCIÓN O FALTANTE
→ DECISIÓN DE CONTINUAR O NO
→ HANDOFF A CONSUMO EN INT-PROD-002
```

La evidencia conservará, cuando aplique:

- principal técnico y actor efectivo;
- aplicación emisora y propietaria;
- orden, receta y revisiones;
- producto, cantidad y unidad;
- sede y área;
- referencias físicas confirmadas por NEXO;
- versión de recurso;
- timestamps del hecho y registro;
- correlación y causalidad;
- clave idempotente y comando fuente;
- resultado durable;
- causa de parcialidad, sustitución, cancelación o conflicto;
- relación con cualquier corrección o compensación posterior.

---

#### 32. Conciliación

La conciliación deberá detectar al menos:

| Diferencia                                                 | Tratamiento obligatorio                                                                 |
| ---------------------------------------------------------- | --------------------------------------------------------------------------------------- |
| requerimiento sin solicitud NEXO                           | mantener preparación incompleta y recuperar o volver a emitir con la identidad correcta |
| solicitud NEXO sin requerimiento vigente                   | bloquear avance y revisar causalidad                                                    |
| solicitud aplicada dos veces                               | conservar un solo efecto y retornar resultado duplicado                                 |
| reserva sin solicitud correlacionable                      | `RECONCILIATION_REQUIRED`                                                               |
| reserva mayor que cantidad solicitada                      | bloquear readiness y resolver excedente mediante acción NEXO autorizada                 |
| cantidad solicitada mayor que requerimiento vigente        | nueva revisión o corrección antes de continuar                                          |
| material requerido sin reserva suficiente                  | faltante explícito; no iniciar como si estuviera listo                                  |
| reserva ligada a receta o revisión obsoleta                | no reutilizar automáticamente; reconciliar y decidir liberación o nueva reserva         |
| misma existencia reservada a dos operaciones incompatibles | incidente crítico de inventario y corrección propietaria NEXO                           |
| FOGO muestra reserva que NEXO no puede demostrar           | proyección inválida; NEXO permanece fuente de verdad                                    |
| NEXO registra cambio de ingrediente sin autorización FOGO  | bloquear y revertir la interpretación; preservar evidencia                              |
| respuesta técnica sin resultado durable                    | recuperar resultado o mantener incertidumbre explícita                                  |

La conciliación nunca corrige saldos escribiendo directamente una proyección consumidora.

---

#### 33. Estado actual de implementación observado

La implementación vigente de FOGO permite crear un lote real y suministrar cantidades de ingredientes a la operación productiva. El flujo actual llama una operación de base de datos que valida la receta y trabaja directamente con existencias durante la creación del lote.

No se ha demostrado en el estado actual:

- una instancia NEXO de reserva previa por cada requerimiento productivo;
- separación material entre solicitud, reserva y consumo antes de crear el lote;
- consumo del hecho `VPROC-0025.EVT-003` como prueba autoritativa de reserva;
- recuperación durable del resultado de reserva mediante el contrato transversal completo;
- conciliación independiente entre requerimiento FOGO y reserva NEXO antes del consumo.

Estas observaciones describen una brecha de implementación respecto del diseño aprobado; no convierten el comportamiento actual en contrato canónico.

---

#### 34. Propiedad de la implementación pendiente

La materialización física queda asignada a tareas ya existentes y registradas en el 04A, sin crear un pendiente narrativo nuevo.

Para el dominio FOGO, las tareas ya vinculadas incluyen, según el requisito aplicable:

- `FOGO-UX-001`, `FOGO-UX-003`, `FOGO-UX-004`, `FOGO-UX-005`, `FOGO-UX-008`, `FOGO-UX-009`, `FOGO-UX-010`, `FOGO-UX-014`;
- `FOGO-AUTH-003`, `FOGO-AUTH-008`, `FOGO-AUTH-009`, `FOGO-AUTH-012`, `FOGO-AUTH-013`, `FOGO-AUTH-014`, `FOGO-AUTH-016`.

Para reserva, ledger, autorización y experiencia NEXO, el registro vigente asigna cobertura a:

- `NEXO-DOM-002` a `NEXO-DOM-007`;
- `NEXO-DOM-019` a `NEXO-DOM-024`;
- `NEXO-AUTH-011` a `NEXO-AUTH-013`;
- `NEXO-AUTH-021` a `NEXO-AUTH-030`;
- `NEXO-UX-014` a `NEXO-UX-022`;
- `NEXO-UX-026` a `NEXO-UX-029`.

La arquitectura física, persistencia, idempotencia y conciliación transversal permanece bajo las tareas E3, E4, BLOQUE R y el paquete E5 que corresponda según sus asignaciones canónicas vigentes.

Esta tarea no ejecuta ni adelanta esas implementaciones.

---

#### 35. Criterios de aceptación

La tarea queda documentalmente completa cuando se cumple todo lo siguiente:

1. FOGO y NEXO conservan propiedad separada e inequívoca;
2. la solicitud no se confunde con una reserva;
3. la reserva no se confunde con consumo;
4. `VPROC-0034.MATERIALS_RESERVING` se interpreta como fase FOGO y no como ledger de inventario;
5. `VPROC-0025.RESERVED` es la fuente autoritativa de la reserva física y no equivale por sí sola a `VPROC-0034.MATERIALS_READY`;
6. `source_stock_ref` y `destination_or_consumption_ref` quedan resueltos antes de crear la instancia NEXO;
7. el requerimiento se deriva de orden, receta y versiones exactas;
8. escala, unidad, redondeo y tolerancia son reproducibles;
9. FOGO no transmite saldo o reserva calculados por cliente como autoridad;
10. NEXO vuelve a validar disponibilidad y versión al reservar;
11. la reserva evita sobreasignación concurrente;
12. una reserva parcial conserva el faltante;
13. una sustitución que cambia el material requiere autoridad FOGO;
14. una sustitución física compatible permanece gobernada por NEXO;
15. una corrección de cantidad crea revisión y no sobrescribe historia;
16. una cancelación libera únicamente trabajo no consumido mediante el proceso propietario;
17. una respuesta perdida recupera resultado antes de repetir el efecto;
18. misma clave y misma huella retorna el resultado previo;
19. misma clave y contenido incompatible produce conflicto;
20. eventos fuera de orden no hacen retroceder ni avanzar silenciosamente la orden;
21. los eventos canónicos existentes se reutilizan sin crear un catálogo paralelo;
22. la auditoría puede reconstruir requerimiento, solicitud, reserva y excepciones;
23. la conciliación detecta reserva huérfana, exceso, duplicado, versión obsoleta y doble asignación;
24. el estado actual de implementación se distingue del diseño canónico;
25. cada brecha física queda vinculada a tareas ya existentes;
26. `INT-PROD-002` permanece reservada para el contrato de consumo;
27. no se altera el Registro 04A porque la cobertura de prueba ya existe.
---

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA.

**Justificación:** el comportamiento verificable de esta tarea ya está cubierto por requisitos vigentes que protegen la versión exacta de receta y sus materiales, la planificación y sus restricciones, la unidad y conversión comunes, la separación entre existencia física, reservada y disponible, la reserva idempotente y concurrente, el handoff entre aplicaciones, la propiedad única de datos y la cadena correlacionada entre materiales, producción e inventario. La tarea especializa esa cobertura para el handoff FOGO–NEXO sin introducir una obligación de prueba materialmente nueva.

---

#### Cobertura de prueba existente preservada

La tarea consume y especializa, sin modificar su texto, estado, relaciones ni secuencia, al menos la siguiente cobertura vigente:

- `TREQ-FOGO-002` — receta publicada, versión exacta, materiales, unidades, escalamiento, tolerancias y snapshot reproducible;
- `TREQ-FOGO-003` — planificación, señales, materiales, restricciones, aprobaciones y prohibición de crear producción aprobada desde una señal aislada;
- `TREQ-NEXO-010` — resolución equivalente de unidad, conversión, disponibilidad y política de solicitud;
- `TREQ-NEXO-011` — fuente canónica de movimientos y proyecciones, cantidad reservada diferenciada, reserva idempotente, concurrencia y prevención de sobreasignación;
- `TREQ-INTEGRATION-003` — identidad idempotente, huella lógica, resultado durable, reintento, resultado desconocido y conciliación;
- `TREQ-INTEGRATION-005` — preservación de proceso, recurso, actor, contexto, estado y revalidación en el handoff;
- `TREQ-INTEGRATION-006` — propiedad única del dato y prohibición de fuentes competidoras;
- `TREQ-INTEGRATION-011` — efectos de inventario de producción mediante contrato NEXO correlacionado e idempotente;
- `TREQ-INTEGRATION-013` — cadena demanda, planificación, capacidad, materiales, ejecución, calidad, inventario y costo correlacionada e idempotente.

No se crea, modifica, difiere, descarta ni vuelve obsoleto ningún requisito de prueba.

---

#### 36. Continuidad

**ÚLTIMA TAREA APROBADA**  
`INT-PROC-005 — Definir control que evite una recepción duplicada`

**TAREA ACTUAL APROBADA**  
`INT-PROD-001 — Definir contrato para que FOGO solicite o reserve insumos`

**SIGUIENTE TAREA RESERVADA**  
`INT-PROD-002 — Definir contrato para que NEXO registre el consumo`


### [ ] INT-PROD-002 — Definir contrato para que NEXO registre el consumo
### [ ] INT-PROD-003 — Definir contrato para que FOGO finalice el lote
### [ ] INT-PROD-004 — Definir contrato para que NEXO registre el producto terminado
### ✅ INT-PROD-005 — Definir tratamiento de producción insuficiente para remisiones

**Estado:** APROBADA  
**Tarea anterior dentro del flujo integral:** `INT-PROD-004 — Definir contrato para que NEXO registre el producto terminado` — NO INICIADA
**Tarea siguiente dentro del flujo integral:** `INT-POS-001 — Auditar documentación, endpoints, webhooks y límites del POS vigente` — NO INICIADA
**Tipo de tarea:** documental; definición contractual, funcional, cuantitativa, de estados, integración, excepciones, idempotencia, conciliación y handoff para vincular faltantes de remisiones NEXO con planificación y ejecución productiva FOGO  
**Repositorio propietario:** `vento-shell`  
**Archivo propietario:** `docs/plan-canonico/modular/bloques/X_INTEGRACIONES/05_PRODUCCION_E_INVENTARIO.md`  
**Aplicaciones involucradas:** `NEXO`, `FOGO`, `SHELL`; `ORIGO`, `VISO`, `NUMERA`, `PULSO` y `PASS` únicamente como fuentes o consumidoras cuando una dependencia aprobada lo exija  
**Artefactos producidos:** `NEXO-FOGO-REMISSION-PRODUCTION-SHORTAGE-CONTRACT-001`, `NEXO-FOGO-REMISSION-PRODUCTION-ELIGIBILITY-MATRIX-001`, `NEXO-FOGO-REMISSION-PRODUCTION-STATE-MACHINE-001`, `NEXO-FOGO-REMISSION-PRODUCTION-QUANTITY-CONTRACT-001`, `NEXO-FOGO-REMISSION-PRODUCTION-HANDOFF-CONTRACT-001`, `NEXO-FOGO-REMISSION-PRODUCTION-CANCELLATION-RECOVERY-CONTRACT-001`, `NEXO-FOGO-REMISSION-PRODUCTION-RECONCILIATION-MATRIX-001` y `NEXO-FOGO-REMISSION-PRODUCTION-IMPLEMENTATION-HANDOFF-001`  
**Decisiones consumidas:** `NEXO-UX-009`, `NEXO-UX-010`, `NEXO-UX-022`, `INT-APP-001` a `INT-APP-010`, `TREQ-FOGO-001`, `TREQ-FOGO-003`, `TREQ-INTEGRATION-006`, `TREQ-INTEGRATION-011`, `TREQ-INTEGRATION-013`, `TREQ-INTEGRATION-067`, `TREQ-INTEGRATION-102`, `TREQ-NEXO-006`, `TREQ-NEXO-010`, `TREQ-NEXO-011` y `TREQ-NEXO-269`  
**Cambios físicos autorizados:** ninguno; no modifica código, tablas, funciones, RPC, RLS, datos, migraciones, paquetes, tipos generados, configuración, remisiones, lotes productivos, stock, despliegues ni servicios remotos

---

#### 1. Propósito

Definir qué debe ocurrir cuando una remisión interna contiene un producto que:

- no dispone de cantidad suficiente en el origen;
- está configurado para abastecimiento mediante producción;
- debe fabricarse total o parcialmente para cumplir la cantidad solicitada; o
- requiere una decisión de FOGO antes de comprometer una fecha o cantidad.

La tarea elimina cuatro ambigüedades:

1. un faltante de NEXO no equivale por sí solo a una orden de producción;
2. una remisión no puede aprobar producción ni decidir receta, lote, secuencia o capacidad;
3. terminar producción no equivale a liberar calidad, ingresar inventario ni completar la remisión;
4. una cantidad producida no puede asignarse, despacharse o contabilizarse dos veces.

La regla raíz queda:

```text
REMISIÓN APROBADA O EN PREPARACIÓN
+
POLÍTICA DE CUMPLIMIENTO VIGENTE
+
FALTANTE O NECESIDAD BAJO PEDIDO
+
PRODUCTO Y UNIDAD RESOLUBLES
→
NECESIDAD PRODUCTIVA CORRELACIONADA
→
DECISIÓN AUTORITATIVA DE FOGO
→
EJECUCIÓN, CALIDAD Y LIBERACIÓN
→
ASIGNACIÓN AUTORITATIVA DE NEXO
→
DESPACHO, RECEPCIÓN Y CONCILIACIÓN
```

---

#### 2. Resultado material

Se aprueba un contrato completo para:

- clasificar cuándo una línea de remisión puede activar producción;
- conservar el faltante sin reducir silenciosamente la cantidad solicitada;
- crear una necesidad productiva correlacionada, pero no una producción aprobada;
- permitir que FOGO acepte, acepte parcialmente o rechace la necesidad;
- vincular plan, orden, lote, resultado, calidad y liberación sin transferir propiedad entre aplicaciones;
- soportar producción parcial y despacho parcial;
- tratar sustituciones, cancelaciones, vencimientos, respuestas desconocidas y resultados tardíos;
- impedir doble conteo entre producto producido, inventario disponible y cantidad asignada a la remisión;
- reconciliar la cadena completa antes de cerrar el abastecimiento interno.

La tarea conserva como hechos distintos:

```text
FALTANTE DETECTADO
≠ NECESIDAD PRODUCTIVA REGISTRADA
≠ NECESIDAD ACEPTADA
≠ PLAN LIBERADO
≠ ORDEN LISTA
≠ PRODUCCIÓN TERMINADA
≠ CALIDAD LIBERADA
≠ INVENTARIO INGRESADO
≠ CANTIDAD ASIGNADA
≠ CANTIDAD DESPACHADA
≠ CANTIDAD RECIBIDA
≠ REMISIÓN CONCILIADA
```

---

#### 3. Diagnóstico del estado actual

La implementación vigente demuestra capacidades parciales, pero no el contrato completo:

- NEXO puede detectar insuficiencia física o de stock y bloquear el despacho;
- NEXO conserva cantidades preparadas, enviadas, recibidas y faltantes;
- existe soporte operativo para observaciones de faltante en origen;
- FOGO puede crear lotes productivos y distinguir salidas para inventario, stock vendible o cumplimiento de una orden;
- FOGO posee recetas, ejecución productiva y resultados;
- no existe una relación canónica comprobada que vincule una línea de remisión con una necesidad productiva, una decisión FOGO, una cantidad liberada y una asignación NEXO;
- no se ha demostrado cierre idempotente, conciliación cruzada ni tratamiento de cancelaciones y resultados tardíos.

Por tanto, las capacidades actuales se clasifican como parciales y no equivalen a integración implementada o validada.

---

#### 4. Propiedad empresarial y límites

| Dominio          | Propiedad obligatoria                                                                                                                                | No puede decidir                                                                                   |
| ---------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------- |
| `NEXO`           | remisión, línea solicitada, faltante, cantidad preparada, asignación física, despacho, tránsito, recepción, movimientos y conciliación de inventario | receta, plan productivo, orden productiva, secuencia, rendimiento, merma o disposición de calidad  |
| `FOGO`           | señal productiva aceptada, plan, orden, receta y versión, lote, ejecución, consumos, rendimiento, merma, calidad, liberación y cierre productivo     | editar la remisión, reducir su cantidad original, confirmar despacho, recepción o cierre logístico |
| `SHELL`          | contratos compartidos, sobre de integración, tipos, compatibilidad, idempotencia, publicación y gobierno de cambios                                  | fabricar hechos empresariales de NEXO o FOGO                                                       |
| `ORIGO`          | disponibilidad y recepción de compras cuando falten materiales                                                                                       | aprobar producción o modificar cantidades de remisión                                              |
| `VISO`           | disponibilidad laboral y capacidad organizativa cuando sea consumida por planificación                                                               | crear una orden productiva o alterar el turno desde NEXO                                           |
| `NUMERA`         | efectos económicos aprobados y conciliación financiera                                                                                               | convertir costo esperado en producción, inventario o remisión completada                           |
| `PULSO` y `PASS` | hechos de demanda o pedido cuando correspondan                                                                                                       | completar producción, liberar inventario o cerrar remisiones                                       |

Regla obligatoria:

```text
NEXO SOLICITA O REGISTRA NECESIDAD
FOGO DECIDE Y EJECUTA PRODUCCIÓN
NEXO ASIGNA Y MUEVE EXISTENCIA LIBERADA
```

Una aplicación consumidora no escribirá directamente las tablas propietarias de otra aplicación ni fabricará estados ajenos.

---

#### 5. Política de cumplimiento productivo

Cada combinación aplicable de producto, sede de origen, operación y vigencia deberá resolver exactamente una política:

| Política                | Comportamiento                                                                                                                                       | Producción activable            |
| ----------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------- |
| `STOCK_ONLY`            | La línea se atiende únicamente desde existencia disponible. El faltante permanece explícito para sustitución, entrega parcial, espera o cancelación. | No                              |
| `STOCK_THEN_PRODUCTION` | NEXO prepara existencia disponible y genera necesidad productiva por el saldo faltante confirmado.                                                   | Sí, por el saldo faltante       |
| `MAKE_TO_ORDER`         | La línea puede solicitarse aun con stock cero y genera necesidad productiva por la cantidad definida por la política vigente.                        | Sí, por la cantidad bajo pedido |

La política deberá conservar:

- identidad y versión;
- producto y presentación aplicables;
- sede y área de origen autorizadas;
- unidad canónica y conversión aprobada;
- vigencia;
- modalidad de abastecimiento;
- tratamiento de existencia previa para `MAKE_TO_ORDER`;
- necesidad de receta o vínculo productivo activo;
- tiempo de entrega, corte o ventana cuando exista política aprobada;
- autoridad que la aprobó;
- estado activo, retirado o reemplazado.

No se permitirá:

- inferir la política desde el nombre, categoría o existencia momentánea;
- tratar todo faltante como producción;
- usar una receta retirada o una conversión ambigua;
- cambiar de política durante una revisión sin registrar versión y efecto;
- utilizar `MAKE_TO_ORDER` para ignorar calidad, inventario, custodia o autorización.

---

#### 6. Matriz de activación

| Escenario                                                             | Decisión                                 | Resultado                                                           |
| --------------------------------------------------------------------- | ---------------------------------------- | ------------------------------------------------------------------- |
| `STOCK_ONLY` con stock suficiente                                     | No requiere producción                   | Preparación ordinaria                                               |
| `STOCK_ONLY` con stock insuficiente                                   | No crea necesidad productiva             | Faltante explícito y decisión logística pendiente                   |
| `STOCK_THEN_PRODUCTION` con stock suficiente                          | No requiere producción                   | Preparación ordinaria                                               |
| `STOCK_THEN_PRODUCTION` con faltante parcial                          | Crea necesidad por el saldo confirmado   | Stock disponible preservado y saldo vinculado a FOGO                |
| `STOCK_THEN_PRODUCTION` con stock cero                                | Crea necesidad por la cantidad abierta   | Línea permanece pendiente de decisión FOGO                          |
| `MAKE_TO_ORDER` con vínculo productivo válido                         | Crea necesidad según la política vigente | No bloquea la solicitud por stock cero                              |
| Producto sin política vigente                                         | Bloquea activación productiva            | `PRODUCTION_POLICY_NOT_RESOLVED`                                    |
| Producto sin unidad compatible                                        | Bloquea activación productiva            | `PRODUCTION_UOM_NOT_RESOLVED`                                       |
| Producto sin receta o vínculo productivo activo cuando es obligatorio | Bloquea activación productiva            | `PRODUCTION_CONFIGURATION_INCOMPLETE`                               |
| Remisión cancelada o línea cerrada                                    | No crea nueva necesidad                  | Cualquier vínculo previo sigue reglas de cancelación y conciliación |
| Cantidad ya satisfecha o cancelada                                    | No crea necesidad adicional              | Reintento idempotente sin efecto nuevo                              |
| Lectura técnica no concluyente                                        | No presume faltante ni capacidad         | `PRODUCTION_LINK_UNAVAILABLE` y cero efectos                        |

Una observación libre de “faltante” no bastará para activar producción. La activación requiere cantidad, unidad, revisión, política y contexto resolubles.

---

#### 7. Identidad de la necesidad productiva

Cada necesidad deberá tener identidad estable y quedar vinculada a una única revisión de línea de remisión.

```text
production_requirement_id
+ remission_id
+ remission_line_id
+ remission_line_revision
+ requirement_revision
+ fulfillment_policy_id
+ fulfillment_policy_version
+ source_shortage_ref
+ correlation_id
+ causation_id
+ idempotency_key
```

Reglas:

1. una revisión de necesidad no se sobrescribe;
2. un aumento, reducción, cancelación o reapertura crea una revisión posterior;
3. dos reintentos con la misma clave y el mismo contenido retornan el mismo resultado;
4. la misma clave con contenido incompatible produce conflicto;
5. una necesidad no podrá vincularse simultáneamente a dos líneas de remisión;
6. una línea podrá tener varias revisiones o asignaciones productivas, pero su suma se conciliará contra la cantidad abierta;
7. plan, orden y lote FOGO se relacionan mediante referencias, no mediante cambio de propiedad del registro NEXO.

---

#### 8. Contrato mínimo de necesidad

| Campo                                         | Regla                                                                    |
| --------------------------------------------- | ------------------------------------------------------------------------ |
| `production_requirement_id`                   | Identidad estable de la necesidad.                                       |
| `remission_id`                                | Remisión propietaria en NEXO.                                            |
| `remission_line_id`                           | Línea exacta que originó la necesidad.                                   |
| `remission_line_revision`                     | Revisión usada para calcular la necesidad.                               |
| `origin_site_id` / `origin_area_id`           | Contexto desde el cual se abastece y produce.                            |
| `destination_site_id` / `destination_area_id` | Destino logístico; no define por sí solo lugar de producción.            |
| `product_id`                                  | Identidad maestra canónica.                                              |
| `presentation_id`                             | Presentación solicitada cuando aplique.                                  |
| `canonical_uom_id`                            | Unidad en la que se reconcilian todas las cantidades.                    |
| `requested_qty`                               | Cantidad original de la revisión de línea; no se reduce silenciosamente. |
| `stock_allocated_qty`                         | Cantidad asignada desde existencia previa.                               |
| `production_needed_qty`                       | Cantidad abierta propuesta para producción.                              |
| `needed_at`                                   | Momento requerido por la remisión. No equivale a compromiso FOGO.        |
| `remission_priority`                          | Prioridad de la remisión como señal; no impone secuencia productiva.     |
| `fulfillment_policy`                          | `STOCK_ONLY`, `STOCK_THEN_PRODUCTION` o `MAKE_TO_ORDER`.                 |
| `request_reason_code`                         | Causa estructurada de la necesidad.                                      |
| `expected_remission_version`                  | Control de concurrencia.                                                 |
| `correlation_id` / `causation_id`             | Relación entre procesos y hechos.                                        |
| `idempotency_key`                             | Prevención de duplicados.                                                |
| `status`                                      | Estado del vínculo productivo.                                           |
| `created_by` / `created_at`                   | Actor efectivo y tiempo autoritativo.                                    |

NEXO no enviará como autoridad:

- receta;
- rendimiento esperado definitivo;
- lote productivo;
- orden productiva;
- prioridad de secuenciación;
- cantidad aprobada por FOGO;
- fecha prometida por FOGO;
- disponibilidad de materiales o capacidad calculada por el cliente.

---

#### 9. Decisión autoritativa de FOGO

La remisión es una señal de necesidad y no crea producción aprobada.

FOGO deberá responder mediante una decisión versionada:

| Decisión              | Significado                                                   | Efecto en NEXO                                                   |
| --------------------- | ------------------------------------------------------------- | ---------------------------------------------------------------- |
| `ACCEPTED`            | FOGO acepta toda la cantidad propuesta.                       | La línea conserva saldo pendiente vinculado a producción.        |
| `PARTIALLY_ACCEPTED`  | FOGO acepta una parte y rechaza o difiere el resto.           | Se separan cantidad aceptada y cantidad no resuelta.             |
| `REJECTED`            | FOGO no acepta la necesidad.                                  | NEXO conserva faltante y habilita decisión logística autorizada. |
| `PENDING_INFORMATION` | Falta una entrada verificable para decidir.                   | No existe compromiso productivo.                                 |
| `CONFLICT`            | La revisión o contenido no coincide con la decisión esperada. | Se exige reconciliación antes de reintentar.                     |

La decisión deberá conservar:

```text
decision_id
+ production_requirement_id
+ requirement_revision
+ decision
+ accepted_qty
+ rejected_or_deferred_qty
+ canonical_uom_id
+ estimated_ready_at
+ production_plan_ref
+ production_order_ref
+ policy_or_rule_ref
+ reason_code
+ decided_by
+ decided_at
+ decision_version
```

FOGO podrá automatizar la decisión únicamente mediante una política productiva explícita, versionada y aprobada dentro de su dominio. La automatización deberá producir el mismo receipt de decisión y no convierte a NEXO en autoridad productiva.

---

#### 10. Estados del vínculo NEXO–FOGO

| Estado                    | Hecho demostrado                                                            | No demuestra                                             |
| ------------------------- | --------------------------------------------------------------------------- | -------------------------------------------------------- |
| `NOT_REQUIRED`            | La línea no requiere producción.                                            | Que esté despachada o recibida.                          |
| `PENDING_FOGO_DECISION`   | Existe una necesidad válida entregada a FOGO.                               | Aceptación, fecha o capacidad.                           |
| `ACCEPTED`                | FOGO aceptó toda la cantidad.                                               | Inicio, terminación o calidad.                           |
| `PARTIALLY_ACCEPTED`      | FOGO aceptó una parte.                                                      | Resolución del saldo restante.                           |
| `REJECTED`                | FOGO rechazó la necesidad.                                                  | Cancelación automática de la línea.                      |
| `SCHEDULED`               | Existe referencia a plan u orden liberada.                                  | Producción iniciada.                                     |
| `IN_PRODUCTION`           | La ejecución productiva está en curso.                                      | Resultado, calidad o inventario.                         |
| `OUTPUT_REPORTED`         | FOGO reportó resultado productivo.                                          | Liberación de calidad.                                   |
| `QUALITY_PENDING`         | El resultado espera disposición o verificación.                             | Disponibilidad para remisión.                            |
| `RELEASED_PARTIAL`        | Parte de la salida fue liberada y es elegible para asignación.              | Despacho o recepción.                                    |
| `RELEASED_COMPLETE`       | La cantidad aceptada liberable fue confirmada.                              | Que toda la remisión esté satisfecha.                    |
| `CANCEL_REQUESTED`        | NEXO solicitó cancelar el vínculo.                                          | Cancelación productiva.                                  |
| `CANCELLED`               | La cancelación fue confirmada por la propietaria correspondiente.           | Eliminación de historia o inexistencia de salida tardía. |
| `EXPIRED`                 | La necesidad perdió vigencia sin satisfacción suficiente.                   | Cancelación de una ejecución ya iniciada.                |
| `RECONCILIATION_REQUIRED` | Existe diferencia, timeout, evento fuera de orden o resultado incompatible. | Éxito o fallo definitivo.                                |

Todo cambio conservará estado anterior, nuevo estado, versión esperada, actor, momento, causa y referencias de evidencia.

---

#### 11. Cantidades e invariantes

Todas las cantidades se reconciliarán en una unidad canónica compatible.

```text
open_fulfillment_qty
=
requested_qty
- received_qty
- cancelled_qty
```

```text
requested_qty
=
stock_allocated_qty
+ production_allocated_qty
+ unresolved_qty
+ cancelled_qty
```

```text
production_allocated_qty <= released_production_qty
received_qty <= shipped_qty
shipped_qty <= stock_allocated_qty + production_allocated_qty
production_needed_qty <= open_fulfillment_qty
```

Reglas adicionales:

- ninguna cantidad puede ser negativa;
- ninguna conversión se realizará con factor ausente, ambiguo o retirado;
- `requested_qty` permanece como historia de la revisión y no se reemplaza por la cantidad disponible;
- una aceptación parcial no reduce el faltante no resuelto;
- una producción parcial puede habilitar preparación o despacho parcial sin cerrar la línea;
- una merma productiva no se convierte automáticamente en faltante logístico ni ajuste de inventario;
- una salida superior a la cantidad abierta no se asigna automáticamente a la remisión;
- el excedente se trata según disposición FOGO y movimiento NEXO autorizado;
- una cantidad producida solo podrá contarse como asignada después de liberación y receipt de asignación NEXO;
- una cantidad asignada a una línea no podrá quedar simultáneamente disponible para otra operación.

---

#### 12. Modos de entrega de la salida productiva

La salida liberada podrá seguir uno de dos modos aprobados:

| Modo                       | Secuencia                                                                                                 | Regla de inventario                                                                                  |
| -------------------------- | --------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- |
| `INVENTORY_THEN_ALLOCATE`  | FOGO libera → NEXO ingresa existencia → NEXO asigna a la línea → NEXO prepara y despacha                  | El ingreso y la asignación son hechos separados e idempotentes.                                      |
| `DIRECT_ORDER_FULFILLMENT` | FOGO libera salida vinculada → NEXO la recibe en staging o custodia de remisión → NEXO prepara y despacha | No se presenta como stock libre, pero conserva movimiento, lote, ubicación, custodia y trazabilidad. |

`DIRECT_ORDER_FULFILLMENT` no permite:

- omitir disposición de calidad;
- despachar desde FOGO sin transferencia de custodia NEXO;
- usar resultado productivo no liberado;
- ocultar lote, presentación, cantidad o unidad;
- evitar movimiento o receipt físico;
- marcar la remisión como recibida desde producción.

---

#### 13. Handoff sobre eventos canónicos existentes

La integración no crea un catálogo paralelo. Utiliza las definiciones ya aprobadas y el sobre `EVENT-ENVELOPE-001`.

| Momento                           | Definición canónica consumida | Uso en este contrato                                                             |
| --------------------------------- | ----------------------------- | -------------------------------------------------------------------------------- |
| Solicitud interna creada          | `VPROC-0028.EVT-001`          | Origina la instancia de abastecimiento; no prueba necesidad productiva aceptada. |
| Validación de remisión            | `VPROC-0028.EVT-002`          | Permite resolver política, disponibilidad y necesidad propuesta.                 |
| Demanda en consolidación          | `VPROC-0033.EVT-002`          | FOGO incorpora la señal normalizada y deduplicada.                               |
| Plan productivo liberado          | `VPROC-0033.EVT-004`          | Demuestra planificación aprobada, no ejecución.                                  |
| Orden productiva lista            | `VPROC-0034.EVT-001`          | Vincula una orden ejecutable con la necesidad aceptada.                          |
| Producción en curso               | `VPROC-0034.EVT-003`          | Actualiza progreso sin liberar cantidad.                                         |
| Resultado reportado               | `VPROC-0034.EVT-004`          | Informa salida y rendimiento sin liberación de calidad.                          |
| Ejecución terminada               | `VPROC-0034.EVT-006`          | Confirma fin operativo; no habilita inventario.                                  |
| Disposición de calidad verificada | `VPROC-0035.EVT-006`          | Identifica la cantidad expresamente liberada.                                    |
| Efectos de inventario pendientes  | `VPROC-0037.EVT-004`          | Solicita el handoff físico hacia NEXO.                                           |
| Listo para despacho               | `VPROC-0028.EVT-004`          | Solo ocurre después de asignación y preparación verificadas.                     |
| Conciliación pendiente            | `VPROC-0028.EVT-005`          | Registra diferencias o efectos pendientes.                                       |
| Abastecimiento conciliado         | `VPROC-0028.EVT-006`          | Cierra sin ocultar faltantes, sustituciones, cancelaciones o devoluciones.       |

Cada emisión o comando derivado deberá conservar, como mínimo:

```text
event_id
+ event_definition_id
+ event_version
+ process_id
+ process_instance_id
+ producer_application
+ aggregate_id
+ aggregate_version
+ occurred_at
+ recorded_at
+ principal_id
+ effective_actor_id
+ site_id
+ area_id
+ correlation_id
+ causation_id
+ request_id
+ idempotency_key
+ result_reference
+ output_references[]
+ evidence_references[]
+ audit_reference
```

---

#### 14. Preparación y despacho parcial

Cuando existe cantidad disponible desde stock o producción liberada:

1. NEXO podrá asignar y preparar la cantidad disponible;
2. la línea conservará el saldo pendiente;
3. el despacho parcial requerirá autorización y cantidad exacta;
4. la documentación indicará solicitado, despachado y pendiente;
5. el destino recibirá únicamente la cantidad transferida;
6. el saldo podrá satisfacerse mediante otra producción, sustitución autorizada o cancelación parcial;
7. ninguna parcialidad marcará la línea completa como cumplida;
8. la remisión solo cerrará cuando cada línea esté recibida, cancelada o resuelta mediante una decisión explícita y conciliada.

El faltante no se representará únicamente mediante texto libre.

---

#### 15. Sustituciones

Una sustitución no será un efecto implícito de la producción insuficiente.

Reglas:

- requiere acción autorizada y causa estructurada;
- conserva la línea original, cantidad pendiente y producto solicitado;
- crea una relación explícita con la línea o producto sustituto;
- valida equivalencia de presentación, unidad, alérgenos, calidad, destino y aceptación cuando aplique;
- no cambia la receta ni producto de una orden productiva ya iniciada;
- una sustitución posterior a producción liberada no reasigna automáticamente la salida original;
- los efectos de inventario y costo se mantienen en sus identidades reales;
- el cierre conserva quién propuso, quién aprobó, qué cantidad se sustituyó y qué quedó pendiente.

---

#### 16. Cancelación y resultados tardíos

| Momento                                       | Tratamiento                                                                                                         |
| --------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| Antes de entrega a FOGO                       | NEXO cancela la necesidad sin crear efecto productivo.                                                              |
| Entregada, sin decisión                       | NEXO emite cancelación idempotente y espera receipt.                                                                |
| Aceptada, sin inicio                          | FOGO decide si puede cancelar y conserva la decisión.                                                               |
| En producción                                 | La cancelación de la remisión no cancela automáticamente la ejecución; FOGO decide detener, continuar o redestinar. |
| Resultado reportado o calidad pendiente       | La salida mantiene su ciclo productivo y de calidad.                                                                |
| Salida liberada, línea todavía abierta        | NEXO puede asignarla hasta la cantidad abierta autorizada.                                                          |
| Salida liberada, línea satisfecha o cancelada | La salida queda sin asignar a la remisión y sigue disposición de inventario aprobada.                               |
| Resultado recibido después de timeout         | Se reconcilia por identidad y versión antes de cualquier reintento.                                                 |

Ninguna cancelación elimina la relación histórica ni permite reutilizar la misma clave con otra línea.

---

#### 17. Prioridad, fechas y capacidad

La remisión podrá aportar:

- fecha requerida;
- prioridad logística aprobada;
- sede y destino;
- cantidad abierta;
- justificación;
- ventana de despacho.

Estas señales no imponen por sí solas:

- secuencia de producción;
- receta;
- lote;
- turno;
- equipo;
- fecha comprometida;
- aceptación de sobrecapacidad;
- consumo de materiales.

FOGO evaluará capacidad, materiales, personal, equipos, almacenamiento, calidad y compromisos existentes. Toda repriorización deberá conservar motivo, autoridad, impacto sobre otras necesidades y versión.

No se fija un tiempo numérico universal en esta tarea. Los tiempos se resolverán desde políticas operativas versionadas y serán verificables por sede, producto y modalidad.

---

#### 18. Fallos, reintentos e idempotencia

| Condición                                    | Resultado obligatorio                                                              |
| -------------------------------------------- | ---------------------------------------------------------------------------------- |
| Respuesta perdida                            | Estado `RECONCILIATION_REQUIRED`; consultar por identidad antes de reenviar.       |
| Mismo comando, mismo contenido               | Retornar receipt previo sin efecto nuevo.                                          |
| Misma clave, contenido distinto              | `IDEMPOTENCY_CONFLICT`.                                                            |
| Evento fuera de orden                        | Conservarlo o rechazarlo según versión; no retroceder estado silenciosamente.      |
| FOGO indisponible                            | Mantener faltante pendiente; no inventar rechazo ni aceptación.                    |
| NEXO indisponible al liberar salida          | FOGO conserva el hecho y el handoff pendiente; no duplica publicación.             |
| Cantidad liberada mayor que la abierta       | Asignar como máximo la cantidad abierta y enviar excedente a disposición aprobada. |
| Referencia a remisión inexistente o retirada | Bloquear asignación y abrir conciliación.                                          |
| Versión de línea obsoleta                    | Conflicto; recalcular con la versión vigente mediante nueva revisión.              |
| Error después de movimiento físico           | Preservar receipt y estado desconocido hasta conciliación; no repetir ciegamente.  |

El contrato es independiente del transporte y no activa por sí mismo una arquitectura de colas. La entrega técnica posterior deberá respetar el catálogo transversal y la clasificación condicional vigente.

---

#### 19. Autorización y segregación

Las acciones deberán evaluarse por separado:

- registrar o enviar necesidad productiva;
- aceptar, aceptar parcialmente o rechazar en FOGO;
- publicar plan u orden;
- iniciar, reportar o cerrar producción;
- decidir y verificar calidad;
- asignar salida a remisión;
- cancelar necesidad;
- autorizar sustitución;
- preparar o despachar cantidad liberada;
- conciliar diferencias y cerrar.

`NEXO-AUTH-007 — Proteger producción vinculada` deberá materializar el enforcement posterior para las acciones NEXO incluidas en este contrato. La existencia de una remisión, un lote o un rol visible no constituye autorización.

Se prohíbe que una misma acción:

- apruebe producción y se autoasigne salida;
- decida calidad y marque recepción logística;
- cambie cantidad solicitada para ocultar faltante;
- cierre una diferencia sin receipt o causa;
- use una identidad técnica como actor humano.

---

#### 20. Auditoría y evidencia

Cada vínculo deberá permitir reconstruir:

```text
REMISIÓN Y REVISIÓN
→ LÍNEA Y CANTIDAD SOLICITADA
→ POLÍTICA RESUELTA
→ STOCK ASIGNADO Y FALTANTE
→ NECESIDAD Y REVISIONES
→ DECISIÓN FOGO
→ PLAN, ORDEN Y LOTE
→ RESULTADO, MERMA Y CALIDAD
→ CANTIDAD LIBERADA
→ MOVIMIENTO Y ASIGNACIÓN NEXO
→ DESPACHO Y RECEPCIÓN
→ DIFERENCIAS, CANCELACIONES Y CONCILIACIÓN
```

La auditoría conservará:

- principal técnico y actor efectivo;
- aplicación emisora y componente publicador;
- timestamps del hecho y registro;
- versiones de contrato, política, línea y decisión;
- cantidades y unidades antes y después;
- referencias de plan, orden, lote, calidad, movimiento y receipt;
- causas estructuradas;
- reintentos, conflictos y resultados desconocidos;
- evidencia mínima autorizada;
- relación con correcciones o compensaciones.

No se copiarán recetas, fórmulas, credenciales ni información sensible innecesaria en logs o proyecciones NEXO.

---

#### 21. Matriz de conciliación

| Control                 | Diferencia detectada                                               | Salida                                                     |
| ----------------------- | ------------------------------------------------------------------ | ---------------------------------------------------------- |
| Necesidad vs. decisión  | Necesidad sin decisión, decisión sin necesidad o revisión distinta | `RECONCILIATION_REQUIRED`                                  |
| Aceptado vs. ordenado   | Cantidad aceptada sin orden o superior a la aceptada               | Bloqueo y revisión FOGO                                    |
| Ordenado vs. producido  | Producción parcial, exceso, merma o salida ausente                 | Estado explícito y saldo pendiente                         |
| Producido vs. liberado  | Resultado sin disposición o cantidad liberada incompatible         | Bloqueo de asignación                                      |
| Liberado vs. ingresado  | Salida liberada sin movimiento NEXO o movimiento duplicado         | Conciliación de inventario                                 |
| Ingresado vs. asignado  | Stock ingresado sin asignación o doble asignación                  | Liberar, reasignar o corregir mediante decisión autorizada |
| Asignado vs. despachado | Cantidad preparada o despachada superior a la asignada             | Bloqueo crítico                                            |
| Despachado vs. recibido | Diferencia de cantidad, condición o identidad                      | Caso de diferencia de remisión                             |
| Cancelado vs. producido | Producción posterior a cancelación                                 | Disposición separada; no cumplimiento automático           |
| Estado vs. evidencia    | Estado avanzado sin receipt o referencia                           | Revertir proyección o bloquear cierre sin borrar historia  |

La conciliación no reescribe saldos directamente. Toda corrección cuantitativa usa movimientos, receipts o compensaciones aprobadas.

---

#### 22. Handoff de implementación

La implementación posterior deberá:

1. materializar contratos compartidos y tipos desde `vento-shell`;
2. incluir `INT-PROD-005` únicamente en el paquete propietario que se defina mediante `DELIV-PKG-001::<package_id>`;
3. activar el grupo condicional `PRODUCTION_LINK_IMPLEMENTATION` y ejecutar `NEXO-AUTH-007`;
4. definir almacenamiento propietario sin escrituras cruzadas;
5. versionar desde `vento-shell` cualquier migración o configuración Supabase de VENTO;
6. adaptar NEXO para necesidad, proyección, asignación y conciliación;
7. adaptar FOGO para decisión, vínculo con plan, orden, lote, calidad y salida;
8. mapear los handoffs a las definiciones `VPROC` existentes y al sobre `EVENT-ENVELOPE-001`;
9. crear pruebas de contrato, autorización, idempotencia, concurrencia, parcialidad, cancelación, calidad, inventario y rollback;
10. ejecutar validación en CI y staging antes de operación controlada;
11. demostrar que no se duplica stock, producción, asignación, despacho ni recepción;
12. conservar compatibilidad o retiro explícito de notas y fallbacks legacy de faltante.

Esta tarea no autoriza esa implementación ni declara los repositorios físicamente conformes.

---

#### 23. Requisitos de prueba derivados

La tarea consume requisitos vigentes que ya incluyen explícitamente `INT-PROD-005` o protegen sus fronteras:

| Requisito              | Cobertura consumida                                                                           |
| ---------------------- | --------------------------------------------------------------------------------------------- |
| `TREQ-FOGO-001`        | ciclo productivo, parcialidad, cancelación, corrección y efectos auditables                   |
| `TREQ-FOGO-003`        | señal de remisión sin aprobación productiva automática; planificación y prioridad versionadas |
| `TREQ-INTEGRATION-006` | propiedad única de datos y ausencia de doble digitación o fuente competidora                  |
| `TREQ-INTEGRATION-011` | movimientos de inventario exactamente una vez, parcialidad y conciliación                     |
| `TREQ-INTEGRATION-013` | cadena demanda–producción–calidad–inventario correlacionada e idempotente                     |
| `TREQ-INTEGRATION-067` | FOGO como emisora de producción y NEXO como emisora de movimientos derivados                  |
| `TREQ-INTEGRATION-102` | separación entre producción terminada, calidad, inventario y pedido cumplido                  |
| `TREQ-NEXO-006`        | remisión operativa frente a publicación real de inventario sin doble contabilización          |
| `TREQ-NEXO-010`        | unidad, conversión, disponibilidad y política equivalentes entre consumidores                 |
| `TREQ-NEXO-011`        | ledger, reservas, movimientos, idempotencia, compensación y prevención de sobreasignación     |
| `TREQ-NEXO-269`        | faltantes, reemplazos, receipts, cantidades y obligaciones correlacionadas                    |

**Resultado sobre requisitos:** cero requisitos `TREQ-*` creados, modificados, diferidos, descartados u obsoletos. El Registro 04A ya asigna las reglas aplicables a `INT-PROD-005`; esta tarea las consume y las materializa sin alterar su texto, identidad, estado ni relaciones.

---

#### 24. Criterios de aceptación

La tarea se considera documentalmente completa cuando:

1. distingue faltante, necesidad, decisión, plan, orden, ejecución, calidad, inventario, asignación, despacho, recepción y conciliación;
2. congela las tres políticas `STOCK_ONLY`, `STOCK_THEN_PRODUCTION` y `MAKE_TO_ORDER`;
3. impide que una remisión cree por sí sola producción aprobada;
4. asigna propiedad inequívoca entre NEXO, FOGO y SHELL;
5. define identidad, revisiones, idempotencia y conflicto de la necesidad;
6. materializa campos mínimos y decisiones de FOGO;
7. define estados completos del vínculo;
8. conserva cantidades originales y soporta parcialidad sin reducción silenciosa;
9. separa salida productiva, liberación de calidad, ingreso y asignación NEXO;
10. utiliza las definiciones `VPROC` vigentes sin crear un catálogo paralelo;
11. regula sustituciones, cancelaciones y resultados tardíos;
12. define fallos, timeouts, eventos fuera de orden y conciliación antes de reintento;
13. define controles de autorización y segregación;
14. preserva auditoría suficiente sin replicar información sensible;
15. vincula cada diferencia a una salida de conciliación;
16. entrega un handoff de implementación concreto sin ejecutar cambios físicos;
17. consume los requisitos vigentes sin alterar 04A;
18. reserva `PRINT-ARC-001` sin desarrollarla.

---

#### 25. Continuidad integral rectificada

```text
PREDECESORA CANÓNICA PENDIENTE
INT-PROD-004 — Definir contrato para que NEXO registre el producto terminado
        ↓
EVIDENCIA DOCUMENTAL YA APROBADA
INT-PROD-005 — Definir tratamiento de producción insuficiente para remisiones
        ↓
SIGUIENTE TAREA DEL FLUJO INTEGRAL
INT-POS-001 — Auditar documentación, endpoints, webhooks y límites del POS vigente
```


POS EXTERNO → CONTRATO CANÓNICO DE VENTAS → NEXO / NUMERA / PASS

Principio de transición

Mientras PULSO no sea la fuente operativa y fiscal definitiva de ventas,
el POS vigente podrá actuar como fuente temporal de ventas confirmadas.

El POS externo será fuente temporal de:

- hecho de venta;
- líneas vendidas;
- documento fiscal emitido externamente;
- descuentos;
- impuestos;
- propinas;
- medios de pago;
- anulaciones y devoluciones.

El POS externo no será propietario de:

- inventario;
- recetas;
- costos;
- contabilidad interna;
- catálogo canónico de productos;
- fidelización;
- autorización laboral.
