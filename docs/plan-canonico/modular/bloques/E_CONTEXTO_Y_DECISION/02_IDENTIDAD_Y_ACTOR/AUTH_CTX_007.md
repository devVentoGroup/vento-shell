### ✅ AUTH-CTX-007 — Incluir identidad laboral o de dominio

**Estado:** APROBADA  
**Bloque:** BLOQUE E — Contexto y decisión de autorización unificados  
**Naturaleza:** Refinamiento documental de los nodos `domain_identity` y `employee` de `AccessContext`  
**Implementación física:** No incluida  
**Tarea anterior vigente:** AUTH-CTX-006 — APROBADA  
**Tarea posterior reservada:** AUTH-CTX-008 — Incluir rol base vigente  
**Contrato afectado:** `AccessContext@1.0.0`  
**Nodos afectados:** `domain_identity` y `employee`  
**Cambio contractual:** Aclaración normativa compatible; no cambia la forma publicada  
**Cambios físicos permitidos:** No

Esta tarea define de forma exhaustiva la semántica, procedencia, selección,
vigencia, consistencia y límites de la identidad empresarial utilizada por un
dominio consumidor, así como la representación mínima de la identidad laboral
cuando un empleado participa en el contexto.

No modifica la estructura raíz aprobada de `AccessContext`, no agrega campos,
no cambia `contract_version`, no cambia `schema_version` y no implementa tipos,
funciones SQL, RPC, RLS, migraciones, adaptadores, guards, aplicaciones ni
cambios en Supabase.

---

#### 1. Objetivo

Definir los nodos `domain_identity` y `employee` de manera que Vento OS pueda
responder inequívocamente:

1. qué identidad empresarial es relevante para la solicitud;
2. si esa identidad corresponde a empleado, cliente, dispositivo o sistema;
3. cuál es el identificador canónico dentro de su dominio;
4. qué relación autoritativa permitió resolverla;
5. si la identidad está activa, inactiva o inválida;
6. cómo seleccionar una identidad cuando una credencial posee varias;
7. cuándo la identidad debe quedar en `null`;
8. cuándo debe incluirse el nodo laboral `employee`;
9. cómo conservar una identidad laboral conocida aunque esté inactiva;
10. cómo evitar que cliente, dispositivo o servicio se conviertan en empleado;
11. cómo evitar que el rol se trate como identidad;
12. cómo mantener consistencia con el principal y el actor efectivo;
13. cómo representar sesiones personales, dispositivos compartidos y procesos;
14. qué datos laborales son necesarios para autorización y cuáles no deben
    exponerse;
15. qué inconsistencias deberán fallar de forma cerrada.

La tarea deberá impedir interpretaciones como:

```text
auth_user_id
=
employee_id
=
customer_id
=
device_id
=
actor_id
=
role_code
```

La relación correcta será:

```text
PRINCIPAL AUTENTICADO
        ↓
RELACIONES EMPRESARIALES CANÓNICAS
        ↓
IDENTIDAD DE DOMINIO APLICABLE
        ↓
ACTOR EFECTIVO
        ↓
IDENTIDAD LABORAL, CUANDO CORRESPONDA
        ↓
ROL Y CONTEXTO POSTERIORES
        ↓
DECISIÓN DE AUTORIZACIÓN
```

---

#### 2. Decisión principal

`domain_identity` identifica la entidad empresarial que el principal
representa frente al dominio, aplicación o proceso que recibe la solicitud.

Regla canónica:

```text
domain_identity
=
identidad empresarial única seleccionada
para la vía de acceso y dominio solicitante
```

El nodo `employee` representa exclusivamente la identidad laboral mínima del
trabajador que participa como identidad de dominio o actor efectivo.

Regla canónica:

```text
employee
=
snapshot laboral mínimo del empleado relevante
para el contexto
```

Ninguno de los dos nodos representa por sí solo:

```text
permiso
allow
deny
rol operativo
turno
check-in
cobertura territorial
sede activa
área activa
dispositivo habilitado
delegación autorizada
resultado final
```

Por tanto:

```text
identidad resuelta
≠ identidad activa
≠ carril disponible
≠ autorización concedida
```

Y:

```text
empleado existente
≠ empleado activo
≠ rol válido
≠ permiso vigente
```

---

#### 3. Contratos vigentes de los nodos

Se conservan sin cambios las formas publicadas en AUTH-CTX-001 y
AUTH-CTX-004.

##### 3.1 `DomainIdentityContext`

```ts
type DomainIdentityContext = {
  identity_type: "EMPLOYEE" | "CUSTOMER" | "DEVICE" | "SYSTEM";
  identity_id: string;
  status: "ACTIVE" | "INACTIVE" | "INVALID";
  source: string;
};
```

##### 3.2 `EmployeeContext`

```ts
type EmployeeContext = {
  employee_id: string;
  auth_user_id: string | null;
  is_active: boolean;
  employment_status: string;
  base_role_code: string | null;
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

#### 4. Separación de conceptos

Los conceptos deberán permanecer separados:

| Concepto          | Pregunta que responde                                            |
| ----------------- | ---------------------------------------------------------------- |
| `principal`       | ¿Quién o qué presentó la credencial técnica?                     |
| `domain_identity` | ¿Qué entidad empresarial representa en esta vía de acceso?       |
| `actor_effective` | ¿A quién se atribuye la acción concreta?                         |
| `employee`        | ¿Qué identidad laboral mínima corresponde al empleado relevante? |
| `base_role`       | ¿Qué rol base vigente tiene ese empleado?                        |
| `device_context`  | ¿Qué dispositivo y sesión de actor intervienen?                  |

Ejemplo de sesión personal laboral:

```text
principal
→ HUMAN_USER

domain_identity
→ EMPLOYEE

actor_effective
→ EMPLOYEE

employee
→ mismo trabajador
```

Ejemplo de Vento Pass:

```text
principal
→ HUMAN_USER

domain_identity
→ CUSTOMER

actor_effective
→ CUSTOMER

employee
→ null
```

Ejemplo de dispositivo compartido:

```text
principal
→ SHARED_DEVICE

domain_identity
→ DEVICE

actor_effective
→ EMPLOYEE

employee
→ trabajador de la sesión de actor
```

Ejemplo de proceso autónomo:

```text
principal
→ SYSTEM_SERVICE

domain_identity
→ SYSTEM

actor_effective
→ SYSTEM

employee
→ null
```

Ejemplo de proceso delegado:

```text
principal
→ SYSTEM_SERVICE

