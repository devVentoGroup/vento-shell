### MINI-BLOQUE — COMPRAS RECEPCION E INVENTARIO

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **compras recepcion e inventario** dentro de **X INTEGRACIONES**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `INT-PROC-001` a `INT-PROC-005` — 5 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `INT-PROC-001`: Definir contrato para que ORIGO apruebe la orden de compra
- `INT-PROC-002`: Definir contrato para que ORIGO registre la recepción
- `INT-PROC-003`: Definir contrato para que NEXO cree la entrada de inventario
- `INT-PROC-004`: Definir contrato para que NUMERA reciba el evento económico
- `INT-PROC-005`: Definir control que evite una recepción duplicada
<!-- PLAN-SECTION-META:END -->

### ✅ INT-PROC-001 — Definir contrato para que ORIGO apruebe la orden de compra

**Estado:** APROBADA  
**Tarea anterior:** `INT-WORK-005 — Definir consumo del contexto por SHELL y las aplicaciones` — APROBADA  
**Tarea siguiente:** `INT-PROC-002 — Definir contrato para que ORIGO registre la recepción` — RESERVADA  
**Tipo de tarea:** documental; definición del contrato de autorización y formalización de la compra en ORIGO para `VPROC-0021`, incluyendo precondiciones, segregación, decisión de aprobación, estados, idempotencia, concurrencia, versionado, cambios materiales, emisión al proveedor, proyecciones consumidoras y reconciliación con la implementación observada, sin modificar código, tablas, RLS, RPC, funciones, migraciones, datos, Supabase ni configuración  
**Bloque:** X — Integraciones  
**Mini-bloque:** Compras, recepción e inventario  
**Fase:** exclusivamente documental  
**Aplicación propietaria:** ORIGO  
**Proceso propietario:** `VPROC-0021 — Aprobar y emitir compras separando flujo ordinario, urgencia y excepción`  
**Implementación física autorizada:** ninguna

---

#### 1. Objetivo

Definir de forma inequívoca el contrato mediante el cual ORIGO recibe una propuesta de compra completa, la somete a los controles y a la autoridad aplicables, registra una decisión de aprobación trazable y permite preparar y emitir la orden únicamente después de que esa decisión sea válida.

La regla cardinal queda:

```text
NECESIDAD DE COMPRA
→ EVALUACIÓN / SELECCIÓN DE PROVEEDOR
→ PROPUESTA DE COMPRA COMPLETA
→ REVISIÓN
→ APROBACIÓN AUTORIZADA
→ PREPARACIÓN DE ORDEN
→ EMISIÓN AL PROVEEDOR
→ CONFIRMACIÓN DEL COMPROMISO
```

No:

```text
FORMULARIO CREADO
→ ORDEN APROBADA
```

No:

```text
SEÑAL AUTOMÁTICA
→ ORDEN APROBADA
```

No:

```text
BORRADOR
→ SENT
→ SE PRESUME APROBACIÓN
```

No:

```text
APROBACIÓN
→ INVENTARIO RECIBIDO
```

No:

```text
APROBACIÓN
→ OBLIGACIÓN ECONÓMICA DEFINITIVA
```

---

#### 2. Resultado sustantivo

`INT-PROC-001` deja definido un único contrato documental de aprobación de compra con los siguientes resultados materiales:

1. ORIGO queda confirmada como propietaria de `VPROC-0021` y única aplicación que gobierna el estado canónico de la compra y de la orden.
2. La aprobación se identifica exactamente con la transición `VPROC-0021.TR-003`, desde `VPROC-0021.PENDING_APPROVAL` hacia `VPROC-0021.APPROVED`.
3. Una propuesta no podrá alcanzar `APPROVED` sin autoridad efectiva, segregación, alcance, evidencia, versión y precondiciones vigentes.
4. Se preservan como dimensiones de política empresa, sede, centro de costo, categoría, importe, riesgo y urgencia, sin inventar umbrales o montos en esta tarea.
5. Se separan de forma obligatoria solicitud, comparación, aprobación, orden, emisión, aceptación del proveedor, recepción, inventario, obligación económica y pago.
6. Se define el tratamiento ordinario, urgente y excepcional sin permitir que urgencia equivalga a ausencia de control.
7. Se define la obligación de nueva revisión y nueva aprobación cuando cambie materialmente el contenido ya aprobado antes de la emisión.
8. Se adopta el contrato transversal de idempotencia, concurrencia, reintento, resultado desconocido y auditoría ya aprobado en `INT-APP-004` a `INT-APP-009`.
9. Se prohíbe crear un evento empresarial nuevo para el mero estado `APPROVED`, porque `PROC-CAT-017` no aprobó una definición normal de evento para ese estado.
10. Se fijan las fronteras con NEXO, NUMERA y FOGO para impedir que una aprobación o una orden emitida se conviertan prematuramente en entrada de inventario o hecho económico definitivo.
11. Se reconcilia la implementación física observada de ORIGO y se mantiene su brecha bajo requisitos y tareas ya existentes, sin duplicar backlog.
12. No se crean ni modifican requisitos `TREQ-*` porque la conducta queda cubierta por requisitos canónicos vigentes.

Balance documental:

| Control                                     |             Resultado |
| ------------------------------------------- | --------------------: |
| Proceso propietario                         |  **1 — `VPROC-0021`** |
| Aplicación propietaria                      |         **1 — ORIGO** |
| Aplicaciones consumidoras directas          | **2 — NEXO y NUMERA** |
| Aplicaciones consumidoras condicionales     |          **1 — FOGO** |
| Estado inicial preservado                   |                 **1** |
| Estados intermedios preservados             |                 **6** |
| Estado final normal preservado              |                 **1** |
| Transiciones normales preservadas           |                 **7** |
| Acciones excepcionales preservadas          |                 **4** |
| Acciones CCR preservadas                    |                 **4** |
| Definiciones normales de evento preservadas |                 **6** |
| Nuevas definiciones normales de evento      |                 **0** |
| Cambios físicos                             |                 **0** |
| Requisitos de prueba creados o modificados  |                 **0** |

---

#### 3. Base canónica preservada

Esta tarea consume y conserva sin redefinir las decisiones aprobadas en:

- `VPROC-0019`, para la necesidad de compra;
- `VPROC-0020`, para comparación, evaluación y selección de proveedor;
- `VPROC-0021`, para aprobación y emisión de la compra;
- `VPROC-0022`, para recepción y aceptación comercial posterior;
- `PROC-CAT-005` y `PROC-CAT-006`, para propiedad y consumidoras;
- `PROC-CAT-007` y `PROC-CAT-008`, para iniciadores, continuadores, apoyos y control;
- `PROC-CAT-009` a `PROC-CAT-014`, para estado inicial, estados intermedios, estado final, transiciones, excepciones y acciones de cancelación, anulación, reversión y corrección;
- `PROC-CAT-015` y `PROC-CAT-016`, para entradas y salidas;
- `PROC-CAT-017`, para las definiciones normales de evento;
- `PROC-CAT-018`, para auditoría;
- `PROC-CAT-019`, para métricas;
- `INT-APP-001` a `INT-APP-010`, para eventos, consumidoras, idempotencia, reintentos, compensación, auditoría, sincronización, errores parciales y prohibición de escrituras cruzadas sin contrato;
- `TREQ-ORIGO-002` y `TREQ-ORIGO-004`;
- `TREQ-AUTH-001`, `TREQ-AUTH-010`, `TREQ-AUTH-013` y `TREQ-AUTH-015`;
- `TREQ-INTEGRATION-003` y `TREQ-INTEGRATION-006`.

Nada de esta tarea convierte una decisión documental en implementación física ni altera las responsabilidades ya aprobadas.

---

#### 4. Frontera propietaria

La propiedad queda:

```text
VPROC-0019 — NECESIDAD DE COMPRA
ORIGO
        ↓
VPROC-0020 — EVALUACIÓN Y SELECCIÓN
ORIGO
        ↓
VPROC-0021 — APROBACIÓN Y EMISIÓN
ORIGO
        ↓
VPROC-0022 — RECEPCIÓN Y ACEPTACIÓN COMERCIAL
ORIGO
        ↓
MOVIMIENTO / UBICACIÓN / CUSTODIA DE INVENTARIO
NEXO
        ↓
EFECTO ECONÓMICO AUTORIZADO
NUMERA
```

Por tanto:

1. ORIGO conserva el estado de `VPROC-0021`.
2. NEXO no aprueba la compra.
3. NUMERA no aprueba la compra.
4. FOGO no aprueba la compra.
5. El proveedor no aprueba una decisión interna de Vento Group.
6. Una aplicación consumidora no podrá escribir directamente el estado de `VPROC-0021`.
7. Supabase podrá materializar persistencia y transición, pero no constituye una propietaria empresarial distinta.

---

#### 5. Propósito empresarial de `VPROC-0021`

Se preserva el propósito aprobado:

> Autorizar y formalizar compras con el nivel de control adecuado, diferenciando operación ordinaria, urgencia y excepción.

La tarea no reduce `VPROC-0021` a un cambio de columna de estado.

La instancia representa una decisión empresarial sobre un compromiso externo que puede afectar presupuesto, proveedor, inventario, recepción y obligaciones posteriores.

---

#### 6. Inicio válido de `VPROC-0021`

El estado inicial continúa siendo:

```text
VPROC-0021.PURCHASE_REQUEST_PENDING_APPROVAL
```

La instancia solo nace cuando existe una propuesta de compra suficientemente completa con:

- necesidad o decisión de abastecimiento identificable;
- proveedor;
- condiciones;
- alcance;
- líneas de compra;
- precios y moneda;
- entrega esperada;
- evidencia suficiente para revisión;
- clasificación aplicable;
- actor o fuente identificable.

Al nacer continúa siendo verdadero:

```text
NO APROBADA
NO EMITIDA
NO ENVIADA AL PROVEEDOR
```

---

#### 7. Separación de identidades empresariales

Las siguientes entidades o momentos no podrán colapsarse en un único estado genérico:

| Concepto                   | Regla                                                     |
| -------------------------- | --------------------------------------------------------- |
| necesidad de compra        | expresa una necesidad; no constituye orden                |
| caso de abastecimiento     | compara alternativas; no constituye aprobación            |
| proveedor seleccionado     | habilita preparar decisión; no constituye orden           |
| propuesta pendiente        | contiene la compra candidata; no está aprobada            |
| aprobación                 | decisión interna autorizada sobre una versión exacta      |
| orden en preparación       | instrumento posterior a la aprobación                     |
| orden emitida              | versión enviada al proveedor                              |
| confirmación del proveedor | reconocimiento externo; no reemplaza aprobación interna   |
| recepción                  | hecho posterior de entrega y conformidad                  |
| movimiento de inventario   | efecto físico gobernado por NEXO                          |
| obligación económica       | efecto financiero gobernado por NUMERA cuando corresponda |
| pago                       | proceso financiero posterior e independiente              |

Una misma tabla física podrá contener referencias de varias etapas durante una transición tecnológica, pero esa circunstancia no autoriza mezclar sus significados canónicos.

---

#### 8. Información obligatoria para someter la compra

Se preservan como entradas obligatorias de `VPROC-0021`:

```text
sourcing_decision_ref
supplier_ref
ordered_lines
prices_and_currency
delivery_terms
approval_route
requested_delivery_date
```

Estas entradas deberán representar referencias y contenido verificables, no texto libre utilizado como autoridad.

El servidor o frontera autoritativa deberá resolver desde las fuentes propietarias los atributos protegidos que no puedan aceptarse desde el cliente.

---

#### 9. Información condicional

Se preservan como entradas condicionales:

```text
emergency_classification
advance_payment_terms
contract_ref
budget_reservation_ref
shipping_or_incoterm_data
```

Su obligatoriedad depende del tipo de compra, materialidad, política, proveedor, modalidad de pago, transporte o clasificación aplicables.

La ausencia de un campo condicional obligatorio no podrá degradarse silenciosamente a un flujo ordinario.

---

#### 10. Validaciones mínimas específicas

Antes de permitir una decisión de aprobación deberán comprobarse, cuando correspondan:

1. proveedor vigente y autorizado para el alcance aplicable;
2. correspondencia entre proveedor, líneas y condiciones;
3. cantidades, unidades, presentaciones y conversiones válidas;
4. importes, moneda, impuestos y totales reproducibles;
5. fecha y condiciones de entrega;
6. necesidad o decisión de abastecimiento correlacionada;
7. presupuesto o tratamiento financiero requerido;
8. empresa, sede y centro de costo aplicables;
9. categoría y riesgo aplicables;
10. clasificación ordinaria, urgente o excepcional;
11. autoridad efectiva del actor que decide;
12. segregación de funciones;
13. versión vigente del recurso;
14. ausencia de una emisión duplicada de la misma intención;
15. evidencia requerida por materialidad o excepción.

Un valor calculado por la interfaz no se acepta como autoridad cuando deba resolverse o recalcularse en servidor.

---

#### 11. Dimensiones de política de aprobación

