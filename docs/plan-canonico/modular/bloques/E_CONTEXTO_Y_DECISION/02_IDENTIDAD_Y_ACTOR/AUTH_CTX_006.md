### ✅ AUTH-CTX-006 — Incluir actor efectivo

**Estado:** APROBADA  
**Bloque:** BLOQUE E — Contexto y decisión de autorización unificados  
**Naturaleza:** Refinamiento documental del nodo `actor_effective` de `AccessContext`  
**Implementación física:** No incluida  
**Tarea anterior vigente:** AUTH-CTX-005 — APROBADA  
**Tarea posterior reservada:** AUTH-CTX-007 — Incluir identidad laboral o de dominio  
**Contrato afectado:** `AccessContext@1.0.0`  
**Nodo afectado:** `actor_effective`  
**Cambio contractual:** Aclaración normativa compatible; no cambia la forma publicada  
**Cambios físicos permitidos:** No

Esta tarea define de forma exhaustiva la semántica, procedencia, atribución,
estados, consistencia y límites del actor efectivo al que Vento OS atribuye
una solicitud, consulta, comando, mutación, evento o proceso.

No modifica la estructura raíz aprobada de `AccessContext`, no agrega campos,
no cambia `contract_version`, no cambia `schema_version` y no implementa tipos,
funciones SQL, RPC, RLS, migraciones, guards, adaptadores, colas ni cambios en
Supabase.

---

#### 1. Objetivo

Definir el nodo `actor_effective` de manera que Vento OS pueda responder de
forma inequívoca:

1. a quién se atribuye empresarialmente una acción;
2. si el actor es empleado, cliente, sistema o no pudo resolverse;
3. cuál es el identificador canónico del actor;
4. qué relación válida produjo la atribución;
5. si la atribución procede de sesión personal, sesión de dispositivo,
   proceso del sistema o identidad de dominio;
6. cuándo existe una delegación explícita;
7. cuándo una identidad conocida sigue siendo atribuible aunque esté
   inactiva;
8. cuándo la ausencia, expiración o ambigüedad obliga a dejar el actor sin
   resolver;
9. cómo conservar al actor real durante simulaciones y llamadas internas;
10. qué datos no pueden utilizarse como sustituto del actor.

El nodo deberá impedir que una aplicación interprete:

```text
principal autenticado
=
actor efectivo
=
identidad de dominio
=
rol
=
permiso
```

La relación correcta será:

```text
PRINCIPAL VALIDADO
        ↓
RELACIONES EMPRESARIALES CANÓNICAS
        ↓
IDENTIDAD DE DOMINIO APLICABLE
        ↓
ACTOR EFECTIVO ÚNICO
        ↓
CONTEXTO Y ESTADO DEL ACTOR
        ↓
DECISIÓN DE AUTORIZACIÓN
```

---

#### 2. Decisión principal

El `actor_effective` identifica exclusivamente a la entidad empresarial o al
proceso interno al que se atribuye la acción evaluada.

Regla canónica:

```text
actor_effective
=
sujeto único de atribución de la acción
```

No representa por sí solo:

```text
credencial técnica
sesión Auth
rol base
rol operativo
permiso
alcance
sede
área
turno
check-in
dispositivo
resultado de autorización
sujeto simulado
```

Por tanto:

```text
actor resuelto
≠ actor activo
≠ actor autorizado
≠ permiso concedido
```

`resolved = true` significa que existe una atribución inequívoca y verificable.
No significa que el actor cumpla estado, modalidad, alcance, contexto,
prerrequisitos o permisos.

---

#### 3. Contrato vigente del nodo

Se conserva sin cambios la forma publicada en AUTH-CTX-001 y AUTH-CTX-004:

```ts
type EffectiveActorContext = {
  actor_type:
    | "EMPLOYEE"
    | "CUSTOMER"
    | "SYSTEM"
    | "UNRESOLVED";

  actor_id: string | null;

  attribution_source:
    | "PERSONAL_SESSION"
    | "DEVICE_ACTOR_SESSION"
    | "SYSTEM_PROCESS"
    | "DOMAIN_IDENTITY"
    | "NONE";

  delegation_id: string | null;
  resolved: boolean;
};
```

No se agregan campos en esta tarea.

La publicación permanece:

```text
AccessContext
contract_version = 1.0.0
schema_version   = 1.0.0
```

---

#### 4. Separación entre principal, identidad y actor

Los tres conceptos son independientes:

| Concepto          | Pregunta que responde                                  |
| ----------------- | ------------------------------------------------------ |
| `principal`       | ¿Quién o qué presentó la credencial técnica?           |
| `domain_identity` | ¿Qué entidad empresarial representa para este dominio? |
| `actor_effective` | ¿A quién se atribuye esta acción concreta?             |

Ejemplo de dispositivo compartido:

```text
principal
→ dispositivo técnico

domain_identity
→ identidad de dispositivo

actor_effective
→ empleado que abrió una sesión de actor válida
```

Ejemplo de sesión personal laboral:

```text
principal
→ usuario humano autenticado

domain_identity
→ empleado

actor_effective
→ ese empleado
```

Ejemplo de Vento Pass:

```text
principal
→ usuario humano autenticado

domain_identity
→ cliente

actor_effective
→ ese cliente
```

Ejemplo de proceso autónomo:

```text
principal
→ servicio técnico

domain_identity
→ proceso interno del sistema

actor_effective
→ sistema identificado
```

El orden de los campos dentro del objeto serializado no impone el orden de
resolución. La implementación deberá resolver las relaciones necesarias antes
de construir el snapshot final.

---

#### 5. Fuente de verdad

El actor efectivo deberá resolverse exclusivamente en servidor mediante
relaciones canónicas y vigentes.

Fuentes conceptuales permitidas:

| Caso                               | Fuente de atribución                                          |
| ---------------------------------- | ------------------------------------------------------------- |
| Empleado en sesión personal        | Relación única entre principal humano e identidad laboral     |
| Cliente en Pass                    | Identidad de cliente válida para el dominio Pass              |
| Empleado en dispositivo compartido | Sesión de actor única y vigente del dispositivo               |
| Sistema autónomo                   | Proceso interno identificado y autorizado por contrato        |
| Empleado delegado por un proceso   | Delegación explícita, vigente y verificable                   |
| Actor no resoluble                 | Ausencia o contradicción comprobada de las fuentes anteriores |

No serán fuente de verdad:

- `auth.uid()` interpretado directamente como `employee_id`;
- correo, nombre o documento enviado por el cliente;
- `employees.role`;
- rol operativo;
- `navigation_role`;
- sede o área seleccionada;
- perfil operativo predeterminado;
- último turno conocido;
- último empleado que utilizó el dispositivo;
- cookie no firmada;
- `localStorage`;
- estado de React;
- body o query parameter con `actor_id`;
- identidad simulada;
- nombre libre de proceso;
- uso de `service_role`;
- información inferida desde logs históricos.

---

#### 6. Cardinalidad y unicidad

Cada `AccessContext` tendrá exactamente un nodo `actor_effective`.

La atribución podrá producir:

```text
un actor exacto
```

O:

```text
UNRESOLVED
```

No podrá producir:

- una lista de actores;
- actor principal y actor secundario;
- actor humano y sistema simultáneamente;
- actor inferido por prioridad arbitraria;
- actor combinado a partir de varios roles;
- actor elegido por el frontend.

Ante dos o más candidatos válidos sin una regla canónica que determine uno:

```text
AMBIGÜEDAD
→ actor_type = UNRESOLVED
→ resolved = false
→ denegar operaciones que requieran actor
```

No se escogerá silenciosamente:

- el registro más reciente;
- el primero por orden de consulta;
- el empleado activo con mayor privilegio;
- el actor de la última sesión;
- el actor asociado a la sede seleccionada.

---

#### 7. `actor_type`

Valores congelados en `AccessContext@1.0.0`:

```text
EMPLOYEE
CUSTOMER
SYSTEM
UNRESOLVED
```

El valor representa la clase de entidad a la que se atribuye la acción.

No se utilizarán como `actor_type`:

```text
HUMAN_USER
SHARED_DEVICE
SYSTEM_SERVICE
propietario
gerente_general
cajero_satelite
bodeguero
dispositivo
rol
aplicación
proveedor externo
```

Los tipos del principal y los tipos del actor pertenecen a capas diferentes.

---

#### 8. Actor `EMPLOYEE`

Representa a un trabajador canónico de Vento al que se atribuye la acción.

Rutas permitidas en v1:

```text
HUMAN_USER
+ relación laboral inequívoca
→ EMPLOYEE
```

```text
SHARED_DEVICE
+ sesión de actor válida
+ employee vinculado
→ EMPLOYEE
```

```text
SYSTEM_SERVICE
+ delegación explícita válida
+ employee objetivo inequívoco
→ EMPLOYEE
```

Reglas:

1. `actor_id` contiene el identificador canónico del empleado.
2. No contiene `auth_user_id` salvo coincidencia accidental de valores.
3. No contiene código de rol.
4. No se deriva del turno.
5. No se deriva de `navigation_role`.
6. No se deriva de una sede o área.
7. La inactividad del empleado no borra necesariamente su identidad para
   auditoría.
8. Un empleado conocido pero inactivo puede permanecer como actor resuelto,
   mientras la autorización laboral queda estructuralmente bloqueada.
9. La existencia del actor no activa carril base ni operativo.
10. Los permisos se evaluarán después y siempre contra el estado vigente.

Regla crítica:

```text
EMPLOYEE resuelto
+
employee inactivo
=
atribución conocida
+
autorización laboral denegada
```

Esto evita perder la identidad de quien intentó ejecutar una acción sin
convertir esa identidad en autoridad.

---

#### 9. Actor `CUSTOMER`

Representa a un cliente del dominio Vento Pass al que se atribuye la acción.

Ruta permitida en v1:

```text
HUMAN_USER
+ identidad de cliente aplicable al dominio Pass
→ CUSTOMER
```

Reglas:

1. `actor_id` contiene el identificador canónico del cliente.
2. Un cliente no se convierte en empleado.
3. Un empleado que también sea cliente utiliza `CUSTOMER` cuando la acción
   pertenece al dominio cliente.
4. El hecho de tener ambas identidades no crea dos actores simultáneos.
5. La aplicación o contrato del proceso determina la identidad aceptada.
6. La identidad laboral no tiene precedencia automática sobre la de cliente.
7. La identidad de cliente no concede acceso a aplicaciones laborales.
8. Un cliente inactivo puede seguir siendo identificable para auditoría, pero
   no obtiene autoridad por ello.
9. La autorización específica de Pass se evalúa después.

Cuando un principal humano tenga simultáneamente identidad laboral y de
cliente:

```text
aplicación laboral
→ actor EMPLOYEE

Vento Pass cliente
→ actor CUSTOMER
```

Si el dominio consumidor admite más de una identidad y no define una regla
inequívoca:

```text
actor = UNRESOLVED
```

La selección no se delegará al frontend.

---

#### 10. Actor `SYSTEM`

Representa un proceso interno autónomo de Vento identificado y autorizado para
producir una acción empresarial sin actuar en nombre de un empleado.

Condiciones mínimas:

```text
principal técnico válido
+
ejecución en frontera confiable
+
proceso interno identificado
+
operación incluida en su contrato
→ SYSTEM
```

Reglas:

1. `actor_id` será un identificador estable del proceso interno.
2. No será una clave secreta, token, service role ni hash de credencial.
3. No será un texto libre enviado por el cliente.
4. No será el nombre del proveedor externo sin un adaptador interno.
5. No tendrá rol base.
6. No tendrá rol operativo.
7. No heredará permisos de propietario ni gerente.
8. Deberá evaluarse mediante capacidades técnicas o contratos empresariales
   explícitos.
9. Toda acción deberá poder atribuirse al proceso exacto.
10. Un proceso desconocido no se degrada a un sistema genérico autorizado.

Ejemplos conceptuales posibles:

- cierre programado;
- reconciliación interna;
- sincronización aprobada;
- trigger empresarial gobernado;
- job de mantenimiento;
- adaptador de integración.

El catálogo físico de procesos se definirá posteriormente.

---

#### 11. Actor `UNRESOLVED`

Representa que no existe una atribución empresarial única y confiable para la
solicitud.

Forma obligatoria:

```text
actor_type         = UNRESOLVED
actor_id           = null
attribution_source = NONE
delegation_id      = null
resolved           = false
```

Casos típicos:

- principal anónimo;
- principal inválido;
- usuario humano sin identidad aceptada por el dominio;
- múltiples identidades candidatas sin regla de selección;
- dispositivo compartido sin sesión de actor;
- sesión de actor expirada, terminada o ambigua;
- proceso técnico no identificado;
- delegación ausente, revocada, vencida o contradictoria;
- relación laboral o de cliente no resoluble;
- datos canónicos inconsistentes.

Regla:

```text
UNRESOLVED
→ no ejecutar mutaciones empresariales
```

Podrán continuar únicamente operaciones técnicas expresamente diseñadas para
no requerir actor empresarial, por ejemplo:

- autenticación;
- obtención mínima de configuración de dispositivo;
- heartbeat;
- inicio o cierre seguro de sesión de actor;
- diagnóstico técnico autorizado.

La autorización de esas operaciones no procede de un actor humano implícito.

---

#### 12. `actor_id`

`actor_id` identifica al sujeto exacto dentro del namespace determinado por
`actor_type`.

| `actor_type` | Significado de `actor_id`                 |
| ------------ | ----------------------------------------- |
| `EMPLOYEE`   | Identificador canónico del empleado       |
| `CUSTOMER`   | Identificador canónico del cliente        |
| `SYSTEM`     | Identificador estable del proceso interno |
| `UNRESOLVED` | Siempre `null`                            |

Reglas:

1. El par `(actor_type, actor_id)` identifica el namespace correcto.
2. `actor_id` no se interpretará sin `actor_type`.
3. No se utilizará correo, documento, nombre, rol o código de sede.
4. No contendrá tokens, secretos ni credenciales.
5. No será sustituido por `auth_user_id`.
6. No será sustituido por `device_id`.
7. No será sustituido por `delegation_id`.
8. No será sustituido por `simulation_session_id`.
9. Para todo tipo resuelto será no nulo.
10. Para `UNRESOLVED` será nulo.

Una futura necesidad de namespace organizacional, multitenancy o actor externo
adicional deberá analizarse mediante las reglas de versionado. No se agregará
implícitamente en esta tarea.

---

#### 13. `attribution_source`

`attribution_source` indica qué clase de relación produjo la atribución.

Valores congelados:

```text
PERSONAL_SESSION
DEVICE_ACTOR_SESSION
SYSTEM_PROCESS
DOMAIN_IDENTITY
NONE
```

No identifica una tabla física ni obliga a conservar los nombres actuales de
Supabase.

Matriz permitida en v1:

| `actor_type` | `attribution_source` permitido                               |
| ------------ | ------------------------------------------------------------ |
| `EMPLOYEE`   | `PERSONAL_SESSION`, `DEVICE_ACTOR_SESSION`, `SYSTEM_PROCESS` |
| `CUSTOMER`   | `DOMAIN_IDENTITY`                                            |
| `SYSTEM`     | `SYSTEM_PROCESS`                                             |
| `UNRESOLVED` | `NONE`                                                       |

Cualquier combinación diferente será inconsistente y deberá fallar de forma
cerrada.

---

#### 14. `PERSONAL_SESSION`

Indica que una sesión humana personal se vinculó inequívocamente con el
empleado que actúa.

Contrato conceptual:

```text
principal HUMAN_USER válido
+
relación laboral canónica
→ actor EMPLOYEE
→ source PERSONAL_SESSION
```

Reglas:

1. La sesión debe pertenecer al mismo sujeto Auth resuelto en `principal`.
2. La relación laboral debe ser única.
3. El actor no se selecciona mediante rol.
4. El actor no se selecciona mediante sede activa.
5. El uso posterior de un cliente administrativo de Supabase no cambia esta
   atribución.
6. Una Server Action iniciada por el usuario conserva al empleado como actor.
7. Una RPC privilegiada no reemplaza al actor por `SYSTEM`.
8. Si la acción cruza una frontera asíncrona, deberá aplicarse la regla de
   proceso autónomo o delegación explícita.

---

#### 15. `DEVICE_ACTOR_SESSION`

Indica que un dispositivo técnico autenticado tiene una sesión empresarial de
actor única, vigente y verificable.

Contrato conceptual:

```text
principal SHARED_DEVICE válido
+
dispositivo empresarial resoluble
+
sesión de actor vigente
+
empleado exacto
→ actor EMPLOYEE
→ source DEVICE_ACTOR_SESSION
```

Reglas:

1. El principal sigue siendo el dispositivo.
2. El actor sigue siendo el empleado.
3. El `actor_id` no será el `device_id`.
4. `delegation_id` permanece nulo.
5. El identificador de la sesión de actor pertenecerá a `device_context`, no a
   `delegation_id`.
