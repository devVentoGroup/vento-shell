### MINI-BLOQUE — INVENTARIO Y VISIBILIDAD DE APLICACIONES

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **inventario y visibilidad de aplicaciones** dentro de **H2 SHELL APP**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `SHELL-APP-001` a `SHELL-APP-003` — 3 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `SHELL-APP-001`: Inventariar la experiencia actual del hub
- `SHELL-APP-002`: Definir aplicaciones visibles por actor
- `SHELL-APP-003`: Definir aplicaciones visibles por contexto
<!-- PLAN-SECTION-META:END -->

### ✅ SHELL-APP-001 — Inventariar la experiencia actual del hub

**Estado:** APROBADA
**Tarea anterior:** VISO-CORE-006 — Aprobar núcleo antes de ampliar alcance
**Tarea siguiente:** SHELL-APP-002 — Definir aplicaciones visibles por actor
**Tipo de tarea:** inventario técnico-documental AS-IS del Hub Vento OS; el marcador canónico define una sola vez la línea base reutilizable de la experiencia actual de SHELL y conserva `PER_IMPLEMENTATION_UNIT` únicamente como topología de materialización posterior, sin crear una instancia física en esta tarea documental
**Bloque:** BLOQUE H2 — SHELL como aplicación y hub contextual
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H2_SHELL_APP/01_INVENTARIO_Y_VISIBILIDAD_DE_APLICACIONES.md`
**Estado físico resultante:** inventario AS-IS reconciliado contra el código vigente del repositorio propietario, sin cambio de runtime y sin instancia física propia creada por esta aprobación documental
**Cambios físicos autorizados:** ninguno; no se modifican código, navegación runtime, autenticación, permisos, Supabase, datos, dominios, despliegues ni configuración
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Inventariar de forma exacta y reproducible la experiencia que ofrece actualmente el Hub Vento OS dentro de la aplicación canónica `shell`, separando lo que existe en runtime de:

- el catálogo canónico completo de aplicaciones;
- decisiones futuras de visibilidad por actor;
- decisiones futuras de visibilidad por contexto;
- rediseños de navegación;
- estados futuros de contexto laboral;
- implementación física posterior.

La tarea establece una línea base AS-IS.

No decide todavía qué aplicación debe ver cada actor.

No decide todavía qué aplicación debe ver cada combinación de sede, área, rol, turno o dispositivo.

No corrige las divergencias encontradas.

La regla de inventario queda:

```text
EXISTENCIA OBSERVADA EN SHELL
+
IDENTIDAD CANÓNICA YA APROBADA
+
SUPERFICIE REAL
+
DESTINO REAL
+
CONDICIÓN REAL DE EXPOSICIÓN
+
HALLAZGOS YA TRAZADOS
→
INVENTARIO AS-IS DEL HUB
```

Y nunca:

```text
LO QUE HOY APARECE EN EL HUB
→
POLÍTICA FINAL DE VISIBILIDAD
```

---

#### 2. Alcance

El inventario cubre la experiencia SHELL observable y su soporte inmediato en el repositorio propietario:

- página raíz `/`;
- página `/login`;
- tarjetas del launcher;
- rail de logos;
- menú de sesión;
- formulario de acceso;
- recuperación de contraseña;
- layout raíz;
- middleware transversal;
- icono generado;
- catálogo local usado por el launcher;
- metadata local usada por login;
- estados visibles `Disponible` y `Sin acceso`;
- destinos absolutos actuales;
- conteos mostrados en el Hub;
- placeholders visibles;
- divergencias entre listas locales y catálogo canónico.

También conserva el inventario técnico previo aprobado cuando coincide con el snapshot vigente.

---

#### 3. Límites de decisión

Esta tarea no decide:

- visibilidad por actor, reservada a `SHELL-APP-002`;
- visibilidad por contexto, reservada a `SHELL-APP-003`;
- presentación de turno activo, reservada a `SHELL-APP-004`;
- presentación de sede activa, reservada a `SHELL-APP-005`;
- presentación de área activa, reservada a `SHELL-APP-006`;
- presentación de rol operativo activo, reservada a `SHELL-APP-007`;
- tareas pendientes transversales, reservadas a `SHELL-APP-008`;
- página inicial por tipo de usuario, reservada a `SHELL-APP-009`;
- explicación final de bloqueo, reservada a `SHELL-APP-010`;
- frontera laboral versus cliente, reservada a `SHELL-APP-011` y `SHELL-APP-012`;
- lógica funcional propietaria de otras aplicaciones, reservada a `SHELL-APP-013`;
- retorno seguro entre aplicaciones, reservado a `SHELL-APP-014`;
- conservación de contexto, reservada a `SHELL-APP-015`;
- conservación de tarea en curso, reservada a `SHELL-APP-016`;
- experiencia final de computador y tablet, reservada a `SHELL-APP-017` y `SHELL-APP-018`;
- pruebas finales de navegación, reservadas a `SHELL-APP-019` y `SHELL-APP-020`;
- retiro de placeholders de perfil y configuración, reservado a `SHELL-APP-021`.

Inventariar una condición no autoriza corregirla desde `SHELL-APP-001`.

---

#### 4. Identidad de SHELL

La aplicación canónica `shell` representa:

- Vento OS;
- Hub de aplicaciones;
- entrada al ecosistema laboral;
- navegación general;
- SSO y selección de aplicaciones.

Debe mantenerse la separación:

```text
shell
=
APLICACIÓN VENTO OS / HUB
```

y:

```text
vento-shell
=
REPOSITORIO TÉCNICO
```

El repositorio puede contener código compartido, migraciones, herramientas y plantillas que no forman parte de la experiencia runtime del Hub.

---

#### 5. Snapshot inspeccionado

La línea base documental de esta tarea queda anclada a:

| Campo | Valor |
| --- | --- |
| Repositorio | `vento-group-sas/vento-shell` |
| Rama | `main` |
| Commit de referencia | `9f8b5a272682dfa95a9f2cc9d3f182d4fca19558` |
| Aplicación | `shell` |
| Archivo principal del Hub | `src/app/page.tsx` |
| Acceso | `src/app/login/page.tsx` |
| Formulario de acceso | `src/features/auth/login-form.tsx` |
| Layout raíz | `src/app/layout.tsx` |
| Middleware | `middleware.ts` |
| Icono generado | `src/app/icon.tsx` |
| Estado del inventario | `AS_IS_RECONCILIADO` |

El commit de referencia fija el snapshot de esta tarea.

Un cambio posterior de archivos, rutas, catálogo, destinos o condiciones de exposición deberá producir una nueva reconciliación; no cambia retroactivamente este inventario.

---

#### 6. Método de inventario

Se aplican estas reglas:

1. cada `page.tsx` activo bajo `src/app` constituye un patrón de página;
2. query parameters no crean rutas nuevas;
3. componentes embebidos se registran como superficies, no como páginas;
4. layout, middleware e icono se registran por su función técnica separada;
5. un catálogo local se inventaría como evidencia AS-IS, no como catálogo canónico definitivo;
6. un enlace visible no demuestra que la capacidad destino esté implementada;
7. una tarjeta bloqueada sigue formando parte de la experiencia visible;
8. una aplicación canónica ausente del launcher no se declara retirada;
9. una aplicación presente en login pero ausente del launcher conserva ambas observaciones;
10. placeholders hacia `/` no se cuentan como páginas adicionales;
11. las plantillas bajo `templates/` no se cuentan como runtime de SHELL;
12. los componentes fuente bajo `src/components/ui` no se cuentan como páginas ni aplicaciones.

---

#### 7. Resultado cuantitativo principal

| Métrica | Resultado |
| --- | ---: |
| Aplicaciones del catálogo canónico | **10** |
| Aplicaciones en `INTERNAL_APPS` del launcher | **5** |
| Tarjetas renderizadas por el Hub | **5** |
| Destinos absolutos de tarjetas | **5** |
| Permisos `*.access` consultados por el launcher | **5** |
| Estados de tarjeta | **2** |
| Hosts con metadata específica en `/login` | **7** |
| Chips mostrados en “Apps conectadas” de login | **6** |
| Métrica textual fija mostrada por login | **10+** |
| Rutas de página runtime SHELL | **2** |
| Patrones estáticos | **2** |
| Patrones dinámicos | **0** |
| Superficies runtime/técnicas estables inventariadas | **10** |
| Route handlers bajo `src/app/api` observados | **0** |
| Acciones placeholder del menú de sesión hacia `/` | **2** |
| Primitivas UI fuente bajo `src/components/ui` | **5** |
| Requisitos de prueba nuevos | **0** |
| Requisitos de prueba modificados | **0** |

Las cifras describen el snapshot.

No deben normalizarse para que todas las listas coincidan artificialmente.

---

#### 8. `SHELL-RUNTIME-SURFACE-INVENTORY-001`

Se conserva el identificador de inventario ya aprobado y sus identidades estables.

| ID | Tipo | Patrón / exposición | Archivo fuente | Propósito observado | Estado en snapshot |
| --- | --- | --- | --- | --- | --- |
| `SHELL-SURFACE-001` | `PAGE` | `/` | `src/app/page.tsx` | Hub y launcher central de aplicaciones | `CONFIRMADO` |
| `SHELL-SURFACE-002` | `PAGE` | `/login` | `src/app/login/page.tsx` | Acceso central, metadata por destino y redirección de sesión | `CONFIRMADO` |
| `SHELL-SURFACE-003` | `EMBEDDED` | tarjetas del launcher | `src/app/page.tsx` | Cinco tarjetas VISO, NEXO, FOGO, ORIGO y PULSO | `CONFIRMADO` |
| `SHELL-SURFACE-004` | `EMBEDDED` | rail de logos | `src/app/page.tsx` | Resumen visual de las cinco aplicaciones del launcher | `CONFIRMADO` |
| `SHELL-SURFACE-005` | `EMBEDDED` | menú de sesión | `src/app/page.tsx` | Email, perfil, configuración y cierre de sesión | `CONFIRMADO` |
| `SHELL-SURFACE-006` | `EMBEDDED` | formulario de acceso | `src/features/auth/login-form.tsx` | Email, contraseña, visibilidad, errores, cooldown y envío | `CONFIRMADO` |
| `SHELL-SURFACE-007` | `EMBEDDED` | modal de recuperación | `src/features/auth/login-form.tsx` | Solicitud de enlace de restablecimiento | `CONFIRMADO` |
| `SHELL-SURFACE-008` | `GLOBAL` | raíz HTML | `src/app/layout.tsx` | Metadata, fuentes y guard global de rueda en inputs numéricos | `CONFIRMADO` |
| `SHELL-SURFACE-009` | `GLOBAL_SECURITY` | matcher transversal | `middleware.ts` | Renovación y validación de sesión, cookies y redirección | `CONFIRMADO` |
| `SHELL-SURFACE-010` | `GENERATED_METADATA` | icono App Router | `src/app/icon.tsx` | PNG 32×32 generado con `ImageResponse` | `CONFIRMADO` |

Total esperado:

```text
SHELL_SURFACES = 10
MISSING_IDS = 0
DUPLICATE_IDS = 0
```

---

#### 9. Inventario de rutas runtime

| Ruta | Archivo | Tipo | Acceso observado | Resultado |
| --- | --- | --- | --- | --- |
| `/` | `src/app/page.tsx` | `STATIC_PAGE` | usuario Supabase exigido en servidor y protección adicional del middleware | Hub |
| `/login` | `src/app/login/page.tsx` | `STATIC_PAGE` | pública controlada; redirige si la sesión ya es válida | Acceso |

No se observan patrones dinámicos.

Los parámetros:

- `returnTo`;
- `email`;

no crean rutas adicionales.

---

#### 10. Ausencia actual de route handlers App Router

No se observa un directorio `src/app/api` en el snapshot inspeccionado.

Por tanto:

```text
APP_ROUTER_ROUTE_HANDLERS = 0
```

Esta ausencia no permite asumir que cualquier endpoint futuro quedará protegido automáticamente.

El middleware actual excluye el prefijo `/api`.

Cualquier alta futura deberá registrarse y protegerse mediante su contrato aplicable.

---

#### 11. Catálogo canónico de aplicaciones

El catálogo canónico vigente contiene diez identidades:

| Código | Nombre canónico | Tipo | Dominio de identidad | Alcance del roadmap |
| --- | --- | --- | --- | --- |
| `shell` | Vento OS | Hub | Laboral | Núcleo |
| `anima` | ANIMA | Híbrida | Laboral | Núcleo |
| `viso` | VISO | Administrativa | Laboral | Núcleo |
| `nexo` | NEXO | Híbrida | Laboral | Núcleo |
| `fogo` | FOGO | Operativa | Laboral | Núcleo |
| `origo` | ORIGO | Híbrida | Laboral | Núcleo |
| `pulso` | PULSO | Operativa | Laboral | Núcleo |
| `numera` | NUMERA | Híbrida | Laboral | Núcleo |
| `aura` | AURA | Administrativa | Laboral | Diferido |
| `pass` | Vento Pass | Cliente | Cliente | Adyacente |

El inventario del Hub no reemplaza este catálogo.

---

#### 12. Catálogo runtime del launcher

`src/app/page.tsx` declara localmente cinco aplicaciones.

| Orden | Código | Nombre | Etiqueta actual | Destino | Permiso observado |
| ---: | --- | --- | --- | --- | --- |
| 1 | `viso` | VISO | Gerencia y auditoría | `https://viso.ventogroup.co` | `viso.access` |
| 2 | `nexo` | NEXO | Inventario y logística | `https://nexo.ventogroup.co` | `nexo.access` |
| 3 | `fogo` | FOGO | Producción | `https://fogo.ventogroup.co` | `fogo.access` |
| 4 | `origo` | ORIGO | Compras | `https://origo.ventogroup.co` | `origo.access` |
| 5 | `pulso` | PULSO | POS y experiencia | `https://pulso.ventogroup.co` | `pulso.access` |

Esta lista es AS-IS.

No es la decisión de visibilidad futura.

---

#### 13. Matriz de presencia actual por aplicación canónica

| Aplicación | Catálogo canónico | Tarjeta Hub `/` | Metadata específica `/login` | Chip “Apps conectadas” | Decisión de visibilidad final |
| --- | --- | --- | --- | --- | --- |
| `shell` | SÍ | NO; es el propio Hub | metadata genérica del Hub | NO | `NO_DECIDIDA_EN_001` |
| `anima` | SÍ | NO | SÍ | NO | `NO_DECIDIDA_EN_001` |
| `viso` | SÍ | SÍ | SÍ | SÍ | `NO_DECIDIDA_EN_001` |
| `nexo` | SÍ | SÍ | SÍ | SÍ | `NO_DECIDIDA_EN_001` |
| `fogo` | SÍ | SÍ | SÍ | SÍ | `NO_DECIDIDA_EN_001` |
| `origo` | SÍ | SÍ | SÍ | SÍ | `NO_DECIDIDA_EN_001` |
| `pulso` | SÍ | SÍ | SÍ | SÍ | `NO_DECIDIDA_EN_001` |
| `numera` | SÍ | NO | NO | NO | `NO_DECIDIDA_EN_001` |
| `aura` | SÍ | NO | SÍ | SÍ | `NO_DECIDIDA_EN_001` |
| `pass` | SÍ | NO | NO | NO | `NO_DECIDIDA_EN_001` |

La matriz registra presencia.

`SHELL-APP-002` y `SHELL-APP-003` decidirán las reglas futuras.

---

#### 14. Divergencia cuantitativa de listas

El snapshot contiene simultáneamente:

```text
CATÁLOGO CANÓNICO = 10
LAUNCHER = 5
LOGIN_METADATA_BY_HOST = 7
LOGIN_CHIPS = 6
LOGIN_METRIC_TEXT = "10+"
```

Estas cantidades no se fuerzan a coincidir en esta tarea.

