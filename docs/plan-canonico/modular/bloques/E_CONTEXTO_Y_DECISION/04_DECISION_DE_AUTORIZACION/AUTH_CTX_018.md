### ✅ AUTH-CTX-018 — Incluir recurso y territorio resueltos

**Estado:** APROBADA  
**Bloque:** BLOQUE E — Contexto y decisión de autorización unificados  
**Subbloque:** AUTHORIZATION DECISION  
**Naturaleza:** Definición documental de `ResolvedResourceContext` y `ResolvedTerritoryContext`  
**Implementación física:** No incluida  
**Tarea anterior vigente:** AUTH-CTX-017 — APROBADA  
**Tarea posterior reservada:** AUTH-CTX-019 — Incluir decisión del carril base  
**Contrato afectado:** `AuthorizationDecision@1.0.0`  
**Campo principal afectado:** `resource`  
**Tipos principales afectados:** `ResolvedResourceContext`, `ResolvedTerritoryContext`  
**Fuente normativa:** `resource_contract_id` del permiso canónico solicitado  
**Cambio contractual:** Aclaración normativa compatible; no cambia la forma publicada  
**Cambios físicos permitidos:** No

Esta tarea define cómo `AuthorizationDecision` resuelve el recurso empresarial
exacto sobre el cual se intenta ejecutar una capacidad y cómo deriva su
territorio real, estado, propiedad, sujeto, lados obligatorios, campos
protegidos y condiciones de concurrencia.

La regla central es:

```text
EL CONTEXTO DEL ACTOR
LIMITA
EL RECURSO REAL

EL CONTEXTO DEL ACTOR
NO CREA
NI REEMPLAZA
EL RECURSO O SU TERRITORIO
```

La tarea impide autorizar únicamente contra:

- un `site_id` enviado por el cliente;
- un `area_id` enviado por el cliente;
- la sede seleccionada;
- la sede primaria;
- la sede del turno;
- el área del turno;
- la sede del dispositivo;
- el último recurso consultado;
- una ruta;
- un nombre humano;
- un payload no normalizado.

No modifica contratos de recursos aprobados, no crea fuentes físicas, no
implementa resolvers, SQL, RPC, RLS, migraciones, transacciones, locks,
consultas, filtros ni cambios en Supabase.

---

#### 1. Objetivo

Definir el campo `resource` de manera que Vento OS pueda responder
inequívocamente:

1. cuál tipo de recurso exige el permiso;
2. qué forma de solicitud fue recibida;
3. si se trata de un recurso existente, borrador, colección, agregado,
   operación masiva o capacidad sin recurso;
4. cuál contrato de recurso gobierna la resolución;
5. qué identificadores empresariales exactos fueron resueltos;
6. qué versión o snapshot del recurso fue evaluado;
7. cuál es el sujeto empresarial objetivo;
8. quién es propietario, custodio, responsable o tercero relacionado;
9. cuál es la organización y unidad de negocio;
10. qué sedes y áreas pertenecen realmente al recurso;
11. cuáles son los tipos de área;
12. si existen origen y destino;
13. si participan rutas o vehículos;
14. si el recurso pertenece a un entorno aislado;
15. qué lados del recurso son obligatorios;
16. qué estado empresarial fue observado;
17. qué campos fueron solicitados y cómo se clasifican;
18. qué control de concurrencia o idempotencia aplica;
19. cuándo la resolución puede continuar;
20. cuándo debe fallar cerrado;
21. cómo se evalúan lecturas, creaciones, transiciones, agregados y lotes;
22. cómo se evita que un contexto válido autorice un recurso distinto;
23. cómo se preservan determinismo, inmutabilidad y auditoría;
24. qué tareas posteriores consumen la resolución.

---

#### 2. Base normativa

AUTH-CTX-018 conserva sin cambios las decisiones aprobadas en:

- ADR-AUTH-001;
- AUTH-MOD-013 a AUTH-MOD-017 — Alcances globales, por sede, tipo de sede,
  área y tipo de área;
- AUTH-MOD-018 — Precedencia entre carriles;
- AUTH-MOD-019 — Denegación explícita;
- AUTH-CAT-011 — Alcance permitido de cada permiso;
- AUTH-CAT-016 — Contratos de recurso;
- AUTH-CAT-017 — Dependencias de permisos;
- AUTH-CAT-018 — Tipos derivados;
- AUTH-CAT-024 — Publicación contractual;
- AUTH-RBAC-001 a AUTH-RBAC-028 — Matrices, excepciones y restricciones;
- AUTH-CTX-001 — `AccessContext`;
- AUTH-CTX-002 — Diseño de `AuthorizationDecision`;
- AUTH-CTX-004 — Versionado contractual;
- AUTH-CTX-009 — Cobertura administrativa;
- AUTH-CTX-013 — Sede y área operativas;
- AUTH-CTX-014 — Dispositivo compartido;
- AUTH-CTX-015 — Razones estructuradas;
- AUTH-CTX-016 — Aplicación y permiso solicitado;
- AUTH-CTX-017 — `authorization_requirement`.

Principios obligatorios:

```text
PERMISO EXACTO
+
RECURSO EXACTO
+
CONTEXTO EXACTO
=
UNIDAD DE EVALUACIÓN
```

```text
PERMISO SOBRE UN TIPO DE RECURSO
≠
AUTORIZACIÓN SOBRE TODOS LOS RECURSOS DE ESE TIPO
```

```text
TERRITORIO DEL ACTOR
≠
TERRITORIO DEL RECURSO
```

```text
PAYLOAD DEL CLIENTE
≠
RECURSO AUTORITATIVO
```

```text
NULL
≠
GLOBAL
```

```text
LISTA VACÍA
≠
TODOS
```

```text
RECURSO NO RESUELTO
→
DENY
```

---

#### 3. Forma contractual principal conservada

```ts
type ResolvedResourceContext = {
  resource_type: string;
  request_shape:
    | "EXISTING"
    | "DRAFT"
    | "COLLECTION"
    | "AGGREGATE"
    | "BULK"
    | "NON_RESOURCE";

  resolution_status:
    | "RESOLVED"
    | "MULTI_RESOLVED"
    | "NOT_APPLICABLE"
    | "UNRESOLVED"
    | "CONFLICT"
    | "ISOLATED";

  resource_ids: string[];
  resource_version: string | null;

  subject: ResolvedSubjectContext | null;
  territory: ResolvedTerritoryContext;
  ownership: OwnershipContext;
  required_sides: ResolvedSideContext[];

  state_snapshot: Record<string, unknown>;
  field_classification: Record<string, string>;
  concurrency: ConcurrencyContext | null;
};
```

La forma no cambia.

AUTH-CTX-018 define la semántica y las invariantes de cada campo.

---

#### 4. Forma territorial conservada

```ts
type ResolvedTerritoryContext = {
  organization_id: string | null;
  business_unit_ids: string[];
  site_ids: string[];
  area_ids: string[];
  area_kinds: string[];
  origin: TerritorySide | null;
  destination: TerritorySide | null;
  route_ids: string[];
  vehicle_ids: string[];
  isolated_environment: boolean;
  source: string;
  coherent: boolean;
};
```

Reglas contractuales heredadas:

- `null` no significa organización completa;
- una lista vacía no significa todos;
- cada área debe pertenecer a una sede correspondiente;
- origen y destino se evalúan cuando el contrato los exige;
- el alcance global continúa limitado al recurso exacto;
- global no atraviesa entornos aislados;
- un filtro del cliente puede reducir, nunca ampliar;
- la sede seleccionada no sustituye territorio;
- la sede primaria no sustituye territorio;
- el dispositivo solo restringe.

