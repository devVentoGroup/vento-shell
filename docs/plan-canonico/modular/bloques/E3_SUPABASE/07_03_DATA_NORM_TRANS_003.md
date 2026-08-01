### ✅ DATA-NORM-TRANS-003 — Identificar colisiones producidas por valores normalizados

**Estado:** APROBADA

**Condición canónica:** APROBADA EXPLÍCITAMENTE POR EL USUARIO — `2026-08-01`

**Tarea anterior:** `DATA-NORM-TRANS-002 — Ejecutar dry-run de cada regla de normalización` — APROBADA

**Tarea siguiente:** `DATA-NORM-TRANS-004 — Resolver duplicados antes de aplicar restricciones de unicidad` — APROBADA

**Tipo de tarea:** identificación, reconciliación y clasificación analítica de colisiones sobre evidencia aprobada; sin confirmar duplicados por inferencia, elegir sobrevivientes, modificar datos, reasignar relaciones, activar constraints, ejecutar DDL o DML, crear migraciones, consultar producción nuevamente ni alterar VITAL

**Fecha de preparación documental:** `2026-08-01`

#### 1. Resultado concreto

Esta tarea materializa tres artefactos documentales:

```text
NORMALIZED-COLLISION-REGISTER-003@1.0.0
NORMALIZED-COLLISION-DECISION-QUEUE-003@1.0.0
NORMALIZED-COLLISION-EVIDENCE-GAP-MATRIX-003@1.0.0
```

El resultado:

- convierte las salidas aprobadas de `DATA-NORM-TRANS-002` en grupos de colisión identificables y reproducibles;
- asigna a cada grupo una de las diez clases canónicas de `DATA-NORM-AUD-004` y `DATA-NORM-ARC-010`;
- conserva simultáneamente evidencia positiva y negativa;
- separa colisión, identidad empresarial, duplicado confirmado y decisión de consolidación;
- emite una disposición analítica por grupo o familia cuando la evidencia aprobada ya permite cerrarla sin tocar datos;
- deja una cola cerrada de candidatos que sí requieren resolución en `DATA-NORM-TRANS-004`;
- bloquea cualquier uso de estas coincidencias para seleccionar registros, imponer unicidad o fusionar datos.

No se simula que una consulta remota nueva haya ocurrido. El registro se deriva exclusivamente de los cortes históricos de solo lectura ya aprobados en `DATA-NORM-AUD-004`, `DATA-NORM-AUD-007`, `DATA-NORM-TRANS-001` y `DATA-NORM-TRANS-002`.

#### 2. Identidad y linaje del corte

| Propiedad | Valor |
| --- | --- |
| `collision_run_id` | `DNT003-20260801-BASELINE001-DRYRUN002-R1` |
| baseline de entrada | `DATA-NORM-TRANS-001@1.0.0` |
| dry-run de entrada | `DNT002-20260801-BASELINE001-R1` |
| taxonomía | diez clases de `DATA-NORM-ARC-010` |
| fuente de datos | evidencia histórica aprobada de solo lectura |
| registros modificados | `0` |
| objetos de base de datos modificados | `0` |
| ambientes consultados nuevamente | ninguno |
| frontera excluida | `vital` y sus decisiones internas |

La identidad lógica de cada caso se expresa como:

```text
policy_key
+ policy_version
+ entity_family
+ scope_coordinate
+ ordered_member_set
+ evidence_digest
```

Si cambian miembros, scope, versión de regla o evidencia, se crea una revisión vinculada; nunca se reescribe el caso anterior.

#### 3. Reconciliación de universos sin doble conteo

Los siguientes resultados responden a preguntas diferentes y no pueden sumarse:

| Corte aprobado | Resultado | Lectura correcta |
| --- | ---: | --- |
| entidades maestras prioritarias | 11 fuentes, 1.753 registros, 17 grupos y 94 filas agrupadas | corte inicial por familia y scope auditado |
| productos globales | 963 productos y 9 grupos | búsqueda transversal para distinguir candidatos y homónimos |
| catálogo PASS | 8 grupos y 16 filas | pares activo/inactivo por nombre |
| posiciones | 6 grupos y 72 filas | prueba negativa de scope jerárquico |
| UOM y políticas, corte amplio | 2.312 filas, 86 grupos y 186 filas agrupadas | 82 etiquetas con estructura distinta, 2 huellas UOM equivalentes y 2 políticas/versiones |
| enforcement activo reducido | 17 grupos activos | 1 grupo de producto y 16 grupos UOM; 14 de los UOM divergen estructuralmente |
| personas | 106 representaciones y 24 grupos por nombre | señal transversal; no identidad de persona |
| corpus de comparación | 26 grupos con `LOWER_TRIM` y 27 sin tildes | sensibilidad del algoritmo, no inventario adicional de entidades |
| helpers de slug | 26 grupos con `_vento_slugify` y 27 con `_navigation_slugify` | incompatibilidad de representaciones, no duplicados adicionales |