Constituyen evidencia de que la experiencia actual utiliza múltiples listas locales o representaciones distintas.

---

#### 15. Composición actual de `/`

La página raíz presenta:

1. encabezado de Vento OS;
2. identificación visual `Workspace`;
3. texto `ventogroup.co`;
4. menú de sesión;
5. bloque “Centro de aplicaciones”;
6. título Vento OS;
7. explicación de acceso centralizado;
8. rail de logos;
9. contador de aplicaciones disponibles;
10. contador de aplicaciones sin acceso;
11. contador total de apps web;
12. sección “Aplicaciones”;
13. cinco tarjetas;
14. footer Vento OS / `ventogroup.co`.

No se observan en la composición actual:

- turno activo;
- sede activa;
- área activa;
- rol operativo activo;
- bandeja de tareas pendientes transversales.

La ausencia se registra sin diseñar esas capacidades.

---

#### 16. Sesión visible en el Hub

El menú de sesión deriva:

- email del usuario autenticado;
- iniciales construidas desde el email;
- etiqueta genérica `Usuario`.

Expone actualmente estas acciones:

| Acción | Destino / efecto |
| --- | --- |
| `Mi perfil` | `/` |
| `Configuración de usuario` | `/` |
| `Cerrar sesión` | `supabase.auth.signOut()` y redirección a `/login?returnTo=/` |

`Mi perfil` y `Configuración de usuario` no se cuentan como capacidades implementadas independientes.

---

#### 17. Estados actuales de tarjeta

Cada tarjeta se encuentra en uno de dos estados locales:

```text
enabled
disabled
```

La presentación es:

| Estado local | Etiqueta | Acción |
| --- | --- | --- |
| `enabled` | `Disponible` | enlace `Abrir` al destino absoluto |
| `disabled` | `Sin acceso` | botón deshabilitado `Bloqueada` |

La tarjeta bloqueada permanece visible en el Hub.

Esta observación no define si deberá permanecer visible para todos los actores.

---

#### 18. Resolución actual de acceso del launcher

Para cada una de las cinco aplicaciones, el Hub intenta primero:

```text
has_permission(
  p_permission_code = app.access,
  p_site_id = null,
  p_area_id = null
)
```

Si esa firma produce error, intenta compatibilidad mediante:

```text
has_permission(
  p_app_id = app,
  p_code = access,
  p_site_id = null,
  p_area_id = null
)
```

Si el segundo intento también falla:

```text
access = disabled
```

Por tanto, el comportamiento final ante error de ambas firmas es fail-closed en la tarjeta.

La coexistencia de dos firmas se registra como compatibilidad observada.

No se aprueba como contrato permanente.

---

#### 19. Separación entre visibilidad y autorización

Una tarjeta `Disponible` solo registra la decisión utilizada por el Hub para habilitar navegación.

No demuestra por sí sola:

- autorización de cada acción del destino;
- contexto laboral suficiente;
- turno;
- sede;
- área;
- rol operativo;
- disponibilidad productiva;
- completitud funcional del destino.

Una aplicación destino debe conservar sus propios guards y autorización.

---

#### 20. Rail de logos

El rail muestra las mismas cinco aplicaciones del launcher.

Cada elemento:

- usa logo de la aplicación;
- conserva título con el nombre;
- aparece con estilo normal cuando `enabled`;
- aparece con opacidad y escala de grises cuando `disabled`.

El rail no constituye un catálogo independiente.

Debe contabilizarse como superficie embebida derivada de la lista local del launcher.

---

#### 21. Contadores del Hub

La página calcula dinámicamente:

```text
Disponibles = apps.filter(access === "enabled").length
Sin acceso = apps.filter(access === "disabled").length
Apps web = apps.length
```

Dado el snapshot:

```text
Apps web = 5
Disponibles + Sin acceso = 5
```

Los primeros dos valores dependen del usuario y de las decisiones de permiso obtenidas en la solicitud.

No se fija una cifra universal de disponibles o bloqueadas.

---

#### 22. Experiencia actual de `/login`

La página de login contiene:

- identidad Vento OS;
- formulario de acceso;
- email;
- contraseña;
- mostrar/ocultar contraseña;
- envío de credenciales;
- estado de carga;
- error;
- cooldown local ante rate limit;
- acceso a recuperación;
- visualización del `returnTo`;
- metadata variable cuando el destino coincide con un host conocido;
- redirección automática si ya existe usuario autenticado.

En escritorio agrega contenido promocional y descriptivo del ecosistema.

---

#### 23. Metadata específica de login

La tabla `APP_METADATA_BY_HOST` reconoce:

| Host | Nombre mostrado |
| --- | --- |
| `nexo.ventogroup.co` | NEXO |
| `origo.ventogroup.co` | ORIGO |
| `fogo.ventogroup.co` | FOGO |
| `viso.ventogroup.co` | VISO |
| `pulso.ventogroup.co` | PULSO |
| `anima.ventogroup.co` | ANIMA |
| `aura.ventogroup.co` | AURA |

Total:

```text
LOGIN_METADATA_HOSTS = 7
```

NUMERA y PASS no aparecen en esta tabla.

SHELL usa la metadata genérica del Hub cuando no se resuelve una aplicación destino.

---

#### 24. “Apps conectadas” actual de login

La superficie de login muestra chips para:

```text
NEXO
ORIGO
PULSO
FOGO
VISO
AURA
```

Total:

```text
LOGIN_CONNECTED_CHIPS = 6
```

ANIMA está en metadata pero no en estos chips.

NUMERA y PASS no aparecen.

La diferencia se conserva como hallazgo de catálogo local.

---

#### 25. Métrica `10+` del login

La experiencia de escritorio muestra:

```text
Apps
10+
```

El valor es texto fijo de presentación.

No se deriva del catálogo canónico de diez aplicaciones ni de las cinco tarjetas del launcher.

Por tanto:

```text
"10+"
≠
CONTEO CANÓNICO VERIFICADO DEL HUB
```

Esta tarea lo registra como AS-IS y no lo normaliza.

---

#### 26. `returnTo` observado

La función `safeReturnTo` aplica actualmente:

```text
VACÍO
→ "/"

HTTP ABSOLUTA
→ SE CONSERVA

HTTPS ABSOLUTA
→ SE CONSERVA

RUTA RELATIVA QUE EMPIEZA POR "/"
→ SE CONSERVA

OTRO VALOR
→ "/"
```

El hecho de que una URL absoluta sea aceptada por el código actual no constituye aprobación de ese origen.

El endurecimiento del retorno permanece fuera de esta tarea.

---

#### 27. Redirección de sesión existente

Si `/login` detecta un usuario ya autenticado:

```text
redirect(returnTo || "/")
```

Si `/` no encuentra usuario:

```text
redirect("/login?returnTo=/")
```

El middleware también construye un login central con `returnTo=request.url`.

Estas rutas forman parte del AS-IS.

---

#### 28. Recuperación de contraseña

El formulario ejecuta:

```text
resetPasswordForEmail
```

y resuelve el destino mediante:

```text
NEXT_PUBLIC_SET_PASSWORD_URL
```

o, en ausencia de esa variable:

```text
https://anima.ventogroup.co/api/set-password
```

El modal de recuperación permite:

- correo;
- envío;
- carga;
- error;
- confirmación;
- cierre.

La dependencia con ANIMA se registra.

No se redefine aquí.

---

#### 29. Cooldown de login

Cuando el mensaje de error contiene `rate limit`, la experiencia local fija:

```text
30 segundos
```

y bloquea temporalmente el reenvío.

Esto es comportamiento observado del cliente.

No se interpreta como política canónica global de rate limiting.

---

#### 30. Middleware actual

El middleware excluye mediante matcher:

```text
_next
login
favicon.ico
logos
images
fonts
api
```

Para las rutas que sí procesa:

1. comprueba existencia de cookies `sb-*`;
2. requiere configuración Supabase;
3. resuelve `auth.getUser()`;
4. ante error o ausencia de usuario redirige al login;
5. limpia únicamente cookies cuyo nombre comienza por `sb-` cuando corresponde;
6. permite la solicitud cuando existe usuario válido.

La ruta `/login` queda fuera del matcher.

El prefijo `/api` también queda fuera.

---

#### 31. Estados fail-closed observados del middleware

El middleware distingue internamente:

```text
no-cookies
no-config
auth-error
no-user
ok
```

Los cuatro primeros estados no permiten continuar a la superficie protegida.

Los headers de diagnóstico solo se agregan cuando:

```text
NEXT_PUBLIC_DEBUG_AUTH = "1"
```

El inventario registra estos estados sin convertirlos en mensajes finales de UX.

---

#### 32. Logout actual

La acción de cierre de sesión en `/`:

1. crea cliente Supabase;
2. ejecuta `auth.signOut()`;
3. redirige a `/login?returnTo=/`.

Esta tarea solo registra la acción.

No certifica invalidación transversal de todas las aplicaciones consumidoras.

---

#### 33. Identidad web observada

El layout declara:

```text
title = "Vento OS · Hub"
applicationName = "Vento OS"
metadataBase = "https://hub.ventogroup.co"
```

El middleware usa como fallback de acceso:

```text
https://os.ventogroup.co/login
```

Por tanto existe en el snapshot una diferencia explícita:

```text
hub.ventogroup.co
≠
os.ventogroup.co
```

La tarea no elige uno de los dos.

La reconciliación conserva su propietario canónico previo.

---

#### 34. Iconografía observada

El Hub utiliza:

- `/apps/hub.png` dentro del encabezado de `/`;
- metadata de icono `/icon.svg`;
- `src/app/icon.tsx` como icono generado 32×32 PNG por convención App Router;
- logos individuales para cada aplicación del launcher.

La coexistencia se registra como parte de la superficie actual.

No se redefine el sistema visual.

---

#### 35. Primitivas UI fuente

Bajo `src/components/ui` se observan exactamente cinco primitivas fuente:

```text
Button.tsx
Card.tsx
Chip.tsx
Input.tsx
Modal.tsx
```

`index.ts` actúa como barrel y no se contabiliza como sexta primitiva.

Estas primitivas no son rutas ni aplicaciones.

Su relación con otros kits UI permanece fuera del propósito de `SHELL-APP-001`.

---

#### 36. Plantilla AppShell separada del runtime

`templates/app-shell-standard` existe como fuente de plantilla.

No se contabiliza como superficie runtime desplegada de SHELL.

La tarea conserva la separación:

```text
TEMPLATE
≠
RUNTIME DEL HUB
```

Los hallazgos históricos de acoplamiento o divergencia de la plantilla mantienen sus owners existentes.

---

#### 37. Contexto laboral visible actualmente

El Hub actual no presenta de forma explícita en `/`:

| Dimensión | Visible como contexto activo |
| --- | --- |
| Turno | NO |
| Sede | NO |
| Área | NO |
| Rol operativo | NO |
| Tareas pendientes transversales | NO |

La ausencia constituye entrada para `SHELL-APP-004` a `SHELL-APP-008`.

No se interpreta como autorización para agregar esos elementos desde esta tarea.

---

#### 38. Perfil visible actual

La experiencia usa:

```text
email
+
iniciales derivadas del email
+
etiqueta "Usuario"
```

No muestra en el encabezado:

- nombre laboral canónico;
- rol base;
- rol operativo;
- sede;
- área;
- turno.

La tarea no decide cuál de esos datos deberá añadirse.

---

#### 39. Visibilidad actual versus visibilidad futura

Actualmente la raíz:

- mantiene cinco tarjetas en el DOM generado;
- diferencia habilitada/bloqueada;
- no elimina una tarjeta por `disabled`.

Debe mantenerse la distinción:

```text
PRESENTE EN AS-IS
≠
DEBE SER VISIBLE PARA TODO ACTOR
```

y:

```text
BLOQUEADA EN AS-IS
≠
DEBE SER OCULTADA
```

La decisión corresponde al resto del mini-bloque.

---

#### 40. Hallazgos reconciliados

Se reutilizan los identificadores de hallazgo ya aprobados cuando el código vigente confirma la misma condición.

| ID | Condición confirmada | Tratamiento |
| --- | --- | --- |
| `SHELL-SURFACE-FINDING-001` | launcher, metadata de login y otras representaciones mantienen listas distintas | conservar y entregar como entrada a visibilidad/catálogo; no consolidar aquí |
| `SHELL-SURFACE-FINDING-002` | `safeReturnTo` acepta URLs HTTP/HTTPS absolutas | conservar como frontera pendiente; no corregir aquí |
| `SHELL-SURFACE-FINDING-003` | middleware excluye `/api` y no se observan handlers App Router actuales | conservar control de alta futura |
| `SHELL-SURFACE-FINDING-004` | `Mi perfil` y `Configuración de usuario` apuntan a `/` | no contarlos como capacidades independientes |
| `SHELL-SURFACE-FINDING-005` | `metadataBase` usa `hub.ventogroup.co` y login fallback usa `os.ventogroup.co` | conservar reconciliación pendiente |
| `SHELL-SURFACE-FINDING-006` | launcher soporta dos firmas de `has_permission` | conservar compatibilidad como hallazgo, no como contrato permanente |
| `SHELL-SURFACE-FINDING-007` | recuperación depende del destino web-auth de ANIMA | conservar dependencia explícita |

Los hallazgos no se resuelven dentro de este inventario.

---

#### 41. Hallazgos sin identidad nueva

No se crean nuevos identificadores de hallazgo para:

- `10+` en login;
- diferencia 10/7/6/5;
- ausencia de NUMERA en launcher;
- ausencia de ANIMA en cards;
- ausencia de PASS en cards;
- AURA presente solo en superficies de login;
- contexto activo no mostrado.

Estas observaciones se integran bajo la divergencia de catálogo y el handoff del mini-bloque para evitar inventar taxonomías paralelas.

---

#### 42. Handoff a `SHELL-APP-002`

`SHELL-APP-002 — Definir aplicaciones visibles por actor` recibe exactamente:

1. catálogo canónico de diez aplicaciones;
2. lista runtime de cinco tarjetas;
3. estados actuales `enabled` / `disabled`;
4. cinco permisos `*.access` observados;
5. cinco destinos absolutos actuales;
6. siete hosts con metadata de login;
7. seis chips de “Apps conectadas”;
8. métrica fija `10+`;
9. condición actual de tarjetas bloqueadas visibles;
10. aplicación `shell` como Hub y no como tarjeta;
11. `pass` como identidad canónica de dominio cliente sin decisión de visibilidad tomada aquí;
12. `aura` como identidad canónica diferida sin decisión de visibilidad tomada aquí;
13. `anima` y `numera` como identidades canónicas sin tarjeta actual;
14. hallazgos de listas locales divergentes;
15. prohibición de inferir la política futura desde el AS-IS.

El siguiente contrato deberá producir una decisión por actor sin alterar retroactivamente este inventario.

---

#### 43. Handoff posterior a `SHELL-APP-003`

Sin desarrollar `SHELL-APP-003`, este inventario conserva para esa tarea:

- ausencia actual de turno visible;
- ausencia actual de sede visible;
- ausencia actual de área visible;
- ausencia actual de rol operativo visible;
- uso actual de `p_site_id = null`;
- uso actual de `p_area_id = null`;
- cinco aplicaciones evaluadas solo mediante `*.access` en el launcher;
- inexistencia de una política de visibilidad contextual materializada en `src/app/page.tsx`.

La tarea posterior decidirá qué dimensiones contextuales afectan visibilidad.

---

#### 44. Regla de no inferencia desde login

La presencia de una aplicación en `APP_METADATA_BY_HOST` significa únicamente que `/login` conoce metadata para ese host.

No significa:

- que exista tarjeta en el Hub;
- que deba ser visible;
- que el usuario tenga acceso;
- que la aplicación esté implementada;
- que pertenezca a la experiencia laboral final.

