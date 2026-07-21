### ✅ AUTH-CTX-004 — Versionar los contratos de respuesta

**Estado:** APROBADA  
**Bloque:** BLOQUE E — Contexto y decisión de autorización unificados  
**Naturaleza:** Publicación y congelación documental de contratos  
**Implementación física:** No incluida  
**Tarea anterior vigente:** AUTH-CTX-003 — APROBADA  
**Tarea posterior reservada:** AUTH-CTX-005 — Incluir principal autenticado  
**Familia contractual:** `vento.authorization.response-contracts@1.0.0`  
**Perfil de serialización:** `vento.canonical-json@1.0.0`  
**Huella contractual de publicación:** `sha256:782a216c4bbfdc3b3cec1bbd7239c05d93edd7fa34b4ce62cad48c1e6b9941cd`  
**Cambios físicos permitidos:** No

Esta tarea publica y congela la primera versión contractual de las
respuestas diseñadas en:

- AUTH-CTX-001 — `AccessContext`;
- AUTH-CTX-002 — `AuthorizationDecision`;
- AUTH-CTX-003 — `SimulationContext`;
- el resultado subordinado `SimulatedAuthorizationDecision`.

No crea tipos TypeScript, JSON Schema, Zod, funciones SQL, RPC, tablas,
migraciones, RLS, adaptadores, paquetes ni cambios físicos en Supabase.

---

#### 1. Objetivo

Establecer un sistema de versionado que permita:

1. identificar inequívocamente cada contrato;
2. distinguir semántica, forma serializada e implementación;
3. evolucionar respuestas sin romper consumidores silenciosamente;
4. detectar productores y consumidores incompatibles;
5. impedir downgrades o upgrades implícitos;
6. conservar decisiones históricas con su versión exacta;
7. permitir convivencia temporal mediante adaptadores explícitos;
8. separar versiones de contratos, catálogo, datasets y evaluadores;
9. registrar huellas reproducibles;
10. reservar la implementación física para tareas posteriores.

---

#### 2. Decisión principal

Se publica la familia:

```text
vento.authorization.response-contracts@1.0.0
```

con cuatro contratos identificables:

```text
AccessContext@1.0.0
AuthorizationDecision@1.0.0
SimulationContext@1.0.0
SimulatedAuthorizationDecision@1.0.0
```

Cada contrato tendrá dos versiones independientes:

```text
contract_version
→ semántica empresarial y reglas normativas

schema_version
→ forma serializada y estructura de campos
```

En la primera publicación:

```text
contract_version = 1.0.0
schema_version = 1.0.0
```

La coincidencia inicial no obliga a que ambas versiones evolucionen juntas.

---

#### 3. Identificadores congelados

| Elemento               | Identificador                            | Versión |
| ---------------------- | ---------------------------------------- | ------- |
| Familia                | `vento.authorization.response-contracts` | `1.0.0` |
| Contexto real          | `AccessContext`                          | `1.0.0` |
| Decisión real          | `AuthorizationDecision`                  | `1.0.0` |
| Contexto simulado      | `SimulationContext`                      | `1.0.0` |
| Decisión simulada      | `SimulatedAuthorizationDecision`         | `1.0.0` |
| Serialización canónica | `vento.canonical-json`                   | `1.0.0` |

No se utilizarán como identificadores contractuales:

- nombre de función SQL;
- ruta HTTP;
- nombre de paquete npm;
- nombre de tabla;
- nombre de repositorio;
- nombre de aplicación consumidora;
- fecha de despliegue;
- commit de una implementación concreta.

---

#### 4. Metadatos obligatorios comunes

Todos los contratos deberán declarar en su raíz:

```ts
type ContractMetadata = {
  contract_family: "vento.authorization.response-contracts";
  contract_family_version: "1.0.0";

  contract_name:
    | "AccessContext"
    | "AuthorizationDecision"
    | "SimulationContext"
    | "SimulatedAuthorizationDecision";

  contract_version: string;
  schema_version: string;
};
```

Los campos previamente diseñados se conservan.

Por tanto, las raíces publicadas quedan conceptualmente así:

```ts
type AccessContextV1 = ContractMetadata & {
  contract_name: "AccessContext";
  contract_version: "1.0.0";
  schema_version: "1.0.0";
  context_id: string;
  resolved_at: string;
  // demás campos aprobados en AUTH-CTX-001
};
```

```ts
type AuthorizationDecisionV1 = ContractMetadata & {
  contract_name: "AuthorizationDecision";
  contract_version: "1.0.0";
  schema_version: "1.0.0";
  decision_id: string;
  decided_at: string;
  // demás campos aprobados en AUTH-CTX-002
};
```

