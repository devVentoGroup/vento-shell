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

| Elemento                                                     | Cantidad |
| ------------------------------------------------------------ | -------: |
| Código público canónico                                      |        1 |
| Causas internas de identidad inactiva                        |        3 |
| Estado HTTP no navegacional                                  | 1, `403` |
| Escenarios de identidad decididos                            |       12 |
| Canales con respuesta explícita                              |       10 |
| Aplicaciones canónicas reconciliadas                         |       10 |
| Funciones PostgreSQL con referencia a `public.employees`     |       32 |
| Funciones con puerta estricta directa de actividad            |       13 |
| Funciones sin puerta estricta directa o con semántica permisiva |     14 |
| Funciones no autoritativas o pendientes de revisión semántica |        5 |
| Políticas RLS con dependencia laboral directa o indirecta     |      161 |
| Políticas con predicado estricto visible en la propia política |      13 |
| Políticas dependientes de helpers o sin predicado local visible |     148 |
| Empleados físicos observados                                 |       59 |
| Empleados físicos inactivos observados                       |       17 |
| Perfiles de cliente físicos observados                       |       83 |
| Perfiles de cliente inactivos observados                     |        1 |
| Sujetos Auth observados                                      |       76 |
| Sujetos simultáneamente empleado y cliente                   |       59 |
| Sujetos Auth bloqueados técnicamente en el instante observado |        3 |
| Requisitos de prueba derivados                               |       10 |

Las cifras físicas son evidencia de diagnóstico del snapshot inspeccionado. No
constituyen implementación ni congelan cantidades operativas futuras.

---

#### 3. Identidad canónica del bloqueo

La identidad pública única es:

```text
reason_code = AUTH_USER_INACTIVE
```

Propiedades normativas:

| Propiedad                   | Valor                                                        |
| --------------------------- | ------------------------------------------------------------ |
| Dominio                     | identidad de dominio                                         |
| Decisión                    | `DENY`                                                       |
| Principal técnico           | autenticado y válido                                         |
| Identidad requerida         | existe                                                       |
| Estado de identidad         | explícitamente `INACTIVE`                                    |
| Estado HTTP no navegacional | `403 Forbidden`                                              |
| Ejecutable                  | `false`                                                      |
| Recuperación pública        | salir, volver a superficie pública o solicitar revisión      |
| Reactivación automática     | prohibida                                                    |
| Reintento                   | solicitud nueva después de una reactivación autoritativa     |
| Exposición del motivo       | prohibida                                                    |

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

| Variante interna             | Fuente autoritativa             | Condición exacta               |
| ---------------------------- | ------------------------------- | ------------------------------ |
| `EMPLOYEE_INACTIVE`          | `public.employees`              | `is_active = false`            |
| `CUSTOMER_INACTIVE`          | `public.users`                  | `is_active = false`            |
| `ACTOR_EMPLOYEE_INACTIVE`    | `public.employees` del actor    | `is_active = false`            |

Las variantes internas sirven para resolución y auditoría protegida. El usuario
recibe el mismo código público estable, con copy ajustado únicamente al dominio
de la aplicación sin revelar información sensible.

---

#### 5. Condiciones que no pertenecen a `AUTH_USER_INACTIVE`