Igualmente, un chip de “Apps conectadas” es contenido visual actual y no un registro de disponibilidad canónica.

---

#### 45. Regla de no inferencia desde `*.access`

La existencia o consulta de:

```text
viso.access
nexo.access
fogo.access
origo.access
pulso.access
```

no demuestra por sí sola:

- proceso disponible;
- ruta destino completa;
- acción autorizada;
- despliegue certificado;
- contexto suficiente.

La regla vigente de disponibilidad empresarial continúa separada del simple registro o permiso.

---

#### 46. Regla de no inferencia desde dominio

Un `href` observado prueba el destino configurado en el snapshot.

No demuestra:

- salud del dominio;
- despliegue;
- ownership técnico definitivo;
- autorización;
- equivalencia con catálogo;
- aptitud para producción.

`SHELL-APP-001` no realiza certificación operativa de dominios.

---

#### 47. Regla de deriva

Los siguientes cambios futuros obligan a reconciliar este inventario antes de usarlo como evidencia vigente:

- alta o retiro de `page.*`;
- alta de `route.*`;
- cambio en `INTERNAL_APPS`;
- cambio de app id;
- cambio de nombre;
- cambio de destino;
- cambio de `permissionCode`;
- cambio de metadata por host;
- cambio de matcher;
- cambio de login URL;
- cambio de placeholders;
- cambio en el número o identidad de las superficies inventariadas.

La deriva debe ser explícita.

---

#### 48. Estado AS-IS consolidado

```text
SHELL_APPLICATION = shell
RUNTIME_PAGES = 2
STATIC_ROUTE_PATTERNS = 2
DYNAMIC_ROUTE_PATTERNS = 0
RUNTIME_SURFACES = 10
CANONICAL_APPS = 10
LAUNCHER_APPS = 5
LAUNCHER_CARDS = 5
LOGIN_METADATA_HOSTS = 7
LOGIN_CONNECTED_CHIPS = 6
LOGIN_DISPLAYED_APP_METRIC = "10+"
APP_ROUTER_API_HANDLERS = 0
PROFILE_CONFIGURATION_PLACEHOLDERS = 2
CURRENT_ACTIVE_CONTEXT_FIELDS_VISIBLE = 0
```

Estas cifras son la salida material del inventario.

---

#### 49. Decisión documental

El resultado de `SHELL-APP-001` queda:

```text
EXPERIENCIA ACTUAL DEL HUB
→ INVENTARIADA

SUPERFICIES
→ IDENTIFICADAS

RUTAS
→ IDENTIFICADAS

APLICACIONES CANÓNICAS
→ RECONCILIADAS CONTRA PRESENCIA ACTUAL

DIVERGENCIAS
→ CONSERVADAS Y TRAZADAS

VISIBILIDAD POR ACTOR
→ NO DECIDIDA

VISIBILIDAD POR CONTEXTO
→ NO DECIDIDA

CAMBIO DE RUNTIME
→ NO AUTORIZADO
```

---

#### 50. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0
**Requisitos modificados:** 0

El inventario actual reutiliza requisitos existentes que ya protegen exactamente la identidad y cardinalidad de superficies, rutas, launcher, login, middleware, placeholders, catálogo local y deriva. La tarea no introduce una regla protegida independiente.

---

#### 51. Cobertura de prueba vigente reutilizada

Sin modificar el Registro Canónico de Requisitos de Prueba, esta tarea reutiliza:

- `TREQ-SHELL-012` — cardinalidad exacta del inventario SHELL;
- `TREQ-SHELL-013` — identidad estable y delta explícito de superficies;
- `TREQ-SHELL-014` — `/` autenticada y cinco tarjetas del launcher;
- `TREQ-SHELL-015` — decisión de permiso y compatibilidad entre firmas;
- `TREQ-SHELL-016` — aplicación bloqueada no navegable;
- `TREQ-SHELL-017` — cierre de sesión;
- `TREQ-SHELL-018` — frontera de `returnTo`;
- `TREQ-SHELL-019` — sesión existente y metadata de login;
- `TREQ-SHELL-020` — estados del formulario de acceso;
- `TREQ-SHELL-021` — recuperación y dependencia de ANIMA;
- `TREQ-SHELL-022` — modal de recuperación;
- `TREQ-SHELL-023` — cobertura del middleware;
- `TREQ-SHELL-024` — fail-closed del middleware;
- `TREQ-SHELL-025` — cero route handlers actuales y alta futura;
- `TREQ-SHELL-026` — identidad web, metadata y dominio;
- `TREQ-SHELL-027` — placeholders de perfil/configuración;
- `TREQ-SHELL-028` — catálogo único versionado;
- `TREQ-SHELL-029` — plantilla AppShell separada de runtime;
- `TREQ-SHELL-030` — visibilidad template sin sustituir autorización;
- `TREQ-SHELL-031` — simulación separada de autoridad;
- `TREQ-SHELL-032` — primitivas UI y kits separados de rutas;
- `TREQ-SHELL-033` — dos patrones estáticos y cero dinámicos;
- `TREQ-SHELL-034` — dominios absolutos gobernados;
- `TREQ-SHELL-035` — textos, etiquetas y estados consistentes.

Estas referencias son trazabilidad heredada.

No actualizan 04A.

---

#### 52. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | El artefacto todavía no ha sido insertado ni sometido a la batería documental del checkout local de `SHELL-APP-001`. |
| LOCAL | NOT_EXECUTED | No se ha ejecutado todavía `docs:task:format`, `docs:task:quality`, `docs:delivery:check` ni la batería global sobre la rama local de la tarea. |
| REMOTA | PASS | Se inspeccionaron el `main` vigente, continuidad, topología, políticas documentales, owner H2, catálogo canónico de aplicaciones, 04A de SHELL y los archivos runtime `src/app/page.tsx`, `src/app/login/page.tsx`, `src/features/auth/login-form.tsx`, `src/app/layout.tsx`, `middleware.ts`, `src/app/icon.tsx`, `src/components/ui` y el inventario técnico aprobado de superficies. |
| OPERATIVA | NOT_APPLICABLE | La tarea no valida disponibilidad productiva, salud de dominios, sesiones reales, permisos de usuarios reales ni comportamiento desplegado; documenta el snapshot del repositorio. |
| FÍSICA | NOT_APPLICABLE | Esta aprobación documental no crea ni autoriza una instancia `SHELL-APP-001::implementation_unit_id` y no ejecuta cambios físicos. |

---

#### 53. Criterios de aceptación

- [ ] El título es exactamente `SHELL-APP-001 — Inventariar la experiencia actual del hub`.
- [ ] `VISO-CORE-006` permanece como tarea anterior.
- [ ] `SHELL-APP-002` permanece como siguiente tarea.
- [ ] Se conserva la topología `PER_IMPLEMENTATION_UNIT` sin crear una instancia física.
- [ ] La aplicación `shell` no se confunde con el repositorio `vento-shell`.
- [ ] El snapshot queda anclado a un commit verificable.
- [ ] Se conservan exactamente diez aplicaciones canónicas.
- [ ] Se conservan exactamente cinco aplicaciones en el launcher AS-IS.
- [ ] Las cinco tarjetas corresponden a VISO, NEXO, FOGO, ORIGO y PULSO.
- [ ] Se conservan los cinco destinos observados.
- [ ] Se conservan los cinco permisos `*.access` observados.
- [ ] Se conservan los estados `enabled` y `disabled`.
- [ ] Una tarjeta bloqueada se registra como visible pero no navegable.
- [ ] No se confunde visibilidad del Hub con autorización del destino.
- [ ] Se conservan exactamente dos rutas de página runtime.
- [ ] Ambas rutas son estáticas.
- [ ] No se inventan rutas dinámicas.
- [ ] `returnTo` y `email` no se cuentan como rutas.
- [ ] Se conservan los diez IDs `SHELL-SURFACE-001` a `SHELL-SURFACE-010`.
- [ ] No se crean IDs paralelos de superficie.
- [ ] Se registra la ausencia de route handlers bajo `src/app/api`.
- [ ] Se conserva la exclusión actual de `/api` como hallazgo de seguridad.
- [ ] Se registran siete hosts con metadata específica de login.
- [ ] Se registran seis chips de “Apps conectadas”.
- [ ] Se registra la métrica fija `10+`.
- [ ] Las divergencias 10/7/6/5 no se corrigen por inferencia.
- [ ] ANIMA no se inventa como tarjeta actual.
- [ ] NUMERA no se inventa como tarjeta actual.
- [ ] AURA no se inventa como tarjeta actual.
- [ ] PASS no se inventa como tarjeta actual.
- [ ] SHELL no se inventa como tarjeta de sí misma.
- [ ] No se decide todavía la visibilidad final de ninguna aplicación.
- [ ] `Mi perfil` se registra como placeholder hacia `/`.
- [ ] `Configuración de usuario` se registra como placeholder hacia `/`.
- [ ] Los placeholders no se cuentan como páginas.
- [ ] Se registra la acción actual de logout.
- [ ] Se registra la recuperación de contraseña y su fallback hacia ANIMA.
- [ ] Se registra el cooldown local de 30 segundos sin convertirlo en política global.
- [ ] Se registra la coexistencia de dos firmas de `has_permission`.
- [ ] La compatibilidad de RPC no se declara contrato permanente.
- [ ] Se registra `hub.ventogroup.co` versus `os.ventogroup.co` sin decidir aquí su reconciliación.
- [ ] Se registran las cinco primitivas UI fuente.
- [ ] Las primitivas no se cuentan como rutas ni aplicaciones.
- [ ] La plantilla AppShell permanece separada del runtime.
- [ ] Se registra que turno, sede, área, rol operativo y tareas pendientes no aparecen como contexto activo en el Hub actual.
- [ ] No se desarrolla `SHELL-APP-002`.
- [ ] No se desarrolla `SHELL-APP-003`.
- [ ] No se desarrolla ninguna tarea `SHELL-APP-004..021`.
- [ ] Se reutilizan hallazgos existentes sin inventar una taxonomía nueva.
- [ ] Toda observación material tiene owner posterior o tarea reservada existente.
- [ ] No se crean requisitos de prueba.
- [ ] No se modifican requisitos de prueba.
- [ ] No se modifica el Registro Canónico de Requisitos de Prueba.
- [ ] No se ejecutan cambios físicos.

---

#### 54. Límites

Esta tarea no:

- modifica `src/app/page.tsx`;
- modifica `/login`;
- modifica `LoginForm`;
- modifica middleware;
- modifica layout;
- modifica iconos;
- modifica estilos;
- cambia destinos de aplicaciones;
- cambia permisos;
- elimina la compatibilidad RPC;
- cambia metadata;
- cambia dominio canónico;
- cambia cookies;
- cambia SSO;
- cambia recuperación;
- elimina placeholders;
- crea perfil;
- crea configuración de usuario;
- oculta aplicaciones;
- agrega aplicaciones;
- define visibilidad por actor;
- define visibilidad por contexto;
- define página inicial por actor;
- define mensajes finales de bloqueo;
- crea turno activo en el Hub;
- crea sede activa en el Hub;
- crea área activa en el Hub;
- crea rol operativo activo en el Hub;
- crea tareas pendientes transversales;
- cambia PASS;
- cambia AURA;
- cambia ANIMA;
- cambia NUMERA;
- cambia Supabase;
- modifica RLS;
- modifica grants;
- modifica RPC;
- modifica Auth;
- modifica datos;
- crea migraciones;
- despliega;
- prueba dominios reales;
- autoriza implementación física;
- crea un `implementation_unit_id`;
- crea requisitos de prueba;
- modifica requisitos de prueba;
- modifica 04A;
- desarrolla `SHELL-APP-002`.

---

#### 55. Continuidad

**ÚLTIMA TAREA APROBADA**
`VISO-CORE-006 — Aprobar núcleo antes de ampliar alcance`

**TAREA ACTUAL APROBADA**
`SHELL-APP-001 — Inventariar la experiencia actual del hub`

**SIGUIENTE TAREA RESERVADA**
`SHELL-APP-002 — Definir aplicaciones visibles por actor`


### ✅ SHELL-APP-002 — Definir aplicaciones visibles por actor

**Estado:** APROBADA
**Tarea anterior:** SHELL-APP-001 — Inventariar la experiencia actual del hub
**Tarea siguiente:** SHELL-APP-003 — Definir aplicaciones visibles por contexto
**Tipo de tarea:** definición técnico-documental de política de visibilidad del Hub por actor efectivo y elegibilidad laboral permanente; el marcador canónico se define una sola vez y la futura materialización conserva topología `PER_IMPLEMENTATION_UNIT`, sin crear instancia física en esta tarea
**Bloque:** BLOQUE H2 — SHELL como aplicación y hub contextual
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H2_SHELL_APP/01_INVENTARIO_Y_VISIBILIDAD_DE_APLICACIONES.md`
**Estado físico resultante:** política documental de visibilidad por actor definida sobre el catálogo, autorización y matrices vigentes, sin modificar el runtime del Hub
**Cambios físicos autorizados:** ninguno; no se modifican código, navegación runtime, permisos, matrices, Supabase, datos, dominios, despliegues ni configuración
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir qué aplicaciones puede considerar visibles el Hub Vento OS a partir del actor efectivo y de su elegibilidad laboral permanente, sin confundir:

- tipo de actor;
- rol base;
- rol operativo;
- contexto de turno;
- permiso efectivo;
- visibilidad de una aplicación;
- autorización de las acciones internas de esa aplicación.

La tarea consume el inventario AS-IS de `SHELL-APP-001` y produce una política TO-BE de visibilidad por actor.

La regla general queda:

```text
ACTOR EFECTIVO
+
APLICACIÓN CANÓNICA
+
CARRIL DE ACCESO A LA APLICACIÓN
+
DECISIÓN EFECTIVA DEL PERMISO app.access
+
ESTADO DE CICLO DE VIDA DE LA APLICACIÓN
+
FRONTERA LABORAL / CLIENTE
→
VISIBILIDAD POR ACTOR
```

Esta tarea no decide todavía si una aplicación adicional se vuelve visible por turno, sede, área o rol operativo.

---

#### 2. Decisión principal

La visibilidad del Hub no se derivará de una lista fija de roles escrita en la interfaz.

La autoridad será:

```text
ACTOR EFECTIVO RESUELTO
→
EVALUACIÓN CANÓNICA DEL PERMISO DE ENTRADA
→
POLÍTICA DE PRESENTACIÓN DE SHELL
```

La matriz de roles de esta tarea es una proyección verificable del estado canónico actual de concesiones.

No constituye una segunda matriz de autorización.

Por tanto:

```text
MATRIZ DE ESTA TAREA
≠
NUEVA FUENTE DE PERMISOS
```

y:

```text
ROL
≠
AUTORIZACIÓN
```

---

#### 3. Universo canónico de tipos de actor

Se conservan exactamente cuatro tipos de actor efectivo:

| Tipo de actor | Naturaleza | Acceso al Hub laboral |
| --- | --- | --- |
| `EMPLOYEE` | trabajador laboral resoluble | puede participar en la política de SHELL |
| `CUSTOMER` | identidad de cliente | no recibe el grid laboral de SHELL |
| `SYSTEM` | actor no humano | no recibe interfaz interactiva del Hub |
| `UNRESOLVED` | identidad o actor no resuelto | denegación cerrada; sin grid de aplicaciones |

No se crean tipos adicionales.

---

#### 4. Regla para `EMPLOYEE`

Un actor `EMPLOYEE` solo participa en el Hub laboral cuando la resolución canónica determina un empleado válido y activo.

La visibilidad permanente de una aplicación se evalúa mediante el carril base compatible con el permiso de entrada de esa aplicación.

El carril base puede obtener concesión desde:

```text
ROL BASE
OR
CONCESIÓN INDIVIDUAL BASE
```

y queda sujeto a:

- denegaciones estructurales;
- bloqueos individuales transversales;
- denegaciones explícitas del carril;
- modalidad de autorización del permiso;
- estado de la aplicación;
- vigencia de la asignación;
- política de presentación de SHELL.

Un empleado inactivo no conserva visibilidad por tener filas históricas de permiso.

---

#### 5. Regla para `CUSTOMER`

`CUSTOMER` no es actor del grid laboral de SHELL.

La identidad de cliente:

```text
CUSTOMER
→
NO_INTERACTIVE_LABOR_HUB
```

Vento Pass conserva su propia frontera de identidad de cliente.

La existencia del código `pass`, de un cliente autenticado o de una cuenta de Vento Pass no concede:

- `shell.access`;
- rol base;
- rol operativo;
- acceso a aplicaciones laborales.

Si una misma persona posee además una identidad laboral válida, el acceso al Hub deberá resolverse como actor `EMPLOYEE`, no mediante su identidad `CUSTOMER`.

---

#### 6. Regla para `SYSTEM`

Un actor `SYSTEM` no recibe:

- tarjetas;
- launcher interactivo;
- selector de aplicaciones;
- menú de navegación humana.

Las integraciones o automatizaciones que actúen como `SYSTEM` deberán consumir contratos técnicos propios y no simular un usuario de SHELL.

Resultado:

```text
SYSTEM
→
NO_INTERACTIVE_HUB
```

---

#### 7. Regla para `UNRESOLVED`

Cuando el actor efectivo sea `UNRESOLVED`:

```text
VISIBLE_APPS = 0
```

No se utilizará como fallback:

- email;
- rol almacenado en cliente;
- cookie de simulación;
- nombre visible;
- última aplicación abierta;
- listado local de tarjetas.

La resolución incompleta falla cerrada.

---

#### 8. Diferencia entre actor, rol base y rol operativo

Para `EMPLOYEE` se conserva:

```text
ACTOR
→ identidad laboral efectiva

