### MINI-BLOQUE — IDENTIDAD SUPERFICIE PERIFERICOS Y CONTINGENCIA

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **identidad superficie perifericos y contingencia** dentro de **E2 PROCESOS Y EXPERIENCIA**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `UX-STATION-004` a `UX-STATION-007` — 4 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `UX-STATION-004`: Diseñar identificación, cambio y cierre de actor en estaciones compartidas
- `UX-STATION-005`: Diseñar la superficie operativa contextual por estación, zona y proceso
- `UX-STATION-006`: Definir periféricos, montaje, alimentación, conectividad y mantenimiento
- `UX-STATION-007`: Definir operación degradada, offline, contingencia y recuperación
<!-- PLAN-SECTION-META:END -->

### ✅ UX-STATION-004 — Diseñar identificación, cambio y cierre de actor en estaciones compartidas

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Marcador exacto que reemplaza:** `### [ ] UX-STATION-004 — Diseñar identificación, cambio y cierre de actor en estaciones compartidas`  
**Tarea anterior:** `UX-STATION-003 — Definir perfiles canónicos de estación compartida` — APROBADA  
**Siguiente tarea reservada:** `UX-STATION-005 — Diseñar la superficie operativa contextual por estación, zona y proceso` — NO INICIADA  
**Artefactos aprobados:** `UX-STATION-ACTOR-IDENTIFICATION-CONTRACT-001`; `UX-STATION-ACTOR-STATE-MACHINE-001`; `UX-STATION-ACTOR-TRANSITION-MATRIX-001`; `UX-STATION-ACTOR-HANDOFF-CONTRACT-001`; `UX-STATION-ACTOR-SESSION-CLEANUP-CONTRACT-001`; `UX-STATION-ACTOR-METHOD-CATALOG-001`; `UX-STATION-ACTOR-EXCEPTION-REGISTER-001`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`, por paso, perfil de estación, clase de uso compartido, actor, contexto y nivel de riesgo  
**Naturaleza:** contrato funcional de identificación y atribución del actor efectivo en estaciones compartidas; no implementación de autenticación, autorización, UI definitiva, hardware, credenciales, biometría, migraciones ni cambios en Supabase  
**Cambios en código, componentes, aplicaciones, migraciones, Supabase, cuentas, credenciales, dispositivos, hardware, red, periféricos o despliegues:** no autorizados

---

#### 1. Propósito

Definir cómo una estación compartida identifica al trabajador que actúa, cómo cambia de actor sin mezclar sesiones o trabajo y cómo cierra, bloquea o transfiere el contexto de forma segura.

```text
ESTACIÓN COMPARTIDA
+ DISPOSITIVO IDENTIFICADO
+ ACTOR EFECTIVO INDIVIDUAL
+ CONTEXTO LABORAL Y OPERATIVO VIGENTE
+ AUTORIZACIÓN REVALIDADA
+ TRAZABILIDAD
= ACCIÓN ATRIBUIBLE

ESTACIÓN COMPARTIDA
≠ CUENTA COMPARTIDA
≠ ACTOR PERMANENTE
≠ ROL GENÉRICO
≠ ÚLTIMO USUARIO
≠ PIN DEL ÁREA
```

La estación podrá conservar una identidad técnica propia, pero ninguna identidad técnica, perfil de estación o ubicación física sustituirá la identidad del trabajador que ejecuta una acción empresarial.

---

#### 2. Continuidad lógica

`UX-STATION-003` separó perfil, instancia, dispositivo, endpoint, sesión, actor y periférico. Esta tarea define el ciclo del actor efectivo sobre esos perfiles.

```text
PERFIL E INSTANCIA DE ESTACIÓN
        ↓
IDENTIFICAR ACTOR
        ↓
RESOLVER CONTEXTO VIGENTE
        ↓
HABILITAR SUPERFICIE Y ACCIONES PERMITIDAS
        ↓
REVALIDAR CADA COMANDO
        ↓
CAMBIAR, TRANSFERIR, BLOQUEAR O CERRAR
        ↓
