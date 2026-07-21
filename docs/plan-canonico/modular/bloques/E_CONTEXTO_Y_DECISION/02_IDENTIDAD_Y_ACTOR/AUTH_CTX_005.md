### ✅ AUTH-CTX-005 — Incluir principal autenticado

**Estado:** APROBADA  
**Bloque:** BLOQUE E — Contexto y decisión de autorización unificados  
**Naturaleza:** Refinamiento documental del nodo `principal` de `AccessContext`  
**Implementación física:** No incluida  
**Tarea anterior vigente:** AUTH-CTX-004 — APROBADA  
**Tarea posterior reservada:** AUTH-CTX-006 — Incluir actor efectivo  
**Contrato afectado:** `AccessContext@1.0.0`  
**Nodo afectado:** `principal`  
**Cambio contractual:** Aclaración normativa compatible; no cambia la forma publicada  
**Cambios físicos permitidos:** No

Esta tarea define de forma exhaustiva la semántica, procedencia, estados,
invariantes y límites del principal que presenta la credencial técnica ante
Vento OS.

No modifica la estructura raíz aprobada de `AccessContext`, no agrega campos,
no cambia `contract_version`, no cambia `schema_version` y no implementa tipos,
funciones SQL, RPC, RLS, migraciones, guards, adaptadores ni cambios en
Supabase.

---

#### 1. Objetivo

Definir el nodo `principal` de manera que Vento OS pueda responder de forma
inequívoca:

1. si la solicitud contiene una credencial autenticada;
2. qué clase de principal presentó esa credencial;
3. qué sujeto técnico de Supabase Auth está asociado, cuando aplique;
4. qué sesión técnica fue validada, cuando exista;
5. mediante qué método se autenticó;
6. desde cuándo se considera autenticado;
7. cuándo expira la sesión conocida;
8. si el principal es válido, inválido o anónimo;
9. qué datos no pueden inferirse a partir de la autenticación;
10. qué inconsistencias deberán registrarse para denegar de forma segura.

El nodo deberá impedir que una aplicación interprete:

```text
usuario autenticado
=
empleado
=
actor efectivo
=
rol
=
permiso
```

La relación correcta será:

```text
CREDENCIAL VALIDADA
        ↓
PRINCIPAL AUTENTICADO
        ↓
IDENTIDAD DE DOMINIO
        ↓
ACTOR EFECTIVO
        ↓
CONTEXTO LABORAL U OPERATIVO
        ↓
DECISIÓN DE AUTORIZACIÓN
```

---

#### 2. Decisión principal

El `principal` identifica exclusivamente quién o qué presentó la credencial
técnica aceptada por la capa de autenticación.

Regla canónica:

```text
principal
=
identidad técnica autenticada de la solicitud
```

No representa por sí solo:

```text
empleado
cliente
dispositivo empresarial activo
servicio empresarial autorizado
actor efectivo
rol base
rol operativo
sede
área
turno
check-in
permiso
alcance
autorización final
```

Por tanto:

```text
principal válido
≠ identidad de dominio válida
≠ actor efectivo resuelto
≠ autorización concedida
```

---

#### 3. Contrato vigente del nodo

Se conserva sin cambios la forma publicada en AUTH-CTX-001 y
AUTH-CTX-004:

```ts
type PrincipalContext = {
  principal_type:
    | "HUMAN_USER"
    | "SHARED_DEVICE"
    | "SYSTEM_SERVICE"
    | "ANONYMOUS";

  auth_user_id: string | null;
  session_id: string | null;
  authenticated: boolean;
  authentication_method: string | null;
  authenticated_at: string | null;
  session_expires_at: string | null;
  principal_status: "VALID" | "INVALID" | "ANONYMOUS";
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

#### 4. Fuente de verdad

El nodo `principal` deberá resolverse exclusivamente en servidor a partir de
una fuente técnica confiable.

Fuentes permitidas:

| Clase            | Fuente autoritativa                                                                |
| ---------------- | ---------------------------------------------------------------------------------- |
| `HUMAN_USER`     | JWT o sesión validada por Supabase Auth                                            |
| `SHARED_DEVICE`  | Sesión de Supabase Auth perteneciente al usuario técnico vinculado al dispositivo  |
| `SYSTEM_SERVICE` | Credencial o identidad técnica validada dentro de un proceso de servidor confiable |
| `ANONYMOUS`      | Ausencia comprobada de una credencial válida                                       |

No serán fuente de verdad:

- cookies no verificadas;
- datos enviados en el body;
- query parameters;
- headers empresariales definidos por el cliente;
- `localStorage`;
- estado de React;
- nombre, correo o UUID enviado por una pantalla;
- rol declarado por el frontend;
- sede o área seleccionada;
- `navigation_role`;
- identificadores de simulación;
- respuestas almacenadas sin control de vigencia;
- tokens decodificados sin verificar firma, emisor, audiencia y expiración.

---

#### 5. Límite de confianza

La resolución seguirá este límite:

```text
SOLICITUD NO CONFIABLE
        ↓