6. El último actor conocido no es fallback.
7. Una sesión expirada o terminada no produce actor vigente.
8. Dos sesiones activas incompatibles producen `UNRESOLVED`.
9. El PIN, QR o mecanismo de activación identifica una sesión; no se conserva
   como credencial dentro del contexto.
10. La política del dispositivo puede restringir actores, pero no convertir
    al dispositivo en actor humano.
11. El actor conserva sus denegaciones, estado, turno, check-in y permisos.
12. El dispositivo nunca elimina restricciones del empleado.

La semántica detallada de `device_context` y la sesión se completará en
AUTH-CTX-014.

---

#### 16. `SYSTEM_PROCESS`

Indica que la atribución procede de un proceso interno confiable.

Admite dos resultados diferentes:

##### 16.1 Proceso autónomo

```text
actor_type         = SYSTEM
attribution_source = SYSTEM_PROCESS
delegation_id      = null
```

El proceso actúa bajo su propio contrato técnico y empresarial.

##### 16.2 Proceso delegado

```text
actor_type         = EMPLOYEE
attribution_source = SYSTEM_PROCESS
delegation_id      = identificador válido
```

El proceso ejecuta una acción atribuida al empleado dentro de una delegación
explícita.

Reglas comunes:

1. La identidad del proceso debe ser estable.
2. El proceso debe ejecutarse en una frontera de servidor confiable.
3. La acción exacta deberá estar permitida para el proceso o la delegación.
4. Un job no se vuelve autorizado solo porque se ejecute con `service_role`.
5. La atribución no se deriva del creador de una fila ni del último usuario.
6. Un reintento conserva la misma semántica de actor.
7. Una llamada interna no podrá cambiar silenciosamente de empleado a sistema.
8. La frontera asíncrona deberá declarar si conserva delegación o se convierte
   en proceso autónomo.

---

#### 17. `DOMAIN_IDENTITY`

Indica que el actor se atribuye a una identidad empresarial aceptada por el
dominio consumidor, sin tratarla como identidad laboral.

En `AccessContext@1.0.0` se utilizará para:

```text
actor_type = CUSTOMER
```

Reglas:

1. La identidad deberá ser canónica y única.
2. La aplicación deberá aceptar identidad de cliente.
3. La selección se resolverá en servidor.
4. La coexistencia de perfil de empleado no cambia al actor del dominio Pass.
5. La identidad del cliente no se traslada a aplicaciones laborales.
6. Un claim técnico `role = client` no sustituye la relación empresarial.
7. La identidad inactiva se conserva para atribución cuando sea inequívoca,
   pero bloquea la autoridad correspondiente.

AUTH-CTX-007 definirá el nodo completo de identidad de dominio.

---

#### 18. `NONE`

`NONE` se utiliza exclusivamente cuando no existe actor efectivo resuelto.

Consistencia obligatoria:

```text
attribution_source = NONE
↔ actor_type = UNRESOLVED
↔ actor_id = null
↔ delegation_id = null
↔ resolved = false
```

No se utilizará `NONE` para:

- sistema autónomo;
- empleado inactivo pero identificado;
- cliente inactivo pero identificado;
- sesión personal válida;
- dispositivo con actor válido;
- proceso delegado válido.

---

#### 19. `delegation_id`

`delegation_id` representa una delegación empresarial explícita mediante la
cual un proceso del sistema ejecuta una acción atribuida a un empleado.

Uso permitido en v1:

```text
actor_type         = EMPLOYEE
attribution_source = SYSTEM_PROCESS
delegation_id      = no nulo
```

En todos los demás casos:

```text
delegation_id = null
```

No se utilizará para representar:

- sesión Auth;
- sesión de dispositivo;
- turno;
- check-in;
- simulación;
- correlation ID;
- idempotency key;
- job ID;
- mensaje de cola;
- usuario que programó una tarea;
- autorización implícita.

Una delegación válida deberá poder demostrar conceptualmente:

- actor empleado exacto;
- proceso delegado exacto;
- propósito u operación permitida;
- vigencia;
- estado no revocado;
- alcance permitido;
- origen autorizado;
- trazabilidad de creación;
- imposibilidad de ampliación por el consumidor.

Reglas:

1. No existen delegaciones implícitas.
2. No existen cadenas transitivas de delegación en v1.
3. Un rol no puede delegar por sí mismo.
4. Un dispositivo no puede delegar autoridad.
5. El frontend no crea delegaciones autoritativas.
6. La delegación no copia todos los permisos del empleado.
7. La delegación no neutraliza denegaciones.
8. La delegación no conserva autoridad si el empleado queda inactivo.
9. La autorización exacta deberá reevaluarse al ejecutar.
10. Una delegación vencida, revocada o contradictoria no produce fallback a
    `SYSTEM`.
11. Si el proceso puede ejecutar autónomamente, deberá usar un contrato de
    sistema separado y no reutilizar una delegación fallida.

La estructura física de delegaciones se definirá en bloques posteriores si
existen procesos que realmente la requieran.

---

#### 20. `resolved`

`resolved` indica únicamente si la atribución del actor es inequívoca.

Reglas:

```text
resolved = true
→ actor_type != UNRESOLVED
→ actor_id != null
→ attribution_source != NONE
```

```text
resolved = false
→ actor_type = UNRESOLVED
→ actor_id = null
→ attribution_source = NONE
→ delegation_id = null
```

`resolved` no significa:

- identidad activa;
- empleado activo;
- cliente activo;
- dispositivo activo;
- turno válido;
- check-in válido;
- permiso existente;
- alcance coincidente;
- autorización concedida.

Ejemplo:

```text
actor EMPLOYEE conocido
employee.is_active = false
resolved = true
final_decision = DENY
```

La actividad y validez del actor se expresarán mediante los demás nodos,
`lane_readiness`, problemas estructurales y la decisión posterior.