Se preservan exactamente las dimensiones ya aprobadas:

```text
empresa
sede
centro de costo
categoría
importe
riesgo
urgencia
```

`INT-PROC-001` no inventa:

- umbrales monetarios;
- nombres de niveles de aprobación;
- personas específicas;
- límites por proveedor;
- porcentajes de tolerancia;
- excepciones permanentes;
- permisos nuevos;
- una matriz paralela de autoridad.

La política concreta deberá resolverse desde los contratos canónicos de autorización y de ORIGO vigentes en el momento de la decisión.

---

#### 12. Segregación obligatoria

Se conservan capacidades separadas para:

```text
SOLICITANTE
COMPRADOR
APROBADOR
RECEPTOR
```

Reglas:

1. crear o preparar una compra no concede capacidad para aprobarla;
2. recibir mercancía no concede capacidad para aprobar la compra;
3. aprobar no concede capacidad para registrar una recepción física inexistente;
4. una concesión individual no puede neutralizar una denegación transversal de segregación;
5. la visibilidad de un botón no constituye autorización;
6. una lista local de roles no constituye autorización final;
7. la decisión se revalida en servidor con recurso, territorio, estado y columnas permitidas;
8. si una política permite que una persona ejerza más de una capacidad en un caso específico, esa combinación deberá provenir de autoridad canónica y quedar auditada; no se infiere por jerarquía o conveniencia.

---

#### 13. Actores aprobados de `VPROC-0021`

Se preserva la asignación funcional:

| Función               | Actor o clase aprobada                            |
| --------------------- | ------------------------------------------------- |
| iniciador primario    | `RESPONSABLE_DE_COMPRAS`                          |
| iniciadores alternos  | `GERENCIA_GENERAL`; `COORDINACION_DE_OPERACIONES` |
| continuador principal | `RESPONSABLE_DE_COMPRAS`                          |
| apoyos                | `RESPONSABLE_FINANCIERO`; `AREA_SOLICITANTE`      |
| control o aceptación  | `GERENCIA_GENERAL`; `COORDINACION_DE_OPERACIONES` |
| participante externo  | `PROVEEDOR`                                       |

Estas clases describen participación funcional. La autorización efectiva continúa dependiendo del catálogo y alcance canónicos; la clase funcional no se convierte por sí sola en permiso.

---

#### 14. Estados canónicos

Se preserva la secuencia normal completa:

```text
PURCHASE_REQUEST_PENDING_APPROVAL
→ UNDER_REVIEW
→ PENDING_APPROVAL
→ APPROVED
→ ORDER_PREPARING
→ ORDER_ISSUED
→ SUPPLIER_ACK_PENDING
→ PURCHASE_COMMITMENT_FORMALIZED
```

Con identificadores completos:

```text
VPROC-0021.PURCHASE_REQUEST_PENDING_APPROVAL
VPROC-0021.UNDER_REVIEW
VPROC-0021.PENDING_APPROVAL
VPROC-0021.APPROVED
VPROC-0021.ORDER_PREPARING
VPROC-0021.ORDER_ISSUED
VPROC-0021.SUPPLIER_ACK_PENDING
VPROC-0021.PURCHASE_COMMITMENT_FORMALIZED
```

No se sustituyen estos estados por `draft`, `sent` o `received` como contrato objetivo.

Las siete transiciones normales se preservan completas:

| Transición          | Desde                               | Hacia                            | Modalidad         | Clase de autoridad                           | Puertas                   | Efecto           |
| ------------------- | ----------------------------------- | -------------------------------- | ----------------- | -------------------------------------------- | ------------------------- | ---------------- |
| `VPROC-0021.TR-001` | `PURCHASE_REQUEST_PENDING_APPROVAL` | `UNDER_REVIEW`                   | `NORMAL_FORWARD`  | `CONTROL_ACEPTACION`                         | `G01,G02,G03,G04,G05`     | `AVANCE_ATOMICO` |
| `VPROC-0021.TR-002` | `UNDER_REVIEW`                      | `PENDING_APPROVAL`               | `NORMAL_FORWARD`  | `PRINCIPAL_O_APOYO_AUTORIZADO`               | `G01,G02,G03,G04`         | `AVANCE_ATOMICO` |
| `VPROC-0021.TR-003` | `PENDING_APPROVAL`                  | `APPROVED`                       | `NORMAL_FORWARD`  | `CONTROL_ACEPTACION`                         | `G01,G02,G03,G04,G05`     | `AVANCE_ATOMICO` |
| `VPROC-0021.TR-004` | `APPROVED`                          | `ORDER_PREPARING`                | `NORMAL_FORWARD`  | `PRINCIPAL_O_APOYO_AUTORIZADO`               | `G01,G02,G03,G04`         | `AVANCE_ATOMICO` |
| `VPROC-0021.TR-005` | `ORDER_PREPARING`                   | `ORDER_ISSUED`                   | `NORMAL_FORWARD`  | `EMISOR_Y_RECEPTOR_AUTORIZADOS`              | `G01,G02,G03,G04,G06`     | `AVANCE_ATOMICO` |
| `VPROC-0021.TR-006` | `ORDER_ISSUED`                      | `SUPPLIER_ACK_PENDING`           | `NORMAL_FORWARD`  | `PRINCIPAL_O_APOYO_CON_PARTICIPANTE_EXTERNO` | `G01,G02,G03,G04,G06`     | `AVANCE_ATOMICO` |
| `VPROC-0021.TR-007` | `SUPPLIER_ACK_PENDING`              | `PURCHASE_COMMITMENT_FORMALIZED` | `NORMAL_TERMINAL` | `PRINCIPAL_O_APOYO_CON_PARTICIPANTE_EXTERNO` | `G01,G02,G03,G04,G06,G07` | `CIERRE_ATOMICO` |

La tabla conserva literalmente las transiciones aprobadas y no crea alternativas.

---

#### 15. Significado de `UNDER_REVIEW`

`VPROC-0021.UNDER_REVIEW` significa que se validan, como mínimo:

- necesidad;
- proveedor;
- condiciones;
- presupuesto cuando corresponda;
- segregación;
- documentación;
- consistencia del alcance.

Estar en revisión no reserva aprobación ni garantiza emisión.

---

#### 16. Significado de `PENDING_APPROVAL`

`VPROC-0021.PENDING_APPROVAL` significa que la propuesta ya está preparada para una decisión autorizada y espera la autoridad definida por las dimensiones aplicables.

No significa:

- aprobada tácitamente;
- aprobada por timeout;
- aprobada por haber sido creada por gerencia;
- aprobada porque el proveedor existe;
- aprobada porque existe presupuesto;
- aprobada porque la interfaz permite continuar;
- aprobada porque fue enviada accidentalmente.

---

#### 17. Transición autoritativa de aprobación

La transición exacta es:

```text
VPROC-0021.TR-003
```

Con frontera:

```text
VPROC-0021.PENDING_APPROVAL
        ↓
DECISIÓN AUTORIZADA
        ↓
VPROC-0021.APPROVED
```

Se preserva su clase de autoridad:

```text
CONTROL_ACEPTACION
```

Y sus puertas canónicas ya definidas:

```text
G01,G02,G03,G04,G05
```

Esta tarea referencia dichas puertas sin reinterpretar su semántica ni crear una segunda definición.

---

#### 18. Precondiciones de `VPROC-0021.TR-003`

La transición solo podrá producir efecto cuando, como mínimo:

1. la instancia exista;
2. su estado actual sea exactamente `VPROC-0021.PENDING_APPROVAL`;
3. la versión del recurso coincida con la versión evaluada;
4. el actor y principal efectivos estén identificados;
5. exista autoridad de aprobación aplicable al alcance real de la compra;
6. empresa, sede y centro de costo aplicables sean compatibles con esa autoridad;
7. la segregación exigida no esté violada;
8. la propuesta conserve proveedor, líneas, condiciones, importes y fechas válidos;
9. la clasificación de urgencia o excepción sea coherente y esté sustentada;
10. la evidencia obligatoria esté disponible;
11. no exista una denegación estructural o transversal aplicable;
12. la solicitud tenga identidad idempotente estable;
13. no se esté reutilizando esa identidad para contenido materialmente diferente.

Un fallo en una precondición impide el efecto; no se corrige cambiando directamente el estado.

---

#### 19. Efecto exacto de aprobar

Una aprobación válida produce exclusivamente la verdad empresarial:

```text
LA VERSIÓN EVALUADA DE LA COMPRA
FUE AUTORIZADA POR LA AUTORIDAD APLICABLE
```

Debe conservar al menos referencia a:

- instancia de proceso;
- versión aprobada;
- actor y principal;
- alcance territorial y organizacional aplicable;
- decisión;
- instante;
- razones o fundamento estructurado;
- evidencia;
- clasificación ordinaria, urgente o excepcional;
- correlación con necesidad y evaluación de proveedor;
- resultado idempotente.

La aprobación no produce por sí sola:

```text
ORDER_ISSUED
SUPPLIER_ACKNOWLEDGED
RECEIPT_ACCEPTED
STOCK_INCREASED
PAYABLE_RECOGNIZED
PAYMENT_EXECUTED
```

---

#### 20. Semántica de `APPROVED`

`VPROC-0021.APPROVED` es un estado intermedio de `VPROC-0021`.

En este estado:

- la compra está autorizada;
- todavía no existe una orden emitida;
- todavía puede requerirse construir la versión formal de la orden;
- cualquier cambio material exige volver al control correspondiente y no reutilizar ciegamente la aprobación;
- las consumidoras pueden conocer una proyección mínima cuando exista finalidad aprobada, pero no ejecutar efectos reservados a recepción, inventario o contabilidad.

---

#### 21. No se crea evento empresarial `APPROVED`

`PROC-CAT-017` no aprobó una definición normal de evento para `VPROC-0021.APPROVED`.

Por tanto, queda prohibido inventar en esta tarea un evento como:

```text
purchase-order-approved
purchase-approved
order-approved
```

La aprobación queda demostrada por:

- la transición `VPROC-0021.TR-003`;
- el estado resultante `VPROC-0021.APPROVED`;
- la auditoría de la decisión;
- la versión y evidencia vinculadas.

Los eventos normales continúan siendo exclusivamente los ya aprobados por `PROC-CAT-017`.

---

#### 22. Transición posterior a preparación

Después de la aprobación, el avance normal continúa mediante:

```text
VPROC-0021.TR-004
APPROVED
→ ORDER_PREPARING
```

La preparación de la orden materializa el instrumento que contendrá las líneas, términos y referencias de la versión autorizada.

Preparar una orden no puede cambiar silenciosamente el contenido que fue aprobado.

---

#### 23. Emisión al proveedor

La emisión normal continúa mediante:

```text
VPROC-0021.TR-005
ORDER_PREPARING
→ ORDER_ISSUED
```

Se preserva la clase:

```text
EMISOR_Y_RECEPTOR_AUTORIZADOS
```

`ORDER_ISSUED` significa que una versión identificable de la orden fue enviada al proveedor y existe evidencia de esa emisión.

La mera generación de PDF, enlace, mensaje o vista previa no prueba `ORDER_ISSUED`.

---

#### 24. Confirmación del proveedor

Después de emitir:

```text
VPROC-0021.TR-006
ORDER_ISSUED
→ SUPPLIER_ACK_PENDING
```

Y posteriormente:

```text
VPROC-0021.TR-007
SUPPLIER_ACK_PENDING
→ PURCHASE_COMMITMENT_FORMALIZED
```

El final normal requiere que la compra autorizada haya sido emitida y aceptada o reconocida por el proveedor con alcance, precio, condiciones, fechas y referencias estables.

La confirmación del proveedor:

- no sustituye la aprobación interna;
- no puede ampliar unilateralmente líneas, precio o condiciones;
- no convierte entrega futura en recepción;
- no convierte el compromiso en obligación económica definitiva.

---

#### 25. Versión exacta de la aprobación

Toda aprobación deberá vincularse a una versión exacta del contenido lógico aprobado.

Como mínimo, la huella lógica debe poder distinguir cambios en:

- proveedor;
- líneas;
- cantidades;
- unidades o presentaciones;
- precios;
- moneda;
- impuestos o condiciones que alteren el total;
- fecha o condición de entrega material;
- centro de costo;
- contrato;
- anticipo;
- clasificación de urgencia o excepción;
- información de transporte cuando sea material;
- otras condiciones que la política declare materiales.

No se aprueba una “orden” abstracta separada de su contenido versionado.

---

#### 26. Cambio material después de aprobación

Se preserva `VPROC-0021.EX-003 — REQUEST_INFO` para solicitar nueva aprobación por cambio material después de la aprobación y antes de la emisión.

Regla:

```text
VERSIÓN A APROBADA
        ↓
CAMBIO MATERIAL
        ↓
VERSIÓN B
        ↓
LA APROBACIÓN A NO AUTORIZA AUTOMÁTICAMENTE B
        ↓
NUEVA REVISIÓN / NUEVA DECISIÓN SEGÚN POLÍTICA
```

