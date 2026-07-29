### SECCIÓN — IDENTIDAD Y ROLES

<!-- PLAN-SECTION-META:START -->
Esta sección reúne contenido canónico con una responsabilidad documental única dentro del plan. Debe conservarse cohesionada y actualizarse junto con sus referencias y validaciones dependientes.

**Cobertura canónica:** `AUTH-MOD-001` a `AUTH-MOD-006` — 6 tareas.
<!-- PLAN-SECTION-META:END -->

### ✅ AUTH-MOD-001 — Definir identidad laboral del usuario

#### AUTH-MOD-001 — Identidades reconocidas y fuentes de verdad

##### Estado

✅ APROBADO

✅ No se modificó código.
✅ No se creó ninguna migración.
✅ No se aplicaron cambios en Supabase.
✅ Se utilizó `AUTH-AUD-020` como diagnóstico de entrada.

---

#### 1. Decisión aprobada

Vento OS reconocerá tres clases de **principal autenticado**:

```
PRINCIPAL AUTENTICADO
├── Persona
├── Dispositivo técnico
└── Servicio del sistema
```

A partir del principal autenticado se resolverá, cuando corresponda, un **actor efectivo**:

```
Usuario humano autenticado
        ↓
Empleado activo
        ↓
Actor efectivo: empleado

Dispositivo técnico autenticado
        ↓
Sesión activa de actor
        ↓
Empleado activo
        ↓
Actor efectivo: empleado

Service role
        ↓
Proceso autorizado
        ↓
Actor efectivo: sistema
o empleado delegado explícitamente
```

##### Regla canónica

> **La autenticación determina quién presenta la credencial.
> La identidad de dominio determina qué entidad representa.
> El actor efectivo determina a quién se atribuye la acción.
> Los permisos determinan si la acción está autorizada.**

Ningún rol, sede, turno, perfil, elemento de navegación o identidad simulada podrá sustituir estas etapas.

---

#### 2. Identidades reconocidas

##### 2.1 Usuario autenticado

| Elemento         | Decisión                                                        |
| ---------------- | --------------------------------------------------------------- |
| Concepto         | Principal que presentó una credencial válida ante Supabase Auth |
| Fuente de verdad | `auth.users` y el `sub` del JWT validado por Supabase           |
| Demuestra        | Que existe una sesión autenticada                               |
| No demuestra     | Que sea empleado, cliente, administrador o actor autorizado     |
| Ausencia         | Se considera usuario anónimo                                    |
| Denegación       | Toda aplicación privada y toda acción interna se deniegan       |
| Bypass           | Ninguno                                                         |

###### Contrato

```
auth.uid()
≠ empleado
≠ cliente
≠ rol
≠ permiso
```

Un usuario autenticado solo adquiere una identidad funcional cuando existe una relación válida con una identidad de dominio.

---

##### 2.2 Empleado

| Elemento         | Decisión                                                      |
| ---------------- | ------------------------------------------------------------- |
| Concepto         | Identidad laboral permanente de una persona dentro de Vento   |
| Fuente de verdad | `public.employees`, vinculado de forma única con `auth.users` |
| Estado requerido | `employees.is_active = true`                                  |
| Actor efectivo   | El propio empleado en sesiones personales                     |
| Ausencia         | El usuario autenticado no tiene identidad laboral             |
| Denegación       | No puede ingresar a Vento OS ni ejecutar acciones laborales   |
| Bypass           | Ninguno, ni siquiera por rol almacenado en otra tabla         |

###### Regla

```
Usuario autenticado
+ empleado existente
+ empleado activo
= identidad laboral válida
```

```
Usuario autenticado
+ empleado inexistente
= no es trabajador de Vento OS
```

```
Usuario autenticado
+ empleado inactivo
= denegación laboral total
```

Las asignaciones históricas de sedes, permisos, turnos o roles no podrán reactivar implícitamente a un empleado inactivo.

Esto corrige el riesgo detectado de empleados inactivos que conservan sedes y permisos activos.

---

##### 2.3 Cliente de Vento Pass

| Elemento              | Decisión                                                      |
| --------------------- | ------------------------------------------------------------- |
| Concepto              | Identidad comercial de una persona como cliente               |
| Fuente de verdad      | `public.users`, dentro del dominio de Vento Pass              |
| Relación con empleado | Independiente; una persona puede ser cliente y empleado       |
| Acceso laboral        | Ninguno                                                       |
| Ausencia              | Puede requerir onboarding en Pass                             |
| Denegación            | Un cliente sin identidad laboral no puede ingresar a Vento OS |
| Bypass                | Ninguno                                                       |

###### Regla

`public.users.role = client`

no será interpretado como:

`employees.role`

Un mismo `auth_user_id` podrá estar asociado simultáneamente con:

```
Empleado de Vento
+
Cliente de Vento Pass
```

La aplicación solicitante determinará qué identidad de dominio necesita:

| Aplicación                                    | Identidad aceptada        |
| --------------------------------------------- | ------------------------- |
| Vento Pass cliente                            | Cliente                   |
| VISO, NEXO, FOGO, ORIGO, PULSO, NUMERA, ANIMA | Empleado o actor empleado |
| Procesos internos                             | Servicio autorizado       |

La auditoría confirmó que `public.users.role = client` y `employees.role` son sistemas distintos y deben permanecer separados.

---

##### 2.4 Usuario técnico de dispositivo

| Elemento               | Decisión                                                                            |
| ---------------------- | ----------------------------------------------------------------------------------- |
| Concepto               | Credencial técnica que identifica una terminal física                               |
| Fuente de verdad       | `auth.users` vinculado de forma única con `shared_operational_devices.auth_user_id` |
| Identidad humana       | Ninguna                                                                             |
| Rol base               | Ninguno                                                                             |
| Rol operativo          | Ninguno propio                                                                      |
| Permisos empresariales | Ninguno directamente                                                                |
| Estado requerido       | Usuario Auth válido, dispositivo activo y activación vigente                        |
| Bypass                 | Solo operaciones técnicas expresamente autorizadas                                  |

###### Regla

Un dispositivo técnico **no se modelará como empleado ficticio**.

```
❌ Tablet Bodega
   → employees
   → role = bodeguero
   → permisos laborales
```

Modelo canónico:

```
✅ KIOSCO_BODEGA_CP
   → shared_operational_devices
   → auth_user_id técnico
   → sin identidad laboral
```

El dispositivo técnico podrá realizar exclusivamente operaciones como:

* obtener su configuración;
* registrar presencia o heartbeat;
* iniciar o renovar una sesión de actor;
* cerrar una sesión de actor;
* consultar aplicaciones habilitadas;
* registrar eventos técnicos.

No podrá preparar inventario, recibir mercancía, crear ventas ni ejecutar otra operación empresarial sin un actor humano activo.

El informe encontró una identidad heredada denominada “Tablet Bodega” modelada como empleado inactivo con rol y permisos, mientras ya existe infraestructura específica para dispositivos compartidos. También confirmó que los dispositivos actuales todavía no tienen sesiones de actor persistidas.

---

##### 2.5 Actor de dispositivo compartido

| Elemento              | Decisión                                                        |
| --------------------- | --------------------------------------------------------------- |
| Concepto              | Empleado real que utiliza temporalmente un dispositivo técnico  |
| Fuente de verdad      | Sesión activa en `shared_operational_device_actor_sessions`     |
| Principal autenticado | Usuario técnico del dispositivo                                 |
| Actor efectivo        | Empleado identificado mediante la sesión                        |
| Estado requerido      | Dispositivo activo, empleado activo y sesión vigente            |
| Ausencia              | El dispositivo queda en modo técnico sin acciones empresariales |
| Bypass                | Ninguno                                                         |

###### Resolución

```
auth.uid()
    ↓
shared_operational_devices.auth_user_id
    ↓
dispositivo activo
    ↓
actor_session activa y no expirada
    ↓
employee_id activo
    ↓
actor efectivo
```

La sesión deberá conservar como mínimo:

```
device_id
employee_id
shift_id
site_id
area_id
operational_role
started_at
expires_at
ended_at
```

###### Atribución obligatoria

Toda acción originada desde un dispositivo compartido deberá registrar simultáneamente:

```
Principal autenticado: dispositivo
Actor efectivo: empleado
Contexto: turno, sede, área y rol operativo
```

El campo `navigation_role` del dispositivo o plantilla será únicamente una preferencia de navegación o presentación.

```
navigation_role
≠ actor
≠ rol efectivo
≠ permiso
```

La auditoría identificó dos dispositivos activos, cero sesiones de actor y mezcla de roles base y operativos dentro de `navigation_role`.

---

#### 3. Conceptos que no son identidades

##### 3.1 Rol base

| Elemento         | Decisión                                                          |
| ---------------- | ----------------------------------------------------------------- |
| Es identidad     | No                                                                |
| Fuente de verdad | `employees.role → public.roles.code`                              |
| Propósito        | Plantilla permanente de permisos administrativos o laborales base |
| Cardinalidad     | Exactamente uno por empleado activo                               |
| Ausencia         | Identidad laboral incompleta; no se heredan permisos de rol       |
| Bypass           | Ninguno por nombre de rol                                         |

###### Regla

```
Empleado
tiene un rol base
```

No:

```
Rol base
es el empleado
```

No se permitirá resolver identidad mediante comparaciones como:

```
role === 'propietario'
role === 'gerente_general'
```

Los bypass por nombre de rol deberán eliminarse o convertirse posteriormente en permisos explícitos.

El informe clasificó como riesgo alto que el catálogo base mezcle cargos administrativos con oficios operativos y confirmó decisiones hardcodeadas por rol.

La composición definitiva del catálogo se resolverá en `AUTH-MOD-002` a `AUTH-MOD-006`.

---

##### 3.2 Rol operativo

| Elemento                          | Decisión                                       |
| --------------------------------- | ---------------------------------------------- |
| Es identidad                      | No                                             |
| Fuente activa                     | Turno operativo válido                         |
| Catálogo                          | `public.operational_roles`                     |
| Validación territorial            | `site_operational_roles`                       |
| Propósito                         | Función temporal ejecutada durante una jornada |
| Ausencia                          | No existen permisos operativos                 |
| Fallback al rol base              | Prohibido                                      |
| Fallback al perfil predeterminado | Prohibido para autorizar                       |

###### Regla

```
Turno activo
    ↓
operational_role
    ↓
rol operativo efectivo
```

El perfil operativo del empleado podrá proponer valores al crear el turno, pero no será evidencia suficiente de que el trabajador está ejecutando ese rol en este momento.

```
default_operational_role
→ valor predeterminado de planificación

active_shift.operational_role
→ rol operativo efectivo
```

En ausencia de turno válido:

`active_operational_role = null`

No se utilizará:

* `employees.role`;
* `navigation_role`;
* el último turno;
* el perfil predeterminado;
* una selección del frontend;

como reemplazo automático.

La auditoría comprobó que el modelo operativo todavía convive con roles base heredados y que varios roles operativos no tienen permisos propios.

---

##### 3.3 Identidad simulada

| Elemento                      | Decisión                               |
| ----------------------------- | -------------------------------------- |
| Es identidad real             | No                                     |
| Fuente de verdad              | `context_simulation_sessions`          |
| Actor real                    | Administrador que inició la simulación |
| Sujeto simulado               | Contexto hipotético consultado         |
| Puede autorizar mutaciones    | No                                     |
| Puede modificar RLS           | No                                     |
| Puede reemplazar `auth.uid()` | No                                     |
| Bypass                        | Ninguno                                |

