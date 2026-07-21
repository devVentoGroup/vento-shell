## CONTEXTO LABORAL Y DISPOSITIVO

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

### ✅ AUTH-CTX-010 — Incluir turno publicado y vigente

**Estado:** APROBADA  
**Bloque:** BLOQUE E — Contexto y decisión de autorización unificados  
**Naturaleza:** Refinamiento documental del nodo `active_shift` dentro de `AccessContext`  
**Implementación física:** No incluida  
**Tarea anterior vigente:** AUTH-CTX-009 — APROBADA  
**Tarea posterior reservada:** AUTH-CTX-011 — Incluir sesión de check-in activa  
**Contrato afectado:** `AccessContext@1.0.0`  
**Nodo afectado:** `active_shift`  
**Cambio contractual:** Aclaración normativa compatible; no cambia la forma publicada  
**Cambios físicos permitidos:** No

Esta tarea define de forma exhaustiva cómo `AccessContext` identifica un turno
publicado y vigente para el empleado que actúa en el contexto, sin confundir:

- existencia de un turno;
- publicación;
- revisión publicada;
- vigencia temporal;
- confirmación del trabajador;
- check-in;
- ejecución;
- resultado del turno;
- rol operativo;
- sede y área operativas;
- permiso;
- autorización final.

No modifica la estructura raíz de `AccessContext`, no agrega campos, no cambia
`contract_version`, no cambia `schema_version`, no implementa SQL, RPC, RLS,
migraciones, triggers, jobs, aplicaciones ni cambios físicos en Supabase.

---

#### 1. Objetivo

Definir el nodo `active_shift` de manera que Vento OS pueda responder
inequívocamente:

1. si existe un turno laboral publicado para el actor efectivo;
2. cuál revisión publicada es autoritativa;
3. si el turno está vigente exactamente en `resolved_at`;
4. cómo se construyen `starts_at` y `ends_at`;
5. cómo se resuelven turnos que cruzan medianoche;
6. qué estados excluyen un turno;
7. qué ocurre con borradores y cambios aún no publicados;
8. qué ocurre cuando existen varios turnos elegibles;
9. qué campos mínimos debe contener el turno;
10. qué validaciones pertenecen a esta tarea;
11. qué validaciones se completarán en AUTH-CTX-011 a AUTH-CTX-013;
12. cuándo `active_shift` debe ser `null`;
13. cuándo la ausencia de turno es normal;
14. cuándo existe una inconsistencia estructural;
15. cómo impedir fallbacks permisivos;
16. cómo mantener independiente el carril base;
17. cómo preservar determinismo, trazabilidad y fail closed.

---

#### 2. Base normativa

AUTH-CTX-010 conserva sin cambios las decisiones aprobadas en:

- ADR-AUTH-001;
- AUTH-MOD-001 — Identidad laboral y actor efectivo;
- AUTH-MOD-002 — Separar rol base de rol operativo;
- AUTH-MOD-007 — Definir sede asignada y sede activa;
- AUTH-MOD-008 — Definir área asignada y área activa;
- AUTH-MOD-009 — Definir turno publicado;
- AUTH-MOD-010 — Definir check-in activo;
- AUTH-MOD-018 — Precedencia entre carriles;
- AUTH-MOD-019 — Denegación explícita;
- AUTH-CAT-012 — Prerrequisitos de turno y check-in;
- AUTH-CAT-013 — Prerrequisitos de área activa;
- AUTH-CTX-001 — Diseñar `AccessContext`;
- AUTH-CTX-004 — Versionar contratos;
- AUTH-CTX-005 a AUTH-CTX-009 — Identidad, actor, empleado, rol base y
  cobertura administrativa.

Principios heredados obligatorios:

```text
TURNO PUBLICADO
≠
TURNO VIGENTE
```

```text
TURNO VIGENTE
≠
CHECK-IN ACTIVO
```

```text
TURNO
≠
PERMISO
```

```text
TURNO
≠
AUTORIZACIÓN FINAL
```

```text
CONFIRMACIÓN DEL TRABAJADOR
≠
PRERREQUISITO DE AUTORIZACIÓN
```

```text
CARRIL BASE
≠
CARRIL OPERATIVO
```

---

#### 3. Separación conceptual obligatoria

| Concepto                     | Pregunta que responde                                           |          Concede autoridad |
| ---------------------------- | --------------------------------------------------------------- | -------------------------: |
| Turno borrador               | ¿Existe una planificación todavía no publicada?                 |                         No |
| Turno publicado              | ¿La asignación fue comunicada oficialmente?                     |                         No |
| Revisión publicada           | ¿Qué versión del turno es autoritativa?                         |                         No |
| Turno vigente                | ¿El instante `resolved_at` cae dentro de su ventana autorizada? |                         No |
| Turno elegible para check-in | ¿Está dentro de la ventana permitida para marcar?               |                         No |
| Check-in activo              | ¿Existe evidencia vigente de presencia?                         |                         No |
| Rol operativo                | ¿Qué función temporal asigna el turno?                          |             No por sí solo |
| Permiso operativo            | ¿Qué capacidad concreta puede evaluar el carril?                | Solo dentro de la decisión |
| Resultado del turno          | ¿Terminó, fue cancelado o fue no-show?                          |                         No |
| `active_shift`               | Snapshot contractual del turno publicado y vigente              |                         No |

---

#### 4. Forma contractual conservada

AUTH-CTX-010 conserva exactamente la forma conceptual publicada:

```ts
type ActiveShiftContext = {
  shift_id: string;
  employee_id: string;
  site_id: string;
  area_id: string | null;
  operational_role_code: string;
  starts_at: string;
  ends_at: string;
  shift_status: string;
  published: boolean;
  currently_valid: boolean;
};
```

No se agregan propiedades.

La publicación permanece:

```text
AccessContext
contract_version = 1.0.0
schema_version   = 1.0.0
```

---

#### 5. Semántica raíz de `active_shift`

`active_shift` representa exactamente un turno que cumple todas las
condiciones contractuales mínimas de esta tarea.

Regla:

```text
active_shift != null
→ published = true
→ currently_valid = true
```

No se admitirá un nodo no nulo con:

```text
published = false
```

o:

```text
currently_valid = false
```

Los dos booleanos se conservan como evidencia contractual explícita de la
resolución, no como estados parciales permisivos.

Cuando no existe un turno elegible:

```text
active_shift = null
```

---

#### 6. Resolución exclusiva en servidor

El turno deberá resolverse en servidor utilizando el actor efectivo y
`resolved_at`.

No podrá aceptarse como fuente autoritativa:

- `shift_id` enviado por el frontend;
- turno seleccionado visualmente;
- turno almacenado en local storage;
- turno recordado en una cookie no firmada;
- turno incluido en query string;
- turno enviado dentro del body de una mutación;
- último turno consultado;
- último turno trabajado;
- turno del dispositivo;
- turno de otro empleado;
- perfil operativo predeterminado;
- rol base;
- `navigation_role`;
- sede seleccionada;
- check-in aislado;
- turno simulado presentado como real.

Una referencia enviada por el cliente podrá utilizarse únicamente como dato
a validar contra la resolución autoritativa; nunca como autoridad.

---

#### 7. Actor laboral requerido

`active_shift` solo podrá resolverse cuando:

1. `actor_effective.actor_type = EMPLOYEE`;
2. `employee` existe;
3. `employee.employee_id` coincide con el actor efectivo;
4. el empleado está activo;
5. la identidad laboral es válida y no ambigua.

Para actores:

- `CUSTOMER`;
- `DEVICE` sin sesión de actor;
- `SYSTEM` autónomo;
- `UNRESOLVED`;

el resultado será:

```text
active_shift = null
```

En un dispositivo compartido, el turno pertenece al empleado de la sesión de
actor, no al usuario técnico del dispositivo.

---

#### 8. Fuente conceptual

La fuente normativa será el agregado canónico equivalente a:

```text
empleado efectivo
→ ocurrencia de turno
→ revisión publicada vigente
→ sede
→ área opcional
→ rol operativo asignado
```

La implementación física futura se diseñará en AUTH-CTX-025.

La compatibilidad con la estructura legacy de `employee_shifts` y
`get_operational_context` se diseñará en AUTH-CTX-028.

---

#### 9. Turno borrador

Un turno borrador es una planificación no publicada.

Puede:

- existir en base de datos;
- aparecer en herramientas administrativas autorizadas;
- contener fecha, horas, sede, área y rol;
- reemplazar potencialmente una revisión anterior cuando se publique.

No puede:

- producir `active_shift`;
- habilitar check-in;
- habilitar permisos operativos;
- reemplazar una revisión publicada;
- afectar el contexto del trabajador antes de publicarse.

Regla:

```text
solo existe borrador
→ active_shift = null
```

La existencia de un borrador futuro no constituye por sí sola una
inconsistencia estructural.

---

#### 10. Turno publicado

Un turno publicado es una asignación laboral comunicada oficialmente mediante
una revisión autoritativa.

La publicación deberá ser verificable mediante una fuente canónica
equivalente a:

- identificador de revisión;
- instante de publicación;
- actor que publicó;
- vínculo inequívoco con la ocurrencia de turno;
- estado vigente de la revisión;
- ausencia de retiro o supersesión efectiva.

`published_at` observado aisladamente no bastará cuando el modelo físico
futuro soporte revisiones explícitas.

Hasta implementar ese modelo, AUTH-CTX-028 deberá definir la adaptación
segura de datos legacy.

---

#### 11. Revisión publicada autoritativa

Para una ocurrencia lógica de turno deberá existir como máximo una revisión
publicada autoritativa en `resolved_at`.

Reglas:

1. un cambio posterior guardado como borrador no modifica el turno publicado;
2. una nueva revisión solo reemplaza la anterior cuando queda publicada;
3. no se mezclarán campos de dos revisiones;
4. la revisión anterior continúa autoritativa hasta la publicación efectiva
   de la nueva;
5. una cancelación o retiro deberá ser un hecho publicado o autoritativo;
6. dos revisiones publicadas simultáneamente sin precedencia inequívoca
   producen ambigüedad estructural;
7. una revisión retirada no podrá producir `active_shift`;
8. una revisión futura todavía no efectiva no reemplaza la vigente.

Queda prohibido construir un turno híbrido como:

```text
horario de revisión A
+
sede de revisión B
+
rol de revisión C
```

---

#### 12. Turno laboral

Solo un turno clasificado como laboral podrá producir `active_shift`.

No lo producen:

- descanso;
- día libre;
- ausencia;
- vacaciones;
- incapacidad;
- permiso laboral;
- bloqueo de agenda;
- evento informativo;
- plantilla de horario;
- turno borrador;
- turno de capacitación no operativo, salvo clasificación expresa futura.

La clasificación exacta deberá proceder de fuente autoritativa.

Un valor desconocido o ambiguo no se tratará como laboral.

---

#### 13. Ventana temporal autoritativa

La vigencia se evaluará contra un único timestamp de servidor:

```text
resolved_at
```

La ventana se modela como intervalo semiabierto:

```text
starts_at <= resolved_at < ends_at
```

Consecuencias:

1. el turno es vigente exactamente desde `starts_at`;
2. deja de ser vigente exactamente en `ends_at`;
3. dos turnos consecutivos pueden tocarse en el límite sin solaparse;
4. no existe doble vigencia en el instante exacto de cambio;
5. no se utilizan segundos o minutos de gracia implícitos;
6. cualquier tolerancia deberá definirse como política explícita y versionada;
7. la ventana para check-in puede ser diferente y corresponde a
   AUTH-CTX-011.

---

#### 14. Construcción de `starts_at` y `ends_at`

`starts_at` y `ends_at` deberán ser timestamps absolutos serializados en
formato ISO 8601.

Su construcción utilizará:

- fecha laboral de inicio;
- hora local de inicio;
- hora local de fin;
- zona horaria autoritativa de la sede o de la organización;
- reglas explícitas para cruce de medianoche.

Para la operación actual de Vento Group, la zona organizacional aplicable es:

```text
America/Bogota
```

Una futura operación multizona deberá introducir una fuente de zona horaria
por sede antes de alterar esta semántica.

No se compararán horas locales aisladas sin construir el intervalo absoluto.

---

#### 15. Turnos que cruzan medianoche

Cuando la hora de fin sea menor o igual que la hora de inicio y la
clasificación permita turno nocturno:

```text
ends_at
=
día calendario siguiente a starts_at
+
hora local de fin
```

Ejemplo:

```text
shift_date = 2026-07-21
start_time = 22:00
end_time   = 06:00
```

produce:

```text
starts_at = 2026-07-21T22:00:00-05:00
ends_at   = 2026-07-22T06:00:00-05:00
```

A las 02:00 del 22 de julio el turno continúa vigente.

Queda prohibido filtrar exclusivamente:

```text
shift_date = fecha de resolved_at
```

porque excluiría turnos iniciados el día anterior.

---

#### 16. Duración inválida

Producen inconsistencia estructural:

- fecha de inicio ausente;
- hora de inicio ausente;
- hora de fin ausente;
- intervalo imposible;
- duración cero no autorizada;
- duración negativa;
- cruce de medianoche no resoluble;
- duración superior al máximo operativo aprobado cuando exista esa política;
- timestamp no serializable;
- zona horaria desconocida.

AUTH-CTX-015 definirá los códigos definitivos.

Ante estas condiciones:

```text
active_shift = null
```

---

#### 17. Estado del turno

`shift_status` conserva el estado normalizado observado del turno.

El estado no reemplaza:

- publicación;
- revisión;
- vigencia temporal;
- check-in;
- resultado calculado;
- autorización.

Para producir `active_shift`, el estado deberá ser compatible con una
jornada todavía operable.

Estados terminales o excluyentes como:

- `cancelled`;
- `no_show`;
- `completed`;
- `withdrawn`;
- `deleted`;
- equivalentes canónicos futuros;

no podrán producir `active_shift`.

La confirmación del trabajador:

```text
confirmed
```

no es obligatoria para autorizar el carril operativo.

Un estado desconocido o contradictorio fallará cerrado.

---

#### 18. Cancelación y retiro

Un turno cancelado o retirado:

```text
active_shift = null
```

aunque:

- su intervalo contenga `resolved_at`;
- exista check-in residual;
- el frontend lo conserve en memoria;
- el dispositivo lo haya cargado previamente;
- el empleado lo haya confirmado;
- exista una sesión anterior.

La cancelación o retiro deberá invalidar el contexto en AUTH-CTX-029.

AUTH-CTX-011 deberá definir el efecto sobre un check-in existente.

---

#### 19. Finalización temporal

Cuando:

```text
resolved_at >= ends_at
```

el turno deja de ser vigente automáticamente.

No requiere:

- cambio manual de `status`;
- check-out;
- job previo;
- actualización del registro;
- confirmación de cierre.

El estado físico puede continuar como `scheduled`, pero el contexto no podrá
tratarlo como turno vigente.

La reconciliación del resultado histórico pertenece a los roadmaps
funcionales de asistencia y no modifica esta regla contractual.

---

#### 20. Turnos futuros

Un turno publicado futuro no produce `active_shift` antes de `starts_at`.

Resultado:

```text
active_shift = null
```

Esto no constituye inconsistencia.

El turno podrá mostrarse en calendarios autorizados, pero no habilitará el
carril operativo.

---

#### 21. Campos obligatorios del candidato

Antes de producir `active_shift`, el candidato deberá contener de forma
resoluble:

- `shift_id`;
- `employee_id`;
- `site_id`;
- `operational_role_code`;
- fecha y hora de inicio;
- fecha y hora de fin;
- estado normalizado;
- evidencia de publicación;
- revisión autoritativa.

`area_id` es opcional en esta tarea.

Su obligatoriedad funcional dependerá del rol y del permiso, y será cerrada
por AUTH-CTX-012, AUTH-CTX-013 y AUTH-CAT-013.

---

#### 22. Pertenencia al actor efectivo

El turno deberá cumplir:

```text
shift.employee_id
=
employee.employee_id
=
actor_effective.actor_id
```

cuando el actor efectivo sea empleado.

Un turno de otro trabajador:

- no se selecciona;
- no se usa como fallback;
- no se devuelve parcialmente;
- produce inconsistencia si fue presentado como candidato autoritativo;
- no puede activarse mediante dispositivo compartido;
- no puede activarse mediante simulación real.

---

#### 23. Sede mínima válida

Para que exista `active_shift`, `site_id` deberá:

- existir;
- identificar una sede organizacional resoluble;
- estar activa;
- ser operable;
- no representar una entidad incompatible como punto técnico oculto,
  plantilla, demo aislada o ubicación no laboral, salvo contrato explícito.

AUTH-CTX-013 definirá el nodo `operational_site` y la relación completa con:

- asignaciones laborales;
- sede del turno;
- sede del check-in;
- sede del dispositivo;
- sede del recurso.

AUTH-CTX-010 no convierte la sede del turno en cobertura administrativa.

---

#### 24. Área opcional y coherencia mínima

`area_id` podrá ser `null`.

Cuando exista, deberá:

- identificar un área real;
- pertenecer exactamente a `site_id`;
- estar activa;
- no ser ambigua.

Un área de otra sede produce inconsistencia estructural y:

```text
active_shift = null
```

La decisión sobre si el rol exige área activa corresponde a:

- AUTH-CAT-013;
- AUTH-CTX-012;
- AUTH-CTX-013;
- AUTH-CTX-020.

---

#### 25. Rol operativo mínimo

`operational_role_code` deberá:

- existir en el catálogo operativo canónico;
- estar activo;
- no ser un rol base usado como fallback;
- no provenir de `navigation_role`;
- no provenir del perfil predeterminado cuando el turno carece de rol;
- estar vinculado a la revisión publicada.

AUTH-CTX-012 definirá el nodo completo `operational_role`.

La habilitación exacta por sede y área deberá ser coherente con el turno antes
de que el carril operativo quede listo.

Un código ausente, legacy, desconocido o ambiguo impide producir
`active_shift`.

---

#### 26. Turnos simultáneos y solapados

Después de aplicar todas las condiciones mínimas, deberá existir como máximo
un candidato vigente.

Casos:

```text
0 candidatos
→ active_shift = null
```

```text
1 candidato
→ producir active_shift
```

```text
2 o más candidatos
→ active_shift = null
→ inconsistencia estructural
```

Queda prohibido seleccionar:

- el primero;
- el último;
- el de inicio más temprano;
- el de inicio más reciente;
- el de la sede seleccionada;
- el que coincide con un check-in;
- el que tiene rol más específico;
- el confirmado;
- el creado más recientemente;

sin una regla canónica explícita aprobada.

La superposición deberá corregirse en la fuente de turnos.

---

#### 27. Turnos consecutivos

Dos turnos son consecutivos y no ambiguos cuando:

```text
turno A.ends_at = turno B.starts_at
```

Debido al intervalo semiabierto:

- A deja de estar vigente en el límite;
- B comienza a estar vigente en el límite;
- existe exactamente un turno elegible.

---

#### 28. Check-in no selecciona turno

AUTH-CTX-010 no utilizará un check-in para elegir entre turnos ambiguos.

Regla:

```text
turno válido
→ contexto base del carril operativo
→ check-in se valida contra ese turno
```

No:

```text
check-in existente
→ elegir cualquier turno compatible
```

AUTH-CTX-011 deberá exigir que la sesión de check-in coincida con el
`active_shift` ya resuelto.

---

#### 29. Perfil operativo predeterminado

`employee_site_operational_profiles.default_operational_role` podrá ayudar a
VISO a crear o proponer turnos.

No podrá:

- crear `active_shift`;
- completar un turno sin rol;
- reemplazar el rol publicado;
- elegir sede;
- elegir área;
- resolver ambigüedad;
- conceder permisos.

---

#### 30. Relación con asignaciones administrativas

`assigned_sites`, `assigned_areas` y `administrative_coverage` permanecen
independientes.

Un turno vigente:

- no agrega sedes administrativas;
- no agrega áreas administrativas;
- no transforma `NONE` en cobertura;
- no reduce cobertura organizacional;
- no modifica el rol base;
- no revoca el carril base al terminar.

La relación entre sede operativa y asignación laboral se cerrará en
AUTH-CTX-013 sin mezclar carriles.

---

#### 31. Relación con el carril base

La ausencia de turno:

```text
active_shift = null
```

no invalida automáticamente:

- `base_role`;
- `administrative_coverage`;
- permisos `BASE_ONLY`;
- carril base de permisos `BASE_OR_OPERATIONAL`;
- capacidades administrativas no operativas.

La presencia de turno tampoco amplía el carril base.

---

#### 32. Relación con AUTH-CAT-012

Para permisos clasificados:

```text
N
```

la ausencia de turno no bloquea por ese prerrequisito.

Para permisos:

```text
T
```

el carril operativo requiere `active_shift != null`.

Para permisos:

```text
T+C
```

requiere además la sesión definida en AUTH-CTX-011.

`active_shift` no determina por sí solo qué clasificación tiene el permiso.

---

#### 33. Relación con `lane_readiness`

AUTH-CTX-010 aporta el hecho de turno al carril operativo.

Reglas conceptuales:

```text
active_shift = null
+
sin inconsistencia
→ turno operativo ausente
```

```text
active_shift = null
+
inconsistencia de turno
→ turno operativo inválido
```

```text
active_shift != null
→ prerrequisito de turno satisfecho
```

La forma completa de `LaneReadiness` y sus razones se consolidará en
AUTH-CTX-015.

---

#### 34. Actores de sistema y delegación

Un proceso `SYSTEM` autónomo no recibe turno laboral.

Resultado:

```text
active_shift = null
```

Cuando un proceso técnico ejecuta una acción delegada atribuida a un empleado,
no deberá inventar un turno.

Solo podrá resolver `active_shift` si:

- el contrato de delegación permite evaluar contexto laboral;
- el actor efectivo continúa siendo el empleado;
- la resolución usa las mismas fuentes canónicas;
- el proceso no suministra manualmente el turno;
- la operación no está diseñada como proceso de sistema independiente.

Los contratos de integración se definirán en BLOQUE X y los paquetes físicos
en BLOQUE R.

---

#### 35. Simulación

La simulación puede evaluar un turno hipotético dentro de su contrato
separado.

No podrá:

- crear un turno real;
- modificar `active_shift` real;
- reutilizar `WOULD_ALLOW` como autoridad;
- persistir una selección hipotética como turno;
- reemplazar la revisión publicada real.

El `AccessContext` real continúa resolviéndose exclusivamente desde datos
autoritativos.

---

#### 36. Dispositivo compartido

Un dispositivo compartido:

- no posee turno laboral propio;
- no presta su sede como turno;
- no presta su rol de navegación;
- no activa el turno por estar encendido;
- no selecciona el turno del último actor;
- no conserva el turno después de cerrar la sesión de actor.

El turno se resuelve para el empleado efectivo de la sesión.

AUTH-CTX-014 definirá la coherencia completa.

---

#### 37. Snapshot y obsolescencia

`active_shift` se evalúa dentro del snapshot inmutable del contexto.

El contexto queda potencialmente obsoleto cuando ocurre:

- publicación de una revisión nueva;
- retiro de la revisión vigente;
- cancelación;
- cambio de empleado;
- cambio de fecha u horario;
- cambio de sede;
- cambio de área;
- cambio de rol operativo;
- desactivación del empleado;
- desactivación de sede, área o rol;
- inicio del turno;
- fin del turno;
- detección o corrección de solapamiento.

AUTH-CTX-029 definirá invalidación, caché y fingerprint.

---

#### 38. Determinismo

Para el mismo:

- actor efectivo;
- conjunto de revisiones publicadas;
- catálogos;
- `resolved_at`;
- configuración temporal;

la resolución deberá producir exactamente el mismo resultado.

No dependerá de:

- orden físico de filas;
- hora del cliente;
- zona horaria del navegador;
- estado de UI;
- caché desactualizada;
- último registro leído;
- orden implícito de una consulta SQL.

---

#### 39. Casos de ejemplo

##### Caso A — Turno laboral publicado y vigente

```text
employee_id = E1
published = true
shift_kind = laboral
starts_at <= resolved_at < ends_at
status = scheduled
candidatos elegibles = 1
```

Resultado:

```text
active_shift != null
published = true
currently_valid = true
```

##### Caso B — Turno futuro publicado

```text
resolved_at < starts_at
```

Resultado:

```text
active_shift = null
```

No existe inconsistencia.

##### Caso C — Turno terminado

```text
resolved_at >= ends_at
status físico = scheduled
```

Resultado:

```text
active_shift = null
```

El estado físico desactualizado no extiende la vigencia.

##### Caso D — Turno borrador dentro de horario

```text
published = false
starts_at <= resolved_at < ends_at
```

Resultado:

```text
active_shift = null
```

##### Caso E — Turno nocturno

```text
inicio = 21 de julio, 22:00
fin    = 22 de julio, 06:00
resolved_at = 22 de julio, 02:00
```

Resultado:

```text
active_shift != null
```

##### Caso F — Dos turnos solapados

```text
candidatos elegibles = 2
```

Resultado:

```text
active_shift = null
structural_issue = turno ambiguo
```

##### Caso G — Descanso publicado

```text
shift_kind = descanso
```

Resultado:

```text
active_shift = null
```

##### Caso H — Turno de otro empleado

```text
shift.employee_id != actor_effective.actor_id
```

Resultado:

```text
active_shift = null
```

Si fue presentado como candidato autoritativo, existe inconsistencia.

##### Caso I — Turno cancelado

```text
status = cancelled
```

Resultado:

```text
active_shift = null
```

##### Caso J — Área de otra sede

```text
shift.site_id = SAUDO
area.site_id = VENTO_CAFE
```

Resultado:

```text
active_shift = null
structural_issue = territorio de turno inconsistente
```

##### Caso K — Turno vigente sin área

```text
area_id = null
```

Resultado:

```text
active_shift puede existir
```

La aptitud del rol o permiso para operar sin área se resolverá posteriormente.

##### Caso L — Turno sin rol operativo

```text
operational_role_code = null
```

Resultado:

```text
active_shift = null
```

No se utiliza el perfil predeterminado ni el rol base.

##### Caso M — Check-in sin turno vigente

```text
check-in residual = activo
active_shift = null
```

Resultado de esta tarea:

```text
active_shift = null
```

AUTH-CTX-011 clasificará la incompatibilidad del check-in.

##### Caso N — Cambio guardado pero no publicado

```text
revisión publicada A
borrador B posterior
```

Resultado:

```text
active_shift se resuelve exclusivamente desde A
```

---

#### 40. Inconsistencias estructurales detectables

AUTH-CTX-010 identifica las siguientes clases:

1. turno sin empleado;
2. turno atribuido a otro actor;
3. turno sin revisión publicada resoluble;
4. varias revisiones publicadas autoritativas;
5. revisión retirada tratada como vigente;
6. turno no laboral tratado como operativo;
7. intervalo temporal inválido;
8. turno nocturno calculado con fecha incorrecta;
9. zona horaria desconocida;
10. sede desconocida o inactiva;
11. área desconocida;
12. área perteneciente a otra sede;
13. rol operativo ausente;
14. rol operativo inexistente o inactivo;
15. rol base utilizado como rol operativo;
16. estado terminal tratado como vigente;
17. cancelación ignorada;
18. dos o más turnos elegibles;
19. selección por orden de filas;
20. fallback al último turno;
21. fallback al perfil operativo;
22. fallback al check-in;
23. turno elegido por el cliente;
24. `active_shift` no nulo con `published = false`;
25. `active_shift` no nulo con `currently_valid = false`;
26. timestamps inconsistentes con la revisión publicada;
27. mezcla de campos entre revisiones;
28. contexto reutilizado después de inicio o fin del turno.

AUTH-CTX-015 deberá asignar:

- código definitivo;
- severidad;
- carril afectado;
- exposición;
- mensaje seguro;
- efecto sobre `lane_readiness`.

---

#### 41. Fail closed

Ante ambigüedad o contradicción:

```text
active_shift = null
```

y deberá registrarse el problema estructural aplicable.

Queda prohibido:

- escoger un candidato arbitrario;
- usar el turno más cercano;
- usar el turno confirmado;
- usar el turno con check-in;
- usar el turno de la sede seleccionada;
- completar campos desde otra revisión;
- completar el rol desde el perfil;
- completar la sede desde el empleado;
- completar el área desde el dispositivo;
- extender la ventana hasta el check-out;
- considerar un turno publicado como vigente fuera de horario;
- considerar un turno vigente como permiso.

---

#### 42. Minimización de datos

`active_shift` no deberá incluir:

- nombre del empleado;
- nombre humano de la sede;
- nombre humano del área;
- notas administrativas;
- comentarios del turno;
- datos de geolocalización;
- información salarial;
- motivo de ausencia;
- información disciplinaria;
- confirmaciones no requeridas;
- auditoría completa de publicación;
- historial de revisiones;
- datos del creador o publicador.

La evidencia ampliada permanecerá en fuentes de auditoría y no en el contrato
mínimo.

---

#### 43. Relación con tareas posteriores

##### AUTH-CTX-011

Definirá `active_checkin_session`.

Deberá validar la sesión contra el `active_shift` resuelto y no utilizar el
check-in para escoger el turno.

##### AUTH-CTX-012

Definirá `operational_role` a partir de
`active_shift.operational_role_code`.

No permitirá fallback al rol base, perfil o dispositivo.

##### AUTH-CTX-013

Definirá `operational_site` y `operational_area` desde el turno validado.

Cerrará la relación con asignaciones, sede, área y roles site-wide.

##### AUTH-CTX-014

Definirá la coherencia entre turno y sesión del actor en dispositivo
compartido.

##### AUTH-CTX-015

Congelará códigos, severidades, carriles afectados y `lane_readiness`.

##### AUTH-CTX-017

Consumirá el prerrequisito contractual de turno del permiso solicitado.

##### AUTH-CTX-020

Evaluará el carril operativo utilizando `active_shift`, check-in, rol,
territorio y grants.

##### AUTH-CTX-024

Definirá la evidencia auditable de resolución del turno.

##### AUTH-CTX-025

Diseñará el contrato SQL de `get_access_context`, incluyendo:

- selección de revisión publicada;
- construcción temporal;
- turnos nocturnos;
- detección de ambigüedad;
- fail closed.

##### AUTH-CTX-027

Exigirá que las aplicaciones consuman `active_shift` centralizado.

##### AUTH-CTX-028

Diseñará la compatibilidad con:

- `employee_shifts`;
- `published_at`;
- estados legacy;
- `get_operational_context`;
- consumidores que filtran `shift_date = hoy`;
- turnos nocturnos;
- ausencia de revisiones explícitas.

##### AUTH-CTX-029

Definirá invalidación por cambios de turno y fronteras temporales.

##### AUTH-CTX-030

Definirá pruebas contractuales, incluyendo turnos futuros, nocturnos,
cancelados, solapados, consecutivos y revisiones en borrador.

---

#### 44. Fuera del alcance

AUTH-CTX-010 no:

- crea turnos;
- publica turnos;
- edita turnos;
- cancela turnos;
- define la interfaz de calendario;
- define notificaciones;
- define confirmación del trabajador;
- define tolerancias de check-in;
- define check-in activo;
- define check-out;
- define descansos;
- define nómina;
- define asistencia histórica;
- define resultado final del turno;
- crea roles operativos;
- asigna roles a sedes;
- define permisos;
- define recursos;
- decide autorización;
- crea tablas;
- crea revisiones físicas;
- crea funciones SQL;
- crea RPC;
- crea RLS;
- crea migraciones;
- modifica Supabase;
- modifica aplicaciones.

Todas las responsabilidades posteriores tienen destino explícito en la
sección 43 o en los roadmaps funcionales de ANIMA y VISO.

---

#### 45. Riesgos controlados

##### Riesgo 1 — Turno publicado tratado como vigente

Control:

```text
starts_at <= resolved_at < ends_at
```

##### Riesgo 2 — Turnos nocturnos perdidos

Control:

```text
intervalo absoluto que puede terminar al día siguiente
```

##### Riesgo 3 — Borrador reemplaza publicación

Control:

```text
solo revisión publicada autoritativa
```

##### Riesgo 4 — Check-in elige turno

Control:

```text
primero active_shift; después validar check-in
```

##### Riesgo 5 — Solapamiento resuelto arbitrariamente

Control:

```text
más de un candidato → fail closed
```

##### Riesgo 6 — Estado `scheduled` extiende turno histórico

Control:

```text
vigencia temporal independiente de status
```

##### Riesgo 7 — Rol faltante completado desde perfil

Control:

```text
sin operational_role_code → active_shift null
```

##### Riesgo 8 — Fin de turno depende de un job

Control:

```text
resolved_at >= ends_at → no vigente
```

---

#### 46. Criterios de aprobación

AUTH-CTX-010 podrá aprobarse cuando se acepte que:

1. `active_shift` conserva la forma de `AccessContext@1.0.0`;
2. la tarea es una aclaración normativa compatible;
3. el turno se resuelve exclusivamente en servidor;
4. el actor efectivo debe ser empleado;
5. el turno debe pertenecer al actor efectivo;
6. el empleado debe estar activo;
7. un turno borrador no produce contexto;
8. un turno publicado no es necesariamente vigente;
9. debe existir una revisión publicada autoritativa;
10. los borradores posteriores no alteran la revisión publicada;
11. no se mezclan campos entre revisiones;
12. solo turnos laborales producen `active_shift`;
13. `resolved_at` es la referencia temporal única;
14. la ventana es `starts_at <= resolved_at < ends_at`;
15. no existen tolerancias implícitas;
16. los timestamps se construyen en servidor;
17. la zona actual es `America/Bogota`;
18. los turnos nocturnos continúan vigentes después de medianoche;
19. no se filtra únicamente `shift_date = hoy`;
20. una duración inválida falla cerrado;
21. estados terminales no producen turno vigente;
22. `confirmed` no es requisito;
23. la cancelación invalida el turno;
24. el fin temporal no depende de actualizar `status`;
25. un turno futuro produce `null` sin inconsistencia;
26. `shift_id`, `employee_id`, `site_id` y rol operativo son obligatorios;
27. `area_id` puede ser nulo;
28. un área declarada debe pertenecer a la sede;
29. el rol operativo debe existir y estar activo;
30. el rol base no reemplaza al rol operativo;
31. el perfil predeterminado no completa el turno;
32. cero candidatos produce `null`;
33. un candidato produce el nodo;
34. varios candidatos producen ambigüedad y `null`;
35. no se selecciona por orden, sede, check-in o confirmación;
36. turnos consecutivos no se solapan;
37. el check-in no selecciona turno;
38. el dispositivo no posee turno laboral;
39. la simulación no modifica el turno real;
40. el turno no modifica cobertura administrativa;
41. la ausencia de turno no invalida el carril base;
42. permisos `T` exigen `active_shift`;
43. permisos `T+C` exigirán además AUTH-CTX-011;
44. `active_shift` no concede permisos;
45. `active_shift` no decide autorización;
46. un nodo no nulo siempre tendrá `published = true`;
47. un nodo no nulo siempre tendrá `currently_valid = true`;
48. AUTH-CTX-015 congelará problemas estructurales;
49. AUTH-CTX-025 diseñará el productor SQL;
50. AUTH-CTX-028 diseñará compatibilidad legacy;
51. AUTH-CTX-029 definirá invalidación temporal;
52. AUTH-CTX-030 definirá pruebas contractuales;
53. no se implementa código, migraciones ni cambios en Supabase.

