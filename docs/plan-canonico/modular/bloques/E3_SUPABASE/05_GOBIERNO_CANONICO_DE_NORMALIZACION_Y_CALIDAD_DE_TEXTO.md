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


### [ ] DATA-NORM-ARC-005 — Definir excepciones de marcas, siglas, unidades y nombres legales
### [ ] DATA-NORM-ARC-006 — Definir diccionario ortográfico canónico y su gobierno
### [ ] DATA-NORM-ARC-007 — Definir cola de revisión para correcciones ambiguas
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
