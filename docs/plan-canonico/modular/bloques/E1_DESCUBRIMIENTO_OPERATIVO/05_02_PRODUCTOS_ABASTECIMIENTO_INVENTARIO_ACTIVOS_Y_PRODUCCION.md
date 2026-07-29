### MINI-BLOQUE — PRODUCTOS ABASTECIMIENTO INVENTARIO ACTIVOS Y PRODUCCION

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **productos abastecimiento inventario activos y produccion** dentro de **E1 DESCUBRIMIENTO OPERATIVO**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `CAP-SCOPE-004` a `CAP-SCOPE-008` — 5 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `CAP-SCOPE-004`: Evaluar catálogo, productos, presentaciones, unidades, menús y recetas
- `CAP-SCOPE-005`: Evaluar compras, proveedores, contratos, precios y abastecimiento
- `CAP-SCOPE-006`: Evaluar inventario, lotes, vencimientos, LOC y LPN
- `CAP-SCOPE-007`: Evaluar activos, vajilla, decoración, herramientas, repuestos y mantenimiento
- `CAP-SCOPE-008`: Evaluar producción, planificación, rendimiento, calidad e inocuidad
<!-- PLAN-SECTION-META:END -->

### ✅ CAP-SCOPE-004 — Evaluar catálogo, productos, presentaciones, unidades, menús y recetas

**Estado:** APROBADA 
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Dependencia cumplida:** `CAP-SCOPE-003` aprobada  
**Tarea anterior:** `CAP-SCOPE-003`  
**Siguiente tarea reservada:** `CAP-SCOPE-005`  
**Familia evaluada:** `CAP-04 — Gestionar productos, preparaciones y conocimiento`  
**Naturaleza:** decisión de cobertura empresarial y definición conceptual objetivo  
**Implementación técnica:** no autorizada  
**Migraciones o cambios en Supabase:** no autorizados  
**Cambios directos en catálogo, recetas, menús, precios o disponibilidad:** no autorizados  
**Requisitos de prueba generados:** `TREQ-SUPABASE-012`, `TREQ-FOGO-002`, `TREQ-INTEGRATION-009`  
**Actualización del registro de pruebas:** se entrega el archivo `04A` completo regenerado; quedan prohibidas las filas sueltas

---

#### 1. Propósito

Definir el tratamiento objetivo de las capacidades mediante las cuales Vento Group deberá:

- identificar de manera estable productos, servicios, preparaciones, insumos, empaques y componentes;
- distinguir un producto maestro de sus presentaciones físicas, unidades, variantes y usos;
- clasificar los productos sin mezclar taxonomías operativas, productivas, comerciales, contables o regulatorias;
- conservar ingredientes y componentes como referencias canónicas y no como texto libre;
- diseñar, versionar, publicar y retirar recetas y métodos de preparación;
- definir rendimiento esperado, porciones, escalamiento, merma técnica y resultados reales;
- publicar menús y ofertas por sede, canal, horario y contexto comercial;
- distinguir oferta habilitada, disponibilidad operativa, stock, capacidad productiva y agotado temporal;
- conservar información nutricional, alérgenos, advertencias y fuentes de cálculo o verificación;
- gestionar especificaciones de calidad, conservación, empaque y aceptación;
- coordinar vigencias entre NEXO, FOGO, PULSO, PASS, ORIGO, NUMERA, VISO, SHELL y sistemas externos;
- impedir que cada aplicación cree una copia editable del mismo producto, presentación, receta o ítem de menú.

La tarea preserva la implementación útil ya comprobada, pero prohíbe declarar cerrada la familia `CAP-04` por la sola existencia de productos, recetas o pantallas actuales.

---

#### 2. Pregunta de decisión

`CAP-SCOPE-004` responde:

```text
¿CUÁL ES LA IDENTIDAD CANÓNICA DE CADA PRODUCTO, SERVICIO,
PRESENTACIÓN, UNIDAD, INGREDIENTE, PREPARACIÓN, RECETA,
PORCIÓN, ÍTEM DE MENÚ Y OFERTA;
QUÉ APLICACIÓN PRODUCE CADA HECHO;
QUÉ APLICACIONES SOLO LO CONSUMEN;
Y CÓMO SE VERSIONAN, PUBLICAN, RETIRAN Y SINCRONIZAN
SIN DUPLICAR CATÁLOGOS NI ALTERAR LA HISTORIA?
```

La tarea rechaza equivalencias incorrectas como:

```text
PRODUCTO = PRESENTACIÓN
```

```text
PRESENTACIÓN = UNIDAD DE MEDIDA
```

```text
CATEGORÍA OPERATIVA = CATEGORÍA COMERCIAL
```

```text
RECETA = PRODUCTO
```

```text
ÍTEM DE MENÚ = PRODUCTO MAESTRO
```

```text
ACTIVO = DISPONIBLE PARA VENTA
```

```text
STOCK MAYOR QUE CERO = SE PUEDE VENDER
```

```text
EDITAR UNA RECETA PUBLICADA = CREAR UNA NUEVA VERSIÓN
```

```text
TENER UN CAMPO DE ALÉRGENOS = INFORMACIÓN VERIFICADA
```

---

#### 3. Fuentes consolidadas

La evaluación utiliza como línea base:

- `OPS-AUD-001` a `OPS-AUD-015`;
- `CAP-MAP-001` a `CAP-MAP-015`;
- `CODE-AUD-001` a `CODE-AUD-020`;
- `MAP-IMPL-CAP-001`;
- `BKL-REPO-001`, especialmente `BKL-FUNC-004` y `BKL-NEXO-006`;
- `CAP-SCOPE-001` a `CAP-SCOPE-003`;
- `QA-REG-001` y el Registro Canónico de Requisitos de Prueba;
- `REGISTRO_VIVO_DE_PREGUNTAS_PENDIENTES`, especialmente `DAT-03`, `DAT-04`, `TEC-06`, `TEC-08` y `TEC-18`;
- el catálogo maestro, perfiles de inventario, presentaciones, unidades, proveedores, imágenes y configuraciones actuales de NEXO;
- las recetas, ingredientes, pasos, rendimientos, porciones, recetario operativo y lotes actuales de FOGO;
- las superficies parciales de menú, oferta y disponibilidad de VISO, NEXO, PULSO y PASS;
- los contratos futuros de `OPS-REC-001`, `OPS-PRD-001`, `OPS-TRZ-001`, `INT-PROD-001` a `INT-PROD-005` e `INT-POS-001` a `INT-POS-024`;
- las decisiones ya aprobadas sobre fuente de verdad, propiedad funcional, autorización, Storage, integración, idempotencia, auditoría y transición.

Las respuestas y evidencias ya documentadas no se vuelven a solicitar.

---

#### 4. Alcance evaluado

La tarea evalúa directamente:

- `CAP-04.01` — Definir productos y servicios;
- `CAP-04.02` — Definir presentaciones y unidades;
- `CAP-04.03` — Clasificar productos;
- `CAP-04.04` — Gestionar ingredientes y componentes;
- `CAP-04.05` — Definir recetas y métodos de preparación;
- `CAP-04.06` — Definir rendimientos y porciones;
- `CAP-04.07` — Gestionar menús y disponibilidad;
- `CAP-04.08` — Gestionar información nutricional y alérgenos;
- `CAP-04.09` — Gestionar calidad y especificaciones;
- `CAP-04.10` — Gestionar cambios y vigencia del conocimiento.

También fija fronteras para:

- compras y presentaciones de proveedor;
- inventario, lotes, vencimientos, LOC y LPN;
- planificación y ejecución productiva;
- ventas, pedidos, caja y pagos;
- clientes y canales;
- costos, margen y rentabilidad;
- documentos, evidencia, privacidad y conservación;
- analítica;
- continuidad operativa;
- integraciones con POS, Rappi, Shopify, ManyChat y otros canales.

---

#### 5. Fuera de alcance

Esta tarea no:

- crea o modifica productos reales;
- depura los 959 productos ni las 276 recetas identificadas en la auditoría;
- aprueba fórmulas, rendimientos o declaraciones nutricionales;
- define precios de venta;
- decide impuestos o clasificación fiscal;
- reemplaza validación de nutricionista, tecnólogo de alimentos, responsable de calidad o autoridad competente;
- ejecuta análisis de laboratorio;
- publica menús;
- activa o desactiva productos;
- cambia disponibilidad comercial;
- migra categorías;
- modifica unidades o factores de conversión;
- corrige inventario;
- crea recetas;
- ejecuta producción;
- implementa trazabilidad de lotes;
- crea tablas, vistas, RPC, buckets, políticas RLS, eventos o paquetes;
- integra directamente un POS externo;
- convierte VISO en propietario del catálogo;
- convierte PASS en fuente de verdad de productos;
- convierte NEXO en propietario de precios o menús;
- convierte PULSO en propietario de inventario o recetas;
- incorpora activos, repuestos, vajilla o decoración dentro del catálogo de producto ordinario cuando pertenecen a `CAP-07`.

---

#### 6. Principios canónicos

##### 6.1. La identidad precede a la presentación

Todo elemento gestionado deberá tener una identidad estable independiente de:

- nombre visible;
- marca;
- imagen;
- categoría;
- proveedor;
- código externo;
- empaque;
- sede;
- precio;
- receta;
- canal.

Cambiar un nombre, una imagen o un empaque no crea automáticamente un producto nuevo.

##### 6.2. Producto maestro, variante, presentación y unidad son conceptos distintos

```text
PRODUCTO MAESTRO
→ qué es el elemento

VARIANTE
→ qué configuración diferenciada del producto se ofrece o produce

PRESENTACIÓN
→ cómo se compra, recibe, almacena, solicita, vende o transporta físicamente

UNIDAD
→ cómo se expresa una magnitud medible
```

Una caja de seis botellas no será una unidad de medida nueva. Será una presentación con una conversión aprobada hacia la unidad canónica de stock.

##### 6.3. La misma identidad puede desempeñar varios roles

Un elemento podrá ser, según reglas explícitas:

- comprable;
- almacenable;
- ingrediente;
- componente de empaque;
- preparación intermedia;
- producto terminado;
- vendible;
- suministrable entre sedes;
- consumible operativo;
- servicio no inventariable.

Los roles no se resolverán creando copias independientes del mismo elemento en cada aplicación.

##### 6.4. Los servicios no heredarán semántica de inventario

Un servicio podrá ser vendible o comprable sin tener:

- stock;
- LOC;
- presentación física;
- lote;
- vencimiento;
- movimiento de inventario.

La ausencia de stock no lo convertirá en producto defectuoso ni se inventará una unidad física para hacerlo compatible.

##### 6.5. Las taxonomías no se mezclarán

Se distinguirán, cuando sean necesarias:

- tipo maestro;
- clasificación de inventario;
- categoría operativa;
- familia productiva;
- categoría de compra;
- categoría comercial o de menú;
- clasificación contable o de costo;
- clasificación fiscal;
- clasificación nutricional o regulatoria.

Una categoría comercial no controlará por sí sola inventario. Una categoría operativa no determinará cómo se muestra el producto al cliente.

##### 6.6. Ingredientes y preparaciones intermedias serán referencias canónicas

Una receta no deberá depender de:

- nombres escritos manualmente;
- unidades libres;
- ingredientes duplicados;
- productos inactivos sin excepción;
- identificadores propios de FOGO sin vínculo con el catálogo maestro.

Una preparación intermedia podrá ser salida de una receta e ingrediente de otra, conservando identidad, unidad, lote y trazabilidad.

##### 6.7. La receta es conocimiento versionado

```text
RECETA
→ identidad estable del conocimiento

VERSIÓN DE RECETA
→ formulación, método y reglas vigentes en un período

EJECUCIÓN
→ uso concreto de una versión en un lote o preparación
```

Una versión publicada no se editará destructivamente.

##### 6.8. El lote conservará la versión efectivamente usada

Cada ejecución productiva deberá conservar:

- receta;
- versión;
- salida esperada;
- escala;
- ingredientes previstos;
- sustituciones autorizadas;
- pasos aplicables;
- rendimiento esperado;
- actor;
- sede;
- área;
- fecha;
- cantidades realmente usadas;
- resultado real.

La actualización posterior de la receta no cambiará el significado histórico del lote.

##### 6.9. Rendimiento esperado y rendimiento real no son equivalentes

```text
RENDIMIENTO ESPERADO
→ conocimiento aprobado de la receta

RENDIMIENTO REAL
→ resultado observado de una ejecución
```

La desviación se registrará; no se corregirá retroactivamente el rendimiento esperado para hacer coincidir el resultado.

##### 6.10. El menú es una publicación comercial, no un catálogo maestro paralelo

Un ítem de menú deberá referenciar:

- producto o variante vendible;
- sede;
- canal;
- nombre y descripción comerciales;
- categoría comercial;
- configuración u opciones;
- vigencia;
- disponibilidad;
- reglas de precio pertenecientes al dominio de venta;
- información de alérgenos o advertencias publicables.

El ítem no duplicará la identidad física, receta ni unidad de stock.

##### 6.11. La disponibilidad tendrá causas explícitas

Se distinguirán como mínimo:

- oferta habilitada;
- fuera de horario;
- no disponible en la sede;
- no disponible en el canal;
- agotado temporal;
- bloqueado por stock estricto;
- bloqueado por capacidad productiva;
- suspendido manualmente;
- retirado;
- pendiente de sincronización;
- estado desconocido o degradado.

Una sola bandera `is_active` no cubrirá toda la semántica.

##### 6.12. La disponibilidad no se inferirá siempre del stock

Un producto podrá ser:

- fabricado contra pedido;
- elaborado con insumos compartidos;
- limitado por capacidad;
- vendido sin inventario terminado;
- sujeto a reserva;
- temporalmente bloqueado por calidad;
- no inventariable.

Cada oferta declarará su política de disponibilidad.

##### 6.13. Nutrición y alérgenos exigirán procedencia

Todo valor deberá declarar:

- fuente;
- método;
- fecha;
- versión;
- alcance;
- responsable;
- estado de revisión;
- si fue calculado, estimado, declarado por proveedor o verificado externamente.

No se publicará como confirmado un dato meramente inferido.

##### 6.14. Alérgeno presente y riesgo de contaminación cruzada son distintos

La declaración deberá distinguir:

- ingrediente que contiene el alérgeno;
- derivado o compuesto;
- sustitución;
- posibilidad de contacto cruzado;
- advertencia de instalación;
- ausencia no verificada;
- declaración pendiente.

Un cambio de ingrediente o proceso deberá invalidar o revisar la declaración afectada.

##### 6.15. Las especificaciones tendrán objeto y versión

Una especificación podrá pertenecer a:

- producto maestro;
- presentación;
- materia prima;
- preparación intermedia;
- salida de receta;
- empaque;
- condición de conservación.

No se reutilizará una misma especificación sin declarar el objeto al que aplica.

##### 6.16. Retirar no significa borrar

Los productos, presentaciones, recetas, versiones, menús y especificaciones referenciados por historia no podrán eliminarse destructivamente.

El retiro deberá impedir nuevos usos incompatibles, pero conservar:

- ventas;
- compras;
- movimientos;
- lotes;
- costos;
- documentos;
- evidencia;
- auditoría.

##### 6.17. Ninguna aplicación creará un catálogo competidor

```text
NEXO
→ identidad maestra y configuración física u operativa

FOGO
→ recetas, métodos, rendimientos y ejecución productiva

PULSO
→ oferta vendible, menú y disponibilidad comercial

PASS
→ presentación al cliente y consumo de la oferta publicada

ORIGO
→ condiciones de compra y presentaciones del proveedor

NUMERA
→ costos y resultados económicos derivados

VISO
→ superficie administrativa y enlaces a propietarios
```

Cada aplicación conservará sus hechos propios sin recrear los de otra.

##### 6.18. VISO no será propietario por tener una pantalla administrativa

VISO podrá:

- consultar;
- coordinar;
- mostrar estado;
- iniciar una acción autorizada;
- enlazar a la aplicación propietaria.

No deberá mantener una segunda implementación editable de producto, receta, menú o disponibilidad.

---

#### 7. Modelo conceptual objetivo

##### 7.1. Conceptos separados

| Concepto                 | Propósito                                                                 |
| ------------------------ | ------------------------------------------------------------------------- |
| `CatalogItem`            | identidad estable de producto, servicio, insumo, preparación o componente |
| `ItemRole`               | roles empresariales habilitados para la identidad                         |
| `ItemVariant`            | configuración diferenciada que mantiene vínculo con el producto maestro   |
| `MeasurementDimension`   | masa, volumen, conteo, longitud u otra dimensión permitida                |
| `UnitOfMeasure`          | unidad normalizada y precisión                                            |
| `ItemMeasurementProfile` | unidad canónica de stock, entrada, receta y tolerancias                   |
| `Presentation`           | empaque o forma física con cantidad equivalente                           |
| `SiteItemConfiguration`  | habilitación y reglas operativas por sede                                 |
| `Taxonomy`               | tipo de clasificación y reglas                                            |
| `TaxonomyAssignment`     | asignación versionada de una identidad a una clasificación                |
| `ComponentRelation`      | relación ingrediente, empaque, componente o preparación intermedia        |
| `Recipe`                 | identidad estable de una formulación o método                             |
| `RecipeVersion`          | versión completa con vigencia y estado                                    |
| `RecipeIngredient`       | componente, cantidad, unidad, tolerancia y reglas                         |
| `RecipeStep`             | secuencia, instrucción, tiempo, equipo y control                          |
| `RecipeOutput`           | producto resultante y rendimiento esperado                                |
| `YieldSpecification`     | cantidad, unidad, merma técnica y rango esperado                          |
| `PortionSpecification`   | porción y reglas de redondeo                                              |
| `ProductSpecification`   | criterios técnicos, físicos, sensoriales o de conservación                |
| `NutritionProfile`       | valores, método, fuente y versión                                         |
| `AllergenDeclaration`    | presencia, posible contacto, fuente y estado                              |
| `Menu`                   | publicación comercial por alcance                                         |
| `MenuSection`            | agrupación comercial                                                      |
| `MenuItem`               | referencia comercial a producto o variante                                |
| `Offer`                  | configuración vendible por sede, canal y vigencia                         |
| `AvailabilityRule`       | política y causa de disponibilidad                                        |
| `ExternalProductMapping` | relación con identificadores de sistemas externos                         |
| `KnowledgeChange`        | solicitud, revisión, aprobación, publicación o retiro                     |

##### 7.2. Relación general

```text
CATALOG ITEM
├── roles
├── variantes
├── perfiles de medición
├── presentaciones
├── clasificaciones
├── especificaciones
├── nutrición
├── alérgenos
├── configuración por sede
└── mapeos externos
```

```text
RECIPE
└── RECIPE VERSION
    ├── ingredientes → CATALOG ITEM
    ├── pasos
    ├── salida → CATALOG ITEM
    ├── rendimiento
    ├── porción
    ├── conservación
    ├── alérgenos derivados
    └── evidencia y aprobación
```

```text
MENU
└── OFFER
    ├── sede
    ├── canal
    ├── MENU ITEM
    │   └── producto o variante vendible
    ├── vigencia
    ├── disponibilidad
    └── referencia de precio del dominio de venta
```

---

#### 8. Estados canónicos mínimos

##### 8.1. Producto o servicio

```text
DRAFT
→ ACTIVE
→ SUSPENDED
→ DISCONTINUED
→ ARCHIVED
```

Reglas:

- `DRAFT` no participa en operación;
- `ACTIVE` admite usos expresamente habilitados;
- `SUSPENDED` impide nuevos usos temporales;
- `DISCONTINUED` no admite nueva operación ordinaria;
- `ARCHIVED` conserva historia;
- ningún estado borra referencias.

##### 8.2. Presentación

```text
DRAFT
→ ACTIVE
→ INACTIVE
→ RETIRED
```

Una presentación retirada no desaparecerá de compras, recepciones, ventas o movimientos históricos.

##### 8.3. Versión de receta

```text
DRAFT
→ IN_REVIEW
→ APPROVED
→ PUBLISHED
→ SUPERSEDED
→ WITHDRAWN
```

Reglas:

- solo `PUBLISHED` podrá usarse ordinariamente;
- `SUPERSEDED` conserva historia;
- `WITHDRAWN` impide nuevos lotes;
- una corrección urgente no modifica silenciosamente la versión publicada.

##### 8.4. Especificación, nutrición o alérgenos

```text
DRAFT
→ PENDING_VERIFICATION
→ APPROVED
→ PUBLISHED
→ SUPERSEDED
→ WITHDRAWN
```

El estado deberá ser visible para impedir que información no verificada se publique como confirmada.

##### 8.5. Menú y oferta

```text
DRAFT
→ SCHEDULED
→ PUBLISHED
→ SUSPENDED
→ EXPIRED
→ RETIRED
```

##### 8.6. Disponibilidad operacional

```text
AVAILABLE
TEMPORARILY_UNAVAILABLE
OUT_OF_SCHEDULE
STOCK_BLOCKED
PRODUCTION_BLOCKED
QUALITY_BLOCKED
CHANNEL_DISABLED
SITE_DISABLED
UNKNOWN
```

La disponibilidad operacional no reemplaza el estado de publicación de la oferta.

---

#### 9. Propiedad funcional y tecnológica

| Resultado                                                       | Propietario funcional candidato      | Aplicación productora             | Consumidores principales                 |
| --------------------------------------------------------------- | ------------------------------------ | --------------------------------- | ---------------------------------------- |
| identidad maestra de producto, servicio, insumo y preparación   | Operaciones con gobierno empresarial | NEXO                              | ORIGO, FOGO, PULSO, PASS, NUMERA, VISO   |
| unidades, perfiles de medición y presentaciones físicas         | Operaciones e inventario             | NEXO                              | ORIGO, FOGO, PULSO cuando aplique        |
| clasificaciones operativas y de inventario                      | Operaciones                          | NEXO                              | FOGO, ORIGO, NUMERA                      |
| receta, método, rendimiento y porción                           | Producción                           | FOGO                              | NEXO, PULSO, NUMERA, PASS según contrato |
| especificación productiva y controles de receta                 | Producción y calidad                 | FOGO con referencias del catálogo | NEXO y supervisión                       |
| menú, oferta y disponibilidad comercial                         | Operación de venta                   | PULSO                             | PASS y canales externos                  |
| condiciones de compra y códigos del proveedor                   | Compras                              | ORIGO                             | NEXO y NUMERA                            |
| costos e indicadores derivados                                  | Finanzas                             | NUMERA                            | VISO y responsables autorizados          |
| experiencia de cliente                                          | Servicio al cliente                  | PASS                              | cliente final                            |
| navegación y administración transversal                         | Administración                       | VISO                              | usuarios administrativos                 |
| contratos, eventos, autorización y persistencia física aprobada | Arquitectura transversal             | SHELL/Supabase                    | todas las aplicaciones                   |

##### 9.1. Regla de administración

VISO podrá ofrecer una entrada administrativa unificada, pero cada guardado deberá:

1. invocar o redirigir al contrato de la aplicación propietaria;
2. validar autorización exacta;
3. conservar actor y origen;
4. evitar una segunda tabla o lógica de negocio;
5. mostrar el resultado confirmado por el propietario.

---

#### 10. Línea base de implementación verificable

La auditoría comprobó:

- catálogo maestro en NEXO/VISO;
- productos con datos reales;
- categorías, imágenes, proveedores y configuración por sede;
- presentaciones físicas y stock por presentación;
- perfiles y reglas de unidad;
- recetas con ingredientes, pasos, rendimientos y porciones;
- recetario operacional separado de la administración;
- recetas publicadas capaces de originar lotes;
- menús, oferta y disponibilidad distribuidos entre VISO, NEXO, PULSO y PASS;
- configuraciones comerciales y de canales;
- mapeos e importaciones parciales desde sistemas externos;
- 959 productos y 276 recetas reportados durante la auditoría.

La evidencia no demuestra todavía:

- un contrato único de identidad y roles del producto;
- ausencia de productos semánticamente duplicados;
- una precedencia única de unidades, perfiles y presentaciones;
- separación completa de categorías operativas y comerciales;
- versionado inmutable y coordinado de recetas;
- publicación controlada de nutrición y alérgenos;
- ciclo integral de especificaciones de calidad;
- propagación coordinada de cambios;
- una fuente única de menú y disponibilidad;
- paridad entre PULSO, PASS y canales externos;
- trazabilidad histórica completa cuando se retira o reemplaza un producto;
- que todas las aplicaciones consuman el mismo contrato.

---

#### 11. Matriz de decisión de cobertura

| Subcapacidad | Tratamiento         | Productora candidata                                    | Decisión                                                                             |
| ------------ | ------------------- | ------------------------------------------------------- | ------------------------------------------------------------------------------------ |
| `CAP-04.01`  | `REUSE_OR_REFACTOR` | NEXO                                                    | conservar el catálogo en uso y separar identidad, rol, variante y servicio           |
| `CAP-04.02`  | `REUSE_OR_REFACTOR` | NEXO                                                    | consolidar unidades, perfiles y presentaciones sin defaults silenciosos              |
| `CAP-04.03`  | `REUSE_OR_REFACTOR` | NEXO con taxonomías por dominio                         | separar clasificaciones operativas, productivas, comerciales y contables             |
| `CAP-04.04`  | `REUSE_OR_REFACTOR` | NEXO                                                    | convertir ingredientes y componentes en relaciones canónicas reutilizables           |
| `CAP-04.05`  | `REUSE_OR_REFACTOR` | FOGO                                                    | conservar recetas y recetario, incorporando versión, publicación y acceso contextual |
| `CAP-04.06`  | `REUSE_OR_REFACTOR` | FOGO                                                    | formalizar rendimiento, porción, escala, merma esperada y resultado real             |
| `CAP-04.07`  | `REUSE_OR_REFACTOR` | PULSO                                                   | consolidar menú y oferta; PASS y canales serán consumidores                          |
| `CAP-04.08`  | `BUILD`             | NEXO/FOGO según origen                                  | crear gobierno verificable de nutrición, alérgenos y advertencias                    |
| `CAP-04.09`  | `REUSE_OR_REFACTOR` | NEXO/FOGO                                               | convertir campos parciales en especificaciones versionadas por objeto                |
| `CAP-04.10`  | `BUILD`             | propietario de cada conocimiento con coordinación SHELL | crear ciclo común de revisión, publicación, vigencia, supersesión y retiro           |

##### 11.1. Resumen de clasificaciones

| Tratamiento         | Cantidad |
| ------------------- | -------: |
| `REUSE_OR_REFACTOR` |        8 |
| `BUILD`             |        2 |
| **Total**           |   **10** |

No se clasifica ninguna subcapacidad como `OUT_OF_SCOPE`, `RETIRE` o `DEFERRED`. Sí se retirarán implementaciones competidoras concretas, no la capacidad empresarial.

---

#### 12. CAP-04.01 — Definir productos y servicios

**Tratamiento:** `REUSE_OR_REFACTOR`  
**Propietaria candidata:** NEXO  
**Estado actual:** implementación verificada en uso

La identidad deberá registrar como mínimo:

- identificador estable;
- código canónico;
- nombre interno;
- nombre comercial cuando aplique;
- descripción;
- tipo maestro;
- roles empresariales;
- estado y vigencia;
- propietario funcional;
- organización o alcance aplicable;
- marca cuando corresponda;
- trazabilidad de creación y cambio.

##### 12.1. Tipos conceptuales mínimos

- producto físico;
- ingrediente;
- preparación intermedia;
- producto terminado;
- empaque;
- consumible operativo;
- servicio;
- elemento no inventariable;
- referencia externa pendiente de mapeo.

Los activos y reutilizables permanecerán en `CAP-07` aunque puedan compartir proveedores o códigos.

##### 12.2. Reglas

1. Un producto no se duplicará para cada sede.
2. Una presentación no creará otra identidad de producto.
3. Un proveedor no será propietario del producto maestro.
4. Un código externo no reemplazará el identificador interno.
5. Un servicio no recibirá stock artificial.
6. Un producto retirado conservará historia.
7. Una preparación intermedia podrá ser inventariable y producible.
8. La condición vendible será un rol o una oferta, no una consecuencia del nombre o categoría.

##### 12.3. Destinos

- `SUPA-AUD-019`;
- `DATA-NORM-AUD-004`;
- `SUPA-TRANS-005`;
- `SUPA-TRANS-007`;
- `SUPA-TRANS-012`;
- `NEXO-AUTH-014`;
- `SHELL-CON-001`;
- `SHELL-CON-016`;
- `READY-GATE-005`.

---

#### 13. CAP-04.02 — Definir presentaciones y unidades

**Tratamiento:** `REUSE_OR_REFACTOR`  
**Propietaria candidata:** NEXO  
**Estado actual:** implementación verificada en uso con precedencias competidoras detectadas

##### 13.1. Dimensiones permitidas

Cada unidad pertenecerá a una dimensión compatible:

- masa;
- volumen;
- conteo;
- longitud;
- área;
- tiempo, solo cuando corresponda a servicios o preparación;
- otra dimensión aprobada.

No se permitirá convertir masa a volumen sin una regla específica, versionada y contextual.

##### 13.2. Unidades diferenciadas

Se distinguirán:

- unidad canónica de stock;
- unidad de entrada;
- unidad de compra;
- unidad de receta;
- unidad de producción;
- unidad de remisión;
- unidad de venta;
- unidad de presentación;
- unidad de reporte.

Podrán coincidir, pero no se supondrá que son la misma.

##### 13.3. Presentación

Una presentación deberá conservar:

- producto;
- nombre;
- cantidad;
- unidad;
- factor hacia la unidad canónica;
- precisión;
- tolerancia;
- empaque;
- código o código de barras;
- imagen;
- estado;
- vigencia;
- ámbito de compra, venta, recepción, remisión o almacenamiento;
- relación con presentación de proveedor cuando aplique.

##### 13.4. Reglas de conversión

1. La conversión deberá ser determinista.
2. No se encadenarán factores ambiguos.
3. La precisión y el redondeo serán explícitos.
4. La misma presentación no tendrá factores incompatibles por aplicación.
5. Una sede podrá habilitar o deshabilitar una presentación sin redefinir su magnitud física.
6. Un producto medido por gramos no cambiará a conteo por sede sin una identidad o perfil aprobado.
7. Las excepciones deberán ser visibles, migrables y temporales.

##### 13.5. Destinos

- `BKL-NEXO-006`;
- `SUPA-AUD-019`;
- `DATA-NORM-AUD-003`;
- `DATA-NORM-AUD-004`;
- `SUPA-TRANS-005`;
- `SUPA-TRANS-007`;
- `SHELL-CON-001`;
- `TREQ-NEXO-008`;
- `TREQ-NEXO-010`.

---

#### 14. CAP-04.03 — Clasificar productos

**Tratamiento:** `REUSE_OR_REFACTOR`  
**Propietaria candidata:** NEXO para clasificación operativa; cada dominio conserva su taxonomía especializada

##### 14.1. Taxonomías mínimas

| Taxonomía    | Propósito                                                         | Productora                |
| ------------ | ----------------------------------------------------------------- | ------------------------- |
| tipo maestro | distinguir producto, servicio, ingrediente, preparación y empaque | NEXO                      |
| inventario   | comportamiento de stock, medición, lote y vencimiento             | NEXO                      |
| operacional  | búsqueda, almacenamiento, remisión y operación                    | NEXO                      |
| productiva   | área, familia y proceso de producción                             | FOGO                      |
| compra       | agrupación y gestión de abastecimiento                            | ORIGO                     |
| comercial    | navegación de menú y oferta                                       | PULSO                     |
| costo        | análisis y agrupación económica                                   | NUMERA                    |
| regulatoria  | alérgenos, nutrición, impuestos u obligaciones aplicables         | propietario especializado |

##### 14.2. Reglas

- una taxonomía declarará su propietario;
- una categoría tendrá código estable y vigencia;
- mover un producto entre categorías no alterará historia;
- una aplicación consumidora no editará una taxonomía ajena;
- una categoría no concederá permisos;
- una categoría no definirá conversiones;
- una categoría comercial no controlará stock;
- una categoría operativa no decidirá el orden visual del menú.

##### 14.3. Destinos

- `NEXO-AUTH-014`;
- `PULSO-UX-001`;
- `PULSO-UX-021`;
- `VISO-UX-017`;
- `VISO-UX-018`;
- `SHELL-CON-016`;
- `DATA-NORM-AUD-004`.

---

#### 15. CAP-04.04 — Gestionar ingredientes y componentes

**Tratamiento:** `REUSE_OR_REFACTOR`  
**Propietaria candidata:** NEXO para identidad; FOGO para uso dentro de receta

##### 15.1. Tipos de relación

- ingrediente;
- preparación intermedia;
- empaque primario;
- empaque secundario;
- decoración consumible;
- componente opcional;
- componente sustituible;
- componente informativo no consumido.

##### 15.2. Regla de referencia

Cada relación deberá utilizar:

- `item_id`;
- cantidad;
- unidad aprobada;
- tolerancia;
- orden o grupo;
- condición;
- vigencia;
- regla de sustitución cuando exista;
- efecto sobre alérgenos;
- efecto sobre costo e inventario.

No se aceptará un nombre libre como única identidad del ingrediente.

##### 15.3. Preparaciones intermedias

Una preparación intermedia:

- tendrá producto maestro;
- podrá tener receta propia;
- podrá generar lote;
- podrá almacenarse;
- podrá tener vencimiento;
- podrá consumirse en otra receta;
- conservará trazabilidad de origen.

##### 15.4. Integridad de composición

Se deberán detectar:

- ciclos de receta;
- referencias a productos retirados;
- unidades incompatibles;
- componentes sin factor;
- duplicados semánticos;
- sustituciones que cambian alérgenos;
- empaques contados como ingredientes nutricionales;
- componentes sin propietario.

##### 15.5. Destinos

- `OPS-REC-001`;
- `FOGO-UX-009`;
- `SUPA-AUD-019`;
- `DATA-NORM-AUD-004`;
- `SUPA-TRANS-005`;
- `INT-PROD-001` a `INT-PROD-004`.

---

#### 16. CAP-04.05 — Definir recetas y métodos de preparación

**Tratamiento:** `REUSE_OR_REFACTOR`  
**Propietaria candidata:** FOGO  
**Estado actual:** recetas, ingredientes, pasos y recetario comprobados en uso

##### 16.1. Identidad y versión

Una receta tendrá:

- identificador estable;
- producto o productos de salida;
- familia;
- área;
- propietario;
- sensibilidad;
- estado general.

Cada versión tendrá:

- número o código de versión;
- estado;
- vigencia;
- motivo;
- ingredientes;
- pasos;
- equipos;
- tiempos;
- temperaturas;
- controles;
- almacenamiento;
- vida útil;
- rendimiento;
- porción;
- alérgenos;
- evidencia;
- aprobadores.

##### 16.2. Publicación

Solo una versión publicada y válida podrá seleccionarse para nuevos lotes ordinarios.

La publicación deberá comprobar:

- ingredientes activos;
- unidades compatibles;
- salida definida;
- rendimiento;
- pasos;
- controles obligatorios;
- permisos;
- alérgenos;
- conservación;
- ausencia de ciclos;
- vigencia.

##### 16.3. Acceso contextual

Se distinguirá:

- administrar receta;
- revisar;
- aprobar;
- publicar;
- retirar;
- ver recetario operativo;
- ver cantidades completas;
- ver fórmula sensible;
- ejecutar un paso;
- registrar resultado.

Un trabajador podrá recibir instrucciones suficientes para operar sin obtener automáticamente acceso administrativo o transversal a fórmulas reservadas.

##### 16.4. Correcciones

Una receta publicada:

- no se sobrescribirá;
- no eliminará ingredientes históricos;
- no cambiará lotes anteriores;
- no se corregirá mediante texto libre sin versión;
- podrá retirarse y reemplazarse mediante una nueva versión vinculada.

##### 16.5. Destinos

- `OPS-REC-001`;
- `FOGO-AUTH-013`;
- `FOGO-UX-008`;
- `FOGO-UX-009`;
- `FOGO-AUTH-016`;
- `OPS-TRZ-001`;
- `TREQ-FOGO-002`.

---

#### 17. CAP-04.06 — Definir rendimientos y porciones

**Tratamiento:** `REUSE_OR_REFACTOR`  
**Propietaria candidata:** FOGO

##### 17.1. Rendimiento esperado

Deberá declarar:

- cantidad de salida;
- unidad;
- rango o tolerancia;
- merma técnica esperada;
- número de porciones;
- peso o volumen por porción;
- regla de redondeo;
- escala mínima y máxima;
- supuestos;
- versión de receta.

##### 17.2. Escalamiento

