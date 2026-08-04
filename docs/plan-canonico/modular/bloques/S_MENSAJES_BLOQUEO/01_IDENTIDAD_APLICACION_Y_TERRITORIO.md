### MINI-BLOQUE — IDENTIDAD APLICACIÓN Y TERRITORIO

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **identidad aplicación y territorio** dentro de **S MENSAJES BLOQUEO**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `AUTH-ERR-001` a `AUTH-ERR-008` — 8 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Límites funcionales:** comienza con “Sin sesión” y concluye con “Sin área activa”.
<!-- PLAN-SECTION-META:END -->

### ✅ AUTH-ERR-001 — Sin sesión

**Estado:** APROBADA
**Tarea anterior:** `AUTH-SIM-006 — No mezclar permisos reales y simulados` — APROBADA
**Tarea siguiente:** `AUTH-ERR-002 — Usuario inactivo` — RESERVADA
**Tipo de tarea:** documental; definición contractual, funcional y de experiencia del bloqueo por ausencia de sesión autenticada válida
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/S_MENSAJES_BLOQUEO/01_IDENTIDAD_APLICACION_Y_TERRITORIO.md`
**Artefactos producidos:** `NO-SESSION-BLOCKING-CONTRACT-001`, `NO-SESSION-CHANNEL-RESPONSE-MATRIX-001`, `NO-SESSION-APPLICATION-COVERAGE-REGISTER-001` y `NO-SESSION-PHYSICAL-GAP-REGISTER-001`
**Decisiones consumidas:** `ADR-AUTH-001`; `AUTH-MOD-001`; `AUTH-MOD-019`; `AUTH-CAT-001`; `AUTH-CTX-001`; `AUTH-CTX-005` a `AUTH-CTX-007`; `AUTH-CTX-015`; `AUTH-SIM-006`; catálogo canónico de aplicaciones; contrato de entrega documental vigente
**Cambios físicos autorizados:** ninguno; no modifica código, sesiones, cookies, tokens, Supabase, Auth, RLS, RPC, Edge Functions, datos, migraciones, configuración, aplicaciones ni despliegues

---

#### 1. Propósito

Definir de forma única, segura y verificable qué debe ocurrir cuando una
solicitud intenta entrar en una superficie protegida de Vento OS y no existe
una sesión autenticada válida capaz de producir un actor efectivo.

La regla raíz queda:

```text
SUPERFICIE PROTEGIDA
+
SIN SESIÓN AUTENTICADA VÁLIDA
→
DENY
+
AUTH_NO_SESSION
+
RECUPERACIÓN MEDIANTE AUTENTICACIÓN
```

La ausencia de sesión es una condición de autenticación. No es:

- usuario inactivo;
- falta de acceso a una aplicación;
- falta de permiso administrativo u operativo;
- falta de sede o área;
- falta de turno o check-in;
- dispositivo no autorizado;
- acción no permitida en simulación;
- error técnico;
- error de configuración;
- indisponibilidad de red;
- resultado de una evaluación de autorización posterior.

La tarea protege dos objetivos simultáneos:

1. impedir acceso o exposición sin identidad autenticada;
2. permitir una recuperación segura y comprensible sin filtrar información,
   reenviar cuerpos de solicitud, aceptar destinos arbitrarios ni convertir
   fallos técnicos en una falsa expiración de sesión.

---

#### 2. Resultado material

Se aprueban cuatro artefactos documentales completos:

1. `NO-SESSION-BLOCKING-CONTRACT-001`, que congela identidad, precedencia,
   causas internas, respuesta pública, contrato de recuperación, seguridad,
   auditoría y criterios de no aplicación;
2. `NO-SESSION-CHANNEL-RESPONSE-MATRIX-001`, que decide el comportamiento para
   diez canales y superficies de entrega;
3. `NO-SESSION-APPLICATION-COVERAGE-REGISTER-001`, que materializa la decisión
   para las diez aplicaciones canónicas;
4. `NO-SESSION-PHYSICAL-GAP-REGISTER-001`, que registra nueve brechas físicas
   observadas en seis repositorios laborales y en el login central de SHELL.

Cobertura materializada:

| Elemento                                             |          Cantidad |
| ---------------------------------------------------- | ----------------: |
| Código público canónico                              |                 1 |
| Causas internas admitidas                            |                 4 |
| Decisión pública de bloqueo permitida                | 1, siempre `DENY` |
| Estado HTTP canónico para clientes no navegacionales |          1, `401` |
| Canales con decisión explícita                       |                10 |
| Aplicaciones canónicas reconciliadas                 |                10 |
| Aplicaciones laborales con middleware inspeccionado  |                 6 |
| Archivos físicos inspeccionados                      |                 8 |
| Brechas físicas registradas                          |                 9 |
| Acciones públicas de recuperación                    |                 2 |
| Eventos auditables mínimos                           |                 4 |
| Requisitos de prueba derivados                       |                10 |

---

#### 3. Identidad canónica del bloqueo

La identidad pública única es:

```text
reason_code = AUTH_NO_SESSION
```

Propiedades normativas:

| Propiedad                   | Valor                                                   |
| --------------------------- | ------------------------------------------------------- |
| Dominio                     | autenticación                                           |
| Decisión                    | `DENY`                                                  |
| Principal                   | no resuelto                                             |
| Estado público              | `UNAUTHENTICATED`                                       |
| Estado HTTP no navegacional | `401 Unauthorized`                                      |
| Recuperación                | `SIGN_IN`                                               |
| Acción real autorizada      | ninguna                                                 |
| Reintento                   | solo después de autenticar y emitir una solicitud nueva |
| Autoridad persistida        | ninguna                                                 |
| Exposición de recurso       | prohibida                                               |

Quedan prohibidos como identidad pública alternativa:

- `NO_USER`;
- `NO_COOKIES`;
- `AUTH_ERROR`;
- `LOGIN_REQUIRED` no versionado;
- mensajes libres del proveedor;
- un booleano `false` sin razón;
- `403` para representar ausencia de principal;
- redirecciones sin código o procedencia trazable.

Los textos humanos podrán localizarse, pero el código `AUTH_NO_SESSION` será
estable y no se traducirá.

---

#### 4. Definición exacta de “sin sesión”

Existe `AUTH_NO_SESSION` cuando, para una solicitud protegida, la verificación
autoritativa de autenticación concluye que no existe una sesión vigente capaz
de resolver un principal autenticado.

La condición puede proceder de una de cuatro causas internas:

| Causa interna     | Condición                                                                  | Resultado público |
| ----------------- | -------------------------------------------------------------------------- | ----------------- |
| `SESSION_ABSENT`  | no existe material de autenticación reconocido para el proyecto y ambiente | `AUTH_NO_SESSION` |
| `SESSION_INVALID` | existe material, pero no puede validarse como sesión del proyecto          | `AUTH_NO_SESSION` |
| `SESSION_EXPIRED` | la sesión superó su vigencia o el proveedor la declara expirada            | `AUTH_NO_SESSION` |
| `SESSION_REVOKED` | la sesión fue invalidada o revocada de forma autoritativa                  | `AUTH_NO_SESSION` |

La causa interna sirve para auditoría y diagnóstico controlado. No deberá
mostrarse al usuario como detalle técnico ni utilizarse para revelar:

- existencia de una cuenta;
- estado del usuario;
- correo;
- identificador de Auth;
- proveedor;
- token;
- cookie;
- motivo de revocación;
- dispositivo anterior;
- información de seguridad de la cuenta.

---

#### 5. Condiciones que no pertenecen a `AUTH_NO_SESSION`

| Condición observada                                                        | Clasificación correcta                 | Tarea propietaria                   |
| -------------------------------------------------------------------------- | -------------------------------------- | ----------------------------------- |
| la verificación de Auth falla por red, timeout o excepción no clasificable | error técnico, no denegación de sesión | `AUTH-ERR-019`                      |
| faltan URL, clave pública o configuración del cliente Supabase             | configuración técnica inconsistente    | `AUTH-ERR-017` y `AUTH-ERR-019`     |
| existe sesión válida, pero el empleado o usuario está inactivo             | usuario inactivo                       | `AUTH-ERR-002`                      |
| existe sesión válida, pero la aplicación no está permitida                 | sin acceso a la aplicación             | `AUTH-ERR-003`                      |
| existe sesión válida, pero falta permiso                                   | bloqueo de permiso correspondiente     | `AUTH-ERR-004` o tareas posteriores |
| existe sesión válida, pero falta sede, área, turno, check-in o rol         | bloqueo contextual correspondiente     | `AUTH-ERR-005` a `AUTH-ERR-014`     |
| el código de permiso solicitado no existe                                  | permiso no registrado                  | `AUTH-ERR-018`                      |
| el login, callback o ruta pública se solicita sin sesión                   | acceso público legítimo                | no aplica bloqueo                   |
| un actor técnico autenticado usa credenciales de servicio válidas          | identidad técnica, no sesión laboral   | contrato de integración propietario |

Regla obligatoria:

```text
NO SE PUDO VERIFICAR LA SESIÓN
≠
SE VERIFICÓ QUE NO HAY SESIÓN
```

Una excepción del proveedor no podrá convertirse automáticamente en
`SESSION_INVALID` ni provocar limpieza destructiva de credenciales.

---

#### 6. Precedencia dentro del árbol de bloqueo

`AUTH_NO_SESSION` es la primera razón laboral evaluable después de confirmar
que la superficie requiere autenticación.

Orden obligatorio:

```text
1. ¿LA SUPERFICIE ES PÚBLICA O PROTEGIDA?
2. ¿PUEDE EJECUTARSE LA VERIFICACIÓN TÉCNICA?
3. ¿EXISTE SESIÓN AUTENTICADA VÁLIDA?
4. ¿EL USUARIO ESTÁ ACTIVO?
5. ¿TIENE ACCESO A LA APLICACIÓN?
6. ¿TIENE PERMISO Y CONTEXTO SUFICIENTES?
7. ¿LA ACCIÓN Y EL RECURSO RESULTAN AUTORIZADOS?
```

Si el paso 3 produce `AUTH_NO_SESSION`:

- no se resolverá empleado;
- no se resolverá rol base;
- no se resolverá rol operativo;
- no se consultarán asignaciones de sede o área para construir una respuesta;
- no se evaluarán matrices;
- no se revelará si la aplicación, permiso o recurso existe;
- no se generará una segunda razón de bloqueo para el mismo intento;
- no se utilizará una simulación;
- no se devolverá `ALLOW` parcial;
- no se ejecutará una mutación.

La ausencia de sesión tiene precedencia pública sobre razones posteriores,
pero no debe ocultar un fallo técnico previo que impida verificar Auth.

---

#### 7. `NO-SESSION-BLOCKING-CONTRACT-001`

El contrato lógico mínimo será:

```ts
type NoSessionBlockingReason = {
  contract: "NO-SESSION-BLOCKING-CONTRACT-001";
  contract_version: "1.0.0";
  reason_code: "AUTH_NO_SESSION";
  domain: "AUTHENTICATION";
  decision: "DENY";
  principal_state: "UNAUTHENTICATED";
  executable: false;
  recovery_action: "SIGN_IN";
  http_status: 401;
  app_code: string;
  channel: NoSessionChannel;
  correlation_id: string;
  occurred_at: string;
  return_state_id: string | null;
};
```

La forma pública no incluirá:

- `user_id`;
- `employee_id`;
- email;
- teléfono;
- nombre;
- rol;
- sede;
- área;
- permiso;
- recurso solicitado en texto completo;
- token;
- refresh token;
- cookie;
- nombre de cookie;
- JWT;
- stack trace;
- mensaje bruto de Supabase;
- detalles de infraestructura;
- causa interna de revocación.

La causa interna se registrará en un envelope de auditoría separado y protegido.

---

#### 8. Mensaje humano canónico

Copy aprobado en español:

| Elemento          | Texto exacto                                                                                               |
| ----------------- | ---------------------------------------------------------------------------------------------------------- |
| Título            | `Inicia sesión para continuar`                                                                             |
| Mensaje           | `Tu sesión no está disponible o dejó de ser válida. Inicia sesión nuevamente para volver a la aplicación.` |
| Acción principal  | `Iniciar sesión`                                                                                           |
| Acción secundaria | `Volver a Vento OS`                                                                                        |
| Código de soporte | `AUTH_NO_SESSION`                                                                                          |

Reglas:

1. no afirmar “tu usuario está inactivo”;
2. no afirmar “no tienes permisos”;
3. no pedir validación con un líder antes de comprobar las razones posteriores;
4. no mostrar el mensaje bruto del proveedor;
5. no culpar al usuario;
6. no revelar el recurso protegido;
7. no presentar la expiración como única causa;
8. no mostrar un contador falso ni prometer recuperación automática;
9. no usar un error genérico cuando el estado está confirmado;
10. el código podrá estar disponible para soporte sin competir visualmente con
    la acción principal.

---

#### 9. Acciones de recuperación

##### 9.1 Acción principal — `Iniciar sesión`

Debe:

- abrir el punto de autenticación canónico de SHELL;
- transportar únicamente un estado de retorno seguro;
- iniciar una autenticación nueva;
- invalidar cualquier decisión de autorización previa;
- emitir una solicitud nueva al destino después de autenticar;
- volver a evaluar usuario, aplicación, permisos, contexto y recurso.

No debe:

- reenviar el cuerpo de una mutación;
- repetir automáticamente una compra, publicación, recepción, retiro, pago,
  check-in, firma, exportación u otra acción con efecto;
- conservar un `ALLOW` anterior;
- aceptar un destino arbitrario;
- incluir tokens en la URL.

##### 9.2 Acción secundaria — `Volver a Vento OS`

Debe dirigir al punto público seguro de SHELL. No debe intentar reconstruir la
acción fallida ni exponer el destino original.

La acción secundaria podrá omitirse en clientes no visuales, pero no podrá
sustituir la respuesta tipada.

---

#### 10. Contrato de retorno seguro

El retorno posterior al login se representa mediante un estado opaco,
verificable y limitado, no mediante una URL absoluta aceptada por confianza.

Propiedades obligatorias:

| Propiedad           | Regla                                                                 |
| ------------------- | --------------------------------------------------------------------- |
| Origen              | debe pertenecer al registro de aplicaciones y al ambiente actual      |
| Esquema             | `https` en ambientes desplegados; excepción local explícita y aislada |
| Destino             | ruta interna o referencia canónica de una aplicación conocida         |
| Firma               | verificable antes de redirigir                                        |
| Nonce               | único para impedir replay                                             |
| Vigencia            | máximo diez minutos                                                   |
| Uso                 | un solo uso cuando el mecanismo lo permita                            |
| Query               | allowlist por aplicación; elimina secretos y parámetros de Auth       |
| Fragmento           | no se conserva                                                        |
| Credenciales en URL | prohibidas                                                            |
| Revalidación        | obligatoria después del login                                         |
| Fallback            | inicio público de SHELL                                               |

Quedan prohibidos:

- cualquier `http://` o `https://` arbitrario suministrado por el cliente;
- dominios parecidos a Vento;
- subdominios no registrados;
- URLs con usuario o contraseña embebidos;
- esquemas `javascript:`, `data:`, `file:` o personalizados no aprobados;
- `returnTo` reutilizable indefinidamente;
- destinos construidos desde encabezados no confiables;
- retorno a una mutación POST;
- retorno que conserve tokens, códigos OAuth, OTP o secretos;
- redirección directa sin volver a autorizar el destino.

---

#### 11. Prevención de bucles

Las siguientes superficies deberán permanecer fuera del bloqueo automático:

- login canónico;
- callback de autenticación;
- recuperación de contraseña;
- cierre de sesión;
- assets indispensables del login;
- endpoints públicos expresamente registrados;
- páginas técnicas necesarias para explicar una indisponibilidad real.

Invariantes:

1. el login no redirige al login por ausencia de sesión;
2. un `return_state` inválido cae al inicio seguro de SHELL;
3. una autenticación fallida permanece en el login y no rebota al destino;
4. un destino que vuelve a producir `AUTH_NO_SESSION` no inicia un ciclo
   infinito;
5. el sistema conserva un contador o identificador de cadena de autenticación
   suficiente para detectar repetición;
6. un fallo técnico del proveedor se presenta como error técnico y no como
   nuevo redirect de sesión;
7. ninguna redirección automática repite una mutación.

---

#### 12. Sesiones, cookies y material de autenticación

La presencia de una cookie cuyo nombre comience por `sb-` es una señal física,
no una prueba canónica de sesión válida.

Reglas:

1. una credencial ausente puede producir `SESSION_ABSENT`;
2. una credencial presente exige validación autoritativa antes de resolver un
   principal;
3. una excepción de red o configuración no equivale a credencial inválida;
4. la limpieza solo afectará cookies o artefactos reconocidos del proyecto,
   ambiente, dominio y ruta correspondientes;
5. no se borrarán indiscriminadamente todas las cookies con prefijo compartido;
6. los nombres de cookies no aparecerán en encabezados públicos;
7. los tokens no aparecerán en URL, UI, logs, analytics ni errores;
8. la limpieza deberá respetar los atributos con los que se emitió la cookie;
9. cerrar una sesión inválida no autoriza ninguna otra identidad;
10. el almacenamiento local o la caché no podrán reconstruir una sesión;
11. un usuario recordado en UI no es un principal autenticado;
12. una sesión simulada nunca satisface este contrato.

---

#### 13. Datos, caché y contenido protegido

Ante `AUTH_NO_SESSION`:

- no se renderiza contenido protegido antes del bloqueo;
- no se incluye contenido protegido en HTML, RSC, JSON, props, prefetch o
  metadatos personalizados;
- no se entrega una respuesta protegida desde caché compartida;
- no se conserva una pantalla sensible visible después de la pérdida de sesión;
- se limpian estados visuales sensibles al cambiar a la experiencia de login;
- no se permite que Service Worker, offline cache o navegación atrás expongan
  datos de la sesión anterior;
- `Cache-Control` deberá impedir persistencia cuando la respuesta pueda contener
  información de autenticación o retorno;
- un recurso público firmado mantiene su propio contrato y no se convierte en
  recurso laboral protegido por inferencia.

Una excepción pública debe estar registrada y validada por su propio contrato.
No podrá declararse pública únicamente para evitar el bloqueo.

---

#### 14. `NO-SESSION-CHANNEL-RESPONSE-MATRIX-001`

|    # | Canal o superficie                                               | ¿Aplica?              | Respuesta canónica                                                       | Prohibición principal                                        |
| ---: | ---------------------------------------------------------------- | --------------------- | ------------------------------------------------------------------------ | ------------------------------------------------------------ |
|    1 | navegación web `GET` o `HEAD` a ruta laboral protegida           | Sí                    | redirect temporal al login con `return_state` seguro antes de renderizar | no incluir contenido protegido ni URL arbitraria             |
|    2 | formulario o navegación mutante `POST`, `PUT`, `PATCH`, `DELETE` | Sí                    | `401` tipado; no redirigir preservando método o body                     | no repetir la mutación después del login                     |
|    3 | `fetch`, XHR o Route Handler protegido                           | Sí                    | `401` con envelope `AUTH_NO_SESSION`                                     | no devolver HTML de login como respuesta exitosa             |
|    4 | Server Action                                                    | Sí                    | interrupción tipada antes de ejecutar lógica de negocio                  | no ejecutar efecto ni capturar un redirect como autorización |
|    5 | RPC o Edge Function con identidad laboral                        | Sí                    | rechazo `401` antes de lógica empresarial                                | no usar `403`, service role ni fallback anónimo              |
|    6 | Realtime o suscripción a canal protegido                         | Sí                    | rechazar o terminar suscripción sin enviar eventos                       | no mantener el canal de una sesión anterior                  |
|    7 | WebSocket, SSE o stream protegido                                | Sí                    | rechazar antes de abrir el flujo o cerrarlo sin payload protegido        | no transmitir un primer fragmento antes de autenticar        |
|    8 | cliente nativo o móvil laboral                                   | Sí                    | estado tipado `AUTH_NO_SESSION` y navegación controlada al login         | no depender de redirects web ni persistir token inválido     |
|    9 | login, callback, recuperación, logout y assets indispensables    | No                    | acceso público controlado                                                | no crear bucle de autenticación                              |
|   10 | endpoint público firmado o recurso público registrado            | No por sesión laboral | aplicar su contrato propio y validar firma, alcance y vigencia           | no ampliar la excepción a rutas vecinas                      |

Regla de estado HTTP:

```text
SIN PRINCIPAL AUTENTICADO
→ 401
```

```text
PRINCIPAL AUTENTICADO SIN AUTORIZACIÓN
→ razón posterior; normalmente 403 o respuesta contractual equivalente
```

---

#### 15. Experiencia web

Cuando el canal admita interfaz, la experiencia deberá:

1. llevar el foco al título;
2. anunciar el mensaje mediante semántica accesible apropiada;
3. ofrecer una acción principal visible y accionable por teclado;
4. mantener contraste y tamaño legible;
5. no depender únicamente de color;
6. conservar el nombre de la aplicación solicitante cuando sea seguro y
   provenga del catálogo;
7. no mostrar rutas completas con parámetros sensibles;
8. no exponer el correo como confirmación de existencia;
9. evitar spinners indefinidos;
10. evitar recargas automáticas continuas;
11. conservar idioma consistente;
12. funcionar con lector de pantalla y zoom;
13. explicar que se requiere autenticación, no que se perdió un permiso;
14. impedir interacción con la pantalla protegida subyacente;
15. limpiar estados y modales sensibles de la sesión anterior.

---

#### 16. Auditoría y observabilidad

Eventos mínimos:

| Evento                             | Momento                                                  | Resultado                                   |
| ---------------------------------- | -------------------------------------------------------- | ------------------------------------------- |
| `auth.session_required.detected`   | se confirma ausencia, invalidez, expiración o revocación | bloqueo detectado                           |
| `auth.session_required.presented`  | se entrega UI o envelope público                         | mensaje entregado                           |
| `auth.session_required.redirected` | se emite retorno al login                                | recuperación iniciada                       |
| `auth.session_restored`            | una autenticación posterior produce sesión válida        | identidad restaurada, no autorización final |

Campos mínimos protegidos:

- `event_id`;
- `correlation_id`;
- `occurred_at`;
- `app_code`;
- `environment`;
- `channel`;
- plantilla de ruta o huella de destino;
- causa interna;
- presencia o ausencia de material de autenticación como booleano;
- identificador opaco de estado de retorno;
- resultado;
- versión del contrato.

No se registrarán:

- password;
- OTP;
- token;
- refresh token;
- JWT completo;
- nombre o valor de cookie;
- URL completa con query sensible;
- cuerpo de la mutación;
- mensaje bruto del proveedor;
- stack trace en telemetría de usuario;
- datos del recurso protegido;
- email como sustituto del actor inexistente.

`auth.session_restored` demuestra autenticación. No demuestra acceso a la
aplicación, permiso, contexto ni autorización de la acción original.

---

#### 17. Rate limiting y abuso

La presentación de `AUTH_NO_SESSION` no deberá:

- permitir enumerar cuentas;
- confirmar si un correo existe;
- diferenciar públicamente sesión expirada y revocada;
- revelar configuración;
- producir redirects ilimitados;
- crear estados de retorno sin límite;
- generar logs de alta cardinalidad con URL completa;
- evadir límites del endpoint de login;
- convertir errores reiterados en carga no controlada sobre Auth.

Los límites de autenticación se aplicarán en el punto de login. El bloqueo por
falta de sesión deberá ser barato, determinista y no ejecutar consultas de
negocio.

---

#### 18. Concurrencia y cambios de estado

Casos obligatorios:

1. sesión válida al iniciar, revocada antes de ejecutar: revalidar en el límite
   de autorización y no ejecutar;
2. dos pestañas, logout en una: la otra deja de mostrar datos protegidos al
   detectar la pérdida de sesión;
3. refresh token rotado: una ventana con material obsoleto no borra una sesión
   válida de otro proyecto o ambiente;
4. autenticación completada mientras otra solicitud falla: cada solicitud se
   decide por su snapshot y se reintenta explícitamente cuando sea seguro;
5. pérdida de sesión durante un stream: cerrar sin entregar información nueva;
6. pérdida de sesión después de confirmar una mutación: no reportar la mutación
   como fallida si ya fue confirmada; conciliar mediante idempotencia y
   trazabilidad del proceso;
7. login exitoso no repite automáticamente la solicitud mutante original.

---

#### 19. `NO-SESSION-APPLICATION-COVERAGE-REGISTER-001`

Se materializa una decisión para las diez aplicaciones canónicas de
`AUTH-CAT-001`.

|    # | `app_code` | Dominio                           | Decisión                            | Alcance de `AUTH_NO_SESSION`                                                                             | Estado documental |
| ---: | ---------- | --------------------------------- | ----------------------------------- | -------------------------------------------------------------------------------------------------------- | ----------------- |
|    1 | `shell`    | laboral / hub                     | APLICA                              | rutas laborales protegidas, Hub y punto central de autenticación; login permanece público                | ESPECIFICADO      |
|    2 | `anima`    | laboral / híbrida                 | APLICA                              | superficies personales y administrativas laborales protegidas                                            | ESPECIFICADO      |
|    3 | `viso`     | laboral / administrativa          | APLICA                              | administración, auditoría y simulación protegidas                                                        | ESPECIFICADO      |
|    4 | `nexo`     | laboral / híbrida                 | APLICA                              | inventario, logística, remisiones y kioscos sujetos a identidad laboral                                  | ESPECIFICADO      |
|    5 | `fogo`     | laboral / operativa               | APLICA                              | producción y ejecución operativa protegidas                                                              | ESPECIFICADO      |
|    6 | `origo`    | laboral / híbrida                 | APLICA                              | compras y recepción protegidas; excepciones públicas conservan contrato propio                           | ESPECIFICADO      |
|    7 | `pulso`    | laboral / operativa               | APLICA                              | POS y operación laboral protegida                                                                        | ESPECIFICADO      |
|    8 | `numera`   | laboral / híbrida                 | APLICA                              | costos, finanzas y reportes laborales protegidos                                                         | ESPECIFICADO      |
|    9 | `aura`     | laboral / administrativa diferida | APLICA AL ACTIVARSE                 | toda superficie futura protegida deberá adoptar el contrato antes de activarse                           | ESPECIFICADO      |
|   10 | `pass`     | cliente / adyacente               | APLICA SOLO A SUPERFICIES LABORALES | la identidad del cliente final conserva contrato propio; administración laboral de Pass usa este bloqueo | ESPECIFICADO      |

