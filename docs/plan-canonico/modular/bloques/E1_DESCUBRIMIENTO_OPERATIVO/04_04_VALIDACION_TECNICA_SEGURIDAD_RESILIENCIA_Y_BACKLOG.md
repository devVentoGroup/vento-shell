### MINI-BLOQUE — VALIDACIÓN TECNICA SEGURIDAD RESILIENCIA Y BACKLOG

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **validación tecnica seguridad resiliencia y backlog** dentro de **E1 DESCUBRIMIENTO OPERATIVO**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `CODE-AUD-016` a `CODE-AUD-020` — 5 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `CODE-AUD-016`: Ejecutar build, lint, tipos y pruebas disponibles por repositorio
- `CODE-AUD-017`: Auditar autorización, validación de servidor y exposición de datos
- `CODE-AUD-018`: Auditar operación offline, reintentos, concurrencia e idempotencia
- `CODE-AUD-019`: Vincular cada capacidad con su implementación actual verificable
- `CODE-AUD-020`: Crear backlog técnico y funcional trazable por repositorio
<!-- PLAN-SECTION-META:END -->

### ✅ CODE-AUD-016 — Ejecutar build, lint, tipos y pruebas disponibles por repositorio

**Estado:** APROBADO
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Tipo:** auditoría transversal de salud de build, análisis estático, tipos y pruebas declaradas  
**Dependencia anterior:** `CODE-AUD-015`  
**Continuidad reservada:** `CODE-AUD-017`  
**Fecha de corte:** 2026-07-24  
**Cambios en código, CI, despliegues o Supabase:** no realizados. Se instalaron dependencias locales ya declaradas para poder ejecutar la validación de NUMERA y Vento Group Web; no se modificaron manifiestos, lógica ni Supabase.

---

#### 1. Resultado de esta tarea

Se ejecutaron las validaciones declaradas y las equivalencias locales disponibles en los doce repositorios VENTO reconocidos. La evidencia separa:

- éxito de build o smoke build;
- éxito de typecheck;
- resultado de lint, incluidos avisos no bloqueantes;
- pruebas automatizadas declaradas;
- validación no disponible por ausencia de script;
- bloqueo de herramienta, dependencia o código.

La cadena de control resultante es:

```text
repositorio
→ scripts y dependencias declaradas
→ build / export o smoke build disponible
→ typecheck
→ lint
→ pruebas automatizadas disponibles
→ hallazgo trazable
→ backlog y puerta de regresión
```

No se interpreta una compilación exitosa como evidencia de flujo operativo, autorización, datos remotos o dispositivo físico. Es una evidencia local del corte indicado.

---

#### 2. Método y alcance ejecutado

1. Se inventariaron los scripts de cada `package.json`.
2. En aplicaciones Next se ejecutaron `npm run build`, `npm run lint` y `npx tsc --noEmit` cuando las dependencias estaban presentes.
3. En aplicaciones Expo se ejecutaron `npx expo export --platform android --output-dir <temporal> --clear` y `npx tsc --noEmit` cuando aplicaba. La exportación es un smoke build local, no un build firmado ni QA en dispositivo.
4. En VITAL se ejecutó `npm run ci:contracts`.
5. NUMERA y Vento Group Web recibieron `npm install` porque faltaban dependencias locales necesarias para completar la auditoría; la segunda ya declaraba `lenis` en su manifiesto.
6. No se ejecutaron builds EAS, despliegues, migraciones, pruebas contra Supabase remoto ni flujos manuales.

---

#### 3. Matriz de resultados por repositorio

| Repositorio       | Build o smoke build                | Typecheck                            | Lint                                       | Pruebas disponibles      | Resultado de corte                                     |
| ----------------- | ---------------------------------- | ------------------------------------ | ------------------------------------------ | ------------------------ | ------------------------------------------------------ |
| `vento-anima`     | ✅ export Android                   | ✅                                    | No declara script                          | No declara script        | validación local disponible aprobada                   |
| `vento-fogo`      | ✅                                  | ✅                                    | ✅ 8 warnings, 0 errores                    | No declara script        | build y tipos aprobados; deuda no bloqueante           |
| `vento-group-web` | ✅ después de instalar dependencias | ✅ después de instalar dependencias   | ❌ `next lint` no es compatible con Next 16 | No declara script        | build y tipos aprobados; herramienta de lint bloqueada |
| `vento-nexo`      | ❌                                  | ❌                                    | ❌ 54 errores, 128 warnings                 | No declara script        | bloqueo de tipos/build y deuda de lint                 |
| `vento-numera`    | ✅ después de instalar dependencias | ✅                                    | ✅                                          | No declara script        | validación local disponible aprobada                   |
| `vento-origo`     | ✅                                  | ✅                                    | ❌ 4 errores, 5 warnings                    | No declara script        | deuda de lint bloqueante                               |
| `vento-pass`      | ✅ export Android                   | ✅                                    | No declara script                          | No declara script        | validación local disponible aprobada                   |
| `vento-pulso`     | ✅                                  | ✅                                    | ❌ 20 errores                               | No declara script        | deuda de lint bloqueante                               |
| `vento-shell`     | ✅                                  | ✅                                    | ❌ 10 errores, 7 warnings                   | No declara script        | deuda de lint bloqueante                               |
| `vento-talento`   | ✅ export Android                   | ✅                                    | No declara script                          | No declara script        | validación local disponible aprobada                   |
| `vento-viso`      | ✅                                  | ✅                                    | ❌ 17 errores, 35 warnings                  | No declara script        | deuda de lint bloqueante                               |
| `vento-vital`     | No declara build raíz ejecutable   | No declara typecheck raíz ejecutable | No declara script                          | ✅ 13 de 13 contratos API | pruebas contractuales aprobadas                        |

`vento-vital` conserva estructura monorepo con scripts de build móvil remotos; no se ejecutaron porque son EAS/producción y no constituyen una prueba local disponible equivalente.

---

#### 4. Hallazgos confirmados

| ID               | Hallazgo                                                                                                                                                                                                                                                                                                     | Evidencia reproducida                                                                                                                                                                               | Impacto                                                                                                                                         | Destino obligatorio                    |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------- |
| `H-CODE-016-001` | Vento Group Web declara `lint=next lint`, pero Next 16 interpreta `lint` como directorio y no ejecuta análisis.                                                                                                                                                                                              | `npm run lint` termina con código 1: `Invalid project directory ... vento-group-web\\lint`. Build y tipos pasan tras sincronizar dependencias.                                                      | La calidad estática de este repositorio no tiene puerta ejecutable.                                                                             | `CODE-AUD-020` y `QA-REG-001`          |
| `H-CODE-016-002` | NEXO no puede completar typecheck ni build por una API de hoja de cálculo no presente en el tipo instalado.                                                                                                                                                                                                  | `src/app/api/inventory/catalog/export-suppliers/route.ts:423`: `Property 'dataValidations' does not exist on type 'Worksheet'`.                                                                     | La aplicación no tiene build de producción verificable.                                                                                         | `CODE-AUD-020` y `QA-REG-001`          |
| `H-CODE-016-003` | Cinco repositorios tienen errores de lint bloqueantes.                                                                                                                                                                                                                                                       | NEXO: 54; ORIGO: 4; PULSO: 20; SHELL: 10; VISO: 17.                                                                                                                                                 | La puerta estática no es verde aunque varios builds y tipos pasen.                                                                              | `CODE-AUD-020` y `QA-REG-001`          |
| `H-CODE-016-004` | FOGO pasa lint con deuda no bloqueante.                                                                                                                                                                                                                                                                      | 8 warnings y 0 errores.                                                                                                                                                                             | La puerta actual permite el build, pero la deuda debe priorizarse antes de endurecer CI.                                                        | `CODE-AUD-020`                         |
| `H-CODE-016-005` | NUMERA no tenía dependencias instaladas al inicio del corte; después de `npm install` pasa build, tipos y lint. La instalación reporta 8 vulnerabilidades y scripts de `sharp` y `unrs-resolver` pendientes de aprobación. Vento Group Web también reporta 4 vulnerabilidades y script de `sharp` pendiente. | `npm install` completado en ambos repositorios; no cambió el manifiesto.                                                                                                                            | La reproducibilidad local depende de instalar y revisar dependencias; los avisos no se deben resolver automáticamente mediante `npm audit fix`. | `CODE-AUD-020`                         |
| `H-CODE-016-006` | La mayor parte de los repositorios no declara pruebas automatizadas y los clientes Expo no declaran lint o build local en scripts.                                                                                                                                                                           | Solo VITAL declara y ejecuta pruebas: 13/13 contratos API. ANIMA, PASS y TALENTO solo aportan export Android y tipos; FOGO, Group Web, NEXO, NUMERA, ORIGO, PULSO, SHELL y VISO no declaran `test`. | La evidencia de build no protege regresiones de proceso, autorización o integración.                                                            | `QA-REG-001` después de `CODE-AUD-020` |

---

#### 5. Clasificación de resultados

```text
APROBADO LOCALMENTE
ANIMA, FOGO, NUMERA, PASS, TALENTO y VITAL

APROBADO CON BLOQUEO DE HERRAMIENTA
Vento Group Web: build y tipos verdes; lint no ejecutable por script obsoleto

BLOQUEADO POR CÓDIGO
NEXO: typecheck y build fallan en exportación de catálogo

BLOQUEADO POR LINT
NEXO, ORIGO, PULSO, SHELL y VISO

EVIDENCIA DE PRUEBAS DISPONIBLE
VITAL: 13 contratos API aprobados
```

FOGO queda en estado de observación: sus ocho warnings no bloquean la configuración actual, pero no equivalen a calidad limpia.

---

#### 6. Decisiones propuestas

1. La matriz de esta tarea será la baseline local de calidad del corte 2026-07-24.
2. Un build o export exitoso no cerrará deuda de lint ni sustituirá pruebas de flujo.
3. NEXO no podrá declararse apto para build de producción hasta resolver `H-CODE-016-002`.
4. Vento Group Web deberá reemplazar o actualizar su comando de lint antes de exigir una puerta verde.
5. Los errores de lint se deberán descomponer por repositorio y propietario en `CODE-AUD-020`; no se corregirán silenciosamente durante esta auditoría.
6. Los warnings de FOGO y los avisos de vulnerabilidades o scripts de instalación se registrarán como deuda, sin ejecutar `npm audit fix` ni aprobar scripts automáticamente.
7. `QA-REG-001` deberá definir la matriz mínima de CI y pruebas de regresión después de `CODE-AUD-020`.
8. No se modificará código, CI, despliegues ni Supabase como consecuencia de esta tarea documental.
9. `CODE-AUD-017` permanecerá como continuidad reservada.

---

#### 7. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea registra evidencia de validaciones ya existentes y sus brechas; no introduce ni modifica una regla de negocio, autorización, cálculo, transición, contrato de integración o comportamiento ejecutable. La definición de la matriz y de las puertas de regresión corresponde a `QA-REG-001` después de `CODE-AUD-020`.

---

#### 8. Límites de certeza

Esta tarea no confirma:

- que los builds aprobados se conecten correctamente a Supabase remoto;
- que las variables locales representen staging o producción;
- que los flujos operativos, permisos, RLS o RPC estén correctos;
- que las exportaciones Expo funcionen en dispositivos físicos;
- que los builds EAS remotos funcionen;
- que la ausencia de script `test` implique ausencia total de pruebas fuera del repositorio;
- que los avisos de `npm audit` sean explotables en el contexto de cada aplicación;
- que aprobar scripts nativos pendientes sea seguro sin revisión de dependencias;
- que las reglas de lint identificadas sean todas defectos funcionales.

La autorización y la exposición de datos continúan reservadas para `CODE-AUD-017`; la operación offline para `CODE-AUD-018`; la asignación de implementación verificable para `CODE-AUD-019`; y el backlog propietario para `CODE-AUD-020`.

---

#### 9. Criterios de aceptación

`CODE-AUD-016` podrá aprobarse cuando:

- los doce repositorios reconocidos tengan resultado explícito de build, smoke build, tipos, lint y pruebas disponibles o ausencia declarada;
- los resultados distingan éxito, warning, bloqueo de herramienta, bloqueo de código y validación no disponible;
- NEXO tenga evidencia exacta de su bloqueo de build y tipos;
- Vento Group Web tenga evidencia exacta de su bloqueo de lint;
- la deuda de lint por repositorio tenga conteo y destino;
- las instalaciones necesarias estén diferenciadas de cambios de código;
- las limitaciones de Expo, EAS, CI y Supabase remoto estén declaradas;
- cada hallazgo tenga destino documental exacto;
- se declare expresamente que no genera requisitos de prueba nuevos;
- no se modifique código, CI, despliegues ni Supabase;
- `CODE-AUD-017` permanezca como continuidad reservada.

---

#### 10. Resultado y continuidad

Al aprobarse quedará definida la cadena:

```text
estado local de calidad
→ hallazgo reproducible
→ repositorio propietario
→ backlog técnico
→ matriz de regresión y CI
→ corrección controlada
→ nueva validación
```

La continuidad reservada será:

```text
CODE-AUD-017
— Auditar autorización, validación de servidor y exposición de datos
```


### ✅ CODE-AUD-017 — Auditar autorización, validación de servidor y exposición de datos

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Tipo:** auditoría transversal de autorización efectiva, límites privilegiados, RLS, grants, contratos de servidor y exposición de datos  
**Dependencia anterior:** `CODE-AUD-016` — APROBADA  
**Continuidad reservada:** `CODE-AUD-018`  
**Fecha de corte:** 2026-07-24  
**Proyecto Supabase comprobado:** `vento-os-dev` (`clzdpinthhtknkmefsxx`)  
**Cambios en código, CI, despliegues o Supabase:** no realizados. Las consultas remotas fueron de solo lectura; no se invocaron mutaciones, RPC operativas, Edge Functions, webhooks, jobs ni enlaces productivos.

---

#### 1. Resultado de esta tarea

Esta tarea contrasta las protecciones declaradas en código con la autorización que realmente aplican las fronteras de servidor y Supabase:

```text
actor autenticado o enlace externo
→ entrada de aplicación, API, Edge Function o RPC
→ validación de identidad
→ permiso y alcance territorial
→ política RLS, grant o privilegio elevado
→ columnas y datos efectivamente accesibles
→ efecto autorizado o denegación
```

La auditoría identifica tres categorías:

1. **fallos confirmados**, porque la combinación vigente de código, grants, políticas o funciones permite una acción más amplia que el contrato empresarial;
2. **controles condicionales o fail-open**, porque la protección depende de que exista un secreto y, si falta, la ejecución continúa;
3. **controles correctos localizados**, que se conservan para evitar falsos positivos y para usarlos como referencia de implementación.

Resultado consolidado:

| Clasificación                     | Cantidad |
| --------------------------------- | -------: |
| hallazgos críticos confirmados    |    **3** |
| hallazgos altos confirmados       |    **8** |
| controles condicionales fail-open |    **3** |
| hallazgos medios o de gobierno    |    **3** |
| controles positivos explícitos    |    **6** |

Los hallazgos críticos confirmados son:

1. la aceptación de invitaciones laborales permite que el cuerpo enviado por el cliente proponga `role` y `site_id`, y después usa `service_role` para materializarlos en `employees`;
2. `public.users` permite que cada usuario autenticado actualice su propia fila completa, incluyendo campos que no deben ser autoadministrables como `loyalty_points`, `role` e `is_active`;
3. `pass.loyalty_transactions` permite inserciones directas del propio usuario y un trigger `SECURITY DEFINER` aplica `points_delta` al saldo de `public.users`.

Estos tres hallazgos constituyen bloqueos de seguridad. No deberán esperar a una remodelación visual ni a una prueba operativa para ser reconocidos.

---

#### 2. Alcance y fuentes contrastadas

La auditoría revisó:

- políticas RLS de tablas críticas;
- grants de `anon`, `authenticated` y `service_role`;
- columnas y constraints relevantes;
- funciones `SECURITY DEFINER`;
- permisos `EXECUTE`;
- vistas con y sin `security_invoker`;
- buckets y políticas de `storage.objects`;
- configuración `verify_jwt` de las 24 Edge Functions activas;
- fuente remota de Edge Functions sin código local canónico;
- Server Actions y rutas que construyen clientes privilegiados;
- contratos de perfil, fidelización, documentos, compras, pedidos, dispositivos y asistencia;
- búsquedas de secretos literales en los repositorios;
- visibilidad de repositorios;
- decisiones aprobadas en `CODE-AUD-001` a `CODE-AUD-016`.

Se excluyeron:

- VITAL, salvo para conservar su separación;
- AURA, porque no existe implementación;
- explotación activa;
- lectura o descarga de objetos de Storage;
- intentos de escalamiento;
- creación de usuarios, invitaciones, transacciones, redenciones, órdenes o documentos;
- ejecución de funciones sin JWT;
- inspección del valor de secretos remotos.

La ausencia de una prueba ofensiva no reduce la certeza cuando el defecto se demuestra directamente por código, grants y política vigente.

---

#### 3. Estados de certeza

| Estado                     | Significado                                                               |
| -------------------------- | ------------------------------------------------------------------------- |
| `CONFIRMADO`               | la definición vigente permite o expone el comportamiento                  |
| `CONDICIONAL`              | el riesgo depende de configuración o secreto no inspeccionado             |
| `CONTROL_PRESENTE`         | existe autenticación o autorización explícita suficiente a nivel estático |
| `REQUIERE_PRUEBA_NEGATIVA` | el contrato parece correcto, pero debe ejecutarse con actores denegados   |
| `GOBIERNO`                 | requiere decisión de visibilidad, propiedad, versionado o retiro          |
| `FUERA_DE_ALCANCE`         | no pertenece a Vento OS o no existe implementación                        |

Ningún hallazgo se clasifica solo por el nombre de una función, tabla, rol o política.

---

#### 4. Escalamiento de privilegios durante la aceptación de invitaciones

La Edge Function `staff-invitations-accept`:

1. valida que exista un usuario autenticado;
2. acepta `role` y `site_id` desde el cuerpo enviado por el cliente o desde `user_metadata`;
3. comprueba únicamente que el rol y la sede existan y estén activos;
4. actualiza `auth.users.user_metadata`;
5. hace `upsert` de `employees` con ese rol y esa sede;
6. crea o actualiza la sede primaria del trabajador;
7. intenta marcar una invitación como aceptada después de materializar la identidad laboral.

No existe una lectura previa obligatoria de una invitación pendiente, vigente, vinculada al correo o usuario, cuyo rol y sede sean la única fuente aceptada.

Consecuencia:

```text
usuario autenticado
→ propone role y site_id
→ función valida existencia, no asignación
→ service_role materializa employees.role y employees.site_id
```

Clasificación: **CRÍTICA — CONFIRMADA**.

El contrato correcto deberá ser:

```text
token o sesión autenticada
→ invitación pendiente y vigente localizada en servidor
→ identidad, rol, sede y demás alcance tomados de la invitación
→ consumo atómico de la invitación
→ creación laboral
→ imposibilidad de elevar o sustituir valores desde el cliente
```

Destinos obligatorios:

- `ANIMA-AUTH-019 — Evitar que ANIMA otorgue permisos directamente`;
- `ANIMA-AUTH-020 — Mantener Supabase como fuente de verdad`;
- `AUTH-SRV-004 — Eliminar confianza exclusiva en la interfaz`;
- `AUTH-SRV-005 — Validar permiso en cada escritura`;
- `AUTH-SRV-006 — Validar sede en cada escritura`;
- `SUPA-AUD-010 — Auditar Auth, usuarios, identidades, sesiones y vínculos empresariales`;
- `SUPA-AUD-011 — Auditar identidades de trabajadores, clientes, dispositivos y actores de sistema`;
- `AUTH-DB-002 — Endurecer políticas RLS demasiado amplias aprobadas para corrección`;
- `AUTH-DB-004 — Reducir grants innecesarios de authenticated`;
- `CODE-AUD-020`;
- `TREQ-AUTH-005`.

**Puerta inmediata propuesta:** no ampliar el flujo de invitaciones a nuevos actores hasta que el rol y la sede queden vinculados en servidor a una invitación válida.

---

#### 5. Autoadministración excesiva de `public.users`

La tabla `public.users` contiene, entre otros:

- identidad y contacto;
- documento;
- fecha de nacimiento;
- correo;
- `role`;
- `is_active`;
- `loyalty_points`;
- preferencias y metadatos.

La combinación vigente es:

```text
grant UPDATE para authenticated
+
users_update_self
USING id = auth.uid()
WITH CHECK id = auth.uid()
```

La política restringe la fila, pero no las columnas. Por tanto, el propietario de la fila puede enviar una actualización que incluya campos no autoadministrables.

El código legítimo de PASS solo necesita modificar un subconjunto de perfil:

- `full_name`;
- `document_id`;
- `phone`;
- `birth_date`.

Ese caso no justifica conceder actualización general sobre toda la fila.

Clasificación:

- modificación de `loyalty_points`: **CRÍTICA — CONFIRMADA**;
- modificación de `role` o `is_active`: **ALTA — CONFIRMADA** como ruptura de integridad de identidad, aunque la autorización laboral principal use `employees`;
- actualización de datos de perfil permitidos: capacidad válida que debe conservarse mediante contrato limitado.

Contrato objetivo:

```text
cliente
→ RPC o acción de servidor de perfil
→ allowlist de campos editables
→ validación y normalización
→ columnas protegidas fuera del payload
```

Destinos:

- `PASS-INT-004 — Definir administración laboral de clientes cuando corresponda`;
- `PASS-INT-005 — Evitar mezclar identidad cliente y trabajador`;
- `AUTH-SRV-004`;
- `AUTH-SRV-005`;
- `SUPA-AUD-009 — Inventariar políticas RLS, grants y privilegios por rol`;
- `SUPA-AUD-010`;
- `AUTH-DB-002`;
- `AUTH-DB-004`;
- `TREQ-AUTH-006`.

---

#### 6. Lectura excesiva de datos personales de clientes

`public.users` permite lectura mediante:

- `users_select_self`;
- políticas específicas de caja;
- `staff_select_all_users`, cuyo criterio es `is_active_staff()`.

`is_active_staff()` no exige una capacidad concreta de atención, caja, fidelización o consulta de clientes. La política expone la fila completa y no una proyección mínima.

Los campos disponibles incluyen:

- nombre;
- documento;
- teléfono;
- correo;
- fecha de nacimiento;
- saldo de puntos;
- estado y metadatos.

PULSO ya demuestra un patrón más adecuado: una Server Action valida `pulso.pos.main` para una sede y devuelve solo una proyección concreta del cliente escaneado. Sin embargo, ese control de aplicación no elimina la política amplia de base.

Clasificación: **ALTA — CONFIRMADA**.

Contrato objetivo:

```text
capacidad autorizada
→ búsqueda por identificador permitido
→ proyección mínima para el proceso
→ sin SELECT general de toda la tabla
→ auditoría del actor y la sede cuando corresponda
```

Destinos:

- `PULSO-AUTH-006 — Definir permisos de cajero`;
- `PULSO-AUTH-009 — Proteger acumulación de puntos`;
- `PULSO-AUTH-010 — Proteger redenciones`;
- `PASS-INT-004`;
- `AUTH-SRV-005`;
- `AUTH-SRV-006`;
- `AUTH-DB-002`;
- `AUTH-DB-004`;
- `TREQ-AUTH-006`.

---

#### 7. Escritura directa del ledger de fidelización

`pass.loyalty_transactions` permite:

```text
INSERT
WITH CHECK auth.uid() = user_id
```

La fila incluye:

- `kind`;
- `points_delta`;
- descripción;
- metadatos.

El constraint valida forma básica, pero no prueba que el incremento provenga de una venta, ajuste autorizado o evento económico legítimo.

Después de cada inserción, el trigger:

```text
on_loyalty_transaction_created
→ pass.update_loyalty_balance()
→ public.users.loyalty_points += new.points_delta
```

Consecuencia:

```text
cliente autenticado
→ inserta transacción propia con points_delta positivo
→ trigger privilegiado actualiza saldo
```

Clasificación: **CRÍTICA — CONFIRMADA**.

Debe revocarse la escritura directa del cliente sobre el ledger. La acumulación, ajuste, gasto y reversión deberán ejecutarse mediante contratos de servidor diferenciados, con actor, origen, idempotencia, referencia y autorización.

Destinos:

- `PULSO-AUTH-009`;
- `PULSO-AUTH-010`;
- `PASS-INT-001 — Definir integración PULSO → PASS para acumulación`;
- `PASS-INT-002 — Definir integración PULSO → PASS para redención`;
- `PASS-QA-001 — Probar flujo completo de acumulación`;
- `PASS-QA-002 — Probar flujo completo de redención`;
- `AUTH-SRV-004`;
- `AUTH-SRV-005`;
- `AUTH-DB-002`;
- `AUTH-DB-004`;
- `TREQ-PASS-008`.

---

#### 8. Redención no atómica y validación de personal demasiado amplia

PASS procesa actualmente una redención desde el cliente mediante varios pasos:

1. lee recompensa;
2. lee saldo;
3. genera QR;
4. inserta `loyalty_redemptions`;
5. inserta `loyalty_transactions`;
6. intenta eliminar la redención si falla la transacción.

La compensación desde el cliente no constituye una transacción atómica y puede dejar diferencias ante cierre de aplicación, red, concurrencia o fallo parcial.

Además, conviven políticas específicas por rol y sede con:

```text
staff_select_all_redemptions
staff_validate_redemptions
```

Las políticas RLS permisivas se combinan con OR. La política general para cualquier trabajador activo amplía las específicas y permite que personal sin capacidad de caja o fuera de la sede vea o valide redenciones.

Clasificación:

- falta de atomicidad: **ALTA — CONFIRMADA**;
- ampliación por política permisiva: **ALTA — CONFIRMADA**.

Contrato objetivo:

```text
RPC o acción de servidor
→ recompensa activa y sede válida
→ saldo bloqueado o cálculo transaccional
→ redención + ledger en una transacción
→ idempotency key
→ validación limitada a permiso, sede y estado
→ evento de auditoría
```

Destinos:

- `PULSO-AUTH-009`;
- `PULSO-AUTH-010`;
- `PASS-INT-001`;
- `PASS-INT-002`;
- `PASS-QA-001`;
- `PASS-QA-002`;
- `AUTH-DB-002`;
- `AUTH-DB-004`;
- `CODE-AUD-018`;
- `TREQ-PASS-008`.

---

#### 9. Documentos laborales: política amplia y bucket público

La tabla `public.documents` permite selección cuando el actor:

- es propietario o destinatario;
- tiene permisos administrativos;
- o simplemente pertenece de forma activa a la misma sede del documento.

La pertenencia a una sede no equivale a autorización para leer documentos personales de otros trabajadores.

El bucket `documents` está configurado como público. En un bucket público, una URL conocida no depende de la política SELECT de `storage.objects`. Esto invalida la expectativa de que RLS de Storage proteja el contenido confidencial.

No se descargaron objetos ni se confirmó que todos sean sensibles. El defecto es el contrato de exposición:

```text
documento laboral
→ ruta en bucket público
→ acceso anónimo por URL conocida
```

Clasificación:

- política de metadatos por simple pertenencia de sede: **ALTA — CONFIRMADA**;
- bucket público para documentos laborales: **ALTA — CONFIRMADA** como superficie de exposición; la sensibilidad de cada objeto deberá inventariarse.

Contrato objetivo:

```text
tipo documental y sensibilidad
→ bucket privado
→ objeto vinculado a propietario y recurso
→ permiso por actor, proceso y alcance
→ URL firmada o proxy de servidor de corta duración
→ auditoría de consulta
→ retención y eliminación
```

Destinos:

- `ANIMA-UX-013 — Simplificar documentos y datos personales`;
- `EVID-ARC-001` a `EVID-ARC-010`;
- `SUPA-AUD-012 — Auditar buckets, rutas, políticas y ciclos de vida de Storage`;
- `AUTH-DB-002`;
- `AUTH-DB-004`;
- `AUTH-DB-005`;
- `TREQ-SUPABASE-004`.

---

#### 10. Vistas administrativas sin `security_invoker`

Cuatro vistas no declaran `security_invoker=true`:

- `permission_catalog_human_v1`;
- `shared_operational_device_actor_policies_admin_v1`;
- `shared_operational_device_templates_admin_v1`;
- `shared_operational_devices_admin_v1`.

Las cuatro son propiedad de un rol privilegiado y permiten `SELECT` a `authenticated`.

Las tres vistas de dispositivos compartidos exponen información administrativa como:

- identificadores de dispositivo;
- `auth_user_id`;
- sede y área;
- aplicaciones permitidas;
- políticas de actor;
- banderas de PIN, sesión y acciones;
- metadatos.

Una vista sin `security_invoker` puede ejecutar con privilegios del propietario y eludir las políticas RLS de las tablas subyacentes.

Clasificación:

- vistas administrativas de dispositivos: **ALTA — CONFIRMADA**;
- catálogo humano de permisos: **REQUIERE DECISIÓN**, porque la lectura puede ser deliberadamente pública para usuarios autenticados, pero debe quedar explícita.

Destinos:

- `SUPA-AUD-003`;
- `SUPA-AUD-007`;
- `SUPA-AUD-009`;
- `AUTH-DB-002`;
- `AUTH-DB-004`;
- `AUTH-DB-005`;
- `AUTH-DEV-*`;
- `TREQ-SUPABASE-005`.

---

#### 11. RPC privilegiadas ejecutables por `anon`

Se localizaron funciones `SECURITY DEFINER` ejecutables por `anon` sin una guarda interna de autenticación, entre ellas:

- `get_site_cost_center`;
- `resolve_internal_transfer_price`;
- `resolve_internal_transfer_price_for_profile`;
- `assert_inventory_uom_profile_stock_input`;
- `shared_device_actor_is_allowed_v1`.

El riesgo varía:

| Función                                    | Exposición                                             |
| ------------------------------------------ | ------------------------------------------------------ |
| `get_site_cost_center`                     | identificador interno de centro de costo por sede      |
| `resolve_internal_transfer_price*`         | precios internos, moneda, listas y factores            |
| `assert_inventory_uom_profile_stock_input` | existencia y conversión de perfiles/ubicaciones        |
| `shared_device_actor_is_allowed_v1`        | inferencia de elegibilidad de trabajador y dispositivo |

La exposición de precios internos a `anon` no corresponde a un contrato público aprobado.

Clasificación: **ALTA — CONFIRMADA** para precios y centros de costo; **MEDIA — CONFIRMADA** para inferencias de validación.

Destinos:

- `SUPA-AUD-003`;
- `SUPA-AUD-006`;
- `SUPA-AUD-007`;
- `SUPA-AUD-009`;
- `AUTH-DB-003`;
- `AUTH-DB-005`;
- `TREQ-SUPABASE-005`.

---

#### 12. Órdenes de compra con autorización genérica de trabajador

`public.purchase_orders` tiene una política `ALL` cuyo criterio es únicamente que exista una fila en `employees` con el identificador del actor.

No exige:

- trabajador activo;
- permiso de ORIGO;
- rol;
- sede;
- centro de costo;
- alcance sobre la orden;
- estado permitido;
- separación entre consulta, creación, aprobación, recepción, corrección o eliminación.

Clasificación: **ALTA — CONFIRMADA**.

Contrato objetivo:

```text
acción sobre orden
→ permiso ORIGO específico
→ sede o centro de costo autorizado
→ estado actual compatible
→ campos permitidos para la transición
→ actor y auditoría
```

Destinos:

- `ORIGO-AUTH-004` a `ORIGO-AUTH-010`;
- `AUTH-SRV-005`;
- `AUTH-SRV-006`;
- `AUTH-SRV-011`;
- `AUTH-SRV-012`;
- `AUTH-DB-002`;
- `AUTH-DB-004`;
- `TREQ-ORIGO-002`.

---

#### 13. Enlace público de PDF de orden de compra

La ruta de PDF permite:

- sesión autenticada con `origo.access`;
- o token público firmado.

Cuando el token es válido, la ruta usa `service_role` para leer la orden, líneas, productos, proveedor y sede.

El helper del token:

- admite una vigencia de 30 días;
- usa HMAC;
- pero, si no existen secretos de ambiente, termina usando una cadena predeterminada incorporada al código.

Esto es un patrón fail-open: la ausencia de configuración no bloquea la generación ni validación; vuelve predecible el secreto.

No se comprobó si producción tiene configurado un secreto real. Por tanto:

- defecto de diseño: **ALTO — CONFIRMADO**;
- explotación actual: **CONDICIONAL**.

Contrato objetivo:

```text
secreto obligatorio
→ fallo de arranque o 500 si falta
→ token de alcance único para una orden
→ expiración corta y explícita
→ revocación o rotación
→ contenido mínimo para proveedor
→ auditoría de emisión y acceso
```

Destinos:

- `ORIGO-AUTH-009`;
- `ORIGO-AUTH-010`;
- `SUPA-AUD-015 — Auditar extensiones, secretos, variables y configuración del proyecto`;
- `AUTH-SRV-011`;
- `CODE-AUD-020`;
- `TREQ-ORIGO-002`.

---

#### 14. Mutación amplia de pedidos y líneas

Las políticas de `public.orders` y `public.order_items` permiten a cualquier trabajador con acceso a la sede actualizar la fila completa.

El criterio de sitio es necesario, pero no suficiente. Las filas contienen campos relacionados con:

- estado;
- despacho;
- pago;
- total;
- fidelización;
- inventario;
- anulación;
- entrega;
- referencias externas;
- precios, cantidades y compensaciones.

La base no distingue en la política si el actor está autorizado para cambiar un estado operativo, modificar un precio, marcar pago, alterar fidelización o anular.

Clasificación: **ALTA — CONFIRMADA**.

Contrato objetivo:

```text
acción nombrada
→ permiso específico
→ sede activa
→ estado de origen
→ transición permitida
→ columnas limitadas
→ RPC transaccional
→ evento de auditoría
```

Destinos:

- `PULSO-AUTH-006` a `PULSO-AUTH-011`;
- `AUTH-SRV-005`;
- `AUTH-SRV-006`;
- `AUTH-SRV-011`;
- `AUTH-SRV-012`;
- `AUTH-DB-002`;
- `AUTH-DB-004`;
- `CODE-AUD-018`;
- `TREQ-PULSO-004`.

---

#### 15. Administración de autorización sin alcance territorial suficiente

Las políticas de:

- `employee_site_operational_profiles`;
- `site_operational_roles`;
- `operational_role_permissions`;

permiten administración a `is_manager()`, `is_manager_or_owner()` o equivalentes.

La función `is_manager()` identifica el rol `gerente`, pero la política no limita la fila administrada a la sede del gerente.

Consecuencia:

```text
gerente de una sede
→ política global de administración
→ posibilidad de modificar configuración de otras sedes o filas globales
```

Clasificación: **ALTA — CONFIRMADA**.

Destinos:

- `VISO-AUTH-005` a `VISO-AUTH-009`;
- `VISO-AUTH-018`;
- `VISO-AUTH-019`;
- `VISO-UX-013`;
- `AUTH-SRV-005`;
- `AUTH-SRV-006`;
- `AUTH-SRV-012`;
- `AUTH-DB-002`;
- `TREQ-AUTH-007`.

---

#### 16. Edge Functions con `verify_jwt=false`

Las 24 Edge Functions activas se distribuyen así:

```text
12 con verify_jwt=true
12 con verify_jwt=false
```

La revisión de las doce sin JWT automático produjo:

| Función                     | Control propio                              | Resultado                                                   |
| --------------------------- | ------------------------------------------- | ----------------------------------------------------------- |
| `staff-invitations-accept`  | bearer válido                               | autenticación presente, autorización de rol/sede defectuosa |
| `document-alerts`           | secreto cron opcional                       | fail-open si falta el secreto                               |
| `process-account-deletions` | bearer igual a secreto obligatorio          | control presente                                            |
| `register-push-token`       | bearer validado con `auth.getUser`          | control presente                                            |
| `announcement-notify`       | bearer + rol de gestión activo              | control presente                                            |
| `employee-delete`           | bearer + UID propietario configurado        | control presente, contrato rígido                           |
| `payments-webhook`          | checksum del proveedor obligatorio          | control presente                                            |
| `staff-invitations-resend`  | bearer + rol + sede para gerente            | control presente                                            |
| `staff-invitations-cancel`  | bearer + rol + sede para gerente            | control presente                                            |
| `shift-runtime-processor`   | secreto cron opcional                       | fail-open si no existe secreto en tabla ni ambiente         |
| `payments-return`           | superficie pública sin mutación             | exposición deliberada aceptable                             |
| `delivery-portal`           | token aleatorio hasheado + expiración + PIN | control presente; fuente solo remota                        |

`document-alerts` y `shift-runtime-processor` usan el patrón:

```text
si existe secreto y no coincide → denegar
si no existe secreto → continuar
```

Esto debe convertirse en:

```text
si no existe secreto → fallar
si no coincide → denegar
si coincide → ejecutar
```

Clasificación:

- dos funciones cron: **ALTA — CONDICIONAL**;
- `staff-invitations-accept`: cubierta por el hallazgo crítico;
- las demás: `CONTROL_PRESENTE` o superficie pública deliberada.

Destinos:

- `SUPA-AUD-014`;
- `SUPA-AUD-015`;
- `AUTH-DB-003`;
- `AUTH-DB-005`;
- `CODE-AUD-020`;
- `TREQ-SUPABASE-006`.

---

#### 17. `delivery-portal`: contrato razonable, pero fuente solo remota

La función remota usa:

- token aleatorio de 32 bytes;
- almacenamiento del hash;
- vigencia de 12 horas;
- bloqueo por estado;
- PIN hasheado para confirmar entrega;
- contador máximo de intentos;
- eventos de auditoría;
- validación del estado y pago antes de tránsito.

No se clasifica como exposición sin control.

