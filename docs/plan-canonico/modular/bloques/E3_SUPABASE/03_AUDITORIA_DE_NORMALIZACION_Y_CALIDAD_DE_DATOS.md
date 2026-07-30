### AUDITORÍA DE NORMALIZACIÓN Y CALIDAD DE DATOS

### ✅ DATA-NORM-AUD-001 — Inventariar campos textuales y reglas actuales de normalización

**Estado:** APROBADA  
**Tarea anterior:** `SUPA-ARC-024 — Definir entornos local, pruebas, staging y producción` — APROBADA  
**Tarea siguiente:** `DATA-NORM-AUD-002 — Detectar inconsistencias de espacios, mayúsculas, Unicode, tildes, signos y conectores`  
**Tipo de tarea:** auditoría documental de datos y mecanismos vigentes; sin DDL, DML, migraciones, backfills, cambios de esquema, cambios de datos, creación de índices, modificación de constraints, modificación de triggers, cambios en aplicaciones ni despliegues

#### 1. Objetivo

Establecer el inventario base de campos de naturaleza textual y de los mecanismos actualmente observables que condicionan, transforman, comparan o restringen texto en el proyecto Supabase de Vento, separando hechos comprobados de clasificaciones provisionales y preservando las fronteras entre datos de Vento OS, infraestructura técnica privada y el producto independiente VITAL.

El resultado deberá permitir que `DATA-NORM-AUD-002` a `DATA-NORM-AUD-007` analicen calidad, excepciones, duplicados, transformaciones, consumidores e impacto sin volver a descubrir el universo inicial ni asumir que una regla local existente es automáticamente la política canónica futura.

#### 2. Artefacto producido

```text
DATA-TEXTUAL-FIELD-AND-NORMALIZATION-INVENTORY-001@1.0.0
```

| Propiedad                                                      |                         Valor observado |
| -------------------------------------------------------------- | --------------------------------------: |
| Fronteras de schema incluidas                                  |                                       9 |
| Columnas de naturaleza textual                                 |                                   1.543 |
| Columnas persistidas                                           |                                   1.200 |
| Columnas derivadas mediante vistas o vistas materializadas     |                                     343 |
| Columnas escalares de texto                                    |                                   1.088 |
| Columnas JSON o JSONB                                          |                                     402 |
| Columnas enum                                                  |                                      32 |
| Arreglos textuales                                             |                                      21 |
| Columnas `NOT NULL` dentro del universo textual                |                                     857 |
| Columnas con expresión por defecto o derivada                  |                                     295 |
| Columnas generadas físicamente                                 |                                       0 |
| Columnas con collation explícita distinta de la predeterminada |                                       0 |
| Columnas con comentario de catálogo                            |                                      25 |
| Fecha y hora de observación del inventario                     |      `2026-07-30T21:28:37.404593+00:00` |
| Proyecto observado                                             | `vento-os-dev` — `clzdpinthhtknkmefsxx` |

#### 3. Alcance y fronteras

El inventario cubre relaciones persistidas, particionadas, extranjeras, vistas y vistas materializadas dentro de los siguientes schemas:

| Schema        | Frontera aplicada           | Tratamiento en esta tarea                                                                                                       |
| ------------- | --------------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| `app_private` | `VENTO_PRIVATE_TECHNICAL`   | inventariar como infraestructura privada gobernada por Vento; no tratarla como dominio empresarial                              |
| `club`        | `VENTO_OS_CURRENT`          | inventariar estado actual sin confirmar que el schema sea la frontera objetivo                                                  |
| `pass`        | `VENTO_OS_CURRENT`          | inventariar estado actual sin transferir propiedad funcional por ubicación                                                      |
| `payments`    | `VENTO_OS_CURRENT`          | inventariar estado actual sin convertirlo en dominio definitivo                                                                 |
| `pos`         | `VENTO_OS_CURRENT`          | inventariar estado actual y conservar la distinción frente al POS externo                                                       |
| `public`      | `VENTO_OS_CURRENT`          | inventariar el contenedor actual multi-capacidad sin legitimarlo como destino universal                                         |
| `talento`     | `VENTO_OS_CURRENT`          | inventariar estado actual sin anticipar la decisión de aislamiento o adopción                                                   |
| `viso`        | `VENTO_OS_CURRENT`          | inventariar estado actual sin inferir propiedad por aplicación                                                                  |
| `vital`       | `SEPARATE_PRODUCT_BOUNDARY` | contabilizar por coexistencia física, pero mantenerlo separado de Vento OS y de cualquier decisión de normalización transversal |

Quedan fuera de la clasificación empresarial los schemas administrados por PostgreSQL, Supabase o extensiones. Sus objetos podrán ser considerados posteriormente cuando una integración soportada afecte texto de Vento, pero no forman parte del universo empresarial inventariado por esta tarea.

#### 4. Definición operativa de campo textual

Para este inventario, una columna se considera de naturaleza textual cuando su tipo físico pertenece a una de estas clases:

| Clase observada   | Criterio físico                                                             | Consecuencia para tareas posteriores                                                                     |
| ----------------- | --------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------- |
| `SCALAR_TEXT`     | `text`, `varchar`, `bpchar`, `citext`, `name` o dominio textual equivalente | requiere clasificación semántica campo por campo                                                         |
| `STRUCTURED_JSON` | `json` o `jsonb`                                                            | no puede normalizarse como una cadena única; debe analizarse por clave, origen y contrato                |
| `ENUM_CODE`       | enum PostgreSQL                                                             | se presume identificador técnico hasta demostrar lo contrario; no admite corrección ortográfica genérica |
| `TEXT_ARRAY`      | arreglo cuyo elemento es textual                                            | requiere política por elemento y preservación del orden o semántica del conjunto                         |
| `ENUM_ARRAY`      | arreglo cuyo elemento es enum                                               | se trata como conjunto de identificadores técnicos y no como texto mostrado                              |

La inclusión física en este inventario no autoriza transformar el valor. La política futura dependerá del propósito empresarial y técnico del campo.

#### 5. Inventario cuantitativo por schema

| Schema        | Total textual | Persistidas | Derivadas | `NOT NULL` | Con expresión | Comentadas |
| ------------- | ------------: | ----------: | --------: | ---------: | ------------: | ---------: |
| `app_private` |            12 |           9 |         3 |          8 |             1 |          0 |
| `club`        |            45 |          45 |         0 |         32 |            10 |          0 |
| `pass`        |            23 |          23 |         0 |         16 |             5 |          0 |
| `payments`    |            26 |          26 |         0 |         15 |             3 |          0 |
| `pos`         |            61 |          61 |         0 |         38 |             8 |          0 |
| `public`      |         1.275 |         937 |       338 |        661 |           252 |         23 |
| `talento`     |            48 |          46 |         2 |         26 |             8 |          0 |
| `viso`        |            24 |          24 |         0 |         20 |             4 |          0 |
| `vital`       |            29 |          29 |         0 |         21 |             4 |          2 |
| **Total**     |     **1.543** |   **1.200** |   **343** |    **857** |       **295** |     **25** |

La concentración de 1.275 columnas en `public` confirma que la auditoría posterior no puede aplicar una regla única por schema. Deberá clasificar por dominio, entidad, campo, finalidad, fuente y consumidor.

#### 6. Clasificación semántica provisional

La clasificación siguiente se obtuvo exclusivamente como señal de trabajo a partir de nombres de columnas. No constituye una decisión canónica ni sustituye la revisión campo por campo:

| Clasificación provisional              | Columnas | Interpretación permitida                                                                                                                           |
| -------------------------------------- | -------: | -------------------------------------------------------------------------------------------------------------------------------------------------- |
| `IDENTIFICADOR_TECNICO_CANDIDATO`      |      538 | código, clave, estado, tipo, referencia, documento, correo, teléfono, ruta, URL u otro valor que podría requerir conservación o reglas específicas |
| `IDENTIFICADOR_TECNICO_ENUM`           |       32 | enum físico; tratamiento técnico hasta revisión expresa                                                                                            |
| `VALOR_MOSTRADO_CANDIDATO`             |       59 | nombre, título, etiqueta, marca o denominación potencialmente visible                                                                              |
| `VALOR_BUSQUEDA_COMPARACION_CANDIDATO` |       18 | slug, valor normalizado, clave de búsqueda, huella o representación comparativa potencial                                                          |
| `VALOR_EXTERNO_ORIGINAL_CANDIDATO`     |       10 | valor asociado por nombre a proveedor, fuente, importación, payload o referencia externa                                                           |
| `TEXTO_LIBRE_CANDIDATO`                |       46 | descripción, nota, comentario, mensaje, motivo, instrucciones o cuerpo potencialmente libre                                                        |
| `ESTRUCTURA_JSON_POR_REVISAR`          |      402 | estructura que requiere inspección de claves y contratos antes de clasificar sus contenidos                                                        |
| `ARREGLO_TEXTUAL_POR_REVISAR`          |       21 | colección textual que requiere política por elemento                                                                                               |
| `SIN_CLASIFICACION_SEMANTICA`          |      417 | campo cuyo nombre no permite determinar responsablemente su propósito                                                                              |

Reglas obligatorias de interpretación:

1. una coincidencia por nombre no convierte una columna en miembro definitivo de la clase sugerida;
2. `email`, `phone`, `document_number`, `sku`, `code`, `slug`, rutas y referencias externas no se corrigen ortográficamente por defecto;
3. un campo JSON no hereda una única política para todas sus claves;
4. una vista no crea una nueva fuente de verdad ni autoriza normalizar el dato de origen;
5. VITAL no hereda decisiones de Vento OS por compartir proyecto físico;
6. la clasificación definitiva pertenece a `DATA-NORM-ARC-001` y `DATA-NORM-ARC-002`, después de completar la auditoría especializada.

#### 7. Distinciones obligatorias para el inventario

Cada campo deberá poder terminar clasificado en una o más representaciones explícitamente relacionadas, sin confundirlas:

| Representación                 | Definición                                                            | Regla de inventario                                                                                                            |
| ------------------------------ | --------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| `VALOR_MOSTRADO`               | texto empresarial visible para personas                               | conservar forma visible, idioma, signos, mayúsculas, marcas y excepciones hasta política aprobada                              |
| `VALOR_DE_BUSQUEDA`            | representación tolerante para búsqueda o comparación                  | identificar si existe físicamente, se deriva en consulta o se calcula en consumidor; no asumir que reemplaza al valor mostrado |
| `VALOR_EXTERNO_ORIGINAL`       | dato recibido desde integración o importación                         | preservar procedencia y valor original cuando la trazabilidad lo exija; una copia transformada deberá quedar diferenciada      |
| `IDENTIFICADOR_TECNICO`        | código que no debe corregirse ortográficamente                        | aplicar únicamente validaciones de formato, dominio, unicidad o equivalencia explícitamente aprobadas                          |
| `TEXTO_LIBRE`                  | contenido humano no destinado a identidad ni comparación determinista | evitar correcciones destructivas automáticas y conservar autoría e historial cuando corresponda                                |
| `ESTRUCTURA_TEXTUAL_COMPUESTA` | JSON, arreglo o estructura con varias claves textuales                | clasificar cada componente por contrato y no por el tipo contenedor completo                                                   |

Una misma entidad podrá conservar un valor mostrado y una representación separada de búsqueda. La coincidencia entre representaciones normalizadas no autoriza fusionar registros.

#### 8. Reglas actuales observables en PostgreSQL

La búsqueda estructural de expresiones relacionadas con `lower`, `upper`, `trim`, `btrim`, `unaccent`, `normalize`, `regexp_replace`, `translate`, `initcap`, `citext` o `slug` encontró:

| Mecanismo observado                                                   | Cantidad | Alcance comprobado                                                                                                     |
| --------------------------------------------------------------------- | -------: | ---------------------------------------------------------------------------------------------------------------------- |
| `CHECK` con operaciones textuales                                     |      100 | principalmente rechazo de valores vacíos después de `trim` o `btrim`; incluye algunas reglas de formato o equivalencia |
| Expresión por defecto o derivada con normalización                    |        1 | `public.employees.document_number_normalized` elimina caracteres no alfanuméricos mediante `regexp_replace`            |
| Índices con comparación o representación textual                      |       20 | unicidad o búsqueda mediante `lower`, `trim`, `btrim`, slugs o columnas normalizadas                                   |
| Triggers cuyas funciones contienen operaciones textuales coincidentes |       12 | señal de posible transformación o validación; su comportamiento detallado queda reservado a `DATA-NORM-AUD-006`        |