Queda prohibido:

```text
APPROVED
→ EDITAR PROVEEDOR / IMPORTE / LÍNEAS
→ CONSERVAR APROBACIÓN ANTERIOR
→ EMITIR
```

---

#### 27. Cambios no materiales

Esta tarea no inventa una lista cerrada de cambios no materiales.

Una corrección podrá conservar el tratamiento previo únicamente cuando la política canónica determine que no altera el contenido sometido a autoridad y exista auditoría suficiente.

Ante ambigüedad sobre materialidad:

```text
FAIL CLOSED
→ REVISIÓN
```

---

#### 28. Flujo ordinario

El flujo ordinario conserva toda la secuencia canónica:

```text
PROPUESTA COMPLETA
→ UNDER_REVIEW
→ PENDING_APPROVAL
→ APPROVED
→ ORDER_PREPARING
→ ORDER_ISSUED
→ SUPPLIER_ACK_PENDING
→ PURCHASE_COMMITMENT_FORMALIZED
```

No existe aprobación implícita por:

- transcurso del tiempo;
- rol visual;
- monto bajo no documentado;
- repetición histórica;
- proveedor habitual;
- compra recurrente;
- una orden anterior semejante.

Una automatización podrá asistir clasificación, cálculo o preparación, pero la autoridad deberá provenir del contrato aprobado.

---

#### 29. Compra urgente

La compra urgente utiliza un carril expedito, no un carril sin control.

Se preserva `VPROC-0021.EX-001 — OVERRIDE` antes de la aprobación.

Debe conservar, cuando aplique:

- causa estructurada;
- necesidad de urgencia;
- autoridad reforzada;
- límites de alcance;
- vigencia;
- evidencia;
- responsable de regularización;
- plazo de regularización;
- auditoría;
- proveedor;
- líneas;
- recepción posterior;
- conciliación posterior.

La urgencia no permite omitir controles legales, de seguridad, integridad o segregación declarados no dispensables.

---

#### 30. Excepción no urgente

Una excepción comercial, de proveedor, presupuesto, competencia, contrato o condición deberá conservar fundamento, autoridad y alcance propios.

No se utiliza `emergency_classification` como cajón genérico para toda excepción.

La excepción no puede:

- fabricar proveedor válido;
- omitir líneas;
- eliminar evidencia;
- conceder autoridad a quien no la tiene;
- desactivar segregaciones no dispensables;
- convertir un rechazo en aprobación;
- hacer retroactiva una aprobación posterior.

---

#### 31. Suspensión y rechazo

Se preservan:

```text
VPROC-0021.EX-002 — HOLD
VPROC-0021.EX-004 — REJECT
```

`HOLD` puede suspender la emisión antes de comprometer externamente mientras se resuelve una condición.

`REJECT` cierra excepcionalmente la solicitud antes de emitir la orden y exige motivo y notificación.

Una orden rechazada no se transforma en aprobada modificando directamente el estado. Una nueva intención deberá seguir el tratamiento canónico que corresponda.

---

#### 32. Idempotencia de la decisión

La solicitud de aprobación deberá adoptar el contrato de `INT-APP-004`.

Antes del primer intento deberá existir una identidad idempotente estable para la misma intención lógica.

Resultados lógicos preservados:

```text
APPLIED
DUPLICATE_RESULT_RETURNED
CONFLICTING_REUSE
IN_PROGRESS_RECOVERABLE
STALE_VERSION
OUT_OF_ORDER_DEFERRED
RECONCILIATION_REQUIRED
REJECTED
```

Reglas:

1. el mismo identificador con el mismo contenido lógico no puede aprobar dos veces;
2. un replay exitoso devuelve el resultado durable original;
3. el mismo identificador con contenido incompatible produce conflicto;
4. una clave conocida no concede autoridad;
5. cada intento revalida actor, permiso, alcance, estado y versión;
6. una respuesta perdida no justifica crear una segunda decisión;
7. un resultado incierto se reconcilia antes de reintentar un efecto no seguro.

---

#### 33. Concurrencia y versión del recurso

Dos aprobadores, dos pestañas, dos dispositivos o un retry concurrente no podrán producir estados incompatibles.

La frontera autoritativa deberá comprobar la versión esperada antes del efecto.

Ejemplo contractual:

```text
ACTOR A LEE VERSIÓN 7
ACTOR B MODIFICA Y PRODUCE VERSIÓN 8
ACTOR A INTENTA APROBAR VERSIÓN 7
→ STALE_VERSION / CONFLICT
→ NO SE APRUEBA VERSIÓN 8 POR ARRASTRE
```

La aprobación siempre corresponde a la versión efectivamente evaluada.

---

#### 34. Resultado de una solicitud de efecto

Cuando la aprobación se invoque mediante una frontera de integración o comando, se conserva la semántica transversal:

```text
REJECTED_AUTHORIZATION
ACCEPTED_PENDING
EFFECT_CONFIRMED
PRIOR_RESULT_REPLAYED
CONFLICT
RESULT_UNKNOWN
PARTIALLY_APPLIED
RECONCILIATION_REQUIRED
```

Para la unidad de aprobación:

- `EFFECT_CONFIRMED` exige que `VPROC-0021.TR-003` haya producido el estado `APPROVED` de forma durable;
- `PRIOR_RESULT_REPLAYED` devuelve la aprobación previa de la misma intención;
- `CONFLICT` no puede mostrarse como aprobación;
- `RESULT_UNKNOWN` no puede desencadenar preparación o emisión hasta reconciliar;
- un HTTP exitoso o ACK técnico no equivale a aprobación confirmada.

---

#### 35. Reintentos

Los reintentos conservan las políticas aprobadas de `INT-APP-005`.

Un retry:

- conserva la identidad de la operación;
- no cambia la versión lógica aprobada;
- no amplía autoridad;
- no evita una nueva comprobación de autorización cuando corresponda;
- no convierte un error permanente en transitorio;
- no puede avanzar a emisión mientras el resultado de aprobación permanezca desconocido.

---

#### 36. Eventos empresariales preservados

`INT-PROC-001` no crea definiciones normales de evento.

Para `VPROC-0021` se conservan exactamente:

| Definición           | Tipo                                                            | Clase               | Hecho                                           |
| -------------------- | --------------------------------------------------------------- | ------------------- | ----------------------------------------------- |
| `VPROC-0021.EVT-001` | `vento.process.vproc-0021.purchase-request-pending-approval.v1` | `PROCESS_STARTED`   | nace una compra pendiente de aprobación         |
| `VPROC-0021.EVT-002` | `vento.process.vproc-0021.under-review.v1`                      | `REVIEW_FACT`       | comienza revisión material                      |
| `VPROC-0021.EVT-003` | `vento.process.vproc-0021.pending-approval.v1`                  | `DECISION_FACT`     | la compra espera decisión autorizada            |
| `VPROC-0021.EVT-004` | `vento.process.vproc-0021.order-preparing.v1`                   | `EXECUTION_FACT`    | se prepara la orden posterior a la autorización |
| `VPROC-0021.EVT-005` | `vento.process.vproc-0021.order-issued.v1`                      | `HANDOFF_FACT`      | la versión de orden fue enviada al proveedor    |
| `VPROC-0021.EVT-006` | `vento.process.vproc-0021.purchase-commitment-formalized.v1`    | `PROCESS_COMPLETED` | el compromiso comercial quedó formalizado       |

Sensibilidad preservada:

```text
RESTRICTED_FINANCIAL
```

---

#### 37. Sobre transversal de eventos

Toda materialización posterior de esos eventos deberá heredar `EVENT-ENVELOPE-001`, incluyendo según aplique:

- identidad de evento y definición;
- proceso e instancia;
- aplicación productora;
- agregado y versión;
- instante del hecho y registro;
- principal y actor efectivo;
- sede y área cuando correspondan;
- estados previo y actual;
- correlación y causalidad;
- request e idempotencia;
- referencias de resultado, salida y evidencia;
- referencia de auditoría;
- razón;
- sensibilidad, alcance y retención;
- versión de esquema y trazabilidad técnica.

La proyección entregada a cada consumidora aplicará finalidad, minimización y autorización.

---

#### 38. Contrato con NEXO

NEXO es consumidora directa de `VPROC-0021`.

Puede recibir una proyección autorizada del compromiso de compra para finalidades logísticas o de preparación posteriores.

NEXO no podrá interpretar:

```text
APPROVED
```

ni:

```text
ORDER_ISSUED
```

como:

```text
MERCANCÍA RECIBIDA
STOCK DISPONIBLE
ENTRADA DE INVENTARIO CONFIRMADA
```

La creación de entrada física queda reservada a `INT-PROC-003` y depende de la frontera de recepción definida por `INT-PROC-002`.

---

#### 39. Contrato con NUMERA

NUMERA es consumidora directa de `VPROC-0021`.

Puede recibir la proyección mínima necesaria para presupuesto, compromiso o planificación financiera cuando exista finalidad aprobada.

NUMERA no podrá interpretar la aprobación o la emisión como:

```text
FACTURA VALIDADA
OBLIGACIÓN ECONÓMICA RECONOCIDA
CUENTA POR PAGAR DEFINITIVA
PAGO EJECUTADO
```

El evento económico posterior se define en `INT-PROC-004`.

---

#### 40. Contrato con FOGO

FOGO es consumidora condicional de `VPROC-0021`.

Solo recibirá proyección cuando una finalidad productiva aprobada requiera conocer información mínima de abastecimiento o compromiso.

FOGO:

- no aprueba la compra;
- no modifica la orden;
- no cambia proveedor o importe;
- no confirma recepción;
- no crea inventario;
- no crea obligación económica.

---

#### 41. Prohibición de escritura cruzada

Se preserva el principio de `INT-APP-010`:

```text
CONSUMIDORA
→ SOLICITA / CONSUME CONTRATO
→ PROPIETARIA VALIDA Y PRODUCE EFECTO
```

No:

```text
NEXO / NUMERA / FOGO
→ UPDATE purchase_orders.status
```

No:

```text
ADAPTADOR EXTERNO
→ UPDATE approval fields
```

No:

```text
PROVEEDOR
→ CAMBIA ESTADO INTERNO A APPROVED
```

Toda mutación de `VPROC-0021` pasa por la frontera propietaria y sus controles.

---

#### 42. Cambio enviado por el proveedor

Una contrapropuesta, confirmación parcial o cambio de condición enviado por el proveedor se conserva como afirmación externa hasta validación.

Si altera materialmente el compromiso:

```text
RESPUESTA DEL PROVEEDOR
→ DIFERENCIA MATERIAL
→ REVISIÓN INTERNA
→ NUEVA AUTORIDAD CUANDO CORRESPONDA
```

No:

```text
RESPUESTA DEL PROVEEDOR
→ SOBRESCRIBE ORDEN APROBADA
```

---

#### 43. Cancelación, anulación, reversión y reexpresión

Se preservan las cuatro acciones CCR de `VPROC-0021`:

```text
VPROC-0021.CCR-001 — CANCEL
VPROC-0021.CCR-002 — VOID
VPROC-0021.CCR-003 — REVERSE
VPROC-0021.CCR-004 — RESTATE
```

Reglas:

- `CANCEL` detiene efectos futuros permitidos y conserva historia;
- `VOID` marca un instrumento inválido o duplicado sin borrarlo;
- `REVERSE` crea un efecto inverso o compensatorio vinculado cuando ya existe un efecto aplicado;
- `RESTATE` corrige referencias o clasificación conservando antes, después, motivo e impacto.

Ninguna de estas acciones elimina silenciosamente la aprobación o la orden original.

---

#### 44. Auditoría obligatoria

Se preserva `VPROC-0021.AUDIT` con foco obligatorio en:

- aprobación;
- segregación;
- urgencia;
- excepción;
- orden;
- cambios;
- envío al proveedor;
- aceptación externa.

La evidencia deberá permitir reconstruir, cuando aplique:

- solicitud y necesidad relacionada;
- evaluación o decisión de abastecimiento;
- proveedor;
- líneas e importes;
- versión;
- actor y principal;
- autoridad aplicada;
- alcance;
- decisión y razones;
- aprobaciones;
- cambios posteriores;
- emisión;
- confirmación externa;
- cancelación, anulación, reversión o corrección;
- correlación con recepción y conciliación posteriores.

También deberán quedar auditadas las denegaciones y los reintentos relevantes.

---

#### 45. Lecturas y datos sensibles

La información de `VPROC-0021` conserva clasificación financiera restringida.

Especial atención requieren:

- precios;
- importes;
- condiciones de pago;
- anticipos;
- documentos contractuales;
- datos bancarios cuando estén relacionados;
- exportaciones;
- documentos externos para proveedor.

La aplicación consumidora recibe únicamente la proyección necesaria para su finalidad.

---

#### 46. Documento externo para proveedor

Se preserva `TREQ-ORIGO-002`:

Un documento externo para proveedor no puede depender de una URL pública permanente ni exponer información interna adicional.

