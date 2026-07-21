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