###### Regla

La simulación será una operación separada de la autorización real:

`evaluate_real_authorization()`

y:

`evaluate_simulated_authorization()`

no podrán compartir implícitamente el mismo estado.

La simulación podrá afectar:

* representación de navegación;
* visualización de pantallas;
* explicación de permisos;
* cálculo hipotético de decisiones.

No podrá afectar:

* RLS;
* RPC de mutación;
* Server Actions;
* acciones de inventario;
* compras;
* producción;
* ventas;
* asistencia;
* permisos reales del administrador.

Toda simulación conservará:

```
real_actor_id
simulated_employee_id
simulated_role_base
simulated_operational_role
simulated_site_id
simulated_area_id
started_at
expires_at
```

La infraestructura de simulación existe actualmente, pero no registra sesiones ni tiene integración uniforme.

El ciclo de vida específico se definirá en `AUTH-MOD-012`.

---

#### 4. Service role

##### 4.1 Definición

| Elemento                            | Decisión                                                                        |
| ----------------------------------- | ------------------------------------------------------------------------------- |
| Concepto                            | Credencial técnica privilegiada de Supabase                                     |
| Es empleado                         | No                                                                              |
| Es cliente                          | No                                                                              |
| Tiene rol base                      | No                                                                              |
| Tiene rol operativo                 | No                                                                              |
| Fuente de verdad                    | JWT válido con rol técnico `service_role`, mantenido exclusivamente en servidor |
| Efecto técnico                      | Puede omitir RLS                                                                |
| Autorización empresarial automática | Ninguna                                                                         |

###### Regla crítica

```
service_role
= capacidad técnica privilegiada
≠ autorización empresarial
```

El hecho de utilizar `createAdminClient()` no significará que la operación está autorizada.

##### 4.2 Modos permitidos

###### A. Acción iniciada por un humano

```
Usuario autenticado
    ↓
empleado activo
    ↓
permiso exacto validado
    ↓
contexto territorial validado
    ↓
operación privilegiada con service role
```

La acción deberá registrar al empleado como actor efectivo.

###### B. Proceso autónomo del sistema

```
Proceso identificado
    ↓
operación incluida en allowlist
    ↓
actor_kind = system
    ↓
service_name / job_name registrado
```

Ejemplos posibles:

* migraciones;
* reconciliaciones programadas;
* triggers;
* mantenimiento interno;
* sincronizaciones confiables;
* jobs de cierre.

##### 4.3 Comportamiento de denegación

Una operación empresarial ejecutada con service role se denegará cuando no exista:

* actor humano autorizado; o
* proceso de sistema identificado y permitido.

No se permitirá:

```
Frontend oculta botón
    ↓
Server Action usa service role
    ↓
operación autorizada implícitamente
```

`AUTH-AUD-020` clasificó como riesgos críticos el uso de cliente administrativo después de guards insuficientes y RPC `SECURITY DEFINER` con permisos demasiado amplios.

---

#### 5. Estados activo e inactivo

##### 5.1 Principio de actividad acumulativa

Una identidad será válida únicamente si todas las capas necesarias están activas.

###### Empleado en sesión personal

```
Auth válido
AND empleado existente
AND empleado activo
= identidad laboral activa
```

###### Actor en dispositivo compartido

```
Auth del dispositivo válido
AND dispositivo activo
AND actor_session activa
AND empleado activo
= actor efectivo activo
```

###### Cliente de Pass

```
Auth válido
AND perfil de cliente existente
AND perfil habilitado
= identidad de cliente activa
```

###### Servicio

```
Credencial válida
AND ejecución en servidor confiable
AND operación permitida
= principal técnico válido
```

##### 5.2 Precedencia del estado

Una condición inactiva tendrá precedencia sobre cualquier asignación positiva:

```
identidad inactiva
    >
rol
    >
permiso individual
    >
sede asignada
    >
turno
    >
sesión de actor
```

Por tanto:

```
Empleado inactivo + permiso = DENEGAR
Empleado inactivo + turno = DENEGAR
Empleado inactivo + rol propietario = DENEGAR
Dispositivo inactivo + actor activo = DENEGAR
Sesión expirada + empleado activo = DENEGAR
```

##### 5.3 Ausencia de datos

| Dato ausente                       | Resultado                                |
| ---------------------------------- | ---------------------------------------- |
| Sesión Auth                        | Anónimo                                  |
| Empleado                           | No existe identidad laboral              |
| Estado del empleado                | Denegar                                  |
| Rol base                           | No heredar permisos base                 |
| Turno activo                       | Sin rol ni permisos operativos           |
| Actor session                      | Dispositivo sin actor empresarial        |
| Cliente Pass                       | Solicitar onboarding o denegar operación |
| Identidad simulada                 | Operación real sin simulación            |
| Actor de una mutación service role | Denegar salvo proceso autónomo permitido |

La regla general será:

```
Dato obligatorio ausente
→ DENEGAR
```

No se aplicarán fallbacks que amplíen privilegios.

---

#### 6. Precedencia canónica de identidad

##### 6.1 Aplicaciones laborales en sesión personal

```
### 1. Validar JWT

### 2. Resolver auth user

### 3. Resolver employee vinculado

### 4. Verificar employee activo

### 5. Establecer employee como actor efectivo

### 6. Continuar hacia contexto y autorización

```

##### 6.2 Dispositivo compartido

```
### 1. Validar JWT

### 2. Resolver shared device

### 3. Verificar dispositivo activo

### 4. Resolver actor_session vigente

### 5. Resolver employee de la sesión

### 6. Verificar employee activo

### 7. Establecer employee como actor efectivo

### 8. Continuar hacia turno, contexto y autorización

```

##### 6.3 Vento Pass

```
### 1. Validar JWT

### 2. Resolver perfil de cliente

### 3. Verificar estado del cliente

### 4. Establecer identidad de cliente

### 5. Aplicar autorización del dominio Pass

```

##### 6.4 Service role

```
### 1. Validar ejecución confiable

### 2. Identificar proceso o actor delegado

### 3. Verificar operación permitida

### 4. Establecer actor efectivo

### 5. Ejecutar y auditar

```

##### 6.5 Simulación

```
Actor real permanece igual
+
contexto hipotético separado
=
resultado de simulación
```

La identidad simulada nunca tendrá precedencia sobre el actor real.

---

#### 7. Contrato resultante

##### 7.1 Contrato conceptual de identidad

```
IdentityContext
├── auth_subject_id
├── principal_kind
│   ├── human_user
│   ├── shared_device
│   └── service
├── employee_id
├── customer_id
├── device_id
├── effective_actor_kind
│   ├── employee
│   ├── system
│   └── none
├── effective_actor_id
├── actor_session_id
├── simulation_session_id
├── identity_state
│   ├── active
│   ├── inactive
│   ├── incomplete
│   └── anonymous
└── denial_reason
```

##### 7.2 Invariantes

1. Todo principal autenticado tiene un único `principal_kind`.
2. Una persona puede tener perfil de empleado y perfil de cliente.
3. Una aplicación debe declarar qué identidad de dominio acepta.
4. Un dispositivo técnico no puede adquirir un rol laboral propio.
5. Una acción empresarial desde dispositivo requiere actor humano activo.
6. Un rol base no identifica a una persona.
7. Un rol operativo no identifica a una persona.
8. Una simulación no reemplaza al actor real.
9. Service role no concede permisos empresariales automáticamente.
10. Ninguna identidad inactiva puede recuperar acceso mediante permisos residuales.
11. Toda mutación debe tener un actor efectivo verificable.
12. Toda autorización debe denegar ante identidad incompleta.

---

#### 8. Comportamiento de denegación

La resolución de identidad devolverá motivos explícitos y estables:

```
unauthenticated
unsupported_principal
employee_not_found
employee_inactive
customer_not_found
customer_inactive
device_not_found
device_inactive
device_actor_required
actor_session_expired
actor_employee_inactive
service_actor_missing
simulation_not_allowed
identity_incomplete
```

Estos códigos serán contratos compartidos de `vento-shell`.

La interfaz podrá traducirlos en mensajes humanos, pero no inventará ni reinterpretará la decisión.

---

#### 9. Bypass permitidos

| Caso                               | Permitido | Alcance                                     |
| ---------------------------------- | --------: | ------------------------------------------- |
| Propietario por nombre de rol      |         ❌ | Ninguno                                     |
| Gerente general por nombre de rol  |         ❌ | Ninguno                                     |
| Usuario técnico sin actor          |         🟡 | Solo configuración y sesión del dispositivo |
| Identidad simulada                 |         ❌ | Nunca para autorización real                |
| Service role en migraciones        |         ✅ | Operación técnica controlada                |
| Service role en job identificado   |         ✅ | Allowlist del proceso                       |
| Service role actuando por empleado |         ✅ | Solo después de permiso exacto              |
| Empleado inactivo                  |         ❌ | Ninguno                                     |
| Cliente Pass hacia Vento OS        |         ❌ | Ninguno                                     |

---

#### 10. Impacto esperado

##### Guards

Los guards deberán resolver primero:

```
principal
→ identidad de dominio
→ actor efectivo
```

No podrán autorizar directamente mediante:

```
JWT role
employees.role
navigation_role
nombre del cargo
elemento visible de navegación
```

##### RPC

* Las RPC personales derivarán el empleado desde el actor efectivo.
* No aceptarán libremente un `employee_id` para reemplazar al actor.
* Consultar o simular otro empleado requerirá una RPC administrativa separada.
* Toda RPC rechazará empleados y dispositivos inactivos.
* Toda RPC privilegiada conservará el actor real.

Esto responde al hallazgo de que `get_operational_context` permite suministrar otro `employee_id` y no verifica uniformemente que el trabajador esté activo.

##### RLS

Las políticas distinguirán:

```
auth subject
effective actor
resource owner
territorial scope
```

No dependerán de claims de rol como fuente laboral.

El usuario técnico del dispositivo podrá acceder a su configuración y sesiones, pero no se convertirá automáticamente en propietario de los registros empresariales creados por el trabajador.

##### Aplicaciones

| Aplicación              | Identidad principal                    |
| ----------------------- | -------------------------------------- |
| Shell                   | Empleado activo                        |
| ANIMA                   | Empleado activo                        |
| VISO                    | Empleado activo                        |
| NEXO                    | Empleado activo o actor de dispositivo |
| FOGO                    | Empleado activo o actor de dispositivo |
| ORIGO                   | Empleado activo o actor de dispositivo |
| PULSO                   | Empleado activo o actor de dispositivo |
| NUMERA                  | Empleado activo                        |
| Vento Pass cliente      | Cliente activo                         |
| Jobs y automatizaciones | Actor de sistema                       |

##### Navegación

La navegación consumirá la decisión de autorización para presentar opciones.

```
Autorización
    ↓
Navegación visible
```

Nunca:

```
Navegación visible
    ↓
Autorización asumida
```

##### Presentación

La interfaz podrá mostrar:

* nombre del empleado;
* rol base;
* turno;
* rol operativo;
* sede;
* área;
* modo dispositivo;
* modo simulación.

Pero estos valores visuales no constituirán evidencia suficiente para autorizar una operación.

---

#### 11. Alternativas descartadas