ROL BASE
→ responsabilidad permanente

ROL OPERATIVO
→ función temporal dentro de contexto operativo
```

Por tanto:

```text
EMPLOYEE
≠ propietario
≠ gerente
≠ bodeguero
```

Los códigos de rol son atributos o fuentes de concesión del actor laboral.

No son tipos de actor.

---

#### 9. Universo canónico de roles base

La línea vigente contiene exactamente ocho roles base:

1. `propietario`;
2. `gerente_general`;
3. `gerente`;
4. `supervisor`;
5. `auxiliar_administrativa`;
6. `contador`;
7. `marketing`;
8. `trabajador_operativo`.

La línea histórica de siete roles se conserva como baseline anterior.

La decisión aditiva `AUTH-MOD-021` incorpora `trabajador_operativo` y su sucesor de concesiones base.

---

#### 10. Reconciliación de `trabajador_operativo`

`trabajador_operativo` recibe exactamente cinco concesiones base iniciales.

Para visibilidad de aplicaciones son relevantes:

```text
shell.access
anima.access
```

No recibe por su rol base:

```text
viso.access
nexo.access
fogo.access
origo.access
pulso.access
numera.access
aura.access
pass.access
```

Por tanto, sin otra concesión individual válida y sin contexto operativo:

```text
trabajador_operativo
→ Hub SHELL
→ ANIMA
```

No se infiere ninguna aplicación operativa adicional desde el nombre del rol.

---

#### 11. Universo canónico de aplicaciones

Se conservan exactamente diez aplicaciones:

| Código | Nombre | Tipo | Identidad | Roadmap |
| --- | --- | --- | --- | --- |
| `shell` | Vento OS | Hub | Laboral | Núcleo |
| `anima` | ANIMA | Híbrida | Laboral | Núcleo |
| `viso` | VISO | Administrativa | Laboral | Núcleo |
| `nexo` | NEXO | Híbrida | Laboral | Núcleo |
| `fogo` | FOGO | Operativa | Laboral | Núcleo |
| `origo` | ORIGO | Híbrida | Laboral | Núcleo |
| `pulso` | PULSO | Operativa | Laboral | Núcleo |
| `numera` | NUMERA | Híbrida | Laboral | Núcleo |
| `aura` | AURA | Administrativa | Laboral | Diferido |
| `pass` | Vento Pass | Cliente | Cliente | Adyacente |

La tarea no crea, retira ni renombra aplicaciones.

---

#### 12. Modalidad canónica de los permisos de entrada

| Aplicación | Permiso de entrada | Modalidad |
| --- | --- | --- |
| `shell` | `shell.access` | `BASE_ONLY` |
| `anima` | `anima.access` | `BASE_ONLY` |
| `viso` | `viso.access` | `BASE_ONLY` |
| `nexo` | `nexo.access` | `BASE_OR_OPERATIONAL` |
| `fogo` | `fogo.access` | `BASE_OR_OPERATIONAL` |
| `origo` | `origo.access` | `BASE_OR_OPERATIONAL` |
| `pulso` | `pulso.access` | `OPERATIONAL_ONLY` |
| `numera` | `numera.access` | `BASE_ONLY` |
| `aura` | `aura.access` | `BASE_ONLY` |
| `pass` | `pass.access` | `BASE_ONLY` |

La modalidad del catálogo prevalece sobre la tabla donde exista una asignación.

---

#### 13. Estados de presentación definidos por esta tarea

Se definen estos estados documentales de visibilidad:

| Estado | Significado |
| --- | --- |
| `HUB_SELF` | `shell` es la propia superficie de entrada; no se representa como tarjeta de sí misma |
| `VISIBLE_BASE` | la aplicación puede mostrarse en la superficie laboral primaria cuando el carril base produce ALLOW efectivo |
| `HIDDEN_BASE` | el actor no tiene elegibilidad base efectiva para esa aplicación; no se muestra por el solo rol base |
| `CONTEXT_CANDIDATE` | la aplicación no es visible por base pero puede adquirir elegibilidad mediante carril operativo; resolución reservada a `SHELL-APP-003` |
| `DEFERRED_RESERVED` | la aplicación existe canónicamente pero no se presenta como capacidad navegable mientras permanezca diferida |
| `ADJACENT_RESERVED` | existe una elegibilidad laboral-administrativa que no convierte la aplicación de cliente en parte del grid laboral primario |
| `NO_INTERACTIVE_HUB` | el tipo de actor no recibe grid laboral |

Estos estados son de presentación.

No sustituyen `ALLOW`, `DENY`, `READY`, `BLOCKED` ni las decisiones canónicas de autorización.

---

#### 14. Clasificación de aplicación dentro del Hub

| Aplicación | Clase de presentación |
| --- | --- |
| `shell` | `HUB_SELF` |
| `anima` | `PRIMARY_BASE` |
| `viso` | `PRIMARY_BASE` |
| `nexo` | `PRIMARY_BASE_OR_CONTEXT` |
| `fogo` | `PRIMARY_BASE_OR_CONTEXT` |
| `origo` | `PRIMARY_BASE_OR_CONTEXT` |
| `pulso` | `PRIMARY_CONTEXT_ONLY` |
| `numera` | `PRIMARY_BASE` |
| `aura` | `DEFERRED_RESERVED` |
| `pass` | `ADJACENT_RESERVED` |

La clase define dónde puede participar una aplicación.

No concede acceso.

---

#### 15. Regla de visibilidad base efectiva

Para una aplicación `PRIMARY_BASE` o `PRIMARY_BASE_OR_CONTEXT`:

```text
ACTOR = EMPLOYEE
+
BASE_DECISION(app.access) = ALLOW
+
APLICACIÓN ACTIVA Y NAVEGABLE
+
SIN BLOQUEO ESTRUCTURAL
→
VISIBLE_BASE
```

Si el carril base no produce ALLOW:

```text
→ HIDDEN_BASE
```

salvo que la aplicación admita carril operativo, caso que podrá convertirse en `CONTEXT_CANDIDATE` únicamente mediante `SHELL-APP-003`.

---

#### 16. Concesiones individuales

La matriz por rol base es una baseline.

Una concesión individual base válida puede añadir un permiso compatible con el carril base.

Por tanto:

```text
ROLE_BASE_ALLOW
OR
EMPLOYEE_BASE_ALLOW
→
BASE_ALLOW
```

antes de aplicar denegaciones.

Ejemplo conceptual:

```text
trabajador_operativo
+
employee_permissions válido para nexo.access
→
puede adquirir elegibilidad base de NEXO
```

solo si el permiso, alcance, aplicación y demás condiciones del carril base son válidos.

La interfaz no implementará una excepción local paralela.

---

#### 17. Denegaciones

La presentación debe respetar la jerarquía canónica:

1. denegación estructural;
2. bloqueo individual transversal;
3. denegación explícita del carril;
4. concesión válida;
5. denegación por defecto.

Un deny aplicable prevalece sobre los allows aplicables dentro del mismo carril.

Por tanto:

```text
ROL BASE PERMITE
+
DENY BASE APLICABLE
→
NO VISIBLE POR CARRIL BASE
```

La tarjeta no podrá reactivar el acceso.

---

#### 18. Matriz base de referencia por rol

Leyenda:

- `HUB` = `HUB_SELF`;
- `V` = `VISIBLE_BASE`;
- `H` = `HIDDEN_BASE`;
- `D` = `DEFERRED_RESERVED`;
- `A` = `ADJACENT_RESERVED`.

| Rol base | SHELL | ANIMA | VISO | NEXO | FOGO | ORIGO | PULSO | NUMERA | AURA | PASS |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `propietario` | HUB | V | V | V | V | V | H | V | D | A |
| `gerente_general` | HUB | V | V | V | V | V | H | V | D | A |
| `gerente` | HUB | V | V | V | V | V | H | V | D | H |
| `supervisor` | HUB | V | V | V | V | V | H | H | D | H |
| `auxiliar_administrativa` | HUB | V | V | V | V | V | H | V | D | H |
| `contador` | HUB | V | V | V | V | V | H | V | D | H |
| `marketing` | HUB | V | V | V | H | H | H | H | D | H |
| `trabajador_operativo` | HUB | V | H | H | H | H | H | H | D | H |

La matriz expresa la proyección de los grants canónicos vigentes.

No reemplaza la evaluación efectiva del actor.

---

#### 19. Conteos de visibilidad base primaria

Excluyendo `shell`, `aura`, `pass` y cualquier expansión operativa:

| Aplicación | Roles base con `VISIBLE_BASE` |
| --- | ---: |
| ANIMA | **8** |
| VISO | **7** |
| NEXO | **7** |
| FOGO | **6** |
| ORIGO | **6** |
| NUMERA | **5** |
| PULSO | **0** |

Total de relaciones rol-base → aplicación primaria:

```text
PRIMARY_BASE_VISIBILITY_EDGES = 39
```

El número sirve como control de reconciliación del snapshot.

No se persiste como fuente de autorización.

---

#### 20. Visibilidad base por rol

| Rol base | Aplicaciones primarias visibles por baseline |
| --- | --- |
| `propietario` | ANIMA, VISO, NEXO, FOGO, ORIGO, NUMERA |
| `gerente_general` | ANIMA, VISO, NEXO, FOGO, ORIGO, NUMERA |
| `gerente` | ANIMA, VISO, NEXO, FOGO, ORIGO, NUMERA |
| `supervisor` | ANIMA, VISO, NEXO, FOGO, ORIGO |
| `auxiliar_administrativa` | ANIMA, VISO, NEXO, FOGO, ORIGO, NUMERA |
| `contador` | ANIMA, VISO, NEXO, FOGO, ORIGO, NUMERA |
| `marketing` | ANIMA, VISO, NEXO |
| `trabajador_operativo` | ANIMA |

SHELL es la superficie que contiene esta selección y no se suma al conteo de tarjetas.

---

#### 21. Regla de ANIMA

ANIMA es visible por baseline para los ocho roles base porque cada uno dispone de `anima.access` dentro del carril base vigente.

La visibilidad de ANIMA no concede:

- administración de trabajadores;
- programación;
- gestión documental ajena;
- permisos internos adicionales.

Cada capacidad interna conserva su permiso exacto.

---

#### 22. Regla de VISO

VISO es visible por baseline para:

```text
propietario
gerente_general
gerente
supervisor
auxiliar_administrativa
contador
marketing
```

No es visible por baseline para:

```text
trabajador_operativo
```

Una concesión individual válida podrá alterar el resultado efectivo del actor sin cambiar el rol base.

---

#### 23. Regla de NEXO

NEXO es visible por baseline para los siete roles base históricos:

```text
propietario
gerente_general
gerente
supervisor
auxiliar_administrativa
contador
marketing
```

`trabajador_operativo` no obtiene NEXO por su rol base.

Como `nexo.access` es `BASE_OR_OPERATIONAL`, NEXO también posee una vía contextual cuya resolución corresponde a `SHELL-APP-003`.

---

#### 24. Regla de FOGO

FOGO es visible por baseline para:

```text
propietario
gerente_general
gerente
supervisor
auxiliar_administrativa
contador
```

No es visible por baseline para:

```text
marketing
trabajador_operativo
```

Como `fogo.access` es `BASE_OR_OPERATIONAL`, la ausencia de visibilidad base no significa ocultamiento permanente para un empleado que posteriormente posea un contexto operativo válido.

---

#### 25. Regla de ORIGO

ORIGO es visible por baseline para:

```text
propietario
gerente_general
gerente
supervisor
auxiliar_administrativa
contador
```

No es visible por baseline para:

```text
marketing
trabajador_operativo
```

`origo.access` admite carril operativo.

La expansión contextual queda reservada a la siguiente tarea.

---

#### 26. Regla de NUMERA

NUMERA es visible por baseline para:

```text
propietario
gerente_general
gerente
auxiliar_administrativa
contador
```

No es visible por baseline para:

```text
supervisor
marketing
trabajador_operativo
```

`numera.access` es `BASE_ONLY`.

Por tanto, un rol operativo no podrá activar NUMERA.

---

#### 27. Regla de PULSO

`pulso.access` es `OPERATIONAL_ONLY`.

La matriz base contiene:

```text
PULSO_VISIBLE_BASE_ROLES = 0
```

Tener un rol base privilegiado no convierte por sí solo PULSO en aplicación visible.

Las concesiones base que actúan como componentes de permisos `BASE_AND_OPERATIONAL` internos no equivalen a `pulso.access`.

PULSO solo podrá adquirir visibilidad laboral cuando `SHELL-APP-003` resuelva un contexto operativo que pueda satisfacer `pulso.access`.

---

#### 28. Regla de AURA

AURA conserva identidad canónica laboral pero roadmap diferido.

La existencia histórica o vigente de `aura.access` no convierte AURA en una aplicación navegable del Hub.

Resultado primario:

```text
AURA
→
DEFERRED_RESERVED
→
PRIMARY_VISIBLE = NO
```

Las concesiones base reservadas observadas para:

```text
propietario
gerente_general
marketing
```

se conservan sin ejecutarse como visibilidad productiva mientras AURA permanezca diferida.

La tarea no elimina esos grants.

---

#### 29. Regla de PASS

Vento Pass es una aplicación de identidad de cliente y alcance adyacente.

No se incorpora al grid laboral primario.

Las concesiones laborales `pass.access` de:

```text
propietario
gerente_general
```

se interpretan únicamente como elegibilidad laboral-administrativa adyacente.

Resultado:

```text
PASS_CUSTOMER_ACCESS
≠
LABOR_RBAC

