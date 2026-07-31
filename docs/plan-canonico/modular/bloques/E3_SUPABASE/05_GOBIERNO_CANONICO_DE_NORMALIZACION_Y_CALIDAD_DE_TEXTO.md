### GOBIERNO CANÓNICO DE NORMALIZACIÓN Y CALIDAD DE TEXTO

### ✅ DATA-NORM-ARC-001 — Definir política de normalización por dominio, entidad y campo

**Estado:** APROBADA
**Tarea anterior:** `DATA-NORM-AUD-007 — Medir impacto de normalización sobre búsquedas, integraciones, relaciones y unicidad` — APROBADA
**Tarea siguiente:** `DATA-NORM-ARC-002 — Definir clases de campo y tratamiento permitido`
**Tipo de tarea:** definición normativa de gobierno de normalización textual por dominio, entidad, campo, representación y fuente propietaria; sin DDL, DML, migraciones, backfills, correcciones de datos, fusiones, cambios de índices, constraints, funciones, triggers, clientes, integraciones, configuración ni despliegues

#### 1. Objetivo

Definir la política canónica que deberá resolver, antes de cualquier transformación textual, qué tratamiento corresponde a un valor según su dominio empresarial, entidad propietaria, campo semántico, representación, procedencia y versión de regla.

La política elimina la posibilidad de aplicar una función universal por tipo SQL, schema, aplicación o apariencia visual. Todo tratamiento deberá quedar gobernado por una decisión explícita y verificable; cuando esa decisión no exista, el comportamiento será conservar el valor y bloquear cualquier corrección automática destructiva.

#### 2. Artefacto producido

```text
DATA-TEXT-NORMALIZATION-POLICY-REGISTRY-001@1.0.0
```

| Propiedad                                 |          Valor |
| ----------------------------------------- | -------------: |
| Universo textual auditado                 | 1.543 columnas |
| Columnas persistidas auditadas            |          1.200 |
| Columnas derivadas auditadas              |            343 |
| Fronteras actuales auditadas              |              9 |
| Perfiles mínimos de tratamiento aprobados |             11 |
| Familias semánticas con política inicial  |             12 |
| Requisitos de prueba nuevos               |             12 |
| Cambios físicos autorizados               |              0 |

#### 3. Fuentes canónicas consumidas

| Fuente                                  | Decisión consumida                                                                                           |
| --------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| `01_PROTOCOLO.md`                       | continuidad, una sola tarea, separación entre definición e implementación y preservación histórica           |
| `delivery-contract.json`                | identidad del artefacto de tarea y actualización completa del registro 04A cuando cambian requisitos         |
| `active-sequence.json`                  | `DATA-NORM-ARC-001` como tarea actual y `DATA-NORM-ARC-002` como siguiente tarea reservada                   |
| `DATA-NORM-AUD-001`                     | universo textual, representaciones y prohibición de inferir política desde tipo o schema                     |
| `DATA-NORM-AUD-002`                     | inconsistencias observadas de espacios, caja, Unicode, tildes, signos y conectores                           |
| `DATA-NORM-AUD-003`                     | marcas, siglas, unidades, razones sociales, personas, externos e identificadores protegidos                  |
| `DATA-NORM-AUD-004`                     | colisiones normalizadas, homónimos, versiones, scopes y prohibición de fusionar por texto                    |
| `DATA-NORM-AUD-005`                     | niveles de decisión, operaciones deterministas candidatas y casos ambiguos                                   |
| `DATA-NORM-AUD-006`                     | productores distribuidos, copias, snapshots, helpers incompatibles e integraciones                           |
| `DATA-NORM-AUD-007`                     | impacto sobre búsqueda, unicidad, referencias, copias, consumidores y contratos externos                     |
| Regla preliminar del bloque propietario | ausencia de `Title Case` universal, tratamientos mínimos por familia, conectores preliminares e idempotencia |
| Arquitectura E3 aprobada                | dominio como responsabilidad estable, fuente propietaria única, capas derivadas y frontera separada de VITAL |

#### 4. Alcance y fronteras

Esta tarea gobierna:

1. la resolución de una política por dominio, entidad y campo;
2. la precedencia entre política de campo, entidad y dominio;
3. la separación entre valor mostrado, valor de búsqueda, valor externo original, identificador técnico, texto libre, snapshot y proyección;
4. el tratamiento mínimo de las familias expresamente incluidas en el bloque propietario;
5. el comportamiento seguro cuando un campo no ha sido clasificado;
6. la relación entre fuente propietaria y copias derivadas;
7. los niveles de decisión permitidos;
8. la obligación de idempotencia;
9. los datos mínimos del registro de políticas;
10. las fronteras que deberán respetar las tareas posteriores.

Esta tarea no define:

- la taxonomía final de clases de campo;
- el algoritmo exacto de capitalización;
- la lista definitiva de conectores;
- el catálogo definitivo de marcas, siglas, unidades y nombres legales;
- las entradas del diccionario ortográfico;
- la cola y workflow de revisión humana;
- el algoritmo de búsqueda o comparación;
- la estructura física de auditoría y versionado;
- los scopes de unicidad;
- la capa ejecutora definitiva;
- el contrato detallado de cada integración externa;
- ninguna corrección, fusión, backfill o migración.

Estas decisiones permanecen en `DATA-NORM-ARC-002` a `DATA-NORM-ARC-012` y en las tareas de transición aplicables.

#### 5. Principios obligatorios

1. **No existe `Title Case` universal.** La apariencia de un valor no autoriza una transformación global.
2. **La política se resuelve por contexto.** Tipo SQL, schema, tabla, nombre de columna o aplicación consumidora no son suficientes.
3. **La fuente propietaria prevalece.** Una vista, snapshot, catálogo derivado, reporte o integración consumidora no define por sí sola la forma canónica del origen.
4. **El valor original no se destruye por conveniencia.** Los valores externos, oficiales, personales, técnicos o históricos se preservan cuando la trazabilidad lo exige.
5. **La búsqueda no reemplaza la presentación.** Una representación tolerante puede coexistir con el valor mostrado, pero no sustituirlo.
6. **La normalización no define identidad.** Dos valores que convergen después de normalizarse no quedan autorizados para fusión, desactivación o reasignación.
7. **La herencia solo puede restringir.** Una política heredada no podrá ampliar operaciones permitidas ni eliminar exclusiones de una política más específica.
8. **Toda ambigüedad falla de forma cerrada.** Se conserva el valor y se requiere decisión explícita.
9. **Toda regla es versionada.** El resultado deberá poder atribuirse a una política y versión determinadas.
10. **Toda regla es idempotente.** Aplicarla nuevamente sobre su propio resultado no lo modifica.
11. **VITAL permanece separado.** La coexistencia física no transfiere las reglas de Vento OS.
12. **La ausencia de política es una brecha, no un permiso.** Un campo sin resolución queda protegido contra corrección automática.

#### 6. Coordenada canónica de resolución

Toda decisión deberá resolverse mediante la siguiente coordenada lógica:

```text
dominio propietario
+ entidad propietaria
+ campo semántico
+ representación
+ rol de fuente
+ versión de política
```

La coordenada no depende del nombre de una aplicación consumidora ni de la ubicación física actual en `public`, `pass`, `pos`, `talento`, `viso` u otro schema legacy.

La política deberá poder mapear tanto el modelo actual como la arquitectura objetivo sin cambiar su significado empresarial.

#### 7. Registro mínimo de política

Cada entrada del registro deberá declarar como mínimo:

| Atributo                                | Obligación                                                                                   |
| --------------------------------------- | -------------------------------------------------------------------------------------------- |
| dominio propietario                     | responsabilidad empresarial canónica                                                         |
| entidad propietaria                     | agregado o maestro que gobierna el valor                                                     |
| campo semántico                         | propiedad empresarial exacta, independiente del nombre físico legacy                         |
| campo físico o trayectoria estructurada | columna, clave JSON o elemento gobernado en cada implementación                              |
| representación                          | mostrada, búsqueda, externa original, técnica, libre, snapshot o proyección                  |
| rol de fuente                           | fuente autoritativa, override aprobado, snapshot histórico, copia sincronizable o proyección |
| perfil de tratamiento                   | política mínima resuelta para el campo                                                       |
| operaciones permitidas                  | transformaciones autorizadas para esa coordenada                                             |
| operaciones prohibidas                  | transformaciones que deberán fallar o pasar a revisión                                       |
| exclusiones                             | marcas, siglas, unidades, razones legales, nombres propios, formatos o tokens protegidos     |
| fuente de autoridad                     | evidencia empresarial, legal, técnica o externa que aprueba la forma                         |
| propietario y steward                   | responsables de significado, calidad y decisión                                              |
| consumidores                            | aplicaciones, funciones, integraciones, reportes y procesos dependientes                     |
| versión y vigencia                      | versión, inicio, retiro y compatibilidad de la regla                                         |
| conducta ante ambigüedad                | preservar, sugerir, revisar o bloquear                                                       |
| auditoría y reversibilidad              | evidencia requerida cuando el valor persistido cambie                                        |
| impacto de transición                   | compatibilidad, backfill, alias, resincronización o revisión necesaria                       |
| estado de la política                   | aprobada, en revisión, bloqueada o retirada con historia conservada                          |

Ninguna entrada podrá omitirse porque una función existente ya aplique `trim`, `lower`, `replace`, transliteración, slug o una comparación local.

#### 8. Precedencia e herencia

La resolución seguirá este orden estricto:

```text
POLÍTICA EXPLÍCITA DEL CAMPO
        ↓
POLÍTICA EXPLÍCITA DE LA ENTIDAD
        ↓
POLÍTICA RESTRICTIVA DEL DOMINIO
        ↓
CONSERVAR Y BLOQUEAR CORRECCIÓN AUTOMÁTICA
```

Reglas:

1. una política de campo prevalece sobre entidad y dominio;
2. una política de entidad solo aplica a campos declarados compatibles;
3. una política de dominio no podrá imponer capitalización, diccionario o eliminación de signos a todos sus textos;
4. la política global predeterminada es preservar el valor y no transformarlo;
5. una herencia ambigua, múltiple o contradictoria produce estado bloqueado;
6. un consumidor no podrá reemplazar la política propietaria por una variante local;
7. una excepción específica prevalece sobre una regla general;
8. una regla retirada conserva su versión histórica para interpretar valores anteriores.

#### 9. Separación de representaciones

| Representación                 | Política mínima                                                                                    |
| ------------------------------ | -------------------------------------------------------------------------------------------------- |
| `VALOR_MOSTRADO`               | preservar significado, idioma, signos y excepciones; aplicar solo el perfil aprobado para el campo |
| `VALOR_DE_BUSQUEDA`            | derivar por contrato separado; no mostrar como sustituto ni usar como identidad automática         |
| `VALOR_EXTERNO_ORIGINAL`       | conservar payload, forma, procedencia y versión cuando exista trazabilidad o firma                 |
| `IDENTIFICADOR_TECNICO`        | validar formato, estabilidad, unicidad y dominio; excluir corrección comercial                     |
| `TEXTO_LIBRE`                  | limitarse a reglas propias de prosa libre y evitar cambios destructivos silenciosos                |
| `SNAPSHOT_PERSISTIDO`          | declarar si es histórico, inmutable o resincronizable; no corregirlo como fuente independiente     |
| `PROYECCION_DE_SALIDA`         | adaptar para el canal sin retroalimentar la fuente de manera implícita                             |
| `ESTRUCTURA_TEXTUAL_COMPUESTA` | resolver política por clave o elemento; nunca normalizar el contenedor completo como cadena        |

La coexistencia de varias representaciones deberá conservar un vínculo explícito con la misma fuente y versión de política.

#### 10. Perfiles mínimos de tratamiento

Los siguientes perfiles son resultados normativos mínimos de esta tarea y no sustituyen la taxonomía final que deberá aprobar `DATA-NORM-ARC-002`:

| Perfil mínimo                  | Conducta                                                                                      |
| ------------------------------ | --------------------------------------------------------------------------------------------- |
| `COMMERCIAL_NAME`              | admite normalización comercial aprobada, después de aplicar exclusiones y reglas específicas  |
| `STRUCTURED_PRESENTATION_NAME` | preserva cantidad, unidad, multiplicador y estructura antes de normalizar la etiqueta visible |
| `OFFICIAL_LEGAL_NAME`          | conserva escritura legal u oficial y su procedencia                                           |
| `OFFICIAL_BRAND_FORM`          | conserva la grafía oficial de marca o denominación comercial                                  |
| `FREE_TEXT`                    | admite únicamente reglas propias de texto libre                                               |
| `TECHNICAL_IDENTIFIER`         | no admite capitalización comercial ni corrección ortográfica                                  |
| `PERSON_OR_ACTOR_NAME`         | conserva identidad declarada y requiere política propia                                       |
| `ADDRESS_OR_LOCATION_TEXT`     | conserva números, orden, abreviaturas y signos hasta contrato específico                      |
| `EXTERNAL_ORIGINAL`            | preserva el valor recibido y permite derivaciones separadas                                   |
| `SEARCH_DERIVATION`            | produce una representación tolerante sin sustituir el valor mostrado                          |
| `UNCLASSIFIED_PRESERVE`        | conserva el valor y bloquea toda corrección automática hasta clasificación                    |

#### 11. Política inicial por dominio, entidad y campo

La siguiente matriz aprueba el tratamiento mínimo. Los nombres representan conceptos semánticos; el mapeo a columnas actuales y futuras deberá conservar la misma decisión.

| Dominio o familia propietaria                                               | Entidad semántica                                               | Campo o familia de campo          | Perfil mínimo                  | Regla aprobada                                                                                                       |
| --------------------------------------------------------------------------- | --------------------------------------------------------------- | --------------------------------- | ------------------------------ | -------------------------------------------------------------------------------------------------------------------- |
| `product_catalog`                                                           | producto                                                        | nombre de producto                | `COMMERCIAL_NAME`              | aplicar normalización comercial aprobada; nunca `Title Case` universal                                               |
| `product_catalog`                                                           | categoría de producto                                           | nombre de categoría               | `COMMERCIAL_NAME`              | aplicar normalización comercial aprobada con conectores y excepciones versionados                                    |
| `recipes`                                                                   | receta                                                          | nombre de receta                  | `COMMERCIAL_NAME`              | aplicar normalización comercial aprobada sin alterar términos culinarios, marcas o nombres históricos por inferencia |
| `product_catalog`, `inventory` o `procurement` según ownership              | presentación física                                             | nombre o etiqueta de presentación | `STRUCTURED_PRESENTATION_NAME` | preservar cantidades, unidades, multiplicadores y contexto de uso                                                    |
| `procurement`                                                               | proveedor                                                       | razón social o nombre legal       | `OFFICIAL_LEGAL_NAME`          | conservar escritura legal u oficial; no aplicar capitalización comercial                                             |
| dominio propietario de la entidad marcada                                   | marca o activo con marca                                        | marca o denominación oficial      | `OFFICIAL_BRAND_FORM`          | conservar grafía oficial, incluida capitalización interna, signos y separación                                       |
| cualquier dominio                                                           | entidad con descripción, nota, mensaje o instrucciones          | descripción libre                 | `FREE_TEXT`                    | corregir únicamente según reglas propias de texto libre y con respeto por autoría e historial                        |
| cualquier dominio                                                           | entidad con SKU, código, código de barras, URL, email o API key | identificador técnico             | `TECHNICAL_IDENTIFIER`         | no aplicar capitalización comercial ni corrección ortográfica                                                        |
| `workforce`, `recruiting`, `customer_engagement` u otro dominio de persona  | persona, trabajador, candidato, cliente o contacto              | nombre personal                   | `PERSON_OR_ACTOR_NAME`         | preservar identidad declarada; no aplicar reglas empresariales universales                                           |
| `facilities`, `inventory`, `logistics`, `procurement` u otro dominio físico | dirección, ubicación, pasillo, nivel o descriptor físico        | texto de dirección o ubicación    | `ADDRESS_OR_LOCATION_TEXT`     | preservar estructura significativa; toda corrección requiere contrato propio                                         |
| cualquier dominio integrado                                                 | entidad o evento externo                                        | valor original recibido           | `EXTERNAL_ORIGINAL`            | conservar forma y procedencia; una forma canónica o de búsqueda será derivada separada                               |
| cualquier dominio                                                           | entidad buscable                                                | representación de búsqueda        | `SEARCH_DERIVATION`            | no reemplaza el valor mostrado ni autoriza fusión o unicidad sin contrato específico                                 |

Todos los demás campos textuales de los dominios aprobados reciben inicialmente `UNCLASSIFIED_PRESERVE` hasta que una entrada explícita del registro resuelva su tratamiento.

#### 12. Regla canónica para nombres comerciales

No se aplicará `Title Case` universalmente.

Los nombres de producto, categoría y receta seguirán este orden conceptual cuando su política específica lo autorice:

```text
valor de entrada
        ↓
normalización determinista de espacios y Unicode permitida por el campo
        ↓
capitalización empresarial aprobada
        ↓
diccionario aprobado y versionado
        ↓
excepciones de marcas, siglas, unidades, nombres legales y términos protegidos
        ↓
valor mostrado resultante
```

Ejemplo gobernado para un nombre comercial:

```text
"  harina   DE maiz "
        ↓
espacios normalizados
        ↓
capitalización empresarial
        ↓
diccionario aprobado
        ↓
"Harina de Maíz"
```

Este ejemplo no autoriza aplicar la misma secuencia a razones sociales, marcas, personas, direcciones, texto libre, valores externos o identificadores técnicos.

#### 13. Conectores preliminares

Mientras `DATA-NORM-ARC-004` no apruebe el listado definitivo, los siguientes conectores permanecen como conjunto preliminar y no podrán incorporarse como regla irreversible:

```text
a
al
con
de
del
e
el
en
la
las
lo
los
o
para
por
sin
u
y
```

En nombres comerciales, el comportamiento preliminar esperado es mantenerlos en minúscula cuando no sean la primera palabra, siempre que una excepción o denominación oficial no disponga otra cosa.

Ejemplos esperados:

```text
americano
→ Americano

pan masa madre clasico
→ Pan Masa Madre Clásico

harina de maiz
→ Harina de Maíz

jugo de naranja y mango
→ Jugo de Naranja y Mango
```

El resultado definitivo depende de `DATA-NORM-ARC-003`, `DATA-NORM-ARC-004`, `DATA-NORM-ARC-005` y `DATA-NORM-ARC-006`.

#### 14. Excepciones protegidas desde esta política

Las siguientes formas demuestran por qué la política no puede ser universal:

```text
"3M"
→ conservar escritura oficial

"iPhone"
→ conservar escritura oficial

"Coca-Cola"
→ conservar escritura oficial

"COMERCIALIZADORA ABC S.A.S."
→ conservar razón social aprobada

"500 g"
→ conservar cantidad y unidad normalizadas

"expresso"
→ no corregir silenciosamente hasta determinar si corresponde a:
  - error ortográfico;
  - denominación comercial;
  - nombre histórico;
  - marca o producto externo.
```

Una forma protegida podrá coexistir con una clave de búsqueda separada, pero nunca será sobrescrita por esa clave.

#### 15. Política para presentaciones, cantidades y unidades

1. La presentación se interpretará como estructura, no como prosa plana.
2. Cantidad, unidad, multiplicador, empaque, contexto y equivalencia deberán permanecer distinguibles.
3. `500 g`, `Pote x 2`, `Bolsa de 1.100 ml`, `Six Pack` y códigos como `kg`, `ml`, `un` o `dz` no podrán procesarse mediante eliminación genérica de signos o cambio de caja.
4. La etiqueta visible no será identidad suficiente de una presentación.
5. La política del nombre visible no modificará factores de conversión, unidades de stock, unidades de entrada ni contexto de compra, remisión o uso general.
6. Una colisión de etiquetas no autoriza consolidar perfiles o políticas.

#### 16. Política para fuentes, copias y propagación

1. Cada campo tendrá una fuente propietaria identificable.
2. Una copia persistida deberá clasificarse como snapshot histórico, override aprobado o copia sincronizable.
3. Corregir una copia sin tratar la fuente propietaria queda prohibido.
4. Una corrección de fuente deberá declarar qué consumidores reciben el cambio y cuáles conservan historia.
5. Las divergencias entre producto y catálogo no se interpretarán automáticamente como defectos.
6. Las proyecciones de reporte, push, billetera, archivo o respuesta API no retroalimentarán la fuente de forma implícita.
7. Los valores externos se conservarán junto con el mapeo canónico cuando exista traducción de estado, categoría, moneda, dirección o identidad.
8. Los helpers actuales de slug, normalización, navegación y SKU permanecen separados por propósito hasta que las tareas propietarias definan su convergencia.

#### 17. Niveles de decisión

```text
NORMALIZACIÓN DETERMINISTA
→ automática, solo para operaciones de forma autorizadas por la política del campo

CORRECCIÓN MEDIANTE DICCIONARIO APROBADO
→ automática, versionada, acotada, auditable y reversible

CORRECCIÓN AMBIGUA
→ sugerencia o revisión humana; el valor original permanece sin cambio automático
```

Además:

- un valor protegido se conserva o recibe una representación derivada;
- un problema estructural o relacional se remite a la arquitectura de identidad, unicidad o transición;
- ningún nivel de decisión autoriza por sí mismo fusionar registros.

#### 18. Orden obligatorio de decisión

```text
1. resolver dominio, entidad, campo y fuente propietaria
        ↓
2. resolver representación y rol de fuente
        ↓
3. aplicar política explícita o herencia restrictiva
        ↓
4. aplicar exclusiones y formas protegidas
        ↓
5. evaluar operaciones deterministas permitidas
        ↓
6. consultar diccionario y excepciones aprobados
        ↓
7. enviar ambigüedad a revisión humana
        ↓
8. separar cualquier problema estructural o relacional
        ↓
9. producir representaciones derivadas sin sustituir el original
        ↓
10. registrar versión, decisión, resultado y transición requerida
```

Ninguna capa podrá saltar etapas porque el resultado parezca visualmente correcto.

#### 19. Idempotencia

Toda regla aprobada deberá cumplir:

```text
normalize(normalize(value, policy_version), policy_version)
=
normalize(value, policy_version)
```

La idempotencia se evaluará sobre:

- el valor resultante;
- la clasificación de la decisión;
- las representaciones derivadas;
- la detección de excepciones;
- la ausencia de nuevos cambios después de la primera aplicación;
- el comportamiento ante reintentos y procesos programados.

Una regla que produzca resultados diferentes por repetición, orden de capa, locale implícito o versión no declarada queda bloqueada.

#### 20. Política de seguridad ante campos no clasificados

Cuando no exista una política activa y resoluble:

1. el valor se conserva sin transformación automática;
2. no se aplica capitalización empresarial;
3. no se consulta un diccionario de corrección;
4. no se eliminan tildes, signos, separadores o caracteres;
5. no se crea una clave de identidad a partir del texto;
6. no se activa unicidad normalizada;
7. no se propaga una forma corregida a copias o integraciones;
8. el campo queda registrado como brecha para clasificación posterior.

Este comportamiento es obligatorio para los campos que la auditoría no pudo clasificar por nomenclatura y para cualquier campo nuevo sin registro de política.

#### 21. JSON, arreglos, vistas y campos derivados

1. Cada clave textual de JSON deberá resolver su propia política.
2. Cada elemento de un arreglo deberá declarar si conserva orden, duplicados y significado posicional.
3. Un enum o arreglo de enum se trata como identificador técnico hasta decisión expresa.
4. Una vista hereda la semántica de sus fuentes y no crea autoridad textual nueva.
5. Un campo calculado deberá declarar algoritmo, versión y relación con el original.
6. Un snapshot histórico no se resincroniza por defecto.
7. Una copia sincronizable deberá tener evento o procedimiento de resincronización y conducta ante corrección retroactiva.

#### 22. Relación con unicidad y fusiones

La política de normalización podrá producir señales de comparación, pero no decidirá identidad.

Toda posible fusión deberá revisar, como mínimo:

- dominio, tipo, categoría, territorio, padre y contexto;
- relaciones y consumidores;
- movimientos e inventario;
- recetas, lotes y producción;
- proveedores, precios y compras;
- catálogo, pedidos y ventas;
- integraciones y referencias externas;
- versiones, estados e historial;
- auditoría, evidencia y rollback.

La coincidencia entre valores normalizados no autoriza por sí sola fusionar registros.

#### 23. Decisiones reservadas

Permanecen reservadas:

| Decisión                                                    | Tarea propietaria                                      |
| ----------------------------------------------------------- | ------------------------------------------------------ |
| clases finales de campo y operaciones permitidas            | `DATA-NORM-ARC-002`                                    |
| capitalización empresarial                                  | `DATA-NORM-ARC-003`                                    |
| conectores definitivos                                      | `DATA-NORM-ARC-004`                                    |
| marcas, siglas, unidades y nombres legales                  | `DATA-NORM-ARC-005`                                    |
| diccionario ortográfico y gobierno                          | `DATA-NORM-ARC-006`                                    |
| cola de revisión humana                                     | `DATA-NORM-ARC-007`                                    |
| búsqueda y comparación                                      | `DATA-NORM-ARC-008`                                    |
| auditoría, versionado e idempotencia operativa              | `DATA-NORM-ARC-009`                                    |
| unicidad y duplicados normalizados                          | `DATA-NORM-ARC-010`                                    |
| capas de ejecución y precedencia técnica                    | `DATA-NORM-ARC-011`                                    |
| datos externos e integraciones                              | `DATA-NORM-ARC-012`                                    |
| dependencias, backfills, compatibilidad, pruebas y rollback | tareas `SUPA-TRANS-*` y `DATA-NORM-TRANS-*` aplicables |

#### 24. Criterios de integridad

La política se considera íntegra para esta etapa cuando:

1. no permite `Title Case` universal;
2. resuelve la política mediante dominio, entidad, campo, representación, fuente y versión;
3. aplica precedencia de campo sobre entidad y dominio;
4. conserva un comportamiento seguro para campos no clasificados;
5. incorpora exactamente los tratamientos mínimos del bloque propietario;
6. separa valor mostrado, búsqueda, externo, técnico, libre, snapshot y proyección;
7. protege marcas, siglas, unidades, razones legales, personas, direcciones e identificadores;
8. preserva cantidades y unidades en presentaciones;
9. conserva fuentes externas originales;
10. impide que una copia derivada defina la política de la fuente;
11. distingue normalización determinista, diccionario y revisión humana;
12. exige idempotencia;
13. prohíbe fusiones por coincidencia normalizada;
14. conserva VITAL como frontera separada;
15. no autoriza cambios físicos ni anticipa las decisiones de las tareas siguientes.

#### 25. Requisitos de prueba derivados

Se crean los requisitos:

- `TREQ-DATA-006`;
- `TREQ-DATA-007`;
- `TREQ-DATA-008`;
- `TREQ-DATA-009`;
- `TREQ-DATA-010`;
- `TREQ-DATA-011`;
- `TREQ-DATA-012`;
- `TREQ-DATA-013`;
- `TREQ-DATA-014`;
- `TREQ-DATA-015`;
- `TREQ-DATA-016`;
- `TREQ-DATA-017`.

El detalle canónico de cada requisito reside en el registro 04A actualizado hasta esta tarea.

#### 26. Continuidad

```text
ÚLTIMA TAREA APROBADA
DATA-NORM-AUD-007 — Medir impacto de normalización sobre búsquedas, integraciones, relaciones y unicidad
        ↓
TAREA ACTUAL APROBADA
DATA-NORM-ARC-001 — Definir política de normalización por dominio, entidad y campo
        ↓
SIGUIENTE TAREA RESERVADA
DATA-NORM-ARC-002 — Definir clases de campo y tratamiento permitido
```


### ✅ DATA-NORM-ARC-002 — Definir clases de campo y tratamiento permitido

**Estado:** APROBADA
**Tarea anterior:** `DATA-NORM-ARC-001 — Definir política de normalización por dominio, entidad y campo` — APROBADA
**Tarea siguiente:** `DATA-NORM-ARC-003 — Definir reglas de capitalización para nombres empresariales`
**Tipo de tarea:** definición normativa de taxonomía de campos textuales, roles de representación, roles de fuente y tratamientos permitidos; sin DDL, DML, migraciones, backfills, correcciones de datos, fusiones, cambios de índices, constraints, funciones, triggers, clientes, integraciones, configuración ni despliegues

#### 1. Objetivo

Definir la taxonomía canónica que deberá clasificar cada campo textual gobernado por Vento OS y determinar, por operación, qué tratamientos pueden considerarse elegibles, cuáles requieren una regla posterior, cuáles solo pueden producir una representación derivada y cuáles permanecen prohibidos.

La clasificación deberá impedir que una misma función trate como equivalentes nombres comerciales, presentaciones estructuradas, razones sociales, marcas, personas, direcciones, texto libre, vocabularios controlados, unidades, identificadores, contactos, secretos, valores externos, snapshots o proyecciones.

Esta tarea materializa la decisión reservada por `DATA-NORM-ARC-001`: la política efectiva no se resolverá únicamente con un perfil genérico, sino mediante la intersección de una clase semántica, un rol de representación, un rol de fuente, una operación solicitada y las excepciones aplicables.

#### 2. Artefacto producido

```text
DATA-TEXT-FIELD-CLASS-AND-TREATMENT-CATALOG-002@1.0.0
```

| Propiedad                             | Valor |
| ------------------------------------- | ----: |
| Clases semánticas primarias aprobadas |    14 |
| Roles de representación aprobados     |     7 |
| Roles de fuente aprobados             |     6 |
| Modos de tratamiento aprobados        |     8 |
| Familias de operación gobernadas      |    13 |
| Requisitos de prueba nuevos           |    19 |
| Cambios físicos autorizados           |     0 |

#### 3. Fuentes canónicas consumidas

| Fuente                                | Decisión consumida                                                                                                                         |
| ------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| `01_PROTOCOLO.md`                     | continuidad, una sola tarea, fase exclusivamente documental y preservación de decisiones aprobadas                                         |
| `delivery-contract.json`              | identidad del artefacto y actualización integral del registro 04A al crear requisitos                                                      |
| `active-sequence.json`                | `DATA-NORM-ARC-002` como tarea actual y `DATA-NORM-ARC-003` como siguiente tarea reservada                                                 |
| `DATA-NORM-ARC-001`                   | coordenada de política, precedencia, perfiles mínimos, separación de representaciones, preservación, idempotencia y comportamiento cerrado |
| `DATA-NORM-AUD-001`                   | universo textual, estructuras JSON, arreglos, enums, vistas y campos todavía no clasificables                                              |
| `DATA-NORM-AUD-002`                   | defectos de forma, variantes de caja, espacios, tildes, signos y conectores                                                                |
| `DATA-NORM-AUD-003`                   | marcas, siglas, unidades, razones sociales, personas, externos, identificadores y falsos positivos                                         |
| `DATA-NORM-AUD-004`                   | duplicados probables, homónimos, versiones, scopes y huella relacional previa a cualquier consolidación                                    |
| `DATA-NORM-AUD-005`                   | normalización determinista, diccionario aprobado, revisión humana, preservación y resolución estructural                                   |
| `DATA-NORM-AUD-006`                   | productores distribuidos, copias persistidas, snapshots, proyecciones, helpers técnicos e integraciones                                    |
| `DATA-NORM-AUD-007`                   | impacto sobre búsquedas, índices, unicidad, relaciones, consumidores y contratos externos                                                  |
| Regla canónica del bloque propietario | ausencia de `Title Case` universal, tratamiento mínimo por familia, protección de cantidades, unidades, formas oficiales e idempotencia    |

#### 4. Alcance y fronteras

Esta tarea define:

1. las clases semánticas primarias permitidas para campos textuales;
2. los roles de representación que distinguen el propósito de cada valor;
3. los roles de fuente que determinan autoridad, mutabilidad y propagación;
4. los modos cerrados de tratamiento aplicables a cada operación;
5. las familias de operaciones que deberán declararse expresamente;
6. la forma de resolver el tratamiento efectivo mediante intersección restrictiva;
7. el tratamiento mínimo de las familias ya aprobadas en `DATA-NORM-ARC-001`;
8. la clasificación de campos compuestos, polimórficos, derivados o contaminados semánticamente;
9. la conducta ante campos sin clasificación o con clasificación contradictoria;
10. el gobierno de cambios de clase.

Esta tarea no define:

- el algoritmo concreto de capitalización;
- la lista definitiva de conectores;
- el catálogo de marcas, siglas, unidades o nombres legales;
- entradas concretas del diccionario ortográfico;
- el workflow de revisión humana;
- el algoritmo de búsqueda, transliteración o slug;
- la estructura física del registro de políticas;
- scopes o constraints de unicidad;
- la capa ejecutora definitiva;
- el tratamiento detallado de cada integración externa;
- correcciones, fusiones, backfills, migraciones ni cambios de datos.

Estas decisiones permanecen en `DATA-NORM-ARC-003` a `DATA-NORM-ARC-012` y en las tareas de transición aplicables.

#### 5. Modelo canónico de clasificación

Cada campo o componente textual gobernado deberá resolver una tupla completa:

```text
CLASE SEMÁNTICA PRIMARIA
+ ROL DE REPRESENTACIÓN
+ ROL DE FUENTE
+ OPERACIÓN SOLICITADA
+ EXCEPCIONES APLICABLES
+ VERSIÓN DE POLÍTICA
```

Reglas obligatorias:

1. cada campo físico o trayectoria estructurada tendrá exactamente una clase semántica primaria activa;
2. cada valor almacenado o derivado tendrá exactamente un rol de representación activo;
3. cada implementación tendrá exactamente un rol de fuente activo;
4. etiquetas auxiliares de sensibilidad, idioma, territorio o canal podrán complementar la tupla, pero no sustituirla;
5. una columna con significados incompatibles no podrá cambiar de clase por fila mediante heurística silenciosa;
6. una estructura polimórfica solo admitirá clases distintas cuando exista un discriminador explícito, validado y versionado;
7. el contenido observado no prevalece sobre el contrato semántico del campo;
8. ante ausencia, conflicto o imposibilidad de resolver cualquiera de las tres dimensiones, se aplicará `UNCLASSIFIED_PRESERVE` y se bloqueará toda mutación automática.

#### 6. Catálogo cerrado de clases semánticas primarias

| Clase                          | Significado canónico                                                                                                                 | Ejemplos o familias                                                    | Tratamiento base                                                                                    |
| ------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| `COMMERCIAL_NAME`              | nombre empresarial visible que identifica un producto, categoría, receta, colección u otra entidad comercial gobernada               | nombre de producto, categoría de producto, receta                      | elegible para normalización comercial únicamente mediante reglas aprobadas                          |
| `STRUCTURED_PRESENTATION_NAME` | etiqueta visible cuya semántica depende de cantidad, unidad, multiplicador, empaque, contexto o equivalencia                         | `500 g`, `Pote x 2`, `Bolsa 1 kg`, `Six Pack`                          | preservar y resolver estructura antes de aplicar cambios visibles                                   |
| `HUMAN_LABEL`                  | etiqueta, título o nombre visible que no constituye por sí mismo una denominación comercial, legal, personal ni técnica              | títulos de interfaz, etiquetas operativas, nombres auxiliares          | solo operaciones de forma expresamente autorizadas; no hereda normalización comercial               |
| `OFFICIAL_LEGAL_NAME`          | razón social, nombre legal u otra denominación oficial de persona jurídica o entidad                                                 | proveedor, facturación, nombre oficial                                 | conservar forma autorizada, puntuación, conectores y sufijos                                        |
| `OFFICIAL_BRAND_FORM`          | marca, denominación comercial oficial o forma protegida                                                                              | `3M`, `iPhone`, `Coca-Cola`, marcas empresariales                      | conservar grafía oficial y aplicar únicamente excepciones aprobadas                                 |
| `PERSON_OR_ACTOR_NAME`         | nombre declarado de persona, trabajador, candidato, cliente, contacto o actor                                                        | nombre completo, nombres, apellidos, alias personal                    | preservar identidad declarada; cualquier corrección requiere política propia y trazabilidad         |
| `ADDRESS_OR_LOCATION_TEXT`     | dirección, descriptor físico o nombre de ubicación cuya estructura puede incluir números, abreviaturas, signos y orden significativo | dirección, pasillo, nivel, zona, ubicación                             | preservar estructura; no aplicar prosa o capitalización genérica                                    |
| `FREE_TEXT`                    | contenido humano abierto que expresa descripción, nota, mensaje, motivo, observación o instrucción                                   | descripción, notas, mensajes, razones                                  | aplicar únicamente reglas propias de texto libre y conservar autoría e historial cuando corresponda |
| `CONTROLLED_VOCABULARY_CODE`   | valor perteneciente a un catálogo contractual cerrado                                                                                | estado, tipo, rol, permiso, aplicación, familia técnica                | validar contra catálogo; no corregir ortografía ni presentación comercial                           |
| `MEASUREMENT_OR_UNIT_CODE`     | símbolo, código o familia controlada de medida, conteo o unidad                                                                      | `g`, `kg`, `ml`, `l`, `un`, `dz`, `count`, `mass`, `volume`            | validar por catálogo de unidades y preservar significado técnico                                    |
| `TECHNICAL_IDENTIFIER`         | identificador, clave o referencia estable consumida por software, dispositivos o integraciones                                       | SKU, código, código de barras, slug, URL, modelo, serie, referencia    | permitir solo canonicalización técnica declarada por contrato                                       |
| `CONTACT_IDENTIFIER`           | identificador de contacto cuyo matching y formato dependen de un estándar o contrato específico                                      | email, teléfono, canal de contacto                                     | validar o canonicalizar únicamente mediante contrato propio; nunca mediante reglas comerciales      |
| `SECRET_OR_SIGNATURE_MATERIAL` | valor cuya integridad depende de conservar exactamente sus bytes o representación contractual                                        | API key, token, hash, firma, checksum, secreto, material criptográfico | preservar exactamente; toda transformación textual queda prohibida                                  |
| `UNCLASSIFIED_PRESERVE`        | campo cuyo significado o tratamiento no se ha resuelto de forma suficiente                                                           | campos legacy, mezclas semánticas, columnas sin owner o contrato       | conservar y bloquear mutación automática, diccionario, unicidad y propagación corregida             |

El catálogo es cerrado. Una clase nueva requerirá una tarea canónica que declare necesidad, frontera con las clases existentes, operaciones permitidas, riesgos, compatibilidad y requisitos de prueba.

#### 7. Reglas de asignación de clase semántica

1. La clase se asignará por significado empresarial y contrato, no por tipo SQL, nombre de tabla, nombre de columna, schema, aplicación o frecuencia de valores.
2. `name`, `label`, `code`, `value`, `description` o claves equivalentes no determinan una clase por sí solas.
3. El mismo término podrá pertenecer a clases distintas en campos distintos; por ejemplo, `Vento` puede ser marca, nombre visible, código o parte de texto libre según el contrato.
4. La capitalización observada no convierte una palabra en marca, sigla o código.
5. Un campo de marca que contiene marca, modelo y descripción no se clasificará como marca limpia; permanecerá protegido hasta descomposición o decisión explícita.
6. Un campo de unidad que mezcla código, etiqueta, cantidad y empaque no recibirá una sola regla de cadena; deberá separar estructura o permanecer bloqueado.
7. Un nombre repetido entre insumo, preparación y producto de venta conserva clases o entidades distintas según su significado, aunque el texto sea idéntico.
8. Una clase semántica no autoriza por sí sola una mutación; la operación deberá ser permitida además por representación, fuente, excepciones y versión.

#### 8. Roles de representación

| Rol                   | Propósito                                                                       | Restricción mínima                                                              |
| --------------------- | ------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- |
| `PRIMARY_VALUE`       | valor principal que expresa el contenido semántico de la entidad                | su mutación depende de la clase y de una fuente autorizada                      |
| `DISPLAY_OVERRIDE`    | forma visible deliberadamente distinta de la principal para un canal o contexto | no se convierte en fuente ni altera el principal de manera implícita            |
| `SEARCH_DERIVATION`   | clave tolerante destinada exclusivamente a búsqueda o comparación               | no se muestra como sustituto, no crea identidad y no autoriza unicidad o fusión |
| `EXTERNAL_ORIGINAL`   | valor recibido desde integración, importación o proveedor                       | conserva forma, procedencia, versión y payload cuando corresponda               |
| `HISTORICAL_SNAPSHOT` | copia congelada que representa el valor válido en un momento o transacción      | no se resincroniza ni corrige por defecto                                       |
| `OUTPUT_PROJECTION`   | forma adaptada para reporte, push, archivo, billetera, URL, API o interfaz      | no retroalimenta la fuente y debe conservar vínculo con ella                    |
| `AUDIT_EVIDENCE`      | valor o huella conservada para reconstruir una decisión, cambio o evento        | permanece inmutable salvo corrección aditiva vinculada                          |

Una misma entidad puede tener varias representaciones, pero cada campo físico o valor derivado deberá declarar exactamente cuál almacena o produce.

#### 9. Roles de fuente

| Rol                    | Autoridad y mutabilidad                                                                           |
| ---------------------- | ------------------------------------------------------------------------------------------------- |
| `AUTHORITATIVE_SOURCE` | gobierna el valor para la entidad y es la única fuente que puede originar una corrección canónica |
| `APPROVED_OVERRIDE`    | conserva una variación explícita, acotada y gobernada frente a la fuente principal                |
| `SYNCHRONIZED_COPY`    | replica una fuente mediante contrato, evento o procedimiento de resincronización                  |
| `IMMUTABLE_SNAPSHOT`   | preserva historia y no cambia por correcciones posteriores de la fuente                           |
| `EXTERNAL_EVIDENCE`    | conserva el dato recibido y su procedencia; el mapeo canónico se almacena o calcula por separado  |
| `OUTPUT_ONLY`          | existe únicamente para un consumidor o canal y no tiene autoridad de escritura sobre la fuente    |

Un rol de fuente nunca amplía el tratamiento permitido por la clase semántica. `APPROVED_OVERRIDE`, `SYNCHRONIZED_COPY`, `IMMUTABLE_SNAPSHOT`, `EXTERNAL_EVIDENCE` y `OUTPUT_ONLY` solo pueden mantener o restringir permisos.

#### 10. Modos cerrados de tratamiento

Cada combinación de clase, representación, fuente y operación deberá resolver uno de los siguientes modos:

| Modo                             | Significado                                                                                                          |
| -------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| `DETERMINISTIC_MUTATION_ALLOWED` | la operación de forma puede modificar el valor mediante una regla explícita, idempotente y versionada                |
| `DICTIONARY_MUTATION_ALLOWED`    | la operación léxica puede modificar el valor usando una entrada aprobada, acotada, auditable y reversible            |
| `DERIVATION_ONLY`                | la operación puede producir otra representación, pero no modificar el valor de origen                                |
| `VALIDATION_ONLY`                | la operación puede aceptar, rechazar o comparar el valor según un contrato sin reescribirlo                          |
| `HUMAN_REVIEW_REQUIRED`          | el valor se conserva y la decisión exige evidencia y actor revisor                                                   |
| `PRESERVE_EXACT`                 | el valor debe mantenerse sin transformación textual                                                                  |
| `STRUCTURAL_RESOLUTION_REQUIRED` | el problema corresponde a estructura, identidad, relaciones, ciclo de vida o fuente y no se resuelve cambiando texto |
| `PROHIBITED`                     | la operación no puede ejecutarse para esa coordenada                                                                 |

La ausencia de un modo explícito equivale a `PROHIBITED`. Ningún consumidor podrá interpretar silencio, nulidad o falta de configuración como autorización.

#### 11. Familias de operación gobernadas

| Operación                        | Alcance                                                                                         |
| -------------------------------- | ----------------------------------------------------------------------------------------------- |
| `UNICODE_CANONICALIZATION`       | normalización de composición Unicode sin cambiar significado ni material firmado                |
| `EDGE_WHITESPACE_TRIM`           | eliminación de espacios de borde cuando no sean parte del contrato                              |
| `INTERNAL_WHITESPACE_COMPACTION` | compactación de separadores internos accidentales                                               |
| `PROSE_PUNCTUATION_SPACING`      | tratamiento de espacios alrededor de puntuación de prosa                                        |
| `COMMERCIAL_CAPITALIZATION`      | capitalización empresarial definida por `DATA-NORM-ARC-003`                                     |
| `CONNECTOR_CASE_POLICY`          | tratamiento de conectores definido por `DATA-NORM-ARC-004`                                      |
| `APPROVED_DICTIONARY_CORRECTION` | sustitución léxica gobernada por `DATA-NORM-ARC-006`                                            |
| `OFFICIAL_EXCEPTION_APPLICATION` | preservación o sustitución desde catálogos aprobados por `DATA-NORM-ARC-005`                    |
| `TECHNICAL_CANONICALIZATION`     | caja, separadores, formato o validación definida por un contrato técnico específico             |
| `SEARCH_KEY_DERIVATION`          | generación de una representación de búsqueda según `DATA-NORM-ARC-008`                          |
| `STRUCTURED_PARSE_OR_RENDER`     | interpretación o composición de cantidades, unidades, multiplicadores y etiquetas estructuradas |
| `SOURCE_PROPAGATION_OR_RESYNC`   | propagación de una corrección entre fuente, override, copia o snapshot                          |
| `IDENTITY_OR_RECORD_ACTION`      | fusión, desactivación, reasignación, unicidad o selección de registro sobreviviente             |

`IDENTITY_OR_RECORD_ACTION` nunca podrá resolverse como mutación textual. Siempre exige `STRUCTURAL_RESOLUTION_REQUIRED` o `PROHIBITED` dentro de este catálogo.

#### 12. Resolución del tratamiento efectivo

El tratamiento efectivo se obtiene mediante intersección, no mediante suma permisiva:

```text
permiso de la clase semántica
∩ restricción de la representación
∩ restricción del rol de fuente
∩ operación solicitada
∩ excepciones aprobadas
∩ versión vigente
=
modo efectivo
```

Precedencia obligatoria:

1. `PRESERVE_EXACT` y `PROHIBITED` prevalecen sobre cualquier permiso general;
2. `STRUCTURAL_RESOLUTION_REQUIRED` impide convertir un problema no textual en corrección;
3. `HUMAN_REVIEW_REQUIRED` prevalece cuando la evidencia no es suficiente;
4. `DERIVATION_ONLY` impide modificar el valor de origen;
5. `VALIDATION_ONLY` no autoriza persistir una forma alternativa;
6. los modos de mutación solo aplican cuando todas las dimensiones los permiten;
7. una excepción específica puede restringir una regla, pero no ampliar una clase incompatible;
8. una capa local no podrá suavizar el modo resuelto por la política propietaria.

#### 13. Matriz base de tratamiento por clase semántica

| Clase                          | Forma determinista                       | Capitalización y conectores                    | Diccionario                            | Canonicalización técnica                         | Búsqueda separada                            | Mutación directa predeterminada                         |
| ------------------------------ | ---------------------------------------- | ---------------------------------------------- | -------------------------------------- | ------------------------------------------------ | -------------------------------------------- | ------------------------------------------------------- |
| `COMMERCIAL_NAME`              | elegible por política de campo           | elegible solo tras `DATA-NORM-ARC-003` y `004` | elegible solo tras `DATA-NORM-ARC-006` | no aplica                                        | `DERIVATION_ONLY`                            | bloqueada hasta resolver todas las reglas y excepciones |
| `STRUCTURED_PRESENTATION_NAME` | elegible después de preservar estructura | condicionada por etiqueta y excepciones        | condicionada                           | no sobre cantidad ni unidad                      | `DERIVATION_ONLY`                            | bloqueada si la estructura no está resuelta             |
| `HUMAN_LABEL`                  | elegible de forma acotada                | no hereda política comercial                   | solo por política explícita            | no aplica                                        | `DERIVATION_ONLY` cuando sea buscable        | bloqueada por defecto                                   |
| `OFFICIAL_LEGAL_NAME`          | revisión o derivación                    | prohibida como estilo genérico                 | prohibido sin fuente oficial           | no aplica                                        | `DERIVATION_ONLY`                            | `PRESERVE_EXACT` o revisión autorizada                  |
| `OFFICIAL_BRAND_FORM`          | revisión o derivación                    | prohibida como estilo genérico                 | prohibido sin fuente oficial           | no aplica                                        | `DERIVATION_ONLY`                            | `PRESERVE_EXACT` o excepción oficial                    |
| `PERSON_OR_ACTOR_NAME`         | revisión condicionada                    | prohibida como regla empresarial universal     | prohibido sin política de identidad    | no aplica                                        | `DERIVATION_ONLY` si la finalidad lo permite | revisión humana o fuente de identidad                   |
| `ADDRESS_OR_LOCATION_TEXT`     | revisión condicionada                    | prohibida como regla comercial                 | prohibido por defecto                  | contrato específico de dirección                 | `DERIVATION_ONLY`                            | revisión humana o fuente autorizada                     |
| `FREE_TEXT`                    | solo reglas de prosa aprobadas           | no usar capitalización comercial               | condicionado por reglas propias        | no aplica                                        | `DERIVATION_ONLY` si procede                 | bloqueada cuando altere autoría, evidencia o historia   |
| `CONTROLLED_VOCABULARY_CODE`   | no aplica                                | prohibida                                      | prohibida                              | `VALIDATION_ONLY` o canonicalización contractual | derivación solo si se documenta              | únicamente por contrato de catálogo                     |
| `MEASUREMENT_OR_UNIT_CODE`     | no aplica como prosa                     | prohibida                                      | prohibida                              | `VALIDATION_ONLY` o mapeo de catálogo            | derivación separada                          | únicamente por contrato de unidad                       |
| `TECHNICAL_IDENTIFIER`         | prohibida salvo contrato                 | prohibida                                      | prohibida                              | `VALIDATION_ONLY` o regla técnica versionada     | derivación separada cuando corresponda       | únicamente por contrato técnico                         |
| `CONTACT_IDENTIFIER`           | prohibida como prosa                     | prohibida                                      | prohibida                              | `VALIDATION_ONLY` o estándar específico          | derivación separada                          | únicamente por contrato de contacto                     |
| `SECRET_OR_SIGNATURE_MATERIAL` | prohibida                                | prohibida                                      | prohibida                              | validación no destructiva                        | prohibida                                    | `PRESERVE_EXACT`                                        |
| `UNCLASSIFIED_PRESERVE`        | prohibida                                | prohibida                                      | prohibida                              | prohibida                                        | prohibida hasta clasificación                | `PRESERVE_EXACT`                                        |

La matriz define elegibilidad, no algoritmos ni autorización de ejecución. Las tareas propietarias posteriores deberán convertir cada elegibilidad en una regla explícita o mantenerla bloqueada.

#### 14. Tratamiento de nombres comerciales

`COMMERCIAL_NAME` es la única clase que puede heredar la secuencia conceptual de normalización comercial aprobada:

```text
valor de entrada
        ↓
operaciones deterministas permitidas
        ↓
capitalización empresarial aprobada
        ↓
conectores aprobados
        ↓
diccionario aprobado
        ↓
excepciones oficiales
        ↓
valor mostrado
```

La clasificación como `COMMERCIAL_NAME` no activa automáticamente ninguna etapa. Cada operación necesita versión, alcance y excepción compatibles.

Ejemplo de comportamiento futuro condicionado:

```text
"  harina   DE maiz "
→ clase COMMERCIAL_NAME
→ operaciones de espacios permitidas
→ capitalización y conectores aprobados
→ diccionario aprobado
→ "Harina de Maíz"
```

El mismo procedimiento queda prohibido para nombres legales, marcas, personas, direcciones, texto libre, códigos, secretos o valores externos.

#### 15. Tratamiento de presentaciones, cantidades y unidades

1. `STRUCTURED_PRESENTATION_NAME` clasifica la etiqueta visible; los componentes cuantitativos deberán permanecer en campos estructurados cuando existan.
2. `MEASUREMENT_OR_UNIT_CODE` clasifica símbolos, códigos y familias técnicas; no es equivalente a la etiqueta visible.
3. La cantidad, unidad de entrada, unidad de stock, multiplicador, empaque, contexto, equivalencia y vigencia forman parte del contrato estructural.
4. `500 g`, `Pote x 2`, `Bolsa de 1.100 ml`, `Six Pack` y `six_pack` no pueden tratarse como cadenas intercambiables.
5. El render de una presentación deberá partir de estructura gobernada; el parseo desde texto solo será automático cuando una gramática explícita elimine la ambigüedad.
6. Una etiqueta coincidente no crea identidad ni unicidad de perfil UOM o política de solicitud.
7. Una corrección visible no modifica factores de conversión, cantidades, unidades o contexto funcional.

#### 16. Tratamiento de formas oficiales y personales

1. `OFFICIAL_LEGAL_NAME` y `OFFICIAL_BRAND_FORM` conservan la forma aprobada por una fuente autorizada.
2. Puntos, guiones, ampersands, conectores, sufijos, capitalización interna y separación pueden ser significativos.
3. `3M`, `iPhone`, `Coca-Cola` y `COMERCIALIZADORA ABC S.A.S.` no admiten reglas genéricas de palabras.
4. `PERSON_OR_ACTOR_NAME` no recibe `Title Case` universal, eliminación de tildes ni corrección empresarial por frecuencia.
5. `ADDRESS_OR_LOCATION_TEXT` preserva números, orden, abreviaturas, signos y procedencia.
6. Cuando se proponga una corrección, el valor original, la evidencia, el actor y la decisión deberán conservarse conforme a `DATA-NORM-ARC-007` y `009`.

#### 17. Tratamiento de texto libre y etiquetas humanas

1. `FREE_TEXT` conserva la diferencia entre contenido, autoría, momento y contexto.
2. Recorte, espacios o puntuación solo serán elegibles cuando la política del campo los declare reglas de prosa y no alteren evidencia, plantillas, Markdown, saltos de línea o formatos significativos.
3. El diccionario no podrá reescribir silenciosamente mensajes, motivos, declaraciones o instrucciones históricas.
4. `HUMAN_LABEL` no se tratará como `COMMERCIAL_NAME` por ser visible.
5. Una etiqueta humana podrá tener una política de forma propia, pero no heredará automáticamente capitalización, conectores o diccionario comercial.

#### 18. Tratamiento de códigos, identificadores, contactos y secretos

1. `CONTROLLED_VOCABULARY_CODE` se valida contra un catálogo cerrado y versionado.
2. `MEASUREMENT_OR_UNIT_CODE` se valida contra el catálogo de unidades y su significado dimensional.
3. `TECHNICAL_IDENTIFIER` conserva estabilidad, alfabeto, separadores, longitud, caja y consumidores definidos por su contrato.
4. `CONTACT_IDENTIFIER` aplica únicamente estándares propios de email, teléfono o canal; una regla comercial queda prohibida.
5. `SECRET_OR_SIGNATURE_MATERIAL` se preserva exactamente. No admite recorte, Unicode, cambio de caja, transliteración, diccionario, logging del valor ni clave de búsqueda derivada.
6. Un API key, token, hash, firma o checksum no puede repararse silenciosamente; un valor inválido deberá rechazarse o sustituirse mediante el proceso propietario.
7. Los helpers de slug, navegación, SKU y códigos existentes permanecen como contratos técnicos distintos hasta `DATA-NORM-ARC-008`, `009` y `011`.

#### 19. Representaciones y fuentes derivadas

1. Una `SEARCH_DERIVATION` se calcula o almacena separadamente y conserva vínculo con el valor y versión que la originaron.
2. Un `EXTERNAL_ORIGINAL` con rol `EXTERNAL_EVIDENCE` no se sobrescribe con la forma canónica interna.
3. Un `HISTORICAL_SNAPSHOT` con rol `IMMUTABLE_SNAPSHOT` no se resincroniza por una corrección posterior.
4. Una `SYNCHRONIZED_COPY` deberá declarar evento, procedimiento, dirección de propagación y conducta ante conflicto.
5. Un `DISPLAY_OVERRIDE` deberá declarar alcance, propietario y precedencia frente al valor principal.
6. Una `OUTPUT_PROJECTION` con rol `OUTPUT_ONLY` no podrá retroalimentar la fuente.
7. `AUDIT_EVIDENCE` permanece inmutable y cualquier rectificación se registra de forma aditiva.
8. Corregir una copia, snapshot, proyección o evidencia como si fuera fuente autoritativa queda prohibido.

#### 20. JSON, arreglos, vistas y campos polimórficos

1. Un objeto JSON no recibe una sola clase por ser JSON; cada trayectoria textual deberá clasificarse.
2. Un arreglo deberá clasificar sus elementos y declarar si orden, duplicados y posición son significativos.
3. Enums y arreglos de enum se clasifican inicialmente como `CONTROLLED_VOCABULARY_CODE`.
4. Una vista hereda clase, representación y fuente de los campos que proyecta; no adquiere autoridad propia.
5. Una concatenación o campo calculado deberá declarar las clases de entrada, la clase de salida, el algoritmo y la versión.
6. Una estructura polimórfica requerirá discriminador cerrado; un valor desconocido se tratará como `UNCLASSIFIED_PRESERVE`.
7. Una columna que mezcle marca, modelo y descripción; unidad, cantidad y etiqueta; o nombre y código deberá descomponerse o permanecer bloqueada.

#### 21. Campos no clasificados y alta de campos nuevos

Cuando un campo resuelva `UNCLASSIFIED_PRESERVE`:

1. se conserva el valor;
2. se bloquean mutaciones deterministas y por diccionario;
3. se bloquea capitalización, conectores y excepciones aplicadas automáticamente;
4. no se crea representación de búsqueda salvo decisión explícita no destructiva;
5. no se activa unicidad normalizada;
6. no se propaga una forma corregida;
7. se registra owner, dominio, entidad, consumidores y brecha de clasificación;
8. se exige clasificación antes de habilitar automatización o dependencia contractual nueva.

Todo campo textual nuevo deberá registrar su tupla de clasificación antes de entrar en producción. La ausencia de registro no podrá resolverse mediante inferencia en runtime.

#### 22. Cambio de clase y compatibilidad

Una clasificación aprobada no podrá cambiarse silenciosamente. Toda reclasificación deberá declarar:

- clase, representación y fuente anteriores;
- clase, representación y fuente propuestas;
- motivo y evidencia;
- propietario y steward;
- consumidores, índices, constraints, funciones, triggers, clientes e integraciones afectados;
- valores y casos que cambiarían de modo de tratamiento;
- compatibilidad temporal;
- necesidad de backfill, alias, resincronización o revisión humana;
- pruebas de paridad y regresión;
- rollback;
- versión y vigencia;
- conservación de la interpretación histórica.

La reubicación física de una columna no cambia su clase. Un cambio de clase no autoriza modificar datos hasta que la transición propietaria quede aprobada.

#### 23. Relación con identidad, unicidad y fusiones

1. La clasificación textual determina tratamiento de valores, no identidad de registros.
2. `SEARCH_DERIVATION`, capitalización, diccionario o forma oficial pueden producir coincidencias sin demostrar equivalencia empresarial.
3. Una operación `IDENTITY_OR_RECORD_ACTION` siempre se remite a `DATA-NORM-ARC-010` y a la transición correspondiente.
4. Toda posible fusión deberá revisar dominio, tipo, categoría, territorio, padre, contexto, relaciones, movimientos, inventario, recetas, producción, proveedores, compras, catálogo, ventas, integraciones, versiones, historial, auditoría, evidencia y rollback.
5. La coincidencia entre dos valores normalizados no autoriza por sí sola fusionar registros.

#### 24. Mapeo mínimo de familias auditadas

| Familia de campo                                            | Clase semántica                          | Representación habitual                                 | Rol de fuente esperado                       |
| ----------------------------------------------------------- | ---------------------------------------- | ------------------------------------------------------- | -------------------------------------------- |
| nombre de producto, categoría o receta                      | `COMMERCIAL_NAME`                        | `PRIMARY_VALUE`                                         | `AUTHORITATIVE_SOURCE`                       |
| etiqueta de presentación                                    | `STRUCTURED_PRESENTATION_NAME`           | `PRIMARY_VALUE` o `HISTORICAL_SNAPSHOT`                 | fuente, copia o snapshot según entidad       |
| razón social de proveedor                                   | `OFFICIAL_LEGAL_NAME`                    | `PRIMARY_VALUE` o `EXTERNAL_ORIGINAL`                   | `AUTHORITATIVE_SOURCE` o `EXTERNAL_EVIDENCE` |
| marca oficial                                               | `OFFICIAL_BRAND_FORM`                    | `PRIMARY_VALUE`                                         | `AUTHORITATIVE_SOURCE`                       |
| descripción, nota, mensaje, motivo o instrucción            | `FREE_TEXT`                              | `PRIMARY_VALUE`, `OUTPUT_PROJECTION` o `AUDIT_EVIDENCE` | según contrato                               |
| nombre de persona                                           | `PERSON_OR_ACTOR_NAME`                   | `PRIMARY_VALUE` o `EXTERNAL_ORIGINAL`                   | fuente de identidad o evidencia externa      |
| dirección o ubicación                                       | `ADDRESS_OR_LOCATION_TEXT`               | `PRIMARY_VALUE` o `EXTERNAL_ORIGINAL`                   | fuente propietaria o evidencia externa       |
| estado, tipo, rol, permiso o aplicación                     | `CONTROLLED_VOCABULARY_CODE`             | `PRIMARY_VALUE`                                         | catálogo contractual                         |
| símbolo, código o familia de unidad                         | `MEASUREMENT_OR_UNIT_CODE`               | `PRIMARY_VALUE` o `HISTORICAL_SNAPSHOT`                 | catálogo o snapshot                          |
| SKU, código, barcode, slug, URL, modelo, serie o referencia | `TECHNICAL_IDENTIFIER`                   | `PRIMARY_VALUE`                                         | contrato técnico propietario                 |
| email o teléfono                                            | `CONTACT_IDENTIFIER`                     | `PRIMARY_VALUE` o `EXTERNAL_ORIGINAL`                   | fuente de identidad o evidencia externa      |
| API key, token, hash, firma, checksum o secreto             | `SECRET_OR_SIGNATURE_MATERIAL`           | `PRIMARY_VALUE` o `EXTERNAL_ORIGINAL`                   | fuente técnica o evidencia externa           |
| nombre o categoría copiados a catálogo o reglas PULSO       | conserva la clase semántica de origen    | `HISTORICAL_SNAPSHOT`, `DISPLAY_OVERRIDE` o copia       | debe resolverse explícitamente               |
| clave tolerante para búsqueda                               | conserva referencia a la clase de origen | `SEARCH_DERIVATION`                                     | derivación sin autoridad                     |
| campo sin significado suficiente                            | `UNCLASSIFIED_PRESERVE`                  | la observada                                            | rol sin resolver; mutación bloqueada         |

El mapeo es mínimo y no sustituye el registro exhaustivo por dominio, entidad y campo exigido por `DATA-NORM-ARC-001`.

#### 25. Ejemplos de clasificación