No se observaron columnas generadas físicamente ni collations explícitas por columna dentro del universo inventariado.

#### 9. Familias de reglas actuales

| Familia                                | Ejemplos observados                                                                            | Evaluación de esta tarea                                                                     |
| -------------------------------------- | ---------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- |
| no vacío después de recorte            | `length(btrim(name)) > 0`, `trim(value) <> ''`                                                 | regla de presencia; no equivale a normalización ortográfica ni a almacenamiento recortado    |
| comparación sin distinguir mayúsculas  | índices sobre `lower(trim(value))`                                                             | regla local de búsqueda o unicidad; no confirma política transversal                         |
| identificador derivado                 | `document_number_normalized` mediante eliminación de caracteres no alfanuméricos               | representación separada de identidad; debe preservarse su relación con el valor original     |
| formato técnico                        | validación de SKU mediante `upper(trim(sku))` y expresión regular                              | validación de identificador; no autoriza modificar nombres empresariales                     |
| slug o clave estable                   | índices y constraints sobre `slug`, `page_slug`, `block_key` o claves equivalentes             | identificadores técnicos cuya estabilidad y procedencia deben revisarse                      |
| equivalencia de unidades o códigos     | comparaciones con `lower(btrim(unit_code))`                                                    | regla local para códigos; requiere inventariar productores y consumidores antes de cambiarla |
| transformación o validación en trigger | funciones vinculadas con productos, lotes, políticas, dispositivos, mensajes y otras entidades | presencia comprobada; semántica exacta reservada a `DATA-NORM-AUD-006`                       |

#### 10. Hallazgos

| ID               | Hallazgo                                                                                  | Evidencia resumida                                                                       | Consecuencia propietaria                                                        |
| ---------------- | ----------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- |
| `DN-AUD-001-H01` | el universo textual es amplio y heterogéneo                                               | 1.543 columnas en nueve fronteras, con 1.088 escalares, 402 JSON, 32 enums y 21 arreglos | prohibir reglas globales por tipo o schema sin clasificación semántica          |
| `DN-AUD-001-H02` | `public` concentra la mayoría del universo observado                                      | 1.275 columnas, 937 persistidas y 338 derivadas                                          | clasificar por dominio y fuente de verdad; no legitimar `public` como dominio   |
| `DN-AUD-001-H03` | existen reglas locales de recorte y comparación, pero no una política transversal         | 100 checks y 20 índices con operaciones textuales                                        | auditar inconsistencias y convergencia antes de diseñar normalización canónica  |
| `DN-AUD-001-H04` | la mayoría de expresiones textuales no están documentadas mediante comentarios de columna | solo 25 columnas comentadas dentro del universo textual                                  | no inferir intención únicamente desde DDL; consultar contratos y consumidores   |
| `DN-AUD-001-H05` | existen representaciones derivadas y comparaciones normalizadas puntuales                 | `document_number_normalized`, índices sobre `lower(trim(...))`, slugs y claves           | separar valor original, valor mostrado y representación comparativa             |
| `DN-AUD-001-H06` | la semántica no puede resolverse solo por nomenclatura                                    | 417 columnas sin clasificación provisional y 402 estructuras JSON                        | reservar clasificación definitiva y revisión de claves para tareas propietarias |
| `DN-AUD-001-H07` | VITAL comparte infraestructura pero no frontera funcional                                 | 29 columnas textuales observadas en `vital`                                              | excluirlas de decisiones transversales de Vento OS salvo contrato explícito     |
| `DN-AUD-001-H08` | los mecanismos en triggers requieren auditoría específica                                 | 12 triggers con funciones que contienen señales textuales                                | resolver función, momento, idempotencia y consumidores en `DATA-NORM-AUD-006`   |

#### 11. Riesgos y brechas vinculadas

| ID               | Riesgo o brecha                                                                             | Estado después de esta tarea                                    | Tarea propietaria de resolución                               |
| ---------------- | ------------------------------------------------------------------------------------------- | --------------------------------------------------------------- | ------------------------------------------------------------- |
| `DN-AUD-001-R01` | aplicar corrección ortográfica a identificadores técnicos                                   | identificado; no mitigado                                       | `DATA-NORM-AUD-003`; `DATA-NORM-ARC-002`; `DATA-NORM-ARC-005` |
| `DN-AUD-001-R02` | reemplazar valores mostrados por representaciones de búsqueda                               | identificado; no mitigado                                       | `DATA-NORM-ARC-008`; `DATA-NORM-ARC-009`                      |
| `DN-AUD-001-R03` | asumir equivalencia semántica por `lower`, `trim` o slug                                    | identificado; no mitigado                                       | `DATA-NORM-AUD-004`; `DATA-NORM-ARC-010`                      |
| `DN-AUD-001-R04` | transformar JSON o arreglos sin contrato por clave o elemento                               | identificado; no mitigado                                       | `DATA-NORM-AUD-006`; `DATA-NORM-ARC-001`; `DATA-NORM-ARC-002` |
| `DN-AUD-001-R05` | cambiar reglas locales sin conocer aplicaciones, RPC, triggers o integraciones consumidoras | identificado; no mitigado                                       | `DATA-NORM-AUD-006`; `DATA-NORM-AUD-007`                      |
| `DN-AUD-001-R06` | extender decisiones de Vento OS a VITAL por coexistencia física                             | restringido documentalmente; pendiente de controles posteriores | `SUPA-ARC-025`; contratos de integración aplicables           |
| `DN-AUD-001-R07` | confundir un check de no vacío con almacenamiento ya normalizado                            | identificado; no mitigado                                       | `DATA-NORM-AUD-002`; `DATA-NORM-AUD-005`                      |

Ningún riesgo se considera aceptado, mitigado o cerrado por este inventario.

#### 12. Decisiones reservadas

Esta tarea no decide:

- qué campos admiten capitalización, recorte, eliminación de signos o corrección ortográfica;
- qué marcas, siglas, unidades, razones sociales o nombres legales constituyen excepciones;
- qué valores actuales contienen inconsistencias o duplicados;
- qué transformaciones son deterministas, dependen de diccionario o requieren revisión humana;
- qué funciones, triggers, aplicaciones o procesos externos modifican cada campo;
- qué índices, constraints, relaciones, integraciones o búsquedas resultarían afectados;
- cuál es la política canónica por dominio, entidad y campo;
- qué capas ejecutarán cada regla futura;
- qué datos deberán corregirse, backfillearse, fusionarse o conservarse;
- ninguna modificación física en Supabase.

Estas decisiones permanecen en `DATA-NORM-AUD-002` a `DATA-NORM-AUD-007`, `DATA-NORM-ARC-001` a `DATA-NORM-ARC-012` y las tareas de transición correspondientes.

#### 13. Criterios de integridad del inventario

El inventario se considera íntegro para esta etapa cuando:

1. contabiliza por separado relaciones persistidas y derivadas;
2. conserva la frontera técnica de `app_private` y la separación de `vital`;
3. clasifica físicamente texto escalar, JSON, enum y arreglos sin confundir tipo con finalidad;
4. distingue hechos observados de candidatos inferidos por nombre;
5. registra mecanismos de presencia, comparación, formato, derivación e intervención por trigger sin declararlos política objetivo;
6. preserva la distinción entre valor mostrado, valor de búsqueda, valor externo original e identificador técnico;
7. no autoriza fusiones ni modificaciones de datos;
8. asigna cada brecha a una tarea posterior concreta.

#### 14. Requisitos de prueba

**NO GENERA REQUISITOS DE PRUEBA.**

Justificación: esta tarea inventaría y clasifica evidencia del estado actual, pero no crea, modifica, difiere, descarta ni vuelve obsoleto ningún comportamiento exigible del sistema. Las reglas verificables de normalización, conservación, comparación, unicidad, revisión humana, integración y transición se definirán en las tareas arquitectónicas y de transición propietarias. Crear requisitos antes de esas decisiones convertiría observaciones locales en contratos prematuros.

#### 15. Continuidad

```text
ÚLTIMA TAREA APROBADA
SUPA-ARC-024 — Definir entornos local, pruebas, staging y producción
        ↓
TAREA ACTUAL APROBADA
DATA-NORM-AUD-001 — Inventariar campos textuales y reglas actuales de normalización
        ↓
SIGUIENTE TAREA RESERVADA
DATA-NORM-AUD-002 — Detectar inconsistencias de espacios, mayúsculas, Unicode, tildes, signos y conectores
```


### ✅ DATA-NORM-AUD-002 — Detectar inconsistencias de espacios, mayúsculas, Unicode, tildes, signos y conectores

**Estado:** APROBADA  
**Tarea anterior:** `DATA-NORM-AUD-001 — Inventariar campos textuales y reglas actuales de normalización` — APROBADA  
**Tarea siguiente:** `DATA-NORM-AUD-003 — Identificar marcas, siglas, unidades, razones sociales y excepciones que no admiten transformación genérica`  
**Tipo de tarea:** auditoría documental de calidad de datos textuales; sin DDL, DML, migraciones, backfills, correcciones, fusiones, cambios de esquema, cambios de datos, modificación de constraints, modificación de índices, modificación de triggers, cambios en aplicaciones ni despliegues

#### 1. Objetivo

Detectar y clasificar inconsistencias actualmente observables en valores textuales de Vento OS relacionadas con espacios, capitalización, composición Unicode, tildes, signos de puntuación y conectores lingüísticos, sin transformar datos ni convertir coincidencias normalizadas en decisiones automáticas de corrección o fusión.

La tarea utiliza como base el universo inventariado en `DATA-NORM-AUD-001`, conserva la separación entre valor mostrado, valor de búsqueda, valor externo original e identificador técnico, y produce evidencia para `DATA-NORM-AUD-003` a `DATA-NORM-AUD-007` y para las decisiones arquitectónicas posteriores.

#### 2. Artefacto producido

```text
DATA-TEXTUAL-INCONSISTENCY-AUDIT-002@1.0.0
```

El artefacto registra dos cortes complementarios de solo lectura sobre el proyecto `vento-os-dev`:

| Corte                              | Propósito                                                                                                  | Columnas observadas | Valores observados |
| ---------------------------------- | ---------------------------------------------------------------------------------------------------------- | ------------------: | -----------------: |
| diagnóstico de forma visible       | detectar espacios, Unicode, capitalización y puntuación en campos humanos prioritarios                     |                  31 |              5.750 |
| comparación normalizada controlada | detectar variantes por capitalización, espacios, tildes y signos en campos de identidad, nombre o etiqueta |                  16 |              4.567 |
| conectores lingüísticos            | buscar variantes por conjunciones y omisión de artículos o preposiciones en nombres prioritarios           |                   6 |              1.590 |

Estos cortes son evidencia de auditoría y no sustituyen la clasificación exhaustiva campo por campo del universo textual completo.

#### 3. Alcance y fronteras

La auditoría incluye valores persistidos pertenecientes a Vento OS en los schemas actuales `public` y `pass`, priorizando campos de nombres, etiquetas, descripciones, categorías, personas, proveedores, sedes, áreas, ubicaciones, presentaciones, permisos, navegación y catálogo comercial.

Se mantienen las siguientes restricciones:

1. `app_private` conserva su tratamiento de infraestructura técnica privada;
2. `vital` permanece fuera de las decisiones transversales de Vento OS por ser una frontera de producto separada;
3. JSON, arreglos, enums e identificadores técnicos no se someten a corrección genérica en esta tarea;
4. correos, teléfonos, documentos, SKU, códigos, slugs, rutas, URL y referencias externas requieren reglas específicas y no se interpretan como texto mostrado;
5. una vista o representación derivada no crea una nueva fuente de verdad;
6. ningún hallazgo autoriza modificar valores, fusionar registros ni cambiar restricciones de base de datos.

#### 4. Taxonomía de inconsistencias observada

