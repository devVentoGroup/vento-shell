### ✅ AUTH-CTX-008 — Incluir rol base vigente

**Estado:** APROBADA  
**Bloque:** BLOQUE E — Contexto y decisión de autorización unificados  
**Naturaleza:** Refinamiento documental del nodo `base_role` de `AccessContext`  
**Implementación física:** No incluida  
**Tarea anterior vigente:** AUTH-CTX-007 — APROBADA  
**Tarea posterior inmediata:** AUTH-CTX-009 — Incluir cobertura administrativa por sede y área  
**Tarea diferida relacionada:** AUTH-MOD-021 — Definir rol base mínimo no privilegiado para trabajadores puramente operativos  
**Contrato afectado:** `AccessContext@1.0.0`  
**Nodo afectado:** `base_role`  
**Referencia relacionada:** `employee.base_role_code`  
**Dataset canónico relacionado:** `vento.authorization.base-role-grants@1.0.0`  
**Roles base canónicos vigentes:** 7  
**Cambio contractual:** Aclaración normativa compatible; no cambia la forma publicada  
**Cambios físicos permitidos:** No

Esta tarea define de forma exhaustiva la semántica, procedencia, vigencia,
validez, clasificación, resolución y límites del rol base incluido en
`AccessContext`.

No modifica la estructura raíz aprobada de `AccessContext`, no agrega campos,
no cambia `contract_version`, no cambia `schema_version`, no crea nuevos roles,
no corrige datos legacy y no implementa tipos, funciones SQL, RPC, RLS,
migraciones, adaptadores, guards, aplicaciones ni cambios físicos en
Supabase.

---

#### 1. Objetivo

Definir el nodo `base_role` de manera que Vento OS pueda responder de forma
inequívoca:

1. si el empleado relevante tiene un rol base asignado;
2. cuál es el código exacto observado;
3. si ese código pertenece al catálogo canónico de roles base;
4. si el rol se encuentra vigente y habilitado;
5. qué fuente normativa produjo la asignación;
6. cuándo el rol puede habilitar estructuralmente el carril base;
7. cuándo el rol debe conservarse únicamente para trazabilidad;
8. cuándo `base_role` debe ser `null`;
9. cómo distinguir ausencia, inactividad, legado, código desconocido y
   ambigüedad;
10. cómo relacionar `employee.base_role_code` con `base_role` sin confundir el
    valor observado con un rol validado;
11. cómo impedir que el rol base se obtenga desde el turno, dispositivo,
    navegación, JWT o frontend;
12. cómo impedir que un oficio operativo legacy siga concediendo autoridad
    permanente;
13. cómo conservar la independencia entre carril base y carril operativo;
14. cómo tratar empleados activos que todavía conservan un oficio legacy en
    la asignación base;
15. cómo tratar identidades de cliente, dispositivo o sistema;
16. cómo mantener la atribución histórica cuando el empleado o rol están
    inactivos;
17. qué problemas estructurales deberá producir una resolución inválida;
18. qué cambios deberán invalidar un contexto previamente resuelto;
19. cómo relacionar el rol con matrices explícitas sin convertir el nombre del
    rol en autorización;
20. qué elementos quedan reservados para las tareas posteriores.

La tarea deberá impedir interpretaciones como:

```text
employees.role
=
permiso efectivo
=
bypass
=
rol operativo
=
cobertura territorial
```

La relación correcta será:

```text
EMPLEADO RESUELTO
        ↓
CÓDIGO DE ROL BASE OBSERVADO
        ↓
VALIDACIÓN CONTRA CATÁLOGO CANÓNICO
        ↓
BASE ROLE CONTEXT
        ↓
READINESS ESTRUCTURAL DEL CARRIL BASE
        ↓
MATRIZ + ALCANCE + RECURSO + DENEGACIONES
        ↓
DECISIÓN DE AUTORIZACIÓN POSTERIOR
```

---

#### 2. Decisión principal

`base_role` representa el rol laboral permanente, administrativo o funcional
que el empleado tiene asignado dentro del modelo canónico de autorización.

Regla canónica:

```text
base_role
=
rol base único
+ asignación autoritativa
+ código canónico
+ estado vigente verificable
```

El rol base:

- pertenece al empleado;
- es permanente hasta una modificación administrativa válida;
- no depende del turno;
- no depende del check-in;
- no depende del dispositivo;
- no depende de la sede seleccionada;
- no depende del área seleccionada;
- no se obtiene del rol operativo;
- no se infiere desde permisos existentes;
- no concede autorización por su nombre.

Por tanto:

```text
rol base activo
≠ permiso concedido
≠ cobertura global
≠ bypass operativo
≠ decisión ALLOW
```

Y:

```text
rol base inválido
→ bloquea el carril base
→ no crea automáticamente un bloqueo del carril operativo
```

La evaluación final de un permiso seguirá requiriendo:

```text
ROL BASE VIGENTE
+ ALLOW BASE EXPLÍCITO
+ ALCANCE COINCIDENTE
+ RECURSO VÁLIDO
+ CONDICIONES DEL PERMISO
+ AUSENCIA DE DENEGACIÓN APLICABLE
= AUTORIZACIÓN BASE POSIBLE
```

---

#### 3. Contrato vigente del nodo

Se conserva sin cambios la forma publicada en AUTH-CTX-001 y
AUTH-CTX-004:

```ts
type BaseRoleContext = {
  role_code: string;
  role_status: "ACTIVE" | "INACTIVE" | "INVALID";
  assignment_source: string;
};
```

No se agregan campos en esta tarea.

La publicación permanece:

```text
AccessContext
contract_version = 1.0.0
schema_version   = 1.0.0
```

Los datos adicionales necesarios para auditoría o diagnóstico deberán
conservarse en:

- `structural_issues`;
- `resolution_metadata`;
- fuentes internas del resolver;
- auditoría de decisiones posterior.

No deberán incorporarse silenciosamente nuevos campos al nodo publicado.

---

#### 4. Base normativa

Esta propuesta conserva sin cambios:

- ADR-AUTH-001;
- AUTH-MOD-001 — identidad laboral y actor efectivo;
- AUTH-MOD-002 — separación entre rol base y rol operativo;
- AUTH-MOD-003 — roles administrativos globales;
- AUTH-MOD-004 — roles administrativos por sede;
- AUTH-MOD-005 — roles operativos definitivos;
- AUTH-MOD-006 — casos híbridos administrativo-operativos;
- AUTH-MOD-007 a AUTH-MOD-019 — territorio, contexto, modalidades y
  precedencia;