```ts
type SimulationContextV1 = ContractMetadata & {
  contract_name: "SimulationContext";
  contract_version: "1.0.0";
  schema_version: "1.0.0";
  simulation_id: string;
  created_at: string;
  expires_at: string;
  // demás campos aprobados en AUTH-CTX-003
};
```

```ts
type SimulatedAuthorizationDecisionV1 = ContractMetadata & {
  contract_name: "SimulatedAuthorizationDecision";
  contract_version: "1.0.0";
  schema_version: "1.0.0";
  simulated_decision_id: string;
  evaluated_at: string;
  // demás campos aprobados en AUTH-CTX-003
};
```

---

#### 5. Versiones que deben permanecer separadas

La respuesta podrá referenciar varias versiones simultáneamente.

| Versión                         | Qué identifica                                      |
| ------------------------------- | --------------------------------------------------- |
| `contract_family_version`       | Publicación coordinada de la familia de respuestas. |
| `contract_version`              | Semántica normativa del contrato específico.        |
| `schema_version`                | Estructura serializada del contrato específico.     |
| `catalog_version`               | Catálogo de aplicaciones y permisos utilizado.      |
| `catalog_hash`                  | Archivos físicos exactos del catálogo publicado.    |
| `contract_release_hash`         | Snapshot documental del catálogo de autorización.   |
| `dataset_version`               | Versión de una matriz o dataset de autorización.    |
| `dataset_hash`                  | Contenido exacto del dataset utilizado.             |
| `resolver_version`              | Implementación que produjo `AccessContext`.         |
| `evaluator_version`             | Implementación que produjo una decisión.            |
| `serialization_profile_version` | Reglas de serialización canónica.                   |

Regla:

```text
contract_version
≠ catalog_version
≠ dataset_version
≠ evaluator_version
```

Actualizar una implementación no cambia automáticamente el contrato.

Publicar un nuevo catálogo no cambia automáticamente el esquema de la
respuesta.

---

#### 6. Semántica de versiones

Se adopta versionado semántico:

```text
MAJOR.MINOR.PATCH
```

Ejemplo:

```text
1.4.2
│ │ └── PATCH
│ └──── MINOR
└────── MAJOR
```

##### 6.1 `MAJOR`

Se incrementa cuando existe incompatibilidad normativa o estructural.

Ejemplos:

- eliminar un campo obligatorio;
- renombrar un campo;
- cambiar el tipo de un campo;
- cambiar el significado de un campo existente;
- cambiar `ALLOW`/`DENY` por otra semántica;
- mezclar actor real y sujeto simulado;
- cambiar la precedencia de denegaciones;
- cambiar la composición de modalidades;
- convertir `null` en alcance global;
- permitir mutaciones mediante simulación;
- cambiar un campo opcional a obligatorio;
- eliminar un valor de enum vigente;
- cambiar el identificador del contrato;
- modificar la interpretación de un resultado histórico.

##### 6.2 `MINOR`

Se incrementa por extensiones compatibles y explícitas.

Ejemplos:

- agregar un campo opcional;
- agregar una razón estructurada nueva;
- agregar metadatos de auditoría opcionales;
- agregar una proyección segura nueva;
- agregar una categoría de procedencia;
- agregar un propósito de simulación;
- agregar un tipo de recurso sin cambiar los existentes;
- agregar una capacidad de explicación no obligatoria.

Un cambio `MINOR` solo será compatible si el consumidor cumple la política
de campos y enums desconocidos definida en esta tarea.

##### 6.3 `PATCH`

Se incrementa por correcciones compatibles que no cambian la semántica
normativa.

Ejemplos:

- corregir documentación;
- corregir ejemplos;
- aclarar una descripción sin cambiar el significado;
- agregar mensajes seguros equivalentes;
- corregir metadatos no autoritativos;
- corregir serialización sin alterar valores contractuales.

---

#### 7. Versión del contrato frente a versión del esquema

##### Cambio semántico sin cambio de forma

Ejemplo:

```text
mismo campo
+
significado normativo distinto
```

Resultado:

```text
contract_version cambia
schema_version puede permanecer
```

Si el cambio rompe la interpretación anterior:

```text
contract_version → MAJOR
```

##### Cambio de forma compatible sin cambio semántico

Ejemplo:

```text
nuevo campo opcional de diagnóstico
```

Resultado:

```text
schema_version → MINOR
contract_version puede permanecer
```

##### Cambio de forma incompatible

Ejemplo:

```text
campo obligatorio renombrado
```