---

#### 21. Matriz de consistencia

| Actor               | ID       | Fuente                 | Delegación | `resolved` | Consistencia   |
| ------------------- | -------- | ---------------------- | ---------- | ---------: | -------------- |
| `EMPLOYEE`          | empleado | `PERSONAL_SESSION`     | `null`     |     `true` | Válida         |
| `EMPLOYEE`          | empleado | `DEVICE_ACTOR_SESSION` | `null`     |     `true` | Válida         |
| `EMPLOYEE`          | empleado | `SYSTEM_PROCESS`       | no nula    |     `true` | Válida         |
| `CUSTOMER`          | cliente  | `DOMAIN_IDENTITY`      | `null`     |     `true` | Válida         |
| `SYSTEM`            | proceso  | `SYSTEM_PROCESS`       | `null`     |     `true` | Válida         |
| `UNRESOLVED`        | `null`   | `NONE`                 | `null`     |    `false` | Válida         |
| `EMPLOYEE`          | `null`   | cualquiera             | cualquiera | cualquiera | Inválida       |
| `CUSTOMER`          | cliente  | `PERSONAL_SESSION`     | `null`     |     `true` | Inválida en v1 |
| `SYSTEM`            | proceso  | `NONE`                 | `null`     |     `true` | Inválida       |
| `UNRESOLVED`        | no nulo  | `NONE`                 | `null`     |    `false` | Inválida       |
| Cualquier resuelto  | ID       | `NONE`                 | cualquiera |     `true` | Inválida       |
| `EMPLOYEE` delegado | empleado | `SYSTEM_PROCESS`       | `null`     |     `true` | Inválida       |

Una combinación inválida deberá registrarse como problema estructural y no
normalizarse automáticamente.

Los códigos finales de problemas se congelarán en AUTH-CTX-015.

---

#### 22. Relación con `principal`

Matriz conceptual:

| `principal_type` | Actores permitidos                   |
| ---------------- | ------------------------------------ |
| `HUMAN_USER`     | `EMPLOYEE`, `CUSTOMER`, `UNRESOLVED` |
| `SHARED_DEVICE`  | `EMPLOYEE`, `UNRESOLVED`             |
| `SYSTEM_SERVICE` | `SYSTEM`, `EMPLOYEE`, `UNRESOLVED`   |
| `ANONYMOUS`      | `UNRESOLVED`                         |

Reglas:

1. `HUMAN_USER` no implica automáticamente `EMPLOYEE`.
2. `SHARED_DEVICE` nunca produce actor `SYSTEM` para operaciones
   empresariales humanas.
3. `SYSTEM_SERVICE` solo produce `EMPLOYEE` mediante delegación explícita.
4. `ANONYMOUS` nunca produce actor resuelto.
5. Principal inválido no produce actor efectivo confiable.
6. El uso interno de credenciales privilegiadas no sustituye al principal
   original de una solicitud humana.
7. Una misma acción conserva la cadena de atribución desde el principal hasta
   el actor.

---

#### 23. Relación con `domain_identity`

`domain_identity` determina qué identidad empresarial es aplicable para el
proceso o aplicación.

Consistencia mínima:

```text
actor_type = EMPLOYEE
→ domain_identity debe ser EMPLOYEE
→ actor_id debe coincidir con identity_id
```

```text
actor_type = CUSTOMER
→ domain_identity debe ser CUSTOMER
→ actor_id debe coincidir con identity_id
```

```text
actor_type = SYSTEM
→ domain_identity debe representar SYSTEM cuando el contrato la requiera
```

```text
actor_type = UNRESOLVED
→ domain_identity puede ser null o inválida
→ nunca se inventa actor desde otra identidad disponible
```

Una persona con varias identidades no produce varias atribuciones.

La aplicación o el contrato empresarial deberá declarar qué identidad acepta.
AUTH-CTX-007 definirá su forma, estado y reglas completas.

---

#### 24. Relación con `employee`

Cuando:

```text
actor_type = EMPLOYEE
```

será obligatorio que:

```text
employee != null
employee.employee_id = actor_effective.actor_id
```

Reglas:

1. El nodo `employee` conserva el estado laboral.
2. `actor_effective` conserva la atribución.
3. La inactividad se representa en `employee`, no cambiando el actor a
   `UNRESOLVED` cuando la identidad exacta sí es conocida.
4. Un empleado inexistente o una relación ambigua sí producen
   `UNRESOLVED`.
5. La ausencia de rol base no borra al actor, pero invalida el carril que lo
   requiera.
6. Los permisos individuales no participan en la resolución del actor.
7. Las sedes y áreas no participan en la identidad del actor.
8. El turno no determina quién es el empleado.

---

#### 25. Relación con `device_context`

Cuando:

```text
principal = SHARED_DEVICE
actor_type = EMPLOYEE
```

será obligatorio que `device_context` pueda demostrar:

- dispositivo exacto;
- estado del dispositivo;
- sesión de actor exacta;
- compatibilidad temporal;
- empleado vinculado;
- ausencia de ambigüedad;
- integridad del cierre o expiración.

El `actor_effective` no duplicará:

- `device_id`;
- `actor_session_id`;
- plantilla;
- políticas del dispositivo;
- aplicaciones habilitadas;
- PIN;
- rol de navegación.

La ausencia de actor no se resolverá mediante:

```text
navigation_role
último actor
empleado de la sede
rol predeterminado
usuario técnico modelado como empleado
```

AUTH-CTX-014 completará este nodo.

---

#### 26. Service role y privilegios internos

El uso de una credencial `service_role`, un cliente administrativo, una RPC
`SECURITY DEFINER` o una función privilegiada describe el mecanismo técnico de
ejecución.

No redefine al actor.

