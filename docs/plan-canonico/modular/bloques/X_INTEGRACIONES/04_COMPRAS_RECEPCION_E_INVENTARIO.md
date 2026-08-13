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


### ✅ INT-PROC-003 — Definir contrato para que NEXO cree la entrada de inventario

**Estado:** APROBADA  
**Tarea anterior:** `INT-PROC-002 — Definir contrato para que ORIGO registre la recepción` — APROBADA  
**Tarea siguiente:** `INT-PROC-004 — Definir contrato para que NUMERA reciba el evento económico` — RESERVADA  
**Tipo de tarea:** documental; definición del contrato mediante el cual NEXO recibe un handoff autorizado de una recepción aceptada, crea y gobierna el efecto físico de ingreso, ubicación y custodia mediante `VPROC-0024`, preserva unidades, cantidades, presentación, lote, LPN, condición, ubicación, idempotencia, concurrencia, ledger, proyecciones y reconciliación, y mantiene separadas la aceptación comercial de ORIGO y la obligación económica de NUMERA, sin modificar código, tablas, RLS, RPC, funciones, migraciones, datos, Supabase ni configuración  
**Bloque:** X — Integraciones  
**Mini-bloque:** Compras, recepción e inventario  
**Fase:** exclusivamente documental  
**Aplicación propietaria del efecto físico:** NEXO  
**Proceso propietario:** `VPROC-0024 — Registrar ingreso, ubicación y reubicación mediante movimientos correlacionados`  
**Proceso precedente de compra:** `VPROC-0022 — Recibir compras, verificar conformidad y resolver diferencias sin separar recepción física, documental y económica`  
**Implementación física autorizada:** ninguna

---

#### 1. Objetivo

Definir de forma inequívoca el contrato mediante el cual NEXO recibe una recepción de compra ya aceptada por ORIGO y materializa, cuando corresponde, el ingreso físico de inventario sin apropiarse de la aceptación comercial, sin crear una obligación económica, sin duplicar cantidades y sin permitir que una interfaz o una aplicación consumidora escriban directamente la verdad física del inventario.

La regla cardinal queda:

```text
ORIGO
RECEPCIÓN VERIFICADA Y ACEPTADA
        ↓
VPROC-0022.PUTAWAY_PENDING
        ↓
HANDOFF EMPRESARIAL AUTORIZADO
        ↓
NEXO
VPROC-0024.INBOUND_MOVEMENT_REQUESTED
        ↓
VALIDACIÓN
        ↓
EJECUCIÓN FÍSICA
        ↓
CONFIRMACIÓN DE DESTINO
        ↓
UBICACIÓN
        ↓
POSTING DEL MOVIMIENTO CANÓNICO
        ↓
VPROC-0024.INBOUND_MOVEMENT_RECONCILED
```

No:

```text
ORIGO ACEPTA
→ UPDATE DE STOCK POR ORIGO
```

No:

```text
FORMULARIO DECLARA source_app = origo
→ NEXO ASUME QUE ORIGO AUTORIZÓ EL INGRESO
```

No:

```text
RECEPCIÓN REGISTRADA
→ STOCK DISPONIBLE POR INFERENCIA
```

No:

```text
MOVIMIENTO CREADO
→ OBLIGACIÓN ECONÓMICA DEFINITIVA
```

No:

```text
REINTENTO
→ SEGUNDA ENTRADA
```

---

#### 2. Resultado sustantivo

`INT-PROC-003` deja definido un único contrato documental de entrada física de inventario derivada de recepción con los siguientes resultados materiales:

1. NEXO queda confirmada como única aplicación propietaria del efecto físico de ingreso, ubicación, custodia, ledger y proyecciones de existencia gobernadas por `VPROC-0024`.
2. ORIGO conserva la propiedad de `VPROC-0022` y de la decisión comercial y documental de aceptar, aceptar con tratamiento permitido o rechazar una recepción.
3. El handoff ordinario desde ORIGO hacia NEXO se vincula al hecho durable `VPROC-0022.PUTAWAY_PENDING` y a la definición normal `VPROC-0022.EVT-004` ya aprobada.
4. NEXO no acepta como autoridad una cadena enviada por cliente, una bandera visual, un estado legacy, un nombre de aplicación, una URL, un formulario ni una copia mutable de datos protegidos.
5. La entrada de compra en NEXO se gobierna mediante `VPROC-0024`, conservando exactamente su estado inicial, seis estados intermedios, estado final, siete transiciones, cuatro excepciones, cuatro acciones CCR y seis definiciones normales de evento.
6. Se preservan como entradas obligatorias de `VPROC-0024` `movement_intent`, `item_ref`, `quantity`, `unit_ref`, `source_ref`, `destination_location_ref` y `occurred_or_expected_at`.
7. Para una entrada originada en compra, `purchase_receipt_ref` pasa a ser información condicional aplicable y deberá identificar la recepción aceptada que origina el efecto físico.
8. El movimiento deberá preservar cantidad, unidad, presentación, conversión, sede, LOC, posición cuando corresponda, lote o serial, LPN, condición y evidencia según el recurso afectado.
9. El ledger físico y sus proyecciones deberán converger como una unidad lógica: ninguna proyección podrá representar una cantidad que no pueda explicarse por un movimiento correlacionado.
10. Se prohíbe contabilizar simultáneamente la misma cantidad como stock suelto y como contenido de un LPN.
11. Los reintentos, concurrencia, resultados inciertos y replays adoptan el contrato transversal vigente de idempotencia y reconciliación.
12. El proceso finaliza normalmente únicamente en `VPROC-0024.INBOUND_MOVEMENT_RECONCILED`, cuando movimiento, ubicación y proyecciones coinciden o tienen diferencias resueltas.
13. El cierre de `VPROC-0024` no confirma por sí mismo la conformidad comercial de ORIGO ni la obligación económica gobernada por NUMERA.
14. La emisión del evento económico posterior permanece reservada a `INT-PROC-004`.
15. El control end-to-end que impide duplicar una recepción entre ORIGO, NEXO y demás efectos permanece reservado a `INT-PROC-005`.
16. Se reconcilia la implementación física observada de NEXO con el contrato objetivo sin autorizar cambios físicos ni duplicar backlog.
17. No se crean ni modifican requisitos de prueba porque las reglas especializadas quedan cubiertas por requisitos canónicos vigentes.

Balance documental:

| Control                                     |                           Resultado |
| ------------------------------------------- | ----------------------------------: |
| Proceso propietario del efecto físico       |                **1 — `VPROC-0024`** |
| Aplicación propietaria                      |                        **1 — NEXO** |
| Proceso precedente de compra                |                **1 — `VPROC-0022`** |
| Consumidoras directas de `VPROC-0024`       | **4 — ORIGO, FOGO, PULSO y NUMERA** |
| Consumidoras condicionales                  |                               **0** |
| Estado inicial preservado                   |                               **1** |
| Estados intermedios preservados             |                               **6** |
| Estado final normal preservado              |                               **1** |
| Transiciones normales preservadas           |                               **7** |
| Acciones excepcionales preservadas          |                               **4** |
| Acciones CCR preservadas                    |                               **4** |
| Definiciones normales de evento preservadas |                               **6** |
| Nuevas definiciones normales de evento      |                               **0** |
| Cambios físicos                             |                               **0** |
| Requisitos de prueba creados o modificados  |                               **0** |

---

#### 3. Base canónica preservada

Esta tarea consume y conserva sin redefinir las decisiones aprobadas en:

- `VPROC-0022`, para recepción, verificación, diferencias y aceptación comercial de la compra;
- `VPROC-0023`, para identidad y elegibilidad de sedes, LOC, zonas, posiciones y condiciones de almacenamiento;
- `VPROC-0024`, para ingreso, ubicación, reubicación, custodia, ledger y proyecciones físicas;
- `PROC-CAT-004` a `PROC-CAT-008`, para propósito, propiedad, consumidoras e intervención de actores;
- `PROC-CAT-009` a `PROC-CAT-014`, para estados, transiciones, excepciones y acciones de cancelación, anulación, retorno y ajuste;
- `PROC-CAT-015` y `PROC-CAT-016`, para información recibida y producida;
- `PROC-CAT-017`, para definiciones normales de evento;
- `PROC-CAT-018`, para auditoría;
- `PROC-CAT-019`, para métricas;
- `PROC-CAT-020`, para la separación explícita entre recepción ORIGO y movimiento NEXO;
- `INT-APP-001` a `INT-APP-010`, para eventos, consumidoras, idempotencia, reintentos, compensación, auditoría, sincronización, errores parciales y prohibición de escrituras cruzadas sin contrato;
- los contratos vigentes de autorización, segregación, contexto, auditoría y mutación server-side;
- los requisitos vigentes de inventario, recepción, integración, idempotencia, trazabilidad y fuente única.

Nada de esta tarea convierte una decisión documental en implementación física ni altera las responsabilidades ya aprobadas.

---

#### 4. Propiedad empresarial y frontera obligatoria

La propiedad queda:

```text
VPROC-0022
ACEPTACIÓN COMERCIAL Y DOCUMENTAL
ORIGO
        ↓
HANDOFF DE BIENES ACEPTADOS
        ↓
VPROC-0024
INGRESO, UBICACIÓN, CUSTODIA Y LEDGER FÍSICO
NEXO
        ↓
PROYECCIONES AUTORIZADAS
        ↓
ORIGO / FOGO / PULSO / NUMERA
```

Por tanto:

1. ORIGO decide si la recepción comercial puede habilitar el handoff físico.
2. NEXO decide y materializa cómo se registra el efecto físico dentro de su dominio.
3. ORIGO no gobierna el ledger físico de NEXO.
4. NEXO no gobierna la aprobación de la compra ni la aceptación comercial de la recepción.
5. NUMERA no gobierna el movimiento físico.
6. FOGO y PULSO pueden consumir proyecciones de disponibilidad o trazabilidad según finalidad, pero no escriben el ledger de NEXO.
7. Supabase podrá materializar persistencia, funciones y transacciones posteriores, pero no adquiere propiedad empresarial.
8. Un proceso compartido no se representa mediante un estado común escrito por varias aplicaciones.

---

#### 5. Propósito empresarial preservado de `VPROC-0024`

Se preserva literalmente el resultado empresarial aprobado:

> Asegurar que cada ingreso o cambio de ubicación modifique la custodia y disponibilidad de inventario de forma correlacionada y trazable.

La tarea no reduce `VPROC-0024` a incrementar una columna de saldo.

La instancia representa una operación física que debe conservar:

- origen o procedencia;
- recurso;
- cantidad;
- unidad;
- destino;
- custodia;
- evidencia;
- movimiento;
- ubicación;
- reconciliación.

---

#### 6. Separación obligatoria entre `VPROC-0022` y `VPROC-0024`

La recepción de compra y la entrada de inventario son procesos correlacionados, no el mismo estado.

| Concepto                   | Propietaria                  | Verdad protegida                                           |
| -------------------------- | ---------------------------- | ---------------------------------------------------------- |
| recepción física observada | ORIGO dentro de `VPROC-0022` | qué llegó y en qué condición fue observado                 |
| verificación documental    | ORIGO                        | correspondencia con orden y documentos                     |
| aceptación comercial       | ORIGO                        | qué alcance recibido se acepta comercialmente              |
| handoff a inventario       | ORIGO → NEXO                 | qué bienes aceptados quedan habilitados para efecto físico |
| movimiento de ingreso      | NEXO                         | qué cantidad física ingresa o cambia ubicación             |
| ubicación y custodia       | NEXO                         | dónde queda y bajo qué condición física                    |
| ledger y proyección        | NEXO                         | cómo se explica el saldo desde movimientos                 |
| obligación económica       | NUMERA                       | qué hecho económico se reconoce según su contrato          |

Queda prohibido usar un único valor genérico `received` como sustituto de todos estos momentos.

---

#### 7. Handoff ordinario desde ORIGO

El hecho normal de ORIGO que habilita el handoff físico ya existe:

```text
VPROC-0022.EVT-004
vento.process.vproc-0022.putaway-pending.v1
HANDOFF_FACT
VPROC-0022.PUTAWAY_PENDING
```

Su significado preservado es:

```text
LOS BIENES ACEPTADOS
ESPERAN INGRESO Y UBICACIÓN FÍSICA EN NEXO
```

NEXO no podrá interpretar como equivalente a ese hecho:

- una orden aprobada;
- una orden emitida;
- una llegada registrada;
- una verificación física en curso;
- una factura;
- un estado legacy `received`;
- una cadena `source_app` enviada por un formulario;
- un mensaje técnico sin hecho empresarial durable.

---

#### 8. Inicio válido de `VPROC-0024`

El estado inicial continúa siendo exactamente:

```text
VPROC-0024.INBOUND_MOVEMENT_REQUESTED
```

Etiqueta:

```text
Ingreso o reubicación solicitado
```

Patrón:

```text
SOLICITUD_REGISTRADA
```

La condición mínima preservada exige:

- recurso identificable;
- cantidad;
- origen o procedencia;
- destino esperado;
- motivo de movimiento.

Para el caso de compra, además deberá existir una referencia correlacionable al hecho de recepción aceptada que habilita el ingreso.

Al nacer continúa siendo verdadero:

```text
LA EXISTENCIA NO SE CONSIDERA INGRESADA
LA EXISTENCIA NO SE CONSIDERA UBICADA
NO EXISTE POSTING CONFIRMADO
```

---

#### 9. Fuentes válidas de inicio de `VPROC-0024`

Se preservan los iniciadores aprobados:

| Función            | Actor o fuente aprobada      |
| ------------------ | ---------------------------- |
| iniciador primario | `RECEPCION_EN_SEDE`          |
| alterno            | `BODEGA_Y_ABASTECIMIENTO`    |
| alterno            | `EVENTO_CANONICO_DE_PROCESO` |
| alterno            | `LOGISTICA_Y_TRANSPORTE`     |
| tipo               | `MIXTO`                      |

Para el caso especializado de compra de `INT-PROC-003`, el origen empresarial deberá ser una recepción aceptada o el hecho canónico correlacionado que la represente.

Una fuente válida de inicio no concede automáticamente permiso de mutación.

---

#### 10. Actores que continúan `VPROC-0024`

Se preserva la participación funcional aprobada:

| Función                   | Actor o clase aprobada                                         |
| ------------------------- | -------------------------------------------------------------- |
| continuadores principales | `RECEPCION_EN_SEDE`; `BODEGA_Y_ABASTECIMIENTO`                 |
| apoyos                    | `LOGISTICA_Y_TRANSPORTE`; `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD` |
| control o aceptación      | `GERENCIA_O_SUPERVISION_DE_SEDE`                               |
| técnico                   | `AUTOMATIZACION_ASISTIVA`                                      |

Estas clases describen participación funcional.

No sustituyen:

- permiso exacto;
- contexto operativo;
- sede efectiva;
- alcance sobre ubicación;
- estado actual del recurso;
- control server-side.

---

#### 11. Información obligatoria de entrada

Se preservan exactamente los siete grupos obligatorios de `VPROC-0024`:

```text
movement_intent
item_ref
quantity
unit_ref
source_ref
destination_location_ref
occurred_or_expected_at
```

Interpretación para la entrada derivada de compra:

| Campo                      | Regla                                                                                 |
| -------------------------- | ------------------------------------------------------------------------------------- |
| `movement_intent`          | identifica la intención física de ingreso o ubicación; no es una aprobación comercial |
| `item_ref`                 | referencia estable al producto o recurso canónico                                     |
| `quantity`                 | cantidad habilitada para el efecto físico dentro del alcance aceptado                 |
| `unit_ref`                 | unidad canónica aplicable a la cantidad                                               |
| `source_ref`               | referencia al origen empresarial autorizado y correlacionable                         |
| `destination_location_ref` | ubicación NEXO elegible para recibir el recurso                                       |
| `occurred_or_expected_at`  | momento del hecho o momento esperado según la etapa                                   |

Los atributos protegidos deberán resolverse desde sus fuentes propietarias y no aceptarse como autoridad por texto libre de cliente.

---

#### 12. Información condicional

Se preservan exactamente los siete grupos condicionales:

```text
lot_serial_ref
lpn_ref
purchase_receipt_ref
condition
cost_context
evidence_refs
client_event_id
```

Para una compra:

1. `purchase_receipt_ref` identifica el origen en `VPROC-0022` y será aplicable al movimiento derivado de recepción.
2. `lot_serial_ref` será obligatorio cuando el producto o su política exijan trazabilidad.
3. `lpn_ref` será obligatorio cuando la custodia o unidad logística esté gobernada por LPN.
4. `condition` será obligatorio cuando la condición determine elegibilidad, cuarentena, disponibilidad o destino.
5. `cost_context` podrá acompañar el movimiento para trazabilidad y proyección permitida, sin convertir NEXO en propietaria de la obligación económica.
6. `evidence_refs` será obligatorio cuando el tipo de operación, recurso, excepción o control lo exija.
7. `client_event_id` podrá participar en el contrato idempotente cuando la captura o integración lo requiera.

---

#### 13. Sobre transversal obligatorio

La solicitud deberá conservar, cuando aplique, el sobre transversal ya aprobado, incluyendo:

- request o client event estable;
- correlación;
- proceso;
- transición o acción solicitada;
- principal autenticado;
- actor efectivo;
- aplicación o adaptador fuente;
- momento del hecho;
- momento de recepción;
- zona temporal;
- sede y área;
- versión del recurso;
- versión contractual;
- razón estructurada cuando no sea avance ordinario;
- referencias de evidencia.

La ausencia de un campo visible en interfaz no autoriza a omitir su resolución en la frontera autoritativa.

---

#### 14. Fuente y procedencia no confiadas al cliente

El origen empresarial no podrá decidirse mediante un campo editable como:

```text
source_app
source
origin
approved
received
```

cuando dicho campo provenga del cliente.

Reglas:

1. NEXO resuelve la procedencia desde un contrato, evento, recurso o referencia durable.
2. Una cadena que diga `origo` no prueba que ORIGO aceptó la recepción.
3. Un identificador de orden no prueba que exista recepción aceptada.
4. Una factura no prueba aceptación física ni comercial.
5. Un actor con acceso a una pantalla no puede fabricar un origen canónico.
6. La procedencia queda auditada y correlacionada con el recurso fuente.

---

#### 15. Validaciones mínimas específicas

Antes de permitir el efecto físico deberán comprobarse, según correspondan:

1. existencia del recurso y vigencia de su identidad;
2. unidad compatible con el producto y la operación;
3. cantidad positiva y representable;
4. conversión determinista cuando exista presentación o unidad de entrada distinta;
5. origen autorizado y correlacionable;
6. destino existente, activo y elegible;
7. sede compatible con origen, actor y destino;
8. condición compatible con el destino;
9. lote, serial o LPN cuando la política lo exija;
10. autoridad efectiva del actor;
11. contexto operativo vigente cuando la acción lo requiera;
12. versión vigente del recurso o agregado;
13. identidad idempotente estable;
14. ausencia de reutilización conflictiva de esa identidad;
15. ausencia de doble contabilización de la misma cantidad;
16. evidencia exigida por excepción, condición o trazabilidad;
17. compatibilidad entre movimiento solicitado y estado actual de `VPROC-0024`.

Ante ambigüedad material:

```text
NO APLICAR EFECTO
→ CONSERVAR ESTADO
→ REVISAR O RECONCILIAR
```

---

#### 16. Unidad, presentación y conversión

NEXO conserva la verdad sobre cómo una cantidad física se representa en inventario.

Para cada línea deberán permanecer correlacionables, cuando apliquen:

- cantidad en unidad de captura;
- unidad de captura;
- presentación;
- factor de conversión;
- cantidad en unidad de stock;
- unidad de stock;
- precisión aplicable;
- versión de la regla o perfil utilizado.

No se permite:

```text
CANTIDAD DE ENTRADA
→ CONVERSIÓN IMPLÍCITA DIFERENTE POR PANTALLA
```

ni:

```text
PRESENTACIÓN FALTANTE
→ ASUMIR FACTOR 1 SIN CONTRATO
```

La misma operación deberá producir la misma interpretación de unidades para todos los consumidores autorizados.

---

#### 17. Relación con la recepción aceptada

Para una entrada de compra, NEXO deberá poder reconstruir:

```text
RECEPCIÓN ORIGO
        ↓
ALCANCE ACEPTADO
        ↓
LÍNEA O RECURSO ACEPTADO
        ↓
CANTIDAD Y UNIDAD HABILITADAS
        ↓
MOVIMIENTO NEXO
        ↓
UBICACIÓN
        ↓
PROYECCIÓN DE EXISTENCIA
```

La entrada no podrá ampliar silenciosamente:

- producto;
- cantidad;
- unidad;
- lote;
- condición;
- sede;
- alcance aceptado.

Si el movimiento requiere una diferencia material frente al alcance aceptado, deberá tratarse mediante los controles y excepciones correspondientes, no sobrescribiendo la recepción de ORIGO.

---

#### 18. Parcialidad y partición de cantidades

Una recepción comercial puede contener varias líneas, ubicaciones, lotes, presentaciones o unidades logísticas.

El contrato no exige que toda esa materialidad se reduzca a una única fila técnica.

Sí exige:

1. que toda partición conserve el mismo origen empresarial;
2. que cada segmento tenga identidad trazable;
3. que los segmentos no se solapen en cantidad;
4. que la suma de efectos aplicados pueda reconciliarse contra el alcance habilitado;
5. que lo pendiente permanezca explícitamente pendiente;
6. que una partición no se interprete como una nueva recepción independiente;
7. que reintentar un segmento no vuelva a contabilizarlo.

---

#### 19. Sede, LOC y posición

La ubicación física se resuelve desde la estructura gobernada por NEXO.

Reglas:

1. `destination_location_ref` deberá corresponder a una ubicación vigente y elegible.
2. La sede del movimiento deberá ser compatible con la ubicación.
3. Una posición no podrá utilizarse si su LOC, jerarquía o condición la vuelve incompatible.
4. La existencia no se publica en una ubicación inexistente o bloqueada.
5. Cambiar destino antes de cierre requiere el tratamiento autorizado correspondiente.
6. La existencia conserva el historial de ubicaciones; un cambio no borra su procedencia.

---

#### 20. Lote, serial y trazabilidad

Cuando el producto esté sujeto a trazabilidad, el ingreso deberá conservar según aplique:

- lote;
- serial;
- origen;
- fecha relevante;
- vencimiento o vida útil;
- estado de liberación;
- ubicación;
- cantidad;
- condición.

La falta de una referencia obligatoria no podrá degradarse a ingreso sin trazabilidad.

Un lote o serial no se crea por conveniencia visual cuando la identidad canónica provenga de otra fuente aprobada.

---

#### 21. LPN y prohibición de doble contabilización

Cuando una cantidad ingrese asociada a un LPN:

```text
MISMA CANTIDAD FÍSICA
→ UNA SOLA REPRESENTACIÓN CONTABLE DE EXISTENCIA
```

Queda prohibido:

```text
CANTIDAD EN LPN
+
MISMA CANTIDAD COMO STOCK SUELTO
=
DOBLE EXISTENCIA
```

Desempacar, dividir, unir, trasladar o cambiar la composición de un LPN deberá conservar movimientos correlacionados y no fabricar saldo.

---

#### 22. Condición, cuarentena y disponibilidad

La existencia física recibida no equivale automáticamente a existencia utilizable.

Una condición puede exigir:

- cuarentena;
- destino restringido;
- evaluación adicional;
- bloqueo de disponibilidad;
- tratamiento por el proceso de condición correspondiente.

La entrada conserva el hecho físico sin confundirlo con una decisión posterior de liberación o disposición.

La ausencia de lectura, evidencia o condición requerida no produce liberación automática.

---

#### 23. Estados canónicos de `VPROC-0024`

La secuencia completa preservada es:

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

No existen bypass normales aprobados para `VPROC-0024`.

No se sustituyen estos estados por:

```text
pending
partial
received
created
posted
```

como contrato objetivo.

---

#### 24. Significado de `INBOUND_MOVEMENT_REQUESTED`

`VPROC-0024.INBOUND_MOVEMENT_REQUESTED` significa que existe una intención de ingreso o reubicación identificable, con causa, recurso, cantidad y destino esperado.

No significa:

- existencia aumentada;
- movimiento ejecutado;
- ubicación confirmada;
- stock disponible;
- recepción comercial aceptada por inferencia;
- efecto económico.

---

#### 25. Significado de `VALIDATION_IN_PROGRESS`

En `VPROC-0024.VALIDATION_IN_PROGRESS` se verifican, como mínimo:

- origen;
- destino;
- recurso;
- cantidad;
- unidad;
- conversión;
- condición;
- autorización;
- trazabilidad aplicable;
- versión;
- idempotencia.

Validar no aplica el movimiento.

---

#### 26. Significado de `READY_FOR_PHYSICAL_EXECUTION`

`VPROC-0024.READY_FOR_PHYSICAL_EXECUTION` significa que la operación fue validada y puede comenzar físicamente.

No significa que ya exista:

- movimiento confirmado;
- aceptación de destino;
- putaway;
- posting;
- stock conciliado.

---

#### 27. Significado de `IN_EXECUTION`

`VPROC-0024.IN_EXECUTION` representa la ejecución material del ingreso o cambio de ubicación.

Durante esta etapa se captura lo realmente ocurrido sin alterar retrospectivamente la intención original.

La cantidad ejecutada puede diferir de la esperada únicamente mediante una diferencia explícita y trazable; nunca mediante sobrescritura silenciosa.

---

#### 28. Significado de `PENDING_CONFIRMATION`

`VPROC-0024.PENDING_CONFIRMATION` significa que la ejecución física espera aceptación del destino o responsable.

La transición hacia este estado exige participación de emisor y receptor autorizados.

Una captura física unilateral no equivale a aceptación de custodia cuando el contrato exige confirmación.

---

#### 29. Significado de `PUTAWAY_PENDING`

`VPROC-0024.PUTAWAY_PENDING` significa que el recurso recibido espera asignación y confirmación de su ubicación definitiva.

No debe confundirse con `VPROC-0022.PUTAWAY_PENDING`.

La coincidencia de la etiqueta funcional no fusiona los procesos:

```text
VPROC-0022.PUTAWAY_PENDING
= ORIGO HABILITA EL HANDOFF

VPROC-0024.PUTAWAY_PENDING
= NEXO TODAVÍA DEBE COMPLETAR UBICACIÓN FÍSICA
```

---

#### 30. Significado de `POSTING_PENDING`

`VPROC-0024.POSTING_PENDING` significa que el hecho físico validado espera el efecto canónico en ledger y proyecciones.

En este estado:

- la evidencia física ya existe;
- el destino fue tratado conforme al flujo;
- el efecto canónico todavía debe quedar confirmado como unidad lógica;
- un fallo no puede mostrarse como éxito final;
- un retry no puede crear un segundo movimiento.

---

#### 31. Estado final normal

El final normal continúa siendo exactamente:

```text
VPROC-0024.INBOUND_MOVEMENT_RECONCILED
```

Etiqueta:

```text
Ingreso de inventario conciliado
```

Criterio mínimo preservado:

> La recepción física, ubicación, movimiento canónico y proyecciones de existencia coinciden o tienen diferencias resueltas.

Verdad final:

```text
EL INGRESO FUE CONTABILIZADO UNA SOLA VEZ
Y PUEDE RECONSTRUIRSE DESDE EL MOVIMIENTO
```

Límite:

```text
NO CONFIRMA CONFORMIDAD COMERCIAL FUERA DE ORIGO
NO CONFIRMA OBLIGACIÓN ECONÓMICA FUERA DE NUMERA
```

---

#### 32. Transiciones normales preservadas

| Transición          | Desde                          | Hacia                          | Modalidad         | Clase de autoridad              | Puertas               | Efecto           |
| ------------------- | ------------------------------ | ------------------------------ | ----------------- | ------------------------------- | --------------------- | ---------------- |
| `VPROC-0024.TR-001` | `INBOUND_MOVEMENT_REQUESTED`   | `VALIDATION_IN_PROGRESS`       | `NORMAL_FORWARD`  | `PRINCIPAL_O_APOYO_AUTORIZADO`  | `G01,G02,G03,G04`     | `AVANCE_ATOMICO` |
| `VPROC-0024.TR-002` | `VALIDATION_IN_PROGRESS`       | `READY_FOR_PHYSICAL_EXECUTION` | `NORMAL_FORWARD`  | `PRINCIPAL_O_APOYO_AUTORIZADO`  | `G01,G02,G03,G04`     | `AVANCE_ATOMICO` |
| `VPROC-0024.TR-003` | `READY_FOR_PHYSICAL_EXECUTION` | `IN_EXECUTION`                 | `NORMAL_FORWARD`  | `PRINCIPAL_O_APOYO_AUTORIZADO`  | `G01,G02,G03,G04`     | `AVANCE_ATOMICO` |
| `VPROC-0024.TR-004` | `IN_EXECUTION`                 | `PENDING_CONFIRMATION`         | `NORMAL_FORWARD`  | `EMISOR_Y_RECEPTOR_AUTORIZADOS` | `G01,G02,G03,G04,G06` | `AVANCE_ATOMICO` |
| `VPROC-0024.TR-005` | `PENDING_CONFIRMATION`         | `PUTAWAY_PENDING`              | `NORMAL_FORWARD`  | `EMISOR_Y_RECEPTOR_AUTORIZADOS` | `G01,G02,G03,G04,G06` | `AVANCE_ATOMICO` |
| `VPROC-0024.TR-006` | `PUTAWAY_PENDING`              | `POSTING_PENDING`              | `NORMAL_FORWARD`  | `EMISOR_Y_RECEPTOR_AUTORIZADOS` | `G01,G02,G03,G04,G06` | `AVANCE_ATOMICO` |
| `VPROC-0024.TR-007` | `POSTING_PENDING`              | `INBOUND_MOVEMENT_RECONCILED`  | `NORMAL_TERMINAL` | `CONTROL_ACEPTACION`            | `G01,G02,G03,G04,G07` | `CIERRE_ATOMICO` |

La tarea conserva literalmente las identidades y no crea transiciones alternativas.

---

#### 33. Transición final autoritativa

El cierre normal se produce mediante:

```text
VPROC-0024.TR-007
POSTING_PENDING
→ INBOUND_MOVEMENT_RECONCILED
```

Con autoridad:

```text
CONTROL_ACEPTACION
```

Y puertas:

```text
G01,G02,G03,G04,G07
```

El cierre exige que el movimiento y las proyecciones puedan considerarse conciliados dentro del alcance de la instancia.

---

#### 34. Ledger canónico

NEXO deberá conservar una fuente canónica de movimientos capaz de explicar las proyecciones de existencia.

Regla:

```text
MOVIMIENTO CANÓNICO
        ↓
PROYECCIONES DERIVADAS Y RECONCILIABLES
```

No:

```text
PROYECCIÓN EDITADA
SIN MOVIMIENTO CORRELACIONADO
```

El ledger deberá permitir reconstruir, cuando aplique:

- sede;
- LOC;
- posición;
- producto;
- presentación;
- lote;
- LPN;
- estado o condición;
- cantidad;
- unidad;
- origen;
- destino;
- actor;
- instante;
- causa;
- correlación;
- evidencia.

---

#### 35. Atomicidad lógica del posting

El efecto final de una entrada puede requerir varias materializaciones físicas.

El contrato exige que esas materializaciones se comporten como una única unidad lógica:

```text
O
TODOS LOS EFECTOS NECESARIOS QUEDAN CONFIRMADOS

O
LA OPERACIÓN QUEDA EN UN ESTADO DURABLE,
IDENTIFICABLE Y RECONCILIABLE
```

No se permite un cierre aparente cuando, por ejemplo:

- existe cabecera pero faltan líneas;
- existe movimiento pero no proyección esperada;
- una ubicación fue afectada y otra no;
- se actualizó un saldo sin movimiento;
- se aplicó costo o cantidad de orden pero no el ingreso correspondiente;
- el cliente recibió error después de que una parte sí quedó aplicada y procede a crear otra operación.

---

#### 36. Idempotencia

Toda solicitud reintentable de efecto deberá recibir antes del primer intento una identidad estable y una huella lógica suficiente.

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

1. misma identidad y mismo contenido lógico no producen otro movimiento;
2. un replay devuelve el resultado durable original;
3. misma identidad con contenido incompatible produce conflicto;
4. conocer una clave no concede autoridad;
5. cada intento revalida contexto, recurso, estado y autoridad cuando corresponda;
6. una respuesta perdida no autoriza una nueva entrada;
7. un resultado desconocido se reconcilia antes de repetir un efecto no seguro.

---

#### 37. Alcance de la identidad idempotente

La identidad deberá distinguir de forma suficiente la intención física real.

Para una entrada de compra deberán participar, según el contrato materializado, referencias que permitan relacionar:

- recepción fuente;
- proceso o instancia;
- línea o recurso;
- cantidad o alcance lógico;
- destino;
- versión;
- operación solicitada.

La tarea no impone el formato físico final de la clave.

Sí impone que una misma intención no pueda contabilizarse dos veces por cambiar de pantalla, dispositivo, conexión o intento.

---

#### 38. Concurrencia

Dos operadores, pestañas, dispositivos, consumidores o retries concurrentes no podrán aplicar dos veces la misma intención.

La frontera autoritativa deberá disponer del equivalente a:

- claim atómico;
- versión esperada;
- lock;
- constraint;
- inbox;
- ledger con identidad única;
- u otro mecanismo que garantice el mismo resultado contractual.

La elección física del mecanismo queda reservada a las tareas de arquitectura e implementación propietarias.

---

#### 39. Resultado desconocido

Cuando el solicitante no pueda saber si el efecto fue aplicado:

```text
RESULT_UNKNOWN
→ CONSULTAR / RECONCILIAR IDENTIDAD EXISTENTE
→ NO CREAR OTRA INTENCIÓN
```

La interfaz no podrá resolver la incertidumbre generando una nueva clave automáticamente.

El operador deberá recibir un resultado que distinga entre:

- pendiente;
- aplicado;
- duplicado con resultado previo;
- conflicto;
- requiere reconciliación;
- rechazado.

---

#### 40. Reintentos

Los reintentos deberán conservar:

- la misma intención lógica;
- la identidad idempotente;
- la correlación;
- el recurso;
- el alcance;
- la versión aplicable.

No deberán:

- incrementar nuevamente el saldo;
- crear otro movimiento;
- duplicar un LPN;
- reubicar una cantidad ya ubicada;
- volver a sumar cantidad recibida en la orden;
- fabricar éxito tras un conflicto permanente.

---

#### 41. Excepción `HOLD`

Se preserva:

```text
VPROC-0024.EX-001 — Suspender movimiento de entrada
```

Código:

```text
HOLD
```

Momento:

```text
Antes de publicación final
```

Autoridad:

```text
PRINCIPAL_O_CONTROL_AUTORIZADO
```

Tratamiento:

```text
CONDITION_ONLY
```

Efecto:

- conserva custodia;
- conserva cantidades;
- impide contabilización parcial no controlada;
- no borra efectos ya confirmados.

---

#### 42. Excepción `REROUTE`

Se preserva:

```text
VPROC-0024.EX-002 — Desviar a ubicación alternativa
```

Código:

```text
REROUTE
```

Momento:

```text
Antes o durante putaway
```

Autoridad:

```text
PRINCIPAL_Y_CONTROL_AUTORIZADOS
```

Tratamiento:

```text
ROUTE_CHANGE
```

Exige:

- destino válido;
- aceptación;
- trazabilidad;
- conservación de custodia y residuales.

---

#### 43. Excepción `ESCALATE`

Se preserva:

```text
VPROC-0024.EX-003 — Escalar recepción sin correspondencia
```

Código:

```text
ESCALATE
```

Momento:

```text
Durante validación o confirmación
```

Autoridad:

```text
PRINCIPAL_O_CONTROL_AUTORIZADO
```

La escalación activa investigación sin inventar origen, producto, cantidad o autorización.

Escalar no concede permiso para aplicar el movimiento.

---

#### 44. Excepción `QUARANTINE`

Se preserva:

```text
VPROC-0024.EX-004 — Aislar entrada física
```

Código:

```text
QUARANTINE
```

Momento:

```text
Desde ejecución
```

Autoridad:

```text
PRINCIPAL_O_CONTROL_AUTORIZADO
```

Tratamiento:

```text
TEMPORARY_CONTROL
```

La existencia puede conservarse físicamente identificada sin volverse utilizable hasta resolver la condición.

La cuarentena no decide disposición definitiva.

---

#### 45. Acción `CANCEL`

Se preserva:

```text
VPROC-0024.CCR-001
CANCEL
```

Cancela únicamente la ejecución restante.

Debe conservar:

- movimientos ya confirmados;
- evidencia;
- custodia;
- cantidades residuales;
- reconciliación pendiente;
- notificaciones requeridas.

Cancelar no borra el hecho físico ya ocurrido.

---

#### 46. Acción `VOID`

Se preserva:

```text
VPROC-0024.CCR-002
VOID
```

Solo aplica cuando la instrucción:

- es inválida;
- es duplicada;
- no estaba autorizada;
- y no produjo un movimiento válido.

El registro original y la causa de nulidad permanecen consultables.

---

#### 47. Acción `RETURN`

Se preserva:

```text
VPROC-0024.CCR-003
RETURN
```

Cuando un efecto físico confirmado deba restituirse, devolverse o trasladarse, se crea un movimiento inverso o compensatorio vinculado.

El retorno conserva:

- origen;
- destino;
- custodia;
- cantidad;
- unidad;
- condición;
- aceptación;
- evidencia.

No reescribe el movimiento original.

---

#### 48. Acción `ADJUST`

Se preserva:

```text
VPROC-0024.CCR-004
ADJUST
```

Un ajuste requiere una observación o evidencia que demuestre diferencia respecto del registro.

Debe conservar:

- valor original;
- observación;
- diferencia;
- causa;
- autoridad;
- decisión;
- efecto compensatorio o movimiento relacionado.

No existe sobrescritura silenciosa del ledger.

---

#### 49. Eventos empresariales preservados

`INT-PROC-003` no crea definiciones normales de evento.

Para `VPROC-0024` se conservan exactamente:

| Definición           | Tipo                                                       | Clase                 | Hecho                                                                           |
| -------------------- | ---------------------------------------------------------- | --------------------- | ------------------------------------------------------------------------------- |
| `VPROC-0024.EVT-001` | `vento.process.vproc-0024.inbound-movement-requested.v1`   | `PROCESS_STARTED`     | existe una solicitud válida de ingreso o reubicación                            |
| `VPROC-0024.EVT-002` | `vento.process.vproc-0024.validation-in-progress.v1`       | `VALIDATION_FACT`     | se validan origen, destino, recurso, cantidad, unidad, condición y autorización |
| `VPROC-0024.EVT-003` | `vento.process.vproc-0024.ready-for-physical-execution.v1` | `READINESS_FACT`      | la operación está autorizada y puede comenzar físicamente                       |
| `VPROC-0024.EVT-004` | `vento.process.vproc-0024.pending-confirmation.v1`         | `HANDOFF_FACT`        | la ejecución física espera aceptación del destino o responsable                 |
| `VPROC-0024.EVT-005` | `vento.process.vproc-0024.posting-pending.v1`              | `RECONCILIATION_FACT` | el hecho físico validado espera efecto atómico en ledger y proyecciones         |
| `VPROC-0024.EVT-006` | `vento.process.vproc-0024.inbound-movement-reconciled.v1`  | `PROCESS_COMPLETED`   | el ingreso quedó contabilizado una sola vez dentro del alcance de NEXO          |

Sensibilidad preservada:

```text
RESTRICTED_FINANCIAL
```

---

#### 50. Estados sin definición normal de evento propia

El catálogo normal no contiene una definición adicional para cada estado de `VPROC-0024`.

En particular, esta tarea no inventa eventos normales independientes para:

```text
VPROC-0024.IN_EXECUTION
VPROC-0024.PUTAWAY_PENDING
```

La ausencia de una definición normal para esos estados no elimina su existencia como estados canónicos ni autoriza crear nombres nuevos en este contrato.

---

#### 51. Sobre de eventos

Toda materialización posterior de eventos de `VPROC-0024` deberá heredar el sobre transversal aprobado, incluyendo según corresponda:

- identidad de evento;
- definición y versión;
- proceso e instancia;
- productora;
- agregado y versión;
- momento del hecho y registro;
- principal y actor efectivo;
- sede, área y dispositivo;
- estado previo y actual;
- correlación y causalidad;
- request e idempotencia;
- referencia de resultado;
- evidencia;
- auditoría;
- razón;
- sensibilidad;
- alcance;
- retención;
- traza técnica.

Cada consumidora recibe una proyección mínima autorizada.

---

#### 52. Consumidoras de `VPROC-0024`

Se preservan exactamente como consumidoras directas:

```text
ORIGO
FOGO
PULSO
NUMERA
```

No existen consumidoras condicionales aprobadas para `VPROC-0024`.

Modalidad dominante:

```text
SOLICITUD_EFECTO_Y_EVENTO
```

Ninguna consumidora adquiere propiedad sobre el ledger por recibir una proyección.

---

#### 53. Proyección hacia ORIGO

ORIGO podrá recibir la referencia necesaria para saber que el efecto físico derivado de su recepción:

- fue solicitado;
- quedó pendiente;
- se confirmó;
- se reconcilió;
- o requiere intervención.

ORIGO no podrá modificar el movimiento NEXO directamente.

Una diferencia física que afecte la recepción comercial se correlaciona y se resuelve por los contratos propietarios; no se corrige sobrescribiendo saldos desde ORIGO.

---

#### 54. Proyección hacia FOGO y PULSO

FOGO y PULSO podrán consumir únicamente información necesaria para su finalidad, como disponibilidad, trazabilidad o condición aplicable.

No podrán:

- crear movimientos de ingreso por escritura directa;
- modificar cantidad existente;
- cambiar ubicación sin contrato;
- liberar cuarentena;
- sustituir el ledger;
- inferir disponibilidad antes de confirmación canónica.

---

#### 55. Proyección hacia NUMERA

NUMERA puede consumir el hecho físico y el contexto de costo autorizado cuando su proceso financiero lo requiera.

Pero:

```text
VPROC-0024.INBOUND_MOVEMENT_RECONCILED
≠ OBLIGACIÓN ECONÓMICA DEFINITIVA
```

La definición contractual del evento económico posterior permanece en `INT-PROC-004`.

NEXO no decide:

- cuenta por pagar;
- reconocimiento contable definitivo;
- impuesto definitivo;
- pago;
- conciliación bancaria.

---

#### 56. Costo dentro del movimiento físico

`cost_context` se preserva como información condicional de `VPROC-0024`.

NEXO puede necesitar contexto de costo para:

- valoración operativa;
- trazabilidad;
- proyección autorizada;
- conciliación con fuentes financieras.

Eso no convierte a NEXO en propietaria del hecho económico.

Cuando exista diferencia entre costo físico utilizado por una proyección y el hecho financiero propietario, la divergencia deberá quedar identificada y conciliada; no se sobrescribirá una fuente para hacerla coincidir silenciosamente con la otra.

---

#### 57. Autorización server-side

Toda mutación que materialice `VPROC-0024` deberá comprobar en servidor, como mínimo:

- permiso exacto;
- principal autenticado;
- actor efectivo;
- sede;
- área cuando corresponda;
- ubicación;
- contexto operativo requerido;
- recurso;
- estado actual;
- transición solicitada;
- versión;
- campos que pueden mutar.