VALIDACIÓN CRIPTOGRÁFICA Y DE SESIÓN
        ↓
CLASIFICACIÓN DEL PRINCIPAL
        ↓
CONSTRUCCIÓN DEL NODO `principal`
        ↓
RESOLUCIÓN EMPRESARIAL POSTERIOR
```

Los claims técnicos podrán utilizarse únicamente después de validar:

- firma;
- emisor;
- audiencia o proyecto esperado;
- expiración;
- revocación cuando la plataforma lo permita;
- consistencia mínima del sujeto;
- método de autenticación reconocido;
- contexto de ejecución confiable para servicios.

La mera decodificación de un JWT no constituye autenticación.

---

#### 6. `principal_type`

`principal_type` clasifica la naturaleza del sujeto técnico que presenta la
credencial.

Valores congelados en `AccessContext@1.0.0`:

```text
HUMAN_USER
SHARED_DEVICE
SYSTEM_SERVICE
ANONYMOUS
```

No se utilizarán valores de roles empresariales como:

```text
propietario
gerente_general
cajero_satelite
bodeguero
cliente
administrador
```

Esos valores pertenecen a otras capas.

---

#### 7. `HUMAN_USER`

Representa una sesión personal autenticada mediante Supabase Auth.

Condiciones mínimas para estado `VALID`:

```text
credencial válida
+
sujeto Auth resoluble
+
sesión vigente
+
principal clasificado como persona
```

Reglas:

1. `auth_user_id` es obligatorio cuando el estado es `VALID`;
2. `auth_user_id` identifica al sujeto técnico de Auth, no al empleado;
3. la existencia del sujeto no confirma una fila en `employees`;
4. la existencia del sujeto no confirma una fila en `public.users`;
5. el correo no identifica de forma autoritativa al empleado;
6. los metadatos del usuario no conceden rol ni permisos;
7. el principal puede tener identidad laboral, identidad de cliente, ambas o
   ninguna;
8. la selección de la identidad de dominio corresponde a AUTH-CTX-007;
9. la atribución como actor efectivo corresponde a AUTH-CTX-006;
10. un empleado inactivo no convierte el principal técnico en inválido: hace
    inválida la identidad laboral posterior.

Ejemplo conceptual:

```text
principal_type   = HUMAN_USER
principal_status = VALID
authenticated    = true
        ↓
Todavía no se sabe si representa empleado o cliente.
```

---

#### 8. `SHARED_DEVICE`

Representa la sesión técnica de un dispositivo compartido registrado en
Vento OS.

En la versión `1.0.0`, un dispositivo compartido válido deberá autenticarse
mediante un usuario técnico de Supabase Auth vinculado de forma inequívoca al
dispositivo empresarial.

Condiciones mínimas para estado técnico `VALID`:

```text
sesión Auth válida
+
auth_user_id resoluble
+
clasificación técnica como dispositivo compartido
```

Reglas:

1. `auth_user_id` identifica al usuario técnico, no al trabajador;
2. el usuario técnico no puede tener identidad laboral humana;
3. el dispositivo no adquiere rol base;
4. el dispositivo no adquiere rol operativo por la autenticación;
5. la vigencia de la credencial no demuestra que el dispositivo empresarial
   esté activo;
6. la vinculación con `shared_operational_devices` se resolverá como identidad
   o contexto de dispositivo;
7. el actor humano deberá resolverse mediante una sesión de actor separada;
8. un dispositivo sin actor puede conservar principal técnico válido, pero no
   ejecutar mutaciones empresariales que exijan actor humano;
9. `navigation_role` no altera el principal;
10. las aplicaciones permitidas del dispositivo no alteran el principal.

Separación obligatoria:

```text
PRINCIPAL
usuario técnico del dispositivo

DISPOSITIVO EMPRESARIAL
registro y estado del terminal

ACTOR EFECTIVO
trabajador identificado en la sesión de actor
```

Ejemplo:

```text
principal_type = SHARED_DEVICE
principal_status = VALID
        ↓
device_context puede ser ACTIVE o INVALID
        ↓