##### A. Usar una sola tabla `public.users` para todos

❌ Descartada.

Mezclaría:

* clientes;
* empleados;
* dispositivos;
* servicios.

También convertiría el campo `role` en un concepto ambiguo y obligaría a una migración destructiva innecesaria.

##### B. Guardar el rol laboral en claims de Auth

❌ Descartada.

Los claims pueden quedar desactualizados y no representan correctamente:

* activación laboral;
* múltiples sedes;
* turnos;
* sesiones de dispositivo;
* cambios inmediatos de permisos.

Supabase Auth seguirá siendo fuente de autenticación, no de identidad laboral.

##### C. Considerar el rol como identidad

❌ Descartada.

Varias personas comparten el mismo rol y una persona puede cambiar de función operativa durante distintos turnos.

##### D. Modelar tablets como empleados

❌ Descartada.

Produce permisos sin actor humano, contamina asistencia y dificulta la auditoría.

##### E. Permitir que el dispositivo use `navigation_role`

❌ Descartada.

La navegación no puede otorgar autorización empresarial.

##### F. Simular mediante impersonación real

❌ Descartada.

Cambiar `auth.uid()`, utilizar service role o alterar RLS para simular permitiría que una función de preview ejecutara acciones reales.

##### G. Tratar service role como superadministrador humano

❌ Descartada.

Service role es una credencial técnica y no debe aparecer como propietario, gerente ni empleado.

---

#### 12. Riesgos de la decisión

⚠️ **Compatibilidad heredada**

Varias aplicaciones todavía asumen que `employees.role` también representa un oficio operativo.

⚠️ **Dispositivo heredado**

La identidad “Tablet Bodega” deberá migrarse posteriormente sin interrumpir el kiosco.

⚠️ **Sesiones de actor no probadas**

La tabla existe, pero actualmente tiene cero sesiones persistidas.

⚠️ **Doble identidad empleado-cliente**

Cada aplicación deberá declarar explícitamente su audiencia para evitar que un perfil de cliente sea aceptado por una aplicación laboral.

⚠️ **Service role existente**

Hay superficies actuales donde se utiliza un cliente administrativo después de una validación insuficiente. No puede asumirse que el contrato ya se cumple.

⚠️ **Vinculación Auth–empleado**

Durante implementación deberá comprobarse si la relación física actual utiliza el mismo UUID o necesita una columna explícita `auth_user_id`. La decisión lógica no depende de esa elección física.

---

#### 13. Asuntos pendientes

Estos puntos no se resuelven dentro de `AUTH-MOD-001`:

| Pendiente                               | Tarea                           |
| --------------------------------------- | ------------------------------- |
| Catálogo definitivo de roles base       | AUTH-MOD-002 a AUTH-MOD-006     |
| Sede asignada y sede activa             | AUTH-MOD-007                    |
| Área asignada y área activa             | AUTH-MOD-008                    |
| Definición exacta de turno activo       | AUTH-MOD-009                    |
| Definición exacta de check-in activo    | AUTH-MOD-010                    |
| Ciclo de sesión en dispositivo          | AUTH-MOD-011                    |
| Ciclo y alcance de simulación           | AUTH-MOD-012                    |
| Precedencia de permisos                 | AUTH-MOD-018                    |
| Denegaciones explícitas                 | AUTH-MOD-019                    |
| Tablas, funciones y migraciones físicas | Fase de implementación aprobada |

---

#### 14. Decisión resumida

```
IDENTIDAD

auth.users
    ↓
principal autenticado
    ↓
employees / public.users / shared device / service
    ↓
actor efectivo

CONTEXTO

actor efectivo
    ↓
turno
    ↓
rol operativo
    ↓
sede
    ↓
área

AUTORIZACIÓN

actor + contexto
    ↓
permiso requerido
    ↓
alcance
    ↓
decisión final

PRESENTACIÓN

decisión final
    ↓
navegación y componentes visibles
```

##### Criterio de aprobación de AUTH-MOD-001

La tarea puede marcarse como aprobada cuando se acepte que:

1. `auth.users` autentica, pero no define identidad laboral.
2. `employees` es la fuente de verdad de identidad laboral.
3. `public.users` representa exclusivamente la identidad de cliente.
4. Los dispositivos tienen identidad técnica, no laboral.
5. El trabajador real es el actor de las acciones en dispositivos compartidos.
6. Rol base y rol operativo no son identidades.
7. La simulación nunca concede autorización real.
8. Service role no equivale a autorización empresarial.
9. Una identidad inactiva produce denegación inmediata.
10. Toda acción empresarial tiene un actor efectivo verificable.
APROBADO

### ✅ AUTH-MOD-002 — Separar rol base de rol operativo

#### 1. Problema que se resuelve

El modelo actual mezcla dos conceptos:

public.roles
├── roles administrativos
└── oficios operativos heredados

Actualmente existen como roles base:

propietario
gerente_general
gerente
auxiliar_administrativa
contador
marketing

barista
bodeguero
cajero
cocinero
conductor
mesero
panadero
pastelero
repostero

Los últimos nueve representan principalmente funciones ejecutadas durante la operación, pero todavía conceden permisos permanentes mediante role_permissions. Además, bodeguero existe simultáneamente en ambos catálogos.

Esto permite situaciones incorrectas:

employees.role = cocinero
        ↓
permisos permanentes de producción
        ↓
sin turno
sin check-in
sin área activa

La auditoría también confirmó que los oficios base heredados continúan compensando la matriz operativa incompleta y que todos los permisos operativos actuales están también asignados en algún rol base.

#### 2. Decisión principal

Vento OS mantendrá dos sistemas de roles completamente independientes:

ROL BASE
→ autoridad permanente
→ administración
→ configuración
→ consulta permanente autorizada
→ no depende del turno

ROL OPERATIVO
→ función temporal
→ ejecución diaria
→ depende del turno y contexto operativo
→ limitado por sede y área
Regla canónica
EMPLEADO
├── tiene un rol base permanente
└── puede asumir un rol operativo temporal

Un rol no es identidad ni autorización final:

ROL
→ plantilla de permisos

PERMISO + CONTEXTO
→ decisión de autorización

#### 3. Rol base

3.1 Definición

El rol base representa la clase permanente de autoridad laboral o administrativa del empleado dentro de Vento OS.

No representa necesariamente:

el cargo contractual completo;
el oficio ejecutado durante una jornada;
el área donde trabaja hoy;
la sede donde está marcando;
la pantalla que debe abrir primero.
3.2 Fuente de verdad
public.employees.role
        ↓
public.roles.code
        ↓
public.role_permissions

| Aspecto                                | Decisión                                              |
| -------------------------------------- | ----------------------------------------------------- |
| Asignación                             | Un rol base por empleado                              |
| Duración                               | Permanente hasta cambio administrativo                |
| Depende de turno                       | No                                                    |
| Depende de check-in                    | No                                                    |
| Depende de área activa                 | No por sí mismo                                       |
| Puede otorgar permisos operativos      | No                                                    |
| Puede otorgar permisos administrativos | Sí                                                    |
| Puede identificar el cargo humano      | Parcialmente, pero no sustituye un catálogo de cargos |
| Fuente de verdad                       | employees.role                                        |

3.3 Qué puede conceder

Un rol base puede conceder capacidades permanentes como:

Administrar trabajadores
Consultar reportes autorizados
Configurar catálogos
Gestionar permisos
Administrar horarios
Consultar información financiera
Gestionar proveedores
Entrar a superficies administrativas

La autorización exacta seguirá dependiendo de permisos explícitos.

Ejemplo:

employees.role = contador
        ↓
numera.expenses.view
numera.reports.view

No:

employees.role = contador
        ↓
acceso total automático a NUMERA
3.4 Qué no puede conceder

Un rol base no podrá conceder acciones clasificadas como operativas, por ejemplo:

Preparar una remisión
Recibir una remisión
Registrar producción
Operar una caja
Procesar una venta
Realizar un retiro de inventario
Confirmar tránsito como conductor
Registrar recepción física de mercancía

#### 4. Rol base mínimo para trabajadores operativos

Un empleado puramente operativo seguirá necesitando un rol base válido, pero este será no privilegiado.

Trabajador operativo
        ↓
rol base mínimo
        +
rol operativo del turno

El código definitivo del rol base mínimo no se define todavía.

Opciones que deberán resolverse posteriormente:

trabajador
colaborador
empleado
staff
Regla

El rol base mínimo podrá conceder únicamente capacidades permanentes esenciales, por ejemplo:

entrar a Vento OS;
consultar su perfil;
utilizar ANIMA;
consultar sus propios turnos;
consultar sus propios documentos;
recibir notificaciones laborales.

No concederá permisos de operación empresarial.

#### 5. Rol operativo

5.1 Definición

El rol operativo representa la función concreta que el empleado ejecuta durante un turno determinado.

Ejemplos actuales:

cajero_satelite
barista_satelite
cocinero_satelite
servicio_salon
produccion_cocina
produccion_panaderia
produccion_reposteria
bodeguero
conductor_logistica
gerencia_operativa
5.2 Fuentes de verdad
Catálogo
public.operational_roles
Habilitación territorial
public.site_operational_roles
Asignación temporal
public.employee_shifts.operational_role
Permisos
public.operational_role_permissions
5.3 Contrato

| Aspecto                                | Decisión                            |
| -------------------------------------- | ----------------------------------- |
| Asignación                             | Mediante turno                      |
| Duración                               | Vigencia del contexto operativo     |
| Depende de turno                       | Sí                                  |
| Depende de sede                        | Sí                                  |
| Depende de área                        | Cuando el rol o permiso lo requiera |
| Depende de check-in                    | Según la política de la aplicación  |
| Puede otorgar permisos administrativos | No                                  |
| Puede otorgar permisos operativos      | Sí                                  |
| Fuente principal                       | Turno vigente y válido              |

#### 6. Rol operativo asignado y rol operativo efectivo

Rol operativo asignado
employee_shifts.operational_role

Representa el rol programado para el turno.

Rol operativo efectivo
Rol asignado
+ turno válido
+ sede válida
+ área válida
+ política de check-in
= rol operativo efectivo
Regla
Rol asignado
≠ automáticamente rol efectivo

#### 7. Perfiles operativos predeterminados

employee_site_operational_profiles.default_operational_role

Función:

configuración habitual
        ↓
valor sugerido al crear el turno

No autoriza.

Precedencia
Turno válido
    >
perfil operativo predeterminado

Si no existe turno válido:

active_operational_role = null

#### 8. Separación estricta de catálogos

Regla

Un código no puede existir en ambos catálogos:

public.roles
public.operational_roles
Caso actual incorrecto
bodeguero
Decisión

Debe existir solo en uno (probablemente operativo). Se elimina del catálogo base en el modelo final.

#### 9. Conversión del legado

Roles base heredados:

barista
bodeguero
cajero
cocinero
conductor
mesero
panadero
pastelero
repostero
Regla crítica

No hay conversión automática:

employees.role ≠ operational_role

La fuente definitiva es el turno.

#### 10. Casos administrativos y operativos

Propietario / gerente general
rol base + permiso administrativo = permitido

No hay bypass por nombre.

Gerencia operativa
gerente_general → base
gerencia_operativa → operativo
propietario_admin

Candidato a deprecación.

#### 11. Ausencia de datos