Resultado:

```text
schema_version → MAJOR
contract_version → MAJOR
```

cuando el campo participa en la semántica contractual.

---

#### 8. Política de compatibilidad del productor

Todo productor deberá:

1. emitir `contract_family`;
2. emitir `contract_family_version`;
3. emitir `contract_name`;
4. emitir `contract_version`;
5. emitir `schema_version`;
6. respetar el perfil de serialización;
7. completar todos los campos obligatorios;
8. emitir valores explícitos `null` o listas vacías cuando corresponda;
9. no omitir silenciosamente campos obligatorios;
10. no emitir una versión distinta a la declarada;
11. registrar su `resolver_version` o `evaluator_version`;
12. registrar catálogo y datasets utilizados cuando participen;
13. fallar cerrado ante una publicación incompleta;
14. no adaptar la respuesta según heurísticas del cliente.

---

#### 9. Política de compatibilidad del consumidor

Todo consumidor deberá declarar:

```text
accepted_contract_name
accepted_contract_major_versions
accepted_schema_major_versions
```

Ejemplo conceptual:

```text
contract_name = AuthorizationDecision
accepted_contract_major_versions = [1]
accepted_schema_major_versions = [1]
```

El consumidor deberá:

- aceptar campos opcionales desconocidos;
- no asumir orden de propiedades JSON;
- no inferir autoridad por ausencia de campos desconocidos;
- tratar un campo obligatorio ausente como contrato inválido;
- tratar un enum crítico desconocido como incompatibilidad;
- no convertir un valor desconocido en `ALLOW`;
- no ignorar `contract_version`;
- no aceptar otro `contract_name`;
- no deserializar `SimulationContext` como `AccessContext`;
- no deserializar `WOULD_ALLOW` como `ALLOW`.

---

#### 10. Campos desconocidos

##### Campo opcional desconocido

Regla:

```text
campo opcional desconocido
→ conservar o ignorar de forma segura
→ no alterar decisión
```

##### Campo obligatorio desconocido

Un consumidor antiguo no puede saber por sí solo que un campo nuevo es
obligatorio.

Por tanto:

```text
agregar campo obligatorio
→ cambio MAJOR
```

##### Campo obligatorio ausente

```text
missing_required_field
→ CONTRACT_INVALID
→ fail closed
```

No se aplicará un valor predeterminado permisivo.

---

#### 11. Enums desconocidos

Se distinguen enums críticos y extensibles.

##### 11.1 Enums críticos

Incluyen como mínimo:

- `contract_name`;
- `authorization_requirement`;
- `final_decision.outcome`;
- `LaneDecision.outcome`;
- `SimulationStatus`;
- `SimulatedAuthorizationDecision.final_result`;
- estados de resolución de recurso;
- clases de denegación;
- severidades bloqueantes.

Regla:

```text
enum crítico desconocido
→ CONTRACT_INCOMPATIBLE
→ fail closed
```

##### 11.2 Enums extensibles

Podrán incluir:

- categorías informativas;
- mensajes seguros;
- propósitos adicionales;
- metadatos no autoritativos;
- clases de diagnóstico no bloqueantes.

Regla:

```text
enum extensible desconocido
→ preservar código
→ usar fallback seguro
→ no transformar en allow
```

Cada campo deberá clasificarse explícitamente como crítico o extensible en
el schema físico futuro.

---

#### 12. Resultados congelados

##### Decisión real

```text
ALLOW
DENY
```

No se agregará un tercer resultado real compatible dentro de la versión
mayor `1`.

Agregar un resultado real nuevo exige:

```text
AuthorizationDecision contract_version → 2.0.0
schema_version → 2.0.0
```

##### Decisión simulada

```text
WOULD_ALLOW
WOULD_DENY
INDETERMINATE
```

Estos valores no son intercambiables con resultados reales.

Eliminar, fusionar o reinterpretar cualquiera exige versión mayor.

---

#### 13. Compatibilidad de `AccessContext`

Dentro de `AccessContext@1.x` permanecen invariantes:

- principal separado de actor efectivo;
- identidad de dominio separada de empleado;
- rol base separado de rol operativo;
- cobertura administrativa separada del contexto operativo;
- turno separado de check-in;
- dispositivo separado del actor;
- problemas estructurales explícitos;
- `null` no significa global;
- listas vacías significan ausencia;
- la ausencia de turno no invalida automáticamente el carril base;
- el contrato no contiene la decisión final;
- el contrato no contiene simulación.

Romper cualquiera exige `AccessContext@2.0.0`.

---

#### 14. Compatibilidad de `AuthorizationDecision`

