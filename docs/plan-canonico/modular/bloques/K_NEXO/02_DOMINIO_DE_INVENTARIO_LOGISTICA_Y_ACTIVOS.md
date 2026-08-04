### MINI-BLOQUE — DOMINIO DE INVENTARIO LOGISTICA Y ACTIVOS

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **dominio de inventario logistica y activos** dentro de **K NEXO**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `NEXO-DOM-001` a `NEXO-DOM-038` — 38 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Límites funcionales:** comienza con “Clasificar consumibles, stock por cantidad, reutilizables, activos serializados, repuestos, kits y contenedores” y concluye con “Definir novedades locativas, severidad, contención, escalamiento, resolución y cierre”.
<!-- PLAN-SECTION-META:END -->

### ✅ NEXO-DOM-001 — Clasificar consumibles, stock por cantidad, reutilizables, activos serializados, repuestos, kits y contenedores

**Estado:** APROBADA
**Tarea anterior:** `AUTH-ERR-020 — Compartir mensajes desde vento-shell` — APROBADA
**Tarea siguiente:** `NEXO-UX-001 — Inventariar procesos reales de inventario y logística` — RESERVADA
**Tipo de tarea:** documental; definición contractual, taxonómica, funcional, de comportamiento, transición y reconciliación física de las clases canónicas de control para inventario, activos, reutilizables, repuestos, kits y contenedores de NEXO
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/K_NEXO/02_DOMINIO_DE_INVENTARIO_LOGISTICA_Y_ACTIVOS.md`
**Artefactos producidos:** `NEXO-INVENTORY-CLASSIFICATION-CONTRACT-001`, `NEXO-INVENTORY-CLASS-DECISION-MATRIX-001`, `NEXO-INVENTORY-CLASS-BEHAVIOR-MATRIX-001`, `NEXO-INVENTORY-CLASS-LEGACY-CROSSWALK-001` y `NEXO-INVENTORY-CLASS-PHYSICAL-RECONCILIATION-001`
**Decisiones consumidas:** `CAP-SCOPE-004`; `CAP-SCOPE-006`; `CAP-SCOPE-007`; `CODE-AUD-011`; `TREQ-NEXO-011` a `TREQ-NEXO-016`; extensión canónica de NEXO; contratos vigentes de producto, presentación, unidad, existencia, lote, serial, LOC, LPN, activos, mantenimiento, remisiones, autorización y transición; estado remoto y desplegado inspeccionado; contrato documental vigente
**Cambios físicos autorizados:** ninguno; no modifica productos, perfiles, categorías, stock, activos, grupos, LPN, movimientos, remisiones, Supabase, tablas, constraints, funciones, RLS, datos, migraciones, código, paquetes, aplicaciones ni despliegues

---

#### 1. Propósito

Definir una clasificación única, completa y verificable para que NEXO no trate
como equivalentes objetos físicos con ciclos de vida incompatibles.

La regla raíz queda:

```text
OBJETO FÍSICO O IDENTIDAD MAESTRA
+
HECHOS OPERATIVOS CONCLUYENTES
+
UNA CLASE PRIMARIA DE CONTROL
+
DIMENSIONES SECUNDARIAS EXPLÍCITAS
→
COMPORTAMIENTO DETERMINISTA
PARA SALDO, IDENTIDAD, MOVIMIENTO, CONTEO, CUSTODIA,
MANTENIMIENTO, REMISIÓN, LPN Y CONCILIACIÓN
```

La tarea impide que una sola etiqueta como `ingredient`, `finished`, `resale`
o `asset` decida simultáneamente:

- si existe saldo;
- si una unidad se consume o debe retornar;
- si requiere identidad individual;
- si admite serial, lote o vencimiento;
- si necesita custodia o mantenimiento;
- si puede instalarse como repuesto;
- si representa una composición;
- si contiene otros objetos;
- si puede vincularse con un LPN;
- cómo participa en remisiones y conteos.

---

#### 2. Resultado material

Se aprueban cinco artefactos documentales completos:

1. `NEXO-INVENTORY-CLASSIFICATION-CONTRACT-001`, que congela siete clases
   primarias, sus invariantes, estados y dimensiones independientes;
2. `NEXO-INVENTORY-CLASS-DECISION-MATRIX-001`, que decide veintiocho escenarios
   y elimina solapamientos entre consumo, cantidad, reutilización, identidad,
   instalación, composición y contención;
3. `NEXO-INVENTORY-CLASS-BEHAVIOR-MATRIX-001`, que materializa el comportamiento
   por clase para saldo, movimiento, conteo, reserva, custodia, mantenimiento,
   remisión, LPN y costo;
4. `NEXO-INVENTORY-CLASS-LEGACY-CROSSWALK-001`, que reconcilia los 963 productos
   físicos observados por cohortes sin convertir heurísticas en aprobación;
5. `NEXO-INVENTORY-CLASS-PHYSICAL-RECONCILIATION-001`, que registra veinte
   brechas físicas y su destino canónico.

Cobertura materializada:

| Elemento                                  | Cantidad |
| ----------------------------------------- | -------: |
| Clases primarias canónicas                |        7 |
| Dimensiones secundarias obligatorias      |       12 |
| Escenarios con decisión explícita         |       28 |
| Cohortes legacy reconciliadas             |        6 |
| Productos físicos observados              |      963 |
| Productos activos observados              |      950 |
| Perfiles de inventario observados         |      963 |
| Productos sin perfil observados           |        0 |
| Perfiles legacy `unclassified` observados |        0 |
| Productos legacy `asset` observados       |      169 |
| Filas de activo individual observadas     |       38 |
| Grupos reutilizables observados           |       90 |
| LPN observados                            |        0 |
| Contenidos de LPN observados              |        0 |
| Perfiles de presentación observados       |    1.190 |
| Brechas físicas registradas               |       20 |
| Requisitos de prueba derivados            |       10 |

Las cifras físicas describen el corte inspeccionado y no aprueban una
clasificación producto por producto.

---

#### 3. Decisión taxonómica principal

Se congelan exactamente siete clases primarias:

```text
CONSUMABLE
QUANTITY_STOCK
REUSABLE_QUANTITY
SERIALIZED_ASSET
SPARE_PART
KIT
PHYSICAL_CONTAINER
```

Cada identidad física gestionada por NEXO deberá poseer exactamente una clase
primaria activa para un mismo período de vigencia.

```text
ACTIVE_PRIMARY_CLASS_COUNT = 1
```

No se admite:

- cero clases para una identidad habilitada operativamente;
- dos clases primarias simultáneas;
- una clase inferida únicamente desde nombre o categoría;
- una clase local diferente por aplicación;
- utilizar `product_type` como sustituto;
- utilizar `inventory_kind` legacy como contrato final;
- usar presentación, unidad, lote, serial, LOC, LPN o estado como clase.

Un servicio o elemento no físico queda fuera de estas siete clases y utiliza
su contrato no inventariable; no se le fabrica una existencia.

---

#### 4. Clase primaria y dimensiones secundarias

La clase primaria define el modelo de control físico. No absorbe otras
propiedades.

Se mantienen separadas doce dimensiones:

1. identidad maestra;
2. rol empresarial;
3. presentación;
4. unidad y familia de medida;
5. granularidad de identidad física;
6. lote y vencimiento;
7. serial, placa o código individual;
8. ubicación;
9. custodia y responsable;
10. condición y disponibilidad;
11. propiedad y tratamiento económico;
12. pertenencia a LPN, kit o contenedor.

Ejemplos de separaciones obligatorias:

```text
CLASE PRIMARIA ≠ CATEGORÍA
CLASE PRIMARIA ≠ PRODUCT_TYPE
CLASE PRIMARIA ≠ PRESENTACIÓN
CLASE PRIMARIA ≠ UNIDAD
CLASE PRIMARIA ≠ LOTE
CLASE PRIMARIA ≠ LPN
CLASE PRIMARIA ≠ ESTADO CONTABLE
```

Una identidad puede ser comprable, almacenable, vendible, ingrediente o
suministrable sin cambiar automáticamente de clase primaria.

---

#### 5. Ámbito de clasificación

La clasificación se aplica a:

- identidades maestras que producen saldo por cantidad;
- consumibles operativos;
- productos comprados, producidos o revendidos;
- empaques consumibles;
- vajilla, cubiertos, herramientas y decoración reutilizable;
- equipos, mobiliario y herramientas individualizables;
- repuestos de mantenimiento;
- definiciones e instancias de kit;
- contenedores físicos permanentes o retornables;
- objetos transportados o vinculados a remisiones;
- contenido representado dentro de LPN.

No clasifica como objeto físico:

- servicios;
- permisos;
- rutas de aplicación;
- recetas;
- órdenes o documentos;
- LOC;
- posiciones;
- LPN como identidad logística;
- lotes;
- movimientos;
- custodios;
- proveedores;
- centros de costo.

---

#### 6. Fuente de verdad y gobierno

NEXO es propietario de la clase primaria y del comportamiento físico derivado.

Las fronteras quedan:

| Dominio | Propiedad                                                                                                |
| ------- | -------------------------------------------------------------------------------------------------------- |
| NEXO    | clase primaria, existencia, identidad física, ubicación, condición, custodia, movimientos y conciliación |
| ORIGO   | necesidad, compra, proveedor, presentación de compra, recepción empresarial y condiciones comerciales    |
| FOGO    | receta, ejecución productiva, consumo y salida productiva                                                |
| PULSO   | oferta, venta, devolución y hecho comercial                                                              |
| NUMERA  | valoración, gasto, activo contable, depreciación y efecto económico aprobado                             |
| VISO    | administración y supervisión autorizadas; no fuente independiente de clasificación                       |
| SHELL   | contratos compartidos, tipos, transición, integridad, migraciones y evidencia técnica                    |

Ningún consumidor podrá crear una clase local o reinterpretar la clase mediante
una categoría visual.

---

#### 7. `NEXO-INVENTORY-CLASSIFICATION-CONTRACT-001`

Forma conceptual:

```ts
type NexoPrimaryControlClass =
  | "CONSUMABLE"
  | "QUANTITY_STOCK"
  | "REUSABLE_QUANTITY"
  | "SERIALIZED_ASSET"
  | "SPARE_PART"
  | "KIT"
  | "PHYSICAL_CONTAINER";