PASS_LABOR_ADMIN_ELIGIBILITY
≠
PRIMARY_LABOR_HUB_CARD
```

La separación de superficies se desarrolla en `SHELL-APP-011` y `SHELL-APP-012`.

---

#### 30. SHELL no se muestra como aplicación de sí misma

Los ocho roles base poseen `shell.access`.

Ese permiso habilita la entrada laboral al Hub cuando la evaluación efectiva resulta ALLOW.

No se renderiza una tarjeta SHELL dentro de SHELL.

Resultado:

```text
shell
→ HUB_SELF
→ CARD = NO
```

---

#### 31. Aplicación activa no equivale a aplicación visible

Una aplicación puede existir en el catálogo y permanecer oculta o reservada para un actor.

Ejemplos:

```text
AURA
→ catálogo válido
→ roadmap diferido
→ no visible

PULSO
→ catálogo núcleo
→ actor sin contexto operativo
→ no visible por base
```

La mera existencia del registro no es criterio de presentación.

---

#### 32. Permiso de entrada no equivale a capacidad interna

Un `app.access` efectivo permite entrar a la aplicación correspondiente.

No concede:

- módulos;
- acciones;
- datos;
- mutaciones;
- alcances;
- permisos secundarios.

La aplicación destino debe volver a autorizar sus superficies y acciones.

---

#### 33. Visibilidad no equivale a autorización

SHELL puede utilizar una decisión de autorización para determinar presentación.

La presentación resultante nunca será una fuente de autoridad.

Queda prohibido:

```text
CARD_VISIBLE
→ AUTORIZAR_MUTACIÓN
```

y:

```text
CARD_HIDDEN
→ OMITIR_GUARD_DEL_DESTINO
```

Toda operación protegida deberá reevaluarse en servidor según su contrato.

---

#### 34. Roles operativos fuera de la matriz de actor

Los roles operativos no se agregan como filas de la matriz principal porque no son tipos de actor ni responsabilidad permanente.

El catálogo operativo vigente contiene exactamente doce roles:

1. `cajero_satelite`;
2. `barista_satelite`;
3. `cocinero_satelite`;
4. `servicio_salon`;
5. `mostrador_satelite`;
6. `operador_integral_satelite`;
7. `produccion_cocina`;
8. `produccion_panaderia`;
9. `produccion_reposteria`;
10. `bodeguero`;
11. `conductor_logistica`;
12. `gerencia_operativa`.

Su efecto sobre visibilidad queda reservado a `SHELL-APP-003`.

---

#### 35. Handoff de candidatos operativos

Sin decidir todavía las condiciones de turno, sede, área o check-in, la matriz de grants operativos entrega estos candidatos a `SHELL-APP-003`:

| Rol operativo | NEXO | FOGO | ORIGO | PULSO |
| --- | --- | --- | --- | --- |
| `cajero_satelite` | candidato | — | — | candidato |
| `barista_satelite` | candidato | — | — | candidato |
| `cocinero_satelite` | candidato | — | — | candidato |
| `servicio_salon` | candidato | — | — | candidato |
| `mostrador_satelite` | candidato | — | — | candidato |
| `operador_integral_satelite` | candidato | — | — | candidato |
| `produccion_cocina` | candidato | candidato | — | — |
| `produccion_panaderia` | candidato | candidato | — | — |
| `produccion_reposteria` | candidato | candidato | — | — |
| `bodeguero` | candidato | — | candidato | — |
| `conductor_logistica` | candidato | — | — | — |
| `gerencia_operativa` | candidato | candidato | candidato | candidato |

Esta tabla no activa ninguna aplicación.

---

#### 36. Conteos del handoff operativo

| Aplicación | Roles operativos con grant de entrada |
| --- | ---: |
| NEXO | **12** |
| PULSO | **7** |
| FOGO | **4** |
| ORIGO | **2** |
| SHELL | **0** |
| ANIMA | **0** |
| VISO | **0** |
| NUMERA | **0** |
| AURA | **0** |
| PASS | **0** |

Estos conteos son entradas para la siguiente tarea.

No representan número de actores visibles en runtime.

---

#### 37. `HIDDEN_BASE` no significa ocultamiento permanente

Para aplicaciones que admiten carril operativo:

```text
NEXO
FOGO
ORIGO
PULSO
```

la ausencia de base ALLOW significa únicamente:

```text
NO ELEGIBLE POR CARRIL BASE
```

`SHELL-APP-003` deberá decidir si el contexto vigente permite:

- convertirla en visible;
- mostrarla bloqueada;
- mantenerla oculta.

Esta tarea no toma esa decisión contextual.

---

#### 38. Aplicaciones `BASE_ONLY`

Para:

```text
ANIMA
VISO
NUMERA
```

un rol operativo no puede completar un permiso de entrada faltante.

La visibilidad debe depender de un carril base válido.

AURA y PASS también son `BASE_ONLY`, pero sus reglas adicionales de diferimiento y frontera adyacente prevalecen para presentación.

---

#### 39. Aplicaciones `BASE_OR_OPERATIONAL`

Para:

```text
NEXO
FOGO
ORIGO
```

un actor puede llegar a tener elegibilidad por:

```text
BASE_ALLOW COMPLETO
OR
OPERATIONAL_ALLOW COMPLETO
```

Los dos carriles no mezclan fragmentos incompletos.

`SHELL-APP-002` define la parte base.

`SHELL-APP-003` define la parte contextual.

---

#### 40. Aplicación `OPERATIONAL_ONLY`

PULSO requiere carril operativo completo.

Un `BASE_COMPONENT` para una acción sensible interna no se trata como acceso a la aplicación.

La única señal válida para entrada ordinaria es la decisión compatible con:

```text
pulso.access
```

según su modalidad `OPERATIONAL_ONLY`.

---

#### 41. Precedencia de cambios futuros de matrices

Si una concesión canónica cambia después de este snapshot:

1. se actualiza la fuente de autorización correspondiente;
2. la evaluación efectiva refleja la nueva decisión;
3. la matriz de referencia de SHELL debe reconciliarse;
4. no se mantienen listas hardcodeadas divergentes por compatibilidad visual.

La matriz documental no podrá utilizarse para conservar una concesión que ya fue retirada.

---

#### 42. Regla de catálogo único

Los nombres, códigos, destinos, estados y marcas deberán provenir de un catálogo único versionado.

La política de actor decide:

```text
QUÉ IDENTIDADES SON PRESENTABLES
```

No vuelve a definir:

```text
CÓDIGO
NOMBRE
URL
LOGO
ESTADO DE CICLO DE VIDA
```

Estas propiedades pertenecen a sus contratos propietarios.

---

#### 43. Regla de ausencia

Si una aplicación no aparece como visible para un actor:

- no se agrega un enlace oculto manipulable;
- no se genera un destino alternativo por inferencia;
- no se reemplaza por otra aplicación;
- no se concede acceso implícito al escribir la URL.

El destino sigue protegiendo su propia autorización.

---

#### 44. Regla de simulación

La simulación no cambia el tipo real de actor ni convierte una selección de interfaz en autoridad.

Una futura experiencia de simulación deberá:

- ser explícita;
- estar autorizada;
- expirar;
- auditarse;
- validarse en servidor.

Una cookie o estado de cliente no podrá ampliar la matriz efectiva.

---

#### 45. Regla de actor con múltiples fuentes de permiso

Un mismo empleado puede recibir concesiones desde rol base y concesiones individuales.

La presentación utiliza la decisión efectiva de autorización y no intenta adivinar qué fuente “ganó”.

No se mostrará información sensible sobre:

- grant exacto;
- deny exacto;
- tabla de origen;
- evidencia interna de decisión.

La explicación pública de bloqueo queda reservada a `SHELL-APP-010`.

---

#### 46. Resultado para actor `EMPLOYEE`

El algoritmo documental queda:

```text
1. Resolver actor efectivo.
2. Exigir EMPLOYEE válido y activo.
3. Confirmar shell.access efectivo para ingresar al Hub.
4. Cargar catálogo canónico.
5. Excluir shell de la cuadrícula porque es HUB_SELF.
6. Marcar AURA como DEFERRED_RESERVED.
7. Mantener PASS fuera del grid primario laboral.
8. Para apps BASE_ONLY o BASE_OR_OPERATIONAL:
   evaluar carril base de app.access.
9. VISIBLE_BASE solo cuando el carril base da ALLOW.
10. HIDDEN_BASE cuando no existe ALLOW base.
11. No resolver aquí promociones por contexto operativo.
12. No usar la visibilidad para autorizar acciones.
```

---

#### 47. Resultado para actores no laborales

```text
CUSTOMER
→ NO_INTERACTIVE_LABOR_HUB

SYSTEM
→ NO_INTERACTIVE_HUB

UNRESOLVED
→ NO_INTERACTIVE_HUB
→ FAIL_CLOSED
```

No existe un fallback “mostrar todas bloqueadas” para estos tipos de actor.

---

#### 48. Resultado cuantitativo consolidado

```text
ACTOR_TYPES = 4
EMPLOYEE_BASE_ROLES = 8
CANONICAL_APPS = 10

PRIMARY_BASE_APPS = 6
PRIMARY_CONTEXT_ONLY_APPS = 1
DEFERRED_APPS = 1
ADJACENT_APPS = 1
HUB_SELF_APPS = 1

PRIMARY_BASE_VISIBILITY_EDGES = 39

BASE_VISIBLE_ANIMA = 8
BASE_VISIBLE_VISO = 7
BASE_VISIBLE_NEXO = 7
BASE_VISIBLE_FOGO = 6
BASE_VISIBLE_ORIGO = 6
BASE_VISIBLE_NUMERA = 5
BASE_VISIBLE_PULSO = 0

OPERATIONAL_ROLES = 12
OP_CANDIDATE_NEXO = 12
OP_CANDIDATE_PULSO = 7
OP_CANDIDATE_FOGO = 4
OP_CANDIDATE_ORIGO = 2
```

---

#### 49. Handoff exacto a `SHELL-APP-003`

La siguiente tarea recibe:

1. cuatro tipos de actor;
2. ocho roles base;
3. diez aplicaciones canónicas;
4. clasificación de presentación por aplicación;
5. matriz base de 39 relaciones primarias;
6. reglas de grants individuales y denies;
7. doce roles operativos sin convertirlos en actores;
8. matriz de candidatos operativos;
9. NEXO con 12 roles operativos candidatos;
10. PULSO con 7;
11. FOGO con 4;
12. ORIGO con 2;
13. prohibición de usar contexto de cliente para autorizar el Hub laboral;
14. AURA diferida;
15. PASS adyacente;
16. regla de que `HIDDEN_BASE` no significa ocultamiento permanente para apps con carril operativo;
17. prohibición de mezclar fragmentos de carril base y operativo.

`SHELL-APP-003` deberá resolver exactamente el efecto de:

- turno;
- sede;
- área;
- rol operativo;
- check-in cuando aplique;
- contexto inválido, ausente o expirado.

---

#### 50. No se adelanta `SHELL-APP-003`

Esta tarea no decide:

- si una aplicación contextual se muestra antes del turno;
- si una app contextual se muestra bloqueada o se oculta;
- qué sede habilita una aplicación;
- qué área habilita una aplicación;
- si el check-in modifica visibilidad;
- qué ocurre ante dos contextos territoriales;
- qué estado visual corresponde a contexto inválido.

Esas decisiones pertenecen a `SHELL-APP-003`.

---

#### 51. No se adelantan tareas posteriores

No se desarrolla aquí:

- visualización de turno;
- visualización de sede;
- visualización de área;
- visualización de rol operativo;
- pendientes transversales;
- página inicial por tipo de usuario;
- explicación del bloqueo;
- separación visual final de superficies adyacentes;
- retorno entre aplicaciones;
- persistencia de contexto;
- comportamiento por dispositivo.

Cada responsabilidad conserva su tarea reservada en H2.

---

#### 52. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0
**Requisitos modificados:** 0

La tarea proyecta decisiones ya protegidas por los contratos vigentes de catálogo, autorización, modalidad, denegaciones y visibilidad de SHELL.

No crea una segunda fuente de permisos ni una regla de seguridad independiente.

---

#### 53. Cobertura de prueba vigente reutilizada

Sin modificar el Registro Canónico de Requisitos de Prueba, esta tarea reutiliza:

- `TREQ-SHELL-001` — una aplicación no se considera disponible por su mera existencia o permiso;
- `TREQ-SHELL-003` — identidad, nombre, destino, estado, marca y disponibilidad desde catálogo canónico;
- `TREQ-SHELL-015` — disponibilidad del launcher derivada de decisión canónica de permiso;
- `TREQ-SHELL-016` — aplicación sin acceso efectivo no navegable;
- `TREQ-SHELL-028` — catálogo único versionado para launcher y navegación;
- `TREQ-SHELL-030` — visibilidad derivada de permisos y contexto sin sustituir autorización de servidor;
- `TREQ-SHELL-031` — simulación separada de autoridad.

La exactitud de roles, grants, modalidades y denegaciones continúa protegida por los requisitos de autorización ya existentes en sus bloques propietarios.

Esta sección es trazabilidad heredada y no modifica 04A.

---

#### 54. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | El artefacto todavía no ha sido insertado y compilado dentro de la rama local de `SHELL-APP-002`. |
| LOCAL | NOT_EXECUTED | Todavía no se han ejecutado format, quality, delivery ni la batería documental sobre el checkout local de la tarea. |
| REMOTA | PASS | Se verificaron el `main` posterior al cierre de `SHELL-APP-001`, continuidad, topología, políticas documentales, owner H2, catálogo de aplicaciones, tipos de actor, precedencia, denegaciones, modalidades, datasets de grants, sucesor de ocho roles, matriz de doce roles operativos, 04A SHELL y scripts de validación. |
| OPERATIVA | NOT_APPLICABLE | La tarea define política documental; no prueba sesiones, usuarios, permisos o aplicaciones desplegadas en ambientes reales. |
| FÍSICA | NOT_APPLICABLE | No crea ni autoriza una instancia `SHELL-APP-002::implementation_unit_id` y no modifica runtime, datos ni infraestructura. |

---

#### 55. Criterios de aceptación

- [ ] El título es exactamente `SHELL-APP-002 — Definir aplicaciones visibles por actor`.
- [ ] `SHELL-APP-001` permanece como tarea anterior.
- [ ] `SHELL-APP-003` permanece como siguiente tarea.
- [ ] La conversación y el artefacto permanecen en carril documental.
- [ ] La topología `PER_IMPLEMENTATION_UNIT` no se interpreta como autorización física.
- [ ] Se conservan exactamente cuatro tipos de actor.
- [ ] Solo `EMPLOYEE` participa en el grid laboral.
- [ ] `CUSTOMER` no recibe RBAC laboral por identidad de cliente.
- [ ] `SYSTEM` no recibe Hub interactivo.
- [ ] `UNRESOLVED` falla cerrado.
- [ ] Se conservan exactamente ocho roles base.
- [ ] `trabajador_operativo` se trata como sucesor canónico vigente y no se pierde por usar el baseline histórico de siete roles.
- [ ] Se conservan exactamente diez aplicaciones.
- [ ] SHELL se clasifica `HUB_SELF`.
- [ ] ANIMA, VISO y NUMERA se clasifican como entradas primarias de carril base.
- [ ] NEXO, FOGO y ORIGO conservan doble posibilidad base u operativa.
- [ ] PULSO no recibe visibilidad base.
- [ ] AURA permanece diferida.
- [ ] PASS permanece fuera del grid laboral primario.
- [ ] La matriz contiene exactamente ocho filas de rol base.
- [ ] La matriz contiene exactamente diez columnas de aplicación.
- [ ] ANIMA tiene ocho roles base visibles.
- [ ] VISO tiene siete.
- [ ] NEXO tiene siete.
- [ ] FOGO tiene seis.
- [ ] ORIGO tiene seis.
- [ ] NUMERA tiene cinco.
- [ ] PULSO tiene cero.
- [ ] El total de relaciones primarias base es 39.
- [ ] `propietario` y `gerente_general` conservan elegibilidad laboral-administrativa adyacente hacia PASS sin convertirla en acceso de cliente.
- [ ] Las concesiones AURA existentes no vuelven navegable una aplicación diferida.
- [ ] Una concesión individual base válida puede ampliar la baseline del rol.
- [ ] Un deny aplicable puede restringirla según precedencia canónica.
- [ ] La matriz no se declara segunda fuente de autorización.
- [ ] La visibilidad no se utiliza para autorizar acciones.
- [ ] Se conservan exactamente doce roles operativos en el handoff.
- [ ] NEXO recibe doce candidatos operativos.
- [ ] PULSO recibe siete.
- [ ] FOGO recibe cuatro.
- [ ] ORIGO recibe dos.
- [ ] Los roles operativos no se denominan tipos de actor.
- [ ] No se resuelven turno, sede, área ni check-in dentro de esta tarea.
- [ ] `HIDDEN_BASE` no se interpreta como ocultamiento permanente para una app compatible con carril operativo.
- [ ] No se mezclan fragmentos incompletos de los dos carriles.
- [ ] No se desarrolla `SHELL-APP-003`.
- [ ] No se crean requisitos de prueba.
- [ ] No se modifican requisitos de prueba.
- [ ] No se modifica 04A.
- [ ] No se modifica código.
- [ ] No se modifica Supabase.
- [ ] No se autoriza implementación física.

---

#### 56. Límites

Esta tarea no:

- modifica el catálogo de aplicaciones;
- modifica los roles base;
- modifica los roles operativos;
- modifica `role_permissions`;
- modifica `employee_permissions`;
- modifica `operational_role_permissions`;
- crea grants;
- crea denies;
- cambia modalidades;
- cambia precedencia;
- cambia el estado de AURA;
- convierte PASS en aplicación laboral de cliente;
- crea tarjetas;
- elimina tarjetas;
- cambia `src/app/page.tsx`;
- cambia `/login`;
- cambia destinos;
- cambia logos;
- cambia textos;
- cambia middleware;
- define razones públicas de bloqueo;
- define visibilidad por turno;
- define visibilidad por sede;
- define visibilidad por área;
- define visibilidad por rol operativo activo;
- define comportamiento por check-in;
- define página inicial;
- define navegación de retorno;
- define persistencia de contexto;
- implementa simulación;
- modifica Supabase;
- modifica Auth;
- modifica RLS;
- modifica RPC;
- modifica datos;
- crea migraciones;
- despliega;
- crea `implementation_unit_id`;
- autoriza una instancia física;
- crea requisitos de prueba;
- modifica requisitos de prueba;
- modifica el Registro Canónico de Requisitos de Prueba;
- desarrolla `SHELL-APP-003`.

---

#### 57. Continuidad

**ÚLTIMA TAREA APROBADA**
`SHELL-APP-001 — Inventariar la experiencia actual del hub`

**TAREA ACTUAL APROBADA**
`SHELL-APP-002 — Definir aplicaciones visibles por actor`

**SIGUIENTE TAREA RESERVADA**
`SHELL-APP-003 — Definir aplicaciones visibles por contexto`


### ✅ SHELL-APP-003 — Definir aplicaciones visibles por contexto

**Estado:** APROBADA
**Tarea anterior:** SHELL-APP-002 — Definir aplicaciones visibles por actor
**Tarea siguiente:** SHELL-APP-004 — Mostrar turno activo
**Tipo de tarea:** definición técnico-documental de la política contextual de visibilidad del Hub; el marcador canónico define una sola vez el contrato y su futura materialización conserva topología `PER_IMPLEMENTATION_UNIT`, sin crear ni autorizar una instancia física en esta tarea
**Bloque:** BLOQUE H2 — SHELL como aplicación
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H2_SHELL_APP/01_INVENTARIO_Y_VISIBILIDAD_DE_APLICACIONES.md`
**Estado físico resultante:** política documental de visibilidad contextual definida sobre `AccessContext`, decisiones de autorización y matrices vigentes, sin modificar el runtime del Hub
**Cambios físicos autorizados:** ninguno; no se modifican código, navegación runtime, permisos, matrices, Supabase, datos, dominios, despliegues ni configuración
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir cómo el Hub Vento OS decide la visibilidad de aplicaciones cuando un actor laboral puede adquirir capacidades por contexto operativo.