Su acceso deberá utilizar el mecanismo seguro aprobado, con alcance, expiración, revocación y secreto sin fallback según el contrato propietario correspondiente.

Generar el documento no equivale a aprobar ni emitir la orden.

---

#### 47. Métricas preservadas

Se preservan las métricas de `VPROC-0021`:

```text
VPROC-0021.MET-001
Compromisos de compra emitidos correctamente al primer intento
```

Drivers:

```text
VPROC-0021.MET-002
Tiempo de aprobación

VPROC-0021.MET-003
Tiempo aprobación-emisión
```

Guardrail:

```text
VPROC-0021.MET-004
Compras urgentes o excepcionales,
segregación incumplida
y compromisos fuera de límite
```

No se crean métricas alternativas para esta tarea.

---

#### 48. Implementación física observada

La implementación vigente observada en ORIGO presenta una representación simplificada que no satisface todavía el contrato objetivo completo.

Se observa:

```text
PurchaseOrderStatus
= draft | sent | received
```

La creación física actual inicia una orden con:

```text
status = draft
```

Y la acción de envío observada permite:

```text
draft
→ sent
```

sin materializar en esa acción la secuencia canónica:

```text
UNDER_REVIEW
→ PENDING_APPROVAL
→ APPROVED
→ ORDER_PREPARING
→ ORDER_ISSUED
```

La estructura física contiene referencias `approved_by` y `approval_date`, pero su mera existencia no demuestra un contrato de aprobación integral.

---

#### 49. Edición física observada

La implementación observada permite editar órdenes mientras estén en `draft` y reconstruye las líneas físicas mediante eliminación y reinserción.

Esta tarea no declara que esa técnica sea por sí sola inválida para un borrador.

Sí establece que, una vez exista una decisión de aprobación:

- la versión aprobada deberá permanecer reconstruible;
- los cambios materiales no podrán sobrescribirla silenciosamente;
- la nueva versión deberá recibir el tratamiento de revalidación y nueva aprobación aplicable;
- la emisión deberá corresponder a la versión efectivamente autorizada.

---

#### 50. Autorización física observada

La política física observada sobre `purchase_orders` permite acceso a usuarios autenticados que existan como empleados mediante una condición amplia.

La existencia de esa política no demuestra por sí sola:

- permiso exacto de consulta;
- permiso exacto de aprobación;
- alcance por sede;
- alcance por centro de costo;
- estado permitido;
- columnas permitidas;
- segregación;
- control de versión.

La brecha continúa bajo `TREQ-ORIGO-002`, `TREQ-ORIGO-004`, `TREQ-AUTH-010` y `TREQ-AUTH-013`.

---

#### 51. Reconciliación de la brecha física

La diferencia entre implementación observada y contrato objetivo queda explícita:

| Aspecto            | Implementación observada                    | Contrato objetivo                                  |
| ------------------ | ------------------------------------------- | -------------------------------------------------- |
| estados            | `draft`, `sent`, `received`                 | estados `VPROC-0021.*` y posterior `VPROC-0022.*`  |
| aprobación         | no demostrada integralmente antes de `sent` | transición `VPROC-0021.TR-003` obligatoria         |
| segregación        | no demostrada por la acción de envío        | decisión efectiva obligatoria                      |
| versión aprobada   | no demostrada                               | versión exacta y auditable                         |
| cambio material    | no demuestra nueva aprobación               | revalidación / nueva decisión cuando corresponda   |
| emisión            | cambio a `sent`                             | `ORDER_ISSUED` después de aprobación y preparación |
| evento empresarial | no demostrado en la acción observada        | catálogo `VPROC-0021.EVT-*` vigente                |
| consumidoras       | no define por sí solo frontera completa     | NEXO/NUMERA directas; FOGO condicional             |

No se crea una brecha nueva porque el desajuste ya está registrado y tiene propietarios canónicos.

---

#### 52. Propietarios documentales de la brecha

Se preservan como responsables existentes, según el 04A y el roadmap aprobado:

- `ORIGO-AUTH-004` a `ORIGO-AUTH-010` para controles de consulta, aprobación, alcance y protección aplicables;
- `ORIGO-AUTH-013` y `ORIGO-AUTH-015` según las responsabilidades ya asignadas en el registro;
- `ORIGO-UX-001` a `ORIGO-UX-008` para el ciclo de abastecimiento y aprobación correspondiente;
- `AUTH-QA-015`, `AUTH-QA-016` y `UX-QA-026` para certificación de las reglas ya registradas;
- los paquetes E5 y arquitectura física posteriores para materialización.

`INT-PROC-001` no reasigna ni duplica esos propietarios.

---

#### 53. Prohibición de inferir cierre por infraestructura

La existencia de:

- tabla `purchase_orders`;
- campos `approved_by` o `approval_date`;
- estados `draft`, `sent`, `received`;
- páginas de creación o edición;
- PDF;
- helper de envío;
- RLS;
- referencias de costo;

no permite declarar implementado `INT-PROC-001` ni satisfecho `VPROC-0021`.

Esta tarea cierra exclusivamente la definición documental del contrato.

---

#### 54. Cambios físicos no autorizados

`INT-PROC-001` no autoriza:

- modificar `purchase_orders`;
- agregar estados físicos;
- crear enums;
- crear tablas de aprobación;
- crear RPC;
- crear triggers;
- modificar RLS;
- modificar grants;
- crear índices;
- crear eventos físicos;
- modificar ORIGO;
- modificar NEXO, NUMERA o FOGO;
- ejecutar migraciones;
- alterar datos;
- regularizar órdenes históricas;
- enviar órdenes reales;
- aprobar compras reales;
- crear umbrales de aprobación.

Toda migración futura de Supabase que materialice este contrato deberá quedar documentada y creada en `vento-shell` conforme al gobierno vigente.

---

#### 55. Requisitos de prueba derivados

**Resultado: NO GENERA REQUISITOS DE PRUEBA NUEVOS NI MODIFICA REQUISITOS EXISTENTES.**

Justificación:

Esta tarea no introduce una conducta empresarial no protegida. Especializa y reconcilia para la aprobación de compras reglas ya registradas sobre separación de estados, segregación, autorización server-side, auditoría, idempotencia y unicidad de fuente. Crear otra fila para repetir esas reglas produciría duplicidad semántica en el registro canónico.

---

#### 56. Cobertura de prueba existente preservada

La tarea conserva como cobertura vigente:

- `TREQ-ORIGO-004`, para separación de identidades y estados, política de aprobación, segregación, revisiones, compras urgentes y evidencia;
- `TREQ-ORIGO-002`, para autorización de órdenes por permiso, territorio, estado y columnas, además del documento externo para proveedor;
- `TREQ-AUTH-001`, para impedir autoridad derivada de listas locales de roles;
- `TREQ-AUTH-010`, para segregación entre compras y recepción;
- `TREQ-AUTH-013`, para validación server-side de mutaciones con permiso, actor, territorio, estado y columnas;
- `TREQ-AUTH-015`, para evidencia correlacionable de decisiones protegidas;
- `TREQ-INTEGRATION-003`, para idempotencia, reintentos y recuperación de efectos distribuidos;
- `TREQ-INTEGRATION-006`, para impedir fuentes empresariales competidoras.

Ninguna de esas filas se modifica en esta tarea.

---

#### 57. Criterios de aceptación

- [ ] ORIGO queda identificada como única propietaria de `VPROC-0021`.
- [ ] La frontera con `VPROC-0019`, `VPROC-0020` y `VPROC-0022` permanece explícita.
- [ ] La aprobación se vincula exactamente a `VPROC-0021.TR-003`.
- [ ] El estado fuente es `VPROC-0021.PENDING_APPROVAL`.
- [ ] El estado destino es `VPROC-0021.APPROVED`.
- [ ] Se exige versión vigente del recurso.
- [ ] Se exige autoridad efectiva y segregación.
- [ ] Se preservan empresa, sede, centro de costo, categoría, importe, riesgo y urgencia como dimensiones de política.
- [ ] No se inventaron umbrales monetarios ni permisos.
- [ ] `APPROVED` no se presenta como orden emitida.
- [ ] `ORDER_ISSUED` no se presenta como mercancía recibida.
- [ ] La aprobación no crea inventario.
- [ ] La aprobación no crea obligación económica definitiva.
- [ ] Cambios materiales no reutilizan silenciosamente una aprobación anterior.
- [ ] El carril urgente conserva causa, límites, autoridad, regularización y auditoría.
- [ ] Se preservan `HOLD`, `REQUEST_INFO`, `OVERRIDE` y `REJECT`.
- [ ] Se preservan `CANCEL`, `VOID`, `REVERSE` y `RESTATE`.
- [ ] Se adopta idempotencia y concurrencia transversal.
- [ ] Un resultado desconocido no avanza silenciosamente a emisión.
- [ ] No se creó un evento empresarial para `APPROVED`.
- [ ] Se preservan exactamente las seis definiciones normales `VPROC-0021.EVT-*`.
- [ ] NEXO no crea entrada de inventario por la aprobación.
- [ ] NUMERA no reconoce obligación definitiva por la aprobación.
- [ ] FOGO permanece consumidora condicional sin autoridad sobre la orden.
- [ ] Se documentó el desajuste físico `draft → sent → received` sin declararlo contrato canónico.
- [ ] La brecha física quedó vinculada a requisitos y tareas existentes.
- [ ] No se modificó código, Supabase, migraciones, datos ni operación.
- [ ] No se crearon o modificaron requisitos `TREQ-*`.

---

#### 58. Estado de cierre documental

`INT-PROC-001` queda documentalmente completa cuando las reglas anteriores se adopten como definición vigente del contrato de aprobación de compra.

Su aprobación documental no significa que ORIGO ya implemente físicamente ese contrato.

La implementación deberá demostrar posteriormente, mediante los paquetes y tareas propietarias correspondientes, que la aprobación, versionado, segregación, emisión, auditoría e integración cumplen estas reglas en servidor y en las aplicaciones consumidoras.

---

#### 59. Continuidad

```text
ÚLTIMA TAREA APROBADA
INT-WORK-005 — Definir consumo del contexto por SHELL y las aplicaciones
        ↓
TAREA ACTUAL APROBADA
INT-PROC-001 — Definir contrato para que ORIGO apruebe la orden de compra
        ↓
SIGUIENTE TAREA RESERVADA
INT-PROC-002 — Definir contrato para que ORIGO registre la recepción
```


### ✅ INT-PROC-002 — Definir contrato para que ORIGO registre la recepción

**Estado:** APROBADA  
**Tarea anterior:** `INT-PROC-001 — Definir contrato para que ORIGO apruebe la orden de compra` — APROBADA  
**Tarea siguiente:** `INT-PROC-003 — Definir contrato para que NEXO cree la entrada de inventario` — RESERVADA  
**Tipo de tarea:** documental; definición del contrato empresarial de recepción en ORIGO para `VPROC-0022`, incluyendo apertura, captura, verificación física y documental, tratamiento de diferencias, aceptación total, parcial o condicional, rechazo y cuarentena, handoffs posteriores hacia NEXO y NUMERA, idempotencia, concurrencia, reconciliación y relación con la implementación observada, sin modificar código, tablas, RLS, RPC, funciones, migraciones, datos, Supabase ni configuración  
**Bloque:** X — Integraciones  
**Mini-bloque:** Compras, recepción e inventario  
**Fase:** exclusivamente documental  
**Aplicación propietaria:** ORIGO  
**Proceso propietario:** `VPROC-0022 — Recibir compras, verificar conformidad y resolver diferencias sin separar recepción física, documental y económica`  
**Implementación física autorizada:** ninguna

---

#### 1. Objetivo

Definir de forma inequívoca el contrato mediante el cual ORIGO abre y registra una recepción asociada con un compromiso de compra válido, conserva lo efectivamente observado y documentado, resuelve diferencias y produce una decisión comercial de aceptación o rechazo antes de habilitar los efectos posteriores de inventario y conciliación económica.

La regla cardinal queda:

```text
COMPROMISO DE COMPRA IDENTIFICABLE
→ RECEPCIÓN ESPERADA
→ LLEGADA REGISTRADA
→ VERIFICACIÓN FÍSICA
→ VERIFICACIÓN DOCUMENTAL
→ DIFERENCIAS, SI EXISTEN
→ DECISIÓN DE ACEPTACIÓN
→ HANDOFF DE BIENES ACEPTADOS HACIA NEXO
→ HANDOFF ECONÓMICO HACIA NUMERA
→ RECONCILIACIÓN DE LA RECEPCIÓN
```

No:

```text
ENTREGA LLEGÓ
→ STOCK DISPONIBLE
```

No:

```text
FACTURA EXISTE
→ OBLIGACIÓN ECONÓMICA DEFINITIVA
```

No:

```text
FORMULARIO GUARDADO
→ RECEPCIÓN ACEPTADA
```

No:

```text
ORIGO REGISTRA RECEPCIÓN
→ ESCRIBE DIRECTAMENTE LA VERDAD PROPIETARIA DE NEXO O NUMERA
```

---