---

#### 5. Formas subordinadas clarificadas

Las formas subordinadas deberán preservar, como mínimo, la siguiente
semántica documental.

```ts
type ResolvedSubjectContext = {
  subject_type: string;
  subject_id: string;
  relationship_to_actor:
    | "SELF"
    | "OWNED"
    | "ASSIGNED"
    | "RELATED"
    | "THIRD_PARTY"
    | "SYSTEM";
  coherent: boolean;
};
```

```ts
type OwnershipContext = {
  owner_type:
    | "ACTOR"
    | "EMPLOYEE"
    | "CUSTOMER"
    | "ORGANIZATION"
    | "SITE"
    | "AREA"
    | "OTHER"
    | "NONE"
    | "UNKNOWN";

  owner_id: string | null;

  actor_relation:
    | "SELF"
    | "OWNED"
    | "ASSIGNED"
    | "RELATED"
    | "THIRD_PARTY"
    | "NOT_APPLICABLE"
    | "UNRESOLVED";

  coherent: boolean;
};
```

```ts
type TerritorySide = {
  site_id: string | null;
  area_id: string | null;
  area_kind: string | null;
  route_id: string | null;
  vehicle_id: string | null;
  coherent: boolean;
};
```

```ts
type ResolvedSideContext = {
  side_code: string;
  required: boolean;
  resource_type: string;
  resource_ids: string[];
  territory: TerritorySide | null;
  resolution_status:
    | "RESOLVED"
    | "MULTI_RESOLVED"
    | "NOT_APPLICABLE"
    | "UNRESOLVED"
    | "CONFLICT"
    | "ISOLATED";
};
```

```ts
type ConcurrencyContext = {
  policy:
    | "NONE"
    | "EXPECTED_VERSION"
    | "UPDATED_AT"
    | "LOCK"
    | "SNAPSHOT"
    | "IDEMPOTENCY_KEY";

  expected_version: string | null;
  idempotency_key: string | null;
  validated: boolean;
};
```

Estas formas subordinadas no agregan campos a `ResolvedResourceContext`.

AUTH-CTX-026 deberá convertirlas en tipos físicos y schema compatibles.

AUTH-CTX-030 deberá probar sus invariantes.

---

#### 6. Fuente exclusiva: contrato de recurso

Toda resolución comienza en:

```text
permission_contract.resource_contract_id
```

El contrato de recurso deberá declarar, como mínimo:

- tipo de recurso esperado;
- forma o formas de solicitud admitidas;
- localizadores permitidos;
- fuente de verdad;
- relaciones necesarias;
- territorio requerido;
- sujeto requerido;
- propiedad requerida;
- lados obligatorios;
- estado relevante;
- campos protegidos;
- política de concurrencia;
- política de idempotencia;
- comportamiento de colección, agregado y lote;
- tratamiento de creación;
- tratamiento de entornos aislados.

No podrá inferirse el contrato desde:

- nombre del permiso;
- tabla consultada;
- aplicación;
- ruta;
- método HTTP;
- rol;
- contexto del actor;
- payload;
- primer recurso encontrado.

---

#### 7. Contrato ausente o incompatible

Si el permiso requiere recurso y:

```text
resource_contract_id = null
```

o el contrato no existe:

```text
resolution_status = UNRESOLVED
final_decision = DENY
```

Razón reservada:

```text
RESOURCE_CONTRACT_NOT_FOUND
```

Si la versión del contrato no es compatible:

```text
RESOURCE_CONTRACT_VERSION_MISMATCH
```

No se utilizará un contrato anterior, “latest” ni un contrato parecido.

---

#### 8. Resolución exclusiva en servidor

El cliente podrá aportar únicamente:

- localizadores;
- filtros permitidos;
- campos solicitados;
- borrador;
- intención de transición;
- clave de idempotencia;
- versión esperada;
- datos empresariales del comando.

El servidor deberá resolver:

- existencia;
- tipo;
- relaciones;
- sede;
- área;
- origen;
- destino;
- propietario;
- sujeto;
- estado;
- versión;
- campos;
- lados;
- entorno;
- coherencia.

No se aceptará como hecho autoritativo:

- `site_id`;
- `area_id`;
- `owner_id`;
- `created_by`;
- `employee_id`;
- `status`;
- `route_id`;
- `vehicle_id`;
- `business_unit_id`;
- `isolated_environment`;
- `resource_version`;

cuando procedan exclusivamente del cliente.

---

#### 9. `resource_type`

`resource_type` será el identificador canónico del tipo empresarial evaluado.

Ejemplos conceptuales:

```text
inventory_remission
inventory_movement
purchase_order
purchase_reception
production_batch
cash_session
sale_order
payment_transaction
employee
shift
permission_assignment
application_access
```

Reglas:

- no es el nombre de una tabla;
- no es una ruta;
- no es una clase de frontend;
- no es una aplicación;
- no es un nombre humano;
- no contiene un identificador concreto;
- debe coincidir con `resource_contract_id`;
- debe coincidir con la operación exigida por el permiso.

Una discrepancia produce:

```text
RESOURCE_TYPE_MISMATCH
→ resolution_status = CONFLICT
→ DENY
```

---

#### 10. Formas de solicitud

##### 10.1 `EXISTING`

Representa uno o varios recursos ya persistidos que deben resolverse desde su
fuente de verdad.

No basta con recibir su identificador.

##### 10.2 `DRAFT`

Representa un recurso normalizado antes de persistir.

Puede no tener `resource_id`.

Debe resolver sus relaciones y territorio propuestos.

##### 10.3 `COLLECTION`

Representa una colección delimitada y construida en servidor.

No representa “toda la tabla”.

##### 10.4 `AGGREGATE`

Representa un resultado derivado de varios miembros autorizables.

No puede revelar miembros excluidos mediante totales o conteos.

##### 10.5 `BULK`

Representa una mutación o transición sobre varios recursos exactos.

Requiere contrato masivo explícito o descomposición por miembro.

##### 10.6 `NON_RESOURCE`

Representa una capacidad cuyo contrato declara legítimamente que no existe un
recurso empresarial variable, por ejemplo un acceso de aplicación.

No se utiliza como fallback ante una resolución fallida.

---

#### 11. Coherencia entre permiso y `request_shape`

El contrato deberá declarar qué formas admite.

Ejemplos:

```text
permiso de creación
→ DRAFT
```

```text
permiso de actualización
→ EXISTING
```

```text
permiso de exportación agregada
→ AGGREGATE
```

```text
permiso masivo explícito
→ BULK
```

Una forma no admitida produce:

```text
RESOURCE_REQUEST_SHAPE_INVALID
→ resolution_status = CONFLICT
→ DENY
```

---

#### 12. Estados de resolución

##### 12.1 `RESOLVED`

Existe un recurso lógico exacto y coherente.

Puede aplicarse a:

- `EXISTING`;
- `DRAFT`;
- `NON_RESOURCE`, únicamente mediante `NOT_APPLICABLE`, no `RESOLVED`.

Para `RESOLVED`, normalmente existe un solo recurso lógico.

##### 12.2 `MULTI_RESOLVED`

Existe un conjunto exacto, finito, coherente y determinado en servidor.

Puede aplicarse a:

- `COLLECTION`;
- `AGGREGATE`;
- `BULK`;
- una relación compuesta aprobada.

##### 12.3 `NOT_APPLICABLE`

El contrato declara expresamente que la capacidad no requiere un recurso
variable.

No significa resolución omitida.

##### 12.4 `UNRESOLVED`