Sin embargo:

- la Edge Function existe solo en remoto;
- su código no está versionado en el directorio canónico de `vento-shell`;
- la URL del proyecto está incrustada en el RPC generador;
- el contrato debe quedar reproducible mediante migración y fuente local.

Clasificación: **GOBIERNO / DRIFT**, no vulnerabilidad confirmada.

Destinos:

- `SUPA-AUD-014`;
- `SUPA-AUD-016`;
- `SUPA-AUD-017`;
- `CODE-AUD-020`;
- mantiene `TREQ-SUPABASE-003`.

---

#### 18. Controles positivos que deben conservarse

##### 18.1. Cliente administrativo de VISO

`createAdminClient()`:

- importa `server-only`;
- exige `SUPABASE_SERVICE_ROLE_KEY`;
- no persiste sesión;
- no tiene fallback público.

Estado: `CONTROL_PRESENTE`.

El control debe complementarse con validación obligatoria antes de cada consumidor.

##### 18.2. Identificación de cliente en PULSO

La Server Action:

- valida sesión;
- exige `pulso.pos.main` para la sede recibida;
- usa cliente privilegiado solo después de autorizar;
- devuelve una proyección limitada.

Estado: `CONTROL_PRESENTE`, aunque la política general de `public.users` siga siendo demasiado amplia.

##### 18.3. Registro de push token

`register-push-token` valida manualmente el bearer mediante `auth.getUser` y vincula la escritura al usuario autenticado.

Estado: `CONTROL_PRESENTE`.

##### 18.4. Webhook de pagos

`payments-webhook`:

- falla si no existe secreto;
- verifica checksum;
- registra eventos;
- detecta duplicados;
- resuelve la transacción antes de cambiar su estado.

Estado: `CONTROL_PRESENTE`; concurrencia e idempotencia completas continúan a `CODE-AUD-018`.

##### 18.5. Funciones `SECURITY DEFINER`

Las funciones `SECURITY DEFINER` de los esquemas revisados tienen `search_path` fijado.

Estado: **control transversal positivo**. No sustituye la revisión de grants ni autorización interna.

##### 18.6. Esquema `viso`

Las tablas internas de planificación del esquema `viso` no conceden acceso ordinario a `authenticated`. Sus consumidores localizados usan cliente administrativo en servidor.

Estado: `CONTROL_PRESENTE`, sujeto a que todos los endpoints conserven la guarda previa.

---

#### 19. Repositorios públicos y secretos

El inventario mantiene diez repositorios públicos y dos privados.

La búsqueda no localizó una `service_role` real escrita literalmente en los archivos revisados. Sí localizó:

- referencias a variables de ambiente;
- scripts que leen `.env.local`;
- un secreto de desarrollo predeterminado para PDF de ORIGO;
- esquema, migraciones, nombres de funciones, políticas y arquitectura en repositorios públicos.

Un repositorio público no constituye por sí solo una vulnerabilidad. Sí incrementa la obligación de:

- eliminar fallbacks secretos;
- aplicar mínimo privilegio;
- no depender de ocultar nombres;
- definir una política de visibilidad;
- revisar historial Git, no solo el estado actual;
- impedir que scripts temporales o dumps contengan credenciales.

Clasificación: **GOBIERNO — MEDIA**.

Destinos:

- `SUPA-AUD-015`;
- `CODE-AUD-020`.

No se crea un requisito de prueba solo por la visibilidad del repositorio.

---

#### 20. Hallazgos y destino obligatorio

| ID               | Hallazgo                                                                                                | Certeza / riesgo            | Destino                                                                                            |
| ---------------- | ------------------------------------------------------------------------------------------------------- | --------------------------- | -------------------------------------------------------------------------------------------------- |
| `H-CODE-017-001` | aceptación de invitación materializa rol y sede enviados por el cliente                                 | `CONFIRMADO` / crítico      | `ANIMA-AUTH-019`, `020`; `AUTH-SRV-004`, `005`, `006`; `AUTH-DB-002`, `004`; `TREQ-AUTH-005`       |
| `H-CODE-017-002` | `public.users` permite autoadministrar columnas protegidas                                              | `CONFIRMADO` / crítico      | `PASS-INT-004`, `005`; `AUTH-SRV-004`, `005`; `AUTH-DB-002`, `004`; `TREQ-AUTH-006`                |
| `H-CODE-017-003` | personal activo puede leer la fila completa de todos los clientes                                       | `CONFIRMADO` / alto         | `PULSO-AUTH-006`, `009`, `010`; `PASS-INT-004`; `AUTH-DB-002`, `004`; `TREQ-AUTH-006`              |
| `H-CODE-017-004` | cliente puede insertar transacciones propias que incrementan su saldo                                   | `CONFIRMADO` / crítico      | `PULSO-AUTH-009`, `010`; `PASS-INT-001`, `002`; `AUTH-DB-002`, `004`; `TREQ-PASS-008`              |
| `H-CODE-017-005` | redención se compone en cliente sin transacción atómica                                                 | `CONFIRMADO` / alto         | `PASS-INT-002`; `PASS-QA-002`; `CODE-AUD-018`; `TREQ-PASS-008`                                     |
| `H-CODE-017-006` | políticas generales de personal amplían consulta y validación de redenciones                            | `CONFIRMADO` / alto         | `PULSO-AUTH-010`; `AUTH-DB-002`, `004`; `TREQ-PASS-008`                                            |
| `H-CODE-017-007` | pertenencia a sede permite leer metadatos documentales de otros trabajadores                            | `CONFIRMADO` / alto         | `EVID-ARC-*`; `SUPA-AUD-012`; `AUTH-DB-002`, `004`; `TREQ-SUPABASE-004`                            |
| `H-CODE-017-008` | bucket `documents` es público                                                                           | `CONFIRMADO` / alto         | `EVID-ARC-*`; `SUPA-AUD-012`; `AUTH-DB-002`, `004`, `005`; `TREQ-SUPABASE-004`                     |
| `H-CODE-017-009` | tres vistas administrativas de dispositivos no usan `security_invoker` y son legibles por authenticated | `CONFIRMADO` / alto         | `SUPA-AUD-003`, `007`, `009`; `AUTH-DB-002`, `004`, `005`; `TREQ-SUPABASE-005`                     |
| `H-CODE-017-010` | RPC anónimas exponen precios internos, centros de costo y validaciones                                  | `CONFIRMADO` / alto         | `SUPA-AUD-003`, `006`, `007`, `009`; `AUTH-DB-003`, `005`; `TREQ-SUPABASE-005`                     |
| `H-CODE-017-011` | cualquier fila de trabajador habilita CRUD total de órdenes de compra                                   | `CONFIRMADO` / alto         | `ORIGO-AUTH-004..010`; `AUTH-SRV-005`, `006`, `011`, `012`; `AUTH-DB-002`, `004`; `TREQ-ORIGO-002` |
| `H-CODE-017-012` | enlace público de PDF tiene secreto fallback y vigencia de 30 días                                      | `CONDICIONAL` / alto        | `ORIGO-AUTH-009`, `010`; `SUPA-AUD-015`; `TREQ-ORIGO-002`                                          |
| `H-CODE-017-013` | personal con acceso a sede puede actualizar filas completas de pedidos y líneas                         | `CONFIRMADO` / alto         | `PULSO-AUTH-006..011`; `AUTH-SRV-005`, `006`, `011`, `012`; `AUTH-DB-002`, `004`; `TREQ-PULSO-004` |
| `H-CODE-017-014` | gerentes pueden administrar configuración operativa sin filtro territorial de fila                      | `CONFIRMADO` / alto         | `VISO-AUTH-005..009`, `018`, `019`; `VISO-UX-013`; `AUTH-DB-002`; `TREQ-AUTH-007`                  |
| `H-CODE-017-015` | `document-alerts` falla abierto si falta secreto cron                                                   | `CONDICIONAL` / alto        | `SUPA-AUD-014`, `015`; `AUTH-DB-003`, `005`; `TREQ-SUPABASE-006`                                   |
| `H-CODE-017-016` | `shift-runtime-processor` falla abierto si no hay secreto en tabla ni ambiente                          | `CONDICIONAL` / alto        | mismo destino                                                                                      |
| `H-CODE-017-017` | ocho funciones sin JWT tienen control propio suficiente a nivel estático                                | `CONTROL_PRESENTE`          | conservar y probar negativamente                                                                   |
| `H-CODE-017-018` | `payments-return` es pública, pero no muta datos                                                        | `CONTROL_PRESENTE`          | cerrado                                                                                            |
| `H-CODE-017-019` | `delivery-portal` tiene token fuerte y controles, pero fuente solo remota                               | `GOBIERNO` / alto por drift | `SUPA-AUD-014`, `016`, `017`; `CODE-AUD-020`; mantiene `TREQ-SUPABASE-003`                         |
| `H-CODE-017-020` | VISO mantiene el cliente admin bajo `server-only`                                                       | `CONTROL_PRESENTE`          | conservar                                                                                          |
| `H-CODE-017-021` | las funciones `SECURITY DEFINER` revisadas tienen `search_path` fijado                                  | `CONTROL_PRESENTE`          | conservar                                                                                          |
| `H-CODE-017-022` | no se localizó una service role literal en el estado actual de los repositorios                         | límite de evidencia         | revisar historial en `SUPA-AUD-015`                                                                |
| `H-CODE-017-023` | diez repositorios continúan públicos                                                                    | `GOBIERNO` / medio          | `SUPA-AUD-015`, `CODE-AUD-020`                                                                     |

Todos los hallazgos tienen destino.

**No se crea ninguna tarea nueva del roadmap.**

---

#### 21. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

##### 21.1. Requisitos reutilizados

- `TREQ-AUTH-001`;
- `TREQ-AUTH-002`;
- `TREQ-AUTH-003`;
- `TREQ-AUTH-004`;
- `TREQ-ORIGO-001`;
- `TREQ-PULSO-001`;
- `TREQ-PULSO-003`;
- `TREQ-SUPABASE-003`.

No se cambia su estado.

##### 21.2. Requisitos nuevos

- `TREQ-AUTH-005`;
- `TREQ-AUTH-006`;
- `TREQ-AUTH-007`;
- `TREQ-PASS-008`;
- `TREQ-PULSO-004`;
- `TREQ-ORIGO-002`;
- `TREQ-SUPABASE-004`;
- `TREQ-SUPABASE-005`;
- `TREQ-SUPABASE-006`.

Las filas canónicas completas deberán agregarse exclusivamente en:

```text
docs/plan-canonico/modular/bloques/E1_DESCUBRIMIENTO_OPERATIVO/04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md
```

No se duplican filas completas de `04A` dentro de esta tarea.

---

#### 22. Decisiones propuestas

1. Autenticación y autorización permanecerán diferenciadas.
2. Un bearer válido no autoriza a elegir rol, sede, permiso o alcance.
3. La invitación persistida será la única fuente del rol y sede durante activación laboral.
4. Los clientes no podrán escribir directamente campos derivados, privilegiados o de saldo.
5. El perfil autoadministrable se implementará mediante una allowlist de campos.
6. La consulta de clientes devolverá una proyección mínima para el proceso autorizado.
7. El ledger de puntos no admitirá inserciones directas de clientes.
8. Acumulación, gasto, ajuste, reversión y redención serán operaciones de servidor trazables.
9. La redención será atómica e idempotente.
10. Un trabajador activo no obtendrá por sí solo acceso general a clientes, redenciones, órdenes o configuración.
11. Las políticas permisivas duplicadas deberán analizarse como una unión lógica OR.
12. Los documentos laborales no permanecerán en buckets públicos.
13. La pertenencia a una sede no será permiso suficiente para leer documentos de otros trabajadores.
14. Las vistas administrativas deberán usar `security_invoker` o revocar acceso directo y exponerse mediante contrato autorizado.
15. Toda función `SECURITY DEFINER` deberá combinar `search_path` fijo, grants mínimos y autorización interna.
16. Los RPC de precios internos y configuración no serán ejecutables por `anon`.
17. Cada mutación de compra o pedido deberá limitar permiso, sede, estado y columnas.
18. La administración de seguridad por gerente deberá respetar su alcance territorial.
19. Toda Edge Function sin JWT automático deberá implementar un control propio obligatorio y fail-closed.
20. Un secreto opcional no se considerará autenticación.
21. Los enlaces públicos privilegiados deberán exigir secretos obligatorios, alcance, expiración y revocación.
22. El patrón server-only de VISO y los controles correctos localizados se conservarán.
23. La fuente de `delivery-portal` deberá recuperarse y versionarse antes de remodelarla.
24. Los hallazgos críticos bloquearán ampliaciones del flujo afectado hasta su contención.
25. No se ejecutarán pruebas ofensivas ni mutaciones productivas durante E1.
26. Los nueve requisitos nuevos se registrarán únicamente en `04A`.
27. No se crea una tarea nueva del roadmap.
28. `CODE-AUD-018` será la única continuidad inmediata después de la aprobación.

---

#### 23. Límites de certeza

Esta tarea no confirma:

- qué secretos existen actualmente en los ambientes remotos;
- que el fallback de ORIGO esté activo en producción;
- que las funciones cron sin secreto configurado sean invocables actualmente sin control;
- que un objeto específico del bucket `documents` haya sido descargado sin autorización;
- que todos los repositorios públicos hayan sido clonados por terceros;
- que no existan secretos en el historial Git;
- que toda función con control estático correcto resista concurrencia o replay;
- que los controles de entrega y pagos sean completamente idempotentes;
- que la política empresarial final de visibilidad de clientes ya esté decidida;
- que cada campo de documentos tenga la misma sensibilidad.

La explotación no es necesaria para concluir los fallos de diseño y autorización demostrados por políticas, grants y código.

---

#### 24. Criterios de aceptación

`CODE-AUD-017` podrá aprobarse cuando:

- autenticación, autorización, alcance, RLS, grant y privilegio elevado estén diferenciados;
- las 24 Edge Functions queden clasificadas por JWT y control propio;
- las doce funciones sin JWT tengan evaluación individual;
- el escalamiento de invitaciones quede clasificado como crítico;
- la escritura amplia de `public.users` quede documentada;
- la escritura directa del ledger de puntos quede documentada;
- la redención cliente y las políticas generales tengan destino;
- la lectura amplia de PII tenga destino;
- documentos, bucket y URLs públicas tengan destino;
- vistas sin `security_invoker` y grants directos tengan destino;
- RPC anónimas y `SECURITY DEFINER` estén diferenciadas;
- órdenes de compra, pedidos y configuración operativa tengan destino;
- los controles positivos no se conviertan en falsos positivos;
- cada hallazgo tenga tarea responsable y momento de resolución;
- los requisitos nuevos tengan identificador único;
- las filas completas se incorporen únicamente a `04A`;
- no se creen tareas redundantes;
- no se modifique código, CI, despliegues ni Supabase;
- `CODE-AUD-018` permanezca como continuidad reservada.

---

#### 25. Resultado y continuidad

Al aprobarse quedará definida la cadena:

```text
actor, sesión o token
→ frontera de servidor
→ permiso y alcance
→ RLS, grant o función privilegiada
→ columnas y datos accesibles
→ acción autorizada o denegada
→ evidencia y requisito de regresión
```

La continuidad será:

```text
CODE-AUD-018
— Auditar operación offline, reintentos, concurrencia e idempotencia
```


### ✅ CODE-AUD-018 — Auditar operación offline, reintentos, concurrencia e idempotencia

**Estado:** APROBADA 
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Tipo:** auditoría transversal de tolerancia a conectividad intermitente, persistencia local, reintentos, replay, concurrencia, atomicidad e idempotencia  
**Dependencia anterior:** `CODE-AUD-017` — APROBADA  
**Continuidad reservada:** `CODE-AUD-019`  
**Fecha de corte:** 2026-07-24  
**Cambios en código, CI, despliegues o Supabase:** no realizados. La revisión fue documental y estática; no se enviaron operaciones productivas, pagos, redenciones, movimientos, recepciones, impresiones, webhooks ni eventos offline.

---

#### 1. Resultado de esta tarea

Esta tarea determina qué ocurre cuando una operación empresarial:

- se inicia sin conexión;
- pierde conectividad después de que el servidor pudo recibirla;
- se reintenta manual o automáticamente;
- llega dos o más veces;
- compite con otra operación sobre el mismo recurso;
- se ejecuta parcialmente;
- se recibe fuera de orden;
- queda pendiente en el dispositivo;
- cruza una frontera asíncrona, un webhook, una cola o un periférico;
- necesita distinguir entre envío, aceptación, procesamiento y efecto empresarial confirmado.

La cadena auditada es:

```text
intención del actor
→ identificador estable de operación
→ persistencia local o envío inmediato
→ frontera de servidor
→ revalidación de identidad, permiso, contexto y versión
→ deduplicación y control de concurrencia
→ transacción o efecto reconciliable
→ confirmación estable
→ retiro seguro de la cola
→ auditoría y recuperación
```

Resultado consolidado:

| Clasificación                                           | Cantidad |
| ------------------------------------------------------- | -------: |
| controles positivos explícitos                          |    **6** |
| brechas críticas confirmadas                            |    **4** |
| riesgos críticos parciales o pendientes de prueba       |    **2** |
| brechas altas confirmadas                               |    **3** |
| riesgos altos parciales, no implementados o de gobierno |    **6** |
| brechas medias de gobierno                              |    **1** |
| superficies con operación offline empresarial real      |    **1** |
| superficies con borrador o cola únicamente local        |    **2** |

La conclusión principal es:

```text
ANIMA
→ posee la única implementación offline empresarial explícita y parcialmente robusta

NEXO impresión
→ posee una cola local, pero no una cola durable de trabajos confirmados

ORIGO
→ conserva borradores de formulario, pero no ejecuta recepciones offline

RESTO DEL ECOSISTEMA
→ opera principalmente online y no demuestra un contrato transversal de
  idempotencia, reintento, concurrencia o recuperación
```

No existe todavía una política canónica única que obligue a cada mutación a declarar:

- si admite operación offline;
- qué identificador idempotente utiliza;
- qué errores pueden reintentarse;
- qué recurso o versión protege;
- qué atomicidad ofrece;
- cómo resuelve duplicados y eventos fuera de orden;
- cuándo la interfaz puede comunicar éxito;
- cómo se recupera una operación parcialmente aplicada.

---

#### 2. Alcance y fuentes contrastadas

La auditoría utilizó:

- las decisiones aprobadas en `CODE-AUD-001` a `CODE-AUD-017`;
- el código canónico actual de ANIMA, PASS, NEXO, ORIGO y VENTO-SHELL;
- los contratos de asistencia y sincronización de ANIMA;
- las migraciones de idempotencia de asistencia;
- la redención de puntos de PASS;
- la creación y conciliación de pagos;
- el webhook de Wompi;
- los ajustes de inventario de NEXO;
- la cola de impresión BrowserPrint de NEXO;
- la creación, corrección y reversión de recepciones de ORIGO;
- los hallazgos previos sobre remisiones, POS, automatizaciones, Edge Functions, cron, notificaciones y consumidores legacy;
- las tareas existentes de E2, E3, E4, E5 y los roadmaps por aplicación.

Cortes estáticos principales:

| Repositorio   | Referencia revisada                        | Superficie principal                            |
| ------------- | ------------------------------------------ | ----------------------------------------------- |
| `vento-anima` | `50b77742cc0ae85f873d42152108a50acc9d6964` | cola offline, sincronización y asistencia       |
| `vento-pass`  | `b5a4aec908ef12226f798078577ab089a29ccda2` | redenciones, historial y cliente móvil          |
| `vento-shell` | `1bad886843d2c3300611680f98a266e59899e064` | RPC, migraciones, pagos, webhook y conciliación |
| `vento-nexo`  | `142c4d696221e3ce3fda4ed3b62f3d1fe5b58799` | ajustes de inventario e impresión               |
| `vento-origo` | `71de15eacae4b91ced5357bf021cac459dd6fff0` | recepción, inventario, costos y correcciones    |

No se ejecutaron:

- pruebas de doble envío contra producción;
- pruebas de pérdida de red durante una transacción;
- carreras concurrentes reales;
- replays de webhook;
- impresiones físicas;
- pagos reales o de prueba;
- redenciones;
- recepciones;
- movimientos de inventario;
- cambios de reloj del dispositivo;
- reinstalación de aplicaciones con colas pendientes.

La ausencia de ejecución dinámica no reduce la certeza de las brechas que se demuestran directamente mediante secuencias de lectura y escritura no transaccionales, retiro prematuro de colas o ausencia de clave idempotente.

---

#### 3. Estados de certeza

| Estado                            | Significado                                                                                    |
| --------------------------------- | ---------------------------------------------------------------------------------------------- |
| `CONTROL_PRESENTE`                | existe un mecanismo explícito y verificable a nivel estático                                   |
| `PARCIAL`                         | existe una parte del contrato, pero no cubre toda la operación o todos sus efectos             |
| `CONFIRMADO`                      | el código demuestra una posibilidad concreta de duplicación, pérdida, carrera o estado parcial |
| `NO_IMPLEMENTADO`                 | no existe una capacidad offline o un control transversal demostrable                           |
| `REQUIERE_PRUEBA_CONCURRENTE`     | el diseño contiene controles, pero necesita ejecución simultánea para cerrar certeza           |
| `REQUIERE_PRUEBA_DE_RECUPERACIÓN` | debe comprobarse pérdida de red, reinicio, replay o fallo intermedio                           |
| `GOBIERNO`                        | falta contrato canónico, propietario, métrica, retención o política de operación               |

Un bloqueo de doble clic en la interfaz no se clasifica como control de integridad. Un `loading`, una referencia `inFlight`, un botón deshabilitado o una comparación local solo protege una instancia de interfaz; no protege:

- dos pestañas;
- dos dispositivos;
- una retransmisión de red;
- un webhook repetido;
- dos workers;
- dos actores sobre el mismo recurso;
- una respuesta perdida después de que el servidor aplicó el efecto.

---

#### 4. Definiciones obligatorias usadas en la auditoría

##### 4.1. Operación offline

Una capacidad es realmente offline cuando puede:

1. aceptar una intención sin conexión;
2. persistirla de manera durable;
3. conservar identidad, contexto, recurso, versión y evidencia suficientes;
4. sobrevivir al cierre o reinicio de la aplicación;
5. sincronizarse después;
6. revalidarse en servidor;
7. producir un único efecto empresarial o un conflicto explícito;
8. mostrar estado pendiente, confirmado, rechazado o fallido.

Guardar un borrador en `localStorage`, `sessionStorage` o memoria no convierte la acción empresarial en offline.

##### 4.2. Reintento

Un reintento reutiliza la misma intención y la misma clave idempotente. Repetir una acción generando una clave nueva se considera una operación nueva, aunque el usuario perciba que solo está intentando de nuevo.

##### 4.3. Idempotencia

Para una misma clave y el mismo contenido lógico:

```text
primer procesamiento
→ aplica el efecto y conserva el resultado

replay posterior
→ no repite el efecto
→ devuelve el mismo resultado estable o su referencia
```

Si la misma clave llega con un contenido distinto, deberá producir un conflicto y no reemplazar silenciosamente la intención original.

##### 4.4. Atomicidad

Una operación es atómica cuando sus efectos empresariales indivisibles se confirman juntos o no se confirma ninguno. Cuando una transacción única no sea posible, deberá existir una saga o compensación durable, idempotente y observable; un `delete` de mejor esfuerzo desde el cliente no constituye una garantía equivalente.

##### 4.5. Concurrencia

Toda mutación deberá declarar uno de estos mecanismos o una combinación aprobada:

- bloqueo de fila;
- versión optimista;
- compare-and-swap;
- restricción única;
- serialización por recurso;
- reserva;
- clave idempotente;
- cola con exclusión por recurso;
- transacción con nivel de aislamiento adecuado.

##### 4.6. Semántica de entrega

Las colas, webhooks y redes se asumirán como **al menos una vez**. El sistema no dependerá de que el transporte entregue exactamente una vez. El efecto empresarial exactamente una vez se aproximará mediante deduplicación, atomicidad, control de versión y conciliación.

---

#### 5. Matriz transversal por aplicación y superficie

| Aplicación o superficie | Operación offline actual                                | Reintentos                                                                                 | Concurrencia                                                                                | Idempotencia                                                                                                  | Resultado                               |
| ----------------------- | ------------------------------------------------------- | ------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- | --------------------------------------- |
| ANIMA asistencia        | cola durable en SecureStore para marcación y descansos  | backoff para errores semejantes a red; sincronización periódica y al volver a primer plano | referencias `inFlight` locales; deduplicación de marcaciones en servidor                    | marcaciones normales con `client_event_id` e índice único; descansos sin deduplicación contractual demostrada | `PARCIAL`, es la base más avanzada      |
| PASS redención          | no demostrada                                           | nuevo intento manual                                                                       | lectura de saldo antes de dos escrituras separadas                                          | no existe clave idempotente en el flujo cliente                                                               | `CONFIRMADO` crítico                    |
| PASS pagos              | requiere conexión                                       | replay del proveedor y conciliación programada                                             | bloqueo de transacción al aplicar estado; creación de intentos no serializada completamente | referencia persistida y registro de eventos, pero claim y efecto no son una sola unidad                       | `PARCIAL`                               |
| NEXO ajustes            | no demostrada                                           | reenvío manual de la solicitud                                                             | lectura-modificación-escritura sobre proyecciones                                           | no existe identificador de operación                                                                          | `CONFIRMADO` crítico                    |
| NEXO remisiones         | no demostrada como offline                              | cobertura incompleta ya registrada                                                         | transiciones y efectos requieren revisión por estado/recurso                                | no se ha demostrado exactamente una vez en todos los efectos                                                  | `PARCIAL`; conserva `TREQ-NEXO-006`     |
| NEXO impresión          | cola de texto local                                     | reimpresión manual; sin estado durable de reintento                                        | no existe claim de trabajo por dispositivo                                                  | no existe ID durable de trabajo ni acuse verificable                                                          | `CONFIRMADO` alto                       |
| ORIGO recepción         | borrador en `sessionStorage`; envío online              | reenvío manual                                                                             | múltiples lecturas y escrituras secuenciales                                                | no existe clave de operación para recepción o corrección                                                      | `CONFIRMADO` crítico                    |
| PULSO                   | no demostrada                                           | depende de reenvío o integraciones futuras                                                 | modelo operativo todavía en definición                                                      | no existe contrato transversal comprobado                                                                     | `NO_IMPLEMENTADO` / pendiente de diseño |
| FOGO                    | no demostrada                                           | no demostrados                                                                             | no demostrada                                                                               | no demostrada                                                                                                 | `NO_IMPLEMENTADO`                       |
| VISO                    | no demostrada                                           | reenvío manual de formularios                                                              | protecciones locales variables                                                              | no existe convención transversal comprobada                                                                   | `NO_IMPLEMENTADO`                       |
| NUMERA                  | no demostrada                                           | reenvío manual                                                                             | no demostrada                                                                               | no demostrada                                                                                                 | `NO_IMPLEMENTADO`                       |
| SHELL                   | no ejecuta la mayoría de mutaciones de dominio          | no aplica como aplicación para muchas acciones                                             | actúa como hub                                                                              | contratos compartidos todavía no unificados                                                                   | `GOBIERNO`                              |
| TALENTO                 | sin superficie productiva                               | no aplica                                                                                  | no aplica                                                                                   | no aplica                                                                                                     | fuera de operación actual               |
| web pública             | no existen mutaciones empresariales offline demostradas | variable por formulario                                                                    | no demostrada                                                                               | no demostrada                                                                                                 | online                                  |

La matriz no exige que todas las aplicaciones trabajen offline. Exige que cada capacidad declare su modalidad real y no permita que la interfaz confunda:

```text
borrador local
≠ operación en cola
≠ solicitud recibida por servidor
≠ operación procesada
≠ efecto empresarial conciliado
```

---

#### 6. Control positivo: marcaciones offline de ANIMA

ANIMA contiene la implementación más completa encontrada:

- cola de marcaciones por usuario en SecureStore;
- identificador de evento creado antes del envío;
- `occurred_at`, sede, geolocalización, dispositivo y contexto de turno;
- estados `pending`, `syncing`, `failed` y `conflict`;
- número de intentos, último error y próximo reintento;
- sincronización cada quince segundos mientras existen pendientes;
- sincronización forzada al volver la aplicación a primer plano;
- procesamiento secuencial de la cola;
- diferenciación entre aplicado, duplicado, conflicto y error;
- índice único por trabajador y `client_event_id`;
- RPC que convierte una violación única en resultado `duplicate`;
- registro separado de conflictos de sincronización;
- revalidación de trabajador activo y acceso a sede en servidor;
- estados visibles de cola, sincronización, fallo y bloqueo.

Clasificación:

```text
persistencia local                    CONTROL_PRESENTE
identificador estable                 CONTROL_PRESENTE
replay de marcación normal            CONTROL_PRESENTE
revalidación básica de servidor       CONTROL_PRESENTE
conflicto explícito                    CONTROL_PRESENTE
prueba de reinicio, pérdida y carrera  PENDIENTE
```

Este patrón deberá conservarse como referencia, pero no se considera completo para toda asistencia ni automáticamente reutilizable por otros dominios.

---

#### 7. Brecha ANIMA: persistencia local no confirmada antes de comunicar cola

Las funciones que escriben las colas en SecureStore capturan el error, lo registran y terminan sin propagarlo.

Consecuencia posible:

```text
la acción online falla
→ ANIMA intenta guardar el evento
→ SecureStore falla
→ el helper no lanza error
→ la capa superior puede continuar como si el evento hubiera quedado en cola
→ el usuario recibe éxito optimista
→ al cerrar la app, la intención puede no existir
```

**Hallazgo:** `H-CODE-018-001`  
**Estado:** `CONFIRMADO`  
**Severidad:** crítica  
**Riesgo:** pérdida silenciosa de una marcación o descanso que el trabajador cree guardado.  
**Destino:** `ANIMA-AUTH-014`, `ANIMA-UX-011`, `ANIMA-UX-012`, `AUTH-QA-026`, `NFR-REQ-004`.  
**Prueba:** `TREQ-ANIMA-003`.

Decisión propuesta:

Una acción solo podrá responder `queued: true` después de confirmar que la cola fue persistida. Si la persistencia local falla, la interfaz deberá comunicar que la operación no fue guardada y conservar una ruta de recuperación explícita.

---

#### 8. Brecha ANIMA: descansos sin idempotencia demostrada en servidor

Los eventos de descanso crean un `clientEventId` y lo incluyen dentro de `notes`, pero las llamadas vigentes a:

- `start_attendance_break`;
- `end_attendance_break`;

no demuestran una columna idempotente, restricción única ni resultado estable por evento. La sincronización decide localmente si debe aplicar, descartar o marcar conflicto y luego invoca la RPC.

La secuencia:

```text
consultar estado actual
→ decidir proceder
→ llamar RPC
```

no es atómica. Dos dispositivos o un replay después de una respuesta perdida pueden observar el mismo estado previo.

**Hallazgo:** `H-CODE-018-002`  
**Estado:** `CONFIRMADO` a nivel contractual; requiere prueba concurrente para medir la manifestación  
**Severidad:** alta  
**Riesgo:** doble inicio, doble cierre, cierre del descanso equivocado o resultado local divergente.  
**Destino:** `ANIMA-AUTH-014`, `ANIMA-AUTH-015`, `QUEUE-ARC-003`, `QUEUE-ARC-009`, `AUTH-QA-026`.  
**Prueba:** `TREQ-ANIMA-004`.

Decisión propuesta:

Los descansos deberán usar una clave idempotente persistida en una columna propia y procesarse mediante una operación de servidor que:

- bloquee o versione el estado de asistencia relevante;
- aplique la transición válida;
- devuelva `applied`, `duplicate` o `conflict`;
- conserve el mismo resultado para replays posteriores.

---

#### 9. Brecha ANIMA: fallback que reduce el contrato de sincronización

Cuando el cliente interpreta que `sync_attendance_events` no existe, ejecuta una inserción alternativa mediante `insertAttendanceLogWithRetry` y devuelve `applied`.

Aunque la tabla dispone de un índice único para `client_event_id`, el fallback:

- evita el contrato explícito de resultados `duplicate` y `conflict`;
- puede diferir en validaciones, auditoría y tratamiento de errores;
- convierte drift de esquema en una ruta funcional silenciosa;
- permite que ambientes distintos procesen la misma cola mediante contratos diferentes.

**Hallazgo:** `H-CODE-018-003`  
**Estado:** `CONFIRMADO`  
**Severidad:** alta  
**Riesgo:** divergencia entre ambientes y pérdida de semántica de sincronización.  
**Destino:** `ANIMA-AUTH-014`, `ANIMA-AUTH-015`, `SUPA-TRANS-006`, `CODE-AUD-020`, `TREQ-SUPABASE-001`.  
**Prueba:** se incorpora a `TREQ-ANIMA-003` y reutiliza `TREQ-SUPABASE-001`.

Decisión propuesta:

La ausencia del contrato de sincronización deberá ser un error de despliegue observable y no una razón para degradar a una escritura alternativa sin equivalencia probada. Cualquier compatibilidad temporal deberá estar versionada, tener prueba de paridad y fecha de retiro.

---

#### 10. Brecha transversal: reintento basado en heurísticas locales

ANIMA identifica errores semejantes a conectividad mediante cadenas como:

- `network request failed`;
- `failed to fetch`;
- `timeout`;
- `enotfound`;
- `econnrefused`.

Después usa backoff exponencial con tope. Este control es útil, pero no constituye una política transversal porque:

- depende del texto del error;
- no incorpora jitter;
- no usa `Retry-After`;
- no diferencia timeout antes de envío y timeout después de posible commit;
- no clasifica conflictos, validación, autorización, rate limit, indisponibilidad o error permanente mediante códigos canónicos;
- no establece un máximo canónico de edad o intentos para todas las colas;
- no existe una cola de fallos durable común.

**Hallazgo:** `H-CODE-018-004`  
**Estado:** `PARCIAL`  
**Severidad:** alta  
**Destino:** `TSVC-CAT-006`, `QUEUE-ARC-006`, `QUEUE-ARC-008`, `NFR-REQ-004`, `NFR-REQ-009`.  
**Prueba:** `TREQ-INTEGRATION-003`.

Decisión propuesta:

Cada frontera deberá devolver una clasificación estable:

```text
RETRYABLE_NETWORK
RETRYABLE_TIMEOUT_UNKNOWN_COMMIT
RETRYABLE_RATE_LIMIT
RETRYABLE_SERVER
CONFLICT_VERSION
DUPLICATE_APPLIED
DENIED
INVALID
EXPIRED
PERMANENT_FAILURE
```

La política de reintento deberá depender del código, no de texto libre.

---

#### 11. Brecha crítica: redención de puntos de PASS no atómica

El flujo vigente de redención:

1. consulta el producto y su costo;
2. consulta el saldo del usuario;
3. genera un QR en el cliente;
4. inserta la redención;
5. inserta una transacción de gasto;
6. intenta borrar la redención si falla la segunda inserción.

No existe una única operación de servidor que bloquee o versione el saldo y confirme ambos registros juntos. Tampoco existe una clave idempotente de redención.

Carrera posible:

```text
solicitud A lee 100 puntos
solicitud B lee 100 puntos
A valida costo 80
B valida costo 80
A crea redención
B crea redención
A registra -80
B registra -80
```

Fallo parcial posible:

```text
se crea redención
→ se pierde conexión o falla ledger
→ el cliente intenta compensar con delete
→ la compensación falla o se repite
→ queda redención huérfana o estado ambiguo
```

**Hallazgo:** `H-CODE-018-005`  
**Estado:** `CONFIRMADO`  
**Severidad:** crítica  
**Destino:** `PULSO-AUTH-010`, `PASS-INT-002`, `PASS-QA-002`, `INT-SALES-006`, `INT-SALES-007`.  
**Prueba:** reutiliza `TREQ-PASS-008`.

Decisión propuesta:

La redención deberá ejecutarse mediante una única acción de servidor atómica e idempotente que:

- reciba clave estable de operación;
- bloquee o versione el saldo;
- valide producto, sede, estado, costo y actor;
- cree redención y movimiento de puntos en una misma transacción;
- genere o reserve el código de canje en servidor;
- devuelva el mismo resultado ante replay;
- impida saldo negativo y doble gasto;
- audite validación, cancelación y reversión.

---

#### 12. Control parcial: creación de pagos con referencia persistida

El flujo de pagos conserva controles positivos:

- una transacción previa con `idempotency_key` persistida;
- uso de esa clave como referencia del proveedor;
- validación de propietario, proveedor, moneda, monto y estado;
- estados `pending` y `requires_action`;
- conciliación periódica de checkouts vencidos;
- bloqueo de fila durante la actualización del estado recibida por webhook.

Esto reduce el riesgo de crear referencias empresariales diferentes para el mismo registro de pago.

Clasificación:

```text
referencia estable de proveedor  CONTROL_PRESENTE
validación de propietario         CONTROL_PRESENTE
bloqueo al aplicar estado         CONTROL_PRESENTE
creación concurrente de intentos  PARCIAL
replay completo                   REQUIERE_PRUEBA_CONCURRENTE
```

---

#### 13. Brecha de pagos: intentos concurrentes con resultado mutable

Dos solicitudes simultáneas de creación de intent pueden leer la misma transacción en `pending` o `requires_action`, generar expiraciones distintas y construir URLs diferentes con la misma referencia. La RPC posterior actualiza `raw_request`, pero no demuestra un claim exclusivo que garantice que solo una solicitud construya el resultado canónico.

Consecuencias posibles:

- dos respuestas distintas para la misma transacción;
- sobrescritura de la solicitud persistida;
- diferencia entre la URL abierta por el cliente y el snapshot conservado;
- expiraciones competidoras;
- conciliación difícil después de una respuesta perdida.

