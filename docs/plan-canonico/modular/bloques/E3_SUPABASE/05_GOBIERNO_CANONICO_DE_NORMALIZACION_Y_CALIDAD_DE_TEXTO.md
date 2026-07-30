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


### [ ] DATA-NORM-ARC-002 — Definir clases de campo y tratamiento permitido
### [ ] DATA-NORM-ARC-003 — Definir reglas de capitalización para nombres empresariales
### [ ] DATA-NORM-ARC-004 — Definir conectores que permanecen en minúscula
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