#### 2. Resultado sustantivo

`INT-PROC-002` deja definido un único contrato documental de recepción de compra con los siguientes resultados materiales:

1. ORIGO queda confirmada como propietaria de `VPROC-0022` y de la aceptación comercial y documental de la recepción.
2. La recepción conserva separadas llegada, observación física, verificación documental, diferencias, decisión de aceptación, ingreso físico posterior y conciliación económica.
3. La aceptación se identifica exactamente con la transición `VPROC-0022.TR-007`, desde `VPROC-0022.ACCEPTANCE_PENDING` hacia `VPROC-0022.PUTAWAY_PENDING`.
4. La recepción puede decidirse total, parcial o condicionalmente según la evidencia y el alcance efectivamente verificados, sin inventar tolerancias en esta tarea.
5. Cuando no existen diferencias, se preserva el bypass canónico `VPROC-0022.TR-005`; cuando existen, se conserva el tratamiento `DOCUMENT_CHECK_IN_PROGRESS → DIFFERENCE_UNDER_REVIEW → ACCEPTANCE_PENDING`.
6. Los bienes aceptados quedan habilitados para un handoff hacia NEXO; ORIGO no materializa por contrato la entrada, ubicación ni custodia propietaria de NEXO.
7. La información económica queda habilitada para un handoff posterior hacia NUMERA; ORIGO no reconoce por sí sola una obligación definitiva ni ejecuta pago.
8. Se preserva una identidad estable de la operación de recepción, su huella lógica, versión, correlación y resultado recuperable para reintentos y concurrencia.
9. Una recepción se trata como una sola operación empresarial correlacionada aunque sus efectos pertenezcan a aplicaciones distintas; ningún participante puede reclamar propiedad sobre la verdad de otro dominio.
10. Se preserva de forma explícita la modalidad de recepción que determina si existe efecto de inventario o si la recepción es solo registral, sin inventar movimientos cuando ese efecto no corresponde.
11. Se preservan parcialidad, cantidades, unidades, presentaciones, lotes, vencimientos, condición y evidencia sin convertir una recepción parcial en cierre total de la orden.
12. Se conservan exactamente nueve transiciones normales, cuatro acciones excepcionales, cuatro acciones CCR y seis definiciones normales de evento de `VPROC-0022`.
13. No se crea un evento normal adicional para la mera decisión de aceptación.
14. Se reconcilia la implementación física actual de ORIGO y se mantiene su brecha bajo requisitos y tareas ya existentes, sin duplicar backlog.
15. No se crean ni modifican requisitos `TREQ-*` porque los comportamientos quedan protegidos por requisitos canónicos vigentes.

Balance documental:

| Control                                     |             Resultado |
| ------------------------------------------- | --------------------: |
| Proceso propietario                         |  **1 — `VPROC-0022`** |
| Aplicación propietaria                      |         **1 — ORIGO** |
| Consumidoras directas                       | **2 — NEXO y NUMERA** |
| Consumidoras condicionales                  |  **2 — FOGO y PULSO** |
| Estado inicial preservado                   |                 **1** |
| Estados intermedios preservados             |                 **7** |
| Estado final normal preservado              |                 **1** |
| Transiciones normales preservadas           |                 **9** |
| Bypass normal preservado                    |                 **1** |
| Acciones excepcionales preservadas          |                 **4** |
| Acciones CCR preservadas                    |                 **4** |
| Definiciones normales de evento preservadas |                 **6** |
| Nuevas definiciones normales de evento      |                 **0** |
| Cambios físicos                             |                 **0** |
| Requisitos de prueba creados o modificados  |                 **0** |

---

#### 3. Base canónica preservada

Esta tarea consume y conserva sin redefinir las decisiones aprobadas en:

- `VPROC-0021`, para el compromiso de compra formalizado que antecede a la recepción;
- `VPROC-0022`, para recepción, conformidad, diferencias, aceptación y reconciliación;
- `VPROC-0024`, para la entrada, ubicación y custodia física posterior en NEXO;
- `PROC-CAT-004` a `PROC-CAT-008`, para propósito, propiedad, consumidoras y actores;
- `PROC-CAT-009` a `PROC-CAT-014`, para estado inicial, estados intermedios, estado final, transiciones, excepciones y acciones de cancelación, anulación, reversión y corrección;
- `PROC-CAT-015` y `PROC-CAT-016`, para entradas y salidas;
- `PROC-CAT-017`, para las definiciones normales de evento;
- `PROC-CAT-018`, para auditoría;
- `PROC-CAT-019`, para métricas;
- `INT-APP-001` a `INT-APP-010`, para eventos, consumidoras, idempotencia, reintentos, compensación, auditoría, sincronización, errores parciales y prohibición de escrituras cruzadas sin contrato;
- `INT-PROC-001`, para la frontera previa de aprobación y formalización de la compra;
- los requisitos vigentes que ya protegen modalidad, atomicidad, idempotencia, segregación, handoff, auditoría y unicidad de fuente.

Nada de esta tarea convierte una definición documental en implementación física ni altera responsabilidades aprobadas de ORIGO, NEXO o NUMERA.

---

#### 4. Propósito empresarial de `VPROC-0022`

Se preserva literalmente el propósito aprobado:

> Confirmar que lo recibido física, documental y económicamente corresponde con lo solicitado y resolver diferencias antes de aceptar la obligación.

Por tanto, `VPROC-0022` no es un simple formulario de entrada ni una actualización del estado de la orden.

La recepción debe preservar la relación entre:

```text
LO SOLICITADO / COMPROMETIDO
+
LO ENTREGADO FÍSICAMENTE
+
LO DOCUMENTADO POR EL PROVEEDOR
+
LO ACEPTADO COMERCIALMENTE
+
LO INGRESADO Y UBICADO POR NEXO
+
LO CONCILIADO ECONÓMICAMENTE
```

sin colapsar esas verdades en una sola bandera genérica de recibido.

---

#### 5. Frontera propietaria

La propiedad queda:

```text
VPROC-0021 — COMPROMISO DE COMPRA
ORIGO
        ↓
VPROC-0022 — RECEPCIÓN, CONFORMIDAD Y ACEPTACIÓN COMERCIAL
ORIGO
        ↓
VPROC-0024 — ENTRADA, UBICACIÓN Y CUSTODIA FÍSICA
NEXO
        ↓
EFECTO ECONÓMICO AUTORIZADO
NUMERA
```

Reglas:

1. ORIGO abre, verifica, acepta, rechaza y reconcilia la recepción empresarial.
2. NEXO no decide la aceptación comercial de la compra.
3. ORIGO no se convierte en propietaria del ledger físico de NEXO por capturar una recepción.
4. NUMERA no decide si la mercancía fue físicamente conforme.
5. ORIGO no se convierte en propietaria de la obligación o pago por capturar documentos económicos.
6. El proveedor aporta entrega, documentos y afirmaciones externas; no se autoacepta una recepción.
7. Una integración o adaptador puede transportar información, pero no adquiere propiedad empresarial.
8. Cada aplicación receptora revalida contrato, autoridad, recurso, alcance y versión antes de producir su propio efecto.

---

#### 6. Condición canónica de inicio

El estado inicial continúa siendo:

```text
VPROC-0022.RECEIPT_EXPECTED
```

Patrón:

```text
TRABAJO_PENDIENTE
```

La condición mínima preservada es que exista una entrega física anunciada o un documento de compra, devolución o traslado que justifique recibir.

Además, el inicio funcional aprobado conserva:

- una entrega física o documental asociable a una compra;
- un punto autorizado de recepción;
- una orden, compromiso o excepción válida que justifique la recepción;
- un receptor identificable.

Al nacer continúa siendo verdadero:

```text
MERCANCÍA NO ACEPTADA
NO UBICADA
NO CONTABILIZADA
NO CONCILIADA
```

---

#### 7. Iniciadores y participantes

Se preserva la asignación funcional aprobada:

| Función                   | Actor o clase aprobada                                                                                       |
| ------------------------- | ------------------------------------------------------------------------------------------------------------ |
| iniciador primario        | `RECEPCION_EN_SEDE`                                                                                          |
| iniciadores alternos      | `PROVEEDOR`; `EVENTO_EXTERNO_DE_ENTREGA`                                                                     |
| continuadores principales | `RECEPCION_EN_SEDE`; `BODEGA_Y_ABASTECIMIENTO`                                                               |
| apoyos                    | `RESPONSABLE_DE_COMPRAS`; `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`; `AREA_SOLICITANTE`; `RESPONSABLE_FINANCIERO` |
| control o aceptación      | `GERENCIA_O_SUPERVISION_DE_SEDE`                                                                             |
| externos o técnicos       | `PROVEEDOR`; `ADAPTADOR_DE_INTEGRACION`                                                                      |

Estas clases describen participación funcional. La autorización efectiva continúa dependiendo de permisos, contexto, territorio, recurso, estado y demás reglas canónicas aplicables.

---

#### 8. Información obligatoria de entrada

Se preservan exactamente como grupos obligatorios de `VPROC-0022`:

```text
purchase_commitment_ref
supplier_document_refs
received_lines
received_at
receiving_site_ref
receiver_actor_ref
physical_condition
```

Interpretación:

- `purchase_commitment_ref` vincula la recepción con la compra o compromiso que la justifica;
- `supplier_document_refs` conserva los documentos externos recibidos sin tratarlos automáticamente como verdad interna;
- `received_lines` representa lo observado o declarado para recepción, no una copia editable de la orden;
- `received_at` identifica el momento del hecho de recepción y no debe confundirse con la hora de registro técnico;
- `receiving_site_ref` fija el territorio empresarial aplicable;
- `receiver_actor_ref` identifica al humano responsable de la recepción cuando corresponda;
- `physical_condition` conserva la condición observada de los bienes recibidos.

---

#### 9. Información condicional

Se preservan exactamente como grupos condicionales:

```text
lot_expiry_serials
temperature_readings
differences
rejection_reason
tax_document_data
return_instructions
```

Su obligatoriedad depende del producto, presentación, lote, condición, regulación, diferencia, rechazo o efecto económico aplicables.

La ausencia de un dato condicional requerido no podrá resolverse suponiendo conformidad.

---

#### 10. Sobre transversal obligatorio

Toda solicitud o transición de recepción deberá conservar, cuando aplique:

- identidad idempotente estable de la operación;
- correlación con compra, documentos y efectos derivados;
- `process_id` e instancia de proceso;
- transición o acción solicitada;
- principal y actor efectivo;
- aplicación fuente;
- momento del hecho y momento de recepción técnica;
- zona horaria;
- sede y área cuando correspondan;
- versión del recurso;
- versión contractual;
- razón estructurada cuando no sea un avance ordinario;
- referencias de evidencia.

La interfaz no podrá aportar como autoridad final permiso, rol, estado objetivo, saldo, total, disponibilidad, impuesto o timestamps de auditoría protegidos.

---

#### 11. Identidad de la operación de recepción

Una recepción deberá tener identidad empresarial estable y correlacionable antes de producir efectos repetibles o distribuidos.

La identidad debe permitir distinguir como mínimo:

- una nueva entrega;
- un replay de la misma entrega;
- una recepción parcial posterior legítima;
- una corrección vinculada;
- una operación con contenido materialmente diferente;
- una devolución o tratamiento excepcional relacionado.

No se deduplica únicamente por:

- número de factura aislado;
- proveedor aislado;
- fecha aislada;
- compra aislada;
- producto aislado;
- click o request HTTP aislado.

La clave estable y su huella lógica se rigen por el contrato transversal de idempotencia ya aprobado.

---

#### 12. Modalidad de recepción

Se preserva la regla vigente de que toda recepción debe declarar si genera un efecto de inventario o si es exclusivamente registral.

La modalidad:

- debe quedar visible y auditable;
- forma parte del contenido lógico relevante de la operación;
- no podrá cambiarse silenciosamente después de confirmar efectos;
- no autoriza a ORIGO a escribir directamente la verdad propietaria de NEXO;
- no permite fabricar un movimiento de inventario cuando el efecto físico no corresponde;
- no permite usar una recepción solo registral para declarar stock disponible.

Los nombres físicos actualmente usados por una implementación no se convierten por esta tarea en vocabulario canónico adicional.

Cuando la modalidad no requiera efecto de inventario, `INT-PROC-003` deberá preservar esa decisión y no crear una entrada física ficticia. Cuando sí lo requiera, `INT-PROC-003` deberá materializar el contrato de NEXO sin interpretar el registro ORIGO como stock ya aplicado.

---

#### 13. Correspondencia orden–entrega

Antes de avanzar la recepción deberán validarse, cuando correspondan:

1. existencia y vigencia del compromiso o excepción que justifica recibir;
2. proveedor esperado frente al proveedor de la entrega;
3. sede receptora frente al alcance de la compra;
4. líneas recibidas frente a líneas comprometidas;
5. cantidades y unidades;
6. presentación y conversión aplicable;
7. precio o referencia económica cuando deba verificarse documentalmente;
8. documentos del proveedor;
9. condición física;
10. lote, serial, vencimiento o temperatura cuando aplique;
11. estado actual del recurso;
12. identidad del receptor;
13. evidencia mínima requerida;
14. ausencia de una operación duplicada de la misma intención.