Por tanto:

1. `17 grupos activos` no significa que existan solo 17 colisiones en todo Vento OS;
2. los `86 grupos` de UOM/políticas contienen el corte reducido de 16 UOM activos, pero con otra elegibilidad;
3. los grupos de productos, personas, forma y slug se solapan con otros cortes y no se agregan en un total global;
4. el resultado canónico se reporta por corte, familia, versión y scope, nunca como una suma artificial.

#### 4. Taxonomía aplicada

| Clase | Uso en esta tarea | No autoriza |
| --- | --- | --- |
| `EXACT_VALUE_COLLISION` | señal exacta que todavía exige scope, estructura y ciclo | identidad o eliminación |
| `FORM_VARIANT_COLLISION` | diferencia limitada a caja o espacios | fusión |
| `SEARCH_KEY_COLLISION` | convergencia al ignorar tildes, signos o separación | unicidad |
| `PROBABLE_SAME_ENTITY` | compatibilidad fuerte que prioriza revisión | duplicado confirmado |
| `STRUCTURAL_DUPLICATE_CANDIDATE` | huella funcional compatible en el mismo contexto | sobreviviente automático |
| `LIFECYCLE_OR_VERSION_PAIR` | coexistencia asociada a actividad, versión o historia | borrar el registro inactivo |
| `CROSS_LAYER_HOMONYM` | nombre igual para roles funcionales distintos | consolidar capas |
| `LABEL_COLLISION_DIFFERENT_STRUCTURE` | etiqueta igual con cantidades, unidades o contextos distintos | identidad por etiqueta |
| `SCOPE_FALSE_POSITIVE` | agrupación causada por scope incompleto | corregir los datos legítimos |
| `AMBIGUOUS_COLLISION` | evidencia insuficiente o contradictoria | desempatar por score |

Ninguna clase, incluida `PROBABLE_SAME_ENTITY`, equivale a `CONFIRMED_DUPLICATE_DECISION`.

#### 5. Registro de colisiones de producto

| `collision_group_id` | Miembros observables | Señales y evidencia negativa | Clase | Disposición analítica | Continuidad |
| --- | --- | --- | --- | --- | --- |
| `COLL-003-PROD-001` | `Chai latte frio` / `Chai Latte Frío` | dos activos; tipo, categoría y unidad compatibles; SKU distintos y 66 dependencias potenciales | `PROBABLE_SAME_ENTITY` | `INSUFFICIENT_EVIDENCE` | resolver identidad y relaciones en 004 |
| `COLL-003-PROD-002` | `LATTE FRIO` / `Latte Frío` | dos activos; mismo tipo y unidad; categorías comerciales distintas y ambos en catálogo | `PROBABLE_SAME_ENTITY` | `STRUCTURAL_MODEL_REVIEW_REQUIRED` | decidir clasificación e identidad en 004 |
| `COLL-003-PROD-003` | `Maiz Dulce` / `Maíz Dulce` | uno activo y otro inactivo; misma categoría; unidades históricas `kg` y `g` | `LIFECYCLE_OR_VERSION_PAIR` | `LIFECYCLE_HISTORY_PRESERVED` | no bloquear por nombre; evaluar consolidación solo con plan |
| `COLL-003-PROD-004` | `Choco Bites` / `Chocobites` | dos activos; categorías distintas; posible denominación comercial | `AMBIGUOUS_COLLISION` | `INSUFFICIENT_EVIDENCE` | revisión humana en 004 |
| `COLL-003-PROD-005` | `Infusión Frutos Amarillos` | insumo abastecible frente a producto de venta | `CROSS_LAYER_HOMONYM` | `LEGITIMATE_HOMONYM` | conservar separados |
| `COLL-003-PROD-006` | `Infusión Frutos Rojos` | insumo con proveedor/UOM/remisión frente a producto de venta | `CROSS_LAYER_HOMONYM` | `LEGITIMATE_HOMONYM` | conservar separados |
| `COLL-003-PROD-007` | `Infusión Frutos Verdes` | insumo abastecible frente a producto de venta | `CROSS_LAYER_HOMONYM` | `LEGITIMATE_HOMONYM` | conservar separados |
| `COLL-003-PROD-008` | `Merengues` | preparación en gramos frente a venta por unidad | `CROSS_LAYER_HOMONYM` | `LEGITIMATE_HOMONYM` | conservar separados |
| `COLL-003-PROD-009` | `Zumo de Limón` | insumo consumido por recetas frente a preparación remitible | `CROSS_LAYER_HOMONYM` | `LEGITIMATE_HOMONYM` | conservar separados |