domain_identity
→ SYSTEM

actor_effective
→ EMPLOYEE

employee
→ empleado objetivo de la delegación
```

---

#### 5. Identidad singular y contextual

Cada `AccessContext` tendrá como máximo una `domain_identity`.

Resultados permitidos:

```text
una identidad de dominio exacta
```

O:

```text
domain_identity = null
```

No se devolverá:

- una lista de identidades;
- una identidad primaria y otra secundaria;
- empleado y cliente simultáneamente;
- dispositivo y empleado fusionados;
- identidad elegida por prioridad arbitraria;
- identidad derivada del rol más privilegiado.

Una misma credencial podrá vincularse con varias identidades empresariales,
pero la solicitud deberá utilizar una sola vía de acceso canónica.

Ejemplo:

```text
mismo auth_user_id
├── identidad EMPLOYEE
└── identidad CUSTOMER
```

Para una solicitud de VISO:

```text
domain_identity = EMPLOYEE
```

Para una solicitud de Vento Pass cliente:

```text
domain_identity = CUSTOMER
```

La coexistencia no es una contradicción.

La selección silenciosa sin dominio, aplicación o vía de acceso resoluble sí
será una contradicción.

---

#### 6. Fuente de verdad

La identidad deberá resolverse exclusivamente en servidor mediante relaciones
empresariales canónicas.

Fuentes conceptuales permitidas:

| Tipo       | Relación autoritativa                                             |
| ---------- | ----------------------------------------------------------------- |
| `EMPLOYEE` | vínculo único entre sujeto Auth o actor y registro laboral        |
| `CUSTOMER` | vínculo único entre sujeto Auth e identidad de cliente            |
| `DEVICE`   | vínculo único entre usuario técnico Auth y dispositivo compartido |
| `SYSTEM`   | registro interno estable del proceso o servicio empresarial       |

No serán fuente de verdad:

- `role` dentro de un JWT;
- `user_metadata` sin validación empresarial;
- correo, teléfono, documento o nombre enviados por el cliente;
- un `employee_id` suministrado en body o query;
- `public.users.role = client` tomado como identidad laboral;
- `employees.role` tomado como identidad;
- `navigation_role`;
- rol operativo;
- sede o área seleccionada;
- último turno;
- último check-in;
- último actor del dispositivo;
- nombre libre de servicio;
- uso de `service_role`;
- tablas históricas sin vigencia;
- coincidencias aproximadas por nombre;
- cookies no firmadas;
- valores de simulación.

---

#### 7. Vías canónicas de identidad

`AccessContext@1.0.0` reconocerá las siguientes vías conceptuales:

```text
LABOR_PERSONAL
CUSTOMER_PERSONAL
LABOR_SHARED_DEVICE
SYSTEM_AUTONOMOUS
SYSTEM_DELEGATED_EMPLOYEE
```

Estas vías no agregan un campo al contrato.

Son reglas normativas para construir combinaciones consistentes.

##### 7.1 `LABOR_PERSONAL`

```text
principal = HUMAN_USER
domain_identity = EMPLOYEE
actor_effective = EMPLOYEE
employee = presente
```

##### 7.2 `CUSTOMER_PERSONAL`

```text
principal = HUMAN_USER
domain_identity = CUSTOMER
actor_effective = CUSTOMER
employee = null
```

##### 7.3 `LABOR_SHARED_DEVICE`

```text
principal = SHARED_DEVICE
domain_identity = DEVICE
actor_effective = EMPLOYEE
employee = presente
device_context = presente
```

##### 7.4 `SYSTEM_AUTONOMOUS`

```text
principal = SYSTEM_SERVICE
domain_identity = SYSTEM
actor_effective = SYSTEM
employee = null
```

##### 7.5 `SYSTEM_DELEGATED_EMPLOYEE`

```text
principal = SYSTEM_SERVICE
domain_identity = SYSTEM
actor_effective = EMPLOYEE
employee = presente
delegation_id = presente
```

No se crearán combinaciones adicionales por conveniencia del frontend.

---

#### 8. `identity_type`

Valores congelados en `AccessContext@1.0.0`:

```text
EMPLOYEE
CUSTOMER
DEVICE
SYSTEM
```

`identity_type` identifica el namespace empresarial de `identity_id`.

No se utilizarán como tipos:

```text
HUMAN_USER
SHARED_DEVICE
SYSTEM_SERVICE
ANONYMOUS
propietario
gerente_general
cajero_satelite
bodeguero
cliente
administrador
proveedor
aplicación
sede
área
```

Los primeros pertenecen al principal.

Los códigos de rol pertenecen a autorización laboral.

Las sedes y áreas pertenecen al contexto.

---

#### 9. Identidad de dominio `EMPLOYEE`

Representa la identidad laboral de una persona dentro de Vento Group.

Contrato conceptual:

```text
principal humano válido
+
relación laboral única
+
dominio laboral solicitado
→ domain_identity EMPLOYEE
```

Reglas:

1. `identity_id` será el identificador canónico del empleado.
2. No será el correo, documento, teléfono ni `auth_user_id`.
3. No se derivará del rol base.
4. No se derivará del rol operativo.
5. No se derivará de una asignación de sede.
6. No se derivará de un turno.
7. La identidad puede ser conocida aunque esté inactiva.
8. Una identidad laboral inactiva conserva atribución y auditoría.
9. La inactividad bloquea las capacidades laborales.
10. Una identidad laboral inválida nunca produce carril disponible.
11. La identidad no concede acceso a Vento Pass cliente por sí sola.
12. La aplicación laboral deberá exigir una vía compatible.

Consistencia ordinaria:

```text
domain_identity.identity_type = EMPLOYEE
→ employee != null
→ employee.employee_id = domain_identity.identity_id
```

En sesión personal laboral:

```text
actor_effective.actor_type = EMPLOYEE
→ actor_effective.actor_id = employee.employee_id
```

---

#### 10. Identidad de dominio `CUSTOMER`

Representa la identidad comercial de una persona dentro del dominio de Vento
Pass.

Contrato conceptual:

```text
principal humano válido
+
identidad de cliente única
+
vía de cliente solicitada
→ domain_identity CUSTOMER
```

Reglas:

1. `identity_id` será el identificador canónico del cliente.
2. Un claim técnico `role = client` no sustituye la relación empresarial.
3. Una persona puede ser cliente y empleado simultáneamente.
4. La existencia de un empleado no cambia el contexto de cliente.
5. La identidad de cliente no concede acceso a aplicaciones laborales.
6. La identidad laboral no concede automáticamente beneficios de cliente.
7. La activación, bloqueo o baja del cliente afecta solo el dominio cliente.
8. Un cliente inactivo puede conservar atribución histórica.
9. Un cliente inválido no podrá producir autoridad de Pass.
10. `employee` será `null` en una vía puramente de cliente.
11. `actor_effective` deberá ser `CUSTOMER` con el mismo identificador.
12. La administración interna de Pass realizada por personal se resolverá como
    vía laboral, no como identidad de cliente.

Consistencia ordinaria:

```text
domain_identity.identity_type = CUSTOMER
→ actor_effective.actor_type = CUSTOMER
→ actor_effective.actor_id = domain_identity.identity_id
→ employee = null
```

---

#### 11. Identidad de dominio `DEVICE`

Representa una terminal física o lógica registrada como dispositivo
compartido de Vento.

Contrato conceptual:

```text
principal técnico válido
+
vínculo único con dispositivo empresarial
→ domain_identity DEVICE
```

Reglas:

1. `identity_id` será el identificador canónico del dispositivo.
2. No será el `auth_user_id` técnico.
3. El dispositivo no se modelará como empleado ficticio.
4. El dispositivo no recibe rol base.
5. El dispositivo no recibe rol operativo propio.
6. El dispositivo no se convierte en actor humano.
7. La identidad del dispositivo podrá estar activa aunque no exista actor.
8. Una acción empresarial humana requiere sesión de actor válida.
9. `actor_effective` podrá ser `UNRESOLVED` si no existe actor.
10. Cuando exista actor empleado, el nodo `employee` deberá corresponder a ese
    actor, no al dispositivo.
11. La activación del dispositivo no concede permisos al empleado.
12. El dispositivo impone restricciones adicionales; no amplía autoridad.
13. La semántica detallada de estado y sesión se completará en AUTH-CTX-014.
14. Las operaciones técnicas del dispositivo deberán tener contrato y actor
    definidos por su proceso; no se inferirán como permisos laborales.

Consistencia de una operación laboral:

```text
domain_identity.identity_type = DEVICE
→ principal.principal_type = SHARED_DEVICE
→ device_context != null
→ actor_effective.actor_type = EMPLOYEE
→ employee != null
```

Consistencia de dispositivo sin actor:

```text
domain_identity.identity_type = DEVICE
→ actor_effective.actor_type = UNRESOLVED
→ employee = null
```

En este último caso no se ejecutarán mutaciones empresariales humanas.

---

#### 12. Identidad de dominio `SYSTEM`

Representa un proceso, servicio o automatización interna registrada y
reconocible.

Contrato conceptual:

```text
principal de servicio válido
+
proceso empresarial registrado
→ domain_identity SYSTEM
```

Reglas:

1. `identity_id` será un identificador estable del proceso.
2. No será una API key, token, secreto ni `service_role`.
3. El nombre del job no será suficiente sin registro canónico.
4. La identidad técnica de Supabase no equivale a identidad empresarial.
5. Un proceso autónomo tendrá actor `SYSTEM`.
6. Un proceso delegado podrá tener actor `EMPLOYEE`.
7. La delegación no cambia `domain_identity`; permanece `SYSTEM`.
8. Una delegación no convierte al servicio en empleado.
9. Un proceso deshabilitado conserva identidad, pero no autoridad.
10. Un proceso desconocido produce identidad nula o inválida según exista un
    identificador empresarial resoluble.
11. Los reintentos deberán conservar la misma identidad de sistema.
12. La rotación de credenciales no deberá cambiar `identity_id`.
13. Un proceso no recibe permisos por usar infraestructura privilegiada.
14. Las capacidades de sistema deberán definirse explícitamente en tareas
    posteriores.

Consistencia de proceso autónomo:

```text
domain_identity.identity_type = SYSTEM
→ actor_effective.actor_type = SYSTEM
→ actor_effective.actor_id = domain_identity.identity_id
→ employee = null
```

Consistencia de proceso delegado:

```text
domain_identity.identity_type = SYSTEM
→ actor_effective.actor_type = EMPLOYEE
→ employee != null
→ actor_effective.delegation_id != null
```

---

#### 13. `identity_id`

`identity_id` identifica la entidad dentro del namespace indicado por
`identity_type`.

Regla:

```text
(identity_type, identity_id)
=
identidad empresarial inequívoca
```

No se interpretará `identity_id` sin `identity_type`.

Ejemplos conceptuales:

```text
(EMPLOYEE, employee_id)
(CUSTOMER, customer_id)
(DEVICE, device_id)
(SYSTEM, process_id)
```

`identity_id` no será:

- `auth_user_id` por convenio;
- código de rol;
- código de aplicación;
- código de permiso;
- código de sede;
- código de área;
- `session_id`;
- `delegation_id`;
- identificador de turno;
- identificador de check-in;
- valor simulado.

No se permitirá reutilizar un UUID idéntico en namespaces diferentes sin
considerar `identity_type`.

---

#### 14. `status`

Valores congelados:

```text
ACTIVE
INACTIVE
INVALID
```

El estado describe la vigencia empresarial de la identidad resuelta.

##### 14.1 `ACTIVE`

Significa:

```text
identidad existente
+
relación válida
+
registro habilitado para su dominio
+
invariantes mínimas satisfechas
```

No significa:

```text
permiso concedido
rol válido
turno activo
check-in activo
recurso autorizado
```

##### 14.2 `INACTIVE`

Significa:

```text
identidad conocida e inequívoca
+
registro deshabilitado, terminado o no habilitado
para ejercer autoridad en el dominio
```

La identidad se conserva para:

- atribución;
- auditoría;
- explicación;
- trazabilidad;
- tratamiento controlado de reactivación.

No se utilizará `INACTIVE` como fallback permisivo.

##### 14.3 `INVALID`

Significa que existe una identidad empresarial identificable, pero una
invariante obligatoria está rota.

Ejemplos:

- vínculo Auth incompatible;
- registro duplicado contradictorio ya reducido a un identificador exacto;
- tipo de identidad incompatible con la fuente;
- dispositivo vinculado a otro usuario técnico;
- proceso con registro inconsistente;
- empleado con relación corrupta.

`INVALID` nunca produce autoridad.

Cuando ni siquiera exista un `identity_id` inequívoco:

```text
domain_identity = null
```

No se fabricará un identificador para representar el error.

---

#### 15. `source`

`source` identifica la clase normativa de relación utilizada para resolver la
identidad.

Valores iniciales canónicos:

```text
EMPLOYEE_AUTH_LINK
CUSTOMER_AUTH_LINK
SHARED_DEVICE_AUTH_LINK
SYSTEM_PROCESS_REGISTRY
```

Matriz inicial:

| `identity_type` | `source` esperado         |
| --------------- | ------------------------- |
| `EMPLOYEE`      | `EMPLOYEE_AUTH_LINK`      |
| `CUSTOMER`      | `CUSTOMER_AUTH_LINK`      |
| `DEVICE`        | `SHARED_DEVICE_AUTH_LINK` |
| `SYSTEM`        | `SYSTEM_PROCESS_REGISTRY` |

`source`:

- no contiene nombres de tablas;
- no contiene SQL;
- no contiene secretos;
- no contiene rutas de repositorio;
- no contiene texto libre para UI;
- no contiene un UUID;
- no sustituye evidencia de auditoría;
- no determina permisos.

Una futura fuente adicional deberá analizar compatibilidad contractual.

Un valor desconocido no concederá autoridad.

---

#### 16. `domain_identity = null`

El nodo será `null` cuando no exista una identidad empresarial única y
verificable para la vía solicitada.

Casos:

- principal anónimo;
- principal inválido;
- usuario humano sin vínculo requerido;
- dominio solicitante no resoluble;
- dos empleados candidatos para la misma vía;
- dos clientes candidatos incompatibles;
- dispositivo técnico sin vínculo único;
- servicio sin proceso empresarial registrado;
- vía de acceso no declarada;
- identidad pedida incompatible con el principal;
- referencia aportada únicamente por el cliente;
- error de resolución que impide obtener un identificador exacto.

Regla:

```text
domain_identity = null
≠ identidad global
≠ identidad anónima con privilegios
≠ primer candidato
```

La ausencia deberá registrarse en `structural_issues` cuando la identidad sea
obligatoria.

---

#### 17. Principal humano con varias identidades

Una persona podrá tener simultáneamente:

```text
auth_user
+
employee
+
customer
```

Esta coexistencia es válida.

La selección dependerá de la vía de acceso resuelta en servidor.

No dependerá de:

- una opción enviada como verdad por el frontend;
- el último módulo abierto;
- el rol más privilegiado;
- la existencia de permisos;
- la sede seleccionada;
- el orden de consulta;
- el perfil creado primero;
- un claim técnico.

Ejemplo:

```text
solicitud a Pass cliente
→ CUSTOMER