| Condición observada                                                       | Clasificación correcta                              | Tarea propietaria              |
| ------------------------------------------------------------------------- | --------------------------------------------------- | ------------------------------ |
| no existe sesión válida                                                   | `AUTH_NO_SESSION`                                   | `AUTH-ERR-001`                 |
| la verificación Auth falla por red o timeout                              | error técnico                                       | `AUTH-ERR-019`                 |
| faltan variables, claves o configuración                                  | configuración inconsistente                         | `AUTH-ERR-017`; `AUTH-ERR-019` |
| la identidad requerida no existe                                          | identidad incompleta o configuración inconsistente  | `AUTH-CTX-007`; `AUTH-ERR-017` |
| existen varias identidades candidatas incompatibles                       | identidad ambigua, fail closed                       | `AUTH-CTX-007`; `AUTH-ERR-017` |
| `employees.is_active` es `null`                                           | estado incompleto, no identidad activa               | `AUTH-CTX-007`; `AUTH-ERR-017` |
| `auth.users.banned_until` está vigente                                    | ciclo técnico de Auth, no inactividad empresarial    | `AUTH-ERR-001`; `AUTH-ERR-019` |
| existe empleado activo pero no acceso a la aplicación                     | sin acceso a la aplicación                           | `AUTH-ERR-003`                 |
| existe empleado activo pero falta un permiso                              | bloqueo de permiso                                   | `AUTH-ERR-004` o posterior     |
| sede, área, turno, check-in o rol están inactivos o ausentes               | bloqueo contextual específico                        | `AUTH-ERR-005` a `AUTH-ERR-014`|
| el dispositivo está inactivo                                              | dispositivo no autorizado                            | `AUTH-ERR-015`                 |
| la acción real se intenta desde simulación                                | acción no permitida en simulación                    | `AUTH-ERR-016`                 |
| un servicio técnico carece de actor o allowlist                           | identidad técnica o delegación inválida              | `AUTH-CTX-006`; `AUTH-ERR-019` |

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

| Empleado | Cliente | Aplicación laboral | Vento Pass cliente |
| -------- | ------- | ------------------ | ------------------ |
| activo   | activo  | continúa evaluación | continúa evaluación |
| inactivo | activo  | `AUTH_USER_INACTIVE` | continúa evaluación |
| activo   | inactivo| continúa evaluación | `AUTH_USER_INACTIVE` |
| inactivo | inactivo| `AUTH_USER_INACTIVE` | `AUTH_USER_INACTIVE` |

Queda prohibido:

- usar `public.users.is_active` para autorizar Vento OS laboral;
- usar `employees.is_active` para bloquear automáticamente Vento Pass cliente;
- reactivar una identidad porque la otra está activa;
- copiar estado entre tablas;
- asumir que una única bandera representa todos los dominios.

---

#### 11. Mensaje humano canónico

Copy aprobado en español para una superficie laboral:

| Elemento          | Texto exacto                                                                                                           |
| ----------------- | ---------------------------------------------------------------------------------------------------------------------- |
| Título            | `Tu acceso está inactivo`                                                                                              |
| Mensaje           | `Tu identidad para esta aplicación está inactiva. No puedes continuar mientras permanezca en este estado.`             |
| Acción principal  | `Cerrar sesión`                                                                                                        |
| Acción secundaria | `Volver a Vento OS`                                                                                                    |
| Ayuda             | `Si consideras que es un error, solicita una revisión a un administrador autorizado.`                                  |
| Código de soporte | `AUTH_USER_INACTIVE`                                                                                                   |

Copy aprobado para Vento Pass cliente:

| Elemento          | Texto exacto                                                                                                           |
| ----------------- | ---------------------------------------------------------------------------------------------------------------------- |
| Título            | `Tu acceso está inactivo`                                                                                              |
| Mensaje           | `Tu perfil de cliente está inactivo. No puedes continuar mientras permanezca en este estado.`                          |
| Acción principal  | `Cerrar sesión`                                                                                                        |
| Ayuda             | `Si consideras que es un error, solicita una revisión por el canal oficial de atención.`                               |
| Código de soporte | `AUTH_USER_INACTIVE`                                                                                                   |

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

