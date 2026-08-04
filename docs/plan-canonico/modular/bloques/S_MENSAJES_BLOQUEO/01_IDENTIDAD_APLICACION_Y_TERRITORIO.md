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


### [ ] AUTH-ERR-002 — Usuario inactivo
### [ ] AUTH-ERR-003 — Sin acceso a la aplicación
### [ ] AUTH-ERR-004 — Sin permiso administrativo
### [ ] AUTH-ERR-005 — Sin sede asignada
### [ ] AUTH-ERR-006 — Sin sede activa
### [ ] AUTH-ERR-007 — Sin área asignada
### [ ] AUTH-ERR-008 — Sin área activa