Totales reconciliados:

| Distribución                        | Cantidad |
| ----------------------------------- | -------: |
| APLICA en dominio laboral actual    |        8 |
| APLICA AL ACTIVARSE                 |        1 |
| APLICA SOLO A SUPERFICIES LABORALES |        1 |
| Sin decisión                        |        0 |
| Duplicados                          |        0 |

La matriz no afirma que las diez aplicaciones ya implementen el contrato. Solo
cierra su obligación documental.

---

#### 20. Snapshot físico inspeccionado

Inspección de solo lectura sobre ramas `main` accesibles:

| Repositorio    | Archivo                            | Blob SHA                                   | Hallazgo principal                                                                             |
| -------------- | ---------------------------------- | ------------------------------------------ | ---------------------------------------------------------------------------------------------- |
| `vento-shell`  | `middleware.ts`                    | `862d185fd1bbc8101ed87db5e286d6b0b0dde659` | redirect por `no-cookies`, `no-user`, `auth-error` y `no-config` sin razón contractual pública |
| `vento-nexo`   | `middleware.ts`                    | `3db2c7e31dcada218a8e8cd1efc41db8c899b1d7` | patrón duplicado y rutas específicas de kiosco                                                 |
| `vento-fogo`   | `middleware.ts`                    | `596e62e2716a32e3acea3e79c79b60c7762271f2` | patrón duplicado; `no-access` excluido del matcher                                             |
| `vento-origo`  | `middleware.ts`                    | `0420a23343af1ab60055f090891823f6860afc00` | patrón duplicado y excepción pública para PDF firmado                                          |
| `vento-viso`   | `middleware.ts`                    | `3099628a445dca9c401b87441b3c05c24894161d` | patrón duplicado                                                                               |
| `vento-numera` | `middleware.ts`                    | `499444d0e05d0beb0824b0e6a964fa1d199cdbb7` | patrón duplicado                                                                               |
| `vento-shell`  | `src/app/login/page.tsx`           | `e56f868c82c430d99e0ea8fcdd85dd3918f73d56` | `returnTo` absoluto `http/https` aceptado sin allowlist de aplicaciones                        |
| `vento-shell`  | `src/features/auth/login-form.tsx` | `4122122ee67afbb5cf00a35dd7cf64f156c011b8` | navega al `returnTo` recibido, muestra destino y errores del proveedor                         |

No se inspeccionó una implementación equivalente en `vento-anima`,
`vento-pulso`, `vento-pass` ni AURA con evidencia suficiente para declararla
conforme o no conforme. Esa ausencia de evidencia se conserva como tal y se
resolverá durante la migración de consumidores de `SHELL-AUTH-005`.

---

#### 21. `NO-SESSION-PHYSICAL-GAP-REGISTER-001`

| ID           | Brecha verificada                                                                           | Evidencia                                           | Riesgo                                                          | Estado    | Tarea responsable                                | Condición de salida                                                        |
| ------------ | ------------------------------------------------------------------------------------------- | --------------------------------------------------- | --------------------------------------------------------------- | --------- | ------------------------------------------------ | -------------------------------------------------------------------------- |
| `NS-GAP-001` | seis aplicaciones mantienen lógica de middleware duplicada                                  | seis archivos inspeccionados                        | drift y mensajes distintos                                      | BLOQUEADO | `SHELL-AUTH-001`; `SHELL-AUTH-005`               | consumidoras usan SDK o adapter compartido versionado                      |
| `NS-GAP-002` | cualquier cookie `sb-*` se usa como precondición de sesión                                  | seis middlewares                                    | cookie ajena o residual tratada como señal válida               | BLOQUEADO | `SHELL-AUTH-002`; `SHELL-AUTH-005`               | identificación tipada por proyecto y validación autoritativa               |
| `NS-GAP-003` | `no-config` y excepción `auth-error` terminan en el mismo login que una ausencia real       | seis middlewares                                    | falla técnica presentada como sesión perdida y bucles           | BLOQUEADO | `AUTH-ERR-017`; `AUTH-ERR-019`                   | errores técnicos tienen contrato y experiencia distintos                   |
| `NS-GAP-004` | no existe envelope compartido `AUTH_NO_SESSION` por canal                                   | middlewares solo cubren navegación y excluyen `api` | fetch, RPC o acciones reciben respuestas divergentes            | BLOQUEADO | `SHELL-AUTH-002`; `AUTH-ERR-020`                 | contrato tipado consumido en servidor, cliente y canales no navegacionales |
| `NS-GAP-005` | SHELL acepta cualquier URL absoluta `http/https` como `returnTo`                            | `src/app/login/page.tsx`                            | open redirect, phishing y cruce de ambiente                     | BLOQUEADO | `SHELL-AUTH-002`; `SHELL-AUTH-005`               | estado opaco firmado y allowlist por aplicación y ambiente                 |
| `NS-GAP-006` | el login navega directamente al `returnTo` recibido                                         | `src/features/auth/login-form.tsx`                  | replay, destino no autorizado y falta de revalidación           | BLOQUEADO | `SHELL-AUTH-002`; `SHELL-AUTH-005`               | retorno verificado, de un uso y nueva autorización del destino             |
| `NS-GAP-007` | depuración expone nombres de cookies en headers                                             | seis middlewares                                    | filtración de metadatos de autenticación                        | BLOQUEADO | `SHELL-AUTH-004`; `SHELL-AUTH-005`               | telemetría segura sin nombres ni valores de credenciales                   |
| `NS-GAP-008` | limpieza indiscriminada de todas las cookies `sb-*` visibles                                | seis middlewares                                    | interferencia entre proyecto, ambiente o aplicación             | BLOQUEADO | `SHELL-AUTH-002`; `SHELL-AUTH-005`               | limpieza por inventario exacto de cookies y atributos de emisión           |
| `NS-GAP-009` | el login muestra el destino y mensajes brutos de Auth, sin eventos ni correlación canónicos | login central                                       | exposición, experiencia inconsistente y diagnóstico no trazable | BLOQUEADO | `AUTH-ERR-020`; `SHELL-AUTH-004`; `SHELL-CI-016` | copy compartido, redacción, eventos y pruebas automatizadas                |

Reconciliación:

| Estado                                    | Cantidad |
| ----------------------------------------- | -------: |
| `BLOQUEADO` con tarea exacta              |        9 |
| Pendiente sin propietario                 |        0 |
| Presentado como implementado              |        0 |
| Cambios físicos ejecutados por esta tarea |        0 |

---

#### 22. Arquitectura objetivo sin implementación física

La implementación posterior deberá distribuir responsabilidades así:

| Responsabilidad                                     | Propietario documental o técnico   |
| --------------------------------------------------- | ---------------------------------- |
| identidad y envelope `AUTH_NO_SESSION`              | `vento-shell` / `SHELL-AUTH-001`   |
| adapters de middleware, servidor, cliente y canales | `SHELL-AUTH-002`                   |
| registro y migración de consumidoras                | `SHELL-AUTH-003`; `SHELL-AUTH-005` |
| lint, telemetría y gates contra lógica duplicada    | `SHELL-AUTH-004`                   |
| copy y mensajes compartidos                         | `AUTH-ERR-020`                     |
| separación entre denegación y error técnico         | `AUTH-ERR-019`                     |
| configuración inconsistente                         | `AUTH-ERR-017`                     |
| pruebas estándar por repositorio                    | `SHELL-CI-016`                     |
| bloqueo de merge o despliegue                       | `SHELL-CI-018`                     |
| evidencia por paquete                               | `SHELL-CI-019`                     |

Esta tarea no crea un paquete, no publica una librería y no modifica los
repositorios consumidores.

---

#### 23. Casos normativos

##### Caso A — Navegación sin cookies reconocidas

```text
ruta protegida
material de autenticación reconocido = ausente
```

Resultado:

```text
AUTH_NO_SESSION
SESSION_ABSENT
redirect temporal seguro al login
sin render protegido
```

##### Caso B — Cookie presente, sesión expirada confirmada

```text
credencial presente
proveedor confirma expiración
```

Resultado público:

```text
AUTH_NO_SESSION
```

Resultado interno:

```text
SESSION_EXPIRED
```

##### Caso C — Auth no responde

```text
timeout o excepción de red
no existe conclusión autoritativa
```

Resultado:

```text
NO usar AUTH_NO_SESSION
clasificar mediante AUTH-ERR-019
```

##### Caso D — Configuración Supabase ausente

Resultado:

```text
NO usar AUTH_NO_SESSION
AUTH-ERR-017 / AUTH-ERR-019
```

##### Caso E — Sesión válida, empleado inactivo

Resultado:

```text
AUTH-ERR-002
NO AUTH_NO_SESSION
```

##### Caso F — API protegida sin sesión

Resultado:

```text
HTTP 401
reason_code = AUTH_NO_SESSION
Content-Type apropiado
sin HTML de login
```

##### Caso G — POST sin sesión

Resultado:

```text
HTTP 401
mutación no ejecutada
body no reenviado
login posterior no repite POST
```

##### Caso H — `return_state` apunta a dominio no registrado

Resultado:

```text
estado rechazado
fallback a SHELL
registro de intento inválido
```

##### Caso I — PDF público firmado de ORIGO

Resultado:

```text
no exige sesión laboral por este contrato
valida su firma, alcance y vigencia propios
```

##### Caso J — Ruta vecina al PDF público

Resultado:

```text
no hereda la excepción
si es protegida y no hay sesión → AUTH_NO_SESSION
```

##### Caso K — Realtime abierto y sesión revocada

Resultado:

```text
terminar suscripción
no entregar eventos nuevos
AUTH_NO_SESSION tipado al cliente cuando el canal lo permita
```

##### Caso L — Login exitoso después del bloqueo

Resultado:

```text
sesión restaurada
solicitud nueva al destino seguro
reevaluación completa
sin ALLOW heredado
```

##### Caso M — Dispositivo compartido sin actor

Resultado:

```text
si no existe sesión autenticada del actor requerido → AUTH_NO_SESSION
no reutilizar actor anterior ni identidad del dispositivo como empleado
```

##### Caso N — Simulación abierta y sesión real perdida

Resultado:

```text
cerrar o inutilizar la superficie simulada
AUTH_NO_SESSION para la sesión real
WOULD_ALLOW no restaura autoridad
```

##### Caso O — Navegación atrás muestra caché sensible

Resultado:

```text
contenido sensible no visible
estado limpiado
experiencia de autenticación o bloqueo seguro
```

---

#### 24. Seguridad y privacidad

Controles obligatorios:

1. fail closed;
2. verificación en servidor;
3. código público estable;
4. ausencia de enumeración;
5. minimización del envelope;
6. `401` para principal ausente;
7. no usar `403` antes de autenticar;
8. no filtrar recursos o permisos;
9. no aceptar open redirects;
10. no transportar secretos en URL;
11. no repetir mutaciones;
12. no conservar contenido protegido en caché;
13. no registrar tokens o cookies;
14. no mezclar ambientes;
15. no borrar credenciales ajenas;
16. no usar resultados simulados;
17. no usar service role como fallback;
18. no resolver el actor desde estado de cliente;
19. no mostrar mensajes brutos del proveedor;
20. no confundir indisponibilidad con denegación.

---

#### 25. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

| ID              | Regla protegida                                                                                                                          | Tipo                     | Prioridad | Momento de implementación           | Destino                                            |
| --------------- | ---------------------------------------------------------------------------------------------------------------------------------------- | ------------------------ | --------- | ----------------------------------- | -------------------------------------------------- |
| `TREQ-AUTH-129` | ausencia, invalidez, expiración o revocación confirmada produce `AUTH_NO_SESSION`, `DENY`, principal no resuelto y `401` no navegacional | contractual + seguridad  | crítica   | adapter compartido de autenticación | `SHELL-AUTH-001`; `SHELL-AUTH-002`                 |
| `TREQ-AUTH-130` | fallos técnicos o de configuración no se clasifican como falta de sesión                                                                 | contractual + regresión  | crítica   | mensajes y adapters de error        | `AUTH-ERR-017`; `AUTH-ERR-019`                     |
| `TREQ-AUTH-131` | el bloqueo por falta de sesión precede razones de usuario, aplicación, permiso y contexto sin filtrar su existencia                      | seguridad + autorización | crítica   | resolutor y guards                  | `SHELL-AUTH-002`; `SHELL-AUTH-005`                 |
| `TREQ-AUTH-132` | cada canal usa redirect o `401` tipado según la matriz y nunca ejecuta una mutación                                                      | integración + E2E        | crítica   | migración de consumidoras           | `SHELL-AUTH-005`; `SHELL-CI-016`                   |
| `TREQ-AUTH-133` | retorno al login usa destino registrado, estado verificable, vigencia, nonce y reautorización completa                                   | seguridad + E2E          | crítica   | login y adapters compartidos        | `SHELL-AUTH-002`; `SHELL-AUTH-005`                 |
| `TREQ-AUTH-134` | no existen bucles de login ni repetición automática de solicitudes mutantes                                                              | E2E + regresión          | crítica   | consumidoras y login central        | `SHELL-AUTH-005`; `SHELL-CI-016`                   |
| `TREQ-AUTH-135` | tokens, cookies, nombres de cookies, errores brutos y destinos sensibles no aparecen en UI, headers, URL, logs o analytics               | seguridad + privacidad   | crítica   | telemetría y consumidoras           | `SHELL-AUTH-004`; `SHELL-AUTH-005`                 |
| `TREQ-AUTH-136` | copy, acciones y accesibilidad corresponden exactamente a “sin sesión” y no a inactividad o falta de permiso                             | interfaz + experiencia   | alta      | catálogo compartido de mensajes     | `AUTH-ERR-020`; `SHELL-CI-016`                     |
| `TREQ-AUTH-137` | auditoría conserva causa interna, canal, aplicación, correlación y resultado sin datos secretos; restaurar sesión no prueba autorización | auditoría + seguridad    | alta      | SDK y evidencia de paquete          | `SHELL-AUTH-001`; `SHELL-CI-019`                   |
| `TREQ-AUTH-138` | la regresión cierra las nueve brechas físicas y certifica cobertura de diez aplicaciones sin lógica duplicada no gobernada               | regresión + integración  | crítica   | migración y gates de consumidoras   | `SHELL-AUTH-004`; `SHELL-AUTH-005`; `SHELL-CI-018` |

El detalle canónico de estas diez filas se incorpora al Registro Canónico de
Requisitos de Prueba.

---

#### 26. Validaciones documentales definidas

El futuro validador deberá comprobar como mínimo:

1. existencia única de `AUTH_NO_SESSION`;
2. valor `401` para canales no navegacionales;
3. `DENY` y `executable=false`;
4. ausencia de principal y datos laborales;
5. cuatro causas internas exhaustivas;
6. separación de error técnico;
7. precedencia sobre razones posteriores;
8. diez canales con decisión;
9. diez aplicaciones con decisión;
10. retorno limitado a aplicaciones y ambientes registrados;
11. ausencia de URL arbitraria;
12. no repetición de mutaciones;
13. exclusión de login y callbacks;
14. protección contra bucles;
15. copy exacto;
16. accesibilidad mínima;
17. ausencia de secretos en observabilidad;
18. eventos mínimos;
19. nueve brechas con propietario y salida;
20. diez TREQ consecutivos y resolubles.

---

#### 27. Fuera del alcance

AUTH-ERR-001 no:

- implementa middleware;
- modifica login;
- crea SDK;
- publica paquetes;
- cambia cookies;
- invalida sesiones reales;
- modifica Supabase Auth;
- crea tablas de auditoría;
- crea funciones, RPC, triggers o RLS;
- modifica Edge Functions;
- cambia rutas públicas;
- corrige el open redirect observado;
- migra aplicaciones;
- define usuario inactivo;
- define acceso a aplicación;
- define permisos;
- define sede, área, turno, check-in, rol o dispositivo;
- define todos los errores técnicos;
- aprueba `AUTH-ERR-002`;
- ejecuta pruebas operativas.

Cada brecha física tiene tarea responsable exacta en la sección 21.

---

#### 28. Criterios de aceptación

AUTH-ERR-001 queda materialmente completa cuando se acepta que:

1. `AUTH_NO_SESSION` es el único código público;
2. pertenece al dominio de autenticación;
3. produce `DENY`;
4. no resuelve principal;
5. usa `401` fuera de navegación;
6. solo admite cuatro causas internas;
7. las causas internas no se filtran al usuario;
8. un error técnico no se convierte en sesión ausente;
9. configuración faltante no se convierte en sesión ausente;
10. usuario inactivo queda reservado a `AUTH-ERR-002`;
11. la falta de acceso a aplicación queda reservada a `AUTH-ERR-003`;
12. las razones de permiso y contexto se evalúan después;
13. sin sesión no se consultan datos de negocio para construir la respuesta;
14. una navegación protegida se bloquea antes de renderizar;
15. una mutación se rechaza sin reenvío ni reintento automático;
16. fetch, API, RPC y Edge Function reciben respuesta tipada;
17. Realtime y streams no entregan datos nuevos;
18. clientes nativos reciben estado tipado;
19. login, callback y recuperación permanecen accesibles;
20. las excepciones públicas usan contratos propios;
21. el retorno usa aplicaciones y ambientes registrados;
22. un destino arbitrario se rechaza;
23. el estado de retorno expira;
24. el estado de retorno no contiene secretos;
25. el destino se reautoriza después del login;
26. no existen bucles de autenticación;
27. el login no repite POST ni otra mutación;
28. la presencia de `sb-*` no prueba una sesión válida;
29. las cookies se limpian por identidad exacta;
30. los nombres de cookies no se exponen;
31. los errores brutos del proveedor no se muestran;
32. el copy aprobado es inequívoco;
33. las acciones de recuperación son seguras;
34. la experiencia es accesible;
35. el contenido protegido no queda en caché o UI residual;
36. la auditoría es correlacionable y minimizada;
37. restaurar sesión no constituye autorización;
38. las diez aplicaciones tienen decisión explícita;
39. Pass conserva separada la identidad de cliente;
40. AURA debe adoptar el contrato antes de activarse;
41. las nueve brechas físicas tienen propietario exacto;
42. ninguna brecha se presenta como implementada;
43. no quedan pendientes narrativos sin destino;
44. se generan `TREQ-AUTH-129` a `TREQ-AUTH-138`;
45. la tarea no realiza cambios físicos;
46. `AUTH-ERR-002` permanece reservada.

---

#### 29. Estado final y continuidad

| Tarea          | Estado      | Relación                                                      |
| -------------- | ----------- | ------------------------------------------------------------- |
| `AUTH-SIM-006` | APROBADA    | tarea anterior                                                |
| `AUTH-ERR-001` | APROBADA    | tarea actual preparada para confirmación canónica del usuario |
| `AUTH-ERR-002` | NO INICIADA | tarea siguiente reservada                                     |

```text
AUTH-SIM-006 — APROBADA
        ↓
AUTH-ERR-001 — APROBADA
        ↓
AUTH-ERR-002 — RESERVADA
```

No se inicia ni modifica `AUTH-ERR-002` en esta tarea.


### ✅ AUTH-ERR-002 — Usuario inactivo