El escalamiento deberá definir:

- qué ingredientes escalan linealmente;
- qué ingredientes requieren regla específica;
- cómo se redondean unidades discretas;
- cómo se tratan tiempos y equipos;
- cómo se distribuyen lotes;
- qué límites no pueden excederse;
- cómo se registra una sustitución.

##### 17.3. Resultado real

La ejecución registrará por separado:

- cantidad producida;
- cantidad liberada;
- merma;
- reproceso;
- rechazo;
- porciones reales;
- desviación;
- motivo;
- evidencia.

##### 17.4. Fronteras

- FOGO conserva el resultado productivo;
- NEXO recibe movimientos confirmados;
- NUMERA calcula costo y variación;
- PULSO no modifica rendimiento;
- PASS no consume datos internos salvo información expresamente publicable.

##### 17.5. Destinos

- `OPS-REC-001`;
- `FOGO-UX-005` a `FOGO-UX-013`;
- `INT-PROD-001` a `INT-PROD-005`;
- `CAP-SCOPE-008`;
- `OPS-CST-001`;
- `TREQ-FOGO-001`;
- `TREQ-FOGO-002`.

---

#### 18. CAP-04.07 — Gestionar menús y disponibilidad

**Tratamiento:** `REUSE_OR_REFACTOR`  
**Propietaria candidata:** PULSO  
**Consumidores:** PASS y canales externos

##### 18.1. Menú y oferta

Se distinguirán:

```text
MENÚ
→ estructura publicada para un alcance

ÍTEM DE MENÚ
→ representación comercial de un producto o variante

OFERTA
→ posibilidad concreta de vender en sede, canal y vigencia

DISPONIBILIDAD
→ estado operacional actual de la oferta
```

##### 18.2. Alcances

Una oferta podrá limitarse por:

- empresa;
- marca;
- sede;
- zona;
- canal;
- terminal;
- horario;
- día;
- modalidad de servicio;
- segmento;
- campaña;
- versión de menú.

##### 18.3. Disponibilidad

La decisión podrá considerar:

- publicación;
- horario;
- configuración de sede;
- canal;
- stock estricto;
- disponibilidad de presentación;
- insumos críticos;
- capacidad productiva;
- calidad;
- mantenimiento;
- bloqueo manual;
- dependencia externa.

El contrato declarará qué señales son obligatorias y cuáles informativas.

##### 18.4. Agotado temporal

Un override manual deberá conservar:

- actor;
- sede;
- canal;
- producto u oferta;
- causa;
- inicio;
- expiración;
- comentario;
- restauración;
- auditoría.

No permanecerá indefinidamente sin revisión.

##### 18.5. PASS

PASS:

- consultará la publicación vigente;
- no mantendrá un catálogo editable independiente;
- no inventará disponibilidad;
- mostrará estado desconocido o desactualizado cuando corresponda;
- conservará el identificador canónico al crear carrito o pedido.

##### 18.6. Canales externos

Cada mapeo externo deberá conservar:

- sistema;
- ambiente;
- identificador externo;
- producto Vento;
- variante;
- presentación;
- receta cuando sea necesaria;
- vigencia;
- estado;
- última conciliación.

Una línea sin mapeo irá a cuarentena y no producirá efectos automáticos de inventario o costo.

##### 18.7. Destinos

- `PULSO-UX-001`;
- `PULSO-UX-007`;
- `PULSO-UX-020`;
- `PULSO-UX-021`;
- `PASS-UX-001`;
- `INT-POS-011`;
- `INT-POS-012`;
- `INT-POS-020`;
- `SHELL-CON-016`;
- `TREQ-INTEGRATION-009`.

---

#### 19. CAP-04.08 — Gestionar información nutricional y alérgenos

**Tratamiento:** `BUILD`  
**Propietaria candidata:** NEXO para producto comprado; FOGO para información derivada de receta; publicación comercial mediante PULSO

##### 19.1. Fuentes

Una declaración podrá provenir de:

- ficha técnica del proveedor;
- etiqueta del fabricante;
- cálculo desde ingredientes;
- cálculo profesional;
- análisis de laboratorio;
- documento regulatorio;
- declaración interna verificada.

La fuente deberá conservarse como evidencia.

##### 19.2. Estados de confianza

```text
NO_REGISTRADO
DECLARADO_POR_PROVEEDOR
CALCULADO
ESTIMADO
VERIFICADO_PROFESIONALMENTE
VERIFICADO_POR_LABORATORIO
VENCIDO
REQUIERE_REVISION
```

La interfaz no presentará todos los estados como equivalentes.

##### 19.3. Alérgenos

La declaración deberá contemplar:

- presencia directa;
- derivado;
- ingrediente compuesto;
- sustitución;
- posible contacto cruzado;
- instalación compartida;
- cambio de proveedor;
- cambio de receta;
- ausencia no verificada.

##### 19.4. Propagación

Un cambio en:

- ingrediente;
- proveedor;
- presentación;
- receta;
- sustitución;
- proceso;
- instalación;
- empaque;

deberá marcar para revisión las declaraciones dependientes.

##### 19.5. Publicación

PULSO y PASS solo publicarán información:

- vigente;
- asociada al producto u oferta correctos;
- con estado permitido;
- con advertencia aplicable;
- sin exponer fórmula confidencial.

##### 19.6. Destinos

- `OPS-REC-001`;
- `CAP-SCOPE-008`;
- `CAP-SCOPE-016`;
- `EVID-ARC-001` a `EVID-ARC-010`;
- `FOGO-AUTH-013`;
- `PULSO-UX-021`;
- `PASS-UX-001`;
- `TREQ-FOGO-002`;
- `TREQ-INTEGRATION-009`.

---

#### 20. CAP-04.09 — Gestionar calidad y especificaciones

**Tratamiento:** `REUSE_OR_REFACTOR`  
**Propietaria candidata:** NEXO para especificación maestra de producto o presentación; FOGO para especificación productiva y de salida

##### 20.1. Tipos de especificación

- identificación y descripción;
- composición;
- dimensiones o peso;
- tolerancia;
- condición de empaque;
- temperatura;
- conservación;
- vida útil;
- criterio sensorial;
- criterio de aceptación;
- fotografía o patrón;
- documento técnico;
- requisito de proveedor;
- requisito productivo;
- requisito de liberación.

##### 20.2. Objeto

Cada especificación indicará si aplica a:

- materia prima;
- producto;
- presentación;
- proveedor específico;
- preparación intermedia;
- receta;
- producto terminado;
- empaque.

##### 20.3. Uso

- ORIGO y recepción consultarán criterios aplicables;
- FOGO aplicará controles productivos;
- NEXO conservará condición física e inventario;
- CAP-08 gestionará inspección, liberación, retención o rechazo;
- CAP-03 gestionará la dimensión SST o inocuidad que corresponda;
- CAP-13 gestionará equipos e instalaciones.

##### 20.4. Vigencia

Una nueva especificación:

- no alterará recepciones o lotes anteriores;
- conservará versión;
- tendrá fecha efectiva;
- podrá coexistir durante transición controlada;
- declarará productos, presentaciones y proveedores afectados.

##### 20.5. Destinos

- `OPS-REC-001`;
- `CAP-SCOPE-005`;
- `CAP-SCOPE-008`;
- `CAP-SCOPE-013`;
- `OPS-TRZ-001`;
- `EVID-ARC-001` a `EVID-ARC-010`;
- `TREQ-SUPABASE-012`;
- `TREQ-FOGO-002`.

---

#### 21. CAP-04.10 — Gestionar cambios y vigencia del conocimiento

**Tratamiento:** `BUILD`  
**Propietario:** cada aplicación sobre su conocimiento; coordinación transversal mediante contratos y eventos de SHELL

##### 21.1. Ciclo mínimo

```text
SOLICITUD DE CAMBIO
→ BORRADOR
→ REVISIÓN
→ APROBACIÓN
→ PUBLICACIÓN PROGRAMADA
→ VIGENCIA
→ SUPERSESIÓN O RETIRO
→ VERIFICACIÓN DE CONSUMIDORES
```

##### 21.2. Cambio

Cada cambio conservará:

- objeto;
- versión anterior;
- versión nueva;
- motivo;
- solicitante;
- revisor;
- aprobador;
- fecha efectiva;
- consumidores afectados;
- migración o backfill si aplica;
- evidencia;
- rollback;
- estado de propagación.

##### 21.3. Impacto

Se deberá calcular o declarar impacto sobre:

- inventario;
- compras;
- recetas;
- lotes;
- costos;
- menús;
- pedidos;
- etiquetas;
- alérgenos;
- nutrición;
- canales externos;
- reportes;
- documentos;
- capacitación.

##### 21.4. Coordinación

Ningún cambio se considerará completado solo porque se guardó en la aplicación propietaria.

Deberá comprobarse:

- publicación;
- consumo;
- invalidación de caché;
- sincronización;
- tratamiento offline;
- compatibilidad;
- conciliación;
- retiro de fuente anterior.

##### 21.5. Destinos

- `SHELL-CON-001`;
- `SHELL-CON-016`;
- `SUPA-TRANS-007`;
- `SUPA-TRANS-012`;
- `INT-APP-010`;
- `INT-DB-008`;
- `SHELL-CI-001` a `SHELL-CI-019`;
- `READY-GATE-005`;
- `TREQ-SUPABASE-012`;
- `TREQ-INTEGRATION-009`.

---

#### 22. Fronteras con otros dominios

##### 22.1. Compras

`CAP-05` gobierna:

- proveedor;
- oferta;
- negociación;
- orden;
- recepción comercial;
- devolución.

`CAP-04` gobierna:

- identidad del producto;
- presentación canónica;
- unidad;
- especificación.

Una presentación de proveedor se mapeará a una presentación canónica o quedará pendiente de validación.

##### 22.2. Inventario

`CAP-06` gobierna:

- existencia;
- ubicación;
- lote;
- movimiento;
- vencimiento;
- conteo;
- ajuste.

`CAP-04` gobierna qué es el elemento y cómo se mide. La existencia no redefine producto ni receta.

##### 22.3. Producción

`CAP-08` gobierna:

- necesidad;
- orden;
- lote;
- ejecución;
- consumo;
- merma;
- resultado;
- liberación.

`CAP-04` gobierna la receta y conocimiento utilizado.

##### 22.4. Venta

`CAP-09` gobierna:

- precio;
- pedido;
- línea;
- descuento;
- pago;
- caja;
- anulación;
- devolución.

`CAP-04.07` gobierna la estructura de menú, oferta y disponibilidad que la venta consume.

##### 22.5. Clientes

`CAP-10` gobierna experiencia, relación y reclamo. PASS no modifica el producto maestro ni la receta.

##### 22.6. Costos

`CAP-12` calcula y registra costo, margen y efecto económico. No modifica unidades, receta o rendimiento para ajustar el resultado financiero.

##### 22.7. Documentos y evidencia

`CAP-16` gobierna conservación, acceso y evidencia. La aplicación propietaria conserva el hecho y referencia sus documentos.

---

#### 23. Información conceptual requerida

##### 23.1. Producto

- identidad;
- código;
- tipo;
- roles;
- estado;
- vigencia;
- nombre interno;
- nombre comercial;
- marca;
- descripción;
- propietario;
- taxonomías;
- configuración por sede;
- referencias externas.

##### 23.2. Presentación y medición

- dimensión;
- unidad;
- precisión;
- perfil;
- factor;
- tolerancia;
- empaque;
- código;
- uso;
- vigencia.

##### 23.3. Receta

- identidad;
- versión;
- salida;
- ingredientes;
- unidades;
- pasos;
- equipos;
- controles;
- rendimiento;
- porción;
- conservación;
- alérgenos;
- sensibilidad;
- aprobación;
- vigencia.

##### 23.4. Menú y oferta

- menú;
- sección;
- ítem;
- producto o variante;
- sede;
- canal;
- horario;
- configuración;
- disponibilidad;
- publicación;
- referencia de precio;
- mapeo externo.

##### 23.5. Calidad, nutrición y alérgenos

- objeto;
- versión;
- fuente;
- método;
- valores;
- unidad;
- estado;
- advertencia;
- evidencia;
- responsable;
- vigencia.

---

#### 24. Eventos e integraciones requeridos

Eventos conceptuales candidatos:

```text
catalog.item.created
catalog.item.updated
catalog.item.suspended
catalog.item.discontinued
catalog.presentation.published
catalog.measurement.changed
catalog.taxonomy.assignment.changed
recipe.version.submitted
recipe.version.approved
recipe.version.published
recipe.version.superseded
recipe.version.withdrawn
product.specification.published
product.allergen.review.required
menu.published
offer.published
offer.suspended
offer.availability.changed
external_product_mapping.changed
```

Cada evento deberá incluir:

- identificador;
- versión;
- productor;
- actor;
- instante;
- objeto;
- versión anterior y nueva cuando corresponda;
- alcance;
- causa;
- correlación;
- contrato;
- resultado esperado de consumidores.

##### 24.1. Integraciones obligatorias

- NEXO → FOGO: producto, presentación, unidad y configuración aplicable;
- FOGO → NEXO: producto terminado, consumos y versión de receta;
- FOGO → NUMERA: rendimiento y hechos productivos confirmados;
- PULSO → PASS: menú y oferta publicadas;
- PULSO ↔ POS externo: mapeo de producto, presentación y receta;
- ORIGO → NEXO: presentación de proveedor aceptada;
- propietarios → VISO: estado administrativo y enlaces;
- todas → SHELL: contratos, eventos, autorización y observabilidad.

---

#### 25. Autorización y segregación

##### 25.1. Capacidades separadas

Como mínimo se distinguirán:

- consultar catálogo;
- crear producto;
- editar borrador;
- activar;
- suspender;
- retirar;
- administrar unidades;
- administrar presentaciones;
- administrar taxonomías;
- crear receta;
- editar receta borrador;
- revisar receta;
- aprobar receta;
- publicar receta;
- retirar receta;
- ver recetario;
- ver fórmula sensible;
- administrar especificación;
- administrar alérgenos;
- publicar información comercial;
- administrar menú;
- cambiar disponibilidad;
- ejecutar override de agotado;
- mapear producto externo.

##### 25.2. Segregación

Cuando el riesgo lo exija:

```text
CREAR
≠ APROBAR
≠ PUBLICAR
```

No todo cambio requerirá tres personas diferentes, pero el contrato deberá permitir:

- separación;
- aprobación reforzada;
- motivo;
- auditoría;
- doble control para cambios críticos.

##### 25.3. Alcance

La autorización deberá considerar:

- aplicación;
- tipo de conocimiento;
- empresa;
- sede;
- área;
- categoría;
- producto;
- receta;
- sensibilidad;
- estado;
- acción.

##### 25.4. Fórmulas sensibles

El acceso a cantidades completas o formulaciones reservadas podrá ser más restringido que:

- ver el producto;
- ver alérgenos;
- ejecutar un paso;
- consultar una instrucción operativa;
- consultar el recetario.

La restricción no deberá impedir que el trabajador reciba información de seguridad necesaria.

##### 25.5. Dispositivo compartido y simulación

- la edición administrativa no se realizará desde una estación compartida salvo diseño expreso;
- el recetario operativo podrá mostrarse bajo límites del dispositivo y actor;
- la simulación no publicará ni retirará conocimiento;
- toda modificación conservará actor real;
- URL o RPC directa no ampliará permiso.

---

#### 26. Experiencia por aplicación

##### 26.1. NEXO

Deberá separar:

- catálogo maestro;
- medición;
- presentaciones;
- proveedores;
- configuración por sede;
- clasificación;
- especificaciones;
- operación de inventario.

La pantalla maestra no mezclará en un único formulario todas las configuraciones comerciales, productivas y financieras.

##### 26.2. FOGO administrativo

Deberá permitir:

- crear y versionar;
- comparar versiones;
- revisar impacto;
- validar ingredientes;
- definir pasos;
- definir rendimiento;
- gestionar evidencia;
- aprobar;
- publicar;
- retirar.

##### 26.3. FOGO operativo

El recetario deberá:

- mostrar la versión vigente;
- mostrar sede, área y salida;
- presentar pasos en orden;
- minimizar lectura;
- mostrar controles críticos;
- diferenciar información obligatoria y apoyo;
- funcionar en dispositivo real;
- evitar exposición innecesaria de administración;
- conservar versión si opera temporalmente offline.

##### 26.4. PULSO

Deberá administrar:

- menús;
- secciones;
- ofertas;
- disponibilidad;
- horarios;
- sede;
- canal;
- configuración vendible;
- overrides temporales;
- mapeos con venta.

##### 26.5. PASS

Deberá:

- mostrar publicación vigente;
- usar datos comerciales;
- mostrar disponibilidad y advertencias;
- no exponer datos internos;
- conservar identidad al pedir;
- tratar caché y pérdida de red de forma explícita.

##### 26.6. VISO

Deberá mostrar:

- aplicación propietaria;
- estado;
- última publicación;
- incidencias;
- enlace administrativo;
- impacto transversal.

No guardará una copia competidora.

---

#### 27. Operación offline y contingencia

##### 27.1. Recetario

Cuando se permita uso offline:

- solo se almacenarán versiones publicadas;
- se conservará identificador y versión;
- se mostrará fecha de sincronización;
- no se sustituirá silenciosamente una versión;
- se invalidará cuando exista retiro crítico;
- se definirá contingencia cuando no pueda comprobarse vigencia;
- el acceso seguirá protegido en el dispositivo.

##### 27.2. Menú y disponibilidad

Ante pérdida de conectividad:

- PULSO y PASS distinguirán dato confirmado de caché;
- un estado desconocido no se presentará como disponible;
- los overrides pendientes mostrarán su condición;
- la recuperación conciliará cambios;
- no se duplicarán publicaciones ni acciones;
- se conservará el último estado conocido con timestamp.

##### 27.3. Administración

La edición offline de catálogo, recetas o menús no queda autorizada por esta tarea. Si se diseña posteriormente deberá usar versión, conflicto, idempotencia y reconciliación.

---

#### 28. Evidencia, conservación y auditoría

Cada cambio deberá conservar, según aplique:

- actor;
- aplicación;
- objeto;
- versión;
- antes;
- después;
- motivo;
- aprobación;
- fecha efectiva;
- evidencia;
- consumidores;
- resultado de propagación;
- error;
- rollback;
- conciliación.

Los archivos deberán seguir la arquitectura de evidencia aprobada y no residir en buckets públicos por conveniencia.

---

#### 29. Patrones legacy destinados a retiro

Se deberán retirar progresivamente, con evidencia y compatibilidad:

- productos duplicados por aplicación;
- productos duplicados por sede;
- ingredientes escritos únicamente como texto;
- unidades libres;
- factores de conversión predeterminados por ausencia de datos;
- cadenas de conversión incompatibles;
- categorías usadas para varias semánticas;
- categorías comerciales dentro de NEXO como fuente operativa;
- catálogo editable propio de PASS;
- configuración comercial duplicada en VISO;
- menús hardcodeados;
- disponibilidad derivada solo de `is_active`;
- recetas publicadas editadas en sitio;
- lotes que no conservan versión de receta;
- nutrición o alérgenos sin fuente;
- eliminación física de productos usados;
- mapeos externos por nombre;
- fallbacks que ocultan datos incompletos.

`RETIRE` aplica a estos patrones, no a las subcapacidades empresariales.

---

#### 30. Preguntas pendientes reutilizadas

No se crean preguntas nuevas.

| Pregunta | Uso dentro de esta tarea                                             | Puerta de resolución                                |
| -------- | -------------------------------------------------------------------- | --------------------------------------------------- |
| `DAT-03` | confirmar granularidad real de producto vendido en exportación Makos | `INT-POS-001` a `INT-POS-011`                       |
| `DAT-04` | confirmar fuente operativa usada para disponibilidad de producto     | `CAP-SCOPE-006` y validación de NEXO                |
| `TEC-06` | evidencia de estructuras actuales de inventario                      | `SUPA-AUD-019` y `CAP-SCOPE-006`                    |
| `TEC-08` | evidencia de estructuras actuales de recetas y producción            | `OPS-REC-001` y `CAP-SCOPE-008`                     |
| `TEC-18` | evidencia de contratos duplicados de producto entre aplicaciones     | `SHELL-CON-001`, `SHELL-CON-016` y `SUPA-TRANS-007` |

Las decisiones conceptuales de esta tarea no dependen de que estas preguntas queden respondidas inmediatamente. Sus respuestas sí serán obligatorias antes de migrar datos, integrar el POS o aprobar readiness.

---

#### 31. Riesgos principales

| Riesgo                                | Severidad | Control principal                       |
| ------------------------------------- | --------- | --------------------------------------- |
| producto duplicado entre aplicaciones | crítica   | identidad maestra y propiedad funcional |
| conversión incompatible               | crítica   | perfil y factor canónicos               |
| receta histórica alterada             | crítica   | versión inmutable                       |
| lote sin receta exacta                | crítica   | snapshot y referencia de versión        |
| ingrediente libre o ambiguo           | alta      | referencia a catálogo                   |
| alérgeno incorrecto                   | crítica   | fuente, revisión y propagación          |
| menú divergente entre canales         | alta      | publicación única desde PULSO           |
| venta de producto no disponible       | alta      | política explícita de disponibilidad    |
| producto activo pero no vendible      | alta      | roles y oferta separados                |
| producto retirado borrado             | crítica   | retiro no destructivo                   |
| precio o costo usado como identidad   | alta      | separación de dominios                  |
| VISO como catálogo paralelo           | alta      | enlace al propietario                   |
| mapeo externo por nombre              | crítica   | identificadores y cuarentena            |
| receta sensible expuesta              | alta      | permiso contextual                      |
| cambio sin propagación                | crítica   | evento, conciliación y evidencia        |

---

#### 32. Hallazgos y destinos canónicos

| ID                    | Hallazgo                                                                                            | Riesgo  | Tarea propietaria                                                      | Momento                                    |
| --------------------- | --------------------------------------------------------------------------------------------------- | ------- | ---------------------------------------------------------------------- | ------------------------------------------ |
| `H-CAP-SCOPE-004-001` | producto, variante, presentación, unidad y oferta no tienen todavía separación contractual completa | crítica | `SUPA-AUD-019`; `SHELL-CON-001`; `SHELL-CON-016`                       | E3 antes de migrar catálogo                |
| `H-CAP-SCOPE-004-002` | existen contratos y tipos de producto repetidos entre NEXO, FOGO, ORIGO, PULSO y NUMERA             | crítica | `SUPA-AUD-019`; `SUPA-TRANS-007`; `SHELL-CON-001`                      | E3                                         |
| `H-CAP-SCOPE-004-003` | perfiles, unidades, presentaciones y precedencias pueden producir resultados incompatibles          | crítica | `BKL-NEXO-006`; `DATA-NORM-AUD-004`; `SUPA-TRANS-005`                  | antes de modificar inventario o producción |
| `H-CAP-SCOPE-004-004` | categorías operativas y comerciales pueden mezclarse o duplicarse                                   | alta    | `NEXO-AUTH-014`; `PULSO-UX-021`; `VISO-UX-017`                         | E2                                         |
| `H-CAP-SCOPE-004-005` | no está demostrado un ciclo inmutable completo de versiones de receta                               | crítica | `OPS-REC-001`; `FOGO-UX-009`; `FOGO-AUTH-013`                          | E2 antes de ampliar producción             |
| `H-CAP-SCOPE-004-006` | ingredientes y preparaciones pueden conservar relaciones o nombres competidores                     | alta    | `OPS-REC-001`; `SUPA-AUD-019`; `DATA-NORM-AUD-004`                     | E2/E3                                      |
| `H-CAP-SCOPE-004-007` | rendimiento esperado, porción, merma técnica y resultado real no tienen todavía contrato cerrado    | alta    | `OPS-REC-001`; `FOGO-UX-010`; `CAP-SCOPE-008`                          | E2                                         |
| `H-CAP-SCOPE-004-008` | menú, oferta y disponibilidad están distribuidos entre varias aplicaciones                          | crítica | `PULSO-UX-001`; `PULSO-UX-021`; `PASS-UX-001`; `SHELL-CON-016`         | E2                                         |
| `H-CAP-SCOPE-004-009` | disponibilidad puede confundirse con activo, stock o visibilidad                                    | alta    | `PULSO-UX-021`; `CAP-SCOPE-009`; `CAP-SCOPE-018`                       | E2                                         |
| `H-CAP-SCOPE-004-010` | información nutricional y alérgenos no tienen gobierno integral comprobado                          | crítica | `OPS-REC-001`; `CAP-SCOPE-008`; `CAP-SCOPE-016`                        | E2 antes de publicación                    |
| `H-CAP-SCOPE-004-011` | especificaciones de calidad existen solo de forma parcial o dispersa                                | alta    | `OPS-REC-001`; `CAP-SCOPE-005`; `CAP-SCOPE-008`                        | E2                                         |
| `H-CAP-SCOPE-004-012` | cambios de producto, receta y menú no tienen vigencia coordinada entre consumidores                 | crítica | `SUPA-TRANS-007`; `INT-APP-010`; `INT-DB-008`                          | E3/E4                                      |
| `H-CAP-SCOPE-004-013` | el POS externo requiere mapeo explícito hacia producto, presentación y receta                       | crítica | `INT-POS-011`; `INT-POS-012`; `INT-POS-020`                            | antes de habilitar efectos                 |
| `H-CAP-SCOPE-004-014` | VISO puede actuar como superficie administrativa sin frontera suficiente de propiedad               | alta    | `VISO-UX-017`; `VISO-UX-018`; `SHELL-CON-016`                          | E2                                         |
| `H-CAP-SCOPE-004-015` | el retiro o cambio puede romper referencias históricas si se elimina información                    | crítica | `SUPA-TRANS-012`; `DATA-NORM-AUD-004`; `EVID-ARC-001` a `EVID-ARC-010` | E3                                         |
| `H-CAP-SCOPE-004-016` | no existe prueba transversal de paridad del catálogo y menú entre todos los consumidores            | alta    | `SHELL-CI-001` a `SHELL-CI-019`; `UX-QA-025`; `UX-QA-027`; `UX-QA-029` | E5 y BLOQUE U                              |

Todos los hallazgos tienen propietario y puerta. No queda pendiente narrativo sin destino.

---

#### 33. Decisiones canónicas resultantes

1. NEXO conserva la candidatura de fuente maestra de identidad de producto, presentación y medición.
2. FOGO conserva la propiedad de receta, método, rendimiento, porción y ejecución productiva.
3. PULSO conserva la propiedad de menú, oferta y disponibilidad comercial.
4. PASS será consumidor de la publicación comercial, no catálogo maestro.
5. ORIGO conservará condiciones de compra y referencias del proveedor sin recrear producto.
6. NUMERA consumirá costos y resultados sin modificar el conocimiento de producto.
7. VISO actuará como superficie administrativa y de enlace, no como propietario implícito.
8. Producto, variante, presentación, unidad, receta, versión e ítem de menú serán conceptos distintos.
9. Un producto podrá tener roles múltiples sin duplicación.
10. Los servicios no heredarán inventario artificial.
11. Las taxonomías se separarán por propósito.
12. Los ingredientes deberán referenciar identidades canónicas.
13. Las preparaciones intermedias serán productos de primera clase.
14. Las recetas publicadas serán inmutables.
15. Cada lote conservará la versión efectivamente utilizada.
16. Rendimiento esperado y real se conservarán por separado.
17. Menú, oferta y disponibilidad tendrán estados distintos.
18. Stock no implicará automáticamente disponibilidad.
19. Nutrición y alérgenos exigirán fuente y estado de verificación.
20. Las especificaciones tendrán objeto, versión y vigencia.
21. El retiro será no destructivo.
22. Los cambios deberán propagarse y verificarse en consumidores.
23. Los mapeos externos usarán identificadores, no nombres.
24. Las líneas externas no mapeadas quedarán en cuarentena.
25. La familia `CAP-04` se considera existente y reutilizable, pero no cerrada.

---

#### 34. Requisitos de prueba derivados

Esta tarea genera tres requisitos distintos y no duplicados:

```text
TREQ-SUPABASE-012
TREQ-FOGO-002
TREQ-INTEGRATION-009
```

Los detalles completos se incorporan exclusivamente en el archivo canónico `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` regenerado.

No se entregan filas independientes.

##### 34.1. `TREQ-SUPABASE-012`

Protege:

- separación entre entidades de catálogo;
- identificadores y relaciones estables;
- integridad referencial;
- retiro no destructivo;
- versiones y vigencias;
- historia de referencias.

##### 34.2. `TREQ-FOGO-002`

Protege:

- receta publicada inmutable;
- versión exacta por lote;
- ingredientes y unidades canónicos;
- escalamiento;
- rendimiento y porción;
- alérgenos y especificaciones;
- acceso contextual.

##### 34.3. `TREQ-INTEGRATION-009`

Protege:

- propiedad única de menú y oferta;
- paridad PULSO/PASS/canales;
- disponibilidad con causa;
- mapeos externos;
- propagación y conciliación;
- ausencia de catálogos competidores.

---

#### 35. Dependencias habilitadas y restricciones

`CAP-SCOPE-004` habilita conceptualmente:

- `CAP-SCOPE-005`;
- `CAP-SCOPE-006`;
- `CAP-SCOPE-008`;
- `CAP-SCOPE-009`;
- `CAP-SCOPE-012`;
- `CAP-SCOPE-016`;
- `CAP-SCOPE-017`;
- `OPS-REC-001`;
- `OPS-PRD-001`;
- `OPS-TRZ-001`;
- diseño TO-BE de FOGO;
- contrato de productos y eventos;
- auditoría y transición de Supabase;
- mapeo del POS externo;
- paquetes E5 de NEXO, FOGO, PULSO y PASS.

No autoriza:

- migración;
- refactor;
- publicación;
- modificación de recetas;
- cambio de menú;
- activación de inventario;
- integración de POS;
- cálculo o publicación nutricional;
- eliminación de productos.

---

#### 36. Criterios de aceptación

`CAP-SCOPE-004` podrá aprobarse cuando:

1. las diez subcapacidades tengan tratamiento explícito;
2. producto, variante, presentación, unidad, receta e ítem de menú estén separados;
3. exista propietario candidato por resultado;
4. NEXO, FOGO, PULSO, PASS, ORIGO, NUMERA y VISO tengan fronteras explícitas;
5. la receta se defina como conocimiento versionado;
6. el lote conserve la versión usada;
7. rendimiento esperado y real se separen;
8. menú, oferta y disponibilidad se distingan;
9. stock no se trate como única causa de disponibilidad;
10. nutrición y alérgenos exijan fuente;
11. calidad y especificaciones tengan objeto y vigencia;
12. el retiro sea no destructivo;
13. los cambios tengan ciclo y propagación;
14. los dieciséis hallazgos tengan destino;
15. no se creen preguntas narrativas sin dueño;
16. se generen los tres requisitos de prueba;
17. el registro `04A` completo tenga 89 requisitos válidos;
18. ninguna fila del registro tenga más o menos de catorce columnas;
19. no se autorice implementación;
20. la continuidad quede en `CAP-SCOPE-005`.

---

#### 37. Resultado y continuidad

**Estado:** PROPUESTA PARA APROBACIÓN

Al aprobarse:

- `CAP-SCOPE-004` será la decisión canónica de cobertura para producto, presentación, unidad, receta, menú y conocimiento asociado;
- `TREQ-SUPABASE-012`, `TREQ-FOGO-002` y `TREQ-INTEGRATION-009` quedarán incorporados al registro canónico;
- NEXO, FOGO y PULSO conservarán propiedades diferenciadas;
- PASS, ORIGO, NUMERA y VISO quedarán como consumidores o superficies según sus fronteras;
- ninguna implementación física quedará autorizada;
- la continuidad será:

```text
CAP-SCOPE-005 — Evaluar compras, proveedores, contratos, precios y abastecimiento
```


### ✅ CAP-SCOPE-005 — Evaluar compras, proveedores, contratos, precios y abastecimiento

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Dependencia cumplida:** `CAP-SCOPE-004` aprobada  
**Tarea anterior:** `CAP-SCOPE-004`  
**Siguiente tarea reservada:** `CAP-SCOPE-006`  
**Familia evaluada:** `CAP-05 — Abastecer la operación`  
**Naturaleza:** decisión de cobertura empresarial y definición conceptual objetivo  
**Implementación técnica:** no autorizada  
**Migraciones o cambios en Supabase:** no autorizados  
**Compras, aprobaciones, recepciones o devoluciones reales:** no autorizadas  
**Requisitos de prueba generados:** `TREQ-ORIGO-004`, `TREQ-ORIGO-005`, `TREQ-INTEGRATION-010`  
**Actualización del registro de pruebas:** se entrega el archivo `04A` completo regenerado; quedan prohibidas las filas sueltas

---

#### 1. Propósito

Definir el tratamiento objetivo de las capacidades mediante las cuales Vento Group deberá:

- convertir señales de demanda, faltantes, producción, ventas y mínimos en necesidades trazables de abastecimiento;
- distinguir una necesidad de compra, una solicitud, un caso de abastecimiento, una cotización, una oferta, una condición acordada, un contrato, una orden de compra, una recepción y una obligación financiera;
- conservar un maestro único de proveedores con identidad, estado, sedes, contactos, documentos y restricciones;
- relacionar cada proveedor con productos, servicios, presentaciones de compra, cantidades mínimas, tiempos, precios y condiciones versionadas;
- solicitar, recibir y comparar ofertas sin reducir la decisión al precio más bajo;
- registrar negociaciones y acuerdos sin intentar automatizar la interacción humana;
- aplicar políticas de aprobación por empresa, sede, centro de costo, categoría, monto, riesgo y urgencia;
- emitir órdenes con revisión, vigencia, aceptación, cancelación y trazabilidad;
- recibir bienes y servicios contra la orden aprobada, incluyendo recepciones parciales, diferencias, lotes, vencimientos, calidad y documentos;
- vincular la recepción empresarial de ORIGO con la entrada física de NEXO y el hecho económico de NUMERA sin doble digitación ni doble efecto;
- gestionar rechazos, devoluciones, reclamaciones, notas y regularizaciones sin borrar la operación original;
- medir cumplimiento de proveedores mediante hechos verificables;
- permitir compras urgentes por un carril abreviado controlado, nunca mediante bypass invisible;
- preservar contratos, cotizaciones, precios, datos tributarios, datos bancarios y evidencia con acceso mínimo y auditoría.

La existencia de proveedores, órdenes o recibos parciales en la implementación actual no permite considerar cubierta la familia `CAP-05`. La cobertura exige que la necesidad, decisión, orden, recepción, inventario, costo y evidencia formen una cadena única y reconciliable.

---

#### 2. Pregunta de decisión

`CAP-SCOPE-005` responde:

```text
¿CÓMO SE CONVIERTE UNA NECESIDAD REAL DE LA OPERACIÓN
EN UNA COMPRA AUTORIZADA, CON PROVEEDOR Y CONDICIONES VIGENTES,
Y CÓMO SE CONFIRMA SU ENTREGA, INVENTARIO, COSTO Y CUMPLIMIENTO
SIN DOBLE DIGITACIÓN, CAMBIOS DESTRUCTIVOS, APROBACIONES IMPLÍCITAS
NI FUENTES COMPETIDORAS ENTRE ORIGO, NEXO Y NUMERA?
```

La tarea rechaza equivalencias incorrectas como:

```text
NECESIDAD = ORDEN DE COMPRA
```

```text
SOLICITUD = APROBACIÓN
```

```text
PROVEEDOR = CONTACTO
```

```text
RELACIÓN PRODUCTO–PROVEEDOR = PRECIO VIGENTE
```

```text
COTIZACIÓN = CONTRATO
```

```text
CONTRATO = PRECIO ETERNO
```

```text
ORDEN ENVIADA = ORDEN RECIBIDA
```

```text
RECIBIR DOCUMENTO = INGRESAR INVENTARIO
```

```text
RECIBIR SERVICIO = CREAR STOCK
```

```text
PRECIO MÁS BAJO = MEJOR DECISIÓN
```

```text
COMPRA URGENTE = COMPRA SIN CONTROL
```

```text
CORREGIR = SOBRESCRIBIR HISTORIA
```

---

#### 3. Fuentes consolidadas

