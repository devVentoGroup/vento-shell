### ✅ AUTH-CTX-009 — Incluir cobertura administrativa por sede y área

**Estado:** APROBADA  
**Bloque:** BLOQUE E — Contexto y decisión de autorización unificados  
**Naturaleza:** Refinamiento documental de `assigned_sites`, `assigned_areas` y `administrative_coverage` dentro de `AccessContext`  
**Implementación física:** No incluida  
**Tarea anterior vigente:** AUTH-CTX-008 — APROBADA  
**Tarea posterior reservada:** AUTH-CTX-010 — Incluir turno publicado y vigente  
**Tarea diferida relacionada:** AUTH-MOD-021 — No bloquea esta tarea  
**Contrato afectado:** `AccessContext@1.0.0`  
**Nodos afectados:** `assigned_sites`, `assigned_areas`, `administrative_coverage`  
**Cambio contractual:** Aclaración normativa compatible; no cambia la forma publicada  
**Cambios físicos permitidos:** No

Esta tarea define de forma exhaustiva cómo `AccessContext` representa las
sedes y áreas laboralmente asignadas al empleado y cómo resuelve su cobertura
administrativa base sin confundir:

- asignación laboral;
- sede o área primaria;
- selección de navegación;
- alcance de un permiso;
- cobertura administrativa;
- territorio operativo;
- territorio real del recurso;
- autorización final.

No modifica la estructura raíz aprobada de `AccessContext`, no agrega campos,
no cambia `contract_version`, no cambia `schema_version`, no modifica matrices
ni datasets y no implementa tipos, funciones SQL, RPC, RLS, migraciones,
adaptadores, guards, aplicaciones ni cambios físicos en Supabase.

---

#### 1. Objetivo

Definir los nodos `assigned_sites`, `assigned_areas` y
`administrative_coverage` de manera que Vento OS pueda responder
inequívocamente:

1. qué sedes están laboralmente asignadas al empleado;
2. cuáles de esas asignaciones están vigentes y son utilizables;
3. cuál sede es primaria sin convertirla en autorización;
4. qué áreas están laboralmente asignadas;
5. a qué sede pertenece cada área;
6. cuál área es primaria dentro de una sede;
7. qué cobertura administrativa base posee el actor;
8. si esa cobertura es organizacional, por sedes, por áreas, específica o
   inexistente;
9. qué fuente autoritativa produjo la cobertura;
10. si el resultado es internamente válido;
11. cómo tratar asignaciones inactivas, sedes inactivas y áreas incompatibles;
12. cómo impedir que una selección visual amplíe autoridad;
13. cómo mantener independiente el carril operativo;
14. cómo evitar que el nombre del rol se convierta en un bypass;
15. cómo conservar determinismo, trazabilidad y fail closed.

---

#### 2. Base normativa

AUTH-CTX-009 conserva sin cambios las decisiones aprobadas en:

- ADR-AUTH-001;
- AUTH-MOD-002 — Separar rol base de rol operativo;
- AUTH-MOD-003 — Definir roles administrativos globales;
- AUTH-MOD-004 — Definir roles administrativos por sede;
- AUTH-MOD-006 — Definir casos híbridos administrativo-operativos;
- AUTH-MOD-007 — Definir sede asignada y sede activa;
- AUTH-MOD-008 — Definir área asignada y área activa;
- AUTH-MOD-013 a AUTH-MOD-017 — Alcances globales, por sede, tipo de sede,
  área y tipo de área;
- AUTH-MOD-018 — Precedencia;
- AUTH-MOD-019 — Denegación explícita;
- AUTH-RBAC-001 a AUTH-RBAC-007 — Matrices base;
- AUTH-RBAC-024 — Dataset canónico de matriz base;
- AUTH-CTX-001 — Diseñar `AccessContext`;
- AUTH-CTX-004 — Versionar contratos;
- AUTH-CTX-007 — Identidad laboral o de dominio;
- AUTH-CTX-008 — Rol base vigente.

Principios heredados obligatorios:

```text
ASIGNACIÓN
≠
PERMISO
```

```text
SEDE PRIMARIA
≠
SEDE AUTORIZADA ÚNICA
```

```text
SEDE O ÁREA SELECCIONADA
≠
AUTORIDAD
```

```text
COBERTURA ADMINISTRATIVA
≠
ALLOW DE UN PERMISO
```

```text
COBERTURA ADMINISTRATIVA
≠
TERRITORIO OPERATIVO
```

---

#### 3. Separación conceptual obligatoria

El contrato mantendrá separados los siguientes conceptos:

| Concepto                 | Significado                                                      |                         Concede permisos |
| ------------------------ | ---------------------------------------------------------------- | ---------------------------------------: |
| Sede organizacional      | Unidad territorial registrada por Vento                          |                                       No |
| Sede asignada            | Relación laboral entre empleado y sede                           |                                       No |
| Sede primaria            | Referencia laboral principal                                     |                                       No |
| Sede seleccionada        | Preferencia de navegación o filtro                               |                                       No |
| Cobertura administrativa | Territorio base disponible para evaluar permisos administrativos |                                       No |
| Sede operativa           | Sede del turno vigente                                           |                                       No |
| Sede del recurso         | Territorio real afectado por la acción                           |                                       No |
| Permiso efectivo         | Capacidad concreta evaluada contra contexto y recurso            | Sí, solo si la decisión final es `ALLOW` |

La misma separación aplica a las áreas.

---

#### 4. Forma contractual conservada