**Estado:** APROBADA
**Tarea anterior:** `AUTH-ERR-001 — Sin sesión` — APROBADA
**Tarea siguiente:** `AUTH-ERR-003 — Sin acceso a la aplicación` — RESERVADA
**Tipo de tarea:** documental; definición contractual, funcional, técnica y de experiencia del bloqueo por identidad de dominio inactiva
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/S_MENSAJES_BLOQUEO/01_IDENTIDAD_APLICACION_Y_TERRITORIO.md`
**Artefactos producidos:** `INACTIVE-USER-BLOCKING-CONTRACT-001`, `INACTIVE-IDENTITY-STATE-MATRIX-001`, `INACTIVE-USER-CHANNEL-RESPONSE-MATRIX-001`, `INACTIVE-USER-APPLICATION-COVERAGE-REGISTER-001` e `INACTIVE-USER-PHYSICAL-RECONCILIATION-001`
**Decisiones consumidas:** `ADR-AUTH-001`; `AUTH-MOD-001`; `AUTH-MOD-019`; `AUTH-CAT-001`; `AUTH-CTX-005` a `AUTH-CTX-008`; `AUTH-CTX-015`; `AUTH-ERR-001`; catálogo canónico de aplicaciones; contratos vigentes de identidad, actor y autorización; estado desplegado de Supabase y consumidores inspeccionados
**Cambios físicos autorizados:** ninguno; no modifica código, sesiones, cookies, tokens, Supabase Auth, tablas, RLS, RPC, Edge Functions, datos, migraciones, configuración, aplicaciones ni despliegues

---

#### 1. Propósito

Definir de forma única y verificable qué debe ocurrir cuando una solicitud ya
posee un principal técnico autenticado válido, pero la identidad de dominio que
la aplicación necesita existe y está explícitamente inactiva.

La regla raíz queda:

```text
SESIÓN AUTENTICADA VÁLIDA
+
IDENTIDAD DE DOMINIO REQUERIDA
+
ESTADO EXPLÍCITO INACTIVO
→
DENY
+
AUTH_USER_INACTIVE
+
SIN EJECUCIÓN
```

La inactividad pertenece a la identidad empresarial, no a la validez técnica
de la sesión.

```text
PRINCIPAL AUTENTICADO VÁLIDO
≠
IDENTIDAD LABORAL ACTIVA
≠
IDENTIDAD DE CLIENTE ACTIVA
```

Por tanto, esta tarea impide que una aplicación:

- trate una sesión válida como autorización suficiente;
- permita que roles, permisos, sedes, áreas, turnos, check-ins o simulaciones
  reactiven una identidad inactiva;
- confunda `employees.is_active = false` con ausencia de sesión;
- confunda `public.users.is_active = false` con inactividad laboral;
- confunda un bloqueo técnico de Supabase Auth con estado empresarial inactivo;
- redirija repetidamente al login a una persona que ya está autenticada;
- cierre o destruya automáticamente la sesión Auth como sustituto del bloqueo;
- permita que una caché, suscripción, token de contexto o decisión anterior
  conserve autoridad después de la desactivación;
- revele razones laborales, administrativas, disciplinarias o comerciales que
  no pertenecen al contrato público de bloqueo.

---

#### 2. Resultado material

Se aprueban cinco artefactos documentales completos:

1. `INACTIVE-USER-BLOCKING-CONTRACT-001`, que congela identidad, precedencia,
   envelope, estado HTTP, recuperación, privacidad, auditoría y revalidación;
2. `INACTIVE-IDENTITY-STATE-MATRIX-001`, que materializa doce combinaciones de
   sesión, empleado, cliente y actor de dispositivo;
3. `INACTIVE-USER-CHANNEL-RESPONSE-MATRIX-001`, que decide el comportamiento
   para diez canales de entrega y ejecución;
4. `INACTIVE-USER-APPLICATION-COVERAGE-REGISTER-001`, que resuelve las diez
   aplicaciones canónicas sin mezclar identidad laboral y de cliente;
5. `INACTIVE-USER-PHYSICAL-RECONCILIATION-001`, que registra el snapshot
   desplegado, clasifica treinta y dos funciones y vincula las brechas físicas
   con tareas existentes.

Cobertura materializada:

| Elemento                                                        | Cantidad |
| --------------------------------------------------------------- | -------: |
| Código público canónico                                         |        1 |
| Causas internas de identidad inactiva                           |        3 |
| Estado HTTP no navegacional                                     | 1, `403` |
| Escenarios de identidad decididos                               |       12 |
| Canales con respuesta explícita                                 |       10 |
| Aplicaciones canónicas reconciliadas                            |       10 |
| Funciones PostgreSQL con referencia a `public.employees`        |       32 |
| Funciones con puerta estricta directa de actividad              |       13 |
| Funciones sin puerta estricta directa o con semántica permisiva |       14 |
| Funciones no autoritativas o pendientes de revisión semántica   |        5 |
| Políticas RLS con dependencia laboral directa o indirecta       |      161 |
| Políticas con predicado estricto visible en la propia política  |       13 |
| Políticas dependientes de helpers o sin predicado local visible |      148 |
| Empleados físicos observados                                    |       59 |
| Empleados físicos inactivos observados                          |       17 |
| Perfiles de cliente físicos observados                          |       83 |
| Perfiles de cliente inactivos observados                        |        1 |
| Sujetos Auth observados                                         |       76 |
| Sujetos simultáneamente empleado y cliente                      |       59 |
| Sujetos Auth bloqueados técnicamente en el instante observado   |        3 |
| Requisitos de prueba derivados                                  |       10 |

Las cifras físicas son evidencia de diagnóstico del snapshot inspeccionado. No
constituyen implementación ni congelan cantidades operativas futuras.

---

#### 3. Identidad canónica del bloqueo

La identidad pública única es:

```text
reason_code = AUTH_USER_INACTIVE
```

Propiedades normativas:

| Propiedad                   | Valor                                                    |
| --------------------------- | -------------------------------------------------------- |
| Dominio                     | identidad de dominio                                     |
| Decisión                    | `DENY`                                                   |
| Principal técnico           | autenticado y válido                                     |
| Identidad requerida         | existe                                                   |
| Estado de identidad         | explícitamente `INACTIVE`                                |
| Estado HTTP no navegacional | `403 Forbidden`                                          |
| Ejecutable                  | `false`                                                  |
| Recuperación pública        | salir, volver a superficie pública o solicitar revisión  |
| Reactivación automática     | prohibida                                                |
| Reintento                   | solicitud nueva después de una reactivación autoritativa |
| Exposición del motivo       | prohibida                                                |

Quedan prohibidos como identidad pública alternativa:

- `AUTH_NO_SESSION`;
- `NO_USER`;
- `EMPLOYEE_NOT_FOUND`;
- `ACCOUNT_BANNED`;
- `NO_PERMISSION`;
- `NO_APP_ACCESS`;
- `USER_DISABLED` sin contrato;
- mensajes libres de Supabase;
- excepciones SQL sin mapping;
- un booleano `false` sin razón tipada;
- una redirección al login como respuesta permanente.

Los textos humanos podrán localizarse, pero `AUTH_USER_INACTIVE` será estable,
versionado y no se traducirá.

---

#### 4. Definición exacta de “usuario inactivo”

Existe `AUTH_USER_INACTIVE` únicamente cuando se cumplen todas estas
condiciones:

1. la superficie exige una identidad de dominio;
2. la autenticación técnica pudo verificarse;
3. el principal técnico es válido;
4. la identidad de dominio requerida fue resuelta de forma inequívoca;
5. la fuente autoritativa declara explícitamente estado inactivo;
6. la inactividad aplica al dominio que la aplicación o acción requiere;
7. la evaluación ocurre dentro de un snapshot vigente;
8. ninguna reactivación autoritativa posterior ha sido observada.

Fuentes autoritativas vigentes por variante:

| Variante interna          | Fuente autoritativa          | Condición exacta    |
| ------------------------- | ---------------------------- | ------------------- |
| `EMPLOYEE_INACTIVE`       | `public.employees`           | `is_active = false` |
| `CUSTOMER_INACTIVE`       | `public.users`               | `is_active = false` |
| `ACTOR_EMPLOYEE_INACTIVE` | `public.employees` del actor | `is_active = false` |

Las variantes internas sirven para resolución y auditoría protegida. El usuario
recibe el mismo código público estable, con copy ajustado únicamente al dominio
de la aplicación sin revelar información sensible.

---

#### 5. Condiciones que no pertenecen a `AUTH_USER_INACTIVE`

| Condición observada                                          | Clasificación correcta                             | Tarea propietaria               |
| ------------------------------------------------------------ | -------------------------------------------------- | ------------------------------- |
| no existe sesión válida                                      | `AUTH_NO_SESSION`                                  | `AUTH-ERR-001`                  |
| la verificación Auth falla por red o timeout                 | error técnico                                      | `AUTH-ERR-019`                  |
| faltan variables, claves o configuración                     | configuración inconsistente                        | `AUTH-ERR-017`; `AUTH-ERR-019`  |
| la identidad requerida no existe                             | identidad incompleta o configuración inconsistente | `AUTH-CTX-007`; `AUTH-ERR-017`  |
| existen varias identidades candidatas incompatibles          | identidad ambigua, fail closed                     | `AUTH-CTX-007`; `AUTH-ERR-017`  |
| `employees.is_active` es `null`                              | estado incompleto, no identidad activa             | `AUTH-CTX-007`; `AUTH-ERR-017`  |
| `auth.users.banned_until` está vigente                       | ciclo técnico de Auth, no inactividad empresarial  | `AUTH-ERR-001`; `AUTH-ERR-019`  |
| existe empleado activo pero no acceso a la aplicación        | sin acceso a la aplicación                         | `AUTH-ERR-003`                  |
| existe empleado activo pero falta un permiso                 | bloqueo de permiso                                 | `AUTH-ERR-004` o posterior      |
| sede, área, turno, check-in o rol están inactivos o ausentes | bloqueo contextual específico                      | `AUTH-ERR-005` a `AUTH-ERR-014` |
| el dispositivo está inactivo                                 | dispositivo no autorizado                          | `AUTH-ERR-015`                  |
| la acción real se intenta desde simulación                   | acción no permitida en simulación                  | `AUTH-ERR-016`                  |
| un servicio técnico carece de actor o allowlist              | identidad técnica o delegación inválida            | `AUTH-CTX-006`; `AUTH-ERR-019`  |

Reglas críticas:

```text
ESTADO AUSENTE O NULO
≠
ESTADO ACTIVO
```

```text
SUJETO AUTH BLOQUEADO
≠
EMPLEADO INACTIVO
```

```text
EMPLEADO INACTIVO
≠
CLIENTE INACTIVO
```

---

#### 6. Precedencia dentro del árbol de bloqueo

Orden obligatorio para una aplicación laboral personal:

```text
1. superficie pública o protegida
2. verificación técnica disponible
3. sesión autenticada válida
4. identidad laboral resoluble y no ambigua
5. identidad laboral activa
6. acceso a la aplicación
7. rol, permisos y denegaciones
8. sede, área, turno, check-in y dispositivo
9. acción y recurso
```

Orden obligatorio para Vento Pass cliente:

```text
1. superficie pública o protegida
2. verificación técnica disponible
3. sesión autenticada válida
4. identidad de cliente resoluble y no ambigua
5. identidad de cliente activa
6. autorización del dominio Pass
7. acción y recurso
```

Orden obligatorio para un dispositivo compartido:

```text
1. principal técnico del dispositivo válido
2. dispositivo empresarial activo
3. sesión de actor vigente
4. empleado actor resoluble
5. empleado actor activo
6. turno, check-in, rol y territorio
7. permiso, acción y recurso
```

Si el paso de actividad produce `AUTH_USER_INACTIVE`:

- no se evalúan permisos residuales;
- no se aplican bypasses por rol;
- no se usan sedes o áreas asignadas;
- no se usa turno, check-in o sesión de actor como reactivación;
- no se acepta simulación;
- no se consulta el recurso para construir una razón posterior;
- no se ejecuta ninguna mutación;
- no se produce un segundo código público para el mismo intento.

---

#### 7. `INACTIVE-USER-BLOCKING-CONTRACT-001`

El contrato lógico mínimo será:

```ts
type InactiveUserBlockingReason = {
  contract: "INACTIVE-USER-BLOCKING-CONTRACT-001";
  contract_version: "1.0.0";
  reason_code: "AUTH_USER_INACTIVE";
  domain: "DOMAIN_IDENTITY";
  decision: "DENY";
  principal_state: "AUTHENTICATED";
  domain_identity_kind: "EMPLOYEE" | "CUSTOMER" | "ACTOR_EMPLOYEE";
  domain_identity_state: "INACTIVE";
  executable: false;
  recovery_action: "SIGN_OUT_OR_REQUEST_REVIEW";
  http_status: 403;
  app_code: string;
  channel: InactiveUserChannel;
  correlation_id: string;
  occurred_at: string;
};
```

La forma pública no incluirá:

- `auth_user_id`;
- `employee_id`;
- `customer_id`;
- `device_id`;
- nombre, alias, correo, teléfono o documento;
- rol;
- sede o área;
- turno o check-in;
- permiso solicitado;
- recurso exacto;
- fecha de retiro;
- motivo laboral, disciplinario, contractual o comercial;
- persona que desactivó la identidad;
- notas internas;
- token, cookie o JWT;
- estado `banned_until`;
- stack trace;
- mensaje bruto del proveedor.

El identificador de dominio y la causa interna completa se conservarán solo en
la evidencia de auditoría protegida.

---

#### 8. Efecto de la inactividad

La inactividad produce denegación total dentro del dominio afectado.

Para empleado inactivo:

```text
permisos base = no utilizables
permisos individuales = no utilizables
permisos operativos = no utilizables
sedes y áreas = no autorizan
turnos y check-ins = no autorizan
sesiones de actor = no autorizan
simulación = no autoriza ni puede iniciarse
```

Para cliente inactivo:

```text
puntos, beneficios, QR, redenciones y acciones de cliente = no ejecutables
identidad laboral independiente = no alterada
```

Para actor empleado inactivo en dispositivo compartido:

```text
dispositivo técnico = puede conservar operaciones técnicas expresas
actor empresarial = inválido
acción empresarial = denegada
sesión de actor = debe invalidarse o dejar de ser utilizable
```

La inactividad no borra por sí misma:

- historia laboral;
- historia comercial;
- auditoría;
- turnos históricos;
- movimientos o ventas previas;
- documentos;
- relaciones de atribución;
- identidad Auth;
- datos necesarios para obligaciones legales o contables.

---

#### 9. Sesión Auth y reactivación

Una identidad inactiva puede coexistir con una sesión Auth técnicamente válida.

Por defecto, el bloqueo empresarial:

- conserva la distinción entre autenticación e identidad de dominio;
- no convierte la sesión en anónima;
- no emite `401`;
- no redirige al login;
- no crea un bucle de autenticación;
- no elimina cookies indiscriminadamente;
- no revoca el sujeto Auth por inferencia;
- no reactiva la identidad al volver a iniciar sesión.

Una política de seguridad separada podrá ordenar revocación técnica de sesiones
cuando exista una tarea y mecanismo aprobados. Esa revocación no cambia la
clasificación histórica de la denegación original.

Reactivar requiere una escritura autoritativa en la fuente de dominio realizada
por una capacidad administrativa autorizada. Después de la reactivación:

1. se invalida el contexto anterior;
2. se emite una solicitud nueva;
3. se resuelven identidad y actividad desde cero;
4. se evalúan aplicación, permisos, contexto y recurso;
5. no se hereda ningún `ALLOW` anterior.

---

#### 10. Dualidad empleado–cliente

Una misma persona puede compartir `auth_user_id` con:

```text
identidad laboral
+
identidad de cliente
```

Los estados se evalúan de forma independiente.

| Empleado | Cliente  | Aplicación laboral   | Vento Pass cliente   |
| -------- | -------- | -------------------- | -------------------- |
| activo   | activo   | continúa evaluación  | continúa evaluación  |
| inactivo | activo   | `AUTH_USER_INACTIVE` | continúa evaluación  |
| activo   | inactivo | continúa evaluación  | `AUTH_USER_INACTIVE` |
| inactivo | inactivo | `AUTH_USER_INACTIVE` | `AUTH_USER_INACTIVE` |

Queda prohibido:

- usar `public.users.is_active` para autorizar Vento OS laboral;
- usar `employees.is_active` para bloquear automáticamente Vento Pass cliente;
- reactivar una identidad porque la otra está activa;
- copiar estado entre tablas;
- asumir que una única bandera representa todos los dominios.

---

#### 11. Mensaje humano canónico

Copy aprobado en español para una superficie laboral:

| Elemento          | Texto exacto                                                                                               |
| ----------------- | ---------------------------------------------------------------------------------------------------------- |
| Título            | `Tu acceso está inactivo`                                                                                  |
| Mensaje           | `Tu identidad para esta aplicación está inactiva. No puedes continuar mientras permanezca en este estado.` |
| Acción principal  | `Cerrar sesión`                                                                                            |
| Acción secundaria | `Volver a Vento OS`                                                                                        |
| Ayuda             | `Si consideras que es un error, solicita una revisión a un administrador autorizado.`                      |
| Código de soporte | `AUTH_USER_INACTIVE`                                                                                       |

Copy aprobado para Vento Pass cliente:

| Elemento          | Texto exacto                                                                                  |
| ----------------- | --------------------------------------------------------------------------------------------- |
| Título            | `Tu acceso está inactivo`                                                                     |
| Mensaje           | `Tu perfil de cliente está inactivo. No puedes continuar mientras permanezca en este estado.` |
| Acción principal  | `Cerrar sesión`                                                                               |
| Ayuda             | `Si consideras que es un error, solicita una revisión por el canal oficial de atención.`      |
| Código de soporte | `AUTH_USER_INACTIVE`                                                                          |

Reglas:

1. no afirmar que la sesión expiró;
2. no pedir que la persona vuelva a iniciar sesión como solución;
3. no afirmar que carece de permisos;
4. no mostrar motivo de desactivación;
5. no revelar fecha, responsable o notas internas;
6. no presentar una reactivación automática;
7. no culpar al usuario;
8. no prometer plazos de soporte;
9. no mostrar errores brutos;
10. mantener el código de soporte disponible sin dominar la interfaz.

---

#### 12. `INACTIVE-IDENTITY-STATE-MATRIX-001`

| ID      | Principal           | Identidad requerida                | Estado             | Resultado público              | Decisión  | Efecto adicional                  |
| ------- | ------------------- | ---------------------------------- | ------------------ | ------------------------------ | --------- | --------------------------------- |
| `IU-01` | anónimo             | cualquiera                         | no resoluble       | `AUTH_NO_SESSION`              | `DENY`    | pertenece a `AUTH-ERR-001`        |
| `IU-02` | humano autenticado  | empleado                           | inexistente        | identidad incompleta           | `DENY`    | `AUTH-CTX-007` y `AUTH-ERR-017`   |
| `IU-03` | humano autenticado  | empleado                           | `is_active = null` | identidad incompleta           | `DENY`    | nunca se trata como activo        |
| `IU-04` | humano autenticado  | empleado                           | activo             | continuar                      | pendiente | evaluar acceso a aplicación       |
| `IU-05` | humano autenticado  | empleado                           | inactivo           | `AUTH_USER_INACTIVE`           | `DENY`    | no evaluar permisos ni contexto   |
| `IU-06` | humano autenticado  | cliente                            | activo             | continuar                      | pendiente | evaluar dominio Pass              |
| `IU-07` | humano autenticado  | cliente                            | inactivo           | `AUTH_USER_INACTIVE`           | `DENY`    | no ejecutar acciones de cliente   |
| `IU-08` | humano autenticado  | empleado inactivo + cliente activo | según aplicación   | laboral deniega; Pass continúa | separada  | no copiar estado entre dominios   |
| `IU-09` | humano autenticado  | empleado activo + cliente inactivo | según aplicación   | laboral continúa; Pass deniega | separada  | no copiar estado entre dominios   |
| `IU-10` | dispositivo técnico | actor empleado                     | activo             | continuar                      | pendiente | evaluar sesión, turno y permiso   |
| `IU-11` | dispositivo técnico | actor empleado                     | inactivo           | `AUTH_USER_INACTIVE`           | `DENY`    | actor deja de ser utilizable      |
| `IU-12` | servicio técnico    | identidad laboral                  | no aplica          | contrato técnico               | pendiente | no usar esta razón por inferencia |

Cobertura:

```text
escenarios esperados = 12
escenarios materializados = 12
faltantes = 0
duplicados = 0
```

---

#### 13. `INACTIVE-USER-CHANNEL-RESPONSE-MATRIX-001`

| Canal o superficie                      | Respuesta obligatoria                                       |            Estado | Efectos prohibidos                                                  |
| --------------------------------------- | ----------------------------------------------------------- | ----------------: | ------------------------------------------------------------------- |
| navegación web protegida                | renderizar superficie de bloqueo autenticada y accesible    |   `403` semántico | redirect al login, contenido protegido o navegación autorizada      |
| formulario o mutación web               | detener antes de la escritura y devolver razón tipada       |             `403` | reintento automático, escritura parcial o mensaje genérico          |
| fetch de cliente                        | envelope JSON canónico                                      |             `403` | HTML de login, datos parciales o fallback permisivo                 |
| Route Handler o API                     | envelope JSON canónico con correlación                      |             `403` | ejecutar handler de negocio o revelar recurso                       |
| Server Action                           | error tipado serializable y cero efectos                    |      `403` lógico | lanzar texto bruto, repetir acción o usar caché anterior            |
| RPC o PostgREST                         | fail closed y mapping estable a `AUTH_USER_INACTIVE`        |  `403` en adapter | excepción libre, booleano ambiguo o `ALLOW` residual                |
| RLS                                     | impedir lectura o escritura empresarial                     | no expone detalle | confiar solo en UI o conceder por helper permisivo                  |
| Edge Function                           | verificar actividad antes de operación empresarial          |             `403` | service role como bypass o notificación posterior a efecto          |
| Realtime, stream o suscripción          | negar o cerrar entrega de datos nuevos y limpiar proyección |     evento tipado | conservar flujo, datos de otra sede o caché sensible                |
| cliente nativo o dispositivo compartido | estado tipado; actor inactivo vuelve a selección segura     |      `403` lógico | cerrar dispositivo completo por inferencia o aceptar actor residual |

Todo canal deberá conservar:

```text
reason_code = AUTH_USER_INACTIVE
decision = DENY
executable = false
```

---

#### 14. Navegación y recuperación

Una navegación ya autenticada no se redirige al login.

La superficie de bloqueo deberá:

- reemplazar contenido protegido antes de renderizar datos;
- conservar una ruta pública o neutral para salir;
- permitir cerrar sesión;
- permitir volver a una superficie pública de Vento OS;
- evitar loops entre aplicación, SHELL y login;
- impedir que el botón atrás restaure contenido sensible;
- anunciar el título y mensaje mediante tecnologías de asistencia;
- mover foco al encabezado del bloqueo;
- no depender exclusivamente de color o iconografía.

No existe autorreactivación. La acción de solicitar revisión:

- no cambia `is_active`;
- no crea una solicitud si no existe un proceso propietario aprobado;
- no expone datos internos;
- no promete resolución;
- no impide cerrar sesión.

---

#### 15. Revalidación, caché y concurrencia

La actividad deberá revalidarse en cada frontera autoritativa donde pueda
producirse un efecto empresarial.

Controles obligatorios:

1. un contexto construido antes de la desactivación queda obsoleto;
2. una decisión `ALLOW` anterior no sobrevive al cambio de actividad;
3. una caché de rol, sede, permiso o navegación no puede restaurar autoridad;
4. una suscripción Realtime no continúa entregando datos nuevos;
5. un token o referencia de contexto no convierte el estado anterior en válido;
6. una mutación debe verificar actividad en servidor antes del efecto;
7. cuando la operación posea una frontera transaccional, la actividad deberá
   revalidarse dentro o inmediatamente antes de esa frontera;
8. si la identidad cambia a inactiva antes del commit autoritativo, la operación
   se aborta sin efecto parcial;
9. jobs y procesos delegados no siguen atribuyendo acciones a un actor inactivo;
10. reactivar no reanuda automáticamente la operación original.

La implementación de invalidación, fingerprints y productor canónico de
contexto corresponde a `AUTH-DB-033`, `AUTH-DB-035`, `SHELL-AUTH-001` y
`SHELL-AUTH-002`.

---

#### 16. Auditoría y privacidad

Eventos conceptuales mínimos:

| Evento                                      | Cuándo se registra                               | Datos mínimos                                         |
| ------------------------------------------- | ------------------------------------------------ | ----------------------------------------------------- |
| `auth.domain_identity_inactive_detected`    | una solicitud encuentra identidad inactiva       | correlación, app, canal, clase de identidad, snapshot |
| `auth.domain_identity_inactive_denied`      | se emite la denegación                           | razón pública, decisión, ejecutable, versión          |
| `auth.inactive_actor_session_invalidated`   | un actor de dispositivo deja de ser utilizable   | dispositivo referenciado, actor protegido, instante   |
| `auth.domain_identity_reactivated_observed` | una solicitud nueva observa actividad restaurada | correlación, app, versión, sin heredar autorización   |

La auditoría protegida podrá conservar identificadores internos cuando sean
necesarios para trazabilidad. No registrará:

- token o cookie;
- PIN;
- motivo laboral o comercial libre;
- documentos;
- notas disciplinarias;
- salario;
- datos de salud;
- cuerpo completo de la solicitud;
- recurso sensible completo;
- stack trace en eventos funcionales.

La interfaz, analytics y logs públicos solo usarán datos minimizados.

---

#### 17. `INACTIVE-USER-APPLICATION-COVERAGE-REGISTER-001`

| Aplicación | Identidad requerida       | Estado que produce el bloqueo    | Decisión | Particularidad                                                       |
| ---------- | ------------------------- | -------------------------------- | -------- | -------------------------------------------------------------------- |
| `shell`    | empleado                  | `employees.is_active = false`    | `DENY`   | muestra superficie central autenticada; no loop de login             |
| `anima`    | empleado                  | `employees.is_active = false`    | `DENY`   | no permite asistencia, documentos ni gestión personal laboral        |
| `viso`     | empleado                  | `employees.is_active = false`    | `DENY`   | roles administrativos residuales no crean bypass                     |
| `nexo`     | empleado o actor empleado | empleado o actor inactivo        | `DENY`   | dispositivo técnico puede conservar solo funciones técnicas expresas |
| `fogo`     | empleado o actor empleado | empleado o actor inactivo        | `DENY`   | no inicia ni modifica ejecución productiva                           |
| `origo`    | empleado o actor empleado | empleado o actor inactivo        | `DENY`   | no compra, aprueba ni recibe mediante identidad residual             |
| `pulso`    | empleado o actor empleado | empleado o actor inactivo        | `DENY`   | no vende, cobra, redime ni opera caja                                |
| `numera`   | empleado                  | `employees.is_active = false`    | `DENY`   | no expone ni modifica información financiera                         |
| `aura`     | empleado                  | `employees.is_active = false`    | `DENY`   | contrato obligatorio antes de activar la aplicación diferida         |
| `pass`     | cliente                   | `public.users.is_active = false` | `DENY`   | actividad laboral no determina la identidad de cliente               |

Cobertura:

```text
aplicaciones esperadas = 10
aplicaciones materializadas = 10
faltantes = 0
duplicados = 0
```

---

#### 18. Dispositivo compartido

El dispositivo y el actor son identidades distintas.

```text
DISPOSITIVO ACTIVO
+
ACTOR EMPLEADO INACTIVO
→
DISPOSITIVO TÉCNICO PUEDE SEGUIR ACTIVO
+
ACTOR EMPRESARIAL NO PUEDE OPERAR
```

Al detectar `ACTOR_EMPLOYEE_INACTIVE`:

- la sesión de actor deja de satisfacer autorización empresarial;
- las firmas o referencias no consumidas no podrán utilizarse;
- el dispositivo vuelve a selección segura de actor;
- no se reutiliza el último rol, turno, área o permiso;
- no se transfiere la acción a otro empleado;
- no se cierra la credencial técnica por inferencia;
- no se expone al dispositivo el motivo interno de desactivación;
- la acción original no se repite después de seleccionar otro actor.

La protección física deberá implementarse mediante `SHELL-AUTH-001`,
`SHELL-AUTH-002`, `SHELL-AUTH-005` y los productores canónicos de contexto de
`AUTH-DB-033`.

---

#### 19. Estado físico observado

Snapshot de solo lectura:

```text
proyecto Supabase = vento-os-dev
project_ref = clzdpinthhtknkmefsxx
inspeccionado_en = 2026-08-04T02:27:02Z
```

Distribución observada:

| Métrica                                                 | Resultado |
| ------------------------------------------------------- | --------: |
| empleados                                               |        59 |
| empleados activos                                       |        42 |
| empleados inactivos                                     |        17 |
| empleados con `is_active = null`                        |         0 |
| perfiles de cliente                                     |        83 |
| clientes activos                                        |        82 |
| clientes inactivos                                      |         1 |
| sujetos Auth                                            |        76 |
| sujetos Auth confirmados                                |        68 |
| sujetos Auth bloqueados técnicamente                    |         3 |
| sujetos Auth eliminados                                 |         0 |
| sujetos vinculados a empleado                           |        59 |
| sujetos vinculados a cliente                            |        76 |
| sujetos vinculados simultáneamente a empleado y cliente |        59 |
| empleados sin sujeto Auth                               |         0 |
| clientes sin sujeto Auth                                |         7 |

Conclusiones verificables:

1. la inactividad empresarial existe materialmente;
2. los diecisiete empleados inactivos conservan sujeto Auth vinculado;
3. todos los empleados observados también poseen perfil de cliente;
4. el estado laboral y el estado de cliente no pueden fusionarse;
5. los tres bloqueos técnicos de Auth no prueban inactividad empresarial;
6. `employees.is_active` es físicamente nullable aunque actualmente no posee
   filas nulas;
7. no se observó trigger de desactivación que invalide de forma centralizada
   contexto, caché, sesión de actor o sesión Auth.

No se realizaron escrituras, DDL, DML, cambios de Auth ni modificaciones de
datos durante la inspección.

---

#### 20. Matriz física de funciones con dependencia de `employees`

La inspección materializó las treinta y dos funciones PostgreSQL que contienen
referencia a `public.employees`. La columna “tratamiento directo” describe la
presencia visible de una puerta estricta en la función, no certifica por sí sola
la seguridad del flujo completo.

|    # | Función                                                 | Tratamiento directo de actividad                | Decisión documental                                            | Destino                         |
| ---: | ------------------------------------------------------- | ----------------------------------------------- | -------------------------------------------------------------- | ------------------------------- |
|    1 | `anima_diagnostic_push_token_coverage()`                | `e.is_active = true`                            | puerta estricta visible                                        | regresión en `SHELL-CI-016`     |
|    2 | `anima_is_active_employee()`                            | `e.is_active = true`                            | puerta estricta visible                                        | SDK en `SHELL-AUTH-001`         |
|    3 | `anima_is_active_owner()`                               | `e.is_active = true`                            | puerta estricta visible                                        | SDK en `SHELL-AUTH-001`         |
|    4 | `can_access_area(uuid)`                                 | no verifica directamente actividad del empleado | requiere cierre transitivo                                     | `AUTH-DB-033`; `SHELL-AUTH-005` |
|    5 | `can_access_site(uuid)`                                 | acepta `is_active is null`                      | incompatible con fail closed                                   | `AUTH-DB-033`; `SHELL-AUTH-005` |
|    6 | `can_manage_context_simulation_v1(uuid)`                | sin puerta directa visible                      | no puede aceptar simulador inactivo                            | `AUTH-DB-033`; `SHELL-AUTH-005` |
|    7 | `close_open_attendance_day_end(text)`                   | `coalesce(e.is_active,false)=true`              | filtro estricto visible; revisar efecto histórico              | `AUTH-ERR-019`; `SHELL-CI-016`  |
|    8 | `close_stale_open_attendance_shifts(timestamptz,text)`  | sin puerta directa visible                      | mantenimiento, no autoridad de usuario; requiere clasificación | `AUTH-ERR-019`                  |
|    9 | `current_actor_shift_for_shared_device_v1(...)`         | `e.is_active is true`                           | puerta estricta visible                                        | `AUTH-DB-033`                   |
|   10 | `current_employee_primary_site_id()`                    | sin puerta directa visible                      | no debe devolver contexto autorizante para inactivo            | `AUTH-DB-033`                   |
|   11 | `current_employee_role()`                               | sin puerta directa visible                      | no debe devolver rol autorizante para inactivo                 | `AUTH-DB-033`                   |
|   12 | `current_employee_selected_area_id()`                   | sin puerta directa visible                      | no debe devolver territorio autorizante para inactivo          | `AUTH-DB-033`                   |
|   13 | `employee_wallet_eligibility(uuid)`                     | actividad incorporada a elegibilidad            | puerta fail closed visible                                     | regresión en `SHELL-CI-016`     |
|   14 | `enforce_attendance_geofence()`                         | solo rechaza `is_active is false`               | `null` no queda cerrado                                        | `AUTH-DB-033`; `SHELL-AUTH-005` |
|   15 | `enforce_employee_inventory_location_assignment_site()` | sin puerta directa de empleado                  | trigger de configuración; no concede autoridad por sí solo     | `AUTH-ERR-019`                  |
|   16 | `get_effective_context_v1(text)`                        | sin puerta directa visible                      | brecha crítica de contexto efectivo                            | `AUTH-DB-033`; `SHELL-AUTH-005` |
|   17 | `get_operational_context(uuid,uuid,text)`               | sin puerta directa de empleado                  | puede construir contexto sin actividad laboral                 | `AUTH-DB-033`; `SHELL-AUTH-005` |
|   18 | `has_permission(text,uuid,uuid)`                        | `e.is_active = true`                            | puerta estricta visible                                        | preservar en `AUTH-DB-034`      |
|   19 | `is_employee()`                                         | `coalesce(e.is_active,true)=true`               | `null` tratado como activo; incompatible                       | `AUTH-DB-033`; `SHELL-AUTH-005` |
|   20 | `mark_restock_request_in_transit(uuid)`                 | `e.is_active = true`                            | puerta estricta visible                                        | preservar en `AUTH-SRV-015`     |
|   21 | `nexo_kiosk_withdraw_workers(uuid)`                     | `coalesce(e.is_active,true)=true`               | puede listar trabajador con estado nulo                        | `AUTH-DB-033`; `SHELL-AUTH-005` |
|   22 | `reconcile_staff_invitations()`                         | `is_active is distinct from false`              | estado nulo tratado como aceptable                             | `AUTH-DB-033`; `SHELL-AUTH-005` |
|   23 | `register_shift_departure_event(...)`                   | `coalesce(is_active,false)`                     | puerta estricta visible                                        | preservar en `SHELL-CI-016`     |
|   24 | `register_shift_departure_event_autoclose(...)`         | `coalesce(is_active,false)`                     | puerta estricta visible                                        | preservar en `SHELL-CI-016`     |
|   25 | `set_employee_kiosk_pin(uuid,text)`                     | sin puerta directa visible                      | no debe habilitar credencial de actor inactivo                 | `AUTH-DB-033`; `SHELL-AUTH-005` |
|   26 | `shared_device_actor_is_allowed_v1(...)`                | actor exige booleano verdadero                  | puerta estricta visible                                        | preservar en `AUTH-DB-033`      |
|   27 | `sign_shared_device_action(...)`                        | `e.is_active is true`                           | puerta estricta visible                                        | preservar en `AUTH-SRV-015`     |
|   28 | `start_attendance_break(uuid,text,text)`                | `coalesce(is_active,false)`                     | puerta estricta visible                                        | preservar en `SHELL-CI-016`     |
|   29 | `support_ticket_is_visible_to_current_employee(uuid)`   | sin puerta directa del empleado actual          | requiere cierre transitivo                                     | `AUTH-DB-033`; `SHELL-AUTH-005` |
|   30 | `sync_employee_primary_site_assignment()`               | no es guard de usuario                          | sincronización; no puede reactivar autoridad                   | `AUTH-ERR-019`                  |
|   31 | `verify_employee_kiosk_pin(uuid,text)`                  | `is_active is true`                             | puerta estricta visible                                        | preservar en `AUTH-DB-033`      |
|   32 | `viso_enforce_monthly_schedule_publish_limit()`         | sin puerta directa visible                      | trigger o guard debe conservar actor activo cuando aplique     | `AUTH-DB-033`; `SHELL-AUTH-005` |

Reconciliación:

```text
funciones esperadas = 32
funciones materializadas = 32
faltantes = 0
duplicados = 0
puerta estricta directa = 13
sin puerta estricta directa o semántica permisiva = 14
mantenimiento/configuración/revisión semántica = 5
```

Una función sin puerta local no se declara automáticamente explotable: puede
depender de un helper transitivo. Precisamente por ello `AUTH-DB-033` y
`SHELL-AUTH-005` deberán certificar la cadena completa en vez de aceptar la
presencia de un helper por nombre.

---

#### 21. RLS y consumidores físicos

La consulta agregada de políticas observó:

```text
políticas con dependencia laboral directa o indirecta = 161
predicado estricto visible en la política = 13
dependencia de helper o sin predicado local visible = 148
```

Esto no prueba que las 148 políticas concedan acceso a una identidad inactiva.
Sí prueba que su conformidad depende de helpers y cadenas transitorias que no
pueden certificarse mediante inspección local de la política.

Decisión:

- `AUTH-DB-033` deberá resolver la identidad activa una sola vez en el contexto
  canónico;
- `AUTH-DB-034` deberá consumir esa identidad y producir la decisión;
- `SHELL-AUTH-004` deberá detectar helpers legacy permisivos;
- `SHELL-AUTH-005` deberá migrar consumidores;
- `SHELL-CI-018` deberá impedir despliegue con rutas no certificadas.

Consumidores confirmados:

| Consumidor                                  | Hallazgo                                                                                        | Decisión                                                | Destino                            |
| ------------------------------------------- | ----------------------------------------------------------------------------------------------- | ------------------------------------------------------- | ---------------------------------- |
| middleware de seis aplicaciones laborales   | valida sesión Auth, pero no actividad de identidad empresarial                                  | no es suficiente para permitir render o acción          | `SHELL-AUTH-002`; `SHELL-AUTH-005` |
| NEXO `src/lib/auth/operational-context.ts`  | consume `get_operational_context.can_operate` y no posee razón `employee_inactive`              | debe consumir razón canónica, sin override que reactive | `SHELL-AUTH-005`                   |
| ORIGO `src/lib/auth/operational-session.ts` | consulta empleado sin `is_active` y construye sesión laboral incluso sin fila activa confirmada | debe fallar cerrado antes de rol, sede y permiso        | `SHELL-AUTH-005`                   |
| helpers SQL de contexto                     | tratamiento heterogéneo de `false`, `null` y ausencia                                           | unificar productor canónico                             | `AUTH-DB-033`; `AUTH-DB-034`       |
| RLS dependiente de helpers                  | seguridad transitiva no verificable por predicado local                                         | certificar cadena y retirar helpers incompatibles       | `AUTH-DB-033`; `SHELL-AUTH-004`    |

---

#### 22. Registro de brechas físicas

| ID           | Brecha                                                                      | Estado                   | Riesgo                                         | Propietario                        | Condición de salida                                   |
| ------------ | --------------------------------------------------------------------------- | ------------------------ | ---------------------------------------------- | ---------------------------------- | ----------------------------------------------------- |
| `IU-GAP-001` | middleware considera suficiente un usuario Auth válido                      | `IDENTIFICADO`           | render y consultas antes de resolver actividad | `SHELL-AUTH-002`; `SHELL-AUTH-005` | adapter compartido bloquea antes de datos             |
| `IU-GAP-002` | `get_effective_context_v1` no muestra puerta directa de empleado activo     | `IDENTIFICADO`           | contexto efectivo de identidad inactiva        | `AUTH-DB-033`                      | productor canónico fail closed y pruebas              |
| `IU-GAP-003` | `get_operational_context` no verifica directamente empleado activo          | `IDENTIFICADO`           | `can_operate` potencialmente inconsistente     | `AUTH-DB-033`; `SHELL-AUTH-005`    | razón canónica y cero autoridad residual              |
| `IU-GAP-004` | helpers de rol, sede y área no verifican actividad directamente             | `IDENTIFICADO`           | contexto residual                              | `AUTH-DB-033`                      | helpers privados consumen identidad activa            |
| `IU-GAP-005` | `can_access_site`, `is_employee` y otros aceptan estado nulo                | `IDENTIFICADO`           | fail open ante dato incompleto                 | `AUTH-DB-033`; `SHELL-AUTH-004`    | nulo produce identidad incompleta y `DENY`            |
| `IU-GAP-006` | NEXO no presenta razón específica de empleado inactivo                      | `IDENTIFICADO`           | mensaje incorrecto y override de contexto      | `SHELL-AUTH-005`; `AUTH-ERR-020`   | reason code compartido y copy aprobado                |
| `IU-GAP-007` | ORIGO construye sesión de empleado sin seleccionar `is_active`              | `IDENTIFICADO`           | rol y sede residuales                          | `SHELL-AUTH-005`                   | resolución tipada exige actividad verdadera           |
| `IU-GAP-008` | 148 políticas dependen de cadena transitiva sin predicado local visible     | `PENDIENTE_DE_EVIDENCIA` | adopción parcial o helper permisivo            | `AUTH-DB-033`; `SHELL-CI-018`      | matriz de dependencia y pruebas de identidad inactiva |
| `IU-GAP-009` | no existe invalidación central observada al desactivar empleado             | `IDENTIFICADO`           | caché, contexto o actor session obsoletos      | `AUTH-DB-035`; `SHELL-AUTH-001`    | fingerprint e invalidación certificada                |
| `IU-GAP-010` | estado laboral y de cliente comparten sujetos sin contrato físico unificado | `IDENTIFICADO`           | bloqueo cruzado de dominio                     | `AUTH-DB-019`; `SHELL-AUTH-001`    | vínculo tipado conserva estados independientes        |

No se crea una tarea nueva porque todas las brechas poseen propietario canónico
existente, momento de resolución y condición de salida verificable.

---

#### 23. Casos normativos

##### Caso A — Sesión válida y empleado inactivo

```text
principal = VALID
employee.is_active = false
```

Resultado:

```text
AUTH_USER_INACTIVE
403
DENY
```

No se redirige al login.

##### Caso B — Empleado activo sin acceso a NEXO

```text
employee.is_active = true
nexo.access = false
```

Resultado:

```text
AUTH-ERR-003
```

No se usa `AUTH_USER_INACTIVE`.

##### Caso C — Empleado inactivo con rol propietario

Resultado:

```text
DENY
```

El nombre del rol no produce bypass.

##### Caso D — Empleado inactivo con permiso individual permitido

Resultado:

```text
DENY
```

La asignación residual se conserva como historia, no como autoridad.

##### Caso E — Empleado inactivo con turno y check-in abiertos

Resultado:

```text
DENY
```

El contexto operativo queda inutilizable y la corrección histórica se maneja
por procesos propietarios.

##### Caso F — Empleado inactivo y cliente activo

Aplicación laboral:

```text
AUTH_USER_INACTIVE
```

Vento Pass:

```text
continúa evaluación de cliente
```

##### Caso G — Empleado activo y cliente inactivo

Vento Pass:

```text
AUTH_USER_INACTIVE
```

Aplicación laboral:

```text
continúa evaluación laboral
```

##### Caso H — Estado laboral nulo

Resultado:

```text
DENY
identity incomplete
```

No se usa `AUTH_USER_INACTIVE` ni se asume activo.

##### Caso I — Auth `banned_until` vigente

Resultado:

```text
clasificación técnica de Auth
```

No se traduce automáticamente a empleado inactivo.

##### Caso J — Actor de dispositivo se desactiva durante uso

Resultado:

```text
actor session no utilizable
acción abortada
selección segura de actor
```

El dispositivo no hereda permisos del actor anterior.

##### Caso K — Desactivación durante mutación no confirmada

Resultado:

```text
revalidación antes de frontera autoritativa
sin efecto parcial
AUTH_USER_INACTIVE
```

##### Caso L — Reactivación posterior

Resultado:

```text
solicitud nueva
contexto nuevo
autorización completa nueva
```

No se reanuda la acción original.

---

#### 24. Seguridad y privacidad

Controles obligatorios:

1. fail closed;
2. sesión y actividad separadas;
3. `403` para principal autenticado con identidad inactiva;
4. actividad explícitamente verdadera;
5. estado nulo nunca equivale a activo;
6. precedencia sobre permisos y contexto;
7. aislamiento empleado–cliente;
8. aislamiento dispositivo–actor;
9. no bypass por rol;
10. no bypass por permiso residual;
11. no bypass por turno o check-in;
12. no bypass por simulación;
13. revalidación en servidor;
14. invalidación de caché y contexto;
15. cierre de suscripciones nuevas;
16. no repetición de mutaciones;
17. no revocación Auth por inferencia;
18. no exposición de motivos internos;
19. auditoría minimizada;
20. copy accesible y estable.

---

#### 25. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

| ID              | Regla protegida                                                                                                             | Tipo                             | Prioridad | Momento de implementación             | Destino                                                           |
| --------------- | --------------------------------------------------------------------------------------------------------------------------- | -------------------------------- | --------- | ------------------------------------- | ----------------------------------------------------------------- |
| `TREQ-AUTH-139` | sesión válida más identidad requerida explícitamente inactiva produce `AUTH_USER_INACTIVE`, `DENY`, `403` y cero efectos    | contractual + seguridad          | crítica   | productor y adapter canónicos         | `AUTH-DB-033`; `SHELL-AUTH-002`                                   |
| `TREQ-AUTH-140` | inactividad precede aplicación, roles, permisos, sedes, turnos, check-ins, dispositivos y simulación                        | autorización + regresión         | crítica   | evaluador y migración de consumidores | `AUTH-DB-034`; `SHELL-AUTH-005`                                   |
| `TREQ-AUTH-141` | actividad laboral y de cliente se resuelven por separado para sujetos con ambas identidades                                 | contractual + integración        | crítica   | vínculos de identidad y SDK           | `AUTH-DB-019`; `SHELL-AUTH-001`                                   |
| `TREQ-AUTH-142` | actor empleado inactivo invalida autoridad empresarial sin convertir el dispositivo técnico en empleado                     | seguridad + dispositivo + E2E    | crítica   | contexto compartido y consumidores    | `AUTH-DB-033`; `SHELL-AUTH-005`                                   |
| `TREQ-AUTH-143` | los diez canales aplican bloqueo autenticado o `403` tipado, sin redirect al login, retry ni mutación                       | integración + E2E + regresión    | crítica   | adapters y consumidoras               | `SHELL-AUTH-002`; `SHELL-AUTH-005`; `SHELL-CI-016`                |
| `TREQ-AUTH-144` | estado ausente, nulo o ambiguo falla cerrado como identidad incompleta y nunca como activo o inactivo confirmado            | contractual + datos + regresión  | crítica   | productor canónico                    | `AUTH-DB-033`; `AUTH-ERR-017`; `SHELL-CI-016`                     |
| `TREQ-AUTH-145` | desactivación invalida contexto, caché, decisiones, actor session y entrega de datos antes de un efecto nuevo               | concurrencia + seguridad + E2E   | crítica   | frescura e invalidación               | `AUTH-DB-035`; `SHELL-AUTH-001`; `SHELL-CI-018`                   |
| `TREQ-AUTH-146` | copy, accesibilidad y recuperación no revelan motivo interno ni prometen reactivación                                       | interfaz + experiencia           | alta      | mensajes compartidos                  | `AUTH-ERR-020`; `SHELL-CI-016`                                    |
| `TREQ-AUTH-147` | auditoría distingue identidad inactiva de Auth bloqueado, no destruye sesión por inferencia y no reutiliza autorización     | auditoría + seguridad            | alta      | SDK y evidencia                       | `SHELL-AUTH-001`; `SHELL-CI-019`                                  |
| `TREQ-AUTH-148` | regresión reconcilia 32 funciones, cadena RLS y consumidores, cerrando las diez brechas físicas sin bloquear dominios sanos | regresión + RPC + RLS + estática | crítica   | migración y gates de consumidoras     | `AUTH-DB-033`; `SHELL-AUTH-004`; `SHELL-AUTH-005`; `SHELL-CI-018` |

El detalle canónico de estas diez filas se incorpora al Registro Canónico de
Requisitos de Prueba.

---

#### 26. Validaciones documentales definidas

El futuro validador deberá comprobar como mínimo:

1. existencia única de `AUTH_USER_INACTIVE`;
2. decisión `DENY`;
3. `executable=false`;
4. estado `403` fuera de navegación;
5. principal autenticado conservado;
6. tres causas internas exhaustivas;
7. ausencia de Auth ban como causa empresarial;
8. actividad explícitamente verdadera;
9. estado nulo clasificado como incompleto;
10. precedencia sobre acceso a aplicación;
11. precedencia sobre permisos y contexto;
12. separación empleado–cliente;
13. separación dispositivo–actor;
14. doce escenarios materializados;
15. diez canales materializados;
16. diez aplicaciones materializadas;
17. no redirect al login;
18. no reintento de mutación;
19. copy exacto y accesible;
20. auditoría minimizada;
21. invalidación de contexto y caché;
22. cierre de suscripciones nuevas;
23. treinta y dos funciones reconciliadas;
24. diez brechas físicas con propietario y salida;
25. diez TREQ consecutivos y resolubles.

---

#### 27. Fuera del alcance

AUTH-ERR-002 no:

- activa o desactiva usuarios;
- modifica `employees.is_active`;
- modifica `public.users.is_active`;
- bloquea o desbloquea sujetos Auth;
- revoca sesiones;
- limpia cookies;
- cierra turnos históricos;
- termina check-ins mediante DML;
- invalida físicamente sesiones de actor;
- modifica RLS;
- modifica funciones o RPC;
- crea triggers;
- crea eventos de auditoría físicos;
- crea SDK;
- modifica middleware;
- corrige NEXO u ORIGO;
- migra aplicaciones;
- implementa UI;
- define acceso a aplicación;
- aprueba `AUTH-ERR-003`;
- ejecuta pruebas operativas.

Toda brecha física tiene destino exacto en las secciones 20 a 22.

---

#### 28. Criterios de aceptación

AUTH-ERR-002 queda materialmente completa cuando se acepta que:

1. `AUTH_USER_INACTIVE` es el único código público de esta razón;
2. la sesión técnica ya fue validada;
3. la identidad requerida existe;
4. el estado inactivo es explícito;
5. el dominio es identidad empresarial;
6. la decisión es `DENY`;
7. `executable=false`;
8. el estado no navegacional es `403`;
9. no se usa `401`;
10. no se redirige al login;
11. no se destruye la sesión Auth por inferencia;
12. volver a iniciar sesión no reactiva;
13. `EMPLOYEE_INACTIVE` procede de `employees.is_active=false`;
14. `CUSTOMER_INACTIVE` procede de `public.users.is_active=false`;
15. `ACTOR_EMPLOYEE_INACTIVE` procede del empleado actor;
16. Auth ban no equivale a identidad inactiva;
17. ausencia de fila no equivale a inactividad;
18. estado nulo no equivale a activo;
19. identidad ambigua falla cerrado;
20. inactividad precede acceso a aplicación;
21. inactividad precede roles y permisos;
22. inactividad precede sede y área;
23. inactividad precede turno y check-in;
24. inactividad precede dispositivo y simulación empresarial;
25. permisos residuales no reactivan;
26. roles privilegiados no crean bypass;
27. empleado y cliente se evalúan por separado;
28. un empleado inactivo puede conservar cliente activo;
29. un cliente inactivo puede conservar empleado activo;
30. Pass usa identidad de cliente;
31. aplicaciones laborales usan identidad laboral;
32. actor inactivo no desactiva por inferencia el dispositivo;
33. actor inactivo no puede firmar ni ejecutar acciones;
34. los diez canales poseen respuesta explícita;
35. las diez aplicaciones poseen decisión explícita;
36. no se repite una mutación;
37. contexto y caché anteriores quedan obsoletos;
38. Realtime no sigue entregando datos nuevos;
39. la frontera autoritativa revalida actividad;
40. una reactivación genera solicitud y autorización nuevas;
41. el copy no revela motivos internos;
42. la experiencia es accesible;
43. la auditoría conserva correlación sin secretos;
44. el snapshot físico queda declarado como diagnóstico;
45. las treinta y dos funciones quedan materializadas;
46. las 161 políticas se tratan como cadena de dependencia, no como conformidad presumida;
47. las diez brechas tienen tarea responsable y condición de salida;
48. no se crean tareas huérfanas;
49. se generan `TREQ-AUTH-139` a `TREQ-AUTH-148`;
50. no se realizan cambios físicos;
51. `AUTH-ERR-003` permanece reservada.

---

#### 29. Estado final y continuidad

| Tarea          | Estado      | Relación                                                      |
| -------------- | ----------- | ------------------------------------------------------------- |
| `AUTH-ERR-001` | APROBADA    | tarea anterior                                                |
| `AUTH-ERR-002` | APROBADA    | tarea actual preparada para confirmación canónica del usuario |
| `AUTH-ERR-003` | NO INICIADA | tarea siguiente reservada                                     |

```text
AUTH-ERR-001 — APROBADA
        ↓