Una diferencia no se corrige modificando silenciosamente la orden o la observación de recepción.

---

#### 14. Cantidades, unidades y presentaciones

Las cantidades observadas deben conservar simultáneamente:

- cantidad recibida en la unidad observada;
- unidad o presentación identificable;
- factor de conversión aplicable cuando exista;
- unidad de stock de referencia cuando corresponda;
- relación con la línea de orden cuando exista;
- cantidad previamente recibida de esa línea cuando sea necesaria para evaluar parcialidad;
- cantidad pendiente resultante como dato derivado, no enviado por el cliente como autoridad.

Una conversión no podrá alterar retroactivamente el significado de una recepción ya confirmada.

---

#### 15. Recepciones parciales

La recepción podrá cubrir solo una parte del compromiso cuando el negocio y la evidencia lo permitan.

Reglas:

1. una recepción parcial conserva su propia identidad y alcance;
2. la cantidad aceptada de una línea no transforma automáticamente el resto pendiente en recibido;
3. una nueva entrega posterior es una nueva operación correlacionada, no un replay de la anterior;
4. la suma acumulada debe poder reconciliarse contra lo comprometido sin doble contabilización;
5. líneas rechazadas, retenidas o no entregadas no se convierten en aceptadas por compartir la misma recepción;
6. no se inventan tolerancias de sobreentrega o subentrega en esta tarea;
7. una política posterior podrá permitir tolerancias solo si existe autoridad y regla canónica explícita.

---

#### 16. Lotes, vencimientos, seriales y temperatura

Cuando el producto o la condición lo exijan, deberán conservarse los identificadores y lecturas aplicables sin degradarlos a notas libres.

La ausencia o invalidez de una evidencia requerida puede:

- impedir aceptación;
- llevar a diferencia;
- activar cuarentena;
- exigir revisión especializada;
- producir rechazo cuando corresponda.

Registrar un lote, serial, vencimiento o temperatura no demuestra por sí solo conformidad.

---

#### 17. Documentos del proveedor

Factura, remisión, certificado, nota, soporte tributario u otro documento externo se conserva como evidencia o afirmación externa hasta su validación.

Por tanto:

```text
DOCUMENTO RECIBIDO
≠
RECEPCIÓN ACEPTADA
```

Y:

```text
FACTURA RECIBIDA
≠
OBLIGACIÓN ECONÓMICA DEFINITIVA
```

La fuente, versión, identificador externo, integridad y relación con la recepción deberán permanecer trazables.

---

#### 18. Estados canónicos completos

Se preserva exactamente la secuencia normal:

```text
VPROC-0022.RECEIPT_EXPECTED
→ VPROC-0022.ARRIVAL_REGISTERED
→ VPROC-0022.PHYSICAL_CHECK_IN_PROGRESS
→ VPROC-0022.DOCUMENT_CHECK_IN_PROGRESS
→ VPROC-0022.DIFFERENCE_UNDER_REVIEW, cuando existen diferencias
→ VPROC-0022.ACCEPTANCE_PENDING
→ VPROC-0022.PUTAWAY_PENDING
→ VPROC-0022.ECONOMIC_RECONCILIATION_PENDING
→ VPROC-0022.RECEIPT_RECONCILED
```

`DIFFERENCE_UNDER_REVIEW` puede omitirse únicamente mediante el bypass canónico aprobado cuando no existen diferencias.

No se sustituyen estos estados por valores físicos como `pending_review`, `received` o `recorded` como contrato objetivo.

---

#### 19. Significado de `ARRIVAL_REGISTERED`

`VPROC-0022.ARRIVAL_REGISTERED` significa que se identificó la llegada con los datos disponibles de entrega, proveedor, documento, momento y contexto.

No significa:

- cantidades verificadas;
- condición aceptada;
- documentos conciliados;
- inventario ingresado;
- obligación reconocida.

---

#### 20. Verificación física

La transición:

```text
VPROC-0022.TR-002
ARRIVAL_REGISTERED
→ PHYSICAL_CHECK_IN_PROGRESS
```

abre la verificación material de productos, presentaciones, cantidades, lote, condición y temperatura aplicable.

La observación física deberá preservarse aunque después exista una diferencia, rechazo, cuarentena o corrección.

No se sobrescribe la observación original para hacerla coincidir con la orden.

---

#### 21. Verificación documental

La transición:

```text
VPROC-0022.TR-003
PHYSICAL_CHECK_IN_PROGRESS
→ DOCUMENT_CHECK_IN_PROGRESS
```

permite comparar, según corresponda:

- orden o compromiso;
- factura;
- remisión;
- certificados;
- condiciones pactadas;
- cantidades y unidades;
- referencias fiscales o contractuales.

La verificación documental no reemplaza la verificación física ni viceversa.

---

#### 22. Tratamiento de diferencias

Cuando exista una discrepancia material se preserva:

```text
VPROC-0022.TR-004
DOCUMENT_CHECK_IN_PROGRESS
→ DIFFERENCE_UNDER_REVIEW
```

Una diferencia debe conservar:

- alcance afectado;
- tipo de discrepancia;
- valor esperado;
- valor observado o documentado;
- evidencia;
- actor o fuente;
- responsable de resolución;
- decisión resultante;
- efectos pendientes o bloqueados.

No se resuelve una diferencia editando destructivamente la observación original.

---

#### 23. Bypass cuando no existen diferencias

Se preserva exactamente:

```text
VPROC-0022.TR-005
DOCUMENT_CHECK_IN_PROGRESS
→ ACCEPTANCE_PENDING
```

con:

```text
NORMAL_BYPASS
G01,G02,G03,G04,G09
OMISION_JUSTIFICADA
```

Este bypass existe solo cuando no hay diferencias que requieran `DIFFERENCE_UNDER_REVIEW`.

No permite omitir la verificación física, la verificación documental ni la decisión de aceptación.

---

#### 24. Cierre de revisión de diferencias

Cuando sí hubo diferencias, se preserva:

```text
VPROC-0022.TR-006
DIFFERENCE_UNDER_REVIEW
→ ACCEPTANCE_PENDING
```

La llegada a `ACCEPTANCE_PENDING` exige que la discrepancia tenga tratamiento suficiente para someter la recepción a una decisión autorizada.

Una diferencia puede quedar asociada con efectos residuales siempre que esos residuales tengan propietario, autoridad y tratamiento explícitos; no se ocultan para cerrar la recepción.

---

#### 25. Significado de `ACCEPTANCE_PENDING`

`VPROC-0022.ACCEPTANCE_PENDING` significa que la recepción fue verificada y espera una decisión de aceptar total, parcial o condicionalmente.

No significa:

- aceptación tácita;
- stock utilizable;
- putaway confirmado;
- obligación económica definitiva;
- pago autorizado;
- ausencia de reclamaciones futuras.

---

#### 26. Transición autoritativa de aceptación

La transición exacta es:

```text
VPROC-0022.TR-007
```

Con frontera:

```text
VPROC-0022.ACCEPTANCE_PENDING
        ↓
DECISIÓN AUTORIZADA
        ↓
VPROC-0022.PUTAWAY_PENDING
```

Se preserva su clase:

```text
CONTROL_ACEPTACION
```

Y sus puertas:

```text
G01,G02,G03,G04,G05,G06
```

La aceptación es el punto contractual que habilita el handoff de los bienes aceptados hacia la operación física de NEXO.

---

#### 27. Alcance de la aceptación

La decisión deberá identificar exactamente qué parte de la recepción queda:

- aceptada;
- aceptada parcialmente;
- aceptada bajo condición autorizada;
- retenida o en cuarentena;
- rechazada;
- pendiente de resolución.

La decisión no podrá ampliar el alcance más allá de lo efectivamente observado y verificado.

Una recepción con líneas mixtas no convierte automáticamente todas las líneas en el mismo resultado.

---

#### 28. Aceptación no equivale a inventario aplicado

El estado:

```text
VPROC-0022.PUTAWAY_PENDING
```

significa que los bienes aceptados esperan ingreso y ubicación física en NEXO.

Por tanto:

```text
PUTAWAY_PENDING
≠
STOCK DISPONIBLE
```

Y:

```text
ACEPTACIÓN ORIGO
≠
MOVIMIENTO NEXO YA CONFIRMADO
```

La materialización exacta del efecto físico pertenece a `INT-PROC-003`.

---

#### 29. Handoff hacia NEXO

El handoff debe conservar, como mínimo según aplique:

- proceso e instancia de recepción;
- referencia de compra;
- referencia de recepción;
- sede;
- actor y principal pertinentes;
- alcance aceptado;
- productos y cantidades aceptadas;
- unidades y conversiones;
- lote, serial, vencimiento o condición;
- acción pendiente;
- versión contractual;
- correlación e idempotencia;
- evidencia mínima necesaria;
- modalidad que determina si existe efecto de inventario.

NEXO deberá revalidar su propia autoridad, ubicación, recurso, estado y contrato.

`INT-PROC-003` materializará el contrato específico mediante el cual NEXO crea —o determina que no corresponde crear— la entrada de inventario. Esta tarea no define sus tablas, RPC, DTO, payload físico ni mecanismo de persistencia.

---

#### 30. Evento material para el handoff físico

Se preserva como evento normal:

```text
VPROC-0022.EVT-004
vento.process.vproc-0022.putaway-pending.v1
HANDOFF_FACT
```

Hecho confirmado:

```text
LOS BIENES ACEPTADOS
ESPERAN INGRESO Y UBICACIÓN FÍSICA EN NEXO
```

El evento no declara que el inventario ya aumentó.

---

#### 31. Transición hacia conciliación económica

Se preserva:

```text
VPROC-0022.TR-008
PUTAWAY_PENDING
→ ECONOMIC_RECONCILIATION_PENDING
```

con clase:

```text
EMISOR_Y_RECEPTOR_AUTORIZADOS
```

La transición exige correlación entre el handoff de la recepción y la confirmación necesaria del efecto físico según el contrato aplicable; no autoriza a ORIGO a suplantar el resultado de NEXO.

---

#### 32. Handoff hacia NUMERA

`VPROC-0022.ECONOMIC_RECONCILIATION_PENDING` significa que debe correlacionarse la recepción aceptada con factura, obligación y diferencias económicas.

NUMERA es consumidora directa de `VPROC-0022` para esa finalidad.

La proyección hacia NUMERA debe limitarse al contenido requerido para su proceso y preservar:

- referencia de compra y recepción;
- proveedor;
- alcance aceptado;
- cantidades y valores aplicables;
- documentos económicos autorizados;
- diferencias o retenciones relevantes;
- correlación con el resultado físico cuando corresponda;
- versión, identidad y auditoría.

El contrato específico del evento económico permanece reservado a `INT-PROC-004`.

---

#### 33. Evento material para la conciliación económica

Se preserva:

```text
VPROC-0022.EVT-005
vento.process.vproc-0022.economic-reconciliation-pending.v1
RECONCILIATION_FACT
```

Hecho confirmado:

```text
SE ESPERA CORRELACIONAR
RECEPCIÓN ACEPTADA
+ FACTURA
+ OBLIGACIÓN
+ DIFERENCIAS
```

Este evento no afirma que la obligación ya fue reconocida ni que el proveedor fue pagado.

---

#### 34. Estado final normal

El estado final normal continúa siendo:

```text
VPROC-0022.RECEIPT_RECONCILED
```

Etiqueta:

```text
Recepción conciliada
```

Tipo:

```text
RECONCILIADO
```

Criterio mínimo preservado:

> Cantidad, condición, documentos, orden, inventario y efecto económico fueron comparados y las diferencias quedaron resueltas o asignadas.

Verdad final y límite preservados:

> La recepción quedó aceptada y conciliada dentro de su alcance; no equivale al pago del proveedor ni oculta devoluciones o reclamaciones.

---

#### 35. Transición de cierre

Se preserva:

```text
VPROC-0022.TR-009
ECONOMIC_RECONCILIATION_PENDING
→ RECEIPT_RECONCILED
```

con:

```text
NORMAL_TERMINAL
CONTROL_ACEPTACION
G01,G02,G03,G04,G07
CIERRE_ATOMICO
```

El cierre requiere un resultado conocido y reconciliable. Un efecto físico o económico desconocido no puede convertirse en `RECEIPT_RECONCILED` por timeout, retry agotado o ausencia de respuesta.

---

#### 36. Nueve transiciones normales preservadas