AUTH-CTX-009 conserva exactamente la forma conceptual publicada:

```ts
type AssignedSiteContext = {
  site_id: string;
  site_code: string;
  is_primary: boolean;
  assignment_active: boolean;
  site_active: boolean;
  assignable: boolean;
};

type AssignedAreaContext = {
  area_id: string;
  site_id: string;
  area_kind: string;
  is_primary_for_site: boolean;
  assignment_active: boolean;
  area_active: boolean;
};

type AdministrativeCoverageContext = {
  mode:
    | "NONE"
    | "ASSIGNED_SITES"
    | "SPECIFIC_SITE"
    | "ASSIGNED_AREAS"
    | "SPECIFIC_AREA"
    | "ORGANIZATION";

  site_ids: string[];
  area_ids: string[];
  source: string;
  valid: boolean;
};
```

No se agregan propiedades.

Las precisiones de esta tarea son semánticas y compatibles con
`AccessContext@1.0.0`.

---

#### 5. Resolución exclusiva en servidor

Los tres nodos deberán resolverse en servidor.

No podrá aceptarse como fuente autoritativa:

- `selectedSite`;
- `selectedArea`;
- query string;
- parámetros de ruta;
- body enviado por el cliente;
- estado de React;
- almacenamiento local;
- cookie no firmada;
- encabezado personalizado;
- sede mostrada actualmente en la interfaz;
- sede contenida en un turno distinto al vigente;
- última sede utilizada;
- nombre del rol;
- código de navegación;
- dispositivo compartido;
- valor legacy sin validar.

El cliente podrá solicitar una vista o filtrar información, pero la
solicitud no podrá ampliar el contexto resuelto.

---

#### 6. `assigned_sites`

`assigned_sites` representa hechos laborales explícitos entre el empleado
resuelto y sedes organizacionales concretas.

No representa:

- permisos;
- cobertura global;
- turno;
- geolocalización;
- sede operativa;
- sede del recurso;
- sedes visibles por un permiso organizacional;
- sedes administradas por otra persona;
- sedes inferidas por el nombre del rol.

---

#### 7. Fuente conceptual de `assigned_sites`

La fuente normativa continúa siendo la relación canónica equivalente a:

```text
empleado
→ asignaciones laborales de sede
→ sede organizacional
```

La implementación futura no podrá utilizar `employees.site_id` como fuente
canónica definitiva.

`employees.site_id` es un dato legacy y su adaptación queda asignada a
AUTH-CTX-028.

AUTH-CTX-025 deberá diseñar el contrato SQL que produzca estas asignaciones
sin depender de la sede seleccionada por el cliente.

---

#### 8. Semántica de `AssignedSiteContext`

| Campo               | Regla                                                                                                |
| ------------------- | ---------------------------------------------------------------------------------------------------- |
| `site_id`           | Identificador exacto de la sede asignada                                                             |
| `site_code`         | Código canónico de la sede observada                                                                 |
| `is_primary`        | Indica referencia laboral principal; no concede autoridad                                            |
| `assignment_active` | La relación empleado-sede está vigente en `resolved_at`                                              |
| `site_active`       | La sede organizacional está activa en `resolved_at`                                                  |
| `assignable`        | La sede puede participar en asignaciones laborales ordinarias y en el contexto administrativo actual |

Una sede es **utilizable para cobertura administrativa** únicamente cuando:

```text
assignment_active = true
AND
site_active = true
AND
assignable = true
```

La presencia de una fila no implica que sea utilizable.

---

#### 9. Sede primaria

Reglas:

1. podrá existir como máximo una sede primaria vigente por empleado;
2. una sede primaria deberá formar parte de `assigned_sites`;
3. una sede primaria inactiva podrá conservarse como evidencia observada,
   pero no será utilizable;
4. cero sedes primarias es un estado representable;
5. más de una sede primaria vigente constituye inconsistencia estructural;
6. la sede primaria no limita automáticamente una asignación multisede;
7. la sede primaria no sustituye la cobertura administrativa;
8. la sede primaria no se utilizará como fallback cuando no exista cobertura
   válida.

---

#### 10. Lista vacía de sedes

```text
assigned_sites = []
```

significa exactamente:

```text
no se resolvieron asignaciones laborales de sede representables
```

No significa:

- todas las sedes;
- sede principal de la organización;
- sede del último turno;
- sede enviada por el frontend;
- sede implícita del rol;
- Vento Group;
- organización completa.

---

#### 11. Multisede

Varias asignaciones vigentes producen una lista multisede explícita.

```text
dos o más assigned_sites utilizables
≠
ORGANIZATION
```

La cobertura multisede seguirá siendo finita y enumerada.

Una sede nueva no se incorporará automáticamente salvo que exista una
asignación laboral o una fuente de cobertura explícita que la incluya.

---

#### 12. Orden determinista de `assigned_sites`

La serialización deberá:

1. eliminar duplicados exactos por `site_id`;
2. ubicar primero la sede primaria cuando exista;
3. ordenar después por `site_code`;
4. utilizar `site_id` como desempate;
5. conservar siempre el mismo orden para el mismo snapshot.

Un duplicado contradictorio no se deduplicará silenciosamente: producirá
invalidez estructural.

---

#### 13. `assigned_areas`

`assigned_areas` representa relaciones laborales explícitas entre el empleado
y áreas organizacionales concretas.

No representa:

- permisos;
- tipo de área autorizado;
- área activa del turno;
- área seleccionada;
- área del recurso;
- área inferida desde el rol;
- todas las áreas con el mismo nombre;
- todas las áreas del mismo `area_kind`.

---

#### 14. Fuente conceptual de `assigned_areas`

La fuente normativa continúa siendo la relación canónica equivalente a:

```text
empleado
→ asignaciones laborales de área
→ área organizacional
→ sede propietaria
```

AUTH-CTX-025 deberá diseñar el contrato SQL que produzca estas asignaciones.

AUTH-CTX-028 deberá adaptar fuentes legacy sin convertir nombres, tipos de
área o turnos históricos en asignaciones permanentes.

---

#### 15. Semántica de `AssignedAreaContext`

| Campo                 | Regla                                                    |
| --------------------- | -------------------------------------------------------- |
| `area_id`             | Identificador exacto del área asignada                   |
| `site_id`             | Sede propietaria exacta del área                         |
| `area_kind`           | Clasificación funcional del área; no sustituye `area_id` |
| `is_primary_for_site` | Referencia principal dentro de esa sede                  |
| `assignment_active`   | La relación empleado-área está vigente                   |
| `area_active`         | El área organizacional está activa                       |

Un área es utilizable para cobertura administrativa únicamente cuando:

```text
assignment_active = true
AND
area_active = true
AND
su site_id pertenece a una sede utilizable
```

---

#### 16. Integridad sede-área

Invariantes:

1. cada `area_id` pertenece a exactamente un `site_id`;
2. el `site_id` del nodo deberá coincidir con la sede propietaria real;
3. el área no podrá incorporarse si su sede es desconocida;
4. el área no podrá incorporarse como utilizable si la sede asignada es
   inactiva o no asignable;
5. un mismo nombre humano no identifica la misma área;
6. `area_kind` no podrá utilizarse como reemplazo de `area_id`;
7. una asignación de área no creará silenciosamente una asignación de sede;
8. la inconsistencia deberá fallar cerrado.

---

#### 17. Área primaria por sede

Reglas:

1. podrá existir como máximo un área primaria vigente por empleado y sede;
2. deberá pertenecer a `assigned_areas`;
3. no concede permisos;
4. no se convierte automáticamente en área administrativa activa;
5. no limita otras áreas asignadas dentro de la misma sede;
6. no sirve como fallback cuando el recurso o la cobertura no son
   resolubles.

---

#### 18. Lista vacía de áreas

```text
assigned_areas = []
```

significa exactamente:

```text
no se resolvieron asignaciones laborales de área representables
```

No significa:

- todas las áreas de las sedes asignadas;
- área general;
- área administrativa;
- área del último turno;
- cualquier área del mismo tipo;
- área seleccionada por el usuario.

---

#### 19. Orden determinista de `assigned_areas`

La serialización deberá:

1. eliminar duplicados exactos por `area_id`;
2. ordenar por `site_id`;
3. ubicar primero el área primaria de cada sede;
4. ordenar después por `area_kind`;
5. utilizar `area_id` como desempate.

Un duplicado contradictorio o un área asociada a dos sedes producirá
invalidez estructural.

---

#### 20. Definición de `administrative_coverage`

`administrative_coverage` es el territorio administrativo base resuelto para
el actor efectivo dentro del snapshot.

Es un insumo para evaluar el carril base.

No es:

- una lista de permisos;
- una concesión;
- una decisión final;
- una autorización para todas las acciones;
- el territorio operativo;
- la sede activa del turno;
- el territorio del recurso;
- una lista de pantallas visibles;
- un bypass por rol.

Fórmula conceptual:

```text
ROL BASE VÁLIDO
+
CLASE DE COBERTURA APROBADA
+
ASIGNACIONES LABORALES VÁLIDAS
+
RESTRICCIÓN EXPLÍCITA CUANDO EXISTA
=
ADMINISTRATIVE_COVERAGE
```

La autorización posterior será:

```text
PERMISO BASE APLICABLE
+
ALCANCE DEL GRANT
+
ADMINISTRATIVE_COVERAGE CUANDO EL ALCANCE LA REQUIERA
+
RECURSO REAL
+
AUSENCIA DE DENEGACIÓN APLICABLE
=
DECISIÓN DEL CARRIL BASE
```

La decisión del carril base corresponde a AUTH-CTX-019.

---

#### 21. Cobertura predeterminada de los roles base vigentes

La cobertura no se inferirá mediante comparaciones dispersas del nombre del
rol en aplicaciones, guards o SQL.

El resolver deberá consumir una clasificación canónica aprobada.

Para la versión contractual actual:

| Rol base                  | Clase funcional                  | Cobertura predeterminada |
| ------------------------- | -------------------------------- | ------------------------ |
| `propietario`             | Gobierno organizacional          | `ORGANIZATION`           |
| `gerente_general`         | Dirección ejecutiva global       | `ORGANIZATION`           |
| `gerente`                 | Administración de sede           | `ASSIGNED_SITES`         |
| `supervisor`              | Supervisión administrativa local | `ASSIGNED_SITES`         |
| `auxiliar_administrativa` | Apoyo administrativo funcional   | `ASSIGNED_SITES`         |
| `contador`                | Función financiera transversal   | `NONE`                   |
| `marketing`               | Función de marketing y contenido | `NONE`                   |

Aclaraciones obligatorias:

1. `ORGANIZATION` no concede todos los permisos;
2. `ASSIGNED_SITES` solo utiliza sedes asignadas y utilizables;
3. `NONE` no elimina permisos organizacionales o no territoriales que estén
   concedidos explícitamente en la matriz;