##### Solicitud iniciada por humano

```text
principal original = HUMAN_USER
actor efectivo     = EMPLOYEE o CUSTOMER
cliente interno    = service_role
```

El actor permanece humano.

##### Operación autónoma

```text
principal = SYSTEM_SERVICE
actor     = SYSTEM
```

##### Operación delegada

```text
principal      = SYSTEM_SERVICE
actor          = EMPLOYEE
delegation_id  = obligatorio
```

Patrón prohibido:

```text
createAdminClient()
→ actor SYSTEM automático
→ operación permitida
```

El privilegio técnico nunca sustituye la autorización empresarial.

---

#### 27. Simulación

La simulación conserva siempre al actor real.

```text
actor efectivo real
≠ sujeto simulado
```

Ejemplo:

```text
principal real      = HUMAN_USER
actor_effective     = EMPLOYEE administrador
simulated_subject   = cajero_satelite hipotético
```

Reglas:

1. El sujeto simulado no se escribe en `actor_effective`.
2. La simulación no cambia `actor_id`.
3. La simulación no cambia `attribution_source`.
4. La simulación no crea `delegation_id`.
5. La auditoría se atribuye al actor real.
6. Un resultado `WOULD_ALLOW` no convierte al sujeto simulado en actor.
7. Una sesión de simulación no puede abrir sesión de dispositivo en nombre del
   sujeto simulado.
8. Ninguna mutación real se ejecuta como sujeto simulado.

---

#### 28. Identidades inactivas y estados inválidos

La resolución de atribución y la validez para autorizar son dimensiones
diferentes.

##### Identidad exacta pero inactiva

```text
actor conocido
→ resolved = true
→ actor_type específico
→ estado inactivo en nodo de identidad
→ carril o dominio inválido
→ DENY
```

Aplica a:

- empleado inactivo en sesión personal;
- cliente inactivo en Pass;
- empleado identificado mediante una sesión de actor válida pero laboralmente
  inactivo.

##### Relación no confiable o no vigente

```text
actor no confiable
→ UNRESOLVED
```

Aplica a:

- sesión de actor expirada;
- delegación vencida;
- múltiples empleados candidatos;
- vínculo Auth duplicado;
- proceso desconocido;
- identidad no aceptada por el dominio.

Regla:

```text
inactividad conocida
≠ actor desconocido
```

La inactividad no reactiva permisos ni permite mutaciones.

---

#### 29. Procesos asíncronos, colas y llamadas internas

Una frontera asíncrona no podrá perder ni reinventar la atribución.

Antes de encolar o diferir una acción deberá definirse expresamente uno de dos
modelos:

##### Modelo A — Proceso autónomo

```text
la acción futura pertenece al sistema
→ actor SYSTEM
→ contrato propio
```

##### Modelo B — Ejecución delegada

```text
la acción futura continúa atribuida al empleado
→ actor EMPLOYEE
→ delegation_id obligatorio
→ revalidación al ejecutar
```

No se permitirá:

```text
usuario inicia acción
→ job usa service_role
→ actor se pierde
→ sistema actúa sin contrato
```

Ni:

```text
usuario inició el proceso una vez
→ todos los reintentos futuros conservan permisos indefinidamente
```

Los reintentos deberán conservar idempotencia y trazabilidad, pero no omitir
la revalidación de estado, denegaciones, permiso, alcance y vigencia cuando
corresponda.

Las colas físicas se diseñarán en BLOQUE E4 y las integraciones en BLOQUE X.

---

#### 30. Resolución canónica

Orden conceptual:

```text
### 1. Validar principal

### 2. Identificar dominio o proceso consumidor

### 3. Resolver identidades empresariales candidatas

### 4. Aplicar la identidad aceptada por el dominio

### 5. Resolver la fuente de atribución

### 6. Verificar unicidad y vigencia de la relación de atribución

### 7. Construir actor_type y actor_id

### 8. Resolver delegation_id cuando corresponda

### 9. Validar matriz de consistencia

### 10. Marcar resolved

### 11. Resolver los demás nodos del contexto

### 12. Registrar problemas estructurales

### 13. Evaluar autorización exacta posteriormente
```

La resolución del actor no consultará grants para decidir quién es el actor.

---

#### 31. Casos canónicos

##### 31.1 Empleado en sesión personal activa

```text
principal_type      = HUMAN_USER
actor_type          = EMPLOYEE
actor_id            = employee_id
attribution_source  = PERSONAL_SESSION
delegation_id       = null
resolved            = true
```

Los permisos se evalúan después.

##### 31.2 Empleado inactivo en sesión personal

```text
principal válido
actor EMPLOYEE conocido
resolved = true
employee.is_active = false
base readiness = INVALID
operational readiness = INVALID
```

Resultado posterior:

```text
DENY
```

##### 31.3 Cliente de Pass

```text
principal_type      = HUMAN_USER
actor_type          = CUSTOMER
actor_id            = customer_id
attribution_source  = DOMAIN_IDENTITY
delegation_id       = null
resolved            = true
```

No existe autoridad laboral.

##### 31.4 Persona con perfil de empleado y cliente

En NEXO:

```text
actor_type = EMPLOYEE
```

En Vento Pass cliente:

```text
actor_type = CUSTOMER
```

No se fusionan las identidades.

##### 31.5 Dispositivo con actor válido

```text
principal_type      = SHARED_DEVICE
actor_type          = EMPLOYEE
actor_id            = employee_id
attribution_source  = DEVICE_ACTOR_SESSION
delegation_id       = null
resolved            = true
```

El dispositivo y el actor se auditan simultáneamente.

##### 31.6 Dispositivo sin actor

```text
principal_type      = SHARED_DEVICE
actor_type          = UNRESOLVED
actor_id            = null
attribution_source  = NONE
delegation_id       = null
resolved            = false
```