- AUTH-CAT-001 a AUTH-CAT-024;
- AUTH-RBAC-001 a AUTH-RBAC-028;
- AUTH-CTX-001 a AUTH-CTX-007.

Reglas heredadas obligatorias:

```text
ROL BASE
≠ IDENTIDAD
```

```text
ROL BASE
≠ ROL OPERATIVO
```

```text
NOMBRE DEL ROL
≠ AUTORIZACIÓN
```

```text
ROL BASE
→ plantilla potencial de concesiones del carril BASE
```

```text
ROL OPERATIVO
→ plantilla potencial de concesiones del carril OPERATIONAL
```

```text
SIN ALLOW APLICABLE
→ DEFAULT_DENY
```

---

#### 5. Separación de conceptos

Los siguientes conceptos deberán permanecer separados:

| Concepto                            | Pregunta que responde                                                 |
| ----------------------------------- | --------------------------------------------------------------------- |
| `principal`                         | ¿Quién o qué presentó la credencial técnica?                          |
| `domain_identity`                   | ¿Qué entidad empresarial representa en la vía solicitada?             |
| `actor_effective`                   | ¿A quién se atribuye la acción?                                       |
| `employee`                          | ¿Qué identidad laboral mínima corresponde al actor empleado?          |
| `employee.base_role_code`           | ¿Qué código de asignación base fue observado en la identidad laboral? |
| `base_role`                         | ¿Ese código representa un rol base canónico y vigente?                |
| `assigned_sites` / `assigned_areas` | ¿Qué afiliaciones territoriales laborales existen?                    |
| `administrative_coverage`           | ¿Qué cobertura base puede evaluarse?                                  |
| `active_shift`                      | ¿Qué asignación operativa temporal está vigente?                      |
| `operational_role`                  | ¿Qué función temporal deriva del turno?                               |

Regla:

```text
employee.base_role_code
→ referencia observada

base_role
→ resultado validado
```

No se permitirá:

```text
employee.base_role_code no nulo
→ asumir base_role ACTIVE
```

---

#### 6. Aplicabilidad del nodo

`base_role` aplica exclusivamente cuando existe una identidad laboral
resoluble.

##### 6.1 Actor empleado

Cuando:

```text
actor_effective.actor_type = EMPLOYEE
```

y existe un `employee` coherente, el resolver deberá intentar construir
`base_role`.

##### 6.2 Identidad laboral sin actor empleado

En una vía donde la identidad de dominio sea `EMPLOYEE` pero el actor efectivo
no pueda resolverse como el mismo empleado:

```text
base_role = null
```

La contradicción deberá registrarse y fallar de forma cerrada.

##### 6.3 Cliente

En una vía puramente de cliente:

```text
domain_identity = CUSTOMER
actor_effective = CUSTOMER
employee = null
base_role = null
```

##### 6.4 Dispositivo sin actor humano

Un dispositivo compartido sin sesión de actor válida:

```text
domain_identity = DEVICE
actor_effective = UNRESOLVED
employee = null
base_role = null
```

##### 6.5 Sistema autónomo

Un proceso autónomo:

```text
domain_identity = SYSTEM
actor_effective = SYSTEM
employee = null
base_role = null
```

No se fabricará un rol base técnico para servicios, bots, integraciones o
`service_role`.

---

#### 7. Catálogo canónico de roles base

El modelo canónico reconoce exactamente siete roles base con matrices
publicadas:

```text
propietario
gerente_general
gerente
supervisor
auxiliar_administrativa
contador
marketing
```

Estos son los únicos códigos que pueden producir:

```text
role_status = ACTIVE
```

bajo la versión contractual actual, siempre que la asignación y el registro
vigente sean válidos.

El conjunto se organiza conceptualmente así:

```text
ROLES ADMINISTRATIVOS GLOBALES
├── propietario
└── gerente_general

ROLES ADMINISTRATIVOS POR SEDE
├── gerente
└── supervisor

ROLES FUNCIONALES BASE
├── auxiliar_administrativa
├── contador
└── marketing
```

Esta clasificación:

- describe responsabilidad permanente;
- orienta qué alcances pueden asignarse;
- no concede permisos automáticamente;
- no produce jerarquía automática de grants;
- no produce herencia automática entre roles.

---

#### 8. Rol base canónico no equivale a rol privilegiado

Todo rol del catálogo base es una plantilla de responsabilidad, no un bypass.

Ejemplos:

```text
propietario
≠ todos los permisos
```

```text
gerente_general
≠ propietario
```

```text
gerente
≠ alcance global
```

```text
supervisor
≠ gerente con menos filas implícitas
```

```text
contador
≠ acceso completo a NUMERA
```

```text
marketing
≠ administrador global de contenido
```

Los permisos proceden exclusivamente de:

- dataset canónico de matriz base;
- concesiones individuales base;
- denegaciones aplicables;
- modalidad del permiso;
- alcance;
- recurso;
- restricciones contractuales.

---

#### 9. Definición de rol base vigente

Un rol base estará vigente cuando se cumplan simultáneamente las siguientes
condiciones:

```text
1. Existe un empleado relevante y coherente.
2. Existe exactamente una asignación base identificable.
3. La asignación pertenece al mismo empleado.
4. El código está normalizado de forma exacta.
5. El código pertenece al catálogo canónico de siete roles base.
6. El rol está activo en la versión de catálogo aplicable.
7. La asignación no está revocada, retirada ni reemplazada.
8. La fuente de asignación es autoritativa.
9. No existe ambigüedad entre varias asignaciones concurrentes.
10. No existe contradicción con el snapshot laboral.
```

Resultado:

```text
role_status = ACTIVE
```

La vigencia del rol no reemplaza la validación independiente del empleado.

Por tanto, es posible conservar:

```text
employee.is_active = false
base_role.role_status = ACTIVE
```

para trazabilidad histórica, pero:

```text
lane_readiness.base = INVALID
```

porque un empleado inactivo bloquea toda autoridad laboral.

---

#### 10. Fuente autoritativa de asignación

La asignación base deberá proceder de una relación laboral administrativa
única y verificable.

Conceptualmente:

```text
EMPLEADO
        ↓
ASIGNACIÓN BASE VIGENTE
        ↓
CATÁLOGO CANÓNICO DE ROLES BASE
```

La implementación física objetivo se definirá en BLOQUE E3 y BLOQUE R.