type NexoClassificationStatus =
  | "PROPOSED"
  | "APPROVED"
  | "RETIRED";

type NexoInventoryClassification = {
  subject_type: "PRODUCT_MASTER" | "KIT_DEFINITION" | "PHYSICAL_MODEL";
  subject_id: string;
  primary_class: NexoPrimaryControlClass;
  status: NexoClassificationStatus;
  version: number;
  effective_from: string;
  effective_to: string | null;
  decision_basis_code: string;
  approved_by: string;
  approved_at: string;
  supersedes_version: number | null;
};
```

La forma física futura podrá variar, pero deberá conservar los mismos
invariantes, historial y capacidad de reproducción.

---

#### 8. `CONSUMABLE`

Definición:

```text
SUMINISTRO FÍSICO
+
USO OPERATIVO IRREVERSIBLE
+
NO SE ESPERA DEVOLUCIÓN
+
NO SE TRANSFORMA EN PRODUCTO VENDIBLE O PREPARACIÓN
→ CONSUMABLE
```

Ejemplos típicos:

- químicos y elementos de aseo;
- bolsas de basura;
- elementos de protección desechables;
- papelería o suministros operativos agotables;
- textiles o implementos expresamente desechables;
- consumibles de equipo que no son repuesto instalado.

Reglas:

- se controla por cantidad cuando la política lo exige;
- el uso emite consumo y reduce saldo;
- no genera obligación de devolución;
- puede usar lote, vencimiento o condición cuando sea necesario;
- no se convierte en activo por tener valor unitario alto;
- no se convierte en repuesto por utilizarse durante mantenimiento;
- un empaque desechable puede pertenecer aquí cuando su uso sea operativo y no
  requiera el tratamiento de componente de producto.

---

#### 9. `QUANTITY_STOCK`

Definición:

```text
EXISTENCIA FUNGIBLE O EQUIVALENTE
+
SALDO EXPRESADO EN UNIDAD CANÓNICA
+
ENTRADA, TRANSFORMACIÓN, VENTA, CONSUMO O TRASLADO
→ QUANTITY_STOCK
```

Incluye, según sus roles secundarios:

- ingredientes;
- empaques que forman parte de un producto o despacho;
- preparaciones intermedias almacenables;
- productos terminados;
- mercancía de reventa;
- materiales generales que no pertenecen a otra clase específica.

Reglas:

- la identidad autoritativa es producto más dimensiones de existencia;
- admite cantidad discreta, masa o volumen;
- presentación y unidad permanecen separadas;
- puede exigir lote, vencimiento, condición o FEFO;
- puede reservarse, dividirse y participar en LPN;
- no posee custodia individual;
- una unidad física no adquiere historia individual solo por ser contada.

---

#### 10. `REUSABLE_QUANTITY`

Definición:

```text
UNIDADES EQUIVALENTES
+
USO REPETIDO
+
SE ESPERA RETORNO O PERMANENCIA
+
EL CONTEO POR CANTIDAD ES SUFICIENTE
+
NO SE JUSTIFICA HISTORIA INDIVIDUAL
→ REUSABLE_QUANTITY
```

Ejemplos típicos:

- vajilla repetida;
- cubiertos;
- bandejas de servicio equivalentes;
- decoración repetida;
- herramientas simples equivalentes;
- elementos retornables cuyo control individual no aporta valor razonable.

Reglas:

- conserva saldo por cantidad y condición;
- entrega, préstamo, traslado y devolución no son consumo;
- daño, pérdida y retiro reducen cantidad utilizable mediante eventos;
- puede conservar cantidad esperada y observada;
- no usa serial ni placa por unidad;
- no se mezcla simultáneamente con `asset_items` para la misma existencia;
- si una unidad requiere historia individual, la identidad correspondiente se
  reclasifica mediante transición controlada a `SERIALIZED_ASSET`.

---

#### 11. `SERIALIZED_ASSET`

Definición:

```text
UNIDAD FÍSICA INDIVIDUAL
+
HISTORIA, CUSTODIA O RIESGO PROPIOS
+
IDENTIFICADOR ESTABLE POR INSTANCIA
→ SERIALIZED_ASSET
```

Se utiliza cuando una o más de estas condiciones son verdaderas:

- serial, placa, QR o código individual requerido;
- mantenimiento por unidad;
- garantía o seguro individual;
- valor o criticidad relevante;
- calibración, inspección o certificación por unidad;
- custodia o préstamo individual;
- condición o disponibilidad independiente;
- trazabilidad de pérdida, baja o disposición por unidad.

Reglas:

- el modelo o producto no es el activo físico;
- cada instancia tiene identidad inmutable;
- ubicación, custodia, condición, disponibilidad y mantenimiento son
  independientes;
- el QR puede reemitirse sin crear un activo nuevo;
- no se representa como cantidad fungible en stock ordinario;
- un traslado identifica exactamente las instancias afectadas.

---

#### 12. `SPARE_PART`

Definición:

```text
EXISTENCIA DESTINADA A MANTENIMIENTO O REPARACIÓN
+
PERMANECE EN STOCK HASTA RESERVA, CONSUMO O INSTALACIÓN
→ SPARE_PART
```

Reglas:

- posee saldo, ubicación, presentación y unidad;
- puede exigir lote, serial o compatibilidad técnica;
- se reserva para una orden de trabajo o activo cuando corresponda;
- instalarlo consume o transfiere la existencia mediante evento correlacionado;
- el texto libre de “pieza reemplazada” no sustituye el movimiento;
- no se convierte automáticamente en activo instalado;
- un componente instalado adquiere identidad individual solo si la política de
  trazabilidad lo exige;
- una pieza retirada conserva disposición, retorno, reparación o descarte
  separados.

---

#### 13. `KIT`

Definición:

```text
COMPOSICIÓN APROBADA
+
REGLAS DE COMPLETITUD
+
COMPONENTES IDENTIFICABLES
→ KIT
```

Se distinguen:

```text
KIT_DEFINITION
→ composición, cantidades, sustituciones y reglas