LIMPIAR Y CONSERVAR EVIDENCIA
```

`UX-STATION-005` diseñará la superficie contextual que refleje estos estados. `AUTH-DEV-001` a `AUTH-DEV-016` implementarán posteriormente la identidad técnica, límites, sesiones, revocación, auditoría y pruebas de dispositivos compartidos.

---

#### 3. Principios obligatorios

1. Toda mutación empresarial tendrá un actor efectivo individual o una identidad técnica explícita y separada.
2. Una cuenta genérica de área, sede, rol, caja, cocina, bodega o servicio no podrá representar al trabajador.
3. La estación, el dispositivo, la aplicación, el rol visible y el último usuario no determinarán el actor.
4. Identificar a una persona no concede por sí solo permiso para la acción.
5. Cada comando sensible se autorizará en servidor con contexto vigente.
6. El cambio de actor será explícito, visible y auditable.
7. Ningún cambio de actor heredará silenciosamente borradores, filtros, archivos, cámara, portapapeles, permisos elevados o datos sensibles.
8. El trabajo confirmado conservará el actor original aunque otro trabajador continúe el proceso.
9. Un traspaso deberá producir evidencia de origen, destino, recurso, momento y aceptación.
10. Una sesión vencida, estación revocada o contexto inválido fallará de forma segura.
11. La identificación rápida reducirá fricción, pero nunca sustituirá la vinculación inequívoca con una identidad laboral vigente.
12. No se almacenarán PIN, contraseñas, datos biométricos crudos, tokens o secretos en artefactos de UX.
13. La señal del actor efectivo será perceptible sin depender únicamente de color, sonido o memoria.
14. La recuperación de acceso no podrá convertirse en bypass de autorización.
15. Las modalidades se validarán con trabajadores reales antes de aprobarse en `UX-STATION-009`.

---

#### 4. Separación conceptual obligatoria

| Concepto                       | Significado                                         |              Puede autorizar una acción |
| ------------------------------ | --------------------------------------------------- | --------------------------------------: |
| identidad de estación          | instancia física y perfil aplicable                 |                                      No |
| identidad de dispositivo       | endpoint administrado y revocable                   |                                      No |
| sesión técnica del dispositivo | canal autenticado del equipo con servicios          |                                      No |
| identidad laboral              | persona o sujeto laboral resuelto                   |                          No por sí sola |
| sesión de actor                | vínculo temporal entre identidad laboral y estación |                          No por sí sola |
| contexto laboral               | vigencia, asignaciones y cobertura administrativa   |                          No por sí solo |
| contexto operativo             | turno, check-in, rol operativo, sede y área activas |                          No por sí solo |
| actor efectivo                 | trabajador atribuido a la acción actual             |                Participa en la decisión |
| permiso efectivo               | resultado de autorización para acción y recurso     |                    Sí, solo con `ALLOW` |
| aprobador o segundo actor      | persona distinta que confirma una acción protegida  |       Solo dentro de la regla aplicable |
| identidad técnica              | servicio o integración sin actor humano             | Solo para comandos técnicos autorizados |

---

#### 5. Unidad contractual de la sesión de actor

Cada sesión de actor deberá conservar como mínimo:

```text
station_actor_session_id
station_instance_id
station_profile_id
station_profile_version
endpoint_id
application_id
identity_subject_id
employee_id
session_state
identification_method_class
assurance_level
identified_at
last_activity_at
expires_at
step_up_valid_until
shift_id
check_in_id
effective_operational_role
active_site_id
active_area_id
allowed_process_scopes[]
context_version
previous_station_actor_session_id
transfer_receipt_id
close_reason
closed_at
correlation_id
```

No se incluirán secretos ni material reutilizable de autenticación.

---

#### 6. Estados canónicos

| Estado              | Significado                                                                          |
| ------------------- | ------------------------------------------------------------------------------------ |
| `NO_ACTOR`          | la estación no tiene trabajador activo; solo muestra superficie pública o minimizada |
| `IDENTIFYING`       | se está comprobando la identidad mediante un método aprobado                         |
| `CONTEXT_RESOLVING` | se resuelven vigencia laboral, turno, check-in, sede, área, rol y límites            |
| `ACTIVE`            | existe actor efectivo válido para acciones ordinarias dentro de su alcance           |
| `STEP_UP_REQUIRED`  | la acción requiere una comprobación adicional o segundo control                      |
| `TRANSFER_PENDING`  | existe un traspaso iniciado que todavía no ha sido aceptado                          |
| `LOCKED`            | la superficie está bloqueada y no admite mutaciones                                  |
| `EXPIRED`           | la vigencia temporal o contextual terminó                                            |
| `CLOSING`           | se procesan pendientes, limpieza y evidencia de cierre                               |
| `CLOSED`            | no existe actor efectivo reutilizable                                                |
| `RECOVERY_REQUIRED` | la sesión quedó en estado incierto y exige recuperación controlada                   |

No se permitirá una transición directa de `NO_ACTOR` a `ACTIVE` sin identificación y resolución de contexto.

---

#### 7. Catálogo de clases de identificación

| Clase                        | Uso permitido                                                                          |
| ---------------------------- | -------------------------------------------------------------------------------------- |
| `FULL_SIGN_IN`               | establecimiento inicial de identidad con el mecanismo corporativo aprobado             |
| `QUICK_REENTRY`              | reentrada breve de una identidad previamente vinculada y aún elegible                  |
| `PERSONAL_TOKEN_SCAN`        | lectura de credencial o token personal no compartido con comprobaciones de vigencia    |
| `PERSONAL_QR_ASSERTION`      | afirmación personal de corta duración y protegida contra copia o reutilización         |
| `DEVICE_BIOMETRIC_ASSERTION` | afirmación del sistema operativo vinculada a una identidad y con alternativa accesible |
| `SUPERVISED_RECOVERY`        | recuperación excepcional con actor supervisor, motivo y evidencia                      |
| `SECOND_ACTOR_APPROVAL`      | identificación de aprobador distinto para una acción que exige doble control           |

La tarea no selecciona tecnología concreta ni declara que todas las clases sean aplicables a todos los perfiles.

---

#### 8. Métodos prohibidos como identificación individual

No serán válidos por sí solos:

- cuenta compartida del área o del rol;
- PIN común de caja, cocina, barra, bodega o sede;
- badge o QR compartido;
- iniciales escritas manualmente;
- nombre escogido de una lista sin comprobación;
- proximidad del teléfono sin confirmación;
- último trabajador que usó el equipo;
- turno programado sin presencia comprobada;
- check-in de otra persona;
- estación asignada a un rol;
- ubicación física;
- reconocimiento informal por parte de compañeros;
- credencial de supervisor utilizada para representar al trabajador;
- valor recibido desde el cliente sin validación autoritativa.

---

#### 9. Flujo de identificación ordinaria

1. La estación comienza en `NO_ACTOR`, `LOCKED` o `CLOSED`.
2. Presenta únicamente información permitida sin actor.
3. El trabajador inicia un método de identificación permitido por el perfil.
4. El servidor resuelve identidad laboral y vigencia.
5. Se comprueban dispositivo, estación, aplicación y perfil.
6. Se resuelven turno, check-in, rol operativo, sede, área y demás contexto aplicable.
7. Se calcula la intersección entre límites del dispositivo y permisos del trabajador.
8. Se comprueba que el método alcanza el nivel de aseguramiento requerido.
9. La interfaz muestra de forma inequívoca quién quedó activo y en qué contexto.
10. La sesión pasa a `ACTIVE` o a un estado de bloqueo explicado.
11. Cada comando posterior vuelve a comprobar autorización, recurso, contexto y frescura.

Una identificación exitosa no deberá ocultar una denegación de autorización.

---

#### 10. Resolución de contexto

La sesión del actor no confiará en valores de cliente como fuente autoritativa para:

- `employee_id`;
- rol base;
- rol operativo;
- turno;
- check-in;
- sede activa;
- área activa;
- cobertura;
- permisos;
- requisitos de autorización;
- recurso;
- territorio;
- aprobación requerida.

Una sede o área mostrada en la pantalla podrá orientar navegación, pero no ampliar autoridad. La estación tampoco podrá imponer el contexto solo por estar físicamente ubicada en una zona.

---

#### 11. Intersección trabajador-dispositivo

La capacidad efectiva se resolverá mediante:

```text
PERMISOS DEL TRABAJADOR
∩
LÍMITES DEL DISPOSITIVO
∩
APLICACIONES PERMITIDAS
∩
PERFIL DE ESTACIÓN
∩
CONTEXTO VIGENTE
∩
REQUISITOS DE LA ACCIÓN
```

El dispositivo no heredará permisos administrativos de un trabajador y el trabajador no superará el máximo permitido para el dispositivo.

---

#### 12. Indicador visible del actor efectivo

Mientras exista actor activo, la superficie deberá mostrar de forma persistente y accesible:

- nombre preferido o identificador humano suficiente;
- rol operativo efectivo cuando aplique;
- sede y área operativas;
- estado de sesión;
- señal de elevación o aprobación temporal;
- acción clara para bloquear, cambiar o cerrar;
- advertencia cuando el contexto esté vencido o incompleto.

Se minimizarán datos personales. El indicador no dependerá exclusivamente de color ni quedará oculto durante acciones sensibles.

---

#### 13. Cambio secuencial de actor

El cambio ordinario seguirá:

```text
ACTOR A ACTIVE
→ SOLICITUD EXPLÍCITA DE CAMBIO
→ BLOQUEO DE NUEVAS MUTACIONES
→ RESOLUCIÓN DE BORRADORES Y PENDIENTES
→ CIERRE Y LIMPIEZA DE ACTOR A
→ IDENTIFICACIÓN DE ACTOR B
→ RESOLUCIÓN DE CONTEXTO DE B
→ SUPERFICIE RECOMPUESTA
→ ACTOR B ACTIVE
```

No se permitirá que dos actores permanezcan simultáneamente activos para mutaciones en una estación `SHARED-SEQUENTIAL`.

---

#### 14. Tratamiento de trabajo durante el cambio

| Estado del trabajo            | Tratamiento                                                                           |
| ----------------------------- | ------------------------------------------------------------------------------------- |
| dato no confirmado            | descartar, conservar como borrador neutral o transferir explícitamente según política |
| comando enviado y pendiente   | conservar actor, contexto, idempotency key y receipt originales                       |
| resultado confirmado          | mantener autoría original y permitir continuación por otro actor                      |
| conflicto                     | enviar a bandeja o recuperación; no atribuir al nuevo actor                           |
| archivo o captura temporal    | limpiar o transferir con confirmación y finalidad válida                              |
| aprobación temporal           | revocar salvo que el contrato permita continuidad explícita                           |
| selección, filtros y búsqueda | limpiar salvo contexto de estación declarado como no personal                         |

El actor nuevo no heredará una acción lista para confirmar como si la hubiera preparado.

---

#### 15. Traspaso entre actores

El traspaso se distinguirá del cambio simple. Deberá conservar:

```text
transfer_receipt_id
source_actor_id
target_actor_id
process_id
step_id
work_item_id
resource_version
source_station_id
target_station_id
initiated_at
accepted_at
handoff_reason
state_at_transfer
pending_effects[]
evidence_reference
```

Reglas:

1. El actor de origen inicia y delimita el traspaso.
2. El destino se identifica de forma independiente.
3. El destino acepta el recurso y el estado recibido.
4. Los efectos confirmados conservan su autor original.
5. Los pendientes no se duplican ni se reenvían automáticamente.
6. La responsabilidad no cambia hasta la aceptación o la regla explícita de abandono.
7. Un traspaso rechazado, vencido o incierto permanece visible y recuperable.

---

#### 16. Cierre, bloqueo y expiración

La sesión deberá cerrarse o bloquearse por:

- acción manual;
- cambio de trabajador;
- finalización o pérdida de check-in;
- fin o invalidez de turno cuando aplique;
- vencimiento de sesión;
- inactividad según riesgo y perfil;
- bloqueo del sistema operativo;
- reinicio, suspensión o pérdida de estado no confiable;
- cierre de aplicación en una estación de riesgo;
- revocación del dispositivo;
- desasignación de la estación;
- pérdida de vigencia laboral;
- cambio material de permisos;
- detección de concurrencia incompatible;
- incidente de seguridad;
- retiro del dispositivo.

Los tiempos concretos se definirán por perfil y riesgo; no se impone un valor universal.

---

#### 17. Limpieza al cerrar

El cierre deberá considerar:

- formularios;
- borradores personales;
- filtros y búsquedas;
- recursos recientes;
- archivos;
- fotografías;
- cámara;
- escáner;
- portapapeles;
- descargas;
- datos sensibles visibles;
- caché identificable;
- credenciales y autocompletado;
- permisos elevados;
- aprobaciones temporales;
- notificaciones personales;
- rutas de retorno;
- estado del navegador o WebView.

La limpieza no eliminará evidencia empresarial confirmada ni colas que deban conservar actor original.

---

#### 18. Inactividad y presencia

La política de inactividad tendrá en cuenta:

- sensibilidad del proceso;
- exposición pública;
- clase de uso compartido;
- frecuencia de cambio de actor;
- posibilidad de abandono;
- guantes, higiene y manos ocupadas;
- operación de lectura continua;
- trabajo pendiente;
- conectividad;
- capacidad de bloqueo sin pérdida.

Una señal de movimiento, toque o presencia física no demostrará identidad. La estación podrá bloquearse sin cerrar inmediatamente cuando sea seguro, pero reanudará solo tras comprobación suficiente.

---

#### 19. Step-up y doble control

Se exigirá comprobación reforzada cuando lo determine la política, por ejemplo:

- pagos, cierres o diferencias;
- correcciones materiales;
- movimientos sensibles de inventario;
- aprobación o excepción;
- acceso a datos restringidos;
- cambio de sede o área;
- elevación temporal;
- sesión antigua;
- método de baja garantía;
- dispositivo o contexto degradado;
- segundo actor obligatorio.

El aprobador será distinto del ejecutor cuando la regla exija segregación. La credencial del aprobador no reemplazará al actor principal ni abrirá una sesión administrativa persistente.

---

#### 20. Fallos de identificación y recuperación

El diseño cubrirá:

- método no disponible;
- credencial inválida;
- trabajador inactivo;
- cuenta bloqueada;
- turno inexistente;
- check-in ausente;
- sede o área incompatible;
- estación revocada;
- dispositivo no reconocido;
- reloj desajustado;
- contexto incompleto;
- servicio de identidad no disponible;
- intento repetido;
- duplicidad de sesión;
- aplicación reiniciada;
- cierre incompleto;
- actor previo desconocido;
- estado offline.

La recuperación será guiada, limitada, auditada y reversible. No habilitará una cuenta genérica para “seguir trabajando”.

---

#### 21. Intentos fallidos y abuso

Cada método deberá definir:

- límite y ventana de intentos;
- demora progresiva o bloqueo;
- tratamiento de repetición desde varias estaciones;
- notificación de anomalía;
- recuperación autorizada;
- protección contra observación del PIN;
- prevención de replay;
- vigencia y uso único cuando aplique;
- respuesta que no revele información innecesaria;
- registro de método y resultado sin guardar secretos.

---

#### 22. Reinicio, suspensión y restauración de sesión

Después de reinicio, actualización, suspensión, caída de aplicación o pérdida de memoria:

1. no se restaurará automáticamente un actor como `ACTIVE` desde almacenamiento local no confiable;
2. se recuperará solo el trabajo permitido y firmado;
3. se comprobarán vigencia, dispositivo, contexto y sesión;
4. una sesión incierta pasará a `RECOVERY_REQUIRED`;
5. los pendientes conservarán actor y contexto originales;
6. la interfaz mostrará si existe trabajo por recuperar antes de aceptar nuevas mutaciones.

---

#### 23. Operación offline

La identificación offline solo podrá existir si una política futura demuestra:

- identidad previamente vinculada al dispositivo;
- credencial o afirmación verificable localmente;
- vigencia limitada;
- contexto previamente emitido y no revocado dentro de la tolerancia aprobada;
- alcance mínimo;
- datos protegidos;
- cola vinculada con actor, estación y versión de contexto;
- bloqueo de acciones que requieran comprobación online;
- revalidación al sincronizar;
- tratamiento explícito de revocaciones y conflictos.

Offline no permitirá crear autoridad nueva ni extender indefinidamente una sesión.

---

#### 24. Cola y sincronización

Cada comando offline o pendiente conservará:

```text
original_actor_id
station_actor_session_id
station_instance_id
context_version
process_id
step_id
resource_id
resource_version
idempotency_key
created_at
local_sequence
authorization_requirement
sync_state
```

El cambio de actor no reasignará automáticamente la cola. La sincronización revalidará lo que corresponda y enviará conflictos a recuperación, sin duplicar efectos.

---

#### 25. Privacidad y minimización

1. La estación mostrará únicamente datos suficientes para reconocer al actor correcto.
2. No expondrá documento, correo, teléfono u otros datos innecesarios.
3. Los registros no contendrán secretos ni valores biométricos crudos.
4. Las capturas de soporte deberán enmascarar datos personales.
5. La vista sin actor aplicará masking o bloqueo según el perfil.
6. El historial visible de actores se limitará a lo necesario para continuidad y soporte autorizado.
7. La analítica no se utilizará para vigilancia laboral punitiva sin gobierno explícito.

---

#### 26. Accesibilidad y operación real

Cada método tendrá alternativa cuando sea razonable para:

- limitaciones motoras;
- baja visión;
- daltonismo;
- dificultades auditivas;
- lectura limitada;
- guantes;
- humedad o grasa;
- ruido;
- baja iluminación;
- movilidad;
- ausencia temporal de cámara o escáner.

La confirmación de identidad no dependerá solo de memoria, velocidad, sonido o color. Los mensajes explicarán qué ocurrió y cómo continuar sin revelar datos sensibles.

---

#### 27. Auditoría mínima

Cada evento de identificación, cambio, bloqueo, cierre, recuperación o traspaso registrará:

```text
event_id
event_type
occurred_at
recorded_at
station_instance_id
endpoint_id
application_id
station_actor_session_id
actor_id
previous_actor_id
target_actor_id
identification_method_class
assurance_level
process_id
step_id
site_id
area_id
result
reason_code
context_version
correlation_id
transfer_receipt_id
```

La auditoría distinguirá intento, éxito, denegación, expiración, revocación, transferencia y recuperación.

---

#### 28. Revocación

La revocación de trabajador, dispositivo, estación, sesión o método deberá:

- impedir nuevas acciones;
- invalidar reentrada rápida;
- bloquear o cerrar según riesgo;
- conservar pendientes con su autor;
- exigir recuperación si existe resultado incierto;
- emitir evidencia técnica y funcional;
- propagarse a superficies activas;
- no depender únicamente de reiniciar la aplicación.

---

#### 29. Matriz de transición obligatoria

`UX-STATION-ACTOR-TRANSITION-MATRIX-001` cubrirá, por perfil y clase de uso compartido:

```text
ESTADO ORIGEN
→ DISPARADOR
→ ACTOR ACTUAL
→ TRABAJO PENDIENTE
→ COMPROBACIONES
→ ESTADO DESTINO
→ LIMPIEZA
→ EVIDENCIA
→ FALLBACK
```

Como mínimo incluirá identificación, reentrada, bloqueo, desbloqueo, cambio, traspaso, expiración, cierre, reinicio, revocación, offline y recuperación.

---

#### 30. Cobertura por proceso

Los 69 procesos deberán declarar por paso:

```text
process_id
step_id
station_profile_candidate
sharedness_class
actor_required
identification_method_classes[]
minimum_assurance_level
check_in_requirement
step_up_requirement
handoff_allowed
inactivity_policy_class
offline_identification_policy
close_triggers[]
cleanup_profile
audit_profile
prototype_questions[]
```

Un paso sin estación compartida deberá justificar `NO_SHARED_STATION_ACTOR_SESSION`.

---

#### 31. Brechas y destinos obligatorios

| Brecha                                                  | Tarea propietaria                     |
| ------------------------------------------------------- | ------------------------------------- |
| identidad técnica, límites y revocación del dispositivo | `AUTH-DEV-001` a `AUTH-DEV-016`       |
| resolución de contexto laboral y operativo              | `AUTH-CTX-007` a `AUTH-CTX-018`       |
| superficie, indicador y mensajes                        | `UX-STATION-005`                      |
| hardware o método físico                                | `UX-STATION-006`                      |
| offline, cola, contingencia y recuperación              | `UX-STATION-007`                      |
| validación con trabajadores                             | `UX-STATION-008`                      |
| aprobación final de matriz                              | `UX-STATION-009`                      |
| gramática, bandeja y composición                        | `UX-STATION-010` a `UX-STATION-012`   |
| pantallas definitivas                                   | `PROC-SCREEN-001` a `PROC-SCREEN-028` |
| pruebas de tablets, terminales y pantallas              | `AUTH-DEV-014` a `AUTH-DEV-016`       |

Toda excepción tendrá propietario, alcance, riesgo, control compensatorio, vencimiento y puerta de resolución.

---

#### 32. Límites de esta tarea

Esta tarea no:

- crea cuentas o credenciales;
- aprueba PIN, badge, QR o biometría concretos;
- define tiempos numéricos universales;
- implementa autenticación o autorización;
- modifica `AccessContext`;
- configura Supabase Auth;
- crea tablas o migraciones;
- diseña wireframes definitivos;
- compra o instala dispositivos;
- activa offline;
- habilita acceso de emergencia;
- aprueba despliegue.

---

#### Requisitos de prueba derivados

**Resultado:** GENERA 40 REQUISITOS DE PRUEBA.

Se incorporan `TREQ-PROC-661` a `TREQ-PROC-700` en el Registro Canónico de Requisitos de Prueba.

Estos requisitos protegen separación de identidades, atribución individual, estados, métodos, resolución de contexto, cambio, traspaso, cierre, limpieza, step-up, recuperación, offline, privacidad, auditoría, revocación y cobertura de los 69 procesos.

---

#### 33. Criterios de aceptación

- [ ] Se separan estación, dispositivo, sesión técnica, identidad laboral, sesión de actor y permiso efectivo.
- [ ] Se prohíben cuentas, PIN y credenciales compartidas como actor individual.
- [ ] Existe una máquina de estados completa.
- [ ] Cada método de identificación tiene alcance y restricciones.
- [ ] Se define identificación ordinaria con resolución autoritativa de contexto.
- [ ] Se define intersección entre límites del dispositivo y trabajador.
- [ ] El actor efectivo es visible y accesible.
- [ ] El cambio de actor resuelve borradores, pendientes y limpieza.
- [ ] El traspaso produce receipt y aceptación.
- [ ] Cierre, bloqueo, expiración y revocación tienen disparadores explícitos.
- [ ] Se define step-up sin convertir al aprobador en actor principal.
- [ ] Se definen recuperación y límites offline sin bypass.
- [ ] Se minimizan datos y se prohíbe almacenar secretos.
- [ ] Existe auditoría suficiente y correlacionable.
- [ ] Los 69 procesos tienen destino de cobertura.
- [ ] Cada brecha tiene tarea propietaria exacta.
- [ ] No se implementó autenticación, UI, hardware ni cambios en Supabase.
- [ ] `UX-STATION-005` permanece no iniciada.

---

#### 34. Estado y continuidad

```text
UX-STATION-003 APROBADA
UX-STATION-004 APROBADA
UX-STATION-005 NO INICIADA
```

La aprobación documental de esta tarea habilita continuar con `UX-STATION-005`. No autoriza cuentas compartidas, credenciales, configuración física, autenticación, migraciones, despliegue ni entrada a E5.


### ✅ UX-STATION-005 — Diseñar la superficie operativa contextual por estación, zona y proceso

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Marcador exacto que reemplaza:** `### [ ] UX-STATION-005 — Diseñar la superficie operativa contextual por estación, zona y proceso`  
**Tarea anterior:** `UX-STATION-004 — Diseñar identificación, cambio y cierre de actor en estaciones compartidas` — APROBADA  
**Siguiente tarea reservada:** `UX-STATION-006 — Definir periféricos, montaje, alimentación, conectividad y mantenimiento` — NO INICIADA  
**Artefactos aprobados:** `UX-STATION-CONTEXTUAL-SURFACE-CONTRACT-001`; `UX-STATION-CONTEXT-RESOLUTION-MODEL-001`; `UX-STATION-SURFACE-STATE-MACHINE-001`; `UX-STATION-INFORMATION-HIERARCHY-001`; `UX-STATION-WORK-SCOPE-CONTRACT-001`; `UX-STATION-SURFACE-PRIVACY-CONTRACT-001`; `UX-STATION-PROCESS-SURFACE-MATRIX-001`; `UX-STATION-SURFACE-EXCEPTION-REGISTER-001`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`, por paso, estación, zona, actor, contexto, estado, capacidad y modalidad  
**Naturaleza:** contrato funcional de resolución y presentación de una superficie operativa contextual; no diseño visual definitivo, wireframe final, implementación de componentes, navegación final, código, hardware, migraciones ni cambios en Supabase  
**Cambios en código, componentes, aplicaciones, rutas, navegación, migraciones, Supabase, hardware, red, periféricos, configuración o despliegues:** no autorizados

---

#### 1. Propósito

Definir qué información, trabajo, estado y acciones debe presentar una estación operativa después de conocer:

```text
ESTACIÓN Y PERFIL
+ ACTOR EFECTIVO
+ CONTEXTO LABORAL Y OPERATIVO
+ SEDE, ÁREA Y ZONA
+ PROCESO Y PASO
+ RECURSO Y TERRITORIO
+ CAPACIDADES DISPONIBLES
+ ESTADO DE CONECTIVIDAD Y SINCRONIZACIÓN
+ AUTORIZACIÓN VIGENTE
= SUPERFICIE OPERATIVA CONTEXTUAL
```

La superficie deberá ayudar al trabajador a reconocer dónde está, qué trabajo le corresponde, cuál es la siguiente acción segura y qué restricciones existen, sin convertir la interfaz en fuente de autoridad ni exponer información ajena.

```text
MOSTRAR UNA ACCIÓN
≠ AUTORIZARLA