Durante la transición, `employees.role` puede constituir la fuente física
observada, pero el contrato no deberá acoplar su semántica a un nombre de
columna o esquema concreto.

Regla:

```text
fuente física actual
≠ contrato normativo permanente
```

El resolver deberá reportar una fuente normativa estable mediante
`assignment_source`.

---

#### 11. `assignment_source`

`assignment_source` identifica la clase normativa de relación utilizada para
resolver el rol base.

Valores iniciales canónicos:

```text
CANONICAL_EMPLOYEE_ROLE_ASSIGNMENT
LEGACY_EMPLOYEE_ROLE_ASSIGNMENT
```

##### 11.1 `CANONICAL_EMPLOYEE_ROLE_ASSIGNMENT`

Se utiliza cuando:

- existe una asignación administrativa autoritativa;
- el código pertenece al catálogo base canónico;
- la relación está vigente;
- no existe ambigüedad.

Puede producir:

```text
role_status = ACTIVE
```

o, cuando el rol canónico está retirado temporalmente:

```text
role_status = INACTIVE
```

##### 11.2 `LEGACY_EMPLOYEE_ROLE_ASSIGNMENT`

Se utiliza cuando el valor observado procede del modelo heredado y no puede
considerarse una asignación base canónica vigente.

Ejemplos:

```text
barista
bodeguero
cajero
cocinero
conductor
mesero
panadero
pastelero
repostero
```

Siempre produce:

```text
role_status = INVALID
```

No podrá utilizarse para consultar el dataset canónico de matriz base.

`assignment_source`:

- no contendrá nombres de tablas;
- no contendrá SQL;
- no contendrá una ruta de repositorio;
- no contendrá un UUID;
- no contendrá texto libre de UI;
- no se obtendrá desde el frontend;
- no concederá permisos.

Un valor desconocido o vacío hará inválida la resolución.

---

#### 12. Semántica de `role_code`

`role_code` contiene el código exacto observado y normalizado de la asignación
base.

Reglas:

1. se trata como identificador opaco;
2. la comparación es exacta;
3. no se aplican coincidencias parciales;
4. no se aplican reglas por prefijo;
5. no se aplican traducciones por nombre humano;
6. no se aplican correcciones ortográficas silenciosas;
7. no se infiere desde un correo o cargo;
8. no se convierte automáticamente a un rol operativo;
9. no se utiliza como permission key;
10. no se utiliza como actor_id.

Incorrecto:

```text
%gerente%
→ gerente
```

```text
cocinero
→ produccion_cocina
```

```text
bodeguero
→ elegir automáticamente catálogo base u operativo
```

Correcto:

```text
código exacto
+ namespace conceptual del nodo base_role
+ validación canónica
```

---

#### 13. Semántica de `role_status`

`role_status` representa el resultado efectivo de validar el código y su
asignación como rol base.

Valores:

```text
ACTIVE
INACTIVE
INVALID
```

No representa:

- estado del empleado;
- estado del turno;
- estado del check-in;
- existencia de permisos;
- cobertura territorial;
- resultado final de autorización.

El estado laboral continúa en `employee`.

El estado operativo continúa en los nodos del carril operativo.

---

#### 14. `role_status = ACTIVE`

Se utiliza exclusivamente cuando:

```text
código canónico conocido
+ asignación autoritativa única
+ rol habilitado
+ relación vigente
+ fuente válida
= ACTIVE
```

Un rol activo permite que el carril base avance a las validaciones
posteriores.

No significa:

```text
matriz encontrada
permiso encontrado
alcance coincidente
recurso autorizado
ALLOW
```

Ejemplo:

```text
base_role.role_code = contador
base_role.role_status = ACTIVE
```

La solicitud de:

```text
viso.security.grants.create
```

seguirá denegada si la matriz del contador no contiene esa capacidad.

---

#### 15. `role_status = INACTIVE`

Se utiliza cuando el código pertenece al catálogo canónico, pero el rol o la
asignación se encuentra expresamente inactivo, retirado o suspendido para
nuevas decisiones.

Ejemplos conceptuales:

- rol canónico temporalmente deshabilitado;
- asignación reemplazada cuya vigencia terminó;
- rol retirado del catálogo activo pero conservado para historial;
- relación administrativa suspendida sin borrar el registro.

Consecuencia:

```text
base_role se conserva
role_status = INACTIVE
lane_readiness.base = INVALID
```

Un rol inactivo:

- no consulta grants activos;
- no habilita permisos individuales base por sí solo;
- no se reemplaza por otro rol;
- no se transforma en rol operativo;
- no se reactiva por turno o check-in.

---

#### 16. `role_status = INVALID`

Se utiliza cuando existe un código observado, pero no puede reconocerse como
rol base canónico vigente.

Casos iniciales:

```text
código desconocido
código malformado
oficio operativo legacy
código existente solo en operational_roles
código duplicado entre catálogos
fuente no autorizada
asignación ambigua
asignación perteneciente a otro empleado
mapeo automático no aprobado
inconsistencia entre fuentes
```

Consecuencia:

```text
base_role se conserva para diagnóstico
role_status = INVALID
lane_readiness.base = INVALID
```

`INVALID` nunca concederá autoridad.

---

#### 17. `base_role = null`

El nodo será `null` cuando no exista un código de asignación base que pueda
representarse de forma inequívoca.

Casos:

- no existe identidad laboral;
- `employee = null`;
- el actor no es empleado;
- no existe asignación base;
- el campo observado está vacío;
- existen varias asignaciones y no puede seleccionarse una;
- la identidad laboral está contradictoria;
- la relación no pertenece al actor empleado.

Regla:

```text
base_role = null
→ causa explícita en structural_issues
```

No se fabricará:

```text
role_code = "none"
role_code = "employee"
role_code = "staff"
role_code = "unknown"
```

mientras esos códigos no hayan sido aprobados formalmente como roles base.

---

#### 18. Relación con `employee.base_role_code`

`employee.base_role_code` conserva el valor observado en el snapshot laboral.

`base_role` conserva el resultado de validarlo.

Matriz:

| `employee.base_role_code`      | `base_role`                                   | Interpretación                |
| ------------------------------ | --------------------------------------------- | ----------------------------- |
| Código canónico activo         | Objeto `ACTIVE`                               | Rol base vigente              |
| Código canónico inactivo       | Objeto `INACTIVE`                             | Rol conocido no utilizable    |
| Código legacy o desconocido    | Objeto `INVALID`                              | Valor atribuible, no canónico |
| `null` o vacío                 | `null`                                        | Asignación ausente            |
| Varias fuentes contradictorias | `null` o `INVALID` según evidencia inequívoca | Resolución bloqueada          |