4. los alcances globales específicos de `contador`, `marketing` o
   `auxiliar_administrativa` pertenecen al permiso exacto y se evaluarán en
   AUTH-CTX-019;
5. ningún rol funcional se convierte por ello en administrador global;
6. los códigos legacy no participan en esta tabla;
7. AUTH-MOD-021 deberá definir la cobertura predeterminada del futuro rol base
   mínimo antes de publicar una nueva versión de roles base.

---

#### 22. Significado de los modos

##### 22.1 `NONE`

Representa ausencia de cobertura territorial administrativa base.

Deberá utilizarse cuando:

- no existe empleado laboral aplicable;
- el rol base es nulo, inactivo, legacy, desconocido o ambiguo;
- el empleado está inactivo;
- el rol funcional no posee cobertura territorial predeterminada;
- no existen asignaciones utilizables requeridas por la clase de cobertura;
- una restricción explícita válida produce un conjunto vacío;
- el actor es cliente, dispositivo o sistema sin identidad laboral
  administrativa.

Regla de forma:

```text
mode = NONE
site_ids = []
area_ids = []
```

`NONE` puede ser un resultado coherente con `valid = true`.

Cuando procede de una contradicción estructural, deberá usar
`valid = false`.

##### 22.2 `ORGANIZATION`

Representa cobertura territorial organizacional ordinaria.

Solo podrá producirse desde una clasificación canónica o autoridad
organizacional explícita.

No se producirá porque:

- el actor tiene muchas sedes;
- el rol tiene muchos permisos;
- el frontend seleccionó "Todas";
- no existen asignaciones;
- el usuario es propietario según una cadena no validada;
- una tabla legacy usa alcance `global`.

Regla de forma:

```text
mode = ORGANIZATION
site_ids = []
area_ids = []
```

Los arreglos quedan vacíos porque la organización no se representa como una
enumeración congelada de sedes.

`ORGANIZATION` excluye automáticamente:

- APP-REVIEW;
- demo;
- pruebas;
- territorios aislados;
- organizaciones o tenants futuros;
- recursos no pertenecientes a la organización ordinaria.

Su inclusión requerirá autoridad explícita evaluada en AUTH-CTX-018 y
AUTH-CTX-019.

##### 22.3 `ASSIGNED_SITES`

Representa todas las sedes utilizables presentes en `assigned_sites`.

Regla de forma:

```text
mode = ASSIGNED_SITES
site_ids = todos los site_id utilizables
area_ids = []
```

Una sola sede asignada continúa usando `ASSIGNED_SITES`.

La cardinalidad no transforma el origen semántico en `SPECIFIC_SITE`.

Si no existen sedes utilizables:

```text
mode = NONE
```

##### 22.4 `SPECIFIC_SITE`

Representa una restricción administrativa explícita a una sede exacta.

No se produce simplemente porque exista una sola sede asignada.

Requisitos:

- fuente explícita y autoritativa;
- exactamente un `site_id`;
- sede activa;
- sede asignable;
- compatibilidad con el rol base;
- justificación o política identificable;
- la restricción no puede ampliar la cobertura natural.

Regla de forma:

```text
mode = SPECIFIC_SITE
site_ids = [un site_id]
area_ids = []
```

##### 22.5 `ASSIGNED_AREAS`

Representa todas las áreas utilizables presentes en `assigned_areas`.

Solo se producirá cuando exista una política administrativa explícita que
limite el actor a sus áreas asignadas.

Regla de forma:

```text
mode = ASSIGNED_AREAS
site_ids = sedes propietarias únicas de las áreas
area_ids = todas las áreas utilizables
```

Si no existen áreas utilizables:

```text
mode = NONE
```

No se ampliará a todas las áreas de las sedes.

##### 22.6 `SPECIFIC_AREA`

Representa una restricción administrativa explícita a un área exacta.

Requisitos:

- fuente explícita y autoritativa;
- exactamente un `area_id`;
- exactamente su `site_id` propietario;
- área y sede activas;
- asignación compatible;
- la restricción no puede ampliar la cobertura natural.

Regla de forma:

```text
mode = SPECIFIC_AREA
site_ids = [site_id propietario]
area_ids = [un area_id]
```

---

#### 23. Valores canónicos de `source`

`source` deberá identificar la regla que produjo el resultado.

Valores documentales iniciales:

```text
NO_LABOR_IDENTITY
NO_ACTIVE_BASE_ROLE
BASE_ROLE_ORGANIZATION_COVERAGE
BASE_ROLE_ASSIGNED_SITES_COVERAGE
EXPLICIT_SPECIFIC_SITE_COVERAGE
EXPLICIT_ASSIGNED_AREAS_COVERAGE
EXPLICIT_SPECIFIC_AREA_COVERAGE
NO_TERRITORIAL_ADMINISTRATIVE_COVERAGE
INVALID_ADMINISTRATIVE_COVERAGE
```

No se utilizará como `source`:

- el nombre de una pantalla;
- una ruta;
- `selectedSite`;
- `selectedArea`;
- el código de un dispositivo;
- el turno;
- el último contexto;
- texto libre no versionado.

AUTH-CTX-025 deberá conservar estos valores en el contrato SQL futuro.

AUTH-CTX-030 deberá probarlos como parte del contrato.

---

#### 24. Significado de `valid`

`valid = true` significa:

- el modo es reconocido;
- la fuente es reconocida;
- los identificadores cumplen la forma del modo;
- las sedes y áreas son coherentes;
- no existen duplicados contradictorios;
- la fuente puede justificar el resultado;
- el resultado fue resuelto sin fallback permisivo.

No significa:

- que el empleado está autorizado;
- que el carril base está listo;
- que existe un permiso;
- que el recurso está dentro del alcance;
- que la decisión final será `ALLOW`.

`valid = false` significa que la cobertura no puede utilizarse para autorizar.

---

#### 25. Invariantes de forma por modo

| Modo             | `site_ids`        | `area_ids`        |
| ---------------- | ----------------- | ----------------- |
| `NONE`           | vacío             | vacío             |
| `ORGANIZATION`   | vacío             | vacío             |
| `ASSIGNED_SITES` | uno o más, únicos | vacío             |
| `SPECIFIC_SITE`  | exactamente uno   | vacío             |
| `ASSIGNED_AREAS` | uno o más, únicos | uno o más, únicos |
| `SPECIFIC_AREA`  | exactamente uno   | exactamente uno   |

Todo incumplimiento producirá:

```text
valid = false
```

Los códigos definitivos de problema estructural se congelarán en
AUTH-CTX-015.

---

#### 26. Precedencia de resolución

La cobertura se resolverá en este orden:

```text
1. validar identidad laboral y estado del empleado
2. validar base_role
3. resolver assigned_sites
4. resolver assigned_areas
5. validar coherencia sede-área
6. resolver restricción administrativa explícita aplicable
7. aplicar la cobertura predeterminada del rol
8. normalizar ids y orden
9. validar forma del modo
10. producir administrative_coverage
```

Reglas:

1. una restricción explícita puede reducir cobertura;
2. una restricción explícita no puede ampliar un rol local a
   `ORGANIZATION`;
3. una asignación adicional no modifica automáticamente la clase de
   cobertura del rol;
4. un grant global específico no modifica el modo general del contexto;
5. una denegación no se aplica dentro de `AccessContext`; se evaluará en
   `AuthorizationDecision`;
6. una contradicción no se resuelve usando la sede primaria.

---

#### 27. Roles organizacionales

Para `propietario` y `gerente_general` con rol base `ACTIVE`:

```text
administrative_coverage.mode = ORGANIZATION
```

Esto expresa cobertura territorial base, no acceso universal.

Continúan siendo obligatorios:

- permiso exacto;
- modalidad compatible;
- recurso válido;
- alcance del grant;
- ausencia de denegación aplicable;
- controles de sensibilidad;
- auditoría;
- exclusión de territorios aislados.

No existe bypass por nombre de rol.

---

#### 28. Roles administrativos por sede

Para `gerente` y `supervisor` con rol base `ACTIVE`:

```text
administrative_coverage.mode = ASSIGNED_SITES
```

La lista deberá contener exclusivamente sedes utilizables.

No se admite:

```text
gerente
→ ORGANIZATION
```

ni:

```text
supervisor
→ sede primaria únicamente
```

Una asignación multisede conserva todas las sedes utilizables.

---

#### 29. Auxiliar administrativa

Para `auxiliar_administrativa` con rol base `ACTIVE`:

```text
administrative_coverage.mode = ASSIGNED_SITES
```

cuando existan sedes utilizables.

Sin sedes utilizables:

```text
administrative_coverage.mode = NONE
```

Los permisos que la matriz define como:

- no territoriales;
- organizacionales de referencia;
- globales funcionales específicos;

se evaluarán por su alcance exacto en AUTH-CTX-019 y no convertirán al rol en
administrador global.

---

#### 30. Contador y marketing

Para `contador` y `marketing`:

```text
administrative_coverage.mode = NONE
```

salvo que exista una restricción territorial explícita válida.

Sus permisos transversales u organizacionales dependen de grants concretos,
no de una cobertura territorial general.

Por tanto:

```text
contador + permiso financiero global explícito
```

puede evaluar un recurso financiero organizacional en AUTH-CTX-019 sin
clasificar al contador como administrador global.

La misma regla aplica a capacidades concretas de marketing y contenido.

---

#### 31. Empleado inactivo

Cuando la identidad laboral es conocida pero el empleado está inactivo:

- `assigned_sites` y `assigned_areas` podrán conservar hechos representables
  para trazabilidad;
- ninguna asignación se utilizará para autoridad;
- `administrative_coverage.mode = NONE`;
- `site_ids = []`;
- `area_ids = []`;
- el carril base permanecerá no disponible;
- el carril operativo se resolverá de forma independiente según las reglas
  posteriores, sin convertir la inactividad en permiso.

AUTH-CTX-015 definirá el código estructural exacto.

---

#### 32. Rol base inválido o legacy

Cuando `base_role` sea:

- `null`;
- `INACTIVE`;
- `INVALID`;
- legacy;
- desconocido;
- ambiguo;

la cobertura será:

```text
mode = NONE
site_ids = []
area_ids = []
```

Las asignaciones podrán conservarse como hechos, pero no habilitarán el
carril base.

Un rol operativo válido no modifica esta cobertura.

La compatibilidad temporal queda asignada a AUTH-CTX-028.

---

#### 33. Actores no laborales

Para clientes, dispositivos o sistemas sin identidad laboral administrativa:

```text
assigned_sites = []
assigned_areas = []
administrative_coverage = {
  mode: "NONE",
  site_ids: [],
  area_ids: [],
  source: "NO_LABOR_IDENTITY",
  valid: true
}
```

