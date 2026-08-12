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


### [ ] INT-PROC-002 — Definir contrato para que ORIGO registre la recepción
### [ ] INT-PROC-003 — Definir contrato para que NEXO cree la entrada de inventario
### [ ] INT-PROC-004 — Definir contrato para que NUMERA reciba el evento económico
### [ ] INT-PROC-005 — Definir control que evite una recepción duplicada

FOGO ↔ NEXO