- `OPS-AUD-001` a `OPS-AUD-015`;
- `CAP-MAP-001` a `CAP-MAP-015`;
- `CODE-AUD-001` a `CODE-AUD-020`;
- `CAP-SCOPE-001` a `CAP-SCOPE-004`;
- `QA-REG-001` y el Registro Canónico de Requisitos de Prueba;
- `REGISTRO_VIVO_DE_PREGUNTAS_PENDIENTES`, especialmente `DAT-06`, `DAT-07`, `OPE-05`, `TEC-07` y `TEC-18`;
- la implementación vigente de ORIGO: proveedores, órdenes, edición de borrador, PDF, estados base, rutas iniciales de recibo y enlace hacia NEXO;
- la implementación vigente de NEXO: catálogo maestro, proveedores por producto, presentaciones físicas, mínimos, stock, LOC, entradas y recepción operativa;
- las estructuras actuales `suppliers`, `product_suppliers`, `purchase_orders`, `purchase_order_items`, `purchase_receptions`, `procurement_*`, `inventory_entries` y relacionadas;
- las tareas `ORIGO-AUTH-001` a `ORIGO-AUTH-015` y `ORIGO-UX-001` a `ORIGO-UX-016`;
- los contratos `INT-PROC-001` a `INT-PROC-005`;
- `NUMERA-DOM-003`, `NUMERA-DOM-010`, `NUMERA-DOM-014`, `NUMERA-UX-018` y fronteras contables futuras;
- las decisiones de autorización, segregación, privacidad, Storage, idempotencia, evidencia, integración y transición ya aprobadas.

Las respuestas y evidencias ya documentadas no se vuelven a solicitar.

---

#### 4. Alcance evaluado

- `CAP-05.01` — Planear necesidades de abastecimiento;
- `CAP-05.02` — Solicitar productos, materiales o servicios;
- `CAP-05.03` — Buscar y evaluar proveedores;
- `CAP-05.04` — Solicitar y comparar ofertas;
- `CAP-05.05` — Negociar condiciones;
- `CAP-05.06` — Aprobar compras;
- `CAP-05.07` — Emitir y controlar órdenes;
- `CAP-05.08` — Recibir productos y servicios;
- `CAP-05.09` — Verificar cantidades, calidad y documentos;
- `CAP-05.10` — Gestionar diferencias y devoluciones;
- `CAP-05.11` — Evaluar cumplimiento de proveedores;
- `CAP-05.12` — Gestionar compras urgentes;

También fija fronteras para catálogo, inventario, producción, ventas, costos, cuentas por pagar, documentos, cumplimiento, analítica y continuidad.

---

#### 5. Fuera de alcance

- crear, editar, aprobar, enviar, recibir, rechazar o cancelar operaciones reales;
- seleccionar proveedores reales o negociar condiciones comerciales concretas;
- definir montos, personas o umbrales finales de aprobación;
- registrar cuentas bancarias o datos tributarios reales;
- aprobar contratos jurídicos;
- sustituir revisión legal, tributaria, contable, sanitaria o de calidad;
- pagar proveedores;
- implementar cuentas por pagar o contabilidad completa;
- crear inventario por la sola existencia de una factura;
- crear obligaciones financieras por una orden no recibida salvo política explícita;
- crear tablas, vistas, RPC, buckets, políticas RLS, eventos o migraciones;
- migrar historia de compras;
- autorizar recepción física sin actor, sede, LOC o evidencia;
- convertir NEXO en propietario de la compra;
- convertir NUMERA en propietario de la orden o recepción;
- convertir VISO en propietario implícito por exponer una pantalla administrativa.

---

#### 6. Principios canónicos

##### 6.1. La necesidad precede a la compra

Una señal de stock, producción, venta, mantenimiento, proyecto o solicitud humana podrá originar una necesidad.

La necesidad no será todavía una autorización para comprometer dinero.

Toda necesidad conservará origen, fecha, producto o servicio, cantidad, sede, área, centro de costo, prioridad y responsable.

##### 6.2. Demanda, solicitud, abastecimiento, orden y recepción son expedientes distintos

Cada concepto tendrá identidad y estado propios.

La trazabilidad permitirá recorrer el ciclo completo sin duplicar la información.

Una orden podrá consolidar varias solicitudes y una solicitud podrá dividirse entre varios proveedores cuando la decisión lo justifique.

##### 6.3. El proveedor será una identidad empresarial, no un texto

El proveedor tendrá identificador estable, razón social o identidad aplicable, estado, identificadores tributarios, contactos, sedes, documentos y relaciones.

Un contacto, vendedor, sucursal o cuenta bancaria no será el proveedor mismo.

Los cambios no crearán duplicados por diferencias ortográficas.

##### 6.4. El maestro de proveedores tendrá una sola propiedad

ORIGO será propietario del expediente de proveedor.

NEXO podrá consumir relaciones producto–proveedor y presentaciones de compra.

NUMERA podrá consumir datos mínimos para obligaciones y pagos.

Ningún consumidor mantendrá una copia editable independiente.

##### 6.5. Relación producto–proveedor, oferta y contrato son conceptos distintos

La relación declara que un proveedor puede suministrar un producto o servicio.

La oferta declara condiciones propuestas en un periodo.

El contrato o acuerdo declara obligaciones y condiciones aprobadas.

El precio aplicable será una versión con vigencia y fuente.

##### 6.6. El precio tendrá contexto completo

Todo precio deberá identificar proveedor, producto o servicio, presentación, unidad, cantidad mínima, escala, moneda, impuestos, descuentos, flete, plazo de pago, vigencia y fuente.

Un precio nuevo no sobrescribirá el precio utilizado por órdenes históricas.

La orden conservará un snapshot de las condiciones efectivamente aprobadas.

##### 6.7. La comparación no se reducirá al menor precio

La decisión podrá considerar calidad, disponibilidad, tiempo de entrega, presentación, cantidad mínima, confiabilidad, crédito, ubicación, riesgo y costo total.

Los criterios y ponderaciones deberán ser visibles cuando se utilicen.

Una selección manual conservará justificación.

##### 6.8. La negociación seguirá siendo humana y controlada

Vento OS no sustituirá conversaciones, llamadas o negociación jurídica.

El sistema registrará versiones de ofertas, acuerdos alcanzados, responsables, vigencia y evidencia.

La ausencia de automatización no autoriza conservar la decisión únicamente en chats personales.

##### 6.9. La aprobación será una decisión explícita

Crear, editar o enviar una orden no equivaldrá a aprobarla.

Las políticas podrán depender de empresa, sede, centro de costo, categoría, importe, presupuesto, riesgo, contrato y urgencia.

Toda aprobación o rechazo conservará actor, alcance, regla, comentario y timestamp.

##### 6.10. La segregación de funciones será obligatoria

Solicitante, comprador, aprobador y receptor serán funciones distintas aunque una persona pueda acumularlas solo mediante política aprobada.

El receptor no aprobará la compra por el solo hecho de recibir.

El comprador no podrá autoaprobar fuera de una excepción explícita y auditada.

##### 6.11. Una orden enviada será versionada, no sobrescrita

La edición libre terminará al aprobarse o enviarse la orden.

Un cambio posterior producirá revisión, enmienda o cancelación vinculada.

Proveedor y consumidores podrán identificar qué revisión es vigente.

##### 6.12. ORIGO conservará el expediente empresarial de recepción

La recepción declarará contra qué orden, revisión y líneas se ejecuta.

Conservará cantidad aceptada, rechazada, pendiente, diferencia, documento, actor y resultado.

La recepción podrá ser parcial y múltiples recepciones podrán cerrar una misma orden.

##### 6.13. NEXO conservará el efecto físico sobre inventario

La entrada a stock, lote, vencimiento, LOC, condición y movimiento pertenecen a NEXO.

NEXO no creará una compra paralela.

ORIGO no escribirá directamente proyecciones de stock mediante formularios propios.

##### 6.14. Los servicios tendrán aceptación sin inventario artificial

Una compra de servicio podrá requerir acta, periodo, entregable, evidencia y aceptación.

No generará LOC, lote ni stock.

El hecho económico se emitirá solo según la política aprobada de aceptación y documentos.

##### 6.15. Recibir, inspeccionar y contabilizar no son el mismo evento

La llegada física podrá quedar pendiente de inspección.

La aceptación podrá diferir de la cantidad entregada.

El ingreso de inventario y el evento económico conservarán la relación con el resultado de inspección.

##### 6.16. Las diferencias no se corregirán borrando

Faltante, sobrante, sustitución, daño, vencimiento, precio distinto, documento faltante y calidad no conforme serán diferencias tipadas.

Toda resolución conservará evidencia y efectos.

La operación original permanecerá disponible.

##### 6.17. Devolución, reclamación y ajuste financiero serán relacionados pero distintos

La devolución física será trazada por NEXO.

La reclamación y decisión con proveedor serán trazadas por ORIGO.

La nota, obligación o ajuste económico será trazado por NUMERA o sistema externo según alcance.

##### 6.18. El desempeño del proveedor se calculará desde hechos

Cumplimiento de fecha, cantidad, calidad, documentos, precio y respuesta a reclamaciones se derivarán de operaciones cerradas.

Una calificación manual conservará autor y motivo.

No se permitirá modificar resultados históricos para mejorar una evaluación.

##### 6.19. La compra urgente será un carril abreviado, no un bypass

Toda urgencia tendrá causa, actor, sede, riesgo, autorización y límite.

Podrá permitir aprobación expedita y regularización posterior dentro de un plazo.

Nunca omitirá identidad del proveedor, evidencia de recepción o conciliación financiera.

##### 6.20. Los datos sensibles tendrán acceso mínimo

Precios, contratos, datos tributarios, cuentas bancarias, documentos y condiciones no serán visibles por pertenecer a la misma sede.

Las exportaciones y enlaces externos tendrán permisos y vigencia independientes.

Los documentos se conservarán en almacenamiento privado y con auditoría.

##### 6.21. Ninguna interfaz será fuente por sí sola

VISO podrá enlazar o presentar administración, pero no se convertirá en propietario.

Las decisiones se aplicarán mediante contratos de servidor y fuentes autoritativas.

La navegación no concederá acceso ni completará transiciones.

##### 6.22. Todo efecto será idempotente y reconciliable

Un reintento no duplicará orden, recepción, entrada de inventario, costo, obligación ni devolución.

Cada frontera conservará identificador estable y resultado recuperable.

Los fallos parciales producirán estado pendiente y conciliación, no confirmación falsa.

---

#### 7. Modelo conceptual objetivo

##### 7.1. Conceptos separados

| Concepto                    | Definición mínima                                                         |
| --------------------------- | ------------------------------------------------------------------------- |
| Señal de demanda            | hecho que evidencia una necesidad posible sin autorizar compra            |
| Necesidad de abastecimiento | necesidad consolidada y trazable pendiente de decisión                    |
| Solicitud de compra         | petición formal con solicitante, alcance, justificación y centro de costo |
| Caso de abastecimiento      | expediente que agrupa búsqueda, ofertas, evaluación y selección           |
| Solicitud de cotización     | petición enviada a uno o varios proveedores                               |
| Oferta o cotización         | condiciones propuestas por un proveedor con vigencia                      |
| Proveedor                   | identidad empresarial o persona que suministra bienes o servicios         |
| Contacto de proveedor       | persona o canal de relación; no identidad del proveedor                   |
| Relación producto–proveedor | capacidad declarada de suministrar un producto o servicio                 |
| Condición comercial         | precio, escala, entrega, pago, mínimo, descuento o flete versionados      |
| Contrato o acuerdo          | instrumento que gobierna condiciones y obligaciones durante una vigencia  |
| Decisión de aprobación      | resultado explícito de una política y un actor autorizado                 |
| Orden de compra             | compromiso aprobado y enviado con líneas y condiciones congeladas         |
| Revisión de orden           | versión posterior vinculada sin alterar la orden histórica                |
| Recepción                   | confirmación empresarial de entrega o prestación contra una orden         |
| Inspección de recepción     | verificación de cantidad, calidad, condición y documentos                 |
| Entrada de inventario       | efecto físico y contable de existencias en NEXO                           |
| Aceptación de servicio      | evidencia de cumplimiento de una compra no inventariable                  |
| Diferencia                  | desviación tipada entre orden, entrega, documento y aceptación            |
| Devolución o reclamación    | expediente de resolución con el proveedor                                 |
| Evento económico            | hecho consumido por NUMERA o sistema contable                             |
| Evaluación de proveedor     | resultado derivado de hechos y valoraciones controladas                   |
| Compra urgente              | expediente abreviado sujeto a autorización y regularización               |

##### 7.2. Relación general

```text
SEÑALES DE DEMANDA
NEXO / FOGO / PULSO / PERSONA AUTORIZADA
        ↓
NECESIDAD DE ABASTECIMIENTO
        ↓
SOLICITUD DE COMPRA
        ↓
CASO DE ABASTECIMIENTO
   ├── SOLICITUDES DE COTIZACIÓN
   ├── OFERTAS VERSIONADAS
   ├── COMPARACIÓN Y NEGOCIACIÓN
   └── SELECCIÓN JUSTIFICADA
        ↓
APROBACIÓN
        ↓
ORDEN DE COMPRA + REVISIÓN VIGENTE
        ↓
RECEPCIÓN / INSPECCIÓN / ACEPTACIÓN
   ├── NEXO: ENTRADA FÍSICA
   ├── ORIGO: ESTADO Y DIFERENCIAS
   └── NUMERA: HECHO ECONÓMICO
        ↓
EVALUACIÓN DEL PROVEEDOR / DEVOLUCIÓN / CIERRE
```

---

#### 8. Estados canónicos mínimos

##### 8.1. Proveedor

```text
prospectivo → pendiente_validacion → activo → suspendido → bloqueado → inactivo
```

##### 8.2. Solicitud de compra

```text
borrador → enviada → en_revision → aprobada → rechazada → en_abastecimiento → ordenada_parcial → ordenada → cerrada → cancelada
```

##### 8.3. Caso de abastecimiento

```text
borrador → abierto → solicitando_ofertas → evaluando → negociando → seleccionado → cerrado → cancelado
```

##### 8.4. Oferta

```text
solicitada → recibida → vigente → vencida → reemplazada → seleccionada → rechazada → retirada
```

##### 8.5. Contrato o acuerdo

```text
borrador → en_revision → activo → suspendido → vencido → terminado → reemplazado
```

##### 8.6. Orden de compra

```text
borrador → pendiente_aprobacion → aprobada → rechazada → enviada → confirmada_proveedor → recibida_parcial → recibida → cerrada → cancelada → en_disputa
```

##### 8.7. Recepción

```text
borrador → en_inspeccion → aceptada → aceptada_con_diferencias → rechazada → publicada_parcial → publicada → reversada
```

##### 8.8. Devolución o reclamación

```text
abierta → autorizada → despachada → recibida_proveedor → resuelta → cancelada
```

##### 8.9. Compra urgente

```text
abierta → autorizada_expedita → ejecutada → pendiente_regularizacion → regularizada → rechazada → cancelada
```

Los nombres físicos podrán normalizarse en E2/E3, pero no se reducirán a los tres estados actuales `draft`, `sent` y `received` cuando ello elimine aprobación, recepción parcial, disputa o cierre.

---

#### 9. Propiedad funcional y tecnológica

| Resultado empresarial                             | Propietario funcional                     | Aplicación propietaria candidata               | Consumidores principales |
| ------------------------------------------------- | ----------------------------------------- | ---------------------------------------------- | ------------------------ |
| necesidad y solicitud de compra                   | Compras con origen operativo identificado | ORIGO                                          | NEXO, FOGO, PULSO, VISO  |
| proveedor, oferta, contrato y condición comercial | Compras / Gerencia según sensibilidad     | ORIGO                                          | NEXO, NUMERA, VISO       |
| política y decisión de aprobación                 | Gerencia / responsable presupuestal       | ORIGO + autorización SHELL                     | NUMERA, auditoría        |
| orden de compra y sus revisiones                  | Compras                                   | ORIGO                                          | proveedor, NEXO, NUMERA  |
| recepción empresarial y diferencias               | Recepción / Compras                       | ORIGO                                          | NEXO, NUMERA             |
| entrada física, lote, vencimiento y LOC           | Inventario / Bodega                       | NEXO                                           | ORIGO, FOGO, NUMERA      |
| aceptación de servicio                            | Solicitante o supervisor autorizado       | ORIGO                                          | NUMERA                   |
| hecho económico y obligación                      | Contabilidad                              | NUMERA o sistema externo según `CAP-SCOPE-012` | Dirección, ORIGO         |
| documentos y evidencia                            | Propietario del expediente                | Storage gobernado desde SHELL                  | ORIGO, NEXO, NUMERA      |
| evaluación de proveedor                           | Compras con hechos operativos             | ORIGO                                          | Gerencia, solicitantes   |

##### 9.1. Regla de administración

VISO podrá presentar accesos, resúmenes o tareas administrativas, pero deberá enlazar al proceso propietario. No mantendrá proveedores, precios, órdenes o recepciones en una fuente paralela.

---

#### 10. Línea base de implementación verificable

| Superficie o estructura                      | Estado comprobado                                     | Tratamiento                                                   |
| -------------------------------------------- | ----------------------------------------------------- | ------------------------------------------------------------- |
| ORIGO: autenticación y acceso                | SSO y permiso general `origo.access`                  | reutilizar y atomizar permisos                                |
| ORIGO: proveedores                           | listado, alta y edición                               | reutilizar/refactorizar hacia maestro gobernado               |
| ORIGO: órdenes                               | listado, creación, detalle, edición de borrador y PDF | reutilizar/refactorizar                                       |
| ORIGO: estados de orden                      | `draft`, `sent`, `received`                           | ampliar; no cubren aprobación, parcialidad, disputa ni cierre |
| ORIGO: PDF o token público                   | superficie existente                                  | endurecer alcance, expiración, secreto y datos visibles       |
| ORIGO: recibos                               | rutas iniciales                                       | completar contra orden y revisión                             |
| ORIGO → NEXO                                 | enlace operacional para recibir una OC                | convertir en contrato idempotente y bidireccional             |
| NEXO: catálogo y presentaciones de proveedor | relaciones y configuración existentes                 | consumir el maestro ORIGO sin competir                        |
| NEXO: entradas, stock, LOC y lotes           | capacidad operativa parcial existente                 | conservar propiedad física                                    |
| NUMERA: hechos desde compras                 | alcance futuro reservado                              | construir integración y conciliación                          |
| historia de precios acordados                | no formalizada integralmente                          | construir                                                     |
| aprobaciones y auditoría de cambios          | pendiente crítico declarado                           | construir                                                     |
| recepción parcial y diferencias              | pendiente crítico declarado                           | reutilizar/refactorizar y completar                           |
| contratos, RFQ y comparación                 | sin flujo integral verificado                         | construir                                                     |
| compras urgentes                             | sin carril canónico verificado                        | construir                                                     |

La línea base confirma implementación útil, pero también una frontera incompleta: ORIGO administra la compra mientras la recepción inventariable todavía no está completamente sincronizada con NEXO.

---

#### 11. Matriz de decisión de cobertura

| Capacidad                                            | Tratamiento         | Propietario candidato                    | Fundamentación                                                                           |
| ---------------------------------------------------- | ------------------- | ---------------------------------------- | ---------------------------------------------------------------------------------------- |
| `CAP-05.01` Planear necesidades                      | `REUSE_OR_REFACTOR` | ORIGO con señales de NEXO/FOGO/PULSO     | existen mínimos, faltantes y datos operativos; falta consolidación y política            |
| `CAP-05.02` Solicitar bienes o servicios             | `REUSE_OR_REFACTOR` | ORIGO                                    | existen estructuras `procurement_*` y órdenes, pero la solicitud debe separarse de la OC |
| `CAP-05.03` Buscar y evaluar proveedores             | `REUSE_OR_REFACTOR` | ORIGO                                    | existe CRUD de proveedores; faltan gobierno, evaluación y deduplicación                  |
| `CAP-05.04` Solicitar y comparar ofertas             | `BUILD`             | ORIGO                                    | no existe flujo integral verificado de RFQ, versiones y comparación                      |
| `CAP-05.05` Negociar condiciones                     | `CONTROLLED_MANUAL` | Compras / Gerencia con registro en ORIGO | la negociación es humana; el resultado sí debe quedar gobernado                          |
| `CAP-05.06` Aprobar compras                          | `BUILD`             | ORIGO + autorización SHELL               | la implementación actual no demuestra política ni aprobación completa                    |
| `CAP-05.07` Emitir y controlar órdenes               | `REUSE_OR_REFACTOR` | ORIGO                                    | existe ciclo de órdenes y PDF; requiere revisiones, aceptación y estados completos       |
| `CAP-05.08` Recibir bienes y servicios               | `REUSE_OR_REFACTOR` | ORIGO con ejecución física NEXO          | existen rutas y enlace; falta contrato completo y servicios                              |
| `CAP-05.09` Verificar cantidad, calidad y documentos | `REUSE_OR_REFACTOR` | ORIGO/NEXO según hecho                   | existe base de recepción; faltan inspección y diferencias tipadas                        |
| `CAP-05.10` Gestionar diferencias y devoluciones     | `BUILD`             | ORIGO + NEXO + NUMERA                    | no existe ciclo integral verificado                                                      |
| `CAP-05.11` Evaluar cumplimiento                     | `BUILD`             | ORIGO                                    | debe derivarse de hechos de orden, recepción y reclamación                               |
| `CAP-05.12` Gestionar compras urgentes               | `BUILD`             | ORIGO                                    | se requiere carril abreviado con autorización y regularización                           |

##### 11.1. Resumen de clasificaciones

| Tratamiento         | Cantidad |
| ------------------- | -------: |
| `REUSE_OR_REFACTOR` |        6 |
| `BUILD`             |        5 |
| `CONTROLLED_MANUAL` |        1 |
| **Total**           |   **12** |

---

#### 12. CAP-05.01 — Planear necesidades de abastecimiento

##### Reglas mínimas

- Consolidará señales provenientes de mínimos, faltantes, reservas, planes de producción, ventas, mantenimiento, eventos, proyectos y solicitudes humanas.
- Cada señal conservará fuente y no generará una orden aprobada automáticamente.
- La planeación distinguirá necesidad bruta, existencia disponible, compromisos, tránsito, consumo esperado, cobertura y fecha requerida.
- Las recomendaciones automáticas serán explicables y podrán rechazarse con motivo.

##### Destinos canónicos

- `NEXO-UX-001` y políticas de reposición;
- `FOGO-UX-004` y planificación productiva;
- `ORIGO-UX-001` a `ORIGO-UX-004`;
- `CAP-SCOPE-006`, `CAP-SCOPE-008` y `CAP-SCOPE-017`;

---

#### 13. CAP-05.02 — Solicitar productos, materiales o servicios

##### Reglas mínimas

- La solicitud tendrá solicitante, empresa, sede, área, centro de costo, necesidad, fecha, prioridad, líneas, justificación y adjuntos.
- Podrá contener productos maestros, servicios o conceptos todavía pendientes de alta mediante un flujo controlado.
- No fijará por sí sola proveedor, precio final ni aprobación.
- Una solicitud modificada después del envío conservará revisión y motivo.

##### Destinos canónicos

- `ORIGO-UX-002`, `ORIGO-UX-003`, `ORIGO-AUTH-005`;
- `PROC-CAT-009` a `PROC-CAT-018`;
- `CAP-SCOPE-004` y `CAP-SCOPE-012`;

---

#### 14. CAP-05.03 — Buscar y evaluar proveedores

##### Reglas mínimas

- El maestro distinguirá proveedor, sucursal, contacto, condición fiscal, cuenta de pago, documento y estado.
- La búsqueda podrá usar productos, cobertura, ubicación, tiempos, estado y experiencia previa.
- La activación exigirá validaciones proporcionales al riesgo.
- Un proveedor bloqueado no podrá seleccionarse en nuevas órdenes, pero conservará historia.

##### Destinos canónicos

- `ORIGO-AUTH-002`, `ORIGO-AUTH-010`, `ORIGO-UX-001`;
- `SUPA-AUD-019`, `SUPA-TRANS-005`, `DATA-NORM-AUD-004`;
- `CAP-SCOPE-016`;

---

#### 15. CAP-05.04 — Solicitar y comparar ofertas

##### Reglas mínimas

- La RFQ tendrá líneas, cantidades, presentaciones, especificaciones, destino, fecha requerida y fecha límite.
- Cada respuesta conservará proveedor, versión, fecha, moneda, impuestos, flete, mínimos, disponibilidad y documentos.
- La matriz de comparación mostrará diferencias normalizadas sin ocultar datos no comparables.
- Una oferta vencida o reemplazada no será usada silenciosamente.

##### Destinos canónicos

- `ORIGO-UX-001`, `ORIGO-UX-004`, `ORIGO-UX-007`;
- `PROC-CAT-001` a `PROC-CAT-020`;
- `EVID-ARC-001` a `EVID-ARC-010`;

---

#### 16. CAP-05.05 — Negociar condiciones

##### Reglas mínimas

- La interacción seguirá siendo humana.
- ORIGO conservará propuestas, contrapropuestas, resultado, responsable, evidencia y vigencia cuando sea pertinente.
- Los acuerdos informales que afecten precio, entrega o pago deberán regularizarse antes de aprobar la orden.
- El sistema no presentará una conversación sin aceptación como condición vigente.

##### Destinos canónicos

- `ORIGO-UX-001`, `ORIGO-UX-004`, `ORIGO-UX-007`;
- `CAP-SCOPE-016`;
- `EVID-ARC-001` a `EVID-ARC-010`;

---

#### 17. CAP-05.06 — Aprobar compras

##### Reglas mínimas

- La aprobación se aplicará a solicitud, selección, orden o excepción según la política.
- La política tendrá versión y podrá exigir una o varias decisiones.
- Los cambios materiales después de aprobar invalidarán o renovarán la aprobación.
- Aprobación, rechazo, devolución a corrección y vencimiento serán resultados distintos.

##### Destinos canónicos

- `ORIGO-AUTH-005`, `ORIGO-AUTH-006`, `ORIGO-AUTH-009`, `ORIGO-AUTH-010`;
- `ORIGO-UX-005`, `ORIGO-UX-008`;
- `AUTH-QA-015`, `AUTH-QA-016`, `UX-QA-026`;

---

#### 18. CAP-05.07 — Emitir y controlar órdenes

##### Reglas mínimas

- La orden congelará proveedor, revisión, destino, moneda, impuestos, líneas, precios, presentaciones, fechas, pago y condiciones.
- El envío conservará canal, destinatario, revisión y evidencia.
- La confirmación del proveedor no se inferirá del envío.
- Cancelación, enmienda y cierre conservarán efectos sobre solicitudes, recepción y obligaciones.

##### Destinos canónicos

- `ORIGO-UX-007`, `ORIGO-UX-008`, `ORIGO-AUTH-004` a `ORIGO-AUTH-010`;
- `INT-PROC-001`;
- `CAP-SCOPE-016`;

---

#### 19. CAP-05.08 — Recibir productos y servicios

##### Reglas mínimas

- La recepción se vinculará con orden y revisión vigentes.
- Permitirá entrega total, parcial, anticipada, tardía o no solicitada mediante reglas explícitas.
- Los servicios usarán aceptación de entregable o periodo, no stock.
- La operación deberá funcionar con pérdida de respuesta y reintento sin duplicar efectos.

##### Destinos canónicos

- `ORIGO-UX-009`, `ORIGO-UX-010`, `ORIGO-UX-013`, `ORIGO-UX-014`;
- `INT-PROC-002` a `INT-PROC-005`;
- `CAP-SCOPE-006`, `CAP-SCOPE-018`;

---

#### 20. CAP-05.09 — Verificar cantidades, calidad y documentos

##### Reglas mínimas

- La cantidad ordenada, entregada, aceptada, rechazada y pendiente permanecerán separadas.
- Calidad, temperatura, lote, vencimiento, empaque y especificación se capturarán cuando correspondan.
- Factura, remisión, certificado u otro documento podrán quedar pendientes sin ocultarse.
- La aceptación tendrá actor y evidencia.

##### Destinos canónicos

- `ORIGO-UX-011`, `ORIGO-AUTH-007`, `ORIGO-AUTH-008`, `ORIGO-AUTH-011`;
- `CAP-SCOPE-003`, `CAP-SCOPE-006`, `CAP-SCOPE-008`;
- `EVID-ARC-001` a `EVID-ARC-010`;

---

#### 21. CAP-05.10 — Gestionar diferencias y devoluciones

##### Reglas mínimas

- Toda diferencia tendrá tipo, severidad, cantidad, valor, evidencia y responsable.
- Las resoluciones podrán incluir aceptación con reserva, reposición, devolución, descuento, nota o disputa.
- La devolución física no modificará silenciosamente la recepción.
- Los efectos de inventario y económicos serán compensatorios y correlacionados.

##### Destinos canónicos

- `ORIGO-UX-011`, `ORIGO-AUTH-008`;
- `INT-PROC-002` a `INT-PROC-005`;
- `NUMERA-DOM-003`, `NUMERA-DOM-014`, `NUMERA-UX-018`;
- `CAP-SCOPE-006`, `CAP-SCOPE-012`;

---

#### 22. CAP-05.11 — Evaluar cumplimiento de proveedores

##### Reglas mínimas

- Los indicadores se derivarán de órdenes y recepciones cerradas.
- Se medirán puntualidad, completitud, calidad, precio, documentos y resolución de diferencias.
- La evaluación podrá segmentarse por producto, sede, periodo y contrato.
- Suspensión o bloqueo tendrá decisión y vigencia.

##### Destinos canónicos

- `ORIGO-UX-001`, `ORIGO-AUTH-002`;
- `CAP-SCOPE-017`;
- `PROC-CAT-018`, `PROC-CAT-019`;

---

#### 23. CAP-05.12 — Gestionar compras urgentes

##### Reglas mínimas

- La urgencia tendrá causa canónica y evidencia.
- La política definirá quién puede iniciar, aprobar, ejecutar y regularizar.
- La compra conservará proveedor, líneas, precio, recepción, documento y centro de costo.
- La regularización vencida generará alerta y bloqueo de nuevas excepciones cuando la política lo exija.

##### Destinos canónicos

- `ORIGO-UX-001`, `ORIGO-UX-002`, `ORIGO-AUTH-005` a `ORIGO-AUTH-010`;
- `CAP-SCOPE-012`, `CAP-SCOPE-016`, `CAP-SCOPE-018`;
- `AUTH-QA-015`, `AUTH-QA-016`, `UX-QA-026`;

---

#### 24. Fronteras con otros dominios

##### 24.1. Catálogo

ORIGO referenciará producto, servicio y presentación canónicos; no creará identidades paralelas.

##### 24.2. Inventario

NEXO decidirá y registrará el efecto físico por sede, LOC, lote, vencimiento y condición.

##### 24.3. Producción

FOGO emitirá necesidades o reservas; no creará órdenes de compra por su cuenta.

##### 24.4. Ventas

PULSO podrá aportar demanda histórica o señales; no aprobará compras.

##### 24.5. Finanzas

NUMERA recibirá hechos económicos y conciliará obligaciones; no editará la orden ni la recepción.

##### 24.6. Contratos y documentos

Storage y evidencia se gobernarán mediante `CAP-SCOPE-016` y `EVID-ARC-*`.

##### 24.7. Analítica

Los indicadores se derivarán de estados y eventos canónicos, no de conteos de pantallas.

##### 24.8. Continuidad

La indisponibilidad de proveedor, red o aplicación tendrá procedimiento y regularización.

---

#### 25. Información conceptual requerida

##### 25.1. Proveedor

- identificador y código estables;
- identidad legal o personal aplicable;
- estado y vigencia;
- sedes y cobertura;
- contactos y canales;
- documentos y validaciones;
- datos sensibles referenciados;
- historial de cambios;

##### 25.2. Condición comercial

- producto o servicio;
- presentación y unidad;
- cantidad o escala;
- precio y moneda;
- impuestos y descuentos;
- flete y cargos;
- mínimo de compra;
- tiempo de entrega;
- condición de pago;
- vigencia;
- fuente y versión;

##### 25.3. Solicitud y caso de abastecimiento

- origen;
- solicitante;
- empresa, sede, área y centro de costo;
- fecha requerida;
- prioridad;
- líneas;
- justificación;
- presupuesto o referencia;
- estado y revisión;

##### 25.4. Orden

- proveedor;
- revisión;
- líneas congeladas;
- destino;
- condiciones;
- aprobaciones;
- envío;
- confirmación;
- recepciones relacionadas;
- saldo pendiente;
- cierre;

##### 25.5. Recepción

- orden y revisión;
- documento del proveedor;
- actor y ubicación;
- cantidades;
- calidad y condición;
- lote y vencimiento;
- diferencias;
- entrada NEXO;
- evento NUMERA;
- evidencia;

##### 25.6. Evaluación

- periodo;
- universo de operaciones;
- indicadores;
- ponderaciones;
- resultado calculado;
- valoración manual;
- decisión y vigencia;

---

#### 26. Eventos e integraciones requeridos

- `procurement.need_identified`;
- `procurement.request_submitted`;
- `procurement.request_approved`;
- `procurement.sourcing_opened`;
- `procurement.quote_received`;
- `procurement.offer_selected`;
- `procurement.contract_activated`;
- `procurement.purchase_order_approved`;
- `procurement.purchase_order_sent`;
- `procurement.purchase_order_revised`;
- `procurement.receipt_registered`;
- `procurement.receipt_inspected`;
- `procurement.receipt_difference_detected`;
- `procurement.inventory_entry_requested`;
- `procurement.inventory_entry_confirmed`;
- `procurement.economic_event_emitted`;
- `procurement.return_opened`;
- `procurement.return_resolved`;
- `procurement.supplier_score_updated`;
- `procurement.emergency_purchase_regularized`;

##### 26.1. Integraciones obligatorias

- NEXO/FOGO/PULSO → ORIGO para señales de demanda;
- ORIGO → proveedor mediante documento o canal controlado;
- ORIGO → NEXO para recepción física autorizada;
- NEXO → ORIGO para confirmación de entrada, diferencias y devolución;
- ORIGO/NEXO → NUMERA para hecho económico y conciliación;
- ORIGO → Storage para contratos, ofertas, facturas y evidencia;
- ORIGO → analítica para cumplimiento y tiempos;
- SHELL → todas las aplicaciones para identidad, permisos, contratos e idempotencia.

---

#### 27. Autorización y segregación

##### 27.1. Capacidades separadas

- consultar proveedores;
- administrar proveedores;
- consultar precios;
- administrar condiciones;
- crear solicitud;
- comprar;
- comparar ofertas;
- aprobar;
- emitir orden;
- cancelar o enmendar;
- recibir;
- inspeccionar;
- corregir recepción;
- gestionar devolución;
- ver contratos;
- exportar información sensible;
- autorizar compra urgente;
- regularizar compra urgente;

##### 27.2. Reglas

- el acceso administrativo ordinario no requerirá check-in cuando el contrato lo permita;
- la recepción física podrá exigir contexto operativo;
- el alcance se limitará por empresa, sede, centro de costo, categoría y responsabilidad;
- los precios y contratos tendrán permisos independientes;
- la simulación no ejecutará aprobaciones, envíos ni recepciones reales;
- un dispositivo compartido identificará al receptor humano;
- la URL directa, formulario manipulado o RPC directa no ampliarán autoridad;
- toda decisión conservará actor real, actor operativo, política y territorio.

---

#### 28. Experiencia por actor

##### 28.1. Solicitante

- crear y seguir solicitudes;
- ver estado y motivo;
- corregir cuando sea devuelta;
- no ver precios o contratos cuando no corresponda;

##### 28.2. Comprador

- bandeja de necesidades;
- casos de abastecimiento;
- proveedores y ofertas;
- comparación;
- orden y seguimiento;

##### 28.3. Aprobador

- contexto suficiente;
- impacto y excepciones;
- aprobar, rechazar o devolver;
- historial de decisiones;

##### 28.4. Receptor

- orden esperada;
- presentación y cantidad;
- captura de diferencias;
- evidencia y confirmación;

##### 28.5. Inventario

- LOC, lote, vencimiento y condición;
- entrada o devolución;
- sin editar precio o aprobación;

##### 28.6. Contabilidad

- hecho económico y documento;
- conciliación;
- diferencias;
- sin modificar la recepción física;

##### 28.7. Gerencia

- excepciones, urgencias, desempeño, contratos y exposición;
- sin contaminar la operación ordinaria;

---

#### 29. Operación offline y contingencia

- una orden no se considerará enviada hasta confirmar el canal o registrar entrega controlada;
- una recepción offline deberá persistir identificador y contenido antes de mostrarse como encolada;
- la sincronización revalidará actor, orden, revisión, estado y permisos;
- los reintentos no duplicarán recepción, inventario ni evento económico;
- una respuesta perdida permitirá recuperar el resultado original;
- una compra urgente durante indisponibilidad tendrá formato de contingencia y regularización obligatoria;
- la caída de NUMERA no impedirá necesariamente la recepción física, pero dejará el hecho económico pendiente y visible;
- la caída de NEXO no permitirá que ORIGO declare inventario confirmado sin evidencia.