| Código                      | Clase                                                  | Criterio de detección                                                                | Interpretación permitida                                                                         |
| --------------------------- | ------------------------------------------------------ | ------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------ |
| `EDGE_SPACE`                | espacio inicial o final                                | el valor difiere de `btrim(value)`                                                   | inconsistencia formal candidata; debe revisarse origen y consumidor                              |
| `REPEATED_SPACE`            | dos o más espacios o separadores consecutivos          | patrón de espacio repetido                                                           | inconsistencia candidata; los saltos de línea legítimos deben separarse de espacios accidentales |
| `NONSTANDARD_SPACE`         | espacio no separable u otro espacio Unicode especial   | presencia de U+00A0, U+2007 o U+202F                                                 | posible contaminación de copia o integración                                                     |
| `INVISIBLE_CHAR`            | carácter Unicode invisible                             | presencia de U+200B, U+200C, U+200D o U+FEFF                                         | posible contaminación invisible; no puede corregirse sin revisar procedencia                     |
| `NON_NFC`                   | composición Unicode no canónica                        | `normalize(value, NFC) <> value`                                                     | diferencia de representación binaria potencialmente relevante para comparación                   |
| `CASE_VARIANT_GROUP`        | variantes por capitalización                           | varios valores distintos comparten clave `lower + trim + compactación de espacios`   | posible divergencia de presentación o duplicidad; no implica identidad semántica                 |
| `ACCENT_VARIANT_GROUP`      | variantes por tildes o diacríticos                     | varios valores comparten clave sin acentos                                           | posible error ortográfico o diferencia legítima; requiere diccionario o revisión humana          |
| `SIGN_VARIANT_GROUP`        | variantes por signos o separación                      | varios valores comparten clave alfanumérica sin signos                               | posible equivalencia formal; no autoriza fusión                                                  |
| `SPACE_BEFORE_PUNCTUATION`  | espacio antes de signo                                 | espacio seguido de coma, punto, punto y coma, dos puntos, interrogación o admiración | inconsistencia formal candidata                                                                  |
| `PUNCTUATION_WITHOUT_SPACE` | signo sin separación posterior                         | puntuación seguida inmediatamente de texto                                           | inconsistencia candidata; excluye formatos técnicos y numéricos legítimos                        |
| `CONNECTOR_VARIANT_GROUP`   | variantes por `&`, `y`, `e`, artículos o preposiciones | coincidencia después de normalizar conectores                                        | señal de revisión; no reemplaza análisis lingüístico ni empresarial                              |

#### 5. Resultados cuantitativos del diagnóstico de forma visible

| Hallazgo                                      | Valores detectados |
| --------------------------------------------- | -----------------: |
| espacios iniciales o finales                  |                  4 |
| espacios o separadores repetidos              |                 32 |
| espacios Unicode no estándar                  |                  0 |
| caracteres invisibles                         |                  0 |
| valores fuera de NFC                          |                  0 |
| valores completamente en mayúsculas           |                246 |
| valores completamente en minúsculas           |                 17 |
| valores con mezcla de mayúsculas y minúsculas |              5.428 |
| espacio antes de puntuación                   |                  1 |
| puntuación sin separación posterior           |                  9 |

Las cifras de capitalización describen forma observada y no significan por sí solas inconsistencia. Las mayúsculas pueden ser legítimas en marcas, siglas, unidades, razones sociales, códigos o estilos de interfaz. Su clasificación definitiva corresponde a `DATA-NORM-AUD-003` y `DATA-NORM-AUD-005`.

#### 6. Resultados de comparación normalizada controlada

| Tipo de agrupación                                 | Grupos detectados |
| -------------------------------------------------- | ----------------: |
| variantes por capitalización o espacios            |                23 |
| variantes por tildes o diacríticos                 |                 4 |
| variantes por signos o separación                  |                 3 |
| variantes por conjunciones `&`, `y` o `e`          |                 0 |
| variantes por omisión de artículos o preposiciones |                 0 |

La ausencia de grupos de conectores dentro del corte observado no demuestra que el problema no exista en otros campos, JSON, importaciones, fuentes externas o datos todavía no clasificados.

#### 7. Evidencia representativa

| ID               | Clase                          | Entidad y campo                                                  | Variantes o valor observado                 | Evaluación                                                                                            |
| ---------------- | ------------------------------ | ---------------------------------------------------------------- | ------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| `DN-AUD-002-E01` | espacio final y capitalización | `public.product_uom_profiles.label`                              | `Bolsa`, `BOLSA`, `BOLSA `                  | tres formas que comparten clave comparativa; requiere definir presentación canónica y origen          |
| `DN-AUD-002-E02` | espacio final y repetido       | `public.product_uom_profiles.label`                              | `Unidad`, `UNIDAD`, `UNIDAD  `              | divergencia formal confirmada; no debe limpiarse sin revisar productores y consumidores               |
| `DN-AUD-002-E03` | capitalización                 | `public.product_uom_profiles.label`                              | `Bolsa 1 kg`, `BOLSA 1 kg`                  | misma clave comparativa con presentación distinta                                                     |
| `DN-AUD-002-E04` | espacio repetido               | `public.products.name`                                           | `Babka de Queso  Dulce`                     | doble espacio interno candidato a corrección determinista                                             |
| `DN-AUD-002-E05` | espacio repetido               | `public.users.full_name`                                         | `Carlos  Ibarra`                            | doble espacio en identidad visible; requiere preservar valor original y revisar fuente                |
| `DN-AUD-002-E06` | espacio repetido               | `pass.catalog_items.name`                                        | `Masa Madre  de Cacao y Nuez`               | doble espacio interno en catálogo mostrado                                                            |
| `DN-AUD-002-E07` | puntuación sin espacio         | `public.products.description` y `pass.catalog_items.description` | `champiñones,tomates cherry`                | inconsistencia replicada entre catálogo operativo y comercial; requiere determinar fuente propietaria |
| `DN-AUD-002-E08` | espacio antes de puntuación    | `public.suppliers.address`                                       | fragmento con `CÚCUTA , NORTE DE SANTANDER` | señal formal en dato de proveedor; puede provenir de importación externa                              |
| `DN-AUD-002-E09` | tildes y capitalización        | `public.products.name` y `pass.catalog_items.name`               | `Chai latte frio`, `Chai Latte Frío`        | variante ortográfica y de presentación en dos superficies relacionadas                                |
| `DN-AUD-002-E10` | tilde                          | `public.products.name`                                           | `Maiz Dulce`, `Maíz Dulce`                  | posible duplicidad ortográfica; no autoriza fusión sin revisar relaciones                             |
| `DN-AUD-002-E11` | tilde y capitalización         | `public.products.name`                                           | `LATTE FRIO`, `Latte Frío`                  | diferencia formal múltiple que exige clasificación de marca, producto y presentación                  |
| `DN-AUD-002-E12` | signo o separación             | `public.product_uom_profiles.label`                              | `Bolsa de 1.100 ml`, `Bolsa de 1100 ml`     | el punto puede ser separador de miles o convención de presentación; no admite eliminación genérica    |
| `DN-AUD-002-E13` | separación léxica              | `public.products.name`                                           | `Choco Bites`, `Chocobites`                 | posible marca o denominación distinta; requiere revisión en `DATA-NORM-AUD-003`                       |
| `DN-AUD-002-E14` | capitalización de categoría    | `pass.catalog_items.category_label`                              | `Bebidas calientes`, `Bebidas Calientes`    | divergencia de estilo visible dentro del mismo campo                                                  |
| `DN-AUD-002-E15` | doble espacio y capitalización | `pass.catalog_items.name`                                        | `Torta de  chocolate`, `Torta de Chocolate` | dos diferencias formales coincidentes; posible duplicidad semántica pendiente de `DATA-NORM-AUD-004`  |

Los ejemplos constituyen evidencia resumida y no una orden de corrección.

#### 8. Hallazgos

| ID               | Hallazgo                                                                         | Evidencia                                                                     | Consecuencia propietaria                                                                     |
| ---------------- | -------------------------------------------------------------------------------- | ----------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- |
| `DN-AUD-002-H01` | existen espacios accidentales en valores visibles                                | 4 valores con espacios de borde y 32 con separadores repetidos                | clasificar cuáles son deterministas en `DATA-NORM-AUD-005`                                   |
| `DN-AUD-002-H02` | la capitalización no es uniforme en nombres y etiquetas                          | 23 grupos comparables con variantes de mayúsculas o espacios                  | identificar marcas, siglas y excepciones antes de definir estilo canónico                    |
| `DN-AUD-002-H03` | existen variantes ortográficas por tildes                                        | 4 grupos comprobados                                                          | separar error corregible, marca, nombre propio y valor externo original                      |
| `DN-AUD-002-H04` | existen variantes por signos o separación léxica                                 | 3 grupos comprobados                                                          | revisar unidades, números, marcas y denominaciones antes de transformar                      |
| `DN-AUD-002-H05` | hay defectos puntuales de puntuación en descripciones y direcciones              | 1 caso con espacio previo y 9 casos sin separación posterior                  | definir reglas distintas para texto libre, dirección e identificador técnico                 |
| `DN-AUD-002-H06` | no se detectó contaminación Unicode en los campos prioritarios observados        | 0 espacios especiales, 0 caracteres invisibles y 0 valores fuera de NFC       | mantener control preventivo sin declarar saneado el universo completo                        |
| `DN-AUD-002-H07` | no se detectaron variantes de conectores en el corte prioritario                 | 0 grupos por conjunción u omisión de artículos o preposiciones                | ampliar revisión a fuentes externas, JSON y campos no clasificados antes de cerrar la brecha |
| `DN-AUD-002-H08` | algunas divergencias aparecen en más de una representación comercial u operativa | descripción de producto replicada en `public.products` y `pass.catalog_items` | resolver fuente de verdad y mecanismo de propagación antes de corregir                       |
| `DN-AUD-002-H09` | una coincidencia normalizada puede agrupar valores empresarialmente distintos    | marcas, unidades, razones sociales y nombres con signos                       | prohibir fusiones automáticas por clave comparativa                                          |

#### 9. Riesgos y brechas vinculadas

| ID               | Riesgo o brecha                                                                                           | Estado después de esta tarea               | Tarea propietaria de resolución                                                       |
| ---------------- | --------------------------------------------------------------------------------------------------------- | ------------------------------------------ | ------------------------------------------------------------------------------------- |
| `DN-AUD-002-R01` | recortar o compactar espacios en identificadores, direcciones o valores externos sin revisar semántica    | identificado; no mitigado                  | `DATA-NORM-AUD-003`; `DATA-NORM-AUD-005`; `DATA-NORM-ARC-002`                         |
| `DN-AUD-002-R02` | convertir todos los nombres a título, mayúsculas o minúsculas y degradar marcas, siglas o nombres legales | identificado; no mitigado                  | `DATA-NORM-AUD-003`; `DATA-NORM-ARC-005`; `DATA-NORM-ARC-006`                         |
| `DN-AUD-002-R03` | eliminar tildes del valor mostrado porque la búsqueda use una representación tolerante                    | identificado; no mitigado                  | `DATA-NORM-ARC-008`; `DATA-NORM-ARC-009`                                              |
| `DN-AUD-002-R04` | eliminar signos con significado en unidades, cantidades, direcciones, marcas o referencias                | identificado; no mitigado                  | `DATA-NORM-AUD-003`; `DATA-NORM-AUD-005`                                              |
| `DN-AUD-002-R05` | fusionar registros por coincidencia después de `lower`, `unaccent`, recorte o eliminación de signos       | identificado; prohibido por esta auditoría | `DATA-NORM-AUD-004`; `DATA-NORM-ARC-010`                                              |
| `DN-AUD-002-R06` | corregir una copia derivada y mantener divergente la fuente propietaria                                   | identificado; no mitigado                  | `DATA-NORM-AUD-006`; `DATA-NORM-AUD-007`; arquitectura de fuentes de verdad aplicable |
| `DN-AUD-002-R07` | concluir que no existen problemas Unicode o de conectores porque no aparecieron en el corte prioritario   | identificado; no mitigado                  | `DATA-NORM-AUD-006`; `DATA-NORM-AUD-007`                                              |

Ningún riesgo se considera aceptado, mitigado o cerrado por esta tarea.

#### 10. Reglas de interpretación

1. una diferencia formal detectada no equivale automáticamente a error empresarial;
2. una coincidencia después de recorte, minúsculas, eliminación de tildes o signos no demuestra identidad semántica;
3. el valor mostrado deberá preservarse hasta definir su política por dominio, entidad y campo;
4. el valor de búsqueda podrá ser una representación separada y nunca reemplazará silenciosamente al valor mostrado;
5. el valor externo original deberá conservar procedencia cuando una integración, importación o documento lo requiera;
6. los identificadores técnicos no se corrigen ortográficamente;
7. las razones sociales, marcas, siglas, unidades y nombres propios requieren catálogo de excepciones;
8. direcciones y texto libre no comparten necesariamente reglas con nombres o etiquetas;
9. los saltos de línea legítimos no deben confundirse con espacios accidentales;
10. toda posible fusión deberá revisar relaciones, movimientos, recetas, inventario, proveedores, integraciones, historial y auditoría.

