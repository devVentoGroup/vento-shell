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


### ✅ INT-PROD-002 — Definir contrato para que NEXO registre el consumo

**Estado:** APROBADA  
**Tarea anterior:** `INT-PROD-001 — Definir contrato para que FOGO solicite o reserve insumos`  
**Tarea siguiente:** `INT-PROD-003 — Definir contrato para que FOGO finalice el lote`  
**Tipo de tarea:** documental; definición contractual del registro autoritativo de consumo de materiales entre FOGO y NEXO, con separación de captura productiva, efecto físico, movimiento, aceptación, posting, idempotencia, excepciones y conciliación; sin implementación física, migraciones, cambios de datos, despliegue ni modificación de Supabase  
**Línea base documental:** `vento-shell@7ced408febe244bbb61bf3cdc41aa102365748a8`  
**Aplicaciones involucradas:** `FOGO`, `NEXO` y `SHELL`; `NUMERA` únicamente como consumidora posterior de resultados económicos cuando corresponda  
**Cambios físicos autorizados:** ninguno

---

#### 1. Propósito

Definir de forma inequívoca cómo el uso real de materiales durante una ejecución productiva de FOGO produce exactamente una vez el efecto físico autoritativo de consumo en NEXO, sin permitir que FOGO escriba directamente el ledger de inventario ni que NEXO reinterprete la receta, la orden o la clasificación productiva.

La regla raíz es:

```text
MATERIAL RESERVADO Y PREPARADO
+
EJECUCIÓN PRODUCTIVA VÁLIDA EN FOGO
+
USO REAL CAPTURADO CONTRA ORDEN, RECETA Y MATERIAL
        ↓
SOLICITUD DE EFECTO CORRELACIONADA A NEXO
        ↓
VALIDACIÓN AUTORITATIVA DE NEXO
        ↓
RETIRO / CONSUMO FÍSICO EN VPROC-0025
        ↓
ACEPTACIÓN DEL CONSUMIDOR PRODUCTIVO
        ↓
MOVIMIENTO CANÓNICO + PROYECCIONES NEXO
        ↓
STOCK_OPERATION_RECONCILED
        ↓
FOGO CONCILIA RESERVADO, CONSUMIDO, DEVUELTO Y DESPERDICIADO
```

La tarea elimina las siguientes ambigüedades:

1. una reserva confirmada no equivale a consumo;
2. una captura de cantidad utilizada en FOGO no equivale por sí sola a un movimiento físico de inventario;
3. el movimiento autoritativo pertenece a NEXO;
4. el consumo productivo debe conservar la referencia a la ejecución, orden, receta, material, fuente física y cantidad reales;
5. el efecto de inventario no puede ejecutarse dos veces por reintento, respuesta perdida, doble envío, concurrencia u operación fuera de orden;
6. una diferencia entre reservado y utilizado no puede desaparecer por edición silenciosa;
7. una devolución no borra el movimiento original;
8. una merma o desperdicio productivo no puede convertirse automáticamente en un segundo descuento de inventario;
9. un consumo reconciliado no equivale a lote finalizado, calidad liberada ni producto terminado ingresado;
10. no se crea un nuevo evento empresarial para representar consumo si el catálogo vigente ya cubre los hitos materiales del proceso.

---

#### 2. Alcance funcional

Esta tarea gobierna exclusivamente el tramo comprendido entre el inicio de ejecución productiva y la conciliación del efecto físico de los materiales utilizados.

Incluye:

- captura productiva del uso real de cada material en FOGO;
- vínculo con la reserva y operación NEXO originadas por `INT-PROD-001`;
- validación de producto, unidad, conversión, fuente, lote, LPN, condición y cantidad;
- retiro o consumo físico autoritativo en NEXO;
- aceptación del efecto por el proceso consumidor de FOGO;
- creación exactamente una vez del movimiento y de las proyecciones de inventario correspondientes;
- consumo total, parcial y dividido entre varias fuentes físicas;
- uso inferior o superior a la reserva original;
- sustituciones productivas y físicas;
- devolución de material no utilizado;
- desperdicio, merma y diferencias de conciliación;
- cancelación, anulación, retorno y ajuste;
- concurrencia, idempotencia, reintento, respuesta perdida y resultado incierto;
- eventos fuera de orden y dependencias faltantes;
- auditoría y conciliación entre FOGO y NEXO.

No incluye:

- creación o publicación de recetas;
- planificación productiva;
- solicitud o reserva inicial de materiales, ya definida en `INT-PROD-001`;
- cierre operativo del lote, reservado a `INT-PROD-003`;
- ingreso de producto terminado, reservado a `INT-PROD-004`;
- decisión o liberación de calidad;
- costos finales o asiento económico;
- implementación de tablas, funciones, RPC, triggers, RLS, colas, workers, jobs o adaptadores;
- creación de un ledger paralelo en FOGO;
- creación de eventos empresariales adicionales para duplicar hitos ya existentes.

---

#### 3. Dependencias canónicas preservadas

El contrato consume sin reinterpretación:

- `VPROC-0034` como proceso FOGO de preparación y ejecución productiva contra una versión aprobada;
- `VPROC-0025` como proceso NEXO de retiro, consumo o traslado de existencias;
- `VPROC-0016` como fuente del ciclo de versión de receta;
- `INT-PROD-001` como contrato de requerimiento, solicitud, validación y reserva previa;
- `EVENT-ENVELOPE-001` como sobre transversal de identidad, contexto, correlación e idempotencia;
- el contrato de idempotencia de `INT-APP-004`;
- el contrato de reintentos de `INT-APP-005`;
- las reglas de compensación, auditoría, estados pendientes, error parcial y prohibición de escrituras cruzadas de `INT-APP-006` a `INT-APP-010`;
- los contratos de entrada, salida, eventos, auditoría y métricas de `PROC-CAT-015` a `PROC-CAT-019`.

No se crea un proceso alterno de consumo y no se redefine la máquina de estados de `VPROC-0025` ni de `VPROC-0034`.

---

#### 4. Propiedad empresarial

| Elemento                                                                  | Propietaria                         | Regla obligatoria                                                           |
| ------------------------------------------------------------------------- | ----------------------------------- | --------------------------------------------------------------------------- |
| orden productiva, estado y versión de ejecución                           | `FOGO`                              | FOGO determina qué ejecución está ocurriendo y contra qué orden             |
| receta y versión aplicada                                                 | `FOGO`                              | la ejecución conserva la formulación exacta que explica el uso esperado     |
| material esperado por receta y revisión                                   | `FOGO`                              | FOGO conserva la necesidad teórica y su contexto productivo                 |
| cantidad real observada o declarada como utilizada en producción          | `FOGO`                              | FOGO captura el hecho operativo de uso dentro de la ejecución               |
| clasificación productiva de consumo, devolución, desperdicio o desviación | `FOGO`                              | la clasificación debe conservarse sin reescribir la receta esperada         |
| stock físico, disponibilidad, reserva y fuente física                     | `NEXO`                              | NEXO conserva la verdad de existencias, ubicaciones, lotes, LPN y condición |
| retiro o consumo físico de existencias                                    | `NEXO`                              | únicamente NEXO produce el efecto autoritativo sobre el ledger              |
| movimiento canónico y proyecciones de stock                               | `NEXO`                              | cada efecto físico queda respaldado por movimiento correlacionado           |
| aceptación del consumo por el proceso productivo                          | `FOGO` como consumidora del handoff | confirma correspondencia con ejecución y material, sin escribir inventario  |
| contratos compartidos y compatibilidad                                    | `SHELL`                             | no fabrica hechos de producción ni de inventario                            |
| efecto económico posterior                                                | `NUMERA` cuando aplique             | consume resultados; no altera cantidades físicas ni productivas             |

Regla de segregación:

```text
FOGO DECLARA QUÉ MATERIAL UTILIZÓ EN SU EJECUCIÓN
NEXO DECIDE Y REGISTRA EL EFECTO FÍSICO AUTORITATIVO
FOGO ACEPTA O RECHAZA LA CORRESPONDENCIA DEL HANDOFF
NEXO CONCILIA EL MOVIMIENTO Y SUS PROYECCIONES
NINGUNA APLICACIÓN ESCRIBE LA VERDAD PROPIETARIA DE LA OTRA
```

---

#### 5. Separación obligatoria de conceptos

| Concepto                  | Qué demuestra                                                                  | Qué no demuestra                        |
| ------------------------- | ------------------------------------------------------------------------------ | --------------------------------------- |
| requerimiento material    | cantidad teórica necesaria según orden y receta                                | que exista stock o que se haya usado    |
| reserva                   | cantidad apartada por NEXO                                                     | que haya salido o sido consumida        |
| material listo            | condiciones productivas suficientes para preparar el inicio                    | que exista consumo                      |
| uso productivo capturado  | FOGO registró una cantidad real contra la ejecución                            | que NEXO haya aplicado el efecto físico |
| ejecución física          | NEXO está retirando, consumiendo o trasladando con cantidades reales           | que el posting esté concluido           |
| aceptación del consumidor | FOGO reconoce cantidad, condición y evidencia del handoff                      | que el ledger ya esté reconciliado      |
| posting pendiente         | el efecto físico validado espera movimiento canónico y proyecciones            | que el cierre haya terminado            |
| consumo reconciliado      | NEXO concluyó cantidad, unidad, origen, destino y movimientos sin doble efecto | que el lote productivo haya finalizado  |
| conciliación productiva   | FOGO explicó reservado, utilizado, devuelto, desperdiciado y diferencias       | que exista liberación de calidad        |

Una interfaz, RPC o registro no podrá usar un único estado genérico para representar simultáneamente reserva, uso productivo, movimiento, posting y conciliación.

---

#### 6. Condiciones de entrada

El tramo de consumo solo podrá ejecutarse cuando existan referencias resolubles y vigentes a:

- una instancia de `VPROC-0034` que haya alcanzado `VPROC-0034.IN_PRODUCTION` mediante la progresión aprobada;
- una orden productiva autorizada y su versión;
- una versión exacta de receta;
- una línea o requerimiento material identificable;
- una instancia NEXO de `VPROC-0025` relacionada con la necesidad productiva;
- la reserva aplicable cuando el material haya seguido el flujo ordinario definido en `INT-PROD-001`;
- `source_stock_ref` válido;
- `destination_or_consumption_ref` que identifique el uso productivo;
- producto, cantidad y unidad compatibles;
- sede y área productiva;
- actor o principal autorizado;
- correlación e identidad idempotente suficientes.

Si la reserva previa resulta insuficiente o debe ampliarse por una excepción autorizada, el delta deberá recorrer una operación NEXO vinculada con validación y reserva propias antes del efecto físico. Nunca se interpreta la ausencia de reserva suficiente como permiso para consumir stock sin operación propietaria.

---

#### 7. Fuente del dato de consumo productivo

FOGO deberá conservar por cada material utilizado una captura productiva verificable que permita reconstruir:

- instancia de `VPROC-0034`;
- orden productiva y versión;
- receta y versión;
- lote o ejecución productiva cuando exista su identidad estable;
- línea o requerimiento material y revisión;
- producto canónico;
- cantidad teórica requerida;
- cantidad real utilizada declarada;
- unidad de captura;
- unidad de stock esperada o referencia suficiente para resolverla;
- sede y área;
- actor efectivo y principal técnico;
- turno cuando aplique;
- momento del hecho;
- paso, etapa o contexto productivo cuando aporte trazabilidad;
- desviación o motivo cuando la cantidad difiera del esperado;
- sustitución aprobada cuando exista;
- evidencia requerida por materialidad o política.

La captura deberá preservar el valor esperado y el valor real como conceptos distintos. La cantidad real no reescribe la receta ni el requerimiento original.

---

#### 8. Solicitud de efecto desde FOGO hacia NEXO

La captura de FOGO origina una solicitud de efecto hacia NEXO. Esa solicitud es un comando de integración y no un movimiento de inventario.

Información empresarial mínima:

- referencia a la instancia productiva;
- referencia a la orden y su versión;
- referencia a la receta y su versión;
- referencia a la línea de material o requerimiento;
- referencia a la instancia NEXO de stock relacionada;
- referencia a la reserva aplicable;
- producto canónico;
- cantidad real cuya salida o consumo físico se solicita;
- unidad de entrada;
- referencia a la fuente física cuando ya esté determinada;
- lote, LPN o presentación cuando aplique;
- uso productivo identificable mediante `destination_or_consumption_ref`;
- sede y área;
- momento del hecho productivo;
- referencia de sustitución, desviación o excepción cuando corresponda.

Contexto transversal mínimo cuando aplique:

- `request_id`;
- `idempotency_key`;
- `source_command_id`;
- `correlation_id`;
- `causation_id`;
- `process_instance_id`;
- versión del agregado o recurso;
- principal técnico;
- actor efectivo;
- sede y área;
- versión contractual;
- referencias de evidencia.

FOGO no enviará como autoridad:

- saldo físico resultante;
- cantidad disponible definitiva;
- lote o ubicación sustituidos sin validación NEXO;
- movimiento de inventario ya afirmado;
- estado `POSTING_PENDING` o `STOCK_OPERATION_RECONCILED`;
- identificador de movimiento inventado por la interfaz;
- costo físico definitivo;
- ajuste del ledger.

---

#### 9. Validación autoritativa de NEXO

Antes de producir el efecto, NEXO deberá revalidar como mínimo:

1. que la operación está vigente y autorizada;
2. que la referencia productiva de destino o consumo corresponde al contexto recibido;
3. que el producto coincide con la reserva, sustitución o excepción aprobada;
4. que la unidad y conversión son deterministas y vigentes;
5. que `source_stock_ref` existe y pertenece a la sede correcta;
6. que la ubicación, lote, LPN, condición y disponibilidad permiten la operación;
7. que la cantidad solicitada es positiva y se encuentra dentro del alcance autorizado;
8. que el efecto no fue aplicado antes con la misma identidad lógica;
9. que la versión de la reserva o recurso no quedó obsoleta;
10. que no existe conflicto concurrente que haya consumido o reasignado la misma cantidad;
11. que no se producirán saldos negativos no autorizados;
12. que cualquier sustitución física cumple la política aplicable;
13. que una sustitución de ingrediente productivo ya cuenta con autoridad FOGO cuando corresponda.

Una validación exitosa no sustituye el movimiento ni demuestra por sí sola que el consumo quedó reconciliado.

---

#### 10. Relación con la reserva definida en INT-PROD-001

La operación de consumo deberá conservar la relación con la reserva que la habilitó cuando exista flujo ordinario.

Por cada línea material deben poder distinguirse al menos:

```text
requested_qty
reserved_qty
issued_qty
remaining_reserved_qty
released_without_issue_qty
```

Reglas:

1. `reserved_qty` no se reduce por una edición del lado FOGO;
2. `issued_qty` representa la cantidad que NEXO realmente retira o aplica como salida física hacia el uso productivo;
3. la parte reservada que no llega a salir permanece reservada o recibe una acción propietaria explícita de liberación/cancelación;
4. una liberación de reserva que nunca produjo salida física no se registra como devolución;
5. cada cambio conserva referencia a la operación y versión que lo causó;
6. la suma de efectos de varias fuentes físicas debe ser conciliable con la cantidad emitida hacia producción.

Dentro del mismo alcance y unidad normalizada, al cerrar la obligación de una reserva debe cumplirse:

```text
reserved_qty
=
issued_qty
+ remaining_reserved_qty
+ released_without_issue_qty
```

Cualquier diferencia permanece abierta para conciliación y no se absorbe mediante redondeo arbitrario.

---

#### 11. Cantidades después de la salida física

FOGO deberá clasificar el destino productivo de la cantidad emitida por NEXO sin alterar el movimiento original.

Para una misma cantidad emitida y normalizada a la misma unidad:

```text
issued_qty
=
actual_consumed_qty
+ returned_qty
+ production_waste_qty
+ unresolved_variance_qty
```

Interpretación:

- `actual_consumed_qty`: cantidad aplicada efectivamente a la ejecución productiva;
- `returned_qty`: cantidad emitida hacia producción que luego regresa físicamente a inventario mediante operación NEXO vinculada;
- `production_waste_qty`: cantidad cuya pérdida o desperdicio se atribuye al proceso productivo y queda clasificada por FOGO;
- `unresolved_variance_qty`: diferencia todavía no explicada y que bloquea conciliación completa.

Las cuatro cantidades deben compartir alcance, producto equivalente, unidad normalizada y referencias suficientes para reconstruir su origen.

La clasificación productiva no crea por sí sola movimientos adicionales. Si una devolución, disposición, ajuste o cambio de condición produce otro efecto físico, NEXO deberá registrarlo mediante el proceso propietario correspondiente y relacionarlo con el hecho original.

---

#### 12. Progresión canónica de VPROC-0025

La tarea reutiliza exactamente la progresión vigente:

```text
VPROC-0025.STOCK_OPERATION_REQUESTED
        ↓
VPROC-0025.VALIDATION_IN_PROGRESS
        ↓
VPROC-0025.RESERVED
        ↓
VPROC-0025.READY_FOR_EXECUTION
        ↓
VPROC-0025.IN_EXECUTION
        ↓
VPROC-0025.DESTINATION_CONFIRMATION_PENDING
        ↓
VPROC-0025.POSTING_PENDING
        ↓
VPROC-0025.STOCK_OPERATION_RECONCILED
```

Semántica aplicable al consumo productivo:

- `RESERVED`: cantidad apartada, todavía no consumida;
- `READY_FOR_EXECUTION`: operación autorizada y preparada físicamente;
- `IN_EXECUTION`: se retira o consume existencia capturando cantidades reales;
- `DESTINATION_CONFIRMATION_PENDING`: FOGO, como proceso consumidor, debe aceptar cantidad, condición y evidencia del handoff;
- `POSTING_PENDING`: el efecto físico validado espera el movimiento canónico y las proyecciones correlacionadas;
- `STOCK_OPERATION_RECONCILED`: cantidad, unidad, origen, destino, custodia y movimientos quedaron conciliados sin doble efecto.

Ningún estado intermedio se presentará como cierre final de consumo.

---

#### 13. Relación con la progresión de VPROC-0034

FOGO conserva su propia progresión:

```text
VPROC-0034.MATERIALS_READY
        ↓
VPROC-0034.IN_PRODUCTION
        ↓
VPROC-0034.OUTPUT_REPORTED
        ↓
VPROC-0034.CONSUMPTION_RECONCILIATION_PENDING
        ↓
VPROC-0034.READY_FOR_QUALITY
```

Reglas de acoplamiento:

1. el paso a `IN_PRODUCTION` permite capturar consumos, tiempos y desviaciones;
2. una captura FOGO puede iniciar o continuar el handoff hacia NEXO, pero no sustituye el efecto NEXO;
3. `OUTPUT_REPORTED` no implica que todos los consumos estén conciliados;
4. en `CONSUMPTION_RECONCILIATION_PENDING` FOGO compara materiales reservados, emitidos/consumidos, devueltos, desperdiciados y diferencias;
5. FOGO no debe tratar el consumo como conciliado mientras exista una operación NEXO pendiente, desconocida, duplicada en conflicto o con diferencia material sin resolver;
6. el avance a `READY_FOR_QUALITY` requiere que el expediente de consumo sea coherente o que las diferencias hayan recibido el tratamiento canónico autorizado;
7. este avance no ingresa producto terminado a NEXO.

---

#### 14. Momento autoritativo del efecto físico

El hecho productivo y el efecto físico son dos verdades relacionadas, pero distintas.

```text
FOGO CAPTURA USO REAL
        ↓
NEXO ACEPTA LA OPERACIÓN
        ↓
NEXO EJECUTA EL RETIRO / CONSUMO
        ↓
FOGO ACEPTA EL HANDOFF
        ↓
NEXO PUBLICA MOVIMIENTO Y PROYECCIONES
        ↓
NEXO RECONCILIA
```

La fuente autoritativa de que el inventario quedó afectado es el resultado reconciliado de NEXO con su movimiento canónico. Una respuesta de interfaz, un ACK técnico, un cambio visual o una fila FOGO no sustituyen esa prueba.

---

#### 15. Movimiento canónico de inventario

Por cada efecto físico aplicado, NEXO deberá conservar un movimiento inmutable o una composición de movimientos que permita reconstruir al menos:

- identificador estable del efecto o movimiento;
- instancia de `VPROC-0025`;
- tipo semántico de operación;
- producto;
- cantidad y signo;
- cantidad de entrada cuando difiera de la unidad de stock;
- unidad de entrada;
- factor o regla de conversión vigente;
- unidad de stock;
- sede;
- ubicación de origen;
- lote, LPN, posición o presentación cuando aplique;
- destino o referencia de consumo productivo;
- orden, lote o ejecución FOGO correlacionada;
- actor y principal;
- momento del hecho;
- referencias de idempotencia, correlación y causalidad;
- relación con reserva, sustitución, devolución o ajuste cuando exista.

La tarea no congela un nombre físico de tabla, columna, enum o RPC. Esa materialización corresponde a las tareas de arquitectura e implementación ya asignadas.

---

#### 16. Confirmación del consumidor productivo

Cuando `VPROC-0025` alcance `DESTINATION_CONFIRMATION_PENDING`, FOGO deberá poder comprobar que el handoff recibido corresponde a:

- su instancia productiva;
- la orden y versión esperadas;
- el material esperado o la sustitución autorizada;
- la cantidad y unidad aceptables;
- la fuente física y lote cuando sean relevantes para trazabilidad;
- la condición material aplicable;
- el actor y momento razonables;
- la misma correlación de negocio.

La confirmación de FOGO:

- acepta o rechaza correspondencia con la ejecución;
- no recalcula el saldo físico;
- no publica el movimiento de inventario;
- no modifica la fuente NEXO;
- no convierte una diferencia en ajuste automático.

Un rechazo o diferencia obliga a mantener el proceso pendiente, aplicar una excepción o reconciliar; no autoriza a borrar el retiro físico ya ocurrido.

---

#### 17. Consumo total

Existe consumo total cuando la cantidad autorizada para la operación queda físicamente emitida hacia producción y la obligación asociada no conserva saldo pendiente dentro de esa operación.

Condiciones mínimas:

- todas las líneas o particiones físicas aplicables fueron ejecutadas;
- la cantidad normalizada coincide con el alcance autorizado;
- FOGO acepta la correspondencia productiva;
- NEXO publica el movimiento y actualiza las proyecciones una sola vez;
- no existe conflicto idempotente ni movimiento duplicado;
- el proceso NEXO llega a `STOCK_OPERATION_RECONCILED`.

Consumo total no equivale a finalización del lote.

---

#### 18. Consumo parcial

`VPROC-0025.EX-004 — PARTIAL` gobierna el cumplimiento parcial cuando no toda la cantidad puede o debe ejecutarse.

Debe conservar explícitamente:

- cantidad solicitada;
- cantidad reservada aplicable;
- cantidad ejecutada;
- cantidad pendiente;
- riesgo o restricción;
- responsable de la decisión;
- impacto sobre la ejecución productiva;
- próxima acción o decisión.

Una operación parcial:

- no puede presentarse como cierre completo;
- no reduce silenciosamente el requerimiento de FOGO;
- no crea stock ficticio para cubrir la diferencia;
- puede requerir que FOGO ajuste plan, escala o ejecución mediante sus propias decisiones;
- mantiene la diferencia abierta hasta cumplimiento, cancelación, sustitución o reconciliación autorizada.

---

#### 19. Uso inferior a la reserva

Si `issued_qty < reserved_qty`:

1. la diferencia no se consume por inferencia;
2. puede permanecer reservada si la ejecución todavía la requiere;
3. puede cancelarse la parte futura mediante la acción propietaria aplicable de NEXO;
4. si nunca salió físicamente, no se registra como devolución;
5. FOGO conserva la diferencia entre requerimiento, reserva y uso real;
6. la liberación de la reserva no reescribe el requerimiento histórico;
7. la cantidad liberada vuelve a disponibilidad únicamente mediante el efecto propietario NEXO correspondiente.

---

#### 20. Uso superior a la reserva

Si FOGO determina que necesita usar más material del reservado:

1. FOGO no amplía por sí sola la reserva ni el saldo disponible;
2. NEXO deberá validar el delta adicional antes de producir el efecto;
3. el delta se representa mediante una operación NEXO vinculada que vuelve a validar y reservar la cantidad adicional antes de ejecutarla, preservando la historia de la cantidad original;
4. la identidad del delta debe ser distinta de la operación ya aplicada para evitar reutilización conflictiva de la misma clave;
5. no se autoriza saldo negativo por el solo hecho de que la producción ya haya comenzado;
6. si no existe stock elegible, se aplica faltante, parcialidad, sustitución o escalamiento según corresponda;
7. la desviación productiva queda registrada en FOGO.

---

#### 21. División entre varias fuentes físicas

Un mismo material podrá satisfacerse desde varias ubicaciones, lotes, LPN o presentaciones cuando la política NEXO lo permita.

Reglas:

- cada partición conserva fuente, cantidad, unidad y evidencia propias;
- la suma normalizada de las particiones debe reconciliar con la cantidad física emitida;
- ninguna partición puede reutilizar la misma identidad lógica para dos efectos distintos;
- el orden de selección física pertenece a NEXO;
- FOGO recibe la proyección necesaria para trazabilidad sin convertirse en propietaria de la selección;
- un fallo en una partición no permite marcar las demás como fallidas si ya produjeron efecto válido;
- una recuperación posterior debe consultar qué particiones ya fueron aplicadas antes de repetir trabajo.

---

#### 22. Sustitución de ingrediente productivo

Una sustitución que cambia el material de la receta, su equivalencia productiva o la decisión técnica pertenece a FOGO y requiere la autoridad aplicable.

El contrato deberá conservar:

- material originalmente esperado;
- material sustituto;
- motivo;
- actor o autoridad;
- revisión de la ejecución o referencia de sustitución;
- cantidades y unidades afectadas;
- impacto sobre receta, trazabilidad y calidad cuando corresponda.

NEXO no puede convertir un faltante de stock en sustitución de ingrediente por conveniencia operativa.

---

#### 23. Sustitución física dentro de NEXO

`VPROC-0025.EX-002 — SUBSTITUTE` puede sustituir origen, destino o presentación antes de ejecución cuando exista compatibilidad y autoridad.

La sustitución física:

- no cambia silenciosamente el producto de la receta;
- conserva conversión y trazabilidad;
- exige que lote, condición, ubicación y presentación sean elegibles;
- conserva antes y después;
- queda vinculada a la misma necesidad productiva;
- requiere nueva aceptación cuando el cambio altere información que FOGO deba conocer.

---

#### 24. Desperdicio y merma

FOGO conserva la clasificación productiva del desperdicio o merma dentro de la ejecución.

Reglas:

1. una cantidad ya emitida por NEXO no se descuenta otra vez por ser clasificada después como desperdicio;
2. FOGO conserva cantidad, unidad, causa, etapa, actor y relación con la ejecución;
3. si el desperdicio implica una condición, disposición o efecto físico adicional sobre existencia todavía gobernada por NEXO, se utiliza el proceso NEXO correspondiente;
4. una merma no explicada permanece como diferencia y no puede ser absorbida mediante ajuste automático;
5. el cierre productivo posterior deberá conservar la relación entre consumo, desperdicio, rendimiento y salida;
6. la clasificación no modifica la receta esperada ni el movimiento original.

---

#### 25. Material no utilizado que regresa a inventario

Cuando una cantidad ya salió físicamente hacia producción pero no fue utilizada y regresa a custodia NEXO:

- el movimiento original permanece inmutable;
- se utiliza `VPROC-0025.CCR-003 — RETURN` o el proceso físico aplicable según el estado y la naturaleza de la devolución;
- el retorno conserva origen, destino, cantidad, unidad, condición y aceptación;
- el retorno se vincula explícitamente al efecto original;
- la disponibilidad solo se actualiza cuando NEXO confirma el retorno físico;
- FOGO clasifica la cantidad como devuelta dentro de su conciliación productiva;
- una devolución no se representa reduciendo retrospectivamente `issued_qty`.

---

#### 26. Diferencia posterior y ajuste

Cuando conteo, inspección o conciliación demuestren una diferencia respecto del movimiento registrado:

- no se edita ni elimina el movimiento original;
- se utiliza `VPROC-0025.CCR-004 — ADJUST` cuando corresponda;
- se conserva observación, valor original, diferencia, causa, autoridad y evidencia;
- el ajuste crea un efecto vinculado y actualiza proyecciones mediante NEXO;
- FOGO recibe la consecuencia necesaria para su expediente productivo;
- la diferencia puede mantener bloqueado el avance de conciliación mientras sea material y no esté resuelta.

---

#### 27. Cancelación

`VPROC-0025.CCR-001 — CANCEL` detiene únicamente la ejecución restante.

Reglas:

- antes de un efecto físico, la cancelación puede impedir trabajo futuro y liberar obligaciones pendientes según el proceso propietario;
- después de un efecto confirmado, la cancelación no borra el movimiento;
- las cantidades ya ejecutadas permanecen y deben conciliarse;
- las cantidades todavía reservadas reciben el tratamiento propietario aplicable;
- si una cantidad física debe volver, se usa retorno o movimiento compensatorio, no edición del historial;
- FOGO conserva el motivo y el impacto sobre la ejecución.

---

#### 28. Anulación

`VPROC-0025.CCR-002 — VOID` solo aplica a una instrucción inválida o duplicada que no produjo un efecto físico válido.

Se prohíbe usar `VOID` para ocultar:

- una salida física ya ocurrida;
- un consumo confirmado;
- un movimiento que debe devolverse;
- una diferencia que requiere ajuste;
- una operación que simplemente terminó con cantidad distinta de la esperada.

La nulidad conserva el registro original y la causa.

---

#### 29. Hold, faltante y escalamiento

`VPROC-0025.EX-001 — HOLD` podrá suspender la operación antes del posting cuando exista una condición que deba resolverse sin producir efectos parciales adicionales.

`VPROC-0025.EX-003 — ESCALATE` se utilizará cuando exista faltante o restricción durante reserva o ejecución y se requiera decisión.

Ninguna de estas acciones:

- crea stock;
- concede autoridad adicional;
- aprueba una sustitución productiva;
- convierte un consumo pendiente en reconciliado;
- borra efectos ya confirmados.

---

#### 30. Idempotencia del efecto de consumo

Cada efecto lógico de consumo deberá obtener una identidad idempotente estable antes del primer intento de producir el efecto NEXO.

La huella lógica deberá cubrir, como mínimo cuando aplique:

- operación o efecto solicitado;
- instancia productiva;
- orden y versión;
- línea de material;
- instancia NEXO o reserva relacionada;
- producto;
- cantidad normalizada;
- unidad y versión de conversión;
- fuente física o alcance de selección;
- lote/LPN cuando forme parte del efecto;
- revisión o versión del recurso.

Reglas:

1. misma identidad y misma huella devuelve el resultado original y no aplica otro movimiento;
2. misma identidad con contenido incompatible produce conflicto y ningún segundo efecto;
3. un cambio material de cantidad, fuente, producto o revisión requiere nueva identidad lógica vinculada a la anterior;
4. un refresh, doble click o timeout no crea una operación nueva;
5. el identificador técnico de un intento no sustituye la identidad empresarial;
6. la deduplicación debe existir en la frontera propietaria y no únicamente en la interfaz.

---

#### 31. Respuesta perdida y resultado desconocido

Cuando FOGO no reciba una respuesta concluyente después de enviar la solicitud de efecto:

1. no enviará automáticamente una nueva operación con otra identidad;
2. consultará o recuperará el resultado de la identidad original;
3. NEXO devolverá el resultado previo cuando ya exista;
4. si el resultado sigue incierto, el caso permanece recuperable o requiere conciliación;
5. una segunda aplicación del efecto queda prohibida hasta conocer el estado de la primera;
6. la interfaz mostrará un estado verdadero de pendiente o conciliación y no afirmará éxito por timeout;
7. una recuperación tardía debe converger al mismo movimiento y resultado.