Regla:

```text
employee.base_role_code
≠ base_role.role_code validado
```

hasta completar la validación.

Cuando existe un objeto `base_role`, ambos códigos deberán coincidir
exactamente.

Si no coinciden:

```text
base_role = null
```

o:

```text
role_status = INVALID
```

según cuál valor pueda conservarse de forma segura para diagnóstico.

No se seleccionará el valor más privilegiado.

---

#### 19. Tratamiento de los oficios base legacy

Los siguientes códigos pertenecen al modelo heredado de oficios almacenados
como roles base:

```text
barista
bodeguero
cajero
cocinero
conductor
mesero
panadero
pastelero
repostero
```

Bajo el modelo canónico actual:

```text
OFICIO LEGACY
≠ ROL BASE CANÓNICO
```

Por tanto:

```text
assignment_source = LEGACY_EMPLOYEE_ROLE_ASSIGNMENT
role_status       = INVALID
```

Los oficios legacy:

- no consultan el dataset de los siete roles base;
- no conservan automáticamente los grants históricos;
- no se transforman automáticamente en rol operativo;
- no pueden funcionar como fallback de turno;
- no pueden producir bypass permanente;
- no se eliminan físicamente durante esta tarea;
- conservan trazabilidad para la transición.

La implementación deberá inventariar cada empleado afectado antes del
cutover.

---

#### 20. Caso especial `bodeguero`

`bodeguero` existe históricamente en:

```text
catálogo base legacy
catálogo operativo
```

Dentro de `base_role`, el código observado en una asignación legacy será:

```text
role_code = bodeguero
role_status = INVALID
assignment_source = LEGACY_EMPLOYEE_ROLE_ASSIGNMENT
```

Dentro del carril operativo, el mismo texto podrá representar un rol
operativo únicamente cuando derive de un turno válido y se procese en
`operational_role`.

La igualdad textual no permite fusionar ambos conceptos.

Regla:

```text
base_role.role_code = "bodeguero"
≠
operational_role.role_code = "bodeguero"
```

porque pertenecen a namespaces contractuales diferentes.

El modelo físico objetivo deberá evitar códigos duplicados entre catálogos,
pero su transición se define en E3 y BLOQUE R.

---

#### 21. Rol base mínimo de trabajadores puramente operativos

AUTH-MOD-002 estableció que todo empleado operativo necesita un rol base no
privilegiado para capacidades laborales permanentes esenciales.

El código definitivo de ese rol mínimo no fue incorporado a la versión actual
del catálogo de siete roles base ni al dataset
`vento.authorization.base-role-grants@1.0.0`.

Esta necesidad queda asignada obligatoriamente a:

```text
AUTH-MOD-021
— Definir rol base mínimo no privilegiado para trabajadores puramente operativos
```

`AUTH-MOD-021` deberá existir como tarea documental explícita y resolverse
antes de:

- iniciar `AUTH-CTX-028`;
- publicar una nueva versión del catálogo o dataset de roles base;
- ejecutar cualquier implementación física que transforme o retire oficios
  legacy.

No bloquea `AUTH-CTX-009`, porque esta última define la cobertura
administrativa de los roles base vigentes sin crear el rol mínimo.

AUTH-MOD-021 deberá definir, como mínimo:

1. el código canónico definitivo del rol;
2. su nombre humano y propósito empresarial;
3. sus capacidades base permanentes mínimas;
4. las capacidades que permanecerán expresamente prohibidas;
5. su relación con los siete roles base actualmente publicados;
6. si exige una nueva versión del catálogo y del dataset base;
7. el tratamiento de empleados que conservan oficios legacy;
8. la compatibilidad temporal hasta el cutover;
9. el impacto sobre matrices, `AccessContext`, pruebas y migración;
10. si `ADR-AUTH-001` continúa siendo compatible, requiere una enmienda
    explícita o debe ser sustituido mediante un nuevo ADR;
11. las tareas físicas exactas de E3, H y R que materializarán la decisión.

`AUTH-MOD-021` no podrá aprobarse sin cerrar expresamente el impacto sobre
`ADR-AUTH-001`.

Hasta aprobar AUTH-MOD-021 no se inventarán silenciosamente códigos como:

```text
trabajador
colaborador
empleado
staff
```

Regla vigente:

```text
CÓDIGO NO APROBADO
→ NO ES ROL BASE CANÓNICO
```

Consecuencia contractual transitoria:

- un trabajador que conserve un oficio legacy tendrá el carril base inválido;
- su carril operativo podrá resolverse independientemente si cumple sus
  propios requisitos;
- AUTH-CTX-028 solo podrá diseñar compatibilidad después de la decisión de
  AUTH-MOD-021;
- E3 y BLOQUE R implementarán la solución aprobada mediante estructuras,
  backfills, migraciones y rollback versionados en `vento-shell`.

Esta tarea no crea todavía el rol mínimo ni modifica físicamente el catálogo,
pero deja su resolución con tarea, orden y puertas explícitas.

---

#### 22. Independencia del carril operativo

Un problema de rol base afecta el carril base.

No reemplaza ni invalida automáticamente los hechos del carril operativo.

Ejemplo:

```text
employee activo
+ base_role legacy INVALID
+ turno válido
+ rol operativo válido
+ sede y área compatibles
```

Resultado estructural:

```text
base lane        = INVALID
operational lane = puede estar READY
```

La decisión posterior aplicará la modalidad del permiso:

| Modalidad              | Efecto de base inválida                                    |
| ---------------------- | ---------------------------------------------------------- |
| `BASE_ONLY`            | DENY                                                       |
| `OPERATIONAL_ONLY`     | El carril operativo puede autorizar si está completo       |
| `BASE_OR_OPERATIONAL`  | El carril operativo puede autorizar de forma independiente |
| `BASE_AND_OPERATIONAL` | DENY porque el componente base es obligatorio              |

No se mezclarán fragmentos de ambos carriles.

---

#### 23. Empleado inactivo

Cuando el empleado es conocido pero está inactivo:

- `employee` se conserva;
- `base_role` puede conservarse para trazabilidad;
- el estado del rol se calcula de forma independiente;
- toda autoridad laboral queda bloqueada.

Ejemplo:

```text
employee.is_active        = false
base_role.role_code       = contador
base_role.role_status     = ACTIVE
lane_readiness.base       = INVALID
lane_readiness.operational = INVALID
```

No se modificará `role_status` a `INACTIVE` únicamente porque el empleado esté
inactivo.

Esto evita confundir:

```text
estado del empleado
≠ estado del rol
```

---

#### 24. Cambio de rol base

Un empleado puede tener exactamente un rol base vigente en un instante.

Cuando exista un cambio administrativo válido:

```text
rol anterior
→ termina vigencia

rol nuevo
→ inicia vigencia
```

El contexto resuelto antes del cambio queda obsoleto.

No se permite:

```text
rol anterior + rol nuevo
→ unión temporal de matrices
```

No se permite:

```text
mantener grants del rol anterior
hasta cerrar sesión
```

La invalidación y caché se definirán en AUTH-CTX-029.

---

#### 25. Exactamente un rol base vigente

Para un empleado activo con modelo canónico completo deberá existir:

```text
0 o 1 rol base resoluble
```

El estado esperado de operación normal es:

```text
exactamente 1 rol base ACTIVE
```

Casos:

| Cantidad resoluble | Resultado                                                               |
| -----------------: | ----------------------------------------------------------------------- |
|                  0 | `base_role = null`, carril base inválido o no aplicable según identidad |
|                  1 | Validar código, fuente y estado                                         |
|           Más de 1 | Ambigüedad; no seleccionar silenciosamente                              |

Cuando existan varias asignaciones concurrentes:

```text
base_role = null
lane_readiness.base = INVALID
```

Si un código observado puede conservarse inequívocamente para diagnóstico,
podrá emitirse `INVALID`, pero nunca se elegirá el rol más nuevo, más amplio o
más privilegiado sin una regla administrativa aprobada.

---

#### 26. Fuentes prohibidas

El rol base no podrá resolverse desde:

- claims de JWT;
- `auth.users.role`;
- metadata del usuario;
- correo electrónico;
- dominio del correo;
- nombre o cargo escrito libremente;
- último rol utilizado;
- rol seleccionado en la interfaz;
- query string;
- body de una solicitud;
- cookie no firmada;
- `navigation_role`;
- plantilla de dispositivo;
- rol operativo del turno;
- perfil operativo predeterminado;
- permiso que se desea evaluar;
- existencia de filas en una matriz;
- hardcode por aplicación.

Reglas:

```text
auth.users.role = authenticated
≠ rol base laboral
```

```text
navigation_role
≠ rol base
```

```text
operational_role
≠ rol base
```

```text
claim "owner"
≠ propietario
```

---

#### 27. Dispositivo compartido

En un dispositivo compartido:

```text
principal       = SHARED_DEVICE
domain_identity = DEVICE
actor_effective = EMPLOYEE
employee        = trabajador de la sesión de actor
base_role       = rol base validado del trabajador
```

El rol base:

- no procede del dispositivo;
- no procede de la plantilla;
- no procede de `navigation_role`;
- no se fija para todos los usuarios del terminal;
- cambia cuando cambia el actor humano;
- queda invalidado cuando termina la sesión de actor.

El dispositivo puede restringir capacidades, pero no modificar el rol base.

---

#### 28. Procesos delegados

En un proceso delegado a un empleado:

```text
domain_identity = SYSTEM
actor_effective = EMPLOYEE
employee = empleado delegado
```

El `base_role` del empleado podrá resolverse para atribución y evaluación,
pero el proceso no obtiene automáticamente toda la autoridad del rol.

Regla:

```text
ROL BASE DEL EMPLEADO
+
DELEGACIÓN EXISTENTE
≠
AUTORIZACIÓN AUTOMÁTICA DEL PROCESO
```

La decisión posterior deberá comprobar:

- delegación explícita;
- propósito;
- vigencia;
- permiso exacto;
- recurso;
- alcance;
- restricciones del proceso;
- auditoría.

Un proceso no podrá elegir el rol base que desea representar.

---

#### 29. Simulación

La simulación no modifica el `base_role` real de `AccessContext`.

Regla:

```text
AccessContext.base_role
→ rol real del actor

SimulationContext.simulated_subject
→ rol hipotético evaluado
```

Un rol simulado:

- no cambia `employee.base_role_code`;
- no cambia el actor real;
- no crea grants reales;
- no produce `ALLOW` ejecutable;
- no se almacena como asignación laboral;
- no participa en RLS real.

No se emitirá un `AccessContext` real con rol ficticio para implementar
preview.

---

#### 30. Relación con el dataset de matriz base

El dataset canónico de matriz base contiene concesiones para:

```text
propietario
gerente_general
gerente
supervisor
auxiliar_administrativa
contador
marketing
```

El resolver de contexto no deberá cargar ni exponer la lista completa de
permisos dentro de `base_role`.

`base_role` solo identifica el rol validado.

La evaluación posterior:

```text
base_role.role_code
        ↓
dataset de matriz base versionado
        ↓
allows potenciales
        ↓
alcance + recurso + condiciones + denies
        ↓
LaneDecision
```

No se permitirá consultar el dataset cuando:

```text
role_status != ACTIVE
```

No se utilizarán matrices legacy como fallback.

---

#### 31. Relación con concesiones individuales

Una concesión individual base no sustituye un rol base inválido.

Regla estructural:

```text
EMPLEADO ACTIVO
+ ROL BASE INVALID
+ EMPLOYEE_BASE_ALLOW
```

no convierte automáticamente el carril base en válido.

Las concesiones individuales amplían o restringen capacidades dentro de un
carril base estructuralmente resoluble; no reparan identidad, empleo o rol.

Una excepción futura que permita un carril base sin rol deberá aprobarse
expresamente como cambio contractual y no inferirse desde la existencia de una
fila individual.

---

#### 32. Relación con cobertura administrativa

`base_role` no contiene cobertura territorial.

La cobertura se resolverá en AUTH-CTX-009 mediante:

- asignaciones de sede;
- asignaciones de área;
- clasificación del rol;
- alcances aprobados;
- reglas organizacionales;
- datos autoritativos.

Regla:

```text
base_role = gerente
≠ todas las sedes
```

```text
base_role = propietario
≠ ORGANIZATION por nombre solamente
```

La clasificación global o local define qué cobertura puede ser válida, pero
la autoridad concreta deberá proceder de reglas y asignaciones explícitas.

Esta tarea no construye `administrative_coverage`.