AUTH-ERR-002 — APROBADA
        ↓
AUTH-ERR-003 — RESERVADA
```

No se inicia ni modifica `AUTH-ERR-003` en esta tarea.

### ✅ AUTH-ERR-003 — Sin acceso a la aplicación

**Estado:** APROBADA
**Tarea anterior:** `AUTH-ERR-002 — Usuario inactivo` — APROBADA
**Tarea siguiente:** `AUTH-ERR-004 — Sin permiso administrativo` — RESERVADA
**Tipo de tarea:** documental; definición contractual, funcional, de seguridad y experiencia del gate de entrada a una aplicación
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/S_MENSAJES_BLOQUEO/01_IDENTIDAD_APLICACION_Y_TERRITORIO.md`
**Artefactos producidos:** `APPLICATION-ACCESS-BLOCKING-CONTRACT-001`, `APPLICATION-ACCESS-IDENTITY-DECISION-MATRIX-001`, `APPLICATION-ACCESS-CHANNEL-RESPONSE-MATRIX-001`, `APPLICATION-ACCESS-COVERAGE-REGISTER-001` y `APPLICATION-ACCESS-PHYSICAL-RECONCILIATION-001`
**Decisiones consumidas:** `ADR-AUTH-001`; `AUTH-MOD-001`; `AUTH-MOD-018`; `AUTH-MOD-019`; `AUTH-CAT-001`; `AUTH-CAT-006`; `AUTH-CAT-017`; `AUTH-CTX-001`; `AUTH-CTX-005` a `AUTH-CTX-008`; `AUTH-CTX-015`; `AUTH-ERR-001`; `AUTH-ERR-002`; catálogo canónico de diez aplicaciones; contrato documental vigente
**Cambios físicos autorizados:** ninguno; no modifica código, Supabase, Auth, RLS, RPC, Edge Functions, datos, migraciones, configuración, permisos, asignaciones, aplicaciones ni despliegues

---

#### 1. Propósito

Definir de forma única y verificable qué ocurre cuando una solicitud posee una
sesión autenticada válida y una identidad de dominio activa, pero esa identidad
no tiene acceso efectivo a la aplicación solicitada.

La regla raíz queda:

```text
SESIÓN AUTENTICADA VÁLIDA
+
IDENTIDAD DE DOMINIO ACTIVA
+
APLICACIÓN PROTEGIDA DISPONIBLE
+
SIN GATE DE ENTRADA EFECTIVO
→
DENY
+
AUTH_APP_ACCESS_DENIED
+
403
+
CERO EFECTOS
```

El gate de aplicación responde exclusivamente:

```text
¿PUEDE ESTA IDENTIDAD ENTRAR A ESTA APLICACIÓN?
```

No responde:

```text
¿PUEDE EJECUTAR ESTA ACCIÓN?
¿PUEDE VER ESTE RECURSO?
¿TIENE SEDE O ÁREA ACTIVA?
¿ESTÁ DENTRO DE TURNO?
¿POSEE CHECK-IN?
¿TIENE PERMISO ADMINISTRATIVO?
```

---

#### 2. Resultado material

Se aprueban cinco artefactos documentales completos:

1. `APPLICATION-ACCESS-BLOCKING-CONTRACT-001`, que congela identidad pública,
   precedencia, causas internas, envelope, seguridad, recuperación y auditoría;
2. `APPLICATION-ACCESS-IDENTITY-DECISION-MATRIX-001`, que decide dieciséis
   escenarios sin mezclar autenticación, actividad, ciclo de vida, configuración
   y autorización;
3. `APPLICATION-ACCESS-CHANNEL-RESPONSE-MATRIX-001`, que materializa diez
   canales de entrega y garantiza cero efectos;
4. `APPLICATION-ACCESS-COVERAGE-REGISTER-001`, que decide el comportamiento de
   las diez aplicaciones canónicas y de sus diez permisos de entrada;
5. `APPLICATION-ACCESS-PHYSICAL-RECONCILIATION-001`, que registra doce brechas
   físicas observadas y sus propietarios exactos.

Cobertura materializada:

| Elemento                                                    |            Cantidad |
| ----------------------------------------------------------- | ------------------: |
| Código público canónico                                     |                   1 |
| Estado HTTP no navegacional                                 |            1, `403` |
| Causas internas admitidas                                   |                   5 |
| Escenarios con decisión explícita                           |                  16 |
| Canales con respuesta explícita                             |                  10 |
| Aplicaciones canónicas reconciliadas                        |                  10 |
| Permisos `app_code.access` activos observados               |                  10 |
| Concesiones base positivas observadas                       |                  72 |
| Concesiones individuales positivas observadas               |                   4 |
| Concesiones operativas positivas observadas                 |                   9 |
| Denegaciones explícitas observadas en esos gates            |                   0 |
| Asignaciones activas app-dispositivo                        | 4 en 2 dispositivos |
| Funciones PostgreSQL candidatas por dependencia de permisos |                  37 |
| Políticas RLS candidatas por dependencia de permisos        |    154 en 76 tablas |
| Brechas físicas registradas                                 |                  12 |
| Requisitos de prueba derivados                              |                  10 |

Las cifras físicas son un snapshot de solo lectura. No constituyen conformidad,
no prueban cobertura de ejecución y no autorizan conservar el diseño actual.

---

#### 3. Identidad canónica del bloqueo

La identidad pública única es:

```text
reason_code = AUTH_APP_ACCESS_DENIED
```

| Propiedad                   | Valor                   |
| --------------------------- | ----------------------- |
| Dominio                     | `AUTHORIZATION`         |
| Decisión                    | `DENY`                  |
| Principal                   | autenticado y válido    |
| Identidad requerida         | activa                  |
| Estado público              | `FORBIDDEN_APPLICATION` |
| Estado HTTP no navegacional | `403 Forbidden`         |
| Ejecutable                  | `false`                 |
| Recuperación principal      | `RETURN_TO_SHELL`       |
| Sesión Auth                 | se conserva             |
| Acción original             | no se reintenta         |
| Datos protegidos            | no se entregan          |

Quedan prohibidos como identidad pública alternativa:

- `no_access`;
- `shared_device_app_not_allowed`;
- `app_forbidden` libre;
- `permission_denied` sin dominio;
- `403` sin código estable;
- un booleano `false` sin explicación contractual;
- un redirect al login;
- el mensaje bruto de PostgreSQL, Supabase o Next.js;
- el código del rol o de la concesión como razón pública.

---

#### 4. Definición exacta de “sin acceso a la aplicación”

Existe `AUTH_APP_ACCESS_DENIED` cuando se cumplen simultáneamente estas
condiciones:

1. la superficie requiere autenticación;
2. la verificación técnica se completó correctamente;
3. existe sesión válida;
4. la identidad de dominio exigida por la aplicación existe y está activa;
5. la aplicación solicitada es una identidad canónica registrada y disponible;
6. existe un gate contractual de entrada activo para esa aplicación;
7. se evaluaron las fuentes de concesión permitidas y su precedencia;
8. el resultado concluyente es que la identidad no posee acceso efectivo;
9. no existe una razón anterior o más específica que deba conservarse;
10. ninguna acción ni dato protegido se produjo.

La falta de acceso es una denegación de autorización autenticada. No es:

- ausencia de sesión;
- sesión expirada o revocada;
- usuario inactivo;
- identidad ausente o ambigua;
- aplicación desconocida;
- aplicación inactiva o no desplegada;
- permiso de entrada inexistente o inactivo;
- error del evaluador;
- falta de un permiso administrativo interno;
- falta de sede, área, turno o check-in;
- dispositivo inactivo;
- acción no permitida en simulación;
- recurso inexistente;
- error técnico.

---

#### 5. Causas internas admitidas

Las causas internas sirven para diagnóstico protegido y auditoría. Todas se
proyectan al mismo código público.

| Causa interna              | Definición                                                                                 | Resultado público        | Exposición              |
| -------------------------- | ------------------------------------------------------------------------------------------ | ------------------------ | ----------------------- |
| `NO_EFFECTIVE_APP_GRANT`   | No existe concesión aplicable después de evaluar fuentes y alcance permitidos.             | `AUTH_APP_ACCESS_DENIED` | No se expone al usuario |
| `EXPLICIT_APP_DENY`        | Una denegación individual o transversal aplicable prevalece sobre concesiones.             | `AUTH_APP_ACCESS_DENIED` | No se expone al usuario |
| `APP_GRANT_SCOPE_MISMATCH` | Existen concesiones, pero ninguna cubre el contexto necesario ya resuelto.                 | `AUTH_APP_ACCESS_DENIED` | No se expone al usuario |
| `DEVICE_APP_NOT_ASSIGNED`  | La allowlist activa del dispositivo no incluye la aplicación solicitada.                   | `AUTH_APP_ACCESS_DENIED` | No se expone al usuario |
| `ACTOR_APP_GATE_DENIED`    | El dispositivo admite la aplicación, pero el actor efectivo no supera su gate empresarial. | `AUTH_APP_ACCESS_DENIED` | No se expone al usuario |

No se admiten causas genéricas como `UNKNOWN`, `OTHER` o mensajes libres. Una
condición no clasificable se conserva como error técnico y no se transforma en
una denegación personal.

---

#### 6. Condiciones que no pertenecen al bloqueo

| Condición                                                 | Clasificación                   | Tarea o contrato propietario     |
| --------------------------------------------------------- | ------------------------------- | -------------------------------- |
| No existe sesión válida                                   | autenticación ausente           | `AUTH-ERR-001`                   |
| La identidad requerida está inactiva                      | identidad inactiva              | `AUTH-ERR-002`                   |
| La aplicación no está registrada                          | configuración inconsistente     | `AUTH-ERR-017` / `AUTH-ERR-019`  |
| `apps.is_active=false`                                    | ciclo de vida o disponibilidad  | `AUTH-CAT-001`                   |
| Falta `app_code.access` o está inactivo                   | contrato de catálogo incompleto | `AUTH-CAT-017` / `AUTH-ERR-017`  |
| El evaluador devuelve excepción o timeout                 | error técnico                   | `AUTH-ERR-019`                   |
| Existe acceso a la app, pero falta permiso administrativo | permiso administrativo          | `AUTH-ERR-004`                   |
| Existe un carril posible, pero falta sede o área          | contexto territorial            | `AUTH-ERR-005` a `AUTH-ERR-008`  |
| Falta turno, check-in o rol operativo                     | contexto laboral                | `AUTH-ERR-009` a `AUTH-ERR-014`  |
| La app está diferida y no existe superficie disponible    | ciclo de vida                   | `AUTH-CAT-001`                   |
| Cliente final entra a Pass                                | autorización de cliente         | `AUTH-DB-019` / `SHELL-AUTH-005` |

Regla obligatoria:

```text
NO SE PUDO EVALUAR EL ACCESO
≠
SE EVALUÓ Y EL ACCESO FUE DENEGADO
```

---

#### 7. Precedencia dentro del árbol de bloqueo

Orden normativo:

```text
1. SUPERFICIE PÚBLICA O PROTEGIDA
2. DISPONIBILIDAD TÉCNICA DE LA VERIFICACIÓN
3. SESIÓN AUTENTICADA VÁLIDA
4. IDENTIDAD DE DOMINIO EXISTENTE Y ACTIVA
5. APLICACIÓN REGISTRADA, ACTIVA Y DISPONIBLE
6. GATE app_code.access EXISTENTE Y EVALUABLE
7. ACCESO EFECTIVO A LA APLICACIÓN
8. PERMISO ADMINISTRATIVO U OPERATIVO DE LA ACCIÓN
9. SEDE, ÁREA, TURNO, CHECK-IN Y DISPOSITIVO
10. ACCIÓN, RECURSO, ALCANCE Y DENEGACIONES FINALES
```

La ubicación en el paso 7 no autoriza a etiquetar como falta de acceso una
carencia contextual necesaria para terminar la evaluación. Si existe un carril
de acceso potencial y la única carencia es sede, área, turno, check-in, actor o
rol operativo, deberá conservarse la razón específica posterior.

`AUTH_APP_ACCESS_DENIED` se emite solo ante una conclusión autoritativa.

---

#### 8. `APPLICATION-ACCESS-BLOCKING-CONTRACT-001`

Contrato lógico mínimo:

```ts
type ApplicationAccessBlockingReason = {
  contract: "APPLICATION-ACCESS-BLOCKING-CONTRACT-001";
  contract_version: "1.0.0";
  reason_code: "AUTH_APP_ACCESS_DENIED";
  domain: "AUTHORIZATION";
  decision: "DENY";
  principal_state: "AUTHENTICATED";
  domain_identity_state: "ACTIVE";
  application_state: "ACTIVE";
  executable: false;
  recovery_action: "RETURN_TO_SHELL";
  http_status: 403;
  app_code: string;
  channel: ApplicationAccessChannel;
  correlation_id: string;
  occurred_at: string;
};
```

El envelope público no incluirá:

- `user_id`;
- `employee_id`;
- `customer_id`;
- email, teléfono o documento;
- rol base u operativo;
- permiso o concesión exacta;
- origen de la concesión;
- sede o área;
- turno o check-in;
- ruta completa solicitada;
- query string;
- recurso;
- token, cookie o JWT;
- detalle de políticas RLS;
- stack trace;
- mensaje bruto del proveedor.

`app_code` podrá incluirse porque identifica la aplicación solicitada, siempre
que sea un código canónico validado y no un valor libre suministrado por el
cliente.

---

#### 9. Fuente de verdad del gate

Para aplicaciones laborales, el gate conceptual es:

```text
<app_code>.access
```

La decisión se resuelve en servidor usando:

- catálogo canónico de aplicaciones;
- catálogo canónico de permisos;
- actividad del permiso;
- denegaciones explícitas aplicables;
- concesiones individuales aplicables;
- concesiones por rol base aplicables;
- concesiones por rol operativo únicamente cuando ese carril esté autorizado;
- alcance aplicable ya resuelto;
- política de dispositivo cuando corresponda;
- snapshot y versión de autorización vigentes.

No son fuente de verdad:

- una tarjeta visible en el Hub;
- una ruta conocida;
- un enlace copiado;
- `navigation_role`;
- un parámetro `requireAppAccessPermission=false`;
- el nombre del rol;
- un permiso diferente de `app_code.access`;
- una cookie de simulación;
- un booleano almacenado por el frontend;
- una respuesta cacheada sin versión;
- una asignación de dispositivo aislada;
- el uso de `service_role`.

---

#### 10. Precedencia de concesiones y denegaciones

La precedencia conserva el modelo aprobado:

```text
DENEGACIÓN EXPLÍCITA APLICABLE
>
CONCESIÓN INDIVIDUAL APLICABLE
>
CONCESIÓN DE ROL BASE APLICABLE
>
CONCESIÓN DE ROL OPERATIVO APLICABLE
>
AUSENCIA DE CONCESIÓN
```

Reglas:

1. una denegación aplicable bloquea aunque exista otra concesión;
2. una concesión individual no puede reactivar una identidad inactiva;
3. una concesión por rol no puede reactivar una aplicación inactiva;
4. una concesión operativa exige el carril y contexto que la sustentan;
5. una concesión fuera de alcance no equivale a acceso efectivo;
6. el nombre `propietario` no es bypass;
7. cero denegaciones físicas observadas no significa que la precedencia pueda
   omitirse;
8. una asignación de app a dispositivo no es una concesión laboral del actor;
9. el gate se recalcula ante cambio de identidad, rol, alcance o dispositivo;
10. toda fuente observada debe quedar identificada en auditoría protegida.

---

#### 11. Entrada a aplicación frente a permiso de acción

```text
app_code.access = ALLOW
```

significa únicamente:

```text
la identidad puede entrar a la frontera funcional de la aplicación
```

No significa:

- ver todos los módulos;
- leer todas las filas;
- crear, editar o eliminar;
- administrar configuración;
- usar todas las sedes;
- operar sin turno;
- actuar desde cualquier dispositivo;
- omitir RLS;
- usar service role;
- ejecutar una mutación;
- acceder a recursos de otra persona;
- heredar permisos futuros.

Toda acción posterior conserva su permiso exacto, modalidad, alcance y recurso.

---

#### 12. `APPLICATION-ACCESS-IDENTITY-DECISION-MATRIX-001`

| ID      | Escenario                                               | Evaluación                                       | Resultado                                                       | Propietario                      |
| ------- | ------------------------------------------------------- | ------------------------------------------------ | --------------------------------------------------------------- | -------------------------------- |
| `AA-01` | Ruta pública o callback                                 | No se aplica el gate                             | Continuar según contrato público                                | `No aplica`                      |
| `AA-02` | Superficie protegida sin sesión válida                  | No existe principal autenticado                  | `AUTH_NO_SESSION`                                               | `AUTH-ERR-001`                   |
| `AA-03` | Sesión válida e identidad requerida inactiva            | La identidad de dominio está inactiva            | `AUTH_USER_INACTIVE`                                            | `AUTH-ERR-002`                   |
| `AA-04` | Sesión e identidad activas; `app_code` no registrado    | Catálogo incompleto o entrada inválida           | Error de configuración, sin afirmar falta de acceso             | `AUTH-ERR-017 / AUTH-ERR-019`    |
| `AA-05` | Aplicación registrada pero `apps.is_active=false`       | Ciclo de vida o disponibilidad deshabilitada     | Aplicación no disponible, no denegación personal                | `AUTH-CAT-001`                   |
| `AA-06` | Aplicación activa sin permiso `app_code.access` activo  | Contrato de catálogo incompleto                  | Error de configuración, fail closed                             | `AUTH-CAT-017 / AUTH-ERR-017`    |
| `AA-07` | Evaluador, RPC o red falla                              | No existe decisión autoritativa                  | Error técnico; no `AUTH_APP_ACCESS_DENIED`                      | `AUTH-ERR-019`                   |
| `AA-08` | Denegación individual explícita aplicable               | Existe `DENY` efectivo                           | `AUTH_APP_ACCESS_DENIED`                                        | `AUTH-ERR-003`                   |
| `AA-09` | No existe concesión efectiva aplicable                  | Se evaluaron todas las fuentes permitidas        | `AUTH_APP_ACCESS_DENIED`                                        | `AUTH-ERR-003`                   |
| `AA-10` | Existe concesión base o individual efectiva             | Gate de entrada satisfecho                       | Continuar hacia permisos, contexto, acción y recurso            | `Tareas posteriores`             |
| `AA-11` | Solo existe carril operativo posible y falta contexto   | La entrada no es concluyentemente denegada       | Emitir razón contextual específica; no app access               | `AUTH-ERR-005 a AUTH-ERR-014`    |
| `AA-12` | Dispositivo activo sin asignación de la aplicación      | Allowlist técnica del dispositivo excluye la app | `AUTH_APP_ACCESS_DENIED`                                        | `AUTH-ERR-003`                   |
| `AA-13` | Dispositivo asignado a la app, pero sin actor requerido | Gate técnico satisfecho; actor no resuelto       | Razón de actor o dispositivo específica                         | `AUTH-ERR-012 a AUTH-ERR-015`    |
| `AA-14` | Dispositivo y actor válidos; actor sin acceso efectivo  | Gate empresarial del actor falla                 | `AUTH_APP_ACCESS_DENIED`                                        | `AUTH-ERR-003`                   |
| `AA-15` | Cliente activo entra a Vento Pass                       | Identidad cliente válida                         | Evaluar contrato de cliente; ignorar RBAC laboral `pass.access` | `AUTH-DB-019` / `SHELL-AUTH-005` |
| `AA-16` | AURA o producto diferido sin superficie desplegada      | Ciclo de vida no materializado                   | Aplicación no disponible; no atribuir al usuario                | `AUTH-CAT-001`                   |

La matriz tiene dieciséis decisiones y no admite fallback entre ellas.

---

#### 13. `APPLICATION-ACCESS-CHANNEL-RESPONSE-MATRIX-001`

| Canal                                   | Forma                                            | Resultado obligatorio                                           | Prohibiciones                                             |
| --------------------------------------- | ------------------------------------------------ | --------------------------------------------------------------- | --------------------------------------------------------- |
| Navegación web protegida                | Página o redirect interno de bloqueo autenticado | Conservar sesión; estado conceptual `403`; sin render protegido | No usar login ni revelar ruta sensible                    |
| Formulario o mutación web               | Respuesta bloqueada antes de ejecutar            | `403` tipado o estado de formulario seguro                      | No reenviar ni repetir automáticamente                    |
| Fetch de cliente                        | JSON contractual                                 | HTTP `403` y `AUTH_APP_ACCESS_DENIED`                           | No devolver HTML ni datos parciales                       |
| Route Handler o API                     | Envelope JSON estable                            | HTTP `403`; `executable=false`                                  | No ejecutar handlers de dominio                           |
| Server Action                           | Error discriminado y serializable                | Sin efectos; correlación preservada                             | No convertir en redirect de autenticación                 |
| RPC o PostgREST                         | Denegación estructurada o mapeo controlado       | SQLSTATE autorizado y razón estable                             | No depender de mensaje libre ni booleano aislado          |
| RLS                                     | Cero filas o rechazo según operación             | Nunca expone datos; adapter conserva razón de app               | Un resultado vacío no prueba por sí solo la causa         |
| Edge Function                           | JSON contractual                                 | HTTP `403`; sin uso de service role como bypass                 | Validar actor y app antes de operación privilegiada       |
| Realtime, stream o suscripción          | Suscripción rechazada o terminada                | Cero eventos posteriores; razón correlacionable                 | Revocar al cambiar el acceso                              |
| Cliente nativo o dispositivo compartido | Estado tipado localizable                        | Conservar sesión técnica válida; bloquear capacidades           | No convertir allowlist de dispositivo en autoridad humana |

Todos los canales comparten:

```text
reason_code = AUTH_APP_ACCESS_DENIED
decision = DENY
executable = false
```

La representación cambia por canal; la decisión no.

---

#### 14. Mensaje humano canónico

| Elemento          | Texto exacto                                                                     |
| ----------------- | -------------------------------------------------------------------------------- |
| Título            | `No tienes acceso a esta aplicación`                                             |
| Mensaje           | `Tu sesión está activa, pero esta aplicación no está habilitada para tu cuenta.` |
| Acción principal  | `Volver a Vento OS`                                                              |
| Acción secundaria | `Cerrar sesión`                                                                  |
| Código de soporte | `AUTH_APP_ACCESS_DENIED`                                                         |

Reglas:

1. no afirmar que la sesión expiró;
2. no afirmar que el usuario está inactivo;
3. no mostrar “No tienes permisos” de forma genérica;
4. no revelar el permiso exacto que falta;
5. no revelar roles que sí tendrían acceso;
6. no mostrar la ruta o recurso solicitado;
7. no prometer aprobación o reactivación;
8. no culpar al usuario;
9. no sugerir reintentos repetidos;
10. no cerrar la sesión automáticamente.

---

#### 15. Recuperación y navegación

La acción principal dirige al Hub laboral seguro y vuelve a resolver el acceso
a cada aplicación. No reconstruye ni repite la operación fallida.

La acción secundaria permite cerrar sesión voluntariamente. No es la acción
principal porque una misma identidad puede estar autorizada para otras
aplicaciones.

Reglas:

- el estado de retorno no contiene la ruta protegida completa;
- no se conserva body, formulario ni intención mutante;
- el Hub no presenta una tarjeta como autoridad;
- una aplicación bloqueada puede ocultarse o mostrarse deshabilitada según el
  contrato de navegación, pero la entrada directa siempre se protege;
- el botón atrás no debe revelar contenido protegido en caché;
- un acceso recién concedido requiere solicitud nueva y reautorización;
- un acceso revocado invalida cualquier decisión previa.

---

#### 16. `APPLICATION-ACCESS-COVERAGE-REGISTER-001`

El registro conserva las diez identidades aprobadas en `AUTH-CAT-001`.

| Código   | Nombre     | Tipo           | Dominio | Roadmap   | Gate observado  | Audiencia observada | Operacional | Requiere contexto | Grants base | Grants individuales | Grants operativos | Apps de dispositivo | Decisión canónica                                                                                                       |
| -------- | ---------- | -------------- | ------- | --------- | --------------- | ------------------- | ----------- | ----------------- | ----------: | ------------------: | ----------------: | ------------------: | ----------------------------------------------------------------------------------------------------------------------- |
| `shell`  | Vento OS   | Hub            | Laboral | Núcleo    | `shell.access`  | `system`            | `false`     | `false`           |           5 |                   0 |                 0 |                   1 | El Hub laboral exige acceso propio; login, callback y recuperación quedan fuera del gate.                               |
| `anima`  | ANIMA      | Híbrida        | Laboral | Núcleo    | `anima.access`  | `operational`       | `false`     | `false`           |           5 |                   0 |                 0 |                   0 | La entrada personal no equivale a permiso administrativo ni a contexto operativo válido.                                |
| `viso`   | VISO       | Administrativa | Laboral | Núcleo    | `viso.access`   | `administrative`    | `false`     | `true`            |           5 |                   1 |                 0 |                   0 | La metadata desplegada exige contexto activo; la ausencia de contexto se clasifica después, no como falta de acceso.    |
| `nexo`   | NEXO       | Híbrida        | Laboral | Núcleo    | `nexo.access`   | `operational`       | `true`      | `true`            |          15 |                   3 |                 7 |                   2 | Admite rutas base y operativas; el gate de aplicación no sustituye permisos de inventario o remisiones.                 |
| `fogo`   | FOGO       | Operativa      | Laboral | Núcleo    | `fogo.access`   | `operational`       | `true`      | `true`            |          11 |                   0 |                 0 |                   0 | La entrada puede depender de contexto laboral; la falta de turno o área conserva su razón específica.                   |
| `origo`  | ORIGO      | Híbrida        | Laboral | Núcleo    | `origo.access`  | `operational`       | `true`      | `true`            |           5 |                   0 |                 0 |                   0 | La entrada no autoriza compras, aprobaciones, recepciones ni correcciones.                                              |
| `pulso`  | PULSO      | Operativa      | Laboral | Núcleo    | `pulso.access`  | `operational`       | `true`      | `true`            |          15 |                   0 |                 2 |                   1 | El gate no podrá omitirse mediante opciones locales ni confundirse con permiso de caja o venta.                         |
| `numera` | NUMERA     | Híbrida        | Laboral | Núcleo    | `numera.access` | `administrative`    | `false`     | `false`           |           2 |                   0 |                 0 |                   0 | La entrada administrativa no concede acceso a reportes, costos o cierres específicos.                                   |
| `aura`   | AURA       | Administrativa | Laboral | Diferido  | `aura.access`   | `administrative`    | `false`     | `false`           |           5 |                   0 |                 0 |                   0 | Aplicación activa en catálogo pero diferida en roadmap; indisponibilidad del producto no es denegación personal.        |
| `pass`   | Vento Pass | Cliente        | Cliente | Adyacente | `pass.access`   | `administrative`    | `false`     | `false`           |           4 |                   0 |                 0 |                   0 | La fila laboral existente no gobierna la entrada normal del cliente final; el dominio cliente conserva contrato propio. |

Totales reconciliados:

```text
10 aplicaciones
10 gates access activos
72 filas positivas de rol base
4 filas positivas individuales
9 filas positivas de rol operativo
0 filas negativas observadas en esos gates
4 asignaciones activas a 2 dispositivos
```

Las cifras son evidencia de inventario, no una aprobación de las asignaciones.
Esta tarea no modifica ni valida sustantivamente qué roles deben conservar cada
concesión.

---

#### 17. Aplicación SHELL

`shell` es la aplicación Hub, no el repositorio completo.

Reglas:

1. login, callback, recuperación y logout no requieren `shell.access`;
2. la superficie laboral protegida del Hub sí lo requiere;
3. una sesión válida sin `shell.access` no puede ver el launcher interno;
4. bloquear `shell` no cierra la sesión ni altera identidades de cliente;
5. la lista de tarjetas debe derivarse del catálogo, no de un arreglo parcial;
6. el estado de ciclo de vida y el estado de acceso se presentan por separado;
7. el Hub no concede acceso por mostrar un enlace;
8. cada aplicación destino vuelve a validar su gate.

---

#### 18. Aplicaciones laborales núcleo

Para `anima`, `viso`, `nexo`, `fogo`, `origo`, `pulso` y `numera`:

- la identidad requerida es laboral;
- `employees.is_active=true` se resolvió antes;
- el gate canónico usa el código de aplicación exacto;
- el acceso puede provenir de las fuentes aprobadas;
- un carril operativo solo se utiliza cuando su contexto es válido;
- el gate no autoriza acciones internas;
- una ruta profunda no evita el gate;
- API, Server Actions, RPC y Realtime aplican la misma decisión;
- una simulación nunca habilita acceso real;
- una app puede permanecer accesible aunque otra esté bloqueada.

---

#### 19. Vento Pass

`pass` posee dominio principal de cliente.

Regla obligatoria:

```text
ENTRADA NORMAL DEL CLIENTE A VENTO PASS
≠
PERMISO LABORAL pass.access
```

La fila laboral `pass.access` se conserva como hecho físico hasta que su
superficie laboral propietaria sea reconciliada. No podrá utilizarse para:

- permitir o negar el login del cliente;
- convertir un empleado en cliente;
- convertir un cliente en empleado;
- bloquear al cliente porque no tiene rol laboral;
- conceder acciones administrativas sobre clientes;
- compartir actividad entre `public.users` y `public.employees`.

Una superficie laboral interna relacionada con Pass deberá declarar identidad,
aplicación y permisos laborales explícitos.

---

#### 20. AURA

`aura` permanece en el catálogo como aplicación laboral administrativa con
alcance de roadmap `Diferido`.

Separación obligatoria:

```text
ACCESO DEL USUARIO
≠
DISPONIBILIDAD DEL PRODUCTO
```

Mientras no exista superficie materializada y certificada:

- no se presenta `AUTH_APP_ACCESS_DENIED` por ausencia del producto;
- no se invita al usuario a solicitar permisos;
- no se activa una ruta improvisada;
- no se elimina el código;
- no se reutiliza el código;
- el Hub puede omitirla o marcarla no disponible según ciclo de vida;
- sus grants existentes se conservan sin cambio; su reconciliación queda asignada
  a `SHELL-AUTH-005` bajo la decisión de ciclo de vida de `AUTH-CAT-001`.

---

#### 21. Dispositivos compartidos