La tarea consume la política por actor aprobada en `SHELL-APP-002` y resuelve exactamente el efecto de:

- turno;
- sede operativa;
- área operativa;
- rol operativo;
- check-in cuando aplique;
- contexto ausente;
- contexto inválido;
- contexto ambiguo;
- contexto expirado;
- concesiones o denegaciones operativas aplicables.

La decisión deberá preservar la independencia entre carril base y carril operativo.

La regla general queda:

```text
VISIBILIDAD POR ACTOR
+
ACCESS CONTEXT CANÓNICO
+
DECISIÓN EFECTIVA DE app.access
+
CICLO DE VIDA DE LA APLICACIÓN
→
VISIBILIDAD CONTEXTUAL FINAL
```

Esta tarea decide qué aplicaciones puede presentar SHELL por contexto.

No diseña todavía la representación visual del turno, sede, área o rol operativo.

---

#### 2. Entradas heredadas de `SHELL-APP-002`

Se consumen sin reabrir las siguientes decisiones:

```text
ACTOR_TYPES = 4
BASE_ROLES = 8
CANONICAL_APPS = 10
PRIMARY_BASE_VISIBILITY_EDGES = 39
OPERATIONAL_ROLES = 12

OP_CANDIDATE_NEXO = 12
OP_CANDIDATE_PULSO = 7
OP_CANDIDATE_FOGO = 4
OP_CANDIDATE_ORIGO = 2
```

También se conserva:

- `shell` como `HUB_SELF`;
- AURA como `DEFERRED_RESERVED`;
- PASS como `ADJACENT_RESERVED`;
- ANIMA, VISO y NUMERA como aplicaciones de entrada exclusivamente base;
- NEXO, FOGO y ORIGO como aplicaciones con carril base u operativo;
- PULSO como aplicación de entrada exclusivamente operativa;
- la prohibición de tratar la matriz documental como fuente de autorización;
- la prohibición de mezclar fragmentos incompletos de los carriles.

---

#### 3. Decisión principal

SHELL no calculará visibilidad contextual mediante una lista local de:

```text
rol → aplicaciones
```

La autoridad será la decisión canónica del permiso de entrada de cada aplicación.

Flujo:

```text
ACTOR EMPLOYEE VÁLIDO
        ↓
ACCESS CONTEXT RESUELTO EN SERVIDOR
        ↓
PERMISO EXACTO DE ENTRADA
        ↓
MODALIDAD DEL PERMISO
        ↓
CARRIL BASE Y/O OPERATIVO
        ↓
GRANTS + DENIES + CONTEXTO
        ↓
AUTHORIZATION DECISION
        ↓
POLÍTICA DE PRESENTACIÓN DE SHELL
```

La tabla rol operativo → aplicación se conserva únicamente como baseline y control de reconciliación.

No sustituye la evaluación efectiva del actor.

---

#### 4. Fuente canónica del contexto

La fuente conceptual de contexto es `AccessContext`.

SHELL deberá tratarlo como:

```text
SNAPSHOT INMUTABLE
+
RESUELTO EN SERVIDOR
+
VERSIONADO
+
ATRIBUIBLE
```

El contexto contiene hechos de:

- actor efectivo;
- empleado;
- rol base;
- asignaciones;
- cobertura administrativa;
- turno;
- check-in;
- rol operativo;
- sede operativa;
- área operativa;
- dispositivo;
- readiness por carril;
- problemas estructurales.

El contexto no contiene la decisión final de autorización.

Por tanto:

```text
AccessContext
≠
AuthorizationDecision
```

---

#### 5. Precondición de actor

La expansión contextual del Hub solo aplica cuando:

```text
actor_effective.actor_type = EMPLOYEE
```

y el empleado es válido y activo.

Los demás tipos conservan la decisión anterior:

```text
CUSTOMER
→ sin grid laboral

SYSTEM
→ sin Hub interactivo humano

UNRESOLVED
→ fail closed
→ sin grid laboral
```

El contexto operativo no convierte una identidad no laboral en empleado.

---

#### 6. Entrada al propio Hub

Antes de evaluar tarjetas:

```text
shell.access
```

debe producir una autorización laboral válida por su carril `BASE_ONLY`.

Un rol operativo no puede conceder `shell.access`.

Por tanto:

```text
SIN shell.access EFECTIVO
→ NO HUB LABORAL
→ NO EVALUACIÓN DE TARJETAS COMO FUENTE DE ACCESO
```

SHELL continúa siendo `HUB_SELF` y no se representa como tarjeta de sí mismo.

---

#### 7. Independencia del carril base

La existencia, ausencia o fallo ordinario del contexto operativo no elimina por sí solo una autorización base válida.

Para aplicaciones `BASE_OR_OPERATIONAL`:

```text
BASE_ALLOW COMPLETO
OR
OPERATIONAL_ALLOW COMPLETO
→
PUEDE PRODUCIR ENTRADA
```

Los carriles son independientes.

Ejemplo:

```text
NEXO base = ALLOW
operativo = UNAVAILABLE
→ NEXO continúa visible por base
```

No se permite:

```text
permiso desde base
+
sede desde operativo
→ ALLOW
```

ni:

```text
permiso desde operativo
+
alcance administrativo desde base
→ ALLOW
```

Cada carril debe ser completo por sí mismo.

---

#### 8. Bloqueos estructurales transversales

Un problema `BLOCKING_ALL` invalida toda visibilidad laboral.

Ejemplos conceptuales:

- empleado inactivo;
- actor laboral no resoluble;
- sesión técnica inválida cuando sea obligatoria;
- identidad laboral incompatible;
- contrato de contexto inválido.

Resultado:

```text
BLOCKING_ALL
→ NO BASE
→ NO OPERATIVO
→ NO GRID LABORAL AUTORIZADO
```

Una tarjeta previamente visible no conserva autoridad mediante caché o estado cliente.

---

#### 9. Aplicaciones que pueden adquirir visibilidad por contexto

Solo cuatro aplicaciones del catálogo vigente admiten entrada por carril operativo:

| Aplicación | Permiso de entrada | Modalidad | Prerrequisito operativo |
| --- | --- | --- | --- |
| NEXO | `nexo.access` | `BASE_OR_OPERATIONAL` | `T` |
| FOGO | `fogo.access` | `BASE_OR_OPERATIONAL` | `T` |
| ORIGO | `origo.access` | `BASE_OR_OPERATIONAL` | `T` |
| PULSO | `pulso.access` | `OPERATIONAL_ONLY` | `T` |

Ninguna otra aplicación puede volverse visible únicamente por turno, sede, área, rol operativo o check-in.

---

#### 10. Aplicaciones no expandibles por contexto operativo

No reciben entrada operativa:

```text
ANIMA
VISO
NUMERA
AURA
PASS
SHELL
```

Reglas:

- ANIMA conserva `BASE_ONLY`;
- VISO conserva `BASE_ONLY`;
- NUMERA conserva `BASE_ONLY`;
- AURA conserva `BASE_ONLY` y además permanece diferida;
- PASS conserva `BASE_ONLY` dentro de su frontera laboral-administrativa adyacente;
- SHELL conserva `BASE_ONLY` y función `HUB_SELF`.

Un turno no completa un permiso faltante de estas aplicaciones.

---

#### 11. Significado de prerrequisito `T`

Para los cuatro permisos de entrada operativos:

```text
T
=
TURNO PUBLICADO Y VIGENTE REQUERIDO
+
CHECK-IN ACTIVO NO REQUERIDO
```

Por tanto:

```text
TURNO VIGENTE
+
ROL OPERATIVO VÁLIDO
+
CONTEXTO TERRITORIAL VÁLIDO
+
app.access OPERATIVO = ALLOW
+
SIN CHECK-IN
→
LA APLICACIÓN PUEDE SER NAVEGABLE
```

El Hub no exigirá check-in para mostrar o abrir una aplicación cuyo permiso de entrada sea `T`.

---

#### 12. Turno publicado no equivale a turno vigente

Un turno publicado futuro no habilita visibilidad contextual antes de su ventana.

Se conserva:

```text
PUBLICADO
≠
VIGENTE
```

La entrada operativa exige que el turno:

- pertenezca al actor efectivo;
- corresponda a una revisión publicada;
- sea laboral;
- no esté cancelado;
- no esté retirado;
- esté dentro de la ventana temporal autorizada;
- posea sede válida;
- posea rol operativo válido;
- no sea ambiguo frente a otro turno elegible.

La confirmación del trabajador no participa en esta decisión.

---

#### 13. Turno vigente no equivale a turno activo

Se conserva la semántica canónica:

```text
TURNO ACTIVO
=
TURNO VIGENTE
+
CHECK-IN ACTIVO
```

Sin embargo, la visibilidad contextual de las cuatro aplicaciones utiliza permisos `T`.

Por tanto:

```text
TURNO VIGENTE SIN CHECK-IN
→ puede habilitar app.access

TURNO ACTIVO
→ puede habilitar además capacidades internas T+C
```

Esta tarea no redefine el término “turno activo”.

---

#### 14. Efecto del check-in ausente

Cuando existe turno vigente compatible y no existe check-in activo:

```text
nexo.access
fogo.access
origo.access
pulso.access
```

pueden autorizarse por el carril operativo si las demás condiciones se cumplen.

El check-in ausente no debe:

- ocultar automáticamente la aplicación;
- convertirla en no navegable;
- crear un deny artificial para `app.access`;
- sustituir la evaluación de permisos internos.

La aplicación destino deberá bloquear las capacidades `T+C` hasta que exista check-in activo.

---

#### 15. Efecto de un check-in activo compatible

Un check-in activo y compatible:

- no concede una aplicación por sí mismo;
- no crea permisos;
- no cambia el rol operativo;
- no cambia la sede del turno;
- no amplía el área;
- no transforma una ausencia de grant en ALLOW.

Su función es permitir satisfacer prerrequisitos `T+C` dentro de la aplicación.

Para visibilidad:

```text
APP_ACCESS T
+
CHECK-IN COMPATIBLE
→
MISMA ELEGIBILIDAD DE ENTRADA
```

El cambio principal ocurre en las capacidades internas de la aplicación, no en el permiso de entrada.

---

#### 16. Efecto de un check-in incompatible

Aunque `app.access` use `T`, un check-in activo incompatible constituye conflicto estructural del carril operativo.

Ejemplos:

- check-in de otro turno;
- check-in de otra sede;
- check-in de otro actor;
- múltiples check-ins activos;
- sesión activa inválida;
- revisión retirada.

Resultado:

```text
CHECK-IN INCOMPATIBLE
→ BLOCKING_OPERATIONAL
→ EL CARRIL OPERATIVO NO AUTORIZA app.access
```

Una autorización base independiente de NEXO, FOGO u ORIGO puede seguir siendo válida si el problema no es `BLOCKING_ALL`.

PULSO no dispone de esa vía base.

---

#### 17. Check-in cerrado, expirado u offline pendiente

Un check-in:

```text
cerrado
expirado
solo pendiente en cliente
solo pendiente offline
```

no se considera activo.

Si no constituye una inconsistencia estructural y el turno continúa vigente:

```text
app.access T
→ puede continuar evaluándose
```

Las capacidades `T+C` permanecen bloqueadas.

Una intención de check-in no puede convertirse en autoridad.

---

#### 18. Fuente de la sede operativa

La sede operativa procede exclusivamente del turno válido.

```text
operational_site
=
active_shift.site
```

No se utilizará como sustituto:

- sede seleccionada;
- sede primaria;
- `employees.site_id` legacy;
- última sede usada;
- sede propuesta por cliente;
- sede del dispositivo sin reconciliación;
- geocerca;
- IP;
- GPS.

La sede seleccionada continúa siendo navegación administrativa, no autoridad.