solicitud a VISO
→ EMPLOYEE
```

Una ruta híbrida deberá declarar explícitamente qué identidad consume.

No se permitirá:

```text
CUSTOMER
→ fallback a EMPLOYEE
```

Ni:

```text
EMPLOYEE
→ fallback a CUSTOMER
```

---

#### 18. Selección por aplicación, proceso y vía de acceso

Cada consumidor deberá declarar uno o más perfiles de identidad aceptados.

Declaración conceptual:

```text
consumer
+
request_class
+
accepted_identity_route
```

La aplicación por sí sola puede no ser suficiente.

Ejemplo:

```text
NEXO en sesión personal
→ LABOR_PERSONAL

NEXO en terminal compartida
→ LABOR_SHARED_DEVICE

NEXO en job autónomo
→ SYSTEM_AUTONOMOUS

NEXO en job delegado
→ SYSTEM_DELEGATED_EMPLOYEE
```

Por tanto:

```text
app_code
≠ identidad suficiente
```

La clase de solicitud y el origen validado también participan.

La definición física de estos perfiles se reserva para E3, H y BLOQUE R.

---

#### 19. Perfiles iniciales por ecosistema

Clasificación documental inicial:

| Consumo               | Vía esperada                                      |
| --------------------- | ------------------------------------------------- |
| SHELL laboral         | `LABOR_PERSONAL` o `LABOR_SHARED_DEVICE`          |
| ANIMA                 | `LABOR_PERSONAL`                                  |
| VISO                  | `LABOR_PERSONAL`                                  |
| NEXO                  | laboral personal, dispositivo o sistema explícito |
| FOGO                  | laboral personal, dispositivo o sistema explícito |
| ORIGO                 | laboral personal, dispositivo o sistema explícito |
| PULSO                 | laboral personal, dispositivo o sistema explícito |
| NUMERA                | laboral personal o sistema explícito              |
| AURA laboral diferida | laboral personal cuando se confirme su alcance    |
| Vento Pass cliente    | `CUSTOMER_PERSONAL`                               |
| procesos internos     | `SYSTEM_AUTONOMOUS` o `SYSTEM_DELEGATED_EMPLOYEE` |

Esta tabla no concede acceso.

Solo define rutas de identidad admisibles para diseñar consumidores.

Cada permiso y recurso se evaluará después.

---

#### 20. Nodo `employee`

`employee` representa la identidad laboral mínima del empleado relevante para
el contexto.

Se incluirá cuando:

```text
domain_identity.identity_type = EMPLOYEE
```

O cuando:

```text
actor_effective.actor_type = EMPLOYEE
```

Por tanto, también estará presente en:

- dispositivo compartido con actor;
- proceso delegado a empleado.

No estará presente en:

- contexto puramente de cliente;
- proceso autónomo;
- dispositivo sin actor;
- actor no resuelto;
- principal anónimo;
- servicio sin delegación laboral.

El nodo no es una ficha completa del trabajador.

No contendrá por defecto:

- nombre;
- documento;
- teléfono;
- correo;
- dirección;
- salario;
- fecha de nacimiento;
- fotografía;
- historial;
- contratos;
- notas de recursos humanos.

---

#### 21. `employee_id`

`employee_id` identifica el registro laboral canónico.

Reglas:

1. Debe existir un único empleado resoluble.
2. Debe coincidir con `domain_identity.identity_id` cuando la identidad sea
   `EMPLOYEE`.
3. Debe coincidir con `actor_effective.actor_id` cuando el actor sea
   `EMPLOYEE`.
4. No se inferirá desde `auth.uid()` por igualdad accidental.
5. No se inferirá desde turnos.
6. No se inferirá desde permisos.
7. No se inferirá desde el dispositivo.
8. No se sustituirá por un código de nómina sin contrato.
9. No se sustituirá por documento de identidad.
10. No cambia cuando cambia el rol, sede o turno.

Consistencia:

```text
actor_effective.actor_type = EMPLOYEE
→ employee.employee_id = actor_effective.actor_id
```

---

#### 22. `employee.auth_user_id`

Este campo representa la vinculación técnica personal del empleado, cuando
exista.

Reglas:

1. En una sesión personal laboral válida deberá coincidir con
   `principal.auth_user_id`.
2. En un dispositivo compartido no deberá reemplazarse por el
   `auth_user_id` del dispositivo.
3. En una delegación de sistema no deberá reemplazarse por la identidad
   técnica del proceso.
4. Puede ser `null` si el empleado es atribuible mediante una sesión de actor
   o delegación válida y todavía no posee cuenta personal.
5. Un valor nulo no autoriza por sí mismo.
6. Dos empleados vinculados al mismo usuario personal producen inconsistencia.
7. Un empleado vinculado a un usuario diferente del principal humano produce
   inconsistencia.
8. El campo no es una credencial.
9. No contiene tokens ni información de sesión.
10. Su presencia no concede acceso.

Ejemplo de dispositivo:

```text
principal.auth_user_id = auth del kiosco
employee.auth_user_id  = auth personal del trabajador o null
```

Los dos valores no se fusionan.

---

#### 23. `is_active`

`is_active` expresa si la identidad laboral está habilitada actualmente para
participar en autorización laboral.

Regla:

```text
is_active = true
→ condición laboral necesaria
→ no suficiente para autorizar
```

```text
is_active = false
→ bloqueo estructural de capacidades laborales
```

La inactividad prevalece aunque existan:

- rol base;
- permisos;
- denegaciones;
- excepciones;
- sedes;
- áreas;
- turno;
- check-in;
- rol operativo;
- sesión de dispositivo;
- delegación;
- bypass legacy;
- datos en caché.

El empleado podrá permanecer identificado para auditoría.

No se eliminará el nodo para ocultar la inactividad.

---

#### 24. `employment_status`

`employment_status` expresa el estado laboral normalizado conocido al momento
de resolver el contexto.

No será texto de presentación.

Deberá ser:

- estable;
- determinista;
- auditable;
- independiente del idioma de UI;
- compatible con `is_active`;
- resuelto en servidor.

Esta tarea no congela el catálogo físico definitivo de estados laborales.

Como mínimo, la implementación futura deberá distinguir conceptualmente:

```text
activo
inactivo
terminado
suspendido
pendiente
desconocido o inválido
```

Reglas:

1. `is_active = true` no será compatible con un estado laboral terminal.
2. `is_active = false` no podrá reactivarse por rol o turno.
3. Un estado desconocido que sea obligatorio producirá problema estructural.
4. No se utilizará el nombre del rol como estado laboral.
5. No se utilizará la existencia de turnos como prueba de empleo activo.
6. La transición de estados deberá invalidar contextos previos.
7. El catálogo definitivo se gobernará en E3 y BLOQUE R.

---

#### 25. `base_role_code` dentro de `employee`

`base_role_code` conserva la referencia laboral observada en el registro del
empleado.

Esta tarea no determina todavía que el rol sea:

- existente;
- activo;
- válido;
- administrativo;
- compatible;
- autorizante.

Esa evaluación corresponde a AUTH-CTX-008.

Reglas:

1. Puede ser `null`.
2. Su presencia no activa el carril base.
3. No se usará como actor.
4. No se usará como identidad.
5. No se usará como rol operativo.
6. No se usará como permiso.
7. No se aplicará bypass por nombre.
8. Un empleado inactivo no se reactiva por conservar rol.
9. Un código legacy podrá registrarse, pero no considerarse válido sin la
   evaluación posterior.
10. `base_role` será el nodo normativo resuelto en AUTH-CTX-008.

Separación:

```text
employee.base_role_code
→ referencia observada