---

#### 32. Reintentos

Los reintentos conservan:

- la misma operación lógica;
- la misma identidad idempotente;
- la misma huella lógica;
- el mismo alcance empresarial;
- la correlación y causalidad;
- el presupuesto y política transversal aplicables.

Un reintento no:

- cambia la cantidad para intentar que pase;
- cambia silenciosamente la fuente física;
- renueva permisos vencidos;
- reinicia una operación cancelada;
- transforma un conflicto en operación nueva;
- duplica el movimiento porque la respuesta anterior no llegó.

Si el resultado puede haber sido confirmado, se consulta antes de otro envío.

---

#### 33. Concurrencia

NEXO deberá impedir que dos operaciones consuman la misma disponibilidad más allá de lo autorizado.

Se requiere conceptualmente:

- control atómico, versión, claim, bloqueo o mecanismo equivalente en la frontera propietaria;
- revalidación de disponibilidad al ejecutar;
- detección de versión obsoleta;
- reserva y consumo coherentes bajo concurrencia;
- imposibilidad de que dos efectos válidos reutilicen la misma cantidad reservada;
- resultado determinista para el perdedor de la carrera;
- conservación de la intención original para reintento o escalamiento.

La tarea no selecciona una tecnología física específica.

---

#### 34. Eventos fuera de orden

Si una solicitud, evento o confirmación llega antes de una dependencia obligatoria:

- no se aplica el consumo suponiendo la dependencia;
- se conserva la información recibida con su identidad;
- se espera la reserva, versión, orden, autorización o relación faltante cuando la política permita diferir;
- una versión anterior no sobrescribe una posterior;
- la llegada de la dependencia reanuda evaluación sin crear otra operación;
- si la relación nunca puede resolverse, el caso pasa a error o conciliación según el contrato transversal.

Ejemplos que no pueden aplicarse por inferencia:

- consumo antes de conocer la instancia productiva;
- consumo para una revisión de receta distinta;
- confirmación FOGO antes de existir el handoff NEXO;
- evento de cierre NEXO recibido antes de conocer el movimiento relacionado.

---

#### 35. Fallo parcial

Cuando una operación dividida produce algunos efectos válidos y otros fallan:

- los efectos aplicados permanecen inmutables;
- no se revierte todo mediante edición masiva;
- el estado debe identificar qué particiones se aplicaron, cuáles están pendientes y cuáles fallaron;
- el reintento se limita a la parte no aplicada;
- cualquier retorno o compensación posterior se relaciona con el efecto que corrige;
- FOGO no puede considerar conciliada la línea mientras quede una diferencia material sin tratamiento;
- NEXO no duplica las particiones ya aplicadas.

---

#### 36. Catálogo de eventos reutilizado

No se crea una nueva definición de evento empresarial para el consumo.

`VPROC-0025` conserva sus seis definiciones normales:

- `VPROC-0025.EVT-001` — operación de stock solicitada; no consume, reserva ni traslada;
- `VPROC-0025.EVT-002` — validación en curso;
- `VPROC-0025.EVT-003` — reservado; la cantidad está apartada y todavía no consumida;
- `VPROC-0025.EVT-004` — confirmación de destino o consumidor pendiente;
- `VPROC-0025.EVT-005` — posting pendiente;
- `VPROC-0025.EVT-006` — operación de existencias reconciliada.

`VPROC-0034` conserva sus seis definiciones normales:

- `VPROC-0034.EVT-001` — orden productiva lista;
- `VPROC-0034.EVT-002` — materiales en reserva;
- `VPROC-0034.EVT-003` — producción en curso, con captura de consumos, tiempos y desviaciones;
- `VPROC-0034.EVT-004` — resultado productivo reportado;
- `VPROC-0034.EVT-005` — conciliación de consumos pendiente;
- `VPROC-0034.EVT-006` — ejecución productiva completada.

El movimiento NEXO y sus referencias constituyen evidencia del efecto físico dentro del proceso existente. No se introduce un estado adicional de consumido, una definición `EVT-*` adicional ni otro catálogo paralelo.

---

#### 37. Sobre transversal del handoff

Toda proyección o evento relacionado conserva, cuando aplique, los campos pertinentes de `EVENT-ENVELOPE-001`, entre ellos:

- `event_id` cuando exista evento;
- definición, tipo y versión de evento;
- `process_id`;
- `process_instance_id`;
- aplicación productora;
- agregado e identidad de recurso;
- versión del agregado;
- `occurred_at` y `recorded_at`;
- principal y actor efectivo;
- sede, área, turno y dispositivo;
- estado anterior y actual;
- `correlation_id`;
- `causation_id`;
- `request_id`;
- `idempotency_key`;
- `source_command_id`;
- referencia de resultado;
- referencias de salida, evidencia y auditoría;
- versión de esquema y contexto de trazas.

Los datos sensibles se minimizan según finalidad y autorización.

---

#### 38. Auditoría mínima

El expediente deberá permitir reconstruir, como mínimo:

- orden productiva y versión;
- receta y versión;
- instancia y estado de `VPROC-0034`;
- línea o requerimiento material;
- cantidad esperada y real;
- reserva NEXO y su versión;
- instancia y estado de `VPROC-0025`;
- producto;
- unidad de captura y unidad de stock;
- regla o factor de conversión;
- fuente física;
- ubicación, lote, LPN o posición aplicables;
- cantidad emitida;
- cantidad clasificada como consumida, devuelta, desperdiciada o diferencia;
- movimiento o movimientos NEXO;
- aceptación o rechazo del consumidor productivo;
- actor, principal, sede, área, turno y tiempos;
- sustituciones y excepciones;
- cancelaciones, retornos y ajustes;
- identidad idempotente y resultado recuperado;
- correlación y causalidad entre FOGO y NEXO;
- estado final de conciliación.

La auditoría de NEXO mantiene como foco reserva, retiro, consumo, traslado, conversión, disponibilidad, origen/destino, autorización y movimiento resultante. La auditoría FOGO mantiene orden, receta/versión, materiales, consumos, pasos, sustituciones, cantidades, tiempos, desvíos y resultado.

---

#### 39. Reconciliación entre FOGO y NEXO

Antes de considerar completa la conciliación productiva, deberá poder demostrarse por material:

1. qué cantidad fue requerida;
2. qué cantidad fue reservada;
3. qué cantidad fue emitida físicamente por NEXO;
4. qué cantidad FOGO clasificó como consumida;
5. qué cantidad regresó a inventario;
6. qué cantidad quedó como desperdicio productivo;
7. qué diferencia permanece abierta;
8. qué movimientos NEXO explican los efectos físicos;
9. qué unidad y conversión permiten comparar las cantidades;
10. qué sustituciones o revisiones alteraron el alcance;
11. que no existen efectos sin origen ni origen con efecto perdido;
12. que no existe el mismo movimiento aplicado más de una vez;
13. que no existe una reserva todavía bloqueando disponibilidad sin obligación productiva vigente;
14. que cada devolución o ajuste se vincula al movimiento original;
15. que cualquier diferencia material tiene propietario y tratamiento canónico.

Si una de estas condiciones no puede demostrarse, el caso permanece en conciliación y no se simula cierre mediante una bandera local.

---

#### 40. Relación con costos

El consumo reconciliado puede alimentar posteriormente el costo productivo, pero:

- NEXO conserva el hecho físico y la cantidad;
- FOGO conserva orden, receta, lote, rendimiento y clasificación productiva;
- NUMERA o el dominio económico aplicable consume los resultados según sus contratos;
- esta tarea no calcula ni publica el costo final;
- una corrección de inventario o consumo deberá propagarse mediante hechos vinculados y no mediante edición silenciosa del valor económico histórico.

---

#### 41. Regla de no cierre prematuro

Queda prohibido concluir que el consumo está reconciliado únicamente porque:

- FOGO guardó la cantidad real;
- una llamada técnica respondió sin error;
- existe una reserva;
- NEXO inició ejecución;
- el stock visual disminuyó;
- existe una fila de movimiento sin relación verificable;
- el producto de salida ya fue reportado;
- el lote productivo aparece en estado operativo posterior.

El cierre NEXO requiere `VPROC-0025.STOCK_OPERATION_RECONCILED`. La conciliación FOGO requiere además coherencia entre las cantidades productivas y los efectos NEXO vinculados.

---

#### 42. Estado actual de implementación observado

La implementación vigente demuestra piezas parciales del comportamiento, pero no el contrato integral aprobado en esta tarea.

En FOGO, la superficie de creación de lote captura `actual_qty` por ingrediente y llama la operación `fogo_create_real_production_batch`. La definición física vigente de esa operación encadena una implementación anterior que selecciona existencias, modifica proyecciones de inventario, inserta movimientos `production_consume` y registra consumos del lote durante la creación productiva.

Esto demuestra capacidad técnica de captura y descuento, pero no demuestra la frontera canónica completa porque el efecto de inventario se ejecuta dentro de la operación productiva FOGO en vez de atravesar una instancia NEXO de `VPROC-0025` con reserva, ejecución, aceptación, posting y conciliación independientes.

En NEXO existe una superficie genérica de retiro que utiliza semántica de `consumption`, conversión de unidades, comprobación de existencia y actualización de movimientos/proyecciones. Su flujo observado es manual y no demuestra por sí mismo vínculo determinista con orden, receta, lote, reserva y línea material de FOGO ni el contrato distribuido completo de idempotencia y conciliación.

Estas observaciones son evidencia de implementación parcial y no cambian la propiedad canónica definida por los procesos.

---

#### 43. Propiedad de las brechas de implementación

Las brechas observadas quedan vinculadas a tareas ya existentes del plan y del registro de requisitos.

La implementación FOGO del ciclo productivo y sus superficies permanece cubierta por tareas existentes, entre ellas:

- `FOGO-UX-005`;
- `FOGO-UX-006`;
- `FOGO-UX-007`;
- `FOGO-UX-010`;
- `FOGO-UX-011`;
- `FOGO-UX-012`;
- `FOGO-UX-013`;
- `FOGO-AUTH-009`;
- `FOGO-AUTH-010`;
- `FOGO-AUTH-011`;
- `FOGO-AUTH-012`;
- `FOGO-AUTH-014`;
- `FOGO-AUTH-016`.

La implementación NEXO de ledger, reserva, consumo, movimientos, autorización y superficies permanece cubierta por:

- `NEXO-UX-014` a `NEXO-UX-022`;
- `NEXO-UX-026` a `NEXO-UX-029`;
- `NEXO-DOM-002` a `NEXO-DOM-007`;
- `NEXO-DOM-019` a `NEXO-DOM-024`;
- `NEXO-AUTH-011` a `NEXO-AUTH-013`;
- `NEXO-AUTH-021` a `NEXO-AUTH-030`.

La frontera transversal, persistencia, idempotencia y eliminación de escritura cruzada permanece cubierta por:

- `INT-APP-004` a `INT-APP-010`;
- `INT-DB-005` a `INT-DB-008`;
- las tareas E3, E4 y BLOQUE R asociadas a ledger, eventos, colas, conciliación y persistencia;
- los paquetes E5 y certificaciones integrales ya vinculados a los requisitos vigentes.

No se crea un pendiente narrativo adicional ni se adelanta implementación física desde esta tarea documental.

---

#### 44. Criterios de aceptación

La tarea queda documentalmente completa cuando se cumple todo lo siguiente:

1. FOGO conserva la verdad productiva y NEXO la verdad física de inventario;
2. reserva, uso productivo, movimiento, posting y conciliación permanecen como conceptos distintos;
3. una cantidad real capturada en FOGO no modifica stock por autoridad propia;
4. el consumo físico atraviesa `VPROC-0025`;
5. `VPROC-0025.RESERVED` nunca se interpreta como consumo;
6. `VPROC-0025.IN_EXECUTION` representa retiro, consumo o traslado con cantidad real;
7. la confirmación del consumidor no sustituye el posting;
8. `STOCK_OPERATION_RECONCILED` es el cierre autoritativo NEXO de la operación;
9. FOGO conserva orden, receta, material, cantidad real y desviación;
10. NEXO revalida fuente, lote, condición, unidad, conversión, cantidad y autoridad;
11. el movimiento autoritativo conserva referencias suficientes hacia la ejecución productiva;
12. consumo total y parcial tienen semántica distinta;
13. una cantidad reservada no utilizada se mantiene o libera explícitamente;
14. una cantidad superior a la reserva requiere validación NEXO para el delta;
15. varias fuentes físicas pueden componerse sin doble efecto;
16. una sustitución productiva requiere autoridad FOGO;
17. una sustitución física permanece bajo NEXO;
18. desperdicio productivo no duplica el descuento de stock;
19. una devolución crea un retorno vinculado y no edita el movimiento original;
20. una diferencia posterior usa ajuste vinculado cuando corresponda;
21. cancelación solo detiene trabajo futuro;
22. anulación no se usa sobre efectos físicos válidos;
23. misma identidad y misma huella recuperan el resultado previo;
24. reutilización incompatible de identidad produce conflicto;
25. respuesta perdida obliga a consultar antes de repetir el efecto;
26. concurrencia no permite consumir dos veces la misma disponibilidad;
27. eventos fuera de orden no fabrican dependencias;
28. un fallo parcial conserva los efectos ya aplicados y reintenta solo lo pendiente;
29. no se crea un evento empresarial adicional para consumo;
30. los seis eventos existentes de `VPROC-0025` y `VPROC-0034` se preservan;
31. la auditoría reconstruye origen, cantidad, unidad, fuente, movimiento, aceptación y resultado;
32. la conciliación detecta efectos sin origen, origen sin efecto, diferencia y duplicado;
33. FOGO no avanza desde conciliación de consumos como si una operación NEXO pendiente estuviera cerrada;
34. consumo reconciliado no equivale a lote finalizado;
35. consumo reconciliado no equivale a producto terminado ingresado;
36. la implementación actual se distingue expresamente del contrato futuro;
37. las brechas observadas quedan asignadas a tareas canónicas existentes;
38. no se autoriza modificación física desde esta tarea;
39. el Registro 04A permanece sin cambios porque la cobertura verificable ya existe;
40. `INT-PROD-003` permanece como siguiente tarea reservada.

---

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA.

**Justificación:** la obligación verificable de registrar el consumo productivo exactamente una vez, conservar la versión de receta y las cantidades reales, separar cantidad reservada de cantidad física y disponible, impedir sobreasignación y doble movimiento, aplicar idempotencia y compensación, mantener propiedad única del dato y conciliar la cadena producción–inventario ya está cubierta por requisitos vigentes. Esta tarea especializa esos comportamientos para el handoff FOGO–NEXO sin introducir una obligación materialmente nueva.

---

#### Cobertura de prueba existente preservada

La tarea consume y especializa, sin modificar texto, estado, relaciones ni secuencia, al menos:

- `TREQ-FOGO-001` — ciclo productivo con consumo, desperdicio, resultado, cancelación o corrección y efectos de inventario auditables;
- `TREQ-FOGO-002` — versión exacta de receta, ingredientes, unidades, escalamiento, rendimiento real, merma, sustituciones y desviaciones sin sobrescritura;
- `TREQ-FOGO-004` — ejecución productiva con orden, lote, receta/versión, materiales, cantidades, merma y cierre conciliado;
- `TREQ-NEXO-010` — unidad, conversión, disponibilidad y política de operación equivalentes entre consumidores;
- `TREQ-NEXO-011` — fuente canónica de movimientos y proyecciones, cantidades físicas/reservadas diferenciadas, consumo atómico o idempotente, compensación, concurrencia y prevención de doble movimiento;
- `TREQ-INTEGRATION-003` — identidad idempotente, huella lógica, resultado durable, reintento, resultado desconocido y conciliación;
- `TREQ-INTEGRATION-006` — captura única en la propietaria, propagación por contrato y prohibición de fuentes competidoras;
- `TREQ-INTEGRATION-011` — consumo FOGO hacia NEXO exactamente una vez, con fuente, evento, documento, línea, versión, cantidad, unidad, lote, ubicación, actor y estado de aplicación;
- `TREQ-INTEGRATION-013` — cadena materiales–ejecución–calidad–inventario–costo correlacionada e idempotente, con NEXO como fuente de stock, reservas, lotes y movimientos y FOGO como propietaria de plan, orden y lote.