---

#### 30. Evidencia, conservación y auditoría

- solicitud original y revisiones;
- ofertas y comparaciones;
- justificación de selección;
- aprobaciones y rechazos;
- orden y revisiones enviadas;
- confirmación del proveedor;
- documentos de recepción;
- inspección y diferencias;
- entrada o devolución física;
- hecho económico y conciliación;
- contratos y vigencias;
- compras urgentes y regularización;
- evaluaciones y decisiones sobre proveedor;
- consultas, descargas y exportaciones sensibles.

La retención exacta se definirá en `CAP-SCOPE-016`; ningún cierre autoriza borrar evidencia referenciada.

---

#### 31. Patrones legacy destinados a retiro

- crear una orden directamente desde una recomendación sin solicitud o política;;
- proveedores duplicados por nombre;;
- proveedores editables en NEXO y ORIGO como fuentes competidoras;;
- precio actual sobrescrito sin vigencia;;
- presentación del proveedor expresada como texto libre;;
- comparaciones en hojas o chats sin referencia canónica;;
- aprobación implícita por rol amplio;;
- edición de orden ya enviada;;
- estado único `received` sin parcialidad ni diferencia;;
- recepción duplicada en ORIGO y NEXO;;
- entrada de inventario creada desde una factura sin recepción física;;
- servicio registrado como producto inventariable;;
- devolución mediante ajuste destructivo;;
- compra urgente sin regularización;;
- contratos o datos bancarios en almacenamiento público;;
- PDF público con secreto opcional o fallback;;
- evaluación de proveedor basada solo en opinión sin universo de hechos.;

`RETIRE` aplica a estos patrones, no a las capacidades empresariales.

---

#### 32. Preguntas pendientes reutilizadas

No se crean preguntas nuevas.

| Pregunta | Uso dentro de esta tarea                                           | Puerta de resolución                                              |
| -------- | ------------------------------------------------------------------ | ----------------------------------------------------------------- |
| `DAT-06` | confirmar dónde se consulta hoy la historia completa de compras    | `ORIGO-UX-001`, migración y readiness                             |
| `DAT-07` | confirmar si se conserva la cantidad realmente recibida            | `ORIGO-UX-009` a `ORIGO-UX-014` y `INT-PROC-002` a `INT-PROC-005` |
| `OPE-05` | confirmar quién puede rechazar mercancía distinta                  | diseño E2 de recepción y matriz de aprobación                     |
| `TEC-07` | evidencia de tablas y servicios actuales de compra                 | `SUPA-AUD-019`, `SUPA-AUD-022`, `SUPA-AUD-023`                    |
| `TEC-18` | evidencia de duplicación de compras y contratos entre aplicaciones | `SHELL-CON-016`, `SUPA-TRANS-007`, `INT-APP-010`                  |

Las respuestas no bloquean esta decisión conceptual, pero serán obligatorias antes de migrar historia, fijar responsabilidades nominales o aprobar el piloto.

---

#### 33. Riesgos principales

| Riesgo                                | Severidad | Control principal                  |
| ------------------------------------- | --------- | ---------------------------------- |
| orden sin necesidad o autorización    | crítica   | solicitud y aprobación explícitas  |
| proveedor duplicado o no validado     | alta      | maestro único y estados            |
| precio vencido o de otra presentación | crítica   | versión y contexto completos       |
| selección no justificable             | alta      | comparación y criterio visible     |
| conflicto de interés o autoaprobación | crítica   | segregación de funciones           |
| orden enviada alterada                | crítica   | revisiones inmutables              |
| recepción duplicada                   | crítica   | idempotencia y contrato ORIGO–NEXO |
| inventario sin recepción válida       | crítica   | efecto físico gobernado por NEXO   |
| recepción parcial tratada como total  | crítica   | cantidades y saldo por línea       |
| servicio convertido en stock          | alta      | aceptación no inventariable        |
| diferencia borrada                    | crítica   | eventos compensatorios             |
| contrato o datos bancarios expuestos  | crítica   | Storage privado y permisos         |
| compra urgente sin regularización     | crítica   | carril expedito con vencimiento    |
| evento financiero duplicado           | crítica   | correlación e idempotencia         |
| desempeño manipulado                  | alta      | métricas desde hechos              |

---

#### 34. Hallazgos y destinos canónicos

| ID                    | Hallazgo                                                                                                   | Riesgo  | Tarea propietaria                                                | Momento                        |
| --------------------- | ---------------------------------------------------------------------------------------------------------- | ------- | ---------------------------------------------------------------- | ------------------------------ |
| `H-CAP-SCOPE-005-001` | las señales de demanda no convergen todavía en un expediente único de necesidad                            | alta    | `ORIGO-UX-001`; `CAP-SCOPE-006`; `CAP-SCOPE-008`                 | E2                             |
| `H-CAP-SCOPE-005-002` | solicitud de compra y orden no tienen separación integral demostrada                                       | crítica | `ORIGO-UX-002`; `PROC-CAT-001` a `PROC-CAT-018`                  | E2                             |
| `H-CAP-SCOPE-005-003` | el maestro de proveedores puede competir entre NEXO, ORIGO y estructuras compartidas                       | crítica | `SUPA-AUD-019`; `SUPA-TRANS-007`; `SHELL-CON-016`                | E3                             |
| `H-CAP-SCOPE-005-004` | identidad, contactos, documentos y datos sensibles del proveedor no tienen gobierno completo verificado    | crítica | `ORIGO-AUTH-002`; `ORIGO-AUTH-010`; `CAP-SCOPE-016`              | E2/E3                          |
| `H-CAP-SCOPE-005-005` | no existe flujo integral verificado de RFQ, ofertas versionadas y comparación                              | alta    | `ORIGO-UX-001`; `ORIGO-UX-004`; `PROC-CAT-001` a `PROC-CAT-020`  | E2                             |
| `H-CAP-SCOPE-005-006` | precios acordados por proveedor y producto no tienen versionado integral                                   | crítica | `ORIGO-AUTH-010`; `SUPA-AUD-019`; `CAP-SCOPE-012`                | E2/E3                          |
| `H-CAP-SCOPE-005-007` | contratos, condiciones y vigencias no tienen ciclo canónico comprobado                                     | alta    | `CAP-SCOPE-016`; `EVID-ARC-001` a `EVID-ARC-010`; `ORIGO-UX-001` | E2/E4                          |
| `H-CAP-SCOPE-005-008` | la aprobación de compras y auditoría de cambios están declaradas como pendientes                           | crítica | `ORIGO-AUTH-005`; `ORIGO-AUTH-006`; `ORIGO-UX-008`               | E2 antes de piloto             |
| `H-CAP-SCOPE-005-009` | los estados actuales de OC no representan revisión, aprobación, parcialidad, disputa y cierre              | crítica | `ORIGO-UX-007` a `ORIGO-UX-011`; `PROC-CAT-009` a `PROC-CAT-014` | E2                             |
| `H-CAP-SCOPE-005-010` | el PDF o token externo requiere contrato fail-closed, expiración y minimización de datos                   | crítica | `ORIGO-AUTH-010`; `INT-EXT-001` a `INT-EXT-019`; `CAP-SCOPE-016` | E3/E4                          |
| `H-CAP-SCOPE-005-011` | la recepción real contra OC no está completamente sincronizada con NEXO                                    | crítica | `ORIGO-UX-009` a `ORIGO-UX-015`; `INT-PROC-001` a `INT-PROC-005` | E2/E4                          |
| `H-CAP-SCOPE-005-012` | recepciones parciales, diferencias, costos y presentaciones físicas no están cerrados de extremo a extremo | crítica | `ORIGO-UX-010`; `ORIGO-UX-011`; `CAP-SCOPE-006`; `NUMERA-UX-018` | E2/E3                          |
| `H-CAP-SCOPE-005-013` | la compra y aceptación de servicios no tienen contrato específico verificado                               | alta    | `ORIGO-UX-001`; `CAP-SCOPE-012`; `PROC-CAT-001` a `PROC-CAT-018` | E2                             |
| `H-CAP-SCOPE-005-014` | no existe ciclo integral comprobado de devolución, reclamación y compensación                              | crítica | `ORIGO-AUTH-008`; `ORIGO-UX-011`; `NUMERA-DOM-014`               | E2/E3                          |
| `H-CAP-SCOPE-005-015` | no existe evaluación de proveedores derivada de hechos canónicos                                           | alta    | `ORIGO-UX-001`; `CAP-SCOPE-017`; `PROC-CAT-019`                  | E2                             |
| `H-CAP-SCOPE-005-016` | no existe carril canónico de compra urgente con regularización                                             | crítica | `ORIGO-AUTH-005` a `ORIGO-AUTH-010`; `CAP-SCOPE-018`             | E2                             |
| `H-CAP-SCOPE-005-017` | el hecho económico y la conciliación con NUMERA no están cerrados                                          | crítica | `INT-PROC-004`; `NUMERA-DOM-003`; `NUMERA-UX-018`                | E3/E4                          |
| `H-CAP-SCOPE-005-018` | la historia operativa actual de compras y cantidades recibidas sigue pendiente de confirmación             | alta    | `DAT-06`; `DAT-07`; `ORIGO-UX-001`                               | antes de migración y readiness |

Todos los hallazgos tienen propietario y puerta. No queda pendiente narrativo sin destino.

---

#### 35. Decisiones canónicas resultantes

1. ORIGO será propietario del expediente de abastecimiento externo.
2. NEXO conservará la propiedad del efecto físico sobre inventario.
3. NUMERA o el sistema financiero aprobado conservará el hecho económico y la obligación.
4. VISO será superficie de acceso o supervisión, no fuente competidora.
5. La necesidad, solicitud, caso de abastecimiento, orden y recepción serán entidades distintas.
6. El proveedor será una identidad estable separada de sus contactos y sedes.
7. La relación producto–proveedor no equivaldrá a un precio vigente.
8. Las ofertas, contratos y precios serán versionados y tendrán vigencia.
9. La comparación considerará costo total y criterios operativos, no solo precio.
10. La negociación será manual controlada con resultado registrado.
11. Las aprobaciones serán explícitas y versionadas.
12. Solicitante, comprador, aprobador y receptor tendrán capacidades separadas.
13. Una orden aprobada o enviada no se editará destructivamente.
14. La recepción podrá ser parcial y conservará diferencias por línea.
15. Los servicios tendrán aceptación sin crear inventario artificial.
16. ORIGO y NEXO compartirán un identificador de recepción, no dos procesos paralelos.
17. Las diferencias y devoluciones producirán efectos correlacionados y compensatorios.
18. La evaluación de proveedor se derivará de hechos.
19. La compra urgente será expedita pero controlada y regularizable.
20. Los datos sensibles se protegerán con permisos y Storage privado.
21. Cada frontera será idempotente y reconciliable.
22. La familia `CAP-05` se considera parcialmente existente y reutilizable, pero no cerrada.

---

#### 36. Requisitos de prueba derivados

Esta tarea genera tres requisitos distintos y no duplicados:

```text
TREQ-ORIGO-004
TREQ-ORIGO-005
TREQ-INTEGRATION-010
```

Los detalles completos se incorporan exclusivamente en el archivo canónico `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` regenerado.

No se entregan filas independientes.

##### 36.1. `TREQ-ORIGO-004`

Protege el ciclo solicitud → abastecimiento → aprobación → orden → revisión → urgencia, incluyendo segregación, estados, auditoría y ausencia de cambios destructivos.

##### 36.2. `TREQ-ORIGO-005`

Protege proveedor, ofertas, contratos, condiciones y precios versionados, datos sensibles, vigencias, presentaciones y evaluación histórica.

##### 36.3. `TREQ-INTEGRATION-010`

Protege la cadena ORIGO → NEXO → NUMERA, recepciones parciales, servicios, diferencias, devoluciones, idempotencia y conciliación.

---

#### 37. Dependencias habilitadas y restricciones

`CAP-SCOPE-005` habilita conceptualmente:

- `CAP-SCOPE-006`;
- `CAP-SCOPE-012`;
- `CAP-SCOPE-016`;
- `CAP-SCOPE-017`;
- `CAP-SCOPE-018`;
- `ORIGO-UX-001` a `ORIGO-UX-016`;
- `ORIGO-AUTH-001` a `ORIGO-AUTH-015`;
- `INT-PROC-001` a `INT-PROC-005`;
- `NUMERA-DOM-003` y `NUMERA-UX-018`;
- diseño TO-BE de abastecimiento;
- arquitectura de proveedor, precios y contratos;
- paquetes E5 de ORIGO, NEXO y NUMERA;

No autoriza compras, aprobaciones, recepción, pago, migración, cambios en proveedores ni publicación de documentos.

---

#### 38. Criterios de aceptación

1. las doce subcapacidades tengan tratamiento explícito;
2. necesidad, solicitud, abastecimiento, orden y recepción estén separados;
3. proveedor, contacto, oferta, contrato y precio estén separados;
4. ORIGO, NEXO, NUMERA y VISO tengan fronteras explícitas;
5. los precios tengan contexto, fuente, versión y vigencia;
6. la negociación quede clasificada como manual controlada;
7. las aprobaciones y segregación sean explícitas;
8. una orden enviada utilice revisiones y no sobrescritura;
9. la recepción admita parcialidad, inspección y diferencias;
10. los servicios no creen inventario artificial;
11. devoluciones y compensaciones conserven la historia;
12. la compra urgente tenga autorización y regularización;
13. los datos sensibles tengan tratamiento de privacidad;
14. los dieciocho hallazgos tengan destino;
15. no se creen preguntas narrativas sin dueño;
16. se generen los tres requisitos de prueba;
17. el registro `04A` completo tenga 92 requisitos válidos;
18. ninguna fila del registro tenga más o menos de catorce columnas;
19. no se autorice implementación;
20. la continuidad quede en `CAP-SCOPE-006`.

---

#### 39. Resultado y continuidad

**Estado:** PROPUESTA PARA APROBACIÓN

Al aprobarse:

- `CAP-SCOPE-005` será la decisión canónica de cobertura para compras, proveedores, contratos, precios y abastecimiento;
- `TREQ-ORIGO-004`, `TREQ-ORIGO-005` y `TREQ-INTEGRATION-010` quedarán incorporados al registro canónico;
- ORIGO, NEXO y NUMERA conservarán propiedades diferenciadas;
- ninguna implementación física ni operación real quedará autorizada;
- la continuidad será:

```text
CAP-SCOPE-006 — Evaluar inventario, lotes, vencimientos, LOC y LPN
```


### ✅ CAP-SCOPE-006 — Evaluar inventario, lotes, vencimientos, LOC y LPN

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Dependencia cumplida:** `CAP-SCOPE-005` aprobada  
**Tarea anterior:** `CAP-SCOPE-005`  
**Siguiente tarea reservada:** `CAP-SCOPE-007`  
**Familia evaluada:** `CAP-06 — Controlar inventario y almacenamiento`  
**Naturaleza:** decisión de cobertura empresarial y definición conceptual objetivo  
**Implementación técnica:** no autorizada  
**Migraciones o cambios en Supabase:** no autorizados  
**Conteos, ajustes, movimientos, reservas, remisiones o efectos reales de inventario:** no autorizados  
**Requisitos de prueba generados:** `TREQ-NEXO-011`, `TREQ-NEXO-012`, `TREQ-INTEGRATION-011`  
**Actualización del registro de pruebas:** se entrega el archivo `04A` completo regenerado; quedan prohibidas las filas sueltas

---

#### 1. Propósito

Definir el tratamiento objetivo de las capacidades mediante las cuales Vento Group deberá:

- conservar una representación única, trazable y reconciliable de la existencia física;
- distinguir producto, presentación, unidad, lote, serial, existencia, ubicación, posición, LPN y contenedor físico;
- definir una jerarquía estable de sede, lugar de almacenamiento, LOC, posición y contenido;
- registrar entradas, ubicaciones, reubicaciones, consumos, salidas, traslados y remisiones mediante hechos auditables;
- distinguir cantidad física, reservada, disponible, en tránsito, en cuarentena, dañada, vencida y perdida;
- mantener un ledger o fuente canónica de movimientos y proyecciones derivadas que no compitan entre sí;
- impedir doble contabilización entre stock suelto, stock ubicado, stock por presentación y contenido de LPN;
- gestionar lotes de proveedor, lotes productivos, vencimientos, vida útil, condición, liberación y cuarentena;
- aplicar FEFO u otra política aprobada sin seleccionar inventario no utilizable;
- reservar o separar existencias con vigencia, propietario, propósito y liberación explícita;
- contar inventario sin convertir la observación en ajuste silencioso;
- investigar diferencias y corregir mediante eventos compensatorios autorizados;
- controlar frío y condiciones de almacenamiento mediante reglas, registros, alertas y contingencias;
- relacionar ORIGO, FOGO, PULSO, remisiones y otros orígenes con NEXO sin efectos duplicados;
- operar con etiquetas, escáneres, tablets, kioscos e impresoras sin perder trazabilidad cuando un periférico falla;
- preservar historia suficiente para reconstruir qué había, dónde estaba, en qué condición, bajo qué lote y por qué cambió.

La existencia actual de tablas, stock por sede y LOC, movimientos, formularios, remisiones o componentes LPN no permite considerar cerrada la familia `CAP-06`. La cobertura exige que cada cantidad pueda explicarse desde un hecho autorizado, una ubicación válida, un estado utilizable y una cadena de origen completa.

---

#### 2. Pregunta de decisión

`CAP-SCOPE-006` responde:

```text
¿CÓMO REPRESENTAR Y OPERAR LA EXISTENCIA FÍSICA DE VENTO GROUP
DE FORMA QUE CADA CANTIDAD, LOTE, VENCIMIENTO, UBICACIÓN Y LPN
SEA TRAZABLE, UTILIZABLE O BLOQUEABLE SEGÚN SU ESTADO,
Y QUE ENTRADAS, PRODUCCIÓN, VENTAS, TRASLADOS, REMISIONES,
CONTEOS Y AJUSTES CONVERJAN SIN DOBLE CONTABILIZACIÓN
NI FUENTES DE VERDAD COMPETIDORAS?
```

La tarea rechaza equivalencias incorrectas como:

```text
STOCK FÍSICO = STOCK DISPONIBLE
```

```text
SEDE = LOC
```

```text
LOC = POSICIÓN
```

```text
LOC = LPN
```

```text
LPN = CONTENEDOR FÍSICO
```

```text
LOTE DE PROVEEDOR = LOTE DE PRODUCCIÓN
```

```text
PRESENTACIÓN = UNIDAD DE MEDIDA
```

```text
CONTEO = AJUSTE
```

```text
MOVIMIENTO = PROYECCIÓN DE STOCK
```

```text
REMISIÓN COMPLETADA = INVENTARIO PUBLICADO
```

```text
CANTIDAD EN TRÁNSITO = CANTIDAD DISPONIBLE EN DESTINO
```

```text
PRODUCTO VENCIDO = REGISTRO ELIMINADO
```

```text
FOTO = EVIDENCIA SUFICIENTE DE CONDICIÓN
```

```text
TEMPERATURA REGISTRADA = CADENA DE FRÍO CUMPLIDA
```

```text
STOCK CERO = PRODUCTO INEXISTENTE
```

```text
CANTIDAD NEGATIVA = PEDIDO PENDIENTE
```

```text
CORRECCIÓN = SOBRESCRITURA DEL VALOR ANTERIOR
```


---

#### 3. Fuentes consolidadas

- `OPS-AUD-001` a `OPS-AUD-015`;
- `CAP-MAP-001` a `CAP-MAP-015`;
- `CODE-AUD-001` a `CODE-AUD-020`;
- `CAP-SCOPE-001` a `CAP-SCOPE-005`;
- `QA-REG-001` y el Registro Canónico de Requisitos de Prueba;
- `REGISTRO_VIVO_DE_PREGUNTAS_PENDIENTES`, especialmente `COM-01`, `DAT-04`, `DAT-05`, `DAT-08` a `DAT-11`, `DAT-26`, `OPE-01`, `OPE-04`, `OPE-06` y `TEC-06`;
- la implementación vigente de NEXO: catálogo operativo, stock por sede, LOC y presentación, entradas, conteo inicial, ajustes, retiros, traslados, movimientos, remisiones, posiciones, kiosco y printing;
- la evidencia técnica de `inventory_movements`, proyecciones por sede, LOC y posición, `inventory_stock_by_uom_profile`, entradas, remisiones, conteos, LOC, LPN y contenido de LPN;
- la evidencia de que lotes y vencimientos existen parcialmente, pero no forman todavía un ciclo operativo integral;
- la evidencia de que la superficie LPN actual conserva fragmentos de tabla, endpoint y componente sin recorrido funcional completo;
- las tareas `NEXO-DOM-001` a `NEXO-DOM-024`, `NEXO-AUTH-001` a `NEXO-AUTH-030` y `NEXO-UX-001` a `NEXO-UX-042`;
- los contratos `INT-PROC-001` a `INT-PROC-005`, `INT-PROD-001` a `INT-PROD-005`, `INT-POS-011` a `INT-POS-020` e `INT-SALES-001` a `INT-SALES-011`;
- las decisiones aprobadas sobre unidades, presentaciones, recetas, recepción, costos, autorización, idempotencia, evidencia y transición.

Las respuestas y evidencias ya registradas no se vuelven a solicitar.

---

#### 4. Alcance evaluado

- `CAP-06.01` — Definir lugares de almacenamiento;
- `CAP-06.02` — Identificar productos, lotes y recipientes;
- `CAP-06.03` — Registrar entradas;
- `CAP-06.04` — Ubicar y reubicar existencias;
- `CAP-06.05` — Consultar disponibilidad;
- `CAP-06.06` — Reservar o separar existencias;
- `CAP-06.07` — Registrar consumo y salida;
- `CAP-06.08` — Trasladar entre lugares;
- `CAP-06.09` — Solicitar y gestionar remisiones;
- `CAP-06.10` — Preparar y despachar remisiones;
- `CAP-06.11` — Recibir y confirmar remisiones;
- `CAP-06.12` — Contar inventario;
- `CAP-06.13` — Investigar y ajustar diferencias;
- `CAP-06.14` — Controlar vencimiento, daño y pérdida;
- `CAP-06.15` — Controlar frío y condiciones de almacenamiento;

También fija fronteras con catálogo, compras, producción, ventas, activos, logística, costos, mantenimiento, SST, inocuidad, documentos, analítica y continuidad.

---

#### 5. Fuera de alcance

- contar, ajustar, retirar, trasladar, reservar, liberar, empacar o mover inventario real;
- crear o imprimir etiquetas operativas reales;
- activar efectos de inventario en remisiones, producción o ventas;
- definir cantidades iniciales, mínimos o máximos reales;
- decidir ubicaciones físicas finales sin validar planos y operación;
- declarar un producto apto, vencido, dañado, perdido o liberado sin responsable autorizado;
- sustituir controles sanitarios, de inocuidad, SST o cadena de frío;
- definir límites finales de temperatura o vida útil sin especificación aprobada;
- crear tablas, vistas, RPC, triggers, buckets, políticas RLS o migraciones;
- migrar stock, lotes, movimientos, conteos o LPN históricos;
- decidir todavía si el ledger o una proyección actual será físicamente la tabla definitiva;
- convertir ORIGO, FOGO, PULSO o VISO en fuentes competidoras de existencia;
- convertir un LPN en catálogo de activos; esa frontera continuará en `CAP-SCOPE-007`;
- autorizar stock negativo como comportamiento general;
- borrar movimientos, conteos, lotes o diferencias referenciadas.

---

#### 6. Principios canónicos

##### 6.1. NEXO será propietario del estado físico de inventario

NEXO conservará movimientos, existencia, ubicación, lote, condición, reserva y tránsito.

ORIGO, FOGO, PULSO y otros dominios emitirán hechos de origen; no escribirán proyecciones de stock de manera independiente.

`vento-shell` conservará contratos, migraciones y controles compartidos.

##### 6.2. Producto e existencia son conceptos diferentes

El producto describe qué es el elemento; la existencia describe cuánto hay, dónde, bajo qué lote, presentación, condición y custodia.

Un producto podrá existir sin stock y una existencia no podrá existir sin producto canónico.

Una variante o presentación no creará una identidad de producto artificial.

##### 6.3. La jerarquía física será explícita

La jerarquía mínima será `organización → sede → LOC → posición opcional`.

Un LOC representará un lugar controlable; una posición será una subdivisión interna cuando aporte valor operativo.

Los códigos serán estables, únicos dentro de su ámbito y no dependerán del nombre visible.

##### 6.4. El ciclo de vida de LOC será no destructivo

Crear, activar, bloquear, reubicar, cerrar y retirar un LOC conservará historia.

Un LOC con existencia, movimientos o documentos no podrá eliminarse físicamente.

El cierre exigirá vaciado, traslado o tratamiento explícito del contenido.

##### 6.5. Stock no ubicado será una excepción temporal controlada

La existencia sin LOC podrá admitirse solo durante recepción, migración o contingencia aprobada.

Tendrá motivo, responsable, antigüedad y cola de resolución.

No se presentará como ubicación física confiable.

##### 6.6. Un LPN será una identidad logística de contenido

El LPN identificará una unidad logística que agrupa contenido y puede moverse como conjunto.

No será sinónimo de estante, LOC, activo o contenedor físico.

Podrá relacionarse con un contenedor físico, pero ambas identidades y ciclos permanecerán separados.

##### 6.7. El contenido de LPN no se contabilizará también como stock suelto

Cada cantidad estará o bien suelta en una ubicación o bien contenida en un LPN, con una relación única y verificable.

Empacar y desempacar transferirá representación sin alterar la cantidad total.

Mover un LPN moverá atómicamente todo su contenido.

##### 6.8. Lote, serial y vencimiento tendrán identidad y origen

El lote conservará tipo, código, producto, origen, proveedor o lote productivo, fecha y evidencia aplicable.

El serial identificará una unidad individual cuando el dominio lo requiera.

La fecha de vencimiento, consumo preferente o vida útil tendrá semántica explícita y no será un texto libre ambiguo.

##### 6.9. La existencia tendrá estados separados

Como mínimo se distinguirán `on_hand`, `reserved`, `available`, `in_transit`, `quarantined`, `damaged`, `expired` y `lost` cuando apliquen.

La disponibilidad se calculará desde estados y políticas; no será copia manual de la cantidad física.

Una cantidad podrá existir físicamente y no estar disponible.

##### 6.10. El ledger y las proyecciones tendrán una relación única

Cada cambio de cantidad deberá originarse en un movimiento o evento canónico.

Las proyecciones por sede, LOC, posición, presentación, lote o estado serán derivadas o actualizadas atómicamente bajo un contrato único.

Ninguna proyección podrá modificarse sin un hecho correlacionado.

##### 6.11. Toda mutación será atómica o idempotente y reconciliable

Un fallo intermedio no podrá dejar movimiento, stock, costo, lote o ubicación en estados incompatibles.

Cada comando tendrá clave de idempotencia y resultado recuperable.

Los reintentos no volverán a sumar o descontar.

##### 6.12. Todo movimiento declarará causa y referencia

Entrada, consumo, venta, remisión, traslado, ajuste, merma, devolución, producción, daño y vencimiento serán tipos diferenciados.

El movimiento conservará actor, contexto, origen, destino, cantidad, unidad, producto, lote, estado y documento causante.

Una descripción libre no sustituirá el tipo de movimiento.

##### 6.13. La entrada física no será la compra

Una entrada podrá provenir de compra, producción, devolución, traslado, conteo inicial o regularización.

La recepción empresarial y la entrada física compartirán correlación, no identidad forzada.

Un documento sin mercancía no creará stock.

##### 6.14. La reserva será una asignación explícita y temporal

Toda reserva tendrá propósito, cantidad, producto, sede, lote o criterio, propietario, prioridad, fecha y expiración.

La reserva reducirá disponibilidad sin reducir existencia física.

Consumir, cancelar o expirar una reserva liberará o convertirá su cantidad de forma idempotente.

##### 6.15. El consumo y la salida se registrarán exactamente una vez

Producción, venta, retiro, merma, devolución y uso interno emitirán causas distintas.

Una salida no podrá producirse desde cantidad no disponible salvo política explícita de backorder o regularización.

Las anulaciones producirán compensación, no borrado.

##### 6.16. El traslado conservará tránsito y recepción

Un traslado entre lugares tendrá origen, destino, cantidad enviada, recibida, diferencia y estado.

La cantidad en tránsito no estará disponible en origen ni confirmada en destino.

El traslado interno dentro de una sede podrá simplificarse sin perder el movimiento.

##### 6.17. La remisión será documento operativo y no sustituto del ledger

Los estados de solicitud, preparación, despacho, tránsito y recepción describirán el proceso.

Cada efecto de inventario tendrá correlación visible y estado de publicación.

Una remisión registrada sin efectos deberá declararlo expresamente y no simular inventario actualizado.

##### 6.18. El conteo será una observación versionada

Una sesión de conteo conservará alcance, responsable, instante de corte, método, líneas observadas y evidencia.

El resultado no sobrescribirá inmediatamente la existencia teórica.

Los recuentos y confirmaciones conservarán sus valores originales.

##### 6.19. La diferencia y el ajuste serán expedientes distintos

La diferencia comparará observación y cantidad esperada.

La investigación registrará causa, evidencia y responsable.

El ajuste será una decisión autorizada que emite un movimiento compensatorio.

##### 6.20. Vencimiento, cuarentena, daño y pérdida no serán borrados

El sistema podrá bloquear, separar, liberar, consumir excepcionalmente, devolver o disponer según política.

Todo cambio de condición conservará actor, motivo, evidencia y cantidad.

FEFO excluirá inventario no utilizable y respetará reservas o retenciones.

##### 6.21. El frío será una condición operativa, no solo una ubicación

Los LOC fríos declararán rango, equipo o zona, productos compatibles y contingencia.

Las lecturas tendrán fuente, timestamp, dispositivo, calidad y relación con sede o LOC.

Una excursión generará evaluación y posible cuarentena; no declarará automáticamente pérdida o liberación.

##### 6.22. Unidad, presentación y cantidad base conservarán equivalencia

Toda operación persistirá la cantidad canónica y el contexto de captura.

Una caja, bolsa o tarro será presentación física; kilogramo, gramo, litro o unidad serán unidades de medida.

Las conversiones estarán versionadas y no dependerán de fallbacks locales contradictorios.

##### 6.23. El stock negativo no será un atajo silencioso

La operación normal bloqueará salidas superiores a la disponibilidad.

Cualquier excepción tendrá política, actor, motivo, límite y regularización.

El valor negativo no representará automáticamente demanda, reserva ni backorder.

##### 6.24. La historia será reconstruible

Desde cualquier saldo deberá poderse navegar a movimientos, documentos, conteos, lotes, ubicaciones y actores.

Correcciones, fusiones, divisiones y retiros conservarán relaciones con los registros previos.

Los datos históricos usarán la identidad y unidad vigentes al momento del hecho.

##### 6.25. La operación degradada conservará intención, no autoridad obsoleta

Los comandos offline tendrán identidad local, payload mínimo, timestamp y estado.

Al sincronizar se revalidarán permisos, contexto, disponibilidad y versión del recurso.

Los conflictos no se resolverán sumando automáticamente dos efectos.

##### 6.26. Etiquetas y escaneo serán mecanismos de acceso, no fuentes de verdad

Un código LOC, LPN, lote o producto resolverá una identidad canónica.

Una etiqueta dañada o reimpresa no creará una nueva entidad salvo reetiquetado controlado.

La impresión y reimpresión conservarán plantilla, dispositivo, actor, razón y resultado.


---

#### 7. Modelo conceptual objetivo

##### 7.1. Conceptos separados

| Concepto                | Definición objetivo                                                                  |
| ----------------------- | ------------------------------------------------------------------------------------ |
| Producto maestro        | Identidad de lo que se compra, produce, almacena, consume o vende.                   |
| Presentación física     | Forma empaquetada o comercial con factor hacia la unidad canónica.                   |
| Existencia              | Cantidad de un producto bajo sede, ubicación, lote, condición, presentación o LPN.   |
| Lugar de almacenamiento | Espacio empresarial que puede contener uno o varios LOC.                             |
| LOC                     | Ubicación operativa identificable y escaneable.                                      |
| Posición                | Subdivisión opcional dentro de un LOC.                                               |
| Contenedor físico       | Objeto reutilizable o desechable que puede existir independientemente del contenido. |
| LPN                     | Identidad logística de una unidad de contenido movible como conjunto.                |
| Lote                    | Agrupación trazable con origen y atributos comunes.                                  |
| Serial                  | Identidad de una unidad individual.                                                  |
| Estado de condición     | Apto, retenido, cuarentena, dañado, vencido, perdido u otro estado aprobado.         |
| Reserva                 | Asignación temporal de cantidad a un propósito.                                      |
| Movimiento              | Hecho que modifica cantidad, estado, ubicación o custodia.                           |
| Proyección de stock     | Lectura optimizada derivada del ledger o actualizada bajo el mismo contrato atómico. |
| Sesión de conteo        | Expediente de observaciones físicas a un instante de corte.                          |
| Diferencia              | Brecha entre cantidad esperada y observada.                                          |
| Ajuste                  | Movimiento autorizado que regulariza una diferencia.                                 |
| Lectura de condición    | Medición de temperatura u otra condición ambiental.                                  |
| Excursión               | Incumplimiento o posible incumplimiento de condición que exige evaluación.           |

##### 7.2. Relación general

```text
PRODUCTO + PRESENTACIÓN + UNIDAD
        ↓
ENTRADA / PRODUCCIÓN / DEVOLUCIÓN / REGULARIZACIÓN
        ↓
MOVIMIENTO CANÓNICO
        ↓
EXISTENCIA POR SEDE → LOC → POSICIÓN
                         ↘ LPN → CONTENIDO
        ↓
ESTADO: FÍSICO / RESERVADO / DISPONIBLE / TRÁNSITO / CUARENTENA / DAÑO / VENCIMIENTO
        ↓
CONSUMO / VENTA / TRASLADO / REMISIÓN / AJUSTE / DISPOSICIÓN
```

---

#### 8. Estados canónicos mínimos

##### 8.1. LOC

```text
draft → active → blocked → closing → closed → retired
```

##### 8.2. LPN

```text
draft → active → sealed → in_transit → opened → closed → voided → relabel_required
```

##### 8.3. Lote

```text
identified → pending_inspection → released → quarantined → blocked → depleted → expired → disposed
```

##### 8.4. Reserva

```text
draft → active → partially_consumed → consumed → released → expired → cancelled
```

##### 8.5. Movimiento

```text
pending → committed → failed → reversed → reconciled
```

##### 8.6. Traslado o remisión física

```text
requested → allocated → prepared → dispatched → in_transit → partially_received → received → difference_open → cancelled → closed
```

##### 8.7. Conteo

```text
draft → open → captured → recount_required → submitted → approved → adjusted → closed → cancelled
```

##### 8.8. Diferencia

```text
identified → under_investigation → justified → adjustment_requested → adjusted → rejected → closed
```

##### 8.9. Condición o excursión

```text
normal → warning → excursion_open → under_evaluation → released → quarantined → disposed → closed
```

Los nombres físicos podrán cambiar en E2/E3, pero no podrán colapsar estados con efectos empresariales distintos.

---

#### 9. Propiedad funcional y tecnológica

| Sistema o dominio    | Propiedad                                                                                         | Propietario funcional          |
| -------------------- | ------------------------------------------------------------------------------------------------- | ------------------------------ |
| NEXO                 | ledger, stock, LOC, posición, lote, LPN, reserva, traslado, conteo, diferencia y condición física | Operaciones / Inventario       |
| ORIGO                | orden, recepción empresarial, proveedor y diferencia comercial                                    | Compras                        |
| FOGO                 | lote productivo, consumo esperado/real y producto terminado                                       | Producción                     |
| PULSO / POS externo  | hecho de venta, anulación y devolución validada                                                   | Ventas / Caja                  |
| NUMERA               | valoración, costo y efecto económico derivado                                                     | Finanzas                       |
| VISO                 | superficie administrativa y configuración autorizada                                              | Gerencia / Administración      |
| SHELL / Supabase     | contratos, integridad, autorización, eventos, evidencia y migraciones                             | Tecnología / gobierno de datos |
| Sistemas de sensores | lecturas de condición cuando existan                                                              | Operaciones / Mantenimiento    |

##### 9.1. Regla de administración