base_role
→ rol base evaluado y vigente
```

---

#### 26. Reglas de presencia de `employee`

Matriz obligatoria:

| `domain_identity` | `actor_effective` | `employee`  |
| ----------------- | ----------------- | ----------- |
| `EMPLOYEE`        | `EMPLOYEE`        | obligatorio |
| `DEVICE`          | `EMPLOYEE`        | obligatorio |
| `SYSTEM`          | `EMPLOYEE`        | obligatorio |
| `CUSTOMER`        | `CUSTOMER`        | `null`      |
| `SYSTEM`          | `SYSTEM`          | `null`      |
| `DEVICE`          | `UNRESOLVED`      | `null`      |
| `null`            | `UNRESOLVED`      | `null`      |

Combinaciones inválidas:

```text
actor EMPLOYEE + employee null
domain EMPLOYEE + employee null
actor CUSTOMER + employee presente
actor SYSTEM + employee presente sin delegación laboral
```

La presencia de un perfil laboral paralelo no autoriza a incluirlo en un
contexto puramente de cliente.

---

#### 27. Consistencia con `principal`

Matriz ordinaria:

| `principal_type` | `domain_identity.identity_type` permitido |
| ---------------- | ----------------------------------------- |
| `HUMAN_USER`     | `EMPLOYEE`, `CUSTOMER`                    |
| `SHARED_DEVICE`  | `DEVICE`                                  |
| `SYSTEM_SERVICE` | `SYSTEM`                                  |
| `ANONYMOUS`      | ninguna; `domain_identity = null`         |

Combinaciones diferentes deberán justificarse mediante una futura versión
contractual.

Ejemplos inválidos en v1:

```text
HUMAN_USER → DEVICE
HUMAN_USER → SYSTEM
SHARED_DEVICE → EMPLOYEE
SHARED_DEVICE → CUSTOMER
SYSTEM_SERVICE → EMPLOYEE
ANONYMOUS → CUSTOMER
```

Aclaración:

En un dispositivo, el actor puede ser empleado, pero la identidad de dominio
del principal sigue siendo `DEVICE`.

En un proceso delegado, el actor puede ser empleado, pero la identidad de
dominio del principal sigue siendo `SYSTEM`.

---

#### 28. Consistencia con `actor_effective`

Matriz permitida:

| `domain_identity` | `actor_effective` permitido        |
| ----------------- | ---------------------------------- |
| `EMPLOYEE`        | `EMPLOYEE`                         |
| `CUSTOMER`        | `CUSTOMER`                         |
| `DEVICE`          | `EMPLOYEE`, `UNRESOLVED`           |
| `SYSTEM`          | `SYSTEM`, `EMPLOYEE`, `UNRESOLVED` |
| `null`            | `UNRESOLVED`                       |

Reglas adicionales:

1. `EMPLOYEE` personal debe conservar el mismo identificador.
2. `CUSTOMER` debe conservar el mismo identificador.
3. `DEVICE` nunca usa `device_id` como `actor_id` empleado.
4. `SYSTEM` autónomo usa el identificador del proceso como actor.
5. `SYSTEM` delegado usa identificador de empleado y delegación.
6. Una delegación fallida no degrada a actor sistema.
7. Una sesión de dispositivo fallida no usa el último empleado.
8. La identidad no sustituye la atribución.

---

#### 29. Dispositivos compartidos

En una operación laboral desde dispositivo:

```text
principal
→ dispositivo técnico