#### 11. Decisiones reservadas

Esta tarea no decide:

- la forma canónica final de nombres, etiquetas, descripciones o direcciones;
- qué palabras deben conservar mayúsculas internas, siglas o grafías de marca;
- qué tildes ausentes son errores y cuáles provienen de códigos, marcas o fuentes externas;
- qué signos deben conservarse en unidades, cantidades, razones sociales, nombres o direcciones;
- qué conectores son obligatorios, opcionales o parte de una denominación registrada;
- qué inconsistencias admiten transformación determinista;
- qué casos requieren diccionario o revisión humana;
- qué registros son duplicados semánticos;
- qué capa deberá ejecutar las transformaciones futuras;
- qué datos deberán corregirse, backfillearse, fusionarse o preservarse;
- ninguna modificación física en Supabase.

Estas decisiones permanecen en `DATA-NORM-AUD-003` a `DATA-NORM-AUD-007`, `DATA-NORM-ARC-001` a `DATA-NORM-ARC-012` y las tareas de transición correspondientes.

#### 12. Criterios de integridad de la auditoría

La auditoría se considera íntegra para esta etapa cuando:

1. distingue defectos confirmados de señales que requieren revisión semántica;
2. separa espacios, capitalización, Unicode, tildes, signos y conectores;
3. conserva la diferencia entre valor mostrado, valor de búsqueda, valor externo original e identificador técnico;
4. no presenta mayúsculas, minúsculas o mezcla de caja como error automático;
5. no interpreta ausencia de hallazgos en una muestra prioritaria como ausencia global;
6. vincula cada brecha con una tarea propietaria concreta;
7. no autoriza correcciones, fusiones ni cambios físicos;
8. preserva la frontera separada de VITAL.

#### 13. Requisitos de prueba

**NO GENERA REQUISITOS DE PRUEBA.**

Justificación: esta tarea detecta y clasifica evidencia del estado actual, pero todavía no define reglas canónicas exigibles de escritura, visualización, comparación, búsqueda, corrección, conservación, revisión humana o migración. Los comportamientos verificables deberán originarse cuando las tareas arquitectónicas y de transición aprueben políticas por dominio, entidad, campo y representación.

#### 14. Continuidad

```text
ÚLTIMA TAREA APROBADA
DATA-NORM-AUD-001 — Inventariar campos textuales y reglas actuales de normalización
        ↓
TAREA ACTUAL APROBADA
DATA-NORM-AUD-002 — Detectar inconsistencias de espacios, mayúsculas, Unicode, tildes, signos y conectores
        ↓
SIGUIENTE TAREA RESERVADA
DATA-NORM-AUD-003 — Identificar marcas, siglas, unidades, razones sociales y excepciones que no admiten transformación genérica
```


### ✅ DATA-NORM-AUD-003 — Identificar marcas, siglas, unidades, razones sociales y excepciones que no admiten transformación genérica

**Estado:** APROBADA  
**Tarea anterior:** `DATA-NORM-AUD-002 — Detectar inconsistencias de espacios, mayúsculas, Unicode, tildes, signos y conectores` — APROBADA  
**Tarea siguiente:** `DATA-NORM-AUD-004 — Detectar duplicados semánticos mediante valores normalizados de comparación`  
**Tipo de tarea:** auditoría documental de excepciones textuales y valores protegidos; sin DDL, DML, migraciones, backfills, correcciones, fusiones, cambios de esquema, cambios de datos, modificación de constraints, modificación de índices, modificación de triggers, cambios en aplicaciones ni despliegues

#### 1. Objetivo

Identificar las clases de valores textuales de Vento OS cuya escritura, capitalización, puntuación, separación, abreviación o composición no puede modificarse mediante una transformación genérica sin riesgo de degradar identidad empresarial, significado técnico, trazabilidad, validez legal o interpretación operativa.

La tarea clasifica evidencia observable de marcas, siglas, unidades, razones sociales y otras excepciones protegidas. No establece todavía la grafía oficial definitiva de cada valor, no crea un diccionario canónico y no autoriza correcciones ni fusiones. Sus resultados alimentan `DATA-NORM-AUD-004` a `DATA-NORM-AUD-007` y las políticas de `DATA-NORM-ARC-001` a `DATA-NORM-ARC-012`.

#### 2. Artefacto producido

```text
DATA-TEXTUAL-PROTECTED-EXCEPTIONS-INVENTORY-003@1.0.0
```

| Propiedad                                                         |                                                               Valor observado |
| ----------------------------------------------------------------- | ----------------------------------------------------------------------------: |
| Proyecto observado                                                |                                       `vento-os-dev` — `clzdpinthhtknkmefsxx` |
| Ventana de observación                                            |       `2026-07-30T21:39:44.522798+00:00` a `2026-07-30T21:41:52.895307+00:00` |
| Schemas empresariales y técnicos incluidos                        | `app_private`, `club`, `pass`, `payments`, `pos`, `public`, `talento`, `viso` |
| Frontera excluida de decisiones transversales                     |                                                                       `vital` |
| Columnas escalares textuales persistidas examinadas por metadatos |                                                                           934 |
| Filas modificadas                                                 |                                                                             0 |
| Objetos de base de datos modificados                              |                                                                             0 |

#### 3. Alcance y restricciones

La auditoría utiliza metadatos de columnas y cortes de solo lectura sobre valores persistidos. Mantiene estas restricciones:

1. la presencia de una palabra en mayúsculas, con signos o con capitalización interna no demuestra por sí sola que sea marca o sigla;
2. una coincidencia después de `lower`, `unaccent`, recorte o eliminación de signos no demuestra identidad semántica;
3. la grafía almacenada no se declara automáticamente oficial, correcta ni incorrecta;
4. los campos de marca pueden contener modelo, fabricante, combinación comercial o contaminación histórica;
5. los campos de unidad pueden mezclar símbolo de medida, código técnico, familia, presentación y etiqueta visible;
6. las razones sociales se preservan como valores oficiales o externos hasta obtener evidencia autorizada;
7. los nombres de personas, direcciones, identificadores, valores externos y texto libre requieren políticas propias;
8. `vital` permanece fuera de cualquier regla transversal de Vento OS;
9. ningún hallazgo autoriza transformar, corregir, backfillear, fusionar o eliminar valores.

#### 4. Taxonomía de valores protegidos

| Código                     | Clase                                                                 | Ejemplos observados                                                    | Motivo de protección                                                                     |
| -------------------------- | --------------------------------------------------------------------- | ---------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| `OFFICIAL_BRAND_FORM`      | marca o denominación comercial                                        | `Hatsu`, `Vento`, `Molka`, `Nutella`, `Oster`                          | puede depender de capitalización, separación, signos o grafía registrada                 |
| `BRAND_OR_ENTERPRISE_CODE` | código de marca o unidad empresarial                                  | `VGR`, `SAU`, `VCF`                                                    | es identificador técnico y no forma visible equivalente a la marca                       |
| `APPLICATION_IDENTIFIER`   | nombre o código estable de aplicación                                 | `NEXO`, `VISO`, `ORIGO`, `NUMERA`, `FOGO`, `PULSO`                     | forma parte de contratos, navegación, permisos e integraciones                           |
| `ACRONYM_OR_ABBREVIATION`  | sigla, abreviatura o token especializado                              | `BBQ`, `HIT`, `AA`, `CMS`, `PAM`, `REF`, `T26`, `WIP`                  | su significado depende del contexto y no admite expansión o cambio de caja universal     |
| `MEASUREMENT_SYMBOL`       | símbolo de medida                                                     | `g`, `kg`, `ml`, `l`                                                   | la caja, separación y relación con la cantidad tienen semántica propia                   |
| `COUNT_OR_PACKAGING_CODE`  | código de conteo o presentación                                       | `un`, `dz`, `bolsa`, `paquete`, `pote`, `bandeja`, `caja`              | no es intercambiable con una etiqueta visible ni con una unidad física                   |
| `UNIT_DISPLAY_LABEL`       | etiqueta humana de unidad o presentación                              | `Bolsa`, `BOLSA`, `Unidad`, `Six Pack`, `Pote x 2`                     | requiere distinguir estilo visible de código persistido                                  |
| `UNIT_FAMILY`              | familia técnica de medida                                             | `count`, `mass`, `volume`                                              | es vocabulario técnico controlado, no texto comercial                                    |
| `LEGAL_OR_OFFICIAL_NAME`   | razón social o nombre legal                                           | formas con `SAS`, `S.A.S.`, `SA`, `S.A.`, `LTDA`, `CIA`, `&` o guiones | puntuación, conectores y sufijos pueden integrar la denominación oficial                 |
| `PERSON_OR_ACTOR_NAME`     | nombre de persona, contacto o alias                                   | campos `full_name`, `first_name`, `last_name`, `contact_name`, `alias` | la grafía pertenece a la identidad declarada y puede contener convenciones no inferibles |
| `EXTERNAL_ORIGINAL`        | valor recibido de proveedor, importación o integración                | alias de proveedor, referencias, nombres externos y valores `raw`      | debe conservar procedencia y forma original cuando exista trazabilidad                   |
| `TECHNICAL_IDENTIFIER`     | código, SKU, slug, URL, correo, teléfono, token, hash, modelo o serie | campos `code`, `sku`, `slug`, `url`, `email`, `serial_number`, `model` | no admite corrección ortográfica ni capitalización comercial                             |
| `ADDRESS_OR_LOCATION_TEXT` | dirección o descriptor de ubicación                                   | direcciones, zonas, pasillos, niveles y ubicaciones físicas            | signos, números, abreviaturas y orden pueden ser significativos                          |
| `FREE_TEXT`                | descripción, nota, mensaje, motivo o instrucción                      | `description`, `notes`, `message`, `reason`, `instructions`            | requiere reglas lingüísticas propias y preservación de contexto o autoría                |

#### 5. Cobertura provisional por metadatos

La siguiente clasificación se basa en nombres de columnas y sirve únicamente para delimitar revisión. No constituye la clase canónica final de cada campo.

| Familia provisional                              | Columnas | Relaciones |
| ------------------------------------------------ | -------: | ---------: |
| texto escalar todavía no clasificable por nombre |      381 |        178 |
| identificador técnico                            |      182 |        106 |
| texto libre                                      |      134 |        117 |
| otro nombre o etiqueta visible                   |       90 |         80 |
| unidad, medida o moneda                          |       78 |         40 |
| valor externo original                           |       26 |         16 |
| dirección o texto de ubicación                   |       24 |         17 |
| nombre de persona o actor                        |       13 |         10 |
| marca explícita                                  |        3 |          3 |
| nombre legal u oficial explícito                 |        3 |          3 |
| **Total**                                        |  **934** |          — |

Los 381 campos sin clasificación provisional impiden cerrar la política mediante nomenclatura. Su tratamiento deberá resolverse por dominio, entidad, campo, fuente y consumidor en `DATA-NORM-ARC-001` y `DATA-NORM-ARC-002`.

#### 6. Inventario de marcas y códigos de marca

Los campos explícitos de marca observados fueron:

```text
public.asset_items.brand
public.product_asset_profiles.brand
public.product_sku_sequences.brand_code
```

| Métrica                                                         | Resultado |
| --------------------------------------------------------------- | --------: |
| Observaciones no vacías en campos explícitos                    |        76 |
| Valores escritos distintos                                      |        36 |
| Claves comparativas distintas por minúsculas, tildes y espacios |        35 |
| Grupos con variantes de escritura confirmadas                   |         1 |

Evidencia representativa:

| ID               | Valor o grupo                 | Evaluación                                                                                                 |
| ---------------- | ----------------------------- | ---------------------------------------------------------------------------------------------------------- |
| `DN-AUD-003-B01` | `Oster` / `oster`             | variante de caja confirmada; la forma oficial no puede inferirse del dato más frecuente                    |
| `DN-AUD-003-B02` | `Wellmix` / `Welmix`          | posible diferencia ortográfica, marca distinta o error; requiere fuente oficial o revisión humana          |
| `DN-AUD-003-B03` | `Volnic` / `VOLNIC PALLOMARO` | posible marca individual frente a composición de fabricante o proveedor; no admite compactación automática |
| `DN-AUD-003-B04` | `Daza` / `acero daza`         | posible marca, fabricante o descripción material; no son equivalentes por coincidencia parcial             |
| `DN-AUD-003-B05` | `MODELO DUC 72 R`             | contenido de modelo localizado en un campo de marca; evidencia de contaminación semántica                  |
| `DN-AUD-003-B06` | `TORNADO MODELO (TH33M.110.)` | mezcla de marca, modelo y puntuación técnica dentro de un solo valor                                       |
| `DN-AUD-003-B07` | `VGR`, `SAU`, `VCF`           | códigos de marca o unidad empresarial; deben permanecer separados de la grafía comercial                   |

La ausencia de un campo de marca general en `public.products` y `pass.catalog_items` obliga a tratar como candidatos, no como confirmaciones, los términos comerciales embebidos en nombres. Entre los candidatos repetidos aparecen:

| Candidato         | Apariciones en el corte | Nombres distintos | Evaluación                                                                 |
| ----------------- | ----------------------: | ----------------: | -------------------------------------------------------------------------- |
| `Hatsu`           |                      34 |                 9 | candidato comercial fuerte; confirmar grafía y propietario                 |
| `Vento`           |                      22 |                18 | denominación empresarial o de línea; distinguir marca, sede y descriptor   |
| `Molka`           |                      17 |                17 | candidato de marca o línea de empaque                                      |
| `Saudo` / `SAUDO` |                       9 |                 9 | marca empresarial con variantes de caja en nombres                         |
| `Nutella`         |                       6 |                 4 | candidato de marca incorporado en denominaciones de producto               |
| `Klim`            |                       5 |                 3 | candidato de marca incorporado en denominaciones de producto               |
| `Kraft`           |                       3 |                 3 | candidato de marca; puede coexistir con uso descriptivo en otros contextos |
| `Kinder Bueno`    |                 3 o más |           2 o más | denominación compuesta que no admite transformación palabra por palabra    |

La extracción por tokens también devuelve vocabulario ordinario como `Frutos`, `Madre`, `Pizza` o `Coco`. Por tanto, frecuencia y capitalización no son suficientes para declarar una marca.

#### 7. Inventario de siglas, abreviaturas y nombres técnicos protegidos

Se observaron 17 valores explícitos distintos en cuatro clases controlables:

| Clase                                 | Valores observados                                 | Regla de auditoría                                                            |
| ------------------------------------- | -------------------------------------------------- | ----------------------------------------------------------------------------- |
| identificadores de aplicación         | `NEXO`, `VISO`, `ORIGO`, `NUMERA`, `FOGO`, `PULSO` | conservar forma contractual exacta                                            |
| códigos de marca o unidad empresarial | `VGR`, `SAU`, `VCF`                                | no convertir en nombre visible ni expandir sin catálogo                       |
| código monetario                      | `COP`                                              | conservar como identificador monetario controlado                             |
| siglas legales o empresariales        | `SAS`, `SA`, `CIA`, `LTDA`, `AVSA`, `FC`, `SVV`    | preservar dentro del nombre oficial y distinguir sigla legal de nombre propio |

El corte de nombres y etiquetas produjo 25 tokens en mayúsculas candidatos a sigla. Solo pueden considerarse excepciones confirmadas después de revisar contexto:

| Token | Contexto observado               | Clasificación provisional                      |
| ----- | -------------------------------- | ---------------------------------------------- |
| `BBQ` | nombres de salsa y productos     | abreviatura culinaria o denominación comercial |
| `HIT` | bebidas                          | posible marca                                  |
| `AA`  | clasificación de huevos          | grado, categoría o estándar                    |
| `CMS` | etiqueta de navegación           | sigla técnica                                  |
| `PAM` | aerosol antiadherente            | posible marca                                  |
| `REF` | nombre con referencia numérica   | abreviatura documental o comercial             |
| `T26` | radio                            | modelo técnico                                 |
| `WIP` | categoría con “Work In Progress” | sigla técnica de proceso                       |

Palabras completas en mayúsculas como `BOLSA`, `POTE`, `CAJA` o `PIZZA` no se convierten en siglas por su forma. Son evidencia de estilo inconsistente o de etiquetas heredadas y deberán clasificarse por contexto.

#### 8. Inventario de unidades, símbolos, códigos y etiquetas

El corte consolidado de doce campos prioritarios de unidades produjo:

| Métrica                                 | Resultado |
| --------------------------------------- | --------: |
| Observaciones no vacías                 |     8.277 |
| Valores escritos distintos              |        54 |
| Claves comparativas distintas           |        36 |
| Grupos con variantes de caja o espacios |        12 |

Clases observadas:

| Clase                            | Valores representativos                                                                                | Riesgo de transformación genérica                                        |
| -------------------------------- | ------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------ |
| símbolos de medida               | `g`, `kg`, `ml`, `l`                                                                                   | cambiar caja, separar o expandir puede alterar convención y contratos    |
| código de conteo                 | `un`, `dz`                                                                                             | no debe convertirse automáticamente en palabra visible                   |
| familia técnica                  | `count`, `mass`, `volume`                                                                              | vocabulario interno controlado                                           |
| presentación o empaque           | `bolsa`, `paquete`, `pote`, `bandeja`, `caja`, `botella`, `bulto`, `tarro`, `lata`, `empaque`, `rollo` | existe como código y como etiqueta con formas de caja diferentes         |
| etiqueta visible                 | `Unidad`, `BOLSA`, `Six Pack`, `Pote x 2`                                                              | requiere política de presentación separada del código                    |
| composición de cantidad y unidad | `Bolsa 1 kg`, `Botella 750 ml`, `Paquete 10 un`                                                        | la cantidad, el separador y el símbolo deben procesarse estructuralmente |

Grupos de variantes confirmados incluyen:

```text
bolsa / Bolsa / BOLSA
paquete / Paquete / PAQUETE
pote / Pote / POTE
bandeja / Bandeja / BANDEJA
caja / Caja / CAJA
botella / Botella
Unidad / UNIDAD
bulto / Bulto / BULTO
```

Valores que requieren clasificación especial antes de cualquier corrección:

| Valor                   | Brecha observada                                                                       |
| ----------------------- | -------------------------------------------------------------------------------------- |
| `Botellla`              | posible error ortográfico en etiqueta legacy                                           |
| `Costo`                 | valor que no representa una unidad física evidente                                     |
| `1`                     | código numérico sin semántica visible documentada                                      |
| `Pote x 2`              | composición de empaque y multiplicador dentro de un texto                              |
| `Six Pack` / `six_pack` | etiqueta visible y código técnico potencialmente relacionados, pero no intercambiables |
| `presentacion`          | categoría genérica usada como código                                                   |
| `piezas` / `bolsas`     | pluralización dentro de campos que también contienen códigos singulares                |

Estas observaciones deberán alimentar la clasificación de transformaciones en `DATA-NORM-AUD-005`, la definición de clases en `DATA-NORM-ARC-002` y el catálogo de excepciones en `DATA-NORM-ARC-005`.

#### 9. Inventario de razones sociales y nombres oficiales

Se consolidaron valores de `public.suppliers.name`, `public.client_billing_profiles.legal_name`, `public.order_billing_requests.legal_name` y `public.inventory_entries.supplier_name`.

| Métrica                                                        |               Resultado |
| -------------------------------------------------------------- | ----------------------: |
| Observaciones no vacías                                        |                      95 |
| Valores escritos distintos                                     |                      92 |
| Valores con sufijo legal detectable                            |                      22 |
| Valores completamente en mayúsculas                            |                      94 |
| Valores con puntuación significativa                           |                       8 |
| Valores con conector `&`                                       |                       2 |
| Grupos con variantes después de eliminar caja, tildes y signos | 0 en el corte observado |

Evidencia representativa:

```text
COMERCIALIZADORA EL NOVILLON S.A.S.
DISTRILACTEOS LTDA
JAIME VELANDIA & CIA SAS
PRODUCTORA Y COMERCIALIZADORA HACIENDA EL MOLINO P&P SAS
SUCESORES DE JÓSE JESÚS RESTREPO & CIA S.A.
```

La forma almacenada puede provenir de documentos tributarios, proveedor, importación o captura manual. Esta tarea no determina si una tilde, punto, conector, sufijo o uso de mayúsculas es correcto. Toda razón social deberá conservar su valor original y su procedencia hasta disponer de una fuente oficial aprobada.

#### 10. Otras excepciones que prohíben tratamiento genérico

| Familia                                    | Columnas candidatas | Restricción mínima                                                                                           |
| ------------------------------------------ | ------------------: | ------------------------------------------------------------------------------------------------------------ |
| nombre de persona o actor                  |                  13 | no imponer `Title Case`, eliminar tildes ni alterar apellidos, partículas o alias sin decisión explícita     |
| valor externo original                     |                  26 | conservar forma y procedencia; cualquier representación derivada debe almacenarse o calcularse separadamente |
| identificador técnico                      |                 182 | no aplicar corrección ortográfica, conectores comerciales ni eliminación genérica de signos                  |
| dirección o ubicación                      |                  24 | preservar números, abreviaturas, signos y orden; validar por contrato específico                             |
| texto libre                                |                 134 | no aplicar cambios destructivos silenciosos; considerar autoría, historial y contexto                        |
| otro nombre o etiqueta visible             |                  90 | clasificar por dominio antes de definir capitalización o diccionario                                         |
| texto escalar sin clasificación por nombre |                 381 | revisión obligatoria; no heredar política por schema o tipo físico                                           |

También quedan protegidos hasta clasificación expresa:

- nombres de recetas, productos y categorías con términos extranjeros, denominaciones culinarias o nombres históricos;
- modelos, números de referencia, series, códigos de barras y combinaciones alfanuméricas;
- correos, teléfonos, URL, rutas, slugs, tokens, hashes y claves;
- nombres de sedes, áreas, aplicaciones, estaciones y dispositivos;
- alias de proveedor y nombres externos importados;
- valores dentro de JSON o arreglos, que requieren política por clave o elemento;
- valores derivados en vistas, que no constituyen una fuente de verdad independiente.

#### 11. Matriz de protección y tarea propietaria

| Clase                      | Transformación genérica prohibida                                      | Evidencia necesaria antes de decidir                                                            | Tarea propietaria                                             |
| -------------------------- | ---------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- | ------------------------------------------------------------- |
| marca                      | `Title Case`, minúsculas, eliminación de signos o unión de palabras    | fuente oficial, propietario, campo de origen y consumidores                                     | `DATA-NORM-ARC-005`; `DATA-NORM-ARC-006`                      |
| sigla o abreviatura        | expansión, cambio de caja o corrección ortográfica                     | catálogo contractual y significado por contexto                                                 | `DATA-NORM-ARC-005`                                           |
| unidad o presentación      | cambio de caja, pluralización, expansión o compactación indiscriminada | clase de unidad, código, etiqueta, cantidad y perfil de conversión                              | `DATA-NORM-AUD-005`; `DATA-NORM-ARC-002`; `DATA-NORM-ARC-005` |
| razón social               | capitalización comercial, retiro de puntos, conectores o sufijos       | documento o fuente oficial y procedencia                                                        | `DATA-NORM-ARC-005`; `DATA-NORM-ARC-012`                      |
| nombre de persona          | capitalización universal o corrección por diccionario empresarial      | preferencia declarada, fuente de identidad y reglas legales aplicables                          | `DATA-NORM-ARC-002`; `DATA-NORM-ARC-007`                      |
| identificador técnico      | corrección ortográfica o normalización de presentación                 | contrato de formato, unicidad y consumidores                                                    | `DATA-NORM-AUD-006`; `DATA-NORM-AUD-007`; `DATA-NORM-ARC-002` |
| valor externo original     | sobrescritura por una forma corregida                                  | integración, fuente, versión y política de conservación                                         | `DATA-NORM-ARC-012`                                           |
| texto libre                | corrección destructiva silenciosa                                      | reglas propias, autoría, historial y revisión humana                                            | `DATA-NORM-ARC-006`; `DATA-NORM-ARC-007`; `DATA-NORM-ARC-009` |
| representación de búsqueda | sustitución del valor mostrado                                         | contrato de búsqueda, comparación y trazabilidad                                                | `DATA-NORM-ARC-008`; `DATA-NORM-ARC-009`                      |
| posible duplicado          | fusión por clave normalizada                                           | relaciones, movimientos, recetas, inventario, proveedores, integraciones, historial y auditoría | `DATA-NORM-AUD-004`; `DATA-NORM-ARC-010`                      |