Sin rol base
base_role_missing
base_role_inactive
Sin rol operativo
sin turno válido = sin permisos operativos
Rol operativo inválido
operational_role_missing
operational_role_inactive
operational_role_not_allowed_in_site
operational_role_not_allowed_in_area
operational_role_ambiguous

#### 12. Fuente del rol operativo efectivo

ROL OPERATIVO EFECTIVO
**=**
ROL ASIGNADO AL TURNO PUBLICADO Y VÁLIDO

PERFIL OPERATIVO
→ puede sugerir el rol al crear el turno
→ no participa en la autorización

ROL BASE
→ no constituye fallback operativo
→ no crea contexto operativo
→ no concede capacidades OPERATIONAL_ONLY

#### 13. Bypass permitidos

| Caso                                  | Permitido |
| ------------------------------------- | --------- |
| Nombre de rol                         | ❌         |
| Rol base reemplazando turno           | ❌         |
| Perfil reemplazando turno             | ❌         |
| Permiso explícito                     | ✅         |
| Permiso operativo con contexto válido | ✅         |
| Proceso técnico autorizado            | ✅         |

#### 14. Contrato resultante

BaseRoleContext
BaseRoleContext
├── employee_id
├── role_code
├── role_active
├── source = employees.role
├── administrative_permissions
└── configuration_status
OperationalRoleContext
OperationalRoleContext
├── employee_id
├── shift_id
├── assigned_role_code
├── effective_role_code
├── site_id
├── area_id
├── role_active
├── role_allowed_in_site
├── role_allowed_in_area
├── context_valid
├── operational_permissions
└── blocked_reasons
AccessContext
AccessContext
├── employee
├── base_role
├── base_permissions
├── active_shift
├── operational_role
├── operational_permissions
├── active_site
├── active_area
└── final_decision

#### 15. Invariantes

Un empleado tiene un rol base.
Puede tener 0 o 1 rol operativo efectivo.
Rol base ≠ turno.
Rol operativo depende del turno.
No hay mezcla de permisos.
No hay códigos duplicados entre catálogos.
Perfil no autoriza.
Nombre de rol no autoriza.
Permiso define autorización.
Sin turno → sin operación.

#### 16. Impacto en guards

No usar:

role === "propietario"

Usar:

permiso + contexto

#### 17. Impacto en RPC

RPC deben declarar:

administrative | operational

#### 18. Impacto en RLS

Eliminar:

role in (...)

Migrar a permisos + contexto.

#### 19. Impacto en aplicaciones

Administrativas
base_role
base_permissions
Operativas
active_shift
operational_role
Híbridas
modo administrativo
modo operativo

### ✅ AUTH-MOD-003 — Definir roles administrativos globales

#### AUTH-MOD-003 — Definir roles administrativos globales

##### Estado

✅ APROBADO

✅ `AUTH-MOD-001` aprobado.
✅ `AUTH-MOD-002` aprobado.
✅ No se modificó código.
✅ No se creó ninguna migración.
✅ No se alteraron datos en Supabase.
✅ No se define todavía la matriz detallada de permisos.

---

#### 1. Decisión aprobada

El modelo canónico reconocerá dos roles administrativos globales:

```
ROLES ADMINISTRATIVOS GLOBALES
├── propietario
└── gerente_general
```

Estos roles representan autoridad administrativa permanente con alcance organizacional.

##### Regla central

```
ROL ADMINISTRATIVO GLOBAL
        ↓
puede recibir permisos administrativos
con alcance organizacional
        ↓
no obtiene autorización automática
por el nombre del rol
```

La clasificación como rol global determina **qué clase de alcance puede asignársele**, pero no concede por sí sola ninguna acción.

---

#### 2. Catálogo aprobado

##### 2.1 `propietario`

###### Definición

Representa la máxima autoridad de gobierno empresarial y tecnológico dentro de Vento OS.

```
propietario
→ gobierno organizacional
→ control institucional
→ administración de seguridad
→ supervisión transversal
```

###### Alcance natural

```
Organización completa
├── todas las unidades de negocio
├── todas las sedes operativas
├── todas las áreas
└── todas las aplicaciones internas autorizadas
```

###### Fuente de verdad

```
employees.role = propietario
        ↓
public.roles
        ↓
public.role_permissions
```

###### Condiciones obligatorias

Para ejercer una capacidad:

```
empleado existente
AND empleado activo
AND rol base activo
AND permiso explícito activo
AND alcance compatible
= autorización administrativa posible
```

###### Responsabilidades conceptuales

El rol podrá recibir permisos relacionados con:

* gobierno del sistema;
* administración de empleados;
* administración de roles y permisos;
* configuración organizacional;
* configuración de aplicaciones;
* auditoría transversal;
* administración de sedes y áreas;
* supervisión financiera;
* configuración de operaciones;
* gestión de integraciones;
* acciones excepcionales expresamente catalogadas.

Estas son categorías conceptuales, no una matriz aprobada.

###### Restricciones

`propietario` no significa:

`permitir cualquier acción automáticamente`

Tampoco significa:

`operador universal`

Un propietario no podrá ejecutar automáticamente acciones físicas como:

* preparar una remisión;
* recibir inventario;
* operar una caja;
* registrar producción;
* confirmar transporte;
* realizar un conteo operativo.

Para ejecutar una acción operativa tendrá que existir:

###### 1. un contexto operativo válido; o

2. una capacidad administrativa distinta, explícita y auditable.

---

##### 2.2 `gerente_general`

###### Definición

Representa la máxima autoridad ejecutiva administrativa, subordinada al gobierno reservado al propietario.

```
gerente_general
→ dirección ejecutiva global
→ administración transversal
→ supervisión de operación
→ acceso organizacional según permisos
```

###### Alcance natural

Puede recibir permisos administrativos sobre:

```
todas las sedes operativas
todas las áreas operativas
todas las unidades de negocio
```

pero únicamente para las capacidades asignadas explícitamente.

###### Fuente de verdad

```
employees.role = gerente_general
        ↓
public.roles
        ↓
public.role_permissions
```

###### Condiciones obligatorias

```
empleado existente
AND empleado activo
AND rol base activo
AND permiso explícito activo
AND alcance compatible
= autorización administrativa posible
```

###### Responsabilidades conceptuales

Podrá recibir permisos relacionados con:

* supervisión general de trabajadores;
* programación y seguimiento de turnos;
* consulta administrativa multisede;
* revisión de indicadores;
* supervisión de inventario;
* seguimiento de compras y producción;
* revisión de remisiones;
* gestión operativa transversal;
* configuración delegada;
* auditoría administrativa.

###### Restricciones

`gerente_general` no tendrá por defecto capacidades exclusivas del propietario, especialmente:

* modificar la arquitectura de autorización;
* administrar propietarios;
* conceder permisos equivalentes a propietario;
* alterar controles de seguridad críticos;
* modificar procesos técnicos de service role;
* desactivar auditoría;
* efectuar acciones destructivas reservadas;
* alterar aislamiento de entornos de prueba;
* asumir identidad de otro usuario sin permiso específico.

La separación exacta se materializará posteriormente en las matrices de permisos.

---

#### 3. Diferencia entre propietario y gerente general

```
PROPIETARIO
→ gobierno y control final

GERENTE GENERAL
→ administración ejecutiva global
```

| Capacidad conceptual                   |                         Propietario |               Gerente general |
| -------------------------------------- | ----------------------------------: | ----------------------------: |
| Administración organizacional global   |               Sí, mediante permisos |         Sí, mediante permisos |
| Consulta multisede                     |               Sí, mediante permisos |         Sí, mediante permisos |
| Configuración operativa                |               Sí, mediante permisos |         Sí, mediante permisos |
| Gobierno de seguridad                  |                                  Sí |                      Limitado |
| Administrar propietarios               |       Posible con permiso reservado |                            No |
| Alterar arquitectura de autorización   | Posible mediante proceso controlado |                            No |
| Bypass automático                      |                                  No |                            No |
| Operar sin turno                       |       Solo acciones administrativas | Solo acciones administrativas |
| Ejecutar acciones físicas sin contexto |                                  No |                            No |

---

#### 4. Qué significa “global”

##### 4.1 Alcance organizacional

Un permiso global puede aplicarse sobre todas las sedes y áreas normales de la organización.

```
scope = global
→ no se restringe a una sede concreta
```

Sin embargo, esto no significa acceso absoluto a toda entidad existente.

##### 4.2 Exclusiones

El alcance global no atravesará automáticamente:

* entornos demo;
* sedes de revisión de tiendas;
* datos aislados de pruebas;
* espacios técnicos;
* recursos archivados restringidos;
* secretos o credenciales;
* datos de clientes fuera de la finalidad autorizada;
* dominios pertenecientes a otra aplicación.

El caso `APP-REVIEW` debe permanecer aislado y no podrá considerarse accesible únicamente porque el trabajador tenga un permiso global.

##### 4.3 Permiso global no equivale a rol global

Un rol funcional puede recibir un permiso global concreto sin convertirse en rol administrativo global.

Ejemplo:

```
contador
+ numera.reports.view
+ scope global
```

significa:

> El contador puede consultar ese reporte para toda la organización.

No significa:

> El contador es administrador global de Vento OS.

---

#### 5. Roles que no son administrativos globales

##### 5.1 `gerente`

```
gerente
→ administración por sede
```

No será un rol administrativo global.

Su modelo se definirá en `AUTH-MOD-004`.

El estado actual es incorrecto porque `gerente`, descrito como gerente de sede, posee 115 permisos globales y aparece directamente en numerosas políticas RLS.

##### 5.2 `auxiliar_administrativa`

No será considerada autoridad administrativa global.

Es un rol funcional de apoyo administrativo.

Podrá tener permisos:

* globales específicos;
* por sede;
* por área;
* sobre determinados recursos.

Pero no podrá obtener acceso organizacional amplio por el nombre del rol.

Actualmente sus 40 permisos base están configurados globalmente, sin restricción territorial. Esto deberá revisarse en la matriz posterior.

##### 5.3 `contador`

No será un administrador global del sistema.

Es un rol funcional financiero.

Puede requerir acceso organizacional a:

* contabilidad;
* reportes;
* gastos;
* centros de costo;
* rentabilidad;
* documentos financieros.

Ese alcance se expresará mediante permisos globales específicos, no mediante privilegios generales.

Actualmente tiene permisos en nueve aplicaciones, todos con alcance global, lo cual excede probablemente su dominio funcional.

##### 5.4 `marketing`

No será un administrador global.

Es un rol funcional transversal que puede recibir permisos limitados sobre:

* AURA;
* contenido;
* menú;
* imágenes;
* sitio web;
* campañas;
* información comercial.

##### 5.5 `gerencia_operativa`

No es un rol administrativo global.

```
gerente_general
→ rol base administrativo permanente

gerencia_operativa
→ rol operativo temporal
```

`gerencia_operativa` requerirá turno y contexto cuando ejecute acciones operativas.

##### 5.6 `propietario_admin`

No será reconocido como rol administrativo global ni como reemplazo de `propietario`.

Se mantiene como candidato a eliminación porque actualmente no tiene turnos, sedes ni permisos y fue diseñado como bypass operativo futuro.

---

#### 6. Rol global y permisos explícitos

##### Regla

Los roles globales no usarán un wildcard implícito:

```
propietario → *
gerente_general → *
```

Este modelo queda descartado.

