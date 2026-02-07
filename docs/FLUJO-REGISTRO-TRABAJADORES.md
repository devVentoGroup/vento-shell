# Flujo definitivo: registro de trabajadores (empleados)

Documento de decisión para cómo entran los trabajadores al ecosistema Vento OS (Nexo, Origo, ANIMA, FOGO, etc.). Objetivo: **una sola forma clara, sencilla y escalable**, sin duplicar lógicas ni depender de flujos “temporales” por app.

---

## Estado actual

- **Nexo, Origo, Shell, etc.:** no tienen flujo de registro; los empleados se dan de alta manualmente en la base (o por un proceso externo).
- **ANIMA:** tiene un flujo de registro que aún está pendiente de aprobación.
- **Schema:** existe la tabla `staff_invitations` (token, email, full_name, staff_site_id, staff_role, status, expires_at, accepted_at, created_by) y `employees` (id = auth.uid(), site_id, role, full_name, …). Es decir, el modelo ya contempla “invitación” y “empleado activo”.

---

## Opciones posibles

| Opción | Descripción | Quién crea la cuenta | Pros | Contras |
|--------|-------------|----------------------|------|--------|
| **A. Solo admin** | Propietario/gerente crea el empleado en Shell (o en una app): pone email, nombre, sede, rol. La cuenta de acceso (auth) la crea el admin (ej. contraseña temporal) o se deja “sin login” hasta otro paso. | Admin (propietario/gerente) | Control total, sin autoregistro. | Si el admin crea la cuenta auth, tiene que repartir contraseñas; si no la crea, hay que definir cuándo y cómo el trabajador obtiene acceso. |
| **B. Invitación** | Admin crea una **invitación** (email, sede, rol, opcional nombre). El sistema envía un link con token. El trabajador abre el link, **se registra** (elige contraseña, completa nombre si falta) y al confirmar se crea `employees` + `employee_sites` y se marca la invitación como aceptada. | El **trabajador** (con link válido) | Escalable, claro, seguro: el admin decide quién entra y con qué rol; el trabajador solo completa sus datos. No hay “pendientes” sin contexto. El schema ya tiene `staff_invitations`. | Requiere implementar envío de link (email o copiar/pegar) y una pantalla “Aceptar invitación” en Shell (o app común). |
| **C. Autoregistro** | Cualquiera con el link (o en una app) se registra; queda en estado “pendiente de aprobación”. Un admin luego asigna sede y rol y lo aprueba. | El **trabajador** (sin invitación previa) | Muy fácil para el trabajador. | Muchas cuentas pendientes, trabajo manual de aprobación, riesgo de spam o cuentas huérfanas. Menos control. |
| **D. Híbrido** | Invitación para la mayoría; excepción “admin crea y envía credenciales” para casos puntuales. | Admin o trabajador según caso | Flexibilidad. | Dos flujos a mantener y explicar; más complejidad. |

---

## Decisión recomendada: **Invitación (B)** como flujo estándar

- **Quién decide quién entra:** solo **propietarios y gerentes** (igual que proveedores en Origo). Ellos crean la invitación (email, sede, rol).
- **Quién “se registra”:** el **trabajador**, pero **solo** si tiene un link de invitación válido (token en `staff_invitations`). No hay pantalla pública de “Regístrate” sin invitación.
- **Flujo en 3 pasos:**
  1. **Admin (Shell o app de personal):** “Invitar trabajador” → indica email, sede, rol (y opcional nombre) → el sistema crea fila en `staff_invitations` y genera un link (con token) que se envía por email o se copia para compartir.
  2. **Trabajador:** abre el link → llega a una pantalla “Completar registro” (solo si el token es válido y no expirado) → introduce/confirma nombre, contraseña → al enviar, se crea usuario en `auth.users` (Supabase), se crea fila en `employees` (id = auth.uid(), site_id, role, full_name desde invitación/datos), se crea `employee_sites`, se marca invitación como aceptada.
  3. **Trabajador:** ya puede iniciar sesión en Shell y usar las apps según su rol.

Ventajas de este flujo:

- **Claro:** una sola forma de entrar: “te invitan → abres el link → te registras”.
- **Escalable:** mismo flujo para todas las apps; no depende de que ANIMA (u otra) tenga un flujo distinto aprobado.
- **Seguro:** no hay autoregistro abierto; el admin controla quién tiene acceso y con qué rol/sede.
- **Alineado al schema:** reutiliza `staff_invitations` y evita inventar tablas nuevas.
- **Sencillo de explicar:** “Solo propietarios y gerentes invitan; el trabajador solo completa el registro con el link que le envían.”

---

## Qué implementar (cuando se implemente)

1. **En Shell (o en una app común “Personal/Staff”):**
   - Pantalla “Invitar trabajador” (solo para propietario/gerente_general/gerente): formulario email, sede, rol → INSERT en `staff_invitations` → generación de link con token → envío por email (o copiar link).
2. **Ruta pública (o con token en URL):** “Aceptar invitación” (ej. `/invite/[token]`):
   - GET: comprobar token válido y no expirado; si no, mensaje “Enlace inválido o expirado”.
   - Formulario: nombre (pre-rellenado si viene en la invitación), contraseña, confirmar contraseña.
   - POST: sign up en Supabase Auth con ese email; crear `employees` (id = nuevo user id, site_id/role/full_name desde invitación); crear `employee_sites`; actualizar `staff_invitations` (status = accepted, accepted_at = now()); redirigir a login o a Shell.
3. **RLS y permisos:** solo roles que puedan “gestionar personal” (propietario, gerente_general, gerente) pueden crear filas en `staff_invitations` y ver listado de invitaciones pendientes.

No hace falta autoregistro sin invitación ni pantalla “Regístrate” pública para trabajadores.

---

## ANIMA y otras apps

- Cuando ANIMA tenga su flujo aprobado, lo ideal es que **use el mismo criterio**: el trabajador entra al sistema solo por invitación (link desde Shell o desde ANIMA si ahí se gestionan invitaciones). Si ANIMA necesita un “registro” adicional (ej. datos de asistencia o dispositivo), que sea **después** de que el empleado ya exista en `employees` y haya aceptado la invitación. Así el “registro definitivo” sigue siendo uno solo (invitación + aceptar), y ANIMA solo añade pasos o datos extra en su propio flujo.

---

## Resumen en una frase

**Solo propietarios y gerentes invitan; el trabajador se “registra” únicamente al aceptar una invitación (link con token); no hay autoregistro público.** Implementación: pantalla “Invitar” en Shell + ruta “Aceptar invitación” con token + uso de `staff_invitations` y `employees`/`employee_sites`.