Solo operaciones técnicas explícitas.

##### 31.7 Dos sesiones de actor incompatibles

```text
actor_type = UNRESOLVED
resolved = false
```

No se selecciona la más reciente automáticamente.

##### 31.8 Job autónomo

```text
principal_type      = SYSTEM_SERVICE
actor_type          = SYSTEM
actor_id            = system_process_id
attribution_source  = SYSTEM_PROCESS
delegation_id       = null
resolved            = true
```

La operación requiere contrato propio.

##### 31.9 Job delegado a empleado

```text
principal_type      = SYSTEM_SERVICE
actor_type          = EMPLOYEE
actor_id            = employee_id
attribution_source  = SYSTEM_PROCESS
delegation_id       = delegation_id
resolved            = true
```

La autorización del empleado se reevalúa.

##### 31.10 Delegación vencida

```text
actor_type = UNRESOLVED
resolved = false
```

No existe fallback a actor `SYSTEM`.

##### 31.11 Server Action humana que usa service role

```text
principal_type = HUMAN_USER
actor_type     = EMPLOYEE
```

El mecanismo privilegiado interno no cambia la atribución.

##### 31.12 Simulación de otro empleado

```text
actor_effective = empleado administrador real
simulated_subject = otro empleado
```

La actividad se atribuye al administrador real.

##### 31.13 Principal anónimo

```text
principal_type      = ANONYMOUS
actor_type          = UNRESOLVED
attribution_source  = NONE
resolved            = false
```

No existe actor empresarial implícito.

---

#### 32. Fallbacks y antipatrones prohibidos

Queda prohibido:

```ts
const actorId = auth.uid();
const actor = employee ?? lastEmployee;
const actor = device.navigationRole;
const actor = request.body.employeeId;
const actor = simulatedEmployee;
const actor = createdBy ?? currentUser;
const actorType = adminClient ? "SYSTEM" : "EMPLOYEE";
```

También queda prohibido:

```text
auth_user_id → employee_id automático
rol base → actor
rol operativo → actor
turno → identidad del actor
sede seleccionada → actor
último actor del dispositivo → actor vigente
service_role → actor SYSTEM autorizado
job creado por empleado → delegación implícita
actor session expirada → último actor
sujeto simulado → actor real
usuario técnico de tablet → empleado ficticio
proveedor externo → actor interno sin adaptador
actor ambiguo → seleccionar el primero
actor inactivo → borrar atribución para ocultar el intento
```

---

#### 33. Auditoría

Toda operación sensible deberá conservar, cuando corresponda:

- `context_id`;
- principal técnico;
- tipo e identificador del actor;
- fuente de atribución;
- delegación;
- dispositivo;
- sesión de actor;
- proceso interno;
- identidad de dominio;
- empleado o cliente;
- estado aplicable;
- permiso y recurso evaluados;
- decisión final;
- timestamp de resolución;
- correlation ID separado;
- resultado de ejecución.

Reglas:

1. El principal y el actor se registran como conceptos diferentes.
2. En dispositivo compartido se registra dispositivo y empleado.
3. En proceso delegado se registra proceso, actor y delegación.
4. En simulación se registra actor real y sujeto simulado por separado.
5. Un actor no resuelto no se reemplaza por un texto genérico como
   `system`.
6. Los intentos fallidos conservan la evidencia suficiente para diagnóstico.
7. No se registran tokens, PIN, secretos ni credenciales completas.
8. La auditoría histórica conserva el actor resuelto en ese momento y no lo
   reescribe por cambios posteriores.

La estructura física de auditoría se definirá en los bloques correspondientes.

---

#### 34. Exposición segura al cliente

La proyección cliente deberá minimizar información.

Podrá exponer, cuando sea necesario para experiencia:

- `actor_type`;
- `resolved`;
- identificador propio del actor cuando el consumidor esté autorizado;
- fuente de atribución en una forma segura;
- estado general necesario para solicitar inicio de sesión de actor.

No deberá exponer indiscriminadamente:

- identificadores de otros empleados;
- detalles internos de delegación;
- nombres de procesos sensibles;
- relaciones candidatas descartadas;
- razones confidenciales;
- tokens o secretos;
- historial de actores de un dispositivo;
- datos personales usados para resolver identidad.

Una proyección visual no sustituye el contexto interno utilizado por el
servidor.

---

#### 35. Compatibilidad con decisiones aprobadas

Esta tarea conserva sin cambios:

- ADR-AUTH-001;
- AUTH-MOD-001 — autenticación, identidad y actor efectivo;
- AUTH-MOD-011 — dispositivos compartidos;
- AUTH-MOD-012 — simulación separada;
- AUTH-MOD-018 y AUTH-MOD-019 — carriles y denegaciones;
- AUTH-CAT — permisos no son identidades;
- AUTH-RBAC — roles y excepciones no son actores;
- AUTH-CTX-001 — forma del nodo `actor_effective`;
- AUTH-CTX-002 — la decisión se evalúa después del contexto;
- AUTH-CTX-003 — el actor real se conserva durante simulación;
- AUTH-CTX-004 — versión `1.0.0` y compatibilidad;
- AUTH-CTX-005 — principal autenticado separado del actor.

No reabre ninguna decisión aprobada.

---

#### 36. Impacto contractual

Esta tarea no cambia la forma serializada aprobada.

Por tanto:

```text
contract_version = 1.0.0
schema_version   = 1.0.0
```

Se considera una precisión normativa del contenido ya diseñado, no una
adición de campo ni un cambio incompatible.

Una futura necesidad de agregar:

- iniciador separado del actor;
- cadena de delegación;
- organización o tenant del actor;
- actor externo;
- actor de proveedor;
- nivel de confianza de atribución;
- namespace explícito;
- actor secundario;
- snapshot de delegación;