Falta información autoritativa necesaria.

##### 12.5 `CONFLICT`

Existen hechos contradictorios o incompatibles.

##### 12.6 `ISOLATED`

El recurso pertenece a un entorno aislado que no está cubierto por la
autorización organizacional ordinaria.

---

#### 13. Estados que permiten continuar

```text
RESOLVED
MULTI_RESOLVED
NOT_APPLICABLE
→ la evaluación puede continuar
```

Siempre que las demás invariantes sean válidas.

```text
UNRESOLVED
CONFLICT
ISOLATED
→ structural deny
→ final_decision = DENY
```

No se permite:

- ignorar el recurso;
- usar el contexto como reemplazo;
- degradar a `NON_RESOURCE`;
- utilizar sede primaria;
- elegir el primer candidato;
- retirar lados obligatorios.

---

#### 14. `resource_ids`

Reglas por forma:

| Forma          | Regla                                                |
| -------------- | ---------------------------------------------------- |
| `EXISTING`     | Uno o más identificadores exactos, según el contrato |
| `DRAFT`        | Puede estar vacío antes de persistir                 |
| `COLLECTION`   | Identificadores exactos del conjunto materializado   |
| `AGGREGATE`    | Identificadores de los miembros o entradas evaluadas |
| `BULK`         | Todos los recursos objetivo exactos                  |
| `NON_RESOURCE` | Vacío                                                |

Reglas generales:

- sin duplicados;
- orden determinista;
- sin wildcards;
- sin nombres humanos;
- sin IDs aportados pero no resueltos;
- una lista vacía no significa todos;
- un ID adicional exige reevaluar.

Para colecciones paginadas, cada decisión se aplica al conjunto exacto de la
página o lote resuelto, salvo que el contrato establezca un snapshot cerrado
de toda la consulta.

---

#### 15. `resource_version`

Representa la versión autoritativa del snapshot evaluado.

Puede corresponder a:

- contador de versión;
- `updated_at` normalizado;
- ETag;
- identificador de snapshot;
- versión de agregado;
- hash de borrador.

Reglas:

- `DRAFT` puede utilizar una versión o hash normalizado;
- `NON_RESOURCE` utiliza `null`;
- una mutación protegida no podrá omitirla cuando el contrato exige
  concurrencia;
- un cambio posterior vuelve obsoleta la decisión;
- no se acepta una versión declarada únicamente por el cliente.

Una versión obligatoria no resoluble produce:

```text
RESOURCE_VERSION_UNAVAILABLE
→ DENY
```

---

#### 16. Recurso existente

Para `EXISTING`:

```text
localizador del cliente
→ consulta autoritativa
→ recurso exacto
→ relaciones exactas
→ snapshot exacto
```

Casos:

```text
0 coincidencias
→ RESOURCE_NOT_FOUND
→ UNRESOLVED
```

```text
1 coincidencia
→ RESOLVED
```

```text
2 o más coincidencias cuando se esperaba una
→ RESOURCE_AMBIGUOUS
→ CONFLICT
```

No se revelará al cliente si el recurso existe cuando esa información sea
sensible.

---

#### 17. Recurso de creación

Un `DRAFT` se evalúa antes de escribir.

Flujo:

```text
payload no confiable
→ validación sintáctica
→ normalización
→ resolución de padres y relaciones
→ derivación territorial
→ derivación de sujeto y propiedad
→ validación de estado inicial
→ validación de campos
→ autorización
→ escritura
```

Reglas:

- el cliente no se autoasigna autoridad mediante IDs;
- una relación padre determina territorio cuando el contrato así lo declare;
- el estado inicial procede del contrato;
- los campos del sistema no se aceptan como ordinarios;
- la escritura debe usar el mismo borrador normalizado autorizado.

---

#### 18. Creación y territorio propuesto

Un borrador puede proponer:

- sede;
- área;
- origen;
- destino;
- propietario;
- sujeto.

Esos valores solo participan después de resolver:

- existencia;
- relación;
- compatibilidad;
- pertenencia;
- vigencia;
- fuente.

Ejemplo:

```text
payload.destination_site_id = VENTO_CAFE
```

no significa:

```text
destination = VENTO_CAFE autorizado
```

El servidor deberá confirmar la sede y el contrato deberá exigir autoridad
sobre ese lado.

---

#### 19. Colecciones

Una colección se construye en servidor desde un predicado autorizado.

Reglas:

1. el servidor limita el conjunto antes de devolverlo;
2. el frontend no recibe un conjunto amplio para filtrarlo;
3. cada miembro debe pertenecer al territorio autorizado;
4. el filtro solicitado solo puede reducir;
5. la ordenación no modifica alcance;
6. la paginación no amplía alcance;
7. un miembro fuera de alcance no se incluye;
8. una colección de mutación requiere decisiones por miembro o contrato
   masivo.

Razón reservada ante conjunto no delimitable:

```text
RESOURCE_COLLECTION_SCOPE_INVALID
```

---

#### 20. Agregados

Un agregado puede incluir:

- conteos;
- sumas;
- indicadores;
- reportes;
- diferencias;
- agrupaciones;
- tendencias.

Reglas:

1. todos los miembros contribuyentes deben estar dentro del alcance;
2. no se incluirán miembros ocultos;
3. no se revelará información excluida mediante inferencia;
4. un resultado agrupado conserva su territorio;
5. un agregado transversal requiere alcance explícito;
6. un `0` o mensaje de error no deberá confirmar la existencia de recursos
   ocultos.

Razón reservada:

```text
RESOURCE_AGGREGATE_SCOPE_INVALID
```

---

#### 21. Operaciones masivas

Un permiso ordinario sobre un recurso no autoriza una operación masiva.

Una operación `BULK` deberá:

- usar una capacidad masiva explícita; o
- descomponerse en decisiones individuales.

La política deberá ser una de:

```text
ALL_OR_NOTHING
PARTIAL_WITH_RESULTS
```

No se elegirá silenciosamente.

##### `ALL_OR_NOTHING`

Un solo miembro denegado bloquea toda la operación.

##### `PARTIAL_WITH_RESULTS`

Cada miembro obtiene decisión propia y resultado seguro.

La operación no podrá presentar el éxito parcial como éxito total.

Razón reservada cuando falta contrato masivo:

```text
RESOURCE_BULK_CONTRACT_REQUIRED
```

---

#### 22. `NON_RESOURCE`

Solo se utiliza cuando:

```text
resource_contract
→ declara NON_RESOURCE
```

Forma mínima:

```text
request_shape = NON_RESOURCE
resolution_status = NOT_APPLICABLE
resource_ids = []
resource_version = null
subject = null
required_sides = []
state_snapshot = {}
field_classification = {}
concurrency = null
```

El territorio deberá ser coherente con el contrato y no inventará una sede.

Un permiso de aplicación como `<app>.access` puede usar esta forma si su
contrato lo declara.

---

#### 23. Recurso organizacional no territorial

Un recurso organizacional no territorial no es `NON_RESOURCE`.

Ejemplos conceptuales:

- catálogo corporativo;
- configuración organizacional;
- política;
- plantilla global;
- reporte corporativo.

Debe producir:

```text
resolution_status = RESOLVED
organization_id = organización exacta
site_ids = []
area_ids = []
```

Las listas vacías significan que la dimensión no aplica, no que cubre todas
las sedes.

---

#### 24. `subject`

`subject` representa la entidad empresarial sobre la cual recae la operación
cuando es distinta o adicional al recurso principal.

Ejemplos:

- empleado objetivo;
- cliente;
- proveedor;
- usuario invitado;
- dispositivo;
- solicitante;
- responsable;
- beneficiario.