actor_effective puede ser EMPLOYEE o UNRESOLVED
```

---

#### 9. `SYSTEM_SERVICE`

Representa un proceso técnico autenticado que se ejecuta dentro de un entorno
de servidor confiable.

Ejemplos conceptuales:

- job programado;
- Edge Function interna;
- webhook verificado;
- adaptador de integración;
- proceso de reconciliación;
- tarea de mantenimiento;
- ejecución administrativa controlada;
- proceso que utiliza una credencial privilegiada de Supabase.

Reglas:

1. `service_role` es una credencial técnica, no un permiso empresarial;
2. el uso de `createAdminClient()` no convierte al servicio en administrador;
3. `SYSTEM_SERVICE` no tiene rol base;
4. `SYSTEM_SERVICE` no tiene rol operativo;
5. el principal técnico deberá resolverse dentro de un proceso de servidor
   identificado;
6. `auth_user_id` podrá ser `null` cuando la credencial no represente una fila
   de `auth.users`;
7. un principal `VALID` deberá conservar una referencia técnica no secreta y
   auditable mediante `session_id` o mediante la evidencia autorizada de
   `resolution_metadata`;
8. la referencia nunca será la API key, el JWT, el secreto o su valor completo;
9. la identidad empresarial del servicio se resolverá después como
   `domain_identity = SYSTEM` cuando corresponda;
10. el actor efectivo será `SYSTEM` o un empleado delegado explícitamente,
    pero esa definición pertenece a AUTH-CTX-006;
11. no existirá delegación humana implícita;
12. el nombre de una función, ruta o repositorio no basta para autenticar un
    servicio.

Regla crítica:

```text
SYSTEM_SERVICE válido
≠ operación empresarial permitida
```

---

#### 10. `ANONYMOUS`

Representa la ausencia explícita de una credencial válida.

No se utilizará `null` en el nodo raíz para representar anonimato.

Forma obligatoria:

```ts
{
  principal_type: "ANONYMOUS",
  auth_user_id: null,
  session_id: null,
  authenticated: false,
  authentication_method: null,
  authenticated_at: null,
  session_expires_at: null,
  principal_status: "ANONYMOUS"
}
```

Reglas:

1. anónimo no significa sesión inválida;
2. anónimo significa que no se presentó una credencial aceptable;
3. las aplicaciones laborales privadas deberán denegar;
4. un endpoint público podrá continuar únicamente si su contrato permite
   acceso anónimo;
5. el anonimato no crea identidad de cliente;
6. el anonimato no crea actor efectivo empresarial;
7. una solicitud pública que después requiere mutación deberá resolver una
   identidad y autorización apropiadas;
8. no se inferirá identidad desde correo, teléfono, QR, código de pedido o
   identificador enviado por el cliente.

---

#### 11. `auth_user_id`

`auth_user_id` representa exclusivamente el identificador del sujeto de
Supabase Auth cuando la clase de principal utiliza `auth.users`.

Semántica:

```text
auth_user_id
=
identificador técnico del sujeto Auth validado
```

No significa:

```text
employee_id
customer_id
device_id
actor_id
created_by empresarial
rol
permiso
```

Reglas:

1. será obligatorio para `HUMAN_USER + VALID`;
2. será obligatorio para `SHARED_DEVICE + VALID` en el modelo `1.0.0`;
3. podrá ser `null` para `SYSTEM_SERVICE`;
4. será `null` para `ANONYMOUS`;
5. no podrá aceptarse desde el cliente;
6. no podrá sustituirse por un correo;
7. no podrá sustituirse por un UUID empresarial;
8. una vinculación con varias identidades de dominio deberá resolverse de
   forma explícita, no por orden arbitrario;
9. una vinculación inexistente no invalida necesariamente la autenticación,
   pero sí puede impedir la operación empresarial solicitada;
10. una vinculación duplicada o ambigua produce un problema estructural.

---

#### 12. `session_id`

`session_id` será una referencia opaca a la sesión o ejecución técnica
validada.

Reglas:

1. no contendrá el access token;
2. no contendrá el refresh token;
3. no contendrá el JWT completo;
4. no contendrá una API key;
5. no contendrá un secreto de integración;
6. no será reutilizable como credencial;
7. deberá permitir correlación técnica y auditoría cuando la plataforma
   disponga de un identificador estable;
8. podrá ser `null` cuando la fuente técnica no exponga un identificador
   seguro;
9. para servicios sin `auth_user_id`, deberá existir una referencia técnica
   auditable en `session_id` o en `resolution_metadata`;
10. no representa una sesión de actor de dispositivo;
11. no representa un turno;
12. no representa un check-in;
13. no representa una sesión de simulación.

Separación:

```text
principal.session_id
≠ device_context.actor_session_id
≠ active_shift.shift_id
≠ active_checkin_session.checkin_session_id
≠ simulation_id
```

---

#### 13. `authenticated`

`authenticated` será un indicador derivado, no una fuente independiente.

Regla:

```text
authenticated = true
SI Y SOLO SI
principal_status = VALID
AND principal_type != ANONYMOUS
```

Tabla:

| `principal_status` | `principal_type`      | `authenticated` |
| ------------------ | --------------------- | --------------: |
| `VALID`            | `HUMAN_USER`          |          `true` |
| `VALID`            | `SHARED_DEVICE`       |          `true` |
| `VALID`            | `SYSTEM_SERVICE`      |          `true` |
| `INVALID`          | cualquiera no anónimo |         `false` |
| `ANONYMOUS`        | `ANONYMOUS`           |         `false` |

No se permitirá:

```text
principal_status = INVALID
authenticated = true
```

ni:

```text
principal_type = ANONYMOUS
authenticated = true
```

---

#### 14. `authentication_method`

`authentication_method` describe de forma segura el mecanismo técnico que
produjo la autenticación.

Será un valor canónico normalizado, no una copia arbitraria de metadatos del
proveedor.

Registro inicial recomendado:

```text
PASSWORD
OTP
MAGIC_LINK
OAUTH
SSO
DEVICE_CREDENTIAL
SERVICE_CREDENTIAL
SIGNED_WEBHOOK
INTERNAL_JOB
UNKNOWN_AUTHENTICATED_METHOD
```

Reglas:

1. será `null` para `ANONYMOUS`;
2. no contendrá nombres de secretos;
3. no contendrá tokens;
4. no contendrá correos ni teléfonos;
5. no concederá permisos por sí mismo;
6. un método desconocido no se convertirá en un método más confiable;
7. un método nuevo podrá añadirse como extensión compatible cuando no cambie
   la semántica de los existentes;
8. la fuerza o nivel de aseguramiento no se inferirá únicamente del nombre;
9. MFA, cuando exista, deberá representarse mediante evidencia técnica
   apropiada en una evolución contractual o metadato autorizado, sin inventar
   un campo en esta tarea;
10. las aplicaciones no deberán implementar reglas empresariales mediante
    comparaciones locales de este texto.

---

#### 15. `authenticated_at`

`authenticated_at` registra el momento conocido en que la sesión o credencial
fue validada o emitida para el principal.

Reglas:

1. se serializará en UTC mediante ISO 8601;
2. será `null` para `ANONYMOUS`;
3. deberá provenir de una fuente técnica confiable;
4. no se aceptará desde el reloj del cliente;
5. no equivale a `resolved_at`;
6. no equivale al inicio del turno;
7. no equivale al check-in;
8. no equivale al inicio de una sesión de actor;
9. para un servicio podrá representar el inicio de la autenticación de la
   ejecución actual;
10. si la fuente no puede determinarlo de manera confiable, podrá ser `null`
    y deberá conservarse evidencia suficiente en `resolution_metadata`.

Separación:

```text
authenticated_at
→ cuándo se autenticó el principal