La autorización de entrada desde dispositivo tiene dos gates independientes:

```text
GATE TÉCNICO
shared_operational_device_apps incluye app_code

AND

GATE EMPRESARIAL
actor efectivo activo posee acceso a app_code
```

Reglas:

1. el gate técnico limita qué apps puede cargar la terminal;
2. el gate empresarial limita qué apps puede usar el actor;
3. ninguno sustituye al otro;
4. `navigation_role` no concede acceso;
5. un dispositivo sin actor puede ejecutar solo capacidades técnicas permitidas;
6. un actor sin acceso no hereda la asignación del dispositivo;
7. un dispositivo no asignado no hereda el acceso del actor;
8. el cambio de actor invalida la decisión;
9. el cambio de allowlist invalida la decisión;
10. una sesión de firma no amplía el gate de app.

---

#### 22. Frescura, concurrencia y revocación

El acceso se revalidará en la frontera autoritativa antes de cada efecto.

Eventos invalidantes mínimos:

- cambio de `apps.is_active`;
- cambio de `app_permissions.is_active`;
- creación o retiro de denegación;
- creación, modificación o retiro de concesión;
- cambio de alcance;
- cambio de rol base;
- cambio de rol operativo;
- cambio de identidad activa;
- cambio de actor de dispositivo;
- cambio de `shared_operational_device_apps`;
- expiración del contexto;
- cierre de sesión.

Una decisión cacheada no sobrevive a un evento invalidante. Una mutación en
curso revalida antes de confirmar efectos.

---

#### 23. Auditoría

Eventos mínimos:

```text
auth.application_access_denied
auth.application_access_granted
auth.application_access_revoked
auth.application_access_evaluation_failed
```

Envelope protegido mínimo:

```ts
type ApplicationAccessAuditEvent = {
  event_name: string;
  correlation_id: string;
  principal_ref: string;
  domain_identity_kind: "EMPLOYEE" | "CUSTOMER" | "DEVICE_ACTOR";
  domain_identity_ref: string;
  app_code: string;
  decision: "ALLOW" | "DENY" | "ERROR";
  internal_cause: string | null;
  grant_source_kind: string | null;
  scope_fingerprint: string | null;
  context_version: string;
  contract_version: "1.0.0";
  occurred_at: string;
};
```

No se auditan valores de tokens, cookies, PIN, documentos, rutas completas,
query strings ni mensajes brutos del proveedor.

---

#### 24. Estado físico observado

La inspección de solo lectura confirmó:

1. diez filas activas en `public.apps`;
2. diez permisos activos con código `access`;
3. 72 filas positivas en `role_permissions` para esos permisos;
4. cuatro filas positivas en `employee_permissions`;
5. nueve filas positivas en `operational_role_permissions`;
6. cero filas negativas observadas para esos diez gates;
7. cuatro asignaciones activas en `shared_operational_device_apps` para dos
   dispositivos;
8. `public.has_permission` produce booleano y participa en la entrada actual;
9. 37 funciones son candidatas por dependencia directa o transitiva de apps,
   permisos, `.access` o `has_permission`;
10. 154 políticas de 76 tablas son candidatas por dependencia de permisos;
11. NEXO, FOGO y ORIGO comparten una copia idéntica del guard inspeccionado;
12. PULSO incorpora una opción local para omitir el gate;
13. el Hub materializa cinco tarjetas de aplicaciones;
14. la pantalla NEXO de no acceso expone la ruta solicitada y usa copy genérico.

La ausencia de denegaciones físicas no elimina el soporte normativo de
`DENY`. La cantidad de funciones o políticas candidatas no significa que todas
apliquen correctamente el gate de aplicación.

---

#### 25. `APPLICATION-ACCESS-PHYSICAL-RECONCILIATION-001`

| ID            | Ubicación                                                           | Observación                                                                                                                                                         | Tarea responsable                 | Condición de salida                                                                                            | Estado         |
| ------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------- | -------------------------------------------------------------------------------------------------------------- | -------------- |
| `APP-GAP-001` | `vento-shell/src/app/page.tsx`                                      | El launcher materializa solo cinco aplicaciones laborales (`viso`, `nexo`, `fogo`, `origo`, `pulso`) frente a diez identidades canónicas.                           | `SHELL-AUTH-005`                  | El launcher deriva su catálogo del registro canónico y aplica estado de ciclo de vida y acceso por separado.   | `IDENTIFICADO` |
| `APP-GAP-002` | `vento-shell/src/app/page.tsx`                                      | La raíz del Hub valida sesión, pero no exige de forma explícita `shell.access`.                                                                                     | `SHELL-AUTH-002 / SHELL-AUTH-005` | La entrada protegida al Hub consume el adapter canónico sin bloquear login ni callbacks.                       | `IDENTIFICADO` |
| `APP-GAP-003` | `vento-nexo`, `vento-fogo`, `vento-origo` / `src/lib/auth/guard.ts` | Tres repositorios mantienen copias byte a byte del mismo guard, sin contrato compartido ni versión.                                                                 | `SHELL-AUTH-001 / SHELL-AUTH-005` | Los consumidores adoptan el SDK compartido y el lint impide nuevas copias.                                     | `IDENTIFICADO` |
| `APP-GAP-004` | Guards web inspeccionados                                           | Un error de RPC y una denegación efectiva terminan en la misma pantalla de no acceso.                                                                               | `SHELL-AUTH-002 / AUTH-ERR-019`   | El adapter separa `DENY` autoritativo, error técnico y configuración inconsistente.                            | `IDENTIFICADO` |
| `APP-GAP-005` | Guards web inspeccionados                                           | Los redirects transportan `reason`, `permission` y `returnTo` definidos localmente.                                                                                 | `SHELL-AUTH-002 / SHELL-AUTH-005` | Se utiliza estado opaco y sanitizado; no se exponen permisos ni rutas sensibles.                               | `IDENTIFICADO` |
| `APP-GAP-006` | `vento-nexo/src/app/no-access/page.tsx`                             | La pantalla usa “No tienes permisos”, mezcla app y acción, y muestra la ruta solicitada.                                                                            | `AUTH-ERR-020 / SHELL-AUTH-005`   | Copy canónico, código estable, ruta no expuesta y acciones seguras.                                            | `IDENTIFICADO` |
| `APP-GAP-007` | `vento-pulso/src/lib/auth/guard.ts`                                 | La opción `requireAppAccessPermission=false` permite omitir el gate de aplicación.                                                                                  | `SHELL-AUTH-004 / SHELL-AUTH-005` | Toda superficie protegida declara excepción pública o aplica el gate; no hay bypass booleano local.            | `IDENTIFICADO` |
| `APP-GAP-008` | `operational-session.ts` en consumidoras                            | Para dispositivos, la asignación de app puede responder `true` a `appId.access` sin evaluar autoridad empresarial del actor.                                        | `SHELL-AUTH-001 / SHELL-AUTH-002` | Se separan gate técnico del dispositivo y gate empresarial del actor.                                          | `IDENTIFICADO` |
| `APP-GAP-009` | `public.has_permission` desplegada                                  | El helper devuelve booleano sin razón, fuente, versión ni distinción de error y conserva `SECURITY DEFINER`; `anon` tiene `EXECUTE`.                                | `AUTH-DB-034 / SHELL-AUTH-001`    | El contrato canónico emite decisión tipada y se revisan grants y exposición.                                   | `IDENTIFICADO` |
| `APP-GAP-010` | Supabase desplegado                                                 | Treinta y siete funciones y 154 políticas de 76 tablas dependen directa o transitivamente de permisos, pero no existe certificación específica del gate `*.access`. | `AUTH-DB-034 / SHELL-CI-018`      | La regresión prueba entrada, acciones y RLS sin asumir equivalencia por dependencia transitiva.                | `IDENTIFICADO` |
| `APP-GAP-011` | `pass.access` y catálogo `pass`                                     | El permiso laboral activo coexiste con una aplicación cuyo dominio principal es cliente.                                                                            | `AUTH-DB-034 / SHELL-AUTH-005`    | La entrada del cliente final usa identidad cliente; `pass.access` solo cubre superficies laborales explícitas. | `IDENTIFICADO` |
| `APP-GAP-012` | `aura` en `public.apps` y catálogo canónico                         | AURA está activa en datos y diferida en roadmap; la ausencia de superficie podría mostrarse como denegación personal.                                               | `AUTH-CAT-001 / SHELL-AUTH-005`   | El ciclo de vida `DIFERIDO` se presenta como indisponibilidad, separado del acceso del usuario.                | `IDENTIFICADO` |

No queda pendiente narrativo sin propietario documental.

---

#### 26. Seguridad y privacidad

Controles obligatorios:

1. fail closed sin inventar una causa;
2. evaluación autoritativa en servidor;
3. identidad activa antes del gate;
4. catálogo y app code validados;
5. denegación explícita con precedencia;
6. cero bypass por nombre de rol;
7. cero bypass por navegación;
8. cero bypass por service role;
9. cero bypass por dispositivo;
10. separación Pass laboral-cliente;
11. separación acceso-disponibilidad;
12. `403` fuera de navegación;
13. no redirigir al login;
14. no exponer permiso, rol o ruta;
15. no repetir mutaciones;
16. no entregar datos parciales;
17. invalidar cachés y Realtime;
18. auditar sin secretos;
19. mantener aplicaciones aisladas entre sí;
20. reautorizar toda solicitud nueva.

---

#### 27. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

| ID              | Regla protegida                                                                                                                                                                                                                     | Tipo                                    | Prioridad | Momento de implementación           | Destino                                                      |
| --------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------- | --------- | ----------------------------------- | ------------------------------------------------------------ |
| `TREQ-AUTH-149` | Una identidad requerida activa y una sesión válida sin concesión efectiva de `app_code.access` deberán producir `AUTH_APP_ACCESS_DENIED`, `DENY`, `executable=false`, estado `403` fuera de navegación y cero efectos.              | contractual + seguridad                 | crítica   | Adapter y evaluador canónicos       | `AUTH-DB-034; SHELL-AUTH-001; SHELL-AUTH-002`                |
| `TREQ-AUTH-150` | El gate de aplicación deberá evaluarse después de sesión e identidad activa y antes de permisos de acción, sede, área, turno, check-in y recurso; no deberá ocultar razones técnicas o contextuales no concluyentes.                | autorización + contexto + regresión     | crítica   | Árbol de decisión compartido        | `AUTH-DB-033; AUTH-DB-034; SHELL-AUTH-002`                   |
| `TREQ-AUTH-151` | Cada una de las diez aplicaciones deberá mantener un permiso activo y único `app_code.access`; acceso a la aplicación no autorizará automáticamente ninguna acción interna.                                                         | contractual + catálogo + integración    | crítica   | Catálogo y SDK compartidos          | `AUTH-CAT-017; SHELL-AUTH-001; SHELL-CI-016`                 |
| `TREQ-AUTH-152` | Aplicación inexistente o inactiva, permiso de acceso faltante o inactivo y fallo del evaluador deberán conservarse como ciclo de vida, configuración o error técnico, nunca como denegación personal inventada.                     | resiliencia + seguridad + regresión     | crítica   | Adapters y catálogo de errores      | `AUTH-ERR-017; AUTH-ERR-019; SHELL-AUTH-002`                 |
| `TREQ-AUTH-153` | Navegación, mutaciones, fetch, API, Server Actions, RPC, RLS, Edge Functions, Realtime y clientes nativos deberán aplicar la matriz de canales con `403` tipado, sin datos parciales ni efectos.                                    | integración + E2E + seguridad           | crítica   | Migración de consumidoras           | `SHELL-AUTH-005; SHELL-CI-016; SHELL-CI-018`                 |
| `TREQ-AUTH-154` | En dispositivo compartido, la allowlist técnica de aplicaciones y el acceso empresarial del actor deberán validarse por separado; ninguna de las dos evidencias sustituirá a la otra.                                               | dispositivo + autorización + E2E        | crítica   | SDK de dispositivo y contexto       | `AUTH-DB-033; AUTH-DB-034; SHELL-AUTH-002`                   |
| `TREQ-AUTH-155` | Vento Pass cliente no dependerá del permiso laboral `pass.access`, y una aplicación diferida o no desplegada como AURA no deberá presentarse como falta de acceso del usuario.                                                      | identidad + ciclo de vida + integración | crítica   | Adapters por dominio y launcher     | `AUTH-DB-019; AUTH-CAT-001; SHELL-AUTH-005`                  |
| `TREQ-AUTH-156` | La experiencia de bloqueo deberá usar copy, acciones y accesibilidad aprobados, conservar la sesión, no exponer ruta, permiso, rol o fuente de concesión y no redirigir al login.                                                   | interfaz + experiencia + privacidad     | alta      | Catálogo de mensajes y consumidoras | `AUTH-ERR-020; SHELL-AUTH-005; SHELL-CI-016`                 |
| `TREQ-AUTH-157` | Cambios de concesión, denegación, alcance o asignación de dispositivo deberán invalidar decisiones, cachés y suscripciones antes de efectos nuevos, con auditoría minimizada y correlacionable.                                     | concurrencia + caché + auditoría        | crítica   | Frescura, observabilidad y Realtime | `AUTH-DB-035; SHELL-AUTH-001; SHELL-CI-019`                  |
| `TREQ-AUTH-158` | La regresión deberá reconciliar diez aplicaciones, diez permisos de acceso, 72 concesiones base, cuatro individuales, nueve operativas, cuatro asignaciones a dos dispositivos, 37 funciones, 154 políticas y doce brechas físicas. | regresión + RPC + RLS + estática        | crítica   | Gates del paquete E5                | `SHELL-AUTH-004; SHELL-AUTH-005; SHELL-CI-018; SHELL-CI-019` |

El detalle canónico de estas diez filas se incorpora al Registro Canónico de
Requisitos de Prueba.

---

#### 28. Validaciones documentales definidas

El validador futuro deberá comprobar como mínimo:

1. identidad pública única;
2. `403` no navegacional;
3. `DENY` y `executable=false`;
4. cinco causas internas exhaustivas;
5. separación de sesión e inactividad;
6. separación de error técnico;
7. separación de ciclo de vida;
8. existencia de diez apps y diez gates;
9. unicidad de `app_code.access`;
10. gate de app distinto de permiso de acción;
11. precedencia de denegación;
12. evaluación de alcance;
13. diferimiento de razones contextuales;
14. diez canales completos;
15. dieciséis escenarios completos;
16. separación de dispositivo y actor;
17. separación laboral-cliente de Pass;
18. AURA diferida sin falsa denegación;
19. copy exacto;
20. no exposición de ruta o permiso;
21. conservación de sesión;
22. invalidación por revocación;
23. eventos auditables mínimos;
24. doce brechas con propietario;
25. diez TREQ consecutivos y resolubles.

---

#### 29. Fuera del alcance

AUTH-ERR-003 no:

- modifica grants;
- decide qué roles deben conservar acceso;
- crea denegaciones;
- cambia `apps.is_active`;
- cambia metadata de `app_permissions`;
- corrige `has_permission`;
- modifica RLS;
- implementa adapters;
- cambia guards;
- cambia el Hub;
- cambia pantallas de no acceso;
- despliega AURA;
- redefine el acceso normal del cliente Pass;
- crea migraciones;
- ejecuta DDL o DML;
- invalida sesiones;
- cambia dispositivos;
- publica paquetes;
- inicia `AUTH-ERR-004`;
- ejecuta pruebas operativas.

---

#### 30. Criterios de aceptación

1. `AUTH_APP_ACCESS_DENIED` es el único código público de esta tarea.
2. La razón pertenece al dominio de autorización, no al de autenticación.
3. La sesión autenticada permanece válida y no se destruye por inferencia.
4. La identidad de dominio requerida ya fue resuelta como activa.
5. La respuesta no navegacional utiliza `403`.
6. La decisión siempre es `DENY` y `executable=false`.
7. No existe efecto empresarial parcial.
8. Las cinco causas internas están definidas y no se exponen.
9. La ausencia de sesión conserva `AUTH_NO_SESSION`.
10. La identidad inactiva conserva `AUTH_USER_INACTIVE`.
11. Una app inexistente no se presenta como denegación personal.
12. Una app inactiva se trata como ciclo de vida o disponibilidad.
13. Un permiso `*.access` faltante o inactivo se trata como configuración.
14. Un error de RPC, red o evaluador no se convierte en `DENY` inventado.
15. Una denegación explícita prevalece sobre concesiones.
16. La falta concluyente de concesión produce el bloqueo.
17. Un alcance no compatible produce bloqueo solo cuando el contexto requerido ya es resoluble.
18. La falta de contexto conserva la razón específica posterior.
19. El gate de app precede permisos de acción.
20. El gate de app no concede acciones internas.
21. Las diez aplicaciones poseen decisión explícita.
22. Los diez permisos de entrada desplegados se reconcilian.
23. Los valores de audiencia y contexto observados no se reescriben en esta tarea.
24. Vento Pass cliente permanece separado del RBAC laboral.
25. `pass.access` no gobierna la entrada normal del cliente final.
26. AURA diferida no se presenta como denegación personal.
27. SHELL aplica gate propio solo en superficies laborales protegidas.
28. Login, callback, recuperación y assets esenciales permanecen accesibles.
29. La navegación bloqueada no redirige al login.
30. El usuario puede volver a Vento OS sin cerrar sesión.
31. Cerrar sesión es opcional y no la recuperación principal.
32. La ruta solicitada no se muestra en la pantalla de bloqueo.
33. El permiso exacto, rol y fuente de concesión no se muestran.
34. Las mutaciones no se reintentan automáticamente.
35. Fetch y API reciben JSON tipado.
36. RPC no depende de texto libre para clasificar la razón.
37. RLS nunca entrega datos y el adapter no deduce la causa solo desde un conjunto vacío.
38. Edge Functions no usan service role como bypass empresarial.
39. Realtime deja de emitir tras la revocación.
40. El cliente nativo conserva un estado discriminado.
41. La allowlist del dispositivo no sustituye el acceso del actor.
42. El acceso del actor no sustituye la allowlist del dispositivo.
43. Los cambios de acceso invalidan caché y decisiones obsoletas.
44. La auditoría es correlacionable y minimizada.
45. Las doce brechas físicas tienen propietario y condición de salida.
46. Ninguna brecha se declara implementada.
47. Los diez requisitos nuevos son consecutivos y resolubles.
48. Las 6546 filas históricas se conservan.
49. No se modifica código, Supabase, datos ni repositorios remotos.
50. `AUTH-ERR-004` permanece reservada.

---

#### 31. Cierre de tarea y continuidad

| Tarea          | Estado      | Relación                                                      |
| -------------- | ----------- | ------------------------------------------------------------- |
| `AUTH-ERR-002` | APROBADA    | tarea anterior                                                |
| `AUTH-ERR-003` | APROBADA    | tarea actual preparada para confirmación canónica del usuario |
| `AUTH-ERR-004` | NO INICIADA | tarea siguiente reservada                                     |

```text
AUTH-ERR-002 — APROBADA
        ↓
AUTH-ERR-003 — APROBADA
        ↓
AUTH-ERR-004 — RESERVADA
```

No se inicia ni modifica `AUTH-ERR-004` en esta tarea.


### ✅ AUTH-ERR-004 — Sin permiso administrativo