No se concede autoridad por:

- nombre local de rol;
- presencia de usuario autenticado;
- pertenencia genérica a empleados;
- acceso a la página;
- campo oculto;
- parámetro de formulario;
- llamada directa a una API o RPC.

---

#### 58. Segregación y custodia

Se preserva la segregación vigente:

- compras puede crear o preparar según alcance sin convertirse en receptor general;
- recepción puede recibir sin aprobar la compra;
- quien produce no adquiere por ello capacidad de ajustar inventario global;
- quien registra una entrada no adquiere por ello capacidad contable;
- una concesión individual no neutraliza una denegación transversal.

Cuando una misma persona pueda ejercer más de una capacidad por contrato explícito, deberá quedar demostrada la autoridad efectiva y la evidencia de esa combinación.

---

#### 59. Auditoría obligatoria

Se preserva `VPROC-0024.AUDIT`.

Foco obligatorio:

- recepción física relevante;
- movimiento;
- origen;
- destino;
- lote o LPN;
- cantidades;
- unidad;
- actor;
- escaneo o evidencia;
- aceptación;
- conciliación.

La evidencia mínima deberá permitir correlacionar:

- movimiento u observación original;
- origen y destino;
- cantidades;
- unidad;
- lote o LPN;
- resultado de conciliación.

También deberán quedar reconstruibles denegaciones, retries, conflictos, excepciones y acciones CCR relevantes.

---

#### 60. Lecturas y extracciones sensibles

Las mutaciones, ajustes, disposición, exportaciones y consultas privilegiadas de costo o trazabilidad pertenecen al perfil de auditoría del dominio físico.

La clasificación de los eventos de `VPROC-0024` permanece:

```text
RESTRICTED_FINANCIAL
```

Cada consumidora deberá recibir únicamente la proyección necesaria para su finalidad y autorización.

---

#### 61. Métricas preservadas

Se preservan las métricas de `VPROC-0024`:

```text
VPROC-0024.MET-001
Ingresos ubicados y confirmados dentro del ciclo operativo
```

Drivers:

```text
VPROC-0024.MET-002
Tiempo ingreso-ubicación

VPROC-0024.MET-003
Tasa de captura o escaneo correcto al primer intento
```

Guardrail:

```text
VPROC-0024.MET-004
Stock sin ubicación,
movimiento duplicado
o ubicación incompatible con condición
```

Cadencia preservada:

```text
intradiaria y diaria;
revisión semanal
```

Dimensiones mínimas:

- sede;
- LOC;
- producto;
- presentación;
- lote;
- LPN;
- movimiento;
- condición.

---

#### 62. Implementación física observada en NEXO

La implementación vigente observada en NEXO ya contiene una acción de creación de entrada que puede:

- resolver una sede activa;
- recibir proveedor, factura, fecha y notas;
- recibir un valor de aplicación fuente desde formulario;
- recibir modo normal o emergencia;
- resolver productos y perfiles de inventario;
- convertir unidades y presentaciones;
- calcular cantidades en unidad de stock;
- calcular o propagar contexto de costo;
- crear una cabecera de entrada;
- crear líneas de entrada;
- crear movimientos de tipo recepción;
- actualizar proyección de stock por sede;
- actualizar stock por ubicación;
- actualizar stock por presentación cuando corresponda;
- actualizar costos de producto y registrar eventos de costo en ciertos casos;
- incrementar cantidades recibidas en líneas de orden de compra;
- marcar una orden como recibida cuando las cantidades físicas observadas cumplen la condición implementada.

Esta presencia física no equivale al contrato objetivo de `INT-PROC-003`.

---

#### 63. Estados físicos observados

La acción vigente observada deriva estados físicos simplificados a partir de cantidades:

```text
received
partial
pending
```

Esos valores no sustituyen la secuencia canónica de `VPROC-0024`.

En particular:

```text
status = received
```

no demuestra por sí mismo:

- handoff ORIGO válido;
- `VALIDATION_IN_PROGRESS` completado;
- `READY_FOR_PHYSICAL_EXECUTION` alcanzado;
- confirmación de destino;
- putaway;
- posting atómico;
- reconciliación;
- idempotencia end-to-end.

---

#### 64. Procedencia física observada

La implementación observada acepta una aplicación fuente enviada desde el formulario y la normaliza hacia valores conocidos.

Eso puede conservarse como dato informativo durante una transición técnica, pero no puede constituir la prueba autoritativa del origen empresarial.

El contrato objetivo exige:

```text
ORIGEN
= REFERENCIA / EVENTO / CONTRATO DURABLE

NO
= TEXTO DECLARADO POR CLIENTE
```

La procedencia protegida debe resolverse y verificarse en la frontera autoritativa.

---

#### 65. Secuencia física de escrituras observada

La acción actual materializa diversos efectos mediante escrituras sucesivas.

Se observan responsabilidades que alcanzan:

```text
CABECERA
→ LÍNEAS
→ MOVIMIENTOS
→ STOCK POR SEDE
→ STOCK POR UBICACIÓN
→ STOCK POR PRESENTACIÓN CUANDO APLICA
→ COSTO / EVENTO DE COSTO CUANDO APLICA
→ CANTIDAD RECIBIDA DE ORDEN
→ ESTADO DE ORDEN
```

La secuencia demuestra capacidad física existente, pero no demuestra por sí sola atomicidad lógica, idempotencia integral, recuperación ante fallo intermedio ni propiedad correcta de cada dato.

---

#### 66. Frontera física que deberá alcanzarse

El contrato objetivo exige separar responsabilidades aunque la implementación física futura utilice una transacción, RPC, función o composición técnica común.

La semántica deberá ser equivalente a:

```text
ORIGO
CONFIRMA RECEPCIÓN ACEPTADA
        ↓
CONTRATO DE HANDOFF
        ↓
NEXO
VALIDA ORIGEN Y AUTORIDAD
        ↓
NEXO
CREA / RECUPERA INTENCIÓN IDEMPOTENTE
        ↓
NEXO
EJECUTA MOVIMIENTO FÍSICO
        ↓
NEXO
CONFIRMA DESTINO Y UBICACIÓN
        ↓
NEXO
POSTEA LEDGER Y PROYECCIONES
        ↓
NEXO
RECONCILIA RESULTADO
        ↓
PROYECCIONES A CONSUMIDORAS
```

---

#### 67. Escrituras que no definen propiedad

La existencia física de una tabla, RPC o helper compartido no cambia la propietaria empresarial.

Reglas:

1. ORIGO no adquiere propiedad de stock porque hoy pueda escribir una estructura física relacionada.
2. NEXO no adquiere propiedad de la aceptación comercial porque hoy pueda actualizar cantidades recibidas de una orden.
3. NUMERA no adquiere propiedad del movimiento físico porque consuma costo o cantidad.
4. Una estructura temporal compartida deberá evolucionar sin crear dos fuentes de verdad permanentes.

---

#### 68. Cantidades recibidas de la orden

Una cantidad física ingresada en NEXO puede ser evidencia consumida por ORIGO para reconciliar su recepción y orden.

Pero la propiedad semántica deberá permanecer separada:

```text
NEXO
HECHO FÍSICO
        ↓
PROYECCIÓN / EVENTO
        ↓
ORIGO
ACTUALIZA SU PROPIA VERDAD COMERCIAL
```

No:

```text
NEXO
→ ESCRITURA CRUZADA COMO CONTRATO FINAL
→ ESTADO COMERCIAL ORIGO
```

La materialización física transitoria deberá ser reconciliada en las tareas propietarias de arquitectura e implementación ya existentes.

---

#### 69. Costo físico y evento económico

La implementación observada puede actualizar contexto de costo dentro de la misma acción de entrada.

`INT-PROC-003` no autoriza interpretar esa implementación como contrato económico definitivo.

Se conserva:

```text
NEXO
HECHO FÍSICO Y CONTEXTO PERMITIDO
        ↓
INT-PROC-004
CONTRATO HACIA NUMERA
        ↓
NUMERA
HECHO ECONÓMICO PROPIETARIO
```

No se adelanta la definición de `INT-PROC-004`.

---

#### 70. Reconciliación de la brecha física

La diferencia entre implementación observada y contrato objetivo queda:

| Aspecto         | Implementación observada                                        | Contrato objetivo                                                      |
| --------------- | --------------------------------------------------------------- | ---------------------------------------------------------------------- |
| origen          | valor de aplicación fuente puede llegar desde formulario        | origen durable validado contra contrato o hecho canónico               |
| estados         | `pending`, `partial`, `received`                                | estados `VPROC-0024.*`                                                 |
| cabecera        | entrada física directa                                          | instancia correlacionada con causa y proceso                           |
| movimiento      | inserción de movimiento de recepción                            | movimiento canónico idempotente y reconciliable                        |
| saldo por sede  | actualización sucesiva                                          | proyección derivada de movimiento y protegida contra concurrencia      |
| ubicación       | efecto mediante operación física existente                      | destino válido, confirmado y reconciliado                              |
| presentación    | proyección física disponible                                    | una sola cantidad lógica sin doble contabilización                     |
| costo           | puede calcularse dentro de la acción                            | contexto físico separado del hecho económico propietario               |
| orden de compra | NEXO puede incrementar cantidades y marcar estado físico legacy | ORIGO conserva verdad comercial y consume proyección de NEXO           |
| atomicidad      | varias escrituras sucesivas                                     | efecto lógico atómico o estado durable y reconciliable                 |
| idempotencia    | no queda demostrada integralmente por la acción observada       | identidad estable, huella, resultado recuperable y deduplicación       |
| autorización    | autenticación y sede aparecen en la acción                      | permiso exacto, actor, contexto, recurso, estado y versión server-side |

No se crea una brecha nueva porque estos riesgos ya están registrados y poseen responsables documentales existentes.

---

#### 71. Propietarios documentales de la brecha

Se preservan como destinos existentes:

- las tareas de dominio, autorización y experiencia de NEXO ya asignadas al ledger, movimientos, ubicaciones, trazabilidad y operación de entradas;
- las tareas de auditoría y arquitectura Supabase ya asignadas a fuentes competidoras, integridad, ledger, proyecciones, transacciones e idempotencia;
- `INT-PROC-004`, exclusivamente para el contrato del evento económico hacia NUMERA;
- `INT-PROC-005`, exclusivamente para el control end-to-end que impide duplicar una recepción y sus efectos;
- los paquetes E5 correspondientes, para materialización y pruebas integradas;
- las tareas transversales de acciones server-side y autorización para proteger las mutaciones.

No se reasignan responsabilidades ni se crean destinos narrativos sin dueño.

---

#### 72. Cambios físicos no autorizados

`INT-PROC-003` no autoriza:

- modificar NEXO;
- modificar ORIGO, NUMERA, FOGO o PULSO;
- modificar tablas de entrada, movimientos, stock, ubicaciones, productos, costos u órdenes;
- crear o modificar estados físicos;
- crear enums;
- crear RPC;
- crear triggers;
- modificar RLS o grants;
- crear constraints o índices;
- crear outbox, inbox, colas o workers;
- crear eventos físicos;
- ejecutar migraciones;
- alterar datos;
- recalcular inventario histórico;
- reprocesar entradas;
- ajustar existencias;
- crear obligaciones económicas;
- regularizar órdenes productivas;
- ejecutar pruebas destructivas u operativas sobre datos reales.

Toda futura modificación de Supabase que materialice este contrato deberá crearse, versionarse, documentarse y ejecutarse desde `vento-shell` conforme al gobierno vigente.

---

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea especializa documentalmente para la entrada física de compras comportamientos que ya cuentan con protección canónica específica: ledger y proyecciones reconciliables, atomicidad o estado durable, idempotencia, no doble contabilización, unidades y conversiones coherentes, trazabilidad por lote y LPN, segregación, autorización server-side, handoff entre propietarias, fuente única y recepción end-to-end. No introduce comportamiento ejecutable nuevo ni modifica el significado de un requisito existente; crear nuevas filas repetiría cobertura ya registrada.

---

#### 74. Cobertura de prueba existente preservada

La tarea conserva sin modificar la cobertura vigente para:

- `TREQ-NEXO-010`, sobre equivalencia de unidad de stock, unidad de entrada, factor de conversión, modalidad, disponibilidad y política entre consumidores;
- `TREQ-NEXO-011`, sobre fuente canónica de movimientos, proyecciones reconciliables, atomicidad, idempotencia, compensación, no doble contabilización entre stock suelto y LPN, concurrencia y offline;
- `TREQ-NEXO-012`, sobre lote, serial, origen, liberación, vencimiento, ubicación, condición, cuarentena y trazabilidad dentro y fuera de LPN;
- `TREQ-ORIGO-001`, sobre modalidad de recepción y prohibición de duplicar cantidades, costos, orden recibida o evento financiero al convertir, corregir o repetir;
- `TREQ-ORIGO-003`, que vincula expresamente `INT-PROC-003` con atomicidad o reconciliación durable, clave idempotente, replay seguro y corrección vinculada de recepción;
- `TREQ-INTEGRATION-003`, sobre identidad estable, huella, retries, resultado desconocido, deduplicación y recuperación;
- `TREQ-INTEGRATION-005`, sobre contexto y revalidación de autoridad en handoffs entre aplicaciones;
- `TREQ-INTEGRATION-006`, sobre fuente única de cada dato empresarial y eliminación de fuentes competidoras;
- `TREQ-AUTH-010`, sobre segregación de funciones;
- `TREQ-AUTH-013`, sobre protección server-side de mutaciones;
- `TREQ-AUTH-015`, sobre evidencia correlacionable de decisiones y acciones protegidas.

Ninguna de esas filas se crea, modifica, difiere, descarta u obsolete en esta tarea.

---

#### 75. Criterios de aceptación

- [ ] NEXO queda identificada como única propietaria del efecto físico gobernado por `VPROC-0024`.
- [ ] ORIGO conserva la aceptación comercial y documental de `VPROC-0022`.
- [ ] NUMERA conserva el efecto económico posterior.
- [ ] Se preserva `VPROC-0022.EVT-004` como hecho normal de handoff hacia ingreso y ubicación física.
- [ ] Una cadena enviada por cliente no se acepta como prueba de procedencia autoritativa.
- [ ] El estado inicial es exactamente `VPROC-0024.INBOUND_MOVEMENT_REQUESTED`.
- [ ] Se preservan exactamente seis estados intermedios.
- [ ] El estado final es exactamente `VPROC-0024.INBOUND_MOVEMENT_RECONCILED`.
- [ ] Se preservan exactamente siete transiciones normales.
- [ ] No se inventan bypass normales.
- [ ] `TR-007` conserva `CONTROL_ACEPTACION`, `G01,G02,G03,G04,G07` y `CIERRE_ATOMICO`.
- [ ] Se preservan exactamente siete grupos obligatorios de entrada.
- [ ] Se preservan exactamente siete grupos condicionales.
- [ ] `purchase_receipt_ref` queda aplicado a la entrada derivada de recepción de compra.
- [ ] Producto, cantidad y unidad se validan antes del efecto.
- [ ] Presentación y conversión permanecen reproducibles.
- [ ] Sede y ubicación deben ser válidas y compatibles.
- [ ] Lote o serial se conservan cuando la política lo exige.
- [ ] LPN no duplica la misma cantidad como stock suelto.
- [ ] La condición puede bloquear disponibilidad sin borrar el hecho físico.
- [ ] La parcialidad conserva cantidades aplicadas y pendientes sin solapamiento.
- [ ] El ledger explica las proyecciones de existencia.
- [ ] Ninguna proyección se modifica como verdad final sin movimiento correlacionado.
- [ ] El posting se comporta como efecto lógico atómico o queda durable y reconciliable.
- [ ] El replay de la misma intención no crea un segundo movimiento.
- [ ] La reutilización conflictiva de identidad produce conflicto.
- [ ] Un resultado desconocido se reconcilia antes de un nuevo efecto.
- [ ] Se preservan `HOLD`, `REROUTE`, `ESCALATE` y `QUARANTINE`.
- [ ] Se preservan `CANCEL`, `VOID`, `RETURN` y `ADJUST`.
- [ ] Se preservan exactamente seis definiciones normales de evento.
- [ ] No se inventan eventos normales para `IN_EXECUTION` ni `PUTAWAY_PENDING`.
- [ ] Se preserva `VPROC-0024.AUDIT`.
- [ ] Se preservan `VPROC-0024.MET-001` a `VPROC-0024.MET-004`.
- [ ] ORIGO, FOGO, PULSO y NUMERA permanecen consumidoras directas sin adquirir propiedad.
- [ ] La entrada NEXO no se interpreta como obligación económica definitiva.
- [ ] La actualización comercial de ORIGO se plantea mediante proyección o contrato, no como propiedad de NEXO.
- [ ] Se documenta la implementación física observada sin declararla contrato objetivo.
- [ ] La brecha de procedencia desde formulario queda explícita y vinculada a controles existentes.
- [ ] La secuencia de escrituras físicas observada no se presenta como atomicidad demostrada.
- [ ] Cada brecha identificada conserva un destino documental existente.
- [ ] No se desarrolla `INT-PROC-004`.
- [ ] No se desarrolla `INT-PROC-005`.
- [ ] No se modifica código, Supabase, migraciones, datos ni operación.
- [ ] No se crean ni modifican requisitos de prueba.

---

#### 76. Estado de cierre documental

`INT-PROC-003` queda documentalmente completa cuando las reglas anteriores se adopten como definición vigente del contrato mediante el cual NEXO materializa el efecto físico de una recepción de compra aceptada.

Su aprobación documental no significa que:

- la integración ORIGO → NEXO ya esté implementada;
- el ledger actual sea transaccional o idempotente de extremo a extremo;
- las escrituras cruzadas legacy hayan sido retiradas;
- la autorización física vigente ya satisfaga todo el contrato;
- NUMERA ya reciba el evento económico objetivo;
- el control completo de duplicados ya esté materializado.

Esas responsabilidades permanecen en sus tareas propietarias existentes.

---

#### 77. Continuidad

```text
ÚLTIMA TAREA APROBADA
INT-PROC-002 — Definir contrato para que ORIGO registre la recepción
        ↓
TAREA ACTUAL APROBADA
INT-PROC-003 — Definir contrato para que NEXO cree la entrada de inventario
        ↓
SIGUIENTE TAREA RESERVADA
INT-PROC-004 — Definir contrato para que NUMERA reciba el evento económico
```


### ✅ INT-PROC-004 — Definir contrato para que NUMERA reciba el evento económico

**Estado:** APROBADA  
**Tarea anterior:** `INT-PROC-003 — Definir contrato para que NEXO cree la entrada de inventario` — APROBADA  
**Tarea siguiente:** `INT-PROC-005 — Definir control que evite una recepción duplicada` — RESERVADA  
**Tipo de tarea:** documental; definición del contrato de integración mediante el cual NUMERA recibe, valida, clasifica, reconoce y reconcilia el efecto económico derivado de una recepción de compra, preservando fuente operativa, correlación, idempotencia, periodos, reversos, evidencia y segregación frente a ORIGO y NEXO, sin modificar código, tablas, RLS, RPC, funciones, migraciones, datos, Supabase ni configuración  
**Bloque:** X — Integraciones  
**Mini-bloque:** Compras, recepción e inventario  
**Fase:** exclusivamente documental  
**Aplicación propietaria:** NUMERA  
**Proceso propietario:** `VPROC-0051 — Registrar hechos económicos desde eventos operativos y soportes correlacionados`  
**Implementación física autorizada:** ninguna

---

#### 1. Objetivo

Definir de forma inequívoca el contrato mediante el cual NUMERA recibe un hecho económico originado por una recepción de compra, conserva la identidad del hecho operativo que lo causó, valida su elegibilidad financiera y lo conduce por `VPROC-0051` sin duplicarlo, reconstruirlo ni apropiarse del proceso de compra, recepción o inventario.

La regla cardinal queda:

```text
COMPROMISO DE COMPRA
→ RECEPCIÓN COMERCIAL EN ORIGO
→ ACEPTACIÓN Y DIFERENCIAS RESUELTAS SEGÚN ALCANCE
→ EVENTO ECONÓMICO CORRELACIONABLE
→ RECEPCIÓN DEL HECHO EN NUMERA
→ VALIDACIÓN
→ CLASIFICACIÓN
→ RECONOCIMIENTO
→ CONCILIACIÓN
```

Cuando la compra produzca inventario:

```text
ORIGO
HECHO COMERCIAL
        +
NEXO
HECHO FÍSICO CORRELACIONADO
        ↓
NUMERA
HECHO ECONÓMICO
```

No:

```text
RECEPCIÓN CREADA
→ GASTO CREADO MANUALMENTE SIN FUENTE
```

No:

```text
MOVIMIENTO DE INVENTARIO
→ OBLIGACIÓN A PROVEEDOR AUTOMÁTICA
```

No:

```text
FACTURA CAPTURADA
→ PAGO APROBADO
```

No:

```text
REINTENTO DEL MISMO EVENTO
→ SEGUNDO EFECTO ECONÓMICO
```

No:

```text
NUMERA
→ REESCRIBE RECEPCIÓN ORIGO
```

No:

```text
NUMERA
→ REESCRIBE MOVIMIENTO NEXO
```

---

#### 2. Resultado sustantivo

`INT-PROC-004` deja definido un único contrato documental para el handoff económico de recepción de compra con los siguientes resultados materiales:

1. NUMERA queda confirmada como propietaria de `VPROC-0051` y del hecho económico derivado, no del hecho operativo fuente.
2. ORIGO conserva la propiedad de `VPROC-0022` y de la aceptación comercial de la recepción.
3. NEXO conserva la propiedad de `VPROC-0024` y del ingreso, ubicación, custodia, ledger y proyecciones físicas de inventario.
4. `VPROC-0022.EVT-005` se identifica como la señal canónica de esta cadena que declara conciliación económica pendiente después de una recepción aceptada dentro de su alcance.
5. `VPROC-0024.EVT-006` se conserva como evidencia física correlacionable cuando la recepción produce inventario; no sustituye la aceptación comercial ni crea por sí sola una obligación a proveedor.
6. NUMERA inicia o recupera idempotentemente una instancia `VPROC-0051` en `ECONOMIC_EVENT_RECEIVED` sin asumir que el hecho ya está reconocido, contabilizado, distribuido o conciliado.
7. Se preservan exactamente las entradas, estados, transiciones, excepciones, acciones CCR, eventos, auditoría y métricas ya aprobados para `VPROC-0051`.
8. Se separa expresamente `VPROC-0051` del proceso posterior `VPROC-0052` de obligación, aprobación y pago a proveedor.
9. Se impide que una captura manual compita con un evento canónico ya recibido.
10. Se adopta el contrato transversal de identidad, idempotencia, reintento, resultado desconocido, concurrencia, evidencia y reconciliación aprobado para integraciones.
11. Se define el tratamiento de recepciones parciales, eventos tardíos, diferencias, reversos y periodos cerrados sin sobrescritura destructiva.
12. Se reconcilia la implementación física observada de NUMERA con el contrato objetivo y se mantiene la brecha bajo tareas y requisitos ya existentes.
13. No se crean ni modifican requisitos de prueba porque la conducta está protegida por requisitos canónicos vigentes.
14. No se implementa código ni se modifica Supabase.

Balance documental:

| Control                                     |            Resultado |
| ------------------------------------------- | -------------------: |
| Proceso propietario                         | **1 — `VPROC-0051`** |
| Aplicación propietaria                      |       **1 — NUMERA** |
| Proceso operativo fuente principal          | **1 — `VPROC-0022`** |
| Proceso físico correlacionable              | **1 — `VPROC-0024`** |
| Estado inicial preservado                   |                **1** |
| Estados intermedios preservados             |                **7** |
| Estado final normal preservado              |                **1** |
| Transiciones normales preservadas           |                **9** |
| Bypass normal preservado                    |                **1** |
| Acciones excepcionales preservadas          |                **4** |
| Acciones CCR preservadas                    |                **4** |
| Definiciones normales de evento preservadas |                **6** |
| Definiciones nuevas de evento               |                **0** |
| Cambios físicos                             |                **0** |
| Requisitos de prueba creados o modificados  |                **0** |

---

#### 3. Base canónica preservada

Esta tarea consume y conserva sin redefinir las decisiones aprobadas en:

- `VPROC-0021`, para el compromiso de compra formalizado;
- `VPROC-0022`, para recepción, aceptación comercial, diferencias y conciliación de recepción;
- `VPROC-0024`, para ingreso, ubicación, movimiento y conciliación física de inventario;
- `VPROC-0051`, para registro y conciliación de hechos económicos;
- `VPROC-0052`, como proceso posterior e independiente de obligación y pago a proveedor;
- `PROC-CAT-004` a `PROC-CAT-008`, para propósito, propiedad, consumidoras e intervención de actores;
- `PROC-CAT-009` a `PROC-CAT-014`, para estados, transiciones, excepciones y acciones de cancelación, anulación, reversión y corrección;
- `PROC-CAT-015` y `PROC-CAT-016`, para entradas y salidas;
- `PROC-CAT-017`, para definiciones normales de evento;
- `PROC-CAT-018`, para auditoría;
- `PROC-CAT-019`, para métricas;
- `INT-APP-001` a `INT-APP-010`, para catálogo, emisoras, consumidoras, idempotencia, reintentos, compensación, auditoría, sincronización, errores parciales y prohibición de escrituras cruzadas;
- el registro vigente de requisitos de prueba de NUMERA, ORIGO, NEXO, AUTH e INTEGRATION.

Nada de esta tarea convierte una decisión documental en implementación física.

---

#### 4. Propiedad empresarial

La propiedad queda:

```text
VPROC-0021
COMPROMISO DE COMPRA
ORIGO
        ↓
VPROC-0022
RECEPCIÓN Y ACEPTACIÓN COMERCIAL
ORIGO
        ↓
VPROC-0024
INGRESO Y CUSTODIA FÍSICA
NEXO
        ↓
VPROC-0051
HECHO ECONÓMICO
NUMERA
        ↓
VPROC-0052
OBLIGACIÓN Y PAGO A PROVEEDOR
NUMERA
CUANDO CORRESPONDA
```

Reglas:

1. ORIGO decide y conserva el resultado comercial de la recepción.
2. NEXO registra y conserva el resultado físico.
3. NUMERA registra y conserva el resultado económico.
4. NUMERA no modifica el estado canónico de `VPROC-0022`.
5. NUMERA no modifica el estado canónico de `VPROC-0024`.
6. ORIGO no escribe directamente el ledger económico de NUMERA.
7. NEXO no escribe directamente el ledger económico de NUMERA.
8. una tabla compartida o una base técnica común no convierte a las aplicaciones en copropietarias.
9. el origen operativo continúa siendo autoritativo sobre el hecho que produjo.
10. NUMERA es autoritativa sobre su clasificación, reconocimiento, ajuste y conciliación económica.

---

#### 5. Proceso económico propietario

El proceso utilizado por este contrato es exactamente:

```text
VPROC-0051
Registrar hechos económicos desde eventos operativos y soportes correlacionados
```

Su propósito empresarial se conserva:

> Representar hechos económicos a partir de eventos y soportes verificables para evitar registros aislados o sin origen operacional.

Esta tarea no crea un proceso financiero alternativo para compras.

---

#### 6. Diferencia entre hecho operativo y hecho económico

Un mismo acontecimiento empresarial puede generar hechos pertenecientes a dominios distintos sin que compartan identidad ni estado.

| Hecho                | Propietaria | Verdad que demuestra                                                      |
| -------------------- | ----------- | ------------------------------------------------------------------------- |
| compromiso de compra | ORIGO       | existe un compromiso comercial formalizado                                |
| recepción aceptada   | ORIGO       | existe una recepción comercial aceptada dentro de su alcance              |
| ingreso físico       | NEXO        | una cantidad quedó físicamente ingresada, ubicada o reconciliada          |
| hecho económico      | NUMERA      | existe un efecto económico validado y clasificable con fuente verificable |
| obligación por pagar | NUMERA      | existe una obligación exigible o tratable conforme a su proceso           |
| pago                 | NUMERA      | existe una ejecución financiera posterior y conciliable                   |

Ninguno sustituye al otro.

---

#### 7. Evento fuente principal de la recepción

Para la cadena de compra y recepción, la señal principal hacia NUMERA queda:

```text
VPROC-0022.EVT-005
vento.process.vproc-0022.economic-reconciliation-pending.v1
```

Clase:

```text
RECONCILIATION_FACT
```

Estado fuente:

```text
VPROC-0022.ECONOMIC_RECONCILIATION_PENDING
```

Hecho confirmado:

```text
Se espera correlacionar recepción aceptada,
factura, obligación y diferencias.
```

Sensibilidad:

```text
RESTRICTED_FINANCIAL
```

Este evento no demuestra todavía:

- obligación aprobada;
- asiento definitivo;
- pago;
- conciliación bancaria;
- periodo cerrado;
- ausencia de diferencias económicas;
- ingreso físico completamente reconciliado cuando la operación requiera NEXO.

---

#### 8. Evidencia física correlacionable

Cuando la recepción produce inventario, el hecho físico canónico relevante es:

```text
VPROC-0024.EVT-006
vento.process.vproc-0024.inbound-movement-reconciled.v1
```

Hecho confirmado:

```text
El ingreso quedó contabilizado físicamente una sola vez
dentro del proceso propietario de NEXO.
```

Reglas:

1. se usa como referencia o evidencia física cuando la clasificación económica dependa del inventario recibido;
2. no sustituye `VPROC-0022.EVT-005`;
3. no afirma conformidad comercial;
4. no afirma obligación a proveedor;
5. no crea por sí mismo un gasto;
6. no crea por sí mismo un asiento;
7. no crea por sí mismo una cuenta por pagar;
8. una ausencia temporal de este hecho podrá impedir una transición económica que lo requiera, pero no autoriza inventar el resultado físico.

---

#### 9. Recepción final de ORIGO

`VPROC-0022.EVT-006` conserva el cierre normal del proceso de recepción:

```text
vento.process.vproc-0022.receipt-reconciled.v1
```

Ese evento podrá completar evidencia o conciliación de la misma cadena.

No deberá crear automáticamente un segundo hecho económico si corresponde al mismo efecto ya recibido mediante `VPROC-0022.EVT-005`.

La relación deberá resolverse por identidad y correlación, no por comparación de texto, proveedor, fecha o importe únicamente.

---

#### 10. Nacimiento de `VPROC-0051`

El estado inicial permanece exactamente:

```text
VPROC-0051.ECONOMIC_EVENT_RECEIVED
```

Etiqueta:

```text
Hecho económico recibido
```

Patrón:

```text
HECHO_RECIBIDO
```

La condición mínima de nacimiento es:

```text
evento canónico o soporte correlacionable
+ origen identificable
+ entidad
+ fecha
+ dimensión económica mínima
```

Al nacer continúa siendo verdadero:

```text
NO RECONOCIDO
NO CONTABILIZADO DEFINITIVAMENTE
NO DISTRIBUIDO
NO CONCILIADO
NO PAGADO
```

---

#### 11. Regla de creación o recuperación idempotente

NUMERA deberá interpretar la recepción del evento como una solicitud de crear o recuperar la instancia económica correspondiente.

La regla es:

```text
MISMA IDENTIDAD DE EVENTO
+ MISMO CONTENIDO ECONÓMICO LÓGICO
→ MISMA INSTANCIA / MISMO RESULTADO
```

No:

```text
MISMA IDENTIDAD DE EVENTO
→ NUEVA INSTANCIA EN CADA REINTENTO
```

Y:

```text
MISMA IDENTIDAD DE EVENTO
+ CONTENIDO ECONÓMICO INCOMPATIBLE
→ CONFLICTO
```

La interfaz, el adaptador o el emisor no podrá decidir unilateralmente que un replay es una operación nueva.

---

#### 12. Identidad mínima del handoff

La identidad del handoff deberá conservar, como mínimo:

```text
event_id
event_definition_id
event_type
event_version
process_id
process_instance_id
producer_application
aggregate_id
aggregate_version
occurred_at
recorded_at
correlation_id
causation_id
request_id
idempotency_key
schema_version
```

Cuando existan deberán conservarse además:

```text
site_id
area_id
principal_id
effective_actor_id
result_reference
output_references[]
evidence_references[]
audit_reference
reason_code
```

NUMERA no deberá reconstruir esos valores desde etiquetas humanas si el sobre ya contiene identidades canónicas.

---

#### 13. Correspondencia de `source_event_ref`

La entrada obligatoria:

```text
source_event_ref
```

deberá apuntar a una identidad estable del evento fuente.

Para este contrato, la especialización ordinaria es:

```text
VPROC-0022.EVT-005
```

como definición semántica, y una emisión concreta de esa definición como hecho fuente.

La definición del evento y la emisión concreta no son la misma identidad.

---

#### 14. Entradas obligatorias de `VPROC-0051`

Se preservan exactamente seis grupos obligatorios:

```text
source_event_ref
economic_event_type
legal_entity_ref
accounting_date
amounts_and_currency
source_document_ref
```

Ninguno podrá degradarse silenciosamente a opcional.

---

#### 15. `source_event_ref`

Reglas:

1. debe existir;
2. debe corresponder a un evento o soporte autorizado;
3. debe preservar su propietaria;
4. debe ser correlacionable con el recurso económico;
5. no podrá ser un texto libre;
6. no podrá cambiar después para reutilizar una instancia económica con otra causa;
7. una corrección deberá vincular el hecho original y la nueva acción correspondiente.

---

#### 16. `economic_event_type`

La clasificación de tipo económico deberá:

1. pertenecer al contrato financiero vigente de NUMERA;
2. ser compatible con la naturaleza del hecho fuente;
3. no aceptar un valor arbitrario del cliente como autoridad;
4. no convertir una recepción en gasto, activo, inventario, obligación o impuesto por inferencia;
5. permitir diferenciar hechos materialmente distintos aunque compartan proveedor, importe o documento;
6. conservar versión cuando su semántica pueda cambiar.

`INT-PROC-004` no crea un vocabulario paralelo de tipos económicos.

La definición interna detallada para hechos recibidos desde compras y recepción conserva como propietaria documental:

```text
NUMERA-DOM-003
```

---

#### 17. `legal_entity_ref`

La entidad legal deberá resolverse desde estructura canónica vigente.

No podrá inferirse únicamente desde:

- sede;
- proveedor;
- aplicación emisora;
- centro de costo;
- usuario;
- prefijo de documento;
- ubicación de inventario.

Una entidad ambigua impide reconocimiento económico hasta resolución autorizada.

---

#### 18. `accounting_date`

La fecha contable no se asumirá idéntica a:

```text
received_at
occurred_at
invoice_date
purchase_order_date
inventory_posting_date
payment_date
```

Debe conservarse la distinción entre:

- fecha del hecho operativo;
- fecha de recepción del evento;
- fecha económica;
- fecha contable;
- periodo;
- vigencia del documento.

Una diferencia entre fechas deberá ser explicable por política y evidencia, no por conveniencia de reporte.

---

#### 19. `amounts_and_currency`

Los importes deberán ser reproducibles desde la fuente aplicable.

El contrato deberá conservar:

- moneda;
- precisión;
- signo;
- componentes aplicables;
- impuestos cuando correspondan;
- base de cálculo cuando corresponda;
- relación con cantidades y documentos fuente;
- tratamiento de redondeo versionado cuando aplique.

NUMERA no aceptará como verdad definitiva un total enviado por interfaz cuando deba validarlo contra fuentes canónicas.

---

#### 20. `source_document_ref`

El soporte documental deberá:

1. ser identificable;
2. conservar origen;
3. conservar versión o identidad estable cuando aplique;
4. estar correlacionado con el evento;
5. respetar clasificación y acceso financiero;
6. no convertirse en prueba automática de aceptación comercial;
7. no convertirse en prueba automática de ingreso físico;
8. no convertirse en prueba automática de pago.

Una factura, remisión, recepción, nota o soporte puede participar en la conciliación sin apropiarse del estado de los procesos relacionados.

---

#### 21. Entradas condicionales de `VPROC-0051`

Se preservan exactamente seis grupos condicionales:

```text
cost_center_ref
tax_dimensions
counterparty_ref
inventory_or_asset_refs
accrual_rules
reversal_ref
```

Su obligatoriedad depende de la naturaleza del hecho económico y de las reglas vigentes.

---

#### 22. `cost_center_ref`

Cuando el hecho deba atribuirse a un centro de costo:

1. el centro debe existir;
2. debe ser vigente para la fecha aplicable;
3. debe pertenecer al alcance organizacional compatible;
4. no se inferirá por nombre de sede o actor;
5. una distribución posterior no podrá borrar la atribución original.

---

#### 23. `tax_dimensions`

Cuando existan efectos tributarios:

1. las dimensiones deberán proceder de reglas vigentes;
2. no podrán derivarse exclusivamente del texto del documento;
3. la ausencia de información obligatoria bloqueará el reconocimiento que dependa de ella;
4. una corrección tributaria no reescribirá el evento operativo fuente.

Esta tarea no define la contabilidad fiscal oficial.

---

#### 24. `counterparty_ref`

Para compras, la contraparte podrá correlacionarse con el proveedor aplicable, pero NUMERA deberá conservar una referencia canónica y no un nombre libre como identidad primaria.

Un cambio de nombre no crea una contraparte nueva.

Una contraparte no puede inferirse desde una cuenta bancaria.

---

#### 25. `inventory_or_asset_refs`

Cuando la compra genere inventario o activo:

1. deberán conservarse referencias canónicas a los hechos físicos aplicables;
2. el estado económico no podrá fabricar cantidad, lote, ubicación o custodia;
3. el estado físico no podrá fabricar clasificación contable;
4. el ingreso físico podrá aportar base para costo y conciliación sin crear por sí solo obligación;
5. una recepción parcial conservará el alcance físico efectivamente confirmado.

---

#### 26. `accrual_rules`

Cuando el reconocimiento requiera reglas de causación o devengo:

1. la regla deberá ser identificable y versionada;
2. su vigencia deberá corresponder al periodo aplicable;
3. no podrá modificarse retrospectivamente para cambiar un resultado ya reconocido sin una acción correctiva;
4. la existencia de una regla no prueba que el hecho fuente exista.

---

#### 27. `reversal_ref`

Cuando el evento corresponda a reverso o corrección:

1. debe referenciar el hecho económico original;
2. debe conservar la causa;
3. debe preservar el asiento o efecto previo;
4. debe impedir doble reverso del mismo efecto;
5. no podrá apuntar a un hecho inexistente;
6. no deberá utilizarse para borrar una recepción o movimiento físico.

---

#### 28. Fuentes autorizadas o de referencia

`VPROC-0051` conserva las siguientes clases de fuente:

```text
evento canónico propietario
documento
estructura
reglas contables
```

Para la cadena de compra y recepción:

| Fuente              | Responsabilidad                                                                            |
| ------------------- | ------------------------------------------------------------------------------------------ |
| ORIGO               | compra, proveedor, recepción, aceptación comercial, diferencias y documento asociado       |
| NEXO                | ingreso, cantidades físicas, unidad, ubicación, custodia, condición y conciliación física  |
| NUMERA              | clasificación económica, periodo, cuenta, reconocimiento, ajuste y conciliación financiera |
| estructura canónica | entidad legal, sede, centro de costo y relaciones vigentes                                 |
| reglas financieras  | clasificación, periodo, tratamiento y controles aplicables                                 |

---

#### 29. Fuente primaria y fuentes corroborantes

La recepción de un evento económico no debe convertirse en una votación entre aplicaciones.

Regla:

```text
HECHO COMERCIAL
→ ORIGO ES AUTORIDAD

HECHO FÍSICO
→ NEXO ES AUTORIDAD

HECHO ECONÓMICO
→ NUMERA ES AUTORIDAD
```

Las fuentes corroborantes aportan evidencia.

No compiten por la misma verdad.

---

#### 30. Validaciones mínimas específicas

Antes de avanzar desde `ECONOMIC_EVENT_RECEIVED` deberán comprobarse, cuando correspondan:

1. identidad única del evento;
2. emisor autorizado;
3. definición y versión de evento soportadas;
4. proceso fuente esperado;
5. correlación con recepción;
6. entidad legal;
7. fecha y periodo;
8. moneda;
9. importes reproducibles;
10. documento fuente;
11. contraparte;
12. centro de costo;
13. dimensiones tributarias;
14. referencias de inventario o activo;
15. diferencias pendientes;
16. estado de la recepción;
17. existencia de reverso o corrección previa;
18. ausencia de efecto económico duplicado;
19. compatibilidad de versión contractual;
20. evidencia exigida por el tratamiento aplicable.

---

#### 31. Fallo cerrado

Ante datos ambiguos o incompatibles:

```text
NO INFERIR
NO COMPLETAR SILENCIOSAMENTE
NO POSTEAR PARCIALMENTE
```

La instancia deberá conservar su identidad y usar los mecanismos de validación, solicitud de información, aislamiento, suspensión o corrección aprobados.

---

#### 32. Códigos transversales de rechazo

Se conservan los códigos aprobados del contrato de entrada, cuando correspondan:

```text
MISSING_REQUIRED_INPUT
INVALID_REFERENCE
UNAUTHORIZED_SOURCE
STALE_VERSION
DUPLICATE
CONFLICT
OUT_OF_SCOPE
EVIDENCE_REQUIRED
CONTRACT_VERSION_UNSUPPORTED
```

Esta tarea no crea códigos técnicos adicionales.

---

#### 33. Flujo de estados de `VPROC-0051`

La secuencia normal preservada es exactamente:

```text
ECONOMIC_EVENT_RECEIVED
→ VALIDATION_IN_PROGRESS
→ CLASSIFICATION_PENDING
→ CLASSIFIED
→ POSTING_PENDING
→ POSTED
→ ALLOCATION_PENDING
→ RECONCILIATION_PENDING
→ ECONOMIC_EVENT_RECONCILED
```

Existe además un bypass normal:

```text
POSTED
→ RECONCILIATION_PENDING
```

cuando no se requiere distribución adicional.

---

#### 34. Estados preservados

| Orden | Estado                                 | Verdad mínima                                                           |
| ----: | -------------------------------------- | ----------------------------------------------------------------------- |
|     0 | `VPROC-0051.ECONOMIC_EVENT_RECEIVED`   | el hecho llegó; todavía no está reconocido                              |
|     1 | `VPROC-0051.VALIDATION_IN_PROGRESS`    | se verifica origen, soporte, entidad, fecha, valor, moneda y duplicidad |
|     2 | `VPROC-0051.CLASSIFICATION_PENDING`    | espera cuenta, dimensión, centro, tratamiento y reglas                  |
|     3 | `VPROC-0051.CLASSIFIED`                | tiene tratamiento propuesto y referencias, sin registro definitivo      |
|     4 | `VPROC-0051.POSTING_PENDING`           | hecho validado esperando reconocimiento idempotente                     |
|     5 | `VPROC-0051.POSTED`                    | hecho reconocido con vínculo a su origen                                |
|     6 | `VPROC-0051.ALLOCATION_PENDING`        | valor pendiente de distribución autorizada                              |
|     7 | `VPROC-0051.RECONCILIATION_PENDING`    | registro, soporte, contraparte y proceso fuente se comparan             |
|     8 | `VPROC-0051.ECONOMIC_EVENT_RECONCILED` | hecho reconocido una sola vez y conciliado                              |

---

#### 35. Transiciones preservadas