---

#### 47. Estado final de la propuesta

| Tarea        | Estado      | Relación                  |
| ------------ | ----------- | ------------------------- |
| AUTH-CTX-009 | APROBADA    | Tarea anterior            |
| AUTH-CTX-010 | APROBADA    | Tarea actual              |
| AUTH-CTX-011 | NO INICIADA | Tarea siguiente reservada |

La continuidad propuesta queda:

```text
AUTH-CTX-009 — APROBADA
        ↓
AUTH-CTX-010 — APROBADA
        ↓
AUTH-CTX-011 — NO INICIADA
```

No se avanza a AUTH-CTX-011 hasta recibir aprobación explícita de
AUTH-CTX-010.

### ✅ AUTH-CTX-011 — Incluir sesión de check-in activa

**Estado:** APROBADA  
**Bloque:** BLOQUE E — Contexto y decisión de autorización unificados  
**Naturaleza:** Refinamiento documental del nodo `active_checkin_session` dentro de `AccessContext`  
**Implementación física:** No incluida  
**Tarea anterior vigente:** AUTH-CTX-010 — APROBADA  
**Tarea posterior reservada:** AUTH-CTX-012 — Incluir rol operativo efectivo  
**Contrato afectado:** `AccessContext@1.0.0`  
**Nodo afectado:** `active_checkin_session`  
**Cambio contractual:** Aclaración normativa compatible; no cambia la forma publicada  
**Cambios físicos permitidos:** No

Esta tarea define cómo `AccessContext` resuelve una sesión de check-in
confirmada, vigente y compatible con el turno activo del actor efectivo.

La tarea separa expresamente:

- solicitud de check-in;
- evento recibido;
- evento confirmado;
- check-in válido;
- sesión abierta;
- sesión activa para autorización;
- sesión cerrada;
- sesión expirada;
- sesión inválida;
- punto físico de marcación;
- sede operativa;
- presencia;
- permiso;
- autorización final.

No modifica la estructura raíz de `AccessContext`, no agrega campos, no cambia
`contract_version`, no cambia `schema_version`, no implementa SQL, RPC, RLS,
migraciones, triggers, jobs, colas offline, aplicaciones ni cambios físicos
en Supabase.

---

#### 1. Objetivo

Definir el nodo `active_checkin_session` de manera que Vento OS pueda
responder inequívocamente:

1. si existe una sesión de check-in confirmada por servidor;
2. si pertenece al actor efectivo;
3. si corresponde exactamente al `active_shift`;
4. si continúa abierta en `resolved_at`;
5. si expiró;
6. si fue cerrada mediante check-out;
7. si fue reemplazada o corregida;
8. si su sede operativa coincide con el turno;
9. si su área es compatible;
10. cómo se distingue la sede laboral del punto físico de marcación;
11. cómo se tratan solicitudes offline todavía no confirmadas;
12. cómo se resuelven duplicados y reintentos;
13. qué ocurre ante varias sesiones abiertas;
14. qué ocurre cuando hay check-in sin turno vigente;
15. qué ocurre cuando el turno termina sin check-out;
16. cómo afecta a permisos `N`, `T` y `T+C`;
17. cómo mantener independiente el carril base;
18. cómo preservar determinismo, trazabilidad y fail closed.

---

#### 2. Base normativa

AUTH-CTX-011 conserva sin cambios las decisiones aprobadas en:

- ADR-AUTH-001;
- AUTH-MOD-001 — Identidad laboral y actor efectivo;
- AUTH-MOD-002 — Separación entre rol base y rol operativo;
- AUTH-MOD-007 — Sede asignada y sede activa;
- AUTH-MOD-008 — Área asignada y área activa;
- AUTH-MOD-009 — Turno publicado;
- AUTH-MOD-010 — Check-in activo;
- AUTH-MOD-011 — Sesión en dispositivo compartido;
- AUTH-MOD-018 — Precedencia entre carriles;
- AUTH-MOD-019 — Denegación explícita;
- AUTH-CAT-012 — Prerrequisitos de turno y check-in;
- AUTH-CAT-013 — Prerrequisitos de área activa;
- AUTH-CAT-014 — Compatibilidad con dispositivo compartido;
- AUTH-CTX-001 — Diseñar `AccessContext`;
- AUTH-CTX-004 — Versionar contratos;
- AUTH-CTX-005 a AUTH-CTX-010 — Principal, actor, identidad, empleado, rol
  base, cobertura administrativa y turno vigente.

Principios heredados obligatorios:

```text
SOLICITUD DE CHECK-IN
≠
CHECK-IN CONFIRMADO
```

```text
CHECK-IN CONFIRMADO
≠
CHECK-IN ACTIVO
```

```text
CHECK-IN ACTIVO
≠
PERMISO
```

```text
CHECK-IN
≠
TURNO
```

```text
PUNTO FÍSICO DE MARCACIÓN
≠
SEDE OPERATIVA
```

```text
CIERRE DEL CHECK-IN
≠
CIERRE DEL CARRIL BASE
```

---

#### 3. Separación conceptual obligatoria

| Concepto                 | Significado                                                     |              Efecto de autorización |
| ------------------------ | --------------------------------------------------------------- | ----------------------------------: |
| Solicitud de check-in    | Intención generada por cliente, terminal o cola offline         |                             Ninguno |
| Evento recibido          | Solicitud llegada al servidor, todavía dentro de la transacción |                             Ninguno |
| Evento confirmado        | Evento persistido después de validar y confirmar la transacción |               Evidencia, no permiso |
| Check-in válido          | Evento confirmado compatible con actor, turno y territorio      |               Evidencia, no permiso |
| Sesión abierta           | Check-in válido sin evento terminal aplicable                   |                 Puede ser candidata |
| Sesión activa            | Sesión abierta, vigente y compatible con `active_shift`         | Satisface prerrequisito de check-in |
| Sesión cerrada           | Existe check-out terminal confirmado                            |          No satisface prerrequisito |
| Sesión expirada          | Superó su vencimiento efectivo                                  |          No satisface prerrequisito |
| Sesión inválida          | Presenta contradicción estructural o de identidad               |          Bloqueo según AUTH-CTX-015 |
| Punto de marcación       | Lugar físico o geocerca desde donde se registró                 |      No cambia territorio operativo |
| `active_checkin_session` | Snapshot contractual de la sesión activa                        |     No concede permisos por sí solo |

---

#### 4. Forma contractual conservada

AUTH-CTX-011 conserva exactamente la forma conceptual publicada:

```ts
type ActiveCheckinContext = {
  checkin_session_id: string;
  employee_id: string;
  shift_id: string;
  site_id: string;
  area_id: string | null;
  checked_in_at: string;
  expires_at: string | null;
  checked_out_at: string | null;
  status: "ACTIVE" | "EXPIRED" | "CLOSED" | "INVALID";
};
```

No se agregan propiedades.

La publicación permanece:

```text
AccessContext
contract_version = 1.0.0
schema_version   = 1.0.0
```

---

#### 5. Semántica raíz del nodo

En el `AccessContext` real de autorización:

```text
active_checkin_session != null
→ status = ACTIVE
→ checked_out_at = null
→ active_shift != null
→ employee_id coincide con el actor efectivo
→ shift_id coincide con active_shift.shift_id
```

Las normalizaciones:

```text
EXPIRED
CLOSED
INVALID
```

se conservan como estados contractuales reconocidos, pero no satisfacen el
prerrequisito de check-in activo.

El productor canónico deberá:

- emitir el nodo únicamente cuando la sesión sea `ACTIVE`;
- representar una sesión cerrada o expirada como ausencia de sesión activa;
- registrar la causa correspondiente en evidencia o razones estructuradas
  cuando aplique;
- no devolver una sesión no activa como si habilitara permisos.

Cuando no existe sesión activa:

```text
active_checkin_session = null
```

---

#### 6. Resolución exclusiva en servidor

La sesión deberá resolverse en servidor utilizando:

- actor efectivo;
- empleado resuelto;
- `active_shift`;
- eventos confirmados;
- estado autoritativo de la sesión;
- `resolved_at`.

No podrá aceptarse como fuente autoritativa:

- `checkedIn: true` enviado por el cliente;
- estado local de ANIMA;
- cola offline aún no confirmada;
- último evento mostrado en pantalla;
- `checkin_session_id` enviado sin validación;
- check-in almacenado en local storage;
- cookie no firmada;
- sesión del dispositivo;
- sede seleccionada;
- GPS del cliente sin validación;
- último check-in histórico;
- check-in de otro empleado;
- check-in de otro turno;
- check-in simulado;
- ausencia aparente de check-out obtenida sin emparejamiento canónico.

---

#### 7. Actor laboral requerido

`active_checkin_session` solo podrá existir cuando:

1. `actor_effective.actor_type = EMPLOYEE`;
2. `employee` existe;
3. el empleado está activo;
4. `active_shift` existe;
5. la sesión pertenece al mismo empleado;
6. no existe ambigüedad de identidad.

Para actores:

- `CUSTOMER`;
- `SYSTEM` autónomo;
- `DEVICE` sin sesión humana;
- `UNRESOLVED`;

el resultado será:

```text
active_checkin_session = null
```

En dispositivos compartidos, el check-in pertenece al empleado actor, no a la
identidad técnica del dispositivo.

---

#### 8. Fuente conceptual

La fuente normativa será un agregado canónico equivalente a:

```text
empleado efectivo
→ active_shift
→ evento de check-in confirmado
→ sesión laboral canónica
→ ausencia de evento terminal
→ vigencia en resolved_at
```

La implementación física futura se diseñará en AUTH-CTX-025.

La adaptación desde:

- `attendance_logs`;
- pares `check_in` / `check_out`;
- eventos sin `shift_id`;
- lógica de último check-in abierto;
- consumidores de `get_operational_context`;

queda asignada a AUTH-CTX-028.

---

#### 9. Solicitud de check-in

Una solicitud puede originarse en:

- ANIMA;
- dispositivo compartido;
- terminal autorizada;
- corrección administrativa;
- reintento idempotente;
- cola offline.

Una solicitud todavía no cambia el contexto.

Regla:

```text
solicitud creada en cliente
→ active_checkin_session no cambia
```

La interfaz podrá mostrar estado pendiente, pero no podrá habilitar acciones
`T+C` hasta recibir confirmación autoritativa.

---

#### 10. Evento confirmado

Un evento de check-in está confirmado cuando:

1. fue recibido por el servidor;
2. pasó validaciones de identidad;
3. pasó validaciones de turno;
4. pasó validaciones territoriales y de política;
5. fue persistido;
6. la transacción fue confirmada;
7. recibió identificador definitivo;
8. quedó vinculado inequívocamente con una sesión;
9. su respuesta no depende de una operación todavía pendiente.

Un evento rechazado, revertido o pendiente no participa en
`active_checkin_session`.

---

#### 11. Identificador de sesión

`checkin_session_id` identifica la sesión laboral canónica, no únicamente el
evento de entrada.

Debe permitir relacionar inequívocamente:

- evento de check-in;
- evento de check-out;
- expiración;
- cierre automático;
- corrección;
- reemplazo;
- auditoría;
- actor;
- turno.

Queda prohibido utilizar como identificador de sesión:

- `employee_id`;
- `shift_id` aislado;
- timestamp aislado;
- último evento del empleado;
- combinación no protegida contra duplicados;
- identificador generado solo en cliente sin confirmación.

AUTH-CTX-025 deberá exigir un identificador estable en el contrato SQL futuro.

AUTH-CTX-028 deberá definir cómo adaptar eventos legacy que todavía no poseen
sesión explícita.

---

#### 12. Coincidencia con el actor efectivo

La sesión deberá cumplir:

```text
active_checkin_session.employee_id
=
active_shift.employee_id
=
employee.employee_id
=
actor_effective.actor_id
```

Un check-in de otro empleado:

- no se adopta;
- no se corrige por dispositivo;
- no se reasigna al usuario autenticado;
- no se usa como fallback;
- produce problema estructural si fue presentado como candidato vigente.

---

#### 13. Coincidencia obligatoria con el turno

La sesión activa deberá cumplir:

```text
active_checkin_session.shift_id
=
active_shift.shift_id
```

Queda prohibido:

- aceptar check-in sin turno para permisos `T+C`;
- asociar el check-in al turno más cercano;
- usar el último turno del empleado;
- usar un turno futuro;
- usar un turno ya terminado;
- usar un turno cancelado;
- elegir entre turnos solapados mediante el check-in;
- cambiar `active_shift` para hacerlo coincidir con la marcación.

El orden obligatorio es:

```text
1. resolver active_shift
2. resolver sesión candidata
3. validar coincidencia exacta
```

---

#### 14. Check-in sin turno vigente

Cuando existe un evento abierto o residual pero:

```text
active_shift = null
```

el resultado será:

```text
active_checkin_session = null
```

El evento no crea turno, rol operativo, sede operativa ni permiso.

AUTH-CTX-015 deberá clasificar el problema cuando el evento pretenda
representar una sesión vigente.

Casos históricos sin turno podrán conservarse para asistencia, pero no para
autorización.

---

#### 15. `site_id` de la sesión

Dentro de `ActiveCheckinContext`:

```text
site_id
=
sede operativa confirmada para la sesión
```

Deberá coincidir con:

```text
active_shift.site_id
```

No representa necesariamente el punto físico donde se marcó.

Por tanto:

```text
operational_site_id
≠ geofence_site_id
```

puede ser válido.

Ejemplo:

```text
turno laboral = CENTRO_PRODUCCION
punto físico de marcación = PICKUP_CAMIONETA
```

El nodo conservará:

```text
site_id = CENTRO_PRODUCCION
```

El punto físico y la evidencia de geocerca se mantienen fuera del contrato
mínimo.

---

#### 16. Punto físico de marcación

El punto de marcación puede ser:

- la propia sede;
- una entrada;
- una geocerca;
- un patio;
- una ubicación logística;
- un punto externo autorizado;
- un dispositivo fijo autorizado.

Ese punto:

- no cambia la sede del turno;
- no crea asignación laboral;
- no crea cobertura administrativa;
- no se convierte en `site_id` operativo;
- no concede permisos;
- debe validarse contra política autoritativa.

La política física de marcación pertenece al dominio de asistencia y será
auditada en E1, diseñada funcionalmente en E2 y materializada mediante los
paquetes de implementación correspondientes de E5 y BLOQUE R.

La semántica de autorización queda cerrada aquí: el punto solo aporta
evidencia.

---

#### 17. `area_id` de la sesión

`area_id` puede ser `null`.

Cuando exista:

1. deberá pertenecer a `site_id`;
2. deberá coincidir con `active_shift.area_id`;
3. no podrá introducir un área ausente en el turno;
4. no podrá proceder únicamente del frontend;
5. no podrá corregir un turno incompleto;
6. no podrá cambiar el área operativa.

Regla:

```text
check-in confirma área del turno
→ puede coincidir

check-in inventa área
→ inválido
```

AUTH-CTX-013 cerrará la resolución de `operational_area`.

---

#### 18. `checked_in_at`

`checked_in_at` deberá ser:

- timestamp absoluto;
- confirmado por servidor;
- serializable en ISO 8601;
- atribuible al evento confirmado;
- coherente con la política temporal aplicable;
- anterior a cualquier cierre válido.

No se aceptará como hora autoritativa:

- reloj del dispositivo sin normalización;
- timestamp editable por el cliente;
- hora local sin zona;
- timestamp futuro injustificado;
- hora reconstruida desde orden físico de filas.

La aceptación operativa de marcaciones tempranas o tardías no modifica la
regla de autorización:

```text
sin active_shift vigente
→ no existe sesión activa para permisos
```

---

#### 19. Inicio anticipado confirmado

Una política de asistencia puede aceptar un check-in antes de
`active_shift.starts_at`.

En ese caso:

- el evento puede quedar confirmado;
- la sesión puede quedar abierta en el dominio de asistencia;
- `active_checkin_session` permanecerá `null` mientras `active_shift` sea
  `null`;
- al iniciar el turno, la misma sesión podrá volverse activa si continúa
  válida y compatible;
- no se habilitan permisos operativos antes del inicio del turno.

No existe prerrequisito operativo satisfecho únicamente por marcar temprano.

---

#### 20. `expires_at`

`expires_at` representa un vencimiento explícito de la sesión cuando exista.

La expiración efectiva será:

```text
mínimo entre:
- expires_at explícito, cuando exista;
- active_shift.ends_at;
- cierre o invalidación autoritativa anterior.
```

Si `expires_at = null`, la sesión nunca podrá sobrevivir al fin del turno.

Por tanto:

```text
resolved_at >= active_shift.ends_at
→ sesión no activa
```

aunque no exista check-out.

---

#### 21. `checked_out_at`

Para una sesión activa:

```text
checked_out_at = null
```

Un check-out confirmado y aplicable produce:

```text
status normalizado = CLOSED
active_checkin_session = null
```

El checkout deberá:

- pertenecer a la misma sesión;
- pertenecer al mismo empleado;
- ser posterior o igual al check-in según reglas temporales;
- estar confirmado;
- no depender de un evento pendiente;
- no cerrar otras sesiones por mera precedencia cronológica.

---

#### 22. Evento terminal

Son eventos terminales conceptuales:

- check-out confirmado;
- auto-checkout confirmado;
- cierre administrativo autoritativo;
- cancelación de sesión;
- reemplazo explícito;
- expiración;
- invalidación estructural.

Un recordatorio, intento fallido o evento pendiente no es terminal.

AUTH-CTX-028 deberá impedir la semántica legacy:

```text
cualquier check-out posterior del empleado
→ cierra todos los check-ins anteriores
```

La relación futura deberá ser por sesión canónica.

---

#### 23. Fin del turno sin check-out

Cuando el turno termina:

```text
resolved_at >= active_shift.ends_at
```

la sesión deja de ser activa aunque no exista check-out.

Resultado:

```text
active_shift = null
active_checkin_session = null
```

La ausencia de check-out podrá producir:

- cierre automático;
- novedad de asistencia;
- reconciliación administrativa;
- auditoría;

pero no prolongará permisos.

---

#### 24. Cancelación del turno con sesión abierta

Cuando el turno se cancela o retira de forma autoritativa:

```text
active_shift = null
active_checkin_session = null
```

La sesión residual no conserva autoridad.

AUTH-CTX-029 deberá invalidar el snapshot.

La creación física del evento terminal o de reconciliación se definirá en los
paquetes de implementación de asistencia posteriores, sin alterar esta regla.

---

#### 25. Estados normalizados

##### 25.1 `ACTIVE`

Requiere simultáneamente:

- evento confirmado;
- actor correcto;
- empleado activo;
- `active_shift` vigente;
- mismo `shift_id`;
- mismo `site_id`;
- área compatible;
- sesión abierta;
- no expirada;
- no reemplazada;
- sin evento terminal;
- candidato único.

Es el único estado que satisface el prerrequisito de check-in.

##### 25.2 `CLOSED`

Existe evento terminal confirmado.

No satisface check-in activo.

##### 25.3 `EXPIRED`

La sesión superó su expiración efectiva sin cierre previo aplicable.

No satisface check-in activo.

##### 25.4 `INVALID`

Existe contradicción de:

- actor;
- empleado;
- turno;
- sede;
- área;
- temporalidad;
- identidad de sesión;
- duplicidad;
- confirmación;
- integridad.

No satisface check-in activo y deberá producir la razón estructural
correspondiente.

---

#### 26. Sesión reemplazada o corregida

Una sesión podrá ser reemplazada únicamente mediante una acción autoritativa
y auditable.

Reglas:

1. la sesión anterior deja de estar activa;
2. la nueva sesión deberá tener identidad propia;
3. no podrán coexistir ambas como activas;
4. una corrección no cambiará silenciosamente el actor;
5. una corrección no cambiará silenciosamente el turno;
6. una corrección no transformará un evento rechazado en confirmado sin
   nueva evidencia;
7. el reemplazo deberá invalidar snapshots anteriores.

La estructura física y flujo administrativo se definirán en E2, E3, E5 y
BLOQUE R.

---

#### 27. Reintentos e idempotencia

Los reintentos de una misma solicitud no podrán crear varias sesiones
activas.

La implementación futura deberá soportar una clave idempotente equivalente a:

```text
client_event_id
+
actor
+
tipo de evento
```

La regla contractual es:

```text
mismo evento lógico confirmado varias veces
→ una sola sesión efectiva
```

AUTH-CTX-025 deberá exigir resolución determinista.

E3 y BLOQUE R definirán la restricción física, índices y transacción.

---

#### 28. Varias sesiones abiertas

Después de validar actor, turno y territorio:

```text
0 sesiones activas candidatas
→ active_checkin_session = null
```

```text
1 sesión activa candidata
→ producir nodo
```

```text
2 o más sesiones activas candidatas
→ active_checkin_session = null
→ inconsistencia estructural
```

Queda prohibido elegir:

- la última;
- la primera;
- la más reciente;
- la que tenga GPS;
- la del dispositivo actual;
- la de la sede seleccionada;
- la que tenga `shift_id`;
- la que parezca más completa.

La duplicidad deberá corregirse en la fuente.

---

#### 29. Sesiones consecutivas

Una sesión cerrada anterior y una sesión activa posterior no generan
ambigüedad cuando:

- tienen identificadores diferentes;
- el cierre anterior es autoritativo;
- los intervalos no se superponen;
- cada evento está vinculado con su sesión.

No se deducirá esta separación únicamente por orden cronológico.

---

#### 30. Ausencia de check-in

La ausencia de sesión activa puede ser normal.

Reglas por prerrequisito:

```text
permiso N
→ no se bloquea por ausencia de check-in
```

```text
permiso T
→ no se bloquea por ausencia de check-in
→ sí requiere active_shift
```

```text
permiso T+C
→ ausencia de active_checkin_session
→ carril operativo no disponible
```

La ausencia no crea un `STRUCTURAL_DENY` por sí sola.

---

#### 31. Check-in incompatible

Un check-in incompatible nunca se tratará como ausencia silenciosa.

Ejemplos:

- otro actor;
- otro turno;
- otra sede operativa;
- área incompatible;
- sesión duplicada;
- evento no confirmado presentado como activo;
- cierre ignorado;
- sesión expirada presentada como activa.

Resultado mínimo:

```text
active_checkin_session = null
```

AUTH-CTX-015 determinará si cada caso:

- bloquea todo el carril operativo;
- bloquea únicamente prerrequisitos `T+C`;
- genera advertencia;
- exige auditoría reforzada.

Hasta esa clasificación, ningún caso incompatible podrá habilitar permisos.

---

#### 32. Relación con el carril base

El check-in:

- no crea rol base;
- no modifica `administrative_coverage`;
- no agrega sedes;
- no agrega áreas;
- no convierte un permiso base en operativo;
- no es requisito para permisos `BASE_ONLY`;
- no revoca permisos base cuando se cierra;
- no amplía el alcance administrativo.

Regla:

```text
check-out
→ invalida capacidades T+C
→ no invalida automáticamente carril base
```

---

#### 33. Relación con permisos `BASE_OR_OPERATIONAL`

Cada carril se evalúa de forma independiente.

Ejemplo:

```text
permiso BASE_OR_OPERATIONAL
carril base válido
carril operativo sin check-in
```

Resultado:

```text
el carril base puede autorizar
```

La ausencia o cierre del check-in no deberá bloquear el carril base.

Una denegación aplicable conserva precedencia.

---

#### 34. Relación con permisos `BASE_AND_OPERATIONAL`

Para `BASE_AND_OPERATIONAL`:

- el componente base deberá ser válido;
- el componente operativo deberá ser válido;
- si el permiso exige `T+C`, deberá existir sesión activa;
- ambos componentes deberán pertenecer al mismo actor;
- el check-in no sustituye ningún componente.

Sin sesión activa requerida:

```text
final_decision = DENY
```

aunque el carril base sea válido.

---

#### 35. Relación con el rol operativo

`active_checkin_session` no crea `operational_role`.

El orden será:

```text
active_shift
→ active_checkin_session
→ operational_role
```

AUTH-CTX-012 resolverá el rol exclusivamente desde el turno.

El check-in podrá confirmar coherencia, pero no:

- completar rol faltante;
- cambiar rol;
- usar `navigation_role`;
- usar perfil predeterminado;
- usar rol base.

---

#### 36. Relación con sede y área operativas

AUTH-CTX-013 resolverá:

```text
operational_site
operational_area
```

Reglas heredadas:

- la sede procede del turno;
- el check-in la confirma;
- el punto físico no la reemplaza;
- el área no se inventa desde la marcación;
- una incompatibilidad produce problema estructural.

---

#### 37. Dispositivo compartido

Un dispositivo compartido:

- puede capturar una solicitud;
- puede autenticar técnicamente el canal;
- puede exigir PIN;
- puede contener una sesión de actor;
- puede restringir capacidades disponibles.

No puede:

- convertirse en empleado;
- prestar un check-in de otro actor;
- mantener el check-in del actor anterior;
- crear sesión activa por estar encendido;
- usar su sede para corregir el turno;
- usar `navigation_role` como función laboral;
- ampliar permisos.

La sesión de actor del dispositivo y la sesión de check-in son objetos
separados.

Cerrar la sesión del dispositivo no necesariamente crea un check-out laboral.

AUTH-CTX-014 definirá su coherencia.

---

#### 38. Cola offline

Una solicitud offline:

```text
pendiente de sincronización
→ no confirmada
→ no activa
```

Al sincronizar:

1. deberá conservar identidad idempotente;
2. deberá validarse contra el turno autoritativo;
3. deberá validarse contra actor, sede y política;
4. podrá ser rechazada por obsolescencia;
5. no reescribirá retrospectivamente autorización ya denegada;
6. no habilitará acciones realizadas antes de confirmarse;
7. deberá registrar la diferencia entre hora declarada y hora confirmada.

La arquitectura física de cola y reconciliación corresponde a E4, E5 y
BLOQUE R.

---

#### 39. Corrección administrativa

Una corrección administrativa puede:

- cerrar una sesión;
- invalidar un evento;
- reemplazar evidencia;
- registrar una novedad;
- corregir asistencia histórica.

No podrá crear retroactivamente autoridad para una acción empresarial ya
ejecutada.

Regla:

```text
corrección posterior
≠ autorización retroactiva
```

La segregación de funciones, permisos exactos y auditoría del flujo serán
definidos en E2, matrices, E5 y BLOQUE R.

---

#### 40. Simulación

La simulación podrá representar hipotéticamente:

- turno;
- check-in;
- sede;
- área;
- rol operativo.

No podrá:

- crear sesión real;
- confirmar evento;
- cambiar `active_checkin_session`;
- habilitar mutaciones;
- reutilizar `WOULD_ALLOW` como autoridad;
- cerrar o expirar sesiones reales.

El contexto simulado permanece separado según AUTH-MOD-012 y
AUTH-CTX-003.

---

#### 41. Snapshot y obsolescencia

`active_checkin_session` forma parte del snapshot inmutable.

El contexto queda potencialmente obsoleto cuando ocurre:

- confirmación de check-in;
- confirmación de check-out;
- expiración;
- auto-checkout;
- cierre administrativo;
- reemplazo;
- invalidación;
- cancelación del turno;
- fin del turno;
- cambio de actor;
- cambio de sesión de dispositivo;
- cambio de sede o área;
- corrección de duplicados;
- revocación del evento confirmado.

AUTH-CTX-029 definirá invalidación, caché y fingerprint.

---

#### 42. Determinismo

Para el mismo:

- actor efectivo;
- `active_shift`;
- conjunto de eventos confirmados;
- sesiones autoritativas;
- políticas;
- `resolved_at`;

la resolución deberá producir exactamente el mismo resultado.

No dependerá de:

- orden físico de filas;
- hora del cliente;
- último evento recuperado sin orden total;
- sesión almacenada en UI;
- dispositivo actual;
- reintento duplicado;
- caché obsoleta;
- ausencia de `ORDER BY` determinista.

---

#### 43. Casos de ejemplo

##### Caso A — Check-in confirmado y activo

```text
actor = E1
active_shift = S1
sesión.employee_id = E1
sesión.shift_id = S1
sesión abierta
sin expiración
sin checkout
```

Resultado:

```text
active_checkin_session != null
status = ACTIVE
checked_out_at = null
```

##### Caso B — Solicitud offline pendiente

```text
evento existe solo en cliente
```

Resultado:

```text
active_checkin_session = null
```

##### Caso C — Check-in confirmado antes del turno

```text
checked_in_at < active_shift.starts_at
resolved_at < active_shift.starts_at
```

Resultado:

```text
active_shift = null
active_checkin_session = null
```

Al iniciar el turno podrá reevaluarse.

##### Caso D — Check-in de otro actor

```text
sesión.employee_id != actor_effective.actor_id
```

Resultado:

```text
active_checkin_session = null
structural_issue = identidad incompatible
```

##### Caso E — Check-in de otro turno

```text
sesión.shift_id != active_shift.shift_id
```

Resultado:

```text
active_checkin_session = null
structural_issue = shift_checkin_mismatch
```

##### Caso F — Check-in en punto externo autorizado

```text
active_shift.site_id = CENTRO_PRODUCCION
operational_site_id = CENTRO_PRODUCCION
geofence_site_id = PICKUP_CAMIONETA
```

Resultado:

```text
active_checkin_session.site_id = CENTRO_PRODUCCION
```

El punto físico no reemplaza la sede.

##### Caso G — Checkout confirmado

```text
checked_out_at != null
```

Resultado:

```text
active_checkin_session = null
estado normalizado = CLOSED
```

##### Caso H — Turno terminó sin checkout

```text
resolved_at >= active_shift.ends_at
```

Resultado:

```text
active_shift = null
active_checkin_session = null
estado normalizado = EXPIRED
```

##### Caso I — Dos sesiones abiertas

```text
candidatos activos = 2
```

Resultado:

```text
active_checkin_session = null
structural_issue = sesiones concurrentes
```

##### Caso J — Permiso `T`

```text
active_shift válido
active_checkin_session = null
```

Resultado:

```text
el prerrequisito de check-in no bloquea
```

##### Caso K — Permiso `T+C`

```text
active_shift válido
active_checkin_session = null
```

Resultado:

```text
carril operativo no disponible
```

##### Caso L — Área capturada distinta

```text
active_shift.area_id = BODEGA
sesión.area_id = REPOSTERIA
```

Resultado:

```text
active_checkin_session = null
structural_issue = área incompatible
```

##### Caso M — Reintento idempotente

```text
mismo client_event_id enviado tres veces
```

Resultado:

```text
una sola sesión efectiva
```

##### Caso N — Check-in residual sin turno

```text
evento abierto legacy
active_shift = null
```

Resultado:

```text
active_checkin_session = null
```

No crea contexto operativo.

---

#### 44. Inconsistencias estructurales detectables

AUTH-CTX-011 identifica las siguientes clases:

1. evento no confirmado presentado como activo;
2. sesión sin identificador;
3. sesión sin empleado;
4. sesión de otro actor;
5. sesión sin turno;
6. sesión de otro turno;
7. sesión con turno inexistente;
8. sesión con turno no vigente;
9. sesión con turno cancelado;
10. sede operativa ausente;
11. sede distinta a la del turno;
12. punto físico usado como sede operativa;
13. área inexistente;
14. área de otra sede;
15. área distinta a la del turno;
16. check-out anterior al check-in;
17. check-out no vinculado con sesión;
18. sesión cerrada presentada como activa;
19. sesión expirada presentada como activa;
20. sesión reemplazada presentada como activa;
21. varias sesiones abiertas;
22. duplicados por reintento;
23. evento pendiente offline presentado como confirmado;
24. timestamp no autoritativo;
25. expiración incoherente;
26. sesión que sobrevive al fin del turno;
27. cualquier checkout posterior usado para cerrar sesiones no relacionadas;
28. actor de dispositivo confundido con empleado;
29. sesión del actor del dispositivo confundida con asistencia;
30. check-in utilizado para seleccionar turno;
31. check-in utilizado para crear rol operativo;
32. check-in utilizado para ampliar carril base;
33. snapshot reutilizado después de cierre o expiración.

AUTH-CTX-015 deberá asignar:

- código definitivo;
- severidad;
- carril afectado;
- exposición;
- mensaje seguro;
- efecto sobre `lane_readiness`.

---

#### 45. Fail closed

Ante ambigüedad o contradicción:

```text
active_checkin_session = null
```

Queda prohibido:

- escoger la sesión más reciente;
- escoger la primera;
- usar último check-in sin check-out;
- emparejar por empleado solamente;
- emparejar por sede solamente;
- aceptar evento pendiente;
- confiar en el estado del frontend;
- extender la sesión después del turno;
- completar `shift_id` con el turno actual;
- completar `site_id` con la sede seleccionada;
- completar `area_id` con el dispositivo;
- tratar GPS válido como sesión válida;
- tratar check-in como permiso;
- tratar ausencia de checkout como vigencia indefinida.

---

#### 46. Minimización de datos

`active_checkin_session` no deberá incluir:

- coordenadas;
- precisión GPS;
- distancia a geocerca;
- fotografía;
- IP;
- user agent;
- información completa del dispositivo;
- PIN;
- punto físico de marcación;
- dirección;
- notas;
- motivo de corrección;
- historial de eventos;
- actor administrativo que corrigió;
- evidencia biométrica.