resolved_at
→ cuándo se construyó el AccessContext
```

---

#### 16. `session_expires_at`

`session_expires_at` registra la expiración conocida de la sesión técnica.

Reglas:

1. se serializará en UTC mediante ISO 8601;
2. será `null` para `ANONYMOUS`;
3. una expiración anterior o igual a `resolved_at` impide estado `VALID`;
4. una sesión expirada no se renovará mediante datos del frontend;
5. una sesión renovada deberá producir un nuevo contexto o invalidar el
   anterior;
6. `null` no significa autorización indefinida;
7. para credenciales de servicio sin expiración embebida, cada ejecución
   deberá volver a validar la credencial y las políticas técnicas;
8. la rotación o revocación puede invalidar el principal antes de la fecha;
9. no equivale a expiración de sesión de actor;
10. no equivale a fin de turno;
11. no equivale a fin de check-in;
12. no equivale al TTL de caché del `AccessContext`.

---

#### 17. `principal_status`

Estados congelados:

```text
VALID
INVALID
ANONYMOUS
```

##### 17.1 `VALID`

Significa únicamente que la credencial técnica y la sesión aplicable fueron
aceptadas por la capa de autenticación.

No confirma:

- identidad empresarial;
- estado del empleado;
- estado del cliente;
- estado del dispositivo;
- autorización del servicio;
- actor efectivo;
- permisos;
- cobertura;
- contexto operativo.

##### 17.2 `INVALID`

Se utiliza cuando existe una credencial o sesión presentada, pero no puede
aceptarse como principal válido.

Ejemplos conceptuales:

- firma inválida;
- emisor incorrecto;
- audiencia o proyecto incorrecto;
- token expirado;
- sesión revocada;
- sujeto obligatorio ausente;
- claims técnicos contradictorios;
- principal técnico no soportado;
- clasificación ambigua entre persona y dispositivo;
- credencial de servicio presentada desde un entorno no confiable.

##### 17.3 `ANONYMOUS`

Se utiliza cuando no existe una credencial válida presentada y el sistema
representa explícitamente la solicitud como anónima.

---

#### 18. Diferencia entre principal inválido e identidad inactiva

Esta separación es obligatoria.

Ejemplo A:

```text
JWT válido
+
empleado inactivo
```

Resultado:

```text
principal_status = VALID
employee.is_active = false
structural issue = employee_inactive
```

Ejemplo B:

```text
JWT válido de usuario técnico
+
dispositivo empresarial inactivo
```

Resultado:

```text
principal_status = VALID
device_context.status = INACTIVE o INVALID
structural issue = device_inactive
```

Ejemplo C:

```text
credencial de servicio válida
+
proceso no autorizado para la operación
```

Resultado:

```text
principal_status = VALID
actor o autorización posterior = no resoluble o DENY
```

Ejemplo D:

```text
JWT expirado
```

Resultado:

```text
principal_status = INVALID
authenticated = false
```

La actividad empresarial no se codificará dentro de
`principal_status`.

---

#### 19. Matriz de consistencia

| Tipo             | Estado      | `auth_user_id`    | `authenticated` | Regla                                                               |
| ---------------- | ----------- | ----------------- | --------------: | ------------------------------------------------------------------- |
| `HUMAN_USER`     | `VALID`     | Obligatorio       |          `true` | Sesión personal válida                                              |
| `HUMAN_USER`     | `INVALID`   | Opcional          |         `false` | Sujeto no confiable o sesión inválida                               |
| `SHARED_DEVICE`  | `VALID`     | Obligatorio en v1 |          `true` | Usuario técnico válido; dispositivo empresarial se resuelve después |
| `SHARED_DEVICE`  | `INVALID`   | Opcional          |         `false` | Credencial o clasificación técnica inválida                         |
| `SYSTEM_SERVICE` | `VALID`     | Opcional          |          `true` | Proceso técnico autenticado en servidor                             |
| `SYSTEM_SERVICE` | `INVALID`   | Opcional          |         `false` | Credencial o entorno no confiable                                   |
| `ANONYMOUS`      | `ANONYMOUS` | `null`            |         `false` | Sin credencial aceptada                                             |

Combinaciones inválidas:

```text
ANONYMOUS + VALID
ANONYMOUS + INVALID
HUMAN_USER + ANONYMOUS
SHARED_DEVICE + ANONYMOUS
SYSTEM_SERVICE + ANONYMOUS
VALID + authenticated false
INVALID + authenticated true
ANONYMOUS + auth_user_id no nulo
ANONYMOUS + session_id no nulo
```

Toda combinación inválida deberá producir un problema estructural y fallar de
forma cerrada para operaciones privadas.

---

#### 20. Clasificación de persona frente a dispositivo

Un usuario técnico de dispositivo también puede existir físicamente en
`auth.users`.

Por tanto, la presencia de `auth_user_id` no basta para clasificar:

```text
HUMAN_USER
vs.
SHARED_DEVICE
```

La clasificación deberá utilizar una relación empresarial inequívoca y
controlada.

Regla:

```text
auth_user_id vinculado a dispositivo técnico activo o registrado
→ principal_type = SHARED_DEVICE