Una aplicación podrá exponer pantallas administrativas sin convertirse en fuente de verdad. Toda mutación deberá invocar el contrato propietario del dominio y conservar actor, alcance y resultado.

---

#### 10. Línea base de implementación verificable

| Capacidad actual                    | Estado                                 | Conclusión                                                                                                                      |
| ----------------------------------- | -------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| Catálogo operativo y presentaciones | existente                              | NEXO conserva catálogo, configuración por sede y presentaciones físicas; la semántica debe unificarse con `CAP-SCOPE-004`.      |
| Stock por sede y LOC                | existente parcial                      | Existe consulta y operación, pero la relación ledger–proyecciones y la reconciliación deben cerrarse.                           |
| Stock por presentación              | existente parcial                      | `inventory_stock_by_uom_profile` evita inferir paquetes, pero requiere contrato único con cantidad base.                        |
| Entradas                            | existente parcial                      | Hay entradas manuales y base para recepción; falta cerrar ORIGO → NEXO y lotes de extremo a extremo.                            |
| Ubicación y posiciones              | existente parcial                      | Hay LOC, posiciones, kiosco y stock sin ubicación; falta ciclo completo y reglas de excepción.                                  |
| Movimientos, retiros y traslados    | existente parcial                      | Existen flujos auditables, pero la atomicidad y estados de tránsito no están certificados.                                      |
| Remisiones                          | existente parcial                      | Existe solicitud, preparación, despacho, tránsito y recepción; los efectos reales pueden estar desactivados y deben declararse. |
| Conteo inicial y ajustes            | existente parcial                      | Hay captura y ajuste; falta confirmar historia, investigación, aprobación y cobertura total del catálogo.                       |
| Reservas                            | no verificado                          | No existe evidencia suficiente de una reserva canónica con expiración y liberación.                                             |
| Lotes y vencimientos                | infraestructura parcial                | Existen campos y referencias, pero no un ciclo integral de liberación, FEFO, cuarentena y disposición.                          |
| LPN                                 | infraestructura sin proceso alcanzable | Existen fragmentos de tablas, endpoint y componente, pero la ruta vigente no ofrece un ciclo funcional completo.                |
| Daño, pérdida y cuarentena          | parcial o no verificado                | No existe evidencia de un expediente completo con estados, autorización y efectos.                                              |
| Frío y condiciones                  | manual o no verificado                 | Existen zonas frías reales; no está confirmado un sistema integral de lecturas, alertas, excursiones y cuarentena.              |
| Integraciones                       | parcial                                | ORIGO, FOGO y ventas todavía deben cerrar efectos exactamente una vez y conciliación.                                           |
| Impresión y escaneo                 | existente parcial                      | Printing/Zebra existe, pero la cola y confirmación física no son durables de extremo a extremo.                                 |

---

#### 11. Matriz de decisión de cobertura

| Capacidad   | Objeto                            | Tratamiento         | Aplicación candidata | Justificación                                                                  |
| ----------- | --------------------------------- | ------------------- | -------------------- | ------------------------------------------------------------------------------ |
| `CAP-06.01` | lugares de almacenamiento         | `REUSE_OR_REFACTOR` | NEXO                 | LOC y configuración existentes; normalizar jerarquía, ciclo y códigos.         |
| `CAP-06.02` | productos, lotes y recipientes    | `REUSE_OR_REFACTOR` | NEXO                 | Reusar producto, campos de lote y base LPN; completar semántica y proceso.     |
| `CAP-06.03` | entradas                          | `REUSE_OR_REFACTOR` | NEXO                 | Consolidar entrada física correlacionada con ORIGO, FOGO y devoluciones.       |
| `CAP-06.04` | ubicación y reubicación           | `REUSE_OR_REFACTOR` | NEXO                 | Consolidar LOC, posición, stock no ubicado y movimiento atómico de LPN.        |
| `CAP-06.05` | disponibilidad                    | `REUSE_OR_REFACTOR` | NEXO                 | Derivar disponibilidad desde estados, reservas, tránsito y condición.          |
| `CAP-06.06` | reservas                          | `BUILD`             | NEXO                 | No hay ciclo canónico comprobado; diseñar asignación, expiración y liberación. |
| `CAP-06.07` | consumo y salida                  | `REUSE_OR_REFACTOR` | NEXO                 | Unificar causas y efectos desde producción, ventas, retiros y merma.           |
| `CAP-06.08` | traslados                         | `REUSE_OR_REFACTOR` | NEXO                 | Completar tránsito, recepción, diferencias e idempotencia.                     |
| `CAP-06.09` | solicitud y gestión de remisiones | `REUSE_OR_REFACTOR` | NEXO                 | Mantener proceso, separar documento y efecto físico.                           |
| `CAP-06.10` | preparación y despacho            | `REUSE_OR_REFACTOR` | NEXO                 | Consolidar asignación por LOC/lote/LPN y cantidades reales.                    |
| `CAP-06.11` | recepción de remisiones           | `REUSE_OR_REFACTOR` | NEXO                 | Conservar parcialidad, diferencias y confirmación de destino.                  |
| `CAP-06.12` | conteos                           | `REUSE_OR_REFACTOR` | NEXO                 | Convertir conteos en sesiones versionadas y reconciliables.                    |
| `CAP-06.13` | investigación y ajustes           | `REUSE_OR_REFACTOR` | NEXO                 | Separar observación, investigación, aprobación y movimiento compensatorio.     |
| `CAP-06.14` | vencimiento, daño y pérdida       | `BUILD`             | NEXO                 | Completar estados, FEFO, cuarentena, disposición y evidencia.                  |
| `CAP-06.15` | frío y condiciones                | `BUILD`             | NEXO                 | Construir reglas, lecturas, excursiones, alertas y contingencias.              |

##### 11.1. Resumen de clasificaciones

| Tratamiento         | Cantidad |
| ------------------- | -------- |
| `REUSE_OR_REFACTOR` | 12       |
| `BUILD`             | 3        |
| **Total**           | **15**   |

---

#### 12. CAP-06.01 — Definir lugares de almacenamiento

##### Reglas mínimas

- catalogar sedes, lugares, LOC y posiciones con códigos estables;
- clasificar ambiente, capacidad, compatibilidad, acceso y condición;
- impedir cierre con contenido sin tratamiento;
- separar lugar físico de área organizacional y centro de costo.

##### Destinos canónicos

- `NEXO-UX-014` a `NEXO-UX-016`
- `NEXO-DOM-007`
- `SUPA-AUD-019`
- `CAP-SCOPE-013`

---

#### 13. CAP-06.02 — Identificar productos, lotes y recipientes

##### Reglas mínimas

- identificar producto, presentación, lote, serial, contenedor y LPN sin fusionarlos;
- conservar origen de lote y atributos de vencimiento;
- definir tipos y ciclo de LPN antes de completar interfaz;
- resolver etiqueta y reetiquetado sin duplicar identidad.

##### Destinos canónicos

- `NEXO-DOM-001` a `NEXO-DOM-007`
- `NEXO-DOM-019` a `NEXO-DOM-024`
- `NEXO-UX-026` a `NEXO-UX-029`
- `NEXO-UX-036` a `NEXO-UX-038`

---

#### 14. CAP-06.03 — Registrar entradas

##### Reglas mínimas

- registrar origen, documento, producto, presentación, cantidad, lote, condición y destino;
- admitir parcialidad y cuarentena inicial;
- separar entrada física de compra y hecho económico;
- usar correlación e idempotencia.

##### Destinos canónicos

- `NEXO-UX-014`
- `ORIGO-UX-009` a `ORIGO-UX-014`
- `INT-PROC-001` a `INT-PROC-005`
- `PROC-CAT-002`

---

#### 15. CAP-06.04 — Ubicar y reubicar existencias

##### Reglas mínimas

- exigir ubicación válida o excepción transitoria tipada;
- registrar origen y destino;
- mover contenido LPN atómicamente;
- evitar cantidad simultánea en posición, LOC y LPN.

##### Destinos canónicos

- `NEXO-UX-015`
- `NEXO-UX-016`
- `NEXO-DOM-007`
- `NEXO-DOM-021`
- `NEXO-DOM-022`

---

#### 16. CAP-06.05 — Consultar disponibilidad

##### Reglas mínimas

- mostrar físico, reservado, disponible, tránsito y no utilizable por separado;
- permitir descomposición por sede, LOC, lote, presentación y estado;
- declarar timestamp y frescura;
- explicar diferencias o conciliaciones pendientes.

##### Destinos canónicos

- `NEXO-UX-003` a `NEXO-UX-007`
- `SUPA-ARC-005`
- `SUPA-ARC-006`
- `CAP-SCOPE-017`

---

#### 17. CAP-06.06 — Reservar o separar existencias

##### Reglas mínimas

- crear reserva con propósito, cantidad, prioridad y expiración;
- asignar lote o permitir asignación posterior según política;
- evitar sobreasignación concurrente;
- liberar, consumir o cancelar sin doble efecto.

##### Destinos canónicos

- `PROC-CAT-002`
- `PROC-CAT-009` a `PROC-CAT-018`
- `PROC-ACTOR-003`
- `NEXO-UX-001`
- `NEXO-AUTH-030`

---

#### 18. CAP-06.07 — Registrar consumo y salida

##### Reglas mínimas

- distinguir venta, producción, retiro, merma, devolución y uso interno;
- validar cantidad disponible y unidad;
- vincular origen empresarial;
- compensar anulaciones sin borrar.

##### Destinos canónicos

- `NEXO-UX-017`
- `FOGO-UX-012`
- `INT-PROD-001` a `INT-PROD-005`
- `INT-POS-015` a `INT-POS-020`
- `INT-SALES-001` a `INT-SALES-011`

---

#### 19. CAP-06.08 — Trasladar entre lugares

##### Reglas mínimas

- registrar origen, destino, despacho, tránsito, recepción y diferencias;
- diferenciar traslado interno y entre sedes;
- bloquear disponibilidad durante tránsito;
- soportar parcialidad y compensación.

##### Destinos canónicos

- `NEXO-UX-016`
- `NEXO-UX-022`
- `PROC-CAT-009` a `PROC-CAT-018`
- `TREQ-NEXO-011`

---

#### 20. CAP-06.09 — Solicitar y gestionar remisiones

##### Reglas mínimas

- conservar solicitud, edición, cancelación y autorización;
- mantener presentaciones mínimas y unidades canónicas;
- mostrar si los efectos de inventario están activos;
- evitar que el documento sustituya el movimiento.

##### Destinos canónicos

- `NEXO-UX-009`
- `NEXO-AUTH-004` a `NEXO-AUTH-005`
- `TREQ-NEXO-006`
- `CAP-SCOPE-011`

---

#### 21. CAP-06.10 — Preparar y despachar remisiones

##### Reglas mínimas

- asignar cantidades reales por LOC, lote, presentación o LPN;
- permitir división de líneas y faltantes;
- registrar cargue y despacho;
- emitir efectos exactamente una vez.

##### Destinos canónicos

- `NEXO-UX-010` a `NEXO-UX-012`
- `NEXO-AUTH-006` a `NEXO-AUTH-009`
- `NEXO-DOM-023`
- `TREQ-INTEGRATION-011`

---

#### 22. CAP-06.11 — Recibir y confirmar remisiones

##### Reglas mínimas

- registrar recibido, faltante, sobrante, daño y rechazo;
- ubicar o dejar pendiente controlado;
- conservar recepción parcial;
- conciliar origen, tránsito y destino.

##### Destinos canónicos

- `NEXO-UX-013`
- `NEXO-AUTH-010`
- `NEXO-UX-022`
- `TREQ-NEXO-006`
- `TREQ-INTEGRATION-011`

---

#### 23. CAP-06.12 — Contar inventario

##### Reglas mínimas

- definir alcance y corte de sesión;
- capturar observación sin revelar cantidad teórica cuando aplique;
- permitir recuento y doble control;
- conservar historia y métricas.

##### Destinos canónicos

- `NEXO-UX-018`
- `NEXO-AUTH-012`
- `NEXO-AUTH-027`
- `PROC-ACTOR-003`
- `CAP-SCOPE-017`

---

#### 24. CAP-06.13 — Investigar y ajustar diferencias

##### Reglas mínimas

- crear diferencia antes del ajuste;
- clasificar causa y evidencia;
- separar capturador y aprobador;
- emitir movimiento compensatorio atómico.

##### Destinos canónicos

- `NEXO-UX-019`
- `NEXO-UX-022`
- `NEXO-AUTH-011`
- `NEXO-AUTH-027`
- `SUPA-AUD-018`
- `SUPA-AUD-019`

---

#### 25. CAP-06.14 — Controlar vencimiento, daño y pérdida

##### Reglas mínimas

- calcular alertas con reglas por producto y lote;
- aplicar FEFO sobre inventario liberado;
- gestionar cuarentena, daño, pérdida, disposición, devolución o liberación;
- conservar trazabilidad de cantidad y costo.

##### Destinos canónicos

- `PROC-CAT-002`
- `PROC-CAT-009` a `PROC-CAT-018`
- `NEXO-DOM-010`
- `NEXO-DOM-017`
- `NEXO-DOM-023`
- `CAP-SCOPE-003`
- `CAP-SCOPE-008`

---

#### 26. CAP-06.15 — Controlar frío y condiciones de almacenamiento

##### Reglas mínimas

- definir LOC y productos sujetos a condición;
- registrar lecturas y fuente;
- detectar excursión y generar evaluación;
- activar contingencia por red, energía, equipo o sensor.

##### Destinos canónicos

- `PROC-CAT-002`
- `PROC-CAT-009` a `PROC-CAT-018`
- `CAP-SCOPE-003`
- `CAP-SCOPE-013`
- `CAP-SCOPE-015`
- `CAP-SCOPE-018`

---

#### 27. Fronteras con otros dominios

##### 27.1. Catálogo

NEXO consumirá producto, presentación, unidad y especificación canónicos; no los redefinirá por operación.

##### 27.2. Compras

ORIGO será fuente de orden y recepción empresarial; NEXO será fuente de entrada, lote, condición y ubicación.

##### 27.3. Producción

FOGO será fuente del lote productivo y ejecución; NEXO materializará consumo y producto terminado.

##### 27.4. Ventas

PULSO o POS externo emitirá venta validada; NEXO aplicará salida exactamente una vez.

##### 27.5. Activos

CAP-07 gobernará activos y contenedores permanentes; CAP-06 gobernará el contenido inventariable y LPN.

##### 27.6. Logística

CAP-11 gobernará ruta, vehículo y entrega; NEXO gobernará cantidades, tránsito y recepción de inventario.

##### 27.7. Finanzas

NUMERA consumirá valoración y eventos; no modificará cantidades físicas.

##### 27.8. SST e inocuidad

Los estados de cuarentena y condición podrán recibir decisiones de procesos de SST o calidad sin exponer datos médicos.

##### 27.9. Instalaciones

CAP-13 gobernará equipos de frío y mantenimiento; NEXO relacionará el impacto sobre existencia.

##### 27.10. Documentos

Etiquetas, actas y evidencia se conservarán según CAP-16 sin convertirse en fuente de saldo.

##### 27.11. Analítica

CAP-17 calculará indicadores desde eventos cerrados y conciliados.

##### 27.12. Continuidad

CAP-18 definirá contingencias y recuperación sin perder ni duplicar movimientos.


---

#### 28. Información conceptual requerida

##### 28.1. Identidad de existencia

- `product_id`
- `presentation_id opcional`
- `canonical_quantity`
- `canonical_unit`
- `captured_quantity`
- `captured_unit`
- `lot_id opcional`
- `serial_id opcional`
- `condition_status`
- `owner_organization_id`

##### 28.2. Ubicación

- `site_id`
- `storage_place_id opcional`
- `loc_id`
- `position_id opcional`
- `lpn_id opcional`
- `unlocated_reason opcional`
- `effective_from`
- `effective_to`

##### 28.3. Movimiento

- `movement_id`
- `movement_type`
- `source_type`
- `source_id`
- `idempotency_key`
- `from_state`
- `to_state`
- `quantity`
- `actor`
- `operational_context`
- `occurred_at`
- `committed_at`
- `reversal_of opcional`

##### 28.4. Lote

- `lot_id`
- `lot_type`
- `lot_code`
- `supplier_lot_code opcional`
- `production_batch_id opcional`
- `manufactured_at`
- `received_at`
- `expiry_date`
- `release_status`
- `specification_version`

##### 28.5. LPN

- `lpn_id`
- `code`
- `type`
- `status`
- `site_id`
- `loc_id`
- `physical_container_id opcional`
- `parent_lpn_id opcional`
- `capacity`
- `weight`
- `sealed_at`
- `closed_at`

##### 28.6. Reserva

- `reservation_id`
- `purpose`
- `source_id`
- `product_id`
- `requested_qty`
- `allocated_qty`
- `lot_policy`
- `priority`
- `expires_at`
- `status`

##### 28.7. Conteo y diferencia

- `count_session_id`
- `scope`
- `snapshot_at`
- `observed_qty`
- `expected_qty_snapshot`
- `difference_qty`
- `recount`
- `cause`
- `evidence`
- `decision`
- `adjustment_movement_id`

##### 28.8. Condición

- `reading_id`
- `condition_type`
- `value`
- `unit`
- `source_device`
- `loc_id`
- `captured_at`
- `quality_status`
- `threshold_version`
- `excursion_id opcional`


---

#### 29. Eventos e integraciones requeridos

```text
inventory.entry.requested
inventory.entry.committed
inventory.location.assigned
inventory.location.changed
inventory.reservation.created
inventory.reservation.released
inventory.reservation.consumed
inventory.movement.committed
inventory.movement.reversed
inventory.transfer.dispatched
inventory.transfer.received
inventory.remission.inventory_effect_pending
inventory.remission.inventory_effect_committed
inventory.count.opened
inventory.count.submitted
inventory.difference.identified
inventory.adjustment.approved
inventory.adjustment.committed
inventory.lot.released
inventory.lot.quarantined
inventory.lot.expired
inventory.condition.excursion_opened
inventory.condition.excursion_resolved
inventory.lpn.created
inventory.lpn.packed
inventory.lpn.moved
inventory.lpn.closed
inventory.reconciliation.required
inventory.reconciliation.completed
```

##### 29.1. Integraciones obligatorias

| Origen                    | Contrato hacia NEXO                    | Efecto esperado                                                    |
| ------------------------- | -------------------------------------- | ------------------------------------------------------------------ |
| ORIGO                     | recepción aprobada y líneas físicas    | entrada, lote, condición y ubicación exactamente una vez           |
| FOGO                      | consumo y finalización de lote         | salida de insumos y entrada de terminado exactamente una vez       |
| PULSO / POS externo       | venta, anulación y devolución validada | salida o compensación exactamente una vez                          |
| NEXO remisiones           | despacho, tránsito y recepción         | transferencia correlacionada sin duplicar origen/destino           |
| Sensores o captura manual | lectura de condición                   | evaluación y posible excursión sin mutación automática no aprobada |
| NUMERA                    | consulta de valoración y eventos       | sin escritura directa de cantidades                                |

---

#### 30. Autorización y segregación

##### 30.1. Capacidades separadas

- consultar existencia;
- crear o administrar LOC;
- registrar entrada;
- ubicar y reubicar;
- reservar y liberar;
- retirar o consumir;
- despachar;
- recibir;
- capturar conteo;
- aprobar diferencia;
- ejecutar ajuste;
- cambiar condición;
- liberar cuarentena;
- declarar daño o pérdida;
- crear o cerrar LPN;
- empacar o desempacar;
- imprimir o reimprimir;
- consultar costos;
- exportar información.

##### 30.2. Reglas

- capturar un conteo no otorgará permiso para aprobar el ajuste;
- despachar no otorgará permiso para confirmar la recepción;
- registrar daño no otorgará permiso para disponer o liberar;
- crear una reserva no otorgará permiso para sobreasignar;
- la visibilidad de costo se separará de la operación física;
- las mutaciones validarán sede, área, rol operativo y dispositivo cuando corresponda;
- la simulación no producirá efectos reales;
- cada acción conservará actor real y actor operativo.

---

#### 31. Experiencia por actor

##### 31.1. Solicitante o área usuaria

- consultar disponibilidad comprensible;
- solicitar remisión o reserva;
- ver sustitución, faltante y estado;
- no editar stock.

##### 31.2. Bodeguero

- recibir, ubicar, preparar, mover, retirar y contar;
- usar escáner, tablet, LOC y presentación real;
- ver tareas pendientes y excepciones;
- no aprobar sus propias diferencias salvo política.

##### 31.3. Receptor de sede

- confirmar recibido por línea;
- registrar faltante, sobrante, daño o rechazo;
- ubicar o enviar a cola de ubicación;
- conservar evidencia mínima.

##### 31.4. Supervisor de inventario

- ver conciliaciones, stock no ubicado, vencimientos, reservas y diferencias;
- aprobar ajustes según umbral;
- liberar o bloquear estados autorizados;
- consultar historial.

##### 31.5. Producción

- ver insumos disponibles y reservados;
- consumir desde lote/LOC válido;
- registrar terminado y merma mediante FOGO;
- no modificar proyecciones directamente.

##### 31.6. Compras

- ver recepción física correlacionada;
- resolver con proveedor sin alterar stock;
- consultar lotes y diferencias necesarias;
- no confirmar ubicación física.

##### 31.7. Gerencia y auditoría

- consultar saldos, movimientos, diferencias y riesgos;
- ver fuente y frescura;
- distinguir dato confirmado de pendiente;
- exportar solo con autorización.


---

#### 32. Operación offline y contingencia

- la consulta offline se marcará como caché con timestamp y no como saldo actual;
- cada comando pendiente tendrá ID local e idempotency key;
- la sincronización revalidará permisos, disponibilidad, lote, ubicación y versión;
- un conflicto de cantidad, lote o ubicación requerirá resolución explícita;
- una caída durante impresión no marcará el trabajo como confirmado;
- una caída de energía o frío activará procedimiento operativo independiente de la aplicación;
- los formularios en papel de contingencia tendrán numeración, custodia y posterior conciliación;
- la recuperación demostrará que no se perdieron ni duplicaron movimientos.

---

#### 33. Evidencia, conservación y auditoría

- ledger y movimientos correlacionados;
- snapshots o proyecciones reconciliables;
- sesiones y líneas de conteo;
- recuentos y aprobaciones;
- lotes, vencimientos y cambios de condición;
- reservas y liberaciones;
- traslados, remisiones y recepciones;
- contenido y movimientos de LPN;
- lecturas y excursiones de condición;
- etiquetas, reimpresiones y anulaciones;
- fallos, reintentos, reversos y conciliaciones;
- exportaciones y accesos sensibles.

La retención exacta se resolverá en `CAP-SCOPE-016`; ningún cierre autoriza eliminar historia referenciada.

---

#### 34. Patrones legacy destinados a retiro

- actualizar stock por sede, LOC y posición mediante llamadas independientes sin contrato atómico;
- usar una proyección mutable como verdad sin movimiento correlacionado;
- inferir presentaciones físicas desde stock base;
- aplicar unidad o modalidad por fallback silencioso;
- permitir stock no ubicado sin antigüedad ni responsable;
- considerar una ruta, tabla o componente LPN como proceso implementado;
- contabilizar contenido LPN también como stock suelto;
- mover un LPN sin mover todo su contenido;
- usar texto libre como lote o estado de condición sin identidad canónica;
- reservar mediante notas, chats o reducción manual de stock;
- completar remisión sin declarar si publicó inventario;
- usar conteo como sobrescritura directa;
- permitir que quien cuenta apruebe toda diferencia por defecto;
- eliminar lote vencido o cantidad dañada para “limpiar” el sistema;
- usar stock físico como disponibilidad comercial;
- permitir salida negativa sin política;
- considerar una lectura aislada como cumplimiento de frío;
- limpiar una cola de impresión antes del resultado del envío;
- duplicar movimientos por reintento de ORIGO, FOGO o ventas.

`RETIRE` aplica a estos patrones, no a las capacidades empresariales.

---

#### 35. Preguntas pendientes reutilizadas

No se crean preguntas nuevas.

| Pregunta            | Uso dentro de esta tarea                                          | Puerta de resolución                                             |
| ------------------- | ----------------------------------------------------------------- | ---------------------------------------------------------------- |
| `DAT-04`            | fuente operativa actual de cantidades disponibles                 | `NEXO-UX-001`, migración y readiness                             |
| `DAT-05`            | visibilidad actual entre sedes                                    | diseño E2 y matriz territorial                                   |
| `DAT-08` a `DAT-10` | historia real de solicitudes, despachos y recepciones de remisión | `NEXO-UX-009` a `NEXO-UX-013` antes de migración                 |
| `DAT-11`            | historia actual de conteos                                        | `NEXO-UX-018`, migración y readiness                             |
| `DAT-26`            | evidencia actual de correcciones de cantidad                      | `NEXO-UX-019` y `NEXO-AUTH-027`                                  |
| `OPE-01`            | lugares reales de almacenamiento en frío                          | `CAP-SCOPE-013` y diseño físico E2                               |
| `OPE-04`            | autoridad para modificar una solicitud de remisión                | `NEXO-AUTH-005` y diseño E2                                      |
| `OPE-06`            | autoridad real para aprobar una diferencia de conteo              | `NEXO-AUTH-027` y matriz de aprobación                           |
| `COM-01`            | origen físico del inventario de Vaila Vainilla                    | `CAP-SCOPE-009`, `CAP-SCOPE-011` y diseño territorial            |
| `TEC-06`            | fuente técnica actual de inventario                               | respondida: NEXO y estructuras compartidas; usar como línea base |

Las preguntas no bloquean esta clasificación conceptual, pero serán obligatorias antes de migrar historia, fijar ubicaciones definitivas o aprobar un piloto con efectos reales.

---

#### 36. Riesgos principales

| Riesgo                                    | Severidad | Control principal                       |
| ----------------------------------------- | --------- | --------------------------------------- |
| saldo imposible de reconstruir            | crítica   | ledger y proyecciones reconciliables    |
| doble contabilización entre LOC y LPN     | crítica   | representación exclusiva                |
| salida duplicada por integración          | crítica   | idempotencia y correlación              |
| stock físico vendido aunque esté retenido | crítica   | estados y disponibilidad derivada       |
| lote o vencimiento perdido                | crítica   | identidad y obligatoriedad por producto |
| producto vencido seleccionado             | crítica   | FEFO y bloqueo                          |
| reserva sobreasignada                     | crítica   | concurrencia y expiración               |
| conteo convertido en ajuste silencioso    | crítica   | sesión, diferencia y aprobación         |
| remisión sin efecto o con doble efecto    | crítica   | estado de publicación y conciliación    |
| stock no ubicado indefinido               | alta      | cola y SLA de ubicación                 |
| LPN movido sin contenido                  | crítica   | movimiento atómico                      |
| cadena de frío no demostrable             | crítica   | lecturas, excursión y contingencia      |
| daño o pérdida borrados                   | crítica   | estado y disposición auditada           |
| unidad convertida de forma distinta       | crítica   | contrato único de medición              |
| cola offline o impresión duplicada        | alta      | idempotencia y estado durable           |

---

#### 37. Hallazgos y destinos canónicos

| ID                  | Hallazgo                                                                                                | Riesgo  | Tarea propietaria                                                                                               | Momento                    |
| ------------------- | ------------------------------------------------------------------------------------------------------- | ------- | --------------------------------------------------------------------------------------------------------------- | -------------------------- |
| H-CAP-SCOPE-006-001 | ledger y proyecciones de stock se actualizan desde rutas con atomicidad no demostrada                   | crítica | `SUPA-AUD-018`; `SUPA-AUD-019`; `SUPA-ARC-003`; `SUPA-ARC-005`; `SUPA-ARC-006`; `SUPA-ARC-012` a `SUPA-ARC-014` | E3 antes de efectos reales |
| H-CAP-SCOPE-006-002 | la jerarquía sede–LOC–posición y el ciclo de cierre requieren consolidación                             | alta    | `NEXO-UX-014` a `NEXO-UX-016`; `NEXO-DOM-007`; `CAP-SCOPE-013`                                                  | E2/E3                      |
| H-CAP-SCOPE-006-003 | el stock sin ubicación existe como superficie operativa y requiere gobierno temporal                    | alta    | `NEXO-UX-015`; `NEXO-UX-022`; `PROC-CAT-013`                                                                    | E2 antes de piloto         |
| H-CAP-SCOPE-006-004 | LPN conserva infraestructura fragmentada sin ciclo operativo alcanzable                                 | crítica | `NEXO-DOM-002` a `NEXO-DOM-008`; `NEXO-DOM-019` a `NEXO-DOM-024`; `NEXO-UX-026` a `NEXO-UX-040`                 | E2/E3 antes de uso         |
| H-CAP-SCOPE-006-005 | la identidad de LPN y contenedor físico todavía requiere separación completa                            | crítica | `NEXO-DOM-019`; `NEXO-DOM-020`; `CAP-SCOPE-007`                                                                 | E2                         |
| H-CAP-SCOPE-006-006 | lote y vencimiento existen parcialmente pero no están cerrados de extremo a extremo                     | crítica | `PROC-CAT-002`; `NEXO-DOM-023`; `CAP-SCOPE-008`; `CAP-SCOPE-013`                                                | E2/E3                      |
| H-CAP-SCOPE-006-007 | no existe evidencia suficiente de un ciclo canónico de reservas                                         | crítica | `PROC-CAT-002`; `PROC-CAT-009` a `PROC-CAT-018`; `NEXO-UX-001`                                                  | E2                         |
| H-CAP-SCOPE-006-008 | cantidad física, reservada, disponible, tránsito y cuarentena no tienen un contrato integral comprobado | crítica | `SUPA-AUD-019`; `SUPA-AUD-022`; `PROC-CAT-002`; `CAP-SCOPE-017`                                                 | E2/E3                      |
| H-CAP-SCOPE-006-009 | la recepción ORIGO → NEXO no está cerrada con parcialidad, lote y diferencias                           | crítica | `INT-PROC-001` a `INT-PROC-005`; `ORIGO-UX-009` a `ORIGO-UX-015`; `NEXO-UX-014`                                 | E2/E4                      |
| H-CAP-SCOPE-006-010 | FOGO → NEXO no está cerrado para consumo y producto terminado por lote                                  | crítica | `INT-PROD-001` a `INT-PROD-005`; `FOGO-UX-012`; `FOGO-UX-013`                                                   | E2/E4                      |
| H-CAP-SCOPE-006-011 | ventas externas o PULSO todavía deben producir salida exactamente una vez                               | crítica | `INT-POS-011` a `INT-POS-020`; `INT-SALES-001` a `INT-SALES-011`                                                | E4 antes de efectos        |
| H-CAP-SCOPE-006-012 | las remisiones pueden existir con publicación de inventario desactivable                                | crítica | `NEXO-UX-009` a `NEXO-UX-013`; `TREQ-NEXO-006`; `TREQ-INTEGRATION-011`                                          | E2/E5                      |
| H-CAP-SCOPE-006-013 | la conservación real de conteos anteriores sigue pendiente de confirmación                              | alta    | `DAT-11`; `NEXO-UX-018`                                                                                         | antes de migración         |
| H-CAP-SCOPE-006-014 | la evidencia y autoridad actuales para corregir cantidades no están confirmadas                         | crítica | `DAT-26`; `OPE-06`; `NEXO-UX-019`; `NEXO-AUTH-027`                                                              | E2 antes de piloto         |
| H-CAP-SCOPE-006-015 | los lugares reales de frío y sus responsables siguen pendientes de validación                           | alta    | `OPE-01`; `CAP-SCOPE-013`                                                                                       | antes de diseño físico     |
| H-CAP-SCOPE-006-016 | no existe integración comprobada de lecturas, excursiones y cuarentena por cadena de frío               | crítica | `PROC-CAT-002`; `CAP-SCOPE-003`; `CAP-SCOPE-013`; `CAP-SCOPE-015`; `CAP-SCOPE-018`                              | E2/E4                      |
| H-CAP-SCOPE-006-017 | daño, pérdida, vencimiento, cuarentena y disposición no forman un ciclo integral comprobado             | crítica | `NEXO-DOM-010`; `NEXO-DOM-017`; `PROC-CAT-009` a `PROC-CAT-018`                                                 | E2                         |
| H-CAP-SCOPE-006-018 | el origen del inventario de Vaila Vainilla sigue sin confirmar                                          | alta    | `COM-01`; `CAP-SCOPE-009`; `CAP-SCOPE-011`                                                                      | antes de diseño de canal   |
| H-CAP-SCOPE-006-019 | la precedencia de unidades, presentaciones y perfiles permanece distribuida entre consumidores          | crítica | `CAP-SCOPE-004`; `SHELL-CON-001`; `SHELL-CON-009`; `SHELL-CON-012`; `SUPA-AUD-019`                              | E3                         |
| H-CAP-SCOPE-006-020 | impresión, escaneo y operación offline no tienen confirmación durable de extremo a extremo              | alta    | `NEXO-UX-020`; `NEXO-UX-037`; `NEXO-UX-038`; `QUEUE-ARC-001` a `QUEUE-ARC-010`                                  | E4/E5                      |

Todos los hallazgos tienen propietario y puerta. No queda pendiente narrativo sin destino.

---

#### 38. Decisiones canónicas resultantes

1. NEXO será propietario del estado físico y la trazabilidad de inventario.
2. ORIGO, FOGO y ventas emitirán hechos de origen; no escribirán stock por su cuenta.
3. Producto, presentación, existencia, lote, serial, LOC, posición, LPN y contenedor serán conceptos distintos.
4. La jerarquía física utilizará sede, LOC y posición opcional con códigos estables.
5. El stock no ubicado será una excepción temporal controlada.
6. Un LPN será identidad logística de contenido y no ubicación ni activo.
7. El contenido de LPN no se contabilizará también como stock suelto.
8. Los lotes conservarán origen, vigencia y estado de liberación.
9. La cantidad física no equivaldrá a disponibilidad.
10. El ledger y las proyecciones tendrán un contrato único y reconciliable.
11. Toda mutación será atómica o idempotente y compensable.
12. Todo movimiento tendrá tipo, causa, documento, actor y contexto.
13. Las reservas serán explícitas, temporales y separadas del stock físico.
14. El tránsito no estará disponible en origen ni confirmado en destino.
15. Las remisiones declararán si el efecto de inventario está pendiente o comprometido.
16. El conteo será observación; la diferencia, investigación; el ajuste, decisión autorizada.
17. Vencimiento, daño, pérdida y cuarentena no se resolverán borrando.
18. FEFO operará solo sobre existencia liberada y utilizable.
19. La cadena de frío tendrá reglas, lecturas, excursiones y contingencias.
20. Las unidades y presentaciones usarán una equivalencia canónica única.
21. El stock negativo no será comportamiento normal ni sustituto de demanda.
22. Las etiquetas y escáneres resolverán identidades; no serán fuentes de verdad.
23. La familia `CAP-06` se considera parcialmente implementada y reutilizable, pero no cerrada.

---

#### 39. Requisitos de prueba derivados

Esta tarea genera tres requisitos distintos y no duplicados:

```text
TREQ-NEXO-011
TREQ-NEXO-012
TREQ-INTEGRATION-011
```

Los detalles completos se incorporan exclusivamente en el archivo canónico `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` regenerado.

No se entregan filas independientes.

##### 39.1. `TREQ-NEXO-011`

Protege ledger, proyecciones, estados de existencia, disponibilidad, reservas, ubicación, movimientos, conteos y ajustes, incluyendo atomicidad, idempotencia y ausencia de doble contabilización.

##### 39.2. `TREQ-NEXO-012`

Protege lote, vencimiento, FEFO, condición, cuarentena, daño, pérdida, frío y disposición con historia y evidencia.

##### 39.3. `TREQ-INTEGRATION-011`

Protege los efectos exactamente una vez desde ORIGO, FOGO, ventas y remisiones hacia NEXO, con compensación y conciliación.

---

#### 40. Dependencias habilitadas y restricciones

- `CAP-SCOPE-007`;
- `CAP-SCOPE-008`;
- `CAP-SCOPE-009`;
- `CAP-SCOPE-011`;
- `CAP-SCOPE-012`;
- `CAP-SCOPE-013`;
- `CAP-SCOPE-015`;
- `CAP-SCOPE-016`;
- `CAP-SCOPE-017`;
- `CAP-SCOPE-018`;
- `NEXO-DOM-001` a `NEXO-DOM-024`;
- `NEXO-AUTH-001` a `NEXO-AUTH-030`;
- `NEXO-UX-001` a `NEXO-UX-042`;
- `INT-PROC-001` a `INT-PROC-005`;
- `INT-PROD-001` a `INT-PROD-005`;
- `INT-POS-011` a `INT-POS-020`;
- `INT-SALES-001` a `INT-SALES-011`;
- diseño TO-BE de inventario, almacenamiento, lotes, reservas, conteos y frío;
- arquitectura E3 de ledger, proyecciones, ubicaciones, lotes y LPN;
- paquetes E5 de NEXO e integraciones relacionadas.