Estos datos podrán conservarse en auditoría o evidencia física con sus
políticas de acceso y retención.

---

#### 47. Relación con tareas posteriores

##### AUTH-CTX-012

Definirá `operational_role`.

El check-in no creará, completará ni cambiará el rol.

##### AUTH-CTX-013

Definirá sede y área operativas.

La sede del turno será autoritativa y el check-in solo confirmará
coherencia.

##### AUTH-CTX-014

Definirá la relación entre:

- identidad técnica del dispositivo;
- sesión de actor;
- turno;
- sesión de check-in.

##### AUTH-CTX-015

Congelará códigos, severidades, alcance de bloqueo y `lane_readiness`.

##### AUTH-CTX-017

Consumirá `authorization_requirement` y distinguirá `N`, `T` y `T+C`.

##### AUTH-CTX-020

Evaluará el carril operativo utilizando:

- turno;
- check-in;
- rol;
- territorio;
- grants;
- denegaciones.

##### AUTH-CTX-024

Definirá evidencia auditable de la sesión utilizada.

##### AUTH-CTX-025

Diseñará el contrato SQL de `get_access_context`, incluyendo:

- sesión canónica;
- coincidencia exacta;
- estado;
- expiración;
- detección de concurrencia;
- fail closed.

##### AUTH-CTX-027

Impedirá que las aplicaciones repliquen lógica de “último check-in abierto”.

##### AUTH-CTX-028

Diseñará compatibilidad con:

- `attendance_logs`;
- check-ins sin `shift_id`;
- emparejamiento legacy;
- `get_operational_context`;
- `checked_in_now`;
- ausencia de sesiones canónicas;
- check-out global por empleado;
- área de check-in nula;
- colas y consumidores existentes.

##### AUTH-CTX-029

Definirá invalidación por:

- check-in;
- check-out;
- expiración;
- auto-checkout;
- corrección;
- fin o cancelación del turno.

##### AUTH-CTX-030

Definirá pruebas contractuales de:

- ausencia;
- sesión activa;
- sesión cerrada;
- expiración;
- duplicados;
- otro actor;
- otro turno;
- otra sede;
- área incompatible;
- turno nocturno;
- check-in temprano;
- cola offline;
- dispositivo compartido.

##### BLOQUE E1

Deberá verificar la operación real de:

- marcación;
- correcciones;
- colas offline;
- puntos externos;
- auto-checkout;
- excepciones manuales.

##### BLOQUE E2

Diseñará los procesos objetivo de asistencia y corrección.

##### BLOQUE E3

Definirá la fuente física, relaciones, exposición, RLS y retención.

##### BLOQUE E4

Diseñará colas, reintentos, sincronización y eventos operativos.

##### BLOQUE E5

Convertirá el diseño aprobado en paquetes implementables.

##### BLOQUE R

Implementará físicamente sesiones, funciones, migraciones, protecciones y
compatibilidad.

---

#### 48. Fuera del alcance

AUTH-CTX-011 no:

- registra check-in;
- registra check-out;
- diseña la interfaz de ANIMA;
- define geocercas;
- define tolerancias físicas;
- define biometría;
- define fotografías;
- define correcciones laborales;
- crea auto-checkout;
- diseña colas offline;
- crea sesiones físicas;
- modifica `attendance_logs`;
- crea tablas;
- crea triggers;
- crea funciones SQL;
- crea RPC;
- crea RLS;
- crea migraciones;
- modifica Supabase;
- modifica aplicaciones;
- define rol operativo;
- define sede o área operativas;
- decide permisos;
- decide autorización final.

Cada responsabilidad posterior tiene destino explícito en la sección 47.

---

#### 49. Riesgos controlados

##### Riesgo 1 — Último check-in abierto tratado como sesión válida

Control:

```text
sesión canónica + actor + turno + estado + vigencia
```

##### Riesgo 2 — Evento offline concede permisos

Control:

```text
sin confirmación de servidor → sin efecto
```

##### Riesgo 3 — Check-out de otra jornada cierra la sesión

Control:

```text
evento terminal vinculado por checkin_session_id
```

##### Riesgo 4 — Punto físico reemplaza sede operativa

Control:

```text
site_id operativo
≠
geofence_site_id
```

##### Riesgo 5 — Sesión sobrevive al turno

Control:

```text
fin efectivo <= active_shift.ends_at
```

##### Riesgo 6 — Duplicados por reintento

Control:

```text
idempotencia + candidato único
```

##### Riesgo 7 — Check-in crea rol o permiso

Control:

```text
evidencia contextual
≠
grant
```

##### Riesgo 8 — Cierre bloquea administración

Control:

```text
check-out afecta carril operativo
≠
carril base
```

---

#### 50. Criterios de aprobación

AUTH-CTX-011 podrá aprobarse cuando se acepte que:

1. `active_checkin_session` conserva la forma de `AccessContext@1.0.0`;
2. la tarea es una aclaración normativa compatible;
3. la sesión se resuelve exclusivamente en servidor;
4. una solicitud no es un check-in confirmado;
5. una cola offline pendiente no concede autoridad;
6. la transacción debe estar confirmada;
7. la sesión debe tener identificador estable;
8. el actor efectivo debe ser empleado;
9. el empleado debe estar activo;
10. la sesión debe pertenecer al mismo empleado;
11. debe existir `active_shift`;
12. `shift_id` debe coincidir exactamente;
13. el check-in no selecciona el turno;
14. un check-in sin turno no crea contexto;
15. `site_id` representa sede operativa;
16. el punto físico de marcación permanece separado;
17. el punto externo puede ser válido sin cambiar sede;
18. `area_id` puede ser nulo;
19. un área declarada debe coincidir con el turno;
20. el check-in no crea un área;
21. `checked_in_at` es timestamp confirmado;
22. marcar temprano no habilita antes del turno;
23. `expires_at` puede ser nulo;
24. ninguna sesión sobrevive al fin del turno;
25. una sesión activa tiene `checked_out_at = null`;
26. check-out confirmado cierra la sesión;
27. eventos terminales deben pertenecer a la sesión;
28. cualquier checkout posterior no cierra todas las sesiones;
29. el fin del turno revoca la sesión activa;
30. la cancelación del turno revoca la sesión activa;
31. solo `ACTIVE` satisface el prerrequisito;
32. `CLOSED` no lo satisface;
33. `EXPIRED` no lo satisface;
34. `INVALID` no lo satisface;
35. una corrección no crea autoridad retroactiva;
36. reintentos no crean varias sesiones;
37. cero candidatos produce `null`;
38. un candidato válido produce el nodo;
39. varios candidatos producen ambigüedad y `null`;
40. ausencia de check-in puede ser normal;
41. permisos `N` no dependen de check-in;
42. permisos `T` no dependen de check-in;
43. permisos `T+C` exigen sesión activa;
44. un check-in incompatible no se ignora silenciosamente;
45. el check-in no modifica el carril base;
46. `BASE_OR_OPERATIONAL` conserva carriles independientes;
47. `BASE_AND_OPERATIONAL` exige ambos componentes;
48. el check-in no crea rol operativo;
49. el dispositivo no posee check-in laboral propio;
50. la sesión de actor del dispositivo es distinta;
51. la simulación no crea sesión real;
52. el snapshot se invalida al cambiar la sesión;
53. AUTH-CTX-015 congelará códigos y severidades;
54. AUTH-CTX-025 diseñará el productor SQL;
55. AUTH-CTX-028 diseñará compatibilidad legacy;
56. AUTH-CTX-029 definirá invalidación;
57. AUTH-CTX-030 definirá pruebas contractuales;
58. E1, E2, E3, E4, E5 y BLOQUE R tienen responsabilidades explícitas;
59. no se implementa código, migraciones ni cambios en Supabase.

---

#### 51. Estado final de la propuesta

| Tarea        | Estado      | Relación                  |
| ------------ | ----------- | ------------------------- |
| AUTH-CTX-010 | APROBADA    | Tarea anterior            |
| AUTH-CTX-011 | APROBADA    | Tarea actual              |
| AUTH-CTX-012 | NO INICIADA | Tarea siguiente reservada |

La continuidad propuesta queda:

```text
AUTH-CTX-010 — APROBADA
        ↓
AUTH-CTX-011 — APROBADA
        ↓
AUTH-CTX-012 — NO INICIADA
```

No se avanza a AUTH-CTX-012 hasta recibir aprobación explícita de
AUTH-CTX-011.

### ✅ AUTH-CTX-012 — Incluir rol operativo efectivo

**Estado:** APROBADA  
**Bloque:** BLOQUE E — Contexto y decisión de autorización unificados  
**Naturaleza:** Refinamiento documental del nodo `operational_role` dentro de `AccessContext`  
**Implementación física:** No incluida  
**Tarea anterior vigente:** AUTH-CTX-011 — APROBADA  
**Tarea posterior reservada:** AUTH-CTX-013 — Incluir sede y área operativas  
**Contrato afectado:** `AccessContext@1.0.0`  
**Nodo afectado:** `operational_role`  
**Cambio contractual:** Aclaración normativa compatible; no cambia la forma publicada  
**Cambios físicos permitidos:** No

Esta tarea define cómo `AccessContext` resuelve el rol operativo efectivo del
actor laboral a partir del turno publicado y vigente, verificando que el rol:

- pertenece al catálogo operativo canónico;
- está activo;
- coincide exactamente con el turno;
- está habilitado en la sede del turno;
- es compatible con el área del turno;
- no procede del rol base;
- no procede de perfiles predeterminados;
- no procede del dispositivo;
- no procede de navegación;
- no constituye un permiso;
- no constituye un bypass;
- no mezcla el carril base con el carril operativo.

No modifica la estructura raíz de `AccessContext`, no agrega campos, no cambia
`contract_version`, no cambia `schema_version`, no implementa SQL, RPC, RLS,
migraciones, constraints, backfills, aplicaciones ni cambios físicos en
Supabase.

---

#### 1. Objetivo

Definir el nodo `operational_role` de manera que Vento OS pueda responder
inequívocamente:

1. cuál código de rol operativo fue asignado al turno vigente;
2. si dicho código existe en el catálogo operativo canónico;
3. si el rol está activo en `resolved_at`;
4. si pertenece al catálogo correcto;
5. si está habilitado en la sede del turno;
6. si es compatible con el área del turno;
7. si el rol requiere un área específica;
8. cómo se tratan habilitaciones de sede completa;
9. cómo se tratan habilitaciones por área;
10. qué ocurre con roles legacy o deprecados;
11. qué ocurre cuando el mismo texto existe en el catálogo base y operativo;
12. qué ocurre cuando el rol no posee permisos asignados;
13. qué ocurre cuando falta check-in;
14. qué ocurre cuando el rol está bien asignado pero el territorio es
    incompatible;
15. cuándo el nodo debe ser `null`;
16. cuándo puede existir con validaciones territoriales negativas;
17. cómo afecta a permisos `N`, `T` y `T+C`;
18. cómo mantener separados los carriles;
19. cómo impedir fallbacks y bypasses;
20. cómo preservar determinismo, trazabilidad y fail closed.

---

#### 2. Base normativa

AUTH-CTX-012 conserva sin cambios las decisiones aprobadas en:

- ADR-AUTH-001;
- AUTH-MOD-001 — Identidad laboral y actor efectivo;
- AUTH-MOD-002 — Separar rol base de rol operativo;
- AUTH-MOD-005 — Definir roles operativos;
- AUTH-MOD-006 — Definir casos híbridos administrativo-operativos;
- AUTH-MOD-007 — Definir sede asignada y sede activa;
- AUTH-MOD-008 — Definir área asignada y área activa;
- AUTH-MOD-009 — Definir turno publicado;
- AUTH-MOD-010 — Definir check-in activo;
- AUTH-MOD-011 — Definir sesión en dispositivo compartido;
- AUTH-MOD-018 — Definir precedencia entre permisos base y operativos;
- AUTH-MOD-019 — Definir reglas de denegación explícita;
- AUTH-CAT-006 — Definir modalidad de autorización;
- AUTH-CAT-007 — Clasificar permisos operativos;
- AUTH-CAT-012 — Definir prerrequisitos de turno y check-in;
- AUTH-CAT-013 — Definir permisos que exigen área activa;
- AUTH-CAT-014 — Definir permisos que admiten dispositivo compartido;
- AUTH-RBAC-009 a AUTH-RBAC-021 — Matrices operativas canónicas;
- AUTH-RBAC-025 — Dataset canónico de matriz operativa;
- AUTH-CTX-001 — Diseñar `AccessContext`;
- AUTH-CTX-004 — Versionar contratos;
- AUTH-CTX-005 a AUTH-CTX-011 — Identidad, actor, empleado, rol base,
  cobertura administrativa, turno y check-in.

Principios heredados obligatorios:

```text
ROL OPERATIVO EFECTIVO
=
ROL ASIGNADO AL TURNO PUBLICADO Y VIGENTE
+
VALIDACIÓN DEL CATÁLOGO
+
VALIDACIÓN DE SEDE
+
VALIDACIÓN DE ÁREA CUANDO APLIQUE
```

```text
ROL OPERATIVO
≠
ROL BASE
```

```text
ROL OPERATIVO
≠
PERMISO
```

```text
ROL OPERATIVO
≠
PERFIL PREDETERMINADO
```

```text
ROL OPERATIVO
≠
ROL DE NAVEGACIÓN
```

```text
ROL OPERATIVO
≠
DISPOSITIVO
```

```text
SIN TURNO VÁLIDO
→
SIN ROL OPERATIVO EFECTIVO
```

---

#### 3. Catálogo operativo canónico vigente

El catálogo canónico aprobado contiene doce roles operativos:

```text
OPERACIÓN SATÉLITE
├── cajero_satelite
├── barista_satelite
├── cocinero_satelite
├── servicio_salon
├── mostrador_satelite
└── operador_integral_satelite

PRODUCCIÓN
├── produccion_cocina
├── produccion_panaderia
└── produccion_reposteria

LOGÍSTICA
├── bodeguero
└── conductor_logistica

COORDINACIÓN OPERATIVA
└── gerencia_operativa
```

El código:

```text
propietario_admin
```

es no canónico y está en proceso de deprecación.

No podrá producir `operational_role`.

La incorporación, renombre, reactivación o retiro de un rol operativo exige
cambio contractual y nueva versión de los datasets afectados.

---

#### 4. Forma contractual conservada

AUTH-CTX-012 conserva exactamente la forma conceptual publicada:

```ts
type OperationalRoleContext = {
  role_code: string;
  shift_id: string;
  site_id: string;
  area_id: string | null;
  valid_for_site: boolean;
  valid_for_area: boolean;
};
```

No se agregan propiedades.

La publicación permanece:

```text
AccessContext
contract_version = 1.0.0
schema_version   = 1.0.0
```

---

#### 5. Semántica raíz de `operational_role`

`operational_role` representa el rol operativo canónico observado en el
`active_shift`, acompañado de la validación territorial necesaria para
determinar si puede participar en el carril operativo.

Fuente única:

```text
active_shift.operational_role_code
→ catálogo operativo canónico
→ habilitación de sede
→ compatibilidad de área
→ operational_role
```

El nodo no contiene:

- permisos;
- grants;
- denegaciones;
- bypasses;
- navegación;
- aplicaciones;
- acciones autorizadas;
- decisión final.

---

#### 6. Condición mínima de existencia

Para producir un nodo no nulo deberán cumplirse como mínimo:

1. existe `employee`;
2. el empleado está activo;
3. existe `active_shift`;
4. el turno pertenece al actor efectivo;
5. `active_shift.operational_role_code` está presente;
6. el código es canónico;
7. el rol existe en el catálogo operativo;
8. el rol está activo;
9. el rol no está deprecado;
10. la referencia no es ambigua;
11. `shift_id`, `site_id` y `area_id` proceden del mismo turno.

Si falla cualquiera de estas condiciones básicas:

```text
operational_role = null
```

y deberá registrarse el problema estructural aplicable.

---

#### 7. Fuente exclusiva: el turno

El código efectivo procede exclusivamente de:

```text
active_shift.operational_role_code
```

No procede de:

- `employees.role`;
- `base_role`;
- `employee_site_operational_profiles.default_operational_role`;
- último turno;
- último rol usado;
- área seleccionada;
- sede seleccionada;
- `navigation_role`;
- plantilla de dispositivo;
- sesión de dispositivo;
- permiso solicitado;
- aplicación abierta;
- pantalla visitada;
- nombre del cargo;
- nombre del área;
- alias informal;
- heurística por oficio;
- cadena enviada por el frontend.

---

#### 8. Código asignado y código efectivo

En `AccessContext@1.0.0` el contrato publica un único:

```text
role_code
```

Este valor será exactamente el código canónico resuelto desde el turno.

Regla:

```text
role_code
=
active_shift.operational_role_code validado
```

No se aplicará dentro de esta tarea:

- traducción aproximada;
- normalización por nombre;
- coincidencia parcial;
- `LIKE`;
- `ILIKE`;
- pluralización;
- prefijos;
- inferencia por familia;
- conversión de rol base a operativo.

Una adaptación legacy explícita solo podrá diseñarse en AUTH-CTX-028 y deberá
producir un código canónico antes de ingresar al contrato.

---

#### 9. Separación de namespaces

La resolución deberá consultar explícitamente el catálogo operativo.

```text
operational_role_code
→ operational_roles
```

No:

```text
operational_role_code
→ roles
```

El hecho de que un texto exista también en el catálogo base no convierte
automáticamente el rol operativo en ambiguo cuando la fuente y el namespace
son explícitos.

Caso actual:

```text
bodeguero
```

La resolución operacional deberá interpretarlo exclusivamente como rol
operativo cuando procede del campo operacional del turno.

Sin embargo, cualquier consumidor que use una cadena no tipada para consultar
ambos catálogos constituye una incompatibilidad legacy y deberá corregirse en
AUTH-CTX-028 y AUTH-CTX-027.

El retiro físico del duplicado base se ejecutará únicamente mediante
AUTH-DB-020 y AUTH-DB-030 después de aprobar compatibilidad, backfill y
adopción.

---

#### 10. Rol activo

El rol deberá estar activo en `resolved_at`.

Un rol inactivo o deprecado:

```text
operational_role = null
```

aunque:

- el turno siga vigente;
- el check-in esté activo;
- exista una matriz histórica;
- el frontend lo muestre;
- el dispositivo lo reconozca;
- el empleado lo haya usado antes.

La desactivación del rol deberá invalidar snapshots mediante AUTH-CTX-029.

---

#### 11. Rol no canónico o deprecado

Los siguientes casos no producen rol efectivo:

- `propietario_admin`;
- código legacy no mapeado;
- rol base usado como operativo;
- código inexistente;
- código inactivo;
- alias no aprobado;
- valor vacío;
- valor ambiguo;
- nombre humano usado como código.

Resultado:

```text
operational_role = null
```

No se utilizará un rol “más parecido”.

---

#### 12. `shift_id`

El nodo deberá conservar:

```text
operational_role.shift_id
=
active_shift.shift_id
```

No podrá referir:

- otro turno;
- una plantilla;
- un perfil;
- una sesión anterior;
- un turno cancelado;
- un turno futuro;
- una simulación real presentada como efectiva.

Una discrepancia produce:

```text
operational_role = null
```

y problema estructural.

---

#### 13. `site_id`

El nodo deberá conservar:

```text
operational_role.site_id
=
active_shift.site_id
```

Este campo representa la sede en la cual el turno intenta activar el rol.

No representa:

- cobertura administrativa;
- sede primaria;
- sede seleccionada;
- punto de check-in;
- sede del dispositivo;
- sede del recurso;
- cualquier sede en la que el empleado haya trabajado antes.

AUTH-CTX-013 convertirá esta referencia en `operational_site`.

---

#### 14. `area_id`

El nodo deberá conservar:

```text
operational_role.area_id
=
active_shift.area_id
```

Puede ser `null` únicamente cuando el rol y su habilitación territorial
permitan operación sin área específica.

No podrá completarse desde:

- perfil operativo;
- área del dispositivo;
- área seleccionada;
- último check-in;
- nombre del rol;
- primera área habilitada;
- única área encontrada;
- área principal del empleado.

AUTH-CTX-013 convertirá esta referencia en `operational_area`.

---

#### 15. Habilitación por sede

`valid_for_site` indica si el rol operativo está habilitado de forma vigente
en la sede exacta del turno.

Regla conceptual:

```text
valid_for_site = true
```

solo cuando existe una habilitación canónica activa equivalente a:

```text
site_operational_roles
role_code = operational_role.role_code
site_id   = operational_role.site_id
is_active = true
```

y además:

- la sede existe;
- la sede está activa;
- la sede es operativa;
- el rol está activo;
- la relación no está deprecada;
- no existe contradicción de configuración.

La asignación laboral del empleado a una sede y la habilitación del rol en la
sede son validaciones diferentes.

---

#### 16. Resultado de `valid_for_site`

Casos:

```text
rol habilitado en la sede
→ valid_for_site = true
```

```text
rol no habilitado en la sede
→ valid_for_site = false
```

```text
sede inexistente, inactiva o incompatible
→ valid_for_site = false
```

```text
habilitaciones contradictorias
→ valid_for_site = false
→ structural_issue
```

El nodo podrá conservarse con:

```text
valid_for_site = false
```

cuando el código del rol sea canónico y activo, con el fin de exponer el
hecho observado y permitir diagnóstico estructurado.

Pero ese nodo no podrá habilitar el carril operativo.

---

#### 17. Habilitación por área

`valid_for_area` indica si la combinación de:

```text
role_code
+
site_id
+
area_id
```

es compatible con la definición canónica del rol y con las habilitaciones
territoriales vigentes.

La validación deberá considerar:

- si el rol requiere área;
- si la sede habilita el rol por área específica;
- si la sede habilita el rol como función site-wide;
- si el área existe;
- si el área pertenece a la sede;
- si el área está activa;
- si la habilitación está activa;
- si el rol puede operar sin área.

---

#### 18. Roles con área obligatoria

Cuando la definición canónica del rol establezca:

```text
requires_area = true
```

será obligatorio:

```text
area_id != null
```

y deberá existir una habilitación activa compatible con dicha área.

Resultado:

```text
area_id = null
→ valid_for_area = false
```

No se completará el área desde ningún fallback.

La matriz descriptiva aprobada identifica como roles normalmente ligados a
área:

- `cajero_satelite`;
- `barista_satelite`;
- `cocinero_satelite`;
- `servicio_salon`;
- `mostrador_satelite`;
- `produccion_cocina`;
- `produccion_panaderia`;
- `produccion_reposteria`;
- `bodeguero`.

La obligatoriedad física final deberá provenir del catálogo canónico
versionado, no de comparaciones de texto dentro de aplicaciones.

---

#### 19. Roles con área dependiente de la sede

Para:

- `operador_integral_satelite`;
- `gerencia_operativa`;

la necesidad de área puede depender de la configuración aprobada de la sede.

La resolución deberá consumir una política explícita.

No se admitirá:

- asumir área obligatoria por nombre;
- asumir área opcional por familia;
- usar la primera configuración encontrada;
- convertir configuración incompleta en site-wide.

Si la sede no define de forma inequívoca la modalidad:

```text
valid_for_area = false
```

---

#### 20. Conductor logístico

`conductor_logistica` podrá operar con:

- un área general válida; o
- una habilitación site-wide explícita que permita ausencia de área.

No se asumirá que:

```text
conductor_logistica
→ cualquier sede
→ cualquier área
```

La sede del turno continúa siendo obligatoria.

Cuando `area_id = null`, la ausencia solo será válida si la configuración
canónica de la sede lo permite expresamente.

---

#### 21. Habilitación site-wide

Una habilitación site-wide se representa conceptualmente mediante una
asignación de rol a sede sin restricción de área.

No significa:

- todas las sedes;
- todas las organizaciones;
- todas las aplicaciones;
- todos los permisos;
- cualquier área sin validación;
- bypass territorial.

Reglas:

1. solo aplica a la sede exacta;
2. deberá estar activa;
3. deberá ser compatible con la definición del rol;
4. si el rol exige área, `area_id` continúa siendo obligatorio;
5. si existe área, deberá pertenecer a la sede;
6. no amplía permisos;
7. no reemplaza el territorio del recurso.

---

#### 22. Habilitación por área específica

Una habilitación por área exige coincidencia exacta:

```text
configured.area_id
=
active_shift.area_id
```

No se utilizará:

- `area_kind` como sustituto de `area_id`;
- nombre humano;
- coincidencia parcial;
- área equivalente;
- área de otra sede;
- tipo de área parecido;
- jerarquía implícita.

Un rol habilitado en Repostería no queda habilitado automáticamente en
Panadería aunque ambos pertenezcan a Producción.

---

#### 23. Precedencia entre habilitación site-wide y específica

La resolución no sumará configuraciones contradictorias.

Reglas:

1. una coincidencia exacta por área puede validar esa área;
2. una habilitación site-wide puede validar una operación sin área cuando el
   rol lo permita;
3. una habilitación site-wide no anula una prohibición o restricción
   explícita futura;
4. filas duplicadas equivalentes se normalizarán como una sola evidencia;
5. filas contradictorias producirán `valid_for_area = false`;
6. no se elegirá la configuración “más permisiva”;
7. denegaciones explícitas se evaluarán posteriormente en
   `AuthorizationDecision`, sin ser absorbidas por este nodo.

---

#### 24. Significado de `valid_for_area`

Casos:

```text
rol con área obligatoria
+
área exacta válida
→ valid_for_area = true
```

```text
rol con área obligatoria
+
area_id null
→ valid_for_area = false
```

```text
rol con área opcional
+
area_id null
+
habilitación site-wide explícita
→ valid_for_area = true
```

```text
area_id existente
+
área pertenece a otra sede
→ valid_for_area = false
```

```text
configuración contradictoria
→ valid_for_area = false
→ structural_issue
```

---

#### 25. Rol territorialmente inválido

Cuando el rol existe y está activo, pero:

```text
valid_for_site = false
```

o:

```text
valid_for_area = false
```

el nodo podrá existir para representar la asignación observada, pero:

```text
lane_readiness.operational
→ no disponible
```

y ningún permiso operativo podrá autorizarse.

AUTH-CTX-015 definirá los códigos y severidades.

AUTH-CTX-020 consumirá los flags dentro del carril operativo.

---

#### 26. Relación con `active_shift`

El turno aporta:

- `shift_id`;
- `role_code`;
- `site_id`;
- `area_id`.

AUTH-CTX-012 aporta:

- validación canónica del rol;
- validación de sede;
- validación de área.

El nodo no podrá existir sin `active_shift`.

Regla:

```text
active_shift = null
→ operational_role = null
```

---

#### 27. Relación con `active_checkin_session`

El check-in no crea ni selecciona el rol.

Por tanto:

```text
active_shift válido
+
rol territorialmente válido
+
sin check-in
→ operational_role puede existir
```

La ausencia de check-in afecta únicamente permisos cuyo prerrequisito sea
`T+C`.

Un check-in incompatible tampoco cambiará el código del rol.

La incompatibilidad se registrará y afectará `lane_readiness` según
AUTH-CTX-015.

---

#### 28. Rol válido sin permisos asignados

Un rol operativo puede ser canónico, activo y territorialmente válido aunque
no tenga grants en la matriz operativa.

En ese caso:

```text
operational_role válido
+
0 grants coincidentes
→ ninguna acción autorizada por carril operativo
```

No se tratará como error del contexto.

La ausencia de permisos es una condición de matriz y se evaluará en
AUTH-CTX-020.

No se utilizarán permisos del rol base como compensación.

---

#### 29. Matriz operativa

`operational_role` no incorpora las filas de
`operational_role_permissions`.

La matriz se consultará posteriormente contra:

- permiso solicitado;
- rol operativo;
- sede;
- área;
- tipo de área;
- recurso;
- denegaciones.

AUTH-CTX-020 definirá la decisión del carril operativo.

AUTH-CTX-026 diseñará el evaluador unificado.

---

#### 30. Independencia de la aplicación

El rol operativo no cambia según la aplicación solicitada.

Ejemplo:

```text
role_code = cajero_satelite
```

permanece igual en:

- PULSO;
- NEXO;
- SHELL;
- cualquier aplicación autorizada.

Cada aplicación y cada acción requieren permisos canónicos distintos.

No existirán roles como:

- `cajero_pulso`;
- `cajero_nexo`;
- `bodeguero_app`;
- `gerente_operativo_fogo`.

---

#### 31. Casos híbridos

Un empleado puede tener simultáneamente:

```text
base_role = supervisor
operational_role = cajero_satelite
```

Los contextos permanecen separados.

El rol operativo:

- no reemplaza el rol base;
- no reduce cobertura administrativa;
- no amplía cobertura administrativa;
- no hereda permisos base;
- no convierte el caso en un nuevo rol combinado.

La modalidad del permiso determina qué carril o carriles participan.

---

#### 32. Propietario y gerente general

`propietario` y `gerente_general` no reciben rol operativo por jerarquía.

Para operar mediante el carril operativo requieren:

- `active_shift`;
- código operativo canónico;
- rol activo;
- habilitación de sede;
- compatibilidad de área;
- check-in cuando el permiso lo exija;
- grant operativo aplicable.

Sus permisos base podrán autorizar por el carril base únicamente cuando la
modalidad y el alcance del permiso lo permitan.

---

#### 33. `gerencia_operativa`

`gerencia_operativa` es un rol operativo ordinario de coordinación.

No es:

- gerente general;
- propietario;
- bypass;
- acceso total;
- permiso de todas las sedes;
- autorización administrativa;
- sustituto de un rol base.

Requiere:

- turno;
- sede;
- área cuando la configuración lo exija;
- grants exactos;
- contexto válido.

---

#### 34. `operador_integral_satelite`

`operador_integral_satelite` no es superusuario.

Su carácter integrado significa que puede recibir un conjunto operativo más
amplio de capacidades en formatos pequeños, pero cada permiso deberá estar
asignado explícitamente.

No podrá:

- heredar todos los permisos satélite;
- operar en cualquier sede;
- ignorar el área;
- sustituir roles de producción;
- actuar sin turno.

---

#### 35. Perfil operativo predeterminado

El perfil predeterminado puede apoyar:

- creación de turnos;
- sugerencias administrativas;
- UX de planificación;
- defaults controlados.

No participa en autorización.

Regla:

```text
turno sin role_code
+
perfil con default_operational_role
→ operational_role = null
```

La corrección deberá realizarse en la fuente del turno.

---

#### 36. Rol de navegación

`navigation_role` podrá servir para:

- presentación inicial;
- menú sugerido;
- plantilla de dispositivo;
- experiencia controlada.

No podrá:

- crear rol operativo;
- sustituir el turno;
- cambiar permisos;
- resolver sede;
- resolver área;
- corregir un código inválido.

Una discrepancia entre navegación y contexto no se resolverá ampliando
autoridad.

AUTH-CTX-014 definirá la relación con dispositivos.

---

#### 37. Dispositivo compartido

La plantilla o instancia del dispositivo puede declarar una expectativa de
rol, pero el rol efectivo continúa procediendo del turno del empleado actor.

El dispositivo:

- no asigna rol;
- no conserva el rol del actor anterior;
- no presta su rol de navegación;
- no convierte al usuario técnico en trabajador;
- no amplía la sede;
- no amplía el área;
- no amplía permisos.

Una incompatibilidad deberá bloquear la sesión o la acción según
AUTH-CTX-014 y AUTH-CTX-015.

---

#### 38. Simulación

La simulación puede evaluar hipotéticamente otro rol operativo dentro de un
contrato separado.

No podrá:

- modificar `operational_role` real;
- crear turno;
- crear check-in;
- persistir asignación;
- habilitar mutaciones;
- reutilizar `WOULD_ALLOW` como autoridad.

El contexto real continúa resolviendo el código del turno real.

---

#### 39. Procesos de sistema

Un actor `SYSTEM` autónomo no recibe rol operativo laboral.

Resultado:

```text
operational_role = null
```

Cuando una automatización actúe delegadamente en nombre de un empleado, el
contrato de delegación deberá conservar al empleado como actor efectivo y
resolver el mismo contexto canónico.

Un proceso técnico autorizado utilizará permisos de sistema explícitos, no un
rol operativo ficticio.

---

#### 40. Relación con sede y área asignadas al empleado

La habilitación del rol en sede y área no reemplaza la validación de que el
empleado puede trabajar en dicho territorio.

AUTH-CTX-013 deberá combinar:

- sede del turno;
- área del turno;
- asignaciones laborales;
- habilitación del rol;
- estado territorial.

Por tanto:

```text
valid_for_site = true
```

no significa por sí solo que la asignación laboral del empleado sea válida.

La validación territorial completa corresponde a AUTH-CTX-013.

---

#### 41. Relación con permisos `N`, `T` y `T+C`

##### Permiso `N`

No requiere turno ni rol operativo.

La ausencia de `operational_role` no bloquea el carril base.

##### Permiso `T`

Requiere:

- `active_shift`;
- `operational_role`;
- `valid_for_site = true`;
- `valid_for_area = true` cuando aplique.

No requiere check-in.

##### Permiso `T+C`

Requiere además:

- `active_checkin_session`.

El check-in no modifica el rol.

---

#### 42. Relación con modalidades de autorización

##### `BASE_ONLY`

No consume `operational_role`.

##### `OPERATIONAL_ONLY`

Solo podrá autorizar cuando el carril operativo esté completo.

##### `BASE_OR_OPERATIONAL`

Cada carril se evalúa de manera independiente.

Un rol operativo inválido no bloquea automáticamente un carril base válido.

##### `BASE_AND_OPERATIONAL`

Exige simultáneamente:

- carril base válido;
- carril operativo válido;
- rol operativo territorialmente válido;
- demás prerrequisitos del permiso.

---

#### 43. Relación con `lane_readiness`

Reglas conceptuales:

```text
active_shift = null
→ operational_role = null
→ carril operativo no disponible
```

```text
rol inexistente o inactivo
→ operational_role = null
→ problema estructural
```

```text
rol activo
+
valid_for_site = false
→ carril operativo no disponible
```

```text
rol activo
+
valid_for_site = true
+
valid_for_area = false
→ carril operativo no disponible cuando el territorio exige área
```