| ID | Principal | Identidad requerida | Estado | Resultado público | Decisión | Efecto adicional |
| -- | --------- | ------------------- | ------ | ----------------- | -------- | ---------------- |
| `IU-01` | anónimo | cualquiera | no resoluble | `AUTH_NO_SESSION` | `DENY` | pertenece a `AUTH-ERR-001` |
| `IU-02` | humano autenticado | empleado | inexistente | identidad incompleta | `DENY` | `AUTH-CTX-007` y `AUTH-ERR-017` |
| `IU-03` | humano autenticado | empleado | `is_active = null` | identidad incompleta | `DENY` | nunca se trata como activo |
| `IU-04` | humano autenticado | empleado | activo | continuar | pendiente | evaluar acceso a aplicación |
| `IU-05` | humano autenticado | empleado | inactivo | `AUTH_USER_INACTIVE` | `DENY` | no evaluar permisos ni contexto |
| `IU-06` | humano autenticado | cliente | activo | continuar | pendiente | evaluar dominio Pass |
| `IU-07` | humano autenticado | cliente | inactivo | `AUTH_USER_INACTIVE` | `DENY` | no ejecutar acciones de cliente |
| `IU-08` | humano autenticado | empleado inactivo + cliente activo | según aplicación | laboral deniega; Pass continúa | separada | no copiar estado entre dominios |
| `IU-09` | humano autenticado | empleado activo + cliente inactivo | según aplicación | laboral continúa; Pass deniega | separada | no copiar estado entre dominios |
| `IU-10` | dispositivo técnico | actor empleado | activo | continuar | pendiente | evaluar sesión, turno y permiso |
| `IU-11` | dispositivo técnico | actor empleado | inactivo | `AUTH_USER_INACTIVE` | `DENY` | actor deja de ser utilizable |
| `IU-12` | servicio técnico | identidad laboral | no aplica | contrato técnico | pendiente | no usar esta razón por inferencia |

Cobertura:

```text
escenarios esperados = 12
escenarios materializados = 12
faltantes = 0
duplicados = 0
```

---

#### 13. `INACTIVE-USER-CHANNEL-RESPONSE-MATRIX-001`

| Canal o superficie | Respuesta obligatoria | Estado | Efectos prohibidos |
| ------------------ | --------------------- | -----: | ------------------ |
| navegación web protegida | renderizar superficie de bloqueo autenticada y accesible | `403` semántico | redirect al login, contenido protegido o navegación autorizada |
| formulario o mutación web | detener antes de la escritura y devolver razón tipada | `403` | reintento automático, escritura parcial o mensaje genérico |
| fetch de cliente | envelope JSON canónico | `403` | HTML de login, datos parciales o fallback permisivo |
| Route Handler o API | envelope JSON canónico con correlación | `403` | ejecutar handler de negocio o revelar recurso |
| Server Action | error tipado serializable y cero efectos | `403` lógico | lanzar texto bruto, repetir acción o usar caché anterior |
| RPC o PostgREST | fail closed y mapping estable a `AUTH_USER_INACTIVE` | `403` en adapter | excepción libre, booleano ambiguo o `ALLOW` residual |
| RLS | impedir lectura o escritura empresarial | no expone detalle | confiar solo en UI o conceder por helper permisivo |
| Edge Function | verificar actividad antes de operación empresarial | `403` | service role como bypass o notificación posterior a efecto |
| Realtime, stream o suscripción | negar o cerrar entrega de datos nuevos y limpiar proyección | evento tipado | conservar flujo, datos de otra sede o caché sensible |
| cliente nativo o dispositivo compartido | estado tipado; actor inactivo vuelve a selección segura | `403` lógico | cerrar dispositivo completo por inferencia o aceptar actor residual |

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

| Evento | Cuándo se registra | Datos mínimos |
| ------ | ------------------ | ------------- |
| `auth.domain_identity_inactive_detected` | una solicitud encuentra identidad inactiva | correlación, app, canal, clase de identidad, snapshot |
| `auth.domain_identity_inactive_denied` | se emite la denegación | razón pública, decisión, ejecutable, versión |
| `auth.inactive_actor_session_invalidated` | un actor de dispositivo deja de ser utilizable | dispositivo referenciado, actor protegido, instante |
| `auth.domain_identity_reactivated_observed` | una solicitud nueva observa actividad restaurada | correlación, app, versión, sin heredar autorización |

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