| ID                  | Desde                     | Hacia                       | Modalidad         | Autoridad                       | Gates                 | Efecto                |
| ------------------- | ------------------------- | --------------------------- | ----------------- | ------------------------------- | --------------------- | --------------------- |
| `VPROC-0051.TR-001` | `ECONOMIC_EVENT_RECEIVED` | `VALIDATION_IN_PROGRESS`    | `NORMAL_FORWARD`  | `PRINCIPAL_O_APOYO_AUTORIZADO`  | `G01,G02,G03,G04`     | `AVANCE_ATOMICO`      |
| `VPROC-0051.TR-002` | `VALIDATION_IN_PROGRESS`  | `CLASSIFICATION_PENDING`    | `NORMAL_FORWARD`  | `PRINCIPAL_O_APOYO_AUTORIZADO`  | `G01,G02,G03,G04`     | `AVANCE_ATOMICO`      |
| `VPROC-0051.TR-003` | `CLASSIFICATION_PENDING`  | `CLASSIFIED`                | `NORMAL_FORWARD`  | `PRINCIPAL_O_APOYO_AUTORIZADO`  | `G01,G02,G03,G04`     | `AVANCE_ATOMICO`      |
| `VPROC-0051.TR-004` | `CLASSIFIED`              | `POSTING_PENDING`           | `NORMAL_FORWARD`  | `EMISOR_Y_RECEPTOR_AUTORIZADOS` | `G01,G02,G03,G04,G06` | `AVANCE_ATOMICO`      |
| `VPROC-0051.TR-005` | `POSTING_PENDING`         | `POSTED`                    | `NORMAL_FORWARD`  | `EMISOR_Y_RECEPTOR_AUTORIZADOS` | `G01,G02,G03,G04,G06` | `AVANCE_ATOMICO`      |
| `VPROC-0051.TR-006` | `POSTED`                  | `ALLOCATION_PENDING`        | `NORMAL_FORWARD`  | `PRINCIPAL_O_APOYO_AUTORIZADO`  | `G01,G02,G03,G04`     | `AVANCE_ATOMICO`      |
| `VPROC-0051.TR-007` | `POSTED`                  | `RECONCILIATION_PENDING`    | `NORMAL_BYPASS`   | `PRINCIPAL_O_APOYO_AUTORIZADO`  | `G01,G02,G03,G04,G09` | `OMISION_JUSTIFICADA` |
| `VPROC-0051.TR-008` | `ALLOCATION_PENDING`      | `RECONCILIATION_PENDING`    | `NORMAL_FORWARD`  | `PRINCIPAL_O_APOYO_AUTORIZADO`  | `G01,G02,G03,G04`     | `AVANCE_ATOMICO`      |
| `VPROC-0051.TR-009` | `RECONCILIATION_PENDING`  | `ECONOMIC_EVENT_RECONCILED` | `NORMAL_TERMINAL` | `CONTROL_ACEPTACION`            | `G01,G02,G03,G04,G07` | `CIERRE_ATOMICO`      |

No se añaden transiciones.

---

#### 36. Regla de `TR-001`

`TR-001` inicia validación.

Recibir un mensaje técnicamente válido no basta.

Antes del avance debe existir una instancia identificable y una fuente verificable.

---

#### 37. Regla de `TR-002`

`TR-002` solo ocurre cuando la validación determina que el hecho es elegible para clasificación.

Una diferencia no resuelta de origen, duplicidad, entidad, moneda o soporte impide el avance ordinario.

---

#### 38. Regla de `TR-003`

`TR-003` produce una clasificación propuesta.

No produce todavía un asiento definitivo.

La clasificación deberá conservar la regla y versión aplicadas.

---

#### 39. Regla de `TR-004`

`TR-004` prepara el reconocimiento.

La condición `EMISOR_Y_RECEPTOR_AUTORIZADOS` no permite que el emisor decida la clasificación de NUMERA.

El emisor confirma su hecho.

NUMERA confirma que la entrada puede avanzar.

---

#### 40. Regla de `TR-005`

`TR-005` registra el hecho económico.

El resultado deberá:

- ser idempotente;
- conservar el evento fuente;
- conservar entidad y periodo;
- conservar moneda e importes;
- conservar soporte;
- ser recuperable ante reintento;
- no modificar el hecho operativo original.

---

#### 41. Regla de `TR-006`

`TR-006` aplica únicamente cuando se requiere distribución posterior.

La distribución no podrá:

- borrar la atribución original;
- cambiar el importe total sin una acción autorizada;
- producir saldos sin fuente;
- convertir una simulación en dato real.

---

#### 42. Bypass `TR-007`

`TR-007` permite:

```text
POSTED
→ RECONCILIATION_PENDING
```

cuando el hecho no requiere asignación adicional.

Debe conservar:

```text
G09
OMISION_JUSTIFICADA
```

No significa que la distribución fue ejecutada con valor cero.

Significa que no aplica una etapa adicional para ese hecho.

---

#### 43. Regla de `TR-008`

Cuando sí existe distribución, `TR-008` exige que el resultado pueda reconciliarse con el importe y la fuente.

La suma de distribuciones o asignaciones no podrá cambiar silenciosamente el valor reconocido.

---

#### 44. Regla de `TR-009`

`TR-009` cierra el proceso únicamente cuando:

- fuente;
- soporte;
- clasificación;
- dimensiones;
- efecto reconocido;
- referencias;
- diferencias aplicables

quedan conciliados.

El estado final no significa pago.

---

#### 45. Eventos normales de `VPROC-0051`

Se preservan exactamente seis definiciones:

| ID                   | Tipo                                                    | Clase                 | Estado o hecho              |
| -------------------- | ------------------------------------------------------- | --------------------- | --------------------------- |
| `VPROC-0051.EVT-001` | `vento.process.vproc-0051.economic-event-received.v1`   | `PROCESS_STARTED`     | `ECONOMIC_EVENT_RECEIVED`   |
| `VPROC-0051.EVT-002` | `vento.process.vproc-0051.validation-in-progress.v1`    | `VALIDATION_FACT`     | `VALIDATION_IN_PROGRESS`    |
| `VPROC-0051.EVT-003` | `vento.process.vproc-0051.classified.v1`                | `READINESS_FACT`      | `CLASSIFIED`                |
| `VPROC-0051.EVT-004` | `vento.process.vproc-0051.posting-pending.v1`           | `HANDOFF_FACT`        | `POSTING_PENDING`           |
| `VPROC-0051.EVT-005` | `vento.process.vproc-0051.reconciliation-pending.v1`    | `RECONCILIATION_FACT` | `RECONCILIATION_PENDING`    |
| `VPROC-0051.EVT-006` | `vento.process.vproc-0051.economic-event-reconciled.v1` | `PROCESS_COMPLETED`   | `ECONOMIC_EVENT_RECONCILED` |

Sensibilidad:

```text
RESTRICTED_FINANCIAL
```

para las seis definiciones.

---

#### 46. No se crea un evento nuevo para compra recibida

El catálogo vigente ya contiene:

```text
VPROC-0022.EVT-005
```

como hecho fuente de conciliación económica pendiente.

Y ya contiene:

```text
VPROC-0051.EVT-001
```

como nacimiento del proceso económico.

Por tanto, esta tarea no crea tipos como:

```text
purchase-receipt-economic-event
supplier-invoice-received
purchase-cost-posted
```

ni equivalentes no aprobados.

---

#### 47. Regla de causalidad

La cadena deberá conservar:

```text
evento operativo fuente
→ causation_id
→ instancia económica
→ eventos de VPROC-0051
```

Una instancia económica no deberá existir sin una causa trazable, salvo incorporación manual expresamente autorizada y soportada conforme al contrato vigente.

---

#### 48. Incorporación manual autorizada

`VPROC-0051` admite como iniciador alterno:

```text
RESPONSABLE_FINANCIERO
```

pero la incorporación manual no podrá competir con una fuente canónica existente.

Reglas:

1. si ya existe el evento canónico, se recupera o concilia la instancia correspondiente;
2. no se crea una copia manual para “completar” el mismo hecho;
3. una incorporación manual deberá conservar soporte, actor, motivo, fuente conocida y razón por la cual no existe un evento canónico utilizable;
4. cuando aparezca posteriormente el evento canónico, deberá correlacionarse con el caso existente y no crear un segundo efecto;
5. una captura manual no convierte a NUMERA en propietaria del hecho operativo.

---

#### 49. Recepciones parciales

Una recepción parcial deberá conservar:

- cantidades aceptadas;
- cantidades pendientes;
- diferencias;
- referencias de líneas;
- alcance del evento;
- documento aplicable;
- correlación con futuros complementos.

Regla:

```text
PARCIAL
≠
COMPLETO
```

Y:

```text
NUEVO PARCIAL
≠
REPLAY DEL PARCIAL ANTERIOR
```

La identidad del evento y su alcance deberán permitir distinguir ambos casos.

---

#### 50. Complementos posteriores

Una entrega posterior perteneciente a la misma orden podrá producir un nuevo hecho económico únicamente si representa un efecto económico adicional real y diferenciable.

No deberá reutilizar:

- `event_id`;
- `request_id`;
- `idempotency_key`;
- identidad de recepción;
- identidad de movimiento

como si fuera el mismo hecho.

La correlación de orden o proveedor no convierte eventos distintos en duplicados.

---

#### 51. Reintentos

Todo reintento deberá:

1. conservar la misma identidad estable de operación;
2. conservar la huella lógica;
3. recuperar el resultado previo cuando el contenido sea equivalente;
4. producir conflicto cuando el mismo identificador llegue con contenido incompatible;
5. no duplicar reconocimiento;
6. no duplicar obligación;
7. no duplicar costo;
8. no duplicar impuesto;
9. no duplicar asiento.

---

#### 52. Resultado desconocido

Ante timeout o pérdida de respuesta:

```text
NO ASUMIR FALLO
NO REEMITIR CON IDENTIDAD NUEVA
```

El consumidor deberá poder determinar si:

- no se recibió;
- se recibió sin efecto;
- se procesó;
- se procesó parcialmente;
- se completó;
- quedó en conflicto;
- requiere reconciliación.

Esta tarea no define la tecnología física que materializará ese estado.

---

#### 53. Eventos tardíos

Un evento tardío deberá conservar su `occurred_at` original y su momento de recepción real.

No podrá:

- mover silenciosamente el hecho a otro periodo para mejorar un resultado;
- sobrescribir un periodo cerrado;
- perder la fecha del hecho;
- duplicar un reconocimiento anterior;
- descartarse solo por llegar tarde.

El tratamiento dependerá del estado del periodo y de las acciones aprobadas de suspensión, reversión o reexpresión.

---

#### 54. Eventos fuera de orden

Si NUMERA recibe hechos relacionados fuera del orden esperado:

1. conserva cada identidad;
2. no inventa estados previos;
3. no fuerza cierre;
4. no presenta una proyección como confirmación del hecho faltante;
5. mantiene reconciliación pendiente cuando falte una dependencia material;
6. enlaza hechos posteriores cuando su correlación sea válida.

---

#### 55. Periodos cerrados

Un periodo cerrado no podrá abrirse ni modificarse por el simple arribo de un evento.

Cuando un hecho requiera tratamiento sobre un periodo protegido:

- se conserva la fecha real;
- se conserva el periodo originalmente aplicable;
- se bloquea cualquier mutación no autorizada;
- se utiliza la acción correctiva o de reexpresión aplicable;
- se conserva antes, después, autoridad, regla y evidencia.

---

#### 56. Excepciones preservadas

| ID                  | Acción                                             | Momento                            | Autoridad                        | Tipo                | Regla                                                   |
| ------------------- | -------------------------------------------------- | ---------------------------------- | -------------------------------- | ------------------- | ------------------------------------------------------- |
| `VPROC-0051.EX-001` | Aislar evento económico (`QUARANTINE`)             | durante validación o clasificación | `PRINCIPAL_O_CONTROL_AUTORIZADO` | `TEMPORARY_CONTROL` | impide posting hasta resolver origen o duplicidad       |
| `VPROC-0051.EX-002` | Solicitar soporte o evento fuente (`REQUEST_INFO`) | antes de posting                   | `PRINCIPAL_O_APOYO_AUTORIZADO`   | `CONDITION_ONLY`    | conserva payload y correlación original                 |
| `VPROC-0051.EX-003` | Suspender contabilización (`HOLD`)                 | antes o durante posting            | `PRINCIPAL_O_CONTROL_AUTORIZADO` | `CONDITION_ONLY`    | evita efecto parcial y no borra el evento               |
| `VPROC-0051.EX-004` | Reabrir conciliación económica (`REOPEN`)          | desde final normal                 | `CONTROL_ACEPTACION`             | `LINKED_REVIEW`     | crea revisión vinculada sin reescribir el efecto previo |

---

#### 57. Cuarentena económica

`EX-001` deberá usarse cuando la instancia existe pero todavía no puede confiarse en su elegibilidad.

Ejemplos de causa:

- posible duplicado;
- origen incompatible;
- documento dudoso;
- entidad ambigua;
- importe inconsistente;
- correlación rota.

La cuarentena no declara invalidez definitiva.

---

#### 58. Solicitud de soporte

`EX-002` conserva el hecho recibido y abre la necesidad de información.

No permite:

- editar el payload original;
- reemplazar el evento fuente;
- conceder aprobación;
- avanzar por ausencia de respuesta;
- crear una copia con datos “corregidos” sin vínculo.

---

#### 59. Suspensión del reconocimiento

`EX-003` detiene el avance sin borrar lo ya confirmado.

Cuando exista un efecto previo, la suspensión no constituye reversión.

---

#### 60. Reapertura vinculada

`EX-004` no reescribe un hecho conciliado.

La reapertura crea una revisión vinculada.

El final anterior permanece auditable.

---

#### 61. Acciones CCR preservadas

| ID                   | Acción    | Condición                                                        | Autoridad                          | Resultado                                                  |
| -------------------- | --------- | ---------------------------------------------------------------- | ---------------------------------- | ---------------------------------------------------------- |
| `VPROC-0051.CCR-001` | `CANCEL`  | procesamiento pendiente antes de contabilización o consolidación | `INICIADOR_Y_CONTROL_AUTORIZADOS`  | detiene trabajo futuro y conserva fuente                   |
| `VPROC-0051.CCR-002` | `VOID`    | instancia duplicada o inválida sin efecto válido                 | `CONTROL_ACEPTACION`               | marca nulidad conservando payload y vínculo                |
| `VPROC-0051.CCR-003` | `REVERSE` | hecho ya aplicado que debe revertirse                            | `PROPIETARIO_DEL_EFECTO_Y_CONTROL` | crea efecto inverso o compensatorio vinculado              |
| `VPROC-0051.CCR-004` | `RESTATE` | error de cuenta, periodo, centro, tercero, impuesto o dimensión  | `RESPONSABLE_CONTABLE_Y_CONTROL`   | crea reexpresión versionada sin alterar el hecho operativo |

---

#### 62. Cancelación

`CANCEL` detiene procesamiento futuro.

No elimina:

- evento fuente;
- documento;
- evidencia;
- intentos;
- decisiones;
- efectos ya confirmados.

---

#### 63. Anulación por duplicidad o invalidez

`VOID` aplica únicamente cuando la instancia económica no debe producir un efecto válido.

Debe conservar:

- motivo;
- vínculo con la instancia válida cuando exista;
- payload;
- identidad;
- decisión.

No se borra el registro inválido.

---

#### 64. Reversión

`REVERSE` se usa cuando un efecto ya reconocido debe compensarse.

Regla:

```text
ORIGINAL
PERMANECE
        +
EFECTO INVERSO
VINCULADO
```

No:

```text
DELETE ORIGINAL
```

Si el origen operativo fue corregido o revertido, NUMERA deberá conservar la relación entre ambos hechos.

---

#### 65. Reexpresión

`RESTATE` corrige clasificación o dimensión económica sin inventar un nuevo hecho operativo.

Debe conservar:

- valor previo;
- valor corregido;
- regla;
- versión;
- periodo;
- autoridad;
- impacto en proyecciones y reportes.

---

#### 66. Separación frente a `VPROC-0052`

`VPROC-0052` es:

```text
Gestionar obligación, aprobación y pago a proveedor
con conciliación bancaria
```

Su estado inicial es:

```text
VPROC-0052.PAYABLE_REGISTERED
```

`INT-PROC-004` no autoriza:

- crear una obligación sin condición válida;
- aprobar una obligación;
- programar pago;
- ejecutar pago;
- conciliar banco;
- cerrar una cuenta por pagar.

Un hecho económico recibido puede constituir una entrada o soporte para procesos posteriores cuando cumpla sus condiciones, pero no los cierra por inferencia.

---

#### 67. Separación frente al costo físico de inventario

NEXO puede producir información física de costo o valoración asociada a un ingreso.

NUMERA deberá tratarla como:

```text
FUENTE / REFERENCIA / COMPONENTE DE CONCILIACIÓN
```

cuando corresponda.

No como:

```text
ASIENTO DEFINITIVO ESCRITO POR NEXO
```

La coexistencia de un costo operativo en NEXO y un hecho económico en NUMERA deberá ser correlacionada, no duplicada.

---

#### 68. Separación entre costo, gasto y obligación

Los siguientes conceptos no son equivalentes:

```text
costo de inventario
gasto operativo
hecho económico
obligación a proveedor
pago
```

La clasificación deberá determinar cuál aplica según fuente, naturaleza, periodo y reglas.

Una interfaz no podrá seleccionar una etiqueta y convertirla en autoridad financiera por sí sola.

---

#### 69. Documento sin recepción

Un documento de proveedor recibido sin recepción válida no puede confirmar por sí solo el hecho de recepción.

NUMERA podrá conservar el soporte para revisión conforme a su contrato, pero no deberá inventar:

- aceptación comercial;
- cantidad recibida;
- ingreso físico;
- obligación exigible.

---

#### 70. Recepción sin documento completo

Una recepción válida cuyo soporte económico todavía esté incompleto podrá iniciar una instancia económica únicamente cuando se cumpla la condición mínima aprobada.

Si falta un insumo obligatorio para avanzar:

```text
REQUEST_INFO
HOLD
o estado de validación aplicable
```

según corresponda.

No se rellenan valores por suposición.

---

#### 71. Diferencias de cantidad

Cuando ORIGO o NEXO conserven diferencias de cantidad:

1. NUMERA conserva el alcance real del hecho;
2. no usa cantidad ordenada como cantidad recibida por defecto;
3. no usa cantidad recibida como cantidad aceptada por defecto;
4. no cierra residuales por inferencia;
5. no crea una segunda obligación por un replay;
6. mantiene vínculo con futuras entregas o correcciones.

---

#### 72. Diferencias de importe

Si documento, orden, recepción y valoración no coinciden:

- se preservan los valores fuente;
- se identifica la diferencia;
- se conserva responsable;
- no se altera silenciosamente una fuente para hacerla coincidir;
- el reconocimiento depende de la resolución financiera aplicable.

---

#### 73. Moneda

Una compra y su hecho económico deberán conservar moneda explícita.

No podrá:

- asumirse `COP` solo por configuración de interfaz;
- reinterpretarse un importe sin moneda;
- comparar importes de monedas diferentes sin una regla de conversión aplicable;
- sobrescribir la moneda de la fuente para coincidir con una proyección.

---

#### 74. Impuestos

Los impuestos no deberán derivarse desde una única capa visual.

Cuando apliquen, deberán conservar:

- fuente;
- base;
- regla;
- versión;
- fecha;
- dimensión;
- efecto;
- corrección.

---

#### 75. Correlación entre orden, recepción, ingreso y hecho económico

El contrato deberá permitir reconstruir:

```text
purchase_commitment_ref
→ receipt_ref
→ source_event_ref
→ inventory_movement_ref cuando aplique
→ source_document_ref
→ economic_process_instance_ref
→ economic_effect_ref
```

La nomenclatura física de columnas queda reservada para implementación posterior.

La relación empresarial es obligatoria aunque las tablas actuales no la materialicen todavía.

---

#### 76. Correlación con múltiples recepciones

Una orden puede tener múltiples recepciones.

Por tanto:

```text
purchase_order_id
```

no es una clave idempotente suficiente para el hecho económico.

La identidad debe distinguir cada recepción y cada efecto material.

---

#### 77. Correlación con múltiples documentos

Una recepción puede relacionarse con más de un soporte.

La multiplicidad documental no debe crear por sí sola múltiples hechos económicos.

La clasificación determina si un documento:

- soporta el mismo hecho;
- corrige;
- complementa;
- revierte;
- representa otro hecho.

---

#### 78. Sensibilidad

Los eventos y datos de este contrato tienen clasificación mínima:

```text
RESTRICTED_FINANCIAL
```

Las proyecciones deberán aplicar minimización.

No todas las aplicaciones consumidoras requieren:

- importes completos;
- impuestos;
- cuentas;
- documentos;
- contrapartes;
- reglas;
- dimensiones contables.

---

#### 79. Autorización

Toda mutación de `VPROC-0051` deberá validar del lado autoritativo:

- permiso exacto;
- principal;
- actor efectivo;
- territorio cuando aplique;
- contexto;
- estado actual;
- versión;
- recurso;
- columnas o atributos modificables;
- ausencia de denegaciones.

La posesión de un evento válido no concede permiso financiero a un actor.

---

#### 80. Automatización asistiva

La automatización podrá:

- recibir;
- validar formato;
- correlacionar;
- sugerir clasificación;
- detectar duplicidad;
- detectar diferencias;
- proponer conciliación.

No podrá convertir una sugerencia en autoridad cuando el control aprobado exija decisión humana o segregada.

---

#### 81. Auditoría

Se preserva:

```text
VPROC-0051.AUDIT
```

Foco mínimo:

- evento fuente;
- clasificación;
- regla;
- cuenta;
- importe;
- periodo;
- soporte;
- reconocimiento;
- ajuste;
- cierre;
- correlación.

Evidencia mínima correlacionable:

- evento fuente;
- regla o versión;
- aprobación cuando aplique;
- efecto económico;
- soporte externo;
- conciliación.