No se crea, modifica, difiere, descarta ni vuelve obsoleto ningún requisito de prueba.

---

#### 45. Continuidad

**ÚLTIMA TAREA APROBADA**  
`INT-PROD-001 — Definir contrato para que FOGO solicite o reserve insumos`

**TAREA ACTUAL APROBADA**  
`INT-PROD-002 — Definir contrato para que NEXO registre el consumo`

**SIGUIENTE TAREA RESERVADA**  
`INT-PROD-003 — Definir contrato para que FOGO finalice el lote`


### ✅ INT-PROD-003 — Definir contrato para que FOGO finalice el lote

**Estado:** APROBADA  
**Tarea anterior:** `INT-PROD-002 — Definir contrato para que NEXO registre el consumo`  
**Tarea siguiente:** `INT-PROD-004 — Definir contrato para que NEXO registre el producto terminado`  
**Tipo de tarea:** documental; definición contractual de finalización de ejecución y cierre productivo del lote en FOGO, con conciliación de materiales, salida, rendimiento, merma, reproceso, calidad, empaque y efectos de inventario, sin implementación física, migraciones, cambios de datos, despliegue ni modificación de Supabase  
**Línea base documental:** `vento-shell@0712d7332b528b210ce0f53e3e3d2918e8df840d`  
**Rectificación de coherencia:** `2026-08-12` — se precisa la causalidad `DISPOSITION_DECIDED → ejecución de la disposición → EXECUTION_VERIFICATION_PENDING → QUALITY_DISPOSITION_VERIFIED`, sin cambiar decisiones empresariales, alcance físico ni cobertura TREQ
**Aplicaciones involucradas:** `FOGO`, `NEXO`, `NUMERA`, `VISO` y `SHELL`; otras aplicaciones únicamente cuando una dependencia canónica ya aprobada consuma un hecho del lote  
**Cambios físicos autorizados:** ninguno

---

#### 1. Propósito

Definir de forma inequívoca cuándo FOGO puede afirmar que la ejecución de un lote terminó y cuándo puede afirmar, además, que el cierre productivo del lote quedó conciliado, sin confundir ninguna de esas afirmaciones con liberación de calidad, empaque concluido, ingreso físico de producto terminado o disponibilidad comercial.

La regla raíz es:

```text
EJECUCIÓN PRODUCTIVA REGISTRADA
+
CONSUMOS Y DEVOLUCIONES RECONCILIADOS
+
SALIDA, RENDIMIENTO, MERMA Y DESVIACIONES REGISTRADOS
        ↓
FOGO PUEDE COMPLETAR LA EJECUCIÓN PRODUCTIVA
        ↓
CALIDAD, EMPAQUE Y EFECTOS FÍSICOS SIGUEN SIENDO HECHOS INDEPENDIENTES
        ↓
FOGO ABRE Y EJECUTA EL CIERRE PRODUCTIVO
        ↓
SI HAY EFECTOS FÍSICOS PENDIENTES, ESPERA A NEXO
        ↓
CONCILIACIÓN DE PRODUCCIÓN + CALIDAD + INVENTARIO + PENDIENTES
        ↓
FOGO PUEDE APROBAR EL CIERRE PRODUCTIVO
```

Se eliminan las siguientes ambigüedades:

1. `VPROC-0034.OUTPUT_REPORTED` no significa lote finalizado;
2. `VPROC-0034.CONSUMPTION_RECONCILIATION_PENDING` no significa lote finalizado;
3. `VPROC-0034.PRODUCTION_EXECUTION_COMPLETED` significa que la ejecución terminó operativamente y fue entregada a calidad, no que el producto quedó liberado o ingresado a inventario;
4. `VPROC-0035.QUALITY_DISPOSITION_VERIFIED` es una decisión independiente y no sustituye el cierre productivo;
5. `VPROC-0036.PACKAGING_CYCLE_RECONCILED` es un cierre de empaque independiente y no sustituye el cierre productivo;
6. `VPROC-0037.PRODUCTION_CLOSEOUT_APPROVED` es el cierre productivo definitivo de FOGO y exige conciliación de consumos, salida, merma, reproceso, rendimiento, movimientos y pendientes;
7. un movimiento NEXO no puede finalizar por sí solo el proceso propietario de FOGO;
8. una bandera local, un estado legacy o una fila creada no puede simular el cierre de los procesos canónicos.

---

#### 2. Alcance funcional

Esta tarea gobierna exclusivamente la semántica y el contrato documental mediante los cuales FOGO termina la ejecución productiva de un lote y posteriormente aprueba su cierre productivo conciliado.

Incluye:

- condiciones de entrada para declarar terminada una ejecución;
- diferenciación entre finalización operativa y cierre productivo;
- registro autoritativo de salida real, rendimiento, merma, subproductos, coproductos y desviaciones;
- uso de la conciliación de consumos aprobada en `INT-PROD-002`;
- tratamiento de producción parcial e interrupciones;
- relación con inspección y disposición de calidad;
- relación con empaque y etiquetado cuando correspondan;
- apertura y avance de `VPROC-0037`;
- tratamiento de variaciones, reproceso y genealogía;
- espera explícita de efectos de inventario NEXO cuando sean requeridos;
- revisión previa al cierre definitivo;
- idempotencia, concurrencia, respuesta perdida y eventos fuera de orden;
- corrección, reapertura, cancelación, anulación, retorno y ajuste sin sobrescritura destructiva;
- auditoría, evidencia, conciliación y handoff hacia `INT-PROD-004`.

No incluye:

- definición del movimiento de ingreso de producto terminado en NEXO, que corresponde a `INT-PROD-004`;
- ejecución de inspecciones o decisiones de calidad fuera de `VPROC-0035`;
- ejecución de empaque fuera de `VPROC-0036`;
- modificación de recetas o de sus versiones;
- modificación de reservas o consumos ya reconciliados fuera de sus procesos propietarios;
- creación de stock disponible, vendible o despachable desde FOGO;
- contabilización económica definitiva en NUMERA;
- implementación de tablas, funciones, RPC, triggers, políticas RLS, colas, jobs, adaptadores o cambios de código.

---

#### 3. Dependencias canónicas preservadas

El contrato consume sin reinterpretación:

- `VPROC-0034` como proceso propietario de preparación de materiales y ejecución productiva;
- `VPROC-0035` como proceso independiente de inspección y disposición de calidad;
- `VPROC-0036` como proceso independiente de empaque, etiquetado y almacenamiento;
- `VPROC-0037` como proceso propietario del cierre productivo, rendimiento, merma, aprovechamiento y reproceso;
- `VPROC-0025` como proceso NEXO de retiro, consumo o traslado de existencias;
- `INT-PROD-001` como contrato de solicitud y reserva de materiales;
- `INT-PROD-002` como contrato de consumo físico y conciliación de materiales;
- los eventos empresariales ya definidos para `VPROC-0034` a `VPROC-0037`;
- los contratos transversales aprobados de propiedad, consumidoras, idempotencia, reintentos, compensación, auditoría, operación pendiente y prohibición de escrituras cruzadas.

Ninguna decisión previa se modifica y no se crea un proceso paralelo de cierre.

---

#### 4. Propiedad empresarial

| Elemento                                             | Propietaria                  | Regla obligatoria                                                                     |
| ---------------------------------------------------- | ---------------------------- | ------------------------------------------------------------------------------------- |
| orden productiva y versión aplicada                  | `FOGO`                       | identifica qué ejecución se está cerrando                                             |
| lote productivo y genealogía productiva              | `FOGO`                       | FOGO conserva identidad, versión, relación con receta y continuidad del lote          |
| receta y versión usada                               | `FOGO`                       | el cierre conserva la versión exacta; no recalcula historia con una versión posterior |
| salida real productiva                               | `FOGO`                       | FOGO declara qué produjo realmente la ejecución                                       |
| rendimiento, merma y desviaciones productivas        | `FOGO`                       | no se deducen desde una proyección de inventario                                      |
| disposición de calidad                               | `FOGO` mediante `VPROC-0035` | es independiente de la finalización operativa y debe conservar su propia autoridad    |
| empaque y etiquetado                                 | `FOGO` mediante `VPROC-0036` | son independientes del cierre de ejecución y se concilian por su proceso propietario  |
| consumo físico, retornos y movimientos de materiales | `NEXO`                       | FOGO consume referencias autoritativas; no reescribe el ledger físico                 |
| ingreso y clasificación física de producto terminado | `NEXO`                       | se define en `INT-PROD-004`; FOGO no crea el movimiento físico                        |
| cierre productivo                                    | `FOGO` mediante `VPROC-0037` | solo FOGO puede afirmar que la producción quedó productivamente conciliada            |
| efecto económico derivado                            | `NUMERA`                     | consume hechos aprobados sin apropiarse del lote ni del movimiento físico             |
| contratos compartidos                                | `SHELL`                      | no fabrica hechos de producción, calidad ni inventario                                |

Regla de segregación:

```text
FOGO CIERRA LA VERDAD PRODUCTIVA
NEXO CONFIRMA LA VERDAD FÍSICA DEL INVENTARIO
CALIDAD CONSERVA SU DECISIÓN INDEPENDIENTE
NUMERA CONSUME RESULTADOS ECONÓMICOS
NINGÚN CONSUMIDOR FABRICA EL HECHO DEL PROPIETARIO
```

---

#### 5. Dos hitos distintos de finalización

El término “finalizar el lote” se materializa mediante dos hitos canónicos que no son equivalentes.

| Hito                   | Estado canónico                             | Qué demuestra                                                                                                                                     | Qué no demuestra                                                                                                 |
| ---------------------- | ------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| finalización operativa | `VPROC-0034.PRODUCTION_EXECUTION_COMPLETED` | materiales, pasos, cantidades, desviaciones, rendimiento y resultado de la ejecución quedaron registrados y el expediente fue entregado a calidad | liberación de calidad, empaque conciliado, ingreso NEXO, disponibilidad comercial o cierre productivo definitivo |
| cierre productivo      | `VPROC-0037.PRODUCTION_CLOSEOUT_APPROVED`   | consumos, salida, merma, reproceso, rendimiento, movimientos y pendientes quedaron conciliados y el cierre fue aprobado                           | modificación retroactiva de calidad, recreación de movimientos o autorización para reescribir hechos previos     |

Se prohíbe utilizar una única propiedad como `completed`, `posted`, `closed`, `ready`, `finished` o equivalente para representar simultáneamente ambos hitos y sus procesos intermedios.

---

#### 6. Condición de entrada para completar la ejecución

FOGO solo podrá avanzar normalmente hacia `VPROC-0034.PRODUCTION_EXECUTION_COMPLETED` cuando pueda reconstruirse, como mínimo:

- `production_order_ref`;
- referencia estable al lote productivo;
- `recipe_version_ref` exacta;
- sede y área productiva;
- actor responsable y contexto de ejecución;
- materiales preparados y sus asignaciones aplicables;
- cantidades realmente consumidas y sus resultados NEXO;
- devoluciones y liberaciones de reserva aplicables;
- salida real registrada;
- cantidades, unidades y conversiones utilizadas;
- rendimiento real;
- merma, desperdicio, coproductos o subproductos declarados cuando existan;
- pasos y controles de producción aplicables;
- desviaciones, sustituciones y excepciones registradas;
- evidencia necesaria para entregar el expediente a calidad.

La presencia de una fila de lote o de una cantidad producida no satisface esta condición por sí sola.

---

#### 7. Precondición de conciliación de materiales

La finalización operativa consume el resultado de `INT-PROD-002`.

Antes del terminal normal de `VPROC-0034`, FOGO deberá conocer el estado material de cada línea relevante, distinguiendo al menos:

- cantidad requerida;
- cantidad reservada;
- cantidad emitida o ejecutada físicamente;
- cantidad consumida;
- cantidad devuelta;
- cantidad liberada sin consumo;
- cantidad desperdiciada cuando corresponda;
- cantidad todavía pendiente;
- referencias de movimientos y resultados NEXO;
- excepciones o ajustes que sigan abiertos.

Una operación NEXO con resultado desconocido, un consumo pendiente de conciliación o una diferencia material sin tratamiento impide afirmar que la ejecución quedó conciliada normalmente.

---

#### 8. Registro de salida real

`VPROC-0034.OUTPUT_REPORTED` deberá conservar la salida real observada y no una proyección calculada únicamente desde la receta.

Por cada salida material deberá poder resolverse:

- producto canónico;
- rol de salida cuando existan salida principal, coproducto o subproducto;
- cantidad real;
- unidad real y unidad canónica compatible;
- referencia al lote productivo;
- receta y versión;
- sede y área;
- momento de captura;
- actor o dispositivo responsable cuando aplique;
- método o evidencia de medición cuando sea exigible;
- desviación frente al valor esperado;
- destino productivo previsto, sin convertirlo en un hecho NEXO ya confirmado.

La salida real no se modifica para forzar coincidencia con la receta, la existencia posterior o el costo esperado.

---

#### 9. Rendimiento esperado y rendimiento real

El cierre conserva por separado:

```text
RENDIMIENTO ESPERADO SEGÚN RECETA Y VERSIÓN
≠
SALIDA REAL OBSERVADA
≠
SALIDA CUYA DISPOSICIÓN AUTORIZA LA LIBERACIÓN
≠
SALIDA INGRESADA FÍSICAMENTE EN NEXO
```

El rendimiento deberá compararse utilizando identidades, unidades, conversiones, redondeos y tolerancias compatibles con la receta y la versión ejecutadas.

Una diferencia fuera de tolerancia no se corrige alterando la cantidad esperada ni la cantidad real: genera una variación que debe conservar causa, evidencia, responsable y tratamiento.

---

#### 10. Merma, desperdicio, coproducto, subproducto y aprovechamiento

FOGO deberá conservar categorías productivas distintas cuando apliquen:

- salida principal;
- coproducto;
- subproducto;
- merma o desperdicio;
- material recuperable;
- material enviado a reproceso;
- resultado no conforme;
- diferencia todavía no explicada.

No se sumarán cantidades de familias o unidades incompatibles para fabricar una conciliación aparente.

Toda equivalencia cuantitativa usada para conciliación deberá ser reproducible mediante unidades y reglas canónicas. Si una diferencia no puede explicarse mediante esas reglas, permanece como variación bajo revisión.

---

#### 11. Producción parcial

Una ejecución podrá terminar con una salida inferior a la planificada cuando el proceso y la autoridad aplicable lo permitan, pero esa condición deberá conservarse explícitamente.

La producción parcial:

1. no modifica silenciosamente la cantidad planificada;
2. no transforma la cantidad faltante en producto terminado;
3. conserva rendimiento y diferencia reales;
4. exige conciliación de materiales consumidos, devueltos y desperdiciados;
5. conserva el motivo y la autoridad cuando el cierre sea aceptado con diferencia;
6. no autoriza a NEXO a registrar la cantidad faltante;
7. no permite cerrar una remisión o necesidad externa como satisfecha por inferencia.

La relación con faltantes de remisiones permanece bajo el contrato ya aprobado de `INT-PROD-005`.

---

#### 12. Interrupción de la ejecución

`VPROC-0037.PRODUCTION_CLOSEOUT_OPENED` puede abrirse para una ejecución terminada o interrumpida.

Si la producción fue interrumpida antes del terminal normal de `VPROC-0034`:

- no se emite `VPROC-0034.PRODUCTION_EXECUTION_COMPLETED` como si la ejecución hubiese finalizado normalmente;
- se conserva el último estado real alcanzado;
- se registran materiales, salida parcial, merma, evidencia y efectos ya ocurridos;
- se cancelan únicamente trabajos futuros mediante la acción propietaria aplicable;
- los movimientos físicos confirmados permanecen inmutables;
- el cierre productivo debe explicar el resultado residual, las variaciones y los pendientes.