La autoridad se expresará mediante asignaciones explícitas:

```
role_permissions
├── role_code
├── permission_code
├── scope_type
└── is_allowed
```

##### Resultado esperado

```
propietario
+ viso.staff.permissions.manage
+ global
= puede gestionar permisos globalmente
```

```
propietario
sin fogo.production.batches.create
= no puede ejecutar esa acción
```

La auditoría encontró que `propietario` tiene 163 de los 177 permisos activos y `gerente_general` 148. Esto demuestra que el catálogo actual no garantiza cobertura total y que el nombre del rol no debe utilizarse para completar permisos faltantes.

---

#### 7. Nuevos permisos

Crear un permiso nuevo no lo concederá automáticamente a los roles globales.

```
nuevo permiso creado
        ↓
sin asignación aprobada
        ↓
DENEGAR
```

Esto aplica también a `propietario`.

##### Motivo

La asignación automática:

```
todo permiso nuevo
→ propietario
→ gerente_general
```

podría conceder silenciosamente:

* operaciones peligrosas;
* herramientas en desarrollo;
* funciones técnicas;
* acceso a datos sensibles;
* capacidades no revisadas.

##### Proceso posterior

Todo permiso nuevo deberá declarar:

* aplicación propietaria;
* clasificación administrativa u operativa;
* roles destinatarios;
* alcance;
* riesgos;
* necesidad de auditoría;
* comportamiento ante ausencia.

---

#### 8. Administración sin turno

Los roles administrativos globales no requerirán turno ni check-in para ejecutar acciones clasificadas como administrativas.

```
acción administrativa
+ permiso administrativo
+ empleado activo
= puede ejecutarse sin turno
```

Ejemplos conceptuales:

* consultar reportes;
* administrar empleados;
* modificar configuración;
* revisar auditorías;
* administrar permisos;
* consultar información multisede.

##### Regla de separación

```
NO REQUERIR TURNO
≠ BYPASS OPERATIVO
```

No exigir turno para una acción administrativa no permite ejecutar una acción operativa.

---

#### 9. Acciones operativas desde administración

Cuando un propietario o gerente general necesite intervenir en una operación existirán dos caminos diferentes.

##### Camino A — Participación operativa real

```
empleado
+ turno válido
+ rol operativo
+ sede
+ área
+ permiso operativo
= acción operativa normal
```

##### Camino B — Acción administrativa excepcional

Debe existir un permiso administrativo específico, por ejemplo conceptualmente:

```
remissions.override
inventory.adjustments.approve
production.batches.cancel
sales.force_close
```

La acción excepcional deberá registrar:

* actor;
* permiso utilizado;
* recurso afectado;
* motivo obligatorio;
* fecha;
* estado anterior;
* estado posterior;
* sede afectada.

##### Regla

Un permiso de consulta transversal no podrá funcionar como bypass general.

El informe detectó que `nexo.inventory.remissions.all_sites`, cuyo nombre sugiere consulta multisede de remisiones, actualmente puede evitar toda la política operativa de NEXO. Esta semántica queda rechazada.

---

#### 10. Ausencia de datos

##### Empleado inexistente

```
auth válido
+ employee inexistente
= DENEGAR
```

##### Empleado inactivo

```
employees.is_active = false
= DENEGAR
```

El rol global no puede reactivar una identidad inactiva.

##### Rol ausente

```
employees.role = null
= sin permisos heredados
```

##### Rol inactivo

```
roles.is_active = false
= rol no utilizable
```

##### Permiso ausente

```
sin role_permission
y sin employee_permission aplicable
= DENEGAR
```

##### Alcance ausente o inválido

Si una acción requiere un alcance y no puede determinarse:

```
scope_context_missing
→ DENEGAR
```

No se utilizará automáticamente la sede primaria, la sede seleccionada o una sede enviada por el cliente para ampliar acceso.

---

#### 11. Comportamiento de denegación

La denegación deberá ser explícita y estable.

Códigos conceptuales:

```
employee_not_found
employee_inactive
base_role_missing
base_role_inactive
permission_not_granted
permission_inactive
scope_not_allowed
resource_isolated
administrative_action_required
operational_context_required
reserved_owner_capability
```

La interfaz podrá adaptar el mensaje humano, pero no modificar la decisión.

---

#### 12. Bypass permitidos

##### Por nombre de rol

| Caso                                                 | Permitido |
| ---------------------------------------------------- | --------: |
| `role = propietario`                                 |         ❌ |
| `role = gerente_general`                             |         ❌ |
| `role in privileged_roles`                           |         ❌ |
| Helper `is_owner()` como autorización final          |         ❌ |
| Helper `is_global_manager()` como autorización final |         ❌ |

##### Excepciones admitidas

Solo se admitirán:

1. procesos técnicos autorizados;
2. service role con actor o proceso identificado;
3. acciones administrativas excepcionales con permiso específico;
4. mecanismos de emergencia aprobados, auditados y con expiración.

Ninguna de estas excepciones procederá únicamente del nombre del rol.

La auditoría encontró bypasses repetidos para propietario y gerente general en PostgreSQL, frontend, helpers y configuraciones independientes por aplicación.

---

#### 13. Precedencia

La precedencia completa se definirá en `AUTH-MOD-018`, pero esta tarea establece:

```
empleado inactivo
    > cualquier rol o permiso

denegación individual aplicable
    > concesión por rol

permiso explícito
    > nombre del rol

restricción de alcance
    > permiso sin contexto suficiente
```

##### Regla de autoridad

```
rol global
→ permite asignar alcance global

permiso efectivo
→ autoriza la acción
```

---

#### 14. Contrato resultante

##### GlobalAdministrativeRole

```
GlobalAdministrativeRole
├── role_code
├── authority_class
│   ├── ownership
│   └── executive_management
├── natural_scope = organization
├── requires_shift_for_administration = false
├── requires_checkin_for_administration = false
├── grants_implicit_permissions = false
├── grants_operational_bypass = false
├── can_receive_global_permissions = true
└── reserved_capability_class
```

##### Roles

```
propietario
├── authority_class = ownership
├── natural_scope = organization
├── reserved_capabilities = permitted
└── implicit_bypass = false
```

```
gerente_general
├── authority_class = executive_management
├── natural_scope = organization
├── reserved_capabilities = prohibited
└── implicit_bypass = false
```

---

#### 15. Invariantes

1. Solo `propietario` y `gerente_general` son roles administrativos globales.
2. Un rol global no concede permisos automáticamente.
3. Todo permiso debe existir y estar activo.
4. Toda acción administrativa debe indicar un permiso requerido.
5. El alcance global aplica solo al permiso concedido.
6. El rol global no reemplaza el contexto operativo.
7. Las acciones administrativas no requieren turno.
8. Las acciones operativas sí requieren contexto operativo, salvo una acción administrativa excepcional distinta.
9. `propietario` no equivale a service role.
10. `gerente_general` no equivale a propietario.
11. Los permisos reservados de propietario no pueden concederse indirectamente al gerente general.
12. `gerente`, `contador`, `auxiliar_administrativa` y `marketing` no son administradores globales.
13. Una aplicación no puede mantener su propia lista de roles privilegiados.
14. Un permiso nuevo se deniega hasta ser asignado.
15. La sede seleccionada funciona como filtro, no como límite de un permiso global.
16. Los entornos aislados no quedan incluidos automáticamente en el alcance global.

---

#### 16. Impacto en guards

Los guards deberán pasar de:

```ts
if (role === "propietario" || role === "gerente_general") {
  return allow();
}
```

a:

```
resolver empleado activo
        ↓
resolver permiso requerido
        ↓
resolver alcance
        ↓
evaluar permiso efectivo
```

Los helpers como:

```
is_owner()
is_global_manager()
```

podrán utilizarse para:

* presentación;
* clasificación;
* selección de experiencia;
* validaciones estructurales reservadas.

No serán autorización final de una acción empresarial.

---

#### 17. Impacto en RPC

Las RPC administrativas deberán:

1. resolver el actor real;
2. comprobar que el empleado esté activo;
3. validar la aplicación y el permiso;
4. validar el alcance;
5. verificar restricciones reservadas;
6. denegar por defecto;
7. registrar auditoría cuando corresponda.

No podrán contener:

```sql
if role in ('propietario', 'gerente_general') then
  return true;
end if;
```

como autorización final.

##### RPC operativas

No podrán aceptar el rol global como sustituto de:

* turno;
* check-in;
* rol operativo;
* sede;
* área;
* permiso operativo.

---

#### 18. Impacto en RLS

Las políticas RLS deberán eliminar progresivamente condiciones como:

```sql
is_owner()
OR is_global_manager()
```

cuando exista una capacidad empresarial concreta que deba validarse.

Modelo esperado:

```
RLS
→ permiso efectivo
→ alcance del recurso
→ identidad activa
```

Las políticas reservadas de infraestructura podrán distinguir al propietario, pero deberán estar:

* centralizadas;
* documentadas;
* limitadas;
* separadas de las operaciones ordinarias.

Actualmente existen bypasses y listas de roles distribuidas; además, corregir únicamente `role_permissions` no revocaría todas las capacidades porque los roles siguen apareciendo directamente en RLS y funciones.

---

#### 19. Impacto en aplicaciones

##### VISO

Será la principal superficie administrativa para:

* trabajadores;
* roles;
* permisos;
* configuración;
* auditoría;
* simulación.

Cada sección exigirá permisos específicos.

##### NUMERA

El acceso financiero global dependerá de permisos financieros, no del rol global general.

##### NEXO, FOGO, ORIGO y PULSO

Deberán diferenciar:

`vista administrativa`

de:

`operación física`

Ejemplo:

```
Consultar remisiones de todas las sedes
→ permiso administrativo global
→ sin turno
```

```
Preparar una remisión
→ permiso operativo
→ con turno, sede y rol operativo
```

##### ANIMA

Los roles globales podrán administrar turnos o trabajadores mediante permisos administrativos, pero su menú no podrá asumir capacidades a partir del nombre del rol.

---

#### 20. Navegación y presentación

La interfaz podrá mostrar:

```
Rol: Propietario
Alcance: Organización
```

o:

```
Rol: Gerente general
Alcance: Organización
```

Pero los módulos visibles procederán de permisos.

##### Representación esperada

```
VENTO OS

Administración global
├── Equipo              ✅ viso.staff.read
├── Permisos            ✅ viso.staff.permissions.manage
├── Auditoría           ✅ viso.ops.audit.view
├── Finanzas            ❌ permiso no concedido
└── Producción operativa ❌ requiere contexto operativo
```

El nombre del rol orienta la presentación; la matriz de permisos decide la visibilidad.

---

#### 21. Alternativas descartadas

##### A. Todo acceso para propietario

❌ Descartada.

Impediría revocación, auditoría precisa y control de nuevas capacidades.

##### B. Propietario y gerente general como wildcard

❌ Descartada.

Un permiso nuevo quedaría concedido sin revisión.

##### C. Considerar `gerente` como global

❌ Descartada.

Su significado funcional es administración por sede.

##### D. Considerar `contador` como administrador global

❌ Descartada.

Su dominio es financiero, aunque algunos permisos puedan tener alcance organizacional.

##### E. Considerar `auxiliar_administrativa` como administrador global

❌ Descartada.

Debe recibir capacidades concretas y limitadas.

##### F. Mantener bypass por nombres de rol