---

#### 82. Lecturas sensibles

Deberán auditarse conforme al perfil vigente las consultas o extracciones financieras restringidas, especialmente cuando impliquen:

- datos bancarios;
- documentos;
- aprobaciones;
- exportaciones;
- impresión;
- conciliación.

---

#### 83. Métricas preservadas

Se conservan:

```text
VPROC-0051.MET-001
Hechos económicos registrados completa y oportunamente

VPROC-0051.MET-002
Latencia evento-registro

VPROC-0051.MET-003
Eventos no clasificados o sin soporte

VPROC-0051.MET-004
Asientos duplicados, manuales sin fuente
o periodo modificado para mejorar resultado
```

Cadencia:

```text
diaria
+ cierre semanal
+ cierre mensual
```

Dimensiones mínimas:

```text
entidad legal
periodo
centro de costo
cuenta
moneda
contraparte
documento
```

---

#### 84. Salidas de `VPROC-0051`

Se preservan como información producida:

- hecho económico correlacionado;
- clasificación contable;
- asiento o registro financiero;
- documento soporte;
- estado de reconocimiento y ajuste.

Proyecciones:

- libros o auxiliares;
- reportes;
- trazabilidad hacia fuente operativa;
- insumos para cierres;
- insumos para análisis.

Esta tarea no implementa contabilidad formal.

---

#### 85. Prohibición de fuente competidora

No podrá existir para el mismo hecho una fuente económica paralela que se mantenga manualmente sin reconciliación.

Regla:

```text
UN HECHO
→ UNA IDENTIDAD ECONÓMICA CANÓNICA
→ MÚLTIPLES PROYECCIONES
```

No:

```text
UN HECHO
→ GASTO MANUAL
+ COSTO NEXO
+ EVENTO ORIGO
+ HOJA EXTERNA
COMO CUATRO VERDADES
```

---

#### 86. Prohibición de escritura cruzada

ORIGO y NEXO deberán solicitar o emitir hechos mediante contratos aprobados.

No deberán escribir directamente:

- clasificación económica;
- estado de `VPROC-0051`;
- registro financiero propietario;
- conciliación financiera.

NUMERA, a su vez, no deberá escribir directamente:

- aceptación de recepción ORIGO;
- cantidad recibida ORIGO;
- movimiento físico NEXO;
- ubicación NEXO;
- stock NEXO.

---

#### 87. Reconstrucción end-to-end

Para cada instancia deberá poder responderse:

```text
¿QUÉ OCURRIÓ?
¿EN QUÉ PROCESO?
¿QUIÉN ERA LA FUENTE?
¿CUÁL EVENTO LO DECLARÓ?
¿QUÉ DOCUMENTO LO SOPORTÓ?
¿QUÉ IMPORTE Y MONEDA SE RECIBIERON?
¿QUÉ REGLA SE APLICÓ?
¿QUÉ DECISIÓN TOMÓ NUMERA?
¿QUÉ EFECTO SE RECONOCIÓ?
¿QUÉ AJUSTES EXISTEN?
¿QUEDÓ CONCILIADO?
```

Sin depender de notas libres como única evidencia.

---

#### 88. Implementación física observada en NUMERA

En el snapshot técnico vigente se observa una fundación económico-operativa con:

- periodos;
- categorías de gasto;
- gastos;
- presupuestos por centro de costo;
- vistas y funciones de resumen;
- superficies de centros de costo;
- gastos;
- punto de equilibrio;
- rentabilidad.

La migración fundacional declara expresamente que esa capa no constituye contabilidad formal.

---

#### 89. Captura manual observada

La superficie vigente de gastos permite crear directamente un registro en:

```text
numera_expenses
```

con información como:

- periodo;
- categoría;
- centro de costo;
- fecha;
- descripción;
- importe;
- moneda;
- `source_app = numera`.

Ese comportamiento es una capacidad legacy o parcial de captura económica.

No demuestra por sí mismo el consumo del contrato de evento definido en esta tarea.

---

#### 90. Campos de origen observados

La estructura vigente de `numera_expenses` contempla campos generales de origen como:

```text
source_app
source_table
source_id
metadata
```

pero el snapshot observado no demuestra todavía una implementación completa del sobre canónico de eventos ni de la secuencia `VPROC-0051`.

Esta tarea no renombra ni reutiliza por inferencia esos campos como si ya fueran el contrato final.

---

#### 91. Ausencia de consumidor físico demostrable

En el snapshot vigente de `vento-numera` no se observa una superficie específica que materialice de extremo a extremo:

```text
VPROC-0022.EVT-005
→ recepción idempotente
→ VPROC-0051.ECONOMIC_EVENT_RECEIVED
→ validación
→ clasificación
→ reconocimiento
→ conciliación
```

Tampoco se presenta la captura manual de `numera_expenses` como equivalente funcional a ese consumidor.

---

#### 92. Comparación entre estado observado y contrato objetivo

| Dimensión              | Estado observado                                     | Contrato objetivo                                 |
| ---------------------- | ---------------------------------------------------- | ------------------------------------------------- |
| entrada económica      | captura manual de gastos y modelos de lectura        | evento o soporte canónico correlacionado          |
| fuente                 | campos generales de origen opcionales                | identidad de evento y fuente obligatoria          |
| idempotencia           | no demostrada integralmente para recepción de evento | identidad estable, huella y resultado recuperable |
| correlación            | campos parciales de origen                           | cadena completa proceso-evento-documento-efecto   |
| clasificación          | categorías de gasto actuales                         | clasificación económica gobernada por NUMERA      |
| estados                | modelo de gasto operativo                            | estados `VPROC-0051.*`                            |
| reversos               | no demostrados como contrato completo                | CCR vinculadas y no destructivas                  |
| periodo                | periodos económicos existentes                       | fechas y periodos diferenciados y gobernados      |
| recepción comercial    | no propietaria de NUMERA                             | ORIGO                                             |
| inventario             | lectura o contexto externo                           | NEXO                                              |
| obligación a proveedor | no materializada por este contrato                   | `VPROC-0052` separado                             |
| contabilidad formal    | explícitamente no implementada en fundación          | preservada como frontera posterior                |

---

#### 93. Propietarios documentales de la brecha física

La diferencia entre el contrato objetivo y la implementación observada queda bajo propietarios existentes:

- `NUMERA-DOM-003`, para hechos económicos recibidos desde compras y recepción;
- `NUMERA-DOM-001` a `NUMERA-DOM-006`, según identidad, clasificación, gasto, centros y modelo financiero aplicables;
- `INT-APP-001` a `INT-APP-010`, para el contrato transversal de eventos;
- `INT-DB-001` a `INT-DB-008`, para la materialización de integración y persistencia cuando corresponda;
- los paquetes E5 propietarios que materialicen NUMERA y los dominios emisores;
- `INT-PROC-005`, exclusivamente para el control end-to-end de duplicación de recepción dentro de este mini-bloque.

No se crea una tarea nueva porque existen propietarios explícitos para cada brecha observada.

---

#### 94. Frontera con `INT-PROC-005`

`INT-PROC-004` define la identidad e idempotencia del efecto económico recibido.

`INT-PROC-005` permanece responsable de consolidar el control end-to-end que impida que una recepción repetida produzca efectos duplicados a través de ORIGO, NEXO y consumidores relacionados.

Esta tarea no desarrolla `INT-PROC-005`.

---

#### 95. Cambios físicos no autorizados

`INT-PROC-004` no autoriza:

- modificar NUMERA;
- modificar ORIGO;
- modificar NEXO;
- modificar tablas;
- crear tablas;
- crear columnas;
- crear índices;
- crear constraints;
- crear vistas;
- crear RPC;
- crear triggers;
- modificar RLS;
- modificar grants;
- crear colas;
- crear workers;
- crear adaptadores;
- crear eventos físicos;
- ejecutar migraciones;
- alterar datos;
- registrar gastos productivos;
- crear obligaciones;
- ejecutar pagos;
- publicar asientos;
- cambiar periodos;
- ejecutar reversos.

Toda futura modificación de Supabase que materialice este contrato deberá pertenecer a `vento-shell` conforme al gobierno vigente.

---

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea especializa documentalmente para la recepción de compra comportamientos ya protegidos por requisitos vigentes de NUMERA, integración, ORIGO, NEXO y autorización: fuente económica única, identidad estable, correlación, idempotencia, reintentos, no doble digitación, separación entre hecho operativo y financiero, no escritura cruzada, periodos, reversos, auditoría y conciliación. No introduce un comportamiento ejecutable nuevo ni modifica el significado de una regla de prueba existente.

---

#### 97. Cobertura de prueba existente preservada

La tarea conserva sin modificar la cobertura ya registrada para:

- `TREQ-NUMERA-001`, sobre reconciliación de indicadores, costos, gastos, cierres, saldos y reportes con hechos y documentos fuente sin doble registro manual;
- `TREQ-NUMERA-002`, sobre identidad estable, entidad, sede, centro, contraparte, moneda, fechas, fuente, correlación, documento, importe, impuesto, estado, evidencia y correcciones no destructivas;
- `TREQ-NUMERA-003`, sobre separación entre obligación, aprobación, pago, conciliación y sus autorizaciones;
- `TREQ-INTEGRATION-003`, sobre identidad estable, huella, reintento, resultado desconocido, concurrencia, idempotencia y recuperación;
- `TREQ-INTEGRATION-004`, sobre reconstrucción de causa, payload, actor, recurso, intento, resultado, error y efecto;
- `TREQ-INTEGRATION-005`, sobre conservación de contexto y nueva validación en handoffs;
- `TREQ-INTEGRATION-006`, sobre una fuente de verdad por dato y eliminación de doble digitación o fuentes competidoras;
- `TREQ-INTEGRATION-017`, sobre llegada de hechos de compra, recepción, inventario y otros dominios a NUMERA mediante contratos versionados, correlacionados e idempotentes;
- `TREQ-ORIGO-001`, sobre prevención de duplicación de cantidades, costos, orden recibida o evento financiero;
- `TREQ-ORIGO-003`, sobre atomicidad o estado durable reconciliable de la recepción;
- `TREQ-NEXO-011`, sobre ledger físico, proyecciones, atomicidad, idempotencia y no doble contabilización de inventario;
- `TREQ-AUTH-013`, sobre autorización server-side de mutaciones;
- `TREQ-AUTH-015`, sobre evidencia correlacionable de decisiones y acciones protegidas.

Ninguna de esas filas se crea, modifica, difiere, descarta u obsolete en esta tarea.

---

#### 98. Criterios de aceptación

- [ ] NUMERA queda identificada como propietaria de `VPROC-0051`.
- [ ] ORIGO conserva la propiedad de `VPROC-0022`.
- [ ] NEXO conserva la propiedad de `VPROC-0024`.
- [ ] `VPROC-0022.EVT-005` queda identificado como evento fuente principal de la cadena económica de recepción.
- [ ] `VPROC-0024.EVT-006` queda tratado como hecho físico correlacionable cuando aplique.
- [ ] El evento físico no crea por sí solo obligación, gasto o asiento.
- [ ] El estado inicial es exactamente `VPROC-0051.ECONOMIC_EVENT_RECEIVED`.
- [ ] El final normal es exactamente `VPROC-0051.ECONOMIC_EVENT_RECONCILED`.
- [ ] Se preservan exactamente siete estados intermedios.
- [ ] Se preservan exactamente nueve transiciones.
- [ ] Se preserva exactamente un bypass normal.
- [ ] Se preservan las seis entradas obligatorias.
- [ ] Se preservan las seis entradas condicionales.
- [ ] `source_event_ref` conserva identidad estable.
- [ ] La misma identidad y contenido no producen más de un efecto.
- [ ] La misma identidad con contenido incompatible produce conflicto.
- [ ] Una recepción parcial no se presenta como completa.
- [ ] Un complemento legítimo puede ser un hecho adicional diferenciable.
- [ ] Un replay no se convierte en complemento.
- [ ] Los eventos tardíos conservan la fecha real del hecho.
- [ ] Un periodo cerrado no se modifica silenciosamente.
- [ ] Se preservan `QUARANTINE`, `REQUEST_INFO`, `HOLD` y `REOPEN`.
- [ ] Se preservan `CANCEL`, `VOID`, `REVERSE` y `RESTATE`.
- [ ] Los reversos conservan el hecho original.
- [ ] Las reexpresiones no modifican el hecho operativo fuente.
- [ ] Se preservan exactamente seis eventos normales de `VPROC-0051`.
- [ ] No se crea un evento nuevo para duplicar `VPROC-0022.EVT-005`.
- [ ] Se preserva sensibilidad `RESTRICTED_FINANCIAL`.
- [ ] Se preserva `VPROC-0051.AUDIT`.
- [ ] Se preservan `VPROC-0051.MET-001` a `VPROC-0051.MET-004`.
- [ ] Se separa `VPROC-0051` de `VPROC-0052`.
- [ ] ORIGO no escribe el estado económico propietario de NUMERA.
- [ ] NEXO no escribe el estado económico propietario de NUMERA.
- [ ] NUMERA no reescribe recepción ni inventario.
- [ ] La captura manual no compite con un evento canónico ya existente.
- [ ] Se documenta la fundación económica actual de NUMERA sin presentarla como contabilidad formal.
- [ ] Se documenta la ausencia observada de un consumidor completo del evento sin inventar implementación.
- [ ] Cada brecha observada conserva un propietario documental existente.
- [ ] `INT-PROC-005` permanece reservada y no se desarrolla.
- [ ] No se modifica código, Supabase, migraciones, datos ni operación.
- [ ] No se crean ni modifican requisitos de prueba.

---

#### 99. Estado de cierre documental

`INT-PROC-004` queda documentalmente completa cuando las reglas anteriores se adopten como definición vigente del handoff económico de recepción de compra hacia NUMERA.

Su aprobación documental no significa que:

- exista ya un consumidor físico de eventos en NUMERA;
- la fundación `numera_expenses` materialice `VPROC-0051`;
- exista contabilidad formal;
- exista una cuenta por pagar aprobada;
- exista pago;
- exista conciliación bancaria;
- estén implementados outbox, inbox, colas o workers;
- el contrato haya sido probado operativamente.

La implementación posterior deberá demostrar esos resultados en sus tareas propietarias.

---

#### 100. Continuidad

```text
ÚLTIMA TAREA APROBADA
INT-PROC-003 — Definir contrato para que NEXO cree la entrada de inventario
        ↓
TAREA ACTUAL APROBADA
INT-PROC-004 — Definir contrato para que NUMERA reciba el evento económico
        ↓
SIGUIENTE TAREA RESERVADA
INT-PROC-005 — Definir control que evite una recepción duplicada
```


### ✅ INT-PROC-005 — Definir control que evite una recepción duplicada

**Estado:** APROBADA  
**Tarea anterior:** `INT-PROC-004 — Definir contrato para que NUMERA reciba el evento económico` — APROBADA  
**Tarea siguiente:** `INT-PROD-001 — Definir contrato para que FOGO solicite o reserve insumos` — RESERVADA  
**Tipo de tarea:** definición documental integral del control end-to-end de identidad, idempotencia, deduplicación, concurrencia, recuperación, conciliación y trazabilidad de una recepción entre ORIGO, NEXO y NUMERA; sin implementación física, migraciones, cambios Supabase, despliegues ni modificación de datos

**Repositorio propietario:** `vento-shell`  
**Bloque propietario:** BLOQUE X — Integraciones empresariales internas y externas  
**Mini-bloque:** Compras, recepción e inventario  
**Línea base remota revisada:** `devVentoGroup/vento-shell@5a408986dc07739b1a570717d8907a3c800608e5`  
**Aplicaciones involucradas:** `ORIGO`, `NEXO`, `NUMERA`; `SHELL` únicamente como fundación transversal cuando corresponda  
**Procesos principales protegidos:** `VPROC-0022`, `VPROC-0024`, `VPROC-0051`  
**Proceso posterior protegido por frontera:** `VPROC-0052`  
**Cambios físicos autorizados:** ninguno

---

#### 1. Propósito

Definir un único control empresarial para impedir que la misma recepción real produzca más de una vez cualquiera de sus efectos comerciales, físicos o económicos.

El control debe impedir, como mínimo:

- una segunda instancia ordinaria de la misma recepción en ORIGO por doble envío, refresh, timeout, reintento, operación concurrente o respuesta perdida;
- una segunda entrada o movimiento físico en NEXO por reentrega del mismo handoff o evento;
- una segunda suma de cantidades recibidas de una orden por replay de la misma recepción;
- una segunda actualización de stock, ubicación, lote, LPN, costo o proyección por repetición del mismo efecto físico;
- un segundo hecho económico en NUMERA por repetición, reordenamiento o reemisión del mismo hecho fuente;
- una segunda obligación posterior por reutilizar como nueva una fuente económica que ya produjo su efecto;
- una corrección, reversa o reexpresión tratada como si fuera una recepción ordinaria independiente sin vínculo con el original.

El control no debe bloquear operaciones distintas que legítimamente comparten orden, proveedor, factura, producto, sede o fecha.

---

#### 2. Resultado material

Queda definido el contrato completo de deduplicación de recepción para la cadena:

```text
ORIGO / VPROC-0022
RECEPCIÓN COMERCIAL Y DOCUMENTAL
        ↓
HANDOFF FÍSICO CORRELACIONADO
        ↓
NEXO / VPROC-0024
INGRESO, UBICACIÓN Y CUSTODIA FÍSICA
        ↓
EVIDENCIA FÍSICA CORRELACIONADA
        ↓
NUMERA / VPROC-0051
HECHO ECONÓMICO CORRELACIONADO
        ↓
VPROC-0052 CUANDO NAZCA UNA OBLIGACIÓN
```

La garantía empresarial objetivo es:

```text
UNA RECEPCIÓN REAL
→ UNA IDENTIDAD CANÓNICA DE RECEPCIÓN EN ORIGO
→ CERO O MÁS EFECTOS FÍSICOS LEGÍTIMOS, CADA UNO IDENTIFICADO UNA SOLA VEZ EN NEXO
→ CERO O MÁS EFECTOS ECONÓMICOS LEGÍTIMOS, CADA UNO IDENTIFICADO UNA SOLA VEZ EN NUMERA
→ NINGÚN REPLAY CREA UN EFECTO ADICIONAL
```

No se promete transporte exactamente una vez. La garantía se obtiene mediante persistencia durable, idempotencia por operación, deduplicación en cada propietaria, recuperación del resultado previo y conciliación.

---

#### 3. Decisiones canónicas preservadas

Se preservan sin reinterpretación estas fronteras:

1. `VPROC-0022` pertenece a ORIGO y gobierna la aceptación o rechazo comercial y documental de la recepción.
2. `VPROC-0024` pertenece a NEXO y gobierna el ingreso, ubicación, movimiento, custodia y proyecciones físicas posteriores a la aceptación aplicable.
3. `VPROC-0051` pertenece a NUMERA y gobierna el reconocimiento, clasificación, registro y conciliación del hecho económico proveniente de fuentes verificables.
4. `VPROC-0052` es un proceso posterior y separado para obligación, aprobación y pago a proveedor.
5. Las aplicaciones no comparten un único estado de recepción y ninguna reinterpreta como propia la verdad de otra.
6. Una orden puede tener más de una recepción legítima.
7. Una recepción puede tener más de un documento soporte.
8. Una recepción puede producir varios efectos físicos legítimos por línea, ubicación, lote, LPN o ejecución controlada.
9. Una recepción puede requerir correcciones o efectos compensatorios posteriores sin que el original sea borrado.
10. La duplicidad se evita por identidad y efecto, no por semejanza visual o por una clave comercial aislada.

---

#### 4. Fuentes funcionales consumidas

El control especializa y combina decisiones ya aprobadas de:

- `INT-PROC-002` para la separación ORIGO ↔ NEXO;
- `INT-PROC-003` para el contrato de ingreso físico de NEXO;
- `INT-PROC-004` para el contrato de recepción del hecho económico en NUMERA;
- `INT-APP-001` a `INT-APP-010` para identidad de evento, productora, consumidoras, idempotencia, reintentos, compensación, auditoría, sincronización, error parcial y prohibición de escrituras cruzadas;
- `PROC-CAT-005`, `PROC-CAT-006`, `PROC-CAT-009` a `PROC-CAT-020` para propiedad, consumidoras, estados, transiciones, excepciones, reversas, información, eventos, auditoría, métricas y duplicidades;
- los contratos vigentes de autorización, auditoría, integración, inventario, recepción y hechos económicos.

---

#### 5. Regla raíz de identidad

La identidad empresarial de una recepción nace en ORIGO como la instancia de proceso de `VPROC-0022`.

Una vez creada válidamente:

- `process_instance_id` identifica esa recepción empresarial y no se reutiliza para otra recepción real;
- `request_id` identifica la solicitud de creación o acción que puede ser reintentada;
- `idempotency_key` identifica la operación lógica reintentable;
- `source_command_id` vincula la acción autorizada con la mutación y los eventos que produce;
- `correlation_id` vincula ORIGO, NEXO, NUMERA, documentos y efectos derivados;
- `event_id` identifica una emisión concreta y nunca se reutiliza;
- `event_definition_id` y `event_type` describen el hecho canónico, pero no sustituyen la identidad de la emisión;
- `aggregate_version` o la versión equivalente permiten distinguir un hecho nuevo del replay de una versión ya aplicada.

NEXO y NUMERA consumen referencias a la identidad propietaria; no fabrican una segunda identidad de recepción mediante proveedor, factura, fecha, orden o texto libre.

---

#### 6. Regla raíz de idempotencia

Toda acción reintentable que pueda crear o modificar un efecto de recepción debe obtener antes del primer intento:

```text
idempotency_key
+ request_id
+ process_instance_id cuando ya exista
+ recurso o agregado afectado
+ versión relevante
+ huella lógica versionada del contenido
+ estado durable de la operación
+ referencia recuperable del resultado
```