KIT_INSTANCE
→ conjunto real, estado, ubicación, responsable y completitud
```

Reglas:

- un kit no es un LPN;
- un kit puede transportarse dentro de un LPN;
- sus componentes conservan sus clases e identidades;
- la instancia no duplica el saldo de los componentes;
- ensamblar, completar, sustituir, desarmar o cerrar son eventos;
- un kit incompleto no se presenta como disponible;
- un componente puede pertenecer temporalmente a una sola instancia cuando la
  definición lo exija;
- un “combo” comercial no es kit físico por inferencia.

---

#### 14. `PHYSICAL_CONTAINER`

Definición:

```text
OBJETO DURABLE O RETORNABLE
+
FUNCIÓN PRIMARIA DE CONTENER, PROTEGER O TRANSPORTAR
+
IDENTIDAD Y CICLO DE VIDA PROPIOS
→ PHYSICAL_CONTAINER
```

Ejemplos típicos:

- canastillas retornables;
- cajas plásticas durables;
- bins y totes;
- carros, racks o casetes de transporte;
- recipientes permanentes controlados por capacidad y condición.

Reglas:

- cada instancia controlada posee identidad estable;
- capacidad, condición, ubicación, custodia y disponibilidad son propias;
- puede vincularse temporal o persistentemente con un LPN;
- el vínculo no fusiona identidades;
- un empaque desechable no pertenece aquí;
- un recipiente genérico sin necesidad de identidad individual se clasifica
  como `REUSABLE_QUANTITY`;
- el contenido no forma parte del valor de existencia del contenedor;
- mover el contenedor solo mueve contenido cuando un contrato de vínculo válido
  lo determina.

---

#### 15. Árbol de decisión obligatorio

El orden de clasificación es:

```text
1. ¿ES UN OBJETO FÍSICO INVENTARIABLE O CONTROLABLE?
   NO → fuera de estas siete clases

2. ¿SU FUNCIÓN PRIMARIA ES CONTENER Y TIENE IDENTIDAD DURABLE PROPIA?
   SÍ → PHYSICAL_CONTAINER

3. ¿REPRESENTA UNA COMPOSICIÓN CON REGLAS DE COMPLETITUD?
   SÍ → KIT

4. ¿SE ADQUIERE O CONSERVA PARA INSTALARSE EN MANTENIMIENTO?
   SÍ → SPARE_PART

5. ¿SE ESPERA REUTILIZACIÓN O DEVOLUCIÓN DESPUÉS DEL USO?
   SÍ →
      ¿REQUIERE HISTORIA INDIVIDUAL?
      SÍ → SERIALIZED_ASSET
      NO → REUSABLE_QUANTITY

6. ¿SE AGOTA IRREVERSIBLEMENTE EN APOYO A LA OPERACIÓN,
   SIN CONVERTIRSE EN PRODUCTO, PREPARACIÓN O MERCANCÍA?
   SÍ → CONSUMABLE

7. ¿SE CONTROLA COMO EXISTENCIA FUNGIBLE PARA COMPRA, PRODUCCIÓN,
   VENTA, CONSUMO O TRASLADO?
   SÍ → QUANTITY_STOCK

8. NINGUNA RESPUESTA CONCLUYENTE
   → PROPOSED o revisión requerida; no habilitar comportamiento dependiente