**Hallazgo:** `H-CODE-018-006`  
**Estado:** `REQUIERE_PRUEBA_CONCURRENTE`, con brecha contractual confirmada  
**Severidad:** alta  
**Destino:** `INT-EXT-012`, `INT-EXT-015`, `SUPA-ARC-020`, `PASS-QA-001`, `PASS-QA-002`.  
**Prueba:** `TREQ-PASS-009`.

Decisión propuesta:

La creación de intento deberá reclamar la transacción de manera atómica y conservar un resultado reutilizable. Un replay válido deberá devolver la URL y expiración ya asignadas mientras sigan vigentes, o crear una nueva versión explícita después de expirar la anterior.

---

#### 14. Brecha de pagos: deduplicación de webhook separada del efecto

El webhook:

1. verifica la firma;
2. consulta si el evento ya está procesado;
3. aplica el estado de la transacción;
4. registra o actualiza el evento como procesado.

El registro de eventos tiene una clave única y la actualización de la transacción usa bloqueo de fila, ambos controles positivos. Sin embargo, la secuencia de consulta, efecto y registro no es una única operación atómica.

Dos entregas concurrentes pueden superar la consulta antes de que cualquiera marque el evento. Además, cuando el proveedor no entrega un ID utilizable se genera un UUID nuevo, por lo que dos replays del mismo payload no compartirían clave de deduplicación.

También falta una política explícita para eventos válidos fuera de orden, por ejemplo:

```text
approved
→ webhook retrasado de rejected

refunded
→ replay posterior de approved
```

**Hallazgo:** `H-CODE-018-007`  
**Estado:** `PARCIAL` / `REQUIERE_PRUEBA_CONCURRENTE`  
**Severidad:** crítica  
**Destino:** `SUPA-AUD-014`, `SUPA-ARC-020`, `INT-EXT-010`, `INT-EXT-012`, `INT-EXT-015`.  
**Prueba:** `TREQ-PASS-009` y `TREQ-INTEGRATION-003`.

Decisión propuesta:

La recepción del webhook deberá:

- derivar una clave determinista del identificador del proveedor o de un hash canónico aprobado;
- reclamar el evento atómicamente antes del efecto;
- conservar payload original, firma, hash, fechas y número de intento;
- aplicar una máquina de estados monotónica o una regla explícita de precedencia;
- registrar efecto y evento en una misma transacción o mediante outbox/inbox reconciliable;
- devolver éxito estable para duplicados ya procesados.

---

#### 15. Brecha crítica: ajustes de inventario NEXO no son atómicos

La ruta de ajuste vigente:

1. lee stock de sede;
2. lee stock de LOC;
3. lee stock de posición;
4. calcula el delta en la aplicación;
5. inserta el movimiento;
6. actualiza la proyección por sede;
7. actualiza la proyección por LOC;
8. actualiza la proyección por posición;
9. puede actualizar costo del producto;
10. puede insertar un evento de costo.

Estas operaciones se ejecutan secuencialmente fuera de una transacción única.

Carrera posible:

```text
A lee stock 10
B lee stock 10
A suma 5 y escribe 15
B resta 3 y escribe 7
resultado esperado 12
resultado final posible 7
```

Fallo parcial posible:

```text
movimiento insertado
→ stock de sede actualizado
→ falla stock de LOC
→ la respuesta devuelve error
→ el usuario reintenta
→ se inserta otro movimiento
```

**Hallazgo:** `H-CODE-018-008`  
**Estado:** `CONFIRMADO`  
**Severidad:** crítica  
**Destino:** `NEXO-AUTH-011`, `SUPA-AUD-019`, `SUPA-AUD-022`, `SUPA-AUD-023`, `SHELL-CON-023`.  
**Prueba:** reutiliza `TREQ-SUPABASE-002`.

Decisión propuesta:

Todo ajuste deberá procesarse en servidor mediante un contrato que:

- reciba clave idempotente;
- bloquee o versione el stock objetivo;
- inserte el ledger una sola vez;
- actualice o derive las proyecciones de sede, LOC y posición dentro de la misma transacción;
- actualice costo y evento asociado de forma atómica cuando corresponda;
- devuelva el resultado previo ante replay;
- rechace la misma clave con payload diferente;
- preserve conciliación y reconstrucción desde la fuente de verdad.

---

#### 16. Brecha crítica: recepción ORIGO compone múltiples efectos sin transacción única

La creación de una recepción puede ejecutar, entre otros efectos:

- inserción de cabecera;
- inserción de líneas;
- vinculación de firma de dispositivo compartido;
- inserción de movimientos;
- actualización de stock por sede;
- actualización por LOC;
- actualización de costos;
- inserción de eventos de costo;
- incremento de cantidad recibida por línea de orden;
- cambio de estado de orden de compra;
- creación de solicitudes de maestro de datos;
- cierre de relación entre recepción original y corrección.

No existe una clave idempotente de recepción ni una transacción única que abarque el efecto empresarial completo.

El propio código reconoce estados parciales mediante mensajes como:

```text
la recepción se registró,
pero no se pudieron guardar las solicitudes...
```

o:

```text
la recepción corregida se creó,
pero no se pudo cerrar la auditoría...
```

La corrección además puede reversar primero la recepción original y fallar antes de crear o vincular la sustituta.

**Hallazgo:** `H-CODE-018-009`  
**Estado:** `CONFIRMADO`  
**Severidad:** crítica  
**Destino:** `ORIGO-UX-009`, `ORIGO-UX-010`, `ORIGO-UX-014`, `ORIGO-UX-016`, `INT-PROC-002`, `INT-PROC-003`, `INT-PROC-005`.  
**Prueba:** `TREQ-ORIGO-003`.

Decisión propuesta:

La recepción deberá convertirse en una operación de servidor transaccional e idempotente. La corrección deberá ser una transición compuesta indivisible o una saga durable que nunca deje la original reversada sin un estado explícito y recuperable de sustitución pendiente.

---

#### 17. Brecha alta: cola de impresión NEXO no es una cola empresarial durable

La cola de impresión actual:

- es texto guardado en `localStorage` del navegador;
- no registra un ID durable por trabajo;
- no tiene actor, sede, área, dispositivo, plantilla, versión ni payload hash canónicos;
- envía ZPL directamente mediante BrowserPrint;
- vacía la cola inmediatamente después de invocar el envío;
- no espera el callback de éxito antes de retirar el trabajo;
- no puede distinguir con certeza envío, recepción por bridge, procesamiento por impresora o salida física;
- no conserva una cola de fallos ni reintentos auditables;
- no separa reintento técnico de reimpresión empresarial.

Fallo posible:

```text
se invoca send
→ la interfaz limpia localStorage
→ BrowserPrint devuelve error
→ el trabajo ya no está en cola
```

Ambigüedad posible:

```text
la impresora recibió el trabajo
→ se pierde el callback
→ el usuario reimprime
→ sale una etiqueta duplicada
```

**Hallazgo:** `H-CODE-018-010`  
**Estado:** `CONFIRMADO`  
**Severidad:** alta  
**Destino:** `NEXO-UX-037`, `NEXO-UX-038`, `PRINT-ARC-006`, `PRINT-ARC-010`, `PRINT-ARC-011`, `PRINT-ARC-012`, `PRINT-ARC-014`, `PRINT-ARC-017`.  
**Prueba:** reutiliza `TREQ-NEXO-005`.

Decisión propuesta:

Un trabajo no se retirará antes de una confirmación definida. Cuando el periférico no pueda confirmar impresión física, el sistema deberá distinguir al menos:

```text
queued
claimed
sent_to_adapter
adapter_acknowledged
unknown_outcome
failed
cancelled
reprint_requested
```

La reimpresión deberá crear una acción nueva, enlazada con el trabajo original y con motivo obligatorio cuando corresponda.

---

#### 18. Remisiones: idempotencia todavía no demostrada de extremo a extremo

Las tareas previas ya comprobaron que las remisiones pueden operar en modo de registro y que la publicación de movimientos reales no está uniformemente consolidada.

Para `CODE-AUD-018` no se declara un defecto nuevo adicional sin una prueba completa de todas las transiciones. Se conserva el riesgo existente:

- activar inventario después de operar en modo registro;
- reintentar preparación, despacho, tránsito o recepción;
- mezclar efectos por LOC;
- conciliar operaciones históricas;
- repetir movimientos después de una respuesta perdida.

**Hallazgo:** `H-CODE-018-011`  
**Estado:** `REQUIERE_PRUEBA_DE_RECUPERACIÓN`  
**Severidad:** crítica por impacto potencial  
**Destino:** `NEXO-UX-009`, `NEXO-UX-010`, `NEXO-UX-011`, `NEXO-UX-012`, `NEXO-UX-013`, `INT-SALES-007`, `SHELL-CON-023`.  
**Prueba:** reutiliza `TREQ-NEXO-006`.

No se afirma que exista doble contabilización actual. Se afirma que el contrato exactamente una vez todavía no está demostrado.

---

#### 19. Brecha transversal: protecciones locales no sustituyen concurrencia de servidor

Se identificaron controles útiles como:

- `actionInFlightRef`;
- `syncInFlightRef`;
- botones deshabilitados;
- estados `loading`;
- procesamiento secuencial dentro de una instancia;
- comparación local del último estado conocido.

Estos mecanismos reducen repeticiones accidentales dentro de la misma instancia, pero no resuelven:

- dos dispositivos del mismo actor;
- dos actores sobre el mismo recurso;
- dos pestañas;
- dos procesos de servidor;
- dos webhooks;
- una respuesta perdida;
- un reintento después de reinicio;
- una cola recuperada en otro dispositivo.

**Hallazgo:** `H-CODE-018-012`  
**Estado:** `GOBIERNO` con manifestaciones confirmadas en flujos específicos  
**Severidad:** alta  
**Destino:** `NFR-REQ-002`, `TSVC-CAT-006`, `QUEUE-ARC-009`, `SHELL-CON-023`, `INT-APP-004`.  
**Prueba:** `TREQ-INTEGRATION-003`.

Decisión propuesta:

Toda integridad crítica deberá estar protegida en la frontera que posee la fuente de verdad. El cliente podrá mejorar experiencia, pero nunca será la única defensa contra duplicación o carrera.

---

#### 20. Brecha transversal: no existe contrato canónico de operación pendiente

Fuera de ANIMA no se encontró una semántica común para diferenciar:

```text
local_draft
queued
sending
server_received
processing
applied
duplicate
conflict
retry_scheduled
failed_permanent
cancelled
expired
unknown_outcome
```

Como resultado, distintas superficies pueden usar “guardado”, “enviado”, “registrado”, “procesado” o “impreso” con significados diferentes.

**Hallazgo:** `H-CODE-018-013`  
**Estado:** `NO_IMPLEMENTADO`  
**Severidad:** alta  
**Destino:** `NFR-REQ-004`, `UX-STATION-007`, `TSVC-CAT-006`, `QUEUE-ARC-002`, `QUEUE-ARC-010`, `INT-APP-008`.  
**Prueba:** `TREQ-INTEGRATION-003`.

Decisión propuesta:

Cada proceso deberá declarar:

- estado local;
- estado de transporte;
- estado de procesamiento;
- estado empresarial;
- mensaje visible;
- acción permitida;
- responsable de recuperación;
- tiempo máximo antes de escalar.

---

#### 21. Brecha transversal: no existe registro canónico de idempotencia

Los patrones actuales son heterogéneos:

| Patrón                | Ejemplo                | Limitación                                                             |
| --------------------- | ---------------------- | ---------------------------------------------------------------------- |
| restricción única     | marcaciones ANIMA      | localizada a una tabla y tipo de evento                                |
| referencia persistida | pagos                  | no cubre por sí sola claim, respuesta estable y eventos fuera de orden |
| comprobación previa   | webhook                | puede competir antes de registrar el claim                             |
| comparación de estado | descansos              | consulta y efecto no son una unidad atómica                            |
| bloqueo local         | formularios y acciones | no protege concurrencia distribuida                                    |
| compensación cliente  | redención PASS         | no garantiza reversión                                                 |
| reenvío manual        | múltiples formularios  | puede crear una nueva operación duplicada                              |
| cola local de texto   | impresión NEXO         | no conserva identidad ni acuse durable                                 |

**Hallazgo:** `H-CODE-018-014`  
**Estado:** `GOBIERNO`  
**Severidad:** alta  
**Destino:** `SHELL-CON-023`, `TSVC-CAT-006`, `QUEUE-ARC-003`, `INT-APP-004`, `INT-EXT-012`, `INT-DB-005`.  
**Prueba:** `TREQ-INTEGRATION-003`.

Contrato mínimo propuesto:

```text
operation_id
operation_type
actor_id
subject_id o device_id
resource_type
resource_id o draft_fingerprint
payload_hash
contract_version
client_occurred_at
server_received_at
status
result_reference
attempt_count
last_error_code
expires_at
```

Reglas:

1. la clave se genera antes del primer intento;
2. permanece igual durante todos los reintentos de la misma intención;
3. el servidor guarda hash y versión del payload;
4. misma clave + mismo hash devuelve el resultado anterior;
5. misma clave + hash distinto produce conflicto;
6. la retención supera la ventana máxima de replay;
7. las claves no contienen secretos ni PII innecesaria;
8. el ámbito evita colisiones entre dominios y actores;
9. el resultado conserva referencia al recurso o evento creado;
10. la limpieza del registro es controlada y auditable.

---

#### 22. Brecha transversal: falta patrón outbox/inbox para efectos asíncronos

Las integraciones actuales combinan:

- escrituras de dominio;
- triggers;
- Edge Functions;
- notificaciones;
- webhooks;
- cron;
- GitHub Actions;
- callbacks de periféricos.

No se ha demostrado un patrón transversal en el que:

```text
transacción de negocio
+ evento de salida durable
→ commit único
→ entrega reintentable
→ consumidor deduplicado
→ auditoría y conciliación
```

Tampoco se ha demostrado una inbox canónica para eventos externos.

**Hallazgo:** `H-CODE-018-015`  
**Estado:** `GOBIERNO`  
**Severidad:** alta  
**Destino:** `SUPA-AUD-014`, `SUPA-ARC-020`, `QUEUE-ARC-001`, `QUEUE-ARC-002`, `QUEUE-ARC-003`, `QUEUE-ARC-006`, `QUEUE-ARC-008`, `QUEUE-ARC-009`, `INT-DB-007`.  
**Prueba:** `TREQ-INTEGRATION-003`.

No se impone todavía una tecnología específica. E3 y E4 deberán decidir cuándo usar:

- transacción directa;
- outbox;
- inbox;
- cron reconciliador;
- cola gestionada;
- worker;
- Edge Function;
- adaptador local;
- compensación.

---

#### 23. Borradores locales y operación degradada

Se encontraron usos legítimos de almacenamiento local o de sesión para:

- cola de asistencia;
- borrador de recepción ORIGO;
- cola y configuración de impresión;
- sesión y preferencias;
- caches de lectura.

Cada uso deberá clasificarse por separado:

| Tipo                     | Puede comunicar “operación realizada” | Debe sincronizar             | Requiere idempotencia de servidor |
| ------------------------ | ------------------------------------- | ---------------------------- | --------------------------------- |
| preferencia local        | no                                    | no necesariamente            | no                                |
| cache de lectura         | no                                    | refresca                     | no para lectura                   |
| borrador local           | no                                    | solo cuando el usuario envía | sí al enviar una mutación crítica |
| cola offline empresarial | solo como “pendiente”                 | sí                           | sí                                |
| trabajo periférico       | solo según estado confirmado          | sí o adaptador local         | sí                                |

**Hallazgo:** `H-CODE-018-016`  
**Estado:** `GOBIERNO`  
**Severidad:** media  
**Destino:** `NFR-REQ-004`, `UX-STATION-007`, `ANIMA-UX-011`, `PRINT-ARC-017`.  
**Prueba:** cubierta por `TREQ-ANIMA-003`, `TREQ-NEXO-005` y `TREQ-INTEGRATION-003`.

---

#### 24. Política canónica propuesta de operación offline

Cada capacidad deberá elegir explícitamente una modalidad:

| Modalidad                | Comportamiento                                                               |
| ------------------------ | ---------------------------------------------------------------------------- |
| `ONLINE_REQUIRED`        | bloquea envío sin conexión y conserva borrador cuando corresponda            |
| `READ_CACHED`            | permite consulta de snapshot claramente fechado, sin presentarlo como actual |
| `LOCAL_DRAFT`            | permite preparar datos, pero no afirma efecto empresarial                    |
| `OFFLINE_QUEUED`         | acepta intención durable y la sincroniza con idempotencia y revalidación     |
| `LOCAL_PERIPHERAL_QUEUE` | entrega a adaptador local con estados y acuses definidos                     |
| `MANUAL_CONTINGENCY`     | usa procedimiento alterno documentado y posterior conciliación               |

Una aplicación no será declarada “offline” de forma global. La modalidad pertenece a cada capacidad.

Toda capacidad `OFFLINE_QUEUED` deberá definir:

- motivo empresarial que justifica offline;
- actor y dispositivo permitidos;
- datos mínimos que pueden conservarse localmente;
- cifrado y retención;
- clave idempotente;
- versión o snapshot del recurso;
- vencimiento;
- orden relativo con otros eventos;
- política de revalidación;
- resolución de conflicto;
- UX de estado pendiente;
- mecanismo de reintento;
- procedimiento de recuperación;
- auditoría;
- prueba de reinstalación, reinicio y múltiples dispositivos.

---

#### 25. Política canónica propuesta de reintentos

Reglas mínimas:

1. Un retry conserva `operation_id` y payload lógico.
2. Los errores de validación, permiso o conflicto no se reintentan automáticamente.
3. Los timeouts de resultado desconocido se reintentan consultando primero el resultado por clave.
4. Los rate limits respetan `Retry-After` cuando exista.
5. El backoff usa exponencial con jitter y límite.
6. Toda cola define intentos máximos, edad máxima y expiración.
7. Al agotar política, el trabajo pasa a fallo permanente o cola de revisión.
8. Un operador autorizado puede reintentar sin cambiar la identidad de la operación original.
9. Una corrección del payload crea una nueva operación y referencia la anterior.
10. Los reintentos no omiten autorización, validación ni control de versión.
11. El sistema registra intento, fecha, error, duración y resultado.
12. Las respuestas duplicadas no se muestran como errores cuando el efecto ya existe.

---

#### 26. Política canónica propuesta de concurrencia

Cada mutación deberá declarar:

| Campo                 | Pregunta obligatoria                                                       |
| --------------------- | -------------------------------------------------------------------------- |
| recurso protegido     | ¿qué entidad o agregado no puede modificarse simultáneamente sin control?  |
| granularidad          | ¿fila, producto+sede, pedido, turno, caja, LPN, recepción, pago o trabajo? |
| versión               | ¿qué versión leyó el cliente?                                              |
| estrategia            | ¿bloqueo, versión optimista, unique, serialización, reserva o combinación? |
| transición            | ¿qué estados de origen permiten la acción?                                 |
| resultado concurrente | ¿espera, conflicto, duplicate o merge?                                     |
| compensación          | ¿qué ocurre si un efecto secundario falla?                                 |
| auditoría             | ¿qué actor, operación y versión quedan registrados?                        |

No se permitirá un patrón de lectura-modificación-escritura de cantidades críticas sin bloqueo, compare-and-swap o función atómica en servidor.

---

#### 27. Política canónica propuesta de tiempo y orden

Las acciones offline y asíncronas deberán conservar dos tiempos:

```text
client_occurred_at
→ cuándo afirma el dispositivo que ocurrió la acción

server_received_at / server_applied_at
→ cuándo fue recibida y aplicada por la fuente de verdad
```

El reloj del dispositivo no definirá por sí solo precedencia, cierre contable, turno, vencimiento, saldo ni orden definitivo.

Cuando el orden sea relevante se deberá incluir:

- secuencia por agregado;
- versión esperada;
- dependencia de evento anterior;
- política para huecos;
- política para eventos tardíos;
- política para expirados;
- resolución humana cuando no sea seguro ordenar automáticamente.

---

#### 28. Política canónica propuesta de confirmación visible

Los mensajes deberán corresponder al estado real:

| Estado técnico        | Mensaje admisible                             |
| --------------------- | --------------------------------------------- |
| borrador local        | “Borrador guardado en este dispositivo”       |
| cola persistida       | “Pendiente de sincronización”                 |
| servidor recibió      | “Recibido; procesando”                        |
| aplicado              | “Registrado” o equivalente empresarial        |
| duplicado aplicado    | “Ya estaba registrado”                        |
| conflicto             | “No se aplicó porque el recurso cambió”       |
| resultado desconocido | “Verificando resultado; no repitas la acción” |
| fallo permanente      | “No se aplicó; requiere revisión”             |

No se comunicará éxito definitivo inmediatamente después de:

- una actualización optimista;
- guardar en memoria;
- invocar `send` a un periférico;
- iniciar un `fetch`;
- recibir un timeout;
- crear solo una parte de una operación compuesta.

---

#### 29. Inventario consolidado de hallazgos y destinos

| ID               | Hallazgo                                                                    | Estado / severidad                          | Destino exacto                                                                                                                                                                                        | Requisito                               |
| ---------------- | --------------------------------------------------------------------------- | ------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------- |
| `H-CODE-018-001` | ANIMA puede comunicar cola aunque falle persistencia en SecureStore         | `CONFIRMADO` / crítica                      | `ANIMA-AUTH-014`; `ANIMA-UX-011`; `ANIMA-UX-012`; `AUTH-QA-026`; `NFR-REQ-004`                                                                                                                        | `TREQ-ANIMA-003`                        |
| `H-CODE-018-002` | descansos no demuestran deduplicación atómica por `clientEventId`           | `CONFIRMADO` / alta                         | `ANIMA-AUTH-014`; `ANIMA-AUTH-015`; `QUEUE-ARC-003`; `QUEUE-ARC-009`; `AUTH-QA-026`                                                                                                                   | `TREQ-ANIMA-004`                        |
| `H-CODE-018-003` | fallback de marcación evita el contrato completo de sincronización          | `CONFIRMADO` / alta                         | `SUPA-TRANS-006`; `CODE-AUD-020`; `ANIMA-AUTH-015`                                                                                                                                                    | `TREQ-ANIMA-003`; `TREQ-SUPABASE-001`   |
| `H-CODE-018-004` | política de retry depende de heurísticas y no es transversal                | `PARCIAL` / alta                            | `TSVC-CAT-006`; `QUEUE-ARC-006`; `QUEUE-ARC-008`; `NFR-REQ-004`; `NFR-REQ-009`                                                                                                                        | `TREQ-INTEGRATION-003`                  |
| `H-CODE-018-005` | redención PASS se compone en cliente sin atomicidad ni clave idempotente    | `CONFIRMADO` / crítica                      | `PULSO-AUTH-010`; `PASS-INT-002`; `PASS-QA-002`; `INT-SALES-006`; `INT-SALES-007`                                                                                                                     | `TREQ-PASS-008`                         |
| `H-CODE-018-006` | creación concurrente de intentos puede producir respuestas distintas        | `REQUIERE_PRUEBA_CONCURRENTE` / alta        | `INT-EXT-012`; `INT-EXT-015`; `SUPA-ARC-020`; `PASS-QA-002`                                                                                                                                           | `TREQ-PASS-009`                         |
| `H-CODE-018-007` | webhook consulta duplicado antes del efecto y registra después              | `PARCIAL` / crítica                         | `SUPA-AUD-014`; `SUPA-ARC-020`; `INT-EXT-010`; `INT-EXT-012`; `INT-EXT-015`                                                                                                                           | `TREQ-PASS-009`; `TREQ-INTEGRATION-003` |
| `H-CODE-018-008` | ajuste NEXO actualiza ledger, proyecciones y costo secuencialmente          | `CONFIRMADO` / crítica                      | `NEXO-AUTH-011`; `SUPA-AUD-019`; `SUPA-AUD-022`; `SUPA-AUD-023`; `SHELL-CON-023`                                                                                                                      | `TREQ-SUPABASE-002`                     |
| `H-CODE-018-009` | recepción y corrección ORIGO pueden quedar parcialmente aplicadas           | `CONFIRMADO` / crítica                      | `ORIGO-UX-009`; `ORIGO-UX-010`; `ORIGO-UX-014`; `ORIGO-UX-016`; `INT-PROC-002`; `INT-PROC-003`; `INT-PROC-005`                                                                                        | `TREQ-ORIGO-003`                        |
| `H-CODE-018-010` | impresión retira trabajo antes del callback de éxito                        | `CONFIRMADO` / alta                         | `NEXO-UX-037`; `NEXO-UX-038`; `PRINT-ARC-006`; `PRINT-ARC-010`; `PRINT-ARC-011`; `PRINT-ARC-012`; `PRINT-ARC-014`; `PRINT-ARC-017`                                                                    | `TREQ-NEXO-005`                         |
| `H-CODE-018-011` | exactamente una vez en remisiones no está demostrado                        | `REQUIERE_PRUEBA_DE_RECUPERACIÓN` / crítica | `NEXO-UX-009`; `NEXO-UX-010`; `NEXO-UX-011`; `NEXO-UX-012`; `NEXO-UX-013`; `INT-SALES-007`; `SHELL-CON-023`                                                                                           | `TREQ-NEXO-006`                         |
| `H-CODE-018-012` | bloqueos locales no protegen concurrencia distribuida                       | `GOBIERNO` / alta                           | `NFR-REQ-002`; `TSVC-CAT-006`; `QUEUE-ARC-009`; `SHELL-CON-023`; `INT-APP-004`                                                                                                                        | `TREQ-INTEGRATION-003`                  |
| `H-CODE-018-013` | no existe estado común de operación pendiente                               | `NO_IMPLEMENTADO` / alta                    | `NFR-REQ-004`; `UX-STATION-007`; `QUEUE-ARC-002`; `QUEUE-ARC-010`; `INT-APP-008`                                                                                                                      | `TREQ-INTEGRATION-003`                  |
| `H-CODE-018-014` | no existe registro canónico de idempotencia                                 | `GOBIERNO` / alta                           | `SHELL-CON-023`; `TSVC-CAT-006`; `QUEUE-ARC-003`; `INT-APP-004`; `INT-EXT-012`; `INT-DB-005`                                                                                                          | `TREQ-INTEGRATION-003`                  |
| `H-CODE-018-015` | no existe patrón transversal outbox/inbox                                   | `GOBIERNO` / alta                           | `SUPA-AUD-014`; `SUPA-ARC-020`; `QUEUE-ARC-001`; `QUEUE-ARC-002`; `QUEUE-ARC-003`; `QUEUE-ARC-004`; `QUEUE-ARC-005`; `QUEUE-ARC-006`; `QUEUE-ARC-007`; `QUEUE-ARC-008`; `QUEUE-ARC-009`; `INT-DB-007` | `TREQ-INTEGRATION-003`                  |
| `H-CODE-018-016` | borrador, cache, cola y efecto confirmado no están clasificados globalmente | `GOBIERNO` / media                          | `NFR-REQ-004`; `UX-STATION-007`; `ANIMA-UX-011`; `PRINT-ARC-017`                                                                                                                                      | requisitos asociados                    |

Todos los hallazgos tienen destino.

**No se crea ninguna tarea nueva del roadmap.**

---

#### 30. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

##### 30.1. Requisitos reutilizados

- `TREQ-PASS-008` — redención y ledger atómicos e idempotentes;
- `TREQ-NEXO-005` — cola de impresión no pierde ni duplica trabajos;
- `TREQ-NEXO-006` — remisiones y movimientos no producen doble contabilización;
- `TREQ-SUPABASE-001` — fallback legacy con paridad y retiro controlado;
- `TREQ-SUPABASE-002` — operaciones de inventario atómicas o reconciliables.

No se cambia su estado.

##### 30.2. Requisitos nuevos

- `TREQ-ANIMA-003` — una marcación offline solo se presenta como encolada después de persistencia durable; sobrevive reinicio y reintentos y produce un único efecto confirmado por `client_event_id`;
- `TREQ-ANIMA-004` — inicio y cierre de descanso usan identificador idempotente, transición atómica y resultado estable frente a replay, carrera y eventos fuera de orden;
- `TREQ-PASS-009` — creación de intentos y recepción de webhooks de pago resisten solicitudes concurrentes, duplicadas, tardías y fuera de orden sin duplicar ni retroceder efectos;
- `TREQ-ORIGO-003` — una recepción, su efecto de inventario, costo, orden y auditoría se confirman atómicamente o quedan en estado recuperable; el replay no crea una segunda recepción;
- `TREQ-INTEGRATION-003` — toda operación asíncrona o reintentable conserva clave, hash, versión, resultado y política de retry; mismo evento no produce más de un efecto y payload diferente con la misma clave genera conflicto.

Las filas canónicas completas deberán agregarse exclusivamente en:

```text
docs/plan-canonico/modular/bloques/E1_DESCUBRIMIENTO_OPERATIVO/04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md
```

No se duplican filas completas de `04A` dentro de esta tarea.

---

#### 31. Decisiones propuestas

1. La operación offline se definirá por capacidad, no por aplicación completa.
2. Se distinguirán `ONLINE_REQUIRED`, `READ_CACHED`, `LOCAL_DRAFT`, `OFFLINE_QUEUED`, `LOCAL_PERIPHERAL_QUEUE` y `MANUAL_CONTINGENCY`.
3. Un borrador local nunca equivaldrá a una operación empresarial registrada.
4. Una cola solo podrá comunicar estado pendiente después de confirmar persistencia durable.
5. Toda intención reintentable obtendrá un `operation_id` estable antes del primer envío.
6. Todos los reintentos de la misma intención reutilizarán la misma clave y el mismo payload lógico.
7. Misma clave y mismo hash devolverán el resultado estable anterior.
8. Misma clave y payload distinto producirán conflicto.
9. Toda cola offline revalidará actor, permiso, contexto, recurso, versión y vigencia en servidor.
10. Una acción offline pendiente no activará por sí sola contexto, autorización, saldo, stock, pago ni transición terminal.
11. Los errores se clasificarán por códigos canónicos y no únicamente por texto.
12. Los reintentos automáticos usarán backoff con jitter, límites de intentos y edad, expiración y cola de fallos.
13. Un timeout de resultado desconocido se resolverá consultando por clave antes de generar una operación nueva.
14. Los bloqueos de interfaz se conservarán como UX, pero no se considerarán integridad.
15. Las cantidades y transiciones críticas se protegerán mediante bloqueo, versión, unique, serialización o compare-and-swap en servidor.
16. Las operaciones compuestas usarán transacción única o una saga durable e idempotente.
17. Las compensaciones de mejor esfuerzo desde el cliente no sustituirán atomicidad.
18. Webhooks y colas se diseñarán bajo entrega al menos una vez.
19. Todo webhook reclamará o registrará el evento atómicamente antes de producir efectos.
20. Los eventos externos conservarán payload, firma, hash, fuente, intento y fechas.
21. Las máquinas de estado definirán tratamiento de eventos duplicados, tardíos y fuera de orden.
22. La redención PASS se trasladará a una acción de servidor atómica e idempotente.
23. La creación de intentos de pago devolverá un resultado canónico reutilizable para la transacción vigente.
24. El webhook de pagos no dependerá de un UUID aleatorio para deduplicar un evento sin ID del proveedor.
25. Los ajustes de inventario no actualizarán ledger y proyecciones mediante escrituras independientes desde una ruta de aplicación.
26. Las recepciones ORIGO y sus correcciones se convertirán en operaciones atómicas o sagas recuperables.
27. Un trabajo de impresión no se eliminará antes del acuse definido.
28. Reimpresión y retry técnico serán acciones diferentes y auditables.
29. ANIMA conservará su índice único y resultados `applied`, `duplicate` y `conflict` como patrón positivo.
30. ANIMA no degradará silenciosamente a un contrato de inserción alternativo cuando falte la RPC canónica.
31. Los descansos incorporarán idempotencia real en servidor.
32. El sistema conservará hora del dispositivo y hora de servidor sin usar el reloj cliente como única precedencia.
33. E3 decidirá persistencia, constraints, bloqueo, outbox/inbox y conciliación.
34. E4 decidirá contratos de cola, impresión, notificaciones, reintentos y fallos.
35. E5 asignará cada requisito a un paquete con pruebas de pérdida de red, replay, concurrencia, recuperación y hardware cuando aplique.
36. Los cinco requisitos nuevos se registrarán únicamente en `04A`.
37. No se crea una tarea nueva del roadmap.
38. `CODE-AUD-019` permanecerá como única continuidad reservada después de la aprobación.

---

#### 32. Límites de certeza

Esta tarea no confirma:

- que una duplicación o pérdida ya haya ocurrido en producción;
- el comportamiento de SecureStore cuando el sistema operativo elimina credenciales o la aplicación se reinstala;
- la misma semántica de almacenamiento entre iOS y Android;
- que dos webhooks concurrentes hayan aplicado un efecto dos veces;
- que Wompi entregue eventos sin identificador;
- la precedencia final aprobada entre estados de pago fuera de orden;
- qué nivel de confirmación física soporta cada modelo de impresora;
- que BrowserPrint pueda confirmar impresión material y no solo recepción del comando;
- la atomicidad interna de RPC no inspeccionadas en esta tarea;
- la cobertura completa de cada transición de remisiones;
- el comportamiento del POS externo ante replay;
- los límites de rate, timeout y retry de proveedores externos;
- la política final de retención de claves idempotentes;
- la tecnología definitiva de cola, worker, outbox o inbox;
- qué capacidades adicionales deberán admitir operación offline después del diseño E2.

Estas incertidumbres tienen destino en tareas existentes y no invalidan los defectos estáticos confirmados.

---

#### 33. Criterios de aceptación

`CODE-AUD-018` podrá aprobarse cuando:

- operación offline, borrador local, cache y cola periférica estén diferenciados;
- la única cola empresarial offline actual quede identificada;
- los controles positivos de ANIMA queden preservados;
- la pérdida posible por fallo de persistencia local quede documentada;
- los descansos queden separados de la idempotencia de marcaciones normales;
- el fallback de sincronización quede clasificado;
- reintento y nueva operación no se confundan;
- los errores retryable y permanentes requieran códigos canónicos;
- la redención PASS quede clasificada como no atómica;
- intentos y webhooks de pagos queden evaluados por replay y concurrencia;
- ajustes NEXO queden evaluados por carrera, atomicidad y reintento;
- recepción ORIGO quede evaluada como operación compuesta;
- la cola de impresión no se considere durable ni confirmada;
- remisiones conserven su requisito de exactamente una vez sin afirmar un fallo no probado;
- los bloqueos locales no se presenten como control distribuido;
- exista una política propuesta de modalidad offline;
- exista una política propuesta de idempotencia, retry, tiempo, orden y confirmación visible;
- cada hallazgo tenga destino documental exacto;
- los requisitos reutilizados y nuevos tengan identificador único;
- las filas completas nuevas se incorporen únicamente en `04A`;
- no se creen tareas redundantes;
- no se modifique código, CI, despliegues ni Supabase;
- `CODE-AUD-019` permanezca como continuidad reservada.

---

#### 34. Resultado y continuidad

Al aprobarse quedará definida la cadena:

```text
capacidad y modalidad de conectividad
→ operación identificada antes del primer envío
→ persistencia local cuando corresponda
→ reintento con la misma identidad
→ revalidación y control de versión en servidor
→ deduplicación y concurrencia
→ transacción o saga recuperable
→ resultado estable
→ confirmación visible correcta
→ auditoría, conciliación y prueba
```

La continuidad será:

```text
CODE-AUD-019
— Vincular cada capacidad con su implementación actual verificable
```


### ✅ CODE-AUD-019 — Vincular cada capacidad con su implementación actual verificable

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Tipo:** consolidación transversal de trazabilidad capacidad → implementación → contrato → evidencia → brecha  
**Dependencia anterior:** `CODE-AUD-018` — APROBADA  
**Continuidad reservada:** `CODE-AUD-020`  
**Línea base funcional:** `LB-CAP-VENTO-001 v1.0` — 18 familias y 217 subcapacidades  
**Fecha de corte:** 2026-07-24  
**Cambios en código, CI, despliegues o Supabase:** no realizados  

---

#### 1. Resultado de esta tarea

Esta tarea crea el registro `MAP-IMPL-CAP-001`, que vincula individualmente las **217 subcapacidades** de `LB-CAP-VENTO-001 v1.0` con la implementación actual que puede comprobarse mediante repositorios, superficies, contratos de servidor, objetos de datos, despliegues, uso operativo o evidencia manual y externa.

La cadena aprobable será:

```text
capacidad empresarial
→ aplicación propietaria candidata
→ repositorio o medio que la representa actualmente
→ ruta, acción, contrato, dato, dispositivo o tercero
→ estado de vinculación verificable
→ limitación o brecha
→ tarea exacta que deberá resolverla
```

Resultado cuantitativo:

| Estado de vinculación                      | Subcapacidades |
| ------------------------------------------ | -------------: |
| `IMPLEMENTACIÓN_VERIFICADA_EN_USO`         |         **29** |
| `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        |         **96** |
| `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` |         **27** |
| `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   |         **48** |
| `SIN_IMPLEMENTACIÓN_VERIFICABLE`           |         **16** |
| `FUTURA_CON_BASE_TÉCNICA`                  |          **1** |
| **Total**                                  |        **217** |

Las cantidades describen la evidencia localizada en el corte. No equivalen a porcentaje de avance, prioridad ni aceptación operativa.

---

#### 2. Qué significa vincular una capacidad

Una capacidad queda vinculada cuando el registro identifica, como mínimo:

1. su identificador y resultado empresarial;
2. la aplicación propietaria candidata aprobada;
3. el repositorio, servicio, archivo, documento, dispositivo o tercero que la representa hoy;
4. una superficie o contrato reproducible;
5. la persistencia, evento o evidencia que conserva el resultado;
6. el estado real de esa vinculación;
7. la limitación que impide declararla completa;
8. la tarea exacta que deberá convertir la brecha en backlog, diseño o implementación.