La decisión es cerrada:

```text
MISMA CLAVE + MISMA HUELLA LÓGICA
→ devolver el resultado durable existente
→ cero efecto adicional

MISMA CLAVE + HUELLA LÓGICA INCOMPATIBLE
→ conflicto
→ cero efecto parcial nuevo

CLAVE NUEVA + RECEPCIÓN REAL NUEVA
→ puede crear una nueva instancia

CLAVE NUEVA + POSIBLE MISMA RECEPCIÓN YA EXISTENTE
→ no aplicar automáticamente
→ verificar identidad empresarial y conciliar
```

---

#### 7. Qué constituye un replay

Existe replay cuando la misma operación lógica vuelve a llegar con la identidad y contenido compatibles, aunque cambie cualquiera de estos elementos técnicos:

- conexión;
- pestaña;
- sesión HTTP;
- worker;
- intento de cola;
- timestamp de entrega;
- ACK de transporte;
- nodo de ejecución;
- retry count;
- orden de llegada de mensajes compatibles.

El replay debe recuperar el resultado original y no volver a ejecutar el efecto.

---

#### 8. Qué constituye reutilización conflictiva

Existe reutilización conflictiva cuando una identidad idempotente ya persistida se presenta con un contenido empresarial incompatible, por ejemplo:

- distinta sede;
- distinto proveedor;
- distinta recepción de origen;
- distinta orden o compromiso cuando este forma parte del alcance;
- líneas, cantidades o unidades materialmente distintas;
- distinta modalidad de operación sin transición autorizada;
- distinto evento fuente;
- distinta versión contractual incompatible.

La respuesta debe ser `CONFLICTING_REUSE` y no se permite elegir silenciosamente una de las dos versiones.

---

#### 9. Qué constituye duplicación empresarial confirmada

Hay duplicación empresarial confirmada cuando un mismo hecho fuente ya produjo un efecto válido y se intenta producir de nuevo el mismo tipo de efecto dentro del mismo alcance propietario.

Ejemplos:

- dos cabeceras ordinarias representan la misma instancia real de recepción;
- el mismo comando confirmado vuelve a sumar `quantity_received`;
- la misma entrada física vuelve a crear movimiento de inventario;
- el mismo efecto físico vuelve a incrementar una proyección;
- el mismo evento fuente vuelve a crear un hecho económico;
- el mismo hecho económico vuelve a crear la misma obligación.

La comparación se realiza contra identidades y resultados durables, no contra textos parecidos.

---

#### 10. Qué no constituye duplicación por sí solo

Ninguno de estos valores aislados demuestra una recepción duplicada:

- `purchase_commitment_ref` o identificador de orden;
- proveedor;
- número de factura;
- fecha de recepción;
- sede;
- producto;
- línea de orden;
- cantidad;
- lote;
- costo;
- usuario receptor;
- combinación heurística de campos sin identidad canónica.

Pueden usarse como señales de conflicto o conciliación, pero no como sustituto de la identidad de proceso y de operación.

---

#### 11. Recepciones parciales legítimas

Una orden o compromiso de compra puede producir varias recepciones reales.

Cada llegada real separada que deba ser aceptada como recepción distinta:

- obtiene una instancia distinta de `VPROC-0022`;
- obtiene su propia operación de creación;
- conserva su propio `request_id` e `idempotency_key`;
- queda correlacionada con el mismo `purchase_commitment_ref` cuando corresponda;
- solo suma las cantidades de esa recepción;
- produce sus efectos NEXO y NUMERA de forma independiente e idempotente.

Por tanto:

```text
MISMA ORDEN + DOS ENTREGAS REALES
≠ DUPLICADO

MISMA ENTREGA REAL + DOS INTENTOS DE REGISTRO
= REPLAY O CONFLICTO, SEGÚN IDENTIDAD Y CONTENIDO
```

---

#### 12. Recepción completa posterior a parciales

Una recepción que completa el saldo pendiente de una orden no reemplaza las parciales anteriores.

El cierre de la orden debe derivarse de la suma reconciliada de efectos válidos, no de volver a procesar recepciones anteriores.

Si el último intento se repite:

- no vuelve a incrementar cantidades recibidas;
- no vuelve a cerrar una orden ya cerrada como si fuera un hecho nuevo;
- no vuelve a producir movimiento, costo ni hecho financiero.

---

#### 13. Regla sobre documentos del proveedor

`VPROC-0022` recibe `supplier_document_refs` como soporte obligatorio.

Los documentos:

- prueban o soportan afirmaciones;
- pueden participar en la detección de conflicto;
- deben conservarse correlacionados;
- no son por sí solos la identidad idempotente de la recepción.

Una recepción con varios documentos no se divide automáticamente en varias recepciones. Dos recepciones no se fusionan automáticamente porque compartan un documento.

---

#### 14. Regla sobre número de factura

`invoice_number` o su equivalente:

- no es una clave universal de idempotencia;
- no puede ser el único criterio para impedir o permitir una recepción;
- puede faltar, cambiar por corrección documental o no corresponder uno a uno con una llegada física;
- debe tratarse como dato del soporte comercial dentro de la recepción propietaria.

Una coincidencia de factura genera revisión cuando corresponda, no una mutación automática.

---

#### 15. Regla sobre orden de compra

El identificador de orden:

- relaciona la recepción con el compromiso comercial;
- permite validar proveedor, sede, líneas y saldo;
- no puede ser único por recepción;
- no puede usarse para rechazar una segunda entrega real legítima;
- no puede permitir que un replay vuelva a sumar el saldo recibido.

El control debe actuar al nivel de recepción y de efecto, no al nivel de orden completa.

---

#### 16. Recepciones de emergencia o sin orden

Cuando el contrato vigente admita una recepción sin orden mediante un carril excepcional:

- sigue siendo obligatorio crear identidad estable de recepción y operación antes del efecto;
- la ausencia de orden no elimina idempotencia;
- la causa excepcional forma parte del contenido lógico relevante;
- los reintentos conservan la misma clave;
- una recepción posterior regularizada debe vincularse a la operación original y no duplicarla por crear después una orden o soporte faltante.

---

#### 17. Modalidad que mueve inventario frente a solo registro

La modalidad de la recepción debe permanecer visible y auditable.

Si una operación se registra inicialmente sin mover inventario y luego una acción autorizada habilita el efecto físico:

- no se crea una segunda recepción empresarial por el simple cambio de modalidad;
- se conserva la identidad de origen;
- el nuevo efecto físico obtiene identidad propia dentro de esa recepción;
- NEXO aplica el efecto una sola vez;
- NUMERA no duplica el hecho económico por el cambio de modalidad;
- la transición conserva antes, después, actor, causa y evidencia.

La modalidad nunca se deduce de que ya exista o no una fila física aislada.

---

#### 18. Identidad de la creación en ORIGO

La creación ordinaria de `VPROC-0022` debe efectuar lógicamente una sola decisión:

1. validar actor, permiso, sede, contrato y referencias;
2. reclamar la `idempotency_key`;
3. comparar la huella lógica;
4. crear o recuperar `process_instance_id`;
5. persistir el resultado durable;
6. asociar `source_command_id`;
7. permitir continuar el proceso sin crear una segunda instancia por retry.

Si otra ejecución concurrente ya posee el claim, la segunda no crea otra recepción.

---

#### 19. Alcance mínimo de la huella lógica de creación

La canonicalización futura debe representar el contenido empresarial de la solicitud, no detalles accidentales de transporte.

Como mínimo debe incorporar, cuando aplique:

- tipo de operación o comando;
- contrato y versión;
- `purchase_commitment_ref`;
- `supplier_document_refs` normalizadas como referencias, no como texto de presentación;
- `received_lines` con identidad de línea, producto, cantidad y unidad canónicas;
- `received_at` empresarial con tratamiento temporal definido;
- `receiving_site_ref`;
- modalidad declarada;
- referencias de corrección o reversa cuando existan;
- cualquier dimensión cuya diferencia cambie el efecto empresarial.

No deben formar parte de la huella lógica:

- orden de campos JSON sin significado;
- timestamps de red;
- retry count;
- ID del intento técnico;
- cabeceras de transporte irrelevantes;
- texto visual equivalente cuando exista identidad canónica.

---

#### 20. Canonicalización y versión

La huella debe calcularse sobre una representación canónica y versionada.

Reglas:

1. la misma operación semántica produce la misma huella aunque el transporte serialice campos en otro orden;
2. cantidades y unidades se normalizan con reglas canónicas antes de comparar;
3. referencias se comparan por identidad estable;
4. una nueva versión incompatible del contrato no reutiliza silenciosamente una huella antigua;
5. el algoritmo físico y almacenamiento se definirán en la fase técnica correspondiente;
6. la versión de canonicalización debe quedar auditable junto con la huella.

---

#### 21. Resultado de un doble envío en ORIGO

Cuando dos envíos concurrentes presenten la misma clave y huella:

```text
PRIMER GANADOR
→ crea o confirma la operación empresarial

SEGUNDO INTENTO
→ recupera el mismo resultado
→ DUPLICATE_RESULT_RETURNED
→ cero cabeceras nuevas
→ cero líneas nuevas
→ cero sumas adicionales
→ cero eventos empresariales duplicados
```

No se permite resolver la carrera mediante dos inserciones y una conciliación posterior evitable.

---

#### 22. Respuesta perdida después del commit

Si ORIGO confirma el efecto durable pero el cliente no recibe respuesta:

- el cliente o adaptador reintenta con la misma clave;
- el servidor consulta la operación existente;
- devuelve el mismo `process_instance_id` y referencia de resultado;
- no repite las mutaciones ya confirmadas;
- no crea otro evento de éxito por el retry.

Una respuesta HTTP desconocida no autoriza generar una clave nueva para “probar otra vez”.

---

#### 23. Estado desconocido antes de determinar el resultado

Si no puede demostrarse si una operación quedó aplicada:

- la operación no se declara fallida automáticamente;
- no se crea una segunda operación con otra identidad;
- se utiliza `IN_PROGRESS_RECOVERABLE` mientras exista claim válido y resultado recuperable;
- se utiliza `RECONCILIATION_REQUIRED` cuando el efecto no pueda determinarse de forma segura;
- la intervención conserva evidencia, causa y resultado final.

---

#### 24. Resultados lógicos del control

Se reutiliza el vocabulario transversal aprobado:

| Resultado                   | Regla en una recepción                                                        |
| --------------------------- | ----------------------------------------------------------------------------- |
| `APPLIED`                   | El efecto se materializó por primera vez y existe referencia durable.         |
| `DUPLICATE_RESULT_RETURNED` | La operación ya existía y se devuelve el resultado previo sin repetir efecto. |
| `CONFLICTING_REUSE`         | La clave conocida presenta contenido incompatible.                            |
| `IN_PROGRESS_RECOVERABLE`   | Existe una ejecución con claim vigente y el resultado debe recuperarse.       |
| `STALE_VERSION`             | La solicitud parte de una versión obsoleta y no se aplica silenciosamente.    |
| `OUT_OF_ORDER_DEFERRED`     | Falta un hecho o versión previa requerida antes de aplicar.                   |
| `RECONCILIATION_REQUIRED`   | No es seguro aplicar ni asumir éxito mediante retry automático.               |

Ninguno de estos estados sustituye los estados empresariales de `VPROC-0022`, `VPROC-0024` o `VPROC-0051`.

---

#### 25. Handoff ORIGO → NEXO

El handoff físico conserva como mínimo:

- `event_id`;
- `event_definition_id`;
- `event_type` y versión;
- `process_id = VPROC-0022`;
- `process_instance_id` de la recepción;
- `correlation_id`;
- `causation_id`;
- `source_command_id` cuando aplique;
- `request_id` e identidad idempotente aplicable;
- referencias de salida y evidencia mínimas;
- sede y contexto autorizados;
- versión del agregado o recurso;
- sensibilidad y alcance.

El hecho de handoff previsto es `VPROC-0022.EVT-004 — vento.process.vproc-0022.putaway-pending.v1`.

Una reentrega del mismo evento no crea otra entrada física.

---

#### 26. Deduplificación de entrega en NEXO

NEXO debe deduplicar en su propia frontera aunque ORIGO ya haya deduplicado la emisión.

Reglas:

1. `event_id` ya consumido devuelve el resultado previo o no-op autorizado;
2. la misma recepción y el mismo efecto físico no se aplican dos veces aunque el mensaje sea reentregado;
3. NEXO revalida contrato, autoridad, sede, recurso y estado antes del primer efecto;
4. una clave conocida no concede permiso;
5. un evento incompatible con el registro previo produce conflicto o conciliación;
6. el resultado NEXO queda recuperable para reintentos posteriores.

---

#### 27. Una recepción puede producir varios efectos físicos

La deduplicación NEXO no puede imponer una restricción “una recepción = un movimiento”.

Una recepción puede requerir movimientos distintos por:

- línea de producto;
- presentación o unidad normalizada;
- ubicación;
- posición;
- lote o serial;
- LPN;
- condición;
- cuarentena;
- ejecución parcial controlada.

Cada efecto físico material debe tener una identidad hija estable y correlacionada con la recepción propietaria.

El control exige unicidad del mismo efecto, no unicidad artificial de toda la recepción dentro del ledger físico.

---

#### 28. Regla de movimiento físico único

Para una identidad de efecto físico determinada:

```text
MISMA FUENTE + MISMO EFECTO + MISMA VERSIÓN
→ un solo movimiento canónico
→ una sola actualización de proyecciones

MISMA FUENTE + EFECTO MATERIALMENTE DISTINTO Y AUTORIZADO
→ nuevo efecto correlacionado

MISMA IDENTIDAD DE EFECTO + CONTENIDO DISTINTO
→ conflicto
```

No se permite que un replay incremente por segunda vez stock por sede, ubicación, posición, lote o LPN.

---

#### 29. Regla de proyección física

Una proyección NEXO nunca sirve como prueba autónoma de que un movimiento aún no fue aplicado.

La secuencia lógica es:

```text
IDENTIDAD DEL EFECTO
→ CLAIM / DEDUPLICACIÓN
→ MOVIMIENTO CANÓNICO
→ PROYECCIONES CORRELACIONADAS
→ RESULTADO DURABLE
```

Si una proyección se actualizó y el resultado técnico se perdió, la recuperación debe reconstruirse desde la identidad del movimiento y no sumar otra vez.

---

#### 30. Evento NEXO de reconciliación física

`VPROC-0024.EVT-006 — vento.process.vproc-0024.inbound-movement-reconciled.v1` confirma que el ingreso físico quedó contabilizado una sola vez dentro del alcance de NEXO.

Su reentrega:

- no crea otro movimiento;
- no crea otra recepción ORIGO;
- no crea automáticamente otro hecho económico;
- sirve como evidencia correlacionable para los consumidores autorizados.

---

#### 31. Handoff económico ORIGO → NUMERA

El hecho principal definido para iniciar o continuar el reconocimiento económico de esta recepción es:

`VPROC-0022.EVT-005 — vento.process.vproc-0022.economic-reconciliation-pending.v1`.

El contrato transporta la identidad fuente y conserva la correlación con:

- recepción ORIGO;
- documento o documentos soporte;
- proveedor;
- entidad y sede aplicables;
- importes y moneda cuando correspondan;
- efecto físico NEXO cuando sea necesario;
- diferencias, reversas o reexpresiones posteriores.

---

#### 32. Deduplificación de NUMERA

NUMERA deduplica el hecho económico en su propia frontera.

Reglas:

1. `source_event_ref` ya procesado no crea un segundo hecho;
2. el mismo evento con la misma identidad recupera el resultado existente;
3. la misma identidad con contenido incompatible produce conflicto;
4. un evento tardío no vuelve a reconocer un importe ya reconocido;
5. un cambio de periodo no convierte el mismo hecho fuente en un hecho nuevo;
6. una reentrega de evidencia NEXO no duplica el reconocimiento económico;
7. la corrección se modela como acción vinculada, no como sobreescritura ni segundo original.

---

#### 33. Relación entre `VPROC-0022.EVT-005` y `VPROC-0022.EVT-006`

`VPROC-0022.EVT-006 — receipt-reconciled` confirma el final normal de la recepción ORIGO.

Si el efecto económico correspondiente ya nació desde `VPROC-0022.EVT-005`:

- `EVT-006` no crea un segundo hecho económico equivalente;
- actualiza o aporta evidencia a la misma correlación cuando el contrato consumidor lo requiera;
- puede permitir conciliación o cierre, pero no duplicación del origen.

La regla evita que dos hitos del mismo proceso se contabilicen como dos compras.

---

#### 34. Evidencia NEXO dentro del hecho económico

Cuando exista inventario físico asociado, `VPROC-0024.EVT-006` puede corroborar que el efecto de inventario fue reconciliado.

Esa evidencia:

- no sustituye el evento comercial de ORIGO;
- no crea por sí sola una segunda compra;
- no autoriza a NUMERA a inventar importes ausentes;
- se vincula a la misma `correlation_id` o relación canónica equivalente;
- permite detectar recepción económica sin ingreso físico esperado o ingreso físico sin correlación comercial.

---

#### 35. Frontera con `VPROC-0052`

El hecho económico de `VPROC-0051` y la obligación de proveedor de `VPROC-0052` son objetos distintos.

Si una recepción genera una obligación:

- la obligación conserva referencia al hecho económico fuente;
- la misma fuente económica no crea dos obligaciones equivalentes;
- una obligación parcial o adicional legítima requiere una causa y alcance distintos;
- nota crédito, reversa, retención, diferencia o pago no se modelan como una segunda recepción;
- el pago posterior nunca altera la identidad de la recepción original.

---

#### 36. Doble emisión con `event_id` diferente

Si por un defecto del emisor el mismo hecho empresarial se publica dos veces con `event_id` distintos, el consumidor no debe aplicar ciegamente ambos.

La detección secundaria utiliza la identidad del proceso fuente, agregado, versión, estado o hecho confirmado y correlación disponible.

Si se demuestra equivalencia:

- se conserva el primer efecto válido;
- el segundo queda como duplicado o no-op auditable;
- no se borra la evidencia de la doble emisión.

Si no puede demostrarse equivalencia sin asumir datos, el caso queda en conciliación.

---

#### 37. Eventos fuera de orden

Un evento posterior puede llegar antes que uno requerido.

Reglas:

- no se fabrica el estado faltante;
- no se aplica un efecto irreversible sobre una versión anterior no reconciliada;
- se utiliza `OUT_OF_ORDER_DEFERRED` cuando el contrato exige esperar;
- la llegada posterior de la dependencia reevalúa la misma operación;
- el reintento conserva identidad;
- ningún reordenamiento crea un segundo efecto.

---

#### 38. Eventos tardíos

Un evento tardío conserva su `occurred_at`, `recorded_at`, versión y fuente.

La recepción tardía en NUMERA o NEXO:

- no se trata como una recepción nueva solo por llegar después;
- no cambia silenciosamente el periodo o fecha empresarial;
- se valida contra el estado actual y reglas de cierre;
- puede quedar diferida o requerir reexpresión, sin duplicar el original.

---

#### 39. Versión obsoleta

Cuando la acción se basa en una versión anterior del recurso:

- se responde `STALE_VERSION` si el efecto no puede aplicarse con seguridad;
- no se aplica sobre el estado más reciente de forma silenciosa;
- el usuario o sistema debe reconstruir la intención contra la versión vigente;
- una nueva solicitud corregida obtiene identidad acorde con la nueva intención y mantiene referencia al intento anterior cuando corresponda.

---

#### 40. Concurrencia

El control debe ser resistente a:

- doble click;
- dos pestañas;
- dos dispositivos;
- dos trabajadores actuando sobre la misma recepción;
- frontend y job simultáneos;
- reintento automático mientras el primer intento sigue ejecutándose;
- dos consumidores compitiendo por el mismo mensaje;
- dos actualizaciones simultáneas de cantidades recibidas.

La garantía lógica es un solo ganador empresarial por identidad de operación y efecto.

---

#### 41. Claim y resultado durable

La futura implementación física debe soportar un mecanismo equivalente a:

```text
CLAIM ÚNICO
+ HUELLA LÓGICA
+ ESTADO DE PROCESAMIENTO
+ RESULTADO RECUPERABLE
+ REFERENCIA AL EFECTO
+ VERSIÓN
+ AUDITORÍA
```

El contrato no obliga en esta fase a una tabla, RPC o tecnología específica.

La persistencia física, constraints, transacciones, outbox, inbox y leases pertenecen a las tareas técnicas ya reservadas por el plan.

---

#### 42. Emisor y consumidor deben deduplicar

No es suficiente deduplicar solo en ORIGO.

| Frontera                  | Responsabilidad mínima                                                                  |
| ------------------------- | --------------------------------------------------------------------------------------- |
| Cliente/adaptador → ORIGO | Reutilizar la misma clave ante retry de la misma intención.                             |
| ORIGO                     | Reclamar clave, validar huella, persistir resultado y emitir una vez por hecho durable. |
| Transporte                | Puede reintentar; no define verdad empresarial.                                         |
| NEXO                      | Deduplicar entrega y efecto físico local.                                               |
| NUMERA                    | Deduplicar evento fuente y efecto económico local.                                      |
| Proceso posterior         | Deduplicar su propio efecto por la fuente que lo origina.                               |

Una falla de una capa no autoriza a otra a abandonar su propio control.

---

#### 43. Semántica de exactamente una vez

La expresión “una sola vez” en esta tarea significa:

```text
UNA SOLA VEZ EL EFECTO EMPRESARIAL POR IDENTIDAD LÓGICA
```

No significa que:

- el mensaje viaje una sola vez;
- el HTTP request ocurra una sola vez;
- el worker procese un intento una sola vez;
- no existan reintentos;
- no existan registros técnicos de intentos repetidos.

Los intentos pueden repetirse; el efecto empresarial no.