domain_identity
→ DEVICE

device_context
→ dispositivo y sesión

actor_effective
→ EMPLOYEE

employee
→ trabajador exacto
```

Reglas:

1. La identidad `DEVICE` se resuelve antes de confiar en la sesión de actor.
2. Un dispositivo inactivo conserva identidad con estado `INACTIVE`.
3. Un vínculo técnico inconsistente produce estado `INVALID` o identidad nula.
4. La sesión de actor no cambia `domain_identity`.
5. La sesión de actor determina al actor y al nodo `employee`.
6. El PIN o QR no se almacena en el contexto.
7. El trabajador no hereda autoridad del dispositivo.
8. El dispositivo no hereda autoridad del trabajador.
9. El cierre de la sesión invalida contextos posteriores.
10. AUTH-CTX-014 definirá vigencia, política, estado y cardinalidad detallada.

---

#### 30. Procesos de sistema y delegación

En proceso autónomo:

```text
domain_identity = SYSTEM
actor_effective = SYSTEM
employee = null
```

En proceso delegado:

```text
domain_identity = SYSTEM
actor_effective = EMPLOYEE
employee = presente
delegation_id = presente
```

Reglas:

1. La identidad del proceso permanece estable.
2. La delegación no reemplaza la identidad del proceso.
3. El empleado delegado conserva su estado y denegaciones.
4. Un empleado inactivo no puede ejecutar mediante delegación.
5. El proceso no recibe rol humano.
6. La rotación de credenciales no cambia la identidad empresarial.
7. Un job ejecutado con privilegios elevados no se registra automáticamente
   como sistema autorizado.
8. La frontera asíncrona deberá conservar identidad, actor y modelo de
   delegación.
9. Los reintentos no seleccionarán otro empleado.
10. Las capacidades del proceso se diseñarán separadamente.

---

#### 31. Identidades inactivas e inválidas

La resolución deberá conservar la diferencia:

```text
INACTIVE
→ identidad conocida
→ autoridad bloqueada
→ auditoría posible
```

```text
INVALID
→ identidad identificable
→ relación estructural rota
→ autoridad bloqueada
```

```text
null
→ no existe identidad única resoluble
→ autoridad bloqueada
```

No se transformará:

```text
INACTIVE → null
```

solo para ocultar el estado.

Tampoco:

```text
INVALID → ACTIVE
```

mediante rol, permiso, turno, check-in o bypass.

La severidad y códigos definitivos se consolidarán en AUTH-CTX-015.

---

#### 32. Ausencia y onboarding

Un usuario humano autenticado puede no tener todavía la identidad requerida.

Casos:

```text
usuario sin employee
→ no puede acceder a Vento OS laboral
```

```text
usuario sin customer
→ puede requerir onboarding de Pass
```

La ausencia no será resuelta creando automáticamente:

- un empleado;
- un cliente;
- un rol;
- una sede;
- una identidad genérica;
- un actor sistema;
- una relación por correo aproximado.

El onboarding y creación de identidades son procesos empresariales separados.

`AccessContext` describe el estado actual.

No muta identidades durante la resolución.

---

#### 33. Simulación

`SimulationContext` podrá representar identidades hipotéticas, pero no
modificará `AccessContext` real.

Reglas:

1. El actor real conserva su identidad de dominio real.
2. El sujeto simulado se conserva separado.
3. Una identidad simulada `EMPLOYEE` no crea un `employee` real.
4. Una identidad simulada `CUSTOMER` no crea perfil de cliente.
5. Una identidad simulada `DEVICE` no activa terminal.
6. Una identidad simulada `SYSTEM` no registra proceso.
7. `WOULD_ALLOW` no se convierte en `ALLOW`.
8. Los datos reales visibles siguen limitados por la autoridad real.
9. La identidad simulada nunca sustituye al actor de auditoría.
10. No se reutilizan contratos reales como contenedores de simulación.

---

#### 34. Exposición segura

La proyección segura podrá incluir:

- tipo de identidad;
- estado;
- identificador opaco cuando sea necesario;
- estado laboral mínimo;
- indicador de actividad;
- código de rol observado cuando el consumidor autorizado lo requiera.

No incluirá por defecto:

- correo;
- teléfono;
- documento;
- dirección;
- salarios;
- tokens;
- secretos;
- metadata completa de Auth;
- historial laboral;
- historial de estados;
- notas internas;
- otras identidades de la misma persona;
- listas de permisos;
- información de otros empleados;
- credenciales del dispositivo;
- configuración privada del proceso.

La proyección de cliente podrá enmascarar identificadores.

La forma física se definirá en H y BLOQUE R.

---

#### 35. Auditoría

La resolución deberá permitir registrar de forma separada:

```text
principal_type
principal_auth_user_id
domain_identity_type
domain_identity_id
domain_identity_status
domain_identity_source
actor_type
actor_id
employee_id
employee_is_active
delegation_id
device_id
context_id
resolved_at
```

La auditoría no confundirá:

```text
principal_id
domain_identity_id
actor_id
employee_id
device_id
process_id
```

Se registrarán cambios de identidad relevantes mediante nuevos contextos.

No se registrarán:

- tokens;
- secretos;
- PIN;
- documentos personales innecesarios;
- payloads completos sin minimización.

La retención y persistencia se definirán en E3 y BLOQUE R.

---

#### 36. Resolución canónica

Secuencia conceptual:

```text
1. Validar `principal`.
2. Determinar consumidor y clase de solicitud.
3. Resolver vía de identidad aceptada.
4. Consultar relaciones empresariales canónicas.
5. Detectar ausencia, duplicidad o contradicción.
6. Seleccionar una identidad única.
7. Resolver `identity_type`.
8. Resolver `identity_id`.
9. Resolver `status`.
10. Resolver `source`.
11. Resolver `actor_effective` de forma consistente.
12. Resolver `employee` cuando corresponda.
13. Validar coincidencias entre identificadores.
14. Registrar problemas estructurales.
15. Emitir snapshot inmutable.
```

No se aplicarán fallbacks silenciosos.

El contrato SQL futuro se diseñará en AUTH-CTX-025.

---

#### 37. Casos canónicos

##### Caso A — Empleado activo en sesión personal

```text
principal = HUMAN_USER / VALID
domain_identity = EMPLOYEE / ACTIVE
actor = EMPLOYEE / PERSONAL_SESSION
employee.is_active = true
```

Resultado:

```text
identidad laboral disponible
rol y cobertura todavía pendientes de evaluación
```

##### Caso B — Empleado inactivo en sesión personal

```text
principal = HUMAN_USER / VALID
domain_identity = EMPLOYEE / INACTIVE
actor = EMPLOYEE / resolved
employee.is_active = false
```

Resultado:

```text
atribución conocida
autorización laboral bloqueada
```

##### Caso C — Humano cliente y empleado entrando a Pass

```text
principal = HUMAN_USER
relaciones = EMPLOYEE + CUSTOMER
vía = CUSTOMER_PERSONAL
domain_identity = CUSTOMER
actor = CUSTOMER
employee = null
```

Resultado:

```text
no se mezclan privilegios laborales
```

##### Caso D — Mismo humano entrando a VISO

```text
principal = HUMAN_USER
relaciones = EMPLOYEE + CUSTOMER
vía = LABOR_PERSONAL
domain_identity = EMPLOYEE
actor = EMPLOYEE
employee = presente
```

##### Caso E — Usuario autenticado sin empleado

```text
principal = HUMAN_USER / VALID
vía = LABOR_PERSONAL
domain_identity = null
actor = UNRESOLVED
employee = null
```

Resultado:

```text
acceso laboral denegado
```

##### Caso F — Dispositivo activo con actor activo

```text
principal = SHARED_DEVICE
domain_identity = DEVICE / ACTIVE
actor = EMPLOYEE
employee.is_active = true
device_context = presente
```

##### Caso G — Dispositivo activo sin sesión de actor

```text
principal = SHARED_DEVICE
domain_identity = DEVICE / ACTIVE
actor = UNRESOLVED
employee = null
```

Resultado:

```text
operaciones técnicas limitadas según contrato
mutaciones humanas denegadas
```

##### Caso H — Dispositivo inactivo con sesión residual

```text
principal = SHARED_DEVICE
domain_identity = DEVICE / INACTIVE
actor = UNRESOLVED
employee = null
```

La sesión residual no se utiliza.

##### Caso I — Proceso autónomo activo

```text
principal = SYSTEM_SERVICE
domain_identity = SYSTEM / ACTIVE
actor = SYSTEM
employee = null
```

##### Caso J — Proceso delegado a empleado activo

```text
principal = SYSTEM_SERVICE
domain_identity = SYSTEM / ACTIVE
actor = EMPLOYEE
employee.is_active = true
delegation_id = presente
```

##### Caso K — Proceso delegado a empleado inactivo

```text
domain_identity = SYSTEM / ACTIVE
actor = EMPLOYEE / resolved
employee.is_active = false
```

Resultado:

```text
atribución conservada
acción laboral denegada
```

##### Caso L — Dos empleados vinculados al mismo usuario

```text
principal = HUMAN_USER
vía = LABOR_PERSONAL
candidatos EMPLOYEE = 2
```

Resultado:

```text
domain_identity = null
actor = UNRESOLVED
employee = null
```

No se selecciona el primero.

##### Caso M — Cliente sin onboarding

```text
principal = HUMAN_USER
vía = CUSTOMER_PERSONAL
customer = ausente
```

Resultado:

```text
domain_identity = null
actor = UNRESOLVED
flujo de onboarding separado
```

##### Caso N — Claim `client` sin identidad empresarial

```text
JWT claim = client
customer record = ausente
```

Resultado:

```text
domain_identity = null
```

##### Caso O — `service_role` usado dentro de acción humana

```text
principal original = HUMAN_USER
domain_identity = EMPLOYEE
actor = EMPLOYEE
```

El cliente administrativo interno no cambia la identidad.

---

#### 38. Problemas estructurales relacionados

Códigos conceptuales candidatos:

```text
domain_identity_missing
domain_identity_ambiguous
domain_identity_invalid
domain_identity_inactive
domain_identity_type_mismatch
domain_identity_source_mismatch
identity_route_missing
identity_route_not_allowed
employee_missing
employee_ambiguous
employee_inactive
employee_status_invalid
employee_auth_link_mismatch
employee_actor_mismatch
employee_domain_mismatch
device_identity_missing
device_identity_invalid
system_identity_missing
system_identity_invalid
customer_identity_missing
customer_identity_invalid
```

Estos nombres no quedan congelados todavía.

AUTH-CTX-015 definirá:

- código definitivo;
- severidad;
- carril afectado;
- exposición;
- mensaje seguro;
- comportamiento de bloqueo.

Reglas ya vinculantes:

```text
identidad obligatoria ausente
→ no produce autoridad