Reglas:

- sujeto no significa propietario;
- sujeto no significa actor;
- sujeto no significa recurso principal;
- el cliente no declara la relación autoritativamente;
- la relación con el actor procede del contrato;
- `SELF` exige coincidencia exacta;
- `THIRD_PARTY` exige autoridad explícita;
- una relación incoherente produce `RESOURCE_SUBJECT_CONFLICT`.

---

#### 25. Propiedad y relación con el actor

`ownership` responde:

```text
¿quién controla o posee el recurso
y qué relación tiene el actor con esa propiedad?
```

No deberá inferirse universalmente desde:

- `created_by`;
- `updated_by`;
- `requested_by`;
- último custodio;
- usuario autenticado;
- empleado asignado.

Cada contrato declara qué campo o relación significa:

- propiedad;
- creación;
- asignación;
- custodia;
- responsabilidad;
- pertenencia;
- tercero.

---

#### 26. Alcance `OWN`

`OWN` solo coincide cuando:

1. `ownership.coherent = true`;
2. la relación aceptada por el contrato coincide;
3. el actor exacto es el sujeto permitido;
4. el recurso y territorio permanecen dentro de cualquier límite adicional.

Regla:

```text
OWN
puede reducir territorio
pero nunca ampliarlo
```

Ejemplo:

```text
recurso propio
+
sede fuera del alcance territorial
→ no autorizado
```

Una propiedad no resoluble produce:

```text
RESOURCE_OWNERSHIP_UNRESOLVED
→ DENY cuando OWN es necesario
```

---

#### 27. Estado del recurso

`state_snapshot` contiene únicamente hechos necesarios para autorización.

Ejemplos:

- estado actual;
- estado propuesto;
- transición;
- fecha efectiva;
- cierre;
- cancelación;
- recepción;
- propiedad;
- clasificación;
- condición editable;
- bloqueo;
- aprobación.

Reglas:

- no contiene la fila completa;
- no contiene campos ajenos a la decisión;
- los campos se permiten por contrato;
- el orden es determinista;
- los timestamps se normalizan;
- una transición se evalúa contra el estado actual real;
- el payload no reemplaza el estado actual.

---

#### 28. Transiciones

Una transición deberá declarar:

```text
estado actual
+
transición solicitada
+
estado resultante permitido
```

Ejemplo:

```text
remisión requested
→ iniciar producción
```

No se autoriza únicamente porque el actor tenga la capacidad.

Si el estado actual cambió:

```text
RESOURCE_STATE_INVALID
→ DENY
→ reevaluar
```

Una capacidad de transición no autoriza otras transiciones del mismo recurso.

---

#### 29. Campos solicitados

`AuthorizationRequestContext.requested_fields` reduce o precisa la evaluación.

Reglas:

- lista vacía usa la proyección mínima del contrato;
- no concede campos adicionales;
- no se aceptan wildcards;
- no se aceptan rutas de objeto no definidas;
- un campo solicitado debe existir en la clasificación;
- el servidor puede retirar campos no autorizados en lecturas;
- una mutación con campos bloqueados debe denegarse o dividirse
  explícitamente.

---

#### 30. Clasificación de campos

`field_classification` utiliza inicialmente los siguientes códigos:

```text
PUBLIC
INTERNAL
SENSITIVE
RESTRICTED
IMMUTABLE
SYSTEM_MANAGED
```

Semántica:

| Código           | Regla                                                        |
| ---------------- | ------------------------------------------------------------ |
| `PUBLIC`         | Puede exponerse únicamente cuando el recurso está autorizado |
| `INTERNAL`       | Requiere permiso y proyección interna compatible             |
| `SENSITIVE`      | Exige política sensible y minimización                       |
| `RESTRICTED`     | Exige capacidad o control específico                         |
| `IMMUTABLE`      | No puede modificarse mediante la operación                   |
| `SYSTEM_MANAGED` | Solo puede ser escrito por procesos canónicos autorizados    |

Un valor desconocido produce:

```text
RESOURCE_FIELD_CLASSIFICATION_INVALID
→ DENY
```

AUTH-CTX-023 consolidará la decisión de campos.

---

#### 31. Concurrencia

La decisión y la ejecución deben protegerse contra cambios entre:

```text
leer
→ autorizar
→ escribir
```

Políticas:

##### `NONE`

Solo para operaciones donde el contrato declara que no existe riesgo de
concurrencia relevante.

##### `EXPECTED_VERSION`

Exige coincidencia con una versión explícita.

##### `UPDATED_AT`

Exige coincidencia con timestamp autoritativo.

##### `LOCK`

Exige lock dentro de la transacción.

##### `SNAPSHOT`

Exige un snapshot transaccional coherente.

##### `IDEMPOTENCY_KEY`

Exige una clave estable para evitar efectos duplicados.

---

#### 32. Resultado de concurrencia

Para una operación protegida:

```text
concurrency.validated = true
```

es obligatorio antes de ejecutar.

Una decisión previa no reserva el recurso.

Un conflicto produce:

```text
RESOURCE_CONCURRENCY_CONFLICT
→ DENY para la ejecución actual
→ nueva resolución
```

La acción no podrá reutilizar una decisión antigua.

---

#### 33. Idempotencia

La idempotencia:

- evita duplicados;
- no concede permiso;
- no amplía alcance;
- no sustituye actor;
- no sustituye recurso;
- no convierte un request fallido en autorizado.

El mismo `idempotency_key` con payload empresarial diferente produce
conflicto.

Las creaciones y transiciones con efectos no repetibles deberán declarar su
política mediante el contrato.

---

#### 34. Forma territorial: `organization_id`

`organization_id` identifica la organización propietaria del recurso.

Reglas:

- puede ser `null` únicamente cuando el contrato lo permita;
- `null` no significa Vento Group;
- no se obtiene por default global;
- no se obtiene del actor;
- un recurso de otra organización produce conflicto;
- futuras organizaciones o tenants permanecen separados.

Para recursos empresariales ordinarios de Vento:

```text
organization_id
→ organización canónica propietaria
```

---

#### 35. `business_unit_ids`

Representa unidades de negocio exactas relacionadas con el recurso.

No se inferirá desde:

- nombre de sede;
- aplicación;
- prefijo de código;
- repositorio;
- ruta.

Reglas:

- lista única;
- orden determinista;
- vacía cuando no aplica;
- vacía no significa todas;
- una unidad desconocida produce conflicto;
- una relación multinegocio requiere contrato explícito.

---

#### 36. `site_ids`

Representa todas las sedes reales obligatorias del recurso.

Ejemplos:

- sede propietaria;
- sede de almacenamiento;
- sede de venta;
- sede de recepción;
- sedes de origen y destino.

Reglas:

- se derivan de relaciones canónicas;
- sin duplicados;
- sedes activas cuando el contrato lo exige;
- una lista vacía no significa todas;
- el cliente no crea sedes;
- la sede del actor no se copia al recurso;
- una sede seleccionada no se copia al recurso.

---

#### 37. `area_ids`

Representa todas las áreas reales obligatorias del recurso.

Reglas:

- cada área pertenece a una sede incluida;
- el área procede de una relación canónica;
- no se deriva del nombre;
- no se deriva de `area_kind`;
- no se deriva del turno;
- no se deriva del dispositivo;
- una lista vacía no significa todas;
- una incompatibilidad produce `RESOURCE_TERRITORY_CONFLICT`.

---

#### 38. `area_kinds`

`area_kinds` se deriva de las áreas resueltas.

Regla:

```text
area_id
→ catálogo de áreas
→ area_kind
```