---

#### 19. Validación de sede para visibilidad contextual

Para que el carril operativo pueda autorizar una aplicación:

- la sede del turno debe existir;
- debe estar activa;
- debe ser operativamente admisible;
- debe ser compatible con el rol operativo;
- debe ser compatible con el grant exacto;
- no debe existir conflicto territorial aplicable.

Resultado:

```text
SEDE OPERATIVA INVÁLIDA
→ CARRIL OPERATIVO INVALID
→ app.access OPERATIVO NO AUTORIZA
```

No se aplica fallback a sede primaria.

---

#### 20. Fuente del área operativa

Cuando corresponda:

```text
operational_area
=
active_shift.area
```

No se obtiene de:

- `employee_areas` como autoridad operativa;
- área seleccionada;
- área primaria;
- nombre del rol;
- producto;
- recurso;
- dispositivo;
- última área utilizada;
- estado de interfaz.

`employee_areas` conserva afiliación habitual.

El turno conserva la asignación operativa.

---

#### 21. Entrada `SITE_SUFFICIENT` y restricciones del rol

Los cuatro permisos de entrada:

```text
nexo.access
fogo.access
origo.access
pulso.access
```

están clasificados como `SITE_SUFFICIENT` para el requisito general de área.

Esto significa que el permiso de entrada no impone universalmente un área a todos los roles.

No significa:

```text
AREA IGNORADA
```

La concesión concreta del rol puede exigir un área exacta o un tipo de área.

Ejemplo:

```text
cajero_satelite
+
nexo.access
→ exige área operativa compatible con cashier
```

Por tanto, SHELL evalúa el permiso completo y su scope.

No simplifica la regla a la clasificación `SITE_SUFFICIENT`.

---

#### 22. Roles que exigen área concreta

Las matrices operativas vigentes exigen área concreta para funciones localizadas como:

- caja satélite;
- barra satélite;
- cocina satélite;
- servicio de salón;
- mostrador;
- producción de Cocina Caliente;
- producción de Galletería y Panadería;
- producción de Repostería;
- bodega.

La ausencia o incompatibilidad de área en esos contextos impide que la concesión operativa de entrada sea completa.

Un rol legítimamente site-wide puede conservar área nula cuando su contrato lo permite.

---

#### 23. Rol operativo efectivo

El rol operativo procede exclusivamente del turno válido.

```text
operational_role
=
active_shift.operational_role
```

No puede provenir de:

- rol base;
- `navigation_role`;
- oficio legacy;
- rol predeterminado;
- dispositivo;
- área;
- selector cliente;
- cookie;
- último turno;
- simulación.

Un rol operativo no válido o no habilitado para la sede y área aplicables bloquea el carril operativo.

---

#### 24. Matriz baseline de candidatos operativos

Se conserva exactamente el handoff de `SHELL-APP-002`:

| Rol operativo | NEXO | FOGO | ORIGO | PULSO |
| --- | --- | --- | --- | --- |
| `cajero_satelite` | candidato | — | — | candidato |
| `barista_satelite` | candidato | — | — | candidato |
| `cocinero_satelite` | candidato | — | — | candidato |
| `servicio_salon` | candidato | — | — | candidato |
| `mostrador_satelite` | candidato | — | — | candidato |
| `operador_integral_satelite` | candidato | — | — | candidato |
| `produccion_cocina` | candidato | candidato | — | — |
| `produccion_panaderia` | candidato | candidato | — | — |
| `produccion_reposteria` | candidato | candidato | — | — |
| `bodeguero` | candidato | — | candidato | — |
| `conductor_logistica` | candidato | — | — | — |
| `gerencia_operativa` | candidato | candidato | candidato | candidato |

Esta tabla continúa siendo una baseline.

No es una allowlist de frontend.

---

#### 25. Conteos baseline del contexto

| Aplicación | Roles operativos con grant baseline de entrada |
| --- | ---: |
| NEXO | **12** |
| PULSO | **7** |
| FOGO | **4** |
| ORIGO | **2** |

Total:

```text
OPERATIONAL_BASELINE_VISIBILITY_EDGES = 25
```

La cifra valida la reconciliación documental.

No representa el número de usuarios autorizados.

---

#### 26. Perfil contextual por rol operativo

| Rol operativo | Aplicaciones baseline | Contexto mínimo adicional a validar |
| --- | --- | --- |
| `cajero_satelite` | NEXO, PULSO | turno vigente, sede satélite habilitada, área `cashier` compatible |
| `barista_satelite` | NEXO, PULSO | turno vigente, sede satélite habilitada, área `bar` compatible |
| `cocinero_satelite` | NEXO, PULSO | turno vigente, sede satélite habilitada, área `kitchen` compatible |
| `servicio_salon` | NEXO, PULSO | turno vigente, sede satélite habilitada, área `service` compatible |
| `mostrador_satelite` | NEXO, PULSO | turno vigente, sede satélite habilitada, área de Mostrador compatible |
| `operador_integral_satelite` | NEXO, PULSO | turno vigente, sede habilitada para formato integrado y área exacta cuando la configuración la exija |
| `produccion_cocina` | NEXO, FOGO | turno vigente, Centro de Producción y Cocina Caliente |
| `produccion_panaderia` | NEXO, FOGO | turno vigente, Centro de Producción y Galletería y Panadería |
| `produccion_reposteria` | NEXO, FOGO | turno vigente, Centro de Producción y Repostería |
| `bodeguero` | NEXO, ORIGO | turno vigente, sede autorizada y área `warehouse` compatible |
| `conductor_logistica` | NEXO | turno vigente, sede logística y contexto válido de asignación, ruta o vehículo según el grant |
| `gerencia_operativa` | NEXO, FOGO, ORIGO, PULSO | turno vigente, sede activa y territorio compatible con la capacidad evaluada |

El check-in no forma parte del mínimo de entrada porque estos permisos usan `T`.

---

#### 27. Excepciones individuales operativas

La baseline del rol no es la única fuente posible de allow operativo.

El carril operativo también puede recibir una concesión individual válida y compatible.

Por tanto:

```text
OPERATIONAL_ROLE_ALLOW
OR
EMPLOYEE_OPERATIONAL_ALLOW
→
PUEDE PRODUCIR OPERATIONAL_ALLOW
```

antes de aplicar denegaciones y contexto.

Consecuencia:

un empleado puede adquirir visibilidad contextual de una de las cuatro aplicaciones aunque su rol operativo no tenga ese grant en la baseline, únicamente si existe una concesión individual operativa válida, compatible con la modalidad, scope, vigencia y recurso de entrada.

SHELL no hardcodeará el resultado de la baseline como límite absoluto.

---

#### 28. Denegaciones operativas

Una denegación aplicable del carril operativo prevalece sobre los allows operativos aplicables.

Resultado:

```text
ALLOW DE ROL
OR ALLOW INDIVIDUAL
+
DENY OPERATIVO APLICABLE
→
OPERATIVE DECISION = DENY
```

La presentación no expondrá:

- nombre del grant;
- nombre del deny;
- tabla de origen;
- detalles internos de matrices;
- evidencia sensible.

La explicación pública se resolverá mediante los contratos de mensajes correspondientes.

---

#### 29. Estado `CONTEXT_VISIBLE`

Se define:

```text
CONTEXT_VISIBLE
```

cuando:

1. el actor laboral es válido;
2. la aplicación admite carril operativo;
3. el catálogo permite presentarla;
4. el contexto aplicable es resoluble;
5. la decisión efectiva de `app.access` autoriza por el carril operativo.

Resultado:

```text
CONTEXT_VISIBLE
→ tarjeta presentable
→ destino navegable
```

La navegación no concede capacidades internas.

---

#### 30. Estado `CONTEXT_BLOCKED`

Se define:

```text
CONTEXT_BLOCKED
```

cuando la aplicación es contextualmente relevante para el actor, pero la decisión efectiva de entrada no produce ALLOW por una condición contextual o una denegación aplicable.

Ejemplos:

- área requerida por el grant ausente;
- área incompatible;
- sede incompatible;
- check-in activo incompatible;
- rol operativo no habilitado en el territorio;
- deny operativo aplicable;
- aplicación temporalmente no navegable por una condición gobernada.

Resultado:

```text
CONTEXT_BLOCKED
→ puede presentarse como bloqueada
→ no tiene navegación habilitada
```

La tarjeta bloqueada nunca sustituye la razón pública gobernada ni el guard del destino.

---

#### 31. Estado `CONTEXT_HIDDEN`

Se define:

```text
CONTEXT_HIDDEN
```

cuando no existe elegibilidad contextual actual que justifique presentar la aplicación.

Ejemplos:

- no existe turno vigente;
- el turno es futuro;
- el turno expiró;
- el turno fue retirado o cancelado;
- no existe rol operativo resoluble;
- no existe grant de entrada aplicable, ni de rol ni individual;
- la aplicación no admite carril operativo.

Resultado:

```text
CONTEXT_HIDDEN
→ no tarjeta contextual
```

La ausencia visual no equivale a deny del resto del sistema.

---

#### 32. Precedencia de presentación final

Para cada aplicación:

```text
1. aplicar frontera de actor;
2. aplicar estado del catálogo;
3. aplicar reservas especiales;
4. evaluar carril base cuando exista;
5. evaluar carril operativo cuando exista;
6. combinar según modalidad;
7. aplicar política de presentación;
```

Para NEXO, FOGO y ORIGO:

```text
BASE_ALLOW
→ VISIBLE_BASE

si no hay BASE_ALLOW:
    OPERATIONAL_ALLOW
    → CONTEXT_VISIBLE

si no hay ALLOW:
    relevancia contextual con bloqueo
    → CONTEXT_BLOCKED

en otro caso
    → CONTEXT_HIDDEN
```

Para PULSO:

```text
OPERATIONAL_ALLOW
→ CONTEXT_VISIBLE

relevancia contextual con bloqueo
→ CONTEXT_BLOCKED

sin elegibilidad contextual actual
→ CONTEXT_HIDDEN
```

---

#### 33. Contexto operativo inválido no revoca un base ALLOW independiente

Para una aplicación `BASE_OR_OPERATIONAL`:

```text
BASE_DECISION = ALLOW
OPERATIONAL_DECISION = DENY
```

no produce automáticamente ocultamiento.

Resultado:

```text
VISIBLE_BASE
```

si el deny operativo no es un bloqueo transversal.

El usuario podrá entrar por su autoridad base.

Dentro de la aplicación, una operación que dependa del carril operativo seguirá siendo evaluada independientemente.

---

#### 34. Ausencia de turno vigente

Cuando:

```text
active_shift = null
```

por ausencia legítima de turno vigente:

```text
operational lane = UNAVAILABLE
```

La ausencia no invalida el carril base.

Resultado:

- ANIMA, VISO y NUMERA conservan su evaluación base;
- NEXO, FOGO y ORIGO conservan visibilidad si existe base ALLOW;
- PULSO no adquiere visibilidad contextual;
- las aplicaciones operativas sin base ALLOW quedan `CONTEXT_HIDDEN`.

No se utilizará el último turno conocido como fallback.

---

#### 35. Turno futuro publicado

Un turno futuro:

```text
publicado
+
fuera de la ventana vigente
```

no crea contexto operativo actual.

Por tanto:

```text
FUTURE_SHIFT
→ NO CONTEXT_VISIBLE
```

La programación futura podrá mostrarse en sus superficies propietarias.

No activa aplicaciones antes de tiempo.

---

#### 36. Turno vigente sin check-in

Este es un caso explícitamente permitido para los permisos de entrada `T`.

Resultado conceptual:

```text
TURN = vigente
CHECKIN = null
ROLE = válido
SITE = válida
AREA = válida cuando el grant la exige
APP_ACCESS = ALLOW
→ CONTEXT_VISIBLE
```

La aplicación destino podrá mostrar que las operaciones presenciales requieren registrar entrada.

SHELL no simula esas operaciones.

---

#### 37. Turno vigente con check-in compatible

Resultado:

```text
TURN = vigente
CHECKIN = activo y compatible
APP_ACCESS = ALLOW
→ CONTEXT_VISIBLE
```

La presencia del check-in puede habilitar permisos internos `T+C`.

No transforma `app.access` en wildcard.

---

#### 38. Ambigüedad entre turnos

Cuando existen varios turnos simultáneamente elegibles sin resolución inequívoca:

```text
SHIFT_OVERLAP
OR
MULTIPLE_ELIGIBLE_SHIFTS
→ operational lane INVALID
```

SHELL no seleccionará:

- el primero;
- el más reciente;
- el turno de la sede seleccionada;
- el turno que produzca más aplicaciones.

Resultado:

- el carril base permanece independiente;
- no se deriva visibilidad operativa de un turno arbitrario;
- las aplicaciones contextuales que dependan de ese turno no se vuelven navegables por inferencia.

---

#### 39. Turno cancelado, retirado o expirado

Un turno que deja de ser vigente deja de satisfacer `T`.

Resultado:

```text
TURN NO VIGENTE
→ T = NO SATISFECHO
→ visibilidad derivada de ese carril deja de ser válida
```

No existe gracia basada en:

- tarjeta previamente visible;
- página abierta;
- caché;
- historial del navegador;
- último contexto;
- check-in histórico.

El carril base independiente puede continuar.

---

#### 40. Cambio de sede durante el ciclo operativo

Un cambio legítimo que modifique la sede operativa requiere un nuevo contexto resuelto.

No se parchea el snapshot anterior.

Mientras exista ambigüedad:

```text
NO OPERATIONAL ALLOW NUEVO
```

Una tarjeta no conservará navegación por la sede anterior después de que el contexto quede obsoleto.

---

#### 41. Cambio de área durante el ciclo operativo

Cuando el grant de entrada requiere un área concreta, un cambio válido de área exige un nuevo contexto.

Mientras área anterior y nueva sean ambiguas:

```text
CARRIL OPERATIVO NO PUEDE COMPLETAR EL GRANT
```

No se conserva la autorización residual del área anterior.

Para roles legítimamente site-wide, el área nula continúa siendo válida únicamente cuando el contrato del rol y del grant lo permitan.

---

#### 42. Cambio de rol operativo

Un cambio de rol operativo requiere una nueva realidad laboral válida.

No puede realizarse mediante:

- selector visual;
- cambio de tarjeta;
- query parameter;
- cookie;
- navegación entre aplicaciones;
- edición local del contexto.

Cuando cambia el rol efectivo:

1. se resuelve un nuevo contexto;
2. se reevalúan los cuatro permisos de entrada operativos;
3. se recalcula la presentación.

No se conserva la matriz del rol anterior.

---

#### 43. Contexto obsoleto

Un snapshot puede quedar obsoleto cuando cambia:

- actor;
- estado del empleado;
- turno;
- check-in;
- rol operativo;
- sede;
- área;
- dispositivo;
- catálogo;
- matrices;
- override;
- deny.

Regla:

```text
STALE CONTEXT
≠
AUTORIDAD VIGENTE
```

SHELL deberá obtener una nueva resolución antes de mantener una decisión que dependa de los hechos modificados.

Esta tarea no define TTL ni estrategia de caché.

---

#### 44. Simulación

La simulación permanece separada del contexto real.

```text
SimulationContext
≠
AccessContext
```

Una simulación no puede:

- crear turno real;
- crear check-in real;
- cambiar rol operativo real;
- cambiar sede operativa real;
- cambiar área operativa real;
- volver navegable una aplicación real;
- autorizar una mutación real.

La simulación podrá tener su propia experiencia futura, pero no modifica la matriz efectiva del Hub real.

---

#### 45. Dispositivo compartido

Un dispositivo compartido no crea visibilidad empresarial por su sola identidad técnica.

La evaluación continúa requiriendo:

```text
ACTOR HUMANO EFECTIVO
+
CONTEXTO LABORAL DEL ACTOR
+
PERMISO EXACTO
```