Dentro de `AuthorizationDecision@1.x` permanecen invariantes:

- decisión por aplicación exacta;
- decisión por permiso exacto;
- decisión por recurso exacto;
- resolución de territorio en servidor;
- modalidad obtenida del catálogo;
- carriles base y operativo separados;
- deny estructural por encima de todo allow;
- actor-wide deny por encima de allows;
- lane deny por encima de allow del mismo carril;
- denegación por defecto;
- composición exacta de las cuatro modalidades;
- resultado real exclusivamente `ALLOW` o `DENY`;
- la decisión no es token de capacidad;
- la UI no sustituye evaluación de servidor.

Romper cualquiera exige `AuthorizationDecision@2.0.0`.

---

#### 15. Compatibilidad de `SimulationContext`

Dentro de `SimulationContext@1.x` permanecen invariantes:

- actor real separado de sujeto simulado;
- `auth.uid()` real e inmutable;
- sin cambios de RLS;
- sin mutaciones;
- `WOULD_ALLOW` no ejecutable;
- datos reales limitados por autoridad real;
- procedencia explícita de valores hipotéticos;
- expiración obligatoria;
- auditoría atribuida al actor real;
- resultado separado mediante `SimulatedAuthorizationDecision`;
- escenarios incompletos no producen `WOULD_ALLOW`.

Romper cualquiera exige `SimulationContext@2.0.0`.

---

#### 16. Compatibilidad entre contratos

Matriz inicial:

| Productor                            | Consumidor esperado                             |  Compatible |
| ------------------------------------ | ----------------------------------------------- | ----------: |
| `AccessContext@1.x`                  | Evaluador real que acepta major 1               |          Sí |
| `AccessContext@1.x`                  | Evaluador simulado mediante adaptador explícito | Condicional |
| `SimulationContext@1.x`              | Evaluador real                                  |          No |
| `AuthorizationDecision@1.x`          | UI real compatible con major 1                  |          Sí |
| `SimulatedAuthorizationDecision@1.x` | UI real de ejecución                            |          No |
| `SimulatedAuthorizationDecision@1.x` | UI de simulación compatible                     |          Sí |
| `AuthorizationDecision@1.x`          | Consumidor que solo acepta major 2              |          No |
| Contrato sin versión                 | Cualquier consumidor canónico                   |          No |

---

#### 17. Downgrade y upgrade

Queda prohibido:

```text
respuesta 2.x
→ consumidor 1.x
→ borrar campos hasta que parezca 1.x
```

También:

```text
respuesta 1.x
→ consumidor 2.x
→ asumir campos o semántica 2.x
```

Regla:

```text
silent_downgrade = false
silent_upgrade = false
```

Toda conversión requiere:

- adaptador identificado;
- versión origen;
- versión destino;
- reglas deterministas;
- pruebas contractuales;
- auditoría;
- límites de información;
- periodo de retiro;
- rollback.

---

#### 18. Adaptadores

Forma conceptual:

```ts
type ContractAdapterMetadata = {
  adapter_id: string;
  adapter_version: string;

  source_contract_name: string;
  source_contract_version_range: string;
  source_schema_version_range: string;

  target_contract_name: string;
  target_contract_version: string;
  target_schema_version: string;

  lossless: boolean;
  dropped_fields: string[];
  synthesized_fields: string[];
};
```

Reglas:

1. un adaptador no inventa autoridad;
2. un campo autoritativo faltante no se sintetiza mediante fallback
   permisivo;
3. una conversión con pérdida deberá declararse;
4. un resultado simulado nunca se adapta a decisión real;
5. un adaptador legacy no puede omitir denegaciones;
6. los adaptadores se implementarán y probarán en BLOQUE R;
7. la compatibilidad con `get_operational_context` se diseñará en
   AUTH-CTX-028.

---

#### 19. Deprecación

Estados contractuales:

```text
ACTIVE
DEPRECATED
SUNSET
RETIRED
```

##### `ACTIVE`

Versión soportada para nuevos consumidores.

##### `DEPRECATED`

Sigue funcionando, pero no debe adoptarse en consumidores nuevos.

##### `SUNSET`

Tiene retiro aprobado y consumidores migrándose.

##### `RETIRED`

No se produce ni se acepta en caminos canónicos.

Una versión no podrá pasar a `RETIRED` sin:

- inventario de consumidores;
- telemetría suficiente;
- adaptador o migración aprobada;
- pruebas;
- rollback;
- decisión documental;
- ausencia de consumidores críticos sin migrar.

No se fija todavía una duración temporal universal.

---