| Valor o caso                                       | Clasificación                                                       | Resultado permitido en esta etapa                                                                   |
| -------------------------------------------------- | ------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| `"  harina   DE maiz "` en nombre de producto      | `COMMERCIAL_NAME` + `PRIMARY_VALUE` + `AUTHORITATIVE_SOURCE`        | operaciones futuras condicionadas a capitalización, conectores, diccionario y excepciones aprobados |
| `500 g` en etiqueta de presentación                | `STRUCTURED_PRESENTATION_NAME`; `g` como `MEASUREMENT_OR_UNIT_CODE` | preservar cantidad y unidad; render o búsqueda separados                                            |
| `COMERCIALIZADORA ABC S.A.S.`                      | `OFFICIAL_LEGAL_NAME`                                               | preservar forma oficial y procedencia                                                               |
| `3M`, `iPhone`, `Coca-Cola`                        | `OFFICIAL_BRAND_FORM`                                               | preservar forma oficial; catálogo de excepciones posterior                                          |
| `expresso` en nombre comercial                     | `COMMERCIAL_NAME` con ambigüedad                                    | `HUMAN_REVIEW_REQUIRED` hasta decidir error, marca, historia o valor externo                        |
| `champiñones,tomates cherry` en descripción        | `FREE_TEXT`                                                         | puntuación elegible solo mediante regla propia del campo y fuente propietaria                       |
| `Carlos  Ibarra`                                   | `PERSON_OR_ACTOR_NAME`                                              | conservar o revisar mediante fuente de identidad; no aplicar regla comercial                        |
| `CÚCUTA , NORTE DE SANTANDER` en dirección externa | `ADDRESS_OR_LOCATION_TEXT` + `EXTERNAL_ORIGINAL`                    | preservar original; una forma de búsqueda sería derivada                                            |
| `NEXO`, `approved`, `count`                        | `CONTROLLED_VOCABULARY_CODE`                                        | validación por catálogo, sin corrección comercial                                                   |
| `kg`, `ml`, `un`, `dz`                             | `MEASUREMENT_OR_UNIT_CODE`                                          | validación por catálogo de unidades                                                                 |
| SKU, barcode o slug                                | `TECHNICAL_IDENTIFIER`                                              | canonicalización únicamente por contrato técnico                                                    |
| email                                              | `CONTACT_IDENTIFIER`                                                | validación o canonicalización propia del canal                                                      |
| API key, token o firma                             | `SECRET_OR_SIGNATURE_MATERIAL`                                      | `PRESERVE_EXACT`                                                                                    |
| nombre copiado a un catálogo histórico             | misma clase semántica del origen + `HISTORICAL_SNAPSHOT`            | conservar historia; no resincronizar por defecto                                                    |

#### 26. Decisiones reservadas

| Decisión                                                       | Tarea propietaria                                      |
| -------------------------------------------------------------- | ------------------------------------------------------ |
| reglas de capitalización empresarial                           | `DATA-NORM-ARC-003`                                    |
| conectores que permanecen en minúscula                         | `DATA-NORM-ARC-004`                                    |
| catálogo de marcas, siglas, unidades y nombres legales         | `DATA-NORM-ARC-005`                                    |
| diccionario ortográfico y su gobierno                          | `DATA-NORM-ARC-006`                                    |
| cola y workflow de revisión humana                             | `DATA-NORM-ARC-007`                                    |
| algoritmo y almacenamiento de búsqueda y comparación           | `DATA-NORM-ARC-008`                                    |
| auditoría, versionado e idempotencia operativa                 | `DATA-NORM-ARC-009`                                    |
| identidad, unicidad y duplicados normalizados                  | `DATA-NORM-ARC-010`                                    |
| capas de ejecución y precedencia técnica                       | `DATA-NORM-ARC-011`                                    |
| contratos de datos externos                                    | `DATA-NORM-ARC-012`                                    |
| materialización, backfills, compatibilidad, pruebas y rollback | tareas `SUPA-TRANS-*` y `DATA-NORM-TRANS-*` aplicables |

#### 27. Criterios de integridad

La taxonomía se considera íntegra para esta etapa cuando:

1. cada campo resuelve una clase semántica, una representación y un rol de fuente;
2. las tres dimensiones permanecen independientes y se intersectan de forma restrictiva;
3. el catálogo de clases es cerrado;
4. la ausencia de modo explícito equivale a prohibición;
5. solo `COMMERCIAL_NAME` puede resultar elegible para normalización comercial;
6. `STRUCTURED_PRESENTATION_NAME` preserva cantidades, unidades y contexto;
7. marcas, nombres legales, personas y direcciones no reciben reglas genéricas;
8. texto libre y etiquetas humanas conservan políticas propias;
9. códigos, unidades, identificadores, contactos y secretos quedan fuera de la corrección comercial;
10. secretos y material firmado se preservan exactamente;
11. búsqueda, externos, snapshots, copias, proyecciones y auditoría no se convierten en fuente;
12. JSON, arreglos, vistas y campos polimórficos se clasifican por componente;
13. campos sin clasificación fallan de forma cerrada;
14. cambios de clase son versionados y requieren análisis de impacto;
15. ninguna clasificación autoriza identidad, unicidad o fusión;
16. se conserva la frontera separada de VITAL;
17. no se anticipan algoritmos ni cambios físicos reservados a tareas posteriores.

#### 28. Requisitos de prueba derivados

Se crean los requisitos:

- `TREQ-DATA-018`;
- `TREQ-DATA-019`;
- `TREQ-DATA-020`;
- `TREQ-DATA-021`;
- `TREQ-DATA-022`;
- `TREQ-DATA-023`;
- `TREQ-DATA-024`;
- `TREQ-DATA-025`;
- `TREQ-DATA-026`;
- `TREQ-DATA-027`;
- `TREQ-DATA-028`;
- `TREQ-DATA-029`;
- `TREQ-DATA-030`;
- `TREQ-DATA-031`;
- `TREQ-DATA-032`;
- `TREQ-DATA-033`;
- `TREQ-DATA-034`;
- `TREQ-DATA-035`;
- `TREQ-DATA-036`.

El detalle canónico de cada requisito reside en el registro 04A actualizado hasta esta tarea.

#### 29. Continuidad

```text
ÚLTIMA TAREA APROBADA
DATA-NORM-ARC-001 — Definir política de normalización por dominio, entidad y campo
        ↓
TAREA ACTUAL APROBADA
DATA-NORM-ARC-002 — Definir clases de campo y tratamiento permitido
        ↓
SIGUIENTE TAREA RESERVADA
DATA-NORM-ARC-003 — Definir reglas de capitalización para nombres empresariales
```


### ✅ DATA-NORM-ARC-003 — Definir reglas de capitalización para nombres empresariales

**Estado:** APROBADA
**Tarea anterior:** `DATA-NORM-ARC-002 — Definir clases de campo y tratamiento permitido` — APROBADA
**Tarea siguiente:** `DATA-NORM-ARC-004 — Definir conectores que permanecen en minúscula`
**Tipo de tarea:** definición normativa del algoritmo de capitalización empresarial para campos `COMMERCIAL_NAME`; sin DDL, DML, migraciones, backfills, correcciones de datos, fusiones, cambios de índices, constraints, funciones, triggers, clientes, integraciones, configuración ni despliegues

#### 1. Objetivo

Definir el contrato canónico de capitalización que podrá aplicarse a nombres empresariales de Vento OS clasificados expresamente como `COMMERCIAL_NAME`, sin convertirlo en `Title Case` universal, sin alterar ortografía, identidad, cantidades, unidades, códigos, formas oficiales ni valores externos, y sin anticipar los catálogos reservados a tareas posteriores.

La política deberá producir el mismo resultado en todas las capas para una misma entrada, contexto y versión, conservar exactamente los tokens protegidos, tratar la ambigüedad de forma cerrada y mantener separadas la capitalización visible, la corrección por diccionario, la búsqueda y cualquier acción sobre registros.

#### 2. Artefacto producido

```text
DATA-COMMERCIAL-NAME-CAPITALIZATION-POLICY-003@1.0.0
```

| Propiedad                                   | Valor |
| ------------------------------------------- | ----: |
| Perfil normativo de capitalización aprobado |     1 |
| Clases de token gobernadas                  |     9 |
| Resultados de token permitidos              |     6 |
| Tipos de frontera de segmento               |     3 |
| Requisitos de prueba nuevos                 |    17 |
| Cambios físicos autorizados                 |     0 |

#### 3. Fuentes canónicas consumidas

| Fuente                                | Decisión consumida                                                                                                               |
| ------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| `01_PROTOCOLO.md`                     | continuidad, una sola tarea, fase exclusivamente documental y preservación de decisiones aprobadas                               |
| `delivery-contract.json`              | identidad del artefacto y actualización integral del registro 04A al crear requisitos                                            |
| `active-sequence.json`                | `DATA-NORM-ARC-003` como tarea actual y `DATA-NORM-ARC-004` como siguiente tarea reservada                                       |
| `DATA-NORM-ARC-001`                   | ausencia de `Title Case` universal, resolución por campo, separación de representaciones, idempotencia y comportamiento cerrado  |
| `DATA-NORM-ARC-002`                   | clase `COMMERCIAL_NAME`, roles de representación y fuente, modos cerrados de tratamiento y operación `COMMERCIAL_CAPITALIZATION` |
| `DATA-NORM-AUD-002`                   | variantes observadas de caja, espacios, signos, conectores y tildes                                                              |
| `DATA-NORM-AUD-003`                   | marcas, siglas, unidades, nombres legales, personas, técnicos y formas protegidas                                                |
| `DATA-NORM-AUD-005`                   | separación entre forma determinista, diccionario, revisión humana y resolución estructural                                       |
| `DATA-NORM-AUD-006`                   | algoritmos distribuidos, copias persistidas y riesgo de resultados diferentes entre capas                                        |
| `DATA-NORM-AUD-007`                   | impacto sobre búsqueda, índices, consumidores, copias, unicidad e identidad                                                      |
| Regla canónica del bloque propietario | ejemplos esperados de nombres comerciales y reserva del catálogo definitivo de conectores para `DATA-NORM-ARC-004`               |

#### 4. Alcance y fronteras

Esta tarea define:

1. las precondiciones para solicitar `COMMERCIAL_CAPITALIZATION`;
2. el perfil normativo de capitalización empresarial en español de Colombia;
3. el modelo de tokenización y recomposición que preserva separadores;
4. la precedencia entre excepciones, conectores, tokens ordinarios y ambigüedad;
5. la regla de caja para palabras ordinarias elegibles;
6. la conducta posicional de conectores, sin aprobar todavía su listado;
7. el tratamiento de puntuación, fronteras de segmento y tokens compuestos;
8. las clases excluidas de esta política;
9. la separación entre capitalización, espacios, Unicode, diccionario, búsqueda e identidad;
10. la conducta sobre fuentes, copias, snapshots y proyecciones;
11. los invariantes de determinismo e idempotencia;
12. el corpus mínimo de conformidad que deberán implementar las tareas posteriores.

Esta tarea no define:

- el listado definitivo de conectores;
- el catálogo definitivo de marcas, siglas, unidades y nombres legales;
- ninguna entrada del diccionario ortográfico;
- el workflow de revisión humana;
- el algoritmo de búsqueda, transliteración o slug;
- la estructura física de auditoría y versionado;
- la capa ejecutora definitiva;
- scopes o constraints de unicidad;
- la forma de tratar valores externos por integración;
- correcciones, fusiones, backfills, migraciones ni cambios de datos.

Estas decisiones permanecen en `DATA-NORM-ARC-004` a `DATA-NORM-ARC-012` y en las tareas de transición aplicables.

#### 5. Perfil normativo y puerta de activación

El perfil aprobado se identifica lógicamente como:

```text
VENTO_COMMERCIAL_CAPITALIZATION_ES_CO@1.0.0
```

La operación solo podrá resolver `DETERMINISTIC_MUTATION_ALLOWED` cuando todas las condiciones siguientes sean verdaderas:

1. la clase semántica es `COMMERCIAL_NAME`;
2. la representación es `PRIMARY_VALUE` o un `DISPLAY_OVERRIDE` expresamente autorizado;
3. el rol de fuente es `AUTHORITATIVE_SOURCE` o `APPROVED_OVERRIDE`;
4. la política del campo permite `COMMERCIAL_CAPITALIZATION`;
5. el idioma y perfil de caja están declarados explícitamente;
6. existe una versión activa del catálogo de conectores de `DATA-NORM-ARC-004`;
7. existe una versión activa del catálogo de excepciones de `DATA-NORM-ARC-005`;
8. no existe conflicto entre política, excepción, fuente o representación;
9. la entrada no contiene tokens que obliguen revisión humana;
10. la operación puede registrar la versión que produjo el resultado.

Mientras los catálogos requeridos no estén aprobados y activos, el perfil queda definido documentalmente pero su mutación automática permanece bloqueada. Un consumidor no podrá sustituirlos por listas locales.

#### 6. Entrada y resultado lógico

La evaluación deberá consumir, como mínimo:

```text
valor de entrada
clase semántica
representación
rol de fuente
idioma o perfil lingüístico
versión de capitalización
versión de conectores
versión de excepciones
política del campo
```

El resultado lógico deberá distinguir:

```text
valor resultante o valor preservado
decisión global
clasificación y resultado de cada token
reglas y versiones aplicadas
casos bloqueados o enviados a revisión
```

Esta tarea no prescribe una tabla, función, RPC, payload ni formato físico. Esos contratos corresponden a `DATA-NORM-ARC-009` y `DATA-NORM-ARC-011`.

#### 7. Secuencia normativa de evaluación

```text
1. resolver la coordenada de política del campo
        ↓
2. conservar el valor de entrada como evidencia lógica
        ↓
3. comprobar clase, representación, fuente y versiones requeridas
        ↓
4. segmentar el texto sin perder separadores ni posiciones
        ↓
5. aplicar excepciones oficiales por coincidencia de frase y token
        ↓
6. clasificar conectores mediante el catálogo vigente
        ↓
7. clasificar tokens ordinarios, técnicos, numéricos o ambiguos
        ↓
8. aplicar caja únicamente a tokens elegibles
        ↓
9. recomponer preservando separadores y estructura
        ↓
10. comprobar idempotencia y producir la traza de decisión
```

La operación de capitalización no ejecuta por sí misma recorte, compactación de espacios, corrección ortográfica, adición de tildes, transliteración, traducción, singularización, pluralización, cambio de signos ni unión o separación de palabras.

#### 8. Modelo de segmentación

La segmentación deberá operar sobre caracteres Unicode y límites de grafema, no sobre bytes ni posiciones de código aisladas.

Clases de token gobernadas:

| Clase de token                | Definición                                                                        | Tratamiento inicial                                        |
| ----------------------------- | --------------------------------------------------------------------------------- | ---------------------------------------------------------- |
| `ORDINARY_LEXICAL_TOKEN`      | palabra compuesta únicamente por letras y marcas combinantes, sin forma protegida | candidata a la regla ordinaria de caja                     |
| `CONNECTOR_TOKEN`             | palabra reconocida por el catálogo versionado de conectores                       | regla posicional de `DATA-NORM-ARC-004`                    |
| `OFFICIAL_EXCEPTION_TOKEN`    | token o frase cubierta por una excepción oficial                                  | preservar o emitir exactamente la forma aprobada           |
| `CONTROLLED_ACRONYM_TOKEN`    | sigla o abreviatura confirmada por catálogo                                       | preservar forma contractual                                |
| `MEASUREMENT_OR_UNIT_TOKEN`   | símbolo, código o denominación de unidad confirmada                               | preservar forma aprobada; no tratar como palabra ordinaria |
| `NUMERIC_TOKEN`               | número entero, decimal, fracción, rango o cantidad                                | preservar exactamente                                      |
| `ALPHANUMERIC_OR_MODEL_TOKEN` | combinación de letras, números o signos con posible función técnica o comercial   | preservar y revisar salvo contrato explícito               |
| `PUNCTUATION_OR_SEPARATOR`    | espacio, signo o separador entre tokens                                           | preservar; solo una operación distinta podrá normalizarlo  |
| `AMBIGUOUS_TOKEN`             | token cuya clase o forma oficial no puede resolverse                              | conservar y producir `HUMAN_REVIEW_REQUIRED`               |

Resultados de token permitidos:

| Resultado                      | Significado                                                              |
| ------------------------------ | ------------------------------------------------------------------------ |
| `CAPITALIZED_ORDINARY`         | se aplicó la regla ordinaria de caja                                     |
| `LOWERCASED_CONNECTOR`         | se emitió un conector interno según el catálogo vigente                  |
| `PRESERVED_OFFICIAL_EXCEPTION` | se conservó o emitió exactamente una forma oficial aprobada              |
| `PRESERVED_NON_CASED`          | se conservó un número, signo, separador, unidad o token no sujeto a caja |
| `PRESERVED_AMBIGUOUS`          | se conservó el token y el resultado global exige revisión humana         |
| `BLOCKED_CONFLICT`             | no se produjo mutación por conflicto de política, catálogo o versión     |

La recomposición deberá mantener el orden y el texto de todos los separadores recibidos. Si una etapa anterior autorizada normalizó espacios o Unicode, la capitalización consumirá ese resultado como una entrada distinta y trazable.

#### 9. Precedencia de clasificación de tokens

La clasificación seguirá esta precedencia estricta:

```text
1. excepción oficial de frase, usando la coincidencia válida más larga
2. excepción oficial de token
3. sigla, unidad, código o forma técnica protegida
4. conector aprobado
5. palabra ordinaria elegible
6. token ambiguo
```

Reglas:

1. una excepción de frase prevalece sobre reglas palabra por palabra;
2. una excepción nunca se infiere por frecuencia, caja observada o apariencia;
3. una coincidencia parcial no autoriza modificar el resto del token;
4. una excepción solo aplica dentro de su dominio, entidad, campo, idioma y vigencia;
5. dos excepciones activas incompatibles bloquean la operación;
6. una ausencia del catálogo no se interpreta como prueba de que el token sea ordinario cuando contiene señales técnicas, mixtas o protegidas.

#### 10. Regla de caja para palabras ordinarias

Un `ORDINARY_LEXICAL_TOKEN` elegible se transforma así:

```text
primer grafema con caja
→ mayúscula según el perfil lingüístico explícito

restantes grafemas con caja
→ minúscula según el mismo perfil

marcas, tildes y grafemas sin caja
→ se conservan
```

Ejemplos exclusivos de caja:

```text
americano → Americano
CAFÉ → Café
árbol → Árbol
ÑAME → Ñame
FRIO → Frio
maiz → Maiz
```

`Frio` y `Maiz` demuestran que la capitalización no agrega tildes ni corrige ortografía. Esas decisiones pertenecen al diccionario de `DATA-NORM-ARC-006`.

La regla ordinaria solo admite tokens cuya forma pueda resolverse de manera determinista después de consultar conectores y excepciones. Un token con capitalización interna desconocida no se fuerza a caja ordinaria.

#### 11. Formas de caja elegibles y ambiguas

| Forma observada                                  | Ejemplo                          | Conducta                                                                                              |
| ------------------------------------------------ | -------------------------------- | ----------------------------------------------------------------------------------------------------- |
| completamente en minúsculas                      | `americano`                      | aplicar regla ordinaria si no existe protección                                                       |
| completamente en mayúsculas                      | `LATTE`                          | aplicar regla ordinaria después de descartar sigla, marca, unidad o código mediante catálogos activos |
| primera letra en mayúscula y resto en minúsculas | `Americano`                      | conservar; ya satisface la regla ordinaria                                                            |
| capitalización interna                           | `iPhone`, `eCommerce`            | preservar por excepción o enviar a revisión; nunca aplanar por defecto                                |
| letras y números                                 | `3M`, `T26`, `REF7071`           | preservar y clasificar mediante catálogo o contrato técnico                                           |
| puntos, guiones o apóstrofos internos            | `S.A.S.`, `Coca-Cola`, `O'Neill` | no descomponer por defecto; excepción o revisión                                                      |
| una sola letra                                   | `A`, `x`                         | conector, sigla o ambigüedad; no aplicar regla ordinaria sin clasificación                            |
| forma no resoluble                               | cualquier token conflictivo      | conservar y producir `HUMAN_REVIEW_REQUIRED`                                                          |

La presencia de mayúsculas completas no convierte una palabra en sigla. La ausencia de una excepción tampoco permite ejecutar el perfil mientras los catálogos obligatorios no estén disponibles.

#### 12. Conducta posicional de conectores

`DATA-NORM-ARC-003` define la conducta posicional, pero no el listado de conectores.

1. El catálogo definitivo y versionado será aprobado por `DATA-NORM-ARC-004`.
2. Un conector ubicado como primera palabra lexical del nombre se capitaliza mediante la regla ordinaria.
3. Un conector ubicado como primera palabra lexical de un segmento declarado se capitaliza mediante la regla ordinaria.
4. Un conector en posición interna se emite en minúscula cuando el catálogo vigente así lo ordene.
5. Un conector incluido dentro de una excepción oficial de frase conserva la forma aprobada por la excepción.
6. Un token no podrá tratarse como conector por coincidencia aproximada, idioma inferido o lista local.
7. La política deberá registrar la versión de conectores usada para producir el resultado.

Hasta que `DATA-NORM-ARC-004` sea aprobada, la lista preliminar del bloque propietario continúa siendo referencia documental y no una regla irreversible de ejecución.

#### 13. Fronteras de segmento y puntuación

Se definen tres tipos de frontera:

| Frontera                 | Efecto sobre el siguiente token lexical                                   |
| ------------------------ | ------------------------------------------------------------------------- |
| `NAME_START`             | inicia el nombre; una palabra ordinaria o conector elegible se capitaliza |
| `DECLARED_SEGMENT_START` | reinicia la regla posicional por una frontera aprobada y versionada       |
| `NO_SEGMENT_RESET`       | preserva la posición interna; no cambia el tratamiento del conector       |

Reglas predeterminadas:

1. el inicio del valor es `NAME_START`;
2. dos puntos y raya larga o corta rodeada por espacios pueden actuar como `DECLARED_SEGMENT_START` cuando la política del campo lo habilite;
3. coma, punto, ampersand, signo más, barra, paréntesis, guion interno y apóstrofo no reinician segmentos por defecto;
4. los signos se conservan exactamente;
5. la capitalización no inserta ni retira espacios alrededor de signos;
6. una frontera no declarada se trata como `NO_SEGMENT_RESET`;
7. una abreviatura con puntos no se interpreta como varias palabras.

#### 14. Palabras compuestas, guiones y apóstrofos

1. Un token con guion o apóstrofo interno no se divide automáticamente.
2. Una marca o frase oficial compuesta se resuelve mediante excepción de frase o token.
3. Una gramática de compuesto solo podrá activarse si declara idioma, delimitador, alcance, excepciones e idempotencia.
4. Sin esa gramática, el token se preserva y se envía a revisión cuando no exista forma oficial.
5. La capitalización no une palabras separadas ni divide una palabra existente.
6. `Choco Bites` y `Chocobites` permanecen como cadenas distintas; esta tarea no decide si representan la misma entidad.

#### 15. Excepciones oficiales y formas protegidas

Las excepciones aprobadas por `DATA-NORM-ARC-005` se aplicarán antes de la regla ordinaria y deberán poder cubrir:

- una frase completa;
- una secuencia de palabras dentro del nombre;
- un token individual;
- una sigla;
- una marca con capitalización interna;
- una unidad o símbolo;
- un término histórico, extranjero o contractual protegido.

Ejemplos normativos:

```text
3M → 3M
iPhone → iPhone
Coca-Cola → Coca-Cola
BBQ → BBQ, solo si la excepción o catálogo lo confirma
Kinder Bueno → preservar únicamente si una excepción de frase aprobada lo cubre
```

Las excepciones deberán declarar alcance, forma emitida, sensibilidad, precedencia y vigencia. Esta tarea no aprueba entradas concretas nuevas.

#### 16. Ambigüedad y comportamiento cerrado

Se produce `HUMAN_REVIEW_REQUIRED` y se conserva el valor cuando ocurra cualquiera de estas condiciones:

1. token con capitalización interna no reconocido;
2. secuencia alfanumérica sin contrato;
3. sigla, abreviatura, modelo o referencia no clasificados;
4. guion, apóstrofo o punto interno sin excepción o gramática;
5. conflicto entre catálogos o versiones;
6. idioma o perfil lingüístico ausente o incompatible;
7. frase que coincide parcialmente con una forma protegida;
8. término marcado como histórico, externo o dudoso;
9. token que podría ser marca, nombre propio o palabra ordinaria;
10. cualquier resultado que dependa de una heurística no versionada.

`expresso`, `Wellmix` frente a `Welmix`, y formas equivalentes permanecen sin corrección silenciosa mientras su significado no esté resuelto. La cola y decisión humana pertenecen a `DATA-NORM-ARC-007`.

#### 17. Clases excluidas

`COMMERCIAL_CAPITALIZATION` queda prohibida por defecto para:

- `STRUCTURED_PRESENTATION_NAME`;
- `HUMAN_LABEL`;
- `OFFICIAL_LEGAL_NAME`;
- `OFFICIAL_BRAND_FORM`;
- `PERSON_OR_ACTOR_NAME`;
- `ADDRESS_OR_LOCATION_TEXT`;
- `FREE_TEXT`;
- `CONTROLLED_VOCABULARY_CODE`;
- `MEASUREMENT_OR_UNIT_CODE`;
- `TECHNICAL_IDENTIFIER`;
- `CONTACT_IDENTIFIER`;
- `SECRET_OR_SIGNATURE_MATERIAL`;
- `UNCLASSIFIED_PRESERVE`.

`HUMAN_LABEL` podrá recibir una política visual propia en otra decisión explícita, pero no heredará este perfil por ser visible. Una forma oficial podrá ser emitida desde su catálogo, pero ese acto corresponde a `OFFICIAL_EXCEPTION_APPLICATION`, no a capitalización genérica.

#### 18. Aplicación por familia empresarial

| Familia                       | Elegibilidad                                           | Restricción principal                                           |
| ----------------------------- | ------------------------------------------------------ | --------------------------------------------------------------- |
| nombre de producto            | elegible como `COMMERCIAL_NAME`                        | proteger marcas, unidades, modelos y términos históricos        |
| nombre de categoría           | elegible como `COMMERCIAL_NAME`                        | aplicar conectores versionados y conservar excepciones          |
| nombre de receta              | elegible como `COMMERCIAL_NAME`                        | proteger vocabulario culinario, extranjero, oficial o histórico |
| nombre de colección comercial | elegible solo si el campo fue clasificado expresamente | no inferir tratamiento desde la aplicación o tabla              |
| otro nombre empresarial       | bloqueado hasta clasificación y política de campo      | no heredar por semejanza o nombre de columna                    |
| etiqueta de presentación      | no elegible bajo este perfil                           | usar `STRUCTURED_PRESENTATION_NAME` y preservar estructura      |

Una entidad llamada igual en capas distintas conserva su clase, fuente e identidad propias. Capitalizar dos valores de la misma forma no los convierte en el mismo registro.

#### 19. Presentaciones, cantidades, unidades y tokens técnicos

1. Un nombre o etiqueta de presentación no se convierte en `COMMERCIAL_NAME` por contener palabras.
2. Cantidades, unidades, multiplicadores, códigos y símbolos se preservan exactamente durante esta operación.
3. `500 g`, `Pote x 2`, `Bolsa de 1.100 ml`, `Six Pack`, `kg`, `ml`, `un` y `dz` requieren políticas estructurales o catálogos propios.
4. Cuando un nombre comercial incluya un fragmento cuantitativo o técnico, ese fragmento se clasifica y preserva antes de capitalizar palabras ordinarias.
5. La operación no cambia factores de conversión, unidades de entrada, unidades de stock ni contextos de compra, remisión o uso general.
6. La coincidencia visual entre etiquetas no autoriza consolidar perfiles o políticas.

#### 20. Separación entre capitalización y otras operaciones

| Operación                             | Pertenece a esta tarea | Conducta                                                |
| ------------------------------------- | ---------------------- | ------------------------------------------------------- |
| cambio de caja de palabras ordinarias | sí                     | aplicar únicamente bajo este contrato                   |
| tratamiento posicional de conectores  | sí, como conducta      | consume el catálogo de `DATA-NORM-ARC-004`              |
| preservación de excepciones           | sí, como precedencia   | consume el catálogo de `DATA-NORM-ARC-005`              |
| recorte o compactación de espacios    | no                     | operación determinista separada                         |
| composición Unicode NFC               | no                     | operación separada y previa cuando el campo la autorice |
| adición o retiro de tildes            | no                     | decisión de diccionario o revisión                      |
| corrección ortográfica                | no                     | `DATA-NORM-ARC-006`                                     |
| traducción o transliteración          | no                     | contrato específico                                     |
| cambio de puntuación                  | no                     | regla separada de prosa o estructura                    |
| unión o división de palabras          | no                     | revisión, diccionario o resolución estructural          |
| búsqueda o slug                       | no                     | `DATA-NORM-ARC-008`                                     |
| fusión, unicidad o identidad          | no                     | `DATA-NORM-ARC-010`                                     |

La salida de una operación separada podrá ser la entrada de otra únicamente mediante una secuencia aprobada, versionada y auditable.

#### 21. Fuentes, representaciones y propagación

1. Solo un `PRIMARY_VALUE` de `AUTHORITATIVE_SOURCE` o un `DISPLAY_OVERRIDE` con `APPROVED_OVERRIDE` puede recibir mutación directa bajo este perfil.
2. `EXTERNAL_ORIGINAL`, `HISTORICAL_SNAPSHOT` y `AUDIT_EVIDENCE` se preservan exactamente.
3. `OUTPUT_PROJECTION` puede derivar una forma capitalizada para un canal sin retroalimentar la fuente.
4. `SEARCH_DERIVATION` no consume la forma capitalizada como identidad salvo contrato posterior explícito.
5. Una `SYNCHRONIZED_COPY` no se corrige de manera independiente; recibe el cambio desde la fuente mediante el contrato de propagación.
6. Un `IMMUTABLE_SNAPSHOT` no se resincroniza por una corrección posterior.
7. Un `APPROVED_OVERRIDE` conserva alcance y precedencia propios y no redefine el valor principal.
8. La propagación, resincronización, eventos y precedencia técnica pertenecen a `DATA-NORM-ARC-009` y `DATA-NORM-ARC-011`.

#### 22. Perfil lingüístico y determinismo

1. El perfil lingüístico deberá declararse como dato de política; no se utilizará el locale del sistema operativo, proceso, navegador o base de datos de forma implícita.
2. Para este perfil, el identificador lógico es `es-CO`.
3. La versión deberá fijar la semántica de segmentación y mapeo de caja Unicode utilizada.
4. Las letras acentuadas, `ñ` y sus marcas se transforman mediante mapeo Unicode de caja sin perder diacríticos.
5. No se transliteran caracteres ni se convierten alfabetos.
6. Un valor perteneciente a otro perfil lingüístico se preserva o se envía a revisión hasta disponer de una política explícita.
7. Cambiar la versión lingüística o Unicode constituye un cambio de política y requiere análisis de impacto.

#### 23. Idempotencia y estabilidad

Para una misma entrada lógica y las mismas versiones:

```text
capitalize(capitalize(value, context), context)
=
capitalize(value, context)
```

La igualdad deberá cubrir:

- el valor resultante;
- la decisión global;
- la clasificación de tokens;
- las excepciones aplicadas;
- la posición de conectores;
- los casos enviados a revisión;
- la traza de versiones.

Un reintento no podrá alterar nuevamente la caja, crear efectos de propagación duplicados ni producir una decisión distinta. Una versión nueva puede producir un resultado nuevo, pero no reinterpreta silenciosamente la historia creada por la versión anterior.

#### 24. Relación con búsqueda, identidad y unicidad

1. La forma capitalizada es un `VALOR_MOSTRADO`, no una clave de identidad.
2. La representación de búsqueda será definida separadamente por `DATA-NORM-ARC-008`.
3. La capitalización no crea ni modifica SKU, slug, código, barcode, URL, email, referencia o clave externa.
4. Dos valores que producen la misma forma capitalizada solo generan una señal de comparación.
5. La política no activa constraints de unicidad.
6. La política no selecciona registro sobreviviente, no desactiva filas y no reasigna relaciones.
7. Toda posible fusión deberá revisar relaciones, movimientos, recetas, inventario, proveedores, integraciones, historial, auditoría, evidencia y rollback según `DATA-NORM-ARC-010` y las transiciones aplicables.