registro personal autenticado sin vinculación técnica de dispositivo
→ principal_type = HUMAN_USER
```

Cuando exista una vinculación contradictoria o múltiple:

```text
principal_status = INVALID
```

hasta resolver la ambigüedad.

No se utilizarán como criterio único:

- dominio del correo;
- prefijo del correo;
- nombre visible;
- metadata editable por usuario;
- user agent;
- ruta de acceso;
- aplicación abierta;
- IP;
- `navigation_role`;
- sede del dispositivo enviada por el cliente.

---

#### 21. Servicios y credenciales privilegiadas

La detección de una credencial privilegiada no será suficiente para construir
un servicio empresarial autorizado.

Separación:

```text
CREDENCIAL TÉCNICA
→ autentica el principal SYSTEM_SERVICE

IDENTIDAD DEL PROCESO
→ identifica el servicio, job o integración

ACTOR EFECTIVO
→ sistema o empleado delegado

AUTORIZACIÓN
→ valida la operación exacta
```

No se permitirá:

```text
service_role detectado
→ propietario
```

ni:

```text
service_role detectado
→ ALLOW general
```

ni:

```text
Edge Function
→ servicio confiable por nombre
```

La autenticación del servicio deberá incluir controles de entorno,
procedencia y credencial definidos por el adaptador o proceso propietario.

---

#### 22. Relación con `actor_effective`

Esta tarea no define el nodo `actor_effective`.

Solo establece la entrada necesaria para resolverlo en AUTH-CTX-006.

Relaciones esperadas:

```text
HUMAN_USER
→ puede resolver EMPLOYEE o CUSTOMER

SHARED_DEVICE
→ requiere sesión de actor para resolver EMPLOYEE

SYSTEM_SERVICE
→ puede resolver SYSTEM o delegación explícita