Interrumpido no equivale a vacío, fallido sin historia ni cancelado sin efectos.

---

#### 13. Relación con calidad

La finalización operativa entrega el expediente a `VPROC-0035`; no decide la disposición.

`VPROC-0034.PRODUCTION_EXECUTION_COMPLETED` no autoriza:

- liberar producto;
- publicarlo como disponible;
- venderlo;
- consumirlo como producto terminado;
- despacharlo;
- declararlo conforme.

Una `VPROC-0035.DISPOSITION_DECIDED` vigente cuya decisión autorice expresamente la liberación de la cantidad afectada habilita a los procesos responsables para materializar esa disposición. Esta autorización no demuestra todavía que la disposición haya sido aplicada ni verificada.

`VPROC-0035.QUALITY_DISPOSITION_VERIFIED` no constituye una precondición para el ingreso físico en NEXO cuando la propia verificación requiere comprobar la aplicación de la decisión sobre inventario, etiquetas o destinos. El resultado autoritativo y reconciliado de NEXO puede formar parte de la evidencia utilizada durante `VPROC-0035.EXECUTION_VERIFICATION_PENDING` para alcanzar posteriormente `QUALITY_DISPOSITION_VERIFIED`.

Las cantidades retenidas, rechazadas o destinadas a reproceso conservan esa decisión y no quedan habilitadas para el ingreso normal de producto terminado.

El cierre productivo deberá referenciar la disposición de calidad aplicable cuando exista y no podrá reinterpretarla.

---

#### 14. Relación con empaque y etiquetado

`VPROC-0036` conserva una responsabilidad independiente.

Cuando el producto, presentación o proceso exijan empaque antes del almacenamiento o disponibilidad posterior, el cierre deberá poder correlacionar:

- lote productivo;
- salida aprobada aplicable;
- presentación;
- cantidad empacada;
- materiales de empaque;
- etiquetas e identidades generadas;
- diferencias de empaque;
- resultado de conciliación del ciclo de empaque.

`VPROC-0036.PACKAGED_OUTPUT_RECORDED` demuestra una salida empacada identificada, pero no demuestra por sí sola que haya sido transferida físicamente a almacenamiento.

---

#### 15. Apertura del cierre productivo

Después de una ejecución terminada o interrumpida con hechos suficientes para reconciliar, FOGO abre `VPROC-0037.PRODUCTION_CLOSEOUT_OPENED`.

La apertura debe conservar:

- referencia al lote;
- tipo de cierre o reproceso;
- salida real;
- consumos reales;
- merma, desperdicio, coproductos o subproductos aplicables;
- actor responsable;
- genealogía cuando aplique;
- disposición de calidad cuando ya exista;
- referencias de evidencia;
- contexto económico disponible sin convertirlo en contabilidad definitiva;
- versión del cierre.

Abrir el cierre no confirma rendimiento final, merma final, reproceso final, movimientos de inventario ni cierre definitivo.

---

#### 16. Recopilación de datos

En `VPROC-0037.DATA_COLLECTING`, FOGO consolida referencias sin duplicar las fuentes propietarias.

La recopilación deberá permitir reconstruir:

- orden y lote;
- receta y versión;
- consumos NEXO;
- devoluciones, liberaciones y ajustes asociados;
- salida real por producto y rol;
- rendimiento esperado y real;
- desperdicio y aprovechamiento;
- sustituciones y desviaciones;
- resultados y disposición de calidad;
- empaque cuando aplique;
- reprocesos y genealogía;
- movimientos de inventario ya confirmados;
- efectos todavía pendientes;
- evidencia y actores.

FOGO almacena o referencia la evidencia necesaria para su expediente; no crea copias editables que compitan con los hechos propietarios de NEXO u otros dominios.

---

#### 17. Conciliación de rendimiento

`VPROC-0037.YIELD_RECONCILIATION_IN_PROGRESS` compara el estándar de la receta y su versión con el resultado real.

La conciliación deberá distinguir, sin ocultar diferencias:

- producción esperada;
- producción real;
- producción conforme y no conforme cuando la calidad ya la haya clasificado;
- merma o desperdicio;
- coproductos y subproductos;
- material recuperado o reaprovechado;
- reproceso abierto;
- diferencia explicada;
- diferencia no explicada.

Una comparación solo es válida cuando las unidades y factores utilizados son compatibles y auditables.

---

#### 18. Variación bajo revisión

Toda diferencia material de consumo, rendimiento, merma o salida que requiera investigación pasa por `VPROC-0037.VARIANCE_UNDER_REVIEW`.

La variación deberá conservar:

- tipo;
- cantidad y unidad cuando sea cuantificable;
- referencia al dato esperado;
- referencia al dato real;
- causa conocida o evidencia de investigación;
- responsable;
- decisión;
- impacto en calidad, inventario, reproceso o costo cuando aplique;
- estado de resolución.

Se prohíbe aprobar el cierre con una causa vacía para una variación que el proceso exige explicar.

---

#### 19. Reproceso y genealogía

Cuando una variación requiera reproceso, `VPROC-0037` utiliza su ruta aprobada hacia `REWORK_PLAN_PENDING` y `REWORK_IN_PROGRESS`.

Reglas:

1. el reproceso conserva vínculo con el lote original;
2. una separación de reproceso crea un caso vinculado y no reescribe el lote original;
3. materiales adicionales se tramitan mediante los contratos propietarios aplicables, incluidos `INT-PROD-001` e `INT-PROD-002` cuando correspondan;
4. consumos nuevos no se agregan retroactivamente al movimiento original;
5. salida recuperada, pérdida adicional y resultado final conservan genealogía;
6. una existencia retenida o rechazada no se convierte en liberada por iniciar reproceso;
7. un reproceso abierto que afecte el resultado impide declarar el cierre definitivo como conciliado.

---

#### 20. Handoff hacia efectos de inventario

Cuando los resultados productivos y las disposiciones aplicables estén suficientemente validados, `VPROC-0037` puede avanzar a `VPROC-0037.INVENTORY_EFFECTS_PENDING`.

Este estado significa exactamente:

```text
FOGO YA TIENE UN RESULTADO PRODUCTIVO VALIDADO
+
LOS EFECTOS FÍSICOS NECESARIOS TODAVÍA DEBEN SER CONFIRMADOS POR NEXO
```

No significa que el inventario ya fue actualizado.

FOGO podrá entregar al contrato posterior la información empresarial necesaria para identificar el lote y la salida, pero no enviará como autoridad:

- saldo físico resultante;
- existencia disponible definitiva;
- movimiento NEXO ya aplicado;
- ubicación física confirmada si todavía depende de NEXO;
- estado de posting de NEXO;
- confirmación ficticia de producto terminado.

La definición completa de la operación física pertenece a `INT-PROD-004`.

---

#### 21. Información mínima disponible para el handoff a NEXO

Sin definir todavía el contrato físico de `INT-PROD-004`, FOGO deberá poder aportar como hechos propietarios o referencias verificables:

- `production_order_ref`;
- `production_lot_ref`;
- instancia y estado de `VPROC-0034`;
- instancia y estado de `VPROC-0037`;
- `recipe_version_ref`;
- producto o productos resultantes;
- rol de cada salida;
- cantidad real por salida;
- unidad canónica compatible;
- sede y área productiva;
- disposición de calidad aplicable;
- referencia de empaque o presentación cuando aplique;
- genealogía relevante;
- actor responsable;
- correlación, causación, solicitud e identidad idempotente transversales;
- referencias de evidencia necesarias.

NEXO deberá producir sus propios hechos físicos y devolver referencias autoritativas de aplicación. Esta tarea no define su estructura interna, movimiento ni política de almacenamiento.

---

#### 22. Condición para abandonar `INVENTORY_EFFECTS_PENDING`

FOGO no considerará resueltos los efectos de inventario porque:

- haya enviado una solicitud;
- una interfaz muestre éxito;
- exista un destino previsto;
- se haya calculado una cantidad;
- el producto tenga disposición favorable de calidad;
- exista un movimiento legacy no reconciliado con el contrato vigente.

La transición requiere el resultado autoritativo que corresponda desde NEXO para cada efecto físico exigible, incluyendo sus referencias de movimiento o conciliación. El contenido exacto de ese resultado se especializa en `INT-PROD-004`.

Un resultado NEXO pendiente, incierto, conflictivo o no correlacionable mantiene el cierre abierto.

---

#### 23. Revisión previa al cierre definitivo

`VPROC-0037.CLOSURE_REVIEW_PENDING` deberá verificar, según aplicabilidad:

- identidad única del lote;
- orden, receta y versión correctas;
- materiales y consumos conciliados;
- devoluciones, liberaciones, mermas y ajustes resueltos;
- salida real registrada;
- rendimiento conciliado;
- variaciones explicadas o tratadas;
- reprocesos cerrados o explícitamente separados con genealogía;
- disposición de calidad coherente;
- empaque y etiquetado conciliados cuando correspondan;
- efectos físicos NEXO confirmados y correlacionados;
- pendientes sin ocultar;
- evidencia suficiente;
- autoridad vigente para aprobar el cierre.

La revisión no modifica los hechos para lograr coherencia: identifica el pendiente y mantiene el cierre abierto hasta su resolución o tratamiento autorizado.

---

#### 24. Cierre productivo aprobado

`VPROC-0037.PRODUCTION_CLOSEOUT_APPROVED` solo puede afirmarse cuando consumos, salida, merma, reproceso, rendimiento, movimientos y pendientes quedaron conciliados y el cierre fue aprobado por la autoridad aplicable.

El resultado demuestra:

- que la ejecución quedó cerrada sin ocultar variaciones;
- que la historia del lote es reconstruible;
- que las diferencias tuvieron tratamiento explícito;
- que los efectos requeridos quedaron correlacionados;
- que una corrección futura deberá producir registros compensatorios o una revisión vinculada.

No demuestra ni autoriza por sí solo:

- reescribir un movimiento NEXO;
- cambiar una disposición de calidad histórica;
- alterar una receta publicada;
- borrar merma;
- convertir un lote rechazado en liberado;
- crear una segunda entrada física;
- duplicar costos.

---

#### 25. Lote liberado, retenido, rechazado o enviado a reproceso

El estado productivo y la disposición de calidad se conservan como ejes distintos.

Un lote puede tener la ejecución terminada y encontrarse:

- pendiente de calidad;
- retenido;
- liberado total o parcialmente;
- rechazado;
- enviado a reproceso.

El cierre debe reflejar el resultado real de cada cantidad sin transformar todas las salidas en “producto terminado disponible”.

Solo la cantidad cubierta por una `VPROC-0035.DISPOSITION_DECIDED` vigente cuya decisión autorice expresamente su liberación puede ser candidata al efecto físico normal definido por `INT-PROD-004`.

Esto no exige que `VPROC-0035.QUALITY_DISPOSITION_VERIFIED` ya exista: la verificación final puede consumir como evidencia el efecto NEXO posteriormente reconciliado para comprobar que la disposición fue aplicada al lote, inventario, etiquetas y destinos correctos.

---

#### 26. Múltiples salidas

Cuando una receta produzca salida principal, coproductos o subproductos, el cierre conservará una línea trazable por salida material.

Cada línea deberá mantener:

- identidad de producto;
- rol;
- cantidad y unidad reales;
- calidad o clasificación aplicable;
- presentación o empaque cuando corresponda;
- destino previsto;
- efecto NEXO requerido o no requerido según la clasificación aprobada;
- referencia de movimiento cuando exista;
- tratamiento de costo cuando sea consumido por NUMERA.

Una salida no puede usar el movimiento, la calidad o el estado de otra para considerarse conciliada.

---

#### 27. Idempotencia de la finalización

La solicitud o comando propietario que intente completar una ejecución o aprobar un cierre deberá usar una identidad estable y una huella del contenido lógico conforme a los contratos transversales vigentes.

Reglas:

1. misma identidad y mismo contenido lógico recuperan el resultado ya conocido;
2. misma identidad con contenido incompatible produce conflicto sin segundo cierre;
3. un refresh, doble click, timeout o reintento no genera otra finalización;
4. ejecución, calidad, empaque, movimiento NEXO y cierre productivo conservan alcances idempotentes distintos;
5. el identificador del lote no se usa como clave universal para todos los efectos;
6. un resultado incierto se consulta o reconcilia antes de repetir un efecto que pudiera haberse confirmado.

---

#### 28. Concurrencia y versión

Dos actores, sesiones o workers no podrán cerrar de forma incompatible la misma revisión del lote.

La operación deberá comprobar la versión o mecanismo equivalente vigente antes de aplicar la transición.

Si otra operación ya avanzó el lote:

- una repetición equivalente recupera el resultado previo;
- una versión obsoleta no sobrescribe la posterior;
- una decisión incompatible produce conflicto;
- la interfaz deberá reflejar el estado verdadero recuperado y no un éxito supuesto.

---

#### 29. Respuesta perdida y resultado desconocido

Una respuesta perdida después de solicitar finalización no autoriza a repetir ciegamente el cierre.

Se deberá:

1. conservar la misma identidad empresarial;
2. consultar estado o resultado recuperable;
3. distinguir operación aplicada, duplicado, conflicto, pendiente o resultado desconocido;
4. reintentar únicamente cuando el perfil aprobado lo permita;
5. conciliar antes de emitir un segundo efecto que pudiera duplicar el primero.

La misma regla aplica a los handoffs entre FOGO y NEXO.

---

#### 30. Eventos fuera de orden

La llegada tardía de un evento no hará retroceder ni adelantar silenciosamente el lote.

Ejemplos obligatorios:

- una confirmación de consumo tardía puede resolver un pendiente, pero no revierte una versión posterior;
- una disposición de calidad tardía no crea una segunda ejecución;
- un efecto NEXO recibido antes de que FOGO pueda correlacionarlo se conserva o difiere según el contrato transversal, no se adjudica a otro lote;
- un evento de cierre repetido no vuelve a ejecutar inventario ni costo;
- una corrección posterior se vincula a la historia existente.

---

#### 31. Eventos empresariales reutilizados

Esta tarea no crea nuevas definiciones de evento.

Se reutilizan, entre otros, los hitos ya canónicos:

- `VPROC-0034.EVT-004` — resultado productivo reportado;
- `VPROC-0034.EVT-005` — conciliación de consumos pendiente;
- `VPROC-0034.EVT-006` — ejecución productiva completada;
- `VPROC-0035.EVT-004` — disposición decidida; cuando autoriza expresamente la liberación de una cantidad, es el hito que habilita la ejecución de esa disposición por los procesos responsables;
- `VPROC-0035.EVT-005` — verificación de ejecución pendiente; comprueba la aplicación de la decisión sobre lote, inventario, etiquetas y destinos utilizando, cuando corresponda, el resultado NEXO reconciliado;
- `VPROC-0035.EVT-006` — disposición de calidad verificada; es el hito posterior que cierra la comprobación y no el evento habilitador obligatorio del ingreso físico NEXO;
- `VPROC-0036.EVT-006` — ciclo de empaque y almacenamiento conciliado;
- `VPROC-0037.EVT-001` — cierre productivo abierto;
- `VPROC-0037.EVT-002` — recopilando datos;
- `VPROC-0037.EVT-003` — variación en revisión;
- `VPROC-0037.EVT-004` — efectos de inventario pendientes;
- `VPROC-0037.EVT-005` — revisión de cierre pendiente;
- `VPROC-0037.EVT-006` — cierre productivo aprobado.

Cada evento conserva su productora FOGO y sus consumidoras aprobadas. El evento informa un hecho durable; no concede a la consumidora autoridad para modificar el lote.

---

#### 32. Auditoría mínima del cierre

El expediente deberá permitir reconstruir, sin inferencias destructivas:

- orden;
- lote;
- receta y versión;
- actores y contexto;
- materiales y consumos;
- pasos productivos;
- cantidades esperadas y reales;
- sustituciones;
- desviaciones;
- salida principal, coproductos y subproductos;
- rendimiento;
- merma y desperdicio;
- reaprovechamiento y reproceso;
- genealogía;
- calidad y disposición;
- empaque cuando aplique;
- movimientos NEXO correlacionados;
- resultado económico consumido posteriormente;
- acciones de cancelación, anulación, retorno, ajuste o reapertura;
- evidencia y motivos.

Los logs técnicos no sustituyen este expediente empresarial.

---

#### 33. Correcciones y reapertura

Un cierre aprobado es histórico e inmutable como hecho original.

Si después se detecta una diferencia:

- `VPROC-0037.EX-004` permite abrir una revisión vinculada;
- el cierre original permanece consultable;
- el nuevo expediente explica causa, evidencia y diferencia;
- los efectos físicos se corrigen mediante acciones o movimientos vinculados del dominio propietario;
- los costos se ajustan mediante el dominio económico correspondiente;
- la revisión no borra merma, consumo, calidad o movimientos previos.

Una reapertura no vuelve a ejecutar automáticamente la producción ni el ingreso físico.

---

#### 34. Cancelación, anulación, retorno y ajuste

Se preservan las acciones canónicas de corrección:

- `CANCEL`: detiene trabajo futuro o remanente que todavía pueda detenerse;
- `VOID`: invalida una instrucción duplicada o inválida únicamente cuando no existe un efecto válido que preservar;
- `RETURN`: registra un efecto físico inverso o retorno vinculado cuando corresponda;
- `ADJUST`: registra una corrección vinculada cuando la conciliación demuestra una diferencia.

Ninguna de estas acciones elimina el movimiento, salida, calidad o cierre original para aparentar que nunca ocurrió.

---

#### 35. Métricas y guardrails preservados

El cierre conserva las métricas canónicas de rendimiento y merma sin redefinirlas.

Como mínimo deberán poder analizarse:

- rendimiento productivo conciliado contra estándar;
- tasa de reproceso;
- tiempo de cierre de variaciones y merma;
- diferencias de consumo;
- pendientes de inventario;
- lotes con variaciones sin explicación.

Guardrails obligatorios:

- ninguna merma inexplicada se oculta;
- el rendimiento no excluye pérdidas para verse artificialmente mejor;
- ningún reaprovechamiento queda sin trazabilidad;
- ningún consumo sin conciliar se presenta como cierre normal;
- ningún lote se presenta como terminado disponible por ausencia de una confirmación propietaria.

---

#### 36. Estado actual de implementación observado

La implementación vigente materializa actualmente una operación más acoplada que el diseño canónico:

- la creación de un lote real recibe cantidades producidas, ingredientes, empaques y salidas en una misma interacción;
- el RPC vigente crea el lote con estado legacy `posted` y `recipe_consumed = true`;
- durante esa misma operación consume existencias de ingredientes y registra movimientos `production_consume`;
- la operación también registra movimiento `production_output` y actualiza existencias para salidas que siguen la ruta física implementada;
- la interfaz presenta estados legacy como `posted`, `draft`, `cancelled` y `completed` y modos de salida asociados a inventario, venta o cumplimiento directo.

Ese comportamiento actual demuestra capacidad operativa parcial, pero no materializa por sí mismo la separación canónica entre:

```text
EJECUCIÓN COMPLETADA
→ CALIDAD
→ EMPAQUE CUANDO APLIQUE
→ EFECTO FÍSICO NEXO
→ CIERRE PRODUCTIVO CONCILIADO
```

La implementación vigente no redefine el contrato documental aprobado por esta tarea.

---

#### 37. Propiedad de la implementación pendiente

Las brechas físicas permanecen asignadas a tareas ya existentes; no se crea un pendiente narrativo nuevo.

La implementación FOGO del ciclo de lote, ejecución, calidad, empaque, reproceso y cierre está cubierta por las tareas ya registradas, entre ellas:

- `FOGO-UX-005` a `FOGO-UX-015`;
- `FOGO-AUTH-009` a `FOGO-AUTH-016`;
- `OPS-REC-001`;
- `OPS-PRD-001`;
- `OPS-TRZ-001`;
- `UX-QA-025`.

Los movimientos y proyecciones NEXO permanecen cubiertos por las tareas de inventario ya registradas, incluidas:

- `NEXO-UX-014` a `NEXO-UX-022`;
- `NEXO-AUTH-011` a `NEXO-AUTH-013`;
- `NEXO-AUTH-021` a `NEXO-AUTH-030`;
- `NEXO-DOM-002` a `NEXO-DOM-007`;
- `NEXO-DOM-019` a `NEXO-DOM-024`.

La infraestructura transversal de idempotencia, eventos, persistencia, conciliación y efectos distribuidos permanece bajo sus tareas E3, E4, BLOQUE R y paquetes E5 ya existentes.

`INT-PROD-004` permanece reservada exclusivamente para especializar el registro físico del producto terminado en NEXO.

---

#### 38. Criterios de aceptación

La tarea queda documentalmente completa cuando se cumple todo lo siguiente:

1. FOGO conserva la propiedad del lote y del cierre productivo;
2. NEXO conserva la propiedad de los movimientos y existencias físicas;
3. se diferencian finalización operativa y cierre productivo definitivo;
4. `OUTPUT_REPORTED` no se interpreta como cierre;
5. `PRODUCTION_EXECUTION_COMPLETED` no se interpreta como liberación de calidad ni ingreso de inventario;
6. la ejecución normal no termina con consumos materiales sin conciliar;
7. la salida real queda separada del rendimiento esperado;
8. las variaciones no se corrigen sobrescribiendo valores reales o esperados;
9. merma, desperdicio, coproductos, subproductos y reaprovechamiento conservan clasificación explícita;
10. la producción parcial conserva el faltante y su causa;
11. una interrupción no fabrica un terminal normal inexistente;
12. calidad permanece bajo `VPROC-0035`;
13. empaque permanece bajo `VPROC-0036`;
14. el cierre productivo usa `VPROC-0037`;
15. un reproceso conserva genealogía y no reescribe el lote original;
16. `INVENTORY_EFFECTS_PENDING` no se confunde con inventario actualizado;
17. FOGO no declara saldo, ubicación o movimiento NEXO como hecho propio;
18. `INT-PROD-004` conserva la definición del efecto físico de producto terminado;
19. el cierre definitivo espera los efectos NEXO exigibles cuando correspondan;
20. la revisión de cierre comprueba producción, calidad, inventario y pendientes;
21. un cierre aprobado conserva historia inmutable;
22. una corrección posterior usa revisión o efecto compensatorio vinculado;
23. misma identidad idempotente y mismo contenido recuperan el resultado previo;
24. misma identidad y contenido incompatible producen conflicto;
25. concurrencia o versión obsoleta no sobrescriben un cierre posterior;
26. respuestas perdidas se consultan o reconcilian antes de repetir efectos;
27. eventos tardíos no retroceden ni duplican el lote;
28. los eventos empresariales vigentes se reutilizan sin crear definiciones paralelas;
29. el expediente permite reconstruir orden, receta, lote, consumos, salida, calidad, movimientos, merma y cierre;
30. la implementación actual queda distinguida del diseño canónico;
31. las brechas físicas quedan vinculadas a tareas existentes;
32. no se altera el Registro 04A porque la cobertura de prueba ya protege estas obligaciones.

---

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA.

**Justificación:** el comportamiento verificable de esta tarea ya está protegido por requisitos vigentes que cubren el ciclo completo del lote, versión exacta de receta, consumos y efectos físicos auditables, independencia entre finalización productiva, calidad e inventario, cierre conciliado de materiales, salida, calidad, movimientos y pendientes, idempotencia, concurrencia, compensación y correlación entre producción e inventario. La tarea especializa esas obligaciones para el handoff y el cierre FOGO sin introducir una obligación materialmente nueva.

---

#### Cobertura de prueba existente preservada

La tarea consume y especializa, sin modificar texto, estado, relaciones ni secuencia, al menos:

- `TREQ-FOGO-001` — ciclo del lote, producción parcial, consumo, desperdicio, resultado, finalización, cancelación o corrección con efectos auditables;
- `TREQ-FOGO-002` — receta publicada inmutable, versión exacta, unidades, rendimiento real, merma, sustituciones y desviaciones;
- `TREQ-FOGO-004` — ejecución productiva, independencia entre finalización, calidad e inventario, reproceso con genealogía y cierre conciliado de materiales, salida, calidad, movimientos y pendientes;
- `TREQ-NEXO-010` — unidad, conversión, tolerancia y política de operación coherentes;
- `TREQ-NEXO-011` — fuente canónica de movimientos y proyecciones con atomicidad o idempotencia y compensación verificables;
- `TREQ-INTEGRATION-003` — identidad idempotente, resultado durable, reintentos, concurrencia, resultado desconocido y conciliación;
- `TREQ-INTEGRATION-006` — propiedad única del dato y prohibición de fuentes competidoras;
- `TREQ-INTEGRATION-011` — todo efecto externo de inventario atraviesa contrato NEXO correlacionado e idempotente y no puede cerrar incorrectamente el proceso;
- `TREQ-INTEGRATION-013` — cadena materiales, ejecución, calidad, inventario y costo correlacionada, idempotente y reconciliable.

No se crea, modifica, difiere, descarta ni vuelve obsoleto ningún requisito de prueba.

---

#### 39. Continuidad

**ÚLTIMA TAREA APROBADA**  
`INT-PROD-002 — Definir contrato para que NEXO registre el consumo`

**TAREA ACTUAL APROBADA**  
`INT-PROD-003 — Definir contrato para que FOGO finalice el lote`

**SIGUIENTE TAREA RESERVADA**  
`INT-PROD-004 — Definir contrato para que NEXO registre el producto terminado`


### ✅ INT-PROD-004 — Definir contrato para que NEXO registre el producto terminado

**Estado:** APROBADA
**Tarea anterior:** `INT-PROD-003 — Definir contrato para que FOGO finalice el lote`
**Tarea siguiente:** `INT-POS-001 — Auditar documentación, endpoints, webhooks y límites del POS vigente`
**Tipo de tarea:** documental; definición contractual del ingreso físico, ubicación, posting y conciliación en NEXO del producto terminado originado por FOGO, mediante especialización de `VPROC-0024`, con calidad, empaque, lote, presentación, unidades, idempotencia, excepciones y cierre correlacionado; sin implementación física, migraciones, cambios de datos, despliegue ni modificación de Supabase
**Línea base documental:** `vento-shell@78cac54b9ba6b3395cfedb7c4b5d342483c4f5db`
**Aplicaciones involucradas:** `FOGO`, `NEXO` y `SHELL`; `NUMERA` y `PULSO` únicamente como consumidoras posteriores de hechos o proyecciones cuando corresponda
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/X_INTEGRACIONES/05_PRODUCCION_E_INVENTARIO.md`
**Cambios físicos autorizados:** ninguno

---

#### 1. Propósito

Definir el contrato canónico por el cual un resultado productivo válido de FOGO se convierte, cuando corresponde, en una existencia física registrada por NEXO sin mezclar producción, liberación de calidad, empaque, ubicación, disponibilidad comercial, costo ni cierre productivo.

La frontera obligatoria es:

```text
FOGO
resultado productivo identificado
+ disposición de calidad aplicable
+ empaque/presentación cuando corresponda
+ cantidad y unidad reales
+ lote y genealogía
        ↓
SOLICITUD CORRELACIONADA DE EFECTO FÍSICO
        ↓
NEXO / VPROC-0024
INBOUND_MOVEMENT_REQUESTED
        ↓
validación
        ↓
ejecución física
        ↓
confirmación
        ↓
putaway
        ↓
posting
        ↓
INBOUND_MOVEMENT_RECONCILED
        ↓
FOGO
evidencia autoritativa del efecto
        ↓
