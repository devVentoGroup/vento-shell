### IMPLEMENTACIÓN FÍSICA DE NORMALIZACIÓN

<!-- EXECUTION-GATE-RECONCILIATION:B201-400:DATA-NORM-DB -->
#### Reconciliación topológica de DATA-NORM-DB-001 a DATA-NORM-DB-010

La normalización física se ejecuta de forma progresiva, trazable y delimitada por dominio o paquete; queda prohibida una transformación global indiscriminada.

| Propiedad     | Valor                     |
| ------------- | ------------------------- |
| modalidad     | `TEMPLATE_PER_PACKAGE`    |
| gate temporal | `POST_E5_PACKAGE`         |
| identidad     | `<task_id>::<package_id>` |

El package_id aplicable debe identificar reglas, dominio, dry-run, colisiones, backfill, activación, constraints, índices, triggers, auditoría, rollback y evidencia que correspondan a su alcance.

Una infraestructura o función reutilizable creada durante una instancia no autoriza aplicar la misma transformación a dominios ajenos al paquete. Los backfills y cambios persistentes conservan siempre aislamiento, evidencia y rollback por alcance aprobado.

### ✅ DATA-NORM-DB-001 — Implementar almacenamiento de versiones de reglas y diccionarios

**Estado:** APROBADA
**Tarea anterior:** AUTH-DB-026 — Generar y publicar tipos después de cada paquete aprobado
**Tarea siguiente:** DATA-NORM-DB-002 — Implementar funciones SQL deterministas cuando sean necesarias
**Tipo de tarea:** Documental; contrato y plantilla R2 repetible por `package_id` para materializar almacenamiento versionado, inmutable, auditable y reproducible de reglas, políticas, catálogos y diccionarios de normalización, junto con sus estados, vigencias, supersesiones, conjuntos efectivos y procedencia, sin crear tablas, migraciones, funciones, triggers, datos ni cambios remotos durante esta definición
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/04_IMPLEMENTACION_FISICA_DE_NORMALIZACION.md`
**Estado físico resultante:** Contrato canónico `TEMPLATE_PER_PACKAGE` cerrado; cada futura instancia `DATA-NORM-DB-001::<package_id>` permanece no ejecutada hasta satisfacer el paquete E5 aplicable, las fundaciones y gates físicos correspondientes, la reconciliación de drift y la autorización física explícita
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Objetivo

`DATA-NORM-DB-001` define el contrato de persistencia que deberá usar cada paquete aprobado para almacenar versiones de reglas, políticas, catálogos y diccionarios de normalización sin convertir el estado mutable de una fila, una constante de aplicación o el remoto observado en la única representación de la historia.

La futura materialización deberá permitir responder de forma reproducible:

1. qué regla o catálogo existía;
2. qué versión exacta estaba aprobada;
3. cuál era su contenido ejecutable;
4. qué digest identificaba ese contenido;
5. qué coordenada y alcance gobernaba;
6. qué estado de ciclo de vida tenía;
7. desde cuándo y hasta cuándo podía aplicarse;
8. qué versión reemplazaba o era reemplazada;
9. qué evidencia y autoridad justificaban su activación;
10. qué conjunto exacto de versiones debía consumir una evaluación;
11. qué versión debía usarse para reconstruir historia;
12. cómo bloquear una dependencia ausente, conflictiva o incompatible sin fallback silencioso.

La tarea no ejecuta todavía almacenamiento físico. Define la plantilla que deberá materializar cada `package_id` autorizado.

---

#### 2. Resultado canónico

Queda definido:

```text
DATA-NORM-DB-001
→ contrato documental único y reutilizable

DATA-NORM-DB-001::<package_id>
→ futura instancia física por paquete

definición canónica versionada
→ contenido inmutable
→ identidad y digest
→ estado y vigencia
→ supersesión explícita
→ conjunto efectivo de versiones
→ activación gobernada
→ reconstrucción histórica
→ rollback lógico compatible
```

La definición global no se reabre por cada paquete.

Cada instancia física conserva alcance, migraciones, objetos, seeds, evidencia, rollback y consumidores propios.

---

#### 3. Topología vinculante

La topología aplicable es:

```text
mode = TEMPLATE_PER_PACKAGE
execution_gate = POST_E5_PACKAGE
instance_pattern = DATA-NORM-DB-001::<package_id>
```

Consecuencias:

1. no existe `DATA-NORM-DB-001::GLOBAL`;
2. una aprobación documental no crea almacenamiento físico;
3. una aprobación documental no crea migraciones;
4. cada paquete materializa únicamente las reglas, catálogos y diccionarios de su alcance aprobado;
5. una infraestructura reutilizable creada por una instancia no autoriza insertar o activar versiones de otros paquetes;
6. la historia y evidencia de dos paquetes no se mezclan bajo una instancia anónima;
7. el marcador documental global no se modifica para registrar cada ejecución física futura.

---

#### 4. Gate temporal

Una futura instancia solo podrá materializar almacenamiento cuando, para el mismo `package_id`, estén satisfechas las puertas exigidas por R2 y por el paquete físico correspondiente.

Como mínimo deberá demostrarse:

```text
R0 aplicable = VERIFIED
R1 aplicable = VERIFIED
DELIV-PKG aplicable = CLOSED
E5-GATE-008::<package_id> = PASS
SHELL-CI-020::<package_id> = OPENED
drift aplicable = RECONCILED
physical_authorization = EXPLICIT
```

Si una de estas condiciones falta, la instancia permanece sin ejecución física.

La existencia de constantes versionadas en `@vento/data-normalization` no sustituye estas puertas.

---

#### 5. Fuentes vinculantes

Cada futura instancia deberá consumir sin reinterpretación silenciosa:

- `DATA-NORM-ARC-001` para resolución por dominio, entidad, campo, representación, fuente y versión;
- `DATA-NORM-ARC-002` para clases semánticas, roles de representación y roles de fuente;
- `DATA-NORM-ARC-003` a `DATA-NORM-ARC-006` para capitalización, conectores, excepciones y diccionario;
- `DATA-NORM-ARC-007` para decisiones humanas, evidencia y separación entre aprobación y materialización;
- `DATA-NORM-ARC-008` para búsqueda y representaciones derivadas;
- `DATA-NORM-ARC-009` como autoridad del contrato lógico de versiones, vigencia, auditoría, reproducibilidad e idempotencia;
- `DATA-NORM-ARC-010` para impedir que normalización o coincidencia se conviertan en identidad o fusión;
- `DATA-NORM-ARC-011` para la separación entre aplicación, servicio, RPC y trigger defensivo;
- `DATA-NORM-ARC-012` para datos externos, originales, mappings y compatibilidad de entrada;
- `DATA-NORM-TRANS-001` a `DATA-NORM-TRANS-009` cuando el paquete consume baseline, dry-run, activación, transición, reintentos, replay o rollback;
- `SUPA-TRANS-*` aplicables para migraciones, compatibilidad, pruebas, paridad y recuperación;
- las definiciones materializadas de `@vento/data-normalization`;
- el expediente E5 y los consumidores registrados del `package_id`;
- el estado remoto recapturado al iniciar la instancia;
- la cobertura vigente del registro canónico de requisitos de prueba.

Una discrepancia entre estas fuentes se trata como drift y bloquea únicamente la materialización afectada hasta resolver la autoridad propietaria.

---

#### 6. Estado técnico de partida

El package `@vento/data-normalization` ya materializa en código contratos puros de normalización, entre ellos:

- reglas deterministas;
- catálogo versionado de conectores;
- catálogo versionado de excepciones oficiales;
- diccionario ortográfico versionado;
- contratos de búsqueda;
- contratos lógicos de auditoría, versiones e idempotencia;
- corpus de conformidad.

Ese package declara explícitamente que la persistencia física pertenece a `DATA-NORM-DB-001` a `DATA-NORM-DB-010`.

El corte read-only de Supabase revisado durante esta definición no evidenció un almacenamiento canónico que use las identidades estructurales:

```text
rule_key
rule_version_id
dictionary_entry_key
dictionary_version
version_set_digest
```

Los objetos encontrados por búsqueda nominal pertenecen a otros propósitos y no se adoptan como almacenamiento de reglas por similitud de nombre.

Por tanto, la futura instancia deberá crear o adoptar almacenamiento únicamente mediante una decisión explícita y versionada del paquete, nunca por inferencia desde una tabla legacy.

---

#### 7. Principio de autoridad

La autoridad se mantiene separada:

```text
definición canónica en repositorio
→ fuente versionada de bootstrap y cambio

almacenamiento físico aprobado
→ estado persistido, vigencia, activación y reconstrucción

auditoría de operaciones
→ evidencia de evaluaciones y efectos

datos empresariales
→ valores gobernados, no fuente de las reglas
```

Reglas:

1. una fila de datos empresariales no define una regla;
2. la forma más frecuente en producción no define el diccionario;
3. un registro remoto no aprobado no redefine el package;
4. una constante local no puede sobrescribir una versión persistida activa;
5. el almacenamiento físico no puede editar silenciosamente la semántica aprobada en repositorio;
6. una diferencia entre repo y remoto se clasifica como drift;
7. la recuperación desde remoto deberá conservar procedencia suficiente para reconciliarse con el repo;
8. el source of truth del cambio continúa gobernado por `vento-shell`.

---

#### 8. Unidad versionada

La unidad mínima de persistencia es una **versión inmutable**, no una regla mutable.

Cada versión deberá conservar, cuando aplique, la identidad definida por `DATA-NORM-ARC-009`:

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

Invariantes:

1. `rule_key` identifica el concepto estable;
2. `rule_version_id` identifica una definición inmutable;
3. `version_number` nunca se reutiliza para otro contenido;
4. `content_digest` cubre el contenido normativo ejecutable y sus dependencias relevantes;
5. modificar contenido ejecutable crea otra versión;
6. una versión no puede tener dos digests válidos;
7. una versión no puede tener contenidos distintos entre ambientes;
8. la identidad visible o el título humano no sustituyen `rule_version_id`.

---

#### 9. Familias persistibles

El almacenamiento futuro deberá representar, dentro del alcance de cada paquete, las familias canónicas realmente consumidas.

Como mínimo deberá poder persistir o referenciar de forma reproducible:

- políticas por campo;
- catálogo de clases;
- perfil de capitalización;
- catálogo de conectores;
- catálogo de excepciones oficiales;
- diccionario ortográfico;
- decisiones de revisión promovidas a una versión gobernada;
- política de búsqueda;
- perfil de idioma y Unicode;
- artefacto de algoritmo;
- mapping externo cuando aplique.

No todas las familias deben existir físicamente en todas las instancias.

Una familia `NOT_APPLICABLE` no se crea por completitud estética.

---

#### 10. `RULE_GOVERNANCE_RECORD`

La familia lógica `RULE_GOVERNANCE_RECORD` definida por la arquitectura es la base para persistir gobierno de una versión.

Cada registro deberá permitir reconstruir, como mínimo:

- identidad estable;
- familia;
- contenido o referencia inmutable al contenido;
- digest;
- coordenada;
- clase semántica;
- operación;
- idioma o locale;
- estado;
- vigencia;
- evidencia de aprobación;
- autoridad;
- relación de supersesión;
- procedencia del artefacto;
- package de origen.

El registro no contiene por sí mismo un valor empresarial antes/después de una normalización. Esa evidencia operacional pertenece a `DATA-NORM-DB-009`.

---

#### 11. Persistencia del diccionario ortográfico

El almacenamiento del diccionario deberá conservar el contrato lógico vigente de cada entrada de `VENTO_CANONICAL_ORTHOGRAPHIC_DICTIONARY_ES_CO@1.0.0`.

Cada entrada ejecutable deberá conservar, como mínimo:

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

1. la entrada es inmutable dentro de su versión;
2. `dictionary_entry_key` no depende del texto visible;
3. cambiar origen, destino, alcance, autoridad o vigencia crea otra versión o entrada gobernada;
4. una entrada incompleta no puede activarse;
5. la forma inversa no se infiere;
6. los estados no ejecutables permanecen disponibles para historia;
7. una entrada retirada no reaparece mediante fallback;
8. el almacenamiento no genera entradas por frecuencia, similitud ni observación.

---

#### 12. Bootstrap del diccionario inicial

Cuando el `package_id` autorice materializar el diccionario inicial, la carga deberá provenir de la definición versionada del repositorio.

Para la versión inicial aprobada, el universo de correcciones automáticas permanece exactamente:

```text
maiz -> maíz
clasico -> clásico
frio -> frío
```

`expresso` no se incorpora como corrección automática.

La futura migración deberá comprobar:

- cantidad esperada;
- claves esperadas;
- versión esperada;
- contenido esperado;
- digest esperado;
- ausencia de entradas extra;
- ausencia de duplicados;
- ausencia de aliases implícitos.

Una carga parcial no puede declararse activa.

---

#### 13. Persistencia del catálogo de conectores

Cuando el paquete materialice `VENTO_COMMERCIAL_CONNECTOR_CATALOG_ES_CO@1.0.0`, deberá preservar exactamente las dieciocho entradas aprobadas y su versión.

El almacenamiento deberá distinguir:

- identidad del catálogo;
- versión;
- entrada;
- familia;
- estado o vigencia aplicable;
- digest del conjunto;
- procedencia;
- package de origen.

Reglas:

1. no se agregan conectores locales;
2. no se crean aliases;
3. no se reordena la semántica por orden físico;
4. una nueva entrada exige nueva versión canónica;
5. una versión incompleta no se activa;
6. el digest del conjunto debe permitir detectar pérdida, duplicación o alteración.

---

#### 14. Persistencia del catálogo de excepciones oficiales

Cuando el paquete materialice `VENTO_OFFICIAL_TEXT_EXCEPTION_CATALOG@1.0.0`, cada `OfficialTextExceptionEntry` deberá conservar las dimensiones aprobadas de:

- identidad;
- familia;
- forma canónica;
- alcance;
- dominio;
- entidad;
- campo;
- clase semántica;
- representación;
- fuente;
- perfil lingüístico;
- modo de coincidencia;
- variantes explícitas;
- modo de aplicación;
- autoridad;
- owner;
- evidencia;
- estado;
- vigencia;
- versión;
- supersesión;
- motivo.

No se permite:

- reducir el registro a `texto -> reemplazo`;
- eliminar evidencia o owner;
- perder scope;
- convertir candidatos no aprobados en entradas ejecutables;
- crear una excepción por coincidencia visual;
- reinterpretar una entrada retirada como activa.

---

#### 15. Contenido canónico frente a payload físico

La tarea no impone una columna universal JSON ni una tabla por cada familia.

La futura instancia podrá elegir una representación física únicamente si demuestra:

1. fidelidad completa al contrato canónico;
2. validación de campos obligatorios;
3. integridad referencial suficiente;
4. consulta segura del estado activo;
5. reconstrucción histórica;
6. digest reproducible;
7. migración forward-only;
8. compatibilidad con RLS, grants y capa ejecutora;
9. rendimiento apropiado al volumen;
10. rollback verificable.

La elección de JSONB, columnas normalizadas, composición u otra forma no puede sacrificar validación, seguridad o queryability necesaria.

---

#### 16. Estados unificados

La persistencia deberá soportar los ocho estados unificados de `DATA-NORM-ARC-009`:

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

1. solo `ACTIVE` puede resolver decisiones nuevas bajo el estado unificado;
2. los estados específicos de una familia conservan su nombre de origen en la evidencia;
3. el mapping entre estado específico y estado unificado es explícito;
4. `SUPERSEDED`, `RETIRED`, `REJECTED` e `INVALIDATED` no se reactivan en sitio;
5. reactivar una semántica terminal crea otra versión;
6. un estado no se infiere a partir de una fecha nula;
7. la ausencia en caché no significa `RETIRED`;
8. una transición ilegal falla cerrada.

---

#### 17. Vigencia temporal

Toda versión ejecutable deberá conservar:

```text
approved_at
approved_by_authority
effective_from
effective_to
activation_scope
activation_environment
activation_event_id
```

La persistencia deberá distinguir aprobación de activación.

Invariantes:

1. una versión aprobada no está activa automáticamente;
2. `effective_from` no basta sin activación válida;
3. `effective_to` limita decisiones nuevas, no reescribe historia;
4. la vigencia se evalúa con semántica temporal explícita;
5. la presentación local de hora no cambia la decisión;
6. una operación iniciada con un conjunto fijado no mezcla versiones por cambio de reloj;
7. una ventana superpuesta incompatible se bloquea;
8. una versión futura no puede activarse anticipadamente por configuración local.

---

#### 18. Supersesión

Toda sustitución de una versión deberá preservar:

- versión anterior;
- versión sucesora;
- motivo;
- autoridad;
- fecha;
- alcance;
- compatibilidad;
- evidencia;
- package;
- condición de rollback.

Reglas:

1. la versión anterior no se edita para parecer la nueva;
2. la versión anterior permanece reconstruible;
3. `supersedes` no autoriza borrar el contenido reemplazado;
4. la cadena de supersesión no puede tener ciclos;
5. una versión no puede supersederse a sí misma;
6. una bifurcación incompatible exige resolución explícita antes de activación;
7. la historia no se reconstruye desde la última versión.

---

#### 19. Conjunto efectivo de versiones

Cada evaluación futura deberá resolver un `resolved_version_set` y su `version_set_digest`.

El conjunto deberá representar, cuando aplique:

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

1. una dependencia no usada se declara `NOT_APPLICABLE`;
2. no se usa `latest`;
3. no se usa primera coincidencia;
4. no se usa la versión disponible en caché por conveniencia;
5. el mismo digest representa el mismo conjunto;
6. un cambio de miembro cambia el digest;
7. una dependencia ausente o incompatible bloquea;
8. el conjunto histórico permanece reconstruible.

---

#### 20. Persistencia de `version_set_digest`

El `version_set_digest` debe calcularse desde una representación canónica y ordenada de las dependencias efectivas.

La futura instancia deberá demostrar que:

```text
mismos miembros
+ mismas identidades
+ mismas versiones
+ misma representación canónica
= mismo version_set_digest
```

Y que:

```text
cualquier miembro materialmente distinto
= version_set_digest distinto
```

No se incluye en el digest:

- timestamp de consulta;
- ruta local;
- orden incidental de filas;
- hostname;
- locale del proceso;
- metadatos no semánticos.

El algoritmo concreto y su versión deberán quedar fijados antes de activarse.

---

#### 21. Activación por coordenada

La persistencia deberá soportar una resolución inequívoca por coordenada de política.

La coordenada consume, según el contrato aplicable:

```text
dominio propietario
entidad propietaria
campo semántico
representación
rol de fuente
versión o conjunto efectivo
```

Reglas:

1. una coordenada no puede resolver dos conjuntos `ACTIVE` incompatibles para la misma finalidad;
2. una política más general no amplía operaciones bloqueadas por una más específica;
3. la ausencia de resolución preserva el valor y bloquea la automatización;
4. una coordenada ambigua falla cerrada;
5. la activación no se infiere por fecha de inserción;
6. la activación debe ser observable y reversible de forma gobernada;
7. el mecanismo transaccional de activación pertenece a la futura implementación y a `DATA-NORM-DB-002` cuando requiera funciones deterministas.

---

#### 22. Inmutabilidad física esperada

La futura implementación deberá impedir modificaciones destructivas de una versión que ya haya alcanzado un estado gobernado.

La estrategia deberá garantizar que:

- contenido firmado no cambia en sitio;
- digest no cambia en sitio;
- identidad no cambia en sitio;
- supersesión es aditiva;
- suspensión o retiro son transiciones gobernadas;
- una rectificación crea otro registro o evento;
- una corrección administrativa no altera el contenido ejecutable;
- un rollback lógico no borra historia.

La elección concreta entre constraints, permisos, funciones y triggers pertenece a las tareas físicas posteriores aplicables. Esta tarea fija el invariante, no anticipa su mecanismo.

---

#### 23. Procedencia

Cada versión materializada deberá conservar suficiente procedencia para identificar:

- repositorio propietario;
- revisión o commit fuente;
- package de origen;
- artefacto canónico;
- versión del artefacto;
- digest del contenido;
- algoritmo;
- versión de algoritmo;
- perfil de idioma;
- versión Unicode cuando afecte semántica;
- configuración semántica;
- evidencia de aprobación;
- autoridad;
- ambiente de activación.

Una versión sin procedencia suficiente no puede activarse.

---

#### 24. Bootstrap y seed

El seed de una versión aprobada es una operación de materialización gobernada.

Reglas:

1. el seed proviene de fuente versionada;
2. es idempotente respecto de identidad y digest;
3. misma identidad + mismo digest equivale a la misma definición;
4. misma identidad + digest diferente es conflicto;
5. una carga repetida no crea otra versión;
6. un seed incompleto no activa parcialmente el conjunto;
7. un seed no corrige datos empresariales;
8. un seed no activa automáticamente versiones;
9. los errores se resuelven mediante una migración o versión posterior, no editando migraciones aplicadas.

---

#### 25. Idempotencia de materialización

Cada futura instancia deberá poder repetir de forma segura la materialización de metadatos versionados.

La operación deberá distinguir:

```text
NO_EXISTE
→ crear versión pendiente según contrato

EXISTE_MISMA_IDENTIDAD_MISMO_DIGEST
→ no-op verificable

EXISTE_MISMA_IDENTIDAD_DIGEST_DISTINTO
→ conflicto y bloqueo

EXISTE_VERSION_SUPERSEDED_O_TERMINAL
→ preservar; no reactivar implícitamente

DEPENDENCIA_INCOMPLETA
→ bloquear activación
```

La idempotencia no se basa únicamente en que un `INSERT` no falle.

---

#### 26. Concurrencia

La futura implementación deberá impedir que dos activaciones o seeds concurrentes produzcan un conjunto efectivo incoherente.

Antes de cambiar estado o activar deberá verificarse:

- versión esperada;
- estado esperado;
- digest esperado;
- coordenada esperada;
- conjunto anterior esperado;
- package y ambiente esperados.

Una expectativa obsoleta bloquea y exige recaptura.

No se resuelve concurrencia mediante último escritor.

---

#### 27. Separación de decisiones humanas

Una resolución de `DATA-NORM-ARC-007` puede autorizar crear una nueva versión lógica, pero no equivale a:

- insertar una versión física sin gate;
- activarla;
- corregir filas;
- ejecutar backfill;
- propagar valores;
- crear constraints;
- fusionar registros.

La persistencia deberá vincular la decisión con la versión propuesta sin fusionar ambas operaciones.

La decisión cerrada permanece inmutable aunque posteriormente exista otra versión.

---

#### 28. Separación frente a datos empresariales

`DATA-NORM-DB-001` no almacena reglas mezcladas con las filas gobernadas.

Queda prohibido usar como mecanismo canónico:

- columnas ad hoc de configuración dentro de una tabla empresarial;
- strings de versión repetidos en cada fila como única fuente de la definición;
- comentarios SQL como única definición de regla;
- variables de entorno como contenido normativo;
- configuración exclusiva del frontend;
- mapas locales por aplicación;
- triggers con listas hardcoded como única autoridad.

Los datos empresariales podrán referenciar la versión aplicada cuando el contrato posterior lo exija, sin contener ni redefinir la regla.

---

#### 29. Separación frente a auditoría operacional

Esta tarea persiste gobierno y versiones.

`DATA-NORM-DB-009` conserva la responsabilidad de registrar, en la operación aplicable:

```text
valor previo
valor resultante
versión o conjunto de versiones
```

Por tanto, `DATA-NORM-DB-001` no absorbe:

- ledger completo de mutaciones;
- historial de valores antes/después;
- auditoría de cada evaluación;
- correlation de efectos hijos;
- replay operacional por entidad;
- evidencia de cada backfill.

Puede almacenar la definición y los metadatos necesarios para que esa auditoría sea reproducible.

---

#### 30. Separación frente a funciones SQL

`DATA-NORM-DB-002` conserva la responsabilidad sobre funciones SQL deterministas cuando sean necesarias.

`DATA-NORM-DB-001` no define ni implementa:

- funciones de resolución;
- funciones de digest;
- funciones de activación;
- funciones de matching;
- funciones de normalización;
- RPC;
- triggers.

La estructura de almacenamiento deberá, sin embargo, permitir que las funciones posteriores consuman identidades y versiones sin inferencia.

---

#### 31. Seguridad

La futura persistencia deberá aplicar mínimo privilegio.

Invariantes:

1. las reglas no se exponen a browser o mobile por existir en una tabla;
2. la capacidad de leer versiones históricas se separa de la capacidad de activar;
3. proponer, aprobar, activar, suspender, retirar y administrar evidencias son capacidades diferentes;
4. un rol de aplicación no obtiene escritura directa sobre contenido inmutable;
5. RLS o aislamiento equivalente se aplican según el schema y exposición real;
6. `service_role` no sustituye autorización empresarial;
7. funciones privilegiadas futuras requieren revisión específica;
8. la historia no puede editarse mediante una policy permisiva;
9. evidencia sensible se minimiza;
10. los catálogos no contienen secrets.

Esta tarea no asigna grants concretos ni crea policies físicas.

---

#### 32. Privacidad y minimización

La persistencia de gobierno almacena únicamente lo necesario para reproducir decisiones.

Se prefieren:

- referencias de evidencia;
- digests;
- IDs técnicos;
- owners;
- timestamps de vigencia;
- metadatos de procedencia.

No se duplican por conveniencia:

- payloads externos completos;
- tokens;
- credenciales;
- PII;
- originales empresariales no necesarios;
- consultas sensibles;
- documentos legales completos cuando basta una referencia protegida.

La evidencia que deba conservar contenido sensible pertenece a su almacén propietario y se referencia bajo controles de acceso.

---

#### 33. Migraciones forward-only

Toda materialización física posterior deberá realizarse desde `vento-shell` mediante migraciones versionadas y forward-only.

Queda prohibido:

- editar una migración aplicada;
- modificar una versión persistida para corregir un seed;
- borrar historia para cuadrar un digest;
- recrear una versión histórica desde `current`;
- usar DDL manual remoto como estado final no versionado.

Una corrección crea una nueva migración, versión o evento de reconciliación según corresponda.

---

#### 34. Readiness de almacenamiento

Una instancia `DATA-NORM-DB-001::<package_id>` solo está lista para materializar cuando pueda responder afirmativamente:

```text
package_id identificado
AND reglas/catálogos exactos identificados
AND fuente versionada
AND digests reproducibles
AND coordinate scopes resueltos
AND modelo de estados resuelto
AND vigencias resueltas
AND supersesiones resueltas
AND seguridad resuelta
AND migración forward-only preparada
AND rollback preparado
AND pruebas preparadas
AND drift reconciliado
```

Si falta una condición, la instancia no debe crear una solución parcial que luego se trate como canónica.

---

#### 35. Readiness de activación

Crear almacenamiento no significa activar reglas.

La activación está lista únicamente si:

```text
versión materializada e íntegra
AND dependencias completas
AND version_set_digest estable
AND evidencia y autoridad válidas
AND estado aprobable
AND vigencia válida
AND coordinate scope inequívoco
AND compatibilidad comprobada
AND consumidores aplicables preparados
AND rollback lógico disponible
AND gate del package abierto
```

Una carga exitosa sin estas condiciones permanece no activa.

---

#### 36. Rollback

El rollback de esta familia es principalmente lógico y versionado.

Debe preservar:

- versión afectada;
- versión anterior compatible;
- contenido y digest de ambas;
- supersesión;
- activación original;
- motivo de reversión;
- alcance;
- consumidores;
- evidencia;
- historial.

Reglas:

1. no se borra la versión fallida;
2. no se reescribe una versión anterior;
3. una versión terminal no se reactiva en sitio;
4. cuando proceda, se activa una versión anterior compatible mediante una transición gobernada o se crea una versión correctiva;
5. si datos fueron modificados bajo la versión defectuosa, su remediación pertenece a la tarea de transición propietaria;
6. rollback de código y rollback de reglas son decisiones distintas.

---

#### 37. Drift

La instancia deberá recapturar drift entre:

```text
repositorio versionado
almacenamiento remoto
estado de activación
package desplegado
consumidores
```

Clases mínimas de drift:

- versión en repo ausente en remoto;
- versión remota sin fuente versionada;
- mismo ID con digest distinto;
- estado remoto distinto del esperado;
- versión activa incompatible;
- miembro faltante del conjunto;
- dependencia retirada todavía activa;
- versión histórica alterada;
- consumidor usando una versión no autorizada.

Mismo ID con digest distinto es bloqueo crítico; nunca se resuelve aceptando automáticamente el remoto.

---

#### 38. Paquete sin reglas nuevas

Un paquete puede requerir infraestructura pero no introducir una nueva versión semántica.

En ese caso la instancia deberá distinguir:

```text
infraestructura necesaria = SI/NO
versiones nuevas = 0
activaciones nuevas = 0
```

No se crea una nueva versión vacía ni se incrementa un catálogo por ritual.

Si la infraestructura ya existe y es compatible, la instancia puede cerrar sin DDL nuevo después de demostrar paridad y alcance.

---

#### 39. Paquetes concurrentes

Dos paquetes pueden proponer versiones en ventanas cercanas.

Reglas:

1. cada versión conserva `package_id` de origen;
2. una instancia recaptura el conjunto activo antes de activar;
3. un package no sobrescribe silenciosamente una versión activada por otro;
4. la compatibilidad se evalúa contra el estado vigente;
5. si cambió el baseline, se recalculan digest de conjunto y gates afectados;
6. dos paquetes no reutilizan la misma identidad de versión para contenidos distintos;
7. conflictos de alcance o precedencia bloquean activación;
8. la secuencia final permanece reproducible.

---

#### 40. Evidencia mínima de una futura instancia

El expediente de cierre deberá permitir reconstruir:

- `package_id`;
- identidad de instancia;
- candidate o revisión fuente;
- migraciones ejecutadas;
- objetos creados o adoptados;
- reglas y catálogos incluidos;
- IDs de versión;
- digests;
- conteos esperados y reales;
- estados;
- vigencias;
- supersesiones;
- conjuntos efectivos;
- `version_set_digest`;
- pruebas;
- seguridad;
- compatibilidad;
- rollback;
- drift final;
- riesgo residual.

La evidencia no incorpora datos sensibles innecesarios.

---

#### 41. Orden de ejecución por paquete

La secuencia lógica futura será:

```text
1. verificar gates y package_id
2. recapturar drift
3. congelar fuente versionada
4. inventariar reglas y catálogos del alcance
5. calcular identidades y digests esperados
6. definir objetos físicos autorizados por el paquete
7. preparar migración forward-only
8. ensayar almacenamiento y constraints en staging
9. materializar versiones sin activarlas
10. verificar conteos, digests e integridad
11. construir el conjunto efectivo candidato
12. validar compatibilidad y seguridad
13. activar solo con gates satisfechos
14. verificar resolución y version_set_digest
15. comprobar idempotencia de seed y reejecución
16. comprobar rollback lógico
17. recapturar drift
18. registrar evidencia y riesgo residual
```

No se salta desde la definición en código directamente a una regla `ACTIVE`.

---

#### 42. Cobertura de prueba vigente reutilizada

La cobertura canónica DATA ya protege las obligaciones de esta tarea, incluyendo:

- resolución de política por versión y coordenada;
- fail closed ante ambigüedad;
- idempotencia por misma entrada y contexto;
- versionado y rollback de cambios de clasificación;
- catálogos versionados;
- bloqueo ante dependencia ausente, retirada o incompatible;
- no reinterpretación histórica;
- contrato y autoridad de excepciones;
- diccionario cerrado y versionado;
- campos obligatorios de entrada;
- estados ejecutables y no ejecutables;
- supersesión y no retroactividad;
- procedencia;
- paridad entre capas;
- vínculo de derivaciones con fuente y versión;
- aliases activos y versionados;
- conjuntos de versiones y `version_set_digest`;
- idempotencia, concurrencia, replay y rollback;
- separación entre revisión, versión, activación y materialización.

La reutilización no modifica texto, estado, identidad ni relaciones de esos requisitos.

---

#### 43. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

**Requisitos creados:** 0
**Requisitos modificados:** 0

**Justificación:** la tarea materializa por `package_id` obligaciones de versionado, persistencia, vigencia, supersesión, procedencia, idempotencia, conjuntos efectivos, bloqueo, seguridad y rollback ya definidas y cubiertas por la arquitectura DATA-NORM, las transiciones y el registro canónico DATA. No introduce una nueva semántica empresarial, una nueva regla lingüística ni una obligación verificable independiente.

---

#### 44. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                                                                                                                                                                              |
| --------- | -------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED   | No se ejecutó el build del checkout local del usuario durante esta definición documental.                                                                                                                                                                              |
| LOCAL     | PASS           | El artefacto fue comprobado estructuralmente contra metadata, secciones obligatorias, continuidad, cero cambios de requisitos, UTF-8, LF y ausencia de whitespace final.                                                                                               |
| REMOTA    | PASS           | Se revisaron en modo read-only las fuentes canónicas de GitHub, el package `@vento/data-normalization` y el proyecto Supabase de referencia; no se evidenció almacenamiento canónico actual con las identidades de versión y diccionario requeridas por este contrato. |
| OPERATIVA | NOT_EXECUTED   | No se ejecutaron seeds, activaciones, evaluaciones, backfills, replay, rollback ni pruebas de consumidores.                                                                                                                                                            |
| FÍSICA    | NOT_APPLICABLE | Esta definición documental no autoriza DDL, DML, migraciones, funciones, triggers, cambios de datos ni configuración remota.                                                                                                                                           |

---

#### 45. Decisiones vinculantes

1. `DATA-NORM-DB-001` se define una sola vez como plantilla por paquete.
2. La identidad física futura es `DATA-NORM-DB-001::<package_id>`.
3. El gate temporal es `POST_E5_PACKAGE`.
4. No existe instancia global.
5. La unidad persistida es una versión inmutable.
6. `rule_key` y `rule_version_id` permanecen separados.
7. `content_digest` forma parte de la identidad verificable del contenido.
8. Un ID con digest distinto es conflicto.
9. No existe `latest` implícito.
10. Cada evaluación futura resuelve un conjunto efectivo explícito.
11. `version_set_digest` representa exactamente ese conjunto.
12. La ausencia de una dependencia bloquea.
13. El estado remoto observado no redefine el repositorio.
14. Drift no reconciliado bloquea.
15. El diccionario conserva su contrato completo por entrada.
16. El catálogo de conectores conserva exactamente su universo versionado.
17. Las excepciones oficiales conservan scope, autoridad, evidencia y vigencia.
18. Una carga parcial no se activa.
19. Aprobar y activar son operaciones distintas.
20. Los estados terminales no se reactivan en sitio.
21. Supersesión es aditiva.
22. La historia permanece reconstruible.
23. El bootstrap es idempotente.
24. Misma identidad y mismo digest producen no-op verificable.
25. Misma identidad y digest distinto bloquean.
26. La concurrencia no se resuelve por último escritor.
27. Una regla no se almacena mezclada con una fila empresarial.
28. Las decisiones humanas no activan ni corrigen datos automáticamente.
29. `DATA-NORM-DB-009` conserva la auditoría de valor previo y resultante.
30. `DATA-NORM-DB-002` conserva funciones SQL deterministas.
31. La persistencia física aplica mínimo privilegio.
32. No se exponen catálogos a browser por existir físicamente.
33. Evidencia sensible se referencia y minimiza.
34. Toda migración posterior es forward-only.
35. El rollback lógico no borra versiones.
36. Un paquete sin impacto semántico no crea versiones vacías.
37. Paquetes concurrentes conservan origen y baseline explícitos.
38. La materialización se ejecuta exclusivamente desde `vento-shell`.
39. La definición documental no crea objetos físicos.
40. La definición documental no modifica Supabase.
41. La definición documental no modifica datos.
42. La definición documental no modifica el registro 04A.

---

#### 46. Criterios de aceptación

`DATA-NORM-DB-001` queda documentalmente aceptable cuando:

1. conserva `TEMPLATE_PER_PACKAGE`;
2. conserva `POST_E5_PACKAGE`;
3. usa `DATA-NORM-DB-001::<package_id>`;
4. no autoriza ejecución global;
5. identifica versiones inmutables como unidad;
6. conserva las identidades de `DATA-NORM-ARC-009`;
7. conserva el contrato completo del diccionario;
8. conserva la versión cerrada de conectores;
9. conserva el contrato de excepciones;
10. diferencia aprobación de activación;
11. conserva los ocho estados unificados;
12. define vigencia explícita;
13. define supersesión sin reescritura;
14. define `resolved_version_set`;
15. define `version_set_digest`;
16. prohíbe `latest` y fallback local;
17. bloquea drift de identidad/digest;
18. define bootstrap reproducible;
19. define seed idempotente;
20. bloquea concurrencia obsoleta;
21. separa reglas de datos empresariales;
22. separa decisiones humanas de activación;
23. mantiene la frontera con `DATA-NORM-DB-002`;
24. mantiene la frontera con `DATA-NORM-DB-009`;
25. preserva mínimo privilegio;
26. minimiza evidencia sensible;
27. exige migraciones forward-only;
28. exige rollback lógico;
29. admite cierre sin versión nueva cuando el paquete no tiene impacto;
30. exige evidencia por package;
31. declara cero requisitos creados o modificados;
32. no ejecuta cambios físicos durante la aprobación documental.

---

#### 47. Límites

`DATA-NORM-DB-001` no:

- crea tablas durante esta definición;
- asigna nombres físicos de tablas no aprobados;
- asigna un schema físico no aprobado;
- crea columnas;
- crea índices;
- crea constraints;
- crea policies;
- crea grants;
- crea funciones;
- crea RPC;
- crea triggers;
- ejecuta seeds;
- activa reglas;
- suspende reglas;
- retira reglas;
- ejecuta backfills;
- corrige datos;
- materializa derivaciones;
- crea claves de búsqueda;
- crea aliases;
- crea nuevas entradas del diccionario;
- modifica las tres correcciones iniciales aprobadas;
- convierte `expresso` en corrección automática;
- cambia el catálogo de conectores;
- cambia las excepciones oficiales;
- modifica identidad o unicidad;
- fusiona registros;
- migra consumidores;
- modifica Supabase;
- modifica configuración remota;
- modifica secretos;
- modifica el registro 04A;
- desarrolla `DATA-NORM-DB-002`.

---

#### 48. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-DB-026 — Generar y publicar tipos después de cada paquete aprobado`

**TAREA ACTUAL APROBADA**
`DATA-NORM-DB-001 — Implementar almacenamiento de versiones de reglas y diccionarios`

**SIGUIENTE TAREA RESERVADA**
`DATA-NORM-DB-002 — Implementar funciones SQL deterministas cuando sean necesarias`


### ✅ DATA-NORM-DB-002 — Implementar funciones SQL deterministas cuando sean necesarias

**Estado:** APROBADA
**Tarea anterior:** DATA-NORM-DB-001 — Implementar almacenamiento de versiones de reglas y diccionarios
**Tarea siguiente:** DATA-NORM-DB-003 — Implementar columnas o expresiones normalizadas de búsqueda
**Tipo de tarea:** Documental; contrato y plantilla R2 repetible por `package_id` para decidir, diseñar, versionar y certificar funciones SQL deterministas únicamente cuando una necesidad física del paquete justifique ejecutar una primitiva dentro de PostgreSQL, preservando paridad con el servicio de dominio y sin crear funciones, migraciones, datos ni cambios remotos durante esta definición
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/04_IMPLEMENTACION_FISICA_DE_NORMALIZACION.md`
**Estado físico resultante:** Contrato canónico `TEMPLATE_PER_PACKAGE` cerrado; cada futura instancia `DATA-NORM-DB-002::<package_id>` deberá justificar individualmente si requiere cero, una o más funciones SQL y permanecerá sin ejecución física hasta satisfacer `POST_E5_PACKAGE`, reconciliar drift y recibir autorización física explícita
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Objetivo

`DATA-NORM-DB-002` define cuándo una operación de normalización puede materializarse como función SQL y cuándo debe permanecer exclusivamente en el servicio de dominio.

El objetivo no es trasladar el motor semántico de normalización a PostgreSQL. El objetivo es permitir que un paquete aprobado utilice una primitiva de base de datos únicamente cuando exista una necesidad física demostrable, la operación sea determinista bajo entradas y versiones explícitas, la paridad con `@vento/data-normalization` pueda certificarse y la función no adquiera autoridad para inventar política, contexto, catálogos, identidad, revisión o decisiones empresariales.

La ausencia de una función SQL es un resultado válido.

---

#### 2. Resultado canónico

Queda definido:

```text
DATA-NORM-DB-002
→ contrato documental único y reutilizable

DATA-NORM-DB-002::<package_id>
→ futura instancia física por paquete

necesidad física demostrada
→ clasificación de la operación
→ contrato de determinismo
→ prueba de paridad
→ decisión SQL o NO SQL
→ migración forward-only si aplica
→ evidencia por paquete
```

Una instancia podrá cerrar con cero funciones nuevas cuando la base de datos no necesite ejecutar una primitiva propia.

No se crea una función por simetría arquitectónica, conveniencia local ni existencia de un helper parecido.

---

#### 3. Topología vinculante

La topología aplicable es:

```text
mode = TEMPLATE_PER_PACKAGE
execution_gate = POST_E5_PACKAGE
instance_pattern = DATA-NORM-DB-002::<package_id>
```

Consecuencias:

1. no existe `DATA-NORM-DB-002::GLOBAL`;
2. el marcador documental se define una sola vez;
3. cada `package_id` decide su necesidad física con evidencia propia;
4. una función reutilizable creada por un paquete no autoriza su consumo por otro paquete sin compatibilidad y lineage;
5. la existencia de una función en un ambiente no prueba que pertenezca a la arquitectura objetivo;
6. ninguna ejecución física se deriva de esta aprobación documental.

---

#### 4. Gate temporal

Una futura instancia solo podrá crear, sustituir, retirar o certificar una función cuando, para el mismo `package_id`, estén satisfechas las puertas físicas aplicables.

Como mínimo:

```text
package E5 aplicable = CERRADO
E5-GATE-008::<package_id> = PASS
SHELL-CI-020::<package_id> = OPENED
drift aplicable = RECONCILED
consumidores aplicables = INVENTARIADOS
pruebas de paridad = PREPARADAS
rollback = PREPARADO
physical_authorization = EXPLICIT
```

Una función técnicamente posible pero sin estas condiciones permanece no materializada.

---

#### 5. Fuentes vinculantes

Cada futura instancia deberá consumir sin reinterpretación silenciosa:

- `DATA-NORM-DB-001` para versiones, digests, vigencia, supersesión y conjuntos efectivos;
- `DATA-NORM-ARC-001` y `DATA-NORM-ARC-002` para política por coordenada, clases, representaciones y fuentes;
- `DATA-NORM-ARC-003` a `DATA-NORM-ARC-008` para operaciones deterministas, capitalización, conectores, excepciones, diccionario, revisión y búsqueda;
- `DATA-NORM-ARC-009` para determinismo, versiones, idempotencia y reproducibilidad;
- `DATA-NORM-ARC-010` para la frontera absoluta entre comparación textual e identidad;
- `DATA-NORM-ARC-011` para autoridad entre aplicación, servicio de dominio, RPC y defensa de base;
- `DATA-NORM-ARC-012` para valores externos, mapeos y preservación de originales;
- `DATA-NORM-TRANS-*` y `SUPA-TRANS-*` aplicables al paquete;
- `@vento/data-normalization` como contrato ejecutable puro de referencia;
- el estado remoto de PostgreSQL recapturado al iniciar la instancia;
- el expediente E5 y los consumidores del `package_id`;
- la cobertura vigente del registro canónico de requisitos de prueba.

Una diferencia entre estas fuentes es drift y bloquea únicamente la función o consumidor afectado hasta resolver la autoridad propietaria.

---

#### 6. Modelo de autoridad heredado

Se conserva el modelo cerrado de cuatro capas:

| Capa                            | Autoridad                                                                                    |
| ------------------------------- | -------------------------------------------------------------------------------------------- |
| `APPLICATION_INTERACTION_LAYER` | captura, guía y previsualización; no define política ni confirma persistencia                |
| `DOMAIN_NORMALIZATION_SERVICE`  | resuelve semántica, política, versiones, catálogos y evaluación canónica                     |
| `TRANSACTIONAL_RPC_BOUNDARY`    | revalida autorización, contexto, versiones, concurrencia e idempotencia y confirma el commit |
| `DEFENSIVE_DATABASE_TRIGGER`    | protege invariantes acotados frente a bypass; no ejecuta semántica ambigua                   |

Una función SQL de `DATA-NORM-DB-002` es una herramienta de una capa, no una quinta capa.

La función no adquiere autoridad por ejecutarse dentro de la base.

---

#### 7. Regla principal de necesidad

Una función SQL determinista solo se justifica cuando existe una necesidad de ejecución dentro de PostgreSQL que no pueda satisfacerse de forma más segura manteniendo la operación en el servicio de dominio.

Son motivos admisibles, sujetos a las demás puertas:

1. una expresión física necesita una primitiva pura y reproducible;
2. una futura columna o expresión de búsqueda requiere el mismo cálculo en escritura y consulta;
3. un constraint o índice autorizado necesita una expresión inmutable compatible;
4. una RPC necesita reutilizar una primitiva pura dentro de la misma transacción;
5. una defensa de base necesita comprobar un invariante local y acotado;
6. una operación de transición requiere comparar resultados de forma reproducible sin adquirir autoridad semántica nueva.

No son motivos admisibles:

- evitar implementar el contrato en el servicio;
- reducir líneas de TypeScript;
- reutilizar un helper legacy porque ya existe;
- centralizar toda normalización en la base;
- hacer más cómodo un trigger;
- resolver permisos;
- ocultar divergencias entre consumidores;
- ejecutar una regla empresarial no versionada.

---

#### 8. Resultado `NO SQL`

La decisión de una instancia podrá ser:

```text
funciones SQL nuevas = 0
funciones SQL modificadas = 0
funciones SQL retiradas = 0
```

Ese resultado es correcto cuando:

- el servicio puede ejecutar la operación con autoridad y paridad;
- ninguna columna, índice, constraint, RPC o defensa aprobada necesita la primitiva;
- PostgreSQL no puede reproducir exactamente el algoritmo o perfil;
- la función exigiría dependencias ocultas o lecturas mutables incompatibles con su uso;
- la seguridad o exposición no justifican crear otra superficie;
- el costo de mantener paridad supera el beneficio físico.

No se crean wrappers vacíos ni funciones sin consumidor para evitar un resultado de cero.

---

#### 9. Clases de función admisibles

La futura instancia podrá clasificar una función únicamente dentro de una de estas responsabilidades:

| Responsabilidad                | Uso permitido                                                                     | Límite                                                   |
| ------------------------------ | --------------------------------------------------------------------------------- | -------------------------------------------------------- |
| primitiva pura                 | transformar argumentos explícitos sin I/O ni estado externo                       | no resolver política, catálogo, autoridad ni identidad   |
| derivación física determinista | producir una representación técnica aprobada para una expresión posterior         | no sustituir el valor fuente ni convertirse en identidad |
| helper transaccional puro      | calcular una parte reproducible consumida por una RPC                             | no autorizar, escribir ni confirmar por sí solo          |
| aserción defensiva pura        | comprobar un invariante local con entradas explícitas                             | no corregir el valor ni ejecutar workflow                |
| no admisible en esta tarea     | operación con side effects, contexto mutable o decisión semántica no reproducible | permanece en su capa propietaria                         |

Una función que escribe datos, emite eventos, cambia estados o confirma una transacción no es una función determinista de esta tarea.

---

#### 10. Operaciones deterministas candidatas

La arquitectura permite considerar como candidatas únicamente operaciones cuyo contrato pueda reducirse a entradas explícitas y versión fija.

Entre ellas:

- composición Unicode aprobada;
- recorte de separadores de borde explícitamente declarados;
- compactación de separadores internos explícitamente declarados;
- espaciado de puntuación con reglas cerradas;
- derivaciones técnicas de búsqueda cuando `DATA-NORM-DB-003` las requiera y la paridad esté certificada;
- digests o comparaciones técnicas cuyo algoritmo y serialización estén fijados.

Ser candidata no significa estar aprobada para SQL.

Cada operación deberá demostrar que PostgreSQL reproduce exactamente el contrato del package, incluida semántica de Unicode, locale, `NULL`, vacío, signos, errores, bloqueo y versión.

---

#### 11. Operaciones que permanecen en el servicio de dominio

No se trasladan a una función SQL de esta tarea las decisiones que requieren semántica o autoridad de dominio.

Permanecen en `DOMAIN_NORMALIZATION_SERVICE`:

- resolución de política por campo, entidad y dominio;
- selección de versión efectiva;
- capitalización comercial completa;
- conducta contextual de conectores;
- excepciones oficiales de marcas, siglas, unidades y nombres legales;
- diccionario ortográfico;
- aliases;
- decisión de ambigüedad;
- admisión o resolución de revisión humana;
- transliteración;
- similitud;
- ranking semántico;
- identidad, unicidad, duplicidad o sobreviviente;
- mapeos externos con autoridad empresarial.

Una función SQL no podrá consultar un catálogo mutable y declararse `IMMUTABLE` para simular estas decisiones.

---

#### 12. Capitalización comercial

`COMMERCIAL_CAPITALIZATION` no se aprueba como función SQL semántica general.

La implementación pura actual depende, entre otros contratos, de:

- política de campo;
- perfil `es-CO`;
- segmentación por grafemas;
- versionado de case mapping;
- catálogo de conectores;
- catálogo de excepciones;
- candidatos de frase;
- tokens protegidos;
- precedencia;
- ambigüedad;
- revisión.

La autoridad canónica permanece en el servicio.

Una función SQL futura solo podría participar en una primitiva interna estrictamente menor si el paquete demuestra paridad aislada y la función no decide capitalización empresarial por sí sola.

---

#### 13. Diccionario, conectores y excepciones

Queda prohibido crear una función SQL que contenga listas hardcoded como autoridad paralela para:

- conectores;
- correcciones ortográficas;
- marcas;
- siglas;
- unidades;
- nombres legales;
- aliases;
- excepciones de frase.

Los catálogos y diccionarios permanecen versionados bajo sus contratos propietarios.

Una función que lea almacenamiento de reglas no se clasifica automáticamente como `IMMUTABLE`; su volatilidad y su uso físico deberán corresponder a la dependencia real.

---

#### 14. Búsqueda y relación con `DATA-NORM-DB-003`

`DATA-NORM-DB-002` puede definir una primitiva SQL que `DATA-NORM-DB-003` consuma posteriormente, pero no crea columnas ni expresiones de búsqueda.

Cualquier primitiva de búsqueda deberá conservar:

- `SEARCH_DERIVATION` como representación no autoritativa;
- mismo algoritmo y versión para consulta y valor;
- perfil `es-CO` explícito;
- `ñ` distinta de `n`;
- signos y fronteras según contrato;
- ausencia de diccionario, capitalización y aliases implícitos;
- ausencia de efectos de identidad;
- compatibilidad con la estrategia posterior de columnas e índices.

Si PostgreSQL no puede reproducir el adapter canónico con la misma semántica, la derivación permanece en el servicio y `DATA-NORM-DB-003` deberá elegir otra estrategia material.

---

#### 15. Contrato mínimo de una función

Toda función propuesta por una instancia deberá documentar antes de crear DDL:

| Dimensión          | Obligación                                                    |
| ------------------ | ------------------------------------------------------------- |
| finalidad          | consumidor y necesidad física concreta                        |
| operación canónica | etapa exacta que implementa                                   |
| versión            | versión lógica del algoritmo                                  |
| entradas           | tipos y semántica completa                                    |
| `NULL`             | conducta explícita y diferenciada de vacío cuando corresponda |
| salida             | tipo y semántica                                              |
| bloqueo            | error o resultado cerrado cuando no puede evaluar             |
| dependencias       | todas explícitas y clasificadas                               |
| volatilidad        | `IMMUTABLE`, `STABLE` o `VOLATILE` con justificación          |
| seguridad          | invoker o definer con justificación                           |
| `search_path`      | conducta segura y referencias calificadas                     |
| privilegios        | roles con `EXECUTE` y roles excluidos                         |
| exposición         | interna o invocable por Data API de forma intencional         |
| idempotencia       | propiedad verificable                                         |
| paridad            | corpus contra el contrato de referencia                       |
| rendimiento        | costo esperado y uso en plan                                  |
| consumidores       | columnas, índices, RPC, jobs o defensas que dependen de ella  |
| compatibilidad     | coexistencia con versión anterior                             |
| rollback           | reversión lógica y física                                     |
| procedencia        | migración, revisión fuente y digest                           |

Una propuesta incompleta no crea DDL.

---

#### 16. Volatilidad PostgreSQL

La clasificación de volatilidad es una promesa al optimizador y deberá reflejar el comportamiento real.

##### `IMMUTABLE`

Solo se permite cuando:

1. mismos argumentos producen el mismo resultado de forma permanente bajo el contrato de versión;
2. no existe lectura de tablas mutables;
3. no existe dependencia de usuario, sesión, hora, secuencia, aleatoriedad o configuración no fijada;
4. no existe locale o collation implícita capaz de cambiar el resultado;
5. no existen side effects;
6. todas las funciones llamadas satisfacen una clasificación compatible;
7. el corpus prueba repetibilidad y paridad.

No se marca una función `IMMUTABLE` para habilitar un índice o columna generada si la semántica real no lo permite.

##### `STABLE`

Una función que consulta estado de base o depende de un snapshot puede ser `STABLE` cuando su contrato lo autorice, pero no se trata como una primitiva inmutable.

No se utiliza como sustituto de una función `IMMUTABLE` en una expresión física que exija inmutabilidad.

##### `VOLATILE`

Una función que puede cambiar por llamada o realizar efectos pertenece a otro tipo de responsabilidad. No se presenta como normalizador determinista de `DATA-NORM-DB-002`.

---

#### 17. Índices y columnas generadas

Una función usada posteriormente en una expresión de índice o columna generada deberá ser verdaderamente inmutable.

Por tanto:

- no puede consultar tablas de reglas activas;
- no puede seleccionar `latest`;
- no puede depender de hora actual;
- no puede depender de configuración de sesión;
- no puede resolver permisos;
- no puede depender de un catálogo que cambie sin formar parte explícita de los argumentos o de una versión física inmóvil;
- no puede cambiar semántica bajo el mismo nombre y firma mientras existan valores o índices construidos con la definición anterior.

La selección concreta de columnas pertenece a `DATA-NORM-DB-003`.

La selección y construcción concreta de índices pertenece a `DATA-NORM-DB-007`.

---

#### 18. `NULL`, vacío y ausencia

`NULL`, cadena vacía y cadena compuesta solo por separadores no se consideran equivalentes por defecto.

Cada función deberá declarar una de estas conductas de forma contractual:

- preservar `NULL`;
- rechazar `NULL`;
- producir `NULL` mediante semántica `STRICT` cuando corresponda;
- transformar un string no nulo bajo reglas explícitas.

Queda prohibido aplicar `coalesce(value, '')` como regla universal de normalización.

Un fallback textual predeterminado tampoco forma parte de una primitiva genérica salvo contrato empresarial propietario.

---

#### 19. Unicode, locale y collation

No se utilizará el locale, collation o versión Unicode del ambiente como dependencia implícita de una función canónica.

Toda operación sensible a Unicode deberá:

1. identificar el perfil esperado;
2. identificar la versión o capacidad que afecta el resultado;
3. comparar PostgreSQL contra el adapter canónico;
4. cubrir texto precompuesto y descompuesto;
5. cubrir tildes, diéresis y `ñ`;
6. cubrir grafemas sin caja;
7. cubrir signos y compuestos;
8. bloquear o permanecer fuera de SQL si no puede demostrar paridad.

El hecho de que PostgreSQL ofrezca `lower`, expresiones regulares o normalización Unicode no demuestra equivalencia con el contrato Vento.

---

#### 20. Regex y separadores

Una expresión regular no se convierte en política empresarial por estar dentro de una función `IMMUTABLE`.

Cada función basada en regex deberá fijar:

- universo de caracteres;
- tokens o separadores;
- flags;
- comportamiento de borde;
- comportamiento sobre Unicode;
- casos vacíos;
- corpus positivo;
- corpus negativo;
- complejidad esperada.

No se usa `\s+`, eliminación genérica de no alfanuméricos o unaccent como sustituto de una política explícita sin demostrar que el contrato de la operación lo autoriza.

---

#### 21. Seguridad invoker

`SECURITY INVOKER` es la opción predeterminada.

Una primitiva pura de normalización no requiere privilegios del creador.

Reglas:

1. no se usa `SECURITY DEFINER` para resolver un error de permisos;
2. una función invoker no obtiene acceso adicional a tablas por existir;
3. las dependencias semánticamente relevantes se califican por schema cuando una resolución ambigua pueda cambiar comportamiento;
4. el package registra quién necesita `EXECUTE`;
5. una función interna no se publica accidentalmente como API.

---

#### 22. Excepción `SECURITY DEFINER`

`SECURITY DEFINER` solo puede considerarse fuera del caso normal cuando una responsabilidad propietaria exige privilegios elevados y existe una justificación de seguridad explícita.

Si una función futura lo requiere, deberá:

1. demostrar por qué invoker es insuficiente;
2. usar un `search_path` seguro, preferiblemente vacío, con referencias totalmente calificadas;
3. validar actor, finalidad y contexto cuando corresponda;
4. revocar `EXECUTE` de `PUBLIC` y de roles no autorizados;
5. conceder únicamente los roles mínimos;
6. evitar ubicarse como endpoint privilegiado en un schema expuesto sin decisión explícita;
7. incluir pruebas negativas de acceso;
8. pasar revisión de seguridad y advisors después de materializarse.

Una función definer nunca se clasifica como segura únicamente porque su cuerpo sea corto.

---

#### 23. Privilegios de ejecución

Toda función materializada deberá declarar explícitamente el modelo de `EXECUTE`.

El package deberá comprobar:

- privilegio heredado de `PUBLIC`;
- acceso de `anon`;
- acceso de `authenticated`;
- acceso de roles internos;
- acceso de service credentials;
- exposición a Data API;
- alcance del schema;
- posibilidad de enumeración o invocación no prevista.

El estado por defecto de PostgreSQL o del proyecto no sustituye esta decisión.

RLS sobre tablas no controla por sí sola quién puede ejecutar una función.

---

#### 24. `search_path` y resolución de objetos

Una función no dependerá de un `search_path` amplio para resolver objetos semánticamente importantes.

Reglas:

1. referencias a relaciones y funciones propietarias deben ser inequívocas;
2. una función privilegiada usará `search_path` seguro;
3. no se permite que un objeto creado en otro schema cambie la función resuelta;
4. extensiones y operadores relevantes deberán quedar bajo un contrato estable;
5. un cambio de schema no se oculta mediante resolución implícita;
6. la evidencia de la instancia registra el `search_path` efectivo.

---

#### 25. Identidad y versionado de función

Una función SQL con semántica canónica deberá tener identidad versionable.

La instancia deberá conservar:

- operación;
- versión lógica;
- firma;
- definición efectiva;
- digest de definición;
- migración que la creó;
- consumidores;
- versión anterior compatible;
- estado de coexistencia;
- fecha de activación;
- condición de retiro.

`CREATE OR REPLACE FUNCTION` no autoriza cambiar silenciosamente la semántica bajo una identidad que ya alimentó datos, columnas o índices.

Un cambio semántico deberá producir una transición explícita y, cuando sea necesario para coexistencia, una nueva identidad física compatible con el contrato de versión.

---

#### 26. Paridad con `@vento/data-normalization`

Antes de activar una función que reproduzca una operación del package puro, deberá ejecutarse el mismo corpus contra ambas implementaciones.

La paridad mínima compara:

- valor de entrada;
- valor resultante;
- cambio o no cambio;
- bloqueo;
- motivo de bloqueo;
- versión;
- `NULL`;
- vacío;
- Unicode;
- signos;
- límites;
- casos ya canónicos;
- aplicación repetida;
- error determinista.

Una discrepancia bloquea la función SQL.

No se resuelve una discrepancia modificando el corpus para aceptar ambos resultados.

---

#### 27. Idempotencia

Toda primitiva determinista deberá satisfacer, cuando su operación sea idempotente por contrato:

```text
f(f(value, policy), policy) = f(value, policy)
```

Si la función recibe más parámetros, todos forman parte del contexto de igualdad.

La prueba deberá cubrir también:

- resultado ya canónico;
- borde vacío;
- caracteres protegidos;
- versión incompatible;
- inputs adversariales;
- ejecución repetida.

La idempotencia no sustituye la paridad semántica.

---

#### 28. Fail closed

La función deberá bloquear o fallar de forma distinguible cuando no pueda cumplir su contrato.

No se permiten:

- fallback a helper legacy;
- selección de versión disponible;
- inferencia de locale;
- inferencia de política;
- reparación silenciosa;
- forma aproximada;
- sustitución por el primer resultado;
- eliminación de caracteres para evitar un error.

El consumidor deberá poder distinguir ausencia de cambio, input inválido, dependencia incompatible y fallo técnico cuando esas diferencias sean materiales.

---

#### 29. Side effects y observabilidad

Una primitiva `IMMUTABLE` o `STABLE` no escribe auditoría, métricas, eventos ni datos como efecto colateral.

La auditoría raíz de una mutación pertenece a la RPC y a `DATA-NORM-DB-009`.

Por tanto:

- una función pura retorna resultado;
- la capa propietaria registra la decisión;
- los errores no se convierten en inserts de logging desde la función;
- el monitoreo usa la capa ejecutora sin romper volatilidad;
- un helper puro no llama red ni servicios externos.

---

#### 30. Rendimiento

Toda función candidata deberá probar rendimiento proporcional a su uso.

Si se invoca por fila, índice, columna generada o trigger, deberá demostrar:

- costo acotado;
- ausencia de scans globales;
- ausencia de consultas N+1;
- ausencia de regex patológica;
- ausencia de red;
- ausencia de espera de workflow;
- estabilidad bajo cardinalidad representativa;
- efecto medido sobre escritura cuando participa en una expresión persistida.

Una función semánticamente correcta pero operacionalmente inviable no se activa.

---

#### 31. Baseline legacy observado

El corte read-only del proyecto de referencia evidencia helpers de normalización o derivación ya existentes.

| Helper observado                                  | Clasificación inicial                                                  | Decisión de esta tarea                                                                                     |
| ------------------------------------------------- | ---------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| `public._vento_norm(text)`                        | legacy `IMMUTABLE`; recorta, convierte `NULL` a vacío y compacta `\s+` | no adoptar como normalizador canónico transversal sin mapear semántica, `NULL`, separadores y consumidores |
| `public._vento_slugify(text)`                     | legacy `IMMUTABLE`; lower y sustitución de no alfanuméricos por `-`    | tratar como helper técnico legacy; no equivale a normalización mostrada ni `SEARCH_FORM_KEY`               |
| `public._navigation_slugify(text)`                | legacy `IMMUTABLE`; translitera tildes y convierte `ñ` a `n`           | incompatible con la preservación canónica de `ñ` para búsqueda; no reutilizar como representación canónica |
| `pass.normalize_commercial_category_code(text)`   | helper de dominio que delega a `_vento_slugify` y aplica fallback      | mantener bajo contrato del dominio hasta inventario y transición; no promover a primitiva transversal      |
| `pass.normalize_commercial_collection_code(text)` | helper de dominio que delega a `_vento_slugify` y aplica fallback      | mantener bajo contrato del dominio hasta inventario y transición; no promover a primitiva transversal      |

Este baseline no declara esos helpers obsoletos ni autoriza retirarlos.

Cada consumidor deberá mapearse antes de coexistencia, sustitución o retiro.

---

#### 32. Regla de no adopción por similitud

Dos helpers con nombres o resultados parecidos no son equivalentes.

Antes de reutilizar un helper existente, la instancia deberá comparar:

- entradas;
- `NULL`;
- vacío;
- Unicode;
- tildes;
- `ñ`;
- signos;
- separadores;
- casing;
- locale;
- versión;
- side effects;
- volatilidad;
- consumidores;
- uso en índices;
- uso en URLs o códigos;
- compatibilidad histórica.

Una diferencia material impide tratar el cambio como refactor neutral.

---

#### 33. Funciones usadas por RPC

Una RPC puede consumir una primitiva determinista de esta tarea, pero la primitiva no hereda autoridad transaccional.

La RPC continúa siendo responsable de:

- autenticación y autorización;
- resolución de actor;
- finalidad;
- expectativa de fuente;
- `version_set_digest`;
- estado esperado;
- idempotency key;
- revalidación;
- persistencia;
- auditoría raíz;
- commit.

La función pura recibe únicamente las entradas necesarias para su cálculo.

---

#### 34. Funciones usadas por triggers

`DATA-NORM-DB-008` conserva la responsabilidad sobre triggers.

Una función pura reutilizada por un trigger deberá permanecer:

- local;
- acotada;
- sin red;
- sin scans globales;
- sin fuzzy matching;
- sin revisión humana;
- sin selección de registro;
- sin propagación;
- sin corrección semántica ambigua.

El trigger no convierte una función pura en autoridad del dominio.

---

#### 35. Funciones usadas por índices

`DATA-NORM-DB-007` conserva la responsabilidad sobre índices.

Antes de construir un índice sobre una función deberá demostrarse:

1. inmutabilidad real;
2. paridad de función;
3. versión fijada;
4. compatibilidad con datos existentes;
5. estrategia ante cambio de algoritmo;
6. necesidad de reindex o nueva expresión;
7. plan de rollback;
8. medición de lectura y escritura.

No se etiqueta `IMMUTABLE` para satisfacer sintaxis.

---

#### 36. Transición de una función

Cuando una versión nueva cambie semántica:

```text
versión anterior
→ permanece identificable
→ consumidor candidato usa nueva versión en staging
→ corpus de paridad y diferencia
→ migración de consumidores
→ columnas o índices derivados se reconstruyen cuando corresponda
→ cutover explícito
→ observación
→ retiro posterior
```

No se sobrescribe una definición histórica y se asume que índices, columnas o valores almacenados se actualizaron por sí solos.

---

#### 37. Migraciones forward-only

Toda función física Vento deberá crearse y evolucionar mediante migraciones versionadas desde `vento-shell`.

Queda prohibido:

- crear la función manualmente como estado final remoto;
- editar una migración aplicada;
- cambiar semántica en producción sin fuente versionada;
- corregir drift aceptando automáticamente el remoto;
- borrar una función histórica antes de inventariar consumidores;
- retirar un helper porque su nombre parece redundante.

Una corrección crea una nueva migración y deja evidencia de transición.

---

#### 38. Drift de funciones

La instancia deberá comparar repositorio y remoto para detectar:

- función en repo ausente en remoto;
- función remota sin migración propietaria;
- misma firma con definición diferente;
- misma versión con digest diferente;
- volatilidad distinta;
- seguridad distinta;
- `search_path` distinto;
- privilegios distintos;
- owner distinto;
- dependencias distintas;
- consumidor apuntando a versión inesperada.

Un drift de definición o seguridad bloquea activación hasta reconciliarlo.

---

#### 39. Readiness de creación

Una función está lista para crearse únicamente cuando:

```text
necesidad física demostrada
AND consumidor identificado
AND operación propietaria identificada
AND contrato completo
AND determinismo demostrado
AND volatilidad correcta
AND semántica NULL resuelta
AND Unicode/locale resuelto
AND seguridad resuelta
AND privilegios resueltos
AND paridad preparada
AND rendimiento preparado
AND compatibilidad preparada
AND rollback preparado
AND drift reconciliado
```

Si falta una condición, el resultado es `NO SQL` o función no materializada.

---

#### 40. Readiness de activación

Crear una función no significa habilitar su consumo.

La activación requiere:

```text
migración aplicada
AND definición/digest verificados
AND grants verificados
AND paridad PASS
AND corpus negativo PASS
AND rendimiento aceptable
AND consumidores adaptados
AND coexistencia resuelta
AND rollback disponible
AND gate del package satisfecho
```

Una función instalada pero no certificada no se usa como dependencia canónica.

---

#### 41. Orden de ejecución por paquete

La futura instancia seguirá:

```text
1. verificar package y gates
2. recapturar funciones remotas
3. inventariar consumidores
4. clasificar necesidad SQL o NO SQL
5. aislar la operación exacta
6. fijar versión y contrato
7. resolver NULL, Unicode y locale
8. demostrar volatilidad
9. resolver seguridad, search_path y EXECUTE
10. preparar corpus de paridad
11. preparar migración forward-only
12. crear en ambiente de staging
13. comparar definición y digest
14. ejecutar corpus TypeScript vs SQL
15. ejecutar casos negativos e idempotencia
16. medir costo
17. adaptar consumidor autorizado
18. comprobar coexistencia
19. comprobar rollback
20. recapturar drift
21. registrar evidencia y riesgo residual
```

No se pasa de un helper observado a uso canónico sin estos pasos.

---

#### 42. Cobertura de prueba vigente reutilizada

La cobertura canónica existente ya protege las obligaciones de esta tarea, en particular:

- `TREQ-DATA-124` para paridad de algoritmo, locale y versión y prohibición de fallback legacy;
- `TREQ-DATA-126` para `SEARCH_FORM_KEY` y preservación de `ñ`, signos y fronteras;
- `TREQ-DATA-157` para expectativas de fuente, estado y `version_set_digest`;
- `TREQ-DATA-158` para excluir locale, tiempo, orden, caché y configuración implícitos;
- `TREQ-DATA-163` para correlación y paridad entre capas;
- `TREQ-DATA-199` para conjunto fijo de versiones sin `latest`;
- `TREQ-DATA-200` para idempotencia y conflicto de payload;
- `TREQ-DATA-203` para colocación de normalización determinista entre servicio, RPC y base;
- `TREQ-DATA-204` para mantener capitalización, catálogos y diccionario bajo autoridad del servicio;
- `TREQ-DATA-210` para fallos cerrados sin fallback;
- `TREQ-DATA-211` para privilegio mínimo y funciones privilegiadas;
- `TREQ-DATA-212` para costo acotado de mecanismos de base;
- `TREQ-DATA-213` para inventario y transición de helpers legacy.

La reutilización no cambia texto, identidad, estado ni relaciones de esos requisitos.

---

#### 43. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

**Requisitos creados:** 0
**Requisitos modificados:** 0

**Justificación:** esta tarea materializa como plantilla física obligaciones de determinismo, colocación por capas, paridad, volatilidad, seguridad, idempotencia, compatibilidad y transición que ya están protegidas por la arquitectura DATA-NORM y el registro canónico DATA. No introduce una nueva regla lingüística, una nueva semántica empresarial ni un comportamiento de búsqueda independiente.

---

#### 44. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                                                                                                                                      |
| --------- | -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| BUILD     | NOT_EXECUTED   | La batería npm del checkout completo no pudo ejecutarse en este entorno de preparación porque no existe un checkout integral accesible desde el runtime; no se declara build como aprobado.                                    |
| LOCAL     | PASS           | El artefacto fue comprobado contra formato canónico, metadata obligatoria, secciones, continuidad, cero TREQ en la sección de cambios, UTF-8, LF, ausencia de BOM, whitespace final, placeholders y contenido prohibido.       |
| REMOTA    | PASS           | Se verificaron `main`, continuidad, topología, owner, políticas y scripts vigentes por GitHub; además se inspeccionó read-only el proyecto Supabase de referencia y las funciones legacy relacionadas. La revisión remota no produjo DDL ni DML. |
| OPERATIVA | NOT_EXECUTED   | No se ejecutaron consumidores, corpus TypeScript-vs-SQL, benchmarks, cutover, coexistencia ni rollback porque esta tarea no materializa funciones.                                                                             |
| FÍSICA    | NOT_APPLICABLE | Esta definición documental no autoriza crear, cambiar, retirar ni desplegar funciones SQL, migraciones, grants, datos o configuración remota.                                                                                  |

---

#### 45. Decisiones vinculantes

1. `DATA-NORM-DB-002` se define una sola vez como plantilla por paquete.
2. La identidad futura es `DATA-NORM-DB-002::<package_id>`.
3. El gate temporal es `POST_E5_PACKAGE`.
4. La ausencia de funciones SQL es un resultado válido.
5. Ningún package crea funciones por obligación ritual.
6. SQL no se convierte en segunda autoridad semántica.
7. El servicio de dominio conserva política, catálogos, diccionario, aliases y ambigüedad.
8. Una función SQL solo implementa una responsabilidad acotada.
9. Capitalización comercial completa permanece fuera de SQL.
10. Una función que consulta estado mutable no se declara `IMMUTABLE`.
11. Una función se marca `IMMUTABLE` únicamente cuando la promesa es verdadera.
12. `STABLE` no se trata como sustituto de inmutabilidad.
13. Una función con side effects no es normalizador determinista de esta tarea.
14. Índices y columnas generadas solo consumen funciones realmente inmutables.
15. `NULL` y vacío permanecen distintos salvo contrato explícito.
16. `coalesce(value, '')` no es regla genérica.
17. Locale, collation y Unicode no se consumen implícitamente.
18. Regex no sustituye política empresarial.
19. `SECURITY INVOKER` es la opción predeterminada.
20. `SECURITY DEFINER` requiere justificación y controles reforzados.
21. `EXECUTE` se gobierna explícitamente.
22. RLS de tablas no sustituye permisos de función.
23. `search_path` no puede cambiar la semántica resuelta.
24. La identidad y versión de función permanecen trazables.
25. `CREATE OR REPLACE FUNCTION` no permite cambiar semántica silenciosamente.
26. Toda función equivalente a una operación del package puro requiere paridad.
27. Una discrepancia TypeScript-vs-SQL bloquea activación.
28. Las primitivas idempotentes deben demostrar idempotencia.
29. Los fallos se cierran sin fallback.
30. Las funciones puras no escriben auditoría como side effect.
31. El costo por fila debe ser acotado.
32. `_vento_norm` permanece legacy hasta análisis de semántica y consumidores.
33. `_vento_slugify` no es una representación canónica general.
34. `_navigation_slugify` no puede representar `SEARCH_FORM_KEY` porque colapsa `ñ` a `n`.
35. Los helpers PASS observados permanecen bajo su contrato de dominio.
36. Ningún helper se adopta por similitud.
37. La RPC conserva autorización, revalidación, persistencia y commit.
38. `DATA-NORM-DB-003` conserva columnas y expresiones de búsqueda.
39. `DATA-NORM-DB-007` conserva índices.
40. `DATA-NORM-DB-008` conserva triggers.
41. `DATA-NORM-DB-009` conserva auditoría de valor previo, resultado y versión.
42. Toda función física se gobierna mediante migración forward-only desde `vento-shell`.
43. Drift de definición o seguridad bloquea activación.
44. La definición documental no crea funciones.
45. La definición documental no modifica Supabase.
46. La definición documental no modifica datos.
47. La definición documental no modifica 04A.

---

#### 46. Criterios de aceptación

`DATA-NORM-DB-002` queda documentalmente aceptable cuando:

1. conserva `TEMPLATE_PER_PACKAGE`;
2. conserva `POST_E5_PACKAGE`;
3. usa `DATA-NORM-DB-002::<package_id>`;
4. admite una instancia con cero funciones;
5. define la puerta de necesidad SQL;
6. separa primitivas de decisiones semánticas;
7. conserva la autoridad del servicio;
8. excluye capitalización, diccionario, conectores y excepciones como autoridad SQL;
9. mantiene búsqueda subordinada a `DATA-NORM-DB-003`;
10. define contrato mínimo de función;
11. define volatilidad correcta;
12. impide falsos `IMMUTABLE`;
13. protege índices y columnas generadas;
14. define semántica `NULL`;
15. define Unicode, locale y collation explícitos;
16. gobierna regex y separadores;
17. usa invoker como default;
18. limita definer;
19. gobierna `EXECUTE`;
20. gobierna `search_path`;
21. versiona la identidad de función;
22. prohíbe cambio semántico silencioso;
23. exige paridad con el package puro;
24. exige idempotencia cuando aplica;
25. exige fail closed;
26. separa observabilidad de side effects;
27. exige costo acotado;
28. clasifica los helpers legacy observados sin adoptarlos;
29. prohíbe adopción por similitud;
30. mantiene las fronteras con RPC, triggers e índices;
31. define transición, rollback y drift;
32. define readiness de creación y activación;
33. declara cero requisitos creados o modificados;
34. no ejecuta cambios físicos durante la aprobación documental.

---

#### 47. Límites

`DATA-NORM-DB-002` no:

- crea funciones SQL durante esta definición;
- asigna nombres físicos nuevos a funciones;
- asigna un schema físico nuevo;
- crea migraciones;
- crea columnas;
- crea expresiones persistidas;
- crea índices;
- crea constraints;
- crea triggers;
- crea RPC;
- crea policies;
- crea grants;
- modifica privilegios;
- cambia `search_path` remoto;
- corrige datos;
- ejecuta backfills;
- crea claves de búsqueda;
- activa reglas;
- cambia catálogos;
- cambia diccionario;
- crea aliases;
- resuelve ambigüedad;
- cambia identidad o unicidad;
- fusiona registros;
- retira helpers legacy;
- adapta consumidores;
- ejecuta cutover;
- modifica Supabase;
- modifica secretos;
- modifica 04A;
- desarrolla `DATA-NORM-DB-003`.

---

#### 48. Continuidad

**ÚLTIMA TAREA APROBADA**
`DATA-NORM-DB-001 — Implementar almacenamiento de versiones de reglas y diccionarios`

**TAREA ACTUAL APROBADA**
`DATA-NORM-DB-002 — Implementar funciones SQL deterministas cuando sean necesarias`

**SIGUIENTE TAREA RESERVADA**
`DATA-NORM-DB-003 — Implementar columnas o expresiones normalizadas de búsqueda`


### ✅ DATA-NORM-DB-003 — Implementar columnas o expresiones normalizadas de búsqueda

**Estado:** APROBADA
**Tarea anterior:** DATA-NORM-DB-002 — Implementar funciones SQL deterministas cuando sean necesarias
**Tarea siguiente:** DATA-NORM-DB-004 — Ejecutar dry-runs y reportes de colisiones
**Tipo de tarea:** Documental; contrato y plantilla R2 repetible por `package_id` para decidir, diseñar y materializar representaciones físicas derivadas de búsqueda únicamente cuando un campo, perfil y consumidor aprobados lo requieran, preservando paridad con `@vento/data-normalization`, versionado, procedencia, frescura, mínimo privilegio y rollback, sin crear columnas, expresiones, migraciones, índices, funciones, triggers, datos ni cambios remotos durante esta definición
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/04_IMPLEMENTACION_FISICA_DE_NORMALIZACION.md`
**Estado físico resultante:** ESPECIFICADO_NO_MATERIALIZADO; contrato canónico `TEMPLATE_PER_PACKAGE` cerrado para futuras instancias `DATA-NORM-DB-003::<package_id>`, condicionadas a `POST_E5_PACKAGE`, reconciliación de drift, paquete aprobado y autorización física explícita
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Objetivo

`DATA-NORM-DB-003` define cómo un paquete aprobado decide si necesita una representación física derivada para búsqueda y, cuando la necesita, qué modalidad puede usar sin convertir una clave de búsqueda en dato empresarial, identidad, regla semántica ni fuente de verdad.

La futura materialización deberá resolver de forma explícita:

1. qué campo y representación de origen se derivan;
2. qué perfil de búsqueda gobierna el campo;
3. qué representación de búsqueda se necesita;
4. qué algoritmo, locale y versiones producen la derivación;
5. si la derivación puede calcularse de forma pura e inmutable dentro de PostgreSQL;
6. si debe almacenarse como resultado materializado calculado por el servicio;
7. cómo se vincula con la versión o hash del valor fuente;
8. cómo se detecta una derivación huérfana, obsoleta o incompatible;
9. cómo consulta el consumidor usando exactamente el mismo contrato;
10. qué condiciones deben cumplirse antes de que un índice posterior pueda consumirla;
11. cómo se migra y compara contra helpers o índices legacy;
12. cómo se revierte el uso sin reinterpretar historia ni alterar el valor fuente.

La tarea no crea todavía ninguna representación física.

---

#### 2. Resultado canónico

Queda definido:

```text
DATA-NORM-DB-003
→ contrato documental único y reutilizable

DATA-NORM-DB-003::<package_id>
→ futura instancia física por paquete

campo y perfil aprobados
→ necesidad de búsqueda demostrada
→ representación canónica seleccionada
→ estrategia física clasificada
→ derivación versionada
→ vínculo con fuente
→ paridad query/valor
→ verificación de frescura
→ handoff indexable a DATA-NORM-DB-007 cuando corresponda
```

Una representación física es una proyección derivada. Nunca sustituye el valor fuente ni la representación mostrada.

---

#### 3. Topología vinculante

La topología aplicable es:

```text
mode = TEMPLATE_PER_PACKAGE
execution_gate = POST_E5_PACKAGE
instance_pattern = DATA-NORM-DB-003::<package_id>
```

Consecuencias:

1. no existe `DATA-NORM-DB-003::GLOBAL`;
2. una aprobación documental no crea columnas ni expresiones;
3. cada paquete materializa únicamente representaciones de su alcance;
4. una representación reusable no autoriza modificar campos de otro paquete;
5. cada instancia conserva fuente, algoritmo, consumidores, backfill, pruebas y rollback propios;
6. el marcador global no se reabre para registrar cada ejecución física.

---

#### 4. Gate temporal

Una futura instancia solo podrá materializarse cuando el mismo `package_id` haya satisfecho las puertas R2 aplicables.

Como mínimo deberá demostrarse:

```text
R0 aplicable = VERIFIED
R1 aplicable = VERIFIED
DELIV-PKG aplicable = CLOSED
E5-GATE-008::<package_id> = PASS
SHELL-CI-020::<package_id> = OPENED
drift aplicable = RECONCILED
physical_authorization = EXPLICIT
```

Además, la instancia deberá tener resueltos el campo, perfil, algoritmo, representación, consumidores y estrategia de compatibilidad que justifican la materialización.

---

#### 5. Fuentes vinculantes

Cada futura instancia deberá consumir sin reinterpretación silenciosa:

- `DATA-NORM-ARC-001` para coordenada de política;
- `DATA-NORM-ARC-002` para clase semántica y roles de representación y fuente;
- `DATA-NORM-ARC-007` para decisiones humanas y revisión;
- `DATA-NORM-ARC-008` para las representaciones y el pipeline de búsqueda;
- `DATA-NORM-ARC-009` para versiones, procedencia, `resolved_version_set`, `version_set_digest`, idempotencia y auditoría;
- `DATA-NORM-ARC-010` para mantener búsqueda separada de identidad, unicidad, selección y fusión;
- `DATA-NORM-ARC-011` para colocación entre aplicación, servicio, RPC y defensa de base;
- `DATA-NORM-ARC-012` para valores externos y preservación de originales;
- `DATA-NORM-DB-001` para almacenamiento de versiones de reglas y catálogos;
- `DATA-NORM-DB-002` para primitivas SQL deterministas cuando realmente existan;
- `DATA-NORM-DB-007` como propietario posterior de índices;
- `DATA-NORM-DB-008` como propietario posterior de triggers;
- `DATA-NORM-DB-009` como propietario posterior de auditoría operacional;
- `@vento/data-normalization` como contrato ejecutable compartido;
- las migraciones, package y expediente E5 del `package_id`;
- los consumidores registrados aplicables;
- el estado remoto recapturado al iniciar la instancia;
- la cobertura canónica de pruebas vigente.

---

#### 6. Contrato de búsqueda heredado

El contrato vigente de búsqueda expone siete representaciones lógicas:

```text
SEARCH_FORM_KEY
SEARCH_ACCENT_KEY
SEARCH_TOKEN_STREAM
SEARCH_APPROVED_ALIAS_SET
SEARCH_TRANSLITERATION_KEY
SEARCH_STRUCTURED_COMPONENT_SET
SEARCH_FREE_TEXT_TERMS
```

Y seis perfiles:

```text
STRICT_TECHNICAL_LOOKUP
STANDARD_COMMERCIAL_NAME
OFFICIAL_FORM_LOOKUP
STRUCTURED_PRESENTATION_LOOKUP
FREE_TEXT_DISCOVERY
RESTRICTED_HUMAN_OR_LOCATION
```

La existencia de una representación en el vocabulario no obliga a persistirla.

La decisión física depende del campo, perfil, volumen, patrón de consulta, necesidad de indexación, costo de derivación, seguridad, versionado y compatibilidad.

---

#### 7. Regla de necesidad física

Una representación se materializa únicamente si existe una necesidad verificable.

La instancia deberá clasificar cada candidata como:

```text
QUERY_TIME_ONLY
GENERATED_STORED
MATERIALIZED_STORED
RELATIONAL_DERIVATION
NOT_APPLICABLE
BLOCKED
```

Criterios mínimos:

- `QUERY_TIME_ONLY`: derivación barata y compatible con el plan de consulta sin persistencia;
- `GENERATED_STORED`: expresión row-local, pura, inmutable y exacta respecto del contrato;
- `MATERIALIZED_STORED`: resultado persistido porque depende de lógica o versiones que no pueden representarse de forma segura como generated expression;
- `RELATIONAL_DERIVATION`: representación multivaluada o estructurada que no debe comprimirse en una columna escalar;
- `NOT_APPLICABLE`: el perfil no requiere esa representación;
- `BLOCKED`: faltan contrato, versión, paridad, seguridad o compatibilidad.

No se crea una columna por anticipación.

---

#### 8. Fuente, mostrado y derivado

La persistencia deberá mantener separados:

```text
SOURCE_VALUE
DISPLAY_VALUE
SEARCH_DERIVATION
```

Reglas:

1. una clave derivada no sobrescribe el valor fuente;
2. una clave derivada no se muestra como contenido empresarial;
3. una derivación no se convierte en evidencia de identidad;
4. una derivación no corrige el valor de origen;
5. la pérdida de una derivación no autoriza reconstruir el fuente desde ella;
6. originales, snapshots y evidencia conservan sus propias derivaciones cuando corresponda;
7. una derivación histórica no se resincroniza con el valor actual.

---

#### 9. Coordenada física mínima

Toda representación física deberá poder atribuirse como mínimo a:

- entidad o registro estable;
- dominio;
- entidad propietaria;
- campo semántico;
- representación de origen;
- rol de fuente;
- clase semántica;
- perfil de búsqueda;
- locale;
- algoritmo;
- versión de algoritmo;
- versión o hash del valor fuente;
- `version_set_digest`;
- estado de vigencia;
- package de origen.

Si la estrategia física no puede conservar esta atribución de forma directa o reconstruible, no puede declararse canónica.

---

#### 10. `SEARCH_FORM_KEY`

`SEARCH_FORM_KEY` solo puede representar la derivación aprobada por el contrato vigente.

Para `es-CO`, la derivación deberá conservar las reglas exactas del adapter canónico:

- composición NFC;
- casefold del perfil;
- recorte de borde únicamente cuando el campo lo autorice;
- compactación de espacios ASCII internos únicamente cuando el campo lo autorice;
- conservación de tildes;
- conservación de `ñ`;
- conservación de signos y fronteras significativas;
- ausencia de diccionario;
- ausencia de capitalización empresarial;
- ausencia de aliases;
- ausencia de corrección ortográfica;
- ausencia de similitud.

Una función de slug no es `SEARCH_FORM_KEY`.

---

#### 11. `SEARCH_ACCENT_KEY`

`SEARCH_ACCENT_KEY` es una derivación de recuperación tolerante, no una forma canónica del dato.

Para `es-CO` deberá:

1. partir del mismo `SEARCH_FORM_KEY` compatible;
2. plegar únicamente los acentos autorizados por el perfil;
3. plegar diéresis solo cuando la política lo permita;
4. preservar `ñ` frente a `n`;
5. preservar otros diacríticos y alfabetos fuera del contrato;
6. conservar signos y fronteras;
7. servir solo para matching;
8. no modificar el valor mostrado;
9. no definir identidad ni unicidad.

Una función genérica de transliteración o `unaccent` no se adopta por similitud.

---

#### 12. `SEARCH_TOKEN_STREAM`

`SEARCH_TOKEN_STREAM` no se modela por defecto como una columna escalar generada.

Cuando un paquete demuestre necesidad de persistirlo deberá conservar:

- cada token;
- clase de token;
- fronteras;
- orden;
- signos y separadores requeridos;
- versión del tokenizer;
- locale;
- hash o versión de fuente;
- perfil;
- `version_set_digest`.

La estrategia deberá impedir que una serialización textual pierda fronteras o vuelva indistinguibles secuencias diferentes.

Puede requerir almacenamiento multivaluado o relacional, sujeto al contrato del paquete.

---

#### 13. `SEARCH_APPROVED_ALIAS_SET`

Los aliases aprobados permanecen gobernados por su catálogo versionado.

Reglas:

1. no se copian como fuente de verdad dentro de cada fila empresarial;
2. no se generan desde frecuencia, clics, casefold, tildes, diccionario o similitud;
3. solo participan aliases activos, acotados y autorizados;
4. un alias conflictivo bloquea el nivel correspondiente;
5. materializar una ayuda de consulta no cambia la autoridad del catálogo;
6. una invalidación o nueva versión deberá poder retirar la derivación anterior sin editar historia.

Por defecto esta representación se resuelve como `RELATIONAL_DERIVATION` o en tiempo de consulta, no como una columna escalar universal.

---

#### 14. `SEARCH_TRANSLITERATION_KEY`

La transliteración permanece deshabilitada en la política vigente.

Por tanto:

```text
SEARCH_TRANSLITERATION_KEY
→ NOT_APPLICABLE
```

para las instancias que consuman la política actual.

Una política futura deberá aprobar explícitamente script, mapeo direccional, versión, colisiones, ranking y rollback antes de materializarla.

No se utiliza una función de slug para anticipar esa capacidad.

---

#### 15. `SEARCH_STRUCTURED_COMPONENT_SET`

Las presentaciones y otras entidades estructuradas deberán conservar sus componentes como datos tipados y consultables.

No se construirá una clave concatenada que pierda:

- producto;
- cantidad;
- unidad de entrada;
- cantidad o unidad de stock;
- multiplicador;
- tipo de empaque;
- contexto;
- proveedor o fuente;
- vigencia;
- estado;
- etiqueta visible.

Una equivalencia textual o cuantitativa no establece identidad.

La materialización podrá usar columnas existentes, relaciones o una proyección explícita, según el package.

---

#### 16. `SEARCH_FREE_TEXT_TERMS`

`SEARCH_FREE_TEXT_TERMS` solo se materializa para perfiles que permitan descubrimiento libre y cuando exista una necesidad de consulta demostrada.

La derivación deberá fijar:

- tokenizer;
- locale;
- versión;
- reglas de frontera;
- exclusiones;
- fuente;
- `version_set_digest`.

No se aplicará a secretos, firmas, identificadores técnicos ni campos `UNCLASSIFIED_PRESERVE`.

La estrategia física no puede convertirse en una copia normalizada del contenido sensible.

---

#### 17. Decisión entre expresión y columna generada

Una expresión o columna generated stored solo es admisible cuando su cálculo es:

```text
ROW_LOCAL
AND PURE
AND DETERMINISTIC
AND IMMUTABLE
AND VERSION_FIXED
AND CATALOG_INDEPENDENT
AND AUTH_INDEPENDENT
AND TIME_INDEPENDENT
AND EXACT_WITH_SHARED_CONTRACT
```

No puede depender implícitamente de:

- tablas de reglas;
- catálogo mutable;
- alias activo consultado al vuelo;
- `now()`;
- timezone de sesión;
- locale implícito;
- orden físico;
- caché;
- red;
- autorización;
- configuración local;
- proveedor mutable.

Si una condición falla, se selecciona otra estrategia.

---

#### 18. Dependencia de `DATA-NORM-DB-002`

Una representación que requiera una primitiva SQL debe usar únicamente una función previamente certificada bajo el contrato de `DATA-NORM-DB-002`.

La función deberá:

- tener identidad y versión gobernadas;
- reproducir el contrato compartido;
- declarar volatilidad correcta;
- conservar `NULL`, vacío y errores según contrato;
- ser segura para la modalidad física elegida;
- no cambiar semántica bajo la misma identidad.

La ausencia de una primitiva válida no autoriza recrear el algoritmo ad hoc dentro de la expresión.

---

#### 19. Caso de `unaccent`

El helper `unaccent(text)` observado actualmente en PostgreSQL está declarado `STABLE`.

Además, el contrato canónico de `SEARCH_ACCENT_KEY` es más estrecho que una eliminación genérica de diacríticos.

Por tanto:

1. no se adopta `unaccent(text)` como implementación canónica de `SEARCH_ACCENT_KEY`;
2. no se usa directamente como fundamento de una generated column que exija inmutabilidad;
3. no se asume equivalencia semántica por producir resultados parecidos;
4. cualquier futura primitiva deberá tener reglas, diccionario, versión y corpus propios;
5. la preservación de `ñ` es obligatoria.

---

#### 20. Materialización calculada por servicio

Una derivación deberá usar `MATERIALIZED_STORED` cuando dependa de:

- policy coordinate;
- tokenizer versionado;
- aliases;
- catálogo;
- reglas de campo;
- version set;
- decisión semántica;
- estructura que no pueda expresarse fielmente en SQL inmutable.

En ese caso:

```text
DOMAIN_NORMALIZATION_SERVICE
→ calcula derivación

TRANSACTIONAL_RPC_BOUNDARY
→ revalida
→ persiste fuente y derivaciones sincrónicas compatibles
→ confirma resultado
```

La base puede verificar invariantes, pero no redecide la semántica.

---

#### 21. Atomicidad y estado activo

Una derivación sincrónica requerida para consultas inmediatas deberá confirmarse de manera coherente con su fuente.

La operación deberá impedir:

- fuente nueva con clave antigua marcada activa;
- clave nueva vinculada a fuente antigua;
- `version_set_digest` diferente al usado en la evaluación;
- commit parcial presentado como exitoso.

Una derivación asincrónica solo podrá participar cuando su estado declare que corresponde a la versión actual de la fuente.

Hasta entonces queda fuera del conjunto activo de búsqueda.

---

#### 22. Frescura

Toda derivación materializada deberá ser verificable contra la fuente que la originó.

Como mínimo se conserva o reconstruye:

```text
source_value_version_or_hash
algorithm_version
profile
locale
version_set_digest
```

Una derivación es inválida para consulta activa cuando:

- cambió el valor fuente;
- cambió el algoritmo;
- cambió una dependencia aplicable;
- cambió el perfil;
- cambió el scope;
- fue retirada su versión;
- perdió procedencia;
- no puede demostrarse equivalencia.

La ausencia de certeza produce bloqueo o exclusión explícita, no fallback.

---

#### 23. `NULL`, vacío y contenido no buscable

La estrategia física deberá preservar semánticas distintas.

Reglas:

1. `NULL` fuente no se convierte automáticamente en `''`;
2. vacío no se convierte en una clave empresarial;
3. whitespace-only que el perfil reduce a vacío no crea una derivación activa;
4. un campo no buscable no recibe una clave por defecto;
5. un secreto no recibe una clave derivada;
6. un bloqueo de política no se representa como cadena vacía;
7. una derivación ausente debe distinguirse de una derivación válida cuyo resultado textual sea vacío, si tal resultado estuviera permitido.

---

#### 24. Identificadores técnicos

SKU, códigos, códigos de barras, referencias, modelos, emails, teléfonos y otros identificadores conservan contratos de comparación propios.

La instancia deberá demostrar qué representación les corresponde.

No se les aplica por defecto:

- `SEARCH_ACCENT_KEY`;
- diccionario;
- alias comercial;
- slug;
- similitud;
- capitalización comercial.

`document_number_normalized` observado en `public.employees` se conserva como normalización técnica específica de documento y no se declara `SEARCH_FORM_KEY` universal.

---

#### 25. Baseline remoto observado

La consulta read-only del proyecto de referencia identificó:

```text
generated columns totales observadas = 7
columnas candidatas por nombre relacionado con búsqueda/normalización = 21
índices con expresiones o patrones relacionados = 20
funciones candidatas por filtro amplio de búsqueda/normalización = 103
```

Este inventario es de descubrimiento, no una declaración de equivalencia.

Entre los objetos relevantes:

- `public.employees.document_number_normalized` es generated stored y responde a un contrato técnico de documento;
- `pass.catalog_option_visual_assets.normalized_option_name` es una columna ordinary legacy;
- existen varios índices `lower(...)`, `trim(...)` o `btrim(...)`;
- existen `_vento_norm`, `_vento_slugify` y `_navigation_slugify`;
- existe `unaccent(text)` con volatilidad `STABLE`.

Ninguno se adopta como representación canónica solo por nombre o parecido.

---

#### 26. Disposición de helpers legacy

La disposición inicial es:

| Objeto | Disposición |
| --- | --- |
| `_vento_norm(text)` | LEGACY_NO_EQUIVALENTE; compacta whitespace global y colapsa `NULL` a vacío |
| `_vento_slugify(text)` | LEGACY_NO_EQUIVALENTE; produce slug ASCII |
| `_navigation_slugify(text)` | LEGACY_NO_EQUIVALENTE; translitera y colapsa `ñ` a `n` |
| `unaccent(text)` | LEGACY_NO_EQUIVALENTE; `STABLE` y semántica más amplia que `SEARCH_ACCENT_KEY` |
| `document_number_normalized` | CONTRATO_TÉCNICO_ESPECÍFICO; no se generaliza |
| `normalized_option_name` | CANDIDATO_LEGACY_A_RECONCILIAR; requiere procedencia y paridad |
| índices `lower/trim/btrim` | LEGACY_HASTA_CERTIFICAR; no equivalen por similitud |

La instancia de cada paquete podrá preservar, coexistir, sustituir o retirar únicamente con evidencia y tarea propietaria.

---

#### 27. Paridad query/valor

La consulta y el valor almacenado deberán derivarse usando exactamente:

- mismo perfil;
- mismo locale;
- mismo algoritmo;
- misma versión;
- mismas reglas de espacios;
- mismas reglas de acentos;
- mismo scope;
- dependencias compatibles.

Una consulta derivada por un helper distinto no puede buscar contra una columna canónica bajo el mismo nombre contractual.

La incompatibilidad se bloquea o se declara como degradación explícita.

---

#### 28. Compatibilidad con índices

`DATA-NORM-DB-003` prepara representaciones indexables, pero no crea índices.

Antes del handoff a `DATA-NORM-DB-007` deberá existir una especificación verificable de:

```text
representation_identity
query_expression
storage_expression_or_column
algorithm_version
profile
locale
null_semantics
collation_or_comparison_semantics
version_compatibility
```

El índice posterior solo podrá activarse cuando su expresión y la consulta real sean compatibles con esa especificación.

---

#### 29. Colisiones y dry-run

Esta tarea no ejecuta el análisis masivo de colisiones.

Sin embargo, toda representación candidata deberá entregar a `DATA-NORM-DB-004` suficiente información para medir:

- cantidad de fuentes;
- cantidad de derivaciones;
- colisiones exactas;
- colisiones por tolerancia;
- `NULL`;
- vacíos;
- duplicados de clave;
- falsos positivos por scope;
- diferencias legacy/canónico;
- registros bloqueados;
- cobertura por perfil;
- distribución de longitud;
- impacto potencial en consumidores.

`DATA-NORM-DB-004` conserva la ejecución de dry-runs y reportes.

---

#### 30. Bootstrap y backfill

La futura instancia puede crear estructura antes de llenar datos, pero una representación no se declara lista hasta certificar su población.

La carga inicial deberá:

1. fijar corte de fuente;
2. fijar algoritmo y versiones;
3. fijar perfil y scope;
4. calcular la derivación con la capa autorizada;
5. conservar vínculo de fuente;
6. ser reanudable;
7. ser idempotente;
8. separar errores de bloqueos;
9. producir evidencia de conteos;
10. permanecer fuera de cutover hasta superar dry-run y paridad.

El backfill material pertenece a `DATA-NORM-DB-005`.

---

#### 31. Migraciones forward-only

Toda estructura física futura se crea mediante migraciones versionadas de `vento-shell`.

Queda prohibido:

- crear columnas manualmente en remoto como estado final;
- editar migraciones aplicadas;
- corregir valores derivados directamente para hacerlos coincidir;
- cambiar una expresión generated en sitio sin nueva migración;
- reutilizar una identidad de algoritmo con semántica nueva;
- borrar una representación anterior antes de comprobar consumidores.

Una corrección produce una migración posterior y evidencia de transición.

---

#### 32. Seguridad

Una derivación de búsqueda no amplía acceso.

Reglas:

1. RLS y autorización se aplican antes de exponer resultados;
2. una clave derivada no convierte un campo privado en buscable;
3. no se materializan secretos ni firmas;
4. valores personales requieren finalidad y scope;
5. una clave no debe facilitar enumeración transversal;
6. browser y mobile no reciben internals por conveniencia;
7. una representación física no concede capacidad de escritura;
8. la consulta servidor conserva mínimo privilegio;
9. hashes o huellas sensibles requieren diseño resistente a enumeración cuando aplique.

---

#### 33. Escrituras directas

Las representaciones materializadas no se editan como campos empresariales.

Para `MATERIALIZED_STORED`:

- el consumidor ordinario no escribe la derivación directamente;
- la RPC confirma la operación;
- el servicio calcula el valor;
- el estado de fuente se revalida;
- la derivación se persiste bajo el mismo contexto versionado;
- un bypass administrativo requiere contrato separado y evidencia.

Para `GENERATED_STORED`, PostgreSQL deriva el valor y no existe autoridad de escritura independiente.

---

#### 34. Concurrencia

Antes de materializar o reemplazar una derivación deberá revalidarse:

```text
source_value_version_or_hash
policy_coordinate
version_set_digest
current_derivation_state
```

Una expectativa obsoleta bloquea.

No se permite que:

- último escritor gane silenciosamente;
- un retry use una versión nueva de reglas;
- un job antiguo sobrescriba una derivación reciente;
- una respuesta perdida provoque una segunda materialización incompatible.

---

#### 35. Versionado de representaciones

Una representación física deberá tener una identidad de contrato independiente del nombre físico de columna.

Cambios en cualquiera de estos elementos pueden requerir una nueva versión:

- algoritmo;
- locale;
- perfil;
- reglas de espacios;
- reglas de acento;
- tokenizer;
- estructura;
- dependencia de catálogo;
- serialización;
- semántica de `NULL`;
- digest de configuración.

Renombrar una columna no demuestra compatibilidad.

Mantener el mismo nombre tampoco demuestra identidad semántica.

---

#### 36. Coexistencia

Durante transición podrán coexistir representación legacy y representación canónica.

La coexistencia deberá declarar uno de los modos autorizados por el contrato de versionado.

Para shadow comparison:

1. el resultado canónico no muta el valor fuente;
2. no existe dual write empresarial;
3. las diferencias se registran para análisis;
4. consumidores continúan sobre el contrato vigente hasta el gate;
5. un mismatch no se resuelve eligiendo automáticamente el resultado más frecuente.

---

#### 37. Rollback

El rollback deberá conservar:

- valor fuente;
- representación canónica anterior cuando exista;
- expresión o columna anterior;
- consumidores que aún la soportan;
- algoritmo y versión;
- índices asociados posteriores;
- estado de backfill;
- evidencia de divergencias.

Reglas:

1. una representación defectuosa se retira del path activo sin borrar evidencia;
2. el valor fuente no se reconstruye desde la clave;
3. no se elimina una columna anterior mientras un consumidor la necesite;
4. el rollback de índice pertenece a `DATA-NORM-DB-007`;
5. el rollback de trigger pertenece a `DATA-NORM-DB-008`;
6. la corrección estructural se hace forward-only.

---

#### 38. Paquete sin necesidad de materialización

Una instancia puede concluir:

```text
representaciones físicas nuevas = 0
```

si demuestra que:

- consulta en tiempo de ejecución es suficiente;
- no hay consumidor que requiera almacenamiento;
- no existe requisito de indexación pendiente;
- el costo es aceptable;
- no se necesita replay material;
- la seguridad no mejora con persistencia.

No se crea una columna vacía para satisfacer la existencia de la tarea.

---

#### 39. Readiness de diseño físico

La instancia está lista para diseñar una representación cuando:

```text
package_id identificado
AND campo identificado
AND clase semántica resuelta
AND perfil resuelto
AND representación requerida
AND fuente y mostrado separados
AND algoritmo/versiones fijados
AND estrategia física clasificada
AND seguridad resuelta
AND legacy reconciliado
AND consumidores identificados
```

Si falta una condición, la representación permanece `BLOCKED`.

---

#### 40. Readiness de activación

Una representación física solo puede entrar al path activo cuando:

```text
estructura materializada
AND fuente/backfill completos cuando apliquen
AND paridad query/valor comprobada
AND corpus aprobado
AND frescura verificable
AND colisiones analizadas
AND seguridad comprobada
AND consumidores compatibles
AND plan de consulta medido
AND rollback disponible
AND gates de package abiertos
```

La mera existencia de una columna no satisface esta puerta.

---

#### 41. Evidencia mínima por futura instancia

El expediente deberá permitir responder:

- qué `package_id` originó la representación;
- qué campo y scope gobierna;
- cuál es el valor fuente;
- qué perfil aplica;
- qué representación se materializa;
- qué modalidad física se eligió;
- qué algoritmo y versión se usaron;
- qué `version_set_digest` aplica;
- cómo se trata `NULL`;
- qué legacy coexistió;
- qué backfill se ejecutó;
- qué colisiones aparecieron;
- qué pruebas de paridad pasaron;
- qué consumidores fueron validados;
- qué índice posterior la consume;
- qué rollback está disponible;
- qué riesgo residual permanece.

---

#### 42. Secuencia obligatoria por instancia

La secuencia lógica será:

```text
1. verificar package_id y gates
2. recapturar drift
3. inventariar campos y consumidores
4. resolver clase, perfil y representación
5. demostrar necesidad física
6. clasificar estrategia
7. fijar algoritmo y versiones
8. reconciliar helpers y columnas legacy
9. definir estructura y procedencia
10. preparar migración forward-only
11. materializar estructura
12. poblar únicamente por el mecanismo autorizado
13. verificar frescura e idempotencia
14. comparar con oracle compartido
15. entregar datos a dry-run de DATA-NORM-DB-004
16. ejecutar backfill bajo DATA-NORM-DB-005 cuando corresponda
17. validar seguridad y consumidores
18. medir query plan con estrategia de DATA-NORM-DB-007
19. habilitar path activo únicamente con gates completos
20. registrar evidencia, rollback y drift final
```

---

#### 43. Handoffs

| Materia | Propietario | Handoff |
| --- | --- | --- |
| persistencia de reglas y versiones | `DATA-NORM-DB-001` | `version_set_digest`, estados y procedencia disponibles |
| primitivas SQL deterministas | `DATA-NORM-DB-002` | función certificada solo cuando la estrategia la necesita |
| dry-runs y colisiones | `DATA-NORM-DB-004` | representación candidata, baseline y métricas requeridas |
| backfills | `DATA-NORM-DB-005` | estructura preparada y estrategia idempotente |
| constraints | `DATA-NORM-DB-006` | únicamente después de reconciliar datos |
| índices | `DATA-NORM-DB-007` | expresión/columna indexable y contrato de query compatibles |
| triggers | `DATA-NORM-DB-008` | únicamente barrera defensiva final |
| auditoría operacional | `DATA-NORM-DB-009` | fuente, derivación, versión y resultado atribuibles |

`DATA-NORM-DB-003` no absorbe ninguno de estos owners.

---

#### 44. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

**Requisitos creados:** 0
**Requisitos modificados:** 0

**Justificación:** las obligaciones de separación entre fuente y derivaciones, paridad de query, algoritmos versionados, frescura, preservación de `ñ`, seguridad, compatibilidad de índices, idempotencia, concurrencia, colocación por capas y rollback ya están definidas y cubiertas por la arquitectura y el registro canónico DATA. Esta tarea materializa esas obligaciones por `package_id` sin introducir una nueva semántica empresarial.

---

#### 45. Cobertura de prueba vigente reutilizada

La cobertura existente aplicable incluye:

- `TREQ-DATA-123` para separación de fuente, mostrado y derivaciones;
- `TREQ-DATA-124` para paridad de perfil, locale, algoritmo y versión;
- `TREQ-DATA-125` para vínculo, vigencia y derivaciones huérfanas;
- `TREQ-DATA-126` para `SEARCH_FORM_KEY`;
- `TREQ-DATA-127` para `SEARCH_ACCENT_KEY` y preservación de `ñ`;
- `TREQ-DATA-128` para tokenización y fronteras;
- `TREQ-DATA-129` para aliases aprobados;
- `TREQ-DATA-130` para transliteración deshabilitada;
- `TREQ-DATA-131` para similitud candidata;
- `TREQ-DATA-134` para perfiles y campos no buscables;
- `TREQ-DATA-135` para componentes estructurados;
- `TREQ-DATA-136` para identificadores y contactos;
- `TREQ-DATA-140` para compatibilidad entre representación, consulta e índice;
- `TREQ-DATA-141` para frontera frente a identidad;
- `TREQ-DATA-144` para `resolved_version_set` y `version_set_digest`;
- `TREQ-DATA-157` para concurrencia y fuente obsoleta;
- `TREQ-DATA-158` para determinismo;
- `TREQ-DATA-193` para autoridad del servicio;
- `TREQ-DATA-203` para colocación de normalización determinista;
- `TREQ-DATA-204` para reglas léxicas y revisión.

Estos requisitos se reutilizan como trazabilidad y no cambian su contenido, identidad, estado ni relaciones.

---

#### 46. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | El build del checkout del usuario corresponde a la batería documental posterior al reemplazo del marcador. |
| LOCAL | PASS | Artefacto comprobado contra metadata, secciones, continuidad, cardinalidad de evidencia, declaración TREQ cero, UTF-8, LF, whitespace, contenido prohibido y heurísticas semánticas vigentes; hallazgos bloqueantes: 0. |
| REMOTA | PASS | Fuentes canónicas de `main`, package compartido y baseline read-only de `vento-os-dev` revisados; inventario físico contrastado y mutaciones remotas observadas: 0. |
| OPERATIVA | NOT_EXECUTED | Pruebas de consulta, dry-run, backfill, plan, carga, concurrencia y cutover pertenecen a futuras instancias físicas autorizadas. |
| FÍSICA | NOT_APPLICABLE | Esta aprobación documental no materializa columnas, expresiones, funciones, índices, triggers, migraciones ni datos. |

---

#### 47. Decisiones vinculantes

1. `DATA-NORM-DB-003` es una plantilla por `package_id`.
2. Su gate físico es `POST_E5_PACKAGE`.
3. No existe instancia global.
4. Una representación física es derivada y no autoritativa.
5. Fuente, mostrado y derivado permanecen separados.
6. Persistir una representación requiere necesidad demostrada.
7. Las estrategias son `QUERY_TIME_ONLY`, `GENERATED_STORED`, `MATERIALIZED_STORED`, `RELATIONAL_DERIVATION`, `NOT_APPLICABLE` o `BLOCKED`.
8. `SEARCH_FORM_KEY` conserva tildes, `ñ`, signos y fronteras.
9. `SEARCH_ACCENT_KEY` preserva `ñ` frente a `n`.
10. Un slug no equivale a `SEARCH_FORM_KEY`.
11. `unaccent(text)` observado no se adopta como `SEARCH_ACCENT_KEY`.
12. `SEARCH_TOKEN_STREAM` no se reduce a una cadena escalar por defecto.
13. Los aliases conservan catálogo propio.
14. La transliteración permanece no aplicable bajo la política vigente.
15. Componentes estructurados no se concatenan de forma destructiva.
16. Free text solo se materializa bajo perfil y necesidad aprobados.
17. Una generated expression debe ser row-local, pura, inmutable y exacta.
18. Catálogos mutables y decisiones semánticas excluyen generated expressions.
19. Una primitiva SQL debe provenir de `DATA-NORM-DB-002`.
20. La ausencia de una primitiva certificada no autoriza SQL ad hoc.
21. Materialización compleja pertenece al servicio y RPC.
22. Una derivación activa debe corresponder a la fuente actual.
23. `NULL` no se colapsa automáticamente a vacío.
24. Identificadores técnicos conservan contratos propios.
25. Legacy se reconcilia, no se adopta por parecido.
26. Query y valor comparten perfil, locale, algoritmo y versión.
27. `DATA-NORM-DB-003` no crea índices.
28. `DATA-NORM-DB-004` ejecuta dry-runs y reportes de colisiones.
29. `DATA-NORM-DB-005` ejecuta backfills aprobados.
30. `DATA-NORM-DB-006` conserva constraints posteriores.
31. `DATA-NORM-DB-007` conserva índices.
32. `DATA-NORM-DB-008` conserva triggers.
33. `DATA-NORM-DB-009` conserva auditoría operacional.
34. Toda estructura física futura se crea mediante migración forward-only.
35. Una clave derivada no amplía permisos.
36. Derivaciones materializadas no admiten escritura empresarial directa.
37. Concurrencia valida fuente, versiones y estado esperado.
38. Cambiar semántica de derivación requiere versión nueva.
39. Coexistencia legacy/canónica no implica dual write.
40. Rollback no reconstruye fuente desde una clave.
41. Una instancia puede cerrar con cero representaciones físicas nuevas.
42. Activación exige paridad, frescura, colisiones, seguridad, consumidores y rollback.
43. La definición documental no modifica Supabase.
44. La definición documental no modifica 04A.

---

#### 48. Criterios de aceptación

`DATA-NORM-DB-003` queda documentalmente aceptable cuando:

1. conserva `TEMPLATE_PER_PACKAGE`;
2. conserva `POST_E5_PACKAGE`;
3. usa `DATA-NORM-DB-003::<package_id>`;
4. distingue las siete representaciones del contrato;
5. no obliga a persistir todas las representaciones;
6. define una clasificación cerrada de estrategia física;
7. separa fuente, mostrado y derivación;
8. fija procedencia mínima;
9. preserva el contrato exacto de `SEARCH_FORM_KEY`;
10. preserva `ñ` en `SEARCH_ACCENT_KEY`;
11. excluye transliteración bajo la política vigente;
12. mantiene aliases en su autoridad propietaria;
13. conserva componentes estructurados;
14. limita free text por perfil;
15. exige inmutabilidad real para generated expressions;
16. mantiene la dependencia con `DATA-NORM-DB-002`;
17. rechaza helpers legacy no equivalentes;
18. conserva semántica de `NULL`;
19. exige paridad query/valor;
20. exige frescura;
21. separa la tarea de índices;
22. entrega baseline y métricas a dry-run;
23. separa backfill;
24. exige migraciones forward-only;
25. aplica mínimo privilegio;
26. protege concurrencia;
27. versiona cambios semánticos;
28. define coexistencia y rollback;
29. permite cero materializaciones;
30. conserva handoffs exactos;
31. declara cero requisitos creados o modificados;
32. no ejecuta cambios físicos durante la aprobación documental.

---

#### 49. Límites

`DATA-NORM-DB-003` no:

- crea columnas durante esta definición;
- crea generated columns;
- crea expresiones físicas;
- crea funciones;
- crea índices;
- crea constraints;
- crea triggers;
- crea RPC;
- crea migraciones;
- ejecuta DDL;
- ejecuta DML;
- ejecuta backfills;
- corrige datos;
- crea aliases;
- activa transliteración;
- activa similitud;
- cambia el diccionario;
- cambia conectores;
- cambia excepciones;
- decide identidad;
- decide duplicidad;
- crea unicidad empresarial;
- fusiona registros;
- ejecuta dry-runs;
- ejecuta reportes de colisiones;
- migra consumidores;
- modifica Supabase;
- modifica configuración remota;
- modifica secretos;
- modifica 04A;
- desarrolla `DATA-NORM-DB-004`.

---

#### 50. Continuidad

**ÚLTIMA TAREA APROBADA**
`DATA-NORM-DB-002 — Implementar funciones SQL deterministas cuando sean necesarias`

**TAREA ACTUAL APROBADA**
`DATA-NORM-DB-003 — Implementar columnas o expresiones normalizadas de búsqueda`

**SIGUIENTE TAREA RESERVADA**
`DATA-NORM-DB-004 — Ejecutar dry-runs y reportes de colisiones`


### ✅ DATA-NORM-DB-004 — Ejecutar dry-runs y reportes de colisiones

**Estado:** APROBADA
**Tarea anterior:** DATA-NORM-DB-003 — Implementar columnas o expresiones normalizadas de búsqueda
**Tarea siguiente:** DATA-NORM-DB-005 — Ejecutar backfills aprobados por dominio
**Tipo de tarea:** Documental; contrato y plantilla R2 repetible por `package_id` para ejecutar y certificar dry-runs de normalización y búsqueda, detectar y clasificar colisiones sin inferir identidad, producir evidencia reproducible y resolver la elegibilidad de cada fila antes de cualquier backfill, sin ejecutar DDL, DML, backfills, constraints, índices, triggers, fusiones, desactivaciones, reasignaciones ni cambios remotos durante esta definición
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/04_IMPLEMENTACION_FISICA_DE_NORMALIZACION.md`
**Estado físico resultante:** ESPECIFICADO_NO_MATERIALIZADO; contrato canónico `TEMPLATE_PER_PACKAGE` cerrado para futuras instancias `DATA-NORM-DB-004::<package_id>`, condicionadas a `POST_E5_PACKAGE`, paquete aprobado, fuentes y versiones fijadas, reconciliación de drift, ejecución estrictamente read-only y autorización física explícita
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Objetivo

`DATA-NORM-DB-004` define cómo deberá ejecutarse, por cada paquete aprobado, el último análisis de solo lectura que separa una transformación propuesta de una transformación apta para backfill.

La futura instancia deberá responder de manera reproducible, sin modificar datos:

1. qué universo exacto fue evaluado;
2. qué reglas, perfiles, catálogos, algoritmos y versiones se utilizaron;
3. qué resultado habría producido cada evaluación autorizada;
4. qué filas no cambian;
5. qué filas producirían un cambio candidato;
6. qué filas quedan bloqueadas por política, versión, scope, conflicto, revisión, estructura o fallo técnico;
7. qué derivaciones de búsqueda convergen;
8. qué colisiones exactas o tolerantes aparecen;
9. qué colisiones son falsos positivos por scope, ciclo de vida, estructura o frontera funcional;
10. qué grupos permanecen abiertos para revisión o resolución estructural;
11. qué consumidores y relaciones pueden verse afectados;
12. qué conjunto exacto puede pasar a `DATA-NORM-DB-005`;
13. qué conjunto exacto debe permanecer excluido;
14. si el paquete no requiere backfill;
15. qué evidencia permite repetir el análisis bajo el mismo corte.

La tarea no ejecuta todavía el dry-run físico de ningún `package_id`. Define el contrato que deberá satisfacer cada futura ejecución autorizada.

---

#### 2. Resultado canónico

Queda definido:

```text
DATA-NORM-DB-004
→ contrato documental único y reutilizable

DATA-NORM-DB-004::<package_id>
→ futura instancia física read-only por paquete

paquete aprobado
+ baseline recapturado
+ reglas y versiones fijadas
+ algoritmo y perfil fijados
+ universo y scope exactos
+ evaluación sin mutación
+ detección de colisiones
+ clasificación y evidencia
+ partición de elegibilidad
+ manifiesto de readiness
→ handoff cerrado hacia DATA-NORM-DB-005
```

La definición global no se reabre por cada paquete.

Cada instancia conserva su propio `package_id`, corte, universo, reglas, versiones, scopes, consultas, resultados, colisiones, bloqueos, consumidores, evidencia y disposición de backfill.

---

#### 3. Topología vinculante

La topología aplicable es:

```text
mode = TEMPLATE_PER_PACKAGE
execution_gate = POST_E5_PACKAGE
instance_pattern = DATA-NORM-DB-004::<package_id>
```

Consecuencias:

1. no existe `DATA-NORM-DB-004::GLOBAL`;
2. aprobar este contrato no ejecuta consultas masivas ni dry-runs físicos;
3. dos paquetes no comparten una instancia anónima;
4. una consulta o helper reutilizable no amplía el scope de un paquete;
5. una colisión encontrada en un paquete no autoriza analizar ni modificar otro dominio;
6. la evidencia de un paquete no se presenta como certificación global de Vento OS;
7. cada `package_id` conserva su propio corte y digest de evidencia;
8. el marcador documental global no se modifica para registrar cada ejecución física futura.

---

#### 4. Gate temporal

Una futura instancia solo podrá ejecutar el dry-run físico cuando el mismo `package_id` haya alcanzado las puertas exigidas por R2 y por su paquete E5.

Como mínimo deberá demostrarse:

```text
R0 aplicable = VERIFIED
R1 aplicable = VERIFIED
DELIV-PKG aplicable = CLOSED
E5-GATE-008::<package_id> = PASS
SHELL-CI-020::<package_id> = OPENED
drift aplicable = RECONCILED
physical_authorization = EXPLICIT
```

Además deberán estar resueltas las decisiones aplicables de `DATA-NORM-DB-001`, `DATA-NORM-DB-002` y `DATA-NORM-DB-003` para el mismo paquete, sin asumir que todas deban materializar objetos físicos cuando su disposición sea no aplicable.

La ausencia de una puerta mantiene la instancia sin ejecución física.

---

#### 5. Fuentes vinculantes

Cada futura instancia deberá consumir sin reinterpretación silenciosa:

- `DATA-NORM-ARC-001` a `DATA-NORM-ARC-007` para resolución, clases, capitalización, conectores, excepciones, diccionario y revisión;
- `DATA-NORM-ARC-008` para representaciones, perfiles y modos de búsqueda;
- `DATA-NORM-ARC-009` para versiones, digests, auditoría, idempotencia y replay;
- `DATA-NORM-ARC-010` para identidad, scope, taxonomía de colisiones y prohibición de inferir duplicidad;
- `DATA-NORM-ARC-011` para autoridad por capas y evaluación semántica;
- `DATA-NORM-ARC-012` cuando existan originales, mappings o referencias externas;
- `DATA-NORM-TRANS-001` para el baseline histórico aprobado;
- `DATA-NORM-TRANS-002` para el contrato analítico de dry-run y sus estados;
- `DATA-NORM-TRANS-003` para clasificación, evidencia y no transitividad de colisiones;
- `DATA-NORM-DB-001` para versiones persistidas cuando sean aplicables;
- `DATA-NORM-DB-002` para primitivas SQL deterministas cuando hayan sido aprobadas;
- `DATA-NORM-DB-003` para representaciones físicas derivadas y las métricas que entrega al dry-run;
- las definiciones vigentes de `@vento/data-normalization`;
- el expediente E5, consumidores y alcance del `package_id`;
- constraints, índices, relaciones y objetos legacy que puedan afectar el resultado actual;
- el estado remoto recapturado inmediatamente antes de la ejecución;
- la cobertura vigente del registro canónico de requisitos de prueba.

Una discrepancia material entre fuente, versión, código, contrato y remoto se clasifica como drift y bloquea la certificación del run afectado.

---

#### 6. Handoff recibido de `DATA-NORM-DB-003`

`DATA-NORM-DB-003` exige que cada representación candidata entregue información suficiente para medir, como mínimo:

- cantidad de fuentes;
- cantidad de derivaciones;
- colisiones exactas;
- colisiones por tolerancia;
- `NULL`;
- vacíos;
- duplicados de clave;
- falsos positivos por scope;
- diferencias legacy/canónico;
- registros bloqueados;
- cobertura por perfil;
- distribución de longitud;
- impacto potencial en consumidores.

`DATA-NORM-DB-004` convierte ese handoff en evidencia ejecutada de solo lectura y no puede rebajar ninguna de esas dimensiones a una observación opcional.

Si la estrategia aprobada por `DATA-NORM-DB-003` es `QUERY_TIME_ONLY` o no materializa una columna, el dry-run evalúa la representación lógica mediante el mismo oracle y versión; no crea una columna ficticia para poder medirla.

---

#### 7. Baseline histórico de referencia

`DATA-NORM-TRANS-001` y `DATA-NORM-TRANS-002` conservan un baseline histórico aprobado y un replay analítico preimplementación.

Entre sus señales históricas se encuentran:

- 4.030 filas en el corpus comparativo de búsqueda;
- 26 grupos y 52 filas bajo comparación `LOWER_TRIM`;
- 27 grupos y 54 filas bajo comparación tolerante a tildes;
- 17 grupos tolerantes formados únicamente por filas activas;
- 26 grupos y 52 filas bajo `_vento_slugify`;
- 27 grupos y 54 filas bajo `_navigation_slugify`;
- 2.730 de 4.030 filas con divergencia entre ambos helpers legacy;
- 72 posiciones `Nivel 1` a `Nivel 6` que son falsos positivos cuando se omite el scope jerárquico;
- grupos de UOM con etiquetas iguales y estructura distinta;
- pares activo/inactivo de catálogo;
- homónimos funcionales de producto;
- nombres de persona que no constituyen identidad.

Estos datos son una referencia histórica para detectar regresiones o cambios de magnitud. No certifican el remoto presente y no se reutilizan como si fueran un snapshot actual.

---

#### 8. Estado técnico verificado de partida

El package `@vento/data-normalization` ya expone contratos puros relevantes para esta tarea:

- preview no vinculante;
- evaluación semántica inyectada;
- estados `NO_CHANGE`, `PROPOSED_CHANGE`, `BLOCKED_POLICY`, `BLOCKED_CONFLICT`, `REVIEW_REQUIRED`, `ESCALATED_STRUCTURAL` y `TECHNICAL_FAILURE`;
- `commit_authority = false` en preview;
- `mutation_performed = false` en preview;
- `uniqueness_certified = false` en preview;
- `identity_decided = false` en preview;
- obligación de revalidación transaccional posterior;
- contratos de auditoría, versiones, `version_set_digest`, procedencia de algoritmo, replay y concurrencia.

La recaptura remota de metadatos realizada durante esta definición encontró objetos legacy con nombres relacionados con normalización, pero no evidenció una infraestructura canónica global de dry-run, registro de colisiones o `review_case` que pueda adoptarse por coincidencia nominal.

Por tanto, la futura instancia deberá construir su evidencia desde el contrato vigente del paquete y el scope aprobado, no desde una tabla o función legacy inferida como autoridad.

---

#### 9. Principio de cero mutación

El dry-run de esta tarea es analítico y no vinculante.

Invariantes:

1. no ejecuta `INSERT`, `UPDATE`, `DELETE`, `MERGE`, DDL ni comandos equivalentes;
2. no crea tablas temporales, persistentes o auxiliares dentro del proyecto observado;
3. no crea índices ni constraints para acelerar el análisis;
4. no ejecuta triggers mediante escrituras simuladas como mecanismo normal de dry-run;
5. no actualiza derivaciones existentes;
6. no crea review cases ni decisiones;
7. no corrige valores;
8. no fusiona registros;
9. no desactiva filas;
10. no reasigna relaciones;
11. no altera secuencias;
12. no cambia configuración de sesión persistente;
13. no considera un rollback posterior como sustituto de un diseño read-only cuando existe una alternativa de solo lectura.

Un intento de escritura que falle por estar dentro de una transacción read-only se registra como violación del runner y no como una forma aceptable de completar el dry-run.

---

#### 10. Frontera de transacción read-only

Cuando la ejecución use PostgreSQL directamente, las consultas del mismo snapshot deberán ejecutarse, cuando sea técnicamente posible, dentro de una transacción de solo lectura con aislamiento suficiente para conservar una vista consistente del universo analizado.

La configuración de solo lectura deberá ser transaccional y no una característica de sesión que pueda contaminar una conexión reutilizada por un pool.

Reglas:

1. la evidencia declara `transaction_read_only` cuando la vía de ejecución permita observarlo;
2. la evidencia declara el aislamiento usado;
3. una ejecución distribuida entre snapshots distintos no se presenta como una única captura atómica;
4. si el runner requiere múltiples conexiones, cada fragmento conserva su propio corte y la agregación declara la limitación;
5. un mecanismo de rollback de una única petición no se interpreta como transacción multi-request;
6. funciones SQL llamadas por el dry-run deberán estar aprobadas para el propósito y no podrán introducir efectos laterales;
7. cualquier función que intente escribir hace fallar la ejecución afectada.

---

#### 11. Identidad mínima del run

Cada futura instancia deberá producir una identidad inmutable del run con, como mínimo:

```text
instance_id
package_id
dry_run_id
environment
source_revision_or_commit
baseline_reference
capture_started_at
capture_completed_at
snapshot_or_cut_reference
policy_coordinate_set
resolved_version_set
version_set_digest
algorithm_provenance
profile_set
locale_set
scope_set
source_population_digest
runner_identity
runner_version
runner_digest
authorization_reference
drift_state
result_digest
```

Ninguno de estos campos puede derivarse de la hora actual como único identificador semántico.

Repetir el mismo universo, versiones, algoritmo, configuración y snapshot deberá producir el mismo resultado lógico y el mismo digest canónico, salvo metadatos operativos expresamente excluidos del digest.

---

#### 12. Modos de ejecución permitidos

La instancia podrá declarar únicamente uno de estos modos lógicos:

```text
CURRENT_READ_ONLY_FULL_SCOPE
CURRENT_READ_ONLY_PARTITIONED_SCOPE
APPROVED_BASELINE_REPLAY
BLOCKED_BEFORE_EXECUTION
```

Significado:

- `CURRENT_READ_ONLY_FULL_SCOPE`: recaptura y evalúa la totalidad del scope autorizado actual;
- `CURRENT_READ_ONLY_PARTITIONED_SCOPE`: cubre el scope completo mediante particiones disjuntas y reconciliables;
- `APPROVED_BASELINE_REPLAY`: reproduce evidencia histórica aprobada para comprobar determinismo, no para certificar el remoto actual;
- `BLOCKED_BEFORE_EXECUTION`: una precondición impide ejecutar y no se fabrican resultados parciales como certificación.

Una muestra estadística puede utilizarse para diagnóstico o rendimiento, pero nunca habilita por sí sola filas no examinadas para backfill.

---

#### 13. Universo material del dry-run

Antes de evaluar valores deberá fijarse el universo exacto mediante una matriz por fuente.

Cada entrada declara:

- dominio propietario;
- entidad propietaria;
- tabla, vista o fuente física observada;
- campo o trayectoria estructurada;
- representación;
- rol de fuente;
- perfil;
- scope;
- criterios de estado o vigencia;
- política y versión;
- cantidad esperada;
- cantidad observada;
- exclusiones justificadas;
- consumidor o propósito;
- mecanismo de paginación o partición cuando aplique.

No se agrega al universo una columna porque sea `text`, porque contenga `name`, porque un helper legacy la procese o porque otra aplicación la consulte.

---

#### 14. Frontera VITAL

VITAL permanece fuera de cualquier dry-run transversal de Vento OS.

La evidencia deberá demostrar una de estas condiciones:

```text
VITAL_NOT_REFERENCED
VITAL_BOUNDARY_OBSERVED_WITHOUT_DATA_EVALUATION
```

Una dependencia relacional que cruce la frontera puede registrarse como impacto o bloqueo, pero no autoriza leer ni evaluar datos propios de VITAL como parte del universo de Vento OS.

La ausencia de filas VITAL en un resultado no basta si la consulta, vista o función usada pudo incorporarlas antes del filtro.

---

#### 15. Elegibilidad previa a evaluación

Cada coordenada debe pasar, como mínimo, estos gates antes de derivar un candidato:

1. dominio resuelto;
2. entidad resuelta;
3. campo semántico resuelto;
4. representación resuelta;
5. rol de fuente resuelto;
6. clase semántica resuelta;
7. política activa compatible;
8. `version_set_digest` completo;
9. algoritmo y artefacto fijados;
10. locale explícito cuando aplique;
11. scope completo;
12. fuente y versión o hash observables cuando el contrato lo exija;
13. autorización para leer la evidencia;
14. ausencia de drift bloqueante;
15. ausencia de material protegido excluido del mecanismo.

Fallar un gate produce bloqueo explícito; nunca se usa una regla genérica de fallback.

---

#### 16. Evaluación fila por fila o unidad por unidad

La unidad lógica de evaluación es la coordenada autorizada de una entidad, no una cadena aislada.

Cada resultado deberá poder vincular:

```text
entity_type
entity_id_or_protected_reference
source_field_coordinate
source_value_version_or_hash
policy_coordinate
semantic_class
representation_role
source_role
scope_ref
resolved_version_set
version_set_digest
algorithm_provenance
preview_result
proposed_or_preserved_reference_or_hash
derivation_set
match_set
blocking_detail
```

El resultado puede minimizar valores sensibles mediante referencias o hashes siempre que preserve reproducibilidad suficiente.

---

#### 17. Estados de evaluación reutilizados

El dry-run reutiliza el contrato actual del preview compartido y no crea otra taxonomía incompatible.

Estados de fila:

```text
NO_CHANGE
PROPOSED_CHANGE
BLOCKED_POLICY
BLOCKED_CONFLICT
REVIEW_REQUIRED
ESCALATED_STRUCTURAL
TECHNICAL_FAILURE
```

Lectura obligatoria:

- `NO_CHANGE` no significa que el campo esté globalmente certificado;
- `PROPOSED_CHANGE` no significa que el cambio esté autorizado para persistencia;
- `BLOCKED_POLICY` no se convierte en `NO_CHANGE`;
- `BLOCKED_CONFLICT` exige resolver el conflicto propietario;
- `REVIEW_REQUIRED` conserva el valor sin decisión automática;
- `ESCALATED_STRUCTURAL` no se resuelve mediante normalización textual;
- `TECHNICAL_FAILURE` invalida la cobertura de la unidad afectada.

---

#### 18. Resultado `NO_CHANGE`

Una unidad `NO_CHANGE` deberá demostrar que:

1. fue realmente evaluada bajo la versión declarada;
2. el valor fuente no fue omitido por filtro accidental;
3. no fue clasificada como bloqueo;
4. no depende de un helper legacy diferente;
5. la comparación usa el mismo algoritmo y serialización del oracle;
6. `NULL`, vacío y estados especiales conservaron su semántica;
7. el resultado es idempotente bajo el mismo contexto.

`NO_CHANGE` entra al manifiesto final como `NO_CHANGE`, no como fila de backfill con escritura redundante.

---

#### 19. Resultado `PROPOSED_CHANGE`

Una unidad `PROPOSED_CHANGE` es únicamente candidata.

Antes de poder entrar al conjunto `BACKFILL_ELIGIBLE` deberá superar:

- resolución completa de política;
- versión y digest vigentes;
- ausencia de drift;
- clasificación de cualquier colisión producida;
- compatibilidad con scope e identidad;
- restricciones actuales relevantes;
- revisión de consumidores y relaciones aplicables;
- ausencia de bloqueo humano o estructural;
- evidencia suficiente para rollback;
- pertenencia exacta al `package_id`.

Una transformación correcta de texto puede quedar bloqueada para persistencia si sus efectos estructurales no están resueltos.

---

#### 20. Bloqueos y fallos

Los bloqueos deberán conservar causa estable y owner.

Como mínimo se distinguen:

- política ausente o incompatible;
- versión ausente, suspendida, retirada o incompatible;
- scope incompleto;
- fuente obsoleta;
- derivación obsoleta;
- diferencia entre oracle y implementación;
- colisión no resuelta;
- identidad posible;
- estructura incompatible;
- evidencia insuficiente;
- consumidor no reconciliado;
- relación desconocida;
- autorización insuficiente;
- dato protegido no apto para el runner;
- drift no reconciliado;
- fallo técnico.

Cada causa deberá indicar la tarea o autoridad propietaria que puede resolverla. DB-004 no cierra por conveniencia una decisión perteneciente a identidad, revisión, backfill, constraints, índices o transición.

---

#### 21. Derivaciones de búsqueda

Cuando el paquete incluya representaciones de búsqueda, query y valor deberán evaluarse con el mismo:

```text
search_profile
locale
algorithm_key
algorithm_version
artifact_digest
version_set_digest
scope
representation
```

`SEARCH_FORM_KEY`, `SEARCH_ACCENT_KEY`, tokens, aliases aprobados, componentes estructurados y otras representaciones permanecen separadas.

Una colisión en una representación de búsqueda no convierte la representación en clave empresarial ni en política de unicidad.

---

#### 22. Detección de colisiones

La detección se ejecuta después de derivar resultados comparables y antes de declarar elegibilidad de backfill.

Una colisión significa que dos o más miembros convergen bajo una comparación declarada dentro de un scope declarado.

No significa por sí sola:

- misma entidad;
- duplicado;
- error de datos;
- mismo ciclo de vida;
- mismo producto funcional;
- mismo padre;
- mismo emisor;
- misma estructura;
- misma vigencia;
- autorización para fusionar;
- autorización para bloquear por unicidad.

---

#### 23. Identidad reproducible de grupo

Cada grupo deberá conservar una identidad derivable de:

```text
policy_key
policy_version
comparison_representation
profile
locale
algorithm_version
entity_family
scope_coordinate
ordered_member_set
evidence_digest
```

Los miembros se ordenan de forma determinista antes del digest.

Si cambia un miembro, scope, representación, política, versión, algoritmo o evidencia material, cambia la revisión del grupo; no se reescribe silenciosamente el grupo anterior.

---

#### 24. Taxonomía obligatoria de colisiones

Toda colisión material deberá clasificarse con exactamente una clase primaria de la taxonomía vigente:

```text
EXACT_VALUE_COLLISION
FORM_VARIANT_COLLISION
SEARCH_KEY_COLLISION
PROBABLE_SAME_ENTITY
STRUCTURAL_DUPLICATE_CANDIDATE
LIFECYCLE_OR_VERSION_PAIR
CROSS_LAYER_HOMONYM
LABEL_COLLISION_DIFFERENT_STRUCTURE
SCOPE_FALSE_POSITIVE
AMBIGUOUS_COLLISION
```

Pueden conservarse señales secundarias, pero la clase primaria debe ser única para una revisión determinada.

Ninguna clase, incluida `PROBABLE_SAME_ENTITY`, equivale a `CONFIRMED_DUPLICATE_DECISION`.

---

#### 25. Colisiones exactas

El reporte separa como mínimo:

- igualdad literal dentro del mismo scope;
- igualdad de valor mostrado con estructura distinta;
- igualdad de derivación con fuente distinta;
- igualdad de clave legacy;
- igualdad bajo una política de unicidad realmente aprobada, cuando exista.

Dos strings iguales no se agregan automáticamente si pertenecen a dominios, padres, emisores, roles, ciclos o estructuras incompatibles.

---

#### 26. Colisiones por tolerancia

Las colisiones tolerantes se reportan por representación y nunca como un total indistinto.

Como mínimo se separan:

- forma equivalente;
- tolerancia de tildes;
- aliases aprobados;
- frase o token;
- prefijo controlado;
- transliteración cuando alguna versión futura la habilite;
- similitud candidata cuando alguna política futura la habilite.

Si una capacidad está deshabilitada por política, el reporte conserva `NOT_APPLICABLE` o bloqueo correspondiente y no ejecuta una versión local alternativa.

---

#### 27. No transitividad

La detección no aplica transitividad implícita.

```text
A coincide con B
B coincide con C
```

no implica:

```text
A = C
A, B y C forman una sola entidad
```

Una agrupación por componentes conectados solo será válida si el contrato específico define esa operación y demuestra que la relación usada es apropiada para esa agregación.

La similitud, prefijos, tokens y señales difusas se conservan como pares o grafos reproducibles, no como identidad transitiva.

---

#### 28. `NULL`, vacío y estados especiales

El dry-run deberá contabilizar y preservar por separado:

- `NULL`;
- string vacío;
- solo espacios cuando el contrato aún no los haya transformado;
- desconocido;
- no aplicable;
- pendiente;
- placeholder;
- clave parcial;
- valor inválido;
- valor protegido no inspeccionable.

Ninguno se convierte automáticamente en otro para simplificar conteos o agrupaciones.

Una política puede declarar múltiples `NULL` permitidos o un comportamiento específico, pero el dry-run debe demostrarlo desde la política, no inferirlo del motor actual.

---

#### 29. Ciclo de vida y temporalidad

Actividad, vigencia, supersesión y estado histórico forman parte del scope.

Reglas:

1. activo/inactivo no significa duplicado;
2. retirar una fila no libera automáticamente una identidad o código;
3. dos versiones históricas no se agrupan como conflicto presente sin política temporal compatible;
4. el reporte distingue colisión simultánea de par de lifecycle;
5. los intervalos efectivos se conservan cuando participan en identidad o unicidad;
6. un backfill no reescribe historia fuera de su alcance temporal aprobado.

---

#### 30. Scope estructural

Para entidades estructuradas, el detector debe incorporar todas las dimensiones aprobadas.

Ejemplos de dimensiones relevantes según familia:

- sede;
- ubicación;
- padre o camino jerárquico;
- producto;
- cantidad;
- unidad de entrada;
- unidad de stock;
- multiplicador;
- contexto de uso;
- proveedor;
- fuente;
- categoría funcional;
- emisor externo;
- vigencia.

El texto visible es una dimensión de evidencia, no un sustituto del scope.

---

#### 31. Falsos positivos por scope

Los 72 registros históricos `Nivel 1` a `Nivel 6` constituyen una prueba negativa canónica: agruparlos por etiqueta sin padre, camino o código produce un falso positivo.

Una futura instancia deberá detectar esta familia de error mediante corpus equivalente y mediante el scope real del paquete.

Una colisión que desaparece al aplicar el scope correcto se clasifica como `SCOPE_FALSE_POSITIVE` y no se usa para modificar los datos legítimos.

---

#### 32. Estructura frente a etiqueta

UOM, presentaciones, políticas y entidades compuestas no pueden deduplicarse por una etiqueta normalizada.

El dry-run deberá conservar, cuando apliquen:

- cantidad de entrada;
- unidad de entrada;
- cantidad de stock;
- unidad de stock;
- factor o multiplicador;
- empaque;
- contexto;
- fuente;
- proveedor;
- estado;
- vigencia.

Dos etiquetas iguales con huellas estructurales distintas se clasifican como `LABEL_COLLISION_DIFFERENT_STRUCTURE` y permanecen distintas.

---

#### 33. Productos y homónimos funcionales

Los productos deberán evaluarse con su contexto funcional.

Insumo, preparación y artículo de venta pueden compartir nombre sin compartir identidad.

El reporte no podrá colapsar por nombre:

- abastecimiento;
- recetas;
- inventario;
- catálogo;
- venta;
- remisión;
- unidad;
- categoría;
- dependencias consumidoras.

Un homónimo legítimo se conserva como `CROSS_LAYER_HOMONYM`.

---

#### 34. Personas y datos sensibles

Una coincidencia de nombre de persona es una señal restringida y no una clave de identidad.

Para personas, trabajadores, usuarios o invitados:

1. no se publica el nombre completo dentro de evidencia general si no es necesario;
2. se priorizan referencias protegidas y hashes;
3. documento, autenticación, contacto, estado y procedencia solo se consultan bajo finalidad autorizada;
4. el resultado no confirma identidad por nombre normalizado;
5. muestras y reportes deben minimizar datos personales;
6. un análisis que no pueda preservar finalidad y minimización queda bloqueado.

---

#### 35. Referencias externas

Una referencia externa se evalúa con emisor, tipo, ambiente, contrato, valor original, scope y vigencia.

Valores iguales emitidos por sistemas distintos no colisionan globalmente por defecto.

El original externo, su mapping y cualquier derivación interna permanecen separados.

Un dry-run nunca reescribe el original recibido para hacerlo coincidir con la forma interna.

---

#### 36. Métricas obligatorias por instancia

Cada ejecución deberá producir, cuando aplique, como mínimo:

| Métrica | Regla |
| --- | --- |
| fuentes esperadas | universo aprobado del paquete |
| fuentes observadas | fuentes efectivamente leídas |
| filas o unidades observadas | total antes de elegibilidad |
| unidades elegibles | contexto completo y política resoluble |
| `NO_CHANGE` | evaluación completa sin cambio |
| `PROPOSED_CHANGE` | cambio candidato antes de readiness |
| bloqueadas por política | sin fallback |
| bloqueadas por conflicto | separadas de error técnico |
| revisión requerida | no autoaprobada |
| escaladas estructuralmente | fuera de normalización textual |
| fallos técnicos | restan cobertura válida |
| `NULL` | conteo propio |
| vacíos | conteo propio |
| derivaciones esperadas | según estrategia de DB-003 |
| derivaciones observadas | existentes o calculadas |
| derivaciones obsoletas | no participan como activas |
| colisiones exactas | por representación y scope |
| colisiones tolerantes | por representación, perfil y scope |
| grupos por clase | diez clases canónicas |
| miembros por clase | sin doble conteo global artificial |
| falsos positivos por scope | separados |
| diferencias legacy/canónico | por helper o algoritmo |
| consumidores registrados | conjunto aplicable |
| consumidores afectados | evidencia por consumidor |
| relaciones relevantes | con y sin FK cuando el riesgo lo exija |
| filas aptas para backfill | conjunto cerrado |
| filas bloqueadas para backfill | conjunto cerrado |
| filas sin backfill | `NO_CHANGE` o `NOT_APPLICABLE` |

Una métrica no aplicable se declara como tal; no se convierte en cero sin explicación.

---

#### 37. Cobertura por perfil

La cobertura se reporta por perfil y no solo como porcentaje global.

Cada perfil declara:

```text
expected_units
observed_units
evaluated_units
blocked_units
technical_failure_units
not_applicable_units
coverage_ratio
valid_evaluation_ratio
```

`coverage_ratio` responde si el universo previsto fue observado.

`valid_evaluation_ratio` responde qué fracción obtuvo una evaluación válida sin fallo técnico.

Una fila bloqueada por política puede contar como observada y correctamente bloqueada, pero no como candidata ejecutable.

---

#### 38. Distribución de longitud

Cuando `DATA-NORM-DB-003` produzca o proponga representaciones persistibles, la ejecución medirá longitud de fuente y derivación con una distribución reproducible.

Como mínimo:

- mínimo;
- máximo;
- percentil 50;
- percentil 95;
- percentil 99;
- cantidad que excede cualquier límite físico aplicable;
- cantidad cuyo crecimiento respecto del fuente sea material para almacenamiento o índice posterior.

La distribución se calcula sobre el mismo universo y versión del dry-run; no mezcla cortes históricos y actuales.

Esta métrica informa `DATA-NORM-DB-005` y `DATA-NORM-DB-007`, pero no crea un índice ni fija por sí sola su estrategia.

---

#### 39. Duplicados de clave y constraints existentes

Antes de un backfill deberán identificarse las restricciones actuales que podrían reaccionar al resultado propuesto.

El dry-run reporta:

- claves empresariales existentes;
- índices únicos existentes;
- constraints actuales;
- claves derivadas legacy;
- posibles convergencias producidas por el candidato;
- scope efectivo de cada restricción;
- nulos y temporalidad aplicables.

Una clave de búsqueda no se convierte en constraint de unicidad.

`DATA-NORM-DB-006` conserva la creación o modificación posterior de constraints; DB-004 únicamente reporta la compatibilidad previa necesaria.

---

#### 40. Consumidores y relaciones

La instancia deberá cruzar el resultado con los consumidores registrados del paquete.

Para cada consumidor afectado se conserva:

- identidad;
- campo o contrato consumido;
- representación esperada;
- tolerancia de formato;
- dependencia de valor literal o derivado;
- dependencia de orden o ranking cuando aplique;
- impacto potencial;
- evidencia de compatibilidad disponible;
- bloqueo pendiente si la compatibilidad no está demostrada.

La ausencia de FK no demuestra ausencia de dependencia.

Consultas, RPC, vistas, jobs, integraciones, exports, caches y código pueden constituir consumidores aunque PostgreSQL no tenga una relación declarativa.

---

#### 41. Reporte de brechas de evidencia

Toda brecha deberá convertirse en una fila gobernada, no en una nota libre.

Cada brecha declara:

```text
gap_key
package_id
scope
missing_evidence
risk
blocking
owner
owner_task_or_authority
exit_condition
affected_units
```

Una brecha bloqueante impide certificar como elegibles las unidades afectadas.

Una brecha no bloqueante deberá justificar por qué no puede alterar la disposición del conjunto afectado.

---

#### 42. Seguridad y minimización del reporte

Los artefactos de evidencia deben ser útiles para reproducibilidad sin convertirse en una extracción paralela de datos empresariales.

Reglas:

1. secretos y firmas no se incluyen;
2. datos personales se minimizan;
3. valores externos probatorios se referencian cuando sea posible;
4. muestras contienen solo la mínima información necesaria;
5. IDs estables pueden sustituirse por referencias protegidas cuando la exposición no sea necesaria;
6. digests no se presentan como anonimización si permiten ataques por diccionario sobre dominios pequeños;
7. permisos de lectura del dry-run no conceden permisos de escritura;
8. un service role no convierte una consulta fuera de finalidad en autorizada;
9. los reportes no mezclan VITAL con Vento OS.

---

#### 43. Reproducibilidad

Una ejecución reproducible deberá conservar:

- fuente o snapshot;
- universo;
- versiones de reglas;
- `version_set_digest`;
- configuración;
- algoritmo y artifact digest;
- locale;
- Unicode y tokenizer cuando apliquen;
- orden canónico de miembros;
- consultas o runner versionados;
- resultado esperado cuando sea replay;
- resultado real;
- clasificación de diferencias;
- digest del bundle de evidencia.

Cambiar una dependencia semántica crea otro run; no se actualiza silenciosamente el digest anterior.

---

#### 44. Determinismo y orden

Los conteos y digests no pueden depender de:

- orden físico de filas;
- primer resultado recibido;
- plan de ejecución;
- reloj no declarado;
- configuración de sesión no versionada;
- locale implícito;
- caché local;
- aleatoriedad;
- paginación inestable;
- concurrencia incidental.

Toda lista que alimente un digest se ordena mediante una clave determinista declarada.

La paginación debe tener una frontera estable; `OFFSET` sin orden total no constituye una partición reproducible.

---

#### 45. Comparación con baseline histórico

La ejecución actual puede comparar sus métricas con `DATA-NORM-TRANS-001` a `DATA-NORM-TRANS-003`, pero deberá etiquetar las diferencias como variación entre cortes.

No se interpretan automáticamente como error:

- más o menos filas;
- más o menos grupos;
- nuevos scopes;
- cambios legítimos de ciclo de vida;
- nuevas versiones de reglas.

Sí exigen explicación:

- desaparición inesperada de una fuente requerida;
- cambio de algoritmo bajo la misma versión;
- colisiones nuevas sin cambio de universo o versión que las explique;
- cambios de scope no aprobados;
- pérdida de miembros o evidencia;
- divergencia de paridad bajo entradas equivalentes.

---

#### 46. No agregación de universos solapados

Los reportes pueden contener múltiples cortes analíticos sobre las mismas filas.

Por tanto:

1. grupos de productos no se suman a grupos de búsqueda si se solapan;
2. grupos UOM amplios no se suman a su subconjunto activo;
3. comparaciones de forma, acento y slug no se suman como si fueran entidades distintas;
4. pares activo/inactivo pueden aparecer en más de una representación sin aumentar el número de registros fuente;
5. cada métrica declara su denominador y scope;
6. un total global solo existe cuando los conjuntos son demostrablemente disjuntos o se deduplican por identidad estable.

La ausencia de un total único puede ser el resultado correcto.

---

#### 47. Partición final de filas

Al finalizar, cada unidad del universo aprobado deberá quedar en exactamente una disposición de handoff:

```text
NO_CHANGE
BACKFILL_ELIGIBLE
BLOCKED
NOT_APPLICABLE
```

Reglas:

- `NO_CHANGE`: evaluación válida; no requiere escritura;
- `BACKFILL_ELIGIBLE`: cambio candidato que superó todas las puertas de DB-004 para la unidad y el scope;
- `BLOCKED`: falta resolver una condición antes de cualquier persistencia;
- `NOT_APPLICABLE`: la regla o representación no corresponde a la unidad.

Una unidad no puede aparecer simultáneamente en dos disposiciones dentro del mismo run y misma operación.

La suma de las cuatro particiones deberá reconciliar el universo evaluable fijado por la instancia, después de las exclusiones explícitas previas al universo.

---

#### 48. `BACKFILL_ELIGIBLE`

Una unidad solo puede clasificarse como `BACKFILL_ELIGIBLE` si:

1. produjo `PROPOSED_CHANGE` válido;
2. pertenece al `package_id`;
3. policy coordinate y versiones están resueltas;
4. `version_set_digest` está fijado;
5. fuente o hash esperado está fijado;
6. algoritmo y artifact digest están fijados;
7. scope está completo;
8. no presenta fallo técnico;
9. no presenta bloqueo de política;
10. no presenta conflicto pendiente;
11. no requiere revisión humana pendiente;
12. no requiere resolución estructural pendiente;
13. toda colisión relevante fue clasificada y su disposición permite modificar esa unidad;
14. constraints existentes relevantes no producirán un conflicto no resuelto;
15. consumidores aplicables fueron reconciliados en el nivel exigido por el paquete;
16. existe estrategia de rollback o reversibilidad aplicable;
17. el baseline no está obsoleto al cierre del run;
18. no depende de VITAL;
19. no contiene evidencia protegida fuera de finalidad;
20. el resultado puede revalidarse antes de persistir.

`BACKFILL_ELIGIBLE` no certifica identidad ni autoriza el backfill por sí solo; es la entrada técnica de `DATA-NORM-DB-005`.

---

#### 49. `BLOCKED`

Una unidad `BLOCKED` conserva el valor fuente y queda fuera del backfill.

El bloqueo deberá declarar:

- razón estable;
- evidencia;
- owner;
- tarea o autoridad propietaria;
- condición de salida;
- si requiere repetir todo el run o solo la partición afectada;
- qué digest queda invalidado al resolverlo.

No se permite excluir silenciosamente filas bloqueadas para mejorar el porcentaje de éxito.

---

#### 50. `NO_BACKFILL_REQUIRED`

Una instancia puede concluir que el paquete no necesita modificar datos.

`NO_BACKFILL_REQUIRED` es válido únicamente cuando:

- el universo aplicable fue cubierto;
- no existen `PROPOSED_CHANGE` elegibles;
- los bloqueos existentes, si los hay, no ocultan cambios que deberían evaluarse antes de cerrar esa conclusión;
- las capacidades `NOT_APPLICABLE` están justificadas;
- el resultado es reproducible.

No se crea una escritura vacía para demostrar progreso.

El handoff hacia `DATA-NORM-DB-005` deberá permitir registrar explícitamente que el backfill del paquete es no aplicable o no requerido, según el contrato físico vigente de esa tarea.

---

#### 51. Backfill parcial

Un paquete solo podrá proponer backfill parcial cuando la separación sea explícita y segura.

La parte elegible deberá formar un conjunto cerrado mediante identidad o digest de miembros.

La parte bloqueada deberá permanecer excluida mediante una condición reproducible, no mediante una lista manual mutable.

No se admite backfill parcial cuando:

- las filas elegibles y bloqueadas comparten una restricción que puede cambiar el resultado;
- el resultado depende de resolver primero identidad o estructura;
- la partición altera el scope de las filas bloqueadas;
- una ejecución parcial impediría rollback coherente;
- los consumidores no toleran el estado mixto;
- la regla exige atomicidad del conjunto.

---

#### 52. Manifiesto de readiness para `DATA-NORM-DB-005`

Cada instancia deberá cerrar con un manifiesto lógico que contenga:

```text
package_id
dry_run_id
result_digest
source_population_digest
version_set_digest
eligible_member_set_digest
blocked_member_set_digest
no_change_member_set_digest
not_applicable_member_set_digest
collision_report_digest
evidence_gap_digest
consumer_impact_digest
backfill_required
backfill_readiness
blocking_reasons
revalidation_required_before_write
```

`backfill_readiness` solo puede ser:

```text
READY
BLOCKED
NOT_REQUIRED
```

`READY` no constituye ejecución ni autorización de escritura.

`DATA-NORM-DB-005` deberá revalidar fuente, versión, scope y precondiciones antes de cualquier efecto.

---

#### 53. Handoff hacia `DATA-NORM-DB-005`

El handoff mínimo es:

1. run y digest de DB-004;
2. universo de fuente;
3. miembros `BACKFILL_ELIGIBLE` fijados;
4. miembros bloqueados fijados;
5. miembros `NO_CHANGE` fijados;
6. reglas y versiones;
7. algoritmo y procedencia;
8. colisiones y disposición;
9. consumers/relaciones relevantes;
10. restricciones actuales relevantes;
11. brechas de evidencia;
12. rollback previsto;
13. partición o atomicidad requerida;
14. condición de revalidación antes de escritura;
15. `backfill_readiness`.

DB-005 no podrá recalcular silenciosamente el universo con otra versión y conservar el mismo `dry_run_id`.

Si la fuente cambia materialmente antes del backfill, deberá reevaluarse la partición afectada o repetirse el dry-run según el alcance del drift.

---

#### 54. Fronteras con tareas posteriores

La responsabilidad permanece separada:

| Materia | Propietario |
| --- | --- |
| ejecutar escrituras de backfill aprobadas | `DATA-NORM-DB-005` |
| crear o reforzar constraints después de reconciliar | `DATA-NORM-DB-006` |
| crear índices de búsqueda o unicidad normalizada | `DATA-NORM-DB-007` |
| crear triggers como barrera defensiva final | `DATA-NORM-DB-008` |
| persistir auditoría operacional de valores y efectos | `DATA-NORM-DB-009` |

DB-004 puede medir riesgo y preparar evidencia para esas tareas, pero no absorbe su materialización.

---

#### 55. Reanudación y repetición

Una ejecución interrumpida no se declara completa.

Si el runner usa particiones, cada partición conserva:

- identidad;
- frontera determinista;
- snapshot o corte;
- digest de entrada;
- digest de salida;
- estado;
- errores;
- relación con el run raíz.

Solo se combinan particiones compatibles.

Una partición repetida bajo entrada idéntica deberá producir la misma salida lógica.

Una partición repetida después de drift se registra como otra revisión del run o como recaptura explícita, nunca como continuación invisible de la evidencia anterior.

---

#### 56. Fallos que invalidan el run

Invalidan la certificación del run, como mínimo:

- se detectó una mutación remota;
- el runner no puede demostrar el scope evaluado;
- faltan miembros esperados sin explicación;
- se mezclaron snapshots incompatibles como uno solo;
- cambió una versión durante el run;
- se utilizó `latest` implícito;
- el algoritmo no coincide con su digest;
- query y valor usaron perfiles incompatibles;
- se mezcló VITAL;
- se perdió la separación `NULL`/vacío;
- se usó transitividad no autorizada;
- se confirmó duplicidad por colisión textual;
- se ocultaron fallos técnicos como `NO_CHANGE`;
- el total final no reconcilia el universo;
- el reporte expone material protegido sin finalidad;
- un consumidor bloqueante quedó sin owner o condición de salida.

Un run inválido no entrega miembros a DB-005 como elegibles.

---

#### 57. Evidencia histórica frente a evidencia actual

Los artefactos `DATA-NORM-TRANS-001` a `DATA-NORM-TRANS-003` permanecen válidos como historia aprobada.

La ejecución física de DB-004 deberá distinguir:

```text
HISTORICAL_REFERENCE
CURRENT_REMOTE_CAPTURE
CONTROLLED_REPLAY
```

Una cifra histórica nunca se etiqueta como observación actual.

Una observación actual no reescribe el baseline histórico.

Un replay no afirma que el remoto continúe igual.

---

#### 58. Contrato de reportes

Cada futura instancia deberá producir cuatro familias lógicas de evidencia:

```text
DRY_RUN_RUN_MANIFEST
DRY_RUN_EVALUATION_REPORT
NORMALIZED_COLLISION_REPORT
BACKFILL_READINESS_MANIFEST
```

Cuando existan brechas se agrega:

```text
EVIDENCE_GAP_REPORT
```

Estas identidades son contratos lógicos de contenido. Esta tarea no fija nombres de tablas, buckets, archivos físicos ni rutas de implementación que todavía no hayan sido autorizados por el paquete correspondiente.

---

#### 59. `DRY_RUN_RUN_MANIFEST`

El manifiesto de run conserva:

- identidad de instancia;
- package;
- ambiente;
- autorización;
- fuente y commit;
- baseline;
- snapshot/corte;
- políticas y versiones;
- algoritmo;
- runner;
- scopes;
- población;
- VITAL exclusion proof;
- inicio y fin;
- modo de ejecución;
- estado global;
- digests de artefactos hijos.

No contiene valores empresariales masivos.

---

#### 60. `DRY_RUN_EVALUATION_REPORT`

El reporte de evaluación conserva resultados por unidad o agregados trazables a sus miembros.

Debe permitir reconstruir:

- qué fue evaluado;
- por qué era elegible;
- qué versión se aplicó;
- qué resultado produjo;
- qué cambio habría ocurrido;
- por qué quedó bloqueado cuando aplique;
- qué derivaciones o matches fueron relevantes;
- qué membresía final recibió.

Los agregados no sustituyen el member set cuando DB-005 necesita identificar filas concretas.

---

#### 61. `NORMALIZED_COLLISION_REPORT`

El reporte de colisiones conserva:

- algoritmo y representación;
- profile y locale;
- scope;
- miembros ordenados;
- señales;
- clase primaria;
- evidencia positiva;
- evidencia negativa;
- consumidores/relaciones relevantes;
- disposición;
- owner cuando queda abierto;
- condición de salida;
- digest.

No contiene una columna de “sobreviviente” salvo que exista una decisión canónica previa de la tarea propietaria; DB-004 no la inventa.

---

#### 62. `EVIDENCE_GAP_REPORT`

El reporte de brechas es obligatorio cuando una ausencia puede afectar clasificación, cobertura o readiness.

No se permite representar brechas como:

```text
TODO
pendiente revisar
ver luego
por confirmar
```

sin owner y condición de salida.

La existencia de una brecha no obliga a bloquear todo el paquete si su alcance está demostrado como independiente; sí bloquea las unidades que puedan verse afectadas.

---

#### 63. `BACKFILL_READINESS_MANIFEST`

El manifiesto final es la única salida de DB-004 que DB-005 puede usar para decidir su universo inicial.

Debe reconciliar:

```text
NO_CHANGE
+ BACKFILL_ELIGIBLE
+ BLOCKED
+ NOT_APPLICABLE
= universo evaluable del run
```

También deberá declarar:

- `READY`, `BLOCKED` o `NOT_REQUIRED`;
- exactitud del member set;
- necesidad de revalidación;
- dependencia de resolución humana o estructural;
- si el backfill puede ser parcial;
- condiciones que invalidan la evidencia antes de escribir.

---

#### 64. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

**Requisitos creados:** 0
**Requisitos modificados:** 0

**Justificación:** el dry-run reproducible, la separación de representaciones, la fijación de versiones y algoritmos, los scopes, los estados especiales, la no transitividad, la taxonomía de colisiones, la evidencia positiva y negativa, la prohibición de inferir identidad, la preservación de historia, la seguridad, la paridad, el replay y la ausencia de efectos de escritura ya están protegidos por requisitos DATA vigentes. Esta tarea los materializa como contrato físico por `package_id` sin introducir una nueva semántica empresarial.

---

#### 65. Cobertura de prueba vigente reutilizada

La cobertura existente aplicable incluye, entre otros:

- `TREQ-DATA-116` para agrupación exacta y prohibición de aprobar por muestra elementos no examinados;
- `TREQ-DATA-122` para exigir dry-run, compatibilidad y rollback antes de transición;
- `TREQ-DATA-123` para separación entre fuente, mostrado y derivaciones;
- `TREQ-DATA-124` para paridad de profile, locale, algoritmo y versión;
- `TREQ-DATA-125` para vínculo, vigencia y procedencia de derivaciones;
- `TREQ-DATA-126` y `TREQ-DATA-127` para las claves de forma y acento;
- `TREQ-DATA-159` para replay controlado y no mutación;
- `TREQ-DATA-165` para separar identidad, unicidad, comparación, colisión y decisión;
- `TREQ-DATA-167` para scopes explícitos;
- `TREQ-DATA-168` para impedir que representaciones de búsqueda se conviertan en unicidad;
- `TREQ-DATA-169` para distinguir nulos, vacíos, placeholders y claves parciales;
- `TREQ-DATA-170` para ciclo de vida e historia;
- `TREQ-DATA-171` para pipeline reproducible y no transitividad;
- `TREQ-DATA-172` para las diez clases de colisión;
- `TREQ-DATA-173` para evidencia positiva, negativa, relaciones y consumidores;
- `TREQ-DATA-175` para los falsos positivos jerárquicos;
- `TREQ-DATA-176` para estructura UOM;
- `TREQ-DATA-177` para homónimos funcionales de producto;
- `TREQ-DATA-178` para identidad personal restringida;
- `TREQ-DATA-179` para referencias externas por emisor;
- `TREQ-DATA-180` para identidad y revisión de casos;
- `TREQ-DATA-181` para separar disposición de ejecución;
- `TREQ-DATA-183` y `TREQ-DATA-184` para impedir consolidación y pérdida de historia desde una coincidencia;
- `TREQ-DATA-187` para atribución completa, replay y rectificación;
- `TREQ-DATA-188` para gates previos a enforcement;
- `TREQ-DATA-189` para paridad y exclusión de VITAL;
- `TREQ-DATA-190` para corpus integral, privacidad y ausencia de efectos de escritura.

Esta trazabilidad no modifica el registro 04A.

---

#### 66. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | La batería de build y validadores integrales corresponde al checkout documental después de incorporar el contrato en su archivo propietario. |
| LOCAL | PASS | Artefacto sometido a comprobación estática de título, metadata, secciones obligatorias, continuidad, cardinalidad de evidencia, declaración TREQ cero, UTF-8, LF, whitespace, contenido prohibido y reglas semánticas reproducibles aplicables al archivo aislado. |
| REMOTA | PASS | Fuentes canónicas de `main`, package `@vento/data-normalization`, contratos de transición, registro DATA y metadatos de `vento-os-dev` fueron contrastados; la recaptura de Supabase se ejecutó dentro de transacciones `READ ONLY` y no realizó mutaciones. |
| OPERATIVA | NOT_EXECUTED | Los dry-runs masivos, clasificación física de colisiones, rendimiento, cobertura de consumidores y readiness por `package_id` pertenecen a futuras instancias autorizadas. |
| FÍSICA | NOT_APPLICABLE | Esta aprobación documental no ejecuta DDL, DML, backfills, constraints, índices, triggers, fusiones ni cambios de datos. |

---

#### 67. Decisiones vinculantes

1. DB-004 es `TEMPLATE_PER_PACKAGE`.
2. No existe instancia `GLOBAL`.
3. La ejecución física es posterior al E5 del paquete.
4. La aprobación documental no ejecuta dry-runs físicos.
5. Todo run físico es read-only.
6. Una escritura intentada invalida el runner afectado.
7. La configuración read-only no debe contaminar sesiones pooled.
8. El snapshot o corte debe quedar explícito.
9. Baselines históricos no certifican el remoto presente.
10. Replay histórico no equivale a captura actual.
11. El universo se fija antes de evaluar.
12. El tipo SQL o el nombre de columna no definen elegibilidad.
13. VITAL queda fuera del universo transversal.
14. Policy coordinate y versiones son obligatorias.
15. `latest` implícito está prohibido.
16. Algoritmo, artifact digest y configuración quedan fijados.
17. Query y valor usan el mismo profile, locale, algoritmo y versión.
18. Se reutilizan los estados del preview compartido.
19. `PROPOSED_CHANGE` no equivale a escritura autorizada.
20. `BLOCKED_POLICY` no se degrada a `NO_CHANGE`.
21. Fallos técnicos restan cobertura válida.
22. `NULL` y vacío permanecen separados.
23. La derivación no sustituye el fuente.
24. Una colisión no define identidad.
25. Una colisión no confirma duplicidad.
26. La taxonomía usa diez clases primarias.
27. `PROBABLE_SAME_ENTITY` sigue siendo candidato.
28. La similitud no aplica transitividad implícita.
29. Scope estructural prevalece sobre etiqueta.
30. Los 72 niveles históricos son corpus negativo de scope.
31. UOM y presentaciones conservan estructura.
32. Homónimos funcionales permanecen separados.
33. Nombres de persona no son claves de identidad.
34. Referencias externas conservan emisor y original.
35. Los universos solapados no se suman artificialmente.
36. Toda métrica declara denominador y scope.
37. El dry-run reporta fuentes, derivaciones, colisiones, bloqueos, perfiles, longitud y consumidores.
38. Brechas tienen owner y condición de salida.
39. Evidencia sensible se minimiza.
40. Digests usan orden determinista.
41. Paginación sin orden total no es reproducible.
42. Cada unidad termina en una de cuatro disposiciones de handoff.
43. Las cuatro disposiciones reconcilian el universo evaluable.
44. `BACKFILL_ELIGIBLE` exige ausencia de bloqueos aplicables.
45. `BACKFILL_ELIGIBLE` no autoriza por sí solo la escritura.
46. `NO_CHANGE` no produce escritura redundante.
47. `NOT_APPLICABLE` no se transforma en cero implícito.
48. `BLOCKED` no se oculta para mejorar métricas.
49. Un paquete puede concluir `NOT_REQUIRED` para backfill.
50. El backfill parcial exige member sets disjuntos y seguros.
51. DB-005 revalida antes de escribir.
52. Drift material invalida la evidencia afectada.
53. DB-004 no crea constraints.
54. DB-004 no crea índices.
55. DB-004 no crea triggers.
56. DB-004 no persiste auditoría operacional de efectos.
57. DB-004 no elige sobrevivientes.
58. DB-004 no reasigna relaciones.
59. DB-004 no corrige datos.
60. DB-004 produce evidencia reproducible y un manifiesto de readiness.

---

#### 68. Criterios de aceptación

`DATA-NORM-DB-004` queda documentalmente aceptada cuando:

1. define una sola plantilla por `package_id`;
2. conserva `POST_E5_PACKAGE`;
3. distingue definición documental de ejecución física;
4. define cero mutación como invariante;
5. define transacción read-only sin estado de sesión persistente;
6. fija identidad completa del run;
7. diferencia captura actual, baseline histórico y replay;
8. fija universo y scope antes del cálculo;
9. consume el handoff completo de DB-003;
10. conserva la exclusión de VITAL;
11. exige policy coordinate, versión y algoritmo;
12. reutiliza los estados vigentes de preview;
13. separa cambio candidato de elegibilidad;
14. define detector de colisiones reproducible;
15. conserva las diez clases canónicas;
16. prohíbe identidad por colisión;
17. prohíbe transitividad implícita;
18. conserva `NULL`, vacíos y estados especiales;
19. cubre ciclo de vida y temporalidad;
20. cubre scopes jerárquicos y estructurales;
21. cubre productos, UOM, personas y externos con sus fronteras;
22. define métricas obligatorias del handoff de DB-003;
23. define cobertura por perfil;
24. define distribución de longitud;
25. revisa constraints existentes sin crear otros;
26. incluye consumidores y relaciones;
27. gobierna brechas de evidencia;
28. minimiza datos sensibles;
29. define reproducibilidad y orden determinista;
30. prohíbe agregaciones falsas de universos solapados;
31. particiona cada unidad en cuatro disposiciones exclusivas;
32. define gates para `BACKFILL_ELIGIBLE`;
33. define conducta `BLOCKED`;
34. admite `NO_BACKFILL_REQUIRED`;
35. gobierna backfill parcial;
36. produce un manifiesto cerrado para DB-005;
37. define invalidadores del run;
38. conserva responsabilidades de DB-005 a DB-009;
39. no introduce TREQ nuevos ni modifica 04A;
40. deja `DATA-NORM-DB-005` únicamente como siguiente tarea reservada.

---

#### 69. Límites

Esta tarea no:

- ejecuta un dry-run físico de ningún paquete;
- modifica Supabase;
- crea migraciones;
- crea tablas o vistas;
- crea funciones;
- crea columnas o expresiones;
- crea índices;
- crea constraints;
- crea triggers;
- ejecuta backfills;
- corrige valores;
- crea aliases;
- activa reglas;
- crea review cases;
- decide duplicados;
- elige sobrevivientes;
- fusiona registros;
- desactiva registros;
- reasigna relaciones;
- reescribe historia;
- modifica VITAL;
- desarrolla `DATA-NORM-DB-005`.

---

#### 70. Continuidad

**ÚLTIMA TAREA APROBADA**
`DATA-NORM-DB-003 — Implementar columnas o expresiones normalizadas de búsqueda`

**TAREA ACTUAL APROBADA**
`DATA-NORM-DB-004 — Ejecutar dry-runs y reportes de colisiones`

**SIGUIENTE TAREA RESERVADA**
`DATA-NORM-DB-005 — Ejecutar backfills aprobados por dominio`


### ✅ DATA-NORM-DB-005 — Ejecutar backfills aprobados por dominio

**Estado:** APROBADA
**Tarea anterior:** DATA-NORM-DB-004 — Ejecutar dry-runs y reportes de colisiones
**Tarea siguiente:** DATA-NORM-DB-006 — Implementar constraints después de reconciliar datos
**Tipo de tarea:** Documental; contrato y plantilla R2 repetible por `package_id` para ejecutar únicamente los backfills previamente clasificados como elegibles, con corte de fuente fijado, revalidación antes del efecto, lotes deterministas, checkpoints poscommit, idempotencia, reconciliación, verificación poscommit y recuperación, sin ejecutar DDL, DML, migraciones, backfills, merges, constraints, índices, triggers, activaciones, cambios de consumidores ni modificaciones remotas durante esta definición
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/04_IMPLEMENTACION_FISICA_DE_NORMALIZACION.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`; contrato canónico `TEMPLATE_PER_PACKAGE` cerrado para futuras instancias `DATA-NORM-DB-005::<package_id>`, sujetas a `POST_E5_PACKAGE`, al handoff válido de `DATA-NORM-DB-004::<package_id>`, a reconciliación de drift y a autorización física explícita
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Objetivo

Definir el contrato físico repetible que deberá gobernar cada backfill de normalización después de que `DATA-NORM-DB-004::<package_id>` haya fijado un universo de fuente, haya ejecutado el dry-run aplicable y haya clasificado de forma reproducible qué elementos requieren cambio, cuáles no cambian, cuáles están bloqueados y cuáles no aplican.

El propósito de esta tarea es impedir que un backfill se convierta en una corrección masiva genérica. Cada efecto futuro deberá pertenecer a un `package_id`, utilizar exactamente el corte y conjunto de versiones autorizados, conservar la fuente y la historia exigidas por la semántica del dato, producir un outcome por elemento, poder reanudarse sin duplicar efectos y quedar reconciliado antes de habilitar cualquier restricción posterior.

Esta definición no ejecuta el backfill. La ejecución material pertenece exclusivamente a una futura instancia física autorizada.

#### 2. Resultado canónico

Queda aprobado el contrato:

```text
DATA-NORM-BACKFILL-EXECUTION-CONTRACT-R2@1.0.0
```

Toda futura instancia deberá terminar en uno de estos estados de salida del backfill:

```text
VERIFIED
BLOCKED
FAILED_PARTIAL
ROLLBACK_REQUIRED
COMPENSATION_REQUIRED
NOT_REQUIRED
```

`COMMITTED` no es un estado suficiente para cerrar la instancia: solo `VERIFIED` demuestra que el efecto fue confirmado y reconciliado contra las invariantes aplicables.

#### 3. Topología vinculante

La topología es:

```text
mode = TEMPLATE_PER_PACKAGE
execution_gate = POST_E5_PACKAGE
instance = DATA-NORM-DB-005::<package_id>
```

Consecuencias:

1. no existe una instancia `DATA-NORM-DB-005::GLOBAL`;
2. la tarea documental define una sola plantilla;
3. cada paquete físico conserva identidad, evidencia, ejecución, rollback y cierre propios;
4. un runner reutilizable no convierte varios paquetes en una sola ejecución;
5. ningún backfill puede incluir entidades o dominios ajenos al `package_id` por comodidad operacional.

#### 4. Gate temporal y autorización

Una instancia física solo podrá abrirse cuando:

1. el `package_id` exista y esté aprobado por el flujo E5 aplicable;
2. `E5-GATE-008::<package_id>` esté en `PASS`;
3. las puertas R0/R1 y de paquete aplicables estén satisfechas;
4. el candidato físico, sus dependencias y consumidores estén identificados;
5. el drift aplicable haya sido recapturado y reconciliado;
6. exista autorización física explícita para la instancia exacta;
7. el handoff de `DATA-NORM-DB-004::<package_id>` sea íntegro;
8. el `backfill_readiness` aplicable permita continuar.

La existencia de este contrato documental no satisface ninguna de esas condiciones.

#### 5. Fuentes vinculantes

Cada instancia consume, como mínimo:

- la política y arquitectura de `DATA-NORM-ARC-001` a `DATA-NORM-ARC-012`;
- los contratos de transición de `DATA-NORM-TRANS-001` a `DATA-NORM-TRANS-009` cuando sean aplicables al paquete;
- la materialización vigente de `@vento/data-normalization`;
- `DATA-NORM-DB-001` para versiones, vigencias y conjuntos efectivos;
- `DATA-NORM-DB-002` cuando el paquete dependa de primitivas SQL certificadas;
- `DATA-NORM-DB-003` cuando existan derivaciones físicas de búsqueda;
- `DATA-NORM-DB-004` como autoridad del dry-run y de la partición previa;
- el expediente E5 del `package_id`;
- el estado remoto recapturado al iniciar la instancia;
- los consumidores, relaciones, constraints y writers registrados para el alcance;
- la cobertura vigente del registro canónico de requisitos de prueba.

Una observación legacy o una función de nombre parecido no sustituye estas fuentes.

#### 6. Handoff obligatorio recibido de DB-004

Antes de planificar un efecto, la instancia deberá recibir exactamente:

1. identidad y digest de la corrida de DB-004;
2. universo de fuente fijado;
3. miembros exactos de `BACKFILL_ELIGIBLE`;
4. miembros exactos de `BLOCKED`;
5. miembros exactos de `NO_CHANGE`;
6. reglas y versiones resueltas;
7. algoritmo y procedencia;
8. colisiones y su disposición;
9. consumidores y relaciones relevantes;
10. restricciones actuales relevantes;
11. brechas de evidencia;
12. rollback previsto;
13. partición o atomicidad requerida;
14. condición de revalidación previa a escritura;
15. `backfill_readiness`.

Una ausencia, digest incompatible o miembro sin clasificación bloquea la ejecución.

#### 7. Interpretación de `backfill_readiness`

Solo se aceptan:

| Estado | Conducta de DB-005 |
| --- | --- |
| `READY` | puede preparar la instancia física, pero debe revalidar todas las precondiciones antes del primer efecto |
| `BLOCKED` | no ejecuta DML; conserva la causa, owner y condición de salida |
| `NOT_REQUIRED` | cierra como `NOT_REQUIRED`; no crea escrituras vacías, updates neutrales ni lotes artificiales |

`READY` no equivale a autorización física, no confirma identidad y no elimina la revalidación.

#### 8. Identidad mínima de una corrida

Cada corrida deberá declarar como mínimo:

```text
backfill_run_id
backfill_plan_id
package_id
environment_identity
candidate_commit_sha
migration_history_digest
dry_run_id
dry_run_digest
source_cut_reference
baseline_bundle_digest
policy_version_set
mapping_version_set
version_set_digest
algorithm_provenance
eligible_member_set_digest
blocked_member_set_digest
batch_contract_version
reconciliation_profile
rollback_plan_id
owner_and_authorities
authorization_reference
```

Los identificadores son inmutables dentro de la corrida. Cambiar corte, miembros, política, mapping, algoritmo o conjunto de versiones exige una nueva corrida o una revisión vinculada explícita.

#### 9. Universo de ejecución cerrado

La ejecución trabaja sobre el universo fijado por DB-004.

Debe cumplirse:

```text
SOURCE_UNIVERSE
=
NO_CHANGE
+ BACKFILL_ELIGIBLE
+ BLOCKED
+ NOT_APPLICABLE
```

con miembros disjuntos después de las exclusiones explícitas previas al universo.

Reglas:

1. ningún elemento puede aparecer en dos particiones;
2. ningún elemento evaluable puede quedar sin partición;
3. una muestra no autoriza elementos no examinados;
4. un lote posterior no puede ampliar el universo por similitud, texto, frecuencia ni nueva consulta ad hoc;
5. un elemento nuevo detectado después del corte pertenece a reevaluación, no al backfill vigente.

#### 10. Revalidación inmediatamente anterior al efecto

Antes de modificar cada chunk, la instancia revalida:

1. identidad estable del elemento;
2. versión o hash actual de fuente;
3. coordenada de dominio, entidad y campo;
4. scope y jerarquía aplicables;
5. estado y vigencia;
6. `version_set_digest`;
7. mapping y algoritmo;
8. pertenencia a `BACKFILL_ELIGIBLE`;
9. decisión estructural o de revisión cuando sea necesaria;
10. relaciones y consumers críticos cuando puedan afectar atomicidad;
11. constraints actuales que puedan rechazar el efecto;
12. ausencia de drift material respecto del dry-run.

Si una precondición cambió, el elemento o chunk queda bloqueado. No se recalcula silenciosamente con otra versión conservando el mismo `dry_run_id`.

#### 11. Conducta por partición

`NO_CHANGE`:

- no recibe DML;
- conserva evidencia de que la fuente ya satisface el resultado esperado;
- no se contabiliza como fila transformada.

`BLOCKED`:

- no recibe DML;
- mantiene causa, owner y condición de salida;
- revisión, ambigüedad o fallo técnico nunca se degradan a no-op.

`NOT_APPLICABLE`:

- no recibe DML;
- conserva razón contractual de exclusión.

`BACKFILL_ELIGIBLE`:

- es la única partición que puede producir efectos;
- sigue su modo de mutación aprobado;
- permanece sujeta a precheck, autorización, idempotencia y reconciliación.

#### 12. Aislamiento por dominio y paquete

Un backfill nunca se define como “normalizar todos los textos”.

Cada plan declara:

- dominio propietario;
- entidad;
- campo o componente estructurado;
- representación;
- rol de fuente;
- scope;
- operación;
- regla y versión;
- consumidor;
- target;
- rollback.

Dos coordenadas que compartan función o algoritmo siguen siendo unidades separadas si cambian dominio, identidad, fuente, semántica, autoridad o estrategia de recuperación.

#### 13. Corte de fuente y escrituras concurrentes

Cada instancia deberá escoger y documentar una estrategia compatible con su dominio, por ejemplo:

- snapshot estable;
- high-watermark más delta;
- fencing temporal de writers;
- control optimista por versión/hash;
- combinación explícita de las anteriores.

No existe una estrategia universal.

La estrategia debe demostrar que:

1. una escritura legítima posterior al dry-run no será sobrescrita;
2. la corrida puede distinguir source drift de fallo técnico;
3. el delta concurrente tiene owner y destino;
4. el backfill no crea doble autoridad;
5. el cierre conoce qué universo fue realmente procesado.

#### 14. Lotes, chunks y orden determinista

Cada `batch_id` declara:

```text
stable_order_key
lower_bound
upper_bound
expected_member_count
chunk_size_policy
version_set_digest
source_cut_reference
checkpoint_policy
```

Reglas:

1. se usa keyset o una clave estable equivalente;
2. `OFFSET` no es un mecanismo válido de reanudación;
3. el orden no depende del plan físico ni del orden accidental de filas;
4. un chunk no mezcla versiones, mappings ni modos de coexistencia;
5. el tamaño se deriva de locks, latencia, WAL, carga y presupuesto del ambiente;
6. el lote no asume que “más grande” equivale a “más eficiente”.

#### 15. Máquina de estados del lote

La secuencia canónica es:

```text
PLANNED
-> PRECHECKED
-> ELIGIBLE
-> RUNNING
-> RECONCILING
-> COMMITTED
-> VERIFIED
```

Salidas laterales:

```text
PRECHECKED -> BLOCKED
RUNNING -> FAILED_PARTIAL
RECONCILING -> ROLLBACK_REQUIRED
COMMITTED -> COMPENSATION_REQUIRED
```

Una corrección de un estado terminal crea una corrida vinculada; no edita la historia del lote anterior.

#### 16. Outcome obligatorio por elemento

Cada miembro del universo termina exactamente en uno:

```text
NO_ACTION_REQUIRED
PRESERVED_SOURCE
TRANSFORMED_BY_VERSIONED_RULE
REFERENCE_REMAPPED
MERGED_BY_APPROVED_PLAN
QUARANTINED
REVIEW_REQUIRED
REJECTED_FROM_TARGET
FAILED_TECHNICALLY
```

No existe `SUCCESS` genérico.

El outcome identifica lo ocurrido; no redefine identidad, autoridad de dominio ni estado de activación.

#### 17. Checkpoints

Un checkpoint solo avanza después del commit confirmado del chunk correspondiente.

Debe conservar:

```text
batch_id
chunk_id
last_confirmed_stable_key
source_cut_reference
version_set_digest
committed_member_count
committed_outcome_digest
committed_at
```

Reglas:

1. un chunk fallido no adelanta checkpoint;
2. un timeout consulta primero el resultado confirmado;
3. reanudar comienza después de la última clave confirmada;
4. el checkpoint no sustituye el ledger de outcomes;
5. corregir un checkpoint no borra intentos anteriores.

#### 18. Idempotencia y reintentos

La clave de idempotencia vincula, como mínimo:

- clase de operación;
- actor o servicio;
- entidad y campo;
- identidad estable;
- versión o hash de fuente;
- acción;
- `version_set_digest`;
- correlación empresarial;
- `backfill_run_id`;
- `batch_id` y `chunk_id`.

Misma clave y mismo payload devuelve el outcome ya confirmado sin repetir efectos.

Misma clave con payload, fuente, versión o precondición incompatible produce conflicto y bloquea.

Ningún timeout autoriza crear automáticamente otra operación lógica.

#### 19. Fallo parcial y reanudación

Un fallo de una fila no se presenta como rollback global de un lote ya parcialmente confirmado.

La corrida deberá distinguir:

- efectos confirmados;
- efectos no iniciados;
- outcomes desconocidos;
- fallos técnicos;
- bloqueos de política;
- compensaciones requeridas.

La reanudación:

1. consulta resultados confirmados;
2. omite efectos ya confirmados;
3. conserva el mismo corte y versiones cuando sigan vigentes;
4. bloquea si el corte o las versiones dejaron de ser compatibles;
5. no convierte `FAILED_TECHNICALLY` en decisión empresarial.

#### 20. Modos de efecto permitidos

Una unidad física deberá declarar exactamente qué clase ejecuta:

1. transformación versionada de un valor primario autorizado;
2. materialización o reconstrucción de una derivación;
3. remapeo de una referencia mediante plan explícito;
4. merge con plan de consolidación aprobado;
5. cuarentena o registro de revisión sin alterar el valor empresarial;
6. preservación explícita sin mutación.

La existencia de una forma “mejor” no selecciona automáticamente ninguno de estos modos.

#### 21. Valores primarios y reglas léxicas

Una corrección visible solo puede ejecutarse cuando:

1. el campo resuelva una política elegible;
2. la versión exacta esté fijada;
3. la regla sea aplicable a esa coordenada;
4. DB-004 haya clasificado el elemento como `BACKFILL_ELIGIBLE`;
5. no exista revisión o bloqueo pendiente;
6. el source hash continúe compatible.

Las correcciones de diccionario, capitalización, conectores y excepciones no se expanden por coincidencia textual a otros campos o dominios.

#### 22. Derivaciones

Para claves de búsqueda u otras derivaciones:

1. la fuente no se sobrescribe;
2. la derivación enlaza identidad, campo, source hash, perfil, locale, algoritmo y versión;
3. una derivación obsoleta deja de participar como vigente;
4. reconstruir una derivación no crea identidad;
5. las derivaciones históricas no reinterpretan snapshots;
6. el rollback preferido es reconstruir desde la fuente bajo una versión compatible.

#### 23. Remapeos y merges

Un `REFERENCE_REMAPPED` o `MERGED_BY_APPROVED_PLAN` exige un plan explícito y vigente que declare:

- miembros;
- identidad;
- autoridad por atributo;
- sobreviviente cuando aplique;
- relaciones;
- crosswalk;
- before-image;
- reverse delta o compensación;
- punto de no retorno;
- aprobaciones.

Un plan histórico concreto, incluido cualquier caso previamente analizado, solo puede ejecutarse si pertenece al `package_id` y supera revalidación fresca. No se extrapola a entidades similares.

#### 24. Crosswalk, historia y hechos

Cuando exista consolidación:

1. el crosswalk es aditivo y trazable;
2. hechos históricos no se reescriben por comodidad;
3. referencias externas conservan procedencia;
4. identificadores anteriores siguen interpretables;
5. tombstones, aliases o redirecciones se usan solo por contrato;
6. conteos, saldos, inventario, recetas, compras, producción, ventas, catálogo y remisiones se reconcilian cuando estén dentro del blast radius;
7. no se elimina evidencia para “limpiar” el resultado.

#### 25. Cuarentena y revisión

Los elementos que requieren decisión humana:

- no se transforman;
- no se autoaprueban por volumen;
- no se cierran por SLA vencido;
- no se agrupan fuera de su `review_case_key`;
- conservan fuente, evidencia y scope;
- se entregan al workflow propietario con resultado distinguible.

Una cuarentena no es un backfill exitoso sobre el valor empresarial.

#### 26. Fuentes protegidas

Permanecen fuera de corrección destructiva automática:

- `EXTERNAL_ORIGINAL`;
- snapshots históricos o inmutables;
- evidencia de auditoría;
- secretos y firmas;
- materiales personales o legales sin autoridad explícita;
- valores técnicos gobernados por contrato propio.

Una derivación puede ser reconstruible; la fuente protegida no se sustituye por esa derivación.

#### 27. Frontera VITAL

VITAL permanece fuera del alcance transversal de Vento OS.

La coexistencia en el mismo proyecto, schema, infraestructura o dependencia no autoriza:

- aplicar reglas de Vento OS;
- incluir datos VITAL en el universo;
- crear crosswalks compartidos;
- ejecutar backfills;
- usar su comportamiento como evidencia de paridad.

Cualquier interacción necesaria se trata como frontera explícita, no como extensión del paquete.

#### 28. Frontera transaccional y seguridad

Toda mutación futura deberá ocurrir bajo una frontera autorizada que:

1. autentique actor o servicio;
2. autorice finalidad y scope;
3. valide idempotencia;
4. cargue estado actual;
5. resuelva la semántica mediante la autoridad correspondiente;
6. revalide concurrencia, relaciones y restricciones aplicables;
7. confirme efecto y auditoría raíz de forma compatible con el contrato;
8. devuelva el outcome confirmado.

Una credencial privilegiada no equivale a permiso semántico.

Las escrituras directas ordinarias sobre campos gobernados permanecen prohibidas.

#### 29. Objetos auxiliares, RLS y grants

Si una instancia necesita persistencia auxiliar para ledger, checkpoints, crosswalks o outcomes:

1. la necesidad se demuestra por paquete;
2. el objeto se versiona en `vento-shell`;
3. schema, ownership, grants, RLS y exposición se revisan explícitamente;
4. una tabla en schema expuesto no queda abierta por defecto;
5. un objeto auxiliar no se convierte en fuente empresarial;
6. su retención y rollback se fijan antes de uso.

Esta tarea no presupone que tales objetos ya existan ni fija nombres físicos universales.

#### 30. Rendimiento y tamaño de chunk

La instancia medirá al menos:

- filas por segundo;
- tiempo por chunk;
- p50/p95/p99 cuando aplique;
- lock wait;
- deadlocks;
- timeouts;
- WAL o presión equivalente relevante;
- error rate;
- impacto sobre writers;
- backlog y tiempo estimado de drenaje.

El chunk size se ajusta dentro de límites aprobados sin cambiar orden, semántica, versiones ni resultados.

Una optimización que cambie resultados exige nueva versión o reevaluación; no se acepta como ajuste operativo neutro.

#### 31. Reconciliación poscommit

Cada chunk y el conjunto completo deberán reconciliar:

```text
expected_members
attempted_members
committed_members
verified_members
outcomes_by_class
blocked_members
failed_members
unknown_outcomes
source_digest_before
source_digest_after
relationship_digest_before
relationship_digest_after
child_effects_pending
```

Invariantes:

1. todo miembro tiene outcome;
2. no existen efectos sobre miembros fuera del universo;
3. no existen miembros confirmados dos veces;
4. fuente protegida permanece intacta;
5. los cambios observados son exactamente los autorizados;
6. los conteos coinciden con los conjuntos de IDs, no solo con totales;
7. diferencias inexplicadas bloquean `VERIFIED`.

#### 32. Relaciones y consumidores

La igualdad de filas antes y después no demuestra integridad.

Cuando el backfill afecte referencias, se verifica:

- FKs;
- relaciones sin FK conocidas;
- jerarquías;
- crosswalks;
- consumidores síncronos;
- jobs/imports;
- APIs/RPC;
- integraciones;
- proyecciones y copias;
- eventos y efectos hijos.

Una referencia huérfana, ambigua o duplicada impide cerrar como `VERIFIED`.

#### 33. Verificación posbackfill

La evidencia poscommit deberá cubrir los carriles aplicables de:

1. fuente y outcomes;
2. búsqueda y descubrimiento;
3. relaciones y crosswalks;
4. integraciones y contratos;
5. propagación y proyecciones;
6. seguridad y frontera;
7. rendimiento y operabilidad.

Para integridad autoritativa, seguridad, originales y relaciones críticas la tolerancia es cero.

Una unidad `NOT_REQUIRED` demuestra ausencia de mutación; no omite la verificación de que el universo quedó correctamente excluido.

#### 34. Rollback y recuperación

Cada unidad declara antes de ejecutar una de las clases:

```text
REVERSIBLE_THEN_COMPENSATABLE
REBUILD_DERIVATION
NO_MUTATION_TO_ROLL_BACK
ESCALATE_RECOVERY
```

La selección se deriva del tipo de efecto y del punto de no retorno.

Rollback:

- no borra decisiones, outcomes, checkpoints, crosswalks ni evidencia;
- no reactiva versiones retiradas, inválidas o incompatibles;
- no pisa escrituras legítimas posteriores;
- no usa una clave derivada como sustituto de la fuente;
- conserva causalidad entre efecto original y recuperación.

#### 35. Punto de no retorno y compensación

Antes del punto de no retorno puede ser válida una inversa exacta si la fuente, relaciones y hechos posteriores lo permiten.

Después del punto de no retorno:

1. se congela avance;
2. se preservan efectos confirmados;
3. se clasifican outcomes desconocidos;
4. se evita dividir hechos por heurística;
5. se utiliza compensación o forward-fix autorizado;
6. el cierre exige nueva reconciliación.

Rollback de código, rollback de configuración y recuperación de datos son operaciones distintas.

#### 36. Separación frente a activación

Completar un backfill no activa reglas sobre nuevas escrituras.

DB-005 no:

- cambia el modo de enforcement;
- crea cohortes de rollout;
- activa `OBSERVE_ONLY`, `WARN_EXPLICIT_CONFIRMATION`, `REVIEW_REQUIRED_BEFORE_WRITE` ni `ENFORCE_CERTIFIED_UNIQUENESS`;
- convierte shadow en dual write;
- promueve versiones por el hecho de haber corregido historia.

La activación conserva su contrato y sus puertas independientes.

#### 37. Separación frente a constraints

`DATA-NORM-DB-006` conserva la implementación de constraints después de reconciliar datos.

DB-005:

- puede medir conflictos que impedirían un constraint;
- puede producir evidencia de limpieza y reconciliación;
- no crea, activa, valida como definitiva ni endurece una restricción de unicidad o integridad.

El handoff a DB-006 solo puede declarar datos reconciliados, no constraint habilitado.

#### 38. Separación frente a índices, triggers y auditoría operacional

`DATA-NORM-DB-007` conserva índices.

`DATA-NORM-DB-008` conserva triggers defensivos.

`DATA-NORM-DB-009` conserva auditoría operacional física.

DB-005 no absorbe esas responsabilidades por conveniencia. Los objetos auxiliares estrictamente necesarios para ejecutar el propio backfill deberán justificarse como parte del paquete y no adelantar el diseño propietario de las tareas posteriores.

#### 39. Artefactos físicos futuros

Cuando una instancia sea autorizada, toda modificación Vento sobre Supabase deberá:

1. originarse en `vento-shell`;
2. quedar versionada;
3. declarar paquete y ambiente;
4. conservar forward path y recovery path;
5. incluir runner o migración solo cuando el tipo de efecto lo requiera;
6. registrar parámetros, digests y precondiciones sin secretos;
7. ser reproducible desde el repositorio;
8. no depender de una edición manual aislada en el dashboard.

Esta definición no fija nombres de migración, tablas, funciones o scripts que todavía no existan.

#### 40. Handoff hacia DB-006

Una instancia puede entregar continuidad a `DATA-NORM-DB-006::<package_id>` solo si:

1. el backfill terminó `VERIFIED` o `NOT_REQUIRED`;
2. los miembros de DB-004 están totalmente reconciliados;
3. no quedan `unknown_outcomes`;
4. no quedan efectos hijos críticos pendientes;
5. integridad referencial y crosswalks aplicables están reconciliados;
6. bloqueos restantes están explícitamente fuera del universo de enforcement;
7. source cut, versiones, algoritmo y digests de cierre están registrados;
8. el estado de constraints actuales fue recapturado;
9. el rollback o recovery path continúa disponible;
10. el paquete declara qué invariantes pueden evaluarse en DB-006.

`FAILED_PARTIAL`, `ROLLBACK_REQUIRED`, `COMPENSATION_REQUIRED` o un `BLOCKED` material impiden el handoff.

#### 41. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

**Requisitos creados:** 0

**Requisitos modificados:** 0

**Justificación:** la tarea materializa por `package_id` obligaciones ya aprobadas sobre separación decisión-ejecución, lifecycle, versionado, idempotencia, revalidación, lotes, backfills, outcomes, concurrencia, seguridad, relaciones, rollback y fronteras de activación y unicidad. No introduce una nueva semántica empresarial ni un nuevo riesgo sin cobertura.

#### 42. Cobertura de prueba vigente reutilizada

La cobertura existente aplicable incluye:

- `TREQ-DATA-113` para separar decisión y ejecución;
- `TREQ-DATA-145` a `TREQ-DATA-147` para lifecycle, activación y coexistencia;
- `TREQ-DATA-149` a `TREQ-DATA-160` para auditoría, outcomes, idempotencia, concurrencia, replay y recuperación;
- `TREQ-DATA-162` a `TREQ-DATA-164` para decisiones, correlación y corpus integral;
- `TREQ-DATA-165` a `TREQ-DATA-190` para identidad, colisiones, relaciones, consolidación, modos y transición;
- `TREQ-DATA-192` a `TREQ-DATA-214` para autoridad de capas, RPC, atomicidad, escrituras directas, lotes, seguridad, rendimiento, compatibilidad y certificación.

Estas referencias son trazabilidad de cobertura vigente; no representan cambios del registro.

#### 43. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | El build documental completo corresponde al checkout de la rama de tarea después de incorporar el bloque. |
| LOCAL | PASS | Artefacto contrastado contra contrato de entrega, política de formato, política de desarrollo, metadata obligatoria, continuidad, cardinalidad de evidencia, declaración TREQ cero, UTF-8, LF y reglas de higiene del entregable. |
| REMOTA | PASS | `main`, owner R, contratos de transición, 04A DATA, package `@vento/data-normalization` y metadatos read-only de `vento-os-dev` fueron contrastados; PostgreSQL 17.6 y ausencia de infraestructura canónica ya materializada de backfill/checkpoint/crosswalk fueron observados sin mutaciones. |
| OPERATIVA | NOT_EXECUTED | Lotes, locks, throughput, writers, reanudación, reconciliación y recuperación pertenecen a futuras instancias físicas autorizadas. |
| FÍSICA | NOT_APPLICABLE | Esta aprobación documental no ejecuta DDL, DML, migraciones, backfills, merges, constraints, índices, triggers ni cambios remotos. |

#### 44. Decisiones vinculantes

1. DB-005 es `TEMPLATE_PER_PACKAGE`, nunca global.
2. El gate físico es `POST_E5_PACKAGE`.
3. DB-004 fija el universo y DB-005 no lo amplía silenciosamente.
4. Solo `BACKFILL_ELIGIBLE` puede producir efectos.
5. `NOT_REQUIRED` produce cero escrituras artificiales.
6. Toda escritura revalida fuente, scope, estado y versiones.
7. El source drift bloquea o exige reevaluación.
8. Los lotes usan orden estable y no `OFFSET`.
9. El checkpoint avanza únicamente después de commit confirmado.
10. Cada elemento tiene exactamente un outcome cerrado.
11. No existe outcome genérico `SUCCESS`.
12. Reintentos recuperan el resultado previo antes de repetir un efecto.
13. Éxito parcial permanece explícito.
14. `COMMITTED` no equivale a `VERIFIED`.
15. La reconciliación compara identidades y digests, no solo conteos.
16. Una derivación nunca adquiere autoridad sobre la fuente.
17. Merge y remapeo requieren plan explícito y revalidado.
18. Crosswalk e historia se preservan.
19. Personas, originales, snapshots, secretos y VITAL conservan fronteras reforzadas.
20. Credenciales privilegiadas no sustituyen autorización semántica.
21. El backfill no activa writers ni enforcement.
22. DB-006 conserva constraints.
23. DB-007 conserva índices.
24. DB-008 conserva triggers.
25. DB-009 conserva auditoría operacional física.
26. Rollback, configuración y compensación son operaciones distintas.
27. Toda modificación futura de Supabase se origina y versiona en `vento-shell`.
28. La tarea crea o modifica cero requisitos de prueba.

#### 45. Criterios de aceptación

La definición queda documentalmente aceptable cuando:

1. conserva topología y gate vigentes;
2. consume el handoff completo de DB-004;
3. distingue `READY`, `BLOCKED` y `NOT_REQUIRED`;
4. protege las cuatro particiones del universo;
5. exige revalidación antes del efecto;
6. fija corrida, lote, chunk, checkpoint e idempotencia;
7. conserva los estados de lote aprobados;
8. conserva los nueve outcomes por elemento;
9. impide reintentos duplicados;
10. trata fallos parciales sin falsear rollback global;
11. diferencia transformación, derivación, remapeo, merge, cuarentena y preservación;
12. protege fuente, originales, snapshots e historia;
13. conserva aislamiento de VITAL;
14. exige reconciliación poscommit y `VERIFIED`;
15. declara rollback y punto de no retorno antes de ejecutar;
16. no absorbe activación, constraints, índices, triggers ni auditoría operacional;
17. deja un handoff cerrado hacia DB-006;
18. mantiene cero cambios TREQ;
19. contiene exactamente las cinco clases de evidencia requeridas;
20. termina con la continuidad canónica y no desarrolla la siguiente tarea.

#### 46. Límites

Esta tarea documental no:

- ejecuta backfills;
- crea ni modifica migraciones;
- ejecuta DDL o DML;
- consulta o modifica datos empresariales como parte del artefacto;
- materializa runners, ledgers, checkpoints o crosswalks;
- decide nuevos duplicados;
- selecciona sobrevivientes no aprobados;
- corrige reglas o diccionarios;
- activa reglas sobre writers;
- crea constraints;
- crea índices;
- crea triggers;
- implementa auditoría operacional;
- modifica grants, RLS, Auth, Storage, Realtime, Edge Functions, cron o secretos;
- modifica el registro 04A;
- autoriza ninguna instancia física;
- desarrolla `DATA-NORM-DB-006`.

---

#### 47. Continuidad

**ÚLTIMA TAREA APROBADA**
`DATA-NORM-DB-004 — Ejecutar dry-runs y reportes de colisiones`

**TAREA ACTUAL APROBADA**
`DATA-NORM-DB-005 — Ejecutar backfills aprobados por dominio`

**SIGUIENTE TAREA RESERVADA**
`DATA-NORM-DB-006 — Implementar constraints después de reconciliar datos`


### ✅ DATA-NORM-DB-006 — Implementar constraints después de reconciliar datos

**Estado:** APROBADA
**Tarea anterior:** DATA-NORM-DB-005 — Ejecutar backfills aprobados por dominio
**Tarea siguiente:** DATA-NORM-DB-007 — Implementar índices de búsqueda y unicidad normalizada
**Tipo de tarea:** Documental; contrato y plantilla R2 repetible por `package_id` para clasificar, diseñar, secuenciar, aplicar y verificar constraints declarativos únicamente después de reconciliar el universo del paquete, preservando identidad, scope, historia, versiones, rollback y fronteras con índices, triggers y auditoría, sin materializar DDL, DML, migraciones, constraints, índices, triggers ni cambios remotos durante esta definición
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/04_IMPLEMENTACION_FISICA_DE_NORMALIZACION.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`; contrato canónico `TEMPLATE_PER_PACKAGE` cerrado para futuras instancias `DATA-NORM-DB-006::<package_id>`, sujetas a `POST_E5_PACKAGE`, al handoff válido de `DATA-NORM-DB-005::<package_id>`, al expediente E5 aplicable, a recaptura de drift y a autorización física explícita
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Objetivo

Definir el contrato físico-documental que determina cuándo un invariante de un paquete puede convertirse en constraint de PostgreSQL después de reconciliar datos, qué clase de constraint corresponde, qué evidencia debe existir antes de endurecerlo, cómo se despliega y valida sin confundir identidad con coincidencia textual, y qué responsabilidades permanecen reservadas a las tareas posteriores.

DB-006 no declara que todo dato reconciliado deba producir un constraint. La salida válida de una futura instancia puede ser un constraint aplicable, un handoff a otra tarea, un bloqueo explícito o la conclusión documentada de que no se requiere enforcement declarativo adicional.

#### 2. Resultado canónico

Cada futura instancia `DATA-NORM-DB-006::<package_id>` deberá producir una matriz cerrada de invariantes candidatos y asignar exactamente una disposición a cada uno.

La instancia deberá distinguir como mínimo:

- invariantes de dominio representables mediante `CHECK`;
- integridad referencial representable mediante `FOREIGN KEY`;
- obligatoriedad representable mediante `NOT NULL`;
- identidad directa representable mediante `PRIMARY KEY`;
- unicidad directa sobre columnas representable mediante `UNIQUE`;
- unicidad que depende de expresión, predicado, representación normalizada o índice especializado y por tanto pertenece al handoff de DB-007;
- invariantes que permanecen en servicio/RPC porque no son declarativos, locales a una fila o relacionalmente expresables de forma segura;
- candidatos bloqueados por evidencia, drift, colisiones, historia, consumidores, semántica o recuperación insuficientes;
- casos donde no se requiere un nuevo constraint.

#### 3. Topología y cardinalidad vinculantes

DB-006 conserva:

```text
mode = TEMPLATE_PER_PACKAGE
execution_gate = POST_E5_PACKAGE
instance_pattern = DATA-NORM-DB-006::<package_id>
```

No existe `DATA-NORM-DB-006::GLOBAL`.

La aprobación documental de esta tarea define la plantilla. No materializa una instancia física ni convierte automáticamente un `package_id` en ejecutable.

#### 4. Gate temporal

Una instancia física solo podrá evaluarse después del gate `POST_E5_PACKAGE`.

El gate requiere que el paquete aplicable exista y que su expediente E5 sea compatible con el invariante que se pretende endurecer. Un constraint no puede utilizarse para completar retroactivamente decisiones de dominio, identidad, alcance, autorización o transición que E5 todavía no haya cerrado.

#### 5. Fuentes vinculantes de una instancia

Una futura instancia deberá consumir como mínimo:

1. el expediente E5 del `package_id`;
2. el handoff de `DATA-NORM-DB-005::<package_id>`;
3. las decisiones aplicables de identidad, unicidad y scope;
4. la semántica vigente de normalización y comparación;
5. el estado remoto recapturado de tablas, columnas, constraints e índices;
6. los writers, RPC, jobs, imports y consumidores que puedan producir o depender del invariante;
7. los contratos de rollback y recuperación aplicables;
8. los requisitos de prueba vigentes;
9. el estado de RLS, grants y fronteras de producto cuando el objeto sea alcanzable por rutas expuestas;
10. la historia de migraciones del paquete y su digest.

Ningún nombre parecido de constraint, índice o helper legacy adquiere autoridad por coincidencia nominal.

#### 6. Handoff obligatorio recibido de DB-005

DB-006 no inicia enforcement si DB-005 no entrega un cierre utilizable.

El handoff mínimo deberá declarar:

- `package_id`;
- `backfill_run_id` o evidencia explícita de `NOT_REQUIRED`;
- `source_cut_reference`;
- `version_set_digest`;
- mapping y algoritmo aplicables;
- estado final de cada unidad relevante;
- cero `unknown_outcomes`;
- cero efectos hijos críticos sin reconciliar;
- integridad referencial y crosswalks aplicables reconciliados;
- bloqueos restantes explícitamente fuera del universo del invariante;
- source hashes y conteos de cierre;
- estado de constraints e índices recapturado;
- rollback o recovery path vigente;
- invariantes que el paquete declara elegibles para evaluación en DB-006.

`FAILED_PARTIAL`, `ROLLBACK_REQUIRED`, `COMPENSATION_REQUIRED` o un bloqueo material impiden endurecer el invariante afectado.

#### 7. Revalidación inmediatamente anterior al enforcement

La evidencia de DB-005 es una entrada, no una reserva indefinida del estado.

Antes de cualquier materialización futura DB-006 deberá volver a comprobar:

1. identidad del ambiente;
2. commit candidato;
3. historial de migraciones;
4. definición de tabla y columnas;
5. constraints e índices vigentes;
6. conteos y hashes relevantes;
7. ausencia de nuevas filas violatorias desde el corte;
8. writers actualmente habilitados;
9. versiones de política, mapping y algoritmo;
10. consumidores y relaciones afectados;
11. rollback disponible;
12. autorización física de la instancia.

Drift material invalida la parte de la evidencia que dependa de ese estado.

#### 8. Disposiciones cerradas por invariante

Cada candidato termina exactamente en una de estas disposiciones:

| Disposición | Significado |
| --- | --- |
| `NO_CONSTRAINT_REQUIRED` | el estado correcto no exige un nuevo constraint declarativo |
| `CHECK_CONSTRAINT` | invariante de fila expresable de forma declarativa y acotada |
| `FOREIGN_KEY_CONSTRAINT` | relación estable con identidad referencial explícita |
| `NOT_NULL_CONSTRAINT` | ausencia prohibida por contrato y datos reconciliados |
| `DIRECT_UNIQUE_CONSTRAINT` | unicidad certificada sobre columnas directas y scope completo |
| `PRIMARY_KEY_CONSTRAINT` | identidad material estable, no nula y certificada |
| `HANDOFF_TO_DB_007` | enforcement requiere índice de expresión, predicado, representación normalizada o estrategia de índice especializada |
| `SERVICE_OR_RPC_INVARIANT` | la regla requiere semántica, estado externo, revisión, fuzzy matching, autorización contextual o workflow |
| `BLOCKED` | falta una precondición material para decidir o aplicar de forma segura |

Ninguna disposición se infiere únicamente a partir del nombre actual de un índice o de la existencia de valores repetidos.

#### 9. Condiciones universales de elegibilidad

Antes de clasificar un candidato como físicamente aplicable deberán demostrarse simultáneamente:

1. invariante aprobado y propietario conocido;
2. coordenada completa de dominio y scope;
3. población de datos reconciliada;
4. casos positivos y negativos definidos;
5. ausencia de violaciones no resueltas;
6. semántica de `NULL`, ausencia y temporalidad definida;
7. consumidores compatibles;
8. writers inventariados;
9. rollback o compensación disponible;
10. costo de lock y validación comprendido;
11. compatibilidad con particionado cuando aplique;
12. efecto sobre índices conocido;
13. error y conducta de rechazo conocidos;
14. ausencia de invasión sobre DB-007, DB-008 o DB-009;
15. VITAL fuera del alcance transversal de Vento OS.

#### 10. Prohibición de inferir identidad desde texto

Coincidencia exacta, forma equivalente, clave de búsqueda, plegado de tildes, alias, tokenización, transliteración, similitud, slug, `lower`, `trim`, frecuencia o popularidad no constituyen por sí mismos identidad estable.

DB-006 no convierte:

- una clave de búsqueda en clave empresarial;
- una colisión en duplicado confirmado;
- un nombre coincidente en relación;
- un resultado de ranking en sobreviviente;
- un helper legacy en política de unicidad;
- un índice único existente en evidencia de que su semántica actual sea correcta.

La identidad o unicidad endurecida debe estar certificada por su contrato de dominio y scope.

#### 11. `CHECK`

Un `CHECK_CONSTRAINT` solo es elegible cuando la regla:

- depende de columnas de la fila actual;
- es determinista respecto de los datos persistidos que evalúa;
- no necesita subconsultas ni conocimiento global;
- no ejecuta revisión humana;
- no consulta servicios externos;
- no decide identidad por similitud;
- no depende de selección implícita de versión;
- conserva exactamente la semántica de `NULL` definida por el dominio;
- tiene corpus positivo y negativo suficiente.

Un `CHECK` que evalúa `UNKNOWN` no equivale a `NOT NULL`; si la ausencia está prohibida, la obligatoriedad debe declararse separadamente.

#### 12. `FOREIGN KEY`

Un `FOREIGN_KEY_CONSTRAINT` exige:

1. identidad estable de la entidad referenciada;
2. columnas referenciadas con unicidad válida para ese propósito;
3. crosswalks y remapeos reconciliados;
4. cero referencias huérfanas dentro del universo aplicable;
5. definición explícita de `MATCH` cuando la clave sea compuesta y nullable;
6. decisión explícita de `ON UPDATE`;
7. decisión explícita de `ON DELETE`;
8. impacto conocido sobre escrituras y locks de ambas relaciones;
9. conducta histórica definida para referencias que deban conservar identidad anterior.

Ninguna FK se crea para “arreglar” relaciones aún ambiguas.

#### 13. `NOT NULL`

`NOT_NULL_CONSTRAINT` exige que el dominio distinga claramente entre:

- ausencia válida;
- desconocido;
- no aplicable;
- pendiente;
- valor aún no capturado;
- placeholder;
- vacío textual;
- valor obligatorio.

La ausencia de nulos en una muestra no autoriza `NOT NULL`.

Antes del enforcement futuro deberá probarse el universo completo aplicable o una garantía equivalente y reproducible que cubra las filas existentes.

#### 14. `UNIQUE` directo

`DIRECT_UNIQUE_CONSTRAINT` solo cubre columnas directas cuya combinación representa una unicidad certificada.

Debe declararse:

- entidad y dominio;
- columnas determinantes;
- scope completo;
- padre o camino cuando aplique;
- estado y vigencia cuando afecten unicidad;
- semántica de nulos;
- consumidores;
- excepción permitida, si existe;
- rollback;
- comportamiento concurrente.

Una consulta previa de “no existen duplicados” no sustituye protección atómica.

#### 15. `PRIMARY KEY`

`PRIMARY_KEY_CONSTRAINT` solo procede cuando la combinación elegida constituye identidad material estable y permanente del registro.

No se promociona a primary key:

- una representación de búsqueda;
- un código temporal;
- un valor derivado mutable;
- una etiqueta;
- un nombre;
- una clave externa sin contrato de estabilidad;
- una combinación cuyo scope aún pueda cambiar.

La existencia de una PK legacy no implica que DB-006 deba recrearla o redefinirla.

#### 16. Semántica de `NULL` en unicidad

Para cada unicidad directa deberá declararse expresamente si múltiples `NULL`:

- representan ausencias independientes y pueden coexistir; o
- deben considerarse equivalentes para el invariante certificado.

PostgreSQL 17 trata por defecto los nulos como distintos en unicidad. `NULLS NOT DISTINCT` solo es admisible cuando el contrato de dominio exige tratar esos nulos como equivalentes.

No se usará una técnica de `COALESCE` con sentinel para alterar semántica de nulos salvo que exista una representación estructural explícitamente aprobada; si la solución depende de una expresión o predicado, la responsabilidad física se clasifica para DB-007.

#### 17. Unicidad compuesta y scope

Una unicidad compuesta deberá incluir toda dimensión necesaria para distinguir legítimamente entidades.

Según el dominio puede requerir, entre otras:

- tenant o producto;
- sede;
- ubicación;
- padre o camino;
- contexto funcional;
- emisor o fuente;
- estado;
- intervalo de vigencia;
- producto;
- UOM estructural;
- identificador externo estable.

Omitir una dimensión para simplificar el constraint es un error semántico, no una optimización.

#### 18. Frontera con DB-007

DB-006 no materializa los índices de búsqueda ni la unicidad normalizada reservados a DB-007.

El resultado será `HANDOFF_TO_DB_007` cuando el enforcement dependa de:

- expresión de normalización;
- `lower`, `trim`, `unaccent`, transliteración o helper equivalente como componente de identidad;
- predicado parcial;
- representación derivada de búsqueda;
- índice de expresión;
- índice parcial;
- estrategia de ranking;
- búsqueda tolerante;
- unicidad sobre una proyección normalizada.

DB-006 puede definir la invariancia y los prerequisitos que DB-007 debe conservar, pero no absorbe su materialización.

#### 19. Índices existentes y constraints respaldados por índice

Un índice único existente se clasifica antes de reutilizarse.

Para considerar un índice como respaldo de un `UNIQUE` o `PRIMARY KEY` directo deberá demostrarse que:

- es b-tree compatible;
- está válido y listo;
- no es parcial;
- no contiene expresiones;
- usa las columnas exactas del invariante;
- su ordenamiento y operator classes son compatibles;
- no está ligado a una semántica legacy incompatible;
- no cambia el scope certificado.

Un índice parcial o con expresiones permanece índice; no se reinterpreta como constraint declarativo equivalente.

#### 20. Staging con `NOT VALID`

Cuando PostgreSQL y la forma del objeto lo permitan, una futura instancia podrá separar incorporación y validación.

`NOT VALID` se limita contractualmente a:

- `CHECK`;
- `FOREIGN KEY`.

No se declara `NOT VALID` para `UNIQUE` ni `PRIMARY KEY`.

El staging no equivale a cierre: mientras `convalidated = false`, el paquete debe declarar expresamente que el constraint todavía no certifica todas las filas históricas.

#### 21. Validación de constraints staged

Un `CHECK` o `FOREIGN KEY` staged solo alcanza estado cerrado después de una validación completa satisfactoria sobre el universo histórico aplicable.

La evidencia deberá conservar:

- constraint exacto;
- definición exacta;
- relación;
- ambiente;
- commit;
- migration digest;
- source cut;
- inicio y fin;
- resultado;
- locks observados;
- filas violatorias, si existieran;
- conteos y reconciliación posteriores.

Un fallo de validación no autoriza borrar evidencia ni relajar silenciosamente la definición.

#### 22. `UNIQUE` y `PRIMARY KEY` no usan el flujo `NOT VALID`

La incorporación de `UNIQUE` o `PRIMARY KEY` requiere que la población existente satisfaga el invariante en el momento de su materialización.

Si una estrategia futura utiliza un índice único preexistente para adjuntar un constraint, ese índice debe cumplir las restricciones de PostgreSQL para `USING INDEX`.

La necesidad de un índice parcial o de expresión descalifica ese camino y conserva el objeto bajo la frontera de DB-007.

#### 23. Locks, scans y presupuesto operativo

Cada instancia deberá estimar antes de materializar:

- tablas afectadas;
- tamaño y cardinalidad;
- forma de lock;
- tablas referenciadas;
- scans requeridos;
- escrituras concurrentes;
- ventana operativa;
- timeout;
- riesgo de deadlock;
- impacto de índices;
- observabilidad;
- condición de aborto.

La corrección semántica no justifica una operación físicamente insegura.

#### 24. Constraints sobre tablas particionadas

Antes de elegir una estrategia se recaptura si la tabla es particionada o participa en una jerarquía de particiones.

Las restricciones específicas de PostgreSQL para:

- `UNIQUE`;
- `PRIMARY KEY`;
- `FOREIGN KEY`;
- `NOT VALID`;
- attach/validate;

se consideran parte del gate físico.

No se generaliza desde una tabla no particionada hacia una particionada.

#### 25. Deferrabilidad

`DEFERRABLE` no se usa como solución genérica a errores de orden.

Una futura instancia solo podrá emplear deferrabilidad cuando:

1. PostgreSQL la soporte para la clase de constraint;
2. la transacción empresarial requiera legítimamente una violación intermedia;
3. el estado final de la transacción deba satisfacer el invariante;
4. callers y RPC conozcan esa semántica;
5. el impacto de rendimiento esté medido.

En ausencia de necesidad explícita, la conducta inmediata conserva preferencia.

#### 26. Acciones referenciales

`ON UPDATE` y `ON DELETE` se deciden por semántica de la relación, no por conveniencia.

Cada FK declarará explícitamente una de las conductas soportadas y justificará por qué:

- preserva historia;
- no elimina hechos por cascada accidental;
- no deja referencias ambiguas;
- no transforma una desactivación en borrado;
- no atraviesa fronteras de producto;
- mantiene idempotencia y rollback.

`CASCADE` nunca se infiere por tratarse de una relación “hija”.

#### 27. Naming y trazabilidad de constraints

Todo constraint nuevo deberá tener identidad estable y trazable.

El expediente físico conservará como mínimo:

- `constraint_key` lógico;
- schema;
- tabla;
- columnas;
- clase;
- definición;
- política o invariante propietario;
- `package_id`;
- migration id;
- commit;
- versión;
- estado de validación;
- supersesión cuando aplique.

El nombre físico no sustituye esa trazabilidad.

#### 28. Migraciones forward-only

Toda materialización futura de DB-006 se origina y versiona en `vento-shell`.

No se considera canónico:

- crear el constraint solo desde Dashboard;
- cambiarlo manualmente y documentarlo después;
- ocultar drift editando historial;
- depender de SQL no versionado;
- aplicar una definición distinta entre ambientes bajo el mismo identificador.

La transición normal es forward-only y conserva una estrategia separada de recuperación.

#### 29. Drift

Antes de cada etapa física se recapturan:

- definición de tabla;
- columnas;
- nulabilidad;
- constraints;
- índices;
- particiones;
- triggers relevantes;
- RLS/grants cuando puedan afectar la ruta de escritura;
- writers;
- migration history.

Drift material produce `BLOCKED` hasta reconciliación.

#### 30. Idempotencia y replay

Reintentar una materialización no puede:

- duplicar constraints;
- cambiar el significado bajo el mismo identificador;
- asumir que un nombre existente equivale a la definición esperada;
- marcar como validado un constraint aún no validado;
- continuar después de un timeout sin consultar el estado real;
- ejecutar una definición nueva con la idempotency key de una anterior.

Misma identidad física y misma definición confirmada producen no-op verificable; identidad igual con definición distinta produce conflicto.

#### 31. Versiones y procedencia

Cada constraint gobernado se vincula al mismo corte semántico que justificó su invariante.

La instancia conserva:

- `resolved_version_set`;
- `version_set_digest`;
- fuente de la política;
- mapping;
- algoritmo cuando aplique;
- source cut;
- backfill run;
- constraint definition digest;
- migration digest.

No existe selección `latest` implícita durante el enforcement.

#### 32. Frontera servicio/RPC

El constraint es defensa declarativa final para un invariante que realmente pertenece a la base de datos; no reemplaza al servicio de dominio ni a la frontera RPC.

La RPC conserva:

- autenticación;
- autorización;
- idempotencia;
- revalidación de estado;
- concurrencia;
- evaluación semántica;
- persistencia atómica;
- auditoría raíz.

DB-006 no traslada capitalización, diccionario, aliases, similitud, revisión, selección de sobreviviente ni resolución de identidad hacia PostgreSQL.

#### 33. Frontera con DB-008

DB-006 no crea triggers de negocio ni usa triggers para reparar silenciosamente valores que violarían un constraint.

Si una defensa adicional requiere trigger, el handoff queda reservado a DB-008.

Un trigger futuro no podrá:

- decidir semántica;
- ejecutar fuzzy matching;
- fusionar entidades;
- corregir texto visible sin comando;
- seleccionar versiones alternativas;
- llamar red;
- ejecutar scans globales.

#### 34. RLS, grants y superficie expuesta

Un constraint no reemplaza RLS, grants ni autorización.

La instancia deberá verificar que:

- el writer autorizado puede completar la operación válida;
- un rechazo no expone datos sensibles por error o logging;
- funciones privilegiadas conservan privilegio mínimo;
- el cliente no recibe credenciales de servicio;
- una ruta directa no evade la RPC gobernada;
- VITAL permanece fuera de la política transversal de Vento OS.

Cambiar RLS, Auth, Storage, Realtime, Edge Functions, cron o secretos no pertenece a esta tarea salvo que otra tarea propietaria lo autorice expresamente.

#### 35. Baseline remoto de referencia

La recaptura documental de `vento-os-dev` sobre los schemas Vento OS, excluyendo VITAL de la política transversal, observó:

```text
constraints totales: 1598
CHECK: 520
FOREIGN KEY: 726
PRIMARY KEY: 261
UNIQUE constraints: 91
columnas NOT NULL: 2053
constraints no validados: 13
índices únicos: 432
índices únicos parciales o con expresiones: 50
índices únicos planos no adjuntos a constraint: 30
```

Los 13 constraints no validados observados son 12 `CHECK` y 1 `FOREIGN KEY`, todos en `public`.

Estas cifras son un baseline de referencia del corte documental y deben recapturarse por instancia. No constituyen un inventario cerrado futuro ni autorizan cambios.

#### 36. Constraints legacy y objetos ya existentes

La existencia de objetos legacy exige clasificación, no adopción automática.

Por cada objeto relevante la instancia determina:

- `KEEP_AS_IS`;
- `VALIDATE_EXISTING`;
- `REPLACE_FORWARD`;
- `SUPERSEDE`;
- `HANDOFF_TO_DB_007`;
- `BLOCKED_FOR_REVIEW`;
- `OUT_OF_SCOPE`.

Un constraint `NOT VALID` preexistente no se valida por pertenecer al mismo schema; primero debe demostrarse que su semántica sigue siendo correcta y que su propietario canónico permite cerrarlo.

#### 37. Rollback y recuperación

Antes de materializar un constraint debe existir una estrategia de recuperación proporcional.

El plan distinguirá:

- retirar un constraint nuevo;
- revertir una activación de enforcement;
- reconstruir una derivación;
- conservar o restaurar rutas de escritura;
- resolver transacciones desconocidas;
- preservar crosswalks e historia;
- compensar efectos posteriores cuando una inversa ya no sea segura.

Eliminar un constraint puede retirar también su índice subyacente cuando el índice sea propiedad del constraint; esa dependencia debe conocerse antes del cambio.

#### 38. Verificación posterior

Una instancia física no cierra por éxito del DDL.

La verificación posterior debe demostrar, según aplique:

1. constraint presente con definición esperada;
2. validación completa cuando corresponda;
3. datos reconciliados;
4. cero filas violatorias;
5. cero huérfanos;
6. unicidad correcta bajo scope y semántica de nulos;
7. writers válidos continúan funcionando;
8. writers inválidos fallan de forma cerrada;
9. RPC conserva comportamiento esperado;
10. RLS/grants continúan correctos;
11. locks y rendimiento dentro del presupuesto;
12. migración registrada;
13. rollback/recovery continúa disponible;
14. consumidores no interpretan el error como éxito;
15. evidencia ligada al mismo commit, paquete y corte.

#### 39. Evidence bundle físico futuro

El evidence bundle de una instancia incluirá como mínimo:

```text
instance_id
package_id
environment_identity
candidate_commit_sha
migration_history_digest
source_cut_reference
backfill_run_id_or_not_required_evidence
resolved_version_set
version_set_digest
constraint_inventory_before
constraint_plan
constraint_definition_digests
lock_and_scan_plan
writer_registry_version
consumer_registry_version
rollback_plan_id
migration_ids
constraint_inventory_after
validation_results
row_and_relationship_reconciliation
performance_observation
security_observation
outcome
```

Campos ausentes que sean materiales producen bloqueo, no asunción.

#### 40. Handoff hacia DB-007

DB-006 entrega a DB-007 únicamente los candidatos cuyo enforcement físico requiere índices de búsqueda o unicidad normalizada.

El handoff conserva:

- `package_id`;
- invariante propietario;
- coordenada de identidad/scope;
- semántica de nulos;
- representación derivada autorizada, si existe;
- algoritmo y versiones;
- colisiones ya resueltas;
- definición de búsqueda;
- consumidores;
- baseline de índices;
- motivos por los que un constraint directo no es suficiente;
- rollback y condición de validación.

DB-007 no debe inferir identidad desde el índice solicitado.

#### 41. Handoff posterior a DB-008, DB-009 y DB-010

DB-006 no desarrolla esas tareas, pero deja fronteras explícitas:

- DB-008 recibe únicamente necesidades de trigger defensivo que no correspondan a un constraint declarativo;
- DB-009 conserva persistencia de auditoría operacional de valor previo, resultante y versión de regla;
- DB-010 conserva pruebas físicas finales de idempotencia, rollback y ausencia de cambios semánticos.

Un constraint confirmado no permite omitir esos handoffs cuando sean aplicables.

#### 42. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

**Requisitos creados:** 0
**Requisitos modificados:** 0

La tarea materializa en forma documental obligaciones ya registradas y no altera el registro canónico de requisitos de prueba.

#### 43. Cobertura de prueba vigente reutilizada

La cobertura existente que gobierna esta plantilla incluye, entre otros:

- `TREQ-DATA-140`: compatibilidad física y medición antes de activar representaciones e índices;
- `TREQ-DATA-145`: ciclo de vida versionado y transición cerrada;
- `TREQ-DATA-148`: compatibilidad y cambio atómico sin mezclar contratos;
- `TREQ-DATA-149`: trazabilidad before/after y autoridad;
- `TREQ-DATA-152`: recuperación y rollback;
- `TREQ-DATA-154`: identidad lógica de operación, versiones, reversibilidad y outcome;
- `TREQ-DATA-157`: revalidación de fuente, versión y estado antes de mutar;
- `TREQ-DATA-158`: determinismo sin dependencias ambientales implícitas;
- `TREQ-DATA-165`: modos cerrados de unicidad y enforcement únicamente cuando esté certificado;
- `TREQ-DATA-166`: coordenada completa de política de unicidad;
- `TREQ-DATA-167`: scopes cerrados y composición explícita;
- `TREQ-DATA-168`: prohibición de usar claves de búsqueda y helpers legacy como identidad;
- `TREQ-DATA-169`: semántica separada de nulos, ausencia y claves incompletas;
- `TREQ-DATA-170`: historia, vigencia y supersesión separadas;
- `TREQ-DATA-175`: identidad jerárquica con scope completo;
- `TREQ-DATA-176`: unicidad estructural UOM;
- `TREQ-DATA-194`: frontera RPC transaccional para mutaciones gobernadas;
- `TREQ-DATA-198`: atomicidad entre fuente, derivaciones y auditoría raíz;
- `TREQ-DATA-199`: paridad de versiones entre capas;
- `TREQ-DATA-200`: idempotencia y concurrencia;
- `TREQ-DATA-202`: control de escrituras directas y bypass;
- `TREQ-DATA-206`: colocación de unicidad y necesidad de protección atómica para enforcement certificado;
- `TREQ-DATA-210`: fallo cerrado;
- `TREQ-DATA-211`: privilegio mínimo y autorización;
- `TREQ-DATA-212`: costo acotado de defensas de base;
- `TREQ-DATA-213`: mapeo de helpers, funciones, triggers, clientes, imports, jobs e índices legacy antes de transición;
- `TREQ-DATA-214`: corpus integral de conformidad entre capas.

Esta enumeración es trazabilidad de cobertura vigente y no modifica esos requisitos.

#### 44. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | La batería integral del checkout corresponde a la rama documental después de incorporar el bloque al archivo propietario. |
| LOCAL | PASS | El artefacto fue contrastado contra estructura canónica, metadata obligatoria, orden de cabecera, secciones requeridas, cardinalidad de evidencia, continuidad, declaración TREQ cero, UTF-8, LF, whitespace y reglas semánticas reproducibles del entregable aislado. |
| REMOTA | PASS | Se contrastaron `main`, owner R, contratos de transición, 04A DATA, package `@vento/data-normalization`, documentación vigente de PostgreSQL 17 y metadatos read-only de `vento-os-dev`; la recaptura confirmó PostgreSQL 17.6 y el baseline actual de constraints, nulabilidad e índices únicos. |
| OPERATIVA | NOT_EXECUTED | Locks, scans, writers concurrentes, staging, validación física, rendimiento, rollback y comportamiento por `package_id` pertenecen a futuras instancias físicas autorizadas. |
| FÍSICA | NOT_APPLICABLE | Esta definición documental no autoriza DDL, DML, migraciones, constraints, índices, triggers ni cambios remotos. |

#### 45. Decisiones vinculantes

1. DB-006 es `TEMPLATE_PER_PACKAGE`, nunca global.
2. El gate físico es `POST_E5_PACKAGE`.
3. DB-005 debe cerrar y reconciliar antes de endurecer el invariante.
4. Toda instancia recaptura drift antes del efecto.
5. `NO_CONSTRAINT_REQUIRED` es una salida válida.
6. `CHECK`, FK, `NOT NULL`, unicidad directa y PK se evalúan separadamente.
7. Una coincidencia textual nunca certifica identidad.
8. `SEARCH_FORM_KEY`, `SEARCH_ACCENT_KEY`, tokens, aliases y similitud no son claves empresariales.
9. `CHECK` no reemplaza `NOT NULL`.
10. FK exige crosswalks y referencias reconciliados.
11. Acciones referenciales no se infieren.
12. `NOT VALID` se limita a `CHECK` y FK.
13. `UNIQUE` y PK no utilizan `NOT VALID`.
14. Un constraint staged no está cerrado hasta validación completa.
15. Semántica de nulos se declara por política.
16. `NULLS NOT DISTINCT` requiere decisión explícita del dominio.
17. Expresiones o predicados de unicidad hacen handoff a DB-007.
18. Índices parciales o con expresiones no se reinterpretan como constraints directos.
19. Deferrabilidad exige necesidad transaccional explícita.
20. Particionado se evalúa antes de elegir estrategia.
21. Locks y scans forman parte del gate físico.
22. Nombre existente no demuestra equivalencia.
23. Reintento consulta estado real después de timeout.
24. Toda migración futura se origina y versiona en `vento-shell`.
25. Dashboard no es fuente canónica de DDL.
26. El constraint no sustituye servicio ni RPC.
27. DB-008 conserva triggers defensivos.
28. DB-009 conserva auditoría operacional física.
29. DB-010 conserva certificación física final.
30. RLS y grants continúan siendo controles separados.
31. VITAL permanece fuera del alcance transversal.
32. Rollback se diseña antes de materializar.
33. El DDL exitoso no equivale a cierre verificado.
34. El baseline remoto documental debe recapturarse por instancia.
35. Esta definición no modifica Supabase.
36. Esta definición no modifica 04A.

#### 46. Criterios de aceptación

DB-006 queda documentalmente aceptable cuando:

1. conserva `TEMPLATE_PER_PACKAGE`;
2. conserva `POST_E5_PACKAGE`;
3. define el handoff obligatorio de DB-005;
4. exige revalidación de drift;
5. clasifica todos los invariantes candidatos;
6. distingue constraints de service/RPC;
7. define `CHECK`, FK, `NOT NULL`, `UNIQUE` directo y PK;
8. fija semántica de nulos;
9. protege scopes compuestos;
10. conserva identidad separada de búsqueda;
11. separa unicidad directa de la unicidad normalizada de DB-007;
12. documenta límites de `NOT VALID`;
13. contempla locks, scans y tablas particionadas;
14. define deferrabilidad y acciones referenciales;
15. clasifica objetos legacy;
16. define idempotencia y drift;
17. conserva versionado y procedencia;
18. mantiene RPC como frontera transaccional;
19. mantiene DB-008, DB-009 y DB-010 fuera del alcance;
20. define rollback;
21. define verificación posterior y evidence bundle;
22. mantiene cero cambios TREQ;
23. contiene exactamente las cinco clases de evidencia requeridas;
24. termina con continuidad canónica y no desarrolla DB-007.

#### 47. Límites

Esta tarea documental no:

- crea migraciones;
- crea, valida, altera o elimina constraints;
- modifica nulabilidad;
- crea o elimina índices;
- crea triggers;
- ejecuta backfills;
- cambia valores;
- valida físicamente constraints legacy;
- cambia `ON DELETE` u `ON UPDATE`;
- activa reglas;
- modifica RPC;
- modifica RLS o grants;
- modifica Auth, Storage, Realtime, Edge Functions, cron o secretos;
- modifica consumidores;
- decide identidades o duplicados;
- selecciona sobrevivientes;
- modifica el registro 04A;
- ejecuta cambios sobre VITAL;
- desarrolla DB-007, DB-008, DB-009 o DB-010.

---

#### 48. Continuidad

**ÚLTIMA TAREA APROBADA**
`DATA-NORM-DB-005 — Ejecutar backfills aprobados por dominio`

**TAREA ACTUAL APROBADA**
`DATA-NORM-DB-006 — Implementar constraints después de reconciliar datos`

**SIGUIENTE TAREA RESERVADA**
`DATA-NORM-DB-007 — Implementar índices de búsqueda y unicidad normalizada`


### ✅ DATA-NORM-DB-007 — Implementar índices de búsqueda y unicidad normalizada

**Estado:** APROBADA
**Tarea anterior:** DATA-NORM-DB-006 — Implementar constraints después de reconciliar datos
**Tarea siguiente:** DATA-NORM-DB-008 — Implementar triggers únicamente como barrera defensiva final
**Tipo de tarea:** Documental; contrato y plantilla R2 repetible por `package_id` para clasificar, diseñar, materializar, validar y retirar índices de búsqueda y de unicidad normalizada únicamente cuando exista una representación, query contract o invariante certificado que los justifique, preservando identidad, scope, semántica de nulos, versiones, seguridad, rendimiento, rollback y fronteras con constraints, servicio/RPC, triggers y auditoría, sin materializar DDL, DML, migraciones, índices, triggers ni cambios remotos durante esta definición
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/04_IMPLEMENTACION_FISICA_DE_NORMALIZACION.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`; contrato canónico `TEMPLATE_PER_PACKAGE` cerrado para futuras instancias `DATA-NORM-DB-007::<package_id>`, sujetas a `POST_E5_PACKAGE`, a los handoffs válidos de DB-003 y/o DB-006 según el carril, al expediente E5 aplicable, a recaptura de drift y a autorización física explícita
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Objetivo

Definir el contrato físico-documental que determina cuándo un paquete necesita un índice para ejecutar búsqueda canónica o para proteger una unicidad normalizada ya certificada, qué familia de índice es compatible con la semántica aprobada, qué evidencia debe existir antes de construirlo, cómo se valida contra el query real y el comportamiento concurrente, y cómo se retira o recupera sin convertir una optimización física en autoridad empresarial.

DB-007 no declara que toda representación derivada de búsqueda deba indexarse ni que todo índice único existente sea correcto. Una futura instancia puede concluir que no se requiere índice, reutilizar uno equivalente, crear uno nuevo, reemplazar una estrategia legacy o quedar bloqueada.

#### 2. Resultado canónico

Cada futura instancia `DATA-NORM-DB-007::<package_id>` deberá producir dos inventarios separados cuando apliquen:

```text
SEARCH_INDEX_CANDIDATES
NORMALIZED_UNIQUENESS_CANDIDATES
```

Cada candidato deberá terminar en una disposición cerrada y conservar la evidencia que demuestra por qué el objeto físico acelera o protege exactamente el contrato aprobado.

La existencia de un índice nunca modifica por sí sola:

- el valor fuente;
- la representación mostrada;
- la identidad de una entidad;
- la clasificación de un duplicado;
- el ranking empresarial;
- la autorización;
- la selección de versión;
- la decisión de merge o supervivencia.

#### 3. Topología y cardinalidad vinculantes

DB-007 conserva:

```text
mode = TEMPLATE_PER_PACKAGE
execution_gate = POST_E5_PACKAGE
instance_pattern = DATA-NORM-DB-007::<package_id>
```

No existe `DATA-NORM-DB-007::GLOBAL`.

La aprobación documental define una plantilla reutilizable. Cada `package_id` materializa únicamente los índices justificados por sus propios campos, consultas, invariantes, consumidores, volumen, datos reconciliados, gates y rollback.

#### 4. Gate temporal

Una instancia física solo podrá evaluarse después de `POST_E5_PACKAGE`.

Como mínimo deberá existir:

```text
package_id identificado
AND E5-GATE-008::<package_id> = PASS
AND candidate_commit_sha fijado
AND migration history reconciliado
AND source cut vigente
AND consumidores identificados
AND autorización física explícita
AND drift recapturado
```

Además, cada candidato deberá poseer el handoff específico de su carril.

#### 5. Dos carriles físicos separados

DB-007 no mezcla búsqueda con identidad.

##### 5.1. Carril de búsqueda

Recibe de `DATA-NORM-DB-003::<package_id>` una representación indexable y un query contract compatible.

Su propósito es acelerar recuperación, filtrado, prefijos, componentes o términos autorizados.

Todo índice de este carril es no autoritativo respecto de identidad y duplicidad.

##### 5.2. Carril de unicidad normalizada

Recibe de `DATA-NORM-DB-006::<package_id>` únicamente candidatos clasificados `HANDOFF_TO_DB_007`.

Su propósito es proteger atómicamente una unicidad empresarial ya certificada que no puede expresarse como `UNIQUE` directo porque depende de una expresión, predicado, comparación normalizada o estrategia de índice especializada.

DB-007 no inventa la identidad que ese índice protege.

#### 6. Fuentes vinculantes de una instancia

Cada futura instancia deberá consumir, según corresponda:

- el expediente E5 del `package_id`;
- `DATA-NORM-ARC-008` para búsqueda, representaciones, modos y precedencia;
- `DATA-NORM-ARC-009` para versiones, digests, idempotencia, evidencia y replay;
- `DATA-NORM-ARC-010` para identidad, unicidad, scope, colisiones y enforcement certificado;
- `DATA-NORM-ARC-011` para autoridad de servicio, RPC y defensa de base;
- `DATA-NORM-DB-002` cuando una expresión necesite una primitiva SQL certificada;
- `DATA-NORM-DB-003::<package_id>` para representación física y query contract de búsqueda;
- `DATA-NORM-DB-005::<package_id>` como evidencia de reconciliación cuando exista población histórica afectada;
- `DATA-NORM-DB-006::<package_id>` para candidatos de unicidad normalizada;
- `@vento/data-normalization` como contrato ejecutable compartido;
- migraciones y esquema vigentes del paquete;
- query shapes y consumidores registrados;
- estado remoto recapturado de tablas, columnas, índices, constraints, collations y extensiones;
- requisitos de prueba vigentes;
- rollback y recovery path aplicables.

Un helper o índice legacy con nombre parecido no sustituye estas fuentes.

#### 7. Handoff de búsqueda recibido de DB-003

Un candidato de búsqueda deberá recibir al menos:

```text
package_id
entity_or_table_coordinate
source_field_coordinate
search_profile
search_representation
representation_strategy
query_expression_or_shape
match_modes_served
scope_filters
status_or_validity_filters
locale
algorithm_version
resolved_version_set
version_set_digest
source_value_version_or_hash_strategy
consumer_set
expected_cardinality
baseline_query_plan
security_scope
rollback_reference
```

Si la representación está `BLOCKED`, `NOT_APPLICABLE` o no posee paridad query/valor, DB-007 no crea un índice para ocultar esa carencia.

#### 8. Handoff de unicidad recibido de DB-006

Un candidato de unicidad normalizada deberá recibir al menos:

```text
package_id
invariant_id_or_coordinate
entity_and_domain
identity_coordinate
scope_dimensions
comparison_representation
null_semantics
status_and_validity_semantics
predicate_if_any
algorithm_and_versions
resolved_version_set
version_set_digest
collision_resolution_evidence
backfill_or_not_required_evidence
consumer_set
writer_set
baseline_indexes
reason_direct_unique_is_insufficient
rollback_reference
validation_condition
```

Si falta identidad, scope, semántica de nulos o reconciliación, el candidato termina `BLOCKED`.

#### 9. Revalidación inmediatamente anterior al índice

La evidencia anterior no reserva indefinidamente el estado físico.

Antes de materializar una futura instancia se recaptura:

1. ambiente y proyecto;
2. commit candidato;
3. migration history;
4. tabla, columnas y tipos;
5. collations;
6. operator classes disponibles;
7. índices vigentes y sus definiciones exactas;
8. `indisvalid` e `indisready`;
9. constraints respaldados por índices;
10. tamaño y cardinalidad de tablas;
11. estadística relevante;
12. query shapes actuales;
13. writers y consumidores;
14. extensiones realmente instaladas;
15. particionado;
16. versiones de reglas y algoritmos;
17. ausencia de nuevas colisiones o violaciones;
18. rollback disponible;
19. autorización física.

Drift material invalida la evidencia que dependa de ese estado.

#### 10. Disposiciones cerradas por candidato

Cada candidato deberá terminar exactamente en una disposición:

| Disposición | Significado |
| --- | --- |
| `NO_INDEX_REQUIRED` | el plan y la carga no justifican un índice nuevo |
| `REUSE_EQUIVALENT_INDEX` | existe un índice física y semánticamente equivalente, válido y listo |
| `BTREE_LOOKUP_INDEX` | igualdad, rango u orden compatible sobre columnas o representación exacta |
| `BTREE_PREFIX_INDEX` | búsqueda de prefijo compatible con collation, operator class y query real |
| `COMPOSITE_SCOPE_INDEX` | filtros de scope y clave requieren orden compuesto medido |
| `PARTIAL_SEARCH_INDEX` | el workload consulta un subconjunto estable y el predicado es compatible con el query |
| `GIN_REPRESENTATION_INDEX` | una representación multivaluada o estructurada usa operadores GIN compatibles sin alterar semántica |
| `NORMALIZED_UNIQUE_INDEX` | una comparación normalizada certificada requiere protección única mediante índice |
| `PARTIAL_NORMALIZED_UNIQUE_INDEX` | la unicidad certificada aplica únicamente al subconjunto definido por un predicado estable |
| `REPLACE_LEGACY_INDEX` | el objeto vigente no es equivalente y existe transición aprobada hacia otro índice |
| `BLOCKED` | falta evidencia, compatibilidad, seguridad, paridad, reconciliación o recovery suficiente |

La disposición no fija automáticamente el nombre, las columnas ni el método físico antes de evaluar el candidato concreto.

#### 11. Regla universal de compatibilidad query-index

Un índice solo se considera útil o protector cuando el contrato de consulta y la definición física son compatibles.

La instancia compara como mínimo:

```text
query expression
index expression
access method
key column order
operator class
collation
sort direction when material
null ordering when material
predicate
included columns
query operators
parameterization
scope filters
status filters
```

Que dos expresiones produzcan resultados parecidos en una muestra no demuestra equivalencia.

#### 12. Índices de expresión

Un índice de expresión solo es elegible cuando todas las funciones y operadores usados por la definición cumplen la inmutabilidad requerida por PostgreSQL y reproducen exactamente la versión aprobada del contrato.

Reglas:

1. no se marca una función como `IMMUTABLE` para forzar su indexación si depende de estado externo;
2. una primitiva SQL canónica requerida proviene de DB-002;
3. un catálogo mutable, alias activo, reloj, locale implícito, timezone de sesión, autorización o red descalifican una expresión indexable directa;
4. la query deberá usar una expresión compatible con la del índice;
5. un cambio de algoritmo o semántica exige transición versionada, no modificación silenciosa bajo la misma identidad.

#### 13. `SEARCH_FORM_KEY`

Cuando DB-003 entregue una `SEARCH_FORM_KEY` físicamente indexable, DB-007 puede evaluar un B-tree no único para los modos compatibles.

El índice no podrá:

- declararse `UNIQUE` por el hecho de que la forma sea estable;
- retirar tildes;
- convertir `ñ` en `n`;
- incorporar aliases;
- reinterpretar signos;
- convertirse en clave empresarial.

La query deberá usar el mismo perfil, locale, algoritmo y versión que produjo la representación.

#### 14. `SEARCH_ACCENT_KEY`

`SEARCH_ACCENT_KEY` solo sirve para recuperación tolerante.

Cualquier índice sobre esta representación será no único y deberá demostrar que el plegado implementado conserva el contrato `es-CO`, incluida la diferencia entre `ñ` y `n`.

La extensión `unaccent` o un helper genérico de eliminación de diacríticos no adquieren equivalencia por disponibilidad técnica.

#### 15. `SEARCH_TOKEN_STREAM`

El token stream conserva clases, fronteras y orden aprobados.

DB-007 no lo sustituye automáticamente por:

- texto concatenado;
- full-text search genérico;
- stemming;
- stopwords;
- trigramas;
- una serialización que pierda clases o fronteras.

Un `GIN_REPRESENTATION_INDEX` solo procede si la representación física de DB-003 y los operadores consultados preservan el contrato exacto. De lo contrario permanece `BLOCKED` o `NO_INDEX_REQUIRED`.

#### 16. `SEARCH_APPROVED_ALIAS_SET`

Los aliases conservan su catálogo y vigencia propios.

Un índice de aliases deberá operar sobre la estructura relacional o de consulta autorizada y preservar:

- alias estable;
- target estable;
- scope;
- clase semántica;
- fuente de autoridad;
- estado;
- vigencia;
- versión.

No se crea una copia universal de aliases en cada fila empresarial para simplificar la indexación.

#### 17. Transliteration y similitud

Bajo la política vigente:

```text
SEARCH_TRANSLITERATION_KEY = NOT_APPLICABLE
SIMILARITY_CANDIDATE_ONLY = DISABLED
```

Por tanto DB-007 no instala índices de transliteración ni infraestructura de similitud por anticipación.

La ausencia actual de `pg_trgm` no es una brecha mientras la capacidad continúe deshabilitada.

#### 18. Componentes estructurados

`SEARCH_STRUCTURED_COMPONENT_SET` se indexa únicamente preservando sus componentes tipados y filtros reales.

Una estrategia compuesta puede incluir dimensiones como:

- producto;
- cantidad;
- unidad;
- multiplicador;
- empaque;
- contexto;
- proveedor o fuente;
- estado;
- vigencia.

El orden de las columnas se deriva del query real, selectividad y cardinalidad. No se concatena una cadena universal para sustituir la estructura.

#### 19. Free text

`SEARCH_FREE_TEXT_TERMS` solo recibe un índice cuando el perfil autoriza descubrimiento libre, DB-003 materializó una representación compatible y el query contract demuestra utilidad.

La estrategia no puede:

- indexar secretos o firmas;
- ampliar finalidad;
- convertir texto sensible en un corpus enumerable;
- introducir stemming, stopwords o similitud no aprobados;
- reemplazar el control de autorización previo a búsqueda.

#### 20. Precedencia de modos de búsqueda

DB-007 no altera la precedencia canónica:

```text
EXACT_VALUE_MATCH
FORM_EQUIVALENT_MATCH
ACCENT_TOLERANT_MATCH
APPROVED_ALIAS_MATCH
ORDERED_PHRASE_MATCH
ALL_TOKEN_MATCH
LAST_TOKEN_PREFIX_MATCH
TRANSLITERATION_FALLBACK_MATCH
SIMILARITY_CANDIDATE_ONLY
```

Un índice puede acelerar uno o varios niveles, pero no elevar un modo inferior ni cambiar el orden de ranking.

#### 21. Prefix matching

`LAST_TOKEN_PREFIX_MATCH` exige demostrar que la combinación de collation, operator class, representación y operador de consulta permite utilizar el índice esperado.

No se fija universalmente `text_pattern_ops`, otra operator class o un método especializado. La instancia deberá medir el query plan real y seleccionar únicamente una estrategia compatible con el contrato y el ambiente.

#### 22. Índices parciales de búsqueda

Un `PARTIAL_SEARCH_INDEX` solo procede cuando:

1. el subconjunto relevante es estable y aprobado;
2. el predicado no cambia semántica de visibilidad;
3. la query que debe usarlo implica el predicado de forma reconocible por PostgreSQL;
4. la parametrización real no impide esa implicación;
5. filas excluidas pueden permanecer fuera del índice sin convertirse en invisibles para una búsqueda que debería recuperarlas;
6. la ventaja de tamaño, selectividad o costo fue medida.

Un conjunto grande de índices parciales no sustituye particionado ni un diseño compuesto correcto.

#### 23. Índices compuestos

El orden de un índice compuesto se deriva de:

- igualdad y rangos;
- filtros de autorización ya aplicados;
- scope;
- selectividad;
- ordenamiento requerido;
- joins;
- cardinalidad;
- reutilización real entre queries.

No se agrega una dimensión al índice solo porque exista en el modelo ni se omite una dimensión del scope para hacerlo más pequeño.

#### 24. `INCLUDE` y covering indexes

Columnas `INCLUDE` son una optimización de lectura y nunca forman parte de la identidad o unicidad protegida.

Su uso requiere medir:

- posibilidad de index-only scan;
- ancho de tupla;
- bloat;
- frecuencia de actualización;
- costo de escritura;
- beneficio sobre heap access.

No se incluirán columnas anchas o sensibles por conveniencia.

#### 25. Unicidad normalizada

`NORMALIZED_UNIQUE_INDEX` y `PARTIAL_NORMALIZED_UNIQUE_INDEX` solo proceden desde un handoff válido de DB-006.

La clave protegida deberá representar una `COMPARISON_REPRESENTATION` autorizada por la política de identidad y unicidad, no una derivación tolerante de búsqueda.

Queda prohibido usar como identidad única por sí mismos:

- `SEARCH_FORM_KEY`;
- `SEARCH_ACCENT_KEY`;
- token streams;
- aliases;
- transliteración;
- similitud;
- ranking;
- slug legacy;
- `lower` o `trim` no gobernados;
- una etiqueta visible.

#### 26. Índice único de expresión

Un índice único de expresión exige simultáneamente:

1. identidad y scope certificados;
2. representación de comparación exacta;
3. expresión inmutable y versionada;
4. cero colisiones no resueltas;
5. semántica de nulos explícita;
6. comportamiento concurrente definido;
7. writers compatibles;
8. error esperado y manejo de conflicto conocidos;
9. rollback disponible;
10. paridad entre servicio, RPC e índice.

Una expresión parecida a un índice legacy no satisface estas condiciones.

#### 27. Índice único parcial

Un índice único parcial solo procede cuando el invariante de unicidad aplica a un subconjunto empresarial real y estable, por ejemplo un estado o intervalo certificado por la política.

La instancia deberá demostrar:

- predicate exacto;
- semántica de entrar y salir del subconjunto;
- carreras durante cambios de estado;
- cobertura de reactivación;
- historia y supersesión;
- query/writer compatibility;
- ausencia de una solución declarativa directa más apropiada.

El predicado no se usa para ocultar duplicados que deberían resolverse.

#### 28. Semántica de nulos

La semántica de `NULL` proviene de DB-006 y no se redefine en DB-007.

Cuando un índice único necesite `NULLS NOT DISTINCT`, esa decisión deberá estar certificada por el dominio.

Cuando la estrategia dependa de expresiones, predicados o valores estructurales, no se introducirán sentinels mediante `COALESCE` para alterar silenciosamente el significado de ausencia.

#### 29. B-tree como base de unicidad

La unicidad física de PostgreSQL se implementa únicamente mediante un método que soporte índices únicos para el caso concreto; en PostgreSQL 17 la base estándar de estos índices es B-tree.

DB-007 no selecciona Hash, GIN, GiST, BRIN u otro método para declarar unicidad empresarial si el motor no soporta esa garantía con la semántica requerida.

#### 30. Índices legacy

Cada índice existente se clasifica por definición, no por nombre.

El fingerprint mínimo incluye:

```text
schema
table
index_name
access_method
key_columns_or_expressions
collations
operator_classes
sort_and_null_order
predicate
included_columns
unique
primary
valid
ready
constraint_attachment
```

Las disposiciones legacy son:

```text
REUSE_EQUIVALENT_INDEX
KEEP_UNRELATED_INDEX
REPLACE_LEGACY_INDEX
BLOCKED_PENDING_CONSUMER_MAP
```

`IF NOT EXISTS` no sustituye esta comprobación porque un objeto con el mismo nombre puede tener otra definición.

#### 31. Baseline remoto observado

La auditoría read-only de referencia sobre `vento-os-dev` observó PostgreSQL 17.6 en los schemas Vento OS auditados fuera de VITAL:

```text
indexes_total = 883
btree_indexes = 882
gin_indexes = 1
unique_indexes = 432
partial_indexes = 126
expression_indexes = 24
unaccent = INSTALLED 1.1
pg_trgm = NOT_OBSERVED
```

Este baseline es evidencia de diseño, no una autorización ni un inventario congelado. Cada futura instancia lo recaptura.

La coexistencia de expresiones `lower`, `btrim`, `COALESCE`, índices parciales y un único GIN observado demuestra diversidad física, no equivalencia con el contrato canónico.

#### 32. Frontera con `unaccent`

La disponibilidad de `unaccent` no autoriza usarlo como representación canónica de búsqueda ni como comparación de identidad.

El contrato `es-CO` exige preservar `ñ` frente a `n` y limita el plegado de diacríticos.

Cualquier primitiva SQL futura deberá cumplir DB-002, tener versión gobernada y superar corpus de paridad antes de participar en una expresión indexada.

#### 33. Frontera con `pg_trgm`

`pg_trgm` no fue observado en el baseline remoto auditado y la similitud permanece deshabilitada en la política vigente.

Por tanto:

1. DB-007 no instala la extensión;
2. no crea índices trigram;
3. no usa trigramas como fallback de búsqueda;
4. una activación futura requeriría política, versión, umbrales, métricas, seguridad y transición propias.

#### 34. Construcción concurrente

Una futura instancia deberá clasificar cada build como:

```text
STANDARD_BUILD
CONCURRENT_BUILD
PARTITION_AWARE_BUILD
```

La selección depende de volumen, writers, ventana, locks, versión de PostgreSQL, particionado y mecanismo de migración.

Para `CONCURRENT_BUILD` deberá recordarse que PostgreSQL realiza trabajo adicional, puede dejar un índice inválido tras fallo y no permite `CREATE INDEX CONCURRENTLY` dentro de un bloque de transacción.

El ejecutor de migraciones deberá comprobarse antes de elegir esta modalidad.

#### 35. Índice inválido o build fallido

Un build fallido no se interpreta como ausencia de efecto.

La recuperación deberá recapturar:

- existencia del índice;
- `indisvalid`;
- `indisready`;
- unicidad activa;
- definición;
- costo de mantenimiento residual;
- writers afectados;
- error original.

La estrategia de recovery se decide desde el estado observado; no se reintenta ciegamente el mismo DDL.

#### 36. Índice único concurrente

La unicidad durante un build concurrente requiere tratamiento reforzado porque PostgreSQL puede empezar a rechazar duplicados antes de que el índice quede disponible como válido y un fallo puede dejar un índice inválido con efectos de enforcement.

La instancia deberá definir:

- ventana;
- manejo de errores concurrentes;
- comunicación a consumidores;
- condición de aborto;
- recovery;
- validación posterior;
- idempotencia del retry.

#### 37. Tablas particionadas

Antes de indexar una tabla particionada se recaptura su topología real.

PostgreSQL 17 no permite construir concurrentemente el índice del parent particionado de la misma manera que una tabla ordinaria. Una estrategia futura podrá requerir índices por partición y posterior attachment del índice padre según soporte del motor.

DB-007 no infiere esta estrategia sin evidencia del paquete.

#### 38. Estadísticas y `ANALYZE`

Después de materializar un índice de expresión, la evidencia de plan deberá considerar que las estadísticas de la expresión pueden requerir `ANALYZE` o la actualización correspondiente antes de evaluar su utilidad real.

No se declara un índice inútil ni exitoso únicamente por el primer plan observado inmediatamente después del DDL.

#### 39. Validación del query plan

Cada índice de búsqueda deberá probarse contra las queries reales o fixtures contractuales equivalentes.

La evidencia mínima incluye:

```text
query_shape_id
parameters_or_parameter_classes
row_count
selectivity
plan_before
plan_after
index_used_or_not
estimated_cost_before
estimated_cost_after
actual_latency_when_safe
buffers_when_safe
rows_returned
result_equivalence
```

La utilización del índice no es obligatoria en todos los tamaños de tabla: el planner puede elegir un sequential scan cuando sea más barato. El criterio es comportamiento correcto y costo medido, no forzar `Index Scan` artificialmente.

#### 40. Rendimiento y costo de escritura

La instancia medirá proporcionalmente:

- tiempo de build;
- locks y waits;
- CPU;
- I/O;
- WAL cuando sea material;
- tamaño del índice;
- bloat inicial o crecimiento relevante;
- latencia de lectura;
- write amplification;
- impacto sobre inserts y updates;
- p50/p95/p99 cuando aplique;
- throughput;
- autovacuum/analyze relevante.

Un índice que mejora una lectura pero degrada de forma inaceptable el path de escritura no supera el gate físico.

#### 41. Seguridad y autorización

Un índice nunca amplía acceso.

Reglas:

1. autorización y RLS se aplican antes de exposición de resultados;
2. no se indexan secretos o firmas para habilitar descubrimiento;
3. campos personales o de ubicación requieren finalidad y scope;
4. un índice no convierte una tabla privada en API pública;
5. service role o credenciales privilegiadas no sustituyen autorización semántica;
6. query plan, logs y evidencia minimizan valores sensibles;
7. índices auxiliares no justifican grants adicionales por conveniencia.

#### 42. Idempotencia y drift

La operación física deberá poseer una identidad lógica que incorpore al menos:

```text
package_id
candidate_commit_sha
table_identity
index_contract_digest
version_set_digest
operation_kind
```

Antes de crear, reemplazar o retirar un índice, la instancia consulta el estado real.

La misma operación compatible recupera su outcome anterior; una misma identidad con definición distinta produce conflicto y bloqueo.

#### 43. Migraciones y procedencia

Toda modificación futura de índices de Supabase se origina y versiona en `vento-shell`.

La evidencia enlaza:

- migration id;
- commit;
- package;
- ambiente;
- definición previa;
- definición resultante;
- digests;
- executor y modalidad de build;
- tiempos;
- outcome.

Una edición aislada en Dashboard no constituye estado canónico de implementación.

#### 44. Coexistencia y transición

Cuando un índice legacy deba reemplazarse, la transición deberá declarar:

```text
OLD_ONLY
DUAL_INDEX_SHADOW
NEW_PREFERRED
OLD_RETIRED
```

`DUAL_INDEX_SHADOW` significa coexistencia física para comparación de plan y resultado; no significa dual write empresarial ni doble autoridad semántica.

El índice anterior no se retira hasta demostrar compatibilidad de consumidores, resultado, rendimiento y recovery.

#### 45. Rollback y recovery

El rollback deberá preservar la fuente y el contrato lógico aunque cambie la estrategia física.

Una futura instancia declara antes de ejecutar:

- cómo dejar de usar el índice nuevo;
- cómo recuperar de un índice inválido;
- cómo restaurar el path previo;
- qué consumidores dependen del índice;
- qué ocurre con una unicidad ya expuesta a writers;
- qué evidencia se conserva;
- qué punto de no retorno existe;
- cuándo corresponde forward-fix en lugar de rollback.

Retirar un índice nunca revierte automáticamente los datos ni una decisión empresarial.

#### 46. Observabilidad posterior

Después del cutover, la instancia observa:

- planes reales;
- latencia;
- errores;
- conflictos de unicidad;
- locks;
- write cost;
- crecimiento del índice;
- uso del índice;
- queries que dejaron de usarlo;
- consumidores degradados.

La ausencia de uso puede significar tabla pequeña, query incompatible, estadísticas insuficientes o diseño innecesario; se clasifica antes de retirar.

#### 47. Handoff hacia DB-008

DB-007 entrega a DB-008 únicamente defensas que realmente requieran trigger y no estén resueltas por constraints, índices, servicio o RPC.

El handoff deberá explicar:

- invariante;
- por qué constraint o índice no bastan;
- qué parte ya protege DB-007;
- qué representación o campo debe defenderse;
- costo esperado;
- writers afectados;
- rollback.

Un índice no justifica crear un trigger para duplicar su enforcement.

#### 48. Handoff hacia DB-009 y DB-010

DB-007 conserva para DB-009 la atribución operacional necesaria de cambios físicos, versiones y resultados, sin implementar su persistencia propietaria.

DB-010 recibirá:

- definitions before/after;
- digests;
- query plans;
- resultados de equivalencia;
- comportamiento concurrente;
- evidencia de recovery;
- consumo real;
- impacto de rollback;
- ausencia de cambio semántico.

#### 49. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

**Requisitos creados:** 0
**Requisitos modificados:** 0

La tarea materializa documentalmente obligaciones ya registradas sobre búsqueda, representaciones, compatibilidad query-index, identidad, unicidad, scope, nulos, concurrencia, seguridad, rendimiento, versiones y rollback. No introduce una nueva semántica empresarial ni un riesgo sin cobertura canónica.

#### 50. Cobertura de prueba vigente reutilizada

La cobertura existente que gobierna esta plantilla incluye, entre otros:

- `TREQ-DATA-123` a `TREQ-DATA-142` para representaciones, búsqueda, paridad, perfiles, seguridad, compatibilidad de índices y corpus;
- `TREQ-DATA-143` a `TREQ-DATA-160` para versiones, digests, outcomes, idempotencia, concurrencia, replay y rollback;
- `TREQ-DATA-165` a `TREQ-DATA-170` para separación de identidad, coordenada, scopes, frontera frente a búsqueda, nulos y temporalidad;
- `TREQ-DATA-175` y `TREQ-DATA-176` para jerarquías y UOM estructural;
- `TREQ-DATA-185` a `TREQ-DATA-190` para prevención, concurrencia, gates de enforcement, paridad y corpus de identidad;
- `TREQ-DATA-191` a `TREQ-DATA-214` para colocación por capas, RPC, atomicidad, escritura directa, unicidad, seguridad, rendimiento, legacy y certificación.

Estas referencias son trazabilidad de cobertura vigente y no representan cambios del registro.

#### 51. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | La batería integral del checkout corresponde a la rama documental después de incorporar el bloque al archivo propietario. |
| LOCAL | PASS | El artefacto fue comprobado estáticamente contra metadata obligatoria, secciones requeridas, cardinalidad de evidencia, continuidad, declaración TREQ cero, UTF-8, LF, whitespace y reglas de contenido del contrato de entrega. |
| REMOTA | PASS | Se contrastaron `main`, owner R, topología, contratos DB-003 y DB-006, 04A DATA, `@vento/data-normalization`, documentación vigente de PostgreSQL 17 y el baseline read-only de `vento-os-dev`; la auditoría remota se ejecutó en transacción READ ONLY y produjo cero mutaciones. |
| OPERATIVA | NOT_EXECUTED | Query plans, builds, locks, carga, writers concurrentes, consumo, cutover y recovery corresponden a futuras instancias físicas autorizadas. |
| FÍSICA | NOT_APPLICABLE | Esta definición documental no crea, reemplaza, elimina ni reconstruye índices, extensiones, constraints, triggers, migraciones o datos. |

#### 52. Decisiones vinculantes

1. DB-007 es `TEMPLATE_PER_PACKAGE`, nunca global.
2. El gate físico es `POST_E5_PACKAGE`.
3. Existen dos carriles: búsqueda y unicidad normalizada.
4. DB-003 es la entrada propietaria del carril de búsqueda.
5. DB-006 es la entrada propietaria del carril de unicidad normalizada.
6. Un índice de búsqueda nunca crea identidad.
7. Una unicidad normalizada nunca se deriva de una clave tolerante de búsqueda.
8. `SEARCH_FORM_KEY` puede ser indexable pero no única por esa condición.
9. `SEARCH_ACCENT_KEY` es solo recuperación candidata y no se declara única.
10. Token streams no se reducen automáticamente a full-text search.
11. Aliases conservan catálogo y vigencia propios.
12. Transliteration permanece no aplicable bajo la política vigente.
13. Similarity permanece deshabilitada bajo la política vigente.
14. DB-007 no instala `pg_trgm` por anticipación.
15. `unaccent` instalado no equivale al contrato `SEARCH_ACCENT_KEY`.
16. Índices de expresión exigen funciones y operadores compatibles con inmutabilidad.
17. El query contract debe ser compatible con expresión, collation y operator class.
18. Los índices parciales exigen que el query implique el predicado.
19. La parametrización real se valida antes de confiar en un índice parcial.
20. Índices compuestos se ordenan por workload y scope, no por estética del schema.
21. `INCLUDE` es optimización, nunca parte de identidad.
22. Un índice único normalizado exige handoff certificado de DB-006.
23. `COMPARISON_REPRESENTATION` y `SEARCH_DERIVATION` permanecen separadas.
24. Semántica de nulos se hereda de DB-006.
25. Sentinels con `COALESCE` no alteran ausencia sin contrato estructural explícito.
26. Un índice legacy se compara por fingerprint completo.
27. El mismo nombre no demuestra equivalencia.
28. `IF NOT EXISTS` no demuestra equivalencia.
29. Build estándar, concurrente y partition-aware se clasifican por instancia.
30. `CREATE INDEX CONCURRENTLY` no se asume compatible con el executor sin comprobarlo.
31. Un build fallido puede dejar estado físico residual y exige recaptura.
32. Un unique concurrent build requiere recovery reforzado.
33. El planner puede elegir sequential scan legítimamente.
34. Expresión, query e índice se certifican juntos.
35. Resultado correcto prevalece sobre forzar un tipo de plan.
36. Rendimiento de lectura y costo de escritura se evalúan conjuntamente.
37. RLS, grants y autorización permanecen controles separados.
38. VITAL permanece fuera del alcance transversal de Vento OS.
39. Toda modificación futura de Supabase se origina y versiona en `vento-shell`.
40. DB-008 conserva triggers defensivos.
41. DB-009 conserva auditoría operacional física.
42. DB-010 conserva certificación física final.
43. Esta definición produce cero cambios TREQ.
44. Esta definición produce cero cambios remotos.

#### 53. Criterios de aceptación

DB-007 queda documentalmente aceptable cuando:

1. conserva `TEMPLATE_PER_PACKAGE`;
2. conserva `POST_E5_PACKAGE`;
3. separa búsqueda de unicidad normalizada;
4. consume el handoff completo de DB-003 para búsqueda;
5. consume el handoff completo de DB-006 para unicidad;
6. exige recaptura de drift;
7. clasifica todos los candidatos con disposiciones cerradas;
8. exige compatibilidad query-index;
9. protege fuente, display e identidad;
10. conserva `SEARCH_FORM_KEY` y `SEARCH_ACCENT_KEY` con su semántica exacta;
11. conserva tokenización, aliases y componentes estructurados;
12. mantiene transliteración y similitud deshabilitadas;
13. define criterios de índices de expresión;
14. define criterios de índices parciales y compuestos;
15. define prefix matching sin fijar operator class universal;
16. define `INCLUDE` como optimización no semántica;
17. define unicidad normalizada desde `COMPARISON_REPRESENTATION` certificada;
18. hereda semántica de nulos de DB-006;
19. clasifica índices legacy por fingerprint completo;
20. contempla build concurrente e índices inválidos;
21. contempla tablas particionadas;
22. exige estadísticas y query-plan evidence;
23. mide read benefit y write cost;
24. conserva seguridad y RLS como controles independientes;
25. define idempotencia, procedencia, coexistencia y rollback;
26. deja handoff cerrado hacia DB-008, DB-009 y DB-010;
27. mantiene cero cambios TREQ;
28. contiene exactamente las cinco clases de evidencia requeridas;
29. termina con continuidad canónica y no desarrolla DB-008.

#### 54. Límites

Esta tarea documental no:

- crea ni modifica migraciones;
- crea índices;
- elimina índices;
- reconstruye índices;
- instala extensiones;
- cambia collations;
- cambia operator classes;
- crea constraints;
- crea triggers;
- ejecuta backfills;
- modifica valores fuente o derivados;
- altera identidades;
- confirma duplicados;
- cambia rankings;
- habilita similitud;
- habilita transliteración;
- modifica RPC;
- modifica servicio de dominio;
- modifica RLS o grants;
- modifica Auth, Storage, Realtime, Edge Functions, cron o secretos;
- modifica el registro 04A;
- autoriza ninguna instancia física;
- ejecuta cambios sobre VITAL;
- desarrolla DB-008, DB-009 o DB-010.

---

#### 55. Continuidad

**ÚLTIMA TAREA APROBADA**
`DATA-NORM-DB-006 — Implementar constraints después de reconciliar datos`

**TAREA ACTUAL APROBADA**
`DATA-NORM-DB-007 — Implementar índices de búsqueda y unicidad normalizada`

**SIGUIENTE TAREA RESERVADA**
`DATA-NORM-DB-008 — Implementar triggers únicamente como barrera defensiva final`


### ✅ DATA-NORM-DB-008 — Implementar triggers únicamente como barrera defensiva final

**Estado:** APROBADA
**Tarea anterior:** DATA-NORM-DB-007 — Implementar índices de búsqueda y unicidad normalizada
**Tarea siguiente:** DATA-NORM-DB-009 — Registrar valor previo, valor resultante y versión de regla
**Tipo de tarea:** Documental; contrato y plantilla R2 repetible por `package_id` para clasificar, diseñar, materializar, validar, observar y retirar triggers estrictamente defensivos únicamente cuando un invariante local no quede suficientemente protegido por servicio, RPC, constraints o índices, preservando autoridad semántica, atomicidad, versiones, idempotencia, seguridad, costo acotado, rollback y frontera de auditoría, sin materializar DDL, DML, migraciones, triggers, funciones ni cambios remotos durante esta definición
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/04_IMPLEMENTACION_FISICA_DE_NORMALIZACION.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`; contrato canónico `TEMPLATE_PER_PACKAGE` cerrado para futuras instancias `DATA-NORM-DB-008::<package_id>`, sujetas a `POST_E5_PACKAGE`, al handoff válido de `DATA-NORM-DB-007::<package_id>`, al expediente E5 aplicable, a recaptura de drift y a autorización física explícita
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Objetivo

Definir el contrato físico-documental que determina cuándo un paquete realmente necesita un trigger de base de datos como **última barrera defensiva**, qué puede comprobar o derivar, qué debe rechazar, qué responsabilidades no puede absorber y cómo deberá activarse, medirse y retirarse sin convertir PostgreSQL en una segunda autoridad semántica de Vento OS.

DB-008 parte de una regla de mínima intervención:

```text
servicio de dominio
→ autoridad semántica

RPC transaccional
→ autenticación, autorización, revalidación y commit

constraints e índices
→ enforcement declarativo o atómico cuando corresponda

trigger defensivo
→ última barrera local, acotada y fail-closed
```

La existencia de una tabla, función o trigger legacy no demuestra que un trigger sea necesario ni que su comportamiento sea compatible con este contrato.

#### 2. Resultado canónico

Cada futura instancia `DATA-NORM-DB-008::<package_id>` deberá producir una matriz cerrada de operaciones gobernadas y asignar exactamente un modo de trigger a cada una:

```text
NO_TRIGGER
ASSERT_AND_REJECT
DERIVE_BOUNDED_REPRESENTATION
STAMP_DEFENSIVE_METADATA
```

El resultado válido de una instancia puede ser:

- cero triggers nuevos porque las defensas existentes son suficientes;
- adopción explícita de un trigger existente después de demostrar equivalencia completa;
- reemplazo versionado de un trigger legacy incompatible;
- creación de un trigger nuevo estrictamente defensivo;
- bloqueo por falta de evidencia, seguridad, paridad, rendimiento o rollback.

No existe una obligación de crear un trigger por cada campo, tabla, representación, índice o constraint.

#### 3. Topología y cardinalidad vinculantes

DB-008 conserva:

```text
mode = TEMPLATE_PER_PACKAGE
execution_gate = POST_E5_PACKAGE
instance_pattern = DATA-NORM-DB-008::<package_id>
```

Consecuencias:

1. no existe `DATA-NORM-DB-008::GLOBAL`;
2. la aprobación documental define una plantilla reutilizable, no un trigger global;
3. cada paquete evalúa únicamente sus operaciones, tablas, writers y riesgos;
4. un trigger reutilizable creado en una instancia no autoriza extenderlo a otros paquetes sin lineage y decisión explícitos;
5. cada instancia conserva migraciones, funciones, triggers, seguridad, mediciones, consumidores, evidencia y rollback propios;
6. el marcador documental no se reabre por cada ejecución física futura.

#### 4. Gate temporal

Una futura instancia solo podrá materializarse después de satisfacer `POST_E5_PACKAGE` para el mismo `package_id`.

Como mínimo deberá existir evidencia compatible de:

```text
package_id propietario identificado
E5-GATE-008 del package = PASS
handoff DB-007 = utilizable o NO_TRIGGER justificado
writers inventariados
servicio y RPC propietarios identificados
constraints e índices aplicables reconciliados
drift remoto recapturado
seguridad resuelta
rendimiento evaluable
rollback preparado
physical_authorization = EXPLICIT
```

Un trigger no puede utilizarse para completar retroactivamente decisiones de dominio, identidad, unicidad, versiones, autorización o transición que el paquete todavía no haya cerrado.

#### 5. Fuentes vinculantes de una instancia

Cada futura instancia deberá consumir sin reinterpretación silenciosa:

1. el expediente E5 del `package_id`;
2. `DATA-NORM-ARC-011` como autoridad de colocación entre aplicación, servicio, RPC y trigger;
3. `DATA-NORM-ARC-009` para versiones, idempotencia, correlación y auditoría;
4. `DATA-NORM-ARC-010` para identidad, unicidad, colisiones y prohibición de fusión por coincidencia;
5. `DATA-NORM-ARC-012` cuando existan entradas o mappings externos;
6. el handoff de `DATA-NORM-DB-007::<package_id>`;
7. constraints vigentes y decisiones de `DATA-NORM-DB-006::<package_id>` cuando apliquen;
8. representaciones físicas y contratos de `DATA-NORM-DB-003::<package_id>` cuando apliquen;
9. primitivas SQL certificadas por `DATA-NORM-DB-002::<package_id>` cuando sean necesarias;
10. contratos ejecutables de `@vento/data-normalization`;
11. writers, RPC, jobs, imports, Edge Functions y consumidores del paquete;
12. estado real de triggers y funciones recapturado en el ambiente objetivo;
13. RLS, grants, ownership y `search_path` aplicables;
14. cobertura de prueba vigente;
15. plan de rollback y recuperación.

Una discrepancia material entre estas fuentes bloquea únicamente la defensa afectada hasta resolver su autoridad propietaria.

#### 6. Handoff obligatorio recibido de DB-007

DB-008 solo recibe defensas que realmente requieran trigger y no estén resueltas de manera suficiente por constraints, índices, servicio o RPC.

El handoff deberá declarar como mínimo:

- invariante propietario;
- `package_id`;
- tabla y operación afectadas;
- representación o campo gobernado;
- por qué un constraint no basta;
- por qué un índice no basta;
- qué protección ya existe en DB-007;
- writers afectados;
- expectativa de versiones y fuente;
- costo esperado de la defensa;
- error esperado ante violación;
- rollback.

Un índice existente no justifica crear un trigger que duplique su enforcement.

#### 7. Principio de última barrera

El trigger defensivo no es la autoridad primaria de la operación.

Su función es impedir que una escritura que haya alcanzado la relación viole un invariante local ya decidido o materialice una derivación estrictamente acotada que el contrato haya autorizado de antemano.

Por tanto:

1. la semántica se resuelve antes del trigger;
2. la autorización se resuelve antes del trigger;
3. la selección de versiones se resuelve antes del trigger;
4. la identidad y unicidad se resuelven antes del trigger;
5. el trigger no convierte una credencial privilegiada en autoridad empresarial;
6. una violación se rechaza o se registra según el modo aprobado;
7. el trigger no inventa una reparación para permitir que la escritura continúe.

#### 8. Vocabulario cerrado de modos

Cada operación tendrá exactamente uno de estos modos:

| Modo | Función permitida | Resultado normal |
| --- | --- | --- |
| `NO_TRIGGER` | ninguna defensa física adicional por trigger | la operación depende de servicio, RPC y controles declarativos suficientes |
| `ASSERT_AND_REJECT` | comprobar un invariante local ya aprobado | aceptar la fila o abortar la operación de forma cerrada |
| `DERIVE_BOUNDED_REPRESENTATION` | producir una derivación local, determinista y no ambigua ya autorizada | derivación coherente con fuente y versiones o rechazo |
| `STAMP_DEFENSIVE_METADATA` | estampar metadata técnica acotada de la operación defensiva | metadata técnica coherente sin alterar semántica empresarial |

No existen modos implícitos adicionales.

#### 9. `NO_TRIGGER`

`NO_TRIGGER` es el modo predeterminado y una salida completamente válida.

Se selecciona cuando:

- el constraint declarativo protege íntegramente el invariante;
- un índice único certificado protege la concurrencia requerida;
- el servicio y la RPC ya garantizan la semántica sin una vía de bypass material;
- la derivación corresponde a generated column u otra estructura más apropiada;
- el costo del trigger excede el beneficio defensivo;
- no existe un invariante local verificable sin semántica adicional;
- cualquier trigger posible necesitaría red, workflow, scans globales o revisión humana;
- el paquete no tiene writers alternos que justifiquen una barrera adicional.

No se crea un trigger vacío para satisfacer la existencia de la tarea.

#### 10. `ASSERT_AND_REJECT`

Este modo se limita a invariantes que pueden evaluarse de forma determinista con el estado local permitido y cuyo resultado es binario para la escritura actual.

Puede comprobar, cuando el descriptor lo exija:

- presencia de contexto de operación;
- compatibilidad entre política, versión, clase, fuente y representación;
- expectativa de versión o hash de fuente;
- coherencia entre una derivación persistida y su fuente;
- prohibición de escritura directa sobre un campo gobernado;
- relaciones locales necesarias para impedir un estado inválido no cubierto por constraint declarativo.

Reglas:

1. no corrige la fila para convertir un fallo en éxito;
2. no selecciona otra versión;
3. no consulta una cola humana;
4. no ejecuta matching difuso;
5. no decide identidad o sobreviviente;
6. el rechazo aborta la operación dentro de la misma transacción;
7. el error debe ser distinguible por la capa transaccional propietaria.

#### 11. `DERIVE_BOUNDED_REPRESENTATION`

Este modo solo es admisible para una derivación que sea simultáneamente:

```text
LOCAL
DETERMINISTIC
BOUNDED
UNAMBIGUOUS
VERSION_FIXED
SOURCE_LINKED
POLICY_AUTHORIZED
NO_NETWORK
NO_GLOBAL_SCAN
NO_HUMAN_DECISION
```

La derivación no puede convertirse en valor empresarial mostrado, identidad, alias, decisión de revisión ni sustituto de la fuente.

La función puede reutilizar una primitiva SQL certificada si existe, pero no recrear en PL/pgSQL una segunda implementación del servicio.

Si el cálculo depende de catálogo mutable, diccionario, aliases, ranking, contexto externo, revisión, configuración implícita o selección dinámica de versión, la derivación pertenece al servicio/RPC y este modo queda bloqueado.

#### 12. `STAMP_DEFENSIVE_METADATA`

Este modo se limita a metadata técnica necesaria para defender o correlacionar la operación, por ejemplo:

- versión de contrato defensivo aplicada;
- digest ya resuelto por la capa propietaria;
- marca técnica de intervención;
- correlación con la operación lógica;
- indicación de que una defensa local se ejecutó.

La metadata:

1. no reemplaza la auditoría raíz de la RPC;
2. no inventa actor ni autorización;
3. no constituye una decisión empresarial;
4. no sustituye el registro operacional de DB-009;
5. no puede transformar el valor fuente;
6. debe ser idempotente para el mismo efecto lógico.

#### 13. Matriz mínima de decisión

Cada candidata deberá responder, en orden:

```text
¿Existe invariante aprobado?
→ NO: NO_TRIGGER o BLOCKED

¿Constraint o índice lo protegen completamente?
→ SÍ: NO_TRIGGER

¿Servicio/RPC lo protegen y no existe bypass material?
→ SÍ: NO_TRIGGER

¿La defensa solo necesita assert local?
→ SÍ: ASSERT_AND_REJECT

¿La defensa requiere derivación local exacta ya autorizada?
→ SÍ: DERIVE_BOUNDED_REPRESENTATION

¿Solo requiere metadata técnica defensiva?
→ SÍ: STAMP_DEFENSIVE_METADATA

¿Requiere semántica, red, workflow, fuzzy, ranking o scan global?
→ BLOCKED; no pertenece a DB-008
```

La matriz debe producir una disposición por operación, no una conclusión genérica por tabla.

#### 14. Frontera con constraints e índices

DB-008 no recrea responsabilidades de DB-006 o DB-007.

Reglas:

1. un `CHECK`, FK, `NOT NULL`, PK o `UNIQUE` directo suficiente permanece declarativo;
2. un índice único normalizado certificado permanece enforcement atómico de unicidad;
3. el trigger no realiza una consulta previa para simular unicidad si existe una estrategia atómica disponible;
4. el trigger no usa `SELECT ... LIMIT 1` para convertir ausencia observada en garantía concurrente;
5. un índice parcial o de expresión no necesita un trigger duplicado por el solo hecho de ser especializado;
6. un trigger no puede suavizar el error de un constraint o índice y persistir otra cosa silenciosamente.

#### 15. Frontera con servicio y RPC

El servicio de dominio continúa siendo la única autoridad semántica y la RPC la frontera transaccional de mutación.

El trigger no puede:

- seleccionar policy coordinate;
- decidir qué regla es `latest`;
- resolver capitalización, ortografía, aliases o marcas;
- confirmar autorización;
- aceptar un preview como decisión de commit;
- reinterpretar un resultado bloqueado;
- iniciar una mutación empresarial alternativa;
- confirmar éxito al cliente.

La RPC deberá tratar el rechazo del trigger como fallo de la misma operación lógica y no como un efecto secundario independiente.

#### 16. Eventos permitidos y minimización de disparo

Una instancia deberá seleccionar solo los eventos estrictamente necesarios entre:

```text
INSERT
UPDATE
DELETE
```

`TRUNCATE` no se usa como defensa normal de normalización por fila. Solo podría evaluarse bajo un contrato propietario explícito distinto que demuestre su necesidad y no invada responsabilidades de retención, seguridad o administración de datos.

Reglas:

1. no se crea un trigger `INSERT OR UPDATE OR DELETE` por comodidad;
2. `UPDATE OF` se usa cuando el conjunto de columnas gobernadas está cerrado y su semántica es compatible;
3. una defensa que solo importa ante cambio real deberá además distinguir `OLD` y `NEW` cuando corresponda;
4. operaciones no gobernadas no pagan el costo del trigger sin justificación.

#### 17. `BEFORE` como barrera de fila

`BEFORE ROW` es la modalidad preferente cuando la defensa necesita:

- rechazar la fila antes de persistirla;
- inspeccionar `OLD`/`NEW` no generados;
- derivar una representación acotada en `NEW`;
- estampar metadata técnica antes de escribir.

La función deberá devolver el registro esperado o rechazar explícitamente.

Un `BEFORE` que devuelve `NULL` y omite silenciosamente una fila no se usa para esconder una violación empresarial. Si la operación debe rechazarse, el fallo deberá ser explícito y distinguible.

#### 18. `AFTER` y visibilidad transaccional

`AFTER` solo se utiliza cuando la defensa necesita observar el estado resultante que no está disponible correctamente en `BEFORE` o producir evidencia hija local que dependa de la fila ya procesada.

`AFTER` continúa ejecutándose **dentro de la misma transacción**; no equivale a post-commit.

Por tanto:

1. no se ejecutan llamadas de red desde DB-008;
2. no se asume que un sistema externo verá una operación que todavía puede revertirse;
3. propagación externa o workflow asíncrono pertenece a mecanismos post-commit propietarios;
4. un fallo de `AFTER` puede abortar la transacción y debe tratarse como tal.

#### 19. Generated columns y orden de cálculo

Una stored generated column se calcula después de los triggers `BEFORE` y antes de los triggers `AFTER`.

Consecuencias:

1. el valor nuevo de una generated column no se usa como entrada fiable dentro de `BEFORE`;
2. un `BEFORE` no intenta escribir el valor generated como autoridad propia;
3. si una defensa necesita inspeccionar el generated resultante, deberá evaluarse una modalidad posterior compatible;
4. si la generated column ya garantiza la derivación necesaria, la operación puede terminar en `NO_TRIGGER`.

DB-008 no convierte generated columns en valores editables.

#### 20. `WHEN`, `UPDATE OF` y cambios reales

La instancia deberá minimizar invocaciones usando el mecanismo más estrecho compatible con el invariante.

Puede utilizar:

- `UPDATE OF` para limitar columnas objetivo;
- `WHEN` para evitar trabajo cuando la condición local demuestra que la defensa no aplica;
- comparación `IS DISTINCT FROM` dentro del contrato cuando el cambio real de valor sea material.

Debe recordarse que `UPDATE OF` se activa porque la columna aparece en la lista `SET`, aunque el valor final no cambie. La semántica de “columna mencionada” no se confunde con “valor efectivamente modificado”.

#### 21. Orden entre múltiples triggers

PostgreSQL ejecuta en orden alfabético por nombre los múltiples triggers de la misma clase para el mismo evento.

DB-008 prohíbe depender de un orden accidental de nombres legacy.

Si dos defensas del mismo paquete deben coexistir:

1. se demuestra que son conmutativas; o
2. se consolida la responsabilidad cuando sea correcto; o
3. se fija una convención explícita de orden y se prueba la composición completa.

Renombrar un trigger para alterar precedencia es un cambio contractual y requiere migración, pruebas y rollback.

#### 22. Triggers en tablas particionadas

Antes de crear un row-level trigger sobre una tabla particionada deberá recapturarse la topología de particiones.

La instancia deberá considerar que PostgreSQL crea triggers clonados sobre las particiones existentes y futuras y gestiona esos clones al adjuntar o separar particiones.

Por tanto se verificará:

- nombres en particiones;
- conflictos de nombre;
- definición efectiva en cada partición;
- impacto de attach/detach;
- costo agregado de escritura;
- rollback sobre parent y clones;
- drift entre particiones.

No se materializa un trigger sobre el parent sin esta reconciliación.

#### 23. Statement triggers y transition relations

La defensa DB-008 es row-local por defecto.

Un statement-level trigger o transition relation solo es admisible si el package demuestra que:

- el invariante no puede defenderse correctamente por fila;
- el conjunto de transición es estrictamente acotado al statement actual;
- no se convierte en scan global;
- no ejecuta clustering, matching, workflow ni consolidación;
- el costo y la visibilidad de datos están medidos;
- la conducta bajo operaciones multirow es determinista.

La posibilidad técnica de usar `OLD TABLE` o `NEW TABLE` no constituye necesidad de diseño.

#### 24. Constraint triggers

Un constraint trigger no se utiliza para evadir la frontera de DB-006.

Como regla general, si el invariante es declarativo y debe comportarse como constraint, DB-006 conserva la propiedad.

Una futura instancia solo podrá justificar un constraint trigger si existe un contrato específico que requiera su semántica diferida y no sea representable por un constraint declarativo ordinario. Esa excepción debe mantener las mismas puertas de seguridad, costo, evidencia y rollback.

#### 25. Contrato de la función de trigger

Toda función usada por DB-008 deberá declarar y permitir verificar:

```text
function_identity
function_version_or_digest
trigger_mode
owned_invariant
source_relation
trigger_events
trigger_timing
row_or_statement_scope
columns_or_when_filter
relations_read
relations_written
security_mode
search_path
required_context
expected_version_inputs
failure_behavior
idempotency_behavior
recursion_behavior
performance_budget
rollback_reference
```

La función de trigger puede ser `VOLATILE` por la naturaleza de una función de trigger; esto no autoriza dependencia semántica de hora, aleatoriedad, red, configuración implícita ni fuentes mutables no declaradas.

#### 26. Funciones puras reutilizadas

Cuando un trigger reutilice una primitiva de normalización o comparación, esa primitiva deberá provenir del contrato propietario aplicable y conservar su identidad y versión.

La primitiva reutilizada deberá permanecer:

- local;
- determinista respecto de sus entradas declaradas;
- acotada;
- sin red;
- sin scans globales;
- sin fuzzy matching;
- sin revisión humana;
- sin selección de registro;
- sin propagación;
- sin corrección semántica ambigua.

No se marca una función como `IMMUTABLE` solo para satisfacer otra característica física.

#### 27. Seguridad de funciones

La función de trigger usará `SECURITY INVOKER` por defecto.

`SECURITY DEFINER` solo será admisible cuando exista una necesidad explícita que no pueda resolverse con privilegios ordinarios y deberá acompañarse de:

1. owner controlado;
2. `search_path` fijo y seguro;
3. referencias schema-qualified para objetos sensibles;
4. mínimo privilegio;
5. revisión de privilegios `EXECUTE`;
6. revisión del efecto sobre RLS;
7. ausencia de inputs libres usados como autoridad;
8. pruebas negativas de bypass;
9. plan de revocación y rollback.

Una función definer observada en remoto no se adopta por existir.

#### 28. RLS, grants y autorización

El trigger no sustituye RLS, grants ni autorización RPC.

Reglas:

1. RLS controla acceso a filas según el contrato de la relación;
2. grants controlan capacidades SQL;
3. RPC revalida actor, finalidad y contexto;
4. el trigger defiende el invariante local cuando la escritura alcanza la relación;
5. el trigger no confía en un `actor_id` libre del payload;
6. service-role o una función privilegiada no constituyen autorización semántica;
7. una defensa no debe exponer un camino de función invocable que permita saltar la RPC.

La seguridad se prueba como composición, no por control aislado.

#### 29. Contexto de operación

Cuando una defensa requiera contexto, la instancia deberá definir un mecanismo transaccional explícito y no falsificable dentro del modelo de privilegios aplicable.

El contexto puede incluir, según el descriptor:

- logical operation identity;
- `package_id`;
- policy/version set ya resuelto;
- source expectation;
- propósito o clase de operación;
- referencia al comando propietario.

No se acepta como prueba de autoridad:

- un texto arbitrario enviado por cliente;
- una variable de sesión escribible por el caller sin control;
- un actor declarado sin revalidación;
- una bandera booleana genérica de bypass.

La ausencia o incompatibilidad del contexto requerido produce fallo cerrado.

#### 30. Idempotencia y reintentos

El trigger participa en la misma operación lógica que cliente, RPC, servicio y efectos hijos.

Para un mismo efecto confirmado:

1. no crea una segunda decisión;
2. no duplica metadata defensiva;
3. no emite dos eventos hijos equivalentes;
4. no cambia el conjunto de versiones;
5. no genera otra derivación si la fuente y versión siguen idénticas;
6. no transforma un retry en una operación nueva por sí mismo.

La recuperación de timeouts y respuestas perdidas pertenece a la frontera transaccional; el trigger no inventa una nueva clave idempotente.

#### 31. Concurrencia y estado obsoleto

El trigger puede verificar expectativas locales ya resueltas, pero no sustituye la revalidación completa de la RPC.

Cuando el invariante dependa de fuente o versión deberá impedir que una operación obsoleta persista una derivación incompatible.

El diseño declarará, cuando aplique:

```text
source_value_version_or_hash
version_set_digest
expected_row_version
expected_derivation_state
```

Un mismatch produce rechazo o conflicto distinguible. No se aplica “último escritor gana” de forma silenciosa.

#### 32. Fallo cerrado y taxonomía

Toda intervención del trigger deberá terminar en un resultado distinguible entre, como mínimo:

- contexto requerido ausente o incompatible;
- versión o digest incompatible;
- fuente obsoleta;
- invariante local violado;
- escritura directa no autorizada por el contrato;
- derivación defensiva incompatible;
- error técnico interno.

La tarea no fija códigos físicos universales ni mensajes de usuario; cada package deberá mapear estas clases al contrato de errores propietario sin degradarlas a éxito.

No existe fallback semántico dentro del trigger.

#### 33. Auditoría y frontera con DB-009

La RPC continúa siendo propietaria de una sola auditoría raíz por mutación.

DB-008 puede producir únicamente evidencia hija cuando el trigger:

- rechaza;
- detecta drift de contexto;
- deriva una representación acotada;
- estampa metadata defensiva;
- detecta una condición que requiere investigación.

La evidencia hija deberá poder correlacionarse con la operación lógica y declarar la identidad/version del trigger o función que intervino.

DB-008 no define todavía la persistencia completa de:

- valor previo;
- valor resultante;
- versión de regla;
- estructura definitiva del ledger operacional.

Esa responsabilidad pertenece a DB-009.

#### 34. Escrituras directas y bypass

Los campos gobernados no admiten escrituras directas ordinarias que evadan el comando propietario.

Un bypass futuro solo es válido si declara:

```text
actor autorizado
finalidad
scope
ventana temporal
versiones
controles compensatorios
evidencia
rollback
```

Reglas:

1. una credencial privilegiada no habilita bypass por sí misma;
2. scripts, consola, imports y jobs usan el mismo contrato o un bypass explícito;
3. deshabilitar temporalmente un trigger exige transición gobernada;
4. las filas afectadas por una ventana sin defensa deben verificarse posteriormente;
5. no se elimina una defensa para “hacer pasar” un backfill incompatible.

#### 35. Recursión, reentrancia y cascadas

Una función DB-008 deberá declarar si escribe la misma relación o cualquier relación que pueda volver a disparar la cadena.

Por defecto:

- no actualiza la misma fila mediante un segundo `UPDATE` cuando puede usar `NEW` en `BEFORE`;
- no inicia cascadas de triggers como workflow oculto;
- no propaga a agregados o copias;
- no depende de profundidad de recursión como mecanismo de negocio;
- no usa una guarda global que pueda ocultar efectos legítimos concurrentes.

Cualquier cadena existente se inventaría y prueba como grafo antes de coexistencia o reemplazo.

#### 36. Rendimiento y costo acotado

Cada trigger deberá demostrar costo acotado para el workload del paquete.

Quedan prohibidos dentro de DB-008:

- scans globales;
- fuzzy matching;
- clustering;
- selección del mejor candidato;
- HTTP o red;
- espera de workflow;
- acceso a proveedores lingüísticos;
- procesamiento masivo de corpus;
- propagación multiagregado no acotada.

La evaluación física futura medirá al menos:

- writes por segundo;
- latencia p50/p95/p99 de la escritura;
- tiempo propio de la defensa cuando sea observable;
- CPU e I/O relevantes;
- lock waits;
- deadlocks;
- timeouts;
- filas rechazadas por clase;
- overhead frente al baseline sin trigger;
- impacto de cascadas o funciones dependientes.

Un trigger semánticamente correcto pero operacionalmente inseguro no se activa.

#### 37. Baseline remoto observado

El corte read-only de `vento-os-dev` observado durante esta definición reportó:

```text
PostgreSQL = 17.6
non_internal_triggers = 173
enabled_origin_triggers = 173
trigger_functions_SECURITY_DEFINER = 30
trigger_functions_VOLATILE = 173
trigger_functions_STABLE = 0
trigger_functions_IMMUTABLE = 0
```

Distribución observada de triggers no internos:

```text
public = 124
pass = 28
talento = 10
club = 8
pos = 2
payments = 1
```

No se observaron triggers no internos en `app_private` ni `viso` dentro del corte consultado.

Este inventario es baseline, no clasificación canónica.

#### 38. Familias legacy observadas

El remoto contiene, entre otras, familias nominales de:

- `updated_at` / `touch_updated_at` / stamping;
- `validate_*` y `enforce_*`;
- `sync_*` y propagación;
- validaciones de sitio, área, inventario, receta y operación;
- funciones de trigger `SECURITY DEFINER` e invoker.

DB-008 no adopta ninguna familia por nombre.

En particular:

1. un `updated_at` puede corresponder a stamping técnico, pero no adquiere automáticamente el contrato `STAMP_DEFENSIVE_METADATA`;
2. un `validate_*` puede ser defensa legítima o lógica empresarial oculta;
3. un `sync_*` puede implementar propagación y, por tanto, quedar fuera del alcance defensivo de DB-008;
4. un trigger definer requiere revisión específica de seguridad;
5. dos triggers con función parecida pueden tener scopes y contratos distintos.

#### 39. Inventario obligatorio por trigger legacy

Antes de coexistir, adoptar, sustituir o retirar un trigger existente, la futura instancia deberá registrar:

```text
schema
table
trigger_name
events
timing
row_or_statement
when_or_update_of_scope
function_identity
function_definition_digest
security_mode
function_owner
search_path
execute_privileges
relations_read
relations_written
side_effects
errors
recursion_or_chain
RLS_interaction
callers_and_writers
business_owner
package_scope
canonical_disposition
rollback
```

La cardinalidad debe cerrarse contra el universo exacto del package; faltantes y duplicados bloquean la reconciliación.

#### 40. Migraciones forward-only

Toda modificación física futura de funciones o triggers Vento se origina y versiona en `vento-shell`.

Queda prohibido:

- crear o editar el trigger manualmente en Dashboard como estado final;
- editar una migración ya aplicada;
- reemplazar una función remota sin fuente versionada;
- cambiar seguridad o `search_path` fuera de migración;
- aceptar drift remoto como nueva verdad por conveniencia;
- borrar el trigger anterior antes de validar consumidores y rollback.

Una corrección posterior produce otra migración y conserva evidencia de transición.

#### 41. Readiness de materialización

Una defensa está lista para diseñarse físicamente solo cuando:

```text
package_id identificado
AND invariante propietario aprobado
AND operación identificada
AND trigger_mode resuelto
AND servicio propietario identificado
AND RPC propietaria identificada
AND controles declarativos reconciliados
AND writers inventariados
AND legacy reconciliado
AND versión fijada
AND contexto definido
AND seguridad resuelta
AND costo acotado
AND pruebas preparadas
AND rollback preparado
AND drift reconciliado
```

Si falta una condición, el trigger permanece `BLOCKED` o la operación queda en `NO_TRIGGER` según corresponda.

#### 42. Activación

La mera existencia del trigger no permite declararlo activo de forma segura.

La activación requiere:

1. migración registrada;
2. función y trigger con definición esperada;
3. seguridad y privilegios verificados;
4. writers compatibles;
5. corpus positivo y negativo aprobado;
6. reintentos y concurrencia probados;
7. error mapping verificado;
8. costo y locks dentro de presupuesto;
9. orden con otros triggers verificado;
10. particiones verificadas cuando apliquen;
11. no existencia de workflow oculto;
12. evidencia de que la semántica continúa en servicio/RPC;
13. rollback disponible;
14. gates del paquete abiertos.

Un trigger creado pero no certificado permanece fuera del path aprobado.

#### 43. Rollback y retiro

El rollback de DB-008 no corrige datos ni reconstruye historia.

Cada instancia deberá declarar una estrategia que pueda incluir:

- retirar el trigger del path activo mediante migración posterior;
- restaurar una función/trigger anterior compatible;
- volver temporalmente a `NO_TRIGGER` únicamente si la seguridad del paquete lo permite;
- mantener servicio, RPC, constraints e índices compatibles;
- preservar evidencia de rechazos e intervenciones;
- verificar filas afectadas durante la transición.

No se reactiva una versión retirada sin reevaluación.

El retiro definitivo exige demostrar que ningún writer depende ya de la defensa o que un control propietario equivalente la reemplazó.

#### 44. Red, Webhooks y efectos externos

Aunque Supabase puede implementar Database Webhooks sobre triggers y `pg_net` permite solicitudes asíncronas, esas capacidades quedan fuera de DB-008.

Un trigger de normalización defensiva no:

- llama HTTP;
- llama Edge Functions;
- emite webhooks;
- contacta proveedores;
- espera respuestas externas;
- utiliza red como parte del invariante;
- convierte un evento externo en condición de commit.

Los efectos externos siguen la arquitectura de integración y propagación post-commit propietaria.

#### 45. Búsqueda, similitud e identidad

DB-008 no participa en consultas de búsqueda.

El trigger no:

- rankea;
- pagina;
- tokeniza para descubrir candidatos;
- ejecuta similitud;
- selecciona el primer resultado;
- decide alias;
- convierte una clave de búsqueda en identidad;
- fusiona registros;
- reasigna relaciones;
- desactiva sobrevivientes.

La existencia de un índice de DB-007 no cambia esta frontera.

#### 46. Frontera VITAL

VITAL permanece fuera del alcance transversal de Vento OS.

La coexistencia en el mismo proyecto o infraestructura no autoriza:

- instalar triggers DB-008 sobre objetos VITAL;
- reutilizar sus triggers como patrón canónico;
- aplicar políticas Vento a sus datos;
- usar sus resultados como evidencia de paridad.

Cualquier interacción explícita futura deberá conservar una frontera contractual separada.

#### 47. Handoff hacia DB-009

DB-008 entrega a DB-009 la información necesaria para persistir auditoría operacional sin duplicar la auditoría raíz de la RPC.

El handoff deberá declarar, cuando aplique:

```text
package_id
logical_operation_reference
trigger_identity
trigger_function_identity
trigger_contract_version_or_digest
trigger_mode
owned_invariant
table_and_event
intervention_class
expected_source_or_version_reference
outcome
child_evidence_required
sensitivity_class
```

DB-009 conserva la definición y persistencia de valor previo, valor resultante, versión de regla y estructura operacional de auditoría.

#### 48. Frontera con DB-010

DB-008 define pruebas que una futura instancia deberá preparar, pero no absorbe la certificación final de DB-010.

DB-010 conserva la prueba física final de:

- idempotencia;
- rollback;
- ausencia de cambios semánticos;
- paridad entre capas;
- comportamiento ante reintentos y fallos;
- evidencia de cierre del minibloque.

DB-008 no se declara certificado globalmente por el solo hecho de que un trigger exista o rechace una fila de prueba.

#### 49. Evidence bundle físico futuro

Una futura instancia deberá conservar como mínimo:

```text
instance_id
package_id
environment_identity
candidate_commit_sha
migration_history_digest
source_cut_reference
DB007_handoff_reference
operation_inventory
trigger_mode_matrix
legacy_trigger_inventory
trigger_function_digests
trigger_definitions
security_mode_and_owner
search_path_and_execute_grants
RLS_and_grants_observation
writer_registry_version
version_set_digest
context_contract
error_contract
recursion_and_chain_analysis
partition_analysis
ordering_analysis
performance_baseline
performance_observation
validation_results
rollback_plan_id
trigger_inventory_after
outcome
```

Campos materiales ausentes producen bloqueo, no asunción.

#### 50. Secuencia obligatoria por futura instancia

La secuencia física será:

```text
1. verificar package_id y gates
2. recapturar drift y triggers actuales
3. consumir handoff DB-007
4. inventariar operaciones y writers
5. reconciliar constraints, índices, servicio y RPC
6. asignar un trigger_mode a cada operación
7. cerrar NO_TRIGGER y BLOCKED antes de diseñar DDL
8. reconciliar triggers y funciones legacy
9. fijar versión, contexto, seguridad y errores
10. analizar orden, recursión y particiones
11. medir baseline de escritura
12. preparar migración forward-only
13. materializar función y trigger solo si corresponde
14. verificar definición, ownership, grants, RLS y search_path
15. ejecutar corpus positivo y negativo
16. probar direct write, bypass, retries y concurrencia
17. medir rendimiento y locks
18. comprobar que no existe workflow, red o semántica oculta
19. activar únicamente con gates completos
20. entregar evidencia y handoff a DB-009
```

La plantilla no autoriza ejecutar esta secuencia desde la conversación documental.

#### 51. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

**Requisitos creados:** 0
**Requisitos modificados:** 0

**Justificación:** la tarea materializa por `package_id` obligaciones ya aprobadas sobre capas, trigger defensivo, contexto, atomicidad, versiones, idempotencia, direct writes, seguridad, rendimiento, compatibilidad legacy, auditoría y rollback. No introduce una nueva semántica empresarial ni una nueva clase de riesgo sin cobertura.

#### 52. Cobertura de prueba vigente reutilizada

La cobertura existente aplicable incluye:

- `TREQ-DATA-084` para paridad e idempotencia entre capas;
- `TREQ-DATA-158` para determinismo y dependencias explícitas;
- `TREQ-DATA-163` para correlación de operación entre capas;
- `TREQ-DATA-191` para las cuatro capas y funciones no intercambiables;
- `TREQ-DATA-193` para autoridad semántica del servicio;
- `TREQ-DATA-194` para frontera RPC transaccional;
- `TREQ-DATA-195` para los cuatro modos cerrados de trigger defensivo;
- `TREQ-DATA-196` para el descriptor de colocación;
- `TREQ-DATA-197` para secuencia transaccional canónica;
- `TREQ-DATA-198` para atomicidad y efecto de rechazo;
- `TREQ-DATA-199` para paridad de versiones;
- `TREQ-DATA-200` para idempotencia y concurrencia entre capas;
- `TREQ-DATA-202` para escrituras directas y bypass;
- `TREQ-DATA-203` para normalización determinista y derivación acotada;
- `TREQ-DATA-204` para reglas léxicas y prohibición de semántica en trigger;
- `TREQ-DATA-205` para exclusión del trigger del path de búsqueda;
- `TREQ-DATA-206` para unicidad y atomicidad sin fuzzy ni fusión;
- `TREQ-DATA-208` para prohibición de propagación externa desde trigger;
- `TREQ-DATA-209` para auditoría raíz única y evidencia hija;
- `TREQ-DATA-210` para fallo cerrado;
- `TREQ-DATA-211` para autorización y privilegio mínimo;
- `TREQ-DATA-212` para costo acotado y límites de rendimiento;
- `TREQ-DATA-213` para reconciliación de helpers y triggers legacy;
- `TREQ-DATA-214` para corpus integral de conformidad.

Estas referencias son trazabilidad de cobertura vigente; no modifican el registro.

#### 53. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | La batería integral del checkout corresponde a la rama documental después de incorporar el bloque al archivo propietario. |
| LOCAL | PASS | Artefacto contrastado contra estructura canónica, metadata obligatoria, continuidad, cardinalidad de evidencia, declaración TREQ cero, UTF-8, LF, whitespace, contenido prohibido y reglas semánticas reproducibles del entregable aislado. |
| REMOTA | PASS | Se contrastaron `main`, owner R, contrato ARC-011, 04A DATA, topología, scripts documentales y un baseline read-only de `vento-os-dev`; PostgreSQL 17.6 y 173 triggers no internos fueron observados sin mutaciones remotas. |
| OPERATIVA | NOT_EXECUTED | Costo de escritura, locks, ordering, recursión, particiones, concurrencia, bypass y rollback pertenecen a futuras instancias físicas autorizadas. |
| FÍSICA | NOT_APPLICABLE | Esta definición documental no crea, reemplaza, habilita, deshabilita ni elimina funciones, triggers, migraciones, constraints, índices, RLS, grants o datos. |

#### 54. Decisiones vinculantes

1. DB-008 es `TEMPLATE_PER_PACKAGE` y no global.
2. El gate físico es `POST_E5_PACKAGE`.
3. El trigger es la última barrera, no la autoridad semántica.
4. Cada operación usa exactamente uno de cuatro modos cerrados.
5. `NO_TRIGGER` es el modo predeterminado y una salida válida.
6. Constraint o índice suficiente excluye un trigger duplicado.
7. Servicio y RPC conservan semántica, autorización y commit.
8. `ASSERT_AND_REJECT` falla cerrado y no repara silenciosamente.
9. `DERIVE_BOUNDED_REPRESENTATION` exige derivación local, determinista y ya autorizada.
10. `STAMP_DEFENSIVE_METADATA` no reemplaza auditoría raíz ni DB-009.
11. `BEFORE ROW` es preferente para defensa local cuando corresponda.
12. `AFTER` sigue dentro de la misma transacción y no significa post-commit.
13. Generated columns se respetan según su orden de cálculo.
14. `UPDATE OF` no demuestra que el valor realmente haya cambiado.
15. El orden alfabético de triggers no se usa accidentalmente como lógica empresarial.
16. Tablas particionadas requieren reconciliación de clones y drift.
17. Statement triggers y transition relations no son el default.
18. Constraint triggers no evaden la propiedad de DB-006.
19. La función de trigger declara identidad, seguridad, dependencias y costo.
20. `SECURITY INVOKER` es el default.
21. `SECURITY DEFINER` exige necesidad explícita, `search_path` seguro y privilegio mínimo.
22. RLS, grants y trigger son controles diferentes.
23. El contexto requerido no puede ser una bandera libre del cliente.
24. Reintentos no duplican efectos ni cambian versiones.
25. Estado obsoleto produce rechazo o conflicto distinguible.
26. No existe fallback semántico dentro del trigger.
27. DB-009 conserva auditoría operacional completa.
28. Bypass privilegiado requiere contrato, ventana, evidencia y rollback.
29. Recursión y cadenas de triggers se inventarían y prueban antes de activación.
30. El costo debe permanecer acotado.
31. Los 173 triggers observados son baseline, no autoridad canónica.
32. `updated_at`, `validate_*`, `enforce_*` y `sync_*` se clasifican por comportamiento real, no por nombre.
33. Toda modificación física futura se versiona en `vento-shell`.
34. Database Webhooks, `pg_net`, HTTP y llamadas externas quedan fuera de DB-008.
35. El trigger no participa en búsqueda, similitud, ranking, fusión o reasignación.
36. VITAL permanece fuera del alcance transversal.
37. DB-010 conserva la certificación física final del minibloque.
38. La tarea crea o modifica cero requisitos de prueba.

#### 55. Criterios de aceptación

DB-008 queda documentalmente aceptable cuando:

1. conserva topología y gate vigentes;
2. consume el handoff de DB-007 sin duplicar índices o constraints;
3. define exactamente los cuatro modos de trigger;
4. establece `NO_TRIGGER` como salida válida;
5. conserva servicio como autoridad semántica y RPC como frontera transaccional;
6. limita `ASSERT_AND_REJECT` a invariantes locales;
7. limita derivaciones a resultados acotados y ya autorizados;
8. separa stamping técnico de auditoría operacional;
9. define eventos y timing sin catch-all innecesario;
10. diferencia `BEFORE`, `AFTER` y post-commit;
11. contempla generated columns, `WHEN` y `UPDATE OF`;
12. controla ordering, particiones y transition relations;
13. evita constraint triggers como atajo de DB-006;
14. fija contrato de función y primitivas reutilizadas;
15. define seguridad invoker/definer, `search_path`, grants y RLS;
16. prohíbe contexto falsificable;
17. cubre idempotencia, reintentos y concurrencia;
18. exige fallo cerrado y errores distinguibles;
19. mantiene auditoría raíz fuera del trigger;
20. gobierna bypass y deshabilitación temporal;
21. controla recursión y cadenas;
22. exige costo acotado y medición;
23. reconcilia el baseline legacy por package;
24. mantiene migraciones forward-only;
25. define readiness, activación y rollback;
26. prohíbe red y workflow externo;
27. mantiene búsqueda, identidad y VITAL fuera de alcance;
28. entrega un handoff cerrado hacia DB-009;
29. mantiene cero cambios TREQ;
30. contiene exactamente cinco clases de evidencia;
31. termina en continuidad canónica sin desarrollar DB-009.

#### 56. Límites

Esta tarea documental no:

- crea o modifica triggers;
- crea o modifica funciones;
- crea migraciones;
- ejecuta DDL o DML;
- habilita o deshabilita triggers;
- modifica constraints o índices;
- ejecuta backfills;
- cambia datos empresariales;
- altera RLS, grants, ownership o `search_path` remoto;
- crea Database Webhooks;
- habilita `pg_net`;
- llama Edge Functions;
- implementa propagación;
- implementa workflow;
- decide normalización semántica;
- decide identidad, unicidad o duplicidad;
- ejecuta fuzzy matching, ranking o búsqueda;
- crea auditoría operacional de DB-009;
- ejecuta certificación física de DB-010;
- modifica el registro 04A;
- autoriza una instancia física;
- modifica objetos VITAL;
- desarrolla DB-009 o DB-010.

---

#### 57. Continuidad

**ÚLTIMA TAREA APROBADA**
`DATA-NORM-DB-007 — Implementar índices de búsqueda y unicidad normalizada`

**TAREA ACTUAL APROBADA**
`DATA-NORM-DB-008 — Implementar triggers únicamente como barrera defensiva final`

**SIGUIENTE TAREA RESERVADA**
`DATA-NORM-DB-009 — Registrar valor previo, valor resultante y versión de regla`


### [ ] DATA-NORM-DB-009 — Registrar valor previo, valor resultante y versión de regla
### [ ] DATA-NORM-DB-010 — Probar idempotencia, rollback y ausencia de cambios semánticos