```text
rol válido territorialmente
+
check-in ausente
→ puede estar listo para permisos T
→ no está listo para permisos T+C
```

AUTH-CTX-015 congelará los estados y razones exactas.

---

#### 44. Snapshot y obsolescencia

`operational_role` forma parte del snapshot inmutable.

El contexto queda potencialmente obsoleto cuando ocurre:

- cambio de rol en el turno;
- publicación de nueva revisión;
- cancelación del turno;
- desactivación del rol;
- deprecación del rol;
- cambio de sede;
- cambio de área;
- activación o desactivación de una habilitación territorial;
- cambio de `requires_area`;
- corrección de configuración contradictoria;
- cambio del actor efectivo;
- fin del turno.

AUTH-CTX-029 definirá invalidación, caché y fingerprint.

---

#### 45. Determinismo

Para el mismo:

- actor efectivo;
- `active_shift`;
- catálogo operativo;
- habilitaciones territoriales;
- catálogos de sede y área;
- `resolved_at`;

la resolución deberá producir exactamente el mismo resultado.

No dependerá de:

- orden físico de filas;
- último rol usado;
- aplicación abierta;
- selector visual;
- dispositivo;
- perfil;
- heurística;
- primera coincidencia SQL;
- caché obsoleta.

---

#### 46. Casos de ejemplo

##### Caso A — Cajero válido en Vento Café

```text
active_shift.role_code = cajero_satelite
site_id = VENTO_CAFE
area_id = CAJA_VENTO_CAFE
rol activo
habilitación exacta vigente
```

Resultado:

```text
operational_role = {
  role_code: "cajero_satelite",
  shift_id: "...",
  site_id: "VENTO_CAFE",
  area_id: "CAJA_VENTO_CAFE",
  valid_for_site: true,
  valid_for_area: true
}
```

##### Caso B — Cajero sin área

```text
role_code = cajero_satelite
area_id = null
requires_area = true
```

Resultado:

```text
operational_role != null
valid_for_site = true
valid_for_area = false
```

El carril operativo no queda disponible.

##### Caso C — Rol inexistente

```text
role_code = cajero_principal
```

Resultado:

```text
operational_role = null
structural_issue = rol operativo desconocido
```

##### Caso D — Rol inactivo

```text
role_code canónico
is_active = false
```

Resultado:

```text
operational_role = null
```

##### Caso E — Rol no habilitado en sede

```text
role_code = produccion_reposteria
site_id = SAUDO
sin habilitación vigente
```

Resultado:

```text
operational_role != null
valid_for_site = false
valid_for_area = false
```

##### Caso F — Área de otra sede

```text
site_id = SAUDO
area_id = CAJA_VENTO_CAFE
```

Resultado:

```text
operational_role != null
valid_for_site según configuración
valid_for_area = false
structural_issue = área incompatible
```

##### Caso G — Conductor site-wide

```text
role_code = conductor_logistica
site_id = CENTRO_PRODUCCION
area_id = null
habilitación site-wide explícita
área opcional aprobada
```

Resultado:

```text
valid_for_site = true
valid_for_area = true
```

##### Caso H — Gerente general sin turno

```text
base_role = gerente_general
active_shift = null
```

Resultado:

```text
operational_role = null
```

El carril base permanece independiente.

##### Caso I — Perfil con rol, turno sin rol

```text
default_operational_role = bodeguero
active_shift.operational_role_code = null
```

Resultado:

```text
operational_role = null
```

##### Caso J — `bodeguero` en ambos catálogos

```text
active_shift.operational_role_code = bodeguero
```

Resultado:

```text
resolver exclusivamente en operational_roles
```

La duplicidad base se trata como legado, no como fallback.

##### Caso K — Rol válido sin grants

```text
role_code válido
territorio válido
operational_role_permissions = []
```

Resultado:

```text
operational_role válido
ningún permiso operativo autorizado
```

##### Caso L — Sin check-in para permiso `T`

```text
operational_role válido
active_checkin_session = null
permiso requiere T
```

Resultado:

```text
el rol continúa efectivo
el carril puede continuar
```

##### Caso M — Sin check-in para permiso `T+C`

```text
operational_role válido
active_checkin_session = null
```

Resultado:

```text
rol efectivo conservado
carril operativo no disponible para ese permiso
```

##### Caso N — `propietario_admin`

```text
active_shift.operational_role_code = propietario_admin
```

Resultado:

```text
operational_role = null
structural_issue = rol operativo deprecado
```

---

#### 47. Inconsistencias estructurales detectables

AUTH-CTX-012 identifica las siguientes clases:

1. turno vigente sin código operativo;
2. código vacío;
3. código desconocido;
4. código inactivo;
5. código deprecado;
6. `propietario_admin` utilizado;
7. rol base utilizado como rol operativo;
8. alias no canónico;
9. conversión aproximada por nombre;
10. perfil usado como fallback;
11. dispositivo usado como fuente;
12. navegación usada como fuente;
13. código del nodo distinto al turno;
14. `shift_id` distinto al turno;
15. `site_id` distinto al turno;
16. `area_id` distinto al turno;
17. rol no habilitado en sede;
18. sede inactiva;
19. habilitación de sede inactiva;
20. área inexistente;
21. área inactiva;
22. área perteneciente a otra sede;
23. área obligatoria ausente;
24. área específica sin habilitación;
25. configuración site-wide incompatible con `requires_area`;
26. configuraciones territoriales contradictorias;
27. primera fila usada como decisión;
28. rol operativo fusionado con rol base;
29. rol válido tratado como permiso;
30. ausencia de grants compensada con rol base;
31. rol modificado según aplicación;
32. contexto reutilizado después de cambio o desactivación.

AUTH-CTX-015 deberá asignar:

- código definitivo;
- severidad;
- carril afectado;
- exposición;
- mensaje seguro;
- efecto sobre `lane_readiness`.

---

#### 48. Fail closed

Ante ausencia, contradicción o ambigüedad:

```text
operational_role = null
```

cuando el rol no sea canónico y activo.

Cuando el rol sea canónico y activo, pero la incompatibilidad sea
territorial:

```text
operational_role puede existir
valid_for_site = false
o
valid_for_area = false
```

En ambos casos queda prohibido autorizar por el carril operativo.

No se permite:

- elegir un rol por nombre parecido;
- usar el rol base;
- usar el perfil;
- usar la navegación;
- usar el dispositivo;
- completar el área;
- completar la sede;
- elegir la configuración más permisiva;
- ignorar deprecación;
- asumir grants;
- tratar jerarquía administrativa como rol operativo.

---

#### 49. Minimización de datos

`operational_role` no deberá incluir:

- nombre humano;
- descripción;
- familia;
- permisos;
- grants;
- denegaciones;
- lista de aplicaciones;
- datos del asignador;
- notas del turno;
- perfil predeterminado;
- dispositivo;
- cargo contractual;
- historial del rol;
- motivos internos de configuración.

El contrato conserva únicamente los campos publicados.

---

#### 50. Relación con tareas posteriores

##### AUTH-CTX-013

Definirá:

- `operational_site`;
- `operational_area`;
- validez de asignación laboral;
- estado de sede y área;
- compatibilidad territorial completa.

##### AUTH-CTX-014

Definirá la coherencia entre:

- dispositivo;
- sesión de actor;
- turno;
- rol operativo;
- sede;
- área.

##### AUTH-CTX-015

Congelará códigos, severidades y `lane_readiness`.

##### AUTH-CTX-017

Aportará el requisito de turno, check-in y área del permiso solicitado.

##### AUTH-CTX-020

Evaluará el carril operativo combinando:

- turno;
- check-in;
- rol;
- territorio;
- grants;
- denegaciones.

##### AUTH-CTX-023

Incluirá en la decisión final las razones de rol o territorio inválidos.

##### AUTH-CTX-024

Definirá la evidencia auditable del rol y habilitación utilizados.

##### AUTH-CTX-025

Diseñará el productor SQL de `operational_role`, incluyendo:

- catálogo correcto;
- actividad;
- habilitación por sede;
- habilitación por área;
- resolución determinista;
- fail closed.

##### AUTH-CTX-026

Diseñará el evaluador que consume el rol sin convertirlo en permiso.

##### AUTH-CTX-027

Obligará a las aplicaciones a consumir el rol centralizado y eliminar
fallbacks locales.

##### AUTH-CTX-028

Diseñará compatibilidad con:

- `employee_shifts.operational_role`;
- `site_operational_roles`;
- `operational_roles`;
- perfiles predeterminados;
- `navigation_role`;
- rol `bodeguero` duplicado;
- `propietario_admin`;
- consumidores de `get_operational_context`;
- lógica legacy de `has_operational_permission`.

##### AUTH-CTX-029

Definirá invalidación por cambios de rol o habilitación territorial.

##### AUTH-CTX-030

Definirá pruebas contractuales de:

- rol válido;
- rol ausente;
- rol inactivo;
- rol deprecado;
- sede incompatible;
- área incompatible;
- área obligatoria ausente;
- habilitación site-wide;
- casos híbridos;
- roles sin grants;
- dispositivo;
- simulación.

##### AUTH-DB-006

Incorporará el contexto canónico en RPC sensibles durante implementación.

##### AUTH-DB-007

Implementará validación canónica de sede en RPC sensibles.

##### AUTH-DB-008

Implementará validación canónica de área en RPC sensibles.

##### AUTH-DB-009

Implementará validación del permiso exacto, evitando que el rol actúe como
permiso.

##### AUTH-DB-010

Implementará validación de principal y actor efectivo.

##### AUTH-DB-011

Aplicará constraints únicamente después de backfills y reconciliación.

##### AUTH-DB-020

Migrará objetos y relaciones legacy con compatibilidad temporal.

##### AUTH-DB-027

Creará el harness de pruebas de esquema, integridad, RLS, RPC y migraciones.

##### AUTH-DB-030

Retirará objetos y rutas legacy solo después de adopción comprobada.

##### AUTH-DB-031

Certificará paridad documental, técnica y operativa.

---

#### 51. Fuera del alcance

AUTH-CTX-012 no:

- crea roles;
- renombra roles;
- elimina roles;
- activa roles;
- desactiva roles;
- asigna roles a turnos;
- asigna roles a sedes;
- asigna roles a áreas;
- modifica perfiles;
- modifica dispositivos;
- corrige turnos;
- completa áreas faltantes;
- crea grants;
- crea denegaciones;
- define permisos;
- decide el carril operativo;
- resuelve recursos;
- decide autorización final;
- crea tablas;
- crea funciones SQL;
- crea RPC;
- crea RLS;
- crea migraciones;
- ejecuta backfills;
- retira `bodeguero` del catálogo base;
- retira `propietario_admin`;
- modifica Supabase;
- modifica aplicaciones.

Cada responsabilidad posterior tiene un destino explícito en la sección 50.

---

#### 52. Riesgos controlados

##### Riesgo 1 — Rol base utilizado como operación

Control:

```text
namespace operativo explícito
```

##### Riesgo 2 — Perfil predeterminado autoriza

Control:

```text
solo active_shift.operational_role_code
```

##### Riesgo 3 — Rol habilitado en una sede se usa en otra

Control:

```text
valid_for_site exacto
```

##### Riesgo 4 — Área ausente se completa silenciosamente

Control:

```text
requires_area + area_id exacto
```

##### Riesgo 5 — Rol sin permisos obtiene acceso

Control:

```text
rol válido
≠
grant
```

##### Riesgo 6 — Jerarquía administrativa funciona como bypass

Control:

```text
rol base y rol operativo en carriles separados
```

##### Riesgo 7 — Dispositivo presta rol

Control:

```text
dispositivo no es fuente laboral
```

##### Riesgo 8 — Configuración contradictoria elige la opción permisiva

Control:

```text
contradicción
→ validación territorial falsa
→ fail closed
```

---

#### 53. Criterios de aprobación

AUTH-CTX-012 podrá aprobarse cuando se acepte que:

1. `operational_role` conserva la forma de `AccessContext@1.0.0`;
2. la tarea es una aclaración normativa compatible;
3. existen doce roles operativos canónicos;
4. `propietario_admin` no es canónico;
5. el rol procede exclusivamente del turno vigente;
6. sin `active_shift` no existe rol operativo;
7. el rol base no es fallback;
8. el perfil predeterminado no es fallback;
9. `navigation_role` no es fuente;
10. el dispositivo no es fuente;
11. la aplicación no cambia el rol;
12. el permiso solicitado no cambia el rol;
13. `role_code` debe ser canónico;
14. no se usan coincidencias aproximadas;
15. el namespace operativo es explícito;
16. `bodeguero` se resuelve contra el catálogo operativo;
17. la duplicidad base permanece como legado a retirar;
18. el rol debe estar activo;
19. un rol inactivo produce `null`;
20. un rol deprecado produce `null`;
21. el nodo conserva el `shift_id` exacto;
22. el nodo conserva el `site_id` exacto;
23. el nodo conserva el `area_id` exacto;
24. `valid_for_site` depende de habilitación vigente;
25. la sede debe existir y estar activa;
26. `valid_for_area` depende de política y configuración;
27. un rol con área obligatoria requiere `area_id`;
28. el área debe pertenecer a la sede;
29. no se completa área mediante fallback;
30. una habilitación site-wide solo aplica a la sede exacta;
31. site-wide no significa todas las áreas sin validación;
32. una habilitación por área exige coincidencia exacta;
33. configuraciones contradictorias fallan cerrado;
34. el nodo puede existir con flags territoriales falsos;
35. flags falsos impiden autorización operativa;
36. el check-in no crea el rol;
37. el rol puede existir sin check-in;
38. permisos `T` pueden continuar sin check-in;
39. permisos `T+C` exigen además sesión activa;
40. un rol válido sin grants no autoriza acciones;
41. permisos base no compensan matrices operativas vacías;
42. el rol no contiene grants;
43. el rol no contiene denegaciones;
44. `gerencia_operativa` no es bypass;
45. `operador_integral_satelite` no es superusuario;
46. propietario y gerente general requieren rol operativo real para el carril
    operativo;
47. los casos híbridos no fusionan roles;
48. actores `SYSTEM` autónomos no reciben rol laboral;
49. la simulación no modifica el contexto real;
50. AUTH-CTX-013 cerrará territorio operativo;
51. AUTH-CTX-015 congelará problemas y readiness;
52. AUTH-CTX-020 resolverá el carril operativo;
53. AUTH-CTX-025 diseñará el productor SQL;
54. AUTH-CTX-026 diseñará el evaluador;
55. AUTH-CTX-027 eliminará fallbacks locales;
56. AUTH-CTX-028 diseñará compatibilidad legacy;
57. AUTH-CTX-029 definirá invalidación;
58. AUTH-CTX-030 definirá pruebas contractuales;
59. AUTH-DB-006 a AUTH-DB-011 implementarán validaciones y constraints;
60. AUTH-DB-020, AUTH-DB-027, AUTH-DB-030 y AUTH-DB-031 controlarán
    migración, pruebas, retiro y certificación;
61. no se implementa código, migraciones ni cambios en Supabase.

---

#### 54. Estado final de la propuesta

| Tarea        | Estado      | Relación                  |
| ------------ | ----------- | ------------------------- |
| AUTH-CTX-011 | APROBADA    | Tarea anterior            |
| AUTH-CTX-012 | APROBADA    | Tarea actual              |
| AUTH-CTX-013 | NO INICIADA | Tarea siguiente reservada |

La continuidad propuesta queda:

```text
AUTH-CTX-011 — APROBADA
        ↓
AUTH-CTX-012 — APROBADA
        ↓
AUTH-CTX-013 — NO INICIADA
```

No se avanza a AUTH-CTX-013 hasta recibir aprobación explícita de
AUTH-CTX-012.

### ✅ AUTH-CTX-013 — Incluir sede y área operativas

**Estado:** APROBADA  
**Bloque:** BLOQUE E — Contexto y decisión de autorización unificados  
**Naturaleza:** Refinamiento documental de los nodos `operational_site` y `operational_area` dentro de `AccessContext`  
**Implementación física:** No incluida  
**Tarea anterior vigente:** AUTH-CTX-012 — APROBADA  
**Tarea posterior reservada:** AUTH-CTX-014 — Incluir contexto de dispositivo compartido  
**Contrato afectado:** `AccessContext@1.0.0`  
**Nodos afectados:** `operational_site`, `operational_area`  
**Cambio contractual:** Aclaración normativa compatible; no cambia la forma publicada  
**Cambios físicos permitidos:** No

Esta tarea define cómo `AccessContext` resuelve la sede y el área operativas
del actor laboral a partir del turno publicado y vigente, conservando la
separación entre:

- sede laboral asignada;
- sede administrativa;
- sede primaria;
- sede seleccionada;
- sede del turno;
- sede del check-in;
- punto físico de marcación;
- sede del dispositivo;
- sede del recurso;
- área asignada;
- área administrativa;
- área del turno;
- área del check-in;
- área del dispositivo;
- área del recurso;
- rol operativo;
- permiso;
- autorización final.

No modifica la estructura raíz de `AccessContext`, no agrega campos, no cambia
`contract_version`, no cambia `schema_version`, no implementa SQL, RPC, RLS,
migraciones, constraints, backfills, aplicaciones ni cambios físicos en
Supabase.

---

#### 1. Objetivo

Definir los nodos `operational_site` y `operational_area` de manera que Vento
OS pueda responder inequívocamente:

1. cuál es la sede operativa exacta del turno vigente;
2. si esa sede existe y está activa;
3. si el empleado posee una asignación laboral válida para esa sede;
4. cuál es el área operativa exacta cuando el turno la declara;
5. si el área pertenece a la sede operativa;
6. si el área está activa;
7. cuál es su `area_kind` canónico;
8. si el área es compatible con el rol operativo;
9. cuándo el área puede ser `null`;
10. cuándo la ausencia de área es normal;
11. cuándo la ausencia de área impide el carril operativo;
12. qué función cumple el check-in;
13. qué función cumple un punto externo de marcación;
14. qué función cumple el dispositivo compartido;
15. qué relación existe con `assigned_sites` y `assigned_areas`;
16. qué relación existe con `operational_role`;
17. qué relación existe con el territorio del recurso;
18. cómo se tratan operaciones entre sedes o áreas;
19. cuándo los nodos deben ser `null`;
20. cuándo pueden conservarse con flags negativos;
21. cómo impedir fallbacks permisivos;
22. cómo preservar determinismo, trazabilidad y fail closed.

---

#### 2. Base normativa

AUTH-CTX-013 conserva sin cambios las decisiones aprobadas en:

- ADR-AUTH-001;
- AUTH-MOD-001 — Identidad laboral y actor efectivo;
- AUTH-MOD-002 — Separar rol base de rol operativo;
- AUTH-MOD-005 — Definir roles operativos;
- AUTH-MOD-006 — Definir casos híbridos;
- AUTH-MOD-007 — Definir sede asignada y sede activa;
- AUTH-MOD-008 — Definir área asignada y área activa;
- AUTH-MOD-009 — Definir turno publicado;
- AUTH-MOD-010 — Definir check-in activo;
- AUTH-MOD-011 — Definir sesión en dispositivo compartido;
- AUTH-MOD-014 — Definir permisos por sede;
- AUTH-MOD-015 — Definir permisos por tipo de sede;
- AUTH-MOD-016 — Definir permisos por área;
- AUTH-MOD-017 — Definir permisos por tipo de área;
- AUTH-MOD-018 — Definir precedencia entre carriles;
- AUTH-MOD-019 — Definir denegaciones explícitas;
- AUTH-CAT-011 — Definir alcance permitido de cada permiso;
- AUTH-CAT-012 — Definir prerrequisitos de turno y check-in;
- AUTH-CAT-013 — Definir permisos que exigen área activa;
- AUTH-CAT-014 — Definir compatibilidad con dispositivo compartido;
- AUTH-CTX-001 — Diseñar `AccessContext`;
- AUTH-CTX-004 — Versionar contratos;
- AUTH-CTX-009 — Incluir cobertura administrativa por sede y área;
- AUTH-CTX-010 — Incluir turno publicado y vigente;
- AUTH-CTX-011 — Incluir sesión de check-in activa;
- AUTH-CTX-012 — Incluir rol operativo efectivo.

Principios heredados obligatorios:

```text
SEDE OPERATIVA
=
SEDE DEL TURNO PUBLICADO Y VIGENTE
```

```text
ÁREA OPERATIVA
=
ÁREA DEL TURNO PUBLICADO Y VIGENTE
```

```text
CHECK-IN
→ CONFIRMA COHERENCIA
→ NO REEMPLAZA TURNO
```

```text
SEDE OPERATIVA
≠
COBERTURA ADMINISTRATIVA
```

```text
ÁREA OPERATIVA
≠
ÁREA ASIGNADA ADMINISTRATIVA
```

```text
PUNTO DE MARCACIÓN
≠
SEDE OPERATIVA
```

```text
DISPOSITIVO
≠
TERRITORIO LABORAL
```

```text
TERRITORIO OPERATIVO
≠
TERRITORIO DEL RECURSO
```

---

#### 3. Separación conceptual obligatoria

| Concepto                 | Fuente                          | Función                         |            Concede permisos |
| ------------------------ | ------------------------------- | ------------------------------- | --------------------------: |
| Sede asignada            | Relación laboral                | Afiliación del empleado         |                          No |
| Sede primaria            | Relación laboral                | Referencia principal            |                          No |
| Sede seleccionada        | Cliente validado                | Navegación o filtro             |                          No |
| Cobertura administrativa | Rol base y asignaciones         | Insumo del carril base          |                          No |
| Sede operativa           | Turno vigente                   | Territorio del carril operativo |                          No |
| Punto de marcación       | Política de asistencia          | Evidencia física                |                          No |
| Sede del dispositivo     | Configuración técnica           | Restricción adicional           |                          No |
| Sede del recurso         | Recurso solicitado              | Territorio real de la acción    |                          No |
| Área asignada            | Relación laboral administrativa | Afiliación                      |                          No |
| Área operativa           | Turno vigente                   | Contexto funcional temporal     |                          No |
| Área del recurso         | Recurso solicitado              | Alcance real de la acción       |                          No |
| Permiso                  | Catálogo y matrices             | Capacidad empresarial           | Puede participar en `ALLOW` |
| Decisión                 | Evaluador unificado             | Resultado final                 |       Sí, cuando es `ALLOW` |

---

#### 4. Formas contractuales conservadas

AUTH-CTX-013 conserva exactamente las formas conceptuales publicadas:

```ts
type OperationalSiteContext = {
  site_id: string;
  source_shift_id: string;
  site_active: boolean;
  assignment_valid: boolean;
};
```

```ts
type OperationalAreaContext = {
  area_id: string;
  site_id: string;
  area_kind: string;
  source: "SHIFT" | "CHECKIN_CONFIRMED_SHIFT";
  area_active: boolean;
  compatible_with_role: boolean;
};
```

No se agregan propiedades.

La publicación permanece:

```text
AccessContext
contract_version = 1.0.0
schema_version   = 1.0.0
```

---

#### 5. Fuente única del territorio operativo

La fuente autoritativa es:

```text
active_shift
```

Resolución:

```text
active_shift.site_id
→ operational_site
```

```text
active_shift.area_id
→ operational_area, cuando exista
```

No se utilizará como fuente:

- sede primaria;
- sede seleccionada;
- área seleccionada;
- última sede utilizada;
- último turno;
- `employees.site_id`;
- `employees.area_id`;
- perfil operativo predeterminado;
- check-in aislado;
- punto de marcación;
- dispositivo;
- `navigation_role`;
- recurso consultado;
- ruta abierta;
- aplicación;
- nombre del rol;
- nombre humano del área;
- valor enviado por frontend.

---

#### 6. Dependencia del turno

Regla:

```text
active_shift = null
→ operational_site = null
→ operational_area = null
```

No existirá sede o área operativa real sin un turno publicado y vigente.

Un check-in residual, una sede asignada, un dispositivo activo o un rol
operativo histórico no crean territorio operativo.

---

#### 7. Dependencia del actor efectivo

Los nodos solo podrán existir cuando:

1. el actor efectivo sea empleado;
2. el empleado esté activo;
3. `active_shift.employee_id` coincida con el actor;
4. el turno sea válido;
5. no exista ambigüedad de identidad.

Para actores:

- `CUSTOMER`;
- `SYSTEM` autónomo;
- `DEVICE` sin actor humano;
- `UNRESOLVED`;

el resultado será:

```text
operational_site = null
operational_area = null
```

---

#### 8. Resolución exclusiva en servidor

Los nodos deberán resolverse en servidor.

No se aceptará como autoridad:

- parámetro de ruta;
- query string;
- body de la mutación;
- estado local;
- local storage;
- cookie no firmada;
- selector de sede;
- selector de área;
- cabecera personalizada;
- código del dispositivo;
- geocerca enviada por el cliente;
- GPS sin validación;
- sede o área simulada;
- última opción de interfaz.

El cliente podrá solicitar operar sobre un recurso, pero no podrá declarar el
territorio laboral efectivo.

---

#### 9. Semántica de `operational_site`

`operational_site` representa la sede exacta en la que el turno intenta
activar el carril operativo del empleado.

No representa:

- todas las sedes asignadas;
- una sede administrativa;
- cobertura multisede;
- organización completa;
- sede del recurso;
- punto de marcación;
- ubicación física instantánea;
- sede del dispositivo;
- permiso transversal;
- bypass.

---

#### 10. Condición mínima de existencia de `operational_site`

El nodo podrá producirse cuando:

1. existe `active_shift`;
2. `active_shift.site_id` está presente;
3. el identificador es resoluble en el catálogo canónico de sedes;
4. existe una única sede correspondiente;
5. `source_shift_id` puede vincularse al turno;
6. la sede observada no es ambigua.

Si `site_id` es:

- nulo;
- vacío;
- inexistente;
- ambiguo;
- no resoluble;

el resultado será:

```text
operational_site = null
```

y deberá registrarse el problema estructural aplicable.

---

#### 11. `site_id`

Regla exacta:

```text
operational_site.site_id
=
active_shift.site_id
```

No podrá corregirse mediante:

- `assigned_sites`;
- sede primaria;
- check-in;
- dispositivo;
- recurso;
- sede seleccionada;
- perfil;
- heurística;
- nombre humano.

Si la sede del turno es incorrecta, deberá corregirse el turno.

---

#### 12. `source_shift_id`

Regla exacta:

```text
operational_site.source_shift_id
=
active_shift.shift_id
```

El campo prueba que el territorio operativo procede de una ocurrencia
concreta de turno.

No podrá referir:

- turno anterior;
- turno futuro;
- turno borrador;
- plantilla;
- perfil;
- evento de asistencia;
- sesión de dispositivo;
- simulación presentada como real.

---

#### 13. `site_active`

`site_active` indica si la sede observada está activa y disponible para la
operación ordinaria en `resolved_at`.

Casos:

```text
sede existe y está activa
→ site_active = true
```

```text
sede existe pero está inactiva
→ site_active = false
```

Una sede inactiva no podrá habilitar el carril operativo aunque el turno siga
vigente.

La desactivación deberá invalidar el snapshot mediante AUTH-CTX-029.

---

#### 14. Sedes no laborales y puntos técnicos

El catálogo puede contener entidades físicas o técnicas que no representan
una sede laboral ordinaria, por ejemplo:

- puntos de check-in;
- patios;
- geocercas;
- ubicaciones ocultas;
- vehículos;
- sedes demo;
- APP-REVIEW;
- entornos de pruebas.

Estas entidades no podrán convertirse en `operational_site` salvo que su
clasificación canónica las defina expresamente como territorio laboral
operativo.

Un punto físico usado para marcar no sustituye la sede del turno.

---

#### 15. `assignment_valid`

`assignment_valid` indica si el empleado posee una asignación laboral vigente
y utilizable para la sede exacta del turno.

La validación deberá consumir:

```text
employee.employee_id
+
operational_site.site_id
+
assigned_sites
```

Regla conceptual:

```text
existe AssignedSiteContext coincidente
AND assignment_active = true
AND site_active = true
AND assignable = true
→ assignment_valid = true
```

En cualquier otro caso:

```text
assignment_valid = false
```

---

#### 16. Asignación laboral y turno

Un turno válido no crea por sí solo una asignación laboral permanente.

Por tanto:

```text
turno en sede no asignada
→ operational_site puede representar la sede observada
→ assignment_valid = false
→ carril operativo no disponible
```

El sistema no agregará automáticamente la sede a `assigned_sites`.

La corrección deberá ocurrir en la fuente laboral o en el turno, según el caso.

---

#### 17. Asignación multisede

Un empleado puede tener varias sedes asignadas.

El turno selecciona exactamente una como sede operativa.

Ejemplo:

```text
assigned_sites = [VENTO_CAFE, SAUDO]
active_shift.site_id = SAUDO
```

Resultado:

```text
operational_site.site_id = SAUDO
assignment_valid = true
```

La otra sede permanece como asignación laboral, no como territorio operativo
simultáneo.

---

#### 18. Sede primaria

La sede primaria:

- no reemplaza el turno;
- no limita una asignación multisede;
- no corrige una sede inválida;
- no sirve como fallback;
- no determina `operational_site`;
- no convierte `assignment_valid` en verdadero.

Regla:

```text
sede primaria
≠
sede operativa
```

---

#### 19. Compatibilidad legacy de sede

`employees.site_id` podrá existir como campo heredado.

No podrá producir directamente:

- `operational_site`;
- `assignment_valid`;
- cobertura operativa;
- acceso a un recurso.

AUTH-CTX-028 deberá diseñar el adaptador temporal.

AUTH-DB-020 deberá materializar la transición física cuando corresponda.

AUTH-DB-030 retirará el consumo legacy únicamente después de paridad
comprobada.

---

#### 20. Check-in y sede operativa

`active_checkin_session` solo confirma coherencia.

Cuando existe una sesión activa:

```text
active_checkin_session.site_id
=
operational_site.site_id
```

deberá cumplirse.

Si coincide:

- la sede continúa procediendo del turno;
- no se modifica `source_shift_id`;
- no se amplía la autoridad.

Si no coincide:

- el check-in no cambia la sede;
- se registra problema estructural;
- la sesión no podrá satisfacer prerrequisitos operativos;
- el efecto exacto sobre `lane_readiness` se cerrará en AUTH-CTX-015.

---

#### 21. Punto físico de marcación

Puede existir:

```text
operational_site = CENTRO_PRODUCCION
checkin_point = PICKUP_CAMIONETA
```

Esto es válido cuando la política de asistencia lo autoriza.

El punto físico:

- no aparece en `OperationalSiteContext`;
- no cambia `site_id`;
- no crea asignación;
- no crea permiso;
- no se compara como sede del recurso;
- se conserva como evidencia externa al contrato mínimo.

---

#### 22. Dispositivo y sede operativa

La sede configurada en un dispositivo compartido:

- puede restringir la sesión;
- puede exigir coincidencia;
- puede bloquear un actor incompatible;
- no reemplaza la sede del turno;
- no corrige un turno;
- no crea `assignment_valid`;
- no amplía territorio.

La intersección completa se definirá en AUTH-CTX-014.

Regla:

```text
actor + turno + dispositivo
→ intersección restrictiva
```

Nunca:

```text
actor + dispositivo
→ unión de territorios
```

---

#### 23. Semántica de `operational_area`

`operational_area` representa el área organizacional exacta declarada por el
turno vigente, cuando exista y sea resoluble.

No representa:

- todas las áreas de la sede;
- área primaria;
- área asignada administrativamente;
- área seleccionada;
- área del dispositivo;
- área del recurso;
- `area_kind` genérico;
- nombre del rol;
- primera área compatible;
- área inferida desde el check-in.

---

#### 24. Condición mínima de existencia de `operational_area`

Casos:

```text
active_shift = null
→ operational_area = null
```

```text
active_shift.area_id = null
→ operational_area = null
```

```text
area_id presente y resoluble
+
área pertenece a operational_site
→ puede producir operational_area
```

```text
area_id inexistente o ambiguo
→ operational_area = null
→ structural_issue
```

```text
área pertenece a otra sede
→ operational_area = null
→ structural_issue
```

La ausencia legítima de área no es igual a un área inválida.

---

#### 25. `area_id`

Regla exacta:

```text
operational_area.area_id
=
active_shift.area_id
```

No podrá completarse mediante:

- `assigned_areas`;
- área primaria;
- perfil;
- check-in;
- dispositivo;
- permiso;
- rol;
- tipo de área;
- recurso;
- selector visual.

Si falta un área obligatoria, el turno deberá corregirse.

---

#### 26. `site_id` del área

Regla exacta:

```text
operational_area.site_id
=
operational_site.site_id
```

y deberá coincidir con la sede propietaria real del área.

Un área de otra sede no podrá serializarse como contexto operativo válido.

Queda prohibido cambiar el `site_id` real del área para hacerlo coincidir con
el turno.

---

#### 27. `area_kind`

`area_kind` deberá proceder del catálogo canónico del área.

No procederá de:

- rol operativo;
- frontend;
- nombre humano;
- ruta;
- dispositivo;
- permiso;
- categoría aproximada;
- valor escrito manualmente en el turno cuando no esté respaldado por el
  catálogo.

Regla:

```text
area_id
→ área canónica
→ area_kind
```

`area_kind` no sustituye `area_id`.

---

#### 28. Estado del área

`area_active` indica si el área observada está activa en `resolved_at`.

Casos:

```text
área existe y está activa
→ area_active = true
```

```text
área existe pero está inactiva
→ area_active = false
```

Un área inactiva no podrá habilitar un permiso que exija área operativa.

La desactivación deberá invalidar el snapshot mediante AUTH-CTX-029.

---

#### 29. Fuente `SHIFT`

Se utilizará:

```text
source = SHIFT
```

cuando el área procede del turno y no existe una sesión de check-in activa que
confirme exactamente la misma área.

También se utilizará cuando:

- el permiso no exige check-in;
- no existe sesión activa;
- la sesión activa no aporta área;
- la sede coincide pero el check-in no declara área.

`SHIFT` no significa menor autoridad.

El área siempre procede del turno.

---

#### 30. Fuente `CHECKIN_CONFIRMED_SHIFT`

Se utilizará:

```text
source = CHECKIN_CONFIRMED_SHIFT
```