#### 20. Reglas para cambios correctivos de implementación

Una implementación puede contener un bug respecto al contrato vigente.

Ejemplo:

```text
contrato 1.0.0
→ deny debe prevalecer

implementación
→ allow prevalece por error
```

La corrección:

- incrementa `evaluator_version`;
- no cambia necesariamente `contract_version`;
- no reescribe decisiones históricas;
- debe registrar el despliegue;
- debe ejecutar pruebas de regresión;
- puede cambiar resultados futuros porque corrige incumplimiento.

Si para justificar la conducta se cambia la norma, entonces sí corresponde
una nueva versión contractual.

---

#### 21. Decisiones históricas

Una decisión persistida deberá conservar como mínimo:

```text
contract_family_version
contract_name
contract_version
schema_version
catalog_version
catalog_hash
contract_release_hash
dataset_versions
dataset_hashes
resolver_version o evaluator_version
serialization_profile_version
```

Reglas:

- una decisión histórica se interpreta con su versión original;
- no se reinterpreta automáticamente con el contrato actual;
- no se recalcula silenciosamente;
- una vista histórica podrá aplicar adaptadores de lectura explícitos;
- la evidencia original permanece inmutable.

---

#### 22. Perfil de serialización

Se publica:

```text
vento.canonical-json@1.0.0
```

Reglas:

1. codificación UTF-8;
2. nombres de campos en `snake_case`;
3. timestamps RFC 3339 en UTC;
4. identificadores como strings;
5. booleanos JSON reales;
6. `null` explícito cuando el campo admite ausencia;
7. listas vacías explícitas;
8. objetos sin claves duplicadas;
9. números sin representación ambigua;
10. sin `NaN`, `Infinity` o valores no JSON;
11. sin dependencia del orden de propiedades;
12. enums mediante códigos canónicos;
13. sin datos secretos;
14. sin HTML dentro de campos estructurados;
15. sin campos autoritativos calculados por el cliente.

---

#### 23. Serialización para hashing

Cuando se requiera una huella de payload:

- UTF-8 sin BOM;
- saltos LF;
- claves ordenadas lexicográficamente;
- objetos normalizados recursivamente;
- arrays conservan orden cuando sea semántico;
- arrays se ordenan cuando el contrato declare que son conjuntos;
- timestamps normalizados a UTC;
- sin espacios insignificantes;
- sin campos volátiles excluidos por el perfil;
- SHA-256 sobre bytes canónicos.

Los timestamps de ejecución no forman parte de la huella contractual de
publicación de esta tarea.

---

#### 24. Huellas diferenciadas

```text
response_contract_release_hash
→ identifica esta publicación documental

response_schema_hash
→ identificará archivos físicos de schemas

response_payload_hash
→ podrá identificar una respuesta concreta

catalog_hash
→ identifica catálogo físico

dataset_hash
→ identifica dataset físico

evaluator_build_hash
→ identifica implementación desplegada
```

Ninguna huella sustituye a las demás.

---

#### 25. Huella de esta publicación

Campo publicado:

```text
response_contract_release_hash =
sha256:782a216c4bbfdc3b3cec1bbd7239c05d93edd7fa34b4ce62cad48c1e6b9941cd
```

Payload canónico:

```text
contract_family_id=vento.authorization.response-contracts
contract_family_version=1.0.0
release_kind=contractual_snapshot
access_context.contract_name=AccessContext
access_context.contract_version=1.0.0
access_context.schema_version=1.0.0
authorization_decision.contract_name=AuthorizationDecision
authorization_decision.contract_version=1.0.0
authorization_decision.schema_version=1.0.0
simulation_context.contract_name=SimulationContext
simulation_context.contract_version=1.0.0
simulation_context.schema_version=1.0.0
simulated_authorization_decision.contract_name=SimulatedAuthorizationDecision
simulated_authorization_decision.contract_version=1.0.0
simulated_authorization_decision.schema_version=1.0.0
serialization_profile=vento.canonical-json
serialization_profile_version=1.0.0
compatibility_policy=semantic_versioning_strict_major
unknown_optional_fields=ignore
unknown_critical_enum=fail_closed
missing_required_field=contract_invalid
silent_downgrade=false
silent_upgrade=false
real_decision_outcomes=ALLOW,DENY
simulated_decision_outcomes=WOULD_ALLOW,WOULD_DENY,INDETERMINATE
physical_changes_allowed=false
next_task=AUTH-CTX-005
source_task=AUTH-CTX-001
source_task=AUTH-CTX-002
source_task=AUTH-CTX-003
```

Algoritmo:

- UTF-8 sin BOM;
- saltos LF;
- una asignación por línea;
- campos en el orden publicado;
- sin espacios finales;
- un único LF final;
- SHA-256 sobre todos los bytes.

Resultado:

```text
782a216c4bbfdc3b3cec1bbd7239c05d93edd7fa34b4ce62cad48c1e6b9941cd
```

Esta huella identifica la decisión documental congelada.

No es el futuro hash de archivos TypeScript, JSON Schema o SQL.

---

#### 26. Negociación de versión

La implementación futura deberá preferir negociación explícita.

Ejemplo conceptual:

```text
consumer_accepts:
  AccessContext:
    contract_major: [1]
    schema_major: [1]
```

El productor deberá responder con una versión compatible o fallar.

No se permite:

- entregar la versión más reciente sin revisar compatibilidad;
- interpretar ausencia de versión como `latest`;
- usar user-agent para inferir contrato;
- entregar contratos distintos con el mismo identificador;
- negociar una decisión simulada como real.

La forma física de negociación se definirá en AUTH-CTX-025 a
AUTH-CTX-028.

---

#### 27. Errores de versión

Códigos conceptuales:

```text
contract_name_missing
contract_version_missing
schema_version_missing
contract_family_mismatch
unsupported_contract_major
unsupported_schema_major
contract_schema_incompatible
contract_hash_mismatch
catalog_version_incompatible
dataset_version_incompatible
serialization_profile_unsupported
adapter_required
adapter_not_available
```

Regla para autorización real:

```text
error de versión crítico
→ CONTRACT_INVALID
→ DENY
```

Regla para simulación:

```text
error de versión crítico
→ INDETERMINATE o INVALID
→ nunca WOULD_ALLOW
```

---

#### 28. Nuevos campos y consumidores exhaustivos

Todo consumidor deberá evitar lógica exhaustiva frágil sobre campos
extensibles.

Ejemplo prohibido:

```ts
switch (reason.category) {
  case "SHIFT":
  case "CHECKIN":
    return render();
  default:
    throw new Error();
}
```

Para enums extensibles deberá existir un fallback seguro.

Para enums críticos, el fallback será incompatibilidad y fail closed.

Agregar un valor a un enum crítico dentro de la misma major solo será
posible cuando el contrato del campo ya lo haya declarado extensible.

---

#### 29. Reglas por tipo de consumidor

##### UI

- puede ignorar metadatos opcionales;
- no puede ignorar `outcome`;
- no convierte error de versión en acceso;
- muestra mensaje seguro de incompatibilidad;
- no reconstruye decisiones.

##### Server Action o API

- valida versiones antes de actuar;
- no confía en respuestas entregadas por el cliente;
- reevalúa cuando corresponde;
- falla cerrado.

##### RPC y RLS

- deben implementar la misma major contractual;
- no usan respuestas antiguas sin adaptador;
- no interpretan simulación como autorización real.

##### Auditoría

- conserva versiones y hashes exactos;
- permite lectura histórica;
- no reescribe payloads.

##### Jobs y automatizaciones

- declaran versión aceptada;
- detienen o aíslan procesamiento incompatible;
- no continúan con defaults permisivos.

---

#### 30. Relación con el catálogo `vento.authorization@1.0.0`

La primera familia de respuestas se diseña para consumir:

```text
catalog_version = 1.0.0
```

y la publicación contractual:

```text
contract_release_hash =
sha256:687e1bc19c0cf7332e76ed940cf5a23b829492ebbee399af718fd326cf473cbe
```

Esto no significa que los contratos de respuesta deban cambiar de versión
cada vez que cambia el catálogo.

Ejemplo:

```text
AccessContext@1.0.0
AuthorizationDecision@1.0.0
+
catalog_version=1.1.0
```

puede ser válido si:

- la semántica de las respuestas no cambia;
- los nuevos valores son compatibles;
- el consumidor acepta la versión del catálogo;
- no se agregan enums críticos incompatibles.

---

#### 31. Relación con datasets

Una respuesta deberá declarar los datasets realmente utilizados.

Ejemplo conceptual:

```ts
dataset_references: [
  {
    dataset_id: "vento.authorization.base-role-grants",
    dataset_version: "1.0.0",
    dataset_hash: "sha256:..."
  },
  {
    dataset_id: "vento.authorization.operational-role-grants",
    dataset_version: "1.0.0",
    dataset_hash: "sha256:..."
  },
  {
    dataset_id: "vento.authorization.individual-overrides",
    dataset_version: "1.0.0",
    dataset_hash: "sha256:..."
  }
]
```