#### 25. Corpus mínimo de conformidad

El corpus deberá comprobar resultados por etapa y no confundir capitalización con diccionario.

| Entrada y contexto                 | Resultado de capitalización                | Resultado o conducta posterior                  |
| ---------------------------------- | ------------------------------------------ | ----------------------------------------------- |
| `americano` como `COMMERCIAL_NAME` | `Americano`                                | sin cambio ortográfico adicional                |
| `pan masa madre clasico`           | `Pan Masa Madre Clasico`                   | `Clásico` solo mediante diccionario aprobado    |
| `harina de maiz`                   | `Harina de Maiz`                           | `Maíz` solo mediante diccionario aprobado       |
| `jugo de naranja y mango`          | `Jugo de Naranja y Mango`                  | conectores según catálogo vigente               |
| `LATTE FRIO`                       | `Latte Frio`                               | `Frío` solo mediante diccionario aprobado       |
| `Bebidas calientes`                | `Bebidas Calientes`                        | mantener si ya satisface la regla               |
| `3M` dentro de nombre              | `3M`                                       | excepción oficial                               |
| `iPhone` dentro de nombre          | `iPhone`                                   | excepción oficial                               |
| `Coca-Cola` dentro de nombre       | `Coca-Cola`                                | excepción oficial de token o frase              |
| `BBQ` dentro de nombre             | preservar o revisar                        | no producir `Bbq` sin catálogo                  |
| `expresso` con ambigüedad activa   | conservar `expresso`                       | revisión humana; no corregir ortografía         |
| `500 g` como presentación          | conservar                                  | clase excluida y estructura preservada          |
| `COMERCIALIZADORA ABC S.A.S.`      | conservar                                  | `OFFICIAL_LEGAL_NAME` excluido                  |
| `Carlos Ibarra`                    | conservar                                  | `PERSON_OR_ACTOR_NAME` excluido                 |
| `NEXO`                             | conservar                                  | vocabulario o identificador controlado excluido |
| `Choco Bites` y `Chocobites`       | capitalizar cada forma solo si es elegible | no unir, dividir ni fusionar registros          |

El corpus deberá incluir además valores vacíos, espacios, Unicode compuesto, signos, paréntesis, guiones, apóstrofos, números, unidades, siglas, marcas, términos extranjeros y conflictos entre catálogos.

#### 26. Errores y estados bloqueantes

La operación deberá bloquear mutación y conservar el valor cuando:

- falta la clasificación del campo;
- falta una versión de capitalización, conectores o excepciones;
- el rol de fuente no autoriza mutación;
- la representación es externa, histórica o probatoria;
- existe un token ambiguo;
- existe conflicto de excepciones;
- el perfil lingüístico no está soportado;
- una frontera de segmento no está declarada;
- la salida no supera la comprobación de idempotencia;
- la operación produciría una transformación reservada a otra tarea.

El estado bloqueado deberá ser distinguible de una entrada sin cambios porque ya estaba correctamente capitalizada.

#### 27. Decisiones reservadas

| Decisión                                                       | Tarea propietaria                                      |
| -------------------------------------------------------------- | ------------------------------------------------------ |
| lista definitiva y alcance de conectores                       | `DATA-NORM-ARC-004`                                    |
| formas oficiales de marcas, siglas, unidades y nombres legales | `DATA-NORM-ARC-005`                                    |
| correcciones ortográficas y tildes                             | `DATA-NORM-ARC-006`                                    |
| workflow, evidencia y decisión de ambigüedad                   | `DATA-NORM-ARC-007`                                    |
| algoritmo de búsqueda, transliteración y comparación           | `DATA-NORM-ARC-008`                                    |
| estructura de auditoría, versionado y trazas                   | `DATA-NORM-ARC-009`                                    |
| identidad, unicidad y duplicados normalizados                  | `DATA-NORM-ARC-010`                                    |
| aplicación, servicio de dominio, RPC y trigger defensivo       | `DATA-NORM-ARC-011`                                    |
| valores recibidos desde integraciones externas                 | `DATA-NORM-ARC-012`                                    |
| materialización, backfills, compatibilidad, pruebas y rollback | tareas `SUPA-TRANS-*` y `DATA-NORM-TRANS-*` aplicables |

#### 28. Criterios de integridad

La política se considera íntegra para esta etapa cuando:

1. prohíbe `Title Case` universal;
2. aplica únicamente a campos `COMMERCIAL_NAME` con representación, fuente y versión autorizadas;
3. permanece bloqueada hasta disponer de catálogos de conectores y excepciones;
4. preserva separadores durante tokenización y recomposición;
5. aplica una precedencia determinista de excepciones, conectores, palabras y ambigüedad;
6. define una regla de caja para palabras ordinarias sin corregir ortografía;
7. trata capitalización interna, siglas, modelos y compuestos mediante catálogo o revisión;
8. define conducta posicional de conectores sin anticipar su listado;
9. preserva puntuación, cantidades, unidades y tokens técnicos;
10. excluye todas las clases incompatibles;
11. separa capitalización, espacios, Unicode, diccionario, búsqueda e identidad;
12. restringe mutación a fuentes y representaciones autorizadas;
13. preserva valores externos, snapshots y evidencia;
14. fija perfil lingüístico y semántica versionada, sin locale implícito;
15. exige determinismo e idempotencia;
16. incluye corpus positivo, negativo y ambiguo;
17. no autoriza unicidad, fusión, cambios físicos ni decisiones reservadas.

#### 29. Requisitos de prueba derivados

Se crean los requisitos:

- `TREQ-DATA-037`;
- `TREQ-DATA-038`;
- `TREQ-DATA-039`;
- `TREQ-DATA-040`;
- `TREQ-DATA-041`;
- `TREQ-DATA-042`;
- `TREQ-DATA-043`;
- `TREQ-DATA-044`;
- `TREQ-DATA-045`;
- `TREQ-DATA-046`;
- `TREQ-DATA-047`;
- `TREQ-DATA-048`;
- `TREQ-DATA-049`;
- `TREQ-DATA-050`;
- `TREQ-DATA-051`;
- `TREQ-DATA-052`;
- `TREQ-DATA-053`.

El detalle canónico de cada requisito reside en el registro 04A actualizado hasta esta tarea.

#### 30. Continuidad

```text
ÚLTIMA TAREA APROBADA
DATA-NORM-ARC-002 — Definir clases de campo y tratamiento permitido
        ↓
TAREA ACTUAL APROBADA
DATA-NORM-ARC-003 — Definir reglas de capitalización para nombres empresariales
        ↓
SIGUIENTE TAREA RESERVADA
DATA-NORM-ARC-004 — Definir conectores que permanecen en minúscula
```


### ✅ DATA-NORM-ARC-004 — Definir conectores que permanecen en minúscula

**Estado:** APROBADA
**Tarea anterior:** `DATA-NORM-ARC-003 — Definir reglas de capitalización para nombres empresariales` — APROBADA
**Tarea siguiente:** `DATA-NORM-ARC-005 — Definir excepciones de marcas, siglas, unidades y nombres legales`
**Tipo de tarea:** definición normativa del catálogo cerrado, versionado y posicional de conectores en minúscula para nombres empresariales `COMMERCIAL_NAME`; sin DDL, DML, migraciones, backfills, correcciones de datos, fusiones, cambios de índices, constraints, funciones, triggers, clientes, integraciones, configuración ni despliegues

#### 1. Objetivo

Definir el catálogo canónico de conectores del perfil lingüístico `es-CO` que deberán emitirse en minúscula cuando ocupen una posición interna dentro de un nombre empresarial clasificado como `COMMERCIAL_NAME`, así como las reglas exactas de reconocimiento, posición, precedencia, segmentación, ambigüedad, versionado e idempotencia que impiden listas locales o inferencias gramaticales divergentes.

La política deberá preservar el significado, la puntuación, los signos, la ortografía y la estructura recibida; capitalizar un conector cuando sea la primera palabra lexical del nombre o de un segmento declarado; respetar excepciones oficiales; y mantener separadas la capitalización visible, la corrección ortográfica, la búsqueda, la identidad y la unicidad.

#### 2. Artefacto producido

```text
VENTO_COMMERCIAL_CONNECTOR_CATALOG_ES_CO@1.0.0
```

| Propiedad                          | Valor |
| ---------------------------------- | ----: |
| Conectores definitivos aprobados   |    18 |
| Familias lingüísticas descriptivas |     3 |
| Posiciones normativas              |     3 |
| Resultados cerrados de evaluación  |     5 |
| Requisitos de prueba nuevos        |    15 |
| Cambios físicos autorizados        |     0 |

#### 3. Fuentes canónicas consumidas

| Fuente                                | Decisión consumida                                                                                                            |
| ------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| `01_PROTOCOLO.md`                     | continuidad, una sola tarea, fase exclusivamente documental y preservación de decisiones aprobadas                            |
| `delivery-contract.json`              | identidad del artefacto y actualización integral del registro 04A al crear requisitos                                         |
| `active-sequence.json`                | `DATA-NORM-ARC-004` como tarea actual y `DATA-NORM-ARC-005` como siguiente tarea reservada                                    |
| `DATA-NORM-ARC-001`                   | ausencia de `Title Case` universal, política por campo, separación de representaciones, idempotencia y comportamiento cerrado |
| `DATA-NORM-ARC-002`                   | clase `COMMERCIAL_NAME`, roles de representación y fuente, modos cerrados de tratamiento y exclusiones                        |
| `DATA-NORM-ARC-003`                   | perfil de capitalización, posiciones, segmentación, precedencia, fuentes autorizadas y corpus de conformidad                  |
| `DATA-NORM-AUD-002`                   | variantes observadas de conectores, caja, espacios y puntuación                                                               |
| `DATA-NORM-AUD-003`                   | falsos positivos asociados a marcas, siglas, unidades, nombres legales y formas protegidas                                    |
| `DATA-NORM-AUD-005`                   | separación entre normalización determinista, diccionario, ambigüedad y resolución estructural                                 |
| `DATA-NORM-AUD-006`                   | productores distribuidos y riesgo de listas locales o algoritmos incompatibles                                                |
| `DATA-NORM-AUD-007`                   | impacto de diferencias textuales sobre búsqueda, copias, consumidores, unicidad e identidad                                   |
| Regla canónica del bloque propietario | conjunto preliminar de dieciocho conectores y mandato de aprobación definitiva en esta tarea                                  |

#### 4. Alcance y fronteras

Esta tarea define:

1. el conjunto definitivo de conectores del perfil `es-CO` versión `1.0.0`;
2. el reconocimiento exacto de un conector como token lexical completo;
3. la conducta en `NAME_START`, `DECLARED_SEGMENT_START` e `INTERNAL`;
4. la relación con signos iniciales, comillas, paréntesis y puntuación;
5. el comportamiento de conectores consecutivos;
6. el tratamiento atómico de `al` y `del`;
7. la preservación de `e`, `u`, `o` y `y` sin sustituciones fonológicas automáticas;
8. la conducta frente a formas compuestas o unidas por signos;
9. la precedencia frente a excepciones oficiales, siglas, unidades, códigos y tokens ambiguos;
10. el comportamiento cerrado cuando falta catálogo, versión, locale o contexto;
11. los invariantes de determinismo, idempotencia y paridad entre capas;
12. el corpus mínimo de conformidad del catálogo.

Esta tarea no define:

- formas oficiales concretas de marcas, siglas, unidades o nombres legales;
- reglas de corrección ortográfica o adición de tildes;
- sustituciones lingüísticas contextuales entre conjunciones;
- análisis sintáctico completo del español;
- reglas de texto libre, nombres personales o direcciones;
- búsqueda, transliteración, slug o comparación tolerante;
- estructura física de auditoría y versionado;
- capa ejecutora definitiva;
- scopes o constraints de unicidad;
- tratamiento detallado de integraciones externas;
- correcciones, fusiones, backfills, migraciones ni cambios de datos.

Estas decisiones permanecen en `DATA-NORM-ARC-005` a `DATA-NORM-ARC-012` y en las tareas de transición aplicables.

#### 5. Principios obligatorios

1. El catálogo es cerrado, explícito y versionado.
2. Un token no se convierte en conector por longitud, frecuencia, posición, traducción, semejanza o inferencia gramatical.
3. El reconocimiento se realiza sobre el token lexical completo, nunca sobre una subcadena.
4. La forma emitida depende de la posición normativa, no de la caja recibida.
5. El primer token lexical del nombre o de un segmento declarado se capitaliza aunque pertenezca al catálogo.
6. Un conector interno se emite en la forma minúscula aprobada.
7. Las excepciones oficiales y los tokens protegidos prevalecen sobre el catálogo de conectores.
8. La política no corrige ortografía, no agrega tildes y no cambia las palabras seleccionadas por el autor.
9. `al` y `del` son entradas atómicas; la política no expande ni contrae expresiones.
10. `e` y `u` son entradas independientes; la política no sustituye automáticamente `y` por `e` ni `o` por `u`.
11. La ausencia, retiro o conflicto de versión bloquea la mutación automática.
12. La forma capitalizada o normalizada no define identidad, unicidad ni fusión.
13. VITAL permanece fuera del alcance transversal de esta política salvo contrato explícito posterior.

#### 6. Catálogo definitivo de conectores

El catálogo aprobado para `es-CO` versión `1.0.0` contiene exactamente las siguientes entradas:

```text
a
al
con
de
del
e
el
en
la
las
lo
los
o
para
por
sin
u
y
```

No existen aliases implícitos, variantes plurales adicionales, abreviaturas, formas con puntuación ni entradas inferidas.

#### 7. Familias descriptivas

Las familias solo documentan el origen lingüístico y no cambian la precedencia ni el tratamiento:

| Familia descriptiva           | Entradas                                                  |
| ----------------------------- | --------------------------------------------------------- |
| preposiciones y contracciones | `a`, `al`, `con`, `de`, `del`, `en`, `para`, `por`, `sin` |
| artículos                     | `el`, `la`, `las`, `lo`, `los`                            |
| conjunciones coordinantes     | `e`, `o`, `u`, `y`                                        |

La familia no autoriza concordancia, sustitución, contracción, expansión ni análisis sintáctico. Cada entrada conserva un contrato independiente.

#### 8. Puerta de activación

El catálogo solo podrá intervenir cuando todas las condiciones siguientes sean verdaderas:

1. la clase semántica es `COMMERCIAL_NAME`;
2. la operación solicitada es `COMMERCIAL_CAPITALIZATION`;
3. la representación y el rol de fuente permiten la operación;
4. el perfil lingüístico activo es `es-CO`;
5. la versión de capitalización es compatible con este catálogo;
6. la versión `VENTO_COMMERCIAL_CONNECTOR_CATALOG_ES_CO@1.0.0` está activa;
7. la tokenización produjo un token lexical completo y no ambiguo;
8. no existe una excepción oficial o protección de mayor precedencia;
9. la posición normativa puede resolverse sin heurística;
10. la decisión y las versiones pueden quedar trazadas.

El catálogo no podrá utilizarse por separado para reescribir texto libre, etiquetas, razones sociales, marcas, personas, direcciones, identificadores, valores externos, snapshots o evidencia.

#### 9. Reconocimiento exacto de token

Un token se reconoce como conector únicamente cuando:

1. fue clasificado como token lexical completo por la segmentación aprobada;
2. después de la comparación de caja definida por el perfil `es-CO`, coincide exactamente con una entrada activa;
3. no contiene letras, números, signos ni marcas adicionales fuera de esa entrada;
4. no forma parte de una excepción oficial de frase o token;
5. no fue clasificado como sigla, unidad, código, marca, modelo, referencia o token ambiguo.

Ejemplos:

| Token recibido | Coincidencia de catálogo | Motivo                                  |
| -------------- | ------------------------ | --------------------------------------- |
| `DE`           | `de`                     | coincidencia exacta sin distinguir caja |
| `Del`          | `del`                    | coincidencia exacta sin distinguir caja |
| `de`           | `de`                     | coincidencia exacta                     |
| `deluxe`       | ninguna                  | `del` es solo una subcadena             |
| `paraíso`      | ninguna                  | `para` es solo una subcadena            |
| `y/o`          | ninguna                  | contiene puntuación y no es una entrada |
| `de-la`        | ninguna                  | no es un token exacto del catálogo      |
| `eCommerce`    | ninguna                  | forma interna protegida o ambigua       |

La comparación del catálogo no elimina tildes, signos, guiones, apóstrofos ni caracteres. Esas operaciones pertenecen a otros contratos.

#### 10. Posiciones normativas

| Posición                 | Definición                                                                             | Resultado para un conector reconocido                  |
| ------------------------ | -------------------------------------------------------------------------------------- | ------------------------------------------------------ |
| `NAME_START`             | primer token lexical de todo el nombre                                                 | aplicar la regla ordinaria de inicial: `De`, `El`, `Y` |
| `DECLARED_SEGMENT_START` | primer token lexical después de una frontera que reinicia posición por política activa | aplicar la regla ordinaria de inicial                  |
| `INTERNAL`               | cualquier posición lexical restante                                                    | emitir exactamente la entrada minúscula del catálogo   |

La posición se calcula sobre tokens lexicales. Espacios, comillas, signos de apertura y separadores no lexicales anteriores no consumen `NAME_START` ni `DECLARED_SEGMENT_START`.

#### 11. Resultados cerrados de evaluación

| Resultado                          | Significado                                                                                  |
| ---------------------------------- | -------------------------------------------------------------------------------------------- |
| `CONNECTOR_INITIAL_CAPITALIZED`    | conector reconocido en inicio de nombre o segmento, emitido con inicial según el perfil      |
| `CONNECTOR_INTERNAL_LOWERCASED`    | conector reconocido en posición interna, emitido en su forma minúscula aprobada              |
| `CONNECTOR_PRESERVED_BY_EXCEPTION` | una excepción oficial de mayor precedencia determinó la forma                                |
| `CONNECTOR_PRESERVED_AMBIGUOUS`    | el valor se conserva y requiere revisión por contexto no resoluble                           |
| `CONNECTOR_POLICY_BLOCKED`         | no se produce mutación por falta, retiro, conflicto o incompatibilidad de política o versión |

La ausencia de cambio porque el token ya tenía la forma esperada deberá distinguirse de un resultado bloqueado o ambiguo.

#### 12. Inicio lexical y signos iniciales

1. El primer token lexical conserva la posición `NAME_START` aunque esté precedido por espacios, comillas, paréntesis o signos de apertura.
2. Los signos se preservan exactamente y no reciben tratamiento del catálogo.
3. El catálogo no inserta ni elimina espacios entre el signo y el token.
4. Una comilla o paréntesis inicial no convierte el conector en posición interna.
5. Un prefijo técnico o código sí cuenta como token lexical o protegido según su clasificación y puede hacer que el conector siguiente sea interno.

Ejemplos:

```text
"de la casa" → "De la Casa"
(de la casa) → (De la Casa)
¿de la casa? → ¿De la Casa?
3M de Colombia → 3M de Colombia
```

#### 13. Fronteras de segmento

La conducta hereda las fronteras aprobadas por `DATA-NORM-ARC-003`:

1. el inicio del valor es `NAME_START`;
2. dos puntos y raya corta o larga rodeada por espacios solo crean `DECLARED_SEGMENT_START` cuando la política activa del campo lo declara;
3. coma, punto, ampersand, signo más, barra, paréntesis, guion interno y apóstrofo no reinician segmentos por defecto;
4. una frontera no declarada conserva `INTERNAL`;
5. la puntuación se preserva exactamente;
6. el catálogo no decide por sí mismo si un signo inicia segmento.

Ejemplos:

```text
café: de la casa
→ Café: De la Casa
cuando los dos puntos tienen reinicio declarado

café, de la casa
→ Café, de la Casa

café / de la casa
→ Café / de la Casa
```

#### 14. Conectores consecutivos

1. Solo el primer token lexical de `NAME_START` o `DECLARED_SEGMENT_START` recibe la regla de inicial.
2. Los conectores siguientes conservan posición `INTERNAL` y se emiten en minúscula.
3. La secuencia no se simplifica ni reescribe por sonar inusual.
4. Una secuencia gramaticalmente dudosa se conserva o se envía a revisión; no se corrige mediante este catálogo.

Ejemplos:

```text
de la casa → De la Casa
el de la casa → El de la Casa
para el día → Para el Día
café: de la casa → Café: De la Casa
```

#### 15. Tratamiento atómico de `al` y `del`

1. `al` y `del` son tokens independientes del catálogo.
2. No se dividen en `a` + `el` ni `de` + `el` durante capitalización.
3. No se crean automáticamente a partir de secuencias separadas.
4. No se expanden para búsqueda, visualización o auditoría.
5. Una forma separada o contraída se conserva tal como fue seleccionada; cualquier corrección pertenece al diccionario o a revisión humana.

Ejemplos:

```text
pan del campo → Pan del Campo
pan de el campo → Pan de el Campo
al horno → Al Horno
a el horno → A el Horno
```

La política no afirma que las formas separadas sean lingüísticamente correctas; únicamente evita corregirlas silenciosamente dentro de una operación de caja.

#### 16. Tratamiento de `e`, `u`, `o` y `y`

1. Las cuatro formas son entradas exactas e independientes.
2. La política preserva la palabra elegida y solo resuelve su caja posicional.
3. No se ejecuta sustitución automática `y` → `e` frente a sonidos vocálicos.
4. No se ejecuta sustitución automática `o` → `u` frente a sonidos vocálicos.
5. No se infiere pronunciación desde ortografía, número, sigla, marca o término extranjero.
6. Una posible mejora lingüística deberá ser propuesta por diccionario o revisión humana con contexto explícito.

Ejemplos:

```text
pan y higos → Pan y Higos
pan e higos → Pan e Higos
café o uvas → Café o Uvas
café u uvas → Café u Uvas
```

#### 17. Formas compuestas y signos internos

1. `y/o`, `o/u`, `de-la` y formas equivalentes no son entradas del catálogo.
2. El catálogo no divide automáticamente un token unido por barra, guion, apóstrofo o punto.
3. Una gramática compuesta deberá aprobarse de manera independiente y no se infiere desde el listado de conectores.
4. Sin una excepción o gramática activa, el token se preserva y puede producir revisión humana.
5. Una forma oficial que incluya un conector y puntuación se resuelve por excepción de frase o token, no por coincidencia parcial.

#### 18. Precedencia frente a excepciones y tokens protegidos

La precedencia obligatoria es:

```text
1. excepción oficial de frase válida más larga
2. excepción oficial de token
3. sigla, unidad, código, marca o forma técnica protegida
4. conector exacto del catálogo
5. palabra ordinaria
6. token ambiguo
```

Consecuencias:

- una marca o razón oficial que contiene una palabra del catálogo conserva su forma aprobada;
- una unidad, código o sigla de una letra no se convierte en conector por coincidencia textual;
- una excepción retirada no permite usar su forma histórica como regla vigente;
- dos decisiones activas incompatibles bloquean la mutación;
- la capitalización observada no demuestra que una forma sea oficial.

Las entradas concretas y fuentes autorizadas de excepciones pertenecen a `DATA-NORM-ARC-005`.

#### 19. Separación de operaciones

El catálogo exclusivamente decide la caja posicional de sus dieciocho entradas dentro de la operación `COMMERCIAL_CAPITALIZATION`.

No ejecuta:

- recorte ni compactación de espacios;
- composición o descomposición Unicode;
- corrección ortográfica;
- adición o retiro de tildes;
- singularización o pluralización;
- contracción o expansión;
- traducción o transliteración;
- sustitución entre conjunciones;
- cambio de puntuación;
- unión o división de palabras;
- generación de búsqueda, slug o código;
- deduplicación, unicidad o fusión.

Una secuencia de operaciones solo será válida cuando cada etapa tenga política, versión, entrada, salida y trazabilidad propias.

#### 20. Representaciones, fuentes y propagación

1. Un `PRIMARY_VALUE` de `AUTHORITATIVE_SOURCE` o un `DISPLAY_OVERRIDE` con `APPROVED_OVERRIDE` puede recibir la mutación cuando la política del campo la autorice.
2. `EXTERNAL_ORIGINAL`, `HISTORICAL_SNAPSHOT` y `AUDIT_EVIDENCE` se preservan exactamente.
3. `OUTPUT_PROJECTION` puede emitir una forma derivada sin retroalimentar la fuente.
4. `SEARCH_DERIVATION` no usa este catálogo como contrato de identidad o unicidad.
5. Una `SYNCHRONIZED_COPY` no mantiene una lista local ni corrige de manera independiente.
6. Un `IMMUTABLE_SNAPSHOT` no se resincroniza por una versión nueva del catálogo.
7. Un override conserva su alcance y no redefine el catálogo global.
8. La propagación técnica y la precedencia entre capas pertenecen a `DATA-NORM-ARC-009` y `DATA-NORM-ARC-011`.

#### 21. Perfil lingüístico y otros idiomas

1. El catálogo aplica exclusivamente al perfil `es-CO` declarado.
2. No se activa mediante detección automática de idioma.
3. Un nombre con idioma distinto, mixto o no declarado se conserva o pasa a revisión humana.
4. Una palabra funcional de otro idioma no se incorpora por similitud con un conector español.
5. La convivencia de términos extranjeros dentro de un nombre español no autoriza traducirlos ni recategorizarlos.
6. Un catálogo para otro idioma requerirá artefacto, versión, alcance, pruebas y aprobación propios.
7. VITAL no hereda este catálogo por compartir infraestructura.

#### 22. Versionado, determinismo e idempotencia

Cada evaluación deberá poder atribuirse a:

```text
perfil lingüístico
versión de capitalización
versión de conectores
versión de excepciones
política del campo
representación
rol de fuente
```

Para una misma entrada y contexto:

```text
apply_connectors(apply_connectors(value, context), context)
=
apply_connectors(value, context)
```

La igualdad deberá cubrir:

- valor resultante;
- posición de cada token;
- entrada del catálogo coincidente;
- resultado cerrado de cada token;
- excepción o protección aplicada;
- decisión global;
- ausencia de efectos duplicados.

Una versión nueva podrá cambiar el resultado futuro mediante transición explícita, pero no reinterpreta silenciosamente snapshots, evidencia ni historia creada por versiones anteriores.

#### 23. Paridad entre capas

Para la misma entrada, coordenada y versiones, aplicación, servicio de dominio, RPC, proceso programado y trigger defensivo deberán producir:

- el mismo token reconocido;
- la misma posición normativa;
- la misma forma emitida;
- la misma precedencia de excepción;
- la misma decisión global;
- la misma conducta ante ambigüedad o bloqueo.

Ninguna capa podrá:

- añadir o retirar conectores localmente;
- aplicar una lista de idioma genérica;
- inferir conectores desde paquetes de interfaz;
- alterar el orden de precedencia;
- convertir un bloqueo en mutación;
- usar la forma resultante como identidad por conveniencia.

La capa ejecutora definitiva será aprobada en `DATA-NORM-ARC-011`.

#### 24. Corpus mínimo de conformidad

| Entrada y contexto                        | Resultado esperado                       | Regla demostrada                              |
| ----------------------------------------- | ---------------------------------------- | --------------------------------------------- |
| `jugo de naranja y mango`                 | `Jugo de Naranja y Mango`                | conectores internos                           |
| `de la casa`                              | `De la Casa`                             | conector en `NAME_START`                      |
| `el sabor de la casa`                     | `El Sabor de la Casa`                    | inicio e internos consecutivos                |
| `para el día`                             | `Para el Día`                            | primer conector capitalizado, segundo interno |
| `café: de la casa` con reinicio declarado | `Café: De la Casa`                       | `DECLARED_SEGMENT_START`                      |
| `café, de la casa`                        | `Café, de la Casa`                       | coma sin reinicio                             |
| `"de la casa"`                            | `"De la Casa"`                           | signo inicial no consume posición             |
| `pan del campo`                           | `Pan del Campo`                          | `del` atómico interno                         |
| `al horno`                                | `Al Horno`                               | `al` atómico al inicio                        |
| `pan de el campo`                         | `Pan de el Campo`                        | no contracción automática                     |
| `pan y higos`                             | `Pan y Higos`                            | sin sustitución `y` → `e`                     |
| `pan e higos`                             | `Pan e Higos`                            | forma recibida preservada                     |
| `café o uvas`                             | `Café o Uvas`                            | sin sustitución `o` → `u`                     |
| `café u uvas`                             | `Café u Uvas`                            | forma recibida preservada                     |
| `deluxe`                                  | `Deluxe`                                 | `del` no coincide como subcadena              |
| `paraíso de café`                         | `Paraíso de Café`                        | `para` no coincide como subcadena             |
| `pan y/o queso`                           | conservar y revisar                      | forma compuesta no catalogada                 |
| `3M de Colombia`                          | `3M de Colombia`                         | protección previa al conector                 |
| `Coca-Cola de Café` con excepción         | preservar `Coca-Cola`; emitir `de`       | excepción oficial y conector interno          |
| `500 g de Café`                           | preservar cantidad y unidad; emitir `de` | tokens protegidos y conector                  |

El corpus deberá comprobar además todas las entradas en las tres posiciones normativas, cajas de entrada diferentes, signos iniciales, fronteras declaradas y no declaradas, conflictos de versión, ausencia de locale, tokens mixtos, paridad entre capas e idempotencia.

#### 25. Conductas no conformes

Quedan prohibidas:

1. aplicar minúscula a un conector en `NAME_START`;
2. capitalizar un conector interno por `Title Case` genérico;
3. reconocer una entrada como subcadena;
4. extender el catálogo mediante una lista local;
5. dividir `al` o `del`;
6. contraer `a el` o `de el`;
7. sustituir `y` por `e` u `o` por `u` automáticamente;
8. tratar `y/o` como dos conectores sin gramática aprobada;
9. eliminar signos o normalizar espacios durante esta operación;
10. aplicar el catálogo a clases distintas de `COMMERCIAL_NAME`;
11. modificar valores externos, snapshots o evidencia;
12. convertir una coincidencia en identidad, unicidad o autorización de fusión;
13. producir resultados distintos entre capas con la misma versión;
14. usar el locale implícito del runtime;
15. ejecutar una versión retirada o incompatible sin transición explícita.

#### 26. Relación con identidad, unicidad y fusiones

1. La forma emitida por el catálogo pertenece al valor mostrado.
2. Una coincidencia después de aplicar conectores solo es una señal textual.
3. El catálogo no crea claves de búsqueda ni de identidad.
4. El catálogo no activa constraints de unicidad.
5. El catálogo no selecciona registro sobreviviente, no desactiva filas y no reasigna relaciones.
6. Toda posible consolidación deberá revisar relaciones, movimientos, recetas, inventario, proveedores, integraciones, historial, auditoría, evidencia y rollback.
7. La estrategia de duplicados normalizados pertenece a `DATA-NORM-ARC-010`.

#### 27. Decisiones reservadas

| Decisión                                                       | Tarea propietaria                                      |
| -------------------------------------------------------------- | ------------------------------------------------------ |
| formas oficiales de marcas, siglas, unidades y nombres legales | `DATA-NORM-ARC-005`                                    |
| correcciones ortográficas y tildes                             | `DATA-NORM-ARC-006`                                    |
| workflow, evidencia y decisión de ambigüedad                   | `DATA-NORM-ARC-007`                                    |
| búsqueda, transliteración y comparación tolerante              | `DATA-NORM-ARC-008`                                    |
| estructura de auditoría, versionado y trazas                   | `DATA-NORM-ARC-009`                                    |
| identidad, unicidad y duplicados normalizados                  | `DATA-NORM-ARC-010`                                    |
| aplicación, servicio de dominio, RPC y trigger defensivo       | `DATA-NORM-ARC-011`                                    |
| valores recibidos desde integraciones externas                 | `DATA-NORM-ARC-012`                                    |
| materialización, backfills, compatibilidad, pruebas y rollback | tareas `SUPA-TRANS-*` y `DATA-NORM-TRANS-*` aplicables |