Resultado: nueve grupos identificados; cinco se cierran analíticamente como homónimos legítimos, uno conserva explícitamente su historia y tres permanecen abiertos para decisión estructural. Ningún producto fue fusionado, desactivado o seleccionado como sobreviviente.

#### 6. Catálogo PASS y ciclo de vida

| `collision_group_id` | Miembros observables | Clase | Disposición analítica |
| --- | --- | --- | --- |
| `COLL-003-CAT-001` | `Agua Hatsu` activo/inactivo | `LIFECYCLE_OR_VERSION_PAIR` | `LIFECYCLE_HISTORY_PRESERVED` |
| `COLL-003-CAT-002` | `Gaseosa Colombiana` activo/inactivo | `LIFECYCLE_OR_VERSION_PAIR` | `LIFECYCLE_HISTORY_PRESERVED` |
| `COLL-003-CAT-003` | `Gaseosa Manzana` activo/inactivo | `LIFECYCLE_OR_VERSION_PAIR` | `LIFECYCLE_HISTORY_PRESERVED` |
| `COLL-003-CAT-004` | `Soda Bretaña` activo/inactivo | `LIFECYCLE_OR_VERSION_PAIR` | `LIFECYCLE_HISTORY_PRESERVED` |
| `COLL-003-CAT-005` | `Te Hatsu Amarillo` activo/inactivo | `LIFECYCLE_OR_VERSION_PAIR` | `LIFECYCLE_HISTORY_PRESERVED` |
| `COLL-003-CAT-006` | `Te Hatsu Blanco` activo/inactivo | `LIFECYCLE_OR_VERSION_PAIR` | `LIFECYCLE_HISTORY_PRESERVED` |
| `COLL-003-CAT-007` | `Te Hatsu Rojo` activo/inactivo | `LIFECYCLE_OR_VERSION_PAIR` | `LIFECYCLE_HISTORY_PRESERVED` |
| `COLL-003-CAT-008` | `Te hatsu Negro` / `Te Hatsu Negro`, activo/inactivo | `LIFECYCLE_OR_VERSION_PAIR` con señal `FORM_VARIANT_COLLISION` | `LIFECYCLE_HISTORY_PRESERVED` |

Los ocho pares conservan sede, producto enlazado, código comercial, estado y vigencia. La variante visible del último par puede tratarse después como presentación, pero no cambia su identidad ni borra historia.

#### 7. Categoría operativa prioritaria

| `collision_group_id` | Miembros observables | Evidencia | Clase | Disposición analítica | Continuidad |
| --- | --- | --- | --- | --- | --- |
| `COLL-003-REM-001` | dos categorías activas `VÍVERES & BODEGA PRINCIPAL` | mismo nombre y sede; faltan expediente completo de relaciones, enrutamiento, consumidores y auditoría | `STRUCTURAL_DUPLICATE_CANDIDATE` | `INSUFFICIENT_EVIDENCE` | prioridad crítica en 004 |

El grupo no puede cerrarse por texto: deberá conciliar solicitudes, remisiones históricas, producto-sede-área-categoría, reglas de visibilidad y referencias consumidoras.

#### 8. Posiciones de inventario: falsos positivos confirmados