ANONYMOUS
→ normalmente UNRESOLVED para acciones empresariales
```

Regla:

```text
principal_type
no determina automáticamente
actor_type
```

No se definirán todavía:

- `actor_id`;
- `attribution_source`;
- `delegation_id`;
- reglas completas de atribución;
- actor de dispositivo;
- actor de servicio;
- actor de cliente.

Todo ello corresponde a AUTH-CTX-006.

---

#### 23. Relación con `domain_identity`

Esta tarea no selecciona la identidad empresarial usada por la aplicación.

Un mismo `HUMAN_USER` podrá estar vinculado con:

```text
EMPLOYEE
+
CUSTOMER
```

El `principal` no elegirá una de ellas mediante fallback.

La selección deberá considerar:

- aplicación solicitante;
- dominio funcional;
- operación;
- vínculo empresarial vigente;
- estado de la identidad;
- compatibilidad del dominio.

La definición completa pertenece a AUTH-CTX-007.

---

#### 24. Relación con Supabase Auth y RLS

`principal` documenta la autenticación observada, pero no reemplaza los
mecanismos técnicos de Supabase.

Reglas:

1. `auth.uid()` seguirá siendo el sujeto técnico de una sesión de usuario
   cuando corresponda;
2. `principal.auth_user_id` deberá coincidir con el sujeto validado;
3. `principal` no modifica `auth.uid()`;
4. `principal` no crea sesión;
5. `principal` no renueva tokens;
6. `principal` no revoca tokens;
7. `principal` no modifica claims;
8. `principal` no concede bypass RLS;
9. una función `SECURITY DEFINER` deberá validar internamente principal,
   identidad, actor y autorización según su contrato;
10. un cliente con `service_role` deberá permanecer exclusivamente en
    servidor;
11. una respuesta serializada no se convertirá en prueba suficiente para una
    mutación posterior;
12. cada operación sensible deberá volver a utilizar un contexto vigente o
    una referencia de contexto validada.

---

#### 25. Exposición segura al cliente

El contrato canónico completo podrá existir en servidor, pero las
proyecciones enviadas al cliente deberán aplicar minimización.

Datos que no deberán exponerse:

- access token;
- refresh token;
- JWT completo;
- API key;
- secret key;
- service role key;
- claims internos innecesarios;
- identificadores de credenciales reutilizables;
- datos del proveedor que permitan escalar privilegios;
- detalles internos de validación criptográfica.

`auth_user_id` y `session_id` podrán:

- permanecer solo en servidor;
- enviarse enmascarados;
- omitirse de una proyección no autoritativa;
- sustituirse por referencias seguras de correlación.

La proyección de interfaz no modifica el contrato autoritativo interno.

---

#### 26. Auditoría

La resolución del principal deberá permitir auditar, como mínimo:

- `context_id`;
- `resolved_at`;
- `principal_type`;
- `principal_status`;
- `authenticated`;
- `authentication_method`;
- referencia segura del sujeto técnico;
- referencia segura de sesión o ejecución;
- fuente de resolución;
- versión del resolver;
- inconsistencias detectadas.

No se registrarán:

- tokens;
- secretos;
- contraseñas;
- códigos OTP;
- magic links;
- API keys completas;
- refresh tokens;
- headers sensibles completos.

Los logs técnicos y la auditoría empresarial deberán conservar objetivos
diferentes.

---

#### 27. Problemas estructurales relacionados

AUTH-CTX-005 no congela el catálogo definitivo de `structural_issues`.

Ese catálogo corresponde a AUTH-CTX-015.

Sin embargo, la resolución deberá poder representar situaciones como:

```text
unauthenticated
credential_invalid
session_expired
session_revoked
unsupported_principal
principal_classification_ambiguous
auth_subject_missing
auth_subject_mismatch
shared_device_auth_link_missing
service_execution_untrusted
principal_contract_inconsistent
```

Estos nombres son ejemplos de trabajo y no sustituyen la definición final de
AUTH-CTX-015.

Regla de severidad:

```text
principal INVALID
→ bloquea todas las evaluaciones privadas

principal ANONYMOUS
→ bloquea aplicaciones laborales y operaciones no públicas