El dispositivo puede agregar restricciones.

No puede ampliar:

- rol;
- sede;
- área;
- grant;
- app access.

La política detallada de comportamiento por dispositivo permanece en las tareas propietarias correspondientes.

---

#### 46. Evaluación server-side obligatoria

La interfaz no calculará `CONTEXT_VISIBLE` mediante:

- comparación local de rol;
- presencia de check-in en estado React;
- cookie de sede;
- `localStorage`;
- lista embebida de aplicaciones;
- booleano legacy `can_operate`;
- permiso reconstruido en cliente.

La decisión de entrada deberá provenir de la frontera de autorización gobernada.

El cliente solo consume una proyección segura suficiente para presentar el resultado.

---

#### 47. Proyección segura

La proyección de presentación puede incluir la información pública necesaria para:

- identificar la aplicación;
- conocer si es visible;
- conocer si está bloqueada;
- mostrar una razón pública gobernada cuando corresponda.

No deberá exponer:

- matched grants;
- matched denies;
- fingerprints internos;
- SQLSTATE;
- filas de matrices;
- secretos;
- payload completo de `AccessContext`;
- evidencia sensible de autorización.

La proyección no funciona como capability token.

---

#### 48. URL directa

La visibilidad del Hub no sustituye el guard de la aplicación destino.

Por tanto:

```text
CARD_HIDDEN
+
URL ESCRITA MANUALMENTE
→ DESTINO DEBE REAUTORIZAR
```

y:

```text
CARD_VISIBLE
→ NO SIGNIFICA AUTORIZAR TODAS LAS ACCIONES
```

Alterar HTML, href, estado local o navegación no cambia la decisión del servidor.

---

#### 49. Entrada a aplicación no concede capacidades internas

Cuando un actor entra por:

```text
nexo.access
fogo.access
origo.access
pulso.access
```

solo obtiene la capacidad de entrada autorizada.

Cada capacidad interna vuelve a evaluar:

- permiso exacto;
- modalidad;
- T o T+C;
- área cuando corresponda;
- recurso;
- scope;
- grants;
- denies;
- estado.

La aplicación puede estar visible antes del check-in y aun así bloquear correctamente operaciones presenciales.

---

#### 50. Matriz de comportamiento por estado de contexto

| Contexto | Base ALLOW en NEXO/FOGO/ORIGO | Allow operativo de entrada | Resultado |
| --- | --- | --- | --- |
| sin turno vigente | sí | no disponible | visible por base |
| sin turno vigente | no | no disponible | contextual oculta |
| turno vigente, sin check-in, grant `T` completo | no | sí | contextual visible |
| turno vigente, check-in compatible, grant completo | no | sí | contextual visible |
| turno vigente, check-in activo incompatible | no | no | contextual bloqueada cuando exista relevancia contextual |
| turno vigente, área requerida por grant ausente | no | no | contextual bloqueada |
| turno vigente, rol sin grant ni override de entrada | no | no | contextual oculta |
| turno ambiguo | sí | carril inválido | visible por base |
| turno ambiguo | no | carril inválido | sin navegación contextual derivada |
| turno expirado/cancelado/retirado | sí | no disponible | visible por base |
| turno expirado/cancelado/retirado | no | no disponible | contextual oculta |
| bloqueo estructural transversal | no aplicable | no aplicable | sin grid laboral autorizado |

PULSO usa únicamente las filas de resultado operativo porque no posee carril base para `pulso.access`.

---

#### 51. Relevancia contextual

Una aplicación es contextualmente relevante cuando el servidor puede vincular al actor con una posibilidad gobernada de entrada operativa mediante:

- grant del rol operativo;
- concesión individual operativa;
- contexto de turno resoluble;
- aplicación que admite carril operativo.

La relevancia no concede acceso.

Sirve únicamente para distinguir:

```text
CONTEXT_BLOCKED
```

de:

```text
CONTEXT_HIDDEN
```

No se expondrá al cliente cuál fuente concreta creó esa relevancia.

---

#### 52. No existe fallback permisivo

Ante:

- timeout;
- error de resolver contexto;
- payload incompatible;
- versión desconocida;
- decisión de autorización inválida;
- aplicación desconocida;
- rol desconocido;
- área incompatible;
- ambigüedad;

SHELL no puede convertir la incertidumbre en:

```text
VISIBLE
```

Resultado seguro:

```text
NO NAVEGABLE
```

La presentación pública del error se gobierna por los contratos de bloqueo y disponibilidad.

---

#### 53. Resultado cuantitativo consolidado

```text
CONTEXT_EXPANDABLE_APPS = 4

BASE_OR_OPERATIONAL_ENTRY_APPS = 3
OPERATIONAL_ONLY_ENTRY_APPS = 1

OPERATIONAL_ENTRY_PREREQUISITE_T = 4
OPERATIONAL_ENTRY_PREREQUISITE_T_PLUS_C = 0

OPERATIONAL_BASELINE_ROLES = 12
OPERATIONAL_BASELINE_VISIBILITY_EDGES = 25

BASELINE_NEXO = 12
BASELINE_PULSO = 7
BASELINE_FOGO = 4
BASELINE_ORIGO = 2
```

La efectividad individual puede diferir por:

- concesiones individuales;
- denegaciones;
- contexto;
- vigencia;
- territorio;
- estado de aplicación.

---

#### 54. Handoff a `SHELL-APP-004`

La siguiente tarea recibe esta semántica cerrada:

1. `app.access` operativo usa turno vigente, no exige check-in;
2. turno publicado y turno vigente son estados distintos;
3. turno vigente y turno activo son estados distintos;
4. turno activo continúa significando turno vigente más check-in activo;
5. SHELL no puede llamar “activo” a un turno meramente vigente para ocultar esa diferencia;
6. la visibilidad contextual puede existir antes del check-in;
7. un turno futuro no habilita visibilidad contextual;
8. un turno expirado, retirado o cancelado deja de habilitarla;
9. ambigüedad de turno bloquea la derivación operativa;
10. el carril base permanece independiente.

`SHELL-APP-004` deberá decidir exclusivamente cómo mostrar el turno correspondiente.

No reabrirá la política de visibilidad contextual aprobada aquí.

---

#### 55. No se adelanta `SHELL-APP-004`

Esta tarea no define:

- componente visual del turno;
- posición del turno en SHELL;
- texto humano del estado;
- formato horario;
- contador de tiempo;
- CTA de check-in;
- colores;
- iconografía;
- detalle del turno;
- historial;
- turno siguiente;
- comportamiento responsive.

Solo define cómo el contexto del turno participa en visibilidad de aplicaciones.

---

#### 56. Frontera con `SHELL-APP-005` a `SHELL-APP-007`

Esta tarea consume sede, área y rol operativo como hechos de autorización.

No decide cómo se muestran.

Quedan reservados:

```text
SHELL-APP-005
→ Mostrar sede activa

SHELL-APP-006
→ Mostrar área activa

SHELL-APP-007
→ Mostrar rol operativo activo
```

La futura UI no podrá reinterpretar esos campos como autoridad.

---

#### 57. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0
**Requisitos modificados:** 0

La tarea especializa la presentación de SHELL usando reglas ya cubiertas por los contratos vigentes de contexto, autorización y navegación.

No crea un nuevo permiso, nuevo estado de autorización ni nueva frontera de seguridad.

---

#### 58. Cobertura de prueba vigente reutilizada

Sin modificar el Registro Canónico de Requisitos de Prueba, esta tarea reutiliza:

- `TREQ-SHELL-003` — catálogo canónico único para identidad y disponibilidad;
- `TREQ-SHELL-014` — la raíz autenticada resuelve aplicaciones autorizadas;
- `TREQ-SHELL-015` — disponibilidad del launcher derivada de decisión canónica;
- `TREQ-SHELL-016` — una aplicación sin acceso efectivo permanece no navegable y, cuando se presenta, muestra estado bloqueado;
- `TREQ-SHELL-023` — rutas runtime protegidas;
- `TREQ-SHELL-028` — catálogo de aplicaciones único y versionado;
- `TREQ-SHELL-030` — visibilidad derivada de permisos y contexto sin sustituir autorización del servidor;
- `TREQ-SHELL-031` — simulación separada de la autoridad real;
- `TREQ-SHELL-063` — frontera server/client de contexto y autorización;
- `TREQ-SHELL-067` — resolución de `AccessContext` validada y fail closed;
- `TREQ-SHELL-068` — evaluación canónica de autorización;
- `TREQ-SHELL-069` — solo una decisión ALLOW válida permite continuar;
- `TREQ-SHELL-070` — proyección segura del contexto;
- `TREQ-SHELL-071` — proyección segura de la decisión;
- `TREQ-SHELL-072` — cliente sin autoridad propia.

Esta sección es trazabilidad heredada.

No constituye modificación del registro.

---

#### 59. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | El artefacto todavía no ha sido insertado ni compilado dentro de la rama local de `SHELL-APP-003`. |
| LOCAL | NOT_EXECUTED | Todavía no se han ejecutado formateo, quality, delivery ni la batería documental sobre el checkout local de la tarea. |
| REMOTA | PASS | Se verificaron `main` posterior al cierre de `SHELL-APP-002`, continuidad H2, topología, owner, protocolo, contrato de entrega, políticas documentales, `AccessContext`, reglas de turno y check-in, clasificación de área, precedencia, matrices operativas, cobertura SHELL y scripts vigentes. |
| OPERATIVA | NOT_APPLICABLE | La tarea define política documental y no prueba sesiones, turnos, check-ins, usuarios o aplicaciones desplegadas en un ambiente operativo. |
| FÍSICA | NOT_APPLICABLE | La tarea no crea ni autoriza una instancia `SHELL-APP-003::implementation_unit_id` y no modifica runtime, datos, infraestructura ni despliegues. |

---

#### 60. Criterios de aceptación

- [ ] El título es exactamente `SHELL-APP-003 — Definir aplicaciones visibles por contexto`.
- [ ] `SHELL-APP-002` permanece como tarea anterior.
- [ ] `SHELL-APP-004` permanece como siguiente tarea.
- [ ] La tarea permanece en carril documental.
- [ ] La topología `PER_IMPLEMENTATION_UNIT` no se interpreta como autorización física.
- [ ] Se consumen exactamente cuatro tipos de actor heredados.
- [ ] Solo `EMPLOYEE` participa en expansión contextual laboral.
- [ ] `shell.access` continúa siendo `BASE_ONLY`.
- [ ] Solo NEXO, FOGO, ORIGO y PULSO pueden adquirir entrada por carril operativo.
- [ ] NEXO, FOGO y ORIGO conservan `BASE_OR_OPERATIONAL`.
- [ ] PULSO conserva `OPERATIONAL_ONLY`.
- [ ] Los cuatro permisos operativos de entrada conservan prerrequisito `T`.
- [ ] Ningún permiso de entrada operativo exige check-in activo.
- [ ] La ausencia de check-in no bloquea por sí sola la entrada `T`.
- [ ] Un check-in activo incompatible bloquea el carril operativo.
- [ ] Un check-in cerrado, expirado u offline pendiente no se trata como activo.
- [ ] Un turno publicado futuro no habilita visibilidad contextual.
- [ ] Un turno vigente puede habilitar visibilidad antes del check-in.
- [ ] Turno vigente no se redefine como turno activo.
- [ ] Un turno ambiguo no se resuelve permisivamente.
- [ ] Un turno cancelado, retirado o expirado deja de satisfacer `T`.
- [ ] La sede operativa procede del turno.
- [ ] No se usa sede seleccionada o primaria como autoridad operativa.
- [ ] El área operativa procede del turno cuando corresponde.
- [ ] `SITE_SUFFICIENT` no elimina restricciones de área impuestas por el grant o rol.
- [ ] El rol operativo procede del turno.
- [ ] No se usa rol base, navigation role, dispositivo o simulación como rol operativo.
- [ ] La matriz baseline conserva exactamente doce roles operativos.
- [ ] La matriz baseline conserva exactamente veinticinco relaciones rol operativo → aplicación.
- [ ] NEXO conserva doce candidatos baseline.
- [ ] PULSO conserva siete.
- [ ] FOGO conserva cuatro.
- [ ] ORIGO conserva dos.
- [ ] Una concesión individual operativa válida puede ampliar la baseline.
- [ ] Un deny operativo aplicable puede restringirla.
- [ ] La baseline no se convierte en allowlist hardcodeada.
- [ ] Se definen `CONTEXT_VISIBLE`, `CONTEXT_BLOCKED` y `CONTEXT_HIDDEN`.
- [ ] Una aplicación bloqueada no es navegable.
- [ ] Una aplicación sin relevancia contextual no se presenta por inferencia.
- [ ] Un base ALLOW completo sobre NEXO, FOGO u ORIGO permanece independiente de un fallo exclusivamente operativo.
- [ ] Un bloqueo estructural transversal invalida toda visibilidad laboral.
- [ ] El contexto obsoleto no conserva autoridad.
- [ ] La simulación no modifica visibilidad real.
- [ ] El dispositivo compartido no crea permisos o aplicaciones.
- [ ] La decisión se resuelve en servidor.
- [ ] El cliente consume únicamente una proyección segura.
- [ ] Alterar HTML, href o estado local no concede acceso.
- [ ] La aplicación destino reautoriza sus capacidades internas.
- [ ] No se desarrolla la presentación visual de turno.
- [ ] No se desarrolla la presentación visual de sede.
- [ ] No se desarrolla la presentación visual de área.
- [ ] No se desarrolla la presentación visual de rol operativo.
- [ ] No se crean requisitos de prueba.
- [ ] No se modifican requisitos de prueba.
- [ ] No se modifica 04A.
- [ ] No se modifica código.
- [ ] No se modifica Supabase.
- [ ] No se autoriza implementación física.

---

#### 61. Límites

Esta tarea no:

- modifica `AccessContext`;
- modifica `AuthorizationDecision`;
- crea nuevos estados de `LaneReadiness`;
- crea códigos de razón;
- crea permisos;
- modifica modalidades;
- modifica prerrequisitos `T` o `T+C`;
- modifica clasificación de área;
- modifica scopes;
- modifica matrices base;
- modifica matrices operativas;
- modifica overrides individuales;
- crea grants;
- crea denies;
- modifica roles;
- modifica turnos;
- modifica check-ins;
- modifica sedes;
- modifica áreas;
- modifica dispositivos;
- modifica simulaciones;
- cambia el catálogo de aplicaciones;
- cambia dominios;
- cambia URLs;
- cambia logos;
- cambia nombres;
- cambia el estado diferido de AURA;
- incorpora PASS al grid laboral primario;
- modifica ANIMA;
- modifica VISO;
- modifica NEXO;
- modifica FOGO;
- modifica ORIGO;
- modifica PULSO;
- modifica NUMERA;
- crea componentes visuales;
- define layout;
- define colores;
- define iconos;
- define textos públicos de error;
- implementa tarjetas;
- implementa navegación;
- implementa caché;
- define TTL;
- implementa invalidación Realtime;
- modifica middleware;
- modifica Server Actions;
- modifica RLS;
- modifica RPC;
- modifica Auth;
- modifica datos;
- crea migraciones;
- despliega;
- crea `implementation_unit_id`;
- autoriza una instancia física;
- crea requisitos de prueba;
- modifica requisitos de prueba;
- modifica el Registro Canónico de Requisitos de Prueba;
- desarrolla `SHELL-APP-004`.

---

#### 62. Continuidad

**ÚLTIMA TAREA APROBADA**
`SHELL-APP-002 — Definir aplicaciones visibles por actor`

**TAREA ACTUAL APROBADA**
`SHELL-APP-003 — Definir aplicaciones visibles por contexto`

**SIGUIENTE TAREA RESERVADA**
`SHELL-APP-004 — Mostrar turno activo`