**Estado:** APROBADA
**Tarea anterior:** `AUTH-ERR-003 — Sin acceso a la aplicación` — APROBADA
**Tarea siguiente:** `AUTH-ERR-005 — Sin sede asignada` — RESERVADA
**Tipo de tarea:** documental; definición contractual, funcional, de seguridad y experiencia del bloqueo por denegación concluyente del carril base
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/S_MENSAJES_BLOQUEO/01_IDENTIDAD_APLICACION_Y_TERRITORIO.md`
**Artefactos producidos:** `ADMIN-PERMISSION-BLOCKING-CONTRACT-001`, `ADMIN-PERMISSION-DECISION-MATRIX-001`, `ADMIN-PERMISSION-CHANNEL-RESPONSE-MATRIX-001`, `ADMIN-PERMISSION-APPLICATION-COVERAGE-REGISTER-001` y `ADMIN-PERMISSION-PHYSICAL-RECONCILIATION-001`
**Decisiones consumidas:** `ADR-AUTH-001`; `AUTH-MOD-001`; `AUTH-MOD-002`; `AUTH-MOD-003`; `AUTH-MOD-004`; `AUTH-MOD-006`; `AUTH-MOD-013` a `AUTH-MOD-019`; `AUTH-CAT-001`; `AUTH-CAT-006`; `AUTH-CAT-017`; `AUTH-CTX-001`; `AUTH-CTX-002`; `AUTH-CTX-009`; `AUTH-CTX-015` a `AUTH-CTX-018`; `AUTH-ERR-001`; `AUTH-ERR-002`; `AUTH-ERR-003`; matrices base e individuales vigentes; catálogo canónico de permisos; estado desplegado inspeccionado; contrato documental vigente
**Cambios físicos autorizados:** ninguno; no modifica código, Supabase, Auth, RLS, RPC, Edge Functions, datos, migraciones, configuración, permisos, roles, asignaciones, aplicaciones ni despliegues

---

#### 1. Propósito

Definir de forma única, segura y verificable qué debe ocurrir cuando una
solicitud ya superó autenticación, actividad de identidad y acceso a la
aplicación, pero el carril base no autoriza el permiso exacto requerido para
la acción administrativa solicitada.

La regla raíz queda:

```text
SESIÓN AUTENTICADA VÁLIDA
+
IDENTIDAD LABORAL ACTIVA
+
ACCESO A LA APLICACIÓN PERMITIDO
+
PERMISO REGISTRADO Y ACTIVO
+
PERMISO COMPATIBLE CON CARRIL BASE
+
CONTEXTO Y RECURSO RESOLUBLES
+
CARRIL BASE DENEGADO DE FORMA CONCLUYENTE
→
DENY
+
AUTH_ADMIN_PERMISSION_DENIED
+
403
+
CERO EFECTOS
```

La tarea responde exclusivamente:

```text
¿EL CARRIL BASE AUTORIZA EL PERMISO EXACTO
SOBRE EL RECURSO EXACTO EN ESTE CONTEXTO?
```

No responde:

```text
¿EXISTE SESIÓN?
¿EL USUARIO ESTÁ ACTIVO?
¿PUEDE ENTRAR A LA APLICACIÓN?
¿EXISTE EL PERMISO?
¿EL CARRIL OPERATIVO ESTÁ LISTO?
¿EXISTE SEDE O ÁREA?
¿HAY TURNO O CHECK-IN?
¿EL ROL OPERATIVO ES VÁLIDO?
¿LA EVALUACIÓN TÉCNICA PUDO COMPLETARSE?
```

---

#### 2. Resultado material

Se aprueban cinco artefactos documentales completos:

1. `ADMIN-PERMISSION-BLOCKING-CONTRACT-001`, que congela la identidad pública,
   condiciones de aplicación, causas internas, envelope, seguridad,
   recuperación, frescura y auditoría;
2. `ADMIN-PERMISSION-DECISION-MATRIX-001`, que decide veinte escenarios sin
   mezclar carriles, configuración, contexto, simulación ni errores técnicos;
3. `ADMIN-PERMISSION-CHANNEL-RESPONSE-MATRIX-001`, que materializa diez canales
   de entrega con respuesta coherente y cero efectos;
4. `ADMIN-PERMISSION-APPLICATION-COVERAGE-REGISTER-001`, que registra las diez
   aplicaciones canónicas y las 146 filas físicas candidatas por metadata
   administrativa sin convertir esa metadata en autoridad normativa;
5. `ADMIN-PERMISSION-PHYSICAL-RECONCILIATION-001`, que registra catorce brechas
   físicas observadas y su propietario exacto.

Cobertura materializada:

| Elemento                                                                  |                    Cantidad |
| ------------------------------------------------------------------------- | --------------------------: |
| Código público canónico                                                   |                           1 |
| Estado HTTP no navegacional                                               |                    1, `403` |
| Causas internas admitidas                                                 |                           5 |
| Escenarios con decisión explícita                                         |                          20 |
| Canales con respuesta explícita                                           |                          10 |
| Aplicaciones canónicas reconciliadas                                      |                          10 |
| Aplicaciones con permisos internos de audiencia administrativa observados |                           7 |
| Filas activas no `access` con `permission_audience=administrative`        |                         146 |
| Filas administrativas marcadas además como operativas                     |                           3 |
| Filas administrativas que exigen contexto laboral activo                  |                          15 |
| Concesiones positivas de rol base observadas                              |                         384 |
| Concesiones positivas individuales observadas                             |           8 para 1 empleado |
| Denegaciones base explícitas observadas                                   |                           0 |
| Concesiones base globales observadas                                      | 376 de rol + 8 individuales |
| Concesiones base por sede observadas                                      |                           3 |
| Concesiones base por tipo de sede observadas                              |                           5 |
| Permisos administrativos con al menos un allow de rol base                |                         130 |
| Permisos administrativos sin allow base observado                         |           16, todos en NEXO |
| Funciones PostgreSQL de autorización inspeccionadas                       |                           8 |
| Guards de aplicación reconciliados                                        |                           5 |
| Pantallas físicas de no acceso reconciliadas                              |                           5 |
| Brechas físicas registradas                                               |                          14 |
| Requisitos de prueba derivados                                            |                          10 |

Las cifras físicas son un snapshot de solo lectura. No constituyen conformidad,
no aprueban las matrices actuales y no sustituyen la clasificación canónica
`authorization_requirement`.

---

#### 3. Definición canónica de permiso administrativo

Para esta tarea, un permiso administrativo no se identifica por:

- `permission_audience = administrative`;
- `is_operational = false`;
- `requires_active_work_context = false`;
- estar almacenado en `role_permissions`;
- estar almacenado en `employee_permissions`;
- aparecer en VISO;
- ser utilizado por propietario, gerente general o gerente;
- tener acción `manage`, `configure`, `approve`, `view` o similar;
- mostrarse en una pantalla visualmente administrativa;
- no existir en `operational_role_permissions`.

La definición normativa es:

```text
PERMISO ADMINISTRATIVO PARA AUTH-ERR-004
=
PERMISO CUYO authorization_requirement ADMITE CARRIL BASE
+
DECISIÓN FINAL EN LA QUE LA DENEGACIÓN BASE ES CONCLUYENTE Y DECISIVA
```

Modalidades que admiten carril base:

```text
BASE_ONLY
BASE_OR_OPERATIONAL
BASE_AND_OPERATIONAL
```

`OPERATIONAL_ONLY` no puede producir `AUTH_ADMIN_PERMISSION_DENIED`.

La metadata física observada sirve para inventario y transición, pero no puede
sustituir el contrato canónico del permiso.

---

#### 4. Identidad canónica del bloqueo

La identidad pública única es:

```text
reason_code = AUTH_ADMIN_PERMISSION_DENIED
```

| Propiedad                      | Valor                             |
| ------------------------------ | --------------------------------- |
| Dominio                        | `AUTHORIZATION`                   |
| Decisión                       | `DENY`                            |
| Principal                      | autenticado y válido              |
| Identidad laboral              | activa                            |
| Gate de aplicación             | permitido                         |
| Carril afectado                | `BASE`                            |
| Estado público                 | `FORBIDDEN_ADMIN_PERMISSION`      |
| Estado HTTP no navegacional    | `403 Forbidden`                   |
| Ejecutable                     | `false`                           |
| Sesión Auth                    | se conserva                       |
| Acceso general a la aplicación | se conserva cuando siga permitido |
| Acción original                | no se ejecuta ni se reintenta     |
| Recuperación principal         | `RETURN_TO_SAFE_SURFACE`          |
| Datos protegidos               | no se entregan                    |

Quedan prohibidos como identidad pública alternativa:

- `no_permission`;
- `permission_denied` sin dominio ni versión;
- `role_override`;
- `not_admin`;
- `admin_only`;
- `unauthorized_role`;
- el nombre de un rol;
- el código exacto del permiso en la URL;
- un booleano `false` sin razón contractual;
- un redirect al login;
- un error bruto de PostgreSQL, Supabase, Next.js o Edge Runtime.

---

#### 5. Condiciones acumulativas de aplicación

`AUTH_ADMIN_PERMISSION_DENIED` solo existe cuando todas estas condiciones ya
fueron demostradas:

1. la superficie es protegida;
2. la verificación técnica pudo completarse;
3. existe sesión autenticada válida;
4. la identidad laboral requerida existe y está activa;
5. el actor efectivo es válido y atribuible;
6. la aplicación está registrada, activa y disponible;
7. el gate `app_code.access` fue permitido;
8. el permiso exacto solicitado existe y está activo;
9. el permiso posee `authorization_requirement` válido y versionado;
10. el contrato del permiso admite carril base;
11. el recurso objetivo y el territorio exigido son resolubles;
12. no existe una denegación estructural anterior;
13. se evaluaron bloqueo transversal, deny base, allow base y alcance;
14. el carril base terminó en `DENY` concluyente;
15. la combinación de carriles determina que esa denegación es decisiva;
16. no se produjo ningún efecto empresarial ni entrega parcial de datos.

Si cualquiera de las condiciones 1 a 12 no puede demostrarse, esta tarea no
permite inventar una denegación administrativa.

---

#### 6. Causas internas admitidas

Las causas internas son exhaustivas y no se muestran al usuario.

| Causa interna                         | Definición                                                                                | Resultado público              | Exposición   |
| ------------------------------------- | ----------------------------------------------------------------------------------------- | ------------------------------ | ------------ |
| `ACTOR_WIDE_PERMISSION_DENY`          | Existe un bloqueo individual transversal aplicable al actor, permiso, recurso y vigencia. | `AUTH_ADMIN_PERMISSION_DENIED` | No se expone |
| `EXPLICIT_BASE_PERMISSION_DENY`       | Existe un deny aplicable dentro del carril base y prevalece sobre cualquier allow base.   | `AUTH_ADMIN_PERMISSION_DENIED` | No se expone |
| `NO_EFFECTIVE_BASE_PERMISSION_ALLOW`  | No existe allow base aplicable después de evaluar rol base y concesiones individuales.    | `AUTH_ADMIN_PERMISSION_DENIED` | No se expone |
| `BASE_PERMISSION_SCOPE_MISMATCH`      | Existen allows base, pero ninguno cubre el recurso y territorio ya resueltos.             | `AUTH_ADMIN_PERMISSION_DENIED` | No se expone |
| `BASE_PERMISSION_PREREQUISITE_DENIED` | Un prerrequisito explícito y registrado del permiso fue denegado en el carril base.       | `AUTH_ADMIN_PERMISSION_DENIED` | No se expone |

No se admiten causas `UNKNOWN`, `OTHER`, texto libre o errores técnicos
convertidos en causas de política.

La auditoría protegida deberá distinguir:

```text
DEFAULT DENY
≠
EXPLICIT DENY
≠
SCOPE MISMATCH
≠
ACTOR-WIDE DENY
```

---

#### 7. Condiciones que no pertenecen al bloqueo

| Condición observada                                  | Clasificación correcta                     | Tarea o contrato propietario          |
| ---------------------------------------------------- | ------------------------------------------ | ------------------------------------- |
| No existe sesión válida                              | autenticación ausente                      | `AUTH-ERR-001`                        |
| La identidad requerida está inactiva                 | identidad inactiva                         | `AUTH-ERR-002`                        |
| No existe acceso a la aplicación                     | gate de aplicación                         | `AUTH-ERR-003`                        |
| El permiso solicitado no existe                      | permiso no registrado                      | `AUTH-ERR-018`                        |
| El permiso está inactivo                             | configuración o ciclo de vida              | `AUTH-ERR-017` / catálogo propietario |
| Falta `authorization_requirement`                    | configuración administrativa inconsistente | `AUTH-ERR-017`                        |
| La modalidad contiene un valor no admitido           | configuración administrativa inconsistente | `AUTH-ERR-017`                        |
| El evaluador, RPC o red devuelve error               | error técnico, sin decisión autoritativa   | `AUTH-ERR-019`                        |
| El permiso es `OPERATIONAL_ONLY`                     | evaluación operativa, no carril base       | contrato de autorización operativo    |
| Falta sede asignada necesaria                        | bloqueo territorial                        | `AUTH-ERR-005`                        |
| Falta sede activa necesaria                          | bloqueo territorial                        | `AUTH-ERR-006`                        |
| Falta área asignada necesaria                        | bloqueo territorial                        | `AUTH-ERR-007`                        |
| Falta área activa necesaria                          | bloqueo territorial                        | `AUTH-ERR-008`                        |
| Falta turno, check-in o rol operativo                | bloqueo operativo específico               | `AUTH-ERR-009` a `AUTH-ERR-014`       |
| El dispositivo no está autorizado                    | bloqueo de dispositivo                     | `AUTH-ERR-015`                        |
| Una simulación intenta ejecutar una acción real      | bloqueo de simulación                      | `AUTH-ERR-016`                        |
| RLS devuelve cero filas sin diagnóstico autoritativo | resultado insuficiente para clasificar     | `AUTH-ERR-019` / adapter propietario  |

Regla obligatoria:

```text
NO SE PUDO EVALUAR EL PERMISO
≠
SE EVALUÓ Y EL CARRIL BASE FUE DENEGADO
```

---

#### 8. Precedencia dentro del árbol de bloqueo

Orden normativo:

```text
1. CLASIFICAR SUPERFICIE PÚBLICA O PROTEGIDA
2. VERIFICAR DISPONIBILIDAD TÉCNICA DEL EVALUADOR
3. VERIFICAR SESIÓN
4. RESOLVER IDENTIDAD Y ACTOR EFECTIVO
5. VERIFICAR ACTIVIDAD DE LA IDENTIDAD
6. VERIFICAR APLICACIÓN Y GATE app_code.access
7. RESOLVER PERMISO Y CONTRATO authorization_requirement
8. RESOLVER RECURSO Y TERRITORIO OBLIGATORIO
9. EVALUAR DENEGACIONES ESTRUCTURALES
10. EVALUAR BLOQUEO INDIVIDUAL TRANSVERSAL
11. EVALUAR DENY BASE APLICABLE
12. EVALUAR ALLOW BASE APLICABLE
13. EVALUAR CARRIL OPERATIVO CUANDO EL CONTRATO LO EXIJA O ADMITA
14. COMBINAR CARRILES SEGÚN EL CONTRATO
15. EMITIR UNA DECISIÓN Y UNA RAZÓN PÚBLICA
```

La evaluación del permiso administrativo ocurre después del acceso a la
aplicación y antes de ejecutar la acción.

Una razón estructural anterior no puede ocultarse con
`AUTH_ADMIN_PERMISSION_DENIED`.

---

#### 9. `ADMIN-PERMISSION-BLOCKING-CONTRACT-001`

Forma contractual mínima:

```ts
type AdminPermissionBlockingReason = {
  contract: "ADMIN-PERMISSION-BLOCKING-CONTRACT-001";
  contract_version: "1.0.0";
  reason_code: "AUTH_ADMIN_PERMISSION_DENIED";
  domain: "AUTHORIZATION";
  decision: "DENY";
  executable: false;
  http_status: 403;

  app_code: string;
  permission_key_ref: string;
  authorization_requirement:
    | "BASE_ONLY"
    | "BASE_OR_OPERATIONAL"
    | "BASE_AND_OPERATIONAL";
  decisive_lane: "BASE";

  resource_ref: string | null;
  correlation_id: string;
  occurred_at: string;
  context_version: string;
  catalog_version: string;
  decision_version: string;

  recovery_action: "RETURN_TO_SAFE_SURFACE";
};
```

`permission_key_ref` y `resource_ref` son referencias internas opacas. La
proyección pública no incluye el código exacto del permiso ni identificadores
sensibles del recurso.

La forma pública mínima será:

```ts
type PublicAdminPermissionDenied = {
  reason_code: "AUTH_ADMIN_PERMISSION_DENIED";
  decision: "DENY";
  executable: false;
  http_status: 403;
  correlation_id: string;
  recovery_action: "RETURN_TO_SAFE_SURFACE";
};
```

---

#### 10. Algoritmo normativo del carril base

El carril base seguirá exactamente este orden:

```text
VALIDAR ESTRUCTURA
        ↓
BUSCAR ACTOR_WIDE_DENY
        ↓
BUSCAR BASE_DENY APLICABLE
        ↓
BUSCAR BASE_ALLOW APLICABLE
        ↓
VALIDAR ALCANCE DEL ALLOW
        ↓
BASE_ALLOW O BASE_DENY
```

Pseudocontrato documental:

```text
if structural_issue:
    return STRUCTURAL_DENY

if matching_actor_wide_deny:
    return BASE_DENY(ACTOR_WIDE_PERMISSION_DENY)

if matching_base_deny:
    return BASE_DENY(EXPLICIT_BASE_PERMISSION_DENY)

if no matching_base_allow:
    return BASE_DENY(NO_EFFECTIVE_BASE_PERMISSION_ALLOW)

if no matching_allow_covers_resource:
    return BASE_DENY(BASE_PERMISSION_SCOPE_MISMATCH)

if prerequisite_base_permission_denied:
    return BASE_DENY(BASE_PERMISSION_PREREQUISITE_DENIED)

return BASE_ALLOW
```

El orden no puede invertirse para permitir que un allow individual venza un
deny de rol o que un allow global ignore un deny territorial aplicable.

---

#### 11. Fuentes válidas del carril base

Fuentes positivas:

```text
ROL BASE
→ role_permissions allow

TRABAJADOR
→ employee_permissions allow de carril base
```

Fuentes negativas:

```text
ROL BASE
→ role_permissions deny

TRABAJADOR
→ employee_permissions deny de carril base