| Transición          | Desde                             | Hacia                             | Modalidad         | Clase de autoridad              | Puertas                   | Efecto                |
| ------------------- | --------------------------------- | --------------------------------- | ----------------- | ------------------------------- | ------------------------- | --------------------- |
| `VPROC-0022.TR-001` | `RECEIPT_EXPECTED`                | `ARRIVAL_REGISTERED`              | `NORMAL_FORWARD`  | `PRINCIPAL_O_APOYO_AUTORIZADO`  | `G01,G02,G03,G04`         | `AVANCE_ATOMICO`      |
| `VPROC-0022.TR-002` | `ARRIVAL_REGISTERED`              | `PHYSICAL_CHECK_IN_PROGRESS`      | `NORMAL_FORWARD`  | `PRINCIPAL_O_APOYO_AUTORIZADO`  | `G01,G02,G03,G04`         | `AVANCE_ATOMICO`      |
| `VPROC-0022.TR-003` | `PHYSICAL_CHECK_IN_PROGRESS`      | `DOCUMENT_CHECK_IN_PROGRESS`      | `NORMAL_FORWARD`  | `PRINCIPAL_O_APOYO_AUTORIZADO`  | `G01,G02,G03,G04`         | `AVANCE_ATOMICO`      |
| `VPROC-0022.TR-004` | `DOCUMENT_CHECK_IN_PROGRESS`      | `DIFFERENCE_UNDER_REVIEW`         | `NORMAL_FORWARD`  | `PRINCIPAL_O_APOYO_AUTORIZADO`  | `G01,G02,G03,G04`         | `AVANCE_ATOMICO`      |
| `VPROC-0022.TR-005` | `DOCUMENT_CHECK_IN_PROGRESS`      | `ACCEPTANCE_PENDING`              | `NORMAL_BYPASS`   | `PRINCIPAL_O_APOYO_AUTORIZADO`  | `G01,G02,G03,G04,G09`     | `OMISION_JUSTIFICADA` |
| `VPROC-0022.TR-006` | `DIFFERENCE_UNDER_REVIEW`         | `ACCEPTANCE_PENDING`              | `NORMAL_FORWARD`  | `PRINCIPAL_O_APOYO_AUTORIZADO`  | `G01,G02,G03,G04`         | `AVANCE_ATOMICO`      |
| `VPROC-0022.TR-007` | `ACCEPTANCE_PENDING`              | `PUTAWAY_PENDING`                 | `NORMAL_FORWARD`  | `CONTROL_ACEPTACION`            | `G01,G02,G03,G04,G05,G06` | `AVANCE_ATOMICO`      |
| `VPROC-0022.TR-008` | `PUTAWAY_PENDING`                 | `ECONOMIC_RECONCILIATION_PENDING` | `NORMAL_FORWARD`  | `EMISOR_Y_RECEPTOR_AUTORIZADOS` | `G01,G02,G03,G04,G06`     | `AVANCE_ATOMICO`      |
| `VPROC-0022.TR-009` | `ECONOMIC_RECONCILIATION_PENDING` | `RECEIPT_RECONCILED`              | `NORMAL_TERMINAL` | `CONTROL_ACEPTACION`            | `G01,G02,G03,G04,G07`     | `CIERRE_ATOMICO`      |

No se crean transiciones alternativas.

---

#### 37. Acciones excepcionales preservadas

Se preservan exactamente:

```text
VPROC-0022.EX-001 — QUARANTINE
VPROC-0022.EX-002 — HOLD
VPROC-0022.EX-003 — ESCALATE
VPROC-0022.EX-004 — REJECT
```

Reglas:

- `QUARANTINE` aplica desde llegada hasta aceptación e impide putaway utilizable y efecto económico definitivo mientras se resuelve la condición;
- `HOLD` suspende aceptación durante revisiones física o documental y mantiene mercancía segregada y evidencia abierta;
- `ESCALATE` añade nivel, destinatario, motivo y plazo para una diferencia material, sin conceder aprobación;
- `REJECT` rehúsa la recepción antes de aceptación, conserva fundamento, prueba y custodia de retorno.

---

#### 38. Cuarentena

Una recepción o línea en cuarentena:

- conserva identidad y evidencia;
- no se presenta como aceptada utilizable;
- no habilita stock disponible;
- no habilita efecto económico definitivo;
- no borra la observación física original;
- requiere decisión posterior autorizada para liberación, devolución u otro tratamiento aplicable.

La cuarentena es un control temporal, no una disposición final automática.

---

#### 39. Rechazo y devolución

Un rechazo de recepción:

- ocurre antes de la aceptación aplicable;
- conserva motivo estructurado y evidencia;
- conserva proveedor, entrega, documentos y alcance rechazado;
- debe preservar la custodia o instrucción de retorno aplicable;
- no elimina el hecho de que la entrega llegó;
- no modifica retroactivamente la orden para aparentar que nunca hubo intento de entrega.

Una devolución posterior a una aceptación ya aplicada se trata mediante el contrato de reversión o compensación correspondiente, no reescribiendo el rechazo histórico.

---

#### 40. Acciones CCR preservadas

Se preservan exactamente:

```text
VPROC-0022.CCR-001 — CANCEL
VPROC-0022.CCR-002 — VOID
VPROC-0022.CCR-003 — REVERSE
VPROC-0022.CCR-004 — RESTATE
```

Reglas:

- `CANCEL` detiene trabajo futuro permitido y conserva evidencia y obligaciones residuales;
- `VOID` marca como nulo un instrumento inválido o duplicado y lo enlaza con el registro correcto cuando exista;
- `REVERSE` crea un efecto inverso autorizado y vinculado cuando ya existe un efecto aplicado;
- `RESTATE` rectifica referencias o clasificación sin editar destructivamente el hecho operacional original.

---

#### 41. Corrección de una recepción

Una corrección deberá:

1. referenciar la recepción original;
2. conservar el antes y el después;
3. conservar motivo y autoridad;
4. identificar qué efectos derivados fueron afectados;
5. no eliminar el registro original;
6. no volver a aplicar cantidades, costos o movimientos ya confirmados;
7. coordinar reversión o compensación cuando el efecto original no pueda deshacerse literalmente;
8. mantener correlación con NEXO y NUMERA cuando esos dominios ya hayan producido efectos.

La corrección no puede producir una ventana en la que la recepción original quede revertida definitivamente sin existir el reemplazo o plan de tratamiento autorizado que preserve consistencia.

---

#### 42. Idempotencia de la recepción

La recepción adopta el contrato transversal de idempotencia.

Resultados lógicos preservados:

```text
APPLIED
DUPLICATE_RESULT_RETURNED
CONFLICTING_REUSE
IN_PROGRESS_RECOVERABLE
STALE_VERSION
OUT_OF_ORDER_DEFERRED
RECONCILIATION_REQUIRED
REJECTED
```

Reglas:

1. misma identidad y misma huella lógica no producen una segunda recepción;
2. un replay devuelve el resultado durable previo;
3. misma identidad con contenido incompatible produce conflicto;
4. una clave conocida no concede autorización;
5. el retry revalida actor, recurso, estado, alcance y versión;
6. un timeout con resultado desconocido se reconcilia antes de repetir un efecto no seguro;
7. el identificador permanece estable durante retries técnicos de la misma intención;
8. una nueva entrega parcial legítima utiliza una identidad de operación distinta y correlacionada.

---

#### 43. Control específico de recepción duplicada

`INT-PROC-002` exige que la recepción tenga identidad y resultado idempotentes, pero no agota el control transversal de duplicidad del mini-bloque.

La definición completa que impide que una misma recepción o replay vuelva a producir cantidades, costos, movimientos, estado de orden o evento económico queda reservada a:

```text
INT-PROC-005 — Definir control que evite una recepción duplicada
```

`INT-PROC-005` deberá consumir este contrato sin redefinir la propiedad o el ciclo de `VPROC-0022`.

---

#### 44. Concurrencia

Dos pestañas, dispositivos, receptores o retries concurrentes no podrán confirmar dos veces la misma intención ni aplicar una recepción contra una versión obsoleta.

La frontera autoritativa debe proteger, cuando corresponda:

- versión del recurso;
- claim o exclusión mutua;
- cantidad acumulada contra la orden;
- estado de la recepción;
- efectos ya confirmados;
- resultado durable previo.

Una carrera no se resuelve tomando el último write como verdad silenciosa.

---

#### 45. Una operación empresarial, múltiples efectos propietarios

Se preserva el requisito de que la recepción sea una sola operación empresarial correlacionada.

Eso significa:

```text
UNA IDENTIDAD Y CORRELACIÓN DE RECEPCIÓN
        ↓
ORIGO CONFIRMA SU PROPIO EFECTO
        ↓
NEXO CONFIRMA SU PROPIO EFECTO FÍSICO, SI APLICA
        ↓
NUMERA CONFIRMA SU PROPIO EFECTO ECONÓMICO, SI APLICA
        ↓
ORIGO RECONCILIA EL RESULTADO GLOBAL
```

No significa:

```text
ORIGO ESCRIBE DIRECTAMENTE
EN TODAS LAS FUENTES DE VERDAD
```

La atomicidad empresarial entre propietarios se obtiene mediante estados durables, idempotencia, handoffs, confirmaciones y reconciliación; no mediante pérdida de fronteras de propiedad.

---

#### 46. Resultados desconocidos y parciales

Cuando una operación distribuida no pueda demostrar el resultado completo:

- no se fabrica éxito;
- no se repite ciegamente un efecto irreversible;
- se conserva qué unidad sí fue confirmada;
- se conserva qué unidad quedó pendiente o incierta;
- se entra en reconciliación o intervención según el contrato transversal aplicable;
- el cierre de `VPROC-0022` permanece bloqueado hasta conocer o resolver los efectos exigidos.

Un HTTP `2xx`, un ACK, una inserción en outbox o una publicación de evento no equivalen por sí solos al efecto empresarial de la consumidora.

---

#### 47. Eventos empresariales preservados

`INT-PROC-002` no crea definiciones normales de evento.

Para `VPROC-0022` se conservan exactamente:

| Definición           | Tipo                                                          | Clase                 | Hecho confirmado                                                                                |
| -------------------- | ------------------------------------------------------------- | --------------------- | ----------------------------------------------------------------------------------------------- |
| `VPROC-0022.EVT-001` | `vento.process.vproc-0022.receipt-expected.v1`                | `PROCESS_STARTED`     | la recepción está esperada; la mercancía no está aceptada, ubicada, contabilizada ni conciliada |
| `VPROC-0022.EVT-002` | `vento.process.vproc-0022.arrival-registered.v1`              | `READINESS_FACT`      | se identificó llegada, proveedor, documento y momento                                           |
| `VPROC-0022.EVT-003` | `vento.process.vproc-0022.physical-check-in-progress.v1`      | `EXECUTION_FACT`      | comenzó la verificación física                                                                  |
| `VPROC-0022.EVT-004` | `vento.process.vproc-0022.putaway-pending.v1`                 | `HANDOFF_FACT`        | los bienes aceptados esperan ingreso y ubicación en NEXO                                        |
| `VPROC-0022.EVT-005` | `vento.process.vproc-0022.economic-reconciliation-pending.v1` | `RECONCILIATION_FACT` | se espera correlacionar recepción, factura, obligación y diferencias                            |
| `VPROC-0022.EVT-006` | `vento.process.vproc-0022.receipt-reconciled.v1`              | `PROCESS_COMPLETED`   | la recepción quedó aceptada y conciliada dentro de su alcance                                   |

Sensibilidad preservada:

```text
RESTRICTED_FINANCIAL
```

---

#### 48. No se crea un evento normal de aceptación

El catálogo aprobado no contiene una definición normal separada para:

```text
ACCEPTANCE_PENDING
```

ni para una etiqueta genérica de `ACCEPTED`.

Por tanto, esta tarea no inventa un evento adicional como:

```text
purchase-receipt-accepted
receipt-accepted
purchase-accepted
```

La aceptación queda demostrada por la transición `VPROC-0022.TR-007`, el estado resultante `PUTAWAY_PENDING`, la auditoría y la evidencia correlacionada.

---

#### 49. Consumidoras

Se preservan:

```text
DIRECTAS
NEXO
NUMERA

CONDICIONALES
FOGO
PULSO
```

Reglas:

- NEXO consume el alcance aceptado para su efecto físico;
- NUMERA consume la proyección económica necesaria para su proceso;
- FOGO solo recibe proyección cuando una finalidad productiva aprobada lo requiera;
- PULSO solo recibe proyección cuando una finalidad comercial aprobada lo requiera;
- ninguna consumidora puede ampliar la recepción, cambiar su aceptación o reescribir la verdad propietaria de ORIGO.

---

#### 50. Prohibición de escrituras cruzadas

Se preserva el principio:

```text
CONSUMIDORA
→ RECIBE EVENTO O SOLICITA EFECTO
→ PROPIETARIA REVALIDA
→ PROPIETARIA PRODUCE SU EFECTO
→ DEVUELVE RESULTADO CORRELACIONADO
```

No:

```text
ORIGO
→ UPDATE DIRECTO DEL LEDGER NEXO COMO CONTRATO OBJETIVO
```

No:

```text
ORIGO
→ CREA OBLIGACIÓN NUMERA DIRECTAMENTE COMO VERDAD AJENA
```

No:

```text
NEXO / NUMERA
→ CAMBIAN LA ACEPTACIÓN COMERCIAL DE ORIGO
```

---

#### 51. Auditoría obligatoria

Se preserva `VPROC-0022.AUDIT` con foco en:

- documentos;
- cantidades;
- condición;
- diferencias;
- rechazo;
- cuarentena;
- aceptación comercial;
- handoffs físicos;
- handoffs económicos.

La evidencia deberá permitir reconstruir, cuando aplique:

- compra y compromiso de origen;
- proveedor;
- llegada;
- actor y principal;
- sede;
- observaciones físicas;
- documentos;
- cantidades, unidades y conversiones;
- lotes, vencimientos, seriales y temperatura;
- diferencias y su resolución;
- aceptación o rechazo;
- cuarentena o hold;
- handoff hacia NEXO;
- resultado de NEXO;
- handoff hacia NUMERA;
- resultado económico;
- correcciones, reversas o reexpresiones;
- resultado final de reconciliación;
- retries, duplicados, conflictos y resultados desconocidos relevantes.

---

#### 52. Métricas preservadas

Se conservan:

```text
VPROC-0022.MET-001
Recepciones conciliadas sin diferencias pendientes
```

Drivers:

```text
VPROC-0022.MET-002
Tiempo llegada-verificación

VPROC-0022.MET-003
Conformidad al primer control
```

Guardrail:

```text
VPROC-0022.MET-004
Aceptación de no conformidad crítica,
recepción duplicada
o diferencia cerrada sin compensación
```

Cadencia y dimensiones mínimas preservadas:

```text
diaria y semanal; cierre mensual
entidad
sede solicitante
proveedor
categoría
moneda
urgencia
```

---

#### 53. Implementación física observada

La implementación vigente observada en ORIGO presenta una operación de recepción que combina responsabilidades que el contrato objetivo debe separar por propiedad y handoff.

Se observa una modalidad física que distingue una operación con efecto de inventario de una operación solo registral.

La implementación física también utiliza estados de entrada como:

```text
pending_review
received
recorded
```

Estos valores no sustituyen la secuencia `VPROC-0022.*` como contrato objetivo.

---

#### 54. Escrituras físicas observadas

En una recepción con efecto de inventario, la implementación observada puede ejecutar desde la misma acción ORIGO, de forma secuencial, efectos sobre:

- cabecera de entrada;
- líneas de entrada;
- movimientos de inventario;
- stock por sede;
- stock por ubicación;
- costos y eventos de costo;
- cantidades recibidas relacionadas con la orden;
- estado de la orden;
- solicitudes relacionadas con maestro de datos;
- firma o evidencia asociada.

La existencia de esas escrituras demuestra una implementación parcial actual; no demuestra el contrato objetivo distribuido ni una transacción empresarial atómica entre propietarios.

---

#### 55. Estado físico de la orden observado

La implementación observada puede marcar una orden como `received` cuando sus líneas físicas aparecen completamente recibidas.

Ese valor no equivale por sí solo a:

```text
VPROC-0022.RECEIPT_RECONCILED
```

porque el cierre canónico también exige condición, documentos, inventario, efecto económico y diferencias resueltas o asignadas.

Una recepción parcial tampoco puede cerrar toda la orden por inferencia.

---

#### 56. Riesgo de secuencia parcial observada

La implementación observada realiza múltiples escrituras con comprobaciones y salidas intermedias.

Por tanto, sin un mecanismo transaccional o de coordinación durable que lo demuestre, no puede suponerse que:

- todas las escrituras confirman juntas;
- un fallo intermedio deja cero efectos;
- un retry no duplica un efecto ya aplicado;
- una corrección reconstituye todos los derivados;
- NEXO y NUMERA hayan confirmado sus verdades propietarias.

La materialización física deberá converger posteriormente al contrato ya protegido por requisitos existentes y por las tareas propietarias del mini-bloque.

---

#### 57. Reconciliación de la brecha física

La diferencia entre implementación observada y contrato objetivo queda explícita:

| Aspecto             | Implementación observada                                           | Contrato objetivo                                                       |
| ------------------- | ------------------------------------------------------------------ | ----------------------------------------------------------------------- |
| estado de recepción | `pending_review`, `received`, `recorded`                           | estados `VPROC-0022.*`                                                  |
| aceptación          | no queda representada por toda la secuencia canónica               | `TR-007` con `CONTROL_ACEPTACION`                                       |
| inventario          | ORIGO puede escribir movimientos y stock en la misma acción        | handoff aceptado hacia NEXO; efecto propietario de NEXO                 |
| economía/costo      | la misma acción puede producir efectos de costo                    | handoff y reconciliación económica con NUMERA según `INT-PROC-004`      |
| atomicidad          | múltiples escrituras secuenciales observadas                       | efecto atómico por frontera o estado durable y reconciliable            |
| idempotencia        | no queda demostrada integralmente para toda la operación observada | identidad estable, huella, resultado recuperable y deduplicación        |
| parcialidad         | cantidades físicas pueden acumularse                               | cada recepción conserva alcance y no cierra por inferencia lo pendiente |
| cierre              | PO puede quedar `received`                                         | `RECEIPT_RECONCILED` exige conciliación completa del alcance            |

No se crea una brecha nueva porque el desajuste ya está registrado y tiene propietarios canónicos.

---

#### 58. Propietarios documentales de la brecha

Se preservan los destinos ya existentes:

- `INT-PROC-003`, para el contrato mediante el cual NEXO crea o determina que no corresponde crear la entrada física;
- `INT-PROC-004`, para el contrato mediante el cual NUMERA recibe el evento económico;
- `INT-PROC-005`, para el control end-to-end que impide una recepción duplicada;
- `ORIGO-UX-009`, `ORIGO-UX-010`, `ORIGO-UX-014` y `ORIGO-UX-016`, según las responsabilidades ya asignadas a la materialización de recepción;
- `SUPA-AUD-019` y `SUPA-AUD-023`, según la asignación vigente del requisito de atomicidad y reconciliación;
- los paquetes E5 y las tareas físicas posteriores que materialicen los contratos aprobados.

No se crean destinos narrativos sin identificador ni se reasignan responsabilidades ya aprobadas.

---

#### 59. Cambios físicos no autorizados

`INT-PROC-002` no autoriza:

- modificar ORIGO;
- modificar NEXO, NUMERA, FOGO o PULSO;
- modificar tablas de recepción, inventario, órdenes o costos;
- crear estados físicos nuevos;
- crear enums;
- crear RPC;
- crear triggers;
- modificar RLS o grants;
- crear índices o constraints;
- crear outbox, inbox, colas o workers;
- crear eventos físicos;
- ejecutar migraciones;
- alterar datos;
- regularizar recepciones históricas;
- simular recepciones productivas;
- ejecutar entradas de inventario;
- crear obligaciones económicas;
- ajustar stock o costos.

Toda futura modificación de Supabase que materialice este contrato deberá crearse, versionarse, documentarse y ejecutarse desde `vento-shell` conforme al gobierno vigente.

---

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea materializa documentalmente para `VPROC-0022` comportamientos ya protegidos de forma específica por el registro vigente: modalidad de recepción, integridad de la operación, atomicidad o estado reconciliable, idempotencia, no duplicación, separación de propiedad, autorización, handoff, auditoría y unicidad de fuente. No introduce un comportamiento ejecutable nuevo ni modifica el significado de una regla de prueba existente; crear requisitos adicionales repetiría cobertura ya registrada.

---

#### 61. Cobertura de prueba existente preservada

La tarea conserva sin modificar la cobertura ya registrada para:

- `TREQ-ORIGO-001`, sobre modalidad visible y auditable de recepción y prevención de duplicación al convertir, corregir o repetir;
- `TREQ-ORIGO-003`, sobre la recepción como una operación empresarial única, efectos atómicos o durables y reconciliables, clave idempotente, replay seguro y corrección vinculada;
- `TREQ-ORIGO-004`, sobre separación del ciclo de abastecimiento y capacidades entre aprobación y recepción;
- `TREQ-AUTH-010`, sobre segregación de funciones;
- `TREQ-AUTH-013`, sobre autorización server-side de toda mutación;
- `TREQ-AUTH-015`, sobre evidencia correlacionable de decisiones y acciones protegidas;
- `TREQ-INTEGRATION-003`, sobre idempotencia, retries, concurrencia, resultado desconocido y reconciliación;
- `TREQ-INTEGRATION-005`, sobre preservación de contexto y revalidación en handoffs entre aplicaciones;
- `TREQ-INTEGRATION-006`, sobre una única fuente de verdad por dato empresarial y prohibición de fuentes competidoras.

Ninguna de esas filas se crea, modifica, difiere, descarta u obsolete en esta tarea.

---

#### 62. Criterios de aceptación

- [ ] ORIGO queda identificada como propietaria de `VPROC-0022`.
- [ ] El propósito empresarial se conserva sin reinterpretación.
- [ ] Se preserva la frontera: ORIGO acepta o rechaza; NEXO registra entrada, ubicación y custodia después de aceptación.
- [ ] Se preservan NEXO y NUMERA como consumidoras directas y FOGO/PULSO como condicionales.
- [ ] El estado inicial es exactamente `VPROC-0022.RECEIPT_EXPECTED`.
- [ ] El final normal es exactamente `VPROC-0022.RECEIPT_RECONCILED`.
- [ ] Se preservan exactamente nueve transiciones normales.
- [ ] Se preserva `TR-005` como bypass únicamente cuando no existen diferencias.
- [ ] La aceptación se vincula exactamente a `VPROC-0022.TR-007`.
- [ ] `TR-007` conserva `CONTROL_ACEPTACION` y `G01,G02,G03,G04,G05,G06`.
- [ ] Se preservan exactamente los siete grupos de entrada obligatorios.
- [ ] Se preservan exactamente los seis grupos condicionales.
- [ ] Se distinguen observación física y verificación documental.
- [ ] Las diferencias conservan evidencia y resolución sin sobrescribir el hecho original.
- [ ] Se admite decisión total, parcial o condicional sin inventar tolerancias.
- [ ] Una recepción parcial no cierra por inferencia cantidades no recibidas.
- [ ] Lotes, vencimientos, seriales y temperatura se conservan cuando aplican.
- [ ] La factura no se presenta como obligación definitiva.
- [ ] La aceptación no se presenta como inventario aplicado.
- [ ] `PUTAWAY_PENDING` se usa como handoff hacia NEXO, no como stock disponible.
- [ ] El contrato específico de entrada NEXO permanece reservado a `INT-PROC-003`.
- [ ] El contrato económico permanece reservado a `INT-PROC-004`.
- [ ] El control end-to-end contra recepción duplicada permanece reservado a `INT-PROC-005`.
- [ ] Se preserva la modalidad de recepción con o sin efecto de inventario sin inventar movimiento físico.
- [ ] Se preservan `QUARANTINE`, `HOLD`, `ESCALATE` y `REJECT`.
- [ ] Se preservan `CANCEL`, `VOID`, `REVERSE` y `RESTATE`.
- [ ] Se adopta idempotencia, concurrencia y reconciliación transversal.
- [ ] Un resultado desconocido no se presenta como recepción cerrada.
- [ ] Se preservan exactamente seis definiciones normales de evento.
- [ ] No se crea un evento normal adicional para la aceptación.
- [ ] Se preserva `VPROC-0022.AUDIT`.
- [ ] Se preservan `VPROC-0022.MET-001` a `VPROC-0022.MET-004`.
- [ ] Se documenta la brecha física actual sin convertirla en contrato canónico.
- [ ] Cada brecha observada conserva un destino documental existente.
- [ ] No se modifica código, Supabase, migraciones, datos ni operación.
- [ ] No se crean ni modifican requisitos `TREQ-*`.

---

#### 63. Estado de cierre documental

`INT-PROC-002` queda documentalmente completa cuando las reglas anteriores se adopten como definición vigente del contrato de recepción de compra en ORIGO.

Su aprobación documental no significa que la implementación actual ya cumpla físicamente el contrato, ni que NEXO o NUMERA hayan materializado sus handoffs posteriores.

La implementación deberá demostrar en sus tareas y paquetes propietarios que la recepción, aceptación, idempotencia, handoffs, efectos derivados y reconciliación convergen sin duplicación, pérdida de propiedad ni estados desconocidos ocultos.

---

#### 64. Continuidad

```text
ÚLTIMA TAREA APROBADA
INT-PROC-001 — Definir contrato para que ORIGO apruebe la orden de compra
        ↓
TAREA ACTUAL APROBADA
INT-PROC-002 — Definir contrato para que ORIGO registre la recepción
        ↓
SIGUIENTE TAREA RESERVADA
INT-PROC-003 — Definir contrato para que NEXO cree la entrada de inventario
```


### [ ] INT-PROC-003 — Definir contrato para que NEXO cree la entrada de inventario
### [ ] INT-PROC-004 — Definir contrato para que NUMERA reciba el evento económico
### [ ] INT-PROC-005 — Definir control que evite una recepción duplicada

FOGO ↔ NEXO