principal VALID
→ permite continuar la resolución, pero no concede autorización
```

---

#### 28. Resolución canónica

Orden conceptual:

```text
1. Obtener evidencia técnica de la solicitud.
2. Verificar la credencial en servidor.
3. Determinar si existe principal autenticado o anónimo.
4. Clasificar HUMAN_USER, SHARED_DEVICE o SYSTEM_SERVICE.
5. Resolver auth_user_id cuando aplique.
6. Resolver referencia segura de sesión o ejecución.
7. Normalizar authentication_method.
8. Resolver authenticated_at y session_expires_at.
9. Determinar principal_status.
10. Verificar invariantes internas.
11. Registrar problemas estructurales.
12. Congelar el nodo principal dentro del AccessContext.
13. Continuar hacia actor_effective.
```

No se resolverá en esta etapa:

- empleado;
- cliente;
- actor humano de dispositivo;
- rol;
- turno;
- check-in;
- sede;
- área;
- permiso;
- recurso;
- decisión.

---

#### 29. Casos canónicos

##### 29.1 Persona autenticada válida

```ts
{
  principal_type: "HUMAN_USER",
  auth_user_id: "auth-user-uuid",
  session_id: "opaque-session-reference",
  authenticated: true,
  authentication_method: "PASSWORD",
  authenticated_at: "2026-07-21T12:00:00Z",
  session_expires_at: "2026-07-21T13:00:00Z",
  principal_status: "VALID"
}
```

Interpretación:

```text
Autenticación válida.
Identidad laboral todavía no resuelta.
Actor efectivo todavía no resuelto.
Autorización todavía no evaluada.
```

##### 29.2 Dispositivo compartido autenticado

```ts
{
  principal_type: "SHARED_DEVICE",
  auth_user_id: "technical-auth-user-uuid",
  session_id: "opaque-device-auth-session",
  authenticated: true,
  authentication_method: "DEVICE_CREDENTIAL",
  authenticated_at: "2026-07-21T12:00:00Z",
  session_expires_at: "2026-07-21T20:00:00Z",
  principal_status: "VALID"
}
```

Interpretación:

```text
El usuario técnico es válido.
El dispositivo empresarial debe resolverse después.
El trabajador actor debe resolverse después.
```

##### 29.3 Servicio autenticado

```ts
{
  principal_type: "SYSTEM_SERVICE",
  auth_user_id: null,
  session_id: "safe-job-execution-reference",
  authenticated: true,
  authentication_method: "INTERNAL_JOB",
  authenticated_at: "2026-07-21T12:00:00Z",
  session_expires_at: null,
  principal_status: "VALID"
}
```

Interpretación:

```text
La ejecución técnica fue autenticada.
La operación empresarial todavía requiere identidad del proceso,
actor y autorización.
```

##### 29.4 Solicitud anónima

```ts
{
  principal_type: "ANONYMOUS",
  auth_user_id: null,
  session_id: null,
  authenticated: false,
  authentication_method: null,
  authenticated_at: null,
  session_expires_at: null,
  principal_status: "ANONYMOUS"
}
```

##### 29.5 Sesión expirada

```ts
{
  principal_type: "HUMAN_USER",
  auth_user_id: "auth-user-uuid",
  session_id: "expired-session-reference",
  authenticated: false,
  authentication_method: "PASSWORD",
  authenticated_at: "2026-07-21T10:00:00Z",
  session_expires_at: "2026-07-21T11:00:00Z",
  principal_status: "INVALID"
}
```

No se continuará hacia una autorización privada válida.

---

#### 30. Patrones prohibidos

Quedan prohibidos:

##### 30.1 Convertir autenticación en rol

```ts
if (user) return "propietario";
```

##### 30.2 Convertir usuario técnico en empleado

```ts
employeeId = auth.uid();
```

sin una relación empresarial validada.

##### 30.3 Clasificar dispositivo por correo

```ts
email.startsWith("tablet-")
```

como única fuente autoritativa.

##### 30.4 Confiar en el body

```ts
const principalType = body.principalType;
```

##### 30.5 Tratar service role como autorización

```ts
if (isServiceRole) return ALLOW;
```

##### 30.6 Ocultar una sesión inválida mediante fallback

```text
sesión inválida
→ usar usuario guardado en cookie
```

##### 30.7 Mezclar sesión técnica y sesión de actor

```text
principal.session_id
=
device actor session
```

##### 30.8 Exponer credenciales

```ts
principal.session_id = accessToken;
```

##### 30.9 Inferir actor por navegación

```text
navigation_role
→ actor efectivo
```

##### 30.10 Conceder permisos por método de autenticación

```text
SSO
→ acceso administrativo
```

---

#### 31. Compatibilidad con decisiones aprobadas

Esta tarea conserva:

- AUTH-MOD-001 — separación entre principal, identidad y actor;
- AUTH-MOD-011 — el dispositivo técnico no reemplaza al trabajador;
- AUTH-MOD-012 — la simulación no modifica `auth.uid()` ni el actor real;
- AUTH-MOD-018 — la autenticación no altera precedencia de permisos;
- AUTH-MOD-019 — una credencial válida no neutraliza denegaciones;
- AUTH-CAT — los permisos son capacidades empresariales, no credenciales;
- AUTH-RBAC — los roles y excepciones no identifican al principal;
- AUTH-CTX-001 — forma del nodo `principal`;
- AUTH-CTX-002 — la decisión se evalúa después del contexto;
- AUTH-CTX-003 — el actor real se conserva durante simulación;
- AUTH-CTX-004 — versión `1.0.0` y reglas de compatibilidad.

No reabre ninguna decisión aprobada.

---

#### 32. Impacto contractual

Esta tarea no cambia la forma serializada aprobada.

Por tanto:

```text
contract_version = 1.0.0
schema_version   = 1.0.0
```

Se considera una precisión normativa del contenido ya diseñado, no una
adición de campo ni un cambio de significado incompatible.

Cualquier necesidad futura de agregar campos como:

- nivel de aseguramiento;
- MFA detallado;
- proveedor de identidad;
- identificador técnico de credencial;
- cadena de delegación;
- información de dispositivo cliente;

requerirá análisis de versionado según AUTH-CTX-004.

No se agregarán silenciosamente.

---

#### 33. Dependencias posteriores

##### AUTH-CTX-006

Definirá `actor_effective`, atribución, delegación y estados no resueltos.

##### AUTH-CTX-007

Definirá la identidad laboral, de cliente, dispositivo o sistema utilizada por
el dominio.

##### AUTH-CTX-014

Definirá el contexto completo del dispositivo compartido y su sesión de actor.

##### AUTH-CTX-015

Congelará razones estructuradas y severidades.

##### AUTH-CTX-025

Diseñará el contrato SQL que deberá producir este nodo.

##### AUTH-CTX-028

Definirá compatibilidad con funciones legacy.

##### AUTH-CTX-030

Definirá pruebas contractuales.

##### BLOQUE H

Materializará tipos, schemas y helpers compartidos cuando corresponda.

##### BLOQUE E3

Definirá las fuentes físicas de identidad técnica y sus relaciones.

##### BLOQUE R

Implementará migraciones, RPC, controles, transición y retiro de lógica
legacy.

---

#### 34. Fuera del alcance

AUTH-CTX-005 no:

- define `actor_effective`;
- define `domain_identity`;
- resuelve empleado;
- resuelve cliente;
- resuelve dispositivo empresarial;
- resuelve servicio empresarial;
- define rol base;
- define cobertura administrativa;
- define turno;
- define check-in;
- define rol operativo;
- define sede o área operativa;
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
- cambia sesiones actuales;
- crea secretos;
- modifica Auth;
- implementa código mediante Codex.

---

#### 35. Criterios de aprobación

AUTH-CTX-005 podrá aprobarse cuando se acepte que:

1. `principal` identifica quién o qué presentó la credencial técnica;
2. principal no equivale a identidad de dominio;
3. principal no equivale a actor efectivo;
4. principal no equivale a rol ni permiso;
5. se conservan cuatro tipos: `HUMAN_USER`, `SHARED_DEVICE`,
   `SYSTEM_SERVICE` y `ANONYMOUS`;
6. se conservan los campos publicados en AUTH-CTX-001;
7. no se agrega ningún campo;
8. `auth_user_id` identifica al sujeto de Auth cuando aplica;
9. `auth_user_id` no es `employee_id`;
10. `auth_user_id` es obligatorio para persona válida;
11. `auth_user_id` es obligatorio para dispositivo compartido válido en v1;
12. `auth_user_id` puede ser nulo para servicios;
13. `session_id` es una referencia opaca no reutilizable como credencial;
14. `session_id` no contiene tokens ni secretos;
15. `authenticated` es derivado de `principal_status`;
16. `VALID` implica `authenticated = true`;
17. `INVALID` implica `authenticated = false`;
18. `ANONYMOUS` implica campos de sesión nulos;
19. una identidad empresarial inactiva no vuelve inválida la credencial;
20. un dispositivo empresarial inactivo no vuelve inválida por sí sola la
    sesión técnica;
21. un servicio autenticado no queda automáticamente autorizado;
22. la clasificación persona/dispositivo no depende solo del correo;
23. ningún dato autoritativo procede del cliente;
24. los claims se validan antes de usarse;
25. `authentication_method` se normaliza de forma segura;
26. `authenticated_at` y `session_expires_at` usan tiempo de servidor o
    evidencia técnica confiable;
27. una sesión expirada produce principal inválido;
28. `null` en expiración no significa autoridad indefinida;
29. `principal` no modifica `auth.uid()`;
30. `principal` no crea bypass RLS;
31. una proyección cliente minimiza identificadores y nunca expone secretos;
32. la auditoría conserva referencias seguras, no credenciales;
33. los problemas estructurales finales se reservan para AUTH-CTX-015;
34. la atribución del actor se reserva para AUTH-CTX-006;
35. la identidad empresarial se reserva para AUTH-CTX-007;
36. la tarea no cambia `contract_version` ni `schema_version`;
37. no se implementa código, migraciones ni cambios en Supabase.

---

#### 36. Estado final de la propuesta

| Tarea        | Estado      |
| ------------ | ----------- |
| AUTH-CTX-004 | APROBADA    |
| AUTH-CTX-005 | APROBADA    |
| AUTH-CTX-006 | NO INICIADA |

No se avanza a AUTH-CTX-006 hasta recibir aprobación explícita de
AUTH-CTX-005.