únicamente cuando:

1. existe `active_checkin_session`;
2. la sesión pertenece al mismo actor;
3. coincide con el mismo turno;
4. coincide con la misma sede;
5. declara exactamente la misma área;
6. no existe incompatibilidad estructural.

El significado es:

```text
área del turno
+
check-in confirma la misma área
```

No:

```text
check-in crea o reemplaza área
```

---

#### 31. Check-in sin área

Cuando:

```text
active_shift.area_id != null
active_checkin_session.area_id = null
```

el área continúa resolviéndose desde el turno:

```text
source = SHIFT
```

La ausencia de área en la sesión no elimina el área del turno.

La política de asistencia podrá exigir mayor evidencia en casos específicos,
pero esa regla no se inventará dentro de este nodo.

---

#### 32. Check-in con área incompatible

Cuando:

```text
active_checkin_session.area_id
!=
active_shift.area_id
```

el check-in no reemplaza el área.

El contexto podrá conservar el área válida del turno con:

```text
source = SHIFT
```

pero deberá registrar el problema estructural correspondiente.

La sesión incompatible no podrá satisfacer el prerrequisito de check-in.

AUTH-CTX-015 definirá si el problema bloquea:

- todo el carril operativo;
- únicamente permisos `T+C`;
- la sesión del dispositivo;
- una combinación específica.

Hasta esa clasificación no podrá utilizarse la incompatibilidad para
autorizar.

---

#### 33. Área asignada al empleado

`assigned_areas` representa afiliación administrativa o laboral.

No es requisito general para que exista `operational_area`.

Regla:

```text
área del turno
≠
obligación de existir en employee_areas
```

Esto es obligatorio porque la operación actual resuelve principalmente áreas
mediante turnos y habilitaciones de rol, mientras las asignaciones permanentes
de área no cubren todavía a toda la plantilla.

No se utilizará la falta de `assigned_areas` como negación automática del
territorio operativo.

---

#### 34. Compatibilidad con el rol

`compatible_with_role` indica si el área del turno es compatible con el rol
operativo efectivo y su habilitación territorial.

Regla conceptual:

```text
operational_role != null
AND operational_role.role_code canónico
AND operational_role.site_id = operational_site.site_id
AND operational_role.area_id = operational_area.area_id
AND operational_role.valid_for_site = true
AND operational_role.valid_for_area = true
→ compatible_with_role = true
```

En cualquier otro caso:

```text
compatible_with_role = false
```

---

#### 35. Área válida sin rol válido

Cuando el área existe, está activa y pertenece a la sede, pero el rol no es
compatible:

```text
operational_area puede existir
area_active = true
compatible_with_role = false
```

El nodo conserva el hecho territorial observado.

El carril operativo no queda disponible.

---

#### 36. Rol site-wide y área nula

Cuando el rol permite operación site-wide y el turno no declara área:

```text
operational_area = null
```

Esto puede ser un estado válido.

No deberá crearse un área sintética como:

- general;
- toda la sede;
- área administrativa;
- primera área;
- sede completa representada como área.

El requisito del permiso se evaluará posteriormente.

---

#### 37. Rol con área obligatoria y área nula

Cuando el rol exige área y:

```text
active_shift.area_id = null
```

el resultado será:

```text
operational_area = null
operational_role.valid_for_area = false
```

Se registrará el problema estructural aplicable.

No se completará el área desde ninguna otra fuente.

---

#### 38. Permiso que no exige área

Un permiso clasificado sin prerrequisito de área puede evaluarse con:

```text
operational_area = null
```

si:

- `active_shift` es válido;
- `operational_site` es válida;
- el rol permite contexto site-wide;
- las demás condiciones se cumplen.

La ausencia de área no significa wildcard.

Significa que la acción se evalúa a nivel de sede o sin dimensión de área,
según su contrato de recurso.

---

#### 39. Permiso que exige área

Para un permiso clasificado por AUTH-CAT-013 como dependiente de área:

```text
operational_area != null
AND area_active = true
AND compatible_with_role = true
```

serán condiciones necesarias del carril operativo.

El evaluador completo corresponde a AUTH-CTX-020.

---

#### 40. `null` no es wildcard

Las siguientes expresiones quedan prohibidas:

```text
operational_area = null
→ cualquier área
```

```text
resource_area = null
→ todas las áreas
```

```text
configured_area = null
→ permitir siempre
```

Cada `null` deberá interpretarse según el contrato específico:

- no aplicable;
- nivel sede;
- recurso no territorial;
- información ausente;
- dato inválido.

AUTH-CTX-017 y AUTH-CTX-018 deberán aportar la clasificación necesaria para
la decisión.

---

#### 41. Territorio del recurso

`operational_site` y `operational_area` no prueban que el recurso solicitado
pertenezca al mismo territorio.

AUTH-CTX-018 deberá resolver:

- `resource_site_id`;
- `resource_area_id`;
- origen;
- destino;
- territorios múltiples;
- recursos site-wide;
- recursos organizacionales;
- recursos no territoriales.

AUTH-CTX-020 deberá comparar el territorio operativo contra el recurso.

---

#### 42. Recursos site-wide

Un recurso puede pertenecer a una sede sin pertenecer a un área concreta.

En ese caso:

```text
resource_site_id = sitio exacto
resource_area_id = null
```

La autorización dependerá del contrato del permiso.

No se asumirá que un recurso sin área pertenece a todas las áreas.

---

#### 43. Operaciones multiterritoriales

Una acción puede involucrar varios territorios.

Ejemplo:

```text
remisión:
origen = CENTRO_PRODUCCION
destino = VENTO_CAFE
```

El turno solo aporta un territorio operativo principal.

No autoriza automáticamente ambos extremos.

La capacidad deberá declarar si requiere:

- territorio de origen;
- territorio de destino;
- ambos;
- capacidad transversal específica.

AUTH-CTX-018 resolverá los territorios.

AUTH-CTX-020 evaluará el carril operativo.

---

#### 44. Permisos operativos globales

Un permiso operativo con alcance global significa que puede utilizarse en
cualquier contexto operativo válido donde el rol esté habilitado.

No significa:

- operar sin turno;
- operar sin sede;
- operar sin rol;
- operar cualquier sede desde el turno actual;
- acceder a recursos de otras sedes;
- ignorar área;
- bypass organizacional.

Regla:

```text
global operativo
≠
cross-site operativo
```

---

#### 45. Cobertura administrativa

La sede y el área operativas no modifican:

- `assigned_sites`;
- `assigned_areas`;
- `administrative_coverage`;
- `base_role`;
- grants base;
- denegaciones base.

Ejemplo híbrido:

```text
administrative_coverage = ORGANIZATION
operational_site = VENTO_CAFE
operational_area = CAJA
```

La cobertura administrativa puede ser amplia mientras el carril operativo
continúa limitado al turno.

---

#### 46. Selector de sede o área

Una selección visual:

- no cambia `operational_site`;
- no cambia `operational_area`;
- no cambia el turno;
- no cambia el rol;
- no cambia el check-in;
- no cambia el recurso;
- no concede permisos.

La aplicación podrá cambiar filtros administrativos, pero el contexto
operativo solo cambia mediante una nueva resolución autoritativa.

---

#### 47. Dispositivo compartido

El dispositivo puede declarar:

- sede configurada;
- área configurada;
- tipo;
- plantilla;
- capacidades admitidas.

Esos datos actuarán únicamente como restricciones adicionales.

Ejemplo:

```text
turno = VENTO_CAFE / CAJA
dispositivo = VENTO_CAFE / CAJA
→ compatible
```

```text
turno = SAUDO / COCINA
dispositivo = VENTO_CAFE / CAJA
→ incompatible
```

La incompatibilidad no cambia el turno para hacerlo coincidir con el
dispositivo.

AUTH-CTX-014 cerrará esta intersección.

---

#### 48. Simulación

Una simulación podrá representar hipotéticamente otra sede o área.

No podrá:

- modificar el contexto real;
- crear turno;
- crear check-in;
- cambiar rol;
- cambiar asignaciones;
- habilitar mutaciones;
- reutilizar `WOULD_ALLOW` como autoridad.

La sede y área simuladas permanecerán dentro de `SimulationContext`.

---

#### 49. Procesos de sistema

Un actor `SYSTEM` autónomo no recibe sede o área operativa laboral.

Resultado:

```text
operational_site = null
operational_area = null
```

Los procesos de sistema utilizarán contratos, permisos y territorios
explícitos del recurso.

Una automatización delegada en nombre de un empleado deberá conservar el mismo
actor efectivo y resolver el contexto real sin suministrar manualmente la
sede o el área.

---

#### 50. Relación con modalidades de autorización

##### `BASE_ONLY`

No requiere `operational_site` ni `operational_area`.

##### `OPERATIONAL_ONLY`

Requiere territorio operativo suficiente para el permiso.

##### `BASE_OR_OPERATIONAL`

Los carriles se evalúan de manera independiente.

Un territorio operativo inválido no bloquea automáticamente un carril base
válido.

##### `BASE_AND_OPERATIONAL`

Exige simultáneamente:

- carril base válido;
- carril operativo válido;
- territorio operativo compatible;
- mismo actor;
- ausencia de denegaciones aplicables.

---

#### 51. Relación con prerrequisitos `N`, `T` y `T+C`

##### `N`

No requiere turno, check-in ni territorio operativo.

##### `T`

Requiere:

- `active_shift`;
- `operational_role`;
- `operational_site`;
- área cuando el permiso o rol la exija.

No requiere check-in.

##### `T+C`

Requiere además:

- `active_checkin_session`;
- coincidencia territorial con la sesión;
- demás condiciones del permiso.

---

#### 52. Relación con `lane_readiness`

Reglas conceptuales:

```text
active_shift = null
→ operational_site = null
→ operational_area = null
→ carril operativo no disponible
```

```text
operational_site.site_active = false
→ carril operativo no disponible
```

```text
operational_site.assignment_valid = false
→ carril operativo no disponible
```

```text
operational_area = null
+
área no requerida
→ el carril puede continuar
```

```text
operational_area = null
+
área requerida
→ carril operativo no disponible
```

```text
operational_area.area_active = false
→ carril operativo no disponible
```

```text
compatible_with_role = false
→ carril operativo no disponible
```

AUTH-CTX-015 congelará los estados y razones exactas.

---

#### 53. Snapshot y obsolescencia

Los nodos forman parte del snapshot inmutable.

El contexto queda potencialmente obsoleto cuando ocurre:

- publicación de nueva revisión del turno;
- cambio de sede del turno;
- cambio de área del turno;
- inicio o fin del turno;
- cancelación;
- desactivación de sede;
- desactivación de área;
- cambio de asignación laboral;
- cambio de `assignable`;
- cambio de rol;
- cambio de habilitación territorial;
- check-in;
- check-out;
- cambio de sesión de dispositivo;
- corrección de una incompatibilidad.

AUTH-CTX-029 definirá invalidación, caché y fingerprint.

---

#### 54. Determinismo

Para el mismo:

- actor efectivo;
- `active_shift`;
- `active_checkin_session`;
- `operational_role`;
- asignaciones laborales;
- catálogos de sede y área;
- habilitaciones;
- `resolved_at`;

la resolución deberá producir exactamente el mismo resultado.

No dependerá de:

- orden físico de filas;
- primera coincidencia;
- selector;
- navegador;
- dispositivo;
- caché obsoleta;
- último turno;
- último check-in;
- nombres aproximados;
- heurísticas.

---

#### 55. Casos de ejemplo

##### Caso A — Sede y área válidas

```text
turno = VENTO_CAFE / CAJA
empleado asignado a VENTO_CAFE
rol = cajero_satelite
habilitación exacta vigente
```

Resultado:

```text
operational_site = {
  site_id: "VENTO_CAFE",
  source_shift_id: "...",
  site_active: true,
  assignment_valid: true
}

operational_area = {
  area_id: "CAJA_VENTO_CAFE",
  site_id: "VENTO_CAFE",
  area_kind: "caja",
  source: "SHIFT",
  area_active: true,
  compatible_with_role: true
}
```

##### Caso B — Check-in confirma área

```text
turno.area_id = CAJA_VENTO_CAFE
checkin.area_id = CAJA_VENTO_CAFE
```

Resultado:

```text
operational_area.source = CHECKIN_CONFIRMED_SHIFT
```

##### Caso C — Punto externo

```text
turno.site_id = CENTRO_PRODUCCION
checkin_point = PICKUP_CAMIONETA
```

Resultado:

```text
operational_site.site_id = CENTRO_PRODUCCION
```

El punto externo no reemplaza la sede.

##### Caso D — Sede no asignada

```text
turno.site_id = SAUDO
assigned_sites = [VENTO_CAFE]
```

Resultado:

```text
operational_site != null
assignment_valid = false
```

El carril operativo no queda disponible.

##### Caso E — Sede inactiva

```text
site_id resoluble
site_active = false
```

Resultado:

```text
operational_site != null
site_active = false
```

##### Caso F — Área nula para rol site-wide

```text
rol = conductor_logistica
area_id = null
configuración site-wide válida
```

Resultado:

```text
operational_area = null
```

El contexto puede continuar para permisos que no exijan área.

##### Caso G — Área nula para rol que la exige

```text
rol = cajero_satelite
area_id = null
```

Resultado:

```text
operational_area = null
operational_role.valid_for_area = false
```

##### Caso H — Área de otra sede

```text
turno.site_id = SAUDO
turno.area_id = CAJA_VENTO_CAFE
```

Resultado:

```text
operational_site puede representar SAUDO
operational_area = null
structural_issue = área fuera de sede
```

##### Caso I — Área activa, rol incompatible

```text
turno.area_id = REPOSTERIA
rol = produccion_panaderia
```

Resultado:

```text
operational_area != null
area_active = true
compatible_with_role = false
```

##### Caso J — Sin turno

```text
active_shift = null
```

Resultado:

```text
operational_site = null
operational_area = null
```

La administración permanece independiente.

##### Caso K — Selector visual distinto

```text
selected_site = SAUDO
active_shift.site_id = VENTO_CAFE
```

Resultado:

```text
operational_site.site_id = VENTO_CAFE
```

##### Caso L — Recurso en otra sede

```text
operational_site = CENTRO_PRODUCCION
resource_site = VENTO_CAFE
```

Resultado:

```text
AUTH-CTX-013 no autoriza
AUTH-CTX-020 deberá evaluar permiso transversal o denegar
```

##### Caso M — Check-in con área distinta

```text
turno.area_id = BODEGA
checkin.area_id = REPOSTERIA
```

Resultado:

```text
operational_area conserva BODEGA desde SHIFT
check-in no confirma
structural_issue = mismatch
```

##### Caso N — Empleado sin `assigned_areas`

```text
turno.area_id válido
assigned_areas = []
```

Resultado:

```text
operational_area puede existir
```

La afiliación administrativa de área no es requisito operativo general.

---

#### 56. Inconsistencias estructurales detectables

AUTH-CTX-013 identifica las siguientes clases:

1. turno sin sede;
2. sede desconocida;
3. sede ambigua;
4. sede inactiva;
5. entidad técnica usada como sede laboral;
6. `source_shift_id` incompatible;
7. sede no asignada al empleado;
8. asignación inactiva;
9. sede no asignable;
10. fallback a sede primaria;
11. fallback a `employees.site_id`;
12. selector usado como fuente;
13. check-in usado para reemplazar sede;
14. punto físico usado como sede;
15. dispositivo usado como sede;
16. turno con área desconocida;
17. área ambigua;
18. área inactiva;
19. área perteneciente a otra sede;
20. `area_kind` desconocido;
21. `area_kind` derivado del rol;
22. área completada desde perfil;
23. área completada desde check-in;
24. área completada desde dispositivo;
25. área completada desde selector;
26. área obligatoria ausente;
27. área incompatible con el rol;
28. check-in con sede incompatible;
29. check-in con área incompatible;
30. `CHECKIN_CONFIRMED_SHIFT` sin coincidencia exacta;
31. `null` tratado como wildcard;
32. territorio operativo tratado como recurso;
33. permiso global usado como cross-site;
34. cobertura administrativa usada como sede operativa;
35. snapshot reutilizado después de cambio territorial.

AUTH-CTX-015 deberá asignar:

- código definitivo;
- severidad;
- carril afectado;
- exposición;
- mensaje seguro;
- efecto sobre `lane_readiness`.

---

#### 57. Fail closed

Ante ausencia, contradicción o ambigüedad:

```text
operational_site = null
```

cuando la sede no sea resoluble.

Cuando la sede sea resoluble pero no utilizable:

```text
operational_site puede existir
site_active = false
o
assignment_valid = false
```

Cuando el área sea ausente legítimamente:

```text
operational_area = null
```

sin problema global.

Cuando el área sea inválida o incompatible:

```text
operational_area = null
```

o:

```text
operational_area puede existir
compatible_with_role = false
```

según si el área es territorialmente resoluble.

En ningún caso una condición inválida podrá habilitar el carril operativo.

Queda prohibido:

- usar la sede primaria;
- usar la sede seleccionada;
- usar el punto de marcación;
- usar la sede del dispositivo;
- usar la sede del recurso;
- escoger la primera área;
- inferir área por rol;
- tratar área nula como todas;
- corregir silenciosamente una sede o área;
- elegir la configuración más permisiva.

---

#### 58. Minimización de datos

`operational_site` y `operational_area` no deberán incluir:

- nombres humanos;
- direcciones;
- coordenadas;
- geocercas;
- horarios;
- responsables;
- fotografías;
- datos del dispositivo;
- punto de marcación;
- permisos;
- grants;
- denegaciones;
- historial;
- notas;
- información financiera;
- datos del recurso.

El contrato conserva únicamente los campos publicados.

---

#### 59. Relación con tareas posteriores

##### AUTH-CTX-014

Definirá `device_context` y la intersección restrictiva entre:

- actor;
- turno;
- sede;
- área;
- dispositivo;
- paquete de capacidades.

##### AUTH-CTX-015

Congelará códigos, severidades y efecto sobre `lane_readiness`.

##### AUTH-CTX-017

Aportará:

- requisito de turno;
- requisito de check-in;
- requisito de área;
- alcance territorial del permiso.

##### AUTH-CTX-018

Resolverá el territorio real del recurso, incluyendo casos:

- site-wide;
- por área;
- multisitio;
- multiárea;
- origen y destino;
- no territorial.

##### AUTH-CTX-020

Evaluará el carril operativo combinando:

- turno;
- check-in;
- rol;
- sede operativa;
- área operativa;
- recurso;
- grants;
- denegaciones.

##### AUTH-CTX-023

Expondrá razones seguras de bloqueo territorial.

##### AUTH-CTX-024

Definirá evidencia auditable de sede, área y fuentes utilizadas.

##### AUTH-CTX-025

Diseñará el productor SQL de ambos nodos, incluyendo:

- catálogo canónico;
- asignaciones laborales;
- estado;
- pertenencia sede-área;
- fuente del área;
- determinismo;
- fail closed.

##### AUTH-CTX-026

Diseñará el evaluador que compara contexto y recurso.

##### AUTH-CTX-027

Obligará a las aplicaciones a consumir el contexto centralizado y eliminar:

- `selectedSite` como autoridad;
- `selectedArea` como autoridad;
- `employees.site_id` como autoridad;
- lógica local de “área actual”.

##### AUTH-CTX-028

Diseñará compatibilidad con:

- `employees.site_id`;
- `employees.area_id`;
- `employee_sites`;
- `employee_areas`;
- `employee_shifts.site_id`;
- `employee_shifts.area_id`;
- área nula del check-in legacy;
- `get_operational_context`;
- sede seleccionada prioritaria;
- consumidores actuales;
- puntos de check-in almacenados en `sites`.

##### AUTH-CTX-029

Definirá invalidación por cambios territoriales.

##### AUTH-CTX-030

Definirá pruebas contractuales de:

- sede válida;
- sede no asignada;
- sede inactiva;
- sede técnica;
- área válida;
- área nula;
- área obligatoria ausente;
- área de otra sede;
- área inactiva;
- área incompatible con rol;
- check-in confirmatorio;
- check-in incompatible;
- dispositivo incompatible;
- recurso en otra sede;
- operación multiterritorial.

##### BLOQUE E1

Deberá confrontar estas reglas con la operación real y detectar:

- trabajos temporales en sedes no asignadas;
- cambios de área durante turno;
- rotaciones;
- puntos externos;
- roles site-wide;
- necesidades cross-site.

##### BLOQUE E2

Diseñará los procesos objetivo para:

- planificación;
- reasignación;
- corrección;
- selección visual;
- bloqueo y recuperación.

##### BLOQUE E3

Definirá fuentes físicas, catálogos, relaciones, constraints, RLS, retención y
auditoría.

##### BLOQUE E4

Definirá eventos, sincronización, evidencia y colas relacionadas con cambios
operativos.

##### BLOQUE E5

Convertirá las decisiones en paquetes implementables y orden de transición.

##### BLOQUE R

Implementará migraciones, funciones, protecciones, backfills, pruebas y
compatibilidad.

##### AUTH-DB-006 a AUTH-DB-010

Incorporarán el contexto y las validaciones en RPC sensibles.

##### AUTH-DB-011

Aplicará constraints después de reconciliación y backfill.

##### AUTH-DB-020

Migrará estructuras legacy con compatibilidad temporal.

##### AUTH-DB-027

Creará el harness de pruebas de integridad, RLS, RPC y migraciones.

##### AUTH-DB-030

Retirará rutas y objetos legacy solo después de adopción comprobada.

##### AUTH-DB-031

Certificará paridad documental, técnica y operativa.

---

#### 60. Fuera del alcance

AUTH-CTX-013 no:

- crea sedes;
- crea áreas;
- activa o desactiva territorios;
- asigna empleados a sedes;
- asigna empleados a áreas;
- corrige turnos;
- cambia roles;
- crea habilitaciones territoriales;
- define geocercas;
- define puntos de marcación;
- define dispositivos;
- define recursos;
- define permisos;
- define grants;
- define denegaciones;
- decide autorización final;
- crea tablas;
- crea constraints;
- crea funciones SQL;
- crea RPC;
- crea RLS;
- crea migraciones;
- ejecuta backfills;
- modifica Supabase;
- modifica aplicaciones.

Cada responsabilidad posterior tiene un destino explícito en la sección 59.

---

#### 61. Riesgos controlados

##### Riesgo 1 — Sede seleccionada tratada como operación

Control:

```text
operational_site solo deriva de active_shift
```

##### Riesgo 2 — Punto físico reemplaza sede

Control:

```text
checkin point
≠
operational site
```

##### Riesgo 3 — Sede no asignada autoriza

Control:

```text
assignment_valid = false
```

##### Riesgo 4 — Área administrativa se usa como operativa

Control:

```text
operational_area solo deriva del turno
```

##### Riesgo 5 — Área nula se interpreta como wildcard

Control:

```text
null requiere semántica explícita
```

##### Riesgo 6 — Check-in inventa área

Control:

```text
check-in solo puede confirmar la misma área
```

##### Riesgo 7 — Rol válido opera en área incompatible

Control:

```text
compatible_with_role = false
```

##### Riesgo 8 — Permiso global permite cross-site

Control:

```text
global operativo
≠
transversal
```

---

#### 62. Criterios de aprobación

AUTH-CTX-013 podrá aprobarse cuando se acepte que:

1. `operational_site` conserva la forma de `AccessContext@1.0.0`;
2. `operational_area` conserva la forma de `AccessContext@1.0.0`;
3. la tarea es una aclaración normativa compatible;
4. ambos nodos se resuelven exclusivamente en servidor;
5. ambos dependen del actor efectivo empleado;
6. ambos dependen de `active_shift`;
7. sin turno no existe territorio operativo;
8. la sede procede exclusivamente del turno;
9. el área procede exclusivamente del turno;
10. la sede primaria no es fallback;
11. la sede seleccionada no es fuente;
12. el área seleccionada no es fuente;
13. el perfil no es fuente;
14. el dispositivo no es fuente;
15. el recurso no es fuente del contexto laboral;
16. `site_id` coincide exactamente con el turno;
17. `source_shift_id` coincide exactamente con el turno;
18. una sede desconocida produce `null`;
19. una sede inactiva puede conservarse con `site_active = false`;
20. `assignment_valid` depende de asignación laboral utilizable;
21. el turno no crea asignación;
22. una sede no asignada produce `assignment_valid = false`;
23. `employees.site_id` es legacy;
24. el check-in solo confirma la sede;
25. un punto externo no reemplaza la sede;
26. el dispositivo solo restringe;
27. un área ausente produce `operational_area = null`;
28. una ausencia legítima de área no es inconsistencia;
29. un área desconocida produce `null` y problema estructural;
30. un área de otra sede produce `null` y problema estructural;
31. `area_id` coincide exactamente con el turno;
32. `area_kind` procede del catálogo del área;
33. `area_kind` no sustituye `area_id`;
34. un área inactiva puede conservarse con `area_active = false`;
35. `SHIFT` identifica área derivada únicamente del turno;
36. `CHECKIN_CONFIRMED_SHIFT` exige coincidencia exacta;
37. el check-in no crea área;
38. un check-in sin área no elimina el área del turno;
39. un check-in incompatible no cambia el área;
40. `assigned_areas` no es requisito operativo general;
41. `compatible_with_role` depende del rol efectivo;
42. un área válida puede ser incompatible con el rol;
43. un rol site-wide puede operar sin área cuando esté aprobado;
44. un rol que exige área no puede usar fallback;
45. un permiso sin área puede evaluarse a nivel sede;
46. un permiso que exige área requiere nodo válido;
47. `null` nunca significa wildcard;
48. el contexto operativo no sustituye territorio del recurso;
49. recursos multiterritoriales se resuelven en AUTH-CTX-018;
50. permisos globales operativos no son cross-site;
51. cobertura administrativa y territorio operativo permanecen separados;
52. selectores visuales no cambian territorio;
53. dispositivos actúan por intersección restrictiva;
54. simulación no modifica contexto real;
55. procesos `SYSTEM` autónomos no reciben territorio laboral;
56. modalidades base y operativas permanecen separadas;
57. permisos `T` no requieren check-in;
58. permisos `T+C` requieren coincidencia con sesión;
59. AUTH-CTX-014 definirá dispositivo;
60. AUTH-CTX-015 congelará problemas y readiness;
61. AUTH-CTX-018 resolverá territorio del recurso;
62. AUTH-CTX-020 resolverá el carril operativo;
63. AUTH-CTX-025 diseñará el productor SQL;
64. AUTH-CTX-026 diseñará el evaluador;
65. AUTH-CTX-027 eliminará lógica territorial local;
66. AUTH-CTX-028 diseñará compatibilidad legacy;
67. AUTH-CTX-029 definirá invalidación;
68. AUTH-CTX-030 definirá pruebas contractuales;
69. E1, E2, E3, E4, E5 y BLOQUE R tienen responsabilidades explícitas;
70. AUTH-DB-006 a AUTH-DB-031 tienen responsabilidades físicas explícitas;
71. no se implementa código, migraciones ni cambios en Supabase.

---

#### 63. Estado final de la propuesta

| Tarea        | Estado      | Relación                  |
| ------------ | ----------- | ------------------------- |
| AUTH-CTX-012 | APROBADA    | Tarea anterior            |
| AUTH-CTX-013 | APROBADA    | Tarea actual              |
| AUTH-CTX-014 | NO INICIADA | Tarea siguiente reservada |

La continuidad propuesta queda:

```text
AUTH-CTX-012 — APROBADA
        ↓
AUTH-CTX-013 — APROBADA
        ↓
AUTH-CTX-014 — NO INICIADA
```

No se avanza a AUTH-CTX-014 hasta recibir aprobación explícita de
AUTH-CTX-013.

### ✅ AUTH-CTX-014 — Incluir contexto de dispositivo compartido

**Estado:** APROBADA  
**Bloque:** BLOQUE E — Contexto y decisión de autorización unificados  
**Naturaleza:** Refinamiento documental del nodo `device_context` dentro de `AccessContext`  
**Implementación física:** No incluida  
**Tarea anterior vigente:** AUTH-CTX-013 — APROBADA  
**Tarea posterior reservada:** AUTH-CTX-015 — Incluir razones estructuradas de invalidez  
**Contrato afectado:** `AccessContext@1.0.0`  
**Nodo afectado:** `device_context`  
**Cambio contractual:** Aclaración normativa compatible; no cambia la forma publicada  
**Cambios físicos permitidos:** No

Esta tarea define cómo `AccessContext` representa un dispositivo compartido
autenticado, su instancia empresarial, la sesión temporal del trabajador que
actúa y los límites máximos que el terminal puede imponer.

La tarea conserva la separación entre:

- principal técnico;
- dispositivo empresarial;
- trabajador actor;
- sesión de actor;
- sesión personal;
- check-in laboral;
- turno;
- rol base;
- rol operativo;
- sede y área;
- plantilla;
- instancia;
- aplicaciones visibles;
- paquete máximo de capacidades;
- reautenticación fuerte;
- permiso efectivo;
- decisión final.

No modifica la estructura raíz de `AccessContext`, no agrega campos, no cambia
`contract_version`, no cambia `schema_version`, no implementa SQL, RPC, RLS,
migraciones, tablas, sesiones, PIN, heartbeat, aplicaciones ni cambios físicos
en Supabase.

---

#### 1. Objetivo

Definir el nodo `device_context` de manera que Vento OS pueda responder
inequívocamente:

1. si el principal autenticado corresponde a un dispositivo compartido;
2. cuál dispositivo empresarial exacto representa;
3. si la relación entre credencial técnica y dispositivo es válida;
4. cuál es el estado contractual del dispositivo;
5. si existe una sesión de actor vigente;
6. cuál es su identificador y vencimiento;
7. si la sesión corresponde al actor efectivo;
8. si existe más de una sesión activa incompatible;
9. qué aplicaciones puede presentar como máximo el dispositivo;
10. qué paquete máximo de capacidades lo restringe;
11. cómo se aplica la herencia entre plantilla e instancia;
12. cómo se garantiza que la instancia solo reduzca;
13. cómo se relaciona el dispositivo con turno, check-in, rol, sede y área;
14. cómo se tratan PIN, QR y reautenticación fuerte;
15. qué ocurre cuando no existe actor humano;
16. qué operaciones técnicas pueden quedar separadas de las empresariales;
17. qué ocurre ante dispositivo inactivo, revocado o inválido;
18. qué ocurre ante expiración o cambio de trabajador;
19. cómo impedir que aplicaciones visibles concedan permisos;
20. cómo impedir que `navigation_role` participe en autorización;
21. cómo mantener separados los carriles base y operativo;
22. cómo preservar determinismo, trazabilidad y fail closed.

---

#### 2. Base normativa

AUTH-CTX-014 conserva sin cambios las decisiones aprobadas en:

- ADR-AUTH-001;
- AUTH-MOD-001 — Identidad laboral y actor efectivo;
- AUTH-MOD-002 — Separar rol base de rol operativo;
- AUTH-MOD-007 y AUTH-MOD-008 — Sede y área;
- AUTH-MOD-009 y AUTH-MOD-010 — Turno y check-in;
- AUTH-MOD-011 — Sesión en dispositivo compartido;
- AUTH-MOD-018 — Precedencia entre carriles;
- AUTH-MOD-019 — Denegación explícita;
- AUTH-CAT-014 — Compatibilidad de cada permiso con dispositivo compartido;
- AUTH-RBAC-022 — Denegaciones individuales y transversales;
- AUTH-RBAC-023 — Capacidades permitidas por dispositivo compartido;
- AUTH-RBAC-026 — Dataset de denegaciones y restricciones relacionadas;
- AUTH-CTX-001 — Diseñar `AccessContext`;
- AUTH-CTX-004 — Versionar contratos;
- AUTH-CTX-005 — Principal autenticado;
- AUTH-CTX-006 — Actor efectivo;
- AUTH-CTX-007 — Identidad laboral o de dominio;
- AUTH-CTX-010 a AUTH-CTX-013 — Turno, check-in, rol y territorio operativo.

Invariantes heredados obligatorios:

```text
PRINCIPAL DEL DISPOSITIVO
≠
ACTOR HUMANO
```

```text
SESIÓN DE ACTOR
≠
LOGIN PERSONAL COMPLETO
```

```text
SESIÓN DE ACTOR
≠
CHECK-IN LABORAL
```

```text
DISPOSITIVO PERMITE
≠
ACTOR TIENE PERMISO
```

```text
AUTORIDAD DEL ACTOR
∩
LÍMITE DEL DISPOSITIVO
=
CAPACIDAD EVALUABLE
```

Nunca:

```text
AUTORIDAD DEL ACTOR
∪
LÍMITE DEL DISPOSITIVO
```

---

#### 3. Forma contractual conservada

AUTH-CTX-014 conserva exactamente la forma conceptual publicada:

```ts
type DeviceContext = {
  device_id: string;
  device_code: string;
  device_type: string;
  device_status: "ACTIVE" | "INACTIVE" | "INVALID";
  authenticated_as_device: boolean;
  actor_session_id: string | null;
  actor_session_expires_at: string | null;
  allowed_application_codes: string[];
  capability_package_code: string | null;
};
```

No se agregan propiedades.

La publicación permanece:

```text
AccessContext
contract_version = 1.0.0
schema_version   = 1.0.0
```

Las restricciones territoriales, versión de plantilla, modo de sesión,
política de actor y evidencia de reautenticación continúan en las fuentes
canónicas y en la evidencia auditable; no se duplican como campos nuevos en
esta versión.

---

#### 4. Cuándo existe `device_context`

Regla general:

```text
principal.principal_type = SHARED_DEVICE
→ device_context debe intentar resolverse
```

Para una sesión personal:

```text
principal.principal_type = HUMAN_USER
→ device_context = null
```

aunque la persona utilice físicamente:

- una tablet;
- un computador compartido;
- un navegador de una sede;
- una terminal conocida.

La clasificación depende del principal autenticado, no del tipo físico de
equipo desde el que se conecta.

---

#### 5. Resolución exclusiva en servidor

El nodo deberá resolverse en servidor desde:

- principal autenticado;
- vínculo técnico entre sujeto Auth y dispositivo empresarial;
- estado de la instancia;
- plantilla y versión fijada;
- configuración de aplicaciones;
- paquete de capacidades;
- sesión de actor;
- `resolved_at`.