No se utilizará un `area_kind` enviado por cliente para reemplazar un área
concreta.

Una lista puede contener tipos repetidos conceptualmente, pero la
serialización los deduplicará.

---

#### 39. Origen y destino

`origin` y `destination` se utilizan cuando el contrato declara una operación
multilateral.

Ejemplos:

- remisión;
- traslado;
- transferencia;
- movimiento;
- despacho;
- ruta;
- devolución;
- recepción.

Cada lado puede contener:

- sede;
- área;
- ruta;
- vehículo.

Reglas:

- origen y destino se resuelven por separado;
- un lado no autoriza el otro;
- el actor puede tener autoridad distinta en cada lado;
- una denegación aplicable a cualquier lado obligatorio bloquea la operación;
- no se intercambian silenciosamente;
- no se completa un lado desde el contexto del actor.

---

#### 40. Lados obligatorios

`required_sides` expresa qué lados debe evaluar el permiso.

Ejemplos de códigos:

```text
RESOURCE
ORIGIN
DESTINATION
SOURCE
TARGET
PARENT
CHILD
SUBJECT
OWNER
CUSTODIAN
VEHICLE
ROUTE
```

Reglas:

1. cada código procede del contrato;
2. un lado obligatorio debe resolverse;
3. un lado opcional no se convierte en obligatorio por el cliente;
4. un lado obligatorio no puede eliminarse del request;
5. el mismo lado no se duplica;
6. el orden es determinista;
7. un lado no resuelto produce `RESOURCE_REQUIRED_SIDE_UNRESOLVED`;
8. un lado en conflicto produce `RESOURCE_REQUIRED_SIDE_CONFLICT`;
9. un lado aislado produce `ISOLATED`;
10. una mutación multilateral exige autorización sobre todos los lados
    declarados obligatorios, salvo contrato explícito diferente.

---

#### 41. Remisiones

Una remisión puede involucrar:

```text
origen
destino
solicitante
productor
transportador
receptor
estado
productos
```

La resolución mínima territorial deberá distinguir:

```text
origin.site_id
destination.site_id
```

y las áreas cuando sean relevantes.

Regla predeterminada:

```text
DENY APLICABLE EN CUALQUIER LADO OBLIGATORIO
→ DENY DE LA OPERACIÓN COMPLETA
```

Las excepciones de lectura o visibilidad parcial deberán estar declaradas en
el contrato específico del permiso.

---

#### 42. Movimientos de inventario

Un movimiento puede involucrar:

- sede;
- área;
- ubicación de origen;
- ubicación de destino;
- LPN;
- producto;
- custodio;
- tipo de movimiento;
- estado;
- cantidad.

El territorio no se reduce al `site_id` del movimiento.

La fuente y destino internos deberán resolverse cuando el permiso los
requiera.

Autorizar una ubicación no autoriza todas las ubicaciones de la sede.

---

#### 43. Compras y recepciones

Una orden de compra y una recepción pueden tener territorios distintos:

- unidad de negocio compradora;
- sede solicitante;
- sede receptora;
- ubicación de recepción;
- proveedor;
- centro de costo.

El contrato del permiso determinará qué relaciones son obligatorias.

Un proveedor no se modelará como sede.

Un centro de costo no se modelará automáticamente como área.

---

#### 44. Producción

Un recurso productivo puede involucrar:

- sede productora;
- área productora;
- receta;
- lote;
- orden;
- solicitud de origen;
- inventario consumido;
- inventario resultante.

La autorización de la orden no autoriza automáticamente:

- editar receta;
- ajustar inventario;
- cerrar lote;
- aprobar merma.

Cada capacidad conserva su recurso y contrato exactos.

---

#### 45. Ventas, caja y pagos

Una venta puede involucrar:

- sede comercial;
- área;
- sesión de caja;
- pedido;
- cliente;
- transacciones;
- reembolsos;
- reversos.

La autoridad sobre la venta no autoriza automáticamente:

- recaudar;
- reembolsar;
- reversar;
- cerrar caja;
- editar datos sensibles del cliente.

Cada acción usa permiso, recurso, estado y campos exactos.

---

#### 46. Trabajadores, turnos y autorización

Un recurso de VISO puede tener como sujeto:

- empleado;
- invitación;
- turno;
- rol;
- permiso;
- excepción;
- dispositivo.

La cobertura administrativa del actor no cambia el sujeto real.

Ejemplo:

```text
actor = gerente
subject = empleado E2
```

La operación no es `OWN` salvo que el contrato lo declare y la relación
coincida.

---

#### 47. Rutas y vehículos

`route_ids` y `vehicle_ids` representan relaciones exactas.

No significan:

- sedes;
- áreas;
- permisos;
- territorios globales.

Un vehículo puede estar:

- asignado a una sede;
- asociado a una ruta;
- en tránsito;
- custodiado por un actor.

La relación válida deberá proceder de fuente canónica.

Un conductor con turno no obtiene autoridad sobre todos los vehículos.

---

#### 48. Entornos aislados

Entornos aislados incluyen, cuando existan:

- APP-REVIEW;
- demo;
- pruebas;
- sandbox;
- datos de certificación;
- organizaciones o tenants segregados.

Reglas:

```text
isolated_environment = true
```

cuando el recurso pertenece a uno de estos entornos.

El alcance:

- organizacional;
- global;
- por tipo de sede;
- por tipo de área;

no los incluye automáticamente.

Sin contrato y autorización aislada explícita:

```text
resolution_status = ISOLATED
→ DENY
```

---

#### 49. Fuente territorial

`territory.source` utilizará inicialmente uno de estos valores:

```text
RESOURCE_DIRECT
RESOURCE_PARENT_CHAIN
DRAFT_RELATIONSHIP
COLLECTION_MEMBERS
AGGREGATE_INPUTS
BULK_MEMBERS
NON_RESOURCE_CONTRACT
```

Reglas:

- la fuente debe explicar cómo se obtuvo el territorio;
- no concede autoridad;
- no acepta texto libre;
- una fuente desconocida produce conflicto;
- un recurso puede requerir varias relaciones, pero la serialización utiliza
  el código que representa el resolver contractual principal.

AUTH-CTX-026 deberá congelar su enum físico.

---

#### 50. Coherencia territorial

```text
territory.coherent = true
```

requiere:

1. organización compatible;
2. unidades de negocio válidas;
3. sedes válidas;
4. áreas pertenecientes a sus sedes;
5. tipos derivados de las áreas;
6. origen y destino coherentes;
7. rutas y vehículos válidos;
8. ausencia de contradicciones;
9. fuente reconocida;
10. entorno correctamente clasificado.

Una incoherencia produce:

```text
RESOURCE_TERRITORY_CONFLICT
→ resolution_status = CONFLICT
→ DENY
```

---

#### 51. Territorio no resoluble

Cuando el contrato requiere territorio y no puede obtenerse:

```text
RESOURCE_TERRITORY_UNRESOLVED
→ resolution_status = UNRESOLVED
→ DENY
```

No se asumirá:

- recurso organizacional;
- sede del actor;
- sede primaria;
- sede seleccionada;
- sede del dispositivo;
- área del turno;
- ausencia de territorio.

---

#### 52. Comparación con carril base

AUTH-CTX-019 deberá comparar los grants base contra el territorio real.

Ejemplos:

```text
AS
→ resource.site_ids
deben pertenecer a assigned_sites utilizables
```

```text
SS
→ resource.site_ids
deben coincidir con la sede exacta
```

```text
AST
→ sedes del recurso
deben estar asignadas
y tener el tipo exacto
```