| Aplicación | Identidad requerida | Estado que produce el bloqueo | Decisión | Particularidad |
| ---------- | ------------------- | ----------------------------- | -------- | ------------- |
| `shell` | empleado | `employees.is_active = false` | `DENY` | muestra superficie central autenticada; no loop de login |
| `anima` | empleado | `employees.is_active = false` | `DENY` | no permite asistencia, documentos ni gestión personal laboral |
| `viso` | empleado | `employees.is_active = false` | `DENY` | roles administrativos residuales no crean bypass |
| `nexo` | empleado o actor empleado | empleado o actor inactivo | `DENY` | dispositivo técnico puede conservar solo funciones técnicas expresas |
| `fogo` | empleado o actor empleado | empleado o actor inactivo | `DENY` | no inicia ni modifica ejecución productiva |
| `origo` | empleado o actor empleado | empleado o actor inactivo | `DENY` | no compra, aprueba ni recibe mediante identidad residual |
| `pulso` | empleado o actor empleado | empleado o actor inactivo | `DENY` | no vende, cobra, redime ni opera caja |
| `numera` | empleado | `employees.is_active = false` | `DENY` | no expone ni modifica información financiera |
| `aura` | empleado | `employees.is_active = false` | `DENY` | contrato obligatorio antes de activar la aplicación diferida |
| `pass` | cliente | `public.users.is_active = false` | `DENY` | actividad laboral no determina la identidad de cliente |

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

| Métrica | Resultado |
| ------- | --------: |
| empleados | 59 |
| empleados activos | 42 |
| empleados inactivos | 17 |
| empleados con `is_active = null` | 0 |
| perfiles de cliente | 83 |
| clientes activos | 82 |
| clientes inactivos | 1 |
| sujetos Auth | 76 |
| sujetos Auth confirmados | 68 |
| sujetos Auth bloqueados técnicamente | 3 |
| sujetos Auth eliminados | 0 |
| sujetos vinculados a empleado | 59 |
| sujetos vinculados a cliente | 76 |
| sujetos vinculados simultáneamente a empleado y cliente | 59 |
| empleados sin sujeto Auth | 0 |
| clientes sin sujeto Auth | 7 |

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