❌ Descartada.

La matriz configurable dejaría de ser fuente de verdad.

##### G. Exigir turno a propietarios y gerentes generales para toda acción

❌ Descartada.

La administración permanente no debe depender de asistencia laboral.

##### H. Eximirlos de turno para toda acción

❌ Descartada.

Confundiría administración global con operación física.

##### I. Conceder automáticamente todos los permisos nuevos al propietario

❌ Descartada.

Viola denegación por defecto.

---

#### 22. Riesgos

⚠️ **Hardcodes distribuidos**

`propietario` y `gerente_general` aparecen como excepciones en frontend, SQL, RLS y helpers.

⚠️ **Revocación incompleta**

Retirar una fila de `role_permissions` no elimina actualmente todos los accesos.

⚠️ **Matriz desactualizada**

Los roles globales no tienen todos los permisos activos, pero varios caminos los permiten igualmente mediante bypass.

⚠️ **Confusión entre consulta y operación**

Permisos administrativos multisede pueden estar actuando como bypass de toda la política operacional.

⚠️ **App Review**

Existe una identidad de revisión con rol propietario, lo cual actualmente puede otorgarle bypass completo. El aislamiento deberá resolverse expresamente.

⚠️ **Permisos globales excesivos**

Contador, auxiliar administrativa y gerente poseen actualmente asignaciones globales que deberán reclasificarse.

⚠️ **Acciones reservadas todavía no catalogadas**

Aún no existe una clasificación formal de permisos exclusivos del propietario.

---

#### 23. Asuntos pendientes

| Pendiente                                        | Tarea                           |
| ------------------------------------------------ | ------------------------------- |
| Definir gerente de sede                          | AUTH-MOD-004                    |
| Definir roles operativos definitivos             | AUTH-MOD-005                    |
| Definir roles funcionales e híbridos             | AUTH-MOD-006                    |
| Definir sede accesible y activa                  | AUTH-MOD-007                    |
| Definir permisos reservados de propietario       | Diseño de catálogo y matrices   |
| Crear matriz de propietario                      | AUTH-RBAC-001                   |
| Crear matriz de gerente general                  | AUTH-RBAC-002                   |
| Retirar bypass por rol                           | Fase de implementación          |
| Reescribir RLS basada en roles                   | Fase de implementación          |
| Aislar APP-REVIEW                                | Fase de diseño e implementación |
| Clasificar permisos administrativos y operativos | Bloques B y C                   |
| Definir precedencia completa                     | AUTH-MOD-018                    |
| Definir denegaciones                             | AUTH-MOD-019                    |

---

#### 24. Decisión resumida

```
propietario
→ gobierno global
→ permisos explícitos
→ capacidades reservadas posibles
→ sin bypass implícito

gerente_general
→ administración ejecutiva global
→ permisos explícitos
→ sin capacidades reservadas de propietario
→ sin bypass implícito
```

```
gerente
contador
auxiliar_administrativa
marketing
→ no son administradores globales
```

##### Criterio de aprobación

`AUTH-MOD-003` puede aprobarse cuando se acepte que:

1. Los únicos roles administrativos globales son `propietario` y `gerente_general`.
2. Ninguno obtiene acceso por su nombre.
3. Ambos reciben permisos explícitos.
4. `propietario` conserva una clase de capacidades reservadas.
5. `gerente_general` administra globalmente, pero no gobierna la seguridad del propietario.
6. Las acciones administrativas no requieren turno.
7. Las acciones operativas no se habilitan mediante el rol global.
8. Un permiso global afecta solo la capacidad asignada.
9. Los permisos nuevos se deniegan hasta ser aprobados.
10. Los entornos aislados no quedan incluidos automáticamente.
APROBADO

### ✅ AUTH-MOD-004 — Definir roles administrativos por sede

#### AUTH-MOD-004 — Definir roles administrativos por sede

##### Estado

🟢 **Aprobado con aclaración**

✅ `AUTH-MOD-001` aprobado.
✅ `AUTH-MOD-002` aprobado.
✅ `AUTH-MOD-003` aprobado.
✅ `AUTH-MOD-004` aprobado.
✅ No se modificó código.
✅ No se creó ninguna migración.
✅ No se alteraron datos en Supabase.
✅ No se define todavía la matriz exacta de permisos.

---

#### 1. Decisión aprobada

Vento OS reconocerá dos roles administrativos cuyo alcance natural estará limitado a una o varias sedes asignadas:

```
ROLES ADMINISTRATIVOS POR SEDE
├── gerente
└── supervisor
```

##### Regla principal

```
ROL ADMINISTRATIVO POR SEDE
        ↓
permiso administrativo explícito
        ↓
sede incluida en su cobertura autorizada
        ↓
acción administrativa permitida
```

El nombre del rol no concede acceso por sí mismo.

---

#### 2. Diferencia frente a los roles globales

```
propietario
gerente_general
→ alcance organizacional

gerente
supervisor
→ alcance limitado a sedes autorizadas
```

| Rol               | Autoridad natural               | Cobertura       |
| ----------------- | ------------------------------- | --------------- |
| `propietario`     | Gobierno organizacional         | Global          |
| `gerente_general` | Dirección ejecutiva             | Global          |
| `gerente`         | Administración integral de sede | Sedes asignadas |
| `supervisor`      | Supervisión limitada de sede    | Sedes asignadas |

---

#### 3. Rol `gerente`

##### 3.1 Definición

`gerente` representa a la persona responsable administrativamente de una sede o de un conjunto explícito de sedes.

```
gerente
→ administración integral de sede
→ coordinación de trabajadores
→ supervisión de operación
→ consulta administrativa local
```

El catálogo actual ya describe conceptualmente este rol como gerente de sede, pero sus 115 permisos están configurados globalmente. Esto contradice el significado funcional del rol.

##### 3.2 Alcance natural

```
gerente
→ únicamente sedes administrativas asignadas
```

Un gerente podrá tener:

```
1 sede
o
varias sedes explícitamente asignadas
```

Ejemplos conceptuales:

```
Gerente A
├── Vento Café
└── Saudo
```

```
Gerente B
└── Centro de Producción
```

No existirá la regla:

```
role = gerente
→ todas las sedes
```

##### 3.3 Responsabilidades conceptuales

El gerente podrá recibir permisos sobre su cobertura territorial para:

* consultar trabajadores;
* administrar horarios;
* consultar asistencia;
* revisar novedades laborales;
* gestionar documentos autorizados;
* supervisar inventarios;
* revisar remisiones;
* revisar producción;
* consultar compras;
* revisar ventas;
* gestionar configuraciones locales;
* consultar reportes de la sede;
* realizar acciones administrativas excepcionales expresamente permitidas.

Estas categorías no constituyen todavía la matriz definitiva.

##### 3.4 Restricciones

Un gerente no podrá, salvo permiso específico:

* administrar otra sede;
* cambiar permisos globales;
* modificar roles globales;
* administrar propietarios;
* modificar políticas organizacionales;
* alterar el catálogo global de permisos;
* administrar todas las sedes por defecto;
* consultar información financiera global;
* modificar configuraciones técnicas de otras unidades;
* utilizar un permiso local contra un recurso global.

---

#### 4. Rol `supervisor`

##### 4.1 Definición

`supervisor` representa una autoridad administrativa local limitada, subordinada al gerente de sede.

```
supervisor
→ seguimiento diario
→ coordinación local
→ revisión de personal
→ resolución de novedades
→ autoridad limitada
```

El roadmap ya contempla una matriz independiente de supervisor, aunque este código todavía no forma parte del catálogo base auditado.

##### 4.2 Alcance natural

```
supervisor
→ una o varias sedes explícitamente asignadas
```

Al igual que el gerente, no tendrá acceso organizacional.

##### 4.3 Responsabilidades conceptuales

Podrá recibir permisos limitados para:

* consultar equipo de la sede;
* consultar turnos;
* registrar o revisar novedades;
* consultar asistencia;
* revisar operación local;
* consultar ventas operativas;
* revisar estados de inventario;
* validar tareas o cierres autorizados;
* apoyar la programación de personal;
* realizar correcciones menores expresamente permitidas.

##### 4.4 Restricciones

El supervisor no podrá recibir por defecto capacidades como:

* administrar permisos;
* cambiar roles base;
* administrar perfiles administrativos;
* modificar la estructura de sedes;
* cambiar configuraciones globales;
* administrar matrices operativas globales;
* consultar información financiera sensible completa;
* aprobar acciones reservadas al gerente;
* anular operaciones sensibles sin permiso específico.

---

#### 5. Diferencia entre gerente y supervisor

```
GERENTE
→ autoridad administrativa integral de sede

SUPERVISOR
→ autoridad administrativa limitada de sede
```

| Capacidad conceptual              | Gerente           | Supervisor        |
| --------------------------------- | ----------------- | ----------------- |
| Consultar trabajadores de la sede | Sí                | Sí, según permiso |
| Administrar horarios              | Sí, según permiso | Limitado          |
| Gestionar documentos laborales    | Sí, según permiso | Limitado          |
| Consultar operación local         | Sí                | Sí                |
| Configurar operación local        | Sí, según permiso | Generalmente no   |
| Aprobar excepciones sensibles     | Sí, según permiso | Restringido       |
| Administrar permisos              | No por defecto    | No                |
| Administrar otras sedes           | No                | No                |
| Consultar información global      | No                | No                |
| Gobierno organizacional           | No                | No                |

---

#### 6. Fuente de verdad del rol

La fuente de verdad continuará siendo:

```
public.employees.role
        ↓
public.roles.code
```

Para estos roles:

`employees.role = gerente`

o:

`employees.role = supervisor`

##### Regla

El rol determina la plantilla de permisos permanentes.

```
rol base
→ qué permisos puede heredar
```

No determina automáticamente:

`qué sedes puede administrar`

---

#### 7. Fuente de verdad territorial

La cobertura administrativa del empleado deberá proceder de asignaciones explícitas de sede.

Modelo conceptual:

```
empleado
        ↓
sedes accesibles activas
        ↓
sede objetivo de la acción
```

La fuente física exacta y la semántica completa se cerrarán en `AUTH-MOD-007`.

Actualmente `employee_sites`:

* está ampliamente poblada;
* soporta múltiples sedes;
* conserva una sede primaria;
* representa mejor la cobertura real que `employees.site_id`.

La auditoría encontró 19 trabajadores con más de una sede activa, por lo que utilizar exclusivamente `employees.site_id` ignoraría coberturas secundarias válidas.

##### Regla provisional aprobada

```
Sede primaria
→ valor predeterminado

Sedes accesibles
→ cobertura real potencial

Sede seleccionada
→ contexto visual actual
```

Ninguna de estas tres tendrá exactamente la misma función.

---

#### 8. Sede primaria

La sede primaria servirá como:

* sede laboral principal;
* valor inicial de selección;
* contexto predeterminado;
* referencia organizacional.

No servirá como límite único de autorización cuando exista cobertura multisede.

```
primary_site
≠ única sede autorizada
```

El modelo actual mantiene la sede primaria simultáneamente en:

```
employees.site_id
employee_sites.is_primary
```

Aunque ambos valores coinciden actualmente, constituyen fuentes duplicadas. La fuente canónica se definirá en `AUTH-MOD-007`.

---

#### 9. Sede seleccionada

La sede seleccionada será una preferencia de navegación o contexto.