MOSTRAR UNA COLA
≠ CONCEDER ACCESO A TODOS SUS RECURSOS

SEDE O ZONA SELECCIONADA
≠ TERRITORIO AUTORIZADO

ESTACIÓN COMPARTIDA
≠ SUPERFICIE GENÉRICA PARA TODOS
```

---

#### 2. Continuidad lógica

`UX-STATION-003` definió perfiles e instancias de estación. `UX-STATION-004` definió el actor efectivo y su ciclo de identificación, cambio y cierre. Esta tarea diseña la superficie que consume esos contratos.

```text
PERFIL E INSTANCIA
        ↓
ACTOR EFECTIVO
        ↓
CONTEXTO RESUELTO
        ↓
SUPERFICIE CONTEXTUAL
        ↓
GRAMÁTICA, BANDEJA Y COMPOSICIÓN
        ↓
PROTOTIPO Y MATRIZ FINAL
```

La tarea no adelanta la gramática de interacción de `UX-STATION-010`, la bandeja detallada de `UX-STATION-011`, la composición dinámica de `UX-STATION-012` ni las pantallas definitivas de `PROC-SCREEN-001` a `PROC-SCREEN-028`.

---

#### 3. Separación conceptual obligatoria

| Concepto              | Función                                                        | Fuente de autoridad                                |
| --------------------- | -------------------------------------------------------------- | -------------------------------------------------- |
| perfil de estación    | capacidades y restricciones esperadas                          | catálogo versionado de perfiles                    |
| instancia de estación | ubicación y configuración física concreta                      | inventario y configuración administrada            |
| actor efectivo        | trabajador atribuido a la acción actual                        | sesión de actor resuelta                           |
| contexto laboral      | identidad, asignaciones y cobertura                            | servicios autoritativos de identidad               |
| contexto operativo    | turno, check-in, rol operativo, sede y área activas            | resolver canónico de contexto                      |
| zona operativa        | lugar físico o lógico donde se realiza el trabajo              | configuración aprobada y relación con estación     |
| work scope            | conjunto de procesos, pasos y recursos potencialmente visibles | reglas de proceso y autorización                   |
| superficie contextual | representación de trabajo y acciones permitidas                | resultado derivado; nunca fuente de autoridad      |
| selección visual      | filtro o preferencia temporal                                  | cliente; no amplía autoridad                       |
| comando               | intención empresarial enviada al servidor                      | autorización revalidada en servidor                |
| bandeja               | colección contextual de trabajo pendiente                      | se concreta en `UX-STATION-011`                    |
| pantalla definitiva   | composición implementable por proceso                          | se define en `PROC-SCREEN-001` a `PROC-SCREEN-028` |

---

#### 4. Artefactos aprobados

1. `UX-STATION-CONTEXTUAL-SURFACE-CONTRACT-001`  
   Reglas generales de qué puede mostrar y habilitar la superficie.

2. `UX-STATION-CONTEXT-RESOLUTION-MODEL-001`  
   Entradas, precedencia, frescura, invalidez y resultado del contexto.

3. `UX-STATION-SURFACE-STATE-MACHINE-001`  
   Estados visibles de la superficie y transiciones permitidas.

4. `UX-STATION-INFORMATION-HIERARCHY-001`  
   Orden de información y acciones por prioridad operativa.

5. `UX-STATION-WORK-SCOPE-CONTRACT-001`  
   Forma de delimitar procesos, pasos, recursos y colas visibles.

6. `UX-STATION-SURFACE-PRIVACY-CONTRACT-001`  
   Minimización, ocultamiento, limpieza y prevención de filtraciones.

7. `UX-STATION-PROCESS-SURFACE-MATRIX-001`  
   Cobertura de los 69 procesos por paso y condición.

8. `UX-STATION-SURFACE-EXCEPTION-REGISTER-001`  
   Excepciones, riesgos, compensaciones, vencimientos y cierre.

---

#### 5. Unidad mínima de resolución

La superficie se resolverá para una combinación explícita:

```text
station_instance_id
station_profile_id
station_profile_version
endpoint_id
application_id
actor_session_id
identity_subject_id
employee_id
effective_role_context
active_site_id
active_area_id
zone_id
process_id
step_id
resource_type
resource_id
work_scope
capability_snapshot
connectivity_state
sync_state
authorization_snapshot
resolved_at
context_version
```

No todos los campos serán obligatorios en todos los estados, pero cualquier ausencia deberá producir un estado explícito, nunca una suposición silenciosa.

---

#### 6. Precedencia y autoridad

La superficie se derivará de la intersección:

```text
LÍMITES DE ESTACIÓN Y DISPOSITIVO
∩ APLICACIONES Y CAPACIDADES DISPONIBLES
∩ ACTOR Y CONTEXTO VIGENTES
∩ PROCESOS Y PASOS ASIGNABLES
∩ TERRITORIO REAL DEL RECURSO
∩ AUTORIZACIÓN PARA LA ACCIÓN
∩ ESTADO OPERATIVO Y TÉCNICO
```

El cliente no podrá ampliar el resultado mediante parámetros de ruta, query string, almacenamiento local, último filtro, aplicación abierta, nombre del rol, estación, zona o recurso conocido.

---

#### 7. Máquina de estados de la superficie

`UX-STATION-SURFACE-STATE-MACHINE-001` define:

| Estado           | Significado                                                   |                   Mutaciones |
| ---------------- | ------------------------------------------------------------- | ---------------------------: |
| `UNBOUND`        | la estación o aplicación no está vinculada correctamente      |                           No |
| `ACTOR_REQUIRED` | falta actor efectivo                                          |                           No |
| `RESOLVING`      | se resuelven identidad, contexto, capacidades y trabajo       |                           No |
| `READY`          | existe contexto suficiente y fresco                           |           Según autorización |
| `LIMITED`        | la estación o actor tiene capacidades parciales conocidas     |          Solo las explícitas |
| `DEGRADED`       | existe falla controlada con operación limitada                |               Según contrato |
| `OFFLINE`        | no existe comunicación autoritativa y aplica política offline |     Solo acciones permitidas |
| `SYNC_PENDING`   | existen comandos o evidencias locales pendientes              |                    Limitadas |
| `CONFLICT`       | la reincorporación requiere decisión o conciliación           | No sobre el recurso afectado |
| `HANDOFF`        | trabajo en transferencia entre actores o estaciones           |               Según contrato |
| `BLOCKED`        | contexto inválido, revocado o condición insegura              |                           No |
| `RECOVERY`       | se recupera estado después de falla, reinicio o expiración    |             No hasta validar |
| `CLOSED`         | sesión del actor cerrada y superficie limpiada                |                           No |

Toda transición deberá declarar disparador, comprobaciones, trabajo pendiente, limpieza, destino, evidencia y fallback.

---

#### 8. Condiciones de `READY`

La superficie solo podrá entrar en `READY` cuando:

- la estación e instancia sean reconocidas;
- el perfil y su versión sean válidos;
- exista actor efectivo cuando el paso lo requiera;
- el contexto laboral y operativo sea vigente;
- sede, área y zona sean coherentes;
- el proceso, paso y recurso estén resueltos;
- la capacidad necesaria esté disponible;
- no exista revocación o bloqueo;
- la información visible haya sido filtrada;
- la acción se someta a autorización de servidor;
- la frescura sea suficiente para el riesgo.

La carga parcial no se presentará como `READY`.

---

#### 9. Encabezado contextual mínimo

La superficie conservará un indicador persistente y accesible con:

```text
actor efectivo
estación o puesto
sede y área operativas
zona cuando sea relevante
proceso o modo actual
estado de conexión y sincronización
condición degradada o limitada
```

No mostrará permisos internos, tokens, identificadores técnicos innecesarios ni datos personales completos.

El indicador no dependerá únicamente de color y deberá actualizarse al cambiar actor, sede, área, zona, proceso, dispositivo, conectividad o estado.

---

#### 10. Jerarquía de información

`UX-STATION-INFORMATION-HIERARCHY-001` establece este orden:

1. condición que bloquea o pone en riesgo la operación;
2. siguiente acción segura;
3. trabajo actual y su estado;
4. pendientes que requieren atención;
5. confirmaciones y resultados recientes;
6. contexto mínimo del actor y estación;
7. navegación secundaria;
8. diagnóstico o detalle técnico bajo demanda.

Una estación operativa no se convertirá en dashboard administrativo por conveniencia.

---

#### 11. Siguiente acción segura

Cada paso podrá declarar:

```text
primary_safe_action
secondary_actions[]
blocked_actions[]
required_information
required_confirmation
required_peripheral
required_connectivity
required_assurance
success_receipt
recovery_action
```

La acción principal deberá corresponder al estado real del proceso y no únicamente al botón usado por última vez.

No se presentará una acción destructiva, irreversible o sensible como acción primaria sin las salvaguardas aplicables.

---

#### 12. Alcance de trabajo visible

`UX-STATION-WORK-SCOPE-CONTRACT-001` separará:

- trabajo asignado al actor;
- trabajo asignado a la estación o zona;
- trabajo disponible para tomar;
- trabajo en curso;
- trabajo bloqueado;
- trabajo transferido;
- trabajo pendiente de sincronización;
- trabajo que exige supervisión;
- trabajo histórico autorizado.

El alcance visible no se derivará únicamente del rol o de la aplicación abierta.

---

#### 13. Colas, contadores y vistas previas

Los contadores, agrupaciones, títulos y vistas previas se tratarán como datos protegidos.

Una persona no autorizada no podrá inferir:

- existencia de pedidos, empleados, clientes, incidentes o documentos;
- cantidad de trabajo de otra sede o área;
- nombres, valores, prioridades o fragmentos;
- estados de recursos fuera de su territorio;
- información sensible mediante diferencias entre cero, error y oculto.

Las colas deberán soportar estado desconocido, parcial, desactualizado y paginado sin presentar totales falsos.

---

#### 14. Proceso, paso y recurso

La superficie deberá distinguir:

```text
PROCESO
→ INSTANCIA DEL PROCESO
→ PASO ACTUAL
→ RECURSO AFECTADO
→ ESTADO DEL PASO
→ ACCIONES POSIBLES
→ RESULTADO ESPERADO
```

Cambiar de pantalla no cambiará el estado empresarial. El estado solo cambiará por un comando confirmado o por un evento autoritativo.

---

#### 15. Filtros y selecciones

Un filtro podrá reducir información visible, pero nunca ampliar el conjunto autorizado.

Toda selección de sede, área, zona, fecha, actor, estado o recurso deberá:

- mostrar su efecto;
- conservar procedencia;
- tener opción de restablecimiento;
- invalidarse cuando cambie el contexto;
- no persistir datos sensibles entre actores;
- no convertirse en parámetro autoritativo;
- evitar resultados de una selección anterior durante la transición.

---

#### 16. Cambio de sede, área o zona

Cuando el proceso admita cambio contextual:

1. se bloquearán mutaciones;
2. se resolverán borradores y pendientes;
3. se comprobará que la estación permite el destino;
4. se resolverá el contexto del actor;
5. se reconsultará el trabajo;
6. se limpiarán datos incompatibles;
7. se mostrará el nuevo contexto;
8. se registrará el cambio.

No existirá cambio silencioso por desplazamiento, geolocalización, red Wi-Fi o último lugar utilizado.

---

#### 17. Entradas externas y enlaces profundos

Una notificación, QR, código, enlace profundo, escaneo, atajo o evento externo podrá solicitar abrir un recurso, pero deberá revalidar:

- actor;
- estación;
- aplicación;
- proceso y paso;
- recurso y territorio;
- contexto;
- autorización;
- estado;
- capacidad requerida.

Cuando la validación falle, no se mostrará información sensible del recurso.

---

#### 18. Capacidades y periféricos

La superficie deberá adaptar las acciones a la capacidad efectiva:

- táctil;
- teclado;
- cámara;
- escáner;
- impresora;
- datáfono;
- báscula o sensor;
- audio o señal visual;
- almacenamiento local;
- conectividad.

La ausencia o falla de una capacidad producirá estado y alternativa explícitos. No ocultará silenciosamente una obligación empresarial.

`UX-STATION-006` definirá los periféricos, montaje, alimentación, conectividad y mantenimiento físicos.

---

#### 19. Conectividad y degradación

La superficie separará:

```text
CONECTIVIDAD DEL CLIENTE
ESTADO DEL BACKEND
ESTADO DE LA RED LOCAL
ESTADO DEL PERIFÉRICO
ESTADO DE SINCRONIZACIÓN
ESTADO DEL PROCESO
```

No se mostrará “sin Internet” para cualquier falla ni “todo correcto” porque la aplicación abrió.

`UX-STATION-007` definirá la operación degradada, offline, contingencia y recuperación.

---

#### 20. Trabajo local y sincronización

Cuando exista trabajo local, la superficie mostrará:

- cantidad y clase de pendientes;
- actor original;
- estación y contexto de origen;
- momento de captura;
- estado de envío;
- resultado conocido, desconocido o conflictivo;
- acción permitida;
- riesgo de cerrar o cambiar de actor;
- ruta de conciliación.

Un cambio de actor no reasignará pendientes locales.

---

#### 21. Estado desconocido, desactualizado o incierto

La superficie distinguirá:

- dato vigente;
- dato en actualización;
- dato desactualizado;
- estado desconocido;
- comando pendiente;
- resultado incierto;
- conflicto;
- información no autorizada.

No convertirá `unknown` en cero, vacío, éxito o disponibilidad.

---

#### 22. Latencia y prevención de duplicados

Mientras se resuelve contexto o se ejecuta un comando:

- la intención activa será visible;
- se impedirán dobles envíos;
- se conservará idempotency key cuando aplique;
- no se mostrará éxito antes de receipt;
- podrá cancelarse únicamente cuando el contrato lo permita;
- se ofrecerá recuperación ante timeout;
- el actor no deberá repetir a ciegas una acción.

---

#### 23. Errores y recuperación

Los errores se clasificarán por:

```text
VALIDACIÓN
AUTORIZACIÓN
CONFLICTO
DEPENDENCIA
CONECTIVIDAD
PERIFÉRICO
SINCRONIZACIÓN
ESTADO EMPRESARIAL
CONFIGURACIÓN
DESCONOCIDO
```

Cada error tendrá mensaje comprensible, acción segura, identificador de soporte cuando aplique y protección contra exposición de detalles internos.

---

#### 24. Cambio y cierre de actor

Al cambiar o cerrar actor, la superficie deberá:

- bloquear nuevas mutaciones;
- resolver o custodiar borradores;
- conservar autoría de pendientes;
- limpiar datos, filtros y vistas previas;
- cerrar cámara, archivos y permisos temporales;
- revocar elevaciones;
- volver a `ACTOR_REQUIRED` o `CLOSED`;
- conservar evidencia del cierre.

Estas reglas consumen el contrato aprobado en `UX-STATION-004`.

---

#### 25. Borradores, trabajo en curso y handoff

Cada borrador deberá declarar:

```text
draft_owner
process_instance
step_id
resource_id
station_origin
context_origin
sensitivity
handoff_allowed
expiry_policy
recovery_policy
```

Un borrador no podrá aparecer al siguiente trabajador sin traspaso explícito o regla operativa aprobada.

La continuación por otro actor conservará autoría de cada acción y no reescribirá el historial.

---

#### 26. Privacidad en superficie compartida

`UX-STATION-SURFACE-PRIVACY-CONTRACT-001` exigirá:

- minimización por paso;
- masking según actor, recurso y entorno;
- ocultamiento de información no necesaria;
- limpieza entre actores;
- bloqueo por inactividad;
- protección de notificaciones y vistas previas;
- control de capturas, impresión y exportación;
- ausencia de secretos en errores;
- no persistencia de datos personales en filtros o historial local;
- posicionamiento y timeout adecuados para zonas públicas.

---

#### 27. Accesibilidad y señales multimodales

Los estados, bloqueos, pendientes y acciones deberán poder comprenderse sin depender solo de:

- color;
- icono;
- sonido;
- vibración;
- animación;
- texto técnico;
- memoria del trabajador.

La superficie deberá soportar foco, teclado cuando aplique, tamaño de texto, contraste, lectura breve, objetivos táctiles, orientación y recuperación tras interrupción.

---

#### 28. Densidad y carga cognitiva

La densidad se definirá según:

- frecuencia;
- urgencia;
- número de elementos;
- distancia de lectura;
- postura;
- manos ocupadas;
- ambiente;
- experiencia del trabajador;
- riesgo del paso.

No se aprobará una superficie saturada para “mostrar todo” ni una superficie minimalista que oculte estado, pendientes o consecuencias.

---

#### 29. Personalización permitida

La personalización individual podrá incluir preferencias no autoritativas, como orden secundario o accesibilidad, pero no podrá modificar:

- permisos;
- work scope;
- sede o área operativa;
- prioridad empresarial;
- controles obligatorios;
- campos requeridos;
- trazabilidad;
- masking;
- contingencia;
- estado del proceso.

La personalización se limpiará o separará correctamente en estaciones compartidas.

---

#### 30. Configuración y versionado

La superficie contextual deberá tener una versión asociada a:

```text
station_profile_version
surface_contract_version
process_version
component_contract_version
authorization_contract_version
```

Un cambio material de información, acciones, privacidad, estados o work scope exigirá nueva versión, compatibilidad, pruebas y rollout controlado.

No se adoptará automáticamente la última configuración sin evaluar las instancias afectadas.

---

#### 31. Auditoría y observabilidad

Cada resolución y transición relevante deberá poder correlacionar:

```text
station_instance_id
actor_session_id
process_id
step_id
resource_id
context_version
surface_state
command_id
event_id
correlation_id
configuration_version
reason_code
resolved_at
```

La telemetría no almacenará payloads sensibles innecesarios ni sustituirá la auditoría empresarial.

`NFR-REQ-009` y `OBS-ARC-001` a `OBS-ARC-016` desarrollarán la implementación posterior.

---

#### 32. Matriz de cobertura por proceso

`UX-STATION-PROCESS-SURFACE-MATRIX-001` deberá declarar para cada paso de los 69 procesos:

```text
process_id
process_version
step_id
station_profile_candidate
zone_context
actor_requirement
required_context
work_scope_rule
surface_entry_state
primary_safe_action
visible_information
masked_information
capability_requirements
connectivity_modes
pending_work_behavior
handoff_behavior
close_behavior
error_classes
prototype_questions
final_owner_task
```

Cuando un paso no requiera superficie compartida se justificará `NO_SHARED_CONTEXTUAL_SURFACE`.

---

#### 33. Escenarios mínimos de validación posterior

La matriz deberá preparar, como mínimo:

1. estación sin vínculo;
2. actor ausente;
3. actor no vigente;
4. contexto incompleto;
5. cambio de actor con borrador;
6. cambio de zona con trabajo pendiente;
7. recurso de otra sede;
8. deep link no autorizado;
9. contador que podría filtrar información;
10. periférico ausente;
11. conectividad parcial;
12. backend disponible con proceso bloqueado;
13. estado desconocido;
14. comando con resultado incierto;
15. doble toque o reintento;
16. sincronización pendiente;
17. conflicto de reincorporación;
18. revocación durante una acción;
19. inactividad con datos sensibles;
20. configuración incompatible;
21. accesibilidad sin color o audio;
22. recuperación después de reinicio;
23. handoff aceptado y rechazado;
24. trabajo de alta concurrencia;
25. cierre limpio entre trabajadores.

Las pruebas con trabajadores reales pertenecen a `UX-STATION-008`.

---

#### 34. Brechas y destinos obligatorios

| Brecha                                                    | Tarea propietaria                                         |
| --------------------------------------------------------- | --------------------------------------------------------- |
| capacidades, periféricos, montaje, energía y conectividad | `UX-STATION-006`                                          |
| offline, degradación, contingencia y recuperación         | `UX-STATION-007`                                          |
| prototipo y validación con trabajadores                   | `UX-STATION-008`                                          |
| aprobación final de matriz                                | `UX-STATION-009`                                          |
| gramática de interacción                                  | `UX-STATION-010`                                          |
| bandeja contextual                                        | `UX-STATION-011`                                          |
| composición dinámica                                      | `UX-STATION-012`                                          |
| pantallas definitivas                                     | `PROC-SCREEN-001` a `PROC-SCREEN-028`                     |
| identidad y límites del dispositivo                       | `AUTH-DEV-001` a `AUTH-DEV-016`                           |
| resolución de contexto                                    | `AUTH-CTX-001` a `AUTH-CTX-030`                           |
| colas e idempotencia                                      | `QUEUE-ARC-001` a `QUEUE-ARC-012`                         |
| observabilidad y soporte                                  | `OBS-ARC-001` a `OBS-ARC-016`; `TI-DOM-007`; `TI-DOM-010` |
| cobertura final de procesos                               | `PROC-COVER-001` a `PROC-COVER-010`                       |

Toda brecha conservará propietario, evidencia requerida, riesgo, fecha o condición de revisión y puerta de cierre.

---

#### 35. Límites de esta tarea

Esta tarea no:

- crea wireframes o pantallas finales;
- define navegación definitiva;
- implementa componentes;
- aprueba iconos, colores o layouts concretos;
- diseña la bandeja completa;
- configura estaciones o periféricos;
- modifica autorización;
- crea cuentas o credenciales;
- implementa offline;
- crea colas;
- cambia procesos;
- crea tablas o migraciones;
- modifica Supabase;
- ejecuta prototipos;
- habilita E5.

---

#### Requisitos de prueba derivados

**Resultado:** GENERA 40 REQUISITOS DE PRUEBA.

Se incorporan `TREQ-PROC-701` a `TREQ-PROC-740` en el Registro Canónico de Requisitos de Prueba.

Estos requisitos protegen resolución contextual, autoridad, estados, jerarquía, work scope, privacidad, colas, acciones, cambios de contexto, deep links, capacidades, degradación, sincronización, errores, handoff, accesibilidad, versionado, auditoría y cobertura de los 69 procesos.

---

#### 36. Criterios de aceptación

- [ ] Se separa superficie contextual de autorización, proceso, bandeja y pantalla definitiva.
- [ ] Existe una unidad mínima de resolución completa.
- [ ] La precedencia se basa en intersección y fuentes autoritativas.
- [ ] Existe máquina de estados y condiciones explícitas para `READY`.
- [ ] El actor, estación y contexto son visibles sin exponer datos innecesarios.
- [ ] La jerarquía prioriza bloqueo, siguiente acción y trabajo actual.
- [ ] Work scope, colas, contadores y vistas previas están protegidos.
- [ ] Proceso, paso, recurso y estado permanecen separados.
- [ ] Filtros y selecciones no amplían autoridad.
- [ ] Cambios de sede, área y zona revalidan contexto.
- [ ] Entradas externas no evitan autorización.
- [ ] Capacidades y periféricos producen estados explícitos.
- [ ] Conectividad, backend, red local, periférico y sincronización se distinguen.
- [ ] El trabajo local conserva actor y contexto originales.
- [ ] Estado desconocido no se convierte en éxito o vacío.
- [ ] Se previenen dobles envíos y resultados falsos.
- [ ] Errores y recuperación tienen contrato.
- [ ] Cambio de actor limpia y conserva autoría.
- [ ] Privacidad, accesibilidad y carga cognitiva están cubiertas.
- [ ] La configuración es versionada.
- [ ] Los 69 procesos tienen destino de cobertura.
- [ ] Cada brecha tiene tarea exacta.
- [ ] No se implementó UI, código, hardware, migraciones ni Supabase.
- [ ] `UX-STATION-006` permanece no iniciada.

---

#### 37. Estado y continuidad

```text
UX-STATION-004 APROBADA
UX-STATION-005 APROBADA
UX-STATION-006 NO INICIADA
```

La aprobación documental de esta tarea habilita continuar con `UX-STATION-006`. No autoriza implementación, configuración física, navegación final, migraciones, despliegue ni entrada a E5.


### ✅ UX-STATION-006 — Definir periféricos, montaje, alimentación, conectividad y mantenimiento

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Marcador exacto que reemplaza:** `### [ ] UX-STATION-006 — Definir periféricos, montaje, alimentación, conectividad y mantenimiento`  
**Tarea anterior:** `UX-STATION-005 — Diseñar la superficie operativa contextual por estación, zona y proceso` — APROBADA  
**Siguiente tarea reservada:** `UX-STATION-007 — Definir operación degradada, offline, contingencia y recuperación` — NO INICIADA  
**Artefactos aprobados:** `UX-STATION-PHYSICAL-CAPABILITY-CONTRACT-001`; `UX-STATION-PERIPHERAL-CAPABILITY-CATALOG-001`; `UX-STATION-MOUNTING-AND-ENVIRONMENT-PROFILE-001`; `UX-STATION-POWER-RESILIENCE-MATRIX-001`; `UX-STATION-CONNECTIVITY-PROFILE-001`; `UX-STATION-MAINTENANCE-OPERATING-MODEL-001`; `UX-STATION-PROCESS-PHYSICAL-DEPENDENCY-MATRIX-001`; `UX-STATION-PHYSICAL-EXCEPTION-REGISTER-001`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`, por paso, perfil, instancia, periférico, montaje, energía, red, mantenimiento, fallback y criticidad  
**Naturaleza:** contrato funcional y físico objetivo de capacidades periféricas e infraestructura de estación; no selección de marcas o modelos, compra, instalación, cableado, configuración de red, alta de activos, implementación de drivers, cambios de firmware, migraciones ni cambios en Supabase  
**Cambios en código, aplicaciones, hardware, red, energía, periféricos, montaje, compras, inventario, firmware, drivers, configuración, migraciones, Supabase o despliegues:** no autorizados

---

#### 1. Propósito

Definir las condiciones mínimas para que una estación operativa pueda utilizar de forma segura, mantenible y verificable los periféricos y servicios físicos que necesita para producir un resultado empresarial.

```text
PASO OPERATIVO
+ CAPACIDAD FÍSICA REQUERIDA
+ PERIFÉRICO O ENDPOINT COMPATIBLE
+ MONTAJE Y AMBIENTE ADECUADOS
+ ALIMENTACIÓN SUFICIENTE
+ CONECTIVIDAD UTILIZABLE
+ MANTENIMIENTO Y SOPORTE
+ FALLBACK APROBADO
= CAPACIDAD OPERATIVA FÍSICA VERIFICABLE
```

La mera existencia de un equipo, un puerto, una dirección IP, una conexión Bluetooth o una impresora encendida no demostrará que el paso operativo puede completarse.

```text
DISPOSITIVO ENCENDIDO
≠ PERIFÉRICO DISPONIBLE

