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