No se inventará un empleado ni un rol base.

Los contratos específicos de actores de sistema continúan separados.

---

#### 34. Independencia frente al carril operativo

La cobertura administrativa:

- no depende de turno;
- no depende de check-in;
- no desaparece con check-out;
- no cambia por el rol operativo;
- no toma la sede operativa como fallback;
- no toma el área operativa como fallback;
- no se amplía por un dispositivo compartido.

El territorio operativo se definirá en AUTH-CTX-013.

Ejemplo híbrido:

```text
gerente
administrative_coverage = ASSIGNED_SITES [VENTO_CAFE, SAUDO]

turno vigente
operational_site = CENTRO_PRODUCCION
operational_area = BODEGA
```

Los dos territorios permanecen separados.

---

#### 35. Selección administrativa y navegación

Una aplicación podrá permitir que el usuario seleccione una sede o área para
filtrar la interfaz.

La selección deberá cumplir:

```text
selección solicitada
∩
administrative_coverage válida
=
vista administrativa posible
```

La selección:

- no modifica `assigned_sites`;
- no modifica `assigned_areas`;
- no modifica `administrative_coverage`;
- no concede permisos;
- no se persiste como autoridad;
- no altera el recurso real;
- no convierte `NONE` en cobertura válida.

AUTH-CTX-027 deberá exigir este consumo centralizado.

---

#### 36. Relación con el alcance de los permisos

`administrative_coverage` no sustituye los alcances aprobados en
AUTH-MOD-013 a AUTH-MOD-017.

Ejemplos:

```text
grant = ASSIGNED_SITES
→ usa administrative_coverage y assigned_sites
```

```text
grant = ASSIGNED_AREAS
→ usa assigned_areas y la coherencia de sedes
```

```text
grant = SPECIFIC_SITE
→ exige coincidencia exacta con el recurso
```

```text
grant = ORGANIZATION
→ depende del permiso exacto y no requiere convertir el modo del actor
  funcional en ORGANIZATION
```

```text
grant = NON_TERRITORIAL
→ no inventa sede ni área
```

La composición definitiva corresponde a AUTH-CTX-019.

---

#### 37. Relación con el recurso real

AUTH-CTX-009 no decide si un recurso concreto está dentro del alcance.

AUTH-CTX-018 deberá resolver:

- `resource_site_id`;
- `resource_area_id`;
- territorios de origen;
- territorios de destino;
- recursos organizacionales no territoriales;
- operaciones multiterritoriales.

AUTH-CTX-019 deberá comparar esos territorios contra:

- el grant aplicable;
- `administrative_coverage`;
- `assigned_sites`;
- `assigned_areas`;
- denegaciones aplicables.

---

#### 38. Operaciones multiterritoriales

La presencia de varias sedes o áreas en `administrative_coverage` no implica
que toda operación multiterritorial sea autorizable.

Ejemplo:

```text
remisión
origen = Centro de Producción
destino = Vento Café
```

AUTH-CTX-018 deberá resolver ambos territorios.

AUTH-CTX-019 deberá exigir cobertura suficiente para cada territorio
obligatorio según el contrato del permiso.

No se autorizará una operación completa porque solo uno de sus territorios
coincida.

---

#### 39. APP-REVIEW y territorios aislados

APP-REVIEW, demo, pruebas y territorios aislados no se incorporan mediante:

- `ORGANIZATION`;
- tipo de sede;
- asignación multisede;
- rol global;
- sede primaria;
- nombre del rol.

Su tratamiento deberá ser explícito en la resolución del recurso y la
decisión del carril base mediante AUTH-CTX-018 y AUTH-CTX-019.

---

#### 40. Obsolescencia del snapshot

Un `AccessContext` queda potencialmente obsoleto cuando cambia:

- una asignación de sede;
- una asignación de área;
- la sede primaria;
- el área primaria;
- el estado de una sede;
- el estado de un área;
- la condición `assignable`;
- el estado del empleado;
- el rol base;
- la clasificación canónica de cobertura;
- una restricción administrativa explícita.

AUTH-CTX-029 definirá invalidación, caché y fingerprint.

---

#### 41. Casos de ejemplo

##### Caso A — Gerente multisede

```text
base_role = gerente
assigned_sites = [VENTO_CAFE, SAUDO]
assigned_areas = []
```

Resultado:

```text
mode = ASSIGNED_SITES
site_ids = [SAUDO, VENTO_CAFE]
area_ids = []
source = BASE_ROLE_ASSIGNED_SITES_COVERAGE
valid = true
```

No equivale a organización.

##### Caso B — Supervisor con una sede primaria

```text
assigned_sites = [VENTO_CAFE primary]
```

Resultado:

```text
mode = ASSIGNED_SITES
site_ids = [VENTO_CAFE]
```

No cambia a `SPECIFIC_SITE`, porque la fuente continúa siendo el conjunto de
sedes asignadas.

##### Caso C — Propietario

```text
base_role = propietario ACTIVE
```

Resultado:

```text
mode = ORGANIZATION
site_ids = []
area_ids = []
source = BASE_ROLE_ORGANIZATION_COVERAGE
valid = true
```

No concede todos los permisos.

##### Caso D — Auxiliar administrativa con dos sedes

```text
base_role = auxiliar_administrativa
assigned_sites = [VENTO_GROUP, CENTRO_PRODUCCION]
```

Resultado:

```text
mode = ASSIGNED_SITES
site_ids = [CENTRO_PRODUCCION, VENTO_GROUP]
```

