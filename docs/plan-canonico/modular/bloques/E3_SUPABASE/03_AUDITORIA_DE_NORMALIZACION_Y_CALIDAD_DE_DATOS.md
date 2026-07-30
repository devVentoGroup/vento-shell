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


### [ ] DATA-NORM-AUD-003 — Identificar marcas, siglas, unidades, razones sociales y excepciones que no admiten transformación genérica
### [ ] DATA-NORM-AUD-004 — Detectar duplicados semánticos mediante valores normalizados de comparación
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