#### 12. Hallazgos

| ID               | Hallazgo                                                                      | Evidencia                                                                             | Consecuencia propietaria                                                                      |
| ---------------- | ----------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| `DN-AUD-003-H01` | las marcas explícitas no tienen una grafía uniforme ni una semántica limpia   | 36 valores escritos, 35 claves comparativas y valores que mezclan marca con modelo    | crear clasificación y catálogo oficial antes de corregir                                      |
| `DN-AUD-003-H02` | los productos contienen marcas embebidas sin un campo general dedicado        | candidatos repetidos como `Hatsu`, `Vento`, `Molka`, `Nutella`, `Klim` y `Kraft`      | no extraer ni reescribir marcas mediante heurística de tokens                                 |
| `DN-AUD-003-H03` | siglas visualmente similares pertenecen a contratos diferentes                | aplicaciones, marcas, moneda, formas legales, modelos y abreviaturas                  | gobernar cada clase por catálogo y contexto                                                   |
| `DN-AUD-003-H04` | las unidades mezclan símbolos, códigos, familias, presentaciones y etiquetas  | 54 formas escritas y 12 grupos con variantes                                          | separar código canónico, etiqueta visible, cantidad y conversión                              |
| `DN-AUD-003-H05` | existen valores unitarios que parecen errores o clasificaciones incorrectas   | `Botellla`, `Costo`, `1`, `Pote x 2`, `Six Pack` y `six_pack`                         | enviar a transformación determinista, diccionario o revisión humana según `DATA-NORM-AUD-005` |
| `DN-AUD-003-H06` | las razones sociales dependen ampliamente de mayúsculas, signos y sufijos     | 94 de 95 observaciones en mayúsculas; 22 con sufijo legal                             | prohibir capitalización comercial universal                                                   |
| `DN-AUD-003-H07` | la mayoría del texto escalar no puede clasificarse por nomenclatura           | 381 de 934 columnas permanecen sin clase provisional                                  | exigir decisión por dominio, entidad y campo                                                  |
| `DN-AUD-003-H08` | la escritura almacenada no demuestra por sí sola oficialidad                  | variantes de marca, nombres externos y datos legacy                                   | requerir procedencia y evidencia autorizada                                                   |
| `DN-AUD-003-H09` | las excepciones atraviesan datos visibles, contratos técnicos e integraciones | 182 identificadores, 26 valores externos, 24 campos de ubicación y 134 de texto libre | impedir una función de normalización universal                                                |

#### 13. Riesgos y brechas vinculadas

| ID               | Riesgo o brecha                                                                        | Estado después de esta tarea                                    | Tarea propietaria de resolución                               |
| ---------------- | -------------------------------------------------------------------------------------- | --------------------------------------------------------------- | ------------------------------------------------------------- |
| `DN-AUD-003-R01` | alterar una marca por capitalización, ortografía o separación inferida                 | identificado; no mitigado                                       | `DATA-NORM-ARC-005`; `DATA-NORM-ARC-006`; `DATA-NORM-ARC-007` |
| `DN-AUD-003-R02` | tratar código de marca, aplicación, moneda o forma legal como texto comercial          | identificado; no mitigado                                       | `DATA-NORM-ARC-002`; `DATA-NORM-ARC-005`                      |
| `DN-AUD-003-R03` | confundir símbolo, código, familia y etiqueta de unidad                                | identificado; no mitigado                                       | `DATA-NORM-AUD-005`; `DATA-NORM-ARC-001`; `DATA-NORM-ARC-002` |
| `DN-AUD-003-R04` | sobrescribir una razón social o valor externo sin conservar procedencia                | identificado; prohibido por esta auditoría                      | `DATA-NORM-ARC-009`; `DATA-NORM-ARC-012`                      |
| `DN-AUD-003-R05` | aplicar `Title Case` a nombres de persona, direcciones, modelos o siglas               | identificado; no mitigado                                       | `DATA-NORM-ARC-002`; `DATA-NORM-ARC-003`; `DATA-NORM-ARC-005` |
| `DN-AUD-003-R06` | crear un diccionario desde frecuencia o tokens y convertir falsos positivos en reglas  | identificado; no mitigado                                       | `DATA-NORM-ARC-006`; `DATA-NORM-ARC-007`                      |
| `DN-AUD-003-R07` | fusionar variantes de marca, unidad o nombre legal por clave comparativa               | identificado; prohibido por esta auditoría                      | `DATA-NORM-AUD-004`; `DATA-NORM-ARC-010`                      |
| `DN-AUD-003-R08` | modificar códigos sin inventariar funciones, aplicaciones e integraciones consumidoras | identificado; no mitigado                                       | `DATA-NORM-AUD-006`; `DATA-NORM-AUD-007`; `DATA-NORM-ARC-011` |
| `DN-AUD-003-R09` | extender reglas de Vento OS a VITAL por coexistencia física                            | restringido documentalmente; pendiente de controles posteriores | `SUPA-ARC-025`; contratos de integración aplicables           |

Ningún riesgo se considera aceptado, mitigado o cerrado por esta tarea.

#### 14. Decisiones reservadas

Esta tarea no decide:

- la grafía oficial definitiva de cada marca, sigla o razón social;
- si dos formas de marca representan la misma entidad comercial;
- si un término embebido en un nombre es marca, descriptor, ingrediente o vocabulario ordinario;
- qué unidad, código o etiqueta sustituirá valores legacy;
- qué abreviaturas pueden expandirse o traducirse;
- qué correcciones son deterministas, dependen de diccionario o requieren revisión humana;
- qué registros constituyen duplicados semánticos;
- qué fuente es propietaria cuando el valor aparece en más de una tabla o aplicación;
- qué capa ejecutará cada regla futura;
- qué datos deberán corregirse, backfillearse, fusionarse o preservarse;
- ninguna modificación física en Supabase.

Las decisiones quedan asignadas a `DATA-NORM-AUD-004` a `DATA-NORM-AUD-007`, `DATA-NORM-ARC-001` a `DATA-NORM-ARC-012` y las tareas de transición correspondientes.

#### 15. Criterios de integridad de la auditoría

La auditoría se considera íntegra para esta etapa cuando:

1. distingue marca visible, código de marca y término comercial candidato;
2. separa siglas de palabras completas escritas en mayúsculas;
3. separa símbolo de medida, código de unidad, familia, presentación y etiqueta visible;
4. conserva razones sociales y valores externos sin declarar una grafía alternativa;
5. identifica nombres propios, direcciones, identificadores y texto libre como clases con políticas específicas;
6. registra falsos positivos y límites de los métodos heurísticos;
7. vincula cada brecha con una tarea propietaria concreta;
8. no autoriza correcciones, fusiones ni cambios físicos;
9. conserva la frontera separada de VITAL.

#### 16. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

Justificación: esta tarea inventaría excepciones y riesgos del estado actual, pero todavía no aprueba la grafía oficial, el tratamiento permitido, el diccionario, las transformaciones, la revisión humana, la representación de búsqueda, la unicidad ni la transición. Los comportamientos verificables deberán originarse en las tareas arquitectónicas y de transición que definan contratos por dominio, entidad, campo y clase de excepción.

#### 17. Continuidad

```text
ÚLTIMA TAREA APROBADA
DATA-NORM-AUD-002 — Detectar inconsistencias de espacios, mayúsculas, Unicode, tildes, signos y conectores
        ↓
TAREA ACTUAL APROBADA
DATA-NORM-AUD-003 — Identificar marcas, siglas, unidades, razones sociales y excepciones que no admiten transformación genérica
        ↓
SIGUIENTE TAREA RESERVADA
DATA-NORM-AUD-004 — Detectar duplicados semánticos mediante valores normalizados de comparación
```


### ✅ DATA-NORM-AUD-004 — Detectar duplicados semánticos mediante valores normalizados de comparación

**Estado:** APROBADA  
**Tarea anterior:** `DATA-NORM-AUD-003 — Identificar marcas, siglas, unidades, razones sociales y excepciones que no admiten transformación genérica` — APROBADA  
**Tarea siguiente:** `DATA-NORM-AUD-005 — Clasificar transformaciones deterministas, correcciones por diccionario y casos ambiguos`  
**Tipo de tarea:** auditoría documental de duplicidad semántica, colisiones de comparación y alcance empresarial; sin DDL, DML, migraciones, backfills, correcciones, fusiones, desactivaciones, cambios de relaciones, cambios de esquema, modificación de constraints, modificación de índices, modificación de triggers, cambios en aplicaciones ni despliegues

#### 1. Objetivo

Detectar grupos de registros cuyos valores textuales coinciden después de aplicar representaciones normalizadas de comparación, distinguir candidatos reales de duplicidad semántica de homónimos legítimos, versiones históricas, etiquetas contextuales y falsos positivos de alcance, y documentar la evidencia mínima que deberá revisarse antes de cualquier decisión futura de corrección, unicidad, consolidación o fusión.

La coincidencia entre valores normalizados se utiliza exclusivamente como mecanismo de descubrimiento. No constituye una clave de identidad, no demuestra equivalencia empresarial y no autoriza por sí sola modificar, desactivar, relacionar, sustituir ni fusionar registros.

#### 2. Artefacto producido

```text
DATA-NORMALIZED-COMPARISON-DUPLICATE-AUDIT-004@1.0.0
```

| Propiedad                            |                                                         Valor observado |
| ------------------------------------ | ----------------------------------------------------------------------: |
| Proyecto observado                   |                                 `vento-os-dev` — `clzdpinthhtknkmefsxx` |
| Ventana principal de observación     | `2026-07-30T21:53:45.550399+00:00` a `2026-07-30T21:56:14.736975+00:00` |
| Operaciones ejecutadas sobre datos   |                                               consultas de solo lectura |
| Registros modificados                |                                                                       0 |
| Objetos de base de datos modificados |                                                                       0 |

#### 3. Alcance y fronteras

La auditoría aplica a valores persistidos de Vento OS en los schemas actuales `public`, `pass`, `pos`, `talento`, `club`, `payments` y `viso`, con cortes prioritarios sobre:

- productos y categorías;
- catálogo comercial y recompensas;
- proveedores, sedes y áreas;
- categorías de remisión;
- posiciones de inventario;
- presentaciones físicas y políticas de solicitud;
- usuarios, trabajadores e invitaciones laborales;
- nombres, etiquetas y títulos empresariales que actúan como candidatos de identidad o comparación.

Se mantienen las siguientes fronteras:

1. `app_private` conserva su tratamiento de infraestructura técnica privada;
2. `vital` permanece fuera de las decisiones transversales de Vento OS por ser una frontera de producto separada;
3. identificadores técnicos, códigos, SKU, slugs, correos, documentos, teléfonos, URLs, tokens y referencias externas no se someten a corrección ortográfica genérica;
4. JSON, arreglos y texto libre no se agrupan como una cadena única sin contrato por clave, elemento y procedencia;
5. una vista o representación derivada no crea una fuente de verdad independiente;
6. la repetición de un nombre en entidades, contextos, sedes, capas o estados diferentes no equivale automáticamente a duplicidad.

#### 4. Representaciones utilizadas para descubrimiento

| Representación   | Construcción de auditoría                                                                     | Uso permitido                                             | Uso prohibido                                |
| ---------------- | --------------------------------------------------------------------------------------------- | --------------------------------------------------------- | -------------------------------------------- |
| `SOURCE_VALUE`   | valor persistido original                                                                     | conservar evidencia y procedencia                         | sobrescribirlo durante la auditoría          |
| `FORM_KEY`       | NFC, recorte de borde, compactación de espacios y minúsculas                                  | detectar variantes de forma visible                       | tratarla como identidad empresarial          |
| `SEARCH_KEY`     | `FORM_KEY`, eliminación tolerante de tildes y retiro de signos o separadores no alfanuméricos | ampliar candidatos de comparación                         | imponer unicidad o fusionar registros        |
| `SCOPE_KEY`      | territorio, entidad propietaria, padre jerárquico, categoría, contexto o capa aplicable       | impedir comparar valores fuera de su alcance real         | asumir un scope global por comodidad técnica |
| `STRUCTURAL_KEY` | campos funcionales que definen cantidad, unidad, uso, versión, fuente o relación              | distinguir etiqueta coincidente de estructura equivalente | reducir una entidad compleja a su etiqueta   |