No autoriza movimientos, ajustes, inventario inicial, migración, impresión, activación de efectos ni operación real.

---

#### 41. Criterios de aceptación

1. las quince subcapacidades tengan tratamiento explícito;
2. producto, existencia, presentación, lote, serial, LOC, posición, LPN y contenedor estén separados;
3. la jerarquía física y ciclo de LOC estén definidos;
4. el stock no ubicado tenga tratamiento temporal controlado;
5. LPN tenga identidad, contenido y movimiento sin doble contabilización;
6. cantidad física, reservada, disponible, tránsito y no utilizable estén separadas;
7. ledger y proyecciones tengan una relación única;
8. las mutaciones sean atómicas o idempotentes y reconciliables;
9. entradas, consumos, salidas y traslados tengan causa y referencia;
10. la reserva tenga propósito, expiración y liberación;
11. las remisiones distingan proceso y efecto de inventario;
12. conteo, diferencia, investigación y ajuste estén separados;
13. lote, vencimiento, FEFO, cuarentena, daño y pérdida tengan ciclo explícito;
14. frío tenga reglas, lecturas, excursiones y contingencia;
15. ORIGO, FOGO, PULSO, NUMERA y NEXO tengan fronteras explícitas;
16. los veinte hallazgos tengan destino;
17. no se creen preguntas narrativas nuevas;
18. se generen los tres requisitos de prueba;
19. el registro `04A` completo tenga 95 requisitos válidos;
20. ninguna fila del registro tenga más o menos de catorce columnas;
21. no se autorice implementación;
22. la continuidad quede en `CAP-SCOPE-007`.

---

#### 42. Resultado y continuidad

**Estado:** PROPUESTA PARA APROBACIÓN

Al aprobarse:

- `CAP-SCOPE-006` será la decisión canónica de cobertura para inventario, almacenamiento, lotes, vencimientos, LOC y LPN;
- `TREQ-NEXO-011`, `TREQ-NEXO-012` y `TREQ-INTEGRATION-011` quedarán incorporados al registro canónico;
- NEXO conservará la propiedad del estado físico y los demás dominios emitirán hechos correlacionados;
- ningún movimiento, ajuste, conteo, migración ni efecto real quedará autorizado;
- la continuidad será:

```text
CAP-SCOPE-007 — Evaluar activos, vajilla, decoración, herramientas, repuestos y mantenimiento
```


### ✅ CAP-SCOPE-007 — Evaluar activos, vajilla, decoración, herramientas, repuestos y mantenimiento

**Estado:** APROBADA  
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Dependencia cumplida:** `CAP-SCOPE-006` aprobada  
**Tarea anterior:** `CAP-SCOPE-006`  
**Siguiente tarea reservada:** `CAP-SCOPE-008`  
**Familia evaluada:** `CAP-07 — Gestionar activos, equipos y elementos reutilizables`  
**Naturaleza:** decisión de cobertura empresarial y definición conceptual objetivo  
**Implementación técnica:** no autorizada  
**Migraciones o cambios en Supabase:** no autorizados  
**Movimientos, préstamos, conteos, mantenimientos, reparaciones, bajas o disposiciones reales:** no autorizados  
**Requisitos de prueba generados:** `TREQ-NEXO-013`, `TREQ-NEXO-014`, `TREQ-NEXO-015`, `TREQ-INTEGRATION-012`  
**Actualización del registro de pruebas:** se entrega el archivo `04A` completo regenerado; quedan prohibidas las filas sueltas

---

#### 1. Propósito

Definir el tratamiento objetivo de las capacidades mediante las cuales Vento Group deberá:

- identificar activos individuales, modelos o tipos de activo y reutilizables controlados por cantidad;
- distinguir activo, inventario consumible, repuesto, herramienta, vajilla, decoración, kit, contenedor, LPN y vehículo;
- registrar ubicación, custodia, responsable operativo, usuario, propietario y centro de costo como dimensiones independientes;
- controlar entrega, préstamo, devolución, transferencia, tránsito y tenencia por terceros;
- contar activos individuales y familias por cantidad sin sobrescribir la observación original;
- registrar condición, disponibilidad, daño, pérdida, faltante, hallazgo y recuperación mediante eventos auditables;
- planear y ejecutar mantenimiento preventivo, correctivo, inspección, limpieza técnica y calibración;
- relacionar reparación con diagnóstico, mano de obra, proveedor, repuestos, costo, indisponibilidad y prueba de retorno al servicio;
- controlar garantías, seguros, documentos y reclamaciones sin asumir vigencia por la sola existencia de un archivo;
- gestionar baja, venta, descarte, reemplazo y disposición sin borrar identidad ni historia;
- representar kits y conjuntos con reglas de completitud;
- controlar vehículos y equipos de transporte, kilometraje, combustible, documentos y disponibilidad;
- integrar adquisición, mantenimiento, pérdida y baja con ORIGO y NUMERA sin duplicar fuentes de verdad;
- conservar evidencia suficiente para reconstruir quién tenía cada recurso, dónde estaba, en qué condición y por qué cambió.

La existencia actual de pantallas, tablas, fichas técnicas, conteos, movimientos o formularios de mantenimiento no permite considerar cerrada la familia `CAP-07`. La cobertura exige un ciclo de vida completo y coherente desde el alta hasta la disposición final.

---

#### 2. Pregunta de decisión

`CAP-SCOPE-007` responde:

```text
¿CÓMO DEBE VENTO GROUP IDENTIFICAR, UBICAR, CUSTODIAR, PRESTAR,
CONTAR, MANTENER, REPARAR, ASEGURAR Y RETIRAR SUS ACTIVOS,
REUTILIZABLES, VAJILLA, DECORACIÓN, HERRAMIENTAS, REPUESTOS,
KITS Y VEHÍCULOS, SIN CONFUNDIR EXISTENCIA FÍSICA, PROPIEDAD,
CUSTODIA, DISPONIBILIDAD, COSTO NI RESPONSABILIDAD?
```

La tarea rechaza equivalencias incorrectas como:

```text
TIPO DE ACTIVO = ACTIVO FÍSICO
```

```text
ACTIVO = PRODUCTO DE INVENTARIO
```

```text
REUTILIZABLE POR CANTIDAD = ACTIVO SERIALIZADO
```

```text
REPUESTO = ACTIVO INSTALADO
```

```text
UBICACIÓN = CUSTODIO = PROPIETARIO
```

```text
USUARIO DEL ACTIVO = RESPONSABLE CONTABLE
```

```text
QR = IDENTIDAD
```

```text
LPN = CONTENEDOR FÍSICO = KIT
```

```text
MOVIMIENTO DE UBICACIÓN = TRANSFERENCIA DE CUSTODIA
```

```text
CONTEO = AJUSTE = BAJA
```

```text
CONDICIÓN = DISPONIBILIDAD
```

```text
REGISTRO DE MANTENIMIENTO = ORDEN DE TRABAJO CERRADA
```

```text
PIEZAS REEMPLAZADAS EN TEXTO = CONSUMO TRAZABLE DE REPUESTOS
```

```text
DOCUMENTO ADJUNTO = GARANTÍA O SEGURO VIGENTE
```

```text
PÉRDIDA = REGISTRO ELIMINADO
```

```text
VEHÍCULO = CONDUCTOR
```

```text
COMPRA DE COMBUSTIBLE = CONSUMO DEL VEHÍCULO
```

---

#### 3. Fuentes consolidadas

- `OPS-ACT-001` — inventario AS-IS de activos y puntos externos de custodia;
- `OPS-AUD-001` a `OPS-AUD-015`;
- `CAP-MAP-001` a `CAP-MAP-015`;
- `CODE-AUD-001` a `CODE-AUD-020`;
- `CAP-SCOPE-001` a `CAP-SCOPE-006`;
- `QA-REG-001` y el Registro Canónico de Requisitos de Prueba;
- la implementación vigente de NEXO para catálogo de tipos de activo, activos individuales, grupos por cantidad, ubicación, movimientos, documentos, conteos y mantenimiento;
- la evidencia de formularios y acciones actuales para identidad, localización, préstamo, devolución, salida a mantenimiento y registros de trabajo;
- la evidencia de que garantías se representan parcialmente como documentos y no como ciclo contractual;
- la evidencia de que repuestos reemplazados pueden conservarse como texto sin consumo físico correlacionado;
- las tareas `NEXO-DOM-001` a `NEXO-DOM-028`, `NEXO-AUTH-021` a `NEXO-AUTH-030` y `NEXO-UX-026` a `NEXO-UX-042`;
- las decisiones aprobadas de inventario, LPN, compras, costos, autorización, documentos, evidencia y continuidad.

Las respuestas y evidencias ya registradas no se vuelven a solicitar.

---

#### 4. Alcance evaluado

- `CAP-07.01` — Identificar y clasificar activos;
- `CAP-07.02` — Registrar ubicación y custodia;
- `CAP-07.03` — Entregar, prestar y devolver;
- `CAP-07.04` — Transferir custodia;
- `CAP-07.05` — Contar activos y reutilizables;
- `CAP-07.06` — Registrar condición, daño, pérdida y faltante;
- `CAP-07.07` — Planear y ejecutar mantenimiento;
- `CAP-07.08` — Gestionar reparación y repuestos;
- `CAP-07.09` — Controlar garantías y seguros;
- `CAP-07.10` — Gestionar baja, venta, descarte o reemplazo;
- `CAP-07.11` — Gestionar kits y conjuntos;
- `CAP-07.12` — Gestionar vehículos y equipos de transporte;
- `CAP-07.13` — Controlar combustible, kilometraje y disponibilidad.

También fija fronteras con catálogo, inventario, compras, logística, instalaciones, SST, documentos, costos, contabilidad, seguros, continuidad y analítica.

---

#### 5. Fuera de alcance

- realizar inventario físico, conteos, préstamos, transferencias o reasignaciones reales;
- mover, reparar, dar de baja, vender, descartar o reemplazar activos;
- declarar propiedad, valor contable, depreciación, cobertura o aseguramiento sin soporte profesional;
- contratar mantenimientos, repuestos, pólizas o servicios;
- definir todavía tasas de depreciación, vida útil contable o tratamiento tributario;
- crear códigos, placas o etiquetas reales;
- migrar activos, documentos, mantenimientos o movimientos históricos;
- crear tablas, vistas, RPC, triggers, buckets, políticas RLS o migraciones;
- diseñar rutas y entregas logísticas, que continuarán en `CAP-SCOPE-011`;
- diseñar mantenimiento de instalaciones como proceso completo, que continuará en `CAP-SCOPE-013`;
- sustituir inspecciones SST, metrología, revisión técnico-mecánica o validación profesional;
- convertir documentos sensibles de vehículos, seguros, facturas o seriales en información pública;
- autorizar uso operativo de un activo únicamente porque aparece como activo en el sistema.

---

#### 6. Principios canónicos

##### 6.1. NEXO será propietario del estado físico del activo

NEXO conservará identidad física, ubicación, custodia, condición, disponibilidad, movimientos, conteos, mantenimiento y disposición operacional.

ORIGO será propietario de la compra o contratación externa; NUMERA será propietario del tratamiento económico y contable que posteriormente se apruebe.

##### 6.2. El modelo o tipo no es el activo físico

Un tipo describe características comunes. Un activo individual representa una unidad física identificable.

Una cafetera de un modelo determinado podrá tener varios activos físicos con serial, estado, ubicación y mantenimiento independientes.

##### 6.3. El control individual y el control por cantidad son distintos

Se utilizará activo individual cuando la unidad requiera serial, placa, QR, mantenimiento, garantía, valor o historia propia.

Se utilizará grupo reutilizable por cantidad cuando varias unidades equivalentes se controlen sin identidad individual razonable, como parte de vajilla, cubiertos, bandejas o decoración repetida.

##### 6.4. Consumible, repuesto, herramienta y activo no son equivalentes

Un consumible se agota por uso. Un repuesto permanece como stock hasta ser consumido o instalado. Una herramienta puede ser activo individual o reutilizable por cantidad según criticidad. Un componente instalado podrá adquirir identidad propia solo cuando lo exija su trazabilidad.

##### 6.5. Propiedad, custodia, ubicación, uso y costo son dimensiones independientes

La presencia de un recurso en una sede no demuestra propiedad. El custodio no necesariamente es quien lo usa. El usuario no necesariamente responde contablemente. El centro de costo no determina la ubicación.

##### 6.6. La identidad será estable y no dependerá del QR

El identificador canónico será inmutable. Códigos visibles, placas, seriales, alias y etiquetas podrán cambiar o reemitirse conservando historial.

Una etiqueta dañada no crea un activo nuevo.

##### 6.7. El ciclo de vida será no destructivo

Alta, activación, préstamo, tránsito, mantenimiento, pérdida, hallazgo, retiro, venta y disposición serán estados o eventos. Ninguno borrará el expediente ni reutilizará su identificador.

##### 6.8. Los movimientos conservarán hecho y responsabilidad

Todo movimiento registrará tipo, origen, destino, custodio anterior, custodio nuevo, actor, fecha efectiva, causa, evidencia y aceptación cuando corresponda.

##### 6.9. La entrega y el préstamo no son simples cambios de ubicación

Deberán conservar receptor, propósito, plazo, condición de salida, fecha prevista, condiciones de devolución y estado de cierre.

##### 6.10. La transferencia de custodia requiere aceptación

Una transferencia podrá quedar pendiente hasta que el receptor confirme. La ubicación física podrá cambiar antes o después, pero no se inferirá custodia por proximidad.

##### 6.11. El conteo es una observación

La captura conservará quién contó, alcance, ubicación, fecha, cantidad o identidad observada y evidencia. Las diferencias se investigarán antes de corregir el registro.

##### 6.12. Condición y disponibilidad serán separadas

Un activo puede estar en condición aceptable pero reservado, prestado o no disponible. También puede estar disponible físicamente pero bloqueado por seguridad, garantía o mantenimiento vencido.

##### 6.13. El mantenimiento tendrá plan, orden y ejecución

Se distinguirán plan de mantenimiento, disparador, orden de trabajo, ejecución, resultado, prueba de retorno al servicio y próxima obligación.

##### 6.14. La reparación consumirá repuestos trazables

Los repuestos deberán reservarse y consumirse desde inventario mediante referencia al activo y a la orden. El texto libre podrá describir trabajo, pero no reemplazará el movimiento de stock.

##### 6.15. Garantía y seguro tendrán vigencia y reclamación

Se conservarán proveedor o asegurador, cobertura, inicio, fin, condiciones, exclusiones, documentos, reclamaciones y resultado. La existencia de un PDF no demuestra cobertura vigente.

##### 6.16. La baja y disposición requerirán segregación

Solicitar, evaluar, autorizar, ejecutar disposición y registrar efecto económico serán pasos diferentes. Quien custodia no aprobará automáticamente la baja.

##### 6.17. Los kits tendrán definición e instancia

La definición indicará componentes y reglas de completitud. La instancia representará un conjunto real. Un kit podrá transportarse en un LPN, pero no será el mismo concepto.

##### 6.18. El vehículo será activo especializado

Vehículo, conductor, custodio, ruta, viaje, documento, mantenimiento y disponibilidad serán entidades o relaciones distintas.

##### 6.19. El kilometraje será monotónico con correcciones auditables

Una lectura menor no sobrescribirá la anterior. Generará corrección, justificación o cambio de odómetro documentado.

##### 6.20. Combustible comprado y combustible consumido no serán equivalentes

La compra tendrá documento y costo; la carga tendrá vehículo, cantidad, lectura, estación y actor; el rendimiento será derivado y sujeto a calidad de datos.

##### 6.21. Los activos externos y en poder de terceros seguirán dentro del control

La ausencia de una sede formal no elimina la obligación de registrar punto externo, tercero, evidencia, fecha prevista de retorno y responsable interno.

##### 6.22. La información financiera será consumida, no duplicada

NEXO emitirá hechos de adquisición, mantenimiento, pérdida y baja. NUMERA determinará su tratamiento económico cuando `CAP-SCOPE-012` lo apruebe.

---

#### 7. Modelo conceptual objetivo

| Concepto                  | Definición                             | No equivale a                    |
| ------------------------- | -------------------------------------- | -------------------------------- |
| tipo o modelo de activo   | plantilla de características comunes   | unidad física                    |
| activo individual         | unidad física con identidad propia     | producto, stock o tipo           |
| grupo reutilizable        | familia controlada por cantidad        | activo serializado               |
| componente o repuesto     | existencia destinada a reparación      | activo instalado automáticamente |
| kit definido              | composición y reglas                   | kit físico                       |
| instancia de kit          | conjunto real y verificable            | LPN                              |
| vehículo                  | activo especializado de transporte     | conductor o viaje                |
| ubicación                 | lugar físico actual                    | custodio o propietario           |
| custodia                  | responsabilidad de tenencia            | uso, propiedad o costo           |
| asignación de uso         | persona o proceso autorizado a usar    | custodia permanente              |
| condición                 | estado físico observado                | disponibilidad                   |
| disponibilidad            | capacidad de ser utilizado             | condición física                 |
| mantenimiento planificado | obligación futura                      | ejecución realizada              |
| orden de trabajo          | expediente de intervención             | evento terminado                 |
| evento de mantenimiento   | trabajo ejecutado y resultado          | plan                             |
| garantía                  | derecho contractual frente a proveedor | seguro                           |
| seguro                    | cobertura frente a riesgos             | garantía                         |
| baja                      | decisión de retirar del servicio       | eliminación del registro         |
| disposición               | destino físico final                   | baja aprobada                    |
| lectura de kilometraje    | observación de medidor                 | viaje o consumo                  |
| carga de combustible      | entrega física al vehículo             | factura de compra                |

---

#### 8. Estados canónicos mínimos

##### 8.1. Estado de registro

```text
BORRADOR
PENDIENTE_VALIDACION
ACTIVO
INACTIVO
RETIRADO
ARCHIVADO
```

##### 8.2. Disponibilidad operacional

```text
DISPONIBLE
ASIGNADO
PRESTADO
EN_TRANSITO
EN_MANTENIMIENTO
BLOQUEADO
NO_DISPONIBLE
NO_LOCALIZADO
```

##### 8.3. Condición

```text
NUEVO
BUENO
REGULAR
DEGRADADO
DAÑADO
INOPERATIVO
PENDIENTE_EVALUACION
```

##### 8.4. Custodia

```text
SIN_ASIGNAR
PENDIENTE_ACEPTACION
ACEPTADA
EN_TRANSFERENCIA
EN_TERCERO
DISPUTADA
CERRADA
```

##### 8.5. Mantenimiento

```text
PLANIFICADO
PROGRAMADO
EN_DIAGNOSTICO
EN_EJECUCION
PENDIENTE_REPUESTO
PENDIENTE_PRUEBA
COMPLETADO
CANCELADO
```

##### 8.6. Garantía o reclamación

```text
VIGENTE
POR_VENCER
VENCIDA
RECLAMACION_ABIERTA
EN_EVALUACION
APROBADA
RECHAZADA
CERRADA
```

##### 8.7. Baja y disposición

```text
PROPUESTA
EN_EVALUACION
APROBADA
RECHAZADA
PENDIENTE_DISPOSICION
DISPUESTA
VENDIDA
REEMPLAZADA
CANCELADA
```

---

#### 9. Propiedad funcional y tecnológica

| Dominio                                   | Propiedad                                                                                        |
| ----------------------------------------- | ------------------------------------------------------------------------------------------------ |
| Jefatura de Operaciones                   | gobierno operativo del inventario patrimonial y prioridad de levantamiento                       |
| responsable de sede o área                | validación de ubicación, uso, condición y custodia observada                                     |
| custodio                                  | tenencia y devolución; no propiedad ni aprobación de baja                                        |
| responsable de mantenimiento              | plan, diagnóstico, ejecución, prueba y liberación técnica                                        |
| NEXO                                      | expediente físico, movimientos, conteos, mantenimiento y flota                                   |
| ORIGO                                     | compra de activos, repuestos, mantenimiento externo, garantías de proveedor y contratos          |
| NUMERA                                    | costo, gasto, activo contable, depreciación, pérdida, venta y baja económica cuando sea aprobado |
| VISO                                      | supervisión administrativa y enlaces; no fuente del activo                                       |
| SHELL / Supabase                          | contratos, integridad, autorización, evidencia técnica y migraciones                             |
| asesoría contable, jurídica o aseguradora | validaciones profesionales y externas                                                            |

---

#### 10. Línea base de implementación verificable

La implementación actual permite afirmar que:

- existe una superficie de inventario de activos en NEXO;
- existen tipos o modelos, activos individuales y grupos repetidos controlados por cantidad;
- existen campos para código, placa, serial, marca, modelo, ubicación y condición;
- existen movimientos de activo y etiquetas de préstamo, devolución y salida a mantenimiento;
- existen sesiones y líneas de conteo de activos;
- existen documentos como ficha técnica, manual, factura y garantía;
- existen registros parciales de mantenimiento, próxima fecha, trabajo ejecutado y piezas reemplazadas;
- existe separación conceptual inicial entre catálogo y activo físico;
- no existe evidencia suficiente de un ciclo integral de seguros, reclamaciones, baja, venta, disposición, kits, flota, kilometraje y combustible;
- la integración física y económica de repuestos, mantenimiento, adquisición y baja todavía no está cerrada.

La clasificación `REUSE_OR_REFACTOR` no declara estas capacidades terminadas; reconoce infraestructura útil que deberá someterse al modelo objetivo.

---

#### 11. Matriz de decisión de cobertura

| Capacidad                                                         | Tratamiento         | Propietario objetivo    | Decisión                                                                                                                                                                                    |
| ----------------------------------------------------------------- | ------------------- | ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `CAP-07.01` — Identificar y clasificar activos                    | `REUSE_OR_REFACTOR` | NEXO                    | Conservar el catálogo y las superficies actuales, pero separar tipo o modelo, activo individual, reutilizable por cantidad, repuesto, kit, vehículo y consumible mediante reglas canónicas. |
| `CAP-07.02` — Registrar ubicación y custodia                      | `REUSE_OR_REFACTOR` | NEXO                    | Reutilizar ubicación y movimientos existentes, incorporando custodia, responsable operativo, tercero, sede, LOC y vigencias sin inferir propiedad.                                          |
| `CAP-07.03` — Entregar, prestar y devolver                        | `REUSE_OR_REFACTOR` | NEXO                    | Formalizar entrega, préstamo y devolución como expedientes con actor, receptor, vencimiento, condición, evidencia y cierre; no como simple cambio de ubicación.                             |
| `CAP-07.04` — Transferir custodia                                 | `REUSE_OR_REFACTOR` | NEXO                    | Convertir las transferencias actuales en eventos de custodia aceptados, rechazados o pendientes, conservando origen, destino, condición y responsabilidad.                                  |
| `CAP-07.05` — Contar activos y reutilizables                      | `REUSE_OR_REFACTOR` | NEXO                    | Conservar sesiones y líneas de conteo, separando observación, diferencia, investigación, decisión y corrección, tanto para activos individuales como grupos por cantidad.                   |
| `CAP-07.06` — Registrar condición, daño, pérdida y faltante       | `REUSE_OR_REFACTOR` | NEXO                    | Normalizar condición y disponibilidad, crear casos auditables de daño, pérdida y hallazgo, y prohibir que un cambio de texto sobrescriba el historial.                                      |
| `CAP-07.07` — Planear y ejecutar mantenimiento                    | `REUSE_OR_REFACTOR` | NEXO                    | Evolucionar los registros actuales hacia planes, órdenes, ejecución, evidencia, prueba de retorno al servicio y próxima fecha o medidor.                                                    |
| `CAP-07.08` — Gestionar reparación y repuestos                    | `REUSE_OR_REFACTOR` | NEXO + ORIGO            | Conectar reparación con diagnóstico, proveedor, repuestos reservados y consumidos, costo, indisponibilidad y resultado, sin registrar piezas únicamente como texto libre.                   |
| `CAP-07.09` — Controlar garantías y seguros                       | `BUILD`             | NEXO + fuentes externas | Construir vigencias, coberturas, exclusiones, reclamaciones, documentos, alertas y decisiones; un archivo adjunto no equivale a garantía o seguro vigente.                                  |
| `CAP-07.10` — Gestionar baja, venta, descarte o reemplazo         | `BUILD`             | NEXO + NUMERA           | Construir solicitud, evaluación, autorización, disposición física, evento económico y cierre no destructivo, conservando identidad e historia.                                              |
| `CAP-07.11` — Gestionar kits y conjuntos                          | `BUILD`             | NEXO                    | Construir definición de kit, instancia, componentes obligatorios u opcionales, completitud, préstamo, devolución y sustitución sin fusionar kit con LPN.                                    |
| `CAP-07.12` — Gestionar vehículos y equipos de transporte         | `BUILD`             | NEXO                    | Construir expediente de vehículo o equipo, documentos, custodios, disponibilidad, inspección, mantenimiento e integración con logística, sin convertir conductor en propietario.            |
| `CAP-07.13` — Controlar combustible, kilometraje y disponibilidad | `BUILD`             | NEXO + ORIGO + NUMERA   | Construir lecturas monotónicas, correcciones auditables, cargas de combustible, rendimiento, indisponibilidad y conciliación de compras y uso.                                              |

Resumen:

| Tratamiento         | Cantidad |
| ------------------- | -------: |
| `REUSE_OR_REFACTOR` |        8 |
| `BUILD`             |        5 |
| **Total**           |   **13** |

---

#### 12. CAP-07.01 — Identificar y clasificar activos

**Tratamiento:** `REUSE_OR_REFACTOR`  
**Propietario objetivo:** NEXO

##### Línea base

Existe infraestructura parcial reutilizable, pero no un ciclo empresarial completamente validado.

##### Decisión objetivo

Conservar el catálogo y las superficies actuales, pero separar tipo o modelo, activo individual, reutilizable por cantidad, repuesto, kit, vehículo y consumible mediante reglas canónicas.

##### Reglas mínimas

- conservar identificadores estables y vigencias;
- impedir actualizaciones destructivas de historia;
- registrar actor real, contexto, causa y evidencia;
- aplicar permisos atómicos y segregación de funciones;
- resolver concurrencia, reintentos y correcciones mediante eventos trazables;
- no inferir propiedad, custodia, disponibilidad o costo desde nombres o ubicación.

##### Destino canónico

`NEXO-DOM-001`; `NEXO-UX-030`; `SUPA-AUD-019`; `SUPA-AUD-022`.

---

#### 13. CAP-07.02 — Registrar ubicación y custodia

**Tratamiento:** `REUSE_OR_REFACTOR`  
**Propietario objetivo:** NEXO

##### Línea base

Existe infraestructura parcial reutilizable, pero no un ciclo empresarial completamente validado.

##### Decisión objetivo

Reutilizar ubicación y movimientos existentes, incorporando custodia, responsable operativo, tercero, sede, LOC y vigencias sin inferir propiedad.

##### Reglas mínimas

- conservar identificadores estables y vigencias;
- impedir actualizaciones destructivas de historia;
- registrar actor real, contexto, causa y evidencia;
- aplicar permisos atómicos y segregación de funciones;
- resolver concurrencia, reintentos y correcciones mediante eventos trazables;
- no inferir propiedad, custodia, disponibilidad o costo desde nombres o ubicación.

##### Destino canónico

`NEXO-DOM-007`; `NEXO-DOM-008`; `NEXO-UX-031`; `NEXO-AUTH-025`.

---

#### 14. CAP-07.03 — Entregar, prestar y devolver

**Tratamiento:** `REUSE_OR_REFACTOR`  
**Propietario objetivo:** NEXO

##### Línea base

Existe infraestructura parcial reutilizable, pero no un ciclo empresarial completamente validado.

##### Decisión objetivo

Formalizar entrega, préstamo y devolución como expedientes con actor, receptor, vencimiento, condición, evidencia y cierre; no como simple cambio de ubicación.

##### Reglas mínimas

- conservar identificadores estables y vigencias;
- impedir actualizaciones destructivas de historia;
- registrar actor real, contexto, causa y evidencia;
- aplicar permisos atómicos y segregación de funciones;
- resolver concurrencia, reintentos y correcciones mediante eventos trazables;
- no inferir propiedad, custodia, disponibilidad o costo desde nombres o ubicación.

##### Destino canónico

`NEXO-DOM-011`; `NEXO-UX-031`; `NEXO-AUTH-025`; `PROC-CAT-009` a `PROC-CAT-018`.

---

#### 15. CAP-07.04 — Transferir custodia

**Tratamiento:** `REUSE_OR_REFACTOR`  
**Propietario objetivo:** NEXO

##### Línea base

Existe infraestructura parcial reutilizable, pero no un ciclo empresarial completamente validado.

##### Decisión objetivo

Convertir las transferencias actuales en eventos de custodia aceptados, rechazados o pendientes, conservando origen, destino, condición y responsabilidad.

##### Reglas mínimas

- conservar identificadores estables y vigencias;
- impedir actualizaciones destructivas de historia;
- registrar actor real, contexto, causa y evidencia;
- aplicar permisos atómicos y segregación de funciones;
- resolver concurrencia, reintentos y correcciones mediante eventos trazables;
- no inferir propiedad, custodia, disponibilidad o costo desde nombres o ubicación.

##### Destino canónico

`NEXO-DOM-008`; `NEXO-DOM-011`; `NEXO-UX-031`; `NEXO-AUTH-025`.

---

#### 16. CAP-07.05 — Contar activos y reutilizables

**Tratamiento:** `REUSE_OR_REFACTOR`  
**Propietario objetivo:** NEXO

##### Línea base

Existe infraestructura parcial reutilizable, pero no un ciclo empresarial completamente validado.

##### Decisión objetivo

Conservar sesiones y líneas de conteo, separando observación, diferencia, investigación, decisión y corrección, tanto para activos individuales como grupos por cantidad.

##### Reglas mínimas

- conservar identificadores estables y vigencias;
- impedir actualizaciones destructivas de historia;
- registrar actor real, contexto, causa y evidencia;
- aplicar permisos atómicos y segregación de funciones;
- resolver concurrencia, reintentos y correcciones mediante eventos trazables;
- no inferir propiedad, custodia, disponibilidad o costo desde nombres o ubicación.

##### Destino canónico

`NEXO-DOM-015`; `NEXO-UX-034`; `NEXO-AUTH-027`; `PROC-CAT-009` a `PROC-CAT-018`.

---

#### 17. CAP-07.06 — Registrar condición, daño, pérdida y faltante

**Tratamiento:** `REUSE_OR_REFACTOR`  
**Propietario objetivo:** NEXO

##### Línea base

Existe infraestructura parcial reutilizable, pero no un ciclo empresarial completamente validado.

##### Decisión objetivo

Normalizar condición y disponibilidad, crear casos auditables de daño, pérdida y hallazgo, y prohibir que un cambio de texto sobrescriba el historial.

##### Reglas mínimas

- conservar identificadores estables y vigencias;
- impedir actualizaciones destructivas de historia;
- registrar actor real, contexto, causa y evidencia;
- aplicar permisos atómicos y segregación de funciones;
- resolver concurrencia, reintentos y correcciones mediante eventos trazables;
- no inferir propiedad, custodia, disponibilidad o costo desde nombres o ubicación.

##### Destino canónico

`NEXO-DOM-010`; `NEXO-DOM-017`; `NEXO-UX-032`; `NEXO-AUTH-026`.

---

#### 18. CAP-07.07 — Planear y ejecutar mantenimiento

**Tratamiento:** `REUSE_OR_REFACTOR`  
**Propietario objetivo:** NEXO

##### Línea base

Existe infraestructura parcial reutilizable, pero no un ciclo empresarial completamente validado.

##### Decisión objetivo

Evolucionar los registros actuales hacia planes, órdenes, ejecución, evidencia, prueba de retorno al servicio y próxima fecha o medidor.

##### Reglas mínimas

- conservar identificadores estables y vigencias;
- impedir actualizaciones destructivas de historia;
- registrar actor real, contexto, causa y evidencia;
- aplicar permisos atómicos y segregación de funciones;
- resolver concurrencia, reintentos y correcciones mediante eventos trazables;
- no inferir propiedad, custodia, disponibilidad o costo desde nombres o ubicación.

##### Destino canónico

`NEXO-DOM-012`; `NEXO-DOM-026`; `NEXO-UX-032`; `CAP-SCOPE-013`.

---

#### 19. CAP-07.08 — Gestionar reparación y repuestos

**Tratamiento:** `REUSE_OR_REFACTOR`  
**Propietario objetivo:** NEXO + ORIGO

##### Línea base

Existe infraestructura parcial reutilizable, pero no un ciclo empresarial completamente validado.

##### Decisión objetivo

Conectar reparación con diagnóstico, proveedor, repuestos reservados y consumidos, costo, indisponibilidad y resultado, sin registrar piezas únicamente como texto libre.

##### Reglas mínimas

- conservar identificadores estables y vigencias;
- impedir actualizaciones destructivas de historia;
- registrar actor real, contexto, causa y evidencia;
- aplicar permisos atómicos y segregación de funciones;
- resolver concurrencia, reintentos y correcciones mediante eventos trazables;
- no inferir propiedad, custodia, disponibilidad o costo desde nombres o ubicación.

##### Destino canónico

`NEXO-DOM-016`; `NEXO-DOM-025`; `NEXO-DOM-026`; `ORIGO-UX-015`; `CAP-SCOPE-012`.

---

#### 20. CAP-07.09 — Controlar garantías y seguros

**Tratamiento:** `BUILD`  
**Propietario objetivo:** NEXO + fuentes externas

##### Línea base

No existe evidencia de una capacidad integral y gobernada que pueda declararse operativa.

##### Decisión objetivo

Construir vigencias, coberturas, exclusiones, reclamaciones, documentos, alertas y decisiones; un archivo adjunto no equivale a garantía o seguro vigente.

##### Reglas mínimas

- conservar identificadores estables y vigencias;
- impedir actualizaciones destructivas de historia;
- registrar actor real, contexto, causa y evidencia;
- aplicar permisos atómicos y segregación de funciones;
- resolver concurrencia, reintentos y correcciones mediante eventos trazables;
- no inferir propiedad, custodia, disponibilidad o costo desde nombres o ubicación.

##### Destino canónico

`NEXO-DOM-017`; `NEXO-DOM-026`; `CAP-SCOPE-016`; `CAP-SCOPE-018`.

---

#### 21. CAP-07.10 — Gestionar baja, venta, descarte o reemplazo

**Tratamiento:** `BUILD`  
**Propietario objetivo:** NEXO + NUMERA

##### Línea base

No existe evidencia de una capacidad integral y gobernada que pueda declararse operativa.

##### Decisión objetivo

Construir solicitud, evaluación, autorización, disposición física, evento económico y cierre no destructivo, conservando identidad e historia.

##### Reglas mínimas

- conservar identificadores estables y vigencias;
- impedir actualizaciones destructivas de historia;
- registrar actor real, contexto, causa y evidencia;
- aplicar permisos atómicos y segregación de funciones;
- resolver concurrencia, reintentos y correcciones mediante eventos trazables;
- no inferir propiedad, custodia, disponibilidad o costo desde nombres o ubicación.

##### Destino canónico

`NEXO-DOM-013`; `NEXO-DOM-028`; `CAP-SCOPE-012`; `PROC-CAT-009` a `PROC-CAT-018`.

---

#### 22. CAP-07.11 — Gestionar kits y conjuntos

**Tratamiento:** `BUILD`  
**Propietario objetivo:** NEXO

##### Línea base

No existe evidencia de una capacidad integral y gobernada que pueda declararse operativa.

##### Decisión objetivo

Construir definición de kit, instancia, componentes obligatorios u opcionales, completitud, préstamo, devolución y sustitución sin fusionar kit con LPN.

##### Reglas mínimas

- conservar identificadores estables y vigencias;
- impedir actualizaciones destructivas de historia;
- registrar actor real, contexto, causa y evidencia;
- aplicar permisos atómicos y segregación de funciones;
- resolver concurrencia, reintentos y correcciones mediante eventos trazables;
- no inferir propiedad, custodia, disponibilidad o costo desde nombres o ubicación.

##### Destino canónico

`NEXO-DOM-014`; `NEXO-UX-033`; `NEXO-AUTH-024`; `NEXO-AUTH-025`.