| `collision_group_id` | Etiqueta | Miembros | Evidencia negativa | Clase | Disposición |
| --- | --- | ---: | --- | --- | --- |
| `COLL-003-POS-001` | `Nivel 1` | 12 | padres y códigos distintos | `SCOPE_FALSE_POSITIVE` | `SCOPE_FALSE_POSITIVE_CONFIRMED` |
| `COLL-003-POS-002` | `Nivel 2` | 12 | padres y códigos distintos | `SCOPE_FALSE_POSITIVE` | `SCOPE_FALSE_POSITIVE_CONFIRMED` |
| `COLL-003-POS-003` | `Nivel 3` | 12 | padres y códigos distintos | `SCOPE_FALSE_POSITIVE` | `SCOPE_FALSE_POSITIVE_CONFIRMED` |
| `COLL-003-POS-004` | `Nivel 4` | 12 | padres y códigos distintos | `SCOPE_FALSE_POSITIVE` | `SCOPE_FALSE_POSITIVE_CONFIRMED` |
| `COLL-003-POS-005` | `Nivel 5` | 12 | padres y códigos distintos | `SCOPE_FALSE_POSITIVE` | `SCOPE_FALSE_POSITIVE_CONFIRMED` |
| `COLL-003-POS-006` | `Nivel 6` | 12 | padres y códigos distintos | `SCOPE_FALSE_POSITIVE` | `SCOPE_FALSE_POSITIVE_CONFIRMED` |

Los 72 registros se conservan. La corrección requerida pertenece al detector o a la política de scope:

```text
site_id
+ location_id
+ parent_position_id o hierarchical_path
+ code
```

`location_id + normalized_name` queda rechazado como coordenada de identidad o unicidad.

#### 9. UOM y políticas: clasificación por estructura

El corte amplio y el corte activo se registran como vistas del mismo universo, no como grupos adicionales:

| `collision_set_id` | Alcance | Resultado | Clase predominante | Disposición analítica |
| --- | --- | --- | --- | --- |
| `COLL-003-UOM-BROAD-DIFF` | 82 grupos, 178 filas | etiqueta igual con contexto, cantidad, unidad, fuente o default diferente | `LABEL_COLLISION_DIFFERENT_STRUCTURE` | `DISTINCT_IDENTITY` cuando la huella difiere; conservar por estructura |
| `COLL-003-UOM-ACTIVE-DIFF` | 14 de 16 grupos activos | divergencia estructural confirmada en el corte de enforcement | `LABEL_COLLISION_DIFFERENT_STRUCTURE` | `DISTINCT_IDENTITY`; excluir de deduplicación por etiqueta |
| `COLL-003-UOM-STRUCT-001` | `Queso Gouda`, 2 activos | `Empaque`, `un`, 10 unidades, contexto `general` | `STRUCTURAL_DUPLICATE_CANDIDATE` | `INSUFFICIENT_EVIDENCE`; prioridad alta en 004 |
| `COLL-003-UOM-STRUCT-002` | `Queso Mozzarella Tajado`, 2 activos | `Bloque`, `un`, 83 unidades, contexto `remission`; fuente/default difieren | `STRUCTURAL_DUPLICATE_CANDIDATE` | `STRUCTURAL_MODEL_REVIEW_REQUIRED`; prioridad alta en 004 |
| `COLL-003-POLICY-001-002` | 2 grupos, 4 filas, 2 activas | política actual frente a versión inactiva; código o vigencia diferente | `LIFECYCLE_OR_VERSION_PAIR` | `LIFECYCLE_HISTORY_PRESERVED` |

Ejemplos como `Bandeja 24 un`, `Pote 250 g`, `Paquete` de 100 frente a 30 unidades, 50 frente a 25 unidades, o `Pote 3 kg` con códigos de entrada distintos prueban que equivalencia textual o cuantitativa no basta. La coordenada mínima conserva:

```text
product_id + input_quantity + input_unit
+ stock_quantity + stock_unit + multiplier
+ context + source + supplier_when_applicable
+ status + validity_interval
```

#### 10. Personas e identidad laboral

| `collision_set_id` | Resultado | Clase | Disposición analítica | Restricción |
| --- | --- | --- | --- | --- |
| `COLL-003-PERSON-001-024` | 106 representaciones, 24 grupos por nombre; 23 entre fuentes y 24 con identificador secundario | `SEARCH_KEY_COLLISION` | `ESCALATED_IDENTITY_OR_LEGAL` | nunca fusionar por nombre |

Los grupos pueden representar la misma persona en `users`, `employees` e `staff_invitations`, o distintas invitaciones del mismo ciclo. La revisión solo puede usar, bajo finalidad y autorización, vínculos persistidos, `employee_id`, `auth_user_id`, documento, contacto, estado y procedencia. El documento normalizado sin cobertura material no se presenta como control activo.

No se copian nombres, documentos, correos, teléfonos ni identificadores sensibles al registro documental de esta tarea.

#### 11. Colisiones del algoritmo que no crean casos de entidad