PERIFÉRICO CONECTADO
≠ RESULTADO EMPRESARIAL CONFIRMADO

IP FIJA
≠ CONECTIVIDAD RESILIENTE

MONTAJE POSIBLE
≠ MONTAJE SEGURO, HIGIÉNICO Y MANTENIBLE
```

---

#### 2. Continuidad lógica

`UX-STATION-003` definió perfiles canónicos; `UX-STATION-004` definió actor efectivo; `UX-STATION-005` definió la superficie contextual. Esta tarea define las capacidades físicas que esa superficie puede consumir y las condiciones bajo las cuales se consideran utilizables.

```text
PERFIL DE ESTACIÓN
        ↓
ACTOR Y CONTEXTO
        ↓
SUPERFICIE CONTEXTUAL
        ↓
CAPACIDADES FÍSICAS Y PERIFÉRICOS
        ↓
OPERACIÓN DEGRADADA Y RECUPERACIÓN
        ↓
PROTOTIPO Y MATRIZ FINAL
```

No adelanta la contingencia detallada de `UX-STATION-007`, el prototipo de `UX-STATION-008`, la aprobación final de `UX-STATION-009`, la arquitectura técnica de `TI-DOM-*`, la implementación de impresión `PRINT-ARC-*` ni la compra o instalación física.

---

#### 3. Separación conceptual obligatoria

| Concepto              | Significado                                                                                 | No equivale a                    |
| --------------------- | ------------------------------------------------------------------------------------------- | -------------------------------- |
| capacidad física      | función requerida por un paso, como escanear, pesar, imprimir, cobrar, capturar o señalizar | marca o modelo                   |
| periférico            | equipo que materializa una capacidad                                                        | estación completa                |
| endpoint              | identidad técnica administrable de un equipo o servicio                                     | actor humano                     |
| host                  | dispositivo que ejecuta adaptador o controla periféricos                                    | fuente de autoridad empresarial  |
| instancia de estación | puesto físico configurado y localizado                                                      | perfil abstracto                 |
| montaje               | forma física de fijación, ubicación, alcance y protección                                   | simple presencia en el área      |
| dominio de energía    | fuente, respaldo, protección y autonomía aplicables                                         | disponibilidad garantizada       |
| ruta de conectividad  | trayecto entre estación, periférico, red local y servicio                                   | autorización                     |
| consumible            | papel, etiqueta, tinta, batería u otro elemento agotable                                    | activo permanente                |
| configuración         | parámetros versionados del endpoint o adaptador                                             | permiso para modificarlos        |
| salud técnica         | estado observable del componente                                                            | resultado empresarial confirmado |
| mantenimiento         | inspección, limpieza, calibración, reparación, reemplazo y retiro                           | soporte improvisado              |

---

#### 4. Artefactos aprobados

1. `UX-STATION-PHYSICAL-CAPABILITY-CONTRACT-001`  
   Contrato transversal de capacidad física y condiciones de uso.

2. `UX-STATION-PERIPHERAL-CAPABILITY-CATALOG-001`  
   Catálogo abstracto y versionado de capacidades, clases y restricciones.

3. `UX-STATION-MOUNTING-AND-ENVIRONMENT-PROFILE-001`  
   Reglas de montaje, ergonomía, higiene, protección, accesibilidad y ambiente.

4. `UX-STATION-POWER-RESILIENCE-MATRIX-001`  
   Requisitos de alimentación, autonomía, protección y apagado seguro.

5. `UX-STATION-CONNECTIVITY-PROFILE-001`  
   Rutas primarias, secundarias, descubrimiento, vinculación y degradación.

6. `UX-STATION-MAINTENANCE-OPERATING-MODEL-001`  
   Ciclo de comisión, inspección, limpieza, calibración, incidente, reparación, sustitución y retiro.

7. `UX-STATION-PROCESS-PHYSICAL-DEPENDENCY-MATRIX-001`  
   Matriz de los 69 procesos por paso, capacidad, dependencia y fallback.

8. `UX-STATION-PHYSICAL-EXCEPTION-REGISTER-001`  
   Excepciones con riesgo, propietario, compensación, vencimiento y cierre.

---

#### 5. Unidad mínima de definición

Cada requisito físico se definirá para una combinación explícita:

```text
process_id
step_id
station_profile_id
station_instance_id
zone_id
physical_capability_id
peripheral_class
binding_mode
host_requirement
mounting_profile
power_profile
connectivity_profile
maintenance_profile
criticality_class
fallback_mode
functional_owner
technical_owner
validation_status
```

No se asignará un periférico únicamente por aplicación, rol o sede.

---

#### 6. Catálogo canónico de capacidades

El catálogo podrá contener, sin limitarse a:

| Familia                  | Capacidades abstractas                                                                       |
| ------------------------ | -------------------------------------------------------------------------------------------- |
| entrada e identificación | lectura de código, captura de imagen, teclado, tacto, firma, credencial individual           |
| medición                 | peso, temperatura, cantidad, dimensión u otra magnitud autorizada                            |
| salida documental        | impresión de recibo, comanda, etiqueta, documento o comprobante                              |
| señalización             | visualización, sonido, luz o aviso háptico como apoyo multimodal                             |
| pago                     | interacción con terminal o proveedor de pago sin convertir el periférico en fuente de verdad |
| evidencia                | fotografía, lectura, sello temporal o captura controlada                                     |
| comunicación local       | intercambio con host, adaptador, red o servicio transversal                                  |
| energía                  | carga, respaldo, autonomía, protección y apagado seguro                                      |

Cada capacidad tendrá ID, versión, entradas, salidas, precisión requerida cuando aplique, latencia tolerable, privacidad, seguridad, evidencias, estados de salud, fallback y pruebas.

---

#### 7. Selección por capacidad y no por marca

La documentación expresará primero la capacidad y después las características mínimas del equipo que podría satisfacerla.

No se fijarán en esta tarea:

- fabricante;
- modelo;
- proveedor;
- precio;
- voltaje o potencia concretos;
- protocolo definitivo;
- topología de red;
- dirección IP;
- driver específico;
- firmware objetivo;
- contrato de compra;
- cantidad final de unidades.

Esas decisiones deberán materializarse posteriormente mediante `TI-DOM-002` a `TI-DOM-005`, `ORIGO`, `NEXO`, `PRINT-ARC-*`, paquetes E5 y pruebas físicas.

---

#### 8. Estados de disponibilidad del periférico

Cada periférico o capacidad expondrá, como mínimo:

| Estado        | Significado                            | Acción permitida                 |
| ------------- | -------------------------------------- | -------------------------------- |
| `UNKNOWN`     | no existe evidencia suficiente         | bloquear dependencia crítica     |
| `UNMANAGED`   | equipo detectado pero no administrado  | no usar para mutaciones críticas |
| `DISCOVERED`  | detectado sin vinculación aprobada     | diagnóstico controlado           |
| `BOUND`       | vinculado a estación o host            | validar salud y contexto         |
| `READY`       | disponible y dentro de parámetros      | operar según autorización        |
| `BUSY`        | reservado por otra operación           | esperar o enrutar                |
| `DEGRADED`    | capacidad parcial conocida             | solo flujo permitido             |
| `OFFLINE`     | sin comunicación utilizable            | aplicar fallback aprobado        |
| `ERROR`       | fallo identificado                     | no repetir ciegamente            |
| `MAINTENANCE` | fuera de servicio planificado          | usar sustituto                   |
| `QUARANTINED` | inseguro, inconsistente o no confiable | bloquear                         |
| `RETIRED`     | retirado de operación                  | no vincular                      |

La interfaz no mostrará éxito mientras el estado o resultado permanezca desconocido.

---

#### 9. Vinculación y pertenencia

Toda relación entre estación y periférico declarará:

```text
station_instance_id
peripheral_endpoint_id
capability_ids[]
binding_type
allowed_zones[]
host_endpoint_id
configuration_version
commissioned_at
verified_at
owner
custodian
status
```

Tipos de vinculación posibles:

- dedicada a una estación;
- compartida por una zona;
- compartida por un grupo controlado;
- móvil con custodia;
- remota mediante servicio transversal;
- temporal con autorización y vencimiento.

Un periférico encontrado por proximidad no se adoptará automáticamente.

---

#### 10. Exclusividad y concurrencia

Las capacidades que no admitan uso simultáneo deberán contar con reserva, lease, correlación y liberación.

Se evitará que:

- dos estaciones envíen comandos incompatibles al mismo equipo;
- una báscula mezcle lecturas de dos operaciones;
- un escáner atribuya la lectura al actor equivocado;
- una impresora confirme un trabajo distinto al solicitado;
- una terminal de pago se reasigne mientras existe una transacción activa;
- un reinicio libere silenciosamente una operación incierta.

Toda expiración de lease deberá conducir a reconciliación, no a repetición automática ciega.

---

#### 11. Contrato de comando y resultado físico

Toda operación con efecto físico conservará:

```text
command_id
idempotency_key
actor_context
station_instance_id
peripheral_endpoint_id
capability_id
business_resource
requested_at
dispatched_at
acknowledged_at
completed_at
result_status
physical_evidence
retry_class
reconciliation_status
```

Estados mínimos:

```text
REQUESTED
→ ACCEPTED
→ DISPATCHED
→ ACKNOWLEDGED
→ COMPLETED | FAILED | UNKNOWN
→ RECONCILED
```

`ACCEPTED` no equivale a salida física completada. `UNKNOWN` exige comprobación antes de reintentar.

---

#### 12. Montaje y ubicación física

Cada perfil de montaje declarará:

- superficie o estructura de fijación;
- altura y alcance utilizables;
- orientación y ángulo de lectura;
- visibilidad sin obstruir trabajo;
- estabilidad frente a vibración o golpe;
- acceso para limpieza y mantenimiento;
- acceso controlado a puertos y botones;
- ruta de cables;
- protección contra tirones y tropiezos;
- posibilidad de retiro autorizado;
- compatibilidad con postura y movilidad;
- accesibilidad para personas con distintas capacidades;
- espacio para consumibles y sustitución.

No se considerará aprobado un montaje que solo funcione durante una demostración.

---

#### 13. Ambiente operativo

El perfil ambiental deberá evaluar:

- humedad y salpicaduras;
- grasa y residuos;
- polvo o harina;
- frío o calor;
- vapor y condensación;
- iluminación y reflejo;
- ruido;
- vibración;
- contacto con alimentos;
- químicos de limpieza;
- tránsito de personas y carros;
- riesgo de caída, impacto o manipulación no autorizada.

Las protecciones no podrán impedir ventilación, lectura, limpieza, carga ni acceso seguro.

---

#### 14. Higiene y limpieza

Para estaciones en producción, cocina, barra, bodega o servicio se definirá:

```text
cleaning_owner
cleaning_frequency_class
approved_method
power_state_for_cleaning
removable_parts
forbidden_products
inspection_after_cleaning
incident_route
```

La limpieza no deberá borrar configuración, cambiar vinculación, activar comandos ni dejar credenciales visibles.

La definición concreta de productos, frecuencias y procedimientos operativos deberá completarse en `TI-DOM-003`, mantenimiento, seguridad y procedimientos de cada sede.

---

#### 15. Seguridad física y manipulación

Se exigirá:

- fijación o custodia proporcional al riesgo;
- protección de puertos y medios removibles;
- prevención de credenciales por defecto;
- sello o evidencia de intervención cuando aplique;
- control de apertura, reemplazo y retiro;
- separación entre acceso de usuario y acceso técnico;
- bloqueo de equipos desconocidos;
- registro de cambios físicos relevantes;
- limpieza segura de datos antes de reasignar o retirar.

El soporte remoto no sustituirá la autorización ni la custodia local.

---

#### 16. Alimentación eléctrica

`UX-STATION-POWER-RESILIENCE-MATRIX-001` declarará por instancia o clase:

```text
normal_power_source
connector_or_delivery_class
expected_load_class
battery_or_ups_requirement
minimum_safe_autonomy_class
surge_or_transient_protection
charging_method
cable_and_adapter_ownership
graceful_shutdown_behavior
power_loss_detection
restart_behavior
recovery_validation
```

No se asignarán cifras técnicas sin levantamiento, ficha del fabricante y validación de `TI-DOM-002`, `TI-DOM-003` y `TI-DOM-009`.

---

#### 17. Pérdida y retorno de energía

Ante pérdida o inestabilidad:

1. se protegerá el comando empresarial en curso;
2. se evitará corrupción local;
3. se distinguirá operación completada, fallida o incierta;
4. se bloquearán reintentos peligrosos;
5. se conservará actor y contexto originales;
6. se aplicará apagado seguro cuando sea posible;
7. al retornar, se verificará reloj, vinculación, configuración, red, salud y pendientes;
8. no se declarará recuperación hasta conciliar efectos.

La operación degradada detallada queda en `UX-STATION-007`.

---

#### 18. Baterías, carga y autonomía

Los equipos con batería declararán:

- estado de salud;
- capacidad útil observable;
- ciclos o degradación cuando estén disponibles;
- umbrales operativos definidos posteriormente;
- política de carga;
- cargador autorizado;
- custodia de baterías removibles;
- sustitución;
- riesgo de hinchamiento, sobrecalentamiento o daño;
- fallback antes de agotamiento;
- evidencia de autonomía en condiciones reales.

Una batería que enciende el equipo no prueba autonomía suficiente para el proceso.

---

#### 19. Perfil de conectividad

Cada dependencia de red declarará:

```text
primary_path
secondary_path
local_or_remote_scope
name_resolution_method
addressing_dependency
discovery_method
segmentation_requirement
authentication_method
encryption_requirement
latency_class
packet_loss_tolerance
bandwidth_class
roaming_behavior
offline_behavior
health_check
recovery_check
```

Las cifras y topologías concretas pertenecen a `TI-DOM-004` y a paquetes posteriores.

---

#### 20. Identidad estable y direccionamiento

No se dependerá exclusivamente de:

- último octeto recordado;
- IP configurada manualmente sin reserva o inventario;
- nombre informal escrito en una etiqueta;
- descubrimiento abierto por proximidad;
- puerto USB concreto no administrado;
- emparejamiento Bluetooth persistido sin propietario;
- host personal no inventariado.

La resolución deberá utilizar identidad estable, inventario, configuración versionada y comprobación de pertenencia.

---

#### 21. Red local y segmentación

La estación deberá declarar qué comunicaciones necesita y con qué destino, sin diseñar todavía la red definitiva.

`TI-DOM-004` será responsable de:

- inventario y topología;
- segmentación;
- direccionamiento;
- reservas y nombres;
- reglas de comunicación;
- monitoreo;
- redundancia;
- contingencia de ISP o red local.

La estación no podrá requerir una red plana ni credenciales compartidas para funcionar.

---

#### 22. Conectividad inalámbrica y movilidad

Cuando aplique Wi-Fi, Bluetooth, NFC o conectividad celular se evaluará:

- alcance real y zonas muertas;
- interferencia;
- roaming;
- reconexión;
- emparejamiento seguro;
- consumo de batería;
- coexistencia con otros equipos;
- identidad del endpoint;
- revocación;
- uso sin conexión;
- exposición por proximidad.

La modalidad inalámbrica no será elegida solo para evitar cableado.

---

#### 23. Impresión y etiquetado

La capacidad de impresión distinguirá:

```text
INTENCIÓN EMPRESARIAL
→ TRABAJO DE IMPRESIÓN
→ ROUTING
→ COLA
→ ADAPTADOR O HOST
→ IMPRESORA
→ RESULTADO FÍSICO
→ CONFIRMACIÓN O RECONCILIACIÓN
```

Se definirán:

- tipo de documento o etiqueta;
- formato y medio;
- destino permitido;
- privacidad;
- copias;
- correlación;
- reimpresión;
- consumibles;
- atasco, falta de papel y desconexión;
- resultado conocido o incierto.

La arquitectura técnica y las colas corresponden a `PRINT-ARC-*` y `TI-DOM-005`.

---

#### 24. Escáneres y cámaras

Se definirá:

- simbologías o evidencia admitidas;
- distancia y orientación;
- iluminación;
- enfoque;
- confirmación multimodal;
- asociación con actor, recurso y paso;
- prevención de lectura duplicada;
- tratamiento de lectura inválida;
- privacidad de imágenes;
- almacenamiento temporal;
- limpieza entre actores;
- fallback manual controlado.

Una lectura no ejecutará una mutación irreversible sin mostrar y validar la intención correspondiente.

---

#### 25. Básculas, sensores y medición

Toda medición declarará:

- unidad canónica;
- rango y resolución requeridos;
- precisión o tolerancia aprobada posteriormente;
- tara;
- estabilidad;
- calibración;
- sello temporal;
- actor y recurso;
- lectura cruda y valor normalizado cuando aplique;
- estados fuera de rango;
- intervención manual;
- evidencia y auditoría.

No se aceptará un valor sin conocer la fuente, unidad y estado de calibración aplicables.

---

#### 26. Terminales de pago

La estación tratará la terminal de pago como dependencia externa controlada.

Se separarán:

- intención de cobro;
- monto y moneda;
- referencia empresarial;
- transacción del proveedor;
- resultado mostrado;
- comprobante;
- conciliación;
- reversión;
- estado desconocido;
- custodia física del terminal.

La confirmación verbal o visual sin referencia conciliable no cerrará el proceso.

---

#### 27. Señalización y avisos

Luces, sonidos, pantallas auxiliares, campanas o vibración serán apoyos, no única fuente de información.

Cada aviso deberá:

- ser atribuible a un evento;
- evitar alarmas indistinguibles;
- tener alternativa visual o textual cuando aplique;
- respetar ruido y ambiente;
- permitir reconocimiento sin confirmar automáticamente el trabajo;
- evitar exposición de datos sensibles;
- registrar fallos cuando sea crítico.

---

#### 28. Consumibles y medios

Papel, etiquetas, tinta, cinta, baterías y otros consumibles declararán:

- tipo compatible;
- propietario de reposición;
- ubicación;
- nivel mínimo definido posteriormente;
- evidencia de agotamiento;
- sustitución segura;
- lote o trazabilidad cuando aplique;
- residuos y disposición;
- alternativa de contingencia.

La ausencia de consumible se tratará como indisponibilidad de capacidad, no como error del trabajador.

---

#### 29. Configuración y versionado

Toda configuración relevante conservará:

```text
configuration_id
configuration_version
endpoint_id
station_instance_id
capability_contract_version
firmware_or_driver_reference
applied_at
applied_by
change_record
validation_result
rollback_reference
```

Un cambio en driver, firmware, cola, red, montaje o configuración deberá pasar por `TI-DOM-009`, pruebas y rollback cuando pueda afectar procesos.

---

#### 30. Observabilidad y diagnóstico

Se observarán, cuando sean proporcionales:

- disponibilidad;
- estado de enlace;
- errores;
- latencia;
- colas;
- batería o energía;
- consumibles;
- temperatura o condición técnica disponible;
- versión;
- reinicios;
- comandos inciertos;
- mantenimiento próximo;
- drift de configuración.

La telemetría no incluirá secretos, imágenes, documentos o datos personales innecesarios. `NFR-REQ-009`, `TI-DOM-010` y `TI-AUTH-004` gobiernan la observabilidad y protección.

---

#### 31. Modelo de mantenimiento

El ciclo mínimo será:

```text
PLANIFICADO
→ RECIBIDO
→ COMISIONADO
→ EN SERVICIO
→ INSPECCIONADO
→ MANTENIMIENTO PREVENTIVO O CORRECTIVO
→ VALIDADO
→ REASIGNADO O RETIRADO
```

Cada actividad conservará activo, endpoint, estación, responsable, fecha, motivo, acciones, partes o consumibles, configuración afectada, prueba posterior, indisponibilidad, evidencia y siguiente fecha cuando aplique.

---

#### 32. Mantenimiento preventivo

La frecuencia no será universal. Se derivará de:

- criticidad del proceso;
- ambiente;
- intensidad de uso;
- recomendación técnica;
- historial de fallos;
- limpieza;
- calibración;
- consumibles;
- garantía;
- riesgo de seguridad;
- disponibilidad de sustituto.

`TI-DOM-003`, `TI-DOM-005` y NEXO materializarán planes concretos.

---

#### 33. Mantenimiento correctivo e incidentes

Un fallo producirá:

1. clasificación de impacto;
2. identificación de estación, endpoint y capacidad;
3. protección del trabajo en curso;
4. diagnóstico no destructivo;
5. fallback o sustitución;
6. reparación o cambio controlado;
7. prueba técnica;
8. validación funcional con el proceso;
9. conciliación de pendientes;
10. cierre con evidencia.

La mesa de servicio, incidentes y problemas corresponden a `TI-DOM-007` y `TI-DOM-008`.

---

#### 34. Repuestos, sustitutos y single points of failure

Todo paso crítico dependiente de un equipo físico declarará:

- si existe sustituto;
- ubicación y custodia;
- tiempo de activación objetivo definido posteriormente;
- compatibilidad;
- configuración recuperable;
- consumibles;
- entrenamiento requerido;
- fallback manual u offline;
- criterio de escalamiento.

Una capacidad crítica sin sustituto ni procedimiento alternativo generará brecha para `UX-STATION-007`, `NFR-REQ-001`, continuidad y E5.

---

#### 35. Comisión y aceptación de una instancia

Antes de usar una instancia deberán validarse:

- identidad y ubicación;
- perfil y configuración;
- montaje;
- energía y autonomía;
- conectividad primaria y secundaria cuando aplique;
- vinculación de periféricos;
- seguridad;
- limpieza;
- accesibilidad;
- salud;
- comando y resultado físico;
- fallback;
- recuperación tras reinicio;
- prueba con carga y ambiente reales.

La aceptación documental no sustituirá la prueba física de `UX-STATION-008`, `AUTH-DEV-014` a `AUTH-DEV-016`, readiness y piloto.

---

#### 36. Cambio, traslado y reasignación

Trasladar un equipo o estación podrá cambiar zona, red, riesgo, alcance, actor, montaje, energía y periféricos.

Todo traslado exigirá:

- autorización;
- cierre del uso anterior;
- custodia;
- actualización de inventario;
- nueva vinculación;
- inspección;
- prueba de conectividad y capacidad;
- limpieza de datos locales cuando corresponda;
- evidencia de entrada en servicio.

No se conservará silenciosamente una sede o área anterior.

---

#### 37. Retiro y disposición

El retiro deberá:

- bloquear nuevas asignaciones;
- cerrar trabajos y pendientes;
- revocar credenciales y certificados;
- retirar secretos;
- limpiar datos;
- desvincular periféricos y estaciones;
- conservar evidencia y configuración necesaria;
- gestionar garantía, devolución, repuesto o disposición;
- actualizar inventario y documentación;
- verificar que el proceso conserva alternativa.

---

#### 38. Responsabilidades documentales

| Decisión                                  | Tarea propietaria                             |
| ----------------------------------------- | --------------------------------------------- |
| perfiles e instancias                     | `UX-STATION-003`                              |
| actor y limpieza de sesión                | `UX-STATION-004`                              |
| superficie y estados                      | `UX-STATION-005`                              |
| capacidades físicas objetivo              | `UX-STATION-006`                              |
| degradación, fallback y recuperación      | `UX-STATION-007`                              |
| pruebas con trabajadores y equipos reales | `UX-STATION-008`                              |
| matriz final aprobada                     | `UX-STATION-009`                              |
| dispositivo compartido y autorización     | `AUTH-DEV-001` a `AUTH-DEV-016`               |
| activos y endpoints                       | `TI-DOM-002` y `TI-DOM-003`; NEXO             |
| red                                       | `TI-DOM-004`                                  |
| impresión y periféricos                   | `TI-DOM-005`; `PRINT-ARC-*`                   |
| incidentes y problemas                    | `TI-DOM-007` y `TI-DOM-008`                   |
| cambio tecnológico                        | `TI-DOM-009`                                  |
| observabilidad                            | `NFR-REQ-009`; `TI-DOM-010`; `TI-INT-001`     |
| recuperación                              | `NFR-REQ-010`; `TI-DOM-011`; continuidad      |
| compras, garantías y contratos            | ORIGO; `TI-DOM-012`                           |
| capacitación                              | `TI-DOM-013`; ANIMA                           |
| paquetes, pruebas y rollout               | E5; BLOQUE T; `SHELL-CI-020` a `SHELL-CI-024` |

---

#### 39. Matriz de cobertura de procesos

`UX-STATION-PROCESS-PHYSICAL-DEPENDENCY-MATRIX-001` cubrirá los 69 procesos y cada paso relevante con:

```text
process_id
step_id
station_profile
station_instance_class
physical_capabilities[]
peripheral_classes[]
mounting_profile
power_profile
connectivity_profile
maintenance_profile
criticality
single_point_of_failure
fallback
validation_questions[]
owner
status
```

Un proceso sin dependencia física deberá registrar `NO_PHYSICAL_DEPENDENCY` con justificación.

---

#### 40. Preguntas obligatorias para prototipo

`UX-STATION-008` deberá comprobar, según aplique:

- alcance y postura reales;
- lectura bajo iluminación real;
- uso con guantes, humedad o grasa;
- tiempo de conexión y reconexión;
- cambio de actor;
- uso simultáneo;
- papel, etiquetas y consumibles;
- agotamiento de batería;
- pérdida y retorno de energía;
- pérdida y retorno de red;
- atasco o error físico;
- equipo sustituto;
- limpieza;
- reinicio;
- comando incierto;
- accesibilidad;
- ruido y señalización;
- mantenimiento sin bloquear indebidamente el área.

---

#### 41. Escenarios mínimos de validación

1. periférico requerido ausente;
2. periférico desconocido detectado;
3. vinculación a estación incorrecta;
4. dos estaciones compiten por un equipo exclusivo;
5. comando aceptado sin resultado físico;
6. resultado físico producido sin receipt;
7. pérdida de energía durante operación;
8. reinicio con operación incierta;
9. batería insuficiente durante pico;
10. cargador o adaptador no autorizado;
11. Wi-Fi con roaming o zona muerta;
12. IP o nombre del endpoint cambia;
13. pérdida de red local con servicio externo disponible;
14. impresora sin papel o atascada;
15. reimpresión de documento sensible;
16. escaneo duplicado;
17. cámara sin permiso o con iluminación insuficiente;
18. báscula sin tara o calibración vigente;
19. terminal de pago con estado desconocido;
20. aviso audible no perceptible por ruido;
21. limpieza provoca reinicio o cambio de configuración;
22. cable o montaje crea riesgo físico;
23. periférico entra en mantenimiento durante operación;
24. traslado conserva contexto territorial anterior;
25. retiro deja credenciales o datos;
26. equipo sustituto no tiene configuración compatible;
27. consumible agotado sin alerta;
28. firmware o driver cambia sin validación;
29. telemetría expone datos sensibles;
30. proceso crítico carece de fallback.

---

#### 42. Brechas y excepciones

Toda brecha conservará:

```text
exception_id
process_id
step_id
station_or_peripheral
condition
risk
temporary_compensation
owner
resolution_task
activation_condition
evidence_required
expiry
status
```

Clasificación:

| Clase        | Ejemplo                                                        | Tratamiento               |
| ------------ | -------------------------------------------------------------- | ------------------------- |
| `PHY-GAP-P0` | riesgo de seguridad, fraude o resultado crítico no conciliable | bloquea aprobación        |
| `PHY-GAP-P1` | proceso crítico sin capacidad o fallback                       | bloquea piloto aplicable  |
| `PHY-GAP-P2` | degradación importante con compensación temporal               | carryover con vencimiento |
| `PHY-GAP-P3` | mejora no crítica                                              | planificación ordinaria   |

Ninguna excepción permanecerá como nota narrativa sin tarea exacta.

---

#### Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

**Rango incorporado:** `TREQ-PROC-741` a `TREQ-PROC-780`

Los requisitos protegen capacidad, vinculación, concurrencia, resultados físicos, montaje, ambiente, higiene, energía, conectividad, impresión, captura, medición, pagos, consumibles, configuración, observabilidad, mantenimiento, sustitución, comisión, traslado, retiro y cobertura de los 69 procesos.

---

#### 43. Criterios de aceptación

- [ ] Se separan capacidad, periférico, endpoint, host, estación, montaje, energía, conectividad y mantenimiento.
- [ ] Ninguna marca, modelo, compra o topología queda aprobada prematuramente.
- [ ] Cada capacidad tiene contrato, estados, resultado y fallback.
- [ ] Los periféricos desconocidos o no administrados no se adoptan automáticamente.
- [ ] La concurrencia y los comandos inciertos quedan controlados.
- [ ] Montaje, ambiente, higiene, accesibilidad y seguridad física están cubiertos.
- [ ] Energía, batería, pérdida y retorno están definidos sin inventar cifras.
- [ ] La conectividad no depende de una IP informal o red plana.
- [ ] Impresión, escaneo, medición, pago y señalización conservan correlación y evidencia.
- [ ] Configuración, firmware y drivers quedan sujetos a versionado y cambio controlado.
- [ ] Observabilidad respeta privacidad.
- [ ] Mantenimiento preventivo, correctivo, sustitución y retiro tienen ciclo completo.
- [ ] Los procesos críticos identifican single points of failure y alternativa.
- [ ] Los 69 procesos quedan cubiertos o justifican no dependencia física.
- [ ] Toda brecha tiene propietario, tarea y condición de cierre.
- [ ] `UX-STATION-007` permanece sin iniciar.
- [ ] No se ejecutaron cambios físicos o tecnológicos.

---

#### 44. Estado y continuidad

```text
UX-STATION-005 APROBADA
UX-STATION-006 APROBADA
UX-STATION-007 NO INICIADA
```

No se inicia `UX-STATION-007` hasta la aprobación expresa de esta tarea y una solicitud explícita de continuidad.


### ✅ UX-STATION-007 — Definir operación degradada, offline, contingencia y recuperación

**Estado:** APROBADA

**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal

**Marcador exacto que reemplaza:** `### [ ] UX-STATION-007 — Definir operación degradada, offline, contingencia y recuperación`