No podrá aceptarse como fuente autoritativa:

- `device_id` enviado por el cliente;
- `device_code` almacenado en local storage;
- correo técnico interpretado por prefijo;
- nombre del equipo;
- dirección IP;
- user agent;
- ruta visitada;
- QR no validado;
- cookie no firmada;
- último dispositivo usado;
- plantilla declarada por frontend;
- paquete declarado por frontend;
- aplicaciones cargadas en la interfaz;
- `navigation_role`;
- empleado recordado localmente.

---

#### 6. Identidad técnica del dispositivo

El dispositivo empresarial deberá vincularse de forma inequívoca con el
principal autenticado.

Contrato conceptual:

```text
principal SHARED_DEVICE válido
+
relación técnica única
→ dispositivo empresarial exacto
```

Una identidad técnica válida no concede autoridad empresarial.

La credencial únicamente demuestra:

```text
esta solicitud procede del dispositivo D
```

No demuestra:

```text
el trabajador E puede ejecutar la acción P
```

---

#### 7. `device_id`

`device_id` será el identificador canónico exacto de la instancia empresarial.

No podrá ser:

- `auth.uid()` reutilizado como identidad empresarial;
- código humano;
- serial de hardware sin registro empresarial;
- correo;
- IP;
- identificador de plantilla;
- identificador de sesión;
- identificador del trabajador.

Regla:

```text
device_context.device_id
→ instancia empresarial única
```

Si no existe una relación única:

```text
device_context = null
```

y se registrará el problema estructural aplicable.

---

#### 8. `device_code`

`device_code` será el código empresarial estable de la instancia.

Deberá:

- ser único dentro del dominio;
- ser distinto del nombre humano;
- permanecer estable ante cambios de etiqueta;
- no contener secretos;
- no identificar al trabajador;
- no determinar permisos;
- no determinar rol.

Códigos como:

```text
CAJA_VENTO_CAFE_01
KIOSCO_BODEGA_CP
```

pueden identificar instancias, pero su texto no será interpretado para inferir
sede, área, rol o capacidades.

---

#### 9. `device_type`

`device_type` expresa la clasificación técnica o funcional de la instancia.

Ejemplos conceptuales:

- `pos_terminal`;
- `warehouse_terminal`;
- `production_terminal`;
- `reception_terminal`;
- `management_terminal`;
- otros tipos canónicos futuros.

El tipo:

- no concede permisos;
- no selecciona actor;
- no selecciona rol;
- no sustituye la plantilla;
- no sustituye el paquete;
- no autoriza todas las funciones de su categoría.

Un valor desconocido o incompatible produce `device_status = INVALID`.

---

#### 10. `authenticated_as_device`

Será `true` únicamente cuando:

1. el principal es `SHARED_DEVICE`;
2. el sujeto autenticado se vincula con exactamente una instancia;
3. la relación técnica está vigente;
4. no existe ambigüedad;
5. la credencial utilizada pertenece a esa instancia;
6. la resolución fue realizada por servidor.

Será `false` cuando exista un candidato empresarial identificable pero la
relación técnica no pueda demostrarse correctamente.

Regla:

```text
authenticated_as_device = false
→ ninguna acción empresarial desde el dispositivo
```

Una sesión personal no genera un nodo con este campo en `false`; genera
`device_context = null`.

---

#### 11. Estados del dispositivo

##### 11.1 `ACTIVE`

Significa que:

- la instancia existe;
- su identidad técnica es válida;
- está habilitada;
- no está revocada;
- su plantilla es resoluble;
- su versión fijada existe;
- su configuración es coherente;
- puede intentar iniciar una sesión de actor.

No significa:

- que está actualmente conectada;
- que existe actor humano;
- que tiene turno;
- que existe check-in;
- que una aplicación está autorizada;
- que una acción está permitida.

##### 11.2 `INACTIVE`

Significa que la instancia exacta existe, pero está:

- deshabilitada;
- suspendida;
- retirada de operación;
- revocada administrativamente;
- pendiente de reactivación autorizada.

Resultado:

```text
device_status = INACTIVE
actor_session_id = null
capacidad empresarial ejecutable = ninguna
```

##### 11.3 `INVALID`

Significa que la instancia o su configuración presenta una contradicción que
impide utilizarla de forma segura.

Ejemplos:

- vínculo técnico ambiguo;
- plantilla inexistente;
- versión de plantilla inexistente;
- instancia amplía su plantilla;
- paquete desconocido;
- aplicaciones no canónicas;
- territorio contradictorio;
- configuración heredada no resoluble;
- combinación de estado inválida.

---

#### 12. Estado no equivale a presencia en línea

`device_status = ACTIVE` no significa que el equipo esté en línea.

La ausencia de:

- heartbeat;
- `last_seen_at`;
- telemetría reciente;

no transformará automáticamente la instancia en `INACTIVE`.

La semántica de presencia, heartbeat y salud técnica se definirá en:

- AUTH-DEV-001 — Inventariar dispositivos compartidos;
- AUTH-DEV-002 — Definir identidad del dispositivo;
- BLOQUE E3 — Modelo físico;
- BLOQUE E4 — Eventos y sincronización;
- BLOQUE E5 — Paquetes de implementación;
- BLOQUE R — Implementación.

---

#### 13. Plantilla versionada

Cada instancia deberá estar fijada a una plantilla y versión exactas.

La plantilla define el máximo reutilizable de:

- tipo de terminal;
- modo de sesión;
- aplicaciones;
- paquetes de capacidades;
- política de actor;
- compatibilidad con reautenticación fuerte;
- restricciones territoriales;
- bloqueo y limpieza.

Aunque la versión no aparece como campo separado en `DeviceContext@1.0.0`, el
productor deberá resolver el nodo contra una versión exacta.

Una instancia sin versión fijada o con versión inexistente será inválida.

---

#### 14. Instancia restrictiva

La instancia puede reducir la plantilla mediante:

- deshabilitar aplicaciones;
- retirar capacidades;
- restringir territorio;
- vincular un recurso o vehículo;
- deshabilitar reautenticación fuerte no soportada;
- suspender temporalmente la operación.

Nunca podrá:

- agregar una aplicación no incluida;
- agregar una clave no incluida;
- incorporar un permiso `NOT_ALLOWED`;
- ampliar una sede;
- ampliar un área;
- retirar una denegación del actor;
- crear un bypass.

Regla:

```text
instancia efectiva
⊆
plantilla versionada
```

Una ampliación produce:

```text
device_status = INVALID
```

---

#### 15. Sesión de actor

La sesión de actor vincula temporalmente:

```text
DISPOSITIVO
+
EMPLEADO
+
MODO DE SESIÓN
+
INICIO
+
EXPIRACIÓN
+
CONTEXTO RESUELTO
```

No es:

- sesión Auth personal;
- check-in;
- turno;
- rol;
- permiso;
- delegación;
- simulación;
- selección visual.

Solo podrá existir un actor efectivo por dispositivo en un instante.

---

#### 16. `actor_session_id`

Será el identificador canónico de la sesión de actor vigente.

Reglas:

1. deberá pertenecer al mismo `device_id`;
2. deberá vincular exactamente un empleado;
3. deberá estar abierta;
4. deberá estar vigente en `resolved_at`;
5. no deberá estar reemplazada;
6. no deberá estar revocada;
7. deberá ser la única candidata válida;
8. deberá coincidir con `actor_effective`.

Cuando no existe sesión válida:

```text
actor_session_id = null
```

No se utilizará:

- último actor;
- último empleado;
- actor guardado en cookie;
- empleado de la sede;
- rol de navegación;
- perfil predeterminado.

---

#### 17. `actor_session_expires_at`

Cuando existe una sesión de actor activa:

```text
actor_session_expires_at != null
```

y deberá cumplirse:

```text
resolved_at < actor_session_expires_at
```

Una sesión sin vencimiento resoluble no se tratará como indefinida.

Casos:

```text
actor_session_id = null
→ actor_session_expires_at = null
```

```text
actor_session_id != null
+
actor_session_expires_at = null
→ sesión inválida
```

```text
resolved_at >= actor_session_expires_at
→ sesión expirada
→ actor_session_id = null en el contexto efectivo
```

La duración numérica se definirá en AUTH-DEV-012 y en el diseño físico
posterior.

---

#### 18. Inicio temporal de sesión

La sesión solo será vigente cuando:

```text
started_at <= resolved_at < expires_at
```

Aunque `started_at` no se serializa en `DeviceContext@1.0.0`, deberá existir
en la fuente autoritativa.

Una sesión futura no produce actor.

Una sesión creada con timestamps imposibles será inválida.

---

#### 19. Cierre y revocación

Una sesión deja de ser vigente cuando:

- el trabajador la cierra;
- el dispositivo cambia de actor;
- expira;
- el dispositivo se revoca;
- la instancia se desactiva;
- una acción administrativa la invalida;
- la plantilla obliga a limpieza;
- se detecta contradicción estructural.

El cierre deberá invalidar snapshots anteriores mediante AUTH-CTX-029.

AUTH-DEV-011, AUTH-DEV-012 y AUTH-DEV-013 definirán la operación objetivo de
revocación, expiración y cambio de trabajador.

---

#### 20. Actor efectivo

Cuando existe sesión válida:

```text
principal.principal_type = SHARED_DEVICE
actor_effective.actor_type = EMPLOYEE
actor_effective.attribution_source = DEVICE_ACTOR_SESSION
actor_effective.actor_id = empleado de la sesión
```

El dispositivo continúa siendo el principal.

El empleado continúa siendo el actor.

Reglas:

```text
actor_effective.actor_id
≠
device_context.device_id
```

```text
actor_effective.delegation_id = null
```

```text
device_context.actor_session_id
≠
actor_effective.delegation_id
```

---

#### 21. Coincidencia con el empleado

La sesión deberá resolver exactamente el mismo empleado representado en:

- `actor_effective`;
- `domain_identity`;
- `employee`.

Si no coincide:

```text
actor_effective = UNRESOLVED
```

para la ruta de dispositivo y ninguna acción empresarial podrá continuar.

El dispositivo no reasignará la sesión al usuario técnico.

---

#### 22. Empleado inactivo

Una sesión exacta puede conservar evidencia de atribución a un empleado que
luego quedó inactivo.

Sin embargo:

- el actor puede continuar siendo identificable;
- el empleado permanece `INACTIVE`;
- los carriles laborales no quedan disponibles;
- el dispositivo no reactiva al empleado;
- el paquete no compensa la inactividad.

---

#### 23. Varias sesiones activas

Casos:

```text
0 sesiones válidas
→ actor_session_id = null
```

```text
1 sesión válida
→ actor_session_id = sesión exacta
```

```text
2 o más sesiones incompatibles
→ actor_session_id = null
→ actor_effective = UNRESOLVED
→ structural_issue
```

Queda prohibido elegir:

- la más reciente;
- la primera;
- la que coincide con turno;
- la que tiene check-in;
- la que coincide con navegación;
- la del último PIN;
- la del rol esperado.

---

#### 24. PIN, QR y mecanismos ligeros

Un PIN, QR o mecanismo ligero puede servir para:

- localizar al trabajador;
- iniciar la sesión;
- confirmar presencia ante el dispositivo;
- reducir fricción operacional.

No deberá:

- almacenarse dentro del contexto;
- exponerse;
- convertirse en permiso;
- convertirse en rol;
- convertirse en check-in;
- considerarse reautenticación fuerte;
- conservar autoridad después de expirar la sesión.

AUTH-DEV-007 definirá el mecanismo operativo.

E3, E5 y BLOQUE R definirán almacenamiento, hashing, intentos, bloqueo,
rotación, auditoría y recuperación.

---

#### 25. Reautenticación fuerte

La sesión ordinaria de actor no satisface automáticamente:

```text
STRONG_REAUTH_REQUIRED
```

Un PIN ligero tampoco lo satisface.

Para una acción clasificada como `STRONG_REAUTH_REQUIRED` deberá existir:

1. plantilla compatible;
2. instancia compatible;
3. aplicación permitida;
4. clave exacta incluida en el paquete;
5. evidencia de reautenticación fuerte personal y vigente;
6. actor humano exacto;
7. contexto y recurso válidos;
8. ausencia de denegaciones.

La evidencia fuerte es específica de la acción o de una ventana corta
autorizada y no se serializa dentro de `DeviceContext@1.0.0`.

AUTH-CTX-017 definirá el requisito.

AUTH-CTX-020 y AUTH-CTX-023 definirán su efecto en la decisión.

---

#### 26. Sin sesión humana

Un dispositivo `ACTIVE` puede existir con:

```text
actor_session_id = null
actor_session_expires_at = null
```

En ese estado:

- no existe actor humano efectivo;
- no se ejecutan acciones empresariales;
- no se usan permisos base;
- no se usan permisos operativos;
- no se utiliza `navigation_role`;
- no se reutiliza el actor anterior.

Solo podrán ejecutarse operaciones técnicas expresamente separadas, como las
necesarias para:

- cargar configuración;
- iniciar sesión de actor;
- reportar salud;
- cerrar o limpiar estado;
- obtener actualizaciones autorizadas.

El inventario exacto de operaciones técnicas se definirá en AUTH-DEV-002,
AUTH-DEV-007, AUTH-DEV-011, AUTH-DEV-012 y AUTH-DEV-013 y se implementará en
BLOQUE R.

---

#### 27. Sesión de actor y check-in

La sesión de actor:

- identifica quién usa el terminal;
- no demuestra que inició jornada;
- no reemplaza `active_checkin_session`;
- no crea `active_shift`;
- no crea rol operativo.

Un trabajador puede:

```text
tener sesión de actor
+
no tener check-in
```

En ese caso:

- el carril base puede evaluarse si el paquete lo permite;
- permisos `T` requieren además turno;
- permisos `T+C` requieren turno y check-in;
- el dispositivo nunca completa los prerrequisitos faltantes.

---

#### 28. Sesión de actor y turno

La sesión no selecciona el turno.

El orden obligatorio es:

```text
resolver dispositivo
→ resolver sesión de actor
→ resolver empleado
→ resolver active_shift del empleado
```

No:

```text
resolver sesión
→ elegir turno que coincida con dispositivo
```

El turno continúa siendo autoritativo para rol, sede y área operativas.

---

#### 29. Sede y área del dispositivo

La instancia puede estar fijada a:

- una sede;
- un área;
- un conjunto permitido;
- un vehículo;
- un recurso.

Esas restricciones no se serializan como campos nuevos en
`DeviceContext@1.0.0`, pero deberán aplicarse al resolver el contexto y la
decisión.

Regla:

```text
territorio del actor
∩
territorio permitido por dispositivo
=
territorio utilizable desde el dispositivo
```

Nunca:

```text
territorio del actor
∪
territorio del dispositivo
```

AUTH-DEV-003 y AUTH-DEV-004 definirán la configuración objetivo.

AUTH-CTX-018 y AUTH-CTX-020 consumirán la restricción para el recurso exacto.

---

#### 30. Incompatibilidad territorial

Ejemplo:

```text
turno = SAUDO / COCINA
dispositivo = VENTO_CAFE / CAJA
```

Resultado:

- el dispositivo no cambia el turno;
- el turno no cambia la instancia;
- la sesión no amplía territorios;
- la acción empresarial se deniega;
- el problema se registra;
- la interfaz deberá exigir cierre o cambio válido.

AUTH-CTX-015 congelará el problema estructural.

AUTH-DEV-013 definirá el flujo de cambio de trabajador.

---

#### 31. `allowed_application_codes`

Representa el conjunto máximo de aplicaciones que la instancia puede
presentar o utilizar después de aplicar:

```text
aplicaciones de la plantilla versionada
∩
aplicaciones no deshabilitadas por la instancia
∩
aplicaciones canónicas activas
```

No representa:

- permisos;
- acceso interno a módulos;
- autorización de rutas;
- autorización de acciones;
- bypass;
- menú definitivo del actor.

Regla:

```text
app visible en allowed_application_codes
≠
actor autorizado en esa app
```

---

#### 32. Normalización de aplicaciones

La lista deberá:

1. contener códigos canónicos;
2. excluir aplicaciones inexistentes;
3. excluir aplicaciones inactivas;
4. excluir aplicaciones no presentes en la plantilla;
5. eliminar duplicados exactos;
6. ordenarse alfabéticamente;
7. permanecer determinista;
8. no contener wildcards.

Una aplicación desconocida o una ampliación de instancia produce
`device_status = INVALID`.

Lista vacía significa:

```text
ninguna aplicación empresarial disponible
```

No significa todas las aplicaciones.

---

#### 33. Aplicación solicitada

AUTH-CTX-016 definirá `app_code`.

La decisión deberá exigir:

```text
app_code solicitado
∈
device_context.allowed_application_codes
```

cuando el principal sea un dispositivo compartido.

La coincidencia únicamente permite continuar la evaluación.

No produce `ALLOW`.

---

#### 34. `capability_package_code`

Identifica el paquete efectivo, exacto y versionado de capacidades máximas
admitidas por la instancia.

El paquete:

- contiene claves exactas;
- no contiene wildcards;
- no concede al actor;
- no reemplaza matrices;
- no elimina denegaciones;
- no modifica modalidad;
- no modifica prerrequisitos;
- no convierte aplicación permitida en permiso.

Regla:

```text
permission_key solicitada
∈ paquete efectivo
```

es una condición restrictiva adicional.

---

#### 35. Paquete efectivo

La configuración efectiva deberá corresponder a:

```text
paquete máximo de plantilla
-
retiros de instancia
=
paquete efectivo versionado
```

Si la instancia aplica retiros propios, deberá referenciar un paquete efectivo
identificable y reproducible.

Queda prohibido:

- modificar un paquete en sitio sin versionarlo;
- agregar claves localmente;
- resolver por prefijo;
- permitir una app completa;
- utilizar un nombre de rol como paquete;
- utilizar `navigation_role`;
- utilizar rutas como permisos.

---

#### 36. Paquete nulo

```text
capability_package_code = null
```

significa que el dispositivo no expone capacidades empresariales mediante un
paquete aprobado.

Puede ser válido para:

- dispositivo en configuración;
- terminal técnica;
- instancia sin despliegue empresarial;
- estado de transición controlada.

No significa:

- todos los permisos del actor;
- todos los permisos de las aplicaciones;
- todos los permisos de la plantilla;
- usar la matriz sin filtro de dispositivo.

---

#### 37. Clasificación de compatibilidad

AUTH-RBAC-023 conserva:

| Clasificación            | Regla                                                                                |
| ------------------------ | ------------------------------------------------------------------------------------ |
| `STANDARD_ACTOR_SESSION` | Puede participar desde sesión ordinaria cuando la plantilla y el paquete lo incluyan |
| `STRONG_REAUTH_REQUIRED` | Exige reautenticación fuerte personal adicional                                      |
| `NOT_ALLOWED`            | No puede incluirse en ninguna plantilla ni instancia                                 |

El contexto no sustituye esta clasificación.

Los 20 permisos `NOT_ALLOWED` permanecen excluidos universalmente.

Cualquier permiso nuevo permanece denegado por defecto en dispositivos hasta
ser clasificado y agregado mediante una nueva versión aprobada.

---

#### 38. Intersección por acción

Para una acción empresarial desde dispositivo compartido deberán coincidir:

```text
actor efectivo válido
∩ permiso del actor
∩ modalidad correcta
∩ prerrequisitos satisfechos
∩ aplicación permitida
∩ clave incluida en paquete
∩ política de actor satisfecha
∩ territorio compatible
∩ recurso compatible
∩ reautenticación fuerte cuando aplique
∩ ausencia de denegaciones
=
acción autorizable
```

La evaluación exacta corresponde a AUTH-CTX-016 a AUTH-CTX-023.

---

#### 39. `navigation_role`

`navigation_role` no participa en:

- actor efectivo;
- rol base;
- rol operativo;
- permiso;
- modalidad;
- sede;
- área;
- paquete;
- decisión.

Puede servir únicamente como dato de presentación legacy o sugerencia de
navegación mientras se retira.

Cualquier lógica como:

```text
navigation_role = bodeguero
→ conceder permisos de bodeguero
```

queda prohibida.

AUTH-DEV-009 y AUTH-CTX-027 deberán eliminar su uso autoritativo.

AUTH-CTX-028 definirá compatibilidad temporal.

---

#### 40. Política de actor

La plantilla e instancia pueden restringir qué trabajadores pueden abrir una
sesión.

La política deberá consumir hechos canónicos como:

- empleado activo;
- asignación laboral;
- turno;
- rol operativo;
- sede;
- área;
- relación con recurso;
- modo de sesión permitido.

No podrá basarse únicamente en:

- pertenecer a la misma sede;
- nombre del rol;
- `navigation_role`;
- último trabajador;
- correo;
- código de dispositivo.

La política actual `same_site_active_worker` no será suficiente como política
final del kiosco de bodega porque permite un conjunto excesivamente amplio.

AUTH-DEV-008 definirá la combinación objetivo.

---

#### 41. Cambio de trabajador

Antes de activar a un nuevo actor deberán:

1. terminar la sesión anterior;
2. invalidar contexto y decisiones cacheadas;
3. limpiar datos sensibles y estado de UI;
4. cerrar vistas del actor anterior;
5. crear una sesión nueva;
6. volver a resolver identidad, turno, check-in, rol y territorio;
7. recalcular aplicaciones y capacidades evaluables;
8. registrar ambos eventos.

No se transferirán:

- permisos;
- filtros;
- borradores;
- recursos;
- decisiones;
- datos sensibles;
- sesiones de check-in;
- reautenticación fuerte.

AUTH-DEV-013 definirá el flujo físico.

---

#### 42. Expiración

Al expirar la sesión:

```text
actor_session_id = null
actor_session_expires_at = null
actor_effective = UNRESOLVED para acciones empresariales
```

El dispositivo podrá conservar su propia identidad técnica.

Deberán limpiarse:

- vistas;
- datos temporales;
- cachés del actor;
- recursos sensibles;
- selecciones;
- decisiones positivas;
- evidencia fuerte reutilizable.

AUTH-DEV-012 definirá la experiencia y recuperación.

---

#### 43. Revocación del dispositivo

Cuando la instancia se revoque:

```text
device_status = INACTIVE
```

o `INVALID` según el motivo contractual.

Consecuencias:

- sesión de actor terminada;
- contexto invalidado;
- aplicaciones empresariales bloqueadas;
- paquetes inutilizables;
- decisiones cacheadas revocadas;
- nueva autenticación técnica requerida para cualquier reactivación.

AUTH-DEV-011 definirá el proceso administrativo.

---

#### 44. Dispositivo activo sin uso persistido

El estado auditado actualmente muestra infraestructura parcial con
dispositivos configurados pero sin sesiones de actor persistidas.

AUTH-CTX-014 no interpretará:

```text
dispositivo activo
→ sesión existente
```

ni:

```text
usuario técnico autenticado
→ trabajador activo
```

La conformidad operacional solo existirá cuando las tareas AUTH-DEV-001 a
AUTH-DEV-016 y los paquetes físicos correspondientes hayan sido implementados
y probados.

---

#### 45. Carril base

Un actor identificado mediante dispositivo puede conservar su carril base
cuando:

- el empleado es válido;
- el rol base es válido;
- el permiso admite dispositivo compartido;
- la aplicación está permitida;
- la clave está en el paquete;
- la política de actor se cumple;
- el recurso es compatible;
- no existe denegación;
- existe reautenticación fuerte cuando aplica.

El dispositivo nunca añade permisos base.

AUTH-DEV-009 deberá impedir herencias administrativas accidentales.

---

#### 46. Carril operativo

El carril operativo conserva todos sus requisitos:

- empleado activo;
- turno publicado y vigente;
- rol operativo válido;
- sede operativa válida;
- área compatible cuando aplique;
- check-in cuando el permiso sea `T+C`;
- grant operativo;
- recurso compatible;
- ausencia de denegación.

El dispositivo añade restricciones, no reemplaza requisitos.

AUTH-CTX-020 definirá la decisión del carril operativo.

---

#### 47. `BASE_OR_OPERATIONAL`

Cada carril se evalúa de manera independiente y después se aplica el filtro
del dispositivo a la acción exacta.

Un carril válido no autoriza si:

- la app no está permitida;
- la clave no está en el paquete;
- la política del dispositivo falla;
- el territorio del dispositivo es incompatible;
- la reautenticación requerida falta.

---

#### 48. `BASE_AND_OPERATIONAL`

Además de los dos carriles válidos, deberán satisfacerse todas las
restricciones del dispositivo.

La sesión de actor identifica al mismo empleado para ambos carriles.

El dispositivo no permite combinar:

- carril base de un actor;
- carril operativo de otro actor;
- turno del actor anterior;
- check-in residual;
- sesión del usuario técnico.

---

#### 49. Denegaciones

El dispositivo no elimina:

- denegaciones individuales base;
- denegaciones individuales operativas;
- denegaciones transversales;
- `STRUCTURAL_DENY`;
- restricciones sensibles;
- exclusiones `NOT_ALLOWED`.

Una denegación aplicable conserva precedencia aunque la app y la clave estén
permitidas por el terminal.

---

#### 50. Simulación

Una simulación no podrá:

- iniciar sesión real de actor para el sujeto simulado;
- modificar `device_context`;
- usar aplicaciones del dispositivo como autoridad;
- utilizar el paquete para conceder;
- ejecutar mutaciones;
- transferir la sesión real al sujeto simulado.

El actor real y el dispositivo real permanecen auditables.

---

#### 51. Procesos asíncronos

Una acción iniciada desde dispositivo y ejecutada después deberá conservar:

- actor efectivo original;
- dispositivo original;
- decisión o evidencia reevaluable;
- contexto y recurso;
- correlación.

La expiración de la sesión no convierte el proceso en acción anónima.

El proceso asíncrono deberá usar delegación o contrato de sistema según
AUTH-CTX-006 y BLOQUE X.

El dispositivo no permanecerá como actor del trabajo asíncrono.

---

#### 52. Snapshot y obsolescencia

`device_context` forma parte del snapshot inmutable.

El contexto queda potencialmente obsoleto cuando ocurre:

- activación o desactivación del dispositivo;
- revocación;
- cambio de plantilla;
- cambio de versión;
- cambio de aplicaciones;
- cambio de paquete;
- cambio de territorio;
- cambio de política de actor;
- inicio de sesión de actor;
- expiración;
- cierre;
- cambio de trabajador;
- cambio de soporte de reautenticación fuerte;
- desactivación de una app;
- cambio del catálogo de permisos.

AUTH-CTX-029 definirá invalidación, caché y fingerprint.

---

#### 53. Determinismo

Para el mismo:

- principal;
- instancia;
- plantilla versionada;
- configuración;
- sesión de actor;
- aplicaciones;
- paquete;
- `resolved_at`;

la resolución deberá producir exactamente el mismo nodo.

No dependerá de:

- orden físico de filas;
- última aplicación abierta;
- último empleado;
- estado de UI;
- correo;
- nombre del dispositivo;
- primer registro encontrado;
- caché obsoleta;
- configuración no versionada.

---

#### 54. Casos de ejemplo

##### Caso A — Dispositivo activo con actor válido

```text
principal = SHARED_DEVICE
device = CAJA_VENTO_CAFE_01
device_status = ACTIVE
sesión de actor única y vigente
actor = empleado E1
```

Resultado:

```text
device_context != null
authenticated_as_device = true
actor_session_id != null
actor_effective = E1
attribution_source = DEVICE_ACTOR_SESSION
```

##### Caso B — Dispositivo activo sin actor

```text
device_status = ACTIVE
actor_session_id = null
```

Resultado:

```text
actor_effective = UNRESOLVED
acciones empresariales = bloqueadas
operaciones técnicas explícitas = evaluables por contrato separado
```

##### Caso C — Sesión expirada

```text
resolved_at >= actor_session_expires_at
```

Resultado:

```text
actor_session_id = null
actor_session_expires_at = null
```

##### Caso D — Dos sesiones activas

```text
sesiones candidatas = 2
```

Resultado:

```text
actor_session_id = null
actor_effective = UNRESOLVED
structural_issue = sesión de actor ambigua
```

##### Caso E — App visible

```text
allowed_application_codes = ["nexo", "shell"]
app solicitada = "nexo"
```

Resultado:

```text
la evaluación puede continuar
```

No significa `ALLOW`.

##### Caso F — App no permitida

```text
app solicitada = "numera"
allowed_application_codes = ["nexo", "shell"]
```

Resultado:

```text
DENY
```

##### Caso G — Clave fuera del paquete

```text
actor posee permiso P
P no está en capability_package_code
```

Resultado:

```text
DENY desde el dispositivo
```

##### Caso H — Permiso `NOT_ALLOWED`

```text
P clasificado NOT_ALLOWED
```

Resultado:

```text
DENY
```

aunque aparezca por error en una instancia.

La instancia sería además inválida.

##### Caso I — Reautenticación fuerte faltante

```text
P = STRONG_REAUTH_REQUIRED
actor session estándar válida
sin evidencia fuerte
```

Resultado:

```text
DENY
```

##### Caso J — PIN ligero

```text
PIN correcto
```

Resultado:

```text
sesión de actor puede iniciarse
STRONG_REAUTH_REQUIRED no queda satisfecho
```

##### Caso K — Turno en otra sede

```text
dispositivo = VENTO_CAFE / CAJA
turno = SAUDO / COCINA
```

Resultado:

```text
el dispositivo no cambia el turno
contexto incompatible
DENY
```

##### Caso L — `navigation_role`

```text
navigation_role = bodeguero
actor operacional = produccion_reposteria
```

Resultado:

```text
navigation_role se ignora para autorización
```

##### Caso M — Dispositivo inactivo

```text
device_status = INACTIVE
```

Resultado:

```text
actor_session_id = null
acciones empresariales = bloqueadas
```

##### Caso N — Instancia amplía plantilla

```text
app de instancia no existe en plantilla
```

Resultado:

```text
device_status = INVALID
```

##### Caso O — Sesión válida sin check-in

```text
actor session válida
active_shift válido
active_checkin_session = null
```

Resultado:

```text
permiso T puede continuar
permiso T+C no puede continuar
```

##### Caso P — Usuario humano en una tablet

```text
principal = HUMAN_USER
equipo físico compartido
```

Resultado:

```text
device_context = null
```

El contrato no clasifica el equipo por hardware observado.

---

#### 55. Inconsistencias estructurales detectables

AUTH-CTX-014 identifica las siguientes clases:

1. principal compartido sin dispositivo;
2. vínculo técnico ausente;
3. vínculo técnico ambiguo;
4. `device_id` incompatible;
5. código duplicado;
6. tipo desconocido;
7. dispositivo inactivo tratado como activo;
8. dispositivo revocado tratado como activo;
9. plantilla ausente;
10. versión de plantilla ausente;
11. versión no resoluble;
12. instancia amplía plantilla;
13. aplicación no canónica;
14. aplicación inactiva;
15. aplicación no incluida por plantilla;
16. wildcard de aplicación;
17. paquete desconocido;
18. paquete no versionado;
19. paquete amplía plantilla;
20. clave `NOT_ALLOWED` incluida;
21. wildcard de permiso;
22. `navigation_role` usado como autoridad;
23. sesión sin empleado;
24. sesión de otro dispositivo;
25. sesión futura;
26. sesión sin expiración;
27. sesión expirada presentada como vigente;
28. sesión cerrada presentada como vigente;
29. sesión reemplazada presentada como vigente;
30. varias sesiones activas;
31. actor efectivo distinto al empleado de sesión;
32. dispositivo usado como actor;
33. usuario técnico modelado como empleado;
34. último actor usado como fallback;
35. PIN tratado como reautenticación fuerte;
36. sesión de actor tratada como check-in;
37. sesión de actor tratada como turno;
38. sede del dispositivo usada para reemplazar turno;
39. área del dispositivo usada para completar turno;
40. aplicaciones visibles tratadas como permisos;
41. paquete tratado como grants del actor;
42. denegación ignorada por configuración del dispositivo;
43. actor anterior conservado después de cierre;
44. datos del actor anterior conservados después de cambio;
45. snapshot reutilizado después de expiración o revocación.

AUTH-CTX-015 deberá asignar:

- código definitivo;
- severidad;
- carril afectado;
- exposición;
- mensaje seguro;
- efecto sobre `lane_readiness`.

---

#### 56. Fail closed

Ante ausencia, contradicción o ambigüedad:

```text
ninguna acción empresarial
```

Reglas:

```text
dispositivo no resoluble
→ device_context = null
```

```text
dispositivo exacto pero deshabilitado
→ device_status = INACTIVE
```

```text
configuración contradictoria
→ device_status = INVALID
```

```text
sesión ausente o inválida
→ actor_session_id = null
→ actor empresarial no resoluble desde el dispositivo
```

Queda prohibido:

- usar último actor;
- usar empleado de la sede;
- usar rol de navegación;
- usar perfil;
- usar usuario técnico como empleado;
- elegir primera sesión;
- ignorar expiración;
- permitir una app por estar instalada;
- permitir una clave por estar en el actor;
- permitir una clave por prefijo;
- tratar paquete nulo como ilimitado;
- tratar ausencia de heartbeat como actor inválido;
- tratar PIN como MFA fuerte;
- unir territorios;
- omitir denegaciones.

---

#### 57. Minimización de datos

`device_context` no deberá incluir:

- email técnico;
- token;
- JWT;
- PIN;
- hash de PIN;
- QR secreto;
- serial sensible;
- IP;
- MAC;
- ubicación física detallada;
- coordenadas;
- nombre del trabajador;
- rol base;
- rol operativo;
- turno;
- check-in;
- permisos completos;
- lista expandida de claves;
- políticas internas;
- evidencia fuerte;
- historial de sesiones;
- actor anterior;
- telemetría completa.

El contrato conserva únicamente los campos publicados.

---

#### 58. Relación con tareas posteriores

##### AUTH-CTX-015

Congelará códigos, severidades y efecto sobre `lane_readiness`.

##### AUTH-CTX-016

Definirá la aplicación solicitada y exigirá pertenencia a
`allowed_application_codes`.

##### AUTH-CTX-017

Definirá compatibilidad de dispositivo, sesión estándar y reautenticación
fuerte para el permiso solicitado.

##### AUTH-CTX-018