```

La primera coincidencia deberá validarse contra exclusiones y evidencia; no se
clasifica por orden de consulta física de filas.

---

#### 16. `NEXO-INVENTORY-CLASS-DECISION-MATRIX-001`

|    # | Escenario                                                             | Resultado                                                                  |
| ---: | --------------------------------------------------------------------- | -------------------------------------------------------------------------- |
|    1 | servicio o derecho sin existencia física                              | fuera de las siete clases                                                  |
|    2 | ingrediente medible consumido por receta                              | `QUANTITY_STOCK`                                                           |
|    3 | preparación intermedia almacenada                                     | `QUANTITY_STOCK`                                                           |
|    4 | producto terminado inventariable                                      | `QUANTITY_STOCK`                                                           |
|    5 | mercancía de reventa                                                  | `QUANTITY_STOCK`                                                           |
|    6 | empaque incorporado al producto o despacho                            | `QUANTITY_STOCK`                                                           |
|    7 | químico de limpieza agotable                                          | `CONSUMABLE`                                                               |
|    8 | bolsa de basura o EPP desechable                                      | `CONSUMABLE`                                                               |
|    9 | vajilla equivalente controlada por conteo                             | `REUSABLE_QUANTITY`                                                        |
|   10 | decoración repetida sin historia individual                           | `REUSABLE_QUANTITY`                                                        |
|   11 | herramienta simple equivalente con devolución por cantidad            | `REUSABLE_QUANTITY`                                                        |
|   12 | equipo con mantenimiento y serial                                     | `SERIALIZED_ASSET`                                                         |
|   13 | mueble con custodia e historia individual                             | `SERIALIZED_ASSET`                                                         |
|   14 | instrumento sujeto a calibración                                      | `SERIALIZED_ASSET`                                                         |
|   15 | pieza almacenada para reparación                                      | `SPARE_PART`                                                               |
|   16 | pieza instalada sin trazabilidad individual adicional                 | consumo de `SPARE_PART` más relación de instalación                        |
|   17 | pieza instalada que requiere serial e historia                        | consumo de `SPARE_PART` más nueva identidad o relación individual aprobada |
|   18 | conjunto de herramientas con lista de componentes                     | `KIT`                                                                      |
|   19 | combo comercial sin conjunto físico estable                           | no `KIT`; contrato comercial propietario                                   |
|   20 | canastilla durable identificada                                       | `PHYSICAL_CONTAINER`                                                       |
|   21 | caja o bolsa desechable                                               | `CONSUMABLE` o `QUANTITY_STOCK` según su rol, nunca contenedor permanente  |
|   22 | bandeja durable equivalente sin identidad individual                  | `REUSABLE_QUANTITY`                                                        |
|   23 | LPN sin contenedor físico asociado                                    | LPN válido; no crea `PHYSICAL_CONTAINER`                                   |
|   24 | LPN vinculado con canastilla identificada                             | dos identidades relacionadas, no fusionadas                                |
|   25 | producto legacy `asset` con item y grupo simultáneos                  | conflicto; clasificación no aprobable hasta reconciliación                 |
|   26 | producto legacy `asset` sin item ni grupo                             | modelo incompleto; revisión obligatoria                                    |
|   27 | nombre o categoría sugiere una clase, pero no hay evidencia operativa | no clasificar automáticamente                                              |
|   28 | cambio de política exige otra clase                                   | nueva versión y transición reconciliada; no sobrescritura                  |

Los veintiocho escenarios tienen resultado explícito y no permiten fallback a
la etiqueta legacy.

---

#### 17. Granularidad de identidad

La granularidad queda:

| Clase                | Granularidad primaria                                        |
| -------------------- | ------------------------------------------------------------ |
| `CONSUMABLE`         | cantidad fungible o equivalente                              |
| `QUANTITY_STOCK`     | cantidad fungible, con dimensiones de existencia             |
| `REUSABLE_QUANTITY`  | cantidad de unidades equivalentes recuperables               |
| `SERIALIZED_ASSET`   | una identidad por unidad física                              |
| `SPARE_PART`         | cantidad o serial según política de la pieza                 |
| `KIT`                | definición y, cuando se materializa, identidad por instancia |
| `PHYSICAL_CONTAINER` | una identidad por contenedor controlado                      |

La clasificación no impide cantidades fraccionarias cuando la unidad y la clase
lo admitan. La granularidad individual no implica que el objeto posea un serial
de fabricante; puede utilizar un código interno estable.

---

#### 18. Roles secundarios

La clase primaria no reemplaza roles como:

```text
PURCHASABLE
PRODUCIBLE
INGREDIENT
PACKAGING_COMPONENT
SELLABLE
TRANSFERABLE
RETURNABLE
MAINTENANCE_INPUT
COLD_CHAIN_CONTROLLED
LOT_CONTROLLED
EXPIRY_CONTROLLED
QUALITY_CONTROLLED
```

Una identidad puede tener varios roles compatibles.

Ejemplos:

- un ingrediente es `QUANTITY_STOCK` y `INGREDIENT`;
- una bebida comprada para reventa es `QUANTITY_STOCK` y `SELLABLE`;
- una canastilla es `PHYSICAL_CONTAINER` y `RETURNABLE`;
- una pieza es `SPARE_PART` y `MAINTENANCE_INPUT`;
- una vajilla por cantidad es `REUSABLE_QUANTITY` y `RETURNABLE`.

Los roles no permiten dos clases primarias simultáneas.

---

#### 19. Presentación, unidad, lote y serial

Reglas obligatorias:

1. la presentación describe cómo se compra, solicita, recibe, almacena o
   transporta;
2. la unidad expresa la magnitud de saldo;
3. el lote identifica procedencia o fabricación compartida;
4. el vencimiento pertenece a una existencia o lote;
5. el serial identifica una instancia, no el producto maestro;
6. un pack no crea una clase;
7. una caja de unidades no se convierte en contenedor permanente por su forma;
8. un producto con varias presentaciones conserva una clase primaria salvo que
   existan identidades físicas con ciclos incompatibles;
9. una conversión no cambia consumo, retorno, custodia o mantenimiento;
10. una presentación abierta no crea una nueva identidad maestra.

Si el mismo nombre comercial cubre ciclos incompatibles, se separan identidades
maestras o variantes físicas gobernadas; no se fuerza una clase múltiple.

---

#### 20. Ubicación, custodia, condición y disponibilidad

Cada dimensión se resuelve independientemente:

```text
UBICACIÓN
→ dónde está

CUSTODIA
→ quién responde por su tenencia

CONDICIÓN
→ estado físico observado