```
selected_site
→ sede que la interfaz está mostrando
```

No concederá autoridad.

```
Seleccionar una sede
≠ obtener acceso a esa sede
```

##### Ejemplo

```
Gerente autorizado:
├── Vento Café
└── Saudo

Sede seleccionada:
└── Saudo
```

Resultado:

```
La interfaz muestra Saudo
pero el gerente conserva autorización
sobre Vento Café y Saudo
```

Si intenta seleccionar Centro de Producción:

```
Centro de Producción no está autorizado
→ DENEGAR selección administrativa
```

---

#### 10. Sede objetivo del recurso

Toda autorización administrativa por sede deberá identificar la sede del recurso afectado.

Ejemplos:

```
empleado.site_id
turno.site_id
remisión.origin_site_id
remisión.destination_site_id
inventario.site_id
orden.site_id
recepción.site_id
venta.site_id
```

##### Regla

```
Permiso efectivo
AND sede del recurso autorizada
= acceso posible
```

No se permitirá que el cliente declare libremente una sede para convertir un recurso global en local.

La sede deberá resolverse desde el propio recurso o desde una relación verificable en Supabase.

---

#### 11. Regla de intersección

La autorización local será la intersección de tres elementos:

```
PERMISO DEL ROL
∩
COBERTURA DE SEDES DEL EMPLEADO
∩
SEDE DEL RECURSO
```

##### Ejemplo permitido

```
Rol: gerente
Permiso: anima.team.view
Sedes asignadas: Vento Café
Recurso: trabajador de Vento Café

Resultado: PERMITIR
```

##### Ejemplo denegado

```
Rol: gerente
Permiso: anima.team.view
Sedes asignadas: Vento Café
Recurso: trabajador de Centro de Producción

Resultado: DENEGAR
```

---

#### 12. Trabajadores multisede

Un gerente o supervisor podrá administrar varias sedes cuando exista asignación explícita.

```
gerente
├── Vento Café
├── Saudo
└── Molka
```

Esto no convertirá al empleado en administrador global.

```
varias sedes asignadas
≠ alcance global
```

##### Diferencia

```
ALCANCE MULTISEDE
→ conjunto finito de sedes autorizadas

ALCANCE GLOBAL
→ todas las sedes organizacionales permitidas
```

La incorporación futura de una nueva sede:

`Nueva sede creada`

no la añadirá automáticamente a un gerente multisede.

Para acceder deberá existir una nueva asignación explícita.

---

#### 13. Jerarquía entre roles locales

La jerarquía conceptual será:

```
gerente
    >
supervisor
```

Pero esta jerarquía no implicará herencia automática de todos los permisos.

```
gerente
≠ supervisor + todos los permisos posibles
```

Los dos tendrán matrices explícitas.

La jerarquía servirá para:

* presentación;
* aprobación de flujos;
* restricciones de delegación;
* clasificación de responsabilidades.

La autorización seguirá dependiendo del permiso exacto.

---

#### 14. Administración de otros empleados

##### Gerente

Podrá administrar trabajadores cuando:

```
actor y trabajador objetivo
compartan una sede autorizada
```

y exista el permiso correspondiente.

##### Supervisor

Podrá consultar o realizar acciones limitadas sobre trabajadores de la sede según su matriz.

##### Empleados multisede

Cuando un trabajador pertenezca a varias sedes, una acción deberá identificar qué relación territorial se está administrando.

Ejemplo:

```
Trabajador:
├── Vento Café
└── Saudo
```

Un gerente de Vento Café podrá:

* consultar la relación laboral relevante para Vento Café;
* administrar turnos de Vento Café;
* revisar asistencia de Vento Café.

No podrá modificar automáticamente:

* su asignación en Saudo;
* turnos de Saudo;
* configuraciones administrativas de Saudo.

---

#### 15. Recursos sin sede

Un rol administrativo por sede no podrá acceder automáticamente a un recurso que no tenga sede resoluble.

```
resource.site_id = null
→ no asumir sede
```

Resultado por defecto:

```
scope_context_missing
→ DENEGAR
```

Excepciones:

* recursos personales del propio empleado;
* catálogos públicos internos;
* recursos definidos explícitamente como globales;
* permisos cuyo contrato permita lectura sin sede.

La excepción deberá estar declarada en el catálogo del permiso.

---

#### 16. Recursos que afectan varias sedes

Algunas operaciones incluyen más de una sede.

Ejemplo:

```
Remisión:
├── sede origen
└── sede destino
```

El permiso deberá definir qué sede controla la autorización.

Posibles reglas futuras:

```
administrar origen
administrar destino
administrar cualquiera de las dos
administrar ambas
```

No se asumirá automáticamente que acceder a una de las sedes permite modificar todo el recurso.

La semántica exacta se documentará por permiso en el catálogo canónico.

---

#### 17. Acciones administrativas sin turno

Los roles administrativos por sede no requerirán turno ni check-in para ejecutar acciones administrativas permanentes.

```
empleado activo
+ permiso administrativo
+ sede autorizada
= acción administrativa posible
```

Esto aplica, por ejemplo, a:

* revisar horarios;
* consultar personal;
* revisar reportes;
* configurar datos locales;
* aprobar una novedad administrativa.

##### Regla

```
Administración por sede
≠ operación del turno
```

---

#### 18. Acciones operativas

El rol `gerente` o `supervisor` no concederá automáticamente permisos operativos.

Para participar directamente en la operación:

```
rol base administrativo
+
turno válido
+
rol operativo efectivo
+
permiso operativo
```

Ejemplo:

```
employees.role = gerente
employee_shifts.operational_role = gerencia_operativa
```

##### Acción administrativa excepcional

Un gerente podrá intervenir sin asumir un rol operativo únicamente mediante un permiso administrativo específico, por ejemplo:

```
remissions.cancel
inventory.adjustments.approve
sales.void.approve
```

La acción deberá quedar auditada.

---

#### 19. Supervisor como caso híbrido

El supervisor puede:

```
tener autoridad administrativa permanente
+
ejecutar labores operativas durante un turno
```

Sin embargo, esta combinación no se resolverá mezclando permisos.

```
PERMISOS ADMINISTRATIVOS
→ proceden de supervisor

PERMISOS OPERATIVOS
→ proceden del rol operativo del turno
```

El contrato completo de casos híbridos se definirá en `AUTH-MOD-006`.

---

#### 20. Tipos de sede

El rol por sede no obtendrá automáticamente acceso a todas las sedes del mismo tipo.

Ejemplo:

`Gerente de Vento Café`

no implica:

`acceso a todas las sedes satélite`

La autorización por:

`site_type`

será una clase distinta de alcance y se definirá en `AUTH-MOD-015`.

##### Regla

```
Sede específica
≠ tipo de sede
```

---

#### 21. APP-REVIEW y sedes especiales

Las sedes demo, técnicas u ocultas no podrán asignarse o heredarse como sedes administrativas normales.

```
APP-REVIEW
→ sede aislada
→ usuario aislado
→ entorno de revisión de apps
→ aprobación iOS / Google (Vento Pass y ANIMA)
→ reglas especiales
```

APP-REVIEW es una sede diseñada exclusivamente para procesos de revisión de aplicaciones móviles ante Apple y Google, y no forma parte de la operación real del negocio.

Reglas:

* Solo un usuario aislado puede estar asignado a APP-REVIEW.
* No comparte datos con sedes productivas.
* No puede acceder a información real de la organización.
* No puede ser visible para gerentes o supervisores de sedes reales.
* No puede heredar permisos por coincidencia de rol.

Un gerente de una sede productiva no podrá verla.

Un usuario asignado a APP-REVIEW no podrá acceder a sedes reales únicamente por compartir el rol `gerente` o `supervisor`.

---

#### 22. Ausencia de datos

##### Sin sede asignada

```
gerente o supervisor
+ ninguna sede administrativa válida
= configuración incompleta
```

Resultado:

* conserva únicamente permisos personales o globales explícitos;
* no puede administrar recursos territoriales;
* no se utiliza la sede primaria heredada como fallback inseguro.

Código conceptual:

`administrative_site_missing`

##### Sede inactiva

```
site.is_active = false
→ DENEGAR
```

##### Asignación inactiva

```
employee_site.is_active = false
→ DENEGAR
```

##### Empleado inactivo

```
employees.is_active = false
→ DENEGAR
```

Aunque conserve asignaciones activas.

La auditoría encontró que los 15 empleados inactivos conservan actualmente asignaciones de sede activas. Esto obliga a validar siempre ambos estados.

##### Recurso sin sede

```
sede del recurso no resoluble
→ DENEGAR
```

##### Sede enviada por el cliente

```
p_site_id
→ dato solicitado
→ debe verificarse
```

Nunca será una prueba de autorización.

---

#### 23. Precedencia territorial

La precedencia conceptual será:

```
### 1. Sede real del recurso

### 2. Restricción del permiso

### 3. Sedes accesibles activas del empleado

### 4. Sede seleccionada para presentación

### 5. Sede primaria como valor predeterminado

```

##### Regla

```
sede seleccionada
no puede reemplazar
la sede del recurso
```

y:

```
sede primaria
no puede ampliar
las sedes accesibles
```

---

#### 24. Bypass permitidos

| Caso                              | Permitido |
| --------------------------------- | --------- |
| `role = gerente`                  | ❌         |
| `role = supervisor`               | ❌         |
| Sede primaria como permiso        | ❌         |
| Sede seleccionada como permiso    | ❌         |
| Cualquier sede del mismo tipo     | ❌         |
| Permiso administrativo específico | ✅         |
| Asignación multisede explícita    | ✅         |
| Acción excepcional auditada       | ✅         |
| Service role con actor autorizado | ✅         |

La auditoría encontró que `gerente` aparece directamente en aproximadamente 32 políticas RLS, y que algunas políticas permiten a un gerente modificar configuración operativa sin limitar explícitamente la sede.

---

#### 25. Comportamiento de denegación

Códigos conceptuales:

```
employee_inactive
base_role_missing
base_role_not_site_administrative
permission_not_granted
administrative_site_missing
site_assignment_inactive
site_inactive
site_not_allowed
resource_site
```

### ✅ AUTH-MOD-005 — Definir roles operativos

Estado

🟢 Aprobado

#### 1. Decisión

Vento OS reconoce oficialmente 12 roles operativos canónicos, agrupados en cuatro familias:

ROLES OPERATIVOS
├── Operación satélite
│   ├── cajero_satelite
│   ├── barista_satelite
│   ├── cocinero_satelite
│   ├── servicio_salon
│   ├── mostrador_satelite
│   └── operador_integral_satelite
│
├── Producción
│   ├── produccion_cocina
│   ├── produccion_panaderia
│   └── produccion_reposteria
│
├── Logística
│   ├── bodeguero
│   └── conductor_logistica
│
└── Coordinación operativa
    └── gerencia_operativa

El rol:

propietario_admin

queda oficialmente:

❌ No canónico
→ en proceso de deprecación
→ no debe recibir turnos ni permisos

#### 2. Regla principal

Un rol operativo representa una función ejecutada durante un turno, no un cargo permanente ni una identidad laboral.

EMPLEADO
        ↓
TURNO
        ↓
ROL OPERATIVO ASIGNADO
        ↓
SEDE + ÁREA
        ↓
CONTEXTO VÁLIDO
        ↓