| Señal | Resultado aprobado | Interpretación |
| --- | ---: | --- |
| `LOWER_TRIM` | 26 grupos | sensibilidad a caja y bordes |
| comparación sin tildes | 27 grupos / 54 filas en corpus de impacto | mayor recall y al menos un grupo adicional |
| `_vento_slugify` | 26 grupos | representación técnica no equivalente a identidad |
| `_navigation_slugify` | 27 grupos | comportamiento incompatible con el helper anterior |
| diferencias entre helpers | 2.730 exactas y 324 semánticas | deriva contractual potencial |

Estas señales se vinculan al grupo de entidad cuando comparten miembros y scope. No se abren como duplicados independientes ni se suman al total de colisiones empresariales.

#### 12. Expediente de evidencia y estado de cobertura

| Dimensión obligatoria | Cobertura actual | Brecha antes de confirmar duplicidad |
| --- | --- | --- |
| identidad técnica | identificadores y familia preservados por referencia al corte | verificar versión vigente de cada miembro |
| valores y representaciones | original, forma, búsqueda y señales documentadas | reproducir digest con implementación física futura |
| scope | disponible para familias auditadas | completar casos abiertos de producto, categoría y UOM |
| estructura | suficiente para falsos positivos y divergencias UOM | validar fuentes/defaults de candidatos estructurales |
| estado y tiempo | activo/inactivo e historia básica disponibles | confirmar supersesión y vigencia formal |
| procedencia | fuente propietaria conocida por familia | completar actor/importación para candidatos abiertos |
| relaciones entrantes | superficie de 420 constraints y 177 tablas; 66 dependencias potenciales de producto | inventario exhaustivo con y sin FK |
| relaciones salientes | familias consumidoras identificadas | fijar relaciones por miembro y versión |
| actividad y hechos | dominios de inventario, receta, compra, venta, catálogo y remisión señalados | conciliar conteos, saldos y hechos concretos |
| consumidores | aplicaciones y capas principales conocidas | confirmar jobs, cachés, JSON e integraciones externas |
| auditoría | linaje documental y cortes históricos conservados | anexar creación, cambios y razones por miembro |
| evidencia negativa | categorías, tipos, unidades, padres, contextos y estados conservados | completar para cada candidato abierto |

La ausencia de una FK nunca se interpreta como ausencia de dependencia.

#### 13. Cola cerrada para `DATA-NORM-TRANS-004`

| Prioridad | Casos | Razón de apertura | Resultado que deberá emitir 004 |
| --- | --- | --- | --- |
| crítica | `COLL-003-REM-001` | dos categorías activas exactas en la misma sede | identidad distinta o duplicado confirmado con expediente |
| alta | `COLL-003-PROD-001` | candidato probable con amplio radio relacional | decisión estructural y, si aplica, plan sin heurísticas |
| alta | `COLL-003-UOM-STRUCT-001` | huella UOM equivalente | confirmar procedencia, defaults, consumidores e historia |
| alta | `COLL-003-UOM-STRUCT-002` | huella compatible con diferencias de fuente/default | decidir identidad o cambio de modelo |
| media | `COLL-003-PROD-002` | categorías comerciales distintas | corregir clasificación o decidir identidad con autoridad |
| media | `COLL-003-PROD-004` | denominación potencialmente comercial y categorías distintas | resolver ambigüedad con evidencia de dominio |

`COLL-003-PROD-003`, los ocho pares PASS, los dos grupos de políticas, los cinco homónimos de producto, los 72 falsos positivos jerárquicos y los grupos UOM estructuralmente distintos quedan fuera de una fusión por texto. Una revisión posterior solo podrá reabrirlos mediante nueva evidencia y una revisión vinculada.

#### 14. Reglas de decisión aplicadas

1. Ningún score, frecuencia, antigüedad, actividad, completitud, número de relaciones, orden físico, primer resultado o calidad ortográfica elige identidad o sobreviviente.
2. Evidencia positiva y negativa se conservan simultáneamente.
3. Diferencias de tipo, categoría, unidad, padre, contexto, fuente, código o vigencia prevalecen sobre similitud textual cuando demuestran separación funcional.
4. Un par activo/inactivo se trata como historia hasta que exista evidencia autorizada de duplicidad.
5. Un nombre de persona solo genera señal; nunca identidad.
6. Un grupo de tres o más miembros conserva comparaciones por pares y no presume transitividad.
7. Evidencia conflictiva produce `INSUFFICIENT_EVIDENCE` o revisión estructural, nunca desempate silencioso.
8. Una disposición documental no activa una operación física.