Las claves anteriores son artefactos analíticos transitorios. La representación canónica de búsqueda y comparación deberá definirse en `DATA-NORM-ARC-008`, y la estrategia de unicidad y duplicidad normalizada en `DATA-NORM-ARC-010`.

#### 5. Taxonomía de resultados

| Código                                | Definición                                                                                          | Tratamiento después de esta tarea                                        |
| ------------------------------------- | --------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------ |
| `EXACT_VALUE_COLLISION`               | dos o más registros comparten exactamente el valor persistido dentro del corte evaluado             | revisar alcance, estado, versión, relaciones y estructura                |
| `FORM_VARIANT_COLLISION`              | los valores difieren solo por caja, bordes o compactación de espacios                               | candidato a normalización de presentación; no implica fusión             |
| `SEARCH_KEY_COLLISION`                | los valores convergen al ignorar tildes, signos o separación                                        | candidato semántico que exige revisión humana o contractual              |
| `PROBABLE_SAME_ENTITY`                | la coincidencia se acompaña de mismo dominio, tipo, scope y atributos funcionales compatibles       | priorizar revisión de consolidación, sin ejecutarla                      |
| `STRUCTURAL_DUPLICATE_CANDIDATE`      | dos registros comparten entidad, contexto y huella funcional equivalente                            | revisar procedencia, prioridad, relaciones y auditoría antes de resolver |
| `LIFECYCLE_OR_VERSION_PAIR`           | la repetición corresponde a estados activo/inactivo, versión anterior, supersesión o historial      | preservar historial; no tratar como duplicado operativo por defecto      |
| `CROSS_LAYER_HOMONYM`                 | el mismo nombre identifica objetos distintos en capas como insumo, preparación y venta              | conservar separación funcional                                           |
| `LABEL_COLLISION_DIFFERENT_STRUCTURE` | una misma etiqueta corresponde a cantidades, unidades, contextos o políticas diferentes             | prohibir deduplicación por etiqueta                                      |
| `SCOPE_FALSE_POSITIVE`                | el algoritmo agrupó registros legítimos porque omitió padre, territorio, código o camino jerárquico | corregir la definición de alcance, no los datos                          |
| `AMBIGUOUS_COLLISION`                 | la evidencia disponible no permite decidir identidad ni diferencia                                  | enviar a revisión humana y conservar ambos registros                     |

#### 6. Corte prioritario de entidades maestras

El corte controlado sobre once fuentes y 1.753 registros produjo:

| Resultado                                            | Cantidad |
| ---------------------------------------------------- | -------: |
| Fuentes examinadas                                   |       11 |
| Registros examinados                                 |    1.753 |
| Grupos inicialmente detectados por clave comparativa |       17 |
| Registros incluidos en esos grupos                   |       94 |
| Registros activos incluidos                          |       85 |

Distribución inicial:

| Familia                                       | Grupos | Registros | Activos | Clasificación posterior                                                     |
| --------------------------------------------- | -----: | --------: | ------: | --------------------------------------------------------------------------- |
| ítems de catálogo                             |      8 |        16 |       8 | siete pares exactos y un par de forma; principalmente ciclo activo/inactivo |
| posiciones de inventario                      |      6 |        72 |      72 | falsos positivos por jerarquía y código                                     |
| productos dentro del mismo scope de categoría |      2 |         4 |       3 | candidatos semánticos prioritarios                                          |
| categorías de remisión                        |      1 |         2 |       2 | candidato exacto activo dentro de la misma sede                             |

No se detectaron grupos comparables dentro del mismo scope en los cortes prioritarios de proveedores, sedes, áreas, categorías de producto, categorías comerciales, recompensas ni tipos documentales. Esta ausencia aplica únicamente al universo y a las claves observadas; no demuestra inexistencia global de duplicidad.

#### 7. Duplicidad y homonimia en productos

El corte global sobre 963 productos encontró nueve grupos de colisión por `SEARCH_KEY`. Ocho grupos contienen al menos dos registros activos y siete atraviesan categorías diferentes.

| Grupo observado                       | Estado de registros       | Evidencia funcional                                                                        | Clasificación de auditoría                                   |
| ------------------------------------- | ------------------------- | ------------------------------------------------------------------------------------------ | ------------------------------------------------------------ |
| `Chai latte frio` / `Chai Latte Frío` | dos activos               | mismo tipo `venta`, misma categoría, misma unidad y dos SKU distintos                      | `PROBABLE_SAME_ENTITY`                                       |
| `LATTE FRIO` / `Latte Frío`           | dos activos               | mismo tipo `venta` y unidad; categorías comerciales distintas y ambos enlazados a catálogo | `PROBABLE_SAME_ENTITY`, con posible clasificación incorrecta |
| `Maiz Dulce` / `Maíz Dulce`           | uno activo y uno inactivo | mismo tipo y categoría; unidades históricas diferentes `kg` y `g`                          | `LIFECYCLE_OR_VERSION_PAIR` con posible consolidación futura |
| `Choco Bites` / `Chocobites`          | dos activos               | mismo tipo y unidad; categorías diferentes y denominación potencialmente comercial         | `AMBIGUOUS_COLLISION`                                        |
| `Infusión Frutos Amarillos`           | dos activos               | un insumo abastecible y un producto de venta enlazado a catálogo                           | `CROSS_LAYER_HOMONYM`                                        |
| `Infusión Frutos Rojos`               | dos activos               | un insumo con proveedor, UOM y remisión; un producto de venta                              | `CROSS_LAYER_HOMONYM`                                        |
| `Infusión Frutos Verdes`              | dos activos               | un insumo abastecible y un producto de venta                                               | `CROSS_LAYER_HOMONYM`                                        |
| `Merengues`                           | dos activos               | una preparación medida en gramos y un producto de venta por unidad                         | `CROSS_LAYER_HOMONYM`                                        |
| `Zumo de Limón`                       | dos activos               | un insumo consumido por recetas y una preparación remitible                                | `CROSS_LAYER_HOMONYM`                                        |

Resultado consolidado del corte:

| Clasificación                                   | Grupos |
| ----------------------------------------------- | -----: |
| candidatos probables de misma entidad           |      2 |
| par de ciclo o legado con posible consolidación |      1 |
| colisión ambigua                                |      1 |
| homónimos legítimos entre capas funcionales     |      5 |

La igualdad del nombre, incluso exacta, no permite fusionar un insumo con una preparación o un producto de venta. `product_type`, categoría, unidad, fuente, consumidores y rol operativo forman parte de la identidad funcional.

#### 8. Catálogo comercial y estados de ciclo de vida

En `pass.catalog_items.name` se detectaron ocho grupos con dos registros cada uno:

- siete grupos comparten exactamente el nombre;
- un grupo difiere por capitalización;
- cada grupo contiene un registro activo y uno inactivo;
- los pares observados conservan la misma sede y el mismo `product_id`.

Ejemplos representativos:

```text
Agua Hatsu
Gaseosa Colombiana
Gaseosa Manzana
Soda Bretaña
Te Hatsu Amarillo
Te Hatsu Blanco
Te Hatsu Rojo
Te hatsu Negro / Te Hatsu Negro
```

Estos pares se clasifican como `LIFECYCLE_OR_VERSION_PAIR`. El registro inactivo puede representar una versión anterior o una migración de catálogo. Su existencia no demuestra por sí sola un defecto, pero exige que cualquier estrategia de unicidad distinga estado vigente, historial, código comercial, sede y producto enlazado.

#### 9. Categorías de remisión

Se detectaron dos registros activos con el nombre exacto:

```text
VÍVERES & BODEGA PRINCIPAL
```

Ambos pertenecen a la misma sede y no quedaron diferenciados por la representación textual evaluada. Este grupo se registra como `STRUCTURAL_DUPLICATE_CANDIDATE` prioritario.

Antes de cualquier resolución deberán revisarse:

- relaciones producto-sede-área-categoría;
- solicitudes y remisiones históricas;
- reglas de enrutamiento y visibilidad;
- estado de cada registro;
- identificadores consumidos por aplicaciones;
- auditoría de creación y modificación.

#### 10. Falsos positivos por jerarquía de inventario

Las etiquetas `Nivel 1` a `Nivel 6` produjeron seis grupos y 72 registros activos cuando el alcance se limitó a sede y ubicación.

La revisión jerárquica comprobó que cada grupo:

- contiene doce códigos distintos;
- pertenece a doce posiciones padre distintas;
- representa el mismo número de nivel bajo estanterías diferentes.

Por tanto, los 72 registros no son duplicados por compartir el nombre. Son `SCOPE_FALSE_POSITIVE` y demuestran que la identidad de una posición requiere, como mínimo:

```text
site_id
+ location_id
+ parent_position_id o camino jerárquico
+ code
```

Una restricción de unicidad basada únicamente en `location_id + normalized_name` sería incorrecta y bloquearía estructuras legítimas.

#### 11. Presentaciones físicas y políticas de solicitud

El corte sobre 2.312 registros de `product_uom_profiles` y `product_request_policies` produjo:

| Familia y resultado                                                 | Grupos | Registros | Activos |
| ------------------------------------------------------------------- | -----: | --------: | ------: |
| políticas con etiqueta coincidente y estructura o versión diferente |      2 |         4 |       2 |
| perfiles UOM con etiqueta coincidente y estructura diferente        |     82 |       178 |     176 |
| perfiles UOM con huella estructural coincidente                     |      2 |         4 |       4 |
| **Total**                                                           | **86** |   **186** | **182** |

Ochenta y dos grupos contienen más de un registro activo. La mayoría no representa duplicidad semántica: una misma presentación puede existir legítimamente para `purchase`, `remission` o `general`, y la etiqueta visible no codifica por sí sola ese propósito.

Ejemplos de colisión legítima o estructuralmente distinta:

| Producto o caso                    | Etiqueta comparada          | Diferencia relevante                                                                 |
| ---------------------------------- | --------------------------- | ------------------------------------------------------------------------------------ |
| presentaciones de bebidas          | `Bandeja 24 un`             | contexto `purchase` frente a `remission`                                             |
| `Alcaparras Baby`                  | `Pote 250 g` / `POTE 250 g` | compra, remisión, procedencia y valor predeterminado diferentes                      |
| `Kit Caja REF:7071`                | `Paquete`                   | 100 unidades para compra frente a 30 para remisión                                   |
| `Tapa Bowl 1300` y `Tapa Bowl 750` | `Paquete` / `PAQUETE`       | 50 unidades para compra frente a 25 para remisión                                    |
| `Amarenas`                         | `Pote 3 kg`                 | código de entrada `kg` en compra y `g` en remisión, aunque ambos equivalen a 3.000 g |
| política de `Azúcar Blanca`        | `kg`                        | versión inactiva con código `presentacion` y versión activa con código `kg`          |

Candidatos estructurales prioritarios:

| Producto                  | Registros | Huella coincidente                                | Evaluación                                                           |
| ------------------------- | --------: | ------------------------------------------------- | -------------------------------------------------------------------- |
| `Queso Gouda`             | 2 activos | `Empaque`, `un`, 10 unidades, contexto `general`  | `STRUCTURAL_DUPLICATE_CANDIDATE` fuerte                              |
| `Queso Mozzarella Tajado` | 2 activos | `Bloque`, `un`, 83 unidades, contexto `remission` | candidato estructural; la fuente y el estado predeterminado difieren |

La etiqueta normalizada nunca deberá usarse como identidad única de una presentación. La comparación deberá incorporar producto, cantidad, unidad de entrada, cantidad en unidad de stock, contexto de uso, fuente, vigencia y, cuando corresponda, proveedor o política física enlazada.

#### 12. Identidad de personas y ciclo laboral

El corte sobre `public.users`, `public.employees` y `public.staff_invitations` examinó 106 registros y encontró:

| Resultado                                                  | Cantidad |
| ---------------------------------------------------------- | -------: |
| grupos por nombre normalizado                              |       24 |
| grupos que atraviesan más de una fuente                    |       23 |
| grupos con más de un registro activo según estado local    |       13 |
| grupos con al menos un identificador secundario disponible |       24 |
| grupos sin ningún identificador secundario disponible      |        0 |