TRABAJADOR
→ actor-wide deny aplicable a todos los carriles compatibles
```

No son fuentes válidas del carril base:

- rol operativo;
- `navigation_role`;
- turno;
- check-in;
- plantilla de dispositivo;
- allowlist de aplicación del dispositivo;
- rol simulado;
- cookie de override;
- nombre privilegiado de rol;
- service role;
- estado de una tarjeta o botón;
- claim de metadata editable por el usuario;
- fila presente en una matriz incompatible.

---

#### 12. Modalidad `BASE_ONLY`

Para `BASE_ONLY` solo se evalúa el carril base.

| Base                       | Operativo   | Resultado                      |
| -------------------------- | ----------- | ------------------------------ |
| `ALLOW`                    | no evaluado | `ALLOW`                        |
| deny explícito             | no evaluado | `AUTH_ADMIN_PERMISSION_DENIED` |
| actor-wide deny            | no evaluado | `AUTH_ADMIN_PERMISSION_DENIED` |
| sin allow                  | no evaluado | `AUTH_ADMIN_PERMISSION_DENIED` |
| scope mismatch concluyente | no evaluado | `AUTH_ADMIN_PERMISSION_DENIED` |
| error técnico              | no evaluado | `AUTH-ERR-019`                 |
| modalidad ausente          | no evaluado | `AUTH-ERR-017`                 |

Una fila operativa con el mismo código no participa y se registra como
configuración incompatible para su reconciliación.

---

#### 13. Modalidad `BASE_OR_OPERATIONAL`

Cada carril debe producir una decisión completa e independiente.

```text
BASE_ALLOW
OR
OPERATIONAL_ALLOW
=
ALLOW
```

Reglas:

1. una denegación base no destruye un `OPERATIONAL_ALLOW` válido;
2. una denegación operativa no destruye un `BASE_ALLOW` válido;
3. no se mezclan permiso de un carril y territorio del otro;
4. no se emite `AUTH_ADMIN_PERMISSION_DENIED` mientras otro carril haya
   producido `ALLOW`;
5. una razón estructural necesaria para evaluar un carril conserva su propia
   identidad y precedencia;
6. `AUTH_ADMIN_PERMISSION_DENIED` solo será razón pública final cuando la
   denegación base resulte decisiva después de combinar ambos carriles;
7. la auditoría podrá conservar ambas decisiones sin mostrar detalles al
   usuario.

Tabla mínima:

| Base          | Operativo                          | Resultado final                                                                    |
| ------------- | ---------------------------------- | ---------------------------------------------------------------------------------- |
| `ALLOW`       | `ALLOW`                            | `ALLOW`                                                                            |
| `ALLOW`       | `DENY`                             | `ALLOW` por base                                                                   |
| `DENY`        | `ALLOW`                            | `ALLOW` por operativo                                                              |
| `DENY`        | no aplicable por contrato de actor | deny con razón base decisiva                                                       |
| `DENY`        | `DENY`                             | deny; la razón primaria se selecciona por precedencia, nunca por orden de consulta |
| error técnico | cualquier resultado                | error técnico, no denegación inventada                                             |

Esta tarea no crea una preferencia universal del carril base sobre el
operativo.

---

#### 14. Modalidad `BASE_AND_OPERATIONAL`

Ambos carriles deben autorizar el mismo recurso.

```text
BASE_ALLOW
AND
OPERATIONAL_ALLOW
=
ALLOW
```

Reglas:

1. una condición estructural operativa ausente conserva la razón específica
   de `AUTH-ERR-009` a `AUTH-ERR-014`;
2. una condición estructural territorial ausente conserva la razón de
   `AUTH-ERR-005` a `AUTH-ERR-008`;
3. con ambos carriles estructuralmente válidos, un `BASE_DENY` concluyente
   produce `AUTH_ADMIN_PERMISSION_DENIED`;
4. un `OPERATIONAL_DENY` no se reetiqueta como permiso administrativo;
5. el alcance final es la intersección de base, operación y recurso;
6. ningún carril presta fragmentos al otro;
7. el actor-wide deny termina ambos carriles.

---

#### 15. Denegación explícita y denegación por defecto

Diferencia obligatoria:

```text
DEFAULT DENY
=
NO EXISTE ALLOW APLICABLE
```

```text
EXPLICIT DENY
=
EXISTE UNA DECISIÓN NEGATIVA APLICABLE
```

Ambas pueden producir la misma respuesta pública, pero deben conservarse como
causas internas diferentes.

Reglas:

- cualquier deny aplicable prevalece sobre allows del mismo carril;
- la especificidad determina coincidencia, no permite que un allow venza un
  deny;
- un deny global bloquea allows específicos;
- un deny específico excluye solo el territorio que cubre;
- un allow individual normal no anula un deny de rol;
- un allow de rol no anula un deny individual;
- la ausencia de deny no equivale a allow;
- la ausencia de allow termina en default deny.

El snapshot desplegado posee cero denies en las tablas observadas. Esto no
elimina la semántica canónica ni autoriza a los evaluadores a ignorarla.

---

#### 16. Territorio, recurso y contexto

El carril base debe evaluar el recurso real y su territorio autoritativo.

Fuentes admitidas:

- relación persistida del recurso;
- sede o área propietaria verificada;
- identidad organizacional del recurso;
- contrato de recurso aprobado;
- referencia opaca resuelta en servidor.

Fuentes no autoritativas:

- `selectedSite`;
- `selectedArea`;
- query string;
- body del cliente sin revalidar;
- ruta mostrada;
- sede primaria por fallback;
- última sede utilizada;
- turno no vigente;
- nombre de rol;
- metadata visual.

Regla:

```text
NO HAY TERRITORIO SUFICIENTE PARA EVALUAR
→
RAZÓN TERRITORIAL O CONFIGURACIÓN
```

No:

```text
NO HAY TERRITORIO
→
AUTH_ADMIN_PERMISSION_DENIED
```

`BASE_PERMISSION_SCOPE_MISMATCH` solo se utiliza cuando el contexto y el
recurso ya son resolubles y ninguna concesión los cubre.

---

#### 17. Rol base, cobertura administrativa y permiso

Separación obligatoria:

```text
ROL BASE
≠
PERMISO
```

```text
COBERTURA ADMINISTRATIVA
≠
ALLOW
```

```text
SEDE ASIGNADA
≠
PERMISO
```

```text
ROL PRIVILEGIADO POR NOMBRE
≠
BYPASS
```

Un propietario o gerente general solo recibe una acción si existe una
concesión exacta, compatible, vigente y aplicable.

Un gerente por sede no obtiene autoridad organizacional por el nombre del
cargo.

Una cobertura `ORGANIZATION` permite evaluar alcance global, pero no crea el
permiso.

---

#### 18. Simulación, override, dispositivos y servicios

##### 18.1 Simulación

Una identidad simulada puede producir una decisión hipotética para consulta,
pero no puede:

- autorizar una mutación real;
- reemplazar el actor real;
- modificar RLS;
- reutilizar una decisión como real;
- convertir un rol simulado en grant base del administrador.

Si una simulación intenta ejecutar una acción real, la razón pertenece a
`AUTH-ERR-016`, no a `AUTH_ADMIN_PERMISSION_DENIED`.

##### 18.2 Role override

Una cookie o selector de rol de prueba no es una fuente de autoridad real.

Puede utilizarse únicamente dentro de una simulación explícita, identificada,
no mutante y auditada. No puede modificar la evaluación real del permiso.

##### 18.3 Dispositivo compartido

La allowlist de aplicaciones del dispositivo:

```text
DEVICE_APP_ALLOWED
```

no concede permisos administrativos al actor.

El `navigation_role` tampoco es rol base, rol operativo ni permiso.

##### 18.4 Service role

`service_role` puede omitir RLS técnicamente, pero no concede autorización
empresarial. Una acción humana privilegiada requiere actor real y permiso base
antes de utilizar el cliente administrativo.

---

#### 19. `ADMIN-PERMISSION-DECISION-MATRIX-001`

| ID      | Escenario                                                      | Evidencia concluyente                            | Resultado                                                         | Propietario                     |
| ------- | -------------------------------------------------------------- | ------------------------------------------------ | ----------------------------------------------------------------- | ------------------------------- |
| `AP-01` | Superficie pública                                             | No requiere autorización laboral                 | permitir acceso público                                           | contrato de superficie          |
| `AP-02` | Sin sesión                                                     | No existe principal autenticado válido           | `AUTH_NO_SESSION`                                                 | `AUTH-ERR-001`                  |
| `AP-03` | Identidad laboral inactiva                                     | Actividad negativa confirmada                    | `AUTH_USER_INACTIVE`                                              | `AUTH-ERR-002`                  |
| `AP-04` | Sin acceso a aplicación                                        | Gate `app_code.access` denegado                  | `AUTH_APP_ACCESS_DENIED`                                          | `AUTH-ERR-003`                  |
| `AP-05` | Permiso no registrado                                          | Catálogo no contiene el código                   | error de catálogo                                                 | `AUTH-ERR-018`                  |
| `AP-06` | Permiso inactivo o modalidad ausente                           | Contrato incompleto                              | error de configuración                                            | `AUTH-ERR-017`                  |
| `AP-07` | Evaluador o RPC falla                                          | No existe decisión autoritativa                  | error técnico                                                     | `AUTH-ERR-019`                  |
| `AP-08` | `OPERATIONAL_ONLY` solicitado                                  | Carril base incompatible                         | continuar evaluación operativa; no usar esta razón                | contrato operativo              |
| `AP-09` | `BASE_ONLY` con actor-wide deny                                | Bloqueo transversal aplicable                    | `AUTH_ADMIN_PERMISSION_DENIED`                                    | `AUTH-ERR-004`                  |
| `AP-10` | `BASE_ONLY` con deny base                                      | Denegación de carril aplicable                   | `AUTH_ADMIN_PERMISSION_DENIED`                                    | `AUTH-ERR-004`                  |
| `AP-11` | `BASE_ONLY` sin allow                                          | Evaluación completa sin concesión                | `AUTH_ADMIN_PERMISSION_DENIED`                                    | `AUTH-ERR-004`                  |
| `AP-12` | `BASE_ONLY` con scope mismatch                                 | Contexto y recurso resueltos, concesión no cubre | `AUTH_ADMIN_PERMISSION_DENIED`                                    | `AUTH-ERR-004`                  |
| `AP-13` | Falta sede o área necesaria                                    | Territorio no resoluble                          | razón territorial específica                                      | `AUTH-ERR-005` a `AUTH-ERR-008` |
| `AP-14` | `BASE_OR_OPERATIONAL`: base deny, operativo allow              | Un carril completo permite                       | `ALLOW`                                                           | autorización canónica           |
| `AP-15` | `BASE_OR_OPERATIONAL`: base allow, operativo deny              | Un carril completo permite                       | `ALLOW`                                                           | autorización canónica           |
| `AP-16` | `BASE_OR_OPERATIONAL`: ambos deny                              | Ningún carril permite                            | `DENY`; seleccionar razón por precedencia y causa decisiva        | autorización canónica           |
| `AP-17` | `BASE_AND_OPERATIONAL`: base deny, operativo válido            | Base requerido falla                             | `AUTH_ADMIN_PERMISSION_DENIED`                                    | `AUTH-ERR-004`                  |
| `AP-18` | `BASE_AND_OPERATIONAL`: base allow, contexto operativo ausente | Condición estructural operativa falla            | razón operativa específica                                        | `AUTH-ERR-009` a `AUTH-ERR-014` |
| `AP-19` | Simulación intenta mutar                                       | Modo simulado confirmado                         | acción no permitida en simulación                                 | `AUTH-ERR-016`                  |
| `AP-20` | Permiso permitido y recurso cubierto                           | Evaluación completa y fresca                     | continuar ejecución con nueva validación en frontera autoritativa | paquete propietario             |

La matriz no autoriza acciones. Materializa la clasificación de cada escenario.

---

#### 20. `ADMIN-PERMISSION-CHANNEL-RESPONSE-MATRIX-001`

| Canal                              | Respuesta canónica                                       | Estado            | Efecto permitido | Prohibiciones                                       |
| ---------------------------------- | -------------------------------------------------------- | ----------------- | ---------------- | --------------------------------------------------- |
| Navegación web GET/HEAD            | pantalla de bloqueo autenticada o estado embebido seguro | `403` semántico   | ninguno          | login, contenido protegido, ruta o permiso exacto   |
| Mutación web POST/PUT/PATCH/DELETE | respuesta tipada                                         | `403`             | ninguno          | redirect, reintento, efecto parcial                 |
| Server Action                      | error discriminado serializable                          | `403` equivalente | ninguno          | `redirect()` como única señal, excepción bruta      |
| Route Handler / API                | JSON contractual                                         | `403`             | ninguno          | HTML, booleano ambiguo, stack trace                 |
| Fetch/RSC                          | estado tipado sin payload protegido                      | `403`             | ninguno          | modelo parcial, caché de datos sensibles            |
| RPC PostgreSQL                     | decisión estructurada o excepción contractual separada   | deny tipado       | ninguno          | `false` sin causa, texto libre, service-role bypass |
| RLS/Data API                       | cero filas o rechazo más adapter autoritativo            | deny              | ninguno          | deducir esta razón solo desde lista vacía           |
| Edge Function                      | JSON contractual después de autorización empresarial     | `403`             | ninguno          | confiar únicamente en JWT o service role            |
| Realtime/WebSocket/SSE             | negar suscripción o detener entrega                      | cierre tipado     | ninguno          | eventos posteriores a revocación                    |
| Cliente nativo                     | estado discriminado persistible sin secretos             | `403`             | ninguno          | loop de login, reenvío de mutación                  |

Todos los canales deben producir una decisión equivalente para el mismo
snapshot y recurso.

---

#### 21. Mensaje humano canónico

Copy aprobado en español:

| Elemento          | Texto exacto                                                                                                          |
| ----------------- | --------------------------------------------------------------------------------------------------------------------- |
| Título            | `No tienes permiso para realizar esta acción`                                                                         |
| Mensaje           | `Tu cuenta puede usar esta aplicación, pero no tiene el permiso administrativo necesario para completar esta acción.` |
| Acción principal  | `Volver`                                                                                                              |
| Acción secundaria | `Volver a Vento OS`                                                                                                   |
| Código de soporte | `AUTH_ADMIN_PERMISSION_DENIED`                                                                                        |

Reglas:

1. no afirmar que la sesión expiró;
2. no afirmar que el usuario está inactivo;
3. no afirmar que la aplicación completa está bloqueada;
4. no mostrar el permiso exacto;
5. no mostrar rol, fuente de grant o fuente de deny;
6. no mostrar sede, área o recurso sensible;
7. no mostrar la ruta solicitada;
8. no prometer que un administrador concederá acceso;
9. no presentar cierre de sesión como solución principal;
10. no culpar al usuario;
11. conservar el código de soporte sin dominar visualmente la pantalla;
12. ser navegable por teclado y anunciable por lector de pantalla.

---

#### 22. Recuperación segura

##### 22.1 Acción principal — `Volver`

Debe regresar a una superficie autenticada segura que el actor pueda utilizar,
por ejemplo:

- pantalla anterior no sensible validada;
- inicio permitido de la aplicación;
- listado autorizado que originó la acción;
- fallback al Hub cuando no exista retorno seguro.

No debe:

- repetir la mutación;
- conservar un formulario sensible en URL;
- reusar un `ALLOW` anterior;
- construir retorno desde un valor absoluto no confiable;
- mostrar el recurso denegado;
- cambiar de rol;
- activar simulación;
- abrir una pantalla para editar permisos.

##### 22.2 Acción secundaria — `Volver a Vento OS`

Dirige al Hub autenticado. Cada superficie del Hub y cada aplicación destino
vuelven a validar su propio acceso.

##### 22.3 Solicitud de acceso

Esta tarea no crea un flujo automático de solicitud o concesión de permisos.
Si una aplicación ofrece soporte, solo podrá enviar una referencia opaca,
correlación y contexto mínimo aprobado. Nunca podrá otorgar acceso ni modificar
matrices desde la pantalla de bloqueo.

---

#### 23. Seguridad y minimización

La respuesta pública no incluirá:

- `permission_key` exacto;
- `role_code`;
- `employee_id`;
- `auth_user_id`;
- fuente de allow o deny;
- `scope_type`;
- `scope_site_id`;
- `scope_area_id`;
- nombre del recurso;
- identificador sensible del recurso;
- ruta completa;
- query string original;
- cuerpo de mutación;
- cookies;
- JWT;
- stack trace;
- error de Supabase;
- definición SQL;
- información de simulación o override.

La correlación pública deberá ser opaca y no reversible.

Los logs no almacenarán cuerpos sensibles ni secretos. La auditoría protegida
puede conservar referencias internas mínimas sujetas a retención y acceso
controlado.

---

#### 24. Frescura, concurrencia y fronteras autoritativas

Una decisión `ALLOW` o `DENY` pertenece a un snapshot concreto.

Eventos invalidantes mínimos:

- cambio de rol base;
- alta, modificación o retiro de un grant;
- alta, modificación o retiro de un deny;
- cambio de alcance;
- cambio de actividad del permiso;
- cambio de `authorization_requirement`;
- cambio de versión del catálogo;
- cambio de identidad o actor;
- cambio del territorio del recurso;
- inicio o fin de simulación;
- cambio de sesión de dispositivo.

Reglas:

1. una mutación revalida inmediatamente antes del efecto;
2. una decisión cacheada no se reutiliza después de un evento invalidante;
3. una suscripción Realtime deja de entregar datos tras una revocación;
4. una pestaña abierta no conserva autoridad indefinidamente;
5. un cambio de rol no reanuda automáticamente una operación bloqueada;
6. una concesión posterior requiere una solicitud nueva;
7. el frontend no convierte un estado viejo en `ALLOW`.

---

#### 25. Auditoría mínima

Eventos mínimos:

| Evento                            | Momento                           | Contenido mínimo                                                                                |
| --------------------------------- | --------------------------------- | ----------------------------------------------------------------------------------------------- |
| `auth.admin_permission.denied`    | decisión autoritativa             | actor_ref, app_code, permission_ref, decisive_lane, cause, resource_ref, versiones, correlación |
| `auth.admin_permission.presented` | UI o cliente muestra estado       | canal, app_code, reason_code, correlación                                                       |
| `auth.admin_permission.returned`  | usuario usa recuperación          | destino seguro clasificado, correlación                                                         |
| `auth.admin_permission.rechecked` | nueva solicitud después de cambio | versiones anterior y nueva, resultado nuevo, correlación nueva                                  |

No se registran:

- tokens;
- cookies;
- cuerpo completo;
- datos personales no necesarios;
- texto de error bruto;
- permiso o recurso en analytics públicos;
- una falsa evidencia de ejecución.

`presented` y `returned` no demuestran que la acción haya sido autorizada ni
ejecutada.

---

#### 26. `ADMIN-PERMISSION-APPLICATION-COVERAGE-REGISTER-001`

El inventario físico de solo lectura usa `permission_audience=administrative`
como señal diagnóstica. La clasificación canónica futura deberá provenir de
`authorization_requirement`.

| App      | Dominio de identidad                                    | Filas admin no `access` | Marcadas operativas | Exigen contexto activo | Allows de rol base | Allows individuales | Permisos sin allow base observado | Decisión documental                                                                                                         |
| -------- | ------------------------------------------------------- | ----------------------: | ------------------: | ---------------------: | -----------------: | ------------------: | --------------------------------: | --------------------------------------------------------------------------------------------------------------------------- |
| `shell`  | laboral                                                 |                       0 |                   0 |                      0 |                  0 |                   0 |                                 0 | El contrato aplica a futuras acciones protegidas; `shell.access` pertenece a AUTH-ERR-003.                                  |
| `anima`  | laboral                                                 |                       9 |                   0 |                      0 |                 30 |                   4 |                                 0 | Aplica a acciones administrativas internas; la entrada a ANIMA no concede sus capacidades.                                  |
| `viso`   | laboral                                                 |                      25 |                   0 |                     11 |                 93 |                   4 |                                 0 | Aplica a administración de personal, roles, permisos y configuración; no admite bypass por cargo.                           |
| `nexo`   | laboral                                                 |                      98 |                   1 |                      1 |                231 |                   0 |                                16 | Aplica a acciones base del dominio; las 16 filas sin allow observado permanecen default deny hasta decisión de matriz.      |
| `fogo`   | laboral                                                 |                       1 |                   1 |                      1 |                  4 |                   0 |                                 0 | La metadata física es híbrida; el contrato canónico del permiso decide el carril.                                           |
| `origo`  | laboral                                                 |                       5 |                   0 |                      2 |                  9 |                   0 |                                 0 | Aplica a capacidades base de compras y configuración; recepción operativa conserva carril propio.                           |
| `pulso`  | laboral                                                 |                       1 |                   1 |                      0 |                  3 |                   0 |                                 0 | La etiqueta administrativa no convierte una capacidad operativa en base.                                                    |
| `numera` | laboral                                                 |                       7 |                   0 |                      0 |                 14 |                   0 |                                 0 | Aplica a capacidades financieras exactas; alcance global no equivale a todas las acciones.                                  |
| `aura`   | laboral, roadmap diferido                               |                       0 |                   0 |                      0 |                  0 |                   0 |                                 0 | No se inventa cobertura antes de auditoría e implementación; el contrato queda reservado para acciones futuras registradas. |
| `pass`   | cliente principal, laboral solo en superficies internas |                       0 |                   0 |                      0 |                  0 |                   0 |                                 0 | El acceso normal del cliente no usa este bloqueo laboral; una superficie interna deberá declarar permiso laboral exacto.    |

Totales:

```text
146 filas candidatas por audiencia administrativa
3 marcadas además como operativas
15 con requires_active_work_context = true
384 allows de rol base
8 allows individuales para un empleado
0 denies base observados
376 allows de rol globales
3 allows de rol por sede
5 allows de rol por tipo de sede
130 permisos con allow de rol observado
16 permisos sin allow base observado
```

La distribución demuestra que `permission_audience`, `is_operational` y
`requires_active_work_context` no son sustitutos fiables de
`authorization_requirement`.

---

#### 27. Estado físico de Supabase inspeccionado

##### 27.1 Catálogo

`public.app_permissions` no contiene actualmente una columna desplegada
`authorization_requirement`.

Sí contiene:

- `permission_audience`;
- `is_operational`;
- `requires_active_work_context`;
- metadata humana;
- estado activo.

Consecuencia:

```text
ESTADO DESPLEGADO
NO PUEDE MATERIALIZAR DIRECTAMENTE
LA MODALIDAD CANÓNICA BASE_ONLY / OPERATIONAL_ONLY /
BASE_OR_OPERATIONAL / BASE_AND_OPERATIONAL
```

La implementación pertenece a `AUTH-CAT-006`, `AUTH-DB-034` y al paquete E5
correspondiente mediante migración versionada en `vento-shell`.

##### 27.2 Matrices

El snapshot registra:

- 384 allows de rol base para filas candidatas administrativas;
- 8 allows individuales;
- cero denies explícitos en esas fuentes;
- 130 permisos con al menos una concesión de rol;
- 16 permisos NEXO sin concesión base observada.

Cero denies observados no prueba que los evaluadores implementen correctamente
la precedencia futura `deny > allow`.

##### 27.3 Funciones

Se inspeccionaron:

- `has_permission`;
- `has_role_permission`;
- `has_effective_permission_v1`;
- `has_operational_permission`;
- `has_operational_role_permission`;
- `get_operational_context`;
- `get_effective_context_v1`;
- `permission_scope_matches`.

Las funciones constituyen evidencia de transición, no conformidad canónica.

---

#### 28. Estado físico de aplicaciones inspeccionado

Se reconciliaron guards y pantallas de no acceso de:

- VISO;
- NEXO;
- FOGO;
- ORIGO;
- PULSO.

Hallazgos comunes:

1. existen códigos libres como `no_permission`, `role_override` y
   `shared_device_no_permission`;
2. varias rutas transportan el permiso exacto en query string;
3. algunas pantallas muestran ruta y permiso solicitados;
4. el copy mezcla acceso a módulo, permiso de acción y sede seleccionada;
5. el error de RPC puede convertirse en `false` y presentarse como deny;
6. lógica de permisos, scopes y role override está duplicada;
7. la cobertura equivalente en ANIMA, NUMERA, AURA y PASS no quedó demostrada
   por las fuentes inspeccionadas y no se presume.

Esta tarea no modifica esos repositorios.

---

#### 29. `ADMIN-PERMISSION-PHYSICAL-RECONCILIATION-001`

| ID       | Brecha física observada                                                                          | Riesgo                                               | Tarea responsable                                  | Condición de salida                           |
| -------- | ------------------------------------------------------------------------------------------------ | ---------------------------------------------------- | -------------------------------------------------- | --------------------------------------------- |
| `APG-01` | `app_permissions` no materializa `authorization_requirement`.                                    | Modalidad inferida o permisiva.                      | `AUTH-CAT-006`; `AUTH-DB-034`                      | Catálogo físico versionado y validado.        |
| `APG-02` | `has_permission` produce booleano sin causa, versiones ni lane.                                  | Default deny, explicit deny y error indistinguibles. | `AUTH-DB-034`; `SHELL-AUTH-002`                    | Decisión estructurada consumible.             |
| `APG-03` | `has_permission` evalúa deny individual, pero no deny de rol base.                               | Allow puede vencer una política negativa futura.     | `AUTH-DB-034`; `SHELL-CI-016`                      | Precedencia completa probada.                 |
| `APG-04` | `has_role_permission` consulta únicamente allows.                                                | Simulación o helper de rol ignora denies.            | `AUTH-DB-034`; `SHELL-CI-016`                      | Denies del carril incluidos.                  |
| `APG-05` | `has_effective_permission_v1` combina base y operación con `OR` sin consumir modalidad canónica. | Carril incompatible puede autorizar.                 | `AUTH-DB-034`; `SHELL-AUTH-001`                    | Combinación gobernada por catálogo.           |
| `APG-06` | `has_operational_permission` retorna `true` cuando existe bypass administrativo.                 | Rol base autoriza cualquier permiso operativo.       | `AUTH-DB-034`; `SHELL-AUTH-002`                    | Bypass eliminado y pruebas negativas.         |
| `APG-07` | `get_operational_context` activa bypass por nombres `propietario` y `gerente_general`.           | Wildcard por cargo.                                  | `AUTH-DB-034`; `SHELL-AUTH-005`                    | Permisos explícitos reemplazan nombres.       |
| `APG-08` | `get_effective_context_v1` usa `navigation_role` como rol operativo efectivo de dispositivo.     | Preferencia de navegación se vuelve autoridad.       | `AUTH-DB-033`; `SHELL-AUTH-001`                    | Sesión de actor y rol real resueltos.         |
| `APG-09` | La ruta de simulación puede consultar grants y participar en `has_effective_permission_v1`.      | Decisión simulada reutilizada como real.             | `AUTH-SIM-006`; `SHELL-AUTH-002`                   | Evaluadores físico real y simulado separados. |
| `APG-10` | VISO permite role override mediante cookie dentro del guard.                                     | Cookie local cambia autorización real.               | `AUTH-SIM-006`; `SHELL-AUTH-005`                   | Override limitado a simulación no mutante.    |
| `APG-11` | Helpers TypeScript convierten cualquier error RPC en `false`.                                    | Falla técnica presentada como falta de permiso.      | `AUTH-ERR-019`; `SHELL-AUTH-002`                   | Resultados discriminados y errores separados. |
| `APG-12` | Guards duplican evaluación y razones libres entre aplicaciones.                                  | Drift y precedencia divergente.                      | `SHELL-AUTH-001`; `SHELL-AUTH-005`                 | SDK compartido adoptado por consumidoras.     |
| `APG-13` | Pantallas muestran ruta, permiso o copy que mezcla módulo, acción y territorio.                  | Filtración y mensaje incorrecto.                     | `AUTH-ERR-020`; `SHELL-AUTH-005`                   | Catálogo compartido de mensajes aplicado.     |
| `APG-14` | No se demostró cobertura equivalente en las diez aplicaciones.                                   | Adopción parcial presentada como cumplimiento.       | `SHELL-AUTH-004`; `SHELL-AUTH-005`; `SHELL-CI-019` | Registro de consumidoras y evidencia por app. |

Ninguna brecha se declara implementada o validada.

---

#### 30. Propiedad de implementación y orden

Orden obligatorio de materialización futura:

```text
1. VERSIONAR authorization_requirement EN EL CATÁLOGO
2. IMPLEMENTAR AccessContext Y AuthorizationDecision COMPARTIDOS
3. IMPLEMENTAR EVALUACIÓN BASE CON DENY > ALLOW
4. SEPARAR ERRORES TÉCNICOS DE DENEGACIONES
5. SEPARAR EVALUACIÓN REAL Y SIMULADA
6. ELIMINAR BYPASSES POR NOMBRE, COOKIE Y navigation_role
7. PUBLICAR ADAPTERS POR CANAL
8. MIGRAR CONSUMIDORAS
9. APLICAR MENSAJES COMPARTIDOS
10. EJECUTAR REGRESIÓN Y PUBLICAR EVIDENCIA
```

Tareas propietarias:

- `AUTH-CAT-006`: modalidad canónica;
- `AUTH-DB-033`: contexto y actor efectivo;
- `AUTH-DB-034`: evaluador unificado;
- `AUTH-DB-035`: frescura e invalidación;
- `SHELL-AUTH-001`: SDK canónico;
- `SHELL-AUTH-002`: adapters de servidor y cliente;
- `SHELL-AUTH-004`: lint, métricas y gates;
- `SHELL-AUTH-005`: migración de consumidoras;
- `AUTH-ERR-017` a `AUTH-ERR-020`: configuración, catálogo, técnica y mensajes;
- `SHELL-CI-016`, `SHELL-CI-018` y `SHELL-CI-019`: pruebas, gates y evidencia.

Toda migración de Supabase se creará, versionará y ejecutará desde
`vento-shell`.

---

#### 31. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

| ID              | Regla protegida                                                                                                 | Tipo                                  | Prioridad | Momento de implementación       | Destino                                                            |
| --------------- | --------------------------------------------------------------------------------------------------------------- | ------------------------------------- | --------- | ------------------------------- | ------------------------------------------------------------------ |
| `TREQ-AUTH-159` | Denegación concluyente del carril base produce código, `403` y cero efectos.                                    | contractual + seguridad               | crítica   | paquete de autorización         | `AUTH-DB-034`; `SHELL-AUTH-002`; `SHELL-CI-016`                    |
| `TREQ-AUTH-160` | La clasificación administrativa proviene de `authorization_requirement`, no de metadata, tabla, rol o pantalla. | contractual + catálogo                | crítica   | catálogo físico y SDK           | `AUTH-CAT-006`; `SHELL-AUTH-001`; `SHELL-CI-016`                   |
| `TREQ-AUTH-161` | Las cuatro modalidades combinan carriles sin mezclar fragmentos incompletos.                                    | autorización + integración            | crítica   | evaluador unificado             | `AUTH-MOD-018`; `AUTH-DB-034`; `SHELL-CI-016`                      |
| `TREQ-AUTH-162` | Bloqueo estructural, actor-wide deny, deny de carril, allow y default deny conservan precedencia.               | seguridad + regresión                 | crítica   | evaluador y matrices            | `AUTH-MOD-019`; `AUTH-DB-034`; `SHELL-CI-016`                      |
| `TREQ-AUTH-163` | Un contexto territorial ausente no se presenta como falta de permiso; scope mismatch exige recurso resoluble.   | contexto + seguridad                  | crítica   | AccessContext y evaluador       | `AUTH-CTX-009`; `AUTH-DB-033`; `AUTH-DB-034`                       |
| `TREQ-AUTH-164` | Diez canales responden de forma equivalente y sin efectos.                                                      | integración + E2E                     | crítica   | adapters y consumidoras         | `SHELL-AUTH-002`; `SHELL-AUTH-005`; `SHELL-CI-018`                 |
| `TREQ-AUTH-165` | Simulación, override, dispositivo, service role y nombre de cargo no conceden permisos base reales.             | seguridad + simulación + dispositivo  | crítica   | SDK y migración                 | `AUTH-SIM-006`; `AUTH-DB-033`; `SHELL-AUTH-005`                    |
| `TREQ-AUTH-166` | UI usa copy exacto, conserva sesión y no expone ruta, permiso, rol, recurso o fuente de decisión.               | interfaz + privacidad + accesibilidad | alta      | catálogo compartido de mensajes | `AUTH-ERR-020`; `SHELL-AUTH-005`; `SHELL-CI-016`                   |
| `TREQ-AUTH-167` | Cambios de permisos, denies, scopes y versiones invalidan decisiones y se revalidan antes del efecto.           | concurrencia + auditoría              | crítica   | frescura y observabilidad       | `AUTH-DB-035`; `SHELL-AUTH-004`; `SHELL-CI-019`                    |
| `TREQ-AUTH-168` | La regresión reconcilia 146 candidatos, 384 allows de rol, 8 individuales, 14 brechas y diez aplicaciones.      | regresión + RPC + RLS + estática      | crítica   | gates y evidencia E5            | `SHELL-AUTH-004`; `SHELL-AUTH-005`; `SHELL-CI-018`; `SHELL-CI-019` |

El detalle canónico de estas filas se incorpora al registro completo `04A`.

---

#### 32. Validaciones documentales definidas

El validador futuro deberá comprobar como mínimo:

1. código público único;
2. estado no navegacional `403`;
3. `DENY` y `executable=false`;
4. cinco causas internas exhaustivas;
5. separación de sesión, actividad y acceso a aplicación;
6. permiso exacto registrado y activo;
7. modalidad válida y versionada;
8. `OPERATIONAL_ONLY` excluido;
9. precedencia estructural antes del permiso;
10. actor-wide deny antes de denies de carril;
11. deny base antes de allow base;
12. default deny separado de explicit deny;
13. alcance evaluado contra recurso real;
14. contexto ausente separado de scope mismatch;
15. `BASE_ONLY` completo;
16. `BASE_OR_OPERATIONAL` sin mezcla de fragmentos;
17. `BASE_AND_OPERATIONAL` como intersección;
18. rol base separado de rol operativo;
19. cero bypass por nombre de rol;
20. cero autoridad por `navigation_role`;
21. simulación no mutante;
22. role override no autoritativo;
23. service role no empresarial;
24. diez canales completos;
25. veinte escenarios completos;
26. diez aplicaciones registradas;
27. 146 candidatos físicos reconciliados;
28. 384 allows de rol reconciliados;
29. 8 allows individuales reconciliados;
30. 14 brechas con propietario;
31. copy exacto y accesible;
32. no exposición de ruta o permiso;
33. sesión conservada;
34. cero reintento automático;
35. invalidación y revalidación;
36. auditoría minimizada;
37. diez TREQ consecutivos y resolubles.

---

#### 33. Fuera del alcance

AUTH-ERR-004 no:

- modifica el catálogo;
- agrega `authorization_requirement` a Supabase;
- decide qué roles deben recibir o perder permisos;
- cambia las 384 concesiones observadas;
- crea las 16 concesiones ausentes de NEXO;
- crea denies;
- corrige scopes;
- cambia `permission_audience`;
- cambia `is_operational`;
- cambia `requires_active_work_context`;
- implementa `AuthorizationDecision`;
- corrige funciones SQL;
- modifica RLS;
- elimina bypasses físicos;
- modifica guards;
- modifica pantallas;
- implementa mensajes compartidos;
- invalida sesiones;
- ejecuta migraciones;
- ejecuta DDL o DML;
- crea datos de prueba;
- despliega código;
- escribe en GitHub;
- inicia `AUTH-ERR-005`;
- ejecuta pruebas operativas.

---

#### 34. Criterios de aceptación

1. `AUTH_ADMIN_PERMISSION_DENIED` es el único código público de esta tarea.
2. La razón pertenece a autorización y no a autenticación.
3. La sesión permanece válida.
4. La identidad laboral ya está activa.
5. El acceso a la aplicación ya fue permitido.
6. El permiso exacto existe y está activo.
7. La modalidad canónica admite carril base.
8. `permission_audience` no define por sí solo un permiso administrativo.
9. La tabla de asignación no define la modalidad.
10. El nombre del rol no define autoridad.
11. La pantalla no define modalidad.
12. `OPERATIONAL_ONLY` nunca produce esta razón.
13. La respuesta no navegacional usa `403`.
14. La decisión es `DENY` y `executable=false`.
15. Ninguna mutación produce efectos parciales.
16. Las cinco causas internas están definidas y no se exponen.
17. Actor-wide deny prevalece sobre todos los allows compatibles.
18. Deny base aplicable prevalece sobre allows base.
19. Allow individual normal no vence deny de rol.
20. Allow de rol no vence deny individual.
21. Ausencia de allow se distingue de explicit deny.
22. Scope mismatch requiere contexto y recurso resolubles.
23. Falta de sede o área conserva razón territorial específica.
24. Un error técnico no se convierte en deny.
25. Un permiso no registrado conserva `AUTH-ERR-018`.
26. Modalidad ausente conserva `AUTH-ERR-017`.
27. `BASE_ONLY` evalúa exclusivamente base.
28. `BASE_OR_OPERATIONAL` permite si cualquier carril completo permite.
29. `BASE_OR_OPERATIONAL` no mezcla permiso y alcance de carriles diferentes.
30. `BASE_AND_OPERATIONAL` exige ambos carriles sobre el mismo recurso.
31. Una razón estructural operativa conserva precedencia.
32. El rol base no crea turno ni rol operativo.
33. El rol operativo no crea autoridad administrativa.
34. Propietario y gerente general no poseen wildcard por nombre.
35. `navigation_role` no concede permisos.
36. La allowlist del dispositivo no concede acciones administrativas.
37. La simulación no autoriza acciones reales.
38. Una cookie de override no modifica autorización real.
39. Service role no sustituye permiso empresarial.
40. Los diez canales poseen decisión explícita.
41. La UI usa el copy exacto aprobado.
42. La UI no muestra permiso, ruta, rol, recurso ni fuente de decisión.
43. La acción principal es volver a una superficie segura.
44. El Hub se ofrece como fallback sin cerrar sesión.
45. No existe reintento automático de la acción.
46. Las decisiones se invalidan ante cambios relevantes.
47. La mutación revalida antes del efecto.
48. La auditoría distingue causas sin secretos.
49. Las diez aplicaciones poseen decisión documental.
50. Las 146 filas candidatas se registran sin declararlas canónicas.
51. Las 3 filas marcadas operativas y las 15 con contexto se conservan como evidencia de transición.
52. Las 384 concesiones de rol y 8 individuales se preservan como snapshot.
53. Las 16 filas sin allow observado no reciben grants por inferencia.
54. Las catorce brechas tienen propietario y condición de salida.
55. Ninguna brecha se declara implementada.
56. Se generan `TREQ-AUTH-159` a `TREQ-AUTH-168`.
57. Las 6556 filas históricas se conservan sin modificación.
58. No se modifica código, Supabase, datos ni repositorios remotos.
59. `AUTH-ERR-005` permanece reservada.

---

#### 35. Cierre de tarea y continuidad

| Tarea          | Estado      | Relación                                                      |
| -------------- | ----------- | ------------------------------------------------------------- |
| `AUTH-ERR-003` | APROBADA    | tarea anterior                                                |
| `AUTH-ERR-004` | APROBADA    | tarea actual preparada para confirmación canónica del usuario |
| `AUTH-ERR-005` | NO INICIADA | tarea siguiente reservada                                     |

```text
AUTH-ERR-003 — APROBADA
        ↓
AUTH-ERR-004 — APROBADA
        ↓
AUTH-ERR-005 — RESERVADA
```

No se inicia ni modifica `AUTH-ERR-005` en esta tarea.


### [ ] AUTH-ERR-005 — Sin sede asignada
### [ ] AUTH-ERR-006 — Sin sede activa
### [ ] AUTH-ERR-007 — Sin área asignada
### [ ] AUTH-ERR-008 — Sin área activa