| # | Función | Tratamiento directo de actividad | Decisión documental | Destino |
| -: | ------- | ------------------------------- | ------------------- | ------- |
| 1 | `anima_diagnostic_push_token_coverage()` | `e.is_active = true` | puerta estricta visible | regresión en `SHELL-CI-016` |
| 2 | `anima_is_active_employee()` | `e.is_active = true` | puerta estricta visible | SDK en `SHELL-AUTH-001` |
| 3 | `anima_is_active_owner()` | `e.is_active = true` | puerta estricta visible | SDK en `SHELL-AUTH-001` |
| 4 | `can_access_area(uuid)` | no verifica directamente actividad del empleado | requiere cierre transitivo | `AUTH-DB-033`; `SHELL-AUTH-005` |
| 5 | `can_access_site(uuid)` | acepta `is_active is null` | incompatible con fail closed | `AUTH-DB-033`; `SHELL-AUTH-005` |
| 6 | `can_manage_context_simulation_v1(uuid)` | sin puerta directa visible | no puede aceptar simulador inactivo | `AUTH-DB-033`; `SHELL-AUTH-005` |
| 7 | `close_open_attendance_day_end(text)` | `coalesce(e.is_active,false)=true` | filtro estricto visible; revisar efecto histórico | `AUTH-ERR-019`; `SHELL-CI-016` |
| 8 | `close_stale_open_attendance_shifts(timestamptz,text)` | sin puerta directa visible | mantenimiento, no autoridad de usuario; requiere clasificación | `AUTH-ERR-019` |
| 9 | `current_actor_shift_for_shared_device_v1(...)` | `e.is_active is true` | puerta estricta visible | `AUTH-DB-033` |
| 10 | `current_employee_primary_site_id()` | sin puerta directa visible | no debe devolver contexto autorizante para inactivo | `AUTH-DB-033` |
| 11 | `current_employee_role()` | sin puerta directa visible | no debe devolver rol autorizante para inactivo | `AUTH-DB-033` |
| 12 | `current_employee_selected_area_id()` | sin puerta directa visible | no debe devolver territorio autorizante para inactivo | `AUTH-DB-033` |
| 13 | `employee_wallet_eligibility(uuid)` | actividad incorporada a elegibilidad | puerta fail closed visible | regresión en `SHELL-CI-016` |
| 14 | `enforce_attendance_geofence()` | solo rechaza `is_active is false` | `null` no queda cerrado | `AUTH-DB-033`; `SHELL-AUTH-005` |
| 15 | `enforce_employee_inventory_location_assignment_site()` | sin puerta directa de empleado | trigger de configuración; no concede autoridad por sí solo | `AUTH-ERR-019` |
| 16 | `get_effective_context_v1(text)` | sin puerta directa visible | brecha crítica de contexto efectivo | `AUTH-DB-033`; `SHELL-AUTH-005` |
| 17 | `get_operational_context(uuid,uuid,text)` | sin puerta directa de empleado | puede construir contexto sin actividad laboral | `AUTH-DB-033`; `SHELL-AUTH-005` |
| 18 | `has_permission(text,uuid,uuid)` | `e.is_active = true` | puerta estricta visible | preservar en `AUTH-DB-034` |
| 19 | `is_employee()` | `coalesce(e.is_active,true)=true` | `null` tratado como activo; incompatible | `AUTH-DB-033`; `SHELL-AUTH-005` |
| 20 | `mark_restock_request_in_transit(uuid)` | `e.is_active = true` | puerta estricta visible | preservar en `AUTH-SRV-015` |
| 21 | `nexo_kiosk_withdraw_workers(uuid)` | `coalesce(e.is_active,true)=true` | puede listar trabajador con estado nulo | `AUTH-DB-033`; `SHELL-AUTH-005` |
| 22 | `reconcile_staff_invitations()` | `is_active is distinct from false` | estado nulo tratado como aceptable | `AUTH-DB-033`; `SHELL-AUTH-005` |
| 23 | `register_shift_departure_event(...)` | `coalesce(is_active,false)` | puerta estricta visible | preservar en `SHELL-CI-016` |
| 24 | `register_shift_departure_event_autoclose(...)` | `coalesce(is_active,false)` | puerta estricta visible | preservar en `SHELL-CI-016` |
| 25 | `set_employee_kiosk_pin(uuid,text)` | sin puerta directa visible | no debe habilitar credencial de actor inactivo | `AUTH-DB-033`; `SHELL-AUTH-005` |
| 26 | `shared_device_actor_is_allowed_v1(...)` | actor exige booleano verdadero | puerta estricta visible | preservar en `AUTH-DB-033` |
| 27 | `sign_shared_device_action(...)` | `e.is_active is true` | puerta estricta visible | preservar en `AUTH-SRV-015` |
| 28 | `start_attendance_break(uuid,text,text)` | `coalesce(is_active,false)` | puerta estricta visible | preservar en `SHELL-CI-016` |
| 29 | `support_ticket_is_visible_to_current_employee(uuid)` | sin puerta directa del empleado actual | requiere cierre transitivo | `AUTH-DB-033`; `SHELL-AUTH-005` |
| 30 | `sync_employee_primary_site_assignment()` | no es guard de usuario | sincronización; no puede reactivar autoridad | `AUTH-ERR-019` |
| 31 | `verify_employee_kiosk_pin(uuid,text)` | `is_active is true` | puerta estricta visible | preservar en `AUTH-DB-033` |
| 32 | `viso_enforce_monthly_schedule_publish_limit()` | sin puerta directa visible | trigger o guard debe conservar actor activo cuando aplique | `AUTH-DB-033`; `SHELL-AUTH-005` |

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