**Tarea anterior:** `UX-STATION-006 — Definir periféricos, montaje, alimentación, conectividad y mantenimiento` — APROBADA

**Siguiente tarea reservada:** `UX-STATION-010 — Definir gramática de interacción operativa de lectura mínima` — NO INICIADA

**Validación posterior reservada:** `UX-STATION-008 — Prototipar alternativas con trabajadores reales`; `UX-STATION-009 — Aprobar la matriz proceso → paso → estación → interacción → periférico`

**Artefactos producidos:**

- `UX-STATION-DEGRADED-OPERATION-CONTRACT-001`;
- `UX-STATION-CONTINGENCY-MODE-MATRIX-001`;
- `UX-STATION-OFFLINE-WORK-CONTRACT-001`;
- `UX-STATION-RECOVERY-RECONCILIATION-CONTRACT-001`;
- `UX-STATION-ROLE-RUNBOOK-CATALOG-001`;
- `UX-STATION-SUPPORT-ESCALATION-MODEL-001`;
- `UX-STATION-HUMAN-LOAD-GUARDRAILS-001`;
- `UX-STATION-CONTINGENCY-EXCEPTION-REGISTER-001`.

**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`

**Naturaleza:** contrato funcional y operativo de degradación, trabajo offline, contingencia, retorno, reincorporación y carga humana; no implementación de infraestructura, aplicación, soporte o continuidad productiva

**Cambios en código, migraciones, Supabase, aplicaciones, dispositivos, redes, procedimientos productivos o dotación:** no autorizados

---

#### 1. Propósito

Definir cómo debe continuar, limitarse, detenerse y recuperarse cada paso operativo cuando una estación, dispositivo, red, aplicación, periférico, proveedor o dependencia no está disponible o no puede demostrar un resultado confiable.

El diseño deberá permitir que personas excelentes en su labor, aunque no posean formación tecnológica especializada, puedan:

1. reconocer el estado real de la operación;
2. ejecutar únicamente las acciones simples y seguras que les corresponden;
3. conservar folios, evidencia, pendientes y custodia;
4. solicitar ayuda mediante un canal claro;
5. continuar con una alternativa aprobada cuando sea posible;
6. detenerse cuando continuar produciría fraude, pérdida, peligro o inconsistencia;
7. entregar el caso a soporte sin diagnosticar internamente sistemas complejos;
8. reincorporar el trabajo con guía y validación posterior.

```text
CONTINUIDAD OPERATIVA
≠
CONVERTIR A CADA TRABAJADOR EN TÉCNICO
```

```text
CONTROL SUFICIENTE
≠
SUPERVISIÓN HUMANA PERMANENTE
```

---

#### 2. Decisión sobre capacidad humana y dotación

Vento OS se diseñará bajo estas restricciones reales:

- no habrá un técnico dedicado por sede, estación, turno o periférico;
- no se exigirá contratar una persona distinta para vigilar cada control;
- una persona operativa no deberá interpretar logs, editar red, reinstalar drivers, manipular bases de datos ni decidir recuperaciones complejas;
- la mayoría de incidencias ordinarias deberá resolverse mediante autoservicio guiado, sustitución simple, reintento seguro o escalamiento;
- las tareas técnicas se concentrarán en un soporte central, responsable autorizado o proveedor cuando exista;
- los controles automáticos, alertas, bloqueos, trazabilidad y conciliación deberán reducir la necesidad de vigilancia manual;
- los responsables de sede o área no se convertirán en administradores técnicos por ocupar ese cargo;
- cuando un proceso requiera una actividad humana permanente, esa necesidad deberá derivarse del proceso empresarial real y no de una deficiencia del sistema.

Ningún diseño será aceptable si su operación normal requiere recordar reglas técnicas extensas, consultar múltiples documentos, llamar permanentemente a una persona experta o mantener vigilancia manual para evitar inconsistencias previsibles.

---

#### 3. Modelo mínimo de responsabilidades

| Nivel                       | Responsable habitual                                   | Puede hacer                                                                                                    | No deberá hacer                                                                                              |
| --------------------------- | ------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| `L0_OPERACION`              | trabajador del proceso                                 | reconocer estado, seguir checklist corto, proteger trabajo, registrar folio, usar sustituto aprobado, reportar | diagnosticar infraestructura, alterar configuración, restaurar datos o decidir excepciones críticas          |
| `L1_COORDINACION_LOCAL`     | encargado, supervisor o responsable de sede disponible | confirmar impacto, activar alternativa local autorizada, coordinar relevo y comunicación                       | administrar credenciales privilegiadas, ejecutar cambios técnicos o conciliar hechos complejos sin autoridad |
| `L2_SOPORTE_CENTRAL`        | responsable tecnológico o soporte designado            | diagnóstico técnico, recuperación estándar, coordinación con proveedor y verificación técnica                  | declarar por sí solo recuperado el proceso empresarial                                                       |
| `L3_ESPECIALISTA_PROVEEDOR` | proveedor o especialista convocado                     | intervención excepcional sobre equipo, red, servicio o plataforma                                              | modificar proceso, datos o autorización fuera del alcance aprobado                                           |
| `VALIDACION_FUNCIONAL`      | propietario o delegado del proceso                     | comprobar resultado empresarial y conciliación                                                                 | sustituir sin evidencia la validación técnica o contable aplicable                                           |

Una misma persona podrá asumir más de un nivel cuando esté autorizada y sea viable, pero el diseño no supondrá que cada nivel exige una contratación exclusiva.

---

#### 4. Principio de personal mínimo suficiente

Cada modo de contingencia deberá declarar:

```text
minimum_people_required
roles_or_capabilities_required
can_be_combined_by_one_person
separation_required
remote_support_allowed
provider_required
maximum_local_complexity
```

Reglas:

1. El número mínimo de personas se derivará del riesgo y la segregación necesaria, no del número de pantallas o dispositivos.
2. Un control de doble aprobación solo se exigirá cuando la regla empresarial o el riesgo lo justifique.
3. No se usará doble control para compensar interfaces confusas, ausencia de validaciones o trazabilidad deficiente.
4. Cuando una misma persona pueda operar y coordinar sin conflicto, el contrato podrá permitirlo.
5. Cuando la segregación sea obligatoria, podrá utilizarse aprobación remota si conserva identidad, contexto, evidencia y vigencia.
6. Todo requerimiento de presencia permanente tendrá justificación, duración, propietario y alternativa evaluada.

---

#### 5. Distinciones canónicas

| Concepto               | Definición                                                                                                         |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------ |
| operación normal       | todas las dependencias requeridas están disponibles y verificadas                                                  |
| degradación            | el proceso sigue activo con capacidades limitadas y controles compensatorios                                       |
| offline                | el cliente no puede alcanzar temporalmente la autoridad remota requerida, pero conserva un contrato local aprobado |
| contingencia           | procedimiento alternativo activado formalmente para producir el resultado mínimo empresarial                       |
| fallback               | capacidad sustituta concreta dentro de un modo normal o degradado                                                  |
| interrupción           | no puede producirse el resultado mínimo autorizado                                                                 |
| recuperación técnica   | restauración de componentes, conectividad o servicios                                                              |
| recuperación funcional | el proceso vuelve a producir resultados correctos                                                                  |
| reincorporación        | ingreso controlado de hechos, documentos o pendientes creados durante la falla                                     |
| conciliación           | comparación y resolución entre hechos físicos, manuales, locales, remotos y de proveedores                         |
| estado desconocido     | no existe evidencia suficiente para afirmar éxito o fracaso                                                        |
| procedimiento manual   | alternativa controlada; no equivale a improvisación ni eliminación de controles                                    |

---

#### 6. Estados de la estación

La estación deberá poder expresar al menos:

```text
NORMAL
DEGRADED_READ_ONLY
DEGRADED_LIMITED_WRITE
OFFLINE_CAPTURE
CONTINGENCY_MANUAL
WAITING_FOR_DEPENDENCY
RESULT_UNKNOWN
RECOVERY_IN_PROGRESS
RECONCILIATION_REQUIRED
BLOCKED_SAFETY
BLOCKED_AUTHORIZATION
BLOCKED_INTEGRITY
RETURNING_TO_NORMAL
NORMAL_VALIDATED
```

Cada estado declarará:

- condición de entrada;
- autoridad que puede activarlo;
- acciones permitidas y prohibidas;
- datos o recursos visibles;
- evidencia obligatoria;
- límites temporales y cuantitativos cuando correspondan;
- canal de ayuda;
- condición de salida;
- tratamiento de pendientes;
- validación técnica y funcional requerida.

---

#### 7. Selección del modo permitido

El modo no se inferirá únicamente de que la red parezca desconectada o de que una petición falle.

La resolución considerará:

- proceso y paso;
- criticidad;
- resultado mínimo empresarial;
- actor efectivo y autorización vigente;
- estación y capacidades confiables;
- estado de red, backend, proveedor y periférico;
- frescura de contexto y catálogos;
- riesgo de duplicación;
- posibilidad de conciliación;
- disponibilidad de formularios, folios o sustitutos;
- duración estimada y duración real;
- existencia de soporte remoto;
- estado de incidentes o contingencia declarada.

---

#### 8. Regla de seguridad y detención

La degradación no autoriza a omitir:

- identidad del actor cuando sea exigible;
- segregación crítica;
- límites de dispositivo;
- integridad de cantidades, pagos o inventario;
- trazabilidad mínima;
- privacidad;
- seguridad alimentaria, laboral o física;
- protección contra doble ejecución;
- custodia de efectivo, documentos, productos o evidencia.

Cuando estos controles no puedan conservarse, el paso deberá quedar bloqueado y ofrecer una instrucción concreta de escalamiento o una alternativa aprobada.

---

#### 9. Resultado empresarial mínimo

Cada proceso definirá:

```text
minimum_business_outcome
minimum_information_required
minimum_controls_required
maximum_safe_degradation
manual_or_offline_alternative
stop_condition
recovery_owner
business_validation_owner
```

Una estación técnicamente encendida no se considerará operativa si el proceso no puede producir su resultado mínimo con evidencia y control suficientes.

---

#### 10. Modalidades de degradación

| Modalidad                  | Uso permitido                                                 | Prohibición principal                               |
| -------------------------- | ------------------------------------------------------------- | --------------------------------------------------- |
| solo lectura               | consulta segura de información suficientemente fresca         | presentar información obsoleta como vigente         |
| escritura limitada         | acciones acotadas, reversibles o conciliables                 | ejecutar mutaciones críticas no reconciliables      |
| captura offline            | registrar intención y evidencia para sincronización posterior | fingir confirmación remota o éxito definitivo       |
| sustitución de dispositivo | continuar en endpoint aprobado alterno                        | heredar sesión, actor o contexto residual           |
| sustitución de periférico  | usar capacidad equivalente validada                           | adoptar equipo desconocido o incompatible           |
| procedimiento manual       | producir resultado mínimo con folio y custodia                | operar sin numeración, propietario o reconciliación |
| espera controlada          | conservar trabajo hasta recuperar dependencia                 | repetir ciegamente acciones de resultado incierto   |
| cierre temporal            | detener paso o proceso de forma explícita                     | mantener cola invisible o trabajo sin responsable   |

---

#### 11. Contrato de trabajo offline

Toda operación offline deberá conservar como mínimo:

```text
offline_operation_id
process_id
step_id
resource_reference
actor_id
actor_session_id
station_id
device_id
site_id
area_id
zone_id
captured_at_device
captured_at_monotonic_reference
context_version
authorization_basis
payload_hash
idempotency_key
sequence_or_folio
sync_status
conflict_status
expiry
```

No se utilizará una cola local genérica que pierda actor, contexto, orden, dependencia o motivo.

---

#### 12. Autorización offline

La operación offline solo se permitirá cuando exista una política aprobada que defina:

- acciones autorizables sin consulta inmediata;
- credencial, contexto o autorización local verificable;
- antigüedad máxima admisible;
- límites por cantidad, valor, proceso o duración;
- denegaciones que continúan vigentes;
- tratamiento de revocación conocida o posterior;
- información que puede almacenarse localmente;
- cifrado y protección del dispositivo;
- salida segura cuando el contexto expire.

Una sesión técnica persistida no equivaldrá a autorización offline ilimitada.

---

#### 13. Folios y formularios manuales

Todo procedimiento manual que produzca hechos empresariales utilizará, cuando corresponda:

- identificador o folio único;
- versión del formulario;
- fecha y hora observada;
- actor y responsable;
- sede, área y zona;
- recurso o transacción relacionada;
- cantidades, unidades y motivo;
- firmas o confirmaciones necesarias;
- anexos o evidencia permitidos;
- estado de reincorporación;
- referencia a corrección, cancelación o reemplazo.

El papel, archivo local o formulario alterno no será una fuente de verdad permanente por defecto.

---

#### 14. Instrucciones de operación para personal no técnico

Cada contingencia deberá producir una tarjeta operativa breve con esta forma:

```text
QUÉ PASÓ
QUÉ PUEDO SEGUIR HACIENDO
QUÉ NO DEBO HACER
PASOS 1 A N
QUÉ DEBO REGISTRAR
A QUIÉN DEBO AVISAR
CUÁNDO DEBO DETENERME
CÓMO SÉ QUE TERMINÉ
```

Restricciones:

- máximo una decisión principal por paso;
- lenguaje del trabajo real, no terminología de infraestructura;
- ayudas visuales cuando aporten claridad;
- identificación por estación, proceso y modalidad;
- versión y fecha visibles;
- disponibilidad sin depender exclusivamente del sistema afectado;
- no exponer secretos, redes, credenciales ni procedimientos privilegiados;
- instrucciones practicables con guantes, ruido, presión y movilidad cuando aplique.

---

#### 15. Diseño de autoservicio guiado

La estación podrá ofrecer diagnósticos simples como:

- verificar energía visible;
- confirmar cable o enlace accesible sin desmontaje;
- seleccionar periférico sustituto aprobado;
- reiniciar una aplicación mediante acción controlada;
- cambiar a captura manual aprobada;
- generar folio de incidente;
- adjuntar código de error no sensible;
- probar una función de diagnóstico segura;
- solicitar soporte remoto.

No ofrecerá al trabajador ordinario:

- terminal de sistema;
- edición de IP, DNS, firewall o routing;
- instalación de drivers o firmware;
- credenciales administrativas;
- restauración de base de datos;
- eliminación manual de colas o registros;
- reejecución forzada de pagos, movimientos o impresiones inciertas.

---

#### 16. Escalamiento operativo y técnico

Cada incidente deberá responder:

```text
what_failed
business_impact
safe_actions_taken
work_preserved
pending_count
unknown_results
local_contact
remote_contact
provider_contact
next_update_due
escalation_level
```

El escalamiento no exigirá que el trabajador determine la causa raíz. Bastará con describir síntomas, impacto y evidencia segura.

---

#### 17. Comunicación y coordinación

La comunicación deberá indicar:

- proceso y sede afectados;
- modalidad activa;
- acciones permitidas;
- acciones detenidas;
- responsable coordinador;
- canal de actualización;
- hora de próxima revisión;
- tratamiento de clientes, proveedores o áreas dependientes;
- instrucción de retorno.

No se dependerá exclusivamente de grupos informales, mensajes verbales o una persona que recuerde avisar a todos.

---

#### 18. Pérdida de conectividad

La estación distinguirá, cuando sea posible:

- sin conectividad local;
- red local disponible sin salida;
- DNS o resolución fallida;
- backend no alcanzable;
- autenticación no alcanzable;
- proveedor externo no alcanzable;
- latencia o pérdida intermitente;
- portal cautivo;
- reloj o certificado incompatible.

El trabajador recibirá una instrucción operativa, no un diagnóstico técnico exhaustivo.

---

#### 19. Pérdida de energía

El contrato cubrirá:

1. aviso o detección de energía inestable cuando exista;
2. protección del trabajo en curso;
3. transición a batería, respaldo o procedimiento manual;
4. apagado seguro cuando corresponda;
5. custodia de efectivo, producto, documentos y equipos;
6. reinicio controlado;
7. verificación de reloj, red, periféricos, colas y actor;
8. reconciliación de trabajos interrumpidos.

---

#### 20. Falla de dispositivo o aplicación

No se asumirá que reiniciar resuelve todo.

Antes de repetir una acción se comprobará:

- si el comando pudo llegar al servidor o periférico;
- si existe `idempotency_key`;
- si hay resultado remoto o físico;
- si quedó un borrador o pendiente local;
- si el actor sigue vigente;
- si el recurso cambió durante la falla;
- si existe sustituto aprobado.

---

#### 21. Falla de periférico

Para impresión, escaneo, medición, cámara, pago o señalización se definirá:

- capacidad mínima sustituta;
- prueba segura de salud;
- resultado desconocido;
- cambio de equipo;
- consumibles;
- custodia de trabajos pendientes;
- reintento idempotente;
- validación física y empresarial.

Una impresora que no produjo papel, un datáfono sin referencia conciliable o una báscula sin estabilidad no se marcarán automáticamente como operación fallida o exitosa.

---

#### 22. Proveedor externo no disponible

Cuando falle un proveedor se definirá:

- alternativa de proveedor o canal;
- operación diferida;
- procedimiento manual;
- límites y aprobación;
- comunicaciones externas;
- evidencia de solicitudes y respuestas;
- conciliación al recuperar;
- protección contra duplicación entre proveedor principal y alterno.

---

#### 23. Trabajo pendiente y resultado desconocido

Cada pendiente deberá estar en uno de estos estados:

```text
DRAFT
CAPTURED_LOCAL
QUEUED
SENT_UNCONFIRMED
ACCEPTED_REMOTE
COMPLETED
FAILED_SAFE_TO_RETRY
FAILED_REVIEW_REQUIRED
RESULT_UNKNOWN
CONFLICT
CANCELLED
RECONCILED
```

`RESULT_UNKNOWN` bloqueará el reintento automático cuando exista riesgo de doble cobro, doble movimiento, doble documento, doble impresión sensible o doble notificación con efecto empresarial.

---

#### 24. Orden, dependencia e idempotencia

La recuperación conservará:

- orden entre pasos dependientes;
- referencias a hechos previos;
- idempotencia;
- versión de contrato;
- actor original;
- autorizaciones adicionales;
- lotes y unidades;
- eventos o documentos resultantes;
- efectos externos.

No se sincronizarán ciegamente pendientes por orden de llegada si el proceso exige otra secuencia.

---

#### 25. Cambio de actor, relevo y turno

Los pendientes no pasarán silenciosamente al siguiente trabajador.

El relevo deberá mostrar:

- trabajo abierto;
- operaciones offline;
- resultados desconocidos;
- formularios manuales;
- recursos bajo custodia;
- incidentes activos;
- acciones permitidas al receptor;
- elementos que requieren cierre del actor original o aprobación adicional.

---

#### 26. Privacidad y almacenamiento local

El modo offline o degradado aplicará:

- minimización de datos;
- cifrado cuando corresponda;
- aislamiento por actor y estación;
- masking;
- expiración;
- limpieza después de sincronizar o cerrar;
- bloqueo por inactividad;
- prevención de backups o capturas no autorizadas;
- tratamiento seguro de pérdida o retiro del dispositivo.

---

#### 27. Recuperación técnica frente a recuperación funcional

```text
SERVICIO RESPONDE
≠
PROCESO RECUPERADO
```

El retorno requerirá:

1. salud técnica suficiente;
2. contratos y versiones compatibles;
3. contexto y autorización vigentes;
4. periféricos vinculados;
5. pendientes identificados;
6. sincronización controlada;
7. conflictos resueltos;
8. conciliación completada;
9. validación del resultado empresarial;
10. comunicación de retorno normal.

---

#### 28. Secuencia de retorno

La recuperación seguirá dependencias explícitas, por ejemplo:

```text
IDENTIDAD Y AUTORIZACIÓN
→ CONTEXTO ORGANIZACIONAL Y OPERATIVO
→ FUENTES DE VERDAD
→ INTEGRACIONES Y PROVEEDORES
→ ESTACIONES Y PERIFÉRICOS
→ COLAS Y PENDIENTES
→ REINCORPORACIÓN
→ CONCILIACIÓN
→ VALIDACIÓN FUNCIONAL
→ OPERACIÓN NORMAL
```

La secuencia concreta se definirá por proceso; este ejemplo no impone una topología universal.

---

#### 29. Reincorporación del trabajo manual u offline

La reincorporación deberá:

- inventariar folios y operaciones;
- verificar integridad y custodia;
- detectar duplicados;
- validar actor y autoridad aplicable;
- resolver referencias faltantes;
- aplicar en orden;
- conservar origen manual u offline;
- registrar correcciones;
- producir comprobante de incorporación;
- permitir conciliación independiente.

No se transcribirá información sin vincularla al folio y al hecho original.

---

#### 30. Conflictos

Se clasificarán al menos:

- mismo recurso modificado online y offline;
- cantidad o estado incompatibles;
- actor revocado después de capturar;
- catálogo o precio cambiado;
- lote, ubicación o unidad inexistente;
- pago ya procesado;
- documento ya emitido;
- acción cancelada durante la falla;
- dependencia posterior ejecutada primero;
- evidencia manual incompleta.

Cada clase tendrá resolución automática segura, revisión humana o bloqueo. No se usará `last write wins` como regla universal.

---

#### 31. Observabilidad sin vigilancia permanente

El sistema deberá detectar y agrupar:

- estaciones offline;
- colas envejecidas;
- pendientes sin propietario;
- resultados desconocidos;
- errores repetidos;
- sincronización detenida;
- almacenamiento local cercano al límite;
- batería o energía crítica cuando exista telemetría;
- periféricos indisponibles;
- versiones incompatibles;
- incidentes sin actualización.

Las alertas se dirigirán al responsable adecuado y deberán evitar ruido masivo. La observabilidad reemplazará vigilancia humana continua, no la multiplicará.

---

#### 32. Guías, base de conocimiento y capacitación

La guía operativa completa se materializará posteriormente mediante responsabilidades exactas:

| Necesidad                                                                | Tarea propietaria |
| ------------------------------------------------------------------------ | ----------------- |
| reglas de degradación, offline, contingencia y retorno por estación      | `UX-STATION-007`  |
| prueba de comprensión y ejecución con trabajadores reales                | `UX-STATION-008`  |
| aprobación de matriz final por proceso y paso                            | `UX-STATION-009`  |
| runbooks y checklists simples por rol, proceso, sede y modalidad         | `CONT-UX-003`     |
| captura durante falla y reincorporación                                  | `CONT-UX-004`     |
| comunicaciones y escalamiento                                            | `CONT-UX-006`     |
| base de conocimiento, capacitación, adopción y comunicación tecnológica  | `TI-DOM-013`      |
| diagnóstico guiado sin saturación técnica                                | `TI-UX-006`       |
| planificación obligatoria de capacitación y soporte antes de implementar | `E5-GATE-006`     |

Por tanto, esta tarea no deja la guía como expectativa narrativa: define sus contenidos mínimos y asigna su materialización, validación y puerta de implementación.

---

#### 33. Capacitación mínima

La capacitación no será un curso técnico general.

Se organizará por:

- rol real;
- estación;
- proceso y paso;
- modalidad normal y degradada;
- acción crítica;
- incidente más probable;
- sustituto disponible;
- criterio de detención;
- escalamiento.

La evidencia podrá consistir en demostración práctica breve, simulación, checklist ejecutado y corrección de errores. No se exigirá memorizar manuales extensos.

---

#### 34. Walkthroughs y ejercicios

Los ejercicios incluirán, según riesgo:

- pérdida de red;
- pérdida de energía;
- falla de aplicación;
- falla de impresora o escáner;
- sustitución de dispositivo;
- captura manual;
- resultado desconocido;
- cambio de actor con pendientes;
- sincronización y conflicto;
- retorno al servicio normal.

El ejercicio evaluará tanto el sistema como la carga cognitiva y la necesidad real de apoyo humano.

---

#### 35. Presupuesto de complejidad humana

Cada procedimiento tendrá límites verificables:

```text
maximum_local_steps
maximum_decisions_without_help
maximum_documents_to_consult
maximum_manual_reentry
maximum_open_pendings_per_operator
expected_training_level
remote_assistance_available
```

No se fijan cifras universales en esta tarea. `UX-STATION-008` deberá observar y medir si la ejecución es viable para trabajadores reales.

Una alternativa que solo funciona con conocimiento técnico no documentado, memoria excepcional o asistencia constante se considerará fallida.

---

#### 36. Automatización y control

Para reducir carga humana se priorizarán:

- detección automática de estado;
- bloqueo de acciones incompatibles;
- folios e identificadores generados;
- conservación automática de contexto;
- reintentos idempotentes;
- agrupación de alertas;
- diagnóstico guiado;
- evidencia capturada por el sistema;
- conciliación asistida;
- checklist contextual;
- comunicación dirigida;
- expiración y limpieza automáticas.

La automatización no ocultará decisiones sensibles ni ejecutará reintentos peligrosos sin evidencia.

---

#### 37. Excepciones y soporte extraordinario

Toda excepción que requiera soporte adicional conservará:

```text
exception_id
process_id
station_id
failure_mode
business_impact
additional_people_required
specialist_required
reason
temporary_control
owner
resolution_task
expiry
validation
status
```

Si una contingencia requiere temporalmente más personas, deberá declararse como condición excepcional, no convertirse silenciosamente en la dotación normal.

---

#### 38. Matriz por proceso y paso

Cada uno de los 69 procesos deberá declarar por paso:

```text
process_id
step_id
minimum_business_outcome
normal_mode
degraded_modes[]
offline_allowed
manual_allowed
stop_conditions[]
minimum_people_required
segregation_required
local_actions[]
forbidden_local_actions[]
support_level
escalation_path
pending_contract
recovery_order
reconciliation_owner
business_validation_owner
runbook_owner
training_owner
prototype_questions[]
```

No bastará indicar que “el proceso funciona offline”.

---

#### 39. Relación con continuidad empresarial

Esta tarea diseña el comportamiento objetivo de las estaciones. El Bloque AC deberá convertirlo posteriormente en gobierno permanente de continuidad, operación mínima, estrategias manuales y offline, evidencia, reincorporación, runbooks, ejercicios y mejora.

La continuidad no será responsabilidad exclusiva de tecnología: los dominios propietarios conservan sus procesos, alternativas y validación empresarial; tecnología recupera componentes; continuidad coordina el conjunto.

---

#### 40. Relación con soporte tecnológico

El Bloque Z deberá desarrollar posteriormente:

- modelo de atención y SLA;
- incidentes y escalamiento;
- monitoreo;
- recuperación técnica;
- base de conocimiento;
- capacitación contextual;
- diagnóstico guiado;
- coordinación con proveedores.

Esto permite centralizar conocimiento técnico sin exigir personal especializado en cada sede.

---

#### 41. Escenarios mínimos de validación

1. trabajador sin conocimiento técnico identifica modo degradado;
2. guía indica qué continuar y qué detener;
3. red intermitente no duplica operaciones;
4. backend no disponible activa captura permitida;
5. autorización local expira;
6. actor cambia con pendientes;
7. dispositivo se reinicia con cola local;
8. almacenamiento local está lleno;
9. reloj del dispositivo es incorrecto;
10. energía se pierde durante una captura;
11. impresora produce resultado incierto;
12. datáfono procesa pero la aplicación no recibe confirmación;
13. báscula pierde calibración;
14. dispositivo sustituto conserva limpieza y contexto correcto;
15. formulario manual recibe folio;
16. folio duplicado se detecta;
17. operación online conflictúa con operación offline;
18. trabajador revocado había capturado una intención;
19. cola envejece y escala automáticamente;
20. soporte remoto resuelve sin compartir credenciales;
21. responsable local activa alternativa sin privilegio técnico;
22. proveedor externo no responde;
23. retorno técnico ocurre antes de conciliación;
24. recuperación funcional detecta datos faltantes;
25. reincorporación preserva origen y actor;
26. guía es accesible con guantes, ruido o presión;
27. alerta agrupada evita vigilancia permanente;
28. procedimiento excede complejidad viable y se rechaza;
29. contingencia exige segregación real;
30. modo normal solo se declara después de validación empresarial.

---

#### 42. Brechas y clasificación

| Clase        | Condición                                                                                            | Tratamiento                          |
| ------------ | ---------------------------------------------------------------------------------------------------- | ------------------------------------ |
| `OPS-GAP-P0` | riesgo de seguridad, fraude, pago, inventario, alimento, integridad o hecho irreversible sin control | bloquea modalidad                    |
| `OPS-GAP-P1` | proceso crítico sin resultado mínimo, fallback, guía o escalamiento                                  | bloquea prototipo o piloto aplicable |
| `OPS-GAP-P2` | procedimiento viable con compensación temporal y vencimiento                                         | carryover controlado                 |
| `OPS-GAP-P3` | mejora no crítica de claridad o eficiencia                                                           | planificación ordinaria              |

Toda brecha tendrá tarea exacta, responsable, evidencia, vencimiento y puerta de cierre.

---

#### Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

**Rango incorporado:** `TREQ-PROC-781` a `TREQ-PROC-820`

Los requisitos protegen estados degradados, continuidad con personal mínimo, límites de actuación local, escalamiento, trabajo offline, folios, autorización, pendientes, resultados desconocidos, idempotencia, fallas de red, energía, dispositivos y periféricos, relevo, privacidad, recuperación, reincorporación, conflictos, observabilidad, guías simples, capacitación, ejercicios y cobertura de los 69 procesos.

---

#### 43. Criterios de aceptación

- [ ] Se distingue operación normal, degradada, offline, contingencia, interrupción, recuperación y reincorporación.
- [ ] Ninguna modalidad depende de técnicos permanentes en cada sede.
- [ ] El modelo define personal mínimo y permite combinar responsabilidades cuando no existe conflicto.
- [ ] Los trabajadores ordinarios reciben acciones simples y límites explícitos.
- [ ] Los diagnósticos y cambios técnicos permanecen centralizados o escalados.
- [ ] Cada estado declara entrada, acciones, evidencia, salida y pendientes.
- [ ] La autorización offline tiene límites y no equivale a sesión ilimitada.
- [ ] Los procedimientos manuales conservan folio, custodia y conciliación.
- [ ] Los resultados desconocidos no se reintentan ciegamente.
- [ ] Los pendientes conservan actor, contexto, orden e idempotencia.
- [ ] Red, energía, dispositivo, periférico y proveedor tienen tratamiento diferenciado.
- [ ] El cambio de actor no hereda trabajo silenciosamente.
- [ ] Recuperación técnica y funcional permanecen separadas.
- [ ] La reincorporación y conciliación están definidas.
- [ ] Observabilidad sustituye vigilancia permanente y evita ruido.
- [ ] Las guías simples quedan asignadas a tareas exactas.
- [ ] Capacitación y soporte serán obligatorios antes de implementación.
- [ ] Los ejercicios medirán carga cognitiva y necesidad real de personal.
- [ ] Los 69 procesos quedan cubiertos por paso.
- [ ] Toda excepción de personal adicional es temporal, justificada y trazable.
- [ ] `UX-STATION-010` permanece sin iniciar.
- [ ] No se activó ningún procedimiento productivo ni se modificó dotación.

---

#### 44. Estado y continuidad

```text
UX-STATION-006 APROBADA
UX-STATION-007 APROBADA
UX-STATION-010 NO INICIADA
```

`UX-STATION-008` y `UX-STATION-009` permanecen reservadas para el prototipo y la aprobación posteriores al diseño de `UX-STATION-010` a `UX-STATION-012`.

No se inicia `UX-STATION-010` hasta la aprobación expresa de esta tarea y una solicitud explícita de continuidad.