---

#### 23. CAP-07.12 — Gestionar vehículos y equipos de transporte

**Tratamiento:** `BUILD`  
**Propietario objetivo:** NEXO

##### Línea base

No existe evidencia de una capacidad integral y gobernada que pueda declararse operativa.

##### Decisión objetivo

Construir expediente de vehículo o equipo, documentos, custodios, disponibilidad, inspección, mantenimiento e integración con logística, sin convertir conductor en propietario.

##### Reglas mínimas

- conservar identificadores estables y vigencias;
- impedir actualizaciones destructivas de historia;
- registrar actor real, contexto, causa y evidencia;
- aplicar permisos atómicos y segregación de funciones;
- resolver concurrencia, reintentos y correcciones mediante eventos trazables;
- no inferir propiedad, custodia, disponibilidad o costo desde nombres o ubicación.

##### Destino canónico

`NEXO-DOM-027`; `CAP-SCOPE-011`; `CAP-SCOPE-013`; `CAP-SCOPE-016`.

---

#### 24. CAP-07.13 — Controlar combustible, kilometraje y disponibilidad

**Tratamiento:** `BUILD`  
**Propietario objetivo:** NEXO + ORIGO + NUMERA

##### Línea base

No existe evidencia de una capacidad integral y gobernada que pueda declararse operativa.

##### Decisión objetivo

Construir lecturas monotónicas, correcciones auditables, cargas de combustible, rendimiento, indisponibilidad y conciliación de compras y uso.

##### Reglas mínimas

- conservar identificadores estables y vigencias;
- impedir actualizaciones destructivas de historia;
- registrar actor real, contexto, causa y evidencia;
- aplicar permisos atómicos y segregación de funciones;
- resolver concurrencia, reintentos y correcciones mediante eventos trazables;
- no inferir propiedad, custodia, disponibilidad o costo desde nombres o ubicación.

##### Destino canónico

`NEXO-DOM-027`; `NEXO-DOM-028`; `CAP-SCOPE-011`; `CAP-SCOPE-012`.

---

#### 25. Fronteras con otros dominios

| Dominio                | Frontera                                                                                           |
| ---------------------- | -------------------------------------------------------------------------------------------------- |
| `CAP-04` catálogo      | define producto, repuesto y tipo; no la existencia patrimonial individual                          |
| `CAP-05` compras       | origina adquisición o servicio; no determina custodia ni disponibilidad                            |
| `CAP-06` inventario    | controla repuestos y consumibles antes de instalación; no sustituye expediente del activo          |
| `CAP-11` logística     | gestiona rutas, viajes y entregas; consume disponibilidad de vehículos                             |
| `CAP-12` finanzas      | determina costo, gasto, depreciación y efecto económico                                            |
| `CAP-13` instalaciones | gestiona mantenimiento de inmuebles e infraestructura; puede compartir órdenes y proveedores       |
| `CAP-15` tecnología    | administra dispositivos tecnológicos como servicio, pero su identidad física puede residir en NEXO |
| `CAP-16` documentos    | conserva facturas, manuales, pólizas y evidencia con privacidad y retención                        |
| `CAP-18` continuidad   | utiliza criticidad, repuestos y disponibilidad para contingencias                                  |
| LPN                    | identifica contenido logístico; no sustituye activo, kit, contenedor físico ni custodia            |

---

#### 26. Información conceptual requerida

##### 26.1. Tipo o modelo

- identificador estable;
- familia;
- fabricante, marca y modelo;
- características técnicas;
- unidad de control;
- política de identificación individual o por cantidad;
- criticidad y requisitos de mantenimiento.

##### 26.2. Activo individual

- código interno;
- serial, placa u otro identificador;
- tipo o modelo;
- estado de registro;
- condición y disponibilidad;
- ubicación física;
- custodio y usuario;
- propietario declarado con nivel de evidencia;
- fecha y fuente de adquisición;
- documentos;
- garantía y seguro;
- medidores aplicables;
- historial completo.

##### 26.3. Grupo reutilizable

- familia;
- unidad de conteo;
- sede o punto;
- cantidad registrada;
- cantidad observada;
- condición agregada cuando sea útil;
- responsable;
- reglas de préstamo y conteo;
- criterio para individualizar una unidad.

##### 26.4. Mantenimiento

- plan y versión;
- disparador por fecha, uso, ciclos, kilometraje o condición;
- orden de trabajo;
- diagnóstico;
- tareas;
- técnico o proveedor;
- salida y retorno;
- repuestos;
- costo informado;
- evidencia;
- prueba y liberación;
- próxima obligación.

##### 26.5. Vehículo

- placa e identidad;
- tipo, marca, modelo y año;
- propietario y custodio;
- documentos y vigencias;
- kilometraje;
- capacidad y restricciones;
- estado de disponibilidad;
- mantenimiento e inspecciones;
- cargas de combustible;
- incidentes y bloqueos;
- relación con viajes sin duplicar el dominio logístico.

---

#### 27. Eventos e integraciones requeridos

Eventos mínimos:

```text
asset_registered
asset_identity_corrected
asset_location_changed
asset_custody_offered
asset_custody_accepted
asset_loaned
asset_returned
asset_transfer_started
asset_transfer_completed
asset_count_observed
asset_difference_found
asset_condition_reported
asset_damaged
asset_lost
asset_found
maintenance_due
maintenance_work_order_opened
maintenance_started
spare_part_reserved
spare_part_consumed
maintenance_completed
asset_released_to_service
warranty_claim_opened
insurance_claim_opened
asset_retirement_requested
asset_retirement_approved
asset_disposed
vehicle_odometer_read
vehicle_fuel_loaded
vehicle_availability_changed
```

Cada evento conservará identificador estable, versión, actor, fecha efectiva, origen, recurso, causa, estado y evidencia. Los consumidores deberán ser idempotentes.

---

#### 28. Autorización y segregación

Deberán separarse, como mínimo:

- consultar activos;
- crear tipo o modelo;
- registrar activo individual;
- actualizar identificación sensible;
- registrar ubicación;
- asignar o aceptar custodia;
- prestar y devolver;
- iniciar y aprobar transferencia;
- capturar conteo;
- investigar diferencia;
- aprobar corrección;
- reportar daño o pérdida;
- cambiar disponibilidad;
- crear plan de mantenimiento;
- abrir, ejecutar y cerrar orden;
- consumir repuestos;
- registrar garantía o seguro;
- abrir reclamación;
- proponer y aprobar baja;
- ejecutar disposición;
- registrar kilometraje y combustible;
- imprimir o reimprimir etiqueta.

La administración no dependerá de check-in cuando la matriz aprobada no lo exija. Las acciones físicas de sede o área deberán validar contexto operativo cuando corresponda.

---

#### 29. Experiencia por actor

##### Operaciones

- búsqueda por código, QR, serial, familia, ubicación o custodio;
- alertas de activos no localizados, vencimientos y mantenimiento;
- vista de disponibilidad y criticidad;
- conciliación de conteos y movimientos.

##### Custodio o trabajador

- confirmar recepción;
- consultar activos asignados;
- reportar daño, pérdida o devolución;
- ver instrucciones esenciales sin exponer datos financieros.

##### Mantenimiento

- bandeja de órdenes;
- diagnóstico, tareas y repuestos;
- evidencia antes y después;
- prueba de retorno;
- operación móvil o tablet cuando sea necesario.

##### Contabilidad o Gerencia

- soportes de adquisición;
- costo y estado de baja;
- garantías, seguros y reclamaciones;
- reportes sin alterar el estado físico.

##### Logística

- vehículos disponibles;
- restricciones y documentos vigentes;
- kilometraje y combustible;
- bloqueo por mantenimiento o seguridad.

---

#### 30. Operación offline y contingencia

- un escaneo offline no creará identidades duplicadas;
- los movimientos pendientes conservarán clave de idempotencia;
- la aceptación de custodia requerirá sincronización y autorización vigentes;
- un conteo offline preservará líneas y marca temporal;
- un mantenimiento no se cerrará únicamente en memoria local;
- la imposibilidad de imprimir no impedirá identificar el activo mediante código alternativo;
- la pérdida de red no permitirá aprobar baja, venta o disposición sin control;
- kilometraje y combustible pendientes deberán detectar duplicados al sincronizar.

---

#### 31. Evidencia, conservación y auditoría

Se conservarán:

- identidad anterior y nueva;
- ubicación y custodia anteriores y nuevas;
- actor real y actor operativo;
- fecha de captura y fecha efectiva;
- razón estructurada;
- documentos y hash cuando aplique;
- fotos con contexto, no como única prueba;
- conteos originales;
- aprobaciones y rechazos;
- mantenimiento, diagnóstico, repuestos y prueba;
- reclamaciones de garantía o seguro;
- baja y disposición;
- lecturas de kilometraje y combustible;
- relación con compra, costo y documento financiero.

Seriales, placas, facturas, pólizas y documentos sensibles tendrán acceso restringido y conservación definida en `CAP-SCOPE-016`.

---

#### 32. Patrones legacy destinados a retiro

- usar producto del catálogo como si fuera la unidad física;
- crear un activo nuevo por cada reimpresión de QR;
- registrar grupos repetidos como activos individuales ficticios;
- usar cantidad de stock para representar vajilla o decoración sin modelo de reutilizable;
- cambiar ubicación para simular préstamo o custodia;
- sobrescribir condición, serial o custodio sin evento;
- eliminar un activo perdido o dado de baja;
- cerrar conteos alterando directamente la cantidad registrada;
- registrar piezas reemplazadas solo como texto;
- considerar documento de garantía como garantía vigente;
- mezclar mantenimiento de activo con mantenimiento de instalación sin propietario;
- permitir que el custodio apruebe su propia pérdida o baja;
- asociar vehículo permanentemente con un conductor;
- permitir reducción de kilometraje sin corrección formal;
- deducir consumo de combustible únicamente desde facturas;
- mantener tablas, perfiles o eventos duplicados como fuentes competidoras.

---

#### 33. Preguntas pendientes y validaciones controladas

No se crean preguntas nuevas.

Las incertidumbres AS-IS ya reconocidas por `OPS-ACT-001` se mantienen como validaciones controladas:

- inventario físico completo por sede y punto externo;
- titularidad jurídica o contable;
- custodios actuales;
- condición y disponibilidad real;
- documentos de adquisición, garantía, seguro y mantenimiento;
- activos en poder de terceros;
- vehículo, canastas y reutilizables;
- equipos pendientes de instalar;
- impacto económico y centro de costo.

Estas validaciones no bloquean la decisión de cobertura, pero sí bloquearán migración, valoración, baja, disposición o salida a piloto cuando sean necesarias para el paquete correspondiente.

---

#### 34. Riesgos principales

| Riesgo                            | Severidad | Control mínimo                               |
| --------------------------------- | --------- | -------------------------------------------- |
| activo duplicado                  | crítica   | identidad estable y detección de duplicados  |
| propiedad inferida                | crítica   | nivel de evidencia y validación profesional  |
| activo fuera de sede sin custodio | crítica   | punto externo, tercero y fecha de retorno    |
| préstamo sin devolución           | alta      | vencimiento, responsable y escalamiento      |
| transferencia no aceptada         | alta      | estado pendiente y confirmación              |
| conteo destructivo                | crítica   | observación, diferencia y decisión separadas |
| pérdida borrada                   | crítica   | estado, investigación y disposición          |
| mantenimiento vencido             | crítica   | plan, alerta y bloqueo según política        |
| repuesto sin movimiento           | alta      | reserva y consumo correlacionados            |
| garantía o seguro falso vigente   | crítica   | vigencia, cobertura y fuente                 |
| baja sin segregación              | crítica   | solicitud, aprobación y evidencia            |
| kit incompleto                    | alta      | definición e instancia con completitud       |
| vehículo no disponible            | crítica   | disponibilidad y contingencia                |
| kilometraje inconsistente         | alta      | monotonía y corrección auditable             |
| combustible irreconciliable       | alta      | compra, carga y lectura diferenciadas        |
| datos sensibles expuestos         | crítica   | RLS, masking y almacenamiento privado        |

---

#### 35. Hallazgos y destinos canónicos

| ID                  | Hallazgo                                                                                                    | Riesgo  | Tarea propietaria                                                | Momento            |
| ------------------- | ----------------------------------------------------------------------------------------------------------- | ------- | ---------------------------------------------------------------- | ------------------ |
| H-CAP-SCOPE-007-001 | el catálogo, el tipo y la unidad física todavía pueden competir conceptualmente                             | crítica | `NEXO-DOM-001`; `SUPA-AUD-019`; `SUPA-AUD-022`                   | E2/E3              |
| H-CAP-SCOPE-007-002 | el inventario físico AS-IS permanece incompleto                                                             | alta    | `OPS-ACT-001`; `NEXO-UX-039`; `NEXO-UX-040`                      | antes de migración |
| H-CAP-SCOPE-007-003 | activos individuales y grupos por cantidad requieren reglas de conversión y no duplicidad                   | crítica | `NEXO-DOM-009`; `NEXO-UX-030`; `SUPA-AUD-019`                    | E2/E3              |
| H-CAP-SCOPE-007-004 | ubicación, custodia, uso, propiedad y costo no tienen contrato integral comprobado                          | crítica | `NEXO-DOM-007`; `NEXO-DOM-008`; `NEXO-DOM-017`; `CAP-SCOPE-012`  | E2/E3              |
| H-CAP-SCOPE-007-005 | activos externos o en poder de terceros no están conciliados                                                | crítica | `NEXO-DOM-008`; `NEXO-DOM-011`; `NEXO-UX-031`                    | E2                 |
| H-CAP-SCOPE-007-006 | préstamo, devolución y transferencia existen parcialmente pero no como expediente cerrado                   | alta    | `NEXO-DOM-011`; `NEXO-UX-031`; `NEXO-AUTH-025`                   | E2                 |
| H-CAP-SCOPE-007-007 | conteos de activos requieren confirmar historia, investigación y aprobación de diferencia                   | alta    | `NEXO-DOM-015`; `NEXO-UX-034`; `NEXO-AUTH-027`                   | E2/E5              |
| H-CAP-SCOPE-007-008 | condición, daño, pérdida, faltante y hallazgo no forman un ciclo completo comprobado                        | crítica | `NEXO-DOM-010`; `NEXO-DOM-017`; `NEXO-UX-032`                    | E2                 |
| H-CAP-SCOPE-007-009 | mantenimiento actual conserva registros útiles pero no demuestra plan, orden, prueba y liberación completos | crítica | `NEXO-DOM-012`; `NEXO-DOM-026`; `CAP-SCOPE-013`                  | E2/E3              |
| H-CAP-SCOPE-007-010 | piezas reemplazadas pueden quedar como texto sin consumo de repuesto                                        | crítica | `NEXO-DOM-016`; `NEXO-DOM-025`; `TREQ-INTEGRATION-012`           | E2/E4              |
| H-CAP-SCOPE-007-011 | garantía aparece como tipo documental, no como ciclo de vigencia y reclamación                              | alta    | `NEXO-DOM-017`; `NEXO-DOM-026`; `CAP-SCOPE-016`                  | E2/E4              |
| H-CAP-SCOPE-007-012 | no existe evidencia de un ciclo integral de seguros                                                         | alta    | `NEXO-DOM-026`; `CAP-SCOPE-016`; `CAP-SCOPE-018`                 | E2/E4              |
| H-CAP-SCOPE-007-013 | baja, venta, descarte y reemplazo no están cerrados física y económicamente                                 | crítica | `NEXO-DOM-013`; `NEXO-DOM-028`; `CAP-SCOPE-012`                  | E2/E4              |
| H-CAP-SCOPE-007-014 | kits y conjuntos no tienen instancias y completitud integral comprobadas                                    | alta    | `NEXO-DOM-014`; `NEXO-UX-033`                                    | E2                 |
| H-CAP-SCOPE-007-015 | LPN, contenedor físico y kit requieren frontera explícita                                                   | crítica | `NEXO-DOM-019`; `NEXO-DOM-020`; `NEXO-DOM-024`                   | E2/E3              |
| H-CAP-SCOPE-007-016 | el vehículo crítico no tiene dominio integral de flota comprobado                                           | crítica | `NEXO-DOM-027`; `CAP-SCOPE-011`                                  | E2                 |
| H-CAP-SCOPE-007-017 | kilometraje, combustible y disponibilidad no tienen ciclo correlacionado                                    | crítica | `NEXO-DOM-027`; `NEXO-DOM-028`; `CAP-SCOPE-011`; `CAP-SCOPE-012` | E2/E4              |
| H-CAP-SCOPE-007-018 | adquisición, mantenimiento, pérdida y baja no están conciliados entre ORIGO, NEXO y NUMERA                  | crítica | `ORIGO-UX-014`; `ORIGO-UX-015`; `NEXO-DOM-028`; `CAP-SCOPE-012`  | E2/E4              |
| H-CAP-SCOPE-007-019 | permisos atómicos y segregación del dominio aún deben verificarse                                           | crítica | `NEXO-AUTH-021` a `NEXO-AUTH-030`                                | E2/E5              |
| H-CAP-SCOPE-007-020 | impresión, reimpresión y etiquetas dañadas requieren mantener identidad estable                             | alta    | `NEXO-DOM-018`; `NEXO-AUTH-028`; `NEXO-UX-037`; `NEXO-UX-038`    | E4/E5              |
| H-CAP-SCOPE-007-021 | mantenimiento de activo, instalación y calibración pueden solaparse sin propietario                         | alta    | `NEXO-DOM-026`; `CAP-SCOPE-013`; `CAP-SCOPE-019`                 | E1/E2              |
| H-CAP-SCOPE-007-022 | datos sensibles de activos, vehículos, pólizas y facturas requieren política específica                     | crítica | `CAP-SCOPE-016`; `NEXO-AUTH-024`; `NEXO-AUTH-026`                | E1/E3              |

Todos los hallazgos tienen propietario y puerta. No queda pendiente narrativo sin destino.

---

#### 36. Decisiones canónicas resultantes

1. NEXO será propietario del estado físico y operacional de activos y reutilizables.
2. Tipo o modelo, activo individual y grupo por cantidad serán conceptos distintos.
3. Activo, consumible, repuesto, herramienta, kit, LPN y vehículo no se fusionarán.
4. Propiedad, custodia, ubicación, uso y centro de costo se registrarán por separado.
5. La identidad será estable aunque cambien QR, placa visible o alias.
6. Los movimientos serán eventos no destructivos.
7. El préstamo incluirá receptor, plazo, condición y cierre.
8. La transferencia de custodia requerirá aceptación.
9. El conteo será observación y no corrección automática.
10. Condición y disponibilidad serán dimensiones separadas.
11. Daño, pérdida, faltante y hallazgo tendrán casos auditables.
12. Mantenimiento separará plan, orden, ejecución, prueba y liberación.
13. Los repuestos se reservarán y consumirán desde inventario.
14. Garantía y seguro tendrán vigencia, cobertura y reclamación.
15. Baja y disposición requerirán autorización segregada.
16. Los kits tendrán definición, instancia y completitud.
17. Un kit podrá viajar dentro de un LPN sin convertirse en LPN.
18. Los vehículos serán activos especializados y no extensiones del conductor.
19. El kilometraje será monotónico y corregible mediante eventos.
20. Compra, carga y consumo de combustible serán hechos distintos.
21. Los activos en terceros o puntos externos permanecerán controlados.
22. ORIGO originará adquisiciones y servicios; NEXO conservará el estado físico.
23. NUMERA recibirá hechos económicos sin convertirse en maestro de identidad física.
24. La familia `CAP-07` es parcialmente reutilizable, pero no está cerrada.

---

#### 37. Requisitos de prueba derivados

Esta tarea genera cuatro requisitos distintos y no duplicados:

```text
TREQ-NEXO-013
TREQ-NEXO-014
TREQ-NEXO-015
TREQ-INTEGRATION-012
```

Los detalles completos se incorporan exclusivamente en el archivo canónico `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` regenerado.

No se entregan filas independientes.

##### 37.1. `TREQ-NEXO-013`

Protege identidad, clasificación, ubicación, custodia, préstamos, transferencias, conteos, condición, activos individuales, reutilizables y kits.

##### 37.2. `TREQ-NEXO-014`

Protege plan y ejecución de mantenimiento, reparación, repuestos, garantía, seguro, baja y disposición.

##### 37.3. `TREQ-NEXO-015`

Protege vehículos, documentos, kilometraje, combustible y disponibilidad.

##### 37.4. `TREQ-INTEGRATION-012`

Protege la cadena ORIGO → NEXO → NUMERA para adquisición, mantenimiento, repuestos, pérdida, venta y baja, sin efectos duplicados.

---

#### 38. Dependencias habilitadas y restricciones

- `CAP-SCOPE-008`;
- `CAP-SCOPE-011`;
- `CAP-SCOPE-012`;
- `CAP-SCOPE-013`;
- `CAP-SCOPE-015`;
- `CAP-SCOPE-016`;
- `CAP-SCOPE-017`;
- `CAP-SCOPE-018`;
- `CAP-SCOPE-019`;
- `NEXO-DOM-001` a `NEXO-DOM-028`;
- `NEXO-AUTH-021` a `NEXO-AUTH-030`;
- `NEXO-UX-026` a `NEXO-UX-042`;
- diseño TO-BE de activos, custodia, mantenimiento, repuestos, kits y flota;
- arquitectura E3 de datos, documentos, eventos y seguridad;
- integraciones E4 con ORIGO, NUMERA, documentos y servicios externos;
- paquetes E5 de NEXO e integraciones relacionadas.

No autoriza movimientos, mantenimientos, inventario físico, migración, compra, baja, disposición ni operación real.

---

#### 39. Criterios de aceptación

1. las trece subcapacidades tengan tratamiento explícito;
2. tipo, activo individual y grupo reutilizable estén separados;
3. activo, inventario, repuesto, kit, contenedor y LPN no se fusionen;
4. propiedad, custodia, ubicación, uso y costo estén separados;
5. la identidad sea estable y no dependa del QR;
6. préstamos, devoluciones y transferencias tengan ciclo explícito;
7. conteo, diferencia, investigación y corrección estén separados;
8. condición y disponibilidad sean dimensiones diferentes;
9. daño, pérdida, faltante y hallazgo sean auditables;
10. mantenimiento tenga plan, orden, ejecución, prueba y liberación;
11. reparación consuma repuestos correlacionados;
12. garantía y seguro tengan vigencia y reclamación;
13. baja y disposición sean no destructivas y segregadas;
14. kits tengan definición, instancia y completitud;
15. vehículos, conductor, viaje y custodia estén separados;
16. kilometraje y combustible tengan controles explícitos;
17. ORIGO, NEXO y NUMERA tengan fronteras claras;
18. los veintidós hallazgos tengan destino;
19. no se creen preguntas narrativas nuevas;
20. se generen los cuatro requisitos de prueba;
21. el registro `04A` completo tenga 99 requisitos válidos;
22. ninguna fila tenga más o menos de catorce columnas;
23. no se autorice implementación;
24. la continuidad quede en `CAP-SCOPE-008`.

---

#### 40. Resultado y continuidad

**Estado:** PROPUESTA PARA APROBACIÓN

Al aprobarse:

- `CAP-SCOPE-007` será la decisión canónica de cobertura para activos, reutilizables, mantenimiento, repuestos, kits y vehículos;
- `TREQ-NEXO-013`, `TREQ-NEXO-014`, `TREQ-NEXO-015` y `TREQ-INTEGRATION-012` quedarán incorporados al registro canónico;
- NEXO conservará la propiedad del estado físico y los demás dominios emitirán o consumirán hechos correlacionados;
- ningún conteo, movimiento, mantenimiento, baja, compra o efecto real quedará autorizado;
- la continuidad será:

```text
CAP-SCOPE-008 — Evaluar producción, planificación, rendimiento, calidad e inocuidad
```


### ✅ CAP-SCOPE-008 — Evaluar producción, planificación, rendimiento, calidad e inocuidad

**Estado:** APROBADA 
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Dependencia cumplida:** `CAP-SCOPE-007` aprobada  
**Tarea anterior:** `CAP-SCOPE-007`  
**Siguiente tarea reservada:** `CAP-SCOPE-009`  
**Familia evaluada:** `CAP-08 — Planear y ejecutar producción`  
**Naturaleza:** decisión de cobertura empresarial y definición conceptual objetivo  
**Implementación técnica:** no autorizada  
**Migraciones o cambios en Supabase:** no autorizados  
**Planes, órdenes, lotes, consumos, liberaciones, rechazos, reprocesos o movimientos reales:** no autorizados  
**Requisitos de prueba generados:** `TREQ-FOGO-003`, `TREQ-FOGO-004`, `TREQ-INTEGRATION-013`  
**Actualización del registro de pruebas:** se entrega el archivo `04A` completo regenerado; quedan prohibidas las filas sueltas

---

#### 1. Propósito

Definir el tratamiento objetivo de las capacidades mediante las cuales Vento Group deberá:

- convertir señales de demanda, solicitudes internas, compromisos comerciales y políticas de reposición en necesidades productivas trazables;
- construir planes y programas versionados sin confundir demanda, pronóstico, orden, lote ni ejecución;
- comprobar capacidad de personal, equipos, áreas, insumos, almacenamiento y logística antes de comprometer producción;
- priorizar trabajo productivo mediante reglas visibles y excepciones autorizadas;
- preparar ingredientes, materiales, kits y condiciones de arranque sin duplicar inventario;
- ejecutar lotes o preparaciones desde recetas publicadas y versiones exactas;
- registrar cantidades, consumos, devoluciones, rendimiento, merma, desperdicio y tiempos reales;
- controlar calidad e inocuidad durante el proceso mediante planes y puntos de control versionados;
- separar finalización productiva de liberación, retención, rechazo y disponibilidad de inventario;
- empacar y etiquetar desde datos canónicos del lote, la presentación y la conservación;
- gestionar reproceso, aprovechamiento, subproductos y descarte con genealogía completa;
- cerrar y conciliar plan, materiales, salida, calidad, inventario y costo sin correcciones destructivas;
- integrar FOGO con NEXO, ORIGO, PULSO, PASS, VISO, NUMERA y servicios compartidos sin fuentes competidoras;
- conservar evidencia suficiente para reconstruir qué se esperaba, qué se hizo, con qué materiales, bajo qué controles, quién lo autorizó y qué resultado quedó disponible.

La existencia de recetas, recetario operativo, formularios de lote y tablas parciales no permite considerar cerrada la familia `CAP-08`. La cobertura exige un ciclo productivo completo desde la necesidad hasta la conciliación y disposición final.

---

#### 2. Pregunta de decisión

`CAP-SCOPE-008` responde:

```text
¿CÓMO DEBE VENTO GROUP RECOPILAR NECESIDADES, PLANEAR, PRIORIZAR,
PROGRAMAR, PREPARAR, EJECUTAR, CONTROLAR, LIBERAR Y CONCILIAR
LA PRODUCCIÓN, SIN CONFUNDIR DEMANDA, PLAN, ORDEN, RECETA, LOTE,
INVENTARIO, CALIDAD, INOCUIDAD, DISPONIBILIDAD NI COSTO?
```

Quedan prohibidas equivalencias como:

```text
PEDIDO = NECESIDAD PRODUCTIVA = ORDEN DE PRODUCCIÓN
```

```text
PLAN = PROGRAMACIÓN = LOTE
```

```text
RECETA ACTUAL = RECETA USADA HISTÓRICAMENTE
```

```text
CANTIDAD PLANIFICADA = CANTIDAD PRODUCIDA
```

```text
INSUMO RESERVADO = INSUMO CONSUMIDO
```

```text
MERMA = DIFERENCIA OCULTA
```

```text
LOTE FINALIZADO = PRODUCTO LIBERADO = STOCK DISPONIBLE
```

```text
CONTROL DE CALIDAD = FOTO ADJUNTA
```

```text
REPROCESO = NUEVO LOTE SIN ORIGEN
```

```text
ETIQUETA IMPRESA = TRAZABILIDAD COMPLETA
```

---

#### 3. Fuentes consolidadas

- `OPS-PLAN-001` a `OPS-PLAN-004` — programa y fuentes para auditar demanda, faltantes, sobrantes y producción real;
- `OPS-REC-001` — contrato canónico de recetas y acceso contextual;
- `OPS-PRD-001` — Centro de Pesaje, Premezclas y Porcionamiento;
- `OPS-TRZ-001` — lotes, etiquetas y trazabilidad productiva;
- `CAP-MAP-001` a `CAP-MAP-015`;
- `CODE-AUD-001` a `CODE-AUD-020`;
- `CAP-SCOPE-001` a `CAP-SCOPE-007`;
- `QA-REG-001` y el Registro Canónico de Requisitos de Prueba;
- `REGISTRO_VIVO_DE_PREGUNTAS_PENDIENTES`, especialmente `DAT-12` y `DAT-27`;
- implementación vigente de FOGO para recetas, ingredientes, pasos, recetario y creación de lotes desde recetas publicadas;
- implementación vigente de NEXO para stock, LOC, presentaciones, remisiones, entradas, movimientos, lotes y printing;
- tareas `FOGO-AUTH-001` a `FOGO-AUTH-016` y `FOGO-UX-001` a `FOGO-UX-015`;
- tareas de integración productiva `INT-PROD-001` a `INT-PROD-005`;
- decisiones aprobadas de catálogo, inventario, activos, SST, documentos, autorización, continuidad e integración.

Las respuestas existentes no se vuelven a solicitar.

---

#### 4. Alcance evaluado

- `CAP-08.01` — Recopilar necesidades de producción;
- `CAP-08.02` — Planear cantidades y fechas;
- `CAP-08.03` — Revisar capacidad, personal, equipos e insumos;
- `CAP-08.04` — Priorizar trabajo productivo;
- `CAP-08.05` — Programar producción;
- `CAP-08.06` — Preparar ingredientes y materiales;
- `CAP-08.07` — Ejecutar lotes o preparaciones;
- `CAP-08.08` — Registrar cantidades producidas;
- `CAP-08.09` — Registrar consumo, rendimiento y merma;
- `CAP-08.10` — Controlar calidad durante producción;
- `CAP-08.11` — Empacar y etiquetar;
- `CAP-08.12` — Liberar, retener o rechazar producto;
- `CAP-08.13` — Gestionar reproceso y aprovechamiento;
- `CAP-08.14` — Cerrar y conciliar producción.

También fija fronteras con ventas, pedidos, inventario, compras, personal, activos, calidad, SST, limpieza, calibración, impresión, documentos, costos, analítica y continuidad.

---

#### 5. Fuera de alcance

- ejecutar planes o lotes reales;
- cambiar recetas, rendimientos, formulaciones o tolerancias;
- crear mínimos, pronósticos o producción automática;
- reservar, retirar, consumir, devolver o ingresar inventario real;
- declarar un producto inocuo, conforme, liberado, retenido o rechazado;
- definir límites críticos regulatorios sin validación profesional;
- sustituir BPM, HACCP, concepto sanitario, tecnólogo de alimentos, nutricionista, responsable de calidad o autoridad competente;
- crear migraciones, tablas, RPC, triggers, políticas RLS, buckets o funciones;
- modificar turnos, equipos, compras, órdenes o costos;
- diseñar todavía ventas y pedidos completos, que continúan en `CAP-SCOPE-009`;
- diseñar instalaciones, limpieza, mantenimiento y calibración completos, que continúan en `CAP-SCOPE-013`;
- definir tratamiento contable final, que continúa en `CAP-SCOPE-012`;
- cargar datos históricos cuya fuente o calidad no hayan sido confirmadas;
- habilitar automatización de planificación antes de ejecutar `OPS-PLAN-002` a `OPS-PLAN-004`.

---

#### 6. Principios canónicos

##### 6.1. FOGO será propietario del expediente productivo

FOGO conservará necesidad aceptada, plan, revisión, programación, orden de producción, ejecución, lote productivo, controles de proceso, resultado, decisión de calidad y cierre.

No duplicará stock, LOC, órdenes de compra, turnos laborales ni costos contables.

##### 6.2. La demanda no crea producción automáticamente

Una venta, pedido, remisión, faltante o señal de reposición será una entrada. Solo una política aprobada o una decisión autorizada podrá convertirla en necesidad, plan u orden.

##### 6.3. Plan, programación, orden, lote y ejecución serán entidades distintas

El plan expresa intención agregada. La programación asigna ventana y recursos. La orden autoriza trabajo. El lote identifica ejecución y genealogía. Los eventos de ejecución registran lo ocurrido.

##### 6.4. Toda versión liberada será inmutable

Un plan publicado, una orden liberada o una receta publicada no se editarán destructivamente. Los cambios crearán revisión, motivo, actor e impacto.

##### 6.5. Capacidad y disponibilidad serán datos con fecha de corte

Personal, equipos, materiales, almacenamiento y logística cambian. Toda evaluación conservará fuente, momento, supuestos y restricciones.

##### 6.6. Esperado y real nunca se sobrescriben

Cantidad, consumo, rendimiento, tiempo, merma y costo esperado permanecerán separados de los resultados observados.

##### 6.7. Calidad y ejecución tendrán estados independientes

Un lote puede estar terminado productivamente y continuar retenido. La disponibilidad de inventario dependerá de la decisión de calidad y del movimiento físico confirmado.

##### 6.8. La inocuidad será verificable y profesionalmente gobernada

FOGO registrará controles operativos; las políticas, límites y criterios que requieran validación profesional conservarán fuente, versión y responsable autorizado.

##### 6.9. Toda corrección preservará historia

Una corrección será un evento compensatorio o una revisión. No se reemplazarán silenciosamente cantidades, resultados, controles ni decisiones.

##### 6.10. La automatización será progresiva y reversible

Las recomendaciones podrán aparecer antes que la automatización. Ningún algoritmo generará producción, consumo, liberación o compra sin las puertas aprobadas.

---

#### 7. Propiedad funcional y fuentes de verdad

| Sistema o dominio               | Propiedad objetivo                                                                                                                                                 |
| ------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| FOGO                            | plan productivo, programación, orden de producción, ejecución, lote productivo, cantidades, rendimiento, merma, controles de proceso, decisión de calidad y cierre |
| NEXO                            | stock, reservas, lotes físicos, LOC, entrega y devolución de insumos, producto terminado, cuarentena, disponibilidad y movimientos                                 |
| ORIGO                           | compras, proveedores, órdenes, recepciones empresariales, lead times y faltantes que requieren abastecimiento                                                      |
| PULSO / PASS / canales externos | ventas, pedidos, cancelaciones, compromisos y señales de demanda; no crean el plan productivo                                                                      |
| VISO                            | turnos publicados, disponibilidad laboral y asignaciones administrativas; no administra lotes                                                                      |
| NEXO — activos                  | condición y disponibilidad de equipos productivos; no decide prioridades de producción                                                                             |
| NUMERA                          | costos y resultados económicos derivados; no altera consumos ni rendimientos físicos                                                                               |
| SHELL / Supabase                | contratos compartidos, integridad, autorización, eventos, colas, evidencia técnica y migraciones                                                                   |

---

#### 8. Estado actual verificable

##### 8.1. Capacidades existentes que se conservan

- autenticación y permisos de aplicación;
- rutas de recetas, recetario y lotes;
- recetas con contexto, ingredientes y pasos;
- separación entre administración de receta y recetario operacional;
- creación de lotes desde recetas publicadas;
- áreas alineadas con propósito productivo;
- permisos separados para receta, recetario, creación y consulta de lotes;
- base de NEXO para movimientos, LOC, presentaciones, lotes y etiquetas.

##### 8.2. Capacidades que no están demostradas de extremo a extremo

- consolidación y deduplicación de necesidades productivas;
- plan y programación versionados;
- capacidad productiva multidimensional;
- priorización y override;
- staging, pesaje, kits y devolución de materiales;
- ejecución completa de planta;
- conciliación de consumos y terminado con NEXO;
- planes de control de calidad;
- liberación, retención, rechazo y reproceso;
- cierre productivo y económico;
- operación offline y resolución de conflictos.

##### 8.3. Conclusión

FOGO contiene una base útil de conocimiento y lote, pero todavía no constituye un sistema integral de planificación y ejecución de producción.

---

#### 9. Clasificación de cobertura