```text
AA / SA / AAT / ATW
→ áreas reales del recurso
```

```text
OWN
→ ownership + territorio
```

```text
G
→ organización ordinaria
→ excluye entornos aislados
```

---

#### 53. Comparación con carril operativo

AUTH-CTX-020 deberá comparar el recurso contra:

- `operational_site`;
- `operational_area`;
- rol operativo;
- lados requeridos;
- contrato del permiso.

`CTX` significa:

```text
territorio operativo efectivo
debe coincidir con los lados exigidos del recurso
```

No significa:

- cualquier recurso de la sede;
- recursos de otra área;
- cualquier origen o destino;
- acceso cross-site;
- wildcard territorial.

---

#### 54. Recursos multiterritoriales y carril operativo

Un turno aporta un territorio operativo principal.

Una operación puede exigir varios territorios.

Ejemplo:

```text
turno = CENTRO_PRODUCCION
remisión:
origin = CENTRO_PRODUCCION
destination = VENTO_CAFE
```

El carril operativo no obtiene automáticamente autoridad sobre
`VENTO_CAFE`.

El contrato puede exigir:

- coincidencia con origen;
- coincidencia con destino;
- ambos;
- permiso transversal específico;
- carril base adicional mediante `BASE_AND_OPERATIONAL`.

La regla debe ser explícita.

---

#### 55. Lectura transversal

Una lectura transversal podrá devolver la unión de recursos individualmente
autorizados.

Reglas:

- el servidor construye la unión;
- un recurso denegado no se devuelve;
- la ausencia de resultados no revela recursos ocultos;
- la paginación conserva el filtro;
- el conteo no incluye miembros denegados;
- la lectura no concede una mutación transversal.

---

#### 56. Mutación transversal

Una mutación multiterritorial exige autoridad sobre todos los lados
obligatorios.

Predeterminado:

```text
UN LADO OBLIGATORIO DENEGADO
→ OPERACIÓN COMPLETA DENEGADA
```

Una ejecución parcial exige:

- permiso explícito;
- contrato masivo;
- política `PARTIAL_WITH_RESULTS`;
- resultados por miembro;
- auditoría.

---

#### 57. Dispositivo compartido

El dispositivo puede restringir:

- aplicaciones;
- permisos;
- sede;
- área;
- ruta;
- vehículo;
- recurso.

Regla:

```text
recurso autorizado por actor
∩
recurso admitido por dispositivo
```

El dispositivo no:

- crea recurso;
- crea territorio;
- corrige territorio;
- cambia origen;
- cambia destino;
- convierte entorno aislado en ordinario;
- amplía un carril.

La incompatibilidad se consolidará en AUTH-CTX-023.

---

#### 58. Simulación

La simulación puede utilizar un recurso hipotético normalizado.

No podrá:

- fingir que un recurso inexistente fue resuelto;
- omitir lados obligatorios;
- convertir `ISOLATED` en ordinario;
- saltar conflictos;
- persistir;
- producir decisión ejecutable.

Un borrador simulado conserva el contrato de recurso real.

---

#### 59. Procesos de sistema

Un proceso `SYSTEM` también debe resolver:

- recurso;
- territorio;
- estado;
- lados;
- concurrencia;
- idempotencia.

El uso de `service_role` no permite:

- omitir recurso;
- omitir territorio;
- escribir en cualquier sede;
- ignorar organización;
- ignorar entornos aislados;
- ignorar estado.

Las integraciones deberán utilizar adaptadores y contratos empresariales
canónicos.

---

#### 60. Huella del recurso

AUTH-CTX-024 deberá registrar:

```text
resource_fingerprint
```

derivado de forma determinista de:

- `resource_contract_id`;
- `resource_type`;
- `request_shape`;
- `resolution_status`;
- `resource_ids`;
- `resource_version`;
- sujeto;
- propiedad;
- territorio;
- lados requeridos;
- estado relevante;
- clasificación de campos;
- concurrencia.

No deberá incluir secretos ni datos no necesarios.

---

#### 61. Snapshot e inmutabilidad

Una decisión captura un recurso exacto en un instante.

Cambios que obligan a reevaluar:

- estado;
- versión;
- propietario;
- sujeto;
- sede;
- área;
- origen;
- destino;
- ruta;
- vehículo;
- lados;
- campos solicitados;
- clasificación;
- idempotencia;
- relación padre;
- entorno;
- contrato de recurso.

Una decisión antigua no se actualiza.

---

#### 62. Orden determinista

La serialización deberá:

1. ordenar `resource_ids`;
2. ordenar `business_unit_ids`;
3. ordenar `site_ids`;
4. ordenar `area_ids`;
5. ordenar `area_kinds`;
6. ordenar `route_ids`;
7. ordenar `vehicle_ids`;
8. ordenar `required_sides` por `side_code`;
9. ordenar claves de `state_snapshot`;
10. ordenar claves de `field_classification`;
11. eliminar duplicados exactos;
12. conservar conflictos en lugar de resolverlos arbitrariamente.

---

#### 63. Razones de bloqueo reservadas

```text
RESOURCE_CONTRACT_NOT_FOUND
RESOURCE_CONTRACT_VERSION_MISMATCH
RESOURCE_REQUEST_SHAPE_INVALID
RESOURCE_TYPE_MISMATCH
RESOURCE_NOT_FOUND
RESOURCE_AMBIGUOUS
RESOURCE_RELATIONSHIP_CONFLICT
RESOURCE_SUBJECT_CONFLICT
RESOURCE_TERRITORY_UNRESOLVED
RESOURCE_TERRITORY_CONFLICT
RESOURCE_ISOLATED
RESOURCE_OWNERSHIP_UNRESOLVED
RESOURCE_REQUIRED_SIDE_UNRESOLVED
RESOURCE_REQUIRED_SIDE_CONFLICT
RESOURCE_STATE_INVALID
RESOURCE_FIELD_CLASSIFICATION_INVALID
RESOURCE_CONCURRENCY_CONFLICT
RESOURCE_BULK_CONTRACT_REQUIRED
RESOURCE_AGGREGATE_SCOPE_INVALID
RESOURCE_COLLECTION_SCOPE_INVALID
RESOURCE_VERSION_UNAVAILABLE
```

Estas razones:

- pertenecen a `AuthorizationDecision.structural_denies` o
  `blocked_reasons`;
- no se agregan retroactivamente a `AccessContext.structural_issues`;
- producen `DENY` cuando son bloqueantes;
- serán consolidadas y priorizadas en AUTH-CTX-023;
- serán auditadas mediante AUTH-CTX-024.

---

#### 64. Fail closed

Queda prohibido:

- autorizar sin resolver recurso;
- autorizar solo con `site_id`;
- copiar territorio desde el actor;
- usar sede primaria;
- usar sede seleccionada;
- usar el dispositivo como fuente;
- usar `created_by` universalmente como propietario;
- tratar lista vacía como todos;
- tratar `null` como global;
- omitir origen o destino;
- elegir el primer recurso;
- ignorar duplicados;
- ignorar cambio de versión;
- usar un permiso ordinario como masivo;
- filtrar únicamente en frontend;
- degradar recurso aislado;
- ejecutar con conflicto de concurrencia;
- reutilizar decisión obsoleta.

---

#### 65. Casos de ejemplo

##### Caso A — Recurso existente de una sede

```text
request_shape = EXISTING
resource_id = remisión R1
R1.destination_site_id = VENTO_CAFE
```

Resultado:

```text
resolution_status = RESOLVED
resource_ids = [R1]
territory.site_ids incluye VENTO_CAFE
```