La mayoría corresponde a representaciones relacionadas de una misma persona en usuario, trabajador e invitación, o a varias invitaciones con estados `accepted`, `cancelled` o `linked_existing_user`.

Estas coincidencias no se clasifican como duplicados de identidad. La decisión debe apoyarse en vínculos persistidos, `employee_id`, `auth_user_id`, documento normalizado, correo, teléfono, estado y procedencia. El nombre normalizado solo puede actuar como señal de revisión y nunca como clave de fusión de personas.

#### 13. Huella obligatoria antes de una posible fusión

Todo candidato de entidad deberá revisarse contra las siguientes dimensiones:

| Dimensión              | Evidencia mínima                                                                     |
| ---------------------- | ------------------------------------------------------------------------------------ |
| identidad y alcance    | tipo de entidad, territorio, categoría, padre, código y fuente propietaria           |
| estado y ciclo de vida | activo, inactivo, versión, supersesión, cancelación, aceptación y fechas             |
| relaciones             | claves foráneas entrantes y salientes, tablas puente y vínculos entre aplicaciones   |
| inventario             | existencias, movimientos, conteos, transferencias, LPN, ubicaciones y presentaciones |
| remisiones             | categorías, solicitudes, picking, fulfillment, envíos, excepciones y recepción       |
| recetas y producción   | ingredientes, productos terminados, recetas, lotes, consumos y salidas               |
| abastecimiento         | proveedores, costos, órdenes, recepciones, unidades y condiciones de compra          |
| catálogo y ventas      | ítems de catálogo, POS, pedidos, reglas de consumo y mapeos externos                 |
| integraciones          | referencias externas, importaciones, webhooks, códigos y consumidores contractuales  |
| historial y auditoría  | eventos, cambios de costo, versiones, actor, fecha, razón y evidencia                |

La tabla `public.products` tiene relaciones declaradas desde múltiples familias de inventario, compras, producción, recetas, catálogo, ventas, PULSO, remisiones y activos. Esta densidad relacional impide una fusión basada únicamente en texto.

#### 14. Reglas de determinación

1. una coincidencia exacta es una señal más fuerte que una coincidencia de búsqueda, pero todavía requiere scope y estructura;
2. dos registros activos dentro del mismo tipo, categoría y territorio tienen prioridad de revisión, no autorización de fusión;
3. un registro activo y uno inactivo pueden representar historia válida, migración o reemplazo;
4. el mismo nombre en tipos de producto distintos puede ser un homónimo funcional legítimo;
5. las etiquetas de presentación se comparan junto con cantidades, unidades y contexto de uso;
6. los nombres jerárquicos se comparan dentro de su padre o camino completo;
7. nombres de personas, proveedores y razones sociales requieren identificadores o fuentes oficiales adicionales;
8. una representación de búsqueda tolerante no sustituye al valor mostrado;
9. una clave comparativa no podrá convertirse en constraint de unicidad antes de `DATA-NORM-ARC-010`;
10. toda decisión de consolidación deberá preservar historial, trazabilidad, reversibilidad y evidencia.

#### 15. Hallazgos

| ID               | Hallazgo                                                                    | Evidencia                                                                               | Consecuencia propietaria                                                                |
| ---------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- |
| `DN-AUD-004-H01` | existen candidatos probables de producto duplicado dentro del mismo dominio | `Chai latte frio` / `Chai Latte Frío`; `LATTE FRIO` / `Latte Frío`                      | revisar semántica, categoría, consumidores y registro sobreviviente antes de transición |
| `DN-AUD-004-H02` | la coincidencia global de productos produce homónimos legítimos             | infusión como insumo y venta; `Merengues`; `Zumo de Limón`                              | definir identidad por tipo y capa, no por nombre                                        |
| `DN-AUD-004-H03` | existen pares históricos o inactivos que conservan trazabilidad             | `Maiz Dulce` / `Maíz Dulce`; ocho pares de catálogo activo/inactivo                     | diferenciar vigencia, versión y supersesión de duplicidad operativa                     |
| `DN-AUD-004-H04` | una categoría de remisión aparece duplicada y activa en el mismo scope      | dos registros `VÍVERES & BODEGA PRINCIPAL`                                              | revisar relaciones y consolidación en la transición propietaria                         |
| `DN-AUD-004-H05` | el alcance incompleto genera falsos positivos masivos                       | 72 niveles legítimos bajo doce padres y códigos distintos                               | incorporar jerarquía y código en comparación y unicidad                                 |
| `DN-AUD-004-H06` | las etiquetas UOM colisionan aunque la función sea diferente                | 82 grupos con estructura distinta y 178 registros                                       | separar etiqueta visible de identidad estructural                                       |
| `DN-AUD-004-H07` | existen al menos dos candidatos estructurales de UOM                        | `Queso Gouda` y `Queso Mozzarella Tajado`                                               | revisar procedencia, defaults, consumidores e historial                                 |
| `DN-AUD-004-H08` | un mismo nombre laboral aparece en representaciones relacionadas            | 24 grupos, 23 entre fuentes y todos con identificadores secundarios                     | resolver por vínculos e identidad, nunca por nombre                                     |
| `DN-AUD-004-H09` | los productos tienen una huella relacional extensa                          | relaciones con inventario, remisiones, recetas, producción, compras, catálogo y ventas  | prohibir fusiones sin plan de reasignación y reconciliación                             |
| `DN-AUD-004-H10` | una clave demasiado agresiva pierde diferencias empresariales               | eliminación de tildes, signos y separación agrupa marcas, capas y estructuras distintas | gobernar varias representaciones y umbrales de revisión                                 |

#### 16. Riesgos y brechas vinculadas

| ID               | Riesgo o brecha                                                                   | Estado después de esta tarea                                    | Tarea propietaria de resolución                                               |
| ---------------- | --------------------------------------------------------------------------------- | --------------------------------------------------------------- | ----------------------------------------------------------------------------- |
| `DN-AUD-004-R01` | fusionar productos por coincidencia textual y mezclar insumo, preparación y venta | identificado; prohibido por esta auditoría                      | `DATA-NORM-AUD-005`; `DATA-NORM-ARC-002`; `DATA-NORM-ARC-010`                 |
| `DN-AUD-004-R02` | imponer unicidad sin incluir scope, jerarquía o contexto funcional                | identificado; no mitigado                                       | `DATA-NORM-AUD-007`; `DATA-NORM-ARC-001`; `DATA-NORM-ARC-010`                 |
| `DN-AUD-004-R03` | eliminar registros inactivos que representan versiones o historial                | identificado; no mitigado                                       | `DATA-NORM-AUD-006`; `DATA-NORM-ARC-009`; tareas de transición                |
| `DN-AUD-004-R04` | deduplicar presentaciones por etiqueta y alterar cantidades o conversiones        | identificado; prohibido por esta auditoría                      | `DATA-NORM-AUD-005`; `DATA-NORM-AUD-007`; `DATA-NORM-ARC-002`                 |
| `DN-AUD-004-R05` | fusionar personas por nombre y asociar acciones al actor incorrecto               | identificado; prohibido por esta auditoría                      | `DATA-NORM-AUD-006`; `DATA-NORM-AUD-007`; arquitectura de identidad aplicable |
| `DN-AUD-004-R06` | seleccionar un registro sobreviviente sin migrar todas sus relaciones             | identificado; no mitigado                                       | `DATA-NORM-AUD-007`; `DATA-NORM-ARC-010`; plan de transición propietario      |
| `DN-AUD-004-R07` | sustituir el valor mostrado por la clave tolerante de búsqueda                    | identificado; prohibido por esta auditoría                      | `DATA-NORM-ARC-008`; `DATA-NORM-ARC-009`                                      |
| `DN-AUD-004-R08` | considerar completo el universo por haber auditado cortes prioritarios            | identificado; no mitigado                                       | `DATA-NORM-AUD-006`; `DATA-NORM-AUD-007`                                      |
| `DN-AUD-004-R09` | extender reglas de Vento OS a VITAL por coexistencia física                       | restringido documentalmente; pendiente de controles posteriores | `SUPA-ARC-025`; contratos de integración aplicables                           |

Ningún riesgo se considera aceptado, mitigado o cerrado por esta tarea.

#### 17. Decisiones reservadas

Esta tarea no decide:

- qué registro es el sobreviviente de cada grupo;
- qué candidatos deberán fusionarse, desactivarse, relacionarse o conservarse;
- si `Choco Bites` y `Chocobites` representan el mismo producto;
- si las variantes de `Chai`, `Latte` o `Maíz Dulce` admiten corrección automática;
- qué categorías, tipos o unidades deberán cambiarse;
- qué perfiles de compra, remisión o uso general son redundantes;
- qué campos forman la clave canónica de identidad por entidad;
- qué representación se utilizará para búsqueda o unicidad;
- qué reglas son deterministas, dependen de diccionario o requieren revisión humana;
- qué funciones, triggers, aplicaciones o integraciones producen actualmente cada repetición;
- cómo se reasignarán relaciones, inventario, movimientos, recetas, proveedores e historial;
- ninguna modificación física en Supabase.

Las decisiones quedan asignadas a `DATA-NORM-AUD-005` a `DATA-NORM-AUD-007`, `DATA-NORM-ARC-001`, `DATA-NORM-ARC-002`, `DATA-NORM-ARC-007` a `DATA-NORM-ARC-010`, `DATA-NORM-ARC-012` y las tareas de transición correspondientes.

#### 18. Criterios de integridad de la auditoría

La auditoría se considera íntegra para esta etapa cuando:

1. conserva por separado el valor original y las representaciones comparativas;
2. diferencia coincidencia exacta, variante de forma y colisión de búsqueda;
3. aplica scope por dominio, territorio, jerarquía, tipo y contexto;
4. separa duplicados probables, homónimos, versiones, colisiones estructurales y falsos positivos;
5. revisa actividad, versión y procedencia antes de interpretar una repetición;
6. incorpora cantidad, unidad y contexto para presentaciones y políticas;
7. prohíbe resolver identidad de personas por nombre;
8. registra la huella relacional necesaria antes de cualquier fusión;
9. vincula cada brecha con una tarea propietaria concreta;
10. no autoriza correcciones, fusiones, desactivaciones ni cambios físicos;
11. conserva la frontera separada de VITAL.

#### 19. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

Justificación: esta tarea detecta, clasifica y prioriza evidencia del estado actual, pero no aprueba todavía una clave canónica de identidad, una representación de búsqueda, una regla de unicidad, un umbral de duplicidad, una acción de consolidación, un procedimiento de fusión ni una transición ejecutable. Los comportamientos verificables deberán originarse cuando las tareas arquitectónicas y de transición definan los contratos de comparación, revisión, conservación, unicidad, reasignación, auditoría y rollback.

#### 20. Continuidad

```text
ÚLTIMA TAREA APROBADA
DATA-NORM-AUD-003 — Identificar marcas, siglas, unidades, razones sociales y excepciones que no admiten transformación genérica
        ↓
TAREA ACTUAL APROBADA
DATA-NORM-AUD-004 — Detectar duplicados semánticos mediante valores normalizados de comparación
        ↓
SIGUIENTE TAREA RESERVADA
DATA-NORM-AUD-005 — Clasificar transformaciones deterministas, correcciones por diccionario y casos ambiguos
```


### [ ] DATA-NORM-AUD-005 — Clasificar transformaciones deterministas, correcciones por diccionario y casos ambiguos
### [ ] DATA-NORM-AUD-006 — Inventariar triggers, funciones, código cliente y procesos externos que actualmente modifican texto
### [ ] DATA-NORM-AUD-007 — Medir impacto de normalización sobre búsquedas, integraciones, relaciones y unicidad

Regla de auditoría

La auditoría deberá diferenciar:

VALOR MOSTRADO
→ texto empresarial visible para personas

VALOR DE BÚSQUEDA
→ representación tolerante para búsquedas y comparación

VALOR EXTERNO ORIGINAL
→ dato recibido desde una integración o importación

IDENTIFICADOR TÉCNICO
→ código que no debe corregirse ortográficamente

La coincidencia entre dos valores normalizados no autoriza por sí sola
fusionar registros.

Toda posible fusión deberá revisar:

- relaciones;
- movimientos;
- recetas;
- inventario;
- proveedores;
- integraciones;
- historial;
- auditoría.
