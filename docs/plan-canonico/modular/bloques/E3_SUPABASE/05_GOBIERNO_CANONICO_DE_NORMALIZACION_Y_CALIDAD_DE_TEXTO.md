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


### ✅ DATA-NORM-ARC-008 — Definir representación de búsqueda y comparación

**Estado:** APROBADA
**Tarea anterior:** `DATA-NORM-ARC-007 — Definir cola de revisión para correcciones ambiguas` — APROBADA
**Tarea siguiente:** `DATA-NORM-ARC-009 — Definir auditoría, versionado e idempotencia de reglas`
**Tipo de tarea:** definición normativa de representaciones derivadas, perfiles, modos, precedencia, ranking y fronteras de búsqueda y comparación textual; sin DDL, DML, migraciones, backfills, correcciones de datos, cambios de índices, constraints, funciones, triggers, clientes, integraciones, configuración ni despliegues

#### 1. Objetivo

Definir el contrato canónico mediante el cual Vento OS podrá buscar y comparar valores textuales con tolerancia controlada, sin modificar el valor mostrado, sin convertir una representación derivada en identidad, sin degradar formas oficiales y sin confundir recuperación de candidatos con equivalencia empresarial.

La política deberá producir representaciones separadas, versionadas y reproducibles para cada propósito; aplicar el mismo algoritmo a los valores indexados y a la consulta; conservar la forma original que se presenta a la persona; ordenar los resultados mediante niveles explícitos de coincidencia; y bloquear cualquier uso de una clave de búsqueda como autorización de unicidad, fusión, corrección, desactivación o reasignación de relaciones.

#### 2. Artefacto producido

```text
VENTO_TEXT_SEARCH_AND_COMPARISON_POLICY@1.0.0
```

| Propiedad                            | Valor |
| ------------------------------------ | ----: |
| Representaciones derivadas aprobadas |     7 |
| Perfiles de búsqueda cerrados        |     6 |
| Modos de coincidencia cerrados       |     9 |
| Niveles de ranking determinista      |     9 |
| Clases semánticas gobernadas         |    14 |
| Requisitos de prueba nuevos          |    20 |
| Cambios físicos autorizados          |     0 |

#### 3. Fuentes canónicas consumidas

| Fuente                                | Decisión consumida                                                                                                                                |
| ------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| `01_PROTOCOLO.md`                     | continuidad, una sola tarea, fase exclusivamente documental, trazabilidad de brechas y requisitos de prueba                                       |
| `delivery-contract.json`              | identidad del artefacto y actualización integral del registro 04A al crear requisitos                                                             |
| `active-sequence.json`                | `DATA-NORM-ARC-008` como tarea actual y `DATA-NORM-ARC-009` como siguiente tarea reservada                                                        |
| `DATA-NORM-AUD-001`                   | separación entre valor mostrado, búsqueda, externo y técnico; 18 columnas candidatas y mecanismos locales de comparación                          |
| `DATA-NORM-AUD-002`                   | variantes de caja, espacios, tildes, signos y riesgo de sustituir el valor mostrado por una forma tolerante                                       |
| `DATA-NORM-AUD-003`                   | protección de marcas, siglas, unidades, nombres legales, personas, externos, identificadores, direcciones y texto libre                           |
| `DATA-NORM-AUD-004`                   | artefactos analíticos `FORM_KEY`, `SEARCH_KEY`, `SCOPE_KEY` y `STRUCTURAL_KEY`; colisiones, homónimos y falsos positivos                          |
| `DATA-NORM-AUD-005`                   | separación entre forma determinista, diccionario, revisión humana, preservación y resolución estructural                                          |
| `DATA-NORM-AUD-006`                   | helpers divergentes, productores distribuidos, copias, snapshots, proyecciones y necesidad de paridad entre capas                                 |
| `DATA-NORM-AUD-007`                   | 4.030 filas comparadas, 100 objetos con señales, 13 índices locales, colisiones por representación y ausencia de estrategia empresarial unificada |
| `DATA-NORM-ARC-001`                   | política por coordenada, representaciones separadas, búsqueda sin identidad y comportamiento cerrado                                              |
| `DATA-NORM-ARC-002`                   | clase, representación, fuente, operación `SEARCH_KEY_DERIVATION`, modos restrictivos y exclusiones                                                |
| `DATA-NORM-ARC-003` a `006`           | separación entre capitalización, conectores, excepciones oficiales, diccionario y búsqueda                                                        |
| `DATA-NORM-ARC-007`                   | la similitud no constituye evidencia ni deduplicación; todo candidato ambiguo requiere expediente, autoridad y decisión separada                  |
| Regla canónica del bloque propietario | una representación tolerante puede coexistir con la forma mostrada, pero no puede sustituirla ni decidir identidad, unicidad o fusión             |

#### 4. Alcance y fronteras

Esta tarea define:

1. la relación obligatoria entre valor fuente y representaciones derivadas de búsqueda;
2. las siete representaciones permitidas y el propósito de cada una;
3. los seis perfiles cerrados que resuelven qué representación y modo puede utilizarse;
4. el tratamiento exacto de Unicode, caja, espacios, tildes, `ñ`, signos, conectores, tokens, aliases, transliteración y similitud;
5. los nueve modos de coincidencia y su precedencia de ranking;
6. el pipeline lógico de derivación de valores y consultas;
7. la conducta por clase semántica, representación y rol de fuente;
8. los filtros de scope, autorización, estado y contexto que deben ejecutarse antes de interpretar resultados;
9. el contrato mínimo de respuesta, explicación de coincidencia, orden estable y paginación;
10. la separación entre búsqueda, corrección, revisión humana, identidad, unicidad y fusión;
11. la paridad obligatoria entre aplicación, servicio, RPC, procesos programados y mecanismos defensivos;
12. el corpus mínimo de conformidad.

Esta tarea no define:

- tablas, columnas, índices, tipos de índice, extensiones, funciones, RPC, triggers o RLS;
- el almacenamiento físico de cada representación;
- umbrales globales de similitud, tamaños mínimos de consulta o límites de resultados;
- el plan de ejecución, latencia, concurrencia o capacidad bajo carga;
- constraints o scopes de unicidad;
- identidad de entidades, duplicados, registros sobrevivientes o fusiones;
- auditoría física, retención, versionado material o estructura de trazas;
- la capa ejecutora definitiva;
- reglas de integración para valores externos;
- aliases nuevos, correcciones ortográficas nuevas ni decisiones de revisión;
- backfills, cambios de datos, compatibilidad, despliegue o rollback.

Estas decisiones permanecen en `DATA-NORM-ARC-009` a `DATA-NORM-ARC-012`, `SUPA-TRANS-003`, `SUPA-TRANS-005` a `SUPA-TRANS-014` y `DATA-NORM-TRANS-001` a `DATA-NORM-TRANS-009`, según su propiedad.

#### 5. Principios obligatorios

1. **La búsqueda deriva; no reescribe.** Ninguna representación de búsqueda modifica el valor fuente.
2. **La comparación recupera candidatos; no decide identidad.** Una coincidencia, incluso exacta, no autoriza fusionar registros.
3. **No existe una clave universal.** Cada campo resuelve perfil, scope, locale, algoritmo y versión mediante su política.
4. **El valor mostrado prevalece en la respuesta.** Las claves derivadas no se presentan como sustituto del contenido empresarial.
5. **Consulta y valor usan la misma versión.** No se comparan representaciones producidas por algoritmos incompatibles mediante fallback silencioso.
6. **La tolerancia es progresiva.** Los niveles más amplios se evalúan después de los más precisos y nunca degradan su precedencia.
7. **La tolerancia no se acumula implícitamente.** Cada modo declara exactamente qué diferencias ignora y cuáles conserva.
8. **Los aliases son explícitos.** No se generan sinónimos, abreviaturas, traducciones ni variantes por observación o frecuencia.
9. **La similitud es candidata, no igualdad.** Cualquier coincidencia difusa permanece en el nivel de menor confianza y no produce acciones automáticas.
10. **Los scopes se filtran antes de interpretar.** Sede, dominio, entidad, padre, contexto, estado y permisos no se sustituyen por texto.
11. **La representación técnica conserva su contrato.** SKU, slug, email, teléfono, códigos, URLs, referencias y secretos no heredan búsqueda comercial.
12. **Las fuentes y snapshots conservan su tiempo.** Una clave derivada de un snapshot corresponde a su valor y versión histórica, no a la fuente vigente.
13. **Toda salida es explicable.** Cada resultado declara modo, nivel, versión, scope y campo que produjo la coincidencia.
14. **VITAL permanece separado.** Ninguna política transversal de Vento OS se aplica por coexistencia física.

#### 6. Modelo lógico de representación

Toda representación de búsqueda deberá conservar un vínculo lógico completo:

```text
source_entity_id
+ source_field_coordinate
+ source_value_version_or_hash
+ semantic_class
+ representation_role = SEARCH_DERIVATION
+ source_role
+ search_profile
+ language_profile
+ derivation_kind
+ algorithm_version
+ scope_coordinate
```

Reglas:

1. una clave derivada nunca existe sin referencia al valor que la originó;
2. un cambio de valor, política, locale o algoritmo invalida la vigencia de la derivación anterior para decisiones nuevas;
3. una representación anterior puede conservarse para reconstruir búsquedas o resultados históricos, pero no participa como versión activa sin transición explícita;
4. una copia sincronizada no define una política local distinta;
5. una proyección de salida no se convierte en fuente buscable por comodidad;
6. un original externo puede conservar una derivación interna separada, pero su tratamiento físico pertenece a `DATA-NORM-ARC-012`;
7. la estructura de persistencia y la retención pertenecen a `DATA-NORM-ARC-009` y `DATA-NORM-ARC-011`.

#### 7. Representaciones derivadas aprobadas

| Representación                    | Propósito                                                                                          | Transformaciones permitidas                                                                                         | Uso prohibido                                                                 |
| --------------------------------- | -------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------- |
| `SEARCH_FORM_KEY`                 | comparación de forma estable sin distinguir caja ni espacios accidentales permitidos               | NFC, casefold Unicode del perfil, recorte de bordes y compactación de espacios autorizada por el campo              | eliminar tildes, signos significativos, unir palabras o actuar como identidad |
| `SEARCH_ACCENT_KEY`               | recuperación tolerante a tildes españolas en campos elegibles                                      | partir de `SEARCH_FORM_KEY` y plegar únicamente diacríticos autorizados por el perfil `es-CO`                       | retirar `ñ`, transliterar otros alfabetos o sustituir el valor mostrado       |
| `SEARCH_TOKEN_STREAM`             | comparación por frases, tokens completos, cobertura y prefijo controlado                           | tokenización Unicode versionada, fronteras conservadas y posición de tokens                                         | stemming, lematización, stopwords implícitas o coincidencia por subcadena     |
| `SEARCH_APPROVED_ALIAS_SET`       | recuperar una entidad mediante aliases, abreviaturas o formas equivalentes aprobadas               | consumir únicamente aliases activos, explícitos, acotados y versionados                                             | aprender aliases por uso, frecuencia, logs o similitud                        |
| `SEARCH_TRANSLITERATION_KEY`      | fallback opcional entre escrituras o alfabetos bajo un perfil expresamente aprobado                | mapeo declarado, direccional, versionado y limitado a campos que lo habiliten                                       | transliteración global, irreversible o utilizada como igualdad                |
| `SEARCH_STRUCTURED_COMPONENT_SET` | buscar presentaciones, cantidades, unidades, ubicaciones u otras estructuras por componentes       | derivar componentes ya interpretados y conservar cantidad, unidad, multiplicador, contexto, jerarquía y códigos     | aplanar la estructura en una cadena de identidad                              |
| `SEARCH_FREE_TEXT_TERMS`          | descubrimiento de descripciones o contenido libre mediante términos y frases sin modificar autoría | tokenización propia del campo, frases y prefijos aprobados; sin stemming ni sinónimos automáticos en la versión 1.0 | usar texto libre como identidad o corregir su contenido                       |

Las siete representaciones son complementarias. Una política podrá habilitar un subconjunto, pero no inventar una representación local ni combinar varias en una clave opaca que impida explicar el resultado.

#### 8. Perfil base `es-CO` para `SEARCH_FORM_KEY`

La derivación base seguirá este orden lógico:

```text
valor fuente o consulta
        ↓
validar clase, representación, fuente, perfil y scope
        ↓
normalizar composición Unicode a NFC
        ↓
aplicar casefold Unicode del perfil declarado
        ↓
recortar espacios de borde si el campo lo permite
        ↓
compactar secuencias de espacio permitidas si el campo lo permite
        ↓
conservar tildes, ñ, signos, guiones, apóstrofos y fronteras
        ↓
SEARCH_FORM_KEY versionada
```

Reglas:

1. NFC se aplica a la derivación, no al original, cuando el original sea externo, histórico, firmado o probatorio;
2. el casefold no autoriza almacenar el valor fuente en minúsculas;
3. la compactación solo aplica a separadores clasificados como espacios accidentales por la política del campo;
4. saltos de línea, tabulaciones, espacios no separables, Markdown, plantillas y formatos significativos no se compactan por defecto;
5. puntuación y separación permanecen en la clave de forma;
6. no se ejecutan diccionario, capitalización, conectores, aliases, transliteración ni corrección durante esta etapa;
7. un campo que no permita recorte o compactación conserva esos caracteres también en su clave base.

#### 9. Perfil de tildes y preservación de `ñ`

`SEARCH_ACCENT_KEY` podrá habilitarse únicamente para campos y finalidades que admitan recuperación tolerante en español de Colombia.

Reglas de la versión `1.0.0`:

1. se pliegan las tildes agudas de `á`, `é`, `í`, `ó` y `ú` hacia sus vocales base;
2. la diéresis de `ü` podrá plegarse a `u` dentro del perfil `es-CO` cuando el campo habilite búsqueda tolerante;
3. `ñ` y `n` permanecen caracteres distintos;
4. otros diacríticos, alfabetos o transliteraciones no se eliminan por analogía;
5. signos, guiones, apóstrofos y espacios no se eliminan durante esta derivación;
6. la clave se utiliza para recuperación y ranking, no para presentación, corrección ni identidad;
7. una coincidencia `Maiz`/`Maíz` se clasifica como tolerancia de búsqueda, no como autorización de modificar el registro;
8. `ano` y `año` no coinciden por `SEARCH_ACCENT_KEY`;
9. una política futura que cambie este conjunto deberá crear una versión nueva y medir colisiones antes de activarla.

No se utilizará `unaccent` genérico como definición semántica transversal, porque puede eliminar diferencias que el perfil debe preservar.

#### 10. Tokenización, signos y fronteras

`SEARCH_TOKEN_STREAM` deberá operar sobre grafemas Unicode y producir tokens, separadores y posiciones reproducibles.

Clases mínimas:

| Clase                          | Conducta                                                                                       |
| ------------------------------ | ---------------------------------------------------------------------------------------------- |
| `LEXICAL_TOKEN`                | letras y marcas combinantes conservadas como token completo                                    |
| `NUMERIC_TOKEN`                | número, decimal, rango o fracción conservados sin cambiar magnitud                             |
| `TECHNICAL_TOKEN`              | código, modelo, unidad, referencia o combinación protegida por contrato                        |
| `INTERNAL_COMPOUND_TOKEN`      | token con guion, apóstrofo o signo interno que permanece atómico salvo gramática aprobada      |
| `PUNCTUATION_BOUNDARY`         | signo que delimita términos, pero cuya presencia continúa disponible para coincidencia precisa |
| `WHITESPACE_BOUNDARY`          | separador autorizado que delimita tokens                                                       |
| `UNRESOLVED_TOKEN_OR_BOUNDARY` | forma no clasificable que bloquea modos más amplios                                            |

Reglas:

1. un token nunca coincide como subcadena dentro de otra palabra;
2. los conectores permanecen como tokens; no existe eliminación global de stopwords;
3. `al`, `del`, `e`, `o`, `u` y `y` conservan la palabra seleccionada y su posición;
4. `Coca-Cola` y `Coca Cola` no son equivalentes en `SEARCH_FORM_KEY` ni por alias implícito;
5. una búsqueda por tokens puede recuperar ambos como candidatos cuando el perfil lo permita, pero el resultado deberá declarar esa coincidencia de menor precisión;
6. `S.A.S.` y `SAS` permanecen distintos salvo alias oficial explícito;
7. `Choco Bites` y `Chocobites` no se unen ni dividen durante tokenización;
8. cantidades, unidades y multiplicadores se derivan además como componentes estructurados cuando exista una estructura aprobada;
9. una gramática de compuesto deberá declarar delimitadores, alcance, locale, versión y corpus propio.

#### 11. Aliases aprobados

`SEARCH_APPROVED_ALIAS_SET` consume únicamente decisiones activas y compatibles de los catálogos y expedientes canónicos.

Cada alias deberá declarar:

```text
alias_key
canonical_target_reference
alias_form
match_scope
semantic_class
domain_scope
entity_scope
field_scope
language_profile
source_authority
approval_reference
status
valid_from
valid_to
alias_version
```

Reglas:

1. un alias pertenece a una entidad o forma canónica explícita, no a una palabra global por defecto;
2. la coincidencia del alias no modifica la consulta ni el valor mostrado;
3. un alias de marca, nombre legal, sigla, unidad o valor externo requiere la autoridad de su familia;
4. una entrada del diccionario ortográfico no se convierte automáticamente en alias bidireccional;
5. una búsqueda tolerante a tildes no crea un alias persistido;
6. una variante observada en logs no se activa por frecuencia;
7. aliases suspendidos, retirados o rechazados no participan en decisiones nuevas;
8. conflictos de alias preservan ambos valores, bloquean el nivel y pueden crear un caso de `DATA-NORM-ARC-007` cuando exista una propuesta explícita de resolución;
9. los aliases no crean identidad ni autorizan unicidad.

#### 12. Transliteración

`SEARCH_TRANSLITERATION_KEY` permanece deshabilitada por defecto en el perfil estándar `es-CO`.

Solo podrá activarse cuando:

1. el campo y la finalidad la declaren expresamente;
2. exista un par de perfiles de escritura o idioma aprobado;
3. el mapeo sea versionado, direccional y reproducible;
4. se haya medido el conjunto de colisiones que introduce;
5. la salida se use como fallback de menor ranking;
6. el valor original y su escritura permanezcan visibles y vinculados;
7. los identificadores técnicos, nombres legales, marcas, firmas y secretos estén excluidos salvo contrato específico;
8. la consulta y la derivación del valor usen la misma versión.

No se aprueba en esta versión ninguna tabla transversal de transliteración ni una regla que convierta `ñ` en `n`. La activación de un perfil concreto requerirá una versión posterior del artefacto y sus requisitos de prueba correspondientes.

#### 13. Similitud y coincidencia difusa

La similitud no forma parte de la igualdad canónica. El modo `SIMILARITY_CANDIDATE_ONLY` queda definido como capacidad de descubrimiento condicionada y deshabilitada por defecto.

Cuando un campo la habilite en una versión futura deberá declarar:

- algoritmo exacto;
- versión;
- representación de entrada;
- longitud mínima de consulta;
- umbral;
- límite de candidatos;
- scope;
- campos elegibles;
- clases excluidas;
- ranking posterior;
- corpus positivo y negativo;
- medición de precisión, recall, latencia y colisiones.

Reglas obligatorias:

1. una coincidencia difusa nunca se presenta como igualdad;
2. nunca selecciona automáticamente un registro para escribir, relacionar, corregir, fusionar o autorizar;
3. nunca crea una entrada de diccionario, excepción o alias;
4. `expresso` y `espresso`, `Wellmix` y `Welmix`, o `Choco Bites` y `Chocobites` solo podrán aparecer como candidatos de similitud cuando el perfil lo habilite;
5. cada resultado deberá mostrar el motivo y el nivel de baja confianza;
6. un candidato lingüístico que se pretenda convertir en regla se tramita mediante `DATA-NORM-ARC-007`;
7. no se utiliza distancia de edición, fonética o modelo lingüístico como fallback oculto.

#### 14. Perfiles cerrados de búsqueda

| Perfil                           | Clases principales                                              | Representaciones permitidas                                                                            | Restricción principal                                                                 |
| -------------------------------- | --------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------- |
| `STRICT_TECHNICAL_LOOKUP`        | códigos, SKU, unidades, estados, slugs, referencias y contactos | clave contractual propia, coincidencia exacta y, si el contrato lo permite, casefold o prefijo técnico | no usar tildes, aliases comerciales, transliteración o similitud                      |
| `STANDARD_COMMERCIAL_NAME`       | `COMMERCIAL_NAME`                                               | forma, tildes `es-CO`, tokens, frases y aliases aprobados                                              | no corregir el nombre ni convertir el resultado en identidad                          |
| `OFFICIAL_FORM_LOOKUP`           | marcas, nombres legales, siglas y formas oficiales              | exacta, `CASEFOLD_EXACT` cuando la excepción lo autorice y aliases oficiales                           | conservar signos y forma oficial; tolerancias más amplias requieren aprobación        |
| `STRUCTURED_PRESENTATION_LOOKUP` | presentaciones, cantidades, unidades y etiquetas estructuradas  | forma de etiqueta, tokens y componentes estructurados                                                  | cantidad, unidad, multiplicador, contexto y fuente forman filtros separados           |
| `FREE_TEXT_DISCOVERY`            | `FREE_TEXT` y descripciones elegibles                           | términos y frases; prefijo controlado; aliases solo si la política del campo los aprueba               | sin stemming, lematización, stopwords ni reescritura automática en la versión `1.0.0` |
| `RESTRICTED_HUMAN_OR_LOCATION`   | personas, actores, direcciones y ubicaciones                    | forma y componentes autorizados, bajo finalidad, scope, privacidad y permisos                          | no resolver identidad de personas ni corregir originales externos                     |

Un campo `UNCLASSIFIED_PRESERVE`, un secreto, una firma o material criptográfico no recibe ningún perfil de búsqueda derivada hasta decisión expresa.

#### 15. Modos cerrados de coincidencia

| Nivel | Modo                             | Condición                                                                            | Confianza relativa |
| ----: | -------------------------------- | ------------------------------------------------------------------------------------ | ------------------ |
|     1 | `EXACT_VALUE_MATCH`              | consulta y valor fuente coinciden exactamente en Unicode y caracteres                | máxima             |
|     2 | `FORM_EQUIVALENT_MATCH`          | coinciden mediante `SEARCH_FORM_KEY` compatible                                      | muy alta           |
|     3 | `ACCENT_TOLERANT_MATCH`          | coinciden mediante `SEARCH_ACCENT_KEY` compatible                                    | alta               |
|     4 | `APPROVED_ALIAS_MATCH`           | un alias activo y acotado enlaza la consulta con el resultado                        | alta contextual    |
|     5 | `ORDERED_PHRASE_MATCH`           | una secuencia contigua de tokens completos coincide en el mismo orden                | media alta         |
|     6 | `ALL_TOKEN_MATCH`                | todos los tokens requeridos coinciden dentro del campo, aunque no sean contiguos     | media              |
|     7 | `LAST_TOKEN_PREFIX_MATCH`        | únicamente el último token de una consulta incompleta coincide por prefijo permitido | media baja         |
|     8 | `TRANSLITERATION_FALLBACK_MATCH` | coincide una transliteración explícita y compatible                                  | baja               |
|     9 | `SIMILARITY_CANDIDATE_ONLY`      | un algoritmo expresamente habilitado propone un candidato sin declarar igualdad      | mínima             |

No se permite alterar el orden. Un resultado que satisface varios modos se clasifica por el nivel más preciso y conserva los motivos secundarios únicamente como explicación adicional.

#### 16. Precedencia de filtros y comparación

El pipeline deberá aplicar este orden:

```text
1. autorización y finalidad de la búsqueda
        ↓
2. dominio, entidad, campo y scope empresarial
        ↓
3. estado, vigencia y filtros estructurales obligatorios
        ↓
4. perfil, locale y versión compatibles
        ↓
5. derivación de consulta mediante la misma versión activa
        ↓
6. EXACT_VALUE_MATCH
        ↓
7. FORM_EQUIVALENT_MATCH
        ↓
8. ACCENT_TOLERANT_MATCH
        ↓
9. APPROVED_ALIAS_MATCH
        ↓
10. ORDERED_PHRASE_MATCH
        ↓
11. ALL_TOKEN_MATCH
        ↓
12. LAST_TOKEN_PREFIX_MATCH
        ↓
13. TRANSLITERATION_FALLBACK_MATCH
        ↓
14. SIMILARITY_CANDIDATE_ONLY, solo cuando esté habilitado
        ↓
15. orden estable, explicación y paginación
```

Consecuencias:

- un resultado fuera del scope no participa aunque su texto sea exacto;
- un resultado no autorizado no se filtra después de rankear, sino antes de exponerlo;
- un registro inactivo, histórico o sustituido se incluye únicamente cuando la finalidad y el perfil lo solicitan;
- los componentes estructurales no se sustituyen por similitud textual;
- una capa no podrá saltar directamente a similitud porque no encontró coincidencias exactas si el perfil no la habilita.

#### 17. Ranking determinista y empates

El ranking se resolverá mediante una tupla explícita, no mediante orden físico ni preferencia local:

```text
match_level ascendente
+ scope_specificity descendente
+ matched_token_coverage descendente
+ approved_business_priority, solo si el dominio la declara
+ stable_domain_sort_key
+ immutable_entity_id
```

Reglas:

1. `match_level` domina todos los demás factores;
2. la prioridad empresarial no puede elevar una coincidencia difusa sobre una exacta;
3. popularidad, frecuencia, uso reciente o telemetría no participan sin una política propia versionada;
4. dos resultados empatados conservan ambos registros y un orden estable;
5. el primer resultado no se interpreta como identidad ni selección segura para mutaciones;
6. la paginación deberá usar la misma tupla completa para evitar duplicados, pérdidas o cambios de orden entre páginas;
7. un cambio de algoritmo o ranking crea una versión nueva y requiere medición de impacto;
8. el consumidor no podrá reordenar silenciosamente los niveles canónicos y presentar el resultado como equivalente.

#### 18. Contrato mínimo de respuesta

Toda respuesta de búsqueda gobernada deberá poder incluir, según autorización:

```text
entity_id
entity_type
display_value
matched_field
match_mode
match_level
matched_terms_or_components
search_profile
language_profile
algorithm_version
scope_summary
source_value_version_or_hash
is_historical_or_inactive
```

Reglas:

1. `display_value` proviene de la representación mostrada autorizada, no de la clave derivada;
2. una clave de búsqueda completa no se expone por defecto al cliente;
3. la explicación no revelará secretos, datos personales innecesarios, campos no autorizados ni otros valores del registro;
4. los fragmentos resaltados se calculan sobre el valor mostrado sin reescribirlo;
5. un resultado degradado por versión ausente, índice no compatible o fallback deberá indicarlo y no simular paridad;
6. una respuesta vacía deberá distinguir ausencia real de resultados, perfil bloqueado, scope inválido y dependencia no disponible;
7. la estructura física de la respuesta pertenece a `DATA-NORM-ARC-011`, pero deberá conservar estas semánticas.

#### 19. Consulta y minimización

1. La consulta original se utilizará como entrada transitoria y no se persistirá por defecto.
2. Logs, métricas y trazas conservarán únicamente lo necesario para explicar rendimiento, errores o decisiones, con masking y retención por finalidad.
3. Consultas sobre personas, direcciones, contactos o datos sensibles exigirán propósito y permiso aplicables.
4. Secretos, firmas, tokens, hashes y credenciales no serán buscables mediante representaciones derivadas generales.
5. Una consulta vacía, compuesta solo por separadores o incompatible con el perfil no ejecutará una búsqueda amplia.
6. Prefijos y similitud exigirán mínimos de longitud declarados por el perfil físico futuro; el silencio equivale a deshabilitación.
7. Un cliente no podrá extraer masivamente ni reconstruir el corpus completo de claves mediante paginación o errores de comparación.
8. La política de autorización, RLS y protección del lado servidor permanece obligatoria aunque la interfaz oculte resultados.

#### 20. Matriz por clase semántica

| Clase                          | Perfil o conducta de búsqueda                                        | Comparaciones permitidas por defecto                                 | Comparaciones bloqueadas por defecto                                          |
| ------------------------------ | -------------------------------------------------------------------- | -------------------------------------------------------------------- | ----------------------------------------------------------------------------- |
| `COMMERCIAL_NAME`              | `STANDARD_COMMERCIAL_NAME`                                           | exacta, forma, tildes `es-CO`, frase, tokens y aliases aprobados     | transliteración y similitud sin política                                      |
| `STRUCTURED_PRESENTATION_NAME` | `STRUCTURED_PRESENTATION_LOOKUP`                                     | etiqueta y componentes estructurados dentro del producto y contexto  | identidad por etiqueta o eliminación genérica de signos                       |
| `HUMAN_LABEL`                  | política específica del campo                                        | exacta y forma; otras solo por contrato                              | heredar búsqueda comercial por visibilidad                                    |
| `OFFICIAL_LEGAL_NAME`          | `OFFICIAL_FORM_LOOKUP`                                               | exacta, casefold autorizado y aliases legales explícitos             | tildes genéricas, signos eliminados, similitud o reconstrucción               |
| `OFFICIAL_BRAND_FORM`          | `OFFICIAL_FORM_LOOKUP`                                               | exacta, casefold autorizado y aliases de marca explícitos            | tokenización que destruya la forma, transliteración o similitud global        |
| `PERSON_OR_ACTOR_NAME`         | `RESTRICTED_HUMAN_OR_LOCATION`                                       | forma y, cuando esté aprobado, tildes; siempre con finalidad y scope | identidad, fusión, corrección o exposición transversal por nombre             |
| `ADDRESS_OR_LOCATION_TEXT`     | `RESTRICTED_HUMAN_OR_LOCATION` o búsqueda estructurada del proveedor | forma y componentes aprobados                                        | eliminación universal de números, signos, orden o abreviaturas                |
| `FREE_TEXT`                    | `FREE_TEXT_DISCOVERY`                                                | términos, frases y último prefijo autorizado                         | identidad, corrección silenciosa, stemming o sinónimos automáticos en `1.0.0` |
| `CONTROLLED_VOCABULARY_CODE`   | `STRICT_TECHNICAL_LOOKUP`                                            | exacta y equivalencias declaradas por catálogo                       | búsqueda comercial, tildes, transliteración o similitud                       |
| `MEASUREMENT_OR_UNIT_CODE`     | `STRICT_TECHNICAL_LOOKUP` dentro de componente estructurado          | exacta, casefold o alias técnico solo si el catálogo lo declara      | detección por subcadena o equivalencia con etiqueta visible                   |
| `TECHNICAL_IDENTIFIER`         | contrato técnico propietario                                         | exacta y, si procede, casefold o prefijo técnico explícito           | diccionario, aliases comerciales, eliminación de signos o similitud           |
| `CONTACT_IDENTIFIER`           | contrato de email, teléfono o canal                                  | canonicalización y comparación propias del estándar                  | búsqueda comercial o exposición fuera de finalidad                            |
| `SECRET_OR_SIGNATURE_MATERIAL` | sin representación de búsqueda general                               | validación exacta mediante mecanismos de seguridad propios           | toda derivación textual, prefijo, similitud, logging o exposición             |
| `UNCLASSIFIED_PRESERVE`        | bloqueado                                                            | ninguna hasta clasificación                                          | todos los modos                                                               |

La elegibilidad de la tabla no activa una operación. La política de cada campo deberá declarar el perfil y los modos concretos.

#### 21. Presentaciones y componentes estructurados

Una presentación no se compara como prosa plana cuando existe o debe existir estructura.

`SEARCH_STRUCTURED_COMPONENT_SET` deberá poder distinguir:

```text
product_id
quantity
input_unit_code
stock_quantity
stock_unit_code
multiplier
package_kind
usage_context
supplier_or_source_scope
validity_or_status
visible_label
```

Reglas:

1. `500 g`, `Pote x 2`, `Bolsa 1 kg`, `Six Pack` y `six_pack` no son claves intercambiables;
2. cantidad y unidad se comparan mediante contratos numéricos y de catálogo, no por eliminación de caracteres;
3. la etiqueta visible puede participar en ranking después de aplicar filtros estructurales;
4. dos etiquetas iguales con cantidad, unidad, contexto o fuente distintos permanecen como resultados diferentes;
5. una equivalencia cuantitativa no demuestra que dos perfiles tengan el mismo propósito operativo;
6. la búsqueda no modifica factores de conversión, defaults, procedencia ni vigencia;
7. una posible duplicidad se remite a `DATA-NORM-ARC-010` con la estructura completa.

#### 22. Códigos, slugs, contactos e identificadores

1. `_vento_slugify`, `_navigation_slugify`, códigos PASS, SKU y otras derivaciones existentes no se adoptan como representación general de búsqueda.
2. Un slug es identificador técnico o ruta según su contrato; no es el nombre normalizado de la entidad.
3. Un cambio de algoritmo de slug o código puede romper URLs, integraciones, referencias o idempotencia y requiere transición propia.
4. SKU, códigos de barras, referencias, modelos y series se comparan mediante su contrato exacto y scope.
5. Emails y teléfonos aplican únicamente canonicalización propia del canal, con preservación y privacidad según el contrato de identidad.
6. No se eliminan signos o tildes de un identificador para hacerlo coincidir con un nombre comercial.
7. La búsqueda de una entidad por código puede coexistir con su búsqueda por nombre, pero cada coincidencia declara el campo y modo utilizados.
8. Un mismo string encontrado como nombre y código no convierte ambas representaciones en aliases.

#### 23. Fuentes, copias, snapshots y proyecciones

1. La derivación de una fuente autoritativa conserva su vínculo con la versión de esa fuente.
2. Un `APPROVED_OVERRIDE` podrá tener una derivación propia dentro de su canal y scope sin redefinir el valor principal.
3. Una `SYNCHRONIZED_COPY` no mantiene un algoritmo local; recibe la derivación o la recalcula mediante la misma versión y contrato de la fuente.
4. Un `IMMUTABLE_SNAPSHOT` puede ser buscable mediante una derivación vinculada a su valor histórico, pero no se resincroniza con el valor vigente.
5. Un `EXTERNAL_ORIGINAL` se preserva; una clave interna se deriva separadamente y nunca sustituye payload, firma o evidencia.
6. Una `OUTPUT_PROJECTION` no adquiere autoridad de búsqueda sobre la fuente.
7. Los 50 nombres de catálogo divergentes frente a producto, y sus 40 o 36 variantes bajo comparaciones más tolerantes, no se corrigen ni igualan por esta política.
8. Cada dominio deberá declarar si la búsqueda incluye fuente, override, snapshot, histórico o combinación, y cómo se etiqueta cada resultado.

#### 24. Relación con la cola de revisión

La búsqueda ordinaria no crea automáticamente casos de revisión por cada consulta o resultado de baja confianza.

Un caso de `DATA-NORM-ARC-007` podrá originarse únicamente cuando exista una propuesta explícita y gobernada para:

- aprobar un alias;
- aprobar una transliteración;
- modificar un perfil o algoritmo;
- resolver un conflicto entre aliases o fuentes;
- convertir un candidato de similitud en corrección, excepción o preservación;
- clasificar un campo o token que bloquea la búsqueda;
- resolver una divergencia que pueda afectar forma oficial, estructura o fuente.

La consulta, telemetría, frecuencia de clics o selección repetida no constituyen evidencia suficiente. El expediente deberá conservar el caso concreto, scope, versiones, riesgo y autoridad sin incluir datos sensibles innecesarios.

#### 25. Relación con identidad, unicidad y duplicidad

1. Ninguna de las siete representaciones constituye identidad empresarial.
2. Los modos de coincidencia expresan recuperación, no equivalencia.
3. Un resultado exacto puede corresponder a homónimos legítimos, versiones, scopes distintos o entidades de capas diferentes.
4. `Maiz Dulce` y `Maíz Dulce`, `Chai latte frio` y `Chai Latte Frío`, o dos UOM con la misma etiqueta permanecen como candidatos independientes.
5. Una clave de búsqueda no se utiliza directamente como constraint de unicidad.
6. La activación de unicidad deberá definir identidad, scope, vigencia, historial, colisiones y transición en `DATA-NORM-ARC-010`.
7. La búsqueda no selecciona registro sobreviviente, no desactiva filas y no reasigna relaciones.
8. Toda posible fusión deberá revisar las 420 relaciones de alcance auditado y las dependencias sin clave foránea que correspondan.
9. El ranking no podrá utilizarse como criterio automático de fusión o vinculación.
10. Una acción posterior que utilice un resultado deberá revalidar entidad, autorización, versión y contexto por identificador estable.

#### 26. Compatibilidad de versión e índices

Aunque esta tarea no selecciona una implementación física, aprueba las siguientes obligaciones:

1. la expresión de consulta y la representación indexada deberán usar el mismo algoritmo y versión;
2. un índice sobre `lower(trim(value))` no se considera compatible automáticamente con `SEARCH_FORM_KEY`, `SEARCH_ACCENT_KEY` o tokens;
3. una versión nueva deberá medir cobertura, colisiones, tamaño, latencia, planes de ejecución y efecto sobre paginación antes de activarse;
4. mientras se mantengan dos versiones, el contrato deberá declarar cuál atiende escrituras, cuál atiende lecturas y cómo se comparan resultados;
5. no se ejecutará fallback a un helper legacy incompatible sin marcar el resultado como degradado;
6. los 13 índices locales observados no constituyen una estrategia transversal;
7. no se presume que `citext`, trigramas, búsqueda de texto completo o una extensión concreta sean la implementación correcta;
8. rendimiento y seguridad bajo carga se certificarán en `SUPA-TRANS-010`;
9. adaptación de consumidores y compatibilidad temporal pertenecen a `SUPA-TRANS-006`, `SUPA-TRANS-007`, `SUPA-TRANS-013` y `SUPA-TRANS-014`.

#### 27. Paridad entre capas

Para la misma consulta, corpus, scope, perfil y versiones, todas las capas deberán producir:

- las mismas derivaciones lógicas;
- el mismo conjunto elegible antes de ranking;
- el mismo modo principal de coincidencia;
- el mismo nivel;
- el mismo orden estable;
- la misma explicación;
- la misma conducta ante versión ausente, bloqueo o ambigüedad.

Ninguna aplicación, RPC, Edge Function, trigger, job o cliente podrá:

- mantener un tokenizer, lista de stopwords, alias o transliteración local;
- sustituir `_vento_slugify` por `_navigation_slugify` como refactorización neutral;
- aplicar `unaccent`, `lower`, trim o similitud con semántica distinta;
- elevar una coincidencia difusa sobre una exacta;
- devolver la clave derivada como nombre mostrado;
- omitir scope o autorización para mejorar recall;
- convertir una coincidencia en escritura automática.

La distribución física y precedencia ejecutora serán definidas por `DATA-NORM-ARC-011`.

#### 28. Ejemplos normativos

| Valor o consulta                                                     | Resultado de búsqueda permitido                                                                             | Resultado prohibido                                                   |
| -------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------- |
| valor `Harina de Maíz`, consulta `harina de maiz`                    | `ACCENT_TOLERANT_MATCH`; mostrar `Harina de Maíz`                                                           | sobrescribir el nombre o declarar identidad por la clave              |
| valor `Maiz Dulce`, consulta `maíz dulce`                            | candidato tolerante con motivo y scope                                                                      | corregir o fusionar automáticamente el registro                       |
| valor `año`, consulta `ano`                                          | no coincidir mediante `SEARCH_ACCENT_KEY`                                                                   | plegar `ñ` a `n`                                                      |
| valor `Coca-Cola`, consulta `coca-cola`                              | `FORM_EQUIVALENT_MATCH` si la forma oficial autoriza casefold                                               | emitir `Coca Cola` o eliminar el guion                                |
| valor `Coca-Cola`, consulta `coca cola`                              | posible `ALL_TOKEN_MATCH` de menor nivel si el perfil de marca lo autoriza expresamente                     | crear alias implícito o declarar igualdad oficial                     |
| valor `S.A.S.`, consulta `sas`                                       | no coincidir salvo alias legal explícito                                                                    | eliminar puntos por tolerancia general                                |
| valor `iPhone`, consulta `iphone`                                    | coincidencia oficial casefold cuando la excepción activa lo permita; mostrar `iPhone`                       | convertir el valor a `Iphone`                                         |
| valor `expresso`, consulta `espresso`                                | no coincidencia estándar; candidato difuso solo si el perfil futuro lo habilita                             | autocorrección, alias o diccionario implícito                         |
| valores `Wellmix` y `Welmix`                                         | resultados separados; posible candidato difuso de baja confianza                                            | seleccionar uno como oficial por frecuencia                           |
| valores `Choco Bites` y `Chocobites`                                 | resultados separados; no son equivalentes por tokenización                                                  | unir o dividir palabras                                               |
| presentación `500 g`                                                 | cantidad `500` y unidad `g` como componentes; etiqueta visible preservada                                   | comparar únicamente la cadena sin contexto                            |
| `Bolsa de 1.100 ml` y `Bolsa de 1100 ml`                             | candidatos separados hasta resolver convención y estructura                                                 | retirar el punto y declarar equivalencia                              |
| nombre personal `Carlos Ibarra`                                      | búsqueda restringida por finalidad y scope; retornar identificador estable autorizado                       | identificar o fusionar personas por nombre                            |
| SKU `FRIO` y palabra comercial `frío`                                | búsquedas independientes por campo y perfil                                                                 | hacer coincidir código y palabra mediante tildes o casefold comercial |
| original externo `MAIZ` y forma interna `Maíz`                       | conservar original; buscar la entidad interna mediante su derivación y mostrar la representación autorizada | sobrescribir el original externo                                      |
| dos registros exactos `VÍVERES & BODEGA PRINCIPAL` en el mismo scope | dos resultados con identificadores distintos y señal para análisis de duplicidad                            | devolver uno solo por orden físico                                    |
| doce posiciones llamadas `Nivel 1` bajo padres distintos             | filtrar por jerarquía y devolver únicamente el scope solicitado                                             | colapsar resultados por nombre                                        |

#### 29. Corpus mínimo de conformidad

El corpus deberá cubrir, como mínimo:

1. Unicode precompuesto y descompuesto;
2. múltiples cajas y casefold del perfil;
3. espacios de borde, repetidos, no separables, saltos de línea y formatos preservados;
4. tildes en vocales, diéresis y separación obligatoria de `ñ` frente a `n`;
5. guiones, apóstrofos, puntos, ampersands, barras, paréntesis y signos internos;
6. conectores en frases sin eliminación de stopwords;
7. marcas, siglas, unidades, nombres legales, nombres personales y direcciones;
8. términos extranjeros y perfiles de idioma no soportados;
9. aliases activos, suspendidos, retirados, conflictivos y fuera de scope;
10. transliteración deshabilitada, incompatible y explícitamente habilitada;
11. similitud deshabilitada, umbral no resuelto y candidato de baja confianza;
12. frases, todos los tokens y prefijo únicamente en el último token;
13. scopes de sede, dominio, padre, contexto, vigencia e historial;
14. UOM con etiqueta igual y estructura diferente;
15. productos homónimos entre insumo, preparación y venta;
16. personas con nombre igual e identificadores distintos;
17. versiones de algoritmo compatibles e incompatibles;
18. orden y paginación estables con empates;
19. autorización, masking, consultas sensibles y resultados no autorizados;
20. paridad entre capas y ausencia de efectos de escritura.

El corpus inicial incorporará los cortes medidos por `DATA-NORM-AUD-007`: 26 grupos bajo `LOWER_TRIM`, 27 bajo comparación sin tildes, 26 bajo `_vento_slugify` y 27 bajo `_navigation_slugify`, sin interpretarlos como duplicados confirmados.

#### 30. Conductas no conformes

Quedan prohibidas:

1. almacenar una clave de búsqueda como valor mostrado;
2. usar una clave universal para todas las clases y campos;
3. aplicar `unaccent` global y eliminar `ñ`;
4. eliminar signos o unir palabras para declarar igualdad;
5. generar aliases desde frecuencia, clics, consultas o similitud;
6. aplicar stemming, lematización, traducción o stopwords sin política versionada;
7. habilitar similitud como fallback oculto;
8. seleccionar automáticamente el primer resultado para una mutación;
9. ordenar por score no reproducible o por orden físico;
10. paginar sin un desempate estable;
11. comparar consulta y valor con versiones distintas sin declararlo;
12. mantener helpers, tokenizers o rankings locales por aplicación;
13. omitir scope, estado o autorización para ampliar resultados;
14. exponer claves derivadas, consultas sensibles o evidencia innecesaria;
15. buscar secretos, firmas o tokens mediante prefijo o similitud;
16. utilizar una etiqueta UOM como identidad estructural;
17. interpretar coincidencia de nombres personales como identidad;
18. activar unicidad o fusión desde una representación de búsqueda;
19. aplicar la política de Vento OS a VITAL;
20. introducir columnas, índices o backfills desde esta tarea documental.

#### 31. Hallazgos y carryovers

| ID               | Decisión o brecha                                                   | Resultado de esta tarea                                                     | Propietario siguiente                                                        |
| ---------------- | ------------------------------------------------------------------- | --------------------------------------------------------------------------- | ---------------------------------------------------------------------------- |
| `DN-ARC-008-H01` | ausencia de contrato único de búsqueda                              | siete representaciones, seis perfiles y nueve modos aprobados               | `DATA-NORM-ARC-009`; `DATA-NORM-ARC-011`                                     |
| `DN-ARC-008-H02` | helpers legacy producen resultados incompatibles                    | ninguno se adopta como normalizador universal                               | `DATA-NORM-ARC-009`; `DATA-NORM-ARC-011`; `SUPA-TRANS-003`; `SUPA-TRANS-006` |
| `DN-ARC-008-H03` | búsqueda sin tildes puede aumentar recall y colisiones              | perfil `es-CO` aprobado con `ñ` preservada y ranking inferior               | `DATA-NORM-ARC-009`; `SUPA-TRANS-009`; `SUPA-TRANS-010`                      |
| `DN-ARC-008-H04` | no existe estrategia transversal de índice                          | compatibilidad algoritmo-expresión obligatoria; selección física reservada  | `DATA-NORM-ARC-011`; `SUPA-TRANS-005`; `SUPA-TRANS-010`                      |
| `DN-ARC-008-H05` | aliases y transliteraciones pueden crear equivalencias falsas       | aliases explícitos y transliteración deshabilitada por defecto              | `DATA-NORM-ARC-007`; `DATA-NORM-ARC-009`; `DATA-NORM-ARC-012`                |
| `DN-ARC-008-H06` | similitud puede confundirse con corrección o identidad              | candidato de mínima confianza, deshabilitado por defecto                    | `DATA-NORM-ARC-007`; `DATA-NORM-ARC-010`; `SUPA-TRANS-010`                   |
| `DN-ARC-008-H07` | UOM, ubicaciones y estructuras producen falsos positivos            | componentes estructurados y scope obligatorio aprobados                     | `DATA-NORM-ARC-010`; `DATA-NORM-ARC-011`; `DATA-NORM-TRANS-003`              |
| `DN-ARC-008-H08` | personas y datos sensibles requieren finalidad y minimización       | perfil restringido y prohibición de identidad por nombre                    | `DATA-NORM-ARC-009`; `DATA-NORM-ARC-011`; `DATA-NORM-ARC-012`                |
| `DN-ARC-008-H09` | copias, snapshots y overrides pueden devolver formas divergentes    | vínculo con fuente, versión, vigencia y tipo de representación obligatorio  | `DATA-NORM-ARC-009`; `SUPA-TRANS-007`; `DATA-NORM-TRANS-008`                 |
| `DN-ARC-008-H10` | ranking y paginación pueden divergir entre consumidores             | orden canónico y desempate estable aprobados                                | `DATA-NORM-ARC-011`; `SUPA-TRANS-007`; `SUPA-TRANS-009`                      |
| `DN-ARC-008-H11` | búsqueda puede utilizarse indebidamente para acciones estructurales | frontera absoluta frente a unicidad, selección automática y fusión aprobada | `DATA-NORM-ARC-010`; `DATA-NORM-TRANS-003`; `SUPA-TRANS-011`                 |
| `DN-ARC-008-H12` | VITAL comparte infraestructura y una dependencia laboral            | exclusión transversal mantenida                                             | `SUPA-ARC-025`                                                               |

#### 32. Decisiones reservadas

| Decisión                                                         | Tarea propietaria                                              |
| ---------------------------------------------------------------- | -------------------------------------------------------------- |
| estructura física de derivaciones, trazas, vigencias y retención | `DATA-NORM-ARC-009`                                            |
| identidad, scope de unicidad, colisiones y duplicados            | `DATA-NORM-ARC-010`                                            |
| capa ejecutora, API, RPC, trigger, índices y precedencia técnica | `DATA-NORM-ARC-011`                                            |
| valores externos, mapeos, originales y contratos de integración  | `DATA-NORM-ARC-012`                                            |
| inventario y adaptación de consumidores                          | `SUPA-TRANS-003`; `SUPA-TRANS-007`; `SUPA-TRANS-014`           |
| columnas, índices, backfills y correcciones físicas              | `SUPA-TRANS-005`; tareas `DATA-NORM-TRANS-*` aplicables        |
| compatibilidad y coexistencia de versiones                       | `SUPA-TRANS-006`; `DATA-NORM-TRANS-004`; `DATA-NORM-TRANS-005` |
| pruebas de transición y paridad                                  | `SUPA-TRANS-009`; `DATA-NORM-TRANS-009`                        |
| rendimiento, carga, tamaño, seguridad y plan de ejecución        | `SUPA-TRANS-010`                                               |
| rollback y restauración de versiones                             | `SUPA-TRANS-011`; `DATA-NORM-TRANS-008`                        |
| paridad de ambientes y artefactos desplegados                    | `SUPA-TRANS-013`; `SUPA-TRANS-014`                             |
| decisión humana sobre aliases, conflictos y candidatos           | `DATA-NORM-ARC-007`                                            |

#### 33. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

| ID              | Regla protegida                                                                                   | Tipo                                     | Prioridad | Momento de implementación                          | Destino                                                         |
| --------------- | ------------------------------------------------------------------------------------------------- | ---------------------------------------- | --------- | -------------------------------------------------- | --------------------------------------------------------------- |
| `TREQ-DATA-123` | separar siempre valor fuente, valor mostrado y representaciones de búsqueda                       | contractual + regresión                  | crítica   | paquete que materialice derivaciones               | `DATA-NORM-ARC-009`; `DATA-NORM-ARC-011`                        |
| `TREQ-DATA-124` | derivar consulta y valor con el mismo algoritmo, locale y versión                                 | contractual + integración + regresión    | crítica   | motor de búsqueda y coexistencia de versiones      | `DATA-NORM-ARC-009`; `DATA-NORM-ARC-011`; `SUPA-TRANS-006`      |
| `TREQ-DATA-125` | conservar vínculo completo entre cada derivación, fuente, campo, scope y versión                  | base de datos + auditoría + regresión    | crítica   | persistencia de representaciones y trazas          | `DATA-NORM-ARC-009`; `DATA-NORM-ARC-011`                        |
| `TREQ-DATA-126` | aplicar `SEARCH_FORM_KEY` sin corregir contenido ni alterar signos significativos                 | unitaria + contractual + idempotencia    | crítica   | librería canónica de derivación                    | `DATA-NORM-ARC-009`; `DATA-NORM-ARC-011`                        |
| `TREQ-DATA-127` | plegar tildes autorizadas en `es-CO` preservando `ñ` y otros caracteres no aprobados              | unitaria + contractual + regresión       | crítica   | perfil lingüístico y corpus Unicode                | `DATA-NORM-ARC-009`; `SUPA-TRANS-009`                           |
| `TREQ-DATA-128` | tokenizar con fronteras completas, conectores presentes y signos explicables                      | unitaria + contractual + regresión       | crítica   | tokenizer canónico                                 | `DATA-NORM-ARC-011`; `SUPA-TRANS-009`                           |
| `TREQ-DATA-129` | aceptar únicamente aliases explícitos, activos, acotados y versionados                            | contractual + seguridad + regresión      | crítica   | catálogo de aliases y motor de consulta            | `DATA-NORM-ARC-007`; `DATA-NORM-ARC-009`; `DATA-NORM-ARC-011`   |
| `TREQ-DATA-130` | mantener transliteración deshabilitada por defecto y siempre como fallback de menor nivel         | contractual + regresión                  | alta      | perfiles multilingües futuros                      | `DATA-NORM-ARC-009`; `DATA-NORM-ARC-012`                        |
| `TREQ-DATA-131` | mantener similitud deshabilitada por defecto y limitarla a candidatos sin efectos automáticos     | contractual + seguridad + regresión      | crítica   | capacidad de similitud y medición                  | `DATA-NORM-ARC-007`; `DATA-NORM-ARC-010`; `SUPA-TRANS-010`      |
| `TREQ-DATA-132` | respetar exactamente los nueve modos y su precedencia                                             | contractual + integración + regresión    | crítica   | motor de matching y contratos de consumidores      | `DATA-NORM-ARC-011`; `SUPA-TRANS-007`; `SUPA-TRANS-009`         |
| `TREQ-DATA-133` | producir ranking, empates y paginación estables con explicación del modo                          | contractual + integración + experiencia  | crítica   | API y clientes de búsqueda                         | `DATA-NORM-ARC-011`; `SUPA-TRANS-007`; `SUPA-TRANS-009`         |
| `TREQ-DATA-134` | aplicar la matriz de tratamiento por clase y bloquear secretos y campos no clasificados           | seguridad + contractual + regresión      | crítica   | resolución de perfiles y autorización              | `DATA-NORM-ARC-011`; `DATA-NORM-ARC-012`                        |
| `TREQ-DATA-135` | buscar presentaciones mediante componentes y no por identidad de etiqueta                         | contractual + integración + regresión    | crítica   | búsqueda estructurada de UOM y presentaciones      | `DATA-NORM-ARC-010`; `DATA-NORM-ARC-011`; `DATA-NORM-TRANS-003` |
| `TREQ-DATA-136` | mantener códigos, slugs, contactos e identificadores bajo contratos técnicos propios              | contractual + integración + regresión    | crítica   | adaptadores y búsquedas técnicas                   | `DATA-NORM-ARC-011`; `DATA-NORM-ARC-012`; `SUPA-TRANS-006`      |
| `TREQ-DATA-137` | filtrar autorización y scope antes de rankear y minimizar consulta, logs y explicación            | seguridad + privacidad + regresión       | crítica   | API, RLS, observabilidad y clientes                | `DATA-NORM-ARC-009`; `DATA-NORM-ARC-011`; `DATA-NORM-ARC-012`   |
| `TREQ-DATA-138` | devolver la representación mostrada correcta y conservar fuente, override, snapshot e histórico   | contractual + auditoría + regresión      | crítica   | lectura multirrepresentación y propagación         | `DATA-NORM-ARC-009`; `SUPA-TRANS-007`; `DATA-NORM-TRANS-008`    |
| `TREQ-DATA-139` | garantizar paridad entre todas las capas y prohibir helpers, aliases y rankings locales           | integración + idempotencia + regresión   | crítica   | certificación transversal                          | `DATA-NORM-ARC-011`; `SUPA-TRANS-009`; `SUPA-TRANS-014`         |
| `TREQ-DATA-140` | comprobar compatibilidad entre algoritmo, expresión e índice y medir rendimiento antes de activar | base de datos + integración + regresión  | crítica   | migración de índices y prueba de carga             | `DATA-NORM-ARC-011`; `SUPA-TRANS-005`; `SUPA-TRANS-010`         |
| `TREQ-DATA-141` | impedir que cualquier coincidencia o ranking active identidad, unicidad, selección o fusión       | contractual + seguridad + migración      | crítica   | arquitectura de duplicados y acciones consumidoras | `DATA-NORM-ARC-010`; `DATA-NORM-TRANS-003`; `SUPA-TRANS-011`    |
| `TREQ-DATA-142` | ejecutar corpus integral de Unicode, tildes, `ñ`, signos, aliases, scopes, versiones y paridad    | unitaria + integración + E2E + regresión | crítica   | corpus canónico y pruebas de transición            | `DATA-NORM-ARC-009`; `DATA-NORM-ARC-011`; `SUPA-TRANS-009`      |

El detalle canónico de cada requisito reside en el registro 04A actualizado hasta esta tarea.

#### 34. Criterios de integridad

La política se considera íntegra para esta etapa cuando:

1. separa valor fuente, mostrado, externo, técnico, snapshot, proyección y búsqueda;
2. aprueba exactamente siete representaciones derivadas y seis perfiles cerrados;
3. define `SEARCH_FORM_KEY` con NFC, casefold y espacios gobernados sin corregir contenido;
4. define tolerancia `es-CO` que pliega tildes autorizadas y preserva `ñ`;
5. conserva signos y fronteras en la clave de forma;
6. tokeniza por grafemas y prohíbe coincidencias por subcadena;
7. mantiene conectores como tokens y no introduce stopwords globales;
8. exige aliases explícitos, activos, acotados y versionados;
9. mantiene transliteración y similitud deshabilitadas por defecto;
10. limita similitud a candidatos sin efectos automáticos;
11. define exactamente nueve modos de coincidencia en precedencia estricta;
12. aplica autorización, scope y filtros estructurales antes del ranking;
13. establece ranking y paginación deterministas con desempate estable;
14. devuelve el valor mostrado y explica el modo sin exponer claves o datos innecesarios;
15. resuelve tratamiento para las catorce clases semánticas;
16. trata presentaciones mediante componentes y no por etiqueta;
17. conserva contratos independientes para códigos, slugs, contactos e identificadores;
18. preserva fuentes, overrides, snapshots y originales externos;
19. exige compatibilidad entre algoritmo, consulta, derivación e índice;
20. exige paridad entre capas y prohíbe helpers locales divergentes;
21. impide identidad, unicidad, selección y fusión desde cualquier coincidencia;
22. conserva VITAL fuera del alcance transversal;
23. incluye corpus positivo, negativo, ambiguo, estructural, sensible y de versiones;
24. no autoriza cambios físicos ni anticipa decisiones reservadas.

#### 35. Continuidad

```text
ÚLTIMA TAREA APROBADA
DATA-NORM-ARC-007 — Definir cola de revisión para correcciones ambiguas
        ↓
TAREA ACTUAL APROBADA
DATA-NORM-ARC-008 — Definir representación de búsqueda y comparación
        ↓
SIGUIENTE TAREA RESERVADA
DATA-NORM-ARC-009 — Definir auditoría, versionado e idempotencia de reglas
```


### ✅ DATA-NORM-ARC-009 — Definir auditoría, versionado e idempotencia de reglas

**Estado:** APROBADA
**Tarea anterior:** `DATA-NORM-ARC-008 — Definir representación de búsqueda y comparación` — APROBADA
**Tarea siguiente:** `DATA-NORM-ARC-010 — Definir estrategia de unicidad y detección de duplicados normalizados`
**Tipo de tarea:** definición normativa del contrato lógico de auditoría, identidad y ciclo de vida de versiones, vigencia temporal, reproducibilidad, concurrencia e idempotencia de reglas de normalización, revisión y búsqueda; sin DDL, DML, migraciones, backfills, correcciones de datos, cambios de índices, constraints, funciones, triggers, clientes, integraciones, configuración ni despliegues

#### 1. Objetivo

Definir el contrato canónico que deberá permitir reconstruir, explicar y reproducir toda decisión de normalización textual de Vento OS, incluyendo la regla solicitada, la coordenada evaluada, las versiones efectivas, la entrada protegida, el resultado, el actor o proceso iniciador, la evidencia, el motivo, la vigencia y cualquier efecto persistido o derivado.

La política deberá impedir reglas editadas en sitio, versiones implícitas, uso ambiguo de `latest`, reintentos con efectos duplicados, evaluaciones no reproducibles, mezclas silenciosas de algoritmos y pérdida de historia. Una misma operación lógica, con la misma entrada, coordenada y conjunto de versiones, deberá producir el mismo resultado lógico; una repetición sobre un efecto ya aplicado deberá devolver el resultado anterior o una no operación verificable, sin volver a mutar datos ni duplicar eventos empresariales.

#### 2. Artefacto producido

```text
VENTO_TEXT_RULE_AUDIT_VERSION_AND_IDEMPOTENCY_POLICY@1.0.0
```

| Propiedad                                     | Valor |
| --------------------------------------------- | ----: |
| Familias cerradas de registro lógico          |     6 |
| Estados unificados de ciclo de vida           |     8 |
| Modos cerrados de compatibilidad de versiones |     5 |
| Clases cerradas de evento de auditoría        |    12 |
| Resultados cerrados de evaluación             |    10 |
| Clases de operación idempotente               |     6 |
| Clases de retención lógica                    |     5 |
| Niveles de reproducibilidad                   |     3 |
| Requisitos de prueba nuevos                   |    22 |
| Cambios físicos autorizados                   |     0 |

#### 3. Fuentes canónicas consumidas

| Fuente                                | Decisión consumida                                                                                                              |
| ------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| `01_PROTOCOLO.md`                     | continuidad, una sola tarea, fase exclusivamente documental, preservación histórica y generación inmediata de requisitos        |
| `delivery-contract.json`              | identidad del artefacto de tarea y actualización integral del registro 04A al crear requisitos                                  |
| `active-sequence.json`                | `DATA-NORM-ARC-009` como tarea actual y `DATA-NORM-ARC-010` como siguiente tarea reservada                                      |
| `DATA-NORM-AUD-001`                   | representaciones separadas, reglas locales y necesidad de atribuir toda transformación a campo, propósito y fuente              |
| `DATA-NORM-AUD-002`                   | diferencias formales que no pueden reinterpretarse sin conservar original, contexto y resultado                                 |
| `DATA-NORM-AUD-003`                   | marcas, siglas, unidades, nombres legales, personas, externos, identificadores y material protegido                             |
| `DATA-NORM-AUD-004`                   | colisiones, homónimos, versiones, scopes y prohibición de convertir claves comparativas en identidad                            |
| `DATA-NORM-AUD-005`                   | separación entre operación determinista, diccionario, revisión, preservación y resolución estructural                           |
| `DATA-NORM-AUD-006`                   | productores distribuidos, helpers divergentes, copias, snapshots, jobs, integraciones y riesgo de efectos duplicados            |
| `DATA-NORM-AUD-007`                   | incompatibilidad entre helpers, alcance relacional, coexistencia de versiones, necesidad de paridad y transición                |
| `DATA-NORM-ARC-001`                   | toda regla versionada, idempotente, resoluble por coordenada y con comportamiento cerrado                                       |
| `DATA-NORM-ARC-002`                   | clases, representaciones, fuentes, modos de tratamiento y operación solicitada                                                  |
| `DATA-NORM-ARC-003` a `006`           | capitalización, conectores, excepciones y diccionario con versión, vigencia, procedencia, paridad e idempotencia                |
| `DATA-NORM-ARC-007`                   | decisiones humanas inmutables, casos vinculados, SLA, concurrencia, reintentos y separación entre decisión y materialización    |
| `DATA-NORM-ARC-008`                   | siete representaciones de búsqueda, nueve modos, ranking estable, vínculo con fuente y obligación de usar versiones compatibles |
| Regla canónica del bloque propietario | `normalize(normalize(value)) = normalize(value)` y reserva de auditoría, versionado e idempotencia para esta tarea              |

#### 4. Alcance y fronteras

Esta tarea define:

1. la identidad estable de una regla y de cada una de sus versiones inmutables;
2. el conjunto de versiones efectivo que deberá fijarse para cada evaluación;
3. los estados y transiciones lógicas del ciclo de vida de reglas;
4. la vigencia temporal y la activación atómica por coordenada;
5. los modos de coexistencia y compatibilidad entre versiones;
6. la procedencia del algoritmo y del artefacto ejecutor;
7. las familias de registros y eventos de auditoría;
8. el contrato lógico mínimo de evaluación, mutación, derivación, revisión y transición;
9. los resultados cerrados de evaluación;
10. el modelo de idempotencia por clase de operación;
11. la construcción y validación de claves de idempotencia;
12. la conducta ante concurrencia, entrada obsoleta, reintentos y payload incompatible;
13. la reproducibilidad, el replay controlado y la verificación de determinismo;
14. la supersesión, suspensión, retiro y rollback lógico de versiones;
15. la minimización de valores, consultas y evidencia sensible;
16. la correlación entre capas, consumidores, jobs, integraciones y efectos posteriores;
17. el corpus mínimo de conformidad.

Esta tarea no define:

- tablas, columnas, tipos, índices, constraints, RLS, grants, funciones, RPC, triggers, jobs, colas físicas ni almacenamiento concreto;
- duración numérica final de cada retención, particionamiento, archivado o eliminación física;
- la identidad empresarial, scopes de unicidad, duplicados, sobrevivientes o fusiones;
- qué capa técnica ejecutará o persistirá cada registro;
- el contrato físico de originales externos;
- backfills, lotes, dual write, cutover, despliegue, observabilidad física o rollback operativo;
- modificaciones sobre datos existentes;
- la aprobación de nuevas entradas, aliases, excepciones, perfiles o algoritmos.

Estas decisiones permanecen en `DATA-NORM-ARC-010` a `DATA-NORM-ARC-012`, `SUPA-TRANS-001` a `SUPA-TRANS-015` y `DATA-NORM-TRANS-001` a `DATA-NORM-TRANS-009`, según su propiedad.

#### 5. Principios obligatorios

1. **Una regla es inmutable por versión.** Cualquier cambio de contenido, alcance, evidencia, precedencia o algoritmo crea otra versión.
2. **No existe `latest` implícito.** Toda evaluación fija el conjunto exacto de versiones efectivas.
3. **La auditoría describe el resultado real.** No registra solo la intención; conserva la decisión, el efecto y el motivo observados.
4. **La historia es aditiva.** Suspender, retirar, superseder o corregir no elimina ni reescribe decisiones anteriores.
5. **La idempotencia se define por operación lógica.** No depende de que una petición HTTP se ejecute una sola vez.
6. **Un reintento compatible reutiliza el resultado.** No vuelve a mutar, propagar, aprobar ni emitir efectos duplicados.
7. **Una clave reutilizada con otro payload es conflicto.** Nunca se interpreta como una nueva operación válida.
8. **La entrada obsoleta bloquea la mutación.** Si cambió el valor fuente, la versión o la política, se reevalúa antes de escribir.
9. **Todo resultado es reproducible o explicablemente no reproducible.** La política declara qué evidencia permite reconstruirlo.
10. **La auditoría no expone por defecto el dato.** Valores sensibles se representan mediante referencias protegidas, hashes o metadatos mínimos.
11. **El algoritmo es parte de la versión.** Locale, Unicode, catálogos, tokenizer, ranking, orden y artefacto ejecutor deben quedar fijados.
12. **La paridad es obligatoria.** La misma operación lógica no cambia de significado entre aplicación, servicio, RPC, job, trigger o integración.
13. **Auditar no autoriza identidad.** Una traza de coincidencia, corrección o búsqueda no permite unicidad, fusión ni reasignación.
14. **VITAL permanece separado.** No hereda versiones, trazas ni reglas transversales de Vento OS por coexistencia física.

#### 6. Familias cerradas de registro lógico

| Familia                             | Finalidad                                                                                                 | Obligación mínima                                                                                     |
| ----------------------------------- | --------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| `RULE_GOVERNANCE_RECORD`            | identidad, contenido, aprobación, estado y vigencia de una versión                                        | conservar definición inmutable, autoridad, evidencia, hash y relaciones de supersesión                |
| `RULE_EVALUATION_RECORD`            | decisión producida al evaluar una entrada sin afirmar todavía un efecto persistido                        | fijar coordenada, entrada o referencia, versiones, resultado, motivo y huella de salida               |
| `PERSISTED_MUTATION_RECORD`         | efecto confirmado sobre un valor persistido                                                               | conservar antes y después protegidos, expectativa de concurrencia, efecto, actor y reversibilidad     |
| `DERIVATION_MATERIALIZATION_RECORD` | creación o renovación de búsqueda, proyección, snapshot sincronizable u otra derivación                   | vincular fuente, versión o hash del valor, algoritmo, representación, vigencia y salida               |
| `REVIEW_DECISION_RECORD`            | decisión humana sobre ambigüedad, conflicto, clasificación, preservación o escalamiento                   | enlazar caso, evidencia, funciones decisoras, alcance, resultado y versión propuesta                  |
| `PROPAGATION_OR_TRANSITION_RECORD`  | solicitud, aplicación o compensación posterior sobre copias, lotes, consumidores o versiones coexistentes | conservar causación, alcance, elementos afectados, resultados parciales, reintentos y destino técnico |

Las familias son lógicas. La distribución física, ownership de escritura y APIs pertenecen a `DATA-NORM-ARC-011` y a las tareas de transición.

#### 7. Identidad estable de regla y versión

Cada regla deberá distinguir:

```text
rule_key
rule_version_id
rule_family
policy_coordinate
semantic_class
operation_kind
language_profile
version_number
content_digest
status
effective_from
effective_to
supersedes_rule_version_id
```

Reglas:

1. `rule_key` identifica el concepto estable y no cambia cuando aparece una nueva versión;
2. `rule_version_id` identifica una definición inmutable;
3. `version_number` no sustituye al identificador estable y no podrá reutilizarse;
4. `content_digest` cubre la definición normativa ejecutable, alcance, precedencia, exclusiones y dependencias;
5. una edición que altere el digest crea una versión distinta;
6. una corrección administrativa no destructiva se registra como evento aditivo y no modifica silenciosamente el contenido firmado;
7. una versión no podrá tener dos contenidos distintos entre ambientes;
8. el identificador visible o nombre humano no se utiliza como identidad técnica de versión.

#### 8. Conjunto efectivo de versiones

Toda evaluación deberá resolver un `resolved_version_set` completo y producir su huella estable `version_set_digest`.

El conjunto incluirá cuando aplique:

```text
field_policy_version
field_class_catalog_version
capitalization_policy_version
connector_catalog_version
official_exception_catalog_version
orthographic_dictionary_version
review_decision_version
search_policy_version
language_and_unicode_profile_version
algorithm_artifact_version
external_mapping_version
```

Reglas:

1. solo se incluyen dependencias realmente consumidas y se declara `NOT_APPLICABLE` para las demás;
2. ninguna dependencia se resuelve por hora actual, orden de carga, caché o configuración local no registrada;
3. el mismo `version_set_digest` representa exactamente el mismo conjunto y compatibilidad;
4. una versión ausente, suspendida, incompatible o no vigente produce bloqueo y no fallback silencioso;
5. la consulta, el valor indexado y el ranking deberán fijar el mismo conjunto compatible;
6. la traza histórica conserva el conjunto usado aunque posteriormente se retire una versión;
7. una capa no podrá reemplazar una dependencia por otra semánticamente parecida.

#### 9. Estados unificados del ciclo de vida

| Estado                        | Ejecutable para decisiones nuevas | Significado                                                                                |
| ----------------------------- | --------------------------------- | ------------------------------------------------------------------------------------------ |
| `DRAFT`                       | no                                | definición incompleta o pendiente de revisión                                              |
| `APPROVED_PENDING_ACTIVATION` | no                                | contenido aprobado, todavía sin vigencia operativa                                         |
| `ACTIVE`                      | sí                                | versión vigente dentro de coordenada, ambiente y ventana declarados                        |
| `SUSPENDED`                   | no                                | versión temporalmente bloqueada por riesgo, investigación o incompatibilidad               |
| `SUPERSEDED`                  | no                                | reemplazada para decisiones nuevas por otra versión explícita                              |
| `RETIRED`                     | no                                | retirada sin sustitución activa; disponible para reconstrucción histórica                  |
| `REJECTED`                    | no                                | propuesta descartada con motivo y evidencia conservados                                    |
| `INVALIDATED`                 | no                                | versión cuya integridad, autoridad o contenido quedó comprometido; exige bloqueo inmediato |

Los estados específicos ya aprobados en diccionario, excepciones y cola se mapearán sin perder su semántica. Por ejemplo, `APPROVED_ACTIVE` corresponde al estado unificado `ACTIVE`, pero conserva su nombre de origen en la evidencia histórica.

#### 10. Transiciones de ciclo de vida

```text
DRAFT
→ APPROVED_PENDING_ACTIVATION | REJECTED

APPROVED_PENDING_ACTIVATION
→ ACTIVE | SUSPENDED | REJECTED

ACTIVE
→ SUSPENDED | SUPERSEDED | RETIRED | INVALIDATED

SUSPENDED
→ ACTIVE | SUPERSEDED | RETIRED | INVALIDATED
```

Reglas:

1. `SUPERSEDED`, `RETIRED`, `REJECTED` e `INVALIDATED` son terminales para esa versión;
2. reactivar una definición terminal requiere otra versión que declare procedencia;
3. toda transición valida estado esperado y autoridad;
4. una transición repetida con la misma clave idempotente devuelve el resultado ya registrado;
5. una transición incompatible no se corrige por orden de llegada;
6. activar una versión no modifica registros históricos;
7. invalidar una versión bloquea nuevas decisiones y abre evaluación de impacto, pero no borra efectos previos;
8. ningún estado se infiere por ausencia de fecha o por no encontrar una versión en caché.

#### 11. Vigencia y activación atómica

Toda versión ejecutable deberá declarar:

```text
approved_at
approved_by_authority
effective_from
effective_to
activation_scope
activation_environment
activation_event_id
```

Reglas:

1. aprobación y activación son decisiones distintas;
2. la activación deberá cambiar de forma atómica el conjunto efectivo aplicable a una coordenada;
3. no puede existir una ventana en la que una evaluación mezcle dependencias del conjunto anterior y del nuevo;
4. las operaciones iniciadas antes del cambio conservan su conjunto fijado o se cancelan y reevalúan según el contrato de transición;
5. `effective_to` es exclusivo para decisiones nuevas y no altera la interpretación histórica;
6. el reloj de aplicación se declara en UTC y la presentación local no cambia la vigencia;
7. una fecha futura no convierte la versión en activa antes del evento de activación válido;
8. el mecanismo físico de coordinación pertenece a `DATA-NORM-ARC-011`.

#### 12. Modos de compatibilidad y coexistencia

| Modo                     | Conducta                                                                                                  |
| ------------------------ | --------------------------------------------------------------------------------------------------------- |
| `ACTIVE_ONLY`            | una sola versión atiende decisiones nuevas y derivaciones vigentes                                        |
| `DUAL_EVALUATION_SHADOW` | la versión candidata evalúa en sombra, sin mutar ni alterar respuestas, para comparar paridad e impacto   |
| `HISTORICAL_READ_ONLY`   | la versión anterior se usa únicamente para interpretar resultados o snapshots creados durante su vigencia |
| `REPLAY_ONLY`            | la versión se carga solo dentro de un replay controlado, aislado de decisiones nuevas                     |
| `INCOMPATIBLE_BLOCKED`   | no se permite comparar, mezclar ni continuar hasta resolver migración o compatibilidad                    |

Reglas:

1. no existe dual write implícito;
2. `DUAL_EVALUATION_SHADOW` no emite efectos empresariales, eventos funcionales ni correcciones;
3. el resultado en sombra se vincula al resultado activo y se minimiza como evidencia de comparación;
4. una versión histórica nunca recupera autoridad por ser la única disponible en un cliente;
5. cualquier coexistencia declara inicio, fin, owner, corpus, métricas y puerta de salida;
6. la transición operativa y los aliases temporales pertenecen a `SUPA-TRANS-006`, `SUPA-TRANS-007` y `DATA-NORM-TRANS-*` aplicables.

#### 13. Procedencia del algoritmo

Toda evaluación ejecutada deberá poder atribuirse a:

```text
algorithm_key
algorithm_version
artifact_identity
artifact_digest
source_revision_or_commit
runtime_contract_version
language_profile
unicode_version
tokenizer_version
catalog_version_set
configuration_digest
```

Reglas:

1. un mismo `algorithm_version` no podrá señalar artefactos con digests distintos;
2. locale, Unicode, tokenizer, stopwords, aliases, diccionario, ranking y configuración forman parte de la procedencia cuando afecten el resultado;
3. el ambiente no modifica semántica mediante defaults locales;
4. una dependencia externa no determinista deberá capturarse mediante versión o evidencia inmutable, o la evaluación quedará bloqueada;
5. una salida de modelo, servicio lingüístico o proveedor no constituye algoritmo canónico sin contrato versionado;
6. el registro de despliegue deberá poder demostrar qué artefacto ejecutó cada resultado;
7. la selección de repositorio, servicio o capa ejecutora pertenece a `DATA-NORM-ARC-011`.

#### 14. Clases cerradas de evento de auditoría

| Evento lógico                            | Finalidad                                                                              |
| ---------------------------------------- | -------------------------------------------------------------------------------------- |
| `RULE_VERSION_PROPOSED`                  | registrar la propuesta inmutable y sus dependencias                                    |
| `RULE_VERSION_APPROVED`                  | registrar autoridad, evidencia y aprobación sin activar                                |
| `RULE_VERSION_ACTIVATED`                 | fijar vigencia, scope, ambiente y conjunto efectivo                                    |
| `RULE_VERSION_SUSPENDED`                 | bloquear decisiones nuevas conservando causa e impacto                                 |
| `RULE_VERSION_SUPERSEDED`                | enlazar versión reemplazada y reemplazante                                             |
| `RULE_VERSION_RETIRED`                   | retirar la versión de decisiones nuevas                                                |
| `RULE_EVALUATED`                         | registrar resultado lógico de una evaluación                                           |
| `RULE_MUTATION_COMMITTED`                | confirmar una mutación persistida y su expectativa de concurrencia                     |
| `RULE_DERIVATION_MATERIALIZED`           | confirmar una representación derivada vinculada a fuente y versión                     |
| `RULE_BLOCK_OR_REVIEW_EMITTED`           | registrar preservación, bloqueo, conflicto, revisión o escalamiento                    |
| `RULE_REPLAY_OR_RECONCILIATION_RECORDED` | documentar replay, comparación de versiones o reconciliación sin ocultar diferencias   |
| `RULE_COMPENSATION_OR_ROLLBACK_RECORDED` | registrar compensación o rollback técnico conservando la decisión y el efecto original |

Una implementación podrá almacenar varios eventos en una misma transacción, pero no fusionará semánticas ni omitirá cuál ocurrió.

#### 15. Contrato lógico mínimo de auditoría

Todo registro aplicable deberá poder expresar:

```text
audit_event_id
logical_operation_id
attempt_id
correlation_id
causation_id
event_kind
event_time
recorded_at
actor_or_service_identity
authorization_context
reason_code
policy_coordinate
entity_type
entity_id
source_field_coordinate
source_value_version_or_hash
before_value_reference_or_hash
after_value_reference_or_hash
requested_operation
resolved_version_set
version_set_digest
algorithm_provenance
idempotency_key
idempotency_payload_digest
expected_source_version_or_hash
outcome
outcome_reason
review_case_or_decision_reference
propagation_or_transition_reference
environment
```

Reglas:

1. los campos no aplicables se declaran de forma explícita y no se omiten por conveniencia;
2. `logical_operation_id` permanece estable entre reintentos;
3. `attempt_id` distingue intentos técnicos sin crear otra decisión lógica;
4. `correlation_id` agrupa el proceso de extremo a extremo;
5. `causation_id` identifica el evento que originó el actual;
6. `recorded_at` no sustituye el momento efectivo del hecho;
7. toda mutación persistida conserva la expectativa usada para evitar escritura sobre una versión obsoleta;
8. toda evidencia sensible se referencia bajo el modelo de minimización.

#### 16. Resultados cerrados de evaluación

| Resultado                     | Significado                                                                                |
| ----------------------------- | ------------------------------------------------------------------------------------------ |
| `APPLIED_CHANGE`              | una operación autorizada produjo y confirmó un cambio                                      |
| `NO_CHANGE_ALREADY_CANONICAL` | la entrada ya satisfacía la versión efectiva; no hubo mutación                             |
| `DERIVED`                     | se produjo una representación separada sin modificar la fuente                             |
| `PRESERVED`                   | la política ordenó conservar el valor o representación                                     |
| `NOT_APPLICABLE`              | la regla no corresponde a la coordenada evaluada                                           |
| `BLOCKED_POLICY`              | falta política, versión, autoridad, vigencia, clase, fuente o representación compatible    |
| `BLOCKED_CONFLICT`            | dos decisiones o dependencias aplicables son incompatibles                                 |
| `REVIEW_REQUIRED`             | el valor se conserva y se requiere el proceso de `DATA-NORM-ARC-007`                       |
| `ESCALATED_STRUCTURAL`        | el problema pertenece a estructura, identidad, unicidad, integración o transición          |
| `FAILED_TECHNICAL`            | la ejecución no pudo completar el efecto; no se presenta como decisión empresarial exitosa |

`FAILED_TECHNICAL` no modifica el resultado lógico aprobado ni autoriza reintentar con otra versión. El reintento conservará la misma operación lógica y revalidará precondiciones.

#### 17. Clases de retención lógica

| Clase                        | Contenido                                                                              | Obligación lógica                                                                              |
| ---------------------------- | -------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------- |
| `GOVERNANCE_IMMUTABLE`       | versiones, aprobaciones, estados, supersesiones, invalidaciones y decisiones humanas   | conservación íntegra y aditiva mientras sea necesario interpretar reglas y efectos             |
| `MUTATION_EVIDENCE`          | antes, después, motivo, actor, expectativa, resultado y reversibilidad de una mutación | conservar evidencia suficiente para investigación, reconciliación y rollback                   |
| `DERIVATION_REPRODUCIBILITY` | fuente o hash, versión, algoritmo y huella de salida de una derivación                 | permitir verificar vigencia, recomputación y paridad                                           |
| `OPERATIONAL_DIAGNOSTIC`     | intentos, latencia, error técnico, retry y metadatos de ejecución                      | retención limitada por finalidad, sin convertirse en autoridad canónica                        |
| `SENSITIVE_REFERENCE`        | referencias protegidas a personales, legales, externos, secretos, firmas o evidencia   | acceso restringido, minimización y conservación conforme a finalidad y gobierno de información |

La duración, archivado y eliminación física se definirán en la arquitectura de información y transición aplicable. La falta de plazo físico no permite eliminar evidencia necesaria ni conservar datos sensibles indefinidamente por defecto.

#### 18. Niveles de reproducibilidad

| Nivel                      | Condición                                                                                                             |
| -------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| `FULL_REPLAYABLE`          | entrada, contexto, versiones, algoritmo y dependencias pueden reproducirse en un entorno controlado                   |
| `REFERENCE_REPLAYABLE`     | la entrada completa permanece en una evidencia protegida e inmutable accesible mediante referencia                    |
| `DECISION_RECONSTRUCTABLE` | por privacidad o retención no se conserva la entrada completa, pero hashes, contexto y versiones explican la decisión |

Reglas:

1. cada familia de evento declara su nivel;
2. `DECISION_RECONSTRUCTABLE` no se presenta como replay exacto;
3. una mutación crítica deberá alcanzar `FULL_REPLAYABLE` o `REFERENCE_REPLAYABLE` salvo prohibición legal documentada;
4. los secretos no se vuelven replayables mediante exposición de su valor;
5. un hash sin metadatos de algoritmo y contexto no demuestra reproducibilidad;
6. toda degradación de nivel queda auditada con motivo, autoridad y fecha.

#### 19. Valores, consultas y evidencia sensible

1. El valor original completo solo se almacena en la traza cuando sea necesario, autorizado y protegido.
2. Personas, direcciones, nombres legales, payloads externos, secretos, firmas, tokens y material probatorio utilizarán referencias protegidas o hashes cuando el contenido no sea necesario.
3. El hash deberá declarar algoritmo, canonicalización previa permitida, salt o clave cuando aplique y versión.
4. No se calculará una huella que convierta un secreto de baja entropía en dato enumerable.
5. Consultas de búsqueda sensibles no se registrarán completas por defecto.
6. Los fragmentos visibles y notas humanas no se convierten en evidencia autorizada sin procedencia.
7. El masking deberá permitir distinguir eventos sin revelar el valor.
8. Una exportación, métrica o panel no podrá reconstruir el corpus original.
9. El derecho de consulta de auditoría se separará del derecho de ejecutar, aprobar o modificar reglas.
10. VITAL tendrá política y almacenamiento propios.

#### 20. Semántica temporal

Toda auditoría distinguirá, cuando aplique:

```text
observed_at
requested_at
evaluated_at
effect_committed_at
effective_from
effective_to
recorded_at
```

Reglas:

1. `observed_at` describe cuándo se observó la entrada o señal;
2. `requested_at` identifica el inicio de la operación lógica;
3. `evaluated_at` fija cuándo se resolvió el conjunto de versiones;
4. `effect_committed_at` existe solo cuando el efecto fue confirmado;
5. `effective_from` y `effective_to` pertenecen a la vigencia normativa;
6. `recorded_at` describe la incorporación de la evidencia al registro;
7. los tiempos no se sustituyen por una única fecha de creación;
8. relojes locales se convierten a UTC conservando zona original cuando sea relevante;
9. una entrega tardía de auditoría no cambia la hora efectiva del hecho.

#### 21. Modelo canónico de idempotencia

La idempotencia se expresa mediante dos garantías complementarias:

```text
same logical input
+ same policy coordinate
+ same resolved version set
+ same requested operation
=
same logical outcome
```

```text
reapply an already committed logical operation
=
return prior committed outcome without a second business effect
```

La primera garantía cubre determinismo. La segunda cubre reintentos, concurrencia y entrega al menos una vez.

#### 22. Construcción de clave de idempotencia

La clave lógica deberá incluir o vincular de manera estable:

```text
operation_kind
+ actor_or_service_scope
+ target_entity_type
+ target_entity_id
+ source_field_coordinate
+ source_value_version_or_hash
+ requested_operation
+ version_set_digest
+ business_correlation_or_command_id
```

Reglas:

1. la clave no se deriva únicamente del valor textual;
2. el payload completo y precondiciones producen `idempotency_payload_digest`;
3. la misma clave y el mismo digest reutilizan el resultado previo;
4. la misma clave con digest distinto produce `BLOCKED_CONFLICT` con motivo `IDEMPOTENCY_PAYLOAD_CONFLICT` y bloquea el efecto;
5. una nueva versión de fuente o política crea otra operación lógica o exige reevaluación explícita;
6. el cliente no podrá escoger una clave global que mezcle entidades o scopes;
7. el almacenamiento y expiración física de claves dependerán del tipo de operación y retención aplicable;
8. una clave expirada físicamente no elimina la obligación de detectar un efecto empresarial ya confirmado.

#### 23. Clases de operación idempotente

| Clase                               | Garantía requerida                                                                                                  |
| ----------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| `PURE_EVALUATION`                   | misma entrada y versiones producen mismo resultado y huella, sin efectos persistidos                                |
| `PERSISTED_MUTATION`                | un solo cambio confirmado; reintento devuelve el resultado previo o no operación verificable                        |
| `DERIVATION_MATERIALIZATION`        | una sola derivación vigente por fuente, representación y versión; recomputación compatible conserva la misma huella |
| `RULE_LIFECYCLE_TRANSITION`         | una transición de estado ocurre una vez sobre el estado esperado                                                    |
| `REVIEW_DECISION_RECORDING`         | una resolución lógica inmutable; reintentos no crean otra decisión ni alteran la anterior                           |
| `PROPAGATION_OR_TRANSITION_COMMAND` | cada destino registra efecto individual y reanudable; no se repiten destinos ya confirmados                         |

Una operación compuesta tendrá una operación raíz y efectos hijos idempotentes. El éxito parcial no se presentará como éxito total y conservará los destinos pendientes o fallidos.

#### 24. Reintentos y resultados

1. Un reintento conservará `logical_operation_id`, `idempotency_key`, payload digest y conjunto de versiones.
2. Cada intento tendrá `attempt_id`, inicio, fin y resultado técnico propios.
3. Una respuesta perdida no origina otra mutación.
4. Un timeout no implica que el efecto no ocurrió; antes de repetir se consultará el resultado lógico.
5. Un error transitorio no autoriza cambiar de versión, locale, catálogo o algoritmo.
6. Un error permanente se registra como `FAILED_TECHNICAL` o bloqueo, según corresponda.
7. Un retry después de cambio de fuente o política deberá reevaluar y no reutilizar ciegamente el resultado anterior.
8. La capa cliente no podrá simular idempotencia ocultando errores mientras el servidor ejecuta efectos múltiples.
9. Los jobs conservarán cursores o destinos confirmados para reanudar sin reiniciar el lote completo.

#### 25. Concurrencia y entrada obsoleta

Toda mutación o materialización deberá validar:

```text
expected_source_version_or_hash
expected_policy_coordinate
expected_version_set_digest
expected_current_state
```

Reglas:

1. si la fuente cambió después de la evaluación, el efecto queda bloqueado como entrada obsoleta;
2. si cambió el conjunto efectivo de versiones, se requiere una nueva evaluación;
3. dos operaciones concurrentes sobre la misma fuente no se resuelven por último escritor;
4. una transición de regla valida el estado esperado;
5. dos cierres de revisión incompatibles producen conflicto de versión;
6. una derivación vieja no sobrescribe otra producida desde una fuente más reciente;
7. una copia offline revalida fuente, política, autoridad y vigencia antes de sincronizar;
8. la estrategia física de locking u optimistic concurrency pertenece a `DATA-NORM-ARC-011`.

#### 26. Determinismo y fuentes de no determinismo

Quedan prohibidos como dependencias implícitas:

- locale del sistema operativo, navegador, proceso o base de datos;
- versión Unicode no declarada;
- orden físico de filas o catálogos;
- hora actual usada para seleccionar una regla sin vigencia registrada;
- aleatoriedad no fijada;
- respuesta mutable de un proveedor sin versión o evidencia;
- caché no identificada;
- configuración local fuera del digest;
- orden de concurrencia usado para resolver conflictos;
- modelo lingüístico o heurística sin contrato y versión;
- primer resultado de búsqueda usado como verdad.

Si una operación depende de una fuente que no puede fijarse, se conserva el valor y se produce bloqueo o revisión. No se registra un resultado como determinista cuando solo fue repetible accidentalmente.

#### 27. Replay, verificación y reconciliación

Un replay controlado deberá declarar:

```text
replay_id
source_event_or_decision_set
source_snapshot_or_reference
version_set_digest
algorithm_provenance
replay_environment
expected_outcomes
actual_outcomes
difference_classification
```

Reglas:

1. un replay no modifica producción;
2. una versión `REPLAY_ONLY` no participa en decisiones nuevas;
3. las diferencias se clasifican como cambio esperado de versión, deriva de artefacto, dato distinto, configuración distinta o defecto;
4. una igualdad de salida con distinta procedencia no demuestra paridad completa;
5. la reconciliación no sobrescribe evidencia para hacerla coincidir;
6. las diferencias críticas generan caso, incidente o tarea propietaria;
7. los corpus de `DATA-NORM-ARC-003` a `008` se reutilizan con versiones y resultados esperados fijados;
8. la ejecución de dry-run y comparación masiva pertenece a `DATA-NORM-TRANS-001`, `DATA-NORM-TRANS-002` y `SUPA-TRANS-009`.

#### 28. Supersesión, rollback lógico y corrección

1. Una versión nueva declara qué versión supersede y por qué.
2. Superseder no elimina ni reescribe evaluaciones anteriores.
3. El rollback lógico activa una versión anterior compatible o una versión correctiva nueva mediante otro evento gobernado.
4. Una versión anterior no se reactiva si su evidencia, artefacto o dependencias ya no son compatibles.
5. El rollback de código no cambia por sí solo la versión normativa activa.
6. Una compensación de datos conserva el efecto original, el efecto compensatorio y la relación causal.
7. Una decisión humana incorrecta se corrige mediante una revisión vinculada, no mediante edición.
8. Un error administrativo se rectifica de forma aditiva con antes, después, actor y motivo.
9. Las filas ya transformadas no se revierten desde esta tarea; requieren transición, dry-run y rollback operativo.
10. Ningún rollback borra evidencia de un resultado que existió.

#### 29. Auditoría de búsqueda, comparación y ranking

Toda búsqueda gobernada deberá poder demostrar, según finalidad y minimización:

- consulta protegida o huella compatible;
- perfil, locale y versión;
- scope y filtros autorizados;
- representaciones consultadas;
- modo principal de coincidencia;
- motivos secundarios;
- tupla de ranking y versión;
- fuente o snapshot de cada resultado;
- condición histórica o inactiva;
- versión del corpus o índice;
- resultado degradado, bloqueo o fallback declarado.

Reglas:

1. no se registra la clave completa si permite reconstruir el dato;
2. un cambio de ranking crea otra versión;
3. la paginación conserva el mismo conjunto de versiones durante el cursor;
4. un cursor obsoleto falla o reinicia explícitamente; no mezcla páginas;
5. la auditoría de búsqueda no se convierte en perfilado indiscriminado de personas;
6. una coincidencia no crea evidencia de identidad ni regla de corrección;
7. las obligaciones de `TREQ-DATA-123` a `TREQ-DATA-142` deberán poder demostrarse mediante este contrato.

#### 30. Auditoría de cola y decisiones humanas

1. Cada revisión de `DATA-NORM-ARC-007` conserva caso, revisión, evidencia, asignaciones, estados, SLA, decisión y relaciones de supersesión.
2. La resolución cerrada es inmutable.
3. La aprobación humana no activa por sí sola una entrada de diccionario, excepción, política o búsqueda.
4. La incorporación a un catálogo crea una versión y evento separados.
5. La materialización sobre datos crea otra operación idempotente y otra evidencia.
6. Rechazo, preservación, solicitud de evidencia, diferimiento y escalamiento también se auditan.
7. Un reintento de cierre devuelve la resolución previa; un resultado distinto produce conflicto.
8. Los actores se registran por identidad estable y función ejercida, no solo por nombre visible.
9. Los valores sensibles permanecen bajo referencias protegidas.

#### 31. Fuentes, copias, snapshots y propagación

1. La fuente propietaria y cada copia o snapshot conservan versiones de valor distintas.
2. Una mutación de fuente no se confunde con la resincronización de sus copias.
3. Cada destino de propagación registra estado, entrada esperada, resultado, intento y causalidad.
4. Un snapshot inmutable no recibe propagación retroactiva.
5. Una copia sincronizable no ejecuta una regla local diferente.
6. Un override aprobado conserva su propia vigencia y versión.
7. Una propagación parcial no se presenta como completada.
8. Un reintento omite destinos confirmados y revalida los pendientes.
9. El orden técnico, eventos y ownership de ejecución pertenecen a `DATA-NORM-ARC-011` y `DATA-NORM-TRANS-008`.

#### 32. Valores externos e integraciones

1. Un original externo conserva payload, procedencia, identificador del proveedor, momento y versión de contrato cuando corresponda.
2. El mapeo interno tiene versión propia y no sobrescribe el original.
3. Una firma, checksum, referencia o clave de idempotencia externa se preserva exactamente.
4. Un webhook repetido utiliza la identidad externa y el contrato interno sin duplicar efectos.
5. Dos eventos externos con el mismo identificador y payload distinto producen conflicto.
6. Una nueva versión de mapeo no reinterpreta historia silenciosamente.
7. Los detalles de persistencia y privacidad externa pertenecen a `DATA-NORM-ARC-012`.
8. La traza interna no expondrá secretos ni payload completo cuando no sea necesario.

#### 33. Seguridad, autorización e integridad de la auditoría

1. Crear, consultar, exportar, aprobar, activar, suspender, retirar y corregir evidencias son acciones diferenciadas.
2. El acceso se limita por dominio, finalidad, sensibilidad, territorio y función.
3. Ningún actor podrá borrar una decisión o mutación para ocultar un error.
4. Los registros de gobierno y decisión deberán ser append-only a nivel lógico.
5. Toda rectificación tendrá evento, actor, motivo y relación con el registro rectificado.
6. El contenido deberá tener digest verificable y procedencia de artefacto.
7. Una discrepancia de digest produce `INVALIDATED` o incidente, no reparación silenciosa.
8. Los administradores técnicos no adquieren autoridad empresarial por operar infraestructura.
9. Las métricas agregadas no sustituirán la evidencia individual exigida para casos críticos.
10. La implementación física de integridad, cifrado, firma y retención pertenece a las tareas propietarias de seguridad y datos.

#### 34. Paridad entre capas

Para la misma operación lógica, entrada, coordenada y versiones, aplicación, servicio de dominio, RPC, Edge Function, job y defensa de base deberán coincidir en:

- regla y versión seleccionadas;
- conjunto efectivo y digest;
- clasificación de tokens o componentes;
- resultado cerrado;
- valor o huella de salida;
- bloqueo, revisión o escalamiento;
- clave de idempotencia y payload digest;
- expectativa de concurrencia;
- correlación y causación;
- ausencia de efectos duplicados.

Ninguna capa podrá:

- cambiar una versión por fallback local;
- omitir auditoría porque otra capa también registra;
- crear otra operación lógica para cada retry;
- considerar éxito una escritura sin confirmación;
- reconstruir el valor sensible desde logs;
- corregir una traza para ocultar deriva;
- aplicar una versión de Vento OS a VITAL.

La autoridad ejecutora y la estrategia para evitar auditoría duplicada serán definidas por `DATA-NORM-ARC-011`.

#### 35. Ejemplos normativos

| Escenario                                                             | Resultado obligatorio                                                                                  |
| --------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `harina de maiz` evaluada dos veces con el mismo conjunto             | mismo resultado, mismas reglas y misma huella lógica                                                   |
| la primera mutación se confirma y la respuesta se pierde              | el retry devuelve `APPLIED_CHANGE` previo; no vuelve a escribir ni propagar                            |
| la misma clave llega con otro valor o versión                         | `IDEMPOTENCY_PAYLOAD_CONFLICT`; ningún efecto                                                          |
| el valor fuente cambia entre evaluación y escritura                   | entrada obsoleta; conservar el valor nuevo y reevaluar                                                 |
| se activa un diccionario nuevo mientras una operación está en curso   | la operación conserva su conjunto fijado o se cancela explícitamente; no mezcla versiones              |
| `Maíz` ya cumple la regla activa                                      | `NO_CHANGE_ALREADY_CANONICAL`, sin mutación ni evento duplicado                                        |
| se materializa `SEARCH_ACCENT_KEY` dos veces                          | una derivación vigente con la misma fuente y versión; recomputación compatible produce la misma huella |
| un ranking cambia por código distinto sin nueva versión               | deriva no conforme y evento de integridad                                                              |
| una regla activa cambia de contenido sin cambiar identificador        | discrepancia de digest; versión invalidada o despliegue bloqueado                                      |
| un revisor intenta cerrar dos veces el mismo caso con igual resultado | se reutiliza la resolución existente                                                                   |
| el segundo cierre propone otro resultado                              | conflicto de estado o payload; la primera decisión permanece inmutable                                 |
| una propagación alcanza tres de cinco destinos                        | éxito parcial con tres destinos confirmados y dos pendientes; no se declara completada                 |
| un snapshot histórico se consulta con una regla retirada              | interpretación mediante `HISTORICAL_READ_ONLY` o `REPLAY_ONLY`; no autoridad para decisiones nuevas    |
| se revierte código pero no la activación normativa                    | inconsistencia bloqueante hasta alinear artefacto y versión                                            |
| un secreto participa en validación                                    | registro mínimo sin valor ni clave de búsqueda reversible                                              |
| un webhook externo se repite                                          | misma operación lógica y efecto único; payload distinto con el mismo identificador produce conflicto   |
| una búsqueda paginada atraviesa una activación de versión             | cursor fijado a la versión original o reinicio explícito; nunca páginas mezcladas                      |
| una coincidencia exacta sugiere posible duplicado                     | auditoría de búsqueda solamente; identidad y fusión permanecen fuera de alcance                        |

#### 36. Conductas no conformes

Quedan prohibidas:

1. editar el contenido de una versión activa;
2. resolver versiones mediante `latest` implícito;
3. reutilizar un número o identificador de versión con otro digest;
4. activar parcialmente un conjunto de dependencias;
5. mezclar versiones entre consulta, índice, valor y ranking;
6. reintentar con otra política para evitar un error;
7. usar la misma clave idempotente con payload diferente;
8. deduplicar operaciones únicamente por el texto normalizado;
9. aceptar último escritor ante fuente o estado obsoleto;
10. registrar solo éxito y omitir bloqueos, preservaciones, revisiones o fallos;
11. sobrescribir eventos, decisiones o evidencia;
12. registrar secretos, tokens, firmas o consultas sensibles completas sin necesidad y protección;
13. declarar replay completo cuando solo existe una huella;
14. reactivar una versión terminal sin crear otra versión;
15. usar rollback de código como rollback normativo automático;
16. modificar snapshots históricos por una regla nueva;
17. ocultar éxito parcial de propagación;
18. permitir tokenizers, catálogos, locales o configuración no incluidos en la procedencia;
19. utilizar auditoría o ranking como autorización de identidad, unicidad o fusión;
20. aplicar la política transversal de Vento OS a VITAL;
21. introducir cambios físicos desde esta tarea documental.

#### 37. Corpus mínimo de conformidad

El corpus deberá cubrir, como mínimo:

1. todas las familias de registro y eventos lógicos;
2. los ocho estados y cada transición permitida o prohibida;
3. activación inmediata, futura, suspendida, supersedida, retirada e invalidada;
4. conjuntos de versiones completos, incompletos, incompatibles y con digest diferente;
5. artefactos iguales y distintos bajo el mismo identificador;
6. las diez salidas cerradas;
7. cada clase de operación idempotente;
8. retries antes, durante y después de confirmación;
9. respuesta perdida, timeout y error transitorio;
10. misma clave con mismo payload y con payload diferente;
11. concurrencia sobre valor, derivación, transición y caso de revisión;
12. fuente o política obsoleta;
13. éxito total, parcial y compensación;
14. `FULL_REPLAYABLE`, `REFERENCE_REPLAYABLE` y `DECISION_RECONSTRUCTABLE`;
15. valores ordinarios, marcas, nombres legales, personas, externos, identificadores y secretos;
16. búsqueda, ranking, cursor y cambio de versión entre páginas;
17. copias sincronizables, overrides y snapshots inmutables;
18. webhook, job y lote reanudable;
19. rectificación aditiva y discrepancia de digest;
20. paridad entre capas, ambientes y artefactos;
21. ausencia de efectos de identidad, unicidad o fusión;
22. frontera separada de VITAL.

El corpus deberá reutilizar los escenarios de `TREQ-DATA-037` a `TREQ-DATA-142` que involucren versiones, idempotencia, auditoría, revisión, búsqueda, fuentes y paridad.

#### 38. Hallazgos y carryovers

| ID               | Decisión o brecha                                                  | Resultado de esta tarea                                                                    | Propietario siguiente                                             |
| ---------------- | ------------------------------------------------------------------ | ------------------------------------------------------------------------------------------ | ----------------------------------------------------------------- |
| `DN-ARC-009-H01` | versiones y reglas podían resolverse mediante estado mutable       | identidad estable, digest, estados y conjunto efectivo aprobados                           | `DATA-NORM-ARC-011`; `SUPA-TRANS-006`; `DATA-NORM-TRANS-004`      |
| `DN-ARC-009-H02` | aprobación podía confundirse con activación                        | separación temporal y activación atómica aprobadas                                         | `DATA-NORM-ARC-011`; `DATA-NORM-TRANS-005`                        |
| `DN-ARC-009-H03` | no existía contrato único de auditoría                             | seis familias, doce eventos y contrato mínimo aprobados                                    | `DATA-NORM-ARC-011`; tareas de gobierno de información aplicables |
| `DN-ARC-009-H04` | retries y jobs podían duplicar cambios o propagaciones             | seis clases idempotentes, claves, digests y reanudación aprobados                          | `DATA-NORM-ARC-011`; `SUPA-TRANS-009`; `DATA-NORM-TRANS-006`      |
| `DN-ARC-009-H05` | concurrencia podía aplicar resultados sobre fuentes obsoletas      | expectativas de fuente, política y estado aprobadas                                        | `DATA-NORM-ARC-011`; `DATA-NORM-TRANS-005`; `DATA-NORM-TRANS-006` |
| `DN-ARC-009-H06` | helpers y ambientes podían compartir nombre con contenido distinto | procedencia de artefacto y digest obligatorios                                             | `DATA-NORM-ARC-011`; `SUPA-TRANS-013`; `SUPA-TRANS-014`           |
| `DN-ARC-009-H07` | auditoría podía exponer valores protegidos                         | minimización, referencias, niveles de reproducibilidad y acceso separado                   | `DATA-NORM-ARC-011`; `DATA-NORM-ARC-012`                          |
| `DN-ARC-009-H08` | búsqueda y ranking podían cambiar dentro de un cursor              | conjunto fijado, cursor versionado y replay aprobado                                       | `DATA-NORM-ARC-011`; `SUPA-TRANS-007`; `SUPA-TRANS-009`           |
| `DN-ARC-009-H09` | decisiones humanas podían activarse o editarse silenciosamente     | inmutabilidad y separación entre decisión, versión, activación y materialización aprobadas | `DATA-NORM-ARC-011`; `DATA-NORM-TRANS-004`; `DATA-NORM-TRANS-005` |
| `DN-ARC-009-H10` | rollback podía borrar o reinterpretar historia                     | rollback lógico y compensación aditiva aprobados                                           | `SUPA-TRANS-011`; `DATA-NORM-TRANS-008`                           |
| `DN-ARC-009-H11` | no existe aún persistencia ni autoridad ejecutora física           | contrato lógico completo aprobado; implementación reservada                                | `DATA-NORM-ARC-011`; tareas de transición aplicables              |
| `DN-ARC-009-H12` | auditoría podía confundirse con identidad o unicidad               | frontera absoluta mantenida                                                                | `DATA-NORM-ARC-010`; `DATA-NORM-TRANS-003`                        |

#### 39. Decisiones reservadas

| Decisión                                                        | Tarea propietaria                                              |
| --------------------------------------------------------------- | -------------------------------------------------------------- |
| identidad, scope de unicidad, colisiones y duplicados           | `DATA-NORM-ARC-010`                                            |
| capa ejecutora, APIs, persistencia, transacciones y precedencia | `DATA-NORM-ARC-011`                                            |
| originales, mapeos, evidencia y privacidad externa              | `DATA-NORM-ARC-012`                                            |
| dependencias y adaptación de consumidores                       | `SUPA-TRANS-003`; `SUPA-TRANS-007`; `SUPA-TRANS-014`           |
| tablas, columnas, índices, backfills y materialización          | `SUPA-TRANS-005`; `DATA-NORM-TRANS-004`; `DATA-NORM-TRANS-005` |
| compatibilidad y coexistencia técnica de versiones              | `SUPA-TRANS-006`; `DATA-NORM-TRANS-004`; `DATA-NORM-TRANS-005` |
| pruebas de transición, paridad, concurrencia e idempotencia     | `SUPA-TRANS-009`; `DATA-NORM-TRANS-009`                        |
| rendimiento, capacidad, seguridad y observabilidad física       | `SUPA-TRANS-010`                                               |
| rollback operativo, compensaciones y restauración               | `SUPA-TRANS-011`; `DATA-NORM-TRANS-008`                        |
| paridad entre ambientes y artefactos desplegados                | `SUPA-TRANS-013`; `SUPA-TRANS-014`                             |
| activación, observación y cierre del cambio                     | `DATA-NORM-TRANS-005` a `DATA-NORM-TRANS-009`                  |

#### 40. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

| ID              | Regla protegida                                                                                                     | Tipo                                     | Prioridad | Momento de implementación                          | Destino                                                             |
| --------------- | ------------------------------------------------------------------------------------------------------------------- | ---------------------------------------- | --------- | -------------------------------------------------- | ------------------------------------------------------------------- |
| `TREQ-DATA-143` | identificar cada regla y versión mediante claves estables, contenido inmutable y digest verificable                 | contractual + auditoría + regresión      | crítica   | registro canónico de reglas                        | `DATA-NORM-ARC-011`; `SUPA-TRANS-013`; `SUPA-TRANS-014`             |
| `TREQ-DATA-144` | fijar para cada evaluación el conjunto exacto de versiones y su digest, sin `latest` ni fallback implícito          | contractual + integración + regresión    | crítica   | resolución de políticas                            | `DATA-NORM-ARC-011`; `SUPA-TRANS-006`                               |
| `TREQ-DATA-145` | aplicar exactamente los ocho estados y sus transiciones cerradas                                                    | contractual + concurrencia + regresión   | crítica   | ciclo de vida de reglas                            | `DATA-NORM-ARC-011`; `DATA-NORM-TRANS-005`                          |
| `TREQ-DATA-146` | separar aprobación de activación y cambiar atómicamente el conjunto efectivo                                        | contractual + concurrencia + regresión   | crítica   | activación y cutover                               | `DATA-NORM-ARC-011`; `DATA-NORM-TRANS-005`                          |
| `TREQ-DATA-147` | respetar los cinco modos de compatibilidad y prohibir mezclas o dual write implícito                                | contractual + integración + migración    | crítica   | coexistencia de versiones                          | `SUPA-TRANS-006`; `DATA-NORM-TRANS-004`; `DATA-NORM-TRANS-005`      |
| `TREQ-DATA-148` | atribuir cada resultado a artefacto, digest, commit, runtime, locale, Unicode, tokenizer, catálogos y configuración | contractual + auditoría + regresión      | crítica   | procedencia de ejecución                           | `DATA-NORM-ARC-011`; `SUPA-TRANS-013`; `SUPA-TRANS-014`             |
| `TREQ-DATA-149` | emitir las seis familias de registro y doce eventos con el contrato lógico mínimo                                   | contractual + auditoría + integración    | crítica   | persistencia y observabilidad                      | `DATA-NORM-ARC-011`; tareas de gobierno de información              |
| `TREQ-DATA-150` | mantener versiones, decisiones y rectificaciones de forma aditiva, inmutable y verificable                          | seguridad + auditoría + regresión        | crítica   | integridad de auditoría                            | `DATA-NORM-ARC-011`; `DATA-NORM-ARC-012`                            |
| `TREQ-DATA-151` | distinguir exactamente los diez resultados, incluidos no cambio, preservación, bloqueo, revisión y fallo técnico    | contractual + integración + regresión    | crítica   | evaluador canónico                                 | `DATA-NORM-ARC-011`; `SUPA-TRANS-009`                               |
| `TREQ-DATA-152` | minimizar valores, consultas y evidencia sensible mediante referencias, hashes y masking no reversibles             | seguridad + privacidad + regresión       | crítica   | auditoría y acceso                                 | `DATA-NORM-ARC-011`; `DATA-NORM-ARC-012`                            |
| `TREQ-DATA-153` | conservar tiempos de observación, solicitud, evaluación, efecto, vigencia y registro sin colapsarlos                | contractual + auditoría + regresión      | alta      | modelo temporal                                    | `DATA-NORM-ARC-011`; `DATA-NORM-ARC-012`                            |
| `TREQ-DATA-154` | construir la clave idempotente con operación, actor, entidad, campo, fuente, acción, versiones y correlación        | idempotencia + contractual + regresión   | crítica   | operaciones mutantes y derivaciones                | `DATA-NORM-ARC-011`; `SUPA-TRANS-009`                               |
| `TREQ-DATA-155` | reutilizar el resultado con misma clave y payload y bloquear toda clave reutilizada con payload distinto            | idempotencia + seguridad + concurrencia  | crítica   | deduplicación de comandos                          | `DATA-NORM-ARC-011`; `SUPA-TRANS-009`                               |
| `TREQ-DATA-156` | cumplir las garantías específicas de las seis clases de operación idempotente                                       | idempotencia + integración + regresión   | crítica   | mutaciones, derivaciones, revisiones y propagación | `DATA-NORM-ARC-011`; `DATA-NORM-TRANS-006`; `SUPA-TRANS-009`        |
| `TREQ-DATA-157` | bloquear efectos cuando fuente, política, conjunto de versiones o estado esperado hayan cambiado                    | concurrencia + idempotencia + regresión  | crítica   | control optimista y sincronización                 | `DATA-NORM-ARC-011`; `DATA-NORM-TRANS-005`; `DATA-NORM-TRANS-006`   |
| `TREQ-DATA-158` | eliminar locale, tiempo, aleatoriedad, orden, caché, proveedor o configuración implícitos del resultado             | contractual + idempotencia + regresión   | crítica   | determinismo transversal                           | `DATA-NORM-ARC-011`; `SUPA-TRANS-009`; `SUPA-TRANS-014`             |
| `TREQ-DATA-159` | clasificar reproducibilidad, ejecutar replay controlado y explicar toda diferencia sin modificar producción         | auditoría + integración + regresión      | crítica   | corpus, replay y reconciliación                    | `DATA-NORM-TRANS-001`; `DATA-NORM-TRANS-002`; `DATA-NORM-TRANS-009` |
| `TREQ-DATA-160` | superseder, suspender, retirar, invalidar y revertir de forma lógica sin reescribir historia                        | contractual + migración + regresión      | crítica   | versionado y rollback                              | `DATA-NORM-ARC-011`; `SUPA-TRANS-011`; `DATA-NORM-TRANS-008`        |
| `TREQ-DATA-161` | auditar perfil, scope, versiones, modo, ranking, cursor y fuente de cada búsqueda sin exponer datos innecesarios    | seguridad + auditoría + experiencia      | crítica   | motor y API de búsqueda                            | `DATA-NORM-ARC-011`; `SUPA-TRANS-007`; `SUPA-TRANS-009`             |
| `TREQ-DATA-162` | conservar decisiones de revisión inmutables y separar decisión, versión, activación y materialización               | contractual + auditoría + idempotencia   | crítica   | cola y catálogos                                   | `DATA-NORM-ARC-011`; `DATA-NORM-TRANS-004`; `DATA-NORM-TRANS-005`   |
| `TREQ-DATA-163` | correlacionar capas, intentos, efectos y destinos y demostrar paridad sin auditoría o efectos duplicados            | integración + idempotencia + regresión   | crítica   | certificación transversal                          | `DATA-NORM-ARC-011`; `SUPA-TRANS-009`; `SUPA-TRANS-014`             |
| `TREQ-DATA-164` | ejecutar corpus integral de versiones, estados, auditoría, retries, concurrencia, seguridad, replay y VITAL         | unitaria + integración + E2E + regresión | crítica   | pruebas canónicas y transición                     | `DATA-NORM-ARC-011`; `DATA-NORM-TRANS-009`; `SUPA-TRANS-009`        |

El detalle canónico de cada requisito reside en el registro 04A actualizado hasta esta tarea.

#### 41. Criterios de integridad

La política se considera íntegra para esta etapa cuando:

1. define exactamente seis familias de registro lógico;
2. separa identidad estable de regla y versión inmutable;
3. fija un conjunto efectivo y digest para cada evaluación;
4. prohíbe `latest` y fallback implícitos;
5. define ocho estados y transiciones cerradas;
6. separa aprobación, activación y vigencia;
7. define cinco modos de compatibilidad;
8. atribuye el resultado a algoritmo, artefacto, configuración y versiones;
9. define doce eventos y un contrato mínimo de auditoría;
10. distingue diez resultados cerrados;
11. define cinco clases de retención lógica y tres niveles de reproducibilidad;
12. minimiza valores y consultas sensibles;
13. conserva tiempos de hecho, efecto, vigencia y registro;
14. define dos garantías complementarias de idempotencia;
15. construye claves por operación, entidad, fuente, acción, versiones y correlación;
16. bloquea la reutilización de clave con payload incompatible;
17. define seis clases de operación idempotente;
18. gobierna reintentos, timeouts, éxito parcial y reanudación;
19. bloquea fuente, política o estado obsoletos;
20. elimina no determinismo implícito;
21. define replay, reconciliación, supersesión y rollback lógico;
22. audita búsqueda, cola, copias, snapshots y externos sin confundirlos con fuente;
23. exige integridad aditiva, autorización y paridad entre capas;
24. impide identidad, unicidad o fusión desde la auditoría;
25. conserva VITAL fuera del alcance transversal;
26. no autoriza cambios físicos ni anticipa decisiones reservadas.

#### 42. Continuidad

```text
ÚLTIMA TAREA APROBADA
DATA-NORM-ARC-008 — Definir representación de búsqueda y comparación
        ↓
TAREA ACTUAL APROBADA
DATA-NORM-ARC-009 — Definir auditoría, versionado e idempotencia de reglas
        ↓
SIGUIENTE TAREA RESERVADA
DATA-NORM-ARC-010 — Definir estrategia de unicidad y detección de duplicados normalizados
```


### ✅ DATA-NORM-ARC-010 — Definir estrategia de unicidad y detección de duplicados normalizados

**Estado:** APROBADA
**Tarea anterior:** `DATA-NORM-ARC-009 — Definir auditoría, versionado e idempotencia de reglas` — APROBADA
**Tarea siguiente:** `DATA-NORM-ARC-011 — Definir capas de ejecución: aplicación, servicio de dominio, RPC y trigger defensivo`
**Tipo de tarea:** definición normativa de identidad empresarial, alcances de unicidad, detección de colisiones, expedientes de duplicidad, decisiones de supervivencia y fronteras de consolidación; sin DDL, DML, migraciones, backfills, correcciones de datos, fusiones, desactivaciones, reasignaciones, cambios de relaciones, constraints, índices, funciones, triggers, clientes, integraciones, configuración ni despliegues

#### 1. Objetivo

Definir la estrategia canónica mediante la cual Vento OS distinguirá identidad empresarial, unicidad permitida, coincidencia textual, colisión normalizada, homonimia legítima, par de ciclo de vida, candidato estructural y duplicado confirmado, sin convertir una representación de búsqueda en clave de identidad ni autorizar fusiones automáticas.

La estrategia deberá resolver cada regla de unicidad mediante una coordenada empresarial explícita; generar candidatos de duplicidad por etapas reproducibles; conservar evidencia positiva, negativa y relacional; tratar la similitud como señal y no como decisión; impedir que un score, un nombre o el primer resultado seleccione un registro sobreviviente; y exigir puertas cerradas antes de cualquier constraint, bloqueo, consolidación, reasignación o retiro futuro.

#### 2. Artefacto producido

```text
VENTO_NORMALIZED_UNIQUENESS_AND_DUPLICATE_GOVERNANCE_POLICY@1.0.0
```

| Propiedad                                      | Valor |
| ---------------------------------------------- | ----: |
| Conceptos de identidad y comparación separados |     6 |
| Clases de alcance de unicidad                  |     8 |
| Clases canónicas de colisión preservadas       |    10 |
| Etapas del pipeline de detección               |    12 |
| Dimensiones mínimas de evidencia               |    12 |
| Disposiciones cerradas de resolución           |    10 |
| Puertas previas a enforcement físico           |    14 |
| Requisitos de prueba nuevos                    |    26 |
| Cambios físicos autorizados                    |     0 |

#### 3. Fuentes canónicas consumidas

| Fuente                      | Decisión consumida                                                                                                                                      |
| --------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `01_PROTOCOLO.md`           | continuidad, una sola tarea, fase exclusivamente documental, preservación histórica y separación entre definición e implementación                      |
| `delivery-contract.json`    | identidad del artefacto y actualización integral del registro 04A al crear requisitos                                                                   |
| `active-sequence.json`      | `DATA-NORM-ARC-010` como tarea actual y `DATA-NORM-ARC-011` como siguiente tarea reservada                                                              |
| `DATA-NORM-AUD-001`         | universo textual, veinte índices con comparación o representación y prohibición de inferir política desde schema o tipo                                 |
| `DATA-NORM-AUD-003`         | marcas, siglas, unidades, razones sociales, personas, externos e identificadores protegidos frente a fusiones por clave comparativa                     |
| `DATA-NORM-AUD-004`         | taxonomía de diez resultados, cortes de productos, catálogo, categorías, jerarquías, UOM y personas, y evidencia relacional previa a una posible fusión |
| `DATA-NORM-AUD-005`         | separación entre corrección de forma, diccionario, revisión humana y resolución estructural o relacional                                                |
| `DATA-NORM-AUD-006`         | productores distribuidos, helpers, copias, snapshots, clientes y procesos externos que pueden divergir                                                  |
| `DATA-NORM-AUD-007`         | impacto de las colisiones sobre búsqueda, integraciones, relaciones, unicidad y consumidores                                                            |
| `DATA-NORM-ARC-001` y `002` | política por coordenada, clases semánticas, roles de representación y prohibición de derivar identidad desde texto                                      |
| `DATA-NORM-ARC-003` a `007` | reglas visibles, excepciones, diccionario y cola de revisión sin efectos estructurales automáticos                                                      |
| `DATA-NORM-ARC-008`         | siete representaciones, seis perfiles, nueve modos de coincidencia y ranking que recupera candidatos sin decidir identidad                              |
| `DATA-NORM-ARC-009`         | versiones inmutables, conjuntos efectivos, auditoría aditiva, resultados cerrados, idempotencia, concurrencia y replay                                  |
| Registro 04A vigente        | requisitos históricos, relaciones y secuencia del dominio `DATA` hasta `TREQ-DATA-164`                                                                  |

#### 4. Alcance y fronteras

Esta tarea define:

1. la separación normativa entre identidad, clave empresarial, política de unicidad, representación comparativa, colisión y duplicado;
2. la coordenada mínima de una política de unicidad;
3. ocho clases de alcance y su conducta conceptual;
4. el tratamiento de nulos, vacíos, valores parciales, desconocidos, temporales y externos;
5. la relación entre vigencia, estado, versión, supersesión y unicidad;
6. un pipeline cerrado de detección de candidatos;
7. las diez clases de colisión aprobadas por la auditoría;
8. la evidencia mínima positiva, negativa, estructural y relacional;
9. las disposiciones que puede producir una revisión de duplicidad;
10. las reglas para selección de registro de referencia o sobreviviente futuro;
11. las fronteras de consolidación, alias, redirección, historial, relaciones y rollback;
12. las puertas previas a cualquier enforcement físico;
13. las métricas, corpus y paridad exigibles;
14. la exclusión de VITAL de la política transversal de Vento OS.

Esta tarea no define:

- tablas, columnas, tipos, constraints, índices, extensiones, funciones, RPC, triggers, RLS o jobs;
- la capa que ejecutará cada comprobación;
- nombres físicos finales de claves o estructuras;
- un registro sobreviviente concreto para los casos auditados;
- correcciones, fusiones, desactivaciones, reasignaciones o backfills;
- migraciones de referencias ni crosswalks físicos;
- formas oficiales de valores externos ni reglas de integración;
- umbrales físicos de rendimiento o capacidad;
- activación de unicidad en producción;
- ninguna modificación de VITAL.

La ejecución física pertenece a `DATA-NORM-ARC-011`, `DATA-NORM-ARC-012`, `SUPA-TRANS-003`, `SUPA-TRANS-005` a `SUPA-TRANS-014` y `DATA-NORM-TRANS-001` a `DATA-NORM-TRANS-009`, según su propiedad.

#### 5. Principios obligatorios

1. **La identidad precede a la unicidad.** No se impone unicidad hasta definir qué entidad existe, qué la diferencia y dentro de qué alcance.
2. **La unicidad es una política empresarial.** Un índice o constraint es una implementación posible, no la definición de la regla.
3. **La coincidencia no demuestra identidad.** Valor exacto, forma, tildes, aliases, tokens, transliteración, similitud o ranking solo producen evidencia.
4. **El scope es parte de la regla.** Dominio, tipo, sede, padre, jerarquía, contexto, fuente, vigencia y estado no se omiten para aumentar coincidencias.
5. **La estructura prevalece sobre la etiqueta.** Cantidad, unidad, multiplicador, contexto y fuente no se reducen a una cadena visible.
6. **El historial no es duplicidad operativa por defecto.** Un registro inactivo, supersedido o histórico puede coexistir legítimamente.
7. **La homonimia entre capas es válida.** Insumo, preparación y venta pueden compartir nombre sin representar la misma entidad.
8. **La evidencia negativa pesa.** Diferencias funcionales, legales, temporales, relacionales o de procedencia pueden descartar una coincidencia fuerte.
9. **La decisión no se deriva de un score.** Ningún umbral, frecuencia, popularidad, orden físico o primer resultado confirma duplicidad.
10. **La fusión es una transición distinta.** Confirmar duplicidad no ejecuta consolidación ni define por sí solo el registro sobreviviente.
11. **Toda decisión es versionada y auditable.** Algoritmos, políticas, evidencia, actor, resultado y vigencia deberán quedar fijados.
12. **Toda operación es idempotente.** Repetir detección, revisión o transición con la misma entrada no crea casos ni efectos adicionales.
13. **La ambigüedad falla de forma cerrada.** Se conservan los registros y se exige revisión.
14. **VITAL permanece separado.** La coexistencia física no transfiere políticas de identidad o unicidad.

#### 6. Conceptos canónicos separados

| Concepto                       | Definición                                                                                                                                                                 | Autoridad permitida                                                           |
| ------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------- |
| `ENTITY_IDENTITY`              | continuidad estable de una entidad empresarial o técnica, representada por identificador inmutable y relaciones autorizadas                                                | vincular hechos y preservar historia; nunca se infiere únicamente desde texto |
| `BUSINESS_IDENTITY_COORDINATE` | conjunto de atributos estructurales y de alcance que distingue una entidad dentro de su dominio                                                                            | sustentar una política de unicidad después de aprobación explícita            |
| `UNIQUENESS_POLICY`            | regla versionada que declara qué combinación no puede coexistir bajo condiciones y vigencia determinadas                                                                   | evaluar conflicto y, tras superar puertas, habilitar enforcement físico       |
| `COMPARISON_REPRESENTATION`    | valor derivado para búsqueda, ordenamiento o generación de candidatos                                                                                                      | recuperar candidatos y explicar coincidencias                                 |
| `COLLISION_GROUP`              | conjunto reproducible de registros que coincide bajo una representación y scope declarados                                                                                 | abrir análisis; no declarar equivalencia                                      |
| `CONFIRMED_DUPLICATE_DECISION` | conclusión humana o contractual, versionada y respaldada por evidencia suficiente, de que registros distintos representan una misma identidad dentro del alcance aplicable | habilitar una transición posterior controlada; no ejecutarla automáticamente  |

Un identificador técnico estable puede ser único sin ser legible. Una clave empresarial puede ser compuesta y cambiar de representación sin cambiar identidad. Una representación comparativa puede colisionar legítimamente. Un duplicado confirmado conserva varios identificadores históricos hasta que una transición explícita resuelva sus referencias.

#### 7. Coordenada canónica de identidad y unicidad

Toda política deberá declarar como mínimo:

```text
dominio propietario
+ tipo de entidad
+ identidad técnica estable
+ atributos empresariales determinantes
+ scope territorial u organizacional
+ padre, camino o agregado cuando aplique
+ rol, capa o contexto funcional
+ fuente o emisor cuando aplique
+ estado y vigencia
+ versión de la política
```

Reglas:

1. el nombre físico de una tabla no define el dominio propietario;
2. una aplicación consumidora no redefine identidad;
3. una misma entidad puede tener múltiples nombres, códigos externos, snapshots y proyecciones;
4. una misma etiqueta puede identificar entidades distintas por padre, tipo, contexto o fuente;
5. una misma identidad puede conservar versiones históricas sin violar unicidad operativa;
6. un scope incompleto invalida la evaluación y produce bloqueo, no fallback global;
7. las claves de búsqueda quedan fuera de la coordenada de identidad salvo que un contrato técnico específico las declare como datos empresariales, nunca por conveniencia;
8. cualquier cambio de coordenada crea una versión nueva y exige volver a medir colisiones.

#### 8. Registro mínimo de política de unicidad

Cada entrada del registro lógico deberá declarar:

| Atributo                          | Obligación                                                           |
| --------------------------------- | -------------------------------------------------------------------- |
| `uniqueness_policy_key`           | identidad estable de la política                                     |
| `uniqueness_policy_version_id`    | versión inmutable y auditable                                        |
| dominio y entidad                 | propietario semántico exacto                                         |
| clase de alcance                  | una de las ocho clases aprobadas                                     |
| componentes                       | campos o atributos estructurales que participan                      |
| exclusiones                       | estados, roles, fuentes, capas o casos que no participan             |
| semántica de nulos                | conducta para ausente, desconocido, no aplicable y valor parcial     |
| semántica temporal                | intervalo, estado activo, supersesión e historia                     |
| representación permitida          | exacta, contractual o estructural; nunca una tolerancia implícita    |
| evidencia de autoridad            | decisión empresarial, legal, técnica o externa que sustenta la regla |
| propietario y steward             | responsables de significado y resolución de conflictos               |
| consumidores                      | productores, lectores, integraciones y procesos afectados            |
| modo de observación o enforcement | fase aprobada y conducta ante conflicto                              |
| versión de algoritmo              | conjunto efectivo y digest definidos en `DATA-NORM-ARC-009`          |
| corpus y métricas                 | positivos, negativos, colisiones, falsos positivos y rendimiento     |
| transición y rollback             | tratamiento de datos existentes y restauración segura                |
| vigencia                          | inicio, suspensión, supersesión y retiro                             |

La ausencia de cualquiera de estos atributos bloquea la activación de la política.

#### 9. Clases de alcance de unicidad

| Clase                         | Uso conceptual                                             | Ejemplo de alcance                                             | Restricción                                                |
| ----------------------------- | ---------------------------------------------------------- | -------------------------------------------------------------- | ---------------------------------------------------------- |
| `GLOBAL_IMMUTABLE_IDENTIFIER` | identificador técnico que no puede reutilizarse            | UUID o clave interna estable dentro del producto               | no deriva del nombre ni se recicla después de retiro       |
| `DOMAIN_ENTITY_SCOPE`         | clave empresarial única dentro de un dominio y tipo        | código de una entidad dentro de su dominio propietario         | no cruza tipos o dominios por compartir forma              |
| `TERRITORY_OR_ORG_SCOPE`      | unicidad dentro de empresa, sede, área, canal o territorio | categoría operativa dentro de una sede                         | el scope deberá formar parte de la evaluación              |
| `PARENT_OR_PATH_SCOPE`        | unicidad bajo padre o camino jerárquico                    | posición dentro de una estantería o ubicación                  | no usar únicamente etiqueta o nivel                        |
| `STRUCTURED_COMPONENT_SCOPE`  | unicidad por componentes funcionales                       | presentación por producto, cantidad, unidad, contexto y fuente | la etiqueta visible no participa como identidad suficiente |
| `ACTIVE_INTERVAL_SCOPE`       | no coexistencia durante un intervalo o estado operativo    | versión vigente de catálogo o regla activa                     | historia e inactivos pueden coexistir de forma controlada  |
| `SOURCE_OR_ISSUER_SCOPE`      | identificador único dentro de una fuente o emisor          | referencia de proveedor o sistema externo                      | exige emisor, tipo, ambiente y vigencia                    |
| `NON_UNIQUE_DISCOVERY_ONLY`   | campo deliberadamente no único usado para búsqueda         | nombre comercial, nombre personal o descripción                | nunca habilita constraint ni fusión por sí solo            |

Una política puede combinar scopes, pero deberá declarar la composición exacta. No existe unicidad global predeterminada para nombres, etiquetas, razones sociales, marcas, personas, direcciones o descripciones.

#### 10. Nulos, vacíos, desconocidos y claves parciales

1. `NULL`, cadena vacía, solo espacios, valor desconocido, valor no aplicable y valor pendiente son estados semánticos distintos.
2. Una normalización que convierta varios estados en la misma cadena no podrá usarse para unicidad.
3. Una clave parcial no se evalúa como si sus componentes ausentes coincidieran.
4. La ausencia de un componente obligatorio produce `BLOCKED_INCOMPLETE_IDENTITY_COORDINATE`.
5. Un placeholder como `N/A`, `SIN DEFINIR`, `0`, `1`, `PENDIENTE` o equivalente no se presume único ni canónico.
6. Los valores vacíos rechazados por reglas de presencia no se convierten en identidad compartida.
7. Los códigos temporales deberán declarar namespace, emisor, vigencia y estrategia de sustitución.
8. Una política deberá especificar si múltiples nulos son permitidos, prohibidos o excluidos; esa decisión no se infiere de la semántica física de PostgreSQL.
9. La corrección futura de un componente incompleto deberá revalidar toda la coordenada y sus conflictos.

#### 11. Estado, vigencia y temporalidad

La evaluación distinguirá:

```text
identidad estable
+ versión o registro material
+ estado operativo
+ intervalo de vigencia
+ relación de supersesión
```

Reglas:

1. dos registros con la misma identidad pueden representar versiones sucesivas válidas;
2. un activo y un inactivo no se clasifican automáticamente como duplicado ni como coexistencia correcta;
3. una política `ACTIVE_INTERVAL_SCOPE` deberá impedir solapamientos no autorizados, no borrar historia;
4. estados locales como activo, inactivo, cancelado, aceptado o supersedido se interpretan mediante su contrato de dominio;
5. reactivar un registro exige comprobar conflictos con la política y versión vigentes;
6. retirar un registro no libera automáticamente un código o referencia para reutilización;
7. la unicidad histórica y la unicidad operativa se registran por separado;
8. decisiones posteriores no reinterpretarán hechos anteriores sin una transición y evidencia aditiva.

#### 12. Pipeline cerrado de detección

El análisis seguirá exactamente estas etapas:

```text
1. autorizar finalidad, actor y alcance
        ↓
2. resolver dominio, entidad y política de identidad
        ↓
3. fijar conjunto de versiones y algoritmo
        ↓
4. validar completitud de la coordenada
        ↓
5. filtrar territorio, padre, contexto, fuente, estado y vigencia
        ↓
6. evaluar identificadores y referencias contractuales exactas
        ↓
7. evaluar componentes estructurales exactos
        ↓
8. generar candidatos por valor, forma y búsqueda permitida
        ↓
9. construir grupo o grafo de colisión reproducible
        ↓
10. recopilar evidencia positiva, negativa y relacional
        ↓
11. clasificar o enviar a revisión humana
        ↓
12. emitir disposición sin ejecutar consolidación
```

No se permite saltar a una búsqueda tolerante cuando falta identidad, scope o estructura. Cada etapa deberá explicar inclusiones, exclusiones y bloqueos.

#### 13. Generación de candidatos

La generación podrá utilizar, en orden de mayor a menor fuerza:

1. mismo identificador técnico donde la coexistencia sea inválida;
2. misma referencia externa bajo el mismo emisor y tipo;
3. misma clave empresarial exacta dentro del scope completo;
4. misma huella estructural dentro del mismo producto, contexto y vigencia;
5. mismo valor fuente exacto dentro del mismo campo y scope;
6. `FORM_EQUIVALENT_MATCH` compatible;
7. `ACCENT_TOLERANT_MATCH` compatible;
8. alias aprobado y acotado;
9. cobertura de frase o tokens autorizada;
10. transliteración habilitada explícitamente;
11. similitud como candidato de mínima confianza;
12. señal humana documentada.

Reglas:

- una etapa de menor fuerza no sustituye evidencia estructural ausente;
- un candidato puede pertenecer a varias señales, pero conserva su motivo principal y secundarios;
- la conectividad no es transitividad de identidad: si A se parece a B y B a C, no se presume que A, B y C sean la misma entidad;
- un grupo deberá conservar pares, componentes y razones, no únicamente un identificador de cluster;
- cambios de algoritmo o versión reconstruyen candidatos y no editan la evidencia anterior;
- candidatos históricos permanecen reproducibles aunque la política vigente ya no los agrupe.

#### 14. Taxonomía canónica de colisiones

Se preservan sin renombrar las diez clases aprobadas por `DATA-NORM-AUD-004`:

| Código                                | Significado normativo                                   | Efecto permitido                                    |
| ------------------------------------- | ------------------------------------------------------- | --------------------------------------------------- |
| `EXACT_VALUE_COLLISION`               | valor persistido idéntico dentro del corte              | revisar scope, estructura, estado y relaciones      |
| `FORM_VARIANT_COLLISION`              | diferencia limitada a caja, bordes o espacios           | evaluar normalización visible separada de identidad |
| `SEARCH_KEY_COLLISION`                | convergencia por tildes, signos o separación tolerante  | abrir candidato; no imponer igualdad                |
| `PROBABLE_SAME_ENTITY`                | señales compatibles de dominio, tipo, scope y atributos | priorizar revisión, sin consolidar                  |
| `STRUCTURAL_DUPLICATE_CANDIDATE`      | huella funcional equivalente dentro del mismo contexto  | revisar procedencia, prioridad y relaciones         |
| `LIFECYCLE_OR_VERSION_PAIR`           | coexistencia asociada a historia, estado o supersesión  | preservar historia y revisar vigencia               |
| `CROSS_LAYER_HOMONYM`                 | mismo nombre para objetos funcionalmente distintos      | conservar separación                                |
| `LABEL_COLLISION_DIFFERENT_STRUCTURE` | etiqueta igual con componentes distintos                | prohibir deduplicación por etiqueta                 |
| `SCOPE_FALSE_POSITIVE`                | agrupación causada por scope incompleto                 | corregir política o consulta, no los datos          |
| `AMBIGUOUS_COLLISION`                 | evidencia insuficiente o contradictoria                 | conservar registros y revisar humanamente           |

Ninguna clase, incluida `PROBABLE_SAME_ENTITY`, equivale a `CONFIRMED_DUPLICATE_DECISION`.

#### 15. Evidencia mínima por candidato

Todo expediente deberá cubrir doce dimensiones:

| Dimensión                  | Evidencia mínima                                                                     |
| -------------------------- | ------------------------------------------------------------------------------------ |
| identidad técnica          | IDs estables, tipo y dominio                                                         |
| valores y representaciones | originales, mostrados, claves derivadas y versiones                                  |
| scope                      | empresa, sede, área, canal, territorio, padre, camino y contexto aplicables          |
| estructura                 | cantidades, unidades, multiplicadores, categorías, roles y atributos funcionales     |
| estado y tiempo            | vigencia, actividad, supersesión, creación, retiro y secuencia histórica             |
| procedencia                | fuente propietaria, emisor externo, importación, actor y evidencia oficial           |
| relaciones entrantes       | referencias que dependen de cada registro                                            |
| relaciones salientes       | referencias y configuraciones que cada registro consume                              |
| actividad y hechos         | inventario, movimientos, recetas, compras, producción, ventas, catálogo y remisiones |
| consumidores               | aplicaciones, RPC, funciones, reportes, integraciones y procesos externos            |
| auditoría                  | creación, cambios, decisiones, versiones, razones e idempotencia                     |
| evidencia negativa         | diferencias que prueban separación legítima o hacen insegura la consolidación        |

La ausencia de relaciones declaradas no demuestra que no existan dependencias sin clave foránea, snapshots, JSON, cachés, códigos externos o consumidores fuera del esquema.

#### 16. Evaluación de evidencia

1. La evidencia se registra como hechos y no como un score opaco.
2. Cada hecho declara fuente, versión, fecha, autoridad, alcance y confiabilidad.
3. Evidencia positiva y negativa se conservan simultáneamente.
4. Un identificador oficial compatible pesa más que una coincidencia textual, pero su emisor y vigencia deberán validarse.
5. Una diferencia de tipo, unidad, padre, contexto, fuente o relación puede descartar una coincidencia exacta.
6. Un registro con más relaciones no se vuelve automáticamente sobreviviente.
7. Antigüedad, actividad reciente, frecuencia de uso o completitud no son autoridad por sí solas.
8. Un algoritmo puede priorizar revisión, pero no emitir una decisión irreversible.
9. Toda regla de priorización deberá ser versionada, explicable y evaluada contra falsos positivos.
10. Evidencia conflictiva produce revisión o bloqueo, nunca desempate silencioso.

#### 17. Disposiciones cerradas de resolución

Una revisión podrá emitir exactamente una de estas disposiciones:

| Disposición                              | Significado                                                    | Consecuencia normativa                                   |
| ---------------------------------------- | -------------------------------------------------------------- | -------------------------------------------------------- |
| `DISTINCT_IDENTITY`                      | entidades distintas aunque compartan señales                   | conservar ambas y registrar razón                        |
| `LEGITIMATE_HOMONYM`                     | mismo valor visible en roles o capas diferentes                | conservar separación funcional                           |
| `SCOPE_FALSE_POSITIVE_CONFIRMED`         | el grupo surgió por scope incompleto                           | corregir detector y cerrar sin tocar datos               |
| `LIFECYCLE_HISTORY_PRESERVED`            | registros vinculados como historia o versión                   | conservar sucesión y vigencia                            |
| `PRESENTATION_VARIANT_ONLY`              | defecto o variante visible sin duplicidad de entidad           | remitir corrección textual separada                      |
| `STRUCTURAL_MODEL_REVIEW_REQUIRED`       | la colisión revela estructura o clasificación insuficiente     | remitir al dominio o transición propietaria              |
| `CONFIRMED_DUPLICATE_PENDING_PLAN`       | misma identidad confirmada, sin plan de consolidación aprobado | bloquear efectos estructurales y preparar expediente     |
| `CONFIRMED_DUPLICATE_WITH_APPROVED_PLAN` | misma identidad y plan completo aprobado                       | habilitar únicamente una transición posterior autorizada |
| `INSUFFICIENT_EVIDENCE`                  | evidencia incompleta                                           | conservar registros y mantener caso abierto o diferido   |
| `ESCALATED_IDENTITY_OR_LEGAL`            | requiere autoridad de identidad, legal, privacidad o externa   | trasladar a propietario competente sin decidir           |

La disposición es inmutable y supersedible mediante una nueva revisión. No cambia datos, relaciones, constraints ni estados por sí sola.

#### 18. Cola, deduplicación de casos y revisión

1. Los candidatos utilizarán la cola y segregación aprobadas en `DATA-NORM-ARC-007`.
2. La identidad lógica del caso incluirá política, versión, entidad, scope, conjunto ordenado de registros y digest de evidencia.
3. El mismo conjunto bajo la misma versión no creará casos duplicados.
4. Un cambio de miembros, scope, algoritmo o evidencia crea revisión vinculada, no edición del expediente anterior.
5. Un grupo de tres o más registros deberá conservar comparaciones por pares y no asumir equivalencia transitiva.
6. El caso declarará prioridad según riesgo relacional, operativo, legal, financiero, de seguridad o privacidad; no solo por similitud.
7. La aprobación exigirá autoridad del dominio y, cuando corresponda, seguridad, privacidad, legal, contabilidad o integración.
8. El cierre por silencio, SLA vencido o ausencia de objeción permanece prohibido.
9. Una decisión humana no activa automáticamente una regla de unicidad ni una transición de datos.

#### 19. Reglas por familia representativa

| Familia                      | Coordenada o evidencia obligatoria                                                                                     | Conducta prohibida                                               |
| ---------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------- |
| producto                     | tipo funcional, categoría, unidad, abastecimiento, recetas, catálogo, inventario y consumidores                        | fusionar por nombre o categoría solamente                        |
| ítem de catálogo             | sede, producto enlazado, código comercial, estado y vigencia                                                           | eliminar el inactivo por compartir nombre con el activo          |
| categoría operativa          | sede, propósito, relaciones, enrutamiento y vigencia                                                                   | decidir por etiqueta exacta sin revisar dependencias             |
| posición de inventario       | sede, ubicación, padre o camino y código                                                                               | imponer `location_id + normalized_name`                          |
| perfil UOM o política        | producto, cantidad, unidad de entrada, cantidad de stock, unidad de stock, contexto, fuente, proveedor y vigencia      | usar etiqueta visible como identidad                             |
| persona o actor              | vínculos persistidos, documento, identidad de autenticación, contacto, estado y procedencia, bajo finalidad autorizada | fusionar por nombre normalizado                                  |
| proveedor o razón social     | fuente oficial, identificación legal, país, emisor y procedencia                                                       | retirar signos o declarar igualdad por razón social tolerante    |
| referencia externa           | emisor, tipo, ambiente, scope, valor original y vigencia                                                               | comparar referencias de emisores distintos como una clave global |
| marca o denominación oficial | fuente autorizada, propietario, forma oficial y contexto                                                               | inferir entidad desde tokens o similitud                         |
| texto libre                  | ninguna unicidad empresarial                                                                                           | usar descripciones, notas o mensajes para deduplicar entidades   |

#### 20. Aplicación a los hallazgos auditados

La estrategia conserva los siguientes resultados como baseline, sin resolverlos por inferencia:

| Corte canónico                                                    | Lectura obligatoria                                                                  |
| ----------------------------------------------------------------- | ------------------------------------------------------------------------------------ |
| once fuentes, 1.753 registros, 17 grupos y 94 registros agrupados | conjunto inicial de auditoría; no universo completo                                  |
| 963 productos y nueve grupos por clave de búsqueda                | dos candidatos probables, un par de ciclo, un ambiguo y cinco homónimos entre capas  |
| ocho pares de catálogo activo e inactivo                          | historia o migración potencial; nombre compartido no autoriza eliminación            |
| dos categorías activas `VÍVERES & BODEGA PRINCIPAL`               | candidato estructural prioritario sujeto a relaciones y enrutamiento                 |
| 72 posiciones `Nivel 1` a `Nivel 6`                               | falsos positivos; padre, camino y código forman parte del scope                      |
| 2.312 perfiles o políticas, 86 grupos y 186 registros             | mayoría de colisiones legítimas por contexto; dos huellas estructurales prioritarias |
| 106 registros de personas y 24 grupos por nombre                  | representaciones relacionadas; nombre no constituye identidad                        |
| 26 grupos bajo `LOWER_TRIM` y 27 sin tildes                       | colisiones de comparación, no duplicados confirmados                                 |
| 26 grupos por `_vento_slugify` y 27 por `_navigation_slugify`     | helpers incompatibles que no pueden definir identidad                                |
| 420 relaciones del alcance auditado                               | revisión mínima antes de cualquier consolidación de entidad                          |

`Chai latte frio` frente a `Chai Latte Frío`, `LATTE FRIO` frente a `Latte Frío`, `Maiz Dulce` frente a `Maíz Dulce`, `Choco Bites` frente a `Chocobites`, `Queso Gouda`, `Queso Mozzarella Tajado` y la categoría de remisión permanecen como candidatos, no decisiones finales.

#### 21. Selección de registro de referencia o sobreviviente

Una eventual selección deberá producir un paquete explícito que contenga:

1. identidad confirmada y scope;
2. registros participantes y razón de inclusión;
3. autoridad de cada atributo;
4. mapa de atributos que se preservan, corrigen, combinan o mantienen históricos;
5. inventario de relaciones y consumidores;
6. referencias externas, códigos, aliases y contratos afectados;
7. hechos financieros, de inventario, producción, ventas, recetas y auditoría;
8. estado y vigencia objetivo;
9. estrategia de crosswalk, redirección o tombstone;
10. plan de transición, verificación, compensación y rollback;
11. responsables y segregación de funciones;
12. evidencia de aprobación.

Quedan prohibidas como regla automática de supervivencia:

- fila más antigua;
- fila más nueva;
- fila activa;
- fila con más relaciones;
- fila con nombre mejor escrito;
- fila más usada o popular;
- menor o mayor identificador;
- primer resultado del ranking;
- registro elegido por un helper legacy;
- valor con más campos no nulos.

La autoridad puede resolverse por atributo. Un registro de referencia no obliga a copiar todos sus valores sobre los demás.

#### 22. Fronteras de consolidación

Confirmar un duplicado no autoriza consolidarlo. Una transición futura deberá:

1. fijar el conjunto de miembros y sus versiones;
2. impedir nuevas divergencias durante la ventana controlada;
3. inventariar referencias con y sin claves foráneas;
4. conservar hechos históricos y no reescribir eventos pasados;
5. remapear únicamente relaciones autorizadas;
6. mantener crosswalks de identificadores retirados;
7. preservar referencias externas que no puedan sustituirse;
8. definir aliases, redirecciones o tombstones sin convertirlos en fuentes activas;
9. distinguir desactivación, supersesión, fusión, separación y corrección;
10. emitir auditoría aditiva y claves idempotentes;
11. verificar conteos, saldos, recetas, costos, inventario, documentos y consumidores;
12. soportar rollback o compensación compatible con los hechos ya emitidos;
13. certificar ausencia de referencias huérfanas;
14. conservar evidencia suficiente para reconstruir la decisión.

No se reescribirán identificadores dentro de snapshots históricos, comprobantes, eventos o payloads probatorios salvo que su contrato lo exija expresamente y preserve el original.

#### 23. Creación, actualización y reactivación

La evaluación previa a una escritura podrá operar en cuatro modos versionados:

| Modo                           | Conducta                                                                          |
| ------------------------------ | --------------------------------------------------------------------------------- |
| `OBSERVE_ONLY`                 | registra candidatos y métricas sin advertir ni bloquear                           |
| `WARN_EXPLICIT_CONFIRMATION`   | presenta candidatos explicables y exige confirmación autorizada                   |
| `REVIEW_REQUIRED_BEFORE_WRITE` | bloquea la operación hasta resolver un caso cuando el riesgo lo exige             |
| `ENFORCE_CERTIFIED_UNIQUENESS` | rechaza únicamente una violación de una política de unicidad certificada y activa |

Reglas:

1. una representación de búsqueda no habilita `ENFORCE_CERTIFIED_UNIQUENESS`;
2. el modo pertenece a la versión de política y al ambiente;
3. crear, actualizar, reactivar, cambiar padre, mover scope o modificar componentes estructurales reevalúa la regla completa;
4. una advertencia deberá mostrar motivo, scope y registros candidatos sin exponer información no autorizada;
5. la confirmación no convierte un conflicto certificado en permitido;
6. el modo observación no se presentará como protección activa;
7. un bloqueo técnico o dependencia ausente no se reportará como duplicado;
8. la implementación de estos modos permanece en `DATA-NORM-ARC-011` y tareas de transición.

#### 24. Concurrencia e idempotencia

1. Dos escrituras concurrentes deberán evaluarse contra la misma política activa y estado esperado.
2. La detección previa no sustituye una protección atómica futura cuando la política deba impedir coexistencia.
3. La decisión física entre constraint, índice, lock, serialización, RPC o trigger pertenece a `DATA-NORM-ARC-011`.
4. Cada análisis conservará `candidate_run_id`, política, versión, corte, scope y digest del conjunto.
5. Repetir el mismo análisis devuelve el mismo grupo lógico o una revisión vinculada, no casos nuevos.
6. Crear o cerrar un caso utilizará la idempotencia aprobada en `DATA-NORM-ARC-009`.
7. Una decisión basada en una versión obsoleta de miembros, relaciones o política se bloqueará y reevaluará.
8. Una consolidación parcial nunca se reintentará desde cero sin reconocer sus efectos hijos.
9. Timeout o respuesta perdida no autorizan repetir una fusión o reasignación como una operación nueva.
10. La paridad deberá cubrir aplicación, servicio, RPC, job y mecanismo defensivo.

#### 25. Versionado, auditoría y reproducibilidad

Cada ejecución deberá conservar:

```text
candidate_run_id
uniqueness_policy_key
uniqueness_policy_version_id
resolved_version_set
version_set_digest
algorithm_key y algorithm_version
scope_coordinate
source_cut_or_snapshot
member_ids y member_versions
signals y collision_class
positive_evidence
negative_evidence
result_or_disposition
case_id y review_id cuando existan
actor, autorización, correlación y causalidad
```

Reglas:

1. la misma versión no podrá producir lógica distinta entre ambientes;
2. una versión nueva genera un corte nuevo y conserva el anterior;
3. los grupos históricos pueden reproducirse aunque dejen de ser candidatos vigentes;
4. una rectificación crea evidencia vinculada y no edita el resultado anterior;
5. las consultas y valores sensibles se minimizan conforme a `DATA-NORM-ARC-009`;
6. un replay no muta registros ni vuelve a ejecutar consolidaciones;
7. las diferencias entre ejecuciones se clasifican por datos, política, algoritmo, scope o ambiente;
8. la auditoría no se usa como sustituto de identidad ni como fuente para fusionar por frecuencia.

#### 26. Puertas previas a enforcement físico

Una política no podrá pasar a `ENFORCE_CERTIFIED_UNIQUENESS` hasta superar simultáneamente:

1. identidad y propietario definidos;
2. scope completo y casos excluidos documentados;
3. componentes estructurales y semántica de nulos aprobados;
4. estado, vigencia, supersesión y reutilización resueltos;
5. representación exacta y algoritmo versionados;
6. baseline completo de colisiones en datos existentes;
7. clasificación y resolución de los conflictos que impedirían activación;
8. corpus positivo, negativo, ambiguo y temporal aprobado;
9. precisión y falsos positivos dentro de criterios aprobados;
10. inventario de productores, consumidores, integraciones y referencias;
11. estrategia de transición, compatibilidad y rollback;
12. prueba de concurrencia e idempotencia;
13. rendimiento, seguridad y RLS certificados;
14. aprobación del propietario, steward y autoridades adicionales aplicables.

La falta de una puerta mantiene la política en observación, advertencia o revisión. No se permitirá un constraint parcial para descubrir errores directamente en producción.

#### 27. Métricas obligatorias

Cada política deberá medir, como mínimo:

- registros evaluados y elegibles;
- candidatos y grupos por clase;
- candidatos por cada etapa de generación;
- falsos positivos confirmados;
- falsos negativos detectados por revisión o incidente;
- casos ambiguos y tiempo de resolución;
- grupos de ciclo de vida e historia;
- homónimos y falsos positivos de scope;
- operaciones advertidas, revisadas y bloqueadas;
- conflictos concurrentes;
- decisiones supersedidas;
- consolidaciones planificadas, ejecutadas, compensadas o revertidas;
- referencias huérfanas detectadas;
- divergencias entre capas y ambientes;
- deriva después de cambiar versión;
- latencia y costo por modo de evaluación.

Las métricas no crean aliases, reglas, identidad ni decisiones por frecuencia. Su función es medir seguridad, cobertura y deriva.

#### 28. Privacidad, seguridad y acceso

1. Casos sobre personas, documentos, correos, teléfonos, direcciones o datos legales exigirán finalidad y autorización.
2. El nombre normalizado de una persona no se usa como clave de identidad.
3. Evidencia sensible se conserva mediante referencia protegida, hash contextualizado o acceso restringido.
4. La interfaz no expondrá candidatos fuera del scope del revisor.
5. Un actor no podrá aprobar y ejecutar una consolidación sensible sin la segregación requerida.
6. Logs y métricas no permitirán enumerar identificadores o reconstruir datos protegidos.
7. Referencias externas se validarán contra su emisor y no se compararán globalmente.
8. Secretos, firmas, tokens y credenciales quedan fuera de la detección general.
9. Una diferencia legal o de identidad prevalece sobre similitud comercial.
10. La retención seguirá la clase de evidencia aprobada en `DATA-NORM-ARC-009`.

#### 29. Paridad entre capas

Para la misma política, versión, corte, scope y miembros, todas las capas deberán producir:

- el mismo conjunto elegible;
- las mismas señales deterministas;
- la misma clase principal de colisión;
- el mismo digest de grupo;
- las mismas exclusiones y bloqueos;
- la misma necesidad de revisión;
- la misma conducta ante versión obsoleta;
- la misma disposición ya aprobada;
- la misma idempotencia y correlación.

Ninguna aplicación, RPC, función, job, trigger o integración podrá:

- definir su propio scope o clave normalizada;
- omitir estado, padre, contexto o fuente;
- seleccionar el primer candidato;
- fusionar silenciosamente al crear o importar;
- mantener listas locales de equivalencias;
- tratar un error de infraestructura como duplicado;
- reinterpretar una disposición cerrada;
- extender la política de Vento OS a VITAL.

#### 30. Corpus mínimo de conformidad

El corpus deberá incluir:

1. identificadores exactos válidos y conflictos reales;
2. claves empresariales iguales en scopes distintos;
3. padres y caminos jerárquicos distintos con la misma etiqueta;
4. nulos, vacíos, desconocidos, placeholders y claves parciales;
5. activos, inactivos, históricos, supersedidos y solapamientos temporales;
6. productos probables, ambiguos y homónimos entre capas;
7. ocho pares de catálogo activo e inactivo;
8. categoría de remisión duplicada dentro de sede;
9. 72 posiciones que deben permanecer distintas;
10. presentaciones con misma etiqueta y distinta estructura;
11. huellas UOM fuertes de `Queso Gouda` y `Queso Mozzarella Tajado`;
12. personas homónimas y representaciones vinculadas entre fuentes;
13. marcas, nombres legales y referencias externas;
14. exactitud, forma, tildes, aliases, transliteración y similitud;
15. clusters no transitivos A-B-C;
16. evidencia positiva y negativa conflictiva;
17. selección de sobreviviente prohibida por heurística;
18. relaciones con y sin clave foránea, JSON, snapshots y consumidores externos;
19. creación, actualización, reactivación y cambio de scope;
20. carreras concurrentes y reintentos;
21. versiones compatibles, obsoletas e incompatibles;
22. replay, supersesión, compensación y rollback;
23. autorización, masking y segregación;
24. paridad entre capas y ambientes;
25. frontera separada de VITAL;
26. ausencia de efectos de escritura durante detección y revisión.

#### 31. Conductas no conformes

Quedan prohibidas:

1. imponer unicidad sobre `SEARCH_FORM_KEY`, `SEARCH_ACCENT_KEY`, tokens, aliases, transliteración o similitud;
2. usar `lower(trim(value))`, `unaccent`, slug o helper legacy como identidad universal;
3. comparar nombres fuera de dominio, tipo o scope;
4. deduplicar posiciones por etiqueta sin padre, camino y código;
5. deduplicar UOM por etiqueta sin estructura y contexto;
6. fusionar persona, proveedor o razón social por nombre;
7. convertir un par activo e inactivo en error por defecto;
8. agrupar insumo, preparación y venta como una sola entidad por nombre;
9. decidir por score, umbral opaco, frecuencia o primer resultado;
10. tratar clusters transitivos como equivalencia confirmada;
11. borrar, editar o reciclar identificadores históricos;
12. elegir sobreviviente por antigüedad, actividad, popularidad o completitud;
13. reasignar relaciones sin inventario, plan y rollback;
14. ejecutar una consolidación desde la cola de revisión;
15. activar un constraint antes de resolver datos existentes y consumidores;
16. interpretar modo observación como protección efectiva;
17. mezclar versiones de política o algoritmo;
18. repetir una transición como operación nueva después de timeout;
19. exponer evidencia sensible o candidatos no autorizados;
20. aplicar la política transversal a VITAL;
21. introducir cambios físicos desde esta tarea documental.

#### 32. Hallazgos y carryovers

| ID               | Decisión o brecha                                                     | Resultado de esta tarea                                                    | Propietario siguiente                                             |
| ---------------- | --------------------------------------------------------------------- | -------------------------------------------------------------------------- | ----------------------------------------------------------------- |
| `DN-ARC-010-H01` | búsqueda y unicidad podían compartir una misma clave                  | separación absoluta entre identidad, política y representación comparativa | `DATA-NORM-ARC-011`; `SUPA-TRANS-005`                             |
| `DN-ARC-010-H02` | los scopes actuales producen homónimos y falsos positivos             | ocho clases de alcance y coordenada completa aprobadas                     | `DATA-NORM-ARC-011`; `DATA-NORM-TRANS-003`                        |
| `DN-ARC-010-H03` | nulos, placeholders y claves parciales no tenían semántica cerrada    | conducta bloqueante y obligación de política explícita aprobadas           | `DATA-NORM-ARC-011`; `SUPA-TRANS-005`                             |
| `DN-ARC-010-H04` | activos, inactivos e históricos podían confundirse con duplicados     | unicidad temporal, vigencia y supersesión separadas                        | `DATA-NORM-ARC-011`; `DATA-NORM-TRANS-003`; `DATA-NORM-TRANS-008` |
| `DN-ARC-010-H05` | los candidatos podían convertirse en clusters transitivos opacos      | pipeline, pares y grafo explicable aprobados                               | `DATA-NORM-ARC-011`; `DATA-NORM-TRANS-002`                        |
| `DN-ARC-010-H06` | no existía paquete cerrado de evidencia y disposición                 | doce dimensiones y diez disposiciones aprobadas                            | `DATA-NORM-ARC-007`; `DATA-NORM-ARC-011`; `DATA-NORM-TRANS-003`   |
| `DN-ARC-010-H07` | la selección de sobreviviente podía derivarse de heurísticas          | paquete de autoridad por atributo y heurísticas prohibidas                 | `DATA-NORM-TRANS-003`; `DATA-NORM-TRANS-004`                      |
| `DN-ARC-010-H08` | una decisión de duplicidad podía confundirse con fusión               | confirmación, plan y transición separados                                  | `DATA-NORM-ARC-011`; `SUPA-TRANS-011`; `DATA-NORM-TRANS-004`      |
| `DN-ARC-010-H09` | las relaciones y hechos podían perderse durante consolidación         | catorce guardas de transición y preservación histórica aprobadas           | `SUPA-TRANS-003`; `DATA-NORM-TRANS-004`; `DATA-NORM-TRANS-008`    |
| `DN-ARC-010-H10` | no existían modos graduales de prevención                             | observación, advertencia, revisión y enforcement certificado definidos     | `DATA-NORM-ARC-011`; `DATA-NORM-TRANS-005`                        |
| `DN-ARC-010-H11` | enforcement sin baseline podía bloquear datos legítimos               | catorce puertas obligatorias aprobadas                                     | `SUPA-TRANS-005`; `SUPA-TRANS-009`; `SUPA-TRANS-010`              |
| `DN-ARC-010-H12` | personas y externos presentan riesgos de identidad y privacidad       | finalidad, emisor, masking y escalamiento obligatorios                     | `DATA-NORM-ARC-012`; `DATA-NORM-ARC-011`                          |
| `DN-ARC-010-H13` | productores distribuidos pueden detectar o bloquear de forma distinta | paridad lógica e idempotencia transversal aprobadas                        | `DATA-NORM-ARC-011`; `SUPA-TRANS-009`; `SUPA-TRANS-014`           |
| `DN-ARC-010-H14` | VITAL comparte infraestructura física                                 | exclusión transversal mantenida                                            | `SUPA-ARC-025`                                                    |

#### 33. Decisiones reservadas

| Decisión                                                     | Tarea propietaria                                         |
| ------------------------------------------------------------ | --------------------------------------------------------- |
| tablas, columnas, constraints, índices, funciones y triggers | `DATA-NORM-ARC-011`; `SUPA-TRANS-005`                     |
| API, servicio, RPC, job y precedencia ejecutora              | `DATA-NORM-ARC-011`                                       |
| tratamiento de referencias y valores externos                | `DATA-NORM-ARC-012`                                       |
| inventario exhaustivo de consumidores y relaciones           | `SUPA-TRANS-003`                                          |
| baseline completo y dry-run de candidatos                    | `DATA-NORM-TRANS-001`; `DATA-NORM-TRANS-002`              |
| decisión de casos y registro sobreviviente concreto          | `DATA-NORM-TRANS-003`                                     |
| consolidación, crosswalks y reasignación de relaciones       | `DATA-NORM-TRANS-004`                                     |
| activación gradual de políticas y constraints                | `DATA-NORM-TRANS-005`; `SUPA-TRANS-005`; `SUPA-TRANS-006` |
| reintentos, lotes y propagación                              | `DATA-NORM-TRANS-006`; `DATA-NORM-TRANS-007`              |
| observabilidad, compensación y rollback                      | `DATA-NORM-TRANS-008`; `SUPA-TRANS-011`                   |
| certificación de paridad y transición                        | `DATA-NORM-TRANS-009`; `SUPA-TRANS-009`; `SUPA-TRANS-014` |
| rendimiento y seguridad bajo carga                           | `SUPA-TRANS-010`                                          |
| arquitectura consolidada de datos                            | `SUPA-ARC-025`                                            |

#### 34. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

Se crean los requisitos:

- `TREQ-DATA-165`;
- `TREQ-DATA-166`;
- `TREQ-DATA-167`;
- `TREQ-DATA-168`;
- `TREQ-DATA-169`;
- `TREQ-DATA-170`;
- `TREQ-DATA-171`;
- `TREQ-DATA-172`;
- `TREQ-DATA-173`;
- `TREQ-DATA-174`;
- `TREQ-DATA-175`;
- `TREQ-DATA-176`;
- `TREQ-DATA-177`;
- `TREQ-DATA-178`;
- `TREQ-DATA-179`;
- `TREQ-DATA-180`;
- `TREQ-DATA-181`;
- `TREQ-DATA-182`;
- `TREQ-DATA-183`;
- `TREQ-DATA-184`;
- `TREQ-DATA-185`;
- `TREQ-DATA-186`;
- `TREQ-DATA-187`;
- `TREQ-DATA-188`;
- `TREQ-DATA-189`;
- `TREQ-DATA-190`.

El detalle canónico de cada requisito reside en el registro 04A actualizado hasta esta tarea.

#### 35. Criterios de integridad

La estrategia se considera íntegra para esta etapa cuando:

1. separa los seis conceptos canónicos sin convertir comparación en identidad;
2. resuelve cada política mediante una coordenada empresarial completa;
3. define exactamente ocho clases de alcance;
4. trata nulos, desconocidos y claves parciales de forma explícita;
5. separa identidad, versión, estado, intervalo y supersesión;
6. aplica las doce etapas del pipeline en orden cerrado;
7. preserva las diez clases de colisión auditadas sin renombrarlas;
8. conserva pares y evita transitividad implícita de clusters;
9. exige doce dimensiones de evidencia positiva y negativa;
10. impide decisiones por score, frecuencia o primer resultado;
11. emite exactamente una de diez disposiciones sin ejecutar cambios;
12. reutiliza la cola y segregación de revisión aprobadas;
13. define coordenadas mínimas para productos, catálogo, jerarquías, UOM, personas, proveedores y externos;
14. conserva los hallazgos auditados como candidatos no resueltos;
15. exige un paquete de autoridad por atributo antes de elegir referencia;
16. prohíbe heurísticas automáticas de supervivencia;
17. separa confirmación, plan y consolidación;
18. protege relaciones, hechos, crosswalks, historia y rollback;
19. define cuatro modos graduales de prevención;
20. integra concurrencia, idempotencia, versiones y auditoría;
21. exige catorce puertas antes del enforcement físico;
22. define métricas sin aprendizaje implícito de identidad;
23. protege datos personales, legales, externos y sensibles;
24. exige paridad entre capas y ambientes;
25. incorpora corpus positivo, negativo, ambiguo, temporal, relacional y concurrente;
26. conserva VITAL fuera del alcance transversal;
27. no autoriza cambios físicos ni anticipa decisiones reservadas.

#### 36. Continuidad

```text
ÚLTIMA TAREA APROBADA
DATA-NORM-ARC-009 — Definir auditoría, versionado e idempotencia de reglas
        ↓
TAREA ACTUAL APROBADA
DATA-NORM-ARC-010 — Definir estrategia de unicidad y detección de duplicados normalizados
        ↓
SIGUIENTE TAREA RESERVADA
DATA-NORM-ARC-011 — Definir capas de ejecución: aplicación, servicio de dominio, RPC y trigger defensivo
```


### ✅ DATA-NORM-ARC-011 — Definir capas de ejecución: aplicación, servicio de dominio, RPC y trigger defensivo

**Estado:** APROBADA
**Tarea anterior:** `DATA-NORM-ARC-010 — Definir estrategia de unicidad y detección de duplicados normalizados` — APROBADA
**Tarea siguiente:** `DATA-NORM-ARC-012 — Definir tratamiento de datos recibidos desde integraciones externas`
**Tipo de tarea:** definición normativa de autoridad, distribución, precedencia, contratos transaccionales y defensas entre aplicación, servicio de dominio, RPC y trigger de base de datos; sin DDL, DML, migraciones, backfills, correcciones de datos, fusiones, desactivaciones, reasignaciones, cambios de relaciones, constraints, índices, funciones, RPC, triggers, clientes, integraciones, configuración ni despliegues

#### 1. Objetivo

Definir la arquitectura canónica mediante la cual las reglas de normalización, clasificación, búsqueda, revisión, auditoría, unicidad y propagación textual de Vento OS deberán distribuirse entre cuatro capas lógicas: aplicación, servicio de dominio, frontera RPC transaccional y trigger defensivo de base de datos.

La política deberá impedir cuatro implementaciones semánticas independientes, helpers locales divergentes, correcciones silenciosas en clientes, escrituras directas que omitan reglas, RPC que inventen decisiones, triggers que ejecuten lógica empresarial ambigua y auditoría duplicada entre capas. Para una misma operación lógica, entrada, coordenada y conjunto de versiones, todas las capas participantes deberán compartir el mismo contrato, pero cada una conservará una responsabilidad distinta y no intercambiable.

#### 2. Artefacto producido

```text
VENTO_TEXT_NORMALIZATION_EXECUTION_LAYER_POLICY@1.0.0
```

| Propiedad                                 | Valor |
| ----------------------------------------- | ----: |
| Capas lógicas de ejecución                |     4 |
| Funciones cerradas de autoridad           |     4 |
| Familias de comando o consulta gobernadas |     7 |
| Modos cerrados de trigger defensivo       |     4 |
| Etapas del flujo transaccional canónico   |    10 |
| Perfiles de colocación de operaciones     |    10 |
| Requisitos de prueba nuevos               |    24 |
| Cambios físicos autorizados               |     0 |

#### 3. Fuentes canónicas consumidas

| Fuente                      | Decisión consumida                                                                                                                                                   |
| --------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `01_PROTOCOLO.md`           | continuidad, una sola tarea, fase exclusivamente documental, separación entre aprobación e implementación y preservación histórica                                   |
| `delivery-contract.json`    | identidad del artefacto y actualización integral del registro 04A al crear requisitos                                                                                |
| `active-sequence.json`      | `DATA-NORM-ARC-011` como tarea actual y `DATA-NORM-ARC-012` como siguiente tarea reservada                                                                           |
| `DATA-NORM-AUD-001`         | universo textual, mecanismos locales y prohibición de inferir política desde schema, tipo o función existente                                                        |
| `DATA-NORM-AUD-006`         | 111 bindings de trigger, 97 funciones de trigger, 175 funciones o procedimientos, helpers divergentes, 160 transformaciones directas en clientes y procesos externos |
| `DATA-NORM-AUD-007`         | 100 objetos con señales de búsqueda, 13 índices locales, 137 funciones buscables, 420 relaciones y necesidad de paridad entre productores y consumidores             |
| `DATA-NORM-ARC-001` y `002` | resolución por coordenada, clases semánticas, representaciones, fuentes, operaciones y comportamiento cerrado                                                        |
| `DATA-NORM-ARC-003` a `006` | capitalización, conectores, excepciones y diccionario como reglas versionadas que no pueden divergir por capa                                                        |
| `DATA-NORM-ARC-007`         | revisión humana, segregación, decisiones inmutables y separación entre decisión y materialización                                                                    |
| `DATA-NORM-ARC-008`         | derivaciones, búsqueda, filtros, ranking, explicación, paridad y prohibición de usar coincidencias para escribir o fusionar                                          |
| `DATA-NORM-ARC-009`         | conjuntos de versiones, procedencia, auditoría, idempotencia, concurrencia, reintentos, replay y obligación de una sola operación lógica                             |
| `DATA-NORM-ARC-010`         | identidad, scopes, detección, cuatro modos de prevención, protección atómica futura y catorce puertas antes de enforcement                                           |
| Registro 04A vigente        | requisitos históricos, relaciones y secuencia del dominio `DATA` hasta `TREQ-DATA-190`                                                                               |

#### 4. Evidencia arquitectónica que obliga esta política

El estado auditado no permite asumir que una sola capa ya ejerza autoridad coherente:

| Evidencia aprobada                                                                      | Riesgo arquitectónico                                                                                           |
| --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- |
| 111 bindings asociados con 97 funciones de trigger                                      | múltiples defensas o transformaciones pueden operar con alcance, orden y semántica distintos                    |
| 175 funciones o procedimientos en el corte textual                                      | funciones existentes pueden mezclar validación, transformación, derivación, auditoría y reglas de dominio       |
| 160 transformaciones o escrituras directas detectadas en clientes                       | clientes pueden corregir, recortar, convertir vacíos, normalizar contactos o alterar nombres antes del servidor |
| `_product_normalize_name`, `_normalize_token`, `_vento_slugify` y `_navigation_slugify` | helpers con finalidades y resultados incompatibles no pueden considerarse una implementación canónica única     |
| 100 objetos con señales de búsqueda y 13 índices locales                                | la búsqueda puede cambiar según tabla, función, índice, consumidor o versión                                    |
| 420 relaciones dentro del alcance auditado                                              | una decisión textual o de duplicidad puede afectar hechos y referencias que una capa local no observa           |
| imports, CSV, Excel, webhooks, POS, PULSO, VISO y HubRise                               | procesos no interactivos pueden omitir validaciones de interfaz y ejecutar transformaciones propias             |

La existencia de una función o trigger no convierte su comportamiento actual en política aprobada. Cada mecanismo deberá inventariarse, clasificarse y alinearse con esta arquitectura antes de conservarse, reemplazarse o retirarse.

#### 5. Alcance y fronteras

Esta tarea define:

1. las cuatro capas lógicas y su autoridad relativa;
2. las cuatro funciones cerradas que una capa puede ejercer;
3. la separación entre ayuda de captura, decisión semántica, commit transaccional y defensa final;
4. el descriptor lógico que deberá declarar la colocación de cada operación;
5. las familias de comando y consulta que deberán atravesar el contrato;
6. el flujo canónico desde solicitud hasta commit, respuesta y propagación;
7. la conducta ante previsualización, cambios concurrentes y divergencias entre cliente y servidor;
8. la ubicación de normalización determinista, capitalización, conectores, excepciones, diccionario, revisión, búsqueda y unicidad;
9. los modos permitidos y prohibidos de un trigger defensivo;
10. la política para escrituras directas, procesos por lotes, imports, jobs y bypass controlado;
11. la autoridad sobre auditoría, idempotencia, concurrencia, fallos y reintentos;
12. los límites de seguridad, rendimiento, observabilidad y compatibilidad legacy;
13. la paridad entre ambientes, artefactos y consumidores;
14. el corpus mínimo de conformidad.

Esta tarea no define:

- tablas, columnas, tipos, constraints, índices, extensiones, RLS, grants, funciones, firmas RPC o triggers concretos;
- repositorio, lenguaje, framework, runtime o proveedor físico del servicio de dominio;
- nombres de endpoints, payloads físicos o contratos HTTP finales;
- políticas concretas para valores recibidos desde integraciones externas;
- la estrategia de transición de cada helper, trigger, cliente o import existente;
- correcciones, backfills, materialización de derivaciones, activación de constraints o despliegues;
- selección o consolidación de registros duplicados;
- cambios sobre VITAL.

Estas decisiones permanecen en `DATA-NORM-ARC-012`, `SUPA-TRANS-003`, `SUPA-TRANS-005` a `SUPA-TRANS-014` y `DATA-NORM-TRANS-001` a `DATA-NORM-TRANS-009`, según su propiedad.

#### 6. Principios obligatorios

1. **Existe una sola autoridad semántica.** Las reglas no se reimplementan independientemente en aplicación, RPC y trigger.
2. **La interfaz orienta; no decide.** Toda corrección, clasificación o bloqueo mostrado antes del commit es una previsualización hasta que el servidor revalide.
3. **El servicio de dominio decide significado.** Resuelve coordenada, clases, versiones, precedencia, resultado y evidencia lógica.
4. **La RPC gobierna el commit.** Autoriza, revalida, aplica idempotencia, controla concurrencia y confirma los efectos dentro de una frontera transaccional.
5. **El trigger defiende; no interpreta.** Solo comprueba invariantes o materializa derivaciones deterministas estrictamente acotadas.
6. **Una defensa no repara silenciosamente.** Cuando detecta una violación, rechaza o registra; no elige una forma alternativa para continuar.
7. **No existe fallback cliente.** Si el servicio o la política no están disponibles, el cliente conserva el valor y no ejecuta una versión local.
8. **Toda escritura gobernada atraviesa un comando canónico.** Una escritura directa no adquiere validez por producir el mismo valor aparente.
9. **La versión se fija antes de evaluar.** Todas las capas participantes consumen el mismo `version_set_digest`.
10. **La transacción conserva causalidad.** Fuente, derivaciones, auditoría y efectos sincrónicos pertenecen a una sola operación lógica.
11. **La propagación no ocurre dentro del trigger.** Copias, eventos, lotes y destinos posteriores se procesan después del commit mediante comandos hijos idempotentes.
12. **La búsqueda es del lado servidor.** Autorización, scope, filtros, matching, ranking y paginación no se delegan a listas locales del cliente.
13. **La unicidad certificada requiere protección atómica.** Una consulta previa o advertencia visual no impide carreras concurrentes.
14. **VITAL permanece separado.** Ninguna implementación compartida transfiere automáticamente reglas de Vento OS.

#### 7. Modelo cerrado de capas

| Capa lógica                     | Función principal                                                                     | Autoridad que no posee                                                                                           |
| ------------------------------- | ------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| `APPLICATION_INTERACTION_LAYER` | captura, guía, previsualización, explicación y presentación de errores o candidatos   | no define política, no selecciona versiones, no confirma mutación, no activa unicidad ni corrige silenciosamente |
| `DOMAIN_NORMALIZATION_SERVICE`  | resolución semántica canónica y evaluación pura o gobernada de reglas                 | no confirma por sí solo una escritura ni sustituye autorización, transacción, RLS o concurrencia                 |
| `TRANSACTIONAL_RPC_BOUNDARY`    | autorización, revalidación, idempotencia, concurrencia, persistencia y commit atómico | no inventa reglas, aliases, scopes, correcciones ni criterios distintos del servicio de dominio                  |
| `DEFENSIVE_DATABASE_TRIGGER`    | última defensa ante bypass y comprobación de invariantes sobre el estado persistido   | no ejecuta revisión humana, fuzzy matching, selección de sobreviviente, propagación, red ni lógica ambigua       |

Las capas son lógicas. Una implementación física podrá alojar más de una en el mismo proceso o repositorio, pero deberá conservar fronteras de autoridad, contratos, pruebas y auditoría diferenciables.

#### 8. Funciones cerradas de autoridad

| Función                                 | Significado                                                                                           | Capa primaria                              |
| --------------------------------------- | ----------------------------------------------------------------------------------------------------- | ------------------------------------------ |
| `PREVIEW_AND_GUIDANCE`                  | producir sugerencia, explicación o validación no vinculante para interacción humana                   | aplicación, consumiendo resultado servidor |
| `AUTHORITATIVE_SEMANTIC_EVALUATION`     | resolver coordenada, reglas, versiones, precedencia, resultado y evidencia lógica                     | servicio de dominio                        |
| `TRANSACTIONAL_REVALIDATION_AND_COMMIT` | volver a comprobar estado actual, autorizar y confirmar efectos con idempotencia y concurrencia       | RPC                                        |
| `DEFENSIVE_INVARIANT_ENFORCEMENT`       | rechazar estados imposibles o materializar una derivación determinista permitida durante la escritura | trigger defensivo                          |

Una capa secundaria puede observar o comprobar un resultado, pero no asumir otra función primaria. En particular, el trigger no se convierte en servicio de dominio y la aplicación no se convierte en RPC por invocar Supabase directamente.

#### 9. Capa de aplicación

La aplicación deberá:

1. capturar intención, valor visible, contexto y referencia de versión conocida;
2. solicitar previsualizaciones al contrato servidor cuando la experiencia las requiera;
3. mostrar valor original, propuesta, motivo, nivel de confianza, bloqueo o revisión sin presentar la sugerencia como aplicada;
4. conservar el valor introducido hasta recibir una respuesta autoritativa;
5. generar o conservar un `client_command_id` estable para reintentos de la misma intención;
6. enviar expectativa de versión o hash del registro que la persona observó;
7. distinguir error de política, conflicto, revisión, obsolescencia y fallo técnico;
8. volver a solicitar decisión cuando cambien valor, campo, scope, fuente o versiones;
9. presentar candidatos de duplicidad con scope y motivo, sin seleccionar automáticamente uno;
10. aplicar masking y minimización según autorización.

La aplicación no podrá:

- mantener catálogos locales de conectores, marcas, aliases o diccionario como autoridad;
- ejecutar un helper local y persistir su resultado sin revalidación servidor;
- convertir vacíos, nulos o placeholders de manera distinta al contrato del campo;
- corregir nombres, razones sociales, marcas, unidades, personas, direcciones o externos antes de enviarlos;
- decidir que una advertencia puede omitirse por preferencia del usuario;
- usar el primer resultado de búsqueda como destino seguro de una mutación;
- emitir una respuesta de éxito antes de confirmación del commit;
- reintentar con otro identificador después de timeout sin consultar el resultado previo.

Una transformación puramente visual y reversible podrá existir en la interfaz solo cuando no altere el payload canónico ni se presente como decisión persistida.

#### 10. Servicio de dominio de normalización

El servicio de dominio será la única autoridad semántica y deberá:

1. resolver dominio, entidad, campo, clase, representación y rol de fuente;
2. fijar el conjunto efectivo de versiones y su digest;
3. seleccionar el pipeline permitido y bloquear dependencias ausentes o incompatibles;
4. aplicar precedencia entre políticas, conectores, excepciones, diccionario y revisión;
5. producir resultados cerrados y explicables;
6. derivar búsqueda y componentes mediante los algoritmos versionados;
7. evaluar señales de unicidad o duplicidad sin ejecutar consolidación;
8. construir evidencia lógica para auditoría, revisión o transición;
9. operar de forma determinista e idempotente sobre entradas lógicas equivalentes;
10. exponer el mismo contrato a previsualización, RPC, job y replay;
11. conservar separadas evaluación pura, intención de mutación y efecto persistido;
12. rechazar cualquier operación que intente atravesar una clase, fuente o representación incompatible.

El servicio no podrá resolver versiones mediante `latest`, configuración local, orden de carga o disponibilidad accidental. Tampoco podrá escribir directamente fuera de la frontera transaccional ni considerar que una evaluación exitosa equivale a un commit confirmado.

#### 11. Frontera RPC transaccional

Toda escritura gobernada deberá ingresar por una RPC o comando servidor equivalente que ejerza una única frontera transaccional lógica.

La frontera deberá:

1. autenticar al actor o servicio y resolver su contexto efectivo;
2. autorizar acción, dominio, entidad, campo, scope, sensibilidad y finalidad;
3. construir o validar la clave idempotente y el digest del payload;
4. cargar el estado actual y sus versiones bajo una estrategia de concurrencia explícita;
5. invocar el servicio de dominio con el conjunto de versiones fijado;
6. revalidar unicidad, relaciones, vigencia y precondiciones sobre el estado actual;
7. persistir de forma atómica el valor autorizado, derivaciones sincrónicas y auditoría requerida;
8. permitir que las defensas de base comprueben invariantes antes del commit;
9. devolver resultado, versión, efecto y referencias de auditoría de la misma operación lógica;
10. registrar destinos posteriores sin ejecutarlos dentro de la transacción cuando pertenezcan a propagación asincrónica.

Una RPC no podrá contener una segunda implementación de capitalización, diccionario, aliases, tokenización o matching. Podrá llamar funciones de base de datos que materialicen el contrato canónico, pero no reemplazar la autoridad semántica mediante expresiones locales distintas.

#### 12. Trigger defensivo

El trigger defensivo será una última barrera frente a escrituras que alcancen la tabla por una vía no prevista, una versión legacy, una importación, una credencial privilegiada o un defecto de implementación.

Podrá:

1. comprobar presencia de contexto de operación cuando el campo lo exija;
2. verificar que política, versión, clase, fuente y representación sean compatibles;
3. comprobar expectativa de versión o invariantes que solo el estado persistido puede confirmar;
4. rechazar una escritura directa sobre un campo gobernado cuando no exista comando válido;
5. asegurar que una derivación persistida corresponde al valor fuente y versión declarados;
6. materializar una derivación determinista, local, acotada y sin ambigüedad cuando el descriptor lo autorice;
7. estampar metadatos técnicos defensivos sin sustituir la auditoría raíz de la RPC;
8. producir un evento hijo cuando intervenga, rechace o detecte una desviación.

No podrá:

- decidir ortografía, marca, razón social, nombre personal o forma oficial;
- consultar la cola y aprobar una revisión;
- ejecutar similitud, búsqueda difusa, ranking o selección del mejor candidato;
- decidir identidad, duplicidad, sobreviviente, fusión, desactivación o reasignación;
- ejecutar llamadas de red, HTTP, webhook, proveedor lingüístico o almacenamiento externo;
- recorrer grandes conjuntos, escanear tablas completas o construir clusters;
- propagar cambios a otras tablas como workflow oculto;
- elegir otra versión cuando la declarada no está disponible;
- reparar el valor y continuar cuando la política exige bloqueo;
- producir una segunda auditoría raíz de la misma operación.

#### 13. Modos cerrados de trigger defensivo

| Modo                            | Conducta                                                                                                |
| ------------------------------- | ------------------------------------------------------------------------------------------------------- |
| `NO_TRIGGER`                    | la operación no requiere defensa de trigger; otras barreras permanecen obligatorias                     |
| `ASSERT_AND_REJECT`             | comprueba invariantes y aborta la escritura ante incumplimiento, sin modificar el valor                 |
| `DERIVE_BOUNDED_REPRESENTATION` | materializa una derivación determinista desde la fila actual, con algoritmo y versión explícitos        |
| `STAMP_DEFENSIVE_METADATA`      | registra metadatos técnicos mínimos de defensa, correlación o procedencia sin crear autoridad semántica |

Reglas:

1. cada operación tendrá exactamente un modo principal de trigger;
2. `DERIVE_BOUNDED_REPRESENTATION` solo opera sobre representaciones derivadas, nunca sobre originales externos, snapshots, evidencia o valores mostrados protegidos;
3. una derivación deberá depender de la fila afectada y de artefactos inmutables disponibles localmente;
4. si la derivación requiere consulta ambigua, catálogo no fijado, llamada externa o revisión, el modo queda prohibido;
5. `STAMP_DEFENSIVE_METADATA` no sustituye actor, autorización, motivo, antes, después ni resultado registrados por la operación raíz;
6. deshabilitar temporalmente un trigger no convierte la escritura en conforme y deberá pertenecer a una transición controlada.

#### 14. Descriptor canónico de colocación

Toda operación textual gobernada deberá declarar un descriptor lógico con, como mínimo:

```text
execution_policy_key
operation_kind
policy_coordinate
semantic_class
representation_role
source_role
primary_semantic_authority
transactional_boundary
application_preview_mode
trigger_mode
allowed_callers
required_authorization_context
resolved_version_dependencies
idempotency_class
concurrency_expectations
mutation_target
synchronous_derivations
audit_owner
failure_mode
bypass_policy
propagation_policy
```

Reglas:

1. la ausencia del descriptor bloquea automatización y mutación;
2. `primary_semantic_authority` será el servicio de dominio para toda regla de normalización;
3. `transactional_boundary` será la RPC para toda mutación gobernada;
4. `trigger_mode` no se infiere desde la existencia de un trigger legacy;
5. una aplicación no podrá ampliar `allowed_callers` ni `bypass_policy`;
6. cambiar colocación, autoridad, modo de trigger o frontera transaccional crea una nueva versión y exige pruebas de paridad;
7. el descriptor pertenece al conjunto efectivo de versiones y deberá ser reproducible en replay.

#### 15. Familias de comando y consulta

| Familia lógica                          | Finalidad                                                                        | Frontera obligatoria                                 |
| --------------------------------------- | -------------------------------------------------------------------------------- | ---------------------------------------------------- |
| `NORMALIZATION_EVALUATION_QUERY`        | obtener previsualización o evaluación sin mutar                                  | servicio de dominio mediante endpoint servidor       |
| `AUTHORITATIVE_TEXT_MUTATION_COMMAND`   | modificar un valor fuente autorizado                                             | servicio de dominio dentro de RPC transaccional      |
| `DERIVATION_MATERIALIZATION_COMMAND`    | crear o renovar una representación de búsqueda, proyección o copia sincronizable | servicio de dominio y RPC o job servidor idempotente |
| `REVIEW_CASE_COMMAND`                   | crear, actualizar o resolver un expediente de ambigüedad                         | workflow servidor y RPC con segregación              |
| `SEARCH_AND_COMPARISON_QUERY`           | buscar, filtrar, rankear y explicar resultados autorizados                       | servicio servidor o RPC de lectura                   |
| `UNIQUENESS_AND_DUPLICATE_COMMAND`      | observar, advertir, exigir revisión o aplicar unicidad certificada               | servicio de dominio y RPC; defensa atómica aprobada  |
| `RULE_LIFECYCLE_OR_PROPAGATION_COMMAND` | activar versiones o aplicar efectos hijos posteriores                            | RPC o job servidor con idempotencia y auditoría      |

Una familia puede tener variantes de lectura o escritura, pero no podrá saltar la autoridad semántica ni la frontera transaccional que le corresponda.

#### 16. Flujo transaccional canónico

```text
1. la aplicación captura intención, valor, contexto y versión observada
        ↓
2. opcionalmente solicita una previsualización servidor no vinculante
        ↓
3. envía el comando con client_command_id y expectativa de fuente
        ↓
4. la RPC autentica, autoriza y construye la operación lógica idempotente
        ↓
5. el servicio de dominio resuelve coordenada, conjunto de versiones y resultado
        ↓
6. la RPC revalida estado, concurrencia, unicidad y precondiciones actuales
        ↓
7. la transacción persiste fuente, derivaciones sincrónicas y auditoría raíz
        ↓
8. el trigger comprueba únicamente invariantes defensivos autorizados
        ↓
9. el commit confirma un único efecto y la RPC devuelve el resultado
        ↓
10. propagaciones, copias o destinos asincrónicos continúan como comandos hijos idempotentes
```

Ninguna etapa podrá omitirse porque la entrada ya fue previsualizada, porque el actor sea administrador o porque un trigger pueda corregir el resultado después.

#### 17. Previsualización y divergencia antes del commit

1. La previsualización consume el mismo servicio y versiones que una operación futura, pero no reserva el estado ni garantiza commit.
2. La respuesta deberá indicar que es no vinculante y conservar `version_set_digest`, fuente observada y momento.
3. El comando de escritura volverá a evaluar con el estado actual.
4. Si valor, scope, política, versiones, unicidad o relaciones cambiaron, la RPC no reutilizará ciegamente la previsualización.
5. Una diferencia material devolverá resultado actualizado, conflicto, bloqueo o revisión; no aplicará silenciosamente otra salida.
6. La aplicación deberá mostrar la diferencia cuando cambie el valor resultante o la decisión humana requerida.
7. Una confirmación anterior no autoriza una nueva versión, otro registro o un scope distinto.
8. Un resultado sin cambios porque ya era canónico se distinguirá de una operación bloqueada.

#### 18. Colocación de normalización determinista

Las operaciones deterministas autorizadas seguirán este perfil:

| Capa       | Responsabilidad                                                                                  |
| ---------- | ------------------------------------------------------------------------------------------------ |
| aplicación | mostrar previsualización servidor y validaciones de formato no autoritativas                     |
| servicio   | decidir si la operación aplica y producir salida, versiones, explicación y huella                |
| RPC        | revalidar fuente y persistir la salida autorizada con auditoría e idempotencia                   |
| trigger    | `ASSERT_AND_REJECT` o `DERIVE_BOUNDED_REPRESENTATION` únicamente cuando el descriptor lo permita |

Recorte, compactación, Unicode, capitalización y puntuación no se agruparán en una función universal. Cada operación conservará su orden, clase, fuente, versión y resultado. Un trigger no transformará el valor mostrado si la RPC no solicitó y auditó esa mutación.

#### 19. Colocación de capitalización, conectores, excepciones y diccionario

1. La aplicación no mantendrá versiones ejecutables de catálogos ni diccionario.
2. El servicio de dominio resolverá tokenización, capitalización, conectores, excepciones y diccionario en el orden aprobado.
3. La RPC fijará el conjunto de versiones y persistirá únicamente un resultado autorizado.
4. El trigger podrá comprobar que la salida y el digest corresponden al contexto, pero no volverá a decidir palabras, aliases o excepciones.
5. Una versión suspendida, retirada o ausente bloqueará la mutación; no se reemplazará por una lista local.
6. Un original externo, nombre legal, marca, persona, dirección, snapshot o evidencia se preservará según su clase y fuente.
7. Una corrección ambigua producirá revisión; el trigger no elegirá el valor más frecuente ni el más parecido.
8. Una diferencia entre servicio y trigger es una desviación crítica, no una oportunidad para que la última capa prevalezca silenciosamente.

#### 20. Colocación de revisión humana

1. Los clientes pueden originar candidatos, pero no aprobarlos.
2. El servicio de dominio clasifica el detonante, scope, evidencia y destino.
3. La RPC registra estados y decisiones con autorización, segregación, idempotencia y concurrencia.
4. Los triggers no crean decisiones, no asignan responsables y no cambian estados de revisión como efecto colateral de una escritura empresarial.
5. Una decisión aprobada produce una versión o paquete lógico separado; no modifica datos por sí misma.
6. La materialización posterior regresa al flujo transaccional canónico con otra operación lógica.
7. Las notificaciones, SLA y escalamiento se ejecutarán fuera del trigger.
8. Una revisión cerrada permanece inmutable aunque la materialización falle o se revierta.

#### 21. Colocación de búsqueda y comparación

1. La consulta original se envía al servidor con finalidad, scope y filtros permitidos.
2. El servicio aplica la política de `DATA-NORM-ARC-008`, versiones, derivaciones, modos y ranking.
3. La frontera de lectura autoriza antes de exponer resultados y conserva orden y paginación estables.
4. La aplicación podrá resaltar, agrupar o filtrar visualmente la página ya autorizada, pero no redefinir el ranking canónico del corpus.
5. Una caché cliente deberá estar vinculada a scope, cursor, versiones y expiración; no se convierte en fuente de verdad.
6. El trigger no participa en una consulta de búsqueda ni ejecuta similitud.
7. La materialización de claves podrá usar `DERIVE_BOUNDED_REPRESENTATION` solo cuando sea determinista, acotada y compatible con el índice futuro.
8. Un resultado de búsqueda utilizado en una mutación deberá revalidarse por identificador estable dentro de la RPC.
9. La ausencia del servicio no habilita búsqueda local sobre datos almacenados localmente como sustituto contractual.

#### 22. Colocación de unicidad y duplicidad

| Modo de `DATA-NORM-ARC-010`    | Aplicación                                             | Servicio de dominio                  | RPC y base de datos                                                                                   |
| ------------------------------ | ------------------------------------------------------ | ------------------------------------ | ----------------------------------------------------------------------------------------------------- |
| `OBSERVE_ONLY`                 | no presenta protección como activa                     | genera candidatos y métricas         | registra sin bloquear                                                                                 |
| `WARN_EXPLICIT_CONFIRMATION`   | muestra candidatos y exige acción explícita autorizada | explica señales, scope y diferencias | revalida antes del commit y conserva confirmación                                                     |
| `REVIEW_REQUIRED_BEFORE_WRITE` | presenta bloqueo y expediente requerido                | determina la necesidad de revisión   | impide commit hasta decisión compatible y vigente                                                     |
| `ENFORCE_CERTIFIED_UNIQUENESS` | muestra el conflicto devuelto por servidor             | resuelve la política certificada     | aplica protección atómica mediante el mecanismo físico aprobado; una consulta previa no es suficiente |

Reglas:

1. el trigger no ejecutará fuzzy matching ni selección de duplicados;
2. una constraint o índice futuro protegerá únicamente una política certificada y exacta;
3. el servicio puede generar candidatos, pero la RPC revalida miembros, scope y versiones actuales;
4. un caso confirmado no activa fusión ni reasignación;
5. una carrera concurrente no se resuelve por la advertencia de la interfaz;
6. errores técnicos, timeouts o dependencias ausentes no se presentarán como duplicidad;
7. el enforcement permanecerá bloqueado hasta superar las catorce puertas aprobadas.

#### 23. Representaciones y roles de fuente

| Representación o fuente      | Colocación obligatoria                                                                                |
| ---------------------------- | ----------------------------------------------------------------------------------------------------- |
| `PRIMARY_VALUE` autoritativo | mutación decidida por servicio y confirmada por RPC                                                   |
| `DISPLAY_OVERRIDE` aprobado  | evaluación por servicio y persistencia acotada por RPC                                                |
| `SEARCH_DERIVATION`          | derivación canónica por servicio; materialización por RPC, job o trigger acotado                      |
| `EXTERNAL_ORIGINAL`          | preservación obligatoria; cualquier mapeo interno será separado y se detallará en `DATA-NORM-ARC-012` |
| `HISTORICAL_SNAPSHOT`        | no se resincroniza ni corrige desde una versión nueva                                                 |
| `OUTPUT_PROJECTION`          | se deriva para el canal sin retroalimentar la fuente                                                  |
| `AUDIT_EVIDENCE`             | inmutable; rectificación aditiva y acceso restringido                                                 |
| `SYNCHRONIZED_COPY`          | recibe propagación desde la fuente por comando hijo; no ejecuta reglas locales independientes         |
| `APPROVED_OVERRIDE`          | conserva scope y precedencia; no redefine el valor principal                                          |
| `UNCLASSIFIED_PRESERVE`      | conserva valor y bloquea mutación, derivación y unicidad hasta clasificación                          |

#### 24. Escrituras directas y bypass controlado

1. Los campos gobernados no deberán modificarse desde clientes mediante escritura directa a tablas.
2. RLS, grants, contratos de cliente y APIs deberán orientar las mutaciones hacia la frontera RPC.
3. Una credencial privilegiada, consola administrativa o script no queda exenta de política.
4. Cuando una transición requiera bypass, deberá declarar actor, finalidad, alcance, ventana, versión, controles compensatorios, evidencia y rollback.
5. El trigger defensivo deberá rechazar o evidenciar escrituras sin contexto cuando el descriptor lo exija.
6. Un bypass no podrá deshabilitar auditoría, idempotencia, expectativa de fuente o verificación posterior.
7. Las correcciones manuales no se ejecutarán como SQL informal sobre datos gobernados.
8. Un acceso de emergencia no seleccionará otra versión ni relajará una clase protegida.
9. Deshabilitar una defensa exige una tarea de transición y una certificación posterior de las filas afectadas.
10. La capacidad física de escribir no equivale a autoridad empresarial para corregir texto.

#### 25. Imports, jobs, lotes y procesos externos

1. Imports de Excel o CSV, POS, webhooks, Edge Functions, jobs, procesos programados y herramientas internas consumirán el mismo servicio de dominio.
2. Podrán usar comandos batch o canales internos, pero cada elemento conservará operación lógica, idempotencia, fuente, versión y resultado.
3. El chunking no cambiará el orden semántico ni el conjunto de versiones dentro de una unidad declarada.
4. Un lote parcial conservará elementos confirmados, pendientes, bloqueados y fallidos; no se presentará como éxito total.
5. Reanudar omitirá efectos confirmados y revalidará los pendientes.
6. Un proceso no interactivo no podrá asumir que la ausencia de interfaz elimina revisión humana o autorización.
7. Los helpers de importación no se convertirán en catálogos paralelos.
8. Los valores externos conservarán su original y contrato conforme a `DATA-NORM-ARC-012`.
9. El trigger no orquestará el lote ni enviará eventos externos.
10. Un proceso legacy permanecerá bloqueado o en modo de observación hasta demostrar paridad.

#### 26. Propagación y sincronización

1. El commit de la fuente y la creación del comando de propagación deberán compartir causalidad.
2. Cada destino tendrá efecto hijo, idempotencia, expectativa y estado propios.
3. La propagación ocurrirá después del commit de la fuente salvo que un contrato aprobado exija atomicidad local dentro de la misma transacción.
4. Un trigger no llamará servicios externos ni actualizará silenciosamente agregados no pertenecientes a su invariante local.
5. Una copia sincronizable no ejecutará otra versión de la regla.
6. Un snapshot inmutable no recibe propagación.
7. Un override no se sobrescribe salvo que su contrato lo ordene expresamente.
8. El éxito parcial conservará destinos pendientes y fallidos.
9. Una compensación se registra como efecto nuevo y no borra la propagación original.
10. La transición concreta de copias y consumidores pertenece a `DATA-NORM-TRANS-007` y `DATA-NORM-TRANS-008`.

#### 27. Autoridad y deduplicación de auditoría

La RPC será propietaria del registro raíz de una operación mutante. El servicio aportará la evaluación semántica y el trigger únicamente evidencia defensiva vinculada.

Reglas:

1. todas las capas compartirán `logical_operation_id`, correlación, causación y `version_set_digest`;
2. la aplicación podrá registrar telemetría de experiencia, pero no crear una auditoría canónica de commit;
3. el servicio producirá un `RULE_EVALUATION_RECORD` lógico sin afirmar persistencia;
4. la RPC confirmará `PERSISTED_MUTATION_RECORD`, `DERIVATION_MATERIALIZATION_RECORD` o resultado equivalente;
5. el trigger registrará un evento hijo solo cuando intervenga, rechace o materialice una derivación defensiva;
6. una misma mutación no producirá cuatro eventos raíz independientes;
7. una escritura revertida no se registrará como cambio confirmado;
8. un error de auditoría obligatorio abortará la transacción cuando no pueda conservarse evidencia mínima;
9. logs técnicos no reemplazan el contrato de auditoría de `DATA-NORM-ARC-009`;
10. valores sensibles se minimizan en todas las capas.

#### 28. Idempotencia, concurrencia y reintentos

1. El cliente conserva el identificador de la misma intención entre reintentos.
2. La RPC construye o valida la clave idempotente servidor usando operación, actor, entidad, campo, fuente, acción, versiones y correlación.
3. El servicio no genera un resultado distinto por el número de intento.
4. La misma clave y payload devuelven el resultado previo.
5. La misma clave con payload distinto produce conflicto y ningún efecto.
6. La RPC valida `expected_source_version_or_hash`, `expected_version_set_digest` y estado esperado.
7. El trigger comprueba invariantes finales, pero no resuelve una carrera mediante último escritor.
8. Un timeout obliga a consultar la operación antes de crear otra.
9. Una previsualización no sustituye la expectativa del commit.
10. Jobs y propagaciones conservan cursores o destinos confirmados.
11. Una versión nueva exige reevaluación y no se introduce en un retry existente.
12. Una mutación y su auditoría deberán confirmar o revertirse juntas.

#### 29. Contrato de fallos

| Condición                                 | Resultado obligatorio                                                              |
| ----------------------------------------- | ---------------------------------------------------------------------------------- |
| servicio de dominio no disponible         | no ejecutar fallback local; conservar entrada y devolver fallo técnico             |
| política, versión o dependencia ausente   | `BLOCKED_POLICY`                                                                   |
| dos reglas o resultados incompatibles     | `BLOCKED_CONFLICT`                                                                 |
| valor, scope o estado obsoleto            | conflicto de concurrencia y reevaluación                                           |
| corrección ambigua                        | `REVIEW_REQUIRED`                                                                  |
| problema estructural o de identidad       | `ESCALATED_STRUCTURAL`                                                             |
| trigger detecta invariante violado        | abortar transacción; no reparar y continuar                                        |
| respuesta perdida después de commit       | recuperar resultado mediante idempotencia                                          |
| fallo después de commit en propagación    | fuente confirmada y destino pendiente o fallido; reanudar como operación hija      |
| mismatch entre artefacto y versión        | bloquear ejecución e iniciar incidente o reconciliación                            |
| escritura directa sin contexto autorizado | rechazar o dejar evidencia defensiva según el descriptor; nunca asumir conformidad |

Una capa no podrá traducir un bloqueo semántico en éxito, ocultar un fallo técnico como ausencia de cambio ni convertir una revisión en corrección.

#### 30. Seguridad y autorización

1. La aplicación no será una frontera de seguridad.
2. La RPC revalidará autorización aunque la interfaz haya ocultado la acción.
3. El servicio de dominio recibirá un contexto autorizado y no inferirá permisos desde el payload.
4. La implementación física de una RPC privilegiada deberá aplicar privilegio mínimo, contexto explícito y aislamiento del actor invocador.
5. Credenciales de servicio no se distribuirán a clientes ni se usarán como bypass general.
6. El trigger no confiará en campos de actor suministrados libremente por el cliente.
7. Lectura, previsualización, mutación, aprobación, activación, búsqueda sensible y exportación serán capacidades diferenciadas.
8. Los resultados de búsqueda y duplicidad se filtrarán antes de exponerse.
9. Secretos, firmas, tokens y material criptográfico no ingresarán al pipeline general.
10. La auditoría no ampliará visibilidad sobre datos protegidos.
11. Un administrador técnico no adquiere autoridad de dominio por operar infraestructura.
12. VITAL utilizará contratos y permisos propios.

#### 31. Rendimiento y límites defensivos

1. El trigger deberá tener costo acotado por fila o conjunto pequeño declarado.
2. No ejecutará scans globales, similitud, clustering, llamadas externas ni esperas de workflow.
3. La detección masiva de candidatos se realizará en jobs o consultas servidor con corte y versión explícitos.
4. El servicio de dominio podrá ser una librería pura o servicio, pero deberá ser reproducible, observable y compatible con carga.
5. La RPC limitará tamaño de payload, cantidad de elementos y duración según el contrato físico futuro.
6. Las derivaciones sincrónicas deberán justificarse por necesidad transaccional; las demás se materializarán después del commit.
7. Un índice o constraint no sustituye pruebas de semántica, scope y paridad.
8. Una optimización no podrá cambiar ranking, tokenización, normalización o errores sin nueva versión.
9. Timeouts y circuit breakers no autorizarán fallback semántico.
10. La certificación de carga y seguridad pertenece a `SUPA-TRANS-010`.

#### 32. Compatibilidad con mecanismos existentes

1. Cada función, trigger, helper, cliente, import, job e índice existente deberá mapearse a una capa, función de autoridad, operación y versión.
2. `_product_normalize_name`, `_normalize_token`, `_vento_slugify` y `_navigation_slugify` permanecerán distintos hasta demostrar propósito, compatibilidad y transición.
3. Un helper con nombre parecido no se sustituirá como refactorización neutral.
4. `set_updated_at` y variantes de stamping se clasificarán separadamente de reglas semánticas.
5. Triggers de validación de productos, documentos, wallets, dispositivos o regalos no se adoptarán transversalmente por analogía.
6. Transformaciones de email, espacios, vacíos y nombres en clientes deberán inventariarse antes de retirarse o alinearse.
7. Imports y webhooks conservarán fixtures de paridad y evidencia de valores originales.
8. Durante coexistencia, la versión nueva podrá operar en `DUAL_EVALUATION_SHADOW`, sin dual write implícito.
9. Un consumidor legacy sin paridad no podrá seguir mutando campos gobernados después del cutover.
10. La adaptación concreta pertenece a `SUPA-TRANS-003`, `SUPA-TRANS-006`, `SUPA-TRANS-007` y `SUPA-TRANS-014`.

#### 33. Matriz canónica de colocación por operación

| Operación                              | Aplicación                          | Servicio de dominio          | RPC                                                | Trigger defensivo                                     |
| -------------------------------------- | ----------------------------------- | ---------------------------- | -------------------------------------------------- | ----------------------------------------------------- |
| clasificación de campo                 | mostrar estado                      | autoridad                    | persistir decisión aprobada                        | no decidir                                            |
| recorte, espacios o Unicode autorizado | previsualizar                       | autoridad                    | revalidar y persistir                              | assert o derivación acotada                           |
| capitalización y conectores            | previsualizar                       | autoridad                    | revalidar y persistir                              | assert; no recapitular semántica                      |
| excepción oficial                      | mostrar forma y fuente              | autoridad                    | revalidar y persistir                              | assert; no elegir alias                               |
| diccionario                            | mostrar propuesta                   | autoridad                    | revalidar y persistir                              | assert; no corregir                                   |
| revisión ambigua                       | capturar evidencia                  | clasificar y proponer        | registrar workflow y decisión                      | no participar                                         |
| búsqueda y ranking                     | enviar consulta y presentar         | autoridad                    | autorizar, filtrar y paginar                       | no participar en consulta                             |
| derivación de búsqueda                 | ninguna autoridad                   | producir algoritmo y versión | materializar o programar                           | derivar solo si es local, determinista y acotada      |
| unicidad y candidatos                  | advertir o bloquear según respuesta | autoridad de evaluación      | revalidar y aplicar protección atómica certificada | assert exacto únicamente si el mecanismo fue aprobado |
| propagación y copias                   | mostrar estado                      | decidir contrato             | confirmar comando raíz e hijos                     | no orquestar                                          |

#### 34. Ejemplos normativos

| Escenario                                                                  | Conducta obligatoria                                                                                           |
| -------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| la aplicación propone `Harina de Maíz`                                     | muestra una previsualización servidor; la RPC vuelve a evaluar antes de persistir                              |
| el cliente aplica `trim()` y envía solo el resultado                       | no se considera evidencia del original ni autoridad; el contrato deberá recibir el valor y contexto requeridos |
| la versión del diccionario cambia entre preview y commit                   | la RPC devuelve decisión actualizada o conflicto; no mezcla versiones                                          |
| una escritura directa intenta modificar un nombre gobernado                | la defensa rechaza por falta de contexto o versión; no corrige silenciosamente                                 |
| el trigger puede calcular una clave de búsqueda determinista desde la fila | solo `DERIVE_BOUNDED_REPRESENTATION`, con versión fija, huella de fuente y pruebas de paridad                  |
| la derivación requiere alias, consulta externa o revisión                  | no se ejecuta en trigger; servicio y comando separado                                                          |
| dos usuarios crean simultáneamente la misma clave certificada              | la RPC revalida y la protección atómica permite un solo commit; la advertencia previa no decide la carrera     |
| la búsqueda devuelve dos categorías exactas                                | la aplicación muestra ambos IDs y scope; ninguna capa selecciona o fusiona automáticamente                     |
| un job procesa mil filas y falla después de 600                            | conserva 600 efectos confirmados, reanuda los restantes con las mismas versiones y no reinicia todo el lote    |
| un webhook repite el mismo evento                                          | misma operación lógica y efecto único; payload distinto bajo la misma identidad produce conflicto              |
| una copia sincronizable usa otro helper                                    | desviación bloqueante; debe consumir la misma versión o recibir la derivación de la fuente                     |
| una corrección ambigua llega al trigger                                    | el trigger no decide; la transacción preserva o bloquea y el servicio origina revisión                         |
| la RPC confirma el valor y luego falla una notificación                    | el commit permanece confirmado; la notificación es efecto hijo pendiente y reanudable                          |
| la auditoría de aplicación y trigger parece duplicar la mutación           | solo la RPC conserva el evento raíz; los demás registros se vinculan como telemetría o evento defensivo hijo   |
| un script de mantenimiento usa credencial privilegiada                     | debe ejecutar el mismo comando o un bypass controlado con versiones, evidencia, actor, ventana y verificación  |
| un valor pertenece a VITAL                                                 | queda fuera del contrato transversal y no consume reglas de Vento OS                                           |

#### 35. Conductas no conformes

Quedan prohibidas:

1. mantener cuatro implementaciones independientes de la misma regla;
2. persistir el resultado de un helper cliente sin evaluación servidor;
3. seleccionar versiones desde el cliente;
4. permitir escritura directa a campos gobernados como flujo ordinario;
5. usar una RPC como wrapper de SQL sin autorización, idempotencia o concurrencia;
6. duplicar capitalización, diccionario o aliases dentro de la RPC;
7. ejecutar lógica ambigua, búsqueda difusa o revisión humana en trigger;
8. modificar el valor fuente en trigger sin comando, resultado y auditoría autorizados;
9. efectuar llamadas de red desde trigger;
10. usar trigger para propagar workflow entre agregados;
11. reparar silenciosamente una violación y permitir el commit;
12. considerar una previsualización como reserva o confirmación;
13. reintentar un timeout como operación nueva;
14. registrar múltiples auditorías raíz para el mismo efecto;
15. usar logs de aplicación como prueba única de commit;
16. permitir que un job o import mantenga su propio diccionario;
17. ejecutar búsqueda o ranking canónico sobre una lista cliente incompleta;
18. usar consulta previa como única protección de unicidad concurrente;
19. activar un constraint antes de las puertas de `DATA-NORM-ARC-010`;
20. mezclar versiones entre servicio, RPC, trigger, índice o cliente;
21. elegir fallback legacy cuando el artefacto canónico no está disponible;
22. ocultar éxito parcial de lote o propagación;
23. ampliar permisos mediante una función privilegiada;
24. aplicar reglas de Vento OS a VITAL;
25. introducir cambios físicos desde esta tarea documental.

#### 36. Corpus mínimo de conformidad

El corpus deberá cubrir, como mínimo:

1. cada una de las cuatro capas y funciones de autoridad;
2. preview igual y diferente al resultado del commit;
3. cliente online, offline, caché obsoleta y reintento después de timeout;
4. política y catálogo activos, ausentes, suspendidos, retirados e incompatibles;
5. recorte, espacios, Unicode, capitalización, conectores, excepciones y diccionario;
6. valores ya canónicos, preservados, bloqueados, ambiguos y fallidos técnicamente;
7. marcas, nombres legales, personas, direcciones, unidades, identificadores y secretos;
8. originales externos, snapshots, overrides, proyecciones y copias sincronizadas;
9. búsqueda exacta, forma, tildes, alias, tokens, transliteración y similitud deshabilitada;
10. ranking, empates, cursor, autorización y scope;
11. los cuatro modos de unicidad y carreras concurrentes;
12. trigger ausente, assertivo, derivador acotado y stamping defensivo;
13. escritura directa, credencial privilegiada y bypass controlado;
14. import, job, Edge Function, webhook, CSV y Excel;
15. lote total, parcial, reanudado, compensado y fallido;
16. auditoría raíz, evaluación del servicio y evento defensivo hijo;
17. misma clave idempotente con payload igual y distinto;
18. fuente, política y estado obsoletos;
19. transacción revertida por trigger;
20. propagación posterior al commit con destinos confirmados y pendientes;
21. helpers legacy iguales por nombre y distintos por salida;
22. paridad entre aplicación, servicio, RPC, job, trigger y ambientes;
23. rendimiento acotado del trigger y carga masiva fuera de la transacción;
24. frontera separada de VITAL;
25. ausencia de corrección, fusión o reasignación no autorizadas.

El corpus deberá reutilizar los escenarios de `TREQ-DATA-006` a `TREQ-DATA-190` cuya implementación depende de autoridad, versión, auditoría, búsqueda, unicidad, concurrencia o paridad entre capas.

#### 37. Hallazgos y carryovers

| ID               | Decisión o brecha                                                   | Resultado de esta tarea                                                | Propietario siguiente                                              |
| ---------------- | ------------------------------------------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------ |
| `DN-ARC-011-H01` | aplicación, funciones y triggers podían ejecutar reglas divergentes | una autoridad semántica y cuatro funciones cerradas aprobadas          | `SUPA-TRANS-003`; `SUPA-TRANS-006`; `SUPA-TRANS-007`               |
| `DN-ARC-011-H02` | las escrituras directas podían omitir política y auditoría          | RPC como frontera transaccional y defensa ante bypass aprobadas        | `SUPA-TRANS-005`; `DATA-NORM-TRANS-005`                            |
| `DN-ARC-011-H03` | el trigger podía convertirse en motor empresarial oculto            | cuatro modos limitados y prohibición de ambigüedad, red y orquestación | `SUPA-TRANS-005`; `SUPA-TRANS-009`; `SUPA-TRANS-010`               |
| `DN-ARC-011-H04` | previsualización podía confundirse con resultado confirmado         | reevaluación servidor y manejo de divergencia aprobados                | `SUPA-TRANS-007`; `DATA-NORM-TRANS-005`                            |
| `DN-ARC-011-H05` | búsqueda y ranking podían desplazarse al cliente                    | autoridad servidor y revalidación por ID estable aprobadas             | `SUPA-TRANS-007`; `SUPA-TRANS-009`; `SUPA-TRANS-010`               |
| `DN-ARC-011-H06` | consulta previa podía presentarse como unicidad concurrente         | protección atómica certificada reservada a RPC y base aprobada         | `SUPA-TRANS-005`; `DATA-NORM-TRANS-005`; `SUPA-TRANS-009`          |
| `DN-ARC-011-H07` | auditoría podía duplicarse o contradecirse entre capas              | un evento raíz y evidencias hijas vinculadas aprobados                 | tareas de gobierno de información; `SUPA-TRANS-009`                |
| `DN-ARC-011-H08` | imports, jobs y webhooks podían usar helpers propios                | mismo servicio, comandos batch e idempotencia por elemento aprobados   | `DATA-NORM-ARC-012`; `SUPA-TRANS-003`; `DATA-NORM-TRANS-006`       |
| `DN-ARC-011-H09` | propagación podía ejecutarse dentro de triggers                     | efectos hijos posteriores al commit y reanudación aprobados            | `DATA-NORM-TRANS-007`; `DATA-NORM-TRANS-008`                       |
| `DN-ARC-011-H10` | los helpers legacy carecen de clasificación de autoridad            | mapeo obligatorio antes de coexistencia, retiro o sustitución          | `SUPA-TRANS-003`; `SUPA-TRANS-006`; `SUPA-TRANS-014`               |
| `DN-ARC-011-H11` | valores externos todavía requieren contrato propio                  | preservación mantenida; decisión detallada reservada                   | `DATA-NORM-ARC-012`                                                |
| `DN-ARC-011-H12` | no existe todavía implementación física certificada                 | contrato lógico completo aprobado; materialización reservada           | `SUPA-TRANS-005` a `SUPA-TRANS-014`; `DATA-NORM-TRANS-004` a `009` |
| `DN-ARC-011-H13` | VITAL comparte infraestructura física                               | exclusión transversal mantenida                                        | `SUPA-ARC-025`                                                     |

#### 38. Decisiones reservadas

| Decisión                                                     | Tarea propietaria                             |
| ------------------------------------------------------------ | --------------------------------------------- |
| tratamiento de originales, mappings y eventos externos       | `DATA-NORM-ARC-012`                           |
| inventario exhaustivo y clasificación de consumidores legacy | `SUPA-TRANS-003`                              |
| tablas, columnas, constraints, índices, funciones y triggers | `SUPA-TRANS-005`                              |
| coexistencia de versiones y compatibilidad temporal          | `SUPA-TRANS-006`; `DATA-NORM-TRANS-004`       |
| adaptación de clientes, APIs, jobs e integraciones           | `SUPA-TRANS-007`; `SUPA-TRANS-014`            |
| orden técnico de migraciones y dependencias                  | `SUPA-TRANS-008`                              |
| pruebas de paridad, concurrencia e idempotencia              | `SUPA-TRANS-009`; `DATA-NORM-TRANS-009`       |
| rendimiento, capacidad, seguridad y observabilidad física    | `SUPA-TRANS-010`                              |
| rollback operativo y compensaciones                          | `SUPA-TRANS-011`; `DATA-NORM-TRANS-008`       |
| estrategia de corte, despliegue y recuperación               | `SUPA-TRANS-012`; `DATA-NORM-TRANS-005`       |
| paridad entre ambientes y artefactos                         | `SUPA-TRANS-013`; `SUPA-TRANS-014`            |
| baseline, dry-run, colisiones, backfill y lotes              | `DATA-NORM-TRANS-001` a `DATA-NORM-TRANS-007` |
| arquitectura consolidada de datos y frontera VITAL           | `SUPA-ARC-025`                                |

#### 39. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

Se crean los requisitos:

- `TREQ-DATA-191`;
- `TREQ-DATA-192`;
- `TREQ-DATA-193`;
- `TREQ-DATA-194`;
- `TREQ-DATA-195`;
- `TREQ-DATA-196`;
- `TREQ-DATA-197`;
- `TREQ-DATA-198`;
- `TREQ-DATA-199`;
- `TREQ-DATA-200`;
- `TREQ-DATA-201`;
- `TREQ-DATA-202`;
- `TREQ-DATA-203`;
- `TREQ-DATA-204`;
- `TREQ-DATA-205`;
- `TREQ-DATA-206`;
- `TREQ-DATA-207`;
- `TREQ-DATA-208`;
- `TREQ-DATA-209`;
- `TREQ-DATA-210`;
- `TREQ-DATA-211`;
- `TREQ-DATA-212`;
- `TREQ-DATA-213`;
- `TREQ-DATA-214`.

El detalle canónico de cada requisito reside en el registro 04A actualizado hasta esta tarea.

#### 40. Criterios de integridad

La política se considera íntegra para esta etapa cuando:

1. define exactamente cuatro capas lógicas y cuatro funciones de autoridad;
2. asigna al servicio de dominio la única autoridad semántica;
3. asigna a la RPC la frontera de autorización, revalidación y commit;
4. limita la aplicación a captura, guía y previsualización no vinculante;
5. limita el trigger a cuatro modos defensivos cerrados;
6. prohíbe decisiones ambiguas, red, scans y orquestación dentro de triggers;
7. exige descriptor de colocación para cada operación;
8. define siete familias de comando o consulta;
9. aplica las diez etapas del flujo transaccional en orden;
10. reevalúa toda previsualización antes del commit;
11. distribuye correctamente normalización, catálogos, diccionario y revisión;
12. conserva búsqueda, filtros y ranking como autoridad servidor;
13. protege los cuatro modos de unicidad y exige enforcement atómico certificado;
14. gobierna representaciones y roles de fuente sin convertir copias en autoridad;
15. bloquea escrituras directas y define bypass controlado;
16. obliga imports, jobs, lotes y externos a consumir el mismo servicio;
17. separa commit de propagación y prohíbe workflow oculto en trigger;
18. define una sola auditoría raíz y evita duplicados entre capas;
19. integra idempotencia, concurrencia, retries y obsolescencia;
20. define fallos cerrados sin fallback semántico;
21. preserva autorización, privilegio mínimo, masking y segregación;
22. limita costo del trigger y reserva carga masiva a procesos servidor;
23. exige mapeo y transición explícitos para helpers y mecanismos legacy;
24. incorpora corpus positivo, negativo, ambiguo, concurrente, batch y de paridad;
25. conserva VITAL fuera del alcance transversal;
26. no autoriza cambios físicos ni anticipa decisiones reservadas.

#### 41. Continuidad

```text
ÚLTIMA TAREA APROBADA
DATA-NORM-ARC-010 — Definir estrategia de unicidad y detección de duplicados normalizados
        ↓
TAREA ACTUAL APROBADA
DATA-NORM-ARC-011 — Definir capas de ejecución: aplicación, servicio de dominio, RPC y trigger defensivo
        ↓
SIGUIENTE TAREA RESERVADA
DATA-NORM-ARC-012 — Definir tratamiento de datos recibidos desde integraciones externas
```


### ✅ DATA-NORM-ARC-012 — Definir tratamiento de datos recibidos desde integraciones externas

**Estado:** APROBADA
**Tarea anterior:** `DATA-NORM-ARC-011 — Definir capas de ejecución: aplicación, servicio de dominio, RPC y trigger defensivo` — APROBADA
**Tarea siguiente:** `SUPA-ARC-025 — Consolidar y aprobar ADR de arquitectura canónica de datos`
**Tipo de tarea:** definición normativa de admisión, preservación, autenticidad, clasificación, mapeo, idempotencia, cuarentena, trazabilidad y tratamiento semántico de datos recibidos desde integraciones externas; sin DDL, DML, migraciones, backfills, correcciones de datos, activación de integraciones, cambios de contratos, funciones, RPC, triggers, clientes, jobs, credenciales, configuración ni despliegues

#### 1. Objetivo

Definir el contrato canónico mediante el cual Vento OS deberá recibir, verificar, preservar, clasificar y mapear datos provenientes de proveedores, sistemas gestionados, webhooks, APIs, archivos, importaciones, POS, herramientas operativas y otras fuentes externas, sin perder el valor original, sin convertir una representación externa en autoridad empresarial automática y sin ejecutar transformaciones silenciosas que impidan reconstruir qué fue recibido y cómo se obtuvo el resultado interno.

La política deberá separar transporte, autenticidad, evidencia original, interpretación estructural, mapeo semántico, comando interno, persistencia, auditoría y efectos posteriores. También deberá impedir que un payload válido técnicamente sea tratado como hecho empresarial confirmado, que un estado externo sobrescriba el estado canónico sin mapeo versionado, que eventos repetidos produzcan efectos duplicados, que mensajes fuera de orden reviertan hechos más recientes o que una integración degradada active fallbacks locales incompatibles.

#### 2. Artefacto producido

```text
VENTO_EXTERNAL_INBOUND_DATA_TREATMENT_POLICY@1.0.0
```

| Propiedad                          | Valor |
| ---------------------------------- | ----: |
| Clases cerradas de fuente externa  |     6 |
| Representaciones lógicas separadas |     7 |
| Etapas del pipeline de admisión    |    12 |
| Capas cerradas de validación       |     7 |
| Modos cerrados de mapeo            |     8 |
| Resultados cerrados de admisión    |    12 |
| Conceptos canónicos separados      |    10 |
| Estados cerrados de cuarentena     |     8 |
| Requisitos de prueba nuevos        |    26 |
| Cambios físicos autorizados        |     0 |

#### 3. Fuentes canónicas consumidas

| Fuente                        | Decisión consumida                                                                                                                                             |
| ----------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `01_PROTOCOLO.md`             | continuidad, una sola tarea, fase exclusivamente documental, preservación histórica, lectura remota obligatoria y separación entre definición e implementación |
| `delivery-contract.json`      | identidad del artefacto y actualización integral del registro 04A al crear requisitos                                                                          |
| `active-sequence.json`        | `DATA-NORM-ARC-012` como tarea actual y `SUPA-ARC-025` como siguiente tarea reservada                                                                          |
| `DATA-NORM-AUD-001`           | separación entre valor mostrado, valor de búsqueda, valor externo original, identificador técnico, texto libre y estructuras compuestas                        |
| `DATA-NORM-AUD-006`           | Supabase Auth, Wompi, Google Maps, Google Wallet, Expo Push, imports, webhooks, jobs y clientes como superficies con transformaciones y contratos distintos    |
| `DATA-NORM-AUD-007`           | impacto de cambios textuales sobre búsquedas, integraciones, relaciones, consumidores y paridad entre capas                                                    |
| `DATA-NORM-ARC-001` y `002`   | política por coordenada, clases semánticas, representaciones, roles de fuente, preservación de originales y comportamiento cerrado                             |
| `DATA-NORM-ARC-003` a `006`   | capitalización, conectores, excepciones y diccionario como reglas internas que no pueden aplicarse por inferencia sobre originales externos                    |
| `DATA-NORM-ARC-007`           | revisión humana, evidencia, segregación, decisiones inmutables y prohibición de aplicar propuestas mientras un caso permanece abierto                          |
| `DATA-NORM-ARC-008`           | derivaciones de búsqueda separadas, aliases explícitos, ranking explicable y prohibición de convertir coincidencias en identidad                               |
| `DATA-NORM-ARC-009`           | versiones inmutables, auditoría, procedencia, idempotencia, concurrencia, reintentos, replay, payload conflictivo y minimización de datos sensibles            |
| `DATA-NORM-ARC-010`           | identidad, scopes, referencias externas por emisor, colisiones, duplicidad y prohibición de fusionar por representación comparativa                            |
| `DATA-NORM-ARC-011`           | servicio de dominio como autoridad semántica, RPC como frontera transaccional, imports y webhooks bajo el mismo contrato y trigger limitado a defensas         |
| `INT-APP-001` a `INT-APP-010` | separación entre comando, evento empresarial, evento de integración, notificación, sobre común, idempotencia y prohibición de escrituras cruzadas sin contrato |
| Registro 04A vigente          | requisitos históricos, relaciones y secuencia del dominio `DATA` hasta `TREQ-DATA-214`                                                                         |

#### 4. Evidencia que obliga esta política

La auditoría aprobada identificó superficies externas con semánticas diferentes que no pueden tratarse mediante una función universal:

| Evidencia canónica                                                                       | Riesgo que deberá resolver esta política                                                                                              |
| ---------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| Supabase Auth transmite correo, metadata, nombre, rol y sede                             | metadata gestionada por un proveedor puede confundirse con fuente empresarial o duplicar transformaciones de identidad laboral        |
| Wompi transmite evento, referencia, estado, moneda y payload                             | un estado externo puede mapearse sin preservar el original, recibirse repetido, llegar fuera de orden o compartir ID con otro payload |
| Google Maps devuelve `place_id`, dirección, etiquetas y respuesta del proveedor          | la proyección del proveedor puede convertirse indebidamente en dirección oficial o identidad interna                                  |
| Google Wallet y Expo Push producen o reciben respuestas, tokens y estados técnicos       | respuestas de canal pueden confundirse con hechos empresariales o exponer tokens y metadata                                           |
| imports CSV, Excel, POS, PULSO, VISO, HubRise y webhooks omiten validaciones de interfaz | cada canal puede aplicar recortes, vacíos, formatos o helpers propios y producir resultados divergentes                               |
| siete jobs activos y rutinas HTTP pueden reintentar o propagar datos                     | timeout, entrega al menos una vez y éxito parcial pueden duplicar efectos o perder trazabilidad                                       |
| cobertura incompleta de clientes externos al repositorio                                 | una política local no demuestra paridad transversal                                                                                   |
| Edge Functions activas no están necesariamente atadas a una única revisión de fuente     | el mismo nombre desplegado puede ejecutar otro artefacto o versión                                                                    |

La existencia de un proveedor, SDK, firma, webhook o payload almacenado no demuestra por sí sola autoridad, autenticidad, vigencia, completitud ni equivalencia con una entidad de Vento OS.

#### 5. Alcance y fronteras

Esta tarea define:

1. las clases de fuente externa y su nivel mínimo de confianza;
2. las representaciones que deberán conservarse separadas desde la recepción hasta el commit;
3. el sobre lógico mínimo de un ingreso externo;
4. las reglas para preservar payload, bytes, estructura, headers, referencias y procedencia;
5. la autenticación del canal, integridad del mensaje y autorización del emisor;
6. el pipeline cerrado de admisión y sus doce resultados;
7. la compatibilidad de schema, contrato, versión, locale, encoding y semántica temporal;
8. la clasificación por clase semántica antes de cualquier normalización;
9. los modos permitidos de mapeo entre valores externos e internos;
10. la identidad, idempotencia, deduplicación y conflicto de eventos externos;
11. la conducta ante eventos tardíos, fuera de orden, parciales, corregidos o retractados;
12. la semántica de ausencia, `null`, vacío, clear explícito y actualización parcial;
13. el tratamiento de importaciones por archivo, lote, fila y celda;
14. la cuarentena, revisión, reanudación, replay y reconciliación;
15. la autoridad del proveedor, del dominio interno y del propietario de cada mapeo;
16. la aplicación de la arquitectura de capas aprobada en `DATA-NORM-ARC-011`;
17. la seguridad, privacidad, minimización, retención y eliminación lógica;
18. el corpus mínimo de conformidad.

Esta tarea no define:

- tablas, columnas, buckets, índices, constraints, RLS, grants, funciones, RPC, triggers, colas, topics, cron o almacenamiento físico;
- URLs, nombres de endpoints, secretos, certificados, algoritmos criptográficos concretos o ventanas numéricas de replay;
- contratos nuevos con proveedores ni cambios de payload de terceros;
- reglas empresariales definitivas para cada integración futura no inventariada;
- una fuente de autoridad concreta para cada campo de todos los proveedores;
- correcciones, backfills, importaciones reales, activación de webhooks, reenvíos, despliegues o cutover;
- fusiones, selección de sobreviviente, reasignación de relaciones o activación de unicidad;
- modificaciones sobre VITAL.

Las decisiones físicas y operativas permanecen en `SUPA-ARC-025`, `SUPA-TRANS-003`, `SUPA-TRANS-005` a `SUPA-TRANS-014` y `DATA-NORM-TRANS-001` a `DATA-NORM-TRANS-009`, según su propiedad.

#### 6. Principios obligatorios

1. **El original externo se preserva.** Una forma interna nunca sustituye la evidencia de lo recibido.
2. **Transporte no equivale a verdad empresarial.** Firma, autenticación o entrega válida solo demuestran propiedades del canal y del mensaje.
3. **La autoridad se declara por campo.** Un proveedor puede ser autoritativo para una referencia y no para un nombre, estado o relación.
4. **Todo mapeo es explícito y versionado.** No se traducen estados, monedas, unidades, roles, direcciones o identidades mediante listas locales o inferencias.
5. **El ingreso falla de forma cerrada.** Ausencia de contrato, versión, autenticidad, scope o mapeo conserva evidencia y bloquea efectos empresariales.
6. **La idempotencia utiliza identidad externa y payload.** Un retry compatible reutiliza el resultado; un mismo ID con otro payload produce conflicto.
7. **El orden externo no se presume.** Timestamp de proveedor, llegada, registro y efecto se conservan separadamente.
8. **Ausente, `null`, vacío y clear son distintos.** Ninguno se convierte silenciosamente en otro.
9. **La estructura precede a la cadena visible.** Cantidad, moneda, unidad, dirección, referencia y componentes no se aplanan para decidir identidad.
10. **Los procesos no interactivos usan la misma autoridad semántica.** CSV, Excel, jobs, webhooks y Edge Functions no mantienen normalizadores paralelos.
11. **Aceptar un mensaje no confirma un proceso.** ACK técnico, evento de integración y evento empresarial son hechos distintos.
12. **La cuarentena preserva; no corrige.** Un caso bloqueado no se modifica para forzar su admisión.
13. **La historia no se reinterpreta.** Una versión nueva de mapping no cambia silenciosamente decisiones anteriores.
14. **Los secretos no se convierten en datos analíticos.** Tokens, firmas y credenciales se minimizan y protegen.
15. **VITAL permanece separado.** No hereda mappings, identificadores ni contratos transversales de Vento OS.

#### 7. Conceptos canónicos separados

| Concepto                      | Definición                                                                                         | No equivale a                                |
| ----------------------------- | -------------------------------------------------------------------------------------------------- | -------------------------------------------- |
| `EXTERNAL_DELIVERY`           | intento concreto de entrega por webhook, API, archivo, import o canal gestionado                   | hecho empresarial confirmado                 |
| `TRANSPORT_EVIDENCE`          | headers, firma, certificado, checksum, identidad de conexión y resultado de verificación           | autoridad sobre el significado del payload   |
| `EXTERNAL_ORIGINAL_PAYLOAD`   | bytes o estructura recibidos, preservados con procedencia y huella                                 | valor interno normalizado                    |
| `EXTERNAL_SEMANTIC_RECORD`    | interpretación estructural de un mensaje según schema y contrato externos                          | entidad interna                              |
| `VERSIONED_MAPPING_DECISION`  | regla que traduce una forma externa a una representación o comando interno                         | corrección del original                      |
| `INTERNAL_CANONICAL_COMMAND`  | solicitud interna validada que puede atravesar la RPC y el servicio de dominio                     | evento empresarial ya ocurrido               |
| `INTERNAL_CONFIRMED_EFFECT`   | resultado persistido y auditado después de autorización, revalidación y commit                     | aceptación del transporte                    |
| `QUARANTINED_EXTERNAL_CASE`   | evidencia preservada cuya autenticidad, schema, mapping, autoridad o contexto no permite continuar | rechazo destructivo ni corrección automática |
| `INTEGRATION_ACKNOWLEDGEMENT` | respuesta técnica de recepción, rechazo o duplicado                                                | aprobación del hecho empresarial             |
| `ENTERPRISE_EVENT`            | hecho durable emitido después del commit interno conforme al catálogo de eventos                   | reenvío del payload externo                  |

Las implementaciones deberán conservar referencias entre estos conceptos sin fusionarlos en una sola fila, log o estado opaco.

#### 8. Clases cerradas de fuente externa

| Clase                                  | Definición                                                                              | Confianza mínima y restricción                                                                  |
| -------------------------------------- | --------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- |
| `SIGNED_PROVIDER_EVENT`                | evento de proveedor con mecanismo contractual de firma o integridad                     | verificar identidad, integridad, versión y replay; la firma no resuelve semántica empresarial   |
| `AUTHENTICATED_PARTNER_API`            | dato obtenido mediante API autenticada de un partner o plataforma                       | validar tenant, ambiente, scope, contrato y paginación; no asumir completitud global            |
| `MANAGED_IDENTITY_OR_PLATFORM_DATA`    | metadata, claims o resultados de un servicio gestionado como Supabase Auth              | separar identidad del proveedor, metadata recibida y atributos empresariales                    |
| `USER_MEDIATED_PROVIDER_RESPONSE`      | respuesta externa obtenida a partir de una acción humana, como selección de Google Maps | conservar query, resultado y selección; no convertir sugerencia en dirección oficial automática |
| `FILE_OR_BATCH_IMPORT`                 | CSV, Excel, archivo exportado, lote o transferencia estructurada                        | fijar archivo, hash, formato, fila, encoding, mapping y resultado por elemento                  |
| `LEGACY_OR_UNVERIFIED_EXTERNAL_SOURCE` | dato de sistema heredado, herramienta manual o canal sin autenticidad suficiente        | preservar y cuarentenar o admitir solo en observación; nunca mutar por confianza implícita      |

Una integración podrá combinar clases, pero deberá declarar cuál aplica a cada entrega y qué evidencia sustenta el cambio de confianza.

#### 9. Representaciones lógicas separadas

| Representación                    | Contenido                                                                                       | Regla obligatoria                                                   |
| --------------------------------- | ----------------------------------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `TRANSPORT_ENVELOPE`              | canal, endpoint lógico, headers permitidos, emisor, ambiente, timestamps y referencias técnicas | preservar metadatos necesarios sin almacenar secretos completos     |
| `EXTERNAL_ORIGINAL`               | payload original o referencia inmutable a este                                                  | no reescribir, capitalizar, traducir ni completar                   |
| `VERIFIED_EXTERNAL_EVIDENCE`      | resultado de firma, checksum, autenticación, schema y contrato                                  | registrar prueba y versión sin convertirla en contenido empresarial |
| `EXTERNAL_PARSED_STRUCTURE`       | campos obtenidos por parseo determinista conforme a schema                                      | mantener vínculo con posiciones, claves o celdas originales         |
| `INTERNAL_MAPPING_RESULT`         | valores internos derivados mediante mapping aprobado                                            | conservar entrada, mapping, salida, motivo y versión                |
| `INTERNAL_CANONICAL_INPUT`        | comando o DTO interno autorizado para evaluación semántica                                      | no persistir como hecho hasta superar RPC y commit                  |
| `QUARANTINE_OR_REVIEW_PROJECTION` | vista minimizada para análisis de bloqueos y evidencia                                          | no adquirir autoridad ni exponer payload sensible innecesario       |

Una misma entrega podrá producir varias representaciones. Ninguna representación derivada reemplaza la original ni modifica retrospectivamente su interpretación histórica.

#### 10. Sobre lógico mínimo de ingreso

Toda entrega deberá poder expresar, cuando corresponda:

```text
external_delivery_id
integration_key
integration_contract_version
source_class
provider_or_issuer
provider_environment
provider_tenant_or_account
transport_kind
endpoint_or_import_profile
external_event_or_record_id
external_object_type
external_object_id
external_revision_or_sequence
provider_occurred_at
provider_created_at
received_at
verified_at
content_type
content_encoding
schema_identifier
schema_version
payload_reference
payload_digest
transport_evidence_reference
signature_or_checksum_metadata
correlation_id
causation_reference
external_idempotency_key
internal_logical_operation_id
mapping_profile
mapping_version
processing_status
sensitivity_class
retention_class
```

Reglas:

1. los campos no aplicables deberán declararse de forma explícita, no inferirse por ausencia ambigua;
2. los identificadores del proveedor conservarán emisor, ambiente, tenant y tipo;
3. `received_at` no sustituye el momento declarado por el proveedor;
4. una referencia protegida podrá sustituir el payload completo en superficies de consulta, nunca en la evidencia autorizada cuando esta sea necesaria;
5. el sobre no convierte headers o claims no confiables en identidad verificada;
6. todo mapping deberá vincularse a este sobre o a una unidad hija de archivo o lote.

#### 11. Preservación del payload original

1. El payload se preservará como bytes, texto o estructura según el contrato de transporte.
2. La huella se calculará sobre la representación definida por el contrato, no sobre una versión normalizada localmente.
3. Whitespace, orden de claves, Unicode, encoding, signos y caja solo podrán canonicalizarse antes de la huella si el protocolo externo lo exige de forma explícita y versionada.
4. Un JSON parseado no reemplaza la evidencia de bytes cuando firma, orden, duplicidad de claves o encoding puedan ser relevantes.
5. Archivos conservarán hash, tamaño, nombre externo, media type, encoding, hoja, fila, columna y perfil de importación cuando aplique.
6. Un payload truncado, malformado o superior al límite permitido se rechazará o cuarentenará conservando evidencia mínima segura.
7. Secretos, credenciales y material firmado no se duplicarán en logs, métricas, notas ni errores.
8. La eliminación física futura deberá respetar retención, investigación, conciliación y obligaciones legales sin dejar referencias engañosas.
9. Una transformación interna nunca se escribirá sobre el mismo campo o artefacto que representa el original.

#### 12. Autenticidad, integridad y autorización del emisor

Las siguientes comprobaciones permanecen separadas:

| Comprobación              | Pregunta respondida                                                              | No demuestra                                                     |
| ------------------------- | -------------------------------------------------------------------------------- | ---------------------------------------------------------------- |
| autenticación del canal   | la conexión o credencial corresponde a un actor técnico esperado                 | que cada campo sea correcto                                      |
| verificación de firma     | el mensaje coincide con el material firmado bajo el contrato                     | que el emisor tenga autoridad empresarial sobre todos los campos |
| checksum o digest         | los bytes no cambiaron respecto de la referencia                                 | intención, vigencia o unicidad                                   |
| autorización del emisor   | el emisor puede enviar ese tipo de mensaje para ese tenant, ambiente y scope     | aceptación automática del efecto                                 |
| validación de replay      | la entrega está dentro de la política temporal o ya fue procesada                | orden empresarial total                                          |
| validación de contrato    | schema, versión y tipo de evento son soportados                                  | mapeo semántico completo                                         |
| validación de procedencia | provider, cuenta, ambiente y endpoint se vinculan con una integración registrada | identidad interna de la entidad referenciada                     |

Una comprobación fallida no se corrige cambiando el payload. Una evidencia no verificable produce bloqueo o cuarentena según el riesgo y nunca un fallback a una fuente menos confiable sin decisión explícita.

#### 13. Pipeline cerrado de admisión

Toda entrega seguirá, conceptualmente, estas etapas:

```text
1. recibir sin interpretar semántica empresarial
        ↓
2. asignar identidad de entrega y correlación
        ↓
3. preservar sobre, original o referencia protegida y huella
        ↓
4. verificar canal, firma, integridad, emisor y replay
        ↓
5. resolver integración, ambiente, tenant, contrato y schema
        ↓
6. parsear estructura sin perder procedencia
        ↓
7. validar tipos, presencia, límites y semántica técnica
        ↓
8. clasificar campos, representaciones y autoridad
        ↓
9. aplicar mappings explícitos y versionados
        ↓
10. construir comando interno o caso de cuarentena
        ↓
11. revalidar y confirmar efectos mediante servicio de dominio y RPC
        ↓
12. registrar resultado, ACK y efectos posteriores idempotentes
```

No se permite saltar desde recepción a persistencia empresarial porque el proveedor parezca confiable, el payload coincida con un ejemplo o el cliente ya haya transformado los datos.

#### 14. Capas cerradas de validación

| Capa                          | Alcance                                                                        | Resultado esperado                                                 |
| ----------------------------- | ------------------------------------------------------------------------------ | ------------------------------------------------------------------ |
| `TRANSPORT_VALIDATION`        | método, tamaño, content type, encoding, headers y límites                      | aceptar transporte o rechazar antes de interpretación              |
| `AUTHENTICITY_VALIDATION`     | firma, checksum, credencial, certificado, replay y emisor                      | evidencia verificada o rechazo de seguridad                        |
| `CONTRACT_VALIDATION`         | integración, ambiente, tenant, evento, schema y versión                        | contrato compatible o bloqueo de versión                           |
| `STRUCTURAL_VALIDATION`       | parseo, tipos, claves, arrays, cardinalidad y campos obligatorios              | estructura utilizable o cuarentena                                 |
| `SEMANTIC_MAPPING_VALIDATION` | enums, estados, moneda, unidad, locale, identifiers y reglas de mapping        | resultado interno o revisión                                       |
| `DOMAIN_AUTHORITY_VALIDATION` | owner, scope, estado actual, relación, permisos y precondiciones empresariales | comando admisible o bloqueo                                        |
| `COMMIT_VALIDATION`           | idempotencia, concurrencia, orden, versión de fuente, invariantes y atomicidad | efecto confirmado, duplicado compatible, conflicto o fallo técnico |

Cada capa deberá conservar su propio resultado. Un fallo de mapping no se reportará como firma inválida y un fallo técnico no se presentará como rechazo empresarial.

#### 15. Compatibilidad de schema y contrato

1. Cada integración declarará versiones soportadas y su compatibilidad.
2. Una versión desconocida no se procesará mediante la versión más cercana ni mediante `latest` implícito.
3. Campos adicionales solo serán ignorables cuando el contrato los permita y la evidencia original permanezca íntegra.
4. La ausencia de un campo antes obligatorio no se completará con un default local no versionado.
5. Un cambio de tipo, unidad, significado, enum, cardinalidad o semántica de `null` será tratado como cambio potencialmente incompatible.
6. Un alias de campo deberá ser explícito, direccional, temporal y auditable.
7. La coexistencia de versiones deberá declarar cuál admite nuevas entregas, cuál permanece para replay y cuándo termina la ventana.
8. Un payload histórico se interpreta con el contrato vigente al momento de su entrega o con un modo `REPLAY_ONLY`, nunca con el mapping actual por defecto.
9. La versión desplegada del adaptador deberá estar vinculada a artefacto, digest y revisión de fuente conforme a `DATA-NORM-ARC-009`.

#### 16. Clasificación semántica de campos externos

Antes de normalizar o mapear, cada campo deberá resolver:

```text
clase semántica
+ representación = EXTERNAL_ORIGINAL o derivada
+ rol de fuente = EXTERNAL_EVIDENCE o autoridad aprobada
+ provider y contrato
+ dominio, entidad y campo interno destino
+ finalidad
+ versión de mapping
```

Reglas por clase:

- nombres comerciales podrán producir una forma interna solo mediante política explícita y sin alterar el original;
- marcas, nombres legales, personas y direcciones conservarán forma y procedencia y exigirán autoridad apropiada;
- estados, tipos, roles, monedas y unidades se mapearán como vocabularios controlados, no como prosa;
- SKU, referencias, `place_id`, IDs de proveedor, tokens y códigos conservarán contrato técnico y scope de emisor;
- texto libre se preservará y no recibirá corrección comercial automática;
- secretos, firmas y material criptográfico se preservarán exactamente o mediante referencia protegida;
- campos no clasificados recibirán `UNCLASSIFIED_PRESERVE` y no producirán mutación automática.

#### 17. Modos cerrados de mapeo

| Modo                              | Conducta                                                                                               |
| --------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `EXACT_CONTRACT_MAPPING`          | una forma externa exacta produce el valor interno declarado por el contrato                            |
| `VERSIONED_ENUM_MAPPING`          | estado, tipo, rol, moneda o código se traduce mediante tabla cerrada y versionada                      |
| `APPROVED_ALIAS_MAPPING`          | un alias explícito, acotado y vigente enlaza la forma externa con una forma interna                    |
| `STRUCTURED_COMPONENT_MAPPING`    | componentes ya parseados se convierten conservando cantidad, unidad, emisor, contexto y precisión      |
| `DERIVE_WITHOUT_SOURCE_MUTATION`  | se produce una representación interna separada sin sobrescribir el original                            |
| `PRESERVE_AND_DEFER`              | se conserva la evidencia y no se produce comando hasta completar contrato o autoridad                  |
| `HUMAN_REVIEW_REQUIRED`           | el valor se conserva y se crea o vincula un caso de revisión                                           |
| `ESCALATE_STRUCTURAL_OR_IDENTITY` | el problema corresponde a estructura, identidad, unicidad, legalidad o relación y no a mapping textual |

No existe matching difuso, aprendizaje por frecuencia, selección del primer resultado ni equivalencia por normalización como modo de mapping.

#### 18. Resultados cerrados de admisión

| Resultado                            | Significado                                                                   |
| ------------------------------------ | ----------------------------------------------------------------------------- |
| `ACCEPTED_INTERNAL_EFFECT_CONFIRMED` | el comando fue autorizado y el efecto interno quedó confirmado                |
| `ACCEPTED_NO_BUSINESS_CHANGE`        | la entrega fue válida, pero no requirió cambio empresarial                    |
| `DUPLICATE_REPLAY_PRIOR_RESULT`      | misma identidad externa y mismo payload reutilizaron el resultado previo      |
| `PRESERVED_EXTERNAL_ONLY`            | la evidencia se conservó sin producir efecto interno                          |
| `QUARANTINED_SCHEMA`                 | schema, versión o estructura no permiten continuar                            |
| `QUARANTINED_MAPPING`                | no existe mapping compatible o la forma es ambigua                            |
| `QUARANTINED_AUTHORITY`              | falta owner, scope, fuente o autoridad empresarial                            |
| `BLOCKED_IDEMPOTENCY_CONFLICT`       | la misma identidad externa llegó con payload incompatible                     |
| `BLOCKED_ORDER_OR_STALE_EVENT`       | la entrega es obsoleta, fuera de orden o contradice la revisión actual        |
| `REJECTED_AUTHENTICITY_OR_SECURITY`  | canal, firma, checksum, emisor o replay no superaron controles                |
| `REJECTED_UNSUPPORTED_CONTRACT`      | integración, tipo de entrega o contrato no están admitidos                    |
| `FAILED_TECHNICAL`                   | la ejecución no pudo completarse y no se presenta como aceptación empresarial |

Una misma entrega tendrá un resultado final y podrá conservar resultados intermedios por capa. El ACK deberá reflejar únicamente la información autorizada para el emisor.

#### 19. Identidad externa e idempotencia

La identidad lógica de una entrega deberá incluir, según contrato:

```text
integration_key
+ provider_or_issuer
+ provider_environment
+ provider_tenant_or_account
+ external_event_or_record_id
+ external_object_type
+ delivery_class
+ contract_version
```

Reglas:

1. un ID externo nunca se considera global sin emisor, ambiente, tenant y tipo;
2. la misma identidad con el mismo `payload_digest` y precondiciones reutiliza el resultado anterior;
3. la misma identidad con otro digest produce `BLOCKED_IDEMPOTENCY_CONFLICT`;
4. la ausencia de ID externo requiere una clave interna derivada del contrato, nunca solo del texto normalizado;
5. cada fila de un archivo podrá tener identidad propia además de la identidad del archivo y del lote;
6. un retry técnico conservará la operación lógica y distinguirá intentos;
7. timeout o respuesta perdida exigirán consultar el resultado antes de repetir efectos;
8. la expiración física de una clave no permite duplicar un efecto financiero, laboral, operativo o relacional ya confirmado;
9. un proveedor que reutiliza IDs requiere una versión correctiva del contrato o cuarentena, no una deduplicación relajada.

#### 20. Orden, concurrencia, eventos tardíos y correcciones externas

1. Se conservarán `provider_occurred_at`, `provider_created_at`, `received_at`, `evaluated_at`, `effect_committed_at` y `recorded_at` cuando apliquen.
2. El orden de llegada no define el orden empresarial.
3. Una secuencia o revisión externa se comparará únicamente dentro de su emisor, objeto, ambiente y contrato.
4. Un evento más antiguo no sobrescribirá un estado interno más reciente sin una regla de reconciliación explícita.
5. Eventos tardíos podrán preservarse como historia, producir reconciliación o bloquearse; no se descartarán silenciosamente.
6. Una corrección o retractación externa será un mensaje nuevo vinculado al anterior, no una edición de evidencia.
7. Dos entregas concurrentes sobre la misma entidad deberán revalidar fuente, estado, versión, scope e idempotencia en la RPC.
8. Un proveedor sin garantía de orden deberá declarar estrategia de versión, secuencia, timestamp, consulta de estado o reconciliación.
9. Un lote parcial conservará resultados por elemento y no se presentará como éxito total.
10. El replay controlado no volverá a emitir efectos confirmados ni cambiará el mapping aplicado históricamente.

#### 21. Ausencia, `null`, vacío y actualizaciones parciales

Se distinguen obligatoriamente:

| Estado externo    | Significado inicial                                  | Conducta                                                                |
| ----------------- | ---------------------------------------------------- | ----------------------------------------------------------------------- |
| campo ausente     | el proveedor no lo envió o el contrato no lo incluye | no modificar el valor interno salvo semántica PATCH explícita           |
| `null` explícito  | ausencia declarada por el proveedor                  | mapear solo si el contrato define su significado                        |
| cadena vacía      | valor presente sin caracteres                        | no convertir automáticamente a `null`, ausencia o clear                 |
| solo espacios     | valor presente cuya validez depende del contrato     | preservar original; normalización interna solo si está autorizada       |
| clear explícito   | instrucción contractual para retirar un valor        | exigir permiso, precondición, auditabilidad y campo nullable compatible |
| valor desconocido | el proveedor declara desconocimiento                 | conservar semántica distinta de ausencia y no aplicable                 |
| no aplicable      | el campo no corresponde al caso                      | no convertir en placeholder textual                                     |
| valor parcial     | componente incompleto de una estructura              | bloquear efecto o preservar hasta completar según política              |

Un import o API no podrá utilizar `N/A`, `0`, `-`, `SIN DATO` u otro placeholder como equivalente universal sin mapping explícito.

#### 22. Números, moneda, unidades y precisión

1. Los números se parsearán con locale, separador decimal, separador de miles, signo, escala y precisión declarados.
2. No se inferirá locale desde la IP, navegador o sede cuando el contrato no lo declare.
3. La moneda conservará código externo, valor original, monto minor unit cuando aplique y mapping a código canónico.
4. Pasar moneda a mayúsculas es una canonicalización técnica condicionada, no una corrección comercial.
5. Cantidad y unidad se mapearán por componentes; `500 g`, `0.5 kg` y una equivalencia matemática no demuestran el mismo propósito operativo.
6. Conversión de unidades exige catálogo, factor, precisión, rounding mode, vigencia y finalidad explícitos.
7. Una pérdida de precisión, overflow o valor fuera de rango produce bloqueo o cuarentena.
8. Importes financieros no se corrigen por redondeo silencioso.
9. Un código de unidad o moneda desconocido se preserva y no se aproxima al más parecido.

#### 23. Tiempo, zona, locale, Unicode y encoding

1. Todo timestamp conservará valor original, zona u offset, precisión y significado contractual.
2. Un timestamp sin zona no se interpretará mediante la zona local del servidor por defecto.
3. DST, ambigüedad de fecha, formatos regionales y calendarios deberán resolverse por contrato.
4. Fechas y horas inválidas o imposibles se bloquean; no se corrigen por intuición.
5. El encoding del transporte o archivo se declara y valida antes del parseo.
6. Reemplazar caracteres inválidos por `�`, retirar diacríticos o transliterar sin evidencia queda prohibido.
7. La composición Unicode interna podrá derivarse conforme a una política, preservando siempre el original.
8. Idioma y locale pertenecen al mapping y no se infieren desde una palabra aislada.
9. Cambiar versión Unicode, parser o locale constituye cambio de algoritmo y requiere nueva versión y corpus.

#### 24. Archivos, importaciones y lotes

Toda importación deberá conservar:

```text
import_profile
file_id
file_name_external
file_digest
file_size
content_type
encoding
delimiter
quote_and_escape_rules
sheet_or_section
header_mapping_version
row_number
column_or_path
raw_cell_or_reference
row_digest
batch_id
chunk_id
```

Reglas:

1. el archivo se valida antes de procesar filas;
2. la cabecera y cada columna se mapean mediante una versión explícita;
3. una columna inesperada no se ignora si puede cambiar significado o evidencia;
4. cada fila conserva resultado, idempotencia, error, mapping y referencia al original;
5. filas válidas y bloqueadas podrán coexistir solo cuando el modo de atomicidad del perfil lo autorice;
6. la atomicidad total, parcial o por grupo se declara antes de ejecutar;
7. reanudar omite filas confirmadas y revalida pendientes;
8. el orden de chunks no cambia semántica, versión ni resultado;
9. una corrección manual del archivo crea otro artefacto y otra importación vinculada;
10. exportar y volver a importar no convierte una proyección en fuente autoritativa;
11. fórmulas, celdas calculadas, macros y formatos visibles no se interpretan como valores sin contrato;
12. CSV y Excel no comparten parser ni semántica implícita.

#### 25. Cuarentena y revisión

Los estados cerrados son:

| Estado                      | Significado                                                                   |
| --------------------------- | ----------------------------------------------------------------------------- |
| `QUARANTINED_NEW`           | evidencia preservada y triage pendiente                                       |
| `AWAITING_AUTHENTICITY`     | falta verificar firma, emisor, checksum o procedencia                         |
| `AWAITING_CONTRACT`         | integración, schema o versión no están resueltos                              |
| `AWAITING_MAPPING`          | falta mapping o existe forma externa no catalogada                            |
| `AWAITING_DOMAIN_AUTHORITY` | falta owner, scope o decisión empresarial                                     |
| `UNDER_RECONCILIATION`      | se compara con estado interno, entregas relacionadas o fuente actual          |
| `RESOLVED_REPROCESSABLE`    | existe decisión versionada y la entrega puede reevaluarse de forma controlada |
| `RESOLVED_NO_EFFECT`        | la evidencia se conserva y queda cerrado sin efecto empresarial               |

Reglas:

1. cuarentena no significa eliminación, aceptación ni rechazo definitivo del proveedor;
2. toda espera tendrá owner, evidencia faltante y fecha de revisión;
3. el payload visible a revisores se minimizará según finalidad;
4. una corrección propuesta no modificará el original;
5. la resolución podrá crear una versión de mapping, contrato o clasificación, pero no activar por sí sola un backfill;
6. el reprocess utilizará la evidencia original, la nueva versión explícita y una operación idempotente vinculada;
7. casos de identidad, legalidad, estructura o unicidad se escalarán a la autoridad correspondiente;
8. no existe cierre por silencio, vencimiento o mayoría de casos similares.

#### 26. Tratamiento de integraciones observadas

| Integración o canal                              | Original que deberá preservarse                                             | Mapping interno permitido                                                              | Restricción principal                                                                    |
| ------------------------------------------------ | --------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| Supabase Auth                                    | provider user ID, correo recibido, metadata, claims y evento aplicable      | identidad técnica, contacto y atributos laborales mediante contratos separados         | metadata Auth no sustituye `employees`, roles, sedes ni decisiones laborales             |
| Wompi                                            | evento, referencia, estado, moneda, timestamps, firma y payload             | estado canónico, referencia interna y resultado financiero mediante mapping versionado | preservar estado externo; impedir replay, fuera de orden y mismo ID con payload distinto |
| Google Maps                                      | query, `place_id`, dirección, componentes, locale y respuesta del proveedor | proyección o componentes internos de dirección según selección y política              | sugerencia del proveedor no define identidad, sede ni dirección oficial por sí sola      |
| Google Wallet                                    | respuesta, identificadores y estado técnico recibido del canal              | estado de proyección o sincronización separado                                         | no convertir confirmación técnica en hecho empresarial ni retroalimentar texto fuente    |
| Expo Push                                        | ticket, receipt, token afectado, error y metadata permitida                 | estado técnico del envío e invalidación gobernada de token                             | no almacenar token en logs ni interpretar entrega como lectura o acción humana           |
| CSV y Excel                                      | archivo, hoja, fila, celda, encoding y perfil                               | comando interno por fila o grupo conforme a mapping                                    | no perder errores parciales ni aplicar helpers de interfaz                               |
| POS, HubRise, webhooks y herramientas operativas | IDs, payload, emisor, ambiente, timestamps y contrato                       | comandos internos mediante adaptador y servicio de dominio                             | ningún canal recibe bypass por operar sin interfaz                                       |

La tabla documenta familias observadas y no afirma que todos los contratos estén implementados, completos o activos.

#### 27. Autoridad por campo y propiedad del mapping

1. Cada mapping tendrá propietario empresarial, steward técnico y evidencia contractual.
2. La autoridad podrá variar por campo dentro del mismo payload.
3. Un proveedor de identidad puede ser autoritativo para su `provider_user_id`, pero no para el rol operativo efectivo.
4. Un procesador de pagos puede ser autoritativo para el estado que reporta, mientras Vento OS conserva autoridad sobre el proceso empresarial derivado.
5. Google Maps puede proveer un `place_id` y componentes, pero una persona o proceso interno confirma su uso operativo.
6. Un archivo entregado por una persona conserva autor, canal y fecha; no se vuelve fuente canónica por estar firmado o enviado por un administrador.
7. El owner del mapping no podrá ampliar la autoridad del proveedor sin decisión del dominio afectado.
8. Un mapping transversal exige revisión de todos los dominios consumidores y no se infiere por ausencia de reglas locales.
9. VITAL requerirá owners, mappings y contratos propios.

#### 28. Ciclo de vida y versionado de mappings

Cada mapping deberá expresar:

```text
mapping_key
mapping_version_id
integration_key
external_contract_version
external_field_or_path
external_value_or_pattern
internal_target_coordinate
mapping_mode
canonical_internal_value_or_action
authority_reference
evidence_reference
status
effective_from
effective_to
supersedes_mapping_version_id
```

Estados aplicables:

```text
DRAFT
APPROVED_PENDING_ACTIVATION
ACTIVE
SUSPENDED
SUPERSEDED
RETIRED
REJECTED
INVALIDATED
```

Reglas:

1. una versión es inmutable;
2. un cambio de fuente, path, valor, destino, scope, autoridad o semántica crea otra versión;
3. solo `ACTIVE` participa en nuevas admisiones;
4. mappings históricos permanecen disponibles para reconstrucción;
5. suspensión o invalidación bloquea nuevos efectos y abre análisis de impacto;
6. no existe fallback a una versión retirada;
7. activar una versión no reprocesa historia automáticamente;
8. toda coexistencia declara modo, inicio, fin, métricas y puerta de salida;
9. el `version_set_digest` incluirá contrato externo, parser, mapping, política de campo y algoritmo interno consumidos.

#### 29. Aplicación de las capas de ejecución

| Capa de `DATA-NORM-ARC-011`     | Responsabilidad para ingresos externos                                                                                                         |
| ------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| aplicación o adaptador de canal | recibir, autenticar el canal cuando corresponda, capturar evidencia, limitar tamaño y transmitir el original sin decisiones semánticas locales |
| servicio de dominio             | resolver clasificación, autoridad, mappings, versiones, precedencia, resultado y comando interno                                               |
| frontera RPC transaccional      | autorizar integración, validar idempotencia y orden, cargar estado, revalidar, persistir efecto y auditoría atómicamente                       |
| trigger defensivo               | comprobar invariantes acotados, contexto de operación y consistencia entre fuente, derivación y versión; nunca llamar al proveedor             |

Reglas:

1. el adaptador no reescribe el payload para hacerlo aceptable;
2. parseo técnico puede ocurrir antes del servicio, pero la interpretación semántica permanece en la autoridad de dominio;
3. jobs, imports y webhooks consumen el mismo servicio y contrato que las aplicaciones;
4. el trigger no valida firmas remotas, no ejecuta HTTP, no consulta catálogos externos y no decide mapping;
5. una credencial privilegiada no permite omitir política, auditoría o precondiciones;
6. cada elemento de lote conserva operación lógica propia o una relación explícita con la operación raíz;
7. una integración no podrá escribir directamente campos gobernados después del cutover certificado.

#### 30. Persistencia, auditoría y confirmación transaccional

La operación raíz deberá correlacionar:

```text
external_delivery_id
external identity and payload digest
transport verification
contract and schema versions
parsed structure digest
mapping version set
internal command
expected internal state
commit result
enterprise event or no-effect outcome
acknowledgement
child effects
```

Reglas:

1. la RPC conserva una sola auditoría raíz de la mutación;
2. el adaptador registra evidencia de transporte y el servicio aporta la decisión semántica;
3. la persistencia del efecto y su registro causal se confirman juntos;
4. un ACK previo al commit solo podrá indicar recepción técnica, no éxito empresarial;
5. si el commit falla, el payload continúa preservado y el resultado es reanudable o fallido, no aceptado;
6. propagaciones, notificaciones y respuestas a terceros son efectos hijos posteriores al commit salvo contrato atómico local explícito;
7. un evento empresarial se emite desde el hecho interno confirmado, no copiando sin control el evento externo;
8. la auditoría minimiza valores sensibles y conserva referencias suficientes para replay o reconstrucción.

#### 31. ACK, eventos y efectos posteriores

1. `INTEGRATION_ACKNOWLEDGEMENT` confirma recepción, rechazo, duplicidad o estado de procesamiento según contrato.
2. Un ACK `2xx`, respuesta de SDK o inserción en inbox no demuestra efecto empresarial confirmado.
3. El evento externo puede originar un comando; el evento empresarial describe el hecho interno después del commit.
4. Un evento de integración de salida adapta el evento empresarial y no modifica su definición.
5. La respuesta al proveedor deberá ser idempotente y no exponer decisiones, datos o errores internos innecesarios.
6. Si el proveedor exige respuesta antes de completar el procesamiento, se distinguirá `RECEIVED_FOR_PROCESSING` de `ACCEPTED_INTERNAL_EFFECT_CONFIRMED`.
7. Reintentos de entrega no emitirán eventos empresariales duplicados.
8. Notificaciones, Google Wallet y Expo Push se tratarán como efectos hijos y sus receipts como evidencia técnica separada.
9. Un fallo de efecto hijo no revierte silenciosamente el hecho interno; se registra y reanuda o compensa mediante su contrato.

#### 32. Seguridad, privacidad y minimización

1. Secrets, API keys, tokens, firmas, certificados y credenciales no se almacenarán completos fuera del almacén autorizado.
2. Headers sensibles se filtrarán antes de logs, errores, métricas y vistas de cuarentena.
3. Payloads personales, laborales, financieros, legales o de ubicación exigirán finalidad, scope y acceso diferenciados.
4. La autenticidad no elimina la obligación de autorización y minimización.
5. Un payload completo no se expondrá cuando una referencia, hash o proyección sea suficiente.
6. Los hashes deberán evitar enumeración de secretos o datos de baja entropía.
7. Consultar original, exportarlo, reprocessarlo, aprobar un mapping o activar una integración serán capacidades separadas.
8. El proveedor y sus subprocesadores no se inferirán como destinatarios autorizados de datos internos.
9. Errores devueltos externamente no revelarán existencia de entidades, reglas, permisos o candidatos no autorizados.
10. Datos de VITAL no participarán en cuarentenas, mappings o paneles de Vento OS.

#### 33. Retención, rectificación y eliminación

1. El sobre, original, mapping, efecto y auditoría podrán tener clases de retención distintas pero conservarán referencias coherentes.
2. La retención se definirá por finalidad, sensibilidad, contrato, investigación, conciliación y obligación legal.
3. El vencimiento del payload no elimina el mapping y resultado histórico necesarios para interpretar un efecto, salvo mandato aplicable documentado.
4. Una rectificación externa se registra como nueva evidencia vinculada.
5. La eliminación o anonimización deberá conservar prueba de que ocurrió sin mantener datos que debían eliminarse.
6. Un tombstone no se presentará como payload disponible.
7. Reprocesar después de una eliminación solo será posible cuando exista evidencia suficiente y autorización; de lo contrario, se bloqueará.
8. Backups, exports, DLQ, cuarentena y observabilidad deberán participar en la misma política de retención.
9. Los plazos concretos y mecanismos físicos pertenecen a las tareas de arquitectura de información e implementación.

#### 34. Compatibilidad y transición de integraciones existentes

Antes de conservar, sustituir o retirar un flujo existente deberá inventariarse:

- proveedor, ambiente, tenant y contrato;
- endpoints, webhooks, archivos, jobs y Edge Functions;
- artefacto desplegado y revisión de fuente;
- original preservado actualmente y gaps de procedencia;
- transformaciones y helpers por capa;
- mappings de estados, monedas, unidades, nombres, roles y referencias;
- claves de idempotencia y comportamiento ante retries;
- orden, timestamps y reconciliación;
- productores, consumidores y escrituras directas;
- datos sensibles, retención y permisos;
- fixtures, payloads históricos y corpus;
- estrategia de shadow, cutover, rollback y reprocess.

Reglas:

1. una integración legacy podrá operar en observación o `DUAL_EVALUATION_SHADOW` sin dual write implícito;
2. el resultado nuevo se comparará con el actual sin modificar producción;
3. un canal sin paridad no podrá seguir mutando campos gobernados después del cutover;
4. una Edge Function desplegada sin digest o revisión demostrable quedará fuera de certificación;
5. no se retirará el almacenamiento del original antes de comprobar replay, auditoría y obligaciones de retención;
6. el cambio de contrato externo no se tratará como refactor interno neutral;
7. toda diferencia tendrá dueño y tarea de transición.

#### 35. Ejemplos normativos

| Escenario                                                               | Resultado obligatorio                                                                                       |
| ----------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| Wompi repite el mismo evento con el mismo payload                       | reutilizar el resultado previo sin duplicar efecto                                                          |
| Wompi usa el mismo ID con otro payload                                  | conflicto de idempotencia; preservar ambas evidencias y no mutar                                            |
| un estado Wompi nuevo no existe en el mapping activo                    | cuarentena de mapping; conservar estado externo y no elegir el más parecido                                 |
| un evento financiero antiguo llega después de uno más reciente          | bloquear como obsoleto o reconciliar según secuencia; nunca revertir por orden de llegada                   |
| Supabase Auth entrega nombre y rol en metadata                          | preservar metadata; mapear identidad técnica; no sobrescribir rol laboral sin autoridad del dominio         |
| correo de Auth llega con espacios o caja distinta                       | conservar original; canonicalizar contacto mediante contrato propio y mapping versionado                    |
| Google Maps devuelve una dirección y `place_id`                         | preservar respuesta y selección; derivar componentes internos; no crear identidad de sede automáticamente   |
| Expo receipt declara token inválido                                     | tratar como evidencia técnica y ejecutar proceso gobernado de token; no registrar el token completo en logs |
| CSV contiene una columna inesperada                                     | validar perfil; bloquear o cuarentenarla según compatibilidad, sin ignorarla silenciosamente                |
| dos filas del mismo archivo comparten texto pero IDs externos distintos | procesar por identidad y scope; no deduplicar por nombre normalizado                                        |
| una fila válida y otra inválida en perfil de atomicidad parcial         | confirmar la válida, cuarentenizar la inválida y declarar éxito parcial por fila                            |
| el mismo archivo se reenvía                                             | reconocer digest y perfil; reutilizar resultados por archivo y fila según contrato                          |
| cambia el mapping después de la recepción                               | la entrega histórica conserva versión previa; reprocess requiere operación explícita                        |
| firma válida, pero tenant o ambiente incorrectos                        | rechazo de autorización del emisor; firma no permite cruzar scope                                           |
| payload válido técnicamente sin owner de campo                          | preservar y cuarentenizar por autoridad                                                                     |
| webhook recibe ACK antes del commit interno                             | ACK de recepción únicamente; el éxito empresarial permanece pendiente                                       |
| adaptador cae después del commit y antes de responder                   | retry devuelve resultado confirmado; no repite mutación                                                     |
| una notificación posterior falla                                        | el hecho interno permanece; efecto hijo pendiente y reanudable                                              |
| payload contiene un secreto                                             | preservar en almacén protegido o referencia; no exponer en auditoría, cuarentena ni métricas                |
| dato pertenece a VITAL                                                  | excluir de política transversal y remitir a su contrato propio                                              |

#### 36. Conductas no conformes

Quedan prohibidas:

1. sobrescribir el payload original con la forma interna;
2. persistir únicamente el valor mapeado sin emisor, contrato, versión y evidencia;
3. tratar firma válida como autoridad sobre todos los campos;
4. utilizar `latest` implícito para schema o mapping;
5. mapear estados, monedas, unidades, roles o códigos mediante `if` locales no versionados;
6. corregir marcas, nombres legales, personas o direcciones externas con capitalización comercial universal;
7. deduplicar eventos únicamente por payload normalizado o texto visible;
8. aceptar el mismo ID con payload diferente;
9. utilizar orden de llegada como orden empresarial sin contrato;
10. convertir `null`, vacío, ausencia y clear en el mismo estado;
11. interpretar números, fechas o unidades con locale implícito;
12. ignorar campos o columnas desconocidos cuando puedan cambiar semántica;
13. reportar éxito total para lotes parciales;
14. reintentar todo el lote y duplicar filas confirmadas;
15. editar un archivo original para permitir importarlo;
16. seleccionar por similitud una entidad, dirección, moneda, unidad o estado;
17. crear identidad interna desde `place_id`, nombre o referencia externa sin scope de emisor;
18. permitir escrituras directas de webhooks, imports o service roles fuera del servicio y RPC;
19. ejecutar HTTP, firma remota, mapping o workflow dentro de un trigger;
20. emitir evento empresarial antes del commit interno;
21. registrar tokens, firmas, secretos o payload sensible completo en logs;
22. reprocessar historia con mappings nuevos sin operación explícita;
23. borrar evidencia para ocultar un conflicto o una corrección externa;
24. aplicar mappings de Vento OS a VITAL;
25. introducir cambios físicos desde esta tarea documental.

#### 37. Corpus mínimo de conformidad

El corpus deberá cubrir, como mínimo:

1. las seis clases de fuente externa;
2. las siete representaciones separadas;
3. sobre completo, campos no aplicables y referencias protegidas;
4. payload JSON, texto, binario, CSV y Excel;
5. firma válida, inválida, ausente, rotada y con timestamp fuera de ventana;
6. emisor, tenant, cuenta y ambiente válidos e incompatibles;
7. schema conocido, aditivo compatible, incompatible, desconocido y retirado;
8. parseo exitoso, truncado, encoding inválido, duplicidad de claves y límites de tamaño;
9. las siete capas de validación y doce resultados;
10. las ocho modalidades de mapping;
11. estados, monedas, unidades, roles, nombres, direcciones, texto libre, IDs y secretos;
12. mismo ID y mismo payload, mismo ID y payload distinto, ID ausente y clave derivada;
13. retry, timeout, respuesta perdida, caída antes y después del commit;
14. eventos en orden, fuera de orden, tardíos, corregidos y retractados;
15. campo ausente, `null`, vacío, espacios, clear, desconocido, no aplicable y parcial;
16. números, precisión, rounding, moneda y overflow;
17. timestamps con y sin zona, DST, locale y formatos ambiguos;
18. archivos repetidos, cabeceras cambiadas, columnas extra, fórmulas y hojas;
19. atomicidad total, parcial y por grupo;
20. cuarentena, revisión, reprocess y cierre sin efecto;
21. Supabase Auth, Wompi, Google Maps, Google Wallet, Expo Push y canales batch observados;
22. autoridad por campo y conflicto entre proveedor y dominio;
23. mapping activo, suspendido, supersedido, retirado e invalidado;
24. paridad entre adaptador, servicio, RPC, job y trigger defensivo;
25. auditoría, minimización, retención, rectificación y eliminación;
26. coexistencia legacy, shadow, cutover, rollback, VITAL y ausencia de efectos no autorizados.

El corpus deberá reutilizar escenarios de `TREQ-DATA-006` a `TREQ-DATA-214` relacionados con originales, representaciones, fuentes, revisión, búsqueda, identidad, auditoría, idempotencia, capas, imports, jobs y webhooks.

#### 38. Hallazgos y carryovers

| ID               | Decisión o brecha                                                            | Resultado de esta tarea                                                | Propietario siguiente                                          |
| ---------------- | ---------------------------------------------------------------------------- | ---------------------------------------------------------------------- | -------------------------------------------------------------- |
| `DN-ARC-012-H01` | el valor externo original podía perderse durante parseo o mapping            | siete representaciones y preservación de original aprobadas            | `SUPA-TRANS-005`; `SUPA-TRANS-007`                             |
| `DN-ARC-012-H02` | autenticidad podía confundirse con verdad empresarial                        | capas de validación y autoridad por campo aprobadas                    | `SUPA-TRANS-005`; `SUPA-TRANS-009`                             |
| `DN-ARC-012-H03` | estados, monedas, unidades y roles podían mapearse localmente                | ocho modos cerrados y versiones inmutables aprobados                   | `SUPA-TRANS-003`; `SUPA-TRANS-006`; `SUPA-TRANS-014`           |
| `DN-ARC-012-H04` | webhooks y archivos podían duplicar efectos o aceptar payload conflictivo    | identidad externa, digest, retry y conflicto aprobados                 | `DATA-NORM-TRANS-006`; `SUPA-TRANS-009`                        |
| `DN-ARC-012-H05` | orden de llegada podía sobrescribir estados más recientes                    | temporalidad, secuencia, stale event y reconciliación aprobadas        | `DATA-NORM-TRANS-007`; `DATA-NORM-TRANS-008`                   |
| `DN-ARC-012-H06` | ausencia, null, vacío y clear no tenían contrato transversal                 | semántica diferenciada aprobada                                        | `SUPA-TRANS-005`; `SUPA-TRANS-007`                             |
| `DN-ARC-012-H07` | imports podían ocultar errores parciales y perder procedencia por fila       | contrato de archivo, fila, celda, atomicidad y reanudación aprobado    | `SUPA-TRANS-003`; `DATA-NORM-TRANS-006`                        |
| `DN-ARC-012-H08` | payloads bloqueados carecían de cuarentena gobernada                         | ocho estados, owners y reprocess controlado aprobados                  | `SUPA-TRANS-005`; tareas de gobierno de información aplicables |
| `DN-ARC-012-H09` | proveedor podía asumirse como owner de atributos internos                    | autoridad por campo, dominio y evidencia aprobadas                     | `SUPA-ARC-025`; `SUPA-TRANS-003`                               |
| `DN-ARC-012-H10` | ACK técnico y evento externo podían confundirse con evento empresarial       | conceptos, commit y emisión posterior separados                        | tareas `INT-APP-*`; `SUPA-TRANS-007`; `SUPA-TRANS-009`         |
| `DN-ARC-012-H11` | tokens, firmas y payloads podían exponerse en observabilidad o revisión      | minimización, referencias protegidas y capacidades separadas aprobadas | `SUPA-TRANS-005`; `SUPA-TRANS-010`                             |
| `DN-ARC-012-H12` | integraciones existentes carecen todavía de inventario y paridad exhaustivos | contrato completo aprobado; transición física reservada                | `SUPA-TRANS-003`; `SUPA-TRANS-013`; `SUPA-TRANS-014`           |
| `DN-ARC-012-H13` | mappings podían reinterpretar historia al cambiar de versión                 | ciclo de vida, replay y reprocess explícitos aprobados                 | `SUPA-TRANS-006`; `DATA-NORM-TRANS-008`; `DATA-NORM-TRANS-009` |
| `DN-ARC-012-H14` | VITAL comparte infraestructura y proveedores potenciales                     | frontera separada mantenida                                            | `SUPA-ARC-025`                                                 |

#### 39. Decisiones reservadas

| Decisión                                                        | Tarea propietaria                                        |
| --------------------------------------------------------------- | -------------------------------------------------------- |
| arquitectura consolidada, ownership físico y frontera VITAL     | `SUPA-ARC-025`                                           |
| inventario exhaustivo de integraciones, clientes y dependencias | `SUPA-TRANS-003`                                         |
| tablas, inbox, payload store, cuarentena, mappings e índices    | `SUPA-TRANS-005`                                         |
| coexistencia de contratos y versiones                           | `SUPA-TRANS-006`                                         |
| adaptación de APIs, Edge Functions, imports, jobs y clientes    | `SUPA-TRANS-007`; `SUPA-TRANS-014`                       |
| orden técnico y dependencias de migración                       | `SUPA-TRANS-008`                                         |
| pruebas de paridad, retries, concurrencia e idempotencia        | `SUPA-TRANS-009`; `DATA-NORM-TRANS-009`                  |
| rendimiento, límites, seguridad y observabilidad física         | `SUPA-TRANS-010`                                         |
| compensación, restauración y rollback                           | `SUPA-TRANS-011`; `DATA-NORM-TRANS-008`                  |
| corte, despliegue, credenciales y recuperación                  | `SUPA-TRANS-012`; `SUPA-TRANS-013`                       |
| baseline, dry-run, mappings y reprocess de datos existentes     | `DATA-NORM-TRANS-001` a `DATA-NORM-TRANS-007`            |
| contratos específicos de eventos empresariales e integración    | tareas `INT-APP-*` propietarias                          |
| retención física y eliminación                                  | tareas de gobierno de información y seguridad aplicables |

#### 40. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

Se crean los requisitos:

- `TREQ-DATA-215`;
- `TREQ-DATA-216`;
- `TREQ-DATA-217`;
- `TREQ-DATA-218`;
- `TREQ-DATA-219`;
- `TREQ-DATA-220`;
- `TREQ-DATA-221`;
- `TREQ-DATA-222`;
- `TREQ-DATA-223`;
- `TREQ-DATA-224`;
- `TREQ-DATA-225`;
- `TREQ-DATA-226`;
- `TREQ-DATA-227`;
- `TREQ-DATA-228`;
- `TREQ-DATA-229`;
- `TREQ-DATA-230`;
- `TREQ-DATA-231`;
- `TREQ-DATA-232`;
- `TREQ-DATA-233`;
- `TREQ-DATA-234`;
- `TREQ-DATA-235`;
- `TREQ-DATA-236`;
- `TREQ-DATA-237`;
- `TREQ-DATA-238`;
- `TREQ-DATA-239`;
- `TREQ-DATA-240`.

El detalle canónico de cada requisito reside en el registro 04A actualizado hasta esta tarea.

#### 41. Criterios de integridad

La política se considera íntegra para esta etapa cuando:

1. separa entrega, transporte, original, estructura, mapping, comando, efecto, cuarentena, ACK y evento empresarial;
2. define exactamente seis clases de fuente externa;
3. conserva siete representaciones sin sobrescribir el original;
4. exige un sobre lógico con emisor, ambiente, tenant, contrato, timestamps, referencias y digests;
5. preserva bytes o estructura según el contrato y evita normalización previa no autorizada;
6. separa siete capas de validación;
7. aplica las doce etapas del pipeline en orden;
8. distingue doce resultados cerrados;
9. bloquea versiones desconocidas y `latest` implícito;
10. clasifica cada campo antes de normalizar o mapear;
11. define exactamente ocho modos de mapping;
12. construye identidad externa con emisor, ambiente, tenant, tipo y contrato;
13. reutiliza el resultado con mismo ID y payload y bloquea payload conflictivo;
14. gobierna eventos tardíos, fuera de orden, corregidos y concurrentes;
15. diferencia ausencia, null, vacío, clear, desconocido, no aplicable y parcial;
16. gobierna números, moneda, unidades, precisión, tiempo, locale, Unicode y encoding;
17. conserva procedencia por archivo, lote, fila y celda;
18. define ocho estados de cuarentena y reprocess controlado;
19. asigna autoridad por campo y owner del mapping;
20. versiona mappings sin reinterpretar historia;
21. aplica la arquitectura de capas sin decisiones semánticas locales ni red desde triggers;
22. confirma efecto y auditoría antes de emitir evento empresarial;
23. separa ACK técnico de éxito empresarial;
24. minimiza secretos, datos sensibles y payloads;
25. gobierna retención, rectificación y eliminación sin perder coherencia histórica;
26. exige inventario, shadow, paridad y transición para integraciones existentes;
27. incorpora corpus positivo, negativo, conflictivo, tardío, batch y sensible;
28. mantiene VITAL fuera del alcance transversal;
29. no autoriza cambios físicos ni anticipa decisiones reservadas.

#### 42. Continuidad

```text
ÚLTIMA TAREA APROBADA
DATA-NORM-ARC-011 — Definir capas de ejecución: aplicación, servicio de dominio, RPC y trigger defensivo
        ↓
TAREA ACTUAL APROBADA
DATA-NORM-ARC-012 — Definir tratamiento de datos recibidos desde integraciones externas
        ↓
SIGUIENTE TAREA RESERVADA
SUPA-ARC-025 — Consolidar y aprobar ADR de arquitectura canónica de datos
```


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

### ✅ SUPA-ARC-025 — Consolidar y aprobar ADR de arquitectura canónica de datos

**Estado:** APROBADA
**Tarea anterior:** `DATA-NORM-ARC-012 — Definir tratamiento de datos recibidos desde integraciones externas` — APROBADA
**Tarea siguiente:** `SUPA-TRANS-001 — Inventariar contratos, vistas, RPC y clientes afectados`
**Tipo de tarea:** consolidación y aprobación documental del registro de decisión arquitectónica de datos de Vento OS, adopción normativa de las decisiones aprobadas en el BLOQUE E3, cierre de decisiones arquitectónicas y definición de puertas para transición; sin DDL, DML, migraciones, backfills, correcciones de datos, fusiones, reasignaciones, cambios de esquema, constraints, índices, funciones, RPC, triggers, RLS, clientes, integraciones, credenciales, configuración ni despliegues

#### 1. Objetivo

Consolidar y aprobar el registro de decisión arquitectónica que gobernará la evolución de datos de Vento OS, cerrando en una única decisión vinculante las políticas aprobadas sobre dominios, ownership, agregados, referencias, schemas, capas de ejecución, transacciones, eventos, identidad, autorización, seguridad, auditoría, calidad, búsqueda, almacenamiento, integraciones, compatibilidad, migración, ambientes y normalización.

El ADR deberá impedir que la transición física reabra decisiones ya aprobadas por conveniencia técnica, que una implementación local sustituya el ownership empresarial, que una tabla existente se convierta en fuente de verdad por antigüedad, que un cliente o trigger adquiera autoridad semántica no concedida, que VITAL herede reglas de Vento OS por coexistencia física o que un paquete avance sin inventario, compatibilidad, evidencia y reversibilidad.

#### 2. ADR producido

```text
ADR-DATA-001 — Arquitectura canónica de datos de Vento OS
```

| Propiedad                                            | Valor                                                                        |
| ---------------------------------------------------- | ---------------------------------------------------------------------------- |
| Identificador                                        | `ADR-DATA-001`                                                               |
| Versión                                              | `1.0.0`                                                                      |
| Estado                                               | `ACCEPTED`                                                                   |
| Fecha                                                | `2026-07-30`                                                                 |
| Tarea gobernante                                     | `SUPA-ARC-025`                                                               |
| Bloque propietario                                   | `BLOQUE E3 — Arquitectura canónica de datos y gobierno integral de Supabase` |
| Decisiones arquitectónicas adoptadas                 | `SUPA-ARC-001` a `SUPA-ARC-024`                                              |
| Auditorías de normalización adoptadas como evidencia | `DATA-NORM-AUD-001` a `DATA-NORM-AUD-007`                                    |
| Políticas de normalización adoptadas                 | `DATA-NORM-ARC-001` a `DATA-NORM-ARC-012`                                    |
| Siguiente fase autorizada                            | transición documental y preparación controlada desde `SUPA-TRANS-001`        |
| Implementación física autorizada por este ADR        | ninguna                                                                      |
| Requisitos de prueba nuevos                          | 40                                                                           |

#### 3. Owner y reviewers

| Responsabilidad                | Asignación canónica                                                                                                |
| ------------------------------ | ------------------------------------------------------------------------------------------------------------------ |
| Owner del ADR                  | gobierno de arquitectura de datos de Vento OS bajo el BLOQUE E3                                                    |
| Autoridad final de aceptación  | `propietario`, sin bypass técnico ni delegación implícita de decisiones reservadas                                 |
| Reviewer ejecutivo obligatorio | `gerente_general`                                                                                                  |
| Reviewers funcionales          | owners o stewards de los dominios empresariales afectados                                                          |
| Reviewers técnicos             | responsables de Plataforma Supabase, Seguridad y Autorización, Integraciones y aplicaciones consumidoras afectadas |
| Custodia documental            | fuente modular propietaria de `SUPA-ARC-025` y registro 04A                                                        |
| Sustitución de reviewers       | solo mediante decisión explícita, trazable y sin reducir segregación de funciones                                  |

La aceptación del ADR no convierte al owner documental en dueño de todos los datos. El ownership de cada entidad y atributo continúa gobernado por las decisiones de dominio y fuente de verdad adoptadas.

#### 4. Fuentes canónicas consumidas

| Fuente                                                | Decisión consumida                                                                                                  |
| ----------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| `01_PROTOCOLO.md`                                     | continuidad, fase documental, lectura remota, separación entre definición e implementación y preservación histórica |
| `delivery-contract.json`                              | identidad del artefacto de tarea y actualización integral de 04A al crear requisitos                                |
| `active-sequence.json`                                | `SUPA-ARC-025` como tarea actual y `SUPA-TRANS-001` como siguiente tarea reservada                                  |
| `00_CABECERA_Y_ESTADO.md`                             | revisión 58, cierre de `DATA-NORM-ARC-012`, progreso del BLOQUE E3 y prohibición de cambios físicos                 |
| `04_ARQUITECTURA_CANONICA_OBJETIVO.md`                | decisiones aprobadas `SUPA-ARC-001` a `SUPA-ARC-024`                                                                |
| `03_AUDITORIA_DE_NORMALIZACION_Y_CALIDAD_DE_DATOS.md` | evidencia `DATA-NORM-AUD-001` a `DATA-NORM-AUD-007`                                                                 |
| archivo modular propietario de esta tarea             | objetivo, contenido mínimo del ADR y condición de cierre de arquitectura                                            |
| `DATA-NORM-ARC-001` a `DATA-NORM-ARC-012`             | gobierno completo de normalización, búsqueda, identidad, auditoría, capas y datos externos                          |
| Registro 04A vigente                                  | requisitos históricos y secuencia del dominio `SUPABASE` hasta `TREQ-SUPABASE-1655`                                 |
| `package.json` y validadores documentales             | comandos y restricciones que deberán comprobar la materialización posterior                                         |

#### 5. Contexto

Vento OS evolucionó con múltiples aplicaciones, schemas, tablas, RPC, funciones, triggers, políticas RLS, Edge Functions, jobs, integraciones y clientes que fueron incorporando reglas de identidad, operación, inventario, producción, logística, compras, ventas, talento, fidelización, pagos y administración.

La auditoría del BLOQUE E3 demostró que la ubicación física actual no equivale a dominio, que `public` concentra responsabilidades heterogéneas, que existen fuentes y copias con autoridad desigual, que los consumidores pueden aplicar transformaciones propias y que una modificación aparentemente local puede afectar relaciones, snapshots, búsquedas, índices, eventos, integraciones o trazabilidad histórica.

Antes de modificar el esquema o los datos era necesario definir la arquitectura objetivo, sus fronteras, las responsabilidades de cada capa, la forma de transición y las condiciones que hacen inaceptable una implementación.

#### 6. Problema arquitectónico

El sistema necesita responder de manera uniforme y demostrable:

```text
qué dominio es propietario del dato
qué entidad y agregado gobiernan su ciclo de vida
cuál es la fuente de verdad
qué representaciones son originales, canónicas, derivadas o históricas
qué capa puede decidir, validar, persistir, proyectar o propagar
qué identidad, contexto y autorización exige cada operación
qué invariantes deben confirmarse dentro de la transacción
qué efectos son síncronos y cuáles asíncronos
cómo se conserva idempotencia, concurrencia, auditoría y reversibilidad
cómo se protegen datos sensibles, secretos, archivos e integraciones
cómo conviven versiones y ambientes
cómo se migra sin degradar contratos ni historia
```

La respuesta no puede depender de la tabla más antigua, del schema donde hoy reside el dato, del cliente que envía el comando, de un helper local, de la credencial privilegiada utilizada, del orden accidental de despliegue ni de la capacidad física de escribir.

#### 7. Alcance

Este ADR consolida:

1. las decisiones de arquitectura de `SUPA-ARC-001` a `SUPA-ARC-024`;
2. la evidencia de `DATA-NORM-AUD-001` a `DATA-NORM-AUD-007`;
3. las políticas normativas de `DATA-NORM-ARC-001` a `DATA-NORM-ARC-012`;
4. la jerarquía entre decisiones específicas y esta consolidación;
5. las consecuencias positivas y los trade-offs aceptados;
6. los riesgos aceptados y no aceptados;
7. las condiciones de reversión y los disparadores de un nuevo ADR;
8. la relación con los BLOQUES E4 y E5;
9. las puertas que habilitan transición sin autorizar implementación física;
10. el gobierno del propio ADR.

Este ADR no crea ni modifica objetos físicos, datos, credenciales, ambientes, contratos desplegados ni configuraciones.

#### 8. Regla de adopción normativa

`ADR-DATA-001` adopta por referencia las decisiones aprobadas y no crea una segunda versión resumida que pueda divergir de ellas.

Reglas:

1. cada tarea adoptada conserva su texto, vocabularios, conteos, prohibiciones, reservas y requisitos;
2. ante diferencia entre este ADR y una decisión específica adoptada, prevalece la decisión específica;
3. una síntesis del ADR no podrá ampliar permisos, reducir evidencias ni convertir una reserva de transición en autorización física;
4. una tarea posterior podrá materializar una decisión, pero no reinterpretarla silenciosamente;
5. una contradicción descubierta bloqueará el paquete afectado hasta corregir la fuente propietaria o aprobar un ADR supersesor;
6. las tareas de transición deberán citar la decisión arquitectónica concreta que implementan;
7. una excepción temporal no modifica el ADR ni se convierte en precedente;
8. el estado `ACCEPTED` expresa cierre arquitectónico, no implementación ni verificación operativa.

#### 9. Jerarquía de decisión

```text
PRINCIPIOS CANÓNICOS Y ADR TRANSVERSALES VIGENTES
        ↓
ADR-DATA-001
        ↓
DECISIONES ESPECÍFICAS ADOPTADAS
SUPA-ARC-001 A SUPA-ARC-024
DATA-NORM-ARC-001 A DATA-NORM-ARC-012
        ↓
CONTRATOS DE DOMINIO, ENTIDAD, CAMPO, EVENTO E INTEGRACIÓN
        ↓
PAQUETES DE TRANSICIÓN Y MATERIALIZACIÓN
        ↓
IMPLEMENTACIÓN FÍSICA CERTIFICADA
```

La precedencia se resuelve por especificidad sin permitir que una decisión inferior contradiga una superior o que una decisión general elimine una restricción específica.

#### 10. Decisiones adoptadas de estructura y ownership

| Tarea          | Decisión adoptada                                                                             |
| -------------- | --------------------------------------------------------------------------------------------- |
| `SUPA-ARC-001` | dominios y contextos acotados como fronteras empresariales estables                           |
| `SUPA-ARC-002` | una fuente de verdad declarada por entidad y atributo gobernado                               |
| `SUPA-ARC-003` | límites de agregado y referencias entre dominios sin agregados distribuidos implícitos        |
| `SUPA-ARC-004` | schemas, ownership y fronteras lógicas de despliegue separados de la ubicación legacy         |
| `SUPA-ARC-005` | distribución explícita de lógica entre base de datos, servicio, Edge Functions y aplicaciones |
| `SUPA-ARC-006` | contratos síncronos y asíncronos definidos por finalidad, consistencia y fallo                |

#### 11. Decisiones adoptadas de comportamiento y consistencia

| Tarea          | Decisión adoptada                                                                                  |
| -------------- | -------------------------------------------------------------------------------------------------- |
| `SUPA-ARC-007` | comandos, eventos, flujos y side effects con identidad y causalidad separadas                      |
| `SUPA-ARC-008` | idempotencia, concurrencia, reintentos y deduplicación como contratos obligatorios                 |
| `SUPA-ARC-009` | estados, transiciones, cancelación, reversión y corrección explícitos                              |
| `SUPA-ARC-010` | actor, razón, evidencia y auditoría vinculados al hecho y no solo a la fila técnica                |
| `SUPA-ARC-011` | aislamiento territorial y organizacional resuelto desde la fuente del recurso y el contexto válido |
| `SUPA-ARC-012` | RLS, grants, RPC y schemas privados como defensa coordinada, sin autoridad en el cliente           |

#### 12. Decisiones adoptadas de identidad, seguridad y gobierno

| Tarea          | Decisión adoptada                                                                   |
| -------------- | ----------------------------------------------------------------------------------- |
| `SUPA-ARC-013` | integración explícita entre Supabase Auth e identidades de dominio                  |
| `SUPA-ARC-014` | origen, propagación y retención del contexto de acceso con trazabilidad             |
| `SUPA-ARC-015` | clasificación, cifrado, retención y eliminación de datos sensibles                  |
| `SUPA-ARC-016` | auditoría, observabilidad y calidad de datos como contratos verificables            |
| `SUPA-ARC-017` | invariantes y consistencia transaccional confirmadas por la autoridad propietaria   |
| `SUPA-ARC-018` | particionamiento, archivo y retención histórica gobernados por significado y acceso |

#### 13. Decisiones adoptadas de consumo, plataforma y evolución

| Tarea          | Decisión adoptada                                                                                               |
| -------------- | --------------------------------------------------------------------------------------------------------------- |
| `SUPA-ARC-019` | búsqueda, índices, filtros, paginación y ordenamiento bajo representaciones y versiones explícitas              |
| `SUPA-ARC-020` | archivos y activos con ownership, metadatos, acceso, retención y eliminación gobernados                         |
| `SUPA-ARC-021` | secretos, configuración, funciones, jobs y webhooks separados de datos empresariales y con lifecycle controlado |
| `SUPA-ARC-022` | compatibilidad entre versiones de base de datos, contratos y aplicaciones                                       |
| `SUPA-ARC-023` | migración objetivo con inventario, gates, verificación, reconciliación y reversibilidad                         |
| `SUPA-ARC-024` | cuatro clases ambientales, promoción ordenada, paridad, evidencia y bloqueo de drift                            |

#### 14. Evidencia y políticas de normalización adoptadas

1. `DATA-NORM-AUD-001` a `DATA-NORM-AUD-007` se adoptan como evidencia de campos, inconsistencias, excepciones, colisiones, transformaciones, productores e impactos.
2. `DATA-NORM-ARC-001` a `DATA-NORM-ARC-006` gobiernan política, clases, capitalización, conectores, excepciones y diccionario.
3. `DATA-NORM-ARC-007` gobierna revisión humana y decisiones ambiguas.
4. `DATA-NORM-ARC-008` separa búsqueda y comparación de presentación e identidad.
5. `DATA-NORM-ARC-009` gobierna persistencia, versiones, vigencias, auditoría, replay e idempotencia.
6. `DATA-NORM-ARC-010` gobierna unicidad y detección de duplicados sin fusión automática.
7. `DATA-NORM-ARC-011` asigna autoridad semántica al servicio de dominio, commit a RPC y defensa acotada al trigger.
8. `DATA-NORM-ARC-012` preserva originales externos, mappings versionados, autoridad por campo y cuarentena.
9. Ninguna política de normalización autoriza por sí sola corrección masiva, fusión, cambio de identidad o activación física.

#### 15. Decisión central

Vento OS adoptará una arquitectura de datos orientada por dominio, con ownership explícito, contratos versionados y autoridad servidor, bajo estas invariantes:

```text
UN DATO EMPRESARIAL
        ↓
TIENE DOMINIO Y ENTIDAD PROPIETARIOS
        ↓
TIENE FUENTE DE VERDAD Y REPRESENTACIONES DECLARADAS
        ↓
SE MODIFICA MEDIANTE COMANDO AUTORIZADO
        ↓
VALIDA INVARIANTES EN UNA FRONTERA TRANSACCIONAL
        ↓
CONFIRMA UN HECHO AUDITABLE
        ↓
EMITE EFECTOS Y PROYECCIONES IDÉMPOTENTES
        ↓
CONSERVA HISTORIA, COMPATIBILIDAD Y REVERSIBILIDAD
```

Una aplicación, integración, job, trigger o credencial técnica podrá ejecutar responsabilidades asignadas, pero no adquirir ownership por conveniencia.

#### 16. Dominios y fuentes de verdad

1. el dominio se determina por responsabilidad empresarial, no por schema o aplicación;
2. cada entidad material tendrá un owner y una fuente de verdad inequívocos;
3. un atributo podrá tener autoridad diferente de otros atributos de la misma entidad cuando el contrato lo declare;
4. vistas, snapshots, caches, catálogos, reportes y proyecciones no se convierten en fuentes por ser consumidos ampliamente;
5. una copia sincronizable conserva referencia, versión y política de reconciliación;
6. un snapshot histórico no se reescribe como si fuera la fuente vigente;
7. los datos compartidos se exponen mediante contratos, no mediante escrituras cruzadas libres;
8. un ownership no resuelto bloquea migración y mutación automática.

#### 17. Agregados, referencias y transacciones

1. cada agregado define su raíz, invariantes, comandos y límites de consistencia fuerte;
2. una transacción no abarcará dominios por comodidad si no existe una decisión explícita;
3. referencias cross-domain usarán identidades estables y contratos de integridad;
4. la inexistencia temporal de una proyección no invalida el hecho confirmado de la fuente;
5. side effects posteriores al commit serán idempotentes, reanudables y observables;
6. la compensación no se confunde con rollback físico de historia empresarial;
7. cancelación, reversión, corrección y rectificación conservan el hecho anterior;
8. concurrencia y reintentos deberán producir un único efecto lógico o un conflicto explícito.

#### 18. Capas de ejecución

| Capa                         | Autoridad consolidada                                                                 |
| ---------------------------- | ------------------------------------------------------------------------------------- |
| aplicación                   | captura, guía, presentación y previsualización no vinculante                          |
| servicio de dominio          | única autoridad semántica para políticas y decisiones de dominio                      |
| RPC o frontera transaccional | autorización, revalidación, idempotencia, concurrencia, persistencia y commit         |
| base de datos                | integridad, constraints, RLS, aislamiento y defensas locales certificadas             |
| trigger defensivo            | assert, derivación determinista acotada o stamping; nunca motor empresarial ambiguo   |
| Edge Function o adaptador    | transporte, integración y orquestación autorizada; no fuente de verdad por despliegue |
| job o proceso batch          | ejecución del mismo contrato, con lote, cursor, reanudación y evidencia               |

Quedan prohibidas cuatro implementaciones semánticas independientes para la misma regla.

#### 19. Identidad, contexto y autorización

1. identidad autenticada, identidad de dominio, actor efectivo y contexto de acceso permanecen separados;
2. Supabase Auth prueba un principal y no sustituye la identidad empresarial;
3. la autorización efectiva se resuelve en servidor con permiso, recurso, territorio, contexto y denegaciones;
4. RLS es defensa obligatoria y no reemplaza la autorización de comando ni la auditoría;
5. credenciales de servicio, `service_role` o bypass técnicos no conceden autoridad empresarial;
6. toda operación privilegiada tendrá finalidad, actor o sistema, alcance, ventana, evidencia y cierre;
7. el contexto enviado por el cliente es una solicitud que debe revalidarse;
8. datos de acceso retenidos deberán cumplir finalidad, minimización y política histórica.

#### 20. Seguridad, privacidad y retención

1. datos personales, laborales, financieros, legales, de ubicación, salud, seguridad y secretos se clasifican antes de uso o exposición;
2. cifrado, masking, tokenización o referencia protegida se aplican según clase y finalidad;
3. logs, auditoría y observabilidad no expondrán secretos ni payloads completos por defecto;
4. retención, legal hold, archivo, anonimización y eliminación deberán ser coherentes entre fuente, copias, backups e integraciones;
5. eliminación física no borrará evidencia obligatoria ni dejará referencias inválidas;
6. acceso a datos sensibles se separa del acceso al proceso que los produce;
7. exports y archivos heredarán clasificación y controles equivalentes;
8. una excepción de seguridad será temporal, aprobada, medible y revocable.

#### 21. Auditoría, observabilidad y calidad

1. cada mutación material conservará actor, contexto, comando, razón, estado anterior, resultado, versiones y evidencia;
2. auditoría empresarial, log técnico, métrica y evento son conceptos distintos y correlacionables;
3. calidad se medirá por contrato de dominio, no por apariencia textual o ausencia de errores SQL;
4. drift, duplicidad, ruptura de referencias, valores huérfanos y divergencia de proyecciones tendrán owner y severidad;
5. no se declarará éxito total cuando existan efectos parciales pendientes;
6. replay y reconstrucción usarán versiones históricas o registrarán imposibilidad explícita;
7. observabilidad deberá permitir distinguir rechazo, bloqueo, conflicto, retry, compensación y confirmación;
8. la evidencia será reproducible sin incluir material sensible innecesario.

#### 22. Búsqueda, índices, filtros y paginación

1. búsqueda y comparación derivan representaciones separadas y no reescriben el valor mostrado;
2. coincidencia textual no prueba identidad ni autoriza fusión;
3. índice, query, RPC y cliente deberán compartir semántica y versión;
4. ranking, scope, autorización, filtros y desempates se resuelven en servidor;
5. paginación usa orden total estable y cursor compatible con la versión;
6. un cambio de versión no mezclará páginas ni resultados sin reinicio explícito;
7. índices se diseñan después de fijar contrato, cardinalidad, workload y plan de transición;
8. búsqueda degradada o fallback no ampliará acceso ni seleccionará una entidad ambigua.

#### 23. Archivos, Storage y activos

1. archivo, blob, metadata, entidad propietaria, versión y derivaciones permanecen vinculados;
2. bucket o ruta no determinan ownership por sí solos;
3. subida, lectura, transformación, firma, expiración y eliminación requieren autorización y auditoría;
4. URLs públicas o firmadas no sustituyen políticas de acceso;
5. thumbnails, exports, adjuntos y documentos derivados declaran si son regenerables, históricos o autoritativos;
6. malware, tamaño, tipo, checksum, duplicidad y contenido sensible se controlan antes de exposición;
7. retención y borrado incluyen copias, CDN, backups y proveedores cuando aplique;
8. nombres de archivo no se usan como identidad empresarial estable.

#### 24. Integraciones y datos externos

1. payload original, transporte, autenticidad, mapping, comando, efecto, ACK y evento empresarial permanecen separados;
2. autenticidad del proveedor no equivale a verdad empresarial;
3. mappings son exactos, versionados, auditables y no reinterpretan historia silenciosamente;
4. identidad externa incluye emisor, ambiente, tenant, tipo, contrato e identificador;
5. mismo identificador y payload distinto produce conflicto;
6. eventos tardíos, fuera de orden, corregidos o retractados requieren reconciliación explícita;
7. imports conservan archivo, hash, lote, fila, columna y celda cuando corresponda;
8. cuarentena no confirma el hecho ni autoriza un fallback local;
9. ACK técnico no demuestra commit interno ni resultado empresarial;
10. integraciones existentes deberán demostrar inventario, paridad y retiro de helpers divergentes.

#### 25. Frontera de VITAL

VITAL permanece como producto separado aunque comparta proyecto, proveedor, infraestructura o capacidad técnica.

Queda prohibido:

- aplicar automáticamente dominios, RLS, normalización, eventos, mappings o retención de Vento OS a VITAL;
- usar datos VITAL como fixtures, catálogo, identidad o fuente de verdad de Vento OS sin contrato;
- compartir secretos, jobs, buckets, funciones o tablas por inferencia;
- incluir VITAL en una migración masiva del BLOQUE E3;
- declarar una decisión transversal porque un objeto tenga estructura similar.

Toda interoperabilidad futura requerirá contrato explícito y, si altera la frontera de producto, un nuevo ADR.

#### 26. Versiones, migración y ambientes

1. schema, contrato, función, RPC, evento, mapping, política y cliente tendrán versiones compatibles y observables;
2. no existe `latest` implícito para decisiones sensibles o replay;
3. transición comienza con inventario de contratos, vistas, RPC y clientes afectados;
4. coexistencia, shadow, dual evaluation, backfill, cutover y retiro requieren gates separados;
5. migraciones expand-contract preceden cambios incompatibles cuando aplique;
6. rollback no borrará hechos confirmados ni reinterpretará historia;
7. LOCAL, TEST, STAGING y PRODUCTION conservan identidad y controles propios;
8. promoción seguirá `LOCAL_TO_TEST`, `TEST_TO_STAGING` y `STAGING_TO_PRODUCTION`;
9. drift no allowlisted bloquea promoción;
10. datos productivos no se copian a ambientes inferiores sin minimización, autorización y trazabilidad.

#### 27. Consecuencias positivas

- una fuente de verdad y owner explícitos por entidad o atributo;
- menor divergencia entre aplicaciones, RPC, triggers e integraciones;
- migraciones trazables y reversibles;
- autorización, RLS y auditoría alineadas;
- eventos, side effects y retries idempotentes;
- búsqueda y normalización sin destruir presentación ni identidad;
- ambientes comparables y promociones gobernadas;
- mejor capacidad de reconciliación, replay, soporte e investigación;
- separación verificable de VITAL;
- base común para servicios transversales del BLOQUE E4 y paquetes del BLOQUE E5.

#### 28. Trade-offs

1. aumenta el trabajo inicial de inventario, clasificación y mapping;
2. exige contratos explícitos donde antes existían accesos directos;
3. puede mantener temporalmente proyecciones o compatibilidad duplicada durante transición;
4. introduce metadatos, auditoría, versiones y evidencia adicionales;
5. limita refactorizaciones rápidas que no demuestren paridad;
6. algunos flujos deberán aceptar consistencia eventual y compensación;
7. la segregación de ambientes y secretos incrementa costo operativo;
8. índices, storage y retención deberán balancear rendimiento, costo y cumplimiento;
9. la revisión humana seguirá siendo necesaria para ambigüedad, identidad y decisiones legales;
10. el cierre arquitectónico no elimina deuda legacy; la convierte en trabajo de transición trazable.

#### 29. Riesgos aceptados

Se aceptan únicamente bajo control y seguimiento:

| Riesgo                                                             | Condición de aceptación                                                         |
| ------------------------------------------------------------------ | ------------------------------------------------------------------------------- |
| coexistencia temporal legacy y objetivo                            | inventario, shadow, paridad, owner, fecha y criterio de retiro                  |
| duplicación temporal de proyecciones                               | fuente inequívoca, reconciliación, idempotencia y prohibición de dual ownership |
| consistencia eventual entre dominios                               | hecho durable, outbox o mecanismo equivalente, retry y visibilidad de lag       |
| mayor costo de auditoría y retención                               | clasificación, presupuesto, minimización y lifecycle aprobado                   |
| degradación temporal de throughput durante backfill o verificación | límites, ventanas, observación y rollback o pausa                               |
| compatibilidad por varias versiones                                | matriz, telemetría de adopción y fecha de retiro                                |
| decisiones humanas en casos ambiguos                               | segregación, evidencia, SLA y no aplicación antes de aprobación                 |
| rollback mediante forward-fix                                      | preservación de hechos, compensación y prueba previa                            |

Aceptar estos riesgos no autoriza omitir controles ni convertirlos en estado permanente.

#### 30. Riesgos no aceptados

Quedan bloqueados:

- ownership ambiguo o dos fuentes activas sin regla de autoridad;
- escrituras cross-domain sin contrato;
- autorización o normalización decidida únicamente en cliente;
- bypass ordinario mediante credenciales privilegiadas;
- pérdida del original, procedencia, actor, razón o versión;
- fusión, desactivación o reasignación por coincidencia textual;
- side effects no idempotentes o retries sin deduplicación;
- migración irreversible sin evidencia, reconciliación y estrategia de recuperación;
- exposición de secretos o datos sensibles en logs, URLs, fixtures o ambientes inferiores;
- drift ambiental desconocido o promoción directa a producción;
- reinterpretación silenciosa de historia con una versión nueva;
- propagación de reglas de Vento OS a VITAL por coexistencia física;
- implementación física mientras exista una contradicción arquitectónica abierta.

#### 31. Condiciones de reversión

`ADR-DATA-001` no se elimina ni se edita para simular que una decisión anterior nunca existió. Podrá cambiar a `SUPERSEDED` mediante un nuevo ADR cuando:

1. la evidencia demuestre que una decisión aceptada produce riesgo mayor que su alternativa;
2. una obligación legal, contractual o de seguridad haga incompatible una decisión central;
3. cambie la frontera entre productos, tenants o dominios;
4. el proveedor de plataforma impida un control esencial y exista arquitectura sustituta aprobada;
5. la transición demuestre imposibilidad material con evidencia reproducible;
6. un incidente revele pérdida de integridad, confidencialidad, disponibilidad o auditabilidad atribuible al ADR;
7. una reversión sea aprobada con impacto, compatibilidad, migración, evidencia y tratamiento de historia.

Revertir una implementación no revierte automáticamente el ADR. Revertir el ADR exige decisión explícita y plan de transición propio.

#### 32. Criterios que obligan a un nuevo ADR

Se requiere un ADR nuevo o supersesor para:

- crear, fusionar o dividir dominios o bounded contexts;
- cambiar la fuente de verdad o owner de una entidad crítica;
- modificar límites de agregado o consistencia;
- introducir multi-tenancy o cambiar aislamiento territorial u organizacional;
- trasladar autoridad semántica entre aplicación, servicio, RPC, base o proveedor externo;
- sustituir el modelo RLS, identidad o contexto de acceso;
- adoptar event sourcing, CDC, broker, lakehouse o almacén analítico como fuente operacional;
- cambiar clases de sensibilidad, retención o eliminación de forma incompatible;
- hacer pública una superficie o activo previamente restringido;
- modificar la frontera Vento OS–VITAL;
- admitir una integración externa como owner de atributos internos nuevos;
- eliminar un ambiente, gate o etapa obligatoria de promoción;
- aceptar pérdida de compatibilidad o irreversibilidad no contemplada;
- contradecir una invariante central de este ADR.

#### 33. Relación con BLOQUE E4

El BLOQUE E4 deberá materializar servicios transversales compatibles con este ADR, incluyendo observabilidad, auditoría, outbox o entrega equivalente, jobs, notificaciones, archivos, secretos, integración, reintentos y recuperación.

Reglas:

1. E4 consume contratos de dominio; no redefine ownership;
2. un servicio transversal no se convierte en fuente de verdad por centralizar transporte;
3. observabilidad no sustituye auditoría ni autorización;
4. un bus, cola o webhook transporta hechos; no decide su semántica;
5. jobs y automatizaciones usan las mismas versiones, identidades e idempotencia;
6. cualquier servicio E4 que requiera contradecir este ADR deberá bloquearse y promover un nuevo ADR.

#### 34. Relación con BLOQUE E5

El BLOQUE E5 deberá convertir las decisiones en paquetes implementables, con alcance, dependencias, repositorios, migraciones, pruebas, ambientes, rollout, soporte y rollback.

Cada paquete E5 deberá declarar:

- decisión o requisito que materializa;
- fuente y destino;
- contratos afectados;
- estrategia de compatibilidad;
- orden y dependencias;
- datos existentes y backfill;
- controles de seguridad;
- corpus y evidencia;
- criterio de activación;
- observación y abandono;
- rollback o forward-fix;
- owner operativo y cierre.

E5 no podrá reinterpretar una decisión ni agrupar cambios incompatibles para reducir pasos.

#### 35. Puerta de transición

El estado `ACCEPTED` habilita iniciar `SUPA-TRANS-001`, pero no autoriza DDL, DML ni despliegue.

Antes de cualquier materialización física deberán cumplirse, como mínimo:

1. inventario completo de contratos, vistas, RPC, funciones, triggers, RLS, índices, clientes, jobs, Edge Functions e integraciones afectados;
2. clasificación source, target, retained, migrated, derived, deprecated o removed;
3. mapa de consumidores y productores;
4. compatibilidad por versión;
5. estrategia de seguridad, datos sensibles y secretos;
6. baseline y evidencia reproducible;
7. dry-run y análisis de colisiones;
8. orden técnico de migración;
9. pruebas de paridad, concurrencia, idempotencia y rendimiento;
10. rollback, forward-fix, reconciliación y restauración;
11. ambiente de validación y gate de promoción;
12. ausencia de decisión arquitectónica abierta o contradicción canónica.

#### 36. Gobierno del ADR

1. la versión `1.0.0` es inmutable una vez aceptada;
2. correcciones editoriales sin cambio semántico se registran sin alterar decisiones;
3. cambio semántico compatible crea una revisión aditiva documentada;
4. cambio incompatible crea un ADR supersesor;
5. owner y reviewers deberán reexaminar el ADR ante incidente grave, cambio legal, nueva plataforma, nueva frontera de producto o hallazgo de transición;
6. cada excepción tendrá owner, motivo, alcance, inicio, vencimiento, controles y cierre;
7. ninguna excepción reduce RLS, auditoría, integridad, protección de secretos o separación de VITAL sin nuevo ADR;
8. los requisitos 04A son la base verificable de conformidad y conservan historia aun cuando el ADR sea supersedido.

#### 37. Alternativas rechazadas

| Alternativa                                               | Motivo de rechazo                                                                |
| --------------------------------------------------------- | -------------------------------------------------------------------------------- |
| mantener el modelo actual y corregir casos aislados       | conserva ownership ambiguo y helpers divergentes                                 |
| centralizar toda lógica en PostgreSQL                     | convierte triggers y funciones en motor empresarial oculto y dificulta evolución |
| centralizar toda lógica en clientes                       | rompe autoridad servidor, paridad, seguridad e idempotencia                      |
| usar un schema por aplicación como dominio                | confunde consumidor con propietario y perpetúa escrituras cruzadas               |
| usar `public` como dominio universal                      | mantiene mezcla de responsabilidades y superficie excesiva                       |
| migración big bang                                        | impide compatibilidad, observación, rollback y reconciliación gradual            |
| dual write indefinido                                     | crea dos fuentes activas y divergencia silenciosa                                |
| normalización universal de texto                          | destruye marcas, nombres legales, identificadores, originales e historia         |
| usar eventos como fuente completa sin decisión específica | confunde transporte, auditoría y estado autoritativo                             |
| compartir arquitectura con VITAL por similitud            | viola frontera de producto y ownership                                           |

#### 38. Decisiones reservadas a transición

Este ADR no decide todavía:

- nombres físicos finales de schemas, tablas, columnas, índices, constraints o funciones;
- qué objetos legacy se conservan, migran, encapsulan o retiran;
- contenido exacto de cada migración;
- batches, ventanas y throughput de backfill;
- orden definitivo de paquetes después del inventario;
- solución física concreta de outbox, inbox, cola, CDC o procesamiento asíncrono;
- proveedor o herramienta adicional;
- configuración de secretos, proyectos, regiones o ambientes;
- fecha de cutover;
- datos concretos que requieren corrección o fusión;
- aceptación de excepciones descubiertas durante transición.

Estas decisiones pertenecen a `SUPA-TRANS-001` a `SUPA-TRANS-016`, `DATA-NORM-TRANS-001` a `DATA-NORM-TRANS-009`, BLOQUE E4 y paquetes E5 según su propiedad.

#### 39. Corpus de conformidad

El corpus integral deberá demostrar, como mínimo:

1. ownership único y atributos con autoridad diferenciada;
2. referencias dentro y fuera del agregado;
3. comando autorizado, rechazado, repetido y concurrente;
4. commit, rollback técnico, compensación y corrección;
5. evento, side effect, retry, duplicado y orden invertido;
6. RLS, RPC, service role y bypass controlado;
7. actor humano, dispositivo, servicio y contexto territorial;
8. dato ordinario, personal, financiero, legal, secreto y archivo;
9. retención, legal hold, anonimización y eliminación;
10. búsqueda exacta, tolerante, paginada y con cambio de versión;
11. original externo, mapping, cuarentena, ACK y reconciliación;
12. snapshot histórico, proyección sincronizable y cache regenerable;
13. cliente compatible, legacy, desactualizado y retirado;
14. LOCAL, TEST, STAGING y PRODUCTION con promoción y drift;
15. shadow, backfill, cutover, rollback y forward-fix;
16. separación de VITAL;
17. evidencia suficiente sin exposición sensible;
18. ausencia de cambios físicos anticipados por este ADR.

#### 40. Hallazgos y carryovers

| ID                 | Decisión o brecha                                                                                           | Resultado de esta tarea                                  | Propietario siguiente                                |
| ------------------ | ----------------------------------------------------------------------------------------------------------- | -------------------------------------------------------- | ---------------------------------------------------- |
| `SUPA-ARC-025-H01` | las decisiones arquitectónicas estaban distribuidas en 43 tareas de arquitectura, auditoría y normalización | adopción normativa única mediante `ADR-DATA-001`         | `SUPA-TRANS-001`; gobierno documental                |
| `SUPA-ARC-025-H02` | una síntesis podía contradecir decisiones específicas                                                       | regla de precedencia y no reinterpretación aprobada      | todas las tareas de transición                       |
| `SUPA-ARC-025-H03` | estado `ACCEPTED` podía confundirse con implementación                                                      | cierre arquitectónico separado de materialización física | `SUPA-TRANS-001` a `SUPA-TRANS-016`                  |
| `SUPA-ARC-025-H04` | riesgos temporales carecían de clasificación consolidada                                                    | riesgos aceptados y no aceptados definidos               | `SUPA-TRANS-009`; `SUPA-TRANS-010`; `SUPA-TRANS-015` |
| `SUPA-ARC-025-H05` | no existían condiciones consolidadas de reversión o supersesión                                             | condiciones y disparadores de nuevo ADR aprobados        | gobierno de arquitectura                             |
| `SUPA-ARC-025-H06` | E4 y E5 podían reinterpretar ownership o secuencia                                                          | relación de consumo y materialización delimitada         | BLOQUES E4 y E5                                      |
| `SUPA-ARC-025-H07` | transición podía iniciar sin inventario completo                                                            | puerta de doce condiciones aprobada                      | `SUPA-TRANS-001`; `SUPA-TRANS-015`                   |
| `SUPA-ARC-025-H08` | VITAL podía incluirse por coexistencia física                                                               | exclusión transversal ratificada                         | cualquier ADR o contrato futuro de interoperabilidad |
| `SUPA-ARC-025-H09` | roles de owner y reviewers no estaban consolidados                                                          | gobierno mínimo aprobado                                 | gobierno documental y de plataforma                  |
| `SUPA-ARC-025-H10` | implementación física permanece inexistente                                                                 | ADR aceptado con cero cambios físicos                    | tareas de transición y paquetes E5                   |

#### 41. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

Se crean los requisitos:

- `TREQ-SUPABASE-1656` a `TREQ-SUPABASE-1695`.

El detalle canónico de cada requisito reside en el registro 04A actualizado hasta esta tarea.

#### 42. Criterios de integridad

El ADR se considera íntegro para esta etapa cuando:

1. identifica `ADR-DATA-001`, versión `1.0.0` y estado `ACCEPTED`;
2. declara fecha, owner, reviewers y custodia;
3. adopta `SUPA-ARC-001` a `SUPA-ARC-024` sin reinterpretación;
4. adopta la evidencia `DATA-NORM-AUD-001` a `DATA-NORM-AUD-007`;
5. adopta `DATA-NORM-ARC-001` a `DATA-NORM-ARC-012`;
6. define precedencia entre ADR, decisiones específicas y transición;
7. consolida dominios, ownership, agregados, referencias y schemas;
8. consolida capas, transacciones, eventos, idempotencia y estados;
9. consolida identidad, RLS, seguridad, auditoría y calidad;
10. consolida búsqueda, Storage, secretos, jobs e integraciones;
11. consolida compatibilidad, migración y ambientes;
12. ratifica la separación de VITAL;
13. enumera consecuencias positivas y trade-offs;
14. distingue riesgos aceptados y no aceptados;
15. define condiciones de reversión y nuevo ADR;
16. delimita los BLOQUES E4 y E5;
17. habilita transición desde `SUPA-TRANS-001` sin autorizar cambios físicos;
18. exige una puerta de doce condiciones antes de materialización;
19. reserva decisiones físicas a sus tareas propietarias;
20. incorpora un corpus integral y cuarenta requisitos nuevos;
21. mantiene cero cambios físicos y cero decisiones arquitectónicas abiertas dentro del alcance consolidado.

#### 43. Continuidad

```text
ÚLTIMA TAREA APROBADA
DATA-NORM-ARC-012 — Definir tratamiento de datos recibidos desde integraciones externas
        ↓
TAREA ACTUAL APROBADA
SUPA-ARC-025 — Consolidar y aprobar ADR de arquitectura canónica de datos
        ↓
SIGUIENTE TAREA RESERVADA
SUPA-TRANS-001 — Inventariar contratos, vistas, RPC y clientes afectados
```