La ausencia de un dataset obligatorio o una incompatibilidad produce fail
closed.

---

#### 32. Compatibilidad con consumidores legacy

Los consumidores actuales que dependan de:

- `get_operational_context`;
- cookies de role override;
- respuestas booleanas;
- permisos sin recurso;
- campos legacy;
- roles hardcodeados;

no se consideran automáticamente compatibles con la familia `1.0.0`.

Deberán:

```text
inventariarse
→ clasificarse
→ adaptar explícitamente
→ probarse
→ migrarse
→ retirarse
```

La estrategia concreta se definirá en AUTH-CTX-028.

---

#### 33. Publicación física futura

La publicación física deberá generar como mínimo:

- tipos TypeScript;
- schemas de validación;
- fixtures;
- ejemplos válidos;
- ejemplos inválidos;
- pruebas de compatibilidad;
- hashes físicos;
- changelog;
- matriz productor–consumidor;
- adaptadores aprobados;
- reglas de deprecación.

No se crean en AUTH-CTX-004.

---

#### 34. Pruebas contractuales mínimas futuras

Se deberá probar:

1. contrato sin versión;
2. nombre de contrato incorrecto;
3. major compatible;
4. major incompatible;
5. minor superior compatible;
6. campo opcional desconocido;
7. campo obligatorio ausente;
8. enum crítico desconocido;
9. enum extensible desconocido;
10. schema incompatible;
11. hash incorrecto;
12. catálogo incompatible;
13. dataset incompatible;
14. downgrade silencioso;
15. upgrade silencioso;
16. adaptador lossless;
17. adaptador con pérdida declarada;
18. `WOULD_ALLOW` entregado a consumidor real;
19. decisión histórica interpretada con su versión;
20. corrección de evaluador sin cambio contractual;
21. cambio semántico que exige major;
22. cambio opcional que exige minor;
23. aclaración documental que exige patch;
24. consumidor legacy sin adaptador;
25. serialización canónica reproducible.

El plan completo de pruebas corresponde a AUTH-CTX-030.

---

#### 35. Invariantes

1. Todo contrato declara nombre y versión.
2. Todo contrato declara schema version.
3. La familia se identifica explícitamente.
4. La semántica y el esquema se versionan por separado.
5. El catálogo se versiona por separado.
6. Los datasets se versionan por separado.
7. El evaluador se versiona por separado.
8. La primera versión de cada contrato es `1.0.0`.
9. Un cambio incompatible incrementa major.
10. Un campo obligatorio nuevo incrementa major.
11. Un campo opcional compatible incrementa minor.
12. Una aclaración no semántica incrementa patch.
13. Campos opcionales desconocidos no conceden autoridad.
14. Enums críticos desconocidos fallan cerrado.
15. Campos obligatorios ausentes fallan cerrado.
16. No existe downgrade silencioso.
17. No existe upgrade silencioso.
18. Todo adaptador es explícito y versionado.
19. Una decisión simulada nunca se adapta a decisión real.
20. `ALLOW` y `DENY` permanecen congelados en major 1.
21. `WOULD_ALLOW`, `WOULD_DENY` e `INDETERMINATE` permanecen congelados en
    major 1.
22. Una decisión histórica conserva sus versiones originales.
23. El orden JSON no participa en semántica.
24. `null` no se reinterpreta durante adaptación.
25. La incompatibilidad real produce `DENY`.
26. La incompatibilidad simulada no produce `WOULD_ALLOW`.
27. Las versiones no se infieren por ruta o nombre de función.
28. El hash documental no sustituye hashes físicos.
29. Los consumidores deben declarar majors aceptadas.
30. La implementación física queda reservada para BLOQUE R.

---

#### 36. Antipatrones prohibidos

```ts
const version = response.contract_version ?? "latest";
const allowed = response.final_decision !== "DENY";
const role = legacy.role ?? response.base_role;
const result = simulated.final_result.replace("WOULD_", "");
```

También queda prohibido:

```text
sin versión → asumir 1.0.0
major desconocida → intentar de todos modos
enum desconocido → ALLOW
campo obligatorio ausente → usar null permisivo
respuesta 2.x → borrar campos hasta parecer 1.x
SimulationContext → AccessContext
WOULD_ALLOW → ALLOW
hash documental → hash de archivos
versión de catálogo → versión de respuesta
```

---

#### 37. Estado de publicación