| Consumidor | Hallazgo | Decisión | Destino |
| ---------- | -------- | -------- | ------- |
| middleware de seis aplicaciones laborales | valida sesión Auth, pero no actividad de identidad empresarial | no es suficiente para permitir render o acción | `SHELL-AUTH-002`; `SHELL-AUTH-005` |
| NEXO `src/lib/auth/operational-context.ts` | consume `get_operational_context.can_operate` y no posee razón `employee_inactive` | debe consumir razón canónica, sin override que reactive | `SHELL-AUTH-005` |
| ORIGO `src/lib/auth/operational-session.ts` | consulta empleado sin `is_active` y construye sesión laboral incluso sin fila activa confirmada | debe fallar cerrado antes de rol, sede y permiso | `SHELL-AUTH-005` |
| helpers SQL de contexto | tratamiento heterogéneo de `false`, `null` y ausencia | unificar productor canónico | `AUTH-DB-033`; `AUTH-DB-034` |
| RLS dependiente de helpers | seguridad transitiva no verificable por predicado local | certificar cadena y retirar helpers incompatibles | `AUTH-DB-033`; `SHELL-AUTH-004` |

---

#### 22. Registro de brechas físicas

| ID | Brecha | Estado | Riesgo | Propietario | Condición de salida |
| -- | ------ | ------ | ------ | ----------- | ------------------- |
| `IU-GAP-001` | middleware considera suficiente un usuario Auth válido | `IDENTIFICADO` | render y consultas antes de resolver actividad | `SHELL-AUTH-002`; `SHELL-AUTH-005` | adapter compartido bloquea antes de datos |
| `IU-GAP-002` | `get_effective_context_v1` no muestra puerta directa de empleado activo | `IDENTIFICADO` | contexto efectivo de identidad inactiva | `AUTH-DB-033` | productor canónico fail closed y pruebas |
| `IU-GAP-003` | `get_operational_context` no verifica directamente empleado activo | `IDENTIFICADO` | `can_operate` potencialmente inconsistente | `AUTH-DB-033`; `SHELL-AUTH-005` | razón canónica y cero autoridad residual |
| `IU-GAP-004` | helpers de rol, sede y área no verifican actividad directamente | `IDENTIFICADO` | contexto residual | `AUTH-DB-033` | helpers privados consumen identidad activa |
| `IU-GAP-005` | `can_access_site`, `is_employee` y otros aceptan estado nulo | `IDENTIFICADO` | fail open ante dato incompleto | `AUTH-DB-033`; `SHELL-AUTH-004` | nulo produce identidad incompleta y `DENY` |
| `IU-GAP-006` | NEXO no presenta razón específica de empleado inactivo | `IDENTIFICADO` | mensaje incorrecto y override de contexto | `SHELL-AUTH-005`; `AUTH-ERR-020` | reason code compartido y copy aprobado |
| `IU-GAP-007` | ORIGO construye sesión de empleado sin seleccionar `is_active` | `IDENTIFICADO` | rol y sede residuales | `SHELL-AUTH-005` | resolución tipada exige actividad verdadera |
| `IU-GAP-008` | 148 políticas dependen de cadena transitiva sin predicado local visible | `PENDIENTE_DE_EVIDENCIA` | adopción parcial o helper permisivo | `AUTH-DB-033`; `SHELL-CI-018` | matriz de dependencia y pruebas de identidad inactiva |
| `IU-GAP-009` | no existe invalidación central observada al desactivar empleado | `IDENTIFICADO` | caché, contexto o actor session obsoletos | `AUTH-DB-035`; `SHELL-AUTH-001` | fingerprint e invalidación certificada |
| `IU-GAP-010` | estado laboral y de cliente comparten sujetos sin contrato físico unificado | `IDENTIFICADO` | bloqueo cruzado de dominio | `AUTH-DB-019`; `SHELL-AUTH-001` | vínculo tipado conserva estados independientes |

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