Un permiso global funcional concreto podrá evaluarse posteriormente sin
convertir el rol en administrador global.

##### Caso E — Contador

```text
base_role = contador
assigned_sites = [VENTO_GROUP]
```

Resultado base:

```text
mode = NONE
site_ids = []
area_ids = []
source = NO_TERRITORIAL_ADMINISTRATIVE_COVERAGE
valid = true
```

Un permiso financiero global explícito se evaluará por su grant en
AUTH-CTX-019.

##### Caso F — Restricción específica de área

```text
restricción explícita = Repostería / Centro de Producción
```

Resultado:

```text
mode = SPECIFIC_AREA
site_ids = [CENTRO_PRODUCCION]
area_ids = [REPOSTERIA]
source = EXPLICIT_SPECIFIC_AREA_COVERAGE
valid = true
```

##### Caso G — Área incompatible

```text
area_id = CAJA_VENTO_CAFE
site_id declarado = SAUDO
```

Resultado:

```text
valid = false
```

No se corrige por nombre, tipo de área ni sede primaria.

##### Caso H — Rol base legacy

```text
base_role.role_status = INVALID
assigned_sites = [CENTRO_PRODUCCION]
```

Resultado:

```text
mode = NONE
site_ids = []
area_ids = []
valid = true
```

El carril base queda bloqueado por el rol inválido; la compatibilidad se
tratará en AUTH-CTX-028.

---

#### 42. Inconsistencias estructurales detectables

AUTH-CTX-009 identifica las siguientes clases de inconsistencia:

1. más de una sede primaria vigente;
2. más de un área primaria vigente por sede;
3. asignación duplicada con estados contradictorios;
4. área asociada a una sede incorrecta;
5. área utilizable cuya sede no es utilizable;
6. `site_id` desconocido;
7. `area_id` desconocido;
8. `area_kind` incompatible con el área;
9. modo desconocido;
10. fuente desconocida;
11. identificadores incompatibles con el modo;
12. `ORGANIZATION` sin fuente organizacional válida;
13. `SPECIFIC_SITE` sin fuente explícita;
14. `SPECIFIC_AREA` sin fuente explícita;
15. cobertura ampliada por una selección del cliente;
16. cobertura derivada de un rol legacy;
17. fallback a `employees.site_id`;
18. fallback a la sede o área del turno;
19. cobertura no determinista.

AUTH-CTX-015 deberá asignar códigos, severidades y efecto exacto a estas
clases.

Hasta entonces, ninguna inconsistencia podrá producir autoridad.

---

#### 43. Fail closed

Ante contradicción o ambigüedad:

```text
administrative_coverage.valid = false
```

y la cobertura no podrá utilizarse para autorizar.

Queda prohibido:

- elegir arbitrariamente una sede;
- elegir la sede primaria;
- usar la primera fila;
- usar la sede seleccionada;
- eliminar filas contradictorias;
- convertir una lista vacía en organización;
- tratar un valor desconocido como `NONE` válido sin conservar la
  inconsistencia;
- ampliar el modo para evitar un bloqueo.

---

#### 44. Minimización de datos

`assigned_sites` y `assigned_areas` no deberán incluir:

- nombres completos innecesarios;
- direcciones;
- geocercas;
- coordenadas;
- datos de contacto;
- responsables;
- horarios;
- permisos;
- información financiera;
- perfiles operativos;
- metadatos de navegación.

El contexto conservará únicamente los campos contractuales publicados.

---

#### 45. Relación con tareas posteriores

##### AUTH-CTX-010

Definirá el turno publicado y vigente.

No modificará la cobertura administrativa.

##### AUTH-CTX-011

Definirá el check-in activo.

No concederá cobertura administrativa.

##### AUTH-CTX-012

Definirá el rol operativo efectivo.

No reemplazará el rol base ni su cobertura.

##### AUTH-CTX-013

Definirá sede y área operativas como territorio separado.

##### AUTH-CTX-014

Definirá el dispositivo compartido sin convertir sede o área del dispositivo
en cobertura laboral.

##### AUTH-CTX-015

Congelará códigos y severidades de las inconsistencias enumeradas en la
sección 42.

##### AUTH-CTX-018

Resolverá el territorio real del recurso.

##### AUTH-CTX-019

Evaluará el carril base combinando grants, cobertura, recurso y denegaciones.

##### AUTH-CTX-025

Diseñará el contrato SQL de `get_access_context` para producir los tres nodos
sin confiar en datos del cliente.

##### AUTH-CTX-026

Diseñará el evaluador que consumirá la cobertura sin convertirla en permiso.

##### AUTH-CTX-027

Definirá el consumo centralizado por aplicaciones y selectores.

##### AUTH-CTX-028

Definirá compatibilidad con `employees.site_id`, fuentes legacy y consumidores
antiguos.

##### AUTH-CTX-029

Definirá invalidación y caché ante cambios territoriales.

##### AUTH-CTX-030

Definirá pruebas contractuales, determinismo y casos negativos.

##### AUTH-MOD-021

Definirá la cobertura predeterminada del rol base mínimo antes de
AUTH-CTX-028, de publicar una nueva versión de roles base o de transformar
oficios legacy.

No bloquea AUTH-CTX-010.

---

#### 46. Fuera del alcance

AUTH-CTX-009 no:

- crea sedes;
- crea áreas;
- asigna empleados a sedes;
- asigna empleados a áreas;
- corrige asignaciones actuales;
- redefine roles base;
- crea el rol mínimo;
- modifica matrices;
- modifica grants;
- define denegaciones concretas;
- resuelve permisos;
- resuelve recursos;
- decide el carril base;
- define turno;
- define check-in;
- define rol operativo;
- define sede o área operativa;
- define dispositivos;
- crea tablas;
- crea funciones;
- crea RPC;
- crea RLS;
- crea migraciones;
- implementa caché;
- modifica Supabase;
- modifica aplicaciones.

Las responsabilidades posteriores están asignadas de forma explícita en la
sección 45.

---

#### 47. Riesgos controlados

##### Riesgo 1 — Multisede interpretada como global

Control:

```text
ASSIGNED_SITES siempre enumera ids
```

##### Riesgo 2 — Sede primaria usada como autorización

Control:

```text
is_primary es referencia, no permiso
```

##### Riesgo 3 — Área inferida por nombre o tipo

Control:

```text
area_id exacto + site_id propietario
```

##### Riesgo 4 — Rol funcional convertido en administrador global

Control:

```text
cobertura territorial predeterminada
≠
alcance global de un permiso exacto
```

##### Riesgo 5 — Selector visual amplía autoridad

Control:

```text
selección ∩ cobertura
```

##### Riesgo 6 — Turno contamina carril base

Control:

```text
administrative_coverage
≠
operational_site / operational_area
```

##### Riesgo 7 — Lista vacía permisiva

Control:

```text
[] = ninguna asignación
```

##### Riesgo 8 — Inconsistencia corregida silenciosamente

Control:

```text
valid = false
+ fail closed
```

---

#### 48. Criterios de aprobación

AUTH-CTX-009 podrá aprobarse cuando se acepte que:

1. `assigned_sites`, `assigned_areas` y `administrative_coverage` conservan
   la forma de `AccessContext@1.0.0`;
2. la tarea es una aclaración normativa compatible;
3. los nodos se resuelven exclusivamente en servidor;
4. la sede seleccionada no es fuente de autoridad;
5. el área seleccionada no es fuente de autoridad;
6. `employees.site_id` no es fuente canónica definitiva;
7. su compatibilidad queda en AUTH-CTX-028;
8. una asignación de sede no concede permisos;
9. una asignación de área no concede permisos;
10. una lista vacía no significa organización;
11. multisede no significa global;
12. una sede primaria no limita todas las asignaciones;
13. una sede primaria no sirve como fallback;
14. cada área pertenece a una sede exacta;
15. `area_id` y `area_kind` permanecen separados;
16. un área incompatible falla cerrado;
17. las listas tienen orden determinista;
18. duplicados contradictorios no se eliminan silenciosamente;
19. `administrative_coverage` es un insumo, no una decisión;
20. `ORGANIZATION` no concede todos los permisos;
21. `propietario` y `gerente_general` usan cobertura organizacional sin
    bypass;
22. `gerente` y `supervisor` usan sedes asignadas;
23. `auxiliar_administrativa` usa sedes asignadas como cobertura territorial
    predeterminada;
24. `contador` y `marketing` no reciben cobertura territorial general por el
    nombre del rol;
25. sus permisos globales específicos se evalúan por grant;
26. `NONE` puede ser un resultado válido;
27. una inconsistencia produce `valid = false`;
28. los modos tienen formas estrictas de ids;
29. `SPECIFIC_SITE` exige fuente explícita;
30. `SPECIFIC_AREA` exige fuente explícita;
31. una sola sede asignada continúa siendo `ASSIGNED_SITES`;
32. una sola área explícita puede ser `SPECIFIC_AREA` únicamente por su
    fuente;
33. la cobertura administrativa no depende del turno;
34. la cobertura administrativa no depende del check-in;
35. la cobertura administrativa no cambia con check-out;
36. el rol operativo no amplía la cobertura administrativa;
37. el dispositivo no amplía cobertura;
38. el empleado inactivo conserva atribución, no autoridad;
39. un rol base legacy produce cobertura `NONE`;
40. actores no laborales no reciben cobertura laboral;
41. APP-REVIEW y territorios aislados no se incorporan automáticamente;
42. AUTH-CTX-015 definirá códigos estructurales;
43. AUTH-CTX-018 resolverá el territorio real;
44. AUTH-CTX-019 resolverá la decisión del carril base;
45. AUTH-CTX-025 diseñará el productor SQL;
46. AUTH-CTX-027 controlará el consumo por aplicaciones;
47. AUTH-CTX-029 definirá invalidación;
48. AUTH-CTX-030 definirá pruebas contractuales;
49. AUTH-MOD-021 no bloquea AUTH-CTX-010;
50. no se implementa código, migraciones ni cambios en Supabase.

---

#### 49. Estado final de la propuesta

| Tarea        | Estado      | Relación                   |
| ------------ | ----------- | -------------------------- |
| AUTH-CTX-008 | APROBADA    | Tarea anterior             |
| AUTH-CTX-009 | APROBADA    | Tarea actual               |
| AUTH-CTX-010 | NO INICIADA | Tarea siguiente reservada  |
| AUTH-MOD-021 | NO INICIADA | Tarea diferida relacionada |

La continuidad propuesta permanece:

```text
AUTH-CTX-008 — APROBADA
        ↓
AUTH-CTX-009 — APROBADA
        ↓
AUTH-CTX-010 — NO INICIADA
```

No se avanza a AUTH-CTX-010 hasta recibir aprobación explícita de
AUTH-CTX-009.