---

#### 33. Relación con rol operativo

`base_role` y `operational_role` podrán coexistir para un mismo empleado.

Ejemplos válidos:

```text
propietario + gerencia_operativa
```

```text
gerente + cajero_satelite
```

```text
supervisor + bodeguero
```

```text
contador + operador_integral_satelite
```

No se crea un rol combinado.

No se fusionan matrices.

No se amplían alcances.

La autorización seguirá la modalidad exacta de cada permiso.

---

#### 34. Readiness del carril base

`base_role` participa en `lane_readiness.base`.

Matriz inicial:

| Condición                                              | Readiness base                                              |
| ------------------------------------------------------ | ----------------------------------------------------------- |
| Actor no laboral                                       | `NOT_APPLICABLE`                                            |
| Empleado ausente o incoherente                         | `INVALID`                                                   |
| Empleado inactivo                                      | `INVALID`                                                   |
| `base_role = null` para empleado activo                | `INVALID`                                                   |
| `role_status = INVALID`                                | `INVALID`                                                   |
| `role_status = INACTIVE`                               | `INVALID`                                                   |
| `role_status = ACTIVE` y demás hechos base suficientes | Puede ser `READY`                                           |
| Rol activo pero cobertura todavía insuficiente         | `UNAVAILABLE` o `INVALID` según AUTH-CTX-009 y AUTH-CTX-015 |

`READY` solo significa que el carril puede evaluarse.

No significa que exista un allow.

---

#### 35. Problemas estructurales relacionados

Los códigos definitivos se congelarán en AUTH-CTX-015.

Esta tarea reserva las siguientes necesidades semánticas:

```text
base_role_missing
base_role_inactive
base_role_invalid
base_role_legacy
base_role_ambiguous
base_role_source_invalid
base_role_employee_mismatch
base_role_assignment_conflict
base_role_not_canonical
base_role_catalog_unavailable
base_role_dataset_incompatible
```

Severidad conceptual inicial:

| Problema                        | Efecto mínimo                               |
| ------------------------------- | ------------------------------------------- |
| Rol ausente en empleado activo  | `BLOCKING_BASE`                             |
| Rol inactivo                    | `BLOCKING_BASE`                             |
| Rol legacy                      | `BLOCKING_BASE`                             |
| Rol desconocido                 | `BLOCKING_BASE`                             |
| Ambigüedad de asignación        | `BLOCKING_BASE`                             |
| Empleado o actor incoherente    | Puede ser `BLOCKING_ALL`                    |
| Dataset o catálogo incompatible | `BLOCKING_BASE` y posible fallo contractual |

AUTH-CTX-015 podrá consolidar nombres y severidades sin cambiar la semántica
aprobada aquí.

---

#### 36. Comportamiento fail closed

Ante una inconsistencia no se aplicará:

- rol predeterminado;
- rol anterior;
- rol más privilegiado;
- primer rol encontrado;
- rol del dispositivo;
- rol del turno;
- mapeo por nombre;
- grant histórico;
- wildcard;
- bypass de propietario;
- fallback a `gerente_general`;
- fallback a un supuesto rol `staff`.

Regla:

```text
ROL BASE NO RESOLUBLE
→ CARRIL BASE INVALID
```

La UI podrá mostrar una explicación segura, pero no corregirá el contexto.

---

#### 37. Vigencia temporal

El rol base se evalúa en `AccessContext.resolved_at`.

La resolución deberá considerar:

- inicio de vigencia;
- fin de vigencia;
- activación;
- inactivación;
- reemplazo;
- revocación;
- versión del catálogo;
- versión del dataset.

La estructura física actual puede no contener todos estos campos.

Su diseño corresponde a BLOQUE E3.

No se asumirá que una fila existente es vigente eternamente.

---

#### 38. Obsolescencia del contexto

El contexto queda potencialmente obsoleto cuando cambia:

- asignación base del empleado;
- estado del rol;
- catálogo de roles;
- estado del empleado;
- relación entre empleado y actor;
- versión del dataset base;
- concesión o denegación individual;
- cobertura administrativa relacionada;
- versión contractual aceptada.

Una mutación sensible no deberá ejecutarse con un contexto resuelto antes de
un cambio relevante.

La estrategia de invalidación corresponde a AUTH-CTX-029.

---

#### 39. Resolución conceptual

Orden conceptual:

```text
1. Confirmar que existe actor empleado.
2. Confirmar que `employee` corresponde al actor.
3. Leer el código de asignación base desde fuente autoritativa.
4. Detectar ausencia o múltiples asignaciones.
5. Normalizar el código sin reinterpretarlo.
6. Clasificar la fuente normativa.
7. Comparar el código contra el catálogo canónico.
8. Detectar código legacy, operativo, desconocido o duplicado.
9. Validar vigencia del rol y la asignación.
10. Construir `BaseRoleContext` o emitir `null`.
11. Registrar problemas estructurales.
12. Calcular impacto sobre `lane_readiness.base`.
13. Registrar versiones y fingerprints en metadata.
14. Emitir snapshot inmutable.
```

Este orden es conceptual.

El contrato SQL se diseñará en AUTH-CTX-025.

---

#### 40. Ejemplos canónicos

##### 40.1 Propietario activo

```text
employee.base_role_code = propietario
catálogo                 = canónico y activo
fuente                    = autoritativa
```

Resultado:

```text
base_role = {
  role_code: "propietario",
  role_status: "ACTIVE",
  assignment_source: "CANONICAL_EMPLOYEE_ROLE_ASSIGNMENT"
}
```

Esto no concede todos los permisos.

##### 40.2 Gerente con varias sedes

```text
base_role = gerente ACTIVE
```

El nodo no incluirá sedes ni alcance.

AUTH-CTX-009 resolverá la cobertura.

##### 40.3 Supervisor todavía no materializado correctamente

Si la asignación administrativa declara `supervisor`, pero la fuente física
objetivo o el catálogo materializado no permite verificarlo:

```text
role_status = INVALID
```

hasta que exista una fuente canónica coherente.

El hecho de que `supervisor` esté aprobado documentalmente no autoriza a
fabricar una fila física inexistente durante la resolución.

##### 40.4 Cocinero legacy

```text
employee.base_role_code = cocinero
```

Resultado:

```text
base_role = {
  role_code: "cocinero",
  role_status: "INVALID",
  assignment_source: "LEGACY_EMPLOYEE_ROLE_ASSIGNMENT"
}
```