#### 15. Bloqueos de seguridad e integridad

Quedan expresamente bloqueados:

- convertir `FORM_KEY`, `SEARCH_KEY`, slug o ranking en identificador;
- activar un índice o constraint sobre los 17 grupos activos sin resolución certificada;
- fusionar productos, personas o UOM por coincidencia visible;
- borrar inactivos por compartir nombre con un activo;
- reasignar relaciones, hechos, archivos, referencias externas o historial;
- elegir sobreviviente por heurística;
- exponer evidencia personal fuera del scope del revisor;
- extender decisiones a VITAL;
- ejecutar SQL remoto, DDL, DML, migraciones o backfills desde esta tarea.

#### 16. Trazabilidad de requisitos directos

| Requisito | Evidencia producida |
| --- | --- |
| `TREQ-DATA-119` | forma o alias no crea identidad; candidatos preservan relaciones y evidencia |
| `TREQ-DATA-135` | UOM se clasifica con componentes estructurados, no por etiqueta |
| `TREQ-DATA-141` | coincidencia y ranking quedan sin efectos estructurales |
| `TREQ-DATA-165` | se separan identidad, policy, representación, grupo y decisión |
| `TREQ-DATA-167` | cada familia declara scope global, de dominio, jerárquico, estructural, temporal o de descubrimiento |
| `TREQ-DATA-170` | pares de ciclo preservan estado, vigencia e historia |
| `TREQ-DATA-172` | todos los grupos usan una de las diez clases y ninguna confirma duplicidad |
| `TREQ-DATA-173` | matriz de doce dimensiones y brechas por expediente |
| `TREQ-DATA-174` | decisiones explicables; heurísticas y scores prohibidos |
| `TREQ-DATA-175` | 72 posiciones preservadas como falsos positivos de scope |
| `TREQ-DATA-176` | UOM y políticas comparan huella completa |
| `TREQ-DATA-177` | nueve grupos de producto distinguen candidatos, historia y homónimos |
| `TREQ-DATA-181` | cada caso o familia recibe una disposición analítica inmutable y supersedible |
| `TREQ-DATA-182` | ningún sobreviviente se selecciona sin paquete de autoridad y plan posterior |
| `TREQ-SUPABASE-1743` | la cola de 004 conserva scope, miembros, evidencia, referencias, historia y rollback como prerrequisitos |
| `TREQ-DATA-206` | corpus de colisiones queda disponible para modos preventivos posteriores; no se simula enforcement |

#### 17. Condiciones de salida

La tarea puede aprobarse porque:

- [x] existe un registro versionado y reproducible de colisiones;
- [x] los cortes se reconciliaron sin doble conteo;
- [x] nueve grupos de productos tienen clase y disposición;
- [x] ocho pares PASS conservan ciclo de vida;
- [x] la categoría de remisión permanece como candidato prioritario;
- [x] 72 posiciones se cerraron como falsos positivos sin tocar datos;
- [x] UOM y políticas se separaron por estructura, historia y candidatos reales;
- [x] personas se escalaron sin exponer evidencia sensible ni inferir identidad;
- [x] señales de forma, búsqueda y slug no se convirtieron en nuevos duplicados;
- [x] seis casos concretos forman la cola cerrada de resolución de 004;
- [x] las doce dimensiones de evidencia tienen cobertura y brechas explícitas;
- [x] dieciséis requisitos directos tienen trazabilidad;
- [x] no se ejecutó DDL, DML, consulta remota nueva, migración, fusión, desactivación o constraint;
- [x] `DATA-NORM-TRANS-004` permanece reservada.

#### 18. Alcance posterior reservado

Esta tarea no resuelve físicamente los seis casos abiertos. `DATA-NORM-TRANS-004` deberá emitir la decisión de duplicidad o separación, completar el paquete de autoridad, definir cualquier referencia o sobreviviente sin heurísticas y preparar el plan que posteriormente pueda ejecutar el BLOQUE R. Activación de unicidad, migraciones, backfills, reasignaciones y validación operativa permanecen fuera de E3.

#### 19. Continuidad

```text
TAREA CANÓNICAMENTE APROBADA
DATA-NORM-TRANS-003 — Identificar colisiones producidas por valores normalizados
        ↓
SIGUIENTE TAREA CANÓNICAMENTE APROBADA
DATA-NORM-TRANS-004 — Resolver duplicados antes de aplicar restricciones de unicidad
```