| Contrato                         | Estado   | Contract version | Schema version |
| -------------------------------- | -------- | ---------------- | -------------- |
| `AccessContext`                  | `ACTIVE` | `1.0.0`          | `1.0.0`        |
| `AuthorizationDecision`          | `ACTIVE` | `1.0.0`          | `1.0.0`        |
| `SimulationContext`              | `ACTIVE` | `1.0.0`          | `1.0.0`        |
| `SimulatedAuthorizationDecision` | `ACTIVE` | `1.0.0`          | `1.0.0`        |

Estado de la familia:

```text
vento.authorization.response-contracts@1.0.0
→ CONTRACTUAL_SNAPSHOT
→ NO PHYSICAL PUBLICATION
```

---

#### 38. Relación con tareas posteriores

##### AUTH-CTX-005 a AUTH-CTX-015

Precisarán nodos internos de `AccessContext`.

Podrán agregar detalle compatible, pero no romper invariantes de
`AccessContext@1.x`.

##### AUTH-CTX-016 a AUTH-CTX-024

Precisarán nodos internos de `AuthorizationDecision`.

Podrán agregar detalle compatible, pero no romper invariantes de
`AuthorizationDecision@1.x`.

##### AUTH-CTX-025 y AUTH-CTX-026

Diseñarán contratos SQL futuros y deberán declarar las versiones que
producen.

##### AUTH-CTX-027

Definirá consumidores centralizados y versiones aceptadas.

##### AUTH-CTX-028

Definirá adaptadores y compatibilidad temporal con
`get_operational_context`.

##### AUTH-CTX-029

Definirá invalidación, caché y vigencia de respuestas.

##### AUTH-CTX-030

Definirá pruebas de contrato y compatibilidad.

##### BLOQUE H

Materializará tipos y contratos compartidos después de las aprobaciones
correspondientes.

##### BLOQUE E3

Definirá ubicación, persistencia y gobierno físico de schemas, auditoría y
versiones.

##### BLOQUE R

Implementará productores, adaptadores y migración de consumidores.

---

#### 39. Fuera del alcance

AUTH-CTX-004 no:

- cambia la semántica de AUTH-CTX-001 a AUTH-CTX-003;
- implementa schemas;
- crea paquetes;
- crea tipos;
- crea SQL;
- crea RPC;
- crea RLS;
- crea migraciones;
- crea adaptadores;
- migra consumidores;
- retira contratos legacy;
- define TTL;
- define caché;
- publica archivos físicos;
- modifica Supabase;
- cambia el catálogo;
- cambia datasets.

---

#### 40. Criterios de aprobación

AUTH-CTX-004 podrá aprobarse cuando se acepte que:

1. la familia se publica como
   `vento.authorization.response-contracts@1.0.0`;
2. `AccessContext` se publica como `1.0.0`;
3. `AuthorizationDecision` se publica como `1.0.0`;
4. `SimulationContext` se publica como `1.0.0`;
5. `SimulatedAuthorizationDecision` se publica como `1.0.0`;
6. `contract_version` y `schema_version` son independientes;
7. se adopta versionado semántico;
8. cambios incompatibles incrementan major;
9. campos opcionales compatibles incrementan minor;
10. aclaraciones compatibles incrementan patch;
11. campos obligatorios nuevos requieren major;
12. enums críticos desconocidos fallan cerrado;
13. campos obligatorios ausentes fallan cerrado;
14. campos opcionales desconocidos se ignoran de forma segura;
15. no existe downgrade silencioso;
16. no existe upgrade silencioso;
17. adaptadores son explícitos y versionados;
18. una decisión simulada no puede adaptarse a real;
19. las versiones de catálogo y datasets permanecen separadas;
20. resolver y evaluador tienen versiones independientes;
21. decisiones históricas conservan sus versiones originales;
22. se publica `vento.canonical-json@1.0.0`;
23. se publica la huella
    `sha256:782a216c4bbfdc3b3cec1bbd7239c05d93edd7fa34b4ce62cad48c1e6b9941cd`;
24. la huella documental no sustituye hashes físicos;
25. consumidores declaran majors aceptadas;
26. incompatibilidad real produce `DENY`;
27. incompatibilidad simulada no produce `WOULD_ALLOW`;
28. la compatibilidad legacy se reserva para AUTH-CTX-028;
29. las pruebas se reservan para AUTH-CTX-030;
30. no se implementa ningún cambio físico.

---

#### 41. Estado final de la propuesta

| Tarea        | Estado      |
| ------------ | ----------- |
| AUTH-CTX-003 | APROBADA    |
| AUTH-CTX-004 | APROBADA    |
| AUTH-CTX-005 | NO INICIADA |

No se avanza a AUTH-CTX-005 hasta recibir aprobación explícita de
AUTH-CTX-004.


ACCESS CONTEXT