| Capacidad   | Nombre                                         | Tratamiento         | Propietario                                  | Decisión                                                                                                                      |
| ----------- | ---------------------------------------------- | ------------------- | -------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| `CAP-08.01` | Recopilar necesidades de producción            | `REUSE_OR_REFACTOR` | FOGO                                         | Consolidar señales de pedidos, ventas, remisiones, reposición, stock objetivo y compromisos manuales sin contarlas dos veces. |
| `CAP-08.02` | Planear cantidades y fechas                    | `BUILD`             | FOGO                                         | Crear planes versionados por horizonte, sede, área, producto, receta, cantidad, fecha y prioridad.                            |
| `CAP-08.03` | Revisar capacidad, personal, equipos e insumos | `BUILD`             | FOGO como coordinador                        | Consumir disponibilidad de VISO, NEXO y ORIGO; registrar restricciones y supuestos.                                           |
| `CAP-08.04` | Priorizar trabajo productivo                   | `BUILD`             | FOGO                                         | Definir reglas, bloqueos, urgencias, override autorizado y explicación de prioridad.                                          |
| `CAP-08.05` | Programar producción                           | `BUILD`             | FOGO                                         | Crear órdenes o trabajos programados por área, turno, ventana, recurso y dependencia.                                         |
| `CAP-08.06` | Preparar ingredientes y materiales             | `BUILD`             | FOGO + NEXO                                  | Diseñar staging, pesaje, kits, reservas, entrega, devolución y control de alérgenos.                                          |
| `CAP-08.07` | Ejecutar lotes o preparaciones                 | `REUSE_OR_REFACTOR` | FOGO                                         | Conservar lote desde receta publicada y completar inicio, pausa, parcialidad, finalización y corrección.                      |
| `CAP-08.08` | Registrar cantidades producidas                | `REUSE_OR_REFACTOR` | FOGO                                         | Formalizar salida real, presentación, lote, cantidad aceptada y destino inventariable.                                        |
| `CAP-08.09` | Registrar consumo, rendimiento y merma         | `REUSE_OR_REFACTOR` | FOGO + NEXO                                  | Separar esperado, reservado, entregado, consumido, devuelto, desperdiciado y producido.                                       |
| `CAP-08.10` | Controlar calidad durante producción           | `BUILD`             | FOGO / responsable de calidad                | Crear planes de control versionados, puntos obligatorios, tolerancias, evidencia y desviaciones.                              |
| `CAP-08.11` | Empacar y etiquetar                            | `REUSE_OR_REFACTOR` | FOGO + servicio de impresión + NEXO          | Conectar empaque, lote, vencimiento, conservación, cantidad y reimpresión sin crear identidades nuevas.                       |
| `CAP-08.12` | Liberar, retener o rechazar producto           | `BUILD`             | Responsable autorizado de calidad/producción | Separar estado productivo, decisión de calidad y disponibilidad de inventario.                                                |
| `CAP-08.13` | Gestionar reproceso y aprovechamiento          | `BUILD`             | FOGO                                         | Crear genealogía, elegibilidad, límites, consumo, nueva salida, merma y decisión de calidad.                                  |
| `CAP-08.14` | Cerrar y conciliar producción                  | `REUSE_OR_REFACTOR` | FOGO + NEXO + NUMERA                         | Completar conciliación de plan, materiales, salidas, calidad, tiempos, diferencias y costos derivados.                        |

Resumen:

| Tratamiento         | Cantidad |
| ------------------- | -------: |
| `REUSE_OR_REFACTOR` |        6 |
| `BUILD`             |        8 |
| **Total**           |   **14** |

---

#### 10. CAP-08.01 — Recopilar necesidades de producción

**Tratamiento:** `REUSE_OR_REFACTOR`

La capacidad deberá:

- recibir señales con identificador de fuente, documento, línea, producto, presentación, cantidad, fecha, sede, canal y prioridad declarada;
- distinguir pedido confirmado, pronóstico, mínimo, reposición, remisión, compromiso B2B y necesidad manual;
- deduplicar señales que representen el mismo compromiso entre PASS, PULSO, POS externo, chat o remisión;
- permitir aceptación, rechazo, agrupación o división de la necesidad con trazabilidad;
- conservar demanda cancelada o sustituida sin borrarla.

---

#### 11. CAP-08.02 — Planear cantidades y fechas

**Tratamiento:** `BUILD`

La capacidad deberá:

- crear planes diarios, semanales u otro horizonte aprobado;
- versionar alcance, período, sede, área, producto, receta, cantidad, fecha objetivo y stock objetivo;
- separar cantidad requerida, propuesta, aprobada y comprometida;
- mostrar cobertura, faltante, excedente y confianza de fuente;
- crear revisión cuando cambie una condición después de publicar.

---

#### 12. CAP-08.03 — Revisar capacidad, personal, equipos e insumos

**Tratamiento:** `BUILD`

La capacidad deberá:

- consultar turnos y disponibilidad laboral desde VISO;
- consultar equipos, condición y mantenimiento desde NEXO;
- consultar stock, reservas, lote, vencimiento y LOC desde NEXO;
- consultar compras pendientes y fechas esperadas desde ORIGO;
- considerar capacidad de área, almacenamiento, frío, empaque y despacho;
- registrar restricción, severidad, fecha de corte, responsable y alternativa.

---

#### 13. CAP-08.04 — Priorizar trabajo productivo

**Tratamiento:** `BUILD`

La capacidad deberá:

- definir criterios versionados como compromiso, vencimiento, criticidad, stock, secuencia, limpieza, alérgenos y eficiencia;
- mostrar por qué una orden está antes que otra;
- separar prioridad calculada de override manual;
- exigir actor, motivo, vigencia e impacto para urgencias;
- impedir que una urgencia oculte trabajo desplazado.

---

#### 14. CAP-08.05 — Programar producción

**Tratamiento:** `BUILD`

La capacidad deberá:

- convertir plan aprobado en órdenes o trabajos programados;
- asignar sede, área, ventana, turno, producto, receta y cantidad;
- relacionar dependencias, premezclas, limpieza, cambio de formato y capacidad;
- detectar solapamientos de equipo, área o material;
- publicar y revisar sin editar destructivamente.

---

#### 15. CAP-08.06 — Preparar ingredientes y materiales

**Tratamiento:** `BUILD`

La capacidad deberá:

- reservar materiales antes de separarlos físicamente;
- crear listas de picking, pesaje, porcionamiento o kit por orden;
- registrar lote, cantidad, unidad, LOC, responsable y hora de entrega;
- distinguir preparado, entregado, consumido, devuelto y descartado;
- controlar alérgenos, contaminación cruzada, sustituciones y condiciones de conservación;
- mantener `OPS-PRD-001` como diseño especializado del Centro de Pesaje.

---

#### 16. CAP-08.07 — Ejecutar lotes o preparaciones

**Tratamiento:** `REUSE_OR_REFACTOR`

La capacidad deberá:

- iniciar desde orden autorizada o excepción documentada;
- conservar receta, versión, escala, área, actor y turno;
- registrar inicio, pausa, reanudación, parcialidad, cancelación y finalización;
- capturar pasos obligatorios y desviaciones sin convertir FOGO en lector de texto excesivo;
- permitir operación por área y estación con mínima lectura.

---

#### 17. CAP-08.08 — Registrar cantidades producidas

**Tratamiento:** `REUSE_OR_REFACTOR`

La capacidad deberá:

- registrar salida por producto, presentación, unidad y lote;
- separar cantidad elaborada, aceptada, retenida, rechazada y disponible;
- conservar tara, conteo, peso o método de medición;
- relacionar destino y empaque;
- producir entrada a NEXO exactamente una vez cuando corresponda.

---

#### 18. CAP-08.09 — Registrar consumo, rendimiento y merma

**Tratamiento:** `REUSE_OR_REFACTOR`

La capacidad deberá:

- separar consumo teórico, reservado, entregado, real, devuelto y ajustado;
- calcular rendimiento real sin alterar el esperado;
- registrar merma técnica, desperdicio, derrame, daño, muestra, reproceso y diferencia;
- conservar causa, unidad, lote, etapa, actor y destino;
- bloquear métricas históricas hasta resolver fuente y formato de `DAT-27`.

---

#### 19. CAP-08.10 — Controlar calidad durante producción

**Tratamiento:** `BUILD`

La capacidad deberá:

- asignar plan de control versionado por producto, receta, proceso, área o riesgo;
- definir puntos, método, instrumento, muestra, tolerancia y responsable;
- capturar resultado, unidad, hora, equipo, evidencia y desviación;
- distinguir control informativo, obligatorio, crítico y liberatorio;
- relacionar limpieza, alérgenos, temperatura, tiempo u otros controles sin fijar valores no validados profesionalmente;
- abrir no conformidad cuando el resultado lo exija.

---

#### 20. CAP-08.11 — Empacar y etiquetar

**Tratamiento:** `REUSE_OR_REFACTOR`

La capacidad deberá:

- seleccionar presentación y material autorizado;
- registrar cantidad por empaque, peso, unidades y lote;
- derivar fecha y conservación desde política aprobada;
- generar evento de impresión con plantilla, impresora, actor y resultado;
- permitir reimpresión con motivo sin crear lote o producto nuevo;
- relacionar LPN o contenedor cuando corresponda.

---

#### 21. CAP-08.12 — Liberar, retener o rechazar producto

**Tratamiento:** `BUILD`

La capacidad deberá:

- separar cierre productivo, revisión de calidad y publicación en inventario;
- definir quién puede decidir según producto, riesgo y excepción;
- conservar alcance de la decisión por lote, cantidad o empaque;
- bloquear disponibilidad mientras exista retención;
- registrar razón, controles revisados, evidencia, fecha y vigencia;
- permitir liberación parcial o decisión revisada mediante evento posterior.

---

#### 22. CAP-08.13 — Gestionar reproceso y aprovechamiento

**Tratamiento:** `BUILD`

La capacidad deberá:

- distinguir reproceso, retrabajo, reaprovechamiento, subproducto, devolución interna y descarte;
- verificar elegibilidad, edad, condición, alérgenos, cantidad y límite de uso;
- crear relación genealógica entre lote origen y lote destino;
- registrar consumo, nueva salida, merma y efecto de calidad;
- impedir ciclos genealógicos o reutilización ilimitada;
- conservar costo y decisión de disposición para NUMERA.

---

#### 23. CAP-08.14 — Cerrar y conciliar producción

**Tratamiento:** `REUSE_OR_REFACTOR`

La capacidad deberá:

- comparar plan, orden y resultado;
- conciliar materiales reservados, entregados, consumidos, devueltos y desperdiciados;
- conciliar salida producida, retenida, liberada, rechazada y reprocesada;
- verificar controles obligatorios, etiquetas y movimientos pendientes;
- registrar tiempos, causas y diferencias;
- bloquear cierre definitivo cuando existan pendientes críticos;
- permitir corrección posterior solo mediante revisión o compensación.

---

#### 24. Modelo conceptual objetivo

| Entidad o concepto           | Función                                                               |
| ---------------------------- | --------------------------------------------------------------------- |
| `ProductionDemandSignal`     | Hecho de demanda o necesidad proveniente de una fuente identificada.  |
| `ProductionRequirement`      | Necesidad aceptada y normalizada para planificación.                  |
| `ProductionPlan`             | Intención agregada para un horizonte y alcance.                       |
| `ProductionPlanRevision`     | Versión inmutable de un plan publicado.                               |
| `ProductionWorkOrder`        | Trabajo autorizado y programado.                                      |
| `ProductionBatch`            | Ejecución física identificada con genealogía.                         |
| `MaterialReservation`        | Cantidad separada para una orden sin consumo físico todavía.          |
| `MaterialIssue`              | Entrega física de materiales desde NEXO.                              |
| `ProductionExecutionEvent`   | Inicio, pausa, paso, desviación, parcialidad o finalización.          |
| `ProductionActual`           | Cantidad, consumo, tiempo, rendimiento o merma observados.            |
| `QualityControlPlanVersion`  | Conjunto versionado de controles aplicables.                          |
| `QualityControlResult`       | Resultado observado de un control.                                    |
| `ProductDispositionDecision` | Liberar, retener, rechazar o enviar a reproceso.                      |
| `PackagingRun`               | Empaque y etiquetado de una cantidad de lote.                         |
| `ReworkLink`                 | Relación genealógica entre origen y nuevo resultado.                  |
| `ProductionReconciliation`   | Cierre de materiales, resultados, calidad, movimientos y diferencias. |

Ninguna entidad podrá sustituirse por un campo de texto libre cuando deba conservar identidad, ciclo de vida, autorización o relación histórica.

---

#### 25. Estados y dimensiones independientes

##### 25.1. Necesidad

```text
RECEIVED → NORMALIZED → ACCEPTED | REJECTED | SUPERSEDED
```

##### 25.2. Plan

```text
DRAFT → REVIEWED → APPROVED → PUBLISHED → REVISED | CANCELLED | CLOSED
```

##### 25.3. Orden

```text
DRAFT → RELEASED → READY → IN_PROGRESS → PAUSED → COMPLETED → CLOSED
                                  ↘ CANCELLED
```

##### 25.4. Lote — ejecución

```text
NOT_STARTED → IN_PROGRESS → PRODUCED → RECONCILED → CLOSED
```

##### 25.5. Lote — calidad

```text
NOT_REQUIRED | PENDING | HOLD | RELEASED | REJECTED | REWORK_REQUIRED
```

##### 25.6. Publicación de inventario

```text
NOT_POSTED | PENDING | POSTED | FAILED | COMPENSATED
```

Los estados de ejecución, calidad, inventario y conciliación no se fusionarán en una sola columna ambigua.

---

#### 26. Reglas de demanda y planificación

1. Cada señal conservará `source_system`, `source_event_id`, documento, línea y versión.
2. Una misma venta visible en PASS y PULSO no contará dos veces.
3. Una remisión solicitada no equivale automáticamente a producción si puede atenderse con stock existente.
4. El plan indicará demanda cubierta, stock usado, producción requerida, faltante y excedente proyectado.
5. Los mínimos y pronósticos serán políticas versionadas, no números sueltos en formularios.
6. Toda recomendación mostrará fuente, período, método y confianza.
7. La publicación del plan congelará la versión; cualquier cambio creará revisión.
8. Un override no eliminará la prioridad anterior ni el trabajo desplazado.
9. La planificación automática permanecerá deshabilitada hasta validar `OPS-PLAN-002` a `OPS-PLAN-004`.

---

#### 27. Capacidad y restricciones

La capacidad productiva deberá considerar, como mínimo:

- sede, área, estación y ventana;
- turno y personal habilitado;
- equipo requerido, condición y mantenimiento;
- capacidad nominal y efectiva;
- receta, secuencia, cambio de formato y limpieza;
- materiales disponibles, reservados y esperados;
- vida útil y vencimiento de insumos;
- almacenamiento de terminado;
- empaque, etiquetas y consumibles;
- transporte y fecha de entrega;
- controles de calidad e inocuidad;
- contingencias y dependencia de terceros.

Una restricción podrá bloquear, advertir o exigir aprobación según política. Nunca se resolverá ocultándola.

---

#### 28. Calidad e inocuidad

##### 28.1. Frontera de dominio

FOGO conservará los hechos productivos de calidad e inocuidad. VISO conservará expedientes SST o de cumplimiento transversal cuando corresponda. NEXO conservará condición física y cuarentena de existencias. `CAP-SCOPE-013` gobernará limpieza, instalaciones y calibración.

##### 28.2. Plan de control

Cada plan deberá tener:

- objeto y alcance;
- versión y vigencia;
- producto, receta, proceso o área aplicable;
- punto de control;
- método e instrumento;
- muestra o frecuencia;
- rango, tolerancia o criterio aprobado;
- evidencia requerida;
- responsable de captura y de decisión;
- efecto ante incumplimiento.

##### 28.3. Datos sensibles y profesionales

Los límites regulatorios, médicos o profesionales no se inventarán en esta tarea. Se almacenarán con fuente, autoridad, versión y fecha de validación.

##### 28.4. Decisión de disposición

La decisión podrá aplicar a todo el lote o a una cantidad identificada. El producto retenido no será seleccionable como disponible, despachable o vendible.

---

#### 29. Rendimiento, merma y genealogía

- el rendimiento esperado provendrá de la versión de receta;
- el rendimiento real provendrá de medición de salida;
- la desviación tendrá cantidad, porcentaje, causa y responsable;
- la merma no será una diferencia residual sin explicación;
- desperdicio, muestra, evaporación, daño, devolución, reproceso y subproducto tendrán códigos distintos;
- los insumos conservarán lote de origen cuando la política lo requiera;
- el terminado conservará lote productivo y vínculos con insumos relevantes;
- el reproceso conservará origen, cantidad, condición, límite y nueva salida;
- la genealogía no podrá contener ciclos;
- NUMERA consumirá resultados físicos sin modificarlos.

---

#### 30. Empaque, etiquetado e impresión

El hecho productivo generará una intención de empaque o impresión. El servicio de impresión no decidirá producto, lote, vencimiento, cantidad ni conservación.

Cada impresión conservará:

- lote y producto;
- presentación y cantidad;
- plantilla y versión;
- datos variables;
- impresora, estación y actor;
- número de copias;
- resultado y error;
- motivo de reimpresión;
- relación con empaque, LPN o documento.

Una etiqueta fallida o dañada podrá reimprimirse sin crear un lote nuevo. La reetiquetación que cambie datos empresariales requerirá corrección autorizada del origen, no edición manual de la etiqueta.

---

#### 31. Eventos e integraciones requeridos

Eventos mínimos:

```text
production_demand_signal_received
production_requirement_accepted
production_plan_published
production_plan_revised
production_work_order_released
production_materials_reserved
production_materials_issued
production_batch_started
production_batch_paused
production_batch_resumed
production_quantity_recorded
production_material_consumed
production_material_returned
production_waste_recorded
quality_control_recorded
production_batch_completed
production_batch_held
production_batch_released
production_batch_rejected
production_rework_created
production_packaged
production_label_requested
production_inventory_posted
production_reconciled
production_correction_posted
```

Cada evento tendrá identidad, versión, actor, fecha efectiva, fuente, recurso, cantidades, unidades, correlación y estado de aplicación. Los consumidores serán idempotentes.

---

#### 32. Autorización y segregación

Deberán separarse, como mínimo:

- consultar cola y plan;
- crear o editar borrador de plan;
- revisar y aprobar plan;
- publicar o revisar programación;
- liberar orden;
- iniciar, pausar y reanudar lote;
- registrar consumo, devolución, cantidad y merma;
- registrar control de calidad;
- decidir retención, liberación o rechazo;
- crear reproceso;
- finalizar y cerrar lote;
- corregir o anular;
- administrar recetas y controles;
- consultar fórmulas sensibles;
- imprimir y reimprimir etiqueta;
- ejecutar acciones por sede y área productiva.

Cuando la política exija independencia, el operador que ejecuta no podrá liberar su propio lote. La administración no dependerá del check-in salvo que el permiso y contexto aprobados lo exijan.

---

#### 33. Experiencia por actor

##### Planeador o supervisor

- tablero de necesidades, cobertura y restricciones;
- plan por horizonte y área;
- capacidad y materiales;
- conflictos, urgencias y cambios;
- aprobación, publicación y conciliación.

##### Operador de producción

- trabajo pendiente del turno;
- siguiente acción clara;
- receta resumida y versión;
- cantidades simples y controles requeridos;
- pausa, excepción y ayuda contextual;
- mínima escritura y objetivos táctiles adecuados.

##### Bodega o pesaje

- reservas y lista de materiales;
- lote, LOC, cantidad y unidad;
- entrega, devolución y diferencia;
- kits y alérgenos cuando apliquen.

##### Calidad

- lotes pendientes;
- controles faltantes o fuera de criterio;
- evidencia y tendencia;
- decisión de disposición con alcance claro.

##### Gerencia y NUMERA

- cumplimiento del plan;
- rendimiento y merma;
- causas de diferencia;
- costo derivado y capacidad;
- sin permiso para alterar hechos físicos.

---

#### 34. Operación offline y contingencia

- la captura offline conservará orden, lote, paso, actor y marca temporal;
- la sincronización revalidará sesión, permiso, versión, lote y estado;
- un reintento no duplicará consumo, salida, control ni etiqueta;
- los conflictos de cantidad, receta, lote o decisión no se resolverán automáticamente;
- una caída no permitirá liberar producto si la política exige validación central;
- el trabajo pendiente distinguirá local, enviado, confirmado, rechazado y requiere intervención;
- el procedimiento físico de inocuidad y emergencia no dependerá exclusivamente de FOGO;
- los equipos de pesaje o medición indisponibles activarán contingencia aprobada, no valores inventados;
- la recuperación conservará el trabajo capturado y su orden causal.

---

#### 35. Evidencia, conservación y auditoría

Se conservarán:

- necesidad y fuente original;
- plan, revisiones y aprobaciones;
- orden y programación;
- receta y versión;
- actor, turno, sede, área y dispositivo;
- materiales reservados, entregados, consumidos y devueltos;
- lote de insumo y lote productivo cuando aplique;
- cantidades, unidades y métodos de medición;
- rendimiento, merma y causas;
- controles, instrumentos, resultados y evidencia;
- decisión de liberación, retención, rechazo o reproceso;
- empaque, etiqueta, reimpresión y error;
- movimientos de inventario y estado de aplicación;
- cierre, conciliación, pendientes y correcciones;
- referencias financieras derivadas sin exponer información innecesaria al operador.

La conservación y acceso final se definirán en `CAP-SCOPE-016`.

---

#### 36. Patrones legacy destinados a retiro

- planificar desde chats o memoria sin identidad de demanda;
- sumar ventas, pedidos y remisiones como demandas independientes sin conciliación;
- usar una remisión como orden de producción universal;
- editar un plan publicado o lote cerrado;
- iniciar lote sin receta y versión identificables;
- consumir insumos solo mediante texto o cantidad agregada;
- cambiar rendimiento esperado para ocultar desviaciones;
- registrar merma como ajuste genérico;
- considerar foto como control de calidad completo;
- finalizar lote y liberar stock en el mismo clic sin autorización;
- usar un único estado para ejecución, calidad e inventario;
- reimprimir etiqueta creando otro lote;
- crear reproceso sin relación con lote de origen;
- corregir cantidades sobrescribiendo historia;
- depender de categorías o nombres para autorización;
- mantener copias editables de plan, lote o resultado en varias aplicaciones.

---

#### 37. Preguntas pendientes y validaciones controladas

No se crean preguntas nuevas.

| Código   | Pregunta vigente                                                   | Responsable                              | Tratamiento provisional                                                         | Puerta máxima                                            |
| -------- | ------------------------------------------------------------------ | ---------------------------------------- | ------------------------------------------------------------------------------- | -------------------------------------------------------- |
| `DAT-12` | ¿Se guarda un registro de lo que realmente se produjo cada día?    | Responsable de Producción                | asumir evidencia manual o parcial; no migrar ni calcular cumplimiento histórico | antes de backfill, métricas o piloto con historia        |
| `DAT-27` | ¿Cómo se llama el formato donde se registra actualmente una merma? | Producción, Cocina o responsable de sede | diseñar captura prospectiva; no declarar histórico completo                     | antes de migración de mermas y línea base de rendimiento |

También permanecen las validaciones de `OPS-PLAN-002` a `OPS-PLAN-004` sobre fuentes, períodos, calidad y trazabilidad.

Estas preguntas no bloquean la clasificación de cobertura. Sí bloquean cualquier afirmación sobre calidad histórica, algoritmo de planificación, métricas base o migración completa.

---

#### 38. Riesgos principales

| Riesgo                           | Severidad | Control mínimo                                           |
| -------------------------------- | --------- | -------------------------------------------------------- |
| demanda duplicada                | crítica   | identidad de señal, fuente, línea y deduplicación        |
| plan imposible                   | crítica   | capacidad y materiales verificados con fecha de corte    |
| prioridad opaca                  | alta      | regla visible, actor, motivo y vigencia                  |
| receta equivocada                | crítica   | versión publicada y snapshot por lote                    |
| consumo duplicado                | crítica   | evento correlacionado e idempotente hacia NEXO           |
| rendimiento manipulado           | alta      | esperado y real separados; corrección no destructiva     |
| merma omitida                    | alta      | causa, cantidad, unidad, lote y destino                  |
| producto no conforme disponible  | crítica   | retención y liberación independientes del cierre         |
| control crítico omitido          | crítica   | checklist versionado y bloqueo según política            |
| etiqueta incoherente             | crítica   | datos derivados del lote liberado y reimpresión auditada |
| reproceso sin genealogía         | crítica   | relación padre-hijo y elegibilidad explícita             |
| cierre incompleto                | crítica   | conciliación obligatoria y pendientes visibles           |
| corrección destructiva           | crítica   | evento compensatorio y aprobación                        |
| operación offline duplicada      | crítica   | clave de idempotencia y reautorización                   |
| fórmula o dato sensible expuesto | crítica   | mínimo necesario, RLS y permiso atómico                  |

---

#### 39. Hallazgos y destinos canónicos

| ID                  | Hallazgo                                                                                                            | Riesgo  | Tarea propietaria                                                                     | Momento           |
| ------------------- | ------------------------------------------------------------------------------------------------------------------- | ------- | ------------------------------------------------------------------------------------- | ----------------- |
| H-CAP-SCOPE-008-001 | las señales de demanda y necesidad productiva pueden llegar desde fuentes distintas sin deduplicación empresarial   | crítica | `OPS-PLAN-002` a `OPS-PLAN-004`; `FOGO-UX-001`; `INT-PROD-001`                        | E1/E2             |
| H-CAP-SCOPE-008-002 | no existe una fuente única comprobada para plan y programación de producción                                        | crítica | `FOGO-UX-003`; `FOGO-UX-004`; `FOGO-UX-014`; `PROC-CAT-009` a `PROC-CAT-018`          | E2                |
| H-CAP-SCOPE-008-003 | la evidencia histórica de producción real continúa pendiente en `DAT-12`                                            | alta    | `OPS-PLAN-002`; `OPS-PLAN-004`; puerta de migración de FOGO                           | antes de backfill |
| H-CAP-SCOPE-008-004 | no existe un modelo integral de capacidad productiva por área, turno, equipo, persona e insumo                      | crítica | `FOGO-UX-001`; `FOGO-UX-014`; `CAP-SCOPE-002`; `CAP-SCOPE-007`                        | E2                |
| H-CAP-SCOPE-008-005 | la disponibilidad laboral de VISO no está integrada con planificación productiva                                    | alta    | `FOGO-UX-004`; `CAP-SCOPE-002`; `INT-PROD-001` a `INT-PROD-005`                       | E2/E3             |
| H-CAP-SCOPE-008-006 | la disponibilidad y condición de equipos de NEXO no bloquean de forma canónica un plan                              | crítica | `CAP-SCOPE-007`; `NEXO-DOM-012`; `NEXO-DOM-026`; `FOGO-UX-014`                        | E2/E3             |
| H-CAP-SCOPE-008-007 | stock, reservas, lotes y fechas de disponibilidad no alimentan todavía una promesa productiva cerrada               | crítica | `CAP-SCOPE-006`; `FOGO-UX-012`; `INT-PROD-001` a `INT-PROD-005`                       | E2/E3             |
| H-CAP-SCOPE-008-008 | faltantes y lead times de compra de ORIGO no están incorporados al plan productivo                                  | alta    | `CAP-SCOPE-005`; `ORIGO-UX-014`; `INT-PROD-001` a `INT-PROD-005`                      | E2/E3             |
| H-CAP-SCOPE-008-009 | prioridades, urgencias y overrides carecen de reglas y evidencia uniformes                                          | crítica | `FOGO-UX-004`; `FOGO-UX-014`; `FOGO-AUTH-008`; `FOGO-AUTH-012`                        | E2                |
| H-CAP-SCOPE-008-010 | plan, orden de producción, lote y preparación pueden confundirse como una sola entidad                              | crítica | `FOGO-UX-005` a `FOGO-UX-007`; `OPS-TRZ-001`; `SUPA-AUD-019`                          | E2/E3             |
| H-CAP-SCOPE-008-011 | cada lote debe conservar la receta y versión realmente utilizadas                                                   | crítica | `OPS-REC-001`; `FOGO-AUTH-013`; `TREQ-FOGO-002`                                       | E2/E3             |
| H-CAP-SCOPE-008-012 | pesaje, premezclas, porcionamiento, kits y staging permanecen como capacidad futura no cerrada                      | alta    | `OPS-PRD-001`; `FOGO-UX-012`; `CAP-SCOPE-006`                                         | E2/E5             |
| H-CAP-SCOPE-008-013 | la UX actual no demuestra ejecución completa en planta con inicio, pausa, parcialidad, excepción y cierre           | crítica | `FOGO-UX-005` a `FOGO-UX-011`; `UX-QA-025`                                            | E2/E5             |
| H-CAP-SCOPE-008-014 | consumo de insumos y entrada de terminado no están cerrados exactamente una vez con NEXO                            | crítica | `FOGO-UX-012`; `FOGO-UX-013`; `INT-PROD-001` a `INT-PROD-005`; `TREQ-INTEGRATION-011` | E3/E5             |
| H-CAP-SCOPE-008-015 | rendimiento esperado, rendimiento real y causas de desviación requieren contrato integral                           | alta    | `FOGO-UX-010`; `OPS-REC-001`; `CAP-SCOPE-004`                                         | E2/E3             |
| H-CAP-SCOPE-008-016 | la fuente y el formato operativo de merma siguen pendientes en `DAT-27`                                             | alta    | `OPS-PLAN-004`; `FOGO-UX-010`; puerta de migración de mermas                          | antes de backfill |
| H-CAP-SCOPE-008-017 | no existe evidencia de planes de control de calidad versionados por producto y proceso                              | crítica | `FOGO-UX-001`; `FOGO-UX-014`; `CAP-SCOPE-003`; `CAP-SCOPE-013`                        | E2                |
| H-CAP-SCOPE-008-018 | liberación, retención y rechazo no forman un ciclo separado del cierre productivo e inventario                      | crítica | `FOGO-UX-007`; `FOGO-UX-014`; `FOGO-AUTH-011`; `CAP-SCOPE-006`                        | E2/E3             |
| H-CAP-SCOPE-008-019 | controles de alérgenos, higiene, saneamiento y contaminación cruzada atraviesan varios dominios                     | crítica | `CAP-SCOPE-003`; `CAP-SCOPE-004`; `CAP-SCOPE-013`; `OPS-PRD-001`                      | E1/E2             |
| H-CAP-SCOPE-008-020 | empaque y etiquetas productivas tienen infraestructura parcial pero no una emisión cerrada desde el hecho operativo | alta    | `OPS-TRZ-001`; `FOGO-UX-013`; `PRINT-ARC-001` a `PRINT-ARC-020`                       | E2/E4             |
| H-CAP-SCOPE-008-021 | reproceso, aprovechamiento, subproducto y descarte no tienen genealogía integral comprobada                         | crítica | `FOGO-UX-010`; `FOGO-UX-011`; `OPS-TRZ-001`; `CAP-SCOPE-006`                          | E2/E3             |
| H-CAP-SCOPE-008-022 | el cierre de lote no concilia todavía materiales, salida, calidad, tiempo y diferencias                             | crítica | `FOGO-UX-007`; `FOGO-UX-010`; `FOGO-UX-014`; `CAP-SCOPE-012`                          | E2/E3             |
| H-CAP-SCOPE-008-023 | correcciones posteriores al cierre podrían alterar historia si no se modelan como eventos compensatorios            | crítica | `FOGO-UX-011`; `FOGO-AUTH-012`; `PROC-CAT-013`; `PROC-CAT-014`                        | E2/E3             |
| H-CAP-SCOPE-008-024 | permisos por área, turno, dispositivo compartido y autoridad de liberación aún deben validarse integralmente        | crítica | `FOGO-AUTH-001` a `FOGO-AUTH-016`; `AUTH-QA-029`; `UX-QA-025`                         | E2/E5             |
| H-CAP-SCOPE-008-025 | operación offline, reintentos y conflictos productivos no tienen política demostrada                                | crítica | `CODE-AUD-018`; `FOGO-UX-005` a `FOGO-UX-011`; `QUEUE-ARC-001` a `QUEUE-ARC-010`      | E3/E5             |
| H-CAP-SCOPE-008-026 | costeo de receta y lote no está conciliado con rendimiento y consumo reales                                         | alta    | `CAP-SCOPE-012`; `FOGO-UX-010`; `INT-PROD-001` a `INT-PROD-005`                       | E2/E4             |

Todos los hallazgos tienen propietario y puerta. No queda pendiente narrativo sin destino.

---

#### 40. Decisiones canónicas resultantes

1. FOGO será la fuente de plan, programación, orden, ejecución, lote productivo, calidad y conciliación.
2. NEXO será la fuente de existencias, reservas, materiales, LOC, condición, cuarentena y terminado físico.
3. Una señal de demanda no creará automáticamente una orden productiva.
4. Plan, programación, orden y lote conservarán identidades y versiones distintas.
5. Cada lote conservará receta y versión exactas.
6. La capacidad se evaluará con fuentes y fecha de corte.
7. Prioridad y override serán visibles y auditables.
8. Preparación de materiales distinguirá reserva, entrega, consumo, devolución y descarte.
9. Esperado y real permanecerán separados.
10. Calidad y ejecución utilizarán estados independientes.
11. Producto finalizado no estará disponible hasta cumplir la decisión de calidad aplicable y el movimiento de NEXO.
12. Reproceso conservará genealogía.
13. El cierre exigirá conciliación y pendientes explícitos.
14. Las correcciones posteriores serán compensatorias o revisionadas.
15. Automatización de planificación y mínimos queda bloqueada hasta validar las fuentes de `OPS-PLAN`.
16. FOGO no duplicará compras, inventario, turnos, activos ni costos.
17. La ausencia de red no autorizará liberación ni cambios destructivos.
18. Todo requisito nuevo queda incorporado únicamente mediante el `04A` completo regenerado.

---

#### 41. Requisitos de prueba derivados

Esta tarea genera:

```text
TREQ-FOGO-003
TREQ-FOGO-004
TREQ-INTEGRATION-013
```

##### 41.1. `TREQ-FOGO-003`

Protege señales, plan, revisiones, capacidad, priorización, programación, órdenes y overrides.

##### 41.2. `TREQ-FOGO-004`

Protege ejecución, controles de calidad e inocuidad, disposición, empaque, reproceso y cierre no destructivo.

##### 41.3. `TREQ-INTEGRATION-013`

Protege la cadena demanda → plan → capacidad → materiales → ejecución → calidad → inventario → costo, con correlación e idempotencia.

El detalle canónico se encuentra únicamente en el registro `04A` completo regenerado.

---

#### 42. Dependencias habilitadas y restricciones

La aprobación habilitará como entradas de diseño:

- `FOGO-AUTH-001` a `FOGO-AUTH-016`;
- `FOGO-UX-001` a `FOGO-UX-015`;
- `OPS-REC-001`, `OPS-PRD-001` y `OPS-TRZ-001`;
- `INT-PROD-001` a `INT-PROD-005`;
- diseño de procesos E2;
- arquitectura E3 y servicios E4;
- paquetes E5 de FOGO, NEXO y consumidores;
- pruebas `UX-QA-025` y certificación del BLOQUE U.

Continuarán bloqueados:

- algoritmos de pronóstico o producción automática;
- mínimos automáticos;
- migración histórica sin fuente verificada;
- liberación automática no aprobada;
- consumo o entrada real de inventario;
- cambios físicos, regulatorios o de operación;
- implementación anticipada.

---

#### 43. Criterios de aceptación

`CAP-SCOPE-008` podrá aprobarse cuando:

- las catorce subcapacidades tengan tratamiento explícito;
- FOGO, NEXO, ORIGO, PULSO/PASS, VISO y NUMERA tengan fronteras claras;
- demanda, plan, programación, orden, lote y ejecución estén separados;
- capacidad y priorización tengan reglas objetivo;
- preparación, consumo, rendimiento y merma estén diferenciados;
- calidad, inocuidad, liberación, retención y rechazo estén modelados sin equivalencias peligrosas;
- empaque, etiqueta, reproceso y cierre tengan trazabilidad;
- `DAT-12` y `DAT-27` tengan tratamiento provisional y puerta;
- cada hallazgo tenga tarea y momento;
- los tres requisitos nuevos estén incorporados en un `04A` completo válido;
- no se haya autorizado implementación, migración ni operación real.

---

#### 44. Resultado y continuidad

Al aprobarse esta tarea quedará definida la cobertura objetivo de producción y sus dependencias, sin ejecutar todavía el diseño detallado ni la implementación.

La continuidad será exclusivamente:

```text
CAP-SCOPE-009
— Evaluar ventas, pedidos, mesas, comandas, caja y pagos
```

`CAP-SCOPE-009` consumirá las fronteras de demanda y disponibilidad aquí aprobadas, pero no reabrirá la propiedad del plan productivo ni del lote.