empleado inactivo
→ bloquea capacidades laborales

identidad inválida
→ fail closed

ambigüedad
→ no seleccionar candidato
```

---

#### 39. Antipatrones prohibidos

Queda prohibido:

```ts
const employeeId = auth.uid();
const identity = user.role === "client" ? "CUSTOMER" : "EMPLOYEE";
const employee = employees[0];
const domainIdentity = employee ?? customer;
const active = Boolean(employee.role);
const actor = device.lastEmployeeId;
const system = usingServiceRole;
```

También:

```text
correo coincidente → vínculo laboral automático
documento coincidente → cliente convertido en empleado
employee.role → identidad laboral
rol operativo → identidad
sede primaria → identidad
turno activo → empleado activo
check-in → empleado válido
dispositivo activo → actor humano
service_role → identidad SYSTEM
identity_id null → organización
cliente también empleado → mezclar carriles
identidad inactiva → eliminar trazabilidad
primer candidato → identidad efectiva
última identidad usada → fallback
frontend elige identity_type → verdad autoritativa
```

---

#### 40. Compatibilidad con decisiones aprobadas

Esta tarea conserva:

- ADR-AUTH-001;
- AUTH-MOD-001 a AUTH-MOD-020;
- AUTH-CAT-001 a AUTH-CAT-024;
- AUTH-RBAC-001 a AUTH-RBAC-028;
- AUTH-CTX-001;
- AUTH-CTX-002;
- AUTH-CTX-003;
- AUTH-CTX-004;
- AUTH-CTX-005;
- AUTH-CTX-006.

En particular conserva:

```text
autenticación
≠ identidad