Resolverá el recurso y permitirá comparar restricciones territoriales o de
recurso del dispositivo.

##### AUTH-CTX-019

Evaluará el carril base bajo el filtro restrictivo del dispositivo.

##### AUTH-CTX-020

Evaluará el carril operativo bajo el mismo filtro.

##### AUTH-CTX-021

Registrará los allows coincidentes del actor; el paquete no se registrará como
allow.

##### AUTH-CTX-022

Aplicará denegaciones sin permitir que el dispositivo las neutralice.

##### AUTH-CTX-023

Producirá la decisión final y razones de bloqueo del dispositivo.

##### AUTH-CTX-024

Definirá auditoría con `device_id`, actor, sesión, paquete, aplicación,
contexto y decisión.

##### AUTH-CTX-025

Diseñará el contrato SQL de `get_access_context`, incluyendo:

- resolución técnica del dispositivo;
- estado;
- plantilla versionada;
- instancia restrictiva;
- sesión única;
- expiración;
- apps efectivas;
- paquete efectivo;
- fail closed.

##### AUTH-CTX-026

Diseñará el evaluador que aplica el dispositivo como intersección.

##### AUTH-CTX-027

Obligará a las aplicaciones a consumir el contexto centralizado y eliminar
lógica local basada en dispositivo, rutas o `navigation_role`.

##### AUTH-CTX-028

Diseñará compatibilidad con:

- tablas actuales de dispositivos;
- plantillas legacy;
- apps de plantilla e instancia;
- políticas legacy;
- `navigation_role`;
- usuarios técnicos;
- sesiones actuales;
- `same_site_active_worker`;
- ausencia de heartbeat;
- consumidores existentes.

##### AUTH-CTX-029

Definirá invalidación por cambios de dispositivo, plantilla, paquete y sesión.

##### AUTH-CTX-030

Definirá pruebas contractuales de:

- dispositivo válido;
- inactivo;
- inválido;
- sesión ausente;
- sesión activa;
- sesión expirada;
- sesiones duplicadas;
- cambio de trabajador;
- app permitida y no permitida;
- paquete permitido;
- `NOT_ALLOWED`;
- reautenticación fuerte;
- territorio incompatible;
- dispositivo revocado.

##### AUTH-DEV-001 a AUTH-DEV-016

Materializarán el roadmap específico de dispositivos compartidos:

- inventario;
- identidad;
- sede;
- área;
- aplicaciones;
- permisos máximos;
- PIN o firma;
- intersección actor-dispositivo;
- prevención de herencia administrativa;
- auditoría;
- revocación;
- expiración;
- cambio de trabajador;
- pruebas en NEXO, PULSO y FOGO.

##### BLOQUE E3

Definirá el modelo físico, relaciones, RLS, exposición, retención y
credenciales técnicas.

##### BLOQUE E4

Definirá eventos, heartbeat, sincronización, colas y evidencia.

##### BLOQUE E5

Convertirá las decisiones en paquetes implementables y plan de despliegue.

##### BLOQUE R

Implementará migraciones, funciones, sesiones, restricciones, limpieza,
pruebas, rollback y transición.

---

#### 59. Fuera del alcance

AUTH-CTX-014 no:

- crea dispositivos;
- crea plantillas;
- crea paquetes;
- define las 14 plantillas nuevamente;
- inventa permisos;
- modifica AUTH-RBAC-023;
- registra PIN;
- define proveedor de MFA;
- define duración numérica;
- implementa heartbeat;
- implementa launcher;
- crea sesiones físicas;
- define interfaz final;
- corrige las dos instancias actuales;
- retira plantillas legacy;
- modifica `navigation_role`;
- crea tablas;
- crea constraints;
- crea funciones SQL;
- crea RPC;
- crea RLS;
- crea migraciones;
- ejecuta backfills;
- modifica Supabase;
- modifica aplicaciones;
- decide autorización final.

Cada responsabilidad posterior tiene un destino explícito en la sección 58.

---

#### 60. Riesgos controlados

##### Riesgo 1 — Dispositivo técnico convertido en trabajador

Control:

```text
principal dispositivo
≠
actor empleado
```

##### Riesgo 2 — Último actor reutilizado

Control:

```text
sin sesión vigente
→ sin actor
```

##### Riesgo 3 — App visible concede acceso

Control:

```text
allowed_application_codes
≠
permisos
```

##### Riesgo 4 — Paquete concede permisos

Control:

```text
capability_package
=
techo restrictivo
```

##### Riesgo 5 — Instancia amplía plantilla

Control:

```text
instancia ⊆ plantilla versionada
```

##### Riesgo 6 — PIN satisface acción crítica

Control:

```text
PIN ligero
≠
STRONG_REAUTH_REQUIRED
```

##### Riesgo 7 — Dispositivo reemplaza territorio del turno

Control:

```text
intersección restrictiva
≠
reemplazo
```

##### Riesgo 8 — Cierre conserva datos y autoridad

Control:

```text
cambio o expiración
→ invalidación + limpieza
```

---

#### 61. Criterios de aprobación

AUTH-CTX-014 podrá aprobarse cuando se acepte que:

1. `device_context` conserva la forma de `AccessContext@1.0.0`;
2. la tarea es una aclaración normativa compatible;
3. solo se resuelve para principal `SHARED_DEVICE`;
4. una sesión personal produce `device_context = null`;
5. la identidad del dispositivo se resuelve en servidor;
6. el vínculo técnico debe ser único;
7. la credencial técnica no concede autoridad;
8. `device_id` identifica la instancia empresarial;
9. `device_code` no se interpreta para inferir contexto;
10. `device_type` no concede permisos;
11. `authenticated_as_device` exige vínculo técnico válido;
12. `ACTIVE` no significa actor activo;
13. `ACTIVE` no significa equipo en línea;
14. `INACTIVE` bloquea acciones empresariales;
15. `INVALID` representa contradicción de configuración;
16. la plantilla está versionada;
17. la instancia solo puede reducir;
18. una ampliación vuelve inválida la instancia;
19. la sesión de actor es distinta de login personal;
20. la sesión de actor es distinta de check-in;
21. la sesión de actor es distinta de turno;
22. solo existe un actor por dispositivo;
23. `actor_session_id` pertenece al mismo dispositivo;
24. la sesión debe vincular un empleado exacto;
25. la sesión debe tener expiración;
26. una sesión expirada no produce actor;
27. una sesión cerrada no produce actor;
28. varias sesiones producen `UNRESOLVED`;
29. el último actor nunca es fallback;
30. el dispositivo sigue siendo principal;
31. el empleado sigue siendo actor;
32. `device_id` nunca es `actor_id`;
33. la sesión debe coincidir con `actor_effective`;
34. un empleado inactivo no recupera autoridad;
35. PIN y QR no se exponen en el contexto;
36. PIN ligero no satisface reautenticación fuerte;
37. la reautenticación fuerte se evalúa por acción;
38. sin actor humano no se ejecutan acciones empresariales;
39. operaciones técnicas se mantienen separadas;
40. la sesión no crea check-in;
41. la sesión no selecciona turno;
42. el dispositivo restringe territorio por intersección;
43. el dispositivo no reemplaza sede ni área;
44. `allowed_application_codes` es techo de aplicaciones;
45. una app visible no concede permisos;
46. la lista es canónica, única y determinista;
47. una lista vacía no significa todas;
48. `capability_package_code` identifica un techo versionado;
49. el paquete usa claves exactas;
50. no existen wildcards;
51. paquete nulo no significa ilimitado;
52. `STANDARD_ACTOR_SESSION` requiere inclusión exacta;
53. `STRONG_REAUTH_REQUIRED` exige evidencia fuerte;
54. `NOT_ALLOWED` queda excluido universalmente;
55. permisos nuevos quedan denegados por defecto;
56. la decisión por acción es una intersección;
57. `navigation_role` no participa en autorización;
58. `same_site_active_worker` no es política final suficiente para bodega;
59. el cambio de trabajador termina y limpia la sesión anterior;
60. la expiración invalida contexto y datos del actor;
61. la revocación bloquea la instancia;
62. el carril base conserva todos sus requisitos;
63. el carril operativo conserva todos sus requisitos;
64. el dispositivo no elimina denegaciones;
65. la simulación no crea sesión real;
66. los procesos asíncronos conservan atribución;
67. AUTH-CTX-015 congelará problemas y readiness;
68. AUTH-CTX-016 a AUTH-CTX-024 aplicarán el filtro en la decisión;
69. AUTH-CTX-025 diseñará el productor SQL;
70. AUTH-CTX-026 diseñará el evaluador;
71. AUTH-CTX-027 eliminará lógica local;
72. AUTH-CTX-028 diseñará compatibilidad legacy;
73. AUTH-CTX-029 definirá invalidación;
74. AUTH-CTX-030 definirá pruebas contractuales;
75. AUTH-DEV-001 a AUTH-DEV-016 materializarán el roadmap específico;
76. E3, E4, E5 y BLOQUE R tienen responsabilidades explícitas;
77. no se implementa código, migraciones ni cambios en Supabase.

---

#### 62. Estado final de la propuesta

| Tarea        | Estado      | Relación                  |
| ------------ | ----------- | ------------------------- |
| AUTH-CTX-013 | APROBADA    | Tarea anterior            |
| AUTH-CTX-014 | APROBADA    | Tarea actual              |
| AUTH-CTX-015 | NO INICIADA | Tarea siguiente reservada |

La continuidad propuesta queda:

```text
AUTH-CTX-013 — APROBADA
        ↓
AUTH-CTX-014 — APROBADA
        ↓
AUTH-CTX-015 — NO INICIADA
```

No se avanza a AUTH-CTX-015 hasta recibir aprobación explícita de
AUTH-CTX-014.

### ✅ AUTH-CTX-015 — Incluir razones estructuradas de invalidez

**Estado:** APROBADA 
**Bloque:** BLOQUE E — Contexto y decisión de autorización unificados  
**Naturaleza:** Definición normativa de `lane_readiness` y `structural_issues` dentro de `AccessContext`  
**Implementación física:** No incluida  
**Tarea anterior vigente:** AUTH-CTX-014 — APROBADA  
**Tarea posterior reservada:** AUTH-CTX-016 — Incluir aplicación y permiso solicitado  
**Contrato afectado:** `AccessContext@1.0.0`  
**Nodos afectados:** `lane_readiness`, `structural_issues`  
**Catálogo congelado:** `100` códigos estructurales iniciales  
**Cambio contractual:** Aclaración normativa compatible; no cambia la forma publicada  
**Cambios físicos permitidos:** No

Esta tarea congela la semántica de invalidez estructural del contexto,
distinguiendo entre:

- ausencia normal;
- estado no aplicable;
- indisponibilidad temporal;
- contradicción estructural;
- bloqueo de todos los carriles;
- bloqueo exclusivo del carril base;
- bloqueo exclusivo del carril operativo;
- advertencia;
- información diagnóstica;
- denegación empresarial;
- falta de grant;
- incumplimiento de un prerrequisito del permiso;
- contexto obsoleto.

No modifica la estructura raíz de `AccessContext`, no agrega campos, no cambia
`contract_version`, no cambia `schema_version`, no implementa SQL, RPC, RLS,
migraciones, logs, alertas, paneles ni cambios físicos en Supabase.

---

#### 1. Objetivo

Definir de forma cerrada:

1. la forma y semántica de `LaneReadiness`;
2. la forma y semántica de `StructuralIssue`;
3. la diferencia entre `UNAVAILABLE` e `INVALID`;
4. la diferencia entre ausencia normal y contradicción;
5. la precedencia de severidades;
6. qué carril bloquea cada problema;
7. los códigos estructurales iniciales;
8. los tipos de sujeto permitidos;
9. las fuentes resolutoras permitidas;
10. las reglas de `safe_message`;
11. la deduplicación;
12. el orden determinista;
13. la supresión de errores derivados;
14. el tratamiento del check-in y área opcionales;
15. la relación con dispositivos compartidos;
16. la relación con `AuthorizationDecision`;
17. la relación con denegaciones explícitas;
18. la relación con caché e invalidación;
19. la evolución futura del catálogo;
20. la estrategia fail closed.

---

#### 2. Base normativa

AUTH-CTX-015 conserva sin cambios las decisiones aprobadas en:

- ADR-AUTH-001;
- AUTH-MOD-001 a AUTH-MOD-020;
- AUTH-CAT-001 a AUTH-CAT-024;
- AUTH-RBAC-001 a AUTH-RBAC-028;
- AUTH-CTX-001 — Diseñar `AccessContext`;
- AUTH-CTX-004 — Versionar contratos;
- AUTH-CTX-005 a AUTH-CTX-014 — Resolver todos los hechos internos del
  contexto.

Principios obligatorios:

```text
AUSENCIA NORMAL
≠
INCONSISTENCIA ESTRUCTURAL
```

```text
UNAVAILABLE
≠
INVALID
```

```text
PROBLEMA ESTRUCTURAL
≠
DENEGACIÓN EXPLÍCITA
```

```text
LANE_READINESS
≠
DECISIÓN DEL PERMISO
```

```text
WARNING
≠
ALLOW
```

```text
INFO
≠
ALLOW
```

```text
CONTRADICCIÓN
→
NO FALLBACK
→
FAIL CLOSED
```

---

#### 3. Formas contractuales conservadas

```ts
type LaneReadiness = {
  status: "READY" | "UNAVAILABLE" | "INVALID" | "NOT_APPLICABLE";
  reason_codes: string[];
};
```

```ts
type StructuralIssue = {
  issue_code: string;
  severity:
    | "BLOCKING_ALL"
    | "BLOCKING_BASE"
    | "BLOCKING_OPERATIONAL"
    | "WARNING"
    | "INFO";

  subject_type: string;
  subject_id: string | null;
  source: string;
  safe_message: string;
};
```

Forma raíz conservada:

```ts
lane_readiness: {
  base: LaneReadiness;
  operational: LaneReadiness;
};

structural_issues: StructuralIssue[];
```

No se agregan propiedades.

---

#### 4. Responsabilidad de `lane_readiness`

`lane_readiness` responde:

```text
¿Existen hechos estructurales suficientes y coherentes
para que este carril pueda ser evaluado?
```

No responde:

```text
¿Existe un grant?
¿El permiso admite este carril?
¿El recurso está dentro del alcance?
¿Existe una denegación?
¿La decisión final es ALLOW?
```

Esas preguntas pertenecen a AUTH-CTX-016 a AUTH-CTX-023.

---

#### 5. Semántica de los estados

##### 5.1 `READY`

El núcleo estructural del carril es coherente y puede participar en una
evaluación posterior.

No significa que el permiso será autorizado.

##### 5.2 `UNAVAILABLE`

El carril no puede utilizarse en el snapshot actual por una ausencia o estado
válido y esperado.

Ejemplos:

- dispositivo compartido activo sin sesión de actor;
- empleado inactivo conocido;
- ausencia de turno vigente;
- ausencia de check-in cuando todavía no se conoce si el permiso lo exige;
- ausencia legítima de área para un rol site-wide.

`UNAVAILABLE` no se utiliza para ocultar contradicciones.

##### 5.3 `INVALID`

Existe al menos un problema con severidad aplicable:

- `BLOCKING_ALL`;
- `BLOCKING_BASE`;
- `BLOCKING_OPERATIONAL`.

El carril no podrá participar en una decisión positiva.

##### 5.4 `NOT_APPLICABLE`

El carril no pertenece al tipo de actor resuelto.

Ejemplos:

- cliente;
- identidad de dominio no laboral;
- proceso `SYSTEM` autónomo;
- dispositivo técnico sin operación empresarial humana.

No significa denegación ni error.

---

#### 6. Responsabilidad de `structural_issues`

`structural_issues` registra contradicciones, ambigüedades y violaciones del
contrato de resolución.

No deberá contener:

- falta normal de turno;
- falta normal de check-in;
- falta normal de área opcional;
- ausencia de grant;
- permiso no aplicable;
- recurso fuera de alcance;
- denegación individual;
- denegación transversal;
- fallo de reautenticación de una acción concreta;
- mensajes de interfaz;
- excepciones internas;
- stack traces;
- texto SQL.

---

#### 7. Semántica de severidades

| Severidad              | Efecto                                                                        |
| ---------------------- | ----------------------------------------------------------------------------- |
| `BLOCKING_ALL`         | Ambos carriles quedan `INVALID`                                               |
| `BLOCKING_BASE`        | El carril base queda `INVALID`; el operativo se evalúa de forma independiente |
| `BLOCKING_OPERATIONAL` | El carril operativo queda `INVALID`; el base se evalúa de forma independiente |
| `WARNING`              | No cambia por sí sola el estado; exige evidencia o seguimiento                |
| `INFO`                 | No cambia el estado; aporta contexto diagnóstico seguro                       |

Precedencia:

```text
BLOCKING_ALL
>
BLOCKING_BASE / BLOCKING_OPERATIONAL
>
WARNING
>
INFO
```

`BLOCKING_BASE` y `BLOCKING_OPERATIONAL` no tienen precedencia entre sí porque
afectan carriles distintos.

---

#### 8. Tipos de sujeto permitidos

```text
PRINCIPAL
DOMAIN_IDENTITY
ACTOR
EMPLOYEE
BASE_ROLE
SITE_ASSIGNMENT
AREA_ASSIGNMENT
ADMINISTRATIVE_COVERAGE
SHIFT
CHECKIN_SESSION
OPERATIONAL_ROLE
OPERATIONAL_SITE
OPERATIONAL_AREA
DEVICE
DEVICE_ACTOR_SESSION
CONFIGURATION
CONTEXT
```

No se utilizarán nombres de tablas como `subject_type`.

---

#### 9. Fuentes resolutoras permitidas

```text
PRINCIPAL_RESOLVER
DOMAIN_IDENTITY_RESOLVER
ACTOR_RESOLVER
EMPLOYEE_RESOLVER
BASE_ROLE_RESOLVER
ASSIGNMENT_RESOLVER
ADMINISTRATIVE_COVERAGE_RESOLVER
SHIFT_RESOLVER
CHECKIN_RESOLVER
OPERATIONAL_ROLE_RESOLVER
OPERATIONAL_TERRITORY_RESOLVER
DEVICE_RESOLVER
DEVICE_SESSION_RESOLVER
CONTEXT_VALIDATOR
FRESHNESS_RESOLVER
```

Cada código tiene una fuente propietaria.

Un consumidor posterior no deberá duplicar el mismo problema con otra fuente.

---

#### 10. Convención de códigos

Todos los códigos:

- usan `UPPER_SNAKE_CASE`;
- son estables;
- no contienen identificadores;
- no contienen nombres de tablas;
- no contienen nombres de personas;
- no se construyen dinámicamente;
- no se traducen;
- no se reutilizan con otra semántica;
- no se inventan dentro de aplicaciones.

Un código nuevo exige:

1. análisis documental;
2. clasificación de severidad;
3. sujeto;
4. fuente propietaria;
5. mensaje seguro;
6. impacto sobre carriles;
7. pruebas en AUTH-CTX-030;
8. implementación física mediante BLOQUE R.

---

#### 11. Catálogo estructural inicial

El catálogo inicial queda congelado con `100` códigos.

##### Autenticación, principal, identidad y actor

| `issue_code`                 | Severidad      | `subject_type`    | `source`                   | `safe_message`                                                                   |
| ---------------------------- | -------------- | ----------------- | -------------------------- | -------------------------------------------------------------------------------- |
| `AUTH_UNAUTHENTICATED`       | `BLOCKING_ALL` | `PRINCIPAL`       | `PRINCIPAL_RESOLVER`       | No existe una autenticación válida para resolver el contexto.                    |
| `PRINCIPAL_NOT_LINKED`       | `BLOCKING_ALL` | `PRINCIPAL`       | `PRINCIPAL_RESOLVER`       | La identidad autenticada no está vinculada con una identidad empresarial válida. |
| `PRINCIPAL_AMBIGUOUS`        | `BLOCKING_ALL` | `PRINCIPAL`       | `PRINCIPAL_RESOLVER`       | La identidad autenticada corresponde a más de un principal empresarial.          |
| `PRINCIPAL_INACTIVE`         | `BLOCKING_ALL` | `PRINCIPAL`       | `PRINCIPAL_RESOLVER`       | El principal autenticado no está activo.                                         |
| `PRINCIPAL_TYPE_INVALID`     | `BLOCKING_ALL` | `PRINCIPAL`       | `PRINCIPAL_RESOLVER`       | El tipo de principal autenticado no es válido.                                   |
| `PRINCIPAL_SUBJECT_MISMATCH` | `BLOCKING_ALL` | `PRINCIPAL`       | `PRINCIPAL_RESOLVER`       | La credencial autenticada no coincide con el principal empresarial resuelto.     |
| `DOMAIN_IDENTITY_AMBIGUOUS`  | `BLOCKING_ALL` | `DOMAIN_IDENTITY` | `DOMAIN_IDENTITY_RESOLVER` | La identidad de dominio no puede resolverse de forma única.                      |
| `DOMAIN_IDENTITY_INACTIVE`   | `BLOCKING_ALL` | `DOMAIN_IDENTITY` | `DOMAIN_IDENTITY_RESOLVER` | La identidad de dominio resuelta no está activa.                                 |
| `ACTOR_TYPE_INVALID`         | `BLOCKING_ALL` | `ACTOR`           | `ACTOR_RESOLVER`           | El tipo de actor efectivo no es válido.                                          |
| `ACTOR_ATTRIBUTION_INVALID`  | `BLOCKING_ALL` | `ACTOR`           | `ACTOR_RESOLVER`           | La fuente de atribución del actor efectivo no es válida.                         |
| `ACTOR_PRINCIPAL_MISMATCH`   | `BLOCKING_ALL` | `ACTOR`           | `ACTOR_RESOLVER`           | El actor efectivo no es compatible con el principal autenticado.                 |
| `DELEGATION_INVALID`         | `BLOCKING_ALL` | `ACTOR`           | `ACTOR_RESOLVER`           | La delegación utilizada para resolver el actor no es válida.                     |

##### Identidad laboral y rol base

| `issue_code`                | Severidad       | `subject_type` | `source`             | `safe_message`                                                      |
| --------------------------- | --------------- | -------------- | -------------------- | ------------------------------------------------------------------- |
| `EMPLOYEE_MISSING`          | `BLOCKING_ALL`  | `EMPLOYEE`     | `EMPLOYEE_RESOLVER`  | No fue posible resolver el trabajador requerido para este contexto. |
| `EMPLOYEE_AMBIGUOUS`        | `BLOCKING_ALL`  | `EMPLOYEE`     | `EMPLOYEE_RESOLVER`  | La identidad laboral corresponde a más de un trabajador.            |
| `EMPLOYEE_ACTOR_MISMATCH`   | `BLOCKING_ALL`  | `EMPLOYEE`     | `EMPLOYEE_RESOLVER`  | El trabajador resuelto no coincide con el actor efectivo.           |
| `EMPLOYEE_STATUS_INVALID`   | `BLOCKING_ALL`  | `EMPLOYEE`     | `EMPLOYEE_RESOLVER`  | El estado laboral del trabajador no es reconocido.                  |
| `BASE_ROLE_MISSING`         | `BLOCKING_BASE` | `BASE_ROLE`    | `BASE_ROLE_RESOLVER` | El trabajador activo no tiene un rol base resoluble.                |
| `BASE_ROLE_AMBIGUOUS`       | `BLOCKING_BASE` | `BASE_ROLE`    | `BASE_ROLE_RESOLVER` | Existe más de un rol base vigente para el trabajador.               |
| `BASE_ROLE_UNKNOWN`         | `BLOCKING_BASE` | `BASE_ROLE`    | `BASE_ROLE_RESOLVER` | El rol base asignado no existe en el catálogo canónico.             |
| `BASE_ROLE_INACTIVE`        | `BLOCKING_BASE` | `BASE_ROLE`    | `BASE_ROLE_RESOLVER` | El rol base asignado no está activo.                                |
| `BASE_ROLE_ACTOR_MISMATCH`  | `BLOCKING_BASE` | `BASE_ROLE`    | `BASE_ROLE_RESOLVER` | El rol base resuelto no pertenece al trabajador efectivo.           |
| `BASE_ROLE_LEGACY_UNMAPPED` | `BLOCKING_BASE` | `BASE_ROLE`    | `BASE_ROLE_RESOLVER` | El rol base heredado no tiene una equivalencia canónica aprobada.   |

##### Asignaciones y cobertura administrativa

| `issue_code`                         | Severidad       | `subject_type`            | `source`                           | `safe_message`                                                               |
| ------------------------------------ | --------------- | ------------------------- | ---------------------------------- | ---------------------------------------------------------------------------- |
| `SITE_ASSIGNMENT_DUPLICATE_CONFLICT` | `BLOCKING_BASE` | `SITE_ASSIGNMENT`         | `ASSIGNMENT_RESOLVER`              | Existen asignaciones de sede duplicadas con información contradictoria.      |
| `SITE_ASSIGNMENT_MULTIPLE_PRIMARY`   | `BLOCKING_BASE` | `SITE_ASSIGNMENT`         | `ASSIGNMENT_RESOLVER`              | Existe más de una sede primaria vigente para el trabajador.                  |
| `SITE_ASSIGNMENT_UNKNOWN_SITE`       | `BLOCKING_BASE` | `SITE_ASSIGNMENT`         | `ASSIGNMENT_RESOLVER`              | Una asignación laboral referencia una sede inexistente.                      |
| `AREA_ASSIGNMENT_DUPLICATE_CONFLICT` | `BLOCKING_BASE` | `AREA_ASSIGNMENT`         | `ASSIGNMENT_RESOLVER`              | Existen asignaciones de área duplicadas con información contradictoria.      |
| `AREA_ASSIGNMENT_MULTIPLE_PRIMARY`   | `BLOCKING_BASE` | `AREA_ASSIGNMENT`         | `ASSIGNMENT_RESOLVER`              | Existe más de un área primaria vigente para la misma sede.                   |
| `AREA_ASSIGNMENT_UNKNOWN_AREA`       | `BLOCKING_BASE` | `AREA_ASSIGNMENT`         | `ASSIGNMENT_RESOLVER`              | Una asignación laboral referencia un área inexistente.                       |
| `AREA_ASSIGNMENT_SITE_MISMATCH`      | `BLOCKING_BASE` | `AREA_ASSIGNMENT`         | `ASSIGNMENT_RESOLVER`              | El área asignada no pertenece a la sede declarada.                           |
| `ADMIN_COVERAGE_MODE_INVALID`        | `BLOCKING_BASE` | `ADMINISTRATIVE_COVERAGE` | `ADMINISTRATIVE_COVERAGE_RESOLVER` | El modo de cobertura administrativa no es reconocido.                        |
| `ADMIN_COVERAGE_SOURCE_INVALID`      | `BLOCKING_BASE` | `ADMINISTRATIVE_COVERAGE` | `ADMINISTRATIVE_COVERAGE_RESOLVER` | La fuente de cobertura administrativa no es válida.                          |
| `ADMIN_COVERAGE_SHAPE_INVALID`       | `BLOCKING_BASE` | `ADMINISTRATIVE_COVERAGE` | `ADMINISTRATIVE_COVERAGE_RESOLVER` | Los identificadores de cobertura no corresponden con el modo declarado.      |
| `ADMIN_COVERAGE_EXPANDS_ROLE`        | `BLOCKING_BASE` | `ADMINISTRATIVE_COVERAGE` | `ADMINISTRATIVE_COVERAGE_RESOLVER` | La cobertura administrativa amplía indebidamente el alcance natural del rol. |
| `ADMIN_COVERAGE_NONDETERMINISTIC`    | `BLOCKING_BASE` | `ADMINISTRATIVE_COVERAGE` | `ADMINISTRATIVE_COVERAGE_RESOLVER` | La cobertura administrativa no puede reproducirse de forma determinista.     |

##### Turno publicado y vigente

| `issue_code`                     | Severidad              | `subject_type` | `source`         | `safe_message`                                                      |
| -------------------------------- | ---------------------- | -------------- | ---------------- | ------------------------------------------------------------------- |
| `SHIFT_REVISION_AMBIGUOUS`       | `BLOCKING_OPERATIONAL` | `SHIFT`        | `SHIFT_RESOLVER` | Existe más de una revisión publicada autoritativa para el turno.    |
| `SHIFT_UNPUBLISHED_SELECTED`     | `BLOCKING_OPERATIONAL` | `SHIFT`        | `SHIFT_RESOLVER` | Se intentó utilizar una revisión de turno no publicada.             |
| `SHIFT_KIND_INVALID`             | `BLOCKING_OPERATIONAL` | `SHIFT`        | `SHIFT_RESOLVER` | El tipo de turno no es compatible con una jornada operativa.        |
| `SHIFT_TIME_RANGE_INVALID`       | `BLOCKING_OPERATIONAL` | `SHIFT`        | `SHIFT_RESOLVER` | El intervalo temporal del turno no es válido.                       |
| `SHIFT_TIMEZONE_INVALID`         | `BLOCKING_OPERATIONAL` | `SHIFT`        | `SHIFT_RESOLVER` | La zona horaria necesaria para resolver el turno no es válida.      |
| `SHIFT_EMPLOYEE_MISMATCH`        | `BLOCKING_OPERATIONAL` | `SHIFT`        | `SHIFT_RESOLVER` | El turno no pertenece al trabajador efectivo.                       |
| `SHIFT_SITE_INVALID`             | `BLOCKING_OPERATIONAL` | `SHIFT`        | `SHIFT_RESOLVER` | La sede declarada por el turno no es válida.                        |
| `SHIFT_AREA_SITE_MISMATCH`       | `BLOCKING_OPERATIONAL` | `SHIFT`        | `SHIFT_RESOLVER` | El área declarada por el turno no pertenece a su sede.              |
| `SHIFT_OPERATIONAL_ROLE_MISSING` | `BLOCKING_OPERATIONAL` | `SHIFT`        | `SHIFT_RESOLVER` | El turno vigente no contiene un rol operativo resoluble.            |
| `SHIFT_STATUS_INVALID`           | `BLOCKING_OPERATIONAL` | `SHIFT`        | `SHIFT_RESOLVER` | El estado del turno no permite tratarlo como vigente.               |
| `SHIFT_OVERLAP`                  | `BLOCKING_OPERATIONAL` | `SHIFT`        | `SHIFT_RESOLVER` | Existe más de un turno vigente candidato para el trabajador.        |
| `SHIFT_FIELDS_MIXED_REVISIONS`   | `BLOCKING_OPERATIONAL` | `SHIFT`        | `SHIFT_RESOLVER` | El turno fue construido combinando campos de revisiones diferentes. |
| `SHIFT_CLIENT_SELECTED`          | `BLOCKING_OPERATIONAL` | `SHIFT`        | `SHIFT_RESOLVER` | El turno fue seleccionado desde una fuente no autoritativa.         |

##### Sesión de check-in

| `issue_code`                        | Severidad              | `subject_type`    | `source`           | `safe_message`                                                        |
| ----------------------------------- | ---------------------- | ----------------- | ------------------ | --------------------------------------------------------------------- |
| `CHECKIN_UNCONFIRMED_AS_ACTIVE`     | `BLOCKING_OPERATIONAL` | `CHECKIN_SESSION` | `CHECKIN_RESOLVER` | Un evento no confirmado fue presentado como check-in activo.          |
| `CHECKIN_SESSION_ID_MISSING`        | `BLOCKING_OPERATIONAL` | `CHECKIN_SESSION` | `CHECKIN_RESOLVER` | La sesión de check-in no tiene un identificador canónico.             |
| `CHECKIN_ACTOR_MISMATCH`            | `BLOCKING_OPERATIONAL` | `CHECKIN_SESSION` | `CHECKIN_RESOLVER` | La sesión de check-in pertenece a otro trabajador.                    |
| `CHECKIN_SHIFT_MISMATCH`            | `BLOCKING_OPERATIONAL` | `CHECKIN_SESSION` | `CHECKIN_RESOLVER` | La sesión de check-in no corresponde al turno vigente.                |
| `CHECKIN_SITE_MISMATCH`             | `BLOCKING_OPERATIONAL` | `CHECKIN_SESSION` | `CHECKIN_RESOLVER` | La sede de la sesión de check-in no coincide con la sede del turno.   |
| `CHECKIN_AREA_MISMATCH`             | `BLOCKING_OPERATIONAL` | `CHECKIN_SESSION` | `CHECKIN_RESOLVER` | El área de la sesión de check-in no coincide con el área del turno.   |
| `CHECKIN_TIME_INVALID`              | `BLOCKING_OPERATIONAL` | `CHECKIN_SESSION` | `CHECKIN_RESOLVER` | La secuencia temporal de la sesión de check-in no es válida.          |
| `CHECKIN_SESSION_AMBIGUOUS`         | `BLOCKING_OPERATIONAL` | `CHECKIN_SESSION` | `CHECKIN_RESOLVER` | Existe más de una sesión de check-in activa candidata.                |
| `CHECKIN_EXPIRED_AS_ACTIVE`         | `BLOCKING_OPERATIONAL` | `CHECKIN_SESSION` | `CHECKIN_RESOLVER` | Una sesión expirada fue presentada como activa.                       |
| `CHECKIN_CLOSED_AS_ACTIVE`          | `BLOCKING_OPERATIONAL` | `CHECKIN_SESSION` | `CHECKIN_RESOLVER` | Una sesión cerrada fue presentada como activa.                        |
| `CHECKIN_OUTLIVES_SHIFT`            | `BLOCKING_OPERATIONAL` | `CHECKIN_SESSION` | `CHECKIN_RESOLVER` | La sesión de check-in permanece activa después del fin del turno.     |
| `CHECKIN_TERMINAL_LINK_INVALID`     | `BLOCKING_OPERATIONAL` | `CHECKIN_SESSION` | `CHECKIN_RESOLVER` | El evento terminal no está vinculado con la sesión correcta.          |
| `CHECKIN_OFFLINE_PENDING_AS_ACTIVE` | `BLOCKING_OPERATIONAL` | `CHECKIN_SESSION` | `CHECKIN_RESOLVER` | Una marcación pendiente de sincronización fue presentada como activa. |

##### Rol y territorio operativos

