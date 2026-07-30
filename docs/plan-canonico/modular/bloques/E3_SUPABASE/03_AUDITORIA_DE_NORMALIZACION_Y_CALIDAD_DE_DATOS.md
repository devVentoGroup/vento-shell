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


### [ ] DATA-NORM-AUD-002 — Detectar inconsistencias de espacios, mayúsculas, Unicode, tildes, signos y conectores
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