identidad
≠ actor

actor
≠ rol

rol
≠ permiso

empleado
≠ cliente

dispositivo
≠ empleado

servicio técnico
≠ autorización empresarial
```

No modifica ninguna matriz ni catálogo.

---

#### 41. Impacto contractual

La tarea:

- precisa semántica de campos existentes;
- define combinaciones válidas;
- define valores iniciales de `source`;
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

- más de una identidad simultánea;
- organización o tenant;
- proveedor externo;
- identidad de negocio adicional;
- identidad compuesta;
- nivel de confianza;
- historial de selección;
- identidad secundaria;
- persona canónica transversal;
- namespace separado como campo;

requerirá análisis de versionado según AUTH-CTX-004.

---

#### 42. Dependencias posteriores

##### AUTH-CTX-008

Definirá `base_role` y validará `employee.base_role_code` sin convertirlo en
identidad.

##### AUTH-CTX-009

Definirá cobertura administrativa del empleado activo.

##### AUTH-CTX-010 a AUTH-CTX-013

Definirán turno, check-in, rol y territorio operativo del actor empleado.

##### AUTH-CTX-014

Definirá `device_context`, identidad del dispositivo y sesión de actor.

##### AUTH-CTX-015

Congelará problemas estructurales y severidades.

##### AUTH-CTX-024

Definirá auditoría de la decisión final.

##### AUTH-CTX-025

Diseñará el contrato SQL que producirá estos nodos.

##### AUTH-CTX-026

Diseñará el evaluador que consumirá identidad y estado sin reinterpretarlos.

##### AUTH-CTX-027

Definirá consumidores y perfiles de identidad aceptados.

##### AUTH-CTX-028

Definirá compatibilidad con funciones legacy que confunden usuario, empleado,
cliente y rol.

##### AUTH-CTX-029

Definirá invalidación cuando cambien identidad o estado laboral.

##### AUTH-CTX-030

Definirá pruebas contractuales.

##### BLOQUE E3

Definirá fuentes físicas, unicidad, catálogos de estado, relaciones y
transición.

##### BLOQUE H

Materializará tipos, schemas y helpers compartidos.

##### BLOQUE R

Implementará migraciones, RPC, RLS, adaptadores y retiro de fallbacks legacy.

---

#### 43. Fuera del alcance

AUTH-CTX-007 no:

- redefine `principal`;
- redefine `actor_effective`;
- define rol base vigente;
- define permisos;
- define matrices;
- define cobertura administrativa;
- define turno;
- define check-in;
- define rol operativo;
- define sede o área operativa;
- define completamente el dispositivo;
- define capacidades técnicas de sistema;
- define onboarding;
- crea empleados;
- crea clientes;
- crea dispositivos;
- crea procesos;
- crea delegaciones;
- congela catálogo físico de estados laborales;
- congela códigos de problemas estructurales;
- define decisión final;
- agrega campos;
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
- migra consumidores;
- implementa código mediante Codex.

---

#### 44. Criterios de aprobación

AUTH-CTX-007 podrá aprobarse cuando se acepte que:

1. `domain_identity` identifica la entidad empresarial utilizada por la vía
   solicitada;
2. `employee` representa el snapshot laboral mínimo del trabajador relevante;
3. principal, identidad, actor, empleado y rol permanecen separados;
4. se conservan `EMPLOYEE`, `CUSTOMER`, `DEVICE` y `SYSTEM`;
5. se conservan `ACTIVE`, `INACTIVE` e `INVALID`;
6. no se agrega ningún campo;
7. existe como máximo una identidad de dominio por contexto;
8. varias identidades vinculadas no se fusionan;
9. la vía de acceso determina qué identidad se selecciona;
10. el frontend no determina la identidad autoritativa;
11. un mismo humano puede ser empleado y cliente;
12. Pass cliente usa `CUSTOMER`;
13. aplicaciones laborales personales usan `EMPLOYEE`;
14. dispositivo compartido usa identidad `DEVICE` y actor empleado;
15. proceso autónomo usa identidad y actor `SYSTEM`;
16. proceso delegado conserva identidad `SYSTEM` y actor empleado;
17. `identity_id` se interpreta junto con `identity_type`;
18. `identity_id` no es rol, permiso, sesión ni credencial;
19. `source` utiliza códigos normativos y no nombres físicos;
20. una identidad activa no equivale a autorización;
21. una identidad inactiva conserva atribución y bloquea autoridad;
22. una identidad inválida falla de forma cerrada;
23. cuando no existe identificador inequívoco, `domain_identity` es `null`;
24. no se selecciona silenciosamente el primer candidato;
25. `employee` es obligatorio cuando dominio o actor es empleado;
26. `employee` es nulo en una vía puramente de cliente;
27. `employee.employee_id` coincide con actor empleado;
28. `employee.auth_user_id` no se reemplaza por el usuario del dispositivo o
    servicio;
29. un empleado puede ser atribuible sin cuenta personal en una sesión de
    actor o delegación válida;
30. `is_active = false` bloquea todas las capacidades laborales;
31. el rol, turno, check-in o permiso no reactivan empleados;
32. `employment_status` es normalizado y compatible con `is_active`;
33. `employee.base_role_code` es referencia observada, no rol validado;
34. AUTH-CTX-008 resolverá el rol base vigente;
35. un claim `client` no crea identidad de cliente;
36. `service_role` no crea identidad `SYSTEM`;
37. el dispositivo no se convierte en empleado ficticio;
38. la simulación no crea identidades reales;
39. la exposición segura minimiza datos personales;
40. los códigos finales de invalidez se reservan para AUTH-CTX-015;
41. la tarea no cambia `contract_version` ni `schema_version`;
42. no se implementa código, migraciones ni cambios en Supabase.

---

#### 45. Estado final de la propuesta

| Tarea        | Estado      |
| ------------ | ----------- |
| AUTH-CTX-006 | APROBADA    |
| AUTH-CTX-007 | APROBADA    |
| AUTH-CTX-008 | NO INICIADA |

No se avanza a AUTH-CTX-008 hasta recibir aprobación explícita de
AUTH-CTX-007.