requerirá análisis de versionado según AUTH-CTX-004.

No se agregará silenciosamente.

---

#### 37. Dependencias posteriores

##### AUTH-CTX-007

Definirá `domain_identity`, identidad laboral, cliente, dispositivo y sistema,
y deberá mantener consistencia con el actor aquí aprobado.

##### AUTH-CTX-008

Definirá el rol base del empleado sin convertirlo en actor.

##### AUTH-CTX-010 a AUTH-CTX-013

Definirán el contexto operativo del actor empleado sin utilizarlo para cambiar
su identidad.

##### AUTH-CTX-014

Definirá el dispositivo compartido, la sesión de actor y su consistencia con
`DEVICE_ACTOR_SESSION`.

##### AUTH-CTX-015

Congelará códigos y severidades de problemas estructurales relacionados con
atribución ausente, inválida o ambigua.

##### AUTH-CTX-024

Definirá los datos de auditoría de la decisión.

##### AUTH-CTX-025

Diseñará el contrato SQL que deberá producir este nodo.

##### AUTH-CTX-026

Diseñará la evaluación que consumirá el actor sin reinterpretarlo.

##### AUTH-CTX-028

Definirá compatibilidad con funciones legacy que actualmente confunden
`auth.uid()`, empleado y actor.

##### AUTH-CTX-030

Definirá pruebas contractuales de todas las combinaciones válidas e inválidas.

##### BLOQUE E3

Definirá fuentes físicas, relaciones, catálogo de procesos y delegaciones si
son necesarias.

##### BLOQUE E4

Definirá colas y trabajos asíncronos preservando la atribución.

##### BLOQUE H

Materializará tipos, schemas y helpers compartidos.

##### BLOQUE R

Implementará migraciones, RPC, controles, transición y retiro de lógica
legacy.

---

#### 38. Fuera del alcance

AUTH-CTX-006 no:

- redefine `principal`;
- define completamente `domain_identity`;
- define el estado laboral completo;
- define rol base;
- define cobertura administrativa;
- define turno;
- define check-in;
- define rol operativo;
- define sede o área operativa;
- define el contrato completo de dispositivo;
- congela códigos de problemas estructurales;
- define permisos de procesos técnicos;
- crea un catálogo físico de procesos;
- crea una tabla de delegaciones;
- crea colas;
- crea jobs;
- define idempotencia completa;
- define la decisión final;
- agrega campos al contrato;
- cambia versiones;
- crea tipos TypeScript;
- crea JSON Schema;
- crea validadores Zod;
- crea funciones SQL;
- crea RPC;
- crea RLS;
- crea grants;
- crea triggers;
- crea migraciones;
- modifica Supabase;
- modifica aplicaciones;
- migra guards;
- modifica sesiones actuales;
- implementa código mediante Codex.

---

#### 39. Criterios de aprobación

AUTH-CTX-006 podrá aprobarse cuando se acepte que:

1. `actor_effective` identifica a quién se atribuye la acción;
2. principal, identidad de dominio y actor permanecen separados;
3. actor resuelto no equivale a actor activo ni autorizado;
4. se conservan `EMPLOYEE`, `CUSTOMER`, `SYSTEM` y `UNRESOLVED`;
5. se conservan todos los campos publicados en AUTH-CTX-001;
6. no se agrega ningún campo;
7. existe exactamente un actor por contexto;
8. la ambigüedad produce `UNRESOLVED`;
9. no se selecciona silenciosamente el primer candidato;
10. `actor_id` se interpreta junto con `actor_type`;
11. `actor_id` no es `auth_user_id`, rol, dispositivo ni delegación;
12. un empleado en sesión personal usa `PERSONAL_SESSION`;
13. un empleado en dispositivo usa `DEVICE_ACTOR_SESSION`;
14. un empleado delegado por sistema usa `SYSTEM_PROCESS` y
    `delegation_id`;
15. un cliente usa `DOMAIN_IDENTITY`;
16. un sistema autónomo usa `SYSTEM_PROCESS`;
17. `UNRESOLVED` usa `NONE`;
18. las combinaciones válidas quedan cerradas por una matriz explícita;
19. un empleado inactivo conocido puede conservar atribución resuelta;
20. la inactividad bloquea autorización, no borra auditoría;
21. una sesión de dispositivo expirada no conserva actor vigente;
22. el último actor del dispositivo no es fallback;
23. un dispositivo nunca es actor empleado por sí mismo;
24. `delegation_id` solo se usa para delegación de proceso a empleado en v1;
25. no existen delegaciones implícitas ni transitivas;
26. la delegación no copia permisos ni neutraliza denegaciones;
27. una delegación fallida no degrada a actor `SYSTEM`;
28. `service_role` no redefine principal ni actor;
29. una Server Action humana conserva al actor humano aunque use privilegios
    internos;
30. procesos autónomos y procesos delegados son modelos diferentes;
31. fronteras asíncronas deben declarar qué modelo utilizan;
32. la simulación conserva siempre al actor real;
33. el sujeto simulado nunca se convierte en actor;
34. actor, dispositivo, proceso y delegación quedan trazables por separado;
35. ninguna credencial o secreto se almacena en el nodo;
36. los códigos finales de invalidez se reservan para AUTH-CTX-015;
37. la tarea no cambia `contract_version` ni `schema_version`;
38. no se implementa código, migraciones ni cambios en Supabase.

---

#### 40. Estado final de la propuesta

| Tarea        | Estado      |
| ------------ | ----------- |
| AUTH-CTX-005 | APROBADA    |
| AUTH-CTX-006 | APROBADA    |
| AUTH-CTX-007 | NO INICIADA |

No se avanza a AUTH-CTX-007 hasta recibir aprobación explícita de
AUTH-CTX-006.