#### 28. Criterios de integridad

La política se considera íntegra para esta etapa cuando:

1. aprueba exactamente dieciocho conectores;
2. mantiene el catálogo cerrado, explícito y versionado;
3. reconoce solo tokens lexicales completos;
4. aplica el catálogo exclusivamente a `COMMERCIAL_NAME` bajo el perfil `es-CO`;
5. capitaliza conectores en inicio de nombre o segmento declarado;
6. emite en minúscula los conectores internos;
7. conserva signos iniciales sin consumir la primera posición lexical;
8. respeta las fronteras declaradas por la política de capitalización;
9. resuelve conectores consecutivos de forma posicional y determinista;
10. trata `al` y `del` como entradas atómicas;
11. prohíbe sustituciones automáticas entre `y`/`e` y `o`/`u`;
12. bloquea formas compuestas no catalogadas;
13. aplica excepciones y tokens protegidos antes del catálogo;
14. separa caja, ortografía, Unicode, espacios, búsqueda e identidad;
15. restringe mutación a fuentes y representaciones autorizadas;
16. exige versionado, paridad entre capas e idempotencia;
17. incluye corpus positivo, negativo, ambiguo y de bloqueo;
18. no autoriza fusiones, cambios físicos ni decisiones reservadas.

#### 29. Requisitos de prueba derivados

Se crean los requisitos:

- `TREQ-DATA-054`;
- `TREQ-DATA-055`;
- `TREQ-DATA-056`;
- `TREQ-DATA-057`;
- `TREQ-DATA-058`;
- `TREQ-DATA-059`;
- `TREQ-DATA-060`;
- `TREQ-DATA-061`;
- `TREQ-DATA-062`;
- `TREQ-DATA-063`;
- `TREQ-DATA-064`;
- `TREQ-DATA-065`;
- `TREQ-DATA-066`;
- `TREQ-DATA-067`;
- `TREQ-DATA-068`.

El detalle canónico de cada requisito reside en el registro 04A actualizado hasta esta tarea.

#### 30. Continuidad

```text
ÚLTIMA TAREA APROBADA
DATA-NORM-ARC-003 — Definir reglas de capitalización para nombres empresariales
        ↓
TAREA ACTUAL APROBADA
DATA-NORM-ARC-004 — Definir conectores que permanecen en minúscula
        ↓
SIGUIENTE TAREA RESERVADA
DATA-NORM-ARC-005 — Definir excepciones de marcas, siglas, unidades y nombres legales
```


### ✅ DATA-NORM-ARC-005 — Definir excepciones de marcas, siglas, unidades y nombres legales

**Estado:** APROBADA
**Tarea anterior:** `DATA-NORM-ARC-004 — Definir conectores que permanecen en minúscula` — APROBADA
**Tarea siguiente:** `DATA-NORM-ARC-006 — Definir diccionario ortográfico canónico y su gobierno`
**Tipo de tarea:** definición normativa del catálogo cerrado, versionado, contextual y trazable de excepciones oficiales para marcas, siglas, unidades y nombres legales; sin DDL, DML, migraciones, backfills, correcciones de datos, fusiones, cambios de índices, constraints, funciones, triggers, clientes, integraciones, configuración ni despliegues

#### 1. Objetivo

Definir el contrato canónico que permite reconocer, preservar, validar o emitir formas oficiales de marcas, siglas, unidades y nombres legales sin someterlas a capitalización empresarial, conectores, diccionario ortográfico, búsqueda tolerante ni heurísticas genéricas.

La política deberá impedir que la caja observada, la frecuencia, una coincidencia parcial o una variante almacenada se conviertan por sí solas en autoridad. Cada excepción deberá declarar forma aprobada, clase, alcance, modo de coincidencia, modo de aplicación, fuente autorizada, evidencia, versión y vigencia. Ante ausencia, ambigüedad o conflicto, el valor se conserva y la mutación queda bloqueada.

#### 2. Artefacto producido

```text
VENTO_OFFICIAL_TEXT_EXCEPTION_CATALOG@1.0.0
```

| Propiedad                                        | Valor |
| ------------------------------------------------ | ----: |
| Familias de excepción aprobadas                  |     4 |
| Alcances de coincidencia cerrados                |     4 |
| Modos de coincidencia cerrados                   |     3 |
| Modos de aplicación cerrados                     |     4 |
| Resultados cerrados de evaluación                |     7 |
| Formas normativas iniciales                      |    28 |
| Formas con emisión canónica o validación técnica |    22 |
| Protecciones contextuales de sufijo legal        |     6 |
| Requisitos de prueba nuevos                      |    18 |
| Cambios físicos autorizados                      |     0 |

#### 3. Fuentes canónicas consumidas

| Fuente                                | Decisión consumida                                                                                                |
| ------------------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| `01_PROTOCOLO.md`                     | continuidad, una sola tarea, fase exclusivamente documental y preservación de decisiones aprobadas                |
| `delivery-contract.json`              | identidad del artefacto y actualización integral del registro 04A al crear requisitos                             |
| `active-sequence.json`                | `DATA-NORM-ARC-005` como tarea actual y `DATA-NORM-ARC-006` como siguiente tarea reservada                        |
| `DATA-NORM-AUD-003`                   | inventario de marcas, siglas, unidades, nombres legales, falsos positivos y fuentes insuficientes                 |
| `DATA-NORM-AUD-005`                   | separación entre transformación determinista, diccionario, revisión humana, preservación y resolución estructural |
| `DATA-NORM-AUD-006`                   | productores distribuidos, copias, snapshots, clientes y riesgo de reglas locales divergentes                      |
| `DATA-NORM-AUD-007`                   | impacto sobre consumidores, búsqueda, identidad, relaciones, colisiones y transición                              |
| `DATA-NORM-ARC-001`                   | política por dominio, entidad y campo; representaciones separadas; comportamiento cerrado e idempotencia          |
| `DATA-NORM-ARC-002`                   | clases `OFFICIAL_BRAND_FORM`, `OFFICIAL_LEGAL_NAME`, `MEASUREMENT_OR_UNIT_CODE` y modos de tratamiento            |
| `DATA-NORM-ARC-003`                   | precedencia de excepciones sobre conectores y palabras ordinarias; tokenización y capitalización empresarial      |
| `DATA-NORM-ARC-004`                   | precedencia de frase, token y protecciones; coincidencia lexical exacta y catálogo cerrado de conectores          |
| Regla canónica del bloque propietario | preservación de `3M`, `iPhone`, `Coca-Cola`, razones sociales y cantidades con unidades                           |

#### 4. Alcance y fronteras

Esta tarea define:

1. las cuatro familias canónicas de excepción;
2. el contrato lógico mínimo de una entrada;
3. los alcances y modos de coincidencia permitidos;
4. los modos de aplicación y resultados cerrados;
5. la jerarquía de fuentes autorizadas y evidencia mínima;
6. la precedencia entre excepciones, conectores, palabras ordinarias y ambigüedad;
7. el tratamiento específico de marcas y frases de marca;
8. el tratamiento específico de siglas, abreviaturas y códigos controlados;
9. el tratamiento específico de símbolos, códigos y familias de unidad;
10. la preservación de nombres legales completos y de sus componentes significativos;
11. las formas normativas iniciales que ya cuentan con respaldo canónico suficiente;
12. el tratamiento de candidatos observados que todavía carecen de autoridad suficiente;
13. los invariantes de alcance, versionado, determinismo, idempotencia y paridad;
14. el corpus mínimo de conformidad.

Esta tarea no define:

- correcciones ortográficas, tildes o sustituciones léxicas ordinarias;
- el workflow físico de revisión humana;
- la representación de búsqueda, transliteración o comparación tolerante;
- tablas, columnas, índices, constraints, RLS, funciones, RPC o triggers;
- la capa ejecutora definitiva;
- unicidad, deduplicación, fusión o selección de registro sobreviviente;
- el tratamiento físico de originales externos;
- backfills, lotes, compatibilidad, despliegue o rollback;
- nuevas formas oficiales cuya evidencia no esté aprobada.

Las decisiones permanecen en `DATA-NORM-ARC-006` a `DATA-NORM-ARC-012`, `SUPA-TRANS-001` a `SUPA-TRANS-015` y `DATA-NORM-TRANS-001` a `DATA-NORM-TRANS-009`, según su propiedad.

#### 5. Principios obligatorios

1. Una excepción es una decisión explícita y acotada, no una heurística.
2. La forma observada, la forma más frecuente y la forma visualmente plausible no constituyen autoridad.
3. Toda entrada deberá tener fuente, evidencia, owner, alcance y versión.
4. La excepción más específica solo podrá restringir o determinar una forma dentro de su alcance; no ampliará una clase incompatible.
5. Una marca, sigla o unidad no se reconocerá por mayúsculas, longitud, patrón visual o frecuencia.
6. Un nombre legal no se reconstruirá a partir de palabras, conectores o sufijos aislados.
7. Los aliases deberán declararse uno por uno; no existirán aliases implícitos.
8. Ninguna coincidencia eliminará tildes, signos, guiones, puntos, espacios ni unirá o dividirá palabras.
9. Los códigos y unidades conservarán significado técnico y contexto estructural.
10. Los originales externos, snapshots y evidencia no serán sobrescritos.
11. Un conflicto, una versión ausente o una fuente insuficiente producirá conservación y bloqueo.
12. La aplicación repetida con la misma entrada, alcance y versiones será idempotente.
13. Una forma oficial no crea identidad, unicidad ni autorización de fusión.
14. VITAL permanece fuera de este catálogo transversal y requiere gobierno propio.

#### 6. Familias canónicas de excepción

| Familia                         | Clase o contexto primario                                                     | Propósito                                                      | Regla base                                                 |
| ------------------------------- | ----------------------------------------------------------------------------- | -------------------------------------------------------------- | ---------------------------------------------------------- |
| `OFFICIAL_BRAND_EXCEPTION`      | `OFFICIAL_BRAND_FORM` o fragmento protegido dentro de `COMMERCIAL_NAME`       | preservar o emitir una marca o denominación comercial aprobada | grafía oficial exacta, alcance explícito y frase más larga |
| `CONTROLLED_ACRONYM_EXCEPTION`  | vocabulario, aplicación, código empresarial, moneda o abreviatura contractual | preservar o emitir una sigla o código controlado               | token completo y catálogo contextual                       |
| `MEASUREMENT_UNIT_EXCEPTION`    | `MEASUREMENT_OR_UNIT_CODE` o componente estructurado de presentación          | validar o emitir un código técnico de unidad                   | catálogo de unidad, contexto y significado dimensional     |
| `OFFICIAL_LEGAL_NAME_EXCEPTION` | `OFFICIAL_LEGAL_NAME`                                                         | preservar el nombre completo respaldado por fuente autorizada  | coincidencia de valor completo, procedencia y vigencia     |

Las cuatro familias son cerradas. Agregar otra familia requiere una decisión canónica que defina frontera, fuente, precedencia, compatibilidad y pruebas.

#### 7. Contrato lógico de una entrada

Toda entrada deberá poder expresar, como mínimo:

```text
exception_key
family
canonical_form
scope_kind
domain_scope
entity_scope
field_scope
semantic_class
representation_role
source_role
language_profile
match_mode
accepted_variants
application_mode
authority_type
authority_owner
evidence_reference
status
valid_from
valid_to
catalog_version
supersedes
reason
```

Reglas:

1. `exception_key` será estable y no dependerá de la forma visible.
2. `canonical_form` conservará Unicode, caja, tildes, signos, separación y puntuación aprobados.
3. `accepted_variants` será una lista explícita; una lista vacía no implica comparación flexible.
4. El alcance mínimo será dominio, entidad y campo o una coordenada más restrictiva.
5. `semantic_class`, representación y fuente deberán ser compatibles con `DATA-NORM-ARC-002`.
6. La versión de catálogo deberá ser compatible con capitalización y conectores cuando la excepción participe en `COMMERCIAL_CAPITALIZATION`.
7. Una entrada incompleta no será ejecutable.
8. La estructura física, auditoría y persistencia pertenecen a `DATA-NORM-ARC-009` y `DATA-NORM-ARC-011`.

#### 8. Alcances cerrados de coincidencia

| Alcance                | Definición                                           | Uso permitido                                                           |
| ---------------------- | ---------------------------------------------------- | ----------------------------------------------------------------------- |
| `FULL_VALUE`           | la entrada cubre todo el valor de la representación  | nombres legales y formas oficiales que no admiten contenido adicional   |
| `PHRASE`               | secuencia contigua de tokens y separadores aprobados | marcas compuestas y denominaciones oficiales embebidas                  |
| `TOKEN`                | token lexical completo                               | siglas, códigos, marcas de un token y protecciones legales contextuales |
| `STRUCTURED_COMPONENT` | componente ya interpretado dentro de una estructura  | unidad, cantidad, multiplicador, moneda o código técnico                |

Una coincidencia de `PHRASE` o `TOKEN` exige fronteras completas. Una entrada no podrá coincidir como subcadena dentro de otra palabra, código, modelo, URL, correo, ruta o identificador.

#### 9. Modos cerrados de coincidencia

| Modo             | Regla                                                                                                    | Operaciones prohibidas durante la coincidencia                         |
| ---------------- | -------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| `EXACT`          | coincidencia exacta con la forma o variante registrada                                                   | cambio de caja, eliminación de tildes, signos o espacios               |
| `CASEFOLD_EXACT` | comparación sin distinguir caja, conservando caracteres, diacríticos, puntuación, separación y fronteras | `unaccent`, transliteración, compactación, unión, división o similitud |
| `EXPLICIT_ALIAS` | coincidencia exacta con uno de los aliases aprobados y trazables                                         | generación automática de aliases o aprendizaje por frecuencia          |

No se admite coincidencia difusa, fonética, por distancia de edición, prefijo, sufijo, subcadena, token parcial ni representación de búsqueda. Esas capacidades no forman parte del catálogo de excepciones.

#### 10. Modos cerrados de aplicación

| Modo                    | Conducta                                                                                                          |
| ----------------------- | ----------------------------------------------------------------------------------------------------------------- |
| `PRESERVE_MATCHED_FORM` | conserva exactamente la forma recibida porque ya procede de una fuente o representación que no admite reescritura |
| `EMIT_CANONICAL_FORM`   | emite la forma aprobada únicamente desde una variante admitida y dentro de un alcance mutable                     |
| `VALIDATE_ONLY`         | confirma pertenencia al catálogo o rechaza el valor sin reescribirlo                                              |
| `DERIVE_ONLY`           | produce una representación separada sin modificar el valor de origen                                              |

`EMIT_CANONICAL_FORM` solo podrá operar sobre `PRIMARY_VALUE` de `AUTHORITATIVE_SOURCE` o `DISPLAY_OVERRIDE` de `APPROVED_OVERRIDE` cuando la clase y la política del campo permitan la operación. Las demás coordenadas permanecerán en preservación, validación o derivación.

#### 11. Resultados cerrados de evaluación

| Resultado                        | Significado                                                                                    |
| -------------------------------- | ---------------------------------------------------------------------------------------------- |
| `EXCEPTION_CANONICAL_EMITTED`    | una variante aprobada produjo la forma canónica dentro de un alcance mutable                   |
| `EXCEPTION_PRESERVED_OFFICIAL`   | la forma oficial o el original protegido se conservó sin reescritura                           |
| `EXCEPTION_VALIDATED_NO_REWRITE` | el código o componente fue validado y no se modificó                                           |
| `EXCEPTION_DERIVATION_ONLY`      | se produjo una representación separada y vinculada                                             |
| `EXCEPTION_NOT_APPLICABLE`       | no existe una entrada compatible con la coordenada evaluada                                    |
| `EXCEPTION_AMBIGUOUS_REVIEW`     | existe evidencia insuficiente o más de una interpretación válida                               |
| `EXCEPTION_POLICY_BLOCKED`       | falta o entra en conflicto una versión, fuente, clase, alcance, estado o evidencia obligatoria |

Una entrada sin cambios porque ya coincide con la forma esperada deberá distinguirse de un bloqueo, una ausencia de coincidencia y una preservación obligatoria.

#### 12. Fuentes de autoridad y evidencia

| Tipo de autoridad                       | Puede aprobar                                                    | Restricción                                                                                 |
| --------------------------------------- | ---------------------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| `INTERNAL_CANONICAL_OWNER`              | marcas propias, aplicaciones, códigos y vocabularios de Vento OS | debe declarar owner empresarial y alcance                                                   |
| `BRAND_OWNER_OR_MANUFACTURER`           | grafía de una marca externa y aliases aceptados                  | la evidencia debe identificar producto, marca o fabricante sin mezclar descripción o modelo |
| `LEGAL_OR_REGULATORY_SOURCE`            | nombre legal completo y vigencia                                 | se conserva documento, fecha, jurisdicción y procedencia                                    |
| `CONTROLLED_STANDARD_OR_DOMAIN_CATALOG` | unidades, monedas y códigos técnicos                             | debe declarar significado, contexto y versión del catálogo                                  |
| `APPROVED_EXTERNAL_EVIDENCE`            | original recibido y posible mapeo interno                        | no convierte por sí sola el original externo en fuente autoritativa global                  |

No son fuentes suficientes por sí solas:

- frecuencia en base de datos;
- forma más reciente;
- uso en una interfaz;
- mayúsculas o minúsculas observadas;
- coincidencia en un nombre de producto;
- nombre de tabla o columna;
- resultado de búsqueda en internet no incorporado como evidencia aprobada;
- inferencia del desarrollador o consumidor.

#### 13. Estados de ejecución del catálogo

| Estado      | Conducta                                                                                      |
| ----------- | --------------------------------------------------------------------------------------------- |
| `ACTIVE`    | la entrada puede evaluarse en su versión y alcance aprobados                                  |
| `SUSPENDED` | no se aplica a nuevas decisiones; conserva historia y produce bloqueo o revisión              |
| `RETIRED`   | no se aplica a nuevas decisiones; permanece disponible para reconstruir decisiones históricas |

Un candidato sin aprobación no pertenece al catálogo ejecutable. La decisión de ingreso, rechazo o corrección de un candidato será gobernada por `DATA-NORM-ARC-007`; la traza de estados y versiones será definida por `DATA-NORM-ARC-009`.

#### 14. Precedencia y resolución de conflictos

La precedencia obligatoria es:

```text
1. excepción FULL_VALUE compatible
2. excepción PHRASE compatible más larga
3. excepción TOKEN compatible
4. protección STRUCTURED_COMPONENT compatible
5. conector exacto del catálogo
6. palabra ordinaria elegible
7. preservación ambigua o bloqueo
```

Dentro del mismo nivel prevalece la coordenada más específica en este orden:

```text
campo
→ entidad
→ dominio
→ política transversal
```

Reglas:

1. la especificidad nunca permite atravesar una clase, representación o fuente incompatible;
2. una frase válida más larga prevalece sobre sus tokens internos;
3. dos entradas activas incompatibles con igual especificidad bloquean la mutación;
4. un alias no prevalece sobre una forma oficial más específica;
5. una entrada suspendida o retirada no participa en decisiones nuevas;
6. no se resolverá un conflicto por fecha de creación, orden de consulta o prioridad local no documentada;
7. la decisión deberá conservar las versiones de capitalización, conectores y excepciones utilizadas.

#### 15. Excepciones de marca

1. La forma oficial de marca incluye caja, diacríticos, signos, guiones, apóstrofos, espacios y capitalización interna.
2. Una marca compuesta se trata como `PHRASE` atómica cuando su entrada lo declara.
3. La coincidencia de frase exige fronteras completas y preserva separadores aprobados.
4. Una marca embebida dentro de `COMMERCIAL_NAME` solo se aplica cuando el campo admite fragmentos de marca y la entrada declara ese alcance.
5. Un campo `OFFICIAL_BRAND_FORM` utiliza la entrada como valor completo o token de marca, no como corrección de prosa.
6. Marca, fabricante, modelo, referencia y descripción no se fusionan en una sola excepción.
7. Una forma que mezcla marca y modelo permanece bloqueada hasta clasificación estructural.
8. La excepción no traduce, abrevia, expande, singulariza ni pluraliza una marca.
9. Una variante no declarada se conserva y se envía a revisión; no se aproxima a la forma más parecida.
10. La forma oficial no autoriza consolidar registros que la contengan.

#### 16. Formas normativas iniciales de marca

El catálogo versión `1.0.0` aprueba como formas de conformidad:

| Forma canónica | Alcance                            | Coincidencia     | Aplicación                                        | Restricción                                                |
| -------------- | ---------------------------------- | ---------------- | ------------------------------------------------- | ---------------------------------------------------------- |
| `3M`           | `TOKEN` o `FULL_VALUE` compatible  | `CASEFOLD_EXACT` | `EMIT_CANONICAL_FORM` o preservación según fuente | no coincide como subcadena dentro de modelos o códigos     |
| `iPhone`       | `TOKEN` o `PHRASE` compatible      | `CASEFOLD_EXACT` | `EMIT_CANONICAL_FORM` o preservación según fuente | conserva capitalización interna                            |
| `Coca-Cola`    | `PHRASE` o `FULL_VALUE` compatible | `CASEFOLD_EXACT` | `EMIT_CANONICAL_FORM` o preservación según fuente | el guion es obligatorio; `Coca Cola` no es alias implícito |

Estas formas demuestran el contrato de excepción. Su presencia en el catálogo no afirma que exista actualmente un producto, proveedor o relación comercial asociado.

#### 17. Candidatos de marca todavía no activables

La evidencia de auditoría conserva el siguiente tratamiento:

| Caso                                                                           | Resultado canónico de esta tarea                                                              | Propietario de la decisión pendiente                                        |
| ------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------- |
| `Oster` / `oster`                                                              | candidato a alias de caja; falta fuente autorizada que confirme la forma oficial y el alcance | `DATA-NORM-ARC-007` y owner empresarial de la marca                         |
| `Wellmix` / `Welmix`                                                           | ambiguo; puede ser error, marca distinta o variante oficial                                   | `DATA-NORM-ARC-007`                                                         |
| `Volnic` / `VOLNIC PALLOMARO`                                                  | posible mezcla de marca, fabricante o proveedor                                               | `DATA-NORM-ARC-007`; `DATA-NORM-ARC-010` si afecta identidad o duplicidad   |
| `Daza` / `acero daza`                                                          | posible mezcla de marca, material o descriptor                                                | `DATA-NORM-ARC-007`; `DATA-NORM-ARC-010` si afecta identidad o duplicidad   |
| `MODELO DUC 72 R` y `TORNADO MODELO (TH33M.110.)`                              | contaminación de marca con modelo o referencia                                                | `DATA-NORM-ARC-007`; `DATA-NORM-ARC-010` cuando exista impacto de identidad |
| `Hatsu`, `Vento`, `Molka`, `Saudo`, `Nutella`, `Klim`, `Kraft`, `Kinder Bueno` | candidatos por uso observado; frecuencia y caja no bastan para activarlos                     | `DATA-NORM-ARC-007` y owner empresarial correspondiente                     |

Ninguno de estos casos se transforma automáticamente mediante la versión `1.0.0`.

#### 18. Excepciones de siglas y códigos controlados

1. Una sigla se reconoce por entrada de catálogo y contexto, no por estar en mayúsculas.
2. Palabras completas como `BOLSA`, `POTE`, `CAJA` o `PIZZA` no se convierten en siglas.
3. La excepción opera sobre token completo; no coincide dentro de otra palabra o código.
4. No se expande, traduce, pluraliza ni puntúa una sigla automáticamente.
5. Una abreviatura con puntos solo coincide si la forma puntuada está registrada.
6. Códigos de aplicación, empresa y moneda conservan contrato técnico y no se convierten en nombres visibles.
7. Una misma secuencia de letras puede tener significados distintos por alcance; la forma global no sustituye el contexto.
8. Una sigla desconocida se preserva y se envía a revisión, no se convierte mediante regla de palabras ordinarias.

#### 19. Formas normativas iniciales de siglas y códigos

| Grupo                                 | Formas canónicas                                   | Alcance y aplicación                                                             |
| ------------------------------------- | -------------------------------------------------- | -------------------------------------------------------------------------------- |
| aplicaciones Vento OS                 | `NEXO`, `VISO`, `ORIGO`, `NUMERA`, `FOGO`, `PULSO` | `TOKEN`; `CASEFOLD_EXACT`; emitir forma canónica en coordenadas autorizadas      |
| códigos de marca o unidad empresarial | `VGR`, `SAU`, `VCF`                                | `TOKEN`; `CASEFOLD_EXACT`; validación o emisión técnica según campo              |
| código monetario                      | `COP`                                              | `TOKEN` o `STRUCTURED_COMPONENT`; `CASEFOLD_EXACT`; validación o emisión técnica |

`BBQ`, `HIT`, `AA`, `CMS`, `PAM`, `REF`, `T26`, `WIP`, `AVSA`, `FC` y `SVV` permanecen como candidatos contextuales. No se activan, expanden ni recategorizan hasta que su significado, owner y alcance queden aprobados.

#### 20. Excepciones de unidades

1. `MEASUREMENT_OR_UNIT_CODE` pertenece a un catálogo técnico y no a capitalización comercial.
2. Un código de unidad solo se evalúa en un campo dedicado o como `STRUCTURED_COMPONENT` ya interpretado.
3. La unidad embebida no se detecta por subcadena ni por eliminación de signos.
4. Cantidad, unidad, multiplicador, empaque, contexto, factor de conversión y vigencia permanecen separados.
5. El símbolo o código canónico no es una etiqueta visible ni una identidad de presentación.
6. La coincidencia sin distinguir caja solo se permite después de resolver el contexto como unidad.
7. La aplicación no cambia magnitud, convierte unidades ni modifica factores.
8. El plural, la palabra visible y el código técnico no son aliases implícitos.
9. Una unidad desconocida o una cadena mixta se conserva y requiere resolución estructural.
10. `count`, `mass` y `volume` son familias técnicas, no etiquetas para personas.

#### 21. Formas normativas iniciales de unidades

| Clase              | Formas canónicas          | Alcance                                             | Aplicación                                                         |
| ------------------ | ------------------------- | --------------------------------------------------- | ------------------------------------------------------------------ |
| símbolos de medida | `g`, `kg`, `ml`, `l`      | `MEASUREMENT_OR_UNIT_CODE` o `STRUCTURED_COMPONENT` | `CASEFOLD_EXACT`; emitir código canónico o validar según política  |
| códigos de conteo  | `un`, `dz`                | `MEASUREMENT_OR_UNIT_CODE` o `STRUCTURED_COMPONENT` | `CASEFOLD_EXACT`; emitir código canónico o validar según política  |
| familias técnicas  | `count`, `mass`, `volume` | vocabulario técnico controlado                      | `CASEFOLD_EXACT`; `VALIDATE_ONLY` salvo contrato técnico posterior |

No se aprueban equivalencias automáticas entre:

```text
bolsa / Bolsa / BOLSA
paquete / Paquete / PAQUETE
pote / Pote / POTE
Unidad / UNIDAD
Six Pack / six_pack
Pote x 2 / pote
```

`Botellla`, `Costo`, `1`, `presentacion`, `piezas`, `bolsas`, `Six Pack`, `six_pack` y composiciones como `Bolsa 1 kg` permanecen fuera del catálogo unitario ejecutable hasta resolver clase, estructura y significado.

#### 22. Excepciones de nombres legales

1. La unidad mínima de autoridad es el nombre legal completo, no una colección de palabras normalizadas.
2. La entrada principal utiliza `FULL_VALUE` y una fuente legal, regulatoria o documental autorizada.
3. Caja, tildes, puntos, comas, guiones, ampersands, conectores, sufijos y separación se preservan según la fuente.
4. No se aplica capitalización empresarial, catálogo de conectores ni diccionario ortográfico genérico.
5. No se infiere una forma oficial desde la mayoría de registros ni desde una captura manual.
6. Un nombre recibido de proveedor o integración permanece como `EXTERNAL_ORIGINAL` hasta su vinculación con una fuente autorizada.
7. Una actualización legal crea vigencia y versión nuevas; no reescribe snapshots, facturas, órdenes ni evidencia histórica.
8. Un alias comercial o nombre corto se modela como representación separada y no sustituye el nombre legal.
9. Dos nombres visualmente similares no se fusionan sin resolver identidad jurídica y relaciones.
10. Una corrección propuesta sin evidencia suficiente produce revisión humana.

#### 23. Protecciones contextuales de sufijo legal

La versión `1.0.0` protege, únicamente dentro de `OFFICIAL_LEGAL_NAME`, las formas observadas:

```text
SAS
S.A.S.
SA
S.A.
LTDA
CIA
```

Reglas:

1. cada forma se preserva como token exacto dentro del nombre completo;
2. las seis formas no son aliases entre sí;
3. no se agregan ni eliminan puntos;
4. no se expande ni contrae una forma;
5. no se inserta un sufijo faltante;
6. no se determina naturaleza jurídica desde el sufijo aislado;
7. `&`, guiones y conectores se preservan como parte del valor oficial, sin convertirse en entradas independientes;
8. una forma distinta puede ser válida si la fuente oficial la respalda, pero requerirá una entrada o evidencia propia.

Los 92 valores escritos distintos observados en la auditoría permanecen preservados. Esta tarea no declara oficial una grafía individual sin su evidencia autorizada.

#### 24. Aliases y emisión de forma canónica

1. Un alias deberá pertenecer a una sola entrada activa dentro de una coordenada resoluble.
2. Cada alias declarará motivo, fuente, alcance y vigencia.
3. Un alias no se generará desde minúsculas, mayúsculas, `unaccent`, eliminación de signos o compactación.
4. `CASEFOLD_EXACT` es un modo explícito de una entrada, no un generador de aliases persistidos.
5. Una variante de puntuación o separación requiere `EXPLICIT_ALIAS`; no se deduce.
6. Una variante ortográfica que cambia letras requiere evidencia oficial o revisión humana; no pertenece al diccionario ordinario mientras pueda ser marca o nombre legal.
7. La emisión canónica no modifica originales externos, snapshots ni evidencia.
8. Retirar un alias impide decisiones futuras, pero conserva la traza de decisiones históricas.

#### 25. Representaciones, fuentes y propagación

1. `PRIMARY_VALUE` de `AUTHORITATIVE_SOURCE` puede recibir `EMIT_CANONICAL_FORM` cuando su política lo autorice.
2. `DISPLAY_OVERRIDE` de `APPROVED_OVERRIDE` puede emitir una forma oficial dentro de su canal y alcance.
3. `EXTERNAL_ORIGINAL` de `EXTERNAL_EVIDENCE` se preserva; una forma interna se deriva o almacena separadamente.
4. `HISTORICAL_SNAPSHOT` de `IMMUTABLE_SNAPSHOT` no se resincroniza por una versión nueva.
5. `AUDIT_EVIDENCE` permanece inmutable.
6. `OUTPUT_PROJECTION` de `OUTPUT_ONLY` puede renderizar una forma autorizada sin retroalimentar la fuente.
7. `SYNCHRONIZED_COPY` no mantiene un catálogo local y recibe cambios únicamente desde la fuente propietaria.
8. Una corrección de excepción no se propaga hasta que `DATA-NORM-ARC-009`, `DATA-NORM-ARC-011` y las tareas de transición definan evento, compatibilidad, reintento y rollback.

#### 26. Separación de operaciones

La aplicación de excepciones no ejecuta:

- recorte ni compactación de espacios;
- composición o descomposición Unicode;
- corrección ortográfica o adición de tildes;
- catálogo de conectores fuera de su precedencia;
- traducción o transliteración;
- expansión de siglas;
- conversión de unidades;
- cambio de cantidad o factor;
- parseo heurístico de presentaciones;
- generación de búsqueda o slug;
- identidad, unicidad, deduplicación o fusión.