VPROC-0037 puede continuar su revisión de cierre
```

El contrato protege simultáneamente estas verdades:

1. FOGO es propietario del hecho productivo, el lote, la receta y versión, la salida real, la genealogía y la disposición productiva;
2. NEXO es propietario de la existencia física, el ingreso, la ubicación, la condición física, el movimiento, el ledger y las proyecciones de stock;
3. terminar producción no crea por sí solo inventario;
4. liberar calidad no crea por sí sola inventario;
5. empacar o etiquetar no crea por sí solo inventario;
6. indicar un destino no demuestra que el producto haya sido recibido o ubicado;
7. un movimiento en `POSTING_PENDING` todavía no demuestra efecto aplicado;
8. solo `VPROC-0024.INBOUND_MOVEMENT_RECONCILED` demuestra que el ingreso quedó contabilizado una sola vez y reconciliado;
9. el ingreso conciliado no convierte por sí solo una existencia en vendible si otra regla de condición, ubicación, canal o disponibilidad la restringe;
10. FOGO no puede escribir directamente el ledger o las proyecciones propietarias de NEXO como contrato objetivo.

---

#### 2. Alcance exacto

Esta tarea define exclusivamente:

- el hecho de origen que habilita a FOGO a solicitar el ingreso del producto terminado;
- la especialización de `VPROC-0024` para producción;
- la información mínima que debe conservar el handoff FOGO → NEXO;
- las reglas de producto, lote, presentación, LPN, cantidad, unidad y destino;
- las condiciones de calidad y empaque que habilitan el ingreso;
- la ejecución de ingreso, confirmación, putaway, posting y conciliación;
- la relación entre una salida productiva y uno o varios movimientos físicos correlacionados;
- el tratamiento de múltiples salidas de un mismo lote;
- la separación entre cantidad producida, cantidad liberada, cantidad entregada a NEXO y cantidad finalmente reconciliada;
- idempotencia, concurrencia, respuesta perdida y eventos fuera de orden;
- suspensión, redirección, cuarentena, cancelación, nulidad, retorno y ajuste;
- la evidencia que NEXO devuelve a FOGO;
- la condición para que FOGO considere satisfecho cada efecto físico pendiente;
- la brecha entre este contrato y la implementación actual;
- el handoff hacia las tareas de implementación ya existentes.

No incluye:

- reserva o consumo de insumos;
- definición de receta;
- planificación productiva;
- ejecución de producción;
- decisión de calidad;
- diseño de pruebas de laboratorio;
- generación de etiqueta o diseño de empaque;
- decisión de reproceso;
- cierre productivo de FOGO, ya definido en `INT-PROD-003`;
- producción insuficiente para remisiones, ya definida en `INT-PROD-005`;
- ventas, pedidos o despacho comercial;
- contabilización financiera definitiva;
- implementación de tablas, RPC, funciones, triggers, RLS, eventos técnicos, workers, colas, adaptadores o migraciones.

---

#### 3. Proceso canónico propietario del ingreso

El registro físico del producto terminado se especializa sobre:

```text
VPROC-0024
Registrar ingreso, ubicación y reubicación mediante movimientos correlacionados
Propietaria: NEXO
```

No se utiliza `VPROC-0025` para crear el producto terminado porque `VPROC-0025` gobierna retiro, consumo o traslado de existencias ya reconocidas.

Para producto terminado, `VPROC-0024` conserva su secuencia canónica:

```text
VPROC-0024.INBOUND_MOVEMENT_REQUESTED
→ VPROC-0024.VALIDATION_IN_PROGRESS
→ VPROC-0024.READY_FOR_PHYSICAL_EXECUTION
→ VPROC-0024.IN_EXECUTION
→ VPROC-0024.PENDING_CONFIRMATION
→ VPROC-0024.PUTAWAY_PENDING
→ VPROC-0024.POSTING_PENDING
→ VPROC-0024.INBOUND_MOVEMENT_RECONCILED
```

La especialización de producción no crea estados paralelos ni sustituye el proceso general de NEXO.

---

#### 4. Regla de elegibilidad del producto terminado

Una salida de FOGO solo puede iniciar el camino normal de ingreso como producto terminado cuando se cumplen simultáneamente las condiciones aplicables:

| Condición               | Regla                                                                                                                                                                                                                                                                                                        |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Identidad productiva    | Existe `production_lot_ref` válido y correlacionable con su orden y ejecución.                                                                                                                                                                                                                               |
| Producto                | El `item_ref` corresponde al producto o coproducto realmente reportado por FOGO.                                                                                                                                                                                                                             |
| Receta                  | Se conserva `recipe_version_ref`; no se resuelve la versión desde el estado actual de la receta.                                                                                                                                                                                                             |
| Cantidad                | Existe cantidad real positiva y unidad canónica o convertibilidad determinista.                                                                                                                                                                                                                              |
| Calidad                 | La cantidad que pretende ingresar tiene una `VPROC-0035.DISPOSITION_DECIDED` vigente cuya decisión autoriza expresamente la liberación de esa cantidad.                                                                                                                                                      |
| Verificación de calidad | El ingreso normal no usa `PRODUCTION_EXECUTION_COMPLETED` como sustituto de liberación. `QUALITY_DISPOSITION_VERIFIED` no es precondición del movimiento cuando su propia verificación necesita comprobar que la decisión fue aplicada en inventario; el resultado NEXO forma parte de esa prueba posterior. |
| Empaque                 | Cuando el perfil aplicable exige empaque o presentación, existe salida empacada identificada y trazable antes de transferirla a almacenamiento.                                                                                                                                                              |
| Sin empaque             | Solo se admite cuando el producto y operación permiten explícitamente almacenamiento a granel, intermedio o en su unidad de stock sin empaque obligatorio.                                                                                                                                                   |
| Lote                    | El lote o identidad trazable se conserva cuando el producto está sujeto a trazabilidad.                                                                                                                                                                                                                      |
| Destino                 | Existe un destino esperado o una regla NEXO capaz de resolverlo; la sugerencia de FOGO no concede autoridad sobre la ubicación física final.                                                                                                                                                                 |
| Correlación             | La solicitud conserva proceso, instancia, evento o comando de origen, correlación, causalidad e idempotencia.                                                                                                                                                                                                |
| Duplicidad              | La misma salida física no fue ya registrada ni permanece con resultado desconocido pendiente de reconciliación.                                                                                                                                                                                              |

No son pruebas suficientes de elegibilidad:

- que el lote exista;
- que FOGO muestre estado `posted`;
- que la cantidad producida sea mayor que cero;
- que exista un LOC configurado en una ruta de producción;
- que exista una fila de empaque;
- que la salida esté etiquetada;
- que se haya calculado costo;
- que una interfaz diga “listo para vender”;
- que exista una intención de `production_output`;
- que el cliente haya recibido una respuesta de éxito sin poder recuperar el efecto autoritativo de NEXO.

---

#### 5. Frontera entre calidad, empaque e ingreso físico

##### 5.1. Calidad

`VPROC-0034.PRODUCTION_EXECUTION_COMPLETED` significa que la ejecución productiva terminó. No autoriza inventario, venta ni consumo por sí mismo.

El camino normal hacia NEXO exige una `VPROC-0035.DISPOSITION_DECIDED` aplicable cuya decisión sea liberar la cantidad afectada. Esa decisión autoriza a los procesos responsables a ejecutar la disposición, pero todavía no prueba que el efecto haya quedado aplicado.

`VPROC-0035.EXECUTION_VERIFICATION_PENDING` existe precisamente para comprobar que la decisión se aplicó al lote, inventario, etiquetas y destinos correctos. Por eso `VPROC-0035.QUALITY_DISPOSITION_VERIFIED` no se impone como precondición circular del ingreso: el resultado reconciliado de NEXO puede constituir parte de la evidencia que permite verificar finalmente la disposición.

Una cantidad retenida, rechazada o destinada a reproceso no se registra como producto terminado disponible mediante este contrato. Si después de una decisión válida de liberación NEXO detecta una condición física incompatible durante recepción o putaway, NEXO conserva autoridad para aislar la existencia y aplicar `VPROC-0024.EX-004` cuando corresponda. La condición física posterior se gobierna sin reescribir la decisión original de FOGO y puede requerir el proceso propietario de condición de inventario.

##### 5.2. Empaque

Cuando el producto requiere empaque, presentación, etiqueta, serialización o LPN antes del almacenamiento:

1. FOGO conserva la identidad del lote y la presentación aplicable;
2. el producto empacado debe estar identificado antes del handoff físico;
3. `VPROC-0036.PACKAGED_OUTPUT_RECORDED` demuestra que la salida empacada ya está identificada;
4. el avance a `VPROC-0036.STORAGE_TRANSFER_PENDING` formaliza que el producto espera ubicación, custodia y movimiento de inventario y constituye el handoff directo hacia NEXO;
5. NEXO registra la recepción, ubicación y posting mediante `VPROC-0024`;
6. el resultado NEXO permite continuar a `VPROC-0036.RECONCILIATION_PENDING`;
7. `VPROC-0036.PACKAGING_CYCLE_RECONCILED` no se usa como precondición circular para iniciar el movimiento que precisamente debe demostrar el almacenamiento.

Cuando el producto no requiere empaque previo, la ausencia de paquete no se convierte en error si el perfil operativo aprobado permite conservarlo directamente en su unidad física y ubicación compatibles.

---

#### 6. Contrato de entrada FOGO → NEXO

La solicitud especializada conserva el contrato base de entrada de `VPROC-0024`:

| Campo canónico             | Uso para producto terminado                                                                               |
| -------------------------- | --------------------------------------------------------------------------------------------------------- |
| `movement_intent`          | Identifica el ingreso físico originado por producción; no autoriza otro tipo de movimiento.               |
| `item_ref`                 | Producto terminado, coproducto o subproducto elegible que NEXO reconoce físicamente.                      |
| `quantity`                 | Cantidad concreta solicitada para este efecto de ingreso.                                                 |
| `unit_ref`                 | Unidad de captura de la cantidad; se valida contra la unidad de stock y reglas de conversión.             |
| `source_ref`               | Referencia estable al hecho productivo de FOGO que origina exactamente este efecto físico.                |
| `destination_location_ref` | Destino esperado cuando ya existe; NEXO valida, acepta o redirige conforme a su contrato.                 |
| `occurred_or_expected_at`  | Momento del hecho o de la entrega física esperada, sin sustituir los timestamps de recepción y posting.   |
| `lot_serial_ref`           | Obligatorio cuando la trazabilidad del producto lo exige.                                                 |
| `lpn_ref`                  | Se conserva cuando el producto está contenido o identificado mediante LPN.                                |
| `condition`                | Condición física con la que se entrega a NEXO; no puede declarar una liberación inexistente.              |
| `cost_context`             | Contexto económico referencial cuando corresponda; no convierte NEXO en propietario del cierre económico. |
| `evidence_refs`            | Evidencia de calidad, empaque, medición, entrega o aceptación necesaria.                                  |
| `client_event_id`          | Identidad estable de la solicitud para deduplicación y recuperación.                                      |

Además, por tratarse de producción, la correlación debe permitir reconstruir sin ambigüedad:

- orden de producción;
- lote productivo;
- instancia de `VPROC-0034`;
- instancia de `VPROC-0037`;
- receta y versión;
- salida específica dentro del lote;
- rol de la salida cuando existen producto principal, coproducto o subproducto;
- disposición de calidad que habilita la cantidad;
- referencia de empaque, presentación, etiqueta o LPN cuando aplique;
- sede y área productiva;
- actor efectivo;
- evento o comando causal;
- versión del recurso;
- `correlation_id`;
- `causation_id`;
- `request_id`;
- `idempotency_key`;
- `source_command_id`;
- evidencia asociada.

FOGO entrega hechos productivos y referencias. NEXO resuelve y confirma sus propios hechos físicos.

---

#### 7. Campos que FOGO no puede afirmar como autoridad NEXO

FOGO no puede enviar como verdad autoritativa:

- saldo físico final;
- saldo disponible final;
- ubicación confirmada si todavía depende de recepción o putaway;
- posición confirmada;
- condición NEXO posterior a inspección física;
- movimiento aplicado;
- identificador de movimiento antes de existir;
- posting confirmado;
- proyección de stock resultante;
- aceptación de bodega;
- reconciliación NEXO;
- disponibilidad comercial final;
- existencia “lista para vender” por una bandera local;
- cierre de `VPROC-0024`.

FOGO puede proponer contexto o destino esperado. NEXO valida y materializa el efecto desde su dominio.

---

#### 8. Unidad, conversión y cantidad

Para cada efecto físico se distinguen, como mínimo:

```text
produced_qty
released_qty
handoff_qty
received_qty
posted_qty
reconciled_qty
```

Reglas:

1. `produced_qty` pertenece al resultado productivo y no prueba cantidad liberada;
2. `released_qty` no puede exceder la cantidad cubierta por la disposición de calidad aplicable;
3. `handoff_qty` es la cantidad concreta que FOGO solicita transferir físicamente a NEXO;
4. `received_qty` se determina desde la recepción real;
5. `posted_qty` es la cantidad efectivamente aplicada al ledger;
6. `reconciled_qty` es la cantidad que NEXO puede explicar con movimiento, ubicación y proyecciones consistentes;
7. ninguna etapa infiere automáticamente la siguiente;
8. una diferencia de cantidad se conserva, investiga y resuelve; no se corrige reemplazando la cantidad productiva original;
9. la unidad de captura y la unidad de stock pueden diferir únicamente mediante conversión determinista, vigente y compatible;
10. el factor aplicado queda trazable con el movimiento;
11. una interfaz no puede imponer `conversion_factor_to_stock` como autoridad sin validación del dominio;
12. una operación de ingreso no puede producir cantidad negativa;
13. una cantidad cero no crea un movimiento “de éxito”;
14. el mismo lote puede ingresarse por partes, pero cada efecto debe conservar identidad propia y la suma no puede exceder la cantidad elegible;
15. las partes no pueden superponerse ni reutilizar la misma identidad de efecto.

Invariante de cierre del handoff productivo:

```text
SUMA(reconciled_qty de efectos físicos válidos)
=
cantidad de salida de FOGO que debe quedar físicamente ingresada
```

cuando el cierre productivo exige que toda esa cantidad sea registrada en NEXO.

Las diferencias que correspondan a merma, reproceso, rechazo, devolución u otra decisión válida se explican mediante su proceso y referencia; no se absorben artificialmente dentro del ingreso.

---

#### 9. Producto principal, coproductos y otras salidas

Una misma ejecución puede producir varias salidas.

El contrato exige:

1. conservar cada producto como identidad separada;
2. conservar el rol productivo reportado por FOGO;
3. no sumar productos diferentes como si fueran una única cantidad;
4. no mezclar unidades incompatibles;
5. no inferir un producto secundario a partir del nombre del principal;
6. relacionar cada efecto de NEXO con la salida exacta que lo originó;
7. admitir destinos distintos cuando la política física lo requiera;
8. aplicar calidad, trazabilidad y presentación a cada salida según su propio contrato;
9. impedir que el movimiento del producto principal sirva como prueba del coproducto;
10. impedir que un único resultado técnico cierre todas las salidas si alguna permanece pendiente, en conflicto o sin efecto físico.

Cuando una salida de FOGO no debe convertirse en inventario físico —por ejemplo, porque su destino canónico no es stock de producto terminado— no se crea un ingreso ficticio para uniformar el modelo.

---

#### 10. Lote, serial, LPN, presentación y genealogía

La identidad física debe ser suficientemente precisa para reconstruir:

```text
ORDEN
→ LOTE PRODUCTIVO
→ RECETA/VERSIÓN
→ SALIDA
→ DISPOSICIÓN DE CALIDAD
→ PRESENTACIÓN / LPN CUANDO APLIQUE
→ INGRESO NEXO
→ MOVIMIENTO
→ LOC / POSICIÓN
→ PROYECCIÓN RESULTANTE
```

Reglas:

1. un producto sujeto a trazabilidad conserva lote o serial;
2. la identidad de lote de FOGO no se reemplaza por un código de ubicación;
3. un LPN agrupa o identifica contenido físico, pero no sustituye producto, lote ni cantidad;
4. el mismo contenido no puede contabilizarse simultáneamente como stock suelto y como contenido de LPN;
5. una presentación no altera la identidad del producto ni autoriza una conversión arbitraria;
6. reimpresión de etiqueta no crea existencia nueva;
7. un cambio de ubicación no crea un nuevo producto terminado;
8. el movimiento de ingreso conserva la procedencia productiva;
9. la genealogía de reproceso o aprovechamiento se preserva cuando el producto proviene de un ciclo relacionado;
10. las correcciones posteriores conservan la relación con la existencia y movimiento originales.

---

#### 11. Destino, putaway y autoridad de ubicación

FOGO puede entregar un `destination_location_ref` esperado cuando la configuración productiva lo resuelva, pero NEXO mantiene autoridad sobre la aceptación física.

NEXO debe validar:

- que el LOC exista y esté activo;
- que pertenezca a la sede aplicable;
- que el producto y su condición sean compatibles con ese LOC;
- que la presentación o LPN pueda almacenarse allí;
- que una posición interna, cuando exista, pertenezca al LOC;
- que no exista bloqueo de ubicación;
- que la condición física permita el almacenamiento;
- que no se esté duplicando una existencia ya recibida.

Si el destino esperado deja de ser válido antes o durante el putaway, `VPROC-0024.EX-002` permite redirigir a una ubicación alternativa conservando causa, aceptación y trazabilidad. La redirección no crea una segunda entrada.

`VPROC-0024.PUTAWAY_PENDING` significa que el recurso recibido todavía espera ubicación final confirmada. No puede tratarse como `INBOUND_MOVEMENT_RECONCILED`.

---

#### 12. Estados y verdad demostrada

| Estado                         | Verdad demostrada                                                                                             | No demuestra                                                                                 |
| ------------------------------ | ------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- |
| `INBOUND_MOVEMENT_REQUESTED`   | Existe intención de ingreso con recurso, cantidad, procedencia, destino esperado y motivo.                    | Que el producto esté recibido, ubicado o contabilizado.                                      |
| `VALIDATION_IN_PROGRESS`       | NEXO verifica producto, unidad, procedencia, destino, condición, calidad aplicable, autoridad e idempotencia. | Que el movimiento pueda ejecutarse todavía.                                                  |
| `READY_FOR_PHYSICAL_EXECUTION` | La operación fue autorizada para comenzar físicamente.                                                        | Que el producto ya esté en custodia o stock.                                                 |
| `IN_EXECUTION`                 | La recepción o movimiento físico está ocurriendo con captura de cantidades y evidencia.                       | Que destino, putaway o posting estén confirmados.                                            |
| `PENDING_CONFIRMATION`         | Existe ejecución física que espera aceptación del destino o responsable.                                      | Que el ingreso esté conciliado.                                                              |
| `PUTAWAY_PENDING`              | La existencia recibida espera ubicación definitiva.                                                           | Que la ubicación final o disponibilidad estén confirmadas.                                   |
| `POSTING_PENDING`              | El hecho físico validado espera efecto atómico en ledger y proyecciones.                                      | Que el saldo ya cambió.                                                                      |
| `INBOUND_MOVEMENT_RECONCILED`  | Recepción, ubicación, movimiento y proyecciones coinciden o las diferencias quedaron resueltas.               | Que exista conformidad comercial, venta, costo definitivo o cierre productivo independiente. |

Solo el estado final normal autoriza a FOGO a tratar el efecto NEXO como conciliado.

---

#### 13. Idempotencia y unicidad del efecto físico

Toda solicitud debe obtener una identidad estable antes del primer envío.

El alcance lógico de deduplicación debe preservar, como mínimo, la combinación de:

- proceso e instancia productiva de origen;
- lote;
- salida específica;
- producto;
- cantidad y unidad solicitadas;
- disposición de calidad y versión relevante;
- presentación o LPN cuando aplique;
- propósito de ingreso;
- sede;
- destino esperado cuando fue parte del comando;
- versión del contrato.

Reglas:

1. mismo `idempotency_key` y mismo contenido lógico devuelve el resultado previamente conocido;
2. mismo `idempotency_key` con contenido materialmente diferente produce conflicto;
3. un nuevo `idempotency_key` no permite volver a aplicar una salida física ya registrada;
4. NEXO debe proteger también la identidad empresarial del efecto de origen, no solo la clave técnica;
5. un timeout no significa fallo;
6. un ACK técnico no significa posting;
7. una respuesta perdida obliga a consultar el resultado durable o reconciliar antes de reenviar;
8. un retry conserva correlación, identidad y fingerprint lógico;
9. dos workers o solicitudes concurrentes no pueden crear dos movimientos sobre la misma porción física;
10. una operación con resultado desconocido permanece recuperable; no se transforma en una nueva intención.

---

#### 14. Concurrencia y versiones

Antes de aplicar el efecto, NEXO debe volver a comprobar:

- versión de la solicitud;
- vigencia del lote y producto;
- disposición de calidad;
- condición del destino;
- estado de la operación;
- existencia de un movimiento previo correlacionado;
- cambios en la presentación o LPN;
- autoridad del actor efectivo;
- coherencia entre cantidad recibida y cantidad que se pretende postear.

Una versión obsoleta no se aplica sobre el estado vigente por conveniencia.

Si la misma salida cambia materialmente antes del posting, el sistema debe resolver si corresponde:

- rechazar por versión obsoleta;
- cancelar trabajo no ejecutado;
- corregir mediante una nueva revisión;
- ajustar un efecto ya realizado mediante una acción vinculada.

Nunca se edita silenciosamente el movimiento original para “hacerlo coincidir” con el último estado de FOGO.

---

#### 15. Eventos fuera de orden

El contrato acepta que integración y red puedan entregar señales en un orden distinto al empresarial.

Reglas:

1. una solicitud de ingreso recibida antes de satisfacer sus dependencias obligatorias no se convierte automáticamente en stock;
2. una señal tardía no retrocede un estado más nuevo;
3. una confirmación de calidad tardía puede habilitar trabajo pendiente solo si corresponde al mismo lote, versión y cantidad;
4. un evento de FOGO no autoriza a NEXO a saltar estados internos de `VPROC-0024`;
5. `VPROC-0024.EVT-005` no se interpreta como cierre;
6. `VPROC-0024.EVT-006` es la confirmación empresarial final normal del ingreso;
7. una dependencia que llega después puede reactivar una operación diferida sin crear otra instancia;
8. los eventos incompatibles quedan en conflicto o conciliación y requieren resolución trazable.

---

#### 16. Eventos empresariales reutilizados

No se crea una nueva familia de eventos para esta integración.

NEXO reutiliza las seis definiciones vigentes de `VPROC-0024`:

- `VPROC-0024.EVT-001` — ingreso o reubicación solicitado;
- `VPROC-0024.EVT-002` — validación en curso;
- `VPROC-0024.EVT-003` — lista para ejecución física;
- `VPROC-0024.EVT-004` — confirmación pendiente;
- `VPROC-0024.EVT-005` — posting pendiente;
- `VPROC-0024.EVT-006` — ingreso conciliado.

Como hechos causales o dependencias de FOGO se reutilizan, según corresponda:

- finalización operativa de la ejecución productiva;
- disposición de calidad;
- salida empacada registrada;
- efectos de inventario pendientes del cierre productivo.

El comando solicita el efecto; el evento describe un hecho durable. Un evento no se convierte en comando mediante una bandera local.

---

#### 17. Excepciones de `VPROC-0024`

##### 17.1. HOLD

`VPROC-0024.EX-001` suspende el movimiento antes de publicación final cuando existe una condición que impide continuar.

Debe conservar:

- motivo;
- alcance;
- actor;
- instante;
- trabajo ya ejecutado;
- custodia vigente;
- cantidades;
- condición de salida del hold.

No deshace movimientos confirmados.

##### 17.2. REROUTE

`VPROC-0024.EX-002` cambia el destino antes o durante putaway.

Debe conservar:

- destino original;
- destino nuevo;
- causa;
- validación del nuevo LOC;
- aceptación;
- relación con la misma operación.

No duplica existencia.

##### 17.3. ESCALATE

`VPROC-0024.EX-003` aplica cuando la entrada física no puede corresponderse con el origen declarado o existe una diferencia que requiere decisión.

Escalar:

- no inventa lote;
- no crea producto;
- no corrige cantidad por inferencia;
- no concede autorización;
- no confirma ingreso.

##### 17.4. QUARANTINE

`VPROC-0024.EX-004` permite aislar la entrada física desde ejecución cuando una condición observada exige impedir disponibilidad.

La cuarentena:

- conserva la cantidad física;
- conserva lote, LOC y procedencia;
- impide disponibilidad indebida;
- no decide disposición definitiva;
- no reescribe la liberación original;
- permite enlazar el tratamiento posterior de condición correspondiente.

---

#### 18. Cancelación, nulidad, retorno y ajuste

Se reutilizan las acciones canónicas de `VPROC-0024`.

| Acción                        | Uso                                                                                                                      |
| ----------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| `VPROC-0024.CCR-001` `CANCEL` | Detiene la ejecución restante antes del siguiente handoff o sobre la parte no ejecutada.                                 |
| `VPROC-0024.CCR-002` `VOID`   | Anula una instrucción inválida o duplicada cuando no produjo movimiento válido.                                          |
| `VPROC-0024.CCR-003` `RETURN` | Ejecuta un movimiento inverso o compensatorio cuando existe efecto físico confirmado que debe restituirse o trasladarse. |
| `VPROC-0024.CCR-004` `ADJUST` | Registra una diferencia demostrada de cantidad, ubicación o condición mediante ajuste separado.                          |

Reglas:

1. cancelar no elimina lo ya ejecutado;
2. `VOID` no se usa para borrar un ingreso físico válido;
3. un retorno es un nuevo movimiento correlacionado;
4. un ajuste conserva observación, diferencia, causa y autorización;
5. ningún mecanismo sobrescribe el movimiento original;
6. una corrección FOGO posterior al posting debe enlazarse con la corrección física correspondiente en NEXO;
7. la historia conserva antes, después, autoridad y motivo.

---

#### 19. Contrato de resultado NEXO → FOGO

Para que FOGO pueda reconocer un efecto físico como satisfecho, NEXO debe devolver o hacer recuperable una prueba autoritativa que permita reconstruir:

- `process_id = VPROC-0024`;
- `process_instance_id`;
- estado actual;
- `result_reference`;
- `correlation_id`;
- `request_id`;
- `idempotency_key` o referencia equivalente;
- producto;
- cantidad y unidad recibidas;
- cantidad y unidad posteadas;
- cantidad reconciliada;
- lote o serial cuando aplique;
- LPN cuando aplique;
- LOC y posición confirmados cuando correspondan;
- condición resultante;
- referencias de movimiento;
- referencias de evidencia y aceptación;
- versión del recurso o resultado;
- cualquier diferencia o acción compensatoria vinculada.

FOGO no necesita una copia editable del ledger. Necesita la referencia autoritativa y la proyección mínima suficiente para demostrar que su efecto físico quedó aplicado.

---

#### 20. Reconciliación con `VPROC-0036` y `VPROC-0037`

##### 20.1. Empaque

Cuando el producto requiere empaque, FOGO puede pasar de salida empacada registrada a conciliación de empaque utilizando la evidencia NEXO correspondiente.

La conciliación de empaque debe poder comprobar:

- cantidad empacada;
- unidades o bultos;
- etiquetas;
- LPN cuando aplique;
- cantidad transferida;
- existencia recibida por NEXO;
- ubicación;
- diferencias.

Un ingreso NEXO sin correspondencia con la salida empacada no cierra el ciclo de empaque.

##### 20.2. Cierre productivo

`VPROC-0037.INVENTORY_EFFECTS_PENDING` se mantiene mientras cualquier efecto físico requerido presente:

- ausencia de instancia NEXO;
- validación pendiente;
- ejecución pendiente;
- confirmación pendiente;
- putaway pendiente;
- posting pendiente;
- resultado desconocido;
- conflicto;
- cantidad divergente;
- lote o producto no correlacionable;
- movimiento compensatorio pendiente;
- estado distinto de `INBOUND_MOVEMENT_RECONCILED` cuando el efecto debe cerrarse normalmente.

FOGO solo puede continuar de `VPROC-0037.INVENTORY_EFFECTS_PENDING` a `VPROC-0037.CLOSURE_REVIEW_PENDING` cuando todos los efectos físicos requeridos del cierre tienen evidencia autoritativa coherente o una resolución excepcional explícita que el contrato de cierre permita.

El cierre de FOGO no fabrica la confirmación de NEXO.

---

#### 21. Disponibilidad y venta

El contrato distingue:

```text
EXISTENCIA FÍSICA
≠
EXISTENCIA DISPONIBLE
≠
EXISTENCIA VENDIBLE
≠
PEDIDO CUMPLIDO
```

`VPROC-0024.INBOUND_MOVEMENT_RECONCILED` demuestra el ingreso físico conciliado.

La disponibilidad posterior depende además de:

- condición;
- restricciones de lote;
- ubicación;
- cuarentena;
- vencimiento;
- presentación;
- reglas de producto;
- reservas;
- políticas de canal y venta aplicables.

Una configuración FOGO con nombre equivalente a `sellable_stock` no puede sustituir esas decisiones propietarias.

Una salida dirigida a cumplimiento directo de pedido no se convierte artificialmente en inventario terminado si el contrato de esa operación no exige un ingreso físico intermedio.

---

#### 22. Observación de la implementación vigente

La implementación actual constituye una capacidad transitoria y no la definición objetivo de este contrato.

Se observa actualmente que:

1. FOGO invoca `fogo_create_real_production_batch` desde la creación del lote;
2. el flujo puede resolver `output_mode` como inventario, stock vendible o cumplimiento directo;
3. el lote se crea con estado local `posted`;
4. cuando el modo genera stock, la función actualiza directamente proyecciones de inventario;
5. registra movimientos `production_output`;
6. puede crear paquetes con estado local `available`;
7. el soporte multi-salida agrega movimientos y proyecciones para coproductos y calcula conversiones/costos;
8. esas acciones ocurren dentro del mismo conjunto de funciones de producción, sin materializar el ciclo empresarial completo `VPROC-0024`;
9. la interfaz NEXO de entradas existente está orientada principalmente a entradas de recepción y proveedor y no demuestra por sí sola el contrato productivo FOGO → NEXO definido aquí.

La brecha no es ausencia total de movimientos de inventario. La brecha es que el efecto se encuentra acoplado al RPC de FOGO y no expresa todavía la separación canónica de propiedad, calidad, recepción física, estados de `VPROC-0024`, resultado recuperable e idempotencia empresarial entre aplicaciones.

Esta tarea no modifica esa implementación.

---

#### 23. Handoff de implementación

La materialización posterior deberá reutilizar las tareas canónicas ya existentes responsables de:

- ingreso, ubicaciones, movimientos, ledger, proyecciones y trazabilidad en NEXO;
- superficies productivas y de resultado en FOGO;
- autorización por acción y contexto;
- contratos de aplicación, idempotencia y reconciliación;
- arquitectura de datos y efectos exactamente una vez;
- pruebas E2E y certificación productiva.

La implementación deberá sustituir gradualmente el acoplamiento directo sin romper historia, movimientos existentes ni lotes ya creados.

El paquete de implementación deberá demostrar, antes de retirar cualquier compatibilidad transitoria:

1. paridad de cantidades y unidades;
2. ausencia de doble stock;
3. correlación lote → salida → movimiento;
4. recuperación de respuestas perdidas;
5. concurrencia segura;
6. calidad y disponibilidad separadas;
7. putaway verificable;
8. soporte multi-salida;
9. correcciones compensatorias;
10. reconciliación FOGO ↔ NEXO.

---

#### 24. Criterios de aceptación documental

La tarea queda documentalmente completa cuando el contrato demuestra que:

1. el ingreso usa `VPROC-0024`;
2. FOGO y NEXO conservan propiedad separada;
3. ejecución productiva terminada no equivale a inventario;
4. existe una decisión de calidad que autoriza el efecto antes del camino normal y su verificación final puede consumir la evidencia NEXO sin dependencia circular;
5. el empaque requerido se conserva sin producir una dependencia circular;
6. el producto sin empaque obligatorio tiene tratamiento explícito;
7. se preservan producto, lote, receta/versión y salida de origen;
8. se preservan presentación y LPN cuando aplican;
9. cada efecto físico conserva cantidad y unidad;
10. las conversiones son deterministas;
11. múltiples salidas se registran por identidad y no por suma ciega;
12. FOGO no afirma el saldo ni movimiento NEXO;
13. NEXO valida el destino;
14. putaway y posting son estados separados;
15. posting pendiente no equivale a efecto aplicado;
16. solo ingreso conciliado prueba el efecto físico normal;
17. disponibilidad y vendibilidad permanecen separadas;
18. idempotencia cubre reintentos y también duplicación con otra clave técnica;
19. timeout y respuesta perdida conservan resultado recuperable;
20. concurrencia no duplica el movimiento;
21. los eventos fuera de orden no saltan dependencias;
22. `HOLD`, `REROUTE`, `ESCALATE` y `QUARANTINE` conservan su semántica;
23. `CANCEL`, `VOID`, `RETURN` y `ADJUST` no destruyen historia;
24. FOGO puede reconciliar el efecto a partir de la respuesta autoritativa;
25. `VPROC-0037` no cierra con efectos físicos inciertos;
26. la implementación actual queda distinguida del contrato objetivo;
27. las brechas quedan en tareas canónicas existentes;
28. no se autoriza ningún cambio físico desde esta tarea;
29. no se crean eventos empresariales nuevos;
30. el registro de requisitos permanece sin cambios porque la cobertura vigente ya protege estos comportamientos.

---

#### Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

Justificación: la tarea especializa y hace explícito el contrato productivo sobre comportamientos ya protegidos por requisitos vigentes de FOGO, NEXO e integración: ciclo del lote, separación entre finalización, calidad e inventario, identidad y conversión de producto, ledger y proyecciones reconciliables, trazabilidad por lote/condición, idempotencia, efecto físico exactamente una vez, compensación y conciliación entre producción e inventario. No aparece un comportamiento material sin cobertura que justifique crear, modificar, diferir, descartar u obsoletar una fila del registro canónico.

---

#### Cobertura de prueba existente preservada

Se preserva, sin modificación, la cobertura vigente de:

- `TREQ-FOGO-001`;
- `TREQ-FOGO-002`;
- `TREQ-FOGO-004`;
- `TREQ-NEXO-010`;
- `TREQ-NEXO-011`;
- `TREQ-NEXO-012`;
- `TREQ-INTEGRATION-003`;
- `TREQ-INTEGRATION-006`;
- `TREQ-INTEGRATION-011`;
- `TREQ-INTEGRATION-013`.

En particular:

- `TREQ-NEXO-011` ya exige fuente canónica de movimientos y proyecciones, atomicidad o idempotencia compensable y ausencia de doble contabilización;
- `TREQ-NEXO-012` ya protege lote, origen, liberación, ubicación, cantidad y condición;
- `TREQ-FOGO-004` ya separa finalización productiva, disposición de calidad y publicación en inventario;
- `TREQ-INTEGRATION-011` ya exige que el producto terminado de FOGO atraviese un contrato correlacionado e idempotente hacia NEXO y produzca el movimiento físico exactamente una vez;
- `TREQ-INTEGRATION-013` ya protege la cadena producción → calidad → inventario → costo y prohíbe producto retenido publicado o efectos sin lote.

---

#### Continuidad

**ÚLTIMA TAREA APROBADA**
`INT-PROD-003 — Definir contrato para que FOGO finalice el lote`

**TAREA ACTUAL APROBADA**
`INT-PROD-004 — Definir contrato para que NEXO registre el producto terminado`

**SIGUIENTE TAREA RESERVADA**
`INT-POS-001 — Auditar documentación, endpoints, webhooks y límites del POS vigente`


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