ROL OPERATIVO EFECTIVO
Regla canónica
Rol operativo
≠ empleado
≠ rol base
≠ cargo contractual
≠ sede
≠ área
≠ aplicación
≠ permiso

#### 3. Catálogo operativo canónico

| Código                     | Familia      | Función principal                          | Área normalmente requerida |
| -------------------------- | ------------ | ------------------------------------------ | -------------------------- |
| cajero_satelite            | Satélite     | Caja y operación POS                       | Sí                         |
| barista_satelite           | Satélite     | Preparación de bebidas y barra             | Sí                         |
| cocinero_satelite          | Satélite     | Producción de cocina en punto de venta     | Sí                         |
| servicio_salon             | Satélite     | Atención y servicio de salón               | Sí                         |
| mostrador_satelite         | Satélite     | Atención, entrega y operación de mostrador | Sí                         |
| operador_integral_satelite | Satélite     | Operación integrada de formatos pequeños   | Depende de la sede         |
| produccion_cocina          | Producción   | Cocina caliente central                    | Sí                         |
| produccion_panaderia       | Producción   | Panadería y galletería                     | Sí                         |
| produccion_reposteria      | Producción   | Repostería y pastelería                    | Sí                         |
| bodeguero                  | Logística    | Bodega, inventario y preparación logística | Sí                         |
| conductor_logistica        | Logística    | Transporte y custodia en tránsito          | Puede usar área general    |
| gerencia_operativa         | Coordinación | Coordinación directa de la operación       | Depende de la sede         |

#### 4. Principios clave aprobados

Cada turno tiene un único rol operativo principal.
El rol operativo efectivo proviene exclusivamente del turno válido.
Los perfiles operativos no autorizan, solo sugieren.
Los dispositivos no asignan roles.
Un rol debe estar:
activo;
habilitado en la sede;
compatible con el área.
Un rol sin permisos no concede acciones.
No se crean roles por:
aplicación;
sede.
operador_integral_satelite no es un superusuario.
gerencia_operativa no es un bypass.
bodeguero se mantiene como rol operativo, no como rol base.
propietario_admin queda en proceso de eliminación.

#### 5. Modelo operativo aprobado

ROL OPERATIVO EFECTIVO

actor
+
turno
+
rol asignado
+
sede
+
área
+
check-in cuando aplique
**=**
contexto operativo válido

#### 6. Reglas de autorización

rol válido
+
permiso asignado
+
contexto válido
**=**
ACCESO

rol válido
+
sin permiso
**=**
DENEGAR

#### 7. Restricciones fundamentales

No se permite:
múltiples roles simultáneos en un turno;
derivar roles desde employees.role;
usar roles de dispositivo como autorización;
usar perfiles como fallback;
usar propietario_admin.
Ante ambigüedad:
→ DENEGAR

#### 8. Contrato aprobado

OperationalRoleDefinition
OperationalRoleDefinition
├── code
├── name
├── family
├── is_active
├── requires_shift
├── requires_area
├── requires_external_checkin
├── requires_external_checkout
├── is_integrated_role
└── deprecated_at
OperationalRoleAssignment
OperationalRoleAssignment
├── employee_id
├── shift_id
├── role_code
├── site_id
├── area_id
├── assigned_at
├── assigned_by
└── assignment_source
EffectiveOperationalRole
EffectiveOperationalRole
├── employee_id
├── shift_id
├── assigned_role_code
├── effective_role_code
├── site_id
├── area_id
├── role_valid
├── site_valid
├── area_valid
├── checkin_valid
├── permissions
└── blocked_reasons

#### 9. Impacto aprobado

Guards
actor
→ turno
→ rol
→ sede
→ área
→ permiso
RPC
Validación completa del contexto.
Denegación por defecto.
Auditoría obligatoria.
RLS
actor activo
AND contexto válido
AND permiso
AND recurso dentro de sede/área

#### 10. Resultado

CATÁLOGO CANÓNICO

Satélite       6 roles
Producción     3 roles
Logística      2 roles
Coordinación   1 rol
────────────────────
Total         12 roles
propietario_admin
→ deprecado

#### 11. Estado final

✅ Modelo de roles operativos definido
✅ Catálogo canónico establecido
✅ Reglas de asignación y validación aprobadas
✅ Separación completa entre rol base y rol operativo
✅ Base lista para definición de permisos (AUTH-RBAC)

### ✅ AUTH-MOD-006 — Definir casos híbridos administrativo-operativos

#### 1. Decisión

Vento OS no tendrá un tercer catálogo denominado:

roles_hibridos

Un caso híbrido se representa mediante la coexistencia de dos contextos independientes:

EMPLEADO
├── contexto administrativo permanente
│   ├── rol base
│   ├── permisos base
│   └── cobertura administrativa
│
└── contexto operativo temporal
    ├── turno activo
    ├── rol operativo
    ├── sede activa
    ├── área activa
    └── permisos operativos
Regla principal
ROL BASE
→ autoridad permanente

ROL OPERATIVO
→ función temporal

ACCIÓN SOLICITADA
→ determina cuál contexto debe autorizar

Los dos contextos pueden coexistir, pero no se fusionan.

#### 2. Qué es un caso híbrido

Existe un caso híbrido cuando un empleado:

tiene permisos administrativos permanentes derivados de su rol base; y
ejecuta una función operativa mediante un turno válido.

Ejemplos:

propietario + gerencia_operativa
gerente_general + gerencia_operativa
gerente + gerencia_operativa
supervisor + cajero_satelite
auxiliar_administrativa + bodeguero
contador + operador_integral_satelite

La combinación es válida solo si el rol operativo está habilitado para el empleado, la sede y el área.

#### 3. Qué no es un caso híbrido

No es un caso híbrido:

empleado con muchos permisos base
rol operativo con permisos de varias aplicaciones
rol llamado propietario_admin

Tampoco implica crear combinaciones como:

gerente_cajero
supervisor_bodeguero
propietario_operativo
administrador_produccion
Regla
Rol administrativo + rol operativo
≠ nuevo rol combinado

#### 4. Casos híbridos reconocidos

4.1 Administración global + operación

Aplica a:

propietario
gerente_general

Mantienen permisos administrativos globales y pueden asumir un rol operativo mediante turno.

No existen bypasses automáticos por jerarquía.

4.2 Administración por sede + operación

Aplica a:

gerente
supervisor

Pueden administrar sus sedes sin turno y operar durante una jornada.

El permiso administrativo no sustituye el operativo.

4.3 Rol funcional administrativo + operación

Aplica a:

auxiliar_administrativa
contador
marketing

Pueden asumir roles operativos temporalmente sin alterar su rol base.

#### 5. Dos contextos simultáneos

El sistema maneja:

AdministrativeContext
OperationalContext
Regla
AdministrativeContext
→ permanente

OperationalContext
→ temporal

#### 6. Clasificación obligatoria de cada acción

ACTION_AUTHORIZATION_MODE
├── administrative
├── operational
└── system

Cada acción pertenece a una sola modalidad.

#### 7. Prohibición de OR ambiguo

No se permite:

permiso administrativo
OR permiso operativo
OR rol privilegiado

Cada acción tiene una única vía de autorización.

#### 8. Acciones sobre recursos operativos

La modalidad depende de la acción, no del recurso.

MISMO RECURSO
├── acción administrativa
└── acción operativa

#### 9. Permisos administrativos de excepción

Permiten intervenir sin rol operativo.

Requieren:

actor_id
permission_code
resource_id
reason
auditoría completa

No pueden convertirse en bypass operativo.

#### 10. Independencia territorial

Sede administrativa
≠ sede operativa

No se amplían mutuamente.

#### 11. Área administrativa vs operativa

Área administrativa
≠ área operativa

No se transfieren automáticamente.

#### 12. Aplicaciones híbridas

Cada acción dentro de una aplicación define su modalidad.

No existe autorización global por aplicación.

#### 13. Acceso a la aplicación

permiso de acceso
≠ permisos internos

Cada acción se valida individualmente.

#### 14. Presentación del modo activo

La interfaz distingue:

contexto administrativo
contexto operativo

Sin permitir manipulación manual del contexto operativo.

#### 15. Cambio de modo

Cambiar de vista
≠ cambiar permisos

El modo lo determina la acción.

#### 16. Rol gerencia_operativa

Rol operativo temporal
No hereda permisos administrativos
Misma matriz para todos los roles base

#### 17. Igualdad operativa

Mismo rol operativo ⇒ mismas capacidades operativas.

El rol base no altera la operación.

#### 18. Permisos con mismo código

No se permite ambigüedad.

acción operativa
→ permiso operativo

acción excepcional
→ permiso administrativo distinto

#### 19. Ausencia de turno

AdministrativeContext → activo
OperationalContext → inexistente

No se reconstruye el contexto operativo.

#### 20. Fin del turno

permisos operativos → eliminados
permisos administrativos → permanecen

#### 21. Cambio de rol operativo

Solo cambia el contexto operativo.

El rol base permanece.

#### 22. Dispositivo compartido

acción disponible
= permisos del actor ∩ capacidades del dispositivo

El dispositivo puede restringir acciones.

#### 23. Simulación

Permite visualizar ambos contextos sin ejecutar acciones reales.

#### 24. Precedencia

Administrativo ≠ Operativo

No se cruzan.

#### 25. Falta de clasificación

authorization_mode_missing → DENEGAR

#### 26. Denegaciones

Siempre indican el contexto evaluado:

administrative
operational

#### 27. Bypass permitidos

Solo:

permisos administrativos de excepción
procesos técnicos controlados

Todo lo demás está prohibido.

#### 28. Contrato resultante

HybridAuthorizationContext

Define ambos contextos y la decisión final.

#### 29. Invariantes

No existen roles híbridos.
Un solo rol base por empleado.
Un solo rol operativo por turno.
Contextos independientes.
Cada acción tiene una modalidad.
No hay cruce entre permisos administrativos y operativos.
No hay OR ambiguo.
Las excepciones son explícitas y auditadas.
El turno no altera permisos administrativos.
El fin del turno elimina permisos operativos.

#### 30. Impacto en guards

Se separan:

requireAdministrativePermission
requireOperationalPermission
requireAdministrativeOverride

No existe hasAnyPermission.

#### 31. Impacto en RPC

Cada RPC declara:

authorization_mode
required_permission

#### 32. Impacto en RLS

Políticas separadas:

administrativas
operativas

Sin OR entre roles.

#### 33. Impacto en aplicaciones

Aplicaciones pueden ser:

administrativas
operativas
híbridas

Cada acción define su modalidad.

#### 34. Alternativas descartadas

Roles híbridos combinados
Unión de permisos
Prioridad por jerarquía
Bypass por rol
Cambio manual de modo

#### 35. Riesgos

Permisos sin clasificación
Bypass existentes
RLS hardcodeada
Acciones no diferenciadas
Caché de permisos

#### 36. Asuntos pendientes

Se mantienen las tareas siguientes del roadmap sin cambios.

#### 37. Decisión resumida

CASO HÍBRIDO
= rol base + turno operativo
= dos contextos independientes
ACCIÓN ADMINISTRATIVA → permisos base
ACCIÓN OPERATIVA → permisos del turno
ACCIÓN EXCEPCIONAL → permiso administrativo específico
NO EXISTE
rol híbrido
unión de permisos
bypass por jerarquía

✅ AUTH-MOD-006 aprobado