Una etapa previa podrá entregar una entrada determinísticamente normalizada solo cuando su política la autorice. La excepción consumirá esa entrada sin ocultar qué operaciones ocurrieron antes y sin asumir que el resultado define identidad.

#### 27. Versionado, determinismo e idempotencia

Cada decisión deberá poder atribuirse a:

```text
versión de política del campo
versión de capitalización
versión de conectores
versión de excepciones
exception_key
forma o alias coincidente
alcance efectivo
representación
rol de fuente
modo de aplicación
```

Para una misma entrada y contexto:

```text
apply_exception(apply_exception(value, context), context)
=
apply_exception(value, context)
```

La igualdad deberá cubrir valor, entrada seleccionada, alcance, resultado, bloqueo, traza y ausencia de efectos duplicados. Una versión nueva puede cambiar decisiones futuras mediante transición explícita, pero no reinterpreta silenciosamente historia, snapshots ni evidencia de versiones anteriores.

#### 28. Paridad entre capas

Para la misma entrada, coordenada y versiones, aplicación, servicio de dominio, RPC, proceso programado y trigger defensivo deberán producir:

- la misma entrada compatible;
- el mismo alcance y modo de coincidencia;
- la misma precedencia;
- la misma forma emitida o preservada;
- el mismo resultado y motivo;
- el mismo bloqueo ante conflicto;
- la misma conducta idempotente.

Ninguna capa podrá:

- añadir aliases o formas locales;
- usar una lista de marcas, siglas o unidades distinta;
- suavizar una coincidencia exacta;
- aplicar búsqueda tolerante como matcher de excepción;
- convertir un candidato en entrada activa;
- sobrescribir originales o snapshots;
- resolver un conflicto por orden de ejecución.

La capa ejecutora definitiva pertenece a `DATA-NORM-ARC-011`.

#### 29. Corpus mínimo de conformidad

| Entrada y contexto                                            | Resultado esperado                                | Regla demostrada                           |
| ------------------------------------------------------------- | ------------------------------------------------- | ------------------------------------------ |
| `3m` en campo compatible con la excepción `3M`                | `3M`                                              | emisión de forma canónica por caja         |
| `iPHONE` en campo compatible                                  | `iPhone`                                          | capitalización interna oficial             |
| `Coca-Cola`                                                   | `Coca-Cola`                                       | preservación exacta                        |
| `Coca Cola`                                                   | conservar y revisar                               | el guion no se elimina ni se infiere alias |
| `NEXO`                                                        | `NEXO`                                            | sigla contractual                          |
| `nexo` en coordenada autorizada                               | `NEXO`                                            | `CASEFOLD_EXACT` contextual                |
| `BOLSA` sin entrada de sigla                                  | no clasificar como sigla                          | mayúsculas no demuestran acrónimo          |
| `BBQ` sin alcance aprobado                                    | conservar y revisar                               | candidato contextual                       |
| `KG` en campo unitario mutable con `EMIT_CANONICAL_FORM`      | `kg`                                              | emisión de código unitario contextual      |
| `KG` en campo unitario con `VALIDATE_ONLY`                    | validar sin reescritura                           | separación entre validación y emisión      |
| `kg` dentro de un modelo o texto no estructurado              | no aplicar                                        | protección por clase y alcance             |
| `Bolsa 1 kg` estructurada                                     | preservar cantidad; resolver `kg` como componente | unidad separada de etiqueta                |
| `Six Pack` / `six_pack`                                       | no mapear automáticamente                         | etiqueta y código no equivalentes          |
| `COMERCIALIZADORA EL NOVILLON S.A.S.` desde fuente autorizada | preservar exactamente                             | nombre legal completo                      |
| el mismo nombre sin evidencia autorizada                      | preservar como original y revisar                 | fuente insuficiente                        |
| `SAS` y `S.A.S.`                                              | no declarar equivalencia                          | sufijos exactos y contextuales             |
| `Oster` / `oster` sin fuente                                  | conservar y revisar                               | variante de marca no activada              |
| `Wellmix` / `Welmix`                                          | conservar y revisar                               | diferencia ortográfica ambigua             |
| dos entradas activas incompatibles                            | conservar y bloquear                              | conflicto fail closed                      |
| forma suspendida o retirada                                   | no aplicar a decisión nueva                       | ciclo de vida                              |
| valor en VITAL                                                | no aplicar catálogo transversal                   | frontera de producto                       |

El corpus deberá cubrir además frases más largas, tokens adyacentes, puntuación, guiones, tildes, aliases explícitos, fuentes no autoritativas, snapshots, proyecciones, múltiples capas, reintentos y cambios de versión.

#### 30. Conductas no conformes

Quedan prohibidas:

1. inferir una marca o sigla por mayúsculas o frecuencia;
2. aprobar una forma desde el valor más repetido;
3. usar `unaccent`, similitud o distancia de edición para aplicar una excepción;
4. eliminar guiones, puntos, tildes o espacios para forzar coincidencia;
5. aplicar una marca como subcadena;
6. expandir o traducir siglas automáticamente;
7. tratar palabras completas en mayúsculas como acrónimos;
8. detectar unidades fuera de un campo o componente estructurado;
9. convertir etiquetas de empaque en códigos de unidad;
10. convertir `Six Pack` y `six_pack` en aliases implícitos;
11. uniformar `SAS`, `S.A.S.`, `SA`, `S.A.`, `LTDA` o `CIA`;
12. reconstruir un nombre legal desde tokens;
13. modificar originales externos, snapshots o evidencia;
14. mantener catálogos locales por cliente o capa;
15. ejecutar una entrada suspendida, retirada, conflictiva o sin versión;
16. usar la forma resultante para fusionar, desactivar o reasignar registros.

#### 31. Hallazgos y carryovers

| ID               | Decisión o brecha                                         | Resultado de esta tarea                                          | Propietario siguiente                                                      |
| ---------------- | --------------------------------------------------------- | ---------------------------------------------------------------- | -------------------------------------------------------------------------- |
| `DN-ARC-005-H01` | ausencia de catálogo único de excepciones                 | contrato cerrado aprobado                                        | `DATA-NORM-ARC-009`; `DATA-NORM-ARC-011`                                   |
| `DN-ARC-005-H02` | marcas observadas sin fuente suficiente                   | permanecen fuera del catálogo ejecutable                         | `DATA-NORM-ARC-007`                                                        |
| `DN-ARC-005-H03` | siglas contextuales y palabras en mayúsculas              | separación normativa aprobada                                    | `DATA-NORM-ARC-007` para casos no resueltos                                |
| `DN-ARC-005-H04` | mezcla de código, etiqueta, cantidad y empaque            | códigos iniciales aprobados; cadenas mixtas siguen estructurales | `DATA-NORM-ARC-007`; `DATA-NORM-ARC-010` si afectan identidad o duplicidad |
| `DN-ARC-005-H05` | nombres legales sin evidencia vinculada                   | preservación y contrato de autoridad aprobados                   | `DATA-NORM-ARC-007`; `DATA-NORM-ARC-012`                                   |
| `DN-ARC-005-H06` | aliases y versiones todavía sin persistencia              | semántica aprobada; estructura física pendiente                  | `DATA-NORM-ARC-009`                                                        |
| `DN-ARC-005-H07` | productores distribuidos pueden divergir                  | paridad obligatoria aprobada                                     | `DATA-NORM-ARC-011`; `SUPA-TRANS-003`; `SUPA-TRANS-007`                    |
| `DN-ARC-005-H08` | datos existentes requieren evaluación sin mutación global | reglas de transición delimitadas                                 | `DATA-NORM-TRANS-001` a `DATA-NORM-TRANS-009`                              |
| `DN-ARC-005-H09` | una excepción puede colisionar con búsqueda o identidad   | separación aprobada                                              | `DATA-NORM-ARC-008`; `DATA-NORM-ARC-010`                                   |
| `DN-ARC-005-H10` | VITAL comparte infraestructura                            | exclusión transversal mantenida                                  | `SUPA-ARC-025`                                                             |

#### 32. Decisiones reservadas

| Decisión                                                        | Tarea propietaria                                                      |
| --------------------------------------------------------------- | ---------------------------------------------------------------------- |
| diccionario ortográfico y correcciones léxicas ordinarias       | `DATA-NORM-ARC-006`                                                    |
| cola, actores, evidencia y resolución de candidatos ambiguos    | `DATA-NORM-ARC-007`                                                    |
| búsqueda, comparación tolerante y transliteración               | `DATA-NORM-ARC-008`                                                    |
| persistencia, auditoría, versiones, vigencias y trazas          | `DATA-NORM-ARC-009`                                                    |
| identidad, unicidad, colisiones y duplicados normalizados       | `DATA-NORM-ARC-010`                                                    |
| aplicación, servicio de dominio, RPC y trigger defensivo        | `DATA-NORM-ARC-011`                                                    |
| originales recibidos desde integraciones externas               | `DATA-NORM-ARC-012`                                                    |
| dependencias, adaptación de consumidores y compatibilidad       | `SUPA-TRANS-003`, `SUPA-TRANS-006`, `SUPA-TRANS-007`, `SUPA-TRANS-014` |
| baseline, dry-run, colisiones, backfills, activación y rollback | `DATA-NORM-TRANS-001` a `DATA-NORM-TRANS-009`                          |

#### 33. Criterios de integridad

La política se considera íntegra para esta etapa cuando:

1. define exactamente cuatro familias de excepción;
2. exige fuente, evidencia, owner, alcance, versión y vigencia;
3. define cuatro alcances y tres modos de coincidencia cerrados;
4. prohíbe matching difuso, subcadenas y aliases implícitos;
5. define cuatro modos de aplicación y siete resultados cerrados;
6. aplica precedencia por valor completo, frase más larga, token y componente estructurado;
7. bloquea conflictos de igual especificidad;
8. preserva la grafía completa de marcas;
9. separa siglas contractuales de palabras en mayúsculas;
10. separa código unitario, etiqueta, cantidad, empaque y conversión;
11. preserva nombres legales completos y sufijos exactos sin declararlos equivalentes;
12. aprueba únicamente formas iniciales con respaldo canónico suficiente;
13. asigna candidatos no resueltos a revisión humana;
14. restringe mutación a representaciones y fuentes autorizadas;
15. preserva originales, snapshots y evidencia;
16. separa excepciones, diccionario, búsqueda e identidad;
17. exige versionado, paridad e idempotencia;
18. mantiene VITAL fuera del alcance transversal;
19. incluye corpus positivo, negativo, ambiguo y de conflicto;
20. no autoriza cambios físicos, backfills, fusiones ni decisiones reservadas.

#### 34. Requisitos de prueba derivados

Se crean los requisitos:

- `TREQ-DATA-069`;
- `TREQ-DATA-070`;
- `TREQ-DATA-071`;
- `TREQ-DATA-072`;
- `TREQ-DATA-073`;
- `TREQ-DATA-074`;
- `TREQ-DATA-075`;
- `TREQ-DATA-076`;
- `TREQ-DATA-077`;
- `TREQ-DATA-078`;
- `TREQ-DATA-079`;
- `TREQ-DATA-080`;
- `TREQ-DATA-081`;
- `TREQ-DATA-082`;
- `TREQ-DATA-083`;
- `TREQ-DATA-084`;
- `TREQ-DATA-085`;
- `TREQ-DATA-086`.

El detalle canónico de cada requisito reside en el registro 04A actualizado hasta esta tarea.

#### 35. Continuidad

```text
ÚLTIMA TAREA APROBADA
DATA-NORM-ARC-004 — Definir conectores que permanecen en minúscula
        ↓
TAREA ACTUAL APROBADA
DATA-NORM-ARC-005 — Definir excepciones de marcas, siglas, unidades y nombres legales
        ↓
SIGUIENTE TAREA RESERVADA
DATA-NORM-ARC-006 — Definir diccionario ortográfico canónico y su gobierno
```


### ✅ DATA-NORM-ARC-006 — Definir diccionario ortográfico canónico y su gobierno

**Estado:** APROBADA
**Tarea anterior:** `DATA-NORM-ARC-005 — Definir excepciones de marcas, siglas, unidades y nombres legales` — APROBADA
**Tarea siguiente:** `DATA-NORM-ARC-007 — Definir cola de revisión para correcciones ambiguas`
**Tipo de tarea:** definición normativa del diccionario ortográfico canónico, cerrado, direccional, versionado, contextual y auditable para correcciones aprobadas de texto empresarial; sin DDL, DML, migraciones, backfills, correcciones de datos, fusiones, cambios de índices, constraints, funciones, triggers, clientes, integraciones, configuración ni despliegues

#### 1. Objetivo

Definir el diccionario ortográfico canónico que permitirá corregir de manera automática únicamente errores o formas no canónicas previamente aprobadas, bajo una coordenada explícita de dominio, entidad, campo, clase semántica, representación, fuente, perfil lingüístico, alcance y versión.

La política deberá separar la corrección ortográfica de la capitalización, la normalización de espacios, Unicode, conectores, excepciones oficiales, búsqueda, identidad y unicidad; impedir correcciones por similitud o inferencia; preservar originales externos, snapshots y evidencia; y remitir toda forma ambigua a revisión humana sin modificarla silenciosamente.

#### 2. Artefacto producido

```text
VENTO_CANONICAL_ORTHOGRAPHIC_DICTIONARY_ES_CO@1.0.0
```

| Propiedad                         | Valor |
| --------------------------------- | ----: |
| Perfil lingüístico aprobado       |     1 |
| Formas canónicas iniciales        |     3 |
| Alcances de coincidencia cerrados |     3 |
| Modos de decisión cerrados        |     3 |
| Estados de ciclo de vida          |     6 |
| Resultados cerrados de evaluación |     7 |
| Requisitos de prueba nuevos       |    18 |
| Cambios físicos autorizados       |     0 |

#### 3. Fuentes canónicas consumidas

| Fuente                                | Decisión consumida                                                                                                        |
| ------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| `01_PROTOCOLO.md`                     | continuidad, una sola tarea, fase exclusivamente documental y preservación de decisiones aprobadas                        |
| `delivery-contract.json`              | identidad del artefacto y actualización integral del registro 04A al crear requisitos                                     |
| `active-sequence.json`                | `DATA-NORM-ARC-006` como tarea actual y `DATA-NORM-ARC-007` como siguiente tarea reservada                                |
| `DATA-NORM-AUD-002`                   | inconsistencias observadas de tildes, caja, espacios, signos, Unicode y conectores                                        |
| `DATA-NORM-AUD-003`                   | formas protegidas que no admiten transformación genérica                                                                  |
| `DATA-NORM-AUD-005`                   | separación entre normalización determinista, diccionario aprobado, revisión humana, preservación y resolución estructural |
| `DATA-NORM-AUD-006`                   | productores distribuidos y riesgo de reglas locales divergentes                                                           |
| `DATA-NORM-AUD-007`                   | impacto de las transformaciones sobre búsquedas, consumidores, relaciones, unicidad e integraciones                       |
| `DATA-NORM-ARC-001`                   | política por dominio, entidad y campo; separación de representaciones; comportamiento cerrado e idempotencia              |
| `DATA-NORM-ARC-002`                   | clases semánticas, roles de representación y fuente, modos de tratamiento y exclusiones                                   |
| `DATA-NORM-ARC-003`                   | capitalización empresarial separada de la ortografía y consumo posterior de un diccionario aprobado                       |
| `DATA-NORM-ARC-004`                   | catálogo cerrado de conectores y prohibición de sustituir palabras mediante heurísticas lingüísticas                      |
| `DATA-NORM-ARC-005`                   | precedencia de marcas, siglas, unidades y nombres legales sobre cualquier corrección ortográfica genérica                 |
| Regla canónica del bloque propietario | corrección automática solo mediante diccionario aprobado, versionado y auditable; `expresso` permanece ambiguo            |

#### 4. Alcance y fronteras

Esta tarea define:

1. la identidad y semántica del diccionario ortográfico canónico `es-CO`;
2. el contrato lógico mínimo de cada entrada;
3. los alcances exactos de coincidencia por valor completo, frase y token;
4. la coincidencia direccional exacta sin similitud ni inferencia;
5. la resolución de alcance entre campo, entidad, dominio y política transversal;
6. la precedencia frente a excepciones oficiales y tokens protegidos;
7. el catálogo inicial de correcciones respaldadas por ejemplos canónicos;
8. la exclusión explícita de `expresso` de la corrección automática;
9. la puerta de activación por clase, representación, fuente, locale y versión;
10. los estados, responsabilidades y reglas de gobierno de altas, cambios, suspensión y retiro;
11. la supersesión, no retroactividad y rollback lógico de versiones;
12. la procedencia, evidencia y autoridad exigidas;
13. los invariantes de determinismo, paridad e idempotencia;
14. el corpus mínimo de conformidad.

Esta tarea no define:

- la cola, interfaz, SLA, asignación o resolución física de revisiones humanas;
- la representación de búsqueda, transliteración o comparación tolerante;
- tablas, columnas, índices, constraints, RLS, funciones, RPC o triggers;
- la estructura física definitiva de auditoría y versionado;
- la capa ejecutora definitiva;
- unicidad, deduplicación, fusión o selección de registro sobreviviente;
- tratamiento físico de valores recibidos desde integraciones externas;
- backfills, lotes de corrección, despliegue, compatibilidad o migración de datos;
- entradas adicionales sin evidencia y aprobación canónicas.

Las decisiones permanecen en `DATA-NORM-ARC-007` a `DATA-NORM-ARC-012`, `SUPA-TRANS-001` a `SUPA-TRANS-015` y `DATA-NORM-TRANS-001` a `DATA-NORM-TRANS-009`, según su propiedad.

#### 5. Principios obligatorios

1. El diccionario es cerrado, explícito, direccional y versionado.
2. Una entrada corrige únicamente la forma de origen declarada hacia la forma canónica declarada.
3. La dirección inversa no se infiere.
4. La frecuencia, cercanía visual, distancia de edición, pronunciación probable o popularidad no constituyen autoridad.
5. No existe autocorrección por similitud.
6. Toda entrada deberá declarar alcance, clase, representación, fuente, evidencia, aprobación, estado y versión.
7. Solo una entrada `APPROVED_ACTIVE` podrá producir corrección automática.
8. Las excepciones oficiales y protecciones técnicas prevalecen sobre el diccionario.
9. Una entrada no podrá cambiar cantidad, unidad, código, marca, nombre legal, identidad ni estructura.
10. Un conflicto, una dependencia ausente o una clasificación insuficiente conservará el valor y bloqueará la mutación.
11. Los originales externos, snapshots y evidencia no serán sobrescritos.
12. Una versión nueva no reinterpretará silenciosamente datos históricos.
13. La aplicación repetida con la misma entrada, contexto y versiones será idempotente.
14. Una coincidencia ortográfica no crea identidad, unicidad ni autorización de fusión.
15. VITAL permanece fuera de este diccionario transversal salvo contrato propio explícito.

#### 6. Identidad, perfil y versión

El diccionario aprobado se identifica como:

```text
VENTO_CANONICAL_ORTHOGRAPHIC_DICTIONARY_ES_CO@1.0.0
```

Reglas:

1. `es-CO` deberá declararse como perfil de política y no inferirse desde el sistema operativo, navegador, proceso o base de datos.
2. La versión fija entradas, alcances, precedencia, segmentación compatible, proyección de caja y resultados cerrados.
3. Una modificación de forma de origen, forma canónica, alcance, estado, evidencia o precedencia constituye cambio versionado.
4. Ninguna capa podrá mantener un diccionario paralelo, ampliar entradas localmente o usar paquetes lingüísticos genéricos como sustituto.
5. Un diccionario para otro idioma o producto requerirá identidad, versión, alcance, pruebas y aprobación propios.

#### 7. Clases, representaciones y fuentes elegibles

La corrección automática solo podrá evaluarse cuando todas las dimensiones sean compatibles:

| Dimensión             | Elegible                                                                     | Conducta                                                                 |
| --------------------- | ---------------------------------------------------------------------------- | ------------------------------------------------------------------------ |
| clase semántica       | `COMMERCIAL_NAME` y otra clase expresamente autorizada por política de campo | aplicar únicamente entradas compatibles con la clase declarada           |
| representación        | `PRIMARY_VALUE` mutable o `DISPLAY_OVERRIDE` aprobado                        | corregir dentro del alcance autorizado                                   |
| fuente                | `AUTHORITATIVE_SOURCE` o `APPROVED_OVERRIDE`                                 | permitir mutación trazable                                               |
| proyección            | `OUTPUT_PROJECTION`                                                          | derivar sin retroalimentar la fuente                                     |
| copia sincronizada    | `SYNCHRONIZED_COPY`                                                          | recibir el resultado por propagación gobernada, no corregirse localmente |
| original externo      | `EXTERNAL_ORIGINAL`                                                          | preservar exactamente                                                    |
| histórico o evidencia | `HISTORICAL_SNAPSHOT`, `IMMUTABLE_SNAPSHOT`, `AUDIT_EVIDENCE`                | preservar exactamente                                                    |

Quedan bloqueados por defecto:

- `OFFICIAL_BRAND_FORM`;
- `OFFICIAL_LEGAL_NAME`;
- `MEASUREMENT_OR_UNIT_CODE`;
- `TECHNICAL_IDENTIFIER`;
- `CONTACT_IDENTIFIER`;
- `SECRET_OR_SIGNATURE_MATERIAL`;
- `UNCLASSIFIED_PRESERVE`;
- texto libre sin política propia explícita;
- valores de VITAL.

#### 8. Contrato lógico de una entrada

Toda entrada deberá poder expresar, como mínimo:

```text
dictionary_entry_key
locale
source_form
canonical_form
match_scope
semantic_class
domain_scope
entity_scope
field_scope
representation_role
source_role
case_projection_mode
decision_mode
status
valid_from
valid_to
dictionary_version
supersedes
evidence_reference
approval_reference
reason
```

Reglas:

1. `dictionary_entry_key` será estable y no dependerá del texto visible.
2. `source_form` y `canonical_form` conservarán Unicode, signos, separación y estructura aprobados.
3. `source_form` no podrá estar vacío ni ser igual a `canonical_form` bajo la comparación definida para la entrada.
4. `match_scope` deberá ser uno de los alcances cerrados de esta tarea.
5. El alcance mínimo deberá identificar dominio, entidad y campo o declarar explícitamente un alcance superior aprobado.
6. La clase, representación y fuente deberán ser compatibles con `DATA-NORM-ARC-002`.
7. `case_projection_mode` deberá preservar la caja ya resuelta por la etapa de capitalización y no ejecutar una capitalización nueva.
8. `evidence_reference` y `approval_reference` serán obligatorios para activar una entrada.
9. Una entrada incompleta no será ejecutable.
10. La estructura física y su persistencia pertenecen a `DATA-NORM-ARC-009` y `DATA-NORM-ARC-011`.

#### 9. Alcances cerrados de coincidencia

| Alcance      | Definición                                                    | Uso permitido                                                                      |
| ------------ | ------------------------------------------------------------- | ---------------------------------------------------------------------------------- |
| `FULL_VALUE` | la entrada cubre todo el valor textual                        | corrección aprobada de un valor completo dentro de un campo y contexto específicos |
| `PHRASE`     | secuencia contigua y exacta de tokens con fronteras completas | locución o denominación cuya corrección no puede resolverse token por token        |
| `TOKEN`      | token lexical completo                                        | palabra ordinaria con corrección aprobada                                          |

Una coincidencia exige fronteras completas. No se admiten subcadenas dentro de palabras, códigos, modelos, URLs, correos, rutas, marcas, nombres legales o identificadores.

#### 10. Coincidencia direccional exacta

La evaluación deberá cumplir simultáneamente:

1. comparar la forma de origen mediante casefold Unicode compatible con `es-CO`, conservando diacríticos, signos, separación y fronteras;
2. aceptar únicamente coincidencia exacta del alcance declarado;
3. tratar `source_form` como origen y `canonical_form` como destino, sin inferir reversibilidad;
4. preservar la caja resuelta por la etapa anterior mediante `PRESERVE_RESOLVED_CASE_PATTERN`;
5. bloquear valores con patrón de caja no resoluble o sin metadatos suficientes para proyectar la salida;
6. no eliminar tildes para encontrar coincidencias distintas de la entrada explícita;
7. no compactar espacios, cambiar Unicode, sustituir signos ni dividir o unir palabras durante el matching.

Ejemplos de proyección aprobada para una entrada token:

```text
maiz  → maíz
Maiz  → Maíz
MAIZ  → MAÍZ
```

La proyección de caja no autoriza resultados mixtos arbitrarios ni reemplaza la política de capitalización.

#### 11. Modos cerrados de decisión

| Modo                   | Conducta                                                                                                         |
| ---------------------- | ---------------------------------------------------------------------------------------------------------------- |
| `REPLACE_ORTHOGRAPHY`  | emite la forma canónica y conserva la caja resuelta cuando existe coincidencia, autoridad y política compatibles |
| `PRESERVE_AS_APPROVED` | conserva una forma válida dentro de un alcance específico y evita que una entrada más amplia la modifique        |
| `REVIEW_REQUIRED`      | conserva el valor y declara que la corrección necesita decisión humana                                           |

Una entrada de preservación o revisión deberá tener la misma trazabilidad, alcance, evidencia, vigencia y versión que una entrada de reemplazo.

#### 12. Catálogo inicial aprobado

La versión `1.0.0` contiene exactamente tres correcciones iniciales respaldadas por los ejemplos canónicos del bloque:

| Clave lógica                  | Origen    | Forma canónica | Alcance | Modo                  | Restricción                                                      |
| ----------------------------- | --------- | -------------- | ------- | --------------------- | ---------------------------------------------------------------- |
| `ORTHO_ES_CO_MAIZ_MAIZ`       | `maiz`    | `maíz`         | `TOKEN` | `REPLACE_ORTHOGRAPHY` | palabra ordinaria no protegida dentro de clase y campo elegibles |
| `ORTHO_ES_CO_CLASICO_CLASICO` | `clasico` | `clásico`      | `TOKEN` | `REPLACE_ORTHOGRAPHY` | palabra ordinaria no protegida dentro de clase y campo elegibles |
| `ORTHO_ES_CO_FRIO_FRIO`       | `frio`    | `frío`         | `TOKEN` | `REPLACE_ORTHOGRAPHY` | palabra ordinaria no protegida dentro de clase y campo elegibles |

Estas entradas no autorizan:

- corregir una marca, nombre legal, código, unidad o término extranjero coincidente;
- buscar por forma sin tilde como si fuera identidad;
- crear aliases no declarados;
- aplicar la corrección a originales externos o históricos;
- agregar otras palabras por analogía.

#### 13. Exclusión explícita de `expresso`

`expresso` no forma parte de las correcciones automáticas de la versión `1.0.0`.

La forma deberá conservarse y producir `DICTIONARY_AMBIGUOUS_REVIEW` cuando no exista una decisión contextual que determine si corresponde a:

- error ortográfico;
- denominación comercial;
- nombre histórico;
- marca;
- producto externo;
- término extranjero o variante deliberada.

Quedan prohibidas las sustituciones automáticas `expresso` → `espresso`, `expreso` o cualquier otra forma. La resolución, evidencia y cola pertenecen a `DATA-NORM-ARC-007`.

#### 14. Puerta de activación

El diccionario solo podrá intervenir cuando todas las condiciones siguientes sean verdaderas:

1. existe una política activa para dominio, entidad y campo;
2. la clase semántica admite corrección mediante diccionario;
3. la representación y el rol de fuente permiten mutación o derivación;
4. el perfil lingüístico es `es-CO`;
5. la versión del diccionario es compatible con capitalización, conectores y excepciones;
6. la entrada está `APPROVED_ACTIVE` y dentro de vigencia;
7. la coincidencia exacta y sus fronteras pueden resolverse;
8. no existe una excepción oficial o protección de mayor precedencia;
9. no existe conflicto entre entradas activas aplicables;
10. la proyección de caja puede resolverse determinísticamente;
11. la decisión, entrada y versiones pueden quedar trazadas.

La ausencia de cualquiera de estas condiciones preservará el valor y producirá un resultado bloqueado o de revisión.

#### 15. Resolución de alcance

La especificidad se resolverá en este orden:

```text
1. FIELD_SCOPE
2. ENTITY_SCOPE
3. DOMAIN_SCOPE
4. VENTO_OS_TRANSVERSAL_SCOPE
5. conservación por ausencia de política
```

Reglas:

1. una entrada más específica prevalece únicamente dentro de su alcance compatible;
2. una entrada específica no amplía una clase, representación o fuente bloqueada;
3. dos entradas activas incompatibles con la misma especificidad producen conflicto;
4. no se elige por fecha más reciente, orden físico, frecuencia ni consumidor;
5. un alcance transversal deberá estar aprobado expresamente y no se inferirá por ausencia de alcance local;
6. VITAL no participa en `VENTO_OS_TRANSVERSAL_SCOPE`.

#### 16. Precedencia general

La precedencia obligatoria será:

```text
1. excepción oficial de frase válida más larga
2. excepción oficial de token o componente estructurado
3. protección técnica por clase, representación o fuente
4. entrada de diccionario más específica
5. entrada de frase más larga dentro de la misma especificidad
6. entrada de token exacto
7. token sin entrada
8. forma ambigua o conflictiva
```

Consecuencias:

- `3M`, `iPhone`, `Coca-Cola`, siglas, unidades y nombres legales no se reescriben por una entrada ortográfica ordinaria;
- una entrada de diccionario no invalida el catálogo de conectores ni cambia su posición;
- un conflicto no se resuelve por orden de carga;
- una forma observada no se convierte en excepción o corrección por repetición.

#### 17. Frases, tokens y fronteras

1. Las entradas `PHRASE` se evaluarán antes que `TOKEN` dentro del mismo alcance y versión.
2. Entre frases compatibles se aplicará la coincidencia válida más larga.
3. Una frase deberá declarar exactamente sus tokens y separadores relevantes.
4. La coincidencia no podrá atravesar una frontera de valor, componente estructurado, campo, representación o fuente.
5. Una entrada token no coincidirá como subcadena.
6. Una frase parcial o solapada sin resolución única producirá conflicto.
7. La corrección no agregará, retirará ni moverá conectores, signos o palabras.

#### 18. Prohibiciones de inferencia

El diccionario no podrá utilizar:

- distancia de Levenshtein u otra distancia de edición;
- coincidencia difusa;
- algoritmos fonéticos;
- autocorrección del navegador, sistema operativo o teclado;
- stemming o lematización;
- singularización o pluralización;
- traducción o transliteración;
- inferencia por frecuencia, popularidad o forma mayoritaria;
- aprendizaje automático no aprobado como autoridad;
- eliminación de tildes para ampliar coincidencias;
- generación automática de aliases;
- sustitución entre `y`/`e` u `o`/`u`;
- contracción o expansión de `a el`, `al`, `de el` o `del`;
- unión o división de palabras;
- corrección basada en nombre de tabla, columna, aplicación o consumidor.

Una sugerencia producida por una herramienta no canónica podrá convertirse únicamente en candidato para revisión; nunca en corrección automática.

#### 19. Separación de operaciones

| Operación                                  | Pertenece a esta tarea | Conducta                                              |
| ------------------------------------------ | ---------------------- | ----------------------------------------------------- |
| reemplazo ortográfico aprobado             | sí                     | aplicar una entrada exacta y trazable                 |
| preservación contextual aprobada           | sí                     | bloquear una corrección más amplia dentro del alcance |
| clasificación como ambigua                 | sí, como resultado     | conservar y remitir a la tarea de revisión            |
| recorte o compactación de espacios         | no                     | operación determinista separada                       |
| composición Unicode NFC                    | no                     | operación previa separada cuando el campo la autorice |
| capitalización empresarial                 | no                     | `DATA-NORM-ARC-003`                                   |
| conectores                                 | no                     | `DATA-NORM-ARC-004`                                   |
| marcas, siglas, unidades y nombres legales | no                     | `DATA-NORM-ARC-005`                                   |
| búsqueda o comparación tolerante           | no                     | `DATA-NORM-ARC-008`                                   |
| identidad, unicidad o fusión               | no                     | `DATA-NORM-ARC-010`                                   |