| `issue_code`                              | Severidad              | `subject_type`     | `source`                         | `safe_message`                                                               |
| ----------------------------------------- | ---------------------- | ------------------ | -------------------------------- | ---------------------------------------------------------------------------- |
| `OPERATIONAL_ROLE_UNKNOWN`                | `BLOCKING_OPERATIONAL` | `OPERATIONAL_ROLE` | `OPERATIONAL_ROLE_RESOLVER`      | El rol operativo del turno no existe en el catálogo canónico.                |
| `OPERATIONAL_ROLE_INACTIVE`               | `BLOCKING_OPERATIONAL` | `OPERATIONAL_ROLE` | `OPERATIONAL_ROLE_RESOLVER`      | El rol operativo del turno no está activo.                                   |
| `OPERATIONAL_ROLE_DEPRECATED`             | `BLOCKING_OPERATIONAL` | `OPERATIONAL_ROLE` | `OPERATIONAL_ROLE_RESOLVER`      | El rol operativo del turno está deprecado.                                   |
| `OPERATIONAL_ROLE_SHIFT_MISMATCH`         | `BLOCKING_OPERATIONAL` | `OPERATIONAL_ROLE` | `OPERATIONAL_ROLE_RESOLVER`      | El rol operativo resuelto no coincide con el turno vigente.                  |
| `OPERATIONAL_ROLE_SITE_NOT_ENABLED`       | `BLOCKING_OPERATIONAL` | `OPERATIONAL_ROLE` | `OPERATIONAL_ROLE_RESOLVER`      | El rol operativo no está habilitado en la sede del turno.                    |
| `OPERATIONAL_ROLE_AREA_NOT_ENABLED`       | `BLOCKING_OPERATIONAL` | `OPERATIONAL_ROLE` | `OPERATIONAL_ROLE_RESOLVER`      | El rol operativo no está habilitado en el área del turno.                    |
| `OPERATIONAL_ROLE_AREA_REQUIRED`          | `BLOCKING_OPERATIONAL` | `OPERATIONAL_ROLE` | `OPERATIONAL_ROLE_RESOLVER`      | El rol operativo requiere un área que no fue definida en el turno.           |
| `OPERATIONAL_ROLE_CONFIGURATION_CONFLICT` | `BLOCKING_OPERATIONAL` | `OPERATIONAL_ROLE` | `OPERATIONAL_ROLE_RESOLVER`      | La configuración territorial del rol operativo es contradictoria.            |
| `OPERATIONAL_SITE_UNKNOWN`                | `BLOCKING_OPERATIONAL` | `OPERATIONAL_SITE` | `OPERATIONAL_TERRITORY_RESOLVER` | La sede operativa no existe en el catálogo canónico.                         |
| `OPERATIONAL_SITE_INACTIVE`               | `BLOCKING_OPERATIONAL` | `OPERATIONAL_SITE` | `OPERATIONAL_TERRITORY_RESOLVER` | La sede operativa no está activa.                                            |
| `OPERATIONAL_SITE_ASSIGNMENT_INVALID`     | `BLOCKING_OPERATIONAL` | `OPERATIONAL_SITE` | `OPERATIONAL_TERRITORY_RESOLVER` | El trabajador no tiene una asignación laboral válida para la sede del turno. |
| `OPERATIONAL_SITE_SOURCE_MISMATCH`        | `BLOCKING_OPERATIONAL` | `OPERATIONAL_SITE` | `OPERATIONAL_TERRITORY_RESOLVER` | La sede operativa no procede del turno vigente.                              |
| `OPERATIONAL_AREA_UNKNOWN`                | `BLOCKING_OPERATIONAL` | `OPERATIONAL_AREA` | `OPERATIONAL_TERRITORY_RESOLVER` | El área operativa no existe en el catálogo canónico.                         |
| `OPERATIONAL_AREA_INACTIVE`               | `BLOCKING_OPERATIONAL` | `OPERATIONAL_AREA` | `OPERATIONAL_TERRITORY_RESOLVER` | El área operativa no está activa.                                            |
| `OPERATIONAL_AREA_SITE_MISMATCH`          | `BLOCKING_OPERATIONAL` | `OPERATIONAL_AREA` | `OPERATIONAL_TERRITORY_RESOLVER` | El área operativa no pertenece a la sede del turno.                          |
| `OPERATIONAL_AREA_ROLE_MISMATCH`          | `BLOCKING_OPERATIONAL` | `OPERATIONAL_AREA` | `OPERATIONAL_TERRITORY_RESOLVER` | El área operativa no es compatible con el rol operativo.                     |
| `OPERATIONAL_AREA_SOURCE_INVALID`         | `BLOCKING_OPERATIONAL` | `OPERATIONAL_AREA` | `OPERATIONAL_TERRITORY_RESOLVER` | La fuente declarada para el área operativa no es válida.                     |

##### Dispositivo compartido

| `issue_code`                               | Severidad      | `subject_type`         | `source`                  | `safe_message`                                                                     |
| ------------------------------------------ | -------------- | ---------------------- | ------------------------- | ---------------------------------------------------------------------------------- |
| `DEVICE_UNRESOLVED`                        | `BLOCKING_ALL` | `DEVICE`               | `DEVICE_RESOLVER`         | No fue posible resolver el dispositivo empresarial autenticado.                    |
| `DEVICE_AUTH_LINK_INVALID`                 | `BLOCKING_ALL` | `DEVICE`               | `DEVICE_RESOLVER`         | La credencial técnica no está vinculada de forma válida con el dispositivo.        |
| `DEVICE_INACTIVE`                          | `BLOCKING_ALL` | `DEVICE`               | `DEVICE_RESOLVER`         | El dispositivo compartido no está activo.                                          |
| `DEVICE_CONFIGURATION_INVALID`             | `BLOCKING_ALL` | `DEVICE`               | `DEVICE_RESOLVER`         | La configuración efectiva del dispositivo no es válida.                            |
| `DEVICE_TEMPLATE_INVALID`                  | `BLOCKING_ALL` | `DEVICE`               | `DEVICE_RESOLVER`         | La plantilla o su versión no pueden resolverse.                                    |
| `DEVICE_INSTANCE_EXPANDS_TEMPLATE`         | `BLOCKING_ALL` | `DEVICE`               | `DEVICE_RESOLVER`         | La instancia intenta ampliar los límites definidos por su plantilla.               |
| `DEVICE_ACTOR_SESSION_AMBIGUOUS`           | `BLOCKING_ALL` | `DEVICE_ACTOR_SESSION` | `DEVICE_SESSION_RESOLVER` | Existe más de una sesión de actor vigente para el dispositivo.                     |
| `DEVICE_ACTOR_SESSION_EXPIRED_AS_ACTIVE`   | `BLOCKING_ALL` | `DEVICE_ACTOR_SESSION` | `DEVICE_SESSION_RESOLVER` | Una sesión de actor expirada fue presentada como vigente.                          |
| `DEVICE_ACTOR_MISMATCH`                    | `BLOCKING_ALL` | `DEVICE_ACTOR_SESSION` | `DEVICE_SESSION_RESOLVER` | El actor efectivo no coincide con el trabajador de la sesión del dispositivo.      |
| `DEVICE_APPLICATION_CONFIGURATION_INVALID` | `BLOCKING_ALL` | `DEVICE`               | `DEVICE_RESOLVER`         | La lista de aplicaciones del dispositivo contiene una ampliación o valor inválido. |
| `DEVICE_CAPABILITY_PACKAGE_INVALID`        | `BLOCKING_ALL` | `DEVICE`               | `DEVICE_RESOLVER`         | El paquete de capacidades del dispositivo no es válido.                            |
| `DEVICE_NOT_ALLOWED_PERMISSION_CONFIGURED` | `BLOCKING_ALL` | `DEVICE`               | `DEVICE_RESOLVER`         | El dispositivo incluye una capacidad prohibida para terminales compartidos.        |
| `DEVICE_TERRITORY_MISMATCH`                | `BLOCKING_ALL` | `DEVICE`               | `DEVICE_RESOLVER`         | El territorio del dispositivo no es compatible con el contexto del actor.          |
| `DEVICE_NAVIGATION_ROLE_USED_AS_AUTHORITY` | `BLOCKING_ALL` | `DEVICE`               | `DEVICE_RESOLVER`         | Se intentó utilizar el rol de navegación como fuente de autorización.              |

##### Configuración, contrato y frescura

| `issue_code`                        | Severidad      | `subject_type`  | `source`             | `safe_message`                                                          |
| ----------------------------------- | -------------- | --------------- | -------------------- | ----------------------------------------------------------------------- |
| `STRUCTURAL_ISSUE_CODE_UNKNOWN`     | `BLOCKING_ALL` | `CONFIGURATION` | `CONTEXT_VALIDATOR`  | El contexto contiene un código estructural no reconocido.               |
| `STRUCTURAL_ISSUE_METADATA_INVALID` | `BLOCKING_ALL` | `CONFIGURATION` | `CONTEXT_VALIDATOR`  | Los metadatos de un problema estructural no coinciden con el catálogo.  |
| `RESOLVER_CONFIGURATION_MISSING`    | `BLOCKING_ALL` | `CONFIGURATION` | `CONTEXT_VALIDATOR`  | Falta una configuración obligatoria para resolver el contexto.          |
| `RESOLVER_CONFIGURATION_AMBIGUOUS`  | `BLOCKING_ALL` | `CONFIGURATION` | `CONTEXT_VALIDATOR`  | Existe más de una configuración autoritativa para resolver el contexto. |
| `CONTRACT_VERSION_UNSUPPORTED`      | `BLOCKING_ALL` | `CONTEXT`       | `CONTEXT_VALIDATOR`  | La versión contractual del contexto no es compatible con el consumidor. |
| `SCHEMA_VERSION_UNSUPPORTED`        | `BLOCKING_ALL` | `CONTEXT`       | `CONTEXT_VALIDATOR`  | La versión de esquema del contexto no es compatible con el consumidor.  |
| `RESOLUTION_TIME_INVALID`           | `BLOCKING_ALL` | `CONTEXT`       | `CONTEXT_VALIDATOR`  | El instante de resolución del contexto no es válido.                    |
| `CONTEXT_SNAPSHOT_MIXED`            | `BLOCKING_ALL` | `CONTEXT`       | `CONTEXT_VALIDATOR`  | El contexto combina hechos obtenidos de snapshots diferentes.           |
| `CONTEXT_STALE`                     | `BLOCKING_ALL` | `CONTEXT`       | `FRESHNESS_RESOLVER` | El contexto quedó obsoleto y debe resolverse nuevamente.                |

---

#### 12. Ausencias normales y códigos de disponibilidad

Las ausencias normales no producen `StructuralIssue`.

Pueden aparecer únicamente en `LaneReadiness.reason_codes`.

Catálogo inicial:

| Código                                  | Uso                                                                  |
| --------------------------------------- | -------------------------------------------------------------------- |
| `NON_LABOR_ACTOR`                       | El carril no aplica al tipo de actor                                 |
| `DEVICE_ACTOR_SESSION_NOT_AVAILABLE`    | El dispositivo está válido pero no existe sesión humana vigente      |
| `EMPLOYEE_INACTIVE`                     | El trabajador está identificado pero no puede ejercer autoridad      |
| `NO_ACTIVE_SHIFT`                       | No existe turno publicado y vigente                                  |
| `NO_ACTIVE_CHECKIN`                     | No existe sesión de check-in activa                                  |
| `NO_OPERATIONAL_AREA`                   | No existe área operativa y la ausencia puede ser legítima            |
| `BASE_ROLE_NOT_AVAILABLE`               | No existe rol base utilizable por un estado válido no contradictorio |
| `ADMINISTRATIVE_COVERAGE_NOT_AVAILABLE` | No existe cobertura territorial utilizable                           |
| `OPERATIONAL_ROLE_NOT_AVAILABLE`        | No existe rol operativo porque no existe turno                       |
| `OPERATIONAL_SITE_NOT_AVAILABLE`        | No existe sede operativa porque no existe turno                      |

Los códigos de disponibilidad:

- no se agregan a `structural_issues`;
- no sustituyen códigos bloqueantes;
- no convierten un estado contradictorio en `UNAVAILABLE`;
- pueden coexistir con `READY` únicamente cuando describen un prerrequisito
  opcional para permisos todavía desconocidos.

---

#### 13. Regla de carril base

Orden:

```text
1. aplicar BLOCKING_ALL
2. determinar si el actor es laboral
3. evaluar estado del empleado
4. aplicar BLOCKING_BASE
5. validar rol base
6. validar cobertura administrativa
7. producir estado
```

Matriz:

| Condición                            | Estado base      |
| ------------------------------------ | ---------------- |
| Existe `BLOCKING_ALL`                | `INVALID`        |
| Actor no laboral                     | `NOT_APPLICABLE` |
| Dispositivo válido sin sesión humana | `UNAVAILABLE`    |
| Empleado identificado pero inactivo  | `UNAVAILABLE`    |
| Existe `BLOCKING_BASE`               | `INVALID`        |
| Rol base y cobertura coherentes      | `READY`          |

Una cobertura válida con:

```text
mode = NONE
```

no vuelve inválido el carril base.

Puede seguir evaluando permisos no territoriales o grants con alcance propio.

---

#### 14. Regla de carril operativo

Orden:

```text
1. aplicar BLOCKING_ALL
2. determinar si el actor es laboral
3. evaluar estado del empleado
4. aplicar BLOCKING_OPERATIONAL
5. verificar active_shift
6. verificar operational_role
7. verificar operational_site
8. verificar área cuando el rol la exige
9. conservar disponibilidad de check-in y área
10. producir estado
```

Matriz:

| Condición                                 | Estado operativo                                    |
| ----------------------------------------- | --------------------------------------------------- |
| Existe `BLOCKING_ALL`                     | `INVALID`                                           |
| Actor no laboral                          | `NOT_APPLICABLE`                                    |
| Dispositivo válido sin sesión humana      | `UNAVAILABLE`                                       |
| Empleado identificado pero inactivo       | `UNAVAILABLE`                                       |
| Existe `BLOCKING_OPERATIONAL`             | `INVALID`                                           |
| No existe turno vigente sin contradicción | `UNAVAILABLE`                                       |
| Núcleo turno + rol + sede válido          | `READY`                                             |
| Falta check-in sin contradicción          | `READY` + `NO_ACTIVE_CHECKIN`                       |
| Falta área legítimamente                  | `READY` + `NO_OPERATIONAL_AREA`                     |
| Falta área requerida                      | `INVALID` mediante `OPERATIONAL_ROLE_AREA_REQUIRED` |

`READY + NO_ACTIVE_CHECKIN` significa:

```text
el núcleo operativo puede evaluar permisos T
pero no permisos T+C
```

No significa que un permiso `T+C` pueda autorizarse.

---

#### 15. Check-in cerrado o expirado

Una sesión correctamente cerrada o expirada no produce un problema
estructural.

Resultado normal:

```text
active_checkin_session = null
reason_codes incluye NO_ACTIVE_CHECKIN
```

Solo se emite:

- `CHECKIN_CLOSED_AS_ACTIVE`;
- `CHECKIN_EXPIRED_AS_ACTIVE`;

cuando una sesión cerrada o expirada es presentada como activa.

---

#### 16. Área opcional

Cuando el turno y el rol permiten operación site-wide:

```text
operational_area = null
```

es válido.

El carril puede quedar:

```text
READY
reason_codes = [NO_OPERATIONAL_AREA]
```

AUTH-CTX-017 y AUTH-CTX-020 determinarán si el permiso concreto exige área.

---

#### 17. Inactividad válida

Un empleado, rol, sede, área o dispositivo puede estar inactivo como estado
empresarial válido.

La clasificación depende del contrato:

- empleado inactivo conocido: `UNAVAILABLE`;
- dispositivo empresarial inactivo usado como principal: `DEVICE_INACTIVE`;
- rol base inactivo asignado a empleado activo: `BASE_ROLE_INACTIVE`;
- rol operativo inactivo contenido en turno vigente:
  `OPERATIONAL_ROLE_INACTIVE`;
- sede o área operativa inactiva:
  `OPERATIONAL_SITE_INACTIVE` o `OPERATIONAL_AREA_INACTIVE`.

La diferencia es si el estado representa una ausencia ordinaria o una
contradicción con un contexto que intenta utilizarlo.

---

#### 18. Causa raíz y supresión de cascadas

Cada problema deberá emitirse en su causa raíz.

Ejemplo:

```text
SHIFT_OVERLAP
→ active_shift = null
→ operational_role = null
→ operational_site = null
→ operational_area = null
```

Solo se emite:

```text
SHIFT_OVERLAP
```

No se emitirán además:

```text
OPERATIONAL_ROLE_UNKNOWN
OPERATIONAL_SITE_UNKNOWN
OPERATIONAL_AREA_UNKNOWN
```

cuando esos valores nulos sean consecuencias directas del turno ambiguo.

La supresión de cascadas evita:

- ruido;
- mensajes contradictorios;
- diagnósticos duplicados;
- listas inestables;
- falsos problemas independientes.

---

#### 19. Propiedad del problema

Cada código deberá ser emitido únicamente por su `source` canónica.

Un resolver dependiente podrá:

- consumir el problema;
- dejar su nodo en `null`;
- cambiar `lane_readiness`;
- agregar el código a `reason_codes`.

No deberá volver a emitir otro `StructuralIssue` equivalente.

---

#### 20. Deduplificación

La identidad lógica de un problema es:

```text
issue_code
+
subject_type
+
subject_id
+
source
```

Duplicados exactos se serializan una sola vez.

Si dos filas con la misma identidad tienen:

- severidades distintas;
- mensajes distintos;
- fuentes incompatibles;

se emitirá:

```text
STRUCTURAL_ISSUE_METADATA_INVALID
```

y el contexto fallará cerrado.

---

#### 21. Orden determinista

`structural_issues` se ordenará por:

1. rango de severidad;
2. `issue_code`;
3. `subject_type`;
4. `subject_id`, usando cadena vacía para `null`;
5. `source`.

Rango:

```text
BLOCKING_ALL        = 1
BLOCKING_BASE       = 2
BLOCKING_OPERATIONAL= 3
WARNING             = 4
INFO                = 5
```

`reason_codes` se ordenará:

1. códigos estructurales por el mismo orden;
2. códigos de disponibilidad alfabéticamente;
3. sin duplicados.

---

#### 22. `subject_id`

`subject_id` deberá contener únicamente un identificador interno mínimo y
necesario.

Podrá ser `null` cuando el problema afecte:

- configuración;
- contrato;
- snapshot;
- resolución global;
- una entidad que no pudo identificarse de forma segura.

No deberá contener:

- email;
- documento;
- teléfono;
- nombre;
- PIN;
- token;
- dirección;
- coordenadas;
- mensaje libre.

---

#### 23. `safe_message`

`safe_message` procede exclusivamente del catálogo.

No se construye con:

- errores SQL;
- excepciones;
- nombres de tablas;
- nombres de personas;
- identificadores sensibles;
- datos del recurso;
- credenciales;
- secretos;
- stack traces.

Las aplicaciones podrán traducir el mensaje mediante `issue_code`, pero no
cambiar su semántica.

El mensaje seguro no sustituye logs técnicos privados.

---

#### 24. Problemas desconocidos

Un resolver no podrá emitir códigos libres.

Si aparece un código no reconocido:

```text
STRUCTURAL_ISSUE_CODE_UNKNOWN
```

y ambos carriles quedan `INVALID`.

Si el código existe pero su severidad, sujeto, fuente o mensaje no coincide:

```text
STRUCTURAL_ISSUE_METADATA_INVALID
```

y ambos carriles quedan `INVALID`.

---

#### 25. `WARNING` e `INFO`

En esta versión, el catálogo congelado contiene principalmente problemas
bloqueantes.

Los futuros códigos `WARNING` e `INFO` deberán:

- tener propietario;
- no conceder autoridad;
- no ocultar un bloqueo;
- no utilizarse para degradar una contradicción;
- no afectar carriles por sí solos;
- ser probados en AUTH-CTX-030.

AUTH-CTX-028 podrá proponer advertencias de compatibilidad legacy mediante una
extensión versionada del catálogo.

No podrá crearlas físicamente sin actualización documental y pruebas.

---

#### 26. Relación con denegaciones explícitas

Un problema estructural no es una denegación configurada.

```text
StructuralIssue
→ integridad del contexto
```

```text
deny individual o transversal
→ política de autorización
```

AUTH-CTX-022 deberá conservar ambos orígenes por separado.

Una denegación no podrá utilizarse para reparar un contexto inválido.

---

#### 27. Relación con ausencia de grants

La ausencia de un allow coincidente no produce `StructuralIssue`.

Ejemplo:

```text
rol operativo válido
+
matriz sin permiso solicitado
→ contexto estructuralmente válido
→ decisión posterior DENY por ausencia de allow
```

AUTH-CTX-019 a AUTH-CTX-021 resolverán este caso.

---

#### 28. Relación con prerrequisitos

La ausencia normal de:

- turno;
- check-in;
- área;

no puede clasificarse definitivamente sin conocer el permiso solicitado.

Por ello:

- `AccessContext` registra disponibilidad;
- AUTH-CTX-017 resuelve el requisito;
- AUTH-CTX-019 y AUTH-CTX-020 aplican el requisito;
- AUTH-CTX-023 produce la decisión y razón final.

Una contradicción sí se registra inmediatamente como problema estructural.

---

#### 29. Relación con dispositivo compartido

Un dispositivo válido sin sesión de actor produce:

```text
lane_readiness.base.status = UNAVAILABLE
lane_readiness.operational.status = UNAVAILABLE
reason_codes = [DEVICE_ACTOR_SESSION_NOT_AVAILABLE]
```

No produce `DEVICE_ACTOR_SESSION_AMBIGUOUS`.

La ambigüedad, expiración presentada como vigente o incompatibilidad sí
producen `BLOCKING_ALL`.

---

#### 30. Relación con contexto obsoleto

Cuando el sistema sabe que el snapshot quedó obsoleto:

```text
CONTEXT_STALE
```

ambos carriles quedan `INVALID`.

No se permite:

- seguir usando un allow cacheado;
- recalcular parcialmente;
- reemplazar un nodo;
- cambiar únicamente el turno;
- cambiar únicamente el actor.

Debe resolverse un `AccessContext` nuevo.

---

#### 31. Snapshot mixto

`CONTEXT_SNAPSHOT_MIXED` se utiliza cuando un mismo contexto combina hechos
obtenidos en instantes o transacciones incompatibles.

Ejemplos:

- turno anterior con check-in nuevo;
- actor anterior con dispositivo nuevo;
- rol de una revisión y horario de otra;
- cobertura previa con asignaciones posteriores;
- nodo actualizado dentro de un contexto inmutable.

Es siempre `BLOCKING_ALL`.

---

#### 32. Serialización vacía

```text
structural_issues = []
```

significa:

```text
no se detectaron contradicciones estructurales catalogadas
```

No significa:

- permiso concedido;
- carriles listos;
- actor laboral;
- turno existente;
- check-in existente;
- recurso autorizado.

---

#### 33. Ejemplos integrales

##### Caso A — Empleado administrativo sin turno

```text
empleado activo
base_role válido
administrative_coverage válida
active_shift = null
structural_issues = []
```

Resultado:

```text
base.status = READY
operational.status = UNAVAILABLE
operational.reason_codes = [NO_ACTIVE_SHIFT]
```

##### Caso B — Turno válido sin check-in

```text
núcleo operativo válido
active_checkin_session = null
```

Resultado:

```text
operational.status = READY
operational.reason_codes = [NO_ACTIVE_CHECKIN]
```

Permisos `T` podrán evaluarse; permisos `T+C` no.

##### Caso C — Dos turnos vigentes

```text
SHIFT_OVERLAP
```

Resultado:

```text
base puede continuar READY
operational = INVALID
operational.reason_codes = [SHIFT_OVERLAP]
```

##### Caso D — Rol base ambiguo

```text
BASE_ROLE_AMBIGUOUS
```

Resultado:

```text
base = INVALID
operational se evalúa independientemente
```

##### Caso E — Actor y empleado incompatibles

```text
EMPLOYEE_ACTOR_MISMATCH
```

Resultado:

```text
base = INVALID
operational = INVALID
```

##### Caso F — Área opcional ausente

```text
rol site-wide
operational_area = null
```

Resultado:

```text
operational = READY
reason_codes = [NO_OPERATIONAL_AREA]
```

##### Caso G — Área requerida ausente

```text
OPERATIONAL_ROLE_AREA_REQUIRED
```

Resultado:

```text
operational = INVALID
```

##### Caso H — Check-in cerrado

```text
sesión cerrada correctamente
active_checkin_session = null
```

Resultado:

```text
operational puede permanecer READY
reason_codes = [NO_ACTIVE_CHECKIN]
```

No se emite `CHECKIN_CLOSED_AS_ACTIVE`.

##### Caso I — Check-in cerrado presentado como activo

```text
CHECKIN_CLOSED_AS_ACTIVE
```

Resultado:

```text
operational = INVALID
```

##### Caso J — Dispositivo activo sin actor

```text
device_status = ACTIVE
actor_session_id = null
```

Resultado:

```text
base = UNAVAILABLE
operational = UNAVAILABLE
reason_codes = [DEVICE_ACTOR_SESSION_NOT_AVAILABLE]
```

##### Caso K — Dispositivo con dos actores

```text
DEVICE_ACTOR_SESSION_AMBIGUOUS
```

Resultado:

```text
base = INVALID
operational = INVALID
```

##### Caso L — Rol válido sin grant

```text
structural_issues = []
lane correspondiente = READY
matched_allows = []
```

Resultado posterior:

```text
DENY por ausencia de allow
```

No existe problema estructural.

##### Caso M — Contexto obsoleto

```text
CONTEXT_STALE
```

Resultado:

```text
base = INVALID
operational = INVALID
```

Se requiere nueva resolución.

---

#### 34. Relación con tareas posteriores

##### AUTH-CTX-016

Incluirá aplicación y permiso solicitado sin modificar el catálogo
estructural.

##### AUTH-CTX-017

Consumirá `lane_readiness`, turno, check-in, área y compatibilidad de
dispositivo para resolver `authorization_requirement`.

##### AUTH-CTX-018

Resolverá recurso y territorio. Sus contradicciones pertenecerán a
`AuthorizationDecision`, no se mezclarán retroactivamente dentro del snapshot
de `AccessContext`.

##### AUTH-CTX-019 y AUTH-CTX-020

No podrán producir `ALLOW` desde un carril `INVALID`.

Un carril `UNAVAILABLE` solo podrá participar si el requisito concreto no lo
necesita.

##### AUTH-CTX-021

Registrará allows coincidentes. No convertirá un issue en allow.

##### AUTH-CTX-022

Mapeará problemas bloqueantes a `structural_denies` y conservará separadas
las denegaciones individuales y transversales.

##### AUTH-CTX-023

Producirá decisión y razones finales sin exponer información sensible.

##### AUTH-CTX-024

Registrará evidencia auditable de códigos, sujetos, fuentes y carriles.

##### AUTH-CTX-025

Diseñará el productor SQL de:

- `lane_readiness`;
- `structural_issues`;
- deduplicación;
- orden;
- supresión de cascadas;
- validación de metadatos.

##### AUTH-CTX-026

Diseñará el evaluador que consume los estados y códigos.

##### AUTH-CTX-027

Obligará a las aplicaciones a dejar de inventar razones locales.

##### AUTH-CTX-028

Diseñará compatibilidad legacy y podrá proponer una extensión versionada de
códigos de adaptación.

##### AUTH-CTX-029

Definirá invalidación y detección de `CONTEXT_STALE`.

##### AUTH-CTX-030

Definirá pruebas exhaustivas del catálogo, severidades, carriles, orden,
deduplicación y casos negativos.

##### BLOQUE E3

Definirá almacenamiento, exposición, índices, funciones privadas y retención.

##### BLOQUE E5

Creará los paquetes implementables del productor, evaluador, consumidores y
observabilidad.

##### BLOQUE R

Implementará físicamente contratos, funciones, validaciones, pruebas,
compatibilidad y rollout.

---

#### 35. Evolución del catálogo

El catálogo queda asociado a `AccessContext@1.0.0`.

Cambios compatibles:

- agregar un código nuevo;
- agregar una traducción de interfaz;
- agregar pruebas;
- ampliar evidencia privada sin cambiar el contrato público.

Cambios incompatibles:

- reutilizar un código;
- cambiar su severidad;
- cambiar su sujeto;
- cambiar su fuente;
- cambiar su significado;
- convertir una ausencia normal en bloqueo sin análisis;
- cambiar la forma de `StructuralIssue`;
- cambiar la forma de `LaneReadiness`.

Un cambio incompatible exige nueva versión contractual.

---

#### 36. Fuera del alcance

AUTH-CTX-015 no:

- decide permisos;
- consulta matrices;
- resuelve recursos;
- crea allows;
- crea denegaciones individuales;
- crea denegaciones transversales;
- define mensajes completos de UX;
- define códigos HTTP;
- define logs técnicos;
- define alertas;
- crea paneles;
- crea tablas;
- crea funciones SQL;
- crea RPC;
- crea RLS;
- crea migraciones;
- implementa caché;
- modifica Supabase;
- modifica aplicaciones.

Cada responsabilidad posterior tiene destino explícito en las secciones 34 y
35.

---

#### 37. Riesgos controlados

##### Riesgo 1 — Ausencia normal tratada como corrupción

Control:

```text
UNAVAILABLE separado de INVALID
```

##### Riesgo 2 — Contradicción ocultada como ausencia

Control:

```text
problema catalogado
→ INVALID
```

##### Riesgo 3 — Error derivado multiplica mensajes

Control:

```text
causa raíz + supresión de cascadas
```

##### Riesgo 4 — Mensaje técnico filtra datos

Control:

```text
safe_message fijo por catálogo
```

##### Riesgo 5 — Aplicaciones inventan códigos

Control:

```text
catálogo cerrado + código desconocido bloqueante
```

##### Riesgo 6 — Check-in ausente bloquea permisos T

Control:

```text
READY + NO_ACTIVE_CHECKIN
```

##### Riesgo 7 — Área nula funciona como wildcard

Control:

```text
NO_OPERATIONAL_AREA
≠
todas las áreas
```

##### Riesgo 8 — Problema del carril operativo bloquea administración

Control:

```text
BLOCKING_OPERATIONAL
≠
BLOCKING_ALL
```

---

#### 38. Criterios de aprobación

AUTH-CTX-015 podrá aprobarse cuando se acepte que:

1. se conservan las formas de `LaneReadiness` y `StructuralIssue`;
2. la tarea es compatible con `AccessContext@1.0.0`;
3. `READY` no significa `ALLOW`;
4. `UNAVAILABLE` representa ausencia o estado válido;
5. `INVALID` representa contradicción bloqueante;
6. `NOT_APPLICABLE` representa un carril ajeno al actor;
7. la ausencia normal no produce issue;
8. los problemas estructurales no son denegaciones configuradas;
9. la falta de grant no produce issue;
10. los prerrequisitos se aplican después;
11. `BLOCKING_ALL` invalida ambos carriles;
12. `BLOCKING_BASE` invalida solo el base;
13. `BLOCKING_OPERATIONAL` invalida solo el operativo;
14. `WARNING` no concede ni bloquea por sí sola;
15. `INFO` no concede ni bloquea por sí sola;
16. los tipos de sujeto quedan cerrados;
17. las fuentes resolutoras quedan cerradas;
18. los códigos usan `UPPER_SNAKE_CASE`;
19. los códigos son estables e inmutables;
20. el catálogo inicial contiene `100` códigos;
21. un código desconocido falla cerrado;
22. metadatos incompatibles fallan cerrado;
23. los mensajes seguros proceden del catálogo;
24. no contienen datos sensibles;
25. los problemas se emiten en la causa raíz;
26. se suprimen cascadas derivadas;
27. cada código tiene un resolver propietario;
28. la identidad lógica de duplicado queda definida;
29. conflictos de metadatos producen issue global;
30. el orden de issues es determinista;
31. el orden de reason codes es determinista;
32. `subject_id` es mínimo y seguro;
33. una lista vacía no significa autorización;
34. empleado inactivo conocido produce indisponibilidad;
35. ausencia de turno produce `UNAVAILABLE`;
36. ausencia de check-in puede coexistir con operativo `READY`;
37. permisos `T` no quedan bloqueados por esa ausencia;
38. permisos `T+C` la consumirán posteriormente;
39. área opcional ausente puede coexistir con `READY`;
40. área requerida ausente produce invalidez;
41. sesión cerrada normal no produce issue;
42. sesión cerrada presentada como activa sí produce issue;
43. dispositivo válido sin actor produce indisponibilidad;
44. sesiones de dispositivo ambiguas producen invalidez global;
45. un problema de rol base no bloquea automáticamente el carril operativo;
46. un problema operativo no bloquea automáticamente el carril base;
47. problemas de identidad o snapshot bloquean ambos;
48. contexto obsoleto nunca se reutiliza;
49. no se recalcula parcialmente;
50. AUTH-CTX-016 a AUTH-CTX-024 consumirán los códigos sin redefinirlos;
51. AUTH-CTX-025 diseñará el productor;
52. AUTH-CTX-026 diseñará el evaluador;
53. AUTH-CTX-027 eliminará razones locales;
54. AUTH-CTX-028 gobernará compatibilidad legacy;
55. AUTH-CTX-029 gobernará frescura;
56. AUTH-CTX-030 probará catálogo y precedencia;
57. E3, E5 y BLOQUE R tienen destinos físicos explícitos;
58. no se implementa código, migraciones ni cambios en Supabase.

---

#### 39. Estado final de la propuesta

| Tarea        | Estado      | Relación                  |
| ------------ | ----------- | ------------------------- |
| AUTH-CTX-014 | APROBADA    | Tarea anterior            |
| AUTH-CTX-015 | APROBADA    | Tarea actual              |
| AUTH-CTX-016 | NO INICIADA | Tarea siguiente reservada |

La continuidad propuesta queda:

```text
AUTH-CTX-014 — APROBADA
        ↓
AUTH-CTX-015 — APROBADA
        ↓
AUTH-CTX-016 — NO INICIADA
```

No se avanza a AUTH-CTX-016 hasta recibir aprobación explícita de
AUTH-CTX-015.



AUTHORIZATION DECISION