El `site_id` se obtiene de R1, no del request.

##### Caso B — Recurso no encontrado

```text
localizador válido
0 coincidencias
```

Resultado:

```text
resolution_status = UNRESOLVED
RESOURCE_NOT_FOUND
DENY
```

##### Caso C — Creación de remisión

```text
request_shape = DRAFT
origin = CENTRO_PRODUCCION
destination = SAUDO
```

El servidor resuelve ambas sedes y sus relaciones antes de autorizar.

No se confía en los IDs aislados del payload.

##### Caso D — Recurso organizacional

```text
resource_type = authorization_catalog
organization_id = VENTO_GROUP
site_ids = []
area_ids = []
```

Resultado:

```text
RESOLVED
```

No es `NON_RESOURCE`.

##### Caso E — Acceso a aplicación

```text
resource_contract declara NON_RESOURCE
```

Resultado:

```text
request_shape = NON_RESOURCE
resolution_status = NOT_APPLICABLE
resource_ids = []
```

##### Caso F — Propiedad sin territorio

```text
actor creó el recurso
recurso pertenece a sede fuera de alcance
```

Resultado:

```text
OWN coincide
territorio no coincide
DENY
```

##### Caso G — Remisión multisitio

```text
origin = CENTRO_PRODUCCION
destination = VENTO_CAFE
```

Ambos lados se conservan.

Autoridad sobre el origen no autoriza automáticamente el destino.

##### Caso H — Área de otra sede

```text
site_id = SAUDO
area_id pertenece a VENTO_CAFE
```

Resultado:

```text
territory.coherent = false
resolution_status = CONFLICT
RESOURCE_TERRITORY_CONFLICT
```

##### Caso I — Colección filtrada por cliente

```text
cliente solicita site_id = VENTO_CAFE
```

El filtro puede reducir.

El servidor todavía debe limitar el conjunto a lo autorizado.

##### Caso J — Agregado

```text
reporte de ventas por sede
```

Solo contribuyen recursos individualmente autorizados.

Los totales no incluyen sedes excluidas.

##### Caso K — Operación masiva sin permiso masivo

```text
permission = editar un recurso
request_shape = BULK
```

Resultado:

```text
RESOURCE_BULK_CONTRACT_REQUIRED
DENY
```

##### Caso L — Estado cambió

```text
decisión evaluó version = 7
recurso actual = version 8
```

Resultado:

```text
RESOURCE_CONCURRENCY_CONFLICT
DENY
nueva evaluación
```

##### Caso M — Entorno APP-REVIEW

```text
isolated_environment = true
sin autorización aislada explícita
```

Resultado:

```text
resolution_status = ISOLATED
RESOURCE_ISOLATED
DENY
```

##### Caso N — Conductor y vehículo

```text
actor tiene rol conductor_logistica
vehicle_id = V1
```

El rol no demuestra relación con V1.

El vehículo deberá resolverse desde la operación o asignación canónica.

##### Caso O — Área nula

```text
recurso de nivel sede
area_ids = []
```

Puede ser válido cuando el contrato no exige área.

No significa todas las áreas.

---

#### 66. Antipatrones prohibidos

```ts
const siteId =
  request.site_id ??
  accessContext.operational_site?.site_id ??
  employee.site_id;

const areaId =
  request.area_id ??
  accessContext.operational_area?.area_id ??
  null;

const ownsResource =
  resource.created_by === actorId;

if (grant.scope === "global") {
  return true;
}

if (!resource) {
  return authorizeWithoutResource();
}
```

También queda prohibido:

```text
selectedSite → territorio real
selectedArea → territorio real
turno → territorio del recurso
check-in → territorio del recurso
dispositivo → territorio del recurso
resource_ids vacíos → todos
resource_version null → ignorar concurrencia
permiso individual → operación masiva
recurso propio → ignorar sede
global → incluir APP-REVIEW
cliente filtra después → seguridad
```

---

#### 67. Relación con tareas posteriores

##### AUTH-CTX-019

Evaluará el carril base contra:

- territorio;
- sujeto;
- propiedad;
- estado;
- lados;
- campos;
- concurrencia.

##### AUTH-CTX-020

Evaluará el carril operativo contra:

- sede y área operativas;
- rol;
- turno;
- check-in;
- lados del recurso;
- restricciones del dispositivo.

##### AUTH-CTX-021

Registrará únicamente allows cuyo alcance coincida con el recurso resuelto.

##### AUTH-CTX-022

Registrará denegaciones que coincidan con actor, recurso, territorio, lados y
vigencia.

##### AUTH-CTX-023

Consolidará estados, campos, dispositivo, sensibilidad, dependencias,
concurrencia, razones y decisión final.

##### AUTH-CTX-024

Registrará:

- `resource_type`;
- IDs;
- versión;
- huella;
- territorio;
- lados;
- estado;
- política de concurrencia;
- fuentes.

##### AUTH-CTX-025

Diseñará `get_access_context`; no resolverá recursos empresariales de una
acción concreta.

##### AUTH-CTX-026

Diseñará `evaluate_authorization`, resolvers de recursos, tipos físicos,
validación del contrato, frontera transaccional y respuesta.

##### AUTH-CTX-027

Obligará a rutas, acciones, RPC, API y jobs a declarar y resolver el recurso
mediante contratos centralizados.

##### AUTH-CTX-028

Diseñará compatibilidad con:

- `site_id` y `area_id` enviados por clientes actuales;
- funciones legacy que reciben territorio aislado;
- recursos sin contrato;
- `created_by` usado como propiedad universal;
- permisos amplios;
- operaciones masivas implícitas;
- consumidores que filtran en frontend;
- estados y relaciones actuales.

##### AUTH-CTX-029

Definirá:

- caché;
- expiración;
- invalidación;
- fingerprints;
- versiones;
- frescura;
- revalidación.

##### AUTH-CTX-030

Definirá pruebas contractuales de:

- seis formas de request;
- seis estados de resolución;
- recursos existentes;
- borradores;
- colecciones;
- agregados;
- lotes;
- non-resource;
- propiedad;
- sujeto;
- campos;
- estados;
- concurrencia;
- origen y destino;
- rutas;
- vehículos;
- territorios aislados;
- fail closed.

##### AUTH-DB-006 a AUTH-DB-010

Implementarán evaluación canónica dentro de RPC sensibles.

##### AUTH-DB-011

Aplicará constraints después de inventario, reconciliación y backfill.

##### AUTH-DB-020

Migrará contratos y consumidores legacy con compatibilidad temporal.

##### AUTH-DB-027

Probará integridad, RLS, RPC, recursos, territorios y migraciones.

##### AUTH-DB-030

Retirará parámetros territoriales y rutas legacy después de adopción
comprobada.

##### AUTH-DB-031

Certificará paridad documental, técnica y operativa.

##### BLOQUE E1

Deberá confrontar los contratos con recursos y procesos reales mediante:

- `PROC-DISC-001` a `PROC-DISC-008`;
- `CAP-MAP-001` a `CAP-MAP-005`;
- `GAP-CTRL-001` a `GAP-CTRL-006`.

##### BLOQUE E2

Deberá formalizar procesos, pantallas, estados y recursos mediante:

- `PROC-CAN-001` a `PROC-CAN-007`;
- `APP-OWN-001` a `APP-OWN-006`;
- `STATE-MAP-001` a `STATE-MAP-006`.

##### BLOQUE E3

Deberá formalizar fuentes y arquitectura física mediante:

- `DB-DOM-001` a `DB-DOM-005`;
- `DB-SCHEMA-001` a `DB-SCHEMA-007`;
- `DB-CONTRACT-001` a `DB-CONTRACT-006`;
- `DB-INTEGRITY-001` a `DB-INTEGRITY-006`;
- `DB-SEC-001` a `DB-SEC-006`.

##### BLOQUE E5

Deberá convertir cada contrato aprobado en paquetes mediante:

- `PKG-SCOPE-001` a `PKG-SCOPE-006`;
- `PKG-PLAN-001` a `PKG-PLAN-007`;
- `PKG-TEST-001` a `PKG-TEST-006`;
- `PKG-CUTOVER-001` a `PKG-CUTOVER-006`.

##### BLOQUE R

Implementará físicamente los paquetes aprobados mediante las tareas
`AUTH-DB-*` y los paquetes canónicos de implementación resultantes de E5.

---

#### 68. Fuera del alcance

AUTH-CTX-018 no:

- modifica contratos de recurso;
- inventa nuevos recursos;
- reclasifica los 140 permisos;
- modifica matrices;
- crea grants;
- crea denegaciones;
- evalúa el carril base;
- evalúa el carril operativo;
- resuelve allows;
- resuelve denegaciones coincidentes;
- produce decisión final completa;
- diseña pantallas;
- implementa filtros;
- implementa resolvers;
- crea tipos físicos;
- crea JSON Schema;
- crea Zod;
- crea SQL;
- crea RPC;
- crea RLS;
- crea tablas;
- crea migraciones;
- implementa locks;
- implementa idempotencia;
- modifica Supabase;
- modifica aplicaciones.

Cada responsabilidad posterior tiene destino explícito en la sección 67.

---

#### 69. Riesgos controlados

##### Riesgo 1 — Contexto usado como territorio del recurso

Control:

```text
recurso resuelto desde su fuente de verdad
```

##### Riesgo 2 — Cliente declara sede o área

Control:

```text
localizador no autoritativo
→ relaciones canónicas
```

##### Riesgo 3 — Recurso propio amplía territorio

Control:

```text
OWN reduce
no amplía
```

##### Riesgo 4 — Recurso multiterritorial se evalúa por un solo lado

Control:

```text
required_sides explícitos
```

##### Riesgo 5 — Colección filtrada únicamente en frontend

Control:

```text
conjunto delimitado en servidor
```

##### Riesgo 6 — Permiso ordinario ejecuta lote

Control:

```text
BULK exige contrato explícito
```

##### Riesgo 7 — Recurso cambia después de autorizar

Control:

```text
versión + concurrencia + revalidación
```

##### Riesgo 8 — Global atraviesa entornos aislados

Control:

```text
isolated_environment
→ autorización específica
```

---

#### 70. Criterios de aprobación

AUTH-CTX-018 podrá aprobarse cuando se acepte que:

1. se conserva la forma de `ResolvedResourceContext`;
2. se conserva la forma de `ResolvedTerritoryContext`;
3. se clarifican los tipos subordinados sin cambiar la raíz;
4. el contrato de recurso es la fuente única;
5. un contrato ausente produce `DENY`;
6. la resolución ocurre exclusivamente en servidor;
7. el cliente solo aporta localizadores y borradores;
8. `resource_type` es empresarial y canónico;
9. no es nombre de tabla ni ruta;
10. existen seis formas de solicitud;
11. la forma debe coincidir con el contrato;
12. `RESOLVED` permite continuar;
13. `MULTI_RESOLVED` permite continuar;
14. `NOT_APPLICABLE` solo es legítimo por contrato;
15. `UNRESOLVED` produce `DENY`;
16. `CONFLICT` produce `DENY`;
17. `ISOLATED` produce `DENY` sin autorización aislada;
18. `resource_ids` son exactos y deterministas;
19. una lista vacía no significa todos;
20. `DRAFT` puede no tener identificador;
21. `resource_version` representa el snapshot evaluado;
22. recursos existentes se consultan en fuente autoritativa;
23. un borrador se normaliza antes de autorizar;
24. el payload no declara territorio autoritativo;
25. colecciones se delimitan en servidor;
26. agregados no revelan miembros excluidos;
27. lotes requieren capacidad o contrato explícitos;
28. `NON_RESOURCE` no es fallback;
29. recursos organizacionales no territoriales continúan siendo recursos;
30. sujeto, actor, propietario y recurso permanecen separados;
31. la propiedad se define por contrato;
32. `created_by` no es regla universal;
33. `OWN` no amplía territorio;
34. `state_snapshot` contiene solo hechos necesarios;
35. el estado actual se resuelve en servidor;
36. una transición incompatible produce `DENY`;
37. `requested_fields` solo reduce o precisa;
38. los campos tienen clasificación cerrada;
39. campos desconocidos fallan cerrado;
40. concurrencia no se omite cuando el contrato la exige;
41. una decisión no reserva el recurso;
42. idempotencia no concede permisos;
43. `organization_id = null` no significa Vento Group;
44. unidades de negocio no se infieren por nombre de sede;
45. sedes del recurso no se copian desde el actor;
46. áreas deben pertenecer a sedes resueltas;
47. `area_kind` se deriva de `area_id`;
48. origen y destino se resuelven por separado;
49. autoridad en un lado no autoriza el otro;
50. lados obligatorios proceden del contrato;
51. un lado obligatorio no puede omitirse;
52. remisiones conservan origen y destino;
53. movimientos conservan relaciones internas necesarias;
54. compras, producción, ventas y VISO conservan sus recursos propios;
55. rutas y vehículos no equivalen a sedes;
56. entornos aislados quedan fuera del alcance ordinario;
57. la fuente territorial usa valores canónicos;
58. territorio incoherente produce `CONFLICT`;
59. territorio no resoluble produce `UNRESOLVED`;
60. AUTH-CTX-019 comparará el carril base con el recurso;
61. AUTH-CTX-020 comparará el carril operativo con el recurso;
62. un turno no autoriza automáticamente todos los lados;
63. una lectura transversal devuelve solo recursos autorizados;
64. una mutación transversal exige todos los lados obligatorios;
65. el dispositivo solo restringe;
66. la simulación no convierte un recurso inválido en válido;
67. procesos de sistema resuelven recurso y territorio;
68. la huella del recurso será determinista;
69. un cambio obliga a reevaluar;
70. el orden de listas y mapas es determinista;
71. las razones de bloqueo quedan reservadas;
72. AUTH-CTX-023 las consolidará;
73. AUTH-CTX-024 las auditará;
74. AUTH-CTX-026 diseñará resolvers y frontera transaccional;
75. AUTH-CTX-027 eliminará resolución local;
76. AUTH-CTX-028 gobernará compatibilidad legacy;
77. AUTH-CTX-029 gobernará frescura;
78. AUTH-CTX-030 gobernará pruebas;
79. los destinos de E1, E2, E3, E5, BLOQUE R y AUTH-DB quedan explícitos;
80. no se implementa código, migraciones ni cambios en Supabase.

---

#### 71. Estado final de la propuesta

| Tarea        | Estado      | Relación                  |
| ------------ | ----------- | ------------------------- |
| AUTH-CTX-017 | APROBADA    | Tarea anterior            |
| AUTH-CTX-018 | APROBADA    | Tarea actual              |
| AUTH-CTX-019 | NO INICIADA | Tarea siguiente reservada |

La continuidad propuesta queda:

```text
AUTH-CTX-017 — APROBADA
        ↓
AUTH-CTX-018 — APROBADA
        ↓
AUTH-CTX-019 — NO INICIADA
```

No se avanza a AUTH-CTX-019 hasta recibir aprobación explícita de
AUTH-CTX-018.