La salida de una etapa solo podrá alimentar la siguiente mediante un pipeline aprobado, versionado y auditable. El diccionario no deberá ocultar qué operación produjo cada cambio.

#### 20. Representaciones, fuentes y propagación

1. Solo un `PRIMARY_VALUE` de `AUTHORITATIVE_SOURCE` o un `DISPLAY_OVERRIDE` con `APPROVED_OVERRIDE` podrá recibir corrección directa cuando la política lo autorice.
2. `EXTERNAL_ORIGINAL`, `HISTORICAL_SNAPSHOT`, `IMMUTABLE_SNAPSHOT` y `AUDIT_EVIDENCE` se preservarán exactamente.
3. `OUTPUT_PROJECTION` podrá derivar una forma corregida sin retroalimentar la fuente.
4. `SEARCH_DERIVATION` utilizará su contrato propio y no convertirá la forma corregida en identidad.
5. Una `SYNCHRONIZED_COPY` no ejecutará el diccionario de forma independiente; recibirá el resultado mediante propagación gobernada.
6. Una versión nueva no resincronizará snapshots ni historia anterior.
7. Un override conservará su alcance y no redefinirá el diccionario global.
8. La propagación técnica, eventos y precedencia entre capas pertenecen a `DATA-NORM-ARC-009` y `DATA-NORM-ARC-011`.

#### 21. Estados de ciclo de vida

| Estado            | Ejecutable | Conducta                                                              |
| ----------------- | ---------- | --------------------------------------------------------------------- |
| `DRAFT`           | no         | propuesta incompleta o pendiente de evaluación                        |
| `APPROVED_ACTIVE` | sí         | entrada aprobada, vigente y compatible                                |
| `SUSPENDED`       | no         | entrada temporalmente bloqueada por riesgo, conflicto o investigación |
| `SUPERSEDED`      | no         | reemplazada por otra entrada o versión explícita                      |
| `RETIRED`         | no         | retirada sin sustitución ejecutable                                   |
| `REJECTED`        | no         | propuesta descartada con justificación preservada                     |

Solo `APPROVED_ACTIVE` podrá ejecutar `REPLACE_ORTHOGRAPHY` o `PRESERVE_AS_APPROVED`. Los demás estados conservarán historial y no podrán utilizarse como fallback.

#### 22. Gobierno de altas y cambios

Toda propuesta deberá incluir:

1. forma de origen y forma canónica;
2. locale, alcance y clase;
3. representación y fuente autorizadas;
4. evidencia reproducible;
5. riesgo de falso positivo;
6. consumidores afectados;
7. colisiones con excepciones, conectores y entradas existentes;
8. corpus positivo, negativo y ambiguo;
9. responsable empresarial del dominio afectado;
10. responsable canónico de normalización;
11. decisión y justificación aprobadas.

Reglas de gobierno:

- no se editará silenciosamente una entrada activa;
- una corrección transversal requerirá revisión de todos los dominios consumidores identificados;
- una entrada específica no podrá usarse como precedente para ampliar el alcance;
- una propuesta ambigua permanecerá fuera de ejecución automática;
- una corrección observada en producción sin entrada activa será una desviación, no una nueva regla;
- toda brecha detectada deberá quedar asignada a una tarea o decisión canónica concreta.

#### 23. Versionado, supersesión y rollback lógico

1. Cada cambio ejecutable deberá originar una nueva versión o una nueva entrada que declare `supersedes`.
2. La entrada reemplazada conservará su historial y estado `SUPERSEDED`.
3. El cambio no será retroactivo por defecto.
4. La corrección de datos existentes requerirá una tarea de transición, análisis de impacto, pruebas y rollback propios.
5. Revertir una versión exigirá activar explícitamente una versión anterior compatible o una versión correctiva nueva.
6. El rollback no eliminará decisiones, evidencia, entradas ni resultados históricos.
7. Una versión retirada no podrá reaparecer por caché, fallback o consumidor local.
8. Los artefactos históricos deberán conservar la versión aplicada en el momento de su creación.

#### 24. Conflictos y comportamiento cerrado

Se considerará conflicto cuando:

- dos entradas activas aplicables producen formas canónicas distintas;
- una entrada de reemplazo y una de preservación tienen la misma especificidad;
- dos frases aplicables se solapan sin resolución única;
- la entrada contradice una excepción oficial vigente;
- falta compatibilidad de versión entre diccionario y pipeline;
- la evidencia o aprobación fue retirada;
- la clase, representación, fuente o locale no pueden determinarse;
- la proyección de caja no es determinista.

Ante conflicto:

1. se conserva el valor;
2. no se selecciona una entrada por orden físico, fecha o frecuencia;
3. se emite `DICTIONARY_CONFLICT_BLOCKED` o `DICTIONARY_AMBIGUOUS_REVIEW`;
4. se registra la coordenada y las entradas involucradas;
5. la resolución queda fuera de la mutación automática.

#### 25. Resultados cerrados de evaluación

| Resultado                        | Significado                                                                                  |
| -------------------------------- | -------------------------------------------------------------------------------------------- |
| `DICTIONARY_CANONICAL_EMITTED`   | una entrada activa y compatible produjo la forma canónica                                    |
| `DICTIONARY_ALREADY_CANONICAL`   | el valor ya satisface la entrada aplicable y no requiere cambio                              |
| `DICTIONARY_PRESERVED_PROTECTED` | una excepción, clase, representación, fuente o entrada de preservación bloqueó la corrección |
| `DICTIONARY_NOT_APPLICABLE`      | no existe entrada compatible con la coordenada evaluada                                      |
| `DICTIONARY_AMBIGUOUS_REVIEW`    | la forma requiere decisión humana y se conserva                                              |
| `DICTIONARY_CONFLICT_BLOCKED`    | dos o más decisiones aplicables son incompatibles                                            |
| `DICTIONARY_POLICY_BLOCKED`      | falta política, versión, evidencia, aprobación o contexto obligatorio                        |

Una ausencia de cambio deberá distinguirse entre forma ya canónica, valor protegido, inexistencia de entrada, ambigüedad, conflicto y bloqueo de política.

#### 26. Procedencia, evidencia y autoridad

Toda decisión ejecutada deberá poder atribuirse lógicamente a:

```text
entrada de diccionario
versión del diccionario
forma de origen
forma canónica
alcance resuelto
clase semántica
representación
rol de fuente
perfil lingüístico
modo de decisión
evidencia
aprobación
fecha de vigencia
```

No constituyen evidencia suficiente por sí solas:

- la forma más frecuente en la base de datos;
- la forma más reciente;
- una sugerencia del navegador o teclado;
- el resultado de una búsqueda externa no incorporado como evidencia aprobada;
- la preferencia de una interfaz o desarrollador;
- una coincidencia sin tildes;
- la salida de un modelo lingüístico;
- el nombre de una tabla, columna o función.

La materialización física de la traza pertenece a `DATA-NORM-ARC-009`.

#### 27. Determinismo, paridad e idempotencia

Para una misma entrada, coordenada y conjunto de versiones:

```text
apply_dictionary(apply_dictionary(value, context), context)
=
apply_dictionary(value, context)
```

La igualdad deberá cubrir:

- valor resultante;
- entrada seleccionada;
- alcance resuelto;
- forma de origen y forma canónica;
- proyección de caja;
- precedencia aplicada;
- resultado cerrado;
- bloqueo o revisión;
- versiones y evidencia referenciadas;
- ausencia de efectos duplicados.

Aplicación, servicio de dominio, RPC, proceso programado y trigger defensivo deberán producir la misma decisión cuando consuman la misma entrada, coordenada y versiones. Ninguna capa podrá ampliar el diccionario, resolver conflictos de forma distinta ni convertir una revisión en corrección.

#### 28. Corpus mínimo de conformidad

| Entrada y contexto                                 | Resultado esperado                            | Regla demostrada                                 |
| -------------------------------------------------- | --------------------------------------------- | ------------------------------------------------ |
| `harina de maiz` después de capitalización         | `Harina de Maíz`                              | corrección token y preservación de caja resuelta |
| `pan masa madre clasico` después de capitalización | `Pan Masa Madre Clásico`                      | corrección exacta de token                       |
| `latte frio` después de capitalización             | `Latte Frío`                                  | corrección de tilde sin cambiar palabras         |
| `MAIZ` en token elegible                           | `MAÍZ`                                        | proyección de caja estable                       |
| `Maíz`                                             | sin cambio con `DICTIONARY_ALREADY_CANONICAL` | idempotencia                                     |
| `expresso` sin decisión contextual                 | conservar y revisar                           | ambigüedad no automática                         |
| `Coca-Cola`                                        | conservar                                     | precedencia de marca oficial                     |
| `COMERCIALIZADORA ABC S.A.S.`                      | conservar                                     | nombre legal excluido                            |
| `500 g`                                            | conservar                                     | cantidad y unidad protegidas                     |
| `product_sku=FRIO`                                 | conservar                                     | identificador técnico excluido                   |
| `EXTERNAL_ORIGINAL=maiz`                           | conservar exactamente                         | representación externa protegida                 |
| `maizena`                                          | no aplicar                                    | token parcial prohibido                          |
| entrada duplicada con dos destinos                 | conservar y bloquear                          | conflicto de misma especificidad                 |
| entrada de campo y entrada transversal compatibles | aplicar la de campo                           | precedencia de alcance                           |
| versión retirada en caché                          | bloquear                                      | no fallback a versión no activa                  |

El corpus deberá cubrir además Unicode compuesto, signos, guiones, apóstrofos, frases, fronteras, múltiples cajas, campos excluidos, sources, overrides, snapshots, conflictos, versiones, múltiples capas e idempotencia.

#### 29. Conductas no conformes

Quedan prohibidas:

1. corregir una palabra no registrada por similitud;
2. aceptar una sugerencia de teclado, navegador o librería como autoridad;
3. eliminar tildes para ampliar el matching;
4. aplicar una entrada como subcadena;
5. inferir la corrección inversa;
6. generar aliases automáticamente;
7. ejecutar una entrada distinta de `APPROVED_ACTIVE`;
8. elegir entre conflictos por orden de carga, fecha o frecuencia;
9. corregir marcas, siglas, unidades, nombres legales o identificadores mediante entradas ordinarias;
10. modificar originales externos, snapshots o evidencia;
11. ejecutar el diccionario sobre texto libre sin política propia;
12. mezclar capitalización, espacios, Unicode, conectores o búsqueda dentro de la misma decisión;
13. permitir diccionarios locales por aplicación o capa;
14. reinterpretar historia con una versión nueva;
15. aplicar el diccionario transversal de Vento OS a VITAL;
16. usar una forma corregida como clave de identidad, unicidad o fusión.

#### 30. Relación con búsqueda, identidad, unicidad y fusiones

1. La forma corregida continúa siendo una representación mostrada o derivada según su contrato.
2. La representación de búsqueda será definida por `DATA-NORM-ARC-008`.
3. El diccionario no crea ni modifica SKU, slug, código, barcode, URL, email, referencia o clave externa.
4. Dos valores que convergen después de una corrección solo producen una señal textual.
5. La política no activa constraints de unicidad.
6. La política no selecciona registro sobreviviente, no desactiva filas y no reasigna relaciones.
7. Toda posible fusión deberá revisar relaciones, movimientos, recetas, inventario, proveedores, integraciones, historial, auditoría, evidencia y rollback.
8. La estrategia de duplicados normalizados pertenece a `DATA-NORM-ARC-010`.

#### 31. Decisiones reservadas

| Decisión                                                                  | Tarea propietaria                                      |
| ------------------------------------------------------------------------- | ------------------------------------------------------ |
| cola, evidencia de revisión, responsables, SLA y resolución de ambigüedad | `DATA-NORM-ARC-007`                                    |
| búsqueda, transliteración y comparación tolerante                         | `DATA-NORM-ARC-008`                                    |
| persistencia de versiones, trazas y auditoría                             | `DATA-NORM-ARC-009`                                    |
| identidad, unicidad y duplicados normalizados                             | `DATA-NORM-ARC-010`                                    |
| aplicación, servicio de dominio, RPC y trigger defensivo                  | `DATA-NORM-ARC-011`                                    |
| valores recibidos desde integraciones externas                            | `DATA-NORM-ARC-012`                                    |
| materialización, backfills, compatibilidad, pruebas y rollback            | tareas `SUPA-TRANS-*` y `DATA-NORM-TRANS-*` aplicables |

#### 32. Criterios de integridad

La política se considera íntegra para esta etapa cuando:

1. define un diccionario cerrado, direccional, versionado y específico de `es-CO`;
2. exige coordenada, evidencia, aprobación, estado y versión para cada entrada;
3. permite únicamente coincidencia exacta de valor, frase o token con fronteras completas;
4. prohíbe similitud, fonética, distancia de edición, inferencia, traducción y aliases automáticos;
5. aprueba únicamente `maiz` → `maíz`, `clasico` → `clásico` y `frio` → `frío` como entradas iniciales;
6. excluye `expresso` de corrección automática;
7. preserva la caja resuelta por la etapa de capitalización sin ejecutar una capitalización nueva;
8. resuelve alcance por campo, entidad, dominio y política transversal;
9. aplica excepciones oficiales y protecciones técnicas antes del diccionario;
10. bloquea conflictos y dependencias ausentes;
11. limita ejecución a entradas `APPROVED_ACTIVE`;
12. preserva originales externos, snapshots, evidencia y VITAL;
13. separa ortografía, capitalización, espacios, Unicode, conectores, búsqueda e identidad;
14. exige supersesión explícita, no retroactividad y rollback lógico;
15. exige procedencia, determinismo, paridad e idempotencia;
16. incluye corpus positivo, negativo, ambiguo, conflictivo y de versiones;
17. no autoriza correcciones de datos existentes, cambios físicos ni decisiones reservadas;
18. no autoriza identidad, unicidad, consolidación ni fusión.

#### 33. Requisitos de prueba derivados

Se crean los requisitos:

- `TREQ-DATA-087`;
- `TREQ-DATA-088`;
- `TREQ-DATA-089`;
- `TREQ-DATA-090`;
- `TREQ-DATA-091`;
- `TREQ-DATA-092`;
- `TREQ-DATA-093`;
- `TREQ-DATA-094`;
- `TREQ-DATA-095`;
- `TREQ-DATA-096`;
- `TREQ-DATA-097`;
- `TREQ-DATA-098`;
- `TREQ-DATA-099`;
- `TREQ-DATA-100`;
- `TREQ-DATA-101`;
- `TREQ-DATA-102`;
- `TREQ-DATA-103`;
- `TREQ-DATA-104`.

El detalle canónico de cada requisito reside en el registro 04A actualizado hasta esta tarea.

#### 34. Continuidad

```text
ÚLTIMA TAREA APROBADA
DATA-NORM-ARC-005 — Definir excepciones de marcas, siglas, unidades y nombres legales
        ↓
TAREA ACTUAL APROBADA
DATA-NORM-ARC-006 — Definir diccionario ortográfico canónico y su gobierno
        ↓
SIGUIENTE TAREA RESERVADA
DATA-NORM-ARC-007 — Definir cola de revisión para correcciones ambiguas
```


### ✅ DATA-NORM-ARC-007 — Definir cola de revisión para correcciones ambiguas

**Estado:** APROBADA
**Tarea anterior:** `DATA-NORM-ARC-006 — Definir diccionario ortográfico canónico y su gobierno` — APROBADA
**Tarea siguiente:** `DATA-NORM-ARC-008 — Definir representación de búsqueda y comparación`
**Tipo de tarea:** definición normativa de la cola canónica de revisión humana para candidatos textuales ambiguos, su admisión, priorización, asignación, evidencia, SLA, decisión, segregación, escalamiento y cierre; sin DDL, DML, migraciones, backfills, correcciones de datos, activación de reglas, fusiones, cambios de índices, constraints, funciones, triggers, clientes, integraciones, configuración ni despliegues

#### 1. Objetivo

Definir el contrato canónico mediante el cual toda corrección, excepción, clasificación o forma textual que no pueda resolverse de manera determinista y autorizada deberá conservar el valor original y convertirse en un caso trazable de revisión humana.

La cola deberá impedir que una sugerencia, frecuencia observada, semejanza, decisión local o urgencia operativa se transforme en corrección automática. Cada caso deberá tener identidad estable, coordenada semántica, evidencia, riesgo, propietario, prioridad, SLA, decisión cerrada y destino documental. La resolución podrá autorizar una propuesta de política o catálogo, pero nunca modificará por sí sola datos existentes ni ejecutará fusiones, backfills o cambios estructurales.

#### 2. Artefacto producido

```text
VENTO_AMBIGUOUS_TEXT_REVIEW_QUEUE_POLICY@1.0.0
```

| Propiedad                                       | Valor |
| ----------------------------------------------- | ----: |
| Familias cerradas de detonante                  |    10 |
| Estados cerrados de la cola                     |    11 |
| Clases de prioridad y SLA                       |     4 |
| Funciones de responsabilidad                    |     7 |
| Resultados cerrados de decisión                 |     9 |
| Grupos iniciales de candidatos contextualizados |     8 |
| Requisitos de prueba nuevos                     |    18 |
| Cambios físicos autorizados                     |     0 |

#### 3. Fuentes canónicas consumidas

| Fuente                   | Decisión consumida                                                                                                                       |
| ------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `01_PROTOCOLO.md`        | continuidad, fase exclusivamente documental, preservación histórica, destino obligatorio de brechas y generación inmediata de requisitos |
| `delivery-contract.json` | identidad del artefacto de tarea y actualización integral del registro 04A al crear requisitos                                           |
| `active-sequence.json`   | `DATA-NORM-ARC-007` como tarea actual y `DATA-NORM-ARC-008` como siguiente tarea reservada                                               |
| `DATA-NORM-AUD-003`      | falsos positivos, formas oficiales, marcas, siglas, unidades, nombres legales, personas y candidatos sin autoridad suficiente            |
| `DATA-NORM-AUD-004`      | colisiones, homónimos, scopes, identidad y prohibición de fusionar por similitud textual                                                 |
| `DATA-NORM-AUD-005`      | separación entre normalización determinista, diccionario, revisión humana, preservación y resolución estructural                         |
| `DATA-NORM-AUD-006`      | productores distribuidos, copias, snapshots, integraciones y riesgo de decisiones locales divergentes                                    |
| `DATA-NORM-AUD-007`      | impacto sobre búsquedas, consumidores, relaciones, unicidad, contratos y transición                                                      |
| `DATA-NORM-ARC-001`      | ambigüedad fail closed, política por coordenada, preservación del original y niveles de decisión                                         |
| `DATA-NORM-ARC-002`      | clases semánticas, representaciones, fuentes y modo `HUMAN_REVIEW_REQUIRED`                                                              |
| `DATA-NORM-ARC-003`      | tokens, modelos, siglas, compuestos y formas internas ambiguas                                                                           |
| `DATA-NORM-ARC-004`      | conectores, formas compuestas, conflictos y precedencia contextual                                                                       |
| `DATA-NORM-ARC-005`      | candidatos de excepción, fuentes de autoridad, aliases, unidades y nombres legales                                                       |
| `DATA-NORM-ARC-006`      | diccionario cerrado, `expresso`, conflictos, evidencia, ciclo de vida y reserva expresa de cola, responsables y SLA                      |

#### 4. Alcance y fronteras

Esta tarea define:

1. qué resultados y condiciones deben crear o actualizar un caso de revisión;
2. la puerta que distingue una ambigüedad textual de un incidente técnico o problema estructural;
3. la identidad lógica y deduplicación de casos;
4. el contrato mínimo de cada caso;
5. los estados y transiciones cerrados de la cola;
6. las prioridades, relojes y objetivos de atención;
7. las funciones responsables y su segregación;
8. la evidencia mínima por clase de candidato;
9. el flujo de triage, análisis, decisión, aprobación y cierre;
10. los resultados cerrados y el efecto permitido de cada decisión;
11. la reapertura, supersesión, agrupación y tratamiento masivo;
12. la relación con catálogos, diccionario, búsqueda, identidad, capas de ejecución e integraciones;
13. el backlog inicial derivado de las tareas aprobadas;
14. los invariantes de seguridad, privacidad, determinismo e idempotencia.

Esta tarea no define:

- tablas, columnas, índices, RLS, grants, funciones, RPC, triggers, jobs, colas físicas ni interfaz;
- el almacenamiento definitivo de auditoría, versiones, decisiones o evidencias;
- el algoritmo de búsqueda, transliteración o comparación tolerante;
- scopes de unicidad, deduplicación empresarial, fusión o selección de sobreviviente;
- qué capa técnica ejecutará cada regla;
- el contrato físico de valores externos;
- backfills, correcciones de datos, activación de catálogos, propagación, despliegue o rollback;
- permisos concretos del catálogo de autorización.

Estas decisiones permanecen en `DATA-NORM-ARC-008` a `DATA-NORM-ARC-012`, `SUPA-TRANS-001` a `SUPA-TRANS-015` y `DATA-NORM-TRANS-001` a `DATA-NORM-TRANS-009`, según su propiedad.

#### 5. Principios obligatorios

1. **La ambigüedad preserva el valor.** Ningún caso pendiente, vencido, escalado o sin evidencia autoriza mutación.
2. **La cola gobierna decisiones, no datos.** Una resolución produce una decisión versionable; la corrección de registros pertenece a una transición separada.
3. **Una sugerencia no es autoridad.** Teclado, navegador, librería, frecuencia, búsqueda externa, modelo lingüístico o preferencia local solo pueden originar candidatos.
4. **La coordenada prevalece.** El mismo texto puede requerir decisiones distintas por dominio, entidad, campo, clase, representación, fuente, idioma y vigencia.
5. **La evidencia se evalúa por finalidad.** Una forma oficial, legal, técnica, histórica o externa exige la fuente adecuada para su clase.
6. **La revisión no define identidad.** Aprobar una forma textual no fusiona, desactiva, reasigna ni vuelve únicos registros.
7. **Las decisiones son aditivas e inmutables.** Un cambio posterior crea una revisión o supersesión vinculada; no reescribe la decisión anterior.
8. **La prioridad no reduce controles.** Una urgencia acorta el SLA, pero no elimina evidencia, segregación ni aprobación.
9. **La falta de respuesta no es aprobación.** El vencimiento conserva el caso abierto y bloqueado.
10. **La deduplicación no elimina contexto.** Solo casos con la misma clave lógica pueden compartir expediente; casos parecidos permanecen vinculados, no fusionados por intuición.
11. **Toda salida tiene propietario.** Ningún diferimiento, solicitud de evidencia o escalamiento quedará sin responsable y fecha de revisión.
12. **VITAL permanece separado.** Ninguna decisión transversal de Vento OS se aplica a VITAL por compartir infraestructura.

#### 6. Definición de caso de revisión

Un caso de revisión es un expediente lógico que representa una decisión textual no resoluble automáticamente y que conserva, como mínimo:

```text
valor original protegido
+ coordenada de política
+ candidato o conflicto observado
+ evidencia disponible
+ riesgo de una decisión incorrecta
+ responsables de análisis y decisión
+ estado, prioridad y SLA
+ resolución o escalamiento trazable
```

El caso no equivale a una entrada activa de diccionario, excepción, política de campo, alias, regla de búsqueda ni instrucción de modificación de datos.

#### 7. Familias cerradas de detonante

| Código lógico                         | Condición de ingreso                                                                                               | Ejemplo canónico                           |
| ------------------------------------- | ------------------------------------------------------------------------------------------------------------------ | ------------------------------------------ |
| `DICTIONARY_AMBIGUOUS_REVIEW`         | el diccionario reconoce una forma ambigua o expresamente excluida                                                  | `expresso`                                 |
| `DICTIONARY_CONFLICT_BLOCKED`         | dos entradas o decisiones ortográficas aplicables son incompatibles                                                | dos destinos para el mismo token y scope   |
| `OFFICIAL_EXCEPTION_CANDIDATE`        | una posible marca, sigla, unidad o forma legal carece de fuente, alcance o evidencia suficientes                   | `Oster`, `BBQ`, `SAS` sin contexto         |
| `OFFICIAL_EXCEPTION_CONFLICT`         | dos formas oficiales, aliases o fuentes de autoridad compiten en la misma coordenada                               | `Wellmix` frente a `Welmix`                |
| `CAPITALIZATION_AMBIGUOUS_TOKEN`      | caja interna, modelo, sigla, guion, apóstrofo o token mixto no puede clasificarse de manera determinista           | `iPhone` sin excepción; `TH33M.110.`       |
| `CONNECTOR_OR_COMPOUND_AMBIGUITY`     | un token compuesto o una secuencia no pertenece al catálogo cerrado y no tiene gramática aprobada                  | `y/o`, `de-la`                             |
| `UNCLASSIFIED_FIELD_OR_VALUE`         | clase semántica, representación, fuente, locale o política del campo no puede resolverse                           | columna legacy mezclada                    |
| `STRUCTURED_TEXT_RESOLUTION_REQUIRED` | cantidad, unidad, empaque, modelo, marca o descriptor aparecen mezclados y cambiar texto no resuelve la estructura | `Bolsa 1 kg`, `VOLNIC PALLOMARO`           |
| `AUTHORITY_OR_EVIDENCE_MISSING`       | existe una forma plausible, pero falta propietario, documento, estándar, fabricante o fuente autorizada            | razón social o marca observada sin soporte |
| `CROSS_LAYER_DECISION_DIVERGENCE`     | dos capas, consumidores o versiones producen decisiones distintas para la misma entrada y coordenada               | aplicación corrige y RPC preserva          |

El catálogo es cerrado. Un nuevo detonante requiere una decisión canónica que defina frontera, admisión, riesgo, evidencia, responsables y requisitos de prueba.

#### 8. Puerta de admisión

Un evento solo ingresará a la cola cuando:

1. exista un valor o huella protegida del valor original;
2. pueda identificarse el dominio, entidad, campo o trayectoria estructurada afectada;
3. exista una clase de detonante del catálogo;
4. la decisión no pueda resolverse mediante una regla activa, exacta y compatible;
5. el caso no corresponda exclusivamente a indisponibilidad, error de red, fallo de despliegue o configuración ausente;
6. la propuesta no intente resolver identidad, unicidad, fusión o una estructura relacional mediante texto;
7. exista un propietario inicial o una ruta de escalamiento por dominio;
8. puedan conservarse fuente, momento, versiones y consumidor que detectó el caso.

Los fallos técnicos sin ambigüedad semántica se remitirán al proceso de incidentes correspondiente. Los problemas de estructura o identidad podrán usar la cola para documentar la evidencia inicial, pero deberán terminar en un resultado de escalamiento, no en una corrección textual.

#### 9. Identidad lógica y deduplicación

Cada caso deberá tener una clave estable independiente de la presentación visible:

```text
review_case_key =
  candidate_kind
  + domain_scope
  + entity_scope
  + field_scope
  + semantic_class
  + representation_role
  + source_role
  + locale
  + original_value_hash
  + proposed_action
  + policy_version_set
```

Reglas:

1. el valor original exacto se conserva por separado; la clave utiliza una huella y no sustituye la evidencia;
2. solo una coincidencia exacta de todos los componentes permite deduplicar un caso abierto;
3. una versión, scope, fuente, representación o acción propuesta distinta crea un caso distinto y vinculado;
4. dos valores que convergen después de capitalización, diccionario o búsqueda no comparten identidad de caso por esa sola razón;
5. un evento repetido añade ocurrencia, consumidor, timestamp y evidencia al caso existente sin crear otra decisión;
6. una colisión de huella o una clave incompatible bloquea la deduplicación y crea revisión técnica vinculada;
7. el cierre de un caso no impide crear una revisión nueva cuando cambien evidencia, alcance o versiones.

#### 10. Contrato lógico mínimo del caso

Todo caso deberá poder expresar, como mínimo:

```text
review_case_id
review_case_key
candidate_kind
original_value_protected
original_value_hash
proposed_value_or_action
policy_coordinate
semantic_class
representation_role
source_role
locale
source_system_or_consumer
source_record_reference
detection_result
policy_version_set
candidate_rule_or_entries
risk_class
priority
status
occurrence_count
first_detected_at
last_detected_at
sla_acknowledgement_due_at
sla_decision_due_at
assigned_domain_steward
assigned_normalization_owner
evidence_requirements
evidence_references
conflicting_references
review_notes_protected
decision_outcome
decision_reason
decision_scope
decision_version
supersedes_review_case_id
escalation_target
resolved_at
```

Una entrada incompleta podrá permanecer en `OPEN` o `AWAITING_EVIDENCE`, pero no podrá pasar a aprobación ni producir una decisión ejecutable.

#### 11. Estados cerrados de la cola

| Estado                            | Significado                                                                                                   |
| --------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| `OPEN`                            | caso admitido, original preservado y triage pendiente                                                         |
| `TRIAGED`                         | detonante, coordenada, riesgo, prioridad y ruta inicial confirmados                                           |
| `AWAITING_EVIDENCE`               | faltan evidencias concretas, con responsable y fecha de entrega                                               |
| `ASSIGNED`                        | responsables de dominio y normalización aceptaron la asignación                                               |
| `UNDER_REVIEW`                    | análisis activo de evidencia, alcance, falsos positivos y consumidores                                        |
| `AWAITING_DOMAIN_DECISION`        | análisis completo y decisión empresarial del dominio pendiente                                                |
| `AWAITING_NORMALIZATION_APPROVAL` | decisión de dominio emitida y aprobación canónica de normalización pendiente                                  |
| `RESOLVED_APPROVED`               | decisión aprobada con alcance, evidencia, versión y destino posteriores definidos                             |
| `RESOLVED_REJECTED`               | candidato rechazado con justificación, evidencia y protección contra reingreso idéntico sin información nueva |
| `ESCALATED_STRUCTURAL`            | el problema pertenece a estructura, identidad, unicidad, integración o transición y tiene tarea destino       |
| `CANCELLED_DUPLICATE`             | ocurrencia unida a otro caso con clave lógica idéntica; conserva vínculo y procedencia                        |

No existe un estado de aprobación por silencio ni cierre automático por vencimiento. Un SLA vencido conserva el estado real y añade condición de incumplimiento visible.

#### 12. Transiciones permitidas

```text
OPEN
→ TRIAGED
→ AWAITING_EVIDENCE | ASSIGNED | ESCALATED_STRUCTURAL | CANCELLED_DUPLICATE

AWAITING_EVIDENCE
→ TRIAGED | ESCALATED_STRUCTURAL

ASSIGNED
→ UNDER_REVIEW | AWAITING_EVIDENCE

UNDER_REVIEW
→ AWAITING_EVIDENCE | AWAITING_DOMAIN_DECISION | ESCALATED_STRUCTURAL

AWAITING_DOMAIN_DECISION
→ UNDER_REVIEW | AWAITING_NORMALIZATION_APPROVAL | RESOLVED_REJECTED | ESCALATED_STRUCTURAL

AWAITING_NORMALIZATION_APPROVAL
→ UNDER_REVIEW | RESOLVED_APPROVED | RESOLVED_REJECTED | ESCALATED_STRUCTURAL
```

Los estados terminales no admiten edición ni retorno directo. Nueva evidencia crea una revisión vinculada que conserva la resolución original.

#### 13. Prioridad y SLA

Los SLA se miden en horas transcurridas desde `first_detected_at`. La espera de evidencia no detiene la edad total ni elimina el incumplimiento; deberá mostrarse separadamente quién conserva la acción pendiente.