---

#### 44. Corrección de una recepción

Una corrección autorizada no se clasifica como duplicado cuando modifica legítimamente el hecho original mediante el mecanismo canónico correspondiente.

Reglas:

- conserva referencia al original;
- conserva la evidencia y el valor previo;
- posee su propia operación idempotente;
- no reutiliza la creación ordinaria como si la recepción original nunca hubiera existido;
- los efectos físicos y económicos derivados se corrigen mediante acciones vinculadas;
- un retry de la corrección devuelve el mismo resultado de corrección.

---

#### 45. `VOID` para duplicado sin efecto legítimo

`VPROC-0022.CCR-002` permite anular una instancia duplicada o inválida cuando no produjo un efecto legítimo.

El control debe distinguir:

```text
DUPLICADO DETECTADO ANTES DE EFECTO VÁLIDO
→ VOID / NO-OP SEGÚN EL CASO

EFECTO VÁLIDO YA CONFIRMADO QUE DEBE DESHACERSE
→ NO USAR VOID COMO BORRADO
→ APLICAR REVERSA, REEXPRESIÓN O ACCIÓN COMPENSATORIA APROBADA
```

El registro original y la causa permanecen auditables.

---

#### 46. Reversa

Una reversa:

- no borra la recepción original;
- referencia el efecto que compensa;
- tiene identidad idempotente propia;
- puede producir movimientos inversos o asientos inversos cuando el dominio propietario lo permita;
- no puede ejecutarse dos veces por replay;
- no convierte el original en un registro “nunca ocurrido”.

---

#### 47. Reexpresión o corrección económica

Una corrección de cuenta, periodo, centro, tercero, impuesto o clasificación:

- no cambia el evento operativo fuente;
- crea un ajuste o reexpresión vinculada;
- conserva valor previo, nuevo valor, regla, versión, actor y causa;
- es idempotente por su propia identidad;
- no duplica el hecho económico original.

---

#### 48. Señales de posible duplicado

El sistema puede elevar una advertencia o caso de conciliación cuando detecte combinaciones sospechosas, por ejemplo:

- mismo proveedor y documento;
- misma orden, sede y ventana temporal;
- líneas y cantidades equivalentes;
- misma evidencia externa;
- mismo payload externo con diferente identificador técnico;
- misma recepción fuente vinculada a dos efectos del mismo tipo.

Estas señales son auxiliares.

No se autoriza borrar, fusionar, aplicar o rechazar efectos únicamente por similitud heurística.

---

#### 49. Diferencia entre duplicado y conflicto

| Caso                                                                 | Decisión                                        |
| -------------------------------------------------------------------- | ----------------------------------------------- |
| Misma clave, misma huella, resultado existente                       | `DUPLICATE_RESULT_RETURNED`                     |
| Misma clave, distinta huella                                         | `CONFLICTING_REUSE`                             |
| Misma fuente y mismo efecto ya aplicado                              | duplicado empresarial; devolver resultado/no-op |
| Identidades distintas con alta semejanza, equivalencia no demostrada | `RECONCILIATION_REQUIRED`                       |
| Nueva entrega real de la misma orden                                 | nueva recepción legítima                        |
| Corrección vinculada                                                 | acción correctiva, no nueva recepción ordinaria |
| Reversa vinculada                                                    | acción compensatoria, no duplicado              |

---

#### 50. Conciliación obligatoria

La conciliación debe poder detectar al menos:

- recepción ORIGO sin efecto físico esperado;
- efecto físico NEXO sin recepción ORIGO correlacionable;
- recepción ORIGO sin hecho económico esperado;
- hecho económico NUMERA sin fuente ORIGO válida;
- dos efectos físicos equivalentes para la misma identidad de efecto;
- dos hechos económicos equivalentes para la misma fuente;
- cantidades recibidas de orden que no reconcilian con recepciones válidas;
- movimiento o proyección sin referencia de recepción;
- evento emitido sin efecto consumidor requerido;
- efecto consumidor sin evento fuente conocido;
- operación en estado incierto después de agotar recuperación automática.

---

#### 51. Resultado de conciliación

La conciliación no corrige datos silenciosamente.

Debe producir una decisión estructurada:

- no existe diferencia;
- falta efecto y puede reintentarse con la misma identidad;
- existe duplicado sin efecto adicional;
- existe efecto duplicado y requiere acción correctiva;
- existe conflicto de contenido;
- existe evento fuera de orden;
- existe fuente no resoluble;
- se requiere intervención autorizada.

Toda intervención conserva responsable, motivo, evidencia y resultado.

---

#### 52. Auditoría mínima

Cada intento relevante debe permitir reconstruir:

- principal técnico;
- actor efectivo;
- aplicación;
- sede y área cuando correspondan;
- `request_id`;
- `idempotency_key`;
- versión de canonicalización;
- huella lógica;
- `process_instance_id`;
- `source_command_id`;
- `event_id`;
- `correlation_id` y `causation_id`;
- recurso y versión;
- resultado lógico;
- referencia al efecto aplicado o recuperado;
- timestamps de ocurrencia, registro, primer intento y último intento;
- clasificación de error o conflicto;
- acción correctiva o de conciliación cuando exista.

La auditoría no almacena secretos como parte de la huella visible.

---

#### 53. Autorización

La idempotencia nunca sustituye la autorización.

Cada primer efecto y cada acción posterior debe revalidar según corresponda:

- identidad real;
- permiso exacto;
- actor efectivo;
- sede y área;
- estado actual del recurso;
- alcance de la acción;
- versión;
- columnas o dimensiones protegidas;
- segregación de funciones.

Una clave válida presentada por un actor no autorizado produce denegación segura, no ejecución ni recuperación de datos que el actor no puede consultar.

---

#### 54. Sensibilidad

Los eventos y hechos de `VPROC-0022`, `VPROC-0024` y `VPROC-0051` utilizan información operacional y financiera restringida.

El control de duplicidad debe minimizar:

- importes innecesarios en logs;
- documentos completos en trazas;
- datos bancarios;
- información tributaria excesiva;
- nombres o datos personales cuando una referencia estable sea suficiente.

La huella lógica puede incluir material sensible de forma segura, pero no debe convertirse en un mecanismo para exponer el payload original.

---

#### 55. Métricas y guardrails

El control se alinea con los guardrails ya aprobados:

- `VPROC-0022.MET-004`: recepción duplicada, aceptación sin evidencia suficiente o diferencia crítica no resuelta;
- `VPROC-0024.MET-004`: stock sin ubicación, movimiento duplicado o ubicación incompatible con condición;
- `VPROC-0051.MET-004`: asiento duplicado, registro manual sin fuente o manipulación de periodo.

La medición futura debe distinguir:

- intents repetidos detectados antes de efecto;
- duplicados devueltos con resultado previo;
- conflictos de reutilización;
- operaciones en conciliación;
- duplicados empresariales reales encontrados por reconciliación;
- tiempo de recuperación de resultado desconocido.

La métrica no autoriza cambios físicos en esta tarea.

---

#### 56. Diagnóstico de la implementación ORIGO vigente

En el snapshot revisado de `vento-origo`, la acción actual de recepción:

- valida usuario, permiso, sede, proveedor y orden;
- crea una fila en `inventory_entries`;
- inserta líneas en `inventory_entry_items`;
- cuando corresponde, inserta movimientos `receipt_in`;
- actualiza proyecciones de stock;
- calcula y actualiza costos aplicables;
- inserta eventos de costo;
- incrementa `purchase_order_items.quantity_received`;
- puede marcar la orden como `received`;
- posee un flujo de reversa/corrección vinculado a RPC existentes;
- realiza esas responsabilidades mediante múltiples operaciones sucesivas.

El código revisado no materializa en la acción de creación el contrato transversal completo de `idempotency_key` + huella lógica + resultado recuperable definido para esta tarea.

Esta constatación describe el estado físico actual; no autoriza modificarlo aquí.

---

#### 57. Diagnóstico de la implementación NEXO vigente

En el snapshot revisado de `vento-nexo`, `createEntry`:

- crea entradas propias;
- acepta una procedencia declarada;
- inserta líneas y movimientos;
- actualiza proyecciones de inventario y costos;
- puede afectar cantidades recibidas de orden según el flujo legacy;
- utiliza varias operaciones sucesivas.

Ese flujo físico existente no demuestra por sí solo:

- consumo idempotente del `VPROC-0022.EVT-004`;
- inbox durable por evento fuente;
- identidad hija de efecto físico correlacionada con la recepción ORIGO;
- recuperación del mismo resultado ante replay;
- separación completa del write ownership objetivo.

La implementación futura debe converger al contrato aprobado sin declarar como canónica la semántica legacy.

---

#### 58. Diagnóstico de NUMERA preservado

La fundación física vigente de NUMERA no sustituye el contrato de `VPROC-0051` definido por `INT-PROC-004`.

Para esta tarea se conserva la decisión:

- NUMERA debe consumir el hecho económico por identidad de fuente;
- un replay no crea otro hecho;
- los gastos o registros manuales no pueden convertirse en fuente competidora de la misma recepción;
- la materialización física del consumidor queda en sus tareas de dominio, integración, base de datos y paquete correspondientes.

---

#### 59. Brechas físicas con propietario documental existente

No se crea una tarea de brecha nueva.

Las necesidades de implementación ya poseen propietarios canónicos:

| Necesidad futura                                                 | Propietario existente                          |
| ---------------------------------------------------------------- | ---------------------------------------------- |
| Idempotencia transversal de comando y evento                     | `INT-APP-004`, `TREQ-INTEGRATION-003`          |
| Reintento y resultado desconocido                                | `INT-APP-005`, `INT-APP-008`, `INT-APP-009`    |
| Auditoría de intentos y efectos                                  | `INT-APP-007` y tareas de auditoría aplicables |
| Prohibición de escritura cruzada                                 | `INT-APP-010`                                  |
| Constraints, claims, outbox, inbox, transacciones y persistencia | `INT-DB-*`, BLOQUES E3 y R                     |
| Colas, workers y observabilidad física                           | BLOQUE E4                                      |
| Implementación ORIGO de recepción                                | tareas ORIGO y paquete E5 aplicable            |
| Implementación NEXO de ledger e ingreso                          | tareas NEXO y paquete E5 aplicable             |
| Hechos económicos de compras y recepción                         | `NUMERA-DOM-003` y paquete E5 aplicable        |
| Auditoría de duplicidades y fuentes competidoras                 | `SUPA-AUD-019`, `SUPA-AUD-023`                 |

---

#### 60. Prohibición de escrituras cruzadas como mecanismo de deduplicación

No se permite resolver duplicidad haciendo que una aplicación edite directamente el estado propietario de otra.

En el objetivo:

- ORIGO no “marca consumido” un movimiento NEXO mediante escritura directa;
- NEXO no corrige la recepción comercial ORIGO mediante escritura directa;
- NUMERA no reescribe la recepción ni el movimiento físico;
- las confirmaciones regresan mediante contrato, evento, comando autorizado o proyección acordada;
- cada propietaria conserva su ledger o estado y su propio registro de deduplicación.

---

#### 61. Flujo nominal de primera aplicación

```text
1. INTENCIÓN DE RECEPCIÓN
2. CLIENTE CREA CLAVE ESTABLE
3. ORIGO AUTORIZA Y RECLAMA CLAVE
4. ORIGO CREA VPROC-0022 UNA SOLA VEZ
5. ORIGO PERSISTE RESULTADO
6. ORIGO EMITE HITOS DURABLES
7. NEXO DEDUPLICA HANDOFF
8. NEXO APLICA CADA EFECTO FÍSICO UNA SOLA VEZ
9. NUMERA DEDUPLICA EVENTO FUENTE
10. NUMERA APLICA CADA EFECTO ECONÓMICO UNA SOLA VEZ
11. CONCILIACIÓN VERIFICA ORÍGENES Y EFECTOS
12. CIERRE CONSERVA TRAZABILIDAD COMPLETA
```

---

#### 62. Flujo nominal de replay

```text
MISMA INTENCIÓN
+ MISMA CLAVE
+ MISMA HUELLA
        ↓
CLAIM YA EXISTENTE
        ↓
RESULTADO DURABLE LOCALIZADO
        ↓
DUPLICATE_RESULT_RETURNED
        ↓
MISMO IDENTIFICADOR EMPRESARIAL
        ↓
CERO EFECTOS ADICIONALES
```

---

#### 63. Flujo nominal de conflicto

```text
MISMA CLAVE
+ CONTENIDO INCOMPATIBLE
        ↓
CONFLICTING_REUSE
        ↓
CERO MUTACIÓN NUEVA
        ↓
USUARIO O SISTEMA CORRIGE LA INTENCIÓN
        ↓
NUEVA OPERACIÓN SOLO SI EL HECHO REAL ES DISTINTO
```

---

#### 64. Flujo nominal de resultado incierto

```text
TIMEOUT / RESPUESTA PERDIDA / FALLO INTERMEDIO
        ↓
NO CREAR OTRA CLAVE
        ↓
CONSULTAR RESULTADO DE LA MISMA OPERACIÓN
        ↓
APPLIED / DUPLICATE_RESULT_RETURNED
O
IN_PROGRESS_RECOVERABLE
O
RECONCILIATION_REQUIRED
```

---

#### 65. Flujo nominal de segunda entrega real de la misma orden

```text
MISMA ORDEN
+ NUEVA ENTREGA REAL
        ↓
NUEVA INTENCIÓN EMPRESARIAL
        ↓
NUEVA CLAVE
        ↓
NUEVA INSTANCIA VPROC-0022
        ↓
EFECTOS FÍSICOS Y ECONÓMICOS PROPIOS
        ↓
MISMA CORRELACIÓN SUPERIOR DE ABASTECIMIENTO CUANDO APLIQUE
```

---

#### 66. Flujo de corrección

```text
RECEPCIÓN ORIGINAL CONFIRMADA
        ↓
ERROR DEMOSTRADO
        ↓
ACCIÓN CCR AUTORIZADA
        ↓
OPERACIÓN CORRECTIVA CON IDENTIDAD PROPIA
        ↓
EFECTOS INVERSOS / REEXPRESADOS VINCULADOS
        ↓
ORIGINAL INMUTABLE Y AUDITABLE
```

---

#### 67. Invariantes end-to-end

1. Una misma `idempotency_key` no produce dos resultados empresariales incompatibles.
2. Un replay no crea una nueva instancia de recepción.
3. Una nueva entrega real no se bloquea por compartir orden o proveedor.
4. Un documento no sustituye la identidad de recepción.
5. Un movimiento NEXO tiene una identidad de efecto correlacionada y no se aplica dos veces.
6. Una proyección no se incrementa sin movimiento correlacionado.
7. Un evento fuente NUMERA no produce dos hechos económicos equivalentes.
8. `EVT-006` de ORIGO no duplica el efecto económico ya iniciado por `EVT-005`.
9. Una corrección no borra el original.
10. Un timeout no se interpreta como fracaso empresarial.
11. Un ACK técnico no se interpreta como efecto aplicado.
12. Una clave conocida no sustituye autorización.
13. Una similitud heurística no autoriza deduplicación destructiva.
14. Cada discrepancia conserva dueño, evidencia y resolución.
15. Ninguna aplicación obtiene propiedad de datos ajenos por participar en la conciliación.

---

#### 68. Casos de aceptación obligatorios

La implementación futura deberá demostrar, al menos:

1. doble submit simultáneo con misma clave y payload;
2. retry después de respuesta perdida con commit confirmado;
3. misma clave con cantidad distinta;
4. misma orden con dos recepciones parciales reales;
5. mismo proveedor y factura con identidades empresariales distintas que requieren revisión, sin fusión automática;
6. reentrega de `VPROC-0022.EVT-004` a NEXO;
7. reentrega de `VPROC-0022.EVT-005` a NUMERA;
8. `VPROC-0022.EVT-006` después del efecto económico ya creado;
9. reentrega de `VPROC-0024.EVT-006` como evidencia;
10. dos consumers concurrentes para el mismo evento;
11. timeout con resultado desconocido;
12. evento fuera de orden;
13. evento tardío con periodo cerrado o cambiado;
14. corrección reintentada dos veces;
15. reversa reintentada dos veces;
16. recepción sin orden bajo carril permitido;
17. conversión de modalidad sin duplicar recepción ni efectos;
18. recuperación después de efecto físico aplicado y respuesta perdida;
19. recuperación después de hecho económico aplicado y respuesta perdida;
20. conciliación de efecto huérfano sin fabricar fuente.

---

#### 69. Criterios de aceptación documental

La tarea queda documentalmente completa cuando:

- existe una identidad propietaria única para cada recepción `VPROC-0022`;
- queda separada la identidad de recepción de la orden, factura y proveedor;
- queda definida la idempotencia de creación;
- quedan definidos replay, conflicto, concurrencia y resultado desconocido;
- quedan preservadas recepciones parciales legítimas;
- queda definida la deduplicación ORIGO → NEXO;
- queda definida la identidad de efecto físico;
- queda definida la deduplicación ORIGO → NUMERA;
- queda definida la relación entre los hitos `EVT-005` y `EVT-006` de ORIGO;
- queda preservada la frontera con `VPROC-0052`;
- quedan definidas corrección, `VOID`, reversa y reexpresión;
- queda definida la conciliación de huérfanos, dobles efectos y resultados inciertos;
- las brechas físicas quedan vinculadas a propietarios existentes;
- no se realizan cambios físicos;
- no se crea un requisito de prueba redundante.

---

#### 70. Diseños explícitamente rechazados

Quedan rechazados como solución canónica:

- `UNIQUE(invoice_number)` como único control de recepción;
- `UNIQUE(purchase_order_id)` para impedir duplicados;
- deduplicar únicamente en frontend;
- deshabilitar el botón después del primer click como garantía empresarial;
- generar una clave nueva en cada retry;
- confiar solo en `source_app` enviado por formulario;
- confiar solo en ACK de HTTP, cola o webhook;
- detectar duplicado consultando únicamente la proyección de stock;
- borrar una fila duplicada después de que produjo efectos sin compensación;
- permitir que ORIGO y NEXO creen ambos el mismo movimiento físico;
- permitir que ORIGO y NUMERA creen ambos el mismo hecho económico;
- convertir una corrección en una segunda recepción ordinaria sin vínculo;
- fusionar automáticamente dos recepciones por semejanza de campos;
- tratar una recepción parcial legítima como replay de otra parcial;
- considerar “exactly once transport” como sustituto de idempotencia de negocio.

---

#### 71. Estado objetivo por aplicación

| Aplicación        | Propiedad                                   | Control objetivo                                                                          |
| ----------------- | ------------------------------------------- | ----------------------------------------------------------------------------------------- |
| ORIGO             | recepción comercial/documental `VPROC-0022` | una instancia por recepción real; creación y acciones idempotentes; resultado recuperable |
| NEXO              | ingreso, ubicación y custodia `VPROC-0024`  | deduplicación por evento y efecto físico; un movimiento por identidad de efecto           |
| NUMERA            | hecho económico `VPROC-0051`                | una aplicación por fuente económica; replay recupera el mismo resultado                   |
| SHELL / fundación | contratos y servicios compartidos           | identidad, tipos, auditoría, autorización y herramientas comunes sin apropiarse del hecho |

---

#### 72. Estado de implementación tras esta tarea

El resultado de `INT-PROC-005` es `ESPECIFICADO` documentalmente.

No se declara:

- `IMPLEMENTADO` para el control end-to-end;
- `VALIDADO` operativamente;
- `VERIFICADO` mediante fallos inyectados;
- desplegado en ambientes remotos;
- materializado en Supabase;
- activo en ORIGO, NEXO o NUMERA como contrato físico completo.

La implementación requiere las tareas técnicas y paquetes ya asignados por el plan.

---

#### 73. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

Justificación: el comportamiento sustantivo de esta tarea ya está exigido por requisitos vigentes que cubren recepción única e idempotente, replay sin segunda suma, movimientos de inventario no duplicados, hechos económicos con identidad estable, operación asíncrona con clave y huella, captura única en la propietaria, integración financiera idempotente, autorización de mutaciones y auditoría correlacionable. Crear otra fila repetiría conductas ya protegidas sin añadir un riesgo o criterio de aceptación materialmente distinto.

---

#### 74. Cobertura de prueba existente preservada

La implementación y certificación futuras conservan, entre otros, estos requisitos ya vigentes:

- `TREQ-ORIGO-001`;
- `TREQ-ORIGO-003`;
- `TREQ-NEXO-011`;
- `TREQ-NUMERA-001`;
- `TREQ-NUMERA-002`;
- `TREQ-NUMERA-003`;
- `TREQ-INTEGRATION-003`;
- `TREQ-INTEGRATION-004`;
- `TREQ-INTEGRATION-005`;
- `TREQ-INTEGRATION-006`;
- `TREQ-INTEGRATION-016`;
- `TREQ-INTEGRATION-017`;
- `TREQ-AUTH-013`;
- `TREQ-AUTH-015`.

Esta tarea no modifica estado, texto, relación ni propietario de esas filas.

---

#### 75. Cambios físicos

No se crean ni modifican:

- código de `vento-origo`, `vento-nexo` o `vento-numera`;
- tablas;
- constraints;
- índices;
- RPC;
- funciones;
- triggers;
- RLS;
- grants;
- Realtime;
- Storage;
- Edge Functions;
- migraciones;
- datos;
- tipos generados;
- colas;
- workers;
- secretos;
- despliegues.

---

#### 76. Continuidad

**ÚLTIMA TAREA APROBADA**  
`INT-PROC-004 — Definir contrato para que NUMERA reciba el evento económico`

**TAREA ACTUAL APROBADA**  
`INT-PROC-005 — Definir control que evite una recepción duplicada`

**SIGUIENTE TAREA RESERVADA**  
`INT-PROD-001 — Definir contrato para que FOGO solicite o reserve insumos`


FOGO ↔ NEXO
