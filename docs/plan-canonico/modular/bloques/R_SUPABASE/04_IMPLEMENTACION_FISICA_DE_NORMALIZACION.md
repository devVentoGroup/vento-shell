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


### [ ] DATA-NORM-DB-004 — Ejecutar dry-runs y reportes de colisiones
### [ ] DATA-NORM-DB-005 — Ejecutar backfills aprobados por dominio
### [ ] DATA-NORM-DB-006 — Implementar constraints después de reconciliar datos
### [ ] DATA-NORM-DB-007 — Implementar índices de búsqueda y unicidad normalizada
### [ ] DATA-NORM-DB-008 — Implementar triggers únicamente como barrera defensiva final
### [ ] DATA-NORM-DB-009 — Registrar valor previo, valor resultante y versión de regla
### [ ] DATA-NORM-DB-010 — Probar idempotencia, rollback y ausencia de cambios semánticos