DISPONIBILIDAD
→ si puede utilizarse para el propósito actual
```

Reglas:

- cantidad en LOC no prueba disponibilidad;
- custodio no prueba propiedad;
- condición buena no prueba que esté libre;
- ubicación no crea custodia;
- `REUSABLE_QUANTITY`, `SERIALIZED_ASSET`, `KIT` y `PHYSICAL_CONTAINER`
  requieren condición y disponibilidad explícitas según política;
- `CONSUMABLE`, `QUANTITY_STOCK` y `SPARE_PART` utilizan condición por saldo,
  lote o existencia cuando aplique;
- traslado, préstamo y tránsito mantienen estados diferenciados.

---

#### 21. `NEXO-INVENTORY-CLASS-BEHAVIOR-MATRIX-001`

| Clase                | Saldo o identidad                         | Uso ordinario                             | Retorno                                         | Custodia                              | Mantenimiento                             | LPN                                              | Remisión                                                         |
| -------------------- | ----------------------------------------- | ----------------------------------------- | ----------------------------------------------- | ------------------------------------- | ----------------------------------------- | ------------------------------------------------ | ---------------------------------------------------------------- |
| `CONSUMABLE`         | saldo por cantidad                        | consumo irreversible                      | no                                              | no individual                         | solo del equipo consumidor, no del insumo | contenido por cantidad cuando aplique            | línea de cantidad                                                |
| `QUANTITY_STOCK`     | saldo por cantidad y dimensiones          | consumo, transformación, venta o traslado | según devolución empresarial, no por naturaleza | no individual                         | no                                        | contenido por cantidad, lote y condición         | línea de cantidad                                                |
| `REUSABLE_QUANTITY`  | cantidad esperada, observada y utilizable | préstamo, uso y retorno                   | sí                                              | por grupo o expediente                | inspección o cuidado por grupo            | contenido por cantidad con estado retornable     | línea reutilizable con obligación o conciliación                 |
| `SERIALIZED_ASSET`   | identidad por unidad                      | asignación, préstamo o uso                | según expediente                                | individual                            | sí, por unidad                            | por identidad cuando el contrato lo permita      | transferencia de activos exactos                                 |
| `SPARE_PART`         | saldo por cantidad o serial               | reserva e instalación                     | devolución o disposición según orden            | no antes de instalación, salvo serial | se consume dentro de mantenimiento        | contenido de mantenimiento por cantidad o serial | línea de repuesto                                                |
| `KIT`                | definición e instancia                    | asignación del conjunto                   | sí cuando sea reutilizable                      | por instancia                         | sobre instancia o componentes             | puede viajar dentro de LPN                       | línea de kit más validación de componentes                       |
| `PHYSICAL_CONTAINER` | identidad por instancia                   | contener y transportar                    | normalmente sí                                  | individual o por expediente           | inspección y reparación según política    | puede ser soporte físico del LPN                 | línea de contenedor o vínculo de custodia, no saldo de contenido |

Ningún movimiento podrá incrementar simultáneamente el saldo del objeto y el de
una representación duplicada.

---

#### 22. Conteos y diferencias

El método de conteo depende de la clase:

| Clase                | Observación mínima                                                 |
| -------------------- | ------------------------------------------------------------------ |
| `CONSUMABLE`         | cantidad observada y unidad                                        |
| `QUANTITY_STOCK`     | cantidad, unidad, lote, condición y ubicación cuando apliquen      |
| `REUSABLE_QUANTITY`  | cantidad total, utilizable, dañada, prestada, faltante y ubicación |
| `SERIALIZED_ASSET`   | conjunto de identidades observadas, no solo total                  |
| `SPARE_PART`         | cantidad o serial, reserva e instalación pendientes                |
| `KIT`                | instancia y completitud de componentes                             |
| `PHYSICAL_CONTAINER` | identidades, condición, custodia y vínculo LPN                     |

El conteo es observación. La diferencia se investiga y la corrección requiere
un evento autorizado. Queda prohibido convertir un recuento de grupo en altas o
bajas automáticas de activos individuales.

---

#### 23. Reservas, disponibilidad y tránsito

Reglas por clase:

- `CONSUMABLE` y `QUANTITY_STOCK` reservan cantidad;
- `REUSABLE_QUANTITY` reserva cantidad utilizable y define retorno cuando
  corresponda;
- `SERIALIZED_ASSET` reserva identidades exactas;
- `SPARE_PART` reserva cantidad o serial contra una necesidad de mantenimiento;
- `KIT` reserva una instancia completa o los componentes necesarios para
  constituirla;
- `PHYSICAL_CONTAINER` reserva la instancia y capacidad, no su contenido por
  inferencia.

Durante tránsito:

- el objeto deja de estar disponible en origen;
- no se confirma en destino hasta recepción;
- custodia y condición se conservan;
- la clase no cambia;
- un contenedor y su LPN se concilian como identidades separadas.

---

#### 24. Frontera con LPN

Un LPN es una identidad logística de contenido y estado operacional.

```text
LPN ≠ PHYSICAL_CONTAINER
LPN ≠ KIT
LPN ≠ LOC
LPN ≠ PRODUCTO
```

Un LPN podrá:

- existir sin contenedor físico dedicado;
- vincularse con un contenedor;
- contener cantidades, identidades o instancias admitidas;
- anidarse solo mediante contrato posterior aprobado;
- moverse atómicamente con su contenido;
- cerrarse o anularse sin dar de baja el contenedor físico.

La unión o separación entre LPN y contenedor conserva historial, actor,
instante y estado. La tarea no define todavía el ciclo completo de LPN, que
permanece en `NEXO-DOM-002` a `NEXO-DOM-008` y `NEXO-DOM-019` a
`NEXO-DOM-024`.

---

#### 25. Frontera con kits

Un kit representa completitud y composición; un LPN representa logística.

```text
KIT INSTANCE
→ qué conjunto funcional existe