| Prioridad     | Criterio mínimo                                                                                                                 | Acuse máximo | Decisión o escalamiento máximo |
| ------------- | ------------------------------------------------------------------------------------------------------------------------------- | -----------: | -----------------------------: |
| `P0_CRITICAL` | posible alteración de identidad, nombre legal, secreto, evidencia, código técnico, referencia financiera o cambio masivo activo |      2 horas |                       24 horas |
| `P1_HIGH`     | bloquea una fuente propietaria, integración o varios consumidores; existe riesgo material de falso positivo o divergencia       |      8 horas |                       72 horas |
| `P2_STANDARD` | candidato acotado sin mutación automática activa ni impacto crítico inmediato                                                   |     24 horas |                      240 horas |
| `P3_RESEARCH` | señal exploratoria, calidad histórica o candidato sin evidencia suficiente ni ruta activa de mutación                           |     72 horas |                      720 horas |

Reglas:

1. el SLA obliga a decidir, rechazar, pedir evidencia concreta o escalar; no obliga a aprobar;
2. una prioridad menor no podrá ocultar un cambio masivo, un dato protegido o una divergencia activa;
3. todo cambio de prioridad conservará valor anterior, actor, motivo y timestamp;
4. un incumplimiento deberá escalar al propietario del dominio y al responsable canónico de normalización;
5. la ausencia de asignación no suspende los relojes;
6. una reapertura inicia nuevos relojes y conserva los tiempos de la revisión anterior;
7. las notificaciones y automatizaciones físicas se definirán en las tareas de implementación correspondientes.

#### 14. Reglas de priorización

Se evaluarán, en este orden:

1. posibilidad de mutación destructiva o activación no autorizada;
2. sensibilidad de la clase o representación;
3. alcance de campo, entidad, dominio o transversal;
4. cantidad de consumidores y capas divergentes;
5. uso en contratos, documentos, etiquetas, integraciones o decisiones empresariales;
6. recurrencia y crecimiento de ocurrencias;
7. existencia de workaround seguro de preservación;
8. disponibilidad y calidad de evidencia;
9. impacto sobre transición, backfill o cutover;
10. antigüedad del caso.

Frecuencia y antigüedad pueden elevar prioridad, pero nunca constituyen evidencia de la forma correcta.

#### 15. Funciones de responsabilidad

Las siguientes son funciones del proceso y no roles de autorización ni permisos concedidos:

| Función                        | Responsabilidad                                                                                                                 |
| ------------------------------ | ------------------------------------------------------------------------------------------------------------------------------- |
| `CANDIDATE_PRODUCER`           | registra la ocurrencia, conserva el original y aporta contexto sin aprobar su propia propuesta                                  |
| `QUEUE_TRIAGE_STEWARD`         | confirma admisión, detonante, clave, prioridad, SLA, duplicidad y ruta                                                          |
| `DOMAIN_STEWARD`               | determina significado empresarial, alcance, consumidores y riesgo dentro del dominio                                            |
| `EVIDENCE_VALIDATOR`           | verifica procedencia, vigencia, integridad y suficiencia de documentos, estándares o fuentes externas                           |
| `NORMALIZATION_DECISION_OWNER` | asegura consistencia con políticas, catálogos, versiones, precedencia y frontera VITAL                                          |
| `STRUCTURAL_ESCALATION_OWNER`  | recibe casos de estructura, identidad, unicidad, integración o transición y los vincula con su tarea propietaria                |
| `IMPLEMENTATION_OPERATOR`      | materializa posteriormente una decisión aprobada sin cambiar alcance, evidencia ni resultado; no participa como aprobador único |

La asignación concreta de permisos y capacidades pertenece al catálogo de autorización y a `DATA-NORM-ARC-011`.

#### 16. Segregación y autoridad de decisión

1. `CANDIDATE_PRODUCER` no podrá ser el único aprobador del caso que originó.
2. `QUEUE_TRIAGE_STEWARD` podrá unir duplicados exactos, corregir clasificación administrativa y solicitar evidencia, pero no activar reglas.
3. Toda decisión `RESOLVED_APPROVED` requerirá como mínimo la conformidad de `DOMAIN_STEWARD` y `NORMALIZATION_DECISION_OWNER`.
4. Casos `P0_CRITICAL`, alcance transversal, nombres legales, marcas externas, unidades, códigos, secretos o evidencia exigirán además validación de fuente por `EVIDENCE_VALIDATOR` cuando aplique.
5. Una persona que materialice la decisión no podrá ampliar su alcance, cambiar su resultado ni sustituir evidencia durante implementación.
6. Un conflicto de interés, ausencia de propietario o desacuerdo no se resuelve por jerarquía técnica; deberá escalarse con el caso abierto.
7. Rechazo y preservación también deberán conservar autoridad, motivo y alcance para evitar reingresos informales.
8. La interfaz no podrá presentar una recomendación automática como aprobación humana.

#### 17. Evidencia mínima por clase de candidato

| Clase de candidato               | Evidencia mínima                                                                                                                  |
| -------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| ortografía ordinaria             | forma observada, contexto completo, fuente propietaria, significado, corpus positivo y negativo, riesgo de falso positivo         |
| marca o denominación comercial   | fuente del titular, fabricante o propietario interno; alcance de producto o entidad; aliases explícitos y vigencia                |
| sigla, abreviatura o código      | catálogo o contrato que defina significado, contexto, caja, puntuación y consumidores                                             |
| unidad o componente estructurado | catálogo dimensional, código, etiqueta, cantidad, multiplicador, contexto y factor cuando corresponda                             |
| nombre legal                     | documento o fuente legal/regulatoria, jurisdicción, fecha, vigencia y vínculo con la entidad                                      |
| persona o actor                  | fuente de identidad autorizada, consentimiento o proceso de rectificación aplicable; sin exponer datos innecesarios               |
| texto externo                    | payload original protegido, sistema, contrato, momento de recepción y mapeo interno propuesto                                     |
| texto histórico o evidencia      | razón que justifica cualquier derivación sin modificar el original, versión y relación con el hecho histórico                     |
| clasificación de campo           | dominio, entidad, trayectoria, significado, consumidores, ejemplos válidos e inválidos, representaciones y rol de fuente          |
| divergencia entre capas          | entrada, coordenada, versiones, resultados por capa, orden de ejecución, reintentos y evidencia reproducible                      |
| estructura o identidad           | componentes, relaciones, referencias, movimientos, consumidores, posibles colisiones y tarea propietaria del análisis estructural |

Una captura aislada, la forma mayoritaria o una búsqueda no incorporada como fuente autorizada no satisface por sí sola la evidencia mínima.

#### 18. Flujo canónico de revisión

```text
1. detectar un resultado ambiguo, conflictivo o no clasificable
        ↓
2. preservar valor, fuente, versiones y contexto
        ↓
3. resolver o crear review_case_key
        ↓
4. registrar ocurrencia y consumidores afectados
        ↓
5. ejecutar triage, riesgo, prioridad y SLA
        ↓
6. verificar si corresponde a texto, estructura, identidad o incidente
        ↓
7. asignar steward de dominio y owner de normalización
        ↓
8. solicitar y validar evidencia específica
        ↓
9. analizar alcance, falsos positivos, colisiones y compatibilidad
        ↓
10. emitir decisión de dominio
        ↓
11. aprobar, rechazar, preservar, solicitar evidencia o escalar
        ↓
12. producir decisión versionable sin modificar datos existentes
        ↓
13. vincular la decisión con catálogo, política o tarea propietaria
        ↓
14. cerrar el expediente conservando historia y próximos controles
```

#### 19. Resultados cerrados de decisión

| Resultado lógico                      | Efecto permitido                                                                                                 |
| ------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| `APPROVE_DICTIONARY_ENTRY`            | autoriza preparar una entrada o versión del diccionario con origen, destino, scope, evidencia y corpus aprobados |
| `APPROVE_OFFICIAL_EXCEPTION`          | autoriza preparar una excepción oficial o alias explícito dentro de su familia y alcance                         |
| `APPROVE_PRESERVE_AS_VALID`           | declara que la forma debe conservarse dentro del scope y evita correcciones más amplias incompatibles            |
| `APPROVE_FIELD_POLICY_CLASSIFICATION` | autoriza clasificar el campo o componente con clase, representación, fuente y operaciones delimitadas            |
| `REJECT_CANDIDATE`                    | rechaza la propuesta y conserva motivo, evidencia y condiciones que permitirían una revisión futura              |
| `REQUEST_MORE_EVIDENCE`               | mantiene el caso abierto con evidencia concreta requerida, propietario y fecha de revisión                       |
| `ESCALATE_TO_STRUCTURAL_RESOLUTION`   | remite mezcla de componentes o problema de modelo a la tarea de arquitectura o transición correspondiente        |
| `ESCALATE_TO_IDENTITY_REVIEW`         | remite colisión, unicidad, homónimo, alias empresarial o posible fusión a `DATA-NORM-ARC-010` y su transición    |
| `DEFER_WITH_OWNER_AND_REVIEW_AT`      | conserva el caso abierto, riesgo, owner, evidencia faltante y fecha obligatoria; no crea regla ejecutable        |

Ningún resultado produce por sí mismo una corrección de filas, un backfill, una propagación, un constraint, una fusión o una activación en runtime.

#### 20. Contrato mínimo de la decisión

Toda decisión deberá declarar:

- identificador y revisión del caso;
- resultado cerrado;
- valor original y candidato evaluado mediante referencias protegidas;
- coordenada y scope exactos;
- clases, representaciones y fuentes permitidas o excluidas;
- evidencia utilizada y fuentes descartadas;
- análisis de falsos positivos y colisiones;
- consumidores y capas afectadas;
- decisión de dominio y aprobación de normalización;
- versión propuesta de catálogo o política, cuando aplique;
- no retroactividad o tratamiento temporal esperado;
- tarea responsable de materialización;
- condiciones de activación, prueba y rollback posteriores;
- motivo, actores y timestamps;
- relación con decisiones supersedidas o casos vinculados.

Una decisión sin scope, evidencia, responsables o destino no podrá marcarse `RESOLVED_APPROVED`.

#### 21. Efecto sobre catálogos y políticas

1. Una aprobación genera un paquete lógico de decisión, no una edición silenciosa de una entrada activa.
2. El diccionario, catálogo de excepciones o clasificación deberá incorporar la decisión mediante una versión nueva o una entrada que declare supersesión.
3. Una decisión específica no se convertirá en regla transversal por analogía.
4. Una preservación aprobada tendrá precedencia solo dentro de su coordenada y vigencia.
5. Un rechazo no elimina el caso ni la forma observada; impide reutilizar la misma propuesta sin evidencia nueva.
6. Las entradas activas seguirán sujetas a los ciclos definidos por `DATA-NORM-ARC-005` y `DATA-NORM-ARC-006`.
7. La estructura física de versiones, vigencias, traza y decisiones pertenece a `DATA-NORM-ARC-009`.
8. La capa que consume y ejecuta la decisión pertenece a `DATA-NORM-ARC-011`.

#### 22. Reutilización, agrupación y alcance

1. Un caso podrá agrupar múltiples ocurrencias únicamente bajo la misma `review_case_key`.
2. Las ocurrencias conservarán sistema, registro, consumidor, timestamp y resultado de detección propios.
3. Casos con texto igual pero dominio, campo, clase, fuente, locale, versión o acción diferentes se vincularán como relacionados y no se deduplicarán.
4. Una decisión de campo no se reutilizará automáticamente en entidad, dominio o política transversal.
5. Un lote podrá presentar una decisión común solo si demuestra homogeneidad de coordenada, evidencia, riesgo y resultado para cada miembro.
6. El muestreo no autoriza corregir elementos no examinados cuando pueda existir una excepción o falso positivo.
7. Una agregación para métricas no podrá ocultar casos críticos, vencidos o sin propietario.
8. La frecuencia de ocurrencias puede priorizar, pero no demostrar la forma canónica.

#### 23. Conflictos, desacuerdos y escalamiento

Se produce escalamiento obligatorio cuando:

- dominio y normalización no coinciden en significado o alcance;
- dos fuentes autorizadas vigentes son incompatibles;
- la decisión afectaría identidad, unicidad, relaciones o selección de registro;
- existe riesgo legal, contractual, financiero, de seguridad o evidencia;
- una forma pertenece a varios idiomas o productos sin política compatible;
- el candidato requiere descomponer una estructura mezclada;
- una decisión transversal afectaría dominios no representados en la revisión;
- dos capas ejecutan versiones incompatibles;
- no existe propietario empresarial identificable;
- el SLA de un caso `P0_CRITICAL` o `P1_HIGH` se incumple.

El escalamiento deberá conservar responsable receptor, tarea destino, evidencia, riesgo, fecha y condición de retorno. `ESCALATED_STRUCTURAL` no equivale a resolución favorable ni permite mutación.

#### 24. Reapertura, supersesión y corrección de decisiones

1. Una decisión cerrada es inmutable.
2. Evidencia nueva, cambio de autoridad, versión, scope o consumidor crea una revisión vinculada.
3. La nueva revisión declara qué decisión evalúa y por qué podría supersederla.
4. Una decisión supersedida conserva vigencia histórica y no desaparece.
5. La reapertura no reactiva automáticamente una propuesta rechazada ni una regla retirada.
6. Corregir un error administrativo del expediente requiere una entrada aditiva que conserve antes, después, actor y motivo.
7. Una resolución nueva no modifica snapshots, evidencia o datos históricos sin una transición aprobada.
8. El rollback de una regla materializada no borra la decisión; crea un resultado técnico vinculado y, cuando corresponda, un nuevo caso.

#### 25. Concurrencia, reintentos e idempotencia

1. Registrar dos veces la misma ocurrencia y clave deberá producir un solo caso y sumar evidencia sin duplicar decisiones.
2. Dos revisores no podrán cerrar simultáneamente el mismo estado esperado con resultados distintos.
3. Toda transición deberá validar versión o estado esperado del caso.
4. Un reintento después de respuesta perdida devolverá el resultado previo sin crear otra resolución.
5. Una clave reutilizada con coordenada o payload incompatible producirá conflicto y no deduplicación.
6. La asignación concurrente tendrá un único responsable efectivo por función y conservará intentos rechazados.
7. Una decisión pendiente en un cliente offline deberá revalidar estado, evidencia, autoridad y versión antes de sincronizar.
8. La misma decisión, evidencia y versión deberán producir el mismo resultado lógico en todas las capas.

#### 26. Seguridad, privacidad y minimización

1. La cola almacenará o expondrá únicamente los campos necesarios para decidir.
2. Valores personales, legales, externos, secretos, firmas y evidencia tendrán referencias protegidas cuando el contenido completo no sea necesario.
3. Tokens, API keys, hashes, firmas o secretos no se incluirán completos en notas, eventos, métricas o logs.
4. El acceso deberá limitarse por dominio, finalidad, sensibilidad, territorio y función del proceso.
5. Consultar, exportar, adjuntar, reasignar, aprobar o corregir un caso sensible requerirá acciones diferenciadas.
6. Una exportación de casos no convertirá originales protegidos en datos de libre circulación.
7. Notas humanas no podrán introducir datos de terceros innecesarios ni convertirse en fuente canónica por sí mismas.
8. La retención, auditoría física y autorización concreta se definirán en `DATA-NORM-ARC-009`, `DATA-NORM-ARC-011` y las tareas de gobierno de información aplicables.

#### 27. Preservación de originales, copias e historia

1. `EXTERNAL_ORIGINAL`, `HISTORICAL_SNAPSHOT`, `IMMUTABLE_SNAPSHOT` y `AUDIT_EVIDENCE` no se modifican durante revisión.
2. El caso conserva referencias a la fuente y no crea una copia con autoridad competidora.
3. Una forma propuesta puede mostrarse como comparación, nunca como valor ya aplicado.
4. Una `SYNCHRONIZED_COPY` no recibe cambios hasta que la fuente propietaria materialice una decisión aprobada mediante el contrato correspondiente.
5. Una proyección para análisis o visualización no retroalimenta la fuente.
6. La revisión de un valor histórico no reinterpreta documentos, pedidos, etiquetas, eventos o auditorías anteriores.
7. Una forma externa puede mapearse internamente sin perder payload, procedencia ni versión.
8. La propagación y compatibilidad pertenecen a `DATA-NORM-ARC-009`, `DATA-NORM-ARC-011`, `DATA-NORM-ARC-012` y las transiciones aplicables.

#### 28. Backlog inicial contextualizado

Los siguientes grupos ingresarán como candidatos, no como decisiones aprobadas ni como reglas activas:

| Grupo | Casos iniciales                                                                                    | Detonante principal                                    | Destino posible                                                                  |
| ----: | -------------------------------------------------------------------------------------------------- | ------------------------------------------------------ | -------------------------------------------------------------------------------- |
|     1 | `expresso`                                                                                         | `DICTIONARY_AMBIGUOUS_REVIEW`                          | diccionario, preservación o rechazo según contexto                               |
|     2 | `Oster` / `oster`; `Wellmix` / `Welmix`                                                            | excepción candidata o conflicto de forma oficial       | excepción oficial, alias explícito, preservación o rechazo                       |
|     3 | `Volnic` / `VOLNIC PALLOMARO`; `Daza` / `acero daza`                                               | mezcla de marca, fabricante, material o descriptor     | revisión estructural y, si aplica, identidad                                     |
|     4 | `MODELO DUC 72 R`; `TORNADO MODELO (TH33M.110.)`                                                   | contaminación entre marca, modelo y referencia         | descomposición estructural e identidad                                           |
|     5 | `Hatsu`, `Vento`, `Molka`, `Saudo`, `Nutella`, `Klim`, `Kraft`, `Kinder Bueno`                     | formas observadas sin fuente suficiente                | verificación de owner o fabricante y scope                                       |
|     6 | `BBQ`, `HIT`, `AA`, `CMS`, `PAM`, `REF`, `T26`, `WIP`, `AVSA`, `FC`, `SVV`                         | siglas, palabras o referencias contextuales            | catálogo contextual, preservación o rechazo                                      |
|     7 | `Botellla`, `Costo`, `1`, `presentacion`, `piezas`, `bolsas`, `Six Pack`, `six_pack`, `Bolsa 1 kg` | unidad, etiqueta o estructura no resuelta              | corrección, catálogo técnico o resolución estructural                            |
|     8 | nombres legales sin evidencia vinculada y decisiones distintas entre capas                         | autoridad insuficiente o divergencia de implementación | evidencia legal, preservación, política de campo o corrección de capas posterior |

Cada valor deberá abrirse bajo su coordenada real. La tabla no autoriza agrupar todos los registros que compartan una cadena ni presupone el resultado de la revisión.

#### 29. Relación con búsqueda, identidad y ejecución

1. La cola puede mostrar similitudes o candidatos, pero la representación de búsqueda será definida por `DATA-NORM-ARC-008`.
2. Una similitud de búsqueda no constituye evidencia ni deduplica casos con coordenadas diferentes.
3. Cualquier resultado que afecte unicidad, colisiones o posible fusión se remite a `DATA-NORM-ARC-010`.
4. La decisión no selecciona registro sobreviviente, no reasigna relaciones y no cambia constraints.
5. La persistencia de casos, decisiones, versiones, vigencias y trazas se define en `DATA-NORM-ARC-009`.
6. Aplicación, servicio de dominio, RPC, procesos programados y trigger defensivo se definen en `DATA-NORM-ARC-011`.
7. Valores y evidencias externas se rigen además por `DATA-NORM-ARC-012`.
8. Corrección de datos existentes, dry-run, lotes, activación y rollback pertenecen a `DATA-NORM-TRANS-001` a `DATA-NORM-TRANS-009`.

#### 30. Conductas no conformes

Quedan prohibidas:

1. aplicar el valor propuesto mientras el caso está abierto;
2. aprobar por mayoría de registros, frecuencia, urgencia o popularidad;
3. cerrar por vencimiento o ausencia de respuesta;
4. usar una sugerencia automática como decisión humana;
5. omitir la coordenada y aprobar una forma global por defecto;
6. deduplicar casos porque sus textos se parecen o convergen después de normalizarse;
7. permitir que el productor sea el único aprobador;
8. aprobar sin evidencia mínima o con fuente no autorizada;
9. modificar una resolución cerrada;
10. ampliar un scope durante implementación;
11. convertir revisión textual en fusión, desactivación, reasignación o constraint;
12. sobrescribir originales, snapshots o evidencia;
13. ocultar casos vencidos mediante cambio de prioridad o espera indefinida de evidencia;
14. mantener colas, decisiones o catálogos locales por aplicación;
15. exponer secretos o datos sensibles completos en notas y logs;
16. aplicar decisiones de Vento OS a VITAL;
17. ejecutar backfills o propagación desde la cola;
18. dejar un escalamiento, diferimiento o evidencia faltante sin owner y fecha.

#### 31. Corpus mínimo de conformidad

| Escenario                                                | Resultado esperado                                                |
| -------------------------------------------------------- | ----------------------------------------------------------------- |
| `expresso` sin contexto suficiente                       | un caso abierto; valor preservado; ninguna sustitución automática |
| mismo `expresso`, misma coordenada y versiones, repetido | una ocurrencia adicional sobre el mismo caso                      |
| `expresso` en otro campo o fuente                        | caso distinto y relacionado                                       |
| `Wellmix` y `Welmix` con fuentes incompatibles           | conflicto abierto; no elegir por frecuencia                       |
| `Oster` con evidencia válida del fabricante              | candidato listo para decisión; no activación directa              |
| `BBQ` sin significado ni scope                           | evidencia requerida o rechazo                                     |
| `KG` en componente unitario y `KG` dentro de modelo      | casos y rutas distintas por clase y contexto                      |
| razón social con documento vigente                       | preservación o forma oficial acotada; historia intacta            |
| `Bolsa 1 kg` sin estructura separada                     | escalamiento estructural; no corrección plana                     |
| dos capas con la misma versión y resultados distintos    | caso `P1_HIGH` o `P0_CRITICAL`, según impacto; mutación bloqueada |
| productor intenta aprobar su propio candidato            | aprobación denegada por segregación                               |
| dos decisiones concurrentes sobre el mismo estado        | un solo cierre; la segunda operación recibe conflicto de versión  |
| reintento después de respuesta perdida                   | mismo resultado y decisión, sin duplicado                         |
| caso vencido                                             | permanece abierto con condición de SLA incumplido y escalamiento  |
| evidencia nueva después de un rechazo                    | nueva revisión vinculada; rechazo original inmutable              |
| decisión aprobada para un campo aplicada a otro dominio  | prohibida; requiere caso y decisión propios                       |
| original externo, snapshot o evidencia                   | preservado exactamente                                            |
| candidato que podría fusionar registros                  | escalamiento a `DATA-NORM-ARC-010`; ninguna acción estructural    |
| caso perteneciente a VITAL                               | fuera del alcance transversal de Vento OS                         |

El corpus deberá cubrir además prioridades, SLA, estados, transiciones no permitidas, duplicados, scopes, evidencia faltante, autorizaciones, privacidad, reapertura, supersesión, lotes, múltiples idiomas, fuentes y versiones.

#### 32. Hallazgos y carryovers

| ID               | Decisión o brecha                                                  | Resultado de esta tarea                                              | Propietario siguiente                                                     |
| ---------------- | ------------------------------------------------------------------ | -------------------------------------------------------------------- | ------------------------------------------------------------------------- |
| `DN-ARC-007-H01` | no existía contrato único de admisión y deduplicación              | detonantes, puerta y clave lógica aprobados                          | `DATA-NORM-ARC-009`; `DATA-NORM-ARC-011`                                  |
| `DN-ARC-007-H02` | candidatos de marcas, siglas, unidades y nombres legales dispersos | backlog inicial contextualizado sin activar formas                   | `DATA-NORM-ARC-009`; `DATA-NORM-TRANS-001`                                |
| `DN-ARC-007-H03` | `expresso` carecía de workflow, responsables y SLA                 | preservación, flujo, segregación y SLA aprobados                     | `DATA-NORM-ARC-009`; `DATA-NORM-ARC-011`                                  |
| `DN-ARC-007-H04` | una decisión humana podía confundirse con corrección de datos      | separación entre decisión, versión de catálogo y transición aprobada | `DATA-NORM-ARC-009`; `DATA-NORM-TRANS-004`; `DATA-NORM-TRANS-005`         |
| `DN-ARC-007-H05` | divergencias entre capas no tenían ruta canónica                   | detonante y escalamiento definidos                                   | `DATA-NORM-ARC-011`; `SUPA-TRANS-009`                                     |
| `DN-ARC-007-H06` | similitud textual podía confundirse con identidad                  | escalamiento obligatorio y prohibición de fusión aprobados           | `DATA-NORM-ARC-010`; `DATA-NORM-TRANS-003`                                |
| `DN-ARC-007-H07` | originales y evidencia podían exponerse en revisión                | minimización y preservación aprobadas                                | `DATA-NORM-ARC-009`; `DATA-NORM-ARC-012`                                  |
| `DN-ARC-007-H08` | no existe todavía cola, interfaz ni automatización física          | contrato lógico completo aprobado; implementación reservada          | `DATA-NORM-ARC-009`; `DATA-NORM-ARC-011`; tareas de transición aplicables |

#### 33. Decisiones reservadas

| Decisión                                                         | Tarea propietaria                             |
| ---------------------------------------------------------------- | --------------------------------------------- |
| representación de búsqueda, transliteración y comparación        | `DATA-NORM-ARC-008`                           |
| persistencia de casos, decisiones, auditoría, versiones y SLA    | `DATA-NORM-ARC-009`                           |
| identidad, unicidad, colisiones y duplicados normalizados        | `DATA-NORM-ARC-010`                           |
| aplicación, servicio de dominio, RPC, jobs y trigger defensivo   | `DATA-NORM-ARC-011`                           |
| originales, mapeos y evidencia de integraciones externas         | `DATA-NORM-ARC-012`                           |
| estructura física de la cola y políticas de acceso               | `DATA-NORM-ARC-009`; `DATA-NORM-ARC-011`      |
| baseline y dry-run del backlog existente                         | `DATA-NORM-TRANS-001`; `DATA-NORM-TRANS-002`  |
| análisis de colisiones e identidad                               | `DATA-NORM-TRANS-003`; `DATA-NORM-ARC-010`    |
| backfill, lotes, propagación, activación, observación y rollback | `DATA-NORM-TRANS-004` a `DATA-NORM-TRANS-009` |

#### 34. Criterios de integridad

La política se considera íntegra para esta etapa cuando:

1. define exactamente diez familias de detonante;
2. preserva el valor ante ambigüedad, conflicto, evidencia insuficiente y SLA vencido;
3. distingue revisión textual, incidente técnico, estructura e identidad;
4. define una identidad de caso independiente de la forma visible;
5. deduplica solo coordenadas y payloads lógicamente idénticos;
6. exige un contrato mínimo completo antes de aprobar;
7. define once estados y transiciones cerradas;
8. prohíbe cierre por silencio o vencimiento;
9. define cuatro prioridades con SLA verificables;
10. asigna siete funciones y aplica segregación;
11. exige evidencia específica por clase de candidato;
12. define nueve resultados cerrados con efectos delimitados;
13. separa decisión, versión de catálogo y corrección de datos;
14. conserva decisiones cerradas y usa revisiones vinculadas;
15. gobierna concurrencia, reintentos e idempotencia;
16. protege originales, snapshots, evidencia y datos sensibles;
17. contextualiza los candidatos heredados sin prejuzgar su resultado;
18. remite búsqueda, identidad, persistencia, ejecución, externos y transición a sus tareas propietarias;
19. mantiene VITAL fuera del alcance transversal;
20. no autoriza cambios físicos, backfills, activación, unicidad ni fusión.

#### 35. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

Se crean los requisitos:

- `TREQ-DATA-105`;
- `TREQ-DATA-106`;
- `TREQ-DATA-107`;
- `TREQ-DATA-108`;
- `TREQ-DATA-109`;
- `TREQ-DATA-110`;
- `TREQ-DATA-111`;
- `TREQ-DATA-112`;
- `TREQ-DATA-113`;
- `TREQ-DATA-114`;
- `TREQ-DATA-115`;
- `TREQ-DATA-116`;
- `TREQ-DATA-117`;
- `TREQ-DATA-118`;
- `TREQ-DATA-119`;
- `TREQ-DATA-120`;
- `TREQ-DATA-121`;
- `TREQ-DATA-122`.

El detalle canónico de cada requisito reside en el registro 04A actualizado hasta esta tarea.

#### 36. Continuidad

```text
ÚLTIMA TAREA APROBADA
DATA-NORM-ARC-006 — Definir diccionario ortográfico canónico y su gobierno
        ↓
TAREA ACTUAL APROBADA
DATA-NORM-ARC-007 — Definir cola de revisión para correcciones ambiguas
        ↓
SIGUIENTE TAREA RESERVADA
DATA-NORM-ARC-008 — Definir representación de búsqueda y comparación
```


### [ ] DATA-NORM-ARC-008 — Definir representación de búsqueda y comparación
### [ ] DATA-NORM-ARC-009 — Definir auditoría, versionado e idempotencia de reglas
### [ ] DATA-NORM-ARC-010 — Definir estrategia de unicidad y detección de duplicados normalizados
### [ ] DATA-NORM-ARC-011 — Definir capas de ejecución: aplicación, servicio de dominio, RPC y trigger defensivo
### [ ] DATA-NORM-ARC-012 — Definir tratamiento de datos recibidos desde integraciones externas

Regla canónica de normalización

No se aplicará `Title Case` universalmente.

Las reglas mínimas serán:

NOMBRE DE PRODUCTO
→ normalización comercial aprobada

NOMBRE DE CATEGORÍA
→ normalización comercial aprobada

NOMBRE DE RECETA
→ normalización comercial aprobada

NOMBRE DE PRESENTACIÓN
→ normalización específica que preserve cantidades y unidades

RAZÓN SOCIAL DE PROVEEDOR
→ conservar escritura legal u oficial

MARCA
→ conservar escritura oficial

DESCRIPCIÓN LIBRE
→ corregir únicamente según reglas propias de texto libre

SKU, CÓDIGO, CÓDIGO DE BARRAS, URL, EMAIL, API KEY
→ no aplicar capitalización comercial

Ejemplo esperado:

```text
"  harina   DE maiz "
        ↓
espacios normalizados
        ↓
capitalización empresarial
        ↓
diccionario aprobado
        ↓
"Harina de Maíz"
```

Conectores preliminares que permanecerán en minúscula cuando no sean
la primera palabra:

```text
a
al
con
de
del
e
el
en
la
las
lo
los
o
para
por
sin
u
y
```

El listado definitivo deberá aprobarse en DATA-NORM-ARC-004.

Ejemplos:

```text
americano
→ Americano

pan masa madre clasico
→ Pan Masa Madre Clásico

harina de maiz
→ Harina de Maíz

jugo de naranja y mango
→ Jugo de Naranja y Mango
```

Las siguientes clases deberán conservar reglas específicas:

```text
"3M"
→ conservar escritura oficial

"iPhone"
→ conservar escritura oficial

"Coca-Cola"
→ conservar escritura oficial

"COMERCIALIZADORA ABC S.A.S."
→ conservar razón social aprobada

"500 g"
→ conservar cantidad y unidad normalizadas

"expresso"
→ no corregir silenciosamente hasta determinar si corresponde a:
  - error ortográfico;
  - denominación comercial;
  - nombre histórico;
  - marca o producto externo.
```

Niveles de decisión:

```text
NORMALIZACIÓN DETERMINISTA
→ automática

CORRECCIÓN MEDIANTE DICCIONARIO APROBADO
→ automática, versionada y auditable

CORRECCIÓN AMBIGUA
→ sugerencia o revisión humana
```

Toda regla de normalización deberá ser idempotente:

```text
normalize(normalize(value))
=
normalize(value)
```

### [ ] SUPA-ARC-025 — Consolidar y aprobar ADR de arquitectura canónica de datos
