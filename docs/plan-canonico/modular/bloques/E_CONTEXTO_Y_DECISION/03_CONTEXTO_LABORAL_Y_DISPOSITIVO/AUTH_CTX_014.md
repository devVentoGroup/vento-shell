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