No basta con encontrar:

- un permiso;
- una tabla;
- una ruta;
- un componente;
- un prototipo;
- una pantalla vacía;
- una migración histórica;
- una aplicación registrada;
- una operación manual no confirmada.

La vinculación debe conservar la diferencia entre **existencia técnica**, **uso comprobado**, **estructura sin uso**, **operación manual o externa**, **ausencia** y **base futura**.

---

#### 3. Estados de vinculación

| Estado                                     | Regla                                                                                                                                                                |
| ------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `IMPLEMENTACIÓN_VERIFICADA_EN_USO`         | se localizaron superficie, contrato y persistencia, además de datos o evidencia de operación suficiente; puede seguir siendo parcial respecto del resultado objetivo |
| `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | existe una representación reproducible, pero faltan etapas, autorización, adopción, corrección, auditoría, integración o evidencia de uso completa                   |
| `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | existen código, tablas, RPC o pantallas, pero no datos o adopción operativa comprobada                                                                               |
| `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | el resultado se obtiene actualmente mediante personas, archivos, papel, mensajes, sistemas externos o terceros; no se presenta como implementación interna           |
| `SIN_IMPLEMENTACIÓN_VERIFICABLE`           | no se localizó una representación técnica suficiente ni evidencia operativa concreta para vincular el resultado sin inventarlo                                       |
| `FUTURA_CON_BASE_TÉCNICA`                  | existe una base técnica reutilizable, pero no un producto desplegado, adoptado y aprobado como operación actual                                                      |

Un estado de vinculación no sustituye los estados de cobertura de `CAP-MAP-014`, la clasificación empresarial de `CAP-MAP-012` ni la propiedad definitiva que se resolverá en `CAP-SCOPE-001` a `CAP-SCOPE-019`.

---

#### 4. Fuentes y corte de evidencia

El mapa consolida exclusivamente evidencia ya obtenida en:

- `CAP-MAP-001` a `CAP-MAP-015`;
- `CODE-AUD-001` a `CODE-AUD-018`;
- repositorios reconocidos de Vento OS;
- proyecto Supabase `vento-os-dev`;
- despliegues Vercel, Expo/EAS y tiendas comprobados;
- procesos manuales, externos y documentos registrados en `OPS-AUD-*` y `OPS-PLAN-*`;
- requisitos de prueba vigentes en `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`.

El repositorio `vento-shell` se reconoce como propietario técnico de migraciones y contratos compartidos. No se convierte por ello en propietario empresarial de todas las capacidades.

---

#### 5. Paquetes de evidencia reutilizables

Cada fila de la matriz referencia uno o más paquetes. El paquete permite repetir evidencia sin ocultar la vinculación individual de las 217 subcapacidades.

| Código   | Paquete                                   | Evidencia reproducible                                                                                                                                                                                                                                                                                                                              |
| -------- | ----------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `EVC-01` | Gobierno y estructura VISO                | `vento-viso`: Server Actions de empresas, sedes, áreas, roles, permisos y navegación; relaciones `companies`, `sites`, `areas`, `roles`, `app_permissions`, `role_permissions` y `employee_permissions`. Contraste: `CODE-AUD-003`, `005`, `006`, `009`, `014` y `017`.                                                                             |
| `EVC-02` | Personas, turnos e invitaciones           | `vento-viso` y `vento-shell`: trabajadores, perfiles, sedes, áreas, turnos, publicación, invitaciones y retiro; Edge Functions `staff-invitations-*`, `attendance-report`, `employee-delete` y `shift-runtime-processor`. Contraste: `CODE-AUD-003`, `005`, `006`, `011`, `012` y `017`.                                                            |
| `EVC-03` | Asistencia y experiencia ANIMA            | `vento-anima`: pantallas y hooks de asistencia; `queue-storage.ts`, `queue-sync.ts`, `use-attendance.ts`, `break-rpc.ts`; RPC `sync_attendance_events`, `start_attendance_break`, `end_attendance_break`; cron de cierre. Contraste: `CODE-AUD-003`, `005`, `006`, `012`, `017` y `018`.                                                            |
| `EVC-04` | Base técnica TALENTO                      | `vento-talento`: vacantes, postulación, perfil, documentos, entrevistas y ofertas; RPC `bootstrap_my_candidate`, `submit_application`, `confirm_interview`, `respond_to_offer`; esquema `talento` y buckets privados. No hay despliegue ni registros operativos comprobados. Contraste: `CAP-MAP-014`, `CODE-AUD-001`, `003`, `005`, `006` y `011`. |
| `EVC-05` | Catálogo de producto NEXO/VISO            | `vento-nexo` y `vento-viso`: productos, categorías, presentaciones, unidades, ingredientes, imágenes, menú y disponibilidad; buckets `nexo-catalog-images`, `product-images` y `commercial-menu-images`. Contraste: `CODE-AUD-003`, `005`, `006`, `014` y `017`.                                                                                    |
| `EVC-06` | Recetas y conocimiento FOGO               | `vento-fogo`: acciones de recetas, ingredientes, salidas, pasos, rendimientos y fotos; bucket `recipe-step-photos`; tablas de recetas con datos. Contraste: `CAP-MAP-014`, `CODE-AUD-003`, `005`, `006` y `012`.                                                                                                                                    |
| `EVC-07` | Compras y proveedores ORIGO               | `vento-origo`: proveedores, órdenes, líneas, revisión maestra y recepción; Server Actions y RPC `origo_mark_inventory_entry_corrected`, `origo_reverse_inventory_entry`, `upsert_inventory_stock_by_location`. La recepción nueva conserva estructura sin adopción comprobada. Contraste: `CODE-AUD-003`, `005`, `006`, `012`, `017` y `018`.       |
| `EVC-08` | Inventario, ubicaciones y remisiones NEXO | `vento-nexo`: existencias, movimientos, entradas, ubicaciones, posiciones, conteos, solicitudes, remisiones y traslados; APIs `/api/inventory/*`; RPC de conteo, consumo, recepción, reversión y remisión. Contraste: `CODE-AUD-003`, `005`, `006`, `011`, `012`, `014`, `017` y `018`.                                                             |
| `EVC-09` | Activos y reutilizables NEXO              | `vento-nexo`: activos, grupos, custodia, movimientos, mantenimiento, conteos, documentos y vehículos. Hay superficies y tablas; mantenimiento y conteos patrimoniales no tienen uso comprobado. Contraste: `CAP-MAP-014`, `CODE-AUD-003`, `005`, `006`, `011` y `012`.                                                                              |
| `EVC-10` | Ejecución productiva FOGO                 | `vento-fogo` y objetos compartidos: solicitudes, lotes, consumos, salidas, paquetes, cantidades, firma de dispositivo y efectos de inventario. Las estructuras productivas revisadas no tienen registros operativos comprobados. Contraste: `CAP-MAP-014`, `CODE-AUD-003`, `005`, `006`, `011`, `012` y `018`.                                      |
| `EVC-11` | Pedidos, venta, salón y POS PULSO         | `vento-pulso`: pedidos, transiciones, conversación, atención de mesa, identificación, importación de ventas y RPC POS; Realtime de pedidos y mensajes. El POS integral, caja y cierre conservan tablas sin uso comprobado. Contraste: `CAP-MAP-014`, `CODE-AUD-003`, `005`, `006`, `011`, `012`, `014`, `017` y `018`.                              |
| `EVC-12` | Cliente, fidelización y comercio PASS     | `vento-pass`: perfil, membresía, QR, redención, direcciones, checkout, pedido, pago, seguimiento, chat, Wallet y notificaciones; RPC de wallet, checkout, chat y entrega; Edge Functions de pago, dirección, entrega y cuenta. Contraste: `CODE-AUD-003`, `005`, `006`, `008` a `018`.                                                              |
| `EVC-13` | Transporte y entrega                      | NEXO cubre traslados y remisiones; PULSO/PASS cubren pedido y entrega; `delivery-portal` remoto opera por token y `service_role`; las sesiones de entrega nuevas no tienen uso comprobado. Contraste: `CODE-AUD-005`, `006`, `011`, `012`, `015`, `017` y `018`.                                                                                    |
| `EVC-14` | Finanzas, pagos y costos                  | `vento-numera`: gastos, centros de costo, presupuestos y resúmenes; PULSO/PASS: pagos y venta; ORIGO/NEXO: costos, compras y documentos internos. Bancos, cartera, tesorería, impuestos y cierre contable no están completos. Contraste: `CAP-MAP-014`, `CODE-AUD-003`, `005`, `006`, `011`, `012`, `017` y `018`.                                  |
| `EVC-15` | Instalaciones                             | Sedes, áreas, ubicaciones y activos permiten identificar espacios y equipos, pero no existe módulo ni ciclo dedicado para mantenimiento de instalaciones, limpieza, plagas, servicios, calibración, llaves, obras y cierre de novedades. Contraste: `CAP-MAP-014`, `CODE-AUD-011`, `012` y `015`.                                                   |
| `EVC-16` | CMS y web pública                         | `vento-viso`: `website_blocks`, `website_items`, medios y publicación; `Vento-Group`: rutas públicas y contenido; `website-media` requiere reconciliar su entrega. Newsletter no tiene efecto. Contraste: `CODE-AUD-003`, `006`, `010`, `012`, `014`, `017` y `018`.                                                                                |
| `EVC-17` | Tecnología, autorización y periféricos    | `vento-shell`, SHELL y aplicaciones: Auth, contexto efectivo, permisos, dispositivos compartidos, navegación, builds, workflows, soporte ANIMA e impresión NEXO/BrowserPrint. Contraste: `CODE-AUD-001`, `003`, `005`, `006`, `011`, `012`, `014`, `016`, `017` y `018`.                                                                            |
| `EVC-18` | Documentos y evidencia                    | ANIMA/VISO usan `documents`; VISO usa medios e imágenes; TALENTO usa tres buckets privados; existen reglas, tipos y solicitudes, pero retención, versiones, firmas, acceso temporal y eliminación integral siguen incompletos. Contraste: `CODE-AUD-003`, `006`, `012`, `015` y `017`.                                                              |
| `EVC-19` | Reportes y analítica                      | NUMERA ofrece resúmenes, equilibrio y rentabilidad; NEXO y VISO exportan o reportan dominios puntuales; PULSO carece de exportación de auditoría comprobada. No existe marco común completo de indicadores, calidad y mejora. Contraste: `CAP-MAP-014`, `CODE-AUD-003`, `005`, `006`, `011` y `016`.                                                |
| `EVC-20` | Continuidad y recuperación                | Existen colas offline ANIMA, tickets, cron, reconciliación de pagos, account deletion, backups de plataforma y estados técnicos aislados; no existe un ciclo empresarial integral de continuidad, incorporación posterior y cierre de pendientes. Contraste: `CAP-MAP-014`, `CODE-AUD-005`, `006`, `011`, `016` y `018`.                            |
| `EVC-21` | Operación manual o externa                | Evidencia AS-IS en papel, Excel, WhatsApp, Makos, Rappi, ManyChat, Shopify, bancos, asesores, proveedores y coordinación humana. Esta evidencia demuestra que la capacidad existe, no que esté implementada en Vento OS. Contraste: `OPS-AUD-*`, `OPS-PLAN-*`, `CAP-MAP-005`, `014` y `CODE-AUD-003`.                                               |
| `EVC-22` | Ausencia técnica comprobada               | No se localizó una ruta, servicio, contrato, objeto de datos y ciclo utilizable suficiente para el resultado. La ausencia se conserva como brecha y no se transforma en código ficticio. Contraste: `CAP-MAP-014`, `CODE-AUD-010`, `011`, `012` y `015`.                                                                                            |
| `EVC-23` | Plataforma Supabase compartida            | `vento-shell` conserva migraciones, RLS, funciones, triggers, Edge Functions, cron y contratos compartidos. Es propietario técnico de la plataforma, no propietario empresarial universal. Contraste: `CODE-AUD-005`, `006`, `013`, `014`, `015`, `017` y `018`.                                                                                    |

---

#### 6. Reglas de lectura de la matriz

1. **Propietaria candidata** conserva las decisiones de `CAP-MAP-004`; no es propiedad definitiva.
2. **Implementación actual localizada** describe dónde se representa hoy el resultado, aunque la representación sea parcial, manual o inexistente.
3. **Evidencia** remite a los paquetes de la sección 5 y a las auditorías allí enumeradas.
4. **Destino** siempre contiene tareas existentes; `CODE-AUD-020` deberá convertir la evidencia en backlog técnico y funcional por repositorio.
5. Una fila `VERIFICADA_EN_USO` no declara terminada la capacidad TO-BE.
6. Una fila `ESTRUCTURA_SIN_USO_COMPROBADO` no autoriza poblar datos ni desplegar el flujo.
7. Una fila `MANUAL_O_EXTERNA_DOCUMENTADA` no autoriza eliminar el método actual antes del reemplazo y la transición.
8. Una fila `SIN_IMPLEMENTACIÓN_VERIFICABLE` no se interpreta como capacidad innecesaria.

---

#### 7. Matriz completa de las 217 subcapacidades

##### 7.1. `CAP-01` — Dirección y gobierno

| ID          | Subcapacidad                                    | Propietaria candidata | Implementación actual localizada                                        | Evidencia          | Estado de vinculación                    | Destino exacto                  |
| ----------- | ----------------------------------------------- | --------------------- | ----------------------------------------------------------------------- | ------------------ | ---------------------------------------- | ------------------------------- |
| `CAP-01.01` | Definir dirección y objetivos                   | VISO                  | Decisión o relación humana; VISO conserva estructura relacionada.       | `EVC-01`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-001` |
| `CAP-01.02` | Tomar y registrar decisiones empresariales      | VISO                  | Decisión o relación humana; VISO conserva estructura relacionada.       | `EVC-01`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-001` |
| `CAP-01.03` | Gobernar empresas, marcas y establecimientos    | VISO                  | VISO: empresas, sedes, áreas y estructura organizativa desplegada.      | `EVC-01`           | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`       | `CODE-AUD-020`, `CAP-SCOPE-001` |
| `CAP-01.04` | Gobernar sedes, oficinas y áreas                | VISO                  | VISO: empresas, sedes, áreas y estructura organizativa desplegada.      | `EVC-01`           | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`       | `CODE-AUD-020`, `CAP-SCOPE-001` |
| `CAP-01.05` | Definir responsabilidades y límites de decisión | VISO                  | VISO: roles, permisos, reglas y coordinación administrativa parcial.    | `EVC-01`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-001` |
| `CAP-01.06` | Gestionar políticas y reglas internas           | VISO                  | VISO: roles, permisos, reglas y coordinación administrativa parcial.    | `EVC-01`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-001` |
| `CAP-01.07` | Gestionar riesgos empresariales                 | VISO                  | VISO: roles, permisos, reglas y coordinación administrativa parcial.    | `EVC-01`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-001` |
| `CAP-01.08` | Coordinar operación entre negocios y sedes      | VISO                  | VISO: roles, permisos, reglas y coordinación administrativa parcial.    | `EVC-01`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-001` |
| `CAP-01.09` | Gestionar relaciones con asesores y autoridades | VISO                  | Decisión o relación humana; VISO conserva estructura relacionada.       | `EVC-01`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-001` |
| `CAP-01.10` | Verificar cumplimiento de decisiones            | VISO                  | No se localizó ciclo técnico para comprobar cumplimiento de decisiones. | `EVC-01`, `EVC-22` | `SIN_IMPLEMENTACIÓN_VERIFICABLE`         | `CODE-AUD-020`, `CAP-SCOPE-001` |

##### 7.2. `CAP-02` — Personas y trabajo

| ID          | Subcapacidad                                | Propietaria candidata         | Implementación actual localizada                                                             | Evidencia                              | Estado de vinculación                    | Destino exacto                                                                                                            |
| ----------- | ------------------------------------------- | ----------------------------- | -------------------------------------------------------------------------------------------- | -------------------------------------- | ---------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| `CAP-02.01` | Planear necesidades de personal             | VISO                          | VISO: administración laboral parcial.                                                        | `EVC-02`                               | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-002`                                                                                           |
| `CAP-02.02` | Reclutar y seleccionar                      | TALENTO + VISO                | VISO publica vacantes; TALENTO tiene código y esquema sin despliegue ni datos.               | `EVC-04`, `EVC-02`                     | `FUTURA_CON_BASE_TÉCNICA`                | `CODE-AUD-020`, `CAP-SCOPE-002`, `CAP-TAL-001`, `CAP-TAL-002`, `CAP-TAL-003`, `CAP-TAL-004`, `CAP-TAL-005`, `CAP-TAL-006` |
| `CAP-02.03` | Vincular e incorporar trabajadores          | TALENTO → VISO / ANIMA        | VISO/Edge Functions gestionan invitación; ANIMA completa acceso; traspaso TALENTO pendiente. | `EVC-04`, `EVC-02`, `EVC-03`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-002`, `CAP-TAL-001`, `CAP-TAL-002`, `CAP-TAL-003`, `CAP-TAL-004`, `CAP-TAL-005`, `CAP-TAL-006` |
| `CAP-02.04` | Mantener información laboral                | VISO                          | VISO: empleados, sedes, áreas, perfiles y turnos con datos operativos.                       | `EVC-02`                               | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`       | `CODE-AUD-020`, `CAP-SCOPE-002`                                                                                           |
| `CAP-02.05` | Asignar sedes, áreas y funciones            | VISO                          | VISO: empleados, sedes, áreas, perfiles y turnos con datos operativos.                       | `EVC-02`                               | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`       | `CODE-AUD-020`, `CAP-SCOPE-002`                                                                                           |
| `CAP-02.06` | Programar turnos                            | VISO                          | VISO: empleados, sedes, áreas, perfiles y turnos con datos operativos.                       | `EVC-02`                               | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`       | `CODE-AUD-020`, `CAP-SCOPE-002`                                                                                           |
| `CAP-02.07` | Registrar asistencia y tiempo trabajado     | ANIMA                         | ANIMA: marcación, ubicación, descansos, cola offline y RPC de sincronización.                | `EVC-03`, `EVC-23`                     | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-002`, `INT-WORK-003`, `ANIMA-UX-011`, `ANIMA-UX-012`                                           |
| `CAP-02.08` | Gestionar novedades, ausencias y reemplazos | VISO                          | VISO/ANIMA: novedades y asistencia parcial, sin corrección auditable completa.               | `EVC-02`, `EVC-03`                     | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-002`, `INT-WORK-003`, `ANIMA-UX-011`, `ANIMA-UX-012`                                           |
| `CAP-02.09` | Capacitar y comprobar preparación           | VISO                          | Seguimiento principalmente humano; documentos y datos parciales en VISO/ANIMA.               | `EVC-02`, `EVC-21`                     | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-002`                                                                                           |
| `CAP-02.10` | Acompañar desempeño y desarrollo            | VISO                          | Seguimiento principalmente humano; documentos y datos parciales en VISO/ANIMA.               | `EVC-02`, `EVC-21`                     | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-002`                                                                                           |
| `CAP-02.11` | Gestionar documentos laborales              | ANIMA / VISO / TALENTO        | Storage y tablas laborales en ANIMA/VISO; TALENTO conserva base futura.                      | `EVC-18`, `EVC-02`, `EVC-03`, `EVC-04` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-002`, `CAP-TAL-001`, `CAP-TAL-002`, `CAP-TAL-003`, `CAP-TAL-004`, `CAP-TAL-005`, `CAP-TAL-006` |
| `CAP-02.12` | Gestionar pagos y beneficios laborales      | NUMERA (candidata pendiente)  | Pago laboral atendido fuera del sistema; NUMERA no cubre nómina completa.                    | `EVC-14`, `EVC-21`                     | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-002`                                                                                           |
| `CAP-02.13` | Gestionar retiro y cierre de accesos        | VISO + aplicaciones afectadas | VISO y Edge Functions permiten retiro parcial; cierre transversal de accesos incompleto.     | `EVC-02`, `EVC-17`                     | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-002`, `CAP-TAL-001`, `CAP-TAL-002`, `CAP-TAL-003`, `CAP-TAL-004`, `CAP-TAL-005`, `CAP-TAL-006` |

##### 7.3. `CAP-03` — Seguridad, salud y cumplimiento

| ID          | Subcapacidad                                 | Propietaria candidata | Implementación actual localizada                                                             | Evidencia                    | Estado de vinculación               | Destino exacto                  |
| ----------- | -------------------------------------------- | --------------------- | -------------------------------------------------------------------------------------------- | ---------------------------- | ----------------------------------- | ------------------------------- |
| `CAP-03.01` | Identificar peligros y riesgos laborales     | VISO                  | Documentos, reglas y controles dispersos en VISO/NEXO/FOGO; operación principalmente manual. | `EVC-02`, `EVC-18`, `EVC-21` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-003` |
| `CAP-03.02` | Prevenir accidentes y enfermedades           | VISO                  | Documentos, reglas y controles dispersos en VISO/NEXO/FOGO; operación principalmente manual. | `EVC-02`, `EVC-18`, `EVC-21` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-003` |
| `CAP-03.03` | Entregar y controlar elementos de protección | VISO                  | Documentos, reglas y controles dispersos en VISO/NEXO/FOGO; operación principalmente manual. | `EVC-02`, `EVC-18`, `EVC-21` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-003` |
| `CAP-03.04` | Reportar e investigar incidentes             | VISO                  | Documentos, reglas y controles dispersos en VISO/NEXO/FOGO; operación principalmente manual. | `EVC-02`, `EVC-18`, `EVC-21` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-003` |
| `CAP-03.05` | Gestionar emergencias y evacuación           | VISO                  | Documentos, reglas y controles dispersos en VISO/NEXO/FOGO; operación principalmente manual. | `EVC-02`, `EVC-18`, `EVC-21` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-003` |
| `CAP-03.06` | Controlar higiene e inocuidad                | VISO                  | Documentos, reglas y controles dispersos en VISO/NEXO/FOGO; operación principalmente manual. | `EVC-02`, `EVC-18`, `EVC-21` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-003` |
| `CAP-03.07` | Realizar inspecciones obligatorias           | VISO                  | Documentos, reglas y controles dispersos en VISO/NEXO/FOGO; operación principalmente manual. | `EVC-02`, `EVC-18`, `EVC-21` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-003` |
| `CAP-03.08` | Gestionar requisitos legales y certificados  | VISO                  | Documentos, reglas y controles dispersos en VISO/NEXO/FOGO; operación principalmente manual. | `EVC-02`, `EVC-18`, `EVC-21` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-003` |
| `CAP-03.09` | Conservar evidencia de cumplimiento          | VISO                  | Documentos, reglas y controles dispersos en VISO/NEXO/FOGO; operación principalmente manual. | `EVC-02`, `EVC-18`, `EVC-21` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-003` |
| `CAP-03.10` | Gestionar acciones correctivas               | VISO                  | Documentos, reglas y controles dispersos en VISO/NEXO/FOGO; operación principalmente manual. | `EVC-02`, `EVC-18`, `EVC-21` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-003` |

##### 7.4. `CAP-04` — Productos, preparaciones y conocimiento

| ID          | Subcapacidad                                  | Propietaria candidata | Implementación actual localizada                                                    | Evidencia                    | Estado de vinculación               | Destino exacto                  |
| ----------- | --------------------------------------------- | --------------------- | ----------------------------------------------------------------------------------- | ---------------------------- | ----------------------------------- | ------------------------------- |
| `CAP-04.01` | Definir productos y servicios                 | NEXO                  | NEXO/VISO: catálogo, presentaciones, unidades, categorías e ingredientes con datos. | `EVC-05`                     | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`  | `CODE-AUD-020`, `CAP-SCOPE-004` |
| `CAP-04.02` | Definir presentaciones y unidades             | NEXO                  | NEXO/VISO: catálogo, presentaciones, unidades, categorías e ingredientes con datos. | `EVC-05`                     | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`  | `CODE-AUD-020`, `CAP-SCOPE-004` |
| `CAP-04.03` | Clasificar productos                          | NEXO                  | NEXO/VISO: catálogo, presentaciones, unidades, categorías e ingredientes con datos. | `EVC-05`                     | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`  | `CODE-AUD-020`, `CAP-SCOPE-004` |
| `CAP-04.04` | Gestionar ingredientes y componentes          | NEXO                  | NEXO/VISO: catálogo, presentaciones, unidades, categorías e ingredientes con datos. | `EVC-05`                     | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`  | `CODE-AUD-020`, `CAP-SCOPE-004` |
| `CAP-04.05` | Definir recetas y métodos de preparación      | FOGO                  | FOGO: recetas, pasos, rendimientos y porciones con persistencia comprobada.         | `EVC-06`, `EVC-05`           | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`  | `CODE-AUD-020`, `CAP-SCOPE-004` |
| `CAP-04.06` | Definir rendimientos y porciones              | FOGO                  | FOGO: recetas, pasos, rendimientos y porciones con persistencia comprobada.         | `EVC-06`, `EVC-05`           | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`  | `CODE-AUD-020`, `CAP-SCOPE-004` |
| `CAP-04.07` | Gestionar menús y disponibilidad              | PULSO                 | VISO/NEXO/PULSO/PASS: menú, oferta y disponibilidad parcial por canal.              | `EVC-05`, `EVC-11`, `EVC-12` | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`  | `CODE-AUD-020`, `CAP-SCOPE-004` |
| `CAP-04.08` | Gestionar información nutricional y alérgenos | NEXO / FOGO           | NEXO/FOGO: campos y reglas parciales de especificación, calidad y vigencia.         | `EVC-05`, `EVC-06`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-004` |
| `CAP-04.09` | Gestionar calidad y especificaciones          | NEXO / FOGO           | NEXO/FOGO: campos y reglas parciales de especificación, calidad y vigencia.         | `EVC-05`, `EVC-06`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-004` |
| `CAP-04.10` | Gestionar cambios y vigencia del conocimiento | NEXO / FOGO           | NEXO/FOGO: campos y reglas parciales de especificación, calidad y vigencia.         | `EVC-05`, `EVC-06`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-004` |

##### 7.5. `CAP-05` — Abastecimiento

| ID          | Subcapacidad                                | Propietaria candidata | Implementación actual localizada                                                                   | Evidencia                    | Estado de vinculación                      | Destino exacto                                                                                  |
| ----------- | ------------------------------------------- | --------------------- | -------------------------------------------------------------------------------------------------- | ---------------------------- | ------------------------------------------ | ----------------------------------------------------------------------------------------------- |
| `CAP-05.01` | Planear necesidades de abastecimiento       | ORIGO                 | ORIGO: proveedores, solicitudes y órdenes mediante acciones y tablas; adopción parcial.            | `EVC-07`, `EVC-08`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-005`, `ORIGO-UX-009`, `ORIGO-UX-010`, `ORIGO-UX-014`, `ORIGO-UX-016` |
| `CAP-05.02` | Solicitar productos, materiales o servicios | ORIGO                 | ORIGO: proveedores, solicitudes y órdenes mediante acciones y tablas; adopción parcial.            | `EVC-07`, `EVC-08`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-005`, `ORIGO-UX-009`, `ORIGO-UX-010`, `ORIGO-UX-014`, `ORIGO-UX-016` |
| `CAP-05.03` | Buscar y evaluar proveedores                | ORIGO                 | ORIGO: proveedores, solicitudes y órdenes mediante acciones y tablas; adopción parcial.            | `EVC-07`, `EVC-08`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-005`, `ORIGO-UX-009`, `ORIGO-UX-010`, `ORIGO-UX-014`, `ORIGO-UX-016` |
| `CAP-05.04` | Solicitar y comparar ofertas                | ORIGO                 | ORIGO conserva datos parciales; comparación, negociación, devolución o evaluación siguen manuales. | `EVC-07`, `EVC-08`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-005`, `ORIGO-UX-009`, `ORIGO-UX-010`, `ORIGO-UX-014`, `ORIGO-UX-016` |
| `CAP-05.05` | Negociar condiciones                        | ORIGO                 | ORIGO conserva datos parciales; comparación, negociación, devolución o evaluación siguen manuales. | `EVC-07`, `EVC-08`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-005`, `ORIGO-UX-009`, `ORIGO-UX-010`, `ORIGO-UX-014`, `ORIGO-UX-016` |
| `CAP-05.06` | Aprobar compras                             | ORIGO                 | ORIGO: proveedores, solicitudes y órdenes mediante acciones y tablas; adopción parcial.            | `EVC-07`, `EVC-08`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-005`, `ORIGO-UX-009`, `ORIGO-UX-010`, `ORIGO-UX-014`, `ORIGO-UX-016` |
| `CAP-05.07` | Emitir y controlar órdenes                  | ORIGO                 | ORIGO: proveedores, solicitudes y órdenes mediante acciones y tablas; adopción parcial.            | `EVC-07`, `EVC-08`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-005`, `ORIGO-UX-009`, `ORIGO-UX-010`, `ORIGO-UX-014`, `ORIGO-UX-016` |
| `CAP-05.08` | Recibir productos y servicios               | ORIGO                 | ORIGO: recepción y verificación implementadas como estructura; cero uso comprobado.                | `EVC-07`, `EVC-08`           | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-005`, `ORIGO-UX-009`, `ORIGO-UX-010`, `ORIGO-UX-014`, `ORIGO-UX-016` |
| `CAP-05.09` | Verificar cantidades, calidad y documentos  | ORIGO                 | ORIGO: recepción y verificación implementadas como estructura; cero uso comprobado.                | `EVC-07`, `EVC-08`           | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-005`, `ORIGO-UX-009`, `ORIGO-UX-010`, `ORIGO-UX-014`, `ORIGO-UX-016` |
| `CAP-05.10` | Gestionar diferencias y devoluciones        | ORIGO                 | ORIGO conserva datos parciales; comparación, negociación, devolución o evaluación siguen manuales. | `EVC-07`, `EVC-08`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-005`, `ORIGO-UX-009`, `ORIGO-UX-010`, `ORIGO-UX-014`, `ORIGO-UX-016` |
| `CAP-05.11` | Evaluar cumplimiento de proveedores         | ORIGO                 | ORIGO conserva datos parciales; comparación, negociación, devolución o evaluación siguen manuales. | `EVC-07`, `EVC-08`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-005`, `ORIGO-UX-009`, `ORIGO-UX-010`, `ORIGO-UX-014`, `ORIGO-UX-016` |
| `CAP-05.12` | Gestionar compras urgentes                  | ORIGO                 | ORIGO conserva datos parciales; comparación, negociación, devolución o evaluación siguen manuales. | `EVC-07`, `EVC-08`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-005`, `ORIGO-UX-009`, `ORIGO-UX-010`, `ORIGO-UX-014`, `ORIGO-UX-016` |

##### 7.6. `CAP-06` — Inventario y almacenamiento

| ID          | Subcapacidad                                   | Propietaria candidata | Implementación actual localizada                                                          | Evidencia          | Estado de vinculación                    | Destino exacto                                                                                             |
| ----------- | ---------------------------------------------- | --------------------- | ----------------------------------------------------------------------------------------- | ------------------ | ---------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| `CAP-06.01` | Definir lugares de almacenamiento              | NEXO                  | NEXO: ubicaciones, existencias, movimientos, conteos y ajustes con datos y contratos.     | `EVC-08`           | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`       | `CODE-AUD-020`, `CAP-SCOPE-006`, `NEXO-UX-009`, `NEXO-UX-010`, `NEXO-UX-011`, `NEXO-UX-012`, `NEXO-UX-013` |
| `CAP-06.02` | Identificar productos, lotes y recipientes     | NEXO                  | NEXO: productos, lotes/LPN y recipientes; ciclo LPN todavía incompleto.                   | `EVC-08`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-006`, `NEXO-UX-009`, `NEXO-UX-010`, `NEXO-UX-011`, `NEXO-UX-012`, `NEXO-UX-013` |
| `CAP-06.03` | Registrar entradas                             | NEXO                  | NEXO: ubicaciones, existencias, movimientos, conteos y ajustes con datos y contratos.     | `EVC-08`           | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`       | `CODE-AUD-020`, `CAP-SCOPE-006`, `NEXO-UX-009`, `NEXO-UX-010`, `NEXO-UX-011`, `NEXO-UX-012`, `NEXO-UX-013` |
| `CAP-06.04` | Ubicar y reubicar existencias                  | NEXO                  | NEXO: ubicaciones, existencias, movimientos, conteos y ajustes con datos y contratos.     | `EVC-08`           | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`       | `CODE-AUD-020`, `CAP-SCOPE-006`, `NEXO-UX-009`, `NEXO-UX-010`, `NEXO-UX-011`, `NEXO-UX-012`, `NEXO-UX-013` |
| `CAP-06.05` | Consultar disponibilidad                       | NEXO                  | NEXO: ubicaciones, existencias, movimientos, conteos y ajustes con datos y contratos.     | `EVC-08`           | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`       | `CODE-AUD-020`, `CAP-SCOPE-006`, `NEXO-UX-009`, `NEXO-UX-010`, `NEXO-UX-011`, `NEXO-UX-012`, `NEXO-UX-013` |
| `CAP-06.06` | Reservar o separar existencias                 | NEXO                  | NEXO: ubicaciones, existencias, movimientos, conteos y ajustes con datos y contratos.     | `EVC-08`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-006`, `NEXO-UX-009`, `NEXO-UX-010`, `NEXO-UX-011`, `NEXO-UX-012`, `NEXO-UX-013` |
| `CAP-06.07` | Registrar consumo y salida                     | NEXO                  | NEXO: ubicaciones, existencias, movimientos, conteos y ajustes con datos y contratos.     | `EVC-08`           | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`       | `CODE-AUD-020`, `CAP-SCOPE-006`, `NEXO-UX-009`, `NEXO-UX-010`, `NEXO-UX-011`, `NEXO-UX-012`, `NEXO-UX-013` |
| `CAP-06.08` | Trasladar entre lugares                        | NEXO                  | NEXO: ubicaciones, existencias, movimientos, conteos y ajustes con datos y contratos.     | `EVC-08`           | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`       | `CODE-AUD-020`, `CAP-SCOPE-006`, `NEXO-UX-009`, `NEXO-UX-010`, `NEXO-UX-011`, `NEXO-UX-012`, `NEXO-UX-013` |
| `CAP-06.09` | Solicitar y gestionar remisiones               | NEXO                  | NEXO: remisiones y estados con uso piloto/parcial; efectos de inventario por reconciliar. | `EVC-08`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-006`, `NEXO-UX-009`, `NEXO-UX-010`, `NEXO-UX-011`, `NEXO-UX-012`, `NEXO-UX-013` |
| `CAP-06.10` | Preparar y despachar remisiones                | NEXO                  | NEXO: remisiones y estados con uso piloto/parcial; efectos de inventario por reconciliar. | `EVC-08`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-006`, `NEXO-UX-009`, `NEXO-UX-010`, `NEXO-UX-011`, `NEXO-UX-012`, `NEXO-UX-013` |
| `CAP-06.11` | Recibir y confirmar remisiones                 | NEXO                  | NEXO: remisiones y estados con uso piloto/parcial; efectos de inventario por reconciliar. | `EVC-08`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-006`, `NEXO-UX-009`, `NEXO-UX-010`, `NEXO-UX-011`, `NEXO-UX-012`, `NEXO-UX-013` |
| `CAP-06.12` | Contar inventario                              | NEXO                  | NEXO: ubicaciones, existencias, movimientos, conteos y ajustes con datos y contratos.     | `EVC-08`           | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`       | `CODE-AUD-020`, `CAP-SCOPE-006`, `NEXO-UX-009`, `NEXO-UX-010`, `NEXO-UX-011`, `NEXO-UX-012`, `NEXO-UX-013` |
| `CAP-06.13` | Investigar y ajustar diferencias               | NEXO                  | NEXO: ubicaciones, existencias, movimientos, conteos y ajustes con datos y contratos.     | `EVC-08`           | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`       | `CODE-AUD-020`, `CAP-SCOPE-006`, `NEXO-UX-009`, `NEXO-UX-010`, `NEXO-UX-011`, `NEXO-UX-012`, `NEXO-UX-013` |
| `CAP-06.14` | Controlar vencimiento, daño y pérdida          | NEXO                  | NEXO: ubicaciones, existencias, movimientos, conteos y ajustes con datos y contratos.     | `EVC-08`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-006`, `NEXO-UX-009`, `NEXO-UX-010`, `NEXO-UX-011`, `NEXO-UX-012`, `NEXO-UX-013` |
| `CAP-06.15` | Controlar frío y condiciones de almacenamiento | NEXO                  | Condiciones de frío se controlan operativamente; no hay integración técnica completa.     | `EVC-08`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-006`, `NEXO-UX-009`, `NEXO-UX-010`, `NEXO-UX-011`, `NEXO-UX-012`, `NEXO-UX-013` |

##### 7.7. `CAP-07` — Activos y reutilizables

| ID          | Subcapacidad                                        | Propietaria candidata | Implementación actual localizada                                                              | Evidencia          | Estado de vinculación                      | Destino exacto                  |
| ----------- | --------------------------------------------------- | --------------------- | --------------------------------------------------------------------------------------------- | ------------------ | ------------------------------------------ | ------------------------------- |
| `CAP-07.01` | Identificar y clasificar activos                    | NEXO                  | NEXO: activos, ubicación, custodia y movimientos con cobertura parcial.                       | `EVC-09`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-007` |
| `CAP-07.02` | Registrar ubicación y custodia                      | NEXO                  | NEXO: activos, ubicación, custodia y movimientos con cobertura parcial.                       | `EVC-09`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-007` |
| `CAP-07.03` | Entregar, prestar y devolver                        | NEXO                  | NEXO: activos, ubicación, custodia y movimientos con cobertura parcial.                       | `EVC-09`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-007` |
| `CAP-07.04` | Transferir custodia                                 | NEXO                  | NEXO: activos, ubicación, custodia y movimientos con cobertura parcial.                       | `EVC-09`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-007` |
| `CAP-07.05` | Contar activos y reutilizables                      | NEXO                  | NEXO: sesiones y líneas de conteo patrimonial sin uso comprobado.                             | `EVC-09`           | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-007` |
| `CAP-07.06` | Registrar condición, daño, pérdida y faltante       | NEXO                  | NEXO: activos, ubicación, custodia y movimientos con cobertura parcial.                       | `EVC-09`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-007` |
| `CAP-07.07` | Planear y ejecutar mantenimiento                    | NEXO                  | NEXO: estructura de mantenimiento/garantías/baja; adopción no comprobada o ejecución externa. | `EVC-09`           | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-007` |
| `CAP-07.08` | Gestionar reparación y repuestos                    | NEXO                  | NEXO: estructura de mantenimiento/garantías/baja; adopción no comprobada o ejecución externa. | `EVC-09`           | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-007` |
| `CAP-07.09` | Controlar garantías y seguros                       | NEXO                  | NEXO: estructura de mantenimiento/garantías/baja; adopción no comprobada o ejecución externa. | `EVC-09`           | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-007` |
| `CAP-07.10` | Gestionar baja, venta, descarte o reemplazo         | NEXO                  | NEXO: estructura de mantenimiento/garantías/baja; adopción no comprobada o ejecución externa. | `EVC-09`           | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-007` |
| `CAP-07.11` | Gestionar kits y conjuntos                          | NEXO                  | NEXO: activos, ubicación, custodia y movimientos con cobertura parcial.                       | `EVC-09`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-007` |
| `CAP-07.12` | Gestionar vehículos y equipos de transporte         | NEXO                  | NEXO: activos, ubicación, custodia y movimientos con cobertura parcial.                       | `EVC-09`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-007` |
| `CAP-07.13` | Controlar combustible, kilometraje y disponibilidad | NEXO                  | Combustible, kilometraje y disponibilidad se controlan fuera del ciclo canónico.              | `EVC-09`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-007` |

##### 7.8. `CAP-08` — Producción

| ID          | Subcapacidad                                   | Propietaria candidata | Implementación actual localizada                                                                                    | Evidencia                    | Estado de vinculación                      | Destino exacto                                                                                                                           |
| ----------- | ---------------------------------------------- | --------------------- | ------------------------------------------------------------------------------------------------------------------- | ---------------------------- | ------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `CAP-08.01` | Recopilar necesidades de producción            | FOGO                  | FOGO/NEXO: solicitudes, lotes, consumos, salidas y paquetes implementados como estructura sin operación comprobada. | `EVC-10`, `EVC-08`, `EVC-06` | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-008`, `FOGO-UX-005`, `FOGO-UX-006`, `FOGO-UX-007`, `FOGO-UX-010`, `FOGO-UX-011`, `FOGO-UX-012`, `FOGO-UX-013` |
| `CAP-08.02` | Planear cantidades y fechas                    | FOGO                  | FOGO/NEXO: solicitudes, lotes, consumos, salidas y paquetes implementados como estructura sin operación comprobada. | `EVC-10`, `EVC-08`, `EVC-06` | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-008`, `FOGO-UX-005`, `FOGO-UX-006`, `FOGO-UX-007`, `FOGO-UX-010`, `FOGO-UX-011`, `FOGO-UX-012`, `FOGO-UX-013` |
| `CAP-08.03` | Revisar capacidad, personal, equipos e insumos | FOGO                  | FOGO/NEXO: solicitudes, lotes, consumos, salidas y paquetes implementados como estructura sin operación comprobada. | `EVC-10`, `EVC-08`, `EVC-06` | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-008`, `FOGO-UX-005`, `FOGO-UX-006`, `FOGO-UX-007`, `FOGO-UX-010`, `FOGO-UX-011`, `FOGO-UX-012`, `FOGO-UX-013` |
| `CAP-08.04` | Priorizar trabajo productivo                   | FOGO                  | FOGO/NEXO: solicitudes, lotes, consumos, salidas y paquetes implementados como estructura sin operación comprobada. | `EVC-10`, `EVC-08`, `EVC-06` | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-008`, `FOGO-UX-005`, `FOGO-UX-006`, `FOGO-UX-007`, `FOGO-UX-010`, `FOGO-UX-011`, `FOGO-UX-012`, `FOGO-UX-013` |
| `CAP-08.05` | Programar producción                           | FOGO                  | FOGO/NEXO: solicitudes, lotes, consumos, salidas y paquetes implementados como estructura sin operación comprobada. | `EVC-10`, `EVC-08`, `EVC-06` | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-008`, `FOGO-UX-005`, `FOGO-UX-006`, `FOGO-UX-007`, `FOGO-UX-010`, `FOGO-UX-011`, `FOGO-UX-012`, `FOGO-UX-013` |
| `CAP-08.06` | Preparar ingredientes y materiales             | FOGO                  | FOGO/NEXO: solicitudes, lotes, consumos, salidas y paquetes implementados como estructura sin operación comprobada. | `EVC-10`, `EVC-08`, `EVC-06` | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-008`, `FOGO-UX-005`, `FOGO-UX-006`, `FOGO-UX-007`, `FOGO-UX-010`, `FOGO-UX-011`, `FOGO-UX-012`, `FOGO-UX-013` |
| `CAP-08.07` | Ejecutar lotes o preparaciones                 | FOGO                  | FOGO/NEXO: solicitudes, lotes, consumos, salidas y paquetes implementados como estructura sin operación comprobada. | `EVC-10`, `EVC-08`, `EVC-06` | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-008`, `FOGO-UX-005`, `FOGO-UX-006`, `FOGO-UX-007`, `FOGO-UX-010`, `FOGO-UX-011`, `FOGO-UX-012`, `FOGO-UX-013` |
| `CAP-08.08` | Registrar cantidades producidas                | FOGO                  | FOGO/NEXO: solicitudes, lotes, consumos, salidas y paquetes implementados como estructura sin operación comprobada. | `EVC-10`, `EVC-08`, `EVC-06` | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-008`, `FOGO-UX-005`, `FOGO-UX-006`, `FOGO-UX-007`, `FOGO-UX-010`, `FOGO-UX-011`, `FOGO-UX-012`, `FOGO-UX-013` |
| `CAP-08.09` | Registrar consumo, rendimiento y merma         | FOGO                  | FOGO/NEXO: solicitudes, lotes, consumos, salidas y paquetes implementados como estructura sin operación comprobada. | `EVC-10`, `EVC-08`, `EVC-06` | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-008`, `FOGO-UX-005`, `FOGO-UX-006`, `FOGO-UX-007`, `FOGO-UX-010`, `FOGO-UX-011`, `FOGO-UX-012`, `FOGO-UX-013` |
| `CAP-08.10` | Controlar calidad durante producción           | FOGO                  | FOGO/NEXO: solicitudes, lotes, consumos, salidas y paquetes implementados como estructura sin operación comprobada. | `EVC-10`, `EVC-08`, `EVC-06` | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-008`, `FOGO-UX-005`, `FOGO-UX-006`, `FOGO-UX-007`, `FOGO-UX-010`, `FOGO-UX-011`, `FOGO-UX-012`, `FOGO-UX-013` |
| `CAP-08.11` | Empacar y etiquetar                            | FOGO                  | FOGO/NEXO: solicitudes, lotes, consumos, salidas y paquetes implementados como estructura sin operación comprobada. | `EVC-10`, `EVC-08`, `EVC-06` | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-008`, `FOGO-UX-005`, `FOGO-UX-006`, `FOGO-UX-007`, `FOGO-UX-010`, `FOGO-UX-011`, `FOGO-UX-012`, `FOGO-UX-013` |
| `CAP-08.12` | Liberar, retener o rechazar producto           | FOGO                  | FOGO/NEXO: solicitudes, lotes, consumos, salidas y paquetes implementados como estructura sin operación comprobada. | `EVC-10`, `EVC-08`, `EVC-06` | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-008`, `FOGO-UX-005`, `FOGO-UX-006`, `FOGO-UX-007`, `FOGO-UX-010`, `FOGO-UX-011`, `FOGO-UX-012`, `FOGO-UX-013` |
| `CAP-08.13` | Gestionar reproceso y aprovechamiento          | FOGO                  | FOGO/NEXO: solicitudes, lotes, consumos, salidas y paquetes implementados como estructura sin operación comprobada. | `EVC-10`, `EVC-08`, `EVC-06` | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-008`, `FOGO-UX-005`, `FOGO-UX-006`, `FOGO-UX-007`, `FOGO-UX-010`, `FOGO-UX-011`, `FOGO-UX-012`, `FOGO-UX-013` |
| `CAP-08.14` | Cerrar y conciliar producción                  | FOGO                  | FOGO/NEXO: solicitudes, lotes, consumos, salidas y paquetes implementados como estructura sin operación comprobada. | `EVC-10`, `EVC-08`, `EVC-06` | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-008`, `FOGO-UX-005`, `FOGO-UX-006`, `FOGO-UX-007`, `FOGO-UX-010`, `FOGO-UX-011`, `FOGO-UX-012`, `FOGO-UX-013` |

##### 7.9. `CAP-09` — Venta, cobro y pedidos

| ID          | Subcapacidad                                               | Propietaria candidata | Implementación actual localizada                                                               | Evidencia                    | Estado de vinculación                      | Destino exacto                                                                |
| ----------- | ---------------------------------------------------------- | --------------------- | ---------------------------------------------------------------------------------------------- | ---------------------------- | ------------------------------------------ | ----------------------------------------------------------------------------- |
| `CAP-09.01` | Definir oferta y precios de venta                          | PULSO                 | VISO/NEXO/PULSO: oferta y precios disponibles por catálogo y menú.                             | `EVC-05`, `EVC-11`           | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`         | `CODE-AUD-020`, `CAP-SCOPE-009`, `PULSO-UX-001`, `INT-POS-001`, `INT-POS-019` |
| `CAP-09.02` | Recibir solicitudes y pedidos                              | PULSO                 | PASS/PULSO y sistemas externos registran pedidos digitales con uso limitado.                   | `EVC-11`, `EVC-12`           | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`         | `CODE-AUD-020`, `CAP-SCOPE-009`, `PULSO-UX-001`, `INT-POS-001`, `INT-POS-019` |
| `CAP-09.03` | Confirmar disponibilidad y condiciones                     | PULSO                 | PULSO/PASS: estados y acciones de pedido parciales.                                            | `EVC-11`, `EVC-12`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-009`, `PULSO-UX-001`, `INT-POS-001`, `INT-POS-019` |
| `CAP-09.04` | Registrar pedidos                                          | PULSO                 | PASS/PULSO y sistemas externos registran pedidos digitales con uso limitado.                   | `EVC-11`, `EVC-12`           | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`         | `CODE-AUD-020`, `CAP-SCOPE-009`, `PULSO-UX-001`, `INT-POS-001`, `INT-POS-019` |
| `CAP-09.05` | Modificar, sustituir o cancelar pedidos                    | PULSO                 | PULSO/PASS: estados y acciones de pedido parciales.                                            | `EVC-11`, `EVC-12`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-009`, `PULSO-UX-001`, `INT-POS-001`, `INT-POS-019` |
| `CAP-09.06` | Enviar pedidos a preparación                               | PULSO                 | PULSO/PASS: estados y acciones de pedido parciales.                                            | `EVC-11`, `EVC-12`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-009`, `PULSO-UX-001`, `INT-POS-001`, `INT-POS-019` |
| `CAP-09.07` | Coordinar preparación y entrega                            | PULSO                 | PULSO/PASS: estados y acciones de pedido parciales.                                            | `EVC-11`, `EVC-12`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-009`, `PULSO-UX-001`, `INT-POS-001`, `INT-POS-019` |
| `CAP-09.08` | Registrar ventas                                           | PULSO                 | Pedidos/pagos digitales parciales; POS, caja, corrección y facturación integral no operativos. | `EVC-11`, `EVC-12`, `EVC-14` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-009`, `PULSO-UX-001`, `INT-POS-001`, `INT-POS-019` |
| `CAP-09.09` | Cobrar y confirmar pagos                                   | PULSO                 | Pedidos/pagos digitales parciales; POS, caja, corrección y facturación integral no operativos. | `EVC-11`, `EVC-12`, `EVC-14` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-009`, `PULSO-UX-001`, `INT-POS-001`, `INT-POS-019` |
| `CAP-09.10` | Emitir factura o soporte                                   | PULSO                 | Pedidos/pagos digitales parciales; POS, caja, corrección y facturación integral no operativos. | `EVC-11`, `EVC-12`, `EVC-14` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-009`, `PULSO-UX-001`, `INT-POS-001`, `INT-POS-019` |
| `CAP-09.11` | Gestionar mesas y servicio presencial                      | PULSO                 | PULSO: sesiones de salón y llamados de mesa con comportamiento real localizado.                | `EVC-11`, `EVC-12`           | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`         | `CODE-AUD-020`, `CAP-SCOPE-009`, `PULSO-UX-001`, `INT-POS-001`, `INT-POS-019` |
| `CAP-09.12` | Gestionar pedidos para llevar                              | PULSO                 | PULSO/PASS: estados y acciones de pedido parciales.                                            | `EVC-11`, `EVC-12`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-009`, `PULSO-UX-001`, `INT-POS-001`, `INT-POS-019` |
| `CAP-09.13` | Gestionar pedidos recibidos por aplicaciones o mensajes    | PULSO                 | Makos/Rappi/ManyChat/WhatsApp y coordinación humana; integración canónica pendiente.           | `EVC-11`, `EVC-21`           | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-009`, `PULSO-UX-001`, `INT-POS-001`, `INT-POS-019` |
| `CAP-09.14` | Gestionar pedidos especiales, catering y ventas a empresas | PULSO                 | Makos/Rappi/ManyChat/WhatsApp y coordinación humana; integración canónica pendiente.           | `EVC-11`, `EVC-21`           | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-009`, `PULSO-UX-001`, `INT-POS-001`, `INT-POS-019` |
| `CAP-09.15` | Cerrar y revisar la jornada de venta                       | PULSO                 | Tablas de sesión y cierre POS existen sin jornada propia comprobada.                           | `EVC-11`, `EVC-12`, `EVC-14` | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-009`, `PULSO-UX-001`, `INT-POS-001`, `INT-POS-019` |

##### 7.10. `CAP-10` — Clientes y relaciones

| ID          | Subcapacidad                             | Propietaria candidata | Implementación actual localizada                                               | Evidencia                    | Estado de vinculación                      | Destino exacto                                 |
| ----------- | ---------------------------------------- | --------------------- | ------------------------------------------------------------------------------ | ---------------------------- | ------------------------------------------ | ---------------------------------------------- |
| `CAP-10.01` | Identificar y conocer clientes           | PASS / PULSO          | PASS/public.users: identidad de cliente y perfil con datos.                    | `EVC-12`, `EVC-11`           | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`         | `CODE-AUD-020`, `CAP-SCOPE-010`, `PASS-UX-001` |
| `CAP-10.02` | Registrar preferencias y autorizaciones  | PASS / PULSO          | PASS/PULSO: perfil, chat, mensajes, preferencias y comunicación parcial.       | `EVC-12`, `EVC-11`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-010`, `PASS-UX-001` |
| `CAP-10.03` | Atender preguntas y solicitudes          | PULSO                 | PASS/PULSO: perfil, chat, mensajes, preferencias y comunicación parcial.       | `EVC-12`, `EVC-11`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-010`, `PASS-UX-001` |
| `CAP-10.04` | Recibir y resolver reclamos              | PULSO                 | Atención manual o por chat; no existe ciclo canónico completo.                 | `EVC-12`, `EVC-11`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-010`, `PASS-UX-001` |
| `CAP-10.05` | Gestionar devoluciones y compensaciones  | PULSO                 | Atención manual o por chat; no existe ciclo canónico completo.                 | `EVC-12`, `EVC-11`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-010`, `PASS-UX-001` |
| `CAP-10.06` | Medir satisfacción                       | PULSO                 | Tabla de feedback y superficies relacionadas sin uso comprobado.               | `EVC-12`, `EVC-11`           | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-010`, `PASS-UX-001` |
| `CAP-10.07` | Gestionar fidelización y beneficios      | PASS / PULSO          | PASS: membresía, wallet y redención; ledger y atomicidad requieren corrección. | `EVC-12`, `EVC-11`           | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-010`, `PASS-UX-001` |
| `CAP-10.08` | Gestionar reservas y eventos             | PULSO                 | Atención manual o por chat; no existe ciclo canónico completo.                 | `EVC-12`, `EVC-11`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-010`, `PASS-UX-001` |
| `CAP-10.09` | Comunicar cambios que afecten al cliente | PULSO                 | PASS/PULSO: perfil, chat, mensajes, preferencias y comunicación parcial.       | `EVC-12`, `EVC-11`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-010`, `PASS-UX-001` |
| `CAP-10.10` | Proteger información del cliente         | PULSO                 | PASS/PULSO: perfil, chat, mensajes, preferencias y comunicación parcial.       | `EVC-12`, `EVC-11`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-010`, `PASS-UX-001` |

##### 7.11. `CAP-11` — Transporte, despacho y entrega

| ID          | Subcapacidad                              | Propietaria candidata | Implementación actual localizada                                                  | Evidencia                                        | Estado de vinculación                      | Destino exacto                                                 |
| ----------- | ----------------------------------------- | --------------------- | --------------------------------------------------------------------------------- | ------------------------------------------------ | ------------------------------------------ | -------------------------------------------------------------- |
| `CAP-11.01` | Planear necesidades de transporte         | NEXO                  | NEXO: remisiones, traslados, carga y custodia parcial; planeación todavía manual. | `EVC-13`, `EVC-08`, `EVC-11`, `EVC-12`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-011`, `NEXO-UX-009`, `PULSO-UX-001` |
| `CAP-11.02` | Definir recorridos y prioridades          | NEXO                  | NEXO: remisiones, traslados, carga y custodia parcial; planeación todavía manual. | `EVC-13`, `EVC-08`, `EVC-11`, `EVC-12`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-011`, `NEXO-UX-009`, `PULSO-UX-001` |
| `CAP-11.03` | Asignar vehículo y responsable            | NEXO                  | NEXO: remisiones, traslados, carga y custodia parcial; planeación todavía manual. | `EVC-13`, `EVC-08`, `EVC-11`, `EVC-12`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-011`, `NEXO-UX-009`, `PULSO-UX-001` |
| `CAP-11.04` | Preparar carga                            | NEXO                  | NEXO: remisiones, traslados, carga y custodia parcial; planeación todavía manual. | `EVC-13`, `EVC-08`, `EVC-11`, `EVC-12`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-011`, `NEXO-UX-009`, `PULSO-UX-001` |
| `CAP-11.05` | Confirmar cantidades y condición al salir | NEXO                  | NEXO: remisiones, traslados, carga y custodia parcial; planeación todavía manual. | `EVC-13`, `EVC-08`, `EVC-11`, `EVC-12`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-011`, `NEXO-UX-009`, `PULSO-UX-001` |
| `CAP-11.06` | Transferir custodia para transporte       | NEXO                  | NEXO: remisiones, traslados, carga y custodia parcial; planeación todavía manual. | `EVC-13`, `EVC-08`, `EVC-11`, `EVC-12`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-011`, `NEXO-UX-009`, `PULSO-UX-001` |
| `CAP-11.07` | Ejecutar recorrido                        | NEXO / PULSO          | NEXO/PULSO/PASS y terceros: entrega y novedades con cobertura parcial o manual.   | `EVC-13`, `EVC-08`, `EVC-11`, `EVC-12`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-011`, `NEXO-UX-009`, `PULSO-UX-001` |
| `CAP-11.08` | Registrar novedades durante transporte    | NEXO / PULSO          | NEXO/PULSO/PASS y terceros: entrega y novedades con cobertura parcial o manual.   | `EVC-13`, `EVC-08`, `EVC-11`, `EVC-12`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-011`, `NEXO-UX-009`, `PULSO-UX-001` |
| `CAP-11.09` | Entregar y confirmar recepción            | NEXO / PULSO          | Sesiones de entrega y portal existen; uso operativo nuevo no comprobado.          | `EVC-13`, `EVC-08`, `EVC-11`, `EVC-12`           | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-011`, `NEXO-UX-009`, `PULSO-UX-001` |
| `CAP-11.10` | Gestionar faltantes, daños y devoluciones | NEXO / PULSO          | NEXO/PULSO/PASS y terceros: entrega y novedades con cobertura parcial o manual.   | `EVC-13`, `EVC-08`, `EVC-11`, `EVC-12`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-011`, `NEXO-UX-009`, `PULSO-UX-001` |
| `CAP-11.11` | Cerrar y revisar el recorrido             | NEXO / PULSO          | NEXO/PULSO/PASS y terceros: entrega y novedades con cobertura parcial o manual.   | `EVC-13`, `EVC-08`, `EVC-11`, `EVC-12`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-011`, `NEXO-UX-009`, `PULSO-UX-001` |
| `CAP-11.12` | Gestionar entregas mediante terceros      | NEXO / PULSO          | NEXO/PULSO/PASS y terceros: entrega y novedades con cobertura parcial o manual.   | `EVC-13`, `EVC-08`, `EVC-11`, `EVC-12`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-011`, `NEXO-UX-009`, `PULSO-UX-001` |

##### 7.12. `CAP-12` — Dinero, costos y obligaciones

| ID          | Subcapacidad                       | Propietaria candidata | Implementación actual localizada                                                                     | Evidencia                                        | Estado de vinculación                      | Destino exacto                  |
| ----------- | ---------------------------------- | --------------------- | ---------------------------------------------------------------------------------------------------- | ------------------------------------------------ | ------------------------------------------ | ------------------------------- |
| `CAP-12.01` | Registrar hechos económicos        | NUMERA                | NUMERA/PULSO/ORIGO/NEXO: costos, pagos, documentos y resúmenes parciales.                            | `EVC-14`, `EVC-11`, `EVC-07`, `EVC-08`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-012` |
| `CAP-12.02` | Gestionar caja                     | PULSO                 | PULSO conserva modelo de caja y sesiones sin uso comprobado.                                         | `EVC-14`, `EVC-11`, `EVC-07`, `EVC-08`           | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-012` |
| `CAP-12.03` | Gestionar bancos y pagos           | NUMERA                | Proceso externo/manual; NUMERA no contiene ciclo completo de bancos, cartera, tesorería o impuestos. | `EVC-14`, `EVC-11`, `EVC-07`, `EVC-08`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-012` |
| `CAP-12.04` | Gestionar cuentas por cobrar       | NUMERA                | Proceso externo/manual; NUMERA no contiene ciclo completo de bancos, cartera, tesorería o impuestos. | `EVC-14`, `EVC-11`, `EVC-07`, `EVC-08`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-012` |
| `CAP-12.05` | Gestionar cuentas por pagar        | NUMERA                | Proceso externo/manual; NUMERA no contiene ciclo completo de bancos, cartera, tesorería o impuestos. | `EVC-14`, `EVC-11`, `EVC-07`, `EVC-08`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-012` |
| `CAP-12.06` | Facturar y controlar documentos    | NUMERA                | NUMERA/PULSO/ORIGO/NEXO: costos, pagos, documentos y resúmenes parciales.                            | `EVC-14`, `EVC-11`, `EVC-07`, `EVC-08`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-012` |
| `CAP-12.07` | Conciliar ventas, pagos y entregas | NUMERA                | NUMERA/PULSO/ORIGO/NEXO: costos, pagos, documentos y resúmenes parciales.                            | `EVC-14`, `EVC-11`, `EVC-07`, `EVC-08`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-012` |
| `CAP-12.08` | Conciliar compras y recepciones    | NUMERA                | NUMERA/PULSO/ORIGO/NEXO: costos, pagos, documentos y resúmenes parciales.                            | `EVC-14`, `EVC-11`, `EVC-07`, `EVC-08`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-012` |
| `CAP-12.09` | Calcular costos                    | NUMERA                | NUMERA/PULSO/ORIGO/NEXO: costos, pagos, documentos y resúmenes parciales.                            | `EVC-14`, `EVC-11`, `EVC-07`, `EVC-08`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-012` |
| `CAP-12.10` | Distribuir costos compartidos      | NUMERA                | NUMERA/PULSO/ORIGO/NEXO: costos, pagos, documentos y resúmenes parciales.                            | `EVC-14`, `EVC-11`, `EVC-07`, `EVC-08`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-012` |
| `CAP-12.11` | Gestionar presupuestos             | NUMERA                | NUMERA tiene tablas de presupuesto sin registros operativos comprobados.                             | `EVC-14`, `EVC-11`, `EVC-07`, `EVC-08`           | `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` | `CODE-AUD-020`, `CAP-SCOPE-012` |
| `CAP-12.12` | Gestionar tesorería                | NUMERA                | Proceso externo/manual; NUMERA no contiene ciclo completo de bancos, cartera, tesorería o impuestos. | `EVC-14`, `EVC-11`, `EVC-07`, `EVC-08`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-012` |
| `CAP-12.13` | Gestionar impuestos y obligaciones | NUMERA                | Proceso externo/manual; NUMERA no contiene ciclo completo de bancos, cartera, tesorería o impuestos. | `EVC-14`, `EVC-11`, `EVC-07`, `EVC-08`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA`   | `CODE-AUD-020`, `CAP-SCOPE-012` |
| `CAP-12.14` | Cerrar períodos y emitir reportes  | NUMERA                | NUMERA/PULSO/ORIGO/NEXO: costos, pagos, documentos y resúmenes parciales.                            | `EVC-14`, `EVC-11`, `EVC-07`, `EVC-08`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-012` |
| `CAP-12.15` | Analizar rentabilidad              | NUMERA                | NUMERA/PULSO/ORIGO/NEXO: costos, pagos, documentos y resúmenes parciales.                            | `EVC-14`, `EVC-11`, `EVC-07`, `EVC-08`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`        | `CODE-AUD-020`, `CAP-SCOPE-012` |

##### 7.13. `CAP-13` — Instalaciones

| ID          | Subcapacidad                                | Propietaria candidata | Implementación actual localizada                                                   | Evidencia          | Estado de vinculación               | Destino exacto                  |
| ----------- | ------------------------------------------- | --------------------- | ---------------------------------------------------------------------------------- | ------------------ | ----------------------------------- | ------------------------------- |
| `CAP-13.01` | Inventariar espacios e instalaciones        | NEXO                  | VISO/NEXO identifican sedes, áreas, ubicaciones y activos.                         | `EVC-15`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-013` |
| `CAP-13.02` | Planear mantenimiento                       | NEXO                  | No existe módulo o ciclo técnico dedicado; evidencia operativa pendiente o manual. | `EVC-15`, `EVC-22` | `SIN_IMPLEMENTACIÓN_VERIFICABLE`    | `CODE-AUD-020`, `CAP-SCOPE-013` |
| `CAP-13.03` | Solicitar y ejecutar reparaciones           | NEXO                  | No existe módulo o ciclo técnico dedicado; evidencia operativa pendiente o manual. | `EVC-15`, `EVC-22` | `SIN_IMPLEMENTACIÓN_VERIFICABLE`    | `CODE-AUD-020`, `CAP-SCOPE-013` |
| `CAP-13.04` | Gestionar limpieza y saneamiento            | NEXO                  | No existe módulo o ciclo técnico dedicado; evidencia operativa pendiente o manual. | `EVC-15`, `EVC-22` | `SIN_IMPLEMENTACIÓN_VERIFICABLE`    | `CODE-AUD-020`, `CAP-SCOPE-013` |
| `CAP-13.05` | Controlar plagas                            | NEXO                  | No existe módulo o ciclo técnico dedicado; evidencia operativa pendiente o manual. | `EVC-15`, `EVC-22` | `SIN_IMPLEMENTACIÓN_VERIFICABLE`    | `CODE-AUD-020`, `CAP-SCOPE-013` |
| `CAP-13.06` | Controlar agua, energía, gas y servicios    | NEXO                  | No existe módulo o ciclo técnico dedicado; evidencia operativa pendiente o manual. | `EVC-15`, `EVC-22` | `SIN_IMPLEMENTACIÓN_VERIFICABLE`    | `CODE-AUD-020`, `CAP-SCOPE-013` |
| `CAP-13.07` | Inspeccionar condiciones                    | NEXO                  | No existe módulo o ciclo técnico dedicado; evidencia operativa pendiente o manual. | `EVC-15`, `EVC-22` | `SIN_IMPLEMENTACIÓN_VERIFICABLE`    | `CODE-AUD-020`, `CAP-SCOPE-013` |
| `CAP-13.08` | Calibrar equipos                            | NEXO                  | No existe módulo o ciclo técnico dedicado; evidencia operativa pendiente o manual. | `EVC-15`, `EVC-22` | `SIN_IMPLEMENTACIÓN_VERIFICABLE`    | `CODE-AUD-020`, `CAP-SCOPE-013` |
| `CAP-13.09` | Gestionar llaves, acceso físico y seguridad | NEXO                  | No existe módulo o ciclo técnico dedicado; evidencia operativa pendiente o manual. | `EVC-15`, `EVC-22` | `SIN_IMPLEMENTACIÓN_VERIFICABLE`    | `CODE-AUD-020`, `CAP-SCOPE-013` |
| `CAP-13.10` | Gestionar obras y adecuaciones              | NEXO                  | No existe módulo o ciclo técnico dedicado; evidencia operativa pendiente o manual. | `EVC-15`, `EVC-22` | `SIN_IMPLEMENTACIÓN_VERIFICABLE`    | `CODE-AUD-020`, `CAP-SCOPE-013` |
| `CAP-13.11` | Registrar y cerrar novedades                | NEXO                  | No existe módulo o ciclo técnico dedicado; evidencia operativa pendiente o manual. | `EVC-15`, `EVC-22` | `SIN_IMPLEMENTACIÓN_VERIFICABLE`    | `CODE-AUD-020`, `CAP-SCOPE-013` |

##### 7.14. `CAP-14` — Comunicación y promoción

| ID          | Subcapacidad                                 | Propietaria candidata                 | Implementación actual localizada                                                                | Evidencia                    | Estado de vinculación                    | Destino exacto                                                 |
| ----------- | -------------------------------------------- | ------------------------------------- | ----------------------------------------------------------------------------------------------- | ---------------------------- | ---------------------------------------- | -------------------------------------------------------------- |
| `CAP-14.01` | Definir identidad y mensajes                 | VISO CMS / AURA futura                | Identidad y mensajes existen en configuración, CMS y aplicaciones, sin gobierno único completo. | `EVC-16`                     | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-014`, `AURA-AUD-010`, `INT-MKT-001` |
| `CAP-14.02` | Planear comunicación y promociones           | VISO CMS / AURA futura                | CMS y operación manual cubren una parte; AURA no existe como aplicación.                        | `EVC-16`, `EVC-21`           | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-014`, `AURA-AUD-010`, `INT-MKT-001` |
| `CAP-14.03` | Crear y aprobar contenido                    | VISO CMS / AURA futura                | VISO CMS y web pública crean, publican y presentan contenido con datos.                         | `EVC-16`                     | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`       | `CODE-AUD-020`, `CAP-SCOPE-014`, `AURA-AUD-010`, `INT-MKT-001` |
| `CAP-14.04` | Publicar y administrar medios                | VISO CMS / AURA futura                | VISO CMS y web pública crean, publican y presentan contenido con datos.                         | `EVC-16`                     | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`       | `CODE-AUD-020`, `CAP-SCOPE-014`, `AURA-AUD-010`, `INT-MKT-001` |
| `CAP-14.05` | Gestionar campañas                           | AURA futura / operación actual manual | No se localizó implementación canónica suficiente; AURA continúa diferida.                      | `EVC-16`, `EVC-21`, `EVC-22` | `SIN_IMPLEMENTACIÓN_VERIFICABLE`         | `CODE-AUD-020`, `CAP-SCOPE-014`, `AURA-AUD-010`, `INT-MKT-001` |
| `CAP-14.06` | Gestionar promociones y cupones              | PULSO / PASS / AURA futura            | PASS/PULSO/VISO contienen beneficios, disponibilidad y reglas promocionales parciales.          | `EVC-12`, `EVC-11`, `EVC-16` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-014`, `AURA-AUD-010`, `INT-MKT-001` |
| `CAP-14.07` | Captar oportunidades de venta                | AURA futura / operación actual manual | No se localizó implementación canónica suficiente; AURA continúa diferida.                      | `EVC-16`, `EVC-21`, `EVC-22` | `SIN_IMPLEMENTACIÓN_VERIFICABLE`         | `CODE-AUD-020`, `CAP-SCOPE-014`, `AURA-AUD-010`, `INT-MKT-001` |
| `CAP-14.08` | Gestionar ventas a empresas                  | AURA futura / operación actual manual | Ventas empresariales, catering y eventos se coordinan manualmente.                              | `EVC-16`, `EVC-21`           | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-014`, `AURA-AUD-010`, `INT-MKT-001` |
| `CAP-14.09` | Gestionar catering y eventos comerciales     | AURA futura / operación actual manual | Ventas empresariales, catering y eventos se coordinan manualmente.                              | `EVC-16`, `EVC-21`           | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-014`, `AURA-AUD-010`, `INT-MKT-001` |
| `CAP-14.10` | Medir resultados de comunicación y promoción | AURA futura / operación actual manual | No se localizó implementación canónica suficiente; AURA continúa diferida.                      | `EVC-16`, `EVC-21`, `EVC-22` | `SIN_IMPLEMENTACIÓN_VERIFICABLE`         | `CODE-AUD-020`, `CAP-SCOPE-014`, `AURA-AUD-010`, `INT-MKT-001` |
| `CAP-14.11` | Gestionar reputación y comentarios públicos  | AURA futura / operación actual manual | CMS y operación manual cubren una parte; AURA no existe como aplicación.                        | `EVC-16`, `EVC-21`           | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-014`, `AURA-AUD-010`, `INT-MKT-001` |

##### 7.15. `CAP-15` — Tecnología y soporte

| ID          | Subcapacidad                                         | Propietaria candidata                     | Implementación actual localizada                                                                     | Evidencia                    | Estado de vinculación                    | Destino exacto                                                  |
| ----------- | ---------------------------------------------------- | ----------------------------------------- | ---------------------------------------------------------------------------------------------------- | ---------------------------- | ---------------------------------------- | --------------------------------------------------------------- |
| `CAP-15.01` | Gestionar cuentas y accesos                          | VISO / SHELL / aplicación afectada        | SHELL/VISO/aplicaciones: Auth, permisos, contexto y dispositivos; controles de servidor desiguales.  | `EVC-17`, `EVC-23`           | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`       | `CODE-AUD-020`, `CAP-SCOPE-015`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-15.02` | Gestionar computadores, celulares y tabletas         | NEXO / aplicación afectada                | NEXO y dispositivos compartidos representan equipos parcialmente.                                    | `EVC-17`, `EVC-23`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-015`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-15.03` | Gestionar redes y conectividad                       | NEXO / aplicación afectada                | Redes y conectividad se administran fuera de una aplicación canónica.                                | `EVC-17`, `EVC-23`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-015`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-15.04` | Gestionar impresoras y periféricos                   | NEXO / aplicación afectada                | NEXO: impresión BrowserPrint/ZPL y colas locales; periféricos sin gobierno integral.                 | `EVC-17`, `EVC-23`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-015`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-15.05` | Gestionar aplicaciones y proveedores tecnológicos    | SHELL / VENTO-SHELL                       | SHELL/vento-shell: catálogo, navegación, repositorios, despliegues y proveedores técnicos parciales. | `EVC-17`, `EVC-23`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-015`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-15.06` | Atender solicitudes de soporte                       | Aplicación afectada + soporte transversal | ANIMA: tickets y mensajes de soporte; no es mesa de servicio transversal completa.                   | `EVC-17`, `EVC-23`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-015`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-15.07` | Gestionar fallas e incidentes tecnológicos           | Aplicación afectada + soporte transversal | Tickets, logs y operación humana; clasificación y cierre de incidentes incompletos.                  | `EVC-17`, `EVC-23`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-015`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-15.08` | Gestionar cambios y versiones                        | Aplicación afectada + soporte transversal | GitHub, Vercel, EAS y actualizaciones por aplicación; gobierno de cambio fragmentado.                | `EVC-17`, `EVC-23`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-015`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-15.09` | Probar soluciones antes de usarlas                   | Aplicación afectada + soporte transversal | APP-REVIEW, builds y validaciones puntuales; suite transversal insuficiente.                         | `EVC-17`, `EVC-23`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-015`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-15.10` | Gestionar licencias, contratos y costos tecnológicos | Aplicación afectada + soporte transversal | Gestión manual sin registro canónico completo.                                                       | `EVC-17`, `EVC-23`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-015`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-15.11` | Capacitar en el uso de herramientas                  | Aplicación afectada + soporte transversal | Gestión manual sin registro canónico completo.                                                       | `EVC-17`, `EVC-23`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-015`, `GAP-CTRL-001`, `GAP-CTRL-006` |

##### 7.16. `CAP-16` — Información, documentos y evidencia

| ID          | Subcapacidad                              | Propietaria candidata                                   | Implementación actual localizada                                                               | Evidencia                    | Estado de vinculación               | Destino exacto                                                  |
| ----------- | ----------------------------------------- | ------------------------------------------------------- | ---------------------------------------------------------------------------------------------- | ---------------------------- | ----------------------------------- | --------------------------------------------------------------- |
| `CAP-16.01` | Clasificar información y documentos       | Aplicación propietaria del hecho + gobierno transversal | Storage y tablas distribuidas; clasificación, versión, retención, firma y auditoría parciales. | `EVC-18`, `EVC-17`, `EVC-23` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-016`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-16.02` | Crear y aprobar documentos                | Aplicación propietaria del hecho + gobierno transversal | Storage y tablas distribuidas; clasificación, versión, retención, firma y auditoría parciales. | `EVC-18`, `EVC-17`, `EVC-23` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-016`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-16.03` | Guardar y localizar documentos            | Aplicación propietaria del hecho + gobierno transversal | Storage, tablas y búsquedas permiten guardar y localizar documentos en varios dominios.        | `EVC-18`, `EVC-17`, `EVC-23` | `IMPLEMENTACIÓN_VERIFICADA_EN_USO`  | `CODE-AUD-020`, `CAP-SCOPE-016`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-16.04` | Controlar versiones y vigencia            | Aplicación propietaria del hecho + gobierno transversal | Storage y tablas distribuidas; clasificación, versión, retención, firma y auditoría parciales. | `EVC-18`, `EVC-17`, `EVC-23` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-016`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-16.05` | Compartir información de forma autorizada | Aplicación propietaria del hecho + gobierno transversal | Storage y tablas distribuidas; clasificación, versión, retención, firma y auditoría parciales. | `EVC-18`, `EVC-17`, `EVC-23` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-016`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-16.06` | Proteger datos personales y sensibles     | Aplicación propietaria del hecho + gobierno transversal | Storage y tablas distribuidas; clasificación, versión, retención, firma y auditoría parciales. | `EVC-18`, `EVC-17`, `EVC-23` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-016`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-16.07` | Conservar registros y evidencia           | Aplicación propietaria del hecho + gobierno transversal | Storage y tablas distribuidas; clasificación, versión, retención, firma y auditoría parciales. | `EVC-18`, `EVC-17`, `EVC-23` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-016`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-16.08` | Archivar y eliminar de forma controlada   | Aplicación propietaria del hecho + gobierno transversal | Storage y tablas distribuidas; clasificación, versión, retención, firma y auditoría parciales. | `EVC-18`, `EVC-17`, `EVC-23` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-016`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-16.09` | Gestionar firmas y aprobaciones           | Aplicación propietaria del hecho + gobierno transversal | Storage y tablas distribuidas; clasificación, versión, retención, firma y auditoría parciales. | `EVC-18`, `EVC-17`, `EVC-23` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-016`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-16.10` | Atender solicitudes sobre información     | Aplicación propietaria del hecho + gobierno transversal | Storage y tablas distribuidas; clasificación, versión, retención, firma y auditoría parciales. | `EVC-18`, `EVC-17`, `EVC-23` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-016`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-16.11` | Investigar accesos o cambios indebidos    | Aplicación propietaria del hecho + gobierno transversal | Storage y tablas distribuidas; clasificación, versión, retención, firma y auditoría parciales. | `EVC-18`, `EVC-17`, `EVC-23` | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA` | `CODE-AUD-020`, `CAP-SCOPE-016`, `GAP-CTRL-001`, `GAP-CTRL-006` |

##### 7.17. `CAP-17` — Medición, análisis y mejora

| ID          | Subcapacidad                          | Propietaria candidata        | Implementación actual localizada                                                     | Evidencia          | Estado de vinculación                    | Destino exacto                                                  |
| ----------- | ------------------------------------- | ---------------------------- | ------------------------------------------------------------------------------------ | ------------------ | ---------------------------------------- | --------------------------------------------------------------- |
| `CAP-17.01` | Definir medidas e indicadores         | NUMERA + aplicaciones fuente | NUMERA y reportes/exportaciones por dominio; métricas y calidad no están unificadas. | `EVC-19`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-017`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-17.02` | Recopilar información                 | NUMERA + aplicaciones fuente | NUMERA y reportes/exportaciones por dominio; métricas y calidad no están unificadas. | `EVC-19`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-017`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-17.03` | Verificar calidad de información      | NUMERA + aplicaciones fuente | NUMERA y reportes/exportaciones por dominio; métricas y calidad no están unificadas. | `EVC-19`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-017`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-17.04` | Preparar reportes                     | NUMERA + aplicaciones fuente | NUMERA y reportes/exportaciones por dominio; métricas y calidad no están unificadas. | `EVC-19`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-017`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-17.05` | Analizar ventas y demanda             | NUMERA + aplicaciones fuente | NUMERA y reportes/exportaciones por dominio; métricas y calidad no están unificadas. | `EVC-19`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-017`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-17.06` | Analizar inventario y abastecimiento  | NUMERA + aplicaciones fuente | NUMERA y reportes/exportaciones por dominio; métricas y calidad no están unificadas. | `EVC-19`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-017`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-17.07` | Analizar producción y rendimiento     | NUMERA + aplicaciones fuente | NUMERA y reportes/exportaciones por dominio; métricas y calidad no están unificadas. | `EVC-19`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-017`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-17.08` | Analizar servicio y clientes          | NUMERA + aplicaciones fuente | NUMERA y reportes/exportaciones por dominio; métricas y calidad no están unificadas. | `EVC-19`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-017`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-17.09` | Analizar costos y rentabilidad        | NUMERA + aplicaciones fuente | NUMERA y reportes/exportaciones por dominio; métricas y calidad no están unificadas. | `EVC-19`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-017`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-17.10` | Identificar problemas y oportunidades | NUMERA + aplicaciones fuente | Análisis y seguimiento principalmente humanos; no existe ciclo común de mejora.      | `EVC-19`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-017`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-17.11` | Definir y seguir acciones de mejora   | NUMERA + aplicaciones fuente | Análisis y seguimiento principalmente humanos; no existe ciclo común de mejora.      | `EVC-19`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-017`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-17.12` | Comprobar resultados                  | NUMERA + aplicaciones fuente | Análisis y seguimiento principalmente humanos; no existe ciclo común de mejora.      | `EVC-19`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-017`, `GAP-CTRL-001`, `GAP-CTRL-006` |

##### 7.18. `CAP-18` — Continuidad e incidentes

| ID          | Subcapacidad                                  | Propietaria candidata       | Implementación actual localizada                                                            | Evidencia                    | Estado de vinculación                    | Destino exacto                                                  |
| ----------- | --------------------------------------------- | --------------------------- | ------------------------------------------------------------------------------------------- | ---------------------------- | ---------------------------------------- | --------------------------------------------------------------- |
| `CAP-18.01` | Identificar dependencias críticas             | Aplicación afectada + SHELL | No se localizó inventario/priorización empresarial canónica de continuidad.                 | `EVC-20`, `EVC-17`, `EVC-22` | `SIN_IMPLEMENTACIÓN_VERIFICABLE`         | `CODE-AUD-020`, `CAP-SCOPE-018`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-18.02` | Preparar respuestas alternativas              | Aplicación afectada + SHELL | Contingencias y reincorporación se ejecutan manualmente; no existe ciclo integral.          | `EVC-20`, `EVC-17`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-018`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-18.03` | Detectar y reportar incidentes                | Aplicación afectada + SHELL | Tickets y eventos técnicos permiten reportar algunos incidentes.                            | `EVC-20`, `EVC-17`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-018`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-18.04` | Evaluar impacto y prioridad                   | Aplicación afectada + SHELL | No se localizó inventario/priorización empresarial canónica de continuidad.                 | `EVC-20`, `EVC-17`, `EVC-22` | `SIN_IMPLEMENTACIÓN_VERIFICABLE`         | `CODE-AUD-020`, `CAP-SCOPE-018`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-18.05` | Mantener operación mínima                     | Aplicación afectada + SHELL | Contingencias y reincorporación se ejecutan manualmente; no existe ciclo integral.          | `EVC-20`, `EVC-17`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-018`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-18.06` | Recuperar equipos, servicios e información    | Aplicación afectada + SHELL | Infraestructura y cron ofrecen recuperación parcial; no hay prueba empresarial por dominio. | `EVC-20`, `EVC-17`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-018`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-18.07` | Registrar trabajo realizado durante la falla  | Aplicación afectada + SHELL | Contingencias y reincorporación se ejecutan manualmente; no existe ciclo integral.          | `EVC-20`, `EVC-17`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-018`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-18.08` | Incorporar posteriormente lo ocurrido         | Aplicación afectada + SHELL | Contingencias y reincorporación se ejecutan manualmente; no existe ciclo integral.          | `EVC-20`, `EVC-17`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-018`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-18.09` | Confirmar que no quedaron pendientes          | Aplicación afectada + SHELL | Contingencias y reincorporación se ejecutan manualmente; no existe ciclo integral.          | `EVC-20`, `EVC-17`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-018`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-18.10` | Aprender del incidente y mejorar la respuesta | Aplicación afectada + SHELL | Contingencias y reincorporación se ejecutan manualmente; no existe ciclo integral.          | `EVC-20`, `EVC-17`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-018`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-18.11` | Gestionar respaldos y recuperación            | Aplicación afectada + SHELL | Infraestructura y cron ofrecen recuperación parcial; no hay prueba empresarial por dominio. | `EVC-20`, `EVC-17`           | `IMPLEMENTACIÓN_PARCIAL_VERIFICADA`      | `CODE-AUD-020`, `CAP-SCOPE-018`, `GAP-CTRL-001`, `GAP-CTRL-006` |
| `CAP-18.12` | Coordinar comunicación durante incidentes     | Aplicación afectada + SHELL | Contingencias y reincorporación se ejecutan manualmente; no existe ciclo integral.          | `EVC-20`, `EVC-17`, `EVC-21` | `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` | `CODE-AUD-020`, `CAP-SCOPE-018`, `GAP-CTRL-001`, `GAP-CTRL-006` |

---

#### 8. Mapa inverso por repositorio y superficie

| Repositorio o medio                                                                     | Capacidades vinculadas actualmente                                                                                                                                                  | Límite que debe conservar `CODE-AUD-020`                                                                              |
| --------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| `vento-shell`                                                                           | contratos compartidos, Auth, autorización, Edge Functions, cron, migraciones, eventos e infraestructura transversal de `CAP-02`, `CAP-09` a `CAP-12`, `CAP-15`, `CAP-16` y `CAP-18` | no convertir infraestructura compartida en propiedad empresarial universal; reconciliar remoto y repositorio          |
| `vento-viso`                                                                            | `CAP-01`, gran parte de `CAP-02` y `CAP-03`, administración de catálogo, CMS, vacantes y documentos                                                                                 | separar gobierno administrativo, producto, CMS y funciones consumidoras; endurecer autorización y alcance             |
| `vento-anima`                                                                           | asistencia, turnos personales, documentos, anuncios, soporte, carné y configuración de `CAP-02`, `CAP-15` y `CAP-16`                                                                | completar corrección, idempotencia, Realtime, segundo plano y límites de datos                                        |
| `vento-talento`                                                                         | base futura de reclutamiento, postulación, documentos, entrevistas y oferta de `CAP-02`                                                                                             | no declararlo operativo; diseñar traspaso TALENTO → VISO/ANIMA sin duplicar identidad                                 |
| `vento-nexo`                                                                            | producto, inventario, remisiones, traslados, activos, ubicaciones, impresión y parte de instalaciones: `CAP-04`, `CAP-06`, `CAP-07`, `CAP-11`, `CAP-13` y `CAP-15`                  | separar fuente de verdad, retirar contratos legacy, completar LPN/activos/remisiones y asegurar atomicidad            |
| `vento-fogo`                                                                            | recetas y base de ejecución productiva: `CAP-04` y `CAP-08`                                                                                                                         | distinguir recetas en uso de lotes sin adopción; completar ciclo productivo y efectos de inventario                   |
| `vento-origo`                                                                           | proveedores, órdenes, revisión maestra y recepción: `CAP-05` y vínculos con `CAP-06` y `CAP-12`                                                                                     | convertir recepción secuencial en operación atómica, idempotente y adoptada                                           |
| `vento-pulso`                                                                           | pedidos, estados, salón, conversación, importación y base POS: `CAP-09`, `CAP-10`, `CAP-11` y caja de `CAP-12`                                                                      | completar POS, consumidor final, caja, facturación, correcciones y cierre; retirar dependencia legacy controladamente |
| `vento-numera`                                                                          | gastos, centros de costo, resúmenes, equilibrio y rentabilidad: `CAP-12` y `CAP-17`                                                                                                 | no presentar analítica parcial como contabilidad, cartera, tesorería o cierre completos                               |
| `vento-pass`                                                                            | cliente, membresía, fidelización, pedido, pago, entrega, chat y Wallet: `CAP-09`, `CAP-10` y `CAP-11`                                                                               | centralizar sedes, contratos, redención y pagos; separar cliente de RBAC laboral                                      |
| `Vento-Group` + CMS VISO                                                                | contenido público, empleos publicados, marca y oferta: `CAP-14`                                                                                                                     | distinguir publicación actual de AURA futura; implementar o retirar newsletter ficticia                               |
| Makos, Rappi, ManyChat, Shopify, WhatsApp, Excel, papel, bancos, asesores y proveedores | ejecución AS-IS manual o externa de ventas, pedidos, pagos, abastecimiento, cumplimiento, instalaciones, mercadeo y continuidad                                                     | mantener coexistencia, reconciliación, evidencia y cutover antes de retirar el método actual                          |

---

#### 9. Artefactos técnicos que no constituyen una capacidad por sí mismos

| Artefacto                                   | Clasificación                                    | Vinculación o destino                                                                          |
| ------------------------------------------- | ------------------------------------------------ | ---------------------------------------------------------------------------------------------- |
| aplicación `aura` registrada y permiso base | reserva técnica, no implementación               | capacidades `CAP-14`; decisión en `AURA-AUD-010` e `INT-MKT-001`                               |
| repositorio y esquema TALENTO               | base futura                                      | `CAP-02.02`, `CAP-02.03`, `CAP-02.11` y `CAP-02.13`; `CAP-TAL-001` a `CAP-TAL-006`             |
| VITAL                                       | producto personal separado                       | fuera de `LB-CAP-VENTO-001`; no se incorpora al backlog Vento OS                               |
| sede `APP-REVIEW`                           | dato de demostración aislado                     | soporte de `CAP-15.09`; conservación o retiro en `CODE-AUD-020`                                |
| scripts y migraciones históricas de sandbox | historial o residuo técnico                      | `CODE-AUD-020`; no representan una capacidad actual                                            |
| `delivery-portal` solo remoto               | implementación no reproducible desde repositorio | `CAP-11.07` a `CAP-11.12`; versionar y auditar mediante `CODE-AUD-020` y tareas de integración |
| buckets sin consumidor localizado           | infraestructura no asignada                      | clasificar en `CODE-AUD-020` y E3 antes de conservar, migrar o retirar                         |
| permisos, tablas, triggers y RPC aislados   | piezas técnicas                                  | solo cuentan cuando la matriz los vincula a una capacidad, actor, contrato y resultado         |

---

#### 10. Contratos distribuidos que requieren una única frontera

| Frente                                       | Capacidad principal          | Implementación actual                                    | Riesgo conservado                                        | Destino                                                                                              |
| -------------------------------------------- | ---------------------------- | -------------------------------------------------------- | -------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- |
| identidad laboral y acceso                   | `CAP-02`, `CAP-15.01`        | VISO, ANIMA, SHELL, `vento-shell` y Supabase             | reglas duplicadas, alcance desigual y cierre incompleto  | `CODE-AUD-020`, `CAP-SCOPE-002`, `CAP-SCOPE-015`                                                     |
| producto y presentación                      | `CAP-04`                     | NEXO, VISO, FOGO, ORIGO, PULSO y PASS                    | fuentes competidoras y conversiones incompatibles        | `CODE-AUD-020`, `CAP-SCOPE-004`                                                                      |
| compra → recepción → inventario → costo      | `CAP-05`, `CAP-06`, `CAP-12` | ORIGO, NEXO, NUMERA y Supabase                           | efectos parciales, duplicación y conciliación incompleta | `CODE-AUD-020`, `CAP-SCOPE-005`, `CAP-SCOPE-006`, `CAP-SCOPE-012`                                    |
| producción → inventario → costo              | `CAP-08`, `CAP-06`, `CAP-12` | FOGO, NEXO y NUMERA                                      | estructuras sin uso, cierre y efectos no probados        | `CODE-AUD-020`, `CAP-SCOPE-008`, `CAP-SCOPE-006`, `CAP-SCOPE-012`                                    |
| pedido → venta → pago → inventario → lealtad | `CAP-09`, `CAP-10`, `CAP-12` | PULSO, PASS, NEXO, NUMERA, POS externos y Edge Functions | doble emisión, pago fuera de orden y efectos no atómicos | `CODE-AUD-020`, `CAP-SCOPE-009`, `CAP-SCOPE-010`, `CAP-SCOPE-012`, `INT-SALES-001` a `INT-SALES-011` |
| remisión, transporte y entrega               | `CAP-06`, `CAP-11`           | NEXO, PULSO, PASS y `delivery-portal`                    | custodia, estados y reintentos distribuidos              | `CODE-AUD-020`, `CAP-SCOPE-006`, `CAP-SCOPE-011`                                                     |
| documentos y evidencia                       | `CAP-16`                     | ANIMA, VISO, TALENTO, Storage y funciones                | acceso, retención, versión y sensibilidad inconsistentes | `CODE-AUD-020`, `CAP-SCOPE-016`                                                                      |
| incidentes y continuidad                     | `CAP-18`                     | colas, tickets, cron, backups y operación manual         | recuperación sin reconciliación empresarial integral     | `CODE-AUD-020`, `CAP-SCOPE-018`                                                                      |

---

#### 11. Hallazgos y destino obligatorio

| ID               | Hallazgo                                                                                                                       | Clasificación                     | Destino                                                                   |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------ | --------------------------------- | ------------------------------------------------------------------------- |
| `H-CODE-019-001` | las 217 subcapacidades pueden vincularse sin crear una taxonomía paralela                                                      | control documental                | cerrado mediante `MAP-IMPL-CAP-001`                                       |
| `H-CODE-019-002` | una misma capacidad puede tener productora actual, propietaria candidata y consumidores distintos                              | frontera arquitectónica           | `CAP-SCOPE-001` a `CAP-SCOPE-019`; `CODE-AUD-020`                         |
| `H-CODE-019-003` | VISO y NEXO concentran la mayor superficie técnica, pero no son propietarios universales                                       | concentración de implementación   | `CODE-AUD-020`; `CAP-SCOPE-001`, `004`, `006`, `007`, `013`, `015`, `016` |
| `H-CODE-019-004` | TALENTO vincula capacidades reales, pero permanece como base futura sin despliegue ni adopción                                 | futuro con base técnica           | `CAP-TAL-001` a `CAP-TAL-006`; `CODE-AUD-020`                             |
| `H-CODE-019-005` | AURA no cubre actualmente ninguna capacidad aunque exista reserva de catálogo                                                  | reserva sin implementación        | `AURA-AUD-010`; `INT-MKT-001`; `CODE-AUD-020`                             |
| `H-CODE-019-006` | varias capacidades dependen de medios manuales o externos que no pueden retirarse por la sola existencia de código             | coexistencia operativa            | `CODE-AUD-020`; E5 y tareas de integración correspondientes               |
| `H-CODE-019-007` | recepción, producción, POS, mantenimiento de activos, entrega, gastos y presupuestos contienen estructuras sin uso comprobado  | adopción no demostrada            | `CODE-AUD-020`; `CAP-SCOPE-005`, `007`, `008`, `009`, `011`, `012`        |
| `H-CODE-019-008` | instalaciones y continuidad carecen de implementación empresarial integral verificable                                         | brecha funcional                  | `CAP-SCOPE-013`, `CAP-SCOPE-018`, `CODE-AUD-020`                          |
| `H-CODE-019-009` | contratos de identidad, producto, pagos, inventario, documentos y entrega están distribuidos entre repositorios                | contrato transversal              | `CODE-AUD-020`, BLOQUE X, E3 y E4 mediante tareas ya existentes           |
| `H-CODE-019-010` | `vento-shell` contiene contratos y migraciones compartidos, pero no debe absorber propiedad funcional                          | regla de propiedad                | `CAP-SCOPE-001` a `CAP-SCOPE-019`; `SHELL-CON-023`                        |
| `H-CODE-019-011` | `TREQ-PASS-004` y `TREQ-INTEGRATION-001` quedan vinculados a las evidencias de sedes, dominios y contratos distribuidos        | obligación de regresión existente | conservar en `04A`; implementación en sus paquetes E5                     |
| `H-CODE-019-012` | artefactos sin capacidad o sin consumidor deben entrar al backlog técnico, no convertirse en funciones empresariales ficticias | deuda o residuo técnico           | `CODE-AUD-020`                                                            |

No se crea ninguna tarea nueva del roadmap. Todos los hallazgos tienen destino existente y exacto.

---

#### 12. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA NUEVOS

**Justificación:** esta tarea consolida trazabilidad documental y no introduce ni modifica comportamiento ejecutable. Mantiene vigentes, entre otros, `TREQ-PASS-004`, `TREQ-INTEGRATION-001`, `TREQ-SUPABASE-001`, `TREQ-SUPABASE-002`, `TREQ-NEXO-005`, `TREQ-NEXO-006`, `TREQ-ORIGO-001`, `TREQ-ORIGO-003`, `TREQ-ANIMA-003`, `TREQ-ANIMA-004`, `TREQ-PASS-009` y `TREQ-INTEGRATION-003`.

La matriz no marca ningún requisito como implementado o verificado. `CODE-AUD-020` y los paquetes E5 deberán conservar la relación entre capacidad, hallazgo, requisito y corrección.

---

#### 13. Decisiones propuestas

1. Se adopta `MAP-IMPL-CAP-001` como mapa técnico de referencia de `LB-CAP-VENTO-001 v1.0`.
2. Las 217 subcapacidades quedan vinculadas individualmente con una representación actual o con una ausencia explícita.
3. Propietaria candidata, productora actual, consumidora y repositorio técnico permanecen como conceptos separados.
4. Una tabla, permiso, ruta, RPC o componente aislado no prueba cobertura empresarial.
5. Una operación manual o externa se conserva como implementación AS-IS y no se borra del mapa.
6. Una estructura sin datos no se presenta como operación adoptada.
7. TALENTO conserva su vínculo con capacidades de personas sin declararse operativo.
8. AURA permanece como idea futura y no recibe cobertura ficticia.
9. VITAL permanece fuera de Vento OS.
10. `vento-shell` conserva migraciones y contratos compartidos sin convertirse en propietario universal.
11. Los contratos distribuidos deberán converger mediante las tareas de propiedad, integración, datos y servicios ya existentes.
12. `CODE-AUD-020` convertirá cada vínculo parcial, manual, ausente, futuro o competidor en backlog trazable por repositorio.
13. No se modifican código, datos, despliegues, Supabase ni el registro de requisitos de prueba.
14. No se crean tareas ni requisitos de prueba nuevos.
15. `CODE-AUD-020` será la única continuidad inmediata.

---

#### 14. Límites de certeza

Esta tarea no confirma:

- adopción cotidiana de cada ruta o pantalla;
- que el despliegue productivo corresponda exactamente al checkout inspeccionado;
- que una relación con datos contenga información suficiente y correcta;
- que una operación manual haya sido observada en todas las sedes;
- que una implementación parcial sea la arquitectura que deberá conservarse;
- que todos los permisos, RLS, RPC, Edge Functions, reintentos y transacciones sean correctos;
- que una capacidad vinculada esté lista para cutover;
- que una tabla vacía deba poblarse;
- que un artefacto sin consumidor pueda retirarse sin análisis;
- que los nombres actuales de rutas, tablas o repositorios sean los nombres objetivo.

Los límites no impiden vincular la evidencia existente. Impiden transformar inferencias en hechos.

---

#### 15. Criterios de aceptación

`CODE-AUD-019` podrá aprobarse cuando:

- las 18 familias y 217 subcapacidades estén presentes exactamente una vez;
- cada subcapacidad tenga propietaria candidata, implementación actual, evidencia, estado y destino;
- uso, parcialidad, estructura sin uso, manual/external, ausencia y base futura estén diferenciados;
- la matriz no confunda repositorio técnico con aplicación propietaria;
- VISO y NEXO no se conviertan en propietarios universales por concentración de código;
- TALENTO permanezca futuro, AURA permanezca diferida y VITAL permanezca separado;
- las capacidades manuales y externas permanezcan visibles;
- los contratos distribuidos tengan destino exacto;
- los artefactos sin capacidad o consumidor queden reservados para `CODE-AUD-020`;
- todos los hallazgos tengan tareas existentes;
- se declare expresamente que no genera requisitos de prueba nuevos;
- no se modifique código, CI, despliegues, Supabase ni 04A;
- `CODE-AUD-020` permanezca como única continuidad inmediata.

---

#### 16. Resultado y continuidad

Al aprobarse quedará definida la cadena:

```text
LB-CAP-VENTO-001 v1.0
→ 217 subcapacidades
→ MAP-IMPL-CAP-001
→ repositorio, superficie, contrato, dato o medio actual
→ estado de vinculación y limitación
→ hallazgo con destino exacto
→ backlog técnico y funcional por repositorio
```

La continuidad será exclusivamente:

```text
CODE-AUD-020
— Crear backlog técnico y funcional trazable por repositorio
```

`CODE-AUD-020` deberá transformar esta matriz en unidades de backlog sin reabrir la taxonomía, sin duplicar brechas y sin asignar una corrección a un repositorio que solo sea consumidor.


### ✅ CODE-AUD-020 — Crear backlog técnico y funcional trazable por repositorio

**Estado:** APROBADO
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Tipo:** consolidación final de brechas de código, capacidad, datos, seguridad, adopción y operación  
**Dependencia anterior:** `CODE-AUD-019` — APROBADA  
**Continuidad obligatoria:** `QA-REG-001` — Consolidar retrospectivamente requisitos de prueba anteriores a QA-GOV-001  
**Línea base funcional:** `MAP-IMPL-CAP-001` / `LB-CAP-VENTO-001 v1.0`  
**Fecha de corte conservada:** 2026-07-24  
**Cambios en código, CI, despliegues o Supabase:** no realizados  

---

#### 1. Resultado de esta tarea

Esta tarea crea el registro documental `BKL-REPO-001`, que transforma la evidencia de `CODE-AUD-001` a `CODE-AUD-019` y las 217 filas de `MAP-IMPL-CAP-001` en un backlog accionable, propietario y trazable por repositorio o medio operativo.

La cadena resultante es:

```text
capacidad o hallazgo
→ repositorio, aplicación o medio actual
→ brecha técnica o funcional consolidada
→ prioridad y puerta
→ tarea canónica existente
→ requisito de prueba existente cuando aplique
→ evidencia exigida para cerrar
```

El registro contiene **18 entradas funcionales** y **65 entradas técnicas**, para un total de **83 elementos de backlog**.

| Cobertura de entrada                                                          | Resultado |
| ----------------------------------------------------------------------------- | --------: |
| Subcapacidades de `MAP-IMPL-CAP-001`                                          |   **217** |
| Subcapacidades sin remediación inmediata (`IMPLEMENTACIÓN_VERIFICADA_EN_USO`) |    **29** |
| Subcapacidades abiertas consolidadas en backlog funcional                     |   **188** |
| Familias funcionales                                                          |    **18** |
| Elementos técnicos por repositorio o superficie                               |    **65** |
| Hallazgos con destino explícito a `CODE-AUD-020` cubiertos                    |    **94** |
| Hallazgos de límite o control conservados sin acción nueva                    |     **3** |

Los identificadores `BKL-*` son **registros del backlog**, no tareas del roadmap. No deberán insertarse como encabezados `###`, no alteran el orden de implementación y no sustituyen las tareas canónicas indicadas en cada fila.

---

#### 2. Fuentes obligatorias y alcance

El backlog consolida:

- `CODE-AUD-001` a `CODE-AUD-019`;
- `MAP-IMPL-CAP-001` y sus 217 subcapacidades;
- requisitos vigentes de `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`;
- tareas existentes de E2, E3, E4, E5, BLOQUE X, GAP y QA;
- procesos manuales y terceros registrados como operación AS-IS.

No se vuelve a auditar el código ni se actualiza el corte. `CODE-AUD-020` organiza y asigna la evidencia ya aprobada; una revisión posterior deberá registrar un nuevo corte y no sobrescribir este historial.

---

#### 3. Convención y estados del backlog

| Elemento         | Convención                      | Uso                                           |
| ---------------- | ------------------------------- | --------------------------------------------- |
| Registro         | `BKL-REPO-001`                  | contenedor documental de esta tarea           |
| Brecha funcional | `BKL-FUNC-NNN`                  | agrupación por familia `CAP-*`                |
| Brecha técnica   | `BKL-<REPO>-NNN` o `BKL-XR-NNN` | trabajo técnico por repositorio o transversal |

Estado inicial de todas las filas abiertas: `REGISTRADO`.

| Prioridad | Regla                                                                                                                   |
| --------- | ----------------------------------------------------------------------------------------------------------------------- |
| `P0`      | riesgo crítico de seguridad, integridad, dinero, inventario, identidad, build bloqueado o activación operativa insegura |
| `P1`      | necesario antes de adopción, cutover, ampliación de alcance o siguiente release relevante                               |
| `P2`      | mejora funcional o técnica necesaria antes de escalar, pero con control actual aceptable                                |
| `P3`      | saneamiento, retiro o deuda de bajo riesgo que exige evidencia antes de eliminar                                        |

Una fila solo podrá pasar a `CERRADO` cuando la tarea canónica responsable registre evidencia reproducible y los `TREQ-*` relacionados estén implementados y verificados cuando corresponda.

---

#### 4. Reglas de consolidación

1. Una fila funcional puede agrupar varias subcapacidades, pero enumera todos sus identificadores abiertos.
2. Una fila técnica puede agrupar hallazgos equivalentes del mismo repositorio y resultado de cierre.
3. Ninguna fila crea una tarea nueva; el destino utiliza identificadores ya materializados.
4. `IMPLEMENTACIÓN_VERIFICADA_EN_USO` se conserva como baseline y pasa a protección mediante QA, no a remediación automática.
5. `ESTRUCTURA_VERIFICADA_SIN_USO_COMPROBADO` exige diseño, piloto y evidencia antes de activarse.
6. `OPERACIÓN_MANUAL_O_EXTERNA_DOCUMENTADA` exige coexistencia y cutover; no autoriza retirar el método AS-IS.
7. `SIN_IMPLEMENTACIÓN_VERIFICABLE` exige decisión en `CAP-SCOPE-*`; no obliga automáticamente a construir software.
8. Hallazgos de seguridad P0 deben contenerse antes de ampliar el proceso afectado.
9. Toda corrección de base, RLS, función, trigger, Storage o Edge Function se materializa en `vento-shell`.
10. `QA-REG-001` se ejecutará inmediatamente después de esta tarea y antes de `CAP-SCOPE-001`.

---

#### 5. Backlog funcional consolidado

Las 29 subcapacidades con implementación verificada en uso aparecen como baseline protegida; las otras 188 aparecen exactamente una vez en la columna **Brechas abiertas**.

| ID             | Familia                                            | Repositorios o medios actuales                                                                   | Prioridad | Brechas abiertas por estado                                                                                                                                                                                                                                                  | Baseline verificada en uso                                                                             | Decisión y resultado requerido                                                                                                                    | Destino exacto                                                                                                                                            |
| -------------- | -------------------------------------------------- | ------------------------------------------------------------------------------------------------ | --------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `BKL-FUNC-001` | `CAP-01` — Dirección y gobierno                    | `vento-viso`                                                                                     | `P1`      | **Parcial (4):** `CAP-01.05`, `CAP-01.06`, `CAP-01.07`, `CAP-01.08`<br>**Manual o externa (3):** `CAP-01.01`, `CAP-01.02`, `CAP-01.09`<br>**Sin implementación (1):** `CAP-01.10`                                                                                            | `CAP-01.03`, `CAP-01.04`                                                                               | Definir propiedad y ciclo TO-BE de decisiones, políticas, riesgos y verificación de cumplimiento sin convertir VISO en propietario universal.     | `CAP-SCOPE-001`                                                                                                                                           |
| `BKL-FUNC-002` | `CAP-02` — Personas y trabajo                      | `vento-viso`, `vento-anima`, `vento-talento`, `vento-numera`, `vento-shell`                      | `P0`      | **Parcial (6):** `CAP-02.01`, `CAP-02.03`, `CAP-02.07`, `CAP-02.08`, `CAP-02.11`, `CAP-02.13`<br>**Manual o externa (3):** `CAP-02.09`, `CAP-02.10`, `CAP-02.12`<br>**Futura con base técnica (1):** `CAP-02.02`                                                             | `CAP-02.04`, `CAP-02.05`, `CAP-02.06`                                                                  | Separar TALENTO, VISO y ANIMA; cerrar asistencia, novedades, documentos, retiro de accesos y tratamiento del proceso laboral externo.             | `CAP-SCOPE-002`; `CAP-TAL-001`; `CAP-TAL-002`; `CAP-TAL-003`; `CAP-TAL-004`; `CAP-TAL-005`; `CAP-TAL-006`; `INT-WORK-003`; `ANIMA-UX-011`; `ANIMA-UX-012` |
| `BKL-FUNC-003` | `CAP-03` — Seguridad, salud y cumplimiento         | `vento-viso`, `vento-nexo`, `vento-fogo` y operación manual                                      | `P1`      | **Parcial (10):** `CAP-03.01`, `CAP-03.02`, `CAP-03.03`, `CAP-03.04`, `CAP-03.05`, `CAP-03.06`, `CAP-03.07`, `CAP-03.08`, `CAP-03.09`, `CAP-03.10`                                                                                                                           | —                                                                                                      | Decidir qué controles se digitalizan, integran o permanecen manuales y crear evidencia auditable de inspección y corrección.                      | `CAP-SCOPE-003`                                                                                                                                           |
| `BKL-FUNC-004` | `CAP-04` — Productos, preparaciones y conocimiento | `vento-nexo`, `vento-fogo`, `vento-pulso`, `vento-pass`, `vento-viso`                            | `P1`      | **Parcial (3):** `CAP-04.08`, `CAP-04.09`, `CAP-04.10`                                                                                                                                                                                                                       | `CAP-04.01`, `CAP-04.02`, `CAP-04.03`, `CAP-04.04`, `CAP-04.05`, `CAP-04.06`, `CAP-04.07`              | Conservar el catálogo en uso, cerrar calidad, alérgenos, vigencia y precedencias compartidas de producto, presentación y receta.                  | `CAP-SCOPE-004`                                                                                                                                           |
| `BKL-FUNC-005` | `CAP-05` — Abastecimiento                          | `vento-origo`, `vento-nexo`, `vento-numera`, `vento-shell`                                       | `P0`      | **Parcial (5):** `CAP-05.01`, `CAP-05.02`, `CAP-05.03`, `CAP-05.06`, `CAP-05.07`<br>**Estructura sin uso (2):** `CAP-05.08`, `CAP-05.09`<br>**Manual o externa (5):** `CAP-05.04`, `CAP-05.05`, `CAP-05.10`, `CAP-05.11`, `CAP-05.12`                                        | —                                                                                                      | Completar abastecimiento y recepción, preservar negociación manual cuando corresponda y conectar inventario, costos y documentos sin duplicación. | `CAP-SCOPE-005`; `ORIGO-UX-009`; `ORIGO-UX-010`; `ORIGO-UX-014`; `ORIGO-UX-016`                                                                           |
| `BKL-FUNC-006` | `CAP-06` — Inventario y almacenamiento             | `vento-nexo`, `vento-shell`                                                                      | `P0`      | **Parcial (6):** `CAP-06.02`, `CAP-06.06`, `CAP-06.09`, `CAP-06.10`, `CAP-06.11`, `CAP-06.14`<br>**Manual o externa (1):** `CAP-06.15`                                                                                                                                       | `CAP-06.01`, `CAP-06.03`, `CAP-06.04`, `CAP-06.05`, `CAP-06.07`, `CAP-06.08`, `CAP-06.12`, `CAP-06.13` | Cerrar LPN, remisiones, frío, reconciliación y atomicidad del ledger y sus proyecciones.                                                          | `CAP-SCOPE-006`; `NEXO-UX-009`; `NEXO-UX-010`; `NEXO-UX-011`; `NEXO-UX-012`; `NEXO-UX-013`                                                                |
| `BKL-FUNC-007` | `CAP-07` — Activos y reutilizables                 | `vento-nexo`                                                                                     | `P1`      | **Parcial (7):** `CAP-07.01`, `CAP-07.02`, `CAP-07.03`, `CAP-07.04`, `CAP-07.06`, `CAP-07.11`, `CAP-07.12`<br>**Estructura sin uso (5):** `CAP-07.05`, `CAP-07.07`, `CAP-07.08`, `CAP-07.09`, `CAP-07.10`<br>**Manual o externa (1):** `CAP-07.13`                           | —                                                                                                      | Completar ciclo de activos, conteo patrimonial, mantenimiento, garantías, baja, vehículos y consumibles reutilizables.                            | `CAP-SCOPE-007`                                                                                                                                           |
| `BKL-FUNC-008` | `CAP-08` — Producción                              | `vento-fogo`, `vento-nexo`, `vento-shell`                                                        | `P0`      | **Estructura sin uso (14):** `CAP-08.01`, `CAP-08.02`, `CAP-08.03`, `CAP-08.04`, `CAP-08.05`, `CAP-08.06`, `CAP-08.07`, `CAP-08.08`, `CAP-08.09`, `CAP-08.10`, `CAP-08.11`, `CAP-08.12`, `CAP-08.13`, `CAP-08.14`                                                            | —                                                                                                      | No activar estructuras productivas hasta aprobar el ciclo de lote, consumo, desperdicio, resultado, corrección e inventario.                      | `CAP-SCOPE-008`; `FOGO-UX-005`; `FOGO-UX-006`; `FOGO-UX-007`; `FOGO-UX-010`; `FOGO-UX-011`; `FOGO-UX-012`; `FOGO-UX-013`                                  |
| `BKL-FUNC-009` | `CAP-09` — Venta, cobro y pedidos                  | `vento-pulso`, `vento-pass`, `vento-nexo`, `vento-numera`, `vento-shell` y POS externo           | `P0`      | **Parcial (8):** `CAP-09.03`, `CAP-09.05`, `CAP-09.06`, `CAP-09.07`, `CAP-09.08`, `CAP-09.09`, `CAP-09.10`, `CAP-09.12`<br>**Estructura sin uso (1):** `CAP-09.15`<br>**Manual o externa (2):** `CAP-09.13`, `CAP-09.14`                                                     | `CAP-09.01`, `CAP-09.02`, `CAP-09.04`, `CAP-09.11`                                                     | Completar POS, caja, cobro, facturación, anulaciones y efectos exactamente una vez, conservando coexistencia con el POS externo.                  | `CAP-SCOPE-009`; `PULSO-UX-001`; `INT-POS-001`; `INT-POS-019`                                                                                             |
| `BKL-FUNC-010` | `CAP-10` — Clientes y relaciones                   | `vento-pass`, `vento-pulso`, `vento-viso`                                                        | `P0`      | **Parcial (4):** `CAP-10.02`, `CAP-10.03`, `CAP-10.09`, `CAP-10.10`<br>**Estructura sin uso (2):** `CAP-10.06`, `CAP-10.07`<br>**Manual o externa (3):** `CAP-10.04`, `CAP-10.05`, `CAP-10.08`                                                                               | `CAP-10.01`                                                                                            | Cerrar identidad de cliente, reclamos, servicio, fidelización, redención y experiencia de seguimiento sin exponer PII ni saldo.                   | `CAP-SCOPE-010`; `PASS-UX-001`                                                                                                                            |
| `BKL-FUNC-011` | `CAP-11` — Transporte, despacho y entrega          | `vento-nexo`, `vento-pulso`, `vento-pass`, `vento-shell` y `delivery-portal`                     | `P1`      | **Parcial (3):** `CAP-11.04`, `CAP-11.05`, `CAP-11.06`<br>**Estructura sin uso (1):** `CAP-11.09`<br>**Manual o externa (8):** `CAP-11.01`, `CAP-11.02`, `CAP-11.03`, `CAP-11.07`, `CAP-11.08`, `CAP-11.10`, `CAP-11.11`, `CAP-11.12`                                        | —                                                                                                      | Definir planeación, custodia, transporte, portal, entrega, novedades, evidencia y conciliación entre NEXO, PULSO, PASS y terceros.                | `CAP-SCOPE-011`; `NEXO-UX-009`; `PULSO-UX-001`                                                                                                            |
| `BKL-FUNC-012` | `CAP-12` — Dinero, costos y obligaciones           | `vento-numera`, `vento-pulso`, `vento-origo`, `vento-nexo`, `vento-shell` y terceros financieros | `P0`      | **Parcial (8):** `CAP-12.01`, `CAP-12.06`, `CAP-12.07`, `CAP-12.08`, `CAP-12.09`, `CAP-12.10`, `CAP-12.14`, `CAP-12.15`<br>**Estructura sin uso (2):** `CAP-12.02`, `CAP-12.11`<br>**Manual o externa (5):** `CAP-12.03`, `CAP-12.04`, `CAP-12.05`, `CAP-12.12`, `CAP-12.13` | —                                                                                                      | Distinguir costos y resúmenes existentes de contabilidad, tesorería, cartera, bancos, impuestos y presupuesto todavía no adoptados.               | `CAP-SCOPE-012`                                                                                                                                           |
| `BKL-FUNC-013` | `CAP-13` — Instalaciones                           | `vento-nexo`, `vento-viso` y operación manual                                                    | `P1`      | **Parcial (1):** `CAP-13.01`<br>**Sin implementación (10):** `CAP-13.02`, `CAP-13.03`, `CAP-13.04`, `CAP-13.05`, `CAP-13.06`, `CAP-13.07`, `CAP-13.08`, `CAP-13.09`, `CAP-13.10`, `CAP-13.11`                                                                                | —                                                                                                      | Decidir BUILD, BUY, integración o operación manual para mantenimiento de instalaciones, limpieza, plagas, servicios, llaves y calibración.        | `CAP-SCOPE-013`                                                                                                                                           |
| `BKL-FUNC-014` | `CAP-14` — Comunicación y promoción                | `vento-viso`, `Vento-Group`, `vento-pass`, `vento-pulso` y AURA futura                           | `P2`      | **Parcial (2):** `CAP-14.01`, `CAP-14.06`<br>**Manual o externa (4):** `CAP-14.02`, `CAP-14.08`, `CAP-14.09`, `CAP-14.11`<br>**Sin implementación (3):** `CAP-14.05`, `CAP-14.07`, `CAP-14.10`                                                                               | `CAP-14.03`, `CAP-14.04`                                                                               | Conservar CMS y web actuales, resolver newsletter y decidir AURA antes de crear campañas o automatizaciones nuevas.                               | `CAP-SCOPE-014`; `AURA-AUD-010`; `INT-MKT-001`                                                                                                            |
| `BKL-FUNC-015` | `CAP-15` — Tecnología y soporte                    | `vento-shell` y todos los repositorios consumidores                                              | `P0`      | **Parcial (7):** `CAP-15.02`, `CAP-15.04`, `CAP-15.05`, `CAP-15.06`, `CAP-15.07`, `CAP-15.08`, `CAP-15.09`<br>**Manual o externa (3):** `CAP-15.03`, `CAP-15.10`, `CAP-15.11`                                                                                                | `CAP-15.01`                                                                                            | Consolidar Auth, contratos, dispositivos, impresión, soporte, observabilidad, despliegues y gobierno técnico transversal.                         | `CAP-SCOPE-015`; `GAP-CTRL-001`; `GAP-CTRL-006`                                                                                                           |
| `BKL-FUNC-016` | `CAP-16` — Información, documentos y evidencia     | `vento-shell`, `vento-viso`, `vento-anima`, `vento-talento` y aplicaciones propietarias          | `P0`      | **Parcial (10):** `CAP-16.01`, `CAP-16.02`, `CAP-16.04`, `CAP-16.05`, `CAP-16.06`, `CAP-16.07`, `CAP-16.08`, `CAP-16.09`, `CAP-16.10`, `CAP-16.11`                                                                                                                           | `CAP-16.03`                                                                                            | Definir clasificación, acceso, versión, retención, firma, auditoría y eliminación de documentos y evidencia por dominio.                          | `CAP-SCOPE-016`; `GAP-CTRL-001`; `GAP-CTRL-006`                                                                                                           |
| `BKL-FUNC-017` | `CAP-17` — Medición, análisis y mejora             | `vento-numera` y aplicaciones fuente                                                             | `P1`      | **Parcial (9):** `CAP-17.01`, `CAP-17.02`, `CAP-17.03`, `CAP-17.04`, `CAP-17.05`, `CAP-17.06`, `CAP-17.07`, `CAP-17.08`, `CAP-17.09`<br>**Manual o externa (3):** `CAP-17.10`, `CAP-17.11`, `CAP-17.12`                                                                      | —                                                                                                      | Aprobar definiciones de métricas, calidad, fuentes, periodicidad y ciclo de mejora sin presentar reportes parciales como analítica integral.      | `CAP-SCOPE-017`; `GAP-CTRL-001`; `GAP-CTRL-006`                                                                                                           |
| `BKL-FUNC-018` | `CAP-18` — Continuidad e incidentes                | `vento-shell`, aplicaciones afectadas y operación manual                                         | `P0`      | **Parcial (3):** `CAP-18.03`, `CAP-18.06`, `CAP-18.11`<br>**Manual o externa (7):** `CAP-18.02`, `CAP-18.05`, `CAP-18.07`, `CAP-18.08`, `CAP-18.09`, `CAP-18.10`, `CAP-18.12`<br>**Sin implementación (2):** `CAP-18.01`, `CAP-18.04`                                        | —                                                                                                      | Crear inventario de procesos críticos, contingencia, recuperación, reincorporación y cierre auditable por dominio.                                | `CAP-SCOPE-018`; `GAP-CTRL-001`; `GAP-CTRL-006`                                                                                                           |

---

#### 6. Backlog técnico transversal y por repositorio

| ID               | Repositorio o superficie                     | Prioridad / tipo              | Brecha consolidada                                                          | Hallazgos origen                                                                                                                                                                                     | Acción y resultado esperado                                                                                                                                                                           | Destino exacto                                                                                                                                                                                                                                                                                                                                                           | Requisitos existentes                                               | Evidencia de cierre                                                                                                                   | Momento                                                                               |
| ---------------- | -------------------------------------------- | ----------------------------- | --------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- |
| `BKL-XR-001`     | `vento-shell` / Supabase                     | `P0` / `DATOS`                | Reconciliar estado remoto, migraciones y contratos locales                  | `H-CODE-004-001`; `H-CODE-005-006`; `H-CODE-006-001`; `H-CODE-006-005`; `H-CODE-006-014`; `H-CODE-019-009`                                                                                           | Crear el inventario reproducible de relaciones, funciones, vistas, triggers y dependencias; identificar drift y convertir toda diferencia aceptada en migración versionada.                           | `SUPA-AUD-004`; `SUPA-AUD-006`; `SUPA-AUD-008`; `SUPA-AUD-016`; `SUPA-AUD-017`; `SUPA-AUD-022`; `SUPA-AUD-023`; `SUPA-AUD-024`; `SUPA-TRANS-001`; `SUPA-TRANS-003`; `SUPA-TRANS-013`; `SUPA-TRANS-015`                                                                                                                                                                   | `TREQ-SUPABASE-001`; `TREQ-SUPABASE-003`                            | Mapa objeto → capacidad → consumidor completo, diff local/remoto explicado, migraciones y rollback definidos.                         | E3, antes de cualquier paquete de migración o retiro                                  |
| `BKL-XR-002`     | `vento-shell` / Edge Functions               | `P0` / `INTEGRACIÓN`          | Versionar funciones, cron y superficies remotas no reproducibles            | `H-CODE-005-008`; `H-CODE-005-009`; `H-CODE-017-019`                                                                                                                                                 | Clasificar funciones solo locales, remoto-only y cron; incorporar o retirar `delivery-portal` mediante fuente, configuración y despliegue reproducibles sin perder controles de token.                | `SUPA-AUD-014`; `SUPA-AUD-016`; `SUPA-AUD-017`; `SUPA-TRANS-003`; `SUPA-TRANS-007`; `SUPA-TRANS-013`; `SUPA-TRANS-015`                                                                                                                                                                                                                                                   | `TREQ-SUPABASE-003`; `TREQ-SUPABASE-006`                            | Cada función y cron tiene fuente, configuración, propietario, consumidor, despliegue, secreto y prueba negativa.                      | E3/E4, antes de modificar funciones o portales productivos                            |
| `BKL-XR-003`     | `vento-shell` / Storage / Realtime           | `P0` / `SEGURIDAD`            | Corregir Storage, publicaciones y consumidores Realtime                     | `H-CODE-006-007`; `H-CODE-006-008`; `H-CODE-006-009`; `H-CODE-006-010`; `H-CODE-006-011`; `H-CODE-006-013`                                                                                           | Clasificar buckets sin consumidor, privatizar contenido sensible, corregir entrega de medios y alinear publicaciones con suscripciones reales; retirar publicaciones sin consumidor confirmado.       | `SUPA-AUD-012`; `SUPA-AUD-013`; `SUPA-AUD-016`; `SUPA-AUD-017`; `EVID-ARC-003`; `EVID-ARC-007`; `EVID-ARC-008`; `SUPA-TRANS-001`; `SUPA-TRANS-007`; `SUPA-TRANS-013`; `SUPA-TRANS-015`                                                                                                                                                                                   | `TREQ-SUPABASE-004`; `TREQ-SUPABASE-003`                            | Matriz bucket/ruta/sensibilidad y publicación/canal/consumidor aprobada, con acceso temporal y regresión.                             | P0 de seguridad antes de ampliar documentos, medios o Realtime                        |
| `BKL-XR-004`     | `vento-shell` / datos de entorno             | `P1` / `GOBIERNO`             | Clasificar seeds, cleanup, baseline y datos demo                            | `H-CODE-007-009`; `H-CODE-007-011`; `H-CODE-007-012`; `H-CODE-007-013`; `H-CODE-008-003`                                                                                                             | Separar datos canónicos de fixtures, retirar scripts o templates peligrosos, decidir `APP-REVIEW` y documentar el marcador histórico sin ejecutar cleanup sobre producción.                           | `SUPA-AUD-015`; `SUPA-AUD-018`; `SHELL-AUD-011`; `SUPA-TRANS-002`; `SUPA-TRANS-012`; `SUPA-TRANS-015`; `QA-REG-001`                                                                                                                                                                                                                                                      | —                                                                   | Todo artefacto queda clasificado como conservar, fixture, histórico o retirar; no permanece script destructivo activable sin control. | E3 y consolidación de QA, antes de crear entornos de prueba                           |
| `BKL-XR-005`     | SHELL + consumidores                         | `P0` / `AUTORIZACIÓN`         | Centralizar permisos, roles, contexto y propiedad funcional                 | `H-CODE-009-001`; `H-CODE-009-002`; `H-CODE-014-003`; `H-CODE-014-004`; `H-CODE-019-002`                                                                                                             | Sustituir listas locales y strings manuales por contratos compartidos; conservar diferencias legítimas por aplicación y validar equivalencia territorial.                                             | `SHELL-AUD-003`; `SHELL-AUD-004`; `SHELL-AUD-005`; `SHELL-AUD-006`; `SHELL-AUD-009`; `SHELL-AUD-010`; `SHELL-CON-002`; `SHELL-CON-003`; `SHELL-CON-004`; `SHELL-CON-005`; `SHELL-CON-006`; `SHELL-CON-007`; `SHELL-CON-016`; `AUTH-SRV-017`                                                                                                                              | `TREQ-AUTH-001`; `TREQ-AUTH-002`; `TREQ-AUTH-004`; `TREQ-SHELL-003` | Mismos casos de actor/contexto producen decisión equivalente en todos los consumidores y el catálogo no diverge.                      | E4, antes de refactorizar autorización en aplicaciones                                |
| `BKL-XR-006`     | Transversal / `vento-shell`                  | `P0` / `ASINCRONÍA`           | Definir estado de operación, retry, idempotencia, outbox e inbox            | `H-CODE-004-003`; `H-CODE-009-007`; `H-CODE-018-004`; `H-CODE-018-012`; `H-CODE-018-013`; `H-CODE-018-014`; `H-CODE-018-015`; `H-CODE-019-009`                                                       | Crear contratos compartidos para operación pendiente, error canónico, reintento, deduplicación, concurrencia, compensación, conciliación y cola de fallos.                                            | `TSVC-CAT-001`; `TSVC-CAT-002`; `TSVC-CAT-003`; `TSVC-CAT-004`; `TSVC-CAT-006`; `TSVC-CAT-007`; `TSVC-CAT-008`; `QUEUE-ARC-001`; `QUEUE-ARC-002`; `QUEUE-ARC-003`; `QUEUE-ARC-006`; `QUEUE-ARC-008`; `QUEUE-ARC-009`; `QUEUE-ARC-010`; `SHELL-CON-008`; `SHELL-CON-012`; `SHELL-CON-013`; `SHELL-CON-015`; `SHELL-CON-023`; `SHELL-CON-024`                              | `TREQ-INTEGRATION-003`                                              | Contrato y ADR aprobados; cada operación reintentable declara clave, hash, estados, timeout desconocido, retry y recuperación.        | E3/E4, puerta previa a pagos, inventario, recepción, producción, impresión y webhooks |
| `BKL-XR-007`     | SHELL + aplicaciones web                     | `P1` / `ARQUITECTURA`         | Consolidar AppShell, navegación, tipos y contratos compartidos              | `H-CODE-002-004`; `H-CODE-004-011`; `H-CODE-014-001`; `H-CODE-014-002`; `H-CODE-014-005`; `H-CODE-019-003`; `H-CODE-019-010`                                                                         | Comparar copias, clasificar compartir/generar/local y migrar por PR con compatibilidad y rollback; `vento-shell` no asume propiedad empresarial.                                                      | `SHELL-AUD-001`; `SHELL-AUD-006`; `SHELL-AUD-007`; `SHELL-AUD-008`; `SHELL-AUD-009`; `SHELL-AUD-010`; `SHELL-PKG-001`; `SHELL-PKG-002`; `SHELL-PKG-004`; `SHELL-PKG-005`; `SHELL-PKG-006`; `SHELL-PKG-007`; `SHELL-PKG-008`; `SHELL-CON-001`; `SHELL-CON-002`                                                                                                            | `TREQ-SHELL-002`; `TREQ-SHELL-003`                                  | Matriz de paridad y plan de migración por repositorio; ninguna copia se retira antes de pruebas y rollback.                           | E4, antes de extraer paquetes compartidos                                             |
| `BKL-XR-008`     | Transversal                                  | `P3` / `RETIRO`               | Clasificar artefactos y exports sin consumidor confirmado                   | `H-CODE-015-008`; `H-CODE-019-012`                                                                                                                                                                   | Aplicar búsqueda estática, dinámica, framework, base, CI y consumidores externos antes de retirar o conservar artefactos.                                                                             | `SHELL-AUD-011`; `SUPA-AUD-022`; `SUPA-AUD-023`                                                                                                                                                                                                                                                                                                                          | `TREQ-SHELL-004`; `TREQ-SUPABASE-003`                               | Cada artefacto tiene consumidor confirmado o evidencia de retiro seguro y PR verificable.                                             | Después de definir reemplazos; nunca antes de la paridad                              |
| `BKL-XR-009`     | Todos los repositorios                       | `P0` / `CALIDAD`              | Crear baseline de CI, pruebas y validaciones por repositorio                | `H-CODE-007-001`; `H-CODE-007-015`; `H-CODE-016-003`; `H-CODE-016-006`                                                                                                                               | Descomponer build, typecheck, lint y test por repositorio; asignar propietario y bloquear paquetes E5 sin puertas mínimas.                                                                            | `QA-REG-001`; `GAP-CTRL-003`; `GAP-CTRL-004`; `GAP-CTRL-006`; `GAP-CTRL-007`; `GAP-CTRL-008`                                                                                                                                                                                                                                                                             | —                                                                   | QA-REG-001 produce matriz de comandos, ambientes, fixtures, requisitos TREQ y evidencia reproducible por paquete.                     | Inmediatamente después de CODE-AUD-020 y antes de CAP-SCOPE-001                       |
| `BKL-XR-010`     | GitHub / repositorios                        | `P1` / `GOBIERNO`             | Decidir visibilidad y controles de repositorios                             | `H-CODE-001-001`; `H-CODE-017-023`                                                                                                                                                                   | Clasificar repositorios públicos y privados, secretos, datos y riesgos de exposición; documentar la decisión sin asumir que visibilidad pública equivale a vulnerabilidad.                            | `SUPA-AUD-015`; `GAP-CTRL-003`; `GAP-CTRL-004`; `GAP-CTRL-006`; `GAP-CTRL-007`                                                                                                                                                                                                                                                                                           | —                                                                   | Decisión de visibilidad, inventario de secretos y controles de publicación aprobados por repositorio.                                 | Antes de ampliar integraciones o publicar nuevos repositorios                         |
| `BKL-XR-011`     | Móvil y web                                  | `P1` / `ESTADO_LOCAL`         | Separar preferencia, borrador, caché, cola y efecto confirmado              | `H-CODE-004-014`; `H-CODE-012-015`; `H-CODE-018-016`                                                                                                                                                 | Definir taxonomía y almacenamiento permitido, caducidad, cifrado, invalidación, reanudación y relación con el estado del servidor.                                                                    | `SHELL-AUD-009`; `SHELL-CON-007`; `SHELL-CON-008`; `SHELL-CON-012`; `QUEUE-ARC-002`; `QUEUE-ARC-010`; `TSVC-CAT-008`                                                                                                                                                                                                                                                     | `TREQ-ANIMA-003`; `TREQ-INTEGRATION-003`                            | Cada dato local tiene clase, propietario, persistencia, TTL y regla de reconciliación; la interfaz no confunde cola con confirmación. | E4 y paquete de cada aplicación que use almacenamiento local                          |
| `BKL-XR-012`     | NEXO, VISO, ANIMA y PASS                     | `P0` / `FRONTERA_SERVIDOR`    | Normalizar lectura y mutación entre cliente, servidor, RPC y Edge Functions | `H-CODE-003-002`; `H-CODE-004-010`; `H-CODE-004-012`; `H-CODE-005-002`; `H-CODE-019-003`                                                                                                             | Clasificar cada escritura y consulta por frontera autorizada, minimizar clientes privilegiados y eliminar confianza exclusiva en UI o código móvil.                                                   | `AUTH-SRV-001`; `AUTH-SRV-002`; `AUTH-SRV-003`; `AUTH-SRV-004`; `AUTH-SRV-005`; `AUTH-SRV-006`; `AUTH-SRV-007`; `AUTH-SRV-010`; `AUTH-SRV-011`; `AUTH-SRV-012`; `AUTH-SRV-013`; `AUTH-SRV-017`; `SUPA-AUD-022`; `SUPA-AUD-023`                                                                                                                                           | `TREQ-AUTH-001`; `TREQ-AUTH-005`; `TREQ-AUTH-006`; `TREQ-AUTH-007`  | Matriz acción → frontera → permiso → alcance → datos → auditoría aprobada y pruebas negativas asociadas.                              | P0, antes de conservar o reescribir mutaciones                                        |
| `BKL-VISO-001`   | `vento-viso`                                 | `P0` / `AUTORIZACIÓN`         | Restringir administración de seguridad por territorio y capacidad           | `H-CODE-017-014`                                                                                                                                                                                     | Sustituir la concesión global derivada de `gerente` por permiso, sede, área y columnas autorizadas; auditar cambios.                                                                                  | `VISO-AUTH-005`; `VISO-AUTH-006`; `VISO-AUTH-007`; `VISO-AUTH-008`; `VISO-AUTH-009`; `VISO-AUTH-018`; `VISO-AUTH-019`; `VISO-UX-013`; `AUTH-SRV-005`; `AUTH-SRV-006`; `AUTH-SRV-012`; `AUTH-DB-002`                                                                                                                                                                      | `TREQ-AUTH-007`                                                     | Pruebas de gerente global, gerente de sede y actor sin permiso demuestran aislamiento territorial.                                    | P0 antes de ampliar administración de roles o perfiles                                |
| `BKL-VISO-002`   | `vento-viso` / `vento-shell`                 | `P0` / `SEGURIDAD`            | Encapsular cliente administrativo y tablas `viso.*`                         | `H-CODE-004-013`; `H-CODE-006-017`; `H-CODE-017-020`                                                                                                                                                 | Mantener `server-only`, identificar cada uso de `service_role`, validar autorización antes de invocarlo y reducir operaciones directas sobre tablas administrativas.                                  | `AUTH-SRV-001`; `AUTH-SRV-004`; `AUTH-SRV-005`; `AUTH-SRV-006`; `AUTH-SRV-017`; `SUPA-AUD-009`; `SUPA-AUD-022`; `SUPA-AUD-023`; `AUTH-DB-002`; `AUTH-DB-004`                                                                                                                                                                                                             | `TREQ-AUTH-001`; `TREQ-AUTH-007`                                    | Ningún cliente privilegiado es importable desde browser y cada acción administrativa tiene guard y auditoría.                         | P0 junto con endurecimiento de RLS                                                    |
| `BKL-VISO-003`   | `vento-viso` + `Vento-Group`                 | `P1` / `MEDIOS`               | Corregir contrato de `website-media`                                        | `H-CODE-006-010`                                                                                                                                                                                     | Alinear privacidad del bucket, URL entregada, caché, autorización y ciclo de vida con el uso público aprobado del CMS.                                                                                | `SUPA-AUD-012`; `SUPA-AUD-016`; `SUPA-AUD-017`; `EVID-ARC-003`; `EVID-ARC-007`; `SUPA-TRANS-001`; `SUPA-TRANS-007`                                                                                                                                                                                                                                                       | `TREQ-SUPABASE-004`                                                 | La ruta pública o firmada corresponde a la clasificación del medio y no expone otros objetos.                                         | Antes de migrar o ampliar el CMS                                                      |
| `BKL-VISO-004`   | `vento-viso`                                 | `P1` / `CALIDAD`              | Resolver errores de lint bloqueantes                                        | `H-CODE-016-003`                                                                                                                                                                                     | Descomponer los errores por módulo, corregirlos sin cambios semánticos ocultos y establecer el comando reproducible en CI.                                                                            | `QA-REG-001`; `GAP-CTRL-003`; `GAP-CTRL-004`; `GAP-CTRL-006`; `GAP-CTRL-007`                                                                                                                                                                                                                                                                                             | —                                                                   | Lint verde con baseline documentada y sin desactivar reglas para ocultar errores.                                                     | Antes del primer paquete E5 de VISO                                                   |
| `BKL-VISO-005`   | `vento-viso`                                 | `P1` / `PROPIEDAD_FUNCIONAL`  | Separar administración, catálogo, CMS y capacidades consumidoras            | `H-CODE-002-005`; `H-CODE-019-003`                                                                                                                                                                   | Usar VISO como superficie administrativa sin convertirlo en propietario de producto, marketing, inventario o procesos de otras aplicaciones.                                                          | `CAP-SCOPE-001`; `CAP-SCOPE-002`; `CAP-SCOPE-003`; `CAP-SCOPE-004`; `CAP-SCOPE-014`; `CAP-SCOPE-016`; `CAP-SCOPE-019`; `SHELL-CON-016`; `VISO-UX-017`; `VISO-UX-018`                                                                                                                                                                                                     | —                                                                   | Cada acción de VISO enlaza o administra mediante contrato de la aplicación propietaria y no duplica lógica empresarial.               | E2, al aprobar propiedad de dominios                                                  |
| `BKL-ANIMA-001`  | `vento-anima`                                | `P1` / `FUNCIONAL`            | Completar audiencia, lectura, edición y archivo de novedades                | `H-CODE-010-001`; `H-CODE-012-001`; `H-CODE-012-002`; `H-CODE-012-003`                                                                                                                               | Persistir audiencia, aplicarla al leer, recuperarla al editar, definir reenvío y reemplazar eliminación destructiva por archivo/historial cuando corresponda.                                         | `ANIMA-UX-017`; `AUTH-SRV-005`; `AUTH-SRV-006`; `AUTH-SRV-011`; `SUPA-AUD-022`; `SUPA-AUD-023`                                                                                                                                                                                                                                                                           | `TREQ-ANIMA-001`                                                    | Pruebas por audiencia, edición, archivo y lectura fuera de alcance; historial editorial auditable.                                    | Paquete ANIMA de novedades en E5                                                      |
| `BKL-ANIMA-002`  | `vento-anima`                                | `P1` / `DEGRADACIÓN`          | Alinear interfaz de fallback con capacidades reales                         | `H-CODE-010-002`; `H-CODE-012-004`                                                                                                                                                                   | Ocultar o deshabilitar mutaciones cuando el origen solo admite lectura y mostrar el modo degradado de forma explícita.                                                                                | `ANIMA-UX-017`; `TSVC-CAT-008`; `SHELL-CON-008`                                                                                                                                                                                                                                                                                                                          | `TREQ-ANIMA-002`                                                    | Modo fallback no ofrece acciones imposibles y recupera la capacidad al restablecer el contrato principal.                             | Junto con el paquete ANIMA que retire o formalice el fallback                         |
| `BKL-ANIMA-003`  | `vento-anima` / `vento-viso`                 | `P1` / `PROCESO`              | Diseñar corrección auditable de asistencia y novedades                      | `H-CODE-011-009`                                                                                                                                                                                     | Definir solicitud, aprobación, corrección, motivo, actor, antes/después y efecto sobre reportes sin editar historia silenciosamente.                                                                  | `PROC-CAT-002`; `PROC-CAT-013`; `PROC-CAT-014`; `PROC-CAT-018`; `CAP-SCOPE-002`; `ANIMA-UX-011`; `ANIMA-UX-012`                                                                                                                                                                                                                                                          | —                                                                   | Proceso TO-BE y eventos de corrección aprobados; cada ajuste conserva original, actor y evidencia.                                    | E2 antes de implementar correcciones                                                  |
| `BKL-ANIMA-004`  | `vento-anima` / `vento-shell`                | `P0` / `AUTORIZACIÓN`         | Eliminar confianza en rol y sede enviados al aceptar invitación             | `H-CODE-017-001`                                                                                                                                                                                     | Tomar rol, sede, vigencia e identidad solo de invitación persistida y pendiente; rechazar metadatos o payload autoadministrables.                                                                     | `ANIMA-AUTH-019`; `ANIMA-AUTH-020`; `AUTH-SRV-004`; `AUTH-SRV-005`; `AUTH-SRV-006`; `AUTH-DB-002`; `AUTH-DB-004`                                                                                                                                                                                                                                                         | `TREQ-AUTH-005`                                                     | Pruebas de manipulación de payload no cambian rol ni sede; replay y expiración quedan controlados.                                    | P0 antes de aceptar nuevas invitaciones productivas                                   |
| `BKL-ANIMA-005`  | `vento-anima` / `vento-shell`                | `P0` / `OFFLINE`              | Confirmar persistencia durable y contrato único de marcación                | `H-CODE-004-004`; `H-CODE-018-001`; `H-CODE-018-003`                                                                                                                                                 | No comunicar “encolado” si SecureStore falla; conservar `client_event_id`, sobrevivir reinicio y retirar fallback que evita semántica `applied/duplicate/conflict` sin paridad.                       | `ANIMA-AUTH-014`; `ANIMA-AUTH-015`; `ANIMA-UX-011`; `ANIMA-UX-012`; `AUTH-QA-026`; `SUPA-TRANS-006`                                                                                                                                                                                                                                                                      | `TREQ-ANIMA-003`; `TREQ-SUPABASE-001`                               | Escenarios de cierre, reinicio, respuesta perdida y replay convergen sin pérdida ni doble marcación.                                  | P0 en paquete de sincronización ANIMA                                                 |
| `BKL-ANIMA-006`  | `vento-anima` / `vento-shell`                | `P0` / `CONCURRENCIA`         | Hacer idempotentes las transiciones de descanso                             | `H-CODE-018-002`                                                                                                                                                                                     | Usar identificador persistido y RPC atómica para inicio/cierre; resolver duplicado, conflicto y eventos fuera de orden.                                                                               | `ANIMA-AUTH-014`; `ANIMA-AUTH-015`; `QUEUE-ARC-003`; `QUEUE-ARC-009`; `AUTH-QA-026`                                                                                                                                                                                                                                                                                      | `TREQ-ANIMA-004`                                                    | Dos dispositivos y replays no crean dos descansos ni cierran uno distinto.                                                            | P0 junto con asistencia offline                                                       |
| `BKL-ANIMA-007`  | `vento-anima`                                | `P1` / `ENTREGA`              | Formalizar build, tienda, segundo plano y validaciones móviles              | `H-CODE-001-003`; `H-CODE-003-006`; `H-CODE-016-006`                                                                                                                                                 | Vincular build productivo, ficha pública, permisos, tareas de segundo plano, notificaciones y comandos de validación reproducibles.                                                                   | `QA-REG-001`; `CAP-SCOPE-015`; `GAP-CTRL-006`; `GAP-CTRL-007`                                                                                                                                                                                                                                                                                                            | —                                                                   | Build y ficha están vinculados; escenarios de permisos, background y notificación tienen evidencia en dispositivo.                    | Antes de siguiente release móvil                                                      |
| `BKL-TAL-001`    | `vento-talento`                              | `P2` / `PRODUCTO_FUTURO`      | Mantener TALENTO no operativo hasta aprobar alcance y despliegue            | `H-CODE-001-004`; `H-CODE-002-006`; `H-CODE-003-008`; `H-CODE-004-008`; `H-CODE-011-008`; `H-CODE-019-004`                                                                                           | No activar pantallas, servicios, buckets ni esquema como producto actual; definir alcance, postulación, expediente, evaluación, oferta y período de prueba.                                           | `CAP-TAL-001`; `CAP-TAL-002`; `CAP-TAL-003`; `CAP-TAL-004`; `CAP-TAL-005`; `CAP-TAL-006`; `CAP-SCOPE-002`                                                                                                                                                                                                                                                                | —                                                                   | Producto y transición aprobados, ambiente y despliegue definidos, datos piloto autorizados y sin duplicar identidad laboral.          | E2; diferido hasta aprobar CAP-TAL-001 a CAP-TAL-006                                  |
| `BKL-TAL-002`    | `vento-talento`, `vento-viso`, `vento-anima` | `P1` / `TRASPASO`             | Definir handoff idempotente de candidato a trabajador                       | `H-CODE-019-002`; `H-CODE-019-004`                                                                                                                                                                   | Separar candidato, pre-registro y trabajador; transferir datos, consentimiento, documentos, rol provisional y cierre sin crear identidades duplicadas.                                                | `CAP-TAL-001`; `CAP-TAL-003`; `CAP-TAL-004`; `CAP-TAL-005`; `CAP-TAL-006`; `SHELL-CON-014`; `SHELL-CON-023`                                                                                                                                                                                                                                                              | —                                                                   | Contrato de traspaso, claves, estados y rollback aprobados antes de cualquier integración.                                            | E2/E4 antes de implementar TALENTO                                                    |
| `BKL-NEXO-001`   | `vento-nexo`                                 | `P0` / `CALIDAD`              | Restablecer typecheck, build y lint reproducibles                           | `H-CODE-016-002`; `H-CODE-016-003`                                                                                                                                                                   | Resolver incompatibilidad de `Worksheet.dataValidations`, separar errores de lint y no silenciar el problema mediante casts globales o desactivación de reglas.                                       | `QA-REG-001`; `GAP-CTRL-003`; `GAP-CTRL-004`; `GAP-CTRL-006`; `GAP-CTRL-007`                                                                                                                                                                                                                                                                                             | —                                                                   | Instalación limpia, typecheck, build y lint verdes con comandos documentados.                                                         | P0 antes de cualquier paquete E5 de NEXO                                              |
| `BKL-NEXO-002`   | `vento-nexo`                                 | `P0` / `GOBIERNO_CI`          | Retirar workflow, script y log de parche temporal                           | `H-CODE-008-008`; `H-CODE-008-009`; `H-CODE-009-010`                                                                                                                                                 | Eliminar capacidad de mutar `preview` automáticamente, conservar historia necesaria y verificar que el código canónico ya contiene la solución aprobada.                                              | `SHELL-AUD-011`; `QA-REG-001`; `SHELL-PKG-007`; `SHELL-PKG-008`                                                                                                                                                                                                                                                                                                          | `TREQ-NEXO-001`                                                     | No queda workflow activable con `contents: write`; rama y código canónico pasan build y regresión.                                    | P0 de saneamiento antes de nuevos cambios NEXO                                        |
| `BKL-NEXO-003`   | `vento-nexo`                                 | `P1` / `CATÁLOGO`             | Eliminar truncamiento de productos en ajustes                               | `H-CODE-009-008`; `H-CODE-010-007`; `H-CODE-012-006`                                                                                                                                                 | Implementar búsqueda/paginación completa y demostrar que todo producto elegible puede localizarse independientemente de stock actual.                                                                 | `NEXO-UX-019`; `NEXO-UX-021`; `NEXO-UX-022`; `NEXO-UX-023`                                                                                                                                                                                                                                                                                                               | `TREQ-NEXO-002`                                                     | Prueba con más de 500 productos y producto sin stock confirma selección sin omisiones.                                                | Paquete NEXO de ajustes                                                               |
| `BKL-NEXO-004`   | `vento-nexo` / `vento-shell`                 | `P1` / `LPN`                  | Construir ciclo alcanzable y auditable de LPN                               | `H-CODE-011-002`; `H-CODE-011-003`; `H-CODE-011-004`; `H-CODE-011-005`; `H-CODE-015-001`; `H-CODE-015-002`; `H-CODE-015-003`; `H-CODE-015-004`; `H-CODE-015-005`                                     | Conectar creación, contenido, ubicación, custodia, movimiento, cierre, anulación y reetiquetado; clasificar endpoint y objetos sin consumidor.                                                        | `NEXO-DOM-002`; `NEXO-DOM-003`; `NEXO-DOM-004`; `NEXO-DOM-005`; `NEXO-DOM-006`; `NEXO-DOM-007`; `NEXO-DOM-008`; `NEXO-DOM-019`; `NEXO-DOM-020`; `NEXO-DOM-021`; `NEXO-DOM-022`; `NEXO-DOM-023`; `NEXO-DOM-024`; `NEXO-UX-026`; `NEXO-UX-027`; `NEXO-UX-036`; `NEXO-UX-037`; `NEXO-UX-038`; `NEXO-UX-039`; `NEXO-UX-040`; `SHELL-AUD-011`; `SUPA-AUD-022`; `SUPA-AUD-023` | `TREQ-NEXO-004`; `TREQ-SUPABASE-003`                                | Flujo E2E en tablet y base, sin doble contabilización; todo objeto LPN tiene consumidor y propietario.                                | E2 diseño; E3 datos; E5 implementación NEXO                                           |
| `BKL-NEXO-005`   | `vento-nexo` / `vento-shell`                 | `P0` / `CONTRATO_DATOS`       | Resolver relaciones ausentes y fallbacks legacy de remisiones               | `H-CODE-006-003`; `H-CODE-006-004`; `H-CODE-013-005`; `H-CODE-013-010`                                                                                                                               | Determinar contrato canónico de `locations_validation` y resumen operativo, distinguir error de esquema de permisos/red y retirar inferencias por nombre o consulta legacy con transición controlada. | `SUPA-AUD-016`; `SUPA-AUD-017`; `SUPA-AUD-018`; `SUPA-AUD-019`; `SUPA-AUD-022`; `SUPA-AUD-023`; `SUPA-TRANS-001`; `SUPA-TRANS-005`; `SUPA-TRANS-006`; `SUPA-TRANS-007`; `SUPA-TRANS-012`; `SUPA-TRANS-013`; `SUPA-TRANS-015`                                                                                                                                             | `TREQ-NEXO-007`; `TREQ-SUPABASE-001`                                | Paridad entre contrato nuevo y fallback demostrada; ausencia de objeto no se oculta como éxito parcial.                               | P0 antes de retirar compatibilidad o ampliar remisiones                               |
| `BKL-NEXO-006`   | `vento-nexo`, `vento-fogo`, `vento-origo`    | `P0` / `PRODUCTO`             | Unificar perfil, unidades, SKU y precedencias de producto                   | `H-CODE-013-008`; `H-CODE-013-009`; `H-CODE-014-007`; `H-CODE-014-008`                                                                                                                               | Definir fuente canónica y backfill para stock, entrada, conversión, modalidad y tolerancias; no inventar defaults silenciosos.                                                                        | `CAP-SCOPE-004`; `CAP-SCOPE-006`; `DATA-NORM-AUD-004`; `SUPA-AUD-019`; `SUPA-TRANS-005`; `SUPA-TRANS-007`; `SUPA-TRANS-012`; `SHELL-AUD-009`; `SHELL-CON-001`; `SHELL-CON-012`                                                                                                                                                                                           | `TREQ-NEXO-008`; `TREQ-NEXO-010`                                    | Mismos casos producen misma unidad y conversión en todos los consumidores; excepciones quedan identificadas y migrables.              | E2/E3 antes de modificar inventario o producción                                      |
| `BKL-NEXO-007`   | `vento-nexo` / `vento-shell`                 | `P0` / `ATOMICIDAD`           | Convertir ajuste de inventario en operación atómica e idempotente           | `H-CODE-014-009`; `H-CODE-018-008`                                                                                                                                                                   | Unificar movimiento, stock por sede/LOC/posición, costo y evento derivado mediante RPC transaccional o mecanismo reconciliable con clave estable.                                                     | `SUPA-AUD-019`; `SUPA-AUD-022`; `SUPA-AUD-023`; `SUPA-ARC-016`; `SUPA-ARC-017`; `SUPA-TRANS-008`; `SHELL-CON-023`                                                                                                                                                                                                                                                        | `TREQ-SUPABASE-002`                                                 | Fallos inyectados y solicitudes concurrentes no dejan proyecciones divergentes ni duplican movimientos.                               | P0 en paquete E3/E5 de ajustes                                                        |
| `BKL-NEXO-008`   | `vento-nexo` / `vento-shell`                 | `P0` / `REMISIONES`           | Cerrar autorización y exactamente-una-vez en remisiones                     | `H-CODE-012-009`; `H-CODE-012-010`; `H-CODE-013-006`; `H-CODE-014-006`; `H-CODE-018-011`                                                                                                             | Resolver capacidad por permisos/contexto, declarar modo record-only o inventory, publicar efectos idempotentes y conciliar estados y LOC.                                                             | `PROC-ACTOR-002`; `PROC-ACTOR-010`; `NEXO-AUTH-029`; `NEXO-UX-009`; `NEXO-UX-010`; `NEXO-UX-011`; `NEXO-UX-012`; `NEXO-UX-013`; `NEXO-UX-022`; `NEXO-UX-023`; `NEXO-UX-025`; `SUPA-AUD-019`; `SHELL-CON-023`                                                                                                                                                             | `TREQ-NEXO-006`; `TREQ-NEXO-009`                                    | Piloto y replay demuestran un solo efecto, alcance correcto y reconciliación completa.                                                | P0 antes de activar inventario del piloto                                             |
| `BKL-NEXO-009`   | `vento-nexo`                                 | `P1` / `IMPRESIÓN`            | Crear trabajo durable de impresión y validar salida física                  | `H-CODE-007-005`; `H-CODE-007-006`; `H-CODE-010-003`; `H-CODE-011-011`; `H-CODE-012-007`; `H-CODE-012-008`; `H-CODE-018-010`                                                                         | Separar preview de aprobación física; conservar trabajo, dispositivo, ZPL, resultado, error, reintento y motivo de reimpresión hasta ack definitivo.                                                  | `NEXO-UX-037`; `NEXO-UX-038`; `NEXO-AUTH-028`; `QUEUE-ARC-002`; `QUEUE-ARC-003`; `QUEUE-ARC-006`; `QUEUE-ARC-008`; `QUEUE-ARC-009`; `QUEUE-ARC-010`                                                                                                                                                                                                                      | `TREQ-NEXO-003`; `TREQ-NEXO-005`                                    | Pruebas BrowserPrint y físicas por DPI/tamaño/código; pérdida de conexión no pierde ni duplica trabajo.                               | Paquete NEXO de impresión y hardware                                                  |
| `BKL-NEXO-010`   | `vento-nexo`                                 | `P1` / `ACTIVOS`              | Validar adopción de conteo, mantenimiento, garantías y baja                 | `H-CODE-019-007`                                                                                                                                                                                     | No declarar operativas las estructuras de activos; definir ciclo, responsables, evidencia, repuestos, vehículo y transición desde controles externos.                                                 | `CAP-SCOPE-007`; `PROC-CAT-002`; `GAP-CTRL-005`; `GAP-CTRL-006`; `GAP-CTRL-007`                                                                                                                                                                                                                                                                                          | —                                                                   | Clasificación empresarial y proceso TO-BE aprobados; piloto demuestra uso y trazabilidad antes del rollout.                           | E2 y paquete NEXO de activos                                                          |
| `BKL-NEXO-011`   | `vento-nexo` / operación                     | `P1` / `INSTALACIONES`        | Definir solución para mantenimiento de instalaciones                        | `H-CODE-019-008`                                                                                                                                                                                     | Evaluar BUILD, BUY, integración o control manual para limpieza, plagas, servicios, calibración, llaves, obras y cierre de novedades.                                                                  | `CAP-SCOPE-013`; `PROC-CAT-002`; `GAP-CTRL-005`; `GAP-CTRL-006`; `GAP-CTRL-007`                                                                                                                                                                                                                                                                                          | —                                                                   | Decisión aprobada por subcapacidad y método actual conservado hasta cutover.                                                          | E1/E2 antes de asignar implementación                                                 |
| `BKL-FOGO-001`   | `vento-fogo` / `vento-nexo`                  | `P0` / `PRODUCCIÓN`           | Completar y adoptar el ciclo productivo                                     | `H-CODE-012-013`; `H-CODE-012-014`; `H-CODE-019-007`                                                                                                                                                 | Diseñar inicio, parciales, consumos, desperdicio, resultado, finalización, cancelación y corrección; conectar inventario y costo sin borrar historia.                                                 | `CAP-SCOPE-008`; `FOGO-AUTH-009`; `FOGO-AUTH-010`; `FOGO-AUTH-011`; `FOGO-AUTH-012`; `FOGO-AUTH-013`; `FOGO-AUTH-014`; `FOGO-UX-005`; `FOGO-UX-006`; `FOGO-UX-007`; `FOGO-UX-010`; `FOGO-UX-011`; `FOGO-UX-012`; `FOGO-UX-013`                                                                                                                                           | `TREQ-FOGO-001`                                                     | Piloto con lote real autorizado demuestra estados, actor, consumo, terminado, corrección e inventario coherentes.                     | P0 de diseño y piloto antes de activar producción                                     |
| `BKL-FOGO-002`   | `vento-fogo`                                 | `P2` / `CALIDAD`              | Resolver warnings de lint antes de endurecer CI                             | `H-CODE-016-004`                                                                                                                                                                                     | Clasificar los ocho warnings, corregir los que representen riesgo y documentar baseline temporal sin convertir warnings en deuda permanente.                                                          | `QA-REG-001`; `GAP-CTRL-003`; `GAP-CTRL-004`; `GAP-CTRL-006`; `GAP-CTRL-007`                                                                                                                                                                                                                                                                                             | —                                                                   | Lint sin warnings no aceptados o con excepciones temporales, justificadas y fechadas.                                                 | Antes de activar lint estricto en CI                                                  |
| `BKL-ORIGO-001`  | `vento-origo` / `vento-shell`                | `P0` / `RECEPCIÓN`            | Hacer atómica e idempotente la recepción y corrección                       | `H-CODE-003-004`; `H-CODE-012-012`; `H-CODE-018-009`; `H-CODE-019-007`                                                                                                                               | Unificar cabecera, líneas, movimientos, stock, costos, cantidades de orden, estado, solicitudes maestras y corrección bajo una operación durable y reconciliable.                                     | `CAP-SCOPE-005`; `ORIGO-UX-009`; `ORIGO-UX-010`; `ORIGO-UX-014`; `ORIGO-UX-016`; `SUPA-AUD-019`; `SUPA-AUD-022`; `SUPA-AUD-023`; `SUPA-TRANS-008`; `SHELL-CON-023`                                                                                                                                                                                                       | `TREQ-ORIGO-001`; `TREQ-ORIGO-003`; `TREQ-SUPABASE-002`             | Fallos inyectados y replay no duplican recepción, inventario, costo ni orden recibida; corrección garantiza reemplazo.                | P0 antes del piloto con efecto de inventario                                          |
| `BKL-ORIGO-002`  | `vento-origo` / `vento-shell`                | `P0` / `AUTORIZACIÓN`         | Restringir órdenes de compra y endurecer PDF público                        | `H-CODE-017-011`; `H-CODE-017-012`                                                                                                                                                                   | Aplicar permiso, sede/centro de costo, estado y columnas; eliminar secreto fallback y usar token scoped, corto y revocable.                                                                           | `ORIGO-AUTH-004`; `ORIGO-AUTH-005`; `ORIGO-AUTH-006`; `ORIGO-AUTH-007`; `ORIGO-AUTH-008`; `ORIGO-AUTH-009`; `ORIGO-AUTH-010`; `AUTH-SRV-005`; `AUTH-SRV-006`; `AUTH-SRV-011`; `AUTH-SRV-012`; `AUTH-DB-002`; `AUTH-DB-004`; `SUPA-AUD-015`                                                                                                                               | `TREQ-ORIGO-002`                                                    | Pruebas por rol/sede/estado y token expirado/revocado; enlace sin secreto configurado falla cerrado.                                  | P0 antes de compartir documentos de compra                                            |
| `BKL-ORIGO-003`  | `vento-origo`                                | `P1` / `CALIDAD`              | Resolver errores de lint bloqueantes                                        | `H-CODE-016-003`                                                                                                                                                                                     | Corregir los errores de lint con instalación limpia y crear puerta CI reproducible.                                                                                                                   | `QA-REG-001`; `GAP-CTRL-003`; `GAP-CTRL-004`; `GAP-CTRL-006`; `GAP-CTRL-007`                                                                                                                                                                                                                                                                                             | —                                                                   | Lint verde y sin supresiones globales no justificadas.                                                                                | Antes del primer paquete E5 de ORIGO                                                  |
| `BKL-PULSO-001`  | `vento-pulso` / `vento-shell`                | `P0` / `POS`                  | Construir ciclo E2E de venta, caja y pago                                   | `H-CODE-003-005`; `H-CODE-011-006`; `H-CODE-011-010`; `H-CODE-015-010`; `H-CODE-015-011`; `H-CODE-015-012`; `H-CODE-015-013`; `H-CODE-015-014`; `H-CODE-015-016`; `H-CODE-015-017`; `H-CODE-019-007` | Separar prototipo, mocks y contratos reales; completar apertura, venta, líneas, modificadores, cobro, pago, inventario, lealtad, reversión y cierre.                                                  | `CAP-SCOPE-009`; `PULSO-UX-001`; `PULSO-UX-007`; `PULSO-UX-008`; `PULSO-UX-009`; `PULSO-UX-010`; `PULSO-UX-016`; `PULSO-UX-017`; `PULSO-UX-018`; `PULSO-UX-020`; `PULSO-UX-021`; `PULSO-AUTH-006`; `PULSO-AUTH-007`; `PULSO-AUTH-008`; `PULSO-AUTH-009`; `PULSO-AUTH-010`; `SUPA-AUD-022`; `SUPA-AUD-023`                                                                | `TREQ-PULSO-001`; `TREQ-PULSO-003`                                  | Escenario E2E en terminal controlada cuadra caja, inventario, pago, lealtad, anulación y auditoría.                                   | P0 de diseño y arquitectura antes de activar POS interno                              |
| `BKL-PULSO-002`  | `vento-pulso`                                | `P1` / `LEGACY`               | Migrar tablero legacy y normalizar estados                                  | `H-CODE-013-001`; `H-CODE-013-002`; `H-CODE-013-003`                                                                                                                                                 | Demostrar paridad del tablero, retirar import runtime legacy y resolver `in_transit`/`on_the_way` mediante contrato canónico y migración.                                                             | `PULSO-AUTH-002`; `PULSO-UX-001`; `PULSO-UX-007`; `PULSO-UX-013`; `PULSO-UX-019`; `SHELL-AUD-001`; `SHELL-PKG-004`; `SHELL-PKG-005`; `SHELL-CON-010`; `SUPA-TRANS-001`; `SUPA-TRANS-006`; `SUPA-TRANS-007`; `SUPA-TRANS-012`; `SUPA-TRANS-013`                                                                                                                           | `TREQ-PULSO-002`; `TREQ-SUPABASE-001`                               | Pruebas de paridad aprobadas y cero imports runtime al módulo legacy después del cutover.                                             | Antes de retirar `orders-board-legacy`                                                |
| `BKL-PULSO-003`  | `vento-pulso` / `vento-shell`                | `P0` / `AUTORIZACIÓN`         | Proteger mutaciones de pedidos y líneas                                     | `H-CODE-017-013`                                                                                                                                                                                     | Reemplazar update amplio por acciones nombradas con permiso, sede, estado inicial, transición y columnas permitidas.                                                                                  | `PULSO-AUTH-006`; `PULSO-AUTH-007`; `PULSO-AUTH-008`; `PULSO-AUTH-009`; `PULSO-AUTH-010`; `PULSO-AUTH-011`; `AUTH-SRV-005`; `AUTH-SRV-006`; `AUTH-SRV-011`; `AUTH-SRV-012`; `AUTH-DB-002`; `AUTH-DB-004`                                                                                                                                                                 | `TREQ-PULSO-004`                                                    | Pruebas negativas impiden cambiar pago, precio, inventario, lealtad o estado fuera de transición autorizada.                          | P0 antes de usar PULSO con pedidos reales                                             |
| `BKL-PULSO-004`  | `vento-pulso`                                | `P3` / `RETIRO`               | Clasificar scripts manuales sin comando actual                              | `H-CODE-015-009`                                                                                                                                                                                     | Confirmar uso histórico/externo, documentar reemplazo y retirar o integrar scripts sin convertirlos en fuente productiva accidental.                                                                  | `SHELL-AUD-011`; `PULSO-UX-019`                                                                                                                                                                                                                                                                                                                                          | `TREQ-SHELL-004`                                                    | Cada script queda vinculado a comando/documentación o retirado con evidencia.                                                         | Después de decidir arquitectura POS                                                   |
| `BKL-PULSO-005`  | `vento-pulso` / Supabase                     | `P1` / `REALTIME`             | Corregir suscripciones sobre vistas y publicación                           | `H-CODE-006-011`; `H-CODE-006-012`                                                                                                                                                                   | Determinar tablas/eventos reales, evitar Postgres Changes sobre vistas no servidas y definir fallback/polling con estado visible.                                                                     | `SUPA-AUD-013`; `SUPA-AUD-016`; `SUPA-AUD-017`; `SUPA-ARC-019`; `SUPA-TRANS-001`; `SUPA-TRANS-007`; `SUPA-TRANS-013`                                                                                                                                                                                                                                                     | —                                                                   | Suscripciones reciben eventos reproducibles o usan contrato alterno probado sin silencio.                                             | Antes de depender de actualización en tiempo real                                     |
| `BKL-PULSO-006`  | `vento-pulso`                                | `P1` / `CALIDAD`              | Resolver errores de lint bloqueantes                                        | `H-CODE-016-003`                                                                                                                                                                                     | Corregir los errores por módulo y establecer puerta CI reproducible.                                                                                                                                  | `QA-REG-001`; `GAP-CTRL-003`; `GAP-CTRL-004`; `GAP-CTRL-006`; `GAP-CTRL-007`                                                                                                                                                                                                                                                                                             | —                                                                   | Lint verde sin desactivar reglas para ocultar deuda.                                                                                  | Antes del primer paquete E5 de PULSO                                                  |
| `BKL-NUMERA-001` | `vento-numera`                               | `P1` / `ALCANCE_FUNCIONAL`    | Separar costos/reportes de contabilidad y tesorería completas               | `H-CODE-019-007`                                                                                                                                                                                     | Clasificar gastos, presupuestos, bancos, cartera, obligaciones, impuestos, cierres y rentabilidad; no presentar tablas vacías como proceso operativo.                                                 | `CAP-SCOPE-012`; `CAP-SCOPE-017`; `PROC-CAT-002`; `GAP-CTRL-005`; `GAP-CTRL-006`; `GAP-CTRL-007`                                                                                                                                                                                                                                                                         | —                                                                   | Clasificación BUILD/BUY/INTEGRATE/MANUAL y propietario aprobados por subcapacidad.                                                    | E1/E2 antes de ampliar NUMERA                                                         |
| `BKL-NUMERA-002` | `vento-numera`                               | `P1` / `DEPENDENCIAS`         | Reproducir instalación y resolver vulnerabilidades/scripts pendientes       | `H-CODE-016-005`                                                                                                                                                                                     | Documentar versión de runtime, lockfile y aprobación de scripts; evaluar vulnerabilidades sin ejecutar `npm audit fix` indiscriminado.                                                                | `QA-REG-001`; `GAP-CTRL-003`; `GAP-CTRL-004`; `GAP-CTRL-006`; `GAP-CTRL-007`                                                                                                                                                                                                                                                                                             | —                                                                   | Instalación limpia reproducible, scripts revisados y vulnerabilidades con decisión explícita.                                         | Antes del primer release posterior al corte                                           |
| `BKL-PASS-001`   | `vento-pass`                                 | `P2` / `RETIRO_UX`            | Resolver stubs y pantallas desconectadas                                    | `H-CODE-008-004`; `H-CODE-008-005`; `H-CODE-010-005`; `H-CODE-015-006`; `H-CODE-015-007`                                                                                                             | Confirmar consumidor, implementar flujo real o retirar acciones/pantallas; evitar cadenas transitivamente huérfanas.                                                                                  | `PASS-UX-001`; `PASS-UX-002`; `PASS-UX-006`; `PASS-UX-013`; `SHELL-AUD-011`                                                                                                                                                                                                                                                                                              | `TREQ-PASS-001`; `TREQ-PASS-002`; `TREQ-PASS-007`                   | Navegación activa no expone “Próximamente” como capacidad y no conserva pantallas paralelas sin decisión.                             | Paquete de convergencia UX PASS                                                       |
| `BKL-PASS-002`   | `vento-pass`                                 | `P1` / `HISTORIAL`            | Corregir atribución de transacciones Saudo                                  | `H-CODE-008-007`; `H-CODE-009-009`; `H-CODE-010-006`; `H-CODE-012-005`                                                                                                                               | Resolver sede determinísticamente o mostrar sin atribución; backfill y retiro del filtro temporal sin omitir transacciones legítimas.                                                                 | `PASS-UX-006`; `PASS-QA-001`; `PASS-QA-002`; `SUPA-AUD-019`; `SUPA-TRANS-005`; `SUPA-TRANS-007`                                                                                                                                                                                                                                                                          | `TREQ-PASS-003`                                                     | Historial incluye todos los casos y distingue atribución, no atribución y datos legacy.                                               | Antes de retirar filtro temporal                                                      |
| `BKL-PASS-003`   | `vento-pass`, `vento-viso`, `vento-shell`    | `P1` / `CONTRATOS`            | Centralizar sedes, identidad comercial, dominios y enlaces                  | `H-CODE-009-003`; `H-CODE-009-004`; `H-CODE-009-005`; `H-CODE-009-006`; `H-CODE-014-011`; `H-CODE-014-012`                                                                                           | Definir fuente canónica de site, marca, dirección, coordenadas, URLs y esquemas; retirar heurísticas y literales con compatibilidad controlada.                                                       | `PASS-UX-001`; `PASS-UX-006`; `SHELL-CON-002`; `SHELL-CON-014`; `SHELL-CON-016`; `SUPA-AUD-019`; `SUPA-AUD-022`; `SUPA-AUD-023`; `SUPA-TRANS-005`; `SUPA-TRANS-007`                                                                                                                                                                                                      | `TREQ-PASS-004`; `TREQ-INTEGRATION-001`; `TREQ-PASS-006`            | Todas las rutas resuelven la misma sede y datos comerciales; links por ambiente pasan E2E.                                            | E3/E4 antes de consolidar experiencias                                                |
| `BKL-PASS-004`   | `vento-pass`                                 | `P1` / `CONVERGENCIA_UX`      | Consolidar experiencias y rutas equivalentes                                | `H-CODE-002-002`; `H-CODE-002-003`; `H-CODE-003-010`; `H-CODE-014-010`                                                                                                                               | Elegir rutas canónicas para experiencias, legales, retorno y seguimiento; conservar compatibilidad solo con consumidor y puerta de retiro.                                                            | `PASS-UX-001`; `PASS-UX-002`; `PASS-UX-003`; `PASS-UX-006`; `PASS-UX-013`; `SHELL-AUD-011`                                                                                                                                                                                                                                                                               | `TREQ-PASS-006`; `TREQ-PASS-007`                                    | Una sola experiencia canónica por flujo y rutas reemplazadas con redirects/deep links probados.                                       | Antes de siguiente reorganización de navegación                                       |
| `BKL-PASS-005`   | `vento-pass` / `vento-pulso` / `vento-shell` | `P0` / `FIDELIZACIÓN`         | Mover ledger y redención a contratos autorizados y atómicos                 | `H-CODE-017-004`; `H-CODE-017-005`; `H-CODE-017-006`; `H-CODE-018-005`                                                                                                                               | Impedir inserción cliente, validar permiso/sede/estado y ejecutar redención y saldo mediante operación server atómica e idempotente.                                                                  | `PULSO-AUTH-009`; `PULSO-AUTH-010`; `PASS-INT-001`; `PASS-INT-002`; `PASS-QA-002`; `AUTH-DB-002`; `AUTH-DB-004`; `SHELL-CON-023`                                                                                                                                                                                                                                         | `TREQ-PASS-008`                                                     | Pruebas concurrentes y de autorización no permiten crear puntos, doble gasto ni redención fuera de sede.                              | P0 antes de ampliar fidelización o canjes                                             |
| `BKL-PASS-006`   | `vento-pass` / `vento-shell`                 | `P0` / `PAGOS`                | Serializar intentos y aplicar webhooks exactamente una vez                  | `H-CODE-018-006`; `H-CODE-018-007`                                                                                                                                                                   | Reclamar idempotency key/evento de forma atómica, conservar resultado, impedir regresión de estados y conciliar eventos tardíos o ambiguos.                                                           | `INT-EXT-010`; `INT-EXT-012`; `INT-EXT-015`; `SUPA-ARC-020`; `SUPA-AUD-014`; `PASS-QA-002`; `SHELL-CON-023`                                                                                                                                                                                                                                                              | `TREQ-PASS-009`; `TREQ-INTEGRATION-003`                             | Carreras, replay y orden invertido convergen en una transacción y estado terminal válidos.                                            | P0 en paquete de pagos y webhooks                                                     |
| `BKL-PASS-007`   | `vento-pass`, `vento-pulso`, `vento-shell`   | `P0` / `PRIVACIDAD`           | Proteger columnas de usuario y limitar lectura de PII                       | `H-CODE-017-002`; `H-CODE-017-003`                                                                                                                                                                   | Separar campos autoadministrables y protegidos; ofrecer proyecciones mínimas por proceso, permiso y sede.                                                                                             | `PASS-INT-004`; `PASS-INT-005`; `PULSO-AUTH-006`; `PULSO-AUTH-009`; `PULSO-AUTH-010`; `AUTH-SRV-004`; `AUTH-SRV-005`; `AUTH-DB-002`; `AUTH-DB-004`                                                                                                                                                                                                                       | `TREQ-AUTH-006`                                                     | Cliente no modifica saldo/rol/estado y personal no consulta PII fuera del proceso autorizado.                                         | P0 antes de ampliar acceso a clientes                                                 |
| `BKL-PASS-008`   | `vento-pass` / móvil                         | `P1` / `ARQUITECTURA_MÓVIL`   | Reducir consultas directas, cachés y dependencias dispersas                 | `H-CODE-003-007`; `H-CODE-004-005`; `H-CODE-004-010`; `H-CODE-016-006`                                                                                                                               | Clasificar acceso directo permitido, centralizar adaptadores, separar caché de estado servidor y definir comandos de validación móvil.                                                                | `SHELL-AUD-008`; `SHELL-AUD-009`; `SHELL-AUD-010`; `TSVC-CAT-004`; `TSVC-CAT-008`; `QA-REG-001`                                                                                                                                                                                                                                                                          | —                                                                   | Acceso y caché tienen contrato/TTL/error; build móvil y regresiones se ejecutan reproduciblemente.                                    | Antes de ampliar pagos, Wallet o mapas                                                |
| `BKL-WEB-001`    | `Vento-Group` / `vento-viso`                 | `P1` / `FORMULARIO`           | Implementar o retirar newsletter pública                                    | `H-CODE-003-001`; `H-CODE-010-004`                                                                                                                                                                   | Registrar consentimiento y resultado real mediante contrato aprobado o retirar completamente la promesa y controles.                                                                                  | `WEB-FRM-011`                                                                                                                                                                                                                                                                                                                                                            | `TREQ-INTEGRATION-002`                                              | E2E demuestra alta/baja/duplicado/error o la interfaz ya no existe.                                                                   | Paquete web correspondiente                                                           |
| `BKL-WEB-002`    | `Vento-Group` y `vento-numera`               | `P1` / `CALIDAD_DEPENDENCIAS` | Corregir lint web y revisar instalación/vulnerabilidades                    | `H-CODE-016-001`; `H-CODE-016-005`                                                                                                                                                                   | Reemplazar comando inválido de Next 16, validar scripts de dependencias y decidir vulnerabilidades sin actualización automática destructiva.                                                          | `QA-REG-001`; `GAP-CTRL-003`; `GAP-CTRL-004`; `GAP-CTRL-006`; `GAP-CTRL-007`                                                                                                                                                                                                                                                                                             | —                                                                   | Instalación limpia, lint real y decisiones de scripts/vulnerabilidades reproducibles.                                                 | Antes del siguiente despliegue web o NUMERA                                           |
| `BKL-WEB-003`    | `Vento-Group` / `vento-viso`                 | `P1` / `CMS`                  | Alinear consumo público con contrato de medios                              | `H-CODE-006-010`                                                                                                                                                                                     | Resolver cómo el CMS publica medios privados, evitar URLs permanentes no autorizadas y mantener compatibilidad con bloques existentes.                                                                | `SUPA-AUD-012`; `SUPA-AUD-016`; `SUPA-AUD-017`; `SUPA-TRANS-001`; `SUPA-TRANS-007`; `EVID-ARC-003`; `EVID-ARC-007`                                                                                                                                                                                                                                                       | `TREQ-SUPABASE-004`                                                 | Carga, publicación, reemplazo y eliminación usan el mismo contrato y no exponen objetos ajenos.                                       | Antes de migrar media o endurecer el bucket                                           |
| `BKL-AURA-001`   | AURA / `vento-shell` / `vento-viso`          | `P2` / `DECISIÓN`             | Decidir continuidad, reemplazo o retiro de AURA                             | `H-CODE-001-008`; `H-CODE-002-010`; `H-CODE-011-001`; `H-CODE-019-005`                                                                                                                               | No considerar aplicación ni permiso como capacidad implementada; decidir producto, propietario, alcance y relación con CMS/marketing.                                                                 | `AURA-AUD-010`; `INT-MKT-001`; `CAP-SCOPE-014`; `CAP-SCOPE-019`                                                                                                                                                                                                                                                                                                          | `TREQ-SHELL-001`                                                    | Decisión aprobada: construir con roadmap, reemplazar reserva o retirar catálogo/permiso sin navegación engañosa.                      | E1/E2 antes de diseñar campañas AURA                                                  |
| `BKL-EXT-001`    | Operación manual y terceros                  | `P1` / `CUTOVER`              | Conservar coexistencia y reconciliación de métodos AS-IS                    | `H-CODE-019-006`; `H-CODE-019-007`; `H-CODE-019-008`                                                                                                                                                 | Para papel, Excel, WhatsApp, Makos, Rappi, bancos y proveedores, definir fuente temporal, captura paralela, conciliación, criterio de corte y rollback.                                               | `CAP-SCOPE-005`; `CAP-SCOPE-007`; `CAP-SCOPE-008`; `CAP-SCOPE-009`; `CAP-SCOPE-011`; `CAP-SCOPE-012`; `CAP-SCOPE-013`; `CAP-SCOPE-018`; `PROC-CAT-001`; `PROC-CAT-002`; `GAP-CTRL-005`; `GAP-CTRL-006`; `GAP-CTRL-007`                                                                                                                                                   | —                                                                   | Cada método externo tiene propietario, dato maestro, conciliación, fecha/puerta de retiro y contingencia.                             | E2 y paquete de transición de cada dominio                                            |
| `BKL-EXT-002`    | `delivery-portal` / `vento-shell`            | `P0` / `DRIFT`                | Versionar y gobernar portal de entrega remoto                               | `H-CODE-005-009`; `H-CODE-017-019`                                                                                                                                                                   | Conservar token fuerte, recuperar fuente/configuración, registrar despliegue y vincularlo con capacidades de entrega y auditoría.                                                                     | `SUPA-AUD-014`; `SUPA-AUD-016`; `SUPA-AUD-017`; `SUPA-AUD-022`; `SUPA-AUD-023`; `SUPA-TRANS-003`; `SUPA-TRANS-007`; `SUPA-TRANS-013`; `SUPA-TRANS-015`                                                                                                                                                                                                                   | `TREQ-SUPABASE-003`                                                 | Fuente reproducible y prueba de token/expiración; no existe función remota sin propietario ni rollback.                               | P0 antes de modificar portal o sesiones de entrega                                    |
| `BKL-EXT-003`    | POS externo / PULSO / NEXO / NUMERA / PASS   | `P0` / `INTEGRACIÓN`          | Formalizar convivencia y transición del POS externo                         | `H-CODE-019-006`; `H-CODE-019-007`; `H-CODE-019-009`                                                                                                                                                 | Auditar API, importar hechos con payload/hash, mapear entidades, usar cuarentena e idempotencia y producir efectos internos exactamente una vez.                                                      | `INT-POS-001`; `INT-POS-002`; `INT-POS-003`; `INT-POS-004`; `INT-POS-005`; `INT-POS-006`; `INT-POS-007`; `INT-POS-008`; `INT-POS-009`; `INT-POS-010`; `INT-POS-011`; `INT-POS-012`; `INT-POS-013`; `INT-POS-014`; `INT-POS-015`; `INT-POS-016`; `INT-POS-017`; `INT-POS-018`; `INT-POS-019`; `INT-POS-020`; `INT-POS-021`; `INT-POS-022`; `INT-POS-023`; `INT-POS-024`   | `TREQ-PULSO-001`; `TREQ-PULSO-003`; `TREQ-INTEGRATION-003`          | Piloto sin efectos y piloto con efectos concilian ventas, inventario, finanzas y lealtad; credenciales se reducen al cutover.         | BLOQUE X y E5, antes de retirar Makos/POS vigente                                     |

---

#### 7. Distribución y puertas

| Puerta         | Elementos                                   | Regla                                                                          |
| -------------- | ------------------------------------------- | ------------------------------------------------------------------------------ |
| Contención P0  | **28 técnicos** más familias funcionales P0 | no ampliar ni activar la superficie afectada antes de diseño, control y prueba |
| Corrección P1  | **31 técnicos**                             | completar antes de adopción, cutover o siguiente release relevante             |
| Evolución P2   | **4 técnicos**                              | ejecutar después de propiedad y proceso TO-BE aprobados                        |
| Saneamiento P3 | **2 técnicos**                              | retirar solo con consumidor, reemplazo, regresión y rollback comprobados       |

Secuencia obligatoria:

```text
CODE-AUD-020 aprobado
→ QA-REG-001
→ CAP-SCOPE-001 a CAP-SCOPE-019
→ GAP-CTRL-001 a GAP-CTRL-008
→ diseño E2 / arquitectura E3 y E4 / integraciones BLOQUE X
→ paquetes E5 por repositorio
→ pruebas y pilotos
→ cierre de filas BKL con evidencia
```

No se permite saltar desde este backlog directamente a cambios de producción. Las tareas destino determinan diseño, arquitectura, migración, autorización y pruebas.

---

#### 8. Hallazgos conservados sin acción nueva

| Hallazgo         | Disposición                                                                                                |
| ---------------- | ---------------------------------------------------------------------------------------------------------- |
| `H-CODE-010-010` | límite de evidencia: no se confirmó una pantalla incompleta adicional; se conserva como resultado negativo |
| `H-CODE-013-015` | límite de evidencia: no se confirmó legado activo adicional en los repositorios indicados                  |
| `H-CODE-015-019` | límite de evidencia: no se confirmó un huérfano adicional; no autoriza omitir futuras comprobaciones       |

Los controles positivos y hallazgos cerrados de `CODE-AUD-001` a `019` permanecen en su tarea de origen. No se duplican como deuda.

---

#### 9. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA NUEVOS

**Justificación:** esta tarea organiza brechas y vincula requisitos ya identificados; no introduce ni modifica comportamiento ejecutable. `QA-REG-001` deberá comprobar que todos los requisitos anteriores estén registrados con filas completas y que cada paquete posterior declare cuáles implementa.

Se conservan expresamente los requisitos asociados en las filas del backlog, incluidos los dominios `AUTH`, `SHELL`, `SUPABASE`, `ANIMA`, `NEXO`, `FOGO`, `ORIGO`, `PULSO`, `PASS` e `INTEGRATION`.

---

#### 10. Decisiones propuestas

1. Se adopta `BKL-REPO-001` como backlog derivado y trazable del corte de auditoría E1.
2. El backlog se compone de 18 filas funcionales y 65 filas técnicas.
3. Las 188 subcapacidades no verificadas en uso quedan enumeradas exactamente una vez en el backlog funcional.
4. Las 29 subcapacidades verificadas en uso permanecen como baseline, no como trabajo terminado.
5. Las brechas técnicas se asignan por repositorio o superficie, aunque la propiedad funcional pueda pertenecer a otra aplicación.
6. `vento-shell` es propietario técnico de migraciones y contratos compartidos, no propietario empresarial universal.
7. Los identificadores `BKL-*` no son tareas del roadmap y no requieren materialización como encabezados.
8. No se crea ninguna tarea nueva porque todos los elementos tienen destino canónico existente.
9. Las operaciones manuales y externas se conservan hasta cumplir su puerta de cutover y rollback.
10. `QA-REG-001` es la continuidad inmediata y obligatoria.

---

#### 11. Límites de certeza

- El backlog refleja el corte de evidencia del 24 de julio de 2026; no afirma el estado de commits posteriores.
- Una fila técnica puede requerir subdivisión durante diseño o implementación, pero no podrá perder sus capacidades, hallazgos, requisitos ni destino.
- Una fila funcional no decide todavía BUILD, BUY, integración, manual, diferido o retiro; esa decisión pertenece a `CAP-SCOPE-*`.
- Los conteos no equivalen a porcentaje de avance ni estimación de esfuerzo.
- Ninguna evidencia manual o externa fue retirada ni reemplazada durante esta tarea.
- No se ejecutaron migraciones, pruebas destructivas, cambios de permisos, builds productivos ni despliegues.

---

#### 12. Criterios de aceptación

`CODE-AUD-020` podrá aprobarse cuando:

- exista un registro único `BKL-REPO-001`;
- las 217 subcapacidades estén contabilizadas como baseline o brecha;
- las 188 subcapacidades abiertas aparezcan exactamente una vez en el backlog funcional;
- las 29 verificadas en uso permanezcan visibles como baseline protegida;
- cada fila funcional tenga repositorio o medio, prioridad, decisión, destino y puerta;
- cada fila técnica tenga repositorio, hallazgos, acción, destino y evidencia de cierre;
- todos los hallazgos con destino explícito a `CODE-AUD-020` estén cubiertos o conservados como límite de evidencia;
- ningún destino cite una tarea inexistente;
- los `BKL-*` se declaren registros y no tareas nuevas;
- se conserve VITAL fuera del backlog de Vento OS;
- AURA y TALENTO no se presenten como productos operativos;
- los medios manuales y externos conserven coexistencia y cutover;
- los P0 tengan puerta previa a ampliación o activación;
- no se generen requisitos de prueba duplicados;
- `QA-REG-001` quede como continuidad inmediata;
- no se modifique código, CI, despliegues ni Supabase.

---

#### 13. Resultado y continuidad

Al aprobarse quedará cerrada la auditoría documental de implementación actual con la cadena:

```text
inventario de repositorios y superficies
→ contratos y datos
→ procesos parciales, legacy y huérfanos
→ seguridad, concurrencia e idempotencia
→ mapa capacidad ↔ implementación
→ backlog por repositorio
```

La continuidad obligatoria será:

```text
QA-REG-001
— Consolidar retrospectivamente requisitos de prueba anteriores a QA-GOV-001
```