El turno podrá resolver `produccion_cocina` o `cocinero_satelite` de manera
independiente.

##### 40.5 Bodeguero legacy con turno bodeguero

```text
base_role.role_code       = bodeguero
base_role.role_status     = INVALID
operational_role.role_code = bodeguero
```

No se fusionan.

##### 40.6 Empleado sin rol

```text
employee activo
employee.base_role_code = null
```

Resultado:

```text
base_role = null
lane_readiness.base = INVALID
```

##### 40.7 Empleado inactivo con rol contador

```text
employee.is_active = false
base_role = contador ACTIVE
```

Resultado:

```text
atribución conservada
carriles laborales bloqueados
```

##### 40.8 Cliente que también es empleado

En Vento Pass cliente:

```text
domain_identity = CUSTOMER
actor_effective = CUSTOMER
employee = null
base_role = null
```

La existencia externa de una relación laboral no se mezcla con la vía de
cliente.

##### 40.9 Dispositivo compartido

```text
principal = SHARED_DEVICE
actor_effective = EMPLOYEE
```

El rol se resuelve desde el empleado actor, no desde el dispositivo.

##### 40.10 Rol recibido desde el frontend

```text
request.body.role_code = gerente_general
```

Resultado:

```text
ignorar como fuente autoritativa
resolver desde datos canónicos
```

---

#### 41. Exposición segura

La proyección pública podrá incluir:

- `role_code` cuando sea necesario para experiencia o diagnóstico;
- `role_status`;
- `assignment_source` normativo o una proyección segura equivalente.

No deberá incluir por defecto:

- historial de cambios de rol;
- quién aprobó la asignación;
- notas laborales;
- motivo disciplinario;
- IDs internos de migraciones;
- consultas SQL;
- tablas físicas;
- grants completos;
- denies completos;
- secretos;
- datos personales innecesarios.

La UI no deberá interpretar `role_code` como permiso.

---

#### 42. Uso permitido del rol en presentación

El rol base podrá utilizarse legítimamente para:

- mostrar una etiqueta funcional;
- explicar el contexto administrativo;
- ordenar accesos ya autorizados;
- elegir una experiencia inicial no sensible;
- mostrar mensajes específicos;
- identificar la matriz que será evaluada en servidor.

No podrá utilizarse para:

- permitir una mutación;
- saltar una verificación de permiso;
- ampliar cobertura;
- mostrar datos protegidos;
- asumir acceso global;
- autorizar una RPC;
- sustituir RLS;
- desbloquear una acción operativa.

Incorrecto:

```ts
if (baseRole === "propietario") return true;
```

Correcto conceptualmente:

```text
evaluate_authorization(
  access_context,
  permission_key,
  resolved_resource
)
```

---

#### 43. Compatibilidad con decisiones aprobadas

Esta tarea conserva:

```text
un empleado tiene un rol base permanente
```

```text
puede tener cero o un rol operativo efectivo
```

```text
no existen roles híbridos
```

```text
el turno no modifica el rol base
```

```text
el fin del turno no elimina permisos base
```

```text
el rol base no sustituye el turno
```

```text
el rol operativo no hereda permisos administrativos
```

```text
el dispositivo no tiene rol base
```

```text
la simulación no modifica el rol real
```

```text
los siete roles base usan matrices explícitas
```

No modifica catálogo, matrices, datasets ni hashes.

---

#### 44. Impacto contractual

La tarea:

- precisa la semántica de campos existentes;
- congela el conjunto de roles que pueden considerarse canónicos en la
  versión actual;
- define estados y fuentes iniciales;
- define tratamiento de legacy;
- define combinaciones válidas e inválidas;
- no agrega campos;
- no elimina campos;
- no cambia obligatoriedad raíz;
- no cambia enums publicados;
- no cambia serialización;
- no cambia `contract_version`;
- no cambia `schema_version`.

Se clasifica como:

```text
aclaración normativa compatible
dentro de AccessContext@1.0.0
```

Una futura necesidad de representar:

- varios roles base simultáneos;
- historial dentro del nodo;
- rol mínimo nuevo;
- tenant o unidad empresarial;
- jerarquía explícita;
- vigencia detallada como campos públicos;
- namespace adicional;
- assignment_id;
- clasificación de rol como campo;

requerirá análisis de versionado según AUTH-CTX-004.

---

#### 45. Dependencias posteriores

##### AUTH-MOD-021

Definirá el rol base mínimo no privilegiado para trabajadores puramente
operativos, incluyendo:

- código canónico;
- nombre humano;
- propósito empresarial;
- capacidades permanentes mínimas;
- prohibiciones expresas;
- transición desde oficios legacy;
- impacto sobre catálogo, datasets, matrices y contratos;
- tareas físicas exactas de implementación.

No bloquea `AUTH-CTX-009`.

Deberá resolverse antes de:

- `AUTH-CTX-028`, que diseñará la compatibilidad legacy;
- publicar una nueva versión del catálogo o dataset de roles base;
- transformar o retirar físicamente los oficios base legacy;
- ejecutar migraciones o backfills relacionados con el nuevo rol mínimo.

##### AUTH-CTX-009

Podrá iniciar inmediatamente después de `AUTH-CTX-008`.

Definirá `assigned_sites`, `assigned_areas` y
`administrative_coverage` utilizando los roles base canónicos vigentes, sin
inferir cobertura únicamente desde el nombre del rol y sin inventar todavía
el código del rol base mínimo reservado para `AUTH-MOD-021`.

##### AUTH-CTX-010 a AUTH-CTX-013

Definirán turno, check-in, rol y territorio operativo, manteniendo
independencia frente al rol base.

##### AUTH-CTX-014

Definirá dispositivo y sesión de actor sin convertir `navigation_role` en rol
base.

##### AUTH-CTX-015

Congelará códigos y severidades de problemas estructurales.

##### AUTH-CTX-019

Precisará la decisión del carril base y el consumo del dataset de matriz.

##### AUTH-CTX-021 y AUTH-CTX-022

Precisarán allows y denegaciones coincidentes.

##### AUTH-CTX-025

Diseñará el contrato SQL que resolverá `base_role`.

##### AUTH-CTX-026

Diseñará el evaluador que consumirá el rol sin autorizar por nombre.

##### AUTH-CTX-027

Definirá el consumo centralizado por aplicaciones.

##### AUTH-CTX-028

Definirá compatibilidad temporal con:

- `employees.role` legacy;
- matrices antiguas;
- helpers por nombre de rol;
- oficios almacenados como roles base;
- consumidores que todavía esperan roles legacy.

##### AUTH-CTX-029

Definirá invalidación cuando cambien rol, empleado, catálogo o dataset.

##### AUTH-CTX-030

Definirá pruebas contractuales.

##### BLOQUE E1 y E2

Validarán que el rol base mínimo aprobado en AUTH-MOD-021 cubra las
necesidades reales de los trabajadores operativos y sus procesos, pero no
podrán volver a diferir la definición del código ni su contrato.

##### BLOQUE E3

Definirá:

- catálogo físico objetivo;
- asignación temporal o permanente;
- vigencias;
- integridad referencial;
- retiro de duplicados;
- transición de oficios legacy;
- relación con el historial laboral.

##### BLOQUE H

Materializará tipos, schemas y helpers compartidos.

##### BLOQUE R

Implementará migraciones, backfills, constraints, adaptadores, RPC, RLS,
retiro de fallbacks y rollback en `vento-shell`.

---

#### 46. Fuera del alcance

AUTH-CTX-008 no:

- redefine principal;
- redefine actor efectivo;
- redefine identidad de dominio;
- redefine empleado;
- crea el rol base mínimo;
- agrega roles al catálogo;
- modifica las siete matrices base;
- define permisos concretos;
- define grants o denies;
- define cobertura administrativa;
- define sedes o áreas asignadas;
- define turno;
- define check-in;
- define rol operativo;
- define sede o área operativa;
- define dispositivo;
- define decisión final;
- congela códigos definitivos de invalidez;
- elimina códigos legacy;
- convierte empleados legacy;
- crea historial de roles;
- define la estructura física definitiva de asignaciones;
- modifica `public.roles`;
- modifica `employees.role`;
- modifica `operational_roles`;
- crea tipos TypeScript;
- crea JSON Schema;
- crea validadores Zod;
- crea funciones SQL;
- crea RPC;
- crea RLS;
- crea grants técnicos;
- crea triggers;
- crea migraciones;
- modifica Supabase;
- modifica aplicaciones;
- migra consumidores;
- implementa código mediante Codex.

---

#### 47. Criterios de aprobación

AUTH-CTX-008 podrá aprobarse cuando se acepte que:

1. `base_role` representa el rol laboral permanente validado del empleado;
2. el rol base no es identidad, permiso, cobertura ni decisión;
3. se conserva la forma publicada de `BaseRoleContext`;
4. no se agregan campos ni se cambian versiones;
5. los únicos roles base canónicos actuales son siete;
6. los roles globales son `propietario` y `gerente_general`;
7. los roles por sede son `gerente` y `supervisor`;
8. los roles funcionales son `auxiliar_administrativa`, `contador` y
   `marketing`;
9. ningún rol obtiene permisos por su nombre;
10. `employee.base_role_code` es referencia observada y `base_role` es
    resultado validado;
11. cuando existe `base_role`, ambos códigos coinciden exactamente;
12. `assignment_source` utiliza códigos normativos;
13. `CANONICAL_EMPLOYEE_ROLE_ASSIGNMENT` es la fuente canónica;
14. `LEGACY_EMPLOYEE_ROLE_ASSIGNMENT` conserva trazabilidad sin autorizar;
15. `role_status` puede ser `ACTIVE`, `INACTIVE` o `INVALID`;
16. `ACTIVE` exige código canónico, fuente válida, asignación única y vigencia;
17. `INACTIVE` conserva un rol canónico no utilizable;
18. `INVALID` representa código legacy, desconocido, ambiguo o inconsistente;
19. `base_role = null` representa ausencia o imposibilidad de identificar un
    código inequívoco;
20. `null` no crea un rol predeterminado;
21. no se inventa un código `staff`, `empleado` o equivalente;
22. los oficios legacy no son roles base canónicos;
23. no existe conversión automática de oficio legacy a rol operativo;
24. `bodeguero` base y `bodeguero` operativo permanecen separados por nodo y
    namespace;
25. un rol base legacy bloquea el carril base;
26. un rol base legacy no bloquea automáticamente un carril operativo válido;
27. la modalidad del permiso determina el efecto final de cada carril;
28. un empleado inactivo conserva atribución pero no autoridad;
29. el estado del empleado y el estado del rol son independientes;
30. existe como máximo un rol base vigente por empleado;
31. varias asignaciones concurrentes producen ambigüedad y fail closed;
32. el frontend, JWT, turno, dispositivo y navegación no son fuentes de rol
    base;
33. un dispositivo compartido usa el rol del actor humano;
34. un proceso delegado no hereda automáticamente toda la autoridad del rol;
35. la simulación conserva el rol real separado del rol hipotético;
36. `base_role` no incluye ni expone la lista completa de permisos;
37. solo un rol `ACTIVE` puede consultar la matriz base canónica;
38. una concesión individual no repara un rol base inválido;
39. la cobertura administrativa se reserva para AUTH-CTX-009;
40. los problemas estructurales definitivos se reservan para AUTH-CTX-015;
41. la compatibilidad legacy se reserva para AUTH-CTX-028;
42. el rol base mínimo de trabajadores operativos queda asignado a
    AUTH-MOD-021 y deberá resolverse antes de iniciar AUTH-CTX-028, publicar
    una nueva versión del catálogo o dataset de roles base, o transformar o
    retirar físicamente los oficios base legacy;
43. todo pendiente, brecha, riesgo o decisión diferida detectada deberá
    vincularse inmediatamente con una tarea existente concreta o producir
    una nueva tarea explícita antes de cerrar la tarea que lo detectó;
44. todo cambio de rol vuelve potencialmente obsoleto el contexto;
45. no existe bypass por propietario o gerente general;
46. no se implementa código, migraciones ni cambios en Supabase.

---

#### 48. Estado final de la propuesta

| Tarea        | Estado      | Relación                               |
| ------------ | ----------- | -------------------------------------- |
| AUTH-CTX-007 | APROBADA    | Tarea anterior                         |
| AUTH-CTX-008 | APROBADA    | Tarea cerrada                          |
| AUTH-CTX-009 | NO INICIADA | Continuidad inmediata                  |
| AUTH-MOD-021 | NO INICIADA | Tarea diferida obligatoria relacionada |

La continuidad inmediata queda:

```text
AUTH-CTX-008 — APROBADA
        ↓
AUTH-CTX-009 — Incluir cobertura administrativa por sede y área
```