LPN
→ qué contenido se agrupa y mueve logísticamente
```

Una instancia de kit puede:

- existir sin LPN;
- estar dentro de un LPN;
- cambiar de LPN sin perder identidad;
- contener componentes serializados, reutilizables o por cantidad;
- quedar incompleta por préstamo, daño o pérdida;
- reemplazar un componente mediante evento aprobado.

No se suma el kit como stock adicional a sus componentes.

---

#### 26. Frontera con repuestos instalados

La secuencia mínima es:

```text
SPARE_PART DISPONIBLE
→ RESERVA
→ ORDEN DE TRABAJO
→ RETIRO FÍSICO
→ INSTALACIÓN O CONSUMO
→ MOVIMIENTO DE STOCK
→ RELACIÓN CON ACTIVO
→ TRATAMIENTO DE PIEZA RETIRADA
```

La instalación:

- no sobrescribe la historia del repuesto;
- no se registra solo en notas;
- no crea saldo negativo;
- no duplica la pieza como stock y componente instalado;
- puede crear una identidad de componente cuando la trazabilidad lo exija;
- conserva compatibilidad, cantidad, serial, actor, activo y orden.

---

#### 27. Reglas de cambio de clase

La clase puede cambiar únicamente por decisión versionada y transición
reconciliada.

Casos permitidos:

- un grupo reutilizable pasa a control individual por criticidad;
- un objeto tratado como stock se identifica como repuesto;
- una caja durable se formaliza como contenedor físico;
- una identidad incorrecta se divide en dos ciclos físicos incompatibles;
- una clase se retira porque el objeto deja de gestionarse físicamente.

Controles:

1. conservar versión anterior;
2. definir fecha efectiva;
3. impedir nuevas operaciones con la clase retirada;
4. reconciliar saldos e instancias;
5. no cambiar historia de movimientos;
6. resolver reservas, LPN, kits, custodias y remisiones abiertas;
7. mantener equivalencia de costo y cantidad;
8. exigir aprobación y evidencia;
9. ejecutar transición idempotente;
10. poder revertir antes de la activación irreversible.

---

#### 28. `NEXO-INVENTORY-CLASS-LEGACY-CROSSWALK-001`

El corte físico de 963 productos queda materializado por cohortes:

| Cohorte física                       | Productos | Estado de adopción            | Decisión                                                                                                                |
| ------------------------------------ | --------: | ----------------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| `ingredient`                         |       385 | `REVIEW_REQUIRED`             | contiene alimentos, empaques, aseo, herramientas, textiles y recipientes; no admite mapeo único                         |
| `finished` más `resale`              |       409 | `CANDIDATE_QUANTITY_STOCK`    | candidato fuerte, pero cada identidad debe confirmar que existe stock físico y no es oferta o servicio no inventariable |
| `asset` con solo `asset_items`       |        25 | `CANDIDATE_SERIALIZED_ASSET`  | 34 instancias observadas; requiere validar clase y consolidar identidad individual                                      |
| `asset` con solo `asset_groups`      |        85 | `CANDIDATE_REUSABLE_QUANTITY` | 86 grupos observados; requiere validar cantidad, retorno, condición y ausencia de identidad individual necesaria        |
| `asset` con item y grupo simultáneos |         4 | `CONFLICTING_REPRESENTATION`  | no aprobar hasta resolver doble representación y existencia                                                             |
| `asset` sin item ni grupo            |        55 | `INCOMPLETE_INSTANCE_MODEL`   | requiere decidir si es tipo, activo futuro, contenedor, kit, repuesto o registro sin instancia                          |

Reconciliación:

```text
385 + 409 + 25 + 85 + 4 + 55 = 963
faltantes = 0
duplicados entre cohortes = 0
clasificaciones objetivo aprobadas automáticamente = 0
```

La tabla no autoriza cambios masivos. Materializa una decisión explícita para
cada cohorte y la puerta que deberá superar.

---

#### 29. Snapshot físico ampliado

El estado desplegado observado presenta:

| Métrica                                            |    Resultado |
| -------------------------------------------------- | -----------: |
| Productos                                          |          963 |
| Productos activos                                  |          950 |
| Perfiles de inventario                             |          963 |
| Perfiles sin producto                              | 0 observados |
| Productos sin perfil                               | 0 observados |
| `ingredient`                                       |          385 |
| `finished`                                         |          382 |
| `resale`                                           |           27 |
| `asset`                                            |          169 |
| Perfiles con `track_inventory=true`                |          792 |
| Perfiles con `track_inventory=false`               |          171 |
| Perfiles de activo                                 |          169 |
| Productos de activo solo individuales              |           25 |
| Productos de activo solo por grupo                 |           85 |
| Productos con ambas representaciones               |            4 |
| Productos de activo sin instancia                  |           55 |
| Filas `asset_items`                                |           38 |
| Filas `asset_groups`                               |           90 |
| Perfiles UOM                                       |        1.190 |
| LPN                                                |            0 |
| Contenidos LPN                                     |            0 |
| Funciones inspeccionadas que leen `inventory_kind` |            2 |

La ausencia de LPN no prueba que el contrato sea innecesario. Confirma que no
existe evidencia operativa para certificar su comportamiento actual.

---

#### 30. Comportamiento físico observado

La base física conserva:

- `products.product_type` limitado a `venta`, `insumo` y `preparacion`;
- `product_inventory_profiles.inventory_kind` limitado a `ingredient`,
  `finished`, `resale`, `packaging`, `asset` y `unclassified`;
- `asset_items` para identidad individual;
- `asset_groups` para grupos por cantidad;
- `product_asset_profiles` a nivel de producto;
- `inventory_lpns` con `container_type` embebido;
- `inventory_lpn_items` limitado a producto, cantidad, unidad, lote y
  vencimiento;
- dos funciones que ramifican por `inventory_kind`;
- filtros de stock y activos en NEXO que interpretan `asset` como una clase
  única;
- políticas RLS de activos basadas en permisos generales de stock, ubicaciones
  o conteos;
- políticas LPN con modelos legacy de sede y permiso.

La implementación útil se conserva como evidencia, no como contrato final.

---

#### 31. `NEXO-INVENTORY-CLASS-PHYSICAL-RECONCILIATION-001`

|    # | Brecha física                                                                                              | Estado                        | Destino canónico                                                  |
| ---: | ---------------------------------------------------------------------------------------------------------- | ----------------------------- | ----------------------------------------------------------------- |
|    1 | no existe campo físico para las siete clases objetivo                                                      | `BLOQUEADO`                   | `SUPA-ARC-003`; `SUPA-TRANS-005`; `SHELL-CON-001`                 |
|    2 | el constraint de `inventory_kind` conserva taxonomía legacy                                                | `BLOQUEADO`                   | `SUPA-AUD-019`; `SUPA-ARC-003`; `SUPA-TRANS-005`                  |
|    3 | `product_type` mezcla propósito comercial con identidad física                                             | `PENDIENTE_DE_RECONCILIACION` | `CAP-SCOPE-004`; `DATA-NORM-AUD-004`; `SUPA-AUD-019`              |
|    4 | `inventory_kind` mezcla rol productivo, comercial y control físico                                         | `BLOQUEADO`                   | `NEXO-DOM-001`; `SHELL-CON-009`; `SUPA-ARC-005`                   |
|    5 | los 385 `ingredient` incluyen familias físicamente incompatibles                                           | `PENDIENTE_DE_CLASIFICACION`  | `DATA-NORM-AUD-004`; `NEXO-UX-001`; `NEXO-UX-014` a `NEXO-UX-019` |
|    6 | 409 productos `finished` o `resale` solo son candidatos, no adopciones aprobadas                           | `PENDIENTE_DE_CLASIFICACION`  | `NEXO-UX-001`; `SUPA-AUD-019`; `SHELL-CI-016`                     |
|    7 | `asset` agrupa control individual, por cantidad y tipos sin instancia                                      | `BLOQUEADO`                   | `NEXO-DOM-009`; `SUPA-AUD-019`; `SUPA-ARC-005`                    |
|    8 | cuatro productos poseen item y grupo simultáneos                                                           | `PENDIENTE_DE_RECONCILIACION` | `NEXO-DOM-009`; `DATA-NORM-AUD-004`; `SHELL-CI-016`               |
|    9 | cincuenta y cinco productos de activo no poseen instancia                                                  | `PENDIENTE_DE_CLASIFICACION`  | `NEXO-DOM-009`; `NEXO-UX-030`; `SUPA-AUD-019`                     |
|   10 | `product_asset_profiles.serial_number` está en perfil de producto y puede confluir con serial de instancia | `BLOQUEADO`                   | `NEXO-DOM-009`; `SUPA-ARC-005`; `SUPA-TRANS-005`                  |
|   11 | `asset_groups` conserva cantidad esperada, pero no un ledger canónico propio de reutilizables              | `BLOQUEADO`                   | `NEXO-DOM-011`; `TREQ-NEXO-011`; `SUPA-ARC-006`                   |
|   12 | no existe relación física canónica repuesto, orden de trabajo, instalación y pieza retirada                | `PENDIENTE_DE_IMPLEMENTACION` | `NEXO-DOM-016`; `NEXO-DOM-025`; `TREQ-NEXO-014`                   |
|   13 | no existen definición, instancia y miembros canónicos de kit                                               | `PENDIENTE_DE_IMPLEMENTACION` | `NEXO-DOM-014`; `NEXO-DOM-015`; `TREQ-NEXO-013`                   |
|   14 | `inventory_lpns.container_type` mezcla la identidad logística con la forma del contenedor                  | `BLOQUEADO`                   | `NEXO-DOM-019`; `NEXO-DOM-020`; `SUPA-ARC-005`                    |
|   15 | `inventory_lpn_items` no representa activos, kits ni contenedores por identidad                            | `BLOQUEADO`                   | `NEXO-DOM-004`; `NEXO-DOM-006`; `NEXO-DOM-024`                    |
|   16 | no existe identidad física canónica de contenedor ni vínculo versionado con LPN                            | `PENDIENTE_DE_IMPLEMENTACION` | `NEXO-DOM-019`; `NEXO-DOM-020`; `NEXO-DOM-022`                    |
|   17 | no existe historial efectivo de clasificación                                                              | `PENDIENTE_DE_IMPLEMENTACION` | `SHELL-CON-001`; `SUPA-ARC-003`; `SUPA-TRANS-005`                 |
|   18 | filtros, SKU y pantallas ramifican directamente por `inventory_kind` legacy                                | `BLOQUEADO`                   | `SHELL-CON-009`; `SHELL-AUTH-005`; `NEXO-UX-001`                  |
|   19 | permisos y RLS no distinguen gobierno de clasificación, operación de stock y gestión de activos            | `PENDIENTE_DE_RECONCILIACION` | `NEXO-AUTH-021` a `NEXO-AUTH-030`; `SHELL-CI-018`                 |
|   20 | no existe suite que demuestre paridad de 963 identidades y cero doble contabilización durante transición   | `PENDIENTE_DE_EVIDENCIA`      | `SHELL-CI-016`; `SHELL-CI-018`; `SHELL-CI-019`                    |

No se crean tareas nuevas. Cada brecha conserva un propietario existente y una
puerta verificable.

---

#### 32. Estado de adopción

La clasificación queda:

| Capa                                           | Estado                                     |
| ---------------------------------------------- | ------------------------------------------ |
| contrato de siete clases                       | `ESPECIFICADO`                             |
| árbol y matriz de decisión                     | `ESPECIFICADO`                             |
| comportamiento por clase                       | `ESPECIFICADO`                             |
| crosswalk agregado de 963 productos            | `VALIDADO` contra snapshot de solo lectura |
| clasificación individual de 963 productos      | `PENDIENTE_DE_CLASIFICACION`               |
| campos, constraints y tipos físicos            | `PENDIENTE_DE_IMPLEMENTACION`              |
| transición de datos                            | `PENDIENTE_DE_IMPLEMENTACION`              |
| adopción por NEXO y consumidoras               | `PENDIENTE_DE_IMPLEMENTACION`              |
| evidencia de remisiones, LPN, kits y repuestos | `PENDIENTE_DE_EVIDENCIA`                   |

Ningún producto queda declarado migrado por esta tarea.

---

#### 33. Handoff funcional inmediato

La clasificación habilita el inventario de procesos de `NEXO-UX-001`.

Ese handoff deberá utilizar las siete clases para identificar, por proceso:

- actor y necesidad;
- entrada física;
- saldo o identidad;
- ubicación y custodia;
- movimiento y estado;
- conteo y diferencia;
- excepción y recuperación;
- datos y evidencia;
- remisión o transferencia;
- interacción con LPN, kit o contenedor.

`NEXO-UX-001` no podrá redefinir clases ni clasificar por nombre de pantalla.

---

#### 34. Continuidad normal preservada

La secuencia de dominio `NEXO-DOM-002` a `NEXO-DOM-038` permanece intacta y no
se inicia en esta tarea.

La ruta prioritaria activa realiza el handoff inmediato a `NEXO-UX-001`. Las
tareas de dominio posteriores consumen esta clasificación cuando el flujo
canónico vuelva a ellas.

Especialmente:

- `NEXO-DOM-002` a `NEXO-DOM-008`: LPN;
- `NEXO-DOM-009`: individual versus cantidad;
- `NEXO-DOM-014` y `NEXO-DOM-015`: kits;
- `NEXO-DOM-016`: repuestos;
- `NEXO-DOM-019` a `NEXO-DOM-024`: contenedor, LPN y contenido.

---

#### 35. Seguridad y autorización

La clase influye en la operación, pero no concede autoridad.

Se separarán como mínimo:

- consultar clasificación;
- proponer clasificación;
- aprobar o retirar clasificación;
- crear saldo;
- mover cantidad;
- mover activo individual;
- entregar o devolver reutilizables;
- reservar o instalar repuestos;
- constituir o desarmar kits;
- vincular o desvincular contenedor y LPN;
- contar;
- investigar diferencias;
- aprobar correcciones;
- ver costo o propiedad.

Quien captura no aprueba automáticamente. Un dispositivo, aplicación visible,
categoría o clase no reemplaza sede, área, rol, permiso, scope ni recurso.

---

#### 36. Transición de datos

La transición futura deberá:

1. crear el contrato físico versionado;
2. congelar el snapshot fuente;
3. generar candidatos sin aprobarlos automáticamente;
4. detectar incompatibilidades y dobles representaciones;
5. permitir revisión por lotes con evidencia;
6. conservar producto, presentaciones y movimientos históricos;
7. crear instancias faltantes solo mediante proceso autorizado;
8. reconciliar cantidad, costo, ubicación, condición y custodia;
9. mantener adapters de lectura durante compatibilidad;
10. impedir escritura simultánea en modelo legacy y objetivo sin estrategia;
11. validar conteos antes y después;
12. soportar rollback antes de activar la nueva fuente;
13. retirar el adapter legacy después de paridad certificada;
14. no usar nombres, categorías o coincidencias parciales como única evidencia.

Toda migración Supabase pertenecerá a `vento-shell` y deberá pasar por las
tareas de arquitectura y transición aprobadas.

---

#### 37. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

Se incorporan al registro canónico:

- `TREQ-NEXO-040`;
- `TREQ-NEXO-041`;
- `TREQ-NEXO-042`;
- `TREQ-NEXO-043`;
- `TREQ-NEXO-044`;
- `TREQ-NEXO-045`;
- `TREQ-NEXO-046`;
- `TREQ-NEXO-047`;
- `TREQ-NEXO-048`;
- `TREQ-NEXO-049`.

| Rango | Cobertura                                                               |
| ----- | ----------------------------------------------------------------------- |
| `040` | unicidad y vigencia de las siete clases                                 |
| `041` | separación de clase, rol, presentación, unidad, lote, serial y estado   |
| `042` | consumible y stock por cantidad                                         |
| `043` | reutilizable por cantidad y activo serializado                          |
| `044` | repuesto e instalación                                                  |
| `045` | definición, instancia y completitud de kit                              |
| `046` | contenedor físico y vínculo con LPN                                     |
| `047` | movimientos, conteos, reservas, remisiones y cero doble contabilización |
| `048` | transición versionada del modelo legacy                                 |
| `049` | reconciliación de 963 productos y cierre de veinte brechas              |

Los requisitos permanecen `IDENTIFICADO` hasta disponer de implementación y
evidencia reproducibles.

---

#### 38. Validaciones documentales definidas

La implementación deberá comprobar como mínimo:

1. siete clases exactas y sin duplicados;
2. una clase activa por identidad y período;
3. servicios fuera de clasificación física;
4. roles secundarios sin alterar clase;
5. presentación y unidad independientes;
6. lote y serial en la granularidad correcta;
7. consumible con consumo irreversible;
8. quantity stock con saldo reconciliable;
9. reutilizable con retorno y cantidad por condición;
10. activo con identidad individual;
11. repuesto con reserva, instalación y movimiento;
12. kit sin duplicar componentes;
13. contenedor separado de LPN;
14. LPN separado de LOC y kit;
15. conteo específico por clase;
16. remisión específica por clase;
17. reclassificación versionada;
18. cohortes 385, 409, 25, 85, 4 y 55 reconciliadas;
19. 963 perfiles sin faltantes;
20. cuatro dobles representaciones bloqueadas;
21. cincuenta y cinco modelos incompletos bloqueados;
22. cero clasificaciones automáticas por nombre;
23. transición idempotente y reversible;
24. veinte brechas con propietario y salida;
25. diez requisitos únicos y resolubles.

---

#### 39. Evidencia y límites

Evidencia disponible:

- fuentes canónicas de catálogo, inventario y activos;
- owner file y secuencia prioritaria;
- esquema y constraints desplegados;
- conteos agregados del catálogo;
- cohortes de activos y representaciones;
- tablas y consumidores físicos inspeccionados;
- cero filas LPN observadas.

Evidencia no disponible todavía:

- decisión individual aprobada para cada producto;
- pruebas operativas de las siete clases;
- migración de datos;
- paridad entre legacy y objetivo;
- recorrido completo de kit, repuesto y contenedor;
- evidencia de LPN con contenido real;
- certificación de remisiones por clase.

La ausencia de evidencia no se presenta como cumplimiento.

---

#### 40. Fuera del alcance

NEXO-DOM-001 no:

- modifica los 963 productos;
- aprueba clasificaciones individuales;
- crea, divide, fusiona o retira productos;
- cambia categorías o nombres;
- crea activos, grupos, kits, repuestos, contenedores o LPN;
- corrige las cuatro dobles representaciones;
- crea instancias para los cincuenta y cinco modelos incompletos;
- cambia saldos, ubicaciones, costos o custodias;
- ejecuta remisiones, movimientos, conteos o ajustes;
- crea schemas, tablas, columnas, constraints, funciones, RLS o migraciones;
- modifica código o UI;
- publica tipos compartidos;
- ejecuta DDL, DML, backfills o despliegues;
- inicia `NEXO-UX-001`;
- inicia `NEXO-DOM-002`;
- declara implementado el modelo objetivo.

---

#### 41. Criterios de aceptación

1. se congelan exactamente siete clases primarias;
2. cada identidad posee una sola clase activa por período;
3. servicios quedan fuera del modelo físico;
4. la clase se separa de doce dimensiones;
5. consumible y stock por cantidad tienen fronteras inequívocas;
6. reutilizable por cantidad y activo serializado no se mezclan;
7. repuesto permanece stock hasta instalación;
8. kit definición e instancia están separados;
9. kit y LPN no son equivalentes;
10. contenedor físico y LPN no son equivalentes;
11. presentación y unidad no crean clase;
12. serial pertenece a la instancia;
13. roles secundarios pueden coexistir sin clase múltiple;
14. se decide un método de conteo por clase;
15. se decide participación en reservas y remisiones por clase;
16. se prohíbe doble contabilización;
17. reclassificación conserva historia y reconciliación;
18. los veintiocho escenarios tienen resultado;
19. los 963 productos quedan cubiertos por seis cohortes exhaustivas;
20. las cohortes suman 963 sin faltantes ni duplicados;
21. ninguna cohorte se declara migrada;
22. se registran 38 activos individuales y 90 grupos;
23. se detectan cuatro dobles representaciones;
24. se detectan cincuenta y cinco productos de activo sin instancia;
25. se registra que existen cero LPN y cero contenidos observados;
26. se registran veinte brechas físicas;
27. cada brecha tiene propietario existente;
28. se generan `TREQ-NEXO-040` a `TREQ-NEXO-049`;
29. no se modifica código, Supabase ni datos;
30. el handoff prioritario queda en `NEXO-UX-001`;
31. `NEXO-DOM-002` permanece no iniciada dentro de la continuidad normal.

---

#### 42. Cierre de tarea y continuidad

**ÚLTIMA TAREA APROBADA**

`AUTH-ERR-020 — Compartir mensajes desde vento-shell`

**TAREA ACTUAL APROBADA**

`NEXO-DOM-001 — Clasificar consumibles, stock por cantidad, reutilizables, activos serializados, repuestos, kits y contenedores`

**SIGUIENTE TAREA RESERVADA**

`NEXO-UX-001 — Inventariar procesos reales de inventario y logística`

La continuidad normal de `NEXO-DOM-002` a `NEXO-DOM-038` permanece preservada
y no se inicia en esta tarea.


### [ ] NEXO-DOM-002 — Definir propósito y tipos canónicos de LPN
### [ ] NEXO-DOM-003 — Definir ciclo de vida de LPN: crear, activar, cerrar, anular y reetiquetar
### [ ] NEXO-DOM-004 — Definir contenido, empaque y desempaque de LPN
### [ ] NEXO-DOM-005 — Definir división, unión y transferencia de contenido
### [ ] NEXO-DOM-006 — Definir LPN anidados y contenedores retornables
### [ ] NEXO-DOM-007 — Definir relación sede → LOC → LPN → contenido
### [ ] NEXO-DOM-008 — Definir custodia y responsable actual
### [ ] NEXO-DOM-009 — Separar activo individual y reutilizable controlado por cantidad
### [ ] NEXO-DOM-010 — Definir estado, condición, daño, pérdida y faltante
### [ ] NEXO-DOM-011 — Definir préstamo, devolución, transferencia y cambio de custodia
### [ ] NEXO-DOM-012 — Definir mantenimiento, reparación y disponibilidad
### [ ] NEXO-DOM-013 — Definir baja, descarte, venta o reemplazo
### [ ] NEXO-DOM-014 — Definir kits, conjuntos y validación de completitud
### [ ] NEXO-DOM-015 — Definir conteos de activos, reutilizables y contenedores
### [ ] NEXO-DOM-016 — Definir repuestos, compatibilidad y stock mínimo
### [ ] NEXO-DOM-017 — Definir auditoría, historial y evidencia
### [ ] NEXO-DOM-018 — Integrar etiquetas LOC, LPN, activos y documentos con BLOQUE E4

### [ ] NEXO-DOM-019 — Separar identidad permanente del contenedor físico e identidad temporal o persistente del LPN
### [ ] NEXO-DOM-020 — Definir cuándo un contenedor conserva, cambia o cierra su LPN
### [ ] NEXO-DOM-021 — Prohibir doble contabilización entre existencia suelta en LOC y existencia contenida en LPN
### [ ] NEXO-DOM-022 — Definir que mover un LPN mueve atómicamente todo su contenido
### [ ] NEXO-DOM-023 — Definir trazabilidad de lote, serial, vencimiento y condición dentro del LPN
### [ ] NEXO-DOM-024 — Definir capacidad, peso, volumen y compatibilidad de contenido
### [ ] NEXO-DOM-025 — Vincular repuestos consumidos con mantenimiento y costo del activo
### [ ] NEXO-DOM-026 — Definir inspecciones, mantenimiento preventivo, garantía y calibración
### [ ] NEXO-DOM-027 — Resolver propiedad de vehículos, checklist, kilometraje, combustible y mantenimiento de flota
### [ ] NEXO-DOM-028 — Emitir eventos financieros por adquisición, reparación, pérdida y baja cuando corresponda
### [ ] NEXO-DOM-029 — Definir jerarquía canónica de instalaciones, espacios, componentes fijos, puntos de servicio y condición
### [ ] NEXO-DOM-030 — Definir planes de mantenimiento, solicitudes, órdenes de trabajo, reparación, prueba y liberación
### [ ] NEXO-DOM-031 — Definir limpieza, saneamiento, procedimientos, frecuencias, químicos, verificación y liberación
### [ ] NEXO-DOM-032 — Definir control de plagas, mapa, dispositivos, visitas, hallazgos, acciones y certificados
### [ ] NEXO-DOM-033 — Definir servicios, medidores, lecturas, consumos, interrupciones, alertas y contingencias
### [ ] NEXO-DOM-034 — Definir inspecciones físicas, plantillas versionadas, hallazgos y acciones correctivas
### [ ] NEXO-DOM-035 — Definir control metrológico, calibración, verificación, tolerancias, certificados e impacto
### [ ] NEXO-DOM-036 — Definir llaves, credenciales físicas, zonas, custodia, entrega, devolución e incidencias
### [ ] NEXO-DOM-037 — Definir obras, adecuaciones, contratistas, permisos, afectación operativa, recepción y garantía
### [ ] NEXO-DOM-038 — Definir novedades locativas, severidad, contención, escalamiento, resolución y cierre