| ID              | Regla protegida                                                                                                           | Tipo                            | Prioridad | Momento de implementación             | Destino |
| --------------- | ------------------------------------------------------------------------------------------------------------------------- | ------------------------------- | --------- | ------------------------------------- | ------- |
| `TREQ-AUTH-139` | sesión válida más identidad requerida explícitamente inactiva produce `AUTH_USER_INACTIVE`, `DENY`, `403` y cero efectos | contractual + seguridad         | crítica   | productor y adapter canónicos         | `AUTH-DB-033`; `SHELL-AUTH-002` |
| `TREQ-AUTH-140` | inactividad precede aplicación, roles, permisos, sedes, turnos, check-ins, dispositivos y simulación                    | autorización + regresión        | crítica   | evaluador y migración de consumidores | `AUTH-DB-034`; `SHELL-AUTH-005` |
| `TREQ-AUTH-141` | actividad laboral y de cliente se resuelven por separado para sujetos con ambas identidades                              | contractual + integración       | crítica   | vínculos de identidad y SDK           | `AUTH-DB-019`; `SHELL-AUTH-001` |
| `TREQ-AUTH-142` | actor empleado inactivo invalida autoridad empresarial sin convertir el dispositivo técnico en empleado                 | seguridad + dispositivo + E2E   | crítica   | contexto compartido y consumidores    | `AUTH-DB-033`; `SHELL-AUTH-005` |
| `TREQ-AUTH-143` | los diez canales aplican bloqueo autenticado o `403` tipado, sin redirect al login, retry ni mutación                    | integración + E2E + regresión   | crítica   | adapters y consumidoras               | `SHELL-AUTH-002`; `SHELL-AUTH-005`; `SHELL-CI-016` |
| `TREQ-AUTH-144` | estado ausente, nulo o ambiguo falla cerrado como identidad incompleta y nunca como activo o inactivo confirmado         | contractual + datos + regresión | crítica   | productor canónico                    | `AUTH-DB-033`; `AUTH-ERR-017`; `SHELL-CI-016` |
| `TREQ-AUTH-145` | desactivación invalida contexto, caché, decisiones, actor session y entrega de datos antes de un efecto nuevo            | concurrencia + seguridad + E2E  | crítica   | frescura e invalidación                | `AUTH-DB-035`; `SHELL-AUTH-001`; `SHELL-CI-018` |
| `TREQ-AUTH-146` | copy, accesibilidad y recuperación no revelan motivo interno ni prometen reactivación                                    | interfaz + experiencia          | alta      | mensajes compartidos                  | `AUTH-ERR-020`; `SHELL-CI-016` |
| `TREQ-AUTH-147` | auditoría distingue identidad inactiva de Auth bloqueado, no destruye sesión por inferencia y no reutiliza autorización | auditoría + seguridad           | alta      | SDK y evidencia                       | `SHELL-AUTH-001`; `SHELL-CI-019` |
| `TREQ-AUTH-148` | regresión reconcilia 32 funciones, cadena RLS y consumidores, cerrando las diez brechas físicas sin bloquear dominios sanos | regresión + RPC + RLS + estática | crítica | migración y gates de consumidoras     | `AUTH-DB-033`; `SHELL-AUTH-004`; `SHELL-AUTH-005`; `SHELL-CI-018` |

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

### [ ] AUTH-ERR-003 — Sin acceso a la aplicación
### [ ] AUTH-ERR-004 — Sin permiso administrativo
### [ ] AUTH-ERR-005 — Sin sede asignada
### [ ] AUTH-ERR-006 — Sin sede activa
### [ ] AUTH-ERR-007 — Sin área asignada
### [ ] AUTH-ERR-008 — Sin área activa
